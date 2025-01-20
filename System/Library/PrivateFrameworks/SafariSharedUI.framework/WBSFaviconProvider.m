@interface WBSFaviconProvider
+ (CGSize)defaultFaviconSize;
- (BOOL)_isIconDateExpired:(id)a3;
- (BOOL)canHandleRequest:(id)a3;
- (BOOL)isReadOnly;
- (BOOL)providesFavicons;
- (CGSize)preferredIconSize;
- (NSArray)allIconScales;
- (NSURL)baseURL;
- (WBSFaviconProvider)initWithPersistenceBaseURL:(id)a3 persistenceName:(id)a4 preferredIconSize:(CGSize)a5 atScale:(double)a6 allScales:(id)a7 isReadOnly:(BOOL)a8 shouldCheckIntegrityWhenOpeningDatabaseBlock:(id)a9;
- (WBSFaviconProvider)initWithPersistenceBaseURL:(id)a3 persistenceName:(id)a4 preferredIconSize:(CGSize)a5 atScale:(double)a6 allScales:(id)a7 shouldCheckIntegrityWhenOpeningDatabaseBlock:(id)a8;
- (WBSSiteMetadataProviderDelegate)providerDelegate;
- (double)preferredIconScale;
- (id)_cachedResponseForRequest:(id)a3;
- (id)_hostFromRequest:(id)a3;
- (id)_hostFromURL:(id)a3;
- (id)_requestsForHost:(id)a3;
- (id)_responseCacheKeyForRequest:(id)a3;
- (id)_responseDictionaryKeyForRequest:(id)a3;
- (id)builtInIconForRequest:(id)a3;
- (id)fallbackIconForRequest:(id)a3;
- (id)persistenceController;
- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4;
- (int64_t)providerState;
- (void)_addCachedResponse:(id)a3 forRequest:(id)a4;
- (void)_atomicallyLinkPageURLs:(id)a3 toIconWithInfo:(id)a4 isPrivate:(BOOL)a5;
- (void)_atomicallySaveImageData:(id)a3 iconURL:(id)a4 pageURL:(id)a5 originalPageURL:(id)a6 size:(CGSize)a7 isPrivate:(BOOL)a8 completionHandler:(id)a9;
- (void)_confirmImageDataShouldBeSaved:(id)a3 size:(CGSize)a4 pageURL:(id)a5 iconURL:(id)a6 includingPrivateData:(BOOL)a7 completionHandler:(id)a8;
- (void)_getIconForRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)_linkPageURL:(id)a3 toIconWithInfo:(id)a4 isPrivate:(BOOL)a5 completionHandler:(id)a6;
- (void)_prepareAndSendResponseForRequests:(id)a3 forceDidReceiveNewData:(BOOL)a4;
- (void)_registerRequest:(id)a3;
- (void)_removeCachedResponsesForRequest:(id)a3;
- (void)_removeCachedResponsesForURL:(id)a3;
- (void)_saveImageData:(id)a3 iconURL:(id)a4 pageURL:(id)a5 originalPageURL:(id)a6 size:(CGSize)a7 isPrivate:(BOOL)a8 completionHandler:(id)a9;
- (void)_updateOutstandingRequestsAfterSuccessfulSetup;
- (void)_updateOutstandingRequestsForPageURL:(id)a3 forceDidReceiveNewData:(BOOL)a4;
- (void)cleanUpAfterPersistenceSetUpDidSucceed:(BOOL)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)emptyCaches;
- (void)flushPrivateDataFromMemoryWithCompletionHandler:(id)a3;
- (void)imageForRequestDuringPersistenceSetUp:(id)a3 completionHandler:(id)a4;
- (void)linkIconFromPageURL:(id)a3 toCurrentPageURL:(id)a4 isPrivate:(BOOL)a5 completionHandler:(id)a6;
- (void)prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4;
- (void)releasePrivateData;
- (void)removeAllIconsForURLStringsNotIn:(id)a3 completionHandler:(id)a4;
- (void)removeIconForURLString:(id)a3 completionHandler:(id)a4;
- (void)retainPrivateData;
- (void)saveFaviconImageData:(id)a3 iconURL:(id)a4 pageURL:(id)a5 originalPageURL:(id)a6 size:(CGSize)a7 isPrivate:(BOOL)a8 completionHandler:(id)a9;
- (void)savePendingChangesBeforeTermination;
- (void)setProviderDelegate:(id)a3;
- (void)setUpPersistenceAtPath:(id)a3 completionHandler:(id)a4;
- (void)setUpWithCompletionHandler:(id)a3;
- (void)shouldIconDataBeSavedForIconWithPageURL:(id)a3 originalPageURL:(id)a4 iconURL:(id)a5 size:(CGSize)a6 isPrivate:(BOOL)a7 completionHandler:(id)a8;
- (void)stopWatchingUpdatesForRequest:(id)a3;
- (void)webViewMetadataFetchOperation:(id)a3 didFinishUsingWebView:(id)a4;
- (void)webViewMetadataFetchOperation:(id)a3 getWebViewOfSize:(CGSize)a4 withConfiguration:(id)a5 completionHandler:(id)a6;
@end

@implementation WBSFaviconProvider

- (void)setProviderDelegate:(id)a3
{
}

+ (CGSize)defaultFaviconSize
{
  double v2 = 16.0;
  double v3 = 16.0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[10] = 2;
    [WeakRetained _updateOutstandingRequestsAfterSuccessfulSetup];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_46(uint64_t a1)
{
  WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v3 = WBS_LOG_CHANNEL_PREFIXFaviconProvider();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_46_cold_1();
    }
    dispatch_resume(WeakRetained[4]);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

void __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 112) + 16))();
  double v3 = WBS_LOG_CHANNEL_PREFIXFaviconProvider();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_cold_1();
  }
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 32));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_46;
  v11[3] = &unk_1E5E41900;
  objc_copyWeak(&v13, (id *)(a1 + 48));
  id v12 = *(id *)(a1 + 40);
  uint64_t v4 = (void *)MEMORY[0x1AD115160](v11);
  v5 = *(void **)(*(void *)(a1 + 32) + 56);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_47;
  v7[3] = &unk_1E5E419A0;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v8 = v4;
  char v10 = v2;
  id v6 = v4;
  [v5 openAndCheckIntegrity:v2 createIfNeeded:0 fallBackToMemoryStoreIfError:0 completionHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v13);
}

- (void)_updateOutstandingRequestsAfterSuccessfulSetup
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__WBSFaviconProvider__updateOutstandingRequestsAfterSuccessfulSetup__block_invoke;
  block[3] = &unk_1E5E408C0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __68__WBSFaviconProvider__updateOutstandingRequestsAfterSuccessfulSetup__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 8) allValues];
  uint64_t v2 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v18;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v18 != v3) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v17 + 1) + 8 * v4);
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v6 = v5;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v14;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v14 != v8) {
                objc_enumerationMutation(v6);
              }
              char v10 = *(void **)(a1 + 32);
              v11 = [*(id *)(*((void *)&v13 + 1) + 8 * v9) url];
              [v10 _removeCachedResponsesForURL:v11];

              ++v9;
            }
            while (v7 != v9);
            uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v21 count:16];
          }
          while (v7);
        }

        [*(id *)(a1 + 32) _prepareAndSendResponseForRequests:v6 forceDidReceiveNewData:0];
        ++v4;
      }
      while (v4 != v2);
      uint64_t v2 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v2);
  }
}

- (WBSFaviconProvider)initWithPersistenceBaseURL:(id)a3 persistenceName:(id)a4 preferredIconSize:(CGSize)a5 atScale:(double)a6 allScales:(id)a7 isReadOnly:(BOOL)a8 shouldCheckIntegrityWhenOpeningDatabaseBlock:(id)a9
{
  BOOL v10 = a8;
  double height = a5.height;
  double width = a5.width;
  id v18 = a3;
  id v19 = a4;
  id v20 = a7;
  id v21 = a9;
  v45.receiver = self;
  v45.super_class = (Class)WBSFaviconProvider;
  v22 = [(WBSFaviconProvider *)&v45 init];
  uint64_t v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_baseURL, a3);
    v24 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.Safari.WBSFaviconProvider", v24);
    internalQueue = v23->_internalQueue;
    v23->_internalQueue = (OS_dispatch_queue *)v25;

    dispatch_queue_t v27 = dispatch_queue_create("com.apple.Safari.WBSFaviconProviderInternalSaving", v24);
    internalSavingQueue = v23->_internalSavingQueue;
    v23->_internalSavingQueue = (OS_dispatch_queue *)v27;

    uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionary];
    hostsToRequestsMap = v23->_hostsToRequestsMap;
    v23->_hostsToRequestsMap = (NSMutableDictionary *)v29;

    v31 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    responseCache = v23->_responseCache;
    v23->_responseCache = v31;

    v23->_providerState = 0;
    uint64_t v33 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    calendar = v23->_calendar;
    v23->_calendar = (NSCalendar *)v33;

    v23->_expirationInterval = 604800.0;
    v23->_preferredIconSize.double width = width;
    v23->_preferredIconSize.double height = height;
    v23->_preferredIconScale = a6;
    v23->_scaledPreferredIconSize.double width = width * a6;
    v23->_scaledPreferredIconSize.double height = height * a6;
    uint64_t v35 = [v20 copy];
    allIconScales = v23->_allIconScales;
    v23->_allIconScales = (NSArray *)v35;

    v23->_isReadOnly = v10;
    uint64_t v37 = MEMORY[0x1AD115160](v21);
    id shouldCheckIntegrityWhenOpeningDatabaseBlock = v23->_shouldCheckIntegrityWhenOpeningDatabaseBlock;
    v23->_id shouldCheckIntegrityWhenOpeningDatabaseBlock = (id)v37;

    uint64_t v39 = [MEMORY[0x1E4F28BD0] set];
    requestsPendingResponse = v23->_requestsPendingResponse;
    v23->_requestsPendingResponse = (NSCountedSet *)v39;

    v41 = -[WBSFaviconProviderPersistenceController initWithPersistenceBaseURL:databaseName:preferredIconSize:isReadOnly:]([WBSFaviconProviderPersistenceController alloc], "initWithPersistenceBaseURL:databaseName:preferredIconSize:isReadOnly:", v23->_baseURL, v19, v10, v23->_scaledPreferredIconSize.width, v23->_scaledPreferredIconSize.height);
    persistenceController = v23->_persistenceController;
    v23->_persistenceController = v41;

    v43 = v23;
  }

  return v23;
}

