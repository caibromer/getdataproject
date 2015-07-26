run_analysis<- function(directory) {
  #Download and unzip files
  zipfile<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
  download.file(zipfile,destfile="dataset.csv",mode="wb")
  unzip("dataset.zip",exdir="./Project")
  
  #Read in files
  features<-read.table("Project_clean/UCI HAR Dataset/features.txt")
  test<-read.table("Project_clean/UCI HAR Dataset/test/X_test.txt")
  test_y<-read.table("Project_clean/UCI HAR Dataset/test/y_test.txt")
  subject_test<-read.table("Project_clean/UCI HAR Dataset/test/subject_test.txt")
  train<-read.table("Project_clean/UCI HAR Dataset/train/X_train.txt")
  train_y<-read.table("Project_clean/UCI HAR Dataset/train/y_train.txt")
  subject_train<-read.table("Project_clean/UCI HAR Dataset/test/subject_train.txt")
  featured<-as.vector(unlist(features[,2]))
  names(test)<-featured
  names(train)<-featured
  
  #Put in IDs and merge train and test
  test[,"id"]<-subject_test
  train[,"id"]<-subject_train
  
  
  featured<-as.vector(unlist(features[,2]))
  #mergd<-merge(test,train, by.x="id",by.y="id",all=TRUE)
}