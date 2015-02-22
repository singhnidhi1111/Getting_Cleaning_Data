#Cleaning and Summarization Human Activity Recognition Using Smartphones Dataset

---------------------------

##Study Design


This data set was derived from the *Human Activity Recognition Using Smartphones Dataset* available on the **UCI Machine Learning Repository**. The UCI HAR dataset was then cleaned and summarized as a part of the **Coursera Getting and Cleaning Data** course.


**The original dataset includes the following files**:

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.


####Cleaning and Summarizing Steps

The R script **run_analysis.R** performs the following cleaning and summarizing options on the UCI HAR dataset

The steps involved in cleaning and summarizing the data were as shown below:

1. The training and test datasets were combined along with the Subject and Activity data
2. The Activity Labels were included in the combined dataset by merging it with the activity_labels data
3. Variable names are captured from the features.txt and the Variable Names in the combined dataset are then updated
4. Extract the measurements for Mean and Standard Deviation only by using `grepl` and pattern matching
   to string "mean" or "std" in the Variable names
5. The new subset now contains Subject, Activity and 79 other Variables
6. The new subset is then summarized using a `group_by` and `summarise_each` to calculate the mean of all Variables for each      Subject and Activity combination.
7. This summarized data is then written out to tidy_data.txt

##Code Book

File - tidy_data.txt

Separator - Tab (`\t`)

Number of Observations - 180

Number of Variables - 81



**Variables in Tidy Data**

-----------------

Field -- Type

1. Subject -- Level
2. Activity -- Level
3. Time Body Acc Mean X -- Mean X Axis
4. Time Body Acc Mean Y -- Mean Y Axis
5. Time Body Acc Mean Z -- Mean Z Axis
6. Time Body Acc STD X -- Std Deviation X Axis
7. Time Body Acc STD Y -- Std Deviation Y Axis
8. Time Body Acc STD Z -- Std Deviation Z Axis
9. Time Gravity Acc Mean X -- Mean X Axis
10. Time Gravity Acc Mean Y -- Mean Y Axis
11. Time Gravity Acc Mean Z -- Mean Z Axis
12. Time Gravity Acc STD X -- Std Deviation X Axis
13. Time Gravity Acc STD Y -- Std Deviation Y Axis
14. Time Gravity Acc STD Z -- Std Deviation Z Axis
15. Time Body AccJerk Mean X -- Mean X Axis
16. Time Body AccJerk Mean Y -- Mean Y Axis
17. Time Body AccJerk Mean Z -- Mean Z Axis
18. Time Body AccJerk STD X -- Std Deviation X Axis
19. Time Body AccJerk STD Y -- Std Deviation Y Axis
20. Time Body AccJerk STD Z -- Std Deviation Z Axis
21. Time Body Gyro Mean X -- Mean X Axis
22. Time Body Gyro Mean Y -- Mean Y Axis
23. Time Body Gyro Mean Z -- Mean Z Axis
24. Time Body Gyro STD X -- Std Deviation X Axis
25. Time Body Gyro STD Y -- Std Deviation Y Axis
26. Time Body Gyro STD Z -- Std Deviation Z Axis
27. Time Body GyroJerk Mean X -- Mean X Axis
28. Time Body GyroJerk Mean Y -- Mean Y Axis
29. Time Body GyroJerk Mean Z -- Mean Z Axis
30. Time Body GyroJerk STD X -- Std Deviation X Axis
31. Time Body GyroJerk STD Y -- Std Deviation Y Axis
32. Time Body GyroJerk STD Z -- Std Deviation Z Axis
33. Time Body AccMag Mean  -- Mean Magnitude 
34. Time Body AccMag STD  -- Std Deviation Magnitude 
35. Time Gravity AccMag Mean  -- Mean Magnitude 
36. Time Gravity AccMag STD  -- Std Deviation Magnitude 
37. Time Body AccJerkMag Mean  -- Mean Magnitude 
38. Time Body AccJerkMag STD  -- Std Deviation Magnitude 
39. Time Body GyroMag Mean  -- Mean Magnitude 
40. Time Body GyroMag STD  -- Std Deviation Magnitude 
41. Time Body GyroJerkMag Mean  -- Mean Magnitude 
42. Time Body GyroJerkMag STD  -- Std Deviation Magnitude 
43. FFT Body Acc Mean X -- Mean X Axis
44. FFT Body Acc Mean Y -- Mean Y Axis
45. FFT Body Acc Mean Z -- Mean Z Axis
46. FFT Body Acc STD X -- Std Deviation X Axis
47. FFT Body Acc STD Y -- Std Deviation Y Axis
48. FFT Body Acc STD Z -- Std Deviation Z Axis
49. FFT Body Acc Mean Freq X -- Mean Frequency X Axis
50. FFT Body Acc Mean Freq Y -- Mean Frequency Y Axis
51. FFT Body Acc Mean Freq Z -- Mean Frequency Z Axis
52. FFT Body AccJerk Mean X -- Mean X Axis
53. FFT Body AccJerk Mean Y -- Mean Y Axis
54. FFT Body AccJerk Mean Z -- Mean Z Axis
55. FFT Body AccJerk STD X -- Std Deviation X Axis
56. FFT Body AccJerk STD Y -- Std Deviation Y Axis
57. FFT Body AccJerk STD Z -- Std Deviation Z Axis
58. FFT Body AccJerk Mean Freq X -- Mean Frequency X Axis
59. FFT Body AccJerk Mean Freq Y -- Mean Frequency Y Axis
60. FFT Body AccJerk Mean Freq Z -- Mean Frequency Z Axis
61. FFT Body Gyro Mean X -- Mean X Axis
62. FFT Body Gyro Mean Y -- Mean Y Axis
63. FFT Body Gyro Mean Z -- Mean Z Axis
64. FFT Body Gyro STD X -- Std Deviation X Axis
65. FFT Body Gyro STD Y -- Std Deviation Y Axis
66. FFT Body Gyro STD Z -- Std Deviation Z Axis
67. FFT Body Gyro Mean Freq X -- Mean Frequency X Axis
68. FFT Body Gyro Mean Freq Y -- Mean Frequency Y Axis
69. FFT Body Gyro Mean Freq Z -- Mean Frequency Z Axis
70. FFT Body AccMag Mean  -- Mean Magnitude 
71. FFT Body AccMag STD  -- Std Deviation Magnitude 
72. FFT Body AccMag Mean Freq -- Mean Magnitude 
73. FFT Body AccJerkMag Mean  -- Mean Magnitude 
74. FFT Body AccJerkMag STD  -- Std Deviation Magnitude 
75. FFT Body AccJerkMag Mean Freq -- Mean Magnitude 
76. FFT Body GyroMag Mean  -- Mean Magnitude 
77. FFT Body GyroMag STD  -- Std Deviation Magnitude 
78. FFT Body GyroMag Mean Freq -- Mean Magnitude 
79. FFT Body GyroJerkMag Mean  -- Mean Magnitude 
80. FFT Body GyroJerkMag STD  -- Std Deviation Magnitude 
81. FFT Body GyroJerkMag Mean Freq -- Mean Magnitude 