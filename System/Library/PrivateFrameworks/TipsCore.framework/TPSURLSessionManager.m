@interface TPSURLSessionManager
+ (id)defaultManager;
+ (unint64_t)defaultURLCacheDiskCapcity;
+ (unint64_t)defaultURLCacheMemoryCapcity;
- (BOOL)allowsNetworkAttribution;
- (BOOL)coalesceRequests;
- (BOOL)respondsToDidReceiveChallenge;
- (NSMutableDictionary)URLSessionMap;
- (NSMutableDictionary)coalesceTaskURLMap;
- (NSMutableDictionary)uncoalesceTaskMap;
- (NSURLSession)defaultURLSession;
- (PPCRedirect)urlRedirector;
- (TPSURLSessionCustomAuthHandling)authenticationHandler;
- (TPSURLSessionDelegate)defaultSessionDelegate;
- (TPSURLSessionManager)init;
- (TPSURLSessionManagerDelegate)delegate;
- (id)URLSessionForAttributionIdentifier:(id)a3;
- (id)_mappedURLRequest:(id)a3;
- (id)newURLSessionItemWithRequest:(id)a3 identifier:(id)a4 attributionIdentifier:(id)a5 requestType:(id)a6 completionHandler:(id)a7;
- (id)newURLSessionItemWithRequest:(id)a3 identifier:(id)a4 attributionIdentifier:(id)a5 requestType:(id)a6 networkDelegate:(id)a7 completionHandler:(id)a8;
- (id)sessionTaskForTask:(id)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5;
- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)cancelSessionItem:(id)a3;
- (void)dealloc;
- (void)removeTaskFromMap:(id)a3;
- (void)resumeSessionItem:(id)a3;
- (void)sessionTask:(id)a3 didCompleteWithError:(id)a4;
- (void)setAuthenticationHandler:(id)a3;
- (void)setCoalesceRequests:(BOOL)a3;
- (void)setCoalesceTaskURLMap:(id)a3;
- (void)setDefaultSessionDelegate:(id)a3;
- (void)setDefaultURLSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRespondsToDidReceiveChallenge:(BOOL)a3;
- (void)setURLSessionMap:(id)a3;
- (void)setUncoalesceTaskMap:(id)a3;
- (void)setUrlRedirector:(id)a3;
@end

@implementation TPSURLSessionManager

+ (id)defaultManager
{
  if (defaultManager_predicate_0 != -1) {
    dispatch_once(&defaultManager_predicate_0, &__block_literal_global_23);
  }
  v2 = (void *)defaultManager_gURLSessionManager;
  return v2;
}

