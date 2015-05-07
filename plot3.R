#
# plot3.R - The Exploratory Data Analysis Course Project 1
#

# Read the data into powerData data.frame
#
powerFile <- "exdata-data-household_power_consumption/household_power_consumption.txt"
print(paste("loading", powerFile))
powerData <- read.csv(powerFile, sep = ";", na.strings = c("?"))

# Filter the dates 2007-02-01 and 2007-02-02
#
print(paste("filtering records"))
powerData$Days <- as.Date(strptime(powerData$Date, "%d/%m/%Y"))
startDate <- as.Date(strptime("2007-02-01", "%Y-%m-%d"))
endDate <- as.Date(strptime("2007-02-02", "%Y-%m-%d"))
plotData <- powerData[ powerData$Days >= startDate & powerData$Days <= endDate , ]
rm(powerData) # release the memory

# add a column with datetime
#
plotData$t <- strptime(paste(plotData$Date, plotData$Time), "%d/%m/%Y %H:%M:%S")

# Print the requested plot into plot3.png
#
print(paste("plotting"))

png(file = "plot3.png", width = 480, height = 480, units = "px")

plot(x = plotData$t,
     y = plotData$Sub_metering_1,
     type = "l",
     xlab = " ",
     ylab = "Energy sub metering",
     col = "black")

lines(x = plotData$t,
      y = plotData$Sub_metering_2,
      type = "l",
      col = "red")

lines(x = plotData$t,
      y = plotData$Sub_metering_3,
      type = "l",
      col = "blue")

legend("topright", pch = "-",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
