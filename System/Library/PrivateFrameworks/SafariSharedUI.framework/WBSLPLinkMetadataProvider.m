@interface WBSLPLinkMetadataProvider
+ (id)linkMetadataForURL:(id)a3 webView:(id)a4 iconCache:(id)a5;
+ (id)unpackMetadataFromResponse:(id)a3;
- (BOOL)_shouldStartFetchOperationForMetadataWithInfo:(id)a3;
- (BOOL)cacheData:(id)a3 forRequest:(id)a4 usingToken:(id)a5;
- (BOOL)canHandleRequest:(id)a3;
- (NSURL)cacheDirectoryURL;
- (WBSLPLinkMetadataProvider)init;
- (WBSLPLinkMetadataProvider)initWithCacheDirectoryURL:(id)a3;
- (WBSSiteMetadataProviderDelegate)providerDelegate;
- (id)_operationForRequest:(id)a3;
- (id)_preparedResponseForRequest:(id)a3;
- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4;
- (void)_cacheMetadata:(id)a3 forRequest:(id)a4 completionHandler:(id)a5;
- (void)_didReceiveNewMetadata:(id)a3 forRequest:(id)a4 allowDelayedResponse:(BOOL)a5;
- (void)_discardPreparedResponseForRequest:(id)a3;
- (void)_getCachedMetadataInfoForRequest:(id)a3 completionHandler:(id)a4;
- (void)_getCachedMetadataWithInfo:(id)a3 completionHandler:(id)a4;
- (void)_notifyResponse:(id)a3 ofType:(int64_t)a4 didReceiveNewData:(BOOL)a5 forRequest:(id)a6;
- (void)_prepareCachedResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4;
- (void)_provideCachedResponseIfAvailableForRequest:(id)a3 withMetadataInfo:(id)a4;
- (void)_removeAllOperations;
- (void)_removeOperationForRequest:(id)a3;
- (void)_serveAllPendingRequests;
- (void)_setOperation:(id)a3 forRequest:(id)a4;
- (void)_setUpCache;
- (void)_storeAndNotifySuccessfulResponseForRequest:(id)a3 withMetadata:(id)a4 didReceiveNewData:(BOOL)a5;
- (void)_storePreparedResponse:(id)a3 forRequest:(id)a4;
- (void)emptyCaches;
- (void)prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4;
- (void)reuseMetadataOfURLString:(id)a3 forURLString:(id)a4 completionHandler:(id)a5;
- (void)savePendingChangesBeforeTermination;
- (void)setProviderDelegate:(id)a3;
- (void)stopWatchingUpdatesForRequest:(id)a3;
@end

@implementation WBSLPLinkMetadataProvider

- (void)setProviderDelegate:(id)a3
{
}

- (WBSLPLinkMetadataProvider)initWithCacheDirectoryURL:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WBSLPLinkMetadataProvider;
  v5 = [(WBSLPLinkMetadataProvider *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    cacheDirectoryURL = v5->_cacheDirectoryURL;
    v5->_cacheDirectoryURL = (NSURL *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    requestsToResponses = v5->_requestsToResponses;
    v5->_requestsToResponses = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    requestsToOperations = v5->_requestsToOperations;
    v5->_requestsToOperations = (NSMutableDictionary *)v10;

    v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = v12;

    [(NSOperationQueue *)v5->_operationQueue setQualityOfService:17];
    [(NSOperationQueue *)v5->_operationQueue setMaxConcurrentOperationCount:5];
    v14 = [NSString stringWithFormat:@"com.apple.SafariShared.WBSLPLinkMetadataProvider.%@.%p._operationQueue", objc_opt_class(), v5];
    [(NSOperationQueue *)v5->_operationQueue setName:v14];

    v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    id v16 = [NSString stringWithFormat:@"com.apple.SafariShared.WBSLPLinkMetadataProvider.%@.%p._internalQueue", objc_opt_class(), v5];
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], v15);
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)v17;

    if (v5->_cacheDirectoryURL)
    {
      v19 = v5->_internalQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__WBSLPLinkMetadataProvider_initWithCacheDirectoryURL___block_invoke;
      block[3] = &unk_1E5E40968;
      v23 = v5;
      dispatch_async(v19, block);
    }
    v20 = v5;
  }
  return v5;
}

uint64_t __55__WBSLPLinkMetadataProvider_initWithCacheDirectoryURL___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  return [*(id *)(a1 + 32) _setUpCache];
}

