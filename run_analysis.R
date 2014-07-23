## This script is for making the UCI_HAR_Dataset tidy.
## This is for the solution of peer review assignmen
library("plyr")

# Read actual activities names
activity <- read.table("UCI\ HAR\ Dataset/activity_labels.txt")
activityTable <- c() 
for (i in activity$V1)
{
    activityTable[as.numeric(i)] <- as.character(activity[i,2])
}
# Function for renaming the activity
change <- function(act) {return (activityTable[act])}
# Read actual column/attribute names
attribute <- read.table("UCI\ HAR\ Dataset/features.txt")

######## This part is for training data ##########
# Read train data
xTrain <- read.table("UCI\ HAR\ Dataset/train/X_train.txt")
# Rename the cols of train data
names(xTrain) <- attribute[,2]
# Read the subjects with proper col names and rename it with descriptive names
subjectTrain <- read.table("UCI\ HAR\ Dataset/train/subject_train.txt")
names(subjectTrain) <- c("Subject")
# Read train labels 
yTrain <- read.table("UCI\ HAR\ Dataset/train/y_train.txt")
names(yTrain) <- c("Activity")
yTrain <- lapply(yTrain, change)
# Merge the train subject, activity and  train_data
train <- cbind(yTrain, subjectTrain, xTrain)

######## This part is for test data ##########
# Read test data
xTest <- read.table("UCI\ HAR\ Dataset/test/X_test.txt")
# Rename the cols of test data
names(xTest) <- attribute[,2]
# Read the subjects with proper col names and rename it with descriptive names
subjectTest <- read.table("UCI\ HAR\ Dataset/test/subject_test.txt")
names(subjectTest) <- c("Subject")
# Read test labels 
yTest <- read.table("UCI\ HAR\ Dataset/test/y_test.txt")
names(yTest) <- c("Activity")
yTest <- lapply(yTest, change)
# Merge the test subject, activity and  test_data 
test <- cbind(yTest, subjectTest, xTest)

##### Merge the train and test data ################
data <- rbind(train, test)

###### Select data which has only the mean and std #######
dataStdMean <- data[,grepl("Subject|Activity|mean|std", ignore.case=TRUE, names(data))]

#### Create a second tidy dataset ##################
dataAvg = ddply(dataStdMean, c("Subject","Activity"), numcolwise(mean))
write.table(dataAvg, file = "secondTidy.txt")
