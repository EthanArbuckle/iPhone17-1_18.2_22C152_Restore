@interface PPTrialWrapper
+ (PPTrialWrapper)sharedInstance;
+ (id)sharedTrialClient;
- (BOOL)hasFactor:(id)a3 namespaceName:(id)a4;
- (BOOL)hasOverrideForFileFactor:(id)a3 namespaceName:(id)a4;
- (NSString)concatenatedTreatmentNames;
- (PPTrialWrapper)initWithSettings:(id)a3 database:(id)a4 trialClient:(id)a5;
- (id)_loadMLModelForModelName:(id)a3 namespaceName:(id)a4 error:(id *)a5;
- (id)addUpdateHandlerForNamespaceName:(id)a3 block:(id)a4;
- (id)defaultFilepathForFactor:(id)a3 namespaceName:(id)a4;
- (id)directoryForFactorName:(id)a3 namespaceName:(id)a4;
- (id)filepathForFactor:(id)a3 namespaceName:(id)a4;
- (id)filepathForFactorName:(id)a3 namespaceName:(id)a4 isDirectory:(BOOL)a5;
- (id)lastTreatmentUpdate;
- (id)lastTreatmentUpdateForNamespaceName:(id)a3;
- (id)lazyPlistForFactorName:(id)a3 namespaceName:(id)a4 error:(id *)a5;
- (id)levelForFactor:(id)a3 namespaceName:(id)a4;
- (id)mlModelPathForModelName:(id)a3 namespaceName:(id)a4 error:(id *)a5;
- (id)plistForFactorName:(id)a3 namespaceName:(id)a4;
- (id)readableTreatmentsMapping;
- (id)treatmentNameForNamespaceName:(id)a3;
- (id)trieForFactorName:(id)a3 namespaceName:(id)a4;
- (unsigned)treatmentsHash;
- (void)_addDefaultUpdateHandlersForAllNamespacesWithGuardedData:(id)a3;
- (void)_updateConcatenatedTreatmentNamesAndHash;
- (void)callRegisteredUpdateHandlers;
- (void)callRegisteredUpdateHandlersForNamespaceName:(id)a3;
- (void)clearOverrideFilepathForFileFactor:(id)a3 namespaceName:(id)a4;
- (void)dealloc;
- (void)overrideFilepathForFileFactor:(id)a3 namespaceName:(id)a4 path:(id)a5;
- (void)removeUpdateHandlerForToken:(id)a3;
- (void)setUseDefaultFiles:(BOOL)a3;
@end

@implementation PPTrialWrapper

- (NSString)concatenatedTreatmentNames
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24315;
  v10 = __Block_byref_object_dispose__24316;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PPTrialWrapper_concatenatedTreatmentNames__block_invoke;
  v5[3] = &unk_1E65DB968;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (id)lastTreatmentUpdate
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__24315;
  v10 = __Block_byref_object_dispose__24316;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__PPTrialWrapper_lastTreatmentUpdate__block_invoke;
  v5[3] = &unk_1E65DB968;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __66__PPTrialWrapper_filepathForFactorName_namespaceName_isDirectory___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1[4] + 24))
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
  else
  {
    id v11 = v3;
    v4 = [v3[3] objectForKeyedSubscript:a1[5]];
    id v3 = v11;
    if (v4)
    {
      v5 = [v11[3] objectForKeyedSubscript:a1[5]];
      uint64_t v6 = [v5 objectForKeyedSubscript:a1[6]];

      id v3 = v11;
      if (v6)
      {
        v7 = [v11[3] objectForKeyedSubscript:a1[5]];
        uint64_t v8 = [v7 objectForKeyedSubscript:a1[6]];
        uint64_t v9 = *(void *)(a1[8] + 8);
        v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = v8;

        id v3 = v11;
      }
    }
  }
}

void __37__PPTrialWrapper_lastTreatmentUpdate__block_invoke(uint64_t a1, uint64_t a2)
{
}

