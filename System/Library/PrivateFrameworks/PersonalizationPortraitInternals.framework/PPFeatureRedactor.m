@interface PPFeatureRedactor
- (PPFeatureRedactor)initWithTrialWrapper:(id)a3 namespaceName:(id)a4;
- (void)transformFeaturesInPlace:(id)a3;
@end

@implementation PPFeatureRedactor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialWrapper, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)transformFeaturesInPlace:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PPFeatureRedactor_transformFeaturesInPlace___block_invoke;
  v7[3] = &unk_1E65DA360;
  id v6 = v4;
  id v8 = v6;
  v9 = v10;
  [(_PASLock *)lock runWithLockAcquired:v7];

  _Block_object_dispose(v10, 8);
}

void __46__PPFeatureRedactor_transformFeaturesInPlace___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  char v4 = [MEMORY[0x1E4F93B08] isInternalBuild];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = [*(id *)(a1 + 32) allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v19;
    *(void *)&long long v7 = 138739971;
    long long v17 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v12 = objc_msgSend(v3[1], "objectForKeyedSubscript:", v11, v17);
        if ([v12 length])
        {
          if (!*((unsigned char *)v3 + 17)) {
            goto LABEL_21;
          }
          v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
          [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:v12];

LABEL_20:
          [*(id *)(a1 + 32) removeObjectForKey:v11];
          goto LABEL_21;
        }
        if (*((unsigned char *)v3 + 16)) {
          char v14 = 0;
        }
        else {
          char v14 = v4;
        }
        if ((v14 & 1) == 0) {
          goto LABEL_20;
        }
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
        {
          v15 = pp_default_log_handle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEFAULT, "Feature redaction is disabled and features not in the allow list are present", buf, 2u);
          }

          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        }
        v16 = pp_default_log_handle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v17;
          uint64_t v23 = v11;
          _os_log_debug_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEBUG, "Feature %{sensitive}@ not redacted!", buf, 0xCu);
        }

LABEL_21:
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }
}

- (PPFeatureRedactor)initWithTrialWrapper:(id)a3 namespaceName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PPFeatureRedactor;
  uint64_t v9 = [(PPFeatureRedactor *)&v21 init];
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F93B70]);
    uint64_t v11 = objc_opt_new();
    uint64_t v12 = [v10 initWithGuardedData:v11];
    lock = v9->_lock;
    v9->_lock = (_PASLock *)v12;

    objc_storeStrong((id *)&v9->_trialWrapper, a3);
    char v14 = [(PPTrialWrapper *)v9->_trialWrapper plistForFactorName:@"FeatureRedactorConfiguration.plist" namespaceName:v8];
    v15 = v14;
    if (v14)
    {
      id v16 = v14;
      long long v17 = v9->_lock;
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      v24 = __40__PPFeatureRedactor__loadWithAssetData___block_invoke;
      uint64_t v25 = &unk_1E65DA338;
      id v18 = v16;
      id v26 = v18;
      [(_PASLock *)v17 runWithLockAcquired:buf];
    }
    else
    {
      long long v19 = pp_default_log_handle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA9A8000, v19, OS_LOG_TYPE_ERROR, "No asset data found for feature redactor.", buf, 2u);
      }
    }
  }

  return v9;
}

void __40__PPFeatureRedactor__loadWithAssetData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  char v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5 = [v4 objectForKeyedSubscript:@"ShouldRedact"];
    if (!v5 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), id v7 = v5, (isKindOfClass & 1) == 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v20 = 138412290;
        objc_super v21 = @"ShouldRedact";
        _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v20, 0xCu);
      }
      id v7 = &unk_1F256B280;
    }
    id v8 = v7;

    char v9 = [v8 BOOLValue];
    v3[16] = v9;
    id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ShouldTranslate"];
    if (!v10 || (objc_opt_class(), char v11 = objc_opt_isKindOfClass(), v12 = v10, (v11 & 1) == 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v20 = 138412290;
        objc_super v21 = @"ShouldTranslate";
        _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v20, 0xCu);
      }
      uint64_t v12 = &unk_1F256B280;
    }
    id v13 = v12;

    char v14 = [v13 BOOLValue];
    v3[17] = v14;
    v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"Translations"];
    if (!v15 || (objc_opt_class(), v16 = objc_opt_isKindOfClass(), long long v17 = v15, (v16 & 1) == 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v20 = 138412290;
        objc_super v21 = @"Translations";
        _os_log_error_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Param key not found: %@", (uint8_t *)&v20, 0xCu);
      }
      long long v17 = (void *)MEMORY[0x1E4F1CC08];
    }
    id v18 = v17;

    long long v19 = (void *)*((void *)v3 + 1);
    *((void *)v3 + 1) = v18;
  }
}

@end