uint64_t __40__WBSLPLinkMetadataProvider__setUpCache__block_invoke_4(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
  v2 = *(void **)(a1 + 32);
  return [v2 _serveAllPendingRequests];
}

- (void)_setUpCache
{
  objc_initWeak(&location, self);
  v3 = [[WBSLPLinkMetadataCache alloc] initWithCacheDirectoryURL:self->_cacheDirectoryURL expirationInterval:1209600.0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__WBSLPLinkMetadataProvider__setUpCache__block_invoke;
  v5[3] = &unk_1E5E43698;
  objc_copyWeak(&v7, &location);
  id v4 = v3;
  uint64_t v6 = v4;
  [(WBSLPLinkMetadataCache *)v4 openWithCompletionHandler:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __40__WBSLPLinkMetadataProvider__setUpCache__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = (id *)(a1 + 40);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      id v7 = WeakRetained[4];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40__WBSLPLinkMetadataProvider__setUpCache__block_invoke_2;
      block[3] = &unk_1E5E40968;
      void block[4] = v6;
      dispatch_async(v7, block);
    }
    else
    {
      uint64_t v8 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __40__WBSLPLinkMetadataProvider__setUpCache__block_invoke_3;
      v9[3] = &unk_1E5E41598;
      objc_copyWeak(&v11, v4);
      id v10 = *(id *)(a1 + 32);
      [v8 prewarmInMemoryStoreWithCompletionHandler:v9];

      objc_destroyWeak(&v11);
    }
  }
}

- (void)_serveAllPendingRequests
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_pendingRequests;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "request", (void)v11);
        -[WBSLPLinkMetadataProvider prepareResponseForRequest:allowDelayedResponse:](self, "prepareResponseForRequest:allowDelayedResponse:", v9, [v8 allowDelayedResponse]);
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  pendingRequests = self->_pendingRequests;
  self->_pendingRequests = 0;
}

void __40__WBSLPLinkMetadataProvider__setUpCache__block_invoke_3(uint64_t a1)
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[4];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __40__WBSLPLinkMetadataProvider__setUpCache__block_invoke_4;
    v5[3] = &unk_1E5E40D38;
    void v5[4] = WeakRetained;
    id v6 = *(id *)(a1 + 32);
    dispatch_async(v4, v5);
  }
}

+ (id)linkMetadataForURL:(id)a3 webView:(id)a4 iconCache:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 host];
  if (!v10) {
    goto LABEL_7;
  }
  uint64_t v41 = 0;
  uint64_t v42 = (uint64_t)&v41;
  uint64_t v43 = 0x2050000000;
  long long v11 = (void *)getLPMetadataProviderClass_softClass;
  v44 = (void *)getLPMetadataProviderClass_softClass;
  if (!getLPMetadataProviderClass_softClass)
  {
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    uint64_t v37 = (uint64_t)__getLPMetadataProviderClass_block_invoke;
    v38 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5E41610;
    v39 = (void (*)(uint64_t))&v41;
    LinkPresentationLibraryCore();
    *(void *)(v42 + 24) = objc_getClass("LPMetadataProvider");
    getLPMetadataProviderClass_softClass Class = *(void *)(*((void *)v39 + 1) + 24);
    long long v11 = *(void **)(v42 + 24);
  }
  long long v12 = v11;
  _Block_object_dispose(&v41, 8);
  if (v12)
  {
    id v13 = objc_alloc_init(v12);
    long long v14 = [v9 imageForHost:v10];
    uint64_t v35 = 0;
    uint64_t v36 = (uint64_t)&v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__15;
    v39 = __Block_byref_object_dispose__15;
    id v40 = 0;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __66__WBSLPLinkMetadataProvider_linkMetadataForURL_webView_iconCache___block_invoke;
    v30[3] = &unk_1E5E43648;
    v34 = &v35;
    id v15 = v14;
    id v31 = v15;
    id v32 = v9;
    id v33 = v10;
    uint64_t v16 = (void *)MEMORY[0x1AD115160](v30);
    dispatch_queue_t v17 = [v8 URL];
    int v18 = [v7 isEqual:v17];

    if (v18)
    {
      uint64_t v19 = [v13 _startFetchingMetadataForWebView:v8 isNonAppInitiated:1 completionHandler:v16];
      v20 = *(void **)(v36 + 40);
      *(void *)(v36 + 40) = v19;
    }
    else
    {
      v22 = objc_msgSend(MEMORY[0x1E4F18DA8], "safari_nonAppInitiatedRequestWithURL:", v7);
      uint64_t v23 = [v13 _startFetchingMetadataForRequest:v22 completionHandler:v16];
      objc_super v24 = *(void **)(v36 + 40);
      *(void *)(v36 + 40) = v23;

      v20 = [v8 title];
      [*(id *)(v36 + 40) setTitle:v20];
    }

    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2050000000;
    v25 = (void *)getLPImageClass_softClass;
    uint64_t v49 = getLPImageClass_softClass;
    if (!getLPImageClass_softClass)
    {
      uint64_t v41 = MEMORY[0x1E4F143A8];
      uint64_t v42 = 3221225472;
      uint64_t v43 = (uint64_t)__getLPImageClass_block_invoke;
      v44 = &unk_1E5E41610;
      v45 = &v46;
      LinkPresentationLibraryCore();
      Class Class = objc_getClass("LPImage");
      *(void *)(v45[1] + 24) = Class;
      getLPImageClass_softClass Class = *(void *)(v45[1] + 24);
      v25 = (void *)v47[3];
    }
    v27 = v25;
    _Block_object_dispose(&v46, 8);
    v28 = (void *)[[v27 alloc] initWithPlatformImage:v15];
    [*(id *)(v36 + 40) setIcon:v28];

    id v21 = *(id *)(v36 + 40);
    _Block_object_dispose(&v35, 8);
  }
  else
  {
LABEL_7:
    id v21 = 0;
  }

  return v21;
}

