@interface _LTOfflineAssetManager
+ (id)assetDirectory;
+ (id)fallBackAssetResourcePath;
+ (void)assetDirectory;
+ (void)initialize;
- (_LTOfflineAssetManager)init;
- (id)_assetIdentifiersForLanguagePairDirectory:(id)a3;
- (id)_speechTranslationAssetInfoForLocalePair:(id)a3 error:(id *)a4;
- (id)_speechTranslationAssetInfoForLocalePair:(id)a3 installedAssets:(id)a4 catalogAssets:(id)a5 offlineConfig:(id)a6 error:(id *)a7;
- (id)assetIdentifierReferenceCountDictionary;
- (id)endpointAssetInfoWithContext:(id)a3 error:(id *)a4;
- (id)getEndpointerAssetWithType:(unint64_t)a3 error:(id *)a4;
- (id)languageDetectorAssetWithError:(id *)a3;
- (id)modelURLsForLanguagePair:(id)a3;
- (id)speechTranslationAssetInfoForLocalePair:(id)a3 error:(id *)a4;
- (void)_downloadPassthroughAssetForLocale:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5;
- (void)_queryLanguagePairStatusWithCompletion:(id)a3;
- (void)_refreshAllAssets:(id)a3;
- (void)_removeOldAssetDirectory;
- (void)_updateAsset:(id)a3 catalogAssets:(id)a4 downloadGroup:(id)a5 completion:(id)a6;
- (void)assetIdentifierReferenceCountDictionary;
- (void)assetSize:(id)a3;
- (void)debugDumpAssets:(id)a3;
- (void)deleteAsset:(id)a3 completion:(id)a4;
- (void)downloadAssetsForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5;
- (void)offlineLanguageStatus:(id)a3;
- (void)purgeAllAssetsExcludingConfig:(BOOL)a3 completion:(id)a4;
- (void)purgeAssetForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5;
- (void)refreshAllIfNeededWithCompletion:(id)a3;
- (void)removeObsoleteAssets;
- (void)updateAllAssets:(id)a3;
- (void)updateSpeechTranslationAssetSymLinks:(id)a3;
@end

@implementation _LTOfflineAssetManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _queue = (uint64_t)dispatch_queue_create("com.apple.Translator.EMTAssetManager", 0);
    MEMORY[0x270F9A758]();
  }
}

- (_LTOfflineAssetManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)_LTOfflineAssetManager;
  v2 = [(_LTOfflineAssetManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(_LTOfflineAssetManager *)v2 _removeOldAssetDirectory];
    uint64_t v4 = +[_LTHotfixManager shared];
    hotfixMgr = v3->_hotfixMgr;
    v3->_hotfixMgr = (_LTHotfixManager *)v4;
  }
  return v3;
}

- (void)_refreshAllAssets:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44___LTOfflineAssetManager__refreshAllAssets___block_invoke;
  v6[3] = &unk_2655471F8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  +[_LTDAssetService configAssetWithCompletion:v6];
}

- (void)refreshAllIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59___LTOfflineAssetManager_refreshAllIfNeededWithCompletion___block_invoke;
  v7[3] = &unk_265547180;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeObsoleteAssets
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Error querying offline configuration for language pair status: %@", v2, v3, v4, v5, v6);
}

- (void)_queryLanguagePairStatusWithCompletion:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void, void *))a3;
  id v47 = 0;
  uint64_t v5 = +[_LTDConfigurationService offlineConfigurationWithError:&v47];
  id v6 = v47;
  if (!v6)
  {
    if (v5) {
      goto LABEL_6;
    }
    v32 = _LTOSLogAssets();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      -[_LTOfflineAssetManager _queryLanguagePairStatusWithCompletion:](v32);
      if (v4) {
        goto LABEL_19;
      }
    }
    else if (v4)
    {
LABEL_19:
      v33 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F1C1D0] code:5 userInfo:0];
      v4[2](v4, 0, v33);

      id v7 = 0;
      goto LABEL_24;
    }
