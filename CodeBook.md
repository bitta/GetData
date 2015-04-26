## Code Book

The original data used for the analysis is [Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).  The code book for this original dataset can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).


This code book is based on the original Samsung code book.  Modifications and additions have been made where appropriate.  The description of how the data was collected was left intact, but variables, variable names, and variable descriptions have been altered to reflect the finished data set called "tidysensor.txt."

**Feature Selection**

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

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

mean(): Mean value for repetitions by each subject
std(): Mean of the standard deviation for repetitions by each subject
meanFreq(): Weighted average of the frequency components to obtain a mean frequency for repetitions by each subject


**Variables in tidysensor.txt**

Here's a complete list of variables in the dataset, along with their descriptions:

subject   
	Integer (1-30)  
                     
activityName   
	Factor w/6 levels:
		WALKING
		WALKING_UPSTAIRS
		WALKING_DOWNSTAIRS
		SITTING
		STANDING
		LAYING                 

The following variables are features measured in Hz; they are of Numeric type:

tBodyAccmeanXMean                
tBodyAccmeanYMean               
tBodyAccmeanZMean                
tBodyAccstdXMean                
tBodyAccstdYMean                 
tBodyAccstdZMean                
tGravityAccmeanXMean            
tGravityAccmeanYMean            
tGravityAccmeanZMean             
tGravityAccstdXMean             
tGravityAccstdYMean              
tGravityAccstdZMean             
tBodyAccJerkmeanXMean           
tBodyAccJerkmeanYMean           
tBodyAccJerkmeanZMean            
tBodyAccJerkstdXMean            
tBodyAccJerkstdYMean             
tBodyAccJerkstdZMean            
tBodyGyromeanXMean               
tBodyGyromeanYMean              
tBodyGyromeanZMean              
tBodyGyrostdXMean               
tBodyGyrostdYMean                
tBodyGyrostdZMean               
tBodyGyroJerkmeanXMean          
tBodyGyroJerkmeanYMean          
tBodyGyroJerkmeanZMean           
tBodyGyroJerkstdXMean           
tBodyGyroJerkstdYMean            
tBodyGyroJerkstdZMean           
tBodyAccMagmeanMean              
tBodyAccMagstdMean              
tGravityAccMagmeanMean          
tGravityAccMagstdMean           
tBodyAccJerkMagmeanMean          
tBodyAccJerkMagstdMean          
tBodyGyroMagmeanMean             
tBodyGyroMagstdMean             
tBodyGyroJerkMagmeanMean        
tBodyGyroJerkMagstdMean         
fBodyAccmeanXMean                
fBodyAccmeanYMean               
fBodyAccmeanZMean                
fBodyAccstdXMean                
fBodyAccstdYMean                 
fBodyAccstdZMean                
fBodyAccmeanFreqXMean            
fBodyAccmeanFreqYMean           
fBodyAccmeanFreqZMean            
fBodyAccJerkmeanXMean           
fBodyAccJerkmeanYMean
fBodyAccJerkmeanZMean           
fBodyAccJerkstdXMean            
fBodyAccJerkstdYMean            
fBodyAccJerkstdZMean            
fBodyAccJerkmeanFreqXMean       
fBodyAccJerkmeanFreqYMean       
fBodyAccJerkmeanFreqZMean       
fBodyGyromeanXMean               
fBodyGyromeanYMean              
fBodyGyromeanZMean               
fBodyGyrostdXMean               
fBodyGyrostdYMean                
fBodyGyrostdZMean               
fBodyGyromeanFreqXMean          
fBodyGyromeanFreqYMean          
fBodyGyromeanFreqZMean          
fBodyAccMagmeanMean             
fBodyAccMagstdMean              
fBodyAccMagmeanFreqMean         
fBodyBodyAccJerkMagmeanMean      
fBodyBodyAccJerkMagstdMean      
fBodyBodyAccJerkMagmeanFreqMean  
fBodyBodyGyroMagmeanMean        
fBodyBodyGyroMagstdMean         
fBodyBodyGyroMagmeanFreqMean    
fBodyBodyGyroJerkMagmeanMean     
fBodyBodyGyroJerkMagstdMean     
fBodyBodyGyroJerkMagmeanFreqMean