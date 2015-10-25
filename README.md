# Readme for Getting & Cleaning Data Course Project

Author			: ckchew8  
Last Modified	        : 24th of Oct 2015  
R Version		: 3.2.1  
OS 		        : Windows 7 64bit  
Goal  			: To describe in detail the operation of Run_Analysis.R code.   
Packages used           : (Loaded by default with RStudio Version 0.99.467, no additional library calls needed)  

				  1) "package:stats"     
				  2) "package:graphics"   
				  3) "package:grDevices"   
				  4) "package:utils"  
				  5) "package:datasets"    
				  6) "package:methods"   
				  7) "package:base" 
 
Dataset name    : Human Activity Recognition Using Smartphones Dataset Version 1.0  
Dataset origin  : [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)   
Dataset Details : Kindly refer to the readme.txt that comes along with the raw dataset for more information.
				
				
## Table of Contents:
1) Code Philosophy  
2) Code Overview  
3) Code Walkthrough  
4) Afterword  


## 1. Code Philosopy:
The philosophy when coding this assignment is that the code should be minimalist. This means:  
1) Code should only minimal libraries/packages.  
2) Convenience and independence of code execution without having to rely on package availability in a cross platform scenario.   
3) Automate the code with minimal human interaction needed. Basically, sit back, hit run and view the outcome:)  


## 2. Code Overview:
As reviewing 4 peers can prove to be a taxing task, I'll try my very best to smoothen the reviewing process.The code is written in a sections manner in a single script. Each section is preceeded with the main activity title.The main activity title depicts the purposes of the subsequent codes.

Furthermore, each section of the code is tied back to the list of tasks defined in the Course project.There are 7 sections in total.The core 5 sections, 1-5, corresponds to each section of the list of tasks described in the Course Project page. EXTRA 1 & EXTRA 2 sections were written as an addition to automate the data acquiring and validating the script.

The following depicts the code layout: (Each section will be explained in detail in the following section.)  

EXTRA 1: Get Data    
1      : Merges Training and Test Data Set    
2      : Extract Only Mean and Standard Deviation For Each Measurement    
3      : Use Descriptive Activity Names To Name The Activities    
4      : Substitute Columns Names With Descriptive Variable Names    
5      : Create An Independent Tidy Data Set With The Average Of Each Variable For Each Activity & Each Subject    
EXTRA 2: New Tidy Data Set Validation    


## 3. Code Walkthrough:


### Extra 1: Get Data
This section is done to fulfil philosophy 3) i.e. to automate the code and to provide tribute to the course; particularly the "Getting Data"" part of the "Getting and Cleaning Data" of this course;) 

* Check current working directory for the existence of folder named "UCI HAR Dataset" without quotes.

* If the folder "UCI HAR Dataset" without quotes does not exist, this means the dataset is not present. 
  This script will trigger R to start downloading the data from 
  [link to dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), save as "Dataset.zip" without quotes and unzip the downloaded data into the current working directory. 

