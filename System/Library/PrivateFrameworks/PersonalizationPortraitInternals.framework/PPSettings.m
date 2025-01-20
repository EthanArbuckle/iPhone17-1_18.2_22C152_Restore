@interface PPSettings
+ (BOOL)isCloudSyncEnabled;
+ (BOOL)isVoiceAssistantEnabled;
+ (id)cloudSyncDisabledFirstPartyBundleIds;
+ (id)sharedInstance;
+ (void)clearTestSettings;
+ (void)disableBundleIdentifier:(id)a3;
- (BOOL)bundleIdentifierIsEnabledForCloudKit:(id)a3;
- (BOOL)bundleIdentifierIsEnabledForDonation:(id)a3;
- (BOOL)hasWrittenSharedWithYouContentAvailable;
- (BOOL)hasWrittenSharedWithYouContentConsumed;
- (BOOL)isAppConnectionsLocationsEnabled;
- (BOOL)isAuthorizedToLogLocation;
- (BOOL)queryPlanLoggingEnabled;
- (BOOL)showLocationsFoundInApps;
- (BOOL)trialUseDefaultFiles;
- (PPSettings)init;
- (double)assetMetadataRefreshIntervalSeconds;
- (double)weightMultiplier;
- (id)_donationDisabledBundleIds;
- (id)abGroupOverride;
- (id)assetDefaultBundleOverridePathForAssetIdentifier:(id)a3;
- (id)entitiesBackfilledTimestamp;
- (id)entitiesMappingPreviousTrieSha256;
- (id)trialPathOverrideForNamespaceName:(id)a3 factorName:(id)a4;
- (id)trialPathOverrides;
- (id)userDefaults;
- (int)registerDisabledBundleIdentifierChangeHandler:(id)a3;
- (int)registerQueryPlanLoggingChangeHandler:(id)a3;
- (uint64_t)_invokeChangeHandlersAsync;
- (void)_purgeRecordsForDisabledBundleIdsAsync;
- (void)_refreshCloudKitDisabledBundleIds;
- (void)_refreshDisabledBundleIds;
- (void)_triggerDelayedBundleIdPurge;
- (void)_triggerDelayedOperationWithCoalescingToken:(void *)a3 operation:;
- (void)_updateAppConnectionsSettings;
- (void)clearAssetMetadataRefreshIntervalSeconds;
- (void)deregisterDisabledBundleIdentifierChangeHandlerWithToken:(int)a3;
- (void)deregisterQueryPlanLoggingChangeHandlerWithToken:(int)a3;
- (void)refreshCloudKitDisabledBundleIdsAsync;
- (void)registerCloudKitDisabledBundleIdRewriteHandler;
- (void)registerDisabledBundleIdPurgeHandler;
- (void)rewriteSyncStateForDisabledBundleIdsAsync;
- (void)setAppConnectionsLocationsEnabled:(BOOL)a3;
- (void)setAssetDefaultBundleOverridePath:(id)a3 assetIdentifier:(id)a4;
- (void)setAssetMetadataRefreshIntervalSeconds:(double)a3;
- (void)setEntitiesBackfilledTimestamp:(id)a3;
- (void)setEntitiesMappingTrieSha256:(id)a3;
- (void)setQueryPlanLoggingEnabled:(BOOL)a3;
- (void)setTrialPathOverrideForNamespaceName:(id)a3 factorName:(id)a4 path:(id)a5;
- (void)setTrialUseDefaultFiles:(BOOL)a3;
- (void)setWrittenSharedWithYouContentAvailable:(BOOL)a3;
- (void)setWrittenSharedWithYouContentConsumed:(BOOL)a3;
- (void)triggerDelayedCloudSyncRewrite;
@end

@implementation PPSettings

uint64_t __46__PPSettings_isAppConnectionsLocationsEnabled__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 52);
  return result;
}

- (void)_refreshDisabledBundleIds
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = *(void **)(a1 + 16);
    if (v2)
    {
      uint64_t v3 = [v2 objectForKey:@"SiriCanLearnFromAppBlacklist"];
      v4 = (void *)v3;
      v5 = (void *)MEMORY[0x1E4F1CBF0];
      if (v3) {
        v5 = (void *)v3;
      }
      id v6 = v5;

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v6];
        [v7 addObject:*MEMORY[0x1E4F8A088]];
        if (!+[PPSettings isVoiceAssistantEnabled])
        {
          v8 = (void *)MEMORY[0x1CB79D060]();
          v9 = pp_default_log_handle();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "Portrait access to Siri is disabled.", buf, 2u);
          }

          [v7 addObject:*MEMORY[0x1E4F8A0F8]];
        }
        v10 = (void *)[v7 mutableCopy];
        v11 = *(void **)(a1 + 24);
        uint64_t v16 = MEMORY[0x1E4F143A8];
        uint64_t v17 = 3221225472;
        v18 = __39__PPSettings__refreshDisabledBundleIds__block_invoke;
        v19 = &unk_1E65D51C0;
        id v20 = v10;
        v12 = v7;
        v21 = v12;
        id v13 = v10;
        [v11 runWithLockAcquired:&v16];
        v14 = pp_default_log_handle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [v12 count];
          *(_DWORD *)buf = 134217984;
          uint64_t v23 = v15;
          _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_DEFAULT, "PPSettings loaded %lu disabled bundleIds from prefs", buf, 0xCu);
        }
      }
      else
      {
        v12 = pp_default_log_handle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_ERROR, "PPSettings found unexpected value type for disabled bundleIds.", buf, 2u);
        }
      }
    }
  }
}

+ (BOOL)isVoiceAssistantEnabled
{
  v2 = [getAFPreferencesClass() sharedPreferences];
  char v3 = [v2 assistantIsEnabled];

  return v3;
}

uint64_t __43__PPSettings__updateAppConnectionsSettings__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v4 = a2;
  v4[52] = [v2 showLocationsFoundInApps];
  return MEMORY[0x1F41817F8]();
}

- (BOOL)showLocationsFoundInApps
{
  uint64_t v2 = *MEMORY[0x1E4F8A0A0];
  char v3 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  LOBYTE(v2) = [v3 containsObject:v2] ^ 1;

  return v2;
}

void __18__PPSettings_init__block_invoke(uint64_t a1)
{
  uint64_t v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)char v3 = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_INFO, "PPSettings: Suggestions settings changed", v3, 2u);
  }

  -[PPSettings _updateAppConnectionsSettings](*(void **)(a1 + 32));
}

- (void)_updateAppConnectionsSettings
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = pp_default_log_handle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_INFO, "PPSettings: reading App Connections settings...", buf, 2u);
    }

    char v3 = (void *)a1[3];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__PPSettings__updateAppConnectionsSettings__block_invoke;
    v6[3] = &unk_1E65D5198;
    v6[4] = a1;
    [v3 runWithLockAcquired:v6];
    v4 = pp_default_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = [a1 isAppConnectionsLocationsEnabled];
      *(_DWORD *)buf = 67109120;
      int v8 = v5;
      _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_INFO, "PPSettings: appConnectionsLocationsEnabled = %d", buf, 8u);
    }
  }
}

- (BOOL)isAppConnectionsLocationsEnabled
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PPSettings_isAppConnectionsLocationsEnabled__block_invoke;
  v5[3] = &unk_1E65D51E8;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __42__PPSettings__triggerDelayedBundleIdPurge__block_invoke(uint64_t a1)
{
}

