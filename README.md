getdata-006-project
===================

Project for Getting and Cleaning Data Course


This repository is for the project for Coursera course - Getting and Cleaning Data. It contains R script for the project - run_analysis.R and code book - CodeBook.md.

Project is to use data collected from the accelerometers from the Samsung Galaxy S smartphone and prepare tidy data set as per the requirement. Data for the project is available at - 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


**Requirements:**
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 

**Assumptions:**
* Data file is already downloaded and extracted. If not, script will download it and extract it.
* User running the script has required permission to create directories and files in working directory.
* Library plyr is installed

**Parameters:**
* dataDir: directory where data is downloaded. Default value -  "UCI HAR Dataset"
* downloadLocation: location to download the data from, default value -  "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
* tempFilename: temp file to use, defualut value - "tempDownloadfile.zip"

* trainDir: directory for training data, default value - dataDir/train
* testDir: directory for test data, default value - dataDirtest
* allDataDir: directory to store merged data, default value - dataDir/all
* tidyDataDir: directory to store final tidy data, default value - dataDir/tidy

* featuresFile: file containing feature list, default value - dataDir/features.txt
* activityLablesFile: file containing activity values, default value - dataDir/activity_labels.txt


**Result:**
* Merged dataset in allDataDir
* Tidy dataset in tidyDataDir


**Steps invloved**
* Scripts check for the data directory. If this folder is does not exists, it downloads the file and extracts the data.
* It reads the data file from test and train directory, namely X_(train|test).txt, Y_(train|test).txt and subject_(train|test).txt. It then merges this file and write the resulted file in all data directory.
* Script reads the features file, and select the features with words - "mean" or "std" in it. From the merged data sets it filters only the selected column and write the file in tidy data folder.
* Script reads the activity file. It merges the activity detail with Y_all file data. And writes the result in tidy data set folder.
* Script uses ddply function to generate dataset for average of each variable for each activity and each subject. It then writes the result back to tidy data folder.

