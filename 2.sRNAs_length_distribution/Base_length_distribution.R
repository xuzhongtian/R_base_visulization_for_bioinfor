rm(list=ls())
#setwd("/bioinfor/biodata/00_service/1_liuyan_sRNAs/plot/1.length_distro/")

library(RColorBrewer)
options <- commandArgs(trailingOnly=T)
file_name = options[1]
sample = strsplit(file_name, split = "\\." )[[1]][1]

pdf(paste0(sample,".RomoveStuctGenomeMapping.pdf"), width = 10)
colours  = brewer.pal(11, "Set3")[c(1,4,5,7)]

xy <- par("usr")
par(las=2,lwd=1)
par(mar=c(5,4,4,2)+c(6,2,6,2),mfrow=c(1,1))

data <- read.table(file=options[1], header = 1, row.names = 1)
data <- data[,c(5,6,7,8)]
colnames(data) <- substr(colnames(data),1,1)
colnames(data)[which(colnames(data) == "T")] <- "U"
data <- t(data)

x <- barplot(data,
             border = "NA", space = 0.6, font.axis=1,
             col = colours, ylim = c(0,max(apply(data,2,sum))*1.2), yaxt ="n", xaxt="n")

#The next two line ugly code aimed to change the number like 1234567 to 1300000. 
max_y <- max(colSums(data)) * 1.1
max_y <- ceiling(max_y / 10 ** (nchar(max_y) - 2)) * 10 **(nchar(max_y) -2)
y1 <- seq(0, max_y, length.out=5)
label <- sapply(y1, FUN = function(x) { paste0(round(x / 1000000, 2),"M")})
axis(side=2, at=y1, labels = label, tick=TRUE)

legend("topright", legend=rownames(data), fill = colours, col = colours, ncol =1, bty = "n", border = "white", cex=1)

title(main = paste0("Length distribution and 5' terminal base frequency \nof sRNAs in ",sample), 
      cex.main = 1, font.main=1.2, line=0.75)
title(ylab = "Number of sRNAs", line = 3.1, cex.lab = 1)
text(cex=1, x=x-.25, y = xy[3] - yinch(0.3), labels = colnames(data), xpd=TRUE, srt=45 )
box(lwd=0.8)
dev.off()

