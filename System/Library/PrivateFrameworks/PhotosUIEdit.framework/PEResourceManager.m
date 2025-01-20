@interface PEResourceManager
- (NSMutableSet)resourceSet;
- (OS_dispatch_queue)loaderCallbackQueue;
- (OS_dispatch_queue)loadingQueue;
- (OS_dispatch_queue)resourceQueue;
- (PEResourceManager)init;
- (id)compositionControllerWithoutSource:(id)a3;
- (id)compositionControllerWithoutSource:(id)a3 originalComposition:(BOOL)a4 editorBundleID:(id *)a5;
- (id)originalCompositionControllerWithoutSource:(id)a3 reconstructIfMissing:(BOOL)a4;
- (void)_removeFromSet:(id)a3;
- (void)_resourceLoader:(id)a3 loadedResult:(id)a4 error:(id)a5;
- (void)cancelAllRequests;
- (void)loadResourceForAsset:(id)a3 requireLocalResources:(BOOL)a4 forceRunAsUnadjustedAsset:(BOOL)a5 progressHandler:(id)a6 resultHandler:(id)a7;
- (void)resourceLoader:(id)a3 request:(id)a4 didCompleteWithResult:(id)a5;
- (void)resourceLoader:(id)a3 request:(id)a4 downloadProgress:(double)a5;
- (void)resourceLoader:(id)a3 request:(id)a4 mediaLoadDidFailWithError:(id)a5;
@end

@implementation PEResourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loaderCallbackQueue, 0);
  objc_storeStrong((id *)&self->_loadingQueue, 0);
  objc_storeStrong((id *)&self->_resourceQueue, 0);
  objc_storeStrong((id *)&self->_resourceSet, 0);
}

- (OS_dispatch_queue)loaderCallbackQueue
{
  return self->_loaderCallbackQueue;
}

- (OS_dispatch_queue)loadingQueue
{
  return self->_loadingQueue;
}

- (OS_dispatch_queue)resourceQueue
{
  return self->_resourceQueue;
}

- (NSMutableSet)resourceSet
{
  return self->_resourceSet;
}

- (void)_removeFromSet:(id)a3
{
  id v4 = a3;
  resourceQueue = self->_resourceQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__PEResourceManager__removeFromSet___block_invoke;
  v7[3] = &unk_2642BF318;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(resourceQueue, v7);
}

uint64_t __36__PEResourceManager__removeFromSet___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

- (void)_resourceLoader:(id)a3 loadedResult:(id)a4 error:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v14;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;
  v12 = [v11 resultHandler];

  if (v12)
  {
    v13 = [v11 resultHandler];
    ((void (**)(void, id, id))v13)[2](v13, v8, v9);
  }
  [(PEResourceManager *)self _removeFromSet:v14];
}

- (void)resourceLoader:(id)a3 request:(id)a4 downloadProgress:(double)a5
{
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v10;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  id v8 = [v7 progressHandler];

  if (v8)
  {
    id v9 = [v7 progressHandler];
    v9[2](a5);
  }
}

- (void)resourceLoader:(id)a3 request:(id)a4 mediaLoadDidFailWithError:(id)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  if (v8)
  {
    id v9 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl(&dword_217B65000, v9, OS_LOG_TYPE_ERROR, "Error fetching the resource: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  [(PEResourceManager *)self _resourceLoader:v7 loadedResult:0 error:v8];
}

- (void)resourceLoader:(id)a3 request:(id)a4 didCompleteWithResult:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v10 = 0;
    _os_log_impl(&dword_217B65000, v9, OS_LOG_TYPE_DEFAULT, "PEResourceManager completed resource fetch.", v10, 2u);
  }

  [(PEResourceManager *)self _resourceLoader:v8 loadedResult:v7 error:0];
}

- (void)cancelAllRequests
{
  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__PEResourceManager_cancelAllRequests__block_invoke;
  block[3] = &unk_2642BF020;
  block[4] = self;
  dispatch_async(resourceQueue, block);
}

