
#' Plot Cutoff Lines onto ECDF Plot
#' 
#' Plots a set of vertical and horizontal cutoff lines given either a starting
#' horizontal or vertical position and a curve of interest. The point at which
#' the relevant line interesects the y or x-axis is indicated. A horizontal
#' starting line position is used as default. Multiple line sets can be
#' plotted onto the same plot
#' 
#' @param h Numeric value indicating position of horizontal line
#' @param v Numeric value indicating position of vertical line
#' @param vectorName Name (string) of curve of interest for which either a
#'    horizontal or vertical threshold is to be determined. The name is derived
#'    from the original name given to relevant vectors when PlotMultiECDFs was
#'    called. If not specified, the curve corresponding to the vector 
#'    positioned first in the aforemention list is used.
#' @export
#' @examples 
#' Add_Threshold_Line(v=0.5, vectorName="a")
#' Add_Threshold_Line(h=0.3)
#' Add_Threshold_Line(0.2)

PlotCutoff = function( h=NULL, v=NULL, vectorName=1 ) {
  # Plots horizontal and vertical line set onto previously generated plot
  # given curve of interest indicating relevant x or y-axis value
  
  # Args:
  #   h: Numeric value indicating position of horizontal line
  #   v: Numeric value indicating position of vertical line
  #   vectorName: String name of curve of interest for which either a
  #     horizontal or vertical threshold is to be determined
  #
  # Retuns:
  #     NULL
  
  if (!is.null(v)) {              # Start from specifying the vertical line
    yaxis_point = ecdf_list[[vectorName]](v)
    abline(h=yaxis_point, col="gray70")
    abline(v=v, col = "gray70")
    text(par('usr')[1]+0.24, yaxis_point + 0.015, sprintf("%s", yaxis_point), col="black")
  }
  
  if (!is.null(h)) {            # Start from specifying the horizontal line
    xaxis_point = quantile(ecdf_list[[vectorName]], h)
    abline(v=xaxis_point, col="gray70")
    abline(h=h, col = "gray70")
    text(xaxis_point, -0.015, sprintf("%.2f", xaxis_point), col="black")
  }
}