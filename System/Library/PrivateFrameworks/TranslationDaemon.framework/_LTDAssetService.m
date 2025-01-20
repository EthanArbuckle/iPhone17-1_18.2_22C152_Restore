@interface _LTDAssetService
+ (BOOL)_isCatalogRefreshWaitExpired;
+ (BOOL)_isObsoleteCatalogType:(id)a3;
+ (BOOL)needsCatalogRefresh;
+ (Class)_serviceProviderForAssetType:(id)a3;
+ (Class)assetProviderFixture;
+ (_LTDAssetCleanupScheduling)cleanupScheduler;
+ (id)_assetsIdentifiersForPairNames:(id)a3 error:(id *)a4;
+ (id)_assetsSortedByVersion:(id)a3;
+ (id)_libraryDirectory;
+ (id)_pairNamesForLocales:(id)a3;
+ (id)_symlinkAssetsForLocalePair:(id)a3 fromAssets:(id)a4;
+ (id)_symlinkPairNamesForLocales:(id)a3;
+ (id)_ttsAssetsForLocales:(id)a3;
+ (id)assetDirectoryURL;
+ (id)assetsForLocales:(id)a3 includeTTS:(BOOL)a4 error:(id *)a5;
+ (id)catalogAssetsWithError:(id *)a3;
+ (id)configAssetIfAvailableWithError:(id *)a3;
+ (id)defaultCatalogTypeWithError:(id *)a3;
+ (id)filterAssets:(id)a3 forLocales:(id)a4 error:(id *)a5;
+ (id)filterConfigAssetFromAssets:(id)a3;
+ (id)installedAssetsWithError:(id *)a3;
+ (id)matchingASRAssetForLocale:(id)a3 error:(id *)a4;
+ (id)matchingASRAssetInAssets:(id)a3 forLocale:(id)a4;
+ (id)queryAssetType:(id)a3 filter:(unint64_t)a4 error:(id *)a5;
+ (id)queue;
+ (int64_t)_catalogRefreshInterval;
+ (void)_forceOneTimeCatalogRefresh;
+ (void)_installConfigAsset:(id)a3 completion:(id)a4;
+ (void)_isCatalogRefreshWaitExpired;
+ (void)_libraryDirectory;
+ (void)_refreshHotfixWithCompletion:(id)a3;
+ (void)_test_resetForceOneTimeCatalogRefresh;
+ (void)assetsForLocales:(id)a3 includeTTS:(BOOL)a4 completion:(id)a5;
+ (void)bootstrapWithCompletion:(id)a3;
+ (void)catalogAssetsWithCompletion:(id)a3;
+ (void)configAssetWithCompletion:(id)a3;
+ (void)downloadAsset:(id)a3 options:(unint64_t)a4 progress:(id)a5 completion:(id)a6;
+ (void)downloadAssets:(id)a3 forLocales:(id)a4 options:(unint64_t)a5 progress:(id)a6 completion:(id)a7;
+ (void)downloadCatalogForAssetType:(id)a3 completion:(id)a4;
+ (void)installedAssetsWithCompletion:(id)a3;
+ (void)purgeAsset:(id)a3 completion:(id)a4;
+ (void)queryAssetType:(id)a3 filter:(unint64_t)a4 completion:(id)a5;
+ (void)refreshCatalogIfNeededWithCompletion:(id)a3;
+ (void)setAssetProviderFixture:(Class)a3;
+ (void)setCleanupScheduler:(id)a3;
+ (void)setNeedsCatalogRefresh:(BOOL)a3;
@end

@implementation _LTDAssetService

+ (id)queue
{
  if (queue_onceToken != -1) {
    dispatch_once(&queue_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)queue__queue;
  return v2;
}

+ (void)setAssetProviderFixture:(Class)a3
{
  _assetProviderFixture = (uint64_t)a3;
}

+ (Class)assetProviderFixture
{
  return (Class)(id)_assetProviderFixture;
}

+ (_LTDAssetCleanupScheduling)cleanupScheduler
{
  return (_LTDAssetCleanupScheduling *)(id)_cleanupScheduler;
}

+ (void)setCleanupScheduler:(id)a3
{
}

+ (Class)_serviceProviderForAssetType:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (_assetProviderFixture)
  {
    id v5 = (id)_assetProviderFixture;
LABEL_6:
    v6 = v5;
    goto LABEL_7;
  }
  if (([v3 hasPrefix:@"com.apple.MobileAsset.Speech"] & 1) != 0
    || [v4 isEqualToString:&stru_270C008E8])
  {
    _os_feature_enabled_impl();
    id v5 = (id)objc_opt_class();
    goto LABEL_6;
  }
  if ([v4 hasPrefix:@"com.apple.MobileAsset.Trial.Siri.SiriTextToSpeech"])
  {
    objc_opt_class();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v8 = _LTOSLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
    +[_LTDAssetService _serviceProviderForAssetType:]();
  }
  v6 = 0;
LABEL_7:

  return (Class)v6;
}

