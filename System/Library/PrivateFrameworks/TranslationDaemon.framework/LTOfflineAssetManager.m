@interface LTOfflineAssetManager
@end

@implementation LTOfflineAssetManager

void __44___LTOfflineAssetManager__refreshAllAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v10 = _LTOSLogAssets();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __44___LTOfflineAssetManager__refreshAllAssets___block_invoke_cold_1();
    }
  }
  else
  {
    if (([v5 isInstalled] & 1) == 0 && (objc_msgSend(v5, "isDownloading") & 1) == 0)
    {
      v11 = _LTOSLogAssets();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2600DC000, v11, OS_LOG_TYPE_INFO, "Refreshing config asset", buf, 2u);
      }
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __44___LTOfflineAssetManager__refreshAllAssets___block_invoke_3;
      v14[3] = &unk_265546528;
      id v16 = *(id *)(a1 + 40);
      id v15 = v5;
      +[_LTDAssetService downloadAsset:v15 options:2 progress:0 completion:v14];

      v9 = v16;
      goto LABEL_13;
    }
    if (+[_LTDAssetService needsCatalogRefresh])
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __44___LTOfflineAssetManager__refreshAllAssets___block_invoke_5;
      v12[3] = &unk_265545F60;
      v8 = *(void **)(a1 + 32);
      id v13 = *(id *)(a1 + 40);
      [v8 updateAllAssets:v12];
      v9 = v13;
LABEL_13:

      goto LABEL_14;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_14:
}

void __44___LTOfflineAssetManager__refreshAllAssets___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _LTOSLogAssets();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __44___LTOfflineAssetManager__refreshAllAssets___block_invoke_3_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_DEFAULT, "Finished refreshing config asset", v7, 2u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, [*(id *)(a1 + 32) isInstalled]);
  }
}

void __44___LTOfflineAssetManager__refreshAllAssets___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _LTOSLogAssets();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __44___LTOfflineAssetManager__refreshAllAssets___block_invoke_5_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "Finished updating all assets", v6, 2u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59___LTOfflineAssetManager_refreshAllIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  if (_block_invoke_performingRefresh == 1)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2)
    {
      id v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
  }
  else
  {
    _block_invoke_performingRefresh = 1;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __59___LTOfflineAssetManager_refreshAllIfNeededWithCompletion___block_invoke_2;
    v5[3] = &unk_2655464D8;
    id v4 = *(id *)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    id v6 = v4;
    +[_LTDAssetService refreshCatalogIfNeededWithCompletion:v5];
  }
}

void __59___LTOfflineAssetManager_refreshAllIfNeededWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __59___LTOfflineAssetManager_refreshAllIfNeededWithCompletion___block_invoke_3;
    v8[3] = &unk_265547220;
    id v6 = *(void **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    [v6 _refreshAllAssets:v8];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
    _block_invoke_performingRefresh = 0;
  }
}

uint64_t __59___LTOfflineAssetManager_refreshAllIfNeededWithCompletion___block_invoke_3(uint64_t a1)
{
  _block_invoke_performingRefresh = 0;
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __65___LTOfflineAssetManager__queryLanguagePairStatusWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 description];
  id v6 = [v4 description];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

id __65___LTOfflineAssetManager__queryLanguagePairStatusWithCompletion___block_invoke_16(void *a1, uint64_t a2)
{
  id v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  id v11 = 0;
  id v6 = [v3 _speechTranslationAssetInfoForLocalePair:a2 installedAssets:v2 catalogAssets:v4 offlineConfig:v5 error:&v11];
  id v7 = v11;
  if (v7)
  {
    v8 = _LTOSLogAssets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __65___LTOfflineAssetManager__queryLanguagePairStatusWithCompletion___block_invoke_16_cold_1();
    }
  }
  id v9 = [v6 availabilityInfo];

  return v9;
}

void __49___LTOfflineAssetManager_deleteAsset_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = _LTOSLogAssets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "Asset purge finished", v7, 2u);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);
  }
}

uint64_t __48___LTOfflineAssetManager_offlineLanguageStatus___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryLanguagePairStatusWithCompletion:*(void *)(a1 + 40)];
}

