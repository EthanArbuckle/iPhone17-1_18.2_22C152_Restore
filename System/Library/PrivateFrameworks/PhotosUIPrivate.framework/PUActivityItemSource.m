@interface PUActivityItemSource
+ (BOOL)supportsAssetLocalIdentifierForActivityType:(id)a3;
+ (OS_os_log)activityItemSourceLog;
+ (id)_basicTypeIdentifierForAsset:(id)a3;
+ (id)_exportResultHandlingQueue;
+ (id)_sharingErrorWithCode:(int64_t)a3 underlyingError:(id)a4 localizedDescription:(id)a5 additionalInfo:(id)a6;
+ (void)_deleteOutputDirectoryURL:(id)a3 forSharingUUID:(id)a4;
- ($9D9B13A340AA60ED2DD68408BD7D962F)sharingPreferences;
- (BOOL)_copyResourceAtURL:(id)a3 toURL:(id)a4 shouldMove:(BOOL)a5;
- (BOOL)shouldAnchorPreparation;
- (BOOL)shouldSendAnalyticsInterval;
- (BOOL)shouldSkipPreparation;
- (NSError)lastPreparationError;
- (NSItemProvider)_pasteboardItemProvider;
- (NSProgress)_exportProgress;
- (NSString)sharingUUID;
- (NSURL)_assetsLibraryURL;
- (OS_dispatch_queue)externalIsolation;
- (PHAsset)asset;
- (PHAssetExportRequest)_assetExportRequest;
- (PUActivityItemSource)initWithAsset:(id)a3 sharingPreferences:(id)a4;
- (PUActivityItemSourceConfiguration)exportConfiguration;
- (id)_activityOperationQueueForExplicitRunning;
- (id)_createManagedURLForResourceAtURL:(id)a3 shouldMove:(BOOL)a4 forType:(int64_t)a5;
- (id)_exportProgressHandler;
- (id)_generateURLForType:(int64_t)a3 withPathExtension:(id)a4 preferredFilename:(id)a5;
- (id)_itemForActivityType:(id)a3;
- (id)_newOperationForActivityType:(id)a3;
- (id)_newPasteboardItemProviderForURL:(id)a3;
- (id)_outboundResourcesDirectoryURL;
- (id)_resourceURLForType:(int64_t)a3;
- (id)_runOnDemandExportForAsset:(id)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (id)_runOnDemandSingleFileExportForAsset:(id)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (id)_sharingVariants;
- (id)_uniformTypeIdentifierForActivityType:(id)a3;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageDataForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (id)activityViewControllerApplicationExtensionItem:(id)a3;
- (id)activityViewControllerOperation:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)completionHandler;
- (id)postCompletionHandler;
- (id)ppt_didFetchSharingVariantsHandler;
- (id)progressHandler;
- (unint64_t)signpostId;
- (unint64_t)state;
- (void)_beginObservingExportRequest:(id)a3 withProgressHandler:(id)a4;
- (void)_fetchAlternateWithOptions:(id)a3 forActivityType:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (void)_fetchImageWithOptions:(id)a3 forActivityType:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (void)_fetchLivePhotoWithOptions:(id)a3 forActivityType:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (void)_fetchSharingVariants;
- (void)_fetchVideoWithOptions:(id)a3 forActivityType:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (void)_resetState;
- (void)_runExportRequestWithOptions:(id)a3 forActivityType:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (void)_setAssetExportRequest:(id)a3;
- (void)_setAssetsLibraryURL:(id)a3;
- (void)_setExportProgress:(id)a3;
- (void)_setExportProgressHandler:(id)a3;
- (void)_setResourceURL:(id)a3 forType:(int64_t)a4;
- (void)_stopObservingExportRequest;
- (void)activityItemSourceOperation:(id)a3 prepareItemForActivityType:(id)a4;
- (void)assetExportRequest:(id)a3 didChangeToState:(unint64_t)a4 fromState:(unint64_t)a5;
- (void)cancel;
- (void)cleanUpExportedFiles;
- (void)cleanUpExportedFilesImmediately:(BOOL)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)runWithActivityType:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setExportConfiguration:(id)a3;
- (void)setLastPreparationError:(id)a3;
- (void)setPostCompletionHandler:(id)a3;
- (void)setPpt_didFetchSharingVariantsHandler:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setSharingPreferences:(id)a3;
- (void)setShouldAnchorPreparation:(BOOL)a3;
- (void)setShouldSendAnalyticsInterval:(BOOL)a3;
- (void)setShouldSkipPreparation:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)set_pasteboardItemProvider:(id)a3;
- (void)signalAnchorCompletion;
@end

@implementation PUActivityItemSource

- (void).cxx_destruct
{
  objc_storeStrong(&self->_ppt_didFetchSharingVariantsHandler, 0);
  objc_storeStrong((id *)&self->_externalIsolation, 0);
  objc_storeStrong((id *)&self->__assetsLibraryURL, 0);
  objc_storeStrong((id *)&self->__pasteboardItemProvider, 0);
  objc_storeStrong(&self->__exportProgressHandler, 0);
  objc_storeStrong((id *)&self->__exportProgress, 0);
  objc_storeStrong((id *)&self->__assetExportRequest, 0);
  objc_storeStrong((id *)&self->_exportConfiguration, 0);
  objc_storeStrong((id *)&self->_lastPreparationError, 0);
  objc_storeStrong(&self->_postCompletionHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_anchorOperation, 0);
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_assetOriginalFilenameBase, 0);
  objc_storeStrong((id *)&self->_sharingUUID, 0);
  objc_storeStrong((id *)&self->_sharingURLs, 0);
  objc_storeStrong((id *)&self->_onDemandExports, 0);
  objc_storeStrong((id *)&self->_fetchSharingVariantsSemaphore, 0);
  objc_storeStrong((id *)&self->_cachedSharingVariants, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setPpt_didFetchSharingVariantsHandler:(id)a3
{
}

- (id)ppt_didFetchSharingVariantsHandler
{
  return objc_getProperty(self, a2, 280, 1);
}

- (OS_dispatch_queue)externalIsolation
{
  return self->_externalIsolation;
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (void)_setAssetsLibraryURL:(id)a3
{
}

- (NSURL)_assetsLibraryURL
{
  return (NSURL *)objc_getProperty(self, a2, 256, 1);
}

- (void)set_pasteboardItemProvider:(id)a3
{
}

- (NSItemProvider)_pasteboardItemProvider
{
  return (NSItemProvider *)objc_getProperty(self, a2, 248, 1);
}

- (void)_setExportProgressHandler:(id)a3
{
}

- (id)_exportProgressHandler
{
  return self->__exportProgressHandler;
}

- (NSProgress)_exportProgress
{
  return self->__exportProgress;
}

- (void)_setAssetExportRequest:(id)a3
{
}

- (PHAssetExportRequest)_assetExportRequest
{
  return self->__assetExportRequest;
}

- (void)setExportConfiguration:(id)a3
{
}

- (PUActivityItemSourceConfiguration)exportConfiguration
{
  return self->_exportConfiguration;
}

- (void)setShouldAnchorPreparation:(BOOL)a3
{
  self->_shouldAnchorPreparation = a3;
}

- (BOOL)shouldAnchorPreparation
{
  return self->_shouldAnchorPreparation;
}

- (void)setShouldSkipPreparation:(BOOL)a3
{
  self->_shouldSkipPreparation = a3;
}

- (BOOL)shouldSkipPreparation
{
  return self->_shouldSkipPreparation;
}

- (void)setShouldSendAnalyticsInterval:(BOOL)a3
{
  self->_shouldSendAnalyticsInterval = a3;
}

- (BOOL)shouldSendAnalyticsInterval
{
  return self->_shouldSendAnalyticsInterval;
}

- (void)setLastPreparationError:(id)a3
{
}

- (NSError)lastPreparationError
{
  return self->_lastPreparationError;
}

- (void)setPostCompletionHandler:(id)a3
{
}

- (id)postCompletionHandler
{
  return objc_getProperty(self, a2, 200, 1);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 192, 1);
}

- (void)setProgressHandler:(id)a3
{
}

- (id)progressHandler
{
  return objc_getProperty(self, a2, 184, 1);
}

- (unint64_t)state
{
  return self->_state;
}

- ($9D9B13A340AA60ED2DD68408BD7D962F)sharingPreferences
{
  p_sharingPreferences = &self->_sharingPreferences;
  uint64_t v3 = *(void *)&self->_sharingPreferences.excludeLiveness;
  int64_t preferredExportFormat = p_sharingPreferences->preferredExportFormat;
  result.var6 = preferredExportFormat;
  result.var0 = v3;
  result.var1 = BYTE1(v3);
  result.var2 = BYTE2(v3);
  result.var3 = BYTE3(v3);
  result.var4 = BYTE4(v3);
  result.var5 = BYTE5(v3);
  return result;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)cleanUpExportedFilesImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(NSMutableDictionary *)self->_sharingURLs removeAllObjects];
  v5 = [(PUActivityItemSource *)self _outboundResourcesDirectoryURL];
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  v7 = [v5 path];
  int v8 = [v6 fileExistsAtPath:v7];

  if (v8)
  {
    v9 = PLShareSheetGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      sharingUUID = self->_sharingUUID;
      *(_DWORD *)buf = 138543362;
      v22 = sharingUUID;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Scheduling removal of exported files", buf, 0xCu);
    }

    v11 = self->_sharingUUID;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__PUActivityItemSource_cleanUpExportedFilesImmediately___block_invoke;
    aBlock[3] = &unk_1E5F2ECC8;
    id v19 = v5;
    v12 = v11;
    v20 = v12;
    v13 = _Block_copy(aBlock);
    v14 = v13;
    if (v3)
    {
      (*((void (**)(void *))v13 + 2))(v13);
    }
    else
    {
      v15 = dispatch_get_global_queue(9, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__PUActivityItemSource_cleanUpExportedFilesImmediately___block_invoke_2;
      block[3] = &unk_1E5F2EBA0;
      id v17 = v14;
      dispatch_async(v15, block);
    }
  }
}

uint64_t __56__PUActivityItemSource_cleanUpExportedFilesImmediately___block_invoke(uint64_t a1)
{
  return +[PUActivityItemSource _deleteOutputDirectoryURL:*(void *)(a1 + 32) forSharingUUID:*(void *)(a1 + 40)];
}

uint64_t __56__PUActivityItemSource_cleanUpExportedFilesImmediately___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cleanUpExportedFiles
{
}

- (void)_setResourceURL:(id)a3 forType:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  sharingURLs = self->_sharingURLs;
  int v8 = [NSNumber numberWithInteger:a4];
  v9 = [(NSMutableDictionary *)sharingURLs objectForKeyedSubscript:v8];

  if (v6 && v9)
  {
    v10 = PLShareSheetGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      sharingUUID = self->_sharingUUID;
      int v14 = 138544130;
      v15 = sharingUUID;
      __int16 v16 = 2048;
      int64_t v17 = a4;
      __int16 v18 = 2112;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Overwriting sharing URL of type: %lu from %@ to %@", (uint8_t *)&v14, 0x2Au);
    }
  }
  v12 = self->_sharingURLs;
  v13 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)v12 setObject:v6 forKeyedSubscript:v13];
}

- (id)_resourceURLForType:(int64_t)a3
{
  sharingURLs = self->_sharingURLs;
  v4 = [NSNumber numberWithInteger:a3];
  v5 = [(NSMutableDictionary *)sharingURLs objectForKeyedSubscript:v4];

  return v5;
}

- (id)_createManagedURLForResourceAtURL:(id)a3 shouldMove:(BOOL)a4 forType:(int64_t)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [v8 pathExtension];
  v10 = [v8 lastPathComponent];
  v11 = [v10 stringByDeletingPathExtension];

  v12 = [(PUActivityItemSource *)self _generateURLForType:a5 withPathExtension:v9 preferredFilename:v11];
  id v13 = v8;
  if ([(PUActivityItemSource *)self _copyResourceAtURL:v13 toURL:v12 shouldMove:v6])
  {
    id v14 = v12;
  }
  else
  {
    v15 = PLShareSheetGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      sharingUUID = self->_sharingUUID;
      int v18 = 138544130;
      id v19 = sharingUUID;
      __int16 v20 = 2112;
      id v21 = v13;
      __int16 v22 = 2048;
      int64_t v23 = a5;
      __int16 v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Failed to clone the URL (%@) for type %lu to outgoing temp (%@). Falling back to original URL which may cause failures in clients", (uint8_t *)&v18, 0x2Au);
    }

    id v14 = v13;
  }

  return v14;
}

- (BOOL)_copyResourceAtURL:(id)a3 toURL:(id)a4 shouldMove:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 path];
  v11 = [v10 stringByDeletingLastPathComponent];
  v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v33 = 0;
  char v13 = [v12 createDirectoryIfNeededAtPath:v11 error:&v33];
  id v14 = v33;

  if ((v13 & 1) == 0)
  {
    int64_t v23 = PLShareSheetGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      sharingUUID = self->_sharingUUID;
      *(_DWORD *)buf = 138543874;
      v35 = sharingUUID;
      __int16 v36 = 2112;
      id v37 = v11;
      __int16 v38 = 2112;
      id v39 = v14;
      _os_log_impl(&dword_1AE9F8000, v23, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Failed to create temporary outbound directory for sharing asset at %@: %@", buf, 0x20u);
    }
    goto LABEL_18;
  }
  v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v16 = [v15 removeItemAtURL:v9 error:0];

  if (v16)
  {
    int64_t v17 = PLShareSheetGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = self->_sharingUUID;
      *(_DWORD *)buf = 138543618;
      v35 = v18;
      __int16 v36 = 2112;
      id v37 = v9;
      _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Removed existing file at %@. This may indicate an error", buf, 0x16u);
    }
  }
  id v19 = [MEMORY[0x1E4F28CB8] defaultManager];
  __int16 v20 = v19;
  if (v5)
  {
    id v32 = v14;
    char v21 = [v19 moveItemAtURL:v8 toURL:v9 error:&v32];
    id v22 = v32;

    if ((v21 & 1) == 0)
    {
      int64_t v23 = PLShareSheetGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        __int16 v24 = self->_sharingUUID;
        *(_DWORD *)buf = 138544130;
        v35 = v24;
        __int16 v36 = 2112;
        id v37 = v8;
        __int16 v38 = 2112;
        id v39 = v9;
        __int16 v40 = 2112;
        id v41 = v22;
        v25 = "[Item: %{public}@] Failed to move resource at %@ to %@: %@";
LABEL_16:
        _os_log_impl(&dword_1AE9F8000, v23, OS_LOG_TYPE_ERROR, v25, buf, 0x2Au);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  else
  {
    id v31 = v14;
    int v27 = [v19 copyItemAtURL:v8 toURL:v9 error:&v31];
    id v22 = v31;

    if ((v27 & 1) == 0)
    {
      int64_t v23 = PLShareSheetGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v29 = self->_sharingUUID;
        *(_DWORD *)buf = 138544130;
        v35 = v29;
        __int16 v36 = 2112;
        id v37 = v8;
        __int16 v38 = 2112;
        id v39 = v9;
        __int16 v40 = 2112;
        id v41 = v22;
        v25 = "[Item: %{public}@] Failed to copy resource at %@ to %@: %@";
        goto LABEL_16;
      }
LABEL_17:
      id v14 = v22;
LABEL_18:

      BOOL v28 = 0;
      id v22 = v14;
      goto LABEL_19;
    }
  }
  BOOL v28 = 1;
LABEL_19:

  return v28;
}

