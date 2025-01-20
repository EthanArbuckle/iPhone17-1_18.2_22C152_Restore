@interface RCConfigurationManager
- (BOOL)_areAllConfigurationResourcesAvailable:(id)a3 requestKeys:(id)a4;
- (BOOL)_areAllConfigurationResourcesInvalid:(id)a3 allowedToReachEndpoint:(BOOL)a4 configurationSettings:(id)a5 requestKeys:(id)a6;
- (BOOL)_isAllowedToReachEndpointWithSettings:(id)a3 configurationResource:(id)a4 endpointURL:(id)a5;
- (BOOL)_isValidConfigurationResource:(id)a3 allowedToReachEndpoint:(BOOL)a4 useBackgroundRefreshRate:(BOOL)a5 userID:(id)a6 storefrontID:(id)a7 cachePolicy:(id)a8;
- (NSMutableArray)runningOperations;
- (NSMutableDictionary)backgroundURLSessionHandlers;
- (NSMutableDictionary)configResourceByRequestKey;
- (NSURL)contentDirectoryURL;
- (RCAsyncSerialQueue)configRequestSerialQueue;
- (RCConfigurationManager)initWithContentDirectoryURL:(id)a3;
- (RCConfigurationSettings)configurationSettings;
- (RCDeviceInfo)deviceInfo;
- (RCKeyValueStore)localStore;
- (RCUnfairLock)backgroundURLSessionHandlersLock;
- (RCUnfairLock)runningOperationsLock;
- (id)_decodeConfigurationResource:(id)a3;
- (id)_encodeConfigurationResource:(id)a3;
- (id)_endpointURLForEndpointConfig:(id)a3;
- (id)_endpointURLForEnvironment:(unint64_t)a3 requestKey:(id)a4;
- (id)networkEventHandler;
- (void)_fetchConfigurationFromFallbackURLWithSettings:(id)a3 completion:(id)a4;
- (void)_fetchMultiConfigurationFromEndpointURL:(id)a3 settings:(id)a4 networkActivityBlock:(id)a5 changeTagsByRequestKey:(id)a6 completion:(id)a7;
- (void)_loadConfigurationResourcesFromStore;
- (void)_processConfigurationCompletionWithResources:(id)a3 configurationSettings:(id)a4 processedConfigurationDataByRequestKey:(id *)a5 processedTreatmentIDs:(id *)a6 processedSegmentSetIDs:(id *)a7 error:(id *)a8;
- (void)_removeConfigurationResourceForRequestKey:(id)a3;
- (void)_saveConfigurationResource:(id)a3;
- (void)cancelAllTasksOnBackgroundSessionWithSettings:(id)a3 completion:(id)a4;
- (void)fetchConfigurationWithSettings:(id)a3 completionQueue:(id)a4 completion:(id)a5;
- (void)fetchMultiConfigurationWithSettings:(id)a3 completionQueue:(id)a4 completion:(id)a5;
- (void)fetchMultiConfigurationWithSettings:(id)a3 networkActivityBlock:(id)a4 completionQueue:(id)a5 completion:(id)a6;
- (void)fetchSingleConfigurationWithSettings:(id)a3 completionQueue:(id)a4 completion:(id)a5;
- (void)fetchSingleConfigurationWithSettings:(id)a3 networkActivityBlock:(id)a4 completionQueue:(id)a5 completion:(id)a6;
- (void)reestablishBackgroundSessionWithSettings:(id)a3 sessionCompletionHandler:(id)a4;
- (void)setBackgroundURLSessionHandlers:(id)a3;
- (void)setBackgroundURLSessionHandlersLock:(id)a3;
- (void)setConfigRequestSerialQueue:(id)a3;
- (void)setConfigResourceByRequestKey:(id)a3;
- (void)setConfigurationSettings:(id)a3;
- (void)setContentDirectoryURL:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setLocalStore:(id)a3;
- (void)setNetworkEventHandler:(id)a3;
- (void)setRunningOperations:(id)a3;
- (void)setRunningOperationsLock:(id)a3;
@end

@implementation RCConfigurationManager

- (void)setNetworkEventHandler:(id)a3
{
}

- (void)fetchSingleConfigurationWithSettings:(id)a3 networkActivityBlock:(id)a4 completionQueue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __111__RCConfigurationManager_fetchSingleConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke;
  v14[3] = &unk_1E5B762D0;
  id v15 = v10;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [(RCConfigurationManager *)self fetchMultiConfigurationWithSettings:v13 networkActivityBlock:a4 completionQueue:a5 completion:v14];
}

uint64_t __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 configurationData];
}

- (RCConfigurationManager)initWithContentDirectoryURL:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)RCConfigurationManager;
  v6 = [(RCConfigurationManager *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentDirectoryURL, a3);
    v8 = [[RCAsyncSerialQueue alloc] initWithQualityOfService:25];
    configRequestSerialQueue = v7->_configRequestSerialQueue;
    v7->_configRequestSerialQueue = v8;

    id v10 = [RCKeyValueStore alloc];
    id v11 = [v5 relativePath];
    uint64_t v12 = [(RCKeyValueStore *)v10 initWithName:@"remote-configuration" directory:v11 version:3 options:0];
    localStore = v7->_localStore;
    v7->_localStore = (RCKeyValueStore *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    runningOperations = v7->_runningOperations;
    v7->_runningOperations = (NSMutableArray *)v14;

    id v16 = objc_alloc_init(RCUnfairLock);
    runningOperationsLock = v7->_runningOperationsLock;
    v7->_runningOperationsLock = v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    backgroundURLSessionHandlers = v7->_backgroundURLSessionHandlers;
    v7->_backgroundURLSessionHandlers = (NSMutableDictionary *)v18;

    v20 = objc_alloc_init(RCUnfairLock);
    backgroundURLSessionHandlersLock = v7->_backgroundURLSessionHandlersLock;
    v7->_backgroundURLSessionHandlersLock = v20;

    [(RCConfigurationManager *)v7 _loadConfigurationResourcesFromStore];
  }

  return v7;
}

uint64_t __120__RCConfigurationManager__areAllConfigurationResourcesInvalid_allowedToReachEndpoint_configurationSettings_requestKeys___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  v7 = *(void **)(a1 + 32);
  id v8 = a3;
  v9 = [v7 requestInfoForRequestCacheKey:a2];
  id v10 = v9;
  if (v9) {
    [v9 cachePolicy];
  }
  else {
  id v11 = +[RCCachePolicy defaultCachePolicy];
  }
  uint64_t v12 = *(unsigned __int8 *)(a1 + 48);
  id v13 = *(void **)(a1 + 40);
  uint64_t v14 = [*(id *)(a1 + 32) useBackgroundRefreshRate];
  id v15 = [*(id *)(a1 + 32) userID];
  id v16 = [*(id *)(a1 + 32) storefrontID];
  LODWORD(v12) = [v13 _isValidConfigurationResource:v8 allowedToReachEndpoint:v12 useBackgroundRefreshRate:v14 userID:v15 storefrontID:v16 cachePolicy:v11];

  *a4 = v12;
  return v12 ^ 1;
}

