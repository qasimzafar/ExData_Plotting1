powerConsumption <- read.csv("household_power_consumption.txt", header = TRUE,na.strings = "?", sep=";")

a <- powerConsumption[powerConsumption[,"Date"] == "1/2/2007", ]
b <- powerConsumption[powerConsumption[,"Date"] == "2/2/2007", ]
c <- merge.data.frame(a,b, all=TRUE)

png("Plot2.png")
with(c, plot( as.POSIXct(paste(c$Date, c$Time), format="%d/%m/%Y %H:%M:%S"), Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab=""))
dev.off()