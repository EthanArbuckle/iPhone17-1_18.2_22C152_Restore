@interface WLKConfigurationManager
+ (id)sharedInstance;
- (WLKConfigurationManager)init;
- (double)extendedCacheExpireDuration;
- (id)_config;
- (id)_configuration;
- (id)_configurationWithOptions:(int64_t)a3 cachePolicy:(unint64_t)a4 queryParameters:(id)a5;
- (id)_init;
- (id)_stringForCachePolicy:(unint64_t)a3;
- (id)_utsk;
- (void)_fetchConfigurationWithOptions:(int64_t)a3 cachePolicy:(unint64_t)a4 queryParameters:(id)a5 completion:(id)a6;
- (void)_invalidateCache;
- (void)_invalidateNetworkCache;
- (void)_setConfig:(id)a3;
- (void)_setUtsk:(id)a3;
- (void)fetchConfigurationWithCompletionHandler:(id)a3;
- (void)fetchConfigurationWithOptions:(int64_t)a3 cachePolicy:(unint64_t)a4 queryParameters:(id)a5 completion:(id)a6;
- (void)setExtendedCacheExpireDuration:(double)a3;
@end

@implementation WLKConfigurationManager

- (void)setExtendedCacheExpireDuration:(double)a3
{
  self->_extendedCacheExpireDuration = a3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

void __97__WLKConfigurationManager__fetchConfigurationWithOptions_cachePolicy_queryParameters_completion___block_invoke_28(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    v5 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __97__WLKConfigurationManager__fetchConfigurationWithOptions_cachePolicy_queryParameters_completion___block_invoke_28_cold_1(a2, v4, v5);
    }
  }
  v6 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync", "", v7, 2u);
  }
}

void __97__WLKConfigurationManager__fetchConfigurationWithOptions_cachePolicy_queryParameters_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = [WeakRetained _config];
  v43 = [v2 utsk];
  switch(*(void *)(a1 + 64))
  {
    case 0:
      if (!v2) {
        goto LABEL_26;
      }
      if ([v2 isValid]) {
        goto LABEL_19;
      }
      v3 = WLKNetworkingLogObject();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Memory cache is no good. Load new one then replace the cache later when response comes", (uint8_t *)&buf, 2u);
      }

      goto LABEL_7;
    case 1:
      if (!v2) {
        goto LABEL_26;
      }
      goto LABEL_19;
    case 2:
      if (!v2) {
        goto LABEL_26;
      }
      goto LABEL_20;
    case 3:
LABEL_7:
      uint64_t v4 = 1;
      goto LABEL_27;
    case 4:
      if (!v2) {
        goto LABEL_26;
      }
      if ([v2 isValid]) {
        goto LABEL_19;
      }
      v5 = WLKNetworkingLogObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Memory cache is no good. If fails to load, use expired.", (uint8_t *)&buf, 2u);
      }

      uint64_t v4 = 0;
      char v6 = 0;
      goto LABEL_28;
    case 5:
      if (!v2) {
        goto LABEL_26;
      }
      [*(id *)(a1 + 32) extendedCacheExpireDuration];
      if ((objc_msgSend(v2, "isValidWithinExtendedExpiration:") & 1) == 0)
      {
        v11 = WLKNetworkingLogObject();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1BA2E8000, v11, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Memory cache is not valid within extended expiration duration, try to load another one", (uint8_t *)&buf, 2u);
        }

LABEL_26:
        uint64_t v4 = 0;
LABEL_27:
        char v6 = 1;