- (id)newURLSessionItemWithRequest:(id)a3 identifier:(id)a4 attributionIdentifier:(id)a5 requestType:(id)a6 networkDelegate:(id)a7 completionHandler:(id)a8
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v40 = a6;
  id v17 = a7;
  id v41 = a8;
  if (v16 && ![(TPSURLSessionManager *)self allowsNetworkAttribution])
  {

    id v16 = 0;
  }
  v39 = v14;
  v18 = [(TPSURLSessionManager *)self _mappedURLRequest:v14];
  v19 = [v18 URL];
  v20 = v19;
  if (v19 && (v15 || ([v19 lastPathComponent], (id v15 = (id)objc_claimAutoreleasedReturnValue()) != 0)))
  {
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__7;
    v55 = __Block_byref_object_dispose__7;
    id v56 = 0;
    if (v17) {
      goto LABEL_8;
    }
    if (!self->_coalesceRequests) {
      goto LABEL_8;
    }
    sessionTaskQueue = self->_sessionTaskQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __132__TPSURLSessionManager_newURLSessionItemWithRequest_identifier_attributionIdentifier_requestType_networkDelegate_completionHandler___block_invoke;
    block[3] = &unk_1E59073F8;
    v50 = &v51;
    block[4] = self;
    id v49 = v20;
    dispatch_sync(sessionTaskQueue, block);

    if (!v52[5])
    {
LABEL_8:
      v21 = [(TPSURLSessionManager *)self URLSessionForAttributionIdentifier:v16];
      v22 = [v21 dataTaskWithRequest:v18];
      v23 = +[TPSLogger data];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v38 = [v14 URL];
        v34 = [v21 configuration];
        uint64_t v35 = [v34 _sourceApplicationBundleIdentifier];
        v37 = v34;
        *(_DWORD *)buf = 138412802;
        v58 = v38;
        __int16 v59 = 2112;
        id v60 = v16;
        __int16 v61 = 2112;
        uint64_t v62 = v35;
        v36 = (void *)v35;
        _os_log_debug_impl(&dword_19C8DC000, v23, OS_LOG_TYPE_DEBUG, "Network request - %@. Attribution - Requested: %@, Effective: %@", buf, 0x20u);
      }
      [v22 setTaskDescription:v16];
      v24 = [[TPSURLSessionTask alloc] initWithSessionTask:v22 identifier:v15];
      v25 = (void *)v52[5];
      v52[5] = (uint64_t)v24;

      [(id)v52[5] setUnderlyingSession:v21];
      [(id)v52[5] setRequestType:v40];
      id WeakRetained = v17;
      if (!v17) {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultSessionDelegate);
      }
      [(id)v52[5] setNetworkDelegate:WeakRetained];
      if (v17)
      {
        unint64_t v27 = (unint64_t)+[TPSURLSessionTask delegateRespondsWithDelegate:v17];
      }
      else
      {

        unint64_t v27 = *(unsigned int *)&self->_defaultSessionDelegateResponds.willCacheResponse | ((unint64_t)self->_defaultSessionDelegateResponds.taskDidReceiveChallenge << 32);
      }
      [(id)v52[5] setDelegateResponds:v27 & 0xFFFFFFFFFFLL];
      v30 = self->_sessionTaskQueue;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __132__TPSURLSessionManager_newURLSessionItemWithRequest_identifier_attributionIdentifier_requestType_networkDelegate_completionHandler___block_invoke_25;
      v42[3] = &unk_1E5908088;
      id v43 = v17;
      v44 = self;
      id v46 = v22;
      v47 = &v51;
      id v45 = v20;
      id v31 = v22;
      dispatch_sync(v30, v42);
    }
    v32 = [TPSURLSessionItem alloc];
    v28 = [(TPSURLSessionItem *)v32 initWithSessionTask:v52[5] completionHandler:v41];
    _Block_object_dispose(&v51, 8);
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)newURLSessionItemWithRequest:(id)a3 identifier:(id)a4 attributionIdentifier:(id)a5 requestType:(id)a6 completionHandler:(id)a7
{
  return [(TPSURLSessionManager *)self newURLSessionItemWithRequest:a3 identifier:a4 attributionIdentifier:a5 requestType:a6 networkDelegate:0 completionHandler:a7];
}

- (id)URLSessionForAttributionIdentifier:(id)a3
{
  id v4 = a3;
  if (v4 && ![(TPSURLSessionManager *)self allowsNetworkAttribution])
  {

    id v4 = 0;
  }
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__7;
  id v17 = __Block_byref_object_dispose__7;
  id v18 = 0;
  sessionMapQueue = self->_sessionMapQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__TPSURLSessionManager_URLSessionForAttributionIdentifier___block_invoke;
  block[3] = &unk_1E5908060;
  v11 = self;
  v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(sessionMapQueue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __28__TPSURLSessionManager_init__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1CC08];
  v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  [*(id *)(a1 + 32) setCoalesceTaskURLMap:v3];

  id v4 = (void *)[v2 mutableCopy];
  [*(id *)(a1 + 32) setUncoalesceTaskMap:v4];

  v5 = (void *)[v2 mutableCopy];
  [*(id *)(a1 + 32) setURLSessionMap:v5];

  if (+[TPSCommonDefines isInternalDevice]
    && PingPongClientLibraryCore_0())
  {
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2050000000;
    id v6 = (void *)getPPCRedirectClass_softClass;
    uint64_t v17 = getPPCRedirectClass_softClass;
    if (!getPPCRedirectClass_softClass)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __getPPCRedirectClass_block_invoke;
      v13[3] = &unk_1E5907C70;
      v13[4] = &v14;
      __getPPCRedirectClass_block_invoke((uint64_t)v13);
      id v6 = (void *)v15[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v14, 8);
    id v8 = objc_alloc_init(v7);
    [*(id *)(a1 + 32) setUrlRedirector:v8];

    v9 = [*(id *)(a1 + 32) urlRedirector];

    id v10 = +[TPSLogger data];
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        LOWORD(v13[0]) = 0;
        v12 = "PPCRedirect initialized.";
LABEL_10:
        _os_log_impl(&dword_19C8DC000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)v13, 2u);
      }
    }
    else if (v11)
    {
      LOWORD(v13[0]) = 0;
      v12 = "PPCRedirect not found.";
      goto LABEL_10;
    }
  }
}

