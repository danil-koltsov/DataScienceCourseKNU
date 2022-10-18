1. Функція add2(x, y), яка повертає суму двох чисел.

    ```R
    add2<-function(x,y){
       x+y
    }
    add2(4,8)
    ```

   output:

   ```R
   > add2<-function(x,y){
   +    x+y
   + }
   > add2(4,8)
   [1] 12
   ```

2. Функція above(x, n), яка приймає вектор та число n, та повертає всі елементі вектору, які більше n. По замовчуванню n = 10.

   ```R
   above <-function(x,n=10){
      print(x[x>n])
   }
   above(c(5,9,7,1,17))
   above(c(5,9,7,17),6)
   ```

   output:

   ```R
   > above <-function(x,n=10){
   +    print(x[x>n])
   + }
   > above(c(5,9,7,1,17))
   [1] 17
   > above(c(5,9,7,17),6)
   [1]  9  7 17
   ```

   3. Функція my_ifelse(x, exp, n), яка приймає вектор x, порівнює всі його елементи за допомогою exp з n, та повертає елементи вектору, які відповідають умові expression. Наприклад, my_ifelse(x, “>”, 0) повертає всі елементи x, які більші 0. Exp може дорівнювати “<”, “>”, “<=”, “>=”, “==”. Якщо exp не співпадає ні з одним з цих виразів, повертається вектор x.

      ```R
      my_ifelse<-function(x,exp,n){
           if (exp=="<") y<-x[x<n]
           else if (exp==">") y<-x[x>n]
           else if (exp=="<=") y<-x[x<=n]
           else if (exp==">=") y<-x[x>=n]
           else if (exp=="==") y<-x[x==n]
           else y<-x
           y
      }
      my_ifelse(c(1,2,3,4,5,6,7,8,9,10,11), "<",6)
      my_ifelse(c(1,2,3,4,5,6,7,8,9,10,11), ">",6)
      my_ifelse(c(1,2,3,4,5,6,7,8,9,10,11), "<=",6)
      my_ifelse(c(1,2,3,4,5,6,7,8,9,10,11), ">=",6)
      my_ifelse(c(1,2,3,4,5,6,7,8,9,10,11), "==",6)
      ```

      output:

      ```R
      > my_ifelse<-function(x,exp,n){
      +      if (exp=="<") y<-x[x<n]
      +      else if (exp==">") y<-x[x>n]
      +      else if (exp=="<=") y<-x[x<=n]
      +      else if (exp==">=") y<-x[x>=n]
      +      else if (exp=="==") y<-x[x==n]
      +      else y<-x
      +      y
      + }
      > my_ifelse(c(1,2,3,4,5,6,7,8,9,10,11), "<",6)
      [1] 1 2 3 4 5
      > my_ifelse(c(1,2,3,4,5,6,7,8,9,10,11), ">",6)
      [1]  7  8  9 10 11
      > my_ifelse(c(1,2,3,4,5,6,7,8,9,10,11), "<=",6)
      [1] 1 2 3 4 5 6
      > my_ifelse(c(1,2,3,4,5,6,7,8,9,10,11), ">=",6)
      [1]  6  7  8  9 10 11
      > my_ifelse(c(1,2,3,4,5,6,7,8,9,10,11), "==",6)
      [1] 6
      ```

4. Функція columnmean(x, removeNA), яка розраховує середнє значення (mean) по кожному стовпцю матриці, або data frame. Логічний параметр removeNA вказує, чи видаляти NA значення. По замовчуванню він дорівнює TRUE.

   ```R
   columnmean<-function(x,removeNA=TRUE){
     for(i in seq_len(ncol(x))){
       print(mean(x[,i],trim=0,na.rm=removeNA))
     }
   }
   mat_na=matrix(c(1,3,NA,7),2,2)
   columnmean(mat_na,FALSE)
   ```

   output:

   ```R
   > columnmean<-function(x,removeNA=TRUE){
   +   for(i in seq_len(ncol(x))){
   +     print(mean(x[,i],trim=0,na.rm=removeNA))
   +   }
   + }
   > mat_na=matrix(c(1,3,NA,7),2,2)
   > columnmean(mat_na,FALSE)
   [1] 2
   [1] NA
   ```

   

   