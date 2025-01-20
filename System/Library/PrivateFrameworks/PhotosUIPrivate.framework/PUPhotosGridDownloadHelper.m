@interface PUPhotosGridDownloadHelper
+ (id)createAlertControllerForDownloadError:(id)a3 withAsset:(id)a4;
- (BOOL)isAnyPickerAssetDownloading:(id)a3;
- (BOOL)shouldTreatLivePhotosAsStills;
- (PUPhotosGridDownloadHelper)init;
- (PUPhotosGridDownloadHelper)initWithUpdateHandler:(id)a3;
- (PUPhotosGridDownloadUpdateHandler)updateHandler;
- (id)_defaultOptions;
- (id)_downloadContextForIdentifier:(id)a3;
- (int64_t)mode;
- (void)_cancelPreviousDownloadsForAsset:(id)a3;
- (void)_checkIfRetrievalIsRequiredForResourceRequest:(id)a3 completion:(id)a4;
- (void)_downloadForRequest:(id)a3 didCompleteWithSuccess:(BOOL)a4 canceled:(BOOL)a5 error:(id)a6;
- (void)_removeDownloadRequestForIdentifier:(id)a3;
- (void)_setDownloadContext:(id)a3 forIdentifier:(id)a4;
- (void)_startRetrievingRequiredResourcesForRequest:(id)a3 options:(id)a4 inCollection:(id)a5;
- (void)_updateDownloadProgressForAsset:(id)a3;
- (void)cancelAllDownloads;
- (void)cancelDownloadForIdentifier:(id)a3;
- (void)handleDownloadOfAssetIfNeeded:(id)a3 inCollection:(id)a4 withSuccessHandler:(id)a5;
- (void)setMode:(int64_t)a3;
- (void)setShouldTreatLivePhotosAsStills:(BOOL)a3;
@end

@implementation PUPhotosGridDownloadHelper

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updateHandler);
  objc_storeStrong((id *)&self->_downloadContextsIsolationQueue, 0);
  objc_storeStrong((id *)&self->_downloadContexts, 0);
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setShouldTreatLivePhotosAsStills:(BOOL)a3
{
  self->_shouldTreatLivePhotosAsStills = a3;
}

- (BOOL)shouldTreatLivePhotosAsStills
{
  return self->_shouldTreatLivePhotosAsStills;
}

- (PUPhotosGridDownloadUpdateHandler)updateHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateHandler);
  return (PUPhotosGridDownloadUpdateHandler *)WeakRetained;
}

- (void)_removeDownloadRequestForIdentifier:(id)a3
{
  id v4 = a3;
  downloadContextsIsolationQueue = self->_downloadContextsIsolationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PUPhotosGridDownloadHelper__removeDownloadRequestForIdentifier___block_invoke;
  v7[3] = &unk_1E5F2ECC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(downloadContextsIsolationQueue, v7);
}

uint64_t __66__PUPhotosGridDownloadHelper__removeDownloadRequestForIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (id)_downloadContextForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__67621;
  v16 = __Block_byref_object_dispose__67622;
  id v17 = 0;
  downloadContextsIsolationQueue = self->_downloadContextsIsolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PUPhotosGridDownloadHelper__downloadContextForIdentifier___block_invoke;
  block[3] = &unk_1E5F2E0D0;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(downloadContextsIsolationQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __60__PUPhotosGridDownloadHelper__downloadContextForIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_setDownloadContext:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  downloadContextsIsolationQueue = self->_downloadContextsIsolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PUPhotosGridDownloadHelper__setDownloadContext_forIdentifier___block_invoke;
  block[3] = &unk_1E5F2E908;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(downloadContextsIsolationQueue, block);
}

