
library(RColorBrewer)
library(ggridges)
library(ggplot2)
library(BSDA)
set.seed(586)

#import protein data
tmt.6H <- readRDS("tmt.6H")
tmt.RIL <- readRDS("tmt.RIL")
#import RNA data
cpm.6H <- readRDS("cpm.6H")
cpm.RIL <- readRDS("cpm.RIL")
#import plant height data
PlantHeights.6h.MP <- readRDS("PlantHeights.6h.MP")
PlantHeights.ril.MP <- readRDS("PlantHeights.ril.MP")
#combine RIL and 6 hybrids 
tmt.RIL.6H.Hyb2MP <- merge.data.frame(tmt.RIL[,c(6,127:135)], tmt.6H[,c(6,54:59)], by.x = "Accession", by.y = "Accession", all = F)
cpm.RIL.6H.Hyb2MP <- merge.data.frame(cpm.RIL[,c(1,76:84)], cpm.6H[,c(1,42:47)], by.x = "Gene", by.y = "Gene", all = F)
#Add gene column to protein data
tmt.RIL.6H.Hyb2MP$Gene <- substr(tmt.RIL.6H.Hyb2MP$Accession, start = 1, stop = 14)
#function for calculating correlations
CorFun <- function(x, xcols, y){
  for(i in 1:nrow(x)){
    v <- as.numeric(x[i,xcols])
    c <- cor(v, y, method = "pearson")
    x[i,"cor"]<- c
  }
  x
}
#run correlation function
tmt.RIL.6H.Hyb2MP.cor <- CorFun(tmt.RIL.6H.Hyb2MP, 2:16, c(PlantHeights.ril.MP, PlantHeights.6h.MP))
cpm.RIL.6H.Hyb2MP.cor <- CorFun(cpm.RIL.6H.Hyb2MP, 2:16, c(PlantHeights.ril.MP, PlantHeights.6h.MP))
#Combine data for plotting
cpm.RIL.6H.Hyb2MP.cor$data <- "mRNA"
cpm.RIL.6H.Hyb2MP.Hyb2HP.cor <- cpm.RIL.6H.Hyb2MP.cor[,c("Gene", "cor", "data")]
tmt.RIL.6H.Hyb2MP.cor$data <- "Protein"
tmt.RIL.6H.Hyb2MP.Hyb2HP.cor <- tmt.RIL.6H.Hyb2MP.cor[,c("Gene", "cor", "data")]
tmt.cpm.RIL.6H.Hyb2MP.Hyb2HP.cor <- rbind(tmt.RIL.6H.Hyb2MP.Hyb2HP.cor, cpm.RIL.6H.Hyb2MP.Hyb2HP.cor)
#import genes of interist (GOIs) list
GOIs <- readRDS("GOIs")
#Assign GOIs
tmt.cpm.RIL.6H.Hyb2MP.Hyb2HP.cor$Category <- "Other"
tmt.cpm.RIL.6H.Hyb2MP.Hyb2HP.cor[(tmt.cpm.RIL.6H.Hyb2MP.Hyb2HP.cor$Gene %in% GOIs$CytoRibo),"Category"] <- "Cytosolic ribosome"
tmt.cpm.RIL.6H.Hyb2MP.Hyb2HP.cor[(tmt.cpm.RIL.6H.Hyb2MP.Hyb2HP.cor$Gene %in% c(GOIs$NE.PtRibo, GOIs$PE.ribo)),"Category"] <- "Plastid ribosome"
tmt.cpm.RIL.6H.Hyb2MP.Hyb2HP.cor[(tmt.cpm.RIL.6H.Hyb2MP.Hyb2HP.cor$Gene %in% c(GOIs$PhANGs, GOIs$PhAPGs)),"Category"] <- "Photosynthesis"
tmt.cpm.RIL.6H.Hyb2MP.Hyb2HP.cor[(tmt.cpm.RIL.6H.Hyb2MP.Hyb2HP.cor$Gene %in% GOIs$BiosynSecMet),"Category"] <- "Biosynthesis of secondary metabolites"
tmt.cpm.RIL.6H.Hyb2MP.Hyb2HP.cor[(tmt.cpm.RIL.6H.Hyb2MP.Hyb2HP.cor$Gene %in% GOIs$AlphaLinAcidMet),"Category"] <- "Alpha-linoleic acid metabolism"
tmt.cpm.RIL.6H.Hyb2MP.Hyb2HP.cor$Category <- factor(tmt.cpm.RIL.6H.Hyb2MP.Hyb2HP.cor$Category, levels = c("Other", "Plastid ribosome", "Cytosolic ribosome", "Photosynthesis","Biosynthesis of secondary metabolites","Alpha-linoleic acid metabolism"))
#Plot
ggplot(tmt.cpm.RIL.6H.Hyb2MP.Hyb2HP.cor, mapping=aes(y=Category, x=cor, linetype=data, fill=stat(x)))+
  geom_density_ridges_gradient(gradient_lwd = 2)+
  scale_fill_gradientn(colors = alpha(rev(c(brewer.pal(n = 11, "RdBu"))), alpha = .4), guide = "none")+
  theme_ridges() +
  scale_linetype_manual(values = c("mRNA"="dashed", "Protein"="solid"), name="")+
  theme(axis.text =element_text(size=8), axis.title = element_text(size=8), legend.position = "bottom", legend.text = element_text(size=8), axis.title.y = element_blank(), axis.title.x = element_text(hjust = 0.5, size=8))+
  coord_cartesian(expand = F)+
  xlab("Pearson correlation")+
  geom_vline(xintercept = 0, color="grey50")+
  xlim(-1,1)

