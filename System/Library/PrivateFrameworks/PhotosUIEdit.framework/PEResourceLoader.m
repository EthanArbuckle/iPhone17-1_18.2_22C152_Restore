@interface PEResourceLoader
+ (void)_processResult:(id)a3 forRequest:(id)a4 resultHandler:(id)a5;
- (BOOL)_adjustmentDataIsSupported:(id)a3;
- (BOOL)cancelAllRequests;
- (BOOL)forceRunAsUnadjustedAsset;
- (BOOL)simulateEditEntryError;
- (BOOL)skipDisplaySizeImage;
- (NSMutableArray)_enqueuedRequests;
- (NSString)adjustmentIdentifierAndVersion;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)loadingQueue;
- (OS_dispatch_queue)processingQueue;
- (PEAsset)asset;
- (PEResourceLoadRequest)currentRequest;
- (PEResourceLoader)initWithAsset:(id)a3 loadingQueue:(id)a4;
- (int64_t)resourcesAvailability;
- (int64_t)workImageVersionForContentEditingInput:(id)a3;
- (unint64_t)_contentEditingRequestID;
- (void)_dequeueRequestIfNeeded;
- (void)_downloadSignpostEvent:(const char *)a3;
- (void)_handleSuccess:(BOOL)a3 withResult:(id)a4 forRequest:(id)a5 error:(id)a6;
- (void)_initiateRequest:(id)a3;
- (void)_processContentEditingInputRequestCompletion:(id)a3 info:(id)a4 forRequest:(id)a5;
- (void)_processLoadedContentEditingInput:(id)a3 info:(id)a4 forRequest:(id)a5;
- (void)_requestContentEditingInputForRequest:(id)a3 networkAccessAllowed:(BOOL)a4;
- (void)_setContentEditingRequestID:(unint64_t)a3;
- (void)_setEnqueuedRequests:(id)a3;
- (void)_setResourcesAvailability:(int64_t)a3;
- (void)enqueueRequest:(id)a3;
- (void)setAdjustmentIdentifierAndVersion:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setForceRunAsUnadjustedAsset:(BOOL)a3;
- (void)setSimulateEditEntryError:(BOOL)a3;
- (void)setSkipDisplaySizeImage:(BOOL)a3;
@end

@implementation PEResourceLoader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_adjustmentIdentifierAndVersion, 0);
  objc_storeStrong((id *)&self->_loadingQueue, 0);
  objc_storeStrong((id *)&self->__enqueuedRequests, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setAdjustmentIdentifierAndVersion:(id)a3
{
}

- (NSString)adjustmentIdentifierAndVersion
{
  return self->_adjustmentIdentifierAndVersion;
}

- (OS_dispatch_queue)loadingQueue
{
  return self->_loadingQueue;
}

- (void)_setContentEditingRequestID:(unint64_t)a3
{
  self->__contentEditingRequestID = a3;
}

- (unint64_t)_contentEditingRequestID
{
  return self->__contentEditingRequestID;
}

- (void)_setEnqueuedRequests:(id)a3
{
}

- (NSMutableArray)_enqueuedRequests
{
  return self->__enqueuedRequests;
}

- (PEResourceLoadRequest)currentRequest
{
  return self->_currentRequest;
}

- (void)setForceRunAsUnadjustedAsset:(BOOL)a3
{
  self->_forceRunAsUnadjustedAsset = a3;
}

- (BOOL)forceRunAsUnadjustedAsset
{
  return self->_forceRunAsUnadjustedAsset;
}

- (void)setSimulateEditEntryError:(BOOL)a3
{
  self->_simulateEditEntryError = a3;
}

- (BOOL)simulateEditEntryError
{
  return self->_simulateEditEntryError;
}

- (void)setSkipDisplaySizeImage:(BOOL)a3
{
  self->_skipDisplaySizeImage = a3;
}

- (BOOL)skipDisplaySizeImage
{
  return self->_skipDisplaySizeImage;
}

- (void)setCallbackQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (int64_t)resourcesAvailability
{
  return self->_resourcesAvailability;
}

- (PEAsset)asset
{
  return self->_asset;
}

- (void)_downloadSignpostEvent:(const char *)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v4 = [(PEResourceLoader *)self currentRequest];
  if (v4)
  {
    v5 = PLPhotoEditGetLog();
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, v4);

    v7 = PLPhotoEditGetLog();
    v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v9 = 136315138;
      v10 = a3;
      _os_signpost_emit_with_name_impl(&dword_217B65000, v8, OS_SIGNPOST_EVENT, v6, "EnterEditResourceRequest", "%s", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_dequeueRequestIfNeeded
{
  id v4 = [(PEResourceLoader *)self _enqueuedRequests];
  if ([v4 count])
  {
    v3 = [v4 objectAtIndexedSubscript:0];
    [v4 removeObject:v3];
    [(PEResourceLoader *)self _initiateRequest:v3];
  }
}

- (void)_handleSuccess:(BOOL)a3 withResult:(id)a4 forRequest:(id)a5 error:(id)a6
{
  BOOL v8 = a3;
  v19[1] = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v11 delegate];
  if ([(PEResourceLoader *)self simulateEditEntryError])
  {
    v14 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_217B65000, v14, OS_LOG_TYPE_DEFAULT, "PEResourceLoader: Simulating edit entry error", v17, 2u);
    }

    uint64_t v18 = *MEMORY[0x263F07F80];
    v19[0] = @"Simulated error, because PEProtoSettings.simulateEditEntryError is YES.";
    v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:@"PEProtoSettingsErrorDomain" code:0 userInfo:v15];

    id v12 = (id)v16;
  }
  else if (v8)
  {
    objc_msgSend(v10, "_setRetrievedVersion:", objc_msgSend(v11, "_resolvedVersion"));
    [v13 resourceLoader:self request:v11 didCompleteWithResult:v10];
    goto LABEL_9;
  }
  if (objc_opt_respondsToSelector()) {
    [v13 resourceLoader:self request:v11 mediaLoadDidFailWithError:v12];
  }
