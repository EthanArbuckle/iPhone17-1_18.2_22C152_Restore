@interface PSGExperimentResolver
+ (PSGExperimentResolver)sharedInstance;
+ (id)sharedWordBoundaryQueue;
+ (id)sharedZKWQueue;
- (NSDictionary)wordBoundaryLangAndNamespaces;
- (NSDictionary)zkwLangAndNamespaces;
- (PSGExperimentResolver)init;
- (id)_getDefaultResponseSuggestionsExperimentConfig:(id)a3;
- (id)_getDefaultWordBoundarySuggestionsExperimentConfig:(id)a3;
- (id)getResponseSuggestionsExperimentConfig:(id)a3;
- (id)getResponseSuggestionsExperimentConfig:(id)a3 shouldDownloadAssets:(BOOL)a4;
- (id)getWordBoundarySuggestionsExperimentConfig:(id)a3;
- (id)getWordBoundarySuggestionsExperimentConfig:(id)a3 shouldDownloadAssets:(BOOL)a4;
- (void)warmupForLocale:(id)a3;
@end

@implementation PSGExperimentResolver

uint64_t __89__PSGExperimentResolver_getWordBoundarySuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 objectForKey:*(void *)(a1 + 32)];
  return MEMORY[0x270F9A758]();
}

uint64_t __85__PSGExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 objectForKey:*(void *)(a1 + 32)];
  return MEMORY[0x270F9A758]();
}

uint64_t __89__PSGExperimentResolver_getWordBoundarySuggestionsExperimentConfig_shouldDownloadAssets___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 objectForKey:*(void *)(a1 + 32)];
  return MEMORY[0x270F9A758]();
}

uint64_t __85__PSGExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 objectForKey:*(void *)(a1 + 32)];
  return MEMORY[0x270F9A758]();
}

void __89__PSGExperimentResolver_getWordBoundarySuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[2];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __89__PSGExperimentResolver_getWordBoundarySuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_3;
    v15[3] = &unk_265037FC8;
    long long v11 = *(_OWORD *)(a1 + 32);
    id v5 = (id)v11;
    long long v16 = v11;
    [v4 runWithLockAcquired:v15];
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      v6 = [[PSGWordBoundarySuggestionsExpConfig alloc] initWithNamespaceName:*(void *)(a1 + 32) withTrialClient:v3[3] shouldDownloadAssets:*(unsigned __int8 *)(a1 + 56)];
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      uint64_t v9 = *(void *)(a1 + 40);
      if (*(void *)(*(void *)(v9 + 8) + 40))
      {
        v10 = (void *)v3[2];
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __89__PSGExperimentResolver_getWordBoundarySuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_4;
        v12[3] = &unk_265037FC8;
        uint64_t v14 = v9;
        id v13 = *(id *)(a1 + 32);
        [v10 runWithLockAcquired:v12];
      }
    }
  }
}

void __85__PSGExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[1];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __85__PSGExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_3;
    v13[3] = &unk_265037FC8;
    uint64_t v15 = *(void *)(a1 + 48);
    id v14 = *(id *)(a1 + 32);
    [v4 runWithLockAcquired:v13];
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      id v5 = [[PSGResponseSuggestionsExpConfig alloc] initWithNamespaceName:*(void *)(a1 + 32) withLanguage:*(void *)(a1 + 40) withTrialClient:v3[3] shouldDownloadAssets:*(unsigned __int8 *)(a1 + 64)];
      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      uint64_t v8 = *(void *)(a1 + 48);
      if (*(void *)(*(void *)(v8 + 8) + 40))
      {
        uint64_t v9 = (void *)v3[1];
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __85__PSGExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_4;
        v10[3] = &unk_265037FC8;
        uint64_t v12 = v8;
        id v11 = *(id *)(a1 + 32);
        [v9 runWithLockAcquired:v10];
      }
    }
  }
}

- (void)warmupForLocale:(id)a3
{
  id v6 = a3;
  id v4 = [(PSGExperimentResolver *)self getWordBoundarySuggestionsExperimentConfig:v6 shouldDownloadAssets:1];
  id v5 = [(PSGExperimentResolver *)self getResponseSuggestionsExperimentConfig:v6 shouldDownloadAssets:1];
}