- (BOOL)bundleIdentifierIsEnabledForDonation:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F93B18] waitForSemaphore:self->_initializationComplete timeoutSeconds:5.0] == 1)
  {
    int v5 = pp_default_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "timed out waiting on PPSettings initialization", buf, 2u);
    }
    LOBYTE(v6) = 0;
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_initializationComplete);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v18 = __Block_byref_object_copy__3385;
    v19 = __Block_byref_object_dispose__3386;
    id v20 = 0;
    lock = self->_lock;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__PPSettings_bundleIdentifierIsEnabledForDonation___block_invoke;
    v16[3] = &unk_1E65D51E8;
    v16[4] = buf;
    [(_PASLock *)lock runWithLockAcquired:v16];
    int v5 = *(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

    if ([v5 containsObject:v4])
    {
      BOOL v6 = 0;
    }
    else
    {
      uint64_t v8 = [(id)*MEMORY[0x1E4F8A118] objectForKeyedSubscript:v4];
      char v9 = (void *)v8;
      if (v8) {
        v10 = (void *)v8;
      }
      else {
        v10 = (void *)MEMORY[0x1E4F1CBF0];
      }
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __51__PPSettings_bundleIdentifierIsEnabledForDonation___block_invoke_2;
      v14[3] = &unk_1E65D5340;
      uint64_t v15 = v5;
      BOOL v6 = [v10 indexOfObjectPassingTest:v14] == 0x7FFFFFFFFFFFFFFFLL;
    }
    v11 = pp_default_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v13 = @"Blocking";
      if (v6) {
        id v13 = @"Admitting";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      _os_log_debug_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEBUG, "PPSettings: %@ content from bundleIdentifier: %@", buf, 0x16u);
    }
  }
  return v6;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__PPSettings_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken4 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken4, block);
  }
  uint64_t v2 = (void *)sharedInstance__pasExprOnceResult_3484;
  return v2;
}

void __52__PPSettings__purgeRecordsForDisabledBundleIdsAsync__block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  -[PPSettings _refreshDisabledBundleIds](*(void *)(a1 + 32));
  uint64_t v2 = -[PPSettings _donationDisabledBundleIds](*(void *)(a1 + 32));
  char v3 = pp_default_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = [v2 count];
    _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_DEFAULT, "PPSettings triggering purge of records from %lu disabled bundleIds.", buf, 0xCu);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v29;
    *(void *)&long long v5 = 138412290;
    long long v23 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8 * v8);
        v10 = +[PPLocalNamedEntityStore defaultStore];
        id v27 = 0;
        char v11 = [v10 deleteAllNamedEntitiesFromSourcesWithBundleId:v9 deletedCount:0 error:&v27];
        id v12 = v27;

        if ((v11 & 1) == 0)
        {
          id v13 = pp_default_log_handle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v23;
            uint64_t v34 = (uint64_t)v12;
            _os_log_error_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_ERROR, "PPSettings failed to purge named entity records from disabled bundleId: %@", buf, 0xCu);
          }
        }
        v14 = +[PPLocalTopicStore defaultStore];
        id v26 = 0;
        char v15 = [v14 deleteAllTopicsFromSourcesWithBundleId:v9 deletedCount:0 error:&v26];
        id v16 = v26;

        if ((v15 & 1) == 0)
        {
          uint64_t v17 = pp_default_log_handle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v23;
            uint64_t v34 = (uint64_t)v16;
            _os_log_error_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_ERROR, "PPSettings failed to purge topic records from disabled bundleId: %@", buf, 0xCu);
          }
        }
        v18 = +[PPLocalLocationStore defaultStore];
        id v25 = 0;
        char v19 = [v18 deleteAllLocationsFromSourcesWithBundleId:v9 deletedCount:0 error:&v25];
        id v20 = v25;

        if ((v19 & 1) == 0)
        {
          uint64_t v21 = pp_default_log_handle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v23;
            uint64_t v34 = (uint64_t)v20;
            _os_log_error_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_ERROR, "PPSettings failed to purge location records from disabled bundleId: %@", buf, 0xCu);
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v6);
  }

  v22 = pp_default_log_handle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v22, OS_LOG_TYPE_DEFAULT, "PPSettings completed disabled bundleId purge.", buf, 2u);
  }

  atomic_store(0, _purgeRecordsForDisabledBundleIdsAsync_isInQueue);
}

- (id)_donationDisabledBundleIds
{
  if (a1)
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3032000000;
    char v11 = __Block_byref_object_copy__3385;
    id v12 = __Block_byref_object_dispose__3386;
    id v13 = 0;
    uint64_t v2 = *(void **)(a1 + 24);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__PPSettings__donationDisabledBundleIds__block_invoke;
    v7[3] = &unk_1E65D51E8;
    v7[4] = &v8;
    [v2 runWithLockAcquired:v7];
    id v3 = (id)v9[5];
    _Block_object_dispose(&v8, 8);

    if (!v3)
    {
      -[PPSettings _refreshDisabledBundleIds](a1);
      uint64_t v8 = 0;
      uint64_t v9 = &v8;
      uint64_t v10 = 0x3032000000;
      char v11 = __Block_byref_object_copy__3385;
      id v12 = __Block_byref_object_dispose__3386;
      id v13 = 0;
      uint64_t v4 = *(void **)(a1 + 24);
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __40__PPSettings__donationDisabledBundleIds__block_invoke_2;
      v6[3] = &unk_1E65D51E8;
      v6[4] = &v8;
      [v4 runWithLockAcquired:v6];
      id v3 = (id)v9[5];
      _Block_object_dispose(&v8, 8);
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

uint64_t __51__PPSettings_bundleIdentifierIsEnabledForDonation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

void __51__PPSettings_bundleIdentifierIsEnabledForDonation___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __40__PPSettings__donationDisabledBundleIds__block_invoke(uint64_t a1, uint64_t a2)
{
}

uint64_t __68__PPSettings__triggerDelayedOperationWithCoalescingToken_operation___block_invoke_2(uint64_t result)
{
  if (atomic_fetch_add(*(atomic_uint *volatile *)(result + 40), 0xFFFFFFFF) == 1) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __39__PPSettings__refreshDisabledBundleIds__block_invoke(uint64_t a1, id *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = a2 + 2;
  id v5 = a2[2];
  uint64_t v6 = a2;
  [v3 minusSet:v5];
  uint64_t v7 = pp_default_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    int v10 = 138412546;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    _os_log_debug_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEBUG, "PPSettings disabled bundles: %@ newly disabled: %@", (uint8_t *)&v10, 0x16u);
  }

  objc_storeStrong(v4, *(id *)(a1 + 40));
}

- (void)_purgeRecordsForDisabledBundleIdsAsync
{
  if (a1)
  {
    char v1 = 0;
    atomic_compare_exchange_strong((atomic_uchar *volatile)_purgeRecordsForDisabledBundleIdsAsync_isInQueue, (unsigned __int8 *)&v1, 1u);
    if (!v1)
    {
      uint64_t v2 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__PPSettings__purgeRecordsForDisabledBundleIdsAsync__block_invoke;
      block[3] = &unk_1E65DBE30;
      block[4] = a1;
      dispatch_async(v2, block);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryPlanLoggingKVOObserver, 0);
  objc_storeStrong((id *)&self->_abGroupKVObserver, 0);
  objc_storeStrong((id *)&self->_weightKVOObserver, 0);
  objc_storeStrong((id *)&self->_canLearnFromAppKVOObserver, 0);
  objc_storeStrong((id *)&self->_initializationComplete, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_canLearnFromAppDefaults, 0);
  objc_storeStrong((id *)&self->_portraitDefaults, 0);
}

- (BOOL)isAuthorizedToLogLocation
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/LocationBundles/WirelessDiagnostics.bundle"];
  BOOL v3 = [MEMORY[0x1E4F1E600] authorizationStatusForBundle:v2] == 3;

  return v3;
}

- (void)deregisterQueryPlanLoggingChangeHandlerWithToken:(int)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__PPSettings_deregisterQueryPlanLoggingChangeHandlerWithToken___block_invoke;
  v4[3] = &__block_descriptor_36_e31_v16__0__PPSettingsGuardedData_8l;
  int v5 = a3;
  [(_PASLock *)lock runWithLockAcquired:v4];
}

