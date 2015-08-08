file <- read.table("C:\\Users\\shradhasantuka\\Documents\\Coursera\\Exploratory Data Analysis\\Data\\household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

file$Date <- as.Date(file$Date, format = "%d/%m/%Y")

file2<- subset(file, file$Date == "2007-02-02" | file$Date == "2007-02-01")

file2$date_time = as.POSIXlt(paste(file2$Date,file2$Time, sep = " "))

png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
plot(file2$date_time,file2$Global_active_power,type = 'l', xlab = "", ylab = "Global Active Power")

plot(file2$date_time, file2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage" )

with(file2,plot(file2$date_time, file2$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering"))
with(file2, lines(file2$date_time, file2$Sub_metering_2, col = "red"))
with(file2, lines(file2$date_time, file2$Sub_metering_3, col = "blue"))
legend("topright",pch = "-", col = c('black',"red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(file2$date_time,file2$Global_reactive_power,type = 'l', xlab = "datetime", ylab = "Global_reactive_power")

dev.off()