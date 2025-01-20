@interface WBSTouchIconCache
+ (UIColor)defaultBackgroundColor;
+ (UIColor)defaultGlyphColor;
+ (UIImage)_generateDefaultFavoritesIcon;
+ (WBSTemplateIconMonogramConfiguration)_monogramConfiguration;
+ (id)_generateFavoritesIconForRequest:(id)a3 withBackgroundColor:(id)a4;
+ (id)generateFavoritesIconForTitle:(id)a3 url:(id)a4 backgroundColor:(id)a5;
+ (id)generateFavoritesIconForTitle:(id)a3 url:(id)a4 backgroundColor:(id)a5 shouldRemoveGrammaticalArticles:(BOOL)a6;
+ (id)generateFavoritesIconForTitle:(id)a3 url:(id)a4 backgroundColor:(id)a5 shouldRemoveGrammaticalArticles:(BOOL)a6 fontWeight:(int64_t)a7 fontDesign:(int64_t)a8 fontSize:(double)a9;
- (BOOL)_canFetchTouchIconForURL:(id)a3 inUserLoadedWebpage:(BOOL)a4;
- (BOOL)_shouldGenerateTouchIconFromTouchIcon:(id)a3 forRequest:(id)a4;
- (BOOL)_shouldRequestTouchIconForURL:(id)a3 inUserLoadedWebpage:(BOOL)a4 initiatedFromBookmarkInteraction:(BOOL)a5;
- (BOOL)_shouldRequestTouchIconForURL:(id)a3 inUserLoadedWebpage:(BOOL)a4 initiatedFromBookmarkInteraction:(BOOL)a5 knownImageState:(int64_t)a6;
- (BOOL)_shouldRequestTouchIconForURL:(id)a3 inUserLoadedWebpage:(BOOL)a4 initiatedFromBookmarkInteraction:(BOOL)a5 shouldCheckImageState:(BOOL *)a6;
- (BOOL)_shouldRequestTouchIconWithTimeoutForURL:(id)a3 inUserLoadedWebpage:(BOOL)a4 initiatedFromBookmarkInteraction:(BOOL)a5;
- (BOOL)allowFetchingOverCellularNetwork;
- (BOOL)canFetchOutsideOfUserLoadedWebpage;
- (BOOL)canHandleRequest:(id)a3;
- (BOOL)hasDeterminedIconAvailabilityForURL:(id)a3;
- (BOOL)isReadOnly;
- (BOOL)shouldRequestTouchIconForURL:(id)a3 inUserLoadedWebpage:(BOOL)a4;
- (BOOL)shouldRequestTouchIconForWebPageNavigationFromBookmarkInteractionForURL:(id)a3;
- (NSDictionary)uuidStringToHost;
- (NSURL)cacheDirectoryURL;
- (NSURL)imageDirectoryURL;
- (WBSSiteMetadataProviderDelegate)providerDelegate;
- (WBSTouchIconCache)init;
- (WBSTouchIconCache)initWithCacheDirectoryURL:(id)a3;
- (WBSTouchIconCache)initWithCacheDirectoryURL:(id)a3 isReadOnly:(BOOL)a4;
- (WBSTouchIconCache)initWithCacheDirectoryURL:(id)a3 isReadOnly:(BOOL)a4 protectionType:(int64_t)a5 allowFetchingOverCellularNetwork:(BOOL)a6 fileMappingStyle:(int64_t)a7 canFetchOutsideOfUserLoadedWebpage:(BOOL)a8;
- (double)_maximumScreenScale;
- (id).cxx_construct;
- (id)_didGenerateResponse:(id)a3 forRequest:(id)a4;
- (id)_imageCacheSettingsDatabaseURL;
- (id)_operationWithRequest:(id)a3 completionHandler:(id)a4;
- (id)_resizedImage:(id)a3 forHost:(id)a4;
- (id)_responseForRequest:(id)a3 withTouchIcon:(id)a4;
- (id)_responseForTouchIconRequestWithNoHost:(id)a3;
- (id)_touchIconForURL:(id)a3 getImageState:(int64_t *)a4;
- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4;
- (id)siteMetadataImageCache:(id)a3 customFileNameForKeyString:(id)a4;
- (int64_t)_transparencyAnalysisResultForImage:(id)a3;
- (int64_t)fileMappingStyle;
- (int64_t)protectionType;
- (void)_didLoadTouchIcon:(id)a3 withCacheSettingsEntry:(id)a4;
- (void)_ensureCacheDirectory;
- (void)_enumerateRequestsForHost:(id)a3 usingBlock:(id)a4;
- (void)_notifyImageWasLoaded:(id)a3 forHost:(id)a4;
- (void)_openCacheSettingsDatabaseIfNeeded;
- (void)_removeTouchIconsDataForHost:(id)a3;
- (void)_removeTouchIconsDataForHost:(id)a3 ifIconIsInCache:(BOOL)a4;
- (void)_saveTouchIconToDisk:(id)a3 forHost:(id)a4 requestDidSucceed:(BOOL)a5 statusCode:(int64_t)a6 isUserLoadedWebpageRequest:(BOOL)a7 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a8;
- (void)_saveTouchIconToDiskWithResult:(id)a3 forRequest:(id)a4 knownImageState:(int64_t)a5;
- (void)_setUpAndReturnDelayedResponseForRequest:(id)a3;
- (void)_setUpAndReturnPreparedResponseForRequest:(id)a3 withImage:(id)a4 imageState:(int64_t)a5 didReceiveNewData:(BOOL)a6;
- (void)_setUpImageCacheSettingsSQLiteStore;
- (void)_updateTouchIconsDataForHost:(id)a3 image:(id)a4 requestDidSucceed:(BOOL)a5 statusCode:(int64_t)a6 isUserLoadedWebpageRequest:(BOOL)a7 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a8 UUIDString:(id)a9;
- (void)cacheFirstAvailableTouchIcon:(id)a3 forURL:(id)a4;
- (void)dealloc;
- (void)emptyCaches;
- (void)performMaintenanceWork;
- (void)prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4;
- (void)purgeUnneededCacheEntries;
- (void)releaseTouchIconForHost:(id)a3;
- (void)releaseTouchIconForURLString:(id)a3;
- (void)releaseTouchIconsForHosts:(id)a3;
- (void)removeTouchIconMetadataForHosts:(id)a3 completionHandler:(id)a4;
- (void)retainTouchIconForHost:(id)a3;
- (void)retainTouchIconForURLString:(id)a3;
- (void)retainTouchIconsForHosts:(id)a3;
- (void)savePendingChangesBeforeTermination;
- (void)saveTouchIconSettings:(id)a3 touchIcon:(id)a4;
- (void)setProviderDelegate:(id)a3;
- (void)siteMetadataImageCache:(id)a3 didFinishLoadingImage:(id)a4 forKeyString:(id)a5;
- (void)siteMetadataImageCache:(id)a3 didRemoveImageFromCacheForKeyString:(id)a4;
- (void)siteMetadataImageCacheDidEmptyCache:(id)a3;
- (void)stopWatchingUpdatesForRequest:(id)a3;
- (void)webViewMetadataFetchOperation:(id)a3 didFinishUsingWebView:(id)a4;
- (void)webViewMetadataFetchOperation:(id)a3 getWebViewOfSize:(CGSize)a4 withConfiguration:(id)a5 completionHandler:(id)a6;
@end

@implementation WBSTouchIconCache

