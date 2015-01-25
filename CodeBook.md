##Transformations
The run_analysis.R code does the following steps:
* 1. Merges the training and the test sets to create one data set.
* 2. Extracts only the measurements on the mean and standard deviation for each measurement.
* 3. Uses descriptive activity names to name the activities in the data set.
* 4. Appropriately labels the data set with descriptive variable names. 
* 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Variable and Data information
* This analysis starts with two sets of data, one for training objects (x_train.txt, y_train.txt, and subject_train.txt) and the other similar one for tests. 
* Another two tables, features.txt and activity_labels.txt, contain labels for the data and activity types.
* Only variables with "mean" or "std" in there labels are included in the analysis. 
* The final data set contains the average for all the "mean" and "std" variables by subject id and activity type.