LABEL_28:
        v12 = WLKStartupSignpostLogObject();
        if (os_signpost_enabled(v12))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync", "", (uint8_t *)&buf, 2u);
        }

        +[WLKSettingsCloudUtilities synchronizeSettingsFromCloudIfNeededWithCompletion:&__block_literal_global_31];
        v13 = WLKNetworkingLogObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = [*(id *)(a1 + 32) _stringForCachePolicy:*(void *)(a1 + 64)];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v14;
          _os_log_impl(&dword_1BA2E8000, v13, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - fetchConfiguration with cachePolicy: %@", (uint8_t *)&buf, 0xCu);
        }
        v44 = (void *)[*(id *)(a1 + 40) mutableCopy];
        if (!v44)
        {
          v44 = [MEMORY[0x1E4F1CA60] dictionary];
        }
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v59 = 0x3032000000;
        v60 = __Block_byref_object_copy__1;
        v61 = __Block_byref_object_dispose__1;
        id v62 = 0;
        uint64_t v50 = 0;
        v51 = &v50;
        uint64_t v52 = 0x3032000000;
        v53 = __Block_byref_object_copy__1;
        v54 = __Block_byref_object_dispose__1;
        id v55 = 0;
        dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
        uint64_t v16 = *(void *)(a1 + 64);
        uint64_t v17 = *(void *)(a1 + 72);
        [*(id *)(a1 + 32) extendedCacheExpireDuration];
        double v19 = v18;
        if (v16 == 1) {
          uint64_t v20 = 2;
        }
        else {
          uint64_t v20 = v4;
        }
        uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 24);
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __97__WLKConfigurationManager__fetchConfigurationWithOptions_cachePolicy_queryParameters_completion___block_invoke_34;
        v46[3] = &unk_1E620A8C8;
        v48 = &v50;
        p_long long buf = &buf;
        v22 = v15;
        v47 = v22;
        +[WLKConfigurationRequest fetchWithOptions:v17 cachePolicy:v20 wlkCachePolicy:v16 extendedCacheExpireDuration:0 sessionConfiguration:v44 queryParameters:v21 fileStorage:v19 completion:v46];
        dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
        if (v2)
        {
          int v23 = [v2 isValidIgnoringExpiration];
          v24 = v51;
          if (v23)
          {
            char v25 = v6;
            if (v51[5]) {
              char v25 = 1;
            }
            if ((v25 & 1) == 0)
            {
              v26 = WLKNetworkingLogObject();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v56 = 0;
                _os_log_impl(&dword_1BA2E8000, v26, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Current init/config is valid and new init/config is nil. Policy allows the use of expired init/config.", v56, 2u);
              }

              (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_66:

              _Block_object_dispose(&v50, 8);
              _Block_object_dispose(&buf, 8);

              v10 = 0;
              goto LABEL_67;
            }
          }
        }
        else
        {
          v24 = v51;
        }
        [WeakRetained _setConfig:v24[5]];
        v27 = [(id)v51[5] utsk];
        if (v43 && ([v43 isEqualToString:v27] & 1) == 0)
        {
          v28 = WLKNetworkingLogObject();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v56 = 0;
            _os_log_impl(&dword_1BA2E8000, v28, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Posting UTSK didChange notification", v56, 2u);
          }

          v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
          v30 = [(id)v51[5] responseDictionary];
          [v29 postNotificationName:@"WLKServerConfigurationUTSKDidChangeNotification" object:v30];
        }
        if (v2)
        {
          v31 = [v2 responseDictionary];
          v32 = [(id)v51[5] responseDictionary];
          char v33 = [v31 isEqualToDictionary:v32];

          if ((v33 & 1) == 0)
          {
            v34 = WLKNetworkingLogObject();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v56 = 0;
              _os_log_impl(&dword_1BA2E8000, v34, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Posting in-process didChange notification", v56, 2u);
            }

            v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
            v36 = [(id)v51[5] responseDictionary];
            [v35 postNotificationName:@"WLKServerConfigurationDidChangeNotification" object:v36];
          }
        }
        uint64_t v37 = v51[5];
        v38 = WLKNetworkingLogObject();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = @"success";
          if (!v37) {
            v39 = @"failure";
          }
          *(_DWORD *)v56 = 138412290;
          v57 = v39;
          _os_log_impl(&dword_1BA2E8000, v38, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Firing completion handler %@", v56, 0xCu);
        }

        if (v37)
        {
          id v40 = 0;
        }
        else
        {
          v41 = WLKNetworkingLogObject();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = *(__CFString **)(*((void *)&buf + 1) + 40);
            *(_DWORD *)v56 = 138412290;
            v57 = v42;
            _os_log_impl(&dword_1BA2E8000, v41, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Error: %@", v56, 0xCu);
          }

          id v40 = *(id *)(*((void *)&buf + 1) + 40);
        }
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

        goto LABEL_66;
      }
LABEL_19:
      id v7 = v2;
LABEL_20:
      v8 = WLKNetworkingLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [*(id *)(a1 + 32) _stringForCachePolicy:*(void *)(a1 + 64)];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v9;
        _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Memory cache can be used for this policy, return it now, cachePolicy=%@", (uint8_t *)&buf, 0xCu);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      v10 = v2;
LABEL_67:

      return;
    default:
      goto LABEL_26;
  }
}

