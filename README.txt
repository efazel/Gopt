#############################################################
#################### FUNCTION Gopt ##########################
## Author: Ehsan Fazel (Concordia University)              ##
## This version: June 2019                                 ##
##                                                         ##
## Gopt computes the optimal number of groups by           ##
## the BIC infomraion criterion presented in Manresa and   ##
## Bonhomme (2016).                                        ##
## The function runs the kmeans algorithm to cluster the   ##
## data and then shows the optimal number of clusters in   ##
## variable OptG.                                          ##
##                                                         ##
## Input 1: T by N of data (data)                          ##
## Input 2: maximum number of clusters (gmax)              ##
## Input 3: number of replications (replic)                ##
##                                                         ##
## Output 1: optimal number of clusters (OptG)             ##
## Output 2: its corresponding centroids (cntr)            ##
## Output 3: the value of BIC (bic)                        ##
## Output 4: indexing obtained by kmeans (Indx)            ##
#############################################################
#############################################################
