@interface SFDeviceAssetManager
- (BOOL)canUseMobileAssetSPI;
- (BOOL)pathInLocalCache:(id)a3;
- (BOOL)useProcessLocalCache;
- (NSString)networkStatus;
- (OS_dispatch_queue)dispatchQueue;
- (SFDeviceAssetManager)init;
- (id)cacheDirectory;
- (id)hardcodedMappedProducts;
- (id)localCacheWithFileName:(id)a3;
- (id)locallyCachedProductMappings;
- (id)locallyCachedQueryResults;
- (id)onqueue_assetMappedProductTypeForProductType:(id)a3;
- (id)onqueue_mappedProductTypeForProductType:(id)a3;
- (id)onqueue_sharingManagementAsset;
- (void)activate;
- (void)addQueryResultToLocalCache:(id)a3 url:(id)a4 isFallback:(BOOL)a5;
- (void)cacheDirectory;
- (void)clearQueryResultFromLocalCache:(id)a3;
- (void)getAssetBundleForDeviceQuery:(id)a3 withRequestConfiguration:(id)a4;
- (void)invalidate;
- (void)logNetworkStatus;
- (void)mappedProductTypeForProductType:(id)a3 completionHandler:(id)a4;
- (void)onqueue_activate;
- (void)onqueue_downloadAsset:(id)a3 ucat:(LogCategory *)a4 queryLogString:(id)a5 withCompletionHandler:(id)a6;
- (void)onqueue_executeNextMAQueryForTask:(id)a3;
- (void)onqueue_findAssetBundleForAssetQuery:(id)a3 ucat:(LogCategory *)a4 queryType:(id)a5 fallback:(BOOL)a6 retryAttempt:(BOOL)a7 withCompletionHandler:(id)a8;
- (void)onqueue_getAssetBundleForDeviceQuery:(id)a3 withRequestConfiguration:(id)a4;
- (void)onqueue_getCachedAssetBundleForTask:(id)a3;
- (void)onqueue_invalidate;
- (void)onqueue_manuallyFindFallbackAssetBundleMatchingQuery:(id)a3 withCompletionHandler:(id)a4;
- (void)onqueue_purgeAssetsMatchingQuery:(id)a3;
- (void)onqueue_updateMetaDataWithCompletionHandler:(id)a3;
- (void)onqueue_updateSharingManagementAssetIfNecessary;
- (void)onqueue_validateProductTypeInQuery:(id)a3;
- (void)onqueue_variantsMatchingQuery:(id)a3 completionHandler:(id)a4;
- (void)purgeAssetsMatchingQuery:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setNetworkStatus:(id)a3;
- (void)setUseProcessLocalCache:(BOOL)a3;
- (void)storeEntries:(id)a3 inLocalCacheWithFileName:(id)a4;
- (void)storeProductMappingsInLocalCache:(id)a3;
- (void)variantsMatchingQuery:(id)a3 completionHandler:(id)a4;
@end

@implementation SFDeviceAssetManager

- (SFDeviceAssetManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SFDeviceAssetManager;
  v2 = [(SFDeviceAssetManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = CUMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.sharingd.device-assets-work-queue", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)setDispatchQueue:(id)a3
{
  v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_activateCalled)
  {
    FatalErrorF();
    __break(1u);
  }
  else
  {
    dispatchQueue = obj->_dispatchQueue;
    obj->_dispatchQueue = v4;

    objc_sync_exit(obj);
  }
}

- (void)activate
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__SFDeviceAssetManager_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __32__SFDeviceAssetManager_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_activate");
}

- (void)onqueue_activate
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A5389000, log, OS_LOG_TYPE_ERROR, "Activate already called", v1, 2u);
}

- (void)logNetworkStatus
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SFDeviceAssetManager *)self networkStatus];

  if (v3)
  {
    v4 = asset_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_t v5 = [(SFDeviceAssetManager *)self networkStatus];
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_1A5389000, v4, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    if (IsAppleInternalBuild())
    {
      [(CUReachabilityMonitor *)self->_reachabilityMonitor invalidate];
      v6 = (CUReachabilityMonitor *)objc_opt_new();
      reachabilityMonitor = self->_reachabilityMonitor;
      self->_reachabilityMonitor = v6;

      [(CUReachabilityMonitor *)self->_reachabilityMonitor setTimeout:10.0];
      objc_super v8 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://basejumper.apple.com/"];
      [(CUReachabilityMonitor *)self->_reachabilityMonitor setDestinationURL:v8];

      [(CUReachabilityMonitor *)self->_reachabilityMonitor setCompletionHandler:&__block_literal_global_26];
      [(CUReachabilityMonitor *)self->_reachabilityMonitor activate];
    }
  }
  else if (IsAppleInternalBuild())
  {
    v9 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__SFDeviceAssetManager_logNetworkStatus__block_invoke_587;
    block[3] = &unk_1E5BBC870;
    block[4] = self;
    dispatch_async(v9, block);
  }
  else
  {
    uint64_t v10 = MGCopyAnswer();
    v11 = (void *)v10;
    v12 = @"Production";
    if (v10) {
      v12 = (__CFString *)v10;
    }
    v13 = v12;

    v14 = [NSString stringWithFormat:@"Network status: %@", v13];

    [(SFDeviceAssetManager *)self setNetworkStatus:v14];
    [(SFDeviceAssetManager *)self logNetworkStatus];
  }
}

void __40__SFDeviceAssetManager_logNetworkStatus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 code] == -6743) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = v2;
  }
  id v4 = v3;

  dispatch_queue_t v5 = asset_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 localizedDescription];
    v7 = (void *)v6;
    objc_super v8 = @"Reachable";
    if (v6) {
      objc_super v8 = (__CFString *)v6;
    }
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "Basejumper reachability: %@", (uint8_t *)&v9, 0xCu);
  }
}

void __40__SFDeviceAssetManager_logNetworkStatus__block_invoke_587(uint64_t a1)
{
  id v2 = (void *)WiFiCopyCurrentNetworkInfo();
  uint64_t v3 = [v2 objectForKeyedSubscript:@"ssid"];

  id v4 = [NSString stringWithFormat:@"Network status: Internal device connected to \"%@\"", v3];
  [*(id *)(a1 + 32) setNetworkStatus:v4];

  if (gSFRunningInSharingD)
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__6;
    v21 = __Block_byref_object_dispose__6;
    id v22 = 0;
    dispatch_queue_t v5 = [(Class)getNEConfigurationManagerClass[0]() sharedManager];
    if (v5)
    {
      uint64_t v6 = dispatch_get_global_queue(0, 0);
      dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __40__SFDeviceAssetManager_logNetworkStatus__block_invoke_594;
      v14[3] = &unk_1E5BBEB48;
      v16 = &v17;
      objc_super v8 = v7;
      v15 = v8;
      [v5 loadConfigurationsWithCompletionQueue:v6 handler:v14];
      dispatch_time_t v9 = dispatch_time(0, 2000000000);
      dispatch_semaphore_wait(v8, v9);
    }
    if (v18[5])
    {
      uint64_t v10 = [NSString stringWithFormat:@"VPN: \"%@\"", v18[5]];
    }
    else
    {
      uint64_t v10 = @"no VPN";
    }
    uint64_t v11 = NSString;
    v12 = [*(id *)(a1 + 32) networkStatus];
    v13 = [v11 stringWithFormat:@"%@ with %@", v12, v10];
    [*(id *)(a1 + 32) setNetworkStatus:v13];

    _Block_object_dispose(&v17, 8);
  }
  [*(id *)(a1 + 32) logNetworkStatus];
}

void __40__SFDeviceAssetManager_logNetworkStatus__block_invoke_594(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = [v12 count];
  if (!v5 || v6)
  {
    objc_super v8 = [v12 firstObject];
    uint64_t v9 = [v8 name];
  }
  else
  {
    dispatch_semaphore_t v7 = NSString;
    objc_super v8 = [v5 localizedDescription];
    uint64_t v9 = [v7 stringWithFormat:@"Failed to load due to \"%@\"", v8];
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)onqueue_updateMetaDataWithCompletionHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v5 = asset_metadata_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[SFDeviceAssetManager onqueue_updateMetaDataWithCompletionHandler:]";
    _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  getMADownloadOptionsClass[0]();
  uint64_t v6 = objc_opt_new();
  [v6 setDiscretionary:0];
  [v6 setAllowsCellularAccess:1];
  Class v7 = (Class)getMAAssetClass[0]();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__SFDeviceAssetManager_onqueue_updateMetaDataWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E5BBEB98;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(objc_class *)v7 startCatalogDownload:@"com.apple.MobileAsset.SharingDeviceAssets" options:v6 then:v9];
}