uint64_t __64__PUPhotosGridDownloadHelper__setDownloadContext_forIdentifier___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 8) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (void)_downloadForRequest:(id)a3 didCompleteWithSuccess:(BOOL)a4 canceled:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = [v10 asset];
  id v13 = [v12 localIdentifier];
  uint64_t v14 = [(PUPhotosGridDownloadHelper *)self _downloadContextForIdentifier:v13];
  if (!v8 && !v7)
  {
    v15 = PLUIGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v24 = 138412546;
      id v25 = v10;
      __int16 v26 = 2112;
      id v27 = v11;
      _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_ERROR, "Error downloading resources for request %@: %@", (uint8_t *)&v24, 0x16u);
    }
  }
  [(PUPhotosGridDownloadHelper *)self _removeDownloadRequestForIdentifier:v13];
  v16 = [v14 downloadHandler];

  if (v8)
  {
    if (v16)
    {
      id v17 = [v14 downloadHandler];
      v17[2](v17, 1, 0);

      [v14 setDownloadHandler:0];
    }
  }
  else
  {
    if (v7)
    {
      if (!v16) {
        goto LABEL_16;
      }
      v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PUPhotosGridDownloadHelper" code:1 userInfo:0];
      v19 = [v14 downloadHandler];
      ((void (**)(void, void, void *))v19)[2](v19, 0, v18);

      [v14 setDownloadHandler:0];
    }
    else
    {
      if (v16)
      {
        v20 = [v14 downloadHandler];
        ((void (**)(void, void, id))v20)[2](v20, 0, v11);

        [v14 setDownloadHandler:0];
      }
      v18 = +[PUPhotosGridDownloadHelper createAlertControllerForDownloadError:v11 withAsset:v12];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_updateHandler);
      [WeakRetained presentAlertController:v18];
    }
  }
LABEL_16:
  v22 = [v14 gridProgressIdentifier];
  if (v22)
  {
    id v23 = objc_loadWeakRetained((id *)&self->_updateHandler);
    [v23 endShowingProgressWithIdentifier:v22 succeeded:v8 canceled:v7 error:v11];
  }
}

- (void)_updateDownloadProgressForAsset:(id)a3
{
  id v11 = [a3 localIdentifier];
  id v4 = -[PUPhotosGridDownloadHelper _downloadContextForIdentifier:](self, "_downloadContextForIdentifier:");
  v5 = [v4 gridProgressIdentifier];
  id v6 = [v4 resourceLocalAvailabilityRequest];
  BOOL v7 = v6;
  if (v5 && v6)
  {
    [v6 progressFraction];
    double v9 = v8;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_updateHandler);
    [WeakRetained updateProgressWithIdentifier:v5 withValue:v9];
  }
}

- (void)_startRetrievingRequiredResourcesForRequest:(id)a3 options:(id)a4 inCollection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 asset];
  id v12 = [v11 localIdentifier];
  id v13 = [(PUPhotosGridDownloadHelper *)self _downloadContextForIdentifier:v12];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateHandler);
  v15 = [v8 asset];
  v16 = [WeakRetained beginShowingProgressForAsset:v15 inCollection:v10];

  [v13 setGridProgressIdentifier:v16];
  objc_initWeak(&location, self);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __95__PUPhotosGridDownloadHelper__startRetrievingRequiredResourcesForRequest_options_inCollection___block_invoke;
  v22[3] = &unk_1E5F2E4E8;
  objc_copyWeak(&v24, &location);
  id v17 = v11;
  id v23 = v17;
  [v8 setProgressChangeHandler:v22];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __95__PUPhotosGridDownloadHelper__startRetrievingRequiredResourcesForRequest_options_inCollection___block_invoke_2;
  v19[3] = &unk_1E5F2A570;
  objc_copyWeak(&v21, &location);
  id v18 = v8;
  id v20 = v18;
  [v18 retrieveRequiredResourcesWithOptions:v9 completionHandler:v19];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __95__PUPhotosGridDownloadHelper__startRetrievingRequiredResourcesForRequest_options_inCollection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateDownloadProgressForAsset:*(void *)(a1 + 32)];
}

void __95__PUPhotosGridDownloadHelper__startRetrievingRequiredResourcesForRequest_options_inCollection___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = (id *)(a1 + 40);
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained(v8);
  [WeakRetained _downloadForRequest:*(void *)(a1 + 32) didCompleteWithSuccess:a2 canceled:a3 error:v9];
}

