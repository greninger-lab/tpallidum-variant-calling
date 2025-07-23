# tpallidum-variant-calling

##### Input sample_fastqs.csv example format:
---------
    sample,fastq_1,fastq_2
    SAMPLE1,/PATH/TO/SAMPLE1_R1.fastq.gz,/PATH/TO/SAMPLE1_R2.fastq.gz
    SAMPLE2,/PATH/TO/SAMPLE2_R1.fastq.gz,/PATH/TO/SAMPLE2_R2.fastq.gz
---------

# Running tpallidum-variant-calling

    nextflow run greninger-lab/tpallidum-variant-calling -r main -latest --input <sample_fastqs.csv> --outdir ./out --ref NC_021508 --kraken_host_db 'path/to/Kraken2_human/k2_human/' --kraken_standard_db 'path/to/Kraken2_standard_16GB/k2_standard_16gb_20240904/' --ivar -profile docker
## Command line options
| option | description | 
|--------|-------------|
| `--input  /path/to/your/sample_fastqs.csv` | (required) path to a csv sample,fastq_1,fastq_2 input file |
| `--outdir /path/to/output`                | (required) output directory |
| `--ref <string>`        | (required) Currently supported references are either NC_021508 or NC_016842 | 
| `--kraken_host_db <path>`        | (required) path to Kraken2 human host DB |
| `--kraken_standard_db <path>`        | (required) path to Kraken2_standard_16GB DB |
| `--ivar`        | (optional) run iVar variant calling |
| `-profile docker`                         | (required) |
| `-c /path/to/your/custom.config`          | (optional) used specify a custom configuration file (see [Nextflow docs](https://www.nextflow.io/docs/latest/config.html)) |

