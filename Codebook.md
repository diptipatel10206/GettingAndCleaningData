#Human Activity Recognition Using Smartphones
##Coursera Tidy Dataset

##Study Design 

Human Activity Recognition Using Smartphones Tidy Dataset contains the *average* of each mean() and std() of the triaxial readings.  

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
>Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, 
>STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded 
>accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a 
>constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The 
>obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was 
>selected for generating the training data and 30% the test data. 
>
>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then 
>sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor 
>acceleration signal, which has gravitational and body motion components, was separated using a 
>Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to 
>have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From 
>each window, a vector of features was obtained by calculating variables from the time and frequency 
>domain. See 'features_info.txt' for more details. 


##Code Book 

The dataset file is *HumanActRecog.csv*.

##Description of the measurements:
>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals 
>tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a 
>constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth 
>filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then 
>separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using 
>another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk 
>signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional 
>signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, 
>tBodyGyroMag, tBodyGyroJerkMag). 
>
>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, 
>fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' 
>to indicate frequency domain signals). 
>
>These signals were used to estimate variables of the feature vector for each pattern:  
>'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


##Steps taken to generate the final tidy dataset
1) Read the activity labels and features into R

2) Cleaned feature names

3) Read the subject, train and test data sets - ignore the Inertial Signal folders

4) Add column names to activity, subjects and both data sets 

5) Extract the mean and std measurements from both data sets

6) Merge/combine the subjects, activities, means and stds for each test/train data set

7) Merge/combine the test and train data sets <- tidy data set 1

8) Group by subject and activity then calculate the average of each feature (variable)

9) write out final tidy data set in csv


###Variables:

subjects - Identifies the subject/volunteer

    Values: 1-30
	
activity - The actual activity of the subject/volunteer for each reading

    Values:   WALKING
  
		      WALKING_UPSTAIRS
		      
		      WALKING_DOWNSTAIRS
		      
		      SITTING
		      
		      STANDING
		      
		      LAYING

*The rest of the 79 variables represent the *average* of the mean or standard deviation of each the different 
axial readings.  Each reading value is less than 1.0*

tBodyAccmeanX 
		
tBodyAccmeanY

tBodyAccmeanZ

tGravityAccmeanX

tGravityAccmeanY

tGravityAccmeanZ

tBodyAccJerkmeanX

tBodyAccJerkmeanY

tBodyAccJerkmeanZ

tBodyGyromeanX

tBodyGyromeanY

tBodyGyromeanZ

tBodyGyroJerkmeanX

tBodyGyroJerkmeanY

tBodyGyroJerkmeanZ

tBodyAccMagmean

tGravityAccMagmean

tBodyAccJerkMagmean

tBodyGyroMagmean

tBodyGyroJerkMagmean

fBodyAccmeanX

fBodyAccmeanY

fBodyAccmeanZ

fBodyAccmeanFreqX

fBodyAccmeanFreqY

fBodyAccmeanFreqZ

fBodyAccJerkmeanX

fBodyAccJerkmeanY

fBodyAccJerkmeanZ

fBodyAccJerkmeanFreqX

fBodyAccJerkmeanFreqY

fBodyAccJerkmeanFreqZ

fBodyGyromeanX

fBodyGyromeanY

fBodyGyromeanZ

fBodyGyromeanFreqX

fBodyGyromeanFreqY

fBodyGyromeanFreqZ

fBodyAccMagmean

fBodyAccMagmeanFreq

fBodyBodyAccJerkMagmean

fBodyBodyAccJerkMagmeanFreq

fBodyBodyGyroMagmean

fBodyBodyGyroMagmeanFreq

fBodyBodyGyroJerkMagmean

fBodyBodyGyroJerkMagmeanFreq

tBodyAccstdX

tBodyAccstdY

tBodyAccstdZ

tGravityAccstdX

tGravityAccstdY

tGravityAccstdZ

tBodyAccJerkstdX

tBodyAccJerkstdY

tBodyAccJerkstdZ

tBodyGyrostdX

tBodyGyrostdY

tBodyGyrostdZ

tBodyGyroJerkstdX

tBodyGyroJerkstdY

tBodyGyroJerkstdZ

tBodyAccMagstd

tGravityAccMagstd

tBodyAccJerkMagstd

tBodyGyroMagstd

tBodyGyroJerkMagstd

fBodyAccstdX

fBodyAccstdY

fBodyAccstdZ

fBodyAccJerkstdX

fBodyAccJerkstdY

fBodyAccJerkstdZ

fBodyGyrostdX

fBodyGyrostdY

fBodyGyrostdZ

fBodyAccMagstd

fBodyBodyAccJerkMagstd

fBodyBodyGyroMagstd

fBodyBodyGyroJerkMagstd