- (void)fetchMultiConfigurationWithSettings:(id)a3 networkActivityBlock:(id)a4 completionQueue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v58 = a5;
  id v60 = a6;
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke;
  v85[3] = &unk_1E5B76368;
  v85[4] = self;
  uint64_t v12 = (void *)MEMORY[0x1A6262080](v85);
  id v13 = [v10 requestInfos];
  uint64_t v14 = objc_msgSend(v13, "rc_arrayByTransformingWithBlock:", &__block_literal_global_91);

  id v15 = [(RCConfigurationManager *)self configResourceByRequestKey];
  id v16 = objc_msgSend(v15, "rc_subdictionaryForKeys:", v14);

  v59 = objc_msgSend(v16, "rc_dictionaryByTransformingValuesWithKeyAndValueBlock:", &__block_literal_global_94);
  v66 = v14;
  uint64_t v17 = [v14 firstObject];
  uint64_t v18 = [v16 objectForKeyedSubscript:v17];
  v19 = [v10 requestInfos];
  LODWORD(v14) = objc_msgSend(v19, "rc_containsObjectPassingTest:", &__block_literal_global_97);

  v20 = [v10 requestInfos];
  int v21 = objc_msgSend(v20, "rc_containsObjectPassingTest:", &__block_literal_global_99);

  id v61 = v11;
  if (v14)
  {
    v22 = [(RCConfigurationManager *)self configResourceByRequestKey];
    objc_super v23 = [v22 objectForKeyedSubscript:@"appConfigRequest"];

    v24 = [v23 userSegmentationConfiguration];
    v25 = [v24 widgetEndpointURLString];

    if (![(__CFString *)v25 length]
      || ([MEMORY[0x1E4F1CB10] URLWithString:v25], (uint64_t v26 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v27 = [v10 debugOverrides];
      uint64_t v28 = [v27 debugEnvironment];
      v29 = RCRequestWidgetConfigurationKey;
LABEL_14:
      v36 = *v29;
      v37 = self;
LABEL_15:
      v32 = [(RCConfigurationManager *)v37 _endpointURLForEnvironment:v28 requestKey:v36];

      goto LABEL_16;
    }
    goto LABEL_8;
  }
  if (v21)
  {
    v30 = [(RCConfigurationManager *)self configResourceByRequestKey];
    objc_super v23 = [v30 objectForKeyedSubscript:@"appConfigRequest"];

    v31 = [v23 userSegmentationConfiguration];
    v25 = [v31 todayEndpointURLString];

    if (![(__CFString *)v25 length]
      || ([MEMORY[0x1E4F1CB10] URLWithString:v25], (uint64_t v26 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v27 = [v10 debugOverrides];
      uint64_t v28 = [v27 debugEnvironment];
      v29 = RCRequestTodayConfigurationKey;
      goto LABEL_14;
    }
LABEL_8:
    v32 = (void *)v26;
LABEL_16:

    goto LABEL_17;
  }
  v33 = [v10 endpointConfig];
  v32 = [(RCConfigurationManager *)self _endpointURLForEndpointConfig:v33];

  if (v32) {
    goto LABEL_18;
  }
  v34 = [v18 userSegmentationConfiguration];
  objc_super v23 = [v34 endpointURLString];

  if (![v23 length]
    || ([MEMORY[0x1E4F1CB10] URLWithString:v23], (uint64_t v35 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v56 = [v10 requestInfos];
    v57 = [v56 firstObject];
    v25 = [v57 requestKey];

    v27 = [v10 debugOverrides];
    uint64_t v28 = [v27 debugEnvironment];
    v37 = self;
    v36 = v25;
    goto LABEL_15;
  }
  v32 = (void *)v35;
LABEL_17:

LABEL_18:
  v38 = [v16 objectForKeyedSubscript:v17];
  v65 = [v38 treatmentIDs];

  v63 = (void *)v17;
  v39 = [v16 objectForKeyedSubscript:v17];
  v64 = [v39 segmentSetIDs];

  v62 = v18;
  BOOL v40 = [(RCConfigurationManager *)self _isAllowedToReachEndpointWithSettings:v10 configurationResource:v18 endpointURL:v32];
  v41 = [MEMORY[0x1E4F1CAD0] setWithArray:v66];
  if (!v40)
  {
    v42 = [v10 requestInfos];
    v43 = objc_msgSend(v42, "rc_arrayByTransformingWithBlock:", &__block_literal_global_103);

    uint64_t v44 = [MEMORY[0x1E4F1CAD0] setWithArray:v43];

    v41 = (void *)v44;
  }
  v45 = [v10 debugOverrides];
  if (([v45 ignoreCache] & 1) != 0
    || ![(RCConfigurationManager *)self _areAllConfigurationResourcesAvailable:v16 requestKeys:v41])
  {
  }
  else
  {
    BOOL v46 = [(RCConfigurationManager *)self _areAllConfigurationResourcesInvalid:v16 allowedToReachEndpoint:v40 configurationSettings:v10 requestKeys:v41];

    if (!v46)
    {
      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3221225472;
      v78[2] = __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_7;
      v78[3] = &unk_1E5B76418;
      id v79 = v16;
      id v80 = v65;
      id v81 = v64;
      v47 = v12;
      v48 = v60;
      id v84 = v60;
      v49 = v58;
      id v82 = v58;
      v50 = v59;
      id v83 = v59;
      __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_7((uint64_t)v78);

      v51 = v79;
LABEL_31:
      v55 = v61;
      goto LABEL_34;
    }
  }
  v52 = RCSharedLog();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4AB3000, v52, OS_LOG_TYPE_DEFAULT, "configuration request(s) not available in the cache or expired, starting fetch", buf, 2u);
  }

  if (!v40)
  {
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_105;
    v72[3] = &unk_1E5B76440;
    id v75 = v12;
    id v73 = v10;
    v49 = v58;
    id v74 = v58;
    v47 = v12;
    v48 = v60;
    id v76 = v60;
    __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_105((uint64_t)v72);

    v51 = v75;
    v50 = v59;
    goto LABEL_31;
  }
  v53 = [v10 debugOverrides];
  char v54 = [v53 ignoreCache];

  v47 = v12;
  if (v54)
  {
    v51 = 0;
  }
  else
  {
    v51 = objc_msgSend(v16, "rc_dictionaryByTransformingValuesWithKeyAndValueBlock:", &__block_literal_global_109);
  }
  v49 = v58;
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_2_111;
  v67[3] = &unk_1E5B764B0;
  v48 = v60;
  id v70 = v60;
  id v68 = v58;
  id v69 = v10;
  id v71 = v47;
  v55 = v61;
  [(RCConfigurationManager *)self _fetchMultiConfigurationFromEndpointURL:v32 settings:v69 networkActivityBlock:v61 changeTagsByRequestKey:v51 completion:v67];

  v50 = v59;
LABEL_34:
}

void __111__RCConfigurationManager_fetchSingleConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v18 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = *(void **)(a1 + 32);
  id v12 = a2;
  id v13 = [v11 requestInfos];
  uint64_t v14 = [v13 firstObject];

  id v15 = [v14 requestCacheKey];
  id v16 = [v12 objectForKeyedSubscript:v15];

  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, void *, id, id, id))(v17 + 16))(v17, v16, v18, v9, v10);
  }
}

