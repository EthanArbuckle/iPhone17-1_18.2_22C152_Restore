@interface SRDefaultsManager
+ (id)defaultProperties;
+ (id)defaultValueWithKey:(id)a3;
+ (id)identifier;
+ (id)sharedDefaultsManager;
+ (id)userDefaults;
+ (int64_t)version;
+ (unint64_t)lastLoadedContentVersion;
+ (void)removeDefaults;
+ (void)removeKey:(id)a3;
+ (void)setDefaultWithKey:(id)a3 value:(id)a4;
+ (void)setVersionWithValue:(int64_t)a3;
- (BOOL)didFetchForLanguage:(id)a3;
- (BOOL)forceLoad;
- (NSBundle)customBundle;
- (OS_dispatch_queue)ddsQueue;
- (OS_dispatch_queue)defaultsQueue;
- (OS_dispatch_queue)delegatesQueue;
- (SRDefaultsManager)init;
- (id)allLoadedAssets;
- (id)assetBundleForLocale:(id)a3 client:(id)a4;
- (id)assetConfig;
- (id)assetConfigDump;
- (id)currentAssetTypes;
- (id)currentNamespaceDescription;
- (id)currentNamespaces;
- (id)currentNamespacesForClient:(id)a3;
- (id)fetchedLocales;
- (id)parametersOfNamespaceWithName:(id)a3;
- (id)parametersOfNamespaceWithName:(id)a3 client:(id)a4;
- (id)resourceBundle;
- (id)trialConfigDump;
- (void)_loadAssets:(id)a3 deliveryType:(id)a4 shouldUpdate:(BOOL)a5;
- (void)_unloadAssetsForLocale:(id)a3;
- (void)addFetchForLocale:(id)a3;
- (void)dealloc;
- (void)didUpdateAssetsWithType:(id)a3;
- (void)didUpdateTrialNamespace:(id)a3;
- (void)loadDefaultsForLocale:(id)a3 reload:(BOOL)a4;
- (void)loadDefaultsFromDefaultAssets:(id)a3;
- (void)loadFactorsAtPath:(id)a3 namespaceId:(id)a4;
- (void)loadSupportedLocalesFromFile:(id)a3;
- (void)notifyObservers;
- (void)registerDelegate:(id)a3;
- (void)removeFetchForLanguage:(id)a3;
- (void)removeFetchForLocale:(id)a3;
- (void)requestAssetsForLanguages:(id)a3;
- (void)requestAssetsForLanguages:(id)a3 resourcePath:(id)a4;
- (void)setForceLoad:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)unloadDefaultsForLocale:(id)a3;
- (void)unregisterDelegate:(id)a3;
- (void)updateFetchedLocales:(id)a3;
- (void)updateParameter:(id)a3 inNamespace:(id)a4 withValue:(id)a5;
@end

@implementation SRDefaultsManager

void __42__SRDefaultsManager_updateFetchedLocales___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  if (([v2 isEqualToSet:*(void *)(a1 + 40)] & 1) == 0)
  {
    v3 = [MEMORY[0x263EFF9C0] set];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v26;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v26 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = [*(id *)(*((void *)&v25 + 1) + 8 * v8) localeIdentifier];
          [v3 addObject:v9];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v6);
    }

    v10 = [MEMORY[0x263EFF9C0] set];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v15), "localeIdentifier", (void)v21);
          [v10 addObject:v16];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v33 count:16];
      }
      while (v13);
    }

    v17 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v3;
      __int16 v31 = 2112;
      v32 = v10;
      _os_log_impl(&dword_25E378000, v17, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (fetchedLocales) update fetched locales: %@ --> %@", buf, 0x16u);
    }
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeAllObjects", (void)v21);
  v18 = *(void **)(a1 + 40);
  v19 = *(void **)(*(void *)(a1 + 32) + 40);
  v20 = [v18 allObjects];
  [v19 addObjectsFromArray:v20];
}

void __40__SRDefaultsManager_unregisterDelegate___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [*(id *)(a1[4] + 64) removeObject:a1[5]];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(a1[4] + 64);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6), "locale", (void)v8);
        if (v7) {
          [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v7];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)assetBundleForLocale:(id)a3 client:(id)a4
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(SRDefaultsManager *)self loadDefaultsForLocale:v6 reload:0];
  v46 = v6;
  long long v8 = languageCodeForLocale(v6);
  long long v9 = localeIdentifierForLocale(v46);
  locatiouint64_t n = 0;
  objc_initWeak(&location, self);
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x3032000000;
  v84 = __Block_byref_object_copy_;
  v85 = __Block_byref_object_dispose_;
  id v86 = 0;
  id v86 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v10 = [(SRDefaultsManager *)self defaultsQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SRDefaultsManager_assetBundleForLocale_client___block_invoke;
  block[3] = &unk_265523650;
  objc_copyWeak(&v80, &location);
  block[4] = self;
  id v45 = v7;
  id v76 = v45;
  id v50 = v9;
  id v77 = v50;
  id v49 = v8;
  id v78 = v49;
  v79 = &v81;
  dispatch_sync(v10, block);

  long long v11 = [[SRAssetBundle alloc] initWithLocale:v46];
  id v12 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  obuint64_t j = (id)v82[5];
  uint64_t v51 = [obj countByEnumeratingWithState:&v71 objects:v92 count:16];
  if (v51)
  {
    uint64_t v48 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(void *)v72 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v71 + 1) + 8 * i);
        uint64_t v14 = [(id)v82[5] objectForKeyedSubscript:v13];
        uint64_t v15 = [v14 objectForKeyedSubscript:@"trial"];

        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id v54 = v15;
        uint64_t v16 = [v54 countByEnumeratingWithState:&v67 objects:v91 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v68;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v68 != v17) {
                objc_enumerationMutation(v54);
              }
              uint64_t v19 = *(void *)(*((void *)&v67 + 1) + 8 * j);
              if (([v12 containsObject:v19] & 1) == 0)
              {
                v20 = [v54 objectForKeyedSubscript:v19];
                [(SRAssetBundle *)v11 loadAssetsWithContentType:v13 contentName:v19 contentPath:v20];
                [v12 addObject:v19];
              }
            }
            uint64_t v16 = [v54 countByEnumeratingWithState:&v67 objects:v91 count:16];
          }
          while (v16);
        }

        long long v21 = [(id)v82[5] objectForKeyedSubscript:v13];
        long long v22 = [v21 objectForKeyedSubscript:v50];

        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v53 = v22;
        uint64_t v23 = [v53 countByEnumeratingWithState:&v63 objects:v90 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v64;
          do
          {
            for (uint64_t k = 0; k != v23; ++k)
            {
              if (*(void *)v64 != v24) {
                objc_enumerationMutation(v53);
              }
              uint64_t v26 = *(void *)(*((void *)&v63 + 1) + 8 * k);
              if (([v12 containsObject:v26] & 1) == 0)
              {
                long long v27 = [v53 objectForKeyedSubscript:v26];
                [(SRAssetBundle *)v11 loadAssetsWithContentType:v13 contentName:v26 contentPath:v27];
                [v12 addObject:v26];
              }
            }
            uint64_t v23 = [v53 countByEnumeratingWithState:&v63 objects:v90 count:16];
          }
          while (v23);
        }

        long long v28 = [(id)v82[5] objectForKeyedSubscript:v13];
        v29 = [v28 objectForKeyedSubscript:v49];

        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v30 = v29;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v59 objects:v89 count:16];
        if (v31)
        {
          uint64_t v32 = *(void *)v60;
          do
          {
            for (uint64_t m = 0; m != v31; ++m)
            {
              if (*(void *)v60 != v32) {
                objc_enumerationMutation(v30);
              }
              uint64_t v34 = *(void *)(*((void *)&v59 + 1) + 8 * m);
              if (([v12 containsObject:v34] & 1) == 0)
              {
                uint64_t v35 = [v30 objectForKeyedSubscript:v34];
                [(SRAssetBundle *)v11 loadAssetsWithContentType:v13 contentName:v34 contentPath:v35];
                [v12 addObject:v34];
              }
            }
            uint64_t v31 = [v30 countByEnumeratingWithState:&v59 objects:v89 count:16];
          }
          while (v31);
        }

        v36 = [(id)v82[5] objectForKeyedSubscript:v13];
        v37 = [v36 objectForKeyedSubscript:@"root"];

        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v38 = v37;
        uint64_t v39 = [v38 countByEnumeratingWithState:&v55 objects:v88 count:16];
        if (v39)
        {
          uint64_t v40 = *(void *)v56;
          do
          {
            for (uint64_t n = 0; n != v39; ++n)
            {
              if (*(void *)v56 != v40) {
                objc_enumerationMutation(v38);
              }
              uint64_t v42 = *(void *)(*((void *)&v55 + 1) + 8 * n);
              if (([v12 containsObject:v42] & 1) == 0)
              {
                v43 = [v38 objectForKeyedSubscript:v42];
                [(SRAssetBundle *)v11 loadAssetsWithContentType:v13 contentName:v42 contentPath:v43];
                [v12 addObject:v42];
              }
            }
            uint64_t v39 = [v38 countByEnumeratingWithState:&v55 objects:v88 count:16];
          }
          while (v39);
        }

        [v12 removeAllObjects];
      }
      uint64_t v51 = [obj countByEnumeratingWithState:&v71 objects:v92 count:16];
    }
    while (v51);
  }

  objc_destroyWeak(&v80);
  _Block_object_dispose(&v81, 8);

  objc_destroyWeak(&location);
  return v11;
}

void __49__SRDefaultsManager_assetBundleForLocale_client___block_invoke(uint64_t a1)
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) contentTypesForClient:*(void *)(a1 + 40)];
  long long v61 = [*(id *)(*(void *)(a1 + 32) + 8) assetTypes];
  long long v64 = [*(id *)(*(void *)(a1 + 32) + 16) namespaceTypesForClient:*(void *)(a1 + 40)];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  obuint64_t j = v3;
  uint64_t v65 = [obj countByEnumeratingWithState:&v92 objects:v100 count:16];
  if (v65)
  {
    uint64_t v63 = *(void *)v93;
    unint64_t v4 = 0x265523000uLL;
    long long v71 = WeakRetained;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v93 != v63) {
          objc_enumerationMutation(obj);
        }
        uint64_t v66 = v5;
        id v6 = *(void **)(*((void *)&v92 + 1) + 8 * v5);
        long long v88 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        uint64_t v7 = *(void *)(a1 + 48);
        uint64_t v8 = *(void *)(a1 + 56);
        v98[0] = @"root";
        v98[1] = v7;
        v98[2] = v8;
        id v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:v98 count:3];
        uint64_t v69 = [v67 countByEnumeratingWithState:&v88 objects:v99 count:16];
        if (v69)
        {
          uint64_t v68 = *(void *)v89;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v89 != v68) {
                objc_enumerationMutation(v67);
              }
              uint64_t v70 = v9;
              uint64_t v10 = *(void *)(*((void *)&v88 + 1) + 8 * v9);
              uint64_t v11 = [WeakRetained[3] objectForKeyedSubscript:v10];
              if (v11)
              {
                id v12 = (void *)v11;
                uint64_t v13 = [WeakRetained[3] objectForKeyedSubscript:v10];
                uint64_t v14 = [v13 objectForKeyedSubscript:v6];

                if (v14)
                {
                  for (uint64_t i = 0; i != 6; ++i)
                  {
                    uint64_t v16 = [*(id *)(v4 + 512) deliveryTypeString:i];
                    uint64_t v17 = [WeakRetained[3] objectForKeyedSubscript:v10];
                    v18 = [v17 objectForKeyedSubscript:v6];
                    uint64_t v19 = [v18 objectForKeyedSubscript:v16];

                    if (v19)
                    {
                      if (*(unsigned char *)(*(void *)(a1 + 32) + 72)
                        && (int v20 = [v6 isEqualToString:@"Embedding"], i)
                        && v20)
                      {
                        log = SRLogCategoryGeneral();
                        if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
                          __49__SRDefaultsManager_assetBundleForLocale_client___block_invoke_cold_1(&buf, v87, log);
                        }
                      }
                      else
                      {
                        uint64_t v73 = i;
                        long long v21 = [WeakRetained[3] objectForKeyedSubscript:v10];
                        long long v22 = [v21 objectForKeyedSubscript:v6];
                        long long v72 = v16;
                        uint64_t v23 = [v22 objectForKeyedSubscript:v16];

                        long long v84 = 0u;
                        long long v85 = 0u;
                        long long v82 = 0u;
                        long long v83 = 0u;
                        log = v23;
                        id v74 = [v23 contentNames];
                        uint64_t v24 = [v74 countByEnumeratingWithState:&v82 objects:v97 count:16];
                        if (v24)
                        {
                          uint64_t v25 = v24;
                          uint64_t v26 = *(void *)v83;
                          do
                          {
                            for (uint64_t j = 0; j != v25; ++j)
                            {
                              if (*(void *)v83 != v26) {
                                objc_enumerationMutation(v74);
                              }
                              uint64_t v28 = *(void *)(*((void *)&v82 + 1) + 8 * j);
                              v29 = [log pathWithName:v28];
                              id v30 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectForKeyedSubscript:v6];

                              if (!v30)
                              {
                                id v31 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                                [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:v31 forKeyedSubscript:v6];
                              }
                              uint64_t v32 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectForKeyedSubscript:v6];
                              v33 = [v32 objectForKeyedSubscript:v10];

                              if (!v33)
                              {
                                id v34 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                                uint64_t v35 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectForKeyedSubscript:v6];
                                [v35 setObject:v34 forKeyedSubscript:v10];
                              }
                              v36 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectForKeyedSubscript:v6];
                              v37 = [v36 objectForKeyedSubscript:v10];
                              [v37 setObject:v29 forKey:v28];
                            }
                            uint64_t v25 = [v74 countByEnumeratingWithState:&v82 objects:v97 count:16];
                          }
                          while (v25);
                        }

                        WeakRetained = v71;
                        uint64_t v16 = v72;
                        unint64_t v4 = 0x265523000;
                        uint64_t i = v73;
                      }
                    }
                  }
                }
              }
              uint64_t v9 = v70 + 1;
            }
            while (v70 + 1 != v69);
            uint64_t v69 = [v67 countByEnumeratingWithState:&v88 objects:v99 count:16];
          }
          while (v69);
        }

        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v38 = v64;
        uint64_t v39 = [v38 countByEnumeratingWithState:&v78 objects:v96 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          uint64_t v41 = *(void *)v79;
          id v75 = v38;
          do
          {
            uint64_t v42 = 0;
            os_log_t loga = (os_log_t)v40;
            do
            {
              if (*(void *)v79 != v41) {
                objc_enumerationMutation(v38);
              }
              v43 = *(void **)(*((void *)&v78 + 1) + 8 * v42);
              v44 = [v43 parameterNames];
              int v45 = [v44 containsObject:v6];

              if (v45)
              {
                v46 = [v43 namespaceId];
                uint64_t v47 = [WeakRetained[4] objectForKeyedSubscript:v46];
                if (v47)
                {
                  uint64_t v48 = (void *)v47;
                  id v49 = [WeakRetained[4] objectForKeyedSubscript:v46];
                  id v50 = [v49 objectForKeyedSubscript:v6];

                  if (v50)
                  {
                    uint64_t v51 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v46];
                    v52 = [v51 objectForKeyedSubscript:v6];

                    id v53 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectForKeyedSubscript:v6];
                    id v54 = [v53 objectForKeyedSubscript:@"trial"];

                    if (!v54)
                    {
                      id v55 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                      long long v56 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectForKeyedSubscript:v6];
                      [v56 setObject:v55 forKeyedSubscript:@"trial"];
                    }
                    long long v57 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectForKeyedSubscript:v6];
                    long long v58 = [v57 objectForKeyedSubscript:@"trial"];
                    long long v59 = [v52 getFilePathValue];
                    long long v60 = [v52 getFilePathNameValue];
                    [v58 setValue:v59 forKey:v60];

                    WeakRetained = v71;
                    id v38 = v75;
                  }
                }

                uint64_t v40 = (uint64_t)loga;
              }
              ++v42;
            }
            while (v40 != v42);
            uint64_t v40 = [v38 countByEnumeratingWithState:&v78 objects:v96 count:16];
          }
          while (v40);
        }

        uint64_t v5 = v66 + 1;
        unint64_t v4 = 0x265523000;
      }
      while (v66 + 1 != v65);
      uint64_t v65 = [obj countByEnumeratingWithState:&v92 objects:v100 count:16];
    }
    while (v65);
  }
}

