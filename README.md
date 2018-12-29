## R_base_visulization_for_bioinfor

This reposity mainly record how to visulize the NGS omics data via R. 

### Figure1: Expression pattern multiple-line plot. 

+ Background: To study the expression pattern of differentially expression genes in NGS datasets, expecially in transcriptome datasets, we often cluster the DEG expression matrix to several groups according to their expression pattern(Such as K-means clustering). In order to gain a explicit understanding of those groups, we sometimes choose to visualize them with multiple-line plot. 
+ input: expression matrix with cluster ID 
+ how to use it: Rscript multiple_line_plot.R
+ output: several figures pointed to different expression pattern group. 
