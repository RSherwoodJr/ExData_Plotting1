path <- "C:/Users/Randy/Dropbox/Coursera/4 Exploratory Data Analysis/Project 1"
setwd(path)

#read in full dataset
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)

#convert character date field to date type
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#subset data to only 2/1/2007-2/2/2007
data <- data[(data$Date >= as.Date("2007-02-01", "%Y-%m-%d") & data$Date <= as.Date("2007-02-02", "%Y-%m-%d")),]

#convert variables read as character to numeric type
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)

#create datetime variable
data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time, sep=" "), "%Y-%m-%d %H:%M:%S"))




#4
png("ExData_Plotting1-master/plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(data$DateTime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

plot(data$DateTime, data$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(data$DateTime, data$Sub_metering_1, col=c("black"), type="l", ylab="Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, col=c("red"), type="l")
lines(data$DateTime, data$Sub_metering_3, col=c("blue"), type="l")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1),
       bty="n")

plot(data$DateTime, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()
