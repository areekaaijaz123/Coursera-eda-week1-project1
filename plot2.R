data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- subset(data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

DateTime <- paste(data$Date, data$Time)

DateTime <- as.POSIXct(DateTime)

data <- cbind(DateTime, data)

data <- data[, !(names(data) %in% c("Date", "Time"))]

png(filename = "plot2.png", width = 480, height = 480)

plot(data$Global_active_power ~ data$DateTime, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()