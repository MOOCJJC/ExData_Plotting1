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

## Plot plot2
png(file = "plot2.png")
with(data, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()

## Plot plot3
png(file = "plot3.png")
with(data, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(data, lines(datetime, Sub_metering_1, col = "black"))
with(data, lines(datetime, Sub_metering_2, col = "red"))
with(data, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lty = "solid", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

## Plot plot4
png(file = "plot4.png")
par(mfrow = c(2,2))
with(data, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

with(data, plot(datetime, Voltage, type = "l"))

with(data, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(data, lines(datetime, Sub_metering_1, col = "black"))
with(data, lines(datetime, Sub_metering_2, col = "red"))
with(data, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lty = "solid", lwd = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(data, plot(datetime, Global_reactive_power, type = "l"))
par(mfrow = c(1,1))
dev.off()
