# run_analysis.R
# Getting and Cleaning Data Course Project 

# Preliminary: 

# Get the data.  it's in a zip file, so download contents

# Actual Code

# Set working directory

setwd("C:/coursera")

# 1. Read the data files into R:

subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

# 2. Merge all that data into one dataset
xall <- rbind(xtrain, xtest)
yall <- rbind(ytrain, ytest)
suball <- rbind(subtrain, subtest)
allofit <- cbind(suball, yall, xall)

# cleaning to save memory

rm(xtest,ytest,xtrain,ytrain,subtrain,subtest,xall,yall,suball)  

# 3. Name the measurement columns after the feature names, and give names to the id columns

featureNames <- as.character(features[,2])
newCols <- c("subject", "activity", featureNames)
colnames(allofit) <- newCols

# 4. Create a new data frame whose measurement columns contain only mean and st. dev features

onlyMeans <- grep("mean()", colnames(allofit))
onlyStDevs <- grep("std()", colnames(allofit))
revisedColumns <- c(onlyMeans, onlyStDevs)
revisedColumns2 <- sort(revisedColumns) 
newDataFrame <- allofit[, c(1,2,revisedColumns2)]

# remove the meanFreq columns

newDataFrame2 <- newDataFrame[, !grepl("Freq", colnames(newDataFrame))]

# clean and save memory

rm(newDataFrame, allofit) 

# 5. Trim the rows to the 180 needed to show mean values for each subject-activity pair

tidyframe <- data.frame()
for (i in 1:30) {
        subj<- subset(newDataFrame2,subject==i)
        for (j in 1:6){
                actv<- subset(subj, activity==j)
                myresult<-as.vector(apply(actv,2,mean))
                tidyframe<-rbind(tidyframe,myresult) 
        }
        
}

# 6. Output the data to "Data.txt"

colnames(tidyframe)<-colnames(newDataFrame2)
write.table(tidyframe, "Data.txt", sep = ",")