void __102__WBSTouchIconCache__setUpAndReturnPreparedResponseForRequest_withImage_imageState_didReceiveNewData___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) url];
    if (*(unsigned char *)(*(void *)(a1 + 40) + 98)) {
      v4 = @"YES";
    }
    else {
      v4 = @"NO";
    }
    v5 = v4;
    int v6 = 141558531;
    uint64_t v7 = 1752392040;
    __int16 v8 = 2117;
    v9 = v3;
    __int16 v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_DEFAULT, "Determining Touch Icon request eligibility for URL: %{sensitive, mask.hash}@, _canFetchOutsideOfUserLoadedWebpage: %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)_setUpAndReturnPreparedResponseForRequest:(id)a3 withImage:(id)a4 imageState:(int64_t)a5 didReceiveNewData:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  v30 = v11;
  uint64_t v12 = [(NSCache *)self->_requestsToResponses objectForKey:v10];
  if (v12) {
    BOOL v13 = !v6;
  }
  else {
    BOOL v13 = 0;
  }
  if (!v13)
  {
    uint64_t v14 = [(WBSTouchIconCache *)self _responseForRequest:v10 withTouchIcon:v11];

    [(NSCache *)self->_requestsToResponses setObject:v14 forKey:v10];
    uint64_t v12 = (void *)v14;
    [(NSMutableDictionary *)self->_requestsToDelayedResponses removeObjectForKey:v10];
  }
  v15 = [v10 activity];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__WBSTouchIconCache__setUpAndReturnPreparedResponseForRequest_withImage_imageState_didReceiveNewData___block_invoke;
  block[3] = &unk_1E5E407D0;
  id v16 = v10;
  id v34 = v16;
  v35 = self;
  os_activity_apply(v15, block);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
  if (([v16 options] & 2) != 0
    && ([v16 url],
        v18 = objc_claimAutoreleasedReturnValue(),
        BOOL v19 = [(WBSTouchIconCache *)self _shouldRequestTouchIconForURL:v18 inUserLoadedWebpage:0 initiatedFromBookmarkInteraction:0 knownImageState:a5], v18, v19))
  {
    v20 = [(WBSTouchIconCache *)self _blockOperationForRequest:v16 knownImageState:a5];
    [WeakRetained siteMetadataProvider:self didReceiveResponse:v12 forRequest:v16 beginOperationUsingBlock:v20];
  }
  else
  {
    v21 = [v16 activity];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __102__WBSTouchIconCache__setUpAndReturnPreparedResponseForRequest_withImage_imageState_didReceiveNewData___block_invoke_30;
    v31[3] = &unk_1E5E408C0;
    id v22 = WeakRetained;
    id v32 = v22;
    os_activity_apply(v21, v31);

    touchIconsDataForHosts = self->_touchIconsDataForHosts;
    v24 = [v16 url];
    v25 = [v24 host];
    v26 = [(NSMutableDictionary *)touchIconsDataForHosts objectForKeyedSubscript:v25];

    uint64_t v27 = [v26 lastResponseStatusCode];
    if (v27 > 399 || (v27 & 0xFFFFFFFFFFFFFFFELL) == 0xCC)
    {
      v28 = [v26 lastRequestDate];
      v29 = [v28 dateByAddingTimeInterval:604800.0];
      [v12 setNextIconDownloadRetryDate:v29];
    }
    else
    {
      v28 = [v26 lastRequestDate];
      v29 = [v28 dateByAddingTimeInterval:3600.0];
      [v12 setNextIconDownloadRetryDate:v29];
    }

    [v22 siteMetadataProvider:self didReceiveResponse:v12 ofType:0 didReceiveNewData:v6 forRequest:v16];
    v20 = v32;
  }
}

- (BOOL)_shouldRequestTouchIconForURL:(id)a3 inUserLoadedWebpage:(BOOL)a4 initiatedFromBookmarkInteraction:(BOOL)a5 knownImageState:(int64_t)a6
{
  char v8 = 0;
  BOOL result = [(WBSTouchIconCache *)self _shouldRequestTouchIconForURL:a3 inUserLoadedWebpage:a4 initiatedFromBookmarkInteraction:a5 shouldCheckImageState:&v8];
  if (v8) {
    return a6 == 1;
  }
  return result;
}

- (BOOL)_shouldRequestTouchIconForURL:(id)a3 inUserLoadedWebpage:(BOOL)a4 initiatedFromBookmarkInteraction:(BOOL)a5 shouldCheckImageState:(BOOL *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  *a6 = 0;
  if ([(WBSTouchIconCache *)self _canFetchTouchIconForURL:v10 inUserLoadedWebpage:v8])
  {
    id v11 = [v10 host];
    os_unfair_lock_lock(&self->_touchIconsDataForHostsAccessLock);
    uint64_t v12 = [(NSMutableDictionary *)self->_touchIconsDataForHosts objectForKeyedSubscript:v11];
    os_unfair_lock_unlock(&self->_touchIconsDataForHostsAccessLock);
    if (v12)
    {
      if (v8 || self->_canFetchOutsideOfUserLoadedWebpage)
      {
        int v13 = [v12 requestDidSucceed];
        if (v13 && ![v12 higherPriorityIconDownloadFailedDueToNetworkError])
        {
          if (([v12 lastRequestWasInUserLoadedWebpage] & 1) == 0
            && !self->_canFetchOutsideOfUserLoadedWebpage)
          {
            BOOL v15 = 1;
            goto LABEL_20;
          }
          id v16 = [v12 lastRequestDate];
          [v16 timeIntervalSinceNow];
          double v18 = -345600.0;
        }
        else
        {
          uint64_t v14 = [v12 lastResponseStatusCode];
          if (v14 > 399 || (v14 & 0xFFFFFFFFFFFFFFFELL) == 0xCC)
          {
            id v16 = [v12 lastRequestDate];
            [v16 timeIntervalSinceNow];
            double v18 = -604800.0;
          }
          else
          {
            BOOL v15 = 1;
            if (a5 || ((v13 ^ 1) & 1) != 0) {
              goto LABEL_20;
            }
            id v16 = [v12 lastRequestDate];
            [v16 timeIntervalSinceNow];
            double v18 = -3600.0;
          }
        }
        BOOL v15 = v17 < v18;
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
      *a6 = 1;
    }
LABEL_20:

    goto LABEL_21;
  }
  BOOL v15 = 0;
LABEL_21:

  return v15;
}

- (BOOL)_canFetchTouchIconForURL:(id)a3 inUserLoadedWebpage:(BOOL)a4
{
  id v5 = a3;
  BOOL v6 = v5;
  if (!self->_readOnly && (unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_didLoadSettings), (v7 & 1) != 0))
  {
    id v10 = [v5 host];
    BOOL v8 = [v10 length] != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __51__WBSTouchIconCache__notifyImageWasLoaded_forHost___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldGenerateTouchIconFromTouchIcon:forRequest:", *(void *)(a1 + 40)) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
    v3 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:*(void *)(a1 + 48)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
    [*(id *)(a1 + 32) _didLoadTouchIcon:*(void *)(a1 + 40) withCacheSettingsEntry:v3];
  }
  [*(id *)(a1 + 32) _setUpAndReturnPreparedResponseForRequest:v4 withImage:*(void *)(a1 + 40) imageState:*(void *)(a1 + 56) didReceiveNewData:1];
}

- (id)_responseForRequest:(id)a3 withTouchIcon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WBSTouchIconCache *)self _shouldGenerateTouchIconFromTouchIcon:v7 forRequest:v6])
  {
    BOOL v8 = +[WBSSiteIconKeyColorExtractor keyColorForIcon:v7];
    if (!v8)
    {
      v9 = [v6 monogramConfiguration];
      id v10 = [v9 backgroundColor];
      id v11 = v10;
      if (v10)
      {
        id v12 = v10;
      }
      else
      {
        id v12 = [(id)objc_opt_class() defaultBackgroundColor];
      }
      BOOL v8 = v12;
    }
    id v16 = [(id)objc_opt_class() _generateFavoritesIconForRequest:v6 withBackgroundColor:v8];
    double v17 = [v6 url];
    double v18 = +[WBSTouchIconResponse responseWithURL:v17 touchIcon:v16 generated:1 extractedBackgroundColor:v8];

    BOOL v19 = [v6 activity];
    os_activity_apply(v19, &__block_literal_global_49);

    BOOL v15 = [(WBSTouchIconCache *)self _didGenerateResponse:v18 forRequest:v6];
  }
  else
  {
    int v13 = [v6 activity];
    os_activity_apply(v13, &__block_literal_global_45_0);

    uint64_t v14 = [v6 url];
    BOOL v8 = +[WBSTouchIconResponse responseWithURL:v14 touchIcon:v7 generated:0 extractedBackgroundColor:0];

    BOOL v15 = [(WBSTouchIconCache *)self _didGenerateResponse:v8 forRequest:v6];
  }

  return v15;
}

