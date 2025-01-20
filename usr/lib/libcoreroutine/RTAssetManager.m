@interface RTAssetManager
- (BOOL)nonUserInitiatedDownloadsAllowed;
- (RTAssetManager)init;
- (RTAssetManager)initWithDefaultsManager:(id)a3 assetProcessor:(id)a4 xpcActivityManager:(id)a5;
- (RTAssetProcessor)assetProcessor;
- (RTDarwinNotificationHelper)notificationHelper;
- (RTDefaultsManager)defaultsManager;
- (RTXPCActivityManager)xpcActivityManager;
- (id)defaultAssetDownloadOptions;
- (id)defaultCatalogDownloadOptions;
- (id)defaultXPCActivityCriteria;
- (id)latestAssetFromAssets:(id)a3;
- (void)_copyRoutineAssetFromCoreLocationConfig:(id)a3;
- (void)_downloadAsset:(id)a3 handler:(id)a4;
- (void)_finalizeAssetUpdateOperationWithError:(id)a3;
- (void)_handleAssetDownloadResult:(int64_t)a3 asset:(id)a4 handler:(id)a5;
- (void)_handleCatalogDownloadWithType:(id)a3 downloadResult:(int64_t)a4 handler:(id)a5;
- (void)_handleMetadataQueryResult:(int64_t)a3 assetQuery:(id)a4 handler:(id)a5;
- (void)_handleRoutineConfigAssetChangedNotification;
- (void)_installAsset:(id)a3 fileManager:(id)a4 handler:(id)a5;
- (void)_performUpdateOfAssetsWithTypeAssetType:(id)a3 handler:(id)a4;
- (void)_setupRoutineConfigAssetChangedNotification;
- (void)_shutdownWithHandler:(id)a3;
- (void)copyRoutineAssetFromCoreLocationConfigWithHandler:(id)a3;
- (void)forceUpdateAssetMetadataWithHandler:(id)a3;
- (void)handleRoutineConfigAssetChangedNotification;
- (void)performUpdateOfAssetsWithTypeAssetType:(id)a3 handler:(id)a4;
- (void)setAssetProcessor:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setNotificationHelper:(id)a3;
- (void)setXpcActivityManager:(id)a3;
- (void)setupRoutineConfigAssetChangedNotification;
- (void)updateAssetServerURL:(id)a3 assetType:(id)a4 handler:(id)a5;
@end

@implementation RTAssetManager

- (RTAssetManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_assetProcessor_xpcActivityManager_);
}

- (RTAssetManager)initWithDefaultsManager:(id)a3 assetProcessor:(id)a4 xpcActivityManager:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (!v10)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    LOWORD(location[0]) = 0;
    v25 = "Invalid parameter not satisfying: defaultsManager";
LABEL_15:
    _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, v25, (uint8_t *)location, 2u);
    goto LABEL_16;
  }
  if (!v11)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    LOWORD(location[0]) = 0;
    v25 = "Invalid parameter not satisfying: assetProcessor";
    goto LABEL_15;
  }
  if (!v12)
  {
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      v25 = "Invalid parameter not satisfying: xpcActivityManager";
      goto LABEL_15;
    }
LABEL_16:

    v23 = 0;
    goto LABEL_17;
  }
  v30.receiver = self;
  v30.super_class = (Class)RTAssetManager;
  v14 = [(RTNotifier *)&v30 init];
  p_isa = (id *)&v14->super.super.super.isa;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_defaultsManager, a3);
    objc_storeStrong(p_isa + 4, a4);
    objc_storeStrong(p_isa + 7, a5);
    v16 = [p_isa[5] objectForKey:@"LastAssetContentVersionDownloaded"];
    if (v16)
    {
      v17 = objc_opt_new();
      [v17 setObject:v16 forKeyedSubscript:@"contentVersion"];
      id v18 = [NSString alloc];
      v19 = (void *)[v18 initWithCString:RTAnalyticsEventAssetContentVersion encoding:1];
      log_analytics_submission(v19, v17);
      v20 = [NSString stringWithFormat:@"com.apple.%@", v19];
      AnalyticsSendEvent();
    }
    v21 = [p_isa defaultXPCActivityCriteria];
    objc_initWeak(location, p_isa);
    id v22 = p_isa[7];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __76__RTAssetManager_initWithDefaultsManager_assetProcessor_xpcActivityManager___block_invoke;
    v27[3] = &unk_1E6B928D0;
    v28[1] = (id)a2;
    objc_copyWeak(v28, location);
    [v22 registerActivityWithIdentifier:@"com.apple.routined.assets" criteria:v21 handler:v27];
    [p_isa setupRoutineConfigAssetChangedNotification];
    objc_destroyWeak(v28);
    objc_destroyWeak(location);
  }
  self = p_isa;
  v23 = self;
LABEL_17:

  return v23;
}

