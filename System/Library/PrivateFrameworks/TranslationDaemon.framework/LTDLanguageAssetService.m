@interface LTDLanguageAssetService
@end

@implementation LTDLanguageAssetService

uint64_t __33___LTDLanguageAssetService_queue__block_invoke()
{
  queue__queue_0 = (uint64_t)dispatch_queue_create("com.apple.translationd.LanguageAssetService", 0);
  return MEMORY[0x270F9A758]();
}

void __59___LTDLanguageAssetService__availableAssetsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 40) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59___LTDLanguageAssetService__availableAssetsWithCompletion___block_invoke_2;
  block[3] = &unk_2655468E0;
  id v12 = v6;
  id v8 = *(id *)(a1 + 32);
  id v13 = v5;
  id v14 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

void __59___LTDLanguageAssetService__availableAssetsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 32;
  if (*(void *)(a1 + 32))
  {
    v3 = _LTOSLogAssets();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __59___LTDLanguageAssetService__availableAssetsWithCompletion___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v10 = +[_LTDLanguageAssetCache shared];
    v11 = [*(id *)(a1 + 40) languageIdentifiers];
    id v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = objc_msgSend(v10, "assetForIdentifier:", *(void *)(*((void *)&v19 + 1) + 8 * v17), (void)v19);
          [v12 addObject:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }

    [v10 markReadyForFilter:16];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __58___LTDLanguageAssetService__selectedAssetsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[_LTDLanguageAssetCache shared];
  v3 = [*(id *)(a1 + 40) _selectedIdentifiers];
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(v2, "assetForIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * v9), (void)v12);
        v11 = [v10 progress];
        [v11 setGreaterThanOrEqualToOfflineState:1];

        [v4 addObject:v10];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [v2 markReadyForFilter:32];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59___LTDLanguageAssetService__installedAssetsWithCompletion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [a1[6] queue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59___LTDLanguageAssetService__installedAssetsWithCompletion___block_invoke_2;
  v10[3] = &unk_265546930;
  id v11 = v6;
  id v14 = a1[5];
  id v12 = a1[4];
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);
}

void __59___LTDLanguageAssetService__installedAssetsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 32;
  if (*(void *)(a1 + 32))
  {
    v3 = _LTOSLogAssets();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __59___LTDLanguageAssetService__installedAssetsWithCompletion___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v10 = +[_LTDLanguageAssetCache shared];
    id v11 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v52 objects:v59 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v53 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v52 + 1) + 8 * i) _ltLocaleIdentifier];
          v18 = [v10 assetForIdentifier:v17];

          long long v19 = [v18 ltIdentifier];
          [v11 setObject:v18 forKeyedSubscript:v19];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v52 objects:v59 count:16];
      }
      while (v14);
    }
    v38 = v10;

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    obuint64_t j = *(id *)(a1 + 48);
    uint64_t v20 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v49 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void **)(*((void *)&v48 + 1) + 8 * j);
          unint64_t v25 = [v24 assetType];
          BOOL v26 = v25 > 7 || ((1 << v25) & 0xC4) == 0;
          if (!v26 && ([v24 isInstalled] & 1) == 0)
          {
            v27 = [v24 localeIdentifiers];
            long long v44 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            uint64_t v28 = [v27 countByEnumeratingWithState:&v44 objects:v57 count:16];
            if (v28)
            {
              uint64_t v29 = v28;
              uint64_t v30 = *(void *)v45;
              do
              {
                for (uint64_t k = 0; k != v29; ++k)
                {
                  if (*(void *)v45 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  [v11 setObject:0 forKeyedSubscript:*(void *)(*((void *)&v44 + 1) + 8 * k)];
                }
                uint64_t v29 = [v27 countByEnumeratingWithState:&v44 objects:v57 count:16];
              }
              while (v29);
            }
          }
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
      }
      while (v21);
    }

    v32 = [v11 allValues];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v40 objects:v56 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v41;
      do
      {
        for (uint64_t m = 0; m != v34; ++m)
        {
          if (*(void *)v41 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [*(id *)(*((void *)&v40 + 1) + 8 * m) progress];
          [v37 setGreaterThanOrEqualToOfflineState:2];
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v40 objects:v56 count:16];
      }
      while (v34);
    }
    [v38 markReadyForFilter:64];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __55___LTDLanguageAssetService__supportedLocalesWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263EFF960] localeWithLocaleIdentifier:a2];
}

void __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _LTOSLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_cold_1();
    }
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setRequiredAssets:v5];
    [*(id *)(a1 + 64) _purgeUnusedAssetsWithCompletion:0];
    uint64_t v9 = *(void *)(a1 + 72);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_20;
    v13[3] = &unk_265546980;
    uint64_t v10 = *(void *)(a1 + 40);
    id v14 = *(id *)(a1 + 32);
    id v15 = *(id *)(a1 + 56);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_25;
    v11[3] = &unk_265545F60;
    id v12 = *(id *)(a1 + 48);
    +[_LTDAssetService downloadAssets:v5 forLocales:v10 options:v9 progress:v13 completion:v11];
  }
}

