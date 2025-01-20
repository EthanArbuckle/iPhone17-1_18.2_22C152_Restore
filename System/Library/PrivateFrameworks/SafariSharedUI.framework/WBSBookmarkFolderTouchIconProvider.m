@interface WBSBookmarkFolderTouchIconProvider
+ (BOOL)_appUsesLeftToRightLayout;
- (BOOL)canHandleRequest:(id)a3;
- (BOOL)canProvideUpdatesForRequest:(id)a3;
- (NSArray)allFolderUUIDs;
- (UIColor)backgroundColor;
- (WBSBookmarkFolderTouchIconConfiguration)configuration;
- (WBSBookmarkFolderTouchIconProvider)init;
- (WBSSiteMetadataProviderDelegate)providerDelegate;
- (id)_arrayByPaddingArray:(id)a3 toMaximumNumberOfThumbnailsWithObject:(id)a4;
- (id)_drawTouchIconForRequest:(id)a3;
- (id)cachedImageForFolderUUID:(id)a3;
- (id)defaultFolderIconForRequest:(id)a3;
- (id)folderUUIDForRequest:(id)a3;
- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4;
- (id)subrequestsForRequest:(id)a3 maximumNumberOfSubrequests:(unint64_t)a4;
- (void)_coalesceResponseDispatchForRequest:(id)a3;
- (void)_dispatchResponseForRequest:(id)a3;
- (void)_dispatchResponseForRequest:(id)a3 touchIcon:(id)a4;
- (void)_prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4;
- (void)_registerInfo:(id)a3 forRequest:(id)a4;
- (void)_stopWatchingUpdatesForRequests:(id)a3;
- (void)contentOfFolderDidUpdateWithUUID:(id)a3;
- (void)didCreateTouchIcon:(id)a3;
- (void)prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4;
- (void)requestsWithFolderUUIDsDidBecomeInvalid:(id)a3;
- (void)setProviderDelegate:(id)a3;
- (void)stopWatchingUpdatesForRequest:(id)a3;
@end

@implementation WBSBookmarkFolderTouchIconProvider

- (void)setProviderDelegate:(id)a3
{
}

- (WBSBookmarkFolderTouchIconProvider)init
{
  v16.receiver = self;
  v16.super_class = (Class)WBSBookmarkFolderTouchIconProvider;
  v2 = [(WBSBookmarkFolderTouchIconProvider *)&v16 init];
  if (v2)
  {
    id v3 = [NSString stringWithFormat:@"com.apple.Safari.WBSBookmarkFolderTouchIconProvider.%@.%p._internalQueue", objc_opt_class(), v2];
    v4 = (const char *)[v3 UTF8String];
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    bookmarkFolderIdentifiersToRequestSets = v2->_bookmarkFolderIdentifiersToRequestSets;
    v2->_bookmarkFolderIdentifiersToRequestSets = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    requestsToRequestInfos = v2->_requestsToRequestInfos;
    v2->_requestsToRequestInfos = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    folderUUIDsToTouchIconInfo = v2->_folderUUIDsToTouchIconInfo;
    v2->_folderUUIDsToTouchIconInfo = (NSMutableDictionary *)v12;

    v14 = v2;
  }

  return v2;
}

- (WBSBookmarkFolderTouchIconConfiguration)configuration
{
  if (defaultConfiguration_onceToken != -1) {
    dispatch_once(&defaultConfiguration_onceToken, &__block_literal_global_198);
  }
  v2 = (void *)defaultConfiguration_configuration;
  return (WBSBookmarkFolderTouchIconConfiguration *)v2;
}

- (NSArray)allFolderUUIDs
{
  id v3 = self->_folderUUIDsToTouchIconInfo;
  objc_sync_enter(v3);
  v4 = [(NSMutableDictionary *)self->_folderUUIDsToTouchIconInfo allKeys];
  objc_sync_exit(v3);

  return (NSArray *)v4;
}

- (id)cachedImageForFolderUUID:(id)a3
{
  id v4 = a3;
  v5 = self->_folderUUIDsToTouchIconInfo;
  objc_sync_enter(v5);
  dispatch_queue_t v6 = [(NSMutableDictionary *)self->_folderUUIDsToTouchIconInfo objectForKeyedSubscript:v4];
  v7 = [v6 touchIcon];

  objc_sync_exit(v5);
  return v7;
}

