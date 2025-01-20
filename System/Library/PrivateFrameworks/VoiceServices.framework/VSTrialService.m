@interface VSTrialService
+ (VSTrialService)sharedService;
+ (id)defaultDownloadOptions;
+ (id)versionFactorNameWithFactorName:(id)a3;
- (NSArray)cachedResources;
- (NSArray)cachedVoices;
- (NSLock)clientRefreshLock;
- (OS_dispatch_queue)downloadQueue;
- (TRIClient)triClient;
- (TRINotificationToken)trialNotificationToken;
- (VSTrialService)init;
- (id)_definedVoicesWithLanguage:(id)a3 name:(id)a4 type:(int64_t)a5 footprint:(int64_t)a6;
- (id)_directoryOfFactorName:(id)a3;
- (id)_fileOfFactorName:(id)a3;
- (id)definedVoiceResourcesWithLanguage:(id)a3;
- (id)definedVoicesWithAssets:(id)a3;
- (id)definedVoicesWithLanguage:(id)a3 name:(id)a4 type:(int64_t)a5 footprint:(int64_t)a6;
- (id)selectVoiceResourceWithLanguage:(id)a3;
- (id)selectVoiceWithLanguage:(id)a3 name:(id)a4 type:(int64_t)a5 footprint:(int64_t)a6;
- (void)_downloadFactorName:(id)a3 withOptions:(id)a4 progress:(id)a5 completion:(id)a6;
- (void)_removeAssetWithFactorName:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)downloadNamespaceImmediatelyIfNeededWithOption:(id)a3 completion:(id)a4;
- (void)downloadVoice:(id)a3 withOptions:(id)a4 progress:(id)a5 completion:(id)a6;
- (void)downloadVoiceResource:(id)a3 withOptions:(id)a4 progress:(id)a5 completion:(id)a6;
- (void)refreshTrialClient;
- (void)removeVoice:(id)a3 completion:(id)a4;
- (void)removeVoiceResource:(id)a3 completion:(id)a4;
- (void)setCachedResources:(id)a3;
- (void)setCachedVoices:(id)a3;
- (void)setClientRefreshLock:(id)a3;
- (void)setDownloadQueue:(id)a3;
- (void)setTriClient:(id)a3;
- (void)setTrialNotificationToken:(id)a3;
@end

@implementation VSTrialService

- (id)definedVoicesWithLanguage:(id)a3 name:(id)a4 type:(int64_t)a5 footprint:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = [(TRIClient *)self->_triClient rolloutIdentifiersWithNamespaceName:@"SIRI_TEXT_TO_SPEECH"];

  if (v12)
  {
    v13 = [(VSTrialService *)self _definedVoicesWithLanguage:v10 name:v11 type:a5 footprint:a6];
  }
  else
  {
    v13 = (void *)MEMORY[0x263EFFA68];
  }

  return v13;
}

- (id)_definedVoicesWithLanguage:(id)a3 name:(id)a4 type:(int64_t)a5 footprint:(int64_t)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v24 = a3;
  id v10 = a4;
  id v11 = [(VSTrialService *)self cachedVoices];
  id v23 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ((!a5 || [*(id *)(*((void *)&v25 + 1) + 8 * i) type] == a5)
          && (!a6 || [v17 footprint] == a6))
        {
          if (!v10
            || ([v17 name],
                v18 = objc_claimAutoreleasedReturnValue(),
                int v19 = [v10 isEqualToString:v18],
                v18,
                v19))
          {
            if (!v24
              || ([v17 language],
                  v20 = objc_claimAutoreleasedReturnValue(),
                  int v21 = [v24 isEqualToString:v20],
                  v20,
                  v21))
            {
              objc_msgSend(v23, "addObject:", v17, v23);
            }
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }

  return v23;
}

- (NSArray)cachedVoices
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(NSLock *)self->_clientRefreshLock lock];
  v3 = self->_cachedVoices;
  if (!v3)
  {
    v3 = [MEMORY[0x263EFF980] array];
    v4 = [(TRIClient *)self->_triClient factorLevelsWithNamespaceName:@"SIRI_TEXT_TO_SPEECH"];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
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
          v9 = [[VSTrialVoice alloc] initWithFactorLevel:*(void *)(*((void *)&v11 + 1) + 8 * i)];
          if (v9) {
            [(NSArray *)v3 addObject:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
    objc_storeStrong((id *)&self->_cachedVoices, v3);
  }
  [(NSLock *)self->_clientRefreshLock unlock];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientRefreshLock, 0);
  objc_storeStrong((id *)&self->_downloadQueue, 0);
  objc_storeStrong((id *)&self->_trialNotificationToken, 0);
  objc_storeStrong((id *)&self->_cachedResources, 0);
  objc_storeStrong((id *)&self->_cachedVoices, 0);
  objc_storeStrong((id *)&self->_triClient, 0);
}