void __63__PPSettings_deregisterQueryPlanLoggingChangeHandlerWithToken___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a2 + 40);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  [v2 setObject:0 forKeyedSubscript:v3];
}

- (int)registerQueryPlanLoggingChangeHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PPSettings.m", 984, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  lock = self->_lock;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__PPSettings_registerQueryPlanLoggingChangeHandler___block_invoke;
  v10[3] = &unk_1E65D5230;
  __int16 v12 = &v13;
  id v7 = v5;
  id v11 = v7;
  [(_PASLock *)lock runWithLockAcquired:v10];
  LODWORD(lock) = *((_DWORD *)v14 + 6);

  _Block_object_dispose(&v13, 8);
  return (int)lock;
}

void __52__PPSettings_registerQueryPlanLoggingChangeHandler___block_invoke(uint64_t a1, _DWORD *a2)
{
  int v3 = a2[12];
  a2[12] = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  uint64_t v4 = *(const void **)(a1 + 32);
  id v5 = a2;
  id v8 = _Block_copy(v4);
  uint64_t v6 = (void *)v5[5];
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [v6 setObject:v8 forKeyedSubscript:v7];
}

- (BOOL)queryPlanLoggingEnabled
{
  uint64_t v2 = [(NSUserDefaults *)self->_portraitDefaults objectForKey:@"queryPlanLoggingEnabled"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)setQueryPlanLoggingEnabled:(BOOL)a3
{
  portraitDefaults = self->_portraitDefaults;
  if (a3) {
    [(NSUserDefaults *)portraitDefaults setObject:MEMORY[0x1E4F1CC38] forKey:@"queryPlanLoggingEnabled"];
  }
  else {
    [(NSUserDefaults *)portraitDefaults removeObjectForKey:@"queryPlanLoggingEnabled"];
  }
}

- (void)setWrittenSharedWithYouContentConsumed:(BOOL)a3
{
}

- (void)setWrittenSharedWithYouContentAvailable:(BOOL)a3
{
}

- (BOOL)hasWrittenSharedWithYouContentConsumed
{
  return [(NSUserDefaults *)self->_portraitDefaults BOOLForKey:@"WrittenSharedWithYouContentConsumed"];
}

- (BOOL)hasWrittenSharedWithYouContentAvailable
{
  return [(NSUserDefaults *)self->_portraitDefaults BOOLForKey:@"WrittenSharedWithYouContentAvailable"];
}

- (id)assetDefaultBundleOverridePathForAssetIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PPSettings.m", 923, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  uint64_t v6 = [(NSUserDefaults *)self->_portraitDefaults objectForKey:@"assetDefaultBundleOverridePaths"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = [v6 objectForKeyedSubscript:v5];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v8 = v7;
      }
      else {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)setTrialPathOverrideForNamespaceName:(id)a3 factorName:(id)a4 path:(id)a5
{
  id v25 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v25)
  {
    long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PPSettings.m", 893, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_22:
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PPSettings.m", 894, @"Invalid parameter not satisfying: %@", @"factorName" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_22;
  }
LABEL_3:
  id v11 = [(NSUserDefaults *)self->_portraitDefaults objectForKey:@"trialPathOverrides"];
  __int16 v12 = v11;
  if (v10
    || ([v11 objectForKeyedSubscript:v25],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        [v13 objectForKeyedSubscript:v9],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        v14))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v15 = [v12 mutableCopy];
    }
    else {
      uint64_t v15 = objc_opt_new();
    }
    int v16 = (void *)v15;
    uint64_t v17 = [v12 objectForKeyedSubscript:v25];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v18 = (void *)[v17 mutableCopy];
    }
    else {
      v18 = objc_opt_new();
    }
    char v19 = v18;
    [v18 setObject:v10 forKeyedSubscript:v9];
    if ([v19 count]) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }
    [v16 setObject:v20 forKeyedSubscript:v25];
    uint64_t v21 = [v16 count];
    portraitDefaults = self->_portraitDefaults;
    if (v21) {
      [(NSUserDefaults *)portraitDefaults setObject:v16 forKey:@"trialPathOverrides"];
    }
    else {
      [(NSUserDefaults *)portraitDefaults removeObjectForKey:@"trialPathOverrides"];
    }
  }
}

- (id)trialPathOverrideForNamespaceName:(id)a3 factorName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PPSettings.m", 882, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"PPSettings.m", 883, @"Invalid parameter not satisfying: %@", @"factorName" object file lineNumber description];

LABEL_3:
  id v10 = [(NSUserDefaults *)self->_portraitDefaults objectForKey:@"trialPathOverrides"];
  id v11 = [v10 objectForKeyedSubscript:v7];

  return v11;
}

- (void)setTrialUseDefaultFiles:(BOOL)a3
{
  portraitDefaults = self->_portraitDefaults;
  id v4 = [NSNumber numberWithBool:a3];
  [(NSUserDefaults *)portraitDefaults setObject:v4 forKey:@"trialUseDefaultFiles"];
}

- (BOOL)trialUseDefaultFiles
{
  uint64_t v2 = [(NSUserDefaults *)self->_portraitDefaults objectForKey:@"trialUseDefaultFiles"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)trialPathOverrides
{
  uint64_t v2 = [(NSUserDefaults *)self->_portraitDefaults objectForKey:@"trialPathOverrides"];
  char v3 = v2;
  if (!v2) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v4 = v2;

  return v4;
}

- (void)setAssetDefaultBundleOverridePath:(id)a3 assetIdentifier:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PPSettings.m", 846, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  id v8 = [(NSUserDefaults *)self->_portraitDefaults objectForKey:@"assetDefaultBundleOverridePaths"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = (void *)[v8 mutableCopy];
  }
  else {
    id v9 = objc_opt_new();
  }
  id v10 = v9;
  [v9 setObject:v14 forKeyedSubscript:v7];
  uint64_t v11 = [v10 count];
  portraitDefaults = self->_portraitDefaults;
  if (v11) {
    [(NSUserDefaults *)portraitDefaults setObject:v10 forKey:@"assetDefaultBundleOverridePaths"];
  }
  else {
    [(NSUserDefaults *)portraitDefaults removeObjectForKey:@"assetDefaultBundleOverridePaths"];
  }
}

- (double)assetMetadataRefreshIntervalSeconds
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(NSUserDefaults *)self->_portraitDefaults objectForKey:@"assetMetadataUpdateIntervalSeconds"];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v3 = pp_default_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      [v2 doubleValue];
      int v9 = 134217984;
      uint64_t v10 = v4;
      _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_DEFAULT, "Using asset metadata update interval override: %f sec", (uint8_t *)&v9, 0xCu);
    }

    [v2 doubleValue];
    double v6 = v5;
  }
  else
  {
    id v7 = pp_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      uint64_t v10 = 2;
      _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "Asset metadata update interval is unset, using default value of %tu days.", (uint8_t *)&v9, 0xCu);
    }

    double v6 = 172800.0;
  }

  return v6;
}

- (void)clearAssetMetadataRefreshIntervalSeconds
{
  char v3 = pp_default_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_DEFAULT, "Clearing asset metadata update interval.", v4, 2u);
  }

  [(NSUserDefaults *)self->_portraitDefaults removeObjectForKey:@"assetMetadataUpdateIntervalSeconds"];
}

- (void)setAssetMetadataRefreshIntervalSeconds:(double)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3 >= 1.0) {
    double v4 = a3;
  }
  else {
    double v4 = 1.0;
  }
  double v5 = pp_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    double v9 = v4;
    _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "Setting asset metadata update interval to: %f sec", (uint8_t *)&v8, 0xCu);
  }

  portraitDefaults = self->_portraitDefaults;
  id v7 = [NSNumber numberWithDouble:v4];
  [(NSUserDefaults *)portraitDefaults setObject:v7 forKey:@"assetMetadataUpdateIntervalSeconds"];
}