void __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_47(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    switch(a2)
    {
      case 0:
        BOOL v10 = (void *)WeakRetained[7];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_2;
        v18[3] = &unk_1E5E41900;
        uint64_t v8 = &v20;
        objc_copyWeak(&v20, v4);
        id v19 = *(id *)(a1 + 32);
        [v10 removeIconFilesNotReferencedInDatabaseWithCompletionHandler:v18];
        uint64_t v9 = v19;
        goto LABEL_6;
      case 1:
      case 3:
        WeakRetained[10] = 1;
        uint64_t v7 = WeakRetained[17];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_4;
        v13[3] = &unk_1E5E419C8;
        uint64_t v8 = &v15;
        objc_copyWeak(&v15, v4);
        id v14 = *(id *)(a1 + 32);
        [v6 setUpPersistenceAtPath:v7 completionHandler:v13];
        uint64_t v9 = v14;
LABEL_6:

        objc_destroyWeak(v8);
        break;
      case 2:
        v11 = (void *)WeakRetained[7];
        uint64_t v12 = *(unsigned __int8 *)(a1 + 48);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_3;
        v16[3] = &unk_1E5E41928;
        v16[4] = WeakRetained;
        id v17 = *(id *)(a1 + 32);
        [v11 openAndCheckIntegrity:v12 createIfNeeded:0 fallBackToMemoryStoreIfError:1 completionHandler:v16];

        break;
      default:
        break;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)setUpWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E419F0;
  void v7[4] = self;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (WBSFaviconProvider)initWithPersistenceBaseURL:(id)a3 persistenceName:(id)a4 preferredIconSize:(CGSize)a5 atScale:(double)a6 allScales:(id)a7 shouldCheckIntegrityWhenOpeningDatabaseBlock:(id)a8
{
  return -[WBSFaviconProvider initWithPersistenceBaseURL:persistenceName:preferredIconSize:atScale:allScales:isReadOnly:shouldCheckIntegrityWhenOpeningDatabaseBlock:](self, "initWithPersistenceBaseURL:persistenceName:preferredIconSize:atScale:allScales:isReadOnly:shouldCheckIntegrityWhenOpeningDatabaseBlock:", a3, a4, a7, 0, a8, a5.width, a5.height, a6);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WBSFaviconProvider;
  [(WBSFaviconProvider *)&v2 dealloc];
}

- (id)persistenceController
{
  return self->_persistenceController;
}

- (int64_t)providerState
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__WBSFaviconProvider_providerState__block_invoke;
  v5[3] = &unk_1E5E407A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__WBSFaviconProvider_providerState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 80);
  return result;
}

- (id)fallbackIconForRequest:(id)a3
{
  return 0;
}

uint64_t __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 80) = 2;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_4(uint64_t a1, char a2)
{
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = (void *)*((void *)WeakRetained + 7);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_5;
    v8[3] = &unk_1E5E419A0;
    objc_copyWeak(&v10, v4);
    id v9 = *(id *)(a1 + 32);
    char v11 = a2;
    [v7 openAndCheckIntegrity:1 createIfNeeded:1 fallBackToMemoryStoreIfError:1 completionHandler:v8];

    objc_destroyWeak(&v10);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  objc_super v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((void *)WeakRetained + 7);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_6;
    v6[3] = &unk_1E5E41978;
    objc_copyWeak(&v8, v2);
    id v7 = *(id *)(a1 + 32);
    char v9 = *(unsigned char *)(a1 + 48);
    [v5 removeIconFilesNotReferencedInDatabaseWithCompletionHandler:v6];

    objc_destroyWeak(&v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v17 = a1;
    *((void *)WeakRetained + 10) = 2;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v4 = [*((id *)WeakRetained + 6) allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v21 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          char v9 = [v8 iconData];
          id v10 = [v8 iconURL];
          char v11 = [v8 pageURL];
          uint64_t v12 = [v8 originalPageURL];
          [v8 size];
          objc_msgSend(v3, "_atomicallySaveImageData:iconURL:pageURL:originalPageURL:size:isPrivate:completionHandler:", v9, v10, v11, v12, objc_msgSend(v8, "isPrivate"), 0, v13, v14);
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v5);
    }

    id v15 = (void *)v3[6];
    v3[6] = 0;

    [v3 _updateOutstandingRequestsAfterSuccessfulSetup];
    uint64_t v16 = *(unsigned __int8 *)(v17 + 48);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_7;
    v18[3] = &unk_1E5E41950;
    id v19 = *(id *)(v17 + 32);
    [v3 cleanUpAfterPersistenceSetUpDidSucceed:v16 completionHandler:v18];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)shouldIconDataBeSavedForIconWithPageURL:(id)a3 originalPageURL:(id)a4 iconURL:(id)a5 size:(CGSize)a6 isPrivate:(BOOL)a7 completionHandler:(id)a8
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  internalQueue = self->_internalQueue;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke;
  v24[3] = &unk_1E5E41A90;
  id v27 = v17;
  id v28 = v18;
  v24[4] = self;
  id v25 = v15;
  id v26 = v16;
  BOOL v31 = a7;
  CGFloat v29 = width;
  CGFloat v30 = height;
  id v20 = v17;
  id v21 = v16;
  id v22 = v15;
  id v23 = v18;
  dispatch_async(internalQueue, v24);
}

void __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 80);
  if (v2 == 1)
  {
    int64_t v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_5;
  }
  if (!v2)
  {
    int64_t v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_5:
    v3();
    return;
  }
  if (!*(void *)(a1 + 40) || (id v4 = *(void **)(a1 + 48)) == 0)
  {
    double v13 = WBS_LOG_CHANNEL_PREFIXFaviconProvider();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_cold_2();
    }
    double v14 = WBS_LOG_CHANNEL_PREFIXFaviconProvider();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_cold_1();
    }
    goto LABEL_18;
  }
  if (!*(void *)(a1 + 56))
  {
    id v15 = WBS_LOG_CHANNEL_PREFIXFaviconProvider();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_cold_4();
    }
    id v16 = WBS_LOG_CHANNEL_PREFIXFaviconProvider();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_cold_3((uint64_t *)(a1 + 56), v16);
    }
LABEL_18:
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    return;
  }
  int v5 = objc_msgSend(v4, "safari_shouldBeAssociatedWithFaviconFromRedirectedURL:");
  uint64_t v6 = 40;
  if (v5) {
    uint64_t v6 = 48;
  }
  id v7 = *(id *)(a1 + v6);
  id v8 = *(void **)(*(void *)(a1 + 32) + 56);
  char v9 = [*(id *)(a1 + 40) absoluteString];
  id v10 = [*(id *)(a1 + 56) absoluteString];
  uint64_t v11 = *(unsigned __int8 *)(a1 + 88);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_50;
  v17[3] = &unk_1E5E41A68;
  v17[4] = *(void *)(a1 + 32);
  id v21 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 40);
  char v23 = *(unsigned char *)(a1 + 88);
  id v19 = *(id *)(a1 + 56);
  long long v22 = *(_OWORD *)(a1 + 72);
  id v12 = v7;
  id v20 = v12;
  [v8 rejectedResourceInfosForPageURLString:v9 iconURLString:v10 includingPrivateData:v11 completionHandler:v17];
}

