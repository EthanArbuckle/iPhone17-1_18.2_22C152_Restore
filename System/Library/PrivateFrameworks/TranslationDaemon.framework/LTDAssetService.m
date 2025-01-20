@interface LTDAssetService
@end

@implementation LTDAssetService

uint64_t __25___LTDAssetService_queue__block_invoke()
{
  queue__queue = (uint64_t)dispatch_queue_create("com.apple.translationd.AssetService", 0);
  return MEMORY[0x270F9A758]();
}

void __53___LTDAssetService_queryAssetType_filter_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v6)
  {
LABEL_9:
    v11 = [a1[6] _assetsSortedByVersion:v5];
    (*((void (**)(void))a1[5] + 2))();

    goto LABEL_10;
  }
  if ([v6 code] != 14
    || ([v7 domain],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEqualToString:@"LTTranslationDaemonErrorDomain"],
        v8,
        !v9))
  {
    v10 = _LTOSLogAssets();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __53___LTDAssetService_queryAssetType_filter_completion___block_invoke_cold_1();
    }
    (*((void (**)(void))a1[5] + 2))();
    goto LABEL_9;
  }
  if ([a1[6] _isObsoleteCatalogType:a1[4]])
  {
    (*((void (**)(void))a1[5] + 2))();
  }
  else
  {
    [a1[6] _forceOneTimeCatalogRefresh];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __53___LTDAssetService_queryAssetType_filter_completion___block_invoke_2;
    v15[3] = &unk_265546290;
    id v12 = a1[6];
    id v13 = a1[5];
    id v14 = a1[6];
    id v17 = v13;
    id v18 = v14;
    id v16 = a1[4];
    [v12 refreshCatalogIfNeededWithCompletion:v15];
  }
LABEL_10:
}

void __53___LTDAssetService_queryAssetType_filter_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53___LTDAssetService_queryAssetType_filter_completion___block_invoke_3;
    v9[3] = &unk_265546268;
    v7 = *(void **)(a1 + 48);
    id v10 = *(id *)(a1 + 40);
    [v7 queryAssetType:v6 filter:1 completion:v9];
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x263F087E8], "ltd_errorWithCode:description:userInfo:", 15, @"Failed to refresh catalog", 0);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __53___LTDAssetService_queryAssetType_filter_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74___LTDAssetService_downloadAssets_forLocales_options_progress_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 80) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74___LTDAssetService_downloadAssets_forLocales_options_progress_completion___block_invoke_2;
  block[3] = &unk_265546330;
  id v12 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 80);
  uint64_t v6 = *(void *)(a1 + 88);
  uint64_t v18 = a2;
  uint64_t v19 = v5;
  uint64_t v20 = v6;
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  id v15 = v7;
  uint64_t v16 = v8;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 72);
  id v13 = v9;
  uint64_t v17 = v10;
  id v14 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

void __74___LTDAssetService_downloadAssets_forLocales_options_progress_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(a1 + 80)];
  v3 = _LTOSLogAssets();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 80) + 1;
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = v3;
    uint64_t v7 = [v5 count];
    uint64_t v8 = [v2 identifier];
    *(_DWORD *)buf = 134218498;
    uint64_t v26 = v4;
    __int16 v27 = 2048;
    uint64_t v28 = v7;
    __int16 v29 = 2114;
    v30 = v8;
    _os_log_impl(&dword_2600DC000, v6, OS_LOG_TYPE_INFO, "Enqueue download %zd of %zd: %{public}@", buf, 0x20u);
  }
  id v9 = *(void **)(a1 + 88);
  uint64_t v10 = *(void *)(a1 + 96);
  uint64_t v11 = *(void *)(a1 + 56);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __74___LTDAssetService_downloadAssets_forLocales_options_progress_completion___block_invoke_23;
  v16[3] = &unk_265546308;
  uint64_t v12 = *(void *)(a1 + 80);
  v23 = v9;
  uint64_t v24 = v12;
  id v17 = *(id *)(a1 + 32);
  id v18 = v2;
  uint64_t v21 = *(void *)(a1 + 64);
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 72);
  id v19 = v13;
  uint64_t v22 = v14;
  id v20 = *(id *)(a1 + 48);
  id v15 = v2;
  [v9 downloadAsset:v15 options:v10 progress:v11 completion:v16];
}

