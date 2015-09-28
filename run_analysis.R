## set up working directory
setwd("~/R/Coursera/Getting and Cleanning Data")

## download and unzip dataset:
library(RCurl)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "data.zip", method = "libcurl")

if(!file.exists("UCI HAR Dataset")){
  unzip("data.zip")
}

## Load Data Sets
train <- read.table("UCI HAR Dataset/train/X_train.txt")
trainLabel <- read.table("UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")

test <- read.table("UCI HAR Dataset/test/X_test.txt")
testLabel <- read.table("UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")

## Merge Data Sets, Labels and Subjects
allData <- rbind(train,test)
allLabel <- rbind(trainLabel,testLabel)
allSubject <- rbind(trainSubject,testSubject)

## Extract only means and standard deviation of all dataset
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[,2])
meanStdIndicesNames <- features[meanStdIndices,2]
meanStdIndicesNames = gsub("-mean","Mean",meanStdIndicesNames)
meanStdIndicesNames = gsub("-std","Std",meanStdIndicesNames)
meanStdIndicesNames = gsub("[-()]","",meanStdIndicesNames)

DataWanted <- allData[,meanStdIndices]
colnames(DataWanted) <- c(meanStdIndicesNames)

## Uses descriptive activity names to name the activities in the data set
activity <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabel <- activity[allLabel[,1],2]
allLabel[,1] <- activityLabel
names(allLabel) <- "activity"

## Labels the dataset with descriptive variable names.
names(allSubject) <- "subject"
DataWanted <- cbind(allSubject,allLabel,DataWanted)
write.table(DataWanted, "tidy_data.txt")


## Stores output in result.txt under working directory with the average of each variable 
## for each activity and each subject.
subjectLen <- length(table(allSubject)) 
activityLen <- dim(activity)[1]
columnLen <- dim(DataWanted)[2]
                     
result <- matrix(NA, nrow = subjectLen, ncol =  columnLen)
result <- as.data.frame(result)
colnames(result) <- colnames(DataWanted)
row <- 1
for (i in 1:subjectLen) {
  for (j in 1:activityLen) {
    result[row,1] <- sort(unique(allSubject)[,1])[i]
    result[row,2] <- activity[j,2]
    bool1 <- i == DataWanted$subject
    bool2 <- activity[j,2] == DataWanted$activity
    result[row,3:columnLen] <- colMeans(DataWanted[bool1&bool2,3:columnLen])
    row <- row + 1
  }
}

write.table(result, "data_output.txt")








