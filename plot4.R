## this R script assumes that you have downloaded and unzipped the data from the following link to a folder called "data" in your working directory: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

## read the full dataset
data <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

## subset the data for only Feb 1-2 2007
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## create a column with date and time
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S")


## open a png file
png(filename = "plot4.png", width = 480, height = 480)

# set the grid for display
par(mfrow = c(2, 2))
# make the first plot
with(data, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

# make the second plot
with(data, plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

# make the third plot
with(data, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(data, lines(datetime, Sub_metering_2, col = "red"))
with(data, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", legend = names(data)[7:9], lty= "solid", col = c("black", "red", "blue"), bty = "n")

# make the fourth plot
with(data, plot(datetime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

# close the pgn file
dev.off()
