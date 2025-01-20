@interface WBSTemplateIconCache
- (BOOL)_isLocalIconRequest:(id)a3;
- (BOOL)_templateIconRetainerIsReadyForCleanUp;
- (BOOL)cacheData:(id)a3 forRequest:(id)a4 usingToken:(id)a5;
- (BOOL)canHandleRequest:(id)a3;
- (BOOL)hasDeterminedIconAvailabilityForURL:(id)a3;
- (BOOL)shouldRequestTemplateIconForURL:(id)a3 allowRefresh:(BOOL)a4;
- (CGSize)defaultIconSize;
- (NSURL)imageDirectoryURL;
- (WBSSiteMetadataProviderDelegate)providerDelegate;
- (WBSTemplateIconCache)init;
- (WBSTemplateIconCache)initWithImageDirectoryURL:(id)a3;
- (id)_generateResponseForRequest:(id)a3;
- (id)_imageForRequest:(id)a3 getThemeColor:(id *)a4;
- (id)_monogramForRequest:(id)a3 themeColor:(id)a4;
- (id)_templateIconForURL:(id)a3 getThemeColor:(id *)a4;
- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4;
- (void)_didAddHistoryItems:(id)a3;
- (void)_didLoadHistory:(id)a3;
- (void)_didRemoveHistoryItems:(id)a3;
- (void)_notifyDidLoadIconForHost:(id)a3;
- (void)_notifyImageWasLoaded:(id)a3 forHost:(id)a4;
- (void)_purgeUnneededTemplateIconsIfReady;
- (void)_registerRequest:(id)a3;
- (void)_removeTemplateIconsDataForHost:(id)a3 ifIconIsInCache:(BOOL)a4;
- (void)_requestTemplateIconForRequest:(id)a3;
- (void)_saveTemplateIcon:(id)a3 withThemeColor:(id)a4 forHost:(id)a5 toDisk:(BOOL)a6;
- (void)_setUpAndReturnDelayedResponseForRequest:(id)a3;
- (void)_setUpAndReturnPreparedResponseForRequest:(id)a3;
- (void)_updateTemplateIconsDataForHost:(id)a3 image:(id)a4 themeColor:(id)a5 isSavedToDisk:(BOOL)a6;
- (void)_upgradeCacheVersionIfNeeded;
- (void)dealloc;
- (void)emptyCaches;
- (void)prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4;
- (void)purgeUnneededCacheEntries;
- (void)releaseTemplateIconForHost:(id)a3;
- (void)releaseTemplateIconForURLString:(id)a3;
- (void)releaseTemplateIconsForHosts:(id)a3;
- (void)retainTemplateIconForHost:(id)a3;
- (void)retainTemplateIconForURLString:(id)a3;
- (void)retainTemplateIconsForHosts:(id)a3;
- (void)savePendingChangesBeforeTermination;
- (void)setDefaultIconSize:(CGSize)a3;
- (void)setProviderDelegate:(id)a3;
- (void)siteMetadataImageCache:(id)a3 didFinishLoadingImage:(id)a4 forKeyString:(id)a5;
- (void)siteMetadataImageCache:(id)a3 didRemoveImageFromCacheForKeyString:(id)a4;
- (void)siteMetadataImageCacheDidEmptyCache:(id)a3;
- (void)siteMetadataImageCacheDidFinishLoadingSettings:(id)a3;
- (void)stopWatchingUpdatesForRequest:(id)a3;
@end

@implementation WBSTemplateIconCache

- (WBSTemplateIconCache)init
{
  return [(WBSTemplateIconCache *)self initWithImageDirectoryURL:0];
}

