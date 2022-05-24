library(dplyr)
library(party)
DMData <- read.csv("DMDataSet_Cleaned.csv")
View(DMData)

set.seed(555)

#Select Features
DMData_Data<- select(DMData,6,8,11,13)
View(DMData_Data)

#Change to Factor
DMData_Data$Control.of.institution <- factor(DMData_Data$Control.of.institution)

#Partition the data into 2 sets
pd <- sample(2,nrow(DMData_Data),replace= TRUE, prob = c(0.8,0.2))
train <- DMData_Data[pd==1,]
validate <- DMData_Data[pd==2,]
View(validate)

#Decision tree creation
tree <- ctree(Control.of.institution~., data=train,controls = ctree_control(mincriterion = 0.99,minsplit=100))

#Visualization of decision tree
plot(tree)

#Misclassification of errors
p1 <- predict(tree,train)
tab1 <- table(Predicted = p1, Actual = train$Control.of.institution)
tab1
1 - sum(diag(tab1))/sum(tab1)
p2 <- predict(tree,validate)
tab2 <- table(Predicted = p2, Actual = validate$Control.of.institution)
tab2
1 - sum(diag(tab2))/sum(tab2)

#Accuracy check of the model
predict_unseen <-predict(tree, train)
table_mat <- table(train$Control.of.institution, predict_unseen)
table_mat
accuracy_Test <- sum(diag(table_mat)) / sum(table_mat)
print(paste('Accuracy for test', accuracy_Test))
      