void __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_20(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "applyProgressUpdateForAsset:") & 1) == 0) {
    +[_LTDAssetService purgeAsset:v5 completion:&__block_literal_global_23];
  }
  if (*(void *)(a1 + 40))
  {
    v3 = +[_LTDLanguageAssetCache shared];
    uint64_t v4 = [v3 assetsFilteredUsing:0];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = _LTOSLogAssets();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_2_cold_2(v7, v4);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_2_cold_1(v7, v4);
  }
}

void __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_25(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_25_cold_1();
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __80___LTDLanguageAssetService_setInstalledLocales_useCellular_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "installationStatus", (void)v12);
          [v5 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __80___LTDLanguageAssetService_setInstalledLocales_useCellular_progress_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __80___LTDLanguageAssetService_setInstalledLocales_useCellular_progress_completion___block_invoke_2_cold_1();
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __48___LTDLanguageAssetService_syncInstalledLocales__block_invoke(uint64_t a1)
{
  id v10 = 0;
  uint64_t v2 = +[_LTDConfigurationService configurationForType:0 error:&v10];
  id v3 = v10;
  id v4 = [v2 objectForKeyedSubscript:@"DisableSyncInstalledLocalesOnLaunch"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v2 objectForKeyedSubscript:@"DisableSyncInstalledLocalesOnLaunch"];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  id v6 = v5;
  char v7 = [v5 BOOLValue];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48___LTDLanguageAssetService_syncInstalledLocales__block_invoke_2;
    v9[3] = &__block_descriptor_40_e29_v24__0__NSArray_8__NSError_16l;
    v9[4] = v8;
    [v8 assetsWithOptions:32 completion:v9];
  }
}

void __48___LTDLanguageAssetService_syncInstalledLocales__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count]) {
    [*(id *)(a1 + 32) setAssets:v3 options:8 progress:0 completion:0];
  }
}

void __61___LTDLanguageAssetService__purgeUnusedAssetsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    char v7 = _LTOSLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __61___LTDLanguageAssetService__purgeUnusedAssetsWithCompletion___block_invoke_cold_1();
    }
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
    }
  }
  else
  {
    uint64_t v17 = a1;
    uint64_t v9 = +[_LTDLanguageAssetCache shared];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if (([v9 applyProgressUpdateForAsset:v15] & 1) == 0) {
            +[_LTDAssetService purgeAsset:v15 completion:&__block_literal_global_35];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    uint64_t v16 = *(void *)(v17 + 32);
    if (v16) {
      (*(void (**)(uint64_t, void))(v16 + 16))(v16, 0);
    }
  }
}

void __61___LTDLanguageAssetService__purgeUnusedAssetsWithCompletion___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = _LTOSLogAssets();
  char v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_2_cold_2(v7, v4);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_2_cold_1(v7, v4);
  }
}

uint64_t __43___LTDLanguageAssetService_selectedLocales__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x263EFF960], "lt_localeWithLTIdentifier:", a2);
}

void __60___LTDLanguageAssetService__preheatMissingCacheStatesAfter___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[_LTDLanguageAssetCache shared];
  if (([v2 isReadyForAllFilters] & 1) == 0 && (_block_invoke_preheating & 1) == 0)
  {
    _block_invoke_preheating = 1;
    id v3 = _LTOSLogAssets();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2600DC000, v3, OS_LOG_TYPE_INFO, "Preheat language cache starting", buf, 2u);
    }
    id v4 = dispatch_group_create();
    if (([v2 isReadyForFilter:16] & 1) == 0)
    {
      dispatch_group_enter(v4);
      id v5 = _LTOSLogAssets();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "Preheat language cache for available state", buf, 2u);
      }
      id v6 = *(void **)(a1 + 32);
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __60___LTDLanguageAssetService__preheatMissingCacheStatesAfter___block_invoke_39;
      v23[3] = &unk_265546A18;
      uint64_t v24 = v4;
      [v6 assetsWithOptions:16 completion:v23];
    }
    if (([v2 isReadyForFilter:32] & 1) == 0)
    {
      char v7 = _LTOSLogAssets();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2600DC000, v7, OS_LOG_TYPE_INFO, "Preheat language cache for selected state", buf, 2u);
      }
      dispatch_group_enter(v4);
      uint64_t v8 = *(void **)(a1 + 32);
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __60___LTDLanguageAssetService__preheatMissingCacheStatesAfter___block_invoke_40;
      v21[3] = &unk_265546A18;
      uint64_t v22 = v4;
      [v8 assetsWithOptions:32 completion:v21];
    }
    if (([v2 isReadyForFilter:64] & 1) == 0)
    {
      uint64_t v9 = _LTOSLogAssets();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2600DC000, v9, OS_LOG_TYPE_INFO, "Preheat language cache for installed state", buf, 2u);
      }
      dispatch_group_enter(v4);
      id v10 = *(void **)(a1 + 32);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __60___LTDLanguageAssetService__preheatMissingCacheStatesAfter___block_invoke_41;
      v19[3] = &unk_265546A18;
      long long v20 = v4;
      [v10 assetsWithOptions:64 completion:v19];
    }
    uint64_t v11 = [*(id *)(a1 + 32) queue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __60___LTDLanguageAssetService__preheatMissingCacheStatesAfter___block_invoke_42;
    v15[3] = &unk_265546A40;
    id v12 = v2;
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    id v16 = v12;
    uint64_t v17 = v13;
    uint64_t v18 = v14;
    dispatch_group_notify(v4, v11, v15);
  }
}

