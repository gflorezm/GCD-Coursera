# Coursera *Getting and Cleaning Data* course project
### Author: Guillermo Florez Montero <br />

This is the final project of the *Getting and Cleaning Data* course at Coursera - Johns Hopkins University. In this project, we collected data from the accelerometers from the Samsung Galaxy S smartphone. The data was processed to create a tidy data set that can be used for later analysis.

The source data set was obtained from the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Data Zip File Location: [UC Irvine Repo](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "Clicking will download the data")


## Goals of the Project
1. Create a tidy data set 
2. Link to a Github repository with your script for performing the analysis 
3. Create a Code Book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.
4. Create the Analysis R Script <br />


## Arquives
Name | Description | Link
--- | --- | --- 
Tidy data set | Final data set in tidy format | [HumanActivity_tidy.csv](https://github.com/gflorezm/GCD-Coursera/blob/master/HumanActivity_tidy.csv)
Code Book | Describes the data and the transformations performed | [CodeBook.md](https://github.com/gflorezm/GCD-Coursera/blob/master/CodeBook.md)
R Script | R Script for the data transformations (see `CodeBook.md` or the notes in the code for more information) | [Run_analysis.R](https://github.com/gflorezm/GCD-Coursera/blob/master/Run_analysis.R)


**The R script `run_analysis.R` does the following:**

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.