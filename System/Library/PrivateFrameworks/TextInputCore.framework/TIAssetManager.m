@interface TIAssetManager
+ (id)_addressFromRegion:(id)a3;
+ (id)_regionFromAddress:(id)a3;
+ (id)sharedAssetManager;
+ (id)sharedAssetManagerWithEnabledInputModesProvider:(id)a3;
+ (id)singletonInstanceWithEnabledInputModesProvider:(id)a3;
+ (int64_t)assetUpdateStatusforDDSAssetUpdateStatus:(int64_t)a3;
+ (void)setSharedAssetManager:(id)a3;
- (BOOL)inputModeHasRegions:(id)a3;
- (BOOL)requireMecabraDictionaryRapidUpdatesAssetsForLanguageIdentifier:(id)a3;
- (NSArray)currentActiveRegions;
- (NSArray)currentNormalizedActiveRegions;
- (NSArray)requestedInputModes_mainThreadCache;
- (NSMutableSet)languagesWithWarmedAssets;
- (NSTimer)didUpdateAssetsTimer;
- (OS_dispatch_queue)dispatchQueue;
- (TIAssetManager)init;
- (TIAssetManager)initWithRequestedInputModes:(id)a3 inputModePreferenceProvider:(id)a4 enabledInputModesProvider:(id)a5;
- (TIInputModePreferenceProvider)inputModePreferenceProvider;
- (TIRequestedInputModes)requestedInputModes;
- (double)requestExpirationInterval;
- (id)_ddsAssetsForAssetType:(id)a3 languageIdentifier:(id)a4 cachedOnly:(BOOL)a5;
- (id)_ddsAssetsForLanguageIdentifier:(id)a3 cachedOnly:(BOOL)a4;
- (id)_ddsContentItemsFromAssets:(id)a3 contentType:(id)a4 filteredWithRegion:(BOOL)a5;
- (id)activeInputModeLevels;
- (id)activeInputModes;
- (id)assetTypeForAssertionId:(id)a3;
- (id)ddsAssertionIDsFromInputMode:(id)a3 withPotentialRegions:(id)a4;
- (id)ddsAssetContentItemsWithContentType:(id)a3 inputMode:(id)a4 filteredWithRegion:(BOOL)a5;
- (id)ddsLanguageIdentifierFromInputMode:(id)a3;
- (id)ddsLinguisticAssetQueryForInputModeIdentifier:(id)a3 withRegions:(id)a4;
- (id)ddsLinguisticAssetQueryWithAssetType:(id)a3 inputModeIdentifier:(id)a4 withRegions:(id)a5;
- (id)defaultEnabledInputModes;
- (id)enabledInputModeIdentifiersProviderBlock;
- (id)enabledInputModes;
- (id)levelsForInputMode:(id)a3;
- (id)localeIdentifierForAssertionId:(id)a3 inputMode:(id)a4;
- (id)multilingualLocaleIdentifierForInputMode:(id)a3;
- (id)preferencesProviderBlock;
- (id)topActiveRegions;
- (id)updatedActiveRegions;
- (int64_t)amountOfPurgeableAssetsWithUrgency:(int)a3;
- (int64_t)tryToPurgeAssetAmount:(int64_t)a3 urgency:(int)a4;
- (void)_warmAssetQueriesForInputModes:(id)a3;
- (void)_warmAssetQueryForLanguage:(id)a3;
- (void)_warmLDEnumerateAssetQueriesForInputMode:(id)a3;
- (void)addAssertionWithInputMode:(id)a3 assertionID:(id)a4 potentialRegions:(id)a5;
- (void)addLinguisticAssetsAssertionForLanguage:(id)a3 assertionID:(id)a4 region:(id)a5 clientID:(id)a6 withHandler:(id)a7;
- (void)appleKeyboardsPreferencesChanged:(id)a3;
- (void)ddsAssetContentItemsWithContentType:(id)a3 inputMode:(id)a4 filteredWithRegion:(BOOL)a5 completion:(id)a6;
- (void)ddsAssetsForInputMode:(id)a3 cachedOnly:(BOOL)a4 completion:(id)a5;
- (void)dealloc;
- (void)didUpdateAssets;
- (void)didUpdateAssetsWithType:(id)a3;
- (void)fetchAssetUpdateStatusForInputModeIdentifier:(id)a3 callback:(id)a4;
- (void)getActiveRegionsWithCompletion:(id)a3;
- (void)normalizedRegionsForGeoCodedAddresses:(id)a3 withCompletion:(id)a4;
- (void)registerCacheDeleteCallbacks;
- (void)registerForNotifications;
- (void)removeLinguisticAssetsAssertionWithIdentifier:(id)a3 forClientID:(id)a4 withHandler:(id)a5;
- (void)requestAssetDownloadForLanguage:(id)a3 completion:(id)a4;
- (void)scheduleAssetsDidChangeNotificationWithDelay:(double)a3;
- (void)setCurrentActiveRegions:(id)a3;
- (void)setCurrentNormalizedActiveRegions:(id)a3;
- (void)setDidUpdateAssetsTimer:(id)a3;
- (void)setEnabledInputModeIdentifiersProviderBlock:(id)a3;
- (void)setPreferencesProviderBlock:(id)a3;
- (void)setRequestedInputModes_mainThreadCache:(id)a3;
- (void)unregisterForNotifications;
- (void)updateAssertionsForInputModes:(id)a3;
- (void)updateAssetForInputModeIdentifier:(id)a3 callback:(id)a4;
- (void)updatedActiveRegionsWithCompletionWithCompletion:(id)a3;
@end

@implementation TIAssetManager

- (int64_t)amountOfPurgeableAssetsWithUrgency:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = TIAssetsOSLogFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s Computing bytes of purgeable assets with urgency %d", "-[TIAssetManager amountOfPurgeableAssetsWithUrgency:]", v3);
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  v6 = TIAssetsOSLogFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s Found %lld purgeable bytes.", "-[TIAssetManager amountOfPurgeableAssetsWithUrgency:]", 0);
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_impl(&dword_1E3F0E000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  return 0;
}

uint64_t __46__TIAssetManager_registerCacheDeleteCallbacks__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = TIAssetsOSLogFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s CacheDelete - Purgable(urgency=%d)", "-[TIAssetManager registerCacheDeleteCallbacks]_block_invoke", a2);
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1E3F0E000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  uint64_t v8 = [WeakRetained amountOfPurgeableAssetsWithUrgency:a2];
  v13[0] = @"CACHE_DELETE_VOLUME";
  v9 = objc_msgSend(a3, "objectForKey:");
  v13[1] = @"CACHE_DELETE_AMOUNT";
  v14[0] = v9;
  v10 = [NSNumber numberWithLongLong:v8];
  v14[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedInputModes, 0);
  objc_storeStrong((id *)&self->_didUpdateAssetsTimer, 0);
  objc_storeStrong((id *)&self->_currentNormalizedActiveRegions, 0);
  objc_storeStrong((id *)&self->_currentActiveRegions, 0);
  objc_storeStrong((id *)&self->_inputModePreferenceProvider, 0);
  objc_storeStrong((id *)&self->_requestedInputModes_mainThreadCache, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_preferencesProviderBlock, 0);
  objc_storeStrong(&self->_enabledInputModeIdentifiersProviderBlock, 0);
  objc_storeStrong((id *)&self->_languagesWithWarmedAssets, 0);

  objc_storeStrong((id *)&self->_notificationTokens, 0);
}

- (TIRequestedInputModes)requestedInputModes
{
  return self->_requestedInputModes;
}

- (void)setDidUpdateAssetsTimer:(id)a3
{
}

- (NSTimer)didUpdateAssetsTimer
{
  return self->_didUpdateAssetsTimer;
}

- (void)setCurrentNormalizedActiveRegions:(id)a3
{
}

- (NSArray)currentNormalizedActiveRegions
{
  return self->_currentNormalizedActiveRegions;
}

- (void)setCurrentActiveRegions:(id)a3
{
}

- (NSArray)currentActiveRegions
{
  return self->_currentActiveRegions;
}

- (TIInputModePreferenceProvider)inputModePreferenceProvider
{
  return self->_inputModePreferenceProvider;
}

- (void)setRequestedInputModes_mainThreadCache:(id)a3
{
}

- (NSArray)requestedInputModes_mainThreadCache
{
  return self->_requestedInputModes_mainThreadCache;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setPreferencesProviderBlock:(id)a3
{
}

- (id)preferencesProviderBlock
{
  return self->_preferencesProviderBlock;
}

- (id)enabledInputModeIdentifiersProviderBlock
{
  return self->_enabledInputModeIdentifiersProviderBlock;
}

- (int64_t)tryToPurgeAssetAmount:(int64_t)a3 urgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v7 = TIAssetsOSLogFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s Attempting to purge %ld bytes of assets with urgency %d", "-[TIAssetManager tryToPurgeAssetAmount:urgency:]", a3, v4);
    *(_DWORD *)buf = 138412290;
    v13 = v8;
    _os_log_impl(&dword_1E3F0E000, v7, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    uint64_t v11 = self;
    v9 = [(TIAssetManager *)self activeInputModes];
    [(TIAssetManager *)v11 updateAssertionsForInputModes:v9];
  }
  else
  {
    TIDispatchSync();
  }
  return 0;
}

