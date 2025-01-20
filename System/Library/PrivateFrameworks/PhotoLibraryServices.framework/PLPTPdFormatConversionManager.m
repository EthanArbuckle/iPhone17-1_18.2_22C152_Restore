@interface PLPTPdFormatConversionManager
- (BOOL)generatePosterFrameExportForVideoURL:(id)a3 outputData:(id *)a4 maximumSize:(CGSize)a5 error:(id *)a6;
- (BOOL)initialized;
- (BOOL)peerSupportsAdjustmentBaseResources;
- (BOOL)peerSupportsTranscodeChoice;
- (BOOL)penultimateIsPublic;
- (BOOL)setupTemporaryDirectory;
- (NSMutableDictionary)convertedLivePhotoPairingIdentifiersByOriginalIdentifiers;
- (NSURL)temporaryDirectoryURL;
- (PFMediaCapabilities)peerMediaCapabilities;
- (PHMediaFormatConversionManager)mediaFormatConversionManager;
- (PLPTPdFormatConversionManager)init;
- (id)assetReaderForFormatConvertedPTPAsset:(id)a3 ofManagedAsset:(id)a4 path:(id)a5;
- (id)conversionResultForAsset:(id)a3 sourceHints:(id)a4 forceLegacyConversion:(BOOL)a5 assetTypeLabel:(id)a6;
- (id)convertedAssetLivePhotoPairingIdentifierForOriginalIdentifier:(id)a3;
- (id)effectivePeerMediaCapabilites;
- (id)requestForOriginalAtPath:(id)a3 isVideo:(BOOL)a4 imageDimensions:(CGSize)a5 originalPairingIdentifier:(id)a6;
- (id)requestForPath:(id)a3 isVideo:(BOOL)a4 imageDimensions:(CGSize)a5;
- (id)requestForRenderImagePath:(id)a3 imageDimensions:(CGSize)a4 outputFilename:(id)a5;
- (id)requestForRenderVideoPath:(id)a3 outputFilename:(id)a4;
- (id)sourceForPath:(id)a3 isVideo:(BOOL)a4 imageDimensions:(CGSize)a5;
- (void)dealloc;
- (void)invalidate;
- (void)setConvertedLivePhotoPairingIdentifiersByOriginalIdentifiers:(id)a3;
- (void)setInitialized:(BOOL)a3;
- (void)setMediaFormatConversionManager:(id)a3;
- (void)setPeerMediaCapabilities:(id)a3;
- (void)setTemporaryDirectoryURL:(id)a3;
@end

@implementation PLPTPdFormatConversionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_convertedLivePhotoPairingIdentifiersByOriginalIdentifiers, 0);
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
  objc_storeStrong((id *)&self->_mediaFormatConversionManager, 0);
  objc_storeStrong((id *)&self->_peerMediaCapabilities, 0);
  objc_storeStrong((id *)&self->_legacyCapabilities, 0);
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setConvertedLivePhotoPairingIdentifiersByOriginalIdentifiers:(id)a3
{
}

- (NSMutableDictionary)convertedLivePhotoPairingIdentifiersByOriginalIdentifiers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTemporaryDirectoryURL:(id)a3
{
}

- (NSURL)temporaryDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMediaFormatConversionManager:(id)a3
{
}

- (PHMediaFormatConversionManager)mediaFormatConversionManager
{
  return (PHMediaFormatConversionManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPeerMediaCapabilities:(id)a3
{
}

- (PFMediaCapabilities)peerMediaCapabilities
{
  return (PFMediaCapabilities *)objc_getProperty(self, a2, 24, 1);
}

- (id)effectivePeerMediaCapabilites
{
  BOOL v3 = [(PLPTPdFormatConversionManager *)self peerSupportsTranscodeChoice];
  uint64_t v4 = 24;
  if (v3) {
    uint64_t v4 = 8;
  }
  v5 = *(Class *)((char *)&self->super.isa + v4);
  return v5;
}

- (id)conversionResultForAsset:(id)a3 sourceHints:(id)a4 forceLegacyConversion:(BOOL)a5 assetTypeLabel:(id)a6
{
  BOOL v7 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v7)
  {
    v13 = self->_legacyCapabilities;
  }
  else
  {
    v13 = [(PLPTPdFormatConversionManager *)self effectivePeerMediaCapabilites];
  }
  v14 = v13;
  v15 = +[PLPTPConversionHelper conversionResultForAsset:v10 sourceHints:v11 withConversionManager:self->_mediaFormatConversionManager peerCapabilities:v13];
  v16 = PLPTPGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = [v10 assetHandle];
    v18 = [v17 assetID];
    int v20 = 138543874;
    v21 = v18;
    __int16 v22 = 2114;
    id v23 = v12;
    __int16 v24 = 2114;
    v25 = v15;
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "Media conversion result for asset %{public}@ (%{public}@): %{public}@", (uint8_t *)&v20, 0x20u);
  }
  return v15;
}

