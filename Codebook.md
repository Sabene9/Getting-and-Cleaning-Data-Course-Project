# Code Book

## Overview

This project uses the Human Activity Recognition Using Smartphones Dataset.
The goal was to clean the data and create a tidy dataset containing the average
of each variable for each activity and each subject.
---

## Original Dataset

The dataset was obtained from:

UCI Machine Learning Repository  
Human Activity Recognition Using Smartphones Dataset

The dataset includes:

- 30 subjects
- 6 activities
- 561 measured features

---

## Data Processing Steps

1. Merged the training and test datasets to create one dataset.
2. Extracted only measurements on the mean() and std() for each measurement.
3. Used descriptive activity names to name activities in the data set.
4. Labeled the dataset with descriptive variable names.
5. Created a second tidy dataset with the average of each variable
   for each activity and each subject.

---

## Final Tidy Dataset

The final dataset contains:

- 180 rows (30 subjects × 6 activities)
- 68 columns
    - 1 Subject column
    - 1 Activity column
    - 66 averaged measurement variables

---

## Variables

### Identifiers

- **subject**
  - Integer (1–30)
  - Identifies the subject who performed the activity

- **activity**
  - Factor with 6 levels:
1 - WALKING
2 - WALKING_UPSTAIRS
3 - WALKING_DOWNSTAIRS
4 - SITTING
5 - STANDING
6 - LAYING

---

### Measurement Variables

All remaining variables are numeric and represent the average of
each measurement for each subject and activity.

Variable naming conventions:

- **Time** prefix: Time domain signals (original prefix t)
- **Frequency** prefix: Frequency domain signals (original prefix f)
- **Accelerometer**: Accelerometer signal
- **Gyroscope**: Gyroscope signal
- **Magnitude**: Signal magnitude
- **Mean**: Mean value
- **StdDev**: Standard deviation

---

### Example Variables

- TimeBodyAccelerometerMeanX
- TimeBodyAccelerometerMeanY
- TimeBodyAccelerometerMeanZ
- TimeBodyAccelerometerStdDevX
- TimeBodyGyroscopeMeanX
- FrequencyBodyAccelerometerMeanX
- FrequencyBodyAccelerometerStdDevZ
- TimeBodyAccelerometerMagnitudeMean
- TimeBodyGyroscopeMagnitudeStdDev

All variables are expressed as the mean value of the original
signal measurements grouped by subject and activity.

---

## Units

Accelerometer signals are measured in gravitational acceleration units (g).
Gyroscope signals are measured in radians per second.
