1. Написати функцію pmean, яка обчислює середнє значення (mean) забруднення сульфатами або нітратами серед заданого переліка моніторів. Ця функція приймає три аргументи: «directory», «pollutant», «id». Directory – папка, в якій розміщені дані, pollutant – вид забруднення, id – перелік моніторів. Аргумент id має значення за замовчуванням 1:332. Функція повинна ігнорувати NA значення.

   ```R
   directory ="specdata" 
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
   
   ```

   Output:

   ```R
   directory ="specdata" 
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
   ```

   2. Написати функцію complete, яка виводить кількість повних спостережень (the number of completely observed cases) для кожного файлу. Функція приймає два аргументи: «Directory» та «id» та повертає data frame, в якому перший стовпчик – ім’я файлу, а другий – кількість повних спостережень

      ```R
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
      ```

      output:

      ```R
      > complete <- function(id){
      +   filenames <- sprintf("%03d.csv", id)
      +   filenames <- file.path(directory, filenames)
      +   ldf <- lapply(filenames, read.csv)
      +   cc <- lapply(ldf, complete.cases)
      +   cc_sum <- lapply(cc, sum)
      +   data.frame(id = id, nobs = I(cc_sum))
      + }
      > complete(1)
        id nobs
      1  1  117
      > complete(c(2,4,8,10,12))
        id nobs
      1  2 1041
      2  4  474
      3  8  192
      4 10  148
      5 12   96
      > complete(50:60)
         id nobs
      1  50  459
      2  51  193
      3  52  812
      4  53  342
      5  54  219
      6  55  372
      7  56  642
      8  57  452
      9  58  391
      10 59  445
      11 60  448
      ```

      3. Написати функцію corr, яка приймає два аргументи: directory (папка, де знаходяться файли спостережень) та threshold (порогове значення, за замовчуванням дорівнює 0) та обчислює кореляцію між сульфатами та нітратами для моніторів, кількість повних спостережень для яких більше порогового значення. Функція повинна повернути вектор значень кореляцій. Якщо ні один монітор не перевищує порогового значення, функція повинна повернути numeric вектор довжиною 0. Для обчислення кореляції між сульфатами та нітратами використовуйте вбудовану функцію «cor» з параметрами за замовчуванням.

         ```R
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
         ```

         output:

         ```R
         > corr <- function(threshold=0){
         +   filenames <- list.files(directory, pattern="*.csv", full.names=TRUE)
         +   ldf <- lapply(filenames, read.csv)
         +   res <- c()
         +   for (df in ldf){
         +     if (sum(complete.cases(df)) > threshold){
         +       res<-c(res, cor(df[['sulfate']], df[['nitrate']], use='pairwise.complete.obs'))
         +     }
         +   }
         +   return(res)
         + }
         > cr<- corr(150)
         > head(cr);summary(cr)
         [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
             Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
         -0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313 
         > cr<- corr(400)
         > head(cr);summary(cr)
         [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860
             Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
         -0.17623 -0.03109  0.10021  0.13969  0.26849  0.76313 
         > cr<- corr(50)
         > head(cr);summary(cr);length(cr)
         [1] -0.22255256 -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667
             Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
         -0.46127 -0.06100  0.08884  0.11300  0.25982  0.78596 
         [1] 296
         ```

         