- (id)abGroupOverride
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__3385;
  uint64_t v10 = __Block_byref_object_dispose__3386;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__PPSettings_abGroupOverride__block_invoke;
  v5[3] = &unk_1E65D51E8;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __29__PPSettings_abGroupOverride__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (BOOL)bundleIdentifierIsEnabledForCloudKit:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F93B18] waitForSemaphore:self->_initializationComplete timeoutSeconds:5.0] == 1)
  {
    double v5 = pp_default_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "timed out waiting on PPSettings initialization", buf, 2u);
    }
    goto LABEL_5;
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_initializationComplete);
  *(void *)buf = 0;
  int v16 = buf;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3385;
  char v19 = __Block_byref_object_dispose__3386;
  id v20 = 0;
  lock = self->_lock;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__PPSettings_bundleIdentifierIsEnabledForCloudKit___block_invoke;
  v14[3] = &unk_1E65D51E8;
  void v14[4] = buf;
  [(_PASLock *)lock runWithLockAcquired:v14];
  double v5 = *((id *)v16 + 5);
  _Block_object_dispose(buf, 8);

  if ([v5 containsObject:v4])
  {
LABEL_5:
    BOOL v7 = 0;
    goto LABEL_10;
  }
  uint64_t v8 = [(id)*MEMORY[0x1E4F8A118] objectForKeyedSubscript:v4];
  double v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = (void *)v8;
  }
  else {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__PPSettings_bundleIdentifierIsEnabledForCloudKit___block_invoke_2;
  v12[3] = &unk_1E65D5340;
  double v5 = v5;
  uint64_t v13 = v5;
  BOOL v7 = [v10 indexOfObjectPassingTest:v12] == 0x7FFFFFFFFFFFFFFFLL;

LABEL_10:
  return v7;
}

void __51__PPSettings_bundleIdentifierIsEnabledForCloudKit___block_invoke(uint64_t a1, uint64_t a2)
{
}

uint64_t __51__PPSettings_bundleIdentifierIsEnabledForCloudKit___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (id)entitiesMappingPreviousTrieSha256
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__3385;
  uint64_t v10 = __Block_byref_object_dispose__3386;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__PPSettings_entitiesMappingPreviousTrieSha256__block_invoke;
  v5[3] = &unk_1E65D51E8;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__PPSettings_entitiesMappingPreviousTrieSha256__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)entitiesBackfilledTimestamp
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__3385;
  uint64_t v10 = __Block_byref_object_dispose__3386;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PPSettings_entitiesBackfilledTimestamp__block_invoke;
  v5[3] = &unk_1E65D51E8;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __41__PPSettings_entitiesBackfilledTimestamp__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (double)weightMultiplier
{
  uint64_t v6 = 0;
  BOOL v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__PPSettings_weightMultiplier__block_invoke;
  v5[3] = &unk_1E65D51E8;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __30__PPSettings_weightMultiplier__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 8);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)userDefaults
{
  return self->_portraitDefaults;
}

- (void)refreshCloudKitDisabledBundleIdsAsync
{
  char v2 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)refreshCloudKitDisabledBundleIdsAsync_isInQueue, (unsigned __int8 *)&v2, 1u);
  if (!v2)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PPSettings_refreshCloudKitDisabledBundleIdsAsync__block_invoke;
    block[3] = &unk_1E65DBE30;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __51__PPSettings_refreshCloudKitDisabledBundleIdsAsync__block_invoke(uint64_t a1)
{
}

- (void)_refreshCloudKitDisabledBundleIds
{
  v29[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F1CA80]);
    double v3 = +[PPSettings cloudSyncDisabledFirstPartyBundleIds];
    id v4 = (void *)[v2 initWithSet:v3];

    uint64_t v5 = *MEMORY[0x1E4F8A0E8];
    uint64_t v6 = *MEMORY[0x1E4F175E8];
    v28[0] = *MEMORY[0x1E4F17530];
    v28[1] = v6;
    uint64_t v7 = *MEMORY[0x1E4F8A0B8];
    v29[0] = v5;
    v29[1] = v7;
    v28[2] = *MEMORY[0x1E4F17630];
    v29[2] = *MEMORY[0x1E4F8A0F8];
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];
    uint64_t v9 = objc_opt_new();
    if (!v9)
    {
      uint64_t v10 = pp_default_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_ERROR, "PPSettings failed to open accountStore", buf, 2u);
      }
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __47__PPSettings__refreshCloudKitDisabledBundleIds__block_invoke;
    v23[3] = &unk_1E65D5318;
    id v24 = v9;
    id v11 = v4;
    id v25 = v11;
    id v12 = v9;
    [v8 enumerateKeysAndObjectsUsingBlock:v23];

    uint64_t v13 = (void *)TCCAccessCopyBundleIdentifiersDisabledForService();
    id v14 = (void *)TCCAccessCopyBundleIdentifiersDisabledForService();
    if (v13)
    {
      [v11 addObjectsFromArray:v13];
      uint64_t v15 = pp_default_log_handle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = (uint64_t)v13;
        _os_log_debug_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEBUG, "PPSettings TCC disabled for Ubiquity: %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v15 = pp_default_log_handle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_ERROR, "PPSettings failed to load bundleIds disabled for Ubiquity.", buf, 2u);
      }
    }

    if (v14)
    {
      [v11 addObjectsFromArray:v14];
      int v16 = pp_default_log_handle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = (uint64_t)v14;
        _os_log_debug_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEBUG, "PPSettings TCC disabled for Liverpool: %@", buf, 0xCu);
      }
    }
    else
    {
      int v16 = pp_default_log_handle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_ERROR, "PPSettings failed to load bundleIds disabled for Liverpool.", buf, 2u);
      }
    }

    uint64_t v17 = *(void **)(a1 + 24);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __47__PPSettings__refreshCloudKitDisabledBundleIds__block_invoke_223;
    v21[3] = &unk_1E65D5198;
    id v18 = v11;
    id v22 = v18;
    [v17 runWithLockAcquired:v21];
    char v19 = pp_default_log_handle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [v18 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v27 = v20;
      _os_log_impl(&dword_1CA9A8000, v19, OS_LOG_TYPE_DEFAULT, "PPSettings loaded %lu disabled bundleIds from CloudKit prefs.", buf, 0xCu);
    }
  }
}

void __47__PPSettings__refreshCloudKitDisabledBundleIds__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) accountIdentifiersEnabledForDataclass:v5];
  if (![v7 count]) {
    [*(id *)(a1 + 40) addObject:v6];
  }
  uint64_t v8 = pp_default_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = [v7 count];
    uint64_t v10 = "sync ok";
    int v11 = 138412802;
    id v12 = v5;
    if (!v9) {
      uint64_t v10 = "sync disable";
    }
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2080;
    int v16 = v10;
    _os_log_debug_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEBUG, "PPSettings checking dataclass %@ --> %@: %s", (uint8_t *)&v11, 0x20u);
  }
}

void __47__PPSettings__refreshCloudKitDisabledBundleIds__block_invoke_223(uint64_t a1, uint64_t a2)
{
}

- (void)triggerDelayedCloudSyncRewrite
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__PPSettings_triggerDelayedCloudSyncRewrite__block_invoke;
  v2[3] = &unk_1E65DBE30;
  v2[4] = self;
  -[PPSettings _triggerDelayedOperationWithCoalescingToken:operation:]((uint64_t)self, &triggerDelayedCloudSyncRewrite_pendingRewriteRequests, v2);
}

