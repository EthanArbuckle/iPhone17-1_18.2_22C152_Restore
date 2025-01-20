@interface WBSSiteMetadataManager
- (BOOL)_requestIsCancelledForToken:(id)a3;
- (BOOL)_updateOperationForRequestIfPossible:(id)a3;
- (BOOL)isSuspended;
- (NSURL)injectedBundleURL;
- (WBSSiteMetadataManager)init;
- (WBSSiteMetadataManager)initWithInjectedBundleURL:(id)a3;
- (id)_makeWebViewOfSize:(CGSize)a3 withConfiguration:(id)a4;
- (id)_popReusableWebView;
- (id)_processPool;
- (id)_providerForRequest:(id)a3;
- (id)_registerRequest:(id)a3 isOneTimeRequest:(BOOL)a4 queue:(id)a5 responseHandler:(id)a6 tokenSetUpBlock:(id)a7;
- (id)_registerSubrequest:(id)a3 isOneTimeRequest:(BOOL)a4 forRequests:(id)a5 queue:(id)a6 responseHandler:(id)a7;
- (id)registerOneTimeRequest:(id)a3 priority:(int64_t)a4 queue:(id)a5 responseHandler:(id)a6;
- (id)registerOneTimeRequest:(id)a3 priority:(int64_t)a4 responseHandler:(id)a5;
- (id)registerRequest:(id)a3 priority:(int64_t)a4 queue:(id)a5 responseHandler:(id)a6;
- (id)registerRequest:(id)a3 priority:(int64_t)a4 responseHandler:(id)a5;
- (id)siteMetadataProvider:(id)a3 registerOneTimeSubrequest:(id)a4 forRequests:(id)a5 queue:(id)a6 responseHandler:(id)a7;
- (id)siteMetadataProvider:(id)a3 registerSubrequest:(id)a4 forRequests:(id)a5 queue:(id)a6 responseHandler:(id)a7;
- (int64_t)_highestRequestPriorityForRequests:(id)a3;
- (unint64_t)_numberOfConcurrentRequests;
- (void)_discardWebViewSoon:(id)a3;
- (void)_enumerateTokens:(id)a3 usingSetUpBlock:(id)a4 dispatchBlock:(id)a5;
- (void)_internalCancelRequestWithToken:(id)a3;
- (void)_internalSetPriority:(int64_t)a3 ofRequestWithToken:(id)a4;
- (void)_registerToken:(id)a3 isCacheRequest:(BOOL)a4 withProvider:(id)a5;
- (void)_reprioritizeOperationForRequest:(id)a3;
- (void)_scheduleDelayedResponse:(id)a3 forRequestToken:(id)a4;
- (void)_sendRequiresDownloadResponse:(id)a3 toResponseHandlersForRequest:(id)a4;
- (void)_sendResponse:(id)a3 toResponseHandlersForRequests:(id)a4 didReceiveNewData:(BOOL)a5;
- (void)_setUpOperationForRequest:(id)a3 withSiteMetadataProvider:(id)a4 usingOperationBlock:(id)a5;
- (void)_updatePriorityOfRequest:(id)a3;
- (void)cacheData:(id)a3 forRequest:(id)a4;
- (void)cacheData:(id)a3 forRequest:(id)a4 completionHandler:(id)a5;
- (void)cancelRequestWithToken:(id)a3;
- (void)cancelRequestsWithTokens:(id)a3;
- (void)cancelRequestsWithTokens:(id)a3 completionHandler:(id)a4;
- (void)emptyProviderCaches;
- (void)emptyProviderCachesIncludingFavicons:(BOOL)a3;
- (void)performMaintenanceWork;
- (void)preloadRequest:(id)a3 withPriority:(int64_t)a4 queue:(id)a5 responseHandler:(id)a6;
- (void)preloadRequest:(id)a3 withPriority:(int64_t)a4 responseHandler:(id)a5;
- (void)preloadRequests:(id)a3 withPriority:(int64_t)a4 queue:(id)a5 responseHandler:(id)a6;
- (void)preloadRequests:(id)a3 withPriority:(int64_t)a4 responseHandler:(id)a5;
- (void)registerSiteMetadataProvider:(id)a3;
- (void)savePendingProviderChangesBeforeTermination;
- (void)savePendingProviderChangesWithCompletion:(id)a3;
- (void)setPriority:(int64_t)a3 ofRequestWithToken:(id)a4;
- (void)setPriority:(int64_t)a3 ofRequestsWithTokens:(id)a4;
- (void)setSuspended:(BOOL)a3;
- (void)siteMetadataProvider:(id)a3 cacheData:(id)a4 forRequest:(id)a5;
- (void)siteMetadataProvider:(id)a3 cancelRequestsWithTokens:(id)a4;
- (void)siteMetadataProvider:(id)a3 didFinishCachingDataWithToken:(id)a4;
- (void)siteMetadataProvider:(id)a3 didFinishUsingWebView:(id)a4;
- (void)siteMetadataProvider:(id)a3 didReceiveResponse:(id)a4 forRequest:(id)a5 beginOperationUsingBlock:(id)a6;
- (void)siteMetadataProvider:(id)a3 didReceiveResponse:(id)a4 ofType:(int64_t)a5 didReceiveNewData:(BOOL)a6 forRequest:(id)a7;
- (void)siteMetadataProvider:(id)a3 didReceiveResponse:(id)a4 ofType:(int64_t)a5 didReceiveNewData:(BOOL)a6 forRequests:(id)a7;
- (void)siteMetadataProvider:(id)a3 getWebViewOfSize:(CGSize)a4 withConfiguration:(id)a5 completionHandler:(id)a6;
@end

@implementation WBSSiteMetadataManager

- (void)siteMetadataProvider:(id)a3 didReceiveResponse:(id)a4 ofType:(int64_t)a5 didReceiveNewData:(BOOL)a6 forRequest:(id)a7
{
  BOOL v8 = a6;
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  id v13 = a4;
  id v14 = a3;
  id v15 = [v12 setWithObject:a7];
  [(WBSSiteMetadataManager *)self siteMetadataProvider:v14 didReceiveResponse:v13 ofType:a5 didReceiveNewData:v8 forRequests:v15];
}

- (void)siteMetadataProvider:(id)a3 didReceiveResponse:(id)a4 ofType:(int64_t)a5 didReceiveNewData:(BOOL)a6 forRequests:(id)a7
{
  id v11 = a4;
  id v12 = a7;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__WBSSiteMetadataManager_siteMetadataProvider_didReceiveResponse_ofType_didReceiveNewData_forRequests___block_invoke;
  block[3] = &unk_1E5E44A50;
  block[4] = self;
  id v17 = v11;
  id v18 = v12;
  int64_t v19 = a5;
  BOOL v20 = a6;
  id v14 = v12;
  id v15 = v11;
  dispatch_barrier_async(internalQueue, block);
}

- (id)registerRequest:(id)a3 priority:(int64_t)a4 responseHandler:(id)a5
{
  return [(WBSSiteMetadataManager *)self registerRequest:a3 priority:a4 queue:MEMORY[0x1E4F14428] responseHandler:a5];
}

