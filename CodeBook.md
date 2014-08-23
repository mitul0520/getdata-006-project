Code book for project - Getting and Cleaning Data
===================================================


After running the script, data directory will have following subfolders:

1. test - has original test data
2. train - has original training data
3. all - has merged data from test and training data
4. tidy - has tidy data, as per the requirement of the project


Following are the important files in the folder
* activity_labels.txt - file containing activity code and the activity description
* features.txt - file containing the list of measurement caputred
* subject_(train|test|all).txt - subject data for train, test and merged data
* subject_tidy.txt - subject data with header for merged data
* Y_(train|test|all).txt - set of activities id for training, test and merged data
* Y_tidy.txt - set of activities description with header for merged data
* X_(train|test|all).txt - file containing all measurements for training, test and merged data.
* X_tidy.txt - file containing only mean and std measurements for merged data with header.


Measurements are explained in features_info and features.txt file.

Following parameters are used for the script
* dataDir: directory where data is downloaded. Default value -  "UCI HAR Dataset"
* downloadLocation: location to download the data from, default value -  "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
* tempFilename: temp file to use, defualut value - "tempDownloadfile.zip"

* trainDir: directory for training data, default value - dataDir/train
* testDir: directory for test data, default value - dataDirtest
* allDataDir: directory to store merged data, default value - dataDir/all
* tidyDataDir: directory to store final tidy data, default value - dataDir/tidy

* featuresFile: file containing feature list, default value - dataDir/features.txt
* activityLablesFile: file containing activity values, default value - dataDir/activity_labels.txt

Following is the list of the measurements written in the summary file:


* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* fBodyAcc-meanFreq()-X
* fBodyAcc-meanFreq()-Y
* fBodyAcc-meanFreq()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyAccJerk-meanFreq()-X
* fBodyAccJerk-meanFreq()-Y
* fBodyAccJerk-meanFreq()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyGyro-meanFreq()-X
* fBodyGyro-meanFreq()-Y
* fBodyGyro-meanFreq()-Z
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyAccMag-meanFreq()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyAccJerkMag-meanFreq()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroMag-meanFreq()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()
* fBodyBodyGyroJerkMag-meanFreq()