void __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = RCSharedLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) allKeys];
    v4 = objc_msgSend(v3, "rc_description");
    id v5 = objc_msgSend(*(id *)(a1 + 40), "rc_description");
    v6 = objc_msgSend(*(id *)(a1 + 48), "rc_description");
    *(_DWORD *)buf = 138412802;
    id v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1A4AB3000, v2, OS_LOG_TYPE_DEFAULT, "returning the cached configuration for requestKeys: %@ treatmentIDs: %@ segmentSetIDs: %@", buf, 0x20u);
  }
  v7 = *(void **)(a1 + 72);
  if (v7)
  {
    id v8 = *(NSObject **)(a1 + 56);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_104;
    v9[3] = &unk_1E5B763F0;
    id v13 = v7;
    id v10 = *(id *)(a1 + 64);
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    dispatch_async(v8, v9);
  }
}

uint64_t __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 requestKey];
  uint64_t v3 = [v2 isEqualToString:@"todayConfigRequest"];

  return v3;
}

uint64_t __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 requestKey];
  uint64_t v3 = [v2 isEqualToString:@"widgetConfigRequest"];

  return v3;
}

uint64_t __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_2_88(uint64_t a1, void *a2)
{
  return [a2 requestCacheKey];
}

- (BOOL)_isValidConfigurationResource:(id)a3 allowedToReachEndpoint:(BOOL)a4 useBackgroundRefreshRate:(BOOL)a5 userID:(id)a6 storefrontID:(id)a7 cachePolicy:(id)a8
{
  BOOL v11 = a5;
  BOOL v12 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  if (v13)
  {
    uint64_t v17 = NSString;
    __int16 v18 = [v13 userID];
    LOBYTE(v17) = objc_msgSend(v17, "rc_string:isEqualToString:", v18, v14);

    if (v17)
    {
      v19 = NSString;
      uint64_t v20 = [v13 storefrontID];
      LOBYTE(v19) = objc_msgSend(v19, "rc_string:isEqualToString:", v20, v15);

      if (v19)
      {
        if ([v16 requestCachePolicy] != 1)
        {
          v25 = [v13 userSegmentationConfiguration];
          uint64_t v26 = v25;
          if (v11)
          {
            uint64_t v27 = [v25 backgroundRefreshRate];
            uint64_t v28 = &RCUserSegmentationConfigurationDefaultBackgroundRefreshRate;
          }
          else
          {
            uint64_t v27 = [v25 foregroundRefreshRate];
            uint64_t v28 = &RCUserSegmentationConfigurationDefaultForegroundRefreshRate;
          }
          unint64_t v29 = *v28;
          if (v27) {
            unint64_t v30 = v27;
          }
          else {
            unint64_t v30 = v29;
          }

          int v23 = [v13 isExpiredWithMaxTTL:v12 allowedToReachEndpoint:(double)v30] ^ 1;
          int v21 = RCSharedLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            int v31 = 138413058;
            id v32 = v13;
            __int16 v33 = 2048;
            unint64_t v34 = v30;
            __int16 v35 = 1024;
            int v36 = v23;
            __int16 v37 = 1024;
            BOOL v38 = v11;
            _os_log_impl(&dword_1A4AB3000, v21, OS_LOG_TYPE_DEFAULT, "checking if configuration is valid with resource: %@ maxTTL: %lu isValid: %d useBackgroundRefreshRate: %d", (uint8_t *)&v31, 0x22u);
          }
          goto LABEL_14;
        }
        int v21 = RCSharedLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v31 = 138412290;
          id v32 = v13;
          v22 = "configuration resource not valid due to ignore cache policy: %@";
LABEL_12:
          _os_log_impl(&dword_1A4AB3000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v31, 0xCu);
        }
      }
      else
      {
        int v21 = RCSharedLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v31 = 138412290;
          id v32 = v13;
          v22 = "configuration resource no longer valid because the storefrontID changed: %@";
          goto LABEL_12;
        }
      }
    }
    else
    {
      int v21 = RCSharedLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 138412290;
        id v32 = v13;
        v22 = "configuration resource no longer valid because the userID changed: %@";
        goto LABEL_12;
      }
    }
    LOBYTE(v23) = 0;
LABEL_14:

    goto LABEL_15;
  }
  LOBYTE(v23) = 0;
LABEL_15:

  return v23;
}

- (BOOL)_isAllowedToReachEndpointWithSettings:(id)a3 configurationResource:(id)a4 endpointURL:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v10 = [v7 debugOverrides];
    uint64_t v11 = [v10 configurationSource];

    if (v11 == 1)
    {
      char v12 = __98__RCConfigurationManager__isAllowedToReachEndpointWithSettings_configurationResource_endpointURL___block_invoke_2();
LABEL_7:
      BOOL v13 = v12;
      goto LABEL_8;
    }
    id v14 = [v7 debugOverrides];
    uint64_t v15 = [v14 configurationSource];

    if (v15 == 2)
    {
      char v12 = __98__RCConfigurationManager__isAllowedToReachEndpointWithSettings_configurationResource_endpointURL___block_invoke_133();
      goto LABEL_7;
    }
    if ([v7 requestMode] == 2)
    {
      uint64_t v17 = RCSharedLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AB3000, v17, OS_LOG_TYPE_DEFAULT, "allowed to reach endpoint because request mode is: EndpointOnly", buf, 2u);
      }

      BOOL v13 = 1;
    }
    else
    {
      __int16 v18 = [v7 userID];
      uint64_t v19 = [v18 length];

      if (v8 && v19)
      {
        uint64_t v20 = [v7 userID];
        int v21 = [v8 userSegmentationConfiguration];
        unint64_t v22 = [v21 modThreshold];

        int v23 = [v8 userSegmentationConfiguration];
        unint64_t v24 = [v23 modMax];

        unint64_t v25 = [v20 hash] % v24;
        BOOL v13 = v25 < v22;
        uint64_t v26 = RCSharedLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)unint64_t v30 = v20;
          _os_log_impl(&dword_1A4AB3000, v26, OS_LOG_TYPE_DEBUG, "checking if client is allowed to reach endpoint with userID: %@", buf, 0xCu);
        }

        uint64_t v27 = RCSharedLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)unint64_t v30 = v25 < v22;
          *(_WORD *)&v30[4] = 2048;
          *(void *)&v30[6] = v25;
          __int16 v31 = 2048;
          unint64_t v32 = v24;
          __int16 v33 = 2048;
          unint64_t v34 = v22;
          _os_log_impl(&dword_1A4AB3000, v27, OS_LOG_TYPE_DEFAULT, "client allowedToReachEndpoint: %d with moddedHash: %lu modMax: %lu modThreshold: %lu", buf, 0x26u);
        }
      }
      else
      {
        id v28 = v7;
        BOOL v13 = (unint64_t)([v28 requestMode] - 1) < 2;
      }
    }
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_8:

  return v13;
}