void __66__WBSLPLinkMetadataProvider_linkMetadataForURL_webView_iconCache___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__WBSLPLinkMetadataProvider_linkMetadataForURL_webView_iconCache___block_invoke_cold_1(v4, v3);
    }
  }
  else
  {
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) icon];
    id v6 = [v5 platformImage];

    if (!*(void *)(a1 + 32) && v6) {
      [*(id *)(a1 + 40) saveImage:v6 forHost:*(void *)(a1 + 48)];
    }
  }
}

+ (id)unpackMetadataFromResponse:(id)a3
{
  return (id)[a3 metadata];
}

- (WBSLPLinkMetadataProvider)init
{
  return [(WBSLPLinkMetadataProvider *)self initWithCacheDirectoryURL:0];
}

- (void)reuseMetadataOfURLString:(id)a3 forURLString:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__WBSLPLinkMetadataProvider_reuseMetadataOfURLString_forURLString_completionHandler___block_invoke;
  v15[3] = &unk_1E5E42348;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(internalQueue, v15);
}

uint64_t __85__WBSLPLinkMetadataProvider_reuseMetadataOfURLString_forURLString_completionHandler___block_invoke(void *a1)
{
  if (*(void *)(a1[4] + 40)) {
    return [*(id *)(a1[4] + 40) reuseMetadataOfURLString:a1[5] forURLString:a1[6] completionHandler:a1[7]];
  }
  else {
    return (*(uint64_t (**)(void))(a1[7] + 16))();
  }
}

- (BOOL)canHandleRequest:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  isKindOfClass Class = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4
{
  *a4 = 1;
  return [(WBSLPLinkMetadataProvider *)self _preparedResponseForRequest:a3];
}

- (void)prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4
{
  id v6 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__WBSLPLinkMetadataProvider_prepareResponseForRequest_allowDelayedResponse___block_invoke;
  block[3] = &unk_1E5E40D88;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

void __76__WBSLPLinkMetadataProvider_prepareResponseForRequest_allowDelayedResponse___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 48))
  {
    id v3 = *(void **)(v2 + 56);
    if (!v3)
    {
      uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 56);
      *(void *)(v5 + 56) = v4;

      id v3 = *(void **)(*(void *)(a1 + 32) + 56);
    }
    id v9 = [[_WBSPendingLPLinkMetadataRequest alloc] initWithRequest:*(void *)(a1 + 40) allowDelayedResponse:*(unsigned __int8 *)(a1 + 48)];
    objc_msgSend(v3, "addObject:");
  }
  else
  {
    id v9 = (_WBSPendingLPLinkMetadataRequest *)*(id *)(a1 + 40);
    id v7 = objc_msgSend(*(id *)(a1 + 32), "_operationForRequest:");

    if (!v7)
    {
      id v8 = [[WBSLPLinkMetadataFetchOperation alloc] initWithRequest:v9 operationCompletionHandler:0];
      [*(id *)(a1 + 32) _setOperation:v8 forRequest:v9];
      [*(id *)(a1 + 32) _prepareCachedResponseForRequest:v9 allowDelayedResponse:*(unsigned __int8 *)(a1 + 48)];
    }
  }
}

