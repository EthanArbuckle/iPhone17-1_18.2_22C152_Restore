@interface WLKSettingsCloudUtilities
+ (BOOL)_shouldContinueWithCloudSyncResult:(BOOL)a3 onDisabledHandler:(id)a4;
+ (BOOL)synchronizeSettingsFromCloudIfNeeded:(id *)a3;
+ (id)_connection;
+ (id)_queue;
+ (id)_syncDictionaryForAppSettings:(id)a3;
+ (id)_syncDictionaryForLocalStore;
+ (void)_cloudSyncEnabledWithCompletion:(id)a3;
+ (void)_fetchSyncDictionary:(id)a3;
+ (void)_postChangeDictionaryToCloud:(id)a3 completion:(id)a4;
+ (void)_runResetAccountWithCompletion:(id)a3;
+ (void)_runSynchronizeSettingsFromCloudIfNeededWithCompletion:(id)a3;
+ (void)_runUpdateCloudStoreAppSettings:(id)a3 deleteHistory:(BOOL)a4 removeEntry:(BOOL)a5 completion:(id)a6;
+ (void)deleteAllHistoryWithCompletion:(id)a3;
+ (void)forceUpdateWithCompletion:(id)a3;
+ (void)resetAccountWithCompletion:(id)a3;
+ (void)synchronizeSettingsFromCloudIfNeededWithCompletion:(id)a3;
+ (void)updateCloudStoreAccountLevelSetting:(id)a3 value:(id)a4 completion:(id)a5;
+ (void)updateCloudStoreAppSettings:(id)a3 deleteHistory:(BOOL)a4 completion:(id)a5;
+ (void)updateCloudStoreAppSettings:(id)a3 deleteHistory:(BOOL)a4 removeEntry:(BOOL)a5 completion:(id)a6;
+ (void)updateCloudStoreWithCompletion:(id)a3;
+ (void)updateLocalStoreWithCompletion:(id)a3;
@end

@implementation WLKSettingsCloudUtilities

void __84__WLKSettingsCloudUtilities__runSynchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  v2 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v2))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.ActiveAccount", "", (uint8_t *)buf, 2u);
  }

  v3 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  v4 = objc_msgSend(v3, "ams_activeiTunesAccount");

  v5 = objc_msgSend(v4, "ams_DSID");
  v6 = [v5 stringValue];

  v7 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v7))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.ActiveAccount", "", (uint8_t *)buf, 2u);
  }

  if ([v6 length])
  {
    v8 = WLKStartupSignpostLogObject();
    if (os_signpost_enabled(v8))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.SettingsStoreRefresh", "", (uint8_t *)buf, 2u);
    }

    v9 = +[WLKSettingsStore sharedSettings];
    objc_initWeak(buf, *(id *)(a1 + 40));
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __84__WLKSettingsCloudUtilities__runSynchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke_66;
    v13[3] = &unk_1E620B1A0;
    objc_copyWeak(&v16, buf);
    id v15 = *(id *)(a1 + 32);
    id v10 = v9;
    id v14 = v10;
    [v10 refreshWithCompletion:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(buf);
    goto LABEL_13;
  }
  v11 = WLKSystemLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1BA2E8000, v11, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - cannot synchronize from cloud. Not signed in..", (uint8_t *)buf, 2u);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    WLKError(200, 0, @"Cannot synchronize from cloud. Not signed in...");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v10);
LABEL_13:
  }
}

void __84__WLKSettingsCloudUtilities__runSynchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.SettingsStoreRefresh", "", buf, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) lastSyncDate];
  v4 = (void *)v3;
  if (WLKSettingsStoreURLBagKeyAPIMaxSettingsAge_block_invoke_onceToken == -1)
  {
    if (!v3) {
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&WLKSettingsStoreURLBagKeyAPIMaxSettingsAge_block_invoke_onceToken, &__block_literal_global_25);
    if (!v4) {
      goto LABEL_6;
    }
  }
  v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSinceDate:v4];
  double v7 = v6;
  double v8 = (double)(unint64_t)WLKSettingsStoreURLBagKeyAPIMaxSettingsAge_block_invoke_maxAge;

  if (v7 <= v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_12;
  }
