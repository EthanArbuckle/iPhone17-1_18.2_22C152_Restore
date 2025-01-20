@interface ATXConfiguredModeService
- (ATXConfiguredModeService)init;
- (BOOL)_isActivityTypeConfigured:(unint64_t)a3 uuid:(id *)a4 allowsSmartEntry:(BOOL *)a5 userModeName:(id *)a6 dndConfigs:(id)a7;
- (BOOL)_isActivityWithUUIDConfigured:(id)a3 activityType:(unint64_t *)a4 allowsSmartEntry:(BOOL *)a5 userModeName:(id *)a6 dndConfigs:(id)a7;
- (BOOL)_isSmartActivationEnabled:(id)a3;
- (BOOL)isActivityTypeConfigured:(unint64_t)a3;
- (BOOL)isActivityTypeConfigured:(unint64_t)a3 uuid:(id *)a4 allowsSmartEntry:(BOOL *)a5 userModeName:(id *)a6;
- (BOOL)isActivityWithUUIDConfigured:(id)a3;
- (BOOL)isActivityWithUUIDConfigured:(id)a3 activityType:(unint64_t *)a4 allowsSmartEntry:(BOOL *)a5 userModeName:(id *)a6;
- (id)DNDModeConfigurationForActivityWithUUID:(id)a3;
- (id)_DNDModeConfigurationForActivityWithUUID:(id)a3 dndConfigs:(id)a4;
- (id)_cacheAndReturnDNDModeConfigurationDictionary;
- (id)_modeConfigurationsReturningError:(id *)a3;
- (id)_retrieveCachedDNDModeConfigurationDictionary;
- (void)_cacheDNDModeConfigurationDictionary:(id)a3;
- (void)_checkIfConfigurationOfCurrentModeChangedWithDNDConfigs:(id)a3;
- (void)_createServiceIfNeeded;
- (void)_retrieveCachedDNDModeConfigurationDictionary;
- (void)_updateUserDefaultsForAnyNewlyAddedModesWithDNDConfigs:(id)a3;
- (void)_updateUserDefaultsWithAnySmartActivationUpdatesWithDNDConfigs:(id)a3;
- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4;
@end

@implementation ATXConfiguredModeService

- (ATXConfiguredModeService)init
{
  v10.receiver = self;
  v10.super_class = (Class)ATXConfiguredModeService;
  v2 = [(ATXConfiguredModeService *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F4B638]);
    v4 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"DNDModeConfigurationsCache"];
    v5 = __atxlog_handle_modes();
    uint64_t v6 = [v3 initWithCacheFilePath:v4 loggingHandle:v5 debugName:@"mode configurations"];
    cache = v2->_cache;
    v2->_cache = (ATXGenericFileBasedCache *)v6;

    [(ATXConfiguredModeService *)v2 _createServiceIfNeeded];
    id v8 = [(ATXConfiguredModeService *)v2 _cacheAndReturnDNDModeConfigurationDictionary];
  }
  return v2;
}

- (void)_createServiceIfNeeded
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DAFF9000, log, OS_LOG_TYPE_ERROR, "ATXConfiguredModeService: Could not reference DNDModeConfigurationService", v1, 2u);
}

void __50__ATXConfiguredModeService__createServiceIfNeeded__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    v5 = __atxlog_handle_modes();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __50__ATXConfiguredModeService__createServiceIfNeeded__block_invoke_cold_1();
    }
  }
}

- (id)_cacheAndReturnDNDModeConfigurationDictionary
{
  uint64_t v5 = 0;
  id v3 = [(ATXConfiguredModeService *)self _modeConfigurationsReturningError:&v5];
  if (!v5) {
    [(ATXConfiguredModeService *)self _cacheDNDModeConfigurationDictionary:v3];
  }

  return v3;
}

- (void)_cacheDNDModeConfigurationDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E0187360]();
  uint64_t v6 = __atxlog_handle_modes();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DAFF9000, v6, OS_LOG_TYPE_INFO, "ATXConfiguredModeService: Caching DND mode configs as a backup", v7, 2u);
  }

  if (v4) {
    [(ATXGenericFileBasedCache *)self->_cache storeSecureCodedObject:v4 error:0];
  }
}