void __48__TIAssetManager_tryToPurgeAssetAmount_urgency___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activeInputModes];
  [*(id *)(a1 + 32) updateAssertionsForInputModes:v2];
}

void __48__TIAssetManager_tryToPurgeAssetAmount_urgency___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activeInputModes];
  [*(id *)(a1 + 32) updateAssertionsForInputModes:v2];
}

- (void)registerCacheDeleteCallbacks
{
  objc_initWeak(&location, self);
  v2[1] = (id)MEMORY[0x1E4F143A8];
  v2[2] = (id)3221225472;
  v2[3] = __46__TIAssetManager_registerCacheDeleteCallbacks__block_invoke;
  v2[4] = &unk_1E6E2AFE0;
  objc_copyWeak(&v3, &location);
  objc_copyWeak(v2, &location);
  CacheDeleteRegisterInfoCallbacks();
  objc_destroyWeak(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

uint64_t __46__TIAssetManager_registerCacheDeleteCallbacks__block_invoke_330(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = [a3 objectForKey:@"CACHE_DELETE_AMOUNT"];
  uint64_t v7 = (int)[v6 intValue];

  uint64_t v8 = TIAssetsOSLogFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [NSString stringWithFormat:@"%s CacheDelete - Purge(amount=%lld, urgency=%d)", "-[TIAssetManager registerCacheDeleteCallbacks]_block_invoke", v7, a2];
    *(_DWORD *)buf = 138412290;
    v18 = v9;
    _os_log_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  uint64_t v10 = [WeakRetained tryToPurgeAssetAmount:v7 urgency:a2];
  v15[0] = @"CACHE_DELETE_VOLUME";
  uint64_t v11 = objc_msgSend(a3, "objectForKey:");
  v15[1] = @"CACHE_DELETE_AMOUNT";
  v16[0] = v11;
  v12 = [NSNumber numberWithLongLong:v10];
  v16[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v13;
}

uint64_t __46__TIAssetManager_registerCacheDeleteCallbacks__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"CACHE_DELETE_VOLUME";
  id v3 = objc_msgSend(a3, "objectForKey:");
  v6[1] = @"CACHE_DELETE_AMOUNT";
  v7[0] = v3;
  v7[1] = &unk_1F3FA7B38;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)getActiveRegionsWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __49__TIAssetManager_getActiveRegionsWithCompletion___block_invoke;
  v6[3] = &unk_1E6E2BC80;
  id v7 = v4;
  id v5 = v4;
  [(TIAssetManager *)self updatedActiveRegionsWithCompletionWithCompletion:v6];
}

uint64_t __49__TIAssetManager_getActiveRegionsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateAssetForInputModeIdentifier:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__TIAssetManager_updateAssetForInputModeIdentifier_callback___block_invoke;
  v10[3] = &unk_1E6E2AF40;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(TIAssetManager *)self getActiveRegionsWithCompletion:v10];
}

void __61__TIAssetManager_updateAssetForInputModeIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 1;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__TIAssetManager_updateAssetForInputModeIdentifier_callback___block_invoke_2;
  aBlock[3] = &unk_1E6E2AF90;
  id v4 = *(void **)(a1 + 40);
  aBlock[4] = *(void *)(a1 + 32);
  id v17 = v4;
  id v18 = *(id *)(a1 + 48);
  uint64_t v19 = &v23;
  v20 = v21;
  id v5 = _Block_copy(aBlock);
  id v6 = [*(id *)(a1 + 32) multilingualLocaleIdentifierForInputMode:*(void *)(a1 + 40)];
  if (v6)
  {
    ++v24[3];
    id v7 = [*(id *)(a1 + 32) ddsLinguisticAssetQueryForInputModeIdentifier:v6 withRegions:v3];
    id v8 = [MEMORY[0x1E4F5EF48] sharedInstance];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __61__TIAssetManager_updateAssetForInputModeIdentifier_callback___block_invoke_317;
    v14[3] = &unk_1E6E2AFB8;
    id v15 = v5;
    [v8 updateAssetForQuery:v7 callback:v14];
  }
  id v9 = [*(id *)(a1 + 32) ddsLinguisticAssetQueryForInputModeIdentifier:*(void *)(a1 + 40) withRegions:v3];
  uint64_t v10 = [MEMORY[0x1E4F5EF48] sharedInstance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__TIAssetManager_updateAssetForInputModeIdentifier_callback___block_invoke_2_318;
  v12[3] = &unk_1E6E2AFB8;
  id v13 = v5;
  id v11 = v5;
  [v10 updateAssetForQuery:v9 callback:v12];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);
}

void __61__TIAssetManager_updateAssetForInputModeIdentifier_callback___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) dispatchQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__TIAssetManager_updateAssetForInputModeIdentifier_callback___block_invoke_3;
  v9[3] = &unk_1E6E2AF68;
  id v7 = *(id *)(a1 + 40);
  char v14 = a2;
  id v10 = v7;
  id v11 = v5;
  id v12 = *(id *)(a1 + 48);
  long long v13 = *(_OWORD *)(a1 + 56);
  id v8 = v5;
  dispatch_async(v6, v9);
}

uint64_t __61__TIAssetManager_updateAssetForInputModeIdentifier_callback___block_invoke_317(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__TIAssetManager_updateAssetForInputModeIdentifier_callback___block_invoke_2_318(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__TIAssetManager_updateAssetForInputModeIdentifier_callback___block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = TIAssetsOSLogFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    if (*(unsigned char *)(a1 + 72)) {
      id v4 = @"Yes";
    }
    else {
      id v4 = @"No";
    }
    id v5 = [NSString stringWithFormat:@"%s updateAssetForQuery for identifier: %@ completed with didSucceed: %@, error: %@", "-[TIAssetManager updateAssetForInputModeIdentifier:callback:]_block_invoke_3", *(void *)(a1 + 32), v4, *(void *)(a1 + 40)];
    *(_DWORD *)buf = 138412290;
    id v7 = v5;
    _os_log_debug_impl(&dword_1E3F0E000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  if (*(void *)(a1 + 40))
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_4:
    v3();
    return;
  }
  --*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) &= *(unsigned char *)(a1 + 72);
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_4;
  }
}

- (void)fetchAssetUpdateStatusForInputModeIdentifier:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__TIAssetManager_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke;
  v10[3] = &unk_1E6E2AF40;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(TIAssetManager *)self getActiveRegionsWithCompletion:v10];
}

void __72__TIAssetManager_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 1;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__TIAssetManager_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke_2;
  aBlock[3] = &unk_1E6E2AEF0;
  id v4 = *(void **)(a1 + 40);
  aBlock[4] = *(void *)(a1 + 32);
  id v17 = v4;
  id v18 = *(id *)(a1 + 48);
  uint64_t v19 = v25;
  v20 = v24;
  v21 = v23;
  char v22 = &v26;
  id v5 = _Block_copy(aBlock);
  id v6 = [*(id *)(a1 + 32) multilingualLocaleIdentifierForInputMode:*(void *)(a1 + 40)];
  if (v6)
  {
    ++v27[3];
    id v7 = [*(id *)(a1 + 32) ddsLinguisticAssetQueryForInputModeIdentifier:v6 withRegions:v3];
    id v8 = [MEMORY[0x1E4F5EF48] sharedInstance];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __72__TIAssetManager_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke_305;
    v14[3] = &unk_1E6E2AF18;
    id v15 = v5;
    [v8 fetchAssetUpdateStatusForQuery:v7 callback:v14];
  }
  id v9 = [*(id *)(a1 + 32) ddsLinguisticAssetQueryForInputModeIdentifier:*(void *)(a1 + 40) withRegions:v3];
  id v10 = [MEMORY[0x1E4F5EF48] sharedInstance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__TIAssetManager_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke_2_306;
  v12[3] = &unk_1E6E2AF18;
  id v13 = v5;
  id v11 = v5;
  [v10 fetchAssetUpdateStatusForQuery:v9 callback:v12];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v26, 8);
}

void __72__TIAssetManager_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) dispatchQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__TIAssetManager_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke_3;
  v9[3] = &unk_1E6E2AEC8;
  id v7 = *(id *)(a1 + 40);
  uint64_t v15 = a2;
  id v10 = v7;
  id v11 = v5;
  id v12 = *(id *)(a1 + 48);
  long long v13 = *(_OWORD *)(a1 + 56);
  long long v14 = *(_OWORD *)(a1 + 72);
  id v8 = v5;
  dispatch_async(v6, v9);
}

