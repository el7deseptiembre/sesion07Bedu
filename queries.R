library(dplyr)
library(DBI)
library(RMySQL)
install.packages("ggplot2")
library(ggplot2)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

dbListTables(MyDataBase)
dbListFields(MyDataBase, 'CountryLanguage')
DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage WHERE Language = 'Spanish'")
class(DataDB)
head(DataDB)

ggplot(data=DataDB, aes(x=IsOfficial, y=Percentage, fill=CountryCode)) + 
  geom_bar(stat="identity", position="dodge")
