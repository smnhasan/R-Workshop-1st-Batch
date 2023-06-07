#shortcuts
# '#' comments sign
#Run = ctrl + enter
#zoom in = ctrl + +
#zoom out = ctrl + -
# "<-" assignment operator
# [] used to show index of vector, matrix, array, list or dataframe
# "\\", "/" = file path
# "\n" = newline
# "\t" = tab
#Recall is the mental search of information, whereas recognition is the mental familiarity with information.

#Simple Calculator
2+3
2-2

#Vectors, matrices, arrays, dataframes

#vector
a <- c(1,4,3) #numeric vector
a

b <- c("One", "Two", "Three") #char vector
b

c <- c(TRUE, FALSE, TRUE) #logical vector
c

a[c(2)] #2nd element of "a" vector


#Matrices
#R*C
#generates 5*4 numeric matrix

y <- matrix(1:20, nrow = 5, ncol=)
y

z <- matrix(1:20, nrow = 5, ncol=4, byrow = T)
z

#Vector to matrix

x <- matrix(a, nrow = 2, ncol=2, byrow = T)
x

#Vector to matrix with row and col names

rnames <- c("R1","R2")
cnames <- c("C1","C2")

x <- matrix(a, nrow = 2, ncol=2, byrow = T, dimnames = list(rnames,cnames))
x

x[2,] #2nd row of "x" matrix

x[,2] #2nd col of "x" matrix

x[2,2] #2nd col of "x" matrix


#data frames

datf <- data.frame(a,b,c)
datf

#data frames col names
names(datf) <- c("ID", "Number","Admit")
datf

#data frames variable call
datf$ID
datf$Number
datf$Admit

#data frames value call
datf[3,2]

#data frames variable call
datf[c("ID","Number")]

#Useful Function

length(a) #number of elements
length(y) #number of elements
length(datf) #number of variables (for data frame)

str(a) #structure of an object
str(b) #structure of an object
str(c) #structure of an object
str(y) #structure of an object
str(datf) #structure of an object

class(a) #class (numeric, logi, char)

names(datf) #col/variable names

cbind(a,b) #combine vectors/variables as a col
rbind(a,b) #combine vectors/variables as a row

c() #combined objects

ls(datf) #list of dataframe

rm(a) #remove a vector...........
a

View(datf) #View in Excel format


#Importing comma separated value (csv) data files

#datacsv <- read.csv("E:\\ResearchProject\\Aminul\\R Workshop\\Day3\\hs0.csv")

datacsv <- read.table("E:\\ResearchProject\\Aminul\\R Workshop\\Day3\\hs0.csv", header = T, sep = ',')
datacsv


View(datacsv)
str(datacsv)
class(datacsv)

head(datacsv) #1st few rows in dataset
tail(datacsv) #last few rows in dataset

#Importing tab deliminated data files

datatab <- read.table("E:\\ResearchProject\\Aminul\\R Workshop\\Day3\\hs0.txt", header = T, sep = '\t')
datatab

#Importing Excel data files

install.packages("readxl")
library("readxl")

#my_data <- read_excel("my_file.xlsx", sheet = "data")

dataexcel <- read_excel("E:\\ResearchProject\\Aminul\\R Workshop\\Day3\\hs0.xlsx")
dataexcel

#Importing SPSS data files

install.packages("haven")
library("haven")

#dataspss <- as.data.frame(read.spss('BDKR70FL.sav',use.value.labels=F),stringsAsFactors = FALSE)

dataspss <- read_spss("E:\\ResearchProject\\Aminul\\R Workshop\\Day3\\hs0.sav")
dataspss
View(dataspss)

#Try it (stata (package:foreign), sas (package:sas7bdat))
install.packages("foreign")
library("foreign")
datasta <- read.dta("E:\\ResearchProject\\Aminul\\R Workshop\\Day3\\hs0.dta")
dataspss

#read.dta() #stata
#read.sas7bdat() #SAS



#Exporting comma separated value (csv) data files

setwd("E:\\ResearchProject\\Aminul\\R Workshop\\Day4")

write.csv(datacsv,"csvdata.csv")

head(datacsv)

#Variable label
library(Hmisc)
label(datacsv$gender) <- "Student Gender"
describe(datacsv)

#factor
is.factor(datacsv$gender)
is.numeric(datacsv$gender)

#recode into same variable
#recode into different variable
datacsv$genderfactor <- factor(datacsv$gender)
is.factor(datacsv$genderfactor)
str(datacsv$genderfactor)

# value labels
# variable gender was coded as 0 and 1
# We want to attach value labels as 0=Male and 1= Female
datacsv$gender <- factor(datacsv$gender,
                         levels = c(0,1),
                         labels = c("Male", "Female"))

str(datacsv$genderfactor)
View(datacsv)

#order variable
is.ordered(datacsv$ses)
is.numeric(datacsv$ses)

datacsv$sesordered <- ordered(datacsv$ses)
is.ordered(datacsv$sesordered)
str(datacsv$sesordered)

# value labels
# variable ses was coded as 1, 2 and 3
# We want to attach value labels as 0=Male and 1= Female
datacsv$sesordered <- factor(datacsv$ses,
                             levels = c(1,2,3),
                             labels = c("Poor", "Middle", "Rich"))

