## Week 4 Project, Getting and Cleaning Data 
## The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. 
## I intend to prepare tidy data that can be used for later analysis. In this project I will do the 
## following: 1) create a tidy dataset 2) provide a link to a Github repository with the R script 
## 3) create a code book that describes the variables, the data, and any transformations or work that was  
## used to clean up the data, called CodeBook.md 4) include a README.md in the repo with 
## your scripts; explaining how all of the scripts work and how they are connected.

## Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Install the dplyr package because it will assist with the data wrangling.

install.packages("dplyr")
library(dplyr)

# The data for the project is stored in the folder called UCI HAR Dataset. Use the list.files() function
# to Check if al the files are in the folder. 

list.files("./UCI HAR Dataset") 

# The data is stored in several txt files, so we create a data frame from each of the txt files.
# Write the names of the columns and view the first three rows of each data frame. 

activityLabel <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("Code", "Activity"))
head(activityLabel, n=3)

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
head(features, n=3)

subjectTrain <- read.table("UCI HAR Dataset/subject_train.txt", col.names = "Subject")
head(subjectTrain, n=3)

XTrain <- read.table("UCI HAR Dataset/X_train.txt", col.names = features$functions)
head(XTrain, n=3)

yTrain <- read.table("UCI HAR Dataset/y_train.txt", col.names = "Code")
head(yTrain, n=3)

subjectTest <- read.table("UCI HAR Dataset/subject_test.txt", col.names = "Subject")  
head(subjectTest, n=3)

XTest <- read.table("UCI HAR Dataset/X_test.txt", col.names = features$functions)
head(XTest, n=3)

yTest <- read.table("UCI HAR Dataset/y_test.txt", col.names = "Code")
head(yTest, n=3)

# Use the bind_rows() and bind_cols() functions, from the dplyr package, to merge the 
# data frames containing the training and test sets, and look at the structure of that data frame.

Xtraintest <- dplyr::bind_rows(XTrain, XTest)
ytraintest <- dplyr::bind_rows(yTrain, yTest)
subjectTrainTest <- dplyr::bind_rows(subjectTrain, subjectTest)
mergeTrainTest <- dplyr::bind_cols(Xtraintest, ytraintest, subjectTrainTest)
str(mergeTrainTest)

# Use the select() function to extract only the measurements on the mean and standard deviation for 
# each measurement. The contains() helper function, for the select() function, allows us to focus on
# on the means and standard deviations. 

extractMeanSD <- select(mergeTrainTest, Code, Subject, contains("mean"), contains("std"))
str(extractMeanSD)

# The features_info.txt file contains the proper description of the activity names, so we will 
# this information to rename the activities, by wiritng out abbreviations, in the tidy data set. 
# This is achieved by using the gsub() function which replaces all matches of a string, if the 
# parameter is a string vector, returns a string vector of the same length and with the same attributes
# (after possible coercion to character). Elements of the variable names which are not substituted 
# will be returned unchanged. 

extractMeanSD$Code <- activities[extractMeanSD$Code, 2]
extractMeanSD$Code
names(extractMeanSD)

names(extractMeanSD)<-gsub("Acc", "Accelerometer", names(extractMeanSD))
names(extractMeanSD)[2] = "Activity"
names(extractMeanSD)<-gsub("angle", "Angle", names(extractMeanSD))
names(extractMeanSD)<-gsub("BodyBody", "Body", names(extractMeanSD))
names(extractMeanSD)<-gsub("^f", "Frequency", names(extractMeanSD))
names(extractMeanSD)<-gsub("-freq()", "Frequency", names(extractMeanSD), ignore.case = TRUE)
names(extractMeanSD)<-gsub("gravity", "Gravity", names(extractMeanSD))
names(extractMeanSD)<-gsub("Gyro", "Gyroscope", names(extractMeanSD))
names(extractMeanSD)<-gsub("Mag", "Magnitude", names(extractMeanSD))
names(extractMeanSD)<-gsub("-mean()", "Mean", names(extractMeanSD), ignore.case = TRUE)
names(extractMeanSD)<-gsub("-std()", "STD", names(extractMeanSD), ignore.case = TRUE)
names(extractMeanSD)<-gsub("^t", "Time", names(extractMeanSD))
names(extractMeanSD)<-gsub("tBody", "TimeBody", names(extractMeanSD))

names(extractMeanSD)

# From the data set in step 4, create a second, independent tidy data set with the average of each variable 
# for each activity and each subject. 

Tidy <- extractMeanSD[,-c(1,2)]
str(Tidy)
Tidy %>% summarise_if(is.numeric, mean)  

# Use write.table() to create a txt file which will be uploaded as part of the submission of the project. 
write.table(Tidy, "Tidy.txt", row.name=FALSE)

