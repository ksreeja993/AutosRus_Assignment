library(dplyr)

### Deliverable 1 ###

# import csv

MechaCar_mpg <- read.csv(file='./Data/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# Perform Linear regression 

#generate multiple linear regression model

# lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars) 

MechaCar_lm <-lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCar_mpg)
MechaCar_lm

# view using summary

summary(MechaCar_lm)

#view R squared

summary(MechaCar_lm)$r.squared

########## Deliverable 2 ############

Suspension_coil <- read.csv(file='./Data/Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

# create summary table

total_summary <- Suspension_coil %>%
  summarize(Mean=mean(PSI), Median =  median(PSI), Variance = var(PSI), Std_Dev = sd(PSI))
total_summary


# view by lots using groupby

lot_summary <- Suspension_coil %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean=mean(PSI), Median =  median(PSI), Variance = var(PSI), Std_Dev = sd(PSI))
lot_summary


########################## Deliverable 3 ##############################

#note: level of significance is 0.05

#null Hypothesis: mu=1500
# Alt Hypothesis: mu!=1500


t.test(Suspension_coil$PSI, mu=1500)

#analysis - p-value>0.05 therefore we fail to reject null Hypothesis.

# t test by lots

t.test(subset(Suspension_coil, Manufacturing_Lot =="Lot1")$PSI, mu=1500)

t.test(subset(Suspension_coil, Manufacturing_Lot =="Lot2")$PSI, mu=1500)

t.test(subset(Suspension_coil, Manufacturing_Lot =="Lot3")$PSI, mu=1500)
