- (void)savePendingChangesBeforeTermination
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__WBSLPLinkMetadataProvider_savePendingChangesBeforeTermination__block_invoke;
  block[3] = &unk_1E5E40968;
  void block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __64__WBSLPLinkMetadataProvider_savePendingChangesBeforeTermination__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeAllOperations];
  [*(id *)(*(void *)(a1 + 32) + 24) cancelAllOperations];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  return [v2 savePendingChangesBeforeTermination];
}

- (void)stopWatchingUpdatesForRequest:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__WBSLPLinkMetadataProvider_stopWatchingUpdatesForRequest___block_invoke;
  v7[3] = &unk_1E5E40D38;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __59__WBSLPLinkMetadataProvider_stopWatchingUpdatesForRequest___block_invoke(uint64_t a1)
{
  id v3 = *(id *)(a1 + 32);
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "_operationForRequest:");
  if (v2)
  {
    [*(id *)(a1 + 40) _removeOperationForRequest:v3];
    [v2 cancel];
  }
  [*(id *)(a1 + 40) _discardPreparedResponseForRequest:v3];
}

- (void)emptyCaches
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__WBSLPLinkMetadataProvider_emptyCaches__block_invoke;
  block[3] = &unk_1E5E40968;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __40__WBSLPLinkMetadataProvider_emptyCaches__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeAllMetadataWithCompletionHandler:&__block_literal_global_24];
}

- (BOOL)cacheData:(id)a3 forRequest:(id)a4 usingToken:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v8;
      id v12 = [v11 first];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = [v11 second];
        objc_opt_class();
        isKindOfClass Class = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v15 = [v11 first];
          id v16 = [v11 second];
          internalQueue = self->_internalQueue;
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __61__WBSLPLinkMetadataProvider_cacheData_forRequest_usingToken___block_invoke;
          v22[3] = &unk_1E5E412F0;
          v22[4] = self;
          id v23 = v10;
          id v24 = v15;
          id v25 = v16;
          id v18 = v16;
          id v19 = v15;
          dispatch_async(internalQueue, v22);

          BOOL v20 = 1;
LABEL_9:

          goto LABEL_10;
        }
      }
      else
      {
      }
      BOOL v20 = 0;
      goto LABEL_9;
    }
  }
  BOOL v20 = 0;
LABEL_10:

  return v20;
}

void __61__WBSLPLinkMetadataProvider_cacheData_forRequest_usingToken___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 40))
  {
    id v3 = [*(id *)(a1 + 48) urlString];
    id v4 = [*(id *)(a1 + 48) lastFetchDate];
    uint64_t v5 = [*(id *)(a1 + 48) lastFetchDidSucceed];
    uint64_t v6 = [*(id *)(a1 + 48) lastFetchDidSucceed];
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v7 = *(void **)(*(void *)(a1 + 32) + 40);
    uint64_t v8 = *(void *)(a1 + 56);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__WBSLPLinkMetadataProvider_cacheData_forRequest_usingToken___block_invoke_2;
    v10[3] = &unk_1E5E43670;
    objc_copyWeak(&v12, &location);
    id v11 = *(id *)(a1 + 40);
    [v7 setMetadata:v8 forURLString:v3 lastFetchDate:v4 lastFetchDidSucceed:v5 metadataHasImage:v6 completionHandler:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 64));
    [WeakRetained siteMetadataProvider:*(void *)(a1 + 32) didFinishCachingDataWithToken:*(void *)(a1 + 40)];
  }
}

void __61__WBSLPLinkMetadataProvider_cacheData_forRequest_usingToken___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 8);
    [v3 siteMetadataProvider:v4 didFinishCachingDataWithToken:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

uint64_t __40__WBSLPLinkMetadataProvider__setUpCache__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
  return [*(id *)(a1 + 32) _serveAllPendingRequests];
}