uint64_t __72__TIAssetManager_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke_305(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__TIAssetManager_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke_2_306(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__TIAssetManager_fetchAssetUpdateStatusForInputModeIdentifier_callback___block_invoke_3(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = TIAssetsOSLogFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [NSString stringWithFormat:@"%s fetchAssetUpdateStatusForQuery for identifier: %@ completed with status: %ld, error: %@", "-[TIAssetManager fetchAssetUpdateStatusForInputModeIdentifier:callback:]_block_invoke_3", a1[4], a1[11], a1[5]];
    *(_DWORD *)buf = 138412290;
    id v8 = v6;
    _os_log_debug_impl(&dword_1E3F0E000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  if (a1[5])
  {
    id v3 = *(void (**)(void))(a1[6] + 16);
    goto LABEL_14;
  }
  uint64_t v4 = a1[11];
  switch(v4)
  {
    case 2:
      id v5 = a1 + 8;
      goto LABEL_11;
    case 1:
      id v5 = a1 + 9;
      goto LABEL_11;
    case 0:
      id v5 = a1 + 7;
LABEL_11:
      ++*(void *)(*(void *)(*v5 + 8) + 24);
      break;
  }
  if (*(void *)(*(void *)(a1[10] + 8) + 24) != *(void *)(*(void *)(a1[8] + 8) + 24)
                                                      + *(void *)(*(void *)(a1[7] + 8) + 24)
                                                      + *(void *)(*(void *)(a1[9] + 8) + 24))
    return;
  id v3 = *(void (**)(void))(a1[6] + 16);
LABEL_14:
  v3();
}

- (id)ddsLinguisticAssetQueryForInputModeIdentifier:(id)a3 withRegions:(id)a4
{
  return [(TIAssetManager *)self ddsLinguisticAssetQueryWithAssetType:*MEMORY[0x1E4F5EF40] inputModeIdentifier:a3 withRegions:a4];
}

- (id)ddsLinguisticAssetQueryWithAssetType:(id)a3 inputModeIdentifier:(id)a4 withRegions:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(TIAssetManager *)self ddsLanguageIdentifierFromInputMode:v9];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F5EF58]) initWithAssetType:v8 languageIdentifier:v11];
  [v12 setInstalledOnly:0];
  id v32 = v12;
  [v12 setLocalOnly:0];
  if ([(TIAssetManager *)self inputModeHasRegions:v9])
  {
    if ([v10 count])
    {
      v27 = v11;
      id v28 = v10;
      id v29 = v9;
      id v30 = v8;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id obj = v10;
      uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v34;
        uint64_t v16 = *MEMORY[0x1E4F5EF20];
        uint64_t v17 = *MEMORY[0x1E4F5EF28];
        uint64_t v18 = *MEMORY[0x1E4F5EF18];
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v34 != v15) {
              objc_enumerationMutation(obj);
            }
            v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            v21 = objc_msgSend(v20, "objectForKeyedSubscript:", v16, v27, v28, v29, v30);
            char v22 = [v20 objectForKeyedSubscript:v17];
            uint64_t v23 = [v20 objectForKeyedSubscript:v18];
            v24 = [v32 filter];
            [v24 addRegionWithCountry:v21 province:v22 city:v23];
          }
          uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v14);
      }

      id v9 = v29;
      id v8 = v30;
      id v11 = v27;
      id v10 = v28;
    }
    else
    {
      uint64_t v25 = [v12 filter];
      [v25 addRegionWithCountry:0 province:0 city:0];
    }
  }

  return v32;
}

- (id)topActiveRegions
{
  id v2 = [(TIAssetManager *)self currentNormalizedActiveRegions];
  id v3 = +[TIMobileAssetMatch mobileAssetMatchWithTypes:MEMORY[0x1E4F1CBF0] inputModeLevels:MEMORY[0x1E4F1CBF0] regions:v2];

  uint64_t v4 = [v3 regions];

  return v4;
}

- (void)normalizedRegionsForGeoCodedAddresses:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v5 count])
  {
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x2020000000;
    uint64_t v28 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2050000000;
    id v8 = (void *)getCLGeocoderClass_softClass;
    uint64_t v33 = getCLGeocoderClass_softClass;
    if (!getCLGeocoderClass_softClass)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __getCLGeocoderClass_block_invoke;
      v29[3] = &unk_1E6E2E248;
      v29[4] = &v30;
      __getCLGeocoderClass_block_invoke((uint64_t)v29);
      id v8 = (void *)v31[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v30, 8);
    id v10 = objc_alloc_init(v9);
    id v11 = objc_alloc_init(TIGeocodeCompletionHandlerHolder);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__TIAssetManager_normalizedRegionsForGeoCodedAddresses_withCompletion___block_invoke;
    aBlock[3] = &unk_1E6E2AEA0;
    id v12 = v5;
    id v19 = v12;
    v24 = &v25;
    id v20 = v7;
    id v21 = v10;
    char v22 = v11;
    id v23 = v6;
    uint64_t v13 = v11;
    id v14 = v10;
    uint64_t v15 = _Block_copy(aBlock);
    [(TIGeocodeCompletionHandlerHolder *)v13 setGeocodeCompletionHandler:v15];
    uint64_t v16 = [v12 objectAtIndexedSubscript:v26[3]];
    uint64_t v17 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
    [v14 geocodePostalAddress:v16 preferredLocale:v17 completionHandler:v15];

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    (*((void (**)(id, id))v6 + 2))(v6, v7);
  }
}

void __71__TIAssetManager_normalizedRegionsForGeoCodedAddresses_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = TIAssetsOSLogFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSString;
      id v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
      id v10 = [v8 stringWithFormat:@"%s ERROR: Cannot geocode address %@ : %@", "-[TIAssetManager normalizedRegionsForGeoCodedAddresses:withCompletion:]_block_invoke", v9, v6];
      *(_DWORD *)buf = 138412290;
      long long v35 = v10;
      _os_log_error_impl(&dword_1E3F0E000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  else
  {
    id v7 = [v5 firstObject];
    id v11 = TIAssetsOSLogFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v29 = NSString;
      uint64_t v30 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
      v31 = [v29 stringWithFormat:@"%s Successfully geocoded address %@ to %@", "-[TIAssetManager normalizedRegionsForGeoCodedAddresses:withCompletion:]_block_invoke", v30, v7];
      *(_DWORD *)buf = 138412290;
      long long v35 = v31;
      _os_log_debug_impl(&dword_1E3F0E000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    v32[0] = @"City";
    uint64_t v12 = [v7 locality];
    uint64_t v13 = (void *)v12;
    if (v12) {
      id v14 = (__CFString *)v12;
    }
    else {
      id v14 = &stru_1F3F7A998;
    }
    v33[0] = v14;
    v32[1] = @"Province";
    uint64_t v15 = [v7 administrativeArea];
    uint64_t v16 = (void *)v15;
    if (v15) {
      uint64_t v17 = (__CFString *)v15;
    }
    else {
      uint64_t v17 = &stru_1F3F7A998;
    }
    v33[1] = v17;
    v32[2] = @"Country";
    uint64_t v18 = [v7 country];
    id v19 = (void *)v18;
    if (v18) {
      id v20 = (__CFString *)v18;
    }
    else {
      id v20 = &stru_1F3F7A998;
    }
    v33[2] = v20;
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];

    [*(id *)(a1 + 40) addObject:v21];
  }

  unint64_t v22 = ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (v22 >= [*(id *)(a1 + 32) count])
  {
    uint64_t v27 = TIAssetsOSLogFacility();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"%s Finished geocoding %d addresses", "-[TIAssetManager normalizedRegionsForGeoCodedAddresses:withCompletion:]_block_invoke", objc_msgSend(*(id *)(a1 + 32), "count"));
      *(_DWORD *)buf = 138412290;
      long long v35 = v28;
      _os_log_debug_impl(&dword_1E3F0E000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    [*(id *)(a1 + 56) setGeocodeCompletionHandler:0];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v23 = *(void **)(a1 + 48);
    v24 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
    uint64_t v25 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
    uint64_t v26 = [*(id *)(a1 + 56) geocodeCompletionHandler];
    [v23 geocodePostalAddress:v24 preferredLocale:v25 completionHandler:v26];
  }
}

- (void)updatedActiveRegionsWithCompletionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [(TIAssetManager *)self currentActiveRegions];
  id v7 = [v5 setWithArray:v6];

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__6908;
  void v12[4] = __Block_byref_object_dispose__6909;
  id v13 = _Block_copy(v4);
  id v8 = _TIQueueUserInitiated();
  id v11 = v4;
  id v9 = v4;
  id v10 = v7;
  TIDispatchAsync();

  _Block_object_dispose(v12, 8);
}

