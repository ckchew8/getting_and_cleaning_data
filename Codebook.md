Getting and Cleaning Data Project Codebook
===


# Project Description:
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

 [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project: 

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

 You should create one R script called run_analysis.R that does the following. 
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Study Design & Data Processing:

## Collection of Raw Data: 
(The following section was extracted from "./ UCI HAR Dataset/README.txt" & "./ UCI HAR Dataset/features_info.txt" without quotes of the original dataset, kindly skip to "Creating The Tidy Data" section if you've gone through the listed files). This section is meant to document the codebook with information of the raw data set. 



### Human Activity Recognition Using Smartphones Dataset Version 1.0: 
By: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Universita degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
[www.smartlab.ws](www.smartlab.ws)  

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

### Notes on the original (raw) data:  
For each record it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.  
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment.

The dataset includes the following files:    
* 'README.txt'  
* 'features_info.txt': Shows information about the variables used on the feature vector.  
* 'features.txt': List of all features.  
* 'activity_labels.txt': Links the class labels with their activity name.  
* 'train/X_train.txt': Training set.  
* 'train/y_train.txt': Training labels.  
* 'test/X_test.txt': Test set.  
* 'test/y_test.txt': Test labels.    

The following files are available for the train and test data. Their descriptions are equivalent.   
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.   
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.   
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.   
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.   

Additional Notes:   
* Features are normalized and bounded within [-1,1].  
* Each feature vector is a row on the text file.  

For more information about this dataset contact: activityrecognition@smartlab.ws  

### License:
* Use of this dataset in publications must be acknowledged by referencing the following publication [1]
* [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012  
* This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
* Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.  



### Feature Selection:   
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
mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range   
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal   
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:  
gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  

The complete list of variables of each feature vector is available in "./ UCI HAR Dataset/ features.txt" without quotes.  

# Creating The Tidy Data:  

## Guide To Create The Tidy Data File:  
The detailed guide of the exact operation of the code to create tidy data is available in the file README.md. The following depicts the high level implementation of the run_analysis.R code which takes in the raw data described previously, cleans and outputs a tidy dataset:  
1)	Begin by copying the run_analysis.R script into your working directory and execute the script (advisable to execute in RStudio for ease of checking tidy data file).  
2)	The script checks if current working directory contains the folder "UCI HAR Dataset" without quotes, if present proceed to next step, else the code will download the dataset and unzip in the current working directory.  
3)	Read in all Subject, Features and Activity data set from both "./UCI HAR Dataset/test" without quotes and "./UCI HAR Dataset/train" without quotes folder. The "./UCI HAR Dataset/features.txt" without quotes file is also read in to be used as column names for the features dataset.  
4)	Merge the datasets from 3) via row and column bind and stores in a new data frame.  
5)	Extract only measurements with mean and standard deviation using grep command from the merged data frame.  
6)	Reads in "./UCI HAR Dataset/activity_labels.txt" to be used to replace the activity IDs which are numeric values in the "activity" column of the merged data in 4) with a more significant activity label which are in character format.  
7)	Then, substitute the column names with more significant names instead of the abbreviated form provided in the raw dataset. Additional formatting such as elimination of "-",")" and "(" without quotes in variable. The "activity" column was also converted from character to factor. Step 7) is done basically to conform to the principles of tidy data.  
8)	Using the cleaned data in 7), we then compute the average for each variable for each subject and activity which was achieved via the aggregate command. The result of this computation is saved as "Tidy_Data.txt" without quotes in the current working directory.  
9)	An additional step is done to reimport the "Tidy_Data.txt" without quotes via the read.table command and the dataset was inspected using the View command. The expectation for a tidy data is that each column represents a variable and each row is used to hold the value of each observation. The variable names should not consists of any symbols such as "-", "(", ")" & "." without quotes and should have lower casing. In addition, the variable names should hold meaningful names.   