void __76__RTAssetManager_initWithDefaultsManager_assetProcessor_xpcActivityManager___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, error, %@", buf, 0x16u);
    }
    if (v5) {
      v5[2](v5, v6);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __76__RTAssetManager_initWithDefaultsManager_assetProcessor_xpcActivityManager___block_invoke_286;
      v10[3] = &unk_1E6B90C18;
      id v11 = v5;
      [WeakRetained copyRoutineAssetFromCoreLocationConfigWithHandler:v10];
    }
    else if (v5)
    {
      v5[2](v5, 0);
    }
  }
}

uint64_t __76__RTAssetManager_initWithDefaultsManager_assetProcessor_xpcActivityManager___block_invoke_286(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)copyRoutineAssetFromCoreLocationConfigWithHandler:(id)a3
{
  id v4 = a3;
  v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__RTAssetManager_copyRoutineAssetFromCoreLocationConfigWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __68__RTAssetManager_copyRoutineAssetFromCoreLocationConfigWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _copyRoutineAssetFromCoreLocationConfig:*(void *)(a1 + 40)];
}

- (void)setupRoutineConfigAssetChangedNotification
{
  v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__RTAssetManager_setupRoutineConfigAssetChangedNotification__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __60__RTAssetManager_setupRoutineConfigAssetChangedNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupRoutineConfigAssetChangedNotification];
}

- (void)_setupRoutineConfigAssetChangedNotification
{
  v3 = (RTDarwinNotificationHelper *)objc_opt_new();
  notificationHelper = self->_notificationHelper;
  self->_notificationHelper = v3;

  objc_initWeak(&location, self);
  v5 = self->_notificationHelper;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__RTAssetManager__setupRoutineConfigAssetChangedNotification__block_invoke;
  v6[3] = &unk_1E6B91900;
  objc_copyWeak(&v7, &location);
  [(RTDarwinNotificationHelper *)v5 addObserverForNotificationName:@"kRoutineConfigAssetChangedNotification" handler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __61__RTAssetManager__setupRoutineConfigAssetChangedNotification__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained handleRoutineConfigAssetChangedNotification];
    id WeakRetained = v2;
  }
}

- (void)_shutdownWithHandler:(id)a3
{
  id v5 = a3;
  [(RTXPCActivityManager *)self->_xpcActivityManager unregisterActivityWithIdentifier:@"com.apple.routined.assets" handler:0];
  id v4 = v5;
  if (v5)
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
    id v4 = v5;
  }
}

- (void)_copyRoutineAssetFromCoreLocationConfig:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void))a3;
  uint64_t v24 = 0;
  id v6 = (void *)CLCopyRoutineAssetSettings();
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      v26 = v9;
      __int16 v27 = 1024;
      *(_DWORD *)v28 = HIDWORD(v24);
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = v24;
      __int16 v29 = 2112;
      objc_super v30 = v6;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@ compatibilityVersion %d, contentVersion %d, received RoutineAsset, %@, ", buf, 0x22u);
    }
    id v10 = (void *)MEMORY[0x1E4F1CB10];
    id v11 = [MEMORY[0x1E4F28CB8] pathInCacheDirectory:@"defaults.plist"];
    id v12 = [v10 fileURLWithPath:v11 isDirectory:0];

    id v23 = 0;
    char v13 = [v6 writeToURL:v12 error:&v23];
    id v14 = v23;
    if (v13)
    {
      defaultsManager = self->_defaultsManager;
      uint64_t v16 = [v12 path];
      [(RTDefaultsManager *)defaultsManager addDomain:v16];
      id v17 = 0;
    }
    else
    {
      uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v22 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v26 = v22;
        __int16 v27 = 2112;
        *(void *)v28 = v14;
        _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%@, Encountered error in creating assets defaults.plist file: %@", buf, 0x16u);
      }
      id v17 = v14;
    }

    ((void (**)(id, id))v5)[2](v5, v17);
  }
  else
  {
    if (v8)
    {
      id v18 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v26 = v18;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, Received a NULL  CFDictionaryRef routineAssetSettingsDict", buf, 0xCu);
    }
    v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F5CFE8];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v32[0] = @"CFDictionaryRef routineAssetSettingsDict from CL is NULL";
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    id v6 = [v19 errorWithDomain:v20 code:7 userInfo:v21];

    ((void (**)(id, void *))v5)[2](v5, v6);
  }
}

- (void)handleRoutineConfigAssetChangedNotification
{
  v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__RTAssetManager_handleRoutineConfigAssetChangedNotification__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __61__RTAssetManager_handleRoutineConfigAssetChangedNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleRoutineConfigAssetChangedNotification];
}

- (void)_handleRoutineConfigAssetChangedNotification
{
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityDefaults);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "received Routine Config Asset change notification", buf, 2u);
  }

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__RTAssetManager__handleRoutineConfigAssetChangedNotification__block_invoke;
  v5[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v5[4] = a2;
  [(RTAssetManager *)self _copyRoutineAssetFromCoreLocationConfig:v5];
}

