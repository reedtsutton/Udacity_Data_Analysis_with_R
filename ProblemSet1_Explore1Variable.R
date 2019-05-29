############################################
########## SETUP AND FIRST QUIZ ############
############################################

install.packages("ggplot2")
library(ggplot2) #must load the ggplot package first
data(diamonds) #loads the diamonds data set since it comes with the ggplot package

summary(diamonds)
?diamonds

############################################
########## QUIZ: PRICE HISTOGRAM ###########
############################################

ggplot(diamonds, aes(x=price)) + geom_histogram()

summary(diamonds$price)

# The price distribution is long tails / left skewed, with the majority of values well under $2500.

# Summary stats:
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 326     950    2401    3933    5324   18823 

# You can see that the median is 2401 (IQR is 950-5324)

############################################
########## QUIZ: DIAMOND COUNTS ############
############################################

# Questions: How many diamonds cost more or less than X price? 

sum(diamonds$price<500)
sum(diamonds$price<250)
sum(diamonds$price>=15000)


##############################################
########## QUIZ: CHEAPER DIAMONDS ############
##############################################

ggplot(diamonds, aes(x=price)) + geom_histogram()

qplot(x=price, data=diamonds, binwidth=10) +
  scale_x_continuous(limits=c(0,5000), breaks=seq(0,5000,500))

ggsave('priceHistogram.png')


#####################################################
########## QUIZ: Price by Cut Histograms ############
#####################################################


qplot(x=price, data=diamonds, binwidth=10) +
  scale_x_continuous(limits=c(0,5000), breaks=seq(0,5000,500)) +
  facet_wrap(~cut)


############################################################
########## QUIZ: Scales and Multiple Histograms ############
############################################################

qplot(x = price, data = diamonds) + facet_wrap(~cut, scales = "free_x")


####################################################
########## QUIZ: Price Per Carat by Cut ############
####################################################

diamonds$ppc <- diamonds$price/diamonds$carat

qplot(x = ppc, data = diamonds, binwidth=0.1) + 
  facet_wrap(~cut, scales = "free_x") + 
  scale_x_log10()


#############################################
########## QUIZ: Price Box Plots ############
#############################################

# Investigate the price of diamonds using box plots,
# numerical summaries, and one of the following categorical
# variables: cut, clarity, or color.

# There won't be a solution video for this
# exercise so go to the discussion thread for either
# BOXPLOTS BY CLARITY, BOXPLOT BY COLOR, or BOXPLOTS BY CUT
# to share you thoughts and to
# see what other people found.

# You can save images by using the ggsave() command.
# ggsave() will save the last plot created.
# For example...
#                  qplot(x = price, data = diamonds)
#                  ggsave('priceHistogram.png')

# ggsave currently recognises the extensions eps/ps, tex (pictex),
# pdf, jpeg, tiff, png, bmp, svg and wmf (windows only).

# Copy and paste all of the code that you used for
# your investigation, and submit it when you are ready.
# =================================================================
 

qplot(y=price, x=color, data=diamonds, geom='boxplot') 

by(diamonds$price, diamonds$color, summary)

ggsave('pricebycutBoxplot.png')


###################################################
########## QUIZ: Price/caret Box Plots ############
###################################################


qplot(y=ppc, x=color, data=diamonds, geom='boxplot') 

by(diamonds$ppc, diamonds$color, summary)


####################################################
########## QUIZ: Carat Frequency Polygon ###########
####################################################

qplot(x = carat, data = diamonds, binwidth=0.01) +
  scale_x_continuous(limits=c(0,3), breaks=seq(0,3,0.1)) 

summary(diamonds$carat)
sum(diamonds$carat==5.0)



###########################################
########## QUIZ: Gapminder Data ###########
###########################################





