# gettingcleaningdata
Getting and Cleaning Data Course Project

In this file, a description how the run_analysis.R script works and the code book describing the variables are provided. 

#### Describe run_analysis.R 

Install the dplyr package because it will assist with the data wrangling. The data on which we will perform data wrangling can be found at the link [Samsung Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and it is saved in the folder The in the folder called UCI HAR Dataset. Use the list.files() function to Check if al the files are in the folder. The data is stored in several txt files, so we create a data frame from each of the txt files. Write the names of the columns and view the first three rows of each data frame. Use the bind_rows() and bind_cols() functions, from the dplyr package, to merge the data frames containing the training and test sets, and look at the structure of that data frame. Use the select() function to extract only the measurements on the mean and standard deviation for 
each measurement. The contains() helper function, for the select() function, allows us to focus on the means and standard deviations. The features_info.txt file contains the proper description of the activity names, so we will this information to rename the activities, by wiritng out abbreviations, in the tidy data set. This is achieved by using the gsub() function which replaces all matches of a string, if the parameter is a string vector, it returns a string vector of the same length and with the same attributes; and the elements of the variable names which are not substituted are returned unchanged. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject. Use write.table() to create a txt file which will be uploaded as part of the submission of the project.

#### Code book 

The information below, describing the variables, can be found in the features_inf0.txt file, from the dataset [Samsung Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip):

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using 
a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the 
acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using 
another low pass Butterworth filter with a corner frequency of 0.3 Hz. 


Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ 
and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm 
(tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 



Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, 
fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ    
tGravityAcc-XYZ      
tBodyAccJerk-XYZ       
tBodyGyro-XYZ   
tBodyGyroJerk-XYZ   
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag   
tBodyGyroMag   
tBodyGyroJerkMag   
fBodyAcc-XYZ   
fBodyAccJerk-XYZ   
fBodyGyro-XYZ   
fBodyAccMag    
fBodyAccJerkMag   
fBodyGyroMag   
fBodyGyroJerkMag   

The set of variables that were estimated from these signals are:    
mean(): Mean value    
std(): Standard deviation   
mad(): Median absolute deviation    
max(): Largest value in array   
min(): Smallest value in array   
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.     
iqr(): Interquartile range   
entropy(): Signal entropy    
arCoeff(): Autorregresion coefficients with Burg order equal to 4   
correlation(): correlation coefficient between two signals   
maxInds(): index of the frequency component with largest magnitude   
meanFreq(): Weighted average of the frequency components to obtain a mean frequency   
skewness(): skewness of the frequency domain signal     
kurtosis(): kurtosis of the frequency domain signal    
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.    
angle(): Angle between to vectors.       

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:    

gravityMean   
tBodyAccMean   
tBodyAccJerkMean   
tBodyGyroMean   
tBodyGyroJerkMean   