void __44__PPTrialWrapper_concatenatedTreatmentNames__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)plistForFactorName:(id)a3 namespaceName:(id)a4
{
  uint64_t v6 = [(PPTrialWrapper *)self filepathForFactor:a3 namespaceName:a4];
  if (![v6 length])
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PPTrialWrapper.m", 393, @"Invalid parameter not satisfying: %@", @"configPath.length > 0" object file lineNumber description];
  }
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v6];

  return v7;
}

- (id)filepathForFactorName:(id)a3 namespaceName:(id)a4 isDirectory:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__24315;
  v35 = __Block_byref_object_dispose__24316;
  id v36 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  lock = self->_lock;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __66__PPTrialWrapper_filepathForFactorName_namespaceName_isDirectory___block_invoke;
  v22[3] = &unk_1E65DBA08;
  v22[4] = self;
  v25 = &v27;
  id v11 = v9;
  id v23 = v11;
  id v12 = v8;
  id v24 = v12;
  v26 = &v31;
  [(_PASLock *)lock runWithLockAcquired:v22];
  if (v32[5])
  {
    v13 = pp_default_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v38 = v12;
      __int16 v39 = 2112;
      id v40 = v11;
      _os_log_debug_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEBUG, "PPTrialWrapper: obeying override for factor %@ in namespace %@", buf, 0x16u);
    }

    id v14 = (id)v32[5];
LABEL_9:
    v16 = v14;
    goto LABEL_10;
  }
  if (*((unsigned char *)v28 + 24))
  {
    v15 = pp_default_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v38 = v12;
      __int16 v39 = 2112;
      id v40 = v11;
      _os_log_debug_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEBUG, "PPTrialWrapper: using default file for factor %@ in namespace %@", buf, 0x16u);
    }

    id v14 = [(PPTrialWrapper *)self defaultFilepathForFactor:v12 namespaceName:v11];
    goto LABEL_9;
  }
  v18 = [(PPTrialWrapper *)self levelForFactor:v12 namespaceName:v11];
  v19 = v18;
  if (v18)
  {
    if (v5) {
      [v18 directoryValue];
    }
    else {
    v20 = [v18 fileValue];
    }
    v16 = [v20 path];
  }
  else
  {
    v21 = pp_default_log_handle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v38 = v12;
      __int16 v39 = 2112;
      id v40 = v11;
      _os_log_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_DEFAULT, "PPTrialWrapper: Received nil factor from Trial for factor %@ in namespace %@, falling back to default", buf, 0x16u);
    }

    v16 = [(PPTrialWrapper *)self defaultFilepathForFactor:v12 namespaceName:v11];
  }

LABEL_10:
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v16;
}

- (id)levelForFactor:(id)a3 namespaceName:(id)a4
{
  return (id)[(TRIClient *)self->_trialClient levelForFactor:a3 withNamespaceName:a4];
}

- (id)filepathForFactor:(id)a3 namespaceName:(id)a4
{
  return [(PPTrialWrapper *)self filepathForFactorName:a3 namespaceName:a4 isDirectory:0];
}

- (id)_loadMLModelForModelName:(id)a3 namespaceName:(id)a4 error:(id *)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [(PPTrialWrapper *)self mlModelPathForModelName:v8 namespaceName:a4 error:a5];
  if (v9)
  {
    v10 = objc_opt_new();
    [v10 setComputeUnits:0];
    id v11 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:v9 configuration:v10 error:a5];
  }
  else
  {
    id v12 = pp_default_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v8;
      _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "PPTrialWrapper: unable to resolve compiled URL for model %@", (uint8_t *)&v14, 0xCu);
    }

    id v11 = 0;
  }

  return v11;
}

- (id)mlModelPathForModelName:(id)a3 namespaceName:(id)a4 error:(id *)a5
{
  BOOL v5 = -[PPTrialWrapper directoryForFactorName:namespaceName:](self, "directoryForFactorName:namespaceName:", a3, a4, a5);
  if (v5) {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v5];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)directoryForFactorName:(id)a3 namespaceName:(id)a4
{
  return [(PPTrialWrapper *)self filepathForFactorName:a3 namespaceName:a4 isDirectory:1];
}

