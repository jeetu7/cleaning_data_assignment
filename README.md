Assignment for the coursera course: Getting and Cleaning Data 
========================

This is the repository for getting and cleaning data course at coursera.
The data for this project lies on the following link. 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Just download the data and unzip it into the root (where this Readme.md 
exists) folder. Next open R and run the following commands to make the 

    source("run_analysis.R")

### Description
This will create a file named "secondTidy.txt" which contains the second tidy dataset as required by the assignment part 5. The merged data set, required by assignment part 1, is stored in the variable "data", which will be available in the R environment once the script is executed. This "data" has activity labels appropriately transformed do dsecriptive names. The features names are as per choosen by the original dataset creator so as not to create any  confusion for future researchers, who migrates from source dataset. These are the requirements of assignment part 3 & 4.

The variable "dataStdMean" contains only the variables with std and mean in their names (along with the column names Subject and Activity) as per required by the assignment part.

### Goals of this project (Just for the sake of completeness).
The goals of the given assignment are as follows (verbatim copy from the coursera site):
You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

==
