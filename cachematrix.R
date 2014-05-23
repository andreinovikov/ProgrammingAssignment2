## Two functions that are used to create a special object that stores a matrix and
## cache's its inverse



## Creates a special "matrix" object than can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        # 'x' is invertible matrix
        
        # Return a list containing a function to 
        #set matrix
        #get matrix
        #cache inverse of a matrix
        #get cached inverse of a matrix
        
        invMatrix <- NULL
        set <- function(y) {
                x <<- y
                invMatrix <<- NULL
        }
        get <- function() x
        setInverse <- function(newMatrix) invMatrix <<- newMatrix
        getInverse <- function() invMatrix
        list(set = set, get = get,
             setInverse = setInverse, getInverse = getInverse)
}


## Computes or returns from cache the inverse of matrix

cacheSolve <- function(x, ...) {
        # 'x' is special "matrix" returned by makeCacheMatrix 
        
        # Return a matrix that is the inverse of 'x'
        
        invMatrix <- x$getInverse()
        if (!is.null(invMatrix)){
                message("getting cached data")
                return(invMatrix)
        }
        originalMatrix <- x$get()
        invMatrix <- solve(originalMatrix)
        x$setInverse(invMatrix)
        invMatrix               
}
