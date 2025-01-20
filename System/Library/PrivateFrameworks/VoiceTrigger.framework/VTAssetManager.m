@interface VTAssetManager
+ (id)sharedInstance;
- (BOOL)_isReadyToUse;
- (VTAssetManager)init;
- (id)_assetQueryForLanguage:(id)a3 supportPremium:(BOOL)a4;
- (id)_defaultDownloadOptions;
- (id)_filteredAssetsForAssets:(id)a3 language:(id)a4 supportPremium:(BOOL)a5;
- (id)_findLatestInstalledAsset:(id)a3;
- (id)_installedAssetForLanguage:(id)a3 supportPremium:(BOOL)a4;
- (id)_installedAssetWithoutMetaDataForLanguage:(id)a3 supportPremium:(BOOL)a4;
- (id)assetForLanguage:(id)a3;
- (id)installedAssetForLanguage:(id)a3;
- (void)_addKeyValuePairForQuery:(id *)a3;
- (void)_downloadAsset:(id)a3 withComplete:(id)a4;
- (void)_fetchRemoteAssetForLanguage:(id)a3 supportPremium:(BOOL)a4;
- (void)_fetchRemoteMetaData;
- (void)_runAssetQuery:(id)a3 completion:(id)a4;
- (void)_startDownloadingVoiceTriggerAsset:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)_updateFromRemoteToLocalAssets:(id)a3;
@end

@implementation VTAssetManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enablePolicy, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_startDownloadingVoiceTriggerAsset:(id)a3 progress:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    *(void *)&buf[4] = "-[VTAssetManager _startDownloadingVoiceTriggerAsset:progress:completion:]";
    _os_log_impl(&dword_21844F000, v11, OS_LOG_TYPE_INFO, "::: %{public}s", buf, 0xCu);
    v11 = VTLogContextFacilityVoiceTrigger;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    int v13 = [v8 state];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v8;
    __int16 v28 = 1026;
    int v29 = v13;
    _os_log_impl(&dword_21844F000, v12, OS_LOG_TYPE_INFO, "Attempting to download asset %{public}@ with asset state : %{public}u", buf, 0x12u);
  }
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __73__VTAssetManager__startDownloadingVoiceTriggerAsset_progress_completion___block_invoke;
  v24[3] = &unk_264325A50;
  id v14 = v9;
  id v26 = v14;
  id v15 = v8;
  id v25 = v15;
  v16 = (void *)MEMORY[0x21D46B9F0](v24);
  switch([v15 state])
  {
    case 0:
      v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = 6;
      goto LABEL_7;
    case 1:
      *(void *)buf = 0;
      if ([v15 spaceCheck:buf])
      {
        [v15 attachProgressCallBack:v16];
        v21 = [(VTAssetManager *)self _defaultDownloadOptions];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __73__VTAssetManager__startDownloadingVoiceTriggerAsset_progress_completion___block_invoke_2;
        v22[3] = &unk_264325A78;
        id v23 = v10;
        [v15 startDownload:v21 then:v22];

        v19 = 0;
      }
      else
      {
        v17 = (void *)MEMORY[0x263F087E8];
        uint64_t v18 = 5;
LABEL_7:
        v19 = [v17 errorWithDomain:@"VTAssetManager" code:v18 userInfo:0];
LABEL_8:
        v20 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21844F000, v20, OS_LOG_TYPE_DEFAULT, "Asset doesn't need downloading, invoking completion", buf, 2u);
        }
        if (v10) {
          (*((void (**)(id, void *))v10 + 2))(v10, v19);
        }
      }

      return;
    case 2:
    case 3:
    case 5:
    case 6:
      v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = 4;
      goto LABEL_7;
    case 4:
      v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = 3;
      goto LABEL_7;
    default:
      v19 = 0;
      goto LABEL_8;
  }
}

void __73__VTAssetManager__startDownloadingVoiceTriggerAsset_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 expectedTimeRemaining];
  if (v3 <= 0.0)
  {
    [*(id *)(a1 + 32) attachProgressCallBack:0];
  }
  else
  {
    double v4 = (double)[v6 totalWritten];
    if (v4 / (float)[v6 totalExpected] > 0.0)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      if (v5) {
        (*(void (**)(void))(v5 + 16))();
      }
    }
  }
}

