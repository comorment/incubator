url <- "https://packagemanager.posit.co/cran/__linux__/jammy/2024-09-01"
dependencies <- c('Depends', 'Imports', 'LinkingTo')
upgrade <- 'default'
auth_token <- Sys.getenv("github_pat")
cat("GitHub PAT length: ", nchar(auth_token), "\n")

# GitHub packages w. Git SHA
packages <- list(
    'suchestoncampbelllab/gwasurvivr' = 'adad8509ad5f1f3033548bcb4d00f6f9c60778fa',
)

# install package from GitHub and quit with error if installation fails
for (package in names(packages)) {
    ref <- packages[[package]]
    cat("Installing package ", package, " from GitHub with ref ", ref, "\n")
    tryCatch(
    {
        devtools::install_github(package, ref=ref, repos=url, dependencies=dependencies, upgrade=upgrade, auth_token=auth_token)
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


# misc. packages
library(remotes)
remotes::install_version('RcppEigen', version = '0.3.3.9.3')
remotes::install_github('jrs95/hyprcoloc', build_opts = c('--resave-data', '--no-manual'), upgrade = 'never')