LABEL_6:
    v35 = self;
    v36 = v4;
    v9 = [v5 languagePairs];
    v10 = [MEMORY[0x263EFF9C0] set];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v44 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [MEMORY[0x263F1C0F8] pairWithIdentifiers:*(void *)(*((void *)&v43 + 1) + 8 * i)];
          [v10 addObject:v16];
          id v17 = objc_alloc(MEMORY[0x263F1C0F8]);
          v18 = [v16 sourceLocale];
          v19 = [v16 sourceLocale];
          v20 = (void *)[v17 initWithSourceLocale:v18 targetLocale:v19];
          [v10 addObject:v20];

          id v21 = objc_alloc(MEMORY[0x263F1C0F8]);
          v22 = [v16 targetLocale];
          v23 = [v16 targetLocale];
          v24 = (void *)[v21 initWithSourceLocale:v22 targetLocale:v23];
          [v10 addObject:v24];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v13);
    }

    v25 = (void *)MEMORY[0x263EFF980];
    v26 = [v10 allObjects];
    v27 = [v25 arrayWithArray:v26];

    [v27 sortUsingComparator:&__block_literal_global_18];
    id v42 = 0;
    v28 = +[_LTDAssetService installedAssetsWithError:&v42];
    id v29 = v42;
    id v41 = v29;
    v30 = +[_LTDAssetService catalogAssetsWithError:&v41];
    id v7 = v41;

    if (!v7)
    {
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __65___LTOfflineAssetManager__queryLanguagePairStatusWithCompletion___block_invoke_16;
      v37[3] = &unk_265547268;
      v37[4] = v35;
      id v38 = v28;
      id v39 = v30;
      id v40 = v5;
      v34 = [v27 _ltCompactMap:v37];
      uint64_t v4 = v36;
      if (v36) {
        ((void (**)(id, void *, void *))v36)[2](v36, v34, 0);
      }

      goto LABEL_23;
    }
    v31 = _LTOSLogAssets();
    uint64_t v4 = v36;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      -[_LTOfflineAssetManager _queryLanguagePairStatusWithCompletion:]();
      if (!v36) {
        goto LABEL_23;
      }
    }
    else if (!v36)
    {
LABEL_23:

      goto LABEL_24;
    }
    v36[2](v36, 0, v7);
    goto LABEL_23;
  }
  id v7 = v6;
  id v8 = _LTOSLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[_LTOfflineAssetManager removeObsoleteAssets]();
    if (!v4) {
      goto LABEL_24;
    }
    goto LABEL_4;
  }
  if (v4) {
LABEL_4:
  }
    v4[2](v4, 0, v7);
LABEL_24:
}

- (void)deleteAsset:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49___LTOfflineAssetManager_deleteAsset_completion___block_invoke;
  v7[3] = &unk_265547290;
  id v8 = v5;
  id v6 = v5;
  +[_LTDAssetService purgeAsset:a3 completion:v7];
}

- (void)offlineLanguageStatus:(id)a3
{
  id v4 = a3;
  id v5 = _queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48___LTOfflineAssetManager_offlineLanguageStatus___block_invoke;
  v7[3] = &unk_265546F80;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_removeOldAssetDirectory
{
}

+ (id)assetDirectory
{
  uint64_t v2 = (void *)assetDirectory__assetURL;
  if (assetDirectory__assetURL)
  {
LABEL_2:
    id v3 = v2;
    goto LABEL_7;
  }
  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v17 = 0;
  id v5 = +[_LTDConfigurationService assetConfigurationWithError:&v17];
  id v6 = v17;
  if (!v6)
  {
    v10 = +[_LTDAssetService assetDirectoryURL];
    id v11 = [v5 currentAssetDirectoryName];
    uint64_t v12 = [v10 URLByAppendingPathComponent:v11];
    uint64_t v13 = (void *)assetDirectory__assetURL;
    assetDirectory__assetURL = v12;

    id v16 = 0;
    [v4 createDirectoryAtURL:assetDirectory__assetURL withIntermediateDirectories:1 attributes:0 error:&v16];
    id v14 = v16;
    if (v14)
    {
      v15 = _LTOSLogAssets();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[_LTOfflineAssetManager assetDirectory]();
      }
    }

    uint64_t v2 = (void *)assetDirectory__assetURL;
    goto LABEL_2;
  }
  id v7 = v6;
  id v8 = _LTOSLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[_LTOfflineAssetManager assetDirectory]();
  }

  id v3 = 0;
LABEL_7:
  return v3;
}

- (id)_assetIdentifiersForLanguagePairDirectory:(id)a3
{
  id v3 = a3;
  id v4 = [v3 URLByAppendingPathComponent:@"assets.json"];
  id v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v4];
  if (!v5)
  {
    id v7 = 0;
LABEL_9:
    id v8 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_10;
  }
  id v11 = 0;
  id v6 = [MEMORY[0x263F08900] JSONObjectWithData:v5 options:0 error:&v11];
  id v7 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_9;
  }
  id v8 = [v6 allKeys];

  if (!v8)
  {
    v9 = _LTOSLogAssets();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_LTOfflineAssetManager _assetIdentifiersForLanguagePairDirectory:]();
    }
    id v8 = 0;
  }
LABEL_10:

  return v8;
}

