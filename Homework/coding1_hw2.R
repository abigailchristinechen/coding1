##########################
##     HOMEWORK         ##
##      CLASS 2         ##
##       CEU            ##
##########################

# 0) Clear work space
rm(list = ls())

# 1) Load both data from github page and inspect (summary,glimpse)
#   Hint: you will need the `raw.github...` url address

library( tidyverse )
library( readr )
# for schools csv
schools <- read.csv( "https://raw.githubusercontent.com/CEU-Economics-and-Business/ECBS-5208-Coding-1-Business-Analytics/master/class_2/data/assignment_2/raw/CASchools_schools.csv")
view( schools )
head( schools )
glimpse( schools )
summary( schools )

# for scores csv
scores <- read.csv( "https://raw.githubusercontent.com/CEU-Economics-and-Business/ECBS-5208-Coding-1-Business-Analytics/master/class_2/data/assignment_2/raw/CASchools_scores.csv")
view( scores )
head( scores )
glimpse( scores )
summary( scores )

# 2) Merge the two data table into one called `df`
df  <- merge(x = schools, y = scores)
view (df)

# 3) Put the district variable into numeric format
typeof( df$district )
as.numeric( df$district )
is.numeric( df$district )

# 4) Create two new variables from `school_county`: 
#     - school should contain only the name of the school - character format
#     - county should only contain the name of the county - factor format
df <- separate( df, df$school_county , "-" ,
                into = c( "ycf","cjkk" ) )
rlang::last_error()
df <- mutate( df, school = character( school) )
df <- mutate( df, county = factor( county ) )

df <- mutate( df , acc_type = factor( acc_type ) )
# check if it is a factor
is.factor( df$acc_type )

df <- separate( df ,  guestreviewsrating , "/" , 
                into = c( "ratings" ) )
typeof( df$ratings )



# 5) Find missing values, write 1 sentence what and why to do what you do and execute.
# as they seems to be completly random, we can drop these observations


# 6) Create a new variable called `score` which averages the english, math and read scores
score <- ave( df$english, df$read, df$math , na.rm = TRUE )

# 7) Find the county which has the largest number of schools in the data 
#     and calculate the average and the standard deviation of the score.