void __68__SFDeviceAssetManager_onqueue_updateMetaDataWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = asset_metadata_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v11 = a2;
    _os_log_impl(&dword_1A5389000, v4, OS_LOG_TYPE_DEFAULT, "Download meta data completed with result %d", buf, 8u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(NSObject **)(v5 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SFDeviceAssetManager_onqueue_updateMetaDataWithCompletionHandler___block_invoke_617;
  block[3] = &unk_1E5BBEB70;
  uint64_t v9 = a2;
  block[4] = v5;
  id v8 = *(id *)(a1 + 40);
  dispatch_async(v6, block);
}

uint64_t __68__SFDeviceAssetManager_onqueue_updateMetaDataWithCompletionHandler___block_invoke_617(uint64_t a1)
{
  if (!*(void *)(a1 + 48)) {
    objc_msgSend(*(id *)(a1 + 32), "onqueue_updateSharingManagementAssetIfNecessary");
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)onqueue_updateSharingManagementAssetIfNecessary
{
  uint64_t v3 = [(SFDeviceAssetManager *)self onqueue_sharingManagementAsset];
  id v4 = [v3 attributes];
  uint64_t v5 = getASAttributeContentVersion[0]();
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 integerValue];

  id v8 = (void *)[objc_alloc((Class)getMAAssetQueryClass[0]()) initWithType:@"com.apple.MobileAsset.SharingDeviceAssets"];
  [v8 returnTypes:0];
  SFDeviceAssetAddKeyValuePair(@"Management", @"YES", v8);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke;
  v10[3] = &unk_1E5BBEC10;
  v10[4] = self;
  id v11 = v8;
  uint64_t v12 = v7;
  id v9 = v8;
  [v9 queryMetaData:v10];
}

void __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_2;
  v6[3] = &unk_1E5BBEBE8;
  uint64_t v9 = a2;
  id v4 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_async(v3, v6);
}

void __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_2(uint64_t a1)
{
  if (!*(void *)(a1 + 48))
  {
    id v2 = (id *)(a1 + 32);
    uint64_t v3 = [*(id *)(a1 + 32) results];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      uint64_t v5 = [*v2 results];
      unint64_t v6 = [v5 count];

      if (v6 >= 2)
      {
        id v7 = asset_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_2_cold_2(v2, v7);
        }
      }
      uint64_t v8 = [*(id *)(a1 + 32) results];
      uint64_t v9 = [v8 firstObject];

      uint64_t v10 = [v9 attributes];
      id v11 = getASAttributeContentVersion[0]();
      uint64_t v12 = [v10 objectForKeyedSubscript:v11];
      uint64_t v13 = [v12 integerValue];

      uint64_t v14 = *(void *)(a1 + 56);
      v15 = asset_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v13 <= v14)
      {
        if (v16)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A5389000, v15, OS_LOG_TYPE_DEFAULT, "Installed management asset is up-to-date", buf, 2u);
        }
      }
      else
      {
        if (v16)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A5389000, v15, OS_LOG_TYPE_DEFAULT, "Found new management catalog asset", buf, 2u);
        }

        getMADownloadOptionsClass[0]();
        v15 = objc_opt_new();
        [v15 setDiscretionary:0];
        [v15 setAllowsCellularAccess:1];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_622;
        v17[3] = &unk_1E5BBEBC0;
        v17[4] = *(void *)(a1 + 40);
        [v9 startDownload:v15 then:v17];
      }
    }
    else
    {
      uint64_t v9 = asset_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_2_cold_1(v9);
      }
    }
  }
}

void __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_622(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    int v2 = a2;
    uint64_t v3 = charging_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_622_cold_1(v2, v3);
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(NSObject **)(v4 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_2_623;
    block[3] = &unk_1E5BBC870;
    block[4] = v4;
    dispatch_async(v5, block);
  }
}

void __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_2_623(uint64_t a1)
{
  int v2 = asset_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A5389000, v2, OS_LOG_TYPE_DEFAULT, "Downloaded new management catalog asset", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = 0;

  uint64_t v5 = asset_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v6 = 0;
    _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "Updating cached management catalog asset", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "onqueue_sharingManagementAsset");
}

- (void)invalidate
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__SFDeviceAssetManager_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __34__SFDeviceAssetManager_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_invalidate");
}

- (void)onqueue_invalidate
{
  if (!self->_invalidateCalled) {
    *(_WORD *)&self->_invalidateCalled = 257;
  }
}

- (void)variantsMatchingQuery:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = asset_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v16 = "-[SFDeviceAssetManager variantsMatchingQuery:completionHandler:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1A5389000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SFDeviceAssetManager_variantsMatchingQuery_completionHandler___block_invoke;
  block[3] = &unk_1E5BBBC30;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(workQueue, block);
}

void __64__SFDeviceAssetManager_variantsMatchingQuery_completionHandler___block_invoke(void *a1)
{
  if (*(unsigned char *)(a1[4] + 16))
  {
    uint64_t v1 = a1[5];
    uint64_t v2 = a1[6];
    uint64_t v3 = (void *)a1[4];
    objc_msgSend(v3, "onqueue_variantsMatchingQuery:completionHandler:", v1, v2);
  }
  else
  {
    uint64_t v4 = (SFDeviceAssetManager *)FatalErrorF();
    [(SFDeviceAssetManager *)v4 onqueue_variantsMatchingQuery:v6 completionHandler:v7];
  }
}

- (void)onqueue_variantsMatchingQuery:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  [(SFDeviceAssetManager *)self onqueue_validateProductTypeInQuery:v6];
  uint64_t v8 = (void *)[objc_alloc((Class)getMAAssetQueryClass[0]()) initWithType:@"com.apple.MobileAsset.SharingDeviceAssets"];
  [v8 returnTypes:2];
  uint64_t v9 = [v6 effectiveProductType];
  SFDeviceAssetAddKeyValuePair(@"ProductType", v9, v8);

  if ([v6 legacyAsset])
  {
    if ([v6 h264]) {
      id v10 = @"YES";
    }
    else {
      id v10 = @"NO";
    }
    SFDeviceAssetAddKeyValuePair(@"H264", v10, v8);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__SFDeviceAssetManager_onqueue_variantsMatchingQuery_completionHandler___block_invoke;
  v13[3] = &unk_1E5BBEC60;
  v13[4] = self;
  id v14 = v8;
  id v15 = v7;
  id v11 = v7;
  id v12 = v8;
  [v12 queryMetaData:v13];
}

void __72__SFDeviceAssetManager_onqueue_variantsMatchingQuery_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__SFDeviceAssetManager_onqueue_variantsMatchingQuery_completionHandler___block_invoke_2;
  block[3] = &unk_1E5BBBC30;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

void __72__SFDeviceAssetManager_onqueue_variantsMatchingQuery_completionHandler___block_invoke_2(id *a1)
{
  uint64_t v2 = objc_opt_new();
  id v3 = objc_opt_new();
  uint64_t v4 = [a1[4] results];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72__SFDeviceAssetManager_onqueue_variantsMatchingQuery_completionHandler___block_invoke_3;
  v19[3] = &unk_1E5BBEC38;
  id v5 = v2;
  id v20 = v5;
  id v6 = v3;
  id v21 = v6;
  [v4 enumerateObjectsUsingBlock:v19];

  uint64_t v7 = [a1[4] results];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__SFDeviceAssetManager_onqueue_variantsMatchingQuery_completionHandler___block_invoke_4;
  v16[3] = &unk_1E5BBEC38;
  id v17 = v6;
  id v8 = v5;
  id v18 = v8;
  id v9 = v6;
  [v7 enumerateObjectsUsingBlock:v16];

  id v10 = [a1[5] dispatchQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__SFDeviceAssetManager_onqueue_variantsMatchingQuery_completionHandler___block_invoke_5;
  v13[3] = &unk_1E5BBC9C8;
  id v11 = a1[6];
  id v14 = v8;
  id v15 = v11;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __72__SFDeviceAssetManager_onqueue_variantsMatchingQuery_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 state] == 5)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = [v8 attributes];
    [v3 addObject:v4];

    id v5 = *(void **)(a1 + 40);
    id v6 = [v8 attributes];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"VariantName"];
    [v5 addObject:v7];
  }
}

void __72__SFDeviceAssetManager_onqueue_variantsMatchingQuery_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 attributes];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"VariantName"];

  if (([*(id *)(a1 + 32) containsObject:v4] & 1) == 0)
  {
    id v5 = *(void **)(a1 + 40);
    id v6 = [v7 attributes];
    [v5 addObject:v6];
  }
}

