## install.packages("dplyr")
library(dplyr)

## install.packages("reshape2")
library(reshape2)

## Create Directory for the data to be downloaded
if(!file.exists("./uci_data")){dir.create("./uci_data")}

## Store the root working directory
initial_wd<-getwd()

## set data url
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

##download the file if it does not exist in the folder ./uci_data/UCIData.zip
if(!file.exists("./uci_data/UCIData.zip")){download.file(fileUrl,destfile="./uci_data/UCIData.zip",method="curl")}

##unzip the file
unzip(zipfile="./uci_data/UCIData.zip",exdir="./uci_data")

## get all the paths of the files uci_datain the data
root_data_path <- file.path("./uci_data" , "UCI HAR Dataset")
setwd(root_data_path)
#files<-list.files(recursive=TRUE)
#files

## Read the test and training data
x.test <- read.table("test/X_test.txt")
x.train <- read.table("train/X_train.txt")
x <- rbind(x.test, x.train)

## Remove unnacessary data tables
rm(x.test)
rm(x.train)

##Read the subject data
sub.test <- read.table("test/subject_test.txt")
sub.train <- read.table("train/subject_train.txt")
sub <- rbind(sub.test, sub.train)

## Remove unnacessary data tables
rm(sub.test)
rm(sub.train)

##Read activity data
y.test <- read.table("test/y_test.txt")
y.train <- read.table("train/y_train.txt")
y <- rbind(y.test, y.train)

rm(y.test)
rm(y.train)

## Extract only the mean and s.d for each measurement 
features <- read.table('features.txt')
mean.sd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
x.mean.sd <- x[, mean.sd]

## Give descriptive names for all the columns
names(x.mean.sd) <- features[mean.sd, 2]
names(x.mean.sd) <- tolower(names(x.mean.sd)) 
names(x.mean.sd) <- gsub("\\(|\\)", "", names(x.mean.sd))

## Read the activity names
activity <- read.table('activity_labels.txt')
activity[, 2] <- tolower(as.character(activity[, 2]))

## Add column names for y and sub
y[, 1] = activity[y[, 1], 2]
colnames(y) <- 'activity'
colnames(sub) <- 'subject'

## Reset the working directory back to original value
setwd(initial_wd)

## Generate UCI_CleanData.txt which contains the full data in a better organized way
data <- cbind(sub, x.mean.sd, y)
str(data)
write.table(data, 'UCI_CleanData.txt', row.names = F)

## Creating a final tidy dataset with average of the variables for each activity and for every subject
data.tidy <- aggregate(x=data, by=list(activities=data$activity, sub=data$subject), FUN=mean)
data.tidy <- data.tidy[, !(colnames(data.tidy) %in% c("sub", "activity"))]
str(data.tidy)
write.table(data.tidy, 'UCI_TidyData.txt', row.names = F)
