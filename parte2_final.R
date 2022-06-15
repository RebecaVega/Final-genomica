### REBECA VEGA ESCAMILLA ###

#2. (15) Elabora un programa que a partir de un objeto de tipo phyloseq generado
#de un análisis  de identificación taxonómica  a partir del gen 16S ribosomal
#elabora un programa que
library(dada2)
library(phyloseq)
library(ggplot2)
library(vegan)
library(Rcpp)
library(microbiome)
library(knitr)
#1. Calcule distintas medidas de diversidad

data("GlobalPatterns")

head(tax_table(GlobalPatterns))
head(otu_table (GlobalPatterns))
head(sample_data(GlobalPatterns))

#1. Calcule distintas medidas de diversidad
gp <- apply(X = otu_table(GlobalPatterns),
                MARGIN = ifelse(taxa_are_rows(GlobalPatterns), yes = 1, no = 2),
                FUN = function(x){sum(x > 0)})

#asignación taxonomica
gp <- data.frame(Prevalence = gp,
                     TotalAbundance = taxa_sums(GlobalPatterns),
                     tax_table(GlobalPatterns))

plyr::ddply(gp, "Phylum", function(df1)
{cbind(mean(df1$Prevalence),sum(df1$Prevalence))}) -> gp2
kable(gp2)

taxa_names(gp) <- paste0("ASV", seq(ntaxa(gp)))
gp

diversity(gp, index = "shannon")
plot_richness(gp, color = "species", x = "species", 
              measures = c("Observed", "Chao1", "Shannon")) + 
  geom_boxplot(aes(fill = species), alpha=.5)

div <- c("Observed", "Chao1", "ACE", "Shannon", "Simpson", "InvSimpson")
(r <- plot_richness(GlobalPatterns, "human", "SampleType", measures=div))

plot_richness(GlobalPatterns, "samples", measures=c("Observed","Simpson"))
plot_richness(GlobalPatterns)

#2. Elabore una gráfica de barras de abundancias por muestras.

prim10 <- names(sort(taxa_sums(GlobalPatterns), decreasing=TRUE))[1:20]

prim10 <- names(sort(taxa_sums(GlobalPatterns), decreasing=TRUE))[1:20]
GlobalPatterns10 <- transform_sample_counts(GlobalPatterns, function(OTU) OTU/sum(OTU))
GlobalPatterns10 <- prune_taxa(prim10, GlobalPatterns10)
GlobalPatterns
tax_table(GlobalPatterns10)
plot_bar(GlobalPatterns10,  fill="Species")
#Arroja la gr[afica de abundancias de muestras por especies

#3. Elabore un análisis de reducción de dimensionalidad

rd <- ordinate(GlobalPatterns10, method="NMDS", distance="bray") 
# se ordenan las dimesiones con NMDS y la distancia entre muestras
rd

#4.  Muestre el microbioma core de las muestras

plot_core(GlobalPatterns10, detection = 0.1/100, prevalence = 80/100,plot.type = "heatmap")
# creo que es algo así

#5. (Opcional) genere redes de co-abundacia por muestra.