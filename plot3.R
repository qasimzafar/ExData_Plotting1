powerConsumption <- read.csv("household_power_consumption.txt", header = TRUE,na.strings = "?", sep=";")

a <- powerConsumption[powerConsumption[,"Date"] == "1/2/2007", ]
b <- powerConsumption[powerConsumption[,"Date"] == "2/2/2007", ]
c <- merge.data.frame(a,b, all=TRUE)

png("Plot3.png")
plot(as.POSIXct(paste(c$Date, c$Time), format="%d/%m/%Y %H:%M:%S"), c$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "")

lines(as.POSIXct(paste(c$Date, c$Time), format="%d/%m/%Y %H:%M:%S"), c$Sub_metering_1, col="black")
lines(as.POSIXct(paste(c$Date, c$Time), format="%d/%m/%Y %H:%M:%S"), c$Sub_metering_2, col="red")
lines(as.POSIXct(paste(c$Date, c$Time), format="%d/%m/%Y %H:%M:%S"), c$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = c(1,1))
dev.off()