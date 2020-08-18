
# Diese Funktion war nur gedacht um das gesammte Ordnersystem wieder auf den Anfang zurückzustellen. CAVE: Löscht Dateien. 


prepare_scratch <- function( standardpdf = "examplescan.pdf",
                             basefolder = "digitalisierung_fluggastdaten/",
                             scanfolder = "01_scans/",  
                             storedscanfolder = "02_pdfs/", 
                             individualcardfolder = "03_pngs/", 
                             shinypicturefolder = "www/") {

# Removine all files in storedscanfolder and individualcardfolder for testing
if (length(list.files(paste0(basefolder,storedscanfolder)))!=0){
  file.remove(paste0(basefolder, storedscanfolder, list.files(paste0(basefolder,storedscanfolder))))
}
if (length(list.files(paste0(basefolder,individualcardfolder)))!=0){
  file.remove(paste0(basefolder, individualcardfolder, list.files(paste0(basefolder,individualcardfolder))))
}

  file.copy(paste0(basefolder, standardpdf), paste0(basefolder, scanfolder, standardpdf), overwrite = TRUE)
  
}

prepare_scratch()