uint64_t __55__WBSSiteMetadataManager_registerSiteMetadataProvider___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setProviderDelegate:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(*(void *)(a1 + 40) + 32);
  return [v3 addObject:v2];
}

void __46__WBSSiteMetadataManager__providerForRequest___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(a1[4] + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "canHandleRequest:", a1[5], (void)v8))
        {
          objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void __88__WBSSiteMetadataManager__sendResponse_toResponseHandlersForRequests_didReceiveNewData___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    uint64_t v5 = [v3 first];
    int v6 = 141558275;
    uint64_t v7 = 1752392040;
    __int16 v8 = 2117;
    long long v9 = v5;
    _os_log_impl(&dword_1ABB70000, v4, OS_LOG_TYPE_DEFAULT, "Canceling request with token %{sensitive, mask.hash}@", (uint8_t *)&v6, 0x16u);
  }
}

void __46__WBSSiteMetadataManager__providerForRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v5 = 138412803;
    uint64_t v6 = v4;
    __int16 v7 = 2160;
    uint64_t v8 = 1752392040;
    __int16 v9 = 2117;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_INFO, "Found provider %@ to handle request %{sensitive, mask.hash}@", (uint8_t *)&v5, 0x20u);
  }
}

- (WBSSiteMetadataManager)initWithInjectedBundleURL:(id)a3
{
  id v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)WBSSiteMetadataManager;
  uint64_t v6 = [(WBSSiteMetadataManager *)&v37 init];
  __int16 v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_injectedBundleURL, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    siteMetadataProviders = v7->_siteMetadataProviders;
    v7->_siteMetadataProviders = (NSMutableArray *)v8;

    uint64_t v10 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v10;

    [(NSOperationQueue *)v7->_operationQueue setMaxConcurrentOperationCount:[(WBSSiteMetadataManager *)v7 _numberOfConcurrentRequests]];
    id v12 = [NSString stringWithFormat:@"com.apple.SafariShared.%@.%p.operationQueue", objc_opt_class(), v7];
    [(NSOperationQueue *)v7->_operationQueue setName:v12];

    uint64_t v13 = [MEMORY[0x1E4F28BD0] set];
    activeOperations = v7->_activeOperations;
    v7->_activeOperations = (NSCountedSet *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
    usedWebViews = v7->_usedWebViews;
    v7->_usedWebViews = (NSMutableSet *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA80] set];
    reusableWebViews = v7->_reusableWebViews;
    v7->_reusableWebViews = (NSMutableSet *)v17;

    id v19 = [NSString stringWithFormat:@"com.apple.Safari.%@.%p.InternalQueue", objc_opt_class(), v7];
    BOOL v20 = (const char *)[v19 UTF8String];
    v21 = MEMORY[0x1E4F14430];
    dispatch_queue_t v22 = dispatch_queue_create(v20, MEMORY[0x1E4F14430]);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v22;

    id v24 = [NSString stringWithFormat:@"com.apple.Safari.%@.%p.siteMetadataProvidersAccessQueue", objc_opt_class(), v7];
    dispatch_queue_t v25 = dispatch_queue_create((const char *)[v24 UTF8String], v21);
    siteMetadataProvidersAccessQueue = v7->_siteMetadataProvidersAccessQueue;
    v7->_siteMetadataProvidersAccessQueue = (OS_dispatch_queue *)v25;

    uint64_t v27 = [MEMORY[0x1E4F1CA80] set];
    tokens = v7->_tokens;
    v7->_tokens = (NSMutableSet *)v27;

    uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionary];
    requestsToRequestInfos = v7->_requestsToRequestInfos;
    v7->_requestsToRequestInfos = (NSMutableDictionary *)v29;

    uint64_t v31 = [MEMORY[0x1E4F1CA60] dictionary];
    requestsToSubrequestTokens = v7->_requestsToSubrequestTokens;
    v7->_requestsToSubrequestTokens = (NSMutableDictionary *)v31;

    uint64_t v33 = [MEMORY[0x1E4F1CA60] dictionary];
    requestsToCacheRequestTokens = v7->_requestsToCacheRequestTokens;
    v7->_requestsToCacheRequestTokens = (NSMutableDictionary *)v33;

    v35 = v7;
  }

  return v7;
}

- (unint64_t)_numberOfConcurrentRequests
{
  id v2 = [MEMORY[0x1E4F28F80] processInfo];
  if ([v2 processorCount] == 1) {
    unint64_t v3 = 1;
  }
  else {
    unint64_t v3 = 2;
  }

  return v3;
}

uint64_t __98__WBSSiteMetadataManager__registerRequest_isOneTimeRequest_queue_responseHandler_tokenSetUpBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  [*(id *)(a1 + 40) _registerToken:*(void *)(a1 + 32) isCacheRequest:0 withProvider:*(void *)(a1 + 48)];
  id v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  BOOL v4 = *(unsigned char *)(a1 + 72) == 0;
  return [v2 prepareResponseForRequest:v3 allowDelayedResponse:v4];
}

uint64_t __73__WBSSiteMetadataManager_registerRequest_priority_queue_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPriority:*(void *)(a1 + 32)];
}

void __77__WBSSiteMetadataManager_preloadRequests_withPriority_queue_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "_providerForRequest:", v7, (void)v10);
        __int16 v9 = [[_WBSSiteMetadataToken alloc] initWithRequest:v7 isOneTimeRequest:1 queue:*(void *)(a1 + 48) responseHandler:*(void *)(a1 + 56)];
        [(_WBSSiteMetadataToken *)v9 setPriority:*(void *)(a1 + 64)];
        [*(id *)(a1 + 40) _registerToken:v9 isCacheRequest:0 withProvider:v8];
        [v8 prepareResponseForRequest:v7 allowDelayedResponse:0];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (id)_registerRequest:(id)a3 isOneTimeRequest:(BOOL)a4 queue:(id)a5 responseHandler:(id)a6 tokenSetUpBlock:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = (void (**)(id, void *))a6;
  id v15 = a7;
  v16 = [(WBSSiteMetadataManager *)self _providerForRequest:v12];
  char v33 = 0;
  uint64_t v17 = [v16 responseForRequest:v12 willProvideUpdates:&v33];
  if (v17 || (BOOL v18 = 0, !v33))
  {
    v14[2](v14, v17);
    BOOL v18 = v33 == 0;
  }
  id v19 = 0;
  if (v17) {
    BOOL v20 = v10;
  }
  else {
    BOOL v20 = 0;
  }
  if (!v20 && !v18)
  {
    v21 = [[_WBSSiteMetadataToken alloc] initWithRequest:v12 isOneTimeRequest:v10 queue:v13 responseHandler:v14];
    internalQueue = self->_internalQueue;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __98__WBSSiteMetadataManager__registerRequest_isOneTimeRequest_queue_responseHandler_tokenSetUpBlock___block_invoke;
    v26[3] = &unk_1E5E448A0;
    id v31 = v15;
    v23 = v21;
    uint64_t v27 = v23;
    v28 = self;
    id v29 = v16;
    id v30 = v12;
    BOOL v32 = v10;
    dispatch_barrier_async(internalQueue, v26);
    id v24 = v30;
    id v19 = v23;
  }
  return v19;
}