void __58__SRDefaultsManager_parametersOfNamespaceWithName_client___block_invoke(void *a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1[4] + 16) namespaceTypesForClient:a1[5]];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v8 = [v7 namespaceId];
        uint64_t v9 = [v7 parameterNames];
        int v10 = [v9 containsObject:a1[6]];

        if (v10)
        {
          uint64_t v11 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:v8];
          if (v11)
          {
            id v12 = (void *)v11;
            uint64_t v13 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:v8];
            uint64_t v14 = [v13 objectForKeyedSubscript:a1[6]];

            if (v14)
            {
              if (!*(void *)(*(void *)(a1[7] + 8) + 40))
              {
                id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                uint64_t v16 = *(void *)(a1[7] + 8);
                uint64_t v17 = *(void **)(v16 + 40);
                *(void *)(v16 + 40) = v15;
              }
              v18 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:v8];
              uint64_t v19 = [v18 objectForKeyedSubscript:a1[6]];
              [*(id *)(*(void *)(a1[7] + 8) + 40) setObject:v19 forKeyedSubscript:v8];
            }
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v4);
  }
}

void __41__SRDefaultsManager_didFetchForLanguage___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isEqualToString:@"root"])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 40) + 48);
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 40) + 40);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = languageCodeForLocale(*(void **)(*((void *)&v8 + 1) + 8 * i));
          if (objc_msgSend(v7, "isEqualToString:", *(void *)(a1 + 32), (void)v8))
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;

            goto LABEL_13;
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
}

uint64_t __38__SRDefaultsManager_currentAssetTypes__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) assetTypes];
  return MEMORY[0x270F9A758]();
}

- (void)loadDefaultsForLocale:(id)a3 reload:(BOOL)a4
{
  uint64_t v191 = *MEMORY[0x263EF8340];
  id v112 = a3;
  context = (void *)MEMORY[0x2611D4A00]();
  uint64_t v176 = 0;
  v177 = &v176;
  uint64_t v178 = 0x3032000000;
  v179 = __Block_byref_object_copy_;
  v180 = __Block_byref_object_dispose_;
  id v181 = 0;
  val = self;
  id v181 = [(SRDefaultsManager *)self currentAssetTypes];
  locatiouint64_t n = 0;
  objc_initWeak(&location, self);
  v174[0] = MEMORY[0x263EF8330];
  v174[1] = 3221225472;
  v174[2] = __50__SRDefaultsManager_loadDefaultsForLocale_reload___block_invoke;
  v174[3] = &unk_265523498;
  v174[4] = self;
  v174[5] = &v176;
  if (loadDefaultsForLocale_reload__onceToken != -1) {
    dispatch_once(&loadDefaultsForLocale_reload__onceToken, v174);
  }
  v133 = languageCodeForLocale(v112);
  BOOL v6 = -[SRDefaultsManager didFetchForLanguage:](self, "didFetchForLanguage:");
  BOOL v7 = v6;
  if (a4 || !v6)
  {
    v132 = [(SRDefaultsManager *)self resourceBundle];
    if (!v7 && ([v133 isEqualToString:@"root"] & 1) == 0)
    {
      long long v8 = [NSString stringWithFormat:@"RequiredAssets_%@", v133];
      long long v9 = [v132 pathForResource:v8 ofType:@"bundle"];
      long long v10 = [MEMORY[0x263F08850] defaultManager];
      int v11 = [v10 fileExistsAtPath:v9];

      if (v11)
      {
        id v12 = SRLogCategoryGeneral();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = [v9 UTF8String];
          *(_DWORD *)uint8_t buf = 136315138;
          *(void *)&uint8_t buf[4] = v13;
          _os_log_impl(&dword_25E378000, v12, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] loading assets at path <%s>", buf, 0xCu);
        }

        uint64_t v14 = loadAssetsFromResourcePath(v9, @"Required");
        id v15 = [(SRDefaultsManager *)val defaultsQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __50__SRDefaultsManager_loadDefaultsForLocale_reload___block_invoke_162;
        block[3] = &unk_265523310;
        block[4] = val;
        id v173 = v14;
        id v16 = v14;
        dispatch_sync(v15, block);
      }
      self = val;
    }
    if (SRIsAppleInternalInstall() && sHasTestAssets == 1)
    {
      long long v170 = 0u;
      long long v171 = 0u;
      long long v168 = 0u;
      long long v169 = 0u;
      obuint64_t j = (id)v177[5];
      id v126 = (id)[obj countByEnumeratingWithState:&v168 objects:v190 count:16];
      if (v126)
      {
        id v123 = *(id *)v169;
        do
        {
          for (uint64_t i = 0; i != v126; uint64_t i = (char *)i + 1)
          {
            if (*(id *)v169 != v123) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(void **)(*((void *)&v168 + 1) + 8 * i);
            v18 = [v17 assetType];
            char v19 = [v18 isEqualToString:@"com.apple.MobileAsset.SpotlightResources"];

            if (v19)
            {
              long long v166 = 0u;
              long long v167 = 0u;
              long long v164 = 0u;
              long long v165 = 0u;
              long long v20 = [v17 deliveryTypes];
              uint64_t v21 = [v20 countByEnumeratingWithState:&v164 objects:v189 count:16];
              if (v21)
              {
                uint64_t v22 = *(void *)v165;
                do
                {
                  for (uint64_t j = 0; j != v21; ++j)
                  {
                    if (*(void *)v165 != v22) {
                      objc_enumerationMutation(v20);
                    }
                    uint64_t v24 = *(void **)(*((void *)&v164 + 1) + 8 * j);
                    if ([v24 hasSuffix:@"Test"])
                    {
                      uint64_t v25 = [NSString stringWithFormat:@"%@Assets_%@", v24, v133];
                      uint64_t v26 = [v132 pathForResource:v25 ofType:@"bundle"];
                      long long v27 = [MEMORY[0x263F08850] defaultManager];
                      int v28 = [v27 fileExistsAtPath:v26];

                      if (v28)
                      {
                        v29 = SRLogCategoryGeneral();
                        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                        {
                          uint64_t v30 = [v26 UTF8String];
                          *(_DWORD *)uint8_t buf = 136315138;
                          *(void *)&uint8_t buf[4] = v30;
                          _os_log_impl(&dword_25E378000, v29, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] loading assets at path <%s>", buf, 0xCu);
                        }

                        id v31 = loadAssetsFromResourcePath(v26, v24);
                        uint64_t v32 = [(SRDefaultsManager *)val defaultsQueue];
                        v161[0] = MEMORY[0x263EF8330];
                        v161[1] = 3221225472;
                        v161[2] = __50__SRDefaultsManager_loadDefaultsForLocale_reload___block_invoke_166;
                        v161[3] = &unk_265523588;
                        v161[4] = val;
                        id v162 = v31;
                        v163 = v24;
                        id v33 = v31;
                        dispatch_sync(v32, v161);
                      }
                    }
                  }
                  uint64_t v21 = [v20 countByEnumeratingWithState:&v164 objects:v189 count:16];
                }
                while (v21);
              }
            }
          }
          id v126 = (id)[obj countByEnumeratingWithState:&v168 objects:v190 count:16];
        }
        while (v126);
      }

      goto LABEL_110;
    }
    if (![(SRDefaultsManager *)self forceLoad])
    {
      *(void *)uint8_t buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v183 = __Block_byref_object_copy_;
      *(void *)&long long v184 = __Block_byref_object_dispose_;
      *((void *)&v184 + 1) = 0;
      *((void *)&v184 + 1) = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v103 = dispatch_group_create();
      v104 = [(SRDefaultsManager *)self ddsQueue];
      v135[0] = MEMORY[0x263EF8330];
      v135[1] = 3221225472;
      v135[2] = __50__SRDefaultsManager_loadDefaultsForLocale_reload___block_invoke_2_172;
      v135[3] = &unk_2655235B0;
      objc_copyWeak(&v140, &location);
      v138 = &v176;
      id v136 = v133;
      id v137 = v112;
      v139 = buf;
      dispatch_group_async(v103, v104, v135);

      v105 = [(SRDefaultsManager *)val defaultsQueue];
      v134[0] = MEMORY[0x263EF8330];
      v134[1] = 3221225472;
      v134[2] = __50__SRDefaultsManager_loadDefaultsForLocale_reload___block_invoke_173;
      v134[3] = &unk_265523470;
      v134[4] = val;
      v134[5] = buf;
      dispatch_group_notify(v103, v105, v134);

      objc_destroyWeak(&v140);
      _Block_object_dispose(buf, 8);

LABEL_110:
      [(SRDefaultsManager *)val addFetchForLocale:v112];

      goto LABEL_111;
    }
    v111 = [(SRDefaultsManager *)self assetConfig];
    long long v159 = 0u;
    long long v160 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    id v106 = (id)v177[5];
    uint64_t v107 = [v106 countByEnumeratingWithState:&v157 objects:v188 count:16];
    if (!v107) {
      goto LABEL_108;
    }
    uint64_t v108 = *(void *)v158;
LABEL_40:
    uint64_t v109 = 0;
    while (1)
    {
      if (*(void *)v158 != v108) {
        objc_enumerationMutation(v106);
      }
      v130 = *(void **)(*((void *)&v157 + 1) + 8 * v109);
      id v34 = [v130 assetType];
      int v113 = [v34 isEqualToString:@"com.apple.MobileAsset.SpotlightResources"];

      long long v155 = 0u;
      long long v156 = 0u;
      long long v153 = 0u;
      long long v154 = 0u;
      id v115 = [v130 deliveryTypes];
      uint64_t v120 = [v115 countByEnumeratingWithState:&v153 objects:v187 count:16];
      if (v120) {
        break;
      }
LABEL_106:

      if (++v109 == v107)
      {
        uint64_t v107 = [v106 countByEnumeratingWithState:&v157 objects:v188 count:16];
        if (!v107)
        {
LABEL_108:

          goto LABEL_110;
        }
        goto LABEL_40;
      }
    }
    uint64_t v119 = *(void *)v154;
LABEL_45:
    id obja = 0;
    while (1)
    {
      if (*(void *)v154 != v119) {
        objc_enumerationMutation(v115);
      }
      id v127 = *(id *)(*((void *)&v153 + 1) + 8 * (void)obja);
      uint64_t v35 = SRLogCategoryGeneral();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        v96 = [v130 assetType];
        *(_DWORD *)uint8_t buf = 138412546;
        *(void *)&uint8_t buf[4] = v96;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v127;
        _os_log_debug_impl(&dword_25E378000, v35, OS_LOG_TYPE_DEBUG, "(forceLoad=on) type %@, deliveryType %@", buf, 0x16u);
      }
      if (([v127 isEqualToString:@"Required"] & 1) == 0
        && ([v127 hasSuffix:@"Test"] & 1) == 0
        && (!v113 || [v111 isValidLocale:v133 deliveryType:v127]))
      {
        break;
      }
LABEL_59:
      id obja = (char *)obja + 1;
      if (obja == (id)v120)
      {
        uint64_t v102 = [v115 countByEnumeratingWithState:&v153 objects:v187 count:16];
        uint64_t v120 = v102;
        if (!v102) {
          goto LABEL_106;
        }
        goto LABEL_45;
      }
    }
    v36 = [v130 assetType];
    v117 = assetQueryForLocale(v112, v36, v127);

    [v117 setLocalOnly:0];
    [v117 setInstalledOnly:0];
    [v117 setCachedOnly:0];
    id v118 = objc_alloc_init(MEMORY[0x263EFF980]);
    v37 = [MEMORY[0x263F393D8] sharedInstance];
    id v152 = 0;
    v114 = [v37 allContentItemsMatchingQuery:v117 error:&v152];
    id v116 = v152;

    if (v116)
    {
      v124 = SRLogCategoryGeneral();
      if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
      {
        id v97 = [v112 localeIdentifier];
        uint64_t v98 = [v97 UTF8String];
        id v99 = [v130 assetType];
        uint64_t v100 = [v99 UTF8String];
        uint64_t v101 = [v127 UTF8String];
        *(_DWORD *)uint8_t buf = 136315906;
        *(void *)&uint8_t buf[4] = v98;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v100;
        *(_WORD *)&buf[22] = 2080;
        v183 = (uint64_t (*)(uint64_t, uint64_t))v101;
        LOWORD(v184) = 2112;
        *(void *)((char *)&v184 + 2) = v116;
        _os_log_error_impl(&dword_25E378000, v124, OS_LOG_TYPE_ERROR, "(forceLoad on) Error fetching assets for query (%s, %s, %s): %@", buf, 0x2Au);
      }
LABEL_57:

      id v38 = val;
      goto LABEL_58;
    }
    id v38 = val;
    if (!v114)
    {
LABEL_58:
      uint64_t v39 = [(SRDefaultsManager *)v38 defaultsQueue];
      v141[0] = MEMORY[0x263EF8330];
      v141[1] = 3221225472;
      v141[2] = __50__SRDefaultsManager_loadDefaultsForLocale_reload___block_invoke_171;
      v141[3] = &unk_265523588;
      v141[4] = v38;
      id v142 = v118;
      id v143 = v127;
      id v40 = v118;
      dispatch_sync(v39, v141);

      goto LABEL_59;
    }
    long long v150 = 0u;
    long long v151 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    v124 = v114;
    uint64_t v41 = [v124 countByEnumeratingWithState:&v148 objects:v186 count:16];
    if (!v41) {
      goto LABEL_57;
    }
    uint64_t v129 = *(void *)v149;
LABEL_64:
    uint64_t v131 = v41;
    uint64_t v42 = 0;
    while (1)
    {
      if (*(void *)v149 != v129) {
        objc_enumerationMutation(v124);
      }
      v43 = *(void **)(*((void *)&v148 + 1) + 8 * v42);
      v44 = [v43 type];
      if (!v44) {
        goto LABEL_83;
      }
      int v45 = [v130 deliveryTypeMap];
      v46 = [v43 type];
      uint64_t v47 = [v45 objectForKeyedSubscript:v46];
      if (!v47) {
        break;
      }
      uint64_t v48 = [v130 deliveryTypeMap];
      id v49 = [v43 type];
      id v50 = [v48 objectForKeyedSubscript:v49];
      char v51 = [v50 containsObject:v127];

      if ((v51 & 1) == 0) {
        goto LABEL_83;
      }
      v52 = [v43 locale];
      if (v52)
      {
        id v53 = [v43 path];
        if (v53)
        {
          id v54 = [v43 fileName];
          BOOL v55 = v54 == 0;

          if (!v55)
          {
            long long v56 = [v43 type];
            int v57 = [v56 isEqualToString:@"Safety"];

            if (v57)
            {
              long long v58 = [v43 locale];
              long long v59 = [v43 parentAsset];
              uint64_t v60 = [v59 contentVersion];

              sLastLoadedContentVersiouint64_t n = v60;
              long long v61 = SRLogCategorySafety();
              long long v62 = v61;
              unint64_t v63 = sSafetyDDSLoadSignpostID;
              os_signpost_id_t v64 = ++sSafetyDDSLoadSignpostID;
              if (v63 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
              {
                uint64_t v65 = [v58 UTF8String];
                *(_DWORD *)uint8_t buf = 136315394;
                *(void *)&uint8_t buf[4] = v65;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v60;
                _os_signpost_emit_with_name_impl(&dword_25E378000, v62, OS_SIGNPOST_EVENT, v64, "SRSafetyDDSForceLoad", "loc:%s, v:%lu", buf, 0x16u);
              }
            }
            buf[0] = 0;
            uint64_t v66 = [MEMORY[0x263F08850] defaultManager];
            id v67 = [v43 path];
            uint64_t v68 = [v67 path];
            int v69 = [v66 fileExistsAtPath:v68 isDirectory:buf];

            if (v69)
            {
              if (buf[0]
                && ([v43 fileName],
                    uint64_t v70 = objc_claimAutoreleasedReturnValue(),
                    char v71 = [v70 containsString:@"."],
                    v70,
                    (v71 & 1) == 0))
              {
                id v86 = [MEMORY[0x263F08850] defaultManager];
                v87 = [v43 path];
                long long v88 = [v86 enumeratorAtURL:v87 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:5 errorHandler:0];

                id v73 = objc_alloc_init(MEMORY[0x263EFF980]);
                long long v146 = 0u;
                long long v147 = 0u;
                long long v144 = 0u;
                long long v145 = 0u;
                id v72 = v88;
                uint64_t v89 = [v72 countByEnumeratingWithState:&v144 objects:v185 count:16];
                if (v89)
                {
                  uint64_t v90 = *(void *)v145;
                  do
                  {
                    for (uint64_t k = 0; k != v89; ++k)
                    {
                      if (*(void *)v145 != v90) {
                        objc_enumerationMutation(v72);
                      }
                      long long v92 = [*(id *)(*((void *)&v144 + 1) + 8 * k) lastPathComponent];
                      [v73 addObject:v92];
                    }
                    uint64_t v89 = [v72 countByEnumeratingWithState:&v144 objects:v185 count:16];
                  }
                  while (v89);
                }

                id v75 = [v43 locale];
                id v76 = [v43 type];
                int64_t v93 = +[SRAsset deliveryTypeFromString:v127];
                long long v94 = [v43 path];
                long long v95 = [v94 path];
                id v77 = +[SRAsset assetWithLocaleIdentifier:v75 contentType:v76 deliveryType:v93 resourceRoot:v95 pathNames:v73];
              }
              else
              {
                id v72 = [v43 locale];
                id v73 = [v43 type];
                int64_t v74 = +[SRAsset deliveryTypeFromString:v127];
                id v75 = [v43 path];
                id v76 = [v75 path];
                id v77 = +[SRAsset assetWithLocaleIdentifier:v72 contentType:v73 deliveryType:v74 path:v76];
              }

              if (v77) {
                [v118 addObject:v77];
              }
            }
            goto LABEL_86;
          }
        }
        else
        {
        }
      }
      long long v78 = SRLogCategoryGeneral();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        long long v82 = [v43 type];
        long long v83 = [v43 locale];
        long long v84 = [v43 path];
        long long v85 = [v43 fileName];
        *(_DWORD *)uint8_t buf = 138413058;
        *(void *)&uint8_t buf[4] = v82;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v83;
        *(_WORD *)&buf[22] = 2112;
        v183 = v84;
        LOWORD(v184) = 2112;
        *(void *)((char *)&v184 + 2) = v85;
        _os_log_error_impl(&dword_25E378000, v78, OS_LOG_TYPE_ERROR, "(forceLoad on) Invalid dds asset (%@, %@, %@, %@)", buf, 0x2Au);
      }
LABEL_85:

LABEL_86:
      if (++v42 == v131)
      {
        uint64_t v41 = [v124 countByEnumeratingWithState:&v148 objects:v186 count:16];
        if (!v41) {
          goto LABEL_57;
        }
        goto LABEL_64;
      }
    }

LABEL_83:
    long long v78 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
    {
      id v79 = [v43 type];
      uint64_t v80 = [v79 UTF8String];
      uint64_t v81 = [v127 UTF8String];
      *(_DWORD *)uint8_t buf = 136315394;
      *(void *)&uint8_t buf[4] = v80;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v81;
      _os_log_debug_impl(&dword_25E378000, v78, OS_LOG_TYPE_DEBUG, "(forceLoad on) Not fetching asset with type %s for deliveryType %s", buf, 0x16u);
    }
    goto LABEL_85;
  }