- (void)setUrlRedirector:(id)a3
{
}

- (void)setUncoalesceTaskMap:(id)a3
{
}

- (void)setURLSessionMap:(id)a3
{
}

- (void)setCoalesceTaskURLMap:(id)a3
{
}

- (id)_mappedURLRequest:(id)a3
{
  id v4 = a3;
  v5 = [(TPSURLSessionManager *)self urlRedirector];

  if (!v5) {
    goto LABEL_5;
  }
  id v6 = [v4 URL];
  id v7 = [(TPSURLSessionManager *)self urlRedirector];
  id v8 = [v7 mappedURL:v6];

  if (!v8 || ([v8 isEqual:v6] & 1) != 0)
  {

LABEL_5:
    id v9 = v4;
    goto LABEL_6;
  }
  id v9 = (id)[v4 mutableCopy];
  [v9 setURL:v8];
  BOOL v11 = +[TPSLogger data];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[TPSURLSessionManager _mappedURLRequest:](v9, v11);
  }

  v12 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v13 = [(TPSURLSessionManager *)self authenticationHandler];
  uint64_t v14 = [v13 customHeaderFields];
  uint64_t v15 = [v12 dictionaryWithDictionary:v14];

  if ([v15 count])
  {
    uint64_t v16 = [v9 allHTTPHeaderFields];
    [v15 addEntriesFromDictionary:v16];

    [v9 setAllHTTPHeaderFields:v15];
  }

LABEL_6:
  return v9;
}

- (PPCRedirect)urlRedirector
{
  return self->_urlRedirector;
}

- (void)setAuthenticationHandler:(id)a3
{
}

- (void)resumeSessionItem:(id)a3
{
  id v3 = a3;
  if ([v3 state] == 1) {
    [v3 resume];
  }
}

- (void)cancelSessionItem:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [v4 cancel];
    id v8 = [v4 sessionTask];

    id v6 = v8;
    if (v8)
    {
      uint64_t v5 = [v8 isCancelled];
      id v6 = v8;
      if (v5)
      {
        id v7 = [v8 task];
        [(TPSURLSessionManager *)self removeTaskFromMap:v7];

        id v6 = v8;
      }
    }
    MEMORY[0x1F41817F8](v5, v6);
  }
}

void __132__TPSURLSessionManager_newURLSessionItemWithRequest_identifier_attributionIdentifier_requestType_networkDelegate_completionHandler___block_invoke_25(uint64_t a1)
{
  if (*(void *)(a1 + 32) || ![*(id *)(a1 + 40) coalesceRequests])
  {
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    id v3 = [*(id *)(a1 + 40) uncoalesceTaskMap];
    uint64_t v4 = *(void *)(a1 + 56);
  }
  else
  {
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    id v3 = [*(id *)(a1 + 40) coalesceTaskURLMap];
    uint64_t v4 = *(void *)(a1 + 48);
  }
  id v5 = v3;
  [v3 setObject:v2 forKeyedSubscript:v4];
}