uint64_t __44__PPSettings_triggerDelayedCloudSyncRewrite__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) rewriteSyncStateForDisabledBundleIdsAsync];
}

- (void)_triggerDelayedOperationWithCoalescingToken:(void *)a3 operation:
{
  id v5 = a3;
  if (a1)
  {
    if (_triggerDelayedOperationWithCoalescingToken_operation___pasOnceToken33 != -1) {
      dispatch_once(&_triggerDelayedOperationWithCoalescingToken_operation___pasOnceToken33, &__block_literal_global_216);
    }
    id v6 = (void *)_triggerDelayedOperationWithCoalescingToken_operation___pasExprOnceResult;
    atomic_fetch_add(a2, 1u);
    uint64_t v7 = (void *)MEMORY[0x1E4F93B18];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__PPSettings__triggerDelayedOperationWithCoalescingToken_operation___block_invoke_2;
    v9[3] = &unk_1E65D8BF0;
    int v11 = a2;
    id v10 = v5;
    id v8 = v6;
    [v7 runAsyncOnQueue:v8 afterDelaySeconds:v9 block:180.0];
  }
}

void __68__PPSettings__triggerDelayedOperationWithCoalescingToken_operation___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.suggestions.ppsettings.delayed-operation-queue" qosClass:9];
  id v2 = (void *)_triggerDelayedOperationWithCoalescingToken_operation___pasExprOnceResult;
  _triggerDelayedOperationWithCoalescingToken_operation___pasExprOnceResult = v1;
}

- (void)rewriteSyncStateForDisabledBundleIdsAsync
{
  char v2 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)rewriteSyncStateForDisabledBundleIdsAsync_isInQueue, (unsigned __int8 *)&v2, 1u);
  if (!v2)
  {
    [(PPSettings *)self refreshCloudKitDisabledBundleIdsAsync];
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PPSettings_rewriteSyncStateForDisabledBundleIdsAsync__block_invoke;
    block[3] = &unk_1E65DBE30;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

void __55__PPSettings_rewriteSyncStateForDisabledBundleIdsAsync__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v12 = 0x3032000000;
    __int16 v13 = __Block_byref_object_copy__3385;
    id v14 = __Block_byref_object_dispose__3386;
    id v15 = 0;
    char v2 = *(void **)(v1 + 24);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__PPSettings__cloudKitDisabledBundleIds__block_invoke;
    v10[3] = &unk_1E65D51E8;
    void v10[4] = &buf;
    [v2 runWithLockAcquired:v10];
    id v3 = *(id *)(*((void *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);

    if (!v3)
    {
      -[PPSettings _refreshCloudKitDisabledBundleIds](v1);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v12 = 0x3032000000;
      __int16 v13 = __Block_byref_object_copy__3385;
      id v14 = __Block_byref_object_dispose__3386;
      id v15 = 0;
      id v4 = *(void **)(v1 + 24);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __40__PPSettings__cloudKitDisabledBundleIds__block_invoke_2;
      v9[3] = &unk_1E65D51E8;
      void v9[4] = &buf;
      [v4 runWithLockAcquired:v9];
      id v3 = *(id *)(*((void *)&buf + 1) + 40);
      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    id v3 = 0;
  }
  id v5 = pp_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v3 count];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "CloudKit sync is disabled for %tu bundleIds", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v7 = +[PPLocalNamedEntityStore defaultStore];
  [v7 disableSyncForBundleIds:v3];

  id v8 = +[PPLocalTopicStore defaultStore];
  [v8 disableSyncForBundleIds:v3];

  atomic_store(0, rewriteSyncStateForDisabledBundleIdsAsync_isInQueue);
}

void __40__PPSettings__cloudKitDisabledBundleIds__block_invoke(uint64_t a1, uint64_t a2)
{
}

void __40__PPSettings__cloudKitDisabledBundleIds__block_invoke_2(uint64_t a1, uint64_t a2)
{
}

- (void)registerDisabledBundleIdPurgeHandler
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke;
  block[3] = &unk_1E65DBE30;
  block[4] = self;
  if (registerDisabledBundleIdPurgeHandler_onceToken != -1) {
    dispatch_once(&registerDisabledBundleIdPurgeHandler_onceToken, block);
  }
}

void __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  -[PPSettings _purgeRecordsForDisabledBundleIdsAsync](*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke_2;
  block[3] = &unk_1E65DBE30;
  block[4] = v2;
  dispatch_async(v3, block);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke_3;
  aBlock[3] = &unk_1E65DBE30;
  aBlock[4] = *(void *)(a1 + 32);
  id v4 = _Block_copy(aBlock);
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke_2_212;
    v17[3] = &unk_1E65DA2E8;
    id v8 = v4;
    v17[4] = *(void *)(a1 + 32);
    id v18 = v8;
    uint64_t v9 = +[PPKVOObserver observerWithName:@"purgeObserver" object:v7 key:@"SiriCanLearnFromAppBlacklist" handler:v17];
    id v10 = (void *)registerDisabledBundleIdPurgeHandler__purgeObserver;
    registerDisabledBundleIdPurgeHandler__purgeObserver = v9;

    uint64_t v6 = *(void *)(a1 + 32);
  }
  int out_token = 0;
  int v11 = *(NSObject **)(v6 + 32);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke_3_213;
  handler[3] = &unk_1E65D52F0;
  id v12 = v5;
  handler[4] = *(void *)(a1 + 32);
  id v15 = v12;
  if (notify_register_dispatch("kAFPreferencesDidChangeDarwinNotification", &out_token, v11, handler))
  {
    __int16 v13 = pp_default_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v22 = "kAFPreferencesDidChangeDarwinNotification";
      _os_log_error_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_ERROR, "PPSettings failed to associate bundleId purge handler with notification %s .", buf, 0xCu);
    }
  }
}

uint64_t __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke_2(uint64_t a1)
{
  registerDisabledBundleIdPurgeHandler_prevDisabledBundleIds = -[PPSettings _donationDisabledBundleIds](*(void *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

void __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke_4;
  block[3] = &unk_1E65DBE30;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke_2_212(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  -[PPSettings _triggerDelayedBundleIdPurge](v2);
}

void __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke_3_213(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  -[PPSettings _triggerDelayedBundleIdPurge](v2);
}

- (void)_triggerDelayedBundleIdPurge
{
  if (a1)
  {
    v1[0] = MEMORY[0x1E4F143A8];
    v1[1] = 3221225472;
    v1[2] = __42__PPSettings__triggerDelayedBundleIdPurge__block_invoke;
    v1[3] = &unk_1E65DBE30;
    v1[4] = a1;
    -[PPSettings _triggerDelayedOperationWithCoalescingToken:operation:](a1, _triggerDelayedBundleIdPurge_pendingPurgeRequests, v1);
  }
}

void __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke_4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  -[PPSettings _refreshDisabledBundleIds](*(void *)(a1 + 32));
  uint64_t v2 = -[PPSettings _donationDisabledBundleIds](*(void *)(a1 + 32));
  id v3 = (void *)[v2 mutableCopy];
  [v3 minusSet:registerDisabledBundleIdPurgeHandler_prevDisabledBundleIds];
  objc_storeStrong((id *)&registerDisabledBundleIdPurgeHandler_prevDisabledBundleIds, v2);
  if ([v3 count])
  {
    id v4 = pp_default_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      uint64_t v6 = [v3 count];
      _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPSettings invalidating client caches due to %lu newly disabled bundleId(s).", (uint8_t *)&v5, 0xCu);
    }

    -[PPSettings _invokeChangeHandlersAsync](*(void *)(a1 + 32));
    dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 32), &__block_literal_global_208);
  }
}

