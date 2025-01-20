@interface UAFConfigurationManager
+ (id)defaultManager;
+ (id)getAssetNameFromPath:(id)a3;
+ (id)getConfigurationDirURL:(id)a3;
- (BOOL)isUsageLimitExceeded:(id)a3;
- (BOOL)shouldApplyFeatureFlags;
- (NSArray)baseURLs;
- (NSMutableDictionary)assetSetCache;
- (UAFConfigurationManager)initWithURLs:(id)a3;
- (id)applySubscriptions:(id)a3;
- (id)getAllAssetSets;
- (id)getAssetSet:(id)a3;
- (id)getMinVersion:(id)a3 provider:(id)a4;
- (id)getPrestage:(id)a3;
- (id)getUsageAlias:(id)a3;
- (id)minVersions:(id)a3;
- (void)assetSetCacheMiss:(id)a3;
- (void)invalidateCache;
- (void)setAssetSetCache:(id)a3;
- (void)setBaseURLs:(id)a3;
@end

@implementation UAFConfigurationManager

+ (id)getAssetNameFromPath:(id)a3
{
  v3 = [a3 URLByDeletingPathExtension];
  v4 = [v3 lastPathComponent];

  if (v4) {
    v5 = v4;
  }
  else {
    v5 = &stru_26EA999B8;
  }

  return v5;
}

+ (id)defaultManager
{
  if (_MergedGlobals_9 != -1) {
    dispatch_once(&_MergedGlobals_9, &__block_literal_global_10);
  }
  v2 = (void *)qword_26AF0BA48;

  return v2;
}

- (void)assetSetCacheMiss:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v24 = self;
  context = (void *)MEMORY[0x237E26B30]();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [(UAFConfigurationManager *)self baseURLs];
  uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = 0;
    uint64_t v27 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v27) {
          objc_enumerationMutation(obj);
        }
        v9 = [*(id *)(*((void *)&v30 + 1) + 8 * i) URLByAppendingPathComponent:@"AssetSets"];

        id v10 = v4;
        v11 = [v9 URLByAppendingPathComponent:v4];

        v7 = [v11 URLByAppendingPathExtension:@"plist"];

        unsigned __int8 v29 = 0;
        v12 = [MEMORY[0x263F08850] defaultManager];
        v13 = [v7 absoluteURL];
        v14 = [v13 path];
        int v15 = [v12 fileExistsAtPath:v14 isDirectory:&v29];
        int v16 = v29;

        if (v15) {
          BOOL v17 = v16 == 0;
        }
        else {
          BOOL v17 = 0;
        }
        if (v17)
        {
          id v28 = 0;
          v18 = +[UAFAssetSetConfiguration fromContentsOfURL:v7 applyFeatureFlags:[(UAFConfigurationManager *)v24 shouldApplyFeatureFlags] error:&v28];
          id v19 = v28;
          id v4 = v10;
          if (!v18)
          {
            v20 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315906;
              v35 = "-[UAFConfigurationManager assetSetCacheMiss:]";
              __int16 v36 = 2114;
              id v37 = v10;
              __int16 v38 = 2114;
              v39 = v7;
              __int16 v40 = 2114;
              id v41 = v19;
              _os_log_error_impl(&dword_23797A000, v20, OS_LOG_TYPE_ERROR, "%s Could not load asset set %{public}@ from URL %{public}@: %{public}@", buf, 0x2Au);
            }
          }
          v21 = [(UAFConfigurationManager *)v24 assetSetCache];
          [v21 setValue:v18 forKey:v10];

          goto LABEL_22;
        }
        id v4 = v10;
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    v7 = 0;
  }

  v22 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = [(UAFConfigurationManager *)v24 baseURLs];
    *(_DWORD *)buf = 136315650;
    v35 = "-[UAFConfigurationManager assetSetCacheMiss:]";
    __int16 v36 = 2112;
    id v37 = v4;
    __int16 v38 = 2112;
    v39 = v23;
    _os_log_error_impl(&dword_23797A000, v22, OS_LOG_TYPE_ERROR, "%s '%@' does not exist in %@", buf, 0x20u);
  }
