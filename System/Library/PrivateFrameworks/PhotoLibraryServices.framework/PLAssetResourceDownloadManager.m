@interface PLAssetResourceDownloadManager
+ (id)defaultManager;
- (PLAssetResourceDownloadManager)init;
- (id)_requestWithID:(int)a3;
- (int)requestCloudResourceType:(unint64_t)a3 assetObjectID:(id)a4 library:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7;
- (void)_setRequest:(id)a3 forRequestID:(int)a4;
- (void)cancelRequest:(int)a3;
@end

@implementation PLAssetResourceDownloadManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestById, 0);
  objc_storeStrong((id *)&self->_requestIsolationQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (void)cancelRequest:(int)a3
{
  id v3 = [(PLAssetResourceDownloadManager *)self _requestWithID:*(void *)&a3];
  [v3 cancel];
}

- (int)requestCloudResourceType:(unint64_t)a3 assetObjectID:(id)a4 library:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v14)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PLAssetResourceDownloadManager.m", 70, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];
  }
  unsigned int add = atomic_fetch_add(&self->_currentRequestId, 1u);
  v18 = PLBackendGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [MEMORY[0x1E4F59940] descriptionForResourceType:a3];
    *(_DWORD *)buf = 138412546;
    id v29 = v13;
    __int16 v30 = 2112;
    v31 = v19;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Creating asset resource request for object id: %@ cloudResourceType: %@", buf, 0x16u);
  }
  v20 = [[PLAssetResourceDownloadRequest alloc] initWithRequestID:add + 1 library:v14 queue:self->_requestIsolationQueue cloudResourceType:a3 managedObjectID:v13 progressHandler:v15];
  [(PLAssetResourceDownloadManager *)self _setRequest:v20 forRequestID:add + 1];
  objc_initWeak((id *)buf, v20);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __115__PLAssetResourceDownloadManager_requestCloudResourceType_assetObjectID_library_progressHandler_completionHandler___block_invoke;
  v24[3] = &unk_1E5865B90;
  v24[4] = self;
  unsigned int v27 = add + 1;
  id v21 = v16;
  id v25 = v21;
  objc_copyWeak(&v26, (id *)buf);
  [(PLAssetResourceDownloadRequest *)v20 setCompletionBlock:v24];
  [(NSOperationQueue *)self->_operationQueue addOperation:v20];
  objc_destroyWeak(&v26);

  objc_destroyWeak((id *)buf);
  return add + 1;
}

void __115__PLAssetResourceDownloadManager_requestCloudResourceType_assetObjectID_library_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setRequest:0 forRequestID:*(unsigned int *)(a1 + 56)];
  if (*(void *)(a1 + 40))
  {
    v2 = (id *)(a1 + 48);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v3 = [WeakRetained error];
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = objc_loadWeakRetained(v2);
    (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, [v5 requestID], v3);
  }
}

- (void)_setRequest:(id)a3 forRequestID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  requestById = self->_requestById;
  v9 = [NSNumber numberWithInt:v4];
  [(NSMutableDictionary *)requestById setObject:v7 forKeyedSubscript:v9];

  os_unfair_lock_unlock(p_lock);
}

- (id)_requestWithID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  requestById = self->_requestById;
  id v7 = [NSNumber numberWithInt:v3];
  v8 = [(NSMutableDictionary *)requestById objectForKeyedSubscript:v7];

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (PLAssetResourceDownloadManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)PLAssetResourceDownloadManager;
  v2 = [(PLAssetResourceDownloadManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    [(NSOperationQueue *)v2->_operationQueue setQualityOfService:9];
    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_operationQueue setName:@"com.apple.mobileslideshow.plassetresourcedownloadmanager"];
    id v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v6 = dispatch_queue_create("PLAssetResourceDownloadRequest isolation queue", v5);
    requestIsolationQueue = v2->_requestIsolationQueue;
    v2->_requestIsolationQueue = (OS_dispatch_queue *)v6;

    v2->_lock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    requestById = v2->_requestById;
    v2->_requestById = v8;
  }
  return v2;
}

+ (id)defaultManager
{
  if (defaultManager_onceToken_17219 != -1) {
    dispatch_once(&defaultManager_onceToken_17219, &__block_literal_global_17220);
  }
  v2 = (void *)defaultManager_manager_17221;
  return v2;
}

void __48__PLAssetResourceDownloadManager_defaultManager__block_invoke()
{
  v0 = objc_alloc_init(PLAssetResourceDownloadManager);
  v1 = (void *)defaultManager_manager_17221;
  defaultManager_manager_17221 = (uint64_t)v0;
}

@end