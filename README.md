# Getting-Cleaning-Data

==================================================================
Getting & Cleaning Data: Course Project: README
Version 1.0
==================================================================
Gill Griffiths
==================================================================

The purpose of this project is to prepare a tidy dataset from the data contained in this zip file:


https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


Background information
======================

The data which we are creating a tidy data set for is based on experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


Input datasets which are used in the processing are:
====================================================

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'train/subject_train.txt' : Training subjects.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_test.txt' : Test subjects.


Intermediate datasets are:
==========================

- 'features2.txt': Names of the measurements for mean() and std() measurements only, from the input file features.txt. This is output so that the descriptions can be edited to provide more consisent and valid names for the measurement variables.

- 'features2new.txt' : Names of the measurements for mean() and std() measurements to be used for the variable name. This file is input and contains the modified names for the measurement variables.


Output datasets are:
====================

- 'tidy_data_set.txt': The tidy dataset.

- 'summarised_tidy_data_set.txt': The summarised tidy dataset.


Scripts : 
=========

- 'run_analysis.R' : Reads the input datasets and creates a tidy data set and the summarised tidy data set.