LABEL_22:
}

- (id)getAssetSet:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  v7 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
  v8 = v7;
  unint64_t v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v19 = 138543362;
    id v20 = v4;
    _os_signpost_emit_with_name_impl(&dword_23797A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "AssetSet Configuration", "%{public}@", (uint8_t *)&v19, 0xCu);
  }

  id v10 = [(UAFConfigurationManager *)self assetSetCache];
  objc_sync_enter(v10);
  v11 = [(UAFConfigurationManager *)self assetSetCache];
  v12 = [v11 objectForKey:v4];

  if (v12)
  {
    v13 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    v14 = v13;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      int v19 = 138543362;
      id v20 = v4;
      _os_signpost_emit_with_name_impl(&dword_23797A000, v14, OS_SIGNPOST_INTERVAL_END, v6, "AssetSet Configuration", "%{public}@", (uint8_t *)&v19, 0xCu);
    }
  }
  else
  {
    [(UAFConfigurationManager *)self assetSetCacheMiss:v4];
    int v15 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
    v14 = v15;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      int v19 = 138543362;
      id v20 = v4;
      _os_signpost_emit_with_name_impl(&dword_23797A000, v14, OS_SIGNPOST_INTERVAL_END, v6, "AssetSet Configuration", "%{public}@", (uint8_t *)&v19, 0xCu);
    }
  }

  int v16 = [(UAFConfigurationManager *)self assetSetCache];
  BOOL v17 = [v16 objectForKey:v4];

  objc_sync_exit(v10);

  return v17;
}

- (NSMutableDictionary)assetSetCache
{
  return self->_assetSetCache;
}

- (BOOL)shouldApplyFeatureFlags
{
  v3 = +[UAFConfigurationManager defaultManager];
  LOBYTE(self) = v3 == self;

  return (char)self;
}