void __74___LTDAssetService_downloadAssets_forLocales_options_progress_completion___block_invoke_23(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 80) queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74___LTDAssetService_downloadAssets_forLocales_options_progress_completion___block_invoke_2_24;
  v9[3] = &unk_2655462E0;
  uint64_t v17 = *(void *)(a1 + 88);
  id v10 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 64);
  id v11 = v5;
  id v12 = v3;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 72);
  id v13 = v6;
  uint64_t v16 = v7;
  id v14 = *(id *)(a1 + 56);
  id v8 = v3;
  dispatch_async(v4, v9);
}

void __74___LTDAssetService_downloadAssets_forLocales_options_progress_completion___block_invoke_2_24(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = _LTOSLogAssets();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 88) + 1;
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = v2;
    uint64_t v6 = [v4 count];
    uint64_t v7 = [*(id *)(a1 + 40) identifier];
    int v14 = 134218498;
    uint64_t v15 = v3;
    __int16 v16 = 2048;
    uint64_t v17 = v6;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "Complete download %zd of %zd: %{public}@", (uint8_t *)&v14, 0x20u);
  }
  id v8 = [*(id *)(a1 + 40) progress];
  char v9 = [v8 isCancelled];

  if ((v9 & 1) == 0)
  {
    id v10 = *(void **)(a1 + 48);
    uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
    if (!v10) {
      id v10 = *(void **)(v11 + 40);
    }
    objc_storeStrong((id *)(v11 + 40), v10);
  }
  if (([*(id *)(a1 + 40) isTTSModel] & 1) == 0) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
  unint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  if (v12 < [*(id *)(a1 + 64) count])
  {
    id v13 = [*(id *)(a1 + 64) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
    ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    v13[2]();
  }
}

void __74___LTDAssetService_downloadAssets_forLocales_options_progress_completion___block_invoke_27(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    unint64_t v2 = 0;
    do
    {
      unint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      if (v3 < [*(id *)(a1 + 32) count])
      {
        uint64_t v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
        ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        v4[2]();
      }
      ++v2;
    }
    while (v2 < *(void *)(a1 + 48));
  }
}

void __74___LTDAssetService_downloadAssets_forLocales_options_progress_completion___block_invoke_2_28(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v14 = a2;
  unint64_t v3 = [*(id *)(a1 + 64) _symlinkPairNamesForLocales:*(void *)(a1 + 32)];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        char v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = [*(id *)(a1 + 64) _symlinkAssetsForLocalePair:v9 fromAssets:*(void *)(a1 + 40)];
        if ([v10 count])
        {
          v6 |= +[_LTSpeechTranslationAssetInfo _createSymlinkDirectoryForLocalePair:v9 assets:v10 validateIfNeeded:*(unsigned __int8 *)(a1 + 72)];
        }
        else
        {
          uint64_t v11 = _LTOSLogAssets();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            __74___LTDAssetService_downloadAssets_forLocales_options_progress_completion___block_invoke_2_28_cold_1(v20, v11, v9, &v21);
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  unint64_t v12 = _LTOSLogAssets();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2600DC000, v12, OS_LOG_TYPE_DEFAULT, "Asset download and symlink creation completed", buf, 2u);
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, void))(v13 + 16))(v13, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  }
  if (v14) {
    v14[2](v14, v6 & 1);
  }
}