- (NSMutableDictionary)uncoalesceTaskMap
{
  return self->_uncoalesceTaskMap;
}

- (BOOL)coalesceRequests
{
  return self->_coalesceRequests;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_delegate, obj);
    self->_respondsToDidReceiveChallenge = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setDefaultSessionDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultSessionDelegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_defaultSessionDelegate, obj);
    uint64_t v6 = (uint64_t)+[TPSURLSessionTask delegateRespondsWithDelegate:obj];
    *(_DWORD *)&self->_defaultSessionDelegateResponds.willCacheResponse = v6;
    self->_defaultSessionDelegateResponds.taskDidReceiveChallenge = BYTE4(v6);
  }
}

uint64_t __38__TPSURLSessionManager_defaultManager__block_invoke()
{
  v0 = objc_alloc_init(TPSURLSessionManager);
  uint64_t v1 = defaultManager_gURLSessionManager;
  defaultManager_gURLSessionManager = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (TPSURLSessionManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)TPSURLSessionManager;
  uint64_t v2 = [(TPSURLSessionManager *)&v13 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.IPURLSessionTaskSerialQueue", v3);
    sessionTaskQueue = v2->_sessionTaskQueue;
    v2->_sessionTaskQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.IPURLSessionMapSerialQueue", v6);
    sessionMapQueue = v2->_sessionMapQueue;
    v2->_sessionMapQueue = (OS_dispatch_queue *)v7;

    id v9 = v2->_sessionTaskQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28__TPSURLSessionManager_init__block_invoke;
    block[3] = &unk_1E5906740;
    v12 = v2;
    dispatch_sync(v9, block);
  }
  return v2;
}

void __59__TPSURLSessionManager_URLSessionForAttributionIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2
    && (+[TPSCommonDefines clientBundleIdentifier],
        id v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v2 isEqualToString:v3],
        v3,
        !v4))
  {
    id v5 = [*(id *)(a1 + 40) URLSessionMap];
    uint64_t v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      return;
    }
    id v9 = [*(id *)(a1 + 40) defaultURLSession];
    v19 = [v9 configuration];

    objc_msgSend(v19, "set_sourceApplicationBundleIdentifier:", *(void *)(a1 + 32));
    id v10 = (void *)MEMORY[0x1E4F290E0];
    BOOL v11 = *(void **)(a1 + 40);
    v12 = [v11 defaultURLSession];
    objc_super v13 = [v12 delegateQueue];
    uint64_t v14 = [v10 sessionWithConfiguration:v19 delegate:v11 delegateQueue:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v18 = [*(id *)(a1 + 40) URLSessionMap];
    [v18 setObject:v17 forKeyedSubscript:*(void *)(a1 + 32)];
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 40) defaultURLSession];
  }
  MEMORY[0x1F41817F8]();
}

- (NSURLSession)defaultURLSession
{
  defaultURLSession = self->_defaultURLSession;
  if (!defaultURLSession)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      uint64_t v6 = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v7 = [v6 URLSessionManagerSessionConfiguration:self];
    }
    else
    {
      id v8 = (void *)MEMORY[0x1E4F29078];
      uint64_t v9 = [(id)objc_opt_class() defaultURLCacheMemoryCapcity];
      uint64_t v6 = objc_msgSend(v8, "tps_urlCacheWithIdentifier:memoryCapacity:diskCapacity:", 0, v9, objc_msgSend((id)objc_opt_class(), "defaultURLCacheDiskCapcity"));
      [MEMORY[0x1E4F29078] setSharedURLCache:v6];
      uint64_t v7 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
      [v7 setURLCache:v6];
    }

    if ([(TPSURLSessionManager *)self allowsNetworkAttribution])
    {
      id v10 = +[TPSCommonDefines clientBundleIdentifier];
      objc_msgSend(v7, "set_sourceApplicationBundleIdentifier:", v10);
    }
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_delegate);
      id v14 = [v13 URLSessionManagerSessionOperationQueue:self];
    }
    else
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F28F08]);
      [v14 setMaxConcurrentOperationCount:4];
    }
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      id v17 = objc_loadWeakRetained((id *)&self->_delegate);
      self->_coalesceRequests = [v17 URLSessionManagerShouldCoalesceRequest:self];
    }
    id v18 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v7 delegate:self delegateQueue:v14];
    v19 = self->_defaultURLSession;
    self->_defaultURLSession = v18;

    defaultURLSession = self->_defaultURLSession;
  }
  return defaultURLSession;
}

