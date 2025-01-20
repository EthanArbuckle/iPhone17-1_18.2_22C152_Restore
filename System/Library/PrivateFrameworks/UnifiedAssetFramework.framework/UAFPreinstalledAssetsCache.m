@interface UAFPreinstalledAssetsCache
+ (BOOL)checkForAssetTypePath:(id)a3;
+ (BOOL)isEnabled;
+ (id)assetSpecifier:(id)a3 assetSetConfiguration:(id)a4;
+ (id)assetSpecifiersFromRoots:(id)a3;
+ (id)queryAssetType:(id)a3;
+ (id)summary:(id)a3;
+ (void)initCache:(id)a3;
+ (void)invalidateCache;
+ (void)populateCache:(id)a3;
@end

@implementation UAFPreinstalledAssetsCache

+ (id)assetSpecifier:(id)a3 assetSetConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 autoAssetType];

  if (v7)
  {
    if (+[UAFPreinstalledAssetsCache isEnabled])
    {
      +[UAFPreinstalledAssetsCache initCache:v6];
      v8 = [v6 autoAssetType];
      uint64_t v16 = 0;
      v17 = &v16;
      uint64_t v18 = 0x3032000000;
      v19 = __Block_byref_object_copy__0;
      v20 = __Block_byref_object_dispose__0;
      id v21 = 0;
      v9 = qword_26AF0B960;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __67__UAFPreinstalledAssetsCache_assetSpecifier_assetSetConfiguration___block_invoke;
      block[3] = &unk_264CEB368;
      id v13 = v8;
      v15 = &v16;
      id v14 = v5;
      id v10 = v8;
      dispatch_sync(v9, block);
      id v7 = (id)v17[5];

      _Block_object_dispose(&v16, 8);
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

+ (BOOL)isEnabled
{
  BOOL v2 = +[UAFCommonUtilities isInternalInstall];
  if (v2)
  {
    LOBYTE(v2) = +[UAFConfiguration assetRootSupported];
  }
  return v2;
}

+ (void)initCache:(id)a3
{
  id v3 = a3;
  if (_MergedGlobals_0 != -1) {
    dispatch_once(&_MergedGlobals_0, &__block_literal_global_2);
  }
  id v4 = (id)qword_26AF0B970;
  objc_sync_enter(v4);
  uint64_t v5 = qword_26AF0B970;
  id v6 = [v3 name];
  LOBYTE(v5) = [(id)v5 containsObject:v6];

  if ((v5 & 1) == 0)
  {
    id v7 = [v3 name];
    v8 = [v3 name];
    uint64_t v9 = qword_26AF0B960;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __40__UAFPreinstalledAssetsCache_initCache___block_invoke_2;
    v13[3] = &unk_264CEAB50;
    id v10 = v7;
    id v14 = v10;
    +[UAFAssetSetObserver listenForUAFNotificationsForAssetSet:v8 forRoot:1 queue:v9 updateHandler:v13];

    v11 = (void *)qword_26AF0B970;
    v12 = [v3 name];
    [v11 addObject:v12];
  }
  objc_sync_exit(v4);
}

void __38__UAFPreinstalledAssetsCache_summary___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v30 = *MEMORY[0x263EF8340];
  +[UAFPreinstalledAssetsCache populateCache:*(void *)(a1 + 32)];
  p_superclass = &OBJC_METACLASS___UAFAssetUtilities.superclass;
  uint64_t v3 = [(id)qword_26AF0B978 objectForKeyedSubscript:*(void *)(v1 + 32)];
  if (v3
    && (id v4 = (void *)v3,
        [(id)qword_26AF0B978 objectForKeyedSubscript:*(void *)(v1 + 32)],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v4,
        v6))
  {
    v24 = objc_opt_new();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = [(id)qword_26AF0B978 objectForKeyedSubscript:*(void *)(v1 + 32)];
    uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v26;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * v10);
          v12 = NSString;
          [(__objc2_class *)p_superclass[303] objectForKeyedSubscript:*(void *)(v1 + 32)];
          uint64_t v13 = v1;
          v15 = id v14 = p_superclass;
          uint64_t v16 = [v15 objectForKeyedSubscript:v11];
          v17 = [v16 assetId];
          uint64_t v18 = [v12 stringWithFormat:@"%@#%@", v11, v17];
          [v24 addObject:v18];

          p_superclass = v14;
          uint64_t v1 = v13;
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v8);
    }

    uint64_t v19 = *(void *)(*(void *)(v1 + 40) + 8);
    v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v24;
  }
  else
  {
    uint64_t v21 = *(void *)(*(void *)(v1 + 40) + 8);
    v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = 0;
  }
}