void __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_50(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v7 isRejectedResource])
        {
          id v8 = *(void **)(a1 + 32);
          char v9 = [v7 dateAdded];
          LOBYTE(v8) = [v8 _isIconDateExpired:v9];

          if ((v8 & 1) == 0)
          {
            (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

            goto LABEL_12;
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  id v10 = *(void **)(*(void *)(a1 + 32) + 56);
  uint64_t v11 = [*(id *)(a1 + 40) absoluteString];
  uint64_t v12 = *(unsigned __int8 *)(a1 + 88);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5E41A40;
  void v13[4] = *(void *)(a1 + 32);
  id v14 = *(id *)(a1 + 48);
  char v19 = *(unsigned char *)(a1 + 88);
  long long v18 = *(_OWORD *)(a1 + 72);
  id v17 = *(id *)(a1 + 64);
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 56);
  [v10 iconInfoForPageURLString:v11 includingPrivateData:v12 completionHandler:v13];

LABEL_12:
}

void __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 56);
  uint64_t v5 = [*(id *)(a1 + 40) absoluteString];
  uint64_t v6 = *(unsigned __int8 *)(a1 + 88);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_3;
  v10[3] = &unk_1E5E41A18;
  id v7 = v3;
  id v11 = v7;
  long long v16 = *(_OWORD *)(a1 + 72);
  id v8 = *(id *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v8;
  uint64_t v12 = v9;
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  char v17 = *(unsigned char *)(a1 + 88);
  [v4 iconInfoForIconURLString:v5 includingPrivateData:v6 completionHandler:v10];
}

void __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v35 = v3;
  if (v4)
  {
    uint64_t v5 = (double *)MEMORY[0x1E4F1DB30];
    double v6 = *MEMORY[0x1E4F1DB30];
    double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (*(double *)(a1 + 72) == *MEMORY[0x1E4F1DB30] && *(double *)(a1 + 80) == v7)
    {
      [v4 size];
      double v6 = *v5;
      double v7 = v5[1];
      if (v10 == *v5 && v9 == v7) {
        goto LABEL_31;
      }
    }
    if (v35)
    {
      uint64_t v12 = *(void **)(a1 + 40);
      id v13 = [v35 dateAdded];
      LOBYTE(v12) = [v12 _isIconDateExpired:v13];

      if ((v12 & 1) == 0)
      {
        [v35 size];
        double v15 = v14;
        double v17 = v16;
        [*(id *)(a1 + 32) size];
        if (+[WBSFaviconProviderUtilities isFaviconSize:morePreferrableThanFaviconSize:givenDesiredSize:](WBSFaviconProviderUtilities, "isFaviconSize:morePreferrableThanFaviconSize:givenDesiredSize:", v15, v17, v18, v19, *(double *)(*(void *)(a1 + 40) + 96), *(double *)(*(void *)(a1 + 40) + 104))|| [*(id *)(a1 + 32) hasGeneratedResolutions]&& (objc_msgSend(v35, "hasGeneratedResolutions") & 1) == 0)
        {
          long long v20 = *(void **)(a1 + 40);
          long long v21 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *(void *)(a1 + 48), *(void *)(a1 + 56), 0);
          [v20 _atomicallyLinkPageURLs:v21 toIconWithInfo:v35 isPrivate:*(unsigned __int8 *)(a1 + 88)];
        }
      }
      goto LABEL_31;
    }
    double v27 = *(double *)(a1 + 72);
    double v28 = *(double *)(a1 + 80);
    CGFloat v29 = *(void **)(a1 + 32);
    if (v27 != v6 || v28 != v7) {
      goto LABEL_24;
    }
    if (([v29 hasGeneratedResolutions] & 1) == 0)
    {
      double v27 = *(double *)(a1 + 72);
      double v28 = *(double *)(a1 + 80);
      CGFloat v29 = *(void **)(a1 + 32);
LABEL_24:
      [v29 size];
      if (+[WBSFaviconProviderUtilities isFaviconSize:morePreferrableThanFaviconSize:givenDesiredSize:](WBSFaviconProviderUtilities, "isFaviconSize:morePreferrableThanFaviconSize:givenDesiredSize:", v27, v28, v31, v32, *(double *)(*(void *)(a1 + 40) + 96), *(double *)(*(void *)(a1 + 40) + 104))&& ([*(id *)(a1 + 32) hasGeneratedResolutions] & 1) != 0)
      {
        goto LABEL_31;
      }
      uint64_t v33 = *(void *)(a1 + 64);
      v34 = *(void **)(a1 + 40);
      id v26 = [*(id *)(a1 + 32) dateAdded];
      (*(void (**)(uint64_t, uint64_t))(v33 + 16))(v33, [v34 _isIconDateExpired:v26]);
LABEL_28:

      goto LABEL_32;
    }
  }
  else if (v3)
  {
    long long v22 = *(void **)(a1 + 40);
    long long v23 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *(void *)(a1 + 48), *(void *)(a1 + 56), 0);
    [v22 _atomicallyLinkPageURLs:v23 toIconWithInfo:v35 isPrivate:*(unsigned __int8 *)(a1 + 88)];

    uint64_t v24 = *(void *)(a1 + 64);
    uint64_t v25 = *(void **)(a1 + 40);
    id v26 = [v35 dateAdded];
    (*(void (**)(uint64_t, uint64_t))(v24 + 16))(v24, [v25 _isIconDateExpired:v26]);
    goto LABEL_28;
  }
LABEL_31:
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_32:
}

- (void)linkIconFromPageURL:(id)a3 toCurrentPageURL:(id)a4 isPrivate:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__WBSFaviconProvider_linkIconFromPageURL_toCurrentPageURL_isPrivate_completionHandler___block_invoke;
  block[3] = &unk_1E5E41AE0;
  block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  BOOL v21 = a5;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(internalQueue, block);
}

void __87__WBSFaviconProvider_linkIconFromPageURL_toCurrentPageURL_isPrivate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 80) > 1uLL)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    if (v5 && *(void *)(a1 + 48))
    {
      double v6 = *(void **)(v2 + 56);
      double v7 = [v5 absoluteString];
      uint64_t v8 = *(unsigned __int8 *)(a1 + 64);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __87__WBSFaviconProvider_linkIconFromPageURL_toCurrentPageURL_isPrivate_completionHandler___block_invoke_55;
      v14[3] = &unk_1E5E41AB8;
      id v9 = *(id *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 32);
      id v16 = v9;
      v14[4] = v10;
      id v15 = *(id *)(a1 + 48);
      char v17 = *(unsigned char *)(a1 + 64);
      [v6 iconInfoForPageURLString:v7 includingPrivateData:v8 completionHandler:v14];
    }
    else
    {
      id v11 = WBS_LOG_CHANNEL_PREFIXFaviconProvider();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __87__WBSFaviconProvider_linkIconFromPageURL_toCurrentPageURL_isPrivate_completionHandler___block_invoke_cold_2();
      }
      id v12 = WBS_LOG_CHANNEL_PREFIXFaviconProvider();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __87__WBSFaviconProvider_linkIconFromPageURL_toCurrentPageURL_isPrivate_completionHandler___block_invoke_cold_1();
      }
      uint64_t v13 = *(void *)(a1 + 56);
      if (v13) {
        (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
      }
    }
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 56);
    if (v3)
    {
      uint64_t v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
}

void __87__WBSFaviconProvider_linkIconFromPageURL_toCurrentPageURL_isPrivate_completionHandler___block_invoke_55(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
    [v3 _atomicallyLinkPageURLs:v4 toIconWithInfo:v6 isPrivate:*(unsigned __int8 *)(a1 + 56)];
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, BOOL))(v5 + 16))(v5, v6 != 0);
  }
}

- (BOOL)_isIconDateExpired:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  [v4 timeIntervalSinceReferenceDate];
  BOOL v9 = v7 - v8 > self->_expirationInterval || v8 > v7;

  return v9;
}

- (void)saveFaviconImageData:(id)a3 iconURL:(id)a4 pageURL:(id)a5 originalPageURL:(id)a6 size:(CGSize)a7 isPrivate:(BOOL)a8 completionHandler:(id)a9
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  BOOL v21 = (void (**)(void))a9;
  if (!v18 || !v19 || !v20)
  {
    id v26 = WBS_LOG_CHANNEL_PREFIXFaviconProvider();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[WBSFaviconProvider saveFaviconImageData:iconURL:pageURL:originalPageURL:size:isPrivate:completionHandler:]();
    }
    double v27 = WBS_LOG_CHANNEL_PREFIXFaviconProvider();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478339;
      id v38 = v19;
      __int16 v39 = 2113;
      id v40 = v20;
      __int16 v41 = 2113;
      id v42 = v18;
      _os_log_debug_impl(&dword_1ABB70000, v27, OS_LOG_TYPE_DEBUG, "Cannot save icon, invalid page URL %{private}@, original page URL %{private}@, or icon URL %{private}@", buf, 0x20u);
      if (!v21) {
        goto LABEL_13;
      }
    }
    else if (!v21)
    {
      goto LABEL_13;
    }
    v21[2](v21);
    goto LABEL_13;
  }
  if (objc_msgSend(v20, "safari_shouldBeAssociatedWithFaviconFromRedirectedURL:", v19)) {
    long long v22 = v20;
  }
  else {
    long long v22 = v19;
  }
  id v23 = v22;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__WBSFaviconProvider_saveFaviconImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke;
  block[3] = &unk_1E5E41B08;
  block[4] = self;
  uint64_t v33 = v21;
  id v29 = v19;
  id v30 = v23;
  id v31 = v18;
  id v32 = v17;
  CGFloat v34 = width;
  CGFloat v35 = height;
  BOOL v36 = a8;
  id v25 = v23;
  dispatch_async(internalQueue, block);