- (WBSTemplateIconCache)initWithImageDirectoryURL:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)WBSTemplateIconCache;
  v5 = [(WBSTemplateIconCache *)&v33 init];
  if (v5)
  {
    v6 = NSString;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    id v9 = [v6 stringWithFormat:@"com.apple.Safari.%@.%p.internalQueue", v8, v5];
    v10 = (const char *)[v9 UTF8String];
    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)v12;

    v5->_templateIconsDataForHostsAccessLock._os_unfair_lock_opaque = 0;
    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    hostsToRequestSets = v5->_hostsToRequestSets;
    v5->_hostsToRequestSets = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    pendingTemplateIconRequestHosts = v5->_pendingTemplateIconRequestHosts;
    v5->_pendingTemplateIconRequestHosts = (NSMutableSet *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA80] set];
    pendingTemplateIconFallbackRequestHosts = v5->_pendingTemplateIconFallbackRequestHosts;
    v5->_pendingTemplateIconFallbackRequestHosts = (NSMutableSet *)v18;

    uint64_t v20 = [MEMORY[0x1E4F1CA80] set];
    pendingSVGImageRenderingRequests = v5->_pendingSVGImageRenderingRequests;
    v5->_pendingSVGImageRenderingRequests = (NSMutableSet *)v20;

    uint64_t v22 = [MEMORY[0x1E4F1CA80] set];
    pendingSVGImageRenderingRequestsThatCanBeSavedToDisk = v5->_pendingSVGImageRenderingRequestsThatCanBeSavedToDisk;
    v5->_pendingSVGImageRenderingRequestsThatCanBeSavedToDisk = (NSMutableSet *)v22;

    uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
    requestsToDelayedResponses = v5->_requestsToDelayedResponses;
    v5->_requestsToDelayedResponses = (NSMutableDictionary *)v24;

    v26 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    requestsToResponses = v5->_requestsToResponses;
    v5->_requestsToResponses = v26;

    v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v28 addObserver:v5 selector:sel__didAddHistoryItems_ name:*MEMORY[0x1E4F98630] object:0];
    [v28 addObserver:v5 selector:sel__didAddHistoryItems_ name:*MEMORY[0x1E4F98628] object:0];
    [v28 addObserver:v5 selector:sel__didRemoveHistoryItems_ name:*MEMORY[0x1E4F98638] object:0];
    [v28 addObserver:v5 selector:sel__didLoadHistory_ name:*MEMORY[0x1E4F98648] object:0];
    [v28 addObserver:v5 selector:sel__didRemoveHistoryItems_ name:*MEMORY[0x1E4F98640] object:0];
    v29 = [[WBSSiteMetadataImageCache alloc] initWithImageDirectoryURL:v4 imageType:0];
    imageCache = v5->_imageCache;
    v5->_imageCache = v29;

    [(WBSSiteMetadataImageCache *)v5->_imageCache setDelegate:v5];
    [(WBSSiteMetadataImageCache *)v5->_imageCache setUpImageCache];
    v31 = v5;
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WBSTemplateIconCache;
  [(WBSTemplateIconCache *)&v4 dealloc];
}

- (NSURL)imageDirectoryURL
{
  return [(WBSSiteMetadataImageCache *)self->_imageCache imageDirectoryURL];
}

- (BOOL)canHandleRequest:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4
{
  id v6 = a3;
  v7 = [v6 url];
  v8 = [v7 host];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    *a4 = 1;
    [(NSCache *)self->_requestsToResponses objectForKey:v6];
  }
  else
  {
    *a4 = 0;
    [(WBSTemplateIconCache *)self _monogramForRequest:v6 themeColor:0];
  v10 = };

  return v10;
}

- (void)prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4
{
  id v6 = a3;
  [(WBSTemplateIconCache *)self _registerRequest:v6];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__WBSTemplateIconCache_prepareResponseForRequest_allowDelayedResponse___block_invoke;
  block[3] = &unk_1E5E44D18;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

void __71__WBSTemplateIconCache_prepareResponseForRequest_allowDelayedResponse___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _requestTemplateIconForRequest:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) url];
  LODWORD(v2) = [v2 hasDeterminedIconAvailabilityForURL:v3];

  if (v2)
  {
    objc_super v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    [v4 _setUpAndReturnPreparedResponseForRequest:v5];
  }
  else if (*(unsigned char *)(a1 + 48))
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    [v6 _setUpAndReturnDelayedResponseForRequest:v7];
  }
}

- (void)_setUpAndReturnDelayedResponseForRequest:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
  uint64_t v5 = [(NSMutableDictionary *)self->_requestsToDelayedResponses objectForKeyedSubscript:v6];
  if (!v5)
  {
    uint64_t v5 = [(WBSTemplateIconCache *)self _generateResponseForRequest:v6];
    [(NSMutableDictionary *)self->_requestsToDelayedResponses setObject:v5 forKeyedSubscript:v6];
  }
  [WeakRetained siteMetadataProvider:self didReceiveResponse:v5 ofType:1 didReceiveNewData:0 forRequest:v6];
}

- (void)_setUpAndReturnPreparedResponseForRequest:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
  uint64_t v5 = [(NSCache *)self->_requestsToResponses objectForKey:v6];
  if (v5)
  {
    [WeakRetained siteMetadataProvider:self didReceiveResponse:v5 ofType:0 didReceiveNewData:0 forRequest:v6];
  }
  else
  {
    uint64_t v5 = [(WBSTemplateIconCache *)self _generateResponseForRequest:v6];
    [(NSCache *)self->_requestsToResponses setObject:v5 forKey:v6];
    [(NSMutableDictionary *)self->_requestsToDelayedResponses removeObjectForKey:v6];
    [WeakRetained siteMetadataProvider:self didReceiveResponse:v5 ofType:0 didReceiveNewData:1 forRequest:v6];
  }
}

