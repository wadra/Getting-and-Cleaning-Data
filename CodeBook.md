---
title: "CodeBook"
output: html_document
---


## Notes: Raw data, Variables, Cleaning and data Transformation 

###Description of what and how the data was collected

Cleaning of the data gathered through use of 3- axial accelorometer and 3 -axial gyro scope. 6 different activities including Laying, Standing, Walking, Walking upstairs and Walking downstairs were recorded and produced as two sets of file with test and train datsets. Variables were itself divided in to X (gyro accelero data) and Y(activity data) Time domain and Frequnecy domain variables were caculated. Components of gravity and body accelaration were separated. Jerks and other values were also calculated.

####Subjects (Volunteers): 30 

####Activity: 1-6

## Variables 
### A 561-feature vector of orignal data

for brevity reasons only listing representative sample of raw data

1- tBodyAcc------        mean,std,mad,max,min,iqr,entropy,aircoeff,corelation()---X,Y,Z

2- tGravityAcc----   mean,std,mad,max,min,iqr,entropy,aircoeff,corelation()---X,Y,Z

3- tBodyAccJerk----
mean,std,mad,max,min,iqr,entropy,aircoeff,corelation()---X,Y,Z

4- tBodyGyro-------
mean,std,mad,max,min,iqr,entropy,aircoeff()---X,Y,Z

5- tBodyAccMag-----
mean,std,mad,max,min,iqr,entropy,aircoeff()---X,Y,Z

6- tBodyGyroMag----
mean,std,mad,max,min,iqr,entropy,aircoeff()---X,Y,Z

7- fBodyAcc--------
mean,std,mad,max,min,iqr,entropy,aircoeff()---X,Y,Z

etc.............


### Values extracted (only mean & standard deviation values selected from orignal raw data)

tbodyaccmeanx     (mean time domain body accelaration x-axis)         
  
tbodyaccmeany     (mean time domain body accelaration y-axis)        
    
tbodyaccmeanz     (mean time domain body accelaration z-axis)         

tbodyaccstdx      (std dev time domain body accelaration z-axis)        

tbodyaccstdy               

tbodyaccstdz               

tgravityaccmeanx    (mean time domain gravity accelaration x-axis)

tgravityaccmeany           

tgravityaccmeanz          

tgravityaccstdx           

tgravityaccstdy            

tgravityaccstdz            

tbodyaccjerkmeanx          

tbodyaccjerkmeany          

tbodyaccjerkmeanz       

tbodyaccjerkstdx          

tbodyaccjerkstdy          

tbodyaccjerkstdz   (standard deviation time domain body jerk z-axis)           
tbodygyromeanx             

tbodygyromeany             
   
tbodygyromeanz             

tbodygyrostdx              
   
tbodygyrostdy              

tbodygyrostdz     (std dev time domain body angular velocity)          

tbodygyrojerkmeanx         

tbodygyrojerkmeany         

tbodygyrojerkmeanz         

tbodygyrojerkstdx          

tbodygyrojerkstdy          

tbodygyrojerkstdz          

tbodyaccmagmean            

tbodyaccmagstd            

tgravityaccmagmean         

tgravityaccmagstd          

tbodyaccjerkmagmean        

tbodyaccjerkmagstd         

tbodygyromagmean        

tbodygyromagstd            

tbodygyrojerkmagmean       

tbodygyrojerkmagstd        

fbodyaccmeanx              

fbodyaccmeany              

fbodyaccmeanz              

fbodyaccstdx               

fbodyaccstdy               

fbodyaccstdz       (standard deviation frequnecy domain body accelaration)             
fbodyaccjerkmeanx         

fbodyaccjerkmeany          

fbodyaccjerkmeanz          

fbodyaccjerkstdx          

fbodyaccjerkstdy           

fbodyaccjerkstdz           

fbodygyromeanx             

fbodygyromeany             

fbodygyromeanz             

fbodygyrostdx             

fbodygyrostdy             

fbodygyrostdz       (std devi frq domain body angular velocity)         

fbodyaccmagmean            

fbodyaccmagstd            

fbodybodyaccjerkmagmean   

fbodybodyaccjerkmagstd    

fbodybodygyromagmean       

fbodybodygyromagstd        

fbodybodygyrojerkmagmean  

fbodybodygyrojerkmagstd   


##Transformation

###Collection of the raw data

####File downloaded form coursera page on page link:
- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- then unzipped in local working directory of R-Studio



#### Load libraries and support packages

- library(data.table)

- read X_test, y_test, & subject_test data sets from text files donwloaded

- extracted and assigned to features variable (names of recorded and processed values of gyro and accelr..) 

- 2nd value of each record (after space) in txt file denoted new record

- Assigned column names of X_test dataset with values stored in features variable

##Cleaning

- Extracted  only the measurements on the mean and standard deviation for each measurement. 
- Determine only mean and standard deviation column locations (selected features) in terms of True and False
- Extract only mean and standard deviation observations of X_test (selected features)
- Used descriptive activity names to name the activities in the data set
- Assigned to 2nd column of y_test dataset activity names with appropriate labels


### Labels the data set with descriptive variable names.
- Assign names to column's of y_test & subjects_test 
- subject(test) who performed the activity
- Column binded X_test and y_test data so as to corelate activity with its feature values


###Similar acitons for X and Y_train data
- Column binded X_train and y_train data so as to corelate activity with its feature values

########################################################################


### Merging the training and the test sets to create one data set
- Merged test and train data row wise



### Cleaning & Melting 
- Assigning names of first 3 columns of "data" data set i.e
- Subject ID, Activity ID, and Activity Names columns to variable id_lbls
- Identify names of all other different columns between merged data and names of self assigned labels (column names)
- Melt data so as to row wise restructure different columns (arrange rowise) w.r.t variables "Subject_ID", "Activity_ID", "Activity_Label"


##Dimensions of the dataset

- test_data (2947) + train_data (7352) = 10,299 observations in data 

- melted data size:count of diff_lables(80) * count of data(10,299)= 813,621

- Mean values, for 30 subjects and 6 activities

- Final dataset with 180 rows by 68 columns

- Created tidy data set with the average of each variable's many observations for each Activity and each Subject by calculating corresponding means of "melted_data" dataset using dcast

- tidy_data = dcast(melted_data, Subject_ID + Activity_ID ~ variable, mean)

- uploaded  data set as a txt file created with write.table() using row.name=FALSE






