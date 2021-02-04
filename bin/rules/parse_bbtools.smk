#############################################################################
##### Scaffold analyses: QUAST, CheckM, picard, bbmap and QC-metrics    #####
#############################################################################

rule parse_bbtools:
    input:
        expand(str(OUT / "bbtools_scaffolds/per_sample/{sample}_perMinLenFiltScaffold.tsv"), sample=SAMPLES),
    output:
        str(OUT / "bbtools_scaffolds/bbtools_combined/bbtools_scaffolds.tsv"),
    threads: config["threads"]["parsing"]
    resources: mem_mb=config["mem_mb"]["parsing"]
    log:
        str(OUT / "log/contigs_metrics/pileup_contig_metrics_combined.log")
    script:
        "../parse_bbtools.py"