+ (void)downloadCatalogForAssetType:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend((id)objc_msgSend(a1, "_serviceProviderForAssetType:", v7), "downloadCatalogForAssetType:completion:", v7, v6);
}

+ (void)queryAssetType:(id)a3 filter:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)[a1 _serviceProviderForAssetType:v8];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53___LTDAssetService_queryAssetType_filter_completion___block_invoke;
  v13[3] = &unk_2655462B8;
  id v15 = v9;
  id v16 = a1;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  [v10 queryAssetType:v12 filter:a4 completion:v13];
}

+ (void)downloadAsset:(id)a3 options:(unint64_t)a4 progress:(id)a5 completion:(id)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = (void (**)(id, id))a5;
  id v12 = (void (**)(id, void))a6;
  if ([v10 isInstalled])
  {
    v13 = _LTOSLogAssets();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v10;
      _os_log_impl(&dword_2600DC000, v13, OS_LOG_TYPE_DEFAULT, "Download of already installed asset requested: %{public}@", buf, 0xCu);
    }
    if (v11)
    {
      id v14 = +[_LTDLanguageAssetCache shared];
      id v20 = v10;
      id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
      [v14 applyAssetUpdates:v15];

      v11[2](v11, v10);
    }
    if (v12) {
      v12[2](v12, 0);
    }
  }
  else
  {
    id v16 = [v10 progress];
    [v16 setOfflineState:1];

    v17 = _LTOSLogAssets();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v10;
      _os_log_impl(&dword_2600DC000, v17, OS_LOG_TYPE_DEFAULT, "Download of asset requested: %{public}@", buf, 0xCu);
    }
    v18 = [v10 managedAssetType];
    v19 = (void *)[a1 _serviceProviderForAssetType:v18];

    [v19 downloadAsset:v10 options:a4 progress:v11 completion:v12];
  }
}

+ (void)downloadAssets:(id)a3 forLocales:(id)a4 options:(unint64_t)a5 progress:(id)a6 completion:(id)a7
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v44 = a4;
  id v12 = a6;
  id v45 = a7;
  v13 = _LTOSLogAssets();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v13;
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v11 count];
    _os_log_impl(&dword_2600DC000, v14, OS_LOG_TYPE_DEFAULT, "Starting download of %zd assets", (uint8_t *)&buf, 0xCu);
  }
  id v15 = [v11 sortedArrayUsingSelector:sel_compareDownloadPriority_];

  dispatch_group_t v16 = dispatch_group_create();
  v17 = [MEMORY[0x263F08AB0] processInfo];
  unint64_t v18 = [v17 processorCount];

  uint64_t v19 = v18 >> 1;
  if (v18 <= 1) {
    uint64_t v19 = 1;
  }
  uint64_t v46 = v19;
  id v20 = _LTOSLogAssets();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v46;
    _os_log_impl(&dword_2600DC000, v20, OS_LOG_TYPE_INFO, "Throttle downloads to %zd concurrent requests", (uint8_t *)&buf, 0xCu);
  }
  v21 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v15, "count"));
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x2020000000;
  v76[3] = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v79 = 0x3032000000;
  v80 = __Block_byref_object_copy__3;
  v81 = __Block_byref_object_dispose__3;
  id v82 = 0;
  v67[0] = MEMORY[0x263EF8330];
  v67[1] = 3221225472;
  v67[2] = __74___LTDAssetService_downloadAssets_forLocales_options_progress_completion___block_invoke;
  v67[3] = &unk_265546358;
  id v74 = a1;
  id v22 = v15;
  id v68 = v22;
  unint64_t v75 = a5;
  id v43 = v12;
  id v71 = v43;
  p_long long buf = &buf;
  uint64_t v23 = v16;
  v69 = v23;
  v73 = v76;
  id v24 = v21;
  id v70 = v24;
  v25 = (void *)MEMORY[0x26120C050](v67);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v26 = v22;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v63 objects:v77 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v64;
    char v29 = 1;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v64 != v28) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        if (([v31 isTTSModel] & 1) == 0) {
          dispatch_group_enter(v23);
        }
        char v32 = [v31 isInstalled];
        v33 = (void *)MEMORY[0x26120C050](v25);
        [v24 addObject:v33];

        v29 &= v32;
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v63 objects:v77 count:16];
    }
    while (v27);
  }
  else
  {
    char v29 = 1;
  }

  v34 = [a1 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74___LTDAssetService_downloadAssets_forLocales_options_progress_completion___block_invoke_27;
  block[3] = &unk_265546380;
  v61 = v76;
  uint64_t v62 = v46;
  id v35 = v24;
  id v60 = v35;
  dispatch_async(v34, block);

  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __74___LTDAssetService_downloadAssets_forLocales_options_progress_completion___block_invoke_2_28;
  v52[3] = &unk_2655463A8;
  id v57 = a1;
  id v36 = v44;
  id v53 = v36;
  id v37 = v26;
  id v54 = v37;
  char v58 = v29;
  id v38 = v45;
  id v55 = v38;
  v56 = &buf;
  v39 = (void *)MEMORY[0x26120C050](v52);
  v40 = [a1 queue];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __74___LTDAssetService_downloadAssets_forLocales_options_progress_completion___block_invoke_31;
  v48[3] = &unk_2655463D0;
  id v50 = v39;
  id v51 = a1;
  id v49 = v37;
  id v41 = v39;
  id v42 = v37;
  dispatch_group_notify(v23, v40, v48);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(v76, 8);
}

