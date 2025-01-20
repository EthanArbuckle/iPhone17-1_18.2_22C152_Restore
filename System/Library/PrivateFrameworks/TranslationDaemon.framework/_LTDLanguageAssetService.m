@interface _LTDLanguageAssetService
+ (BOOL)onDeviceModeSupported;
+ (NSArray)selectedLocales;
+ (NSSet)_selectedIdentifiers;
+ (id)_complementaryLocaleIfMissingForAssets:(id)a3 preferredComplements:(id)a4;
+ (id)_languageAssetFilterDescription:(unint64_t)a3;
+ (id)_languageModelsForLocales:(id)a3 initialState:(int64_t)a4 error:(id *)a5;
+ (id)_selectedAssets;
+ (id)_supportedLocalesWithError:(id *)a3;
+ (id)queue;
+ (unint64_t)_languageAssetFilterFromOptions:(unint64_t)a3;
+ (void)_availableAssetsWithCompletion:(id)a3;
+ (void)_installedAssetsWithCompletion:(id)a3;
+ (void)_preheatMissingCacheStatesAfter:(int64_t)a3;
+ (void)_purgeUnusedAssetsWithCompletion:(id)a3;
+ (void)_selectedAssetsWithCompletion:(id)a3;
+ (void)addLanguages:(id)a3 useCellular:(BOOL)a4;
+ (void)assetsWithOptions:(unint64_t)a3 completion:(id)a4;
+ (void)cancelLanguageStatusSession:(id)a3;
+ (void)removeLanguages:(id)a3;
+ (void)setAssets:(id)a3 options:(unint64_t)a4 progress:(id)a5 completion:(id)a6;
+ (void)setInstalledLocales:(id)a3 useCellular:(BOOL)a4 progress:(id)a5 completion:(id)a6;
+ (void)setSelectedLocales:(id)a3;
+ (void)startLanguageStatusSession:(id)a3 observationType:(unint64_t)a4 progress:(BOOL)a5 observations:(id)a6 completion:(id)a7;
+ (void)syncInstalledLocales;
@end

@implementation _LTDLanguageAssetService

+ (unint64_t)_languageAssetFilterFromOptions:(unint64_t)a3
{
  if ((a3 & 0x40) != 0)
  {
    if ((a3 & 0x30) != 0)
    {
      v4 = _LTOSLogAssets();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        +[_LTDLanguageAssetService _languageAssetFilterFromOptions:](v4);
      }
    }
    return 64;
  }
  else if ((a3 & 0x20) != 0)
  {
    if ((a3 & 0x10) != 0)
    {
      v5 = _LTOSLogAssets();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[_LTDLanguageAssetService _languageAssetFilterFromOptions:](v5);
      }
    }
    return 32;
  }
  else
  {
    return 16;
  }
}

+ (id)_languageAssetFilterDescription:(unint64_t)a3
{
  v3 = @".available";
  if (a3 == 32) {
    v3 = @".selected";
  }
  if (a3 == 64) {
    return @".installed";
  }
  else {
    return v3;
  }
}

+ (void)assetsWithOptions:(unint64_t)a3 completion:(id)a4
{
  v6 = (void (**)(id, void *, void))a4;
  uint64_t v7 = [a1 _languageAssetFilterFromOptions:a3];
  v8 = _LTOSLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[_LTDLanguageAssetService assetsWithOptions:completion:](v8, a1, v7);
  }
  v9 = +[_LTDLanguageAssetCache shared];
  v10 = [v9 assetsFilteredUsing:v7];

  if (v10)
  {
    v11 = _LTOSLogAssets();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      +[_LTDLanguageAssetService assetsWithOptions:completion:](v11);
      if (!v6) {
        goto LABEL_12;
      }
      goto LABEL_6;
    }
    if (v6) {
LABEL_6:
    }
      v6[2](v6, v10, 0);
  }
  else if (v7 == 32)
  {
    [a1 _selectedAssetsWithCompletion:v6];
  }
  else if (v7 == 64)
  {
    [a1 _installedAssetsWithCompletion:v6];
  }
  else
  {
    [a1 _availableAssetsWithCompletion:v6];
  }
LABEL_12:
}

+ (id)queue
{
  if (queue_onceToken_0 != -1) {
    dispatch_once(&queue_onceToken_0, &__block_literal_global_10);
  }
  v2 = (void *)queue__queue_0;
  return v2;
}

+ (void)_availableAssetsWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59___LTDLanguageAssetService__availableAssetsWithCompletion___block_invoke;
  v6[3] = &unk_265546908;
  id v7 = v4;
  id v8 = a1;
  id v5 = v4;
  +[_LTDConfigurationService offlineConfigurationWithCompletion:v6];
}

