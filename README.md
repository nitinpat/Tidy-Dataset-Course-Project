# Tidy-Dataset-Course-Project
Course Project for Getting and Cleaning Data containing R script, README.md and codebook.md

Now, I explain the R script step by step
1.Merges the training and the test sets to create one data set.
  a. Reading test and train data using read.table() function.
  b. Combining both row-wise using rbind() function.
     This is not complete dataset.


2.Extracts only the measurements on the mean and standard deviation for each measurement.
  a. Reading feature data using read.table() function
  b. Selecting only those feature indices from feature data which containing
     mean and std names using grepl() function. Then combine those indices
     followed by sorting them in ascending order.
  c. Selecting only those variables/columns having same indices as of feature indices
     calculated in step 2.b.


3.Uses descriptive activity names to name the activities in the data set.
  a. Reading subject test and Y test data using read.table() function.
  b. Combine both using column-wise using cbind() function.
  c. Reading subject train and Y train data using read.table() function.
  d. Combine both using column-wise using cbind() function.
  e. Combine data computed in step 3.b and 3.d row-wise using rbind() function.
  f. Changing column names "SubjectIDs" and "Activities" respectively for data computed in 3.e.
  g. combining data computed in step 3.f and 2.c column-wise using cbind() function.
     This is complete dataset.
  h. Assigning descriptive activity names to the "activities" column in the complete dataset.


4.Appropriately labels the data set with descriptive variable names. 
  a. Capturing variable names from complete dataset computed in step 3.g.
     Extracting indices from variable names using sub() function.
  b. Replacing features corresponding to indices computed in step 4.a from feature data to
     complete dataset's variables by for loop.
  c. Giving descriptive names to complete dataset's variables computed in step 4.b using
     sub(), gsub() function by for loop.

5.From the data set in step 4, creates a second, independent tidy data set with the average of 
  each variable for each activity and each subject.
  a. Creating tidy dataset with the average of each variable for each activity and each subject 
     from complete dataset computed in step 4.c by using aggregate function.
    