LABEL_13:
}

void __108__WBSFaviconProvider_saveFaviconImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[10];
  switch(v3)
  {
    case 2:
      uint64_t v7 = *(void *)(a1 + 56);
      uint64_t v6 = *(void *)(a1 + 64);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      double v10 = *(double *)(a1 + 80);
      double v11 = *(double *)(a1 + 88);
      uint64_t v12 = *(unsigned __int8 *)(a1 + 96);
      uint64_t v13 = *(void *)(a1 + 72);
      objc_msgSend(v2, "_atomicallySaveImageData:iconURL:pageURL:originalPageURL:size:isPrivate:completionHandler:", v6, v7, v8, v9, v12, v13, v10, v11);
      break;
    case 1:
      if (!v2[6])
      {
        uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v15 = *(void *)(a1 + 32);
        id v16 = *(void **)(v15 + 48);
        *(void *)(v15 + 48) = v14;
      }
      id v18 = -[_WBSFaviconRecord initWithPageURL:originalPageURL:iconURL:iconData:size:isPrivate:]([_WBSFaviconRecord alloc], "initWithPageURL:originalPageURL:iconURL:iconData:size:isPrivate:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(unsigned __int8 *)(a1 + 96), *(double *)(a1 + 80), *(double *)(a1 + 88));
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "setObject:forKeyedSubscript:");
      [*(id *)(a1 + 32) _updateOutstandingRequestsForPageURL:*(void *)(a1 + 40) forceDidReceiveNewData:0];
      if (([*(id *)(a1 + 40) isEqual:*(void *)(a1 + 48)] & 1) == 0)
      {
        [*(id *)(*(void *)(a1 + 32) + 48) setObject:v18 forKeyedSubscript:*(void *)(a1 + 48)];
        [*(id *)(a1 + 32) _updateOutstandingRequestsForPageURL:*(void *)(a1 + 48) forceDidReceiveNewData:0];
      }
      uint64_t v17 = *(void *)(a1 + 72);
      if (v17) {
        (*(void (**)(void))(v17 + 16))();
      }

      break;
    case 0:
      uint64_t v4 = *(void *)(a1 + 72);
      if (v4)
      {
        uint64_t v5 = *(void (**)(void))(v4 + 16);
        v5();
      }
      break;
  }
}

- (void)_atomicallySaveImageData:(id)a3 iconURL:(id)a4 pageURL:(id)a5 originalPageURL:(id)a6 size:(CGSize)a7 isPrivate:(BOOL)a8 completionHandler:(id)a9
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a9;
  objc_initWeak(&location, self);
  internalSavingQueue = self->_internalSavingQueue;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __112__WBSFaviconProvider__atomicallySaveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke;
  v28[3] = &unk_1E5E41B30;
  objc_copyWeak(v34, &location);
  id v32 = v20;
  id v33 = v21;
  id v29 = v17;
  id v30 = v18;
  id v31 = v19;
  v34[1] = *(id *)&width;
  v34[2] = *(id *)&height;
  BOOL v35 = a8;
  id v23 = v20;
  id v24 = v19;
  id v25 = v18;
  id v26 = v17;
  id v27 = v21;
  dispatch_async(internalSavingQueue, v28);

  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
}

void __112__WBSFaviconProvider__atomicallySaveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_suspend(WeakRetained[5]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    double v8 = *(double *)(a1 + 80);
    double v9 = *(double *)(a1 + 88);
    uint64_t v10 = *(unsigned __int8 *)(a1 + 96);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __112__WBSFaviconProvider__atomicallySaveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke_2;
    v11[3] = &unk_1E5E41040;
    void v11[4] = v3;
    id v12 = *(id *)(a1 + 64);
    -[dispatch_object_t _saveImageData:iconURL:pageURL:originalPageURL:size:isPrivate:completionHandler:](v3, "_saveImageData:iconURL:pageURL:originalPageURL:size:isPrivate:completionHandler:", v4, v5, v6, v7, v10, v11, v8, v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __112__WBSFaviconProvider__atomicallySaveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 40));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_confirmImageDataShouldBeSaved:(id)a3 size:(CGSize)a4 pageURL:(id)a5 iconURL:(id)a6 includingPrivateData:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  objc_initWeak(&location, self);
  persistenceController = self->_persistenceController;
  id v20 = [v16 absoluteString];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke;
  v25[3] = &unk_1E5E41B58;
  objc_copyWeak(v30, &location);
  id v21 = v18;
  id v29 = v21;
  id v22 = v15;
  id v26 = v22;
  id v23 = v16;
  id v27 = v23;
  id v24 = v17;
  id v28 = v24;
  BOOL v31 = v9;
  v30[1] = *(id *)&width;
  v30[2] = *(id *)&height;
  [(WBSFaviconProviderPersistenceController *)persistenceController iconInfoForPageURLString:v20 includingPrivateData:v9 completionHandler:v25];

  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
}