void __72__SFDeviceAssetManager_onqueue_variantsMatchingQuery_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)getAssetBundleForDeviceQuery:(id)a3 withRequestConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (*(int *)[v6 ucat] <= 50)
  {
    if (*(_DWORD *)[v6 ucat] != -1
      || ([v6 ucat], _LogCategory_Initialize()))
    {
      [v6 ucat];
      LogPrintF();
    }
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__SFDeviceAssetManager_getAssetBundleForDeviceQuery_withRequestConfiguration___block_invoke;
  block[3] = &unk_1E5BBD418;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

void __78__SFDeviceAssetManager_getAssetBundleForDeviceQuery_withRequestConfiguration___block_invoke(void *a1)
{
  if (*(unsigned char *)(a1[4] + 16))
  {
    uint64_t v1 = a1[5];
    uint64_t v2 = a1[6];
    id v3 = (void *)a1[4];
    objc_msgSend(v3, "onqueue_getAssetBundleForDeviceQuery:withRequestConfiguration:", v1, v2);
  }
  else
  {
    uint64_t v4 = (SFDeviceAssetManager *)FatalErrorF();
    [(SFDeviceAssetManager *)v4 onqueue_getCachedAssetBundleForTask:v6];
  }
}

- (void)onqueue_getCachedAssetBundleForTask:(id)a3
{
  id v21 = a3;
  uint64_t v4 = [(SFDeviceAssetManager *)self locallyCachedQueryResults];
  SEL v5 = [v21 deviceAssetQuery];
  id v6 = [v5 stringIdentifier];
  id v7 = [v4 objectForKey:v6];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
    int v9 = [v21 updateTaskWithAssetURL:v8 error:0 isFallback:1 isImperfectMatch:0 isCached:1];

    [v21 completeIfPossible];
    id v10 = [v21 deviceAssetQuery];
    int v11 = *(_DWORD *)[v10 ucat];
    if (v9)
    {
      if (v11 <= 50)
      {
        id v12 = [v21 deviceAssetQuery];
        if (*(_DWORD *)[v12 ucat] == -1)
        {
          id v17 = [v21 deviceAssetQuery];
          [v17 ucat];
          int v18 = _LogCategory_Initialize();

          if (!v18) {
            goto LABEL_21;
          }
          goto LABEL_15;
        }
        goto LABEL_5;
      }
      goto LABEL_20;
    }
    if (v11 <= 90)
    {
      id v13 = [v21 deviceAssetQuery];
      if (*(_DWORD *)[v13 ucat] == -1)
      {
        uint64_t v19 = [v21 deviceAssetQuery];
        [v19 ucat];
        int v20 = _LogCategory_Initialize();

        id v14 = v21;
        if (!v20)
        {
LABEL_19:
          id v10 = [v14 deviceAssetQuery];
          [(SFDeviceAssetManager *)self clearQueryResultFromLocalCache:v10];
          goto LABEL_20;
        }
      }
      else
      {

        id v14 = v21;
      }
      id v10 = [v14 deviceAssetQuery];
      [v10 ucat];
      LogPrintF();
    }

    id v14 = v21;
    goto LABEL_19;
  }
  id v10 = [v21 deviceAssetQuery];
  if (*(int *)[v10 ucat] <= 50)
  {
    id v12 = [v21 deviceAssetQuery];
    if (*(_DWORD *)[v12 ucat] == -1)
    {
      id v15 = [v21 deviceAssetQuery];
      [v15 ucat];
      int v16 = _LogCategory_Initialize();

      if (!v16) {
        goto LABEL_21;
      }
      goto LABEL_15;
    }
LABEL_5:

LABEL_15:
    id v10 = [v21 deviceAssetQuery];
    [v10 ucat];
    LogPrintF();
  }
LABEL_20:

LABEL_21:
}

- (void)onqueue_getAssetBundleForDeviceQuery:(id)a3 withRequestConfiguration:(id)a4
{
  id v6 = a3;
  workQueue = self->_workQueue;
  id v8 = a4;
  dispatch_assert_queue_V2(workQueue);
  [(SFDeviceAssetManager *)self onqueue_validateProductTypeInQuery:v6];
  int v9 = [SFDeviceAssetTask alloc];
  id v10 = [(SFDeviceAssetManager *)self dispatchQueue];
  int v11 = [(SFDeviceAssetTask *)v9 initWithDeviceQuery:v6 requestConfiguration:v8 dispatchQueue:v10 useProcessLocalCache:[(SFDeviceAssetManager *)self useProcessLocalCache]];

  if ([(SFDeviceAssetManager *)self useProcessLocalCache]) {
    [(SFDeviceAssetManager *)self onqueue_getCachedAssetBundleForTask:v11];
  }
  if ([(SFDeviceAssetManager *)self canUseMobileAssetSPI])
  {
    [(SFDeviceAssetManager *)self onqueue_executeNextMAQueryForTask:v11];
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __86__SFDeviceAssetManager_onqueue_getAssetBundleForDeviceQuery_withRequestConfiguration___block_invoke;
    v12[3] = &unk_1E5BBEC88;
    id v13 = v11;
    [(SFDeviceAssetManager *)self onqueue_manuallyFindFallbackAssetBundleMatchingQuery:v6 withCompletionHandler:v12];
  }
}

void __86__SFDeviceAssetManager_onqueue_getAssetBundleForDeviceQuery_withRequestConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) cancelTimeout];
  id v6 = [*(id *)(a1 + 32) deviceAssetQuery];
  if (*(int *)[v6 ucat] <= 50)
  {
    id v7 = [*(id *)(a1 + 32) deviceAssetQuery];
    if (*(_DWORD *)[v7 ucat] == -1)
    {
      id v8 = [*(id *)(a1 + 32) deviceAssetQuery];
      [v8 ucat];
      int v9 = _LogCategory_Initialize();

      if (!v9) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    id v6 = [*(id *)(a1 + 32) deviceAssetQuery];
    [v6 ucat];
    LogPrintF();
  }

LABEL_7:
  [*(id *)(a1 + 32) updateTaskWithAssetBundleURL:v10 error:v5 isFallback:0 isImperfectMatch:0 isCached:0];
  [*(id *)(a1 + 32) completeIfPossible];
}

- (void)purgeAssetsMatchingQuery:(id)a3
{
  id v4 = a3;
  if (*(int *)[v4 ucat] <= 50)
  {
    if (*(_DWORD *)[v4 ucat] != -1
      || ([v4 ucat], _LogCategory_Initialize()))
    {
      [v4 ucat];
      LogPrintF();
    }
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__SFDeviceAssetManager_purgeAssetsMatchingQuery___block_invoke;
  block[3] = &unk_1E5BBBD18;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, block);
}

void __49__SFDeviceAssetManager_purgeAssetsMatchingQuery___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v1 = *(void *)(a1 + 40);
    uint64_t v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "onqueue_purgeAssetsMatchingQuery:", v1);
  }
  else
  {
    id v3 = (SFDeviceAssetManager *)FatalErrorF();
    [(SFDeviceAssetManager *)v3 onqueue_purgeAssetsMatchingQuery:v5];
  }
}

- (void)onqueue_purgeAssetsMatchingQuery:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  [(SFDeviceAssetManager *)self onqueue_validateProductTypeInQuery:v4];
  id v5 = objc_opt_new();
  id v6 = [[SFDeviceQueryParameters alloc] initWithDeviceAssetQuery:v4 installedOnly:1 imperfectMatch:0 fallback:0];
  id v7 = [(SFDeviceQueryParameters *)v6 maQuery];
  SFDeviceAssetAddKeyValuePairsForStrictMatch(v4, v7);

  id v17 = v6;
  [v5 addObject:v6];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v13 = [v12 maQuery];
        uint64_t v14 = [v4 ucat];
        id v15 = [v12 queryType];
        uint64_t v16 = [v12 fallback];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __57__SFDeviceAssetManager_onqueue_purgeAssetsMatchingQuery___block_invoke;
        v19[3] = &unk_1E5BBECB0;
        id v20 = v4;
        [(SFDeviceAssetManager *)self onqueue_findAssetBundleForAssetQuery:v13 ucat:v14 queryType:v15 fallback:v16 retryAttempt:0 withCompletionHandler:v19];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }
}