void __73__VTAssetManager__startDownloadingVoiceTriggerAsset_progress_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    if (v2)
    {
      id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"VTAssetManager" code:2 userInfo:0];
      (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
    }
  }
  else if (v2)
  {
    double v3 = *(void (**)(uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4, 0);
  }
}

- (void)_downloadAsset:(id)a3 withComplete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "::: Start downloading asset", buf, 2u);
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46__VTAssetManager__downloadAsset_withComplete___block_invoke_302;
  v11[3] = &unk_264325A28;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(VTAssetManager *)self _startDownloadingVoiceTriggerAsset:v10 progress:&__block_literal_global_301 completion:v11];
}

void __46__VTAssetManager__downloadAsset_withComplete___block_invoke_302(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)VTLogContextFacilityVoiceTrigger;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = v4;
      id v7 = [v5 assetServerUrl];
      id v8 = [v3 localizedDescription];
      int v13 = 138543618;
      id v14 = v7;
      __int16 v15 = 2114;
      v16 = v8;
      _os_log_error_impl(&dword_21844F000, v6, OS_LOG_TYPE_ERROR, "::: Error downloading from %{public}@ with error %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *(void **)(a1 + 32);
      id v10 = v4;
      v11 = [v9 assetServerUrl];
      int v13 = 138543362;
      id v14 = v11;
      _os_log_impl(&dword_21844F000, v10, OS_LOG_TYPE_DEFAULT, "::: download completed successfully from %{public}@.", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) {
      (*(void (**)(void))(v12 + 16))();
    }
  }
}

void __46__VTAssetManager__downloadAsset_withComplete___block_invoke(double a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 134349056;
    double v4 = a1 * 100.0;
    _os_log_impl(&dword_21844F000, v2, OS_LOG_TYPE_DEFAULT, "::: download progress: %{public}3.0f%%", (uint8_t *)&v3, 0xCu);
  }
}

- (id)_defaultDownloadOptions
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    int v5 = 136446210;
    id v6 = "-[VTAssetManager _defaultDownloadOptions]";
    _os_log_impl(&dword_21844F000, v2, OS_LOG_TYPE_INFO, "::: %{public}s", (uint8_t *)&v5, 0xCu);
  }
  int v3 = objc_opt_new();
  [v3 setAllowsCellularAccess:0];
  [v3 setCanUseLocalCacheServer:1];

  return v3;
}

- (BOOL)_isReadyToUse
{
  uint64_t v2 = +[VTFirstUnlockMonitor sharedInstance];
  char v3 = [v2 isFirstUnlocked];

  return v3;
}

- (void)_runAssetQuery:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v16 = "-[VTAssetManager _runAssetQuery:completion:]";
    _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_INFO, "::: %{public}s", buf, 0xCu);
  }
  queue = self->_queue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__VTAssetManager__runAssetQuery_completion___block_invoke;
  v12[3] = &unk_264325C08;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, v12);
}

void __44__VTAssetManager__runAssetQuery_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136446466;
    id v9 = "-[VTAssetManager _runAssetQuery:completion:]_block_invoke";
    __int16 v10 = 2114;
    uint64_t v11 = v3;
    _os_log_impl(&dword_21844F000, v2, OS_LOG_TYPE_INFO, "::: %{public}s; query: %{public}@", buf, 0x16u);
  }
  kdebug_trace();
  double v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__VTAssetManager__runAssetQuery_completion___block_invoke_296;
  v5[3] = &unk_2643259E0;
  id v6 = v4;
  id v7 = *(id *)(a1 + 40);
  [v6 queryMetaData:v5];
}