- (BOOL)_shouldGenerateTouchIconFromTouchIcon:(id)a3 forRequest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && ([v6 minimumIconSize], v9 = v8, double v11 = v10, objc_msgSend(v5, "size"), v12 >= v9))
  {
    [v5 size];
    BOOL v13 = v14 < v11;
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (id)_didGenerateResponse:(id)a3 forRequest:(id)a4
{
  id v4 = a3;
  return v4;
}

- (void)_setUpAndReturnDelayedResponseForRequest:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
  id v5 = [(NSMutableDictionary *)self->_requestsToDelayedResponses objectForKeyedSubscript:v9];
  if (!v5)
  {
    id v6 = [v9 activity];
    os_activity_apply(v6, &__block_literal_global_47);

    id v7 = [v9 url];
    double v8 = [(WBSTouchIconCache *)self _touchIconForURL:v7 getImageState:0];
    id v5 = [(WBSTouchIconCache *)self _responseForRequest:v9 withTouchIcon:v8];

    [(NSMutableDictionary *)self->_requestsToDelayedResponses setObject:v5 forKeyedSubscript:v9];
  }
  [WeakRetained siteMetadataProvider:self didReceiveResponse:v5 ofType:1 didReceiveNewData:0 forRequest:v9];
}

void __68__WBSTouchIconCache_prepareResponseForRequest_allowDelayedResponse___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) url];
  v3 = [v2 host];
  uint64_t v4 = [v3 length];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v4)
  {
    id WeakRetained = [*(id *)(v5 + 32) objectForKeyedSubscript:v3];
    if (!WeakRetained)
    {
      id WeakRetained = [MEMORY[0x1E4F1CA80] set];
      objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "setObject:forKeyedSubscript:");
    }
    [WeakRetained addObject:*(void *)(a1 + 32)];
    uint64_t v9 = 0;
    id v7 = [*(id *)(a1 + 40) _touchIconForURL:v2 getImageState:&v9];
    if (v7 || v9)
    {
      [*(id *)(a1 + 40) _setUpAndReturnPreparedResponseForRequest:*(void *)(a1 + 32) withImage:v7 imageState:v9 didReceiveNewData:1];
    }
    else if (*(unsigned char *)(a1 + 48))
    {
      [*(id *)(a1 + 40) _setUpAndReturnDelayedResponseForRequest:*(void *)(a1 + 32)];
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 104));
    double v8 = *(void **)(a1 + 40);
    id v7 = [v8 _responseForTouchIconRequestWithNoHost:*(void *)(a1 + 32)];
    [WeakRetained siteMetadataProvider:v8 didReceiveResponse:v7 ofType:0 didReceiveNewData:0 forRequest:*(void *)(a1 + 32)];
  }
}

- (id)_touchIconForURL:(id)a3 getImageState:(int64_t *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4) {
    *a4 = 2;
  }
  double v8 = [v6 host];
  if (![v8 length])
  {
LABEL_7:
    double v10 = 0;
    goto LABEL_14;
  }
  unsigned __int8 v9 = atomic_load((unsigned __int8 *)&self->_didLoadSettings);
  if ((v9 & 1) == 0)
  {
    [(NSMutableSet *)self->_pendingTouchIconRequestHosts addObject:v8];
    if (a4)
    {
      double v10 = 0;
      *a4 = 0;
      goto LABEL_14;
    }
    goto LABEL_7;
  }
  os_unfair_lock_lock(&self->_touchIconsDataForHostsAccessLock);
  double v11 = [(NSMutableDictionary *)self->_touchIconsDataForHosts objectForKeyedSubscript:v8];
  os_unfair_lock_unlock(&self->_touchIconsDataForHostsAccessLock);
  if ([v11 isIconInCache])
  {
    double v10 = [(WBSSiteMetadataImageCache *)self->_imageCache imageForKeyString:v8 getImageState:a4];
    [(WBSTouchIconCache *)self _didLoadTouchIcon:v10 withCacheSettingsEntry:v11];
  }
  else
  {
    if (a4) {
      *a4 = 1;
    }
    [(WBSSiteMetadataImageCache *)self->_imageCache setImageState:1 forKeyString:v8];
    double v10 = 0;
  }

LABEL_14:
  return v10;
}

- (void)siteMetadataImageCache:(id)a3 didFinishLoadingImage:(id)a4 forKeyString:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__WBSTouchIconCache_siteMetadataImageCache_didFinishLoadingImage_forKeyString___block_invoke;
  block[3] = &unk_1E5E40820;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(internalQueue, block);
}

+ (id)_generateFavoritesIconForRequest:(id)a3 withBackgroundColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 options])
  {
    unsigned __int8 v9 = [v6 monogramConfiguration];

    [v6 monogramTitle];
    if (v9) {
      id v10 = {;
    }
      id v11 = [v6 url];
      double v12 = [v6 monogramConfiguration];
      uint64_t v13 = [v12 fontWeight];
      id v14 = [v6 monogramConfiguration];
      uint64_t v15 = [v14 fontDesign];
      id v16 = [v6 monogramConfiguration];
      [v16 fontSize];
      id v8 = objc_msgSend(a1, "generateFavoritesIconForTitle:url:backgroundColor:shouldRemoveGrammaticalArticles:fontWeight:fontDesign:fontSize:", v10, v11, v7, 0, v13, v15);
    }
    else {
      id v10 = {;
    }
      id v11 = [v6 url];
      id v8 = [a1 generateFavoritesIconForTitle:v10 url:v11 backgroundColor:v7];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __79__WBSTouchIconCache_siteMetadataImageCache_didFinishLoadingImage_forKeyString___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyImageWasLoaded:*(void *)(a1 + 40) forHost:*(void *)(a1 + 48)];
}

uint64_t __158__WBSTouchIconCache_initWithCacheDirectoryURL_isReadOnly_protectionType_allowFetchingOverCellularNetwork_fileMappingStyle_canFetchOutsideOfUserLoadedWebpage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setUpImageCacheSettingsSQLiteStore];
}

- (id).cxx_construct
{
  *((unsigned char *)self + 16) = 0;
  return self;
}

- (void)setProviderDelegate:(id)a3
{
}

- (void)_didLoadTouchIcon:(id)a3 withCacheSettingsEntry:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v6 transparencyAnalysisResult];
  uint64_t v8 = v7;
  if (v7 >= 6)
  {
    unsigned __int8 v9 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[WBSTouchIconCache _didLoadTouchIcon:withCacheSettingsEntry:](v8, v9);
    }
  }
  else if (v7)
  {
    objc_msgSend(v5, "safari_setTransparencyAnalysisResult:", v7);
  }
}

- (BOOL)canHandleRequest:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __62__WBSTouchIconCache__setUpAndReturnDelayedResponseForRequest___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1ABB70000, v0, OS_LOG_TYPE_DEFAULT, "Preparing delayed response for request", v1, 2u);
  }
}

void __55__WBSTouchIconCache__responseForRequest_withTouchIcon___block_invoke_47()
{
  v0 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1ABB70000, v0, OS_LOG_TYPE_DEFAULT, "Generated an icon to satisfy the request", v1, 2u);
  }
}

void __55__WBSTouchIconCache__responseForRequest_withTouchIcon___block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1ABB70000, v0, OS_LOG_TYPE_DEFAULT, "Declining to generate an icon to satisfy the request", v1, 2u);
  }
}

void __102__WBSTouchIconCache__setUpAndReturnPreparedResponseForRequest_withImage_imageState_didReceiveNewData___block_invoke_30(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_DEFAULT, "Will not attempt to request an icon; returning successful response to %@",
      (uint8_t *)&v4,
      0xCu);
  }
}

- (void)prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4
{
  id v6 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__WBSTouchIconCache_prepareResponseForRequest_allowDelayedResponse___block_invoke;
  block[3] = &unk_1E5E44D18;
  id v10 = v6;
  id v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async(internalQueue, block);
}

- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4
{
  id v6 = a3;
  unint64_t v7 = [v6 url];
  id v8 = v6;
  unsigned __int8 v9 = [v7 host];
  if ([v9 length])
  {
    *a4 = 1;
    id v10 = [(NSCache *)self->_requestsToResponses objectForKey:v8];
    if (v10)
    {
      if ([(WBSTouchIconCache *)self _canFetchTouchIconForURL:v7 inUserLoadedWebpage:0])
      {
        p_touchIconsDataForHostsAccessLock = &self->_touchIconsDataForHostsAccessLock;
        os_unfair_lock_lock(&self->_touchIconsDataForHostsAccessLock);
        BOOL v12 = [(NSMutableDictionary *)self->_touchIconsDataForHosts objectForKeyedSubscript:v9];

        os_unfair_lock_unlock(p_touchIconsDataForHostsAccessLock);
        [v8 activity];
        if (v12) {
          uint64_t v13 = {;
        }
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __59__WBSTouchIconCache_responseForRequest_willProvideUpdates___block_invoke_28;
          block[3] = &unk_1E5E407D0;
          id v14 = v10;
          id v19 = v14;
          id v20 = v7;
          os_activity_apply(v13, block);

          id v10 = v19;
        }
        else {
          id v16 = {;
        }
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __59__WBSTouchIconCache_responseForRequest_willProvideUpdates___block_invoke_27;
          v21[3] = &unk_1E5E408C0;
          id v22 = v7;
          os_activity_apply(v16, v21);

          id v14 = 0;
        }
      }
      else
      {
        uint64_t v15 = [v8 activity];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __59__WBSTouchIconCache_responseForRequest_willProvideUpdates___block_invoke;
        v23[3] = &unk_1E5E407D0;
        id v14 = v10;
        id v24 = v14;
        id v25 = v7;
        os_activity_apply(v15, v23);

        id v10 = v24;
      }
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    *a4 = 0;
    id v14 = [(WBSTouchIconCache *)self _responseForTouchIconRequestWithNoHost:v8];
  }

  return v14;
}

- (void)_setUpImageCacheSettingsSQLiteStore
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  [(WBSTouchIconCache *)self _ensureCacheDirectory];
  [(WBSTouchIconCache *)self _openCacheSettingsDatabaseIfNeeded];
  id v24 = [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self->_cacheSettingsStore allEntries];
  if (self->_cacheSettingsStore && ![v24 count]) {
    [(WBSSiteMetadataImageCache *)self->_imageCache removeAllImages];
  }
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v24);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v25;
  uint64_t v4 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v36 != v5) {
          objc_enumerationMutation(obj);
        }
        unint64_t v7 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v8 = [v7 host];
        [v3 setObject:v7 forKeyedSubscript:v8];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v4);
  }

  os_unfair_lock_lock(&self->_touchIconsDataForHostsAccessLock);
  objc_storeStrong((id *)&self->_touchIconsDataForHosts, v3);
  os_unfair_lock_unlock(&self->_touchIconsDataForHostsAccessLock);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  unsigned __int8 v9 = self->_pendingSaveTouchIconToDiskBlocks;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v31 + 1) + 8 * j) + 16))();
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v10);
  }

  pendingSaveTouchIconToDiskBlocks = self->_pendingSaveTouchIconToDiskBlocks;
  self->_pendingSaveTouchIconToDiskBlocks = 0;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v14 = self->_pendingTouchIconRequestHosts;
  uint64_t v15 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t k = 0; k != v15; ++k)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * k);
        os_unfair_lock_lock(&self->_touchIconsDataForHostsAccessLock);
        id v19 = [(NSMutableDictionary *)self->_touchIconsDataForHosts objectForKeyedSubscript:v18];
        os_unfair_lock_unlock(&self->_touchIconsDataForHostsAccessLock);
        int v20 = [v19 isIconInCache];
        imageCache = self->_imageCache;
        if (v20)
        {
          id v22 = [(WBSSiteMetadataImageCache *)imageCache imageForKeyString:v18 getImageState:0];
        }
        else
        {
          [(WBSSiteMetadataImageCache *)imageCache setImageState:1 forKeyString:v18];
          [(WBSTouchIconCache *)self _notifyImageWasLoaded:0 forHost:v18];
        }
      }
      uint64_t v15 = [(NSMutableSet *)v14 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v15);
  }

  pendingTouchIconRequestHosts = self->_pendingTouchIconRequestHosts;
  self->_pendingTouchIconRequestHosts = 0;

  atomic_store(1u, (unsigned __int8 *)&self->_didLoadSettings);
}

- (void)_openCacheSettingsDatabaseIfNeeded
{
  if (!self->_cacheSettingsStore)
  {
    uint64_t v3 = [WBSTouchIconCacheSettingsSQLiteStore alloc];
    id v6 = [(WBSTouchIconCache *)self _imageCacheSettingsDatabaseURL];
    uint64_t v4 = -[WBSSiteMetadataImageCacheSettingsSQLiteStore initWithDatabaseURL:protectionType:](v3, "initWithDatabaseURL:protectionType:");
    cacheSettingsStore = self->_cacheSettingsStore;
    self->_cacheSettingsStore = v4;
  }
}

- (id)_imageCacheSettingsDatabaseURL
{
  v2 = [(WBSTouchIconCache *)self cacheDirectoryURL];
  if (v2)
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_DEFAULT, "Using on-disk database for Icon Fetching.", v8, 2u);
    }
    uint64_t v4 = [v2 URLByAppendingPathComponent:@"TouchIconCacheSettings.db" isDirectory:0];
  }
  else
  {
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB70000, v5, OS_LOG_TYPE_DEFAULT, "Using in-memory database for Icon Fetching.", buf, 2u);
    }
    uint64_t v4 = [MEMORY[0x1E4F983C0] inMemoryDatabaseURL];
  }
  id v6 = (void *)v4;

  return v6;
}

- (NSURL)cacheDirectoryURL
{
  return self->_cacheDirectoryURL;
}

- (void)_ensureCacheDirectory
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Error \"%{public}@\" trying to create image cache folder.", buf, 0xCu);
}

- (void)_notifyImageWasLoaded:(id)a3 forHost:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = 2;
  }
  else
  {
    uint64_t v8 = 1;
    [(WBSTouchIconCache *)self _removeTouchIconsDataForHost:v7 ifIconIsInCache:1];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__WBSTouchIconCache__notifyImageWasLoaded_forHost___block_invoke;
  v11[3] = &unk_1E5E453E0;
  v11[4] = self;
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  uint64_t v14 = v8;
  [(WBSTouchIconCache *)self _enumerateRequestsForHost:v10 usingBlock:v11];
}

