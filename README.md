# Processing Maven
Project to mavenize processing distributables

## Introduction
To be able to use processing as a maven dependency, it's necessary to
re-package it and its transitive dependencies as maven modules
so they are available from any project pom.xml

They main difficulty with processing is it dependency on openGL native 
libraries that is OS-specific. For that reason a set of classifiers
is used to discriminate which dependency is better for every project.

To mavenize processing it's necessary to follow a set of steps and take
some manual actions that cannot be automated  

## Steps
1. Check the latest version on the [official page](https://processing.org/download/)
2. Update the version on [the version script](scripts/latest-version.sh)
3. Execute [the download script](scripts/download-latest.sh) to dowload and extract
embedded libraries  
4. Execute [the pom creation script](scripts/create-poms.sh) to create poms for each
extracted library
5. Execute [the install script](scripts/install-artifacts.sh) to install each libreary
in your local repo 