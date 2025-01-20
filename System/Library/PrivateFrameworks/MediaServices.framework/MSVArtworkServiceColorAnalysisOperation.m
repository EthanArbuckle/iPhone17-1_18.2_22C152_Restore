@interface MSVArtworkServiceColorAnalysisOperation
- (MSVArtworkColorAnalysis)colorAnalysis;
- (void)main;
@end

@implementation MSVArtworkServiceColorAnalysisOperation

- (void).cxx_destruct
{
}

- (void)main
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v4 = [(MSVArtworkServiceOperation *)self request];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"MSVArtworkServiceColorAnalysisOperation.m" lineNumber:28 description:@"MSVArtworkServiceColorAnalysisOperation only supports requests of type MSVArtworkServiceColorAnalysisRequest"];
  }
  v6 = [(MSVArtworkServiceOperation *)self request];
  [v6 consumeSandboxExtensions];
  v7 = [v6 sourceURL];
  ImageSource = MSVImageUtilitiesCreateImageSource(v7);

  if (!ImageSource)
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    v15 = [v6 sourceURL];
    v16 = objc_msgSend(v14, "msv_errorWithDomain:code:debugDescription:", @"MSVArtworkServiceErrorDomain", 1, @"Invalid source image URL=%@", v15);
    [(MSVArtworkServiceOperation *)self setOperationError:v16];

    goto LABEL_11;
  }
  CGImageRef ImageFromSource = MSVImageUtilitiesCreateImageFromSource(ImageSource, 0);
  v10 = [[MSVArtworkColorAnalyzer alloc] initWithSourceImage:ImageFromSource];
  v11 = [(MSVArtworkColorAnalyzer *)v10 analyze];
  if (v11)
  {
    v12 = os_log_create("com.apple.amp.MediaServices", "Artwork");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = [v6 sourceURL];
      *(_DWORD *)buf = 138477827;
      v22 = v13;
      _os_log_impl(&dword_1A30CD000, v12, OS_LOG_TYPE_INFO, "Created artwork analysis for source URL=%{private}@", buf, 0xCu);
    }
    objc_storeStrong((id *)&self->_colorAnalysis, v11);
    if (!ImageFromSource) {
      goto LABEL_9;
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    v18 = [(MSVArtworkColorAnalyzer *)v10 debugDescription];
    v19 = objc_msgSend(v17, "msv_errorWithDomain:code:debugDescription:", @"MSVArtworkServiceErrorDomain", 1, @"Failed to create color analysis with analyzer=%@", v18);
    [(MSVArtworkServiceOperation *)self setOperationError:v19];

    if (!ImageFromSource) {
      goto LABEL_9;
    }
  }
  CFRelease(ImageFromSource);
LABEL_9:
  CFRelease(ImageSource);

LABEL_11:
  [v6 releaseSandboxExtensions];
}

- (MSVArtworkColorAnalysis)colorAnalysis
{
  return self->_colorAnalysis;
}

@end