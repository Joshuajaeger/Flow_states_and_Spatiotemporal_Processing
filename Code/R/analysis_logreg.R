##analysis of the temporal aspects of flow

##1.0 fitting logistic regression to estimate JND and PSS

##1.1 load dataframes
library(readxl)
file.list <- list.files(pattern='*.xls')
df.list <- lapply(file.list, read_excel)


##1.2 subsets for each group of interest for session 1, pre
##(Group 1= Endo right, Group 2 = Endo left, Group 3= Exo right, Group 4 = Exo left, Group 5 = Endo, Group 6= Exo)
sc1 <- subset(P28S1Pre, Group == "1") ## Endo right item cued
sc2 <- subset(P28S1Pre, Group == "2") ## Endo left item cued
sc3 <- subset(P28S1Pre, Group == "3") ## Exo right item cued
sc4 <- subset(P28S1Pre, Group == "4") ## Exo left item cued
sc5 <- subset(P28S1Pre, End1Ex2 == "1") ## Endo 
sc6 <- subset(P28S1Pre, End1Ex2 == "2") ## Exo

##1.3 estimate JND for each group
library(quickpsy)
thre175 <- quickpsy(sc1, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre175 <- as.data.frame(thre175[[20]]) ##take threshold row from output and put into dataframe
thresh175 <- dfthre175[[1]] ##take only threshold value
thre125 <- quickpsy(sc1, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre125 <- as.data.frame(thre125[[20]])
thresh125 <- dfthre125[[1]]
JND1 <- (thresh175-thresh125)/2 ##threshold .75 - threshold .25 divided by 2
thre275 <- quickpsy(sc2, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre275 <- as.data.frame(thre275[[20]])
thresh275 <- dfthre275[[1]]
thre225 <- quickpsy(sc2, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre225 <- as.data.frame(thre225[[20]])
thresh225 <- dfthre225[[1]]
JND2 <- (thresh275-thresh225)/2 
thre375 <- quickpsy(sc3, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre375 <- as.data.frame(thre375[[20]])
thresh375 <- dfthre375[[1]]
thre325 <- quickpsy(sc3, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre325 <- as.data.frame(thre325[[20]])
thresh325 <- dfthre325[[1]]
JND3 <- (thresh375-thresh325)/2 
thre475 <- quickpsy(sc4, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre475 <- as.data.frame(thre475[[20]])
thresh475 <- dfthre475[[1]]
thre425 <- quickpsy(sc4, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre425 <- as.data.frame(thre425[[20]])
thresh425 <- dfthre425[[1]]
JND4 <- (thresh475-thresh425)/2
thre575 <- quickpsy(sc5, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre575 <- as.data.frame(thre575[[20]])
thresh575 <- dfthre575[[1]]
thre525 <- quickpsy(sc5, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre525 <- as.data.frame(thre525[[20]])
thresh525 <- dfthre525[[1]]
JND5 <- (thresh575-thresh525)/2 
thre675 <- quickpsy(sc6, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre675 <- as.data.frame(thre675[[20]])
thresh675 <- dfthre675[[1]]
thre625 <- quickpsy(sc6, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre625 <- as.data.frame(thre625[[20]])
thresh625 <- dfthre625[[1]]
JND6 <- (thresh675-thresh625)/2 

##1.4 estimate PSS for each group
thre15 <- quickpsy(sc1, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre15 <- as.data.frame(thre15[[20]]) ##take threshold row from output and put into dataframe
PSS1 <- dfthre15[[1]] ##take only threshold value for .5
thre25 <- quickpsy(sc2, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre25 <- as.data.frame(thre25[[20]]) 
PSS2 <- dfthre25[[1]]
thre35 <- quickpsy(sc3, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre35 <- as.data.frame(thre35[[20]]) 
PSS3 <- dfthre35[[1]]
thre45 <- quickpsy(sc4, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre45 <- as.data.frame(thre45[[20]]) 
PSS4 <- dfthre45[[1]]
thre55 <- quickpsy(sc5, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre55 <- as.data.frame(thre55[[20]]) 
PSS5 <- dfthre55[[1]]
thre65 <- quickpsy(sc6, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre65 <- as.data.frame(thre65[[20]]) 
PSS6 <- dfthre65[[1]]



##1.5 take all JNDs and PSSs from session 1 pre together in one file
##make new dataframe ONLY first participant
datas1pre <- data.frame("participant" = 2, "preJNDendo01" = JND5, "prePSSendo01" = PSS5, "preJNDexo01" = JND6, "prePSSexo01" = PSS6, "preJNDendo01_left" = JND2, "prePSSendo01_left" = PSS2, "preJNDendo01_right" = JND1, "prePSSendo01_right" = PSS1, "preJNDexo01_left" = JND4, "prePSSexo01_left" = PSS4, "preJNDexo01_right" = JND3, "prePSSexo01_right" = PSS3)

##repeat steps 1.1 - 1.4 for all participants session 1, pre
##make new dataframe with every upcoming person -> change participant number
rest <- data.frame("participant" = 28, "preJNDendo01" = JND5, "prePSSendo01" = PSS5, "preJNDexo01" = JND6, "prePSSexo01" = PSS6, "preJNDendo01_left" = JND2, "prePSSendo01_left" = PSS2, "preJNDendo01_right" = JND1, "prePSSendo01_right" = PSS1, "preJNDexo01_left" = JND4, "prePSSexo01_left" = PSS4, "preJNDexo01_right" = JND3, "prePSSexo01_right" = PSS3)
##add new row to finaldata
datas1pre <- rbind(datas1pre,rest)

##check dataframe in new window
View(datas1pre)

##1.6 subsets for each group of interest for session 1, post
##(Group 1= Endo right, Group 2 = Endo left, Group 3= Exo right, Group 4 = Exo left, Group 5 = Endo, Group 6= Exo)
sc1 <- subset(P28S1Post, Group == "1") ## Endo right item cued
sc2 <- subset(P28S1Post, Group == "2") ## Endo left item cued
sc3 <- subset(P28S1Post, Group == "3") ## Exo right item cued
sc4 <- subset(P28S1Post, Group == "4") ## Exo left item cued
sc5 <- subset(P28S1Post, End1Ex2 == "1") ## Endo 
sc6 <- subset(P28S1Post, End1Ex2 == "2") ## Exo

##1.7 estimate JND for each group
thre175 <- quickpsy(sc1, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre175 <- as.data.frame(thre175[[20]]) ##take threshold row from output and put into dataframe
thresh175 <- dfthre175[[1]] ##take only threshold value
thre125 <- quickpsy(sc1, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre125 <- as.data.frame(thre125[[20]])
thresh125 <- dfthre125[[1]]
JND1 <- (thresh175-thresh125)/2 ##threshold .75 - threshold .25 divided by 2
thre275 <- quickpsy(sc2, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre275 <- as.data.frame(thre275[[20]])
thresh275 <- dfthre275[[1]]
thre225 <- quickpsy(sc2, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre225 <- as.data.frame(thre225[[20]])
thresh225 <- dfthre225[[1]]
JND2 <- (thresh275-thresh225)/2
thre375 <- quickpsy(sc3, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre375 <- as.data.frame(thre375[[20]])
thresh375 <- dfthre375[[1]]
thre325 <- quickpsy(sc3, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre325 <- as.data.frame(thre325[[20]])
thresh325 <- dfthre325[[1]]
JND3 <- (thresh375-thresh325)/2
thre475 <- quickpsy(sc4, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre475 <- as.data.frame(thre475[[20]])
thresh475 <- dfthre475[[1]]
thre425 <- quickpsy(sc4, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre425 <- as.data.frame(thre425[[20]])
thresh425 <- dfthre425[[1]]
JND4 <- (thresh475-thresh425)/2 
thre575 <- quickpsy(sc5, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre575 <- as.data.frame(thre575[[20]])
thresh575 <- dfthre575[[1]]
thre525 <- quickpsy(sc5, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre525 <- as.data.frame(thre525[[20]])
thresh525 <- dfthre525[[1]]
JND5 <- (thresh575-thresh525)/2 
thre675 <- quickpsy(sc6, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre675 <- as.data.frame(thre675[[20]])
thresh675 <- dfthre675[[1]]
thre625 <- quickpsy(sc6, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre625 <- as.data.frame(thre625[[20]])
thresh625 <- dfthre625[[1]]
JND6 <- (thresh675-thresh625)/2 

##1.8 estimate PSS for each group
thre15 <- quickpsy(sc1, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre15 <- as.data.frame(thre15[[20]]) ##take threshold row from output and put into dataframe
PSS1 <- dfthre15[[1]] ##take only threshold value for .5
thre25 <- quickpsy(sc2, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre25 <- as.data.frame(thre25[[20]]) 
PSS2 <- dfthre25[[1]]
thre35 <- quickpsy(sc3, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre35 <- as.data.frame(thre35[[20]]) 
PSS3 <- dfthre35[[1]]
thre45 <- quickpsy(sc4, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre45 <- as.data.frame(thre45[[20]]) 
PSS4 <- dfthre45[[1]]
thre55 <- quickpsy(sc5, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre55 <- as.data.frame(thre55[[20]]) 
PSS5 <- dfthre55[[1]]
thre65 <- quickpsy(sc6, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre65 <- as.data.frame(thre65[[20]]) 
PSS6 <- dfthre65[[1]]



##1.9 take all JNDs and PSSs from session 1 post together in one file
##make new dataframe ONLY first participant
datas1post <- data.frame("participant" = 2, "postJNDendo01" = JND5, "postPSSendo01" = PSS5, "postJNDexo01" = JND6, "postPSSexo01" = PSS6, "postJNDendo01_left" = JND2, "postPSSendo01_left" = PSS2, "postJNDendo01_right" = JND1, "postPSSendo01_right" = PSS1, "postJNDexo01_left" = JND4, "postPSSexo01_left" = PSS4, "postJNDexo01_right" = JND3, "postPSSexo01_right" = PSS3)

##repeat steps 1.6 - 1.8 for all participants session 1, post
##make new dataframe with every upcoming person -> change participant number
rest <- data.frame("participant" = 28, "postJNDendo01" = JND5, "postPSSendo01" = PSS5, "postJNDexo01" = JND6, "postPSSexo01" = PSS6, "postJNDendo01_left" = JND2, "postPSSendo01_left" = PSS2, "postJNDendo01_right" = JND1, "postPSSendo01_right" = PSS1, "postJNDexo01_left" = JND4, "postPSSexo01_left" = PSS4, "postJNDexo01_right" = JND3, "postPSSexo01_right" = PSS3)
##add new row to finaldata
datas1post <- rbind(datas1post,rest)

##dataframe in new window
View(datas1post)

##1.10 subsets for each group of interest for session 2, pre
##(Group 1= Endo right, Group 2 = Endo left, Group 3= Exo right, Group 4 = Exo left, Group 5 = Endo, Group 6= Exo)
sc1 <- subset(P14S2Pre, Group == "1") ## Endo right item cued
sc2 <- subset(P14S2Pre, Group == "2") ## Endo left item cued
sc3 <- subset(P14S2Pre, Group == "3") ## Exo right item cued
sc4 <- subset(P14S2Pre, Group == "4") ## Exo left item cued
sc5 <- subset(P14S2Pre, End1Ex2 == "1") ## Endo 
sc6 <- subset(P14S2Pre, End1Ex2 == "2") ## Exo

##1.11 estimate JND for each group
thre175 <- quickpsy(sc1, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre175 <- as.data.frame(thre175[[20]]) ##take threshold row from output and put into dataframe
thresh175 <- dfthre175[[1]] ##take only threshold value
thre125 <- quickpsy(sc1, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre125 <- as.data.frame(thre125[[20]])
thresh125 <- dfthre125[[1]]
JND1 <- (thresh175-thresh125)/2 ##threshold .75 - threshold .25 divided by 2
thre275 <- quickpsy(sc2, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre275 <- as.data.frame(thre275[[20]])
thresh275 <- dfthre275[[1]]
thre225 <- quickpsy(sc2, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre225 <- as.data.frame(thre225[[20]])
thresh225 <- dfthre225[[1]]
JND2 <- (thresh275-thresh225)/2 
thre375 <- quickpsy(sc3, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre375 <- as.data.frame(thre375[[20]])
thresh375 <- dfthre375[[1]]
thre325 <- quickpsy(sc3, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre325 <- as.data.frame(thre325[[20]])
thresh325 <- dfthre325[[1]]
JND3 <- (thresh375-thresh325)/2 
thre475 <- quickpsy(sc4, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre475 <- as.data.frame(thre475[[20]])
thresh475 <- dfthre475[[1]]
thre425 <- quickpsy(sc4, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre425 <- as.data.frame(thre425[[20]])
thresh425 <- dfthre425[[1]]
JND4 <- (thresh475-thresh425)/2 
thre575 <- quickpsy(sc5, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre575 <- as.data.frame(thre575[[20]])
thresh575 <- dfthre575[[1]]
thre525 <- quickpsy(sc5, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre525 <- as.data.frame(thre525[[20]])
thresh525 <- dfthre525[[1]]
JND5 <- (thresh575-thresh525)/2 
thre675 <- quickpsy(sc6, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre675 <- as.data.frame(thre675[[20]])
thresh675 <- dfthre675[[1]]
thre625 <- quickpsy(sc6, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre625 <- as.data.frame(thre625[[20]])
thresh625 <- dfthre625[[1]]
JND6 <- (thresh675-thresh625)/2 

##1.12 estimate PSS for each group
thre15 <- quickpsy(sc1, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre15 <- as.data.frame(thre15[[20]]) ##take threshold row from output and put into dataframe
PSS1 <- dfthre15[[1]] ##take only threshold value for .5
thre25 <- quickpsy(sc2, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre25 <- as.data.frame(thre25[[20]]) 
PSS2 <- dfthre25[[1]]
thre35 <- quickpsy(sc3, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre35 <- as.data.frame(thre35[[20]]) 
PSS3 <- dfthre35[[1]]
thre45 <- quickpsy(sc4, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre45 <- as.data.frame(thre45[[20]]) 
PSS4 <- dfthre45[[1]]
thre55 <- quickpsy(sc5, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre55 <- as.data.frame(thre55[[20]]) 
PSS5 <- dfthre55[[1]]
thre65 <- quickpsy(sc6, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre65 <- as.data.frame(thre65[[20]]) 
PSS6 <- dfthre65[[1]]


##1.13 take all JNDs and PSSs from session 2 pre together in one file
##make new dataframe ONLY first participant
datas2pre <- data.frame("participant" = 2, "preJNDendo02" = JND5, "prePSSendo02" = PSS5, "preJNDexo02" = JND6, "prePSSexo02" = PSS6, "preJNDendo02_left" = JND2, "prePSSendo02_left" = PSS2, "preJNDendo02_right" = JND1, "prePSSendo02_right" = PSS1, "preJNDexo02_left" = JND4, "prePSSexo02_left" = PSS4, "preJNDexo02_right" = JND3, "prePSSexo02_right" = PSS3)

##repeat steps 1.10 - 1.12 for all participants session 2, pre
##make new dataframe with every upcoming person 
rest <- data.frame("participant" = 14, "preJNDendo02" = JND5, "prePSSendo02" = PSS5, "preJNDexo02" = JND6, "prePSSexo02" = PSS6, "preJNDendo02_left" = JND2, "prePSSendo02_left" = PSS2, "preJNDendo02_right" = JND1, "prePSSendo02_right" = PSS1, "preJNDexo02_left" = JND4, "prePSSexo02_left" = PSS4, "preJNDexo02_right" = JND3, "prePSSexo02_right" = PSS3)
##add new row to finaldata
datas2pre <- rbind(datas2pre,rest)

##dataframe in new window
View(datas2pre)

##1.14 subsets for each group of interest for session 2, post
##(Group 1= Endo right, Group 2 = Endo left, Group 3= Exo right, Group 4 = Exo left, Group 5 = Endo, Group 6= Exo)
sc1 <- subset(P26S2Post, Group == "1") ## Endo right item cued
sc2 <- subset(P26S2Post, Group == "2") ## Endo left item cued
sc3 <- subset(P26S2Post, Group == "3") ## Exo right item cued
sc4 <- subset(P26S2Post, Group == "4") ## Exo left item cued
sc5 <- subset(P26S2Post, End1Ex2 == "1") ## Endo 
sc6 <- subset(P26S2Post, End1Ex2 == "2") ## Exo

##1.15 estimate JND for each group 
thre175 <- quickpsy(sc1, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre175 <- as.data.frame(thre175[[20]]) ##take threshold row from output and put into dataframe
thresh175 <- dfthre175[[1]] ##take only threshold value
thre125 <- quickpsy(sc1, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre125 <- as.data.frame(thre125[[20]])
thresh125 <- dfthre125[[1]]
JND1 <- (thresh175-thresh125)/2 ##threshold .75 - threshold .25 divided by 2
thre275 <- quickpsy(sc2, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre275 <- as.data.frame(thre275[[20]])
thresh275 <- dfthre275[[1]]
thre225 <- quickpsy(sc2, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre225 <- as.data.frame(thre225[[20]])
thresh225 <- dfthre225[[1]]
JND2 <- (thresh275-thresh225)/2 
thre375 <- quickpsy(sc3, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre375 <- as.data.frame(thre375[[20]])
thresh375 <- dfthre375[[1]]
thre325 <- quickpsy(sc3, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre325 <- as.data.frame(thre325[[20]])
thresh325 <- dfthre325[[1]]
JND3 <- (thresh375-thresh325)/2 
thre475 <- quickpsy(sc4, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre475 <- as.data.frame(thre475[[20]])
thresh475 <- dfthre475[[1]]
thre425 <- quickpsy(sc4, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre425 <- as.data.frame(thre425[[20]])
thresh425 <- dfthre425[[1]]
JND4 <- (thresh475-thresh425)/2 
thre575 <- quickpsy(sc5, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre575 <- as.data.frame(thre575[[20]])
thresh575 <- dfthre575[[1]]
thre525 <- quickpsy(sc5, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre525 <- as.data.frame(thre525[[20]])
thresh525 <- dfthre525[[1]]
JND5 <- (thresh575-thresh525)/2 
thre675 <- quickpsy(sc6, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre675 <- as.data.frame(thre675[[20]])
thresh675 <- dfthre675[[1]]
thre625 <- quickpsy(sc6, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre625 <- as.data.frame(thre625[[20]])
thresh625 <- dfthre625[[1]]
JND6 <- (thresh675-thresh625)/2 

##1.16 estimate PSS for each group
thre15 <- quickpsy(sc1, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre15 <- as.data.frame(thre15[[20]]) ##take threshold row from output and put into dataframe
PSS1 <- dfthre15[[1]] ##take only threshold value for .5
thre25 <- quickpsy(sc2, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre25 <- as.data.frame(thre25[[20]]) 
PSS2 <- dfthre25[[1]]
thre35 <- quickpsy(sc3, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre35 <- as.data.frame(thre35[[20]]) 
PSS3 <- dfthre35[[1]]
thre45 <- quickpsy(sc4, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre45 <- as.data.frame(thre45[[20]]) 
PSS4 <- dfthre45[[1]]
thre55 <- quickpsy(sc5, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre55 <- as.data.frame(thre55[[20]]) 
PSS5 <- dfthre55[[1]]
thre65 <- quickpsy(sc6, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre65 <- as.data.frame(thre65[[20]]) 
PSS6 <- dfthre65[[1]]


##1.17 take all JNDs and PSSs from session 2 post together in one file
##make new dataframe ONLY first participant
datas2post <- data.frame("participant" = 2, "postJNDendo02" = JND5, "postPSSendo02" = PSS5, "postJNDexo02" = JND6, "postPSSexo02" = PSS6, "postJNDendo02_left" = JND2, "postPSSendo02_left" = PSS2, "postJNDendo02_right" = JND1, "postPSSendo02_right" = PSS1, "postJNDexo02_left" = JND4, "postPSSexo02_left" = PSS4, "postJNDexo02_right" = JND3, "postPSSexo02_right" = PSS3)

##repeat steps 1.14 - 1.16 for all participants session 2, post
##make new dataframe with every upcoming person -> change participant number
rest <- data.frame("participant" = 26, "postJNDendo02" = JND5, "postPSSendo02" = PSS5, "postJNDexo02" = JND6, "postPSSexo02" = PSS6, "postJNDendo02_left" = JND2, "postPSSendo02_left" = PSS2, "postJNDendo02_right" = JND1, "postPSSendo02_right" = PSS1, "postJNDexo02_left" = JND4, "postPSSexo02_left" = PSS4, "postJNDexo02_right" = JND3, "postPSSexo02_right" = PSS3)
##add new row to finaldata
datas2post <- rbind(datas2post,rest)

##dataframe in new window
View(datas2post)

##1.18 subsets for each group of interest for session 3, pre
##(Group 1= Endo right, Group 2 = Endo left, Group 3= Exo right, Group 4 = Exo left, Group 5 = Endo, Group 6= Exo)
sc1 <- subset(P28S3Pre, Group == "1") ## Endo right item cued
sc2 <- subset(P28S3Pre, Group == "2") ## Endo left item cued
sc3 <- subset(P28S3Pre, Group == "3") ## Exo right item cued
sc4 <- subset(P28S3Pre, Group == "4") ## Exo left item cued
sc5 <- subset(P28S3Pre, End1Ex2 == "1") ## Endo 
sc6 <- subset(P28S3Pre, End1Ex2 == "2") ## Exo

##1.19 estimate JND for each group
thre175 <- quickpsy(sc1, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre175 <- as.data.frame(thre175[[20]]) ##take threshold row from output and put into dataframe
thresh175 <- dfthre175[[1]] ##take only threshold value
thre125 <- quickpsy(sc1, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre125 <- as.data.frame(thre125[[20]])
thresh125 <- dfthre125[[1]]
JND1 <- (thresh175-thresh125)/2 ##threshold .75 - threshold .25 divided by 2
thre275 <- quickpsy(sc2, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre275 <- as.data.frame(thre275[[20]])
thresh275 <- dfthre275[[1]]
thre225 <- quickpsy(sc2, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre225 <- as.data.frame(thre225[[20]])
thresh225 <- dfthre225[[1]]
JND2 <- (thresh275-thresh225)/2 
thre375 <- quickpsy(sc3, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre375 <- as.data.frame(thre375[[20]])
thresh375 <- dfthre375[[1]]
thre325 <- quickpsy(sc3, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre325 <- as.data.frame(thre325[[20]])
thresh325 <- dfthre325[[1]]
JND3 <- (thresh375-thresh325)/2
thre475 <- quickpsy(sc4, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre475 <- as.data.frame(thre475[[20]])
thresh475 <- dfthre475[[1]]
thre425 <- quickpsy(sc4, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre425 <- as.data.frame(thre425[[20]])
thresh425 <- dfthre425[[1]]
JND4 <- (thresh475-thresh425)/2 
thre575 <- quickpsy(sc5, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre575 <- as.data.frame(thre575[[20]])
thresh575 <- dfthre575[[1]]
thre525 <- quickpsy(sc5, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre525 <- as.data.frame(thre525[[20]])
thresh525 <- dfthre525[[1]]
JND5 <- (thresh575-thresh525)/2 
thre675 <- quickpsy(sc6, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre675 <- as.data.frame(thre675[[20]])
thresh675 <- dfthre675[[1]]
thre625 <- quickpsy(sc6, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre625 <- as.data.frame(thre625[[20]])
thresh625 <- dfthre625[[1]]
JND6 <- (thresh675-thresh625)/2 

##1.20 estimate PSS for each group
thre15 <- quickpsy(sc1, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre15 <- as.data.frame(thre15[[20]]) ##take threshold row from output and put into dataframe
PSS1 <- dfthre15[[1]] ##take only threshold value for .5
thre25 <- quickpsy(sc2, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre25 <- as.data.frame(thre25[[20]]) 
PSS2 <- dfthre25[[1]]
thre35 <- quickpsy(sc3, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre35 <- as.data.frame(thre35[[20]]) 
PSS3 <- dfthre35[[1]]
thre45 <- quickpsy(sc4, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre45 <- as.data.frame(thre45[[20]]) 
PSS4 <- dfthre45[[1]]
thre55 <- quickpsy(sc5, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre55 <- as.data.frame(thre55[[20]]) 
PSS5 <- dfthre55[[1]]
thre65 <- quickpsy(sc6, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre65 <- as.data.frame(thre65[[20]]) 
PSS6 <- dfthre65[[1]]



##1.21 take all JNDs and PSSs from session 3 pre together in one file
##make new dataframe ONLY first participant
Datas3pre <- data.frame("participant" = 2, "preJNDendo03" = JND5, "prePSSendo03" = PSS5, "preJNDexo03" = JND6, "prePSSexo03" = PSS6, "preJNDendo03_left" = JND2, "prePSSendo03_left" = PSS2, "preJNDendo03_right" = JND1, "prePSSendo03_right" = PSS1, "preJNDexo03_left" = JND4, "prePSSexo03_left" = PSS4, "preJNDexo03_right" = JND3, "prePSSexo03_right" = PSS3)

##repeat steps 1.18 - 1.20 for all participants session 3, pre
##make new dataframe with every upcoming person 
rest <- data.frame("participant" = 28, "preJNDendo03" = JND5, "prePSSendo03" = PSS5, "preJNDexo03" = JND6, "prePSSexo03" = PSS6, "preJNDendo03_left" = JND2, "prePSSendo03_left" = PSS2, "preJNDendo03_right" = JND1, "prePSSendo03_right" = PSS1, "preJNDexo03_left" = JND4, "prePSSexo03_left" = PSS4, "preJNDexo03_right" = JND3, "prePSSexo03_right" = PSS3)
##add new row to finaldata
Datas3pre <- rbind(Datas3pre,rest)

##dataframe in new window
View(Datas3pre)

##1.22 subsets for each group of interest for session 3, post
##(Group 1= Endo right, Group 2 = Endo left, Group 3= Exo right, Group 4 = Exo left, Group 5 = Endo, Group 6= Exo)
sc1 <- subset(P28S3Post, Group == "1") ## Endo right item cued
sc2 <- subset(P28S3Post, Group == "2") ## Endo left item cued
sc3 <- subset(P28S3Post, Group == "3") ## Exo right item cued
sc4 <- subset(P28S3Post, Group == "4") ## Exo left item cued
sc5 <- subset(P28S3Post, End1Ex2 == "1") ## Endo 
sc6 <- subset(P28S3Post, End1Ex2 == "2") ## Exo

##1.23 estimate JND for each group
thre175 <- quickpsy(sc1, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre175 <- as.data.frame(thre175[[20]]) ##take threshold row from output and put into dataframe
thresh175 <- dfthre175[[1]] ##take only threshold value
thre125 <- quickpsy(sc1, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre125 <- as.data.frame(thre125[[20]])
thresh125 <- dfthre125[[1]]
JND1 <- (thresh175-thresh125)/2 ##threshold .75 - threshold .25 divided by 2
thre275 <- quickpsy(sc2, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre275 <- as.data.frame(thre275[[20]])
thresh275 <- dfthre275[[1]]
thre225 <- quickpsy(sc2, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre225 <- as.data.frame(thre225[[20]])
thresh225 <- dfthre225[[1]]
JND2 <- (thresh275-thresh225)/2 
thre375 <- quickpsy(sc3, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre375 <- as.data.frame(thre375[[20]])
thresh375 <- dfthre375[[1]]
thre325 <- quickpsy(sc3, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre325 <- as.data.frame(thre325[[20]])
thresh325 <- dfthre325[[1]]
JND3 <- (thresh375-thresh325)/2
thre475 <- quickpsy(sc4, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre475 <- as.data.frame(thre475[[20]])
thresh475 <- dfthre475[[1]]
thre425 <- quickpsy(sc4, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre425 <- as.data.frame(thre425[[20]])
thresh425 <- dfthre425[[1]]
JND4 <- (thresh475-thresh425)/2 
thre575 <- quickpsy(sc5, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre575 <- as.data.frame(thre575[[20]])
thresh575 <- dfthre575[[1]]
thre525 <- quickpsy(sc5, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre525 <- as.data.frame(thre525[[20]])
thresh525 <- dfthre525[[1]]
JND5 <- (thresh575-thresh525)/2 
thre675 <- quickpsy(sc6, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre675 <- as.data.frame(thre675[[20]])
thresh675 <- dfthre675[[1]]
thre625 <- quickpsy(sc6, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre625 <- as.data.frame(thre625[[20]])
thresh625 <- dfthre625[[1]]
JND6 <- (thresh675-thresh625)/2 

##1.24 estimate PSS for each group
thre15 <- quickpsy(sc1, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre15 <- as.data.frame(thre15[[20]]) ##take threshold row from output and put into dataframe
PSS1 <- dfthre15[[1]] ##take only threshold value for .5
thre25 <- quickpsy(sc2, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre25 <- as.data.frame(thre25[[20]]) 
PSS2 <- dfthre25[[1]]
thre35 <- quickpsy(sc3, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre35 <- as.data.frame(thre35[[20]]) 
PSS3 <- dfthre35[[1]]
thre45 <- quickpsy(sc4, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre45 <- as.data.frame(thre45[[20]]) 
PSS4 <- dfthre45[[1]]
thre55 <- quickpsy(sc5, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre55 <- as.data.frame(thre55[[20]]) 
PSS5 <- dfthre55[[1]]
thre65 <- quickpsy(sc6, x = SOA, k = rightfirst, xmin = -1000, xmax = 1000, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
dfthre65 <- as.data.frame(thre65[[20]]) 
PSS6 <- dfthre65[[1]]


##1.25 take all JNDs and PSSs from session 3 post together in one file
##make new dataframe ONLY first participant
datas3post <- data.frame("participant" = 2, "postJNDendo03" = JND5, "postPSSendo03" = PSS5, "postJNDexo03" = JND6, "postPSSexo03" = PSS6, "postJNDendo03_left" = JND2, "postPSSendo03_left" = PSS2, "postJNDendo03_right" = JND1, "postPSSendo03_right" = PSS1, "postJNDexo03_left" = JND4, "postPSSexo03_left" = PSS4, "postJNDexo03_right" = JND3, "postPSSexo03_right" = PSS3)

##repeat steps 1.22 - 1.24 for all participants session 3, post
##make new dataframe with every upcoming person -> change participant number
rest <- data.frame("participant" = 28, "postJNDendo03" = JND5, "postPSSendo03" = PSS5, "postJNDexo03" = JND6, "postPSSexo03" = PSS6, "postJNDendo03_left" = JND2, "postPSSendo03_left" = PSS2, "postJNDendo03_right" = JND1, "postPSSendo03_right" = PSS1, "postJNDexo03_left" = JND4, "postPSSexo03_left" = PSS4, "postJNDexo03_right" = JND3, "postPSSexo03_right" = PSS3)
##add new row to finaldata
datas3post <- rbind(datas3post,rest)

##dataframe in new window
View(datas3post)

##1.26 merge dataframes into one big frame with all sessions by participants
data1 <- merge(x = datas1pre, y = datas1post, by = "participant", all = TRUE)
data2 <- merge(x = data1, y = datas2pre, by = "participant", all = TRUE)
data3 <- merge(x = data2, y = datas2post, by = "participant", all = TRUE)
data4 <- merge(x = data3, y = Datas3pre, by = "participant", all = TRUE)
finaldataFlow <- merge(x = data4, y = datas3post, by = "participant", all = TRUE)
##dataframe in new window
View(finaldataFlow)

##1.27 write final dataframe into Excel sheet
install.packages("writexl")
library(writexl)
write_xlsx(finaldataFlow, path = "OneDrive/finaldataJNDPSS.xlsx", col_names = TRUE)

##2.0 fitting logistic regression for example plots for JNDs and PSSs
##take example Person of one session (p21 - session 3 - pre)

P21S3Pre <- read_excel("~/OneDrive/Temporal_order_judgment_task/OSF sauber/Data/auto_sheet/P21S3Pre.xls")


##2.1 Subsets for each group of interest
##(Group 1= Endo right, Group 2 = Endo left, Group 3= Exo right, Group 4 = Exo left, Group 5 = Endo, Group 6= Exo)
sc1 <- subset(P21S3Pre, Group == "1") ## Endo right item cued
sc2 <- subset(P21S3Pre, Group == "2") ## Endo left item cued
sc3 <- subset(P21S3Pre, Group == "3") ## Exo right item cued
sc4 <- subset(P21S3Pre, Group == "4") ## Exo left item cued
sc5 <- subset(P21S3Pre, End1Ex2 == "1") ## Endo 
sc6 <- subset(P21S3Pre, End1Ex2 == "2") ## Exo

##2.2 make new dataframes for every subgroup with relative frequencies -> plot observed datapoints
##One dataframe with SOA, absolute and relative frequencies (per row)
install.packages("dplyr")
library(dplyr)
##for subset group 1 sc1
##make frequency table with SOA and store into vector
tab1 <- dplyr::count(sc1, SOA)
##create new data frame out of tab1
dftab1 = as.data.frame(tab1)
##control number of rows
dftab1
##create new vector with N rows
##(be carefully because every subset might have different numbers of rows)
Nrow1 <- c(1:18)
##creat new variable "Rows" (number of rows) into data frame dftab1
dftab1$Rows <- Nrow1
##make absolute frequency table with SOA and rightfirst and store into vector
abfreq1 <- table(sc1$SOA, sc1$rightfirst)
##create new data frame with absolute frequencies
dfabfreq1 = as.data.frame.matrix(abfreq1) 
##creat new variable "Rows" (number of rows) into data frame dfabfreq1
dfabfreq1$Rows <- Nrow1
##merge data frames dftab1 and dfabfreq1 by variable Rows
dfabsolute1 <- merge(x = dftab1, y = dfabfreq1, by = "Rows", all = TRUE)
##make relative frequency table with SOA and rightfirst and store into vector
refreq1 <- prop.table(table(sc1$SOA, sc1$rightfirst),1)
##create new data frame with relative frequencies
dfrefreq1 = as.data.frame.matrix(refreq1)
##creat new variable "Rows" (number of rows) into data frame dfrefreq1
dfrefreq1$Rows <- Nrow1
##merge data frames dfabsolute and dfrefreq1 by variable Rows
dfsc1 <- merge(x = dfabsolute1, y = dfrefreq1, by = "Rows", all = TRUE)
##rename all vriables from data frame dfsc1
names(dfsc1)<- c("Row", "SOA", "N", "leftAF", "rightAF", "leftRF", "rightRF")
dfsc1 ##final data frame for group 1 "Endo right cued items"

##for subset group 2 sc2
##make frequency table with SOA and store into vector
tab2 <- dplyr::count(sc2, SOA)
##create new data frame out of tab2
dftab2 = as.data.frame(tab2)
##control number of rows
dftab2
##create new vector with N rows
##(be carefully because every subset might have different numbers of rows)
Nrow2 <- c(1:13)
##creat new variable "Rows" (number of rows) into data frame dftab2
dftab2$Rows <- Nrow2
##make absolute frequency table with SOA and rightfirst and store into vector
abfreq2 <- table(sc2$SOA, sc2$rightfirst)
##create new data frame with absolute frequencies
dfabfreq2 = as.data.frame.matrix(abfreq2) 
##creat new variable "Rows" (number of rows) into data frame dfabfreq2
dfabfreq2$Rows <- Nrow2
##merge data frames dftab2 and dfabfreq2 by variable Rows
dfabsolute2 <- merge(x = dftab2, y = dfabfreq2, by = "Rows", all = TRUE)
##make relative frequency table with SOA and rightfirst and store into vector
refreq2 <- prop.table(table(sc2$SOA, sc2$rightfirst),1)
##create new data frame with relative frequencies
dfrefreq2 = as.data.frame.matrix(refreq2)
##creat new variable "Rows" (number of rows) into data frame dfrefreq2
dfrefreq2$Rows <- Nrow2
##merge data frames dfabsolute and dfrefreq2 by variable Rows
dfsc2 <- merge(x = dfabsolute2, y = dfrefreq2, by = "Rows", all = TRUE)
##rename all vriables from data frame dfsc2
names(dfsc2)<- c("Row", "SOA", "N", "leftAF", "rightAF", "leftRF", "rightRF")
dfsc2 ##final data frame for group 2 "Endo left cued items"

##for subset group 3 sc3
##make frequency table with SOA and store into vector
tab3 <- dplyr::count(sc3, SOA)
##create new data frame out of tab3
dftab3 = as.data.frame(tab3)
##control number of rows
dftab3
##create new vector with N rows
##(be carefully because every subset might have different numbers of rows)
Nrow3 <- c(1:24)
##creat new variable "Rows" (number of rows) into data frame dftab3
dftab3$Rows <- Nrow3
##make absolute frequency table with SOA and rightfirst and store into vector
abfreq3 <- table(sc3$SOA, sc3$rightfirst)
##create new data frame with absolute frequencies
dfabfreq3 = as.data.frame.matrix(abfreq3) 
##creat new variable "Rows" (number of rows) into data frame dfabfreq3
dfabfreq3$Rows <- Nrow3
##merge data frames dftab3 and dfabfreq3 by variable Rows
dfabsolute3 <- merge(x = dftab3, y = dfabfreq3, by = "Rows", all = TRUE)
##make relative frequency table with SOA and rightfirst and store into vector
refreq3 <- prop.table(table(sc3$SOA, sc3$rightfirst),1)
##create new data frame with relative frequencies
dfrefreq3 = as.data.frame.matrix(refreq3)
##creat new variable "Rows" (number of rows) into data frame dfrefreq3
dfrefreq3$Rows <- Nrow3
##merge data frames dfabsolute and dfrefreq3 by variable Rows
dfsc3 <- merge(x = dfabsolute3, y = dfrefreq3, by = "Rows", all = TRUE)
##rename all vriables from data frame dfsc3
names(dfsc3)<- c("Row", "SOA", "N", "leftAF", "rightAF", "leftRF", "rightRF")
dfsc3 ##final data frame for group 3 "Exo right cued items"

##for subset group 4 sc4
##make frequency table with SOA and store into vector
tab4 <- dplyr::count(sc4, SOA)
##create new data frame out of tab4
dftab4 = as.data.frame(tab4)
##control number of rows
dftab4
##create new vector with N rows
##(be carefully because every subset might have different numbers of rows)
Nrow4 <- c(1:25)
##creat new variable "Rows" (number of rows) into data frame dftab4
dftab4$Rows <- Nrow4
##make absolute frequency table with SOA and rightfirst and store into vector
abfreq4 <- table(sc4$SOA, sc4$rightfirst)
##create new data frame with absolute frequencies
dfabfreq4 = as.data.frame.matrix(abfreq4) 
##creat new variable "Rows" (number of rows) into data frame dfabfreq4
dfabfreq4$Rows <- Nrow4
##merge data frames dftab4 and dfabfreq4 by variable Rows
dfabsolute4 <- merge(x = dftab4, y = dfabfreq4, by = "Rows", all = TRUE)
##make relative frequency table with SOA and rightfirst and store into vector
refreq4 <- prop.table(table(sc4$SOA, sc4$rightfirst),1)
##create new data frame with relative frequencies
dfrefreq4 = as.data.frame.matrix(refreq4)
##creat new variable "Rows" (number of rows) into data frame dfrefreq4
dfrefreq4$Rows <- Nrow4
##merge data frames dfabsolute and dfrefreq4 by variable Rows
dfsc4 <- merge(x = dfabsolute4, y = dfrefreq4, by = "Rows", all = TRUE)
##rename all vriables from data frame dfsc4
names(dfsc4)<- c("Row", "SOA", "N", "leftAF", "rightAF", "leftRF", "rightRF")
dfsc4 ##final data frame for group 4 "Exo left cued items"

##for subset group 5 sc5
##make frequency table with SOA and store into vector
tab5 <- dplyr::count(sc5, SOA)
##create new data frame out of tab5
dftab5 = as.data.frame(tab5)
##control number of rows
dftab5
##create new vector with N rows
##(be carefully because every subset might have different numbers of rows)
Nrow5 <- c(1:22)
##creat new variable "Rows" (number of rows) into data frame dftab5
dftab5$Rows <- Nrow5
##make absolute frequency table with SOA and rightfirst and store into vector
abfreq5 <- table(sc5$SOA, sc5$rightfirst)
##create new data frame with absolute frequencies
dfabfreq5 = as.data.frame.matrix(abfreq5) 
##creat new variable "Rows" (number of rows) into data frame dfabfreq5
dfabfreq5$Rows <- Nrow5
##merge data frames dftab5 and dfabfreq5 by variable Rows
dfabsolute5 <- merge(x = dftab5, y = dfabfreq5, by = "Rows", all = TRUE)
##make relative frequency table with SOA and rightfirst and store into vector
refreq5 <- prop.table(table(sc5$SOA, sc5$rightfirst),1)
##create new data frame with relative frequencies
dfrefreq5 = as.data.frame.matrix(refreq5)
##creat new variable "Rows" (number of rows) into data frame dfrefreq5
dfrefreq5$Rows <- Nrow5
##merge data frames dfabsolute and dfrefreq5 by variable Rows
dfsc5 <- merge(x = dfabsolute5, y = dfrefreq5, by = "Rows", all = TRUE)
##rename all vriables from data frame dfsc5
names(dfsc5)<- c("Row", "SOA", "N", "leftAF", "rightAF", "leftRF", "rightRF")
dfsc5 ##final data frame for group 5 "Endogenous"

##for subset group 6 sc6
##make frequency table with SOA and store into vector
tab6 <- dplyr::count(sc6, SOA)
##create new data frame out of tab6
dftab6 = as.data.frame(tab6)
##control number of rows
dftab6
##create new vector with N rows
##(be carefully because every subset might have different numbers of rows)
Nrow6 <- c(1:30)
##creat new variable "Rows" (number of rows) into data frame dftab6
dftab6$Rows <- Nrow6
##make absolute frequency table with SOA and rightfirst and store into vector
abfreq6 <- table(sc6$SOA, sc6$rightfirst)
##create new data frame with absolute frequencies
dfabfreq6 = as.data.frame.matrix(abfreq6) 
##creat new variable "Rows" (number of rows) into data frame dfabfreq6
dfabfreq6$Rows <- Nrow6
##merge data frames dftab6 and dfabfreq6 by variable Rows
dfabsolute6 <- merge(x = dftab6, y = dfabfreq6, by = "Rows", all = TRUE)
##make relative frequency table with SOA and rightfirst and store into vector
refreq6 <- prop.table(table(sc6$SOA, sc6$rightfirst),1)
##create new data frame with relative frequencies
dfrefreq6 = as.data.frame.matrix(refreq6)
##creat new variable "Rows" (number of rows) into data frame dfrefreq6
dfrefreq6$Rows <- Nrow6
##merge data frames dfabsolute and dfrefreq6 by variable Rows
dfsc6 <- merge(x = dfabsolute6, y = dfrefreq6, by = "Rows", all = TRUE)
##rename all vriables from data frame dfsc6
names(dfsc6)<- c("Row", "SOA", "N", "leftAF", "rightAF", "leftRF", "rightRF")
dfsc6 ##final data frame for group 6 "Exogenous"

##2.3 Fitting a logistic model for each group with observed variables
dfsc1.glm <- glm(formula = cbind(rightAF, leftAF) ~ SOA,family = binomial(logit), data = dfsc1)
dfsc2.glm <- glm(formula = cbind(rightAF, leftAF) ~ SOA,family = binomial(logit), data = dfsc2)
dfsc3.glm <- glm(formula = cbind(rightAF, leftAF) ~ SOA,family = binomial(logit), data = dfsc3)
dfsc4.glm <- glm(formula = cbind(rightAF, leftAF) ~ SOA,family = binomial(logit), data = dfsc4)
dfsc5.glm <- glm(formula = cbind(rightAF, leftAF) ~ SOA,family = binomial(logit), data = dfsc5)
dfsc6.glm <- glm(formula = cbind(rightAF, leftAF) ~ SOA,family = binomial(logit), data = dfsc6)

##2.4 make plot with each group for PSS
plot(rightRF ~ SOA, dfsc1, xlab = "Right first SOA [ms]", ylab = "Proportion responding right first", main = "Logistic regression for one participant", xlim= c(-300,300), yaxt='n', col="red")
par(new=TRUE) ##make next plot in the same window
plot(rightRF ~ SOA, dfsc2, xlab = "Right first SOA [ms]", ylab = "Proportion responding right first", main = "Logistic regression for one participant", xlim= c(-300,300), yaxt='n', col="red4")
par(new=TRUE) ##make next plot in the same window
plot(rightRF ~ SOA, dfsc3, xlab = "Right first SOA [ms]", ylab = "Proportion responding right first", main = "Logistic regression for one participant", xlim= c(-300,300), yaxt='n', col="royalblue3")
par(new=TRUE) ##make next plot in the same window
plot(rightRF ~ SOA, dfsc4, xlab = "Right first SOA [ms]", ylab = "Proportion responding right first", main = "Logistic regression for one participant", xlim= c(-300,300), yaxt='n', col="navyblue")
axis(2, at = seq(0, 1, by = 0.25))

##2.5 fitt curve for each group for PSS
curve(predict(dfsc1.glm,data.frame(SOA=x),type="resp"),add=TRUE, col="red")
curve(predict(dfsc2.glm,data.frame(SOA=x),type="resp"),add=TRUE, col="red4")
curve(predict(dfsc3.glm,data.frame(SOA=x),type="resp"),add=TRUE, col="royalblue3")
curve(predict(dfsc4.glm,data.frame(SOA=x),type="resp"),add=TRUE, col="navyblue")

##2.6 add legend to the plot
legend("bottomright",c("Endo. cue right","Endo. cue left","Exo. cue right", "Exo. cue left"),fill=c("red2","red4", "royalblue3", "navyblue"), cex= 0.8)

##2.7 add segments for each threshold .5 -> PSS
install.packages('quickpsy')
library(quickpsy)

thre51 <- quickpsy(sc1, x = SOA, k = rightfirst, xmin = -300, xmax = 300, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
thre52 <- quickpsy(sc2, x = SOA, k = rightfirst, xmin = -300, xmax = 300, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
thre53 <- quickpsy(sc3, x = SOA, k = rightfirst, xmin = -300, xmax = 300, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
thre54 <- quickpsy(sc4, x = SOA, k = rightfirst, xmin = -300, xmax = 300, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.5, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
thre51 ##check threshold in table and fill in the value for segments
segments(c(-300, -32.41809), c(0.5, 0.5), c(-32.41809, -32.41809), + c(0.5, 0), lty = 2, lwd = 2, col="gray") 
thre52 ##check threshold in table and fill in the value for segments
segments(c(-300, 6.548217), c(0.5, 0.5), c(6.548217, 6.548217), + c(0.5, 0), lty = 2, lwd = 2, col="gray")
thre53 ##check threshold in table and fill in the value for segments
segments(c(-300, -117.0042), c(0.5, 0.5), c(-117.0042, -117.0042), + c(0.5, 0), lty = 2, lwd = 2)
thre54 ##check threshold in table and fill in the value for segments
segments(c(-300, 59.4609), c(0.5, 0.5), c(59.4609, 59.4609), + c(0.5, 0), lty = 2, lwd = 2)

##2.8 make plot with each group for JND
plot(rightRF ~ SOA, dfsc5, xlab = "Right first SOA [ms]", ylab = "Proportion responding right first", main = "Logistic regression for one participant", xlim= c(-300,300), yaxt='n', col="red")
par(new=TRUE) ##make next plot in the same window
plot(rightRF ~ SOA, dfsc6, xlab = "Right first SOA [ms]", ylab = "Proportion responding right first", main = "Logistic regression for one participant", xlim= c(-300,300), yaxt='n', col="blue")
axis(2, at = seq(0, 1, by = 0.25))

##2.9 fitt curve for each group for JND
curve(predict(dfsc5.glm,data.frame(SOA=x),type="resp"),add=TRUE, col="red")
curve(predict(dfsc6.glm,data.frame(SOA=x),type="resp"),add=TRUE, col="blue")

##2.10 add legend to the plot
legend("bottomright",c("Endogenous","Exogenous"),fill=c("red","blue"), cex= 0.8)

##2.11 add segments for each threshold .25 and .75 -> JND
thre755 <- quickpsy(sc5, x = SOA, k = rightfirst, xmin = -300, xmax = 300, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
thre255 <- quickpsy(sc5, x = SOA, k = rightfirst, xmin = -300, xmax = 300, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
thre756 <- quickpsy(sc6, x = SOA, k = rightfirst, xmin = -300, xmax = 300, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.75, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
thre256 <- quickpsy(sc6, x = SOA, k = rightfirst, xmin = -300, xmax = 300, log = FALSE, fun = logistic_fun, parini = NULL, guess = 0, lapses = 0, prob = 0.25, thresholds = TRUE, bootstrap = "parametric", B = 100, ci = 0.95, optimization = "optim")
thre755 ##check threshold in table and fill in the value for segments
segments(c(-300, 41.78089), c(0.75, 0.75), c(41.78089, 41.78089), + c(0.75, 0), lty = 2, lwd = 2, col="gray")
thre255 ##check threshold in table and fill in the value for segments
segments(c(-300, -60.76044), c(0.25, 0.25), c(-60.76044, -60.76044), + c(0.25, 0), lty = 2, lwd = 2, col="gray")
thre756 ##check threshold in table and fill in the value for segments
segments(c(-300, 48.85108), c(0.75, 0.75), c(48.85108, 48.85108), + c(0.75, 0), lty = 2, lwd = 2)
thre256 ##check threshold in table and fill in the value for segments
segments(c(-300, -111.9749), c(0.25, 0.25), c(-111.9749, -111.9749), + c(0.25, 0), lty = 2, lwd = 2)

##2.12 example stairecase plot
plot(ms_stim_diff ~ Stair.thisTrialN, data = end, col = "red", xlim = c(0,80), ylim = c(0,270), xlab = "Number of Trials", ylab = "SOA", main = "p1 - session 2 - pre - endogenous")

##3.0 Descriptive Statistics
##import main datafile
All_Quantitative_Data_Combined <- read_excel("OneDrive/Temporal_order_judgment_task/OSF sauber/Data/All_Quantitative_Data_Combined.xlsx")

##3.1 exclude first participant
w1 <- All_Quantitative_Data_Combined[-c(1),]
View(w1)

##3.1 subset with groups musicians and athletes
musician <- subset(w1, discipline == "music")
athletes <- subset(w1, discipline == "athlete")

##3.2 summary of musicians and athletes to see all the means
summary(musician)
summary(athletes)

##3.3 standard derivation age, years of experience, hours per week practice
sd(musician$age)
sd(athletes$age)
sd(musician$years_experience)
sd(musician$h_week)
sd(athletes$years_experience)
sd(athletes$h_week)

##3.4 Welch two sample t-test between musician and athlete age, years experience and practice
t.test(musician$age,athletes$age, alternative = "two.sided", mu = 0, paired= FALSE, conf.level = 0.95, var.equal = FALSE)
t.test(musician$years_experience,athletes$years_experience, alternative = "two.sided", mu = 0, paired= FALSE, conf.level = 0.95, var.equal = FALSE)
t.test(musician$h_week,athletes$h_week, alternative = "two.sided", mu = 0, paired= FALSE, conf.level = 0.95, var.equal = FALSE)

##3.5 Summary altogether
summary(w1)
sd(w1$age)

##3.6 write data file into excel sheet without1
install.packages("writexl")
library(writexl)
write_xlsx(w1, path = "without1.xlsx", col_names = TRUE)

##from wide-form into long form, create new datafile without 2 !!!!!!!!!!!!!!!!!!!!!¨
install.packages("reshape")
library(reshape)
without22 <- melt(w1, id = c("vpn", "discipline", "age", "sex"), measuerd = c("preJNDendo01", "preJNDendo02", "preJNDendo03"))


##4.0 Outlier

##for JND
##use datafile without2, only imporatant variables in a row instead of columns
without2 <- read_excel("OneDrive/Temporal_order_judgment_task/OSF sauber/Data/without2.xlsx")

##4.1 calculate median absolute derivation
mad(without2$diffJND, na.rm = TRUE) ##datafile without2, variable diffJND (JNDPre - JNDPost)

##4.2 calculate median
median(without2$diffJND, na.rm = TRUE)

##4.3 upper and lower threshold diffJND (median + or - (2.5 * mad))
2.995125+(2.5*32.23777)
2.995125-(2.5*32.23777)

##4.4 exclude outlier from diffJND
over <- subset(without2, diffJND < 83.59, na.rm = TRUE)
without3 <- subset(over, diffJND > -77.6, na.rm = TRUE)
View(without3)

##4.5 exclude outlier from JND
mad(without7$JND, na.rm = TRUE) ##datafile without7, JND
median(without7$JND, na.rm = TRUE)
49.98929+(2.5*30.70292)
49.98929-(2.5*30.70292)
over <- subset(without7, JND < 126.7466, na.rm = TRUE)
without8 <- subset(over, JND > -26.76801, na.rm = TRUE)
over <- subset(without7, JND < 200, na.rm = TRUE)
without8 <- subset(over, JND > -200, na.rm = TRUE)

View(without5)
1.775475+(2*30.95456)
1.775475-(2*30.95456)
over <- subset(without2, diffJNDmean < 200, na.rm = TRUE)
without7 <- subset(over, diffJNDmean > -200, na.rm = TRUE)
View(without7)

##for PSS
##4.6 calculate median absolute derivation and median diffPSSpre
mad(without2$diffPSS, na.rm = TRUE) ##datafile without2, variable diffPSSpre (left cued - right cued)
median(without2$diffPSS, na.rm = TRUE)

##4.7 upper and lower threshold diffPSSpre (median + or - (2.5 * mad))
12.28006+(2.5*68.29828)
12.28006-(2.5*68.29828)

##4.8 exclude outlier from diffPSSpre
over <- subset(without2, diffPSS < 183.0258, na.rm = TRUE)
without4 <- subset(over, diffPSS > -158.4656, na.rm = TRUE)
View(without4)

##4.9 exclude outlier from diffPSSmean
mad(without2$diffPSSmean, na.rm = TRUE) ##datafile without2, variable diffPSSmean (endogenous and exogenous together)
median(without2$diffPSSmean, na.rm = TRUE)
14.31311+(2.5*58.28771)
14.31311-(2.5*58.28771)
over <- subset(without2, diffPSSmean < 160.0324, na.rm = TRUE)
without6 <- subset(over, diffPSSmean > -131.4062, na.rm = TRUE)
View(without6)

## exclude outlier from disPSS
mad(without7$disPSS, na.rm = TRUE) ##datafile without7, disPSS
median(without7$disPSS, na.rm = TRUE)
38.62425+(2.5*91.53754)
38.62425-(2.5*91.53754)
over <- subset(without7, disPSS < 267.4681, na.rm = TRUE)
without9 <- subset(over, disPSS > -190.2196, na.rm = TRUE)

##5.0 centred flow values
without8$flowcent <- without8$flow - 3.439
without9$flowcent <- without9$flow - 3.449
  
##5.1 safe file as excel

write_xlsx(without8, path = "withoutJND.xlsx", col_names = TRUE)
write_xlsx(without9, path = "withoutPSS.xlsx", col_names = TRUE)