void __74___LTDAssetService_downloadAssets_forLocales_options_progress_completion___block_invoke_31(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unint64_t v2 = _LTOSLogAssets();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    int v9 = 134217984;
    uint64_t v10 = [v3 count];
    _os_log_impl(&dword_2600DC000, v4, OS_LOG_TYPE_DEFAULT, "Download of %zd assets complete, running symlink creation", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v5 = [*(id *)(a1 + 48) cleanupScheduler];
  char v6 = objc_opt_respondsToSelector();
  uint64_t v7 = _LTOSLogAssets();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      int v9 = 138543362;
      uint64_t v10 = (uint64_t)v5;
      _os_log_impl(&dword_2600DC000, v7, OS_LOG_TYPE_INFO, "Deferring symlink creation to cleanupScheduler: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    [v5 scheduleAssetCleanupWork:*(void *)(a1 + 40)];
  }
  else
  {
    if (v8)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_2600DC000, v7, OS_LOG_TYPE_INFO, "Don't have a cleanupScheduler, directly doing work to create symlinks", (uint8_t *)&v9, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __48___LTDAssetService__symlinkPairNamesForLocales___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

id __48___LTDAssetService__symlinkPairNamesForLocales___block_invoke_2(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = [MEMORY[0x263F1C0F8] pairWithIdentifiers:a2];
  if ([v2 isPassthrough])
  {
    unint64_t v3 = 0;
  }
  else if ([v2 isVariantPair])
  {
    unint64_t v3 = 0;
  }
  else
  {
    unint64_t v3 = v2;
  }
  id v4 = v3;

  return v4;
}

uint64_t __59___LTDAssetService__symlinkAssetsForLocalePair_fromAssets___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = v4;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)
    && (([v4 isMTModel] & 1) != 0 || objc_msgSend(v5, "isPhrasebook")))
  {
    if ([v5 isInstalled])
    {
      uint64_t v6 = 1;
      goto LABEL_3;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  uint64_t v6 = 0;
LABEL_3:

  return v6;
}

uint64_t __44___LTDAssetService_bootstrapWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  if (!v8)
  {
    +[_LTDLanguageAssetService syncInstalledLocales];
    if (a2)
    {
      uint64_t v5 = objc_opt_new();
      [v5 removeObsoleteAssets];
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v8);
  }
  return MEMORY[0x270F9A790]();
}

void __37___LTDAssetService_assetDirectoryURL__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _libraryDirectory];
  uint64_t v2 = [v1 URLByAppendingPathComponent:@"Translation"];

  unint64_t v3 = [MEMORY[0x263F08850] defaultManager];
  id v7 = 0;
  [v3 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:0 error:&v7];
  id v4 = v7;

  if (v4)
  {
    uint64_t v5 = _LTOSLogAssets();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __37___LTDAssetService_assetDirectoryURL__block_invoke_cold_1();
    }
  }
  uint64_t v6 = (void *)assetDirectoryURL__assetDirectoryURL;
  assetDirectoryURL__assetDirectoryURL = v2;
}

void __57___LTDAssetService_refreshCatalogIfNeededWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = _LTOSLogAssets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __57___LTDAssetService_refreshCatalogIfNeededWithCompletion___block_invoke_cold_1();
    }
    [*(id *)(a1 + 40) setNeedsCatalogRefresh:1];
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      id v8 = *(void (**)(void))(v7 + 16);
LABEL_10:
      v8();
    }
  }
  else
  {
    if (a2) {
      [*(id *)(a1 + 40) configAssetWithCompletion:&__block_literal_global_57];
    }
    [*(id *)(a1 + 40) _refreshHotfixWithCompletion:0];
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
      id v8 = *(void (**)(void))(v9 + 16);
      goto LABEL_10;
    }
  }
}

void __49___LTDAssetService__refreshHotfixWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __49___LTDAssetService__refreshHotfixWithCompletion___block_invoke_cold_1();
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, BOOL, id))(v5 + 16))(v5, v3 == 0, v3);
  }
}

void __46___LTDAssetService_configAssetWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = _LTOSLogAssets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46___LTDAssetService_configAssetWithCompletion___block_invoke_cold_2();
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v7 = +[_LTDAssetService filterConfigAssetFromAssets:a2];
    if (v7)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __46___LTDAssetService_configAssetWithCompletion___block_invoke_63;
      v11[3] = &unk_2655464D8;
      id v8 = *(void **)(a1 + 40);
      id v13 = *(id *)(a1 + 32);
      id v12 = v7;
      [v8 _installConfigAsset:v12 completion:v11];

      uint64_t v9 = v13;
    }
    else
    {
      uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "ltd_errorWithCode:description:userInfo:", 7, @"No config asset in result from async catalog request", 0);
      uint64_t v10 = _LTOSLogAssets();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __46___LTDAssetService_configAssetWithCompletion___block_invoke_cold_1();
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

void __46___LTDAssetService_configAssetWithCompletion___block_invoke_63(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _LTOSLogAssets();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46___LTDAssetService_configAssetWithCompletion___block_invoke_63_cold_1();
    }
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v6();
}