- (void)_prepareCachedResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__WBSLPLinkMetadataProvider__prepareCachedResponseForRequest_allowDelayedResponse___block_invoke;
  v8[3] = &unk_1E5E43710;
  objc_copyWeak(&v10, &location);
  id v7 = v6;
  id v9 = v7;
  BOOL v11 = a4;
  [(WBSLPLinkMetadataProvider *)self _getCachedMetadataInfoForRequest:v7 completionHandler:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __83__WBSLPLinkMetadataProvider__prepareCachedResponseForRequest_allowDelayedResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[4];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__WBSLPLinkMetadataProvider__prepareCachedResponseForRequest_allowDelayedResponse___block_invoke_2;
    block[3] = &unk_1E5E436E8;
    void block[4] = WeakRetained;
    id v8 = v3;
    id v9 = *(id *)(a1 + 32);
    objc_copyWeak(&v10, (id *)(a1 + 40));
    char v11 = *(unsigned char *)(a1 + 48);
    dispatch_async(v6, block);
    objc_destroyWeak(&v10);
  }
}

void __83__WBSLPLinkMetadataProvider__prepareCachedResponseForRequest_allowDelayedResponse___block_invoke_2(uint64_t a1)
{
  if [*(id *)(a1 + 32) _shouldStartFetchOperationForMetadataWithInfo:*(void *)(a1 + 40)]&& (objc_msgSend(*(id *)(a1 + 48), "allowFetching"))
  {
    uint64_t v2 = [WBSLPLinkMetadataFetchOperation alloc];
    uint64_t v3 = *(void *)(a1 + 48);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __83__WBSLPLinkMetadataProvider__prepareCachedResponseForRequest_allowDelayedResponse___block_invoke_3;
    v8[3] = &unk_1E5E436C0;
    objc_copyWeak(&v10, (id *)(a1 + 56));
    id v9 = *(id *)(a1 + 48);
    char v11 = *(unsigned char *)(a1 + 64);
    id v4 = [(WBSLPLinkMetadataFetchOperation *)v2 initWithRequest:v3 operationCompletionHandler:v8];
    [*(id *)(*(void *)(a1 + 32) + 24) addOperation:v4];
    [*(id *)(a1 + 32) _setOperation:v4 forRequest:*(void *)(a1 + 48)];

    objc_destroyWeak(&v10);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v7 = *(void **)(a1 + 32);
    [v7 _provideCachedResponseIfAvailableForRequest:v5 withMetadataInfo:v6];
  }
}

void __83__WBSLPLinkMetadataProvider__prepareCachedResponseForRequest_allowDelayedResponse___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _didReceiveNewMetadata:v5 forRequest:*(void *)(a1 + 32) allowDelayedResponse:*(unsigned __int8 *)(a1 + 48)];
  }
}

- (void)_didReceiveNewMetadata:(id)a3 forRequest:(id)a4 allowDelayedResponse:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__WBSLPLinkMetadataProvider__didReceiveNewMetadata_forRequest_allowDelayedResponse___block_invoke;
  block[3] = &unk_1E5E43760;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  objc_copyWeak(&v15, &location);
  dispatch_async(internalQueue, block);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __84__WBSLPLinkMetadataProvider__didReceiveNewMetadata_forRequest_allowDelayedResponse___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__WBSLPLinkMetadataProvider__didReceiveNewMetadata_forRequest_allowDelayedResponse___block_invoke_2;
  v5[3] = &unk_1E5E43738;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  [v2 _cacheMetadata:v3 forRequest:v4 completionHandler:v5];

  objc_destroyWeak(&v8);
}

void __84__WBSLPLinkMetadataProvider__didReceiveNewMetadata_forRequest_allowDelayedResponse___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[4];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __84__WBSLPLinkMetadataProvider__didReceiveNewMetadata_forRequest_allowDelayedResponse___block_invoke_3;
    v7[3] = &unk_1E5E412F0;
    void v7[4] = WeakRetained;
    id v8 = a1[4];
    id v9 = a1[5];
    id v10 = v3;
    dispatch_async(v6, v7);
  }
}

void __84__WBSLPLinkMetadataProvider__didReceiveNewMetadata_forRequest_allowDelayedResponse___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _operationForRequest:*(void *)(a1 + 40)];
  if (v2)
  {
    id v6 = v2;
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = *(void **)(a1 + 32);
    if (v4)
    {
      [v5 _storeAndNotifySuccessfulResponseForRequest:v3 withMetadata:v4 didReceiveNewData:1];
      [*(id *)(a1 + 32) _removeOperationForRequest:*(void *)(a1 + 40)];
    }
    else
    {
      [v5 _provideCachedResponseIfAvailableForRequest:v3 withMetadataInfo:*(void *)(a1 + 56)];
    }
    uint64_t v2 = v6;
  }
}