- (id)_providerForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  BOOL v18 = &v17;
  uint64_t v19 = 0x3032000000;
  BOOL v20 = __Block_byref_object_copy__24;
  v21 = __Block_byref_object_dispose__24;
  id v22 = 0;
  siteMetadataProvidersAccessQueue = self->_siteMetadataProvidersAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__WBSSiteMetadataManager__providerForRequest___block_invoke;
  block[3] = &unk_1E5E449D8;
  block[4] = self;
  id v6 = v4;
  id v15 = v6;
  v16 = &v17;
  dispatch_sync(siteMetadataProvidersAccessQueue, block);
  uint64_t v7 = [v6 activity];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__WBSSiteMetadataManager__providerForRequest___block_invoke_2;
  v11[3] = &unk_1E5E43620;
  id v12 = v6;
  id v13 = &v17;
  id v8 = v6;
  os_activity_apply(v7, v11);

  id v9 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v9;
}

void __103__WBSSiteMetadataManager_siteMetadataProvider_didReceiveResponse_ofType_didReceiveNewData_forRequests___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2 == 1)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v13 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "objectForKeyedSubscript:", v12, 0);
          id v14 = [v13 requestTokens];

          uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v21;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v21 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void **)(*((void *)&v20 + 1) + 8 * j);
                if (([v19 isOneTimeRequest] & 1) == 0) {
                  [*(id *)(a1 + 32) _scheduleDelayedResponse:*(void *)(a1 + 40) forRequestToken:v19];
                }
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v16);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v9);
    }
  }
  else if (!v2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 64);
    [v3 _sendResponse:v4 toResponseHandlersForRequests:v5 didReceiveNewData:v6];
  }
}

- (void)_sendResponse:(id)a3 toResponseHandlersForRequests:(id)a4 didReceiveNewData:(BOOL)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
  v36 = [MEMORY[0x1E4F1CA80] set];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = v7;
  uint64_t v32 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v49;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v49 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v9;
        uint64_t v10 = *(void **)(*((void *)&v48 + 1) + 8 * v9);
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToRequestInfos, "objectForKeyedSubscript:", v10, v29);
        uint64_t v12 = [v11 requestTokens];

        uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v53 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v45 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              if (a5 || [*(id *)(*((void *)&v44 + 1) + 8 * i) isOneTimeRequest])
              {
                [v8 addObject:v17];
                [v17 setDelayTimer:0];
                [v17 setDidReceiveResponse:1];
                if ([v17 isOneTimeRequest])
                {
                  id v18 = objc_alloc(MEMORY[0x1E4F98360]);
                  uint64_t v19 = [v10 activity];
                  long long v20 = (void *)[v18 initWithFirst:v17 second:v19];
                  [v36 addObject:v20];
                }
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v44 objects:v53 count:16];
          }
          while (v14);
        }

        uint64_t v9 = v33 + 1;
      }
      while (v33 + 1 != v32);
      uint64_t v32 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v32);
  }

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __88__WBSSiteMetadataManager__sendResponse_toResponseHandlersForRequests_didReceiveNewData___block_invoke_2;
  v42[3] = &unk_1E5E44968;
  id v34 = v29;
  id v43 = v34;
  [(WBSSiteMetadataManager *)self _enumerateTokens:v8 usingSetUpBlock:&__block_literal_global_26 dispatchBlock:v42];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v21 = v36;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v39 != v24) {
          objc_enumerationMutation(v21);
        }
        long long v26 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        long long v27 = objc_msgSend(v26, "second", v29);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __88__WBSSiteMetadataManager__sendResponse_toResponseHandlersForRequests_didReceiveNewData___block_invoke_3;
        block[3] = &unk_1E5E40968;
        block[4] = v26;
        os_activity_apply(v27, block);

        v28 = [v26 first];
        [(WBSSiteMetadataManager *)self _internalCancelRequestWithToken:v28];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v23);
  }
}

- (void)_scheduleDelayedResponse:(id)a3 forRequestToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 didReceiveResponse] & 1) == 0)
  {
    [v7 setDidReceiveResponse:1];
    objc_initWeak(&location, v7);
    uint64_t v8 = (void *)MEMORY[0x1E4F98308];
    uint64_t v9 = [v7 queue];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __67__WBSSiteMetadataManager__scheduleDelayedResponse_forRequestToken___block_invoke;
    uint64_t v14 = &unk_1E5E40E00;
    objc_copyWeak(&v17, &location);
    id v15 = v6;
    uint64_t v16 = self;
    uint64_t v10 = [v8 timerWithInterval:0 repeats:v9 queue:&v11 handler:0.03];

    objc_msgSend(v7, "setDelayTimer:", v10, v11, v12, v13, v14);
    [v10 schedule];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)_enumerateTokens:(id)a3 usingSetUpBlock:(id)a4 dispatchBlock:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (unsigned int (**)(id, void *))a4;
  id v20 = a5;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (v8[2](v8, v15))
        {
          uint64_t v16 = [v15 queue];
          id v17 = [(__CFDictionary *)Mutable objectForKeyedSubscript:v16];

          if (!v17)
          {
            id v17 = [MEMORY[0x1E4F1CA80] set];
            id v18 = [v15 queue];
            [(__CFDictionary *)Mutable setObject:v17 forKeyedSubscript:v18];
          }
          objc_msgSend(v17, "addObject:", v15, v20);
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v12);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __73__WBSSiteMetadataManager__enumerateTokens_usingSetUpBlock_dispatchBlock___block_invoke;
  v21[3] = &unk_1E5E44A28;
  id v22 = v20;
  id v19 = v20;
  [(__CFDictionary *)Mutable enumerateKeysAndObjectsUsingBlock:v21];
}

uint64_t __88__WBSSiteMetadataManager__sendResponse_toResponseHandlersForRequests_didReceiveNewData___block_invoke()
{
  return 1;
}

