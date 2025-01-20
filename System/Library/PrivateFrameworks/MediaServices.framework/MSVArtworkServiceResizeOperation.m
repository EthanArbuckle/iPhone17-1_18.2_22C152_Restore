@interface MSVArtworkServiceResizeOperation
- (void)main;
@end

@implementation MSVArtworkServiceResizeOperation

- (void)main
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  v4 = [(MSVArtworkServiceOperation *)self request];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v61 = [MEMORY[0x1E4F28B00] currentHandler];
    [v61 handleFailureInMethod:a2 object:self file:@"MSVArtworkServiceResizeOperation.m" lineNumber:21 description:@"MSVArtworkServiceResizeOperation only supports requests of type MSVArtworkServiceResizeRequest"];
  }
  v6 = [(MSVArtworkServiceOperation *)self request];
  [v6 consumeSandboxExtensions];
  id v7 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  v8 = [MEMORY[0x1E4F1CA48] array];
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __40__MSVArtworkServiceResizeOperation_main__block_invoke;
  v77[3] = &unk_1E5AD9710;
  id v9 = v7;
  id v78 = v9;
  id v10 = v8;
  id v79 = v10;
  [v6 enumerateDestinationsUsingBlock:v77];
  if (![v10 count])
  {
    [(MSVArtworkServiceOperation *)self setDebugMessage:@"No resizing needed, all destinations already exist on disk."];
    goto LABEL_57;
  }
  v11 = [v6 sourceURL];
  ImageSource = MSVImageUtilitiesCreateImageSource(v11);

  if (!ImageSource)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    v14 = [v6 sourceURL];
    v15 = objc_msgSend(v13, "msv_errorWithDomain:code:debugDescription:", @"MSVArtworkServiceErrorDomain", 1, @"Invalid source image URL=%@", v14);
    [(MSVArtworkServiceOperation *)self setOperationError:v15];
  }
  v16 = [(MSVArtworkServiceOperation *)self operationError];

  if (!v16)
  {
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v65 = v10;
    id v17 = v10;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v73 objects:v81 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v74;
      v63 = v6;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v74 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [*(id *)(*((void *)&v73 + 1) + 8 * i) destinationURL];
          v23 = [v22 URLByDeletingLastPathComponent];

          v24 = [v23 path];
          char v25 = [v9 fileExistsAtPath:v24];

          if (v25)
          {
            v26 = [v23 path];
            char v27 = [v9 isWritableFileAtPath:v26];

            if ((v27 & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MSVArtworkServiceErrorDomain", 1, @"Destination directory isn't writable URL=%@", v23);
              id v29 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
              v30 = v29;
              [(MSVArtworkServiceOperation *)self setOperationError:v29];

              v6 = v63;
              goto LABEL_22;
            }
          }
          else
          {
            id v72 = 0;
            [v9 createDirectoryAtURL:v23 withIntermediateDirectories:1 attributes:0 error:&v72];
            id v29 = v72;
            if (v29) {
              goto LABEL_21;
            }
            v28 = [v23 path];
            MSVEnableDirStatsForDirectory(v28);
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v73 objects:v81 count:16];
        v6 = v63;
        if (v19) {
          continue;
        }
        break;
      }
    }
LABEL_22:

    id v10 = v65;
  }
  v31 = [(MSVArtworkServiceOperation *)self operationError];

  if (v31) {
    goto LABEL_55;
  }
  ImageFromSource = MSVImageUtilitiesCreateImageFromSource(ImageSource, 0);
  size_t Width = CGImageGetWidth(ImageFromSource);
  cf = ImageFromSource;
  size_t Height = CGImageGetHeight(ImageFromSource);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v35 = v10;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v68 objects:v80 count:16];
  if (!v36) {
    goto LABEL_52;
  }
  uint64_t v37 = v36;
  v64 = v6;
  id v66 = v10;
  uint64_t v67 = 0;
  double v38 = (double)Width;
  double v39 = (double)Height;
  uint64_t v40 = *(void *)v69;
  while (2)
  {
    for (uint64_t j = 0; j != v37; ++j)
    {
      if (*(void *)v69 != v40) {
        objc_enumerationMutation(v35);
      }
      v42 = *(void **)(*((void *)&v68 + 1) + 8 * j);
      [v42 size];
      if (v43 >= v38)
      {
        [v42 size];
        if (v44 >= v39)
        {
          ++v67;
          continue;
        }
      }
      unint64_t v45 = [v42 format];
      v46 = [v42 destinationURL];
      FileImageDestination = MSVImageUtilitiesCreateFileImageDestination(v45, v46, 1uLL);

      if (!FileImageDestination)
      {
        v60 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MSVArtworkServiceErrorDomain", 1, @"Failed to create file image destination format=%ld", objc_msgSend(v42, "format"));
        [(MSVArtworkServiceOperation *)self setOperationError:v60];

        goto LABEL_50;
      }
      if ([v42 format])
      {
        uint64_t v48 = [v42 format];
        [v42 size];
        double v50 = v49;
        [v42 size];
        if (v50 >= v51) {
          double v52 = v50;
        }
        else {
          double v52 = v51;
        }
        if (MSVImageUtilitiesResizeSourceImageToDestination(ImageSource, 0, v48, FileImageDestination, v52)) {
          goto LABEL_41;
        }
      }
      else
      {
        [v42 compressionQuality];
        double v54 = v53;
        [v42 size];
        double v56 = v55;
        [v42 size];
        if (v56 >= v57) {
          double v57 = v56;
        }
        if (MSVImageUtilitiesResizeSourceImageToJPEGDestination(ImageSource, 0, FileImageDestination, v54, v57))
        {
LABEL_41:
          if (CGImageDestinationFinalize(FileImageDestination)) {
            goto LABEL_43;
          }
        }
      }
      v58 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MSVArtworkServiceErrorDomain", 1, @"Failed to resize image");
      [(MSVArtworkServiceOperation *)self setOperationError:v58];

LABEL_43:
      CFRelease(FileImageDestination);
      v59 = [(MSVArtworkServiceOperation *)self operationError];

      if (v59) {
        goto LABEL_50;
      }
    }
    uint64_t v37 = [v35 countByEnumeratingWithState:&v68 objects:v80 count:16];
    if (v37) {
      continue;
    }
    break;
  }
LABEL_50:

  v6 = v64;
  id v10 = v66;
  if (v67)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Skipped %lu destinations that were larger than the source image.", v67);
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    [(MSVArtworkServiceOperation *)self setDebugMessage:v35];
LABEL_52:
  }
  if (cf) {
    CFRelease(cf);
  }
LABEL_55:
  if (ImageSource) {
    CFRelease(ImageSource);
  }
LABEL_57:
  [v6 releaseSandboxExtensions];
}

void __40__MSVArtworkServiceResizeOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v7 = v3;
  v5 = [v3 destinationURL];
  v6 = [v5 path];
  LOBYTE(v4) = [v4 fileExistsAtPath:v6];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

@end