+ (PPTrialWrapper)sharedInstance
{
  pthread_mutex_lock(&sharedInstance_lock_24419);
  if (sharedInstance_instance_24420)
  {
LABEL_2:
    int v2 = 1;
    goto LABEL_20;
  }
  id v3 = +[PPSettings sharedInstance];
  if (v3)
  {
    v4 = +[PPSQLDatabase sharedInstance];
    if (v4)
    {
      BOOL v5 = +[PPTrialWrapper sharedTrialClient];
      if (v5)
      {
        uint64_t v6 = [[PPTrialWrapper alloc] initWithSettings:v3 database:v4 trialClient:v5];
        v7 = (void *)sharedInstance_instance_24420;
        sharedInstance_instance_24420 = (uint64_t)v6;

        if (!sharedInstance_instance_24420)
        {
          id v8 = pp_default_log_handle();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v13 = 0;
            _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_INFO, "PPTrialWrapper sharedInstance did not initialize, will try again later. Device may be Class C locked.", v13, 2u);
          }
        }
        goto LABEL_2;
      }
      id v9 = pp_default_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v14 = 0;
        _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_INFO, "PPTrialWrapper sharedInstance failed to creare Trial client.", v14, 2u);
      }
    }
    else
    {
      v4 = pp_default_log_handle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v15 = 0;
        _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_INFO, "PPTrialWrapper sharedInstance failed to get database singleton.", v15, 2u);
      }
    }
  }
  else
  {
    id v3 = pp_default_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_INFO, "PPTrialWrapper sharedInstance failed to get settings singleton.", buf, 2u);
    }
  }

  int v2 = 0;
LABEL_20:
  id v10 = (id)sharedInstance_instance_24420;
  pthread_mutex_unlock(&sharedInstance_lock_24419);
  if (v2) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return (PPTrialWrapper *)v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_namespaceNamesIdsDict, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (id)trieForFactorName:(id)a3 namespaceName:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PPTrialWrapper *)self filepathForFactor:v6 namespaceName:a4];
  id v8 = pp_default_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_INFO, "Loading trie from \"%@\".", (uint8_t *)&v12, 0xCu);
  }

  if (v7)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F93AC8]) initWithPath:v7];
  }
  else
  {
    id v10 = pp_default_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_error_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_ERROR, "Failed to read path for trie %@.", (uint8_t *)&v12, 0xCu);
    }

    id v9 = 0;
  }

  return v9;
}

- (void)callRegisteredUpdateHandlers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [&unk_1F256AF40 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(&unk_1F256AF40);
        }
        [(PPTrialWrapper *)self callRegisteredUpdateHandlersForNamespaceName:*(void *)(*((void *)&v7 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [&unk_1F256AF40 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)callRegisteredUpdateHandlersForNamespaceName:(id)a3
{
  uint64_t v3 = (objc_class *)NSString;
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithFormat:@"com.apple.trial.NamespaceUpdate.%@", v4];

  id v6 = v5;
  notify_post((const char *)[v6 UTF8String]);
}

- (void)clearOverrideFilepathForFileFactor:(id)a3 namespaceName:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v8 = pp_default_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_INFO, "Cleared filepath override for file factor %@ in namespace %@", buf, 0x16u);
  }

  lock = self->_lock;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __67__PPTrialWrapper_clearOverrideFilepathForFileFactor_namespaceName___block_invoke;
  id v15 = &unk_1E65DB8A0;
  id v16 = v7;
  id v17 = v6;
  id v10 = v6;
  id v11 = v7;
  [(_PASLock *)lock runWithLockAcquired:&v12];
  -[PPTrialWrapper callRegisteredUpdateHandlersForNamespaceName:](self, "callRegisteredUpdateHandlersForNamespaceName:", v11, v12, v13, v14, v15);
}