- (id)minVersions:(id)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v45 = a3;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = [(UAFConfigurationManager *)self baseURLs];
  uint64_t v46 = [obj countByEnumeratingWithState:&v71 objects:v84 count:16];
  id v4 = 0;
  if (v46)
  {
    uint64_t v44 = *(void *)v72;
    uint64_t v5 = *MEMORY[0x263EFF6F0];
    uint64_t v51 = *MEMORY[0x263EFF6F0];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v72 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v50 = v6;
        v7 = *(void **)(*((void *)&v71 + 1) + 8 * v6);
        v8 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
        os_signpost_id_t v9 = os_signpost_id_generate(v8);

        id v10 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
        v11 = v10;
        os_signpost_id_t spid = v9;
        unint64_t v49 = v9 - 1;
        if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23797A000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "MinVersion Configuration", (const char *)&unk_2379F143D, buf, 2u);
        }

        v56 = [NSString stringWithFormat:@"%@%@", v45, @".minversion."];
        uint64_t v12 = [v7 URLByAppendingPathComponent:@"MinVersions"];
        v13 = [MEMORY[0x263F08850] defaultManager];
        uint64_t v83 = v5;
        v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v83 count:1];
        v48 = (void *)v12;
        int v15 = [v13 enumeratorAtURL:v12 includingPropertiesForKeys:v14 options:0 errorHandler:0];

        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id v54 = v15;
        uint64_t v57 = [v54 countByEnumeratingWithState:&v67 objects:v82 count:16];
        if (v57)
        {
          uint64_t v55 = *(void *)v68;
          do
          {
            for (uint64_t i = 0; i != v57; ++i)
            {
              if (*(void *)v68 != v55) {
                objc_enumerationMutation(v54);
              }
              uint64_t v58 = i;
              BOOL v17 = *(void **)(*((void *)&v67 + 1) + 8 * i);
              v18 = [v17 path];
              int v19 = [v18 lastPathComponent];
              int v20 = [v19 hasPrefix:v56];

              if (v20)
              {
                uint64_t v21 = [v17 path];
                v22 = [v21 pathExtension];
                int v23 = [v22 isEqualToString:@"plist"];

                if (v23)
                {
                  id v65 = 0;
                  id v66 = 0;
                  int v24 = [v17 getResourceValue:&v66 forKey:v5 error:&v65];
                  id v25 = v66;
                  id v26 = v65;
                  if (v24 && !v26)
                  {
                    if ([v25 BOOLValue])
                    {
                      id v52 = v25;
                      id v64 = 0;
                      uint64_t v27 = +[UAFMinVersionConfiguration fromContentsOfURL:v17 error:&v64];
                      id v53 = v64;
                      if (v27)
                      {
                        long long v62 = 0u;
                        long long v63 = 0u;
                        long long v60 = 0u;
                        long long v61 = 0u;
                        v59 = [v27 minVersions];
                        uint64_t v28 = [v59 countByEnumeratingWithState:&v60 objects:v75 count:16];
                        if (v28)
                        {
                          uint64_t v29 = v28;
                          uint64_t v30 = *(void *)v61;
                          do
                          {
                            for (uint64_t j = 0; j != v29; ++j)
                            {
                              if (*(void *)v61 != v30) {
                                objc_enumerationMutation(v59);
                              }
                              uint64_t v32 = *(void *)(*((void *)&v60 + 1) + 8 * j);
                              if (!v4) {
                                id v4 = objc_opt_new();
                              }
                              long long v33 = [v4 objectForKeyedSubscript:v32];

                              if (!v33) {
                                goto LABEL_29;
                              }
                              v34 = [v4 objectForKeyedSubscript:v32];
                              v35 = [v27 minVersions];
                              __int16 v36 = [v35 objectForKeyedSubscript:v32];
                              int64_t v37 = +[UAFPlatform compareVersion:v34 with:v36];

                              if (v37 == 1)
                              {
LABEL_29:
                                __int16 v38 = [v27 minVersions];
                                v39 = [v38 objectForKeyedSubscript:v32];
                                [v4 setObject:v39 forKeyedSubscript:v32];
                              }
                            }
                            uint64_t v29 = [v59 countByEnumeratingWithState:&v60 objects:v75 count:16];
                          }
                          while (v29);
                          uint64_t v5 = v51;
                        }
                      }
                      else
                      {
                        v59 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
                        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 136315650;
                          v77 = "-[UAFConfigurationManager minVersions:]";
                          __int16 v78 = 2112;
                          v79 = v17;
                          __int16 v80 = 2112;
                          id v81 = v53;
                          _os_log_error_impl(&dword_23797A000, v59, OS_LOG_TYPE_ERROR, "%s Failed to load %@:%@", buf, 0x20u);
                        }
                      }

                      uint64_t i = v58;
                      id v25 = v52;
                      id v26 = v53;
                    }
                    else
                    {
                      id v26 = 0;
                    }
                  }
                }
              }
            }
            uint64_t v57 = [v54 countByEnumeratingWithState:&v67 objects:v82 count:16];
          }
          while (v57);
        }

        __int16 v40 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
        id v41 = v40;
        if (v49 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23797A000, v41, OS_SIGNPOST_INTERVAL_END, spid, "MinVersion Configuration", (const char *)&unk_2379F143D, buf, 2u);
        }

        uint64_t v6 = v50 + 1;
      }
      while (v50 + 1 != v46);
      uint64_t v46 = [obj countByEnumeratingWithState:&v71 objects:v84 count:16];
    }
    while (v46);
  }

  return v4;
}

- (NSArray)baseURLs
{
  return self->_baseURLs;
}

