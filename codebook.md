# Code Book for Getting and Cleaning Data Programming Assignment

# Overview
Files are read in and the datasets are combined
Columns without "mean" or "std" in them are removed
Column names are added to the data from the features and activity files
Tidy dataset is created with the average of each activity + subject

#Variables 
xtest:  stores raw X_test.txt data
ytest:  stores raw Y_test.txt data
xtrain:  stores raw X_train.txt data
ytrain:  stores raw Y_train.txt data
subject_test, subject_train:  stores subject data files
x_combined:  stores combined data from xtest + xtrain
y_combined:  stores combined data from ytest + ytrain
subject_combined:  stores combined data from subject_test and subject_train
tidy_data:  stores combined data from x_combined, y_combined, and subject combined with columns removed that don't contain "mean" or "std"
tidy_data_melted:  transformation of the tidy data set to get it set up
tidy_data_averages:  averages of subject + activity pairs.  Final output

# Data sources
X_test.txt
Y_test.txt
X_train.txt
Y_train.txt
subject_test.txt
subject_train.txt
activity_labels.txt
features.txt
