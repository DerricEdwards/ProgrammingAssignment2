# The makeCacheMatrix function returns a list of functions.
# Its objective is to contain a matrix and a cached value of the inverse of that paricular matrix.
# It has the following functions:
# * setMatrix      Sets the matrix.
# * getMatrix      Gets the matrix.
# * setInverse     Sets the cached value or inverse of the matrix.
# * getInverse     Gets the cahced value or inverse of the matrix.
#
makeCacheMatrix <- function(x = matrix()) {
  # Initializes the (cached) inverse property.
  inv <- NULL
  
  # Function which sets the matrix.
  setMatrix <- function(newMatrix) {
    m <<- newMatrix
    inv <<- NULL
  }
  
  # Function which gets the matrix.
  getMatrix  <- function() {
    # Return the matrix
    m
  }
  
  # Function which sets the inverse of the matrix.
  setInverse <- function(inverse) {
    inv <<- inverse
  }
  
  # Function which gets the inverse of the matrix.
  getInverse <- function() {
    # Returns the inverse property
    inv
  }
  
  # Returns a list of the methods
  list(setMatrix = setMatrix, getMatrix = getMatrix, setInverse = setInverse, getInverse = getInverse)
}


# The cacheSolve function calculates the inverse of a "special" matrix created with the makeCacheMatrix
# function. It will return a matrix that is the inverse of 'x' (the input matrix).
cacheSolve <- function(x, ...) {  
  # Retrieves the cached inverse matrix value.
  inverse <- x$getInverse()
  
  # If a cached value exists, returns it.
  if(!is.null(inverse)) {
    message("Getting cached inverse matrix data.")
    return(inverse)
  }
  
  # Otherwise get the matrix, caclulate the inverse and store it in
  # the cache.  
  data <- x$getMatrix()
  inverse <- solve(data)
  x$cacheInverse(inverse)
  
  # Returns the inverse matrix.
  inverse
}