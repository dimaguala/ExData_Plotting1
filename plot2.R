# plot2.R

df <- read.table("household_power_consumption.txt",
                 skip = 66637, nrow = 2880, sep = ";", 
                 col.names = colnames(read.table(
                     "household_power_consumption.txt",
                     nrow = 1, header = TRUE, sep=";")))

png("plot2.png")

# turn off locale-specific sorting
Sys.setlocale("LC_TIME", "C")

# combine the date and time character columns and convert them into
# Date-time format in order to access the day of the week
w <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

# plot Global active power across the week days of data
plot(w, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()