void __62__RTAssetManager__handleRoutineConfigAssetChangedNotification__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, error %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)performUpdateOfAssetsWithTypeAssetType:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__RTAssetManager_performUpdateOfAssetsWithTypeAssetType_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __65__RTAssetManager_performUpdateOfAssetsWithTypeAssetType_handler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__RTAssetManager_performUpdateOfAssetsWithTypeAssetType_handler___block_invoke_2;
  v3[3] = &unk_1E6B92690;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 48);
  [v1 _performUpdateOfAssetsWithTypeAssetType:v2 handler:v3];
}

void __65__RTAssetManager_performUpdateOfAssetsWithTypeAssetType_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) _finalizeAssetUpdateOperationWithError:];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)_performUpdateOfAssetsWithTypeAssetType:(id)a3 handler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = (void (**)(void, void))v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[RTAssetManager _performUpdateOfAssetsWithTypeAssetType:handler:]";
    __int16 v29 = 1024;
    LODWORD(v30) = 226;
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: assetType (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    id v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[RTAssetManager _performUpdateOfAssetsWithTypeAssetType:handler:]";
      __int16 v29 = 1024;
      LODWORD(v30) = 227;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  id v11 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"LastAssetUpdateDate"];
  id v12 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"LastSuccessfulAssetUpdateDate"];
  id v13 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = [v11 stringFromDate];
    id v15 = [v12 stringFromDate];
    *(_DWORD *)buf = 138412546;
    v28 = v14;
    __int16 v29 = 2112;
    objc_super v30 = v15;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "Checking for new assets to download, date of last attempt, %@, last success, %@", buf, 0x16u);
  }
  if (v8)
  {
    if (v6)
    {
      uint64_t v16 = [(RTAssetManager *)self defaultCatalogDownloadOptions];
      id v17 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "Starting catalog download.", buf, 2u);
      }

      id v18 = (void *)MEMORY[0x1E4F77FB0];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __66__RTAssetManager__performUpdateOfAssetsWithTypeAssetType_handler___block_invoke;
      v22[3] = &unk_1E6B92F18;
      v22[4] = self;
      id v23 = v6;
      uint64_t v24 = v8;
      [v18 startCatalogDownload:v23 options:v16 then:v22];
    }
    else
    {
      uint64_t v16 = [NSString stringWithFormat:@"Asset type is nil, returning."];
      v19 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v16;
        _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      uint64_t v25 = *MEMORY[0x1E4F28568];
      v26 = v16;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTAssetManagerErrorDomain" code:1 userInfo:v20];
      ((void (**)(void, void *))v8)[2](v8, v21);
    }
  }
}

void __66__RTAssetManager__performUpdateOfAssetsWithTypeAssetType_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__RTAssetManager__performUpdateOfAssetsWithTypeAssetType_handler___block_invoke_2;
  v6[3] = &unk_1E6B90C40;
  id v5 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  uint64_t v9 = a2;
  id v8 = *(id *)(a1 + 48);
  dispatch_async(v4, v6);
}

uint64_t __66__RTAssetManager__performUpdateOfAssetsWithTypeAssetType_handler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCatalogDownloadWithType:*(void *)(a1 + 40) downloadResult:*(void *)(a1 + 56) handler:*(void *)(a1 + 48)];
}

- (id)defaultXPCActivityCriteria
{
  uint64_t v2 = [[RTXPCActivityCriteria alloc] initWithInterval:1 gracePeriod:0 priority:0 requireNetworkConnectivity:0 requireInexpensiveNetworkConnectivity:1 networkTransferDirection:0 allowBattery:86400.0 powerNap:43200.0];

  return v2;
}

- (id)defaultCatalogDownloadOptions
{
  uint64_t v2 = objc_opt_new();
  [v2 setDiscretionary:0];

  return v2;
}

- (id)defaultAssetDownloadOptions
{
  uint64_t v2 = objc_opt_new();
  [v2 setAllowsCellularAccess:0];
  [v2 setDiscretionary:0];

  return v2;
}

- (BOOL)nonUserInitiatedDownloadsAllowed
{
  return MANonUserInitiatedDownloadsAllowed();
}

