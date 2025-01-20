@interface AppletConfigurationData
+ (BOOL)setConfiguration:(id)a3;
+ dumpState;
+ (id)dataHash;
+ (id)extraDebugScriptForModule:(id)a3;
+ (id)getConfig;
+ (id)getDreamworksSettings;
+ (id)getExpressModeSettings;
+ (id)getHerculesSettings;
+ (id)getInstance;
+ (id)getNFCSettings;
+ (id)getOverrideConfig;
+ (id)getSlalomSettings;
+ (id)getStaticConfig;
+ (id)getStaticExpressModeSettings;
+ (id)getStaticHerculesSettings;
+ (id)getWuluSettings;
+ (id)plasticCardScriptForModule:(id)a3;
+ (id)pluginDecoderForMid:(id)a3;
+ (id)scriptForModule:(id)a3;
+ (void)init;
+ (void)registerStateHandler;
- (AppletConfigurationData)init;
- (id)optionsForInterval:(uint64_t)a1;
- (id)pluginDecoderForMid:(int)a3 depth:;
- (uint64_t)isEligibleAsset:(uint64_t)a1;
- (void)downloadAsset:(uint64_t)a1;
- (void)handleAvailableAsset:(dispatch_queue_t *)a1;
- (void)handleQueryResult:(void *)a3 query:;
- (void)handleQuerySuccess:(dispatch_queue_t *)a1;
- (void)maybeQueryMetadata;
- (void)queryMA;
- (void)queryMetadata;
- (void)retryWithBackoff:(uint64_t)a1;
- (void)tsmScriptPerformed:(id)a3;
@end

@implementation AppletConfigurationData

+ (id)getOverrideConfig
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  self;
  v0 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/AppleInternal/com.apple.stockholm.atl.override.plist"];
  id v7 = 0;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v0 error:&v7];
  id v2 = v7;
  if (v1)
  {
    self;
    id v3 = v1;
  }
  else
  {
    v4 = ATLLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [v2 code];
      *(_DWORD *)buf = 67109120;
      int v9 = v5;
      _os_log_impl(&dword_1CA552000, v4, OS_LOG_TYPE_DEFAULT, "No valid override found %d", buf, 8u);
    }
  }

  return v1;
}

+ (id)getInstance
{
  self;
  if (getInstance_onceToken_2 != -1) {
    dispatch_once(&getInstance_onceToken_2, &__block_literal_global_5);
  }
  v0 = (void *)getInstance_inst_1;

  return v0;
}

uint64_t __38__AppletConfigurationData_getInstance__block_invoke()
{
  getInstance_inst_1 = objc_alloc_init(AppletConfigurationData);

  return MEMORY[0x1F41817F8]();
}

- (AppletConfigurationData)init
{
  *(void *)&v41[5] = *MEMORY[0x1E4F143B8];
  v39.receiver = self;
  v39.super_class = (Class)AppletConfigurationData;
  id v2 = [(AppletConfigurationData *)&v39 init];
  if (!v2) {
    goto LABEL_26;
  }
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("ATLConfiguration", v3);
  queue = v2->queue;
  v2->queue = (OS_dispatch_queue *)v4;

  v2->maErrorCount = 0;
  v2->retryInProgress = 0;
  uint64_t v6 = +[AppletTranslator userDefaults]();
  userDefaults = v2->userDefaults;
  v2->userDefaults = (NSUserDefaults *)v6;

  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  pluginCache = v2->pluginCache;
  v2->pluginCache = v8;

  int v10 = +[AppletTranslator isInternalBuild]();
  if (v10)
  {
    v11 = [(NSUserDefaults *)v2->userDefaults objectForKey:@"debug.maMetadataQueryTimeInterval"];

    if (v11)
    {
      v12 = [(NSUserDefaults *)v2->userDefaults objectForKey:@"debug.maMetadataQueryTimeInterval"];
      v2->maMetadataQueryInterval = (double)(int)[v12 intValue];
    }
    else
    {
      v2->maMetadataQueryInterval = 604800.0;
    }
    uint64_t v13 = +[AppletConfigurationData getOverrideConfig]();
    config = v2->config;
    v2->config = (NSDictionary *)v13;

    if (v13)
    {
      v15 = ATLLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA552000, v15, OS_LOG_TYPE_DEFAULT, "Override configuration, disabling updates via MA", buf, 2u);
      }

      v16 = v2;
      goto LABEL_26;
    }
  }
  else
  {
    v2->maMetadataQueryInterval = 604800.0;
  }
  v17 = +[AppletConfigurationData getStaticConfig];
  v18 = (void *)[v17 mutableCopy];

  v19 = [(NSUserDefaults *)v2->userDefaults objectForKey:@"config"];
  v20 = ATLLogObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v41 = v19;
    _os_log_impl(&dword_1CA552000, v20, OS_LOG_TYPE_DEFAULT, "Loaded persisted MA config %@", buf, 0xCu);
  }

  if (v19)
  {
    v21 = [v19 objectForKeyedSubscript:@"_CompatibilityVersion"];
    int v22 = [v21 intValue];

    if (v22 == 6)
    {
      [v18 addEntriesFromDictionary:v19];
    }
    else
    {
      v23 = ATLLogObject();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v41[0] = v22;
        LOWORD(v41[1]) = 1024;
        *(_DWORD *)((char *)&v41[1] + 2) = 6;
        _os_log_impl(&dword_1CA552000, v23, OS_LOG_TYPE_DEFAULT, "Incompatible (%d != %d) version, deleting it", buf, 0xEu);
      }

      [(NSUserDefaults *)v2->userDefaults removeObjectForKey:@"config"];
    }
  }
  objc_storeStrong((id *)&v2->config, v18);
  v24 = ATLLogObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = v2->config;
    *(_DWORD *)buf = 138412290;
    *(void *)v41 = v25;
    _os_log_impl(&dword_1CA552000, v24, OS_LOG_TYPE_DEFAULT, "Resolved config %@", buf, 0xCu);
  }

  if (v10) {
    [(NSUserDefaults *)v2->userDefaults setObject:&unk_1F24E1F60 forKey:@"debug.currentCompatibilityVersion"];
  }
  v26 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v26 addObserver:v2 selector:sel_tsmScriptPerformed_ name:@"com.apple.stockholm.tsm.script.executed" object:0];

  v27 = ATLLogObject();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v41 = @"com.apple.stockholm.tsm.script.executed";
    _os_log_impl(&dword_1CA552000, v27, OS_LOG_TYPE_DEFAULT, "Listening to %@", buf, 0xCu);
  }

  v28 = v2->queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__AppletConfigurationData_init__block_invoke;
  block[3] = &unk_1E65AE068;
  v29 = v2;
  v38 = v29;
  dispatch_async(v28, block);
  dispatch_time_t v30 = dispatch_time(0, 15000000000);
  v31 = v2->queue;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __31__AppletConfigurationData_init__block_invoke_2;
  v35[3] = &unk_1E65AE068;
  v32 = v29;
  v36 = v32;
  dispatch_after(v30, v31, v35);
  v33 = v32;

