## Load library
library(plyr)

## Define script parameters
dataDir <- "UCI HAR Dataset"
downloadLocation <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
tempFilename <- "tempDownloadfile.zip"

trainDir <- paste(dataDir , "/train", sep="")
testDir <- paste(dataDir , "/test", sep="")
allDataDir <- paste(dataDir , "/all", sep="")
tidyDataDir <- paste(dataDir , "/tidy", sep="")

featuresFile <- paste(dataDir , "/features.txt", sep="")

## Check if dataDir exists, if not download and unzip the file
if(!file.exists(dataDir)){
  download.file(downloadLocation, tempFilename, method = "curl")
  unzip(tempFilename)
  
  ## Not deleting temp downloaded file. Just in case if it is needed.
  ## As a best practice it should be deleted
  
}

## Read filenames from testDir
filenames <- dir(testDir, pattern = "*.txt")
filenames <- gsub("_test.txt","", filenames)

if(file.exists(allDataDir)){
 print("Dirctory to store merge data exists. Please delete it to continue") 
} else if(file.exists(tidyDataDir)){
  print("Dirctory to store tidy data exists. Please delete it to continue")
} else{
  dir.create(allDataDir)
  dir.create(tidyDataDir)
  
  ## Step 1:
  ## Loop each file in test and train and merge
  ## Skip testing if file exists or not
  
  for(file in filenames){
    
    testFileName <- paste(file, "_test.txt", sep="")
    testFileName <- paste(testDir, testFileName, sep="/")
    trainFileName <- paste(file, "_train.txt", sep="")
    trainFileName <- paste(trainDir, trainFileName, sep="/")
    allFileName <- paste(file, "_all.txt", sep="")
    allFileName <- paste(allDataDir, allFileName, sep="/")
    
    data<-read.table(trainFileName)
    write.table(data,file=allFileName,row.names =F, col.names = F)
    
    data <- read.table(testFileName)
    write.table(data,file=allFileName,row.names =F, col.names = F, append = T)
    
  }
  ##End of Step 1
  
  ##Step 2:
  ## Read only the mean and std of measurements
  
  ## Read the features file and find the columns to be selected
  featuresTable <- read.table(featuresFile)
  selectedFeatures <- (grepl("mean", featuresTable[,2]) | grepl("std", featuresTable[,2]))
  selectedFeatures <- featuresTable[selectedFeatures,2]
  
  #read all data
  allMeasureFile <- paste(allDataDir, "X_all.txt", sep="/" )
  allData <- read.table(allMeasureFile)
  ## attach colnames
  colnames(allData) <-featuresTable[,2]
  ## filter columns
  allData1 <- allData[,selectedFeatures]
  ## write the file back to tidy dir
  tidyDataFile <- paste(tidyDataDir, "X_tidy.txt", sep="/")
  write.table(allData1,file=tidyDataFile,row.names =F, col.names = T)
  
  
  ##Step 3:
  ## use activity names to name the activities
  
  ## Read the activity_labels file
  activityLablesFile <- paste(dataDir, "activity_labels.txt", sep="/")
  activityLabels <- read.table(activityLablesFile)
  colnames(activityLabels) <- c("actId", "activity")
  
  #read all data
  allActivityFile <- paste(allDataDir, "Y_all.txt", sep="/" )
  allActivityData <- read.table(allActivityFile)
  ## attach colnames
  colnames(allActivityData) <-c("actId")
  ## merge for activity details
  activityMerge <- merge(allActivityData, activityLabels)
  ##activityMerge <- activityMerge[,2]
  
  
  ## write the file back to tidy dir
  tidyActivityFile <- paste(tidyDataDir, "Y_tidy.txt", sep="/")
  write.table(activityMerge,file=tidyActivityFile,row.names =F, col.names = T)
  
  ##Step 4: provide labels in data set
  
  ##read all data
  allSubjectFile <- paste(allDataDir, "subject_all.txt", sep="/" )
  allSubjectData <- read.table(allSubjectFile)
  ## attach colnames
  colnames(allSubjectData) <-c("subject")
  ## write the file back to tidy dir
  tidySubjectFile <- paste(tidyDataDir, "subject_tidy.txt", sep="/")
  write.table(allSubjectData,file=tidySubjectFile,row.names =F, col.names = T)
  
  
  ##Step 5: create tidy data set with the average of each variable 
  ##        for each activity and each subject. 
  
  ## combine X & Y, created in step 2 &3
  allData2 <- cbind(activityMerge,allData1)
  allData2 <- cbind(allSubjectData,allData2)
  
  ## use ddply to split, combine and transform the data - subject, activity wise

  tidySummary <- ddply(allData2, .(subject,activity), colwise(mean))
  tidySummaryFile <- paste(tidyDataDir, "summary_tidy.txt", sep="/")
  write.table(tidySummary,file=tidySummaryFile,row.names =F, col.names = T)
  
}


 