- (id)_endpointURLForEndpointConfig:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    switch([v3 environment])
    {
      case 0:
        uint64_t v5 = [v4 productionURL];
        goto LABEL_10;
      case 1:
        uint64_t v5 = [v4 stagingURL];
        goto LABEL_10;
      case 2:
        uint64_t v5 = [v4 qaURL];
        goto LABEL_10;
      case 3:
        uint64_t v5 = [v4 develURL];
        goto LABEL_10;
      case 4:
        uint64_t v5 = [v4 testURL];
LABEL_10:
        id v7 = (void *)v5;
        if (!v5) {
          goto LABEL_13;
        }
        v6 = RCSharedLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          id v8 = [v4 environmentDescription];
          int v11 = 138543618;
          char v12 = v7;
          __int16 v13 = 2114;
          id v14 = v8;
          _os_log_impl(&dword_1A4AB3000, v6, OS_LOG_TYPE_ERROR, "Found endpoint URL: %{public}@ for enviroment: %{public}@", (uint8_t *)&v11, 0x16u);
        }
        goto LABEL_16;
      default:
LABEL_13:
        v6 = RCSharedLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          id v9 = [v4 environmentDescription];
          int v11 = 138543362;
          char v12 = v9;
          _os_log_impl(&dword_1A4AB3000, v6, OS_LOG_TYPE_ERROR, "No endpoint URL found in the endpointConfig for enviroment: %{public}@", (uint8_t *)&v11, 0xCu);
        }
        goto LABEL_15;
    }
  }
  v6 = RCSharedLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_1A4AB3000, v6, OS_LOG_TYPE_DEFAULT, "EndpointConfig not available, falling back to the config to look for the endpointURL", (uint8_t *)&v11, 2u);
  }
LABEL_15:
  id v7 = 0;
LABEL_16:

  return v7;
}

- (BOOL)_areAllConfigurationResourcesInvalid:(id)a3 allowedToReachEndpoint:(BOOL)a4 configurationSettings:(id)a5 requestKeys:(id)a6
{
  id v10 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __120__RCConfigurationManager__areAllConfigurationResourcesInvalid_allowedToReachEndpoint_configurationSettings_requestKeys___block_invoke;
  v15[3] = &unk_1E5B76500;
  id v16 = v10;
  uint64_t v17 = self;
  BOOL v18 = a4;
  id v11 = v10;
  id v12 = a6;
  __int16 v13 = [a3 keysOfEntriesPassingTest:v15];
  LOBYTE(self) = [v13 isEqualToSet:v12];

  return (char)self;
}

- (BOOL)_areAllConfigurationResourcesAvailable:(id)a3 requestKeys:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a4;
  id v7 = [a3 allKeys];
  id v8 = [v5 setWithArray:v7];

  LOBYTE(v7) = [v8 isEqualToSet:v6];
  return (char)v7;
}

- (void)_loadConfigurationResourcesFromStore
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [(RCConfigurationManager *)self setConfigResourceByRequestKey:v3];

  v4 = [(RCConfigurationManager *)self localStore];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [v4 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = objc_opt_class();
        id v11 = [v4 objectForKey:v9];
        id v12 = RCDynamicCast(v10, (uint64_t)v11);

        __int16 v13 = [(RCConfigurationManager *)self _decodeConfigurationResource:v12];
        if (v13)
        {
          id v14 = [(RCConfigurationManager *)self configResourceByRequestKey];
          uint64_t v15 = [v13 requestKey];
          [v14 setObject:v13 forKeyedSubscript:v15];

          id v16 = RCSharedLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            int v23 = v13;
            _os_log_impl(&dword_1A4AB3000, v16, OS_LOG_TYPE_DEBUG, "loaded configuration resource: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v6);
  }
}

- (NSMutableDictionary)configResourceByRequestKey
{
  return self->_configResourceByRequestKey;
}

- (id)_decodeConfigurationResource:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initForReadingFromData:v4 error:0];

  uint64_t v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];

  return v6;
}

- (void)setConfigResourceByRequestKey:(id)a3
{
}

- (RCKeyValueStore)localStore
{
  return self->_localStore;
}

- (void)fetchSingleConfigurationWithSettings:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
}

uint64_t __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_104(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], 0);
}

- (void)fetchConfigurationWithSettings:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__RCConfigurationManager_fetchConfigurationWithSettings_completionQueue_completion___block_invoke;
  v12[3] = &unk_1E5B762D0;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(RCConfigurationManager *)self fetchMultiConfigurationWithSettings:v11 completionQueue:a4 completion:v12];
}

void __84__RCConfigurationManager_fetchConfigurationWithSettings_completionQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v20 = a5;
  id v9 = *(void **)(a1 + 32);
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  id v13 = [v9 requestInfos];
  id v14 = [v13 firstObject];

  uint64_t v15 = [v14 requestCacheKey];
  id v16 = [v12 objectForKeyedSubscript:v15];

  uint64_t v17 = objc_msgSend(v11, "rc_arrayByTransformingWithBlock:", &__block_literal_global_0);

  long long v18 = objc_msgSend(v10, "rc_arrayByTransformingWithBlock:", &__block_literal_global_83);

  uint64_t v19 = *(void *)(a1 + 40);
  if (v19) {
    (*(void (**)(uint64_t, void *, void *, void *, id))(v19 + 16))(v19, v16, v17, v18, v20);
  }
}

uint64_t __84__RCConfigurationManager_fetchConfigurationWithSettings_completionQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 stringValue];
}

uint64_t __84__RCConfigurationManager_fetchConfigurationWithSettings_completionQueue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 stringValue];
}

- (void)fetchMultiConfigurationWithSettings:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
}

void __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_2;
  v12[3] = &unk_1E5B76340;
  id v13 = v7;
  id v14 = v8;
  id v10 = v7;
  id v11 = v8;
  [v9 _fetchConfigurationFromFallbackURLWithSettings:a2 completion:v12];
}

void __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = RCSharedLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_1A4AB3000, v7, OS_LOG_TYPE_ERROR, "fallback operation failed with error: %@", buf, 0xCu);
    }
  }
  id v8 = *(void **)(a1 + 40);
  if (v8)
  {
    id v9 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_84;
    block[3] = &unk_1E5B76318;
    id v13 = v8;
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_84(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, 0, a1[5]);
}