void __57__SFDeviceAssetManager_onqueue_purgeAssetsMatchingQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = *(_DWORD *)[*(id *)(a1 + 32) ucat];
  if (v5)
  {
    if (v7 <= 50)
    {
      if (*(_DWORD *)[*(id *)(a1 + 32) ucat] != -1
        || ([*(id *)(a1 + 32) ucat], _LogCategory_Initialize()))
      {
        [*(id *)(a1 + 32) ucat];
        LogPrintF();
      }
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__SFDeviceAssetManager_onqueue_purgeAssetsMatchingQuery___block_invoke_2;
    v8[3] = &unk_1E5BBEBC0;
    id v9 = *(id *)(a1 + 32);
    [v5 purge:v8];
  }
  else if (v7 <= 10)
  {
    if (*(_DWORD *)[*(id *)(a1 + 32) ucat] != -1
      || ([*(id *)(a1 + 32) ucat], _LogCategory_Initialize()))
    {
      [*(id *)(a1 + 32) ucat];
      LogPrintF();
    }
  }
}

int *__57__SFDeviceAssetManager_onqueue_purgeAssetsMatchingQuery___block_invoke_2(uint64_t a1)
{
  uint64_t result = (int *)[*(id *)(a1 + 32) ucat];
  if (*result <= 50)
  {
    if (*(_DWORD *)[*(id *)(a1 + 32) ucat] != -1
      || ([*(id *)(a1 + 32) ucat], uint64_t result = (int *)_LogCategory_Initialize(), result))
    {
      [*(id *)(a1 + 32) ucat];
      return (int *)LogPrintF();
    }
  }
  return result;
}

- (id)cacheDirectory
{
  v21[1] = *MEMORY[0x1E4F143B8];
  cacheDirectory = self->_cacheDirectory;
  if (!cacheDirectory)
  {
    id v4 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    id v5 = [v4 firstObject];
    id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:1];
    int v7 = [v6 URLByAppendingPathComponent:@"com.apple.sharing" isDirectory:1];

    unsigned __int8 v19 = 0;
    uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v9 = [v7 path];
    int v10 = [v8 fileExistsAtPath:v9 isDirectory:&v19];
    int v11 = v19;

    if (v10) {
      BOOL v12 = v11 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12) {
      goto LABEL_11;
    }
    [v8 removeItemAtURL:v7 error:0];
    uint64_t v20 = *MEMORY[0x1E4F28378];
    v21[0] = MEMORY[0x1E4F1CC38];
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v18 = 0;
    [v8 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:v13 error:&v18];
    uint64_t v14 = (NSURL *)v18;

    if (v14)
    {
      id v15 = asset_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[SFDeviceAssetManager cacheDirectory]();
      }
    }
    else
    {
LABEL_11:
      uint64_t v16 = v7;
      uint64_t v14 = self->_cacheDirectory;
      self->_cacheDirectory = v16;
    }

    cacheDirectory = self->_cacheDirectory;
  }

  return cacheDirectory;
}

- (id)locallyCachedProductMappings
{
  cachedProductMappingsTable = self->_cachedProductMappingsTable;
  if (!cachedProductMappingsTable)
  {
    id v4 = [(SFDeviceAssetManager *)self localCacheWithFileName:@"DeviceMapping.plist"];
    id v5 = self->_cachedProductMappingsTable;
    self->_cachedProductMappingsTable = v4;

    cachedProductMappingsTable = self->_cachedProductMappingsTable;
  }

  return cachedProductMappingsTable;
}

- (void)storeProductMappingsInLocalCache:(id)a3
{
}

- (id)locallyCachedQueryResults
{
  cachedQueryPaths = self->_cachedQueryPaths;
  if (!cachedQueryPaths)
  {
    id v4 = (NSMutableDictionary *)objc_opt_new();
    id v5 = self->_cachedQueryPaths;
    self->_cachedQueryPaths = v4;

    id v6 = self->_cachedQueryPaths;
    int v7 = [(SFDeviceAssetManager *)self localCacheWithFileName:@"QueryResults.plist"];
    [(NSMutableDictionary *)v6 addEntriesFromDictionary:v7];

    cachedQueryPaths = self->_cachedQueryPaths;
  }

  return cachedQueryPaths;
}

- (void)addQueryResultToLocalCache:(id)a3 url:(id)a4 isFallback:(BOOL)a5
{
  id v17 = a3;
  id v8 = [a4 path];
  if (v8)
  {
    cachedQueryPaths = self->_cachedQueryPaths;
    int v10 = [v17 stringIdentifier];
    int v11 = [(NSMutableDictionary *)cachedQueryPaths objectForKeyedSubscript:v10];

    if (v11)
    {
      if (!a5)
      {
        id v12 = v11;
        if (v12 == v8)
        {
        }
        else
        {
          id v13 = v12;
          char v14 = [v12 isEqual:v8];

          if ((v14 & 1) == 0)
          {
            if (*(int *)[v17 ucat] > 50) {
              goto LABEL_16;
            }
            if (*(_DWORD *)[v17 ucat] == -1)
            {
              [v17 ucat];
              if (!_LogCategory_Initialize()) {
                goto LABEL_16;
              }
            }
            goto LABEL_11;
          }
        }
      }
LABEL_17:

      goto LABEL_18;
    }
    if (*(int *)[v17 ucat] > 50) {
      goto LABEL_16;
    }
    if (*(_DWORD *)[v17 ucat] == -1)
    {
      [v17 ucat];
      if (!_LogCategory_Initialize()) {
        goto LABEL_16;
      }
    }
LABEL_11:
    [v17 ucat];
    LogPrintF();
LABEL_16:
    id v15 = self->_cachedQueryPaths;
    uint64_t v16 = [v17 stringIdentifier];
    [(NSMutableDictionary *)v15 setObject:v8 forKeyedSubscript:v16];

    [(SFDeviceAssetManager *)self storeEntries:self->_cachedQueryPaths inLocalCacheWithFileName:@"QueryResults.plist"];
    goto LABEL_17;
  }
LABEL_18:
}

- (void)clearQueryResultFromLocalCache:(id)a3
{
  id v4 = a3;
  cachedQueryPaths = self->_cachedQueryPaths;
  id v10 = v4;
  id v6 = [v4 stringIdentifier];
  int v7 = [(NSMutableDictionary *)cachedQueryPaths objectForKeyedSubscript:v6];

  if (v7)
  {
    if (*(int *)[v10 ucat] <= 50)
    {
      if (*(_DWORD *)[v10 ucat] != -1
        || ([v10 ucat], _LogCategory_Initialize()))
      {
        [v10 ucat];
        LogPrintF();
      }
    }
    id v8 = self->_cachedQueryPaths;
    id v9 = [v10 stringIdentifier];
    [(NSMutableDictionary *)v8 setObject:0 forKeyedSubscript:v9];

    [(SFDeviceAssetManager *)self storeEntries:self->_cachedQueryPaths inLocalCacheWithFileName:@"QueryResults.plist"];
  }
}

- (BOOL)pathInLocalCache:(id)a3
{
  id v4 = a3;
  id v5 = [(SFDeviceAssetManager *)self locallyCachedQueryResults];
  id v6 = [v5 allValues];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (BOOL)canUseMobileAssetSPI
{
  return softLinkMKBDeviceUnlockedSinceBoot[0]() == 1;
}

- (void)onqueue_manuallyFindFallbackAssetBundleMatchingQuery:(id)a3 withCompletionHandler:(id)a4
{
  v34[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v25 = (void (**)(id, void *, void))a4;
  if (*(int *)[v5 ucat] <= 50)
  {
    if (*(_DWORD *)[v5 ucat] != -1
      || ([v5 ucat], _LogCategory_Initialize()))
    {
      [v5 ucat];
      long long v22 = "-[SFDeviceAssetManager onqueue_manuallyFindFallbackAssetBundleMatchingQuery:withCompletionHandler:]";
      LogPrintF();
    }
  }
  long long v24 = v5;
  id v6 = objc_msgSend(v5, "effectiveProductType", v22);
  char v7 = [v6 stringByReplacingOccurrencesOfString:@"," withString:@"_"];

  uint64_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/System/Library/PreinstalledAssetsV2/RequiredByOs/com_apple_MobileAsset_SharingDeviceAssets/" isDirectory:1];
  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v10 = *MEMORY[0x1E4F1C6E8];
  uint64_t v11 = *MEMORY[0x1E4F1C628];
  v34[0] = *MEMORY[0x1E4F1C6E8];
  v34[1] = v11;
  v34[2] = *MEMORY[0x1E4F1C658];
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
  long long v23 = (void *)v8;
  id v13 = [v9 enumeratorAtURL:v8 includingPropertiesForKeys:v12 options:6 errorHandler:0];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      uint64_t v18 = 0;
      uint64_t v26 = v16;
      do
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        unsigned __int8 v19 = *(void **)(*((void *)&v29 + 1) + 8 * v18);
        id v28 = 0;
        [v19 getResourceValue:&v28 forKey:v11 error:0];
        id v20 = v28;
        id v27 = 0;
        [v19 getResourceValue:&v27 forKey:v10 error:0];
        id v21 = v27;
        if ([v20 BOOLValue] && objc_msgSend(v21, "hasPrefix:", v7))
        {
          if (*(int *)[v24 ucat] <= 50)
          {
            if (*(_DWORD *)[v24 ucat] != -1
              || ([v24 ucat], _LogCategory_Initialize()))
            {
              [v24 ucat];
              LogPrintF();
            }
          }
          v25[2](v25, v19, 0);
          uint64_t v16 = v26;
        }

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v16);
  }
}