void __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    char v41 = 0;
    +[WBSFaviconProviderUtilities sizeOfImageWithData:closestToPreferredSize:isMultiResolution:](WBSFaviconProviderUtilities, "sizeOfImageWithData:closestToPreferredSize:isMultiResolution:", *(void *)(a1 + 32), &v41, WeakRetained[12], WeakRetained[13]);
    double v7 = v5;
    double v8 = v6;
    BOOL v9 = (double *)MEMORY[0x1E4F1DB30];
    if (v5 == *MEMORY[0x1E4F1DB30] && v6 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      uint64_t v13 = (id)WBS_LOG_CHANNEL_PREFIXFaviconProvider();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_cold_2(buf, [*(id *)(a1 + 32) length], v13);
      }

      uint64_t v14 = (id)WBS_LOG_CHANNEL_PREFIXFaviconProvider();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_cold_1(*(void *)(a1 + 40), (uint64_t)v42, [*(id *)(a1 + 32) length]);
      }

      id v15 = (void *)*((void *)WeakRetained + 7);
      id v16 = [*(id *)(a1 + 40) absoluteString];
      id v17 = [*(id *)(a1 + 48) absoluteString];
      uint64_t v18 = *(unsigned __int8 *)(a1 + 88);
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_58;
      v39[3] = &unk_1E5E41950;
      id v40 = *(id *)(a1 + 56);
      [v15 setIconIsRejectedResource:1 forPageURLString:v16 iconURLString:v17 isPrivate:v18 completionHandler:v39];
    }
    else
    {
      if (v3)
      {
        BOOL v11 = +[WBSFaviconProviderUtilities computeRelativeSize:referenceSize:](WBSFaviconProviderUtilities, "computeRelativeSize:referenceSize:", v5, v6, WeakRetained[12], WeakRetained[13]) != 6|| v41 == 0;
        if (v11 || ([v3 hasGeneratedResolutions] & 1) == 0)
        {
          [v3 size];
          BOOL v12 = +[WBSFaviconProviderUtilities isFaviconSize:morePreferrableThanFaviconSize:givenDesiredSize:](WBSFaviconProviderUtilities, "isFaviconSize:morePreferrableThanFaviconSize:givenDesiredSize:", v7, v8, v19, v20, WeakRetained[12], WeakRetained[13]);
        }
        else
        {
          BOOL v12 = 1;
        }
        if ((([v3 hasGeneratedResolutions] ^ 1 | v12) & 1) == 0
          && (v41 || *(double *)(a1 + 72) == *v9 && *(double *)(a1 + 80) == v9[1]))
        {
          id v24 = (void *)*((void *)WeakRetained + 7);
          id v25 = [*(id *)(a1 + 40) absoluteString];
          id v26 = [*(id *)(a1 + 48) absoluteString];
          uint64_t v27 = *(unsigned __int8 *)(a1 + 88);
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_2;
          v37[3] = &unk_1E5E41950;
          id v38 = *(id *)(a1 + 56);
          [v24 setIconIsRejectedResource:1 forPageURLString:v25 iconURLString:v26 isPrivate:v27 completionHandler:v37];

          goto LABEL_35;
        }
        id v21 = [v3 dateAdded];
        int v22 = [WeakRetained _isIconDateExpired:v21];

        if (((v22 | v12) & 1) == 0)
        {
          (*(void (**)(double, double))(*(void *)(a1 + 56) + 16))(*v9, v9[1]);
          goto LABEL_35;
        }
      }
      char v36 = 0;
      id v23 = +[WBSFaviconProviderUtilities multiResolutionImageFromImageData:withPreferredSize:atScales:didGenerateResolutions:](WBSFaviconProviderUtilities, "multiResolutionImageFromImageData:withPreferredSize:atScales:didGenerateResolutions:", *(void *)(a1 + 32), *((void *)WeakRetained + 19), &v36, WeakRetained[20], WeakRetained[21]);
      if (v23)
      {
        (*(void (**)(double, double))(*(void *)(a1 + 56) + 16))(v7, v8);
      }
      else
      {
        id v28 = (id)WBS_LOG_CHANNEL_PREFIXFaviconProvider();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_cold_4(buf, [*(id *)(a1 + 32) length], v28);
        }

        id v29 = (id)WBS_LOG_CHANNEL_PREFIXFaviconProvider();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_cold_3(*(void *)(a1 + 40), (uint64_t)v42, [*(id *)(a1 + 32) length]);
        }

        id v30 = (void *)*((void *)WeakRetained + 7);
        BOOL v31 = [*(id *)(a1 + 40) absoluteString];
        id v32 = [*(id *)(a1 + 48) absoluteString];
        uint64_t v33 = *(unsigned __int8 *)(a1 + 88);
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_59;
        id v34[3] = &unk_1E5E41950;
        id v35 = *(id *)(a1 + 56);
        [v30 setIconIsRejectedResource:1 forPageURLString:v31 iconURLString:v32 isPrivate:v33 completionHandler:v34];
      }
    }
  }
  else
  {
    (*(void (**)(double, double))(*(void *)(a1 + 56) + 16))(*MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
LABEL_35:
}

uint64_t __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_58(uint64_t a1)
{
  return (*(uint64_t (**)(double, double))(*(void *)(a1 + 32) + 16))(*MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

uint64_t __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(double, double))(*(void *)(a1 + 32) + 16))(*MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

uint64_t __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(double, double))(*(void *)(a1 + 32) + 16))(*MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

- (void)_saveImageData:(id)a3 iconURL:(id)a4 pageURL:(id)a5 originalPageURL:(id)a6 size:(CGSize)a7 isPrivate:(BOOL)a8 completionHandler:(id)a9
{
  BOOL v10 = a8;
  double height = a7.height;
  double width = a7.width;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a9;
  id v21 = a3;
  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __102__WBSFaviconProvider__saveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke;
  v26[3] = &unk_1E5E41BF8;
  objc_copyWeak(&v31, &location);
  id v27 = v18;
  id v28 = v17;
  BOOL v32 = v10;
  id v29 = v19;
  id v30 = v20;
  id v22 = v19;
  id v23 = v17;
  id v24 = v18;
  id v25 = v20;
  -[WBSFaviconProvider _confirmImageDataShouldBeSaved:size:pageURL:iconURL:includingPrivateData:completionHandler:](self, "_confirmImageDataShouldBeSaved:size:pageURL:iconURL:includingPrivateData:completionHandler:", v21, v24, v23, v10, v26, width, height);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __102__WBSFaviconProvider__saveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke(uint64_t a1, char a2, void *a3, uint64_t a4, double a5, double a6)
{
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v13 = WeakRetained;
  if (WeakRetained && (a2 & 1) != 0)
  {
    uint64_t v14 = (void *)*((void *)WeakRetained + 7);
    id v15 = [*(id *)(a1 + 32) absoluteString];
    id v16 = [*(id *)(a1 + 40) absoluteString];
    uint64_t v17 = *(unsigned __int8 *)(a1 + 72);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __102__WBSFaviconProvider__saveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke_2;
    v19[3] = &unk_1E5E41BD0;
    objc_copyWeak(&v24, (id *)(a1 + 64));
    id v23 = *(id *)(a1 + 56);
    id v20 = *(id *)(a1 + 32);
    id v21 = *(id *)(a1 + 48);
    id v22 = *(id *)(a1 + 40);
    char v25 = *(unsigned char *)(a1 + 72);
    objc_msgSend(v14, "setIconData:forPageURLString:iconURLString:iconSize:hasGeneratedResolutions:isPrivate:completionHandler:", v11, v15, v16, a4, v17, v19, a5, a6);

    objc_destroyWeak(&v24);
  }
  else
  {
    uint64_t v18 = *(void *)(a1 + 56);
    if (v18) {
      (*(void (**)(void))(v18 + 16))();
    }
  }
}

void __102__WBSFaviconProvider__saveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[4];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __102__WBSFaviconProvider__saveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke_3;
    v6[3] = &unk_1E5E41BA8;
    void v6[4] = WeakRetained;
    id v7 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 56);
    id v9 = *(id *)(a1 + 48);
    char v11 = *(unsigned char *)(a1 + 72);
    dispatch_async(v4, v6);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
}

void __102__WBSFaviconProvider__saveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateOutstandingRequestsForPageURL:*(void *)(a1 + 40) forceDidReceiveNewData:0];
  if ([*(id *)(a1 + 48) isEqual:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 64);
    if (v2)
    {
      id v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
  }
  else
  {
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 56);
    uint64_t v5 = [*(id *)(a1 + 48) absoluteString];
    double v6 = [*(id *)(a1 + 56) absoluteString];
    uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __102__WBSFaviconProvider__saveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke_4;
    v8[3] = &unk_1E5E41B80;
    void v8[4] = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 64);
    [v4 linkPageURLString:v5 toIconURLString:v6 isPrivate:v7 completionHandler:v8];
  }
}

void __102__WBSFaviconProvider__saveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__WBSFaviconProvider__saveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke_5;
  block[3] = &unk_1E5E41018;
  block[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, block);
}

uint64_t __102__WBSFaviconProvider__saveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateOutstandingRequestsForPageURL:*(void *)(a1 + 40) forceDidReceiveNewData:0];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)removeAllIconsForURLStringsNotIn:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__WBSFaviconProvider_removeAllIconsForURLStringsNotIn_completionHandler___block_invoke;
  block[3] = &unk_1E5E41018;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

uint64_t __73__WBSFaviconProvider_removeAllIconsForURLStringsNotIn_completionHandler___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 56) removeIconsWithURLStringsNotFoundIn:a1[5] completionHandler:a1[6]];
}

- (void)removeIconForURLString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__WBSFaviconProvider_removeIconForURLString_completionHandler___block_invoke;
  block[3] = &unk_1E5E41018;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

uint64_t __63__WBSFaviconProvider_removeIconForURLString_completionHandler___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 56) removeIconWithPageURLString:a1[5] completionHandler:a1[6]];
}

- (void)flushPrivateDataFromMemoryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__WBSFaviconProvider_flushPrivateDataFromMemoryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5E41040;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __70__WBSFaviconProvider_flushPrivateDataFromMemoryWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 56);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__WBSFaviconProvider_flushPrivateDataFromMemoryWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E5E41C20;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 flushPrivateDataFromMemoryWithCompletionHandler:v3];
}

void __70__WBSFaviconProvider_flushPrivateDataFromMemoryWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__WBSFaviconProvider_flushPrivateDataFromMemoryWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E5E41018;
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __70__WBSFaviconProvider_flushPrivateDataFromMemoryWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(a1 + 40);
        id v7 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", *(void *)(*((void *)&v9 + 1) + 8 * v5), (void)v9);
        [v6 _updateOutstandingRequestsForPageURL:v7 forceDidReceiveNewData:0];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)retainPrivateData
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__WBSFaviconProvider_retainPrivateData__block_invoke;
  block[3] = &unk_1E5E408C0;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __39__WBSFaviconProvider_retainPrivateData__block_invoke(uint64_t result)
{
  return result;
}

- (void)releasePrivateData
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__WBSFaviconProvider_releasePrivateData__block_invoke;
  block[3] = &unk_1E5E408C0;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void *__40__WBSFaviconProvider_releasePrivateData__block_invoke(void *result)
{
  uint64_t v1 = result[4];
  uint64_t v2 = *(void *)(v1 + 88);
  if (v2)
  {
    *(void *)(v1 + ++*(void *)(*(void *)(result + 32) + 88) = v2 - 1;
    uint64_t result = (void *)result[4];
    if (!result[11]) {
      return (void *)[result flushPrivateDataFromMemoryWithCompletionHandler:0];
    }
  }
  return result;
}

- (void)setUpPersistenceAtPath:(id)a3 completionHandler:(id)a4
{
}

- (void)imageForRequestDuringPersistenceSetUp:(id)a3 completionHandler:(id)a4
{
}

- (void)cleanUpAfterPersistenceSetUpDidSucceed:(BOOL)a3 completionHandler:(id)a4
{
}

- (id)builtInIconForRequest:(id)a3
{
  return 0;
}

- (BOOL)canHandleRequest:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4
{
  id v5 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__WBSFaviconProvider_prepareResponseForRequest_allowDelayedResponse___block_invoke;
  block[3] = &unk_1E5E40820;
  void block[4] = self;
  id v9 = v5;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(internalQueue, block);
}

void __69__WBSFaviconProvider_prepareResponseForRequest_allowDelayedResponse___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _registerRequest:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) _cachedResponseForRequest:*(void *)(a1 + 40)];
  if (!v2)
  {
    if ([*(id *)(*(void *)(a1 + 32) + 24) containsObject:*(void *)(a1 + 48)]) {
      return;
    }
    id v3 = *(void **)(a1 + 32);
    id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
    objc_msgSend(v3, "_prepareAndSendResponseForRequests:forceDidReceiveNewData:");
    uint64_t v2 = v4;
  }
}

- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4
{
  *a4 = 1;
  id v4 = [(WBSFaviconProvider *)self _cachedResponseForRequest:a3];
  return v4;
}

- (void)stopWatchingUpdatesForRequest:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__WBSFaviconProvider_stopWatchingUpdatesForRequest___block_invoke;
  v7[3] = &unk_1E5E407D0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __52__WBSFaviconProvider_stopWatchingUpdatesForRequest___block_invoke(uint64_t a1)
{
  id v4 = *(id *)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) _hostFromRequest:*(void *)(a1 + 32)];
  if (v2)
  {
    id v3 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKeyedSubscript:v2];
    [v3 removeObject:v4];
    if (![v3 count]) {
      [*(id *)(*(void *)(a1 + 40) + 8) removeObjectForKey:v2];
    }
  }
}

- (BOOL)providesFavicons
{
  return 1;
}

- (void)emptyCaches
{
}

- (void)savePendingChangesBeforeTermination
{
  dispatch_sync((dispatch_queue_t)self->_internalSavingQueue, &__block_literal_global_64);
  persistenceController = self->_persistenceController;
  [(WBSFaviconProviderPersistenceController *)persistenceController savePendingChangesBeforeTermination];
}

- (id)_cachedResponseForRequest:(id)a3
{
  id v4 = a3;
  id v5 = self->_responseCache;
  objc_sync_enter(v5);
  responseCache = self->_responseCache;
  id v7 = [(WBSFaviconProvider *)self _responseCacheKeyForRequest:v4];
  id v8 = [(NSCache *)responseCache objectForKey:v7];

  id v9 = [(WBSFaviconProvider *)self _responseDictionaryKeyForRequest:v4];
  id v10 = [v8 objectForKeyedSubscript:v9];

  objc_sync_exit(v5);
  return v10;
}

- (void)_addCachedResponse:(id)a3 forRequest:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = self->_responseCache;
  objc_sync_enter(v7);
  responseCache = self->_responseCache;
  id v9 = [(WBSFaviconProvider *)self _responseCacheKeyForRequest:v6];
  id v10 = [(NSCache *)responseCache objectForKey:v9];

  if (!v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v12 = self->_responseCache;
    id v13 = [(WBSFaviconProvider *)self _responseCacheKeyForRequest:v6];
    [(NSCache *)v12 setObject:v11 forKey:v13];

    id v10 = (void *)v11;
  }
  uint64_t v14 = [(WBSFaviconProvider *)self _responseDictionaryKeyForRequest:v6];
  [v10 setObject:v15 forKeyedSubscript:v14];

  objc_sync_exit(v7);
}

- (void)_removeCachedResponsesForURL:(id)a3
{
  id obj = self->_responseCache;
  id v5 = a3;
  objc_sync_enter(obj);
  [(NSCache *)self->_responseCache removeObjectForKey:v5];

  objc_sync_exit(obj);
}

- (void)_removeCachedResponsesForRequest:(id)a3
{
  id v9 = a3;
  id v4 = self->_responseCache;
  objc_sync_enter(v4);
  responseCache = self->_responseCache;
  id v6 = [(WBSFaviconProvider *)self _responseCacheKeyForRequest:v9];
  id v7 = [(NSCache *)responseCache objectForKey:v6];

  if (v7)
  {
    id v8 = [(WBSFaviconProvider *)self _responseDictionaryKeyForRequest:v9];
    [v7 removeObjectForKey:v8];
  }
  objc_sync_exit(v4);
}

- (id)_responseDictionaryKeyForRequest:(id)a3
{
  id v3 = a3;
  id v4 = NSString;
  [v3 iconSize];
  uint64_t v6 = v5;
  [v3 iconSize];
  id v8 = [v4 stringWithFormat:@"{%lf, %lf}-%lu", v6, v7, objc_msgSend(v3, "fallbackType")];

  return v8;
}

- (id)_responseCacheKeyForRequest:(id)a3
{
  id v3 = [a3 url];
  return v3;
}

- (id)_hostFromRequest:(id)a3
{
  id v4 = [a3 url];
  uint64_t v5 = [(WBSFaviconProvider *)self _hostFromURL:v4];

  return v5;
}

- (id)_hostFromURL:(id)a3
{
  id v3 = a3;
  if ([v3 isFileURL])
  {
    id v4 = [v3 absoluteString];
  }
  else
  {
    uint64_t v5 = [v3 host];
    id v4 = objc_msgSend(v5, "safari_stringByRemovingWwwDotPrefix");
  }
  return v4;
}

- (void)_registerRequest:(id)a3
{
  id v6 = a3;
  id v4 = -[WBSFaviconProvider _hostFromRequest:](self, "_hostFromRequest:");
  if (v4)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_hostsToRequestsMap objectForKeyedSubscript:v4];
    if (!v5)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_hostsToRequestsMap, "setObject:forKeyedSubscript:");
    }
    [v5 addObject:v6];
  }
}

- (id)_requestsForHost:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_hostsToRequestsMap objectForKeyedSubscript:a3];
  return v3;
}

- (void)_updateOutstandingRequestsForPageURL:(id)a3 forceDidReceiveNewData:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  -[WBSFaviconProvider _removeCachedResponsesForURL:](self, "_removeCachedResponsesForURL:");
  id v6 = [(WBSFaviconProvider *)self _hostFromURL:v8];
  uint64_t v7 = [(WBSFaviconProvider *)self _requestsForHost:v6];

  if ([v7 count]) {
    [(WBSFaviconProvider *)self _prepareAndSendResponseForRequests:v7 forceDidReceiveNewData:v4];
  }
}

- (void)_prepareAndSendResponseForRequests:(id)a3 forceDidReceiveNewData:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__WBSFaviconProvider__prepareAndSendResponseForRequests_forceDidReceiveNewData___block_invoke;
  v4[3] = &unk_1E5E41CC0;
  v4[4] = self;
  BOOL v5 = a4;
  [a3 enumerateObjectsUsingBlock:v4];
}

void __80__WBSFaviconProvider__prepareAndSendResponseForRequests_forceDidReceiveNewData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:v3];
  BOOL v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__WBSFaviconProvider__prepareAndSendResponseForRequests_forceDidReceiveNewData___block_invoke_2;
  v6[3] = &unk_1E5E41C98;
  void v6[4] = v4;
  id v5 = v3;
  id v7 = v5;
  char v8 = *(unsigned char *)(a1 + 40);
  [v4 _getIconForRequest:v5 withCompletionHandler:v6];
}

void __80__WBSFaviconProvider__prepareAndSendResponseForRequests_forceDidReceiveNewData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__WBSFaviconProvider__prepareAndSendResponseForRequests_forceDidReceiveNewData___block_invoke_3;
  v7[3] = &unk_1E5E41C70;
  void v7[4] = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  char v10 = *(unsigned char *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __80__WBSFaviconProvider__prepareAndSendResponseForRequests_forceDidReceiveNewData___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 128));
  [*(id *)(a1 + 32) _addCachedResponse:*(void *)(a1 + 40) forRequest:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 48)];
  if (*(unsigned char *)(a1 + 56))
  {
    BOOL v3 = 1;
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 40) favicon];
    if (v4)
    {
      BOOL v3 = 1;
    }
    else
    {
      id v5 = [*(id *)(a1 + 40) favicon];
      if (v5) {
        BOOL v3 = 0;
      }
      else {
        BOOL v3 = [*(id *)(a1 + 48) fallbackType] == 0;
      }
    }
  }
  if ([*(id *)(a1 + 48) isIconDownloadingEnabled]
    && ![*(id *)(a1 + 40) faviconType])
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [*(id *)(a1 + 48) url];
    id v8 = [*(id *)(a1 + 48) url];
    id v9 = [*(id *)(a1 + 48) url];
    [*(id *)(a1 + 48) iconSize];
    double v11 = v10;
    double v13 = v12;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __80__WBSFaviconProvider__prepareAndSendResponseForRequests_forceDidReceiveNewData___block_invoke_4;
    v17[3] = &unk_1E5E41C48;
    id v14 = WeakRetained;
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = *(void **)(a1 + 40);
    id v18 = v14;
    uint64_t v19 = v15;
    id v20 = v16;
    id v21 = *(id *)(a1 + 48);
    BOOL v22 = v3;
    objc_msgSend(v6, "shouldIconDataBeSavedForIconWithPageURL:originalPageURL:iconURL:size:isPrivate:completionHandler:", v7, v8, v9, 0, v17, v11, v13);
  }
  else
  {
    [WeakRetained siteMetadataProvider:*(void *)(a1 + 32) didReceiveResponse:*(void *)(a1 + 40) ofType:0 didReceiveNewData:v3 forRequest:*(void *)(a1 + 48)];
  }
}

