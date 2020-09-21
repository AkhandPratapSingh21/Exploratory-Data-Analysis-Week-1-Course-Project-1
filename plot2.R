
#Read in Data
download <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "temp")
unzip("temp")
unlink("temp")

#Carry out data analysis
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data$dt <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_subset <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Create figure
plot(data_subset$dt, data_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")


#Create png file
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")
plot(data_subset$dt, data_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()