- (void)contentOfFolderDidUpdateWithUUID:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__WBSBookmarkFolderTouchIconProvider_contentOfFolderDidUpdateWithUUID___block_invoke;
  v7[3] = &unk_1E5E40D38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __71__WBSBookmarkFolderTouchIconProvider_contentOfFolderDidUpdateWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(void *)(a1 + 40), 0);
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
        [*(id *)(a1 + 32) _prepareResponseForRequest:*(void *)(*((void *)&v7 + 1) + 8 * v6++) allowDelayedResponse:0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)requestsWithFolderUUIDsDidBecomeInvalid:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__WBSBookmarkFolderTouchIconProvider_requestsWithFolderUUIDsDidBecomeInvalid___block_invoke;
  v7[3] = &unk_1E5E40D38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __78__WBSBookmarkFolderTouchIconProvider_requestsWithFolderUUIDsDidBecomeInvalid___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  objc_sync_enter(v2);
  [*(id *)(*(void *)(a1 + 32) + 32) removeObjectsForKeys:*(void *)(a1 + 40)];
  objc_sync_exit(v2);

  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
        if (v8) {
          [v3 unionSet:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 32) _stopWatchingUpdatesForRequests:v3];
}

- (BOOL)canHandleRequest:(id)a3
{
  return 0;
}

- (id)defaultFolderIconForRequest:(id)a3
{
  return 0;
}

- (id)folderUUIDForRequest:(id)a3
{
  return 0;
}

- (id)subrequestsForRequest:(id)a3 maximumNumberOfSubrequests:(unint64_t)a4
{
  return 0;
}

- (BOOL)canProvideUpdatesForRequest:(id)a3
{
  return 1;
}

- (void)didCreateTouchIcon:(id)a3
{
}

- (UIColor)backgroundColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.5];
}

- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4
{
  id v6 = a3;
  *a4 = [(WBSBookmarkFolderTouchIconProvider *)self canProvideUpdatesForRequest:v6];
  uint64_t v7 = [(WBSBookmarkFolderTouchIconProvider *)self folderUUIDForRequest:v6];
  id v8 = self->_folderUUIDsToTouchIconInfo;
  objc_sync_enter(v8);
  long long v9 = [(NSMutableDictionary *)self->_folderUUIDsToTouchIconInfo objectForKey:v7];
  long long v10 = [v9 touchIcon];

  objc_sync_exit(v8);
  if (v10
    || ([(WBSBookmarkFolderTouchIconProvider *)self defaultFolderIconForRequest:v6],
        (long long v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v11 = [(WBSBookmarkFolderTouchIconProvider *)self backgroundColor];
    long long v12 = +[WBSTouchIconResponse responseWithURL:0 touchIcon:v10 generated:1 extractedBackgroundColor:v11];
  }
  else
  {
    long long v12 = 0;
  }

  return v12;
}

- (void)prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4
{
  id v6 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__WBSBookmarkFolderTouchIconProvider_prepareResponseForRequest_allowDelayedResponse___block_invoke;
  block[3] = &unk_1E5E40D88;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

uint64_t __85__WBSBookmarkFolderTouchIconProvider_prepareResponseForRequest_allowDelayedResponse___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareResponseForRequest:*(void *)(a1 + 40) allowDelayedResponse:*(unsigned __int8 *)(a1 + 48)];
}

- (void)stopWatchingUpdatesForRequest:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__WBSBookmarkFolderTouchIconProvider_stopWatchingUpdatesForRequest___block_invoke;
  v7[3] = &unk_1E5E40D38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __68__WBSBookmarkFolderTouchIconProvider_stopWatchingUpdatesForRequest___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
  [v1 _stopWatchingUpdatesForRequests:v2];
}

