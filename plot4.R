# plot4.R

df <- read.table("household_power_consumption.txt",
                 skip = 66637, nrow = 2880, sep = ";", 
                 col.names = colnames(read.table(
                     "household_power_consumption.txt",
                     nrow = 1, header = TRUE, sep=";")))

png("plot4.png")
Sys.setlocale("LC_TIME", "C")
w <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

# set the graphics parameter to plot 4 plots in a 2-by-2 fashin
par(mfrow = c(2, 2))

# first plot
plot(w, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# second plot
plot(w, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# third plot
plot(w, df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(w, df$Sub_metering_2, type = "l", col = "red")
lines(w, df$Sub_metering_3, type = "l", col = "blue")

# remove the box around the legend
legend("topright", bty = "n" , lty = c(1, 1), col = c("black", "red", "blue"), legend = names(df[7:9]))

# fourth plot
plot(w, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = names(df)[4])
dev.off()