void __60___LTDLanguageAssetService__preheatMissingCacheStatesAfter___block_invoke_39(uint64_t a1)
{
  uint64_t v2 = _LTOSLogAssets();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_2600DC000, v2, OS_LOG_TYPE_INFO, "Language cache ready for available state", v3, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __60___LTDLanguageAssetService__preheatMissingCacheStatesAfter___block_invoke_40(uint64_t a1)
{
  uint64_t v2 = _LTOSLogAssets();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_2600DC000, v2, OS_LOG_TYPE_INFO, "Language cache is ready for selected state", v3, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __60___LTDLanguageAssetService__preheatMissingCacheStatesAfter___block_invoke_41(uint64_t a1)
{
  uint64_t v2 = _LTOSLogAssets();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_2600DC000, v2, OS_LOG_TYPE_INFO, "Language cache is ready for installed state", v3, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __60___LTDLanguageAssetService__preheatMissingCacheStatesAfter___block_invoke_42(uint64_t a1)
{
  uint64_t v2 = _LTOSLogAssets();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2600DC000, v2, OS_LOG_TYPE_INFO, "Preheat language cache completed", v4, 2u);
  }
  _block_invoke_preheating = 0;
  uint64_t result = [*(id *)(a1 + 32) isReadyForAllFilters];
  if ((result & 1) == 0 && !*(void *)(a1 + 40)) {
    return [*(id *)(a1 + 48) _preheatMissingCacheStatesAfter:10];
  }
  return result;
}

void __104___LTDLanguageAssetService_startLanguageStatusSession_observationType_progress_observations_completion___block_invoke(uint64_t a1)
{
  id v3 = +[_LTDLanguageAssetCache shared];
  uint64_t v2 = [[_LTDLanguageAssetCacheObserver alloc] initWithID:*(void *)(a1 + 32) type:*(void *)(a1 + 56) progress:*(unsigned __int8 *)(a1 + 72) observations:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  [v3 addObserver:v2];
  [*(id *)(a1 + 64) _preheatMissingCacheStatesAfter:0];
}

void __56___LTDLanguageAssetService_cancelLanguageStatusSession___block_invoke(uint64_t a1)
{
  id v2 = +[_LTDLanguageAssetCache shared];
  [v2 removeObserverForID:*(void *)(a1 + 32)];
}

uint64_t __73___LTDLanguageAssetService__languageModelsForLocales_initialState_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _ltLocaleIdentifier];
}

id __73___LTDLanguageAssetService__languageModelsForLocales_initialState_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 _ltLocaleIdentifier];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4) {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F1C0C8]) initWithLocale:v3 state:*(void *)(a1 + 40)];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

void __59___LTDLanguageAssetService__availableAssetsWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __59___LTDLanguageAssetService__installedAssetsWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Language asset service dependency resolution failure: %@", v2, v3, v4, v5, v6);
}

void __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_2_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 identifier];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_2600DC000, v5, v6, "Purged unused asset %{public}@ completed", v7, v8, v9, v10, v11);
}

void __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_2_cold_2(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 identifier];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2(&dword_2600DC000, v5, v6, "Purge of unused asset %{public}@ failed %@, expected if multiple downloads are in progress", v7, v8, v9, v10, v11);
}

void __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke_25_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Language asset service install request completed with error: %@", v2, v3, v4, v5, v6);
}

void __80___LTDLanguageAssetService_setInstalledLocales_useCellular_progress_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Language asset service install received a language manager error %@", v2, v3, v4, v5, v6);
}

void __61___LTDLanguageAssetService__purgeUnusedAssetsWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to read installed assets: %@", v2, v3, v4, v5, v6);
}

@end