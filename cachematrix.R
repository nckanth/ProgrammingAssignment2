#makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
#cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inverse from the cache.
#Computing the inverse of a square matrix is done with the solve function in R. For example, if X is a square invertible matrix, then solve(X) returns its inverse.

#this function caches inverse of matrix & its input matrix, it also has set get setInverse getInvese functions which operate on Inversematrix and its correspinding matrix
makeCacheMatrix  <- function (cachedmatrix= matrix())
  
{
  #check if input parameter is null
  invcachedmatrix <- NULL
  
  set<- function(y)
  {
    cachedmatrix <<- y
    invcachedmatrix  <<-NULL
  }
  
  get<- function()
  {
    cachedmatrix 
  }
  
  setInverse <- function (inversematrix)
  {
    
    invcachedmatrix  <<- inversematrix
    
  }
  
  getInverse<- function ()
  {
    invcachedmatrix 
  }
  
  list(set=set,get=get,setInverse=setInverse,getInverse=getInverse)
  
}


## This function checks if inverse of matrix exist , if not it will create one

cacheSolve  <-function(x,...)
{
  
  inversematrix <- x$getInverse()
  
  if(!is.null(inversematrix ))
  {
    message("getting cached data")
    return(inversematrix )
  }
  
  
  inversematrix  <- solve(x$get(), ...)
  
  x$setInverse(inversematrix )
  
  inversematrix 
  
}