void __44__VTAssetManager__runAssetQuery_completion___block_invoke_296(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a2
    || ([*(id *)(a1 + 32) results],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        !v7))
  {
    double v4 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      int v14 = 134349056;
      uint64_t v15 = a2;
      _os_log_error_impl(&dword_21844F000, v4, OS_LOG_TYPE_ERROR, "Error running asset query: error %{public}lu, or result is empty", (uint8_t *)&v14, 0xCu);
      uint64_t v5 = *(void *)(a1 + 40);
      if (!v5) {
        return;
      }
    }
    else
    {
      uint64_t v5 = *(void *)(a1 + 40);
      if (!v5) {
        return;
      }
    }
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    return;
  }
  id v8 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = *(void **)(a1 + 32);
    __int16 v10 = v8;
    uint64_t v11 = [v9 results];
    int v14 = 134349056;
    uint64_t v15 = [v11 count];
    _os_log_impl(&dword_21844F000, v10, OS_LOG_TYPE_DEFAULT, "Found %{public}lu assets", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12)
  {
    id v13 = [*(id *)(a1 + 32) results];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
  }
}

- (id)_assetQueryForLanguage:(id)a3 supportPremium:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v15 = "-[VTAssetManager _assetQueryForLanguage:supportPremium:]";
    _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_INFO, "::: %{public}s", buf, 0xCu);
  }
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F55958]) initWithType:@"com.apple.MobileAsset.VoiceTriggerAssets"];
  id v13 = v7;
  [(VTAssetManager *)self _addKeyValuePairForQuery:&v13];
  id v8 = v13;

  id v9 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    __int16 v10 = v9;
    uint64_t v11 = [v8 queryParams];
    *(_DWORD *)buf = 136446466;
    uint64_t v15 = "-[VTAssetManager _assetQueryForLanguage:supportPremium:]";
    __int16 v16 = 2114;
    uint64_t v17 = v11;
    _os_log_impl(&dword_21844F000, v10, OS_LOG_TYPE_INFO, "::: %{public}s, query: %{public}@", buf, 0x16u);
  }

  return v8;
}

- (id)_filteredAssetsForAssets:(id)a3 language:(id)a4 supportPremium:(BOOL)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    if (a5)
    {
      if (v8)
      {
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v30 != v12) {
              objc_enumerationMutation(v9);
            }
            int v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            uint64_t v15 = [v14 attributes];
            __int16 v16 = [v15 valueForKey:@"Languages"];
            if ([v16 containsObject:v8]) {
              [v28 addObject:v14];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v11);
      }
      else
      {
        do
        {
          for (uint64_t j = 0; j != v11; ++j)
          {
            if (*(void *)v30 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v18 = *(void **)(*((void *)&v29 + 1) + 8 * j);
            v19 = [v18 attributes];
            v20 = [v19 valueForKey:@"Languages"];
            [v28 addObject:v18];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v11);
      }
    }
    else
    {
      do
      {
        for (uint64_t k = 0; k != v11; ++k)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          v22 = *(void **)(*((void *)&v29 + 1) + 8 * k);
          id v23 = [v22 attributes];
          v24 = [v23 valueForKey:@"Languages"];
          id v25 = v24;
          if (!v8 || [v24 containsObject:v8])
          {
            id v26 = [v23 objectForKey:@"Footprint"];
            if (v26 != @"Premium") {
              [v28 addObject:v22];
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v11);
    }
  }

  return v28;
}

- (void)_addKeyValuePairForQuery:(id *)a3
{
  uint64_t v3 = *MEMORY[0x263F55870];
  double v4 = NSString;
  id v5 = *a3;
  objc_msgSend(v4, "stringWithFormat:", @"%d", 13);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 addKeyValuePair:v3 with:v6];
}