- (void)_internalCancelRequestWithToken:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableSet *)self->_tokens containsObject:v4])
  {
    id v5 = v4;
    [(NSMutableSet *)self->_tokens removeObject:v5];
    [v5 setDelayTimer:0];
    id v29 = [v5 request];
    uint64_t v28 = [(NSMutableDictionary *)self->_requestsToRequestInfos objectForKeyedSubscript:v29];
    if ([v28 canStopWatchingRequestAfterRemovingToken:v5])
    {
      id v6 = [v28 provider];
      if (objc_opt_respondsToSelector()) {
        [v6 stopWatchingUpdatesForRequest:v29];
      }
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v7 = objc_msgSend(v5, "parentRequests", v4);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v46 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v12 = [(NSMutableDictionary *)self->_requestsToSubrequestTokens objectForKeyedSubscript:v11];
          [v12 removeObject:v5];
          if (![v12 count]) {
            [(NSMutableDictionary *)self->_requestsToSubrequestTokens setObject:0 forKeyedSubscript:v11];
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v8);
    }

    uint64_t v13 = [v28 tokens];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      [(WBSSiteMetadataManager *)self _updatePriorityOfRequest:v29];
    }
    else
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v15 = [(NSMutableDictionary *)self->_requestsToSubrequestTokens objectForKeyedSubscript:v29];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v50 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v42 != v17) {
              objc_enumerationMutation(v15);
            }
            id v19 = *(void **)(*((void *)&v41 + 1) + 8 * j);
            [v19 removeParentRequest:v29];
            id v20 = [v19 parentRequests];
            uint64_t v21 = [v20 count];

            if (v21)
            {
              long long v40 = 0u;
              long long v38 = 0u;
              long long v39 = 0u;
              long long v37 = 0u;
              id v22 = [v19 parentRequests];
              uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v49 count:16];
              if (v23)
              {
                uint64_t v24 = *(void *)v38;
                do
                {
                  for (uint64_t k = 0; k != v23; ++k)
                  {
                    if (*(void *)v38 != v24) {
                      objc_enumerationMutation(v22);
                    }
                    [(WBSSiteMetadataManager *)self _updatePriorityOfRequest:*(void *)(*((void *)&v37 + 1) + 8 * k)];
                  }
                  uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v49 count:16];
                }
                while (v23);
              }
            }
            else
            {
              [(WBSSiteMetadataManager *)self _internalCancelRequestWithToken:v19];
            }
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v50 count:16];
        }
        while (v16);
      }

      uint64_t v31 = 0;
      uint64_t v32 = &v31;
      uint64_t v33 = 0x3032000000;
      id v34 = __Block_byref_object_copy__24;
      v35 = __Block_byref_object_dispose__24;
      id v36 = [v28 operation];
      if (v32[5])
      {
        long long v26 = [v29 activity];
        os_activity_apply(v26, &__block_literal_global_30);

        [(NSCountedSet *)self->_activeOperations removeObject:v32[5]];
        if (![(NSCountedSet *)self->_activeOperations countForObject:v32[5]]) {
          [(id)v32[5] cancel];
        }
      }
      [v28 setOperation:0];
      [(NSMutableDictionary *)self->_requestsToSubrequestTokens setObject:0 forKeyedSubscript:v29];
      [(NSMutableDictionary *)self->_requestsToRequestInfos removeObjectForKey:v29];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__WBSSiteMetadataManager__internalCancelRequestWithToken___block_invoke_31;
      block[3] = &unk_1E5E41610;
      block[4] = &v31;
      dispatch_async(MEMORY[0x1E4F14428], block);
      _Block_object_dispose(&v31, 8);
    }
    id v4 = v27;
  }
}

- (void)_registerToken:(id)a3 isCacheRequest:(BOOL)a4 withProvider:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  id v8 = a5;
  [(NSMutableSet *)self->_tokens addObject:v11];
  uint64_t v9 = [v11 request];
  id v10 = [(NSMutableDictionary *)self->_requestsToRequestInfos objectForKeyedSubscript:v9];
  if (!v10)
  {
    id v10 = [[_WBSSiteMetadataRequestInfo alloc] initWithProvider:v8];
    [(NSMutableDictionary *)self->_requestsToRequestInfos setObject:v10 forKeyedSubscript:v9];
  }
  if (v6) {
    [(_WBSSiteMetadataRequestInfo *)v10 addCacheRequestToken:v11];
  }
  else {
    [(_WBSSiteMetadataRequestInfo *)v10 addRequestToken:v11];
  }
  [(WBSSiteMetadataManager *)self _updatePriorityOfRequest:v9];
}

- (void)_updatePriorityOfRequest:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(WBSSiteMetadataManager *)self _reprioritizeOperationForRequest:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToSubrequestTokens, "objectForKeyedSubscript:", v4, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 parentRequests];
        int64_t v12 = [(WBSSiteMetadataManager *)self _highestRequestPriorityForRequests:v11];

        if ([v10 priority] != v12)
        {
          [v10 setPriority:v12];
          uint64_t v13 = [v10 request];
          [(WBSSiteMetadataManager *)self _updatePriorityOfRequest:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)_reprioritizeOperationForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_requestsToRequestInfos objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 operation];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    int64_t v8 = [(WBSSiteMetadataManager *)self _highestRequestPriorityForRequests:v7];

    uint64_t v9 = [v4 activity];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__WBSSiteMetadataManager__reprioritizeOperationForRequest___block_invoke;
    block[3] = &unk_1E5E449B0;
    id v10 = v6;
    id v14 = v10;
    id v15 = v4;
    int64_t v16 = v8;
    os_activity_apply(v9, block);

    uint64_t v11 = -4;
    if (v8 != 1) {
      uint64_t v11 = 0;
    }
    if (v8) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = -8;
    }
    [v10 setQueuePriority:v12];
  }
}

void __67__WBSSiteMetadataManager__scheduleDelayedResponse_forRequestToken___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained dispatchResponse:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(NSObject **)(v4 + 64);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67__WBSSiteMetadataManager__scheduleDelayedResponse_forRequestToken___block_invoke_2;
    v6[3] = &unk_1E5E40D38;
    v6[4] = v4;
    id v7 = v3;
    dispatch_barrier_async(v5, v6);
  }
}

void __73__WBSSiteMetadataManager__enumerateTokens_usingSetUpBlock_dispatchBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

uint64_t __88__WBSSiteMetadataManager__sendResponse_toResponseHandlersForRequests_didReceiveNewData___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 dispatchResponse:*(void *)(a1 + 32)];
}

uint64_t __67__WBSSiteMetadataManager__scheduleDelayedResponse_forRequestToken___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _requestIsCancelledForToken:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    return [v3 setDelayTimer:0];
  }
  return result;
}

- (BOOL)_requestIsCancelledForToken:(id)a3
{
  if (a3) {
    return -[NSMutableSet containsObject:](self->_tokens, "containsObject:") ^ 1;
  }
  else {
    return 1;
  }
}

- (id)registerRequest:(id)a3 priority:(int64_t)a4 queue:(id)a5 responseHandler:(id)a6
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__WBSSiteMetadataManager_registerRequest_priority_queue_responseHandler___block_invoke;
  v8[3] = &__block_descriptor_40_e31_v16__0___WBSSiteMetadataToken_8l;
  v8[4] = a4;
  uint64_t v6 = [(WBSSiteMetadataManager *)self _registerRequest:a3 isOneTimeRequest:0 queue:a5 responseHandler:a6 tokenSetUpBlock:v8];
  return v6;
}

- (void)registerSiteMetadataProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    siteMetadataProvidersAccessQueue = self->_siteMetadataProvidersAccessQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__WBSSiteMetadataManager_registerSiteMetadataProvider___block_invoke;
    v7[3] = &unk_1E5E40D38;
    id v8 = v4;
    long long v9 = self;
    dispatch_barrier_async(siteMetadataProvidersAccessQueue, v7);
  }
}