+ (id)_symlinkPairNamesForLocales:(id)a3
{
  id v5 = a3;
  id v6 = +[_LTDLanguageAssetService selectedLocales];
  uint64_t v7 = [v6 count];
  if (v7)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __48___LTDAssetService__symlinkPairNamesForLocales___block_invoke;
    v12[3] = &unk_2655463F8;
    id v3 = &v13;
    id v13 = v6;
    objc_msgSend(v5, "lt_filterUsingBlock:", v12);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = v5;
  }
  id v9 = [a1 _pairNamesForLocales:v8];
  id v10 = [v9 _ltCompactMap:&__block_literal_global_38];

  if (v7) {
  return v10;
  }
}

+ (id)_symlinkAssetsForLocalePair:(id)a3 fromAssets:(id)a4
{
  v29[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 sourceLocale];
  v29[0] = v8;
  id v9 = [v6 targetLocale];
  v29[1] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
  id v27 = 0;
  id v11 = [a1 filterAssets:v7 forLocales:v10 error:&v27];
  id v12 = v27;

  if (v12)
  {
    id v13 = _LTOSLogAssets();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[_LTDAssetService _symlinkAssetsForLocalePair:fromAssets:]();
    }
    id v14 = 0;
  }
  else
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__3;
    v25 = __Block_byref_object_dispose__3;
    id v26 = 0;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __59___LTDAssetService__symlinkAssetsForLocalePair_fromAssets___block_invoke;
    v20[3] = &unk_265546440;
    v20[4] = &v21;
    id v15 = objc_msgSend(v11, "lt_filterUsingBlock:", v20);
    dispatch_group_t v16 = v15;
    if (v22[5])
    {
      v17 = (id)_LTOSLogAssets();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        unint64_t v18 = [(id)v22[5] assetName];
        +[_LTDAssetService _symlinkAssetsForLocalePair:fromAssets:](v18, buf, v17);
      }

      id v14 = 0;
    }
    else
    {
      id v14 = v15;
    }

    _Block_object_dispose(&v21, 8);
  }

  return v14;
}

+ (void)purgeAsset:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v9 = a3;
  id v7 = [v9 managedAssetType];
  id v8 = (void *)[a1 _serviceProviderForAssetType:v7];

  [v8 purgeAsset:v9 completion:v6];
}

+ (void)bootstrapWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44___LTDAssetService_bootstrapWithCompletion___block_invoke;
  v6[3] = &unk_265546468;
  id v7 = v4;
  id v5 = v4;
  [a1 refreshCatalogIfNeededWithCompletion:v6];
}

+ (id)_libraryDirectory
{
  uid_t v2 = getuid();
  id v3 = getpwuid(v2);
  if (v3 && (pw_dir = v3->pw_dir) != 0)
  {
    id v5 = [NSString stringWithCString:pw_dir encoding:4];
    id v6 = [NSURL fileURLWithPath:v5];
    id v7 = [v6 URLByAppendingPathComponent:@"Library" isDirectory:1];
  }
  else
  {
    id v8 = _LTOSLogAssets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[_LTDAssetService _libraryDirectory](v8);
    }
    id v9 = [MEMORY[0x263F08850] defaultManager];
    id v12 = 0;
    id v7 = [v9 URLForDirectory:5 inDomain:1 appropriateForURL:0 create:0 error:&v12];
    id v5 = v12;

    if (v5)
    {
      id v10 = _LTOSLogAssets();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[_LTDAssetService _libraryDirectory]();
      }
    }
  }

  return v7;
}

+ (id)assetDirectoryURL
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37___LTDAssetService_assetDirectoryURL__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (assetDirectoryURL_onceToken != -1) {
    dispatch_once(&assetDirectoryURL_onceToken, block);
  }
  uid_t v2 = (void *)assetDirectoryURL__assetDirectoryURL;
  return v2;
}

+ (int64_t)_catalogRefreshInterval
{
  return 86400;
}

+ (BOOL)_isCatalogRefreshWaitExpired
{
  id v3 = _LTPreferencesLastOfflineAssetCatalogUpdate();
  id v4 = v3;
  if (v3)
  {
    [v3 timeIntervalSinceNow];
    uint64_t v6 = (uint64_t)fabs(v5);
    if ([a1 _catalogRefreshInterval] >= v6)
    {
      BOOL v9 = 0;
      goto LABEL_9;
    }
    id v7 = _LTOSLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[_LTDAssetService _isCatalogRefreshWaitExpired];
    }
  }
  else
  {
    id v8 = _LTOSLogAssets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[_LTDAssetService _isCatalogRefreshWaitExpired](v8);
    }
  }
  BOOL v9 = 1;