- (void)_stopWatchingUpdatesForRequests:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        long long v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToRequestInfos, "objectForKeyedSubscript:", v11, (void)v20);
        v13 = v12;
        if (v12)
        {
          uint64_t v14 = [v12 subrequestTokens];
          [v5 unionSet:v14];

          [(NSMutableDictionary *)self->_requestsToRequestInfos removeObjectForKey:v11];
          v15 = [(WBSBookmarkFolderTouchIconProvider *)self folderUUIDForRequest:v11];
          objc_super v16 = [(NSMutableDictionary *)self->_bookmarkFolderIdentifiersToRequestSets objectForKeyedSubscript:v15];
          [v16 removeObject:v11];
          uint64_t v17 = [v16 count];
          if (v15) {
            BOOL v18 = v17 == 0;
          }
          else {
            BOOL v18 = 0;
          }
          if (v18) {
            [(NSMutableDictionary *)self->_bookmarkFolderIdentifiersToRequestSets setObject:0 forKeyedSubscript:v15];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
    [WeakRetained siteMetadataProvider:self cancelRequestsWithTokens:v5];
  }
}

+ (BOOL)_appUsesLeftToRightLayout
{
  if (_appUsesLeftToRightLayout_onceToken != -1) {
    dispatch_once(&_appUsesLeftToRightLayout_onceToken, &__block_literal_global_5);
  }
  return _appUsesLeftToRightLayout_usesLeftToRight;
}

void __63__WBSBookmarkFolderTouchIconProvider__appUsesLeftToRightLayout__block_invoke()
{
}

void __63__WBSBookmarkFolderTouchIconProvider__appUsesLeftToRightLayout__block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F42738] sharedApplication];
  _appUsesLeftToRightLayout_usesLeftToRight = [v0 userInterfaceLayoutDirection] == 0;
}

- (void)_prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(WBSBookmarkFolderTouchIconProvider *)self configuration];
  uint64_t v8 = -[WBSBookmarkFolderTouchIconProvider subrequestsForRequest:maximumNumberOfSubrequests:](self, "subrequestsForRequest:maximumNumberOfSubrequests:", v6, [v7 maximumNumberOfThumbnailIcons]);

  uint64_t v9 = [(NSMutableDictionary *)self->_requestsToRequestInfos objectForKeyedSubscript:v6];
  id v10 = [v9 subrequests];
  char v11 = [v10 isEqualToArray:v8];

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = [v8 count];
    v13 = [(WBSBookmarkFolderTouchIconProvider *)self defaultFolderIconForRequest:v6];
    uint64_t v14 = [(WBSBookmarkFolderTouchIconProvider *)self backgroundColor];
    v15 = +[WBSTouchIconResponse responseWithURL:0 touchIcon:v13 generated:1 extractedBackgroundColor:v14];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
    uint64_t v17 = WeakRetained;
    if (v12)
    {
      v28 = v13;
      if (v4) {
        [WeakRetained siteMetadataProvider:self didReceiveResponse:v15 ofType:1 didReceiveNewData:0 forRequest:v6];
      }
      BOOL v18 = objc_alloc_init(_WBSBookmarkFolderTouchIconProviderRequestInfo);
      [(_WBSBookmarkFolderTouchIconProviderRequestInfo *)v18 setSubrequests:v8];
      [(WBSBookmarkFolderTouchIconProvider *)self _registerInfo:v18 forRequest:v6];
      v19 = [MEMORY[0x1E4F1CA80] set];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __86__WBSBookmarkFolderTouchIconProvider__prepareResponseForRequest_allowDelayedResponse___block_invoke;
      v29[3] = &unk_1E5E40DD8;
      v29[4] = self;
      id v20 = v17;
      id v30 = v20;
      id v31 = v6;
      id v32 = v19;
      id v21 = v19;
      [v8 enumerateObjectsUsingBlock:v29];
      [(_WBSBookmarkFolderTouchIconProviderRequestInfo *)v18 setSubrequestTokens:v21];
      [v9 subrequestTokens];
      v23 = long long v22 = v15;
      [v20 siteMetadataProvider:self cancelRequestsWithTokens:v23];

      v15 = v22;
      v13 = v28;
    }
    else
    {
      [WeakRetained siteMetadataProvider:self didReceiveResponse:v15 ofType:0 didReceiveNewData:1 forRequest:v6];
      v24 = [(WBSBookmarkFolderTouchIconProvider *)self configuration];
      uint64_t v25 = [v24 backgroundColorForEmptySlots];

      if (v25)
      {
        v26 = objc_alloc_init(_WBSBookmarkFolderTouchIconProviderRequestInfo);
        v27 = [MEMORY[0x1E4F1CAD0] set];
        [(_WBSBookmarkFolderTouchIconProviderRequestInfo *)v26 setSubrequestTokens:v27];

        [(WBSBookmarkFolderTouchIconProvider *)self _registerInfo:v26 forRequest:v6];
        [(WBSBookmarkFolderTouchIconProvider *)self _dispatchResponseForRequest:v6];
      }
    }
  }
}

