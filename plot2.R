file <- read.table("C:\\Users\\shradhasantuka\\Documents\\Coursera\\Exploratory Data Analysis\\Data\\household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

file$Date <- as.Date(file$Date, format = "%d/%m/%Y")

file2<- subset(file, file$Date == "2007-02-02" | file$Date == "2007-02-01")

file2$date_time = as.POSIXlt(paste(file2$Date,file2$Time, sep = " "))

png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(file2$date_time,file2$Global_active_power,type = 'l', xlab = "", ylab = "Global Active Power (killowatts)" )
dev.off()