#Data Science Spcialization: Getting and Cleaning Data Course Project

Course : Getting and Cleaning Data Course
Author : Amit Bothra
Date of Creation : 29Jan2016

## Problem Description:

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Steps to run this project:

1. Create working directory called **Project**
2. Download the data from :
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
3. Unzip  the downloaded data in **Project** which will create directory UCI HAR Dataset 
3. In RStudio open the **run_analysis.R** script
4. set working directory using **setwd** command listed in the script at the top
5. Run the script
6. The script will save in the working directory the file **'tidydata.txt'**
7. The tidydata.txt contains 180 observations for the 30 subjects ech performing 6 activities. There are 68 variables:
    * Subject
    * Activity
    * Mean values for each of the 66 features