- (id)getResponseSuggestionsExperimentConfig:(id)a3 shouldDownloadAssets:(BOOL)a4
{
  id v6 = a3;
  uint64_t v39 = 0;
  v40 = (id *)&v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  id v44 = 0;
  if ([v6 length])
  {
    uint64_t v7 = [MEMORY[0x263F382A0] languageForLocaleIdentifier:v6];
    uint64_t v8 = [(NSDictionary *)self->_zkwLangAndNamespaces objectForKey:v7];
    if (v8)
    {
      responseSuggestionsConfigLock = self->_responseSuggestionsConfigLock;
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __85__PSGExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke;
      v36[3] = &unk_265037FC8;
      v38 = &v39;
      id v10 = v7;
      id v37 = v10;
      [(_PASLock *)responseSuggestionsConfigLock runWithLockAcquired:v36];
      id v11 = v40[5];
      if (v11) {
        goto LABEL_9;
      }
      uint64_t v30 = 0;
      v31 = &v30;
      uint64_t v32 = 0x3032000000;
      v33 = __Block_byref_object_copy_;
      v34 = __Block_byref_object_dispose_;
      id v35 = 0;
      id location = 0;
      objc_initWeak(&location, self);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __85__PSGExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_2;
      block[3] = &unk_265038018;
      objc_copyWeak(&v27, &location);
      v26 = &v30;
      id v24 = v8;
      id v12 = v10;
      id v25 = v12;
      BOOL v28 = a4;
      dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      id v14 = [(id)objc_opt_class() sharedZKWQueue];
      dispatch_async(v14, v13);

      dispatch_time_t v15 = dispatch_time(0, 1000000000);
      dispatch_block_wait(v13, v15);
      objc_storeStrong(v40 + 5, (id)v31[5]);
      if (!v40[5])
      {
        long long v16 = psg_default_log_handle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v22[0] = 0;
          _os_log_impl(&dword_23EAA9000, v16, OS_LOG_TYPE_DEFAULT, "Smart Reply config not valid, using defaults", (uint8_t *)v22, 2u);
        }

        uint64_t v17 = [(PSGExperimentResolver *)self _getDefaultResponseSuggestionsExperimentConfig:v12];
        id v18 = v40[5];
        v40[5] = (id)v17;
      }
      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
      _Block_object_dispose(&v30, 8);

      id v11 = v40[5];
      if (v11)
      {
LABEL_9:
        id v19 = v11;
      }
      else
      {
        id v19 = [(PSGExperimentResolver *)self _getDefaultResponseSuggestionsExperimentConfig:v12];
      }
      v20 = v19;
    }
    else
    {
      v20 = [(PSGExperimentResolver *)self _getDefaultResponseSuggestionsExperimentConfig:v7];
    }
  }
  else
  {
    v20 = [(PSGExperimentResolver *)self _getDefaultResponseSuggestionsExperimentConfig:0];
  }
  _Block_object_dispose(&v39, 8);

  return v20;
}

