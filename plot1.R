# This script creates Plot 1 from Individual household electric power consumption Data Set
# for dates  2007-02-01 and 2007-02-02
# The plot will be constructed using the base plotting system

library(sqldf)

if(!dir.exists("./hpc")){dir.create("./hpc")}

setwd("./hpc")

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "household_power_consumption.zip")

# 	Unzip file

unzip("household_power_consumption.zip",exdir = ".")

# 	Read data from dates 2007-02-01 and 2007-02-02 only to dataframe hpc_df

hpc_df<-read.csv2.sql("household_power_consumption.txt",sql="select * from file where Date = '1/2/2007' OR Date = '2/2/2007'",sep=";")


if(!dir.exists("./plots")){dir.create("./plots")}

# Launch png file device

png(filename="./plots/plot1.png",width = 480, height = 480, units = "px")

#	Plot

hist(hpc_df$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

# Close png file device
dev.off()
