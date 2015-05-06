#
# plot1.R - The Exploratory Data Analysis Course Project 1
#

# Read the data into powerData data.frame
#
print(paste("loading", powerFile))
powerFile <- "exdata-data-household_power_consumption/household_power_consumption.txt"
powerData <- read.csv(powerFile, sep = ";", na.strings = c("?"))

# Filter the dates 2007-02-01 and 2007-02-02
#
print(paste("filtering records"))
powerData$Days <- as.Date(strptime(powerData$Date, "%d/%m/%Y"))
startDate <- as.Date(strptime("2007-02-01", "%Y-%m-%d"))
endDate <- as.Date(strptime("2007-02-02", "%Y-%m-%d"))
plotData <- powerData[ powerData$Days >= startDate & powerData$Days <= endDate , ]
rm(powerData) # release the memory

# Print the requested plot into plot1.png
#
print(paste("plotting"))
png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(plotData$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()