- (id)_generateURLForType:(int64_t)a3 withPathExtension:(id)a4 preferredFilename:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  p_assetOriginalFilenameBase = (id *)&self->_assetOriginalFilenameBase;
  if (self->_assetOriginalFilenameBase) {
    goto LABEL_10;
  }
  [(PHAsset *)self->_asset fetchPropertySetsIfNeeded];
  v11 = [(PHAsset *)self->_asset originalMetadataProperties];
  v12 = [v11 originalFilename];

  if ([v12 length])
  {
    uint64_t v13 = [v12 stringByDeletingPathExtension];
  }
  else
  {
    if ([v9 length])
    {
      v15 = PLShareSheetGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        sharingUUID = self->_sharingUUID;
        int v36 = 138543618;
        id v37 = sharingUUID;
        __int16 v38 = 2114;
        int64_t v39 = (int64_t)v9;
        _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Asset does not have valid originalFilename, going with preferredFilename: %{public}@", (uint8_t *)&v36, 0x16u);
      }

      objc_storeStrong((id *)&self->_assetOriginalFilenameBase, a5);
      goto LABEL_9;
    }
    BOOL v28 = [(PHAsset *)self->_asset filename];
    uint64_t v29 = [v28 length];

    v30 = PLShareSheetGetLog();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (v29)
    {
      if (v31)
      {
        id v32 = self->_sharingUUID;
        id v33 = [(PHAsset *)self->_asset filename];
        int v36 = 138543618;
        id v37 = v32;
        __int16 v38 = 2114;
        int64_t v39 = (int64_t)v33;
        _os_log_impl(&dword_1AE9F8000, v30, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Asset does not have valid originalFilename, going with library filename: %{public}@", (uint8_t *)&v36, 0x16u);
      }
      uint64_t v13 = [(PHAsset *)self->_asset filename];
    }
    else
    {
      if (v31)
      {
        v34 = self->_sharingUUID;
        v35 = [(PHAsset *)self->_asset uuid];
        int v36 = 138543618;
        id v37 = v34;
        __int16 v38 = 2114;
        int64_t v39 = (int64_t)v35;
        _os_log_impl(&dword_1AE9F8000, v30, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Asset does not have valid originalFilename, going with UUID: %{public}@", (uint8_t *)&v36, 0x16u);
      }
      uint64_t v13 = [(PHAsset *)self->_asset uuid];
    }
  }
  id v14 = *p_assetOriginalFilenameBase;
  id *p_assetOriginalFilenameBase = (id)v13;

LABEL_9:
LABEL_10:
  if ((unint64_t)a3 <= 5
    && (((1 << a3) & 0x2D) == 0
      ? ((char v18 = 0, a3 != 1)
       ? (int64_t v17 = @"Alternate")
       : (int64_t v17 = @"Compatible"))
      : (__CFString *)(int64_t v17 = 0, v18 = 1),
        [*p_assetOriginalFilenameBase stringByAppendingPathExtension:v8],
        (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    __int16 v20 = v19;
    char v21 = [(PUActivityItemSource *)self _outboundResourcesDirectoryURL];
    id v22 = v21;
    if ((v18 & 1) == 0)
    {
      uint64_t v23 = [v21 URLByAppendingPathComponent:v17];

      id v22 = (void *)v23;
    }
    __int16 v24 = [v22 URLByAppendingPathComponent:v20];
  }
  else
  {
    __int16 v20 = PLShareSheetGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v25 = self->_sharingUUID;
      asset = self->_asset;
      int v36 = 138544386;
      id v37 = v25;
      __int16 v38 = 2048;
      int64_t v39 = a3;
      __int16 v40 = 2114;
      id v41 = v8;
      __int16 v42 = 2114;
      id v43 = v9;
      __int16 v44 = 2114;
      v45 = asset;
      _os_log_impl(&dword_1AE9F8000, v20, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Could not generate a valid URL for a PUActivityItemSource resource type %ld, with path extension: %{public}@, preferred filename: %{public}@ for asset: %{public}@", (uint8_t *)&v36, 0x34u);
    }
    __int16 v24 = 0;
  }

  return v24;
}

- (id)_outboundResourcesDirectoryURL
{
  BOOL v3 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  v4 = [v3 privateDirectoryWithSubType:2 createIfNeeded:1 error:0];

  BOOL v5 = [v4 stringByAppendingPathComponent:self->_sharingUUID];
  BOOL v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];

  return v6;
}

- (id)activityViewControllerOperation:(id)a3
{
  id v4 = a3;
  if ([(PUActivityItemSource *)self shouldSkipPreparation])
  {
    if ([(PUActivityItemSource *)self shouldAnchorPreparation])
    {
      BOOL v5 = objc_alloc_init(PUActivityItemSourceAnchorOperation);
      anchorOperation = self->_anchorOperation;
      self->_anchorOperation = v5;

      v7 = self->_anchorOperation;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    id v8 = [v4 activity];
    id v9 = [v8 activityType];
    v7 = [(PUActivityItemSource *)self _newOperationForActivityType:v9];
  }
  return v7;
}

- (id)activityViewControllerApplicationExtensionItem:(id)a3
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id val = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithItem:0 typeIdentifier:0];
  BOOL v5 = [(PUActivityItemSource *)self asset];
  unint64_t v6 = [(PUActivityItemSource *)self sharingPreferences];
  __int16 v42 = v7;
  v47 = [v5 localIdentifier];
  id v8 = [val activity];
  v49 = [v8 activityType];

  v48 = self->_sharingUUID;
  id v9 = objc_opt_class();
  char v10 = [v9 supportsAssetLocalIdentifierForActivityType:v49];
  objc_initWeak(&location, self);
  objc_initWeak(&from, val);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke;
  aBlock[3] = &unk_1E5F226D0;
  void aBlock[4] = self;
  aBlock[5] = v9;
  uint64_t v46 = _Block_copy(aBlock);
  v45 = [(PUActivityItemSource *)self activityViewController:val dataTypeIdentifierForActivityType:v49];
  if (v45)
  {
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_191;
    v84[3] = &unk_1E5F226F8;
    objc_copyWeak(&v88, &location);
    objc_copyWeak(&v89, &from);
    char v90 = v10;
    id v85 = v47;
    id v11 = v49;
    id v86 = v11;
    id v44 = v46;
    id v87 = v44;
    [v4 registerItemForTypeIdentifier:v45 loadHandler:v84];

    objc_destroyWeak(&v89);
    objc_destroyWeak(&v88);
    uint64_t v12 = [v5 playbackStyle];
    int v13 = [v5 isMediaSubtype:8];
    if (v12 == 3) {
      int v14 = v13;
    }
    else {
      int v14 = 0;
    }
    if ((v14 & 1) != 0 || ((v13 ^ 1) & 1) != 0 || (v6 & 0x10000000000) == 0)
    {
      if (v6) {
        int v14 = 0;
      }
      if (v14 != 1) {
        goto LABEL_17;
      }
    }
    else if (v6)
    {
LABEL_17:
      if (([(PUActivityItemSource *)self sharingPreferences] & 1) == 0
        && v11
        && ([v11 isEqualToString:*MEMORY[0x1E4F90A48]] & 1) != 0)
      {
        uint64_t v19 = PLShareSheetGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          sharingUUID = self->_sharingUUID;
          *(_DWORD *)buf = 138543618;
          v95 = sharingUUID;
          __int16 v96 = 2114;
          id v97 = v11;
          _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] NSItemProvider: Registering with item provider as asset bundle for activity: %{public}@.", buf, 0x16u);
        }

        char v21 = [MEMORY[0x1E4F8CBC0] contentType];
        id v22 = [v21 identifier];
        v76[0] = MEMORY[0x1E4F143A8];
        v76[1] = 3221225472;
        v76[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_204;
        v76[3] = &unk_1E5F22798;
        objc_copyWeak(&v80, &location);
        v77 = v48;
        id v78 = v5;
        id v79 = v44;
        [v4 registerItemForTypeIdentifier:v22 loadHandler:v76];

        objc_destroyWeak(&v80);
      }
      v15 = [(PUActivityItemSource *)self _sharingVariants];
      id v43 = [v15 objectForKeyedSubscript:&unk_1F078BA68];
      if (v43)
      {
        uint64_t v23 = [v4 registeredTypeIdentifiers];
        char v24 = [v23 containsObject:v43];

        if ((v24 & 1) == 0)
        {
          id v25 = objc_alloc_init(MEMORY[0x1E4F38F40]);
          [v25 setVariant:1];
          [v25 setShouldStripLocation:(v6 >> 8) & 1];
          [v25 setShouldStripCaption:(v6 >> 16) & 1];
          [v25 setShouldStripAccessibilityDescription:(v6 >> 24) & 1];
          if ((PHAssetExportRequestPassthroughConversionIsSupportedByType() & 1) != 0
            || ([MEMORY[0x1E4F38F38] exportRequestForAsset:v5 variants:v15 error:0],
                uint64_t v26 = objc_claimAutoreleasedReturnValue(),
                buf[0] = 0,
                [v26 preflightExportWithOptions:v25 assetAvailability:0 isProcessingRequired:buf fileURLs:0 info:0], int v27 = buf[0], v26, !v27))
          {
            v70[0] = MEMORY[0x1E4F143A8];
            v70[1] = 3221225472;
            v70[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_213;
            v70[3] = &unk_1E5F227C0;
            objc_copyWeak(&v75, &location);
            id v71 = v5;
            id v72 = v25;
            v73 = v48;
            id v74 = v44;
            [v4 registerItemForTypeIdentifier:v43 loadHandler:v70];

            objc_destroyWeak(&v75);
          }
          else
          {
            BOOL v28 = PLShareSheetGetLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v95 = v48;
              __int16 v96 = 2114;
              id v97 = v43;
              _os_log_impl(&dword_1AE9F8000, v28, OS_LOG_TYPE_ERROR, "[Item: %{public}@] NSItemProvider: Not registering current format as the format %{public}@ could not be maintained after additional metadata processing", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v29 = [v15 objectForKeyedSubscript:&unk_1F078BA50];
      if (v29)
      {
        v30 = [v4 registeredTypeIdentifiers];
        char v31 = [v30 containsObject:v29];

        if ((v31 & 1) == 0)
        {
          v65[0] = MEMORY[0x1E4F143A8];
          v65[1] = 3221225472;
          v65[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_216;
          v65[3] = &unk_1E5F227E8;
          objc_copyWeak(v69, &location);
          v69[1] = (id)v6;
          v69[2] = v42;
          id v66 = v5;
          v67 = v48;
          id v68 = v44;
          [v4 registerItemForTypeIdentifier:v29 loadHandler:v65];

          objc_destroyWeak(v69);
        }
      }
      id v32 = [v15 objectForKeyedSubscript:&unk_1F078BA38];
      if (v11) {
        LODWORD(v11) = !+[PUActivityItemSourceConfiguration shouldExcludeAlternateVariantForActivityType:v11];
      }
      if (v32)
      {
        id v33 = [v4 registeredTypeIdentifiers];
        int v34 = [v33 containsObject:v32];

        if ((v11 & ~v34) != 0)
        {
          v60[0] = MEMORY[0x1E4F143A8];
          v60[1] = 3221225472;
          v60[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_218;
          v60[3] = &unk_1E5F22798;
          objc_copyWeak(&v64, &location);
          id v61 = v5;
          v62 = v48;
          id v63 = v44;
          [v4 registerItemForTypeIdentifier:v32 loadHandler:v60];

          objc_destroyWeak(&v64);
        }
      }
      if ([v5 isVideo])
      {
        v35 = PLShareSheetGetLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          int v36 = self->_sharingUUID;
          *(_DWORD *)buf = 138543362;
          v95 = v36;
          _os_log_impl(&dword_1AE9F8000, v35, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] NSItemProvider: Registering video resource as AVURLAsset", buf, 0xCu);
        }

        uint64_t v37 = objc_opt_class();
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_224;
        v55[3] = &unk_1E5F22838;
        v56 = v48;
        objc_copyWeak(&v59, &location);
        id v57 = v5;
        id v58 = v44;
        [v4 registerObjectOfClass:v37 visibility:0 loadHandler:v55];

        objc_destroyWeak(&v59);
      }
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_227;
      v51[3] = &unk_1E5F22860;
      objc_copyWeak(&v53, &location);
      objc_copyWeak(&v54, &from);
      id v52 = v44;
      [v4 setPreviewImageHandler:v51];
      __int16 v38 = PLShareSheetGetLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v39 = self->_sharingUUID;
        __int16 v40 = [v4 registeredTypeIdentifiers];
        *(_DWORD *)buf = 138543618;
        v95 = v39;
        __int16 v96 = 2114;
        id v97 = v40;
        _os_log_impl(&dword_1AE9F8000, v38, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] NSItemProvider: Registered type identifiers (in order): %{public}@", buf, 0x16u);
      }
      id v17 = v4;

      objc_destroyWeak(&v54);
      objc_destroyWeak(&v53);

      goto LABEL_47;
    }
    char v18 = [(id)*MEMORY[0x1E4F44420] identifier];
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_196;
    v81[3] = &unk_1E5F22748;
    id v82 = v5;
    v83 = v48;
    [v4 registerItemForTypeIdentifier:v18 loadHandler:v81];

    goto LABEL_17;
  }
  v15 = PLShareSheetGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    int v16 = self->_sharingUUID;
    *(_DWORD *)buf = 138543874;
    v95 = v16;
    __int16 v96 = 2114;
    id v97 = v47;
    __int16 v98 = 2112;
    v99 = v49;
    _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_FAULT, "[Item: %{public}@] No type identifier for asset: %{public}@ activity type: \"%@\"", buf, 0x20u);
  }
  id v17 = 0;
LABEL_47:

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v17;
}

id __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 40) _sharingErrorWithCode:-103 underlyingError:0 localizedDescription:@"An instance of UIActivityViewController was not available." additionalInfo:0];
  BOOL v5 = PLShareSheetGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 136);
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    id v11 = v3;
    __int16 v12 = 2112;
    int v13 = v4;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Error %@: %@", (uint8_t *)&v8, 0x20u);
  }

  return v4;
}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_191(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = objc_loadWeakRetained((id *)(a1 + 64));
  BOOL v5 = v4;
  if (WeakRetained && v4)
  {
    if (*(unsigned char *)(a1 + 72))
    {
      (*((void (**)(id, void, void))v8 + 2))(v8, *(void *)(a1 + 32), 0);
      goto LABEL_8;
    }
    uint64_t v6 = [WeakRetained activityViewController:v4 itemForActivityType:*(void *)(a1 + 40)];
    v7 = (void (*)(void))*((void *)v8 + 2);
  }
  else
  {
    uint64_t v6 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    v7 = (void (*)(void))*((void *)v8 + 2);
  }
  v7();

LABEL_8:
}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_196(uint64_t a1, void *a2, objc_class *a3)
{
  id v5 = a2;
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F39148]);
    [v6 setDeliveryMode:1];
    v7 = [MEMORY[0x1E4F390D0] defaultManager];
    uint64_t v8 = *(void *)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_2;
    v12[3] = &unk_1E5F22720;
    id v14 = v5;
    id v13 = *(id *)(a1 + 40);
    objc_msgSend(v7, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v8, 0, v6, v12, *MEMORY[0x1E4F396D8], *(double *)(MEMORY[0x1E4F396D8] + 8));
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    __int16 v10 = NSStringFromClass(a3);
    id v11 = objc_msgSend(v9, "ph_genericErrorWithLocalizedDescription:", @"Unexpected value class (%@)", v10);

    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v11);
  }
}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_204(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      id v6 = [WeakRetained _resourceURLForType:5];
      v7 = PLShareSheetGetLog();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v8)
        {
          uint64_t v9 = *(void *)(a1 + 32);
          __int16 v10 = [MEMORY[0x1E4F8CBC0] contentType];
          *(_DWORD *)buf = 138543874;
          uint64_t v21 = v9;
          __int16 v22 = 2114;
          uint64_t v23 = v6;
          __int16 v24 = 2114;
          id v25 = v10;
          _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] NSItemProvider: Already have asset bundle at %{public}@ for item provider providing %{public}@", buf, 0x20u);
        }
        v3[2](v3, v6, 0);
      }
      else
      {
        if (v8)
        {
          uint64_t v11 = *(void *)(a1 + 32);
          __int16 v12 = [MEMORY[0x1E4F8CBC0] contentType];
          *(_DWORD *)buf = 138543618;
          uint64_t v21 = v11;
          __int16 v22 = 2114;
          uint64_t v23 = v12;
          _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] NSItemProvider: On-demand export required to generate asset bundle for item provider providing %{public}@", buf, 0x16u);
        }
        id v13 = objc_alloc_init(MEMORY[0x1E4F38F40]);
        [v13 setVariant:1];
        [v13 setIncludeAllAssetResources:1];
        [v13 setShouldBundleComplexAssetResources:1];
        uint64_t v14 = *(void *)(a1 + 40);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_206;
        v16[3] = &unk_1E5F22770;
        id v17 = v5;
        id v18 = *(id *)(a1 + 32);
        uint64_t v19 = v3;
        id v15 = (id)[v17 _runOnDemandExportForAsset:v14 withOptions:v13 completionHandler:v16];
      }
    }
    else
    {
      id v6 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      ((void (**)(id, void *, void *))v3)[2](v3, 0, v6);
    }
  }
}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_213(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      id v6 = [WeakRetained _resourceURLForType:0];
      if (v6)
      {
        v3[2](v3, v6, 0);
      }
      else
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = *(void *)(a1 + 40);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_2_214;
        v10[3] = &unk_1E5F22810;
        id v11 = v5;
        id v13 = v3;
        id v12 = *(id *)(a1 + 48);
        id v9 = (id)[v11 _runOnDemandSingleFileExportForAsset:v7 withOptions:v8 completionHandler:v10];
      }
    }
    else
    {
      id v6 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      ((void (**)(id, void *, void *))v3)[2](v3, 0, v6);
    }
  }
}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_216(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      id v6 = [WeakRetained _resourceURLForType:1];
      if (v6)
      {
        v3[2](v3, v6, 0);
      }
      else
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F38F40]);
        [v7 setVariant:2];
        [v7 setShouldStripLocation:*(unsigned __int8 *)(a1 + 65)];
        [v7 setShouldStripCaption:*(unsigned __int8 *)(a1 + 66)];
        [v7 setShouldStripAccessibilityDescription:*(unsigned __int8 *)(a1 + 67)];
        uint64_t v8 = *(void *)(a1 + 32);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_2_217;
        v10[3] = &unk_1E5F22810;
        id v11 = v5;
        id v13 = v3;
        id v12 = *(id *)(a1 + 40);
        id v9 = (id)[v11 _runOnDemandSingleFileExportForAsset:v8 withOptions:v7 completionHandler:v10];
      }
    }
    else
    {
      id v6 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      ((void (**)(id, void *, void *))v3)[2](v3, 0, v6);
    }
  }
}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_218(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      id v6 = [WeakRetained _resourceURLForType:4];
      if (v6)
      {
        v3[2](v3, v6, 0);
      }
      else
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F38F40]);
        [v7 setVariant:3];
        uint64_t v8 = *(void *)(a1 + 32);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_2_219;
        v10[3] = &unk_1E5F22810;
        id v11 = v5;
        id v13 = v3;
        id v12 = *(id *)(a1 + 40);
        id v9 = (id)[v11 _runOnDemandSingleFileExportForAsset:v8 withOptions:v7 completionHandler:v10];
      }
    }
    else
    {
      id v6 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      ((void (**)(id, void *, void *))v3)[2](v3, 0, v6);
    }
  }
}

