#Load all required packages

library("reshape2")
library("dplyr")

#Reading all the data files

  test_x_data <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
  train_x_data <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
  test_y_data <- read.table("UCI HAR Dataset/test/Y_test.txt", header = FALSE)
  train_y_data <- read.table("UCI HAR Dataset/train/Y_train.txt", header = FALSE)
  test_sub_data <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
  train_sub_data <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
  act_label <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
  feat_label <- read.table("UCI HAR Dataset/features.txt", header = FALSE)

# Combine test and training data

  all_data <- rbind(train_x_data, test_x_data)
  all_act <- rbind(train_y_data, test_y_data)
  all_sub_data <- rbind(train_sub_data, test_sub_data)

# Adjust column names

  colnames(all_sub_data) <- c("Subject")
  colnames(all_act) <- c("ActCode")
  colnames(act_label) <- c("ActCode", "Activity")

# Combine Subject & Activity  with Data

  combined_data <- data.frame(all_sub_data, all_act, all_data)

# Merge Activity Data with Activity Labels

  combined_data <- merge(combined_data, act_label)

# Transpose features info dataset & update col names in combined data

  feat_row <- t(feat_label)

  colnames(combined_data)[3:563] <- feat_row[2, ]
  
  col_names_list <- colnames(combined_data)

# Capturing only Means and Standard Deviation Columns

  mean_std_cols <- grepl("*mean*|*std*|Activity|Subject", col_names_list)
  temp <- col_names_list[mean_std_cols == TRUE]

# Subset the data - capture only mean and std data

  mean_std_data <- combined_data[temp]

# Capture new col names & rename to descriptive names & update the col names
 
  col_names_list <- colnames(mean_std_data)
  
  col_names_list <- gsub("tBody", "Time Body ", col_names_list)
  col_names_list <- gsub("fBody", "FFT Body ", col_names_list)
  col_names_list <- gsub("tGravity", "Time Gravity ", col_names_list)
  col_names_list <- gsub("[[:punct:]]", "", col_names_list)
  col_names_list <- gsub("mean", " Mean ", col_names_list)
  col_names_list <- gsub("std", " STD ", col_names_list)
  col_names_list <- gsub("Body Body", "Body ", col_names_list)
  col_names_list <- gsub("FreqX", "Freq X", col_names_list)
  col_names_list <- gsub("FreqY", "Freq Y", col_names_list)
  col_names_list <- gsub("FreqZ", "Freq Z", col_names_list)
  
  colnames(mean_std_data) <- col_names_list

# Group the data by Subject & Activity and capture means of all variables
  
  tidy_data <- mean_std_data %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))
  
# Write out the tidy data

  write.table(tidy_data, "tidy_data.txt", row.names = FALSE, quote = FALSE, sep = "\t")

  print("Data transformation completed!")

  View(tidy_data)




                