- (BOOL)penultimateIsPublic
{
  return 0;
}

- (BOOL)peerSupportsAdjustmentBaseResources
{
  return [(PFMediaCapabilities *)self->_peerMediaCapabilities supportForAdjustmentBaseResources] == 1;
}

- (BOOL)peerSupportsTranscodeChoice
{
  return [(PFMediaCapabilities *)self->_peerMediaCapabilities supportsTranscodeChoice];
}

- (void)invalidate
{
  id v2 = [(PLPTPdFormatConversionManager *)self mediaFormatConversionManager];
  [v2 invalidate];
}

- (BOOL)generatePosterFrameExportForVideoURL:(id)a3 outputData:(id *)a4 maximumSize:(CGSize)a5 error:(id *)a6
{
  double height = a5.height;
  double width = a5.width;
  id v10 = (void *)MEMORY[0x1E4F748C0];
  id v11 = (void *)*MEMORY[0x1E4F44410];
  id v12 = a3;
  v13 = [v11 identifier];
  LOBYTE(a6) = objc_msgSend(v10, "generatePosterFrameExportForVideoURL:outputData:maximumSize:outputFileType:error:", v12, a4, v13, a6, width, height);

  return (char)a6;
}

- (id)convertedAssetLivePhotoPairingIdentifierForOriginalIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PLPTPdFormatConversionManager *)self convertedLivePhotoPairingIdentifiersByOriginalIdentifiers];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    BOOL v7 = [MEMORY[0x1E4F29128] UUID];
    v6 = [v7 UUIDString];

    v8 = [(PLPTPdFormatConversionManager *)self convertedLivePhotoPairingIdentifiersByOriginalIdentifiers];
    [v8 setObject:v6 forKeyedSubscript:v4];

    v9 = PLPTPGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Cached converted live photo UUID %@ -> %@", (uint8_t *)&v12, 0x16u);
    }
  }
  id v10 = PLPTPGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412546;
    id v13 = v4;
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "Using converted live photo UUID %@ -> %@", (uint8_t *)&v12, 0x16u);
  }

  return v6;
}

- (id)sourceForPath:(id)a3 isVideo:(BOOL)a4 imageDimensions:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  BOOL v7 = a4;
  v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3 isDirectory:0];
  if (v7) {
    [MEMORY[0x1E4F74900] videoSourceForFileURL:v8];
  }
  else {
  v9 = objc_msgSend(MEMORY[0x1E4F74900], "imageSourceForFileURL:dimensions:", v8, width, height);
  }

  return v9;
}

- (id)requestForPath:(id)a3 isVideo:(BOOL)a4 imageDimensions:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  BOOL v7 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = -[PLPTPdFormatConversionManager sourceForPath:isVideo:imageDimensions:](self, "sourceForPath:isVideo:imageDimensions:", v9, v7, width, height);
  id v11 = (void *)MEMORY[0x1E4F748F8];
  int v12 = [(PLPTPdFormatConversionManager *)self effectivePeerMediaCapabilites];
  id v17 = 0;
  id v13 = [v11 requestForSource:v10 destinationCapabilities:v12 error:&v17];
  id v14 = v17;

  if (!v13)
  {
    v15 = PLPTPGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v9;
      __int16 v20 = 2114;
      id v21 = v14;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Unable to create request for path %@: %{public}@", buf, 0x16u);
    }
  }
  return v13;
}