+ (unint64_t)defaultURLCacheMemoryCapcity
{
  return 0;
}

+ (unint64_t)defaultURLCacheDiskCapcity
{
  return 78643200;
}

- (void)dealloc
{
  [(NSURLSession *)self->_defaultURLSession invalidateAndCancel];
  [(NSMutableDictionary *)self->_URLSessionMap enumerateKeysAndObjectsUsingBlock:&__block_literal_global_3];
  sessionTaskQueue = self->_sessionTaskQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__TPSURLSessionManager_dealloc__block_invoke_2;
  block[3] = &unk_1E5906740;
  void block[4] = self;
  dispatch_sync(sessionTaskQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)TPSURLSessionManager;
  [(TPSURLSessionManager *)&v4 dealloc];
}

uint64_t __31__TPSURLSessionManager_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidateAndCancel];
}

void __31__TPSURLSessionManager_dealloc__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) coalesceTaskURLMap];
  [v1 removeAllObjects];
}

- (BOOL)allowsNetworkAttribution
{
  return +[TPSCommonDefines callerIsTipsdWithSource:@"Networking"];
}

void __132__TPSURLSessionManager_newURLSessionItemWithRequest_identifier_attributionIdentifier_requestType_networkDelegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) coalesceTaskURLMap];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isCancelled])
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
}

- (void)sessionTask:(id)a3 didCompleteWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    char v12 = __57__TPSURLSessionManager_sessionTask_didCompleteWithError___block_invoke;
    id v13 = &unk_1E5906790;
    id v8 = v6;
    id v14 = v8;
    id v15 = v7;
    dispatch_async(MEMORY[0x1E4F14428], &v10);
    uint64_t v9 = objc_msgSend(v8, "task", v10, v11, v12, v13);
    [(TPSURLSessionManager *)self removeTaskFromMap:v9];
  }
}

uint64_t __57__TPSURLSessionManager_sessionTask_didCompleteWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didCompleteWithError:*(void *)(a1 + 40)];
}

- (void)removeTaskFromMap:(id)a3
{
  id v4 = a3;
  sessionTaskQueue = self->_sessionTaskQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__TPSURLSessionManager_removeTaskFromMap___block_invoke;
  v7[3] = &unk_1E5906790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sessionTaskQueue, v7);
}

void __42__TPSURLSessionManager_removeTaskFromMap___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) coalesceRequests];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v6 = [v3 coalesceTaskURLMap];
    id v4 = [*(id *)(a1 + 40) originalRequest];
    char v5 = [v4 URL];
    [v6 removeObjectForKey:v5];
  }
  else
  {
    id v6 = [v3 uncoalesceTaskMap];
    [v6 removeObjectForKey:*(void *)(a1 + 40)];
  }
}