id __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_224(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PLShareSheetGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v22 = v5;
      _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] NSItemProvider: Providing original video resource as AVURLAsset", buf, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v7 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v8 = [WeakRetained _resourceURLForType:0];
      id v9 = PLShareSheetGetLog();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v10)
        {
          uint64_t v11 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          uint64_t v22 = v11;
          _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] NSItemProvider: Original video resource already exists for AVURLAsset", buf, 0xCu);
        }

        id v12 = [MEMORY[0x1E4F166C8] assetWithURL:v8];
        v3[2](v3, v12, 0);
        id v13 = 0;
      }
      else
      {
        if (v10)
        {
          uint64_t v14 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          uint64_t v22 = v14;
          _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] NSItemProvider: Original video resource doesn't exist for AVURLAsset, exporting...", buf, 0xCu);
        }

        id v12 = objc_alloc_init(MEMORY[0x1E4F38F40]);
        objc_msgSend(v12, "setShouldStripLocation:", ((unint64_t)objc_msgSend(v7, "sharingPreferences") >> 8) & 1);
        objc_msgSend(v12, "setShouldStripCaption:", ((unint64_t)objc_msgSend(v7, "sharingPreferences") >> 16) & 1);
        [v12 setVariant:1];
        uint64_t v15 = *(void *)(a1 + 40);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_225;
        v17[3] = &unk_1E5F22810;
        id v18 = v7;
        id v19 = *(id *)(a1 + 32);
        __int16 v20 = v3;
        id v13 = [v18 _runOnDemandSingleFileExportForAsset:v15 withOptions:v12 completionHandler:v17];
      }
    }
    else
    {
      uint64_t v8 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      ((void (**)(id, id, void *))v3)[2](v3, 0, v8);
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_227(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && v5)
  {
    id v6 = [v5 activity];
    id v7 = [v5 activity];
    [v7 _thumbnailSize];
    double v9 = v8;
    double v11 = v10;

    id v12 = [v6 activityType];
    uint64_t v13 = objc_msgSend(WeakRetained, "activityViewController:thumbnailImageDataForActivityType:suggestedSize:", v5, v12, v9, v11);

    uint64_t v14 = [MEMORY[0x1E4FB1818] imageWithData:v13];
    v4[2](v4, v14, 0);

    id v4 = (void (**)(id, void *, void))v13;
  }
  else
  {
    id v6 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v6);
  }
}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_225(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) _createManagedURLForResourceAtURL:v5 shouldMove:0 forType:0];
    double v8 = PLShareSheetGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v12 = 138543874;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] NSItemProvider: Original video resource exported for AVURLAsset as %{public}@ from URL: %{public}@", (uint8_t *)&v12, 0x20u);
    }

    double v10 = [MEMORY[0x1E4F166C8] assetWithURL:v7];
  }
  else
  {
    id v7 = PLShareSheetGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = 138543618;
      uint64_t v13 = v11;
      __int16 v14 = 2114;
      uint64_t v15 = v6;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "[Item: %{public}@] NSItemProvider: Error providing original video resource as AVURLAsset: %{public}@", (uint8_t *)&v12, 0x16u);
    }
    double v10 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_2_219(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = [*(id *)(a1 + 32) _createManagedURLForResourceAtURL:a2 shouldMove:0 forType:4];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    if (!v5) {
      goto LABEL_4;
    }
    id v6 = PLShareSheetGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "[Item: %{public}@] NSItemProvider: Error from alternate-variant export request %@", (uint8_t *)&v8, 0x16u);
    }
  }

LABEL_4:
}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_2_217(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (v7)
  {
    int v8 = [*(id *)(a1 + 32) _createManagedURLForResourceAtURL:v7 shouldMove:0 forType:1];
  }
  else
  {
    int v8 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (v6)
  {
    uint64_t v9 = PLShareSheetGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "[Item: %{public}@] NSItemProvider: Error from compatible-variant export request %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_2_214(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (v7)
  {
    int v8 = [*(id *)(a1 + 32) _createManagedURLForResourceAtURL:v7 shouldMove:0 forType:0];
  }
  else
  {
    int v8 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (v6)
  {
    uint64_t v9 = PLShareSheetGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "[Item: %{public}@] NSItemProvider: Error from current-variant export request %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_206(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F393A8]];
  if (v7)
  {
    int v8 = [*(id *)(a1 + 32) _createManagedURLForResourceAtURL:v7 shouldMove:0 forType:5];
    uint64_t v9 = PLShareSheetGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = [MEMORY[0x1E4F8CBC0] contentType];
      int v17 = 138543874;
      uint64_t v18 = v10;
      __int16 v19 = 2114;
      id v20 = v8;
      __int16 v21 = 2114;
      uint64_t v22 = (uint64_t)v11;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] NSItemProvider: Created asset bundle at %{public}@ for item provider providing %{public}@", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    int v8 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (v6)
  {
    uint64_t v12 = PLShareSheetGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = [v5 count];
      uint64_t v15 = [v5 allKeys];
      __int16 v16 = [v15 componentsJoinedByString:@", "];
      int v17 = 138544130;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2048;
      uint64_t v22 = v14;
      __int16 v23 = 2114;
      __int16 v24 = v16;
      _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_ERROR, "[Item: %{public}@] NSItemProvider: Error from export request %@. %lu file urls returned: [%{public}@]", (uint8_t *)&v17, 0x2Au);
    }
  }
}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F39698];
  id v6 = a2;
  id v7 = [a3 objectForKeyedSubscript:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  if (v7)
  {
    int v8 = PLShareSheetGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Error fetching live photo %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (id)_runOnDemandSingleFileExportForAsset:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__PUActivityItemSource__runOnDemandSingleFileExportForAsset_withOptions_completionHandler___block_invoke;
  v12[3] = &unk_1E5F226A8;
  id v13 = v8;
  id v9 = v8;
  int v10 = [(PUActivityItemSource *)self _runOnDemandExportForAsset:a3 withOptions:a4 completionHandler:v12];

  return v10;
}

void __91__PUActivityItemSource__runOnDemandSingleFileExportForAsset_withOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *MEMORY[0x1E4F393D8];
  id v6 = a3;
  id v7 = a2;
  id v8 = [v7 objectForKeyedSubscript:v5];
  id v13 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F393E0]];

  id v9 = v8;
  if (!v8) {
    id v9 = v13;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void (**)(uint64_t, id, id))(v10 + 16);
  id v12 = v8;
  v11(v10, v9, v6);
}

