## There are a pair of functions that cache the inverse of a matrix. 
## Matrix inversion is usually a costly computation and 
## there may be some benefit to caching the inverse of a matrix 
## rather than compute it repeatedly.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function (x=matrix()){
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setrev <- function(s) m <<- s
        getrev <- function() m
        list(set = set, get = get, setrev=setrev,getrev=getrev)
}


## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. 
## If the inverse has already been calculated 
## (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        m <- x$getrev()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setrev(m)
        m
        ## Return a matrix that is the inverse of 'x'
}