- (id)getWordBoundarySuggestionsExperimentConfig:(id)a3 shouldDownloadAssets:(BOOL)a4
{
  id v6 = a3;
  uint64_t v37 = 0;
  v38 = (id *)&v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy_;
  uint64_t v41 = __Block_byref_object_dispose_;
  id v42 = 0;
  if ([v6 length])
  {
    uint64_t v7 = [MEMORY[0x263F382A0] languageForLocaleIdentifier:v6];
    uint64_t v8 = [(NSDictionary *)self->_wordBoundaryLangAndNamespaces objectForKey:v7];
    if (v8)
    {
      wordBoundaryConfigLock = self->_wordBoundaryConfigLock;
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __89__PSGExperimentResolver_getWordBoundarySuggestionsExperimentConfig_shouldDownloadAssets___block_invoke;
      v34[3] = &unk_265037FC8;
      v36 = &v37;
      id v10 = v7;
      id v35 = v10;
      [(_PASLock *)wordBoundaryConfigLock runWithLockAcquired:v34];
      id v11 = v38[5];
      if (v11) {
        goto LABEL_9;
      }
      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x3032000000;
      v31 = __Block_byref_object_copy_;
      uint64_t v32 = __Block_byref_object_dispose_;
      id v33 = 0;
      id location = 0;
      objc_initWeak(&location, self);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __89__PSGExperimentResolver_getWordBoundarySuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_2;
      block[3] = &unk_265037FF0;
      objc_copyWeak(&v25, &location);
      id v24 = &v28;
      id v23 = v8;
      BOOL v26 = a4;
      dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
      dispatch_block_t v13 = [(id)objc_opt_class() sharedWordBoundaryQueue];
      dispatch_async(v13, v12);

      dispatch_time_t v14 = dispatch_time(0, 1000000000);
      dispatch_block_wait(v12, v14);
      objc_storeStrong(v38 + 5, (id)v29[5]);
      if (!v38[5])
      {
        dispatch_time_t v15 = psg_default_log_handle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v21 = 0;
          _os_log_impl(&dword_23EAA9000, v15, OS_LOG_TYPE_DEFAULT, "Smart Reply config not valid, using defaults", (uint8_t *)&v21, 2u);
        }

        uint64_t v16 = [(PSGExperimentResolver *)self _getDefaultWordBoundarySuggestionsExperimentConfig:v10];
        id v17 = v38[5];
        v38[5] = (id)v16;
      }
      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
      _Block_object_dispose(&v28, 8);

      id v11 = v38[5];
      if (v11)
      {
LABEL_9:
        id v18 = v11;
      }
      else
      {
        id v18 = [(PSGExperimentResolver *)self _getDefaultWordBoundarySuggestionsExperimentConfig:v10];
      }
      id v19 = v18;
    }
    else
    {
      id v19 = [(PSGExperimentResolver *)self _getDefaultWordBoundarySuggestionsExperimentConfig:v7];
    }
  }
  else
  {
    id v19 = [(PSGExperimentResolver *)self _getDefaultWordBoundarySuggestionsExperimentConfig:0];
  }
  _Block_object_dispose(&v37, 8);

  return v19;
}

+ (id)sharedZKWQueue
{
  if (sharedZKWQueue__pasOnceToken5 != -1) {
    dispatch_once(&sharedZKWQueue__pasOnceToken5, &__block_literal_global_73);
  }
  v2 = (void *)sharedZKWQueue__pasExprOnceResult;
  return v2;
}

+ (id)sharedWordBoundaryQueue
{
  if (sharedWordBoundaryQueue__pasOnceToken4 != -1) {
    dispatch_once(&sharedWordBoundaryQueue__pasOnceToken4, &__block_literal_global_1035);
  }
  v2 = (void *)sharedWordBoundaryQueue__pasExprOnceResult;
  return v2;
}

+ (PSGExperimentResolver)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__PSGExperimentResolver_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedInstance__pasOnceToken3 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken3, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult;
  return (PSGExperimentResolver *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordBoundaryLangAndNamespaces, 0);
  objc_storeStrong((id *)&self->_zkwLangAndNamespaces, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_wordBoundaryConfigLock, 0);
  objc_storeStrong((id *)&self->_responseSuggestionsConfigLock, 0);
}

- (NSDictionary)wordBoundaryLangAndNamespaces
{
  return self->_wordBoundaryLangAndNamespaces;
}

- (NSDictionary)zkwLangAndNamespaces
{
  return self->_zkwLangAndNamespaces;
}

- (id)_getDefaultWordBoundarySuggestionsExperimentConfig:(id)a3
{
  v3 = objc_opt_new();
  return v3;
}

- (id)_getDefaultResponseSuggestionsExperimentConfig:(id)a3
{
  v3 = objc_opt_new();
  return v3;
}

uint64_t __85__PSGExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:*(void *)(a1 + 32)];
}

- (id)getResponseSuggestionsExperimentConfig:(id)a3
{
  return [(PSGExperimentResolver *)self getResponseSuggestionsExperimentConfig:a3 shouldDownloadAssets:0];
}

uint64_t __89__PSGExperimentResolver_getWordBoundarySuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:*(void *)(a1 + 32)];
}

- (id)getWordBoundarySuggestionsExperimentConfig:(id)a3
{
  return [(PSGExperimentResolver *)self getWordBoundarySuggestionsExperimentConfig:a3 shouldDownloadAssets:0];
}