- (id)assetIdentifierReferenceCountDictionary
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = +[_LTOfflineAssetManager assetDirectory];
  id v33 = 0;
  v19 = v2;
  id v5 = [v2 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:0 options:0 error:&v33];
  id v6 = v33;

  if (v6)
  {
    id v7 = _LTOSLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_LTOfflineAssetManager assetIdentifierReferenceCountDictionary]();
    }
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v5;
  uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v23)
  {
    uint64_t v21 = *(void *)v30;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v8;
        v9 = [(_LTOfflineAssetManager *)self _assetIdentifiersForLanguagePairDirectory:*(void *)(*((void *)&v29 + 1) + 8 * v8)];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v34 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v26 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
              v15 = [v3 objectForKeyedSubscript:v14];
              if (v15)
              {
                id v16 = v15;
                id v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "integerValue") + 1);
              }
              else
              {
                id v17 = &unk_270C338F8;
              }
              [v3 setObject:v17 forKeyedSubscript:v14];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v34 count:16];
          }
          while (v11);
        }

        uint64_t v8 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v23);
  }

  return v3;
}

- (void)purgeAssetForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = (void (**)(id, id))a5;
  v9 = [a3 canonicalLocalePair];
  id v16 = 0;
  uint64_t v10 = [(_LTOfflineAssetManager *)self _speechTranslationAssetInfoForLocalePair:v9 error:&v16];
  id v11 = v16;
  if (v11)
  {
    uint64_t v12 = _LTOSLogAssets();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_LTOfflineAssetManager purgeAssetForLanguagePair:userInitiated:completion:]();
    }
    v8[2](v8, v11);
  }
  else
  {
    uint64_t v13 = _queue;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __77___LTOfflineAssetManager_purgeAssetForLanguagePair_userInitiated_completion___block_invoke;
    v14[3] = &unk_265545F60;
    v15 = v8;
    [v10 purgeAssetUserInitiated:v5 queue:v13 completion:v14];
  }
}

- (void)purgeAllAssetsExcludingConfig:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v28 = a4;
  BOOL v5 = _LTOSLogAssets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v4;
    _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_DEFAULT, "Requested to delete all offline assets, excluding config: %{BOOL}i", buf, 8u);
  }
  *(void *)buf = 0;
  v57 = buf;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__6;
  v60 = __Block_byref_object_dispose__6;
  id v61 = 0;
  uint64_t v6 = +[_LTOfflineAssetManager assetDirectory];
  id v7 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v8 = v57;
  id obj = (id)*((void *)v57 + 5);
  char v9 = [v7 removeItemAtURL:v6 error:&obj];
  long long v27 = (void *)v6;
  objc_storeStrong((id *)v8 + 5, obj);

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = _LTOSLogAssets();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_LTOfflineAssetManager purgeAllAssetsExcludingConfig:completion:]();
    }
  }
  id v11 = (void *)*((void *)v57 + 5);
  *((void *)v57 + 5) = 0;

  uint64_t v12 = v57;
  id v51 = (id)*((void *)v57 + 5);
  long long v29 = +[_LTDAssetService installedAssetsWithError:&v51];
  objc_storeStrong((id *)v12 + 5, v51);
  if (v29)
  {
    if (objc_msgSend(v29, "count", v6))
    {
      uint64_t v13 = dispatch_group_create();
      v44[0] = 0;
      v44[1] = v44;
      v44[2] = 0x3032000000;
      v44[3] = __Block_byref_object_copy__6;
      v44[4] = __Block_byref_object_dispose__6;
      id v45 = 0;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v14 = v29;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v55 count:16];
      uint64_t v16 = 0;
      if (v15)
      {
        uint64_t v17 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v41 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            if (([v19 isConfig] & v4 & 1) == 0)
            {
              dispatch_group_enter(v13);
              v37[0] = MEMORY[0x263EF8330];
              v37[1] = 3221225472;
              v37[2] = __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_28;
              v37[3] = &unk_265546020;
              id v39 = v44;
              id v38 = v13;
              [(_LTOfflineAssetManager *)self deleteAsset:v19 completion:v37];

              ++v16;
            }
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v55 count:16];
        }
        while (v15);
      }

      dispatch_group_enter(v13);
      hotfixMgr = self->_hotfixMgr;
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_2_29;
      v34[3] = &unk_265546020;
      uint64_t v36 = v44;
      uint64_t v21 = v13;
      v35 = v21;
      [(_LTHotfixManager *)hotfixMgr deleteHotfix:v34];
      v22 = _LTOSLogAssets();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v53 = 134217984;
        uint64_t v54 = v16;
        _os_log_impl(&dword_2600DC000, v22, OS_LOG_TYPE_INFO, "Waiting for %zd assets to be deleted", v53, 0xCu);
      }
      uint64_t v23 = _queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_31;
      block[3] = &unk_265547308;
      id v33 = v44;
      id v32 = v28;
      dispatch_group_notify(v21, v23, block);

      _Block_object_dispose(v44, 8);
    }
    else
    {
      long long v26 = self->_hotfixMgr;
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_2;
      v46[3] = &unk_265545F60;
      id v47 = v28;
      [(_LTHotfixManager *)v26 deleteHotfix:v46];
      uint64_t v21 = v47;
    }
  }
  else
  {
    uint64_t v24 = _LTOSLogAssets();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[_LTOfflineAssetManager purgeAllAssetsExcludingConfig:completion:]();
    }
    long long v25 = _queue;
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke;
    v48[3] = &unk_2655472B8;
    uint64_t v49 = v28;
    v50 = buf;
    dispatch_async(v25, v48);
    uint64_t v21 = v49;
  }

  _Block_object_dispose(buf, 8);
}