- (id)_runOnDemandExportForAsset:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v19 = 0;
    uint64_t v11 = [MEMORY[0x1E4F38F38] exportRequestForAsset:v8 error:&v19];
    id v12 = v19;
    if (v11)
    {
      [(NSMutableSet *)self->_onDemandExports addObject:v11];
      objc_initWeak(&location, v11);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __81__PUActivityItemSource__runOnDemandExportForAsset_withOptions_completionHandler___block_invoke;
      v15[3] = &unk_1E5F22680;
      v15[4] = self;
      objc_copyWeak(&v17, &location);
      id v16 = v10;
      [v11 exportWithOptions:v9 completionHandler:v15];
      id v13 = [v11 progress];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, void, id))v10 + 2))(v10, 0, v12);
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void __81__PUActivityItemSource__runOnDemandExportForAsset_withOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *(void **)(*(void *)(a1 + 32) + 120);
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v6 removeObject:WeakRetained];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v5)
  {
    id v9 = PLShareSheetGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 136);
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Error on-demand export %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (id)activityViewController:(id)a3 thumbnailImageDataForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  PLPhysicalScreenScale();
  double v12 = v11;
  id v13 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v13 setVersion:self->_sharingPreferences.shareAsUnmodifiedOriginal];
  [v13 setSynchronous:1];
  [v13 setDeliveryMode:1];
  [v13 setResizeMode:2];
  id v14 = PLShareSheetGetLog();
  double v15 = width * v12;
  double v16 = height * v12;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    sharingUUID = self->_sharingUUID;
    v31.double width = width;
    v31.double height = height;
    uint64_t v18 = NSStringFromCGSize(v31);
    v32.double width = v15;
    v32.double height = v16;
    NSStringFromCGSize(v32);
    id v19 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    asset = self->_asset;
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = sharingUUID;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2114;
    int v27 = v19;
    LOWORD(v28) = 2114;
    *(void *)((char *)&v28 + 2) = asset;
    _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Fetching thumbnail image data of suggested size %{public}@ (scaled for screen: %{public}@) for asset: %{public}@", buf, 0x2Au);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  int v27 = __Block_byref_object_copy__3047;
  *(void *)&long long v28 = __Block_byref_object_dispose__3048;
  *((void *)&v28 + 1) = 0;
  __int16 v21 = [MEMORY[0x1E4F390D0] defaultManager];
  uint64_t v22 = self->_asset;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __95__PUActivityItemSource_activityViewController_thumbnailImageDataForActivityType_suggestedSize___block_invoke;
  v25[3] = &unk_1E5F2DB70;
  v25[4] = self;
  v25[5] = buf;
  objc_msgSend(v21, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v22, 1, v13, v25, v15, v16);
  id v23 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v23;
}

void __95__PUActivityItemSource_activityViewController_thumbnailImageDataForActivityType_suggestedSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!v5)
  {
    id v9 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
    double v11 = PLShareSheetGetLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 136);
    int v18 = 138543618;
    uint64_t v19 = v17;
    __int16 v20 = 2112;
    __int16 v21 = v9;
    id v13 = "[Item: %{public}@] Error fetching thumbnail image data: %@";
    id v14 = v11;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    uint32_t v16 = 22;
LABEL_6:
    _os_log_impl(&dword_1AE9F8000, v14, v15, v13, (uint8_t *)&v18, v16);
    goto LABEL_7;
  }
  uint64_t v6 = _UIImageJPEGRepresentation();
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = PLShareSheetGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 136);
    [v5 size];
    double v11 = NSStringFromCGSize(v25);
    uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) length];
    int v18 = 138543874;
    uint64_t v19 = v10;
    __int16 v20 = 2114;
    __int16 v21 = v11;
    __int16 v22 = 2050;
    uint64_t v23 = v12;
    id v13 = "[Item: %{public}@] Fetched thumbnail image of size %{public}@. (JPEG file size: %{public}lu bytes)";
    id v14 = v9;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    uint32_t v16 = 32;
    goto LABEL_6;
  }
LABEL_8:
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [a3 activity];
    id v8 = [v9 activityType];
  }
  uint64_t v10 = [(PUActivityItemSource *)self _uniformTypeIdentifierForActivityType:v8];

  return v10;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return [(PUActivityItemSource *)self _itemForActivityType:a4];
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "data", a3);
}

- (void)assetExportRequest:(id)a3 didChangeToState:(unint64_t)a4 fromState:(unint64_t)a5
{
  if (a4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __70__PUActivityItemSource_assetExportRequest_didChangeToState_fromState___block_invoke;
    v5[3] = &__block_descriptor_40_e39_v16__0___PUMutableActivityItemSource__8l;
    v5[4] = a4;
    -[PUActivityItemSource performChanges:](self, "performChanges:", v5, a4, a5);
  }
}

uint64_t __70__PUActivityItemSource_assetExportRequest_didChangeToState_fromState___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32) == 3) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = 2;
  }
  return [a2 setState:v2];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &PUActivityItemSourceProgressContext)
  {
    px_dispatch_on_main_queue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PUActivityItemSource;
    -[PUActivityItemSource observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

void __71__PUActivityItemSource_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _exportProgress];
  id v3 = v2;
  if (v2)
  {
    [v2 fractionCompleted];
    if (v4 < 1.0)
    {
      char v7 = 0;
      id v5 = [*(id *)(a1 + 32) _exportProgressHandler];

      if (v5)
      {
        objc_super v6 = [*(id *)(a1 + 32) _exportProgressHandler];
        [v3 fractionCompleted];
        ((void (**)(void, char *))v6)[2](v6, &v7);

        if (v7) {
          [v3 cancel];
        }
      }
    }
  }
}

- (void)_stopObservingExportRequest
{
  id v3 = [(PUActivityItemSource *)self _assetExportRequest];
  [v3 setDelegate:0];
  [(PUActivityItemSource *)self _setAssetExportRequest:0];
  [(PUActivityItemSource *)self _setExportProgress:0];
  [(PUActivityItemSource *)self _setExportProgressHandler:0];
}

- (void)_beginObservingExportRequest:(id)a3 withProgressHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 progress];
  [(PUActivityItemSource *)self _setAssetExportRequest:v7];
  [(PUActivityItemSource *)self _setExportProgressHandler:v6];

  [(PUActivityItemSource *)self _setExportProgress:v8];
  [v7 setDelegate:self];
}

- (id)_itemForActivityType:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PUActivityItemSource *)self exportConfiguration];
  uint64_t v6 = [v5 outputType];
  switch(v6)
  {
    case 3:
      uint64_t v7 = [(PUActivityItemSource *)self asset];
      goto LABEL_7;
    case 2:
      uint64_t v7 = [(PUActivityItemSource *)self _assetsLibraryURL];
      goto LABEL_7;
    case 1:
      uint64_t v7 = [(PUActivityItemSource *)self _pasteboardItemProvider];
LABEL_7:
      id v8 = (void *)v7;
      goto LABEL_30;
  }
  uint64_t v9 = [v5 assetExportKind];
  uint64_t v10 = v9;
  if (v9 != 3)
  {
    if (v9 != 4)
    {
      id v8 = 0;
      goto LABEL_13;
    }
    uint64_t v10 = 5;
  }
  id v8 = [(PUActivityItemSource *)self _resourceURLForType:v10];
LABEL_13:
  double v11 = [v5 assetExportRequestOptions];
  if ([v11 shouldExportUnmodifiedOriginalResources])
  {
    if ([v4 isEqualToString:*MEMORY[0x1E4F909F8]])
    {
      uint64_t v12 = [(PUActivityItemSource *)self asset];
      int v13 = [v12 canPlayPhotoIris];

      if (v13)
      {
        id v14 = [(PUActivityItemSource *)self _resourceURLForType:0];
        uint64_t v15 = [(PUActivityItemSource *)self _resourceURLForType:2];
        uint32_t v16 = (void *)v15;
        if (v14 && v15)
        {
          v21[0] = v14;
          v21[1] = v15;
          uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];

          id v8 = (void *)v17;
        }
      }
    }
  }
  uint64_t v18 = [v11 variant];
  if (v8 || v18 != 3)
  {
    if (v8 || v18 != 2) {
      goto LABEL_27;
    }
    uint64_t v19 = 1;
  }
  else
  {
    uint64_t v19 = 4;
  }
  id v8 = [(PUActivityItemSource *)self _resourceURLForType:v19];
LABEL_27:
  if (!v8)
  {
    id v8 = [(PUActivityItemSource *)self _resourceURLForType:0];
  }

LABEL_30:
  return v8;
}

- (void)_fetchAlternateWithOptions:(id)a3 forActivityType:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(id)objc_opt_class() activityItemSourceLog];
  os_signpost_id_t v15 = [(PUActivityItemSource *)self signpostId];
  uint32_t v16 = v14;
  uint64_t v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "FetchItemAlternate", " enableTelemetry=YES ", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__PUActivityItemSource__fetchAlternateWithOptions_forActivityType_progressHandler_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5F22638;
  id v23 = v10;
  os_signpost_id_t v24 = v15;
  __int16 v22 = v17;
  id v18 = v10;
  uint64_t v19 = v17;
  __int16 v20 = _Block_copy(aBlock);
  [(PUActivityItemSource *)self _runExportRequestWithOptions:v13 forActivityType:v12 progressHandler:v11 completionHandler:v20];
}

void __101__PUActivityItemSource__fetchAlternateWithOptions_forActivityType_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(id *)(a1 + 32);
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)id v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v10, OS_SIGNPOST_INTERVAL_END, v11, "FetchItemAlternate", " enableTelemetry=YES ", v13, 2u);
  }

  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, id, id, uint64_t))(v12 + 16))(v12, v7, v8, a4);
  }
}

- (void)_fetchLivePhotoWithOptions:(id)a3 forActivityType:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(id)objc_opt_class() activityItemSourceLog];
  os_signpost_id_t v15 = [(PUActivityItemSource *)self signpostId];
  uint32_t v16 = v14;
  uint64_t v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "FetchItemLivePhoto", " enableTelemetry=YES ", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__PUActivityItemSource__fetchLivePhotoWithOptions_forActivityType_progressHandler_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5F22638;
  id v23 = v10;
  os_signpost_id_t v24 = v15;
  __int16 v22 = v17;
  id v18 = v10;
  uint64_t v19 = v17;
  __int16 v20 = _Block_copy(aBlock);
  [(PUActivityItemSource *)self _runExportRequestWithOptions:v13 forActivityType:v12 progressHandler:v11 completionHandler:v20];
}

void __101__PUActivityItemSource__fetchLivePhotoWithOptions_forActivityType_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(id *)(a1 + 32);
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)id v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v10, OS_SIGNPOST_INTERVAL_END, v11, "FetchItemLivePhoto", " enableTelemetry=YES ", v13, 2u);
  }

  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, id, id, uint64_t))(v12 + 16))(v12, v7, v8, a4);
  }
}

- (void)_fetchVideoWithOptions:(id)a3 forActivityType:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(id)objc_opt_class() activityItemSourceLog];
  os_signpost_id_t v15 = [(PUActivityItemSource *)self signpostId];
  uint32_t v16 = v14;
  uint64_t v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "FetchItemVideo", " enableTelemetry=YES ", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__PUActivityItemSource__fetchVideoWithOptions_forActivityType_progressHandler_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5F22638;
  id v23 = v10;
  os_signpost_id_t v24 = v15;
  __int16 v22 = v17;
  id v18 = v10;
  uint64_t v19 = v17;
  __int16 v20 = _Block_copy(aBlock);
  [(PUActivityItemSource *)self _runExportRequestWithOptions:v13 forActivityType:v12 progressHandler:v11 completionHandler:v20];
}

void __97__PUActivityItemSource__fetchVideoWithOptions_forActivityType_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(id *)(a1 + 32);
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)id v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v10, OS_SIGNPOST_INTERVAL_END, v11, "FetchItemVideo", " enableTelemetry=YES ", v13, 2u);
  }

  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, id, id, uint64_t))(v12 + 16))(v12, v7, v8, a4);
  }
}

- (void)_fetchImageWithOptions:(id)a3 forActivityType:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(id)objc_opt_class() activityItemSourceLog];
  os_signpost_id_t v15 = [(PUActivityItemSource *)self signpostId];
  uint32_t v16 = v14;
  uint64_t v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "FetchItemImage", " enableTelemetry=YES ", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__PUActivityItemSource__fetchImageWithOptions_forActivityType_progressHandler_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5F22638;
  id v23 = v10;
  os_signpost_id_t v24 = v15;
  __int16 v22 = v17;
  id v18 = v10;
  uint64_t v19 = v17;
  __int16 v20 = _Block_copy(aBlock);
  [(PUActivityItemSource *)self _runExportRequestWithOptions:v13 forActivityType:v12 progressHandler:v11 completionHandler:v20];
}

void __97__PUActivityItemSource__fetchImageWithOptions_forActivityType_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(id *)(a1 + 32);
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)id v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v10, OS_SIGNPOST_INTERVAL_END, v11, "FetchItemImage", " enableTelemetry=YES ", v13, 2u);
  }

  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, id, id, uint64_t))(v12 + 16))(v12, v7, v8, a4);
  }
}

- (void)_runExportRequestWithOptions:(id)a3 forActivityType:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  asset = self->_asset;
  cachedSharingVariants = self->_cachedSharingVariants;
  id v30 = 0;
  uint32_t v16 = [MEMORY[0x1E4F38F38] exportRequestForAsset:asset variants:cachedSharingVariants error:&v30];
  id v17 = v30;
  if (v16)
  {
    objc_msgSend(v16, "setShouldSendTimingIntervalsToAnalytics:", -[PUActivityItemSource shouldSendAnalyticsInterval](self, "shouldSendAnalyticsInterval"));
    [v16 setAnalyticsActivityType:v11];
    id v18 = [v16 variants];
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "variant"));
    __int16 v20 = [v18 objectForKeyedSubscript:v19];
    BOOL v21 = v20 == 0;

    if (v21)
    {
      __int16 v22 = PLShareSheetGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        sharingUUID = self->_sharingUUID;
        *(_DWORD *)buf = 138543362;
        CGSize v32 = sharingUUID;
        _os_log_impl(&dword_1AE9F8000, v22, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Requested variant unavailable for sharing, using current", buf, 0xCu);
      }

      [v10 setVariant:1];
    }
    os_signpost_id_t v24 = (void *)[v10 variant];
    [(PUActivityItemSource *)self _beginObservingExportRequest:v16 withProgressHandler:v12];
    objc_initWeak((id *)buf, self);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __103__PUActivityItemSource__runExportRequestWithOptions_forActivityType_progressHandler_completionHandler___block_invoke;
    v27[3] = &unk_1E5F22610;
    objc_copyWeak(v29, (id *)buf);
    v27[4] = self;
    id v28 = v13;
    v29[1] = v24;
    [v16 exportWithOptions:v10 completionHandler:v27];

    objc_destroyWeak(v29);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    CGSize v25 = PLShareSheetGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = self->_sharingUUID;
      *(_DWORD *)buf = 138543618;
      CGSize v32 = v26;
      __int16 v33 = 2112;
      id v34 = v17;
      _os_log_impl(&dword_1AE9F8000, v25, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Failed to create PHAssetExportRequest: %@", buf, 0x16u);
    }

    (*((void (**)(id, void, id, void))v13 + 2))(v13, 0, v17, 0);
  }
}