LABEL_111:

  objc_destroyWeak(&location);
  _Block_object_dispose(&v176, 8);
}

- (BOOL)didFetchForLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v5 = [(SRDefaultsManager *)self defaultsQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SRDefaultsManager_didFetchForLanguage___block_invoke;
  block[3] = &unk_2655234E8;
  long long v10 = self;
  int v11 = &v12;
  id v9 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

- (id)currentAssetTypes
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy_;
  int v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v3 = [(SRDefaultsManager *)self defaultsQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__SRDefaultsManager_currentAssetTypes__block_invoke;
  v6[3] = &unk_265523470;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (OS_dispatch_queue)defaultsQueue
{
  return self->_defaultsQueue;
}

uint64_t __38__SRDefaultsManager_registerDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) addObject:*(void *)(a1 + 40)];
}

+ (id)sharedDefaultsManager
{
  if (sharedDefaultsManager_onceToken != -1) {
    dispatch_once(&sharedDefaultsManager_onceToken, &__block_literal_global_4);
  }
  id v2 = (void *)sharedDefaultsManager_gDefaultsManager;
  return v2;
}

- (void)setOptions:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKeyedSubscript:@"forceLoad"];

    if (v6)
    {
      BOOL forceLoad = self->_forceLoad;
      long long v8 = [v5 objectForKeyedSubscript:@"forceLoad"];
      self->_BOOL forceLoad = [v8 BOOLValue];

      if (!forceLoad && self->_forceLoad)
      {
        uint64_t v9 = [(SRDefaultsManager *)self fetchedLocales];
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v16;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v16 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v15 + 1) + 8 * i);
              [(SRDefaultsManager *)self unloadDefaultsForLocale:v14];
              [(SRDefaultsManager *)self loadDefaultsForLocale:v14 reload:1];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }
          while (v11);
        }
        [(SRDefaultsManager *)self notifyObservers];
      }
    }
  }
}

- (void)registerDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SRDefaultsManager *)self delegatesQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__SRDefaultsManager_registerDelegate___block_invoke;
  v7[3] = &unk_265523310;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)unregisterDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  id v15 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v5 = [(SRDefaultsManager *)self delegatesQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__SRDefaultsManager_unregisterDelegate___block_invoke;
  block[3] = &unk_2655234C0;
  void block[4] = self;
  id v6 = v4;
  id v8 = v6;
  uint64_t v9 = &v10;
  dispatch_sync(v5, block);

  [(SRDefaultsManager *)self updateFetchedLocales:v11[5]];
  _Block_object_dispose(&v10, 8);
}

- (OS_dispatch_queue)delegatesQueue
{
  return self->_delegatesQueue;
}

- (void)updateFetchedLocales:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SRDefaultsManager *)self defaultsQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__SRDefaultsManager_updateFetchedLocales___block_invoke;
  v7[3] = &unk_265523310;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (id)parametersOfNamespaceWithName:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  id v8 = [(SRDefaultsManager *)self defaultsQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__SRDefaultsManager_parametersOfNamespaceWithName_client___block_invoke;
  v13[3] = &unk_265523628;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  long long v16 = &v17;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

uint64_t __42__SRDefaultsManager_sharedDefaultsManager__block_invoke()
{
  sharedDefaultsManager_gDefaultsManager = objc_alloc_init(SRDefaultsManager);
  return MEMORY[0x270F9A758]();
}

+ (unint64_t)lastLoadedContentVersion
{
  return sLastLoadedContentVersion;
}

+ (id)identifier
{
  return @"com.apple.SpotlightResources.Defaults";
}

+ (id)userDefaults
{
  id v2 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v3 = +[SRDefaultsManager identifier];
  id v4 = (void *)[v2 initWithSuiteName:v3];

  return v4;
}

+ (id)defaultProperties
{
  id v2 = [(id)objc_opt_class() userDefaults];
  uint64_t v3 = [v2 dictionaryRepresentation];
  id v4 = [v3 objectForKey:@"Defaults"];

  return v4;
}

+ (void)setDefaultWithKey:(id)a3 value:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v10 = [(id)objc_opt_class() userDefaults];
  id v7 = [(id)objc_opt_class() defaultProperties];
  if (v7)
  {
    id v8 = [(id)objc_opt_class() defaultProperties];
    id v9 = (id)[v8 mutableCopy];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }

  [v9 setObject:v5 forKey:v6];
  [v10 setObject:v9 forKey:@"Defaults"];
}

+ (id)defaultValueWithKey:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() defaultProperties];
  id v5 = [v4 objectForKey:v3];

  return v5;
}

+ (void)removeKey:(id)a3
{
  id v3 = a3;
  id v6 = [(id)objc_opt_class() userDefaults];
  id v4 = [(id)objc_opt_class() defaultProperties];
  id v5 = (void *)[v4 mutableCopy];

  [v5 removeObjectForKey:v3];
  [v6 setObject:v5 forKey:@"Defaults"];
}

+ (void)removeDefaults
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v3 = +[SRDefaultsManager identifier];
  [v2 removePersistentDomainForName:v3];

  id v4 = (void *)MEMORY[0x263EFFA40];
  [v4 resetStandardUserDefaults];
}

+ (void)setVersionWithValue:(int64_t)a3
{
  id v4 = objc_opt_class();
  id v5 = [NSNumber numberWithInteger:a3];
  [v4 setDefaultWithKey:@"Version" value:v5];
}

+ (int64_t)version
{
  id v2 = +[SRDefaultsManager defaultValueWithKey:@"Version"];
  id v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (SRDefaultsManager)init
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)SRDefaultsManager;
  id v2 = [(SRDefaultsManager *)&v33 init];
  if (v2)
  {
    uint64_t v3 = +[SRAssetConfiguration configuration];
    assetConfig = v2->_assetConfig;
    v2->_assetConfig = (SRAssetConfiguration *)v3;

    uint64_t v5 = +[SRTrialConfiguration configuration];
    trialConfig = v2->_trialConfig;
    v2->_trialConfig = (SRTrialConfiguration *)v5;

    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assets = v2->_assets;
    v2->_assets = v7;

    id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    parameters = v2->_parameters;
    v2->_parameters = v9;

    id v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    fetchedLocales = v2->_fetchedLocales;
    v2->_fetchedLocales = v11;

    v2->_fetchedRoot = 0;
    uint64_t v13 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    delegates = v2->_delegates;
    v2->_delegates = (NSHashTable *)v13;

    id v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    long long v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.spotlightresources.ddsLoading", v16);
    ddsQueue = v2->_ddsQueue;
    v2->_ddsQueue = (OS_dispatch_queue *)v17;

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.spotlightresources.defaultsLoading", v16);
    defaultsQueue = v2->_defaultsQueue;
    v2->_defaultsQueue = (OS_dispatch_queue *)v19;

    dispatch_queue_t v21 = dispatch_queue_create("com.apple.spotlightresources.delegates", v16);
    delegatesQueue = v2->_delegatesQueue;
    v2->_delegatesQueue = (OS_dispatch_queue *)v21;

    long long v23 = [MEMORY[0x263F393D8] sharedInstance];
    [v23 registerDelegate:v2];

    uint64_t v24 = [(SRDefaultsManager *)v2 resourceBundle];
    uint64_t v25 = [v24 pathForResource:@"RequiredAssets_root" ofType:@"bundle"];
    uint64_t v26 = [MEMORY[0x263F08850] defaultManager];
    int v27 = [v26 fileExistsAtPath:v25];

    if (v27)
    {
      int v28 = SRLogCategoryGeneral();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = [v25 UTF8String];
        *(_DWORD *)uint8_t buf = 136315138;
        uint64_t v35 = v29;
        _os_log_impl(&dword_25E378000, v28, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] loading defaults at path <%s>", buf, 0xCu);
      }

      uint64_t v30 = loadAssetsFromResourcePath(v25, @"Required");
      [(SRDefaultsManager *)v2 loadDefaultsFromDefaultAssets:v30];
    }
    v2->_BOOL forceLoad = 0;
    id v31 = +[SRDefaultsManager defaultValueWithKey:@"IgnoreOTAEmbeddings"];
    v2->_ignoreOTAEmbeddings = [v31 BOOLValue];
  }
  return v2;
}

- (id)resourceBundle
{
  id v2 = self->_customBundle;
  if (!v2)
  {
    uint64_t v3 = [NSString stringWithFormat:@"%@System/Library/PrivateFrameworks/SpotlightResources.framework", @"/"];
    id v2 = [MEMORY[0x263F086E0] bundleWithPath:v3];
    if (!v2)
    {
      id v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SpotlightResources"];
    }
  }
  return v2;
}

- (void)loadDefaultsFromDefaultAssets:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 1;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  int v28 = __Block_byref_object_copy_;
  uint64_t v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  id v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy_;
  v21[4] = __Block_byref_object_dispose_;
  id v22 = 0;
  id v22 = +[SRAssetConfiguration configuration];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy_;
  v19[4] = __Block_byref_object_dispose_;
  id v20 = 0;
  id v20 = +[SRTrialConfiguration configuration];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __51__SRDefaultsManager_loadDefaultsFromDefaultAssets___block_invoke;
  v18[3] = &unk_2655233F8;
  v18[4] = v19;
  v18[5] = v21;
  v18[6] = &v31;
  v18[7] = &v25;
  v18[8] = v23;
  [v4 enumerateObjectsUsingBlock:v18];
  if (*((unsigned char *)v32 + 24))
  {
    uint64_t v5 = [(SRDefaultsManager *)self defaultsQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__SRDefaultsManager_loadDefaultsFromDefaultAssets___block_invoke_123;
    block[3] = &unk_265523420;
    void block[4] = self;
    void block[5] = v21;
    block[6] = v19;
    block[7] = v23;
    dispatch_sync(v5, block);

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = (id)v26[5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          id v11 = objc_msgSend(v10, "contentType", (void)v13);
          uint64_t v12 = [v10 pathWithName:@"factors.mdplist"];
          [(SRDefaultsManager *)self loadFactorsAtPath:v12 namespaceId:v11];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v35 count:16];
      }
      while (v7);
    }
  }
  _Block_object_dispose(v19, 8);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
}