- (id)_findLatestInstalledAsset:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    id v6 = 0;
    uint64_t v7 = *(void *)v21;
    *(void *)&long long v4 = 134349056;
    long long v18 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        unint64_t v10 = objc_msgSend(v9, "state", v18);
        uint64_t v11 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          unint64_t v25 = v10;
          _os_log_impl(&dword_21844F000, v11, OS_LOG_TYPE_DEFAULT, "Asset state : %{public}ld", buf, 0xCu);
        }
        if (v10 <= 6 && ((1 << v10) & 0x6C) != 0)
        {
          if (v6)
          {
            if ([v9 isLatestCompareTo:v6])
            {
              id v13 = v9;

              id v6 = v13;
            }
          }
          else
          {
            id v6 = v9;
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }
  int v14 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = v14;
    __int16 v16 = [v6 attributes];
    *(_DWORD *)buf = 138543362;
    unint64_t v25 = (unint64_t)v16;
    _os_log_impl(&dword_21844F000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  return v6;
}

- (void)_updateFromRemoteToLocalAssets:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v29 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  p_superclass = VTFirstUnlockMonitor.superclass;
  id v6 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v6, OS_LOG_TYPE_DEFAULT, "::: Fetching remote asset", buf, 2u);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    id v11 = 0;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v7);
        }
        int v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (v11)
        {
          if ([*(id *)(*((void *)&v34 + 1) + 8 * i) isLatestCompareTo:v11])
          {
            id v15 = v14;

            id v11 = v15;
          }
        }
        else
        {
          id v11 = v14;
        }
        if ([v14 isVTAssetInstalled])
        {
          if (v10)
          {
            if ([v14 isLatestCompareTo:v10])
            {
              id v16 = v14;

              id v10 = v16;
            }
          }
          else
          {
            id v10 = v14;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v41 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
    id v11 = 0;
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v17 = v7;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(id *)(*((void *)&v30 + 1) + 8 * j);
        if (v22 != v11 && v22 != v10)
        {
          if ([*(id *)(*((void *)&v30 + 1) + 8 * j) isDownloading])
          {
            [v22 cancelDownloadSync];
          }
          else if ([v22 canBePurged])
          {
            v24 = p_superclass[244];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v25 = v24;
              [v22 path];
              v27 = id v26 = p_superclass;
              *(_DWORD *)buf = 138543362;
              v39 = v27;
              _os_log_impl(&dword_21844F000, v25, OS_LOG_TYPE_DEFAULT, "::: Purging installed asset : %{public}@", buf, 0xCu);

              p_superclass = v26;
            }
            [v22 purgeSync];
          }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v19);
  }

  if (v11 && v11 != v10)
  {
    id v28 = p_superclass[244];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21844F000, v28, OS_LOG_TYPE_DEFAULT, "::: Request downloading remote asset", buf, 2u);
    }
    [(VTAssetManager *)v29 _downloadAsset:v11 withComplete:&__block_literal_global_288];
  }
}

void __49__VTAssetManager__updateFromRemoteToLocalAssets___block_invoke()
{
  id v0 = +[VTAssetMonitor sharedInstance];
  [v0 notifyNewAssetDownloaded];
}

- (void)_fetchRemoteAssetForLanguage:(id)a3 supportPremium:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "::: Request fetching remote asset", buf, 2u);
  }
  uint64_t v8 = [(VTAssetManager *)self _assetQueryForLanguage:v6 supportPremium:v4];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__VTAssetManager__fetchRemoteAssetForLanguage_supportPremium___block_invoke;
  v11[3] = &unk_2643259B8;
  void v11[4] = self;
  id v12 = v8;
  id v13 = v6;
  BOOL v14 = v4;
  id v9 = v6;
  id v10 = v8;
  [v10 queryMetaData:v11];
}

void __62__VTAssetManager__fetchRemoteAssetForLanguage_supportPremium___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(NSObject **)(v3 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__VTAssetManager__fetchRemoteAssetForLanguage_supportPremium___block_invoke_2;
  block[3] = &unk_264325990;
  uint64_t v8 = a2;
  block[4] = v3;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  char v9 = *(unsigned char *)(a1 + 56);
  dispatch_async(v4, block);
}

void __62__VTAssetManager__fetchRemoteAssetForLanguage_supportPremium___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      int v9 = 134349056;
      uint64_t v10 = v1;
      _os_log_error_impl(&dword_21844F000, v2, OS_LOG_TYPE_ERROR, "Failed to finish query with error %{public}lu", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    BOOL v4 = *(void **)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) results];
    id v6 = [v4 _filteredAssetsForAssets:v5 language:*(void *)(a1 + 48) supportPremium:*(unsigned __int8 *)(a1 + 64)];

    id v7 = (void *)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v7;
      int v9 = 134349056;
      uint64_t v10 = [v6 count];
      _os_log_impl(&dword_21844F000, v8, OS_LOG_TYPE_DEFAULT, "::: found %{public}lu assets", (uint8_t *)&v9, 0xCu);
    }
    [*(id *)(a1 + 32) _updateFromRemoteToLocalAssets:v6];
  }
}