- (void)_registerRequest:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__WBSTemplateIconCache__registerRequest___block_invoke;
  v7[3] = &unk_1E5E407D0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __41__WBSTemplateIconCache__registerRequest___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) url];
  id v3 = [v2 host];
  objc_msgSend(v3, "safari_stringByRemovingWwwDotPrefix");
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [*(id *)(*(void *)(a1 + 40) + 48) objectForKeyedSubscript:v5];
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "setObject:forKeyedSubscript:");
  }
  [v4 addObject:*(void *)(a1 + 32)];
}

- (void)stopWatchingUpdatesForRequest:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__WBSTemplateIconCache_stopWatchingUpdatesForRequest___block_invoke;
  v7[3] = &unk_1E5E407D0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __54__WBSTemplateIconCache_stopWatchingUpdatesForRequest___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) url];
  id v3 = [v2 host];
  objc_msgSend(v3, "safari_stringByRemovingWwwDotPrefix");
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [*(id *)(*(void *)(a1 + 40) + 48) objectForKeyedSubscript:v5];
  [v4 removeObject:*(void *)(a1 + 32)];
  if (![v4 count]) {
    [*(id *)(*(void *)(a1 + 40) + 48) removeObjectForKey:v5];
  }
}

- (BOOL)_isLocalIconRequest:(id)a3
{
  id v3 = [a3 url];
  char v4 = objc_msgSend(v3, "safari_isHTTPFamilyURL") ^ 1;

  return v4;
}

- (void)_requestTemplateIconForRequest:(id)a3
{
  char v4 = [a3 url];
  id v5 = [v4 host];
  objc_msgSend(v5, "safari_stringByRemovingWwwDotPrefix");
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = v11;
  if (v11)
  {
    if (self->_areSettingsLoaded)
    {
      os_unfair_lock_lock(&self->_templateIconsDataForHostsAccessLock);
      uint64_t v7 = [(NSMutableDictionary *)self->_templateIconsDataForHosts objectForKeyedSubscript:v11];
      os_unfair_lock_unlock(&self->_templateIconsDataForHostsAccessLock);
      int v8 = objc_msgSend(v7, "safari_BOOLForKey:", @"TemplateIconInCache");
      imageCache = self->_imageCache;
      if (v8) {
        id v10 = [(WBSSiteMetadataImageCache *)imageCache imageForKeyString:v11 getImageState:0];
      }
      else {
        [(WBSSiteMetadataImageCache *)imageCache setImageState:1 forKeyString:v11];
      }

      id v6 = v11;
    }
    else
    {
      [(NSMutableSet *)self->_pendingTemplateIconRequestHosts addObject:v11];
      id v6 = v11;
    }
  }
}

- (id)_templateIconForURL:(id)a3 getThemeColor:(id *)a4
{
  id v6 = a3;
  *a4 = 0;
  uint64_t v7 = [v6 host];
  int v8 = objc_msgSend(v7, "safari_stringByRemovingWwwDotPrefix");

  if (v8 && self->_areSettingsLoaded)
  {
    os_unfair_lock_lock(&self->_templateIconsDataForHostsAccessLock);
    uint64_t v9 = [(NSMutableDictionary *)self->_templateIconsDataForHosts objectForKeyedSubscript:v8];
    os_unfair_lock_unlock(&self->_templateIconsDataForHostsAccessLock);
    id v10 = [v9 objectForKeyedSubscript:@"TemplateIconThemeColor"];
    objc_msgSend(MEMORY[0x1E4F428B8], "safari_colorWithRGBColorComponents:", v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    *a4 = v11;
    if (!v11)
    {
      dispatch_queue_t v12 = (void *)[v9 mutableCopy];
      [v12 removeObjectForKey:@"TemplateIconThemeColor"];
      os_unfair_lock_lock(&self->_templateIconsDataForHostsAccessLock);
      [(NSMutableDictionary *)self->_templateIconsDataForHosts setObject:v12 forKeyedSubscript:v8];
      imageCache = self->_imageCache;
      uint64_t v14 = (void *)[(NSMutableDictionary *)self->_templateIconsDataForHosts copy];
      [(WBSSiteMetadataImageCache *)imageCache setSetting:v14 forKey:@"TemplateIcons"];

      os_unfair_lock_unlock(&self->_templateIconsDataForHostsAccessLock);
    }
    if (objc_msgSend(v9, "safari_BOOLForKey:", @"TemplateIconInCache"))
    {
      v15 = [(WBSSiteMetadataImageCache *)self->_imageCache imageForKeyString:v8 getImageState:0];
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_generateResponseForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 url];
  id v14 = 0;
  id v6 = [(WBSTemplateIconCache *)self _imageForRequest:v4 getThemeColor:&v14];
  id v7 = v14;
  if (v6)
  {
    int v8 = [v4 overrideForegroundColor];
    uint64_t v9 = v8;
    if (!v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F428B8] colorWithWhite:0.75 alpha:1.0];
    }
    id v10 = +[WBSImageUtilities flatImage:v6 withColor:v9];
    if (!v8) {

    }
    id v11 = +[WBSImageUtilities flatImage:v6 withColor:v7];
    dispatch_queue_t v12 = +[WBSTemplateIconResponse responseWithURL:v5 image:v10 highlightedImage:v11 themeColor:v7 isMonogram:0];
  }
  else
  {
    dispatch_queue_t v12 = [(WBSTemplateIconCache *)self _monogramForRequest:v4 themeColor:v7];
  }

  return v12;
}