- (id)requestForRenderVideoPath:(id)a3 outputFilename:(id)a4
{
  id v6 = a4;
  BOOL v7 = -[PLPTPdFormatConversionManager requestForPath:isVideo:imageDimensions:](self, "requestForPath:isVideo:imageDimensions:", a3, 1, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  v8 = v7;
  if (v7)
  {
    [v7 setOutputFilename:v6];
    [v8 setLivePhotoPairingIdentifierBehavior:1];
    [v8 setShouldPadOutputFileToEstimatedLength:1];
  }

  return v8;
}

- (id)requestForRenderImagePath:(id)a3 imageDimensions:(CGSize)a4 outputFilename:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a5;
  id v10 = -[PLPTPdFormatConversionManager requestForPath:isVideo:imageDimensions:](self, "requestForPath:isVideo:imageDimensions:", a3, 0, width, height);
  id v11 = v10;
  if (v10)
  {
    [v10 setOutputFilename:v9];
    [v11 setLivePhotoPairingIdentifierBehavior:1];
    [v11 setShouldPadOutputFileToEstimatedLength:1];
  }

  return v11;
}

- (id)requestForOriginalAtPath:(id)a3 isVideo:(BOOL)a4 imageDimensions:(CGSize)a5 originalPairingIdentifier:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  BOOL v8 = a4;
  id v11 = a6;
  int v12 = -[PLPTPdFormatConversionManager requestForPath:isVideo:imageDimensions:](self, "requestForPath:isVideo:imageDimensions:", a3, v8, width, height);
  if (v12)
  {
    if (v11)
    {
      id v13 = [(PLPTPdFormatConversionManager *)self convertedAssetLivePhotoPairingIdentifierForOriginalIdentifier:v11];
      [v12 setLivePhotoPairingIdentifier:v13];
      [v12 setLivePhotoPairingIdentifierBehavior:4];
    }
    [v12 setShouldPadOutputFileToEstimatedLength:1];
  }

  return v12;
}

- (id)assetReaderForFormatConvertedPTPAsset:(id)a3 ofManagedAsset:(id)a4 path:(id)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([(PLPTPdFormatConversionManager *)self initialized])
  {
    int v12 = v10;
    id v13 = [v9 assetHandle];
    uint64_t v14 = [v13 type];
    uint64_t v15 = [v12 isVideo];
    uint64_t v16 = [v12 mediaGroupUUID];
    uint64_t v17 = [v12 originalWidth];
    v60 = v11;
    double v18 = (double)v17;
    double v19 = (double)[v12 originalHeight];
    uint64_t v20 = v15;
    uint64_t v59 = v14;
    switch(v14)
    {
      case 0:
        goto LABEL_21;
      case 3:
        goto LABEL_15;
      case 4:
        id v21 = [v12 pathForOriginalFile];
        uint64_t v22 = -[PLPTPdFormatConversionManager requestForOriginalAtPath:isVideo:imageDimensions:originalPairingIdentifier:](self, "requestForOriginalAtPath:isVideo:imageDimensions:originalPairingIdentifier:", v21, 0, v16, (double)v17, v19);

        double v23 = (double)[v12 width];
        double v24 = (double)[v12 height];
        v25 = [v9 filename];
        uint64_t v26 = -[PLPTPdFormatConversionManager requestForRenderImagePath:imageDimensions:outputFilename:](self, "requestForRenderImagePath:imageDimensions:outputFilename:", v11, v25, v23, v24);

        v27 = (void *)v22;
        id v63 = 0;
        v28 = [MEMORY[0x1E4F748E8] chainedRequestForAdjustmentRenderRequest:v26 dependingOnRequest:v22 error:&v63];
        id v29 = v63;
        if (!v28)
        {
          id v58 = v29;
          v57 = PLPTPGetLog();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v65 = v11;
            __int16 v66 = 2114;
            uint64_t v67 = (uint64_t)v58;
            _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_ERROR, "Unable to create request for path %@: %{public}@", buf, 0x16u);
          }

          id v29 = v58;
        }

        goto LABEL_17;
      case 5:
        v27 = [v9 filename];
        v28 = [(PLPTPdFormatConversionManager *)self requestForRenderVideoPath:v11 outputFilename:v27];