void __50___LTOfflineAssetManager__removeOldAssetDirectory__block_invoke()
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ((_removeOldAssetDirectory_removed & 1) == 0)
  {
    v0 = [MEMORY[0x263F08850] defaultManager];
    v1 = +[_LTDAssetService assetDirectoryURL];
    id v19 = 0;
    uint64_t v2 = +[_LTDConfigurationService assetConfigurationWithError:&v19];
    id v3 = v19;
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = _LTOSLogAssets();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[_LTOfflineAssetManager removeObsoleteAssets]();
      }
    }
    else
    {
      uint64_t v6 = [v2 assetDirectoryNames];
      if ((unint64_t)[v6 count] < 2 || objc_msgSend(v6, "count") == 1)
      {
        id v4 = 0;
      }
      else
      {
        v8 = 0;
        unint64_t v9 = 0;
        *(void *)&long long v7 = 138412290;
        long long v16 = v7;
        do
        {
          v10 = objc_msgSend(v6, "objectAtIndexedSubscript:", v9, v16);
          id v11 = [v1 URLByAppendingPathComponent:v10];
          char v18 = 0;
          v12 = [v11 path];
          int v13 = [v0 fileExistsAtPath:v12 isDirectory:&v18];

          if (v13 && v18)
          {
            v14 = [v11 path];
            id v17 = v8;
            [v0 removeItemAtPath:v14 error:&v17];
            id v4 = v17;

            if (v4)
            {
              id v15 = _LTOSLogAssets();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v16;
                id v21 = v4;
                _os_log_error_impl(&dword_2600DC000, v15, OS_LOG_TYPE_ERROR, "Failed to remove old asset directory %@", buf, 0xCu);
              }
            }
          }
          else
          {
            id v4 = v8;
          }

          ++v9;
          v8 = v4;
        }
        while (v9 < [v6 count] - 1);
      }
      _removeOldAssetDirectory_removed = 1;
    }
  }
}

uint64_t __77___LTOfflineAssetManager_purgeAssetForLanguagePair_userInitiated_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

void __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_3;
  v6[3] = &unk_265546F80;
  id v7 = v3;
  id v8 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = _LTOSLogAssets();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_3_cold_1();
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *v2);
  }
  return result;
}

void __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_28(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_2_29(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_3_30;
  block[3] = &unk_2655472E0;
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 32);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_3_30(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = _LTOSLogAssets();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_3_30_cold_1();
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_31(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v4 = _LTOSLogAssets();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_31_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v7 = 0;
    _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_DEFAULT, "All assets purged successfully", v7, 2u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)v2 + 8) + 40));
  }
  return result;
}

void __78___LTOfflineAssetManager__updateAsset_catalogAssets_downloadGroup_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __78___LTOfflineAssetManager__updateAsset_catalogAssets_downloadGroup_completion___block_invoke_cold_1();
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __78___LTOfflineAssetManager__updateAsset_catalogAssets_downloadGroup_completion___block_invoke_32;
    v7[3] = &unk_265545F10;
    id v8 = *(id *)(a1 + 32);
    [v5 deleteAsset:v6 completion:v7];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __78___LTOfflineAssetManager__updateAsset_catalogAssets_downloadGroup_completion___block_invoke_32(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  if (v3)
  {
    id v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __78___LTOfflineAssetManager__updateAsset_catalogAssets_downloadGroup_completion___block_invoke_32_cold_1();
    }
  }
}

