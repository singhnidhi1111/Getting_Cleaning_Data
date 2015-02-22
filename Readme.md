#run_analysis.R
*Clean and Summarize UCI HAR Dataset*
*Course Project for Getting and Cleaning Data*

---------------------

`run_analysis.R` works on the **UCI HAR dataset** provided by the **UCI Machine Learning Repository**.
The dataset captures the data from experiments performed by 30 subjects performing 6 different type of activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

The `run_analysis.R` script cleans and summarizes the data and produces a tidy dataset which has means and standard deviations for all Variables for each unique combination of Subject and Activity.

The script assumes that there is a folder called *UCI HAR Dataset* in your Working Directory with all the data provided as a part of that dataset.

The original dataset is available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
More information on the dataset is available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The code book is avaliable for this tidy data as `CodeBook.md`.

####Cleaning and Summarizing Steps

The R script **run_analysis.R** performs the following cleaning and summarizing options on the UCI HAR dataset

The steps involved in cleaning and summarizing the data were as shown below:

1. The training and test datasets were combined along with the Subject and Activity data

```
  test_x_data <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
  train_x_data <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
  test_y_data <- read.table("UCI HAR Dataset/test/Y_test.txt", header = FALSE)
  train_y_data <- read.table("UCI HAR Dataset/train/Y_train.txt", header = FALSE)

  ....
  combined_data <- data.frame(all_sub_data, all_act, all_data)
```

2. The Activity Labels were included in the combined dataset by merging it with the activity_labels data

```
  combined_data <- merge(combined_data, act_label)
```
  
3. Variable names are captured from the features.txt and the Variable Names in the combined dataset are then updated

```
  feat_row <- t(feat_label)
  colnames(combined_data)[3:563] <- feat_row[2, ]  
  col_names_list <- colnames(combined_data)
```  

4. Extract the measurements for Mean and Standard Deviation only by using `grepl` and pattern matching
   to string "mean" or "std" in the Variable names

```
  mean_std_cols <- grepl("*mean*|*std*|Activity|Subject", col_names_list)
``` 

5. The new subset now contains Subject, Activity and 79 other Variables
6. The new subset is then summarized using a `group_by` and `summarise_each` to calculate the mean of all Variables for each      Subject and Activity combination.

```
  tidy_data <- mean_std_data %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))
```

7. This summarized data is then written out to tidy_data.txt using `write.table`
```
  write.table(tidy_data, "tidy_data.txt", row.names = FALSE, quote = FALSE, sep = "\t")
```