void __86__WBSBookmarkFolderTouchIconProvider__prepareResponseForRequest_allowDelayedResponse___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = [*(id *)(a1 + 32) configuration];
  unint64_t v9 = [v8 maximumNumberOfThumbnailIcons];

  if (v9 <= (unint64_t)a3)
  {
    *a4 = 1;
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v11 = *(void *)(a1 + 32);
    id v10 = *(void **)(a1 + 40);
    uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 48)];
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __86__WBSBookmarkFolderTouchIconProvider__prepareResponseForRequest_allowDelayedResponse___block_invoke_2;
    BOOL v18 = &unk_1E5E40DB0;
    objc_copyWeak(v20, &location);
    id v19 = *(id *)(a1 + 48);
    v20[1] = a3;
    uint64_t v14 = [v10 siteMetadataProvider:v11 registerSubrequest:v7 forRequests:v12 queue:v13 responseHandler:&v15];

    if (v14) {
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v14, v15, v16, v17, v18);
    }

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
}

void __86__WBSBookmarkFolderTouchIconProvider__prepareResponseForRequest_allowDelayedResponse___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = v8;
    uint64_t v5 = [WeakRetained[3] objectForKeyedSubscript:*(void *)(a1 + 32)];
    id v6 = [v4 icon];
    [v5 setThumbnailImage:v6 atIndex:*(void *)(a1 + 48)];

    if ((objc_opt_respondsToSelector() & 1) != 0 && [v4 isGenerated])
    {
      id v7 = [v4 extractedBackgroundColor];
    }
    else
    {
      id v7 = 0;
    }
    [v5 setBackgroundColor:v7 atIndex:*(void *)(a1 + 48)];
    [WeakRetained _coalesceResponseDispatchForRequest:*(void *)(a1 + 32)];
  }
}

- (void)_registerInfo:(id)a3 forRequest:(id)a4
{
  id v8 = a4;
  [(NSMutableDictionary *)self->_requestsToRequestInfos setObject:a3 forKeyedSubscript:v8];
  id v6 = [(WBSBookmarkFolderTouchIconProvider *)self folderUUIDForRequest:v8];
  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_bookmarkFolderIdentifiersToRequestSets objectForKeyedSubscript:v6];
    if (!v7)
    {
      id v7 = [MEMORY[0x1E4F1CA80] set];
      [(NSMutableDictionary *)self->_bookmarkFolderIdentifiersToRequestSets setObject:v7 forKeyedSubscript:v6];
    }
    [v7 addObject:v8];
  }
}

- (void)_coalesceResponseDispatchForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_requestsToRequestInfos objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5 && ([v5 hasScheduledCoalescedUpdate] & 1) == 0)
  {
    [v6 setHasScheduledCoalescedUpdate:1];
    objc_initWeak(&location, self);
    dispatch_time_t v7 = dispatch_time(0, 10000000);
    internalQueue = self->_internalQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__WBSBookmarkFolderTouchIconProvider__coalesceResponseDispatchForRequest___block_invoke;
    v9[3] = &unk_1E5E40E00;
    objc_copyWeak(&v12, &location);
    id v10 = v4;
    id v11 = v6;
    dispatch_after(v7, internalQueue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

uint64_t __74__WBSBookmarkFolderTouchIconProvider__coalesceResponseDispatchForRequest___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _dispatchResponseForRequest:*(void *)(a1 + 32)];

  uint64_t v3 = *(void **)(a1 + 40);
  return [v3 setHasScheduledCoalescedUpdate:0];
}