LABEL_9:

  return v9;
}

+ (void)_forceOneTimeCatalogRefresh
{
  if ((_hasForcedOneTimeCatalogRefresh & 1) == 0)
  {
    _hasForcedOneTimeCatalogRefresh = 1;
    [a1 setNeedsCatalogRefresh:1];
  }
}

+ (void)_test_resetForceOneTimeCatalogRefresh
{
  _hasForcedOneTimeCatalogRefresh = 0;
}

+ (id)defaultCatalogTypeWithError:(id *)a3
{
  id v9 = 0;
  id v4 = +[_LTDConfigurationService assetConfigurationWithError:&v9];
  id v5 = v9;
  if (v5)
  {
    uint64_t v6 = _LTOSLogAssets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      +[_LTDAssetService defaultCatalogTypeWithError:]();
      if (a3) {
        goto LABEL_4;
      }
    }
    else if (a3)
    {
LABEL_4:
      id v7 = 0;
      *a3 = v5;
      goto LABEL_8;
    }
    id v7 = 0;
  }
  else
  {
    id v7 = [v4 currentSpeechTranslationAssetType];
  }
LABEL_8:

  return v7;
}

+ (BOOL)_isObsoleteCatalogType:(id)a3
{
  id v4 = a3;
  id v12 = 0;
  id v5 = [a1 defaultCatalogTypeWithError:&v12];
  id v6 = v12;
  if (v6 || ([v4 isEqualToString:v5] & 1) != 0)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    id v9 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    id v10 = [v5 stringByTrimmingCharactersInSet:v9];

    int v7 = [v4 hasPrefix:v10];
    if (v7)
    {
      id v11 = _LTOSLogAssets();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        +[_LTDAssetService _isObsoleteCatalogType:]();
      }
    }
  }
  return v7;
}

+ (void)setNeedsCatalogRefresh:(BOOL)a3
{
  if (a3)
  {
    _LTPreferencesSetLastOfflineAssetCatalogUpdate(0);
  }
  else
  {
    id v4 = [MEMORY[0x263EFF910] now];
    _LTPreferencesSetLastOfflineAssetCatalogUpdate(v4);
  }
}

+ (BOOL)needsCatalogRefresh
{
  int v2 = [a1 _isCatalogRefreshWaitExpired];
  if (v2)
  {
    uint64_t v3 = _LTOSLogAssets();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_2600DC000, v3, OS_LOG_TYPE_DEFAULT, "Catalog needs to refresh since the poll interval has elapsed", v5, 2u);
    }
  }
  return v2;
}

+ (void)refreshCatalogIfNeededWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, id))a3;
  if ([a1 needsCatalogRefresh])
  {
    [a1 setNeedsCatalogRefresh:0];
    id v12 = 0;
    id v5 = [a1 defaultCatalogTypeWithError:&v12];
    id v6 = v12;
    if (v6)
    {
      [a1 setNeedsCatalogRefresh:1];
      if (v4) {
        v4[2](v4, 0, v6);
      }
    }
    else
    {
      int v7 = _LTOSLogAssets();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_2600DC000, v7, OS_LOG_TYPE_DEFAULT, "Update offline asset catalog", buf, 2u);
      }
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __57___LTDAssetService_refreshCatalogIfNeededWithCompletion___block_invoke;
      v8[3] = &unk_2655464B0;
      id v10 = a1;
      id v9 = v4;
      [a1 downloadCatalogForAssetType:v5 completion:v8];
    }
  }
  else if (v4)
  {
    v4[2](v4, 0, 0);
  }
}

+ (void)_refreshHotfixWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = _LTOSLogAssets();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2600DC000, v4, OS_LOG_TYPE_INFO, "Trying to refresh hotfix asset", buf, 2u);
  }
  id v5 = +[_LTHotfixManager shared];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49___LTDAssetService__refreshHotfixWithCompletion___block_invoke;
  v7[3] = &unk_265545F60;
  id v8 = v3;
  id v6 = v3;
  [v5 refreshHotfix:v7];
}

+ (void)configAssetWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _LTOSLogAssets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "Trying to download config asset", buf, 2u);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46___LTDAssetService_configAssetWithCompletion___block_invoke;
  v7[3] = &unk_265546500;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  [a1 catalogAssetsWithCompletion:v7];
}