- (id)_monogramForRequest:(id)a3 themeColor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 url];
  int v8 = [v5 monogramConfiguration];
  if ([v8 skipMonogramGeneration])
  {
    uint64_t v9 = +[WBSTemplateIconResponse responseWithURL:v7 image:0 highlightedImage:0 themeColor:v6 isMonogram:0];
  }
  else
  {
    id v10 = [v5 monogramTitle];
    if (v8)
    {
      v35 = v10;
      [v8 iconSize];
      double v12 = v11;
      double v14 = v13;
      [v8 fontSize];
      double v16 = v15;
      uint64_t v17 = [v8 fontWeight];
      uint64_t v18 = [v8 fontDesign];
      [v8 baselineOffset];
      double v20 = v19;
      [v8 cornerRadius];
      double v22 = v21;
      uint64_t v23 = [v8 backgroundColor];
      uint64_t v24 = (void *)v23;
      if (v23) {
        v25 = (void *)v23;
      }
      else {
        v25 = v6;
      }
      id v26 = v25;

      v34 = v26;
      v27 = [MEMORY[0x1E4F428B8] colorWithWhite:0.75 alpha:1.0];
      v28 = +[WBSTemplateIconMonogramConfiguration configurationWithIconSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:](WBSTemplateIconMonogramConfiguration, "configurationWithIconSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:", v17, v18, v27, v12, v14, v16, v20, v22);

      v29 = +[WBSTemplateIconMonogramConfiguration configurationWithIconSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:](WBSTemplateIconMonogramConfiguration, "configurationWithIconSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:", v17, v18, v26, v12, v14, v16, v20, v22);
      id v10 = v35;
      v30 = +[WBSTemplateIconMonogramGenerator monogramWithTitle:v35 url:v7 monogramConfiguration:v28];
      v31 = +[WBSTemplateIconMonogramGenerator monogramWithTitle:v35 url:v7 monogramConfiguration:v29];
    }
    else
    {
      v32 = [MEMORY[0x1E4F428B8] colorWithWhite:0.75 alpha:1.0];
      v30 = +[WBSTemplateIconMonogramGenerator monogramWithTitle:v10 url:v7 backgroundColor:v32];

      v31 = +[WBSTemplateIconMonogramGenerator monogramWithTitle:v10 url:v7 backgroundColor:v6];
    }
    uint64_t v9 = +[WBSTemplateIconResponse responseWithURL:v7 image:v30 highlightedImage:v31 themeColor:v6 isMonogram:1];
  }
  return v9;
}

- (BOOL)cacheData:(id)a3 forRequest:(id)a4 usingToken:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v12 = v11;
    }
    else {
      double v12 = 0;
    }
    id v13 = v12;

    internalQueue = self->_internalQueue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__WBSTemplateIconCache_cacheData_forRequest_usingToken___block_invoke;
    v17[3] = &unk_1E5E451F8;
    id v18 = v13;
    double v19 = self;
    id v20 = v10;
    id v21 = v9;
    id v15 = v13;
    dispatch_async(internalQueue, v17);
  }
  return v8 != 0;
}

void __56__WBSTemplateIconCache_cacheData_forRequest_usingToken___block_invoke(uint64_t a1)
{
  v2 = [WBSSVGImageRenderingRequest alloc];
  id v3 = [*(id *)(a1 + 32) templateIconURL];
  id v4 = -[WBSSVGImageRenderingRequest initWithURL:imageSize:](v2, "initWithURL:imageSize:", v3, *(double *)(*(void *)(a1 + 40) + 120), *(double *)(*(void *)(a1 + 40) + 128));

  if ([*(id *)(a1 + 32) canSaveToDisk]) {
    [*(id *)(*(void *)(a1 + 40) + 80) addObject:v4];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 112));
  int v6 = [*(id *)(*(void *)(a1 + 40) + 72) containsObject:v4];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v6)
  {
    [WeakRetained siteMetadataProvider:v7 didFinishCachingDataWithToken:*(void *)(a1 + 48)];
  }
  else
  {
    [*(id *)(v7 + 72) addObject:v4];
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 56)];
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(v10 + 8);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__WBSTemplateIconCache_cacheData_forRequest_usingToken___block_invoke_2;
    v13[3] = &unk_1E5E451D0;
    v13[4] = v10;
    double v14 = v4;
    id v15 = *(id *)(a1 + 32);
    id v16 = WeakRetained;
    id v17 = *(id *)(a1 + 48);
    id v12 = (id)[v16 siteMetadataProvider:v8 registerOneTimeSubrequest:v14 forRequests:v9 queue:v11 responseHandler:v13];
  }
}