void __80__WBSFaviconProvider__prepareAndSendResponseForRequests_forceDidReceiveNewData___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  if (a2)
  {
    uint64_t v5 = *(void *)(a1 + 56);
    id v9 = [*(id *)(a1 + 40) _blockOperationForRequest:v5];
    objc_msgSend(v2, "siteMetadataProvider:didReceiveResponse:forRequest:beginOperationUsingBlock:", v3, v4, v5);
  }
  else
  {
    uint64_t v6 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v7 = *(void *)(a1 + 56);
    id v8 = *(void **)(a1 + 32);
    [v8 siteMetadataProvider:v3 didReceiveResponse:v4 ofType:0 didReceiveNewData:v6 forRequest:v7];
  }
}

WBSTouchIconFetchOperation *__48__WBSFaviconProvider__blockOperationForRequest___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = [WBSTouchIconFetchOperation alloc];
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__WBSFaviconProvider__blockOperationForRequest___block_invoke_2;
  v6[3] = &unk_1E5E41CE8;
  objc_copyWeak(&v8, &location);
  id v7 = *(id *)(a1 + 40);
  uint64_t v4 = [(WBSTouchIconFetchOperation *)v2 initWithRequest:v3 completionHandler:v6];
  [(WBSWebViewMetadataFetchOperation *)v4 setDelegate:*(void *)(a1 + 32)];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v4;
}

void __48__WBSFaviconProvider__blockOperationForRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[4];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__WBSFaviconProvider__blockOperationForRequest___block_invoke_3;
    block[3] = &unk_1E5E40820;
    id v8 = v3;
    id v9 = v5;
    id v10 = *(id *)(a1 + 32);
    dispatch_async(v6, block);
  }
}

void __48__WBSFaviconProvider__blockOperationForRequest___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) pageRequestDidSucceed]
    && ![*(id *)(a1 + 32) higherPriorityIconDownloadFailedDueToNetworkError])
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v12 = [*(id *)(a1 + 32) iconData];
    uint64_t v6 = [*(id *)(a1 + 32) iconURL];
    id v7 = [*(id *)(a1 + 48) url];
    id v8 = [*(id *)(a1 + 48) url];
    [*(id *)(a1 + 48) iconSize];
    objc_msgSend(v5, "_atomicallySaveImageData:iconURL:pageURL:originalPageURL:size:isPrivate:completionHandler:", v12, v6, v7, v8, 0, 0);
  }
  else
  {
    uint64_t v2 = [*(id *)(a1 + 32) iconURL];

    if (!v2) {
      return;
    }
    id v10 = [*(id *)(a1 + 32) response];
    uint64_t v3 = [v10 statusCode];

    id v11 = [*(id *)(a1 + 32) response];
    uint64_t v4 = objc_msgSend(v11, "safari_statusCodeGroup");

    if ((v4 & 0xFFFFFFFFFFFFFFFELL) != 4 && v3 != 204 && v3 != 205) {
      return;
    }
    id v9 = *(void **)(*(void *)(a1 + 40) + 56);
    id v12 = [*(id *)(a1 + 48) url];
    uint64_t v6 = [v12 absoluteString];
    id v7 = [*(id *)(a1 + 32) iconURL];
    id v8 = [v7 absoluteString];
    [v9 setIconIsRejectedResource:1 forPageURLString:v6 iconURLString:v8 isPrivate:0 completionHandler:&__block_literal_global_72_0];
  }
}

- (void)webViewMetadataFetchOperation:(id)a3 didFinishUsingWebView:(id)a4
{
  p_providerDelegate = &self->_providerDelegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_providerDelegate);
  [WeakRetained siteMetadataProvider:self didFinishUsingWebView:v6];
}

- (void)webViewMetadataFetchOperation:(id)a3 getWebViewOfSize:(CGSize)a4 withConfiguration:(id)a5 completionHandler:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  p_providerDelegate = &self->_providerDelegate;
  id v11 = a6;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_providerDelegate);
  objc_msgSend(WeakRetained, "siteMetadataProvider:getWebViewOfSize:withConfiguration:completionHandler:", self, v12, v11, width, height);
}

- (void)_getIconForRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke;
  id v30[3] = &unk_1E5E41D60;
  v30[4] = self;
  id v8 = v6;
  id v31 = v8;
  id v9 = v7;
  id v32 = v9;
  uint64_t v10 = MEMORY[0x1AD115160](v30);
  id v11 = (void (**)(void, void, void))v10;
  if (self->_providerState)
  {
    id v12 = [(WBSFaviconProvider *)self builtInIconForRequest:v8];
    if (v12)
    {
      ((void (**)(void, void *, uint64_t))v11)[2](v11, v12, 1);
    }
    else
    {
      if (self->_providerState != 1)
      {
        uint64_t v13 = [v8 type];
        if (v13)
        {
          if (v13 != 1) {
            goto LABEL_14;
          }
          id v14 = [(WBSFaviconProvider *)self _hostFromRequest:v8];
          persistenceController = self->_persistenceController;
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_5;
          v24[3] = &unk_1E5E41E20;
          id v25 = v14;
          id v26 = v11;
          v24[4] = self;
          id v16 = v14;
          [(WBSFaviconProviderPersistenceController *)persistenceController firstIconForVariantsOfDomainString:v16 includingPrivateData:1 completionHandler:v24];

          uint64_t v17 = v26;
        }
        else
        {
          id v18 = [v8 url];
          id v16 = [v18 absoluteString];

          if ([v8 isURLTypedByUser])
          {
            uint64_t v19 = objc_msgSend(v16, "safari_bestURLForUserTypedString");
            uint64_t v20 = [v19 absoluteString];

            id v16 = (id)v20;
          }
          id v21 = self->_persistenceController;
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_9;
          v22[3] = &unk_1E5E41E48;
          id v23 = v11;
          [(WBSFaviconProviderPersistenceController *)v21 firstIconForVariantsOfPageURLString:v16 includingPrivateData:1 completionHandler:v22];
          uint64_t v17 = v23;
        }

        goto LABEL_14;
      }
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_3;
      v27[3] = &unk_1E5E41D88;
      v27[4] = self;
      id v28 = v8;
      id v29 = v9;
      [(WBSFaviconProvider *)self imageForRequestDuringPersistenceSetUp:v28 completionHandler:v27];
    }
LABEL_14:

    goto LABEL_15;
  }
  (*(void (**)(uint64_t, void, void))(v10 + 16))(v10, 0, 0);
LABEL_15:
}

void __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5E41D38;
  char v14 = a3;
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v8 = v5;
  dispatch_async(v7, block);
}

void __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64)) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = 2;
  }
  id v7 = *(id *)(a1 + 32);
  if (!v7)
  {
    [*(id *)(a1 + 40) fallbackIconForRequest:*(void *)(a1 + 48)];
    uint64_t v2 = 0;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = [WBSFaviconResponse alloc];
  id v5 = [*(id *)(a1 + 48) url];
  uint64_t v6 = [(WBSFaviconResponse *)v4 initWithURL:v5 favicon:v7 faviconType:v2];
  (*(void (**)(uint64_t, WBSFaviconResponse *))(v3 + 16))(v3, v6);
}

void __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_4;
  v7[3] = &unk_1E5E40FA0;
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (v2)
  {
    id v13 = v2;
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 48);
    id v5 = [*(id *)(a1 + 48) url];
    id v14 = [v4 objectForKeyedSubscript:v5];

    if (v14
      && (id v6 = objc_alloc(MEMORY[0x1E4F42A80]),
          [v14 iconData],
          id v7 = objc_claimAutoreleasedReturnValue(),
          uint64_t v8 = [v6 initWithData:v7],
          v7,
          v14,
          v8))
    {
      uint64_t v3 = 2;
      id v13 = (id)v8;
    }
    else
    {
      [*(id *)(a1 + 40) fallbackIconForRequest:*(void *)(a1 + 48)];
      uint64_t v3 = 0;
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  uint64_t v9 = *(void *)(a1 + 56);
  id v10 = [WBSFaviconResponse alloc];
  id v11 = [*(id *)(a1 + 48) url];
  id v12 = [(WBSFaviconResponse *)v10 initWithURL:v11 favicon:v13 faviconType:v3];
  (*(void (**)(uint64_t, WBSFaviconResponse *))(v9 + 16))(v9, v12);
}

void __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(*(void *)(a1 + 32) + 56);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_6;
    v7[3] = &unk_1E5E41DF8;
    id v6 = *(id *)(a1 + 48);
    void v7[4] = *(void *)(a1 + 32);
    id v8 = v6;
    [v5 pageURLStringsPrefixedWithVariantsOfDomainString:v4 includingPrivateData:1 completionHandler:v7];
  }
}

