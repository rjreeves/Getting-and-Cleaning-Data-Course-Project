# Author: Robert Reeves
#
# Getting and Cleaning Data Course Project 
#     Refer-https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project
#
# Analyze and tidy data set from Human+Activity+Recognition+Using+Smartphones
#


rm(list=ls())  # Clean environment

setwd("/Users/rreeves/Desktop/Peer-graded Assignment/UCI HAR Dataset/") 

library(dplyr)

#Read all the files
test_set<-read.table("./test/x_test.txt")
train_set<-read.table("./train/x_train.txt")
act_train<-read.table("./train/y_train.txt")
act_test<-read.table("./test/y_test.txt")

subject_test = read.table("./test/subject_test.txt")
subject_train = read.table("./train/subject_train.txt")
features<- read.table("features.txt")
actlabels<-(read.table("activity_labels.txt"))


#1 Merge training and test sets
set<-rbind(test_set, train_set)  # x_test, x_train
act<-rbind(act_train, act_test) # y_train, y_test
colnames(act)<-"activity"
subjects<-rbind(subject_test,subject_train) 

#2 Extracts only the measurements on the mean and standard deviation for each measurement.
select_set<-features[ grep('mean\\(\\)|std\\(\\)', features$V2) ,]  # Activites for filtered variables
set<-set[,select_set[,1]]

#3 Uses descriptive activity names to name the activities in the data set
act$activitylabel <- factor(act$activity,labels = as.character(actlabels[,2]))
activitylabel <- act[,-1]

#4 Appropriately labels the data set with descriptive variable names.
colnames(set)<-features[select_set[,1],2]

#5 Second, independent tidy data set 
colnames(subjects)<- "subject"
final<-cbind(set,activitylabel,subjects)

# Calculate mean on all variables - using dplyr pipes
final_mean <- final %>% 
              group_by(activitylabel, subject) %>%
              summarize_all(funs(mean))

# Save the final_mean as tidy data set
write.table(final_mean, file = "tidydata.txt", row.names = FALSE, col.names = TRUE)

#end.
