directory ="/Users/koltsov/Downloads/specdata" 
pmean <- function(pollutant, id=1:332){
  filenames <- sprintf("%03d.csv", id)
  filenames <- file.path(directory, filenames)
  ldf <- lapply(filenames, read.csv)
  big_frame <- do.call("rbind", ldf)
  mean(big_frame[[pollutant]], na.rm = TRUE)
}
pmean("sulfate",1:10)
pmean("nitrate")
pmean("nitrate",10)


complete <- function(id){
  filenames <- sprintf("%03d.csv", id)
  filenames <- file.path(directory, filenames)
  ldf <- lapply(filenames, read.csv)
  cc <- lapply(ldf, complete.cases)
  cc_sum <- lapply(cc, sum)
  data.frame(id = id, nobs = I(cc_sum))
}
complete(1)
complete(c(2,4,8,10,12))
complete(50:60)


corr <- function(threshold=0){
  filenames <- list.files(directory, pattern="*.csv", full.names=TRUE)
  ldf <- lapply(filenames, read.csv)
  res <- c()
  for (df in ldf){
    if (sum(complete.cases(df)) > threshold){
      res<-c(res, cor(df[['sulfate']], df[['nitrate']], use='pairwise.complete.obs'))
    }
  }
  return(res)
}
cr<- corr(150)
head(cr);summary(cr)
cr<- corr(400)
head(cr);summary(cr)
cr<- corr(50)
head(cr);summary(cr);length(cr)