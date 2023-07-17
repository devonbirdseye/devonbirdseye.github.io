## Project 1: Investigation of the molecular basis of heterosis using proteomics and transcriptomics

###Visualizing protein and mRNA expression patterns in hybrids

I found that the abundance of plastid protein complexes, consisting of subunits encoded by both the nucleus and the plastid, were elevated in hybrids relative to mid-parent levels (Figure 1A), which may account for greater photosynthetic capacity of hybrids. This pattern was not reflected in their transcriptomes (Figure 1B), indicating a role of post-transcriptional regulation in hybrids. Additionally, expression patterns in an ethylene biosynthesis mutant, acs2-6, mimicked those of the hybrid (Figure 2), indicating that reduced expression of ethylene biosynthesis may mediate heterosis.

[Click here to try the shiny app I developed to visualize expression heterosis of your gene of interest!](https://devonbirdseye.shinyapps.io/ExpressionViewer/)

[Click here to view my publication of this work](https://www.pnas.org/doi/abs/10.1073/pnas.2109332118)

<img src="images/expressionhet_legend.jpg?raw=true"/>

**Figure 1.** Volcano plots showing expression levels of proteins (A) and transcripts (B) in seedling leaves of the B73xMo17 (BxM) hybrid relative to mid-parent (MP) levels. Photosynthesis-Associated Nuclear Genes (PhANGs), Photosynthesis-Associated Plastid Genes (PhAPGs), Nuclear-Encoded (NE) plastid ribosome subunits and Plastid-Encoded (PE) plastid ribosome subunits are color-coded. Each datapoint represents the mean of three biological replicates.

<br><br>
<img src="images/ethylene.jpg?raw=true"/>

**Figure 2.** (A) Volcano plot of protein expression in the ethylene mutant (acs) in B73 background relative to B73. Each data point represents the mean of five biological replicates. Colors correspond to their expression pattern in the hybrid A682xB73 relative to mid-parent. (B) Protein levels in the ethylene mutant (acs) in B73 background relative to B73 on the x-axis, compared to expression in A682xB73 relative to MP on the y-axis. Points to the left or right of the vertical dotted line correspond to proteins that are below mid-parent or above mid-parent, respectively. Proteins above or below the horizontal dotted line correspond to proteins that are over-expressed or under-expressed in the mutant, respectively. Photosynthesis-Associated Nuclear Genes (PhANGs), Photosynthesis-Associated Plastid Genes (PhAPGs), Plastid-Encoded (PE) plastid ribosome subunits, Nuclear-Encoded (NE) plastid ribosome subunits, cytosolic ribosome subunits, and ethylene biosynthesis proteins are color-coded.


[Click here to view code](https://github.com/devonbirdseye/HeterosisManuscript/blob/master/DataAnalyses.Rmd)
