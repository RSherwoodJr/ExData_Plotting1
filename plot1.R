path <- "C:/Users/Randy/Dropbox/Coursera/4 Exploratory Data Analysis/Project 1"
setwd(path)

#read in full dataset
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
attach(data)

#convert character date field to date type
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#subset data to only 2/1/2007-2/2/2007
data <- data[(data$Date >= as.Date("2007-02-01", "%Y-%m-%d") & data$Date <= as.Date("2007-02-02", "%Y-%m-%d")),]

#convert variable to numeric type
data$Global_active_power <- as.numeric(data$Global_active_power)

png("ExData_Plotting1-master/plot1.png", width=480, height=480)
hist(data$Global_active_power, col=c("red"), xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()