void __51__SRDefaultsManager_loadDefaultsFromDefaultAssets___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v154 = *MEMORY[0x263EF8340];
  id v6 = a2;
  uint64_t v7 = [v6 contentType];
  int v8 = [v7 isEqualToString:@"Defaults"];

  if (!v8)
  {
    long long v14 = [v6 pathWithName:@"factors.mdplist"];

    long long v15 = v6;
    if (v14)
    {
      long long v16 = *(void **)(*(void *)(a1[7] + 8) + 40);
      if (!v16)
      {
        id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
        uint64_t v18 = *(void *)(a1[7] + 8);
        dispatch_queue_t v19 = *(void **)(v18 + 40);
        *(void *)(v18 + 40) = v17;

        uint64_t v20 = a1[7];
LABEL_11:
        long long v16 = *(void **)(*(void *)(v20 + 8) + 40);
      }
    }
    else
    {
      long long v16 = *(void **)(*(void *)(a1[8] + 8) + 40);
      if (!v16)
      {
        id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
        uint64_t v22 = *(void *)(a1[8] + 8);
        long long v23 = *(void **)(v22 + 40);
        *(void *)(v22 + 40) = v21;

        uint64_t v20 = a1[8];
        goto LABEL_11;
      }
    }
    [v16 addObject:v6];
    goto LABEL_135;
  }
  id v9 = v6;
  v105 = v6;
  if (SRIsAppleInternalInstall())
  {
    id v10 = [v6 pathWithName:@"defaultsTest.plist"];
    id v11 = [MEMORY[0x263F08850] defaultManager];
    char v12 = [v11 fileExistsAtPath:v10];

    if (v12)
    {
      sHasTestAssets = 1;
      id v9 = v105;
      long long v13 = v10;
      if (v10) {
        goto LABEL_21;
      }
    }
    else
    {

      id v9 = v105;
    }
  }
  id v24 = [v9 pathWithName:@"defaults2024.plist"];
  if (SRIsAppleInternalInstall())
  {
    uint64_t v25 = +[SRDefaultsManager defaultValueWithKey:@"legacyOTA"];
    uint64_t v26 = v25;
    if (v25 && [v25 BOOLValue])
    {
      uint64_t v27 = [v105 pathWithName:@"defaults.plist"];

      id v24 = (void *)v27;
    }
  }
  int v28 = [MEMORY[0x263F08850] defaultManager];
  char v29 = [v28 fileExistsAtPath:v24];

  if (v29)
  {
    id v9 = v105;
    long long v13 = v24;
    if (!v24)
    {
      v104 = 0;
      id v30 = (void *)MEMORY[0x263EFFA78];
LABEL_26:
      unint64_t v32 = 0x263EFF000uLL;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
        *a4 = 1;
LABEL_126:
        if (sHasTestAssets) {
          uint64_t v98 = @"localesTest.plist";
        }
        else {
          uint64_t v98 = @"locales.plist";
        }
        id v99 = [v9 pathWithName:v98];
        if (v99)
        {
          uint64_t v100 = *(void **)(v32 + 2352);
          uint64_t v101 = [NSURL fileURLWithPath:v99];
          uint64_t v102 = [v100 dictionaryWithContentsOfURL:v101 error:0];

          if (v102)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [*(id *)(*(void *)(a1[5] + 8) + 40) setLocales:v102];
            }
          }
        }
        else
        {
          uint64_t v102 = v30;
        }

        long long v15 = v105;
        goto LABEL_135;
      }
      v103 = v30;
      uint64_t v33 = [v30 objectForKeyedSubscript:@"DefaultsCompatibilityVersion"];
      if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v33 integerValue] == 2)
      {
        char v34 = [v30 objectForKeyedSubscript:@"Clients"];

        if (v34)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v33 = v34;
            goto LABEL_125;
          }
          id v35 = v34;
          long long v143 = 0u;
          long long v144 = 0u;
          long long v145 = 0u;
          long long v146 = 0u;
          uint64_t v111 = [v35 countByEnumeratingWithState:&v143 objects:v153 count:16];
          obuint64_t j = v35;
          if (v111)
          {
            uint64_t v110 = *(void *)v144;
            unint64_t v36 = 0x263EFF000uLL;
            int v113 = a1;
            do
            {
              for (uint64_t i = 0; i != v111; ++i)
              {
                if (*(void *)v144 != v110) {
                  objc_enumerationMutation(obj);
                }
                id v38 = *(id *)(*((void *)&v143 + 1) + 8 * i);

                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v35 = [obj objectForKeyedSubscript:v38];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v109 = i;
                    id v39 = v35;
                    id v40 = [v39 objectForKeyedSubscript:@"Trial"];
                    id v35 = v39;
                    id v114 = v38;
                    uint64_t v108 = v40;
                    if (v40)
                    {
                      uint64_t v41 = v40;
                      uint64_t v42 = [v40 objectForKeyedSubscript:@"Namespaces"];
                      id v35 = v39;
                      if (v42)
                      {
                        v43 = (void *)v42;
                        v44 = [v41 objectForKeyedSubscript:@"Namespaces"];
                        objc_opt_class();
                        char isKindOfClass = objc_opt_isKindOfClass();

                        id v35 = v39;
                        if (isKindOfClass)
                        {
                          int v45 = [v41 objectForKeyedSubscript:@"Namespaces"];
                          long long v139 = 0u;
                          long long v140 = 0u;
                          long long v141 = 0u;
                          long long v142 = 0u;
                          uint64_t v46 = [v45 countByEnumeratingWithState:&v139 objects:v152 count:16];
                          id v106 = v39;
                          if (v46)
                          {
                            uint64_t v47 = v46;
                            uint64_t v48 = *(void *)v140;
                            uint64_t v122 = *(void *)v140;
                            v125 = v45;
                            do
                            {
                              for (uint64_t j = 0; j != v47; ++j)
                              {
                                if (*(void *)v140 != v48) {
                                  objc_enumerationMutation(v45);
                                }
                                id v50 = *(id *)(*((void *)&v139 + 1) + 8 * j);

                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v39 = [v45 objectForKeyedSubscript:v50];
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v51 = v39;
                                    uint64_t v52 = [v51 objectForKey:@"Namespace"];
                                    if (v52)
                                    {
                                      id v53 = (void *)v52;
                                      id v54 = [v51 objectForKeyedSubscript:@"Namespace"];
                                      objc_opt_class();
                                      char v55 = objc_opt_isKindOfClass();

                                      unint64_t v36 = 0x263EFF000;
                                      if (v55)
                                      {
                                        uint64_t v56 = [v51 objectForKeyedSubscript:@"Namespace"];
                                        if (v56)
                                        {
                                          int v57 = (void *)v56;
                                          v150[0] = @"namespaceId";
                                          v150[1] = @"namespaceName";
                                          v151[0] = v50;
                                          v151[1] = v56;
                                          long long v58 = [*(id *)(v32 + 2352) dictionaryWithObjects:v151 forKeys:v150 count:2];
                                          [*(id *)(*(void *)(v113[4] + 8) + 40) setProperties:v58 client:v114];

                                          unint64_t v36 = 0x263EFF000;
                                        }
                                      }
                                    }

                                    uint64_t v48 = v122;
                                    int v45 = v125;
                                  }
                                }
                                else
                                {
                                  id v39 = v50;
                                }
                                id v38 = v114;
                              }
                              uint64_t v47 = [v45 countByEnumeratingWithState:&v139 objects:v152 count:16];
                            }
                            while (v47);
                          }

                          id v35 = 0;
                          a1 = v113;
                          id v39 = v106;
                        }
                      }
                    }
                    long long v59 = [v39 objectForKeyedSubscript:@"MobileAssets"];
                    if (v59)
                    {
                      id v107 = v39;
                      long long v137 = 0u;
                      long long v138 = 0u;
                      long long v135 = 0u;
                      long long v136 = 0u;
                      id v118 = v59;
                      unint64_t v60 = 0x263EFF000uLL;
                      uint64_t v116 = [v59 countByEnumeratingWithState:&v135 objects:v149 count:16];
                      if (v116)
                      {
                        uint64_t v115 = *(void *)v136;
                        do
                        {
                          uint64_t v61 = 0;
                          do
                          {
                            if (*(void *)v136 != v115)
                            {
                              uint64_t v62 = v61;
                              objc_enumerationMutation(v118);
                              uint64_t v61 = v62;
                            }
                            uint64_t v119 = v61;
                            id v63 = *(id *)(*((void *)&v135 + 1) + 8 * v61);

                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              os_signpost_id_t v64 = *(objc_class **)(v60 + 2464);
                              id v65 = v63;
                              id v66 = objc_alloc_init(v64);
                              [v66 setObject:v65 forKey:@"AssetType"];
                              [v66 setObject:v38 forKey:@"Client"];
                              id v67 = objc_alloc_init(*(Class *)(v60 + 2464));
                              id v126 = v66;
                              [v66 setObject:v67 forKey:@"DeliveryTypes"];

                              id v35 = [v118 objectForKeyedSubscript:v65];
                              v117 = v65;

                              if (v35)
                              {
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  uint64_t v68 = [v118 objectForKeyedSubscript:v65];
                                  int v69 = [v68 objectForKeyedSubscript:@"MobileAssetPropertiesPath"];

                                  if (v69 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    id v70 = v69;
                                    char v71 = getMobileAssetPropertiesFromPath((uint64_t)v70);
                                    [v126 setObject:v71 forKey:@"AssetProperties"];
                                    [v126 setObject:v70 forKey:@"ResourcePath"];
                                  }
                                  else
                                  {
                                    id v72 = [v118 objectForKeyedSubscript:v117];
                                    id v70 = [v72 objectForKeyedSubscript:@"MobileAssetProperties"];

                                    if (v70)
                                    {
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass()) {
                                        [v126 setObject:v70 forKey:@"AssetProperties"];
                                      }
                                    }
                                  }
                                  id v73 = [v118 objectForKeyedSubscript:v117];
                                  id v35 = [v73 objectForKeyedSubscript:@"DeliveryTypes"];

                                  if (v35)
                                  {
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v74 = v35;
                                      long long v131 = 0u;
                                      long long v132 = 0u;
                                      long long v133 = 0u;
                                      long long v134 = 0u;
                                      id v75 = v74;
                                      uint64_t v123 = [v74 countByEnumeratingWithState:&v131 objects:v148 count:16];
                                      if (v123)
                                      {
                                        uint64_t v76 = *(void *)v132;
                                        id v75 = v74;
                                        uint64_t v120 = *(void *)v132;
                                        v121 = v74;
                                        do
                                        {
                                          for (uint64_t k = 0; k != v123; ++k)
                                          {
                                            if (*(void *)v132 != v76) {
                                              objc_enumerationMutation(v74);
                                            }
                                            id v78 = *(id *)(*((void *)&v131 + 1) + 8 * k);

                                            if (v78)
                                            {
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                id v79 = v78;
                                                uint64_t v80 = [v126 objectForKeyedSubscript:@"DeliveryTypes"];

                                                if (!v80)
                                                {
                                                  id v81 = objc_alloc_init(*(Class *)(v60 + 2464));
                                                  [v126 setObject:v81 forKeyedSubscript:@"DeliveryTypes"];
                                                }
                                                long long v82 = [v126 objectForKeyedSubscript:@"DeliveryTypes"];
                                                long long v83 = [v82 objectForKeyedSubscript:v79];

                                                if (!v83)
                                                {
                                                  id v84 = objc_alloc_init(*(Class *)(v36 + 2432));
                                                  long long v85 = [v126 objectForKeyedSubscript:@"DeliveryTypes"];
                                                  [v85 setObject:v84 forKeyedSubscript:v79];
                                                }
                                                id v74 = v121;
                                                id v75 = [v121 objectForKeyedSubscript:v79];

                                                if (v75)
                                                {
                                                  objc_opt_class();
                                                  if (objc_opt_isKindOfClass())
                                                  {
                                                    id v86 = [v121 objectForKeyedSubscript:v79];
                                                    v87 = [v86 objectForKeyedSubscript:@"ContentTypes"];

                                                    if (v87)
                                                    {
                                                      objc_opt_class();
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        id v88 = v87;
                                                        long long v127 = 0u;
                                                        long long v128 = 0u;
                                                        long long v129 = 0u;
                                                        long long v130 = 0u;
                                                        uint64_t v89 = [v88 countByEnumeratingWithState:&v127 objects:v147 count:16];
                                                        id v90 = v88;
                                                        if (v89)
                                                        {
                                                          uint64_t v91 = v89;
                                                          uint64_t v92 = *(void *)v128;
                                                          id v90 = v88;
                                                          do
                                                          {
                                                            for (uint64_t m = 0; m != v91; ++m)
                                                            {
                                                              long long v94 = v90;
                                                              if (*(void *)v128 != v92) {
                                                                objc_enumerationMutation(v88);
                                                              }
                                                              id v90 = *(id *)(*((void *)&v127 + 1) + 8 * m);

                                                              if (v90)
                                                              {
                                                                objc_opt_class();
                                                                if (objc_opt_isKindOfClass())
                                                                {
                                                                  id v95 = v90;
                                                                  v96 = [v126 objectForKeyedSubscript:@"DeliveryTypes"];
                                                                  id v97 = [v96 objectForKeyedSubscript:v79];
                                                                  [v97 addObject:v95];
                                                                }
                                                              }
                                                            }
                                                            uint64_t v91 = [v88 countByEnumeratingWithState:&v127 objects:v147 count:16];
                                                          }
                                                          while (v91);
                                                        }

                                                        id v75 = 0;
                                                        unint64_t v32 = 0x263EFF000;
                                                        unint64_t v60 = 0x263EFF000;
                                                        unint64_t v36 = 0x263EFF000;
                                                      }
                                                      else
                                                      {
                                                        id v75 = v87;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      id v75 = 0;
                                                    }
                                                    id v74 = v121;
                                                  }
                                                }

                                                uint64_t v76 = v120;
                                              }
                                              else
                                              {
                                                id v75 = v78;
                                              }
                                            }
                                            else
                                            {
                                              id v75 = 0;
                                            }
                                          }
                                          uint64_t v123 = [v74 countByEnumeratingWithState:&v131 objects:v148 count:16];
                                        }
                                        while (v123);
                                      }

                                      id v35 = 0;
                                      a1 = v113;
                                      id v38 = v114;
                                    }
                                  }
                                }
                              }
                              [*(id *)(*(void *)(a1[5] + 8) + 40) setProperties:v126 client:v38];
                            }
                            else
                            {
                              id v35 = v63;
                            }
                            uint64_t v61 = v119 + 1;
                          }
                          while (v119 + 1 != v116);
                          uint64_t v116 = [v118 countByEnumeratingWithState:&v135 objects:v149 count:16];
                        }
                        while (v116);
                      }

                      id v35 = 0;
                      id v39 = v107;
                      long long v59 = v118;
                    }

                    uint64_t i = v109;
                  }
                }
                else
                {
                  id v35 = v38;
                }
              }
              uint64_t v111 = [obj countByEnumeratingWithState:&v143 objects:v153 count:16];
            }
            while (v111);
          }
        }
        uint64_t v33 = 0;
      }
      else
      {
        *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
        *a4 = 1;
      }
LABEL_125:

      id v30 = v33;
      id v9 = v105;
      goto LABEL_126;
    }
LABEL_21:
    v104 = v13;
    id v30 = objc_msgSend(NSDictionary, "dictionaryWithContentsOfFile:");
    goto LABEL_26;
  }
  uint64_t v31 = SRLogCategoryGeneral();
  long long v15 = v105;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    __51__SRDefaultsManager_loadDefaultsFromDefaultAssets___block_invoke_cold_1((uint64_t)v24, v31);
  }

LABEL_135:
}

uint64_t __51__SRDefaultsManager_loadDefaultsFromDefaultAssets___block_invoke_123(void *a1)
{
  objc_storeStrong((id *)(a1[4] + 8), *(id *)(*(void *)(a1[5] + 8) + 40));
  objc_storeStrong((id *)(a1[4] + 16), *(id *)(*(void *)(a1[6] + 8) + 40));
  id v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(*(void *)(a1[7] + 8) + 40);
  return [v2 _loadAssets:v3 deliveryType:@"Required" shouldUpdate:1];
}

- (void)loadSupportedLocalesFromFile:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SRDefaultsManager *)self defaultsQueue];
  dispatch_assert_queue_V2(v5);

  obuint64_t j = (id)[[NSString alloc] initWithFormat:@"%@/locales.plist", v4];
  objc_storeStrong((id *)&self->_supportedLocalesPath, obj);
  id v6 = [MEMORY[0x263F08850] defaultManager];
  LODWORD(v5) = [v6 fileExistsAtPath:obj];

  if (v5)
  {
    uint64_t v7 = NSDictionary;
    int v8 = [NSURL fileURLWithPath:obj];
    id v9 = [v7 dictionaryWithContentsOfURL:v8 error:0];

    id v10 = [v9 objectForKeyedSubscript:@"Version"];
    unsigned int v11 = [v10 unsignedIntValue];
    if ([(SRAssetConfiguration *)self->_assetConfig supportedLocalesVersion] < v11) {
      [(SRAssetConfiguration *)self->_assetConfig setLocales:v9];
    }
  }
  MEMORY[0x270F9A790]();
}

- (void)_loadAssets:(id)a3 deliveryType:(id)a4 shouldUpdate:(BOOL)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(SRDefaultsManager *)self defaultsQueue];
  dispatch_assert_queue_V2(v10);

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__SRDefaultsManager__loadAssets_deliveryType_shouldUpdate___block_invoke;
  v12[3] = &unk_265523448;
  v12[4] = self;
  id v13 = v8;
  BOOL v14 = a5;
  id v11 = v8;
  [v9 enumerateObjectsUsingBlock:v12];
}

