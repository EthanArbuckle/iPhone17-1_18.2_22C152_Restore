@interface VSCacheDeleteService
+ (id)sharedService;
- (BOOL)registerCacheDelete;
- (id)periodic:(id)a3 urgency:(int)a4;
- (id)purge:(id)a3 urgency:(int)a4;
- (id)purgeImpl:(id)a3 urgency:(int)a4;
- (id)purgeable:(id)a3 urgency:(int)a4;
- (id)purgeableAssetsWithInfo:(id)a3 urgency:(int)a4;
- (int64_t)totalSizeOfAssets:(id)a3;
@end

@implementation VSCacheDeleteService

uint64_t __43__VSCacheDeleteService_registerCacheDelete__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_claimAutoreleasedReturnValue();
}

- (id)purgeable:(id)a3 urgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = VSGetLogDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v25 = v4;
    __int16 v26 = 1024;
    int v27 = 4;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_226CB1000, v7, OS_LOG_TYPE_DEFAULT, "#CacheDelete query purgeable size, urgency: %d / %d, info: %@", buf, 0x18u);
  }

  v8 = [(VSCacheDeleteService *)self purgeableAssetsWithInfo:v6 urgency:v4];
  int64_t v9 = [(VSCacheDeleteService *)self totalSizeOfAssets:v8];
  if ((int)v4 >= 2)
  {
    v10 = +[VSSpeechCache defaultCacheStore];
    v11 = [v10 dirPath];
    v12 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
    int v13 = [v11 hasPrefix:v12];

    if (v13)
    {
      v14 = +[VSSpeechCache defaultCacheStore];
      v9 += [v14 totalCacheSize];
    }
    v15 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
    int v16 = [@"/private/var/mobile/" hasPrefix:v15];

    if (v16)
    {
      v17 = +[VSDiagnosticService defaultService];
      v9 += [v17 totalDiagnosticFileSize];
    }
  }
  v18 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  v22[1] = @"CACHE_DELETE_AMOUNT";
  v23[0] = v18;
  v19 = [NSNumber numberWithLongLong:v9];
  v23[1] = v19;
  v20 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

  return v20;
}

- (id)purgeableAssetsWithInfo:(id)a3 urgency:(int)a4
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4 <= 3)
  {
    v7 = [MEMORY[0x263F84E90] standardInstance];
    int v8 = [v7 disableAssetCleaning];

    if (v8)
    {
      int64_t v9 = VSGetLogEvent();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v93) = a4;
        _os_log_impl(&dword_226CB1000, v9, OS_LOG_TYPE_DEFAULT, "#CacheDelete asset cleaning is disabled in internal setting. Skip purgeable assets for urgency %d", buf, 8u);
      }
      v10 = (void *)MEMORY[0x263EFFA68];
      goto LABEL_39;
    }
  }
  v64 = [MEMORY[0x263EFF980] array];
  v11 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

  if (v11)
  {
    v12 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
    uint64_t v13 = [v12 longLongValue];
  }
  else
  {
    uint64_t v13 = -1;
  }
  v87[0] = MEMORY[0x263EF8330];
  v87[1] = 3221225472;
  v87[2] = __56__VSCacheDeleteService_purgeableAssetsWithInfo_urgency___block_invoke;
  v87[3] = &unk_2647DCAA0;
  id v63 = v6;
  v88 = v6;
  uint64_t v14 = MEMORY[0x22A667CC0](v87);
  v15 = [MEMORY[0x263F84E40] sharedManager];
  int v16 = [v15 activeVoiceAssets];
  v17 = (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v16);

  v18 = [MEMORY[0x263F84E40] sharedManager];
  v19 = [v18 inactiveVoiceAssets];
  v62 = (void *)v14;
  v65 = (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v19);

  v20 = [MEMORY[0x263EFF9C0] set];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  obuint64_t j = v17;
  uint64_t v21 = [obj countByEnumeratingWithState:&v83 objects:v95 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v84;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v84 != v23) {
          objc_enumerationMutation(obj);
        }
        int v25 = [*(id *)(*((void *)&v83 + 1) + 8 * i) voiceData];
        __int16 v26 = [v25 languages];
        [v20 addObjectsFromArray:v26];
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v83 objects:v95 count:16];
    }
    while (v22);
  }

  v66 = [MEMORY[0x263EFF9C0] set];
  int64_t v27 = [(VSCacheDeleteService *)self totalSizeOfAssets:v65];
  v10 = v64;
  v68 = v20;
  if ((a4 - 1) < 3) {
    goto LABEL_17;
  }
  if (a4 == 4)
  {
    if (v13 == -1 || v13 > v27)
    {
      [v64 addObjectsFromArray:obj];
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v52 = obj;
      uint64_t v53 = [v52 countByEnumeratingWithState:&v79 objects:v94 count:16];
      if (v53)
      {
        uint64_t v54 = v53;
        uint64_t v55 = *(void *)v80;
        do
        {
          for (uint64_t j = 0; j != v54; ++j)
          {
            if (*(void *)v80 != v55) {
              objc_enumerationMutation(v52);
            }
            v57 = *(void **)(*((void *)&v79 + 1) + 8 * j);
            v58 = VSGetLogDefault();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              v59 = [v57 descriptiveKey];
              *(_DWORD *)buf = 138412290;
              v93 = v59;
              _os_log_impl(&dword_226CB1000, v58, OS_LOG_TYPE_INFO, "#CacheDelete purgeable active voice asset: %@", buf, 0xCu);
            }
            v60 = [v57 voiceData];
            v61 = [v60 languages];
            [v66 addObjectsFromArray:v61];
          }
          uint64_t v54 = [v52 countByEnumeratingWithState:&v79 objects:v94 count:16];
        }
        while (v54);
      }

      v10 = v64;
    }