LABEL_6:
  v9 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.CloudSync", "", buf, 2u);
  }

  id v10 = WLKSystemLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA2E8000, v10, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - Requesting settings sync", buf, 2u);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__WLKSettingsCloudUtilities__runSynchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke_73;
  v12[3] = &unk_1E620A368;
  v11 = *(void **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  [v11 synchronize:1 completion:v12];

LABEL_12:
}

+ (void)synchronizeSettingsFromCloudIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.CloudSyncEnabled", "", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__WLKSettingsCloudUtilities_synchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke;
  v7[3] = &unk_1E620B088;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  [a1 _cloudSyncEnabledWithCompletion:v7];
}

void __84__WLKSettingsCloudUtilities__runSynchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke_70()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v0 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v0))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.BagMaxLocalAge", "", (uint8_t *)&v12, 2u);
  }

  v1 = [MEMORY[0x1E4FA9C70] app];
  v2 = [v1 cachedIntegerForKey:kBagKeyUVSearchMaxLocalSettingsAgeSeconds];

  if (v2)
  {
    WLKSettingsStoreURLBagKeyAPIMaxSettingsAge_block_invoke_maxAge = [v2 unsignedIntegerValue];
    uint64_t v3 = WLKSystemLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      uint64_t v13 = WLKSettingsStoreURLBagKeyAPIMaxSettingsAge_block_invoke_maxAge;
      _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - SettingStore maxAge=%lu", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    WLKSettingsStoreURLBagKeyAPIMaxSettingsAge_block_invoke_maxAge = 604800;
    uint64_t v3 = WLKSystemLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __84__WLKSettingsCloudUtilities__runSynchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke_70_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  v11 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v11))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.BagMaxLocalAge", "", (uint8_t *)&v12, 2u);
  }
}

uint64_t __35__WLKSettingsCloudUtilities__queue__block_invoke()
{
  _queue___queue = (uint64_t)dispatch_queue_create("com.apple.WatchListKit.WLKSettingsCloudUtilities", 0);

  return MEMORY[0x1F41817F8]();
}

void __61__WLKSettingsCloudUtilities__cloudSyncEnabledWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FA9C70] app];
  uint64_t v3 = [v2 cachedURLForKey:kBagKeyGetWatchListSettings];

  uint64_t v4 = [MEMORY[0x1E4FA9C70] app];
  uint64_t v5 = [v4 cachedURLForKey:kBagKeyUpdateWatchListSettings];

  if (v3) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = !v6;
  uint64_t v8 = WLKSystemLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v7;
    _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - Completed isCloudSyncEnabled fetch with enabled status=%d", (uint8_t *)v9, 8u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__WLKSettingsCloudUtilities_synchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.CloudSyncEnabled", "", v6, 2u);
  }

  uint64_t result = [*(id *)(a1 + 40) _shouldContinueWithCloudSyncResult:a2 onDisabledHandler:*(void *)(a1 + 32)];
  if (result) {
    return [*(id *)(a1 + 40) _runSynchronizeSettingsFromCloudIfNeededWithCompletion:*(void *)(a1 + 32)];
  }
  return result;
}

+ (BOOL)_shouldContinueWithCloudSyncResult:(BOOL)a3 onDisabledHandler:(id)a4
{
  if (a4 && !a3)
  {
    uint64_t v5 = (void (**)(id, void, void *))a4;
    BOOL v6 = WLKSystemLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1BA2E8000, v6, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - Cloud sync disabled.", v9, 2u);
    }

    int v7 = WLKError(201, 0, @"Cloud sync disabled");
    v5[2](v5, 0, v7);
  }
  return a3;
}

+ (void)_runSynchronizeSettingsFromCloudIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__WLKSettingsCloudUtilities__runSynchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke;
  v7[3] = &unk_1E620B060;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (void)_cloudSyncEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__WLKSettingsCloudUtilities__cloudSyncEnabledWithCompletion___block_invoke;
  block[3] = &unk_1E620A390;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

