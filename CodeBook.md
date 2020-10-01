# Code Book of the Course Project
### Author: Guillermo Florez Montero

## Description 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

**For each record it is provided:**

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

**The dataset includes the following files**

- `README.txt`
- `features_info.txt`: Shows information about the variables used on the feature vector.
- `features.txt`: List of all features.
- `activity_labels.txt`: Links the class labels with their activity name.
- `train/X_train.txt`: Training set.
- `train/y_train.txt`: Training labels.
- `test/X_test.txt`: Test set.
- `test/y_test.txt`: Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- `train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- `train/Inertial Signals/total_acc_x_train.txt`: The acceleration signal from the smartphone accelerometer X axis in standard gravity units `g`. Every row shows a 128 element vector. The same description applies for the `total_acc_x_train.txt` and `total_acc_z_train.txt` files for the Y and Z axis. 
- `train/Inertial Signals/body_acc_x_train.txt`: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- `train/Inertial Signals/body_gyro_x_train.txt`: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

**Notes** 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

**Reference**
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.


## Source Data
The *Human Activity Recognition Using Smartphones Data Set* and desciptions can be found in the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


## Data transformations
The [`run_analysis.R`](https://github.com/gflorezm/GCD-Coursera/blob/master/Run_analysis.R) Script performs 6 steps to achieve the goals described in the Project definition [(see REEDME)](https://github.com/gflorezm/GCD-Coursera/blob/master/README.md)

**Step 0:** I downloaded the zip file, unzipped the directory and read the data using the function `read.table()`

**Step 1:** I Created a complete data set by merging the test, train and subjects information using the functions `bind_rows()`and `bind_cols()`. I also changed the variables names for the names in `features.txt`. The result was a data set with 563 variables and 10299 observations

**Step 2:** I extracted only the mean and standard deviation mesurements os the variables. The result was a new data set with 81 variables and 10299 observations

**Step 3:** I changed the levels of the `activity` variable by a descriptive name as in the `activ_labels.txt` data

**Step 4:** Variable names contain a lot of unclear acronyms. I tried to tydi up these names replacing the acronyms by complete words. I used the function `gsub()`to replace *t* for *time*, *f* for *frequency*, *Acc* for *Accelerometer*, *Gyro* for *Gyroscope*, *Mag* for *Magnitude*. I didn't change the name of the functions at the end of the name because it explains the operation that was used to generate the variable. I also corrected some repeated words (*BodyBody* for *Body*).

**Step 5:** I Sumarized all the information in a tydi data set that contais the mean of every column broken down by participants and activities. I used the functions `group_by()` and `summarise()`of the `dplyr` package


## Final Product
The final product of the script is the `HumanActivity_tidy.txt` data set (see also the [`HumanActivity_tidy.csv`](https://github.com/gflorezm/GCD-Coursera/blob/master/HumanActivity_tidy.csv))

**Variable names**
The original variable names and acronyms are discrabed in the document `features_info.txt`. I changed the variable names to be easier for the human eye to read (see **Step 4**). For example:

- a variable called `tBodyAcc-mean()-X` in the original data, in the tidy data set it is called `timeBodyAccelerator-mean()-X`
- a variable called `tBodyBodyAccJerkMagnitude-mean()` in the original dat, in the tidy data set it is called `timeBodyAcceleratorJerkMagnitude-mean()`