- (PSGExperimentResolver)init
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  v49.receiver = self;
  v49.super_class = (Class)PSGExperimentResolver;
  v2 = [(PSGExperimentResolver *)&v49 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F80E18] clientWithIdentifier:103];
    trialClient = v2->_trialClient;
    v2->_trialClient = (TRIClient *)v3;

    id v5 = psg_default_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = 103;
      _os_log_impl(&dword_23EAA9000, v5, OS_LOG_TYPE_DEFAULT, "PSGExperimentResolver -- setting up trial client for client id %d", buf, 8u);
    }

    v54[0] = @"en";
    v54[1] = @"zh-Hans";
    v55[0] = @"QUICK_TYPE_ZKW_EN";
    v55[1] = @"QUICK_TYPE_ZKW_ZH_HANS";
    v54[2] = @"ja";
    v54[3] = @"es";
    v55[2] = @"QUICK_TYPE_ZKW_JP";
    v55[3] = @"QUICK_TYPE_ZKW_ES";
    v54[4] = @"fr";
    v55[4] = @"QUICK_TYPE_ZKW_FR";
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:5];
    zkwLangAndNamespaces = v2->_zkwLangAndNamespaces;
    v2->_zkwLangAndNamespaces = (NSDictionary *)v6;

    v52[0] = @"en";
    v52[1] = @"zh-Hans";
    v53[0] = @"QUICK_TYPE_WB_EN";
    v53[1] = @"QUICK_TYPE_WB_ZH_HANS";
    v52[2] = @"ja";
    v52[3] = @"es";
    v53[2] = @"QUICK_TYPE_WB_JP";
    v53[3] = @"QUICK_TYPE_WB_ES";
    v52[4] = @"fr";
    v53[4] = @"QUICK_TYPE_WB_FR";
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:5];
    wordBoundaryLangAndNamespaces = v2->_wordBoundaryLangAndNamespaces;
    v2->_wordBoundaryLangAndNamespaces = (NSDictionary *)v8;

    id v10 = objc_alloc(MEMORY[0x263F61E70]);
    id v11 = objc_opt_new();
    uint64_t v12 = [v10 initWithGuardedData:v11];
    responseSuggestionsConfigLock = v2->_responseSuggestionsConfigLock;
    v2->_responseSuggestionsConfigLock = (_PASLock *)v12;

    id v14 = objc_alloc(MEMORY[0x263F61E70]);
    dispatch_time_t v15 = objc_opt_new();
    uint64_t v16 = [v14 initWithGuardedData:v15];
    wordBoundaryConfigLock = v2->_wordBoundaryConfigLock;
    v2->_wordBoundaryConfigLock = (_PASLock *)v16;

    *(void *)buf = 0;
    objc_initWeak((id *)buf, v2);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v18 = [(NSDictionary *)v2->_zkwLangAndNamespaces allKeys];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v46 != v20) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          id v23 = [(NSDictionary *)v2->_zkwLangAndNamespaces objectForKeyedSubscript:v22];
          id v24 = v2->_trialClient;
          v41[0] = MEMORY[0x263EF8330];
          v41[1] = 3221225472;
          v41[2] = __29__PSGExperimentResolver_init__block_invoke;
          v41[3] = &unk_265037F30;
          objc_copyWeak(&v44, (id *)buf);
          id v25 = v23;
          id v42 = v25;
          uint64_t v43 = v22;
          id v26 = (id)[(TRIClient *)v24 addUpdateHandlerForNamespaceName:v25 usingBlock:v41];

          objc_destroyWeak(&v44);
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v19);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v27 = [(NSDictionary *)v2->_wordBoundaryLangAndNamespaces allValues];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v37 objects:v50 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v38 != v29) {
            objc_enumerationMutation(v27);
          }
          uint64_t v31 = *(void *)(*((void *)&v37 + 1) + 8 * j);
          uint64_t v32 = v2->_trialClient;
          v35[0] = MEMORY[0x263EF8330];
          v35[1] = 3221225472;
          v35[2] = __29__PSGExperimentResolver_init__block_invoke_5;
          v35[3] = &unk_265037F80;
          objc_copyWeak(&v36, (id *)buf);
          v35[4] = v31;
          id v33 = (id)[(TRIClient *)v32 addUpdateHandlerForNamespaceName:v31 usingBlock:v35];
          objc_destroyWeak(&v36);
        }
        uint64_t v28 = [v27 countByEnumeratingWithState:&v37 objects:v50 count:16];
      }
      while (v28);
    }

    objc_destroyWeak((id *)buf);
  }
  return v2;
}