- (void)setClientRefreshLock:(id)a3
{
}

- (NSLock)clientRefreshLock
{
  return self->_clientRefreshLock;
}

- (void)setDownloadQueue:(id)a3
{
}

- (OS_dispatch_queue)downloadQueue
{
  return self->_downloadQueue;
}

- (void)setTrialNotificationToken:(id)a3
{
}

- (TRINotificationToken)trialNotificationToken
{
  return self->_trialNotificationToken;
}

- (void)setCachedResources:(id)a3
{
}

- (void)setCachedVoices:(id)a3
{
}

- (void)setTriClient:(id)a3
{
}

- (TRIClient)triClient
{
  return self->_triClient;
}

- (void)_removeAssetWithFactorName:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = VSGetLogEvent();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v6;
    _os_log_impl(&dword_20CABC000, v8, OS_LOG_TYPE_DEFAULT, "#Trial Removing asset with factor name: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  triClient = self->_triClient;
  id v17 = v6;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__VSTrialService__removeAssetWithFactorName_completion___block_invoke;
  v13[3] = &unk_2640E8E78;
  id v11 = v6;
  id v14 = v11;
  objc_copyWeak(&v16, (id *)buf);
  id v12 = v7;
  id v15 = v12;
  [(TRIClient *)triClient removeLevelsForFactors:v10 withNamespace:@"SIRI_TEXT_TO_SPEECH" queue:0 completion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __56__VSTrialService__removeAssetWithFactorName_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    id v6 = VSGetLogEvent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v11 = 138412290;
      uint64_t v12 = v7;
      _os_log_impl(&dword_20CABC000, v6, OS_LOG_TYPE_DEFAULT, "#Trial Removed asset with factor name: %@", (uint8_t *)&v11, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained refreshTrialClient];
  }
  else
  {
    WeakRetained = VSGetLogDefault();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_error_impl(&dword_20CABC000, WeakRetained, OS_LOG_TYPE_ERROR, "#Trial Unable to remove asset with factor name '%@', error: %@", (uint8_t *)&v11, 0x16u);
    }
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v5);
  }
}

- (void)_downloadFactorName:(id)a3 withOptions:(id)a4 progress:(id)a5 completion:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = VSGetLogEvent();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v30 = v10;
    __int16 v31 = 1024;
    int v32 = [v11 allowDiscretionary];
    __int16 v33 = 1024;
    int v34 = [v11 allowCellularData];
    _os_log_impl(&dword_20CABC000, v14, OS_LOG_TYPE_DEFAULT, "#Trial Downloading asset with factor name: %@, discretionary:%d, allowCellular:%d", buf, 0x18u);
  }

  if (v11)
  {
    id v15 = objc_alloc_init(MEMORY[0x263F80E28]);
    objc_msgSend(v15, "setAllowsCellularAccess:", objc_msgSend(v11, "allowCellularData"));
    if ([v11 allowDiscretionary]) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = 0;
    }
    [v15 setDiscretionaryBehavior:v16];
  }
  else
  {
    id v15 = +[VSTrialService defaultDownloadOptions];
  }
  objc_initWeak((id *)buf, self);
  triClient = self->_triClient;
  id v28 = v10;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __70__VSTrialService__downloadFactorName_withOptions_progress_completion___block_invoke;
  v26[3] = &unk_2640E8E50;
  id v19 = v12;
  id v27 = v19;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __70__VSTrialService__downloadFactorName_withOptions_progress_completion___block_invoke_2;
  v22[3] = &unk_2640E8E78;
  id v20 = v10;
  id v23 = v20;
  objc_copyWeak(&v25, (id *)buf);
  id v21 = v13;
  id v24 = v21;
  [(TRIClient *)triClient downloadLevelsForFactors:v18 withNamespace:@"SIRI_TEXT_TO_SPEECH" queue:0 options:v15 progress:v26 completion:v22];

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