void __84__WLKSettingsCloudUtilities__runSynchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke_66(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained _queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __84__WLKSettingsCloudUtilities__runSynchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke_2;
    v7[3] = &unk_1E620A870;
    id v8 = a1[4];
    id v9 = a1[5];
    dispatch_async(v4, v7);
  }
  else
  {
    uint64_t v5 = (void (**)(id, void, void *))a1[5];
    id v6 = WLKError(-1, 0, @"Nil Self");
    v5[2](v5, 0, v6);
  }
}

+ (id)_queue
{
  if (_queue_onceToken != -1) {
    dispatch_once(&_queue_onceToken, &__block_literal_global_115);
  }
  v2 = (void *)_queue___queue;

  return v2;
}

+ (void)updateCloudStoreWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__WLKSettingsCloudUtilities_updateCloudStoreWithCompletion___block_invoke;
  v6[3] = &unk_1E620B088;
  id v7 = v4;
  id v8 = a1;
  id v5 = v4;
  [a1 _cloudSyncEnabledWithCompletion:v6];
}

void __60__WLKSettingsCloudUtilities_updateCloudStoreWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 40) _shouldContinueWithCloudSyncResult:a2 onDisabledHandler:*(void *)(a1 + 32)])
  {
    uint64_t v3 = [*(id *)(a1 + 40) _queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__WLKSettingsCloudUtilities_updateCloudStoreWithCompletion___block_invoke_2;
    block[3] = &unk_1E620B060;
    long long v5 = *(_OWORD *)(a1 + 32);
    id v4 = (id)v5;
    long long v7 = v5;
    dispatch_async(v3, block);
  }
}

void __60__WLKSettingsCloudUtilities_updateCloudStoreWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) _syncDictionaryForLocalStore];
  [*(id *)(a1 + 40) _postChangeDictionaryToCloud:v2 completion:*(void *)(a1 + 32)];
}

+ (void)updateCloudStoreAppSettings:(id)a3 deleteHistory:(BOOL)a4 completion:(id)a5
{
}

+ (void)updateCloudStoreAppSettings:(id)a3 deleteHistory:(BOOL)a4 removeEntry:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __94__WLKSettingsCloudUtilities_updateCloudStoreAppSettings_deleteHistory_removeEntry_completion___block_invoke;
  v14[3] = &unk_1E620B0B0;
  id v16 = v11;
  id v17 = a1;
  id v15 = v10;
  BOOL v18 = a4;
  BOOL v19 = a5;
  id v12 = v10;
  id v13 = v11;
  [a1 _cloudSyncEnabledWithCompletion:v14];
}

uint64_t __94__WLKSettingsCloudUtilities_updateCloudStoreAppSettings_deleteHistory_removeEntry_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 48) _shouldContinueWithCloudSyncResult:a2 onDisabledHandler:*(void *)(a1 + 40)];
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v4 = *(void **)(a1 + 48);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 57);
    uint64_t v8 = *(void *)(a1 + 32);
    return [v4 _runUpdateCloudStoreAppSettings:v8 deleteHistory:v6 removeEntry:v7 completion:v5];
  }
  return result;
}

+ (void)updateCloudStoreAccountLevelSetting:(id)a3 value:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__WLKSettingsCloudUtilities_updateCloudStoreAccountLevelSetting_value_completion___block_invoke;
  v14[3] = &unk_1E620B100;
  id v17 = v10;
  id v18 = a1;
  id v15 = v8;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [a1 _cloudSyncEnabledWithCompletion:v14];
}

void __82__WLKSettingsCloudUtilities_updateCloudStoreAccountLevelSetting_value_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 56) _shouldContinueWithCloudSyncResult:a2 onDisabledHandler:*(void *)(a1 + 48)])
  {
    uint64_t v3 = [*(id *)(a1 + 56) _queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__WLKSettingsCloudUtilities_updateCloudStoreAccountLevelSetting_value_completion___block_invoke_2;
    block[3] = &unk_1E620B0D8;
    id v7 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    long long v5 = *(_OWORD *)(a1 + 48);
    id v4 = (id)v5;
    long long v9 = v5;
    dispatch_async(v3, block);
  }
}