- (id)_retrieveCachedDNDModeConfigurationDictionary
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  id v3 = (void *)getDNDModeConfigurationClass_softClass;
  uint64_t v15 = getDNDModeConfigurationClass_softClass;
  if (!getDNDModeConfigurationClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getDNDModeConfigurationClass_block_invoke;
    v11[3] = &unk_1E6BE6D38;
    v11[4] = &v12;
    __getDNDModeConfigurationClass_block_invoke((uint64_t)v11);
    id v3 = (void *)v13[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v12, 8);
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E0187360]();
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "initWithObjects:", v7, v4, objc_opt_class(), 0);
    v9 = [(ATXGenericFileBasedCache *)self->_cache readSecureCodedObjectWithMaxValidAge:v8 allowableClasses:0 error:2419200.0];
  }
  else
  {
    id v8 = __atxlog_handle_modes();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ATXConfiguredModeService _retrieveCachedDNDModeConfigurationDictionary](v8);
    }
    v9 = 0;
  }

  return v9;
}

- (BOOL)isActivityTypeConfigured:(unint64_t)a3
{
  return [(ATXConfiguredModeService *)self isActivityTypeConfigured:a3 uuid:0 allowsSmartEntry:0 userModeName:0];
}

- (BOOL)isActivityTypeConfigured:(unint64_t)a3 uuid:(id *)a4 allowsSmartEntry:(BOOL *)a5 userModeName:(id *)a6
{
  v11 = [(ATXConfiguredModeService *)self _modeConfigurationsReturningError:0];
  LOBYTE(a6) = [(ATXConfiguredModeService *)self _isActivityTypeConfigured:a3 uuid:a4 allowsSmartEntry:a5 userModeName:a6 dndConfigs:v11];

  return (char)a6;
}

- (BOOL)_isActivityTypeConfigured:(unint64_t)a3 uuid:(id *)a4 allowsSmartEntry:(BOOL *)a5 userModeName:(id *)a6 dndConfigs:(id)a7
{
  id v11 = a7;
  if (v11)
  {
    uint64_t v12 = __atxlog_handle_modes();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ATXConfiguredModeService _isActivityTypeConfigured:uuid:allowsSmartEntry:userModeName:dndConfigs:]();
    }

    v13 = ATXActivityTypeToModeSemanticType(a3);
    uint64_t v14 = v13;
    if (v13)
    {
      uint64_t v15 = [v13 integerValue];
      uint64_t v29 = 0;
      v30 = &v29;
      uint64_t v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__6;
      v33 = __Block_byref_object_dispose__6;
      id v34 = 0;
      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x3032000000;
      v26 = __Block_byref_object_copy__6;
      v27 = __Block_byref_object_dispose__6;
      id v28 = 0;
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      char v22 = 0;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __100__ATXConfiguredModeService__isActivityTypeConfigured_uuid_allowsSmartEntry_userModeName_dndConfigs___block_invoke;
      v18[3] = &unk_1E6BE6ED0;
      v18[4] = &v29;
      v18[5] = &v23;
      v18[6] = &v19;
      v18[7] = v15;
      [v11 enumerateKeysAndObjectsUsingBlock:v18];
      if (a4) {
        *a4 = (id) v30[5];
      }
      if (a6) {
        *a6 = (id) v24[5];
      }
      if (a5) {
        *a5 = *((unsigned char *)v20 + 24);
      }
      BOOL v16 = v30[5] != 0;
      _Block_object_dispose(&v19, 8);
      _Block_object_dispose(&v23, 8);

      _Block_object_dispose(&v29, 8);
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

void __100__ATXConfiguredModeService__isActivityTypeConfigured_uuid_allowsSmartEntry_userModeName_dndConfigs___block_invoke(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v18 = a3;
  id v6 = [v18 mode];
  uint64_t v7 = [v6 semanticType];
  uint64_t v8 = a1[7];

  if (v7 == v8)
  {
    v9 = [v18 mode];
    objc_super v10 = [v9 identifier];
    uint64_t v11 = [v10 UUIDString];
    uint64_t v12 = *(void *)(a1[4] + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    uint64_t v14 = [v18 mode];
    uint64_t v15 = [v14 name];
    uint64_t v16 = *(void *)(a1[5] + 8);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v18 allowSmartEntry] == 2;
    *a4 = 1;
  }
}

- (BOOL)isActivityWithUUIDConfigured:(id)a3
{
  return [(ATXConfiguredModeService *)self isActivityWithUUIDConfigured:a3 activityType:0 allowsSmartEntry:0 userModeName:0];
}

- (BOOL)isActivityWithUUIDConfigured:(id)a3 activityType:(unint64_t *)a4 allowsSmartEntry:(BOOL *)a5 userModeName:(id *)a6
{
  v9 = [(ATXConfiguredModeService *)self DNDModeConfigurationForActivityWithUUID:a3];
  objc_super v10 = v9;
  if (!a4)
  {
LABEL_4:
    if (!a5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v9)
  {
    uint64_t v11 = [v9 mode];
    *a4 = DNDModeSemanticTypeToATXActivityType([v11 semanticType]);

    goto LABEL_4;
  }
  *a4 = 0;
  if (a5) {
LABEL_5:
  }
    *a5 = [v10 allowSmartEntry] == 2;
LABEL_6:
  if (a6)
  {
    uint64_t v12 = [v10 mode];
    *a6 = [v12 name];
  }
  return v10 != 0;
}

- (BOOL)_isActivityWithUUIDConfigured:(id)a3 activityType:(unint64_t *)a4 allowsSmartEntry:(BOOL *)a5 userModeName:(id *)a6 dndConfigs:(id)a7
{
  objc_super v10 = [(ATXConfiguredModeService *)self _DNDModeConfigurationForActivityWithUUID:a3 dndConfigs:a7];
  uint64_t v11 = v10;
  if (!a4)
  {
LABEL_4:
    if (!a5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v10)
  {
    uint64_t v12 = [v10 mode];
    *a4 = DNDModeSemanticTypeToATXActivityType([v12 semanticType]);

    goto LABEL_4;
  }
  *a4 = 0;
  if (a5) {
LABEL_5:
  }
    *a5 = [v11 allowSmartEntry] == 2;
LABEL_6:
  if (a6)
  {
    v13 = [v11 mode];
    *a6 = [v13 name];
  }
  return v11 != 0;
}

- (id)DNDModeConfigurationForActivityWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATXConfiguredModeService *)self _modeConfigurationsReturningError:0];
  id v6 = [(ATXConfiguredModeService *)self _DNDModeConfigurationForActivityWithUUID:v4 dndConfigs:v5];

  return v6;
}

