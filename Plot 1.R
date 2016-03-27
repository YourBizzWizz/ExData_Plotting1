setwd("C:\\Users\\Owner\\Google Drive\\___Coursera\\Data Science\\Assignments\\Completed\\Exploratory Data Analysis\\Project 1")

df <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?", stringsAsFactors = FALSE)

df$Date <- as.Date(df$Date , "%d/%m/%Y")
df <- subset(df,Date == "2007-02-01" | Date == "2007-02-02")

png("plot1.png", width = 480, height = 480)
hist(df$Global_active_power,main="Global Active Power",ylab="Frequency",xlab="Global Active Power (kilowatts)",col="red",ylim=c(0,1200))
dev.off()