- (void)_handleCatalogDownloadWithType:(id)a3 downloadResult:(int64_t)a4 handler:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = (char *)a3;
  id v9 = a5;
  id v10 = (void (**)(void, void))v9;
  if (!v8)
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[RTAssetManager _handleCatalogDownloadWithType:downloadResult:handler:]";
      __int16 v38 = 1024;
      int v39 = 312;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: assetType (in %s:%d)", buf, 0x12u);
    }

    if (v10)
    {
      id v11 = [NSString stringWithFormat:@"Asset type is nil, returning."];
      id v17 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = (const char *)v11;
        _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      uint64_t v34 = *MEMORY[0x1E4F28568];
      v35 = v11;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = 1;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (!v9)
  {
LABEL_14:
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[RTAssetManager _handleCatalogDownloadWithType:downloadResult:handler:]";
      __int16 v38 = 1024;
      int v39 = 313;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
    goto LABEL_25;
  }
  if (a4)
  {
    id v11 = [NSString stringWithFormat:@"The catalog download for asset type, %@, failed with result, %lu.", v8, a4];
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = (const char *)v11;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    uint64_t v32 = *MEMORY[0x1E4F28568];
    v33 = v11;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = 4;
LABEL_13:
    id v18 = [v14 errorWithDomain:@"RTAssetManagerErrorDomain" code:v15 userInfo:v13];
    ((void (**)(void, void *))v10)[2](v10, v18);

    goto LABEL_25;
  }
  v19 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "Catalog download finished.", buf, 2u);
  }

  uint64_t v20 = [objc_alloc(MEMORY[0x1E4F77FB8]) initWithType:v8];
  if (v20)
  {
    v21 = (void *)v20;
    id v22 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v8;
      _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "Querying metadata for asset type %@.", buf, 0xCu);
    }

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __72__RTAssetManager__handleCatalogDownloadWithType_downloadResult_handler___block_invoke;
    v27[3] = &unk_1E6B92F18;
    void v27[4] = self;
    id v11 = v21;
    v28 = v11;
    __int16 v29 = v10;
    [v11 queryMetaData:v27];
  }
  else
  {
    id v23 = [NSString stringWithFormat:@"Invalid asset query."];
    uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v23;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    uint64_t v30 = *MEMORY[0x1E4F28568];
    uint64_t v31 = v23;
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTAssetManagerErrorDomain" code:2 userInfo:v25];
    ((void (**)(void, void *))v10)[2](v10, v26);

    id v11 = 0;
  }
LABEL_25:
}

void __72__RTAssetManager__handleCatalogDownloadWithType_downloadResult_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__RTAssetManager__handleCatalogDownloadWithType_downloadResult_handler___block_invoke_2;
  v6[3] = &unk_1E6B90C40;
  id v5 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  uint64_t v9 = a2;
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  dispatch_async(v4, v6);
}

uint64_t __72__RTAssetManager__handleCatalogDownloadWithType_downloadResult_handler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleMetadataQueryResult:*(void *)(a1 + 56) assetQuery:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_handleMetadataQueryResult:(int64_t)a3 assetQuery:(id)a4 handler:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = (void (**)(void, void))v9;
  if (v8)
  {
    if (v9)
    {
      if (a3)
      {
        id v11 = [NSString stringWithFormat:@"The asset query failed with result, %lu", a3];
        id v12 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v36 = (const char *)v11;
          _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        uint64_t v31 = *MEMORY[0x1E4F28568];
        uint64_t v32 = v11;
        id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        id v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v15 = 5;
      }
      else
      {
        v19 = [v8 results];
        uint64_t v20 = [v19 count];

        if (v20)
        {
          v21 = [v8 results];
          id v11 = [(RTAssetManager *)self latestAssetFromAssets:v21];

          if (v11)
          {
            id v22 = [v11 attributes];
            id v13 = [v22 objectForKey:*MEMORY[0x1E4F77F20]];

            id v23 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              v36 = (const char *)[v13 unsignedIntegerValue];
              _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "Chose asset with version number %lu", buf, 0xCu);
            }

            [(RTAssetManager *)self _downloadAsset:v11 handler:v10];
            goto LABEL_15;
          }
          id v13 = [NSString stringWithFormat:@"No assets available to download."];
          uint64_t v25 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v36 = (const char *)v13;
            _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }

          uint64_t v27 = *MEMORY[0x1E4F28568];
          v28 = v13;
          id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
          v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTAssetManagerErrorDomain" code:8 userInfo:v18];
          ((void (**)(void, void *))v10)[2](v10, v26);

LABEL_14:
LABEL_15:

          goto LABEL_18;
        }
        id v11 = [NSString stringWithFormat:@"No results for query."];
        uint64_t v24 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v36 = (const char *)v11;
          _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        uint64_t v29 = *MEMORY[0x1E4F28568];
        uint64_t v30 = v11;
        id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        id v14 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v15 = 8;
      }
LABEL_13:
      id v18 = [v14 errorWithDomain:@"RTAssetManagerErrorDomain" code:v15 userInfo:v13];
      ((void (**)(void, void *))v10)[2](v10, v18);
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[RTAssetManager _handleMetadataQueryResult:assetQuery:handler:]";
      __int16 v37 = 1024;
      int v38 = 374;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: assetQuery (in %s:%d)", buf, 0x12u);
    }

    if (v10)
    {
      id v11 = [NSString stringWithFormat:@"Invalid asset query."];
      id v17 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = (const char *)v11;
        _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      uint64_t v33 = *MEMORY[0x1E4F28568];
      uint64_t v34 = v11;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = 2;
      goto LABEL_13;
    }
  }
  id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[RTAssetManager _handleMetadataQueryResult:assetQuery:handler:]";
    __int16 v37 = 1024;
    int v38 = 375;
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }
LABEL_18:
}

