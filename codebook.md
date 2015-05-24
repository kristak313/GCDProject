#Study Design:

Test and train data are loaded individually. 

The subject, X, and y files are loaded for test and train. Headers for the X values are extracted from the features.txt file and applied to both test and train datasets.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The headers are used to filter out means and standard deviations from the set of observations. The extraction is done using grepl on the header names, with  care to not include meanFreq().

Test and train data sets are merged into one and then column names of SubjectID and Activity are added for the subject and y values respectively.

The activity column that contains an integer is converted to labels using the factor function
Activity labels include: 
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

When the script is executed the output columns are space delimited values to a text file (named tidyData.txt) in the current working directory.


#Code book:

<p>subject_train -- data from "UCI HAR Dataset/train/subject_train.txt"</p>
<p>subject_test -- data from "UCI HAR Dataset/test/subject_test.txt"</p>
<p>X_train -- data from "UCI HAR Dataset/train/X_train.txt"</p>
<p>X_test -- data from "UCI HAR Dataset/test/X_test.txt"</p>
<p>y_train -- data from "UCI HAR Dataset/train/y_train.txt"</p>
<p>y_test -- data from "UCI HAR Dataset/test/y_test.txt"</p>
<p>featureNames -- data from "UCI HAR Dataset/features.txt"</p>
<p>train -- binds and combines files subject_train, y_train, X_train by columns</p>
<p>test -- binds and combines files subject_test, y_test, X_test by columns</p>
<p>combined -- binds and combines files train, test by rows</p>
<p>meanstdcols -- indicates which columns contain mean</p>
<p>melted -- shows data taken from a set of columns and stacked into a single column of data</p>
<p>tidy -- describes shape of data</p>
