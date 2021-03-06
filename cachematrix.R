##This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) i <<- inverse
        getinverse <- function() i
        list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}
##This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##If the inverse has already been calculated, then cacheSolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
        i <- x$getinverse()
        if(is.matrix(i)) {
                message("getting cached data")
                i
        }
        else {
                data <- x$get()
                i <- solve(data,...)
                x$setinverse(i)
                i
        }
}