id __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 fallbackURL];
  if (v3)
  {
    id v4 = [v2 requestCacheKey];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_105(uint64_t a1)
{
  id v2 = RCSharedLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A4AB3000, v2, OS_LOG_TYPE_DEFAULT, "not allowed to reach the endpoint at this time, using the fallbackURL", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

RCChangeTag *__110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_106(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v4 = [v3 configurationID];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [v3 contentHash];
    if (!v6)
    {
LABEL_5:

      goto LABEL_7;
    }
    id v7 = [v3 lastModifiedString];

    if (v7)
    {
      id v8 = [RCChangeTag alloc];
      id v5 = [v3 configurationID];
      id v9 = [v3 contentHash];
      id v10 = [v3 lastModifiedString];
      id v6 = [(RCChangeTag *)v8 initWithIdentifier:v5 contentHash:v9 lastModifiedString:v10];

      goto LABEL_5;
    }
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

void __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_2_111(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    id v13 = RCSharedLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v12;
      _os_log_impl(&dword_1A4AB3000, v13, OS_LOG_TYPE_ERROR, "endpoint operation failed with error: %@", buf, 0xCu);
    }
  }
  if (v9)
  {
    id v14 = *(void **)(a1 + 48);
    if (v14)
    {
      id v15 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_112;
      block[3] = &unk_1E5B76488;
      id v31 = v14;
      id v27 = v9;
      id v28 = v10;
      id v29 = v11;
      id v30 = v12;
      dispatch_async(v15, block);

      uint64_t v16 = v31;
LABEL_11:
    }
  }
  else
  {
    uint64_t v17 = [*(id *)(a1 + 40) debugOverrides];
    uint64_t v18 = [v17 configurationSource];

    if (v18 != 1)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_13;
    }
    uint64_t v19 = *(void **)(a1 + 48);
    if (v19)
    {
      id v20 = *(NSObject **)(a1 + 32);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_2_113;
      v21[3] = &unk_1E5B763F0;
      id v25 = v19;
      id v22 = v10;
      id v23 = v11;
      id v24 = v12;
      dispatch_async(v20, v21);

      uint64_t v16 = v25;
      goto LABEL_11;
    }
  }
LABEL_13:
}

uint64_t __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_112(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __110__RCConfigurationManager_fetchMultiConfigurationWithSettings_networkActivityBlock_completionQueue_completion___block_invoke_2_113(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[7] + 16))(a1[7], 0, a1[4], a1[5], a1[6]);
}

- (void)reestablishBackgroundSessionWithSettings:(id)a3 sessionCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 backgroundFetchConfiguration];

  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationManager reestablishBackgroundSessionWithSettings:sessionCompletionHandler:]();
  }
  id v9 = [v6 backgroundFetchConfiguration];
  id v10 = [v9 sessionIdentifier];

  id v11 = [(RCConfigurationManager *)self backgroundURLSessionHandlersLock];
  [v11 lock];

  id v12 = [(RCConfigurationManager *)self backgroundURLSessionHandlers];
  id v13 = [v12 objectForKeyedSubscript:v10];

  if (!v13)
  {
    id v13 = objc_alloc_init(RCBackgroundURLSessionHandler);
    id v14 = [(RCConfigurationManager *)self backgroundURLSessionHandlers];
    [v14 setObject:v13 forKeyedSubscript:v10];
  }
  id v15 = [(RCConfigurationManager *)self backgroundURLSessionHandlersLock];
  [v15 unlock];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92__RCConfigurationManager_reestablishBackgroundSessionWithSettings_sessionCompletionHandler___block_invoke;
  v19[3] = &unk_1E5B764D8;
  v19[4] = self;
  id v20 = v6;
  id v21 = v10;
  id v22 = v7;
  id v16 = v10;
  id v17 = v7;
  id v18 = v6;
  [(RCBackgroundURLSessionHandler *)v13 reestablishBackgroundSessionWithConfigurationSettings:v18 sessionCompletionHandler:v19];
}

void __92__RCConfigurationManager_reestablishBackgroundSessionWithSettings_sessionCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v26 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        id v8 = v4;
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v10 = *(void **)(a1 + 32);
        id v11 = [v9 configurationResourcesByRequestKey];
        uint64_t v12 = *(void *)(a1 + 40);
        id v29 = 0;
        id v30 = 0;
        id v27 = 0;
        id v28 = 0;
        [v10 _processConfigurationCompletionWithResources:v11 configurationSettings:v12 processedConfigurationDataByRequestKey:&v30 processedTreatmentIDs:&v29 processedSegmentSetIDs:&v28 error:&v27];
        id v13 = v30;
        id v14 = v29;
        id v15 = v28;
        id v16 = v27;

        id v17 = [RCConfigurationFetchResult alloc];
        id v18 = [v9 taskIdentifier];
        uint64_t v19 = [(RCConfigurationFetchResult *)v17 initWithTaskIdentifier:v18 configurationDataByRequestKey:v13 treatmentIDs:v14 segmentSetIDs:v15 error:v16];

        uint64_t v4 = v8;
        [v8 addObject:v19];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v6);
  }

  uint64_t v20 = *(void *)(a1 + 56);
  if (v20)
  {
    id v21 = (void *)[v4 copy];
    (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v21);
  }
  id v22 = [*(id *)(a1 + 32) backgroundURLSessionHandlersLock];
  [v22 lock];

  id v23 = [*(id *)(a1 + 32) backgroundURLSessionHandlers];
  [v23 setObject:0 forKeyedSubscript:*(void *)(a1 + 48)];

  id v24 = [*(id *)(a1 + 32) backgroundURLSessionHandlersLock];
  [v24 unlock];
}

- (void)cancelAllTasksOnBackgroundSessionWithSettings:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 backgroundFetchConfiguration];

  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationManager cancelAllTasksOnBackgroundSessionWithSettings:completion:]();
  }
  id v8 = [v5 backgroundFetchConfiguration];
  +[RCURLSession cancelAllTasksOnBackgroundSessionWithFetchConfig:v8 completion:v6];
}

