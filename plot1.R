#Reading data from working directory
hpower <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",
                     stringsAsFactors=FALSE)

#Converting Character Date into class Date
hpower$Date <- as.Date(hpower$Date,format="%d/%m/%Y")

#Subsetting data from 2007-02-01 and 2007-02-02
data <- subset(hpower,(hpower$Date=="2007-02-01" | hpower$Date=="2007-02-02"))

#Making the plot

#Using PNG function for specified name,height and width
png("plot1.png",width=480,height=480)

#Calling hist()
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

dev.off()