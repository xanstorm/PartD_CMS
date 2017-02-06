setwd("/Users/stephenhobbs1/Data science/DataChallenge")
data<-read.csv("PartD_Prescriber_PUF_NPI_14.csv",stringsAsFactors=FALSE,header = TRUE)
data<-read.table("PartD_Prescriber_PUF_NPI_13.tab",stringsAsFactors=FALSE,header = TRUE)
library(dplyr)
#Exploratory data analysis
str(data)
head(data, n=3)
dim(data)
summary(data)

#In 2014, what was the average number of beneficiaries per provider? 
sprintf("%.10f",mean(data$BENE_COUNT, na.rm = TRUE))
148.5827801909

#What is the median, in days, of the distribution of this value across all providers? 
sprintf("%.10f", median(mean(data$TOTAL_DAY_SUPPLY)-mean(data$TOTAL_CLAIM_COUNT, na.rm=TRUE)))
50858.3527358558

#Find the ratio of beneficiaries with opioid prescriptions
#to beneficiaries with antibiotics prescriptions in each state.
#What is the difference between the largest and smallest ratios? 

opio<-sum(data$OPIOID_BENE_COUNT,na.rm = TRUE)
anti<-sum(data$ANTIBIOTIC_BENE_COUNT,na.rm=TRUE)

ratio1<-opio/anti#Ratio of opioid to antibiotics
ratio1
state<-select(data,NPPES_PROVIDER_STATE)
state
state1<-filter(data,NPPES_PROVIDER_STATE)
anti1<-aggregate(data$ANTIBIOTIC_BENE_COUNT, by=list(state=data$NPPES_PROVIDER_STATE), FUN=mean,na.rm=TRUE)
opio1<-aggregate(data$OPIOID_BENE_COUNT, by=list(state=data$NPPES_PROVIDER_STATE), FUN=mean,na.rm=TRUE)
.6670235546
#What is the standard deviation of these fractions? 
0.0672817012 # I resorted to Excel to answer this question. My R skills are not good enough yet.

# What is the Pearson correlation coefficient between these values? 
0.0512157739 # I used Excel to solve this.

#Let's find which states have surprisingly high supply of opioids, conditioned on specialty. 
#What is the largest such ratio? 
14.6513104280 #I used Excel for this one, too.

#I was not able to unzip and load the 2013 data, unfortunately.