- (id)latestAssetFromAssets:(id)a3
{
  uint64_t v3 = [a3 sortedArrayUsingComparator:&__block_literal_global_20];
  id v4 = [v3 lastObject];

  return v4;
}

uint64_t __40__RTAssetManager_latestAssetFromAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 attributes];
  uint64_t v6 = *MEMORY[0x1E4F77F20];
  id v7 = [v5 objectForKey:*MEMORY[0x1E4F77F20]];

  id v8 = [v4 attributes];

  id v9 = [v8 objectForKey:v6];

  uint64_t v10 = [v7 compare:v9];
  return v10;
}

- (void)_finalizeAssetUpdateOperationWithError:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  [(RTDefaultsManager *)self->_defaultsManager setObject:v5 forKey:@"LastAssetUpdateDate"];
  if (v4)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Error while updating assets, %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    [(RTDefaultsManager *)self->_defaultsManager setObject:v5 forKey:@"LastSuccessfulAssetUpdateDate"];
  }
  id v7 = [(RTDefaultsManager *)self->_defaultsManager objectForKey:@"LastSuccessfulAssetUpdateDate"];
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v7 stringFromDate];
    int v10 = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v9;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "Finished asset update, date of last attempt, %@, last success, %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)_downloadAsset:(id)a3 handler:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void))v7;
  if (!v6)
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v34 = "-[RTAssetManager _downloadAsset:handler:]";
      __int16 v35 = 1024;
      int v36 = 473;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: asset (in %s:%d)", buf, 0x12u);
    }

    if (v8)
    {
      __int16 v12 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "An asset must be provided to download.", buf, 2u);
      }

      uint64_t v31 = *MEMORY[0x1E4F28568];
      uint64_t v32 = @"An asset must be provided to download.";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = 0;
      goto LABEL_19;
    }
LABEL_14:
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v34 = "-[RTAssetManager _downloadAsset:handler:]";
      __int16 v35 = 1024;
      int v36 = 474;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
    goto LABEL_20;
  }
  if (!v7) {
    goto LABEL_14;
  }
  if (![(RTAssetManager *)self nonUserInitiatedDownloadsAllowed])
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "User disallwed non-user initiated downloads.", buf, 2u);
    }

    uint64_t v29 = *MEMORY[0x1E4F28588];
    uint64_t v30 = @"User disallwed non-user initiated downloads.";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = 7;
LABEL_19:
    id v17 = [v14 errorWithDomain:@"RTAssetManagerErrorDomain" code:v15 userInfo:v13];
    ((void (**)(void, void *))v8)[2](v8, v17);

LABEL_20:
    goto LABEL_21;
  }
  if ([v6 state] == 2)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "Asset is present on disk, attempting to install now.", buf, 2u);
    }

    int v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    [(RTAssetManager *)self _installAsset:v6 fileManager:v10 handler:v8];
  }
  else
  {
    v26 = 0;
    if ([v6 spaceCheck:&v26])
    {
      id v18 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v34 = v26;
        _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "Space check succeeded, requires %ld bytes.", buf, 0xCu);
      }

      [v6 attachProgressCallBack:&__block_literal_global_346];
      int v10 = [(RTAssetManager *)self defaultAssetDownloadOptions];
      v19 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "Asset is not present on disk, starting download now.", buf, 2u);
      }

      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __41__RTAssetManager__downloadAsset_handler___block_invoke_347;
      v23[3] = &unk_1E6B92F18;
      v23[4] = self;
      id v24 = v6;
      uint64_t v25 = v8;
      [v24 startDownload:v10 then:v23];
    }
    else
    {
      int v10 = [NSString stringWithFormat:@"Insufficient space to download the asset, requires %ld bytes.", v26];
      uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = v10;
        _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }

      uint64_t v27 = *MEMORY[0x1E4F28568];
      v28 = v10;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      id v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTAssetManagerErrorDomain" code:6 userInfo:v21];
      ((void (**)(void, void *))v8)[2](v8, v22);
    }
  }

LABEL_21:
}

