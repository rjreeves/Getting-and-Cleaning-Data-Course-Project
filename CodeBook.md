# CodeBook 
This is the CodeBook for the tidy data set produced by 'run_analysis.R' from the Getting-and-Cleaning-Data-Course-Project

## Data Source
This tidy data set contains data derived from the "Human Activity Recognition Using Smartphones Data Set".
- Data Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Data Set Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
## Data Set Files

- 'README.txt'  (Read for full details about the data set files)

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Individualy identifies the 30 subjects and there activities.

- 'train/Inertial Signals/total_acc_x_train.txt': Not used in this project

- 'test/Inertial Signals/total_acc_x_train.txt': Not used i this project

## Clean and Tidy steps on the Data Set
'run_analysis.R' processed the data set  with the following steps

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
