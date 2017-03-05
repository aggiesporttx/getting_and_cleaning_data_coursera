library(reshape2)

## load in the files
##set working directory so I dont have to spell it out every time
setwd("D:/online classes/data cleaning/week4/final projec")

activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

##read in the test files
xtest <- read.table("test/X_test.txt", header=FALSE)
ytest <- read.table("test/Y_test.txt", header=FALSE)
subject_test <- read.table("test/subject_test.txt", header=FALSE)

##read in the training files
xtrain  <- read.table("train/X_train.txt", header=FALSE)
ytrain  <- read.table("train/Y_train.txt", header=FALSE)
subject_train <- read.table("train/subject_train.txt", header=FALSE)

## Assignment 1: Merges the training and the test sets to create one data set.
x_combined <- rbind(xtest, xtrain)
y_combined <- rbind(ytest, ytrain)
subject_combined <- rbind(subject_test, subject_train)

##Assignment 2:Extracts only the measurements on the mean and standard deviation for each measurement.
##get columns with "mean" or "std" in the name
features_with_mean_or_std <- grep(".mean.|.std.", features[,2])

##pull out those columns
x_combined <- x_combined[ ,features_with_mean_or_std]

##name the columns
names(x_combined) <- features[features_with_mean_or_std,2]


##Assignment 3: Uses descriptive activity names to name the activities in the data set
y_combined[,1] <- activity_labels[y_combined[,1],2]
names(y_combined) <- "activity"


##Assignment 4: Appropriately labels the data set with descriptive variable names.
names(subject_combined) <- "subject"



##Assignment 5:  From the data set in step 4, creates a second, independent tidy data set with 
##			the average of each variable for each activity and each subject.
##combine the datasets
tidy_data <- cbind(x_combined, y_combined, subject_combined)


tidy_data_melted <- melt(tidy_data , id=c("subject", "activity"))
tidy_data_averages <- dcast(tidy_data_melted, subject + activity ~ variable, mean)



write.table(tidy_data_averages, "tidy.txt", row.names=FALSE)