- (id)sessionTaskForTask:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__7;
  char v16 = __Block_byref_object_dispose__7;
  id v17 = 0;
  sessionTaskQueue = self->_sessionTaskQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__TPSURLSessionManager_sessionTaskForTask___block_invoke;
  block[3] = &unk_1E5907930;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(sessionTaskQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __43__TPSURLSessionManager_sessionTaskForTask___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) coalesceRequests])
  {
    int v2 = [*(id *)(a1 + 40) originalRequest];
    id v9 = [v2 URL];

    uint64_t v3 = [*(id *)(a1 + 32) coalesceTaskURLMap];
    uint64_t v4 = [v3 objectForKeyedSubscript:v9];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) uncoalesceTaskMap];
    uint64_t v7 = [v9 objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v3 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(TPSURLSessionManager *)self sessionTaskForTask:v9];
  id v13 = v12;
  if (v12)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__TPSURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
    aBlock[3] = &unk_1E59080D8;
    id v14 = v12;
    id v31 = v14;
    id v15 = v10;
    id v32 = v15;
    v33 = self;
    id v16 = v11;
    id v34 = v16;
    id v17 = (void (**)(void))_Block_copy(aBlock);
    id v18 = [(TPSURLSessionManager *)self authenticationHandler];
    if ([(id)objc_opt_class() canAuthenticateWithURLResponse:v15])
    {
      v23 = v16;
      uint64_t v19 = [v14 retryCount];

      if (!v19)
      {
        v20 = +[TPSLogger data];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v21 = [v15 URL];
          *(_DWORD *)buf = 138412290;
          v36 = v21;
          _os_log_impl(&dword_19C8DC000, v20, OS_LOG_TYPE_INFO, "Authentication required for URL: %@", buf, 0xCu);
        }
        objc_msgSend(v14, "setRetryCount:", objc_msgSend(v14, "retryCount") + 1);
        v22 = [(TPSURLSessionManager *)self authenticationHandler];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __81__TPSURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_29;
        v24[3] = &unk_1E5908128;
        v28 = v17;
        id v25 = v9;
        id v29 = v23;
        v26 = self;
        id v27 = v14;
        [v22 authenticateForURLResponse:v15 completion:v24];

        goto LABEL_10;
      }
    }
    else
    {
    }
    v17[2](v17);
LABEL_10:

    goto LABEL_11;
  }
  (*((void (**)(id, void))v11 + 2))(v11, 0);
LABEL_11:
}

void __81__TPSURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) delegateResponds] & 0x10000) != 0)
  {
    uint64_t v4 = [*(id *)(a1 + 32) networkDelegate];
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __81__TPSURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2;
    v7[3] = &unk_1E59080B0;
    v7[4] = *(void *)(a1 + 48);
    id v8 = v5;
    id v9 = *(id *)(a1 + 56);
    [v4 sessionTask:v8 didReceiveResponse:v6 completionHandler:v7];
  }
  else
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    [*(id *)(a1 + 32) setDataTaskData:v2];

    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
}

uint64_t __81__TPSURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    [*(id *)(a1 + 32) sessionTask:*(void *)(a1 + 40) didCompleteWithError:0];
  }
  else if (a2 == 1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    [*(id *)(a1 + 40) setDataTaskData:v4];
  }
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v5();
}

void __81__TPSURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_29(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    id v9 = +[TPSLogger data];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __81__TPSURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_29_cold_1((uint64_t)v8, v9);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else if ([*(id *)(a1 + 32) state] != 3)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    id v10 = [*(id *)(a1 + 32) originalRequest];
    id v11 = (void *)[v10 mutableCopy];

    [v11 setAllHTTPHeaderFields:v7];
    uint64_t v12 = [*(id *)(a1 + 32) taskDescription];
    id v13 = [*(id *)(a1 + 40) URLSessionForAttributionIdentifier:v12];
    id v14 = [v13 dataTaskWithRequest:v11];
    [v14 setTaskDescription:v12];
    [*(id *)(a1 + 48) setTask:v14];
    id v15 = +[TPSLogger data];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = [v11 URL];
      v21 = [v13 configuration];
      v20 = [v21 _sourceApplicationBundleIdentifier];
      *(_DWORD *)buf = 138412802;
      id v27 = v19;
      __int16 v28 = 2112;
      id v29 = v12;
      __int16 v30 = 2112;
      id v31 = v20;
      _os_log_debug_impl(&dword_19C8DC000, v15, OS_LOG_TYPE_DEBUG, "Network request - %@. Attribution - Requested: %@, Effective: %@", buf, 0x20u);
    }
    uint64_t v16 = *(void *)(a1 + 40);
    id v17 = *(NSObject **)(v16 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__TPSURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_30;
    block[3] = &unk_1E5908100;
    void block[4] = v16;
    id v23 = *(id *)(a1 + 32);
    id v24 = v14;
    id v25 = *(id *)(a1 + 48);
    id v18 = v14;
    dispatch_sync(v17, block);
    [v18 resume];
  }
}