- (void)_dispatchResponseForRequest:(id)a3
{
  id v23 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToRequestInfos, "objectForKeyedSubscript:");
  if (v4)
  {
    [v23 sizeForDrawing];
    double v6 = v5;
    double v8 = v7;
    unint64_t v9 = [(WBSBookmarkFolderTouchIconProvider *)self folderUUIDForRequest:v23];
    id v10 = self->_folderUUIDsToTouchIconInfo;
    objc_sync_enter(v10);
    id v11 = [(NSMutableDictionary *)self->_folderUUIDsToTouchIconInfo objectForKey:v9];
    objc_sync_exit(v10);

    id v12 = [v4 thumbnailImages];
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
    char v14 = [v12 containsObject:v13];

    if (v14)
    {
LABEL_14:

      goto LABEL_15;
    }
    uint64_t v15 = [v4 backgroundColors];
    uint64_t v16 = [v11 backgroundColors];
    if ([v16 isEqual:v15])
    {
      uint64_t v17 = [v11 thumbnailImages];
      int v18 = [v17 isEqualToArray:v12];

      if (!v18)
      {
LABEL_10:
        uint64_t v16 = [(WBSBookmarkFolderTouchIconProvider *)self _drawTouchIconForRequest:v23];
        id v21 = [[_WBSBookmarkFolderTouchIconProviderInfo alloc] initWithThumbnailImages:v12 backgroundColors:v15 touchIcon:v16];
        if (v9)
        {
          long long v22 = self->_folderUUIDsToTouchIconInfo;
          objc_sync_enter(v22);
          [(NSMutableDictionary *)self->_folderUUIDsToTouchIconInfo setObject:v21 forKeyedSubscript:v9];
          objc_sync_exit(v22);
        }
        [(WBSBookmarkFolderTouchIconProvider *)self _dispatchResponseForRequest:v23 touchIcon:v16];

        goto LABEL_13;
      }
      uint64_t v16 = [v11 touchIcon];
      [v16 size];
      if (v16 && v19 >= v6 && v20 >= v8)
      {
        [(WBSBookmarkFolderTouchIconProvider *)self _dispatchResponseForRequest:v23 touchIcon:v16];
LABEL_13:

        goto LABEL_14;
      }
    }

    goto LABEL_10;
  }
LABEL_15:
}

- (void)_dispatchResponseForRequest:(id)a3 touchIcon:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  double v7 = [(NSMutableDictionary *)self->_requestsToRequestInfos objectForKeyedSubscript:v11];

  if (v7)
  {
    double v8 = [(WBSBookmarkFolderTouchIconProvider *)self backgroundColor];
    unint64_t v9 = +[WBSTouchIconResponse responseWithURL:0 touchIcon:v6 generated:1 extractedBackgroundColor:v8];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
    [WeakRetained siteMetadataProvider:self didReceiveResponse:v9 ofType:0 didReceiveNewData:1 forRequest:v11];
  }
}