+ (void)_selectedAssetsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [a1 queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58___LTDLanguageAssetService__selectedAssetsWithCompletion___block_invoke;
  v7[3] = &unk_265546608;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (void)_installedAssetsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [a1 selectedLocales];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59___LTDLanguageAssetService__installedAssetsWithCompletion___block_invoke;
  v8[3] = &unk_265546958;
  id v10 = v4;
  id v11 = a1;
  id v9 = v5;
  id v6 = v5;
  id v7 = v4;
  +[_LTDAssetService assetsForLocales:v6 includeTTS:0 completion:v8];
}

+ (id)_supportedLocalesWithError:(id *)a3
{
  id v4 = +[_LTDConfigurationService offlineConfigurationWithError:](_LTDConfigurationService, "offlineConfigurationWithError:");
  id v5 = v4;
  if (*a3)
  {
    id v6 = _LTOSLogAssets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[_LTDLanguageAssetService _supportedLocalesWithError:]((uint64_t)a3, v6, v7, v8, v9, v10, v11, v12);
    }
    v13 = 0;
  }
  else
  {
    v14 = [v4 languageIdentifiers];
    v13 = [v14 _ltCompactMap:&__block_literal_global_17];
  }
  return v13;
}

+ (id)_complementaryLocaleIfMissingForAssets:(id)a3 preferredComplements:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] == 1
    && ([a1 selectedLocales],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        !v9))
  {
    uint64_t v12 = [v6 firstObject];
    v13 = [v12 locale];

    id v24 = 0;
    v14 = [a1 _supportedLocalesWithError:&v24];
    id v15 = v24;
    if (v15)
    {
      v16 = _LTOSLogAssets();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[_LTDLanguageAssetService _complementaryLocaleIfMissingForAssets:preferredComplements:]();
      }
      id v10 = 0;
    }
    else
    {
      v17 = objc_msgSend(MEMORY[0x263EFF960], "lt_bestMatchForPreferredLocales:fromSupportedLocales:", v7, v14);
      if (!v17)
      {
        v18 = _LTPreferencesAdditionalLikelyPreferredLocales(v13);
        if ([v18 count])
        {
          v17 = objc_msgSend(MEMORY[0x263EFF960], "lt_bestMatchForPreferredLocales:fromSupportedLocales:", v18, v14);
        }
        else
        {
          v17 = 0;
        }
      }
      v19 = [v17 _ltLocaleIdentifier];
      if (v19)
      {
        v20 = [v13 _ltLocaleIdentifier];
        int v21 = [v20 isEqualToString:v19];

        if (v21) {
          v22 = 0;
        }
        else {
          v22 = v17;
        }
        id v10 = v22;
      }
      else
      {
        v23 = _LTOSLogAssets();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v26 = v7;
          _os_log_impl(&dword_2600DC000, v23, OS_LOG_TYPE_INFO, "Failed to locate a supported complement for %{public}@", buf, 0xCu);
        }
        id v10 = 0;
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (void)setAssets:(id)a3 options:(unint64_t)a4 progress:(id)a5 completion:(id)a6
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v39 = a5;
  id v11 = a6;
  uint64_t v12 = _LTOSLogAssets();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v53 = v10;
    _os_log_impl(&dword_2600DC000, v12, OS_LOG_TYPE_INFO, "Language asset service received install request: %{public}@", buf, 0xCu);
  }
  v13 = [a1 _complementaryLocaleIfMissingForAssets:v10 preferredComplements:0];
  if (v13)
  {
    v14 = _LTOSLogAssets();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      v16 = [v10 firstObject];
      [v16 ltIdentifier];
      v18 = unint64_t v17 = a4;
      v19 = [v13 _ltLocaleIdentifier];
      *(_DWORD *)buf = 138543618;
      id v53 = v18;
      __int16 v54 = 2114;
      v55 = v19;
      _os_log_impl(&dword_2600DC000, v15, OS_LOG_TYPE_DEFAULT, "Request only downloads %{public}@, downloading complement %{public}@ to ensure a bi-directional pair", buf, 0x16u);

      a4 = v17;
    }
    v20 = (void *)[objc_alloc(MEMORY[0x263F1C0C8]) initWithLocale:v13 state:1];
    uint64_t v21 = [v10 arrayByAddingObject:v20];

    id v10 = (id)v21;
  }
  id v22 = v10;
  v23 = v22;
  unint64_t v38 = a4;
  if ((a4 & 8) == 0)
  {
    id v36 = a1;
    id v37 = v11;
    id v24 = [a1 _selectedAssets];
    v25 = (void *)[v24 mutableCopy];

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v26 = v22;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v48 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          v32 = [v31 progress];
          uint64_t v33 = [v32 offlineState];

          if (v33) {
            [v25 addObject:v31];
          }
          else {
            [v25 removeObject:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v28);
    }

    v23 = [v25 allObjects];

    a1 = v36;
    id v11 = v37;
  }
  v34 = +[_LTDLanguageAssetCache shared];
  v35 = [v34 preheatWithLanguages:v23];
  [v34 markReadyForFilter:32];
  if ([v35 count])
  {
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __66___LTDLanguageAssetService_setAssets_options_progress_completion___block_invoke;
    v40[3] = &unk_2655469A8;
    id v43 = v11;
    id v41 = v34;
    id v45 = a1;
    id v42 = v35;
    unint64_t v46 = v38;
    id v44 = v39;
    +[_LTDAssetService assetsForLocales:v42 includeTTS:1 completion:v40];
  }
  else
  {
    [v34 setRequiredAssets:MEMORY[0x263EFFA68]];
    [a1 _purgeUnusedAssetsWithCompletion:0];
    if (v11) {
      (*((void (**)(id, void))v11 + 2))(v11, 0);
    }
  }
}

