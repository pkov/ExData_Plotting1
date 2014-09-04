infile="household_power_consumption.txt"
outfile="plot2.png"
power<-read.table(infile,sep=";",colClasses=c("character","character",rep("numeric",7)),header=TRUE,na.strings="?")
p<-power[as.Date(power$Date,format="%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(power$Date,format="%d/%m/%Y") <= as.Date("2007-02-02"),]
p$Date<-as.Date(p$Date,format="%d/%m/%Y")
png(filename=outfile,width = 480, height = 480, units = "px")
Sys.setlocale(category="LC_ALL", locale="English") ## set locale to English to have english day names in plot
plot(with(p,strptime(paste(Date,Time),format="%Y-%m-%d %H:%M:%S")),p$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