uint64_t __70__VSTrialService__downloadFactorName_withOptions_progress_completion___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(float))(result + 16))((float)a2 / 100.0);
  }
  return result;
}

void __70__VSTrialService__downloadFactorName_withOptions_progress_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    id v6 = VSGetLogEvent();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v11 = 138412290;
      uint64_t v12 = v7;
      _os_log_impl(&dword_20CABC000, v6, OS_LOG_TYPE_DEFAULT, "#Trial Downloaded asset with factor name: %@", (uint8_t *)&v11, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained refreshTrialClient];
  }
  else
  {
    WeakRetained = VSGetLogDefault();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_error_impl(&dword_20CABC000, WeakRetained, OS_LOG_TYPE_ERROR, "#Trial Unable to download asset with factor name: %@, error: %@", (uint8_t *)&v11, 0x16u);
    }
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v5);
  }
}

- (void)downloadNamespaceImmediatelyIfNeededWithOption:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  downloadQueue = self->_downloadQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__VSTrialService_downloadNamespaceImmediatelyIfNeededWithOption_completion___block_invoke;
  block[3] = &unk_2640E8E28;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(downloadQueue, block);
}

void __76__VSTrialService_downloadNamespaceImmediatelyIfNeededWithOption_completion___block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) rolloutIdentifiersWithNamespaceName:@"SIRI_TEXT_TO_SPEECH"];
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else if ([*(id *)(a1 + 40) allowDiscretionary])
  {
    v3 = VSGetLogDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CABC000, v3, OS_LOG_TYPE_DEFAULT, "Skip immediate namespace download due to discretionary download option.", buf, 2u);
    }

    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F08320];
    v21[0] = @"immediateDownloadForNamespaceNames cannot use discretionary download option.";
    id v6 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v7 = [v5 errorWithDomain:@"VSTrialServiceErrorDomain" code:3 userInfo:v6];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v7);
  }
  else
  {
    v8 = [MEMORY[0x263EFFA08] setWithObject:@"SIRI_TEXT_TO_SPEECH"];
    id v9 = VSGetLogDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20CABC000, v9, OS_LOG_TYPE_DEFAULT, "#Trial Start downloading SIRI_TEXT_TO_SPEECH namespace.", buf, 2u);
    }

    id v10 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v11 = [*(id *)(a1 + 40) allowCellularData];
    id v17 = 0;
    char v12 = [v10 immediateDownloadForNamespaceNames:v8 allowExpensiveNetworking:v11 error:&v17];
    id v13 = v17;
    id v14 = VSGetLogDefault();
    uint64_t v15 = v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20CABC000, v15, OS_LOG_TYPE_DEFAULT, "#Trial Finished downloading SIRI_TEXT_TO_SPEECH namespace.", buf, 2u);
      }

      [*(id *)(a1 + 32) refreshTrialClient];
      uint64_t v16 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v13;
        _os_log_error_impl(&dword_20CABC000, v15, OS_LOG_TYPE_ERROR, "#Trial Unable to download Trial namespace. Error: %@", buf, 0xCu);
      }

      uint64_t v16 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    v16();
  }
}

- (id)_fileOfFactorName:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(TRIClient *)self->_triClient levelForFactor:v4 withNamespaceName:@"SIRI_TEXT_TO_SPEECH"];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 fileValue];
    if (v7)
    {
      v8 = v7;
      if ([v7 hasPath])
      {
        id v9 = [v8 path];
        uint64_t v10 = [v9 length];

        if (v10)
        {
          v8 = v8;
          uint64_t v11 = v8;
          goto LABEL_15;
        }
      }
      char v12 = VSGetLogDefault();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        id v16 = v4;
        _os_log_impl(&dword_20CABC000, v12, OS_LOG_TYPE_INFO, "#Trial Factor '%@' is not downloaded yet.", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      id v13 = VSGetLogDefault();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412290;
        id v16 = v4;
        _os_log_error_impl(&dword_20CABC000, v13, OS_LOG_TYPE_ERROR, "#Trial Factor '%@' doesn't seem to be a file.", (uint8_t *)&v15, 0xCu);
      }

      v8 = 0;
    }
  }
  else
  {
    v8 = VSGetLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v4;
      _os_log_error_impl(&dword_20CABC000, v8, OS_LOG_TYPE_ERROR, "#Trial Unable to find asset for factor name '%@'.", (uint8_t *)&v15, 0xCu);
    }
  }
  uint64_t v11 = 0;