void __103__PUActivityItemSource__runExportRequestWithOptions_forActivityType_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _stopObservingExportRequest];

  if (v6)
  {
    id v8 = [v6 domain];
    if (![v8 isEqualToString:*MEMORY[0x1E4F393B0]])
    {
LABEL_6:

      goto LABEL_7;
    }
    uint64_t v9 = [v6 code];

    if (v9 == 1)
    {
      id v8 = PLShareSheetGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 136);
        int v11 = 138543362;
        uint64_t v12 = v10;
        _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] User cancelled during asset export.", (uint8_t *)&v11, 0xCu);
      }
      goto LABEL_6;
    }
  }
LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)activityItemSourceOperation:(id)a3 prepareItemForActivityType:(id)a4
{
  uint64_t v238 = *MEMORY[0x1E4F143B8];
  id v161 = a3;
  v170 = (__CFString *)a4;
  [(PUActivityItemSource *)self setLastPreparationError:0];
  id v6 = [(id)objc_opt_class() activityItemSourceLog];
  os_signpost_id_t v7 = [(PUActivityItemSource *)self signpostId];
  id v8 = v6;
  uint64_t v9 = v8;
  os_signpost_id_t spid = v7;
  unint64_t v144 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PrepareItem", " enableTelemetry=YES ", buf, 2u);
  }
  v169 = v9;

  v159 = [(PHAsset *)self->_asset uuid];
  [(PHAsset *)self->_asset fetchPropertySetsIfNeeded];
  uint64_t v10 = [(PHAsset *)self->_asset originalMetadataProperties];
  v163 = [v10 originalFilename];

  v158 = objc_msgSend(MEMORY[0x1E4F38EB8], "descriptionForMediaType:", -[PHAsset mediaType](self->_asset, "mediaType"));
  v157 = objc_msgSend(MEMORY[0x1E4F38EB8], "descriptionForMediaSubtypes:", -[PHAsset mediaSubtypes](self->_asset, "mediaSubtypes"));
  objc_msgSend(MEMORY[0x1E4F38EB8], "descriptionForPlaybackStyle:", -[PHAsset playbackStyle](self->_asset, "playbackStyle"));
  v156 = (__CFString *)objc_claimAutoreleasedReturnValue();
  int v11 = PLShareSheetGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    sharingUUID = self->_sharingUUID;
    uint64_t v13 = [(__CFString *)v163 length];
    id v14 = @"<Missing>";
    *(_DWORD *)buf = 138544898;
    if (v13) {
      id v14 = v163;
    }
    v213 = sharingUUID;
    __int16 v214 = 2114;
    unint64_t v215 = (unint64_t)v159;
    __int16 v216 = 2114;
    unint64_t v217 = (unint64_t)v158;
    __int16 v218 = 2114;
    v219 = v157;
    __int16 v220 = 2114;
    v221 = v156;
    __int16 v222 = 2114;
    v223 = v14;
    __int16 v224 = 2114;
    v225 = v170;
    _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Preparing asset %{public}@ (Type: %{public}@, Subtypes: %{public}@, Playback style: %{public}@, Primary Filename: %{public}@) for sharing to activity type: %{public}@", buf, 0x48u);
  }

  uint64_t v15 = [(PUActivityItemSource *)self sharingPreferences];
  uint64_t v149 = v16;
  uint64_t v150 = v15;
  v160 = [(PUActivityItemSource *)self _sharingVariants];
  v172 = -[PUActivityItemSourceConfiguration initWithAsset:availableSharingVariants:activityType:preferences:]([PUActivityItemSourceConfiguration alloc], "initWithAsset:availableSharingVariants:activityType:preferences:", self->_asset, v160, v170, v150, v149);
  v171 = [(PUActivityItemSourceConfiguration *)v172 assetExportRequestOptions];
  [v171 setShouldBundleComplexAssetResources:1];
  id v17 = [(id)objc_opt_class() _exportResultHandlingQueue];
  [v171 setResultHandlerQueue:v17];

  id v18 = [(PUActivityItemSource *)self exportConfiguration];
  v168 = [v18 activityType];

  if (v168 && ([v168 isEqualToString:v170] & 1) == 0)
  {
    uint64_t v19 = PLShareSheetGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = self->_sharingUUID;
      *(_DWORD *)buf = 138543874;
      v213 = v20;
      __int16 v214 = 2114;
      unint64_t v215 = (unint64_t)v170;
      __int16 v216 = 2114;
      unint64_t v217 = (unint64_t)v168;
      _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Re-using activity item source for activity type: %{public}@ (Previously: %{public}@)", buf, 0x20u);
    }
  }
  BOOL v21 = [(PUActivityItemSource *)self exportConfiguration];
  if (v21)
  {
    __int16 v22 = [(PUActivityItemSource *)self exportConfiguration];
    char v23 = [v22 isEqual:v172];

    if ((v23 & 1) == 0)
    {
      os_signpost_id_t v24 = PLShareSheetGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        CGSize v25 = self->_sharingUUID;
        *(_DWORD *)buf = 138543874;
        v213 = v25;
        __int16 v214 = 2114;
        unint64_t v215 = (unint64_t)v170;
        __int16 v216 = 2114;
        unint64_t v217 = (unint64_t)v168;
        _os_log_impl(&dword_1AE9F8000, v24, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Export configuration (for activity %{public}@) does not match previous export configuration (for activity %{public}@). Deleting already-exported files.", buf, 0x20u);
      }

      [(PUActivityItemSource *)self cleanUpExportedFilesImmediately:1];
    }
  }
  [(PUActivityItemSource *)self setExportConfiguration:v172];
  BOOL v26 = [(PUActivityItemSourceConfiguration *)v172 requiresAssetExport];
  uint64_t v27 = [v171 variant];
  uint64_t v28 = [v171 variant];
  uint64_t v29 = v28;
  uint64_t v206 = 0;
  v207 = &v206;
  if (v27 == 3) {
    uint64_t v30 = 4;
  }
  else {
    uint64_t v30 = v28 == 2;
  }
  uint64_t v208 = 0x2020000000;
  uint64_t v209 = v30;
  uint64_t v137 = v30;
  if (v26)
  {
    CGSize v31 = -[PUActivityItemSource _resourceURLForType:](self, "_resourceURLForType:");
    if (v31)
    {
      CGSize v32 = [MEMORY[0x1E4F28CB8] defaultManager];
      __int16 v33 = [v31 path];
      int v143 = [v32 fileExistsAtPath:v33];
    }
    else
    {
      int v143 = 0;
    }
  }
  else
  {
    int v143 = 1;
  }
  uint64_t v34 = [(PUActivityItemSourceConfiguration *)v172 assetExportKind];
  BOOL v35 = 0;
  uint64_t v202 = 0;
  v203 = &v202;
  uint64_t v204 = 0x2020000000;
  BOOL v205 = 0;
  BOOL v140 = v34 == 3;
  if (v34 == 3)
  {
    int v36 = [(PUActivityItemSource *)self _resourceURLForType:3];
    BOOL v35 = v36 == 0;

    uint64_t v34 = 3;
  }
  BOOL v37 = 0;
  BOOL v205 = v35;
  uint64_t v198 = 0;
  v199 = &v198;
  uint64_t v200 = 0x2020000000;
  BOOL v201 = 0;
  uint64_t v148 = v34;
  BOOL v139 = v34 == 4;
  if (v34 == 4)
  {
    __int16 v38 = [(PUActivityItemSource *)self _resourceURLForType:5];
    BOOL v37 = v38 == 0;
  }
  BOOL v201 = v37;
  uint64_t v39 = [(PUActivityItemSourceConfiguration *)v172 outputType];
  if (v39 == 2)
  {
    __int16 v40 = [(PUActivityItemSource *)self _assetsLibraryURL];
    BOOL v166 = v40 == 0;

    BOOL v141 = v166;
  }
  else
  {
    BOOL v141 = 0;
    BOOL v166 = 1;
  }
  char v138 = [v171 shouldExportUnmodifiedOriginalResources];
  uint64_t v192 = 0;
  v193 = (id *)&v192;
  uint64_t v194 = 0x3032000000;
  v195 = __Block_byref_object_copy__3047;
  v196 = __Block_byref_object_dispose__3048;
  id v197 = 0;
  v155 = +[PUActivityItemSourceConfiguration descriptionForOutputType:[(PUActivityItemSourceConfiguration *)v172 outputType]];
  v154 = +[PUActivityItemSourceConfiguration descriptionForAssetExportKind:[(PUActivityItemSourceConfiguration *)v172 assetExportKind]];
  if (v29 == 2) {
    id v41 = @"Compatible (HEIC/HEVC to JPG/MOV)";
  }
  else {
    id v41 = @"Primary (original format)";
  }
  if (v26)
  {
    __int16 v42 = @"NO";
    if (v143) {
      __int16 v42 = @"YES";
    }
    id v43 = v42;

    v153 = v43;
  }
  else
  {
    v153 = @"n/a";
  }
  id v44 = PLShareSheetGetLog();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    v146 = self->_sharingUUID;
    if (v26) {
      v45 = @"YES";
    }
    else {
      v45 = @"NO";
    }
    uint64_t v46 = v45;

    v151 = v46;
    v47 = @"Alternate (for auto-loops to GIF)";
    if (v27 != 3) {
      v47 = v41;
    }
    v136 = v47;
    if (v148 == 3) {
      v48 = @"YES";
    }
    else {
      v48 = @"NO";
    }
    v49 = v48;

    v164 = v49;
    v50 = @"NO";
    if (v148 == 3)
    {
      if (*((unsigned char *)v203 + 24)) {
        v50 = @"NO";
      }
      else {
        v50 = @"YES";
      }
    }
    v51 = v50;

    id v52 = v51;
    if (v148 == 4) {
      id v53 = @"YES";
    }
    else {
      id v53 = @"NO";
    }
    id v54 = v53;

    v55 = v54;
    v56 = @"NO";
    if (v148 == 4)
    {
      if (*((unsigned char *)v199 + 24)) {
        v56 = @"NO";
      }
      else {
        v56 = @"YES";
      }
    }
    BOOL v57 = v39 == 2;
    id v58 = v56;

    id v59 = v58;
    if (v57) {
      v60 = @"YES";
    }
    else {
      v60 = @"NO";
    }
    id v61 = v60;

    v62 = v61;
    if (v166) {
      id v63 = @"NO";
    }
    else {
      id v63 = @"YES";
    }
    id v64 = v63;

    v65 = v64;
    if ([v171 flattenSlomoVideos]) {
      id v66 = @"YES";
    }
    else {
      id v66 = @"NO";
    }
    v67 = v66;

    id v68 = v67;
    *(_DWORD *)buf = 138546434;
    v213 = v146;
    __int16 v214 = 2112;
    unint64_t v215 = (unint64_t)v155;
    __int16 v216 = 2112;
    unint64_t v217 = (unint64_t)v151;
    __int16 v218 = 2112;
    v219 = v154;
    __int16 v220 = 2112;
    v221 = v136;
    __int16 v222 = 2112;
    v223 = v153;
    __int16 v224 = 2112;
    v225 = v164;
    __int16 v226 = 2112;
    v227 = v52;
    __int16 v228 = 2112;
    v229 = v55;
    __int16 v230 = 2112;
    v231 = v59;
    __int16 v232 = 2112;
    v233 = v62;
    __int16 v234 = 2112;
    v235 = v65;
    __int16 v236 = 2112;
    v237 = v68;
    _os_log_impl(&dword_1AE9F8000, v44, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Preparation pre-flight - Output type: %@ (requires asset export: %@), as kind: %@, in format: %@ (file already exported: %@) - should create Live Photo bundle: %@ (already created: %@) - should create asset bundle: %@ (already created: %@) should set AssetsLibrary URL: %@ (already set: %@) - will flatten slo-mo video: %@", buf, 0x84u);
  }
  v147 = [v161 semaphore];
  v69 = [(PUActivityItemSource *)self progressHandler];
  v167 = [(PUActivityItemSource *)self completionHandler];
  v165 = [(PUActivityItemSource *)self postCompletionHandler];
  v152 = [MEMORY[0x1E4F906A0] sharedInstance];
  char v70 = [v152 allowFallbacksWhilePreparing];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PUActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke;
  aBlock[3] = &unk_1E5F225A0;
  void aBlock[4] = self;
  v190 = &v192;
  SEL v191 = a2;
  id v71 = v161;
  id v188 = v71;
  id v162 = v69;
  id v189 = v162;
  id v72 = (void (**)(void *, void, double))_Block_copy(aBlock);
  uint64_t v73 = [(PUActivityItemSourceConfiguration *)v172 maxFileSizeLimit];
  if (!v193[5])
  {
    unint64_t v74 = v73;
    if ((objc_msgSend(v71, "pu_isCancelled") & 1) == 0)
    {
      char v75 = [v71 isCancelled];
      char v76 = v74 ? v75 : 1;
      if ((v76 & 1) == 0)
      {
        [(PHAsset *)self->_asset fetchPropertySetsIfNeeded];
        v77 = [(PHAsset *)self->_asset originalMetadataProperties];
        unint64_t v78 = [v77 originalFilesize];

        int v79 = [v152 simulateMaxFilesizeLimitForGIFsInSharedAlbumsError];
        int v80 = v78 > v74 ? 1 : v79;
        if (v80 == 1)
        {
          v81 = PLShareSheetGetLog();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            id v82 = self->_sharingUUID;
            *(_DWORD *)buf = 138543874;
            v213 = v82;
            __int16 v214 = 2048;
            unint64_t v215 = v78;
            __int16 v216 = 2048;
            unint64_t v217 = v74;
            _os_log_impl(&dword_1AE9F8000, v81, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Attempted to share an asset that exceeds the filesize limit, %lu > %lu", buf, 0x20u);
          }

          v83 = objc_opt_class();
          uint64_t v210 = *MEMORY[0x1E4F90918];
          v84 = [NSNumber numberWithUnsignedLongLong:v74];
          v211 = v84;
          id v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v211 forKeys:&v210 count:1];
          id v86 = [v83 _sharingErrorWithCode:-102 underlyingError:0 localizedDescription:@"Asset exceeds file size limit for sharing" additionalInfo:v85];

          objc_storeStrong(v193 + 5, v86);
        }
      }
    }
  }
  if (v193[5]
    || (objc_msgSend(v71, "pu_isCancelled") & 1) != 0
    || (([v71 isCancelled] | v143) & 1) != 0)
  {
    if (!v193[5] && (objc_msgSend(v71, "pu_isCancelled") & 1) == 0 && (objc_msgSend(v71, "isCancelled") & 1) == 0) {
      [(PUActivityItemSource *)self performChanges:&__block_literal_global_166];
    }
  }
  else
  {
    v173[0] = MEMORY[0x1E4F143A8];
    v173[1] = 3221225472;
    v173[2] = __79__PUActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_137;
    v173[3] = &unk_1E5F225C8;
    v178 = &v192;
    id v174 = v71;
    id v175 = v152;
    v176 = self;
    v179 = &v206;
    v180 = &v198;
    BOOL v184 = v140;
    BOOL v185 = v139;
    char v186 = v138;
    v181 = &v202;
    uint64_t v182 = v150;
    uint64_t v183 = v149;
    id v87 = v147;
    v177 = v87;
    id v88 = _Block_copy(v173);
    switch(v148)
    {
      case 2:
        v91 = PLShareSheetGetLog();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          v92 = self->_sharingUUID;
          *(_DWORD *)buf = 138543618;
          v213 = v92;
          __int16 v214 = 2112;
          unint64_t v215 = (unint64_t)v170;
          _os_log_impl(&dword_1AE9F8000, v91, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Fetching video for activity type: %@", buf, 0x16u);
        }

        [(PUActivityItemSource *)self _fetchVideoWithOptions:v171 forActivityType:v170 progressHandler:v72 completionHandler:v88];
        break;
      case 5:
        id v89 = PLShareSheetGetLog();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          char v90 = self->_sharingUUID;
          *(_DWORD *)buf = 138543618;
          v213 = v90;
          __int16 v214 = 2112;
          unint64_t v215 = (unint64_t)v170;
          _os_log_impl(&dword_1AE9F8000, v89, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Fetching auto-looping image as GIF for activity type: %@", buf, 0x16u);
        }

        [(PUActivityItemSource *)self _fetchAlternateWithOptions:v171 forActivityType:v170 progressHandler:v72 completionHandler:v88];
        break;
      case 3:
        v93 = PLShareSheetGetLog();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          v94 = self->_sharingUUID;
          *(_DWORD *)buf = 138543618;
          v213 = v94;
          __int16 v214 = 2112;
          unint64_t v215 = (unint64_t)v170;
          _os_log_impl(&dword_1AE9F8000, v93, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Fetching live photo bundle for activity type: %@", buf, 0x16u);
        }

        [(PUActivityItemSource *)self _fetchLivePhotoWithOptions:v171 forActivityType:v170 progressHandler:v72 completionHandler:v88];
        break;
      default:
        v95 = PLShareSheetGetLog();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v96 = self->_sharingUUID;
          *(_DWORD *)buf = 138543618;
          v213 = v96;
          __int16 v214 = 2112;
          unint64_t v215 = (unint64_t)v170;
          _os_log_impl(&dword_1AE9F8000, v95, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Fetching image for activity type: %@", buf, 0x16u);
        }

        [(PUActivityItemSource *)self _fetchImageWithOptions:v171 forActivityType:v170 progressHandler:v72 completionHandler:v88];
        break;
    }
    dispatch_semaphore_wait(v87, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (!v193[5]
    && (objc_msgSend(v71, "pu_isCancelled") & 1) == 0
    && (([v71 isCancelled] | !v141) & 1) == 0)
  {
    id v97 = [(PHAsset *)self->_asset ALAssetURL];
    if (v97)
    {
      __int16 v98 = PLShareSheetGetLog();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
      {
        v99 = self->_sharingUUID;
        *(_DWORD *)buf = 138543362;
        v213 = v99;
        _os_log_impl(&dword_1AE9F8000, v98, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Setting assets library URL for sharing.", buf, 0xCu);
      }

      [(PUActivityItemSource *)self _setAssetsLibraryURL:v97];
    }
    else
    {
      if (v70)
      {
        uint64_t v100 = PLShareSheetGetLog();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        {
          v101 = self->_sharingUUID;
          *(_DWORD *)buf = 138543362;
          v213 = v101;
          _os_log_impl(&dword_1AE9F8000, v100, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Failed to get assets library URL for sharing. Falling back to unmodified.", buf, 0xCu);
        }
      }
      else
      {
        v102 = PLShareSheetGetLog();
        if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
        {
          v103 = self->_sharingUUID;
          *(_DWORD *)buf = 138543362;
          v213 = v103;
          _os_log_impl(&dword_1AE9F8000, v102, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Failed to get assets library URL for sharing.", buf, 0xCu);
        }

        uint64_t v104 = [(id)objc_opt_class() _sharingErrorWithCode:-106 underlyingError:0 localizedDescription:@"Failed to get assets library URL for sharing." additionalInfo:0];
        uint64_t v100 = v193[5];
        v193[5] = (id)v104;
      }
    }
  }
  if (!v193[5]
    && (objc_msgSend(v71, "pu_isCancelled") & 1) == 0
    && ([v71 isCancelled] & 1) == 0
    && [(PUActivityItemSourceConfiguration *)v172 outputType] == 1)
  {
    v105 = PLShareSheetGetLog();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
      v106 = self->_sharingUUID;
      *(_DWORD *)buf = 138543362;
      v213 = v106;
      _os_log_impl(&dword_1AE9F8000, v105, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Setting Pasteboard representation.", buf, 0xCu);
    }

    uint64_t v107 = v137;
    if (v207[3] != v137)
    {
      v108 = PLShareSheetGetLog();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
      {
        v109 = self->_sharingUUID;
        unint64_t v110 = v207[3];
        *(_DWORD *)buf = 138543874;
        v213 = v109;
        __int16 v214 = 2050;
        unint64_t v215 = v137;
        __int16 v216 = 2050;
        unint64_t v217 = v110;
        _os_log_impl(&dword_1AE9F8000, v108, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Requested source type %{public}zd is different from actual source type %{public}zd", buf, 0x20u);
      }

      uint64_t v107 = v207[3];
    }
    v111 = [(PUActivityItemSource *)self _resourceURLForType:v107];
    id v112 = [(PUActivityItemSource *)self _newPasteboardItemProviderForURL:v111];
    [(PUActivityItemSource *)self set_pasteboardItemProvider:v112];
  }
  if (v72) {
    v72[2](v72, 0, 1.0);
  }
  [(PUActivityItemSource *)self performChanges:&__block_literal_global_172];
  if (objc_msgSend(v71, "pu_isCancelled")) {
    uint64_t v113 = 1;
  }
  else {
    uint64_t v113 = [v71 isCancelled];
  }
  if (v167)
  {
    v114 = [(PUActivityItemSource *)self _itemForActivityType:v170];
    if (!v114
      && !v193[5]
      && (objc_msgSend(v71, "pu_isCancelled") & 1) == 0
      && ([v71 isCancelled] & 1) == 0)
    {
      v115 = NSString;
      v116 = [(PHAsset *)self->_asset uuid];
      v117 = [v115 stringWithFormat:@"Preparation failed (nil item) for activityType: %@, asset: %@", v170, v116];

      uint64_t v118 = [(id)objc_opt_class() _sharingErrorWithCode:-100 underlyingError:0 localizedDescription:v117 additionalInfo:0];
      id v119 = v193[5];
      v193[5] = (id)v118;

      v120 = PLShareSheetGetLog();
      if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
      {
        v121 = self->_sharingUUID;
        *(_DWORD *)buf = 138543618;
        v213 = v121;
        __int16 v214 = 2114;
        unint64_t v215 = (unint64_t)v159;
        _os_log_impl(&dword_1AE9F8000, v120, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Finished sharing preparation for asset %{public}@ with no errors or cancellation, but the item is nil. Will fail with generic error.", buf, 0x16u);
      }
    }
    v122 = (objc_class *)objc_opt_class();
    v123 = NSStringFromClass(v122);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v124 = [v114 path];
    }
    else
    {
      v124 = 0;
    }
    v125 = PLShareSheetGetLog();
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
    {
      v126 = self->_sharingUUID;
      v127 = @"NO";
      if (v113) {
        v127 = @"YES";
      }
      v128 = v127;

      v129 = v128;
      v130 = (__CFString *)v193[5];
      *(_DWORD *)buf = 138544642;
      v213 = v126;
      __int16 v214 = 2114;
      unint64_t v215 = (unint64_t)v159;
      __int16 v216 = 2112;
      unint64_t v217 = (unint64_t)v129;
      __int16 v218 = 2114;
      v219 = v123;
      __int16 v220 = 2114;
      v221 = v124;
      __int16 v222 = 2112;
      v223 = v130;
      _os_log_impl(&dword_1AE9F8000, v125, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Preparation completed for asset %{public}@ (Cancelled: %@), final item is of type %{public}@ (path: %{public}@), with error: %@", buf, 0x3Eu);
    }
    [(PUActivityItemSource *)self setLastPreparationError:v193[5]];
    ((void (**)(void, void *, uint64_t, id))v167)[2](v167, v114, v113, v193[5]);
  }
  if (v113)
  {
    v131 = v169;
    if (v144 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v132 = v131;
      if (os_signpost_enabled(v131))
      {
        *(_WORD *)buf = 0;
        v133 = " enableTelemetry=YES Cancel";
LABEL_166:
        _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v132, OS_SIGNPOST_INTERVAL_END, spid, "PrepareItem", v133, buf, 2u);
      }
    }
  }
  else
  {
    v134 = [(PUActivityItemSource *)self lastPreparationError];

    v135 = v169;
    v132 = v135;
    if (v134)
    {
      if (v144 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v135))
      {
        *(_WORD *)buf = 0;
        v133 = " enableTelemetry=YES Error";
        goto LABEL_166;
      }
    }
    else if (v144 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v135))
    {
      *(_WORD *)buf = 0;
      v133 = " enableTelemetry=YES Success";
      goto LABEL_166;
    }
  }

  if (v165) {
    v165[2]();
  }
  [(PUActivityItemSource *)self setPostCompletionHandler:0];
  [(PUActivityItemSource *)self setCompletionHandler:0];
  [(PUActivityItemSource *)self setProgressHandler:0];

  _Block_object_dispose(&v192, 8);
  _Block_object_dispose(&v198, 8);
  _Block_object_dispose(&v202, 8);
  _Block_object_dispose(&v206, 8);
}

void __79__PUActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (a3 < 0.0 || a3 > 1.0)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"PUActivityItemSource.m" lineNumber:628 description:@"expect progress range"];
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    && (objc_msgSend(*(id *)(a1 + 40), "pu_isCancelled") & 1) == 0
    && ([*(id *)(a1 + 40) isCancelled] & 1) == 0)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(double))(v7 + 16))(a3);
    }
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    || (objc_msgSend(*(id *)(a1 + 40), "pu_isCancelled") & 1) != 0)
  {
    if (!a2) {
      return;
    }
    goto LABEL_14;
  }
  char v8 = [*(id *)(a1 + 40) isCancelled];
  if (a2 && (v8 & 1) != 0) {
LABEL_14:
  }
    *a2 = 1;
}