void __56__WBSTemplateIconCache_cacheData_forRequest_usingToken___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 80) containsObject:*(void *)(a1 + 40)];
  id v4 = *(void **)(a1 + 32);
  id v5 = [v8 image];
  int v6 = [*(id *)(a1 + 48) themeColor];
  uint64_t v7 = [*(id *)(a1 + 48) host];
  [v4 _saveTemplateIcon:v5 withThemeColor:v6 forHost:v7 toDisk:v3];

  [*(id *)(*(void *)(a1 + 32) + 72) removeObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 80) removeObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 56) siteMetadataProvider:*(void *)(a1 + 32) didFinishCachingDataWithToken:*(void *)(a1 + 64)];
}

- (void)_saveTemplateIcon:(id)a3 withThemeColor:(id)a4 forHost:(id)a5 toDisk:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_msgSend(v12, "safari_stringByRemovingWwwDotPrefix");

  if (v10) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = [(WBSSiteMetadataImageCache *)self->_imageCache imageStateForKeyString:v13] == 0;
  }
  [(WBSTemplateIconCache *)self _updateTemplateIconsDataForHost:v13 image:v10 themeColor:v11 isSavedToDisk:v6];
  imageCache = self->_imageCache;
  if (v6) {
    [(WBSSiteMetadataImageCache *)imageCache saveImageToDisk:v10 forKeyString:v13 completionHandler:0];
  }
  else {
    [(WBSSiteMetadataImageCache *)imageCache setImage:v10 forKeyString:v13];
  }
  if (!v14)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v16 = -[NSMutableDictionary objectForKeyedSubscript:](self->_hostsToRequestSets, "objectForKeyedSubscript:", v13, 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v21;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v16);
          }
          [(WBSTemplateIconCache *)self _setUpAndReturnPreparedResponseForRequest:*(void *)(*((void *)&v20 + 1) + 8 * v19++)];
        }
        while (v17 != v19);
        uint64_t v17 = [v16 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v17);
    }
  }
}

- (void)retainTemplateIconForURLString:(id)a3
{
  id v4 = a3;
  imageCache = self->_imageCache;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__WBSTemplateIconCache_retainTemplateIconForURLString___block_invoke;
  v7[3] = &unk_1E5E45220;
  id v8 = v4;
  id v6 = v4;
  [(WBSSiteMetadataImageCache *)imageCache retainImageWithKeyStringProvider:v7];
}

id __55__WBSTemplateIconCache_retainTemplateIconForURLString___block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithUserTypedString:", *(void *)(a1 + 32));
  v2 = [v1 host];
  uint64_t v3 = objc_msgSend(v2, "safari_stringByRemovingWwwDotPrefix");

  return v3;
}

- (void)retainTemplateIconForHost:(id)a3
{
  imageCache = self->_imageCache;
  objc_msgSend(a3, "safari_stringByRemovingWwwDotPrefix");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSSiteMetadataImageCache retainImageForKeyString:](imageCache, "retainImageForKeyString:");
}

- (void)retainTemplateIconsForHosts:(id)a3
{
  imageCache = self->_imageCache;
  id v4 = [a3 valueForKey:@"safari_stringByRemovingWwwDotPrefix"];
  -[WBSSiteMetadataImageCache retainImagesForKeyStrings:](imageCache, "retainImagesForKeyStrings:");
}

- (void)releaseTemplateIconForURLString:(id)a3
{
  id v4 = a3;
  imageCache = self->_imageCache;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__WBSTemplateIconCache_releaseTemplateIconForURLString___block_invoke;
  v7[3] = &unk_1E5E45220;
  id v8 = v4;
  id v6 = v4;
  [(WBSSiteMetadataImageCache *)imageCache releaseImageWithKeyStringProvider:v7];
}

id __56__WBSTemplateIconCache_releaseTemplateIconForURLString___block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithUserTypedString:", *(void *)(a1 + 32));
  v2 = [v1 host];

  return v2;
}

- (void)releaseTemplateIconForHost:(id)a3
{
  imageCache = self->_imageCache;
  objc_msgSend(a3, "safari_stringByRemovingWwwDotPrefix");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSSiteMetadataImageCache releaseImageForKeyString:](imageCache, "releaseImageForKeyString:");
}