void __73__WBSSiteMetadataManager__enumerateTokens_usingSetUpBlock_dispatchBlock___block_invoke(uint64_t a1, NSObject *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__WBSSiteMetadataManager__enumerateTokens_usingSetUpBlock_dispatchBlock___block_invoke_2;
  v7[3] = &unk_1E5E420C8;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  dispatch_async(a2, v7);
}

- (void)preloadRequests:(id)a3 withPriority:(int64_t)a4 responseHandler:(id)a5
{
}

- (void)cancelRequestWithToken:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = a3;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    id v6 = [v4 arrayWithObjects:&v7 count:1];

    -[WBSSiteMetadataManager cancelRequestsWithTokens:completionHandler:](self, "cancelRequestsWithTokens:completionHandler:", v6, 0, v7, v8);
  }
}

- (void)preloadRequests:(id)a3 withPriority:(int64_t)a4 queue:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__WBSSiteMetadataManager_preloadRequests_withPriority_queue_responseHandler___block_invoke;
  block[3] = &unk_1E5E43D70;
  id v18 = v10;
  uint64_t v19 = self;
  id v20 = v11;
  id v21 = v12;
  int64_t v22 = a4;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_barrier_async(internalQueue, block);
}

- (WBSSiteMetadataManager)init
{
  return [(WBSSiteMetadataManager *)self initWithInjectedBundleURL:0];
}

- (void)setSuspended:(BOOL)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__WBSSiteMetadataManager_setSuspended___block_invoke;
  v4[3] = &unk_1E5E44858;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_barrier_async(internalQueue, v4);
}

uint64_t __39__WBSSiteMetadataManager_setSuspended___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setSuspended:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)isSuspended
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__WBSSiteMetadataManager_isSuspended__block_invoke;
  v5[3] = &unk_1E5E43620;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__WBSSiteMetadataManager_isSuspended__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 48) isSuspended];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_processPool
{
  char v3 = self->_processPool;
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = v3;
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F46780]);
    [v6 setInjectedBundleURL:self->_injectedBundleURL];
    id v7 = (WKProcessPool *)[objc_alloc(MEMORY[0x1E4F46690]) _initWithConfiguration:v6];
    processPool = self->_processPool;
    self->_processPool = v7;

    BOOL v5 = self->_processPool;
  }

  return v5;
}

- (id)_popReusableWebView
{
  uint64_t v3 = [(NSMutableSet *)self->_usedWebViews count];
  unint64_t v4 = [(NSMutableSet *)self->_reusableWebViews count] + v3;
  if (v4 >= [(WBSSiteMetadataManager *)self _numberOfConcurrentRequests])
  {
    BOOL v5 = [(NSMutableSet *)self->_reusableWebViews anyObject];
    if (v5) {
      [(NSMutableSet *)self->_reusableWebViews removeObject:v5];
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  return v5;
}

- (void)_discardWebViewSoon:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 100000000);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__WBSSiteMetadataManager__discardWebViewSoon___block_invoke;
  v7[3] = &unk_1E5E40D38;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, MEMORY[0x1E4F14428], v7);
}

void __46__WBSSiteMetadataManager__discardWebViewSoon___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 16) count]
    && ![*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v2 + 8);
    *(void *)(v2 + 8) = 0;
  }
}

- (id)registerOneTimeRequest:(id)a3 priority:(int64_t)a4 responseHandler:(id)a5
{
  return [(WBSSiteMetadataManager *)self registerOneTimeRequest:a3 priority:a4 queue:MEMORY[0x1E4F14428] responseHandler:a5];
}

- (id)registerOneTimeRequest:(id)a3 priority:(int64_t)a4 queue:(id)a5 responseHandler:(id)a6
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__WBSSiteMetadataManager_registerOneTimeRequest_priority_queue_responseHandler___block_invoke;
  v8[3] = &__block_descriptor_40_e31_v16__0___WBSSiteMetadataToken_8l;
  v8[4] = a4;
  id v6 = [(WBSSiteMetadataManager *)self _registerRequest:a3 isOneTimeRequest:1 queue:a5 responseHandler:a6 tokenSetUpBlock:v8];
  return v6;
}

uint64_t __80__WBSSiteMetadataManager_registerOneTimeRequest_priority_queue_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPriority:*(void *)(a1 + 32)];
}

- (id)_registerSubrequest:(id)a3 isOneTimeRequest:(BOOL)a4 forRequests:(id)a5 queue:(id)a6 responseHandler:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  id v15 = (void *)[a5 copy];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __97__WBSSiteMetadataManager__registerSubrequest_isOneTimeRequest_forRequests_queue_responseHandler___block_invoke;
  v19[3] = &unk_1E5E448C8;
  v19[4] = self;
  id v20 = v15;
  id v16 = v15;
  long long v17 = [(WBSSiteMetadataManager *)self _registerRequest:v14 isOneTimeRequest:v9 queue:v13 responseHandler:v12 tokenSetUpBlock:v19];

  return v17;
}

void __97__WBSSiteMetadataManager__registerSubrequest_isOneTimeRequest_forRequests_queue_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_msgSend(v3, "setPriority:", objc_msgSend(*(id *)(a1 + 32), "_highestRequestPriorityForRequests:", *(void *)(a1 + 40)));
  [v3 setParentRequests:*(void *)(a1 + 40)];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v10 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "objectForKeyedSubscript:", v9, (void)v11);
        if (!v10)
        {
          id v10 = [MEMORY[0x1E4F1CA80] set];
          [*(id *)(*(void *)(a1 + 32) + 88) setObject:v10 forKeyedSubscript:v9];
        }
        [v10 addObject:v3];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)preloadRequest:(id)a3 withPriority:(int64_t)a4 responseHandler:(id)a5
{
}

- (void)preloadRequest:(id)a3 withPriority:(int64_t)a4 queue:(id)a5 responseHandler:(id)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  uint64_t v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a6;
  id v11 = a3;
  long long v12 = [v9 arrayWithObjects:&v13 count:1];

  -[WBSSiteMetadataManager preloadRequests:withPriority:responseHandler:](self, "preloadRequests:withPriority:responseHandler:", v12, a4, v10, v13, v14);
}

- (void)cacheData:(id)a3 forRequest:(id)a4
{
}

- (void)cacheData:(id)a3 forRequest:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__WBSSiteMetadataManager_cacheData_forRequest_completionHandler___block_invoke;
  v15[3] = &unk_1E5E44918;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_barrier_async(internalQueue, v15);
}