- (id)_DNDModeConfigurationForActivityWithUUID:(id)a3 dndConfigs:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = __atxlog_handle_modes();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[ATXConfiguredModeService _isActivityTypeConfigured:uuid:allowsSmartEntry:userModeName:dndConfigs:]();
    }

    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__6;
    v17 = __Block_byref_object_dispose__6;
    id v18 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __80__ATXConfiguredModeService__DNDModeConfigurationForActivityWithUUID_dndConfigs___block_invoke;
    v10[3] = &unk_1E6BE6EF8;
    id v11 = v5;
    uint64_t v12 = &v13;
    [v6 enumerateKeysAndObjectsUsingBlock:v10];
    id v8 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __80__ATXConfiguredModeService__DNDModeConfigurationForActivityWithUUID_dndConfigs___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v11 = a3;
  uint64_t v7 = [v11 mode];
  id v8 = [v7 identifier];
  v9 = [v8 UUIDString];
  int v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

- (void)_checkIfConfigurationOfCurrentModeChangedWithDNDConfigs:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[ATXUserFocusInferredMode currentMode];
  id v6 = v5;
  if (!v5 || ([v5 isAutomationEnabled] & 1) != 0) {
    goto LABEL_15;
  }
  unsigned __int8 v35 = 0;
  id v7 = [v6 modeIdentifier];
  uint64_t v8 = BMUserFocusInferredModeTypeToActivity([v6 modeType]);
  uint64_t v34 = v8;
  v9 = [v6 userModeName];
  int v10 = v9;
  if (!v7)
  {
    id v31 = v9;
    id v32 = 0;
    [(ATXConfiguredModeService *)self _isActivityTypeConfigured:v8 uuid:&v32 allowsSmartEntry:&v35 userModeName:&v31 dndConfigs:v4];
    id v7 = v32;
    id v14 = v31;
    id v12 = v10;
LABEL_9:

    id v12 = v14;
    goto LABEL_10;
  }
  id v33 = v9;
  BOOL v11 = [(ATXConfiguredModeService *)self _isActivityWithUUIDConfigured:v7 activityType:&v34 allowsSmartEntry:&v35 userModeName:&v33 dndConfigs:v4];
  id v12 = v33;

  if (!v11)
  {
    uint64_t v13 = __atxlog_handle_modes();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DAFF9000, v13, OS_LOG_TYPE_DEFAULT, "ATXConfiguredModeService: mode is no longer configured, updating suggestion to have nil modeUUID and userModeName", buf, 2u);
    }

    id v14 = 0;
    id v7 = 0;
    goto LABEL_9;
  }