- (void)releaseTemplateIconsForHosts:(id)a3
{
  imageCache = self->_imageCache;
  id v4 = [a3 valueForKey:@"safari_stringByRemovingWwwDotPrefix"];
  -[WBSSiteMetadataImageCache releaseImagesForKeyStrings:](imageCache, "releaseImagesForKeyStrings:");
}

- (BOOL)hasDeterminedIconAvailabilityForURL:(id)a3
{
  imageCache = self->_imageCache;
  id v4 = [a3 host];
  id v5 = objc_msgSend(v4, "safari_stringByRemovingWwwDotPrefix");
  LOBYTE(imageCache) = [(WBSSiteMetadataImageCache *)imageCache imageStateForKeyString:v5] != 0;

  return (char)imageCache;
}

- (BOOL)shouldRequestTemplateIconForURL:(id)a3 allowRefresh:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (self->_areSettingsLoaded)
  {
    id v8 = [v6 host];
    id v9 = objc_msgSend(v8, "safari_stringByRemovingWwwDotPrefix");

    if (v9)
    {
      os_unfair_lock_lock(&self->_templateIconsDataForHostsAccessLock);
      id v10 = [(NSMutableDictionary *)self->_templateIconsDataForHosts objectForKeyedSubscript:v9];
      os_unfair_lock_unlock(&self->_templateIconsDataForHostsAccessLock);
      if (v10)
      {
        if (!objc_msgSend(v10, "safari_BOOLForKey:", @"TemplateIconInCache") || a4)
        {
          id v12 = [v10 objectForKeyedSubscript:@"TemplateIconLastRequestDate"];
          [v12 timeIntervalSinceNow];
          BOOL v11 = v13 < -345600.0;
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = [(WBSSiteMetadataImageCache *)self->_imageCache imageStateForKeyString:v9] == 1;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)emptyCaches
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__WBSTemplateIconCache_emptyCaches__block_invoke;
  block[3] = &unk_1E5E408C0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __35__WBSTemplateIconCache_emptyCaches__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllImages];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 88) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 96) removeAllObjects];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  return [v2 emptyCache];
}

- (void)purgeUnneededCacheEntries
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__WBSTemplateIconCache_purgeUnneededCacheEntries__block_invoke;
  block[3] = &unk_1E5E408C0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __49__WBSTemplateIconCache_purgeUnneededCacheEntries__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) purgeUnneededImages];
}

- (void)savePendingChangesBeforeTermination
{
  dispatch_sync((dispatch_queue_t)self->_internalQueue, &__block_literal_global_44);
  imageCache = self->_imageCache;
  [(WBSSiteMetadataImageCache *)imageCache savePendingChangesBeforeTermination];
}

- (void)_updateTemplateIconsDataForHost:(id)a3 image:(id)a4 themeColor:(id)a5 isSavedToDisk:(BOOL)a6
{
  BOOL v6 = a6;
  id v22 = a3;
  id v10 = a5;
  p_templateIconsDataForHostsAccessLock = &self->_templateIconsDataForHostsAccessLock;
  os_unfair_lock_lock(&self->_templateIconsDataForHostsAccessLock);
  id v12 = [(NSMutableDictionary *)self->_templateIconsDataForHosts objectForKeyedSubscript:v22];
  double v13 = (void *)[v12 mutableCopy];

  if (!v13)
  {
    double v13 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  BOOL v14 = [MEMORY[0x1E4F1C9C8] date];
  [v13 setObject:v14 forKeyedSubscript:@"TemplateIconLastRequestDate"];

  id v15 = NSNumber;
  id v16 = [v13 objectForKeyedSubscript:@"TemplateIconRequestCount"];
  uint64_t v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "unsignedIntegerValue") + 1);
  [v13 setObject:v17 forKeyedSubscript:@"TemplateIconRequestCount"];

  uint64_t v18 = [NSNumber numberWithBool:a4 != 0];
  [v13 setObject:v18 forKeyedSubscript:@"TemplateIconInCache"];

  if (v10)
  {
    uint64_t v19 = objc_msgSend(v10, "safari_rgbColorComponents");
    [v13 setObject:v19 forKeyedSubscript:@"TemplateIconThemeColor"];
  }
  [(NSMutableDictionary *)self->_templateIconsDataForHosts setObject:v13 forKeyedSubscript:v22];
  if (v6)
  {
    imageCache = self->_imageCache;
    long long v21 = (void *)[(NSMutableDictionary *)self->_templateIconsDataForHosts copy];
    [(WBSSiteMetadataImageCache *)imageCache setSetting:v21 forKey:@"TemplateIcons"];
  }
  os_unfair_lock_unlock(p_templateIconsDataForHostsAccessLock);
}

