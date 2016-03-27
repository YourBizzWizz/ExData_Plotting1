setwd("C:/Users/Kahlan.Maki/Dropbox/Coursera/Exploratory Data Analysis/Project 1")

df <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?", stringsAsFactors = FALSE)

df$Date <- as.Date(df$Date , "%d/%m/%Y")
df <- subset(df,Date == "2007-02-01" | Date == "2007-02-02")
df$DateTime <- paste(df$Date, df$Time)
df$DateTime = strptime(df$DateTime, "%Y-%m-%d %H:%M:%S")
head(df$DateTime)

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(x=(df$DateTime),y=df$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

plot(x=(df$DateTime),y=df$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(x=(df$DateTime),y=df$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=(df$DateTime),y=df$Sub_metering_2,col="red")
lines(x=(df$DateTime),y=df$Sub_metering_3,col="blue")
legend("topright", bty = "n",col = c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd = 1)

plot(df$DateTime, df$Global_reactive_power, type = "l", main = "", xlab = "datetime",ylab = "Global_reactive_power")

dev.off()