LABEL_9:
  [(PEResourceLoader *)self setCurrentRequest:0];
  self->__contentEditingRequestID = 0;
  [(PEResourceLoader *)self _dequeueRequestIfNeeded];
}

- (void)_requestContentEditingInputForRequest:(id)a3 networkAccessAllowed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(PEResourceLoader *)self asset];
  objc_initWeak(&location, self);
  if ([(PEResourceLoader *)self resourcesAvailability] == 1)
  {
    BOOL v8 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217B65000, v8, OS_LOG_TYPE_DEFAULT, "-[PEResourceLoader _requestContentEditingInputForRequest:]: checking if a download is required", buf, 2u);
    }

    [(PEResourceLoader *)self _downloadSignpostEvent:"Checking if download is required"];
  }
  id v9 = objc_alloc_init(MEMORY[0x263F14DD0]);
  [v9 setForceReturnFullLivePhoto:1];
  [v6 targetSize];
  objc_msgSend(v9, "setTargetSize:");
  [v9 setContentMode:0];
  BOOL v10 = [v6 version] == 1
     || [(PEResourceLoader *)self forceRunAsUnadjustedAsset];
  [v9 setForceRunAsUnadjustedAsset:v10];
  objc_msgSend(v9, "setSkipDisplaySizeImage:", -[PEResourceLoader skipDisplaySizeImage](self, "skipDisplaySizeImage"));
  objc_msgSend(v9, "setSkipLivePhotoImageAndAVAsset:", objc_msgSend(v6, "skipLivePhotoImageAndAVAsset"));
  id v11 = [(PEResourceLoader *)self loadingQueue];
  [v9 setResultHandlerQueue:v11];

  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __79__PEResourceLoader__requestContentEditingInputForRequest_networkAccessAllowed___block_invoke;
  v30[3] = &unk_2642BF548;
  id v12 = v6;
  id v31 = v12;
  [v9 setCanHandleRAW:v30];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __79__PEResourceLoader__requestContentEditingInputForRequest_networkAccessAllowed___block_invoke_2;
  v28[3] = &unk_2642BF570;
  objc_copyWeak(&v29, &location);
  [v9 setCanHandleAdjustmentData:v28];
  objc_msgSend(v9, "setRequireOriginalsDownloaded:", objc_msgSend(v12, "requireOriginalsDownloaded"));
  if (v4)
  {
    v13 = [v12 delegate];
    if (objc_opt_respondsToSelector()) {
      [v13 photoEditResourceLoadRequestWillBeginDownload:v12];
    }
    if (objc_opt_respondsToSelector())
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __79__PEResourceLoader__requestContentEditingInputForRequest_networkAccessAllowed___block_invoke_3;
      v24[3] = &unk_2642BF5C0;
      id v25 = v13;
      v26 = self;
      id v27 = v12;
      [v9 setProgressHandler:v24];
    }
    [v9 setNetworkAccessAllowed:1];
    [(PEResourceLoader *)self _downloadSignpostEvent:"Network access allowed"];
  }
  else
  {
    if ([(PEResourceLoader *)self resourcesAvailability] == 1) {
      v14 = "Network access NOT allowed for resource locality check";
    }
    else {
      v14 = "Network access NOT allowed";
    }
    [(PEResourceLoader *)self _downloadSignpostEvent:v14];
  }
  *(void *)buf = 0;
  v21 = buf;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __79__PEResourceLoader__requestContentEditingInputForRequest_networkAccessAllowed___block_invoke_5;
  v16[3] = &unk_2642BF5E8;
  uint64_t v18 = buf;
  objc_copyWeak(&v19, &location);
  id v15 = v12;
  id v17 = v15;
  self->__contentEditingRequestID = [v7 requestContentEditingInputWithOptions:v9 completionHandler:v16];

  objc_destroyWeak(&v19);
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&location);
}

