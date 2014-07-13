## this R script assumes that you have downloaded and unzipped the data from the following link to a folder called "data" in your working directory: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

## read the full dataset
data <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

## subset the data for only Feb 1-2 2007
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## create a column with date and time
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S")

## create a line graph of Global active power
png(filename = "plot2.png", width = 480, height = 480)
with(data, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