void __67__UAFPreinstalledAssetsCache_assetSpecifier_assetSetConfiguration___block_invoke(void *a1)
{
  +[UAFPreinstalledAssetsCache populateCache:a1[4]];
  BOOL v2 = [(id)qword_26AF0B978 objectForKeyedSubscript:a1[4]];

  if (v2)
  {
    uint64_t v8 = [(id)qword_26AF0B978 objectForKeyedSubscript:a1[4]];
    uint64_t v3 = [v8 objectForKeyedSubscript:a1[5]];
    uint64_t v4 = *(void *)(a1[6] + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v6 = v8;
  }
  else
  {
    uint64_t v7 = *(void *)(a1[6] + 8);
    uint64_t v6 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
}

+ (void)populateCache:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = (void *)qword_26AF0B978;
  if (!qword_26AF0B978)
  {
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v6 = (void *)qword_26AF0B978;
    qword_26AF0B978 = v5;

    uint64_t v4 = (void *)qword_26AF0B978;
  }
  uint64_t v7 = [v4 objectForKeyedSubscript:v3];

  if (!v7
    && +[UAFPreinstalledAssetsCache checkForAssetTypePath:v3])
  {
    uint64_t v8 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      uint64_t v11 = "+[UAFPreinstalledAssetsCache populateCache:]";
      __int16 v12 = 2114;
      id v13 = v3;
      _os_log_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEFAULT, "%s Querying for %{public}@", (uint8_t *)&v10, 0x16u);
    }

    uint64_t v9 = +[UAFPreinstalledAssetsCache queryAssetType:v3];
    [(id)qword_26AF0B978 setObject:v9 forKeyedSubscript:v3];
  }
}

+ (BOOL)checkForAssetTypePath:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = (void *)qword_26AF0B980;
  if (!qword_26AF0B980)
  {
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v6 = (void *)qword_26AF0B980;
    qword_26AF0B980 = v5;

    uint64_t v4 = (void *)qword_26AF0B980;
  }
  uint64_t v7 = [v4 objectForKeyedSubscript:v3];
  uint64_t v8 = v7;
  if (v7)
  {
    char v9 = [v7 BOOLValue];
  }
  else
  {
    int v10 = [v3 stringByReplacingOccurrencesOfString:@"." withString:@"_"];
    uint64_t v11 = [MEMORY[0x263EFF980] array];
    unint64_t v12 = 0x264CEA000uLL;
    id v13 = +[UAFCommonUtilities getMAPath:1];
    [v11 addObject:v13];

    uint64_t v14 = +[UAFCommonUtilities getMAPath:2];
    [v11 addObject:v14];

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v15 = v11;
    uint64_t v42 = [v15 countByEnumeratingWithState:&v49 objects:v69 count:16];
    if (v42)
    {
      uint64_t v40 = *(void *)v50;
      uint64_t v37 = *MEMORY[0x263EFF750];
      *(void *)&long long v16 = 136315394;
      long long v36 = v16;
      v38 = v15;
      v39 = v10;
      do
      {
        uint64_t v17 = 0;
        uint64_t v18 = v40;
        do
        {
          if (*(void *)v50 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * v17), "stringByAppendingPathComponent:", v10, v36);
          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v62 = 0u;
          memset(v61, 0, sizeof(v61));
          if (![*(id *)(v12 + 2344) stat:v19 withBuf:v61 error:0])
          {
            v20 = [MEMORY[0x263F08850] defaultManager];
            uint64_t v21 = [NSURL URLWithString:v19];
            uint64_t v60 = v37;
            v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v60 count:1];
            v47[0] = MEMORY[0x263EF8330];
            v47[1] = 3221225472;
            v47[2] = __52__UAFPreinstalledAssetsCache_checkForAssetTypePath___block_invoke;
            v47[3] = &unk_264CEB390;
            id v41 = v19;
            id v48 = v41;
            v23 = [v20 enumeratorAtURL:v21 includingPropertiesForKeys:v22 options:1 errorHandler:v47];

            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            id v24 = v23;
            uint64_t v25 = [v24 countByEnumeratingWithState:&v43 objects:v59 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v44;
              while (2)
              {
                for (uint64_t i = 0; i != v26; ++i)
                {
                  if (*(void *)v44 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  v29 = [*(id *)(*((void *)&v43 + 1) + 8 * i) path];
                  int v30 = [v29 hasSuffix:@".asset"];

                  if (v30)
                  {
                    v34 = UAFGetLogCategory((void **)&UAFLogContextClient);
                    int v10 = v39;
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 136315650;
                      v54 = "+[UAFPreinstalledAssetsCache checkForAssetTypePath:]";
                      __int16 v55 = 2114;
                      id v56 = v3;
                      __int16 v57 = 2114;
                      id v58 = v41;
                      _os_log_impl(&dword_23797A000, v34, OS_LOG_TYPE_INFO, "%s Root for asset type %{public}@ found at %{public}@", buf, 0x20u);
                    }

                    [(id)qword_26AF0B980 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v3];
                    id v15 = v38;

                    char v9 = 1;
                    uint64_t v8 = 0;
                    goto LABEL_31;
                  }
                }
                uint64_t v26 = [v24 countByEnumeratingWithState:&v43 objects:v59 count:16];
                if (v26) {
                  continue;
                }
                break;
              }
            }

            v31 = UAFGetLogCategory((void **)&UAFLogContextClient);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v36;
              v54 = "+[UAFPreinstalledAssetsCache checkForAssetTypePath:]";
              __int16 v55 = 2112;
              id v56 = v41;
              _os_log_impl(&dword_23797A000, v31, OS_LOG_TYPE_INFO, "%s %@ exists but does not contain any assets", buf, 0x16u);
            }

            id v15 = v38;
            int v10 = v39;
            unint64_t v12 = 0x264CEA000;
            uint64_t v18 = v40;
          }

          ++v17;
        }
        while (v17 != v42);
        uint64_t v32 = [v15 countByEnumeratingWithState:&v49 objects:v69 count:16];
        uint64_t v8 = 0;
        uint64_t v42 = v32;
      }
      while (v32);
    }

    v33 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v61 = 136315394;
      *(void *)&v61[4] = "+[UAFPreinstalledAssetsCache checkForAssetTypePath:]";
      *(_WORD *)&v61[12] = 2114;
      *(void *)&v61[14] = v3;
      _os_log_impl(&dword_23797A000, v33, OS_LOG_TYPE_INFO, "%s No root asset type path found for %{public}@", v61, 0x16u);
    }

    [(id)qword_26AF0B980 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v3];
    char v9 = 0;
