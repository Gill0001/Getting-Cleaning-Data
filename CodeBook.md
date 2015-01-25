# Getting & Cleaning Data Course Project Codebook
Version 1.0
Gill Griffiths
==================================================================

## There are 8 input datasets:

1. "features.txt" 		: List of all features.
2. "activity_labels.txt" 	: Links the class labels with their activity name.
3. "train/X_train.txt"		: Training set.
4. "train/y_train.txt" 		: Training labels.
5. "train/subject_train.txt" 	: Training subjects.
6. "test/X_test.txt"		: Test set.
7. "test/y_test.txt"		: Test labels.
8. "train/subject_test.txt" 	: Test subjects.

The "README.txt" and "features_info.txt" contained in the zip file below give information about the variables used on the feature vector.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


## There are 2 intermediate datasets:

1. "Features2.txt"
This contains the names of the measurements for mean() and std() measurements only, from the input file features.txt.

	1. V1: integer - measurement id, values ranging from 1 - 543
	2. V2: varchar(40) - measurement text


2. "Features2new.txt"
This contains the names of the measurements for mean() and std() measurements to be used for the variable name.

	1. V1: integer, - measurement id, values ranging from 1 - 543
	2. V2: varchar(40) - measurement text


## There are 2 output datasets:

1. "Tidy_data_set.txt"
This is a tidy data set containing measurements for the mean and standard deviation only.
Mean and standard deviation measure are identified as those containing the text strings "-mean()" and "-std()". 
It contains 68 fields:

	1.	Subject: integer - id for the subjects taking part in the experiment, values range from 1-30
	2.	Activity: varchar(20) - id for the activity being undertaken, with 6 values - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
	3.-68.  All represent different measurements for the mean and standard deviation:
		3.	tBodyAcc mean X: number
		4.	tBodyAcc mean Y: number
		5.	tBodyAcc mean Z: number
		6.	tGravityAcc mean X: number
		7.	tGravityAcc mean Y: number
		8.	tGravityAcc mean Z: number
		9.	tBodyAccJerk mean X: number
		10.	tBodyAccJerk mean Y: number
		11.	tBodyAccJerk mean Z: number
		12.	tBodyGyro mean X: number
		13.	tBodyGyro mean Y: number
		14.	tBodyGyro mean Z: number
		15.	tBodyGyroJerk mean X: number
		16.	tBodyGyroJerk mean Y: number
		17.	tBodyGyroJerk mean Z: number
		18.	tBodyAccMag mean: number
		19.	tGravityAccMag mean: number
		20.	tBodyAccJerkMag mean: number
		21.	tBodyGyroMag mean: number
		22.	tBodyGyroJerkMag mean: number
		23.	fBodyAcc mean X: number
		24.	fBodyAcc mean Y: number
		25.	fBodyAcc mean Z: number
		26.	fBodyAccJerk mean X: number
		27.	fBodyAccJerk mean Y: number
		28.	fBodyAccJerk mean Z: number
		29.	fBodyGyro mean X: number
		30.	fBodyGyro mean Y: number
		31.	fBodyGyro mean Z: number
		32.	fBodyAccMag mean: number
		33.	fBodyAccJerkMag mean: number
		34.	fBodyGyroMag mean: number
		35.	fBodyGyroJerkMag mean: number
		36.	tBodyAcc std X: number
		37.	tBodyAcc std Y: number
		38.	tBodyAcc std Z: number
		39.	"tGravityAcc std X: number
		40.	tGravityAcc std Y: number
		41.	tGravityAcc std Z: number
		42.	tBodyAccJerk std X: number
		43.	tBodyAccJerk std Y: number
		44.	tBodyAccJerk std Z: number
		45.	tBodyGyro std X: number
		46.	tBodyGyro std Y: number
		47.	tBodyGyro std Z: number
		48.	tBodyGyroJerk std X: number
		49.	tBodyGyroJerk std Y: number
		50.	tBodyGyroJerk std Z: number
		51.	tBodyAccMag std: number
		52.	tGravityAccMag std: number
		53.	tBodyAccJerkMag std: number
		54.	tBodyGyroMag std: number
		55.	tBodyGyroJerkMag std: number
		56.	fBodyAcc std X: number
		57.	fBodyAcc std Y: number
		58.	fBodyAcc std Z: number
		59.	fBodyAccJerk std X: number
		60.	fBodyAccJerk std Y: number
		61.	fBodyAccJerk std Z: number
		62.	fBodyGyro std X: number
		63.	fBodyGyro std Y: number
		64.	fBodyGyro std Z: number
		65.	fBodyAccMag std: number
		66.	fBodyAccJerkMag std: number
		67.	fBodyGyroMag std: number
		68.	fBodyGyroJerkMag std: number


## Tranformations undergone to create the tidy data set:

1. Set default directory for reading data to the one created by unzipping the data for the project


2. Load any packages required


3. Read activity labels and features data into data frame tables in R
*Dataframe tables created: "activity labels", "features"*


4. Read files in test folder into data frame tables in R
*Dataframe tables created: "test_subjects", "test_labels" and "test_data"*


5. Read files in train folder into data frame tables in R
*Dataframe tables created: "train_subjects", "train_labels" and "train_data"*


6. Merge the training and test sets to create one data set using rbind
*Dataframe tables created: "subjects", "labels" and "data"*


7. Extract only the features for the mean and standard deviation. These are identified as those containing the text "-mean()" and "-std()". First find the index of features which contain the text "-mean()" and "-std()" using the glob2rx and grep functions. Second use the index to create new dataframes for the features and data dataframes containing just the mean and standard deviation measurements
*Dataframe tables created: "features2", "data2"*


8. Use descriptive activity names to name the activities in the dataset using the match function
*Dataframe table updated: "labels"*


9. Label the dataset with descriptive variable names. First write the features2 dataframe out to a text file. Secondly open "Features2.txt" in Notepad and edit the activity names to remove any characters which are not allowed (or may cause confusion) in the variable names and remove any duplication of texts. (Other than that I have left the descriptions pretty much as they are since I don"t really understand what they are supposed to represent.) Then save the file as "Features2new.txt". Thirdly, read the "Features2new.csv" file back into dataframe features2  Fourthly Set the variable headings in data2 to the feature description 
*Text file created "Features2.txt"* 
*Dataframe table updated: "features2", "data2*

10 Label the subject with a descriptive variable name
*Dataframe table updated: "subjects2"*

11 Label the activity labels with a descriptive variable name
*Dataframe table updated: "labels2"*


12. Merge the Data with the subjects and labels using cbind and create a new dataframe table and write it out to a text file
*Dataframe table created "tidy_data_set"*
*Text file created "tidy_data_set.txt"*


13. Create a second, independant tidy data set with the average of each variable for each activity and each subject