void __67__TIAssetManager_updatedActiveRegionsWithCompletionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  v1 = TIAssetsOSLogFacility();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    v39 = objc_msgSend(NSString, "stringWithFormat:", @"%s Updating active regions...", "-[TIAssetManager updatedActiveRegionsWithCompletionWithCompletion:]_block_invoke");
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v39;
    _os_log_debug_impl(&dword_1E3F0E000, v1, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
  }
  id v2 = +[TIProactiveQuickTypeManager sharedInstance];
  id v3 = [v2 searchForMeCardRegions];

  if (!v3)
  {
    id v4 = +[TIProactiveQuickTypeManager sharedInstance];
    id v3 = [v4 searchForMeCardRegions];

    if (!v3) {
      id v3 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  id v5 = TIAssetsOSLogFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v40 = [NSString stringWithFormat:@"%s Got me card regions from InputContext : %@", "-[TIAssetManager updatedActiveRegionsWithCompletionWithCompletion:]_block_invoke", v3];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v40;
    _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
  }
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v3;
  uint64_t v7 = [obj countByEnumeratingWithState:&v62 objects:v73 count:16];
  v46 = v6;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v44 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v63 != v44) {
          objc_enumerationMutation(obj);
        }
        id v10 = (void *)[*(id *)(*((void *)&v62 + 1) + 8 * i) mutableCopy];
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v11 = +[TIMobileAssetMatch knownAssetRegionAttributes];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v58 objects:v72 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v59;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v59 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v58 + 1) + 8 * j);
              uint64_t v17 = [v10 objectForKeyedSubscript:v16];

              if (!v17) {
                [v10 setObject:&stru_1F3F7A998 forKeyedSubscript:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v58 objects:v72 count:16];
          }
          while (v13);
        }

        id v6 = v46;
        [v46 addObject:v10];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v62 objects:v73 count:16];
    }
    while (v8);
  }

  uint64_t v18 = [*(id *)(a1 + 32) preferencesProviderBlock];

  if (v18)
  {
    id v19 = [*(id *)(a1 + 32) preferencesProviderBlock];
    id v20 = v19[2]();

    [v20 objectForKeyedSubscript:*MEMORY[0x1E4FAEA20]];
  }
  else
  {
    id v20 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
    [v20 valueForPreferenceKey:*MEMORY[0x1E4FAEA20]];
  id v21 = };

  unint64_t v22 = [v21 integerValue] - 1;
  if (v22 <= 2) {
    [v6 addObject:*(&off_1E6E2B038 + v22)];
  }
  id v23 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
  if ([v23 isEqualToSet:*(void *)(a1 + 40)])
  {
    v24 = TIAssetsOSLogFacility();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v41 = [NSString stringWithFormat:@"%s Regions unchanged, returning old set %@", "-[TIAssetManager updatedActiveRegionsWithCompletionWithCompletion:]_block_invoke_2", *(void *)(a1 + 40)];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v41;
      _os_log_debug_impl(&dword_1E3F0E000, v24, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v25 = *(void *)(a1 + 48);
    if (v25)
    {
      uint64_t v26 = [*(id *)(a1 + 40) allObjects];
      (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);
    }
  }
  else
  {
    v45 = v21;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__273;
    v70 = __Block_byref_object_dispose__274;
    id v71 = [MEMORY[0x1E4F1CA48] array];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__TIAssetManager_updatedActiveRegionsWithCompletionWithCompletion___block_invoke_275;
    aBlock[3] = &unk_1E6E2AE50;
    void aBlock[4] = *(void *)(a1 + 32);
    id v27 = v6;
    id v55 = v27;
    p_long long buf = &buf;
    uint64_t v57 = *(void *)(a1 + 56);
    uint64_t v28 = _Block_copy(aBlock);
    id v29 = +[TIMobileAssetMatch mobileAssetMatchWithTypes:0 inputModeLevels:0 regions:v27];
    uint64_t v30 = [MEMORY[0x1E4F1CA48] array];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v31 = [v29 regions];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v50 objects:v66 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v51;
      do
      {
        for (uint64_t k = 0; k != v33; ++k)
        {
          if (*(void *)v51 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = +[TIAssetManager _addressFromRegion:*(void *)(*((void *)&v50 + 1) + 8 * k)];
          [v30 addObject:v36];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v50 objects:v66 count:16];
      }
      while (v33);
    }

    v37 = *(void **)(a1 + 32);
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __67__TIAssetManager_updatedActiveRegionsWithCompletionWithCompletion___block_invoke_279;
    v47[3] = &unk_1E6E2BD70;
    id v48 = v28;
    v49 = &buf;
    id v38 = v28;
    [v37 normalizedRegionsForGeoCodedAddresses:v30 withCompletion:v47];

    _Block_object_dispose(&buf, 8);
    id v21 = v45;
    id v6 = v46;
  }
}

void __67__TIAssetManager_updatedActiveRegionsWithCompletionWithCompletion___block_invoke_275(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setCurrentActiveRegions:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setCurrentNormalizedActiveRegions:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  id v2 = TIAssetsOSLogFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v5 = NSString;
    id v6 = [*(id *)(a1 + 32) currentActiveRegions];
    uint64_t v7 = [*(id *)(a1 + 32) currentNormalizedActiveRegions];
    uint64_t v8 = [v5 stringWithFormat:@"%s Set active regions: %@, normalized regions: %@", "-[TIAssetManager updatedActiveRegionsWithCompletionWithCompletion:]_block_invoke", v6, v7];
    *(_DWORD *)long long buf = 138412290;
    id v10 = v8;
    _os_log_debug_impl(&dword_1E3F0E000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) currentNormalizedActiveRegions];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
}

void __67__TIAssetManager_updatedActiveRegionsWithCompletionWithCompletion___block_invoke_279(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v3 = a2;
  TIDispatchAsync();
}

- (id)updatedActiveRegions
{
  [(TIAssetManager *)self updatedActiveRegionsWithCompletionWithCompletion:0];

  return [(TIAssetManager *)self currentNormalizedActiveRegions];
}

- (id)activeInputModeLevels
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(TIAssetManager *)self enabledInputModes];
  id v4 = [(TIAssetManager *)self requestedInputModes_mainThreadCache];
  id v5 = [v3 arrayByAddingObjectsFromArray:v4];
  id v6 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = -[TIAssetManager levelsForInputMode:](self, "levelsForInputMode:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        [v6 addObjectsFromArray:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [v6 allObjects];

  return v13;
}

- (id)activeInputModes
{
  id v3 = [(TIAssetManager *)self enabledInputModes];
  id v4 = [(TIAssetManager *)self requestedInputModes_mainThreadCache];
  id v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (id)defaultEnabledInputModes
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [(TIAssetManager *)self inputModePreferenceProvider];
  id v3 = [v2 defaultEnabledInputModesForCurrentLocale];

  id v4 = [MEMORY[0x1E4F1CA48] array];
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
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = TIInputModeGetNormalizedIdentifier();
        objc_msgSend(v4, "addObject:", v10, v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)enabledInputModes
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(TIAssetManager *)self enabledInputModeIdentifiersProviderBlock];
  if (v3)
  {
    id v4 = [(TIAssetManager *)self enabledInputModeIdentifiersProviderBlock];
    v4[2]();
  }
  else
  {
    id v4 = [(TIAssetManager *)self inputModePreferenceProvider];
    [v4 enabledInputModeIdentifiers];
  id v5 = };

  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = TIInputModeGetNormalizedIdentifier();
        objc_msgSend(v6, "addObject:", v12, v14);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)levelsForInputMode:(id)a3
{
  id v3 = TIInputModeGetComponentsFromIdentifier();
  id v4 = TIInputModeGetNormalizedLevelsFromComponents();

  return v4;
}

- (void)didUpdateAssets
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = TIAssetsOSLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [NSString stringWithFormat:@"%s Posting notifcation: %@.", "-[TIAssetManager didUpdateAssets]", @"TIAssetsDidChangeNotification"];
    *(_DWORD *)long long buf = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"TIAssetsDidChangeNotification" object:self];
}

- (void)scheduleAssetsDidChangeNotificationWithDelay:(double)a3
{
  id v3 = [(TIAssetManager *)self dispatchQueue];
  TIDispatchAsync();
}

void __63__TIAssetManager_scheduleAssetsDidChangeNotificationWithDelay___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) didUpdateAssetsTimer];

  if (!v2)
  {
    id v3 = TIAssetsOSLogFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s Scheduling AssetsDidChangeNotification with delay = %g second(s)", "-[TIAssetManager scheduleAssetsDidChangeNotificationWithDelay:]_block_invoke", *(void *)(a1 + 40));
      *(_DWORD *)long long buf = 138412290;
      uint64_t v11 = v4;
      _os_log_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    double v5 = *(double *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__TIAssetManager_scheduleAssetsDidChangeNotificationWithDelay___block_invoke_229;
    v9[3] = &unk_1E6E2AE28;
    void v9[4] = *(void *)(a1 + 32);
    uint64_t v6 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:0 repeats:v9 block:v5];
    [*(id *)(a1 + 32) setDidUpdateAssetsTimer:v6];

    id v7 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    uint64_t v8 = [*(id *)(a1 + 32) didUpdateAssetsTimer];
    [v7 addTimer:v8 forMode:*MEMORY[0x1E4F1C3A0]];
  }
}

void __63__TIAssetManager_scheduleAssetsDidChangeNotificationWithDelay___block_invoke_229(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) dispatchQueue];
  TIDispatchAsync();
}

