A code book that describes the variables, the data, and any transformations or work that I performed to clean up the data.

Variables in run_analysis.R:
fileURL: the url to download the raw dataset for the project
train: training set, from "UCI HAR Dataset/train/X_train.txt"
trainLabel: training labels, from  "UCI HAR Dataset/train/y_train.txt"
trainSubject: training subjects, from "UCI HAR Dataset/train/subject_train.txt"
test: testing set, from "UCI HAR Dataset/test/X_test.txt"
testLabel: testing labels, from  "UCI HAR Dataset/test/y_test.txt"
testSubject: testing subjects, from "UCI HAR Dataset/test/subject_test.txt"
allData: row merge for training and testing dataset
allLabel: row merge for training and testing Label data
allSubject: row merge for training and testing Subject data
features: list of all features, from "UCI HAR Dataset/features.txt"
meanStdIndices: list of only "Mean" and "Standard Deviation" feature from "features"
DataWanted: extract only "Mean" and "Standard Deviation" related data from "allData"
activity: links the class labels with their activity name, from "UCI HAR Dataset/activity_labels.txt"
subjectLen: the length of all unique value from "allSubject"
activityLen: row # of "activity"
columnLen: column # of "all Data"
result: matrix to store the average of each variable for each activity and each subject

Steps:
1. Retrieve data from raw file and create corresponding variables. 
2. Merge dataset, labels and subjects values.
3. Using regular expression to select "Mean" and "Std" indices from features.
4. Trim and rename the indices.
5. Extract mean and std values from merged dataset based on indices, and use indices name as column name.  
6. Replace activity column in merged labels dataset with descriptive activity names from table activity, and rename column to "activity".
7. Rename subject column to "Subject" in merged subjects dataset.
8. Merge all pre-merged labels, subjects, dataset into one single dataset "DataWanted", name the output as "tidy_data.txt".
9. Generate a second independent dataset with the average of each measurement for each activity and subject. We have 30 distinctive subjects 
   values and 6 distinctive activity values, so total up we have 180 different combinations for each activity and each subject. The result matrix 
   is used to retrieve the all mean values from "DataWanted" based on these 180 combinations. 
10. Export result matrix resutls into "data_output.txt".