void __79__PUActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_137(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)
    && (objc_msgSend(*(id *)(a1 + 32), "pu_isCancelled") & 1) == 0
    && ([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    int v9 = [*(id *)(a1 + 40) simulateDownloadFailure];
    int v10 = [*(id *)(a1 + 40) simulateCPLNotReadyError];
    int v11 = [*(id *)(a1 + 40) simulateLowDiskSpaceError];
    int v12 = [*(id *)(a1 + 40) simulateUserCloudNotAuthenticated];
    int v13 = [*(id *)(a1 + 40) simulateSyndicatedResourceUnavailable];
    if (v9)
    {

      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F393B0];
      uint64_t v16 = @"Simulated download failure, for debugging.";
      uint64_t v17 = 2;
    }
    else if (v10)
    {

      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F8AD00];
      uint64_t v16 = @"Simulated CPL Not ready error, for debugging.";
      uint64_t v17 = 15;
    }
    else if (v11)
    {

      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F393B0];
      uint64_t v16 = @"Simulated low disk space error, for debugging.";
      uint64_t v17 = 3;
    }
    else if (v12)
    {

      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F393B0];
      uint64_t v16 = @"Simulated \"user needs to review iCloud settings\" error, for debugging.";
      uint64_t v17 = 4;
    }
    else
    {
      if (!v13) {
        goto LABEL_15;
      }

      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F393B0];
      uint64_t v16 = @"Simulated \"syndicated resource unavailable\" error, for debugging.";
      uint64_t v17 = 5;
    }
    uint64_t v18 = objc_msgSend(v14, "px_errorWithDomain:code:debugDescription:", v15, v17, v16);

    id v7 = (id)MEMORY[0x1E4F1CC08];
    id v8 = (id)v18;