LABEL_10:
  if (v35)
  {
    id v30 = v12;
    uint64_t v15 = ATXActivityTypeToBMUserFocusInferredModeType(v34);
    uint64_t v16 = __atxlog_handle_modes();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v37 = v7;
      __int16 v38 = 2048;
      uint64_t v39 = (int)v15;
      _os_log_impl(&dword_1DAFF9000, v16, OS_LOG_TYPE_DEFAULT, "ATXConfiguredModeService: New mode (modeUUID: %{public}@, type: %lu) was updated to now allow smart trigger. Updating mode inference with smart entry enabled", buf, 0x16u);
    }

    unsigned int v29 = [v6 origin];
    id v28 = [v6 originAnchorType];
    v17 = [v6 originBundleID];
    [v6 confidenceScore];
    double v19 = v18;
    v20 = [v6 serializedTriggers];
    uint64_t v21 = v15;
    unsigned __int8 v22 = v35;
    uint64_t v23 = BiomeLibrary();
    v24 = [v23 UserFocus];
    uint64_t v25 = [v24 InferredMode];
    LOWORD(v27) = v22;
    id v12 = v30;
    id v26 = +[ATXModeClassifier updateModeWithUUID:userModeName:modeType:modeOrigin:originAnchorType:originBundleId:uiLocation:confidenceScore:serializedTriggers:allowsSmartEntry:shouldSuggestTriggers:currentMode:stream:](ATXModeClassifier, "updateModeWithUUID:userModeName:modeType:modeOrigin:originAnchorType:originBundleId:uiLocation:confidenceScore:serializedTriggers:allowsSmartEntry:shouldSuggestTriggers:currentMode:stream:", v7, v30, v21, v29, v28, v17, v19, 1, v20, v27, v6, v25);
  }
LABEL_15:
}

- (id)_modeConfigurationsReturningError:(id *)a3
{
  [(ATXConfiguredModeService *)self _createServiceIfNeeded];
  service = self->_service;
  id v13 = 0;
  id v6 = [(DNDModeConfigurationService *)service modeConfigurationsReturningError:&v13];
  id v7 = v13;
  uint64_t v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    int v10 = __atxlog_handle_modes();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXConfiguredModeService _modeConfigurationsReturningError:]();
    }

    uint64_t v11 = [(ATXConfiguredModeService *)self _retrieveCachedDNDModeConfigurationDictionary];

    id v6 = (void *)v11;
  }
  if (a3) {
    *a3 = v8;
  }

  return v6;
}

- (void)_updateUserDefaultsForAnyNewlyAddedModesWithDNDConfigs:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = (objc_class *)MEMORY[0x1E4F1CB18];
    id v4 = a3;
    id v5 = [v3 alloc];
    id v6 = (void *)[v5 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    uint64_t v7 = *MEMORY[0x1E4F4B6B0];
    uint64_t v8 = [v6 objectForKey:*MEMORY[0x1E4F4B6B0]];
    if (v8)
    {
      BOOL v9 = [MEMORY[0x1E4F1CA80] setWithArray:v8];
    }
    else
    {
      BOOL v9 = objc_opt_new();
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__ATXConfiguredModeService__updateUserDefaultsForAnyNewlyAddedModesWithDNDConfigs___block_invoke;
    v13[3] = &unk_1E6BE6F20;
    id v10 = v9;
    id v14 = v10;
    [v4 enumerateKeysAndObjectsUsingBlock:v13];

    uint64_t v11 = __atxlog_handle_modes();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_1DAFF9000, v11, OS_LOG_TYPE_DEFAULT, "ATXConfiguredModeService: historically configured mode semantic types: %@", buf, 0xCu);
    }

    id v12 = [v10 allObjects];
    [v6 setObject:v12 forKey:v7];
  }
}

void __83__ATXConfiguredModeService__updateUserDefaultsForAnyNewlyAddedModesWithDNDConfigs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 mode];
  uint64_t v5 = [v4 semanticType];

  id v6 = *(void **)(a1 + 32);
  id v7 = [NSNumber numberWithInteger:v5];
  [v6 addObject:v7];
}