- (void)_getCachedMetadataWithInfo:(id)a3 completionHandler:(id)a4
{
  cache = self->_cache;
  if (cache) {
    [(WBSLPLinkMetadataCache *)cache getMetadataWithInfo:a3 completionHandler:a4];
  }
  else {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)_cacheMetadata:(id)a3 forRequest:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (self->_cache)
  {
    objc_initWeak(&location, self);
    id v12 = [v8 dataRepresentation];
    id v13 = [v9 url];
    id v14 = [v13 absoluteString];

    id v15 = [v8 URL];
    id v16 = [v15 absoluteString];

    id v17 = [v8 image];
    if (v17)
    {
      BOOL v18 = 1;
    }
    else
    {
      id v19 = [v8 icon];
      BOOL v18 = v19 != 0;
    }
    cache = self->_cache;
    id v21 = [MEMORY[0x1E4F1C9C8] date];
    id v25 = v9;
    BOOL v22 = [v12 length] != 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __73__WBSLPLinkMetadataProvider__cacheMetadata_forRequest_completionHandler___block_invoke;
    v26[3] = &unk_1E5E43788;
    id v23 = v16;
    id v27 = v23;
    id v24 = v14;
    id v28 = v24;
    id v29 = v11;
    objc_copyWeak(&v30, &location);
    [(WBSLPLinkMetadataCache *)cache setMetadata:v12 forURLString:v24 lastFetchDate:v21 lastFetchDidSucceed:v22 metadataHasImage:v18 completionHandler:v26];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
    id v9 = v25;
  }
  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __73__WBSLPLinkMetadataProvider__cacheMetadata_forRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && *(void *)(a1 + 32) && !objc_msgSend(*(id *)(a1 + 40), "isEqualToString:"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      id v6 = (void *)*((void *)WeakRetained + 5);
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __73__WBSLPLinkMetadataProvider__cacheMetadata_forRequest_completionHandler___block_invoke_2;
      v9[3] = &unk_1E5E411B0;
      id v11 = *(id *)(a1 + 48);
      id v10 = v3;
      [v6 reuseMetadataOfURLString:v7 forURLString:v8 completionHandler:v9];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __73__WBSLPLinkMetadataProvider__cacheMetadata_forRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_getCachedMetadataInfoForRequest:(id)a3 completionHandler:(id)a4
{
  cache = self->_cache;
  if (cache)
  {
    id v6 = a4;
    id v9 = [a3 url];
    uint64_t v7 = [v9 absoluteString];
    [(WBSLPLinkMetadataCache *)cache getMetadataInfoForURLString:v7 completionHandler:v6];
  }
  else
  {
    uint64_t v8 = (void (*)(void))*((void *)a4 + 2);
    id v9 = a4;
    v8();
  }
}

- (BOOL)_shouldStartFetchOperationForMetadataWithInfo:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 lastFetchDidSucceed])
    {
      char v5 = [v4 metadataHasImage];
      id v6 = [v4 lastFetchDate];
      [v6 timeIntervalSinceNow];
      double v8 = v7;

      if (v5) {
        double v9 = -345600.0;
      }
      else {
        double v9 = -172800.0;
      }
      BOOL v10 = v8 < v9;
    }
    else
    {
      id v11 = [v4 lastFetchDate];
      [v11 timeIntervalSinceNow];
      BOOL v10 = v12 < -604800.0;
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (void)_provideCachedResponseIfAvailableForRequest:(id)a3 withMetadataInfo:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 isMetadataCached])
  {
    objc_initWeak(&location, self);
    double v8 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      double v9 = [v6 url];
      BOOL v10 = [v9 absoluteString];
      *(_DWORD *)buf = 141558275;
      uint64_t v20 = 1752392040;
      __int16 v21 = 2117;
      BOOL v22 = v10;
      _os_log_impl(&dword_1ABB70000, v8, OS_LOG_TYPE_INFO, "Providing cached LP metadata for URL: %{sensitive, mask.hash}@", buf, 0x16u);
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __90__WBSLPLinkMetadataProvider__provideCachedResponseIfAvailableForRequest_withMetadataInfo___block_invoke;
    v15[3] = &unk_1E5E437B0;
    objc_copyWeak(&v17, &location);
    id v16 = v6;
    [(WBSLPLinkMetadataProvider *)self _getCachedMetadataWithInfo:v7 completionHandler:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    id v11 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      double v12 = v11;
      id v13 = [v6 url];
      id v14 = [v13 absoluteString];
      *(_DWORD *)buf = 141558275;
      uint64_t v20 = 1752392040;
      __int16 v21 = 2117;
      BOOL v22 = v14;
      _os_log_impl(&dword_1ABB70000, v12, OS_LOG_TYPE_INFO, "No cached LP metadata found for URL: %{sensitive, mask.hash}@", buf, 0x16u);
    }
    [(WBSLPLinkMetadataProvider *)self _storeAndNotifySuccessfulResponseForRequest:v6 withMetadata:0 didReceiveNewData:0];
    [(WBSLPLinkMetadataProvider *)self _removeOperationForRequest:v6];
  }
}