+ (id)configAssetIfAvailableWithError:(id *)a3
{
  id v16 = 0;
  id v5 = [a1 catalogAssetsWithError:&v16];
  id v6 = v16;
  if (!v6)
  {
    id v10 = +[_LTDAssetService filterConfigAssetFromAssets:v5];
    id v11 = v10;
    if (v10)
    {
      if ([v10 isInstalled])
      {
        id v9 = v11;
        id v7 = 0;
LABEL_21:

        goto LABEL_22;
      }
      [a1 _installConfigAsset:v11 completion:0];
      objc_msgSend(MEMORY[0x263F087E8], "ltd_errorWithCode:description:userInfo:", 8, @"Not installed", 0);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      id v14 = _LTOSLogAssets();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        +[_LTDAssetService configAssetIfAvailableWithError:]();
        if (a3) {
          goto LABEL_14;
        }
      }
      else if (a3)
      {
LABEL_14:
        id v7 = v7;
        id v9 = 0;
        *a3 = v7;
        goto LABEL_21;
      }
LABEL_20:
      id v9 = 0;
      goto LABEL_21;
    }
    id v12 = objc_msgSend(MEMORY[0x263F087E8], "ltd_errorWithCode:description:userInfo:", 7, @"No config asset in result from sync catalog request", 0);
    id v13 = _LTOSLogAssets();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __46___LTDAssetService_configAssetWithCompletion___block_invoke_cold_1();
      if (!a3) {
        goto LABEL_11;
      }
    }
    else if (!a3)
    {
LABEL_11:

      id v7 = 0;
      goto LABEL_20;
    }
    *a3 = v12;
    goto LABEL_11;
  }
  id v7 = v6;
  id v8 = _LTOSLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    +[_LTDAssetService configAssetIfAvailableWithError:]();
    if (a3) {
      goto LABEL_4;
    }
  }
  else if (a3)
  {
LABEL_4:
    id v7 = v7;
    id v9 = 0;
    *a3 = v7;
    goto LABEL_22;
  }
  id v9 = 0;
LABEL_22:

  return v9;
}

+ (void)_installConfigAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isInstalled] & 1) == 0 && !objc_msgSend(v6, "isDownloading"))
  {
    id v18 = 0;
    id v9 = [a1 installedAssetsWithError:&v18];
    id v10 = v18;
    id v11 = [a1 filterConfigAssetFromAssets:v9];
    int v12 = [v11 isEqual:v6];
    id v13 = _LTOSLogAssets();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (!v12)
    {
      if (v14) {
        +[_LTDAssetService _installConfigAsset:completion:](v13, v6);
      }
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __51___LTDAssetService__installConfigAsset_completion___block_invoke;
      v15[3] = &unk_265546528;
      id v17 = v7;
      id v16 = v6;
      [a1 downloadAsset:v16 options:2 progress:0 completion:v15];

      goto LABEL_13;
    }
    if (v14)
    {
      +[_LTDAssetService _installConfigAsset:completion:](v13, v11);
      if (!v7) {
        goto LABEL_13;
      }
    }
    else if (!v7)
    {
LABEL_13:

      goto LABEL_14;
    }
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    goto LABEL_13;
  }
  id v8 = _LTOSLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    +[_LTDAssetService _installConfigAsset:completion:](v8);
    if (!v7) {
      goto LABEL_14;
    }
    goto LABEL_5;
  }
  if (v7) {
LABEL_5:
  }
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
LABEL_14:
}

+ (void)catalogAssetsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, id))a3;
  id v9 = 0;
  id v5 = [a1 defaultCatalogTypeWithError:&v9];
  id v6 = v9;
  if (v6)
  {
    v4[2](v4, 0, v6);
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __48___LTDAssetService_catalogAssetsWithCompletion___block_invoke;
    v7[3] = &unk_265546268;
    id v8 = v4;
    [a1 queryAssetType:v5 filter:1 completion:v7];
  }
}

+ (id)catalogAssetsWithError:(id *)a3
{
  id v12 = 0;
  id v5 = [a1 defaultCatalogTypeWithError:&v12];
  id v6 = v12;
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    if (!a3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v11 = 0;
  id v8 = [a1 queryAssetType:v5 filter:1 error:&v11];
  id v7 = v11;
  if (!v7 || (id v9 = _LTOSLogAssets(), !os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)))
  {
    if (!a3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  +[_LTDAssetService catalogAssetsWithError:]();
  if (a3)
  {
LABEL_7:
    id v7 = v7;
    *a3 = v7;
  }
LABEL_8:

  return v8;
}

+ (void)installedAssetsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, id))a3;
  id v9 = 0;
  id v5 = [a1 defaultCatalogTypeWithError:&v9];
  id v6 = v9;
  if (v6)
  {
    v4[2](v4, 0, v6);
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50___LTDAssetService_installedAssetsWithCompletion___block_invoke;
    v7[3] = &unk_265546268;
    id v8 = v4;
    [a1 queryAssetType:v5 filter:2 completion:v7];
  }
}