uint64_t __63__TIAssetManager_scheduleAssetsDidChangeNotificationWithDelay___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = TIAssetsOSLogFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s Firing delayed AssetsDidChangeNotification now", "-[TIAssetManager scheduleAssetsDidChangeNotificationWithDelay:]_block_invoke_2");
    *(_DWORD *)long long buf = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1E3F0E000, v2, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  TIDispatchAsync();
  return [*(id *)(a1 + 32) setDidUpdateAssetsTimer:0];
}

uint64_t __63__TIAssetManager_scheduleAssetsDidChangeNotificationWithDelay___block_invoke_233(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateAssets];
}

- (BOOL)inputModeHasRegions:(id)a3
{
  id v3 = a3;
  if ([v3 containsString:@"zh"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 containsString:@"yue"];
  }

  return v4;
}

- (id)ddsLanguageIdentifierFromInputMode:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (__CFString *)a3;
  if ([(__CFString *)v3 hasPrefix:@"ars"])
  {
    char v4 = TIAssetsOSLogFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      double v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s Override the ars locale with ar", "-[TIAssetManager ddsLanguageIdentifierFromInputMode:]");
      *(_DWORD *)long long buf = 138412290;
      long long v14 = v5;
      _os_log_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    id v3 = @"ar";
  }
  uint64_t v6 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v3];
  if ([v6 hasPrefix:@"fil"])
  {
    uint64_t v7 = TIAssetsOSLogFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s Override the language code from fil to tl for Tagalog", "-[TIAssetManager ddsLanguageIdentifierFromInputMode:]");
      *(_DWORD *)long long buf = 138412290;
      long long v14 = v8;
      _os_log_impl(&dword_1E3F0E000, v7, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    uint64_t v9 = @"tl";
  }
  else
  {
    if ([v6 isEqualToString:@"mul"])
    {
      uint64_t v10 = v3;
    }
    else
    {
      uint64_t v11 = [v6 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

      uint64_t v10 = v11;
      uint64_t v6 = v10;
    }
    uint64_t v9 = v10;
  }

  return v9;
}

- (id)ddsAssertionIDsFromInputMode:(id)a3 withPotentialRegions:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TIAssetManager *)self ddsLanguageIdentifierFromInputMode:v6];
  uint64_t v9 = [@"com.apple.TextInput.assertion" stringByAppendingFormat:@".%@", v8];
  uint64_t v44 = (void *)[v9 mutableCopy];

  if ([(TIAssetManager *)self inputModeHasRegions:v8])
  {
    id v38 = self;
    v39 = v8;
    id v40 = v7;
    id v41 = v6;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v7;
    uint64_t v10 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v43 = *(void *)v46;
      uint64_t v12 = *MEMORY[0x1E4F5EF20];
      long long v13 = (void *)*MEMORY[0x1E4F5EF38];
      uint64_t v14 = *MEMORY[0x1E4F5EF28];
      uint64_t v15 = *MEMORY[0x1E4F5EF18];
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v46 != v43) {
            objc_enumerationMutation(obj);
          }
          long long v17 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v18 = [v17 objectForKeyedSubscript:v12];
          uint64_t v19 = (void *)v18;
          if (v18) {
            uint64_t v20 = (void *)v18;
          }
          else {
            uint64_t v20 = v13;
          }
          id v21 = v20;

          uint64_t v22 = [v17 objectForKeyedSubscript:v14];
          id v23 = (void *)v22;
          if (v22) {
            v24 = (void *)v22;
          }
          else {
            v24 = v13;
          }
          id v25 = v24;

          uint64_t v26 = [v17 objectForKeyedSubscript:v15];
          id v27 = (void *)v26;
          if (v26) {
            uint64_t v28 = (void *)v26;
          }
          else {
            uint64_t v28 = v13;
          }
          id v29 = v28;

          [v44 appendFormat:@"_%@_%@_%@", v21, v25, v29];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v11);
    }

    id v7 = v40;
    id v6 = v41;
    self = v38;
    uint64_t v8 = v39;
  }
  uint64_t v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v44, 0);
  if ([(TIAssetManager *)self requireMecabraDictionaryRapidUpdatesAssetsForLanguageIdentifier:v8])
  {
    v31 = [v44 stringByAppendingString:@".mecabra_dictionary_rapid_updates_new"];
    [v30 addObject:v31];
  }
  uint64_t v32 = [(TIAssetManager *)self multilingualLocaleIdentifierForInputMode:v6];
  if (v32)
  {
    uint64_t v33 = [(TIAssetManager *)self ddsLanguageIdentifierFromInputMode:v32];
    uint64_t v34 = [@"com.apple.TextInput.assertion" stringByAppendingFormat:@".%@.%@", v6, v33];
    long long v35 = (void *)[v34 mutableCopy];

    uint64_t v36 = [v35 stringByAppendingString:@".preferred_mul_locale"];
    [v30 addObject:v36];
  }

  return v30;
}

- (void)addAssertionWithInputMode:(id)a3 assertionID:(id)a4 potentialRegions:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [(TIAssetManager *)self assetTypeForAssertionId:v8];
  uint64_t v12 = [(TIAssetManager *)self localeIdentifierForAssertionId:v8 inputMode:v10];

  long long v13 = [(TIAssetManager *)self ddsLinguisticAssetQueryWithAssetType:v11 inputModeIdentifier:v12 withRegions:v9];

  id v14 = objc_alloc_init(MEMORY[0x1E4F5EF50]);
  [v14 setPreferredDownloadFrequency:2];
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  uint64_t v15 = TIOSLogFacility();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    long long v17 = [NSString stringWithFormat:@"%s Adding assertion: %@ with assetType: %@ query: %@ policy: %@", "-[TIAssetManager addAssertionWithInputMode:assertionID:potentialRegions:]", v11, v8, v13, v14];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v19 = v17;
    _os_log_debug_impl(&dword_1E3F0E000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  long long v16 = [MEMORY[0x1E4F5EF48] sharedInstance];
  [v16 addAssertionForAssetsWithQuery:v13 policy:v14 assertionID:v8 clientID:@"com.apple.TextInput"];
}

- (id)localeIdentifierForAssertionId:(id)a3 inputMode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TIAssetManager *)self multilingualLocaleIdentifierForInputMode:v6];
  unsigned __int8 v9 = [v7 hasSuffix:@".preferred_mul_locale"];

  if ((v9 & (v8 != 0)) != 0) {
    id v10 = v8;
  }
  else {
    id v10 = v6;
  }
  id v11 = v10;

  return v11;
}

- (id)multilingualLocaleIdentifierForInputMode:(id)a3
{
  id v3 = TIGetInputModeProperties();
  char v4 = [v3 objectForKey:*MEMORY[0x1E4FAE6F0]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
LABEL_5:
    id v6 = v5;
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 performSelector:sel_stringValue];
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (id)assetTypeForAssertionId:(id)a3
{
  if ([a3 hasSuffix:@".mecabra_dictionary_rapid_updates_new"]) {
    id v3 = @"com.apple.MobileAsset.MecabraDictionaryRapidUpdates";
  }
  else {
    id v3 = (__CFString *)*MEMORY[0x1E4F5EF40];
  }

  return v3;
}

- (void)updateAssertionsForInputModes:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = [MEMORY[0x1E4F28B50] mainBundle];
  id v5 = [v4 bundleIdentifier];
  int v6 = [v5 isEqualToString:@"com.apple.kbd"];

  if (v6)
  {
    id v7 = _TIQueueUserInitiated();
    id v10 = v3;
    TIDispatchAsync();
  }
  else
  {
    id v8 = TIAssetsOSLogFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s Skipping update asset assertions", "-[TIAssetManager updateAssertionsForInputModes:]");
      *(_DWORD *)long long buf = 138412290;
      uint64_t v12 = v9;
      _os_log_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
  }
}

void __48__TIAssetManager_updateAssertionsForInputModes___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__TIAssetManager_updateAssertionsForInputModes___block_invoke_2;
  v5[3] = &unk_1E6E2B708;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 getActiveRegionsWithCompletion:v5];
}

void __48__TIAssetManager_updateAssertionsForInputModes___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v5 = [MEMORY[0x1E4F5EF48] sharedInstance];
  id v6 = [v5 assertionIDsForClientID:@"com.apple.TextInput"];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v41;
    uint64_t v10 = *MEMORY[0x1E4FAE768];
    uint64_t v27 = *MEMORY[0x1E4FAE768];
    uint64_t v28 = *(void *)v41;
    do
    {
      uint64_t v11 = 0;
      uint64_t v29 = v8;
      do
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
        if (([v12 containsString:v10] & 1) == 0)
        {
          uint64_t v31 = v11;
          uint64_t v13 = [*(id *)(a1 + 40) ddsAssertionIDsFromInputMode:v12 withPotentialRegions:v3];
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v45 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v37 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v36 + 1) + 8 * i);
                if (([v6 containsObject:v18] & 1) == 0
                  && ([v4 containsObject:v18] & 1) == 0)
                {
                  [*(id *)(a1 + 40) addAssertionWithInputMode:v12 assertionID:v18 potentialRegions:v3];
                }
                [v4 addObject:v18];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v45 count:16];
            }
            while (v15);
          }

          uint64_t v10 = v27;
          uint64_t v9 = v28;
          uint64_t v8 = v29;
          uint64_t v11 = v31;
        }
        ++v11;
      }
      while (v11 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v8);
  }

  uint64_t v19 = (void *)[v6 mutableCopy];
  [v19 minusSet:v4];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v20 = v19;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        uint64_t v26 = [MEMORY[0x1E4F5EF48] sharedInstance];
        [v26 removeAssertionWithIdentifier:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v22);
  }
}