LABEL_17:

        if (!v28) {
          goto LABEL_29;
        }
        goto LABEL_24;
      case 6:
        [v12 spatialOverCaptureSize];
        double v18 = v36;
        double v19 = v37;
        v38 = [v12 ptpAdditionalAttributes];
        [v38 spatialOverCaptureInformation];
        v39 = (void *)v16;
        v41 = v40 = v13;
        uint64_t v42 = [v41 spatialOverCaptureLivePhotoPairingIdentifier];

        id v11 = v60;
        id v13 = v40;

        uint64_t v16 = v42;
        uint64_t v20 = v15;
        goto LABEL_21;
      case 7:
        [v12 spatialOverCaptureSize];
        double v18 = v34;
        double v19 = v35;
LABEL_15:
        uint64_t v20 = 1;
        goto LABEL_21;
      case 8:
        [v12 videoComplementSpatialOverCaptureSize];
        double v18 = v43;
        double v19 = v44;
        v45 = [v12 ptpAdditionalAttributes];
        [v45 spatialOverCaptureInformation];
        v46 = (void *)v16;
        v48 = v47 = v13;
        uint64_t v49 = [v48 spatialOverCaptureLivePhotoPairingIdentifier];

        id v11 = v60;
        id v13 = v47;

        uint64_t v20 = 1;
        uint64_t v16 = v49;
LABEL_21:
        v28 = -[PLPTPdFormatConversionManager requestForOriginalAtPath:isVideo:imageDimensions:originalPairingIdentifier:](self, "requestForOriginalAtPath:isVideo:imageDimensions:originalPairingIdentifier:", v11, v20, v16, v18, v19);
        if ([v13 requiresConversion])
        {
          [v28 setForceFormatConversion:1];
          if (!v15)
          {
LABEL_23:
            if (v28) {
              goto LABEL_24;
            }
            goto LABEL_29;
          }
        }
        else if (!v15)
        {
          goto LABEL_23;
        }
        v54 = [(PLPTPdFormatConversionManager *)self mediaFormatConversionManager];
        [v54 preflightConversionRequest:v28];

        [v28 enableSinglePassVideoEncodingWithUpdateHandler:&__block_literal_global_49735];
        if (v28)
        {
LABEL_24:
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __91__PLPTPdFormatConversionManager_assetReaderForFormatConvertedPTPAsset_ofManagedAsset_path___block_invoke_67;
          block[3] = &unk_1E5875CE0;
          v33 = v28;
          v62 = v33;
          dispatch_block_t v50 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
          v51 = [(PLPTPdFormatConversionManager *)self mediaFormatConversionManager];
          [v51 enqueueConversionRequest:v33 completionHandler:v50];

          if (([v33 requiresSinglePassVideoConversion] & 1) != 0
            || (dispatch_block_wait(v50, 0xFFFFFFFFFFFFFFFFLL), [v33 status] == 4))
          {
            v32 = (void *)v16;
            v52 = [PLPTPConversionDestinationAssetReader alloc];
            v53 = [v33 destination];
            v31 = [(PLPTPConversionDestinationAssetReader *)v52 initWithDestination:v53];
          }
          else
          {
            v32 = (void *)v16;
            v53 = PLPTPGetLog();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              v55 = [v33 error];
              *(_DWORD *)buf = 138543874;
              v65 = v33;
              __int16 v66 = 2048;
              uint64_t v67 = v59;
              __int16 v68 = 2114;
              v69 = v55;
              _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_ERROR, "Conversion request %{public}@ for asset type %ld failed: %{public}@", buf, 0x20u);
            }
            v31 = 0;
          }

LABEL_34:
LABEL_35:

          id v11 = v60;
          goto LABEL_36;
        }
LABEL_29:
        v32 = (void *)v16;
        v31 = 0;
        goto LABEL_35;
      default:
        v32 = (void *)v16;
        v33 = PLPTPGetLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v65 = 0;
          __int16 v66 = 2048;
          uint64_t v67 = v14;
          _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "Ignoring conversion request %{public}@ for unknown asset type %ld", buf, 0x16u);
        }
        v31 = 0;
        goto LABEL_34;
    }
  }
  int v12 = PLPTPGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v30 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    v65 = v30;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Ignoring request %{public}@ to conversion manager in failed state", buf, 0xCu);
  }
  v31 = 0;
LABEL_36:

  return v31;
}

