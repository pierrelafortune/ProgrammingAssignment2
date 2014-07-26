## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

## This code, by Pierre Lafortune, takes a user defined matrix, and creates four functions to manipulate and save (cache) the data.
makeCacheMatrix <- function(x = matrix()) { ##x is a user defined matrix
        m <- NULL
        set <- function(y) { ## user can change the matrix to be solved. Note the <<- assignment operator. It will allow x and y to be applied beyond the 'set' environment.
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get, ## creates a list of the four functions
             setinverse = setinverse,
             getinverse = getinverse)
}

## cacheSolve is a function that first checks for a NULL m set. If it is empty, it will find the inverse of the matrix and save the value.
cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data") ## if it isn't empty, it will retrieve the cached(saved) value.
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)## this code solves the matrix
        x$setinverse(m) ## user can use this to test another matrix
        m
}