library(dada2)
library(seqinr)

#sets input fasta file name - change this to your file's name
InputFileITS="testITS.fasta"

#sets output taxonomy table file name - make this whatever is convenient.
#If you don't change this, it may overwrite past files
OutputFileITS="TaxonomyITS.csv"

#reads input file
seqsITS=seqinr::read.fasta(InputFileITS)

#assigns taxonomy using UNITE database and dada2 classifier
TaxITS=assignTaxonomy(InputFileITS, "sh_general_release_dynamic_18.07.2023.fasta")

#adds a column to dataframe with sequence header
TaxITS=cbind(SequenceID=names(seqsITS), TaxITS)

#writes file as a csv
write.csv(TaxITS, OutputFileITS, row.names = FALSE)