uint64_t __79__PEResourceLoader__requestContentEditingInputForRequest_networkAccessAllowed___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setAssetLoadingAsRaw:", objc_msgSend(MEMORY[0x263F5DF18], "canLoadAssetAsRawForInteractiveEditingWithImageProperties:", a2));
  v3 = *(void **)(a1 + 32);
  return [v3 assetLoadingAsRaw];
}

uint64_t __79__PEResourceLoader__requestContentEditingInputForRequest_networkAccessAllowed___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  v5 = [v4 formatVersion];
  uint64_t v6 = [v4 formatIdentifier];
  v7 = (void *)v6;
  if (v5)
  {
    v2 = [v4 formatVersion];
    BOOL v8 = [v7 stringByAppendingFormat:@" / %@", v2];
  }
  else
  {
    BOOL v8 = (void *)v6;
  }
  id v9 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v9);
  [WeakRetained setAdjustmentIdentifierAndVersion:v8];

  if (v5)
  {
  }
  id v11 = objc_loadWeakRetained(v9);
  uint64_t v12 = [v11 _adjustmentDataIsSupported:v4];

  return v12;
}

void __79__PEResourceLoader__requestContentEditingInputForRequest_networkAccessAllowed___block_invoke_3(uint64_t a1, double a2)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__PEResourceLoader__requestContentEditingInputForRequest_networkAccessAllowed___block_invoke_4;
  v7[3] = &unk_2642BF598;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void **)(a1 + 48);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v6;
  double v11 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __79__PEResourceLoader__requestContentEditingInputForRequest_networkAccessAllowed___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!*(unsigned char *)(v6 + 24)
    || (_PFAssertContinueHandler(), uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8), !*(unsigned char *)(v6 + 24)))
  {
    *(unsigned char *)(v6 + 24) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _processContentEditingInputRequestCompletion:v8 info:v5 forRequest:*(void *)(a1 + 32)];
  }
}

uint64_t __79__PEResourceLoader__requestContentEditingInputForRequest_networkAccessAllowed___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) resourceLoader:*(void *)(a1 + 40) request:*(void *)(a1 + 48) downloadProgress:*(double *)(a1 + 56)];
}

- (BOOL)_adjustmentDataIsSupported:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F5D980]);
  id v5 = [v3 data];
  uint64_t v6 = [v3 formatIdentifier];
  v7 = [v3 formatVersion];
  id v18 = 0;
  id v8 = [v4 loadCompositionFrom:v5 formatIdentifier:v6 formatVersion:v7 sidecarData:0 error:&v18];
  id v9 = v18;

  id v10 = PLPhotoEditGetLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      uint64_t v12 = [v3 formatIdentifier];
      v13 = [v3 formatVersion];
      *(_DWORD *)buf = 138412546;
      v20 = v12;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      v14 = "PEResourceLoader: Loaded previous adjustments from data with a supported format: %@/%@";
      id v15 = v10;
      uint32_t v16 = 22;