void __59__SRDefaultsManager__loadAssets_deliveryType_shouldUpdate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v5 = [v3 localeIdentifier];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v8 = *(void **)(*(void *)(a1 + 32) + 24);
    id v9 = [v3 localeIdentifier];
    [v8 setObject:v7 forKeyedSubscript:v9];
  }
  id v10 = *(void **)(*(void *)(a1 + 32) + 24);
  id v11 = [v3 localeIdentifier];
  char v12 = [v10 objectForKeyedSubscript:v11];
  id v13 = [v3 contentType];
  BOOL v14 = [v12 objectForKeyedSubscript:v13];

  if (!v14)
  {
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v16 = *(void **)(*(void *)(a1 + 32) + 24);
    id v17 = [v3 localeIdentifier];
    uint64_t v18 = [v16 objectForKeyedSubscript:v17];
    dispatch_queue_t v19 = [v3 contentType];
    [v18 setObject:v15 forKeyedSubscript:v19];
  }
  uint64_t v20 = *(void **)(*(void *)(a1 + 32) + 24);
  id v21 = [v3 localeIdentifier];
  uint64_t v22 = [v20 objectForKeyedSubscript:v21];
  long long v23 = [v3 contentType];
  id v24 = [v22 objectForKeyedSubscript:v23];
  uint64_t v25 = [v24 objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v25)
  {
    int v26 = *(unsigned __int8 *)(a1 + 48);

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v27 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = [v3 localeIdentifier];
    uint64_t v29 = [v28 UTF8String];
    id v30 = [v3 contentType];
    uint64_t v31 = [v30 UTF8String];
    uint64_t v32 = [*(id *)(a1 + 40) UTF8String];
    uint64_t v33 = [v3 contentPaths];
    id v34 = [v33 componentsJoinedByString:@","];
    *(_DWORD *)uint8_t buf = 136315906;
    uint64_t v61 = v29;
    __int16 v62 = 2080;
    uint64_t v63 = v31;
    __int16 v64 = 2080;
    uint64_t v65 = v32;
    __int16 v66 = 2080;
    uint64_t v67 = [v34 UTF8String];
    _os_log_impl(&dword_25E378000, v27, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (_loadAssets) loading asset: %s, %s, %s, %s", buf, 0x2Au);
  }
  id v35 = *(void **)(*(void *)(a1 + 32) + 24);
  unint64_t v36 = [v3 localeIdentifier];
  v37 = [v35 objectForKeyedSubscript:v36];
  id v38 = [v3 contentType];
  id v39 = [v37 objectForKeyedSubscript:v38];
  [v39 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];

  id v40 = [v3 contentType];
  LODWORD(v36) = [v40 isEqualToString:@"Safety"];

  if (v36)
  {
    uint64_t v41 = SRLogCategorySafety();
    uint64_t v42 = v41;
    unint64_t v43 = sSafetyLoadAssetSignpostID;
    os_signpost_id_t v44 = ++sSafetyLoadAssetSignpostID;
    if (v43 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v41)) {
      goto LABEL_26;
    }
    id v45 = [v3 localeIdentifier];
    uint64_t v46 = [v45 UTF8String];
    *(_DWORD *)uint8_t buf = 136315138;
    uint64_t v61 = v46;
    _os_signpost_emit_with_name_impl(&dword_25E378000, v42, OS_SIGNPOST_EVENT, v44, "SRSafetyLoad", "loc:%s", buf, 0xCu);
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  uint64_t v47 = [v3 contentType];
  int v48 = [v47 isEqualToString:@"Defaults"];

  if (v48)
  {
    uint64_t v42 = [v3 pathWithName:@"locales.plist"];
    if (!v42) {
      goto LABEL_26;
    }
    id v49 = [MEMORY[0x263F08850] defaultManager];
    int v50 = [v49 fileExistsAtPath:v42];

    if (!v50 || !*(void *)(*(void *)(a1 + 32) + 56)) {
      goto LABEL_26;
    }
    id v51 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v52 = [NSURL fileURLWithPath:v42];
    id v53 = [NSURL fileURLWithPath:*(void *)(*(void *)(a1 + 32) + 56)];
    id v59 = 0;
    int v54 = [v51 copyItemAtURL:v52 toURL:v53 error:&v59];
    id v45 = v59;

    char v55 = SRLogCategoryGeneral();
    uint64_t v56 = v55;
    if (v54)
    {
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        uint64_t v57 = *(void *)(*(void *)(a1 + 32) + 56);
        *(_DWORD *)uint8_t buf = 138412546;
        uint64_t v61 = (uint64_t)v42;
        __int16 v62 = 2112;
        uint64_t v63 = v57;
        _os_log_impl(&dword_25E378000, v56, OS_LOG_TYPE_INFO, "Copy supported locales from %@ to %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      uint64_t v58 = *(void *)(*(void *)(a1 + 32) + 56);
      *(_DWORD *)uint8_t buf = 138412802;
      uint64_t v61 = (uint64_t)v42;
      __int16 v62 = 2112;
      uint64_t v63 = v58;
      __int16 v64 = 2112;
      uint64_t v65 = (uint64_t)v45;
      _os_log_error_impl(&dword_25E378000, v56, OS_LOG_TYPE_ERROR, "Supported locales copy from %@ to %@ failed with %@", buf, 0x20u);
    }

    goto LABEL_25;
  }
LABEL_27:
}

- (void)_unloadAssetsForLocale:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SRDefaultsManager *)self defaultsQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = languageCodeForLocale(v4);
  if (([v6 isEqualToString:@"root"] & 1) == 0)
  {
    id v7 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 localeIdentifier];
      int v18 = 136315138;
      uint64_t v19 = [v8 UTF8String];
      _os_log_impl(&dword_25E378000, v7, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (_unloadAssetsForLocale) unloading assets for locale: %s", (uint8_t *)&v18, 0xCu);
    }
    uint64_t v9 = [(NSMutableDictionary *)self->_assets objectForKeyedSubscript:v6];
    if (v9)
    {
      id v10 = (void *)v9;
      id v11 = [(NSMutableDictionary *)self->_assets objectForKeyedSubscript:v6];
      char v12 = [v11 objectForKeyedSubscript:@"Safety"];

      if (v12)
      {
        id v13 = SRLogCategorySafety();
        BOOL v14 = v13;
        unint64_t v15 = sSafetyUnloadAssetSignpostID;
        os_signpost_id_t v16 = ++sSafetyUnloadAssetSignpostID;
        if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
        {
          uint64_t v17 = [v6 UTF8String];
          int v18 = 136315138;
          uint64_t v19 = v17;
          _os_signpost_emit_with_name_impl(&dword_25E378000, v14, OS_SIGNPOST_EVENT, v16, "SRSafetyUnload", "loc:%s", (uint8_t *)&v18, 0xCu);
        }
      }
    }
    [(NSMutableDictionary *)self->_assets removeObjectForKey:v6];
  }
}

- (id)currentNamespaces
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  id v3 = [(SRDefaultsManager *)self defaultsQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__SRDefaultsManager_currentNamespaces__block_invoke;
  v6[3] = &unk_265523470;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __38__SRDefaultsManager_currentNamespaces__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 16) namespaceDescription];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)currentNamespaceDescription
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v3 = [(SRDefaultsManager *)self defaultsQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__SRDefaultsManager_currentNamespaceDescription__block_invoke;
  v6[3] = &unk_265523498;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __48__SRDefaultsManager_currentNamespaceDescription__block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 16) namespaceTypes];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v2;
        uint64_t v3 = *(void **)(*((void *)&v29 + 1) + 8 * v2);
        id v4 = [v3 namespaceId];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v5 = [v3 parameterNames];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v26 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
              uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v4];
              if (v11)
              {
                id v12 = (void *)v11;
                id v13 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v4];
                BOOL v14 = [v13 objectForKeyedSubscript:v10];

                if (v14)
                {
                  unint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v4];
                  os_signpost_id_t v16 = [v15 objectForKeyedSubscript:v10];

                  uint64_t v17 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v4];

                  if (!v17)
                  {
                    int v18 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
                    uint64_t v19 = [MEMORY[0x263EFF980] array];
                    [v18 setObject:v19 forKey:v4];
                  }
                  uint64_t v20 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v4];
                  [v20 addObject:v16];
                }
              }
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v7);
        }

        uint64_t v2 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v23);
  }
}

- (id)currentNamespacesForClient:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  unint64_t v15 = __Block_byref_object_copy_;
  os_signpost_id_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id v17 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v5 = [(SRDefaultsManager *)self defaultsQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SRDefaultsManager_currentNamespacesForClient___block_invoke;
  block[3] = &unk_2655234C0;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __48__SRDefaultsManager_currentNamespacesForClient___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1[4] + 16) namespaceTypesForClient:a1[5]];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*(void *)(a1[6] + 8) + 40);
        uint64_t v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) namespaceId];
        [v7 addObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (id)fetchedLocales
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy_;
  long long v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v3 = [(SRDefaultsManager *)self defaultsQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__SRDefaultsManager_fetchedLocales__block_invoke;
  v6[3] = &unk_265523470;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __35__SRDefaultsManager_fetchedLocales__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) mutableCopy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(unsigned char *)(*(void *)(a1 + 32) + 48))
  {
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v6 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"root"];
    [v5 addObject:v6];
  }
}

- (void)addFetchForLocale:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SRDefaultsManager *)self defaultsQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__SRDefaultsManager_addFetchForLocale___block_invoke;
  v7[3] = &unk_265523310;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __39__SRDefaultsManager_addFetchForLocale___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) localeIdentifier];
    int v7 = 136315138;
    uint64_t v8 = [v3 UTF8String];
    _os_log_impl(&dword_25E378000, v2, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (addFetchForLocale) asset fetch for locale: %s", (uint8_t *)&v7, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) localeIdentifier];
  int v5 = [v4 isEqualToString:@"root"];

  uint64_t v6 = *(void *)(a1 + 40);
  if (v5) {
    *(unsigned char *)(v6 + 48) = 1;
  }
  else {
    [*(id *)(v6 + 40) addObject:*(void *)(a1 + 32)];
  }
}

- (void)removeFetchForLocale:(id)a3
{
  id v4 = a3;
  int v5 = [(SRDefaultsManager *)self defaultsQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__SRDefaultsManager_removeFetchForLocale___block_invoke;
  v7[3] = &unk_265523310;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __42__SRDefaultsManager_removeFetchForLocale___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) localeIdentifier];
    int v7 = 136315138;
    uint64_t v8 = [v3 UTF8String];
    _os_log_impl(&dword_25E378000, v2, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (removeFetchForLocale) remove asset fetch for locale: %s", (uint8_t *)&v7, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) localeIdentifier];
  int v5 = [v4 isEqualToString:@"root"];

  uint64_t v6 = *(void *)(a1 + 40);
  if (v5) {
    *(unsigned char *)(v6 + 48) = 0;
  }
  else {
    [*(id *)(v6 + 40) removeObject:*(void *)(a1 + 32)];
  }
}

- (void)removeFetchForLanguage:(id)a3
{
  id v4 = a3;
  int v5 = [(SRDefaultsManager *)self defaultsQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__SRDefaultsManager_removeFetchForLanguage___block_invoke;
  v7[3] = &unk_265523310;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __44__SRDefaultsManager_removeFetchForLanguage___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) UTF8String];
    *(_DWORD *)uint8_t buf = 136315138;
    uint64_t v20 = v3;
    _os_log_impl(&dword_25E378000, v2, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (removeFetchForLanguage) remove asset fetch for language: %s", buf, 0xCu);
  }

  int v4 = [*(id *)(a1 + 32) isEqualToString:@"root"];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v4)
  {
    *(unsigned char *)(v5 + 48) = 0;
  }
  else
  {
    id v6 = (void *)[*(id *)(v5 + 40) copy];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v13 = languageCodeForLocale(v12);
          if (objc_msgSend(v13, "isEqualToString:", *(void *)(a1 + 32), (void)v14)) {
            [*(id *)(*(void *)(a1 + 40) + 40) removeObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
}

- (void)requestAssetsForLanguages:(id)a3 resourcePath:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__SRDefaultsManager_requestAssetsForLanguages_resourcePath___block_invoke;
  block[3] = &unk_265523310;
  void block[4] = self;
  id v7 = v6;
  id v19 = v7;
  uint64_t v8 = requestAssetsForLanguages_resourcePath__onceToken;
  id v9 = a3;
  if (v8 != -1) {
    dispatch_once(&requestAssetsForLanguages_resourcePath__onceToken, block);
  }
  uint64_t v10 = [(SRDefaultsManager *)self defaultsQueue];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  long long v14 = __60__SRDefaultsManager_requestAssetsForLanguages_resourcePath___block_invoke_146;
  long long v15 = &unk_265523310;
  long long v16 = self;
  id v17 = v7;
  id v11 = v7;
  dispatch_async(v10, &v12);

  -[SRDefaultsManager requestAssetsForLanguages:](self, "requestAssetsForLanguages:", v9, v12, v13, v14, v15, v16);
}

void __60__SRDefaultsManager_requestAssetsForLanguages_resourcePath___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x2611D4A00]();
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy_;
  void v7[4] = __Block_byref_object_dispose_;
  id v8 = 0;
  id v8 = [*(id *)(a1 + 32) currentAssetTypes];
  uint64_t v3 = [*(id *)(a1 + 32) ddsQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__SRDefaultsManager_requestAssetsForLanguages_resourcePath___block_invoke_2;
  v4[3] = &unk_265523470;
  id v6 = v7;
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, v4);

  _Block_object_dispose(v7, 8);
}

uint64_t __60__SRDefaultsManager_requestAssetsForLanguages_resourcePath___block_invoke_2(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v1 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v60 != v3) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        id v6 = [v5 assetType];
        int v7 = [v6 isEqualToString:@"com.apple.MobileAsset.SpotlightResources"];

        if (v7)
        {
          id v8 = [NSURL fileURLWithPath:*(void *)(a1 + 32) isDirectory:1];
          id v9 = objc_alloc(MEMORY[0x263F39400]);
          uint64_t v10 = [v5 assetType];
          id v11 = (void *)[v9 initWithXPCServiceName:v10 assertionStorageDirectoryURL:v8];

          uint64_t v12 = [MEMORY[0x263F393F8] sharedInstanceWithConfiguration:v11];
          uint64_t v13 = (void *)sAssetServer;
          sAssetServer = v12;

          long long v14 = SRLogCategoryGeneral();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = [v5 assetType];
            uint64_t v16 = [v15 UTF8String];
            uint64_t v17 = [v5 compatibilityVersion];
            *(_DWORD *)uint8_t buf = 136315394;
            uint64_t v66 = v16;
            __int16 v67 = 2048;
            uint64_t v68 = v17;
            _os_log_impl(&dword_25E378000, v14, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (AssetServerInit) configure asset type: %s (%lu)", buf, 0x16u);
          }
          int v18 = (void *)sAssetServer;
          uint64_t v19 = [v5 compatibilityVersion];
          uint64_t v20 = [v5 assetType];
          [v18 setCompatabilityVersion:v19 forAssetType:v20];

          uint64_t v21 = [MEMORY[0x263F393D8] sharedInstance];
          uint64_t v22 = [v5 xpcName];
          uint64_t v23 = [v5 assetType];
          [v21 setXPCServiceName:v22 forAssetType:v23];
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
    }
    while (v2);
  }

  int64_t v24 = +[SRDefaultsManager version];
  if (v24 != 2)
  {
    int64_t v25 = v24;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v45 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v47 = [v45 countByEnumeratingWithState:&v55 objects:v64 count:16];
    if (v47)
    {
      uint64_t v46 = *(void *)v56;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v56 != v46) {
            objc_enumerationMutation(v45);
          }
          long long v27 = *(void **)(*((void *)&v55 + 1) + 8 * v26);
          long long v28 = [MEMORY[0x263F393D8] sharedInstance];
          long long v29 = [v27 assetType];
          long long v30 = [v28 assertionIDsForClientID:@"SpotlightResources" assetType:v29];
          long long v31 = v30;
          uint64_t v49 = v26;
          if (v30)
          {
            id v32 = v30;
          }
          else
          {
            id v32 = [MEMORY[0x263EFFA08] set];
          }
          uint64_t v33 = v32;

          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v34 = v33;
          uint64_t v35 = [v34 countByEnumeratingWithState:&v51 objects:v63 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v52;
            do
            {
              for (uint64_t j = 0; j != v36; ++j)
              {
                if (*(void *)v52 != v37) {
                  objc_enumerationMutation(v34);
                }
                id v39 = *(void **)(*((void *)&v51 + 1) + 8 * j);
                id v40 = SRLogCategoryGeneral();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v41 = [v39 UTF8String];
                  *(_DWORD *)uint8_t buf = 134218242;
                  uint64_t v66 = v25;
                  __int16 v67 = 2080;
                  uint64_t v68 = v41;
                  _os_log_impl(&dword_25E378000, v40, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (removeAssertionWithIdentifier) (%ld) removing assertion: %s", buf, 0x16u);
                }

                uint64_t v42 = [MEMORY[0x263F393D8] sharedInstance];
                unint64_t v43 = [v27 assetType];
                [v42 removeAssertionWithIdentifier:v39 assetType:v43];
              }
              uint64_t v36 = [v34 countByEnumeratingWithState:&v51 objects:v63 count:16];
            }
            while (v36);
          }

          uint64_t v26 = v49 + 1;
        }
        while (v49 + 1 != v47);
        uint64_t v47 = [v45 countByEnumeratingWithState:&v55 objects:v64 count:16];
      }
      while (v47);
    }
  }
  return +[SRDefaultsManager setVersionWithValue:2];
}

uint64_t __60__SRDefaultsManager_requestAssetsForLanguages_resourcePath___block_invoke_146(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadSupportedLocalesFromFile:*(void *)(a1 + 40)];
}

- (id)assetConfig
{
  return self->_assetConfig;
}

- (void)requestAssetsForLanguages:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x2611D4A00]();
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy_;
  v13[4] = __Block_byref_object_dispose_;
  id v14 = 0;
  id v14 = [(SRDefaultsManager *)self currentAssetTypes];
  locatiouint64_t n = 0;
  objc_initWeak(&location, self);
  id v6 = [(SRDefaultsManager *)self ddsQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__SRDefaultsManager_requestAssetsForLanguages___block_invoke;
  v8[3] = &unk_265523560;
  objc_copyWeak(&v11, &location);
  uint64_t v10 = v13;
  id v7 = v4;
  id v9 = v7;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  _Block_object_dispose(v13, 8);
}