- (void)_enumerateRequestsForHost:(id)a3 usingBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void))a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_hostsToRequestSets, "objectForKeyedSubscript:", a3, 0);
  uint64_t v8 = (void *)[v7 copy];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        v6[2](v6, *(void *)(*((void *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (WBSTouchIconCache)initWithCacheDirectoryURL:(id)a3 isReadOnly:(BOOL)a4
{
  return [(WBSTouchIconCache *)self initWithCacheDirectoryURL:a3 isReadOnly:a4 protectionType:0 allowFetchingOverCellularNetwork:1 fileMappingStyle:0 canFetchOutsideOfUserLoadedWebpage:0];
}

- (id)siteMetadataImageCache:(id)a3 customFileNameForKeyString:(id)a4
{
  id v5 = a4;
  if (self->_fileMappingStyle == 1)
  {
    os_unfair_lock_lock(&self->_touchIconsDataForHostsAccessLock);
    id v6 = [(NSMutableDictionary *)self->_touchIconsDataForHosts objectForKeyedSubscript:v5];
    os_unfair_lock_unlock(&self->_touchIconsDataForHostsAccessLock);
    if (!v6)
    {
      id v6 = [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self->_cacheSettingsStore entryWithHost:v5];
    }
    id v7 = [v6 UUIDString];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (WBSTouchIconCache)initWithCacheDirectoryURL:(id)a3 isReadOnly:(BOOL)a4 protectionType:(int64_t)a5 allowFetchingOverCellularNetwork:(BOOL)a6 fileMappingStyle:(int64_t)a7 canFetchOutsideOfUserLoadedWebpage:(BOOL)a8
{
  id v15 = a3;
  v47.receiver = self;
  v47.super_class = (Class)WBSTouchIconCache;
  uint64_t v16 = [(WBSTouchIconCache *)&v47 init];
  uint64_t v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_cacheDirectoryURL, a3);
    v17->_readOnly = a4;
    uint64_t v18 = NSString;
    id v19 = (objc_class *)objc_opt_class();
    int v20 = NSStringFromClass(v19);
    id v21 = [v18 stringWithFormat:@"com.apple.Safari.%@.%p.internalQueue", v20, v17];
    id v22 = (const char *)[v21 UTF8String];
    v23 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v24 = dispatch_queue_create(v22, v23);
    internalQueue = v17->_internalQueue;
    v17->_internalQueue = (OS_dispatch_queue *)v24;

    v17->_touchIconsDataForHostsAccessLock._os_unfair_lock_opaque = 0;
    uint64_t v26 = [MEMORY[0x1E4F1CA60] dictionary];
    hostsToRequestSets = v17->_hostsToRequestSets;
    v17->_hostsToRequestSets = (NSMutableDictionary *)v26;

    uint64_t v28 = [MEMORY[0x1E4F1CA48] array];
    pendingSaveTouchIconToDiskBlocks = v17->_pendingSaveTouchIconToDiskBlocks;
    v17->_pendingSaveTouchIconToDiskBlocks = (NSMutableArray *)v28;

    uint64_t v30 = [MEMORY[0x1E4F1CA80] set];
    pendingTouchIconRequestHosts = v17->_pendingTouchIconRequestHosts;
    v17->_pendingTouchIconRequestHosts = (NSMutableSet *)v30;

    long long v32 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    requestsToResponses = v17->_requestsToResponses;
    v17->_requestsToResponses = v32;

    uint64_t v34 = [MEMORY[0x1E4F1CA60] dictionary];
    requestsToDelayedResponses = v17->_requestsToDelayedResponses;
    v17->_requestsToDelayedResponses = (NSMutableDictionary *)v34;

    v17->_allowFetchingOverCellularNetworuint64_t k = a6;
    v17->_protectionType = a5;
    v17->_fileMappingStyle = a7;
    v17->_canFetchOutsideOfUserLoadedWebpage = a8;
    long long v36 = [WBSSiteMetadataImageCache alloc];
    long long v37 = [v15 URLByAppendingPathComponent:@"Images" isDirectory:1];
    if ((unint64_t)a5 > 2) {
      uint64_t v38 = 0x20000000;
    }
    else {
      uint64_t v38 = qword_1ABC5F938[a5];
    }
    uint64_t v39 = [(WBSSiteMetadataImageCache *)v36 initWithImageDirectoryURL:v37 imageType:0 fileProtectionOptions:v38];
    imageCache = v17->_imageCache;
    v17->_imageCache = (WBSSiteMetadataImageCache *)v39;

    [(WBSSiteMetadataImageCache *)v17->_imageCache setDelegate:v17];
    [(WBSSiteMetadataImageCache *)v17->_imageCache setUpImageCache];
    v41 = v17->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __158__WBSTouchIconCache_initWithCacheDirectoryURL_isReadOnly_protectionType_allowFetchingOverCellularNetwork_fileMappingStyle_canFetchOutsideOfUserLoadedWebpage___block_invoke;
    block[3] = &unk_1E5E408C0;
    uint64_t v42 = v17;
    v46 = v42;
    dispatch_async(v41, block);
    v43 = v42;
  }
  return v17;
}

+ (UIColor)defaultBackgroundColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] colorWithRed:0.576470588 green:0.584313725 blue:0.631372549 alpha:1.0];
}

+ (UIColor)defaultGlyphColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] whiteColor];
}

+ (id)generateFavoritesIconForTitle:(id)a3 url:(id)a4 backgroundColor:(id)a5
{
  id v5 = [a1 generateFavoritesIconForTitle:a3 url:a4 backgroundColor:a5 shouldRemoveGrammaticalArticles:1];
  return v5;
}

+ (id)generateFavoritesIconForTitle:(id)a3 url:(id)a4 backgroundColor:(id)a5 shouldRemoveGrammaticalArticles:(BOOL)a6
{
  id v6 = [a1 generateFavoritesIconForTitle:a3 url:a4 backgroundColor:a5 shouldRemoveGrammaticalArticles:a6 fontWeight:0 fontDesign:0 fontSize:0.0];
  return v6;
}

+ (id)generateFavoritesIconForTitle:(id)a3 url:(id)a4 backgroundColor:(id)a5 shouldRemoveGrammaticalArticles:(BOOL)a6 fontWeight:(int64_t)a7 fontDesign:(int64_t)a8 fontSize:(double)a9
{
  BOOL v12 = a6;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = [a1 _monogramConfiguration];
  [v19 setBackgroundColor:v18];
  [v19 setFontWeight:a7];
  [v19 setFontDesign:a8];
  if (a9 != 0.0) {
    [v19 setFontSize:a9];
  }
  int v20 = +[WBSTemplateIconMonogramGenerator monogramWithTitle:v16 url:v17 monogramConfiguration:v19 shouldRemoveGrammaticalArticles:v12];
  if (!v20)
  {
    int v20 = [a1 _generateDefaultFavoritesIcon];
  }

  return v20;
}

+ (UIImage)_generateDefaultFavoritesIcon
{
  return 0;
}

+ (WBSTemplateIconMonogramConfiguration)_monogramConfiguration
{
  v2 = [a1 defaultBackgroundColor];
  uint64_t v3 = +[WBSTemplateIconMonogramConfiguration configurationWithBackgroundColor:v2];

  return (WBSTemplateIconMonogramConfiguration *)v3;
}

- (WBSTouchIconCache)init
{
  return [(WBSTouchIconCache *)self initWithCacheDirectoryURL:0];
}

- (WBSTouchIconCache)initWithCacheDirectoryURL:(id)a3
{
  return [(WBSTouchIconCache *)self initWithCacheDirectoryURL:a3 isReadOnly:0];
}

- (void)dealloc
{
  [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self->_cacheSettingsStore close];
  v3.receiver = self;
  v3.super_class = (Class)WBSTouchIconCache;
  [(WBSTouchIconCache *)&v3 dealloc];
}

- (NSDictionary)uuidStringToHost
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  int v20 = __Block_byref_object_copy__27;
  id v21 = __Block_byref_object_dispose__27;
  id v22 = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__WBSTouchIconCache_uuidStringToHost__block_invoke;
  block[3] = &unk_1E5E44748;
  void block[4] = self;
  void block[5] = &v17;
  dispatch_sync(internalQueue, block);
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)v18[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "UUIDString", (void)v12);
        if (v9)
        {
          uint64_t v10 = [v8 host];
          [v3 setObject:v10 forKeyedSubscript:v9];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v23 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v17, 8);
  return (NSDictionary *)v3;
}

void __37__WBSTouchIconCache_uuidStringToHost__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _openCacheSettingsDatabaseIfNeeded];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 88) allEntries];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_saveTouchIconToDisk:(id)a3 forHost:(id)a4 requestDidSucceed:(BOOL)a5 statusCode:(int64_t)a6 isUserLoadedWebpageRequest:(BOOL)a7 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __156__WBSTouchIconCache__saveTouchIconToDisk_forHost_requestDidSucceed_statusCode_isUserLoadedWebpageRequest_higherPriorityIconDownloadFailedDueToNetworkError___block_invoke;
  v24[3] = &unk_1E5E452A0;
  v24[4] = self;
  id v16 = v14;
  id v25 = v16;
  id v17 = v15;
  BOOL v28 = a5;
  id v26 = v17;
  int64_t v27 = a6;
  BOOL v29 = a7;
  BOOL v30 = a8;
  id v18 = (void (**)(void))MEMORY[0x1AD115160](v24);
  uint64_t v19 = v18;
  unsigned __int8 v20 = atomic_load((unsigned __int8 *)&self->_didLoadSettings);
  if (v20)
  {
    v18[2](v18);
  }
  else
  {
    pendingSaveTouchIconToDiskBlocks = self->_pendingSaveTouchIconToDiskBlocks;
    id v22 = (void *)[v18 copy];
    v23 = (void *)MEMORY[0x1AD115160]();
    [(NSMutableArray *)pendingSaveTouchIconToDiskBlocks addObject:v23];
  }
}