- (BOOL)requireMecabraDictionaryRapidUpdatesAssetsForLanguageIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [&unk_1F3FA7760 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(&unk_1F3FA7760);
        }
        if ([v3 isEqualToString:*(void *)(*((void *)&v10 + 1) + 8 * i)])
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [&unk_1F3FA7760 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (void)appleKeyboardsPreferencesChanged:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = TIAssetsOSLogFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s Observed keyboard preferences changed.", "-[TIAssetManager appleKeyboardsPreferencesChanged:]");
    *(_DWORD *)long long buf = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    uint64_t v7 = self;
    uint64_t v6 = [(TIAssetManager *)self activeInputModeLevels];
    [(TIAssetManager *)v7 updateAssertionsForInputModes:v6];
  }
  else
  {
    TIDispatchSync();
  }
}

void __51__TIAssetManager_appleKeyboardsPreferencesChanged___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activeInputModeLevels];
  [*(id *)(a1 + 32) updateAssertionsForInputModes:v2];
}

void __51__TIAssetManager_appleKeyboardsPreferencesChanged___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activeInputModeLevels];
  [*(id *)(a1 + 32) updateAssertionsForInputModes:v2];
}

- (void)didUpdateAssetsWithType:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = TIAssetsOSLogFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [NSString stringWithFormat:@"%s Handling DDS update of asset type: %@", "-[TIAssetManager didUpdateAssetsWithType:]", v3];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  TIDispatchAsync();
}

void __42__TIAssetManager_didUpdateAssetsWithType___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activeInputModeLevels];
  id v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__TIAssetManager_didUpdateAssetsWithType___block_invoke_2;
  v5[3] = &unk_1E6E2B708;
  void v5[4] = v3;
  id v6 = v2;
  id v4 = v2;
  [v3 getActiveRegionsWithCompletion:v5];
}

void __42__TIAssetManager_didUpdateAssetsWithType___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dispatchQueue];
  id v3 = *(id *)(a1 + 40);
  TIDispatchAsync();
}

uint64_t __42__TIAssetManager_didUpdateAssetsWithType___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) languagesWithWarmedAssets];
  [v2 removeAllObjects];

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 _warmAssetQueriesForInputModes:v4];
}

- (void)unregisterForNotifications
{
  id v3 = [MEMORY[0x1E4F5EF48] sharedInstance];
  [v3 unregisterDelegate:self];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];
}

- (void)registerForNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_appleKeyboardsPreferencesChanged_ name:@"AppleKeyboardsPreferencesChangedNotification_Private" object:0];

  id v4 = [MEMORY[0x1E4F5EF48] sharedInstance];
  [v4 registerDelegate:self];

  [(TIAssetManager *)self registerCacheDeleteCallbacks];
}

- (void)removeLinguisticAssetsAssertionWithIdentifier:(id)a3 forClientID:(id)a4 withHandler:(id)a5
{
  id v6 = (void *)MEMORY[0x1E4F5EF48];
  uint64_t v9 = (void (**)(id, void))a5;
  id v7 = a3;
  uint64_t v8 = [v6 sharedInstance];
  [v8 removeAssertionWithIdentifier:v7];

  v9[2](v9, 0);
}

- (void)addLinguisticAssetsAssertionForLanguage:(id)a3 assertionID:(id)a4 region:(id)a5 clientID:(id)a6 withHandler:(id)a7
{
  id v22 = a5;
  long long v12 = (void (**)(id, void))a7;
  id v13 = a6;
  id v14 = a4;
  uint64_t v15 = [(TIAssetManager *)self ddsLanguageIdentifierFromInputMode:a3];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F5EF58]) initWithLanguageIdentifier:v15];
  [v16 setLocalOnly:0];
  [v16 setInstalledOnly:0];
  if ([v22 count])
  {
    long long v17 = [v22 objectForKey:*MEMORY[0x1E4F5EF20]];
    uint64_t v18 = [v22 objectForKey:*MEMORY[0x1E4F5EF28]];
    uint64_t v19 = [v22 objectForKey:*MEMORY[0x1E4F5EF18]];
    [v16 addRegionWithCountry:v17 province:v18 city:v19];
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4F5EF50]);
  [v20 setPreferredDownloadFrequency:1];
  uint64_t v21 = [MEMORY[0x1E4F5EF48] sharedInstance];
  [v21 addAssertionForAssetsWithQuery:v16 policy:v20 assertionID:v14 clientID:v13];

  v12[2](v12, 0);
}

- (void)requestAssetDownloadForLanguage:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__TIAssetManager_requestAssetDownloadForLanguage_completion___block_invoke;
  void v7[3] = &unk_1E6E2B708;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(TIAssetManager *)self getActiveRegionsWithCompletion:v7];
}

void __61__TIAssetManager_requestAssetDownloadForLanguage_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [*(id *)(a1 + 32) ddsAssertionIDsFromInputMode:*(void *)(a1 + 40) withPotentialRegions:a2];
  uint64_t v18 = a1;
  uint64_t v19 = [*(id *)(a1 + 32) ddsLanguageIdentifierFromInputMode:*(void *)(a1 + 40)];
  id v4 = [MEMORY[0x1E4F5EF48] sharedInstance];
  id v5 = [v4 assertionIDsForClientID:@"com.apple.TextInput"];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if (([v5 containsObject:v11] & 1) == 0)
        {
          long long v12 = [*(id *)(v18 + 32) assetTypeForAssertionId:v11];
          id v13 = TIAssetsOSLogFacility();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            long long v17 = [NSString stringWithFormat:@"%s AssertionId: %@, AssetType: %@", "-[TIAssetManager requestAssetDownloadForLanguage:completion:]_block_invoke", v11, v12];
            *(_DWORD *)long long buf = 138412290;
            uint64_t v25 = v17;
            _os_log_debug_impl(&dword_1E3F0E000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
          id v14 = (void *)[objc_alloc(MEMORY[0x1E4F5EF58]) initWithAssetType:v12 languageIdentifier:v19];
          [v14 setLocalOnly:0];
          [v14 setInstalledOnly:0];
          id v15 = objc_alloc_init(MEMORY[0x1E4F5EF50]);
          uint64_t v16 = [MEMORY[0x1E4F5EF48] sharedInstance];
          [v16 addAssertionForAssetsWithQuery:v14 policy:v15 assertionID:v11 clientID:@"com.apple.TextInput"];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v8);
  }
}

- (void)_warmAssetQueryForLanguage:(id)a3
{
  id v4 = a3;
  id v5 = [(TIAssetManager *)self dispatchQueue];
  id v6 = v4;
  TIDispatchAsync();
}

void __45__TIAssetManager__warmAssetQueryForLanguage___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) languagesWithWarmedAssets];
  char v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) languagesWithWarmedAssets];
    [v4 addObject:*(void *)(a1 + 40)];

    id v5 = TIAssetsOSLogFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [NSString stringWithFormat:@"%s Warming asset query for language '%@'", "-[TIAssetManager _warmAssetQueryForLanguage:]_block_invoke", *(void *)(a1 + 40)];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v19 = v6;
      _os_log_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = [*(id *)(a1 + 32) _ddsAssetsForLanguageIdentifier:*(void *)(a1 + 40) cachedOnly:0];
    uint64_t v9 = (void *)[v7 initWithArray:v8];

    if ([*(id *)(a1 + 32) requireMecabraDictionaryRapidUpdatesAssetsForLanguageIdentifier:*(void *)(a1 + 40)])
    {
      uint64_t v10 = TIAssetsOSLogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = [NSString stringWithFormat:@"%s Warming MecabraDictionaryRapidUpdates asset query for language '%@'", "-[TIAssetManager _warmAssetQueryForLanguage:]_block_invoke", *(void *)(a1 + 40)];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v19 = v11;
        _os_log_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }
      long long v12 = [*(id *)(a1 + 32) _ddsAssetsForAssetType:@"com.apple.MobileAsset.MecabraDictionaryRapidUpdates" languageIdentifier:*(void *)(a1 + 40) cachedOnly:0];
      [v9 addObjectsFromArray:v12];
    }
    uint64_t v13 = [v9 count];
    id v14 = TIAssetsOSLogFacility();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v15)
      {
        uint64_t v16 = [NSString stringWithFormat:@"%s Warmed asset query for language '%@' returned %lu assets", "-[TIAssetManager _warmAssetQueryForLanguage:]_block_invoke", *(void *)(a1 + 40), objc_msgSend(v9, "count")];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v19 = v16;
        _os_log_impl(&dword_1E3F0E000, v14, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }
      [*(id *)(a1 + 32) scheduleAssetsDidChangeNotificationWithDelay:3.0];
    }
    else
    {
      if (v15)
      {
        long long v17 = [NSString stringWithFormat:@"%s Warmed asset query for language '%@' returned no assets", "-[TIAssetManager _warmAssetQueryForLanguage:]_block_invoke", *(void *)(a1 + 40)];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v19 = v17;
        _os_log_impl(&dword_1E3F0E000, v14, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }
    }
  }
}