void __67__PPTrialWrapper_clearOverrideFilepathForFileFactor_namespaceName___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6[3] objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (!v3)
  {
    id v4 = objc_opt_new();
    [v6[3] setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];
  }
  uint64_t v5 = [v6[3] objectForKeyedSubscript:*(void *)(a1 + 32)];
  [v5 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (BOOL)hasOverrideForFileFactor:(id)a3 namespaceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__24315;
  uint64_t v22 = __Block_byref_object_dispose__24316;
  id v23 = 0;
  lock = self->_lock;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__PPTrialWrapper_hasOverrideForFileFactor_namespaceName___block_invoke;
  v14[3] = &unk_1E65DBA58;
  id v17 = &v18;
  id v9 = v7;
  id v15 = v9;
  id v10 = v6;
  id v16 = v10;
  [(_PASLock *)lock runWithLockAcquired:v14];
  id v11 = v16;
  id v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v12 != 0;
}

void __57__PPTrialWrapper_hasOverrideForFileFactor_namespaceName___block_invoke(void *a1, uint64_t a2)
{
  id v6 = [*(id *)(a2 + 24) objectForKeyedSubscript:a1[4]];
  uint64_t v3 = [v6 objectForKeyedSubscript:a1[5]];
  uint64_t v4 = *(void *)(a1[6] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)overrideFilepathForFileFactor:(id)a3 namespaceName:(id)a4 path:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = pp_default_log_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_INFO, "Overriden filepath for file factor %@ in namespace %@ to %@", buf, 0x20u);
  }

  lock = self->_lock;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__PPTrialWrapper_overrideFilepathForFileFactor_namespaceName_path___block_invoke;
  v16[3] = &unk_1E65DBA30;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  [(_PASLock *)lock runWithLockAcquired:v16];
  [(PPTrialWrapper *)self callRegisteredUpdateHandlersForNamespaceName:v15];
}

void __67__PPTrialWrapper_overrideFilepathForFileFactor_namespaceName_path___block_invoke(void *a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7[3] objectForKeyedSubscript:a1[4]];

  if (!v3)
  {
    uint64_t v4 = objc_opt_new();
    [v7[3] setObject:v4 forKeyedSubscript:a1[4]];
  }
  uint64_t v5 = a1[6];
  id v6 = [v7[3] objectForKeyedSubscript:a1[4]];
  [v6 setObject:v5 forKeyedSubscript:a1[5]];
}

- (void)setUseDefaultFiles:(BOOL)a3
{
  self->_useDefaultFiles = a3;
}

- (id)lazyPlistForFactorName:(id)a3 namespaceName:(id)a4 error:(id *)a5
{
  id v8 = [(PPTrialWrapper *)self filepathForFactor:a3 namespaceName:a4];
  if (![v8 length])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PPTrialWrapper.m", 402, @"Invalid parameter not satisfying: %@", @"configPath.length > 0" object file lineNumber description];
  }
  id v9 = [MEMORY[0x1E4F93B50] dictionaryWithPath:v8 error:a5];

  return v9;
}

- (id)defaultFilepathForFactor:(id)a3 namespaceName:(id)a4
{
  namespaceNamesIdsDict = self->_namespaceNamesIdsDict;
  id v6 = a3;
  id v7 = [(NSDictionary *)namespaceNamesIdsDict objectForKeyedSubscript:a4];
  id v8 = +[PPPaths defaultAssetPathForNamespaceId:factorName:](PPPaths, "defaultAssetPathForNamespaceId:factorName:", [v7 intValue], v6);

  return v8;
}

- (unsigned)treatmentsHash
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__PPTrialWrapper_treatmentsHash__block_invoke;
  v5[3] = &unk_1E65DB968;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__PPTrialWrapper_treatmentsHash__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 48);
  return result;
}