void __156__WBSTouchIconCache__saveTouchIconToDisk_forHost_requestDidSucceed_statusCode_isUserLoadedWebpageRequest_higherPriorityIconDownloadFailedDueToNetworkError___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  uint64_t v3 = [*(id *)(a1 + 32) _resizedImage:*(void *)(a1 + 40) forHost:*(void *)(a1 + 48)];
  if (*(void *)(*(void *)v2 + 128) == 1)
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v5 = [v4 UUIDString];
  }
  else
  {
    uint64_t v5 = 0;
  }
  [*(id *)(a1 + 32) _updateTouchIconsDataForHost:*(void *)(a1 + 48) image:v3 requestDidSucceed:*(unsigned __int8 *)(a1 + 64) statusCode:*(void *)(a1 + 56) isUserLoadedWebpageRequest:*(unsigned __int8 *)(a1 + 65) higherPriorityIconDownloadFailedDueToNetworkError:*(unsigned __int8 *)(a1 + 66) UUIDString:v5];
  if (*(void *)(a1 + 40))
  {
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 141558275;
      uint64_t v9 = 1752392040;
      __int16 v10 = 2117;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1ABB70000, v6, OS_LOG_TYPE_DEFAULT, "Touch Icon saved to cache; host=%{sensitive, mask.hash}@",
        buf,
        0x16u);
    }
    [*(id *)(*(void *)(a1 + 32) + 24) saveImageToDisk:v3 forKeyString:*(void *)(a1 + 48) completionHandler:0];
  }
}

- (void)cacheFirstAvailableTouchIcon:(id)a3 forURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!self->_readOnly)
  {
    uint64_t v9 = [v7 host];
    if ([v9 length])
    {
      __int16 v10 = +[WBSImageFetchingURLSessionTaskManager sharedManager];
      allowFetchingOverCellularNetworuint64_t k = self->_allowFetchingOverCellularNetwork;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __57__WBSTouchIconCache_cacheFirstAvailableTouchIcon_forURL___block_invoke;
      v12[3] = &unk_1E5E45318;
      v12[4] = self;
      id v13 = v9;
      [v10 downloadFirstValidImageWithURLs:v6 options:allowFetchingOverCellularNetwork completionHandler:v12];
    }
  }
}

void __57__WBSTouchIconCache_cacheFirstAvailableTouchIcon_forURL___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v9 = a2;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(NSObject **)(v12 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__WBSTouchIconCache_cacheFirstAvailableTouchIcon_forURL___block_invoke_2;
  block[3] = &unk_1E5E452F0;
  id v18 = v11;
  uint64_t v19 = v12;
  id v20 = v9;
  id v21 = *(id *)(a1 + 40);
  id v22 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v11;
  dispatch_async(v13, block);
}

void __57__WBSTouchIconCache_cacheFirstAvailableTouchIcon_forURL___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__WBSTouchIconCache_cacheFirstAvailableTouchIcon_forURL___block_invoke_3;
  v7[3] = &unk_1E5E452C8;
  v7[4] = &v8;
  [v2 enumerateKeysAndObjectsUsingBlock:v7];
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = [*(id *)(a1 + 64) statusCode];
  [v3 _saveTouchIconToDisk:v4 forHost:v5 requestDidSucceed:1 statusCode:v6 isUserLoadedWebpageRequest:1 higherPriorityIconDownloadFailedDueToNetworkError:*((unsigned __int8 *)v9 + 24)];
  _Block_object_dispose(&v8, 8);
}

uint64_t __57__WBSTouchIconCache_cacheFirstAvailableTouchIcon_forURL___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend(a3, "safari_isOrContainsClientSideNetworkError");
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)retainTouchIconForURLString:(id)a3
{
  id v4 = a3;
  imageCache = self->_imageCache;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__WBSTouchIconCache_retainTouchIconForURLString___block_invoke;
  v7[3] = &unk_1E5E45220;
  id v8 = v4;
  id v6 = v4;
  [(WBSSiteMetadataImageCache *)imageCache retainImageWithKeyStringProvider:v7];
}

id __49__WBSTouchIconCache_retainTouchIconForURLString___block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithUserTypedString:", *(void *)(a1 + 32));
  uint64_t v2 = [v1 host];

  return v2;
}

- (void)retainTouchIconForHost:(id)a3
{
}

- (void)retainTouchIconsForHosts:(id)a3
{
}

- (void)releaseTouchIconForURLString:(id)a3
{
  id v4 = a3;
  imageCache = self->_imageCache;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__WBSTouchIconCache_releaseTouchIconForURLString___block_invoke;
  v7[3] = &unk_1E5E45220;
  id v8 = v4;
  id v6 = v4;
  [(WBSSiteMetadataImageCache *)imageCache releaseImageWithKeyStringProvider:v7];
}

id __50__WBSTouchIconCache_releaseTouchIconForURLString___block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithUserTypedString:", *(void *)(a1 + 32));
  uint64_t v2 = [v1 host];

  return v2;
}

- (void)releaseTouchIconForHost:(id)a3
{
}

- (void)releaseTouchIconsForHosts:(id)a3
{
}

- (BOOL)hasDeterminedIconAvailabilityForURL:(id)a3
{
  imageCache = self->_imageCache;
  id v4 = [a3 host];
  LOBYTE(imageCache) = [(WBSSiteMetadataImageCache *)imageCache imageStateForKeyString:v4] != 0;

  return (char)imageCache;
}

- (BOOL)shouldRequestTouchIconForWebPageNavigationFromBookmarkInteractionForURL:(id)a3
{
  return [(WBSTouchIconCache *)self _shouldRequestTouchIconWithTimeoutForURL:a3 inUserLoadedWebpage:1 initiatedFromBookmarkInteraction:1];
}

- (BOOL)shouldRequestTouchIconForURL:(id)a3 inUserLoadedWebpage:(BOOL)a4
{
  return [(WBSTouchIconCache *)self _shouldRequestTouchIconWithTimeoutForURL:a3 inUserLoadedWebpage:a4 initiatedFromBookmarkInteraction:0];
}

- (BOOL)_shouldRequestTouchIconWithTimeoutForURL:(id)a3 inUserLoadedWebpage:(BOOL)a4 initiatedFromBookmarkInteraction:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [v8 host];
  if ([v9 length]) {
    BOOL v10 = [(WBSTouchIconCache *)self _shouldRequestTouchIconForURL:v8 inUserLoadedWebpage:v6 initiatedFromBookmarkInteraction:v5];
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_shouldRequestTouchIconForURL:(id)a3 inUserLoadedWebpage:(BOOL)a4 initiatedFromBookmarkInteraction:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  char v14 = 0;
  BOOL v9 = [(WBSTouchIconCache *)self _shouldRequestTouchIconForURL:v8 inUserLoadedWebpage:v6 initiatedFromBookmarkInteraction:v5 shouldCheckImageState:&v14];
  if (v14)
  {
    imageCache = self->_imageCache;
    char v11 = [v8 host];
    BOOL v12 = [(WBSSiteMetadataImageCache *)imageCache imageStateForKeyString:v11] == 1;
  }
  else
  {
    BOOL v12 = v9;
  }

  return v12;
}

void __59__WBSTouchIconCache_responseForRequest_willProvideUpdates___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 141558787;
    uint64_t v6 = 1752392040;
    __int16 v7 = 2117;
    uint64_t v8 = v3;
    __int16 v9 = 2160;
    uint64_t v10 = 1752392040;
    __int16 v11 = 2117;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_DEFAULT, "Returning response %{sensitive, mask.hash}@ for URL %{sensitive, mask.hash}@", (uint8_t *)&v5, 0x2Au);
  }
}

void __59__WBSTouchIconCache_responseForRequest_willProvideUpdates___block_invoke_27(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 141558275;
    uint64_t v5 = 1752392040;
    __int16 v6 = 2117;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_DEFAULT, "Icon should be fetched for URL %{sensitive, mask.hash}@", (uint8_t *)&v4, 0x16u);
  }
}