## Variables In Tidy_Data.txt:
* Dimensions of the dataset: 180 rows and 68 columns.
* No of variables : 68 (1 subject identifier, 1 activity ID & 66 features measurements)
* Summary of the data:  
  The tidy data contains a variable to hold the subject who carried out the experiment and 1 variable for its activity label. 66 means and standard deviation features measurements were extracted and averaged from the original raw dataset. Note that Features are normalized and bounded within [-1,1] and each feature vector is a row on the text file. Since the measurements are normalized, hence no unit of measurements are applicable and will be omitted.  The following lists all the variables present in the "Tidy_Data.txt" without quotes file:  

		 [1] subject                                    
		 [2] activity                                   
		 [3] timebodyaccelerometermeanx                 
		 [4] timebodyaccelerometermeany                 
		 [5] timebodyaccelerometermeanz                 
		 [6] timebodyaccelerometerstdx                  
		 [7] timebodyaccelerometerstdy                  
		 [8] timebodyaccelerometerstdz                  
		 [9] timegravityaccelerometermeanx              
		[10] timegravityaccelerometermeany              
		[11] timegravityaccelerometermeanz              
		[12] timegravityaccelerometerstdx               
		[13] timegravityaccelerometerstdy               
		[14] timegravityaccelerometerstdz               
		[15] timebodyaccelerometerjerkmeanx             
		[16] timebodyaccelerometerjerkmeany             
		[17] timebodyaccelerometerjerkmeanz             
		[18] timebodyaccelerometerjerkstdx              
		[19] timebodyaccelerometerjerkstdy              
		[20] timebodyaccelerometerjerkstdz              
		[21] timebodygyroscopemeanx                     
		[22] timebodygyroscopemeany                     
		[23] timebodygyroscopemeanz                     
		[24] timebodygyroscopestdx                      
		[25] timebodygyroscopestdy                      
		[26] timebodygyroscopestdz                      
		[27] timebodygyroscopejerkmeanx                 
		[28] timebodygyroscopejerkmeany                 
		[29] timebodygyroscopejerkmeanz                 
		[30] timebodygyroscopejerkstdx                  
		[31] timebodygyroscopejerkstdy                  
		[32] timebodygyroscopejerkstdz                  
		[33] timebodyaccelerometermagnitudemean         
		[34] timebodyaccelerometermagnitudestd          
		[35] timegravityaccelerometermagnitudemean      
		[36] timegravityaccelerometermagnitudestd       
		[37] timebodyaccelerometerjerkmagnitudemean     
		[38] timebodyaccelerometerjerkmagnitudestd      
		[39] timebodygyroscopemagnitudemean             
		[40] timebodygyroscopemagnitudestd              
		[41] timebodygyroscopejerkmagnitudemean         
		[42] timebodygyroscopejerkmagnitudestd          
		[43] frequencybodyaccelerometermeanx            
		[44] frequencybodyaccelerometermeany            
		[45] frequencybodyaccelerometermeanz            
		[46] frequencybodyaccelerometerstdx             
		[47] frequencybodyaccelerometerstdy             
		[48] frequencybodyaccelerometerstdz             
		[49] frequencybodyaccelerometerjerkmeanx        
		[50] frequencybodyaccelerometerjerkmeany        
		[51] frequencybodyaccelerometerjerkmeanz        
		[52] frequencybodyaccelerometerjerkstdx         
		[53] frequencybodyaccelerometerjerkstdy         
		[54] frequencybodyaccelerometerjerkstdz         
		[55] frequencybodygyroscopemeanx                
		[56] frequencybodygyroscopemeany                
		[57] frequencybodygyroscopemeanz                
		[58] frequencybodygyroscopestdx                 
		[59] frequencybodygyroscopestdy                 
		[60] frequencybodygyroscopestdz                 
		[61] frequencybodyaccelerometermagnitudemean    
		[62] frequencybodyaccelerometermagnitudestd     
		[63] frequencybodyaccelerometerjerkmagnitudemean
		[64] frequencybodyaccelerometerjerkmagnitudestd 
		[65] frequencybodygyroscopemagnitudemean        
		[66] frequencybodygyroscopemagnitudestd         
		[67] frequencybodygyroscopejerkmagnitudemean    
		[68] frequencybodygyroscopejerkmagnitudestd

The detailed information for all variables in the "Tidy_Data.txt" file is as follows:

**subject** : subject identifier, 30 subjects in total    
Class       : integer    
Range       : 1 to 30    
  
**activity**: activity labels translated from the raw data with the following convention    
Class       : factor  
Levels      :	  
		1 = WALKING  
		2 = WALKING_UPSTAIRS  
		3 = WALKING_DOWNSTAIRS  
		4 = SITTING  
		5 = STANDING  
		6 = LAYING  

The subsequent 66 variables are feature measurements:  
	
**timebodyaccelerometermeanx:**   
Class : numeric  
Range : 0.22159824394 to 0.3014610196  
Mean  : 0.274302742245795  
Median: 0.276964936014357  
 