LABEL_15:

  return v11;
}

- (id)_directoryOfFactorName:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(TRIClient *)self->_triClient levelForFactor:v4 withNamespaceName:@"SIRI_TEXT_TO_SPEECH"];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 directoryValue];
    if (v7)
    {
      v8 = v7;
      if ([v7 hasPath])
      {
        id v9 = [v8 path];
        uint64_t v10 = [v9 length];

        if (v10)
        {
          v8 = v8;
          uint64_t v11 = v8;
          goto LABEL_15;
        }
      }
      char v12 = VSGetLogDefault();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        id v16 = v4;
        _os_log_impl(&dword_20CABC000, v12, OS_LOG_TYPE_INFO, "#Trial Factor '%@' is not downloaded yet.", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      id v13 = VSGetLogDefault();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412290;
        id v16 = v4;
        _os_log_error_impl(&dword_20CABC000, v13, OS_LOG_TYPE_ERROR, "#Trial Factor '%@' doesn't seem to be directory.", (uint8_t *)&v15, 0xCu);
      }

      v8 = 0;
    }
  }
  else
  {
    v8 = VSGetLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v4;
      _os_log_error_impl(&dword_20CABC000, v8, OS_LOG_TYPE_ERROR, "#Trial Unable to find asset for factor name '%@'.", (uint8_t *)&v15, 0xCu);
    }
  }
  uint64_t v11 = 0;
LABEL_15:

  return v11;
}

- (NSArray)cachedResources
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [(NSLock *)self->_clientRefreshLock lock];
  v3 = self->_cachedResources;
  if (![(NSArray *)v3 count])
  {
    id v4 = [MEMORY[0x263EFF980] array];
    id v5 = [(TRIClient *)self->_triClient factorLevelsWithNamespaceName:@"SIRI_TEXT_TO_SPEECH"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [[VSTrialVoiceResource alloc] initWithFactorLevel:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          if (v10) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
    uint64_t v11 = v4;

    cachedResources = self->_cachedResources;
    self->_cachedResources = v11;

    v3 = v11;
  }
  [(NSLock *)self->_clientRefreshLock unlock];
  return v3;
}

- (void)refreshTrialClient
{
  [(TRIClient *)self->_triClient refresh];
  [(NSLock *)self->_clientRefreshLock lock];
  cachedVoices = self->_cachedVoices;
  self->_cachedVoices = 0;

  cachedResources = self->_cachedResources;
  self->_cachedResources = 0;

  clientRefreshLock = self->_clientRefreshLock;
  [(NSLock *)clientRefreshLock unlock];
}

- (void)dealloc
{
  [(TRIClient *)self->_triClient removeUpdateHandlerForToken:self->_trialNotificationToken];
  v3.receiver = self;
  v3.super_class = (Class)VSTrialService;
  [(VSTrialService *)&v3 dealloc];
}

- (VSTrialService)init
{
  v16.receiver = self;
  v16.super_class = (Class)VSTrialService;
  v2 = [(VSTrialService *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F80E20] clientWithIdentifier:118];
    triClient = v2->_triClient;
    v2->_triClient = (TRIClient *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("VSTrialService.downloadQueue", 0);
    downloadQueue = v2->_downloadQueue;
    v2->_downloadQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    clientRefreshLock = v2->_clientRefreshLock;
    v2->_clientRefreshLock = v7;

    objc_initWeak(&location, v2);
    id v9 = v2->_triClient;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __22__VSTrialService_init__block_invoke;
    v13[3] = &unk_2640E8DE0;
    objc_copyWeak(&v14, &location);
    uint64_t v10 = [(TRIClient *)v9 addUpdateHandlerForNamespaceName:@"SIRI_TEXT_TO_SPEECH" usingBlock:v13];
    trialNotificationToken = v2->_trialNotificationToken;
    v2->_trialNotificationToken = (TRINotificationToken *)v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __22__VSTrialService_init__block_invoke(uint64_t a1)
{
  v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_20CABC000, v2, OS_LOG_TYPE_DEFAULT, "#Trial Received namespace 'SIRI_TEXT_TO_SPEECH' update", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained refreshTrialClient];
}

+ (id)defaultDownloadOptions
{
  id v2 = objc_alloc_init(MEMORY[0x263F80E28]);
  [v2 setAllowsCellularAccess:0];
  [v2 setDiscretionaryBehavior:0];
  return v2;
}

+ (id)versionFactorNameWithFactorName:(id)a3
{
  return (id)[a3 stringByAppendingString:@".version"];
}

+ (VSTrialService)sharedService
{
  if (sharedService_onceToken != -1) {
    dispatch_once(&sharedService_onceToken, &__block_literal_global_4015);
  }
  id v2 = (void *)sharedService___sharedService;
  return (VSTrialService *)v2;
}

void __31__VSTrialService_sharedService__block_invoke()
{
  v0 = objc_alloc_init(VSTrialService);
  v1 = (void *)sharedService___sharedService;
  sharedService___sharedService = (uint64_t)v0;
}

- (void)removeVoiceResource:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 factorName];
  [(VSTrialService *)self _removeAssetWithFactorName:v7 completion:v6];
}