- (void)_processConfigurationCompletionWithResources:(id)a3 configurationSettings:(id)a4 processedConfigurationDataByRequestKey:(id *)a5 processedTreatmentIDs:(id *)a6 processedSegmentSetIDs:(id *)a7 error:(id *)a8
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v43 = v10;
  id obj = [v10 requestInfos];
  uint64_t v60 = [obj countByEnumeratingWithState:&v62 objects:v74 count:16];
  id v13 = 0;
  id v14 = 0;
  if (v60)
  {
    uint64_t v56 = *(void *)v63;
    *(void *)&long long v12 = 138413058;
    long long v42 = v12;
    id v52 = v9;
    v55 = v11;
    do
    {
      for (uint64_t i = 0; i != v60; ++i)
      {
        if (*(void *)v63 != v56) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        id v17 = objc_msgSend(v16, "requestCacheKey", v42);
        id v18 = [v9 objectForKeyedSubscript:v17];

        uint64_t v19 = [(RCConfigurationManager *)self configResourceByRequestKey];
        uint64_t v20 = [v16 requestCacheKey];
        id v21 = [v19 objectForKeyedSubscript:v20];

        if (!v21)
        {
          id v22 = RCSharedLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v37 = [v16 requestKey];
            *(_DWORD *)buf = 138412290;
            v67 = v37;
            _os_log_impl(&dword_1A4AB3000, v22, OS_LOG_TYPE_DEFAULT, "cached configuration not available for requestKey: %@, skip updating last fetch date, treatmentIDs and segmentSetIDs", buf, 0xCu);
          }
          goto LABEL_21;
        }
        id v22 = [v21 contentHash];
        id v23 = [v18 contentHash];
        if (([v22 isEqualToString:v23] & 1) == 0)
        {

LABEL_20:
          id v11 = v55;
LABEL_21:

          goto LABEL_22;
        }
        id v24 = [v21 userID];
        id v25 = [v18 userID];
        if (![v24 isEqualToString:v25])
        {

LABEL_19:
          id v9 = v52;
          goto LABEL_20;
        }
        v50 = v24;
        uint64_t v26 = [v21 storefrontID];
        uint64_t v27 = [v18 storefrontID];
        v48 = (void *)v26;
        id v28 = (void *)v26;
        id v29 = (void *)v27;
        if (![v28 isEqualToString:v27])
        {

          goto LABEL_19;
        }
        uint64_t v44 = [v43 debugOverrides];
        char v46 = [v44 ignoreCache];

        id v9 = v52;
        id v11 = v55;
        if ((v46 & 1) == 0)
        {
          id v30 = RCSharedLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v51 = [v16 requestKey];
            v49 = [v18 treatmentIDs];
            v47 = objc_msgSend(v49, "rc_description");
            v45 = [v18 segmentSetIDs];
            long long v31 = objc_msgSend(v45, "rc_description");
            long long v32 = [v21 contentHash];
            *(_DWORD *)buf = v42;
            v67 = v51;
            __int16 v68 = 2112;
            id v69 = v47;
            __int16 v70 = 2112;
            id v71 = v31;
            __int16 v72 = 2112;
            id v73 = v32;
            _os_log_impl(&dword_1A4AB3000, v30, OS_LOG_TYPE_DEFAULT, "matched contentHash, returning cached configuration for requestKey: %@ treatmentIDs: %@ segmentSetIDs: %@ contentHash: %@ ", buf, 0x2Au);

            id v11 = v55;
            id v9 = v52;
          }
          long long v33 = [MEMORY[0x1E4F1C9C8] date];
          [v21 setLastFetchedDate:v33];

          long long v34 = [v18 treatmentIDs];
          [v21 setTreatmentIDs:v34];

          uint64_t v35 = [v18 segmentSetIDs];
          [v21 setSegmentSetIDs:v35];

          id v36 = v21;
          id v18 = v36;
LABEL_23:
          [(RCConfigurationManager *)self _saveConfigurationResource:v18];
          BOOL v38 = [v18 configurationData];
          uint64_t v39 = [v16 requestCacheKey];
          [v11 setObject:v38 forKeyedSubscript:v39];

          uint64_t v40 = [v18 treatmentIDs];

          uint64_t v41 = [v18 segmentSetIDs];

          id v13 = (id)v41;
          id v14 = (id)v40;
          goto LABEL_25;
        }
LABEL_22:
        if (v18) {
          goto LABEL_23;
        }
        objc_msgSend(MEMORY[0x1E4F28C58], "rc_notAvailableError");
        *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
        *a5 = (id)[v11 copy];
        id v14 = v14;
        *a6 = v14;
        id v13 = v13;
        *a7 = v13;
      }
      uint64_t v60 = [obj countByEnumeratingWithState:&v62 objects:v74 count:16];
    }
    while (v60);
  }
}

uint64_t __98__RCConfigurationManager__isAllowedToReachEndpointWithSettings_configurationResource_endpointURL___block_invoke_2()
{
  v0 = RCSharedLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_1A4AB3000, v0, OS_LOG_TYPE_DEFAULT, "configuration source override enabled: Endpoint", v2, 2u);
  }

  return 1;
}

uint64_t __98__RCConfigurationManager__isAllowedToReachEndpointWithSettings_configurationResource_endpointURL___block_invoke_133()
{
  v0 = RCSharedLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_1A4AB3000, v0, OS_LOG_TYPE_DEFAULT, "configuration source override enabled: CloudKit", v2, 2u);
  }

  return 0;
}

BOOL __98__RCConfigurationManager__isAllowedToReachEndpointWithSettings_configurationResource_endpointURL___block_invoke_136(uint64_t a1)
{
  return (unint64_t)([*(id *)(a1 + 32) requestMode] - 1) < 2;
}

- (void)_fetchMultiConfigurationFromEndpointURL:(id)a3 settings:(id)a4 networkActivityBlock:(id)a5 changeTagsByRequestKey:(id)a6 completion:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = RCSharedLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v13;
    _os_log_impl(&dword_1A4AB3000, v17, OS_LOG_TYPE_DEFAULT, "enqueuing configuration fetch from endpoint with settings: %@", buf, 0xCu);
  }

  id v18 = [(RCConfigurationManager *)self configRequestSerialQueue];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke;
  v24[3] = &unk_1E5B765C8;
  id v25 = v13;
  id v26 = v15;
  id v27 = v12;
  id v28 = self;
  id v29 = v14;
  id v30 = v16;
  id v19 = v16;
  id v20 = v14;
  id v21 = v12;
  id v22 = v15;
  id v23 = v13;
  [v18 enqueueBlock:v24];
}

void __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = RCSharedLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v5;
    _os_log_impl(&dword_1A4AB3000, v4, OS_LOG_TYPE_DEFAULT, "fetching configuration from endpoint with settings: %@", buf, 0xCu);
  }

  id v6 = objc_alloc_init(RCEndpointOperation);
  [(RCOperation *)v6 setQualityOfService:25];
  [(RCOperation *)v6 setRelativePriority:1];
  [(RCEndpointOperation *)v6 setConfigurationSettings:*(void *)(a1 + 32)];
  [(RCEndpointOperation *)v6 setChangeTagsByRequestKey:*(void *)(a1 + 40)];
  [(RCEndpointOperation *)v6 setEndpointURL:*(void *)(a1 + 48)];
  uint64_t v7 = *(void *)(a1 + 64);
  if (v7)
  {
    id v8 = (*(void (**)(void))(v7 + 16))();
    [(RCEndpointOperation *)v6 setNetworkActivity:v8];
  }
  objc_initWeak((id *)buf, v6);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_138;
  v20[3] = &unk_1E5B76550;
  v20[4] = *(void *)(a1 + 56);
  id v21 = *(id *)(a1 + 32);
  [(RCEndpointOperation *)v6 setNetworkEventHandler:v20];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_2;
  v15[3] = &unk_1E5B765A0;
  objc_copyWeak(&v19, (id *)buf);
  id v17 = *(id *)(a1 + 72);
  id v9 = v3;
  uint64_t v10 = *(void *)(a1 + 56);
  id v18 = v9;
  void v15[4] = v10;
  id v16 = *(id *)(a1 + 32);
  [(RCEndpointOperation *)v6 setConfigurationCompletionHandler:v15];
  id v11 = [*(id *)(a1 + 56) runningOperationsLock];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_6;
  v13[3] = &unk_1E5B75F80;
  v13[4] = *(void *)(a1 + 56);
  id v12 = v6;
  id v14 = v12;
  [v11 performWithLockSync:v13];

  [(RCOperation *)v12 start];
  objc_destroyWeak(&v19);

  objc_destroyWeak((id *)buf);
}

void __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_138(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) networkEventHandler];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) networkEventHandler];
    ((void (**)(void, id, void, void))v4)[2](v4, v5, *(void *)(a1 + 40), 0);
  }
}

