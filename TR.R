#load a new dataset

#names of variables

names(teachingratings)

#OUTPUT
# [1] "minority"    "age"         "gender"      "credits"     "beauty"     
# [6] "eval"        "division"    "native"      "tenure"      "students"   
# [11] "allstudents" "prof"

#attach/commit data to memory

attach(teachingratings)

#summarize data set

summary(teachingratings)

#OUTPUT
# minority              age           gender            credits         
# Length:463         Min.   :29.00   Length:463         Length:463        
# Class :character   1st Qu.:42.00   Class :character   Class :character  
# Mode  :character   Median :48.00   Mode  :character   Mode  :character  
# Mean   :48.37                                        
# 3rd Qu.:57.00                                        
# Max.   :73.00                                        
# beauty                eval         division            native         
# Min.   :-1.4504941   Min.   :2.100   Length:463         Length:463        
# 1st Qu.:-0.6562689   1st Qu.:3.600   Class :character   Class :character  
# Median :-0.0680143   Median :4.000   Mode  :character   Mode  :character  
# Mean   : 0.0000001   Mean   :3.998                                        
# 3rd Qu.: 0.5456024   3rd Qu.:4.400                                        
# Max.   : 1.9700230   Max.   :5.000                                        
# tenure             students       allstudents          prof      
# Length:463         Min.   :  5.00   Min.   :  8.00   Min.   : 1.00  
# Class :character   1st Qu.: 15.00   1st Qu.: 19.00   1st Qu.:20.00  
# Mode  :character   Median : 23.00   Median : 29.00   Median :44.00  
# Mean   : 36.62   Mean   : 55.18   Mean   :45.43  
# 3rd Qu.: 40.00   3rd Qu.: 60.00   3rd Qu.:70.50  
# Max.   :380.00   Max.   :581.00   Max.   :94.00  

mean(age)

#OUTPUT
# 48.36501

mean(eval)

#OUTPUT
# 3.998272

mean(students)

# OUTPUT
# 36.62419

#introducing the apply family

sapply(teachingratings[c("age","eval","students","beauty")],mean)

# age         eval     students       beauty 
# 4.836501e+01 3.998272e+00 3.662419e+01 6.271140e-08

#disable scientific notation

options(scipen=9)



sapply(teachingratings[c("age","eval","students","beauty")],mean)

#OUTPUT
# # age             eval         students           beauty 
# 48.3650107991361  3.9982721362722 36.6241900647948  0.0000000627114 

#round the output to 2 digits

my.means=sapply(teachingratings[c("age","eval","students","beauty")],mean)
my.means
round(my.means,2)

#OUTPUT
# age     eval students   beauty 
# 48.37     4.00    36.62     0.00 

#means by groups

tapply(eval,gender,mean)

#OUTPUT
# female     male 
# 3.901026 4.069030 

#installing a new package

install.packages("tableone")

#load the package

library(tableone)

CreateTableOne(data = teachingratings)

#OUTPUT
# Overall      
# n                         463        
# minority = yes (%)         64 (13.8) 
# age (mean (sd))         48.37 (9.80) 
# gender = male (%)         268 (57.9) 
# credits = single (%)       27 ( 5.8) 
# beauty (mean (sd))       0.00 (0.79) 
# eval (mean (sd))         4.00 (0.55) 
# division = upper (%)      306 (66.1) 
# native = yes (%)          435 (94.0) 
# tenure = yes (%)          361 (78.0) 
# students (mean (sd))    36.62 (45.02)
# allstudents (mean (sd)) 55.18 (75.07)
# prof (mean (sd))        45.43 (27.51)

my.vars=c("beauty","eval","age","students")

CreateTableOne(my.vars,data = teachingratings)

#OUTPUT

#                      Overall      
# n                      463        
# beauty (mean (sd))    0.00 (0.79) 
# eval (mean (sd))      4.00 (0.55) 
# age (mean (sd))      48.37 (9.80) 
# students (mean (sd)) 36.62 (45.02)


#is there systematic difference in teacher evaluations based on gender

CreateTableOne(my.vars, strata = "gender",data=teachingratings)

#OUTPUT

#                        Stratified by gender
#                       female        male          p      test
# n                      195           268                    
# beauty (mean (sd))    0.12 (0.82)  -0.08 (0.76)   0.007     
# eval (mean (sd))      3.90 (0.54)   4.07 (0.56)   0.001     
# age (mean (sd))      45.09 (8.53)  50.75 (9.99)  <0.001     
# students (mean (sd)) 31.25 (25.14) 40.53 (54.88)  0.028