- (id)_drawTouchIconForRequest:(id)a3
{
  id v4 = a3;
  double v5 = [(WBSBookmarkFolderTouchIconProvider *)self configuration];
  id v6 = [(NSMutableDictionary *)self->_requestsToRequestInfos objectForKeyedSubscript:v4];
  [v4 sizeForDrawing];
  double v8 = v7;
  double v10 = v9;

  id v11 = [(WBSBookmarkFolderTouchIconProvider *)self backgroundColor];
  objc_msgSend(v11, "safari_luminance");
  uint64_t v13 = v12;

  char v14 = objc_msgSend(MEMORY[0x1E4F428B8], "safari_colorWithRGBColorComponents:", &unk_1F0341A98);
  uint64_t v15 = [v6 thumbnailImages];
  uint64_t v16 = [v6 backgroundColors];
  uint64_t v17 = [v5 backgroundColorForEmptySlots];

  if (v17)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v19 = [(WBSBookmarkFolderTouchIconProvider *)self _arrayByPaddingArray:v15 toMaximumNumberOfThumbnailsWithObject:v18];

    double v20 = [v5 backgroundColorForEmptySlots];
    uint64_t v21 = [(WBSBookmarkFolderTouchIconProvider *)self _arrayByPaddingArray:v16 toMaximumNumberOfThumbnailsWithObject:v20];

    uint64_t v16 = (void *)v21;
    uint64_t v15 = (void *)v19;
  }
  BOOL v22 = +[WBSBookmarkFolderTouchIconProvider _appUsesLeftToRightLayout];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __63__WBSBookmarkFolderTouchIconProvider__drawTouchIconForRequest___block_invoke;
  v38[3] = &unk_1E5E40E90;
  double v44 = v8;
  double v45 = v10;
  id v23 = v5;
  id v39 = v23;
  v40 = self;
  id v24 = v15;
  id v41 = v24;
  id v25 = v16;
  id v42 = v25;
  BOOL v47 = v22;
  uint64_t v46 = v13;
  id v26 = v14;
  id v43 = v26;
  v27 = (void *)MEMORY[0x1AD115160](v38);
  v28 = objc_msgSend(MEMORY[0x1E4F42A80], "safari_imageWithSize:actions:", v27, v8, v10);
  if ([v25 indexOfObjectPassingTest:&__block_literal_global_29] != 0x7FFFFFFFFFFFFFFFLL)
  {
    [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:2];
    v29 = id v37 = v23;
    v35 = [MEMORY[0x1E4F42F80] _currentTraitCollection];
    [MEMORY[0x1E4F42F80] _setCurrentTraitCollection:v29];
    [v28 imageAsset];
    id v36 = v26;
    id v30 = v24;
    v32 = id v31 = v6;
    v33 = objc_msgSend(MEMORY[0x1E4F42A80], "safari_imageWithSize:actions:", v27, v8, v10);
    [v32 registerImage:v33 withTraitCollection:v29];

    id v6 = v31;
    id v24 = v30;
    id v26 = v36;
    [MEMORY[0x1E4F42F80] _setCurrentTraitCollection:v35];

    id v23 = v37;
  }
  [(WBSBookmarkFolderTouchIconProvider *)self didCreateTouchIcon:v28];

  return v28;
}