void __41__RTAssetManager__downloadAsset_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  [v2 expectedTimeRemaining];
  if (v3 > 0.0)
  {
    double v4 = (double)[v2 totalWritten];
    double v5 = v4 / (double)[v2 totalExpected];
    if (v5 > 0.0)
    {
      id v6 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = 134217984;
        double v8 = v5;
        _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "progress: %lf", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

void __41__RTAssetManager__downloadAsset_handler___block_invoke_347(uint64_t a1, uint64_t a2)
{
  double v4 = [*(id *)(a1 + 32) queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__RTAssetManager__downloadAsset_handler___block_invoke_2;
  v6[3] = &unk_1E6B90C40;
  double v5 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  uint64_t v9 = a2;
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  dispatch_async(v4, v6);
}

uint64_t __41__RTAssetManager__downloadAsset_handler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAssetDownloadResult:*(void *)(a1 + 56) asset:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_handleAssetDownloadResult:(int64_t)a3 asset:(id)a4 handler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  int v10 = (void (**)(void, void))v9;
  if (!v8)
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v25 = "-[RTAssetManager _handleAssetDownloadResult:asset:handler:]";
      __int16 v26 = 1024;
      int v27 = 553;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: asset (in %s:%d)", buf, 0x12u);
    }

    if (v10)
    {
      id v11 = [NSString stringWithFormat:@"An asset must be provided to download."];
      id v17 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = (const char *)v11;
        _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }

      uint64_t v22 = *MEMORY[0x1E4F28568];
      id v23 = v11;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = 0;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (!v9)
  {
LABEL_14:
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v25 = "-[RTAssetManager _handleAssetDownloadResult:asset:handler:]";
      __int16 v26 = 1024;
      int v27 = 554;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
    goto LABEL_19;
  }
  if (a3)
  {
    id v11 = [NSString stringWithFormat:@"The asset downlaod failed with result, %ld", a3];
    __int16 v12 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = (const char *)v11;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21 = v11;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = 4;
LABEL_13:
    id v18 = [v14 errorWithDomain:@"RTAssetManagerErrorDomain" code:v15 userInfo:v13];
    ((void (**)(void, void *))v10)[2](v10, v18);

    goto LABEL_19;
  }
  v19 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "Asset finished downloaded, attempting to install now.", buf, 2u);
  }

  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  [(RTAssetManager *)self _installAsset:v8 fileManager:v11 handler:v10];
LABEL_19:
}

- (void)_installAsset:(id)a3 fileManager:(id)a4 handler:(id)a5
{
  v106[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *))a5;
  if (v11)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v92 = "-[RTAssetManager _installAsset:fileManager:handler:]";
      __int16 v93 = 1024;
      LODWORD(v94) = 594;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

    if (v9)
    {
LABEL_3:
      if (v10) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v92 = "-[RTAssetManager _installAsset:fileManager:handler:]";
    __int16 v93 = 1024;
    LODWORD(v94) = 595;
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: asset (in %s:%d)", buf, 0x12u);
  }

  if (v10)
  {
LABEL_4:
    if (!v11) {
      goto LABEL_44;
    }
LABEL_15:
    if (v9)
    {
      if (!v10)
      {
        v45 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v103 = *MEMORY[0x1E4F28568];
        v104 = @"fileManager cannot be nil";
        v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
        uint64_t v15 = [v45 errorWithDomain:@"RTAssetManagerErrorDomain" code:7 userInfo:v46];

        v47 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v58 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v92 = v58;
          __int16 v93 = 2112;
          id v94 = v15;
          _os_log_error_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);
        }
        v11[2](v11, v15);
        goto LABEL_43;
      }
      uint64_t v15 = [v9 getLocalFileUrl];
      uint64_t v16 = [v9 assetType];
      int v17 = [v16 isEqualToString:@"com.apple.MobileAsset.routined.defaults"];

      if (v17)
      {
        uint64_t v18 = [v15 URLByAppendingPathComponent:@"defaults.plist"];

        uint64_t v15 = (void *)v18;
      }
      v19 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = [v15 path];
        v21 = [v9 attributes];
        uint64_t v22 = [v21 objectForKey:*MEMORY[0x1E4F77F20]];
        int v23 = [v22 unsignedIntegerValue];
        *(_DWORD *)buf = 138412546;
        v92 = v20;
        __int16 v93 = 1024;
        LODWORD(v94) = v23;
        _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "Asset, located at %@, with content version %u is downloaded, installing now.", buf, 0x12u);
      }
      id v24 = [v15 path];
      if ([v10 fileExistsAtPath:v24])
      {
        uint64_t v25 = [v15 path];
        int v26 = [v10 isReadableFileAtPath:v25];

        if (v26)
        {
          int v27 = [MEMORY[0x1E4F28CB8] pathInCacheDirectory:@"assets.plist"];
          uint64_t v28 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v92 = v27;
            _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "Path to raw assets in cache directory: %@", buf, 0xCu);
          }

          if (!v27)
          {
            v51 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
            if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v92 = (const char *)@"assets.plist";
              _os_log_fault_impl(&dword_1D9BFA000, v51, OS_LOG_TYPE_FAULT, "pathToRawAssetsInCacheDirectory is nil for file name: %@, cannot continue with install.", buf, 0xCu);
            }

            id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v101 = *MEMORY[0x1E4F28568];
            v102 = @"pathToRawAssetsInCacheDirectory is nil";
            uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
            uint64_t v32 = (void *)[v52 initWithDomain:@"RTAssetManagerErrorDomain" code:9 userInfo:v30];
            v11[2](v11, v32);
            goto LABEL_68;
          }
          uint64_t v29 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v27 isDirectory:0];
          uint64_t v30 = v29;
          if (v29)
          {
            uint64_t v31 = [v29 path];
            if (!v31)
            {
              v55 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
              if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v92 = v27;
                _os_log_fault_impl(&dword_1D9BFA000, v55, OS_LOG_TYPE_FAULT, "urlToRawAssetsInCacheDirectory.path is nil for asset path: %@, cannot continue with install.", buf, 0xCu);
              }

              id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v97 = *MEMORY[0x1E4F28568];
              v98 = @"urlToRawAssetsInCacheDirectory.path is nil";
              id v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
              v57 = (void *)[v56 initWithDomain:@"RTAssetManagerErrorDomain" code:9 userInfo:v41];
              v11[2](v11, v57);

              uint64_t v32 = 0;
              goto LABEL_67;
            }
            uint64_t v32 = (void *)v31;
            if ([v10 fileExistsAtPath:v31])
            {
              v84 = v32;
              uint64_t v33 = (void *)MEMORY[0x1E4F1C9B8];
              uint64_t v34 = [v30 absoluteString];
              __int16 v35 = [v33 dataWithContentsOfFile:v34];

              int v36 = (void *)MEMORY[0x1E4F1C9B8];
              uint64_t v37 = [v15 path];
              uint64_t v38 = [v36 dataWithContentsOfFile:v37];

              v77 = (void *)v38;
              v79 = v35;
              LODWORD(v37) = [v35 isEqualToData:v38];
              uint64_t v39 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
              BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);
              if (v37)
              {
                if (v40)
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_INFO, "Data for the asset to be installed matched what was on disk, skipping installation", buf, 2u);
                }

                v11[2](v11, 0);
                id v41 = 0;
                uint64_t v32 = v84;
