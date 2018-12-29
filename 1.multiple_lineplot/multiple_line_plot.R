rm(list=ls())

library(RColorBrewer)


colours  = brewer.pal(11, "Set3")[c(1,4,5,7)]
xy <- par("usr")
par(las=2,lwd=1)
par(mar=c(5,4,4,2)+c(2,2,2,2),mfrow=c(1,1))

data <- read.csv("./Zscore_cluster.csv", header = TRUE, row.names = 1)
for (i in sort(unique(data$cluster))){
  tmp = subset(data, cluster == i)[-5]
  avg = apply(tmp, 2, mean)
  
  pdf(paste0("cluster_",i,"_lineplot.pdf"), width = 10)
  plot(avg, type = "l", ylim = c(min(tmp)*1.1, max(tmp)*1.1),ylab = "Z-Score value",
       xaxt="n", xlab = "", col=colours[2], lwd=2 )
  title(main = paste0("Expression_pattern_","_cluster_",i), cex.main = 1.2, font.main=1.5, line=1.5)
  text(c(1,2,3,4),par("usr")[3] * 1.1, labels = colnames(data)[-5], xpd=TRUE, cex=1.2)
  
  drawline <- function(x){
    lines(c(1,2,3,4),x,lwd=1.1, col=colours[1])
  }
  apply(tmp, 1, drawline)
  lines(c(1,2,3,4), avg, lwd=2, col=colours[2])
  dev.off()
}

