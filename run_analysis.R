  #
#
# Here's what the script does: 
#
#   1. Checks for/installs required packages and libraries
#   2. Reads in the training data and tidies it up
#   3. Reads in the testing data and tidies it up
#   4. Clips the training and testing data together
#   5. Summarizes the data and writes the txt file
#
# Don't forget to have the original dataset folder (UCI HAR Dataset) in your working directory!
#
# I can see ways to make this more efficient, but this runs smooth and error-free and the week's up!
# 
  #


# check for/install/attach packages and libraries
pkg <- c("dplyr", "reshape2", "stringr")
new.pkg <- pkg[!(pkg %in% installed.packages())]
if (length(new.pkg)) {
  install.packages(new.pkg)
}

library(dplyr)
library(reshape2)
library(stringr)


# get working directory
wd <- getwd()


#               #
# training data #
#               #

# change to the directory where the training data lives
setwd(paste(wd,"/UCI HAR Dataset/train",sep=""))

# read in the training data
xtrain <- read.table("X_train.txt", header=FALSE)
ytrain <- read.csv("y_train.txt", header=FALSE)
subjecttrain <- read.csv("subject_train.txt", header=FALSE)

# read in the labels and features
activity_labels <-read.table(paste(wd,"/UCI HAR Dataset/activity_labels.txt", sep=""),col.names=c("id","activity_name"))
features <- read.csv(paste(wd,"/UCI HAR Dataset/features.txt", sep=""), header=FALSE, sep=" ")
features <- features$V2

# clip together subjects and activity
sub_act <- cbind(subjecttrain, ytrain)

# name the columns of sub_act
names <- c("subject", "activity")
names(sub_act) <- names

# use the features dataset to name the coumns of xtrain
names(xtrain) <- features

# clip together subject, activity, and training data
train2 <- cbind(sub_act, xtrain)

# remove non-alpha characters from column names
names(train2)<-str_replace_all(names(train2), "[[:punct:]]", "")

# select only the columns relevant to the analysis
keep <- c("subject", "activity","mean","std")
kept <- train2[,grep(paste(keep,collapse="|"),names(train2), value=TRUE)]

# rename activity column - go from number to name
tidytrain <-merge(kept, activity_labels, by.x = "activity", by.y = "id")

# add column to designate set as training data; old habit
tidytrain$dataset <- "training"

# reorder columns so the subject and activity lables are up front
tidytrain<-tidytrain[,c(2,83,1,82,3:81)]

# dump data
rm(new.pkg, pkg, xtrain, ytrain, subjecttrain, train2, keep, kept)

#           #
# test data #
#           #


setwd(paste(wd,"/UCI HAR Dataset/test",sep=""))

# read in the testing data
xtest <- read.table("X_test.txt", header=FALSE)
ytest <- read.csv("y_test.txt", header=FALSE)
subjecttest <- read.csv("subject_test.txt", header=FALSE)

# get the labels
activity_labels <-read.table(paste(wd,"/UCI HAR Dataset/activity_labels.txt", sep=""),col.names=c("id","activity_name"))
features <- read.csv(paste(wd,"/UCI HAR Dataset/features.txt", sep=""), header=FALSE, sep=" ")
features <- features$V2

# clip together subjects and activity
sub_act <- cbind(subjecttest, ytest)

# name the columns of sub_act
names <- c("subject", "activity")
names(sub_act) <- names

# use the features dataset to name the coumns of xtest
names(xtest) <- features

# clip together subject, activity, and testing data
test2 <- cbind(sub_act, xtest)

# remove non-alpha characters from column names
names(test2)<-str_replace_all(names(test2), "[[:punct:]]", "")

# select only the columns relevant to the analysis
keep <- c("subject", "activity","mean","std")
kept <- test2[,grep(paste(keep,collapse="|"),names(test2), value=TRUE)]

# rename activity column - go from number to name
tidytest <- merge(kept, activity_labels, by.x = "activity", by.y = "id")

# add column to designate set as testing data
tidytest$dataset <- "testing"

# reorder columns so the subject and activity labels are up front
tidytest <- tidytest[,c(2,83,1,82,3:81)]

# dump data
rm(names, xtest, ytest, subjecttest, test2, keep, kept, sub_act, activity_labels, features)


#                                        #
#  clip together tidytest and tidytrain  #
#                                        #


tidysensor <- rbind(tidytrain, tidytest)

# drop unnecessary columns
tidysensor$dataset <- NULL
tidysensor$activity <- NULL

# dump data
rm(tidytrain, tidytest)


#                               #
# summarize data and write file #
#                               #


tidysensor <- melt(tidysensor, id=c("subject","activity_name"))
tidysensor <- dcast(tidysensor, subject + activity_name ~ variable, mean)

# one final renaming of the columns to conform all tidy-like
# no special characters, and all the measures are suffixed 'Mean'

labels <- c("subject","activityName",paste(names(tidysensor[,3:81]),"Mean",sep=""))
names(tidysensor) <- labels
rm(labels)

# write file to working directory
setwd(wd)
write.table(tidysensor, "tidysensor.txt", row.name=FALSE)
rm(wd)

#
# read data back in as csv using sep = " ", like this:
#   tidysensor < -read.csv("tidysensor.txt", sep=" ") 
#