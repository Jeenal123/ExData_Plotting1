#Reading data from working directory
hpower <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",
                     stringsAsFactors=FALSE)

#Subsetting data from 2007-02-01 to 2007-02-02
data <- hpower[hpower$Date %in% c("1/2/2007","2/2/2007") ,]

#Coverting date and time
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Making the plot using png(),plot() and dev.off()

png("plot2.png",width=480,height=480)

plot(datetime,data$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")

dev.off()