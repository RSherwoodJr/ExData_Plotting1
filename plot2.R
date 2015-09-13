path <- "C:/Users/Randy/Dropbox/Coursera/4 Exploratory Data Analysis/Project 1"
setwd(path)

#read in full dataset
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)

#convert character date field to date type
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#subset data to only 2/1/2007-2/2/2007
data <- data[(data$Date >= as.Date("2007-02-01", "%Y-%m-%d") & data$Date <= as.Date("2007-02-02", "%Y-%m-%d")),]

#convert variable to numeric type
data$Global_active_power <- as.numeric(data$Global_active_power)

#create datetime variable
data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time, sep=" "), "%Y-%m-%d %H:%M:%S"))

#open the png output system and write plot to file--note that the requirements don't specify
# that the plot must be made within R and then copied, so the code was written to only output to png
png("ExData_Plotting1-master/plot2.png", width=480, height=480)
plot(data$DateTime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
