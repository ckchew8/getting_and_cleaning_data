rm(list=ls()) #clear all variables

#===================================================
#=================EXTRA 1: GET DATA=================
#===================================================

#Get dataset if absent 7 unzip into current working directory
 if(!file.exists("./UCI HAR Dataset"))
  {
    file_Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(file_Url, destfile = "Dataset.zip", method = "libcurl")
    unzip(zipfile="./Dataset.zip")
  }
 
# File path constructor. These variables are meant to build paths for cross-platform support.
mainpath<- file.path("./UCI HAR Dataset")
trainpath<-file.path("./UCI HAR Dataset","train")
testpath<-file.path("./UCI HAR Dataset","test")

#Read in Training Data Set:
Subject_Train<-read.table( file.path(trainpath,"subject_train.txt" ), header=FALSE )
Features_Train<-read.table( file.path(trainpath,"X_train.txt"), header=FALSE )
Activity_Train<-read.table(file.path(trainpath,"y_train.txt"), header=FALSE )

#Read in Test Data Set:
Subject_Test<-read.table(file.path(testpath,"subject_test.txt"), header=FALSE )
Features_Test<-read.table(file.path(testpath,"X_test.txt"), header=FALSE )
Activity_Test<-read.table(file.path(testpath,"y_test.txt"), header=FALSE )

#=================================================
#======1: Merges Training and Test Data Set=======
#=================================================

#Bind test and train datasets by rows
Subject_Data  <- rbind(Subject_Train, Subject_Test)
Features_Data <- rbind(Features_Train, Features_Test)
Activity_Data <- rbind(Activity_Train, Activity_Test)

#Set meaningful names to variables
names(Subject_Data)<-c("subject")
names(Activity_Data)<- c("activity")

# Read in features names and assign names accordingly to the features dataset  
FeaturesNames <- read.table(file.path(mainpath, "features.txt"),header=FALSE)
names(Features_Data)<- FeaturesNames[,2]

# Bind dataset columns wise to form the complete raw database 
Combined_Data <- cbind(Subject_Data, Activity_Data, Features_Data)

#================================================================================
#=====2: Extract Only Mean and Standard Deviation For Each Measurement===========
#================================================================================

#Find all column names/variables with "mean()" or "std()" without quotes and return column names.
FeaturesNames_with_mean_std<-grep("mean\\(\\)|std\\(\\)", names(Combined_Data), value=TRUE)

#Subset matches from original combined raw dataset, Combined_Data and store as new dataframe.
Dataset_with_mean_std_dev<-Combined_Data[,c("subject", "activity", FeaturesNames_with_mean_std)]

#============================================================================
#======3: Use Descriptive Activity Names To Name The Activities==============
#============================================================================

# Read in activity labels
Activity_Label<-read.table( file.path(mainpath,"activity_labels.txt"), stringsAsFactors=FALSE ,header=FALSE )

#Label activities (numerical label) with the appropriate labels from activity_labels.txt (in the form of character)
          for (i in 1:nrow(Activity_Label) )
          {
            Dataset_with_mean_std_dev$activity[Dataset_with_mean_std_dev$activity==i ] <- Activity_Label[i,2]
          }

#=================================================================================================
#===========4: Substitute Columns Names/Variable Names With Descriptive Variable Names============
#=================================================================================================

#Substitute column names/variables with more meaningful names
names(Dataset_with_mean_std_dev)<-gsub("^t", "time", names(Dataset_with_mean_std_dev))
names(Dataset_with_mean_std_dev)<-gsub("^f", "frequency", names(Dataset_with_mean_std_dev))
names(Dataset_with_mean_std_dev)<-gsub("Acc", "accelerometer", names(Dataset_with_mean_std_dev))
names(Dataset_with_mean_std_dev)<-gsub("Gyro", "gyroscope", names(Dataset_with_mean_std_dev))
names(Dataset_with_mean_std_dev)<-gsub("Mag", "magnitude", names(Dataset_with_mean_std_dev))
names(Dataset_with_mean_std_dev)<-gsub("BodyBody", "body", names(Dataset_with_mean_std_dev))

#remove all dash symbols
names(Dataset_with_mean_std_dev)<-gsub("-", "", names(Dataset_with_mean_std_dev))

#remove all "(" ")" without quotes
names(Dataset_with_mean_std_dev)<-gsub("\\(|\\)", "", names(Dataset_with_mean_std_dev))

#Convert all column names to lower case
names(Dataset_with_mean_std_dev)<-tolower(names(Dataset_with_mean_std_dev))

#Converting activity column from character to factor
Dataset_with_mean_std_dev$activity<-as.factor(Dataset_with_mean_std_dev$activity)

#===============================================================================================================
#===5: Create An Independent Tidy Data Set With The Average Of Each Variable For Each Activity & Each Subject===
#===============================================================================================================

#Average features measurements by subject & activity.
Tidy_Data<-aggregate(. ~subject + activity, Dataset_with_mean_std_dev, mean)

#Reorder by subject ID followed by activity.
Tidy_Data<-Tidy_Data[order(Tidy_Data$subject,Tidy_Data$activity),]

#Save tidied data frame
write.table(Tidy_Data, file = "Tidy_Data.txt",row.name=FALSE)

#=====================================================
#========EXTRA 2: New Tidy Data Set Validation========
#=====================================================

#Read in tidied data table from 5)
validate_data<-read.table("Tidy_Data.txt",header=TRUE)

#Validate if the data is indeed tidy. Expectations are:
#Each column represents a variable and each row is used to hold the value of each observation. 
#The variable names should not consists of any symbols such as "-", "(", ")" & "." without quotes and should have lower casing.
#In addition, the variable names should hold meaningful names.
View(validate_data)
str(validate_data)







