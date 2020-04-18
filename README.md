# gettingcleaningdata
Getting and Cleaning Data Course Project

In this file, a description how the run_analysis.R script works and the code book describing the variables are provided. 

#### Describe the run_analysis.R script

Install the dplyr package because it will assist with the data wrangling. The data on which we will perform data wrangling can be found at the link [Samsung Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and it is saved in the folder The in the folder called UCI HAR Dataset. Use the list.files() function to Check if al the files are in the folder. The data is stored in several txt files, so we create a data frame from each of the txt files. Write the names of the columns and view the first three rows of each data frame. Use the bind_rows() and bind_cols() functions, from the dplyr package, to merge the data frames containing the training and test sets, and look at the structure of that data frame. Use the select() function to extract only the measurements on the mean and standard deviation for 
each measurement. The contains() helper function, for the select() function, allows us to focus on the means and standard deviations. The features_info.txt file contains the proper description of the activity names, so we will this information to rename the activities, by wiritng out abbreviations, in the tidy data set. This is achieved by using the gsub() function which replaces all matches of a string, if the parameter is a string vector, it returns a string vector of the same length and with the same attributes; and the elements of the variable names which are not substituted are returned unchanged. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject. Use write.table() to create a txt file which will be uploaded as part of the submission of the project.