+ (void)setInstalledLocales:(id)a3 useCellular:(BOOL)a4 progress:(id)a5 completion:(id)a6
{
  BOOL v23 = a4;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  id v11 = +[_LTDLanguageAssetCache shared];
  uint64_t v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [*(id *)(*((void *)&v29 + 1) + 8 * v17) _ltLocaleIdentifier];
        v19 = [v11 assetForIdentifier:v18];

        v20 = [v19 progress];
        [v20 setGreaterThanOrEqualToOfflineState:1];

        [v12 addObject:v19];
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v15);
  }

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __80___LTDLanguageAssetService_setInstalledLocales_useCellular_progress_completion___block_invoke;
  v27[3] = &unk_2655469D0;
  id v28 = v9;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __80___LTDLanguageAssetService_setInstalledLocales_useCellular_progress_completion___block_invoke_2;
  v25[3] = &unk_265545F60;
  id v26 = v10;
  id v21 = v10;
  id v22 = v9;
  [a1 setAssets:v12 options:v23 | 0xALL progress:v27 completion:v25];
}

+ (BOOL)onDeviceModeSupported
{
  return 1;
}

+ (void)syncInstalledLocales
{
  if ([a1 onDeviceModeSupported])
  {
    dispatch_time_t v3 = dispatch_time(0, 5000000000);
    id v4 = [a1 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48___LTDLanguageAssetService_syncInstalledLocales__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_after(v3, v4, block);
  }
}

+ (void)_purgeUnusedAssetsWithCompletion:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61___LTDLanguageAssetService__purgeUnusedAssetsWithCompletion___block_invoke;
  v5[3] = &unk_265546268;
  id v6 = v3;
  id v4 = v3;
  +[_LTDAssetService installedAssetsWithCompletion:v5];
}

+ (void)setSelectedLocales:(id)a3
{
}

+ (NSArray)selectedLocales
{
  v2 = _LTPreferencesInstalledLocales();
  id v3 = [v2 _ltCompactMap:&__block_literal_global_37];

  return (NSArray *)v3;
}

+ (NSSet)_selectedIdentifiers
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = _LTPreferencesInstalledLocales();
  id v3 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "lt_localeIdentifier", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

+ (id)_selectedAssets
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [a1 _selectedIdentifiers];
  id v3 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v2, "count"));
  id v4 = +[_LTDLanguageAssetCache shared];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(v4, "assetForIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v3 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

+ (void)_preheatMissingCacheStatesAfter:(int64_t)a3
{
  dispatch_time_t v5 = dispatch_time(0, 1000000000 * a3);
  uint64_t v6 = [a1 queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60___LTDLanguageAssetService__preheatMissingCacheStatesAfter___block_invoke;
  v7[3] = &__block_descriptor_48_e5_v8__0l;
  void v7[4] = a1;
  v7[5] = a3;
  dispatch_after(v5, v6, v7);
}

+ (void)startLanguageStatusSession:(id)a3 observationType:(unint64_t)a4 progress:(BOOL)a5 observations:(id)a6 completion:(id)a7
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  long long v15 = _LTOSLogAssets();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = v15;
    uint64_t v17 = [v12 UUIDString];
    *(_DWORD *)buf = 138543362;
    long long v30 = v17;
    _os_log_impl(&dword_2600DC000, v16, OS_LOG_TYPE_INFO, "Start language status session %{public}@", buf, 0xCu);
  }
  v18 = [a1 queue];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __104___LTDLanguageAssetService_startLanguageStatusSession_observationType_progress_observations_completion___block_invoke;
  v22[3] = &unk_265546A88;
  BOOL v28 = a5;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  unint64_t v26 = a4;
  id v27 = a1;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  dispatch_async(v18, v22);
}