LABEL_26:
  return v2;
}

void __31__AppletConfigurationData_init__block_invoke(uint64_t a1)
{
}

- (void)queryMA
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    id v2 = ATLLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA552000, v2, OS_LOG_TYPE_DEFAULT, "Querying MA", buf, 2u);
    }

    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F77FB8]) initWithType:@"com.apple.MobileAsset.AppletTranslationLibraryAssets"];
    [v3 setDoNotBlockBeforeFirstUnlock:1];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __34__AppletConfigurationData_queryMA__block_invoke;
    v5[3] = &unk_1E65AE298;
    v5[4] = a1;
    id v6 = v3;
    id v4 = v3;
    [v4 queryMetaData:v5];
  }
}

void __31__AppletConfigurationData_init__block_invoke_2(uint64_t a1)
{
}

- (void)maybeQueryMetadata
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    id v2 = [*(id *)(a1 + 16) objectForKey:@"nextMetadataCheck"];
    id v3 = v2;
    if (v2)
    {
      [v2 timeIntervalSinceNow];
      double v5 = v4;
    }
    else
    {
      double v5 = -1.0;
    }
    if (v5 <= *(double *)(a1 + 56))
    {
      id v6 = v3;
    }
    else
    {
      id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:];

      [*(id *)(a1 + 16) setObject:v6 forKey:@"nextMetadataCheck"];
      id v7 = ATLLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        double v13 = v5;
        __int16 v14 = 2112;
        double v15 = *(double *)&v6;
        _os_log_impl(&dword_1CA552000, v7, OS_LOG_TYPE_DEFAULT, "Clamping ttnc %.0f to interval, next check %@", buf, 0x16u);
      }

      double v5 = *(double *)(a1 + 56);
    }
    v8 = ATLLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      double v13 = *(double *)&v6;
      __int16 v14 = 2048;
      double v15 = v5;
      _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_DEFAULT, "nextCheck %@ ttNC %.0f", buf, 0x16u);
    }

    if (v5 <= 0.0)
    {
      -[AppletConfigurationData queryMetadata](a1);
    }
    else
    {
      dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
      int v10 = *(NSObject **)(a1 + 8);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__AppletConfigurationData_maybeQueryMetadata__block_invoke;
      block[3] = &unk_1E65AE068;
      void block[4] = a1;
      dispatch_after(v9, v10, block);
    }
  }
}

+ (id)getConfig
{
  self;
  +[AppletConfigurationData getInstance]();
  v0 = (id *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v0);
  id v1 = v0[3];
  objc_sync_exit(v0);

  return v1;
}

uint64_t __45__AppletConfigurationData_maybeQueryMetadata__block_invoke(uint64_t a1)
{
  return -[AppletConfigurationData maybeQueryMetadata](*(void *)(a1 + 32));
}

- (void)queryMetadata
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    id v2 = [*(id *)(a1 + 16) objectForKey:@"catalogDownloadStartedOn"];
    id v3 = v2;
    if (v2)
    {
      [v2 timeIntervalSinceNow];
      double v5 = fabs(v4);
    }
    else
    {
      id v6 = *(void **)(a1 + 16);
      id v7 = [MEMORY[0x1E4F1C9C8] now];
      [v6 setObject:v7 forKey:@"catalogDownloadStartedOn"];

      double v5 = 0.0;
    }
    v8 = -[AppletConfigurationData optionsForInterval:](a1, v5);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__AppletConfigurationData_queryMetadata__block_invoke;
    v9[3] = &unk_1E65AE248;
    v9[4] = a1;
    [MEMORY[0x1E4F77FB0] startCatalogDownload:@"com.apple.MobileAsset.AppletTranslationLibraryAssets" options:v8 then:v9];
  }
}