void __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v6)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_3;
    v24[3] = &unk_1E5B76578;
    id v28 = *(id *)(a1 + 48);
    id v25 = v6;
    id v29 = *(id *)(a1 + 56);
    id v8 = WeakRetained;
    uint64_t v9 = *(void *)(a1 + 32);
    id v26 = v8;
    uint64_t v27 = v9;
    __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_3((uint64_t)v24);

    id v10 = v28;
  }
  else
  {
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    id v22 = 0;
    id v23 = 0;
    id v20 = 0;
    id v21 = 0;
    [v11 _processConfigurationCompletionWithResources:v5 configurationSettings:v12 processedConfigurationDataByRequestKey:&v23 processedTreatmentIDs:&v22 processedSegmentSetIDs:&v21 error:&v20];
    id v13 = v23;
    id v14 = v22;
    id v15 = v21;
    id v10 = v20;
    uint64_t v16 = *(void *)(a1 + 48);
    if (v16) {
      (*(void (**)(uint64_t, id, id, id, id))(v16 + 16))(v16, v13, v14, v15, v10);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    if (WeakRetained)
    {
      id v17 = [*(id *)(a1 + 32) runningOperationsLock];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_5;
      v18[3] = &unk_1E5B75F80;
      v18[4] = *(void *)(a1 + 32);
      id v19 = WeakRetained;
      [v17 performWithLockSync:v18];
    }
  }
}

void __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(uint64_t, void, void, void, void))(v2 + 16))(v2, 0, 0, 0, *(void *)(a1 + 32));
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  if (*(void *)(a1 + 40))
  {
    id v3 = [*(id *)(a1 + 48) runningOperationsLock];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_4;
    v6[3] = &unk_1E5B75F80;
    int8x16_t v5 = *(int8x16_t *)(a1 + 40);
    id v4 = (id)v5.i64[0];
    int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
    [v3 performWithLockSync:v6];
  }
}

void __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) runningOperations];
  [v2 removeObject:*(void *)(a1 + 40)];
}

void __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) runningOperations];
  [v2 removeObject:*(void *)(a1 + 40)];
}

void __130__RCConfigurationManager__fetchMultiConfigurationFromEndpointURL_settings_networkActivityBlock_changeTagsByRequestKey_completion___block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) runningOperations];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (id)_endpointURLForEnvironment:(unint64_t)a3 requestKey:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (([v5 isEqualToString:@"appConfigRequest"] & 1) != 0
    || ([v5 isEqualToString:@"magazinesConfigRequest"] & 1) != 0
    || [v5 isEqualToString:@"audioConfigRequest"]
    || [v5 isEqualToString:@"widgetConfigRequest"])
  {
    goto LABEL_5;
  }
  if ([v5 isEqualToString:@"todayConfigRequest"])
  {
    if (a3 >= 5) {
      goto LABEL_22;
    }
    id v8 = off_1E5B76660;
LABEL_18:
    id v6 = &v8[a3];
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"stocksConfigRequest"])
  {
    if (a3 >= 5) {
      goto LABEL_22;
    }
    id v8 = off_1E5B76688;
    goto LABEL_18;
  }
  if (([v5 isEqualToString:@"weatherConfigRequest"] & 1) != 0
    || [v5 isEqualToString:@"weather2ConfigRequest"])
  {
    if (a3 >= 5) {
      goto LABEL_22;
    }
    id v8 = off_1E5B766B0;
    goto LABEL_18;
  }
  if ([v5 isEqualToString:@"booksConfigRequest"])
  {
    if (a3 >= 5) {
      goto LABEL_22;
    }
    id v8 = off_1E5B766D8;
    goto LABEL_18;
  }
  id v11 = RCSharedLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138543362;
    id v13 = v5;
    _os_log_impl(&dword_1A4AB3000, v11, OS_LOG_TYPE_ERROR, "No endpoint URL available for requestKey: %{public}@ falling back to news-edge", (uint8_t *)&v12, 0xCu);
  }

LABEL_5:
  if (a3 - 1 < 4)
  {
    id v6 = &off_1E5B76700[a3 - 1];
LABEL_7:
    int8x16_t v7 = *v6;
    goto LABEL_23;
  }
LABEL_22:
  int8x16_t v7 = @"https://news-edge.apple.com/v1/configs";
LABEL_23:
  uint64_t v9 = [MEMORY[0x1E4F1CB10] URLWithString:v7];

  return v9;
}

- (void)_fetchConfigurationFromFallbackURLWithSettings:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RCConfigurationManager *)self configRequestSerialQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke;
  v11[3] = &unk_1E5B76640;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enqueueBlock:v11];
}

void __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke(id *a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = RCSharedLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = a1[4];
    *(_DWORD *)buf = 138412290;
    id v49 = v5;
    _os_log_impl(&dword_1A4AB3000, v4, OS_LOG_TYPE_DEFAULT, "fetching configuration from fallback with settings: %@", buf, 0xCu);
  }

  id v6 = [a1[4] requestInfos];
  id v7 = objc_msgSend(v6, "rc_firstObjectPassingTest:", &__block_literal_global_143);

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v8 = [a1[4] requestInfos];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v44;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v44 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v43 + 1) + 8 * v11);
        if (v12 != v7)
        {
          id v13 = a1[5];
          id v14 = [v12 requestKey];
          [v13 _removeConfigurationResourceForRequestKey:v14];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v9);
  }

  if (v7)
  {
    id v15 = objc_alloc_init(RCFallbackOperation);
    [(RCOperation *)v15 setQualityOfService:25];
    [(RCOperation *)v15 setRelativePriority:1];
    uint64_t v16 = [v7 fallbackURL];
    [(RCFallbackOperation *)v15 setFallbackURL:v16];

    id v17 = [v7 requestCacheKey];
    [(RCFallbackOperation *)v15 setRequestKey:v17];

    id v18 = [a1[4] debugOverrides];
    -[RCFallbackOperation setEnableExtraLogs:](v15, "setEnableExtraLogs:", [v18 enableExtraLogs]);

    id v19 = [a1[4] debugOverrides];
    -[RCFallbackOperation setEnvironment:](v15, "setEnvironment:", [v19 debugEnvironment]);

    id v20 = [a1[5] configResourceByRequestKey];
    id v21 = [v7 requestCacheKey];
    id v22 = [v20 objectForKeyedSubscript:v21];
    [(RCFallbackOperation *)v15 setCachedConfigurationResource:v22];

    [a1[4] fallbackTimeoutDuration];
    [(RCFallbackOperation *)v15 setFallbackTimeoutDuration:"setFallbackTimeoutDuration:"];
    id v23 = [a1[4] userID];
    [(RCFallbackOperation *)v15 setUserID:v23];

    uint64_t v24 = [a1[4] storefrontID];
    [(RCFallbackOperation *)v15 setStorefrontID:v24];

    objc_initWeak((id *)buf, v15);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_145;
    v38[3] = &unk_1E5B76550;
    int8x16_t v30 = *((int8x16_t *)a1 + 2);
    id v25 = (id)v30.i64[0];
    int8x16_t v39 = vextq_s8(v30, v30, 8uLL);
    [(RCFallbackOperation *)v15 setNetworkEventHandler:v38];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_2_146;
    v33[3] = &unk_1E5B76618;
    objc_copyWeak(&v37, (id *)buf);
    id v35 = a1[6];
    id v26 = v3;
    id v27 = a1[5];
    id v36 = v26;
    v33[4] = v27;
    id v34 = v7;
    [(RCFallbackOperation *)v15 setConfigurationCompletionHandler:v33];
    id v28 = [a1[5] runningOperationsLock];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_6;
    v31[3] = &unk_1E5B75F80;
    v31[4] = a1[5];
    id v29 = v15;
    id v32 = v29;
    [v28 performWithLockSync:v31];

    [(RCOperation *)v29 start];
    objc_destroyWeak(&v37);

    objc_destroyWeak((id *)buf);
  }
  else
  {
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_2;
    v40[3] = &unk_1E5B765F0;
    uint64_t v41 = (RCFallbackOperation *)a1[6];
    id v42 = v3;
    __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_2((uint64_t)v40);

    id v29 = v41;
  }
}

