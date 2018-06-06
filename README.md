# Project for Getting and Cleaning Data of Data Science Specialization

This repository contains my solution to the Getting and Cleaning Data Peer Assessment.

Execute "run_analysis.R". The script automatically downloads and extract it to a new folder 'uci_data' in the current working directory. If you already have downloaded the zip file, create a new folder 'uci_data' and copy the zip file to it and named it as UCIData.zip.
The scripts have been tested on Windows Operating System with R version 3.4.4. Not on Mac OS X or Linux.


## Description of Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Steps performed to clean the data
- get the data to analyse
- read the test and training data and rowbind it to merge it
- Read the subject data
- Read the activity data
- Extract only the mean and s.d for each measurement
- Give descriptive names for all the columns
- Give proper names to every activity
- Add proper column names
- Generate UCI_CleanData.txt which contains the full data in a better organized way
- Creating a final tidy dataset with average of the variables for each activity and for every subject