+ (id)installedAssetsWithError:(id *)a3
{
  id v12 = 0;
  id v5 = [a1 defaultCatalogTypeWithError:&v12];
  id v6 = v12;
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    if (!a3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v11 = 0;
  id v8 = [a1 queryAssetType:v5 filter:2 error:&v11];
  id v7 = v11;
  if (!v7 || (id v9 = _LTOSLogAssets(), !os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)))
  {
    if (!a3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  +[_LTDAssetService installedAssetsWithError:]();
  if (a3)
  {
LABEL_7:
    id v7 = v7;
    *a3 = v7;
  }
LABEL_8:

  return v8;
}

+ (id)queryAssetType:(id)a3 filter:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v17 = 0;
  id v9 = objc_msgSend((id)objc_msgSend(a1, "_serviceProviderForAssetType:", v8), "queryAssetType:filter:error:", v8, a4, &v17);
  id v10 = v17;
  id v11 = v10;
  if (!v10)
  {
    BOOL v14 = [a1 _assetsSortedByVersion:v9];
    goto LABEL_13;
  }
  if ([v10 code] == 14)
  {
    id v12 = [v11 domain];
    int v13 = [v12 isEqualToString:@"LTTranslationDaemonErrorDomain"];

    if (v13)
    {
      if ([a1 _isObsoleteCatalogType:v8])
      {
        BOOL v14 = (void *)MEMORY[0x263EFFA68];
        goto LABEL_13;
      }
      [a1 _forceOneTimeCatalogRefresh];
      [a1 refreshCatalogIfNeededWithCompletion:0];
    }
  }
  id v15 = _LTOSLogAssets();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    +[_LTDAssetService queryAssetType:filter:error:]();
    if (a5) {
      goto LABEL_10;
    }
  }
  else if (a5)
  {
LABEL_10:
    BOOL v14 = 0;
    *a5 = v11;
    goto LABEL_13;
  }
  BOOL v14 = 0;
LABEL_13:

  return v14;
}

+ (id)filterConfigAssetFromAssets:(id)a3
{
  id v4 = objc_msgSend(a3, "lt_filterUsingBlock:", &__block_literal_global_71);
  if ((unint64_t)[v4 count] > 1)
  {
    id v6 = [a1 _assetsSortedByVersion:v4];
    id v5 = [v6 firstObject];
  }
  else
  {
    id v5 = [v4 firstObject];
  }

  return v5;
}

+ (id)_assetsSortedByVersion:(id)a3
{
  return (id)[a3 sortedArrayUsingSelector:sel_compareAssetVersionReversed_];
}

+ (id)_assetsIdentifiersForPairNames:(id)a3 error:(id *)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [MEMORY[0x263EFF9C0] set];
  id v45 = 0;
  char v32 = +[_LTDConfigurationService offlineConfigurationWithError:&v45];
  id v7 = v45;
  if (!v7)
  {
    id v44 = 0;
    id v11 = +[_LTDConfigurationService asrConfigurationWithError:&v44];
    id v8 = v44;
    if (!v8)
    {
      id v29 = v5;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id obj = v5;
      uint64_t v33 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
      if (v33)
      {
        uint64_t v31 = *(void *)v41;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v41 != v31) {
              objc_enumerationMutation(obj);
            }
            v34 = *(void **)(*((void *)&v40 + 1) + 8 * v13);
            uint64_t v35 = v13;
            BOOL v14 = [v34 componentsSeparatedByString:@"-"];
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v50 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v37;
              do
              {
                for (uint64_t i = 0; i != v16; ++i)
                {
                  if (*(void *)v37 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v19 = *(void *)(*((void *)&v36 + 1) + 8 * i);
                  id v20 = [v11 localeIdentifiers];
                  int v21 = [v20 containsObject:v19];

                  if (v21)
                  {
                    id v22 = [NSString stringWithFormat:@"ASR-%@", v19];
                    [v6 addObject:v22];
                  }
                  uint64_t v23 = [NSString stringWithFormat:@"TTS-%@", v19];
                  [v6 addObject:v23];
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v50 count:16];
              }
              while (v16);
            }
            id v24 = [v32 offlinePairConfigurationWithIdentifier:v34];
            v25 = [v24 pairAssetList];
            id v26 = _LTOSLogAssets();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138543618;
              v47 = v25;
              __int16 v48 = 2114;
              id v49 = v34;
              _os_log_debug_impl(&dword_2600DC000, v26, OS_LOG_TYPE_DEBUG, "Adding assets [%{public}@] for pair %{public}@", buf, 0x16u);
            }
            [v6 addObjectsFromArray:v25];

            uint64_t v13 = v35 + 1;
          }
          while (v35 + 1 != v33);
          uint64_t v33 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
        }
        while (v33);
      }

      id v27 = [v6 allObjects];
      id v10 = [v27 sortedArrayUsingSelector:sel_compare_];

      id v8 = 0;
      id v5 = v29;
      goto LABEL_32;
    }
    id v12 = _LTOSLogAssets();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      +[_LTDAssetService _assetsIdentifiersForPairNames:error:]();
      if (a4) {
        goto LABEL_8;
      }
    }
    else if (a4)
    {
LABEL_8:
      id v10 = 0;
      *a4 = v8;
LABEL_32:

      goto LABEL_33;
    }
    id v10 = 0;
    goto LABEL_32;
  }
  id v8 = v7;
  id v9 = _LTOSLogAssets();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    +[_LTDAssetService _assetsIdentifiersForPairNames:error:]();
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
    goto LABEL_33;
  }
  id v10 = 0;
LABEL_33:

  return v10;
}

