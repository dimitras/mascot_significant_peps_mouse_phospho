# get a non redundant list with phospho peptide score over 25



# steps #
raw files
convert raw to mgf with MSconvert
run search in mascot daemon
export csv with 'Ions score cut-off' = 25
filter the csv


# filters #

-keep the highest scored peptide with phospho mod
-also keep the highest scored peptide without phospho mod

-number of phospho peptides
-number of non-phospho peptides