void __81__TPSURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_30(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) uncoalesceTaskMap];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = [*(id *)(a1 + 32) uncoalesceTaskMap];
    [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 48)];

    id v6 = [*(id *)(a1 + 32) uncoalesceTaskMap];
    [v6 removeObjectForKey:*(void *)(a1 + 40)];
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v10 = a5;
  id v7 = [(TPSURLSessionManager *)self sessionTaskForTask:a4];
  id v8 = [v7 dataTaskData];
  id v9 = v8;
  if (v8) {
    [v8 appendData:v10];
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didBecomeDownloadTask:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(TPSURLSessionManager *)self sessionTaskForTask:v7];
  [v9 setTask:v8];
  [v9 setDataTaskData:0];
  sessionTaskQueue = self->_sessionTaskQueue;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __66__TPSURLSessionManager_URLSession_dataTask_didBecomeDownloadTask___block_invoke;
  id v17 = &unk_1E5908100;
  id v18 = self;
  id v19 = v8;
  id v20 = v9;
  id v21 = v7;
  id v11 = v7;
  id v12 = v9;
  id v13 = v8;
  dispatch_sync(sessionTaskQueue, &v14);
  objc_msgSend(v13, "resume", v14, v15, v16, v17, v18);
}

void __66__TPSURLSessionManager_URLSession_dataTask_didBecomeDownloadTask___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) coalesceRequests] & 1) == 0)
  {
    uint64_t v2 = *(void *)(a1 + 48);
    uint64_t v3 = [*(id *)(a1 + 32) uncoalesceTaskMap];
    [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];

    id v4 = [*(id *)(a1 + 32) uncoalesceTaskMap];
    [v4 removeObjectForKey:*(void *)(a1 + 56)];
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
  id v12 = a5;
  id v9 = (void (**)(id, id))a6;
  id v10 = [(TPSURLSessionManager *)self sessionTaskForTask:a4];
  if ([v10 delegateResponds])
  {
    id v11 = [v10 networkDelegate];
    [v11 sessionTask:v10 willCacheResponse:v12 completionHandler:v9];
  }
  else
  {
    v9[2](v9, v12);
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  if (a7 >= 1 || a6 <= 0) {
    int64_t v8 = a7;
  }
  else {
    int64_t v8 = a6;
  }
  if (v8 >= 1)
  {
    id v9 = [(TPSURLSessionManager *)self sessionTaskForTask:a4];
    [v9 setDownloadTaskTotalBytes:v8];
  }
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v13 = a5;
  id v7 = [(TPSURLSessionManager *)self sessionTaskForTask:a4];
  uint64_t v8 = [v7 downloadTaskTotalBytes];
  if (v13 && v8)
  {
    if (([v7 delegateResponds] & 0x100) != 0)
    {
      id v12 = [v7 networkDelegate];
      [v12 sessionTask:v7 didFinishDownloadingToURL:v13];
    }
    else
    {
      id v9 = (void *)MEMORY[0x1E4F1C9B8];
      id v10 = [v13 path];
      id v11 = [v9 dataWithContentsOfFile:v10];
      [v7 setFormattedData:v11];
    }
  }
  else
  {
    [v7 setDownloadTaskTotalBytes:0];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  uint64_t v8 = [v7 transactionMetrics];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id v10 = [(TPSURLSessionManager *)self sessionTaskForTask:v14];
    id v11 = v10;
    if (v10)
    {
      id v12 = [v10 requestType];
      id v13 = +[TPSAnalyticsEventServiceRequest serviceRequestEventWithType:v12 metrics:v7];
      [v13 log];
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v16 = a4;
  id v7 = a5;
  uint64_t v8 = [(TPSURLSessionManager *)self sessionTaskForTask:v16];
  uint64_t v9 = [v16 response];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v11 = [v16 response];
    [v8 setResponse:v11];
    id v12 = [v11 allHeaderFields];
    id v13 = [v12 objectForKeyedSubscript:@"Last-Modified"];
    [v8 setLastModified:v13];
  }
  if (([v8 delegateResponds] & 0x1000000) != 0)
  {
    id v14 = [v8 networkDelegate];
    [v14 sessionTask:v8 didCompleteWithError:v7];
  }
  if (v8)
  {
    if (v7)
    {
      [(TPSURLSessionManager *)self sessionTask:v8 didCompleteWithError:v7];
    }
    else
    {
      uint64_t v15 = [v8 dataError];
      [(TPSURLSessionManager *)self sessionTask:v8 didCompleteWithError:v15];
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v15 = a5;
  uint64_t v9 = (void (**)(id, uint64_t, void))a6;
  id v10 = [(TPSURLSessionManager *)self sessionTaskForTask:a4];
  if (([v10 delegateResponds] & 0x100000000) != 0
    && ([v15 protectionSpace],
        id v11 = objc_claimAutoreleasedReturnValue(),
        [v11 host],
        id v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 hasSuffix:@".apple.com"],
        v12,
        v11,
        v13))
  {
    id v14 = [v10 networkDelegate];
    [v14 sessionTask:v10 didReceiveChallenge:v15 completionHandler:v9];
  }
  else
  {
    v9[2](v9, 3, 0);
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, uint64_t, void))a5;
  if (self->_respondsToDidReceiveChallenge
    && ([v8 protectionSpace],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 host],
        id v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 hasSuffix:@".apple.com"],
        v11,
        v10,
        v12))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained URLSessionManagerDidReceiveChallenge:v8 completionHandler:v9];
  }
  else
  {
    v9[2](v9, 3, 0);
  }
}

