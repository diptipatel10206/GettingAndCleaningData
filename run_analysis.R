# This script generates tidy data for data analysis of Human Activity Recognition.
#Steps taken to generate the final tidy dataset
#1) Read the activity labels and features into R
#2) Cleaned feature names
#3) Read the subject, train and test data sets - ignore the Inertial Signal folders
#4) Add column names to activity, subjects and both data sets 
#5) Extract the mean and std measurements from both data sets
#6) Merge/combine the subjects, activities, means and stds for each test/train data set
#7) Merge/combine the test and train data sets <- tidy data set 1
#8) Group by subject and activity then calculate the average of each feature (variable)
#9) write out final tidy data set in csv

######### Start of script ###########

        #Turn warnings off/on
        options(warn=-1) #off
              
        # acquire dplyr package
        library(dplyr)
                
        # assign variables to each file that contains the liAddst of activities and features 
        fileActivity<-"./UCI HAR Dataset/activity_labels.txt"
        fileFeature<-"./UCI HAR Dataset/features.txt"
        
        # read in the list of activities and features and remove characters for readability
        activityLabel<-read.table(fileActivity)
        features<-read.table(fileFeature, check.names=TRUE)
        features$V2<-gsub("[-\\(\\)]", "", features$V2)
       
        # create vector for the type of data
        DataSet<-c("train", "test")
        
        # This portion of the code will need to be run for both Train and Test datasets
        # 
        for (j in DataSet) {
                # This section reads in the readings, activities and subjects      
                fileXtrials<-paste("./UCI HAR Dataset/",j,"/X_",j,".txt", sep="")
                fileYact<-paste("./UCI HAR Dataset/",j,"/Y_",j,".txt", sep="")
                fileSubject<-paste("./UCI HAR Dataset/",j,"/subject_",j,".txt", sep="")
                
                trials<-read.table(fileXtrials)
                sub<-read.table(fileSubject)
                act<-read.table(fileYact)
                
                # assign column names to the readings file from the features list
                colnames(trials)<-features$V2
                colnames(sub)<-"subjects"
                colnames(act)<-"activity"
                
                #translate the activity column in act table to readable/usable values
                for (i in 1:6) act$activity[act$activity==i]<-levels(activityLabel$V2[i])[activityLabel$V2[i]]
                
                # Extract the mean and std variables from the readings
                meanT<-trials[grep("mean",names(trials))]
                stdT<-trials[grep("std",names(trials))]
                
                # combine the columns of like data sets
                if (j=="train") {
                        trainDS<-cbind(sub,act,meanT,stdT)
                }else {
                        testDS<-cbind(sub,act,meanT,stdT)
                }
                
                # clean up temp variables
                rm(trials,sub,act,meanT,stdT)        
        } # end of for DataSet loop
        
        # combine both Train and Test data sets to create Tidy Data 1
        HumanActRecog1<-rbind(trainDS,testDS)
        # clean up temp variables
        rm(trainDS,testDS)

        # group the tiday data by subject and activity then average each feature
        HumanActRecog<-group_by(HumanActRecog1,subjects,activity)%>%
                summarise_each(funs(mean))

        # write the final Tidy Data set to a csv file
        write.csv(HumanActRecog, file="./HumanActRecog.csv", row.names=FALSE)
        
        options(warn=0)  #on
        
        
# End of script run_analysis.R  
        
        
        