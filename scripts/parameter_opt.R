####READ ME####
# The purpose of this script is to optimize the different de novo parameters for Aciurina RAD data 
####libraries####
library(tidyverse)

####m10_M5_n5####
##Mean depth
var_depth1 <- read_delim("m10_M5_n5/m10_M5_n5_sitedepth.ldepth.mean", delim = "\t",
                        col_names = c("chr", "pos", "mean_depth", "var_depth"), skip =1)
a <- ggplot(var_depth1, aes(mean_depth)) + geom_density(fill = "dodgerblue1", colour = "black", alpha = 0.3)
a + theme_light()
summary(var_depth1$mean_depth)
a + theme_light() + xlim(0, 100)

##Variant missingness
var_miss1 <- read_delim("m10_M5_n5/m10_M5_n5_miss_site.lmiss", delim = "\t",
                        col_names = c("chr", "pos", "nchr", "nfiltered", "nmiss","fmiss"), skip = 1)
a <- ggplot(var_miss1, aes(fmiss)) + geom_density(fill = "dodgerblue1", colour = "black", alpha = 0.3)
a + theme_light()
summary(var_miss1$fmiss)

##Minor alelle frecuencies
var_freq1 <- read_delim("m10_M5_n5/m10_M5_n5_alleles.frq", delim = "\t",
                        col_names = c("chr", "pos", "nalleles", "nchr", "a1", "a2"), skip = 1)
var_freq1$maf <- var_freq1 %>% select(a1, a2) %>% apply(1, function(z) min(z))
a <- ggplot(var_freq1, aes(maf)) + geom_density(fill = "dodgerblue1", colour = "black", alpha = 0.3)
a + theme_light()
summary(var_freq1$maf)

##Mean depth per individual
ind_depth1 <- read_delim("m10_M5_n5/m10_M5_n5_depth.idepth", delim = "\t",
                         col_names = c("ind", "nsites", "depth"), skip = 1)
a <- ggplot(ind_depth1, aes(depth)) + geom_histogram(fill = "dodgerblue1", colour = "black", alpha = 0.3)
a + theme_light()

##Proportion of missing data per individual
ind_miss1  <- read_delim("m10_M5_n5/m10_M5_n5_miss_indiv.imiss", delim = "\t",
                         col_names = c("ind", "ndata", "nfiltered", "nmiss", "fmiss"), skip = 1)
a <- ggplot(ind_miss1, aes(fmiss)) + geom_histogram(fill = "dodgerblue1", colour = "black", alpha = 0.3)
a + theme_light()

####m10_M5_n5####