void __82__WLKSettingsCloudUtilities_updateCloudStoreAccountLevelSetting_value_completion___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [*(id *)(a1 + 56) _postChangeDictionaryToCloud:v3 completion:*(void *)(a1 + 48)];
}

+ (void)deleteAllHistoryWithCompletion:(id)a3
{
}

+ (void)forceUpdateWithCompletion:(id)a3
{
}

+ (void)resetAccountWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__WLKSettingsCloudUtilities_resetAccountWithCompletion___block_invoke;
  v6[3] = &unk_1E620B088;
  id v7 = v4;
  id v8 = a1;
  id v5 = v4;
  [a1 _cloudSyncEnabledWithCompletion:v6];
}

uint64_t __56__WLKSettingsCloudUtilities_resetAccountWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 40) _shouldContinueWithCloudSyncResult:a2 onDisabledHandler:*(void *)(a1 + 32)];
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    return [v4 _runResetAccountWithCompletion:v5];
  }
  return result;
}

+ (void)updateLocalStoreWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.CloudSync.CloudSyncEnabled", "", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__WLKSettingsCloudUtilities_updateLocalStoreWithCompletion___block_invoke;
  v7[3] = &unk_1E620B088;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  [a1 _cloudSyncEnabledWithCompletion:v7];
}

void __60__WLKSettingsCloudUtilities_updateLocalStoreWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.CloudSync.CloudSyncEnabled", "", buf, 2u);
  }

  if ([*(id *)(a1 + 40) _shouldContinueWithCloudSyncResult:a2 onDisabledHandler:*(void *)(a1 + 32)])
  {
    uint64_t v5 = [*(id *)(a1 + 40) _queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__WLKSettingsCloudUtilities_updateLocalStoreWithCompletion___block_invoke_54;
    block[3] = &unk_1E620B060;
    long long v7 = *(_OWORD *)(a1 + 32);
    id v6 = (id)v7;
    long long v9 = v7;
    dispatch_async(v5, block);
  }
}

void __60__WLKSettingsCloudUtilities_updateLocalStoreWithCompletion___block_invoke_54(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __60__WLKSettingsCloudUtilities_updateLocalStoreWithCompletion___block_invoke_2;
  v2[3] = &unk_1E620B128;
  v1 = *(void **)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  [v1 _fetchSyncDictionary:v2];
}

uint64_t __60__WLKSettingsCloudUtilities_updateLocalStoreWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  }
  return result;
}

+ (BOOL)synchronizeSettingsFromCloudIfNeeded:(id *)a3
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__3;
  id v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __66__WLKSettingsCloudUtilities_synchronizeSettingsFromCloudIfNeeded___block_invoke;
  v9[3] = &unk_1E620A240;
  id v11 = &v19;
  id v12 = &v13;
  id v6 = v5;
  id v10 = v6;
  [a1 synchronizeSettingsFromCloudIfNeededWithCompletion:v9];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  if (a3) {
    *a3 = (id) v14[5];
  }
  char v7 = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v7;
}

void __66__WLKSettingsCloudUtilities_synchronizeSettingsFromCloudIfNeeded___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)_runUpdateCloudStoreAppSettings:(id)a3 deleteHistory:(BOOL)a4 removeEntry:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [a1 _queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__WLKSettingsCloudUtilities__runUpdateCloudStoreAppSettings_deleteHistory_removeEntry_completion___block_invoke;
  v15[3] = &unk_1E620B150;
  id v17 = v11;
  id v18 = a1;
  BOOL v19 = a4;
  BOOL v20 = a5;
  id v16 = v10;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, v15);
}

