process SUMMARY_FINAL {

    label 'process_single'
    container 'quay.io/fedora/python-312:312'

    input:
    path(summary_tsv_files)
    tuple val(meta), path(nocall_file)
    path(calculate_no_call_stats)


    output:
    path "summary*.tsv", emit: summary
    path "nocall_summary.tsv", emit: nocall_summary

    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: ''
    //def summary_file_name = is_failed_summary ? "summary_failed.tsv" : "summary.tsv"
    def summary_file_name = "summary_final.tsv"

    """
    echo "sample\traw_reads_r1\traw_reads_r1_avg_len\traw_reads_r2\traw_reads_r2_avg_len\thuman_removed\ttrim_reads_r1\ttrim_reads_r1_avg_len\ttrim_reads_r2\ttrim_reads_r2_avg_len\tquality_trimmed\tmapped_genomic_reads\tmapped_merged_reads\tmapped_deduped_reads\tmapped_final_reads\tmean_insert_final\tmean_coverage\tpercent_cov_gte5" > $summary_file_name
    awk '(NR == 2) || (FNR > 1)' *.summary.tsv >> $summary_file_name
    python3 ${calculate_no_call_stats}

    """
}