void __47__SRDefaultsManager_requestAssetsForLanguages___block_invoke(uint64_t a1)
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  long long v60 = [WeakRetained assetConfig];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__SRDefaultsManager_requestAssetsForLanguages___block_invoke_2;
  block[3] = &unk_265523510;
  uint64_t v54 = a1;
  void block[4] = *(void *)(a1 + 40);
  int v48 = WeakRetained;
  if (sAssetServer_block_invoke_onceToken != -1) {
    dispatch_once(&sAssetServer_block_invoke_onceToken, block);
  }
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  obuint64_t j = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v51 = [obj countByEnumeratingWithState:&v80 objects:v90 count:16];
  if (v51)
  {
    unint64_t v3 = 0x263F39000uLL;
    uint64_t v50 = *(void *)v81;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v81 != v50) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v80 + 1) + 8 * v4);
        id v6 = [*(id *)(v3 + 984) sharedInstance];
        id v7 = [v5 assetType];
        id v8 = [v6 assertionIDsForClientID:@"SpotlightResources" assetType:v7];
        id v9 = v8;
        uint64_t v53 = v4;
        if (v8)
        {
          id v10 = v8;
        }
        else
        {
          id v10 = [MEMORY[0x263EFFA08] set];
        }
        id v11 = v10;

        long long v52 = v11;
        uint64_t v65 = (void *)[v11 mutableCopy];
        uint64_t v12 = [v5 assetType];
        int v62 = [v12 isEqualToString:@"com.apple.MobileAsset.SpotlightResources"];

        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        uint64_t v13 = [v5 deliveryTypes];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v76 objects:v89 count:16];
        long long v59 = v5;
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v77;
          uint64_t v55 = *(void *)v77;
          long long v56 = v13;
          do
          {
            uint64_t v17 = 0;
            uint64_t v57 = v15;
            do
            {
              if (*(void *)v77 != v16) {
                objc_enumerationMutation(v13);
              }
              int v18 = *(void **)(*((void *)&v76 + 1) + 8 * v17);
              if (([v18 isEqualToString:@"Required"] & 1) == 0
                && ([v18 hasSuffix:@"Test"] & 1) == 0)
              {
                uint64_t v58 = v17;
                long long v74 = 0u;
                long long v75 = 0u;
                long long v72 = 0u;
                long long v73 = 0u;
                id v61 = *(id *)(v54 + 32);
                uint64_t v64 = [v61 countByEnumeratingWithState:&v72 objects:v88 count:16];
                if (!v64) {
                  goto LABEL_37;
                }
                uint64_t v63 = *(void *)v73;
                while (1)
                {
                  for (uint64_t i = 0; i != v64; ++i)
                  {
                    if (*(void *)v73 != v63) {
                      objc_enumerationMutation(v61);
                    }
                    uint64_t v20 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:*(void *)(*((void *)&v72 + 1) + 8 * i)];
                    uint64_t v21 = languageCodeForLocale(v20);
                    if (v62)
                    {
                      if (([v60 isValidLocale:v21 deliveryType:v18] & 1) == 0) {
                        goto LABEL_35;
                      }
                      uint64_t v22 = NSString;
                      uint64_t v23 = [v5 assetType];
                      [v22 stringWithFormat:@"SpotlightResources:%@:%@:%@", v23, v18, v21, v48];
                    }
                    else
                    {
                      int64_t v24 = NSString;
                      uint64_t v23 = [v5 assetType];
                      [v24 stringWithFormat:@"SpotlightResources:%@:%@", v23, v21, v47, v48];
                    int64_t v25 = };

                    uint64_t v26 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v21];
                    long long v27 = [v5 assetType];
                    long long v28 = assetQueryForLocale(v26, v27, v18);

                    [v28 setLocalOnly:0];
                    [v28 setInstalledOnly:0];
                    [v28 setCachedOnly:0];
                    if ([v65 containsObject:v25])
                    {
                      long long v29 = SRLogCategoryGeneral();
                      unint64_t v3 = 0x263F39000;
                      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                      {
                        uint64_t v30 = [v25 UTF8String];
                        *(_DWORD *)uint8_t buf = 136315138;
                        uint64_t v87 = v30;
                        _os_log_impl(&dword_25E378000, v29, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (addAssertionWithIdentifier) keeping assertion: %s", buf, 0xCu);
                      }

                      [v65 removeObject:v25];
                    }
                    else
                    {
                      id v31 = objc_alloc_init(MEMORY[0x263F393E0]);
                      id v32 = SRLogCategoryGeneral();
                      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                      {
                        uint64_t v33 = [v25 UTF8String];
                        *(_DWORD *)uint8_t buf = 136315138;
                        uint64_t v87 = v33;
                        _os_log_impl(&dword_25E378000, v32, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (addAssertionWithIdentifier) adding assertion: %s", buf, 0xCu);
                      }

                      id v34 = [MEMORY[0x263F393D8] sharedInstance];
                      [v34 addAssertionForAssetsWithQuery:v28 policy:v31 assertionID:v25 clientID:@"SpotlightResources"];

                      unint64_t v3 = 0x263F39000uLL;
                      id v5 = v59;
                    }
                    uint64_t v35 = [*(id *)(v3 + 984) sharedInstance];
                    v70[0] = MEMORY[0x263EF8330];
                    v70[1] = 3221225472;
                    v70[2] = __47__SRDefaultsManager_requestAssetsForLanguages___block_invoke_157;
                    v70[3] = &unk_265523538;
                    id v71 = v25;
                    id v36 = v25;
                    [v35 updateAssetForQuery:v28 callback:v70];

LABEL_35:
                  }
                  uint64_t v64 = [v61 countByEnumeratingWithState:&v72 objects:v88 count:16];
                  if (!v64)
                  {
LABEL_37:

                    uint64_t v16 = v55;
                    uint64_t v13 = v56;
                    uint64_t v15 = v57;
                    uint64_t v17 = v58;
                    break;
                  }
                }
              }
              ++v17;
            }
            while (v17 != v15);
            uint64_t v15 = [v13 countByEnumeratingWithState:&v76 objects:v89 count:16];
          }
          while (v15);
        }

        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v37 = v65;
        uint64_t v38 = [v37 countByEnumeratingWithState:&v66 objects:v85 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v67;
          do
          {
            for (uint64_t j = 0; j != v39; ++j)
            {
              if (*(void *)v67 != v40) {
                objc_enumerationMutation(v37);
              }
              uint64_t v42 = *(void **)(*((void *)&v66 + 1) + 8 * j);
              unint64_t v43 = SRLogCategoryGeneral();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v44 = [v42 UTF8String];
                *(_DWORD *)uint8_t buf = 136315138;
                uint64_t v87 = v44;
                _os_log_impl(&dword_25E378000, v43, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (removeAssertionWithIdentifier) removing assertion: %s", buf, 0xCu);
              }

              id v45 = [*(id *)(v3 + 984) sharedInstance];
              uint64_t v46 = [v59 assetType];
              [v45 removeAssertionWithIdentifier:v42 assetType:v46];
            }
            uint64_t v39 = [v37 countByEnumeratingWithState:&v66 objects:v85 count:16];
          }
          while (v39);
        }

        uint64_t v4 = v53 + 1;
      }
      while (v53 + 1 != v51);
      uint64_t v51 = [obj countByEnumeratingWithState:&v80 objects:v90 count:16];
    }
    while (v51);
  }
}

void __47__SRDefaultsManager_requestAssetsForLanguages___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "assetType", (void)v10);
        [v2 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  id v9 = [MEMORY[0x263F393D8] sharedInstance];
  [v9 setAssetTypesForDelegates:v2];
}

void __47__SRDefaultsManager_requestAssetsForLanguages___block_invoke_157(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = SRLogCategoryGeneral();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_25E378000, v7, OS_LOG_TYPE_DEFAULT, "(updateAssetForQuery) updated assets for %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __47__SRDefaultsManager_requestAssetsForLanguages___block_invoke_157_cold_1(a1, (uint64_t)v5, v7);
  }
}

void __50__SRDefaultsManager_loadDefaultsForLocale_reload___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x2611D4A00]();
  id v3 = [*(id *)(a1 + 32) ddsQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SRDefaultsManager_loadDefaultsForLocale_reload___block_invoke_2;
  block[3] = &unk_265523510;
  void block[4] = *(void *)(a1 + 40);
  dispatch_async(v3, block);
}

void __50__SRDefaultsManager_loadDefaultsForLocale_reload___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v1 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v7 = SRLogCategoryGeneral();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = [v6 assetType];
          uint64_t v9 = [v8 UTF8String];
          uint64_t v10 = [v6 compatibilityVersion];
          *(_DWORD *)uint8_t buf = 136315394;
          uint64_t v19 = v9;
          __int16 v20 = 2048;
          uint64_t v21 = v10;
          _os_log_impl(&dword_25E378000, v7, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] (AssetServerInit) configure asset type: %s (%lu)", buf, 0x16u);
        }
        uint64_t v11 = [MEMORY[0x263F393D8] sharedInstance];
        uint64_t v12 = [v6 compatibilityVersion];
        long long v13 = [v6 assetType];
        [v11 setCompatabilityVersion:v12 forAssetType:v13];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v3);
  }
}

uint64_t __50__SRDefaultsManager_loadDefaultsForLocale_reload___block_invoke_162(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadAssets:*(void *)(a1 + 40) deliveryType:@"Required" shouldUpdate:1];
}

uint64_t __50__SRDefaultsManager_loadDefaultsForLocale_reload___block_invoke_166(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadAssets:*(void *)(a1 + 40) deliveryType:*(void *)(a1 + 48) shouldUpdate:1];
}

uint64_t __50__SRDefaultsManager_loadDefaultsForLocale_reload___block_invoke_171(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadAssets:*(void *)(a1 + 40) deliveryType:*(void *)(a1 + 48) shouldUpdate:1];
}

void __50__SRDefaultsManager_loadDefaultsForLocale_reload___block_invoke_2_172(uint64_t a1)
{
  uint64_t v136 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v92 = [WeakRetained assetConfig];
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  obuint64_t j = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v90 = [obj countByEnumeratingWithState:&v120 objects:v135 count:16];
  if (v90)
  {
    uint64_t v89 = *(void *)v121;
    uint64_t v100 = a1;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v121 != v89)
        {
          uint64_t v3 = v2;
          objc_enumerationMutation(obj);
          uint64_t v2 = v3;
        }
        uint64_t v91 = v2;
        uint64_t v4 = *(void **)(*((void *)&v120 + 1) + 8 * v2);
        id v5 = [v4 assetType];
        int v93 = [v5 isEqualToString:@"com.apple.MobileAsset.SpotlightResources"];

        long long v118 = 0u;
        long long v119 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        id v97 = [v4 deliveryTypes];
        uint64_t v99 = [v97 countByEnumeratingWithState:&v116 objects:v134 count:16];
        if (v99)
        {
          uint64_t v98 = *(void *)v117;
          uint64_t v102 = v4;
          do
          {
            uint64_t v6 = 0;
            do
            {
              if (*(void *)v117 != v98)
              {
                uint64_t v7 = v6;
                objc_enumerationMutation(v97);
                uint64_t v6 = v7;
              }
              uint64_t v101 = v6;
              id v8 = *(void **)(*((void *)&v116 + 1) + 8 * v6);
              uint64_t v9 = SRLogCategoryGeneral();
              if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
              {
                [v4 assetType];
                long long v80 = v79 = v8;
                *(_DWORD *)uint8_t buf = 138412546;
                uint64_t v127 = (uint64_t)v80;
                __int16 v128 = 2112;
                uint64_t v129 = (uint64_t)v79;
                _os_log_debug_impl(&dword_25E378000, v9, OS_LOG_TYPE_DEBUG, "(forceLoad=off) type %@, deliveryType %@", buf, 0x16u);

                id v8 = v79;
              }

              if (([v8 isEqualToString:@"Required"] & 1) == 0
                && ([v8 hasSuffix:@"Test"] & 1) == 0
                && (!v93 || [v92 isValidLocale:*(void *)(v100 + 32) deliveryType:v8]))
              {
                uint64_t v10 = *(void **)(v100 + 40);
                uint64_t v11 = [v4 assetType];
                uint64_t v12 = v8;
                long long v13 = v11;
                id v104 = v12;
                long long v14 = assetQueryForLocale(v10, v11, v12);

                [v14 setLocalOnly:0];
                [v14 setInstalledOnly:0];
                [v14 setCachedOnly:0];
                long long v15 = [MEMORY[0x263F393D8] sharedInstance];
                id v115 = 0;
                id v95 = v14;
                long long v16 = [v15 allContentItemsMatchingQuery:v14 error:&v115];
                id v17 = v115;

                v96 = v17;
                if (v17)
                {
                  long long v94 = v16;
                  v105 = SRLogCategoryGeneral();
                  if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
                  {
                    id v81 = [*(id *)(v100 + 40) localeIdentifier];
                    uint64_t v82 = [v81 UTF8String];
                    id v83 = [v4 assetType];
                    uint64_t v84 = [v83 UTF8String];
                    uint64_t v85 = [v104 UTF8String];
                    *(_DWORD *)uint8_t buf = 136315906;
                    uint64_t v127 = v82;
                    __int16 v128 = 2080;
                    uint64_t v129 = v84;
                    __int16 v130 = 2080;
                    uint64_t v131 = v85;
                    __int16 v132 = 2112;
                    id v133 = v17;
                    _os_log_error_impl(&dword_25E378000, v105, OS_LOG_TYPE_ERROR, "Error fetching assets for query (%s, %s, %s): %@", buf, 0x2Au);
                  }
LABEL_20:

                  long long v16 = v94;
                  goto LABEL_21;
                }
                if (!v16)
                {
LABEL_21:

                  goto LABEL_22;
                }
                long long v113 = 0u;
                long long v114 = 0u;
                long long v111 = 0u;
                long long v112 = 0u;
                long long v94 = v16;
                v105 = v16;
                uint64_t v106 = [v105 countByEnumeratingWithState:&v111 objects:v125 count:16];
                if (!v106) {
                  goto LABEL_20;
                }
                uint64_t v18 = *(void *)v112;
                uint64_t v103 = *(void *)v112;
                while (2)
                {
                  uint64_t v19 = 0;
LABEL_28:
                  if (*(void *)v112 != v18) {
                    objc_enumerationMutation(v105);
                  }
                  __int16 v20 = *(void **)(*((void *)&v111 + 1) + 8 * v19);
                  uint64_t v21 = [v20 type];
                  if (v21)
                  {
                    uint64_t v22 = (void *)v21;
                    uint64_t v23 = [v4 deliveryTypeMap];
                    int64_t v24 = [v20 type];
                    int64_t v25 = [v23 objectForKeyedSubscript:v24];
                    if (v25)
                    {
                      uint64_t v26 = [v4 deliveryTypeMap];
                      long long v27 = [v20 type];
                      long long v28 = [v26 objectForKeyedSubscript:v27];
                      char v29 = [v28 containsObject:v104];

                      uint64_t v4 = v102;
                      uint64_t v18 = v103;

                      if (v29)
                      {
                        uint64_t v30 = [v20 locale];
                        if (v30)
                        {
                          id v31 = (void *)v30;
                          uint64_t v32 = [v20 path];
                          if (v32)
                          {
                            uint64_t v33 = (void *)v32;
                            id v34 = [v20 fileName];

                            if (v34)
                            {
                              uint64_t v35 = [v20 type];
                              int v36 = [v35 isEqualToString:@"Safety"];

                              if (v36)
                              {
                                id v37 = [v20 locale];
                                uint64_t v38 = [v20 parentAsset];
                                uint64_t v39 = [v38 contentVersion];

                                sLastLoadedContentVersiouint64_t n = v39;
                                uint64_t v40 = SRLogCategorySafety();
                                uint64_t v41 = v40;
                                unint64_t v42 = sSafetyDDSLoadSignpostID;
                                os_signpost_id_t v43 = ++sSafetyDDSLoadSignpostID;
                                if (v42 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
                                {
                                  uint64_t v44 = [v37 UTF8String];
                                  *(_DWORD *)uint8_t buf = 136315394;
                                  uint64_t v127 = v44;
                                  __int16 v128 = 2048;
                                  uint64_t v129 = v39;
                                  _os_signpost_emit_with_name_impl(&dword_25E378000, v41, OS_SIGNPOST_EVENT, v43, "SRSafetyDDSLoad", "loc:%s, v:%lu", buf, 0x16u);
                                }
                              }
                              buf[0] = 0;
                              id v45 = [MEMORY[0x263F08850] defaultManager];
                              uint64_t v46 = [v20 path];
                              uint64_t v47 = [v46 path];
                              int v48 = [v45 fileExistsAtPath:v47 isDirectory:buf];

                              if (v48)
                              {
                                if (buf[0]
                                  && ([v20 fileName],
                                      uint64_t v49 = objc_claimAutoreleasedReturnValue(),
                                      char v50 = [v49 containsString:@"."],
                                      v49,
                                      (v50 & 1) == 0))
                                {
                                  uint64_t v64 = [MEMORY[0x263F08850] defaultManager];
                                  uint64_t v65 = [v20 path];
                                  long long v66 = [v64 enumeratorAtURL:v65 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:5 errorHandler:0];

                                  id v52 = objc_alloc_init(MEMORY[0x263EFF980]);
                                  long long v107 = 0u;
                                  long long v108 = 0u;
                                  long long v109 = 0u;
                                  long long v110 = 0u;
                                  id v51 = v66;
                                  uint64_t v67 = [v51 countByEnumeratingWithState:&v107 objects:v124 count:16];
                                  if (v67)
                                  {
                                    uint64_t v68 = v67;
                                    uint64_t v69 = *(void *)v108;
                                    do
                                    {
                                      for (uint64_t i = 0; i != v68; ++i)
                                      {
                                        if (*(void *)v108 != v69) {
                                          objc_enumerationMutation(v51);
                                        }
                                        id v71 = [*(id *)(*((void *)&v107 + 1) + 8 * i) lastPathComponent];
                                        [v52 addObject:v71];
                                      }
                                      uint64_t v68 = [v51 countByEnumeratingWithState:&v107 objects:v124 count:16];
                                    }
                                    while (v68);
                                  }

                                  uint64_t v54 = [v20 locale];
                                  uint64_t v55 = [v20 type];
                                  int64_t v72 = +[SRAsset deliveryTypeFromString:v104];
                                  long long v73 = [v20 path];
                                  long long v74 = [v73 path];
                                  long long v56 = +[SRAsset assetWithLocaleIdentifier:v54 contentType:v55 deliveryType:v72 resourceRoot:v74 pathNames:v52];

                                  uint64_t v18 = v103;
                                  uint64_t v4 = v102;
                                }
                                else
                                {
                                  id v51 = [v20 locale];
                                  id v52 = [v20 type];
                                  int64_t v53 = +[SRAsset deliveryTypeFromString:v104];
                                  uint64_t v54 = [v20 path];
                                  uint64_t v55 = [v54 path];
                                  long long v56 = +[SRAsset assetWithLocaleIdentifier:v51 contentType:v52 deliveryType:v53 path:v55];
                                }

                                if (v56)
                                {
                                  long long v75 = [*(id *)(*(void *)(*(void *)(v100 + 56) + 8) + 40) objectForKeyedSubscript:v104];

                                  if (!v75)
                                  {
                                    id v76 = objc_alloc_init(MEMORY[0x263EFF980]);
                                    [*(id *)(*(void *)(*(void *)(v100 + 56) + 8) + 40) setObject:v76 forKeyedSubscript:v104];
                                  }
                                  long long v77 = [*(id *)(*(void *)(*(void *)(v100 + 56) + 8) + 40) objectForKeyedSubscript:v104];
                                  [v77 addObject:v56];
                                }
                              }
LABEL_48:
                              if (++v19 == v106)
                              {
                                uint64_t v78 = [v105 countByEnumeratingWithState:&v111 objects:v125 count:16];
                                uint64_t v106 = v78;
                                if (!v78) {
                                  goto LABEL_20;
                                }
                                continue;
                              }
                              goto LABEL_28;
                            }
                          }
                          else
                          {
                          }
                        }
                        uint64_t v57 = SRLogCategoryGeneral();
                        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                        {
                          id v58 = [v20 type];
                          id v61 = [v20 locale];
                          int v62 = [v20 path];
                          uint64_t v63 = [v20 fileName];
                          *(_DWORD *)uint8_t buf = 138413058;
                          uint64_t v127 = (uint64_t)v58;
                          __int16 v128 = 2112;
                          uint64_t v129 = (uint64_t)v61;
                          __int16 v130 = 2112;
                          uint64_t v131 = (uint64_t)v62;
                          __int16 v132 = 2112;
                          id v133 = v63;
                          _os_log_error_impl(&dword_25E378000, v57, OS_LOG_TYPE_ERROR, "Invalid dds asset (%@, %@, %@, %@)", buf, 0x2Au);

LABEL_51:
                        }
                        goto LABEL_47;
                      }
                    }
                    else
                    {
                    }
                  }
                  break;
                }
                uint64_t v57 = SRLogCategoryGeneral();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
                {
                  id v58 = [v20 type];
                  uint64_t v59 = [v58 UTF8String];
                  uint64_t v60 = [v104 UTF8String];
                  *(_DWORD *)uint8_t buf = 136315394;
                  uint64_t v127 = v59;
                  __int16 v128 = 2080;
                  uint64_t v129 = v60;
                  _os_log_debug_impl(&dword_25E378000, v57, OS_LOG_TYPE_DEBUG, "Not fetching asset with type %s for deliveryType %s", buf, 0x16u);
                  goto LABEL_51;
                }
LABEL_47:

                goto LABEL_48;
              }
LABEL_22:
              uint64_t v6 = v101 + 1;
            }
            while (v101 + 1 != v99);
            uint64_t v86 = [v97 countByEnumeratingWithState:&v116 objects:v134 count:16];
            uint64_t v99 = v86;
          }
          while (v86);
        }

        uint64_t v2 = v91 + 1;
      }
      while (v91 + 1 != v90);
      uint64_t v90 = [obj countByEnumeratingWithState:&v120 objects:v135 count:16];
    }
    while (v90);
  }
}