- (void)debugDumpAssets:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v8 = _LTOSLogAssets();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          char v9 = v8;
          uint64_t v10 = [v7 assetTypeName];
          uint64_t v11 = [v7 assetVersion];
          uint64_t v12 = [v7 requiredCapabilityIdentifier];
          uint64_t v13 = [v7 identifier];
          *(_DWORD *)buf = 138413314;
          v20 = v7;
          __int16 v21 = 2112;
          v22 = v10;
          __int16 v23 = 2048;
          uint64_t v24 = v11;
          __int16 v25 = 2048;
          uint64_t v26 = v12;
          __int16 v27 = 2112;
          id v28 = v13;
          _os_log_impl(&dword_2600DC000, v9, OS_LOG_TYPE_INFO, "%@ %@ Version %zd Capability %zd %@", buf, 0x34u);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v29 count:16];
    }
    while (v4);
  }
}

- (void)_updateAsset:(id)a3 catalogAssets:(id)a4 downloadGroup:(id)a5 completion:(id)a6
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = a5;
  id v13 = a6;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v14 = [v11 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v39;
    *(void *)&long long v15 = 138544130;
    long long v29 = v15;
    id v30 = v13;
    id v31 = v10;
    do
    {
      uint64_t v18 = 0;
      uint64_t v32 = v16;
      do
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(v11);
        }
        v19 = *(void **)(*((void *)&v38 + 1) + 8 * v18);
        if (objc_msgSend(v19, "isNewerCompatibleVersionThan:", v10, v29))
        {
          v20 = _LTOSLogAssets();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            __int16 v21 = v20;
            [v19 assetTypeName];
            __int16 v23 = v22 = self;
            uint64_t v24 = v17;
            __int16 v25 = v12;
            id v26 = v11;
            uint64_t v27 = [v19 assetVersion];
            id v28 = [v19 identifier];
            *(_DWORD *)buf = v29;
            long long v43 = v19;
            __int16 v44 = 2114;
            id v45 = v23;
            __int16 v46 = 2048;
            uint64_t v47 = v27;
            id v11 = v26;
            uint64_t v12 = v25;
            uint64_t v17 = v24;
            __int16 v48 = 2114;
            uint64_t v49 = v28;
            _os_log_impl(&dword_2600DC000, v21, OS_LOG_TYPE_INFO, "update asset: %{public}@; type: %{public}@; version: %zd; name: %{public}@",
              buf,
              0x2Au);

            self = v22;
            id v13 = v30;
            id v10 = v31;
          }
          dispatch_group_enter(v12);
          v33[0] = MEMORY[0x263EF8330];
          v33[1] = 3221225472;
          v33[2] = __78___LTOfflineAssetManager__updateAsset_catalogAssets_downloadGroup_completion___block_invoke;
          v33[3] = &unk_265547330;
          v34 = v12;
          id v37 = v13;
          v35 = self;
          id v36 = v10;
          +[_LTDAssetService downloadAsset:v19 options:2 progress:0 completion:v33];

          uint64_t v16 = v32;
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v11 countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v16);
  }
}