- (void)fetchConfigurationWithOptions:(int64_t)a3 cachePolicy:(unint64_t)a4 queryParameters:(id)a5 completion:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  if (!v11) {
    -[WLKConfigurationManager fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:]();
  }
  v12 = (void (**)(void, void, void))v11;
  v13 = [(WLKConfigurationManager *)self _config];
  v14 = v13;
  switch(a4)
  {
    case 0uLL:
      if (v13 && [v13 isValid]) {
        goto LABEL_4;
      }
      goto LABEL_17;
    case 1uLL:
    case 2uLL:
      if (v13) {
        goto LABEL_4;
      }
      goto LABEL_17;
    case 4uLL:
      if (!v13 || ([v13 isValidIgnoringExpiration] & 1) == 0) {
        goto LABEL_17;
      }
      goto LABEL_4;
    case 5uLL:
      uint64_t v17 = WLKNetworkingLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        double v18 = [(WLKConfigurationManager *)self _stringForCachePolicy:5];
        [(WLKConfigurationManager *)self extendedCacheExpireDuration];
        int v22 = 138412546;
        int v23 = v18;
        __int16 v24 = 2048;
        uint64_t v25 = v19;
        _os_log_impl(&dword_1BA2E8000, v17, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - PreCheck: cachePolicy=%@, extendedCacheExpireDuration=%f", (uint8_t *)&v22, 0x16u);
      }
      if (!v14) {
        goto LABEL_17;
      }
      [(WLKConfigurationManager *)self extendedCacheExpireDuration];
      if ((objc_msgSend(v14, "isValidWithinExtendedExpiration:") & 1) == 0) {
        goto LABEL_17;
      }
LABEL_4:
      dispatch_semaphore_t v15 = WLKNetworkingLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = [(WLKConfigurationManager *)self _stringForCachePolicy:a4];
        int v22 = 138412290;
        int v23 = v16;
        _os_log_impl(&dword_1BA2E8000, v15, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - PreCheck: Use memory cache immediately, cachePolicy: %@", (uint8_t *)&v22, 0xCu);
      }
      ((void (**)(void, void *, void))v12)[2](v12, v14, 0);
      break;
    default:
LABEL_17:
      uint64_t v20 = WLKNetworkingLogObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [(WLKConfigurationManager *)self _stringForCachePolicy:a4];
        int v22 = 138412290;
        int v23 = v21;
        _os_log_impl(&dword_1BA2E8000, v20, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - PreCheck: Enter fetchQueue to fetch configuration, cachePolicy: %@", (uint8_t *)&v22, 0xCu);
      }
      [(WLKConfigurationManager *)self _fetchConfigurationWithOptions:a3 cachePolicy:a4 queryParameters:v10 completion:v12];
      break;
  }
}

- (id)_stringForCachePolicy:(unint64_t)a3
{
  if (a3 > 5) {
    return @"Unmapped";
  }
  else {
    return off_1E620A938[a3];
  }
}

- (id)_config
{
  os_unfair_lock_lock(&__accessLock);
  v3 = self->_config;
  os_unfair_lock_unlock(&__accessLock);

  return v3;
}

- (double)extendedCacheExpireDuration
{
  return self->_extendedCacheExpireDuration;
}

- (void)_setUtsk:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&__accessLock);
  uint64_t v5 = [(WLKServerConfigurationResponse *)self->_config utsk];
  if (v5
    && (char v6 = (void *)v5,
        [(WLKServerConfigurationResponse *)self->_config utsk],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEqualToString:v4],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    v9 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(WLKServerConfigurationResponse *)self->_config utsk];
      int v16 = 138412546;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_1BA2E8000, v9, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Handling UTSK change: %@ -> %@", (uint8_t *)&v16, 0x16u);
    }
    id v11 = [(WLKServerConfigurationResponse *)self->_config configurationResponseByReplacingUTSK:v4];
    config = self->_config;
    self->_config = v11;
    v13 = v11;

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    dispatch_semaphore_t v15 = [(WLKServerConfigurationResponse *)self->_config responseDictionary];

    [v14 postNotificationName:@"WLKServerConfigurationUTSKDidChangeNotification" object:v15];
    os_unfair_lock_unlock(&__accessLock);
    [(WLKConfigurationManager *)self _invalidateCache];
  }
  else
  {
    os_unfair_lock_unlock(&__accessLock);
  }
}

uint64_t __97__WLKConfigurationManager__fetchConfigurationWithOptions_cachePolicy_queryParameters_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchConfigurationWithOptions:(int64_t)a3 cachePolicy:(unint64_t)a4 queryParameters:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __97__WLKConfigurationManager__fetchConfigurationWithOptions_cachePolicy_queryParameters_completion___block_invoke;
  v22[3] = &unk_1E620A218;
  id v23 = v11;
  id v12 = v11;
  v13 = (void *)MEMORY[0x1BA9E94D0](v22);
  objc_initWeak(&location, self);
  fetchQueue = self->_fetchQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __97__WLKConfigurationManager__fetchConfigurationWithOptions_cachePolicy_queryParameters_completion___block_invoke_2;
  v17[3] = &unk_1E620A8F0;
  objc_copyWeak(v20, &location);
  v20[1] = (id)a4;
  v20[2] = (id)a3;
  id v18 = v10;
  id v19 = v13;
  v17[4] = self;
  id v15 = v10;
  id v16 = v13;
  dispatch_async(fetchQueue, v17);

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
}

