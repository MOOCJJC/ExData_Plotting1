## This is a script file records all the commands used to generate the results
## for Project 1 in the Cousera Course "Exploratory Data Analysis"


## download the dataset and unzip
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, "data.zip", mode="wb")
unzip("data.zip")

## load the data and subset the data needed
allData <- read.csv("household_power_consumption.txt", sep=";", colClasses = c("character","character", rep("numeric",7)), na.strings = "?")
data <- subset(allData, Date %in% c("1/2/2007","2/2/2007"))
rm(allData)

## convert the date and time to a new column
temp <- cbind(data, strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))
names(temp)[10] <- "datetime"
data <- temp
rm(temp)

## Plot plot1
png(file = "plot1.png")
hist(data$Global_active_power,breaks = 12, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()