LABEL_17:
    [v10 addObjectsFromArray:v65];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v67 = v65;
    uint64_t v28 = [v67 countByEnumeratingWithState:&v75 objects:v91 count:16];
    if (!v28) {
      goto LABEL_30;
    }
    uint64_t v29 = v28;
    uint64_t v70 = *(void *)v76;
    while (1)
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v76 != v70) {
          objc_enumerationMutation(v67);
        }
        v31 = *(void **)(*((void *)&v75 + 1) + 8 * k);
        v32 = VSGetLogDefault();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v33 = [v31 descriptiveKey];
          *(_DWORD *)buf = 138412290;
          v93 = v33;
          _os_log_impl(&dword_226CB1000, v32, OS_LOG_TYPE_INFO, "#CacheDelete purgeable inactive voice asset: %@", buf, 0xCu);
        }
        v34 = [v31 voiceData];
        v35 = [v34 languages];
        uint64_t v36 = [v35 firstObject];
        if (v36)
        {
          v37 = (void *)v36;
          v38 = [v31 voiceData];
          v39 = [v38 languages];
          v40 = [v39 firstObject];
          char v41 = [v68 containsObject:v40];

          if (v41) {
            continue;
          }
          v34 = [v31 voiceData];
          v35 = [v34 languages];
          v42 = [v35 firstObject];
          [v66 addObject:v42];
        }
      }
      uint64_t v29 = [v67 countByEnumeratingWithState:&v75 objects:v91 count:16];
      if (!v29)
      {
LABEL_30:

        v10 = v64;
        break;
      }
    }
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v43 = v66;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v71 objects:v90 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v72;
    do
    {
      for (uint64_t m = 0; m != v45; ++m)
      {
        if (*(void *)v72 != v46) {
          objc_enumerationMutation(v43);
        }
        uint64_t v48 = *(void *)(*((void *)&v71 + 1) + 8 * m);
        id v49 = objc_alloc_init(MEMORY[0x263F84ED0]);
        uint64_t v89 = v48;
        v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v89 count:1];
        [v49 setLanguages:v50];

        [v10 addObject:v49];
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v71 objects:v90 count:16];
    }
    while (v45);
  }

  int64_t v9 = v88;
  id v6 = v63;
LABEL_39:

  return v10;
}