- (id)optionsForInterval:(uint64_t)a1
{
  if (a1)
  {
    id v3 = objc_opt_new();
    [v3 setRequiresPowerPluggedIn:a2 < 604800.0];
    [v3 setDiscretionary:a2 < 1209600.0];
    [v3 setAllowsCellularAccess:a2 > 1209600.0];
    [v3 setAllowsExpensiveAccess:a2 > 1814400.0];
    [v3 logOptions];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void __40__AppletConfigurationData_queryMetadata__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v4 = ATLLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v9 = a2;
    _os_log_impl(&dword_1CA552000, v4, OS_LOG_TYPE_DEFAULT, "catalog download result %ld", buf, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 8);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__AppletConfigurationData_queryMetadata__block_invoke_835;
  v7[3] = &unk_1E65AE220;
  v7[4] = v5;
  v7[5] = a2;
  dispatch_async(v6, v7);
}

void __40__AppletConfigurationData_queryMetadata__block_invoke_835(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 8))
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__AppletConfigurationData_queryMetadata__block_invoke_2;
    v10[3] = &unk_1E65AE068;
    v10[4] = v2;
    -[AppletConfigurationData retryWithBackoff:](v2, v10);
  }
  else
  {
    [*(id *)(v2 + 16) removeObjectForKey:@"catalogDownloadStartedOn"];
    *(void *)(*(void *)(a1 + 32) + 40) = 0;
    double v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:*(double *)(*(void *)(a1 + 32) + 56)];
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v4 forKey:@"nextMetadataCheck"];
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(*(double *)(*(void *)(a1 + 32) + 56) * 1000000000.0));
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(NSObject **)(v6 + 8);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__AppletConfigurationData_queryMetadata__block_invoke_3;
    v9[3] = &unk_1E65AE068;
    v9[4] = v6;
    dispatch_after(v5, v7, v9);
    v8 = ATLLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_DEFAULT, "Metadata downloaded success, next check %@", buf, 0xCu);
    }

    -[AppletConfigurationData queryMA](*(void *)(a1 + 32));
  }
}

void __40__AppletConfigurationData_queryMetadata__block_invoke_2(uint64_t a1)
{
}

- (void)retryWithBackoff:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(unsigned char *)(a1 + 48))
    {
      double v4 = ATLLogObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA552000, v4, OS_LOG_TYPE_DEFAULT, "Retry is already in progress, dropping error", buf, 2u);
      }
    }
    else
    {
      unint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = 7;
      if (v5 < 7) {
        uint64_t v6 = *(void *)(a1 + 40);
      }
      uint64_t v7 = retryWithBackoff__backoffTable[v6];
      *(unsigned char *)(a1 + 48) = 1;
      *(void *)(a1 + 40) = v5 + 1;
      v8 = ATLLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134218240;
        uint64_t v15 = v9;
        __int16 v16 = 2048;
        uint64_t v17 = v7;
        _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "ec %lu retry in %lu sec", buf, 0x16u);
      }

      dispatch_time_t v10 = dispatch_time(0, 1000000000 * v7);
      v11 = *(NSObject **)(a1 + 8);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __44__AppletConfigurationData_retryWithBackoff___block_invoke;
      v12[3] = &unk_1E65AE330;
      v12[4] = a1;
      id v13 = v3;
      dispatch_after(v10, v11, v12);
    }
  }
}

void __40__AppletConfigurationData_queryMetadata__block_invoke_3(uint64_t a1)
{
}

- (void)tsmScriptPerformed:(id)a3
{
  queue = self->queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AppletConfigurationData_tsmScriptPerformed___block_invoke;
  block[3] = &unk_1E65AE068;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __46__AppletConfigurationData_tsmScriptPerformed___block_invoke(uint64_t a1)
{
  uint64_t v2 = ATLLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1CA552000, v2, OS_LOG_TYPE_DEFAULT, "TSM script performed, synchronizing catalog as well", v3, 2u);
  }

  -[AppletConfigurationData queryMetadata](*(void *)(a1 + 32));
}

void __34__AppletConfigurationData_queryMA__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__AppletConfigurationData_queryMA__block_invoke_2;
  block[3] = &unk_1E65AE270;
  void block[4] = v2;
  uint64_t v6 = a2;
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, block);
}

void __34__AppletConfigurationData_queryMA__block_invoke_2(uint64_t a1)
{
}