- (void)_updateConcatenatedTreatmentNamesAndHash
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v4 = [&unk_1F256AF28 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(&unk_1F256AF28);
        }
        uint64_t v8 = *(void *)(*((void *)&v25 + 1) + 8 * v7);
        int v9 = (void *)MEMORY[0x1CB79D060]();
        id v10 = [(PPTrialWrapper *)self treatmentNameForNamespaceName:v8];
        id v11 = [(NSDictionary *)self->_namespaceNamesIdsDict objectForKeyedSubscript:v8];
        uint64_t v12 = [v11 intValue];

        [v3 appendFormat:@",%d:%@", v12, v10];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [&unk_1F256AF28 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v5);
  }
  id v13 = (void *)MEMORY[0x1CB79D060]();
  id v14 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@","];
  id v15 = [v3 stringByTrimmingCharactersInSet:v14];

  id v16 = v15;
  if ([v16 UTF8String])
  {
    int v17 = _PASMurmur3_x86_32();
  }
  else
  {
    id v18 = pp_default_log_handle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_FAULT, "PPTrialWrapper: unable to compute treatment hash", buf, 2u);
    }

    int v17 = -1;
  }
  lock = self->_lock;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __58__PPTrialWrapper__updateConcatenatedTreatmentNamesAndHash__block_invoke;
  v21[3] = &unk_1E65DB9E0;
  id v22 = v16;
  int v23 = v17;
  id v20 = v16;
  [(_PASLock *)lock runWithLockAcquired:v21];
}

void __58__PPTrialWrapper__updateConcatenatedTreatmentNamesAndHash__block_invoke(uint64_t a1, id *a2)
{
  objc_storeStrong(a2 + 5, *(id *)(a1 + 32));
  uint64_t v4 = a2;
  *((_DWORD *)v4 + 12) = *(_DWORD *)(a1 + 40);
}

- (id)readableTreatmentsMapping
{
  v36[10] = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1CB79D060](self, a2);
  id v3 = [NSString alloc];
  v34 = [(PPTrialWrapper *)self treatmentNameForNamespaceName:@"PERSONALIZATION_PORTRAIT_GLOBAL"];
  uint64_t v33 = (void *)[v3 initWithFormat:@"Global: %@", v34];
  v36[0] = v33;
  id v4 = [NSString alloc];
  v32 = [(PPTrialWrapper *)self treatmentNameForNamespaceName:@"PERSONALIZATION_PORTRAIT_TOPICS"];
  uint64_t v31 = (void *)[v4 initWithFormat:@"Topics: %@", v32];
  v36[1] = v31;
  id v5 = [NSString alloc];
  uint64_t v30 = [(PPTrialWrapper *)self treatmentNameForNamespaceName:@"PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"];
  uint64_t v29 = (void *)[v5 initWithFormat:@"Named Entities: %@", v30];
  v36[2] = v29;
  id v6 = [NSString alloc];
  long long v28 = [(PPTrialWrapper *)self treatmentNameForNamespaceName:@"PERSONALIZATION_PORTRAIT_LOCATIONS"];
  long long v27 = (void *)[v6 initWithFormat:@"Locations: %@", v28];
  v36[3] = v27;
  id v7 = [NSString alloc];
  long long v26 = [(PPTrialWrapper *)self treatmentNameForNamespaceName:@"PERSONALIZATION_PORTRAIT_CONTACTS"];
  long long v25 = (void *)[v7 initWithFormat:@"Contacts: %@", v26];
  v36[4] = v25;
  id v8 = [NSString alloc];
  __int16 v24 = [(PPTrialWrapper *)self treatmentNameForNamespaceName:@"PERSONALIZATION_PORTRAIT_EVENTS"];
  int v9 = (void *)[v8 initWithFormat:@"Events: %@", v24];
  v36[5] = v9;
  id v10 = [NSString alloc];
  id v11 = [(PPTrialWrapper *)self treatmentNameForNamespaceName:@"PERSONALIZATION_PORTRAIT_CONNECTIONS"];
  uint64_t v12 = (void *)[v10 initWithFormat:@"Connections: %@", v11];
  v36[6] = v12;
  id v13 = [NSString alloc];
  id v14 = [(PPTrialWrapper *)self treatmentNameForNamespaceName:@"PERSONALIZATION_PORTRAIT_QUICKTYPE"];
  id v15 = (void *)[v13 initWithFormat:@"Quicktype: %@", v14];
  v36[7] = v15;
  id v16 = [NSString alloc];
  int v17 = [(PPTrialWrapper *)self treatmentNameForNamespaceName:@"PERSONALIZATION_PORTRAIT_SOCIAL_HIGHLIGHT"];
  id v18 = (void *)[v16 initWithFormat:@"Social Highlights: %@", v17];
  v36[8] = v18;
  id v19 = [NSString alloc];
  id v20 = [(PPTrialWrapper *)self treatmentNameForNamespaceName:@"PERSONALIZATION_PORTRAIT_UNIVERSAL_SEARCH"];
  id v21 = (void *)[v19 initWithFormat:@"Universal Search: %@", v20];
  v36[9] = v21;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:10];

  return v22;
}