#analysis with caegorical variables

cat.vars=c("minority","tenure")

CreateTableOne(my.vars,strata = "tenure",factorVars = cat.vars,
               data=teachingratings)

#                       Stratified by tenure
#                        no            yes           p test
# n                      102           361                    
# beauty (mean (sd))    0.03 (0.88)  -0.01 (0.76)   0.681     
# eval (mean (sd))      4.13 (0.56)   3.96 (0.55)   0.005     
# age (mean (sd))      50.19 (6.95)  47.85 (10.42)  0.033     
# students (mean (sd)) 24.77 (18.94) 39.97 (49.49)  0.003

CreateTableOne(my.vars,strata = "minority",factorVars = cat.vars,
               data=teachingratings)

#                          Stratified by minority
#                       no            yes           ptest
# n                      399            64                    
# beauty (mean (sd))   -0.01 (0.79)   0.07 (0.75)   0.478     
# eval (mean (sd))      4.02 (0.55)   3.89 (0.60)   0.099     
# age (mean (sd))      48.77 (10.23) 45.84 (6.00)   0.027     
# students (mean (sd)) 38.30 (47.73) 26.16 (18.48)  0.045 

#data visualization

#plot eval and beauty
plot(eval~beauty,
     main = "Relationship between teaching evaluation and beauty scores",
     xlab = "standardized beauty scores of instructors",
     ylab="teaching evaluation score",
     cex.main=0.75, cex.lab=0.9, cex.axis=0.8)
abline(lm(eval~beauty),col="red",lwd=2) #regression line (y~x)
lines(lowess(eval~beauty),col="blue",lwd=3) #lowess line (x~y)



#with lattice package

install.packages("lattice")
library(lattice)

attach(teachingratings)

xyplot(eval~beauty|gender, pch=19, col="green",
       main= "Relationship between teaching evaluation score and beauty score",
       ylab = "Teaching evaluation score",
       xlab = "Standardized beauty score")

xyplot(eval~beauty|gender, pch=19, groups = tenure,
       main= "Relationship between teaching evaluation score and beauty score",
       ylab = "Teaching evaluation score",
       xlab = "Standardized beauty score")

install.packages("ggplot2")
library(ggplot2)

attach(teachingratings)
ggplot(teachingratings,aes(y=eval, x=beauty, color=tenure)) + geom_point()+
  labs(title="Relationship between teaching evaluation score and beauty score",
       y="Teaching evaluation score", x="Standardized beauty score") +
       theme(plot.title=element_text(size = 10, face = "bold"))
  
ggplot(teachingratings,aes(y=eval, x=beauty, color=tenure)) + geom_point()+
  facet_grid(~gender)+
  labs(title="Relationship between teaching evaluation score and beauty score",
       y="Teaching evaluation score", x="Standardized beauty score") +
  theme(plot.title=element_text(size = 10, face = "bold"))

ggplot(teachingratings,aes(y=eval, x=beauty, color=tenure)) + geom_point()+
  facet_grid(~gender)+
  labs(title="Relationship between teaching evaluation score and beauty score",
       y="Teaching evaluation score", x="Standardized beauty score") +
  geom_smooth(method="loess",size=1.0)+theme_bw()+
  theme(plot.title=element_text(size = 10, face = "bold"))

#with linear trend

ggplot(teachingratings,aes(y=eval, x=beauty, color=tenure)) + geom_point()+
  facet_grid(~gender)+
  labs(title="Relationship between teaching evaluation score and beauty score",
       y="Teaching evaluation score", x="Standardized beauty score") +
  geom_smooth(method="lm",size=1.0)+theme_bw()+
  theme(plot.title=element_text(size = 10, face = "bold"))


#box plots

p<- ggplot(teachingratings, aes(x=tenure, y=eval))+
  geom_boxplot()+
  labs(title="Relationship between teaching evaluation and tenure status",
       y="Teaching evaluation score", x="Tenure status")
p+theme(plot.title=element_text(size=10, face = "bold"))


# rotate the box plot

p+ coord_flip() + theme(plot.title=element_text(size = 10, face="bold"))


#notched box plot

