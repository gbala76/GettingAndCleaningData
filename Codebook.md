Codebook
========================================================

*Source File: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip*


**The script run_analysis.R performs the following funtions:**

**1. Read the following files into R.**
- X_train.txt
- X_test.txt
- y_train.txt
- y_test.txt
- subject_train.txt
- subject_test.txt
- features.txt
- activity_labels.txt

**2. Merge the training and the test sets to create one data set**
The test and train data sets are combined into one data set using the
rbind function

- Data frame X is created by merging Xtrain and Xtest
- Data frame Y is created by merging Ytrain and Ytest
- Data frame Subject is created by merging Subjecttrain  and Subjecttest

**3. Extract only the measurements on the mean and standard deviation
for each measurement.**
- The list of mean and standard deviation features are extracted from
features using the grep function.
- Using the list of mean and standard deviation features, only the
corresponding columns are selected from data frame X.Resultant data
frame: X_mean_std

**4. Uses descriptive activity names to name the activities in the data set**

- A new column is added to the activity data frame Y
- The new column is then populated with the activity description
- corresponding to the activityID in column 1 using the factor command.

**5. Label the data, subject and activity datasets with appropriate
descriptions**
- The names function is used to assgin the mean and std deviation
features list as column names to the X_mean_std
- Descriptions are added to the Subject and Activity data frames using
the paste function.

**6. Merge the data set, activity and subject information into a
single data set**
- The data frames are merged using the cbind functon

**7. Create a second, independent tidy data set with the average of
each variable for each activity and each subject**
- data.table package is used for fast aggregation of large data
- lapply function is used to get the mean by activity description and subject
- the result is then sorted by activity description and subject
- the sorted out is written to the text file **"tidy_dataset.txt"**