void __38__PEResourceManager_cancelAllRequests__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "cancelAllRequests", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)loadResourceForAsset:(id)a3 requireLocalResources:(BOOL)a4 forceRunAsUnadjustedAsset:(BOOL)a5 progressHandler:(id)a6 resultHandler:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  v15 = [_PEResourceHandler alloc];
  v16 = [(PEResourceManager *)self loadingQueue];
  v17 = [(PEResourceLoader *)v15 initWithAsset:v14 loadingQueue:v16];

  [(_PEResourceHandler *)v17 setProgressHandler:v13];
  [(_PEResourceHandler *)v17 setResultHandler:v12];

  [(PEResourceLoader *)v17 setForceRunAsUnadjustedAsset:v8];
  [(PEResourceLoader *)v17 setSkipDisplaySizeImage:1];
  v18 = objc_alloc_init(PEResourceLoadRequest);
  [(PEResourceLoadRequest *)v18 setDelegate:self];
  [(PEResourceLoadRequest *)v18 setRequireAdjustments:1];
  [(PEResourceLoadRequest *)v18 setRequireLocalResources:v9];
  [(PEResourceLoader *)v17 enqueueRequest:v18];
  resourceQueue = self->_resourceQueue;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __120__PEResourceManager_loadResourceForAsset_requireLocalResources_forceRunAsUnadjustedAsset_progressHandler_resultHandler___block_invoke;
  v21[3] = &unk_2642BF318;
  v21[4] = self;
  v22 = v17;
  v20 = v17;
  dispatch_async(resourceQueue, v21);
}

uint64_t __120__PEResourceManager_loadResourceForAsset_requireLocalResources_forceRunAsUnadjustedAsset_progressHandler_resultHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

- (id)originalCompositionControllerWithoutSource:(id)a3 reconstructIfMissing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v7 = [(PEResourceManager *)self compositionControllerWithoutSource:v6 originalComposition:1 editorBundleID:0];
    if (!v7 && v4)
    {
      id v8 = objc_alloc(MEMORY[0x263F5D560]);
      BOOL v9 = (void *)[MEMORY[0x263F5D618] newComposition];
      int v10 = (void *)[v8 initWithComposition:v9];

      uint64_t v11 = [(PEResourceManager *)self compositionControllerWithoutSource:v6 originalComposition:0 editorBundleID:0];
      long long v7 = +[PESupport repairedAsShotCompositionController:forCurrentCompositionController:isLivePhoto:metadata:](PESupport, "repairedAsShotCompositionController:forCurrentCompositionController:isLivePhoto:metadata:", v10, v11, [v6 isLivePhoto], 0);
    }
  }
  else
  {
    long long v7 = 0;
  }

  return v7;
}

- (id)compositionControllerWithoutSource:(id)a3 originalComposition:(BOOL)a4 editorBundleID:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    uint64_t v13 = 0;
    BOOL v9 = +[PEAdjustmentDataCache synchronousCompositionControllerForAsset:v8 networkAccessAllowed:0 disposition:&v13 originalComposition:v6];
    if (a5)
    {
      int v10 = +[PEAdjustmentDataCache synchronousEditorBundleIDForAsset:v8];
      uint64_t v11 = v10;
      if (v10) {
        *a5 = v10;
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)compositionControllerWithoutSource:(id)a3
{
  return [(PEResourceManager *)self compositionControllerWithoutSource:a3 originalComposition:0 editorBundleID:0];
}

- (PEResourceManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)PEResourceManager;
  uint64_t v2 = [(PEResourceManager *)&v12 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    resourceSet = v2->_resourceSet;
    v2->_resourceSet = v3;

    dispatch_queue_t v5 = dispatch_queue_create("PEResourceManager", 0);
    resourceQueue = v2->_resourceQueue;
    v2->_resourceQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("PEResourceLoader", 0);
    loadingQueue = v2->_loadingQueue;
    v2->_loadingQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("PEResourceLoader_CallbackQueue", 0);
    loaderCallbackQueue = v2->_loaderCallbackQueue;
    v2->_loaderCallbackQueue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

@end