void __59__WBSTouchIconCache_responseForRequest_willProvideUpdates___block_invoke_28(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 141558787;
    uint64_t v6 = 1752392040;
    __int16 v7 = 2117;
    uint64_t v8 = v3;
    __int16 v9 = 2160;
    uint64_t v10 = 1752392040;
    __int16 v11 = 2117;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_DEFAULT, "Returning response %{sensitive, mask.hash}@ for URL %{sensitive, mask.hash}@", (uint8_t *)&v5, 0x2Au);
  }
}

- (id)_responseForTouchIconRequestWithNoHost:(id)a3
{
  id v4 = a3;
  int v5 = [(id)objc_opt_class() defaultBackgroundColor];
  uint64_t v6 = [(id)objc_opt_class() _generateFavoritesIconForRequest:v4 withBackgroundColor:v5];
  __int16 v7 = +[WBSTouchIconResponse responseWithURL:0 touchIcon:v6 generated:1 extractedBackgroundColor:v5];

  uint64_t v8 = [(WBSTouchIconCache *)self _didGenerateResponse:v7 forRequest:v4];

  return v8;
}

- (void)stopWatchingUpdatesForRequest:(id)a3
{
  id v4 = a3;
  int v5 = [v4 url];
  uint64_t v6 = [v5 host];

  if ([v6 length])
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__WBSTouchIconCache_stopWatchingUpdatesForRequest___block_invoke;
    block[3] = &unk_1E5E40820;
    void block[4] = self;
    id v9 = v6;
    id v10 = v4;
    dispatch_async(internalQueue, block);
  }
}

void __51__WBSTouchIconCache_stopWatchingUpdatesForRequest___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  [v2 removeObject:a1[6]];
  if (![v2 count]) {
    [*(id *)(a1[4] + 32) removeObjectForKey:a1[5]];
  }
}

id __63__WBSTouchIconCache__blockOperationForRequest_knownImageState___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__WBSTouchIconCache__blockOperationForRequest_knownImageState___block_invoke_2;
  v8[3] = &unk_1E5E45368;
  objc_copyWeak(v10, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  int v5 = *(void **)(a1 + 56);
  id v9 = v4;
  v10[1] = v5;
  uint64_t v6 = [v2 _operationWithRequest:v3 completionHandler:v8];
  [v6 setDelegate:*(void *)(a1 + 32)];

  objc_destroyWeak(v10);
  return v6;
}

void __63__WBSTouchIconCache__blockOperationForRequest_knownImageState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__WBSTouchIconCache__blockOperationForRequest_knownImageState___block_invoke_3;
    v9[3] = &unk_1E5E45340;
    v9[4] = WeakRetained;
    id v10 = v3;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 48);
    id v11 = v7;
    uint64_t v12 = v8;
    dispatch_async(v6, v9);
  }
}

uint64_t __63__WBSTouchIconCache__blockOperationForRequest_knownImageState___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveTouchIconToDiskWithResult:*(void *)(a1 + 40) forRequest:*(void *)(a1 + 48) knownImageState:*(void *)(a1 + 56)];
}

- (void)emptyCaches
{
  if (!self->_readOnly)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__WBSTouchIconCache_emptyCaches__block_invoke;
    block[3] = &unk_1E5E408C0;
    void block[4] = self;
    dispatch_async(internalQueue, block);
  }
}

uint64_t __32__WBSTouchIconCache_emptyCaches__block_invoke(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_DEFAULT, "Emptying Icon Cache", v4, 2u);
  }
  [*(id *)(a1 + 32) _openCacheSettingsDatabaseIfNeeded];
  [*(id *)(*(void *)(a1 + 32) + 88) deleteAllEntries];
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllImages];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
  return [*(id *)(*(void *)(a1 + 32) + 24) emptyCache];
}

- (void)purgeUnneededCacheEntries
{
  if (!self->_readOnly)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"WBSTouchIconCacheWillPurgeUnneededImagesNotification" object:self];

    imageCache = self->_imageCache;
    [(WBSSiteMetadataImageCache *)imageCache purgeUnneededImages];
  }
}

- (void)savePendingChangesBeforeTermination
{
  if (!self->_readOnly) {
    [(WBSSiteMetadataImageCache *)self->_imageCache savePendingChangesBeforeTermination];
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__WBSTouchIconCache_savePendingChangesBeforeTermination__block_invoke;
  block[3] = &unk_1E5E408C0;
  void block[4] = self;
  dispatch_sync(internalQueue, block);
}

void __56__WBSTouchIconCache_savePendingChangesBeforeTermination__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 88) close];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 88);
  *(void *)(v2 + 88) = 0;
}

- (void)performMaintenanceWork
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__WBSTouchIconCache_performMaintenanceWork__block_invoke;
  block[3] = &unk_1E5E408C0;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __43__WBSTouchIconCache_performMaintenanceWork__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) performMaintenanceWork];
}

- (double)_maximumScreenScale
{
    return *(double *)&-[WBSTouchIconCache _maximumScreenScale]::maximumScreenScale;
  id v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 scale];
  double v5 = v4;

  double result = v5;
  -[WBSTouchIconCache _maximumScreenScale]::maximumScreenScale = *(void *)&v5;
  return result;
}

- (id)_resizedImage:(id)a3 forHost:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_hostsToRequestSets, "objectForKeyedSubscript:", v7, 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v27;
      double v11 = 0.0;
      double v12 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * i) maximumIconSize];
          if (v14 <= v12) {
            double v16 = v12;
          }
          else {
            double v16 = v14;
          }
          double v12 = v16;
          if (v15 <= v11) {
            double v17 = v11;
          }
          else {
            double v17 = v15;
          }
          double v11 = v17;
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = 0.0;
      double v12 = 0.0;
    }

    [(WBSTouchIconCache *)self _maximumScreenScale];
    double v19 = v18;
    BOOL v20 = v12 == 0.0;
    if (v11 == 0.0) {
      BOOL v20 = 1;
    }
    if (v20)
    {
      double v12 = 72.0;
      double v11 = 72.0;
    }
    [v6 size];
    if (v22 > v19 * v12 || v21 > v19 * v11)
    {
      +[WBSImageUtilities imageSizeScalingSize:proportionallyToFitSize:](WBSImageUtilities, "imageSizeScalingSize:proportionallyToFitSize:");
      uint64_t v24 = +[WBSImageUtilities resizedImage:withSize:](WBSImageUtilities, "resizedImage:withSize:", v6);

      id v6 = (id)v24;
    }
  }

  return v6;
}

- (void)_saveTouchIconToDiskWithResult:(id)a3 forRequest:(id)a4 knownImageState:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = [a4 url];
  uint64_t v10 = [v9 host];
  double v11 = [v8 touchIcon];
  double v12 = [v8 response];
  uint64_t v13 = [v12 statusCode];

  if (a5) {
    BOOL v14 = v11 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  char v15 = v14;
  -[WBSTouchIconCache _saveTouchIconToDisk:forHost:requestDidSucceed:statusCode:isUserLoadedWebpageRequest:higherPriorityIconDownloadFailedDueToNetworkError:](self, "_saveTouchIconToDisk:forHost:requestDidSucceed:statusCode:isUserLoadedWebpageRequest:higherPriorityIconDownloadFailedDueToNetworkError:", v11, v10, [v8 pageRequestDidSucceed], v13, 0, objc_msgSend(v8, "higherPriorityIconDownloadFailedDueToNetworkError"));
  if ((v15 & 1) != 0 && ([v8 failedDueToUnrecoverableNetworkError] & 1) == 0)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __79__WBSTouchIconCache__saveTouchIconToDiskWithResult_forRequest_knownImageState___block_invoke;
    v16[3] = &unk_1E5E453B8;
    v16[4] = self;
    id v17 = 0;
    uint64_t v18 = 1;
    [(WBSTouchIconCache *)self _enumerateRequestsForHost:v10 usingBlock:v16];
  }
}

