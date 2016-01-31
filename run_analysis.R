#########################################################
# Course : Data Science -Getting and cleaning data
# Author : Amit Bothra
# Date of Creation : 29Jan2016
# Description: This code takes the samsung data and 
# through a series of steps achieves following things:
#         
#  1. Merges the training and the test sets to create 
#     one data set.
#  2. Extracts only the measurements on the mean and
#     standard deviation for each measurement.
#  3. Uses descriptive activity names to name the 
#     activities in the data set
#  4. Appropriately labels the data set with descriptive
#     variable names.
#  5. From the data set in step 4, creates a second, 
#     independent tidy data set with the average of each
#     variable for each activity and each subject.       
#########################################################
rm( list = ls())
# Set the working directory to folder containing the 
# UCI HAR Dataset folder 
# setwd("")
# getwd()

# 1. Merges the training and the test sets to create one data sets

train <- read.table("./UCI HAR Dataset/train/X_train.txt")
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
combo <- rbind(train,test)

features_name <- read.table("./UCI HAR Dataset/features.txt")
colnames(combo) <- features_name$V2

# 2. Extracts only the measurements on the mean and
#    standard deviation for each measurement.
# meanFreq and Angle are not included
index <- grepl("mean\\(\\)|std\\(\\)",names(combo))
combo <- combo[,index]

# 3. Uses descriptive activity names to name the activities in the data set

train_label <- read.table("./UCI HAR Dataset/train/y_train.txt")
test_label <- read.table("./UCI HAR Dataset/test/y_test.txt")
combo_label <- rbind(train_label,test_label)

activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
combo_label$activity <- activity[combo_label[,1],2]

#Merge activity labels.
combo <- cbind(combo_label$activity,combo)
colnames(combo)[1] <- "activity"
combo$activity <- tolower(combo$activity)

# 4. Appropriately labels the data set with descriptive variable names.
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
combo_subject <- rbind(train_subject,test_subject)

#Merge Subjects
combo <- cbind(combo_subject,combo)
colnames(combo)[1] <- "subject"

#Cleaning up the variable names
names(combo) <- gsub("mean", "Mean", names(combo)) 
names(combo) <- gsub("std", "Std", names(combo))
names(combo) <- gsub("-", "", names(combo)) 
names(combo) <- gsub("\\(\\)", "", names(combo)) 

# 5. From the data set in step 4, creates a second, independent
# tidy data set with the average of each variable for each 
# activity and each subject
library(dplyr)
tidydata  <- combo %>% 
             group_by(subject,activity) %>%
             summarize_each(funs(mean))

#Writing final dataset
write.table(tidyData, file='./tidydata.txt', row.names=FALSE)