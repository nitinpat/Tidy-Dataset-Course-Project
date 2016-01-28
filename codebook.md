Here, I describe important variables used in R script names run_analysis.R in each step

1.Merges the training and the test sets to create one data set.
  a. testData - contains test data.
  b. trainData - contains train data.
  c. dataset - data from 1.a and 2.a combined row-wise. This is not complete dataset.

2.Extracts only the measurements on the mean and standard deviation for each measurement.
  a. finalIndices - sorted indices of features containing names "mean()" and "std()".
  b. newDataset - dataset obtained by using variables corresponding to finalIndices.
  c. featureData - contains feature data.

3.Uses descriptive activity names to name the activities in the data set.
  a. subjectTest - contains subject test data.
  b. yTest - contains Y test data.
  c. subjectYTestData - data from 3.a and 3.b combined column-wise.
  d. subjectTrain - contains subject train data.
  e. yTrain - contains Y train data.
  f. subjectYTrainData - data from 3.d and 3.e combined column-wise.
  g. combineSubjectYData - data from 3.c and 3.f combined column-wise.
  h. completeDataset - data from 3.g and 2.b combined column-wise.

4.Appropriately labels the data set with descriptive variable names.
  a. indices - extracting variable numbers corresponding to variable names from complete dataset.
  b. featureDataVector - second column from feature data.
  c. sizeOfIndices - size of inces variable from step 4.a


5.From the data set in step 4, creates a second, independent tidy data set with the average
  of each variable for each activity and each subject.
  a.tidyData - final tidy dataset using aggregate function.
