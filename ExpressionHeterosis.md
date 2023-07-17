## Visualizing protein and mRNA expression patterns in hybrids

**Project description:** Heterosis, or hybrid vigor, refers to the superior performance of F1 hybrids relative to their inbred parents. The agriculture industry has utilized this phenomenon in both crop and livestock breeding for centuries, despite the additional time and labor required for hybrid breeding programs. The molecular underpinnings of heterosis have persisted as an unsolved classical problem in biology since its initial report by Charles Darwin. Studies have found few instances of gene expression outside mid-parental range in hybrids, providing little explanation for the disparity in phenotype. We employed both transcriptomics and proteomics using multiplexed tandem mass tag labeling to compare expression levels in maize hybrids to that of their inbred parents.

**Results:** I found that the abundance of plastid protein complexes, consisting of subunits encoded by both the nucleus and the plastid, are elevated in hybrids relative to mid-parent levels, which may account for the greater photosynthetic capacity of hybrids. This pattern was not reflected in their transcriptomes. Additionally, ethylene biosynthesis enzymes were significantly down-regulated in the hybrid at both the protein and RNA level; Reduced basal stress responses may contribute to increased growth.

[Click here to view the shiny app I developed to visualize expression heterosis of your gene of interest!](https://devonbirdseye.shinyapps.io/ExpressionViewer/)

<img src="images/tmt.6H.plastid.jpg?raw=true"/>

**Figure 1.** Expression heterosis (hybrid/mid-parent) in the proteome of six maize hybrid seedling leaves. The x-axes show that protein levels of Photosynthesis-Associated Nuclear Genes (PhANGs), Photosynthesis-Associated Plastid Genes (PhAPGs), Nuclear-Encoded (NE) plastid ribosomes and Plastid-Encoded (PE) plastid ribosomes are consistently expressed above mid-parent levels in hybrids. The y-axes show that expression of these proteins is variable across different inbred parents. Each datapoint represents the mean of three biological replicates.

<img src="images/cpm.6H.plastid.jpg?raw=true"/>

**Figure 2.** Expression heterosis (hybrid/mid-parent) in the transcriptome of six maize hybrid seedling leaves. The x-axes show that mRNA expression of PhANGs and NE plastid ribosomes are not consistently expressed above mid-parent levels as they are in the proteome. The y-axes show that expression of these mRNAs is variable across different inbred parents, though the pattern is discordant with the proteome. Each datapoint represents the mean of three biological replicates.
<br><br>
<br><br>
<img src="images/ethylene.jpg?raw=true"/>

**Figure 3.** Volcano plot of protein expression in the acs2-6 double mutant in B73 background relative to B73. Each data point represents the mean of five biological replicates. Colors correspond to their expression pattern in the hybrid A682xB73 relative to mid-parent. (B) Protein levels in the acs2-6 double mutant in B73 background relative to B73 on the x-axis, compared to expression in A682xB73 relative to MP on the y-axis. Points to the left or right of the vertical dotted line correspond to proteins that are below mid-parent or above mid-parent, respectively. Proteins above or below the horizontal dotted line correspond to proteins that are over-expressed or under-expressed in the mutant, respectively. Photosynthesis-Associated Nuclear Genes (PhANGs), Photosynthesis-Associated Plastid Genes (PhAPGs), Plastid-Encoded (PE) plastid ribosomes, Nuclear-Encoded (NE) plastid ribosomes, and ethylene biosynthesis proteins are color-coded.


[Click here to view code](https://github.com/devonbirdseye/HeterosisManuscript/blob/master/DataAnalyses.Rmd)
