#Author: Neill Miller; Date: 04/01/2025; Purpose: Perform microarray analysis 

#Load library affy 
library(affy)

#Set the working directory

setwd("/Users/neillmiller/Desktop/data")

# Read the CEL dataset from data folder 

data <-ReadAffy()

#Boxplot the raw datasets
boxplot(data)

#Preprocess the microarray dataset by performing Normalizaion (by using function RNA)
norm_data<-rma(data)

#Extract expression values
final<-exprs(norm_data)

boxplot(final)

#Classify treatment and control gorups
Treatment<-final[,1:5]
Control<-final[,6:10]

#Calculate mean for Treatment and Control 

Treatment_mean<-rowMeans(Treatment)
Control_mean<-rowMeans(Control)

#Calculate the fold changes
Fold_changes<-Treatment_mean-Control_mean
head(Fold_changes)

#>1.5 is an up-regulated gene, <-1.5 i s a down-regulated gene

#Export results as a CSV file 
write.csv(Fold_changes,"Fold_changes.csv",row.names=TRUE)