void __63__WBSBookmarkFolderTouchIconProvider__drawTouchIconForRequest___block_invoke(uint64_t a1, CGContextRef c)
{
  id v2 = c;
  v53[2] = *MEMORY[0x1E4F143B8];
  CGSize v54 = *(CGSize *)(a1 + 72);
  id v4 = (id *)(a1 + 72);
  double v5 = CGContextConvertSizeToDeviceSpace(c, v54).width / v54.width;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __63__WBSBookmarkFolderTouchIconProvider__drawTouchIconForRequest___block_invoke_2;
  v52[3] = &__block_descriptor_40_e8_d16__0d8l;
  *(double *)&v52[4] = v5;
  id v6 = (double (**)(void, double))MEMORY[0x1AD115160](v52);
  if ([*(v4 - 5) fillIconWithBackgroundColor])
  {
    double v7 = [*(id *)(a1 + 40) backgroundColor];
    [v7 setFill];

    v55.size.width = *(CGFloat *)(a1 + 72);
    v55.size.height = *(CGFloat *)(a1 + 80);
    v55.origin.x = 0.0;
    v55.origin.y = 0.0;
    double v8 = CGPathCreateWithRect(v55, 0);
    CGContextAddPath(v2, v8);
    CGContextFillPath(v2);
    CGPathRelease(v8);
  }
  double v9 = *(double *)(a1 + 72);
  [*(id *)(a1 + 32) thumbnailIconInnerMarginScaleFactor];
  double v51 = v6[2](v6, v9 * v10);
  double v11 = *(double *)(a1 + 80);
  [*(id *)(a1 + 32) thumbnailIconInnerMarginScaleFactor];
  double v50 = v6[2](v6, v11 * v12);
  double v13 = *(double *)(a1 + 72);
  [*(id *)(a1 + 32) thumbnailIconOuterMarginScaleFactor];
  double v49 = v6[2](v6, v13 * v14);
  double v15 = *(double *)(a1 + 80);
  [*(id *)(a1 + 32) thumbnailIconOuterMarginScaleFactor];
  double v48 = v6[2](v6, v15 * v16);
  double v17 = *(double *)(a1 + 72);
  [*(id *)(a1 + 32) thumbnailIconScaleFactor];
  double v19 = v6[2](v6, v17 * v18);
  *(double *)&v46[4] = v5;
  double v47 = v19;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __63__WBSBookmarkFolderTouchIconProvider__drawTouchIconForRequest___block_invoke_3;
  v46[3] = &__block_descriptor_40_e23_v48__0d8Q16_d24_d32_d40l;
  double v20 = (void (**)(void, void, void, void, void, double))MEMORY[0x1AD115160](v46);
  ((void (**)(void, uint64_t, double *, double *, double *, double))v20)[2](v20, [*(id *)(a1 + 32) maximumNumberOfThumbnailsPerRow], &v48, &v50, &v47, *(double *)(a1 + 80));
  ((void (**)(void, uint64_t, double *, double *, double *, double))v20)[2](v20, [*(id *)(a1 + 32) maximumNumberOfThumbnailsPerRow], &v49, &v51, &v47, *(double *)(a1 + 72));
  unint64_t v21 = 0x1E4F42000uLL;
  BOOL v22 = [MEMORY[0x1E4F42F80] _traitCollectionWithBackgroundLevel:1];
  uint64_t v23 = [MEMORY[0x1E4F42F80] _currentTraitCollection];
  id v24 = (void *)v23;
  id v25 = (void *)MEMORY[0x1E4F42F80];
  if (v23)
  {
    v53[0] = v23;
    v53[1] = v22;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
    v27 = id v26 = v2;
    v28 = [v25 traitCollectionWithTraitsFromCollections:v27];
    [v25 _setCurrentTraitCollection:v28];

    id v2 = v26;
    unint64_t v21 = 0x1E4F42000;
  }
  else
  {
    [MEMORY[0x1E4F42F80] _setCurrentTraitCollection:v22];
  }
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  id v32 = __63__WBSBookmarkFolderTouchIconProvider__drawTouchIconForRequest___block_invoke_4;
  v33 = &unk_1E5E40E68;
  id v37 = v2;
  v29 = *(void **)(a1 + 48);
  id v34 = *(id *)(a1 + 56);
  id v35 = *(id *)(a1 + 32);
  char v45 = *(unsigned char *)(a1 + 96);
  double v38 = v49;
  double v39 = v51;
  double v40 = v47;
  long long v41 = *(_OWORD *)v4;
  double v42 = v48;
  double v43 = v50;
  uint64_t v44 = *(void *)(a1 + 88);
  id v36 = *(id *)(a1 + 64);
  [v29 enumerateObjectsUsingBlock:&v30];
  objc_msgSend(*(id *)(v21 + 3968), "_setCurrentTraitCollection:", v24, v30, v31, v32, v33);
}

double __63__WBSBookmarkFolderTouchIconProvider__drawTouchIconForRequest___block_invoke_2(uint64_t a1, double a2)
{
  return round(*(double *)(a1 + 32) * a2) / *(double *)(a1 + 32);
}

double __63__WBSBookmarkFolderTouchIconProvider__drawTouchIconForRequest___block_invoke_3(uint64_t a1, unint64_t a2, double *a3, double *a4, double *a5, double a6)
{
  double v6 = *a3;
  double v7 = *a4 * (double)(a2 - 1) + *a3 * 2.0 + *a5 * (double)a2 - a6;
  double v8 = *(double *)(a1 + 32);
  uint64_t v9 = llround(v7 / v8);
  if (v9 < 0) {
    uint64_t v9 = -v9;
  }
  BOOL v10 = v7 < 0.0;
  double v11 = 1.0;
  if (v10) {
    double v11 = -1.0;
  }
  double result = v11 / v8;
  if ((unint64_t)v9 >= 2)
  {
    do
    {
      double v6 = v6 - result;
      v9 -= 2;
    }
    while ((unint64_t)v9 > 1);
    *a3 = v6;
  }
  if (v9 == 1)
  {
    *a4 = result + *a4;
    double result = *a5 - result;
    *a5 = result;
  }
  return result;
}