- (BOOL)hasFactor:(id)a3 namespaceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  lock = self->_lock;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__PPTrialWrapper_hasFactor_namespaceName___block_invoke;
  v12[3] = &unk_1E65DB9B8;
  id v9 = v7;
  id v13 = v9;
  id v10 = v6;
  id v14 = v10;
  id v15 = self;
  id v16 = &v17;
  [(_PASLock *)lock runWithLockAcquired:v12];
  LOBYTE(self) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)self;
}

void __42__PPTrialWrapper_hasFactor_namespaceName___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13[3] objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v5 = v13;
  if (!v4)
  {
    if (*(unsigned char *)(*(void *)(a1 + 48) + 24))
    {
      id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v7 = [*(id *)(a1 + 48) defaultFilepathForFactor:*(void *)(a1 + 40) namespaceName:*(void *)(a1 + 32)];
      if ([v6 fileExistsAtPath:v7])
      {
      }
      else
      {
        id v8 = [v13[3] objectForKeyedSubscript:*(void *)(a1 + 32)];
        id v9 = [v8 objectForKeyedSubscript:*(void *)(a1 + 40)];

        if (v9)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
LABEL_10:
          id v5 = v13;
          goto LABEL_11;
        }
      }
    }
    if (*(unsigned char *)(*(void *)(a1 + 48) + 24)
      || ([v13[3] objectForKeyedSubscript:*(void *)(a1 + 32)],
          id v10 = objc_claimAutoreleasedReturnValue(),
          [v10 objectForKeyedSubscript:*(void *)(a1 + 40)],
          id v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          v11))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    else
    {
      uint64_t v12 = [*(id *)(*(void *)(a1 + 48) + 40) levelForFactor:*(void *)(a1 + 40) withNamespaceName:*(void *)(a1 + 32)];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v12 != 0;
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (id)treatmentNameForNamespaceName:(id)a3
{
  id v3 = [(TRIClient *)self->_trialClient levelForFactor:@"treatment_name" withNamespaceName:a3];
  id v4 = [v3 stringValue];
  id v5 = v4;
  if (!v4) {
    id v4 = @"unknown-treatment";
  }
  id v6 = v4;

  return v6;
}

- (id)addUpdateHandlerForNamespaceName:(id)a3 block:(id)a4
{
  id v6 = a4;
  trialClient = self->_trialClient;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__PPTrialWrapper_addUpdateHandlerForNamespaceName_block___block_invoke;
  v15[3] = &unk_1E65DB990;
  id v8 = v6;
  id v16 = v8;
  id v9 = [(TRIClient *)trialClient addUpdateHandlerForNamespaceName:a3 usingBlock:v15];
  id v10 = v9;
  if (v9)
  {
    lock = self->_lock;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__PPTrialWrapper_addUpdateHandlerForNamespaceName_block___block_invoke_2;
    v13[3] = &unk_1E65DB8C8;
    id v14 = v9;
    [(_PASLock *)lock runWithLockAcquired:v13];
  }
  return v10;
}

uint64_t __57__PPTrialWrapper_addUpdateHandlerForNamespaceName_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__PPTrialWrapper_addUpdateHandlerForNamespaceName_block___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 16) addObject:*(void *)(a1 + 32)];
}