- (void)onqueue_executeNextMAQueryForTask:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v5 = [v4 deviceAssetQuery];
  id v6 = [v4 deviceQueryParameters];
  char v7 = [v6 firstObject];

  uint64_t v8 = [v4 deviceQueryParameters];
  [v8 removeObject:v7];

  if (v7)
  {
    id v9 = [v7 queryType];
    uint64_t v10 = [v7 fallback];
    uint64_t v11 = [v7 maQuery];
    uint64_t v12 = [v5 ucat];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __58__SFDeviceAssetManager_onqueue_executeNextMAQueryForTask___block_invoke;
    v20[3] = &unk_1E5BBECD8;
    id v21 = v5;
    long long v22 = self;
    char v25 = v10;
    id v23 = v4;
    id v24 = v7;
    [(SFDeviceAssetManager *)self onqueue_findAssetBundleForAssetQuery:v11 ucat:v12 queryType:v9 fallback:v10 retryAttempt:0 withCompletionHandler:v20];
  }
  else
  {
    if (*(int *)[v5 ucat] <= 50)
    {
      if (*(_DWORD *)[v5 ucat] != -1
        || ([v5 ucat], _LogCategory_Initialize()))
      {
        [v5 ucat];
        uint64_t v18 = "-[SFDeviceAssetManager onqueue_executeNextMAQueryForTask:]";
        unsigned __int8 v19 = v5;
        LogPrintF();
      }
    }
    if ((objc_msgSend(v4, "queryResultCalled", v18, v19) & 1) == 0)
    {
      id v13 = [v4 fallbackBundle];

      if (!v13)
      {
        id v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v15 = *MEMORY[0x1E4F28798];
        uint64_t v26 = *MEMORY[0x1E4F28568];
        v27[0] = @"No assets found";
        uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
        uint64_t v17 = [v14 errorWithDomain:v15 code:22 userInfo:v16];
        [v4 updateTaskWithBundle:0 error:v17 isFallback:0 isImperfectMatch:0 isCached:0];

        [v4 completeWithBundle:0 isFallback:0 isCached:0];
      }
    }
  }
}

void __58__SFDeviceAssetManager_onqueue_executeNextMAQueryForTask___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = [v5 getLocalFileUrl];
  if (v5)
  {
    if (*(int *)[*(id *)(a1 + 32) ucat] <= 50)
    {
      if (*(_DWORD *)[*(id *)(a1 + 32) ucat] != -1
        || ([*(id *)(a1 + 32) ucat], _LogCategory_Initialize()))
      {
        [*(id *)(a1 + 32) ucat];
        uint64_t v8 = [v5 attributes];
        uint64_t v12 = [v8 objectForKeyedSubscript:@"VariantName"];
        LogPrintF();
      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 40), "useProcessLocalCache", v12)) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9) {
    [*(id *)(a1 + 40) addQueryResultToLocalCache:*(void *)(a1 + 32) url:v7 isFallback:*(unsigned __int8 *)(a1 + 64)];
  }
  objc_msgSend(*(id *)(a1 + 48), "updateTaskWithAssetURL:error:isFallback:isImperfectMatch:isCached:", v7, v6, *(unsigned __int8 *)(a1 + 64), objc_msgSend(*(id *)(a1 + 56), "imperfectMatch"), 0);

  if ([*(id *)(a1 + 48) completeIfPossible])
  {
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(NSObject **)(v10 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__SFDeviceAssetManager_onqueue_executeNextMAQueryForTask___block_invoke_2;
    block[3] = &unk_1E5BBBD18;
    void block[4] = v10;
    id v14 = *(id *)(a1 + 48);
    dispatch_async(v11, block);
  }
}

uint64_t __58__SFDeviceAssetManager_onqueue_executeNextMAQueryForTask___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onqueue_executeNextMAQueryForTask:", *(void *)(a1 + 40));
}

- (void)onqueue_findAssetBundleForAssetQuery:(id)a3 ucat:(LogCategory *)a4 queryType:(id)a5 fallback:(BOOL)a6 retryAttempt:(BOOL)a7 withCompletionHandler:(id)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a8;
  int v28 = 0;
  uint64_t v16 = (int *)LogCategoryCreateEx();
  uint64_t v17 = v16;
  if (*v16 <= 50 && (*v16 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __120__SFDeviceAssetManager_onqueue_findAssetBundleForAssetQuery_ucat_queryType_fallback_retryAttempt_withCompletionHandler___block_invoke;
  v21[3] = &unk_1E5BBEDA0;
  v21[4] = self;
  id v22 = v13;
  id v24 = v15;
  char v25 = v17;
  id v23 = v14;
  BOOL v26 = a6;
  BOOL v27 = a7;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  [v20 queryMetaData:v21];
}

void __120__SFDeviceAssetManager_onqueue_findAssetBundleForAssetQuery_ucat_queryType_fallback_retryAttempt_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __120__SFDeviceAssetManager_onqueue_findAssetBundleForAssetQuery_ucat_queryType_fallback_retryAttempt_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5BBED78;
  uint64_t v12 = a2;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 64);
  id v8 = v4;
  uint64_t v13 = v5;
  id v9 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  __int16 v14 = *(_WORD *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v6;
  dispatch_async(v3, block);
}

void __120__SFDeviceAssetManager_onqueue_findAssetBundleForAssetQuery_ucat_queryType_fallback_retryAttempt_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  v52[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 64))
  {
    uint64_t v2 = [*(id *)(a1 + 32) results];
    uint64_t v3 = [v2 count];

    if (!v3)
    {
      uint64_t v7 = *(void *)(a1 + 64);
      if (v7 == 5)
      {
        int v19 = **(_DWORD **)(a1 + 72);
        if (v19 <= 90 && (v19 != -1 || _LogCategory_Initialize()))
        {
          v33 = [*(id *)(a1 + 32) assetType];
          LogPrintF();
        }
        uint64_t v21 = 80;
        goto LABEL_27;
      }
      if (v7 == 2 && !*(unsigned char *)(a1 + 81))
      {
        int v20 = **(_DWORD **)(a1 + 72);
        if (v20 <= 50 && (v20 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        int v28 = *(void **)(a1 + 48);
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __120__SFDeviceAssetManager_onqueue_findAssetBundleForAssetQuery_ucat_queryType_fallback_retryAttempt_withCompletionHandler___block_invoke_5;
        v35[3] = &unk_1E5BBED50;
        v35[4] = v28;
        id v29 = *(id *)(a1 + 32);
        uint64_t v30 = *(void *)(a1 + 72);
        id v36 = v29;
        uint64_t v39 = v30;
        id v37 = *(id *)(a1 + 40);
        char v41 = *(unsigned char *)(a1 + 80);
        id v31 = *(id *)(a1 + 56);
        uint64_t v32 = *(void *)(a1 + 64);
        id v38 = v31;
        uint64_t v40 = v32;
        objc_msgSend(v28, "onqueue_updateMetaDataWithCompletionHandler:", v35);

        uint64_t v13 = v36;
        goto LABEL_15;
      }
      int v8 = **(_DWORD **)(a1 + 72);
      if (v8 <= 90)
      {
        if (v8 == -1)
        {
          if (!_LogCategory_Initialize()) {
            goto LABEL_24;
          }
          uint64_t v7 = *(void *)(a1 + 64);
        }
        v33 = *(void **)(a1 + 40);
        uint64_t v34 = v7;
        LogPrintF();
      }
LABEL_24:
      uint64_t v21 = 14;
LABEL_27:
      id v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28798];
      uint64_t v49 = *MEMORY[0x1E4F28568];
      uint64_t v24 = *(void *)(a1 + 56);
      char v25 = objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 64), v33, v34);
      v50 = v25;
      BOOL v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      BOOL v27 = [v22 errorWithDomain:v23 code:v21 userInfo:v26];
      (*(void (**)(uint64_t, void, void *))(v24 + 16))(v24, 0, v27);

      return;
    }
  }
  int v4 = **(_DWORD **)(a1 + 72);
  if (v4 <= 50 && (v4 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) results];
    v33 = v5;
    uint64_t v34 = [v6 count];
    LogPrintF();
  }
  id v9 = objc_msgSend(*(id *)(a1 + 32), "results", v33, v34);
  uint64_t v10 = [v9 count];

  if (v10)
  {
    id v11 = [*(id *)(a1 + 32) results];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __120__SFDeviceAssetManager_onqueue_findAssetBundleForAssetQuery_ucat_queryType_fallback_retryAttempt_withCompletionHandler___block_invoke_3;
    v42[3] = &unk_1E5BBED28;
    uint64_t v47 = *(void *)(a1 + 72);
    id v43 = *(id *)(a1 + 40);
    id v44 = *(id *)(a1 + 32);
    char v48 = *(unsigned char *)(a1 + 80);
    id v12 = *(id *)(a1 + 56);
    uint64_t v45 = *(void *)(a1 + 48);
    id v46 = v12;
    [v11 enumerateObjectsUsingBlock:v42];

    uint64_t v13 = v43;
LABEL_15:

    return;
  }
  uint64_t v14 = *(void *)(a1 + 56);
  id v15 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v16 = *MEMORY[0x1E4F28798];
  uint64_t v51 = *MEMORY[0x1E4F28568];
  v52[0] = @"Failed to find any assets";
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
  id v18 = [v15 errorWithDomain:v16 code:2 userInfo:v17];
  (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v18);
}