LABEL_6:
      _os_log_impl(&dword_217B65000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    }
  }
  else if (v11)
  {
    uint64_t v12 = [v3 formatIdentifier];
    v13 = [v3 formatVersion];
    *(_DWORD *)buf = 138412802;
    v20 = v12;
    __int16 v21 = 2112;
    uint64_t v22 = v13;
    __int16 v23 = 2112;
    id v24 = v9;
    v14 = "PEResourceLoader: Previous adjustments data has an unsupported format (%@/%@) or unsupported adjustments. Star"
          "ting from current render, treating previous adjustments as opaque. Error: %@";
    id v15 = v10;
    uint32_t v16 = 32;
    goto LABEL_6;
  }

  return v8 != 0;
}

- (void)_processContentEditingInputRequestCompletion:(id)a3 info:(id)a4 forRequest:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(PEResourceLoader *)self asset];
  uint64_t v12 = [v9 objectForKeyedSubscript:*MEMORY[0x263F15068]];
  v13 = [v9 objectForKeyedSubscript:*MEMORY[0x263F15070]];
  int v14 = [v13 BOOLValue];

  if ([(PEResourceLoader *)self resourcesAvailability] == 2)
  {
    [(PEResourceLoader *)self _downloadSignpostEvent:"Download completed"];
    id v15 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 67109120;
      LODWORD(v21) = v8 != 0;
      _os_log_impl(&dword_217B65000, v15, OS_LOG_TYPE_DEFAULT, "download completed - success: %d", (uint8_t *)&v20, 8u);
    }

    uint32_t v16 = [v10 delegate];
    if (objc_opt_respondsToSelector()) {
      [v16 photoEditResourceLoadRequestDidCompleteDownload:v10];
    }
  }
  if (v8)
  {
    [(PEResourceLoader *)self _processLoadedContentEditingInput:v8 info:v9 forRequest:v10];
  }
  else if (v14 && [(PEResourceLoader *)self resourcesAvailability] == 1)
  {
    id v17 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      __int16 v21 = v11;
      _os_log_impl(&dword_217B65000, v17, OS_LOG_TYPE_DEFAULT, "download is required for asset: %@", (uint8_t *)&v20, 0xCu);
    }

    [(PEResourceLoader *)self _downloadSignpostEvent:"Download is required"];
    [(PEResourceLoader *)self _setResourcesAvailability:2];
    [(PEResourceLoader *)self _requestContentEditingInputForRequest:v10 networkAccessAllowed:1];
  }
  else
  {
    id v18 = [v9 objectForKeyedSubscript:*MEMORY[0x263F15060]];
    if ([v18 BOOLValue])
    {
      [(PEResourceLoader *)self _downloadSignpostEvent:"Canceled download"];
      uint64_t v19 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F15110] code:3072 userInfo:0];

      uint64_t v12 = (void *)v19;
    }
    else
    {
      [(PEResourceLoader *)self _downloadSignpostEvent:"Unable to download"];
    }
    [(PEResourceLoader *)self _setResourcesAvailability:4];
    [(PEResourceLoader *)self _handleSuccess:0 withResult:0 forRequest:v10 error:v12];
  }
}

- (void)_processLoadedContentEditingInput:(id)a3 info:(id)a4 forRequest:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v9 = [(PEResourceLoader *)self asset];
  if ([(PEResourceLoader *)self resourcesAvailability] == 1)
  {
    id v10 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v9;
      _os_log_impl(&dword_217B65000, v10, OS_LOG_TYPE_DEFAULT, "nothing to download, can continue loading stuff right away for asset: %@", buf, 0xCu);
    }

    [(PEResourceLoader *)self _downloadSignpostEvent:"Nothing to download"];
  }
  [(PEResourceLoader *)self _setResourcesAvailability:3];
  objc_msgSend(v8, "_resolveVersionIfNeededWithWorkVersion:", -[PEResourceLoader workImageVersionForContentEditingInput:](self, "workImageVersionForContentEditingInput:", v7));
  BOOL v11 = [v7 uniformTypeIdentifier];
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x263F1D920] typeWithIdentifier:v11];
    int v13 = [v12 conformsToType:*MEMORY[0x263F1DC60]];
  }
  else
  {
    int v13 = 0;
  }
  int v14 = +[PEResourceLoadResult _resultWithContentEditingInput:asset:assetLoadingAsRaw:](PEResourceLoadResult, "_resultWithContentEditingInput:asset:assetLoadingAsRaw:", v7, v9, [v8 assetLoadingAsRaw] & v13);
  objc_msgSend(v14, "_setRetrievedVersion:", objc_msgSend(v8, "_resolvedVersion"));
  id v15 = [(PEResourceLoader *)self adjustmentIdentifierAndVersion];
  [v14 _setAdjustmentIdentifierAndVersion:v15];

  uint32_t v16 = [v8 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v17 = [v16 callbackQueue];
  }
  else
  {
    id v17 = (void *)MEMORY[0x263EF83A0];
    id v18 = MEMORY[0x263EF83A0];
  }
  uint64_t v19 = [(PEResourceLoader *)self processingQueue];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __70__PEResourceLoader__processLoadedContentEditingInput_info_forRequest___block_invoke;
  v23[3] = &unk_2642BF520;
  id v24 = v14;
  id v25 = v8;
  id v26 = v17;
  id v27 = self;
  id v20 = v17;
  id v21 = v8;
  id v22 = v14;
  dispatch_async(v19, v23);
}

