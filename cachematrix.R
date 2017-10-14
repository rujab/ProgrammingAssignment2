 ## The functions cache the value of the inverse of
## a matrix

## The following function creates a list containing 
## functions to set and get value of the matrix,
## set and get value of the solve

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y){
    x  <<- y
    s <<-NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<-solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## The following function checks if the solve is
## calculated, if it's not calculates the solve

cacheSolve <- function(x, ...) {
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
        ## Return a matrix that is the inverse of 'x'
  s
}