+ (id)_pairNamesForLocales:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v39 + 1) + 8 * i) _ltLocaleIdentifier];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v7);
  }
  id v24 = v5;

  v25 = v4;
  id v11 = [v4 sortedArrayUsingSelector:sel_compare_];
  id v12 = [MEMORY[0x263EFF980] array];
  uint64_t v13 = [v11 count];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v11;
  uint64_t v27 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v27)
  {
    uint64_t v14 = 0;
    uint64_t v26 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8 * j);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v29 = v14;
        uint64_t v30 = v13;
        uint64_t v17 = objc_msgSend(obj, "subarrayWithRange:", v14, v13);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v43 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v32;
          do
          {
            for (uint64_t k = 0; k != v19; ++k)
            {
              if (*(void *)v32 != v20) {
                objc_enumerationMutation(v17);
              }
              id v22 = [NSString stringWithFormat:@"%@-%@", v16, *(void *)(*((void *)&v31 + 1) + 8 * k)];
              [v12 addObject:v22];
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v43 count:16];
          }
          while (v19);
        }
        uint64_t v14 = v29 + 1;
        uint64_t v13 = v30 - 1;
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v27);
  }

  return v12;
}

+ (id)assetsForLocales:(id)a3 includeTTS:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v18 = 0;
  id v9 = [a1 catalogAssetsWithError:&v18];
  id v10 = v18;
  if (v10)
  {
    id v11 = v10;
    id v12 = _LTOSLogAssets();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      +[_LTDAssetService assetsForLocales:includeTTS:error:]();
      if (a5) {
        goto LABEL_4;
      }
    }
    else if (a5)
    {
LABEL_4:
      id v11 = v11;
      uint64_t v13 = 0;
      *a5 = v11;
      goto LABEL_10;
    }
    uint64_t v13 = 0;
  }
  else
  {
    if (v6)
    {
      uint64_t v14 = [a1 _ttsAssetsForLocales:v8];
      uint64_t v15 = [v9 arrayByAddingObjectsFromArray:v14];

      id v9 = (void *)v15;
    }
    id v17 = 0;
    uint64_t v13 = [a1 filterAssets:v9 forLocales:v8 error:&v17];
    id v11 = v17;
  }
LABEL_10:

  return v13;
}

+ (void)assetsForLocales:(id)a3 includeTTS:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59___LTDAssetService_assetsForLocales_includeTTS_completion___block_invoke;
  v12[3] = &unk_265546598;
  BOOL v16 = a4;
  id v14 = v9;
  id v15 = a1;
  id v13 = v8;
  id v10 = v8;
  id v11 = v9;
  [a1 catalogAssetsWithCompletion:v12];
}

+ (id)_ttsAssetsForLocales:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = NSString;
        id v9 = [*(id *)(*((void *)&v16 + 1) + 8 * i) _ltLocaleIdentifier];
        id v10 = [v8 stringWithFormat:@"TTS-%@", v9];

        id v11 = [[_LTDTTSAssetModel alloc] initWithAssetIdentifier:v10];
        id v12 = [[_LTDAssetModel alloc] initWithProvider:v11];
        if (v12) {
          [v15 addObject:v12];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  return v15;
}

+ (id)filterAssets:(id)a3 forLocales:(id)a4 error:(id *)a5
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v45 = a4;
  id v9 = objc_opt_new();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v54 objects:v61 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v55 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        id v15 = [v14 identifier];
        [v9 setObject:v14 forKeyedSubscript:v15];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v54 objects:v61 count:16];
    }
    while (v11);
  }

  long long v16 = v45;
  long long v17 = [a1 _pairNamesForLocales:v45];
  id v53 = 0;
  long long v18 = [a1 _assetsIdentifiersForPairNames:v17 error:&v53];
  id v19 = v53;
  uint64_t v20 = _LTOSLogAssets();
  uint64_t v21 = v20;
  if (v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      +[_LTDAssetService filterAssets:forLocales:error:]();
      if (!a5) {
        goto LABEL_12;
      }
    }
    else if (!a5)
    {
LABEL_12:
      id v22 = (void *)MEMORY[0x263EFFA68];
      goto LABEL_37;
    }
    *a5 = v19;
    goto LABEL_12;
  }
  id v44 = v17;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138543362;
    id v60 = v18;
    _os_log_impl(&dword_2600DC000, v21, OS_LOG_TYPE_INFO, "Required Assets: %{public}@", buf, 0xCu);
  }
  int64_t v23 = +[_LTDANEService capability];
  id v24 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v18, "count"));
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v43 = v18;
  id v25 = v18;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v50;
    id v46 = v25;
    int64_t v47 = v23;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v50 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v49 + 1) + 8 * j);
        long long v31 = [v9 objectForKeyedSubscript:v30];
        long long v32 = v31;
        if (v31)
        {
          uint64_t v33 = [v31 assetType];
          if ((unint64_t)(v33 - 7) < 2) {
            goto LABEL_33;
          }
          if (v33 == 6 || v33 == 2)
          {
            if (![v32 isANEModel])
            {
              long long v41 = [v24 objectForKeyedSubscript:v30];

              if (v41) {
                goto LABEL_34;
              }
LABEL_33:
              [v24 setObject:v32 forKeyedSubscript:v30];
              goto LABEL_34;
            }
            uint64_t v35 = [v32 requiredCapabilityIdentifier];
            if (v23 >= v35)
            {
              uint64_t v36 = v35;
              long long v37 = [v24 objectForKeyedSubscript:v30];
              long long v38 = v24;
              uint64_t v39 = [v37 requiredCapabilityIdentifier];

              BOOL v40 = v36 <= v39;
              id v24 = v38;
              id v25 = v46;
              int64_t v23 = v47;
              if (!v40) {
                goto LABEL_33;
              }
            }
          }
        }
