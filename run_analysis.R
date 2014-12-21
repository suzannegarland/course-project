#Getting and Cleaning Data Course Project
#read and combine training group
vector <-read.table(file="UCI HAR Dataset/train/X_train.txt")
subject <-read.table(file="UCI HAR Dataset/train/subject_train.txt",
                     col.names="subject")
label <-read.table(file="UCI HAR Dataset/train/y_train.txt",
                     col.names="label")
train<-cbind(vector,subject,label)
#read and combine test group
vector <-read.table(file="UCI HAR Dataset/test/X_test.txt")
subject <-read.table(file="UCI HAR Dataset/test/subject_test.txt",
                     col.names="subject")
label <-read.table(file="UCI HAR Dataset/test/y_test.txt",
                   col.names="label")
test<-cbind(vector,subject,label)

# combine training and test groups
combined <- rbind(train, test)

#read feature names with punctation removed
featurenames <- read.table(file="featurenames.txt",
                           col.names="feature")
# assign meaningful column names
names(combined) <- featurenames$feature
names(combined)[562] <- "subject"
names(combined)[563] <- "label"

# use only mean and standard deviation features
selected_column <- c(1:6,41:46,81:86,121:126,161:166,201:202,
                     214,215,227,228,240,241,253,254,345:350,
                     503,504,516,517,529,530,542,543,562,563)
usefuldata <-combined[,selected_column]

#add text descriptions for activity label
usefuldata$activity <- factor(usefuldata$label,1:6,
                              c("WALKING",
                                "WALKING_UPSTAIRS",
                                "WALKING_DOWNSTAIRS",
                                "SITTING",
                                "STANDING",
                                "LAYING"))

#compute averages by activity and subject
average <-ddply(usefuldata,c("activity","subject"),colwise(mean))

#write averages as text
write.table(average, "courseproject.txt", row.names=FALSE)
