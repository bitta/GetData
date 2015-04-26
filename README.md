# Description of run_analysis.R

This markdown document described how the run_analysis code functions.

The code book for the analsysis is called CodeBook.md and can be found in this repo.  It provides information for  understanding the variables and associated measurements.

## run_analysis.R

The original data used for the analysis is [Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).  The code book for this original dataset can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

This R script reads the Samsung data (UCI HAR Dataset) from your working directory and creates a tidy dataset that contains the mean for each subject and each activity for each Samsung feature that has to do with mean or standard deviation.

The script has been heavily commented so that other programmers can understand and make sense of the process.

Here are the steps that the script takes to complete the task:

1. Checks for/installs required packages and libraries
2. Training data, features, and labels are read in
3. Training data elements are clipped together and renames some columns
4. Non-alphanumeric characters are removed from column names and irrelevant columns are dropped
5. Columns are reordered for tidiness/readability
6. Steps 2 through 5 are repeated for the testing data
7. Training and testing data are clipped together
5. The data is summarized and written to the tidysensor.txt text file

**IMPORTANT:** Don't forget to have the original, unaltered Samsung dataset folder (UCI HAR Dataset) in your working directory!

Programmer's note:  I can see ways to make this more efficient, but this runs smooth and error-free and time's up!