**timebodyaccelerometermeany:**   
Class : numeric  
Range : -0.0405139534294 to -0.00130828765170213  
Mean  : -0.0178755238674415  
Median: -0.0172620496866845  
 
**timebodyaccelerometermeanz:**   
Class : numeric  
Range : -0.152513899520833 to -0.07537846886  
Mean  : -0.109163815804519  
Median: -0.10819133976087  
 
**timebodyaccelerometerstdx:**   
Class : numeric  
Range : -0.996068635384615 to 0.626917070512821  
Mean  : -0.557690076404401  
Median: -0.752561958811552  
 
**timebodyaccelerometerstdy:**   
Class : numeric  
Range : -0.990240946666667 to 0.616937015333333  
Mean  : -0.460462635378301  
Median: -0.508965351555332  
  
**timebodyaccelerometerstdz:**   
Class : numeric  
Range : -0.987658662307692 to 0.609017879074074  
Mean  : -0.575560246148636  
Median: -0.651757405423516  
 
**timegravityaccelerometermeanx:**   
Class : numeric  
Range : -0.680043155060241 to 0.974508732  
Mean  : 0.697477505882702  
Median: 0.920838883913399  
   
**timegravityaccelerometermeany:**   
Class : numeric  
Range : -0.479894842941176 to 0.956593814210526  
Mean  : -0.0162128361521394  
Median: -0.127822394803259  
   
**timegravityaccelerometermeanz:**   
Class : numeric  
Range : -0.49508872037037 to 0.9578730416  
Mean  : 0.0741278709325255  
Median: 0.0238412209314665  
 
**timegravityaccelerometerstdx:**   
Class : numeric  
Range : -0.996764227384615 to -0.829554947808219  
Mean  : -0.96375253077172  
Median: -0.9694656827608  
 
**timegravityaccelerometerstdy:**   
Class : numeric  
Range : -0.99424764884058 to -0.643578361424658  
Mean  : -0.952429559765945  
Median: -0.959033035282651  

**timegravityaccelerometerstdz:**   
Class : numeric  
Range : -0.990957249538462 to -0.610161166287671  
Mean  : -0.93640104156585  
Median: -0.945002365380835  
 
**timebodyaccelerometerjerkmeanx:**   
Class : numeric  
Range : 0.0426880986186441 to 0.130193043809524  
Mean  : 0.0794735599203562  
Median: 0.07639996928242  
 
**timebodyaccelerometerjerkmeany:**   
Class : numeric  
Range : -0.0386872111282051 to 0.056818586275  
Mean  : 0.00756520996888408  
Median: 0.0094697935989457  
 
**timebodyaccelerometerjerkmeanz:**   
Class : numeric  
Range : -0.0674583919268293 to 0.0380533591627451  
Mean  : -0.00495340328183431  
Median: -0.0038606227443805  
 
**timebodyaccelerometerjerkstdx:**   
Class : numeric    
Range : -0.994604542264151 to 0.544273037307692  
Mean  : -0.594946699510964  
Median: -0.810364617825977  
 
**timebodyaccelerometerjerkstdy:**   
Class : numeric  
Range : -0.989513565652174 to 0.355306716915385  
Mean  : -0.565414714340423  
Median: -0.775640254646154  
 
**timebodyaccelerometerjerkstdz:**   
Class : numeric  
Range : -0.993288313333333 to 0.0310157077775926  
Mean  : -0.735957689241115  
Median: -0.883656741553846  
 
**timebodygyroscopemeanx:**   
Class : numeric  
Range : -0.205775427307692 to 0.19270447595122  
Mean  : -0.0324371599031218  
Median: -0.0287050671386676  

**timebodygyroscopemeany:**   
Class : numeric  
Range : -0.204205356087805 to 0.0274707556666667  
Mean  : -0.0742595723452297  
Median: -0.073182294529017  
 
**timebodygyroscopemeanz:**   
Class : numeric  
Range : -0.0724546025804878 to 0.179102058245614  
Mean  : 0.0874446468695526  
Median: 0.0851214588562313  
 
**timebodygyroscopestdx:**   
Class : numeric  
Range : -0.994276591304348 to 0.267657219333333  
Mean  : -0.691639902777431  
Median: -0.78899182266  
 
**timebodygyroscopestdy:**   
Class : numeric  
Range : -0.994210471914894 to 0.476518714444444  
Mean  : -0.653302029911363  
Median: -0.801683738898021  
 