- (void)handleQueryResult:(void *)a3 query:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[1]);
    objc_initWeak(&location, a1);
    uint64_t v6 = ATLLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a2;
      _os_log_impl(&dword_1CA552000, v6, OS_LOG_TYPE_DEFAULT, "Query %@ result %ld", buf, 0x16u);
    }

    switch(a2)
    {
      case 0:
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v9 = [v5 results];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v33 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v25;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v25 != v11) {
                objc_enumerationMutation(v9);
              }
              id v13 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
              __int16 v14 = (dispatch_queue_t *)objc_loadWeakRetained(&location);
              -[AppletConfigurationData handleQuerySuccess:](v14, v13);

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v33 count:16];
          }
          while (v10);
        }

        break;
      case 1:
      case 3:
      case 4:
      case 6:
      case 8:
      case 10:
      case 12:
        uint64_t v7 = ATLLogObject();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = a2;
          _os_log_impl(&dword_1CA552000, v7, OS_LOG_TYPE_ERROR, "MA Transient error %ld", buf, 0xCu);
        }

        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __51__AppletConfigurationData_handleQueryResult_query___block_invoke;
        v28[3] = &unk_1E65AE1F8;
        objc_copyWeak(&v29, &location);
        -[AppletConfigurationData retryWithBackoff:]((uint64_t)a1, v28);
        objc_destroyWeak(&v29);
        break;
      case 2:
        -[AppletConfigurationData queryMetadata]((uint64_t)a1);
        break;
      case 5:
      case 7:
      case 11:
      case 13:
      case 14:
        v8 = ATLLogObject();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "MA Fatal Error not retrying", buf, 2u);
        }

        break;
      case 9:
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x2020000000;
        int v32 = -1;
        uint64_t v15 = ATLLogObject();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_1CA552000, v15, OS_LOG_TYPE_DEFAULT, "Registering for lock status changes", v23, 2u);
        }

        uint64_t v16 = *(void *)&buf[8];
        uint64_t v17 = a1[1];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __51__AppletConfigurationData_handleQueryResult_query___block_invoke_839;
        v21[3] = &unk_1E65AE2C0;
        v21[4] = buf;
        objc_copyWeak(&v22, &location);
        notify_register_dispatch("com.apple.mobile.keybagd.lock_status", (int *)(v16 + 24), v17, v21);
        if (MKBDeviceUnlockedSinceBoot())
        {
          uint64_t v18 = ATLLogObject();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v23 = 0;
            _os_log_impl(&dword_1CA552000, v18, OS_LOG_TYPE_DEFAULT, "Device unlocked between last query and registration, canceling notify and requery", v23, 2u);
          }

          int v19 = *(_DWORD *)(*(void *)&buf[8] + 24);
          if (v19 >= 1)
          {
            notify_cancel(v19);
            *(_DWORD *)(*(void *)&buf[8] + 24) = -1;
          }
          id v20 = objc_loadWeakRetained(&location);
          -[AppletConfigurationData queryMA](v20);
        }
        objc_destroyWeak(&v22);
        _Block_object_dispose(buf, 8);
        break;
      default:
        break;
    }
    objc_destroyWeak(&location);
  }
}

void __51__AppletConfigurationData_handleQueryResult_query___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[AppletConfigurationData queryMA](WeakRetained);
}

- (void)handleQuerySuccess:(dispatch_queue_t *)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    dispatch_assert_queue_V2(a1[1]);
    double v4 = ATLLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 assetId];
      uint64_t v6 = [v3 state];
      uint64_t v7 = [v3 attributes];
      *(_DWORD *)buf = 138412802;
      int v19 = v5;
      __int16 v20 = 2048;
      uint64_t v21 = v6;
      __int16 v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_1CA552000, v4, OS_LOG_TYPE_DEFAULT, "Got asset id %@ state %ld attributes %@", buf, 0x20u);
    }
    if (-[AppletConfigurationData isEligibleAsset:]((uint64_t)a1, v3))
    {
      uint64_t v8 = [v3 state];
      uint64_t v9 = &__block_literal_global_845;
      switch(v8)
      {
        case 0:
          uint64_t v12 = ATLLogObject();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA552000, v12, OS_LOG_TYPE_DEFAULT, "Unknown asset state . . . ", buf, 2u);
          }

          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __46__AppletConfigurationData_handleQuerySuccess___block_invoke_843;
          v15[3] = &unk_1E65AE1F8;
          objc_copyWeak(&v16, &location);
          -[AppletConfigurationData retryWithBackoff:]((uint64_t)a1, v15);
          objc_destroyWeak(&v16);
          break;
        case 1:
        case 4:
          uint64_t v11 = a1[1];
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __46__AppletConfigurationData_handleQuerySuccess___block_invoke_2;
          v13[3] = &unk_1E65AE308;
          v13[4] = a1;
          id v14 = v3;
          dispatch_async(v11, v13);

          break;
        case 2:
        case 5:
        case 6:
          -[AppletConfigurationData handleAvailableAsset:](a1, v3);
          break;
        case 3:
          goto LABEL_11;
        default:
          break;
      }
    }
    else if ([v3 state] == 2)
    {
      uint64_t v10 = ATLLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA552000, v10, OS_LOG_TYPE_DEFAULT, "Purgning ineligible asset in installed state", buf, 2u);
      }

      uint64_t v9 = &__block_literal_global_842;
LABEL_11:
      [v3 purge:v9];
    }
    objc_destroyWeak(&location);
  }
}

void __51__AppletConfigurationData_handleQueryResult_query___block_invoke_839(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = ATLLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1CA552000, v2, OS_LOG_TYPE_DEFAULT, "Got lock status change, querying and canceling notify token %d", (uint8_t *)v5, 8u);
  }

  if (*(int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) >= 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[AppletConfigurationData queryMA](WeakRetained);

    notify_cancel(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -1;
  }
}

