## R_base_visulization_for_bioinfor

This reposity mainly record how to visulize the NGS omics data via R. 

### Figure1: Expression pattern multiple-line plot. 

+ **Background**: To study the expression pattern of differentially expression genes in NGS datasets, expecially in transcriptome datasets, we often cluster the DEG expression matrix to several groups according to their expression pattern(Such as K-means clustering). In order to gain a explicit understanding of those groups, we sometimes choose to visualize them with multiple-line plot. 
+ **input**: expression matrix with last column tagged with cluster ID 
+ **how to use it**: *Rscript Base_multiple_line_plot.R*
+ **output**: several figures pointed to different expression pattern group. 

<div align=center><img src=https://github.com/wandering513/R_base_visulization_for_bioinfor/raw/master/images/1.multiple_line_plot.png/></div>


### Figure2: sRNAs length distribuion and 5'terminal frequency plot.
+ **Background**: sRNAs length distribution plot can give us a overall understanding of the quality of the samples, while the 5 terminal base of sRNAs plays an important role in sorting sRNAs to different AGO protein. 
+ **input**: nucleotide composition in different length. Please check the file *Col0_rep1.length.base.txt* 
+ **how to use it**: *Rscript Base_length_distribution.R Col0_rep1.length.base.txt*
+ **output**: As figure below.

<div align=center><img src=https://github.com/wandering513/R_base_visulization_for_bioinfor/raw/master/images/2.sRNAs_length_distribution.png/></div>