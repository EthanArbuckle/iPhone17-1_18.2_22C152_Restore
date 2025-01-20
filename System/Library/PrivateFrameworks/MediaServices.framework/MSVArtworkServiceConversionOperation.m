@interface MSVArtworkServiceConversionOperation
- (void)main;
@end

@implementation MSVArtworkServiceConversionOperation

- (void)main
{
  v4 = [(MSVArtworkServiceOperation *)self request];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2 object:self file:@"MSVArtworkServiceConversionOperation.m" lineNumber:20 description:@"MSVArtworkServiceConversionOperation only supports requests of type MSVArtworkServiceConversionRequest"];
  }
  v6 = [(MSVArtworkServiceOperation *)self request];
  [v6 consumeSandboxExtensions];
  id v7 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  v8 = [v6 sourceURL];
  ImageSource = MSVImageUtilitiesCreateImageSource(v8);

  if (!ImageSource)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    v11 = [v6 sourceURL];
    v12 = objc_msgSend(v10, "msv_errorWithDomain:code:debugDescription:", @"MSVArtworkServiceErrorDomain", 1, @"Invalid source image URL=%@", v11);
    [(MSVArtworkServiceOperation *)self setOperationError:v12];
  }
  v13 = [(MSVArtworkServiceOperation *)self operationError];

  if (!v13)
  {
    v14 = [v6 destinationURL];
    v15 = [v14 URLByDeletingLastPathComponent];

    v16 = [v15 path];
    char v17 = [v7 fileExistsAtPath:v16];

    if (v17)
    {
      v18 = [v15 path];
      char v19 = [v7 isWritableFileAtPath:v18];

      if (v19)
      {
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MSVArtworkServiceErrorDomain", 1, @"Destination directory isn't writable URL=%@", v15);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v37 = 0;
      [v7 createDirectoryAtURL:v15 withIntermediateDirectories:1 attributes:0 error:&v37];
      id v20 = v37;
      if (!v20)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    [(MSVArtworkServiceOperation *)self setOperationError:v20];
    goto LABEL_11;
  }
LABEL_13:
  v21 = [(MSVArtworkServiceOperation *)self operationError];

  if (v21) {
    goto LABEL_30;
  }
  v22 = [v6 destinationURL];
  [v7 removeItemAtURL:v22 error:0];

  CGImageRef ImageFromSource = MSVImageUtilitiesCreateImageFromSource(ImageSource, 0);
  v24 = MSVImageUtilitiesCopyUTTypeForImage();
  if (ImageFromSource) {
    CFRelease(ImageFromSource);
  }
  v25 = MSVImageUtilitiesCopyUTTypeForImageFormat([v6 destinationFormat]);
  if ([v25 isEqualToString:v24])
  {
    v26 = [v6 sourceURL];
    v27 = [v6 destinationURL];
    id v36 = 0;
    char v28 = [v7 moveItemAtURL:v26 toURL:v27 error:&v36];
    id v29 = v36;

    if (v28) {
      goto LABEL_24;
    }
  }
  else
  {
    unint64_t v30 = [v6 destinationFormat];
    v31 = [v6 destinationURL];
    FileImageDestination = MSVImageUtilitiesCreateFileImageDestination(v30, v31, 1uLL);

    if (FileImageDestination)
    {
      if ([v6 destinationFormat])
      {
        MSVImageUtilitiesAddSourceImageToDestination(ImageSource, 0, [v6 destinationFormat], FileImageDestination);
      }
      else
      {
        [v6 destinationCompressionQuality];
        MSVImageUtilitiesAddSourceImageToJPEGDestination(ImageSource, 0, FileImageDestination, v33);
      }
      if (!CGImageDestinationFinalize(FileImageDestination))
      {
        v34 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MSVArtworkServiceErrorDomain", 1, @"Failed to convert image");
        [(MSVArtworkServiceOperation *)self setOperationError:v34];
      }
      CFRelease(FileImageDestination);
      goto LABEL_29;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MSVArtworkServiceErrorDomain", 1, @"Failed to convert image format=%ld", objc_msgSend(v6, "destinationFormat"));
    id v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  [(MSVArtworkServiceOperation *)self setOperationError:v29];
LABEL_24:

LABEL_29:
LABEL_30:
  if (ImageSource) {
    CFRelease(ImageSource);
  }
  [v6 releaseSandboxExtensions];
}

@end