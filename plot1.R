infile="household_power_consumption.txt"
outfile="plot1.png"
power<-read.table(infile,sep=";",colClasses=c("character","character",rep("numeric",7)),header=TRUE,na.strings="?")
p<-power[as.Date(power$Date,format="%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(power$Date,format="%d/%m/%Y") <= as.Date("2007-02-02"),]
png(filename=outfile,width = 480, height = 480, units = "px")
hist(p$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
