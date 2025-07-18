process REPLACE_PL {
    tag "$meta.id"
    label 'process_high'

    container "quay.io/fedora/python-312:312"

    input:
    tuple val(meta), path(vcf)
    path(replace_pl)

    output:
    tuple val(meta), path("*_remap_reheadered.g.vcf"), emit: vcf

    when:
    task.ext.when == null || task.ext.when

    script:
    """
    gunzip ${vcf}
    python3 ${replace_pl} ${meta.id}

    """
}