- (void)removeUpdateHandlerForToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(TRIClient *)self->_trialClient removeUpdateHandlerForToken:v4];
    lock = self->_lock;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__PPTrialWrapper_removeUpdateHandlerForToken___block_invoke;
    v6[3] = &unk_1E65DB8C8;
    id v7 = v4;
    [(_PASLock *)lock runWithLockAcquired:v6];
  }
}

uint64_t __46__PPTrialWrapper_removeUpdateHandlerForToken___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 16) removeObject:*(void *)(a1 + 32)];
}

- (id)lastTreatmentUpdateForNamespaceName:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  char v20 = __Block_byref_object_copy__24315;
  id v21 = __Block_byref_object_dispose__24316;
  id v22 = 0;
  db = self->_db;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __54__PPTrialWrapper_lastTreatmentUpdateForNamespaceName___block_invoke;
  id v14 = &unk_1E65DB940;
  id v16 = &v17;
  id v6 = v4;
  id v15 = v6;
  [(PPSQLDatabase *)db readTransactionWithClient:6 block:&v11];
  if (v18[5])
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    objc_msgSend((id)v18[5], "doubleValue", v11, v12, v13, v14);
    id v8 = objc_msgSend(v7, "initWithTimeIntervalSince1970:");
  }
  else
  {
    id v9 = pp_default_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v6;
      _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "PPTrialWrapper: namespace %@ has never been updated.", buf, 0xCu);
    }

    id v8 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __54__PPTrialWrapper_lastTreatmentUpdateForNamespaceName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v4 = a2;
  id v8 = (id)[[v3 alloc] initWithFormat:@"trial_update_%@", *(void *)(a1 + 32)];
  uint64_t v5 = +[PPSQLKVStore numberForKey:v8 transaction:v4];

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)_addDefaultUpdateHandlersForAllNamespacesWithGuardedData:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  id location = 0;
  objc_initWeak(&location, self);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obj = self->_namespaceNamesIdsDict;
  uint64_t v5 = [(NSDictionary *)obj countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * v7);
        trialClient = self->_trialClient;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __75__PPTrialWrapper__addDefaultUpdateHandlersForAllNamespacesWithGuardedData___block_invoke;
        v12[3] = &unk_1E65DB918;
        objc_copyWeak(&v15, &location);
        id v13 = v4;
        uint64_t v14 = v8;
        id v10 = [(TRIClient *)trialClient addUpdateHandlerForNamespaceName:v8 usingBlock:v12];
        if (v10) {
          [v4[2] addObject:v10];
        }

        objc_destroyWeak(&v15);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSDictionary *)obj countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v5);
  }

  objc_destroyWeak(&location);
}

void __75__PPTrialWrapper__addDefaultUpdateHandlersForAllNamespacesWithGuardedData___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = pp_default_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_DEFAULT, "PPTrialWrapper: invoking refresh", buf, 2u);
    }

    uint64_t v4 = objc_opt_new();
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v4;

    [WeakRetained[5] refresh];
    [WeakRetained _updateConcatenatedTreatmentNamesAndHash];
    id v7 = WeakRetained[4];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __75__PPTrialWrapper__addDefaultUpdateHandlersForAllNamespacesWithGuardedData___block_invoke_84;
    v8[3] = &unk_1E65DB8F0;
    v8[4] = *(void *)(a1 + 40);
    [v7 writeTransactionWithClient:6 block:v8];
  }
}

void __75__PPTrialWrapper__addDefaultUpdateHandlersForAllNamespacesWithGuardedData___block_invoke_84(uint64_t a1, void *a2)
{
  id v3 = NSNumber;
  id v4 = a2;
  id v7 = (id)objc_opt_new();
  [v7 timeIntervalSince1970];
  uint64_t v5 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v6 = (void *)[[NSString alloc] initWithFormat:@"trial_update_%@", *(void *)(a1 + 32)];
  +[PPSQLKVStore setNumber:v5 forKey:v6 transaction:v4];
}