- (TPSURLSessionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TPSURLSessionManagerDelegate *)WeakRetained;
}

- (TPSURLSessionDelegate)defaultSessionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_defaultSessionDelegate);
  return (TPSURLSessionDelegate *)WeakRetained;
}

- (TPSURLSessionCustomAuthHandling)authenticationHandler
{
  return self->_authenticationHandler;
}

- (BOOL)respondsToDidReceiveChallenge
{
  return self->_respondsToDidReceiveChallenge;
}

- (void)setRespondsToDidReceiveChallenge:(BOOL)a3
{
  self->_respondsToDidReceiveChallenge = a3;
}

- (void)setCoalesceRequests:(BOOL)a3
{
  self->_coalesceRequests = a3;
}

- (NSMutableDictionary)coalesceTaskURLMap
{
  return self->_coalesceTaskURLMap;
}

- (NSMutableDictionary)URLSessionMap
{
  return self->_URLSessionMap;
}

- (void)setDefaultURLSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlRedirector, 0);
  objc_storeStrong((id *)&self->_defaultURLSession, 0);
  objc_storeStrong((id *)&self->_URLSessionMap, 0);
  objc_storeStrong((id *)&self->_uncoalesceTaskMap, 0);
  objc_storeStrong((id *)&self->_coalesceTaskURLMap, 0);
  objc_storeStrong((id *)&self->_authenticationHandler, 0);
  objc_destroyWeak((id *)&self->_defaultSessionDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionMapQueue, 0);
  objc_storeStrong((id *)&self->_sessionTaskQueue, 0);
}

- (void)_mappedURLRequest:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 URL];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_19C8DC000, a2, OS_LOG_TYPE_DEBUG, "Mapped URL Request: %@", (uint8_t *)&v4, 0xCu);
}

void __81__TPSURLSessionManager_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_29_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19C8DC000, a2, OS_LOG_TYPE_DEBUG, "Failed to authenticate: %@", (uint8_t *)&v2, 0xCu);
}

@end