- (void)updateAllAssets:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v23 = a3;
  uint64_t v4 = _LTOSLogAssets();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2600DC000, v4, OS_LOG_TYPE_DEFAULT, "Attempting to update all assets", buf, 2u);
  }
  id v47 = 0;
  id v28 = +[_LTDAssetService installedAssetsWithError:](_LTDAssetService, "installedAssetsWithError:", &v47, v23);
  id v5 = v47;
  id v46 = v5;
  uint64_t v27 = +[_LTDAssetService catalogAssetsWithError:&v46];
  id v6 = v46;

  if (v6)
  {
    id v7 = _LTOSLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_LTOfflineAssetManager updateAllAssets:]();
    }
    ((void (**)(void, id))v24)[2](v24, v6);
  }
  else
  {
    __int16 v25 = [MEMORY[0x263EFF980] array];
    id v45 = 0;
    uint64_t v8 = +[_LTDConfigurationService offlineConfigurationWithError:&v45];
    id v9 = v45;
    if (v9)
    {
      id v6 = v9;
      id v10 = _LTOSLogAssets();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_LTOfflineAssetManager updateAllAssets:]();
      }
      ((void (**)(void, id))v24)[2](v24, v6);
    }
    else
    {
      id v11 = [v8 languagePairs];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id obj = v11;
      id v6 = 0;
      uint64_t v12 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v42;
        do
        {
          uint64_t v14 = 0;
          long long v15 = v6;
          do
          {
            if (*(void *)v42 != v13) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = [MEMORY[0x263F1C0F8] pairWithIdentifiers:*(void *)(*((void *)&v41 + 1) + 8 * v14)];
            id v40 = v15;
            uint64_t v17 = [(_LTOfflineAssetManager *)self _speechTranslationAssetInfoForLocalePair:v16 installedAssets:v28 catalogAssets:v27 offlineConfig:v8 error:&v40];
            id v6 = v40;

            uint64_t v18 = [v17 availabilityInfo];
            if ([v18 pairState] == 2) {
              [v25 addObject:v16];
            }

            ++v14;
            long long v15 = v6;
          }
          while (v12 != v14);
          uint64_t v12 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
        }
        while (v12);
      }

      v19 = _LTOSLogAssets();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2600DC000, v19, OS_LOG_TYPE_INFO, "----------------------------- check config asset for update ------------------------------------ ", buf, 2u);
      }
      v20 = +[_LTDAssetService filterConfigAssetFromAssets:v28];
      __int16 v21 = dispatch_group_create();
      *(void *)buf = 0;
      id v37 = buf;
      uint64_t v38 = 0x2020000000;
      char v39 = 0;
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __42___LTOfflineAssetManager_updateAllAssets___block_invoke;
      v35[3] = &unk_265547358;
      v35[4] = buf;
      [(_LTOfflineAssetManager *)self _updateAsset:v20 catalogAssets:v27 downloadGroup:v21 completion:v35];
      v22 = _queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __42___LTOfflineAssetManager_updateAllAssets___block_invoke_2;
      block[3] = &unk_2655473C8;
      id v33 = v24;
      void block[4] = self;
      id v30 = v27;
      id v31 = v28;
      id v32 = v25;
      v34 = buf;
      dispatch_group_notify(v21, v22, block);

      _Block_object_dispose(buf, 8);
    }
  }
}

- (void)updateSpeechTranslationAssetSymLinks:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    id v31 = 0;
    v22 = +[_LTDConfigurationService offlineConfigurationWithError:&v31];
    id v5 = v31;
    id v30 = v5;
    id v6 = +[_LTDAssetService installedAssetsWithError:&v30];
    id v7 = v30;

    id v29 = v7;
    uint64_t v8 = +[_LTDAssetService catalogAssetsWithError:&v29];
    id v9 = v29;

    id v10 = _LTOSLogAssets();
    id v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_LTOfflineAssetManager updateSpeechTranslationAssetSymLinks:]();
      }
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2600DC000, v11, OS_LOG_TYPE_INFO, "Fixing symlinks", buf, 2u);
      }
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v21 = v4;
      id v12 = v4;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        id v9 = 0;
        uint64_t v15 = *(void *)v25;
        do
        {
          uint64_t v16 = 0;
          uint64_t v17 = v9;
          do
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * v16);
            id v23 = v17;
            v19 = [(_LTOfflineAssetManager *)self _speechTranslationAssetInfoForLocalePair:v18 installedAssets:v6 catalogAssets:v8 offlineConfig:v22 error:&v23];
            id v9 = v23;

            v20 = [v19 availabilityInfo];
            if ([v20 pairState] == 2) {
              [v19 createSymlinkDirectoryForMTAssets];
            }

            ++v16;
            uint64_t v17 = v9;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v14);
      }
      else
      {
        id v9 = 0;
      }

      id v4 = v21;
    }
  }
}

- (void)_downloadPassthroughAssetForLocale:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  +[_LTDTTSAssetService downloadVoiceAssetsForLanguagePair:v7];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __86___LTOfflineAssetManager__downloadPassthroughAssetForLocale_userInitiated_completion___block_invoke;
  v11[3] = &unk_2655473F0;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(_LTOfflineAssetManager *)self refreshAllIfNeededWithCompletion:v11];
}

- (void)downloadAssetsForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [a3 canonicalLocalePair];
  if ([v9 isPassthrough])
  {
    [(_LTOfflineAssetManager *)self _downloadPassthroughAssetForLocale:v9 userInitiated:v5 completion:v8];
  }
  else
  {
    +[_LTDTTSAssetService downloadVoiceAssetsForLanguagePair:v9];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __81___LTOfflineAssetManager_downloadAssetsForLanguagePair_userInitiated_completion___block_invoke;
    v10[3] = &unk_265547440;
    id v12 = v8;
    v10[4] = self;
    id v11 = v9;
    BOOL v13 = v5;
    [(_LTOfflineAssetManager *)self refreshAllIfNeededWithCompletion:v10];
  }
}