- (void)_warmLDEnumerateAssetQueriesForInputMode:(id)a3
{
  id v4 = a3;
  id v5 = [(TIAssetManager *)self dispatchQueue];
  id v6 = v4;
  TIDispatchAsync();
}

void __59__TIAssetManager__warmLDEnumerateAssetQueriesForInputMode___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v2 addObject:*(void *)(a1 + 32)];
  char v3 = [*(id *)(a1 + 40) multilingualLocaleIdentifierForInputMode:*(void *)(a1 + 32)];
  if (v3) {
    [v2 addObject:v3];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:", *(void *)(*((void *)&v10 + 1) + 8 * v8), (void)v10);
        LDEnumerateAssetDataItems();

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_warmAssetQueriesForInputModes:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
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
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        long long v10 = [(TIAssetManager *)self ddsLanguageIdentifierFromInputMode:v9];
        [(TIAssetManager *)self _warmAssetQueryForLanguage:v10];
        [(TIAssetManager *)self _warmLDEnumerateAssetQueriesForInputMode:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)_ddsContentItemsFromAssets:(id)a3 contentType:(id)a4 filteredWithRegion:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v10 = TIAssetsOSLogFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    long long v11 = NSString;
    uint64_t v12 = [v8 count];
    long long v13 = "NO";
    if (v5) {
      long long v13 = "YES";
    }
    long long v14 = [v11 stringWithFormat:@"%s Filtering content items from %lu asset(s) for contentType '%@' (filteredWithRegion: %s)", "-[TIAssetManager _ddsContentItemsFromAssets:contentType:filteredWithRegion:]", v12, v9, v13];
    *(_DWORD *)long long buf = 138412290;
    long long v45 = v14;
    _os_log_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  if ([v8 count])
  {
    uint64_t v15 = [MEMORY[0x1E4F5EF60] attributeFilter];
    [v15 addContentType:v9];
    if ([v9 isEqualToString:@"LanguageModel"]) {
      [v15 addContentType:@"MultilingualLanguageModel"];
    }
    if (v5)
    {
      BOOL v35 = v5;
      id v36 = v9;
      id v37 = v8;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      uint64_t v16 = [(TIAssetManager *)self topActiveRegions];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v40;
        long long v38 = v16;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v40 != v19) {
              objc_enumerationMutation(v16);
            }
            long long v21 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            long long v22 = [v21 objectForKeyedSubscript:@"Country"];
            long long v23 = [v21 objectForKeyedSubscript:@"Province"];
            v24 = [v21 objectForKeyedSubscript:@"City"];
            uint64_t v25 = TIAssetsOSLogFacility();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v26 = [NSString stringWithFormat:@"%s Adding country: %@, province: %@, city: %@", "-[TIAssetManager _ddsContentItemsFromAssets:contentType:filteredWithRegion:]", v22, v23, v24];
              *(_DWORD *)long long buf = 138412290;
              long long v45 = v26;
              _os_log_debug_impl(&dword_1E3F0E000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

              uint64_t v16 = v38;
            }

            [v15 addRegionWithCountry:v22 province:v23 city:v24];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
        }
        while (v18);
      }

      id v9 = v36;
      id v8 = v37;
      BOOL v5 = v35;
    }
    [v15 addRegionWithCountry:&stru_1F3F7A998 province:&stru_1F3F7A998 city:&stru_1F3F7A998];
    uint64_t v27 = [MEMORY[0x1E4F5EF48] sharedInstance];
    uint64_t v28 = [v27 contentItemsFromAssets:v8 matchingFilter:v15];

    uint64_t v29 = TIAssetsOSLogFacility();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = NSString;
      uint64_t v31 = [v28 count];
      long long v32 = "NO";
      if (v5) {
        long long v32 = "YES";
      }
      long long v33 = [v30 stringWithFormat:@"%s Found %lu content item(s) for contentType '%@' (filteredWithRegion: %s)", "-[TIAssetManager _ddsContentItemsFromAssets:contentType:filteredWithRegion:]", v31, v9, v32];
      *(_DWORD *)long long buf = 138412290;
      long long v45 = v33;
      _os_log_impl(&dword_1E3F0E000, v29, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v28 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v28;
}

- (id)_ddsAssetsForAssetType:(id)a3 languageIdentifier:(id)a4 cachedOnly:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = TIAssetsOSLogFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    long long v10 = "NO";
    if (v5) {
      long long v10 = "YES";
    }
    long long v11 = [NSString stringWithFormat:@"%s Getting assets for asset type: '%@' language identifier '%@' (cached only: %s)", "-[TIAssetManager _ddsAssetsForAssetType:languageIdentifier:cachedOnly:]", v7, v8, v10];
    *(_DWORD *)long long buf = 138412290;
    long long v22 = v11;
    _os_log_impl(&dword_1E3F0E000, v9, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F5EF58]) initWithAssetType:v7 languageIdentifier:v8];
  [v12 setCachedOnly:v5];
  long long v13 = [MEMORY[0x1E4F5EF48] sharedInstance];
  id v20 = 0;
  long long v14 = [v13 assetsForQuery:v12 error:&v20];
  id v15 = v20;

  if (v15)
  {
    uint64_t v16 = TIAssetsOSLogFacility();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = "NO";
      if (v5) {
        uint64_t v18 = "YES";
      }
      uint64_t v19 = [NSString stringWithFormat:@"%s Error getting assets for language identifier '%@' (cached only: %s): %@", "-[TIAssetManager _ddsAssetsForAssetType:languageIdentifier:cachedOnly:]", v8, v18, v15];
      *(_DWORD *)long long buf = 138412290;
      long long v22 = v19;
      _os_log_error_impl(&dword_1E3F0E000, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }

  return v14;
}

- (id)_ddsAssetsForLanguageIdentifier:(id)a3 cachedOnly:(BOOL)a4
{
  return [(TIAssetManager *)self _ddsAssetsForAssetType:*MEMORY[0x1E4F5EF40] languageIdentifier:a3 cachedOnly:a4];
}

- (void)ddsAssetsForInputMode:(id)a3 cachedOnly:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(TIAssetManager *)self dispatchQueue];
  uint64_t v12 = v8;
  id v10 = v7;
  id v11 = v8;
  TIDispatchAsync();
}

void __62__TIAssetManager_ddsAssetsForInputMode_cachedOnly_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    id v2 = *(void **)(a1 + 32);
    char v3 = [*(id *)(a1 + 40) normalizedIdentifier];
    id v5 = [v2 ddsLanguageIdentifierFromInputMode:v3];

    id v4 = [*(id *)(a1 + 32) _ddsAssetsForLanguageIdentifier:v5 cachedOnly:*(unsigned __int8 *)(a1 + 56)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)ddsAssetContentItemsWithContentType:(id)a3 inputMode:(id)a4 filteredWithRegion:(BOOL)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [(TIAssetManager *)self dispatchQueue];
  uint64_t v16 = v10;
  uint64_t v17 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  TIDispatchAsync();
}

void __94__TIAssetManager_ddsAssetContentItemsWithContentType_inputMode_filteredWithRegion_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  char v3 = [*(id *)(a1 + 40) normalizedIdentifier];
  id v7 = [v2 ddsLanguageIdentifierFromInputMode:v3];

  id v4 = [*(id *)(a1 + 32) _ddsAssetsForLanguageIdentifier:v7 cachedOnly:0];
  id v5 = [*(id *)(a1 + 32) _ddsContentItemsFromAssets:v4 contentType:*(void *)(a1 + 48) filteredWithRegion:*(unsigned __int8 *)(a1 + 64)];
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6) {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);
  }
}

- (id)ddsAssetContentItemsWithContentType:(id)a3 inputMode:(id)a4 filteredWithRegion:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (__CFString *)a3;
  id v9 = [a4 normalizedIdentifier];
  id v10 = [(TIAssetManager *)self ddsLanguageIdentifierFromInputMode:v9];

  id v11 = (__CFString *)(id)*MEMORY[0x1E4F5EF40];
  if ([(TIAssetManager *)self requireMecabraDictionaryRapidUpdatesAssetsForLanguageIdentifier:v10]&& v8 == @"LexiconDelta")
  {

    id v11 = @"com.apple.MobileAsset.MecabraDictionaryRapidUpdates";
  }
  uint64_t v12 = [(TIAssetManager *)self _ddsAssetsForAssetType:v11 languageIdentifier:v10 cachedOnly:1];
  id v13 = [(TIAssetManager *)self _ddsContentItemsFromAssets:v12 contentType:v8 filteredWithRegion:v5];
  if (![v12 count]) {
    [(TIAssetManager *)self _warmAssetQueryForLanguage:v10];
  }

  return v13;
}