- (id)applySubscriptions:(id)a3
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  v7 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
  v8 = v7;
  unint64_t v54 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23797A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Apply Configuration", (const char *)&unk_2379F143D, buf, 2u);
  }
  os_signpost_id_t spid = v6;

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id obj = v4;
  uint64_t v57 = [obj countByEnumeratingWithState:&v80 objects:v93 count:16];
  os_signpost_id_t v9 = 0;
  if (v57)
  {
    uint64_t v56 = *(void *)v81;
    long long v61 = self;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v81 != v56)
        {
          uint64_t v11 = v10;
          objc_enumerationMutation(obj);
          uint64_t v10 = v11;
        }
        uint64_t v58 = v10;
        uint64_t v12 = *(void **)(*((void *)&v80 + 1) + 8 * v10);
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v66 = v12;
        v13 = objc_msgSend(v12, "assetSets", spid);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v76 objects:v92 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v77;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v77 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v76 + 1) + 8 * i);
              if (!v9) {
                os_signpost_id_t v9 = objc_opt_new();
              }
              int v19 = [v9 objectForKeyedSubscript:v18];

              if (!v19)
              {
                int v20 = objc_opt_new();
                [v9 setObject:v20 forKeyedSubscript:v18];
              }
              uint64_t v21 = [v66 assetSets];
              uint64_t v22 = [v21 objectForKeyedSubscript:v18];

              if (v22) {
                int v23 = (void *)v22;
              }
              else {
                int v23 = (void *)MEMORY[0x263EFFA78];
              }
              int v24 = [v9 objectForKeyedSubscript:v18];
              char v25 = [v24 containsObject:v23];

              if ((v25 & 1) == 0)
              {
                id v26 = [v9 objectForKeyedSubscript:v18];
                [v26 addObject:v23];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v76 objects:v92 count:16];
          }
          while (v15);
        }

        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        uint64_t v27 = [v66 usageAliases];
        uint64_t v62 = [v27 countByEnumeratingWithState:&v72 objects:v91 count:16];
        if (v62)
        {
          uint64_t v28 = *(void *)v73;
          uint64_t v29 = v61;
          uint64_t v59 = *(void *)v73;
          long long v60 = v27;
          do
          {
            uint64_t v30 = 0;
            do
            {
              if (*(void *)v73 != v28) {
                objc_enumerationMutation(v27);
              }
              uint64_t v31 = *(void *)(*((void *)&v72 + 1) + 8 * v30);
              uint64_t v32 = [v66 usageAliases];
              long long v33 = [v32 objectForKeyedSubscript:v31];

              v34 = [(UAFConfigurationManager *)v29 getUsageAlias:v31];
              id v65 = v34;
              if (v34)
              {
                uint64_t v64 = v30;
                v35 = [v34 values];
                long long v63 = v33;
                __int16 v36 = [v35 objectForKeyedSubscript:v33];

                log = v36;
                if ([v36 count])
                {
                  long long v70 = 0u;
                  long long v71 = 0u;
                  long long v68 = 0u;
                  long long v69 = 0u;
                  int64_t v37 = v36;
                  uint64_t v38 = [v37 countByEnumeratingWithState:&v68 objects:v84 count:16];
                  if (v38)
                  {
                    uint64_t v39 = v38;
                    uint64_t v40 = *(void *)v69;
                    do
                    {
                      for (uint64_t j = 0; j != v39; ++j)
                      {
                        if (*(void *)v69 != v40) {
                          objc_enumerationMutation(v37);
                        }
                        uint64_t v42 = *(void *)(*((void *)&v68 + 1) + 8 * j);
                        if (!v9) {
                          os_signpost_id_t v9 = objc_opt_new();
                        }
                        uint64_t v43 = [v9 objectForKeyedSubscript:v42];

                        if (!v43)
                        {
                          uint64_t v44 = objc_opt_new();
                          [v9 setObject:v44 forKeyedSubscript:v42];
                        }
                        id v45 = [v37 objectForKeyedSubscript:v42];
                        uint64_t v46 = [v9 objectForKeyedSubscript:v42];
                        char v47 = [v46 containsObject:v45];

                        if ((v47 & 1) == 0)
                        {
                          v48 = [v9 objectForKeyedSubscript:v42];
                          [v48 addObject:v45];
                        }
                      }
                      uint64_t v39 = [v37 countByEnumeratingWithState:&v68 objects:v84 count:16];
                    }
                    while (v39);
                    uint64_t v27 = v60;
                    uint64_t v29 = v61;
                    uint64_t v28 = v59;
                  }
LABEL_49:
                  long long v33 = v63;
                }
                else
                {
                  int64_t v37 = UAFGetLogCategory((void **)&UAFLogContextClient);
                  if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_49;
                  }
                  *(_DWORD *)buf = 136315650;
                  v86 = "-[UAFConfigurationManager applySubscriptions:]";
                  __int16 v87 = 2114;
                  uint64_t v88 = v31;
                  __int16 v89 = 2114;
                  v90 = v33;
                  _os_log_error_impl(&dword_23797A000, v37, OS_LOG_TYPE_ERROR, "%s Could not process subscription for usage alias %{public}@ with value %{public}@", buf, 0x20u);
                }

                uint64_t v30 = v64;
                goto LABEL_51;
              }
              log = UAFGetLogCategory((void **)&UAFLogContextClient);
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v86 = "-[UAFConfigurationManager applySubscriptions:]";
                __int16 v87 = 2114;
                uint64_t v88 = v31;
                _os_log_error_impl(&dword_23797A000, log, OS_LOG_TYPE_ERROR, "%s Could not process subscription for usage alias %{public}@", buf, 0x16u);
              }
LABEL_51:

              ++v30;
            }
            while (v30 != v62);
            uint64_t v49 = [v27 countByEnumeratingWithState:&v72 objects:v91 count:16];
            uint64_t v62 = v49;
          }
          while (v49);
        }

        uint64_t v10 = v58 + 1;
      }
      while (v58 + 1 != v57);
      uint64_t v57 = [obj countByEnumeratingWithState:&v80 objects:v93 count:16];
    }
    while (v57);
  }

  uint64_t v50 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
  uint64_t v51 = v50;
  if (v54 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23797A000, v51, OS_SIGNPOST_INTERVAL_END, spid, "Apply Configuration", (const char *)&unk_2379F143D, buf, 2u);
  }

  return v9;
}