LABEL_31:
  }
  return v9;
}

+ (id)summary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 autoAssetType];

  if (v4)
  {
    if (+[UAFPreinstalledAssetsCache isEnabled])
    {
      +[UAFPreinstalledAssetsCache initCache:v3];
      uint64_t v5 = [v3 autoAssetType];
      uint64_t v12 = 0;
      id v13 = &v12;
      uint64_t v14 = 0x3032000000;
      id v15 = __Block_byref_object_copy__0;
      long long v16 = __Block_byref_object_dispose__0;
      id v17 = 0;
      uint64_t v6 = qword_26AF0B960;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __38__UAFPreinstalledAssetsCache_summary___block_invoke;
      v9[3] = &unk_264CEAC68;
      id v10 = v5;
      uint64_t v11 = &v12;
      id v7 = v5;
      dispatch_sync(v6, v9);
      id v4 = (id)v13[5];

      _Block_object_dispose(&v12, 8);
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

void __40__UAFPreinstalledAssetsCache_initCache___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.UnifiedAssetFramework.assetcache", 0);
  uint64_t v1 = (void *)qword_26AF0B960;
  qword_26AF0B960 = (uint64_t)v0;

  BOOL v2 = (void *)qword_26AF0B968;
  qword_26AF0B968 = MEMORY[0x263EFFA78];

  uint64_t v3 = objc_opt_new();
  id v4 = (void *)qword_26AF0B970;
  qword_26AF0B970 = v3;
}

uint64_t __40__UAFPreinstalledAssetsCache_initCache___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v2 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    uint64_t v6 = "+[UAFPreinstalledAssetsCache initCache:]_block_invoke_2";
    __int16 v7 = 2114;
    uint64_t v8 = v3;
    _os_log_impl(&dword_23797A000, v2, OS_LOG_TYPE_DEFAULT, "%s Invalidating preinstalled asset cache due to root installation for %{public}@", (uint8_t *)&v5, 0x16u);
  }

  return +[UAFPreinstalledAssetsCache invalidateCache];
}

+ (void)invalidateCache
{
  BOOL v2 = (void *)qword_26AF0B978;
  qword_26AF0B978 = 0;

  uint64_t v3 = (void *)qword_26AF0B980;
  qword_26AF0B980 = 0;
}