void __41__WLKConfigurationManager_sharedInstance__block_invoke()
{
  v0 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Init", "", buf, 2u);
  }

  id v1 = [[WLKConfigurationManager alloc] _init];
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

  v3 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)id v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Init", "", v4, 2u);
  }
}

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)WLKConfigurationManager;
  v2 = [(WLKConfigurationManager *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_extendedCacheExpireDuration = 0.0;
    id v4 = dispatch_get_global_queue(25, 0);
    dispatch_queue_t v5 = dispatch_queue_create_with_target_V2("WLKConfigurationManagerInternalFetch", 0, v4);
    fetchQueue = v3->_fetchQueue;
    v3->_fetchQueue = (OS_dispatch_queue *)v5;

    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v3 selector:sel__handleLibraryDidChangeNotification_ name:@"WLKAppLibraryDidChangeNotification" object:0];

    char v8 = [[WLKSharedFileStorage alloc] initWithFileName:@"serverConfiguration.plist" class:objc_opt_class()];
    fileCache = v3->_fileCache;
    v3->_fileCache = v8;
  }
  return v3;
}

- (void)_setConfig:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&__accessLock);
  objc_storeStrong((id *)&self->_config, a3);
  os_unfair_lock_unlock(&__accessLock);
  if (v6)
  {
    dispatch_queue_t v5 = +[WLKStoredConfigurationManager sharedInstance];
    [v5 _updateConfiguration:v6];
  }
}

void __97__WLKConfigurationManager__fetchConfigurationWithOptions_cachePolicy_queryParameters_completion___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  char v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (WLKConfigurationManager)init
{
  return 0;
}

- (void)fetchConfigurationWithCompletionHandler:(id)a3
{
}

- (id)_configuration
{
  return [(WLKConfigurationManager *)self _configurationWithOptions:0 cachePolicy:0 queryParameters:0];
}

- (id)_configurationWithOptions:(int64_t)a3 cachePolicy:(unint64_t)a4 queryParameters:(id)a5
{
  id v8 = a5;
  dispatch_assert_queue_not_V2(MEMORY[0x1E4F14428]);
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__1;
  uint64_t v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__WLKConfigurationManager__configurationWithOptions_cachePolicy_queryParameters___block_invoke;
  v14[3] = &unk_1E620A918;
  id v16 = &v17;
  id v10 = v9;
  id v15 = v10;
  [(WLKConfigurationManager *)self fetchConfigurationWithOptions:a3 cachePolicy:a4 queryParameters:v8 completion:v14];
  dispatch_time_t v11 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v10, v11);
  id v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v12;
}

void __81__WLKConfigurationManager__configurationWithOptions_cachePolicy_queryParameters___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (v6 && !a3) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_utsk
{
  os_unfair_lock_lock(&__accessLock);
  v3 = [(WLKServerConfigurationResponse *)self->_config utsk];
  id v4 = (void *)[v3 copy];

  os_unfair_lock_unlock(&__accessLock);

  return v4;
}

- (void)_invalidateCache
{
  v3 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Invalidating cache", v5, 2u);
  }

  os_unfair_lock_lock(&__accessLock);
  config = self->_config;
  self->_config = 0;

  os_unfair_lock_unlock(&__accessLock);
  [(WLKConfigurationManager *)self _invalidateNetworkCache];
}

- (void)_invalidateNetworkCache
{
  v3 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Invalidating URL cache", v4, 2u);
  }

  os_unfair_lock_lock(&__accessLock);
  [(WLKSharedFileStorage *)self->_fileCache delete:&__block_literal_global_43_0];
  os_unfair_lock_unlock(&__accessLock);
}

void __50__WLKConfigurationManager__invalidateNetworkCache__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKConfigurationManager - Invalidating disk cache success: %d Err: %@", (uint8_t *)v6, 0x12u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileCache, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_fetchQueue, 0);
}

- (void)fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:.cold.1()
{
  __assert_rtn("-[WLKConfigurationManager fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:]", "WLKConfigurationManager.m", 99, "completion != nil");
}

void __97__WLKConfigurationManager__fetchConfigurationWithOptions_cachePolicy_queryParameters_completion___block_invoke_28_cold_1(char a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = a1 & 1;
  id v5 = [a2 description];
  v6[0] = 67109378;
  v6[1] = v4;
  __int16 v7 = 2112;
  id v8 = v5;
  _os_log_error_impl(&dword_1BA2E8000, a3, OS_LOG_TYPE_ERROR, "WLKConfigurationManager - fetchConfiguration SettingsSync success: %d error: %@", (uint8_t *)v6, 0x12u);
}

@end