void __90__WBSLPLinkMetadataProvider__provideCachedResponseIfAvailableForRequest_withMetadataInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  char v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[4];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__WBSLPLinkMetadataProvider__provideCachedResponseIfAvailableForRequest_withMetadataInfo___block_invoke_2;
    block[3] = &unk_1E5E40D60;
    id v8 = v3;
    double v9 = v5;
    id v10 = *(id *)(a1 + 32);
    dispatch_async(v6, block);
  }
}

void __90__WBSLPLinkMetadataProvider__provideCachedResponseIfAvailableForRequest_withMetadataInfo___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F30A78], "metadataWithDataRepresentation:");
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v3 = (id)v2;
  [*(id *)(a1 + 40) _storeAndNotifySuccessfulResponseForRequest:*(void *)(a1 + 48) withMetadata:v2 didReceiveNewData:0];
  [*(id *)(a1 + 40) _removeOperationForRequest:*(void *)(a1 + 48)];
}

- (void)_storeAndNotifySuccessfulResponseForRequest:(id)a3 withMetadata:(id)a4 didReceiveNewData:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [WBSLPLinkMetadataResponse alloc];
  id v11 = [v9 url];
  double v12 = [(WBSLPLinkMetadataResponse *)v10 initWithURL:v11 metadata:v8];

  [(WBSLPLinkMetadataProvider *)self _storePreparedResponse:v12 forRequest:v9];
  [(WBSLPLinkMetadataProvider *)self _notifyResponse:v12 ofType:0 didReceiveNewData:v5 forRequest:v9];
}

- (void)_notifyResponse:(id)a3 ofType:(int64_t)a4 didReceiveNewData:(BOOL)a5 forRequest:(id)a6
{
  BOOL v6 = a5;
  p_providerDelegate = &self->_providerDelegate;
  id v11 = a6;
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_providerDelegate);
  [WeakRetained siteMetadataProvider:self didReceiveResponse:v12 ofType:a4 didReceiveNewData:v6 forRequest:v11];
}

- (id)_preparedResponseForRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_requestsToResponses;
  objc_sync_enter(v5);
  BOOL v6 = [(NSMutableDictionary *)self->_requestsToResponses objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)_discardPreparedResponseForRequest:(id)a3
{
  id v5 = a3;
  id v4 = self->_requestsToResponses;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)self->_requestsToResponses removeObjectForKey:v5];
  objc_sync_exit(v4);
}

- (void)_storePreparedResponse:(id)a3 forRequest:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = self->_requestsToResponses;
  objc_sync_enter(v7);
  [(NSMutableDictionary *)self->_requestsToResponses setObject:v8 forKeyedSubscript:v6];
  objc_sync_exit(v7);
}

- (id)_operationForRequest:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_requestsToOperations objectForKeyedSubscript:a3];
}

- (void)_setOperation:(id)a3 forRequest:(id)a4
{
}

- (void)_removeOperationForRequest:(id)a3
{
}

- (void)_removeAllOperations
{
}

- (WBSSiteMetadataProviderDelegate)providerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
  return (WBSSiteMetadataProviderDelegate *)WeakRetained;
}

- (NSURL)cacheDirectoryURL
{
  return self->_cacheDirectoryURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDirectoryURL, 0);
  objc_destroyWeak((id *)&self->_providerDelegate);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_requestsToOperations, 0);
  objc_storeStrong((id *)&self->_requestsToResponses, 0);
}

void __66__WBSLPLinkMetadataProvider_linkMetadataForURL_webView_iconCache___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_ERROR, "Fetching Link Presentation metadata for share sheet failed: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end