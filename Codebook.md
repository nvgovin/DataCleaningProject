#This document provides information about the generated set by the script run_analysis.R, provided in this repository.

#Data set Data.txt

The dataset Data.txt is the result of cleaning and selecting data provided by coursera.

#Here follows a description of what Data.txt looks like.

The first variable subject denotes the subject number that performed an activity. In total there are 30 subjects.

The second variable activity denotes the activity performed by the subject. There are six activites, listed here:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

All other variables are the measures that were properly labeled.

#Process

1. First the data was imported into R 
2. The data was merged into one dataset 
3. The measurement columns were named after the feature names, and names were given to the id columns
4. A data frame whose measurement columns contain only mean and st. dev features
was created
5. Trim the rows to the 180 needed to show mean values for each subject-activity pair
6. Output the data to "Data.txt"