- (void)cancelAllDownloads
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__67621;
  id v25 = __Block_byref_object_dispose__67622;
  id v26 = 0;
  downloadContextsIsolationQueue = self->_downloadContextsIsolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PUPhotosGridDownloadHelper_cancelAllDownloads__block_invoke;
  block[3] = &unk_1E5F2E200;
  block[4] = self;
  void block[5] = &v21;
  dispatch_sync(downloadContextsIsolationQueue, block);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = (id)v22[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    p_updateHandler = &self->_updateHandler;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "resourceLocalAvailabilityRequest", (void)v16);
        [v10 cancelRetrievalRequest];

        id v11 = [v9 gridProgressIdentifier];
        if (v11)
        {
          id WeakRetained = objc_loadWeakRetained((id *)p_updateHandler);
          [WeakRetained endShowingProgressWithIdentifier:v11 succeeded:0 canceled:1 error:0];
        }
        id v13 = [v9 downloadHandler];

        if (v13)
        {
          uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PUPhotosGridDownloadHelper" code:1 userInfo:0];
          v15 = [v9 downloadHandler];
          ((void (**)(void, void, void *))v15)[2](v15, 0, v14);

          [v9 setDownloadHandler:0];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v27 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v21, 8);
}

void __48__PUPhotosGridDownloadHelper_cancelAllDownloads__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__PUPhotosGridDownloadHelper_cancelAllDownloads__block_invoke_2;
  v8[3] = &unk_1E5F2A548;
  id v9 = v2;
  id v4 = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v5 = [v4 copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
}

uint64_t __48__PUPhotosGridDownloadHelper_cancelAllDownloads__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (void)cancelDownloadForIdentifier:(id)a3
{
  id v11 = a3;
  id v4 = -[PUPhotosGridDownloadHelper _downloadContextForIdentifier:](self, "_downloadContextForIdentifier:");
  uint64_t v5 = [v4 downloadHandler];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PUPhotosGridDownloadHelper" code:1 userInfo:0];
    BOOL v7 = [v4 downloadHandler];
    ((void (**)(void, void, void *))v7)[2](v7, 0, v6);

    [v4 setDownloadHandler:0];
  }
  id v8 = [v4 resourceLocalAvailabilityRequest];
  [v8 cancelRetrievalRequest];

  id v9 = [v4 gridProgressIdentifier];
  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_updateHandler);
    [WeakRetained endShowingProgressWithIdentifier:v9 succeeded:0 canceled:1 error:0];
  }
  [(PUPhotosGridDownloadHelper *)self _removeDownloadRequestForIdentifier:v11];
}

- (id)_defaultOptions
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F39278]);
  objc_msgSend(v3, "setTreatLivePhotoAsStill:", -[PUPhotosGridDownloadHelper shouldTreatLivePhotosAsStills](self, "shouldTreatLivePhotosAsStills"));
  return v3;
}

- (void)_checkIfRetrievalIsRequiredForResourceRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PUPhotosGridDownloadHelper *)self _defaultOptions];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__PUPhotosGridDownloadHelper__checkIfRetrievalIsRequiredForResourceRequest_completion___block_invoke;
  v10[3] = &unk_1E5F2A520;
  id v11 = v6;
  id v9 = v6;
  [v7 fetchResourceAvailabilityWithOptions:v8 completionHandler:v10];
}

uint64_t __87__PUPhotosGridDownloadHelper__checkIfRetrievalIsRequiredForResourceRequest_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 != 0, a4);
  }
  return result;
}

- (void)_cancelPreviousDownloadsForAsset:(id)a3
{
  id v6 = a3;
  int64_t v4 = [(PUPhotosGridDownloadHelper *)self mode];
  if (v4 == 1)
  {
    uint64_t v5 = [v6 localIdentifier];
    [(PUPhotosGridDownloadHelper *)self cancelDownloadForIdentifier:v5];
  }
  else if (!v4)
  {
    [(PUPhotosGridDownloadHelper *)self cancelAllDownloads];
  }
}

- (BOOL)isAnyPickerAssetDownloading:(id)a3
{
  int64_t v4 = (void *)MEMORY[0x1E4F39270];
  id v5 = a3;
  id v6 = [(PUPhotosGridDownloadHelper *)self _defaultOptions];
  id v7 = [v4 indexesForAssetsRequiringResourceRetrieval:v5 requestType:1 options:v6];

  LOBYTE(v5) = [v7 count] != 0;
  return (char)v5;
}