void __63__WBSBookmarkFolderTouchIconProvider__drawTouchIconForRequest___block_invoke_4(uint64_t a1, void *a2, unint64_t a3)
{
  id v23 = a2;
  CGContextSaveGState(*(CGContextRef *)(a1 + 56));
  id v5 = [MEMORY[0x1E4F1CA98] null];
  if (v5 == v23) {
    double v6 = 0;
  }
  else {
    double v6 = v23;
  }
  id v7 = v6;

  double v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  if (v8 == v9) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v8;
  }
  id v11 = v10;

  unint64_t v12 = a3 / [*(id *)(a1 + 40) maximumNumberOfThumbnailsPerRow];
  unint64_t v13 = a3 % [*(id *)(a1 + 40) maximumNumberOfThumbnailsPerRow];
  double v14 = *(double *)(a1 + 80);
  if (*(unsigned char *)(a1 + 128)) {
    double v15 = *(double *)(a1 + 64) + (*(double *)(a1 + 72) + v14) * (double)v13;
  }
  else {
    double v15 = *(double *)(a1 + 88) - (v14 + *(double *)(a1 + 64) + (*(double *)(a1 + 72) + v14) * (double)v13);
  }
  double v16 = *(double *)(a1 + 104) + (*(double *)(a1 + 112) + v14) * (double)v12;
  if (v14 <= 60.0) {
    double v17 = 3.0;
  }
  else {
    double v17 = 1.0;
  }
  double v18 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", v15, *(double *)(a1 + 104) + (*(double *)(a1 + 112) + v14) * (double)v12, v14, v14, v17);
  [v18 addClip];
  if (v11)
  {
    [v11 setFill];
    v25.origin.x = v15;
    v25.origin.y = v16;
    v25.size.width = v14;
    v25.size.height = v14;
    double v19 = CGPathCreateWithRect(v25, 0);
    CGContextAddPath(*(CGContextRef *)(a1 + 56), v19);
    CGContextFillPath(*(CGContextRef *)(a1 + 56));
    CGPathRelease(v19);
  }
  if (v7)
  {
    objc_msgSend(v7, "drawInRect:", v15, v16, v14, v14);
    objc_msgSend(v7, "safari_computeAverageLuminance");
    if (vabdd_f64(v20, *(double *)(a1 + 120)) < 0.1)
    {
      unint64_t v21 = [*(id *)(a1 + 40) colorForDarkeningThumbnailBackground];

      if (v21)
      {
        CGContextSetBlendMode(*(CGContextRef *)(a1 + 56), kCGBlendModeDarken);
        CGContextSetAlpha(*(CGContextRef *)(a1 + 56), 0.1);
        BOOL v22 = [*(id *)(a1 + 40) colorForDarkeningThumbnailBackground];
        [v22 setFill];

        v26.origin.x = v15;
        v26.origin.y = v16;
        v26.size.width = v14;
        v26.size.height = v14;
        CGContextFillRect(*(CGContextRef *)(a1 + 56), v26);
      }
      else
      {
        [*(id *)(a1 + 48) setStroke];
        [v18 stroke];
      }
    }
  }
  CGContextRestoreGState(*(CGContextRef *)(a1 + 56));
}

uint64_t __63__WBSBookmarkFolderTouchIconProvider__drawTouchIconForRequest___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1CA98];
  id v3 = a2;
  id v4 = [v2 null];
  int v5 = [v3 isEqual:v4];

  return v5 ^ 1u;
}

- (id)_arrayByPaddingArray:(id)a3 toMaximumNumberOfThumbnailsWithObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(WBSBookmarkFolderTouchIconProvider *)self configuration];
  unint64_t v9 = [v8 maximumNumberOfThumbnailIcons];

  if ([v6 count] >= v9)
  {
    id v14 = v6;
  }
  else
  {
    BOOL v10 = (void *)[v6 mutableCopy];
    unint64_t v11 = [v6 count];
    BOOL v12 = v9 > v11;
    unint64_t v13 = v9 - v11;
    if (v12)
    {
      do
      {
        [v10 addObject:v7];
        --v13;
      }
      while (v13);
    }
    id v14 = (id)[v10 copy];
  }
  return v14;
}

- (WBSSiteMetadataProviderDelegate)providerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
  return (WBSSiteMetadataProviderDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_providerDelegate);
  objc_storeStrong((id *)&self->_folderUUIDsToTouchIconInfo, 0);
  objc_storeStrong((id *)&self->_requestsToRequestInfos, 0);
  objc_storeStrong((id *)&self->_bookmarkFolderIdentifiersToRequestSets, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end