void __98__WLKSettingsCloudUtilities__runUpdateCloudStoreAppSettings_deleteHistory_removeEntry_completion___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 48) _syncDictionaryForAppSettings:*(void *)(a1 + 32)];
  id v3 = (void *)[v2 mutableCopy];

  if (v3)
  {
    if (*(unsigned char *)(a1 + 56)) {
      [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"deleteHistory"];
    }
    if (*(unsigned char *)(a1 + 57)) {
      [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"removeEntry"];
    }
    long long v9 = v3;
    id v10 = @"watchListSettingsEntries";
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
    v11[0] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

    [*(id *)(a1 + 48) _postChangeDictionaryToCloud:v5 completion:*(void *)(a1 + 40)];
LABEL_11:

    goto LABEL_12;
  }
  if (*(void *)(a1 + 40))
  {
    id v6 = WLKSystemLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1BA2E8000, v6, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - Warning: app dictionary is nil.", v8, 2u);
    }

    uint64_t v7 = *(void *)(a1 + 40);
    id v5 = WLKError(200, 0, @"app dictionary is nil");
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v5);
    goto LABEL_11;
  }
LABEL_12:
}

+ (void)_runResetAccountWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__WLKSettingsCloudUtilities__runResetAccountWithCompletion___block_invoke;
  v7[3] = &unk_1E620B060;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__WLKSettingsCloudUtilities__runResetAccountWithCompletion___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = @"doResetAccount";
  v8[0] = MEMORY[0x1E4F1CC38];
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__WLKSettingsCloudUtilities__runResetAccountWithCompletion___block_invoke_2;
  v4[3] = &unk_1E620B178;
  id v6 = v3;
  id v5 = *(id *)(a1 + 32);
  [v3 _postChangeDictionaryToCloud:v2 completion:v4];
}

void __60__WLKSettingsCloudUtilities__runResetAccountWithCompletion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 40) deleteAllHistoryWithCompletion:*(void *)(a1 + 32)];
  }
  else
  {
    id v6 = WLKSystemLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __60__WLKSettingsCloudUtilities__runResetAccountWithCompletion___block_invoke_2_cold_1();
    }

    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v5);
    }
  }
}

void __84__WLKSettingsCloudUtilities__runSynchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke_73(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 description];
  }
  else
  {
    uint64_t v7 = &stru_1F13BCF18;
  }
  id v8 = WLKSystemLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"NO";
    if (a2) {
      id v9 = @"YES";
    }
    int v11 = 138412546;
    id v12 = v9;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - settings sync from cloud success: %@ %@", (uint8_t *)&v11, 0x16u);
  }

  id v10 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v10))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.CloudSync", "", (uint8_t *)&v11, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)_syncDictionaryForLocalStore
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = +[WLKSettingsStore sharedSettings];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = objc_msgSend(v5, "watchListApps", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = [a1 _syncDictionaryForAppSettings:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        if (v11) {
          [v4 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if ([v4 count]) {
    [v3 setObject:v4 forKeyedSubscript:@"watchListSettingsEntries"];
  }
  id v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "optedIn"));
  [v3 setObject:v12 forKeyedSubscript:@"isOptedIn"];

  __int16 v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "migratedtvOS"));
  [v3 setObject:v13 forKeyedSubscript:@"isTvOSMigrated"];

  id v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "migratediOS"));
  [v3 setObject:v14 forKeyedSubscript:@"isIOSMigrated"];

  return v3;
}

+ (id)_syncDictionaryForAppSettings:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [v3 channelID];
  if (v5) {
    [v4 setObject:v5 forKeyedSubscript:@"searchBrandId"];
  }
  id v6 = [v3 externalID];
  if ([v6 length]) {
    [v4 setObject:v6 forKeyedSubscript:@"externalAccountId"];
  }
  if ([v3 accessStatus] == 1)
  {
    uint64_t v7 = MEMORY[0x1E4F1CC38];
LABEL_9:
    [v4 setObject:v7 forKeyedSubscript:@"enabled"];
    goto LABEL_11;
  }
  if ([v3 accessStatus] == 2)
  {
    uint64_t v7 = MEMORY[0x1E4F1CC28];
    goto LABEL_9;
  }

  id v4 = 0;
