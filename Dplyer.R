#Dplyr <- manipulating data
#Tidyr <- cleaning data
#Pipe operator<- %>% <- simplify syntax

install.packages('dplyr')
install.packages('nycflights13')

library('dplyr')
library('nycflights13')

summary(flights)

#DPLYR functions:

#filter() and slice()
#arrange()
#select() and rename()
#distinct()
#mutate() and transmute()
#summarise()
#sample_n() and sample_frac()

#filter() : select subset of rows in a dataframe

head(filter(flights,carrier == 'AA',month == 11))
#without using dplyr library:
rain.is.true <- subset(df, subset = df$rain == T)

#slice(): Returns rows by positions
slice(flights,1:10)

#arrange() : order we wanna sort stuff by
head(arrange(flights,year,day,arr_time))
head(arrange(flights,year,day,desc(arr_time)))


#select():select only particular columns
select(flights,carrier,arr_time)

#rename(): rename a column
head(rename(flights,new_col_name = carrier))

#distinct(): select unique values in a column
distinct(flights,carrier)

#mutate(): create new column with some function to the old columns
head(mutate(flights,new_col = arr_delay-dep_delay))
select((mutate(flights,new_col = arr_delay-dep_delay)),new_col) #same as using transmute

#transmute(): returns only the new column created
head(transmute(flights,new_col = arr_delay-dep_delay))

#summarise(): type of an aggregate function
summarise(flights,avg_air_time = sum(air_time,na.rm = TRUE))

#sample_n() annd sample_frac(): returns sample rows
sample_frac(flights,0.1)#returns 10% of sample rows
sample_n(flights,10)#returns 10 samplerows

#PIPE OPERATOR
# data %>% op1 %>% op2 %>% op3... 
arrange(sample_n(filter(df,mpg > 20),5),desc(mpg))
#can be written as
df %>% filter(mpg > 20) %>% sample_n(size = 5) %>% arrange(desc(mpg))