void __41__UAFConfigurationManager_defaultManager__block_invoke()
{
  v0 = [[UAFConfigurationManager alloc] initWithURLs:0];
  v1 = (void *)qword_26AF0BA48;
  qword_26AF0BA48 = (uint64_t)v0;
}

- (UAFConfigurationManager)initWithURLs:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UAFConfigurationManager;
  os_signpost_id_t v6 = [(UAFConfigurationManager *)&v16 init];
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assetSetCache = v6->_assetSetCache;
    v6->_assetSetCache = v7;

    if (v5)
    {
      objc_storeStrong((id *)&v6->_baseURLs, a3);
      os_signpost_id_t v9 = v6;
    }
    else
    {
      uint64_t v10 = (NSArray *)objc_opt_new();
      if (+[UAFCommonUtilities isInternalInstall])
      {
        uint64_t v11 = +[UAFConfigurationManager getConfigurationDirURL:@"/AppleInternal/Library/UnifiedAssetFramework"];
        if (v11) {
          [(NSArray *)v10 addObject:v11];
        }
      }
      uint64_t v12 = +[UAFConfigurationManager getConfigurationDirURL:@"/System/Library/UnifiedAssetFramework"];
      if (v12) {
        [(NSArray *)v10 addObject:v12];
      }
      baseURLs = v6->_baseURLs;
      v6->_baseURLs = v10;

      uint64_t v14 = v6;
    }
  }

  return v6;
}

+ (id)getConfigurationDirURL:(id)a3
{
  id v3 = a3;
  id v4 = +[UAFCommonUtilities rootDirectory];
  id v5 = [v4 stringByAppendingString:v3];

  os_signpost_id_t v6 = [NSURL fileURLWithPath:v5 isDirectory:1 relativeToURL:0];

  return v6;
}

- (void)invalidateCache
{
  id obj = [(UAFConfigurationManager *)self assetSetCache];
  objc_sync_enter(obj);
  id v3 = objc_opt_new();
  [(UAFConfigurationManager *)self setAssetSetCache:v3];

  objc_sync_exit(obj);
}