LABEL_11:
  if ([v3 obsolete]) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"removeEntry"];
  }
  uint64_t v8 = (void *)[v4 copy];

  return v8;
}

+ (void)_fetchSyncDictionary:(id)a3
{
  id v3 = a3;
  if (WLKShouldRunInProcess())
  {
    id v4 = WLKSystemLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - Fetching settings in WLKProcess", (uint8_t *)buf, 2u);
    }

    id v5 = objc_alloc_init(WLKSettingsRequestOperation);
    objc_initWeak(buf, v5);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke;
    v16[3] = &unk_1E6209FD0;
    objc_copyWeak(&v18, buf);
    id v17 = v3;
    [(WLKSettingsRequestOperation *)v5 setCompletionBlock:v16];
    id v6 = [MEMORY[0x1E4F28F08] wlkDefaultConcurrentQueue];
    [v6 addOperation:v5];

    objc_destroyWeak(&v18);
    objc_destroyWeak(buf);
  }
  else
  {
    uint64_t v7 = [(id)objc_opt_class() _connection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke_92;
    v14[3] = &unk_1E620A438;
    uint64_t v8 = (WLKSettingsRequestOperation *)v3;
    uint64_t v15 = v8;
    uint64_t v9 = [v7 remoteObjectProxyWithErrorHandler:v14];

    id v10 = WLKStartupSignpostLogObject();
    if (os_signpost_enabled(v10))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.CloudSync.NetworkRequest", "", (uint8_t *)buf, 2u);
    }

    int v11 = WLKSystemLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1BA2E8000, v11, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - calling out to daemon to fetch settings", (uint8_t *)buf, 2u);
    }

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke_94;
    v12[3] = &unk_1E620B128;
    __int16 v13 = v8;
    [v9 fetchSettings:v12];

    id v5 = v15;
  }
}

void __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained error];

  if (v3)
  {
    id v4 = WLKSystemLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke_cold_1(WeakRetained, v4);
    }

    uint64_t v5 = *(void *)(v1 + 32);
    id v6 = [WeakRetained error];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
  }
  else
  {
    id v6 = [WeakRetained response];
    if (v6)
    {
      uint64_t v35 = v1;
      id v36 = WeakRetained;
      uint64_t v7 = +[WLKSettingsStore sharedSettings];
      [v7 beginIgnoringChanges];
      uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      v34 = v6;
      obuint64_t j = [v6 objectForKeyedSubscript:@"watchListSettingsEntries"];
      uint64_t v9 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v44 != v11) {
              objc_enumerationMutation(obj);
            }
            __int16 v13 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            id v14 = [v13 objectForKeyedSubscript:@"enabled"];
            int v15 = [v14 BOOLValue];

            long long v16 = [v13 objectForKeyedSubscript:@"searchBrandId"];
            if (v15) {
              uint64_t v17 = 1;
            }
            else {
              uint64_t v17 = 2;
            }
            id v18 = [v13 objectForKeyedSubscript:@"externalAccountId"];
            [v7 setStatus:v17 forChannelID:v16 externalID:v18];
            long long v19 = [v16 stringByAppendingFormat:@":%@", v18];
            [v8 addObject:v19];
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
        }
        while (v10);
      }

      BOOL v20 = [v7 watchListApps];
      uint64_t v21 = (void *)[v20 copy];

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id obja = v21;
      uint64_t v22 = [obja countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v40;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v40 != v24) {
              objc_enumerationMutation(obja);
            }
            v26 = *(void **)(*((void *)&v39 + 1) + 8 * j);
            v27 = [v26 channelID];
            v28 = [v26 externalID];
            v29 = [v27 stringByAppendingFormat:@":%@", v28];

            if (([v8 containsObject:v29] & 1) == 0) {
              [v7 _removeWatchListApp:v26];
            }
          }
          uint64_t v23 = [obja countByEnumeratingWithState:&v39 objects:v47 count:16];
        }
        while (v23);
      }

      id v6 = v34;
      v30 = [v34 objectForKeyedSubscript:@"isOptedIn"];
      objc_msgSend(v7, "setOptedIn:", objc_msgSend(v30, "BOOLValue"));

      v31 = [v34 objectForKeyedSubscript:@"isTvOSMigrated"];
      objc_msgSend(v7, "setMigratedtvOS:", objc_msgSend(v31, "BOOLValue"));

      v32 = [v34 objectForKeyedSubscript:@"isIOSMigrated"];
      objc_msgSend(v7, "setMigratediOS:", objc_msgSend(v32, "BOOLValue"));

      v33 = [MEMORY[0x1E4F1C9C8] date];
      [v7 setLastSyncDate:v33];

      [v7 endIgnoringChanges];
      uint64_t v1 = v35;
      id WeakRetained = v36;
    }
    (*(void (**)(void, void *, void))(*(void *)(v1 + 32) + 16))(*(void *)(v1 + 32), v6, 0);
  }
}