- (uint64_t)_invokeChangeHandlersAsync
{
  if (result)
  {
    uint64_t v1 = *(void **)(result + 24);
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __40__PPSettings__invokeChangeHandlersAsync__block_invoke;
    v2[3] = &unk_1E65D5198;
    v2[4] = result;
    return [v1 runWithLockAcquired:v2];
  }
  return result;
}

void __50__PPSettings_registerDisabledBundleIdPurgeHandler__block_invoke_206()
{
  PPPostNotification("com.apple.proactive.PersonalizationPortrait.namedEntitiesInvalidated");
  PPPostNotification("com.apple.proactive.PersonalizationPortrait.topicsInvalidated");
  PPPostNotification("com.apple.proactive.PersonalizationPortrait.locationsInvalidated");
}

uint64_t __40__PPSettings__invokeChangeHandlersAsync__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a2 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__PPSettings__invokeChangeHandlersAsync__block_invoke_2;
  v4[3] = &unk_1E65D5278;
  void v4[4] = *(void *)(a1 + 32);
  return [v2 enumerateKeysAndObjectsUsingBlock:v4];
}

void __40__PPSettings__invokeChangeHandlersAsync__block_invoke_2(uint64_t a1, int a2, dispatch_block_t block)
{
}

void __40__PPSettings__donationDisabledBundleIds__block_invoke_2(uint64_t a1, uint64_t a2)
{
}

- (void)registerCloudKitDisabledBundleIdRewriteHandler
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PPSettings_registerCloudKitDisabledBundleIdRewriteHandler__block_invoke;
  block[3] = &unk_1E65DBE30;
  block[4] = self;
  if (registerCloudKitDisabledBundleIdRewriteHandler_onceToken != -1) {
    dispatch_once(&registerCloudKitDisabledBundleIdRewriteHandler_onceToken, block);
  }
}

void __60__PPSettings_registerCloudKitDisabledBundleIdRewriteHandler__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) rewriteSyncStateForDisabledBundleIdsAsync];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PPSettings_registerCloudKitDisabledBundleIdRewriteHandler__block_invoke_2;
  aBlock[3] = &unk_1E65DBE30;
  aBlock[4] = *(void *)(a1 + 32);
  uint64_t v2 = _Block_copy(aBlock);
  id v3 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.suggestions.pp.disabled-bundleid-update-notification" qosClass:9];
  int out_token = 0;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __60__PPSettings_registerCloudKitDisabledBundleIdRewriteHandler__block_invoke_3;
  handler[3] = &unk_1E65D52A0;
  id v4 = v2;
  id v18 = v4;
  if (notify_register_dispatch("com.apple.tcc.access.changed", &out_token, v3, handler))
  {
    int v5 = pp_default_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v22 = "com.apple.tcc.access.changed";
      _os_log_error_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_ERROR, "PPSettings failed to register for notification: %s", buf, 0xCu);
    }
  }
  if (kPPCanLearnFromAppKey_block_invoke__pasOnceToken24 != -1) {
    dispatch_once(&kPPCanLearnFromAppKey_block_invoke__pasOnceToken24, &__block_literal_global_202);
  }
  id v6 = (id)kPPCanLearnFromAppKey_block_invoke__pasExprOnceResult;
  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v8 = *MEMORY[0x1E4F178D8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__PPSettings_registerCloudKitDisabledBundleIdRewriteHandler__block_invoke_2_204;
  v13[3] = &unk_1E65D52C8;
  id v14 = v6;
  id v15 = v3;
  id v16 = v4;
  id v9 = v4;
  id v10 = v3;
  id v11 = v6;
  id v12 = (id)[v7 addObserverForName:v8 object:0 queue:0 usingBlock:v13];
}

uint64_t __60__PPSettings_registerCloudKitDisabledBundleIdRewriteHandler__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshCloudKitDisabledBundleIdsAsync];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 triggerDelayedCloudSyncRewrite];
}

uint64_t __60__PPSettings_registerCloudKitDisabledBundleIdRewriteHandler__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__PPSettings_registerCloudKitDisabledBundleIdRewriteHandler__block_invoke_2_204(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = [a2 userInfo];
  int v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F17810]];
  LODWORD(v3) = [v3 containsObject:v5];

  if (v3)
  {
    id v6 = a1[5];
    uint64_t v7 = (void *)a1[6];
    dispatch_async(v6, v7);
  }
}

void __60__PPSettings_registerCloudKitDisabledBundleIdRewriteHandler__block_invoke_200()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = (void *)MEMORY[0x1CB79D060]();
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v3 = objc_msgSend(v2, "initWithObjects:", *MEMORY[0x1E4F17828], *MEMORY[0x1E4F17750], 0);
  id v4 = (void *)kPPCanLearnFromAppKey_block_invoke__pasExprOnceResult;
  kPPCanLearnFromAppKey_block_invoke__pasExprOnceResult = v3;
}

- (void)deregisterDisabledBundleIdentifierChangeHandlerWithToken:(int)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__PPSettings_deregisterDisabledBundleIdentifierChangeHandlerWithToken___block_invoke;
  v4[3] = &__block_descriptor_36_e31_v16__0__PPSettingsGuardedData_8l;
  int v5 = a3;
  [(_PASLock *)lock runWithLockAcquired:v4];
}

void __71__PPSettings_deregisterDisabledBundleIdentifierChangeHandlerWithToken___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a2 + 32);
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  [v2 setObject:0 forKeyedSubscript:v3];
}

- (int)registerDisabledBundleIdentifierChangeHandler:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__PPSettings_registerDisabledBundleIdentifierChangeHandler___block_invoke;
  v8[3] = &unk_1E65D5230;
  id v10 = &v11;
  id v6 = v4;
  id v9 = v6;
  [(_PASLock *)lock runWithLockAcquired:v8];
  LODWORD(lock) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)lock;
}

void __60__PPSettings_registerDisabledBundleIdentifierChangeHandler___block_invoke(uint64_t a1, _DWORD *a2)
{
  int v3 = a2[12];
  a2[12] = v3 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  id v4 = *(const void **)(a1 + 32);
  int v5 = a2;
  id v8 = _Block_copy(v4);
  id v6 = (void *)v5[4];
  uint64_t v7 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [v6 setObject:v8 forKeyedSubscript:v7];
}

- (void)setEntitiesMappingTrieSha256:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__PPSettings_setEntitiesMappingTrieSha256___block_invoke;
  v7[3] = &unk_1E65D5198;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
  [(NSUserDefaults *)self->_portraitDefaults setObject:v6 forKey:@"entityMappingTrieSha256"];
}

void __43__PPSettings_setEntitiesMappingTrieSha256___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)setEntitiesBackfilledTimestamp:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__PPSettings_setEntitiesBackfilledTimestamp___block_invoke;
  v7[3] = &unk_1E65D5198;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
  [(NSUserDefaults *)self->_portraitDefaults setObject:v6 forKey:@"entityBackfillTimestamp"];
}

void __45__PPSettings_setEntitiesBackfilledTimestamp___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)setAppConnectionsLocationsEnabled:(BOOL)a3
{
  lock = self->_lock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__PPSettings_setAppConnectionsLocationsEnabled___block_invoke;
  v4[3] = &__block_descriptor_33_e31_v16__0__PPSettingsGuardedData_8l;
  BOOL v5 = a3;
  [(_PASLock *)lock runWithLockAcquired:v4];
}

uint64_t __48__PPSettings_setAppConnectionsLocationsEnabled___block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(a2 + 52) = *(unsigned char *)(result + 32);
  return result;
}