- (void)_fetchRemoteMetaData
{
  uint64_t v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "::: Request Fetching RemoteMetaData", buf, 2u);
  }
  BOOL v4 = (void *)MEMORY[0x263F55940];
  uint64_t v5 = [(VTAssetManager *)self _defaultDownloadOptions];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__VTAssetManager__fetchRemoteMetaData__block_invoke;
  v6[3] = &unk_264325968;
  v6[4] = self;
  [v4 startCatalogDownload:@"com.apple.MobileAsset.VoiceTriggerAssets" options:v5 then:v6];
}

void __38__VTAssetManager__fetchRemoteMetaData__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = VTLogContextFacilityVoiceTrigger;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      int v6 = 134349056;
      uint64_t v7 = a2;
      _os_log_error_impl(&dword_21844F000, v2, OS_LOG_TYPE_ERROR, "Failed to download meta data with error %{public}lu", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_21844F000, v2, OS_LOG_TYPE_DEFAULT, "Meta data downloaded successfully", (uint8_t *)&v6, 2u);
    }
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_assetQueryForLanguage:supportPremium:", 0, +[VTUtilities supportPremiumAssets](VTUtilities, "supportPremiumAssets"));
    [*(id *)(a1 + 32) _runAssetQuery:v5 completion:0];
  }
}

- (id)_installedAssetWithoutMetaDataForLanguage:(id)a3 supportPremium:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(VTAssetManager *)self _assetQueryForLanguage:v6 supportPremium:v4];
  [v7 returnTypes:2];
  uint64_t v8 = [v7 queryMetaDataSync];
  int v9 = [v7 results];
  uint64_t v10 = [(VTAssetManager *)self _filteredAssetsForAssets:v9 language:v6 supportPremium:v4];

  uint64_t v11 = VTLogContextFacilityVoiceTrigger;
  if ((v8 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543618;
      uint64_t v16 = (uint64_t)v7;
      __int16 v17 = 2050;
      uint64_t v18 = v8;
      _os_log_error_impl(&dword_21844F000, v11, OS_LOG_TYPE_ERROR, "Error running asset-query : %{public}@, error: %{public}lu", (uint8_t *)&v15, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    int v15 = 134349312;
    uint64_t v16 = [v10 count];
    __int16 v17 = 2050;
    uint64_t v18 = v8;
    _os_log_impl(&dword_21844F000, v12, OS_LOG_TYPE_DEFAULT, "::: found %{public}lu assets with error %{public}lu", (uint8_t *)&v15, 0x16u);
  }
  id v13 = [(VTAssetManager *)self _findLatestInstalledAsset:v10];

  return v13;
}

- (id)_installedAssetForLanguage:(id)a3 supportPremium:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(VTAssetManager *)self _assetQueryForLanguage:v6 supportPremium:v4];
  uint64_t v8 = [v7 queryMetaDataSync];
  int v9 = [v7 results];
  uint64_t v10 = [(VTAssetManager *)self _filteredAssetsForAssets:v9 language:v6 supportPremium:v4];

  if (v8 == 2)
  {
    BOOL v14 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_error_impl(&dword_21844F000, v14, OS_LOG_TYPE_ERROR, "::: Meta data not available, query again with returnType MAUnionOfCatalogInstalled", (uint8_t *)&v17, 2u);
    }
    id v13 = [(VTAssetManager *)self _installedAssetWithoutMetaDataForLanguage:v6 supportPremium:v4];
  }
  else if (v8)
  {
    int v15 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543618;
      uint64_t v18 = (uint64_t)v7;
      __int16 v19 = 2050;
      uint64_t v20 = v8;
      _os_log_error_impl(&dword_21844F000, v15, OS_LOG_TYPE_ERROR, "Error running asset-query : %{public}@, error: %{public}lu", (uint8_t *)&v17, 0x16u);
    }
    id v13 = 0;
  }
  else
  {
    uint64_t v11 = (void *)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      int v17 = 134349056;
      uint64_t v18 = [v10 count];
      _os_log_impl(&dword_21844F000, v12, OS_LOG_TYPE_DEFAULT, "::: found %{public}lu assets", (uint8_t *)&v17, 0xCu);
    }
    id v13 = [(VTAssetManager *)self _findLatestInstalledAsset:v10];
  }

  return v13;
}

