process SUMMARY_FINAL {

    label 'process_single'
    container 'quay.io/fedora/python-312:312'

    input:
    path(summary_tsv_files)

    output:
    path "summary*.tsv", emit: summary

    when:
    task.ext.when == null || task.ext.when

    script:
    """
    # Define the output summary file in the current work dir
    summary_file="summary_final.tsv"

    # Write the header
    echo -e "sample\traw_reads_r1\traw_reads_r1_avg_len\traw_reads_r2\traw_reads_r2_avg_len\thuman_removed\ttrim_reads_r1\ttrim_reads_r1_avg_len\ttrim_reads_r2\ttrim_reads_r2_avg_len\tquality_trimmed\tmapped_genomic_reads\tmapped_merged_reads\tmapped_deduped_reads\tmapped_final_reads\tmean_insert_final\tmean_coverage\tpercent_cov_gte5" > \$summary_file

    # Append all input summary TSVs, skipping duplicate headers
    awk '(NR == 2) || (FNR > 1)' *.summary.tsv >> \$summary_file
    """

}