void __29__PSGExperimentResolver_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__PSGExperimentResolver_init__block_invoke_2;
  block[3] = &unk_265037F08;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  uint64_t v7 = +[PSGExperimentResolver sharedZKWQueue];
  dispatch_async(v7, v6);

  objc_destroyWeak(&v11);
}

void __29__PSGExperimentResolver_init__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __29__PSGExperimentResolver_init__block_invoke_6;
  id v9 = &unk_265037F58;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  uint64_t v10 = *(void *)(a1 + 32);
  dispatch_block_t v4 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &v6);
  uint64_t v5 = +[PSGExperimentResolver sharedWordBoundaryQueue];
  dispatch_async(v5, v4);

  objc_destroyWeak(&v11);
}

void __29__PSGExperimentResolver_init__block_invoke_6(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_block_t v4 = (void *)WeakRetained[2];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __29__PSGExperimentResolver_init__block_invoke_7;
    v13[3] = &unk_265037EB8;
    void v13[4] = *(void *)(a1 + 32);
    [v4 runWithLockAcquired:v13];
    uint64_t v5 = [[PSGWordBoundarySuggestionsExpConfig alloc] initWithNamespaceName:*(void *)(a1 + 32) withTrialClient:v3[3] shouldDownloadAssets:0];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = (void *)v3[2];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __29__PSGExperimentResolver_init__block_invoke_8;
      v10[3] = &unk_265037EE0;
      uint64_t v8 = v5;
      uint64_t v9 = *(void *)(a1 + 32);
      id v11 = v8;
      uint64_t v12 = v9;
      [v7 runWithLockAcquired:v10];
    }
  }
}

uint64_t __29__PSGExperimentResolver_init__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 removeObjectForKey:*(void *)(a1 + 32)];
}

uint64_t __29__PSGExperimentResolver_init__block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
}

void __29__PSGExperimentResolver_init__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_block_t v4 = (void *)WeakRetained[1];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __29__PSGExperimentResolver_init__block_invoke_3;
    v11[3] = &unk_265037EB8;
    id v12 = *(id *)(a1 + 32);
    [v4 runWithLockAcquired:v11];
    uint64_t v5 = [[PSGResponseSuggestionsExpConfig alloc] initWithNamespaceName:*(void *)(a1 + 32) withLanguage:*(void *)(a1 + 40) withTrialClient:v3[3] shouldDownloadAssets:0];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = (void *)v3[1];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __29__PSGExperimentResolver_init__block_invoke_4;
      v8[3] = &unk_265037EE0;
      uint64_t v9 = v5;
      id v10 = *(id *)(a1 + 32);
      [v7 runWithLockAcquired:v8];
    }
  }
}

uint64_t __29__PSGExperimentResolver_init__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 removeObjectForKey:*(void *)(a1 + 32)];
}

uint64_t __29__PSGExperimentResolver_init__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
}

void __39__PSGExperimentResolver_sharedZKWQueue__block_invoke()
{
  v0 = (void *)MEMORY[0x23ED0AB80]();
  uint64_t v1 = [MEMORY[0x263F61E38] autoreleasingSerialQueueWithLabel:"PSGResponseSuggestions-initNamespace" qosClass:17];
  v2 = (void *)sharedZKWQueue__pasExprOnceResult;
  sharedZKWQueue__pasExprOnceResult = v1;
}

void __48__PSGExperimentResolver_sharedWordBoundaryQueue__block_invoke()
{
  v0 = (void *)MEMORY[0x23ED0AB80]();
  uint64_t v1 = [MEMORY[0x263F61E38] autoreleasingSerialQueueWithLabel:"PSGWordBoundary-initNamespace" qosClass:17];
  v2 = (void *)sharedWordBoundaryQueue__pasExprOnceResult;
  sharedWordBoundaryQueue__pasExprOnceResult = v1;
}

void __39__PSGExperimentResolver_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x23ED0AB80]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;
}

@end