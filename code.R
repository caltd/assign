 trdset <- read.table("F:\\coursera\\data science\\2 R\\code\\3assigntrain\\x_train.txt", header = F)
	
nam <- read.table("F:\\coursera\\data science\\2 R\\code\\features.txt", header = F)

names(trdset) <- nam[,2]

trsub <- read.table("F:\\coursera\\data science\\2 R\\code\\3assigntrain\\subject_train.txt", header = F)
 trdset$subject <- trsub$V1

tract <- read.table("F:\\coursera\\data science\\2 R\\code\\3assigntrain\\y_train.txt", header = F)
 trdset$activity <- tract$V1

tedset <- read.table("F:\\coursera\\data science\\2 R\\code\\3assigntest\\x_test.txt", header = F)
names(tedset) <- nam[, 2]	


tesub <- read.table("F:\\coursera\\data science\\2 R\\code\\3assigntest\\subject_test.txt", header = F)
tedset$subject <- tesub$V1

teact <- read.table("F:\\coursera\\data science\\2 R\\code\\3assigntest\\y_test.txt", header = F)
 tedset$activity <- teact$V1


dset <- rbind(trdset, tedset)

 means <- grep(".*mean.*", nam[,2], val =T)
 stds <- grep(".*std.*", nam[,2], val =T)
meanstd <- c(means, ctds)

subdset <- dset[, c(meanstd, "subject", "activity")]
sp <- split(subdset, subdset$subject)
sp2 <- sapply(sp, function (x) { split(x, x$activity); })

ans <- which(sp2, sapply(sp2, mean, stdmean))


write.csv(ans, "ans.csv")