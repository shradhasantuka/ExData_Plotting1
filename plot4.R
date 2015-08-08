
/* read the data into R  */
file <- read.table("C:\\Users\\shradhasantuka\\Documents\\Coursera\\Exploratory Data Analysis\\Data\\household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

/* Covert the Date Column to class date */
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")


/* Select the rows where date = 2007-02-02 or 2007-02-02  */
file2<- subset(file, file$Date == "2007-02-02" | file$Date == "2007-02-01")

/*concatenate date and time column and convert it to POSIXlt */
file2$date_time = as.POSIXlt(paste(file2$Date,file2$Time, sep = " "))

/*Create the graph */
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))

/*1st GRAPH */
plot(file2$date_time,file2$Global_active_power,type = 'l', xlab = "", ylab = "Global Active Power")

/*2nd GRAPH */
plot(file2$date_time, file2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage" )

/* 3rd GRAPH */
with(file2,plot(file2$date_time, file2$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering"))
with(file2, lines(file2$date_time, file2$Sub_metering_2, col = "red"))
with(file2, lines(file2$date_time, file2$Sub_metering_3, col = "blue"))
legend("topright",pch = "-", col = c('black',"red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

/* 4th GRAPH */
plot(file2$date_time,file2$Global_reactive_power,type = 'l', xlab = "datetime", ylab = "Global_reactive_power")

dev.off()