LABEL_15:
    uint64_t v19 = PLShareSheetGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 136);
      int v56 = 138543874;
      uint64_t v57 = v20;
      __int16 v58 = 2048;
      uint64_t v59 = [v7 count];
      __int16 v60 = 2112;
      id v61 = v8;
      _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Export Request completed with number of resource URLs: %ld, error: %@", (uint8_t *)&v56, 0x20u);
    }

    BOOL v21 = PLShareSheetGetLog();
    __int16 v22 = v21;
    if (v8)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 136);
        int v56 = 138543618;
        uint64_t v57 = v23;
        __int16 v58 = 2112;
        uint64_t v59 = (uint64_t)v8;
        _os_log_impl(&dword_1AE9F8000, v22, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Preparation export error %@", (uint8_t *)&v56, 0x16u);
      }

      os_signpost_id_t v24 = [v8 domain];
      uint64_t v25 = *MEMORY[0x1E4F393B0];
      if ([v24 isEqualToString:*MEMORY[0x1E4F393B0]])
      {
        uint64_t v26 = [v8 code];

        if (v26 == 2)
        {
          uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v28 = *MEMORY[0x1E4F90910];
          uint64_t v29 = @"Couldn't retrieve resource(s) for asset due to a network-related error.";
          uint64_t v30 = -101;
LABEL_29:
          uint64_t v34 = objc_msgSend(v27, "px_errorWithDomain:code:underlyingError:debugDescription:", v28, v30, v8, v29);
          uint64_t v35 = *(void *)(*(void *)(a1 + 64) + 8);
          __int16 v22 = *(NSObject **)(v35 + 40);
          *(void *)(v35 + 40) = v34;
          goto LABEL_32;
        }
      }
      else
      {
      }
      CGSize v32 = [v8 domain];
      if ([v32 isEqualToString:v25])
      {
        uint64_t v33 = [v8 code];

        if (v33 == 3)
        {
          uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v28 = *MEMORY[0x1E4F90910];
          uint64_t v29 = @"Couldn't retrieve resource(s) for asset due to low disk space.";
          uint64_t v30 = -110;
          goto LABEL_29;
        }
      }
      else
      {
      }
      uint64_t v36 = *(void *)(*(void *)(a1 + 64) + 8);
      id v37 = v8;
      __int16 v22 = *(NSObject **)(v36 + 40);
      *(void *)(v36 + 40) = v37;
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = *(void *)(*(void *)(a1 + 48) + 136);
      int v56 = 138543618;
      uint64_t v57 = v31;
      __int16 v58 = 2114;
      uint64_t v59 = (uint64_t)v7;
      _os_log_impl(&dword_1AE9F8000, v22, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Retrieved resource urls: %{public}@", (uint8_t *)&v56, 0x16u);
    }
LABEL_32:

    __int16 v38 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F393D8]];
    uint64_t v39 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F393E0]];
    __int16 v40 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F393A8]];
    id v41 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F393C8]];
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    if (a4 == 2)
    {
      uint64_t v42 = 1;
    }
    else
    {
      if (a4 != 3) {
        goto LABEL_37;
      }
      uint64_t v42 = 4;
    }
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v42;
LABEL_37:
    if (v40)
    {
      id v43 = [*(id *)(a1 + 48) _createManagedURLForResourceAtURL:v40 shouldMove:0 forType:5];
      [*(id *)(a1 + 48) _setResourceURL:v43 forType:5];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    }
    if (v41)
    {
      id v44 = [*(id *)(a1 + 48) _createManagedURLForResourceAtURL:v41 shouldMove:0 forType:3];
      [*(id *)(a1 + 48) _setResourceURL:v44 forType:3];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
    }
    if (!v38)
    {
      if (v39)
      {
        v45 = [*(id *)(a1 + 48) _createManagedURLForResourceAtURL:v39 shouldMove:0 forType:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
        [*(id *)(a1 + 48) _setResourceURL:v45 forType:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
      }
      else
      {
        v47 = PLShareSheetGetLog();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          uint64_t v48 = *(void *)(*(void *)(a1 + 48) + 136);
          uint64_t v49 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          int v56 = 138543618;
          uint64_t v57 = v48;
          __int16 v58 = 2112;
          uint64_t v59 = v49;
          _os_log_impl(&dword_1AE9F8000, v47, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Unable to fetch any primary resource with error %@", (uint8_t *)&v56, 0x16u);
        }

        uint64_t v50 = *(void *)(*(void *)(a1 + 64) + 8);
        v51 = *(void **)(v50 + 40);
        if (v51)
        {
          id v52 = v51;
          v45 = *(void **)(v50 + 40);
          *(void *)(v50 + 40) = v52;
        }
        else
        {
          uint64_t v54 = [(id)objc_opt_class() _sharingErrorWithCode:-100 underlyingError:0 localizedDescription:@"No primary resources found with no error" additionalInfo:0];
          uint64_t v55 = *(void *)(*(void *)(a1 + 64) + 8);
          v45 = *(void **)(v55 + 40);
          *(void *)(v55 + 40) = v54;
        }
      }
      goto LABEL_56;
    }
    v45 = [*(id *)(a1 + 48) _createManagedURLForResourceAtURL:v38 shouldMove:0 forType:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
    [*(id *)(a1 + 48) _setResourceURL:v45 forType:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
    BOOL v46 = 0;
    if (!*(unsigned char *)(a1 + 112))
    {
      if (*(unsigned char *)(a1 + 113))
      {
        BOOL v46 = 0;
      }
      else
      {
        if (!*(unsigned char *)(a1 + 114))
        {
LABEL_56:

          goto LABEL_57;
        }
        BOOL v46 = *(unsigned char *)(a1 + 96) != 0;
      }
    }
    if (v39 && !v46)
    {
      id v53 = [*(id *)(a1 + 48) _createManagedURLForResourceAtURL:v39 shouldMove:0 forType:2];
      [*(id *)(a1 + 48) _setResourceURL:v53 forType:2];
    }
    goto LABEL_56;
  }
LABEL_57:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

uint64_t __79__PUActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_170(uint64_t a1, void *a2)
{
  return [a2 setState:0];
}

uint64_t __79__PUActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_163(uint64_t a1, void *a2)
{
  return [a2 setState:2];
}

- (id)_newPasteboardItemProviderForURL:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F9F360];
  id v5 = a3;
  id v6 = [(PUActivityItemSource *)self _uniformTypeIdentifierForActivityType:v4];
  id v7 = objc_msgSend(MEMORY[0x1E4FB1A78], "px_newPasteboardItemProviderForAsset:fileURL:utiType:", self->_asset, v5, v6);

  return v7;
}

- (id)_newOperationForActivityType:(id)a3
{
  id v5 = a3;
  id v6 = [[PUActivityItemSourceOperation alloc] initWithDelegate:self activityType:v5];

  currentOperation = self->_currentOperation;
  if (currentOperation && [(PUActivityItemSourceOperation *)currentOperation isExecuting])
  {
    int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PUActivityItemSource.m" lineNumber:491 description:@"expect only one running operation"];
  }
  objc_storeStrong((id *)&self->_currentOperation, v6);
  return v6;
}

- (id)_uniformTypeIdentifierForActivityType:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F906A0] sharedInstance];
  int v6 = [v5 provideGenericTypeIdentifiersForNilActivityTypes];

  if (!v4 && v6)
  {
    id v7 = [(id)objc_opt_class() _basicTypeIdentifierForAsset:self->_asset];
    goto LABEL_27;
  }
  id v8 = [(PUActivityItemSource *)self _sharingVariants];
  int v9 = self->_asset;
  int v10 = v9;
  if (v8)
  {
    [(PUActivityItemSource *)self sharingPreferences];
    uint64_t v12 = v11;
    uint64_t v13 = [(PUActivityItemSource *)self sharingPreferences];
    if (v4)
    {
      [(PUActivityItemSource *)self sharingPreferences];
      BOOL v15 = +[PUActivityItemSourceConfiguration shouldProvideCompatibleFormatForActivityType:v4 forAsset:v10 inPreferredExportFormat:v14 withAvailableSharingVariants:v8];
      [(PUActivityItemSource *)self sharingPreferences];
      BOOL v17 = +[PUActivityItemSourceConfiguration shouldProvideAlternateVariantForActivityType:v4 forAsset:v10 inPreferredExportFormat:v16 withAvailableSharingVariants:v8];
      id v7 = 0;
      if (v12) {
        BOOL v18 = v12 == 2;
      }
      else {
        BOOL v18 = v15;
      }
      BOOL v19 = (v13 & 0x10000000000) == 0 && v18;
      if ((v13 & 0x10000000000) == 0 && v17)
      {
        id v7 = [v8 objectForKeyedSubscript:&unk_1F078BA38];
      }
    }
    else
    {
      id v7 = 0;
      BOOL v19 = (v13 & 0x10000000000 | v12 & 0xFFFFFFFFFFFFFFFDLL) == 0;
    }
    if (v19 && v7 == 0)
    {
      id v7 = [v8 objectForKeyedSubscript:&unk_1F078BA50];
    }
    if (v7) {
      goto LABEL_26;
    }
    uint64_t v20 = [v8 objectForKeyedSubscript:&unk_1F078BA68];
  }
  else
  {
    uint64_t v20 = [(PHAsset *)v9 uniformTypeIdentifier];
  }
  id v7 = (void *)v20;
LABEL_26:

LABEL_27:
  return v7;
}

- (void)signalAnchorCompletion
{
  if ([(PUActivityItemSource *)self shouldAnchorPreparation])
  {
    anchorOperation = self->_anchorOperation;
    if (anchorOperation)
    {
      [(PUActivityItemSourceAnchorOperation *)anchorOperation signalAnchor];
      id v4 = self->_anchorOperation;
      self->_anchorOperation = 0;
    }
  }
}

- (void)cancel
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"PUActivityItemSource.m" lineNumber:361 description:@"expect main thread"];
  }
  id v4 = PLShareSheetGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    sharingUUID = self->_sharingUUID;
    int v6 = [(PHAsset *)self->_asset uuid];
    int v22 = 138543618;
    uint64_t v23 = sharingUUID;
    __int16 v24 = 2114;
    uint64_t v25 = v6;
    _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Cancelling item for asset: %{public}@", (uint8_t *)&v22, 0x16u);
  }
  id v7 = [(PUActivityItemSource *)self _exportProgress];
  [v7 cancel];

  currentOperation = self->_currentOperation;
  if (currentOperation)
  {
    [(PUActivityItemSourceOperation *)currentOperation pu_cancel];
    [(PUActivityItemSourceOperation *)self->_currentOperation cancel];
    int v9 = PLShareSheetGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = self->_sharingUUID;
      uint64_t v11 = self->_currentOperation;
      int v22 = 138543618;
      uint64_t v23 = v10;
      __int16 v24 = 2112;
      uint64_t v25 = v11;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Cancelling current operation: %@", (uint8_t *)&v22, 0x16u);
    }

    if ([(PUActivityItemSourceOperation *)self->_currentOperation isExecuting])
    {
      uint64_t v12 = [(PUActivityItemSourceOperation *)self->_currentOperation semaphore];
      dispatch_semaphore_signal((dispatch_semaphore_t)v12);
    }
    else
    {
      uint64_t v12 = [(PUActivityItemSource *)self completionHandler];
      if (v12)
      {
        [(PUActivityItemSource *)self setCompletionHandler:0];
        (*(void (**)(uint64_t, void, uint64_t, void))(v12 + 16))(v12, 0, 1, 0);
      }
    }
  }
  anchorOperation = self->_anchorOperation;
  if (anchorOperation)
  {
    [(PXAsyncOperation *)anchorOperation cancel];
    uint64_t v14 = PLShareSheetGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v15 = self->_sharingUUID;
      uint64_t v16 = self->_anchorOperation;
      int v22 = 138543618;
      uint64_t v23 = v15;
      __int16 v24 = 2112;
      uint64_t v25 = v16;
      _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Cancelling anchor operation: %@", (uint8_t *)&v22, 0x16u);
    }
  }
  BOOL v17 = [(id)objc_opt_class() activityItemSourceLog];
  os_signpost_id_t v18 = [(PUActivityItemSource *)self signpostId];
  BOOL v19 = v17;
  uint64_t v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v20, OS_SIGNPOST_EVENT, v18, "PrepareItemCancelled", " enableTelemetry=YES ", (uint8_t *)&v22, 2u);
  }
}

- (void)_resetState
{
  if ([(NSMutableSet *)self->_onDemandExports count])
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"PUActivityItemSource.m", 346, @"On-demand exports was not empty when state was reset on activity item source: %@", self->_sharingUUID object file lineNumber description];
  }
  if (self->__exportProgress)
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PUActivityItemSource.m", 347, @"Export progress was not nil when state was reset on activity item source: %@", self->_sharingUUID object file lineNumber description];
  }
  if (self->__exportProgressHandler)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PUActivityItemSource.m", 348, @"Export progress handler was not nil when state was reset on activity item source: %@", self->_sharingUUID object file lineNumber description];
  }
  [(PUActivityItemSource *)self cleanUpExportedFiles];
  currentOperation = self->_currentOperation;
  self->_currentOperation = 0;

  [(PUActivityItemSource *)self setExportConfiguration:0];
  [(PUActivityItemSource *)self set_pasteboardItemProvider:0];
  [(PUActivityItemSource *)self _setAssetsLibraryURL:0];
}

- (void)setSharingPreferences:(id)a3
{
  externalIsolation = self->_externalIsolation;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PUActivityItemSource_setSharingPreferences___block_invoke;
  block[3] = &unk_1E5F2A1D0;
  void block[4] = self;
  $9D9B13A340AA60ED2DD68408BD7D962F v5 = a3;
  dispatch_sync(externalIsolation, block);
}

uint64_t __46__PUActivityItemSource_setSharingPreferences___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) state];
  if (result)
  {
    int v9 = NSString;
    unint64_t v10 = [*(id *)(a1 + 32) state];
    if (v10 > 2) {
      uint64_t v11 = @"unknown";
    }
    else {
      uint64_t v11 = off_1E5F22880[v10];
    }
    uint64_t v12 = v11;
    uint64_t v13 = [v9 stringWithFormat:@"Attempted to set sharing preferences while activity item source's state was %@", v12];

    id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v13 userInfo:0];
    objc_exception_throw(v14);
  }
  uint64_t v3 = *(void *)(a1 + 40) ^ *(void *)(*(void *)(a1 + 32) + 288);
  if ((v3 & 0x101010101) != 0
    || (v3 & 0x10000000000) != 0
    || *(void *)(*(void *)(a1 + 32) + 296) != *(void *)(a1 + 48))
  {
    id v4 = PLShareSheetGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(v5 + 136);
      id v7 = PUActivityItemSharingPreferencesDescription(*(void *)(v5 + 288));
      id v8 = PUActivityItemSharingPreferencesDescription(*(void *)(a1 + 40));
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = v6;
      __int16 v17 = 2114;
      os_signpost_id_t v18 = v7;
      __int16 v19 = 2114;
      uint64_t v20 = v8;
      _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Changing sharing preferences from\n%{public}@ to\n%{public}@", buf, 0x20u);
    }
    *(_OWORD *)(*(void *)(a1 + 32) + 288) = *(_OWORD *)(a1 + 40);
    [*(id *)(a1 + 32) _resetState];
    return [*(id *)(a1 + 32) signalChange:2];
  }
  return result;
}