- (void)_removeTemplateIconsDataForHost:(id)a3 ifIconIsInCache:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  p_templateIconsDataForHostsAccessLock = &self->_templateIconsDataForHostsAccessLock;
  os_unfair_lock_lock(&self->_templateIconsDataForHostsAccessLock);
  if (!v4
    || (-[NSMutableDictionary objectForKeyedSubscript:](self->_templateIconsDataForHosts, "objectForKeyedSubscript:", v12), v7 = objc_claimAutoreleasedReturnValue(), int v8 = objc_msgSend(v7, "safari_BOOLForKey:", @"TemplateIconInCache"), v7, v8))
  {
    [(NSMutableDictionary *)self->_templateIconsDataForHosts removeObjectForKey:v12];
    imageCache = self->_imageCache;
    uint64_t v10 = [(NSMutableDictionary *)self->_templateIconsDataForHosts count];
    BOOL v11 = v10 ? (void *)[(NSMutableDictionary *)self->_templateIconsDataForHosts copy] : 0;
    [(WBSSiteMetadataImageCache *)imageCache setSetting:v11 forKey:@"TemplateIcons"];
    if (v10) {
  }
    }
  os_unfair_lock_unlock(p_templateIconsDataForHostsAccessLock);
}

- (void)_upgradeCacheVersionIfNeeded
{
  p_templateIconsDataForHostsAccessLock = &self->_templateIconsDataForHostsAccessLock;
  os_unfair_lock_lock(&self->_templateIconsDataForHostsAccessLock);
  id v4 = [(WBSSiteMetadataImageCache *)self->_imageCache settingForKey:@"TemplateIconCacheVersion"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (unint64_t)[v4 unsignedIntegerValue] <= 6)
  {
    [(WBSSiteMetadataImageCache *)self->_imageCache setSetting:0 forKey:@"TemplateIcons"];
    [(WBSSiteMetadataImageCache *)self->_imageCache setSetting:&unk_1F0341868 forKey:@"TemplateIconCacheVersion"];
    [(WBSSiteMetadataImageCache *)self->_imageCache setSetting:0 forKey:@"TemplateIconFallbackConfiguration"];
    [(WBSSiteMetadataImageCache *)self->_imageCache setSetting:0 forKey:@"TemplateIconFallbackConfigurationLastRefreshDate"];
    [(WBSSiteMetadataImageCache *)self->_imageCache removeAllImages];
  }
  os_unfair_lock_unlock(p_templateIconsDataForHostsAccessLock);
}

- (id)_imageForRequest:(id)a3 getThemeColor:(id *)a4
{
  BOOL v6 = [a3 url];
  uint64_t v7 = [(WBSTemplateIconCache *)self _templateIconForURL:v6 getThemeColor:a4];

  return v7;
}

- (void)_notifyDidLoadIconForHost:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_hostsToRequestSets, "objectForKeyedSubscript:", a3, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        [(NSCache *)self->_requestsToResponses removeObjectForKey:v8];
        [(WBSTemplateIconCache *)self _setUpAndReturnPreparedResponseForRequest:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_purgeUnneededTemplateIconsIfReady
{
  if ([(WBSTemplateIconCache *)self _templateIconRetainerIsReadyForCleanUp]
    && !self->_hasPurgedUnneededItems)
  {
    self->_hasPurgedUnneededItems = 1;
    [(WBSTemplateIconCache *)self purgeUnneededCacheEntries];
  }
}

- (BOOL)_templateIconRetainerIsReadyForCleanUp
{
  return self->_historyDidFinishLoading;
}

- (void)_didAddHistoryItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F98620]];

  if ([v6 count])
  {
    internalQueue = self->_internalQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__WBSTemplateIconCache__didAddHistoryItems___block_invoke;
    v8[3] = &unk_1E5E407D0;
    id v9 = v6;
    long long v10 = self;
    dispatch_async(internalQueue, v8);
  }
}

void __44__WBSTemplateIconCache__didAddHistoryItems___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v6), "url", (void)v10);
        uint64_t v8 = [v7 host];
        id v9 = objc_msgSend(v8, "safari_stringByRemovingWwwDotPrefix");

        if (v9) {
          [v2 addObject:v9];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 40) retainTemplateIconsForHosts:v2];
}

- (void)_didRemoveHistoryItems:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F98620]];
    internalQueue = self->_internalQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__WBSTemplateIconCache__didRemoveHistoryItems___block_invoke;
    v10[3] = &unk_1E5E407D0;
    id v11 = v7;
    long long v12 = self;
    id v9 = v7;
    dispatch_async(internalQueue, v10);
  }
}

void __47__WBSTemplateIconCache__didRemoveHistoryItems___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v6), "url", (void)v10);
        uint64_t v8 = [v7 host];
        id v9 = objc_msgSend(v8, "safari_stringByRemovingWwwDotPrefix");

        if (v9) {
          [v2 addObject:v9];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 40) releaseTemplateIconsForHosts:v2];
}