- (id)modelURLsForLanguagePair:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = +[_LTOfflineAssetManager assetDirectory];
  id v6 = [v4 canonicalIdentifier];

  id v7 = [v5 URLByAppendingPathComponent:v6];

  uint64_t v8 = [(_LTHotfixManager *)self->_hotfixMgr hotfixURL];
  id v9 = (void *)v8;
  if (v8)
  {
    uint64_t v16 = v8;
    uint64_t v17 = v7;
    id v10 = (void *)MEMORY[0x263EFF8C0];
    id v11 = &v16;
    uint64_t v12 = 2;
  }
  else
  {
    uint64_t v15 = v7;
    id v10 = (void *)MEMORY[0x263EFF8C0];
    id v11 = (uint64_t *)&v15;
    uint64_t v12 = 1;
  }
  BOOL v13 = objc_msgSend(v10, "arrayWithObjects:count:", v11, v12, v15, v16, v17, v18);

  return v13;
}

- (id)speechTranslationAssetInfoForLocalePair:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(_LTOfflineAssetManager *)self _speechTranslationAssetInfoForLocalePair:v6 error:a4];
  uint64_t v8 = v7;
  if (v7)
  {
    if ([v7 isCompletePassthroughModel]
      || ([v8 isCompleteBidirectionalModel] & 1) != 0)
    {
      id v9 = v8;
      goto LABEL_13;
    }
    uint64_t v12 = NSString;
    BOOL v13 = [v6 description];
    id v10 = [v12 stringWithFormat:@"Incomplete speech translation model for %@", v13];

    uint64_t v14 = objc_msgSend(MEMORY[0x263F087E8], "ltd_errorWithCode:description:userInfo:", 19, v10, 0);
    uint64_t v15 = _LTOSLogAssets();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[_LTOfflineAssetManager speechTranslationAssetInfoForLocalePair:error:]();
      if (!a4) {
        goto LABEL_11;
      }
    }
    else if (!a4)
    {
LABEL_11:

      goto LABEL_12;
    }
    *a4 = v14;
    goto LABEL_11;
  }
  id v10 = objc_msgSend(MEMORY[0x263F087E8], "lt_unsupporedLocalePairError:", v6);
  id v11 = _LTOSLogAssets();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    -[_LTOfflineAssetManager speechTranslationAssetInfoForLocalePair:error:]();
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  if (a4) {
LABEL_7:
  }
    *a4 = v10;
LABEL_12:

  id v9 = 0;
LABEL_13:

  return v9;
}

- (id)_speechTranslationAssetInfoForLocalePair:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v23 = 0;
  id v7 = +[_LTDConfigurationService offlineConfigurationWithError:&v23];
  id v8 = v23;
  if (v8)
  {
    id v9 = v8;
    id v10 = _LTOSLogAssets();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[_LTOfflineAssetManager _speechTranslationAssetInfoForLocalePair:error:].cold.4();
      if (a4) {
        goto LABEL_4;
      }
    }
    else if (a4)
    {
LABEL_4:
      id v9 = v9;
      id v11 = 0;
      *a4 = v9;
      goto LABEL_27;
    }
    goto LABEL_13;
  }
  if (!v7)
  {
    uint64_t v16 = _LTOSLogAssets();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[_LTOfflineAssetManager _speechTranslationAssetInfoForLocalePair:error:]();
    }
    id v9 = 0;
LABEL_13:
    id v11 = 0;
    goto LABEL_27;
  }
  id v22 = 0;
  uint64_t v12 = +[_LTDAssetService installedAssetsWithError:&v22];
  id v13 = v22;
  id v21 = v13;
  uint64_t v14 = +[_LTDAssetService catalogAssetsWithError:&v21];
  id v9 = v21;

  if (!v9)
  {
    id v20 = 0;
    uint64_t v17 = [(_LTOfflineAssetManager *)self _speechTranslationAssetInfoForLocalePair:v6 installedAssets:v12 catalogAssets:v14 offlineConfig:v7 error:&v20];
    id v9 = v20;
    if (!v9)
    {
      id v11 = v17;
      goto LABEL_25;
    }
    uint64_t v18 = _LTOSLogAssets();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[_LTOfflineAssetManager _speechTranslationAssetInfoForLocalePair:error:]();
      if (a4) {
        goto LABEL_17;
      }
    }
    else if (a4)
    {
LABEL_17:
      id v11 = 0;
      *a4 = v9;
LABEL_25:

      goto LABEL_26;
    }
    id v11 = 0;
    goto LABEL_25;
  }
  uint64_t v15 = _LTOSLogAssets();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    -[_LTOfflineAssetManager _speechTranslationAssetInfoForLocalePair:error:]();
    if (a4) {
      goto LABEL_9;
    }
LABEL_22:
    id v11 = 0;
    goto LABEL_26;
  }
  if (!a4) {
    goto LABEL_22;
  }
LABEL_9:
  id v9 = v9;
  id v11 = 0;
  *a4 = v9;
LABEL_26:

LABEL_27:
  return v11;
}