- (uint64_t)isEligibleAsset:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = v3;
  if (a1)
  {
    id v5 = [v3 attributes];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"_CompatibilityVersion"];
    int v7 = [v6 intValue];

    if (v7 == 6)
    {
      uint64_t v8 = [*(id *)(a1 + 16) objectForKey:@"config"];
      uint64_t v9 = [v8 objectForKeyedSubscript:@"_ContentVersion"];

      uint64_t v10 = [v4 attributes];
      uint64_t v11 = [v10 objectForKeyedSubscript:@"_ContentVersion"];

      if (!v9 || [v9 compare:v11] == -1)
      {
        uint64_t v12 = MGCopyAnswer();
        id v14 = [v4 attributes];
        uint64_t v15 = [v14 objectForKeyedSubscript:@"deviceClasses"];

        uint64_t v13 = [v15 containsObject:v12];
        if ((v13 & 1) == 0)
        {
          id v16 = ATLLogObject();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = 138412546;
            *(void *)int v19 = v15;
            *(_WORD *)&v19[8] = 2112;
            __int16 v20 = v12;
            _os_log_impl(&dword_1CA552000, v16, OS_LOG_TYPE_DEFAULT, "Asset ineligible because device class %@ does not contain %@", (uint8_t *)&v18, 0x16u);
          }
        }
      }
      else
      {
        uint64_t v12 = ATLLogObject();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412546;
          *(void *)int v19 = v11;
          *(_WORD *)&v19[8] = 2112;
          __int16 v20 = v9;
          _os_log_impl(&dword_1CA552000, v12, OS_LOG_TYPE_DEFAULT, "Asset CV %@ <= currentCV %@", (uint8_t *)&v18, 0x16u);
        }
        uint64_t v13 = 0;
      }
    }
    else
    {
      uint64_t v9 = ATLLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 67109376;
        *(_DWORD *)int v19 = v7;
        *(_WORD *)&v19[4] = 1024;
        *(_DWORD *)&v19[6] = 6;
        _os_log_impl(&dword_1CA552000, v9, OS_LOG_TYPE_DEFAULT, "Asset ineligible, asset compatVersion %d mine %d", (uint8_t *)&v18, 0xEu);
      }
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

void __46__AppletConfigurationData_handleQuerySuccess___block_invoke_843(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[AppletConfigurationData queryMA](WeakRetained);
}

void __46__AppletConfigurationData_handleQuerySuccess___block_invoke_2(uint64_t a1)
{
}

- (void)downloadAsset:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    double v4 = [*(id *)(a1 + 16) objectForKey:@"assetDownloadStartedOn"];
    id v5 = v4;
    if (v4)
    {
      [v4 timeIntervalSinceNow];
      double v7 = fabs(v6);
    }
    else
    {
      uint64_t v8 = *(void **)(a1 + 16);
      uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
      [v8 setObject:v9 forKey:@"assetDownloadStartedOn"];

      double v7 = 0.0;
    }
    uint64_t v10 = -[AppletConfigurationData optionsForInterval:](a1, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __41__AppletConfigurationData_downloadAsset___block_invoke;
    v11[3] = &unk_1E65AE298;
    v11[4] = a1;
    id v12 = v3;
    [v12 startDownload:v10 then:v11];
  }
}

- (void)handleAvailableAsset:(dispatch_queue_t *)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[1]);
    if (-[AppletConfigurationData isEligibleAsset:]((uint64_t)a1, v3))
    {
      double v4 = [v3 getLocalFileUrl];
      id v5 = [v4 URLByAppendingPathComponent:@"ATLConfiguration.plist"];

      id v19 = 0;
      double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v5 error:&v19];
      id v7 = v19;
      if (v6)
      {
        uint64_t v8 = [v6 mutableCopy];
        uint64_t v9 = [v3 attributes];
        uint64_t v10 = [v9 objectForKeyedSubscript:@"_CompatibilityVersion"];
        [v8 setObject:v10 forKeyedSubscript:@"_CompatibilityVersion"];

        uint64_t v11 = [v3 attributes];
        id v12 = [v11 objectForKeyedSubscript:@"_ContentVersion"];
        [v8 setObject:v12 forKeyedSubscript:@"_ContentVersion"];

        uint64_t v13 = +[AppletConfigurationData getStaticConfig];
        id v14 = (void *)[v13 mutableCopy];

        [v14 addEntriesFromDictionary:v8];
        uint64_t v15 = a1;
        objc_sync_enter(v15);
        objc_storeStrong(v15 + 3, v14);
        [v15[4] removeAllObjects];
        objc_sync_exit(v15);

        [v15[2] setObject:v8 forKey:@"config"];
        [v15[2] synchronize];
        [v3 purge:&__block_literal_global_857];
        id v16 = ATLLogObject();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = [v8 objectForKeyedSubscript:@"_ContentVersion"];
          *(_DWORD *)buf = 138412290;
          uint64_t v21 = v17;
          _os_log_impl(&dword_1CA552000, v16, OS_LOG_TYPE_DEFAULT, "Asset version %@ successfully set and syncrhonized", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v8 = ATLLogObject();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v21 = v5;
          __int16 v22 = 2112;
          id v23 = v7;
          _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "Failed to load config at URL %@ error %@", buf, 0x16u);
        }
      }
    }
    else
    {
      int v18 = ATLLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA552000, v18, OS_LOG_TYPE_DEFAULT, "Purging ineligible asset", buf, 2u);
      }

      [v3 purge:&__block_literal_global_851];
    }
  }
}

void __41__AppletConfigurationData_downloadAsset___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__AppletConfigurationData_downloadAsset___block_invoke_2;
  block[3] = &unk_1E65AE270;
  uint64_t v6 = a2;
  void block[4] = v2;
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, block);
}

void __41__AppletConfigurationData_downloadAsset___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = ATLLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134217984;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1CA552000, v2, OS_LOG_TYPE_DEFAULT, "Download result %ld", buf, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 48);
  if (v4 == 10 || v4 == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:@"assetDownloadStartedOn"];
    -[AppletConfigurationData handleAvailableAsset:](*(dispatch_queue_t **)(a1 + 32), *(void **)(a1 + 40));
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__AppletConfigurationData_downloadAsset___block_invoke_849;
    v7[3] = &unk_1E65AE068;
    v7[4] = v6;
    -[AppletConfigurationData retryWithBackoff:](v6, v7);
  }
}

uint64_t __41__AppletConfigurationData_downloadAsset___block_invoke_849(uint64_t a1)
{
  return -[AppletConfigurationData queryMA](*(void *)(a1 + 32));
}