- (id)installedAssetForLanguage:(id)a3
{
  id v4 = a3;
  if ([(VTAssetManager *)self _isReadyToUse])
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    BOOL v14 = __Block_byref_object_copy__4632;
    int v15 = __Block_byref_object_dispose__4633;
    id v16 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__VTAssetManager_installedAssetForLanguage___block_invoke;
    block[3] = &unk_264325940;
    uint64_t v10 = &v11;
    block[4] = self;
    id v9 = v4;
    dispatch_sync(queue, block);
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __44__VTAssetManager_installedAssetForLanguage___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_installedAssetForLanguage:supportPremium:", *(void *)(a1 + 40), +[VTUtilities supportPremiumAssets](VTUtilities, "supportPremiumAssets"));

  return MEMORY[0x270F9A758]();
}

- (id)assetForLanguage:(id)a3
{
  id v4 = a3;
  if ([(VTAssetManager *)self _isReadyToUse])
  {
    uint64_t v5 = [(VTAssetManager *)self installedAssetForLanguage:v4];
    queue = self->_queue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __35__VTAssetManager_assetForLanguage___block_invoke;
    v8[3] = &unk_264325FF0;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(queue, v8);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __35__VTAssetManager_assetForLanguage___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  BOOL v3 = +[VTUtilities supportPremiumAssets];

  return [v1 _fetchRemoteAssetForLanguage:v2 supportPremium:v3];
}

- (VTAssetManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)VTAssetManager;
  uint64_t v2 = [(VTAssetManager *)&v13 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("Serial VTAsset queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_alloc_init(VTAssetManagerEnablePolicy);
    enablePolicy = v2->_enablePolicy;
    v2->_enablePolicy = &v5->super;

    if ([(VTPolicy *)v2->_enablePolicy isEnabled])
    {
      uint64_t v7 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "VTAssetManagerEnablePolicy is already enabled, fetching remote meta data now", (uint8_t *)buf, 2u);
      }
      [(VTAssetManager *)v2 _fetchRemoteMetaData];
    }
    else
    {
      objc_initWeak(buf, v2);
      uint64_t v8 = v2->_enablePolicy;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __22__VTAssetManager_init__block_invoke;
      v10[3] = &unk_264325F28;
      objc_copyWeak(&v11, buf);
      [(VTPolicy *)v8 setCallback:v10];
      objc_destroyWeak(&v11);
      objc_destroyWeak(buf);
    }
    _MAMigrateAssets();
    _MACleanV1Repository();
  }
  return v2;
}

void __22__VTAssetManager_init__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    id v4 = WeakRetained;
    [WeakRetained _fetchRemoteMetaData];
    id WeakRetained = v4;
  }
}

+ (id)sharedInstance
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    int v5 = 136446210;
    id v6 = "+[VTAssetManager sharedInstance]";
    _os_log_impl(&dword_21844F000, v2, OS_LOG_TYPE_INFO, "::: %{public}s", (uint8_t *)&v5, 0xCu);
  }
  if (sharedInstance_onceToken_4641 != -1) {
    dispatch_once(&sharedInstance_onceToken_4641, &__block_literal_global_4642);
  }
  dispatch_queue_t v3 = (void *)sharedInstance_sSharedAssetManager;

  return v3;
}

uint64_t __32__VTAssetManager_sharedInstance__block_invoke()
{
  sharedInstance_sSharedAssetManager = objc_alloc_init(VTAssetManager);

  return MEMORY[0x270F9A758]();
}

@end