- (void)dealloc
{
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__PPTrialWrapper_dealloc__block_invoke;
  v5[3] = &unk_1E65DB8C8;
  v5[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v5];
  v4.receiver = self;
  v4.super_class = (Class)PPTrialWrapper;
  [(PPTrialWrapper *)&v4 dealloc];
}

void __25__PPTrialWrapper_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(a2 + 16);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "removeUpdateHandlerForToken:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (PPTrialWrapper)initWithSettings:(id)a3 database:(id)a4 trialClient:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PPTrialWrapper;
  long long v11 = [(PPTrialWrapper *)&v27 init];
  uint64_t v12 = v11;
  if (v11)
  {
    namespaceNamesIdsDict = v11->_namespaceNamesIdsDict;
    v11->_namespaceNamesIdsDict = (NSDictionary *)&unk_1F256B190;

    id v14 = objc_alloc(MEMORY[0x1E4F93B70]);
    id v15 = objc_opt_new();
    uint64_t v16 = [v14 initWithGuardedData:v15];
    lock = v12->_lock;
    v12->_lock = (_PASLock *)v16;

    v12->_useDefaultFiles = [v8 trialUseDefaultFiles];
    objc_storeStrong((id *)&v12->_db, a4);
    objc_storeStrong((id *)&v12->_trialClient, a5);
    long long v18 = v12->_lock;
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    int v23 = __56__PPTrialWrapper_initWithSettings_database_trialClient___block_invoke;
    id v24 = &unk_1E65DB8A0;
    id v25 = v8;
    long long v19 = v12;
    long long v26 = v19;
    [(_PASLock *)v18 runWithLockAcquired:&v21];
    [(PPTrialWrapper *)v19 _updateConcatenatedTreatmentNamesAndHash];
  }
  return v12;
}

void __56__PPTrialWrapper_initWithSettings_database_trialClient___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = (void *)*((void *)v3 + 2);
  *((void *)v3 + 2) = v4;

  uint64_t v6 = [*(id *)(a1 + 32) trialPathOverrides];
  uint64_t v7 = objc_opt_new();
  id v8 = (void *)*((void *)v3 + 3);
  *((void *)v3 + 3) = v7;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v15 = [v9 objectForKeyedSubscript:v14];
        uint64_t v16 = (void *)[v15 mutableCopy];
        [*((id *)v3 + 3) setObject:v16 forKeyedSubscript:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v11);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v17 = [&unk_1F256AF10 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    long long v19 = 0;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(&unk_1F256AF10);
        }
        uint64_t v22 = [*(id *)(a1 + 40) lastTreatmentUpdateForNamespaceName:*(void *)(*((void *)&v27 + 1) + 8 * j)];
        int v23 = v22;
        if (!v19 || [v22 compare:v19] == 1)
        {
          id v24 = v23;

          long long v19 = v24;
        }
      }
      uint64_t v18 = [&unk_1F256AF10 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v18);
  }
  else
  {
    long long v19 = 0;
  }
  id v25 = (void *)*((void *)v3 + 4);
  *((void *)v3 + 4) = v19;
  id v26 = v19;

  [*(id *)(a1 + 40) _addDefaultUpdateHandlersForAllNamespacesWithGuardedData:v3];
}

+ (id)sharedTrialClient
{
  pthread_mutex_lock(&sharedTrialClient_lock);
  if (!sharedTrialClient_client)
  {
    uint64_t v2 = [MEMORY[0x1E4FB0098] clientWithIdentifier:100];
    id v3 = (void *)sharedTrialClient_client;
    sharedTrialClient_client = v2;

    [(id)sharedTrialClient_client refresh];
  }
  id v4 = (id)sharedTrialClient_client;
  pthread_mutex_unlock(&sharedTrialClient_lock);
  return v4;
}

@end