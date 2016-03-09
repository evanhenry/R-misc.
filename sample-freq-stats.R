choose.dir() 
choose.files()
#install.packages("lubridate")
library(lubridate)

h10906 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h10906.csv")
h20906 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h20906.csv")
h30906 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h30906.csv")
h40906 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h40906.csv")
h50906 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h50906.csv")
h60906 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h60906.csv")

h10914 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h10914.csv")
h20914 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h20914.csv")
h30914 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h30914.csv")
h40914 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h40914.csv")
h50914 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h50914.csv")
h60914 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h60914.csv")


h10921 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h10921.csv")
h20921 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h20921.csv")
h30921 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h30921.csv")
h40921 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h40921.csv")
h50921 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h50921.csv")
h60921 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h60921.csv")


h10928 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h10928.csv")
h20928 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h20928.csv")
h30928 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h30928.csv")
h40928 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h40928.csv")
h50928 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h50928.csv")
h60928 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/09/h60928.csv")


h11005 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/10/h11005.csv")
h21005 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/10/h21005.csv")
h31005 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/10/h31005.csv")
h41005 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/10/h41005.csv")
h51005 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/10/h51005.csv")
h61005 <- read.csv("C:/Users/N/Desktop/thesis/2015Data/10/h61005.csv")

#consolidate data
h1<- rbind(h10906,h10914,h10921,h10928,h11005)
h2<- rbind(h20906,h20914,h20921,h20928,h21005)
h3<- rbind(h30906,h30914,h30921,h30928,h31005)
h4<- rbind(h40906,h40914,h40921,h40928,h41005)
h5<- rbind(h50906,h50914,h50921,h50928,h51005)
h6<- rbind(h60906,h60914,h60921,h60928,h61005)

# #lapply
# dfList<-list(h1,h2,h3,h4,h5,h6)
# lapply(dfList, function(x) {
#   ymd_hms(x$time)
# }
# )

library(lubridate)
h1$time<-ymd_hms(h1$time) #convert to POSIX format
h2$time<-ymd_hms(h2$time) #convert to POSIX format
h3$time<-ymd_hms(h3$time) #convert to POSIX format
h4$time<-ymd_hms(h4$time) #convert to POSIX format
h5$time<-ymd_hms(h5$time) #convert to POSIX format
h6$time<-ymd_hms(h6$time) #convert to POSIX format

##HIVE 1
#minute average discrepancies
h1$day <- cut(h1$time, breaks = "day") # make column per hours
h1$minute <- cut(h1$time, breaks = "min") # make column per hours

#remove unnecessary data
h1m<- aggregate(cbind(count = hive_id) ~ day*minute, 
                   data = h1, 
                   FUN = function(x){NROW(x)})
#take means of minute per day 
h1m2<-aggregate(h1m[3], list(h1m$day), mean)


##HIVE 2
#minute average discrepancies
h2$day <- cut(h2$time, breaks = "day") # make column per hours
h2$minute <- cut(h2$time, breaks = "min") # make column per hours

#remove unnecessary data
h2m<- aggregate(cbind(count = hive_id) ~ day*minute, 
                data = h2, 
                FUN = function(x){NROW(x)})
#take means of minute per day 
h2m2<-aggregate(h2m[3], list(h2m$day), mean)

##HIVE 3
#minute average discrepancies
h3$day <- cut(h3$time, breaks = "day") # make column per hours
h3$minute <- cut(h3$time, breaks = "min") # make column per hours

#remove unnecessary data
h3m<- aggregate(cbind(count = hive_id) ~ day*minute, 
                data = h3, 
                FUN = function(x){NROW(x)})
#take means of minute per day 
h3m2<-aggregate(h3m[3], list(h3m$day), mean)


##HIVE 4
#minute average discrepancies
h4$day <- cut(h4$time, breaks = "day") # make column per hours
h4$minute <- cut(h4$time, breaks = "min") # make column per hours

#remove unnecessary data
h4m<- aggregate(cbind(count = hive_id) ~ day*minute, 
                data = h4, 
                FUN = function(x){NROW(x)})
#take means of minute per day 
h4m2<-aggregate(h4m[3], list(h4m$day), mean)

##HIVE 5
#minute average discrepancies
h5$day <- cut(h5$time, breaks = "day") # make column per hours
h5$minute <- cut(h5$time, breaks = "min") # make column per hours

#remove unnecessary data
h5m<- aggregate(cbind(count = hive_id) ~ day*minute, 
                data = h5, 
                FUN = function(x){NROW(x)})
#take means of minute per day 
h5m2<-aggregate(h5m[3], list(h5m$day), mean)

##HIVE 6
#minute average discrepancies
h6$day <- cut(h6$time, breaks = "day") # make column per hours
h6$minute <- cut(h6$time, breaks = "min") # make column per hours

#remove unnecessary data
h6m<- aggregate(cbind(count = hive_id) ~ day*minute, 
                data = h6, 
                FUN = function(x){NROW(x)})
#take means of minute per day 
h6m2<-aggregate(h6m[3], list(h6m$day), mean)

