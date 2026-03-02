library(tidyr)
library(stringr)
library(dplyr)
library(readr)
library(tidyverse)

# Read Training data
X_train <- read.table("C:/Users/DELL XPS/Documents/LAB_IMI/Cours/2026/Coursera_DataScience_R/run_analysis/train/X_train.txt")
y_train <- read.table("C:/Users/DELL XPS/Documents/LAB_IMI/Cours/2026/Coursera_DataScience_R/run_analysis/train/y_train.txt")
subject_train <- read.table("C:/Users/DELL XPS/Documents/LAB_IMI/Cours/2026/Coursera_DataScience_R/run_analysis/train/subject_train.txt")


# Read Test data
X_test <- read.table("C:/Users/DELL XPS/Documents/LAB_IMI/Cours/2026/Coursera_DataScience_R/run_analysis/test/X_test.txt")
y_test <- read.table("C:/Users/DELL XPS/Documents/LAB_IMI/Cours/2026/Coursera_DataScience_R/run_analysis/test/y_test.txt")
subject_test <- read.table("C:/Users/DELL XPS/Documents/LAB_IMI/Cours/2026/Coursera_DataScience_R/run_analysis/test/subject_test.txt")

#Combine data
subject <- rbind(subject_train, subject_test)
activity <- rbind(y_train, y_test)
features <- rbind(X_train, X_test)

#merge data
merged_data <- cbind(subject, activity, features)

#Read the futures names
features_names <- read.table("C:/Users/DELL XPS/Documents/LAB_IMI/Cours/2026/Coursera_DataScience_R/run_analysis/features.txt",
                             stringsAsFactors = FALSE)
#Assign proper column names
colnames(merged_data) <- c("subject", "activity", features_names[,2])

#Extracts only the measurements on the mean and 
#standard deviation for each measurement. 
mean_std_data <- merged_data[, c(1, 2, 
          grep("mean\\(\\)|std\\(\\)", colnames(merged_data)))]

#Uses descriptive activity names to name the activities in the data set
#read activity labels
activity_labels <- read.table("C:/Users/DELL XPS/Documents/LAB_IMI/Cours/2026/Coursera_DataScience_R/run_analysis/activity_labels.txt",
                              stringsAsFactors = FALSE)
colnames(activity_labels) <- c("activity", "activity_name")

mean_std_data <- mean_std_data %>%
  left_join(activity_labels, by = "activity") %>%
  mutate(activity = activity_name) %>%
  select(-activity_name)

#Appropriately labels the data set with descriptive variable names. 
names(mean_std_data) <- names(mean_std_data) %>%
  gsub("^t", "Time", .) %>%
  gsub("^f", "Frequency", .) %>%
  gsub("Acc", "Accelerometer", .) %>%
  gsub("Gyro", "Gyroscope", .) %>%
  gsub("Mag", "Magnitude", .) %>%
  gsub("BodyBody", "Body", .) %>%
  gsub("-mean\\(\\)", "Mean", .) %>%
  gsub("-std\\(\\)", "StdDev", .) %>%
  gsub("-", "", .) %>%
  gsub("\\(\\)", "", .)



#From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.
tidy_data <- mean_std_data %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean), .groups = "drop")

write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