- (id)_speechTranslationAssetInfoForLocalePair:(id)a3 installedAssets:(id)a4 catalogAssets:(id)a5 offlineConfig:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = [v12 canonicalLocalePair];
  uint64_t v17 = [v16 canonicalIdentifier];
  uint64_t v18 = [v15 offlinePairConfigurationWithIdentifier:v17];

  v19 = [v18 pairAssetList];
  if ([v19 count])
  {

LABEL_4:
    id v21 = [[_LTSpeechTranslationAssetInfo alloc] initWithInstalledAssets:v13 catalogAssets:v14 localePair:v16 offlineConfig:v18 assetManager:self];
    goto LABEL_5;
  }
  char v20 = [v16 isPassthrough];

  if (v20) {
    goto LABEL_4;
  }
  id v23 = objc_msgSend(MEMORY[0x263F087E8], "lt_unsupporedLocalePairError:", v12);
  long long v24 = _LTOSLogAssets();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    -[_LTOfflineAssetManager _speechTranslationAssetInfoForLocalePair:installedAssets:catalogAssets:offlineConfig:error:]();
    if (!a7) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (a7) {
LABEL_10:
  }
    *a7 = v23;
LABEL_11:

  id v21 = 0;
LABEL_5:

  return v21;
}

- (id)getEndpointerAssetWithType:(unint64_t)a3 error:(id *)a4
{
  id v16 = 0;
  id v6 = +[_LTDConfigurationService assetConfigurationWithError:&v16];
  id v7 = v16;
  if (!v7)
  {
    id v11 = [v6 currentEndpointAssetType];
    id v15 = 0;
    id v12 = +[_LTDAssetService queryAssetType:v11 filter:a3 error:&v15];
    id v8 = v15;
    if (!v8)
    {
      id v10 = v12;
      goto LABEL_14;
    }
    id v13 = _LTOSLogAssets();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[_LTOfflineAssetManager getEndpointerAssetWithType:error:]();
      if (a4) {
        goto LABEL_8;
      }
    }
    else if (a4)
    {
LABEL_8:
      id v10 = 0;
      *a4 = v8;
LABEL_14:

      goto LABEL_15;
    }
    id v10 = 0;
    goto LABEL_14;
  }
  id v8 = v7;
  id v9 = _LTOSLogAssets();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[_LTOfflineAssetManager getEndpointerAssetWithType:error:]();
    if (a4) {
      goto LABEL_4;
    }
  }
  else if (a4)
  {
LABEL_4:
    id v8 = v8;
    id v10 = 0;
    *a4 = v8;
    goto LABEL_15;
  }
  id v10 = 0;
LABEL_15:

  return v10;
}

- (id)endpointAssetInfoWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(_LTOfflineAssetManager *)self getEndpointerAssetWithType:2 error:a4];
  if (!v7)
  {
    if (a4) {
      *a4 = 0;
    }
    id v7 = [(_LTOfflineAssetManager *)self getEndpointerAssetWithType:3 error:a4];
  }
  id v8 = [[_LTHybridEndpointerAssetInfo alloc] initWithAvailableAssets:v7 context:v6];

  return v8;
}

+ (id)fallBackAssetResourcePath
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 resourceURL];

  id v4 = _LTOSLogAssets();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = v4;
    id v6 = [v3 path];
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "Fallback asset resource path : %{public}@", (uint8_t *)&v8, 0xCu);
  }
  return v3;
}