void __65__WBSSiteMetadataManager_cacheData_forRequest_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F983D8]);
  [v2 setHandler:*(void *)(a1 + 56)];
  id v3 = [*(id *)(a1 + 32) _providerForRequest:*(void *)(a1 + 40)];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:*(void *)(a1 + 40)];
    if (!v4)
    {
      id v4 = [MEMORY[0x1E4F1CA80] set];
      [*(id *)(*(void *)(a1 + 32) + 96) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];
    }
    uint64_t v5 = [_WBSSiteMetadataToken alloc];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 64);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__WBSSiteMetadataManager_cacheData_forRequest_completionHandler___block_invoke_2;
    v9[3] = &unk_1E5E448F0;
    id v10 = v2;
    id v8 = [(_WBSSiteMetadataToken *)v5 initWithRequest:v6 isOneTimeRequest:0 queue:v7 responseHandler:v9];
    [(_WBSSiteMetadataToken *)v8 setPriority:0];
    if ([v3 cacheData:*(void *)(a1 + 48) forRequest:*(void *)(a1 + 40) usingToken:v8])
    {
      [v4 addObject:v8];
      [*(id *)(a1 + 32) _registerToken:v8 isCacheRequest:1 withProvider:v3];
    }
    else
    {
      [(_WBSSiteMetadataToken *)v8 setCancelled:1];
    }
  }
}

- (void)_sendRequiresDownloadResponse:(id)a3 toResponseHandlersForRequest:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_requestsToRequestInfos objectForKeyedSubscript:a4];
    id v8 = [v7 requestTokens];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __85__WBSSiteMetadataManager__sendRequiresDownloadResponse_toResponseHandlersForRequest___block_invoke;
    v11[3] = &unk_1E5E44940;
    void v11[4] = self;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __85__WBSSiteMetadataManager__sendRequiresDownloadResponse_toResponseHandlersForRequest___block_invoke_2;
    v9[3] = &unk_1E5E44968;
    id v10 = v6;
    [(WBSSiteMetadataManager *)self _enumerateTokens:v8 usingSetUpBlock:v11 dispatchBlock:v9];
  }
}

uint64_t __85__WBSSiteMetadataManager__sendRequiresDownloadResponse_toResponseHandlersForRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isOneTimeRequest] & 1) != 0 || (objc_msgSend(v3, "didReceiveResponse"))
  {
    uint64_t v4 = 0;
  }
  else
  {
    [v3 setDidReceiveResponse:1];
    uint64_t v4 = [*(id *)(a1 + 32) _requestIsCancelledForToken:v3] ^ 1;
  }

  return v4;
}

uint64_t __85__WBSSiteMetadataManager__sendRequiresDownloadResponse_toResponseHandlersForRequest___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 dispatchResponse:*(void *)(a1 + 32)];
}

void __58__WBSSiteMetadataManager__internalCancelRequestWithToken___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1ABB70000, v0, OS_LOG_TYPE_DEFAULT, "Canceling pending fetch operation", v1, 2u);
  }
}

void __58__WBSSiteMetadataManager__internalCancelRequestWithToken___block_invoke_31(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)cancelRequestsWithTokens:(id)a3
{
}

- (void)cancelRequestsWithTokens:(id)a3 completionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * v12++) setCancelled:1];
        }
        while (v10 != v12);
        uint64_t v10 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__WBSSiteMetadataManager_cancelRequestsWithTokens_completionHandler___block_invoke;
    block[3] = &unk_1E5E40940;
    id v15 = v6;
    id v16 = self;
    id v17 = v8;
    dispatch_barrier_async(internalQueue, block);
  }
  else if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
  }
}

uint64_t __69__WBSSiteMetadataManager_cancelRequestsWithTokens_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_internalCancelRequestWithToken:", *(void *)(*((void *)&v8 + 1) + 8 * v6++), (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_internalSetPriority:(int64_t)a3 ofRequestWithToken:(id)a4
{
  id v7 = a4;
  if ([v7 priority] != a3)
  {
    [v7 setPriority:a3];
    uint64_t v6 = [v7 request];
    [(WBSSiteMetadataManager *)self _updatePriorityOfRequest:v6];
  }
}

- (void)setPriority:(int64_t)a3 ofRequestWithToken:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__WBSSiteMetadataManager_setPriority_ofRequestWithToken___block_invoke;
    block[3] = &unk_1E5E449B0;
    void block[4] = self;
    int64_t v11 = a3;
    id v10 = v6;
    dispatch_barrier_async(internalQueue, block);
  }
}

uint64_t __57__WBSSiteMetadataManager_setPriority_ofRequestWithToken___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _internalSetPriority:*(void *)(a1 + 48) ofRequestWithToken:*(void *)(a1 + 40)];
}

- (void)setPriority:(int64_t)a3 ofRequestsWithTokens:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__WBSSiteMetadataManager_setPriority_ofRequestsWithTokens___block_invoke;
    block[3] = &unk_1E5E449B0;
    id v10 = v6;
    int64_t v11 = self;
    int64_t v12 = a3;
    dispatch_barrier_async(internalQueue, block);
  }
}

void __59__WBSSiteMetadataManager_setPriority_ofRequestsWithTokens___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_internalSetPriority:ofRequestWithToken:", *(void *)(a1 + 48), *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)emptyProviderCaches
{
}

- (void)emptyProviderCachesIncludingFavicons:(BOOL)a3
{
  siteMetadataProvidersAccessQueue = self->_siteMetadataProvidersAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__WBSSiteMetadataManager_emptyProviderCachesIncludingFavicons___block_invoke;
  v4[3] = &unk_1E5E44858;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(siteMetadataProvidersAccessQueue, v4);
}

void __63__WBSSiteMetadataManager_emptyProviderCachesIncludingFavicons___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if ((*(unsigned char *)(a1 + 40)
           || (objc_opt_respondsToSelector() & 1) == 0
           || (objc_msgSend(v7, "providesFavicons", (void)v8) & 1) == 0)
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          [v7 emptyCaches];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)savePendingProviderChangesBeforeTermination
{
  siteMetadataProvidersAccessQueue = self->_siteMetadataProvidersAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__WBSSiteMetadataManager_savePendingProviderChangesBeforeTermination__block_invoke;
  block[3] = &unk_1E5E40968;
  void block[4] = self;
  dispatch_sync(siteMetadataProvidersAccessQueue, block);
}

void __69__WBSSiteMetadataManager_savePendingProviderChangesBeforeTermination__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v6, "savePendingChangesBeforeTermination", (void)v7);
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)savePendingProviderChangesWithCompletion:(id)a3
{
  id v4 = a3;
  siteMetadataProvidersAccessQueue = self->_siteMetadataProvidersAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__WBSSiteMetadataManager_savePendingProviderChangesWithCompletion___block_invoke;
  v7[3] = &unk_1E5E420C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(siteMetadataProvidersAccessQueue, v7);
}

uint64_t __67__WBSSiteMetadataManager_savePendingProviderChangesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "savePendingChangesBeforeTermination", (void)v9);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)performMaintenanceWork
{
  siteMetadataProvidersAccessQueue = self->_siteMetadataProvidersAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__WBSSiteMetadataManager_performMaintenanceWork__block_invoke;
  block[3] = &unk_1E5E40968;
  void block[4] = self;
  dispatch_async(siteMetadataProvidersAccessQueue, block);
}

