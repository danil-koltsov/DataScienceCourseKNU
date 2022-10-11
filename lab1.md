1. Створити змінні базових (atomic) типів. Базові типи: character, numeric, integer, complex, logical.

   ```R
   a<-"LAB" ##character
   class(a)
   b<-6 ##numeric
   class(b)
   c<-6L ##integer
   class(c)
   d<-1+1i ##complex
   class(d)
   e<-T ##logical
   class(e)
   ```

   output:

   ```R
   > a<-"LAB" ##character
   > class(a)
   [1] "character"
   > b<-6 ##numeric
   > class(b)
   [1] "numeric"
   > c<-6L ##integer
   > class(c)
   [1] "integer"
   > d<-1+1i ##complex
   > class(d)
   [1] "complex"
   > e<-T ##logical
   > class(e)
   [1] "logical"
   ```

2. Створити вектори, які: містить послідовність з 5 до75; містить числа3.14, 2.71, 0, 13; 100 значень TRUE.

   ```R
   f<-c(5:75) ##vector integer
   f
   g<-c(3.14, 2.71, 0, 13) ##vector numeric
   g
   h<-replicate(100, c(TRUE)) ##vector logical
   h
   ```

   output:

   ```R
   > f<-c(5:75) ##vector integer
   f
    [1]  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75
   g<-c(3.14, 2.71, 0, 13) ##vector numeric
   g
   [1]  3.14  2.71  0.00 13.00
   h<-replicate(100, c(TRUE)) ##vector logical
   h
     [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
    [49] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
    [97] TRUE TRUE TRUE TRUE
   ```

3. Створити наступну матрицю за допомогою matrix, та за допомогою cbind або rbind

   | 0.5  | 1.3  | 3.5  |
   | ---- | ---- | ---- |
   | 3.9  | 131  | 2.8  |
   | 0    | 2.2  | 4.6  |
   | 2    | 7    | 5.1  |

   ```R
   matrix(c(0.5, 3.9, 0, 2, 1.3, 131, 2.2, 7, 3.5, 2.8, 4.6, 5.1), ncol=3, nrow=4) ##matrix
   col1<-c(0.5, 3.9, 0, 2)
   col2<-c(1.3, 131, 2.2, 7)
   col3<-c(3.5, 2.8, 4.6, 5.1)
   cbind(col1, col2, col3) ##cbind
   row1<-c(0.5,1.3,3.5)
   row2<-c(3.9,131,2.8)
   row3<-c(0,2.2,4.6)
   row4<-c(2,7,5.1)
   rbind(row1, row2, row3, row4) #rbind
   ```

   output:

   ```R
   > matrix(c(0.5, 3.9, 0, 2, 1.3, 131, 2.2, 7, 3.5, 2.8, 4.6, 5.1), ncol=3, nrow=4) ##matrix
        [,1]  [,2] [,3]
   [1,]  0.5   1.3  3.5
   [2,]  3.9 131.0  2.8
   [3,]  0.0   2.2  4.6
   [4,]  2.0   7.0  5.1
   > col1<-c(0.5, 3.9, 0, 2)
   > col2<-c(1.3, 131, 2.2, 7)
   > col3<-c(3.5, 2.8, 4.6, 5.1)
   > cbind(col1, col2, col3) ##cbind
        col1  col2 col3
   [1,]  0.5   1.3  3.5
   [2,]  3.9 131.0  2.8
   [3,]  0.0   2.2  4.6
   [4,]  2.0   7.0  5.1
   > row1<-c(0.5,1.3,3.5)
   > row2<-c(3.9,131,2.8)
   > row3<-c(0,2.2,4.6)
   > row4<-c(2,7,5.1)
   > rbind(row1, row2, row3, row4) #rbind
        [,1]  [,2] [,3]
   row1  0.5   1.3  3.5
   row2  3.9 131.0  2.8
   row3  0.0   2.2  4.6
   row4  2.0   7.0  5.1
   ```

4. Створити довільний список (list), в який включити всі базові типи.

   ```R
   list(1L, 2, TRUE, 'a', 1+1i)
   ```

   output:

   ```R
   > list("LAB", 6, 6L, 1+1i, T)
   [[1]]
   [1] "LAB"
   
   [[2]]
   [1] 6
   
   [[3]]
   [1] 6
   
   [[4]]
   [1] 1+1i
   
   [[5]]
   [1] TRUE
   ```

5. Створити фактор з трьома рівнями «baby», «child», «adult».

   ```R
   factor(c("baby","child","adult"))
   ```

   output:

   ```R
   > factor(c("baby","child","adult"))
   [1] baby  child adult
   Levels: adult baby child
   ```

6. Знайти індекс першого значення NA в векторі 1, 2, 3, 4, NA, 6, 7, NA, 9, NA, 11. Знайти кількість значень NA.

   ```R
   match(NA, c(1, 2, 3, 4, NA, 6, 7, NA, 9, NA, 11))
   sum(is.na(c(1, 2, 3, 4, NA, 6, 7, NA, 9, NA, 11)))
   ```

   output:

   ```R
   > match(NA, c(1, 2, 3, 4, NA, 6, 7, NA, 9, NA, 11))
   [1] 5
   > sum(is.na(c(1, 2, 3, 4, NA, 6, 7, NA, 9, NA, 11)))
   [1] 3
   ```

7. Створити довільний data frame та вивести в консоль.

   ```R
   data.frame(sum = c(1,2,3,4,5),item = c('a','b','c','d','e'))
   ```

   output:

   ```R
   > data.frame(sum = c(1,2,3,4,5),item = c('a','b','c','d','e'))
     sum item
   1   1    a
   2   2    b
   3   3    c
   4   4    d
   5   5    e
   ```

8. Змінити імена стовпців цього data frame.

   ```R
   df<-data.frame(sum = c(1,2,3,4,5),item = c('a','b','c','d','e'))
   colnames(df)<-c('total', 'name')
   ```

   output:

   ```R
   > df<-data.frame(sum = c(1,2,3,4,5),item = c('a','b','c','d','e'))
   > colnames(df)<-c('total', 'name')
   > df
     total name
   1     1    a
   2     2    b
   3     3    c
   4     4    d
   5     5    e
   ```

   
