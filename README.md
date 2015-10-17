---
title: "ReadMe"
output: html_document
---

#Getting and cleaning data project README.md
- File explaining repository components, dataset gathering, cleaning and code script

#Files in this repo

- README.md 

- CodeBook.md -> Notes on Raw data, Variables, Cleaning and data Transformation 

- run_Analysis.R -> the  R code

### Question
You should create one R script called run_analysis.R that does the following: 1. Merges the training and the test sets to create one data set. 2. Extracts only the measurements on the mean and standard deviation for each measurement. 3. Uses descriptive activity names to name the activities in the data set 4. Appropriately labels the data set with descriptive activity names. 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### File location assumption
The code (run_analysis.R) and all samsung data files (train and test) are assumed to be pre-downloaded and unzipped in the working directory. The script assumes these file will already be there. 

### Files
- activity_labels.txt
- features.txt
- X_test.txt, Y_test.txt, Subject_test.txt
- X_train.txt, Y_train.txt, Subject_train.txt
- The output file is created in working directory with the name of tidy.txt

### Libraries
data.library package is loaded first in the run.Analysis.R 

### Description run_analysis.R 

#### Step 1: Gathering

 - read X_test, y_test, & subject_test data sets from text files in working directory
- extracted and assigned to features variable (names of recorded and processed values of gyro and accelr..) 
- 2nd value of each record (after space) in txt file denoted new record
- Assigned column names of X_test dataset with values stored in features variable


#### Step 2: Cleaning

- Determined only mean and standard deviation column locations (selected features) in terms of True and False
- Extracted only mean and standard deviation observations of X_test (selected features)
- Used descriptive activity names to name the activities in the data set
- Assigned to 2nd column of y_test dataset activity names with appropriate labels


#### Step 3: Naming / Labeling

- Assigned names to column's of y_test & subjects_test 
subject(test) who performed the activity
- Similar acitons for X and Y_train data


#### Step 4: (Merging, Cleaning & Melting)

-  Column binded X_train and y_train data so as to corelate activity with its feature values
- Merged the training and the test sets to create one data set, merged row wise
- Assigning names of first 3 columns of "data" data set i.e
- Subject ID, Activity ID, and Activity Names columns to variable id_labels
- Identify names of all other different columns between merged data and names of self assigned labels (column names)
- Melt data so as to row wise restructure different columns (arrange rowise) w.r.t variables "Subject_ID", "Activity_ID", "Activity_Label"


#### Step 5: Recasting
##### dcast melted data and stores as txt file in working dir

- Created tidy data set with the average of each variable's mnay observations for each Activity and each Subject by calculating corresponding means of "melted_data" dataset using dcast
- Finally run.Analysis.R writes the new tidy dataset into a text file called tidy.txt.