- (void)handleDownloadOfAssetIfNeeded:(id)a3 inCollection:(id)a4 withSuccessHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(PUPhotosGridDownloadHelper *)self _cancelPreviousDownloadsForAsset:v8];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F39270]) initWithAsset:v8 requestType:0];
  id v12 = objc_alloc_init(PUPhotosGridDownloadHelpContext);
  [(PUPhotosGridDownloadHelpContext *)v12 setResourceLocalAvailabilityRequest:v11];
  id v13 = [v8 localIdentifier];
  [(PUPhotosGridDownloadHelper *)self _setDownloadContext:v12 forIdentifier:v13];
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92__PUPhotosGridDownloadHelper_handleDownloadOfAssetIfNeeded_inCollection_withSuccessHandler___block_invoke;
  v19[3] = &unk_1E5F2A4F8;
  void v19[4] = self;
  id v14 = v13;
  id v20 = v14;
  v15 = v12;
  uint64_t v21 = v15;
  id v16 = v10;
  id v24 = v16;
  objc_copyWeak(&v25, &location);
  id v17 = v9;
  id v22 = v17;
  id v18 = v11;
  id v23 = v18;
  [(PUPhotosGridDownloadHelper *)self _checkIfRetrievalIsRequiredForResourceRequest:v18 completion:v19];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __92__PUPhotosGridDownloadHelper_handleDownloadOfAssetIfNeeded_inCollection_withSuccessHandler___block_invoke(uint64_t a1, int a2)
{
  id v9 = [*(id *)(a1 + 32) _downloadContextForIdentifier:*(void *)(a1 + 40)];
  if (v9 && [*(id *)(a1 + 48) isEqual:v9])
  {
    [*(id *)(a1 + 48) setDownloadHandler:*(void *)(a1 + 72)];
    int64_t v4 = [*(id *)(a1 + 48) resourceLocalAvailabilityRequest];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    id v6 = WeakRetained;
    if (a2)
    {
      uint64_t v7 = [WeakRetained _defaultOptions];

      id v8 = objc_loadWeakRetained((id *)(a1 + 80));
      [v8 _startRetrievingRequiredResourcesForRequest:v4 options:v7 inCollection:*(void *)(a1 + 56)];

      id v6 = (void *)v7;
    }
    else
    {
      [WeakRetained _downloadForRequest:v4 didCompleteWithSuccess:1 canceled:0 error:0];
    }
  }
  else
  {
    int64_t v4 = objc_loadWeakRetained((id *)(a1 + 80));
    [v4 _downloadForRequest:*(void *)(a1 + 64) didCompleteWithSuccess:0 canceled:1 error:0];
  }
}

- (PUPhotosGridDownloadHelper)initWithUpdateHandler:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUPhotosGridDownloadHelper;
  id v5 = [(PUPhotosGridDownloadHelper *)&v11 init];
  if (v5)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    downloadContexts = v5->_downloadContexts;
    v5->_downloadContexts = v6;

    dispatch_queue_t v8 = dispatch_queue_create("PUPhotosGridDownloadHelper._downloadContexts", 0);
    downloadContextsIsolationQueue = v5->_downloadContextsIsolationQueue;
    v5->_downloadContextsIsolationQueue = (OS_dispatch_queue *)v8;

    objc_storeWeak((id *)&v5->_updateHandler, v4);
    v5->_mode = 0;
  }

  return v5;
}

- (PUPhotosGridDownloadHelper)init
{
  return [(PUPhotosGridDownloadHelper *)self initWithUpdateHandler:0];
}

+ (id)createAlertControllerForDownloadError:(id)a3 withAsset:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [PUSharingErrorPresentationController alloc];
  v14[0] = v6;
  dispatch_queue_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v13 = v5;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];

  id v10 = [(PUSharingErrorPresentationController *)v7 initWithErrors:v8 forAssets:v9 fromSource:3 preparationType:0];
  [(PUErrorPresentationController *)v10 setRadarDescription:@"Error trying to pick an asset from image picker."];
  [(PUErrorPresentationController *)v10 setRadarComponentID:@"476273" name:@"Photos UI Image Picker" version:@"iOS"];
  objc_super v11 = [(PUErrorPresentationController *)v10 alertControllerWithCompletion:0];

  return v11;
}

@end