BOOL __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_141(uint64_t a1, void *a2)
{
  id v2 = [a2 fallbackURL];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_2(uint64_t a1)
{
  id v2 = RCSharedLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A4AB3000, v2, OS_LOG_TYPE_DEFAULT, "fallback operation failed, missing fallbackURL", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, 0, 0);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_145(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) networkEventHandler];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) networkEventHandler];
    ((void (**)(void, id, void, uint64_t))v4)[2](v4, v5, *(void *)(a1 + 40), 1);
  }
}

void __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_2_146(id *a1, void *a2, void *a3)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (!v5 || v6)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_3;
    v17[3] = &unk_1E5B76578;
    id v21 = a1[6];
    id v18 = v6;
    id v22 = a1[7];
    id v13 = WeakRetained;
    id v14 = a1[4];
    id v19 = v13;
    id v20 = v14;
    __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_3((uint64_t)v17);

    uint64_t v10 = v21;
  }
  else
  {
    [a1[4] _saveConfigurationResource:v5];
    id v8 = [a1[5] requestKey];
    id v23 = v8;
    uint64_t v9 = [v5 configurationData];
    v24[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];

    uint64_t v11 = (void (**)(id, void *, void))a1[6];
    if (v11) {
      v11[2](v11, v10, 0);
    }
    (*((void (**)(void))a1[7] + 2))();
    if (WeakRetained)
    {
      id v12 = [a1[4] runningOperationsLock];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_5;
      v15[3] = &unk_1E5B75F80;
      void v15[4] = a1[4];
      id v16 = WeakRetained;
      [v12 performWithLockSync:v15];
    }
  }
}

void __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, 0, *(void *)(a1 + 32));
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  if (*(void *)(a1 + 40))
  {
    uint64_t v3 = [*(id *)(a1 + 48) runningOperationsLock];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_4;
    v6[3] = &unk_1E5B75F80;
    int8x16_t v5 = *(int8x16_t *)(a1 + 40);
    id v4 = (id)v5.i64[0];
    int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
    [v3 performWithLockSync:v6];
  }
}

void __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) runningOperations];
  [v2 removeObject:*(void *)(a1 + 40)];
}

void __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) runningOperations];
  [v2 removeObject:*(void *)(a1 + 40)];
}

void __84__RCConfigurationManager__fetchConfigurationFromFallbackURLWithSettings_completion___block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) runningOperations];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)_saveConfigurationResource:(id)a3
{
  id v9 = a3;
  id v4 = [(RCConfigurationManager *)self configResourceByRequestKey];
  int8x16_t v5 = [v9 requestKey];
  [v4 setObject:v9 forKeyedSubscript:v5];

  id v6 = [(RCConfigurationManager *)self _encodeConfigurationResource:v9];
  if (v6)
  {
    int8x16_t v7 = [(RCConfigurationManager *)self localStore];
    id v8 = [v9 requestKey];
    [v7 setObject:v6 forKey:v8];
  }
}

- (void)_removeConfigurationResourceForRequestKey:(id)a3
{
  id v4 = a3;
  int8x16_t v5 = [(RCConfigurationManager *)self configResourceByRequestKey];
  [v5 removeObjectForKey:v4];

  id v6 = [(RCConfigurationManager *)self localStore];
  [v6 removeObjectForKey:v4];
}

- (id)_encodeConfigurationResource:(id)a3
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
}

- (id)networkEventHandler
{
  return self->_networkEventHandler;
}

- (RCConfigurationSettings)configurationSettings
{
  return self->_configurationSettings;
}

- (void)setConfigurationSettings:(id)a3
{
}

- (RCDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
}

- (NSURL)contentDirectoryURL
{
  return self->_contentDirectoryURL;
}

- (void)setContentDirectoryURL:(id)a3
{
}

- (RCAsyncSerialQueue)configRequestSerialQueue
{
  return self->_configRequestSerialQueue;
}

- (void)setConfigRequestSerialQueue:(id)a3
{
}

- (void)setLocalStore:(id)a3
{
}

- (NSMutableArray)runningOperations
{
  return self->_runningOperations;
}

- (void)setRunningOperations:(id)a3
{
}

- (RCUnfairLock)runningOperationsLock
{
  return self->_runningOperationsLock;
}

- (void)setRunningOperationsLock:(id)a3
{
}

- (NSMutableDictionary)backgroundURLSessionHandlers
{
  return self->_backgroundURLSessionHandlers;
}

- (void)setBackgroundURLSessionHandlers:(id)a3
{
}

- (RCUnfairLock)backgroundURLSessionHandlersLock
{
  return self->_backgroundURLSessionHandlersLock;
}

- (void)setBackgroundURLSessionHandlersLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundURLSessionHandlersLock, 0);
  objc_storeStrong((id *)&self->_backgroundURLSessionHandlers, 0);
  objc_storeStrong((id *)&self->_runningOperationsLock, 0);
  objc_storeStrong((id *)&self->_runningOperations, 0);
  objc_storeStrong((id *)&self->_configResourceByRequestKey, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_configRequestSerialQueue, 0);
  objc_storeStrong((id *)&self->_contentDirectoryURL, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_configurationSettings, 0);

  objc_storeStrong(&self->_networkEventHandler, 0);
}

- (void)reestablishBackgroundSessionWithSettings:sessionCompletionHandler:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "configurationSettings.backgroundFetchConfiguration");
  *(_DWORD *)buf = 136315906;
  id v2 = "-[RCConfigurationManager reestablishBackgroundSessionWithSettings:sessionCompletionHandler:]";
  __int16 v3 = 2080;
  id v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/RCConfigurationManager.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);
}

- (void)cancelAllTasksOnBackgroundSessionWithSettings:completion:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "configurationSettings.backgroundFetchConfiguration");
  *(_DWORD *)buf = 136315906;
  id v2 = "-[RCConfigurationManager cancelAllTasksOnBackgroundSessionWithSettings:completion:]";
  __int16 v3 = 2080;
  id v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/RCConfigurationManager.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);
}

@end