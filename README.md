# Coursera-Getting-and-Cleaning-Data-Project

This is the course project for the Getting and Cleaning Data Coursera course. 
The following describes how run_analysis.R works:

1). Unzip the data from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
and check if it exist in the same working directory as run_analysis.R.

2). Load the datasets and merge the training and the test sets to create one dataset.

3). Extracts only the measurements on the mean and standard deviation for each measurement.

4). Uses descriptive activity names to name the activities in the data set. 

5). Lables the dataset with descriptive variable names, the cleaned dataset is in tidy_data.txt.

6). Stores results in data_output.txt under working directory with the average of each variable for each activity and each subject.

