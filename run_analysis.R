
#1.Merges the training and the test sets to create one data set.
testData <- read.table("test/X_test.txt", sep = "", header = FALSE)

trainData <- read.table("train/X_train.txt", sep = "", header = FALSE)

dataset <- rbind(testData, trainData)  #this is not complete dataset



#2.Extracts only the measurements on the mean and standard deviation 
#  for each measurement. 
featureData <- read.table("features.txt", sep = "", header = FALSE)

#You want to use word boundaries \b around your word patterns. 
#A word boundary does not consume any characters. 
#It asserts that on one side there is a word character, 
#and on the other side there is not
meanIndices <- which(grepl("mean\\b", featureData$V2))
stdIndices <- which(grepl("std", featureData$V2))
finalIndices <- c(meanIndices, stdIndices)
finalIndices <- sort(finalIndices)
newDataset <- dataset[, finalIndices]



#3.Uses descriptive activity names to name the activities in the data set
subjectTest <- read.table("test/subject_test.txt", sep = "", header = FALSE)

yTest <- read.table("test/y_test.txt", sep = "", header = FALSE)

subjectYTestData <- cbind(subjectTest, yTest)

subjectTrain <- read.table("train/subject_train.txt", sep = "", header = FALSE)

yTrain <- read.table("train/y_train.txt", sep = "", header = FALSE)

subjectYTrainData <- cbind(subjectTrain, yTrain)

combineSubjectYData <- rbind(subjectYTestData, subjectYTrainData)

colnames(combineSubjectYData)[1] <- "SubjectIDs"
colnames(combineSubjectYData)[2] <- "Activities"

#  This is complete dataset
completeDataset <- cbind(combineSubjectYData, newDataset) 

completeDataset$Activities[completeDataset$Activities == 1] <- "WALKING"
completeDataset$Activities[completeDataset$Activities == 2] <- "WALKING_UPSTAIRS"
completeDataset$Activities[completeDataset$Activities == 3] <- "WALKING_DOWNSTAIRS"
completeDataset$Activities[completeDataset$Activities == 4] <- "SITTING"
completeDataset$Activities[completeDataset$Activities == 5] <- "STANDING"
completeDataset$Activities[completeDataset$Activities == 6] <- "LAYING"



#4.Appropriately labels the data set with descriptive variable names. 
indices <- sub("^V", "", colnames(completeDataset))
indices <- as.numeric(indices)
indices <- na.omit(indices)
featureDataVector <- featureData$V2
sizeOfIndices <- length(indices)

j <- 3
for(i in 1:sizeOfIndices){
        temp <- indices[i]
        colnames(completeDataset)[j] = paste(featureDataVector[temp])
        j <- j + 1
}

j <- 3
for(i in 1:sizeOfIndices){
        colnames(completeDataset)[j] <- sub("^t", "time", colnames(completeDataset)[j])
        colnames(completeDataset)[j] <- sub("^f", "freq", colnames(completeDataset)[j])
        colnames(completeDataset)[j] <- sub("mean", "Mean", colnames(completeDataset)[j])
        colnames(completeDataset)[j] <- sub("std", "Std", colnames(completeDataset)[j])
        colnames(completeDataset)[j] <- gsub("-", "", colnames(completeDataset)[j])
        colnames(completeDataset)[j] <- sub("\\(", "", colnames(completeDataset)[j])
        colnames(completeDataset)[j] <- sub("\\)", "", colnames(completeDataset)[j])
        j <- j + 1
}

colnames(completeDataset)



#5.From the data set in step 4, creates a second, independent tidy data 
#  set with the average of each variable for each activity and each subject.

tidyData <- aggregate(x = completeDataset[, 3:ncol(completeDataset)], by = completeDataset[c("SubjectIDs", "Activities")], FUN = mean)

write.table(x = tidyData, file = "tidyDataset.txt", row.names = FALSE)
