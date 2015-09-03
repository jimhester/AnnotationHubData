
################################################################################
## Tests to just see if we can run all of our recipes

ahroot <- "/var/FastRWeb/web"
BiocVersion <- c("3.1")      

test_HaemCodeImportPreparer_recipe <- function() {
    ahms = updateResources(ahroot, BiocVersion,
      preparerClasses = "HaemCodeImportPreparer",
      insert = FALSE, metadataOnly=TRUE, justRunUnitTest=TRUE)    
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}

test_BioPaxImportPreparer_recipe <- function() {
    ahms = updateResources(ahroot, BiocVersion,
      preparerClasses = "BioPaxImportPreparer",
      insert = FALSE, metadataOnly=TRUE, justRunUnitTest=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}

## too long
test_UCSCChainPreparer_recipe <- function() {
    ahms = updateResources(ahroot, BiocVersion,
        preparerClasses = "UCSCChainPreparer",
        insert = FALSE, metadataOnly=TRUE, justRunUnitTest=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}
    
test_UCSC2BitPreparer_recipe <- function() {
    ahms = updateResources(ahroot, BiocVersion,
        preparerClasses = "UCSC2BitPreparer",
        insert = FALSE, metadataOnly=TRUE, justRunUnitTest=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}


test_EncodeImportPreparer_recipe <- function() {
    ahms = updateResources(ahroot, BiocVersion,
        preparerClasses = "EncodeImportPreparer",
        insert = FALSE, metadataOnly=TRUE, justRunUnitTest=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}

## too long
test_EpigenomeRoadmapImportPreparer_recipe <- function() {
    ahms = updateResources(ahroot, BiocVersion,
        preparerClasses = "EpigenomeRoadMapPreparer",
        insert = FALSE, metadataOnly=TRUE, justRunUnitTest=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}

test_dbSNPVCFPreparer_recipe <- function() {
    ahms = updateResources(ahroot, BiocVersion,
        preparerClasses = "dbSNPVCFPreparer",
        insert = FALSE, metadataOnly=TRUE, justRunUnitTest=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}
    
test_RefNetImportPreparer_recipe <- function() {
    ahms = updateResources(ahroot, BiocVersion,
        preparerClasses = "RefNetImportPreparer",
        insert = FALSE, metadataOnly=TRUE)
     checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}

## too long
test_PazarImportPreparer_recipe <- function() {
    ahms = updateResources(ahroot, BiocVersion,
        preparerClasses = "PazarImportPreparer",
        insert = FALSE, metadataOnly=TRUE)
     checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}

test_ChEAPreparer_recipe <- function() {
    ahms = updateResources(ahroot, BiocVersion,
        preparerClasses = "ChEAImportPreparer",
        insert = FALSE, metadataOnly=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}


test_Inparanoid8ImportPreparer_recipe <- function() {
    #suppresWarnings({
    #ahms = updateResources(ahroot, BiocVersion,
    #                       preparerClasses = "Inparanoid8ImportPreparer",
    #                       insert = FALSE, metadataOnly=TRUE,
    #                       justRunUnitTest=TRUE)
    #})
    #checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}

## FIXME: broken 
#test_NCBIImportPreparer_recipe <- function() {
#    ahms = updateResources(ahroot, BiocVersion,
#                               preparerClasses = "NCBIImportPreparer",
#                               insert = FALSE, metadataOnly=TRUE,
#                               justRunUnitTest=TRUE)
#    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
#}

t_GSE62944_recipe <- function() {
    ahms = updateResources(ahroot, BiocVersion,
                           preparerClasses = "GSE62944ToExpressionSetPreparer",
                           insert = FALSE, metadataOnly=TRUE,
                           justRunUnitTest=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}

test_Grasp2Db_recipe <- function() {
    ahms = updateResources(ahroot, BiocVersion,
                           preparerClasses = "Grasp2ImportPreparer",
                           insert = FALSE, metadataOnly=TRUE,
                           justRunUnitTest=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}

## FIXME: add test_EnsemblFasta

test_EnsemblGtfToGRanges_recipe <- function() {
    ahms = updateResources(ahroot, BiocVersion,
                           preparerClasses = "EnsemblGtfImportPreparer",
                           insert = FALSE, metadataOnly=TRUE,
                           justRunUnitTest=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}

test_GencodeGFF <- function() {
    ahms = updateResources(ahroot, BiocVersion,
                           preparerClasses = "GencodeGffImportPreparer",
                           insert = FALSE, metadataOnly=TRUE,
                           justRunUnitTest=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}

test_GencodeFasta <- function() {
    ahms = updateResources(ahroot, BiocVersion,
                           preparerClasses = "GencodeFastaImportPreparer",
                           insert = FALSE, metadataOnly=TRUE,
                           justRunUnitTest=TRUE)
    checkTrue(class(ahms[[1]])=="AnnotationHubMetadata")
}
