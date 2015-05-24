Test and train data are loaded individually. 

The subject, X, and y files are loaded for test and train. Headers for the X values are extracted from the features.txt file and applied to both test and train datasets.

The headers are used to filter out means and standard deviations from the set of observations. The extraction is done using grepl on the header names, with  care to not include meanFreq().

Test and train data sets are merged into one and then column names of SubjectID and Activity are added for the subject and y values respectively.

The activity column that contains an integer is converted to to labels using the factor function

When the script is executed the output columns are space delimited values to a text file (named tidyData.txt) in the current working directory.