uint64_t __44__AppletConfigurationData_retryWithBackoff___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)pluginDecoderForMid:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[AppletConfigurationData getInstance]();
  id v5 = -[AppletConfigurationData pluginDecoderForMid:depth:](v4, v3, 0);

  return v5;
}

- (id)pluginDecoderForMid:(int)a3 depth:
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = a1;
    objc_sync_enter(v6);
    id v7 = [v6[4] objectForKeyedSubscript:v5];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = v8;
    }
    else
    {
      uint64_t v10 = [v6[3] objectForKeyedSubscript:v5];
      uint64_t v11 = [v10 objectForKeyedSubscript:@"pluginData"];

      if (v11)
      {
        id v12 = +[PluginDecoder decoderWithData:]((uint64_t)PluginDecoder, v11);
        if (v12) {
          [v6[4] setObject:v12 forKeyedSubscript:v5];
        }
        id v8 = v12;
        uint64_t v9 = v8;
      }
      else
      {
        uint64_t v13 = [v6[3] objectForKeyedSubscript:v5];
        id v14 = [v13 objectForKeyedSubscript:@"pluginAlias"];

        uint64_t v9 = 0;
        if (a3 <= 11 && v14)
        {
          uint64_t v9 = -[AppletConfigurationData pluginDecoderForMid:depth:](v6, v14, (a3 + 1));
        }

        id v8 = 0;
      }
    }
    objc_sync_exit(v6);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)dataHash
{
  uint64_t v2 = +[AppletConfigurationData getConfig]();
  id v3 = +[HashHelper hashHelper]();
  -[HashHelper addDictionary:](v3, v2);
  uint64_t v4 = (char *)objc_claimAutoreleasedReturnValue();
  id v5 = -[HashHelper getHash](v4);

  return v5;
}

+ (id)scriptForModule:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[AppletConfigurationData getConfig]();
  id v5 = [v4 objectForKeyedSubscript:v3];

  uint64_t v6 = [v5 objectForKeyedSubscript:@"appletConfigurationScript"];

  return v6;
}

+ (id)plasticCardScriptForModule:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[AppletConfigurationData getConfig]();
  id v5 = [v4 objectForKeyedSubscript:v3];

  uint64_t v6 = [v5 objectForKeyedSubscript:@"appletPlasticModeScript"];

  return v6;
}

+ (id)extraDebugScriptForModule:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[AppletConfigurationData getConfig]();
  id v5 = [v4 objectForKeyedSubscript:v3];

  uint64_t v6 = [v5 objectForKeyedSubscript:@"appletDebugScript"];

  return v6;
}

+ (id)getNFCSettings
{
  uint64_t v2 = +[AppletConfigurationData getConfig]();
  id v3 = [v2 objectForKeyedSubscript:@"nfcSettings"];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v5 = ATLLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1CA552000, v5, OS_LOG_TYPE_ERROR, "No NFC Settings in config?!", v7, 2u);
    }

    id v4 = (id)MEMORY[0x1E4F1CC08];
  }

  return v4;
}

+ (id)getWuluSettings
{
  uint64_t v2 = +[AppletConfigurationData getConfig]();
  id v3 = [v2 objectForKeyedSubscript:@"wuluSettings"];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v5 = ATLLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1CA552000, v5, OS_LOG_TYPE_ERROR, "No Wulu Settings in config?!", v7, 2u);
    }

    id v4 = (id)MEMORY[0x1E4F1CC08];
  }

  return v4;
}

+ (id)getHerculesSettings
{
  uint64_t v2 = +[AppletConfigurationData getConfig]();
  id v3 = [v2 objectForKeyedSubscript:@"herculesSettings"];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v5 = ATLLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1CA552000, v5, OS_LOG_TYPE_ERROR, "No Hercules Settings in config?!", v7, 2u);
    }

    id v4 = (id)MEMORY[0x1E4F1CC08];
  }

  return v4;
}

+ (id)getSlalomSettings
{
  uint64_t v2 = +[AppletConfigurationData getConfig]();
  id v3 = [v2 objectForKeyedSubscript:@"slalomSettings"];

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (id)MEMORY[0x1E4F1CC08];
  }

  return v4;
}

+ (id)getDreamworksSettings
{
  uint64_t v2 = +[AppletConfigurationData getConfig]();
  id v3 = [v2 objectForKeyedSubscript:@"dreamworksSettings"];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v5 = ATLLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1CA552000, v5, OS_LOG_TYPE_ERROR, "No Dreamworks Settings in config?!", v7, 2u);
    }

    id v4 = (id)MEMORY[0x1E4F1CC08];
  }

  return v4;
}

+ (id)getExpressModeSettings
{
  uint64_t v2 = +[AppletConfigurationData getConfig]();
  id v3 = [v2 objectForKeyedSubscript:@"expressMode"];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v5 = ATLLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1CA552000, v5, OS_LOG_TYPE_ERROR, "No EM Settings in config?!", v7, 2u);
    }

    id v4 = (id)MEMORY[0x1E4F1CC08];
  }

  return v4;
}

+ (BOOL)setConfiguration:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v3 = +[AppletConfigurationData getStaticConfig];
    +[AppletConfigurationData getInstance]();
    id v4 = (id *)objc_claimAutoreleasedReturnValue();
    [v4[4] removeAllObjects];
  }
  self;
  id v5 = +[AppletConfigurationData getInstance]();
  uint64_t v6 = (void *)v5[3];
  v5[3] = v3;

  return 1;
}

