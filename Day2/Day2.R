#shortcuts
#Run = ctrl + enter
#zoom in = ctrl + +
#zoom out = ctrl + -

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