uint64_t __42___LTOfflineAssetManager_updateAllAssets___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __42___LTOfflineAssetManager_updateAllAssets___block_invoke_2(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  uint64_t v2 = _LTOSLogAssets();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2600DC000, v2, OS_LOG_TYPE_INFO, "----------------------------- Determine pairs to update ------------------------------------ ", buf, 2u);
  }
  id v65 = 0;
  id v3 = +[_LTDConfigurationService offlineConfigurationWithError:&v65];
  id v4 = v65;
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = _LTOSLogAssets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_LTOfflineAssetManager updateAllAssets:]();
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    long long v7 = [v3 languagePairs];
    v43 = [MEMORY[0x263EFF980] array];
    v44 = [MEMORY[0x263EFF980] array];
    id v40 = [MEMORY[0x263EFF980] array];
    [*(id *)(a1 + 32) debugDumpAssets:*(void *)(a1 + 40)];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    obuint64_t j = v7;
    uint64_t v8 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v10 = 0;
      uint64_t v11 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          int v13 = v10;
          if (*(void *)v62 != v11) {
            objc_enumerationMutation(obj);
          }
          v14 = [MEMORY[0x263F1C0F8] pairWithIdentifiers:*(void *)(*((void *)&v61 + 1) + 8 * i)];
          uint64_t v16 = *(void *)(a1 + 40);
          uint64_t v15 = *(void *)(a1 + 48);
          id v17 = *(void **)(a1 + 32);
          id v60 = v10;
          char v18 = [v17 _speechTranslationAssetInfoForLocalePair:v14 installedAssets:v15 catalogAssets:v16 offlineConfig:v3 error:&v60];
          id v10 = v60;

          id v19 = [v18 availabilityInfo];
          [v44 addObject:v14];
          if ([v19 needsUpdate]) {
            [v43 addObject:v14];
          }
          if ([*(id *)(a1 + 56) containsObject:v14]
            && [v19 pairState] != 2)
          {
            [v43 addObject:v14];
            [v40 addObject:v18];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
      }
      while (v9);
    }
    else
    {
      id v10 = 0;
    }

    v20 = _LTOSLogAssets();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2600DC000, v20, OS_LOG_TYPE_INFO, "----------------------------- Assets to download ------------------------------------ ", buf, 2u);
    }
    id v39 = v10;
    id v21 = dispatch_group_create();
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v22 = *(id *)(a1 + 48);
    uint64_t v23 = [v22 countByEnumeratingWithState:&v56 objects:v68 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v57;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v57 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v56 + 1) + 8 * j);
          if (([v27 isConfig] & 1) == 0) {
            [*(id *)(a1 + 32) _updateAsset:v27 catalogAssets:*(void *)(a1 + 40) downloadGroup:v21 completion:&__block_literal_global_35_0];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v56 objects:v68 count:16];
      }
      while (v24);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v41 = v40;
    uint64_t v28 = [v41 countByEnumeratingWithState:&v52 objects:v67 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v53;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v53 != v30) {
            objc_enumerationMutation(v41);
          }
          v32 = *(void **)(*((void *)&v52 + 1) + 8 * k);
          dispatch_group_enter(v21);
          uint64_t v33 = _queue;
          v50[0] = MEMORY[0x263EF8330];
          v50[1] = 3221225472;
          v50[2] = __42___LTOfflineAssetManager_updateAllAssets___block_invoke_2_36;
          v50[3] = &unk_265545F10;
          v51 = v21;
          [v32 downloadAssetsUserInitiated:0 queue:v33 completion:v50];
        }
        uint64_t v29 = [v41 countByEnumeratingWithState:&v52 objects:v67 count:16];
      }
      while (v29);
    }

    v34 = _queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42___LTOfflineAssetManager_updateAllAssets___block_invoke_37;
    block[3] = &unk_2655473A0;
    id v46 = v43;
    id v47 = v44;
    uint64_t v48 = *(void *)(a1 + 32);
    long long v38 = *(_OWORD *)(a1 + 64);
    id v35 = (id)v38;
    long long v49 = v38;
    id v36 = v44;
    id v37 = v43;
    dispatch_group_notify(v21, v34, block);

    id v5 = v39;
  }
}

void __42___LTOfflineAssetManager_updateAllAssets___block_invoke_2_36(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  if (v3)
  {
    id v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42___LTOfflineAssetManager_updateAllAssets___block_invoke_2_36_cold_1();
    }
  }
}

void __42___LTOfflineAssetManager_updateAllAssets___block_invoke_37(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    id v3 = _LTOSLogAssets();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_2600DC000, v3, OS_LOG_TYPE_INFO, "Config asset updated", v6, 2u);
    }
    id v4 = *(id *)(a1 + 40);

    id v2 = v4;
  }
  [*(id *)(a1 + 48) updateSpeechTranslationAssetSymLinks:v2];
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

void __86___LTOfflineAssetManager__downloadPassthroughAssetForLocale_userInitiated_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) sourceLocale];
  id v10 = 0;
  id v3 = +[_LTDAssetService matchingASRAssetForLocale:v2 error:&v10];
  id v4 = v10;

  if (v4)
  {
    uint64_t v5 = _LTOSLogAssets();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __86___LTOfflineAssetManager__downloadPassthroughAssetForLocale_userInitiated_completion___block_invoke_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  if ([v3 isInstalled])
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v6 = _LTOSLogAssets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v3;
      _os_log_impl(&dword_2600DC000, v6, OS_LOG_TYPE_INFO, "Starting download for passthrough asset with attributes: %{public}@", buf, 0xCu);
    }
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __86___LTOfflineAssetManager__downloadPassthroughAssetForLocale_userInitiated_completion___block_invoke_39;
    v7[3] = &unk_265546F58;
    id v8 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    +[_LTDAssetService downloadAsset:v3 options:2 progress:0 completion:v7];
  }
}

