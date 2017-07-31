
#' Plot Multiple Vectors as ECDFs of the Same Plot
#' 
#' Plots multiple ECDFs onto same plot using named list of vectors as input.
#' @param x A named list of double-precision vectors 
#' @param colours A character vector to determine plotted curve colours. Default colours are provided
#' @param ... further arguments passed to or from other methods.
#' @export
#' @examples 
#' example_vectors = list(a=rnorm(1000), b=rnorm(1000), c=rnorm(1000, 
#'  mean=0.3))
#' PlotMultiECDFs (example_vectors, xlim=range(-3, 3), main='foo', xlab='bar')

PlotMultiECDFs = function (x, 
                          colours=rainbow(n=length(x)),  ...) {
  # Plots multiple ECDFs onto same plot using named list of vectors as input, 
  # also generating a global list variable of ECDFs
  
  # Args:
  #   x: A list of named double-precision vectors
  #   colours: An optional list of strings to determine plotted curve colours 
  #     in the same order that the relevant curves are positioned in 
  #     x. A default colour list is provided.
  #
  # Returns:
  #   NULL
  
  ecdf_list = list()
  tmp_ecdf = ecdf(x[[1]]) # ecdf - empirical cumulative distribution function
  ecdf_list = c(ecdf_list, tmp_ecdf) # append to list
  names(ecdf_list)[1] = names(x[1])
  plot(tmp_ecdf, col=colours[1], ...)
  
  for (i in 2:length(x)   ) {
    tmp_ecdf = ecdf(x[[i]])
    ecdf_list = c(ecdf_list, tmp_ecdf) # append to list
    names(ecdf_list)[i] = names(x[i])
    plot(tmp_ecdf, col=colours[i], add=T)
  }
  
  list_names = names(ecdf_list)
  
  legend("bottomright", list_names, lty=c(1,1), col=colours, cex=0.85, pt.cex=1.00 )
  ecdf_list <<- ecdf_list #Generate a global variable
}