str(datacsv$sesordered)
View(datacsv)

#likert scale
#1 (Agreee), 2, 3, 4, 5(Disagree)

#Numeric to category

datacsv$racecat[datacsv$race <2] <- "Black"
datacsv$racecat[datacsv$race ==2] <- "Brown"
datacsv$racecat[datacsv$race >2] <- "White"

#Numeric to numeric

datacsv$racecat[datacsv$race <2] <- 10
datacsv$racecat[datacsv$race ==2] <- 20
datacsv$racecat[datacsv$race >2] <- 30

View(datacsv)

#Missing data

#Count missing row of a variable
is.na(datacsv$science)
factor(is.na(datacsv$science))
describe(datacsv$science)
describe(factor(is.na(datacsv$science)))

#Mean with missing value
mean(datacsv$science, na.rm = T)

#create new dataset without missing value
datacsvwm <- na.omit(datacsv)

#Count missing row of a variable
is.na(datacsvwm$science)
factor(is.na(datacsvwm$science))
describe(datacsvwm$science)
describe(factor(is.na(datacsvwm$science)))

#Simple math
# Average above 50% marks will Admitted, below 50% will not admitted from all 5 subjects

datacsvwm$Totalscore <- datacsvwm$read + datacsvwm$write + datacsvwm$math + datacsvwm$science + datacsvwm$socst
datacsvwm$AvgScore <- datacsvwm$Totalscore/5

datacsvwm$admissionStatus[datacsvwm$AvgScore <50] <- "Not Admitted"
datacsvwm$admissionStatus[datacsvwm$AvgScore >=50] <- "Admitted"
datacsvwm$admissionStatus

datacsvwm$admissionStatus <- factor(datacsvwm$admissionStatus)
describe(datacsvwm$admissionStatus)

# To avoid dollar ($) sign
# it is helpful when we only work with one dataset
attach(datacsvwm)
science
detach(datacsvwm)

#Rename a variable by creating another variable
datacsvwm$AvgScoreNew <- datacsvwm$AvgScore
View(datacsvwm)

#To rename same variable into variable
library(reshape)
datacsvwm <- rename(datacsvwm, c(science = "science_score"))

#AND OR
# A AND B = T (Both are true, then true)
# A OR B = T (Anyone is true, then true)

datacsvwm$admissionStatusGender[datacsvwm$AvgScore <50 | datacsvwm$gender == "Female"] <- "Admitted"
datacsvwm$admissionStatusGender[datacsvwm$AvgScore <50 & datacsvwm$gender == "Male"] <- "Not Admitted"
datacsvwm$admissionStatusGender
View(datacsvwm)

#datacsvwm$admissionStatusGender[datacsvwm$scienceCat == "Fail" | datacsvwm$sociCat == "Fail" | datacsvwm$mathCat == "Fail"] <- "Not Admitted"
#datacsvwm$admissionStatusGender[datacsvwm$scienceCat == "Pass" & datacsvwm$sociCat == "Pass" & datacsvwm$mathCat == "Pass"] <- "Admitted"

#Sort
#ascending by one variable
datacsvwm <- datacsvwm[order(datacsvwm$AvgScoreNew),]
View(datacsvwm)


#ascending by two variable
datacsvwm <- datacsvwm[order(datacsvwm$race, datacsvwm$AvgScoreNew),]
View(datacsvwm)


#descending by one variable
datacsvwm <- datacsvwm[order(-datacsvwm$AvgScoreNew),]
View(datacsvwm)


#descending by two variable
datacsvwm <- datacsvwm[order(datacsvwm$race, -datacsvwm$AvgScoreNew),]
View(datacsvwm)

#Subset by variable
datacsv <- read.table("E:\\ResearchProject\\Aminul\\R Workshop\\Day3\\hs0.csv", header = T, sep = ',')
datacsv
View(datacsv)

library(reshape)
datacsv <- rename(datacsv, c(ï..id = "id"))

catvar <- c("id", "gender", "race", "ses")
catvardat <- datacsv[catvar] 

numvar <- c("id", "read", "write", "math")
numvardat <- datacsv[numvar] 
numvardat

#Merge
totaldat <- merge(catvardat, numvardat, by="id")
totaldat <- cbind(catvardat, numvardat)  

totaldat <- totaldat[c(-5)]

#Subset by observation
totaldat100 <- totaldat[1:100,]
totaldat100

totaldatGR <- totaldat[which(totaldat$gender == 0 & totaldat$race == 4),]

#Arithmetic Operator (+,-,/,*)
#Logical Operator (<, <=, >, >=, == (exactly equal), != (not equal))

#Numeric function

abs()
sqrt()

a <- 3.569
ceiling(a)
floor(a)
round(a, 2)
log()
log10()
exp()

#Statistical prob function

#random number
x<- c(1:100)
rnorm(x)
a <- runif(10, min=0, max=100)

mean(a)
sd(a)
median(a)
describe(a)
summary(a)
range(a)
sum(a)
diff(a)
min(a)
max(a)

#standardized variable
scale(a)

seq(1,100,2)
rep(1:5,20)

#Data type conversion
x <- c(rep(1,20),rep(2,20))
x
is.numeric(x)
x <- as.factor(x)
is.numeric(x)

