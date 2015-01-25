## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}
}


## The following function calculates the inverse of a matrix created with CacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

        m <- x$getInverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
		## otherwise get the matrix, calculate the inverse and store it in the cache
        data <- x$getMatrix()
        m <- solve(data, ...)
        x$cacheInverse(m)
		## return the inverse
        m
}