- (id)getAllAssetSets
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v3 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  id v5 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
  os_signpost_id_t v6 = v5;
  os_signpost_id_t spid = v4;
  unint64_t v35 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23797A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "AssetSet Configuration", (const char *)&unk_2379F143D, buf, 2u);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [(UAFConfigurationManager *)self baseURLs];
  uint64_t v39 = [obj countByEnumeratingWithState:&v48 objects:v60 count:16];
  v7 = 0;
  if (v39)
  {
    uint64_t v38 = *(void *)v49;
    uint64_t v37 = *MEMORY[0x263EFF6F0];
    v8 = (void **)&UAFLogContextConfiguration;
    os_signpost_id_t v9 = @"plist";
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v49 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(NSObject **)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v12 = [v11 URLByAppendingPathComponent:@"AssetSets"];
        if (v12)
        {
          uint64_t v41 = i;
          v13 = [MEMORY[0x263F08850] defaultManager];
          uint64_t v53 = v37;
          uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v53 count:1];
          uint64_t v40 = v12;
          uint64_t v15 = [v13 enumeratorAtURL:v12 includingPropertiesForKeys:v14 options:0 errorHandler:0];

          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          objc_super v16 = v15;
          uint64_t v43 = [v16 countByEnumeratingWithState:&v44 objects:v52 count:16];
          if (v43)
          {
            uint64_t v17 = *(void *)v45;
            uint64_t v42 = *(void *)v45;
            do
            {
              for (uint64_t j = 0; j != v43; ++j)
              {
                if (*(void *)v45 != v17) {
                  objc_enumerationMutation(v16);
                }
                int v19 = *(__CFString **)(*((void *)&v44 + 1) + 8 * j);
                int v20 = [(__CFString *)v19 pathExtension];
                char v21 = [v20 isEqualToString:v9];

                if (v21)
                {
                  uint64_t v22 = [(id)objc_opt_class() getAssetNameFromPath:v19];
                  int v23 = [(UAFConfigurationManager *)self getAssetSet:v22];
                  if (v23)
                  {
                    if (!v7) {
                      v7 = objc_opt_new();
                    }
                    if (([v7 containsObject:v23] & 1) == 0) {
                      [v7 addObject:v23];
                    }
                  }
                  else
                  {
                    int v24 = v16;
                    char v25 = self;
                    id v26 = v9;
                    uint64_t v27 = v7;
                    uint64_t v28 = v8;
                    uint64_t v29 = UAFGetLogCategory(v8);
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315650;
                      uint64_t v55 = "-[UAFConfigurationManager getAllAssetSets]";
                      __int16 v56 = 2112;
                      uint64_t v57 = v22;
                      __int16 v58 = 2112;
                      uint64_t v59 = v19;
                      _os_log_error_impl(&dword_23797A000, v29, OS_LOG_TYPE_ERROR, "%s Asset with name %@ could not be loaded from %@.", buf, 0x20u);
                    }

                    v8 = v28;
                    v7 = v27;
                    os_signpost_id_t v9 = v26;
                    self = v25;
                    objc_super v16 = v24;
                    uint64_t v17 = v42;
                  }
                }
                else
                {
                  uint64_t v22 = UAFGetLogCategory(v8);
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    uint64_t v55 = "-[UAFConfigurationManager getAllAssetSets]";
                    __int16 v56 = 2112;
                    uint64_t v57 = v19;
                    _os_log_impl(&dword_23797A000, v22, OS_LOG_TYPE_DEFAULT, "%s Not trying to load %@ as an asset set configuration file as it lacks the \"plist\" extension", buf, 0x16u);
                  }
                }
              }
              uint64_t v43 = [v16 countByEnumeratingWithState:&v44 objects:v52 count:16];
            }
            while (v43);
          }

          uint64_t v12 = v40;
          uint64_t i = v41;
        }
        else
        {
          objc_super v16 = UAFGetLogCategory(v8);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v55 = "-[UAFConfigurationManager getAllAssetSets]";
            __int16 v56 = 2112;
            uint64_t v57 = v11;
            __int16 v58 = 2112;
            uint64_t v59 = @"AssetSets";
            _os_log_error_impl(&dword_23797A000, v16, OS_LOG_TYPE_ERROR, "%s Could not create URL from %@ by appending %@", buf, 0x20u);
          }
        }
      }
      uint64_t v39 = [obj countByEnumeratingWithState:&v48 objects:v60 count:16];
    }
    while (v39);
  }

  uint64_t v30 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
  uint64_t v31 = v30;
  if (v35 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23797A000, v31, OS_SIGNPOST_INTERVAL_END, spid, "AssetSet Configuration", (const char *)&unk_2379F143D, buf, 2u);
  }

  uint64_t v32 = [v7 allObjects];

  return v32;
}