- (PPSettings)init
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  v71.receiver = self;
  v71.super_class = (Class)PPSettings;
  id v2 = [(PPSettings *)&v71 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = objc_opt_new();
    BOOL v5 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v4;

    uint64_t v6 = objc_opt_new();
    uint64_t v7 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = v6;

    uint64_t v8 = objc_opt_new();
    id v9 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v8;

    *(_DWORD *)(v3 + 48) = 1;
    id v10 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = 0;

    uint64_t v11 = *(void **)(v3 + 64);
    *(void *)(v3 + 64) = 0;

    id v12 = *(void **)(v3 + 72);
    *(void *)(v3 + 72) = 0;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v3];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v13;

    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    initializationComplete = v2->_initializationComplete;
    v2->_initializationComplete = (OS_dispatch_semaphore *)v15;

    uint64_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.proactive.portrait.PPSettings", v17);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v18;

    -[PPSettings _updateAppConnectionsSettings](v2);
    int out_token = 0;
    uint64_t v20 = v2->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __18__PPSettings_init__block_invoke;
    handler[3] = &unk_1E65D5150;
    uint64_t v21 = v2;
    v69 = v21;
    uint32_t v22 = notify_register_dispatch("com.apple.suggestions.settingsChanged", &out_token, v20, handler);
    if (v22)
    {
      uint64_t v23 = pp_default_log_handle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136315394;
        *(void *)&location[4] = "com.apple.suggestions.settingsChanged";
        __int16 v73 = 1024;
        uint32_t v74 = v22;
        _os_log_error_impl(&dword_1CA9A8000, v23, OS_LOG_TYPE_ERROR, "failed to register for notification for %s: status code %d", location, 0x12u);
      }
    }
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.proactive.PersonalizationPortrait"];
    portraitDefaults = v21->_portraitDefaults;
    v21->_portraitDefaults = (NSUserDefaults *)v24;

    if (v21->_portraitDefaults)
    {
      *(void *)location = 0;
      objc_initWeak((id *)location, v21);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __18__PPSettings_init__block_invoke_150;
      aBlock[3] = &unk_1E65DC540;
      objc_copyWeak(&v67, (id *)location);
      id v26 = (void (**)(void))_Block_copy(aBlock);
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __18__PPSettings_init__block_invoke_155;
      v64[3] = &unk_1E65DC540;
      objc_copyWeak(&v65, (id *)location);
      uint64_t v27 = (void (**)(void))_Block_copy(v64);
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __18__PPSettings_init__block_invoke_157;
      v62[3] = &unk_1E65DC540;
      objc_copyWeak(&v63, (id *)location);
      long long v28 = _Block_copy(v62);
      v26[2](v26);
      v27[2](v27);
      long long v29 = [(NSUserDefaults *)v21->_portraitDefaults objectForKey:@"entityBackfillTimestamp"];
      long long v30 = [(NSUserDefaults *)v21->_portraitDefaults objectForKey:@"entityMappingTrieSha256"];
      long long v31 = v2->_lock;
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __18__PPSettings_init__block_invoke_2_158;
      v59[3] = &unk_1E65D51C0;
      id v32 = v29;
      id v60 = v32;
      id v33 = v30;
      id v61 = v33;
      [(_PASLock *)v31 runWithLockAcquired:v59];

      uint64_t v34 = +[PPKVOObserver observerWithName:@"weightObserver" object:v21->_portraitDefaults key:@"weightMultiplier" handler:v26];
      weightKVOObserver = v21->_weightKVOObserver;
      v21->_weightKVOObserver = (PPKVOObserver *)v34;

      uint64_t v36 = +[PPKVOObserver observerWithName:@"abGroupObserver" object:v21->_portraitDefaults key:@"abGroupOverride" handler:v27];
      abGroupKVObserver = v21->_abGroupKVObserver;
      v21->_abGroupKVObserver = (PPKVOObserver *)v36;

      uint64_t v38 = +[PPKVOObserver observerWithName:@"queryPlanLoggingObserver" object:v21->_portraitDefaults key:@"queryPlanLoggingEnabled" handler:v28];
      queryPlanLoggingKVOObserver = v21->_queryPlanLoggingKVOObserver;
      v21->_queryPlanLoggingKVOObserver = (PPKVOObserver *)v38;

      objc_destroyWeak(&v63);
      objc_destroyWeak(&v65);

      objc_destroyWeak(&v67);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v40 = pp_default_log_handle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 138412290;
        *(void *)&location[4] = @"com.apple.proactive.PersonalizationPortrait";
        _os_log_error_impl(&dword_1CA9A8000, v40, OS_LOG_TYPE_ERROR, "Failed to get NSUserDefaults for suite %@.", location, 0xCu);
      }
    }
    uint64_t v41 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.suggestions"];
    canLearnFromAppDefaults = v21->_canLearnFromAppDefaults;
    v21->_canLearnFromAppDefaults = (NSUserDefaults *)v41;

    if (v21->_canLearnFromAppDefaults)
    {
      *(void *)location = 0;
      objc_initWeak((id *)location, v21);
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __18__PPSettings_init__block_invoke_169;
      v56[3] = &unk_1E65DBF60;
      v43 = v21;
      v57 = v43;
      objc_copyWeak(&v58, (id *)location);
      v44 = _Block_copy(v56);
      uint64_t v45 = +[PPKVOObserver observerWithName:@"canLearnFromAppKVOObserver" object:v21->_canLearnFromAppDefaults key:@"SiriCanLearnFromAppBlacklist" handler:v44];
      canLearnFromAppKVOObserver = v43->_canLearnFromAppKVOObserver;
      v43->_canLearnFromAppKVOObserver = (PPKVOObserver *)v45;

      v47 = v2->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __18__PPSettings_init__block_invoke_4;
      block[3] = &unk_1E65DBE30;
      v55 = v43;
      dispatch_async(v47, block);

      objc_destroyWeak(&v58);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v48 = pp_default_log_handle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 138412290;
        *(void *)&location[4] = @"com.apple.suggestions";
        _os_log_error_impl(&dword_1CA9A8000, v48, OS_LOG_TYPE_ERROR, "PPSettings failed to get NSUserDefaults for suite %@.", location, 0xCu);
      }
    }
    int out_token = 0;
    v49 = v2->_queue;
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __18__PPSettings_init__block_invoke_178;
    v52[3] = &unk_1E65D5150;
    v53 = v21;
    if (notify_register_dispatch("kAFPreferencesDidChangeDarwinNotification", &out_token, v49, v52))
    {
      v50 = pp_default_log_handle();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)location = 136315138;
        *(void *)&location[4] = "kAFPreferencesDidChangeDarwinNotification";
        _os_log_error_impl(&dword_1CA9A8000, v50, OS_LOG_TYPE_ERROR, "PPSettings failed to register notification handler for %s .", location, 0xCu);
      }
    }
  }
  return v2;
}

void __18__PPSettings_init__block_invoke_150(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [*((id *)WeakRetained + 1) objectForKey:@"weightMultiplier"];
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v3 doubleValue];
      double v5 = v4;
    }
    else
    {
      uint64_t v6 = pp_default_log_handle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412546;
        uint64_t v11 = @"weightMultiplier";
        __int16 v12 = 2112;
        uint64_t v13 = @"com.apple.proactive.PersonalizationPortrait";
        _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "Did not find numeric value for key \"%@\" in NSUserDefaults domain %@.", buf, 0x16u);
      }

      double v5 = 1.0;
    }
    uint64_t v7 = (void *)v2[3];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __18__PPSettings_init__block_invoke_152;
    v9[3] = &__block_descriptor_40_e31_v16__0__PPSettingsGuardedData_8l;
    *(double *)&void v9[4] = v5;
    [v7 runWithLockAcquired:v9];
    uint64_t v8 = pp_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v11 = *(__CFString **)&v5;
      _os_log_debug_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEBUG, "Selected new weight multiplier: %g", buf, 0xCu);
    }
  }
}

