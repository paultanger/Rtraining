# this is a comment, it doesn't run (use #)

# R can do math and stuff
# to run a line of code, shift enter or cmd enter
1 + 1
# to store the answer somewhere, assign it
# the thing to the left.. R will try to guess what type of variable to create (this can get really complicated)
a = 1 + 1 
# assigment operators
# some people prefer <- instead of =
# read about it here: http://blog.revolutionanalytics.com/2008/12/use-equals-or-arrow-for-assignment.html

# R can also store other things
text = "hello"
TwoThings = c("hello", "goodbye")
# We'll revisit this later, but get can parts of variables out
TwoThings[2]
# or put it somewhere else
Just2nd = TwoThings[2]

# try to create a variable to save your first and last name


# lots of ways to do everything in R

# Function : Anything that completes a task or set of tasks in R is a function. Most functions have a name, and take one or more arguments within parentheses. Examples include 'head()', 'colnames()', 'hist()', 'mean()', 'and plot()'  

# Argument : An input or an option that affects the result of a function. This often includes the data that the function runs on, AND specifications/options as to what the function should do. For example:

# we'll use some basic functions, like c 
# what is c ? Welcome to R help pages
?c()
# so let's try it
b = c(a,text)

# some functions don't need input ("arguements") to do anything
sessionInfo()
getwd()

# variable naming.. case sensitive.. common convention is CamelCase
# could also use underscores..
# some basic rules.. don't use special chars, don't start with numbers, etc
2things = (a,b) # won't work

# this is normally where people would try to teach variable types..
# logical (yes, no)
# numbers and vectors (1, 2)
# characters and strings (text), factors
# lists, dataframes, matrices

# factors are super important for ggplot and graphing
# by default, R tries to use factors
# sometimes this is not what you want
# easiest way to disable is when importing stringAsFactors=F
# or convert to strings
# read more: http://www.statmethods.net/input/datatypes.html

##################################
#### ORGANIZE YOUR SCRIPTS! ######
##################################

# modular, object oriented
# code in one place, data in another

# where are you now? This is the working directory
# This is where things will be saved by default
getwd()
# code should be here
sourcepath = getwd()

setwd(sourcepath)
# maybe your data is somewhere else
datapath = "~/Desktop/Test/"
setwd(datapath)
getwd()

# sometimes you want to play with example data
data("mtcars")
mtcars
# put it in another variable
OurData = mtcars
# this is a dataframe

# exploring data
summary(OurData)
colnames(OurData)
dim(OurData)
head(OurData)
tail(OurData)
str(OurData)

# missing data and NAs can mess up lots of things
# check for it, code it properly, check your output
# http://www.statmethods.net/input/missingdata.html

# can use column names with a $
OurData$mpg
# or with col number
OurData[,1]
# want a row?
OurData[1,1]

# iris data has categorical variables (factors)
data("iris")
levels(iris$Species)
summary(iris)

# can graph it
plot(OurData$mpg, OurData$cyl)

# GREAT examples here: 
# http://www.statmethods.net/graphs/index.html
# Boxplot of MPG by Car Cylinders 
boxplot(mpg~cyl,data=mtcars, main="Car Milage Data", 
        xlab="Number of Cylinders", ylab="Miles Per Gallon")
# what other options exist?
?boxplot()

# or test things
t.test(OurData$mpg ~ OurData$am)
cor(OurData$mpg, OurData$cyl, use="complete")

# export it.. where will this end up?
getwd()
write.csv(OurData, file = "OurData.csv")
# or save it somewhere else.. like in our repo
setwd(sourcepath)
write.csv(OurData, file = "OurData.csv")
# now we could commit to our repo


##################################
####    MANIPULATING DATA   ######
##################################

# packages

# for graphics
# base R
# lattice http://www.statmethods.net/advgraphs/trellis.html

# install.packages("ggplot2")
library(ggplot2)

# subsetting, bracketing, reshaping
# see other script

# let's install some we need
install.packages("reshape2") # only need to do once
# then load it
library(reshape2) # every time you start R
# packages are nice, but be careful.. base R is powerful!
# think twice if you can complete something use base R first

# long vs wide data
# http://www.cookbook-r.com/Manipulating_data/Converting_data_between_wide_and_long_format/
data(ChickWeight)
ChickWeight
chickwide = dcast(ChickWeight, Chick + Diet ~ Time)

# saving and loading sessions

# removing things

# functions

# vectorization.. the "apply" functions
