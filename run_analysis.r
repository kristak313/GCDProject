##You should create one R script called run_analysis.R that does the following.
##1. Merges the training and the test sets to create one data set.
##2. Extracts only the measurements on the mean and standard deviation for each measurement.
##3. Uses descriptive activity names to name the activities in the data set.
##4. Appropriately labels the data set with descriptive variable names.
##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


setwd("/Users/Krista/Desktop/coursera/GCDProject")
##use getwd() to check the working directory if needed

##load required packages

library(data.table) ##used in step 1 ##replaced fread with read.table
library(reshape2) ##used in step 5

##load data

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f <- "Dataset.zip"
if (!file.exists(path)) {dir.create(path)}
download.file(url, file.path(path, f), method = "curl")

##unzip file

unzip("/Users/Krista/Desktop/coursera/GCDProject/Dataset.zip", files = NULL, list = FALSE, overwrite = TRUE, junkpaths = FALSE, exdir = ".", unzip = "internal", setTimes = FALSE)

##1. Merge the training and the test sets to create one data set.

##read the data into data frames
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

##add column name for the subject files in train and test
names(subject_train) <- "subjectID"
names(subject_test) <- "subjectID"

##add column names for the measurement files in X_train and X_test
featureNames <- read.table("UCI HAR Dataset/features.txt")
names(X_train) <- featureNames$V2
names(X_test) <- featureNames$V2

##add column names for the label files
names(y_train) <- "activity"
names(y_test) <- "activity"

##bind and combine the files
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
combined <- rbind(train, test)


##2. Extract only the measurements on the mean and standard deviation for each measurement.

##determine which columns contain mean() or std()
meanstdcols <- grepl("mean\\(\\)", names(combined)) |
    grepl("std\\(\\)", names(combined))

##keep the subjectID and activity columns
meanstdcols[1:2] <- TRUE

##keep only the meanstd columns
combined <- combined[, meanstdcols]


##3. Use descriptive activity names to name the activities in the data set.

##4. Appropriately label the data set with descriptive activity names.

##convert the activity column from an integer to labels using factor function
combined$activity <- factor(combined$activity, labels=c("Walking",
    "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))


##5. Create a second tidy data set with the average of each variable for each activity and each subject.

##create the tidy data set
melted <- melt(combined, id=c("subjectID","activity"))
tidy <- dcast(melted, subjectID+activity ~ variable, mean)

##write the tidy data set to a file
##write.csv(tidy, "tidy.csv", row.names=FALSE)  ##Ignore this.  Used to test in a spread sheet
write.table(tidy, "tidyData.txt", row.name=FALSE)