void __120__SFDeviceAssetManager_onqueue_findAssetBundleForAssetQuery_ucat_queryType_fallback_retryAttempt_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  int v8 = **(_DWORD **)(a1 + 64);
  if (v8 <= 50 && (v8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [v7 assetId];
    uint64_t v11 = [v7 state];
    id v12 = [v7 attributes];
    SFCompactStringFromCollection(v12);
    id v36 = v35 = v11;
    uint64_t v30 = v9;
    uint64_t v34 = v10;
    LogPrintF();
  }
  objc_msgSend(v7, "logAsset", v30, v34, v35, v36);
  uint64_t v13 = [*(id *)(a1 + 40) results];
  uint64_t v14 = [v13 count];

  uint64_t v15 = [v7 state];
  if (v15 == 5) {
    goto LABEL_13;
  }
  uint64_t v16 = v14 - 1;
  if (v15 != 3)
  {
    if (v15 != 2)
    {
      objc_msgSend(*(id *)(a1 + 48), "onqueue_downloadAsset:ucat:queryLogString:withCompletionHandler:", v7, *(void *)(a1 + 64), *(void *)(a1 + 32), *(void *)(a1 + 56));
      goto LABEL_18;
    }
    if (*(unsigned char *)(a1 + 72))
    {
      int v17 = **(_DWORD **)(a1 + 64);
      if (v16 == a3)
      {
        if (v17 <= 90 && (v17 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v32 = [v7 assetId];
          LogPrintF();
        }
        (*(void (**)(void, id))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v7);
      }
      else if (v17 <= 50 && (v17 != -1 || _LogCategory_Initialize()))
      {
        v33 = [v7 assetId];
        LogPrintF();
      }
      goto LABEL_39;
    }
LABEL_13:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_18:
    *a4 = 1;
    goto LABEL_39;
  }
  int v18 = **(_DWORD **)(a1 + 64);
  if (v18 <= 50 && (v18 != -1 || _LogCategory_Initialize()))
  {
    int v19 = [v7 attributes];
    id v31 = SFCompactStringFromCollection(v19);
    LogPrintF();
  }
  int v20 = objc_msgSend(v7, "getLocalFileUrl", v31);
  uint64_t v21 = [v20 path];

  if (v21
    && [*(id *)(a1 + 48) useProcessLocalCache]
    && [*(id *)(a1 + 48) pathInLocalCache:v21])
  {
    int v22 = **(_DWORD **)(a1 + 64);
    if (v22 <= 50 && (v22 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    uint64_t v23 = *(int **)(a1 + 64);
    if (*v23 <= 50)
    {
      if (*v23 != -1 || (v24 = _LogCategory_Initialize(), uint64_t v23 = *(int **)(a1 + 64), v24))
      {
        LogPrintF();
        uint64_t v23 = *(int **)(a1 + 64);
      }
    }
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __120__SFDeviceAssetManager_onqueue_findAssetBundleForAssetQuery_ucat_queryType_fallback_retryAttempt_withCompletionHandler___block_invoke_4;
    v37[3] = &unk_1E5BBED00;
    uint64_t v39 = v23;
    id v38 = v7;
    [v38 purge:v37];
  }
  if (v16 == a3)
  {
    uint64_t v25 = *(void *)(a1 + 56);
    BOOL v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28798];
    uint64_t v40 = *MEMORY[0x1E4F28568];
    v41[0] = @"Failed to find any still valid assets";
    int v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    id v29 = [v26 errorWithDomain:v27 code:79 userInfo:v28];
    (*(void (**)(uint64_t, void, void *))(v25 + 16))(v25, 0, v29);
  }
LABEL_39:
}

void __120__SFDeviceAssetManager_onqueue_findAssetBundleForAssetQuery_ucat_queryType_fallback_retryAttempt_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  int v1 = **(_DWORD **)(a1 + 40);
  if (v1 <= 50 && (v1 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v3 = [*(id *)(a1 + 32) assetId];
    LogPrintF();
  }
}

void __120__SFDeviceAssetManager_onqueue_findAssetBundleForAssetQuery_ucat_queryType_fallback_retryAttempt_withCompletionHandler___block_invoke_5(uint64_t a1, int a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 64);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 80);
    uint64_t v8 = *(void *)(a1 + 48);
    objc_msgSend(v3, "onqueue_findAssetBundleForAssetQuery:ucat:queryType:fallback:retryAttempt:withCompletionHandler:", v4, v5, v8, v7, 1, v6);
  }
  else
  {
    int v9 = **(_DWORD **)(a1 + 64);
    if (v9 <= 60 && (v9 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28798];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    uint64_t v13 = [NSNumber numberWithInteger:*(void *)(a1 + 72)];
    v17[0] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    uint64_t v15 = [v11 errorWithDomain:v12 code:6 userInfo:v14];
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v15);
  }
}

- (void)onqueue_downloadAsset:(id)a3 ucat:(LogCategory *)a4 queryLogString:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (a4->var0 <= 50 && (a4->var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  getMADownloadOptionsClass[0]();
  uint64_t v13 = objc_opt_new();
  [v13 setDiscretionary:0];
  [v13 setAllowsCellularAccess:1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __88__SFDeviceAssetManager_onqueue_downloadAsset_ucat_queryLogString_withCompletionHandler___block_invoke;
  v17[3] = &unk_1E5BBEDF0;
  id v20 = v12;
  uint64_t v21 = a4;
  v17[4] = self;
  id v18 = v11;
  id v19 = v10;
  id v14 = v10;
  id v15 = v12;
  id v16 = v11;
  [v14 startDownload:v13 then:v17];
}

void __88__SFDeviceAssetManager_onqueue_downloadAsset_ucat_queryLogString_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__SFDeviceAssetManager_onqueue_downloadAsset_ucat_queryLogString_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5BBEDC8;
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v9 = a2;
  uint64_t v10 = v4;
  id v6 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v3, block);
}