void __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke_92(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke_92_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke_94(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.CloudSync.NetworkRequest.Refresh", "", buf, 2u);
  }

  uint64_t v8 = +[WLKSettingsStore sharedSettings];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke_95;
  v12[3] = &unk_1E620B1C8;
  id v9 = *(id *)(a1 + 32);
  id v14 = v6;
  id v15 = v9;
  id v13 = v5;
  id v10 = v6;
  id v11 = v5;
  [v8 refreshWithCompletion:v12];
}

uint64_t __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke_95(void *a1)
{
  uint64_t v2 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.CloudSync.NetworkRequest.Refresh", "", buf, 2u);
  }

  id v3 = WLKSystemLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - WLKSettingsCloudUtilities - daemon callback for fetch settings", v7, 2u);
  }

  id v4 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch.SettingsSync.CloudSync.NetworkRequest", "", v6, 2u);
  }

  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

+ (void)_postChangeDictionaryToCloud:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  uint64_t v8 = objc_msgSend(v7, "ams_activeiTunesAccount");

  if (v8)
  {
    if (WLKShouldRunInProcess())
    {
      id v9 = +[WLKSettingsStore sharedSettings];
      id v10 = [v9 pushToken];

      if ([v10 length])
      {
        id v11 = (void *)[v5 mutableCopy];
        [v11 setObject:v10 forKeyedSubscript:@"fromPushToken"];
        uint64_t v12 = [v11 copy];

        id v5 = (id)v12;
      }
      id v13 = [[WLKSettingsModificationRequestOperation alloc] initWithModifications:v5];
      objc_initWeak(location, v13);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __69__WLKSettingsCloudUtilities__postChangeDictionaryToCloud_completion___block_invoke;
      v23[3] = &unk_1E6209FD0;
      objc_copyWeak(&v25, location);
      id v24 = v6;
      [(WLKSettingsModificationRequestOperation *)v13 setCompletionBlock:v23];
      id v14 = [MEMORY[0x1E4F28F08] wlkDefaultQueue];
      [v14 addOperation:v13];

      objc_destroyWeak(&v25);
      objc_destroyWeak(location);

      goto LABEL_8;
    }
    id v15 = [(id)objc_opt_class() _connection];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __69__WLKSettingsCloudUtilities__postChangeDictionaryToCloud_completion___block_invoke_2;
    v21[3] = &unk_1E620A438;
    id v16 = v6;
    id v22 = v16;
    uint64_t v17 = [v15 remoteObjectProxyWithErrorHandler:v21];

    id v18 = WLKSystemLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1BA2E8000, v18, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - calling out to daemon to post settings", (uint8_t *)location, 2u);
    }

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__WLKSettingsCloudUtilities__postChangeDictionaryToCloud_completion___block_invoke_101;
    v19[3] = &unk_1E620A368;
    id v20 = v16;
    [v17 postSettings:v5 replyHandler:v19];
  }
  else if (v6)
  {
    id v10 = WLKError(700, 0, @"Login required for this operation");
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v10);
LABEL_8:
  }
}

