#Study Design:

**Test and train data are loaded individually. **

**The subject, X, and y files are loaded for test and train. Headers for the X values are extracted from the features.txt file and applied to both test and train datasets.**

**features.txt**
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

<p>tBodyAcc-XYZ</p>
<p>tGravityAcc-XYZ</p>
<p>tBodyAccJerk-XYZ</p>
<p>tBodyGyro-XYZ</p>
<p>tBodyGyroJerk-XYZ</p>
<p>tBodyAccMag</p>
<p>tGravityAccMag</p>
<p>tBodyAccJerkMag</p>
<p>tBodyGyroMag</p>
<p>tBodyGyroJerkMag</p>
<p>fBodyAcc-XYZ</p>
<p>fBodyAccJerk-XYZ</p>
<p>fBodyGyro-XYZ</p>
<p>fBodyAccMag</p>
<p>fBodyAccJerkMag</p>
<p>fBodyGyroMag</p>
<p>fBodyGyroJerkMag</p>

The set of variables that were estimated from these signals are: 

<p>mean(): Mean value</p>
<p>std(): Standard deviation</p>
<p>mad(): Median absolute deviation </p>
<p>max(): Largest value in array</p>
<p>min(): Smallest value in array</p>
<p>sma(): Signal magnitude area</p>
<p>energy(): Energy measure. Sum of the squares divided by the number of values. </p>
<p>iqr(): Interquartile range </p>
<p>entropy(): Signal entropy</p>
<p>arCoeff(): Autorregresion coefficients with Burg order equal to 4</p>
<p>correlation(): correlation coefficient between two signals</p>
<p>maxInds(): index of the frequency component with largest magnitude</p>
<p>meanFreq(): Weighted average of the frequency components to obtain a mean frequency</p>
<p>skewness(): skewness of the frequency domain signal </p>
<p>kurtosis(): kurtosis of the frequency domain signal </p>
<p>bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.</p>
<p>angle(): Angle between to vectors.</p>

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

<p>gravityMean</p>
<p>tBodyAccMean</p>
<p>tBodyAccJerkMean</p>
<p>tBodyGyroMean</p>
<p>tBodyGyroJerkMean</p>

**The headers are used to filter out means and standard deviations from the set of observations. The extraction is done using grepl on the header names, with  care to not include meanFreq().**

**Test and train data sets are merged into one and then column names of SubjectID and Activity are added for the subject and y values respectively.**

**The activity column that contains an integer is converted to labels using the factor function**
Activity labels include:
<p>1 WALKING</p>
<p>2 WALKING_UPSTAIRS</p>
<p>3 WALKING_DOWNSTAIRS</p>
<p>4 SITTING</p>
<p>5 STANDING</p>
<p>6 LAYING</p>

**When the script is executed the output columns are space delimited values to a text file (named tidyData.txt) in the current working directory.**


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