void __88__SFDeviceAssetManager_onqueue_downloadAsset_ucat_queryLogString_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  int v3 = **(_DWORD **)(a1 + 64);
  if (v2)
  {
    if (v3 <= 90)
    {
      if (v3 != -1 || (v4 = _LogCategory_Initialize(), uint64_t v2 = *(void *)(a1 + 56), v4))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = v2;
        LogPrintF();
        uint64_t v2 = *(void *)(a1 + 56);
      }
    }
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F28798];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    id v8 = objc_msgSend(NSNumber, "numberWithInteger:", v2, v12, v13);
    v15[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    uint64_t v10 = [v6 errorWithDomain:v7 code:35 userInfo:v9];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v10);
  }
  else
  {
    if (v3 <= 50 && (v3 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v11();
  }
}

- (void)onqueue_validateProductTypeInQuery:(id)a3
{
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v6 = [v5 productType];
  id v8 = [(SFDeviceAssetManager *)self onqueue_mappedProductTypeForProductType:v6];

  if ([v8 length]) {
    id v7 = v8;
  }
  else {
    id v7 = 0;
  }
  [v5 setMappedProductType:v7];
}

- (void)mappedProductTypeForProductType:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = asset_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[SFDeviceAssetManager mappedProductTypeForProductType:completionHandler:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1A5389000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SFDeviceAssetManager_mappedProductTypeForProductType_completionHandler___block_invoke;
  block[3] = &unk_1E5BBBC30;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(workQueue, block);
}

void __74__SFDeviceAssetManager_mappedProductTypeForProductType_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = (unsigned char *)a1[4];
  if (v2[16])
  {
    objc_msgSend(v2, "onqueue_mappedProductTypeForProductType:", a1[5]);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = a1[6];
    uint64_t v4 = [v9 length];
    id v5 = v9;
    if (!v4) {
      id v5 = (id)a1[5];
    }
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
  else
  {
    id v6 = (SFDeviceAssetManager *)FatalErrorF();
    [(SFDeviceAssetManager *)v6 onqueue_mappedProductTypeForProductType:v8];
  }
}

- (id)onqueue_mappedProductTypeForProductType:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v5 = [(SFDeviceAssetManager *)self hardcodedMappedProducts];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    SEL v7 = asset_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v4;
      __int16 v13 = 2112;
      id v14 = v6;
      id v8 = "Mapped product type using hardcoded mapping %@ => %@";
LABEL_11:
      _os_log_impl(&dword_1A5389000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0x16u);
    }
  }
  else if ([(SFDeviceAssetManager *)self useProcessLocalCache] {
         && ([(SFDeviceAssetManager *)self locallyCachedProductMappings],
  }
             id v9 = objc_claimAutoreleasedReturnValue(),
             [v9 objectForKey:v4],
             id v6 = objc_claimAutoreleasedReturnValue(),
             v9,
             v6))
  {
    SEL v7 = asset_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v4;
      __int16 v13 = 2112;
      id v14 = v6;
      id v8 = "Mapped product type using cached mapping %@ => %@";
      goto LABEL_11;
    }
  }
  else
  {
    id v6 = [(SFDeviceAssetManager *)self onqueue_assetMappedProductTypeForProductType:v4];
    if (!v6) {
      goto LABEL_13;
    }
    SEL v7 = asset_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v4;
      __int16 v13 = 2112;
      id v14 = v6;
      id v8 = "Mapped product type using remote mapping %@ => %@";
      goto LABEL_11;
    }
  }

LABEL_13:

  return v6;
}

- (id)onqueue_sharingManagementAsset
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  deviceAssetManagement = self->_deviceAssetManagement;
  if (deviceAssetManagement)
  {
LABEL_6:
    SEL v7 = deviceAssetManagement;
    goto LABEL_7;
  }
  if ([(SFDeviceAssetManager *)self canUseMobileAssetSPI])
  {
    id v4 = (void *)[objc_alloc((Class)getMAAssetQueryClass[0]()) initWithType:@"com.apple.MobileAsset.SharingDeviceAssets"];
    [v4 returnTypes:1];
    SFDeviceAssetAddKeyValuePair(@"Management", @"YES", v4);
    if (![v4 queryMetaDataSync])
    {
      id v5 = [v4 results];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __54__SFDeviceAssetManager_onqueue_sharingManagementAsset__block_invoke;
      v10[3] = &unk_1E5BBEE18;
      v10[4] = self;
      [v5 enumerateObjectsUsingBlock:v10];

      id v6 = [v4 results];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __54__SFDeviceAssetManager_onqueue_sharingManagementAsset__block_invoke_2;
      v9[3] = &unk_1E5BBEE18;
      v9[4] = self;
      [v6 enumerateObjectsUsingBlock:v9];
    }
    deviceAssetManagement = self->_deviceAssetManagement;
    goto LABEL_6;
  }
  SEL v7 = 0;
LABEL_7:

  return v7;
}

void __54__SFDeviceAssetManager_onqueue_sharingManagementAsset__block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 24) attributes];
  id v5 = getASAttributeContentVersion[0]();
  id v6 = [v4 objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 integerValue];

  id v8 = [v12 attributes];
  id v9 = getASAttributeContentVersion[0]();
  id v10 = [v8 objectForKeyedSubscript:v9];
  uint64_t v11 = [v10 integerValue];

  if (v11 > v7) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), a2);
  }
}

void __54__SFDeviceAssetManager_onqueue_sharingManagementAsset__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqual:*(void *)(*(void *)(a1 + 32) + 24)] & 1) == 0
    && [v3 state] != 5)
  {
    [v3 purge:&__block_literal_global_700];
  }
}

void __54__SFDeviceAssetManager_onqueue_sharingManagementAsset__block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = asset_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Purging of old management asset completed with result %d", (uint8_t *)v4, 8u);
  }
}

- (id)onqueue_assetMappedProductTypeForProductType:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  productTypesMappingTable = self->_productTypesMappingTable;
  if (!productTypesMappingTable)
  {
    id v6 = [(SFDeviceAssetManager *)self onqueue_sharingManagementAsset];
    uint64_t v7 = [(SFDeviceAssetManager *)self hardcodedMappedProducts];
    id v8 = (void *)[v7 mutableCopy];

    id v9 = [v6 getLocalFileUrl];
    id v10 = [v9 URLByAppendingPathComponent:@"DeviceMapping.plist" isDirectory:0];
    if (v10)
    {
      uint64_t v19 = v6;
      id v21 = 0;
      uint64_t v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v10 options:0 error:&v21];
      id v12 = v21;
      if (v11)
      {
        id v20 = 0;
        __int16 v13 = [MEMORY[0x1E4F28F98] propertyListWithData:v11 options:0 format:0 error:&v20];
        id v14 = v20;

        if (v13)
        {
          [v8 addEntriesFromDictionary:v13];
          uint64_t v15 = asset_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            int v16 = [v13 count];
            *(_DWORD *)buf = 136315394;
            uint64_t v23 = "-[SFDeviceAssetManager onqueue_assetMappedProductTypeForProductType:]";
            __int16 v24 = 1024;
            int v25 = v16;
            _os_log_impl(&dword_1A5389000, v15, OS_LOG_TYPE_DEFAULT, "%s Loaded mapping table with %d entries", buf, 0x12u);
          }
        }
        else
        {
          uint64_t v15 = asset_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            -[SFDeviceAssetManager onqueue_assetMappedProductTypeForProductType:]();
          }
        }
      }
      else
      {
        __int16 v13 = asset_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[SFDeviceAssetManager onqueue_assetMappedProductTypeForProductType:]();
        }
        id v14 = v12;
      }

      id v6 = v19;
    }
    else
    {
      uint64_t v11 = asset_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SFDeviceAssetManager onqueue_assetMappedProductTypeForProductType:]();
      }
      id v14 = 0;
    }

    objc_storeStrong((id *)&self->_productTypesMappingTable, v8);
    if ([(SFDeviceAssetManager *)self useProcessLocalCache]) {
      [(SFDeviceAssetManager *)self storeProductMappingsInLocalCache:v8];
    }

    productTypesMappingTable = self->_productTypesMappingTable;
  }
  __int16 v17 = [(NSDictionary *)productTypesMappingTable objectForKeyedSubscript:v4];

  return v17;
}

- (id)hardcodedMappedProducts
{
  if (hardcodedMappedProducts_onceToken != -1) {
    dispatch_once(&hardcodedMappedProducts_onceToken, &__block_literal_global_704);
  }
  uint64_t v2 = (void *)hardcodedMappedProducts_hardcodedMappedProducts;

  return v2;
}