**timebodygyroscopestdz:**     
Class : numeric    
Range : -0.985538363333333 to 0.564875818162963    
Mean  : -0.616435294332593    
Median: -0.8010010881621    
 
**timebodygyroscopejerkmeanx:**   
Class : numeric  
Range : -0.157212539189362 to -0.0220916265065217  
Mean  : -0.0960567959204382  
Median: -0.0986833593296509  
 
**timebodygyroscopejerkmeany:**   
Class : numeric  
Range : -0.0768089915604167 to -0.0132022768074468  
Mean  : -0.0426927819752453  
Median: -0.0411175370152026  
 
**timebodygyroscopejerkmeanz:**   
Class : numeric  
Range : -0.0924998531372549 to -0.00694066389361702  
Mean  : -0.0548018825799509  
Median: -0.0534296148538262  

**timebodygyroscopejerkstdx:**   
Class : numeric  
Range : -0.99654254057971 to 0.179148649684615  
Mean  : -0.703632714557601  
Median: -0.839648774710345 

**timebodygyroscopejerkstdy:**   
Class : numeric  
Range : -0.997081575652174 to 0.295945926186441  
Mean  : -0.763551835158898  
Median: -0.89417791168862  
 
**timebodygyroscopejerkstdz:**   
Class : numeric  
Range : -0.995380794637681 to 0.193206498960417  
Mean  : -0.709559184010004  
Median: -0.860964365777116  
 
**timebodyaccelerometermagnitudemean:**   
Class : numeric  
Range : -0.986493196666667 to 0.644604325128205  
Mean  : -0.49728966685894  
Median: -0.482883603047945  
 
**timebodyaccelerometermagnitudestd:**   
Class : numeric  
Range : -0.986464542615385 to 0.428405922622222  
Mean  : -0.543908670845839  
Median: -0.607428117013143  
 
**timegravityaccelerometermagnitudemean:**   
Class : numeric  
Range : -0.986493196666667 to 0.644604325128205  
Mean  : -0.49728966685894  
Median: -0.482883603047945  
 
**timegravityaccelerometermagnitudestd:** 
Class : numeric  
Range : -0.986464542615385 to 0.428405922622222  
Mean  : -0.543908670845839  
Median: -0.607428117013143  
 
**timebodyaccelerometerjerkmagnitudemean:**   
Class : numeric  
Range : -0.99281471515625 to 0.434490400974359  
Mean  : -0.607929591545179  
Median: -0.816778554069231  
   
**timebodyaccelerometerjerkmagnitudestd:**   
Class : numeric  
Range : -0.994646916811594 to 0.450612065720513  
Mean  : -0.584175609709768  
Median: -0.801379344123077  
 
**timebodygyroscopemagnitudemean:**   
Class : numeric  
Range : -0.980740846769231 to 0.418004608615385  
Mean  : -0.565163077212988  
Median: -0.655079846599804  
   
**timebodygyroscopemagnitudestd:**   
Class : numeric  
Range : -0.981372675614035 to 0.299975979851852  
Mean  : -0.630394720315622  
Median: -0.742044287036862
 
**timebodygyroscopejerkmagnitudemean:**   
Class : numeric  
Range : -0.997322526811594 to 0.0875816618205128  
Mean  : -0.736369300428253  
Median: -0.864794595203118  
 
**timebodygyroscopejerkmagnitudestd:**   
Class : numeric  
Range : -0.997666071594203 to 0.250173204117966  
Mean  : -0.755015188509002  
Median: -0.880926958143599  
 
**frequencybodyaccelerometermeanx:**   
Class : numeric  
Range : -0.995249932641509 to 0.537012022051282  
Mean  : -0.575799983503946  
Median: -0.769093140075898  
 
**frequencybodyaccelerometermeany:**   
Class : numeric  
Range : -0.989034304057971 to 0.524187686888889  
Mean  : -0.488732713013952  
Median: -0.594984308629578  
 
**frequencybodyaccelerometermeanz:**   
Class : numeric  
Range : -0.989473926666667 to 0.280735952206667  
Mean  : -0.62973875362598  
Median: -0.723601712197488  

**frequencybodyaccelerometerstdx:**   
Class : numeric  
Range : -0.996604570307692 to 0.658506543333333  
Mean  : -0.552201112392524  
Median: -0.74699883447612  
 
**frequencybodyaccelerometerstdy:**   
Class : numeric  
Range : -0.990680395362319 to 0.560191344  
Mean  : -0.481478729871355  
Median: -0.51337746716304  
 
