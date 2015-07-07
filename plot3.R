#Reading data from working directory
hpower <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",
                     stringsAsFactors=FALSE)

#Subsetting data from 2007-02-01 to 2007-02-02
data <- hpower[hpower$Date %in% c("1/2/2007","2/2/2007") ,]

#Coverting date and time
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Making the plot using png(),plot(),lines(),legend() and dev.off()

png("plot3.png",width=480,height=480)
plot(datetime, data$Sub_metering_1, type="l", ylab="Energy Submetering",xlab="")
lines(datetime, data$Sub_metering_2, type="l", col="red")
lines(datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),lty=1)
dev.off()