void __47__SFDeviceAssetManager_hardcodedMappedProducts__block_invoke()
{
  v25[30] = *MEMORY[0x1E4F143B8];
  v24[0] = @"AudioAccessory1,1";
  v24[1] = @"Device1,8194";
  v25[0] = &stru_1EF9BDC68;
  v25[1] = @"AirPods1,1";
  v24[2] = @"Device1,8195";
  v24[3] = @"Device1,8197";
  v25[2] = @"PowerBeats3,1";
  v25[3] = @"BeatsX1,1";
  v24[4] = @"Device1,8198";
  v24[5] = @"Device1,8199";
  v25[4] = @"BeatsSolo3,1";
  v25[5] = @"BeatsStudio3,1";
  v24[6] = @"Device1,8201";
  v24[7] = @"Device1,8203";
  v25[6] = @"BeatsStudio3,2";
  v25[7] = @"PowerbeatsPro1,1";
  v24[8] = @"Device1,8206";
  v24[9] = @"Device1,8207";
  v25[8] = @"AirPodsPro1,1";
  v25[9] = @"AirPods1,2";
  v24[10] = @"Device1,8209";
  v24[11] = @"Device1,65536";
  v25[10] = @"BeatsStudioBuds1,1";
  v25[11] = @"AirPods1,2";
  v24[12] = @"Device1,8205";
  v24[13] = @"AirTag1,1";
  v25[12] = @"Powerbeats4,1";
  v25[13] = @"AirTag1,1";
  v24[14] = @"Device1,8204";
  v24[15] = @"Device1,8202";
  v25[14] = @"BeatsSoloPro1,1";
  v25[15] = @"AirPodsMax1,1";
  v24[16] = @"Device1,8208";
  v24[17] = @"AudioAccessory5,1";
  v25[16] = @"BeatsX2,1";
  v25[17] = &stru_1EF9BDC68;
  uint64_t v23 = +[SFHeadphoneProduct b688];
  int v22 = [v23 bluetoothModel];
  v24[18] = v22;
  v25[18] = @"AirPods1,3";
  id v21 = +[SFHeadphoneProduct b768e];
  id v20 = [v21 bluetoothModel];
  v24[19] = v20;
  v25[19] = @"AirPods1,4";
  uint64_t v19 = +[SFHeadphoneProduct b768m];
  id v18 = [v19 bluetoothModel];
  v24[20] = v18;
  v25[20] = @"AirPods1,5";
  __int16 v17 = +[SFHeadphoneProduct b494];
  int v16 = [v17 bluetoothModel];
  v24[21] = v16;
  v25[21] = @"BeatsFitPro1,1";
  uint64_t v15 = +[SFHeadphoneProduct b698];
  id v14 = [v15 bluetoothModel];
  v24[22] = v14;
  v24[23] = @"Device1,8228";
  v25[22] = @"AirPodsPro1,2";
  v25[23] = @"AirPodsPro1,2";
  __int16 v13 = +[SFHeadphoneProduct b607];
  id v12 = [v13 bluetoothModel];
  v24[24] = v12;
  v25[24] = @"BeatsStudioBuds1,2";
  v0 = +[SFHeadphoneProduct b463];
  int v1 = [v0 bluetoothModel];
  v24[25] = v1;
  v25[25] = @"BeatsSoloBuds1,1";
  uint64_t v2 = +[SFHeadphoneProduct b453];
  id v3 = [v2 bluetoothModel];
  v24[26] = v3;
  v25[26] = @"BeatsStudioPro1,1";
  id v4 = +[SFHeadphoneProduct b465];
  uint64_t v5 = [v4 bluetoothModel];
  v24[27] = v5;
  v25[27] = @"BeatsSolo4,1";
  id v6 = +[SFHeadphoneProduct b487];
  uint64_t v7 = [v6 bluetoothModel];
  v24[28] = v7;
  v25[28] = @"BeatsPill1,2";
  id v8 = +[SFHeadphoneProduct b498];
  id v9 = [v8 bluetoothModel];
  v24[29] = v9;
  v25[29] = @"PowerbeatsPro2,1";
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:30];
  uint64_t v11 = (void *)hardcodedMappedProducts_hardcodedMappedProducts;
  hardcodedMappedProducts_hardcodedMappedProducts = v10;
}

- (id)localCacheWithFileName:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SFDeviceAssetManager *)self cacheDirectory];
  id v6 = [v5 URLByAppendingPathComponent:v4 isDirectory:0];

  id v18 = 0;
  int CanAccessURL = SFDeviceAssetProcessCanAccessURL(v6, (uint64_t)&v18);
  id v8 = v18;
  if (CanAccessURL)
  {
    id v17 = v8;
    id v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v6 options:0 error:&v17];
    id v10 = v17;

    if (v9)
    {
      id v15 = 0;
      uint64_t v16 = 0;
      uint64_t v11 = [MEMORY[0x1E4F28F98] propertyListWithData:v9 options:0 format:&v16 error:&v15];
      id v8 = v15;

      if ([v11 count])
      {
        id v12 = asset_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = [v11 count];
          *(_DWORD *)buf = 67109378;
          int v20 = v13;
          __int16 v21 = 2112;
          id v22 = v4;
          _os_log_impl(&dword_1A5389000, v12, OS_LOG_TYPE_DEFAULT, "Loaded %d %@ entries from cache", buf, 0x12u);
        }

        goto LABEL_18;
      }
    }
    else
    {
      id v8 = v10;
    }
  }
  if (!v8 || [v8 code] == -1100 || objc_msgSend(v8, "code") == 260 || objc_msgSend(v8, "code") == 4)
  {
    uint64_t v11 = 0;
    goto LABEL_19;
  }
  id v9 = asset_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[SFDeviceAssetManager localCacheWithFileName:]();
  }
  uint64_t v11 = 0;
LABEL_18:

LABEL_19:

  return v11;
}

- (void)storeEntries:(id)a3 inLocalCacheWithFileName:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = asset_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v19 = [v6 count];
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_1A5389000, v8, OS_LOG_TYPE_DEFAULT, "Persisting %d entries to %@ cache", buf, 0x12u);
  }

  id v9 = [(SFDeviceAssetManager *)self cacheDirectory];
  id v10 = [v9 URLByAppendingPathComponent:v7 isDirectory:0];

  uint64_t v17 = 0;
  uint64_t v11 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:200 options:0 error:&v17];
  id v12 = v11;
  if (v11)
  {
    id v16 = 0;
    [v11 writeToURL:v10 options:0x10000000 error:&v16];
    id v13 = v16;
    if (v13)
    {
      id v14 = v13;
      id v15 = asset_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[SFDeviceAssetManager storeEntries:inLocalCacheWithFileName:]();
      }
    }
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (BOOL)useProcessLocalCache
{
  return self->_useProcessLocalCache;
}

- (void)setUseProcessLocalCache:(BOOL)a3
{
  self->_useProcessLocalCache = a3;
}

- (NSString)networkStatus
{
  return self->_networkStatus;
}

- (void)setNetworkStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkStatus, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_cachedQueryPaths, 0);
  objc_storeStrong((id *)&self->_cacheDirectory, 0);
  objc_storeStrong((id *)&self->_cachedProductMappingsTable, 0);
  objc_storeStrong((id *)&self->_productTypesMappingTable, 0);
  objc_storeStrong((id *)&self->_reachabilityMonitor, 0);
  objc_storeStrong((id *)&self->_deviceAssetManagement, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1A5389000, log, OS_LOG_TYPE_ERROR, "Failed to find any management catalog asset", v1, 2u);
}

void __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_2_cold_2(id *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = [*a1 results];
  v4[0] = 67109120;
  v4[1] = [v3 count];
  _os_log_error_impl(&dword_1A5389000, a2, OS_LOG_TYPE_ERROR, "Found %d management catalog assets", (uint8_t *)v4, 8u);
}

void __71__SFDeviceAssetManager_onqueue_updateSharingManagementAssetIfNecessary__block_invoke_622_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A5389000, a2, OS_LOG_TYPE_ERROR, "Failed to download the new management asset with result %d", (uint8_t *)v2, 8u);
}

- (void)cacheDirectory
{
  OUTLINED_FUNCTION_3_0();
  int v1 = [v0 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1A5389000, v2, v3, "Failed to get cache directory at path %@ (%@)", v4, v5, v6, v7, v8);
}

- (void)onqueue_assetMappedProductTypeForProductType:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_1A5389000, v0, OS_LOG_TYPE_ERROR, "%s Failed to get URL to mapping file for asset %@", (uint8_t *)v1, 0x16u);
}

- (void)onqueue_assetMappedProductTypeForProductType:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_1A5389000, v0, OS_LOG_TYPE_ERROR, "%s Failed to load mapping data (%@)", (uint8_t *)v1, 0x16u);
}

- (void)onqueue_assetMappedProductTypeForProductType:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  uint64_t v4 = "-[SFDeviceAssetManager onqueue_assetMappedProductTypeForProductType:]";
  __int16 v5 = 2048;
  uint64_t v6 = [v2 length];
  __int16 v7 = 2112;
  uint64_t v8 = v1;
  _os_log_error_impl(&dword_1A5389000, v0, OS_LOG_TYPE_ERROR, "%s Failed create mappings with data of size %ld (%@)", (uint8_t *)&v3, 0x20u);
}

- (void)localCacheWithFileName:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  uint64_t v1 = [v0 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1A5389000, v2, v3, "Failed to load local cache at path %@ (%@)", v4, v5, v6, v7, v8);
}

- (void)storeEntries:inLocalCacheWithFileName:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  uint64_t v1 = [v0 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1A5389000, v2, v3, "Failed to persist local cached entries to path %@ (%@)", v4, v5, v6, v7, v8);
}

@end