void __86___LTOfflineAssetManager__downloadPassthroughAssetForLocale_userInitiated_completion___block_invoke_39(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __86___LTOfflineAssetManager__downloadPassthroughAssetForLocale_userInitiated_completion___block_invoke_39_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __81___LTOfflineAssetManager_downloadAssetsForLanguagePair_userInitiated_completion___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __81___LTOfflineAssetManager_downloadAssetsForLanguagePair_userInitiated_completion___block_invoke_2;
  v5[3] = &unk_265547418;
  id v2 = *(id *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v7 = v2;
  v5[4] = v3;
  id v6 = v4;
  char v8 = *(unsigned char *)(a1 + 56);
  +[_LTDAssetService configAssetWithCompletion:v5];
}

void __81___LTOfflineAssetManager_downloadAssetsForLanguagePair_userInitiated_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v28[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (v5 && ([v5 isInstalled] & 1) != 0)
    {
      id v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      id v26 = 0;
      v12 = [v10 _speechTranslationAssetInfoForLocalePair:v11 error:&v26];
      id v7 = v26;
      if (!v7)
      {
        uint64_t v13 = *(unsigned __int8 *)(a1 + 56);
        uint64_t v14 = _queue;
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __81___LTOfflineAssetManager_downloadAssetsForLanguagePair_userInitiated_completion___block_invoke_51;
        v24[3] = &unk_265546F58;
        v24[4] = *(void *)(a1 + 32);
        id v25 = *(id *)(a1 + 48);
        [v12 downloadAssetsUserInitiated:v13 queue:v14 completion:v24];

LABEL_14:
        goto LABEL_15;
      }
    }
    else
    {
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v16 = *MEMORY[0x263F1C1D0];
      v27[0] = *MEMORY[0x263F08320];
      id v17 = [v12 localizedStringForKey:@"CONFIGURATION_ASSET_MISSING_ERROR_DESCRIPTION" value:&stru_270C008E8 table:0];
      v28[0] = v17;
      v27[1] = *MEMORY[0x263F08338];
      char v18 = NSString;
      id v19 = [v12 localizedStringForKey:@"CONFIGURATION_ASSET_MISSING_ERROR_DESCRIPTION_REASON" value:&stru_270C008E8 table:0];
      v20 = [v18 stringWithFormat:v19];
      v28[1] = v20;
      id v21 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
      id v7 = [v15 errorWithDomain:v16 code:5 userInfo:v21];

      id v22 = _LTOSLogAssets();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        __81___LTOfflineAssetManager_downloadAssetsForLanguagePair_userInitiated_completion___block_invoke_2_cold_1();
      }
    }
    uint64_t v23 = *(void *)(a1 + 48);
    if (v23) {
      (*(void (**)(uint64_t, id))(v23 + 16))(v23, v7);
    }
    goto LABEL_14;
  }
  id v7 = v6;
  char v8 = _LTOSLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __81___LTOfflineAssetManager_downloadAssetsForLanguagePair_userInitiated_completion___block_invoke_2_cold_1();
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v7);
  }
LABEL_15:
}

void __81___LTOfflineAssetManager_downloadAssetsForLanguagePair_userInitiated_completion___block_invoke_51(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _LTOSLogAssets();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = v4;
    id v7 = [v5 assetIdentifierReferenceCountDictionary];
    int v8 = 138412290;
    uint64_t v9 = v7;
    _os_log_impl(&dword_2600DC000, v6, OS_LOG_TYPE_INFO, "Reference counts after download %@", (uint8_t *)&v8, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __44___LTOfflineAssetManager__refreshAllAssets___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Error reading config asset: %@", v2, v3, v4, v5, v6);
}

void __44___LTOfflineAssetManager__refreshAllAssets___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Error refreshing config asset %@", v2, v3, v4, v5, v6);
}

void __44___LTOfflineAssetManager__refreshAllAssets___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failure updating all assets %@", v2, v3, v4, v5, v6);
}

void __65___LTOfflineAssetManager__queryLanguagePairStatusWithCompletion___block_invoke_16_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Error creating speechTranslationAssetInfo: %@", v2, v3, v4, v5, v6);
}

void __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to delete hotfix file when trying to purge all assets: %@", v2, v3, v4, v5, v6);
}

void __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_3_30_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to delete hotfix when purging assets: %@", v2, v3, v4, v5, v6);
}

void __67___LTOfflineAssetManager_purgeAllAssetsExcludingConfig_completion___block_invoke_31_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "At least one asset failed to purge: %@", v2, v3, v4, v5, v6);
}

void __78___LTOfflineAssetManager__updateAsset_catalogAssets_downloadGroup_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Error downloading asset update %@", v2, v3, v4, v5, v6);
}

void __78___LTOfflineAssetManager__updateAsset_catalogAssets_downloadGroup_completion___block_invoke_32_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Error deleting asset during asset update %@", v2, v3, v4, v5, v6);
}

void __42___LTOfflineAssetManager_updateAllAssets___block_invoke_2_36_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Error downloading assets during update: %@", v2, v3, v4, v5, v6);
}

void __86___LTOfflineAssetManager__downloadPassthroughAssetForLocale_userInitiated_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "Failed to find matching ASR asset for download of pair %{public}@: %@");
}

void __86___LTOfflineAssetManager__downloadPassthroughAssetForLocale_userInitiated_completion___block_invoke_39_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "Failed to download asset for ASR-only download of pair %{public}@: %@");
}

void __81___LTOfflineAssetManager_downloadAssetsForLanguagePair_userInitiated_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Error downloading offline assets %@", v2, v3, v4, v5, v6);
}

@end