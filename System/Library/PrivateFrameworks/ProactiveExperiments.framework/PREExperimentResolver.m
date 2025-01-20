@interface PREExperimentResolver
+ (id)sharedInstance;
+ (id)sharedQueue;
- (NSDictionary)smartReplyLangAndNamespaces;
- (PREExperimentResolver)init;
- (id)_getDefaultResponseSuggestionsExperimentConfig:(id)a3;
- (id)getResponseSuggestionsExperimentConfig:(id)a3 shouldDownloadAssets:(BOOL)a4;
- (void)warmupForLocale:(id)a3;
@end

@implementation PREExperimentResolver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartReplyLangAndNamespaces, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);

  objc_storeStrong((id *)&self->_guardedSmartReplyConfig, 0);
}

- (NSDictionary)smartReplyLangAndNamespaces
{
  return self->_smartReplyLangAndNamespaces;
}

- (id)_getDefaultResponseSuggestionsExperimentConfig:(id)a3
{
  v3 = [[PREResponseSuggestionsExpConfig alloc] initWithNamespaceName:0 withTrialClient:self->_trialClient shouldDownloadAssets:0];

  return v3;
}

- (id)getResponseSuggestionsExperimentConfig:(id)a3 shouldDownloadAssets:(BOOL)a4
{
  id v6 = a3;
  uint64_t v38 = 0;
  v39 = (id *)&v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  id v43 = 0;
  if ([v6 length])
  {
    v7 = [MEMORY[0x1E4F89D60] languageForLocaleIdentifier:v6];

    v8 = [(NSDictionary *)self->_smartReplyLangAndNamespaces objectForKey:v7];
    v9 = v8;
    if (v8)
    {
      guardedSmartReplyConfig = self->_guardedSmartReplyConfig;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __85__PREExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke;
      v35[3] = &unk_1E65B1BA8;
      v37 = &v38;
      id v11 = v8;
      id v36 = v11;
      [(_PASLock *)guardedSmartReplyConfig runWithLockAcquired:v35];
      id v12 = v39[5];
      if (!v12)
      {
        *(void *)buf = 0;
        v30 = buf;
        uint64_t v31 = 0x3032000000;
        v32 = __Block_byref_object_copy_;
        v33 = __Block_byref_object_dispose_;
        id v34 = 0;
        id location = 0;
        objc_initWeak(&location, self);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __85__PREExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_2;
        block[3] = &unk_1E65B1BD0;
        objc_copyWeak(&v26, &location);
        v25 = buf;
        id v24 = v11;
        BOOL v27 = a4;
        dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
        v14 = [(id)objc_opt_class() sharedQueue];
        dispatch_async(v14, v13);

        dispatch_time_t v15 = dispatch_time(0, 1000000000);
        dispatch_block_wait(v13, v15);
        objc_storeStrong(v39 + 5, *((id *)v30 + 5));
        if (!v39[5])
        {
          v16 = pre_responses_handle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v22 = 0;
            _os_log_impl(&dword_1CA622000, v16, OS_LOG_TYPE_DEFAULT, "Smart Reply config not valid, using defaults", (uint8_t *)&v22, 2u);
          }

          uint64_t v17 = [(PREExperimentResolver *)self _getDefaultResponseSuggestionsExperimentConfig:v7];
          id v18 = v39[5];
          v39[5] = (id)v17;
        }
        objc_destroyWeak(&v26);
        objc_destroyWeak(&location);
        _Block_object_dispose(buf, 8);

        id v12 = v39[5];
        if (!v12)
        {
          v19 = pre_responses_handle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1CA622000, v19, OS_LOG_TYPE_FAULT, "No Smart Reply experiment configuration found, no default supplied", buf, 2u);
          }

          id v12 = v39[5];
        }
      }
      id v20 = v12;
    }
    else
    {
      id v20 = 0;
    }
  }
  else
  {
    id v20 = 0;
    v7 = v6;
  }
  _Block_object_dispose(&v38, 8);

  return v20;
}

uint64_t __85__PREExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 objectForKey:*(void *)(a1 + 32)];

  return MEMORY[0x1F41817F8]();
}

void __85__PREExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[1];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __85__PREExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_3;
    v15[3] = &unk_1E65B1BA8;
    long long v11 = *(_OWORD *)(a1 + 32);
    id v5 = (id)v11;
    long long v16 = v11;
    [v4 runWithLockAcquired:v15];
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      id v6 = [[PREResponseSuggestionsExpConfig alloc] initWithNamespaceName:*(void *)(a1 + 32) withTrialClient:v3[2] shouldDownloadAssets:*(unsigned __int8 *)(a1 + 56)];
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      uint64_t v9 = *(void *)(a1 + 40);
      if (*(void *)(*(void *)(v9 + 8) + 40))
      {
        v10 = (void *)v3[1];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __85__PREExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_4;
        v12[3] = &unk_1E65B1BA8;
        uint64_t v14 = v9;
        id v13 = *(id *)(a1 + 32);
        [v10 runWithLockAcquired:v12];
      }
    }
  }
}

uint64_t __85__PREExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 objectForKey:*(void *)(a1 + 32)];

  return MEMORY[0x1F41817F8]();
}

