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
<img src="images/tmt.cpm.SL.acs.vol.png?raw=true"/>

**Figure 3.** Volcano plot showing expression heterosis of ethylene biosynthesis enzymes in the proteome (A) and transcriptome (B) of the B73xMo17 hybrid seedling leaf from the original experiment. Of the five enzymes for which the mutant is known to produce reduced ethylene (ACS2, ACS6, ACO1, ACO2, and SAMS1), two were detected in the proteome (ZmACO2 and ZmSAMS1) and three were detected in the transcriptome (ZmACS2, ZmACO2 and ZmSAMS1). Each datapoint represents the mean of three biological replicates.

[Click here to view code](https://github.com/devonbirdseye/HeterosisManuscript/blob/master/DataAnalyses.Rmd)