- (id)getUsageAlias:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v31 = a3;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = [(UAFConfigurationManager *)self baseURLs];
  uint64_t v30 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v30)
  {
    uint64_t v27 = self;
    os_signpost_id_t v4 = 0;
    uint64_t v29 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(obj);
        }
        os_signpost_id_t v6 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v7 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
        os_signpost_id_t v8 = os_signpost_id_generate(v7);

        os_signpost_id_t v9 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
        uint64_t v10 = v9;
        unint64_t v11 = v8 - 1;
        if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23797A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "UsageAlias Configuration", (const char *)&unk_2379F143D, buf, 2u);
        }

        uint64_t v12 = [v6 URLByAppendingPathComponent:@"UsageAliases"];

        v13 = [v12 URLByAppendingPathComponent:v31];

        os_signpost_id_t v4 = [v13 URLByAppendingPathExtension:@"plist"];

        unsigned __int8 v32 = 0;
        uint64_t v14 = [MEMORY[0x263F08850] defaultManager];
        uint64_t v15 = [v4 absoluteURL];
        objc_super v16 = [v15 path];
        int v17 = [v14 fileExistsAtPath:v16 isDirectory:&v32];
        int v18 = v32;

        if (v17) {
          BOOL v19 = v18 == 0;
        }
        else {
          BOOL v19 = 0;
        }
        if (v19)
        {
          int v23 = +[UAFUsageAliasConfiguration fromContentsOfURL:v4 assetSetManager:v27 error:0];
          int v24 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
          char v25 = v24;
          if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23797A000, v25, OS_SIGNPOST_INTERVAL_END, v8, "UsageAlias Configuration", (const char *)&unk_2379F143D, buf, 2u);
          }

          goto LABEL_27;
        }
        int v20 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v38 = "-[UAFConfigurationManager getUsageAlias:]";
          __int16 v39 = 2112;
          uint64_t v40 = v4;
          _os_log_debug_impl(&dword_23797A000, v20, OS_LOG_TYPE_DEBUG, "%s %@ does not exist or is not a regular file", buf, 0x16u);
        }

        char v21 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
        uint64_t v22 = v21;
        if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23797A000, v22, OS_SIGNPOST_INTERVAL_END, v8, "UsageAlias Configuration", (const char *)&unk_2379F143D, buf, 2u);
        }
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v30) {
        continue;
      }
      break;
    }
  }
  else
  {
    os_signpost_id_t v4 = 0;
  }
  int v23 = 0;
LABEL_27:

  return v23;
}