void __70__PEResourceLoader__processLoadedContentEditingInput_info_forRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__PEResourceLoader__processLoadedContentEditingInput_info_forRequest___block_invoke_2;
  v6[3] = &unk_2642BF4F8;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v4;
  uint64_t v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  +[PEResourceLoader _processResult:v2 forRequest:v3 resultHandler:v6];
}

void __70__PEResourceLoader__processLoadedContentEditingInput_info_forRequest___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__PEResourceLoader__processLoadedContentEditingInput_info_forRequest___block_invoke_3;
  block[3] = &unk_2642BF4D0;
  uint64_t v6 = *(NSObject **)(a1 + 32);
  id v7 = *(void **)(a1 + 48);
  block[4] = *(void *)(a1 + 40);
  char v13 = a2;
  id v10 = v7;
  id v11 = *(id *)(a1 + 56);
  id v12 = v5;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __70__PEResourceLoader__processLoadedContentEditingInput_info_forRequest___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSuccess:*(unsigned __int8 *)(a1 + 64) withResult:*(void *)(a1 + 40) forRequest:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (int64_t)workImageVersionForContentEditingInput:(id)a3
{
  uint64_t v3 = [a3 baseVersion];
  int64_t v4 = 2;
  if (v3 != 1) {
    int64_t v4 = 3;
  }
  if (v3) {
    return v4;
  }
  else {
    return 1;
  }
}

- (void)_initiateRequest:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(PEResourceLoader *)self setCurrentRequest:v4];
  id v5 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(PEResourceLoader *)self asset];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_217B65000, v5, OS_LOG_TYPE_DEFAULT, "-[PEResourceLoader _initiateRequest:]: initiating request for: %@", (uint8_t *)&v7, 0xCu);
  }
  [(PEResourceLoader *)self _setResourcesAvailability:1];
  [(PEResourceLoader *)self _requestContentEditingInputForRequest:v4 networkAccessAllowed:0];
}

- (void)setCurrentRequest:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = (PEResourceLoadRequest *)a3;
  currentRequest = self->_currentRequest;
  p_currentRequest = &self->_currentRequest;
  uint64_t v6 = currentRequest;
  if (currentRequest != v5)
  {
    if (v6)
    {
      uint64_t v9 = PLPhotoEditGetLog();
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, *p_currentRequest);

      id v11 = PLPhotoEditGetLog();
      id v12 = v11;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        LOWORD(v23[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_217B65000, v12, OS_SIGNPOST_INTERVAL_END, v10, "EnterEditResourceRequest", "", (uint8_t *)v23, 2u);
      }
    }
    if (v5)
    {
      char v13 = PLPhotoEditGetLog();
      os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, v5);

      id v15 = PLPhotoEditGetLog();
      uint32_t v16 = v15;
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        int v17 = [(PEResourceLoadRequest *)*p_currentRequest version];
        BOOL v18 = [(PEResourceLoadRequest *)*p_currentRequest requireLocalResources];
        BOOL v19 = [(PEResourceLoadRequest *)*p_currentRequest requireAdjustments];
        [(PEResourceLoadRequest *)*p_currentRequest targetSize];
        *(float *)&double v20 = v20;
        double v21 = *(float *)&v20;
        [(PEResourceLoadRequest *)*p_currentRequest targetSize];
        *(float *)&double v22 = v22;
        v23[0] = 67110144;
        v23[1] = v17;
        __int16 v24 = 1024;
        BOOL v25 = v18;
        __int16 v26 = 1024;
        BOOL v27 = v19;
        __int16 v28 = 2048;
        double v29 = v21;
        __int16 v30 = 2048;
        double v31 = *(float *)&v22;
        _os_signpost_emit_with_name_impl(&dword_217B65000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "EnterEditResourceRequest", "Version=%d, requireLocalResources=%d, requireAdjustments=%d, targetSize={%.4f,%.4f}", (uint8_t *)v23, 0x28u);
      }
    }
    objc_storeStrong((id *)p_currentRequest, a3);
  }
}

