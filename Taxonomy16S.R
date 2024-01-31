library(dada2)
library(seqinr)

#sets input fasta file name - change this to your file's name
InputFile16S="test16S.fasta"

#sets output taxonomy table file name - make this whatever is convenient.
#If you don't change this, it may overwrite past files
OutputFile16S="Taxonomy16S.csv"

#reads input file
seqs16S=seqinr::read.fasta(InputFile16S)

#assigns taxonomy using SILVA database and dada2 classifier
Tax16S=assignTaxonomy(InputFile16S, "silva_nr99_v138.1_train_set.fa.gz")

#adds a column to dataframe with sequence header
Tax16S=cbind(SequenceID=names(seqs16S), Tax16S)

#writes file as a csv
write.csv(Tax16S, OutputFile16S, row.names = FALSE)
