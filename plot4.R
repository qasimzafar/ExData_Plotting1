powerConsumption <- read.csv("household_power_consumption.txt", header = TRUE,na.strings = "?", sep=";")

a <- powerConsumption[powerConsumption[,"Date"] == "1/2/2007", ]
b <- powerConsumption[powerConsumption[,"Date"] == "2/2/2007", ]
c <- merge.data.frame(a,b, all=TRUE)

png("Plot4.png")

par(mfrow=c(2,2))

plot(as.POSIXct(paste(c$Date, c$Time), format="%d/%m/%Y %H:%M:%S"), c$Global_active_power, ylab = "Global Active Power", xlab = "", type="l")

plot(as.POSIXct(paste(c$Date, c$Time), format="%d/%m/%Y %H:%M:%S"), c$Voltage, ylab = "Voltage", xlab = "datetime", type="l")


plot(as.POSIXct(paste(c$Date, c$Time), format="%d/%m/%Y %H:%M:%S"), c$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "")

lines(as.POSIXct(paste(c$Date, c$Time), format="%d/%m/%Y %H:%M:%S"), c$Sub_metering_1, col="black")
lines(as.POSIXct(paste(c$Date, c$Time), format="%d/%m/%Y %H:%M:%S"), c$Sub_metering_2, col="red")
lines(as.POSIXct(paste(c$Date, c$Time), format="%d/%m/%Y %H:%M:%S"), c$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"),bty="n", lty = c(1,1), lwd = 0)

plot(as.POSIXct(paste(c$Date, c$Time), format="%d/%m/%Y %H:%M:%S"), c$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type="l")
dev.off()