#combining git and r to query a database 
#Jessica Sieber
#2015-01-06

#install and load a new package
install.packages("RSQLite", dependencies=T)
library(RSQLite)

#locate the database files into the sql-practice folder

driver <- dbDriver("SQLite")
con <- dbConnect(driver, "portal_mammals.sqlite")
results <- dbGetQuery(con,"SELECT species, wgt, year from surveys")
dbDisconnect(con)
#plot my results
plot(results$year, results$wgt)