- (void)downloadVoiceResource:(id)a3 withOptions:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [a3 factorName];
  [(VSTrialService *)self _downloadFactorName:v13 withOptions:v12 progress:v11 completion:v10];
}

- (id)selectVoiceResourceWithLanguage:(id)a3
{
  if (a3)
  {
    uint64_t v3 = -[VSTrialService definedVoiceResourcesWithLanguage:](self, "definedVoiceResourcesWithLanguage:");
    if ((unint64_t)[v3 count] >= 2)
    {
      id v4 = VSGetLogDefault();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_fault_impl(&dword_20CABC000, v4, OS_LOG_TYPE_FAULT, "Unexpected multiple resources from Trial.", v8, 2u);
      }
    }
    dispatch_queue_t v5 = [v3 firstObject];
    if ([v5 isLocal]) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)definedVoiceResourcesWithLanguage:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_queue_t v5 = [(TRIClient *)self->_triClient rolloutIdentifiersWithNamespaceName:@"SIRI_TEXT_TO_SPEECH"];

  if (v5)
  {
    id v6 = [(VSTrialService *)self cachedResources];
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if (v4)
          {
            id v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "language", (void)v18);
            int v15 = [v14 isEqualToString:v4];

            if (!v15) {
              continue;
            }
          }
          objc_msgSend(v7, "addObject:", v13, (void)v18);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v10);
    }

    if (![v7 count])
    {
      objc_super v16 = VSGetLogDefault();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v4;
        _os_log_fault_impl(&dword_20CABC000, v16, OS_LOG_TYPE_FAULT, "#Trial Cannot find any Trial resource for language %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x263EFFA68];
  }

  return v7;
}

- (void)removeVoice:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 factorName];
  [(VSTrialService *)self _removeAssetWithFactorName:v7 completion:v6];
}

- (void)downloadVoice:(id)a3 withOptions:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [a3 factorName];
  [(VSTrialService *)self _downloadFactorName:v13 withOptions:v12 progress:v11 completion:v10];
}

- (id)selectVoiceWithLanguage:(id)a3 name:(id)a4 type:(int64_t)a5 footprint:(int64_t)a6
{
  id v6 = 0;
  if (a3 && a4 && a5 && a6)
  {
    id v7 = -[VSTrialService definedVoicesWithLanguage:name:type:footprint:](self, "definedVoicesWithLanguage:name:type:footprint:");
    if ((unint64_t)[v7 count] >= 2)
    {
      id v8 = VSGetLogDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_fault_impl(&dword_20CABC000, v8, OS_LOG_TYPE_FAULT, "Unexpected multiple voices.", v11, 2u);
      }
    }
    uint64_t v9 = [v7 firstObject];
    if ([v9 isLocal]) {
      id v6 = v9;
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

- (id)definedVoicesWithAssets:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_queue_t v5 = [(TRIClient *)self->_triClient rolloutIdentifiersWithNamespaceName:@"SIRI_TEXT_TO_SPEECH"];

  if (v5)
  {
    id v6 = [MEMORY[0x263EFF980] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v17 = v4;
    id obj = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v12 = objc_msgSend(v11, "languages", v17);
          id v13 = [v12 firstObject];
          id v14 = [v11 name];
          int v15 = -[VSTrialService _definedVoicesWithLanguage:name:type:footprint:](self, "_definedVoicesWithLanguage:name:type:footprint:", v13, v14, [v11 type], objc_msgSend(v11, "footprint"));
          [v6 addObjectsFromArray:v15];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }

    id v4 = v17;
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

@end