uint64_t __85__PREExperimentResolver_getResponseSuggestionsExperimentConfig_shouldDownloadAssets___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:*(void *)(a1 + 32)];
}

- (void)warmupForLocale:(id)a3
{
  id v3 = [(PREExperimentResolver *)self getResponseSuggestionsExperimentConfig:a3 shouldDownloadAssets:1];
}

- (PREExperimentResolver)init
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)PREExperimentResolver;
  val = [(PREExperimentResolver *)&v26 init];
  if (val)
  {
    uint64_t v2 = [MEMORY[0x1E4FB0098] clientWithIdentifier:101];
    trialClient = val->_trialClient;
    val->_trialClient = (TRIClient *)v2;

    v4 = pre_responses_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = 101;
      _os_log_impl(&dword_1CA622000, v4, OS_LOG_TYPE_DEFAULT, "PREExperimentResolver -- setting up trial client for client id %d", buf, 8u);
    }

    v28[0] = @"en";
    v28[1] = @"es";
    v29[0] = @"SMART_REPLY_EN";
    v29[1] = @"SMART_REPLY_ES";
    v28[2] = @"fr";
    v28[3] = @"hi";
    v29[2] = @"SMART_REPLY_FR";
    v29[3] = @"SMART_REPLY_HI";
    v28[4] = @"hi-Latn";
    v28[5] = @"ja";
    v29[4] = @"SMART_REPLY_HI_LATN";
    v29[5] = @"SMART_REPLY_JP";
    v28[6] = @"zh-Hans";
    v29[6] = @"SMART_REPLY_ZH_HANS";
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:7];
    smartReplyLangAndNamespaces = val->_smartReplyLangAndNamespaces;
    val->_smartReplyLangAndNamespaces = (NSDictionary *)v5;

    id v7 = objc_alloc(MEMORY[0x1E4F93B70]);
    v8 = objc_opt_new();
    uint64_t v9 = [v7 initWithGuardedData:v8];
    guardedSmartReplyConfig = val->_guardedSmartReplyConfig;
    val->_guardedSmartReplyConfig = (_PASLock *)v9;

    *(void *)buf = 0;
    objc_initWeak((id *)buf, val);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v11 = [(NSDictionary *)val->_smartReplyLangAndNamespaces allValues];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v23;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * v14);
          long long v16 = val->_trialClient;
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __29__PREExperimentResolver_init__block_invoke;
          v20[3] = &unk_1E65B1B80;
          objc_copyWeak(&v21, (id *)buf);
          v20[4] = v15;
          id v17 = (id)[(TRIClient *)v16 addUpdateHandlerForNamespaceName:v15 usingBlock:v20];
          objc_destroyWeak(&v21);
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v12);
    }

    objc_destroyWeak((id *)buf);
  }
  return val;
}

void __29__PREExperimentResolver_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  v8 = __29__PREExperimentResolver_init__block_invoke_2;
  uint64_t v9 = &unk_1E65B1EF8;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  uint64_t v10 = *(void *)(a1 + 32);
  dispatch_block_t v4 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &v6);
  uint64_t v5 = +[PREExperimentResolver sharedQueue];
  dispatch_async(v5, v4);

  objc_destroyWeak(&v11);
}

void __29__PREExperimentResolver_init__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_block_t v4 = (void *)WeakRetained[1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __29__PREExperimentResolver_init__block_invoke_3;
    v13[3] = &unk_1E65B1B30;
    v13[4] = *(void *)(a1 + 32);
    [v4 runWithLockAcquired:v13];
    uint64_t v5 = [[PREResponseSuggestionsExpConfig alloc] initWithNamespaceName:*(void *)(a1 + 32) withTrialClient:v3[2] shouldDownloadAssets:0];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = (void *)v3[1];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __29__PREExperimentResolver_init__block_invoke_4;
      v10[3] = &unk_1E65B1B58;
      v8 = v5;
      uint64_t v9 = *(void *)(a1 + 32);
      id v11 = v8;
      uint64_t v12 = v9;
      [v7 runWithLockAcquired:v10];
    }
  }
}

uint64_t __29__PREExperimentResolver_init__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 removeObjectForKey:*(void *)(a1 + 32)];
}

uint64_t __29__PREExperimentResolver_init__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
}

+ (id)sharedQueue
{
  if (sharedQueue__pasOnceToken4 != -1) {
    dispatch_once(&sharedQueue__pasOnceToken4, &__block_literal_global_1374);
  }
  uint64_t v2 = (void *)sharedQueue__pasExprOnceResult;

  return v2;
}

void __36__PREExperimentResolver_sharedQueue__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB799590]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"PREResponseSuggestions-initNamespace" qosClass:17];
  uint64_t v2 = (void *)sharedQueue__pasExprOnceResult;
  sharedQueue__pasExprOnceResult = v1;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PREExperimentResolver_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedInstance__pasOnceToken3 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken3, block);
  }
  uint64_t v2 = (void *)sharedInstance__pasExprOnceResult_1376;

  return v2;
}

void __39__PREExperimentResolver_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB799590]();
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = (void *)sharedInstance__pasExprOnceResult_1376;
  sharedInstance__pasExprOnceResult_1376 = v1;
}

@end