require(devtools)
url <- "https://packagemanager.posit.co/cran/__linux__/jammy/2024-09-01"
dependencies <- c('Depends', 'Imports', 'LinkingTo')
upgrade <- 'default'

options(repos = c(CRAN = url))

# CRAN packages w. version
packages <- list(
    'argparser',
    'BiocManager',
    'ncdf4',
    'data.table',
    'dplyr',
    'foreign',
    'ggplot2',
    'glmnet',
    'matrixStats',
    'parallel',
    'qqman',
    'survival',
    'tidyr')
 
# install package from CRAN and quit with error if installation fails
# for (package in names(packages)) {
for (package in packages) {
    # version <- packages[[package]]

    tryCatch(
    {
        devtools::install_cran(package, dependencies=dependencies, upgrade=upgrade)
    },
    error = function(e) {
        cat("Error occurred during package installation:\n")
        print(e)
        quit(status=1, save='no')
    },
    finally = {
    }
    )
}