+ (void)cancelLanguageStatusSession:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_time_t v5 = _LTOSLogAssets();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [v4 UUIDString];
    *(_DWORD *)buf = 138543362;
    id v13 = v7;
    _os_log_impl(&dword_2600DC000, v6, OS_LOG_TYPE_INFO, "Cancel language status session %{public}@", buf, 0xCu);
  }
  uint64_t v8 = [a1 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56___LTDLanguageAssetService_cancelLanguageStatusSession___block_invoke;
  block[3] = &unk_265546680;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, block);
}

+ (void)addLanguages:(id)a3 useCellular:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = 0;
  uint64_t v6 = [a1 _languageModelsForLocales:a3 initialState:1 error:&v10];
  id v7 = v10;
  if (v7)
  {
    uint64_t v8 = _LTOSLogAssets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[_LTDLanguageAssetService addLanguages:useCellular:]();
    }
  }
  else
  {
    if (v4) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 2;
    }
    [a1 setAssets:v6 options:v9 progress:0 completion:0];
  }
}

+ (void)removeLanguages:(id)a3
{
  id v7 = 0;
  BOOL v4 = [a1 _languageModelsForLocales:a3 initialState:0 error:&v7];
  id v5 = v7;
  if (v5)
  {
    uint64_t v6 = _LTOSLogAssets();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[_LTDLanguageAssetService removeLanguages:]();
    }
  }
  else
  {
    [a1 setAssets:v4 options:2 progress:0 completion:0];
  }
}

+ (id)_languageModelsForLocales:(id)a3 initialState:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if ([v8 count])
  {
    uint64_t v9 = [a1 _supportedLocalesWithError:a5];
    id v10 = v9;
    if (*a5)
    {
      id v11 = 0;
    }
    else
    {
      id v12 = [v9 _ltCompactMap:&__block_literal_global_48];
      id v13 = [MEMORY[0x263EFFA08] setWithArray:v12];
      uint64_t v21 = MEMORY[0x263EF8330];
      uint64_t v22 = 3221225472;
      id v23 = __73___LTDLanguageAssetService__languageModelsForLocales_initialState_error___block_invoke_2;
      id v24 = &unk_265546AD0;
      id v14 = v13;
      id v25 = v14;
      int64_t v26 = a4;
      long long v15 = [v8 _ltCompactMap:&v21];
      if (objc_msgSend(v15, "count", v21, v22, v23, v24))
      {
        id v11 = (void *)[v15 copy];
      }
      else
      {
        uint64_t v16 = (void *)MEMORY[0x263F087E8];
        uint64_t v17 = [v8 firstObject];
        v18 = objc_msgSend(v16, "lt_unsupportedLanguageError:", v17);

        id v19 = v18;
        *a5 = v19;

        id v11 = 0;
      }
    }
  }
  else if (*a5)
  {
    objc_msgSend(MEMORY[0x263F087E8], "lt_unsupportedLanguageError:", 0);
    id v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (void)_languageAssetFilterFromOptions:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "Asset options contains multiple filter options including selected, will only use selected", v1, 2u);
}

+ (void)_languageAssetFilterFromOptions:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "Asset options contains multiple filter options including installed, will only use installed", v1, 2u);
}

+ (void)assetsWithOptions:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2600DC000, log, OS_LOG_TYPE_DEBUG, "Language asset service using cached asset list", v1, 2u);
}

+ (void)assetsWithOptions:(uint64_t)a3 completion:.cold.2(void *a1, void *a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v5 = a1;
  uint64_t v6 = [a2 _languageAssetFilterDescription:a3];
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_2600DC000, v5, OS_LOG_TYPE_DEBUG, "Language asset service received state request with filter %{public}@", v7, 0xCu);
}

+ (void)_supportedLocalesWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_complementaryLocaleIfMissingForAssets:preferredComplements:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to read supported locales for system locale complement %@", v2, v3, v4, v5, v6);
}

+ (void)addLanguages:useCellular:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Add languages failure %@", v2, v3, v4, v5, v6);
}

+ (void)removeLanguages:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Remove languages failure %@", v2, v3, v4, v5, v6);
}

@end