uint64_t __79__WBSTouchIconCache__saveTouchIconToDiskWithResult_forRequest_knownImageState___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setUpAndReturnPreparedResponseForRequest:a2 withImage:*(void *)(a1 + 40) imageState:*(void *)(a1 + 48) didReceiveNewData:0];
}

- (void)_updateTouchIconsDataForHost:(id)a3 image:(id)a4 requestDidSucceed:(BOOL)a5 statusCode:(int64_t)a6 isUserLoadedWebpageRequest:(BOOL)a7 higherPriorityIconDownloadFailedDueToNetworkError:(BOOL)a8 UUIDString:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v12 = a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v22 = a9;
  os_unfair_lock_lock(&self->_touchIconsDataForHostsAccessLock);
  id v17 = [(NSMutableDictionary *)self->_touchIconsDataForHosts objectForKeyedSubscript:v15];
  if (v17)
  {
    if (v16)
    {
LABEL_3:
      uint64_t v18 = 1;
      goto LABEL_6;
    }
  }
  else
  {
    id v17 = [[WBSTouchIconCacheSettingsEntry alloc] initWithHost:v15];
    if (v16) {
      goto LABEL_3;
    }
  }
  uint64_t v18 = [(WBSTouchIconCacheSettingsEntry *)v17 isIconInCache];
LABEL_6:
  double v19 = [(WBSTouchIconCacheSettingsEntry *)v17 entryByAddingRequestInUserLoadedWebPage:v10 isIconInCache:v18 requestDidSucceed:v12 lastResponseStatusCode:a6 transparencyAnalysisResult:[(WBSTouchIconCache *)self _transparencyAnalysisResultForImage:v16] higherPriorityIconDownloadFailedDueToNetworkError:v9 UUIDString:v22];

  [(NSMutableDictionary *)self->_touchIconsDataForHosts setObject:v19 forKeyedSubscript:v15];
  os_unfair_lock_unlock(&self->_touchIconsDataForHostsAccessLock);
  BOOL v20 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    double v21 = @"failed";
    uint64_t v24 = 1752392040;
    *(_DWORD *)buf = 141558531;
    if (v12) {
      double v21 = @"succeeded";
    }
    __int16 v25 = 2117;
    long long v26 = v19;
    __int16 v27 = 2112;
    long long v28 = v21;
    _os_log_impl(&dword_1ABB70000, v20, OS_LOG_TYPE_DEFAULT, "Saved touch icon cache settings %{sensitive, mask.hash}@ request %@", buf, 0x20u);
  }
  [(WBSTouchIconCache *)self saveTouchIconSettings:v19 touchIcon:v16];
}

- (void)saveTouchIconSettings:(id)a3 touchIcon:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  [(WBSTouchIconCache *)self _willSaveTouchIcon:v6 withCacheSettingsEntry:v11];
  [(WBSTouchIconCache *)self _openCacheSettingsDatabaseIfNeeded];
  id v7 = [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self->_cacheSettingsStore saveEntry:v11];
  if (v7)
  {
    p_touchIconsDataForHostsAccessLocuint64_t k = &self->_touchIconsDataForHostsAccessLock;
    os_unfair_lock_lock(&self->_touchIconsDataForHostsAccessLock);
    touchIconsDataForHosts = self->_touchIconsDataForHosts;
    BOOL v10 = [v11 host];
    [(NSMutableDictionary *)touchIconsDataForHosts setObject:v7 forKeyedSubscript:v10];

    os_unfair_lock_unlock(p_touchIconsDataForHostsAccessLock);
  }
}

- (void)removeTouchIconMetadataForHosts:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__WBSTouchIconCache_removeTouchIconMetadataForHosts_completionHandler___block_invoke;
  block[3] = &unk_1E5E41018;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

uint64_t __71__WBSTouchIconCache_removeTouchIconMetadataForHosts_completionHandler___block_invoke(uint64_t a1)
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
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_removeTouchIconsDataForHost:", *(void *)(*((void *)&v7 + 1) + 8 * v5++), (void)v7);
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_removeTouchIconsDataForHost:(id)a3
{
}

- (void)_removeTouchIconsDataForHost:(id)a3 ifIconIsInCache:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  os_unfair_lock_lock(&self->_touchIconsDataForHostsAccessLock);
  if (!v4
    || ([(NSMutableDictionary *)self->_touchIconsDataForHosts objectForKeyedSubscript:v8],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isIconInCache],
        v6,
        v7))
  {
    [(NSMutableDictionary *)self->_touchIconsDataForHosts removeObjectForKey:v8];
  }
  os_unfair_lock_unlock(&self->_touchIconsDataForHostsAccessLock);
  [(WBSTouchIconCache *)self _openCacheSettingsDatabaseIfNeeded];
  [(WBSSiteMetadataImageCacheSettingsSQLiteStore *)self->_cacheSettingsStore deleteEntryWithHost:v8];
}

- (NSURL)imageDirectoryURL
{
  return [(WBSSiteMetadataImageCache *)self->_imageCache imageDirectoryURL];
}

- (void)siteMetadataImageCache:(id)a3 didRemoveImageFromCacheForKeyString:(id)a4
{
  id v5 = a4;
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__WBSTouchIconCache_siteMetadataImageCache_didRemoveImageFromCacheForKeyString___block_invoke;
  v8[3] = &unk_1E5E407D0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(internalQueue, v8);
}

uint64_t __80__WBSTouchIconCache_siteMetadataImageCache_didRemoveImageFromCacheForKeyString___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeTouchIconsDataForHost:*(void *)(a1 + 40)];
}

- (void)siteMetadataImageCacheDidEmptyCache:(id)a3
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__WBSTouchIconCache_siteMetadataImageCacheDidEmptyCache___block_invoke;
  block[3] = &unk_1E5E408C0;
  void block[4] = self;
  dispatch_async(internalQueue, block);
}

void __57__WBSTouchIconCache_siteMetadataImageCacheDidEmptyCache___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 32), "_notifyImageWasLoaded:forHost:", 0, *(void *)(*((void *)&v6 + 1) + 8 * v5++), (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
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

- (void)webViewMetadataFetchOperation:(id)a3 didFinishUsingWebView:(id)a4
{
  p_providerDelegate = &self->_providerDelegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_providerDelegate);
  [WeakRetained siteMetadataProvider:self didFinishUsingWebView:v6];
}

- (id)_operationWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [[WBSTouchIconFetchOperation alloc] initWithRequest:v6 allowFetchingOverCellularNetwork:self->_allowFetchingOverCellularNetwork completionHandler:v7];

  return v8;
}

- (int64_t)_transparencyAnalysisResultForImage:(id)a3
{
  return objc_msgSend(a3, "safari_transparencyAnalysisResult");
}

- (WBSSiteMetadataProviderDelegate)providerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
  return (WBSSiteMetadataProviderDelegate *)WeakRetained;
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (int64_t)protectionType
{
  return self->_protectionType;
}

- (int64_t)fileMappingStyle
{
  return self->_fileMappingStyle;
}

- (BOOL)allowFetchingOverCellularNetwork
{
  return self->_allowFetchingOverCellularNetwork;
}

- (BOOL)canFetchOutsideOfUserLoadedWebpage
{
  return self->_canFetchOutsideOfUserLoadedWebpage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDirectoryURL, 0);
  objc_destroyWeak((id *)&self->_providerDelegate);
  objc_storeStrong((id *)&self->_cacheSettingsStore, 0);
  objc_storeStrong((id *)&self->_pendingTouchIconRequestHosts, 0);
  objc_storeStrong((id *)&self->_pendingSaveTouchIconToDiskBlocks, 0);
  objc_storeStrong((id *)&self->_requestsToDelayedResponses, 0);
  objc_storeStrong((id *)&self->_requestsToResponses, 0);
  objc_storeStrong((id *)&self->_touchIconsDataForHosts, 0);
  objc_storeStrong((id *)&self->_hostsToRequestSets, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (void)_didLoadTouchIcon:(uint64_t)a1 withCacheSettingsEntry:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_ERROR, "Unexpected value passed to transparencyAnalysisResultFromInteger: %zd", (uint8_t *)&v2, 0xCu);
}

@end