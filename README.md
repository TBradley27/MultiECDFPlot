# MultiECDFPlot

*MultiECDFPlot* is an R package for the creation of plots containing multiple empirical cumulative distributions functions (ECDFs)

## Installation

Installation depends on the *devtools* package, which is a tool to aid the development of R packages, and also the installation of non-CRAN and non-Bioconductor packages. Install *devtools* using the following command in the R console:

```R
install.packages("devtools")
```

Once installed, the package can be loaded using the following command:

```R
library('devtools')
```
The package contains a function to install remote github repositories as local R packages. This function can be used to install *MultiECDFPlot*:

```R
install_github('TBradley27/MultiECDFPlot')
```
Once installed, the *MultiECDFPlot* can be loaded into a local R environment just like any other package:

```R
library("MultiECDFPlot")
```
## Functions

### PlotMultiECDFs

PlotMultiECDFs is the core function of this R package. It generates a multi-ECDF plot given a named list of vectors as input:

```R
example_vectors = list(a=rnorm(1000), b=rnorm(1000), c=rnorm(1000, mean=0.3))
PlotMultiECDFs (example_vectors, xlim=range(-3, 3), main='foo', xlab='bar')
```
![Image of PlotMultiECDFs](https://github.com/TBradley27/MultiECDFPlot/blob/master/images/PlotMultiECDFs.Rplot.png)

### PlotCutoff

The *PlotCutoff* function plots a set of vertical and horizontal cutoff lines given either a starting horizontal or vertical position and a curve of interest. The point at which the relevant line interesects the y or x-axis is indicated:

```R
PlotCutoff(v=0.5, vectorName="a")
```
![Image of PlotCutoff](https://github.com/TBradley27/MultiECDFPlot/blob/master/images/PlotCutoff.Rplot.png)

Further information about functions can be found in a function's corresponding manual page.