LABEL_60:

LABEL_67:
LABEL_68:

                goto LABEL_42;
              }
              if (v40)
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D9BFA000, v39, OS_LOG_TYPE_INFO, "Data for the asset to be installed did NOT match what was on disk, continuing installation", buf, 2u);
              }

              id v88 = 0;
              uint64_t v32 = v84;
              [v10 removeItemAtPath:v84 error:&v88];
              id v59 = v88;
              if (v59)
              {
                id v41 = v59;
                v60 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
                if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v92 = (const char *)v84;
                  __int16 v93 = 2112;
                  id v94 = v41;
                  _os_log_error_impl(&dword_1D9BFA000, v60, OS_LOG_TYPE_ERROR, "Could not delete asset at path, %@, error, %@.", buf, 0x16u);
                }

                v11[2](v11, v41);
                goto LABEL_60;
              }
            }
            v61 = [v15 path];
            id v87 = 0;
            [v10 copyItemAtPath:v61 toPath:v32 error:&v87];
            id v41 = v87;

            if (!v41)
            {
              v63 = (void *)MEMORY[0x1E4F1CB10];
              v64 = [MEMORY[0x1E4F28CB8] pathInCacheDirectory:@"defaults.plist"];
              v65 = [v63 fileURLWithPath:v64 isDirectory:0];

              assetProcessor = self->_assetProcessor;
              v85 = v65;
              v66 = [v65 path];
              id v86 = 0;
              [(RTAssetProcessor *)assetProcessor processAssetsAtPath:v32 intoPath:v66 outError:&v86];
              id v41 = v86;

              if (v41)
              {
                v67 = v85;
                v68 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
                if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                {
                  v83 = [v85 path];
                  *(_DWORD *)buf = 138412802;
                  v92 = (const char *)v32;
                  __int16 v93 = 2112;
                  id v94 = v83;
                  __int16 v95 = 2112;
                  id v96 = v41;
                  _os_log_error_impl(&dword_1D9BFA000, v68, OS_LOG_TYPE_ERROR, "Error processing asset at path, %@, into path, %@, error, %@.", buf, 0x20u);
                }
                v11[2](v11, v41);
              }
              else
              {
                defaultsManager = self->_defaultsManager;
                v69 = [v85 path];
                [(RTDefaultsManager *)defaultsManager addDomain:v69];

                v70 = [v9 attributes];
                uint64_t v82 = [v70 objectForKey:*MEMORY[0x1E4F77F20]];

                v71 = (void *)v82;
                [(RTDefaultsManager *)self->_defaultsManager setObject:v82 forKey:@"LastAssetContentVersionDownloaded"];
                if (v82)
                {
                  v78 = objc_opt_new();
                  [v78 setObject:v82 forKeyedSubscript:@"contentVersion"];
                  id v72 = [NSString alloc];
                  v73 = (void *)[v72 initWithCString:RTAnalyticsEventAssetContentVersion encoding:1];
                  log_analytics_submission(v73, v78);
                  v74 = [NSString stringWithFormat:@"com.apple.%@", v73];
                  AnalyticsSendEvent();

                  v71 = (void *)v82;
                }
                v75 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
                if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D9BFA000, v75, OS_LOG_TYPE_INFO, "Asset installed.", buf, 2u);
                }

                v11[2](v11, 0);
                v67 = v85;
              }

              goto LABEL_67;
            }
            v62 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              v76 = [v15 path];
              *(_DWORD *)buf = 138412802;
              v92 = v76;
              __int16 v93 = 2112;
              id v94 = v32;
              __int16 v95 = 2112;
              id v96 = v41;
              _os_log_error_impl(&dword_1D9BFA000, v62, OS_LOG_TYPE_ERROR, "Could not copy asset at path, %@, to path, %@, error, %@.", buf, 0x20u);
            }
          }
          else
          {
            v53 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v92 = v27;
              _os_log_fault_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_FAULT, "urlToRawAssetsInCacheDirectory is nil for asset path: %@, cannot continue with install.", buf, 0xCu);
            }

            id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v99 = *MEMORY[0x1E4F28568];
            v100 = @"urlToRawAssetsInCacheDirectory is nil";
            uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
            id v41 = (id)[v54 initWithDomain:@"RTAssetManagerErrorDomain" code:9 userInfo:v32];
          }
          v11[2](v11, v41);
          goto LABEL_67;
        }
      }
      else
      {
      }
      uint64_t v89 = *MEMORY[0x1E4F28568];
      v48 = NSString;
      v49 = [v15 path];
      v50 = [v48 stringWithFormat:@"File not readable or path does not exist, %@.", v49];
      v90 = v50;
      int v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];

      v43 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v44 = 3;
    }
    else
    {
      uint64_t v15 = [NSString stringWithFormat:@"An asset must be provided to download."];
      v42 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v92 = (const char *)v15;
        _os_log_error_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      uint64_t v105 = *MEMORY[0x1E4F28568];
      v106[0] = v15;
      int v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:&v105 count:1];
      v43 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v44 = 0;
    }
    uint64_t v30 = [v43 errorWithDomain:@"RTAssetManagerErrorDomain" code:v44 userInfo:v27];
    v11[2](v11, v30);