void __50__SRDefaultsManager_loadDefaultsForLocale_reload___block_invoke_173(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v8 = *(void **)(a1 + 32);
        uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v7];
        [v8 _loadAssets:v9 deliveryType:v7 shouldUpdate:0];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SRDefaultsManager_loadDefaultsForLocale_reload___block_invoke_2_174;
  block[3] = &unk_2655235D8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __50__SRDefaultsManager_loadDefaultsForLocale_reload___block_invoke_2_174(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyObservers];
}

- (void)unloadDefaultsForLocale:(id)a3
{
  id v4 = a3;
  uint64_t v5 = languageCodeForLocale(v4);
  [(SRDefaultsManager *)self removeFetchForLanguage:v5];
  uint64_t v6 = [(SRDefaultsManager *)self defaultsQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__SRDefaultsManager_unloadDefaultsForLocale___block_invoke;
  v8[3] = &unk_265523310;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

uint64_t __45__SRDefaultsManager_unloadDefaultsForLocale___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unloadAssetsForLocale:*(void *)(a1 + 40)];
}

- (void)loadFactorsAtPath:(id)a3 namespaceId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SRDefaultsManager loadFactorsAtPath:namespaceId:]();
  }

  id v9 = +[PlistReader plistReaderWithResourcePath:v6];
  uint64_t v10 = v9;
  if (v9)
  {
    long long v11 = [v9 plist];
    long long v12 = v11;
    if (v11 && [v11 count])
    {
      long long v13 = [(SRDefaultsManager *)self defaultsQueue];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __51__SRDefaultsManager_loadFactorsAtPath_namespaceId___block_invoke;
      v14[3] = &unk_265523600;
      id v15 = v6;
      id v16 = v12;
      id v17 = self;
      id v18 = v7;
      dispatch_sync(v13, v14);
    }
  }
}

void __51__SRDefaultsManager_loadFactorsAtPath_namespaceId___block_invoke(uint64_t a1)
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  context = (void *)MEMORY[0x2611D4A00]();
  id v80 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v2 = [NSURL URLWithString:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 URLByDeletingLastPathComponent];

  id v4 = [MEMORY[0x263F08850] defaultManager];
  long long v77 = (void *)v3;
  uint64_t v5 = [v4 enumeratorAtURL:v3 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:4 errorHandler:0];

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v95 objects:v100 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v96;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v96 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        long long v11 = [v10 lastPathComponent];
        if (([v11 hasPrefix:@"assets_"] & 1) == 0
          && ([v11 hasPrefix:@"default_factors_"] & 1) == 0
          && ([v11 hasPrefix:@"factors.mdplist"] & 1) == 0)
        {
          long long v12 = [v10 path];
          [v80 setObject:v12 forKey:v11];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v95 objects:v100 count:16];
    }
    while (v7);
  }

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v87 = *(id *)(a1 + 40);
  uint64_t v13 = [v87 countByEnumeratingWithState:&v91 objects:v99 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = 0;
    uint64_t v90 = *(void *)v92;
    uint64_t v79 = a1;
    while (1)
    {
      uint64_t v16 = 0;
      uint64_t v86 = v14;
      do
      {
        if (*(void *)v92 != v90) {
          objc_enumerationMutation(v87);
        }
        id v17 = *(id *)(*((void *)&v91 + 1) + 8 * v16);

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v15 = v17;
          goto LABEL_120;
        }
        id v18 = v17;
        uint64_t v19 = [*(id *)(a1 + 40) objectForKeyedSubscript:v18];
        uint64_t v20 = [v19 objectForKeyedSubscript:@"Type"];
        if (v20)
        {
          uint64_t v21 = (void *)v20;
          uint64_t v22 = [*(id *)(a1 + 40) objectForKeyedSubscript:v18];
          uint64_t v23 = [v22 objectForKeyedSubscript:@"Type"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int64_t v24 = [*(id *)(a1 + 40) objectForKeyedSubscript:v18];
            int64_t v25 = [v24 objectForKeyedSubscript:@"Type"];
          }
          else
          {
            int64_t v25 = 0;
          }

          id v15 = v18;
          if (!v25) {
            goto LABEL_119;
          }
          uint64_t v26 = [*(id *)(a1 + 40) objectForKeyedSubscript:v18];
          long long v27 = [v26 objectForKeyedSubscript:@"IrisName"];
          if (v27)
          {
            long long v28 = [*(id *)(a1 + 40) objectForKeyedSubscript:v18];
            char v29 = [v28 objectForKeyedSubscript:@"IrisName"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v30 = [*(id *)(a1 + 40) objectForKeyedSubscript:v18];
              uint64_t v89 = [v30 objectForKeyedSubscript:@"IrisName"];
            }
            else
            {
              uint64_t v89 = 0;
            }
          }
          else
          {
            uint64_t v89 = 0;
          }

          id v31 = [*(id *)(a1 + 40) objectForKeyedSubscript:v18];
          uint64_t v32 = [v31 objectForKeyedSubscript:@"Legacy"];
          if (v32)
          {
            uint64_t v33 = [*(id *)(a1 + 40) objectForKeyedSubscript:v18];
            id v34 = [v33 objectForKeyedSubscript:@"Legacy"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v35 = [*(id *)(a1 + 40) objectForKeyedSubscript:v18];
              int v36 = [v35 objectForKeyedSubscript:@"Legacy"];
              int v82 = [v36 BOOLValue];
            }
            else
            {
              int v82 = 0;
            }
          }
          else
          {
            int v82 = 0;
          }

          id v37 = [*(id *)(a1 + 40) objectForKeyedSubscript:v18];
          uint64_t v38 = [v37 objectForKeyedSubscript:@"UserDefault"];
          if (v38)
          {
            uint64_t v39 = [*(id *)(a1 + 40) objectForKeyedSubscript:v18];
            uint64_t v40 = [v39 objectForKeyedSubscript:@"UserDefault"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v41 = [*(id *)(a1 + 40) objectForKeyedSubscript:v18];
              unint64_t v42 = [v41 objectForKeyedSubscript:@"UserDefault"];
              int v85 = [v42 BOOLValue] ^ 1;
            }
            else
            {
              int v85 = 1;
            }
          }
          else
          {
            int v85 = 1;
          }

          os_signpost_id_t v43 = [*(id *)(a1 + 40) objectForKeyedSubscript:v18];
          uint64_t v44 = [v43 objectForKeyedSubscript:@"Current"];
          if (v44)
          {
            id v45 = [*(id *)(a1 + 40) objectForKeyedSubscript:v18];
            uint64_t v46 = [v45 objectForKeyedSubscript:@"Current"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v47 = [*(id *)(a1 + 40) objectForKeyedSubscript:v18];
              int v48 = [v47 objectForKeyedSubscript:@"Current"];
              int v84 = [v48 BOOLValue] ^ 1;
            }
            else
            {
              int v84 = 1;
            }
          }
          else
          {
            int v84 = 1;
          }

          uint64_t v49 = [*(id *)(a1 + 40) objectForKeyedSubscript:v18];
          char v50 = [v49 objectForKeyedSubscript:@"UserDefaultFirst"];
          if (v50)
          {
            id v51 = [*(id *)(a1 + 40) objectForKeyedSubscript:v18];
            id v52 = [v51 objectForKeyedSubscript:@"UserDefaultFirst"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int64_t v53 = [*(id *)(a1 + 40) objectForKeyedSubscript:v18];
              uint64_t v54 = [v53 objectForKeyedSubscript:@"UserDefaultFirst"];
              int v83 = [v54 BOOLValue] ^ 1;

              a1 = v79;
            }
            else
            {
              int v83 = 1;
            }
          }
          else
          {
            int v83 = 1;
          }

          int v55 = [v25 isEqualToString:@"String"];
          if (v55)
          {
            int v56 = 0;
            uint64_t v81 = 0;
            int v57 = 0;
            goto LABEL_65;
          }
          if ([v25 isEqualToString:@"File"])
          {
            uint64_t v81 = 0;
            int v57 = 0;
            int v56 = 1;
            goto LABEL_65;
          }
          if ([v25 isEqualToString:@"Long"])
          {
            int v56 = 0;
            int v57 = 0;
            uint64_t v81 = 1;
            goto LABEL_65;
          }
          if ([v25 isEqualToString:@"Double"])
          {
            int v56 = 0;
            uint64_t v81 = 0;
            int v57 = 1;
            goto LABEL_65;
          }
          int v58 = [v25 isEqualToString:@"Boolean"];
          id v15 = v18;
          uint64_t v59 = (void *)v89;
          if (v58)
          {
            int v56 = 0;
            int v57 = 0;
            uint64_t v81 = 0x100000000;
LABEL_65:
            uint64_t v60 = [*(id *)(a1 + 40) objectForKeyedSubscript:v18];
            id v15 = [v60 objectForKeyedSubscript:@"Value"];

            if (v15)
            {
LABEL_66:
              int v61 = v82;
              goto LABEL_82;
            }
            int v62 = v57;
            uint64_t v63 = [*(id *)(a1 + 40) objectForKeyedSubscript:v18];
            id v15 = [v63 objectForKeyedSubscript:@"Platforms"];

            if (v15)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                int v61 = v82;
                goto LABEL_81;
              }
              uint64_t v64 = [v15 objectForKeyedSubscript:@"ios"];

              if (v64)
              {
                int v61 = 0;
                id v15 = (void *)v64;
LABEL_81:
                int v57 = v62;
LABEL_82:
                BOOL v68 = v61 == 0;
                uint64_t v69 = 2;
                if (v68) {
                  uint64_t v69 = 0;
                }
                if (!v84) {
                  v69 |= 4uLL;
                }
                if (!v85) {
                  v69 |= 8uLL;
                }
                if (v83) {
                  uint64_t v70 = v69;
                }
                else {
                  uint64_t v70 = v69 | 0x10;
                }
                if (v55)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v71 = +[SRParameter parameterWithString:v15 name:v18];
                    goto LABEL_109;
                  }
                }
                if (v56)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    int64_t v72 = [v80 objectForKeyedSubscript:v15];
                    if (v72)
                    {
                      long long v73 = +[SRParameter parameterWithFilePath:v72 name:v18];
                    }
                    else
                    {
                      long long v73 = 0;
                    }

                    goto LABEL_111;
                  }
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  if (HIDWORD(v81))
                  {
                    uint64_t v71 = +[SRParameter parameterWithBoolean:name:](SRParameter, "parameterWithBoolean:name:", [v15 BOOLValue], v18);
LABEL_109:
                    long long v73 = (void *)v71;
                    goto LABEL_111;
                  }
                  if (v81)
                  {
                    uint64_t v71 = +[SRParameter parameterWithLong:name:](SRParameter, "parameterWithLong:name:", [v15 longValue], v18);
                    goto LABEL_109;
                  }
                  if (v57)
                  {
                    [v15 doubleValue];
                    uint64_t v71 = +[SRParameter parameterWithDouble:name:](SRParameter, "parameterWithDouble:name:", v18);
                    goto LABEL_109;
                  }
                }
                long long v73 = 0;
                goto LABEL_111;
              }
            }
            int v65 = v55 | v56 | HIDWORD(v81) | v81;
            long long v66 = (__CFString *)&unk_270B1D6A8;
            if (HIDWORD(v81)) {
              long long v66 = (__CFString *)MEMORY[0x263EFFA80];
            }
            uint64_t v67 = &stru_270B18FF0;
            if (!(v55 | v56)) {
              uint64_t v67 = v66;
            }
            if (v65) {
              id v15 = v67;
            }
            else {
              id v15 = &unk_270B1D6C0;
            }
            if ((v65 | v62) == 1)
            {
              int v57 = v62;
              goto LABEL_66;
            }
            id v15 = 0;
            long long v73 = 0;
            uint64_t v70 = 0;