void __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "safari_minimumUsingComparator:", &__block_literal_global_81);
  if (v3)
  {
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 56);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_8;
    v5[3] = &unk_1E5E41DD0;
    id v6 = *(id *)(a1 + 40);
    [v4 iconForPageURLString:v3 includingPrivateData:1 completionHandler:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 pathComponents];
  unint64_t v7 = [v6 count];
  id v8 = [v5 pathComponents];
  unint64_t v9 = [v8 count];

  if (v7 >= v9)
  {
    id v11 = [v4 pathComponents];
    unint64_t v12 = [v11 count];
    id v13 = [v5 pathComponents];
    uint64_t v10 = v12 > [v13 count];
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

uint64_t __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_atomicallyLinkPageURLs:(id)a3 toIconWithInfo:(id)a4 isPrivate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  internalSavingQueue = self->_internalSavingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__WBSFaviconProvider__atomicallyLinkPageURLs_toIconWithInfo_isPrivate___block_invoke;
  block[3] = &unk_1E5E41E70;
  objc_copyWeak(&v16, &location);
  id v14 = v8;
  id v15 = v9;
  BOOL v17 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(internalSavingQueue, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __71__WBSFaviconProvider__atomicallyLinkPageURLs_toIconWithInfo_isPrivate___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v12;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
          dispatch_suspend(WeakRetained[5]);
          uint64_t v8 = *(void *)(a1 + 40);
          uint64_t v9 = *(unsigned __int8 *)(a1 + 56);
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __71__WBSFaviconProvider__atomicallyLinkPageURLs_toIconWithInfo_isPrivate___block_invoke_2;
          v10[3] = &unk_1E5E408C0;
          void v10[4] = WeakRetained;
          [(dispatch_object_t *)WeakRetained _linkPageURL:v7 toIconWithInfo:v8 isPrivate:v9 completionHandler:v10];
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
    }
  }
}

void __71__WBSFaviconProvider__atomicallyLinkPageURLs_toIconWithInfo_isPrivate___block_invoke_2(uint64_t a1)
{
}

- (void)_linkPageURL:(id)a3 toIconWithInfo:(id)a4 isPrivate:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_initWeak(&location, self);
  persistenceController = self->_persistenceController;
  long long v14 = [v10 absoluteString];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__WBSFaviconProvider__linkPageURL_toIconWithInfo_isPrivate_completionHandler___block_invoke;
  v18[3] = &unk_1E5E41EC0;
  objc_copyWeak(&v22, &location);
  id v15 = v12;
  id v21 = v15;
  id v16 = v11;
  id v19 = v16;
  id v17 = v10;
  id v20 = v17;
  BOOL v23 = v7;
  [(WBSFaviconProviderPersistenceController *)persistenceController iconInfoForPageURLString:v14 includingPrivateData:v7 completionHandler:v18];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __78__WBSFaviconProvider__linkPageURL_toIconWithInfo_isPrivate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained
    || v3
    && ([v3 UUIDString],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [*(id *)(a1 + 32) UUIDString],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 isEqualToString:v6],
        v6,
        v5,
        v7))
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v8 = (void *)WeakRetained[7];
    uint64_t v9 = [*(id *)(a1 + 40) absoluteString];
    id v10 = [*(id *)(a1 + 32) iconURLString];
    uint64_t v11 = *(unsigned __int8 *)(a1 + 64);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __78__WBSFaviconProvider__linkPageURL_toIconWithInfo_isPrivate_completionHandler___block_invoke_2;
    v12[3] = &unk_1E5E41E98;
    objc_copyWeak(&v16, (id *)(a1 + 56));
    id v15 = *(id *)(a1 + 48);
    id v13 = *(id *)(a1 + 40);
    id v14 = *(id *)(a1 + 32);
    [v8 linkPageURLString:v9 toIconURLString:v10 isPrivate:v11 completionHandler:v12];

    objc_destroyWeak(&v16);
  }
}

void __78__WBSFaviconProvider__linkPageURL_toIconWithInfo_isPrivate_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if ((a2 & 1) == 0)
    {
      uint64_t v5 = WBS_LOG_CHANNEL_PREFIXFaviconProvider();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __78__WBSFaviconProvider__linkPageURL_toIconWithInfo_isPrivate_completionHandler___block_invoke_2_cold_2();
      }
      uint64_t v6 = (id)WBS_LOG_CHANNEL_PREFIXFaviconProvider();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = [*(id *)(a1 + 40) iconURLString];
        __78__WBSFaviconProvider__linkPageURL_toIconWithInfo_isPrivate_completionHandler___block_invoke_2_cold_1(v7, v8, (uint64_t)v16, v6);
      }
    }
    uint64_t v9 = WeakRetained[4];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __78__WBSFaviconProvider__linkPageURL_toIconWithInfo_isPrivate_completionHandler___block_invoke_83;
    v14[3] = &unk_1E5E407D0;
    v14[4] = WeakRetained;
    id v15 = *(id *)(a1 + 32);
    dispatch_async(v9, v14);
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v10, v11, v12, v13);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __78__WBSFaviconProvider__linkPageURL_toIconWithInfo_isPrivate_completionHandler___block_invoke_83(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateOutstandingRequestsForPageURL:*(void *)(a1 + 40) forceDidReceiveNewData:0];
}

- (WBSSiteMetadataProviderDelegate)providerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
  return (WBSSiteMetadataProviderDelegate *)WeakRetained;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (CGSize)preferredIconSize
{
  double width = self->_preferredIconSize.width;
  double height = self->_preferredIconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)preferredIconScale
{
  return self->_preferredIconScale;
}

- (NSArray)allIconScales
{
  return self->_allIconScales;
}

- (BOOL)isReadOnly
{
  return self->_isReadOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allIconScales, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_destroyWeak((id *)&self->_providerDelegate);
  objc_storeStrong(&self->_shouldCheckIntegrityWhenOpeningDatabaseBlock, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_urlsToFaviconRecordsSavedDuringMigration, 0);
  objc_storeStrong((id *)&self->_internalSavingQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_requestsPendingResponse, 0);
  objc_storeStrong((id *)&self->_responseCache, 0);
  objc_storeStrong((id *)&self->_hostsToRequestsMap, 0);
}

void __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1ABB70000, v0, OS_LOG_TYPE_DEBUG, "Suspended processing favicon provider requests due to initialization.", v1, 2u);
}

void __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_46_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1ABB70000, v0, OS_LOG_TYPE_DEBUG, "Resumed processing favicon provider requests, initialization is done.", v1, 2u);
}

void __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_5(&dword_1ABB70000, v0, v1, "Cannot determine if icon should be saved, invalid page URL %{private}@ or original page URL %{private}@.");
}

void __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1ABB70000, v0, v1, "Cannot determine if icon should be saved due to invalid page URLs.", v2, v3, v4, v5, v6);
}

void __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_cold_3(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_DEBUG, "Cannot determine if icon should be saved, invalid icon URL %{private}@", (uint8_t *)&v3, 0xCu);
}

void __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1ABB70000, v0, v1, "Cannot determine if icon should be saved due to invalid icon URL.", v2, v3, v4, v5, v6);
}

void __87__WBSFaviconProvider_linkIconFromPageURL_toCurrentPageURL_isPrivate_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_5(&dword_1ABB70000, v0, v1, "Cannot determine if icon should be linked, invalid page URL %{private}@ or original page URL %{private}@.");
}

void __87__WBSFaviconProvider_linkIconFromPageURL_toCurrentPageURL_isPrivate_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1ABB70000, v0, v1, "Cannot determine if icon should be linked due to invalid page URLs.", v2, v3, v4, v5, v6);
}

- (void)saveFaviconImageData:iconURL:pageURL:originalPageURL:size:isPrivate:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1ABB70000, v0, v1, "Cannot save icon, invalid page URLs or icon URL.", v2, v3, v4, v5, v6);
}

void __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_4(a1, a2, a3, 5.8081e-34);
  OUTLINED_FUNCTION_2_3(&dword_1ABB70000, "Failed to get image from icon data for page URL: %{private}@ - data %lu bytes", v3, v4);
}

void __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_cold_2(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134349056;
  *(void *)(buf + 4) = a2;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Failed to get image from icon data: %{public}lu bytes", buf, 0xCu);
}

void __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_4(a1, a2, a3, 5.8081e-34);
  OUTLINED_FUNCTION_2_3(&dword_1ABB70000, "Failed to create image from icon data for page URL: %{private}@ - data %lu bytes", v3, v4);
}

void __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_cold_4(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134349056;
  *(void *)(buf + 4) = a2;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Failed to create image from icon data: %{public}lu bytes", buf, 0xCu);
}

void __78__WBSFaviconProvider__linkPageURL_toIconWithInfo_isPrivate_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138478083;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2113;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_2_3(&dword_1ABB70000, "Failed to link page URL %{private}@ to icon URL %{private}@", (uint8_t *)a3, a4);
}

void __78__WBSFaviconProvider__linkPageURL_toIconWithInfo_isPrivate_completionHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1ABB70000, v0, v1, "Failed to link page URL to icon URL", v2, v3, v4, v5, v6);
}

@end