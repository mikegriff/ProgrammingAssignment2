## These are R functions that are able to cache potentially time-consuming computations.

## This function creates a matrix which contains a function that sets the value of the vector, gets the value of the vector, sets the value of the mean and gets the value of the mean.

makeVector <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}


## This function calculates the mean of the matrix previously created in the above function. But it first checks to see if the mean has already been calculated and if it has, it gets the mean from the cache and skips the computation. it then finds the inverse matrix. 

cachemean <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}
        
solve(x)
