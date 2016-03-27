setwd("C:/Users/Kahlan.Maki/Dropbox/Coursera/Exploratory Data Analysis/Project 1")

df <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?", stringsAsFactors = FALSE)

df$Date <- as.Date(df$Date , "%d/%m/%Y")
df <- subset(df,Date == "2007-02-01" | Date == "2007-02-02")
df$DateTime <- paste(df$Date, df$Time)
df$DateTime = strptime(df$DateTime, "%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(x=(df$DateTime),y=df$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