* Note that the method="libcurl" is used to support crossplatform https download. This feature is available for R Ver 3.2.X onwards: See http://www.r-bloggers.com/https-for-cran-how-and-why/ for more details. If you're using an older version or is unable to get this code to work, kindly revert to the older methods:  

      For Windows: download.file(file_Url,destfile="./Dataset.zip")  
	  For MAC    : download.file(file_Url,destfile="./Dataset.zip", method="curl")  

  You can use the same command used for MAC OS if you have curl properly installed but again, the philosophy that i've employed is to have minimalist coding design:)The downloaded, "Dataset.zip" without quotes is then unzipped into the current working directory. For more information, kindly see see David Hood's Page [link](https://thoughtfulbloke.wordpress.com/2015/08/31/hello-world/) , "Downloading Secure Files" section.  
  
* If the folder is present, the download & unzip file portion of this section is skipped.

* The next step in this section would be to construct cross-platform paths to the data sets using the file.path() command. 3 crucial paths to access the main, test and train directory which will be used to read in data sets are constructed.
  
* We then proceed to reading the data sets from the "./UCI HAR Dataset/test" & "./UCI HAR Dataset/train" without quotes folders. 3 data sets are read from the "train" without quotes folder where each data set represents the following:     
  
  Subject : subject_train.txt       
  Features: X_train.txt    
  Activity: y_train.txt      
  
  Similar explanation is applicable for the importing of the datasets from the "test" without quotes folder.
*  Note that "Inertial Signals" without quotes data set are not used as per David Hood's advice which can be found here:[link](https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/?utm_medium=email&utm_source=other&utm_campaign=notifications.auto.4i9gpnGrEeWjsw782TsmrQ)


  
### 1: Merges Training and Test Data Set

This section basically merges the data set read in from the "./UCI HAR Dataset/test" and "./UCI HAR Dataset/train" without quotes folder in the previous step. The features variable names were obtained from "./UCI HAR Dataset/features.txt" without quotes.

The following table depicts how the datasets will be bound together which is with row bind first and followed by column bind command and named. Note that the "|" without quotes does not bear any meaning and serve as a border of a table only. 

 
               "subject"               |           "activity"              |       Variable names from "features.txt"
	 Subject_Train (subject_train.txt) |    Activity_Train (y_train.txt)   |          Features_Train (X_train.txt)
	 Subject_Test  (subject_test.txt)  |    Activity_Test  (y_test.txt)    |          Features_Test  (X_test.txt)

The second column of "features.txt" without quotes contains names of associated features which are used as column/variable names for the features in the raw data set. In addition, the subject and activity column are assigned with the names "subject" & "activity" respectively. Both naming steps were done prior to the column bind operation.


### 2: Extract Only Mean and Standard Deviation For Each Measurement

In this section, the code extracts all measurements with mean and standard deviation utilizing grep command to obtain the column names which contains the mean and standard deviation. We then utilize this variable containing the names of columns with "mean()" and "std()" without quotes (std is known as standard deviation) and subset it from the original raw data set along with the columns, "subject" & "activity" without quotes.This is stored in a new data frame, "Dataset_with_mean_std_dev" without quotes.
 
### 3: Use Descriptive Activity Names To Name The Activities

This part reads in the activity labels from the file named "activity_labels.txt" and substitutes activities accordingly using a for loop to substitute the numerical values with the character values from the "activity_labels.txt" file. The code will loop through all rows of the "activity" without quotes column and replace the numerical values with the following convention:  
			1 = WALKING    
			2 = WALKING_UPSTAIRS    
			3 = WALKING_DOWNSTAIRS    
			4 = SITTING    
			5 = STANDING    
			6 = LAYING    
This part of the code is obeying the principle of Tidy Data of making observations of a column to be more meaningful.  
  
### 4: Substitute Columns Names/Variable Names With Descriptive Variable Names

This part of the code basically searches for column names and replacing them with the following character/word identifier.    

* The substitution is done to obey the principle of tidy data to make variables with more descriptive & significant.    
	1) Substitutes all column names beginning with "^t" without quotes, with "time" without quotes.  
	2) Substitutes all column names beginning with "^f" without quotes, with "frequency" without quotes.  
	3) Substitutes all column names containing the string "Acc" without quotes, with "accelerometer" without quotes.  
	4) Substitutes all column names containing the string "Gyro" without quotes, with "gyroscope" without quotes.  
	5) Substitutes all column names containing the string "Mag" without quotes, with "magnitude" without quotes.  
	6) Substitutes all column names containing the string "BodyBody" without quotes, with "body" without quotes.  
  
* There's a few additional substitution to honor the spirit of tidy data whereby column names should not have any symbols such as "-" without quotes, "(" without quotes and ")" without quotes. Hence the following steps were taken:

  1) Substitutes all column names containing the symbol "-" without quotes, with nothing which eliminates the "-" without quotes symbol.  
  2) Substitutes all column names containing the symbol "(" & ")" without quotes, with nothing which eliminates the "-" without quotes symbol.  
* All substitution steps above were done using the gsub command. In addition, all column/variable names will be converted to lower case to prevent any mixed casing in a variable/column name.  
* A character to factor conversion was done on the "activity" without quotes column to conform to the tidy data principle that character columns should be converted to factor variable.  

### 5: Create An Independent Tidy Data Set With The Average Of Each Variable For Each Activity & Each Subject

* The final task of the Course Project requires that we create a tidy data set containing the average of each variable for each activitty and subject. This is achieved using the aggregate command to compute the mean of each variable by "subject" and "activity" without quotes.
  
* The data set is then ordered by "subject" (1st priority) and "activity" without quotes (2nd priority)  to make the data more presentable whereby each subject are clustered together with all activities and measurements corresponding to the subject.
    
* The resultant tidied data set is then written to a text file named "Tidy_Data.txt" without quotes in the current working directory. This would mean that we should expect a 180  rows (30 subjects x 6 activities) by 68 columns (66 columns of features measurement found with "mean()" and "std()" without quotes in addition to the "subject" and "activity" column). 

### EXTRA 2: New Tidy Data Set Validation
 
* As with any work, we naturally would want to check if the output from 5) is actually tidy. Opening the "Tidy_Data.txt" without quotes with notepad in Windows will shatter your expectation!;) To prove that this is a Tidy Data especially when read into R, this section facilitates the notion by reading the "Tidy_Data.txt" without quotes file in the current working directory and views the data via the View() function. A summary of contents the dataset is invoked via the "str()" without quotes command.
  
* A new tab (in Rstudio) should automatically appear with the heading "validate_data" without quotes depicting the contents of the tidy data which complies to all the principles discussed in the class:    
 1)  Each column represents a variable and each row is used to hold the value of each observation.   
 2)  The variable names should not consists of any symbols such as "-", "(", ")" & "." without quotes and should have lower casing.   
3) In addition, the variable names should hold meaningful names.  

## Afterword:
Thank you for your time and effort for reading this document, any feedback for further improvement are greatly appreciated!:) Hope we've gained something along the process and cheers to having completed the task!:)
 
### End of README.md