- (id)getPrestage:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v35 = a3;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = [(UAFConfigurationManager *)self baseURLs];
  uint64_t v4 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    os_signpost_id_t v6 = 0;
    uint64_t v34 = *(void *)v38;
    uint64_t v33 = *MEMORY[0x263F080D8];
    id v31 = (void *)*MEMORY[0x263F080E8];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v38 != v34) {
          objc_enumerationMutation(obj);
        }
        os_signpost_id_t v8 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        os_signpost_id_t v9 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
        os_signpost_id_t v10 = os_signpost_id_generate(v9);

        unint64_t v11 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
        uint64_t v12 = v11;
        unint64_t v13 = v10 - 1;
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23797A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "Prestage Configuration", (const char *)&unk_2379F143D, buf, 2u);
        }

        uint64_t v14 = [v8 URLByAppendingPathComponent:@"Prestage"];

        uint64_t v15 = [v14 URLByAppendingPathComponent:v35];

        os_signpost_id_t v6 = [v15 URLByAppendingPathExtension:@"plist"];

        objc_super v16 = [MEMORY[0x263F08850] defaultManager];
        int v17 = [v6 path];
        id v36 = 0;
        int v18 = [v16 attributesOfItemAtPath:v17 error:&v36];
        id v19 = v36;

        if (v18) {
          BOOL v20 = v19 == 0;
        }
        else {
          BOOL v20 = 0;
        }
        if (v20)
        {
          uint64_t v21 = [v18 objectForKeyedSubscript:v33];
          if (v21)
          {
            uint64_t v22 = (void *)v21;
            int v23 = [v18 objectForKeyedSubscript:v33];

            if (v23 == v31)
            {
              uint64_t v27 = +[UAFPrestageConfiguration fromContentsOfURL:v6 error:0];
              uint64_t v28 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
              uint64_t v29 = v28;
              if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_23797A000, v29, OS_SIGNPOST_INTERVAL_END, v10, "Prestage Configuration", (const char *)&unk_2379F143D, buf, 2u);
              }

              goto LABEL_30;
            }
          }
        }
        int v24 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v42 = "-[UAFConfigurationManager getPrestage:]";
          __int16 v43 = 2112;
          long long v44 = v6;
          _os_log_debug_impl(&dword_23797A000, v24, OS_LOG_TYPE_DEBUG, "%s %@ does not exist or is not a regular file", buf, 0x16u);
        }

        char v25 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
        id v26 = v25;
        if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23797A000, v26, OS_SIGNPOST_INTERVAL_END, v10, "Prestage Configuration", (const char *)&unk_2379F143D, buf, 2u);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    os_signpost_id_t v6 = 0;
  }
  uint64_t v27 = 0;
LABEL_30:

  return v27;
}

- (id)getMinVersion:(id)a3 provider:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v25 = a3;
  id v24 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [(UAFConfigurationManager *)self baseURLs];
  uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    os_signpost_id_t v8 = 0;
    uint64_t v23 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(obj);
        }
        os_signpost_id_t v10 = [*(id *)(*((void *)&v27 + 1) + 8 * i) URLByAppendingPathComponent:@"MinVersions"];

        unint64_t v11 = [NSString stringWithFormat:@"%@%@%@", v25, @".minversion.", v24];
        uint64_t v12 = [v10 URLByAppendingPathComponent:v11];

        os_signpost_id_t v8 = [v12 URLByAppendingPathExtension:@"plist"];

        unsigned __int8 v26 = 0;
        unint64_t v13 = [MEMORY[0x263F08850] defaultManager];
        uint64_t v14 = [v8 absoluteURL];
        uint64_t v15 = [v14 path];
        int v16 = [v13 fileExistsAtPath:v15 isDirectory:&v26];
        int v17 = v26;

        if (v16) {
          BOOL v18 = v17 == 0;
        }
        else {
          BOOL v18 = 0;
        }
        if (v18)
        {
          BOOL v20 = +[UAFMinVersionConfiguration fromContentsOfURL:v8 error:0];
          goto LABEL_18;
        }
        id v19 = UAFGetLogCategory((void **)&UAFLogContextConfiguration);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          unsigned __int8 v32 = "-[UAFConfigurationManager getMinVersion:provider:]";
          __int16 v33 = 2112;
          uint64_t v34 = v8;
          _os_log_impl(&dword_23797A000, v19, OS_LOG_TYPE_DEFAULT, "%s %@ does not exist or is not a regular file", buf, 0x16u);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    os_signpost_id_t v8 = 0;
  }
  BOOL v20 = 0;
LABEL_18:

  return v20;
}

- (BOOL)isUsageLimitExceeded:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        os_signpost_id_t v10 = -[UAFConfigurationManager getAssetSet:](self, "getAssetSet:", v9, (void)v15);
        if (v10)
        {
          unint64_t v11 = [v4 objectForKeyedSubscript:v9];
          int v12 = [v10 isUsageLimitExceeded:v11];

          if (v12)
          {

            BOOL v13 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_12:

  return v13;
}

- (void)setBaseURLs:(id)a3
{
}

- (void)setAssetSetCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSetCache, 0);

  objc_storeStrong((id *)&self->_baseURLs, 0);
}

@end