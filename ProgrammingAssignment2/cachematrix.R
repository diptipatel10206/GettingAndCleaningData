## Function makeCacheMatrix creates a special "matrix" object that 
## can cache its inverse. 

## This program assumes that the matrix supplied is always invertible.

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL   #initialize local variable i to Null in environment2
        
        #internal function to set i to Null in environment2   
        set <- function(y) {                                
                x <<- y
                i <<- NULL
        }
       
        # this function Returns the matrix passed
        get <- function() x 
        
        # function setinv() stores the inverse matrix in cache 
        setinv <- function(inv) i <<- inv
        
        # function getinv() returns the inverse matrix
        getinv <- function() i
        
        # create and return list of functions defined within makeCacheMatrix()
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
        
} #end of function makeCacheMatrix


## Function cacheSolve computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already been 
## calculated (and the matrix has not changed), then the cachesolve 
## should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        
        # call function to get inverse and if it returns non-NULL value then
        # the inverse matrix is cached so return cached value
        i <- x$getinv()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        
        # retrieve matrix from input parameter
        matrix <- x$get()
        
        # compute the inverse of matrix from input parameter
        i <- solve(matrix, ...)
        
        # Update cached memory with inverse of matrix
        x$setinv(i)
        
        #return the inverse matrix
        i
} # end of function cacheSolve
