install.packages("dendextend")
library(dendextend)
library(dplyr)
library(factoextra) # clustering algorithms & visual

#Fetch Data Set
DMData <- read.csv("DMDataSet_Cleaned.csv")
View(DMData)

#Remove any blanks
DMDataCleaned <- DMData[complete.cases(DMData),]
View(DMDataCleaned)

# DMData's Labels
DMDataCleaned.labels=DMDataCleaned$Name
table(DMDataCleaned.labels)
DMDataCleaned_Data <- select(DMDataCleaned, 2:4)
View(DMDataCleaned_Data)

#Scale the Data
DMDataCleaned_Data_Scale <- scale(DMDataCleaned_Data)
View(DMDataCleaned_Data_Scale)

#Calculate the distance
DMDataCleaned_Data <- dist(DMDataCleaned_Data_Scale)

#hierarchical algorithm
hc.out_DMData <- hclust(DMDataCleaned_Data, method="complete")
hc.out_DMData
#Dendodram
plot(hc.out_DMData)
#clusters
rect.hclust(hc.out_DMData,k=4, border = 2:5)
abline(h = 6, col = 'red')
avg_dend_obj <- as.dendrogram(hc.out_DMData)
avg_col_dend <- color_branches(avg_dend_obj, h = 6)
plot(avg_col_dend)

#Calculate the how many clusters needed
fviz_nbclust(DMDataCleaned_Data_Scale, kmeans, method = "wss") + labs(subtitle = "Elbow Method")

#k-means
km.out <- kmeans(DMDataCleaned_Data_Scale, centers=3, nstart=100)
print(km.out)

#Visualizing the clusters
km.clusters <- km.out$cluster
rownames(DMDataCleaned_Data_Scale) <- paste(DMDataCleaned$Name, 
                                              1:dim(DMDataCleaned)[1], sep="_")
fviz_cluster(list(data=DMDataCleaned_Data_Scale, cluster = km.clusters), labelsize = "8", 
               pointsize = .1)