LABEL_111:
            uint64_t v59 = (void *)v89;
            if (v89)
            {
              [v73 setIrisName:v89];
              uint64_t v59 = (void *)v89;
            }
            if (v73)
            {
              [v73 setFlag:v70];
              [*(id *)(*(void *)(a1 + 48) + 16) setParameterName:v18 namespaceId:*(void *)(a1 + 56)];
              long long v74 = [*(id *)(*(void *)(a1 + 48) + 32) objectForKeyedSubscript:*(void *)(a1 + 56)];

              if (!v74)
              {
                id v75 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                [*(id *)(*(void *)(a1 + 48) + 32) setObject:v75 forKeyedSubscript:*(void *)(a1 + 56)];
              }
              id v76 = [*(id *)(*(void *)(a1 + 48) + 32) objectForKeyedSubscript:*(void *)(a1 + 56)];
              [v76 setObject:v73 forKeyedSubscript:v18];

              uint64_t v59 = (void *)v89;
            }
          }

          goto LABEL_118;
        }
        int64_t v25 = v19;
        id v15 = v18;
LABEL_118:

LABEL_119:
        uint64_t v14 = v86;
LABEL_120:
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v87 countByEnumeratingWithState:&v91 objects:v99 count:16];
      if (!v14)
      {

        break;
      }
    }
  }
}

- (id)parametersOfNamespaceWithName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v5 = [(SRDefaultsManager *)self defaultsQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SRDefaultsManager_parametersOfNamespaceWithName___block_invoke;
  block[3] = &unk_2655234C0;
  void block[4] = self;
  id v10 = v4;
  long long v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __51__SRDefaultsManager_parametersOfNamespaceWithName___block_invoke(void *a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = objc_msgSend(*(id *)(a1[4] + 16), "namespaceTypes", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v8 = [v7 parameterNames];
        int v9 = [v8 containsObject:a1[5]];

        if (v9)
        {
          id v10 = [v7 namespaceId];
          uint64_t v11 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:v10];
          if (v11)
          {
            uint64_t v12 = (void *)v11;
            uint64_t v13 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:v10];
            uint64_t v14 = [v13 objectForKeyedSubscript:a1[5]];

            if (v14)
            {
              id v15 = *(void **)(*(void *)(a1[6] + 8) + 40);
              if (!v15)
              {
                id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                uint64_t v17 = *(void *)(a1[6] + 8);
                id v18 = *(void **)(v17 + 40);
                *(void *)(v17 + 40) = v16;

                id v15 = *(void **)(*(void *)(a1[6] + 8) + 40);
              }
              uint64_t v19 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:v10];
              uint64_t v20 = [v19 objectForKeyedSubscript:a1[5]];
              [v15 setObject:v20 forKey:v10];
            }
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v4);
  }
}

- (void)notifyObservers
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  uint64_t v3 = [(SRDefaultsManager *)self delegatesQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__SRDefaultsManager_notifyObservers__block_invoke;
  block[3] = &unk_265523470;
  void block[4] = self;
  void block[5] = &v13;
  dispatch_sync(v3, block);

  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = (id)v14[5];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "didUpdateDefaults", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v13, 8);
}

uint64_t __36__SRDefaultsManager_notifyObservers__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 64) copy];
  return MEMORY[0x270F9A758]();
}

- (void)didUpdateAssetsWithType:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint8_t buf = 136315138;
    uint64_t v17 = [v4 UTF8String];
    _os_log_impl(&dword_25E378000, v5, OS_LOG_TYPE_DEFAULT, "[SR_INFO][DefaultsManager] did update assets with type %s", buf, 0xCu);
  }

  uint64_t v6 = [(SRDefaultsManager *)self fetchedLocales];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(SRDefaultsManager *)self loadDefaultsForLocale:*(void *)(*((void *)&v11 + 1) + 8 * v10++) reload:1];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
  [(SRDefaultsManager *)self notifyObservers];
}

- (void)updateParameter:(id)a3 inNamespace:(id)a4 withValue:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  parameters = self->_parameters;
  if (parameters)
  {
    long long v12 = [(NSMutableDictionary *)parameters objectForKeyedSubscript:v9];

    if (v12)
    {
      long long v13 = [v10 copy];
      long long v14 = [(NSMutableDictionary *)self->_parameters objectForKeyedSubscript:v9];
      uint64_t v15 = [v14 objectForKeyedSubscript:v8];

      id v16 = [(NSMutableDictionary *)self->_parameters objectForKeyedSubscript:v9];
      [v16 setObject:v13 forKeyedSubscript:v8];

      if (v15)
      {
        uint64_t v17 = SRLogCategoryGeneral();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
LABEL_13:

          goto LABEL_14;
        }
        uint64_t v18 = +[SRParameter typeStringFromParameterType:](SRParameter, "typeStringFromParameterType:", [v10 type]);
        uint64_t v19 = [v13 value];
        int v22 = 138413058;
        id v23 = v8;
        __int16 v24 = 2112;
        int64_t v25 = v18;
        __int16 v26 = 2112;
        id v27 = v9;
        __int16 v28 = 2112;
        id v29 = v19;
        uint64_t v20 = "Updating parameter %@ of type %@ in namespace %@ to value %@";
      }
      else
      {
        trialConfig = self->_trialConfig;
        if (trialConfig) {
          [(SRTrialConfiguration *)trialConfig setParameterName:v8 namespaceId:v9];
        }
        uint64_t v17 = SRLogCategoryGeneral();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_13;
        }
        uint64_t v18 = +[SRParameter typeStringFromParameterType:](SRParameter, "typeStringFromParameterType:", [v10 type]);
        uint64_t v19 = [v13 value];
        int v22 = 138413058;
        id v23 = v8;
        __int16 v24 = 2112;
        int64_t v25 = v18;
        __int16 v26 = 2112;
        id v27 = v19;
        __int16 v28 = 2112;
        id v29 = v9;
        uint64_t v20 = "Adding parameter %@ of type %@ and value %@ to namespace %@";
      }
      _os_log_debug_impl(&dword_25E378000, v17, OS_LOG_TYPE_DEBUG, v20, (uint8_t *)&v22, 0x2Au);

      goto LABEL_13;
    }
    long long v13 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SRDefaultsManager updateParameter:inNamespace:withValue:]();
    }
  }
  else
  {
    long long v13 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SRDefaultsManager updateParameter:inNamespace:withValue:]();
    }
  }
LABEL_14:
}

- (void)didUpdateTrialNamespace:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  trialConfig = self->_trialConfig;
  if (trialConfig)
  {
    id v25 = v4;
    uint64_t v6 = [(SRTrialConfiguration *)trialConfig clientsForNamespace:v4];
    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v44 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          if (+[SSTrialManager didAllNamespacesLoadForClient:v12])
          {
            [v7 addObject:v12];
            long long v13 = SRLogCategoryGeneral();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)uint8_t buf = 138412546;
              *(void *)&uint8_t buf[4] = v12;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v25;
              _os_log_debug_impl(&dword_25E378000, v13, OS_LOG_TYPE_DEBUG, "Notifying resources for client %@ of update for Trial namespace %@", buf, 0x16u);
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v44 count:16];
      }
      while (v9);
    }

    *(void *)uint8_t buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v41 = __Block_byref_object_copy_;
    unint64_t v42 = __Block_byref_object_dispose_;
    id v43 = 0;
    long long v14 = [(SRDefaultsManager *)self delegatesQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__SRDefaultsManager_didUpdateTrialNamespace___block_invoke;
    block[3] = &unk_265523470;
    void block[4] = self;
    void block[5] = buf;
    dispatch_sync(v14, block);

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v15 = *(id *)(*(void *)&buf[8] + 40);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v39 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          uint64_t v20 = SRLogCategoryGeneral();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            __int16 v24 = [v19 client];
            *(_DWORD *)uint64_t v35 = 138412546;
            int v36 = v19;
            __int16 v37 = 2112;
            uint64_t v38 = v24;
            _os_log_debug_impl(&dword_25E378000, v20, OS_LOG_TYPE_DEBUG, "Delegate %@ with client %@", v35, 0x16u);
          }
          long long v21 = [v19 client];
          int v22 = [v7 containsObject:v21];

          if (v22)
          {
            id v23 = SRLogCategoryGeneral();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)uint64_t v35 = 138412546;
              int v36 = v19;
              __int16 v37 = 2112;
              uint64_t v38 = v25;
              _os_log_debug_impl(&dword_25E378000, v23, OS_LOG_TYPE_DEBUG, "Notifying delegate %@ of update for Trial namespace %@", v35, 0x16u);
            }

            [v19 didUpdateDefaults];
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v39 count:16];
      }
      while (v16);
    }

    _Block_object_dispose(buf, 8);
    id v4 = v25;
  }
}

uint64_t __45__SRDefaultsManager_didUpdateTrialNamespace___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 64) copy];
  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F393D8] sharedInstance];
  [v3 unregisterDelegate:self];

  v4.receiver = self;
  v4.super_class = (Class)SRDefaultsManager;
  [(SRDefaultsManager *)&v4 dealloc];
}

- (id)assetConfigDump
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  uint64_t v3 = [(SRDefaultsManager *)self currentAssetTypes];
  objc_super v4 = [(SRDefaultsManager *)self defaultsQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__SRDefaultsManager_assetConfigDump__block_invoke;
  block[3] = &unk_2655234E8;
  id v9 = v3;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v5 = v3;
  dispatch_sync(v4, block);

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __36__SRDefaultsManager_assetConfigDump__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    id v2 = [NSString alloc];
    uint64_t v3 = sLastLoadedContentVersion;
    objc_super v4 = [*(id *)(*(void *)(a1 + 32) + 8) debugDescription];
    uint64_t v5 = [v2 initWithFormat:@"ContentVersion:%llu\n\n%@", v3, v4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v14 = [MEMORY[0x263F393D8] sharedInstance];
        id v15 = [v13 assetType];
        id v16 = [v14 assertionIDsForClientID:@"SpotlightResources" assetType:v15];
        uint64_t v17 = [v16 allObjects];
        [v8 addObjectsFromArray:v17];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  if ([v8 count])
  {
    uint64_t v18 = [[NSString alloc] initWithFormat:@"%@\nAssertions:%@\n", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v8];
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
}

- (id)trialConfigDump
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  uint64_t v3 = [(SRDefaultsManager *)self defaultsQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__SRDefaultsManager_trialConfigDump__block_invoke;
  v6[3] = &unk_265523498;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void *__36__SRDefaultsManager_trialConfigDump__block_invoke(uint64_t a1)
{
  result = *(void **)(*(void *)(a1 + 32) + 16);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [result debugDescription];
    return (void *)MEMORY[0x270F9A758]();
  }
  return result;
}

- (id)allLoadedAssets
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v49 = [MEMORY[0x263EFF9A0] dictionary];
  long long v33 = self;
  assets = self->_assets;
  if (assets)
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    obuint64_t j = assets;
    uint64_t v34 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v62 objects:v69 count:16];
    if (v34)
    {
      uint64_t v32 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v63 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v5 = *(void *)(*((void *)&v62 + 1) + 8 * i);
          uint64_t v6 = [(NSMutableDictionary *)v33->_assets objectForKeyedSubscript:v5];
          uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
          uint64_t v48 = v5;
          [v49 setObject:v7 forKeyedSubscript:v5];

          if (v6)
          {
            uint64_t v35 = v6;
            uint64_t v36 = i;
            long long v60 = 0u;
            long long v61 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            id v8 = v6;
            uint64_t v39 = [v8 countByEnumeratingWithState:&v58 objects:v68 count:16];
            if (v39)
            {
              id v37 = v8;
              uint64_t v38 = *(void *)v59;
              do
              {
                for (uint64_t j = 0; j != v39; ++j)
                {
                  if (*(void *)v59 != v38) {
                    objc_enumerationMutation(v8);
                  }
                  uint64_t v10 = *(void *)(*((void *)&v58 + 1) + 8 * j);
                  uint64_t v11 = [v8 objectForKeyedSubscript:v10];
                  id v12 = [MEMORY[0x263EFF9A0] dictionary];
                  uint64_t v13 = [v49 objectForKeyedSubscript:v48];
                  uint64_t v47 = v10;
                  [v13 setObject:v12 forKeyedSubscript:v10];

                  if (v11)
                  {
                    uint64_t v40 = v11;
                    uint64_t v41 = j;
                    long long v56 = 0u;
                    long long v57 = 0u;
                    long long v54 = 0u;
                    long long v55 = 0u;
                    id v44 = v11;
                    uint64_t v43 = [v44 countByEnumeratingWithState:&v54 objects:v67 count:16];
                    if (v43)
                    {
                      uint64_t v42 = *(void *)v55;
                      do
                      {
                        uint64_t v14 = 0;
                        do
                        {
                          if (*(void *)v55 != v42) {
                            objc_enumerationMutation(v44);
                          }
                          uint64_t v45 = v14;
                          uint64_t v15 = *(void *)(*((void *)&v54 + 1) + 8 * v14);
                          id v16 = [v44 objectForKeyedSubscript:v15];
                          uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
                          uint64_t v18 = [v49 objectForKeyedSubscript:v48];
                          uint64_t v19 = [v18 objectForKeyedSubscript:v47];
                          [v19 setObject:v17 forKeyedSubscript:v15];

                          uint64_t v20 = [v16 contentNames];
                          long long v50 = 0u;
                          long long v51 = 0u;
                          long long v52 = 0u;
                          long long v53 = 0u;
                          id v46 = v20;
                          uint64_t v21 = [v20 countByEnumeratingWithState:&v50 objects:v66 count:16];
                          if (v21)
                          {
                            uint64_t v22 = v21;
                            uint64_t v23 = *(void *)v51;
                            do
                            {
                              for (uint64_t k = 0; k != v22; ++k)
                              {
                                if (*(void *)v51 != v23) {
                                  objc_enumerationMutation(v46);
                                }
                                uint64_t v25 = *(void *)(*((void *)&v50 + 1) + 8 * k);
                                long long v26 = [v16 pathWithName:v25];
                                uint64_t v27 = [v49 objectForKeyedSubscript:v48];
                                long long v28 = [v27 objectForKeyedSubscript:v47];
                                long long v29 = [v28 objectForKeyedSubscript:v15];
                                [v29 setObject:v26 forKeyedSubscript:v25];
                              }
                              uint64_t v22 = [v46 countByEnumeratingWithState:&v50 objects:v66 count:16];
                            }
                            while (v22);
                          }

                          uint64_t v14 = v45 + 1;
                        }
                        while (v45 + 1 != v43);
                        uint64_t v43 = [v44 countByEnumeratingWithState:&v54 objects:v67 count:16];
                      }
                      while (v43);
                    }

                    id v8 = v37;
                    uint64_t v11 = v40;
                    uint64_t j = v41;
                  }
                }
                uint64_t v39 = [v8 countByEnumeratingWithState:&v58 objects:v68 count:16];
              }
              while (v39);
            }

            uint64_t v6 = v35;
            uint64_t i = v36;
          }
        }
        uint64_t v34 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v62 objects:v69 count:16];
      }
      while (v34);
    }
  }
  return v49;
}

- (NSBundle)customBundle
{
  return self->_customBundle;
}

- (OS_dispatch_queue)ddsQueue
{
  return self->_ddsQueue;
}

- (BOOL)forceLoad
{
  return self->_forceLoad;
}

- (void)setForceLoad:(BOOL)a3
{
  self->_BOOL forceLoad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegatesQueue, 0);
  objc_storeStrong((id *)&self->_defaultsQueue, 0);
  objc_storeStrong((id *)&self->_ddsQueue, 0);
  objc_storeStrong((id *)&self->_customBundle, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_supportedLocalesPath, 0);
  objc_storeStrong((id *)&self->_fetchedLocales, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_trialConfig, 0);
  objc_storeStrong((id *)&self->_assetConfig, 0);
}

void __51__SRDefaultsManager_loadDefaultsFromDefaultAssets___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25E378000, a2, OS_LOG_TYPE_ERROR, "Failed to load defaults at %@", (uint8_t *)&v2, 0xCu);
}

void __47__SRDefaultsManager_requestAssetsForLanguages___block_invoke_157_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_1(&dword_25E378000, a2, a3, "(updateAssetForQuery) failed to update asset for %@ with error %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)loadFactorsAtPath:namespaceId:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_25E378000, v0, OS_LOG_TYPE_DEBUG, "Loading factors from path %@ for namespace %@", v1, 0x16u);
}

void __49__SRDefaultsManager_assetBundleForLocale_client___block_invoke_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_25E378000, log, OS_LOG_TYPE_DEBUG, "Ignoring OTA embeddings assets", buf, 2u);
}

- (void)updateParameter:inNamespace:withValue:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_25E378000, v0, v1, "Failed to update parameter %@ for namespace %@ as defaults manager does not have a parameters map");
}

- (void)updateParameter:inNamespace:withValue:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_25E378000, v0, v1, "Failed to update parameter %@ as namespace %@ was not found");
}

@end