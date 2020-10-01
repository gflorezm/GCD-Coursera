#######################################################################
#                                                                     #
#             Getting and Cleaning Data Project                       #
#             Coursera - Jhons Hopkins University                     #
#             Author: Guillermo Florez Montero                        #
#                                                                     #
#######################################################################
#
# See "Readme" for additional information
#
#
#
# Prepare the library
library(dplyr)
library(data.table)




#######################################################################
#                                                                     #
#    Step 0: get and read the data                                    #
#                                                                     #
#######################################################################

# url of the data source (zip format)
urlFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Download the data (if it hasn't been downloaded)
if(!file.exists("raw_data.zip")) {
     download.file(urlFile, destfile = "raw_data.zip", mode = "wb")
}

# unzip the directory with the data (if it hasn't been unziped)
if(!file.exists("UCI HAR Dataset")) { unzip("raw_data.zip") }

# read the "train" data
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subj_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# read the "test" data
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subj_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Read the features vector
features <- read.table('./UCI HAR Dataset/features.txt')

# Read the activity labels
activ_labels <- read.table('./UCI HAR Dataset/activity_labels.txt')



#######################################################################
#                                                                     #
#    Step 1: Merge the training and the test sets                     #
#            to create one data set                                   #
#                                                                     #
#######################################################################

# merge x and y separately
merg_x <- bind_rows(x_test, x_train)
merg_y <- bind_rows(y_test, y_train)
subjects <- bind_rows(subj_test, subj_train)

# Fix the column names in the data sets
colnames(merg_x) <- features[,2]
colnames(merg_y) <-"activity"
colnames(subjects) = "subject"

# merge all the data
DATA <- bind_cols(subjects, merg_x, merg_y)

# delete the individual data frames (to save memory)
rm(x_test, x_train, y_test, y_train, subj_test, subj_train,
   merg_x, merg_y, subjects, features)



#######################################################################
#                                                                     #
#    Step 2: Extracts only the measurements on the                    #
#            mean and standard deviation for each measurement         #
#                                                                     #
#######################################################################

DATA2 <- DATA[, grepl("subject|activity|mean|std", colnames(DATA))]



#######################################################################
#                                                                     #
#    Step 3: Use descriptive activity names                           #
#            to name the activities in the data set                   #
#                                                                     #
#######################################################################

DATA2$activity <- factor(DATA2$activity,
                        levels = activ_labels[, 1], 
                        labels = activ_labels[, 2]
)
DATA2$activity  <- gsub("_"," ", DATA2$activity)



#######################################################################
#                                                                     #
#    Step 4: Use descriptive activity names to name                   #
#            the activities in the data set                           #
#                                                                     #
#######################################################################

names(DATA2) # get the list of variable names

names(DATA2) <- gsub("^t","time", names(DATA2))
names(DATA2) <- gsub("^f","frequency", names(DATA2))
names(DATA2) <- gsub("Acc","Accelerometer", names(DATA2))
names(DATA2) <- gsub("Gyro","Gyroscope", names(DATA2))
names(DATA2) <- gsub("Mag","Magnitude", names(DATA2))
names(DATA2) <- gsub("BodyBody","Body", names(DATA2))



#######################################################################
#                                                                     #
#    Step 5: From the data set in step 4, create a second,            #
#            independent tidy data set with the average of            #
#            each variable for each activity and each subject         #
#                                                                     #
#######################################################################

HumanActivity_tidy <- DATA2 %>% 
     group_by(subject, activity) %>%
     summarise(across(.fns = mean))

write.table(HumanActivity_tidy, "./HumanActivity_tidy.txt", row.names = FALSE)

# also write the data in format csv to improve the visualization in GitHub
write.csv(HumanActivity_tidy, "./HumanActivity_tidy.csv", row.names = FALSE)



# END