- (void)_updateUserDefaultsWithAnySmartActivationUpdatesWithDNDConfigs:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F1CB18];
    id v5 = a3;
    id v6 = [v4 alloc];
    id v7 = (void *)[v6 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    uint64_t v8 = *MEMORY[0x1E4F4B6B8];
    BOOL v9 = [v7 objectForKey:*MEMORY[0x1E4F4B6B8]];
    if (v9)
    {
      id v10 = [MEMORY[0x1E4F1CA80] setWithArray:v9];
    }
    else
    {
      id v10 = objc_opt_new();
    }
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __91__ATXConfiguredModeService__updateUserDefaultsWithAnySmartActivationUpdatesWithDNDConfigs___block_invoke;
    uint64_t v17 = &unk_1E6BE6F48;
    double v18 = self;
    id v11 = v10;
    id v19 = v11;
    [v5 enumerateKeysAndObjectsUsingBlock:&v14];

    id v12 = __atxlog_handle_modes();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v11;
      _os_log_impl(&dword_1DAFF9000, v12, OS_LOG_TYPE_DEFAULT, "ATXConfiguredModeService: smart activation was enabled at some point for these modes: %@", buf, 0xCu);
    }

    id v13 = objc_msgSend(v11, "allObjects", v14, v15, v16, v17, v18);
    [v7 setObject:v13 forKey:v8];
  }
}

void __91__ATXConfiguredModeService__updateUserDefaultsWithAnySmartActivationUpdatesWithDNDConfigs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 mode];
  uint64_t v6 = [v5 semanticType];

  LODWORD(v5) = [*(id *)(a1 + 32) _isSmartActivationEnabled:v4];
  if (v5)
  {
    id v7 = *(void **)(a1 + 40);
    id v8 = [NSNumber numberWithInteger:v6];
    [v7 addObject:v8];
  }
}

- (BOOL)_isSmartActivationEnabled:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v11 = a3;
  id v3 = [v11 triggers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v17 = 0;
        double v18 = &v17;
        uint64_t v19 = 0x2050000000;
        id v8 = (void *)getDNDModeConfigurationSmartTriggerClass_softClass;
        uint64_t v20 = getDNDModeConfigurationSmartTriggerClass_softClass;
        if (!getDNDModeConfigurationSmartTriggerClass_softClass)
        {
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __getDNDModeConfigurationSmartTriggerClass_block_invoke;
          v16[3] = &unk_1E6BE6D38;
          v16[4] = &v17;
          __getDNDModeConfigurationSmartTriggerClass_block_invoke((uint64_t)v16);
          id v8 = (void *)v18[3];
        }
        id v9 = v8;
        _Block_object_dispose(&v17, 8);
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v4) = [v7 enabledSetting] == 2;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v21 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v4;
}

- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4
{
  uint64_t v5 = __atxlog_handle_modes();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1DAFF9000, v5, OS_LOG_TYPE_DEFAULT, "ATXConfiguredModeService: mode configuration did change. Checking if this affects the current mode and if any new modes were added", v7, 2u);
  }

  uint64_t v6 = [(ATXConfiguredModeService *)self _cacheAndReturnDNDModeConfigurationDictionary];
  [(ATXConfiguredModeService *)self _updateUserDefaultsForAnyNewlyAddedModesWithDNDConfigs:v6];
  [(ATXConfiguredModeService *)self _updateUserDefaultsWithAnySmartActivationUpdatesWithDNDConfigs:v6];
  [(ATXConfiguredModeService *)self _checkIfConfigurationOfCurrentModeChangedWithDNDConfigs:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

void __50__ATXConfiguredModeService__createServiceIfNeeded__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1DAFF9000, v0, OS_LOG_TYPE_ERROR, "ATXConfiguredModeService: Adding a listener failed with error: %@", v1, 0xCu);
}

- (void)_retrieveCachedDNDModeConfigurationDictionary
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DAFF9000, log, OS_LOG_TYPE_ERROR, "ATXConfiguredModeService: Could not get DNDModeConfiguration class", v1, 2u);
}

- (void)_isActivityTypeConfigured:uuid:allowsSmartEntry:userModeName:dndConfigs:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1DAFF9000, v0, OS_LOG_TYPE_DEBUG, "ATXConfiguredModeService: configured modes: %@", v1, 0xCu);
}

- (void)_modeConfigurationsReturningError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1DAFF9000, v0, OS_LOG_TYPE_ERROR, "ATXConfiguredModeService: Could not obtain DND mode configurations with error: %{public}@", v1, 0xCu);
}

@end