void __18__PPSettings_init__block_invoke_155(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [*((id *)WeakRetained + 1) objectForKey:@"abGroupOverride"];
    double v4 = (void *)v2[3];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __18__PPSettings_init__block_invoke_2;
    v7[3] = &unk_1E65D5198;
    id v5 = v3;
    id v8 = v5;
    [v4 runWithLockAcquired:v7];
    PPPostNotification("com.apple.proactive.PersonalizationPortrait.abGroupOverrideChanged");
    uint64_t v6 = pp_default_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v10 = v5;
      _os_log_debug_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEBUG, "Detected new abGroupOverride: %@", buf, 0xCu);
    }
  }
}

void __18__PPSettings_init__block_invoke_157(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    dispatch_semaphore_t v15 = __Block_byref_object_copy__3385;
    id v16 = __Block_byref_object_dispose__3386;
    id v17 = 0;
    uint64_t v1 = (void *)WeakRetained[3];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __37__PPSettings__updateQueryPlanLogging__block_invoke;
    v11[3] = &unk_1E65D51E8;
    v11[4] = &v12;
    [v1 runWithLockAcquired:v11];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v2 = (id)v13[5];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v18 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v8;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v8 != v4) {
            objc_enumerationMutation(v2);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * i) + 16))();
        }
        uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v18 count:16];
      }
      while (v3);
    }

    _Block_object_dispose(&v12, 8);
  }
}

void __18__PPSettings_init__block_invoke_2_158(uint64_t a1, id *a2)
{
  objc_storeStrong(a2 + 7, *(id *)(a1 + 32));
  uint64_t v4 = a2;
  objc_storeStrong(v4 + 8, *(id *)(a1 + 40));
}

void __18__PPSettings_init__block_invoke_169(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __18__PPSettings_init__block_invoke_2_170;
  block[3] = &unk_1E65DC540;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

intptr_t __18__PPSettings_init__block_invoke_4(uint64_t a1)
{
  -[PPSettings _refreshDisabledBundleIds](*(void *)(a1 + 32));
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  return dispatch_semaphore_signal(v2);
}

void __18__PPSettings_init__block_invoke_178(uint64_t a1)
{
  -[PPSettings _refreshDisabledBundleIds](*(void *)(a1 + 32));
  if (!+[PPSettings isCloudSyncEnabled])
  {
    if (*(void *)(a1 + 32))
    {
      char v2 = 0;
      atomic_compare_exchange_strong(_handleCloudStorageDeletedByUser_isInQueue, (unsigned __int8 *)&v2, 1u);
      if (!v2)
      {
        if (_handleCloudStorageDeletedByUser__pasOnceToken15 != -1) {
          dispatch_once(&_handleCloudStorageDeletedByUser__pasOnceToken15, &__block_literal_global_184);
        }
        id v3 = _handleCloudStorageDeletedByUser__pasExprOnceResult;
        dispatch_async(v3, &__block_literal_global_188_3459);
      }
    }
  }
}

void __46__PPSettings__handleCloudStorageDeletedByUser__block_invoke_2()
{
  v0 = pp_default_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1CA9A8000, v0, OS_LOG_TYPE_DEFAULT, "PPSettings: clearing remote records from database because user triggered Siri cloud storage deletion", v5, 2u);
  }

  uint64_t v1 = +[PPLocalNamedEntityStore defaultStore];
  char v2 = [v1 storage];
  [v2 clearRemoteRecordsMissingFromDuetWithShouldContinueBlock:&__block_literal_global_193];

  id v3 = +[PPLocalTopicStore defaultStore];
  uint64_t v4 = [v3 storage];
  [v4 clearRemoteRecordsMissingFromDuetWithShouldContinueBlock:&__block_literal_global_197];

  atomic_store(0, (unsigned __int8 *)_handleCloudStorageDeletedByUser_isInQueue);
}

uint64_t __46__PPSettings__handleCloudStorageDeletedByUser__block_invoke_2_195()
{
  return 1;
}

uint64_t __46__PPSettings__handleCloudStorageDeletedByUser__block_invoke_190()
{
  return 1;
}

void __46__PPSettings__handleCloudStorageDeletedByUser__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"PPSettings-DKEventDeletionProcessing" qosClass:9];
  char v2 = (void *)_handleCloudStorageDeletedByUser__pasExprOnceResult;
  _handleCloudStorageDeletedByUser__pasExprOnceResult = v1;
}

void __18__PPSettings_init__block_invoke_2_170(uint64_t a1)
{
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v2 = WeakRetained;
    -[PPSettings _refreshDisabledBundleIds]((uint64_t)WeakRetained);
    -[PPSettings _invokeChangeHandlersAsync]((uint64_t)v2);
    dispatch_async(v2[4], &__block_literal_global_3465);
    id WeakRetained = v2;
  }
}

void __18__PPSettings_init__block_invoke_3()
{
  PPPostNotification("com.apple.proactive.PersonalizationPortrait.namedEntitiesInvalidated");
  PPPostNotification("com.apple.proactive.PersonalizationPortrait.topicsInvalidated");
  PPPostNotification("com.apple.proactive.PersonalizationPortrait.locationsInvalidated");
}

void __37__PPSettings__updateQueryPlanLogging__block_invoke(uint64_t a1, void *a2)
{
  long long v7 = a2;
  id v3 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v4 = [v7[5] allValues];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __18__PPSettings_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
}

double __18__PPSettings_init__block_invoke_152(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a1 + 32);
  *(double *)(a2 + 8) = result;
  return result;
}

+ (void)clearTestSettings
{
  id v2 = +[PPSettings sharedInstance];
  if (v2)
  {
    [*((id *)v2 + 2) removeObjectForKey:@"SiriCanLearnFromAppBlacklist"];
    dispatch_sync(*((dispatch_queue_t *)v2 + 4), &__block_literal_global_252_3483);
  }
}

+ (void)disableBundleIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[PPSettings sharedInstance];
  id v5 = v3;
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    dispatch_semaphore_t v15 = __Block_byref_object_copy__3385;
    id v16 = __Block_byref_object_dispose__3386;
    id v17 = 0;
    uint64_t v6 = *(void **)(v4 + 24);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __39__PPSettings__disableBundleIdentifier___block_invoke;
    v11[3] = &unk_1E65D51E8;
    v11[4] = &v12;
    [v6 runWithLockAcquired:v11];
    id v7 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

    long long v8 = [v7 allObjects];
    long long v9 = (void *)[v8 mutableCopy];

    [v9 addObject:v5];
    [*(id *)(v4 + 16) setObject:v9 forKey:@"SiriCanLearnFromAppBlacklist"];
  }
  id v10 = +[PPSettings sharedInstance];
  -[PPSettings _refreshDisabledBundleIds]((uint64_t)v10);
}

void __39__PPSettings__disableBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
}

+ (id)cloudSyncDisabledFirstPartyBundleIds
{
  v21[8] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F8A0A8];
  v21[0] = *MEMORY[0x1E4F8A098];
  v21[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F8A040];
  v21[2] = *MEMORY[0x1E4F8A0D0];
  v21[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F8A048];
  void v21[4] = *MEMORY[0x1E4F8A0C0];
  v21[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F8A088];
  v21[6] = *MEMORY[0x1E4F8A0E0];
  v21[7] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:8];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    uint64_t v12 = (void *)*MEMORY[0x1E4F8A118];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = objc_msgSend(v12, "objectForKeyedSubscript:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        if (v14) {
          [v7 addObjectsFromArray:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v7;
}

void __28__PPSettings_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = (void *)sharedInstance__pasExprOnceResult_3484;
  sharedInstance__pasExprOnceResult_3484 = v1;
}

+ (BOOL)isCloudSyncEnabled
{
  uint64_t v2 = [getAFPreferencesClass() sharedPreferences];
  char v3 = [v2 cloudSyncEnabled];

  return v3;
}

@end