ggplot(teachingratings, aes(x=tenure, y=eval, col=tenure))+
  geom_boxplot(notch = TRUE)+
  labs(title="Relationship between evaluation and tenure status",
       y="Teaching evaluation score", x="Tenure status")+
       theme(plot.title=element_text(size=10, face="bold"))

#plotting average teaching evaluation for males and females

tab.1<-tapply(eval,gender,mean)
tab.1

barplot(tab.1,
        main = "Evaluation scores by gender",
        xlab = "Gender of Instructor",
        ylab = "Teaching evaluation score",
        ylim = c(0,5),col = "Red")

#introducing the table command

table(gender)

table(gender,tenure)

#introducing proportions for tables

tab.2=table(gender,tenure)
tab.2


tab.r=prop.table(tab.2,1) #summing percentages by rows
tab.c=prop.table(tab.2,2) #summing percentages by columns

round(tab.r,2)

plot(tab.r,
     main="The percentage of tenured teachers based on gender")

#plotting one categorical variable

table(gender,tenure)

barplot(table(gender,tenure),
ylim=c(0,300),
xlab="tenure status",
ylab="number",
main="gender and tenure")

#statistical tests

tapply(eval,gender,mean)

#OUTPUT

# female     male 
# 3.901026 4.069030

t.test(eval~gender)

#                         Welch Two Sample t-test
# 
# data:  eval by gender
# t = -3.2667, df = 425.76, p-value = 0.001176
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   -0.26909088 -0.06691755
# sample estimates:
#   mean in group female   mean in group male 
#                3.901026             4.069030 


#regression

mod.1=lm(eval~gender)
summary(mod.1)

# Residuals:
#   Min       1Q   Median       3Q      Max 
# -1.96903 -0.36903  0.03097  0.43097  0.99897 
# 
# Coefficients:
#               Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  3.90103    0.03933   99.19  < 2e-16 ***
#   gendermale   0.16800    0.05169    3.25  0.00124 ** 
#   ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 0.5492 on 461 degrees of freedom
# Multiple R-squared:  0.0224,	Adjusted R-squared:  0.02028 
# F-statistic: 10.56 on 1 and 461 DF,  p-value: 0.001239

#Explanation of Regression Model
#all things being equal, male teachers receive higher teaching
#evaluation than female teachers by 0.16 and the coefficients
#is statistically significant (t>1.96)

# regression model 2

mod.2=lm(eval~gender+tenure+minority+age+beauty)
summary(mod.2)


# Residuals:
#   Min       1Q   Median       3Q      Max 
# -1.82002 -0.35959  0.04641  0.41355  1.07585 
# 
# Coefficients:
#               Estimate   Std. Error t value  Pr(>|t|)    
# (Intercept)  4.227920   0.145235  29.111   < 2e-16 ***
#   gendermale   0.222356   0.052769   4.214 0.0000303 ***
#   tenureyes   -0.192563   0.060412  -3.187   0.00153 ** 
#   minorityyes -0.094315   0.072367  -1.303   0.19313    
# age         -0.004035   0.002767  -1.458   0.14546    
# beauty       0.135007   0.032907   4.103 0.0000484 ***
#   ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 0.5314 on 457 degrees of freedom
# Multiple R-squared:  0.09276,	Adjusted R-squared:  0.08283 
# F-statistic: 9.345 on 5 and 457 DF,  p-value: 0.00000001724


#all else being equal, tenured professors receive lower teaching ratings
#than non-tenured professors by 0.19 and the coefficient is
#statistically significant

#all else being equal, tecahers with higher beauty score receive
#higher rating as compared to those with lower beauty score

install.packages("stargazer")
library(stargazer)

stargazer(mod.2,type="text",no.space=T)


stargazer(mod.2,type="text",no.space=T)

===============================================
  # Dependent variable:    
  # ---------------------------
  # eval            
-----------------------------------------------
#   gendermale                   0.222***          
#                               (0.053)          
# tenureyes                    -0.193***         
#                              (0.060)          
# minorityyes                   -0.094           
#                               (0.072)          
# age                           -0.004           
#                              (0.003)          
# beauty                       0.135***          
#                              (0.033)          
# Constant                     4.228***          
#                             (0.145)          
# -----------------------------------------------
#   Observations                    463            
# R2                             0.093           
# Adjusted R2                    0.083           
# Residual Std. Error      0.531 (df = 457)      
# F Statistic           9.345*** (df = 5; 457)   
# ===============================================
#   Note:               *p<0.1; **p<0.05; ***p<0.01