id __56__VSCacheDeleteService_purgeableAssetsWithInfo_urgency___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v14 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        int64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v10 = [v9 voicePath];
        v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
        int v12 = [v10 hasPrefix:v11];

        if (v12) {
          [v14 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v14;
}

- (int64_t)totalSizeOfAssets:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        int64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v6 += [v9 size];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (BOOL)registerCacheDelete
{
  return CacheDeleteRegisterInfoCallbacks() == 0;
}

uint64_t __43__VSCacheDeleteService_registerCacheDelete__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t __43__VSCacheDeleteService_registerCacheDelete__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_claimAutoreleasedReturnValue();
}

- (id)purgeImpl:(id)a3 urgency:(int)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v32 = a3;
  int64_t v6 = -[VSCacheDeleteService purgeableAssetsWithInfo:urgency:](self, "purgeableAssetsWithInfo:urgency:");
  int64_t v31 = [(VSCacheDeleteService *)self totalSizeOfAssets:v6];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v13 = [MEMORY[0x263F84E40] sharedManager];
          id v14 = (id)[v13 purgeAsset:v12];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          long long v13 = [MEMORY[0x263F84E40] sharedManager];
          [v13 removeVoiceResource:v12 completion:0];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v9);
  }

  if (a4 < 2)
  {
    int64_t v20 = v31;
    long long v17 = v32;
  }
  else
  {
    long long v15 = +[VSSpeechCache defaultCacheStore];
    uint64_t v16 = [v15 dirPath];
    long long v17 = v32;
    long long v18 = [v32 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
    int v19 = [v16 hasPrefix:v18];

    int64_t v20 = v31;
    if (v19)
    {
      uint64_t v21 = +[VSSpeechCache defaultCacheStore];
      int64_t v20 = [v21 totalCacheSize] + v31;

      uint64_t v22 = +[VSSpeechCache defaultCacheStore];
      [v22 deleteCache];
    }
    uint64_t v23 = objc_msgSend(v32, "objectForKeyedSubscript:", @"CACHE_DELETE_VOLUME", v31);
    int v24 = [@"/private/var/mobile/" hasPrefix:v23];

    if (v24)
    {
      int v25 = +[VSDiagnosticService defaultService];
      v20 += [v25 totalDiagnosticFileSize];

      __int16 v26 = +[VSDiagnosticService defaultService];
      [v26 removeDirectory];
    }
  }
  v37[0] = @"CACHE_DELETE_VOLUME";
  int64_t v27 = [v17 objectForKeyedSubscript:v31];
  v37[1] = @"CACHE_DELETE_AMOUNT";
  v38[0] = v27;
  uint64_t v28 = [NSNumber numberWithLongLong:v20];
  v38[1] = v28;
  uint64_t v29 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];

  return v29;
}

- (id)periodic:(id)a3 urgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = VSGetLogDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109634;
    v10[1] = v4;
    __int16 v11 = 1024;
    int v12 = 4;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_226CB1000, v7, OS_LOG_TYPE_DEFAULT, "#CacheDelete periodic purge, urgency: %d / %d, info: %@", (uint8_t *)v10, 0x18u);
  }

  uint64_t v8 = [(VSCacheDeleteService *)self purgeImpl:v6 urgency:v4];

  return v8;
}

- (id)purge:(id)a3 urgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = VSGetLogDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109634;
    v10[1] = v4;
    __int16 v11 = 1024;
    int v12 = 4;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_226CB1000, v7, OS_LOG_TYPE_DEFAULT, "#CacheDelete purge, urgency: %d / %d, info: %@", (uint8_t *)v10, 0x18u);
  }

  uint64_t v8 = [(VSCacheDeleteService *)self purgeImpl:v6 urgency:v4];

  return v8;
}

+ (id)sharedService
{
  if (sharedService_onceToken != -1) {
    dispatch_once(&sharedService_onceToken, &__block_literal_global_1872);
  }
  v2 = (void *)sharedService___sharedService;
  return v2;
}

uint64_t __37__VSCacheDeleteService_sharedService__block_invoke()
{
  sharedService___sharedService = objc_alloc_init(VSCacheDeleteService);
  return MEMORY[0x270F9A758]();
}

@end