- (void)_didLoadHistory:(id)a3
{
  id v4 = a3;
  self->_historyDidFinishLoading = 1;
  id v8 = v4;
  uint64_t v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F98610]];
  char v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0) {
    [(WBSTemplateIconCache *)self _purgeUnneededTemplateIconsIfReady];
  }
}

- (void)_notifyImageWasLoaded:(id)a3 forHost:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (!v7) {
    [(WBSTemplateIconCache *)self _removeTemplateIconsDataForHost:v6 ifIconIsInCache:1];
  }
  [(WBSTemplateIconCache *)self _notifyDidLoadIconForHost:v6];
}

- (void)siteMetadataImageCacheDidFinishLoadingSettings:(id)a3
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__WBSTemplateIconCache_siteMetadataImageCacheDidFinishLoadingSettings___block_invoke;
  block[3] = &unk_1E5E408C0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __71__WBSTemplateIconCache_siteMetadataImageCacheDidFinishLoadingSettings___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  [*(id *)(a1 + 32) _upgradeCacheVersionIfNeeded];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) settingForKey:@"TemplateIcons"];
  id v3 = (void *)v2;
  id v4 = (void *)MEMORY[0x1E4F1CC08];
  if (v2) {
    id v4 = (void *)v2;
  }
  id v5 = v4;

  uint64_t v6 = [v5 mutableCopy];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = *(id *)(*(void *)(a1 + 32) + 56);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v5, "objectForKeyedSubscript:", v13, (void)v20);
        int v15 = objc_msgSend(v14, "safari_BOOLForKey:", @"TemplateIconInCache");
        id v16 = *(void **)(*(void *)(a1 + 32) + 24);
        if (v15)
        {
          id v17 = (id)[v16 imageForKeyString:v13 getImageState:0];
        }
        else
        {
          [v16 setImageState:1 forKeyString:v13];
          [*(id *)(a1 + 32) _notifyImageWasLoaded:0 forHost:v13];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(void **)(v18 + 56);
  *(void *)(v18 + 56) = 0;
}

- (void)siteMetadataImageCache:(id)a3 didFinishLoadingImage:(id)a4 forKeyString:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__WBSTemplateIconCache_siteMetadataImageCache_didFinishLoadingImage_forKeyString___block_invoke;
  block[3] = &unk_1E5E40820;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(internalQueue, block);
}

uint64_t __82__WBSTemplateIconCache_siteMetadataImageCache_didFinishLoadingImage_forKeyString___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyImageWasLoaded:*(void *)(a1 + 40) forHost:*(void *)(a1 + 48)];
}

- (void)siteMetadataImageCache:(id)a3 didRemoveImageFromCacheForKeyString:(id)a4
{
  id v5 = a4;
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__WBSTemplateIconCache_siteMetadataImageCache_didRemoveImageFromCacheForKeyString___block_invoke;
  v8[3] = &unk_1E5E407D0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(internalQueue, v8);
}

uint64_t __83__WBSTemplateIconCache_siteMetadataImageCache_didRemoveImageFromCacheForKeyString___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeTemplateIconsDataForHost:*(void *)(a1 + 40) ifIconIsInCache:0];
}

- (void)siteMetadataImageCacheDidEmptyCache:(id)a3
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__WBSTemplateIconCache_siteMetadataImageCacheDidEmptyCache___block_invoke;
  block[3] = &unk_1E5E408C0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __60__WBSTemplateIconCache_siteMetadataImageCacheDidEmptyCache___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v7 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setImageState:forKeyString:", 1, v6, (void)v7);
        [*(id *)(a1 + 32) _notifyImageWasLoaded:0 forHost:v6];
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (WBSSiteMetadataProviderDelegate)providerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
  return (WBSSiteMetadataProviderDelegate *)WeakRetained;
}

- (void)setProviderDelegate:(id)a3
{
}

- (CGSize)defaultIconSize
{
  double width = self->_defaultIconSize.width;
  double height = self->_defaultIconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDefaultIconSize:(CGSize)a3
{
  self->_defaultIconSize = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_providerDelegate);
  objc_storeStrong((id *)&self->_requestsToResponses, 0);
  objc_storeStrong((id *)&self->_requestsToDelayedResponses, 0);
  objc_storeStrong((id *)&self->_pendingSVGImageRenderingRequestsThatCanBeSavedToDisk, 0);
  objc_storeStrong((id *)&self->_pendingSVGImageRenderingRequests, 0);
  objc_storeStrong((id *)&self->_pendingTemplateIconFallbackRequestHosts, 0);
  objc_storeStrong((id *)&self->_pendingTemplateIconRequestHosts, 0);
  objc_storeStrong((id *)&self->_hostsToRequestSets, 0);
  objc_storeStrong((id *)&self->_templateIconsDataForHosts, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end