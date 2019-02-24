install.packages("RMySQL","dbConnect")
library(RMySQL)
library(dbConnect)

#to connect
mydb = dbConnect(MySQL(), user='root', password='ammiabbu1991', dbname='org', host='localhost')

#to list tables 
dbListTables(mydb)

#to list fields in a table
dbListFields(mydb, 'bonus')

#bringing data from mysql to r
db_query<-"select WORKER_REF_ID from bonus"
df<-dbGetQuery(mydb,db_query) 
df


#sending data from r to mysql
#overwrite=TRUE, will create new table db_out1 if it is not there or if it is there it will overwrite it
#here if overwrite is true than append will be false or if overwrite is false than append will be true by default
db_out<-df
dbWriteTable(mydb,"db_out12",db_out,overwrite=TRUE,append=FALSE)



#closing the connections
dbDisconnect(mydb)