- (void)setEnabledInputModeIdentifiersProviderBlock:(id)a3
{
  self->_enabledInputModeIdentifiersProviderBlocuint64_t k = (id)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSMutableSet)languagesWithWarmedAssets
{
  languagesWithWarmedAssets = self->_languagesWithWarmedAssets;
  if (!languagesWithWarmedAssets)
  {
    id v4 = [MEMORY[0x1E4F1CA80] setWithCapacity:2];
    BOOL v5 = self->_languagesWithWarmedAssets;
    self->_languagesWithWarmedAssets = v4;

    languagesWithWarmedAssets = self->_languagesWithWarmedAssets;
  }

  return languagesWithWarmedAssets;
}

- (double)requestExpirationInterval
{
  return 864000.0;
}

- (void)dealloc
{
  [(TIAssetManager *)self unregisterForNotifications];
  v3.receiver = self;
  v3.super_class = (Class)TIAssetManager;
  [(TIAssetManager *)&v3 dealloc];
}

- (TIAssetManager)initWithRequestedInputModes:(id)a3 inputModePreferenceProvider:(id)a4 enabledInputModesProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)TIAssetManager;
  id v11 = [(TIAssetManager *)&v36 init];
  if (v11)
  {
    uint64_t v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.TextInput.asset-manager", v12);
    dispatchQueue = v11->_dispatchQueue;
    v11->_dispatchQueue = (OS_dispatch_queue *)v13;

    if (v8)
    {
      id v15 = (TIRequestedInputModes *)v8;
      requestedInputModes = v11->_requestedInputModes;
      v11->_requestedInputModes = v15;
    }
    else
    {
      uint64_t v17 = [TIRequestedInputModes alloc];
      requestedInputModes = +[TIRequestedInputModes defaultDatabaseURL];
      uint64_t v18 = [(TIRequestedInputModes *)v17 initWithURL:requestedInputModes];
      uint64_t v19 = v11->_requestedInputModes;
      v11->_requestedInputModes = (TIRequestedInputModes *)v18;
    }
    requestedInputModes_mainThreadCache = v11->_requestedInputModes_mainThreadCache;
    v11->_requestedInputModes_mainThreadCache = (NSArray *)MEMORY[0x1E4F1CBF0];

    if (v9) {
      long long v21 = (_TIInputModePreferenceProvider *)v9;
    }
    else {
      long long v21 = objc_alloc_init(_TIInputModePreferenceProvider);
    }
    inputModePreferenceProvider = v11->_inputModePreferenceProvider;
    v11->_inputModePreferenceProvider = (TIInputModePreferenceProvider *)v21;

    uint64_t v23 = [v10 copy];
    enabledInputModeIdentifiersProviderBlocuint64_t k = v11->_enabledInputModeIdentifiersProviderBlock;
    v11->_enabledInputModeIdentifiersProviderBlocuint64_t k = (id)v23;

    uint64_t v25 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    currentActiveRegions = v11->_currentActiveRegions;
    v11->_currentActiveRegions = v25;

    uint64_t v27 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    currentNormalizedActiveRegions = v11->_currentNormalizedActiveRegions;
    v11->_currentNormalizedActiveRegions = v27;

    uint64_t v29 = (void *)MEMORY[0x1E4F1C9C8];
    [(TIAssetManager *)v11 requestExpirationInterval];
    uint64_t v31 = [v29 dateWithTimeIntervalSinceNow:-v30];
    long long v32 = v11->_requestedInputModes;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __100__TIAssetManager_initWithRequestedInputModes_inputModePreferenceProvider_enabledInputModesProvider___block_invoke;
    v34[3] = &unk_1E6E2CB20;
    BOOL v35 = v11;
    [(TIRequestedInputModes *)v32 removeInputModesBeforeDate:v31 handler:v34];
  }
  return v11;
}

void __100__TIAssetManager_initWithRequestedInputModes_inputModePreferenceProvider_enabledInputModesProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  TIDispatchAsync();
}

void __100__TIAssetManager_initWithRequestedInputModes_inputModePreferenceProvider_enabledInputModesProvider___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setRequestedInputModes_mainThreadCache:", *(void *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) activeInputModeLevels];
  id v3 = [*(id *)(a1 + 32) dispatchQueue];
  id v5 = *(id *)(a1 + 32);
  id v4 = v2;
  TIDispatchAsync();
}

void __100__TIAssetManager_initWithRequestedInputModes_inputModePreferenceProvider_enabledInputModesProvider___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) registerForNotifications];
  [*(id *)(a1 + 32) updateAssertionsForInputModes:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __100__TIAssetManager_initWithRequestedInputModes_inputModePreferenceProvider_enabledInputModesProvider___block_invoke_4;
  v3[3] = &unk_1E6E2B708;
  id v4 = v2;
  id v5 = *(id *)(a1 + 40);
  [v4 getActiveRegionsWithCompletion:v3];
}

uint64_t __100__TIAssetManager_initWithRequestedInputModes_inputModePreferenceProvider_enabledInputModesProvider___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _warmAssetQueriesForInputModes:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return [v2 scheduleAssetsDidChangeNotificationWithDelay:3.0];
}

- (TIAssetManager)init
{
  return [(TIAssetManager *)self initWithRequestedInputModes:0 inputModePreferenceProvider:0 enabledInputModesProvider:0];
}

+ (int64_t)assetUpdateStatusforDDSAssetUpdateStatus:(int64_t)a3
{
  int64_t v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 >= 3)
  {
    id v4 = TIAssetsOSLogFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s Unexpected asset update status: %ld returned from the data delivery service", "+[TIAssetManager assetUpdateStatusforDDSAssetUpdateStatus:]", v3);
      *(_DWORD *)long long buf = 138412290;
      id v8 = v6;
      _os_log_error_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    return 0;
  }
  return v3;
}

+ (id)_regionFromAddress:(id)a3
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v14[0] = @"City";
  id v3 = a3;
  uint64_t v4 = [v3 city];
  id v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  else {
    uint64_t v6 = &stru_1F3F7A998;
  }
  v15[0] = v6;
  v14[1] = @"Province";
  uint64_t v7 = [v3 state];
  id v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  else {
    uint64_t v9 = &stru_1F3F7A998;
  }
  v15[1] = v9;
  void v14[2] = @"Country";
  id v10 = [v3 country];

  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = &stru_1F3F7A998;
  }
  void v15[2] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

+ (id)_addressFromRegion:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1BA58];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [v4 objectForKeyedSubscript:@"City"];
  [v5 setCity:v6];

  uint64_t v7 = [v4 objectForKeyedSubscript:@"Province"];
  [v5 setState:v7];

  id v8 = [v4 objectForKeyedSubscript:@"Country"];

  [v5 setCountry:v8];

  return v5;
}

+ (id)singletonInstanceWithEnabledInputModesProvider:(id)a3
{
  id v3 = a3;
  if (TI_DEVICE_UNLOCKED_SINCE_BOOT())
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__TIAssetManager_singletonInstanceWithEnabledInputModesProvider___block_invoke;
    block[3] = &unk_1E6E2E3A8;
    id v7 = v3;
    if (singletonInstanceWithEnabledInputModesProvider__onceToken != -1) {
      dispatch_once(&singletonInstanceWithEnabledInputModesProvider__onceToken, block);
    }
    id v4 = (id)singletonInstanceWithEnabledInputModesProvider__singletonInstance;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t __65__TIAssetManager_singletonInstanceWithEnabledInputModesProvider___block_invoke(uint64_t a1)
{
  singletonInstanceWithEnabledInputModesProvider__singletonInstance = [[TIAssetManager alloc] initWithRequestedInputModes:0 inputModePreferenceProvider:0 enabledInputModesProvider:*(void *)(a1 + 32)];

  return MEMORY[0x1F41817F8]();
}

+ (id)sharedAssetManagerWithEnabledInputModesProvider:(id)a3
{
  if (__testingInstance_7085)
  {
    id v3 = (id)__testingInstance_7085;
  }
  else
  {
    id v3 = +[TIAssetManager singletonInstanceWithEnabledInputModesProvider:a3];
  }

  return v3;
}

+ (id)sharedAssetManager
{
  return (id)[a1 sharedAssetManagerWithEnabledInputModesProvider:0];
}

+ (void)setSharedAssetManager:(id)a3
{
  id v4 = a3;
  if ((id)__testingInstance_7085 != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)&__testingInstance_7085, a3);
    id v4 = v5;
  }
}

@end