void __51___LTDAssetService__installConfigAsset_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _LTOSLogAssets();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __46___LTDAssetService_configAssetWithCompletion___block_invoke_63_cold_1();
    }
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      uint64_t v7 = *(void (**)(void))(v6 + 16);
LABEL_10:
      v7();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = v5;
      int v12 = 134217984;
      uint64_t v13 = [v8 assetVersion];
      _os_log_impl(&dword_2600DC000, v9, OS_LOG_TYPE_DEFAULT, "Finished downloading config asset version %zd", (uint8_t *)&v12, 0xCu);
    }
    +[_LTDConfigurationService flushCache];
    uint64_t v10 = +[_LTDLanguageAssetCache shared];
    [v10 reset];

    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      uint64_t v7 = *(void (**)(void))(v11 + 16);
      goto LABEL_10;
    }
  }
}

void __48___LTDAssetService_catalogAssetsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _LTOSLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __48___LTDAssetService_catalogAssetsWithCompletion___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50___LTDAssetService_installedAssetsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _LTOSLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __50___LTDAssetService_installedAssetsWithCompletion___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __48___LTDAssetService_filterConfigAssetFromAssets___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isConfig];
}

void __59___LTDAssetService_assetsForLocales_includeTTS_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v7 = [*(id *)(a1 + 48) _ttsAssetsForLocales:*(void *)(a1 + 32)];
      uint64_t v8 = [v5 arrayByAddingObjectsFromArray:v7];

      id v5 = (id)v8;
    }
    uint64_t v9 = +[_LTDAssetService filterConfigAssetFromAssets:v5];
    if (v9)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __59___LTDAssetService_assetsForLocales_includeTTS_completion___block_invoke_92;
      v15[3] = &unk_265546570;
      uint64_t v10 = *(void **)(a1 + 48);
      id v11 = *(id *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      id v18 = v11;
      uint64_t v19 = v12;
      id v16 = v5;
      id v17 = *(id *)(a1 + 32);
      [v10 _installConfigAsset:v9 completion:v15];

      uint64_t v13 = v18;
    }
    else
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x263F087E8], "ltd_errorWithCode:description:userInfo:", 7, @"No config asset found while resolving assets for locales", 0);
      uint64_t v14 = _LTOSLogAssets();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __46___LTDAssetService_configAssetWithCompletion___block_invoke_cold_1();
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __59___LTDAssetService_assetsForLocales_includeTTS_completion___block_invoke_92(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    id v6 = (void *)a1[7];
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    id v10 = 0;
    uint64_t v9 = [v6 filterAssets:v7 forLocales:v8 error:&v10];
    id v5 = v10;
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void __53___LTDAssetService_queryAssetType_filter_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Asset async query failure: %@", v2, v3, v4, v5, v6);
}

void __74___LTDAssetService_downloadAssets_forLocales_options_progress_completion___block_invoke_2_28_cold_1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a2;
  uint64_t v8 = [a3 canonicalIdentifier];
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_error_impl(&dword_2600DC000, v7, OS_LOG_TYPE_ERROR, "Asset download completed for %{public}@ but resolved an empty symlink asset list, skipping symlinking", a1, 0xCu);
}

void __37___LTDAssetService_assetDirectoryURL__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to create asset directory: %@", v2, v3, v4, v5, v6);
}

void __57___LTDAssetService_refreshCatalogIfNeededWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Asset catalog updated failure %@", v2, v3, v4, v5, v6);
}

void __49___LTDAssetService__refreshHotfixWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Hotfix asset refresh failure %@", v2, v3, v4, v5, v6);
}

void __46___LTDAssetService_configAssetWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Config asset not found: %@", v2, v3, v4, v5, v6);
}

void __46___LTDAssetService_configAssetWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Asset catalog read failure: %@", v2, v3, v4, v5, v6);
}

void __46___LTDAssetService_configAssetWithCompletion___block_invoke_63_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Error downloading config asset: %@", v2, v3, v4, v5, v6);
}

void __48___LTDAssetService_catalogAssetsWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Error querying catalog assets: %@", v2, v3, v4, v5, v6);
}

void __50___LTDAssetService_installedAssetsWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Error querying installed assets: %@", v2, v3, v4, v5, v6);
}

@end