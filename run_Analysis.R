### Project Getting & Cleaning Data - Wearable accelero-gyro dataset ###

### load data.table library
library(data.table)

# read X_test, y_test, & subject_test data sets from text file
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")


# extract and assign to features variable (names of recorded and processed values of gyro and accelr..) 
#2nd value of each record.Space in txt file denotes new record
features <- read.table("features.txt")
features <- features[,2]

## 3-Uses descriptive activity names to name the activities in the data set
# Assign column names of X_test dataset with values stored in features variable
names(X_test) = features

## 2- Extracts only the measurements on the mean and standard deviation for each measurement. 
# Determine only mean and standard deviation column locations (selected features) in terms of True and False
sel_features <- grepl("mean|std", features)

# Extract only mean and standard deviation observations of X_test (selected features)
X_test = X_test[,sel_features]


# extract and assign to activity_labels variable, activity labels from txt file
#2nd value of each record. Spaces in txt file denotes new record
act_labels <- read.table("activity_labels.txt")
act_labels <- act_labels[,2]

##Use descriptive activity names to name the activities in the data set
# Assign to 2nd column of y_test dataset activity names via activity labels
# Activity_labels points to activity names corresponding to y_test's Activity ID column
y_test[,2] = act_labels[y_test[,1]]



## 4- Appropriately labels the data set with descriptive variable names.
#Assign names to column's of y_test & subjects_test 
#subject(test) who performed the activity
sub_test <- read.table("subject_test.txt")
names(y_test) = c("Activity_ID", "Activity_Label")
names(sub_test) = "Subject_ID"

# Column bind X_test and y_test data so as to corelate activity with its feature values
test_data <- cbind(as.data.table(sub_test), y_test, X_test)

################################################################################

# Read X_train, y_train, & subject_train data sets from text files
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")


## 3-Uses descriptive activity names to name the activities in the data set
# Assign column names of X_train dataset with values stored in features variable
names(X_train) = features

## 2- Extracts only the measurements on the mean and standard deviation for each measurement. 
# Determine only mean and standard deviation column Locations in terms of True and False
X_train = X_train[,sel_features]

# Assign to column 2 of y_train dataset activity names via activity labels determined previously
# Activity_labels points to activity names corresponding to y_test's Activity ID column
#subject(test) who performed the activity
sub_train <- read.table("subject_train.txt")
y_train[,2] = act_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(sub_train) = "Subject_ID"

# Column bind X_train and y_train data so as to corelate activity with its feature values
train_data <- cbind(as.data.table(sub_train), y_train, X_train)

########################################################################


##1- Merging the training and the test sets to create one data set
# Merge test and train data row wise
# test_data (2947) + train_data (7352) = 10,299 observations in data 
data = rbind(test_data, train_data)


# Assigning names of first 3 columns of "data" data set i.e
#..Subject ID, Activity ID, and Activity Names columns to variable id_lbls
#id_labels   = c("Subject_ID", "Activity_ID", "Activity_Label")
data_labels = names(data)
id_lbls = data_labels[1:3]

# Identify names of all other different columns between merged data and 
#..names of self assigned labels (column names)
#diff_labels = setdiff(colnames(data), id_labels)
diff_lbls = which(!is.element(data_labels, id_lbls))

# stores in to melt_data variable
# column values named by data_labels which correspond to 3 columns of "data" identified id_lables
melted_data   = melt(data, id = id_lbls, measure.vars = diff_lbls)
# melted data size:count of diff_lables(80) * count of data(10,299)= 813,621

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Calculating mean to "melted_data" dataset using dcast
tidy_data = dcast(melted_data, Subject_ID + Activity_ID ~ variable, mean)


##Please upload your data set as a txt file created with write.table() using row.name=FALSE
#getdirectoy
dir <- getwd()
#append file name to directory
dir <- paste0(dir,"/tidy_data.txt")

#Saving file in current working directory in txt format
write.table(tidy_data, file = dir,row.names = FALSE)
