/* read the data into R */
file <- read.table("C:\\Users\\shradhasantuka\\Documents\\Coursera\\Exploratory Data Analysis\\Data\\household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

/*Covert the Date Column to Date class */
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")

/*Select the rows where date = 2007-02-02 or 2007-02-02 */
file2<- subset(file, file$Date == "2007-02-02" | file$Date == "2007-02-01")

/*Concatenate the date and time and convert it to POSIXlt */
file2$date_time = as.POSIXlt(paste(file2$Date,file2$Time, sep = " "))

/*To create the graph */
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(file2$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()