+ (void)init
{
  id v2 = +[AppletConfigurationData getInstance]();

  +[AppletConfigurationData registerStateHandler]();
}

+ (void)registerStateHandler
{
  self;
  if (registerStateHandler_onceToken != -1)
  {
    dispatch_once(&registerStateHandler_onceToken, &__block_literal_global_862);
  }
}

uint64_t __47__AppletConfigurationData_registerStateHandler__block_invoke()
{
  return os_state_add_handler();
}

_DWORD *__47__AppletConfigurationData_registerStateHandler__block_invoke_2()
{
  return +[AppletConfigurationData dumpState]();
}

+ dumpState
{
  void *v0;
  void *v1;
  void *v2;
  _DWORD *v3;
  id v4;

  self;
  v0 = (void *)MEMORY[0x1E4F28F98];
  id v1 = +[AppletConfigurationData getConfig]();
  id v2 = [v0 dataWithPropertyList:v1 format:200 options:0 error:0];

  id v3 = malloc_type_calloc(1uLL, [v2 length] + 200, 0x892A2071uLL);
  *id v3 = 1;
  v3[1] = [v2 length];
  __strlcpy_chk();
  id v4 = v2;
  memcpy(v3 + 50, (const void *)[v4 bytes], [v4 length]);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->pluginCache, 0);
  objc_storeStrong((id *)&self->config, 0);
  objc_storeStrong((id *)&self->userDefaults, 0);

  objc_storeStrong((id *)&self->queue, 0);
}

+ (id)getStaticConfig
{
  v34[2] = *MEMORY[0x1E4F143B8];
  v25[0] = @"appletConfigurationScript";
  v25[1] = @"appletPlasticModeScript";
  v26[0] = &unk_1F24E2710;
  v26[1] = &unk_1F24E2740;
  v27[0] = @"D1560000101000001201";
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  v28[0] = v2;
  v27[1] = @"9156000014020001";
  v23[0] = @"appletConfigurationScript";
  v23[1] = @"appletPlasticModeScript";
  v24[0] = &unk_1F24E2728;
  v24[1] = &unk_1F24E2740;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  v28[1] = v3;
  v27[2] = @"A000000704A0010010010001";
  v21[0] = @"appletConfigurationScript";
  v21[1] = @"appletPlasticModeScript";
  v22[0] = &unk_1F24E2758;
  v22[1] = &unk_1F24E2770;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  v28[2] = v4;
  v27[3] = @"A0000003965453000000010150000000";
  v19[0] = @"appletConfigurationScript";
  v19[1] = @"appletPlasticModeScript";
  v20[0] = &unk_1F24E27A0;
  v20[1] = &unk_1F24E2788;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v28[3] = v5;
  v27[4] = @"F8434E412E43414C2E52657633";
  v17[0] = @"appletConfigurationScript";
  v17[1] = @"appletPlasticModeScript";
  v18[0] = &unk_1F24E27D0;
  v18[1] = &unk_1F24E27B8;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  void v28[4] = v6;
  v27[5] = @"nfcSettings";
  self;
  v28[5] = &unk_1F24E29D0;
  v27[6] = @"wuluSettings";
  self;
  v28[6] = &unk_1F24E2FE8;
  v27[7] = @"expressMode";
  id v7 = +[AppletConfigurationData getStaticExpressModeSettings]();
  v28[7] = v7;
  v27[8] = @"herculesSettings";
  id v8 = +[AppletConfigurationData getStaticHerculesSettings]();
  v28[8] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:9];
  uint64_t v10 = (void *)[v9 mutableCopy];

  v33[0] = @"dreamworksMetroTypes";
  v33[1] = @"dreamworksBusTypeRanges";
  v34[0] = &unk_1F24E28D8;
  v34[1] = &unk_1F24E2938;
  uint64_t v11 = (void *)MEMORY[0x1E4F1C9E8];
  id v12 = v10;
  uint64_t v13 = [v11 dictionaryWithObjects:v34 forKeys:v33 count:2];
  v29[0] = @"appletConfigurationScript";
  v29[1] = @"appletPlasticModeScript";
  v30[0] = &unk_1F24E28A8;
  v30[1] = &unk_1F24E28C0;
  v31[0] = @"A0000008588400010100";
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  v31[1] = @"dreamworksSettings";
  v32[0] = v14;
  v32[1] = v13;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  [v12 addEntriesFromDictionary:v15];

  return v12;
}

+ (id)getStaticExpressModeSettings
{
  v11[1] = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v10 = @"rfModifierTCIs";
  v0 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&getStaticExpressModeSettings_tciNYTR3 length:4];
  v9[0] = v0;
  id v1 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&getStaticExpressModeSettings_tciBrisbaneTR3 length:4];
  v9[1] = v1;
  id v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&getStaticExpressModeSettings_tciAccessIS length:4];
  v9[2] = v2;
  id v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&getStaticExpressModeSettings_tciRevere length:4];
  v9[3] = v3;
  id v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&getStaticExpressModeSettings_tciLyon length:4];
  v9[4] = v4;
  id v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&getStaticExpressModeSettings_tciSF length:4];
  void v9[5] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:6];
  v11[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v7;
}

