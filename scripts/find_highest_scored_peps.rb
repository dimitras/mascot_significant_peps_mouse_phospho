# ruby find_highest_scored_peps.rb ../results/highest_scored_peps.csv

require 'csv_parser_for_protein_hits'

# input files
# csvp = CSVParserForProteinHits.open("../data/F003913.csv", 100)
# csvp = CSVParserForProteinHits.open("../../3rd-search/data/F003914.csv", 100)
csvp = CSVParserForProteinHits.open("../../1st-search/data/F003910.csv", 100)
modification = "Phospho"

# output files
high_scored_peps_ofile = ARGV[0]
# initialize arguments
high_scored_peps_out = File.open(high_scored_peps_ofile, "w")

# create the ofile with the highest-scored peptide hits with phospho or non-phospho modification
high_scored_peps_out.puts "prot_hit_num, prot_acc, prot_desc, prot_score, prot_mass, prot_matches, prot_matches_sig, prot_sequences, prot_sequences_sig, pep_query, pep_rank, pep_isbold, pep_isunique, pep_exp_mz, pep_exp_mr, pep_exp_z, pep_calc_mr, pep_delta, pep_miss, pep_score, pep_expect, pep_res_before, pep_seq, pep_res_after, pep_var_mod, pep_var_mod_pos, pep_scan_title"

# keep the highest scored hit of each peptide with and without modification
# highest_scored_peps = Hash.new {|h,k| h[k] = [] }
csvp.each_peptide do |peptide|
	if csvp.highest_scored_hit_for_mod_pep(peptide, modification)
		highest_scored_hit_with_mod = csvp.highest_scored_hit_for_mod_pep(peptide, modification)
		# highest_scored_peps[peptide] << highest_scored_hit_with_mod
		high_scored_peps_out.puts highest_scored_hit_with_mod.to_csv
	end
	if csvp.highest_scored_hit_for_non_mod_pep(peptide, modification)
		highest_scored_hit_without_mod = csvp.highest_scored_hit_for_non_mod_pep(peptide, modification)
		# highest_scored_peps[peptide] << highest_scored_hit_without_mod
		high_scored_peps_out.puts highest_scored_hit_without_mod.to_csv
	end	
end
high_scored_peps_out.close