- (id)languageDetectorAssetWithError:(id *)a3
{
  uint64_t v3 = +[_LTOfflineAssetManager fallBackAssetResourcePath];
  id v4 = [v3 URLByAppendingPathComponent:@"LanguageDetectorDefaultAsset"];
  BOOL v5 = [v4 URLByAppendingPathComponent:@"featureCombinationLID.plist"];
  if (([v5 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {

    BOOL v5 = 0;
  }
  id v6 = [[_LTLanguageDetectorAssetInfo alloc] initWithAssetUrl:v4 featureCombinationAssetUrl:v5];

  return v6;
}

- (void)assetSize:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void (**)(id, void, id))a3;
  id v42 = 0;
  id v4 = +[_LTDConfigurationService assetConfigurationWithError:&v42];
  id v5 = v42;
  if (v5)
  {
    id v6 = _LTOSLogAssets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      +[_LTOfflineAssetManager assetDirectory]();
      if (!v3) {
        goto LABEL_32;
      }
      goto LABEL_4;
    }
    if (v3) {
LABEL_4:
    }
      v3[2](v3, 0, v5);
  }
  else
  {
    long long v27 = v3;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v7 = [v4 currentSpeechTranslationAssetType];
    v46[0] = v7;
    long long v26 = v4;
    int v8 = [v4 currentEndpointAssetType];
    v46[1] = v8;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];

    id obj = v9;
    uint64_t v30 = [v9 countByEnumeratingWithState:&v38 objects:v47 count:16];
    uint64_t v10 = 0;
    if (v30)
    {
      uint64_t v29 = *(void *)v39;
      while (2)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v39 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v38 + 1) + 8 * v11);
          id v37 = 0;
          id v13 = +[_LTDAssetService queryAssetType:v12 filter:2 error:&v37];
          id v14 = v37;
          id v15 = v14;
          if (!v13)
          {
            long long v25 = _LTOSLogAssets();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v45 = v15;
              _os_log_impl(&dword_2600DC000, v25, OS_LOG_TYPE_INFO, "Asset size calculation failure: %@", buf, 0xCu);
            }
            uint64_t v3 = v27;
            v27[2](v27, 0, v15);

            goto LABEL_31;
          }
          uint64_t v31 = v11;
          id v32 = v14;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v16 = v13;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v43 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v34;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v34 != v19) {
                  objc_enumerationMutation(v16);
                }
                id v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                if ([v21 unarchivedSize] && objc_msgSend(v21, "unarchivedSize") > 0)
                {
                  v10 += [v21 unarchivedSize];
                }
                else
                {
                  id v22 = _LTOSLogAssets();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v45 = v21;
                    _os_log_impl(&dword_2600DC000, v22, OS_LOG_TYPE_INFO, "Asset unarchive size is nil or less than 1: %@", buf, 0xCu);
                  }
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v43 count:16];
            }
            while (v18);
          }

          uint64_t v11 = v31 + 1;
        }
        while (v31 + 1 != v30);
        uint64_t v30 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v30) {
          continue;
        }
        break;
      }
    }

    id v23 = [NSNumber numberWithUnsignedLongLong:v10];
    long long v24 = _LTOSLogAssets();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v45 = v23;
      _os_log_impl(&dword_2600DC000, v24, OS_LOG_TYPE_INFO, "Asset size calculated as %{public}@", buf, 0xCu);
    }
    uint64_t v3 = v27;
    ((void (**)(id, void *, id))v27)[2](v27, v23, 0);

LABEL_31:
    id v5 = 0;
    id v4 = v26;
  }
LABEL_32:
}

- (void).cxx_destruct
{
}

- (void)_queryLanguagePairStatusWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to read asset catalogs for language pair status query %@", v2, v3, v4, v5, v6);
}

- (void)_queryLanguagePairStatusWithCompletion:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "missing mt_app.offline.plist", v1, 2u);
}

+ (void)assetDirectory
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Error reading asset configuration: %@", v2, v3, v4, v5, v6);
}

- (void)_assetIdentifiersForLanguagePairDirectory:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "Failed to deserialize JSON at path '%{public}@' error %@");
}

- (void)assetIdentifierReferenceCountDictionary
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to get language pair asset directory: %@", v2, v3, v4, v5, v6);
}

- (void)purgeAssetForLanguagePair:userInitiated:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "Failed to purge assets for language pair %{public}@: unable to get asset info: %@");
}

- (void)purgeAllAssetsExcludingConfig:completion:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed asset query: %@", v2, v3, v4, v5, v6);
}

- (void)purgeAllAssetsExcludingConfig:completion:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to delete asset link directory: %@", v2, v3, v4, v5, v6);
}

- (void)updateAllAssets:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to read offline configuration for asset update %@", v2, v3, v4, v5, v6);
}

- (void)updateAllAssets:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to read asset catalogs for asset update %@", v2, v3, v4, v5, v6);
}

- (void)updateSpeechTranslationAssetSymLinks:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to read asset catalogs for symlink update: %@", v2, v3, v4, v5, v6);
}

- (void)speechTranslationAssetInfoForLocalePair:error:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "Can't get speech asset info for pair %{public}@ because we couldn't get asset info; it may be unsupported: %@");
}

- (void)speechTranslationAssetInfoForLocalePair:error:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "Can't get speech asset info for pair %{public}@ because we don't have a complete bi-directional model: %@");
}

- (void)_speechTranslationAssetInfoForLocalePair:error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to read mt_app.offline.plist for asset pair %@", v2, v3, v4, v5, v6);
}

- (void)_speechTranslationAssetInfoForLocalePair:error:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "Failed to generate asset info for asset pair %@: %@");
}

- (void)_speechTranslationAssetInfoForLocalePair:error:.cold.3()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "Failed to read asset catalog for asset pair %@: %@");
}

- (void)_speechTranslationAssetInfoForLocalePair:error:.cold.4()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "Failed to read offline configuration for asset pair %@: %@");
}

- (void)_speechTranslationAssetInfoForLocalePair:installedAssets:catalogAssets:offlineConfig:error:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "Error getting asset info for pair %{public}@; %@");
}

- (void)getEndpointerAssetWithType:error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to query endpointer assets: %@", v2, v3, v4, v5, v6);
}

- (void)getEndpointerAssetWithType:error:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to read endpointer config: %@", v2, v3, v4, v5, v6);
}

@end