- (void)setState:(unint64_t)a3
{
  externalIsolation = self->_externalIsolation;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__PUActivityItemSource_setState___block_invoke;
  v4[3] = &unk_1E5F2E0A8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(externalIsolation, v4);
}

uint64_t __33__PUActivityItemSource_setState___block_invoke(uint64_t result)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(result + 32) + 176) != *(void *)(result + 40))
  {
    uint64_t v1 = result;
    uint64_t v2 = PLShareSheetGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(v1 + 32);
      unint64_t v4 = *(void *)(v3 + 176);
      if (v4 > 2) {
        uint64_t v5 = @"unknown";
      }
      else {
        uint64_t v5 = off_1E5F22880[v4];
      }
      uint64_t v6 = *(void *)(v3 + 136);
      unint64_t v7 = *(void *)(v1 + 40);
      if (v7 > 2) {
        id v8 = @"unknown";
      }
      else {
        id v8 = off_1E5F22880[v7];
      }
      int v9 = 138543874;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      id v14 = v8;
      _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Changing state from %{public}@ to %{public}@", (uint8_t *)&v9, 0x20u);
    }

    *(void *)(*(void *)(v1 + 32) + 176) = *(void *)(v1 + 40);
    return [*(id *)(v1 + 32) signalChange:1];
  }
  return result;
}

- (void)_setExportProgress:(id)a3
{
  uint64_t v5 = (NSProgress *)a3;
  exportProgress = self->__exportProgress;
  if (exportProgress != v5)
  {
    unint64_t v7 = v5;
    [(NSProgress *)exportProgress removeObserver:self forKeyPath:@"fractionCompleted" context:&PUActivityItemSourceProgressContext];
    objc_storeStrong((id *)&self->__exportProgress, a3);
    [(NSProgress *)self->__exportProgress addObserver:self forKeyPath:@"fractionCompleted" options:4 context:&PUActivityItemSourceProgressContext];
    uint64_t v5 = v7;
  }
}

- (void)_fetchSharingVariants
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_fetchSharingVariantsSemaphore)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PUActivityItemSource.m", 287, @"Invalid parameter not satisfying: %@", @"_fetchSharingVariantsSemaphore" object file lineNumber description];
  }
  if (self->_cachedSharingVariants)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUActivityItemSource.m", 288, @"Invalid parameter not satisfying: %@", @"!_cachedSharingVariants" object file lineNumber description];
  }
  asset = self->_asset;
  BOOL shareAsUnmodifiedOriginal = self->_sharingPreferences.shareAsUnmodifiedOriginal;
  id v16 = 0;
  uint64_t v6 = [MEMORY[0x1E4F38F38] variantsForAsset:asset asUnmodifiedOriginal:shareAsUnmodifiedOriginal error:&v16];
  id v7 = v16;
  cachedSharingVariants = self->_cachedSharingVariants;
  self->_cachedSharingVariants = v6;

  if (!self->_cachedSharingVariants)
  {
    int v9 = PLShareSheetGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      sharingUUID = self->_sharingUUID;
      __int16 v11 = [(PHAsset *)self->_asset uuid];
      *(_DWORD *)buf = 138543874;
      os_signpost_id_t v18 = sharingUUID;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Failed to fetch sharing variants for asset: %{public}@, error: %@", buf, 0x20u);
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_fetchSharingVariantsSemaphore);
  uint64_t v12 = [(PUActivityItemSource *)self ppt_didFetchSharingVariantsHandler];
  __int16 v13 = (void *)v12;
  if (v12) {
    (*(void (**)(uint64_t))(v12 + 16))(v12);
  }
}

- (id)_sharingVariants
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  fetchSharingVariantsSemaphore = self->_fetchSharingVariantsSemaphore;
  if (fetchSharingVariantsSemaphore)
  {
    dispatch_time_t v4 = dispatch_time(0, 5000000000);
    intptr_t v5 = dispatch_semaphore_wait(fetchSharingVariantsSemaphore, v4);
    uint64_t v6 = self->_fetchSharingVariantsSemaphore;
    self->_fetchSharingVariantsSemaphore = 0;

    if (v5)
    {
      id v7 = PLShareSheetGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        sharingUUID = self->_sharingUUID;
        int v9 = [(PHAsset *)self->_asset uuid];
        int v12 = 138543618;
        __int16 v13 = sharingUUID;
        __int16 v14 = 2114;
        uint64_t v15 = v9;
        _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Timed out fetching sharing variants for asset: %{public}@", (uint8_t *)&v12, 0x16u);
      }
    }
  }
  cachedSharingVariants = self->_cachedSharingVariants;
  return cachedSharingVariants;
}

- (void)runWithActivityType:(id)a3
{
  id v5 = [(PUActivityItemSource *)self _newOperationForActivityType:a3];
  dispatch_time_t v4 = [(PUActivityItemSource *)self _activityOperationQueueForExplicitRunning];
  [v4 addOperation:v5];
}

- (id)_activityOperationQueueForExplicitRunning
{
  if (_activityOperationQueueForExplicitRunning_onceToken != -1) {
    dispatch_once(&_activityOperationQueueForExplicitRunning_onceToken, &__block_literal_global_59);
  }
  uint64_t v2 = (void *)_activityOperationQueueForExplicitRunning_activityOperationQueue;
  return v2;
}

uint64_t __65__PUActivityItemSource__activityOperationQueueForExplicitRunning__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  uint64_t v1 = (void *)_activityOperationQueueForExplicitRunning_activityOperationQueue;
  _activityOperationQueueForExplicitRunning_activityOperationQueue = (uint64_t)v0;

  uint64_t v2 = (void *)_activityOperationQueueForExplicitRunning_activityOperationQueue;
  return [v2 setMaxConcurrentOperationCount:3];
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(PUActivityItemSource *)self _setExportProgress:0];
  if ([(NSMutableDictionary *)self->_sharingURLs count])
  {
    uint64_t v3 = PLShareSheetGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      sharingUUID = self->_sharingUUID;
      *(_DWORD *)buf = 138543362;
      id v7 = sharingUUID;
      _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Deallocing PUActivityItemSource, but sharing URLs still remain non-empty", buf, 0xCu);
    }
  }
  [(PUActivityItemSource *)self cleanUpExportedFiles];
  v5.receiver = self;
  v5.super_class = (Class)PUActivityItemSource;
  [(PUActivityItemSource *)&v5 dealloc];
}

- (NSString)sharingUUID
{
  return self->_sharingUUID;
}

- (PUActivityItemSource)initWithAsset:(id)a3 sharingPreferences:(id)a4
{
  int64_t var6 = a4.var6;
  uint64_t v5 = *(void *)&a4.var0;
  id v8 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PUActivityItemSource;
  int v9 = [(PUActivityItemSource *)&v34 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    *(void *)&v10->_sharingPreferences.excludeLiveness = v5;
    v10->_sharingPreferences.int64_t preferredExportFormat = var6;
    v10->_state = 0;
    __int16 v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sharingURLs = v10->_sharingURLs;
    v10->_sharingURLs = v11;

    __int16 v13 = [MEMORY[0x1E4F29128] UUID];
    __int16 v14 = [v13 UUIDString];
    uint64_t v15 = [v14 copy];
    sharingUUID = v10->_sharingUUID;
    v10->_sharingUUID = (NSString *)v15;

    __int16 v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    onDemandExports = v10->_onDemandExports;
    v10->_onDemandExports = v17;

    __int16 v19 = [(id)objc_opt_class() activityItemSourceLog];
    v10->_signpostId = os_signpost_id_make_with_pointer(v19, v10->_sharingUUID);

    uint64_t v20 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.PUActivityItemSource.isolationQueue", v20);
    externalIsolation = v10->_externalIsolation;
    v10->_externalIsolation = (OS_dispatch_queue *)v21;

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __57__PUActivityItemSource_initWithAsset_sharingPreferences___block_invoke;
    v32[3] = &unk_1E5F2ED10;
    uint64_t v33 = v20;
    uint64_t v23 = initWithAsset_sharingPreferences__predicate;
    __int16 v24 = v20;
    if (v23 != -1) {
      dispatch_once(&initWithAsset_sharingPreferences__predicate, v32);
    }
    dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
    fetchSharingVariantsSemaphore = v10->_fetchSharingVariantsSemaphore;
    v10->_fetchSharingVariantsSemaphore = (OS_dispatch_semaphore *)v25;

    objc_initWeak(&location, v10);
    uint64_t v27 = initWithAsset_sharingPreferences___fetchSharingVariantsSerialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PUActivityItemSource_initWithAsset_sharingPreferences___block_invoke_2;
    block[3] = &unk_1E5F2E530;
    objc_copyWeak(&v30, &location);
    dispatch_async(v27, block);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return v10;
}

void __57__PUActivityItemSource_initWithAsset_sharingPreferences___block_invoke(uint64_t a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.PUActivityItemSource.fetchSharingVariants", *(dispatch_queue_attr_t *)(a1 + 32));
  uint64_t v2 = (void *)initWithAsset_sharingPreferences___fetchSharingVariantsSerialQueue;
  initWithAsset_sharingPreferences___fetchSharingVariantsSerialQueue = (uint64_t)v1;
}

void __57__PUActivityItemSource_initWithAsset_sharingPreferences___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fetchSharingVariants];
}

+ (OS_os_log)activityItemSourceLog
{
  if (activityItemSourceLog_onceToken != -1) {
    dispatch_once(&activityItemSourceLog_onceToken, &__block_literal_global_242);
  }
  uint64_t v2 = (void *)activityItemSourceLog_activityItemSourceLog;
  return (OS_os_log *)v2;
}

void __45__PUActivityItemSource_activityItemSourceLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos.ui", "ActivityItemSource");
  dispatch_queue_t v1 = (void *)activityItemSourceLog_activityItemSourceLog;
  activityItemSourceLog_activityItemSourceLog = (uint64_t)v0;
}

+ (void)_deleteOutputDirectoryURL:(id)a3 forSharingUUID:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v19 = 0;
  int v8 = [v7 removeItemAtURL:v5 error:&v19];
  id v9 = v19;

  if (!v8)
  {
    __int16 v11 = [v9 userInfo];
    uint64_t v10 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    int v12 = [v10 domain];
    if ([v12 isEqualToString:*MEMORY[0x1E4F28798]])
    {
      uint64_t v13 = [v10 code];

      if (v13 == 2)
      {
        __int16 v14 = PLShareSheetGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v21 = v6;
          uint64_t v15 = "[Item: %{public}@] Outbound resources directory was not created or was already deleted, so no exported f"
                "iles to clean up";
          uint64_t v16 = v14;
          os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
          uint32_t v18 = 12;
LABEL_11:
          _os_log_impl(&dword_1AE9F8000, v16, v17, v15, buf, v18);
          goto LABEL_12;
        }
        goto LABEL_12;
      }
    }
    else
    {
    }
    __int16 v14 = PLShareSheetGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = v6;
      __int16 v22 = 2114;
      id v23 = v9;
      uint64_t v15 = "[Item: %{public}@] Failed to clean up outbound resources directory: %{public}@";
      uint64_t v16 = v14;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
      uint32_t v18 = 22;
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v10 = PLShareSheetGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = v6;
    __int16 v22 = 2114;
    id v23 = v5;
    _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Cleaned up outbound resources directory: %{public}@", buf, 0x16u);
  }
LABEL_13:
}

+ (id)_basicTypeIdentifierForAsset:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 mediaType];
  id v5 = (id *)MEMORY[0x1E4F44448];
  switch(v4)
  {
    case 0:
      id v5 = (id *)MEMORY[0x1E4F44378];
      goto LABEL_8;
    case 1:
      if (![v3 canPlayLoopingVideo]) {
        id v5 = (id *)MEMORY[0x1E4F44400];
      }
      goto LABEL_8;
    case 2:
      goto LABEL_8;
    case 3:
      id v5 = (id *)MEMORY[0x1E4F44330];
LABEL_8:
      id v6 = [*v5 identifier];
      break;
    default:
      id v6 = 0;
      break;
  }

  return v6;
}

+ (id)_exportResultHandlingQueue
{
  if (_exportResultHandlingQueue_onceToken != -1) {
    dispatch_once(&_exportResultHandlingQueue_onceToken, &__block_literal_global_3140);
  }
  uint64_t v2 = (void *)_exportResultHandlingQueue_resultHandlingQueue;
  return v2;
}

void __50__PUActivityItemSource__exportResultHandlingQueue__block_invoke()
{
  os_log_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("PUActivityItemSource.resultHandlingQueue", attr);
  uint64_t v2 = (void *)_exportResultHandlingQueue_resultHandlingQueue;
  _exportResultHandlingQueue_resultHandlingQueue = (uint64_t)v1;
}

+ (id)_sharingErrorWithCode:(int64_t)a3 underlyingError:(id)a4 localizedDescription:(id)a5 additionalInfo:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  int v12 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v13 = v12;
  if (v9) {
    [v12 setObject:v9 forKey:*MEMORY[0x1E4F28A50]];
  }
  if (v10) {
    [v13 setObject:v10 forKey:*MEMORY[0x1E4F28568]];
  }
  if (v11) {
    [v13 addEntriesFromDictionary:v11];
  }
  __int16 v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F90910] code:a3 userInfo:v13];

  return v14;
}

+ (BOOL)supportsAssetLocalIdentifierForActivityType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F90AB0]]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:*MEMORY[0x1E4F909A0]];
  }

  return v4;
}

@end