**frequencybodyaccelerometerstdz:**   
Class : numeric  
Range : -0.987224804307692 to 0.687124163703704  
Mean  : -0.582361415029381  
Median: -0.644149346839498  
 
**frequencybodyaccelerometerjerkmeanx:**   
Class : numeric  
Range : -0.994630797358491 to 0.474317256051282  
Mean  : -0.613928222283428  
Median: -0.812641020130769  
 
**frequencybodyaccelerometerjerkmeany:**   
Class : numeric  
Range : -0.989398823913043 to 0.276716853307692  
Mean  : -0.588163069360073  
Median: -0.781656017361539  
 
**frequencybodyaccelerometerjerkmeanz:**   
Class : numeric  
Range : -0.992018447826087 to 0.157775692377778  
Mean  : -0.714358487490646  
Median: -0.870663937715384  
 
**frequencybodyaccelerometerjerkstdx:**   
Class : numeric  
Range : -0.995073759245283 to 0.476803887476923  
Mean  : -0.612103283207987  
Median: -0.825392273824716  
 
**frequencybodyaccelerometerjerkstdy:**   
Class : numeric  
Range : -0.990468082753623 to 0.349771285415897  
Mean  : -0.570730968650136  
Median: -0.785151940276923  

**frequencybodyaccelerometerjerkstdz:**   
Class : numeric  
Range : -0.993107759855072 to -0.00623647528983051  
Mean  : -0.756489426411787  
Median: -0.895120677107692  
 
**frequencybodygyroscopemeanx:**   
Class : numeric  
Range : -0.99312260884058 to 0.474962448333333  
Mean  : -0.636739605053057  
Median: -0.729961304525143  
 
**frequencybodygyroscopemeany:**   
Class : numeric  
Range : -0.994025488297872 to 0.328817010088889  
Mean  : -0.676686800745998  
Median: -0.814097490770167  
 
**frequencybodygyroscopemeanz:**   
Class : numeric  
Range : -0.985957788 to 0.492414379822222  
Mean  : -0.604391244378742  
Median: -0.790931357562831  
 
**frequencybodygyroscopestdx:**   
Class : numeric  
Range : -0.994652185217391 to 0.196613286661538  
Mean  : -0.711035658050846  
Median: -0.808598920489285  
 
**frequencybodygyroscopestdy:**   
Class : numeric  
Range : -0.994353086595745 to 0.646233637037037  
Mean  : -0.645433416234092  
Median: -0.796377933461187  
 
**frequencybodygyroscopestdz:**   
Class : numeric  
Range : -0.986725274871795 to 0.522454216314815  
Mean  : -0.657746585870822  
Median: -0.822400371451041  
 
**frequencybodyaccelerometermagnitudemean:**   
Class : numeric  
Range : -0.986800645362319 to 0.586637550769231  
Mean  : -0.536516692548498  
Median: -0.670270983362273

**frequencybodyaccelerometermagnitudestd:**   
Class : numeric  
Range : -0.987648484461539 to 0.178684580868889  
Mean  : -0.620963293005196  
Median: -0.651262934905251  
 
**frequencybodyaccelerometerjerkmagnitudemean:**   
Class : numeric  
Range : -0.993998275797101 to 0.538404846128205  
Mean  : -0.575617493234432  
Median: -0.794047735707692  
 
**frequencybodyaccelerometerjerkmagnitudestd:**   
Class : numeric  
Range : -0.994366667681159 to 0.316346415348718  
Mean  : -0.599160868317743  
Median: -0.812618834107693  
 
**frequencybodygyroscopemagnitudemean:**   
Class : numeric  
Range : -0.986535242105263 to 0.203979764835897  
Mean  : -0.667099099613148  
Median: -0.765709363092157  
 
**frequencybodygyroscopemagnitudestd:**   
Class : numeric  
Range : -0.981468841692308 to 0.236659662496296  
Mean  : -0.672322349574843  
Median: -0.772728220624314  
 
**frequencybodygyroscopejerkmagnitudemean:**   
Class : numeric  
Range : -0.997617389275362 to 0.146618569064407  
Mean  : -0.756385271117364  
Median: -0.877896583992678  
 
**frequencybodygyroscopejerkmagnitudestd:**   
Class : numeric  
Range : -0.99758523057971 to 0.287834616098305  
Mean  : -0.771517051737343  
Median: -0.894068356326169  