uint64_t __52__UAFPreinstalledAssetsCache_checkForAssetTypePath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 136315906;
    uint64_t v11 = "+[UAFPreinstalledAssetsCache checkForAssetTypePath:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_23797A000, v7, OS_LOG_TYPE_INFO, "%s Error encountered while enumerating contents of %@.  URL: %@, error: %@", (uint8_t *)&v10, 0x2Au);
  }

  return 0;
}

+ (id)queryAssetType:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:v3];
  id v5 = v4;
  if (!v4)
  {
    uint64_t v8 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v17 = "+[UAFPreinstalledAssetsCache queryAssetType:]";
      __int16 v18 = 2112;
      id v19 = v3;
      _os_log_error_impl(&dword_23797A000, v8, OS_LOG_TYPE_ERROR, "%s Error creating MAAssetQuery for asset type %@", buf, 0x16u);
    }
    goto LABEL_7;
  }
  [v4 returnTypes:3];
  [v5 setDoNotBlockOnNetworkStatus:1];
  [v5 setDoNotBlockBeforeFirstUnlock:1];
  [v5 addKeyValuePair:@"isRoot" with:@"1"];
  uint64_t v6 = [v5 queryMetaDataSync];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v17 = "+[UAFPreinstalledAssetsCache queryAssetType:]";
      __int16 v18 = 2112;
      id v19 = v3;
      __int16 v20 = 2048;
      uint64_t v21 = v7;
      _os_log_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEFAULT, "%s MA query for %@ failed with result: %ld", buf, 0x20u);
    }
LABEL_7:

    id v9 = (id)qword_26AF0B968;
    goto LABEL_14;
  }
  int v10 = [v5 results];
  uint64_t v11 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v17 = "+[UAFPreinstalledAssetsCache queryAssetType:]";
    __int16 v18 = 2114;
    id v19 = v3;
    __int16 v20 = 1024;
    LODWORD(v21) = [v10 count];
    _os_log_debug_impl(&dword_23797A000, v11, OS_LOG_TYPE_DEBUG, "%s Query for %{public}@ returned %d assets", buf, 0x1Cu);
  }

  if ([v10 count])
  {
    __int16 v12 = [MEMORY[0x263EFF9A0] dictionary];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __45__UAFPreinstalledAssetsCache_queryAssetType___block_invoke;
    v14[3] = &unk_264CEB3B8;
    id v9 = v12;
    id v15 = v9;
    [v10 enumerateObjectsUsingBlock:v14];
  }
  else
  {
    id v9 = (id)qword_26AF0B968;
  }

LABEL_14:

  return v9;
}

void __45__UAFPreinstalledAssetsCache_queryAssetType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 assetProperty:@"AssetSpecifier"];
  if (v4)
  {
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
  }
  else
  {
    id v5 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 136315394;
      uint64_t v7 = "+[UAFPreinstalledAssetsCache queryAssetType:]_block_invoke";
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_debug_impl(&dword_23797A000, v5, OS_LOG_TYPE_DEBUG, "%s MAAsset without specifier: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

+ (id)assetSpecifiersFromRoots:(id)a3
{
  id v3 = a3;
  id v4 = [v3 autoAssetType];

  if (v4)
  {
    if (+[UAFPreinstalledAssetsCache isEnabled])
    {
      +[UAFPreinstalledAssetsCache initCache:v3];
      id v5 = [v3 autoAssetType];
      uint64_t v12 = 0;
      uint64_t v13 = &v12;
      uint64_t v14 = 0x3032000000;
      id v15 = __Block_byref_object_copy__0;
      __int16 v16 = __Block_byref_object_dispose__0;
      id v17 = 0;
      int v6 = qword_26AF0B960;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __55__UAFPreinstalledAssetsCache_assetSpecifiersFromRoots___block_invoke;
      v9[3] = &unk_264CEAC68;
      id v10 = v5;
      uint64_t v11 = &v12;
      id v7 = v5;
      dispatch_sync(v6, v9);
      id v4 = (id)v13[5];

      _Block_object_dispose(&v12, 8);
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

void __55__UAFPreinstalledAssetsCache_assetSpecifiersFromRoots___block_invoke(uint64_t a1)
{
  +[UAFPreinstalledAssetsCache populateCache:*(void *)(a1 + 32)];
  uint64_t v2 = [(id)qword_26AF0B978 objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (v2
    && (id v3 = (void *)v2,
        [(id)qword_26AF0B978 objectForKeyedSubscript:*(void *)(a1 + 32)],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        v3,
        v5))
  {
    int v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = [(id)qword_26AF0B978 objectForKeyedSubscript:*(void *)(a1 + 32)];
    id v7 = [v13 allKeys];
    uint64_t v8 = [v6 setWithArray:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = v13;
  }
  else
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;
  }
}

@end