LABEL_34:
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v49 objects:v58 count:16];
    }
    while (v27);
  }

  id v22 = [v24 allValues];

  long long v17 = v44;
  long long v16 = v45;
  id v19 = 0;
  long long v18 = v43;
LABEL_37:

  return v22;
}

+ (id)matchingASRAssetForLocale:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v14[0] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v13 = 0;
  id v8 = [a1 assetsForLocales:v7 includeTTS:0 error:&v13];
  id v9 = v13;

  if (v9)
  {
    uint64_t v10 = _LTOSLogAssets();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      +[_LTDAssetService matchingASRAssetForLocale:error:]();
      if (a4) {
        goto LABEL_4;
      }
    }
    else if (a4)
    {
LABEL_4:
      uint64_t v11 = 0;
      *a4 = v9;
      goto LABEL_8;
    }
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = [a1 matchingASRAssetInAssets:v8 forLocale:v6];
  }
LABEL_8:

  return v11;
}

+ (id)matchingASRAssetInAssets:(id)a3 forLocale:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  id v8 = (id)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "isASRModel", (void)v13)
          && ([v11 supportsLocale:v6] & 1) != 0)
        {
          id v8 = v11;
          goto LABEL_12;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v8;
}

+ (void)_serviceProviderForAssetType:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_fault_impl(&dword_2600DC000, v0, OS_LOG_TYPE_FAULT, "No service provider defined for asset type: %{public}@", v1, 0xCu);
}

+ (void)_symlinkAssetsForLocalePair:(os_log_t)log fromAssets:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "Filtered assets contains incomplete asset %{public}@", buf, 0xCu);
}

+ (void)_symlinkAssetsForLocalePair:fromAssets:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to filter assets %@", v2, v3, v4, v5, v6);
}

+ (void)_libraryDirectory
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "Failed call to getpwuid, fall back to file manager", v1, 2u);
}

+ (void)_isCatalogRefreshWaitExpired
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  int v6 = 134218240;
  uint64_t v7 = a3;
  __int16 v8 = 2048;
  uint64_t v9 = [a2 _catalogRefreshInterval];
  _os_log_debug_impl(&dword_2600DC000, v5, OS_LOG_TYPE_DEBUG, "Catalog needs refresh since last poll was %zd which exceeds %zd", (uint8_t *)&v6, 0x16u);
}

+ (void)defaultCatalogTypeWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Error reading asset configuration: %@", v2, v3, v4, v5, v6);
}

+ (void)_isObsoleteCatalogType:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_2600DC000, v0, OS_LOG_TYPE_DEBUG, "Detected obsolete catalog type: %{public}@", v1, 0xCu);
}

+ (void)configAssetIfAvailableWithError:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Config asset not available: %@", v2, v3, v4, v5, v6);
}

+ (void)configAssetIfAvailableWithError:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Config asset catalog read failure: %@", v2, v3, v4, v5, v6);
}

+ (void)_installConfigAsset:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_2600DC000, log, OS_LOG_TYPE_DEBUG, "Config asset is already installed", v1, 2u);
}

+ (void)_installConfigAsset:(void *)a1 completion:(void *)a2 .cold.2(void *a1, void *a2)
{
  id v3 = a1;
  [a2 assetVersion];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "Installed config asset is already current version %zd", v6, v7, v8, v9, v10);
}

+ (void)_installConfigAsset:(void *)a1 completion:(void *)a2 .cold.3(void *a1, void *a2)
{
  id v3 = a1;
  [a2 assetVersion];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "Config asset is outdated, downloading version %zd", v6, v7, v8, v9, v10);
}

+ (void)catalogAssetsWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Error sync querying catalog assets: %@", v2, v3, v4, v5, v6);
}

+ (void)installedAssetsWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Error sync querying installed assets: %@", v2, v3, v4, v5, v6);
}

+ (void)queryAssetType:filter:error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Asset sync query failure: %@", v2, v3, v4, v5, v6);
}

+ (void)_assetsIdentifiersForPairNames:error:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "Failed to read offline ASR configuration for asset pairs %{public}@: %@");
}

+ (void)_assetsIdentifiersForPairNames:error:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "Failed to read offline configuration for asset pairs %{public}@: %@");
}

+ (void)assetsForLocales:includeTTS:error:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "Failed to read assets for locales %{public}@: %@");
}

+ (void)filterAssets:forLocales:error:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "Failed to read assets for pair names %{public}@: %@");
}

+ (void)matchingASRAssetForLocale:error:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "Failed to read assets for locale %@: %@");
}

@end