void __69__WLKSettingsCloudUtilities__postChangeDictionaryToCloud_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained error];
  id v4 = (void *)[v3 copy];

  id v5 = WLKSystemLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"NO";
    if (!v4) {
      id v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - Updated cloud settings success: %@", buf, 0xCu);
  }

  if (*(void *)(a1 + 32))
  {
    if (!v4)
    {
      uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v8 = WLKSystemLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v7;
        _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - Updating lastSyncToCloud date %@", buf, 0xCu);
      }

      id v9 = +[WLKSettingsStore sharedSettings];
      [v9 setLastSyncToCloudDate:v7];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__WLKSettingsCloudUtilities__postChangeDictionaryToCloud_completion___block_invoke_100;
    block[3] = &unk_1E620B1F0;
    id v12 = *(id *)(a1 + 32);
    BOOL v13 = v4 == 0;
    id v11 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __69__WLKSettingsCloudUtilities__postChangeDictionaryToCloud_completion___block_invoke_100(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __69__WLKSettingsCloudUtilities__postChangeDictionaryToCloud_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke_92_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __69__WLKSettingsCloudUtilities__postChangeDictionaryToCloud_completion___block_invoke_101(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = WLKSystemLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1BA2E8000, v6, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - daemon callback for post settings", v8, 2u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

+ (id)_connection
{
  id v3 = (void *)_connection___connection;
  if (!_connection___connection)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.watchlistd.xpc" options:0];
    id v5 = (void *)_connection___connection;
    _connection___connection = v4;

    id v6 = (void *)_connection___connection;
    uint64_t v7 = WLKConnectionClientInterface();
    [v6 setExportedInterface:v7];

    [(id)_connection___connection setExportedObject:a1];
    uint64_t v8 = (void *)_connection___connection;
    id v9 = WLKConnectionServerInterface();
    [v8 setRemoteObjectInterface:v9];

    [(id)_connection___connection setInterruptionHandler:&__block_literal_global_107_0];
    [(id)_connection___connection setInvalidationHandler:&__block_literal_global_110];
    [(id)_connection___connection resume];
    id v3 = (void *)_connection___connection;
  }

  return v3;
}

void __40__WLKSettingsCloudUtilities__connection__block_invoke()
{
  v0 = WLKSystemLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1BA2E8000, v0, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - Connection interrupted.", v1, 2u);
  }
}

void __40__WLKSettingsCloudUtilities__connection__block_invoke_108()
{
  v0 = +[WLKSettingsCloudUtilities _queue];
  dispatch_async(v0, &__block_literal_global_113);
}

void __40__WLKSettingsCloudUtilities__connection__block_invoke_2()
{
  v0 = WLKSystemLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_1BA2E8000, v0, OS_LOG_TYPE_DEFAULT, "WLKSettingsCloudUtilities - Connection invalidated.", v2, 2u);
  }

  uint64_t v1 = (void *)_connection___connection;
  _connection___connection = 0;
}

void __60__WLKSettingsCloudUtilities__runResetAccountWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BA2E8000, v0, v1, "WLKSettingsCloudUtilities - resetAccount failed, not attempting play history deletion. error: %@", v2, v3, v4, v5, v6);
}

void __84__WLKSettingsCloudUtilities__runSynchronizeSettingsFromCloudIfNeededWithCompletion___block_invoke_70_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BA2E8000, a1, a3, "WLKSettingsCloudUtilities - SettingStore maxAge configuration is nil, use default value=%lu", a5, a6, a7, a8, 0);
}

void __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 error];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BA2E8000, a2, OS_LOG_TYPE_ERROR, "WLKSettingsCloudUtilities - Failed to fetch settings with error: %@", v4, 0xCu);
}

void __50__WLKSettingsCloudUtilities__fetchSyncDictionary___block_invoke_92_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BA2E8000, v0, v1, "WLKSettingsCloudUtilities - Unable to communicate with the remote object proxy (%@)", v2, v3, v4, v5, v6);
}

@end