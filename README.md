Running the script
===========================================================================================
- Clone the repository "GettingAndCleaningData"

- Download the data set from the location
"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
". Extract all the files. You should have a folder named "UCI HAR
Dataset" with all the extract files.

- Place run_analysis.R in the folder "UCI HAR Dataset"

- Set the working directory using the command setwd. For ex. If the
files are in the location "C:\Users\*yourname*\Documents\R\UCI HAR
Dataset\" ,
  then the command will be setwd("C:\Users\yourname\Documents\R\UCI
HAR Dataset\")

- If you do not have the data.table package loaded already, then
please install the package using the install.packages("data.table").
You can load the package using the command library(data.table).

- Run the script run_analysis.R in Rstudio using the command
source("run_analysis.R")

- The tidy dataset should get created in the current directory as
**tidy_dataset.txt**.