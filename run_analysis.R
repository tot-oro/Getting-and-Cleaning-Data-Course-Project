## This script cleans the accelerometer data wit the following steps.
##


## 4.Appropriately labels the data set with descriptive variable names. 
## 5.From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.

library(dplyr)
library(plyr)
setwd("~/Documents/Getting-and-Cleaning-Data/UCI HAR Dataset")

###### 1.Merges the training and the test sets to create one data set

x_train = read.table("train/X_train.txt", header = FALSE)
y_train = read.table("train/y_train.txt", header = FALSE)
subject_train = read.table("train/subject_train.txt", header = FALSE)
train = cbind(subject_train, y_train, x_train)

x_test = read.table("test/X_test.txt", header = FALSE)
y_test = read.table("test/y_test.txt", header = FALSE)
subject_test = read.table("test/subject_test.txt", header = FALSE)
test = cbind(subject_test, y_test, x_test)

data = rbind(train, test)

# assign variable names to combined data
features = read.table("features.txt", header = FALSE)
colnames(data) = c('id', 'activity', as.vector(features[, 2]))

###### 2.Extracts only the measurements on the mean and standard deviation  
######   for each measurement.

mean_std_name = grep("-(mean|std)\\(\\)", colnames(data))
mean_std_data = data[, c(1, 2, mean_std_name)]

###### 3.Uses descriptive activity names to name the activities in the data set

activity_labels = read.table("activity_labels.txt", header = FALSE)
mean_std_data[, 2] = activity_labels[mean_std_data[, 2], 2] 

###### 4.Appropriately labels the data set with descriptive variable names

# Done in step 1

###### 5.From the data set in step 4, creates a second, independent tidy data set 
######    with the average of each variable for each activity and each subject.

ncol(mean_std_data)
# calculate column means for all variables except id and activity
average_data <- ddply(mean_std_data, .(id, activity), function(x) 
        colMeans(x[, 3:68], na.rm = TRUE))

write.table(average_data, "mean_std_average_data.txt", row.name = FALSE)


