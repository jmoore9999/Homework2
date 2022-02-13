#1

#The below code is creating 3 columns called Name, State, and Sales.
#The columns are being filled with data and assigned to a dataframe called df1.
df1=data.frame(Name=c('James','Paul','Richards','Marico','Samantha','Ravi','Raghu',
                      'Richards','George','Ema','Samantha','Catherine'),
               State=c('Alaska','California','Texas','North Carolina','California','Texas',
                       'Alaska','Texas','North Carolina','Alaska','California','Texas'),
               Sales=c(14,24,31,12,13,7,9,31,18,16,18,14))

#The aggregate function is creating subgroups of the dataframe by state, and is pulling each states sales data.
#FUN is them computing the summary statistics for the each subgroup, or in this case, each state.
aggregate(df1$Sales, by=list(df1$State), FUN=sum)

#Importing the dplyr library. 
library(dplyr)

#The function below is doing the same thing as the aggregate one above. 
#Instead of using aggregate, this is using the dplyr library.
# %>% is passing the left hand side of the operator to the first argument of the right hand side of the operator.
#summarise uses the dyplr library to get a summary of a column of data. 
#in this example, summarise is getting the sum of sales by state since the state grouping was passed to the summarise operator.
df1 %>% group_by(State) %>% summarise(sum_sales = sum(Sales))

#2a
df = read.csv("~/Documents/WorldCupMatches.csv", header = T) #creates the df from the World Cup Matches csv file
dim(df)

#2b 
summary(df)

#2c
unique(df$City)

#2d
mean(df$Attendance, na.rm = TRUE)

#2e
aggregate(df$Home.Team.Goals, by=list(df$Home.Team.Name), FUN=sum)

#2f
aggregate(df$Attendance, by=list(df$Year), FUN=mean)

#3a
df = read.csv("~/Documents/metabolite.csv", header = T)
df %>% count(Label)

#3b
colSums(is.na(df))

#3c
library(tidyr)
df2 = df %>% drop_na(Dopamine)
dim(df2)
df2$c4.OH.Pro

#3d
df2$c4.OH.Pro[is.na(df2$c4.OH.Pro)]<-median(df2$c4.OH.Pro,na.rm=TRUE)
df2$c4.OH.Pro