void __48__WBSSiteMetadataManager_performMaintenanceWork__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_DEFAULT, "Beginning maintenance pass", buf, 2u);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "performMaintenanceWork", (void)v10);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v5);
  }

  long long v9 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB70000, v9, OS_LOG_TYPE_DEFAULT, "Completed maintenance pass", buf, 2u);
  }
}

- (int64_t)_highestRequestPriorityForRequests:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int64_t v7 = 0;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToRequestInfos, "objectForKeyedSubscript:", v10, 0);
        long long v12 = [v11 tokens];

        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v20;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = [*(id *)(*((void *)&v19 + 1) + 8 * j) priority];
              if (v17 == 2)
              {

                int64_t v7 = 2;
                goto LABEL_21;
              }
              if (v7 <= v17) {
                int64_t v7 = v17;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }
  else
  {
    int64_t v7 = 0;
  }
LABEL_21:

  return v7;
}

void __59__WBSSiteMetadataManager__reprioritizeOperationForRequest___block_invoke(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = v2;
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = (void *)a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = [v5 queuePriority];
    uint64_t v8 = a1[6];
    uint64_t v9 = -4;
    if (v8 != 1) {
      uint64_t v9 = 0;
    }
    int v12 = 138544643;
    BOOL v10 = v8 == 0;
    uint64_t v11 = -8;
    uint64_t v13 = v4;
    if (!v10) {
      uint64_t v11 = v9;
    }
    __int16 v14 = 2048;
    uint64_t v15 = v5;
    __int16 v16 = 2160;
    uint64_t v17 = 1752392040;
    __int16 v18 = 2117;
    uint64_t v19 = v6;
    __int16 v20 = 2048;
    uint64_t v21 = v7;
    __int16 v22 = 2048;
    uint64_t v23 = v11;
    _os_log_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_INFO, "Reprioritizing operation <%{public}@, %p> for request %{sensitive, mask.hash}@ from %ld to %ld", (uint8_t *)&v12, 0x3Eu);
  }
}

- (BOOL)_updateOperationForRequestIfPossible:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_requestsToRequestInfos objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 operation];
    uint64_t v8 = v7;
    BOOL v9 = v7 != 0;
    if (v7 && ([v7 isFinished] & 1) == 0) {
      [(WBSSiteMetadataManager *)self _updatePriorityOfRequest:v4];
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)_setUpOperationForRequest:(id)a3 withSiteMetadataProvider:(id)a4 usingOperationBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(void))a5;
  if (![(WBSSiteMetadataManager *)self _updateOperationForRequestIfPossible:v8])
  {
    uint64_t v11 = [(NSMutableDictionary *)self->_requestsToRequestInfos objectForKeyedSubscript:v8];
    int v12 = v10[2](v10);
    uint64_t v13 = [(NSCountedSet *)self->_activeOperations member:v12];
    if (v13)
    {
      [v12 cancel];
      [(NSCountedSet *)self->_activeOperations addObject:v13];
      [v11 setOperation:v13];
    }
    else
    {
      [(NSCountedSet *)self->_activeOperations addObject:v12];
      __int16 v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
      int64_t v15 = [(WBSSiteMetadataManager *)self _highestRequestPriorityForRequests:v14];
      uint64_t v16 = -4;
      if (v15 != 1) {
        uint64_t v16 = 0;
      }
      if (v15) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = -8;
      }
      [v12 setQueuePriority:v17];

      objc_initWeak(&location, v12);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __97__WBSSiteMetadataManager__setUpOperationForRequest_withSiteMetadataProvider_usingOperationBlock___block_invoke;
      v23[3] = &unk_1E5E44A00;
      v23[4] = self;
      objc_copyWeak(&v24, &location);
      [v12 setCompletionBlock:v23];
      __int16 v18 = [v8 activity];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __97__WBSSiteMetadataManager__setUpOperationForRequest_withSiteMetadataProvider_usingOperationBlock___block_invoke_3;
      block[3] = &unk_1E5E40D38;
      id v19 = v12;
      id v21 = v19;
      id v22 = v8;
      os_activity_apply(v18, block);

      [v11 setOperation:v19];
      [(NSOperationQueue *)self->_operationQueue addOperation:v19];

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
  }
}

void __97__WBSSiteMetadataManager__setUpOperationForRequest_withSiteMetadataProvider_usingOperationBlock___block_invoke(uint64_t a1)
{
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __97__WBSSiteMetadataManager__setUpOperationForRequest_withSiteMetadataProvider_usingOperationBlock___block_invoke_2;
  v3[3] = &unk_1E5E41598;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3[4] = *(void *)(a1 + 32);
  dispatch_barrier_async(v2, v3);
  objc_destroyWeak(&v4);
}

void __97__WBSSiteMetadataManager__setUpOperationForRequest_withSiteMetadataProvider_usingOperationBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = *(void **)(*(void *)(a1 + 32) + 56);
  id v4 = WeakRetained;
  while (objc_msgSend(v3, "countForObject:"))
  {
    [*(id *)(*(void *)(a1 + 32) + 56) removeObject:v4];
    id v3 = *(void **)(*(void *)(a1 + 32) + 56);
  }
}

void __97__WBSSiteMetadataManager__setUpOperationForRequest_withSiteMetadataProvider_usingOperationBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = v2;
    uint64_t v4 = objc_opt_class();
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138544387;
    uint64_t v8 = v4;
    __int16 v9 = 2048;
    BOOL v10 = v6;
    __int16 v11 = 2160;
    uint64_t v12 = 1752392040;
    __int16 v13 = 2117;
    uint64_t v14 = v5;
    __int16 v15 = 2048;
    uint64_t v16 = [v6 queuePriority];
    _os_log_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_INFO, "Enqueuing operation <%{public}@, %p> for request %{sensitive, mask.hash}@ with priority %ld", (uint8_t *)&v7, 0x34u);
  }
}

- (id)_makeWebViewOfSize:(CGSize)a3 withConfiguration:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  int v7 = (objc_class *)MEMORY[0x1E4F466F0];
  id v8 = a4;
  __int16 v9 = objc_msgSend([v7 alloc], "initWithFrame:configuration:", v8, 0.0, 0.0, width, height);

  [v9 setInspectable:0];
  [(NSMutableSet *)self->_usedWebViews addObject:v9];
  return v9;
}

- (void)siteMetadataProvider:(id)a3 didReceiveResponse:(id)a4 forRequest:(id)a5 beginOperationUsingBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__WBSSiteMetadataManager_siteMetadataProvider_didReceiveResponse_forRequest_beginOperationUsingBlock___block_invoke;
  block[3] = &unk_1E5E44A78;
  void block[4] = self;
  id v20 = v12;
  id v22 = v11;
  id v23 = v13;
  id v21 = v10;
  id v15 = v11;
  id v16 = v13;
  id v17 = v10;
  id v18 = v12;
  dispatch_barrier_async(internalQueue, block);
}