void __91__PLPTPdFormatConversionManager_assetReaderForFormatConvertedPTPAsset_ofManagedAsset_path___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  BOOL v7 = PLPTPGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 134218242;
    uint64_t v9 = a2;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "Single pass video conversion update, status: %ld, error: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(PLPTPdFormatConversionManager *)self temporaryDirectoryURL];
  id v10 = 0;
  char v5 = [v3 removeItemAtURL:v4 error:&v10];
  id v6 = v10;

  if ((v5 & 1) == 0)
  {
    BOOL v7 = PLPTPGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = [(PLPTPdFormatConversionManager *)self temporaryDirectoryURL];
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Unable to remove temporary directory %@: %{public}@", buf, 0x16u);
    }
  }

  v9.receiver = self;
  v9.super_class = (Class)PLPTPdFormatConversionManager;
  [(PLPTPdFormatConversionManager *)&v9 dealloc];
}

- (BOOL)setupTemporaryDirectory
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"%@-%d", v5, getpid()];

  BOOL v7 = NSTemporaryDirectory();
  int v8 = [v7 stringByAppendingPathComponent:v6];

  objc_super v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:1];
  [(PLPTPdFormatConversionManager *)self setTemporaryDirectoryURL:v9];

  id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  unsigned __int8 v29 = 0;
  id v11 = [(PLPTPdFormatConversionManager *)self temporaryDirectoryURL];
  uint64_t v12 = [v11 path];
  int v13 = [v10 fileExistsAtPath:v12 isDirectory:&v29];

  if (v13)
  {
    int v14 = v29;
    uint64_t v15 = PLPTPGetLog();
    uint64_t v16 = v15;
    if (v14)
    {
      BOOL v17 = 1;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        double v18 = [(PLPTPdFormatConversionManager *)self temporaryDirectoryURL];
        *(_DWORD *)buf = 138412290;
        v31 = v18;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_INFO, "Conversion manager temporary directory path already exists: %@", buf, 0xCu);
      }
      goto LABEL_15;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = [(PLPTPdFormatConversionManager *)self temporaryDirectoryURL];
      *(_DWORD *)buf = 138412290;
      v31 = v26;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Conversion manager temporary directory path exists but is not directory %@", buf, 0xCu);
    }
LABEL_14:
    BOOL v17 = 0;
    goto LABEL_15;
  }
  double v19 = [(PLPTPdFormatConversionManager *)self temporaryDirectoryURL];
  id v28 = 0;
  int v20 = [v10 createDirectoryAtURL:v19 withIntermediateDirectories:1 attributes:0 error:&v28];
  uint64_t v16 = v28;

  id v21 = PLPTPGetLog();
  uint64_t v22 = v21;
  if (!v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v25 = [(PLPTPdFormatConversionManager *)self temporaryDirectoryURL];
      *(_DWORD *)buf = 138412546;
      v31 = v25;
      __int16 v32 = 2112;
      v33 = v16;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Unable to create conversion manager temporary directory %@: %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    double v23 = [(PLPTPdFormatConversionManager *)self temporaryDirectoryURL];
    double v24 = [v23 path];
    *(_DWORD *)buf = 138412290;
    v31 = v24;
    _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_INFO, "Created conversion manager temporary directory %@", buf, 0xCu);
  }
  BOOL v17 = 1;
LABEL_15:

  return v17;
}

- (PLPTPdFormatConversionManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)PLPTPdFormatConversionManager;
  id v2 = [(PLPTPdFormatConversionManager *)&v10 init];
  if (v2)
  {
    BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
    [(PLPTPdFormatConversionManager *)v2 setConvertedLivePhotoPairingIdentifiersByOriginalIdentifiers:v3];

    id v4 = objc_opt_new();
    [(PLPTPdFormatConversionManager *)v2 setMediaFormatConversionManager:v4];

    if ([(PLPTPdFormatConversionManager *)v2 setupTemporaryDirectory])
    {
      temporaryDirectoryURL = v2->_temporaryDirectoryURL;
      id v6 = [(PLPTPdFormatConversionManager *)v2 mediaFormatConversionManager];
      [v6 setDirectoryForTemporaryFiles:temporaryDirectoryURL];

      [(PLPTPdFormatConversionManager *)v2 setInitialized:1];
    }
    uint64_t v7 = [MEMORY[0x1E4F8CC30] legacyCapabilities];
    legacyCapabilities = v2->_legacyCapabilities;
    v2->_legacyCapabilities = (PFMediaCapabilities *)v7;
  }
  return v2;
}

@end