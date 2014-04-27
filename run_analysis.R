
##   Please ensure that data.table package is installed using the command "install.packages("data.table")" prior to executing this script.

# Reading all the required files 
Xtrain <- read.table("train/X_train.txt")
Xtest <- read.table("test/X_test.txt")
Ytrain <- read.table("train/y_train.txt")
Ytest <- read.table("test/y_test.txt")
Subject_train <- read.table("train/subject_train.txt")
Subject_test <- read.table("test/subject_test.txt")
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

# Merge the training and test sets
X <- rbind(Xtrain,Xtest)
Y <- rbind(Ytrain, Ytest)
Subject <- rbind(Subject_train,Subject_test)


#Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_std_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X_mean_std <- X[, mean_std_features]


#Uses descriptive activity names to name the activities in the data set, Adding a neew column that provides the activity descrption for the corresponding activity ID.
Y["V2"]<-NA
Y$V2 <- factor(Y$V1,levels=activity_labels$V1,labels=activity_labels$V2)

#Label the data, subject and activity datasets with appropriate descriptions  
mean_std_columns <- features[mean_std_features,2]
names(X_mean_std) <- mean_std_columns
names(Subject) <- "Subject"
names(Y)[1]<-paste("ActivityID")
names(Y)[2]<-paste("ActivityDescription")

#Merge the data set, activity and subject information into a single data set
Mean_StdDev_Dataset <- cbind(X_mean_std,Y,Subject)


# Create a second, independent tidy data set with the average of each variable for each activity and each subject
library(data.table)
temp1_tidy <- data.table(Mean_StdDev_Dataset)
temp2_tidy <- temp1_tidy[,lapply(.SD,mean),by="ActivityDescription,Subject"]
temp2_tidy<- temp2_tidy[order(tidy_dataset$ActivityDescription,tidy_dataset$Subject),]
write.table(temp2_tidy, "tidy_dataset.txt",sep="\t")