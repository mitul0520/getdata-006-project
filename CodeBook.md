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

