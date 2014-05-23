source("cachematrix.R")

m2x2 <- matrix(c(1, 2, 3 ,4), nrow = 2, ncol = 2)
m3x3 <- matrix(c(2, 4, 6, 8, 10, 12, 14, 16, 20), nrow = 3, ncol = 3)


## Test makeCacheMatrix() functions

cachedMatrix1 <- makeCacheMatrix()
## test set() and get()
cachedMatrix1$set(m3x3)
## should return m3x3 matrix
cachedMatrix1$get()
## getInverse() should return NULL
cachedMatrix1$getInverse()

## after setInverse() should return m3x3
cachedMatrix1$setInverse(m3x3)
cachedMatrix1$getInverse()

## after set() cached data should be NULL
cachedMatrix1$set(m3x3)
cachedMatrix1$getInverse()

## Test cacheSolve()

cachedMatrix2 <- makeCacheMatrix(m2x2)
## should return the inverse of m2x2
cacheSolve(cachedMatrix2)
## should return identity matrix
m2x2 %*% cacheSolve(cachedMatrix2)