- (void)_setResourcesAvailability:(int64_t)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (self->_resourcesAvailability == a3) {
    return;
  }
  id v5 = [(PEResourceLoader *)self currentRequest];
  uint64_t v6 = [v5 delegate];

  char v7 = objc_opt_respondsToSelector();
  id v8 = PLPhotoEditGetLog();
  uint64_t v9 = PLPhotoEditGetLog();
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);

  int64_t resourcesAvailability = self->_resourcesAvailability;
  unint64_t v12 = a3 - 1;
  if (a3 != 1 || resourcesAvailability == 1)
  {
    if (a3 != 1 && resourcesAvailability == 1)
    {
      id v15 = v8;
      uint32_t v16 = v15;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        LOWORD(v26) = 0;
        _os_signpost_emit_with_name_impl(&dword_217B65000, v16, OS_SIGNPOST_INTERVAL_END, v10, "EnterEditResourceRequestChecking", " enableTelemetry=YES ", (uint8_t *)&v26, 2u);
      }

      int64_t resourcesAvailability = self->_resourcesAvailability;
    }
    if (a3 == 2 && resourcesAvailability != 2)
    {
      int v17 = v8;
      if (v10 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_25;
      }
      BOOL v18 = v17;
      if (!os_signpost_enabled(v17)) {
        goto LABEL_25;
      }
      LOWORD(v26) = 0;
      BOOL v19 = v18;
      os_signpost_type_t v20 = OS_SIGNPOST_INTERVAL_BEGIN;
      goto LABEL_24;
    }
  }
  else
  {
    char v13 = v8;
    os_signpost_id_t v14 = v13;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(v26) = 0;
      _os_signpost_emit_with_name_impl(&dword_217B65000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v10, "EnterEditResourceRequestChecking", " enableTelemetry=YES ", (uint8_t *)&v26, 2u);
    }

    int64_t resourcesAvailability = self->_resourcesAvailability;
  }
  if (a3 == 2 || resourcesAvailability != 2) {
    goto LABEL_26;
  }
  double v21 = v8;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    double v22 = v21;
    if (os_signpost_enabled(v21))
    {
      LOWORD(v26) = 0;
      BOOL v19 = v22;
      os_signpost_type_t v20 = OS_SIGNPOST_INTERVAL_END;
LABEL_24:
      _os_signpost_emit_with_name_impl(&dword_217B65000, v19, v20, v10, "EnterEditResourceRequestDownloading", " enableTelemetry=YES ", (uint8_t *)&v26, 2u);
    }
  }
LABEL_25:

  int64_t resourcesAvailability = self->_resourcesAvailability;
LABEL_26:
  self->_int64_t resourcesAvailability = a3;
  if (v7)
  {
    __int16 v23 = [(PEResourceLoader *)self currentRequest];
    [v6 photoEditResourceLoadRequestResourcesAvailabilityChanged:v23 previousAvailability:resourcesAvailability currentAvailability:a3];
  }
  __int16 v24 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    if (v12 > 3) {
      BOOL v25 = @"Unknown";
    }
    else {
      BOOL v25 = off_2642BF608[v12];
    }
    int v26 = 138543362;
    BOOL v27 = v25;
    _os_log_impl(&dword_217B65000, v24, OS_LOG_TYPE_DEFAULT, "-[PEResourceLoader _setResourcesAvailability:]: availablility updated to: %{public}@", (uint8_t *)&v26, 0xCu);
  }
}

- (BOOL)cancelAllRequests
{
  uint64_t v3 = [(PEResourceLoader *)self _enqueuedRequests];
  [v3 removeAllObjects];

  unint64_t contentEditingRequestID = self->__contentEditingRequestID;
  if (contentEditingRequestID)
  {
    id v5 = [(PEResourceLoader *)self asset];
    [v5 cancelContentEditingInputRequest:self->__contentEditingRequestID];
  }
  self->__unint64_t contentEditingRequestID = 0;
  [(PEResourceLoader *)self setCurrentRequest:0];
  return contentEditingRequestID != 0;
}