uint64_t __102__WBSSiteMetadataManager_siteMetadataProvider_didReceiveResponse_forRequest_beginOperationUsingBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setUpOperationForRequest:*(void *)(a1 + 40) withSiteMetadataProvider:*(void *)(a1 + 48) usingOperationBlock:*(void *)(a1 + 64)];
  uint64_t v2 = *(void *)(a1 + 56);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 _sendRequiresDownloadResponse:v2 toResponseHandlersForRequest:v4];
}

- (id)siteMetadataProvider:(id)a3 registerSubrequest:(id)a4 forRequests:(id)a5 queue:(id)a6 responseHandler:(id)a7
{
  return [(WBSSiteMetadataManager *)self _registerSubrequest:a4 isOneTimeRequest:0 forRequests:a5 queue:a6 responseHandler:a7];
}

- (id)siteMetadataProvider:(id)a3 registerOneTimeSubrequest:(id)a4 forRequests:(id)a5 queue:(id)a6 responseHandler:(id)a7
{
  return [(WBSSiteMetadataManager *)self _registerSubrequest:a4 isOneTimeRequest:1 forRequests:a5 queue:a6 responseHandler:a7];
}

- (void)siteMetadataProvider:(id)a3 cancelRequestsWithTokens:(id)a4
{
}

- (void)siteMetadataProvider:(id)a3 didFinishCachingDataWithToken:(id)a4
{
  id v5 = a4;
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__WBSSiteMetadataManager_siteMetadataProvider_didFinishCachingDataWithToken___block_invoke;
  v8[3] = &unk_1E5E40D38;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_barrier_async(internalQueue, v8);
}

void __77__WBSSiteMetadataManager_siteMetadataProvider_didFinishCachingDataWithToken___block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) request];
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 96), "objectForKeyedSubscript:");
  [v2 removeObject:*(void *)(a1 + 32)];
  if (![v2 count]) {
    [*(id *)(*(void *)(a1 + 40) + 96) setObject:0 forKeyedSubscript:v9];
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 104);
  if (!v3)
  {
    uint64_t v4 = [WBSSiteMetadataResponse alloc];
    id v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"site-metadata-manager:did-cache-data"];
    uint64_t v6 = [(WBSSiteMetadataResponse *)v4 initWithURL:v5];
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(void **)(v7 + 104);
    *(void *)(v7 + 104) = v6;

    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 104);
  }
  [*(id *)(a1 + 32) dispatchResponse:v3];
  [*(id *)(a1 + 32) setCancelled:1];
  [*(id *)(a1 + 40) _internalCancelRequestWithToken:*(void *)(a1 + 32)];
}

- (void)siteMetadataProvider:(id)a3 cacheData:(id)a4 forRequest:(id)a5
{
}

- (void)siteMetadataProvider:(id)a3 getWebViewOfSize:(CGSize)a4 withConfiguration:(id)a5 completionHandler:(id)a6
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(WBSSiteMetadataManager *)self _processPool];
  [v11 setProcessPool:v13];

  id v14 = [(WBSSiteMetadataManager *)self _popReusableWebView];
  if (v14)
  {
    id v15 = v14;
    [v11 _setRelatedWebView:v14];
    id v16 = [v15 configuration];
    id v17 = [v16 websiteDataStore];

    [v11 setWebsiteDataStore:v17];
    uint64_t v6 = [v15 configuration];
    id v18 = [v6 processPool];
    [v11 setProcessPool:v18];

LABEL_3:
    goto LABEL_4;
  }
  char v25 = objc_opt_respondsToSelector();
  if (v25)
  {
    uint64_t v6 = [v11 _websiteDataStoreIfExists];
    if (!v6) {
      goto LABEL_17;
    }
  }
  long long v26 = [v11 websiteDataStore];
  if (objc_opt_respondsToSelector())
  {
    long long v27 = [v11 websiteDataStore];
    uint64_t v28 = [v27 _configuration];
    int v29 = [v28 isPersistent];

    if (v25)
    {

      if ((v29 & 1) == 0)
      {
LABEL_11:
        id v17 = 0;
        goto LABEL_4;
      }
    }
    else if (!v29)
    {
      goto LABEL_11;
    }
LABEL_17:
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F46710], "safari_nonPersistentDataStore");
    [v11 setWebsiteDataStore:v6];
    id v17 = 0;
    goto LABEL_3;
  }

  id v17 = 0;
  if (v25) {
    goto LABEL_3;
  }
LABEL_4:
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __100__WBSSiteMetadataManager_siteMetadataProvider_getWebViewOfSize_withConfiguration_completionHandler___block_invoke;
  v32[3] = &unk_1E5E44AA0;
  CGFloat v36 = width;
  CGFloat v37 = height;
  id v19 = v11;
  id v33 = v19;
  id v34 = self;
  id v20 = v12;
  id v35 = v20;
  uint64_t v21 = MEMORY[0x1AD115160](v32);
  id v22 = (void *)v21;
  if (v17)
  {
    id v23 = [MEMORY[0x1E4F46710] allWebsiteDataTypes];
    id v24 = [MEMORY[0x1E4F1C9C8] distantPast];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __100__WBSSiteMetadataManager_siteMetadataProvider_getWebViewOfSize_withConfiguration_completionHandler___block_invoke_2;
    v30[3] = &unk_1E5E41548;
    id v31 = v22;
    [v17 removeDataOfTypes:v23 modifiedSince:v24 completionHandler:v30];
  }
  else
  {
    (*(void (**)(uint64_t))(v21 + 16))(v21);
  }
}

void __100__WBSSiteMetadataManager_siteMetadataProvider_getWebViewOfSize_withConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F466F0]), "initWithFrame:configuration:", *(void *)(a1 + 32), 0.0, 0.0, *(double *)(a1 + 56), *(double *)(a1 + 64));
  [v2 setInspectable:0];
  [*(id *)(*(void *)(a1 + 40) + 16) addObject:v2];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __100__WBSSiteMetadataManager_siteMetadataProvider_getWebViewOfSize_withConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)siteMetadataProvider:(id)a3 didFinishUsingWebView:(id)a4
{
  reusableWebViews = self->_reusableWebViews;
  id v6 = a4;
  [(NSMutableSet *)reusableWebViews addObject:v6];
  [(NSMutableSet *)self->_usedWebViews removeObject:v6];
  [(WBSSiteMetadataManager *)self _discardWebViewSoon:v6];
}

- (NSURL)injectedBundleURL
{
  return self->_injectedBundleURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_injectedBundleURL, 0);
  objc_storeStrong((id *)&self->_didCacheDataSentinelResponse, 0);
  objc_storeStrong((id *)&self->_requestsToCacheRequestTokens, 0);
  objc_storeStrong((id *)&self->_requestsToSubrequestTokens, 0);
  objc_storeStrong((id *)&self->_requestsToRequestInfos, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_activeOperations, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_siteMetadataProvidersAccessQueue, 0);
  objc_storeStrong((id *)&self->_siteMetadataProviders, 0);
  objc_storeStrong((id *)&self->_reusableWebViews, 0);
  objc_storeStrong((id *)&self->_usedWebViews, 0);
  objc_storeStrong((id *)&self->_processPool, 0);
}

@end