LABEL_42:

LABEL_43:
    goto LABEL_44;
  }
LABEL_12:
  uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v92 = "-[RTAssetManager _installAsset:fileManager:handler:]";
    __int16 v93 = 1024;
    LODWORD(v94) = 596;
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fileManager (in %s:%d)", buf, 0x12u);
  }

  if (v11) {
    goto LABEL_15;
  }
LABEL_44:
}

- (void)forceUpdateAssetMetadataWithHandler:(id)a3
{
}

- (void)updateAssetServerURL:(id)a3 assetType:(id)a4 handler:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (char *)a4;
  id v9 = (void (**)(id, void *))a5;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315394;
      uint64_t v20 = "-[RTAssetManager updateAssetServerURL:assetType:handler:]";
      __int16 v21 = 1024;
      LODWORD(v22) = 752;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: assetType (in %s:%d)", (uint8_t *)&v19, 0x12u);
    }

    if (v9)
    {
      uint64_t v15 = [NSString stringWithFormat:@"Invalid asset type."];
      uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v19 = 138412290;
        uint64_t v20 = (const char *)v15;
        _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);
      }

      uint64_t v23 = *MEMORY[0x1E4F28568];
      v24[0] = v15;
      int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTAssetManagerErrorDomain" code:1 userInfo:v17];
      v9[2](v9, v18);

      goto LABEL_18;
    }
LABEL_16:
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315394;
      uint64_t v20 = "-[RTAssetManager updateAssetServerURL:assetType:handler:]";
      __int16 v21 = 1024;
      LODWORD(v22) = 753;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v19, 0x12u);
    }
LABEL_18:

    goto LABEL_19;
  }
  id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v19 = 136315394;
    uint64_t v20 = "-[RTAssetManager updateAssetServerURL:assetType:handler:]";
    __int16 v21 = 1024;
    LODWORD(v22) = 751;
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url (in %s:%d)", (uint8_t *)&v19, 0x12u);
  }

  if (!v8) {
    goto LABEL_10;
  }
LABEL_3:
  if (!v9) {
    goto LABEL_16;
  }
  id v10 = [v7 absoluteString];
  uint64_t v11 = MEMORY[0x1E016CAE0](v8, v10);

  __int16 v12 = _rt_log_facility_get_os_log(RTLogFacilityAsset);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412546;
    uint64_t v20 = v8;
    __int16 v21 = 2048;
    uint64_t v22 = v11;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "Setting mobile asset server to %@, status, %lld", (uint8_t *)&v19, 0x16u);
  }

  v9[2](v9, 0);
LABEL_19:
}

- (RTAssetProcessor)assetProcessor
{
  return self->_assetProcessor;
}

- (void)setAssetProcessor:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (void)setXpcActivityManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_notificationHelper, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);

  objc_storeStrong((id *)&self->_assetProcessor, 0);
}

@end