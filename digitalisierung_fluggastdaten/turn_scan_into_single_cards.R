
# Diese Funktion sollte die gescannten Aussteigerkarten aus dem gemeinsamen Ordner holen, dort löschen und anschließend in einzelne Dateien aufsplitten und in Bilddateien umwandeln.

turn_scan_into_single_cards <- function(
  basefolder = "digitalisierung_fluggastdaten/",
  scanfolder = "01_scans/",  
  storedscanfolder = "02_pdfs/", 
  individualcardfolder = "03_pngs/", 
  shinypicturefolder = "www/",
  numberofpagestoprocess = c(1:20),
  pdfconvertquality = 150) {

  library(pdftools)
    
# Get date and time stamp
startingdatetime <- gsub(" ", "", as.character(format(Sys.time(), "%Y%m%d%H%M%S")))

scanfolder = paste0(basefolder, scanfolder)
storedscanfolder = paste0(basefolder, storedscanfolder)
individualcardfolder = paste0(basefolder, individualcardfolder)
shinypicturefolder = paste0(basefolder, shinypicturefolder)

# Read the first scan and put it in next folder
files <- list.files(scanfolder, pattern = ".pdf$")

currentscanwithpath <- paste0(scanfolder, files[1])
currentscanwithoutpath <- files[1]
file.copy(currentscanwithpath, storedscanfolder)
file.remove(currentscanwithpath) 
currentpdfname <- paste0(storedscanfolder, startingdatetime, ".pdf")
file.rename(paste0(storedscanfolder, files[1]), currentpdfname)

# Read pdf an split it up
lengthofpdf <- pdf_length(currentpdfname)

pdf_convert(currentpdfname, pages = numberofpagestoprocess, dpi = pdfconvertquality) # Here should be an output folder, then we could skip the next few lines
pngfiles <- list.files(pattern = ".png$")
for(file in pngfiles) {
  file.copy(file, paste0(individualcardfolder, pngfiles))
  file.remove(file)
}
}
turn_scan_into_single_cards(
  
)