+ (id)getStaticHerculesSettings
{
  v8[1] = *MEMORY[0x1E4F143B8];
  self;
  id v7 = @"fareTables";
  v0 = [&unk_1F24E2128 stringValue];
  v5[0] = v0;
  v6[0] = @"KHkBAQABAlAoeQIBAAECTCh5BgEAAQWoKXkBAQABAk8qeQEBAAECTip5AgEAAQM8KnkGAQABBaoreQEBAAECTS15AQEAAQXRLnkBAQABBdAyKQEDAAEAYT55AQEAAQI4P3kCAQABAjk/eQYBAAEFqUAAAQMAAEABQAACAwAAQAJAAAMDAAEE9EAABAMAAEAEQAAFAwAAQAVAAAYDAABABkAABwMAAEB/QAAJAwAAQAlAABADAABAhEAAEQMAAECFQAASAwAAQIZAABMDAABAh0AAFAMAAECIQAAVAwAAQIlAABYDAABACkAAFwMAAECLQACAAwAAQIBAAIEDAABAfkABCAMAAEAIQAGDAwAAQINAFQ8DAABAgkAWDgMAAECBQBZ/AwABBgxAMwwDAAEFMEBlCwMAAQTgURUBAQABBsBjFgEDAAEAYnIWAQMAAQBjgXkBAQABA1CaAQgBAACaCKMBCAEAAKMI8AABAwABAPrwAAIDAAEA+/AABgMAAQW/8DMMAwABAhfxAAEDAAEA+PEAAgMAAQD58QAGAwABBbzxAIADAAEFw/EzDAMAAQIY8gABAwABAPzyAAIDAAEA/fIABgMAAQXC8jMMAwABAhnzAAEDAAEB/PMAAgMAAQH98wAGAwABBcHzAIADAAEFx/QAAQMAAQIS9AACAwABAhP0AAYDAAEFwPUAAQMAAQH+9QACAwABAf/1AAYDAAEFvvUAgAMAAQXF9gABAwABAhD2AAIDAAECEfYABgMAAQW99gCAAwABBcT5AAEDAAECFPkAgAMAAQXG+gACAwABAhX7AAYDAAECFvwzDAMAAQIa";
  id v1 = [&unk_1F24E2200 stringValue];
  v5[1] = v1;
  v6[1] = @"AA0BAQABBH4BDQEBAAEEfwENAgEAAQSAAwoBAQABAZsFAwEBAAEElgUGAQEAAQANBQsBAQABBFYFDgEBAAEFlgYLAgEAAQRXBg4CAQABBZcHBgEBAAEEIwcLBAEAAQRYBw0BAQABBIcHDQIBAAEEiAcNBAEAAQSKBw0FAQABBIkHDgUBAAEFmQgBAQEAAAgBCAYBAQABBCQICwUBAAEEWQgOBAEAAQWYEAIBAQABAbMQAgIBAAEBtBEFAQEAAQM+EQsBAQABBGQSBQIBAAEDQBMFBAEAAQNCFAUFAQABA0QUBgEBAAEAURQLAQEAAQRnFQUBAQABAz8WBQUBAAEDRRcFAgEAAQNBGAUEAQABA0MYBgEBAAEAMhgIAQEAAQPAGQUBAQABBKwdAQEBAAAdAR0GAQEAAQQXHgUBAQABBTIfBgEBAAEENyEJAQEAAQLEIgkCAQABAsUjCQUBAAECxiMMAQEAAQRJJAkEAQABAsckDAIBAAEESiUCAQEAAQI2JQYBAQABBO4lDAUBAAEESyYCAQEAAQI3JgYBAQABBP8mDAQBAAEETCcCAQEAAQI4JwwBAQABBE0oAgIBAAECOSkCAgEAAQI6KgICAQABAjsrBwEBAAEDvzEHAQEAAQPMMQcCAQABA9gyBwEBAAEDzTIHAgEAAQPZMwcBAQABA84zBwIBAAED2jQGAQEAAQA7NAcBAQABA880BwIBAAED2zUHAQEAAQPQNQcCAQABA902AAIBAAEC0TcAAgEAAQLSNwYBAQABADo4BgEBAAEAOTkGAQEAAQA2OgABAQABA4I6AAIBAAEDgzoABAEAAQOEOgAFAQABA4U6AgUBAAECbjoGAQEAAQAwOwABAQABA448AAEBAAEDjz0AAQEAAQOQPgABAQABA5E/AAEBAAEDkj8CBAEAAQJ0PwcBAQABA/FCAgUBAAECeEMCBQEAAQJ5RAIFAQABAnpFAgQBAAECfEYCBAEAAQJ+RwIEAQABAoBPBwEBAAEEAVAHAgEAAQQCUgoBAQABApVWAAMDAAEDHFcCAQEAAQUEWAABAQABBPtYAgIBAAEFBVoAAQEAAQOTXQABAQABA5R/CgEBAAEDrX8KAgEAAQOuhgABAQABADyGAAIBAAEAPYYKAQEAAQO1hwABAwABAMmHAAIDAAEAU4cABAMAAQE9hwAFAwABAFSHCgIBAAEDsogKAgEAAQOziQoCAQABA7SKAAEBAAEDlYoKAQEAAQO2iwABAQABA5aLCgEBAAEDt4wAAQEAAQOXjAQBAQABAeWNAAEBAAEDmJkAAgEAAQT9mwAFAQABBQGcAAQBAAEFAJ0AAQEAAQURnwABAQABBUO5AQMBAAEDLroBAwEAAQMvvQEBAQABA1C+AQEBAAEDUcABAQEAAQNTwQECAQABA1XDAQIBAAEDVMUBBAEAAQNnxgEFAQABA2jPAQEBAAEDh9ABAQEAAQOI2QEBAQABA9HdAQEBAAED5eQBAQEAAQQT7wEBAQABBM3yAQEBAAEE0PgBAQEAAQUC";
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v8[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v3;
}

@end