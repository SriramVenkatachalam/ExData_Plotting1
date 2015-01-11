req_data1<-read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
colnames(req_data1)
lapply(req_data1,class)
copy_data<-req_data1
copy_data$Date<-as.Date(copy_data$Date,format="%d/%m/%Y")
temp<-head(copy_data)
lapply(copy_data,class)
date_extracted_data<-copy_data[copy_data$Date >= "2007-02-01" & copy_data$Date <= "2007-02-02",]
png(filename="D:/Academics/Data science lecture videos/Exploratory data analysis/Project 1/plot1.png",width=480,height=480)
hist(date_extracted_data$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (Kilowatts)")
dev.off()