- (void)enqueueRequest:(id)a3
{
  id v6 = (id)[a3 copy];
  id v4 = [(PEResourceLoader *)self currentRequest];

  if (v4)
  {
    id v5 = [(PEResourceLoader *)self _enqueuedRequests];
    if (!v5)
    {
      id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
      [(PEResourceLoader *)self _setEnqueuedRequests:v5];
    }
    [v5 addObject:v6];
  }
  else
  {
    [(PEResourceLoader *)self _initiateRequest:v6];
  }
}

- (PEResourceLoader)initWithAsset:(id)a3 loadingQueue:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PEResourceLoader;
  os_signpost_id_t v10 = [(PEResourceLoader *)&v16 init];
  if (v10)
  {
    if (!v8)
    {
      id v15 = [MEMORY[0x263F08690] currentHandler];
      [v15 handleFailureInMethod:a2, v10, @"PEResourceLoader.m", 189, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
    }
    objc_storeStrong((id *)&v10->_asset, a3);
    objc_storeStrong((id *)&v10->_loadingQueue, a4);
    if (([v8 isResourceDownloadPossible] & 1) == 0) {
      v10->_int64_t resourcesAvailability = 3;
    }
    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("PUPhotoEditResourceLoader", v11);
    processingQueue = v10->_processingQueue;
    v10->_processingQueue = (OS_dispatch_queue *)v12;
  }
  return v10;
}

+ (void)_processResult:(id)a3 forRequest:(id)a4 resultHandler:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v7 = (void (**)(id, uint64_t, id))a5;
  id v8 = [v6 editSource];
  id v9 = [v6 contentEditingInput];
  id v38 = 0;
  os_signpost_id_t v10 = +[PESerializationUtility compositionControllerForContentEditingInput:v9 asShot:0 source:v8 error:&v38];
  id v11 = v38;
  if (v10)
  {
    id v37 = 0;
    dispatch_queue_t v12 = +[PESerializationUtility compositionControllerForContentEditingInput:v9 asShot:1 source:v8 error:&v37];
    id v29 = v37;
    char v13 = [v12 composition];

    [v6 _setCompositionController:v10];
    [v6 _setOriginalComposition:v13];
    if ([v8 mediaType] != 3 && objc_msgSend(v8, "mediaType") != 2)
    {
      id v19 = 0;
LABEL_20:
      v7[2](v7, 1, v19);

      goto LABEL_21;
    }
    BOOL v27 = v13;
    id v28 = v11;
    os_signpost_id_t v14 = (void *)MEMORY[0x263F5D618];
    id v15 = [v6 compositionController];
    objc_super v16 = [v15 composition];
    int v17 = [v14 videoPropertiesRequestWithComposition:v16];

    [v17 setName:@"PEResourceLoader-videoProperties"];
    id v36 = 0;
    BOOL v18 = [v17 submitSynchronous:&v36];
    id v19 = v36;
    if (v18)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v26 = v18;
        os_signpost_type_t v20 = [v8 videoEditSource];
        double v21 = [v20 videoURL];
        double v22 = [v21 path];
        BOOL v25 = PFVideoComplementMetadataForVideoAtPath();

        if (v25)
        {
          [v25 imageDisplayTime];
        }
        else
        {
          long long v34 = 0uLL;
          uint64_t v35 = 0;
        }
        id v11 = v28;
        BOOL v18 = v26;
        long long v32 = v34;
        uint64_t v33 = v35;
        [v6 setVideoComplementOriginalStillImageTime:&v32];

        goto LABEL_19;
      }
      long long v30 = *MEMORY[0x263F010E0];
      uint64_t v31 = *(void *)(MEMORY[0x263F010E0] + 16);
      [v6 setVideoComplementOriginalStillImageTime:&v30];
    }
    else
    {
      __int16 v24 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v19;
        _os_log_impl(&dword_217B65000, v24, OS_LOG_TYPE_ERROR, "Unable to load video properties: %@", buf, 0xCu);
      }
    }
    id v11 = v28;
LABEL_19:

    char v13 = v27;
    goto LABEL_20;
  }
  __int16 v23 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v11;
    _os_log_impl(&dword_217B65000, v23, OS_LOG_TYPE_ERROR, "Unable to load image properties: %@", buf, 0xCu);
  }

  v7[2](v7, 0, v11);
  id v19 = 0;
LABEL_21:
}

@end