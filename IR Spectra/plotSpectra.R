library("ggplot2")

filenames<-list.files(pattern=".txt")

for(i in 1:length(filenames)) {    

    spectrum <- as.data.frame(read.csv(filenames[i], sep = "\t", header=FALSE))

    ## Calculate relative transmission
    spectrum$V3 <- (spectrum$V2/max(spectrum$V2)*100)
    
    p<-ggplot(data=spectrum, aes(x=V1, y=V3)) + 
        geom_line(colour="red", size = 0.75, lineend = "round") +
        scale_x_continuous(trans = "reverse") +
        xlab(expression(paste("Wavenumber ", nu, ", 1/cm"))) +
        ylab("Absorption, %") + 
        theme_bw()
    ggsave(paste0((substr(filenames[i],1,nchar(filenames[i])-4)), ".pdf"),
           device = "pdf", width = 8, height = 5)

}
