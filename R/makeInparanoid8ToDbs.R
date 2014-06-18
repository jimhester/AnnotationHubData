## This is an example of how this new helper method can make things
## simpler and also provides a test case for how we can parse ensembl
## GTF files into GRanges objects.


## helper to make metadata list from the data
.inparanoidMetadataFromUrl <- function(baseUrl) {
    ## get all the subDirs
    subDirs <- AnnotationForge:::.getSubDirs(baseUrl)
    subDirs <- subDirs[!(subDirs %in% c('stderr/'))]
    species <- sub("/","",subDirs)
    allDirs <- file.path(baseUrl, species)
    ## We have the tax ID and the full species names in AnnotationForge already
    meta <- read.delim(system.file('extdata','inp8_Full_species_mapping',
                                   package='AnnotationForge'),
                       sep="\t", header=TRUE, stringsAsFactors=FALSE)
    matches <- match(species, meta$inparanoidSpecies)
    fullSpecies <- meta$GenusAndSpecies[matches]
    taxonomyId <- as.character(meta$taxID[matches])
    ## get the name for the DB
    title <- paste0("hom.",
                     gsub(" ","_",fullSpecies),
                     ".inp8",
                     ".sqlite")    
    ## root <- setNames(rep(NA_character_, length(allDirs)), title)
    genome <- setNames(rep("inparanoid8 genomes", length(allDirs)), title)
    sourceVersion <- rep('Inparanoid version 8',length(allDirs))
    description <- paste("Inparanoid 8 annotations about", fullSpecies)
    sourceUrl <- paste0(baseUrl,"/", species)
    sourceFile <- allDirs
    rDataPath <- paste0("inparanoid8/Orthologs/",title)
    ## return as a list
    list(##annotationHubRoot = root,
         title=title, species = fullSpecies,
         taxonomyId = taxonomyId, genome = genome, sourceUrl=sourceUrl,
         sourceFile = sourceFile, sourceVersion = sourceVersion,
         description=description, rDataPath=rDataPath)
}


## STEP 1: make function to process metadata into AHMs
## This function will return the AHMs and takes no args.
## It also must specify a recipe function.
makeinparanoid8ToAHMs <- function(currentMetadata){
    baseUrl <- 'http://inparanoid.sbc.su.se/download/current/Orthologs'
    ## Then make the metadata for these
    meta <- .inparanoidMetadataFromUrl(baseUrl)
    ## then make AnnotationHubMetadata objects.
    Map(AnnotationHubMetadata,
        ## AnnotationHubRoot=meta$annotationHubRoot,
        Description=meta$description,
        Genome=meta$genome,
        SourceFile=meta$sourceFile, 
        SourceUrl=meta$sourceUrl,
        SourceVersion=meta$sourceVersion,
        Species=meta$species,
        TaxonomyId=meta$taxonomyId,
        Title=meta$title,
        RDataPath=meta$rDataPath,
        MoreArgs=list(
          Coordinate_1_based = TRUE, ## TRUE unless it "needs" to be FALSE
          DataProvider = baseUrl,
          Maintainer = "Marc Carlson <mcarlson@fhcrc.org>",
          RDataClass = "SQLiteFile",
          RDataDateAdded = Sys.time(),
          RDataVersion = "0.0.1",
          Recipe = c("inparanoid8ToDbsRecipe", package="AnnotationHubData"),
          Tags = c("Inparanoid", "Gene", "Homology", "Annotation")))
}



## STEP 2: Make a recipe function that takes an AnnotationHubRecipe
## object.
## REMEMBER: inputFiles will be file.path(AnnotationHubRoot,SourceFile)
## (from the AHM)
## and outputFile will be file.path(AnnotationHubRoot,RDataPath)
inparanoid8ToDbsRecipe <- function(ahm){
    require(AnnotationForge)
    ## make use of file.path to put on a trailing slash of the appropriate kind
    dbname <- makeInpDb(dir=file.path(inputFiles(ahm, useRoot=FALSE),""),
                        dataDir=tempdir())
    db <- loadDb(file=dbname)
    saveDb(db, file=outputFile(ahm)) ## this here is the problem.
    outputFile(ahm)
}




## STEP 3:  Call the helper to set up the newResources() method
makeAnnotationHubResource("Inparanoid8ImportPreparer",
                          makeinparanoid8ToAHMs)
