#Calculate statistics
GOIs.cor <- list("AlphaLinAcidMet"=GOIs$AlphaLinAcidMet, "BiosynSecMet"=GOIs$BiosynSecMet,"Photosynthesis"=c(GOIs$PhANGs, GOIs$PhAPGs), "pRibo"=c(GOIs$PE.ribo, GOIs$NE.PtRibo),"CytoRibo"=GOIs$CytoRibo)
ZtestResults <- data.frame("Alpha-linoleic acid metabolism"=numeric(), "Biosynthesis of secondary metabolites"=numeric(), "Photosynthesis"=numeric(), "Plastid ribosome"=numeric(),"Cytosolic ribosome"=numeric())

for(i in 1:length(GOIs.cor)){
  
  sigx <- sd(tmt.RIL.6H.Hyb2MP.cor$cor[tmt.RIL.6H.Hyb2MP.cor$Gene %in% as.vector(GOIs.cor[[i]])])
  sigy <- sd(tmt.RIL.6H.Hyb2MP.cor$cor[!tmt.RIL.6H.Hyb2MP.cor$Gene %in% as.vector(GOIs.cor[[i]])])
  
  ztest <- z.test(x = tmt.RIL.6H.Hyb2MP.cor$cor[tmt.RIL.6H.Hyb2MP.cor$Gene %in% as.vector(GOIs.cor[[i]])], y = tmt.RIL.6H.Hyb2MP.cor$cor[!tmt.RIL.6H.Hyb2MP.cor$Gene %in% as.vector(GOIs.cor[[i]])], sigma.x = sigx, sigma.y = sigy)
  
  ZtestResults[1,i]<- round(ztest$estimate[[1]], digits = 5)
  ZtestResults[2,i]<- round(ztest$estimate[[2]], digits = 5)
  ZtestResults[3,i]<- round(sigx, digits = 5)
  ZtestResults[4,i]<- round(sigy, digits = 5)
  ZtestResults[5,i]<- ztest$p.value
  ZtestResults[6,i]<- round(ztest$statistic[[1]], digits = 5)
  
}
colnames(ZtestResults) <- c("ALA metabolism", "Biosynthesis of secondary metabolites", "Photosynthesis","Plastid ribosome", "Cytosolic ribosome")
rownames(ZtestResults) <- c("mean (group)", "mean (others)", "SD (group)", "SD (others)", "p-value", "Z-statistic")

ZtestResults.t <- ZtestResults %>%
  kbl(digits = 5) %>%
  kable_styling(full_width = T) %>%
  save_kable("CorStats.png", zoom=3)
