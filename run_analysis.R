# 1. Set default directory for reading data 
setwd("C:/Users/Office/Documents/Coursera/Getting & Cleaning Data/UCI HAR Dataset")
getwd()

# 2. Load packages
library(dplyr)
library(tidyr)

# 3. Read activity labels and features data into  data frame tables in R
activity_labels <- tbl_df(read.table("activity_labels.txt"))
features <- tbl_df(read.table("features.txt"))

# 4. Read files in test folder into  data frame tables in R
test_subjects <- tbl_df(read.table("test/Subject_test.txt"))
test_labels <- tbl_df(read.table("test/y_test.txt"))
test_data <- tbl_df(read.table("test/X_test.txt"))

# 5. Read files in train folder into  data frame tables in R
train_subjects <- tbl_df(read.table("train/Subject_train.txt"))
train_labels <- tbl_df(read.table("train/y_train.txt"))
train_data <- tbl_df(read.table("train/X_train.txt"))


# 6. Merge the training and test sets to create one data set
# Use rbind
subjects <- rbind(train_subjects, test_subjects)
labels <- rbind(train_labels, test_labels)
data <- rbind(train_data, test_data)


# 7. Extract only the features for the mean and standard deviation 
# these are identified as those containing the text '-mean()' and '-std()' 

# 7.1 First find the index of features which contain the text '-mean()' and '-std()' 
grx_mean <- glob2rx("*-mean()*")
grx_std <- glob2rx("*-std()*")
index_mean <- grep(grx_mean, features$V2)
index_std <- grep(grx_std, features$V2)
index <- append(index_mean, index_std) 

# 7.2 Use the index to filter the features and data to just those relating to the mean and standard deviation
features2 <- features[index,]
data2 <- data[, index]


# 8. Use descriptive activity names to name the activities in the dataset
# Match the labels and activity_labels dataframes using V1 and set the labels to the description in variable V2 in activity_labels
labels <- activity_labels[match(labels$V1, activity_labels$V1), 2]


# 9. Appropriately label the dataset with descriptive variable names
# 9.1 Write the features2 dataframe out to a text file "Features2.txt"
write.csv(features2, "features2.txt", row.names=FALSE)

# 9.2 This file will then be renamed to "Features2new.txt" and the activity names will be edited in Notepad
# I removed any characters which are not allowed (or may cause confusion) from the variable names
# and removed some duplication of texts, but other than that left the descriptions pretty much as they
# are since I don't really understand what they are supposed to represent

# 9.3 Read the edited "Features2new.txt" file back into dataframe features2
features2 <- read.csv("features2new.txt", header=TRUE)

# 9.4 Set the variable headings in data2 to the feature description 
colnames(data2)<- features2$V2

# 9.5 Set the variable name heading in subjects
colnames(subjects) <- "Subject"

# 9.6 Set the variable name heading in labels
colnames(labels) <- "Activity"


# 10. Merge the Data with the subjects and labels, and sort by subject and activity
tidy_data_set <- tbl_df(cbind(subjects, labels, data2))
tidy_data_set <- arrange(tidy_data_set, Subject, Activity)
write.csv(tidy_data_set, "tidy_data_set.txt", row.names=FALSE)


# 11. Create a second, independant tidy data set with the average of each variable for each activity and each subject
grouped_tidy_data_set <- group_by(tidy_data_set, Subject, Activity)
summarised_tidy_data_set <- summarise(grouped_tidy_data_set, mean(tBodyAcc_mean_X),mean(tBodyAcc_mean_Y),mean(tBodyAcc_mean_Z),mean(tGravityAcc_mean_X),mean(tGravityAcc_mean_Y),mean(tGravityAcc_mean_Z),mean(tBodyAccJerk_mean_X),mean(tBodyAccJerk_mean_Y),mean(tBodyAccJerk_mean_Z),mean(tBodyGyro_mean_X),mean(tBodyGyro_mean_Y),mean(tBodyGyro_mean_Z),mean(tBodyGyroJerk_mean_X),mean(tBodyGyroJerk_mean_Y),mean(tBodyGyroJerk_mean_Z),mean(tBodyAccMag_mean),mean(tGravityAccMag_mean),mean(tBodyAccJerkMag_mean),mean(tBodyGyroMag_mean),mean(tBodyGyroJerkMag_mean),mean(fBodyAcc_mean_X),mean(fBodyAcc_mean_Y),mean(fBodyAcc_mean_Z),mean(fBodyAccJerk_mean_X),mean(fBodyAccJerk_mean_Y),mean(fBodyAccJerk_mean_Z),mean(fBodyGyro_mean_X),mean(fBodyGyro_mean_Y),mean(fBodyGyro_mean_Z),mean(fBodyAccMag_mean),mean(fBodyAccJerkMag_mean),mean(fBodyGyroMag_mean),mean(fBodyGyroJerkMag_mean),mean(tBodyAcc_std_X),mean(tBodyAcc_std_Y),mean(tBodyAcc_std_Z),mean(tGravityAcc_std_X),mean(tGravityAcc_std_Y),mean(tGravityAcc_std_Z),mean(tBodyAccJerk_std_X),mean(tBodyAccJerk_std_Y),mean(tBodyAccJerk_std_Z),mean(tBodyGyro_std_X),mean(tBodyGyro_std_Y),mean(tBodyGyro_std_Z),mean(tBodyGyroJerk_std_X),mean(tBodyGyroJerk_std_Y),mean(tBodyGyroJerk_std_Z),mean(tBodyAccMag_std),mean(tGravityAccMag_std),mean(tBodyAccJerkMag_std),mean(tBodyGyroMag_std),mean(tBodyGyroJerkMag_std),mean(fBodyAcc_std_X),mean(fBodyAcc_std_Y),mean(fBodyAcc_std_Z),mean(fBodyAccJerk_std_X),mean(fBodyAccJerk_std_Y),mean(fBodyAccJerk_std_Z),mean(fBodyGyro_std_X),mean(fBodyGyro_std_Y),mean(fBodyGyro_std_Z),mean(fBodyAccMag_std),mean(fBodyAccJerkMag_std),mean(fBodyGyroMag_std),mean(fBodyGyroJerkMag_std))
write.csv(summarised_tidy_data_set, "summarised_tidy_data_set.txt", row.names=FALSE)

