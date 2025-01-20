@interface WLKPostPlayAutoPlayManager
+ (id)defaultManager;
- (BOOL)_hasPreviousPreferenceAsDisableAutoPlay;
- (BOOL)isEnabledForType:(unint64_t)a3;
- (BOOL)isFetchingAllStatusInProgress;
- (BOOL)isMigrationInProgress;
- (NSMutableDictionary)ongoingUpdateOperations;
- (WLKPostPlayAutoPlayCache)cache;
- (WLKPostPlayAutoPlayManager)initWithCache:(id)a3;
- (void)_fetchStatusForType:(unint64_t)a3 withCompletion:(id)a4;
- (void)_handleAccountDidChange:(id)a3;
- (void)_migrateFromSystemPreferencesStoreOrSettingsStoreWithCompletion:(id)a3;
- (void)_migrateOffStatusWithCompletion:(id)a3;
- (void)_networkReachabilityDidChange:(id)a3;
- (void)_performUserSettingsAction:(unint64_t)a3 settings:(id)a4 dsid:(id)a5 isMigration:(BOOL)a6 completion:(id)a7;
- (void)_performUserSettingsOperation:(id)a3 dsid:(id)a4 completion:(id)a5;
- (void)fetchStatusForAllTypesWithCompletion:(id)a3;
- (void)getStatusForType:(unint64_t)a3 withCompletion:(id)a4;
- (void)setCache:(id)a3;
- (void)setIsFetchingAllStatusInProgress:(BOOL)a3;
- (void)setIsMigrationInProgress:(BOOL)a3;
- (void)setOngoingUpdateOperations:(id)a3;
- (void)setSettings:(id)a3 completion:(id)a4;
@end

@implementation WLKPostPlayAutoPlayManager

- (void)_networkReachabilityDidChange:(id)a3
{
  v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - _networkReachabilityDidChange", buf, 2u);
  }

  v5 = +[WLKReachabilityMonitor sharedInstance];
  int v6 = [v5 isNetworkReachable];

  if (v6)
  {
    v7 = WLKSystemLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - Device is back online.", v8, 2u);
    }

    [(WLKPostPlayAutoPlayManager *)self fetchStatusForAllTypesWithCompletion:0];
  }
}

- (void)fetchStatusForAllTypesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = WLKSystemLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - fetchStatusForAllTypesWithCompletion", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__WLKPostPlayAutoPlayManager_fetchStatusForAllTypesWithCompletion___block_invoke;
  block[3] = &unk_1E620B1A0;
  objc_copyWeak(&v10, buf);
  block[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

- (BOOL)_hasPreviousPreferenceAsDisableAutoPlay
{
  v2 = +[WLKSystemPreferencesStore sharedPreferences];
  v3 = +[WLKSettingsStore sharedSettings];
  if ([v2 hasPostPlayAutoPlayNextVideoPreferences])
  {
    id v4 = WLKSystemLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - Migrating post play auto-play from WLKSystemPreferencesStore", buf, 2u);
    }
    v5 = v2;
  }
  else
  {
    if (![v3 hasPostPlayAutoPlayNextVideoPreferences])
    {
      LOBYTE(v6) = 0;
      goto LABEL_11;
    }
    id v4 = WLKSystemLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - Migrating post play auto-play from WLKSettingsStore", v8, 2u);
    }
    v5 = v3;
  }

  int v6 = [v5 postPlayAutoPlayNextVideo] ^ 1;
LABEL_11:

  return v6;
}

void __67__WLKPostPlayAutoPlayManager_fetchStatusForAllTypesWithCompletion___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (![WeakRetained isFetchingAllStatusInProgress])
  {
    [WeakRetained setIsFetchingAllStatusInProgress:1];
    objc_initWeak(buf, WeakRetained);
    v5 = [WeakRetained cache];
    int v6 = [v5 isWaitingForConnection];

    if (v6)
    {
      id v7 = WLKSystemLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - Retry sending request for current settings.", v24, 2u);
      }

      if (![WeakRetained _hasPreviousPreferenceAsDisableAutoPlay])
      {
        v13 = [a1[4] cache];
        v14 = [v13 currentSettings];

        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __67__WLKPostPlayAutoPlayManager_fetchStatusForAllTypesWithCompletion___block_invoke_2;
        v18[3] = &unk_1E620B758;
        objc_copyWeak(&v20, buf);
        id v19 = a1[5];
        [WeakRetained _performUserSettingsAction:1 settings:v14 dsid:0 isMigration:0 completion:v18];

        objc_destroyWeak(&v20);
        goto LABEL_21;
      }
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __67__WLKPostPlayAutoPlayManager_fetchStatusForAllTypesWithCompletion___block_invoke_51;
      v21[3] = &unk_1E6209FD0;
      v8 = &v23;
      objc_copyWeak(&v23, buf);
      id v22 = a1[5];
      [WeakRetained _migrateFromSystemPreferencesStoreOrSettingsStoreWithCompletion:v21];
      id v9 = v22;
    }
    else
    {
      if ([WeakRetained isMigrationInProgress])
      {
        id v10 = WLKSystemLogObject();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_1BA2E8000, v10, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - There is ongoing migration. Skip the GET action", v24, 2u);
        }

        [WeakRetained setIsFetchingAllStatusInProgress:0];
        v11 = (void (**)(void))a1[5];
        if (v11) {
          v11[2]();
        }
        goto LABEL_21;
      }
      v12 = WLKSystemLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_1BA2E8000, v12, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - _performUserSettingsAction GET", v24, 2u);
      }

      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __67__WLKPostPlayAutoPlayManager_fetchStatusForAllTypesWithCompletion___block_invoke_52;
      v15[3] = &unk_1E620B758;
      v8 = &v17;
      objc_copyWeak(&v17, buf);
      id v16 = a1[5];
      [WeakRetained _performUserSettingsAction:0 settings:0 dsid:0 isMigration:0 completion:v15];
      id v9 = v16;
    }

    objc_destroyWeak(v8);
LABEL_21:
    objc_destroyWeak(buf);
    goto LABEL_22;
  }
  v3 = WLKSystemLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - There is ongoing fetchStatusForAllTypesWithCompletion. Skip this one.", (uint8_t *)buf, 2u);
  }

  id v4 = (void (**)(void))a1[5];
  if (v4) {
    v4[2]();
  }
LABEL_22:
}

- (BOOL)isFetchingAllStatusInProgress
{
  return self->_isFetchingAllStatusInProgress;
}

void __94__WLKPostPlayAutoPlayManager__performUserSettingsAction_settings_dsid_isMigration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v6)
  {
    if ([v6 code] == -1009 && *(void *)(a1 + 56) == 1 && *(unsigned char *)(a1 + 64))
    {
      v8 = WLKSystemLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v19 = 0;
        _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - No internet connection. Retry later when device is back online", v19, 2u);
      }

      id v9 = [WeakRetained cache];
      [v9 setIsWaitingForConnection:1];
    }
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 56);
      if (v11 != 1)
      {
        if (!v11)
        {
          v12 = [WeakRetained cache];
          v13 = [v12 currentSettings];

          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
        goto LABEL_21;
      }
      v18 = *(void (**)(void))(v10 + 16);
LABEL_20:
      v18();
    }
  }
  else if (*(void *)(a1 + 56) <= 1uLL)
  {
    if (v5 && *(unsigned char *)(a1 + 64))
    {
      uint64_t v14 = [v5 postPlayAutoPlaySettings];
      if (!v14) {
        __94__WLKPostPlayAutoPlayManager__performUserSettingsAction_settings_dsid_isMigration_completion___block_invoke_cold_1();
      }
      v15 = (void *)v14;
      id v16 = [WeakRetained cache];
      [v16 updateWithSettings:v15];
    }
    uint64_t v17 = *(void *)(a1 + 40);
    if (v17)
    {
      v18 = *(void (**)(void))(v17 + 16);
      goto LABEL_20;
    }
  }
LABEL_21:
}

- (WLKPostPlayAutoPlayCache)cache
{
  return self->_cache;
}

void __94__WLKPostPlayAutoPlayManager__migrateFromSystemPreferencesStoreOrSettingsStoreWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained isMigrationInProgress])
  {
    v3 = WLKSystemLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - Migration is in progress, ignoring this call _migrateFromSystemPreferencesStoreOrSettingsStore.", (uint8_t *)buf, 2u);
    }
  }
  else if ([WeakRetained _hasPreviousPreferenceAsDisableAutoPlay])
  {
    [WeakRetained setIsMigrationInProgress:1];
    objc_initWeak(buf, WeakRetained);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __94__WLKPostPlayAutoPlayManager__migrateFromSystemPreferencesStoreOrSettingsStoreWithCompletion___block_invoke_2;
    v5[3] = &unk_1E620B780;
    objc_copyWeak(&v7, buf);
    id v6 = *(id *)(a1 + 32);
    [WeakRetained _migrateOffStatusWithCompletion:v5];

    objc_destroyWeak(&v7);
    objc_destroyWeak(buf);
    goto LABEL_9;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
LABEL_9:
}

- (BOOL)isMigrationInProgress
{
  return self->_isMigrationInProgress;
}

void __67__WLKPostPlayAutoPlayManager_fetchStatusForAllTypesWithCompletion___block_invoke_52(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setIsFetchingAllStatusInProgress:0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

- (void)setIsFetchingAllStatusInProgress:(BOOL)a3
{
  self->_isFetchingAllStatusInProgress = a3;
}

- (void)_performUserSettingsAction:(unint64_t)a3 settings:(id)a4 dsid:(id)a5 isMigration:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v36 = 0;
  char v15 = WLKPostPlayAutoPlayCheckHasActiveAccount(&v36);
  id v16 = v36;
  if (v15)
  {
    uint64_t v17 = [[WLKUserSettings alloc] initWithPostPlayAutoPlaySettings:v12];
    v18 = [[WLKUserSettingsRequestOperation alloc] initWithAction:a3 userSettings:v17 dsid:v13 isMigration:v8];
    v29 = v17;
    if (v13)
    {
      id v19 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      id v20 = objc_msgSend(v19, "ams_activeiTunesAccount");

      if (v20
        && (objc_msgSend(v20, "ams_DSID"),
            v21 = objc_claimAutoreleasedReturnValue(),
            [v21 stringValue],
            id v22 = objc_claimAutoreleasedReturnValue(),
            v21,
            v22))
      {
        [v13 stringValue];
        id v23 = v28 = v18;
        int v24 = [v22 isEqualToString:v23];

        v18 = v28;
      }
      else
      {
        int v24 = 0;
      }
    }
    else
    {
      int v24 = 1;
    }
    if (a3 == 1 && v24)
    {
      v26 = [(WLKPostPlayAutoPlayManager *)self cache];
      [v26 setIsWaitingForConnection:0];

      v27 = [(WLKPostPlayAutoPlayManager *)self cache];
      [v27 updateWithSettings:v12];
    }
    objc_initWeak(&location, self);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __94__WLKPostPlayAutoPlayManager__performUserSettingsAction_settings_dsid_isMigration_completion___block_invoke;
    v30[3] = &unk_1E620B7F8;
    objc_copyWeak(v33, &location);
    v33[1] = (id)a3;
    char v34 = v24;
    id v32 = v14;
    id v31 = v12;
    [(WLKPostPlayAutoPlayManager *)self _performUserSettingsOperation:v18 dsid:v13 completion:v30];

    objc_destroyWeak(v33);
    objc_destroyWeak(&location);
  }
  else
  {
    v25 = WLKSystemLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[WLKPostPlayAutoPlayManager getStatusForType:withCompletion:]();
    }

    if (v14) {
      (*((void (**)(id, void, id))v14 + 2))(v14, 0, v16);
    }
  }
}

- (void)_performUserSettingsOperation:(id)a3 dsid:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__WLKPostPlayAutoPlayManager__performUserSettingsOperation_dsid_completion___block_invoke;
  v15[3] = &unk_1E620B848;
  objc_copyWeak(&v20, &location);
  id v16 = v8;
  id v17 = v9;
  v18 = self;
  id v19 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (WLKPostPlayAutoPlayManager)initWithCache:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WLKPostPlayAutoPlayManager;
  id v6 = [(WLKPostPlayAutoPlayManager *)&v16 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cache, a3);
    dispatch_queue_t v8 = dispatch_queue_create("WLKPostPlayAutoPlayManagerPersistentCacheQueue", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    ongoingUpdateOperations = v7->_ongoingUpdateOperations;
    v7->_ongoingUpdateOperations = v10;

    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v7 selector:sel__handleAccountDidChange_ name:@"WLKAccountMonitorAccountDidChange" object:0];

    id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v14 = +[WLKReachabilityMonitor sharedInstance];
    [v13 addObserver:v7 selector:sel__networkReachabilityDidChange_ name:@"WLKReachabilityMonitorReachabilityDidChange" object:v14];

    [(WLKPostPlayAutoPlayManager *)v7 _migrateFromSystemPreferencesStoreOrSettingsStoreWithCompletion:0];
  }

  return v7;
}

- (void)_migrateFromSystemPreferencesStoreOrSettingsStoreWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = WLKSystemLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - _migrateFromSystemPreferencesStoreOrSettingsStoreWithCompletion", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__WLKPostPlayAutoPlayManager__migrateFromSystemPreferencesStoreOrSettingsStoreWithCompletion___block_invoke;
  v8[3] = &unk_1E6209FD0;
  objc_copyWeak(&v10, buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

void __76__WLKPostPlayAutoPlayManager__performUserSettingsOperation_dsid_completion___block_invoke_64(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = [WeakRetained error];
  id v4 = WLKSystemLogObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      id v6 = [v3 localizedDescription];
      *(_DWORD *)buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2048;
      uint64_t v19 = [WeakRetained action];
      _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - Post play auto-play (user settings) action failed -- %@. Request -- %lu", buf, 0x16u);
    }
    uint64_t v7 = *(void *)(a1 + 48);
    dispatch_queue_t v8 = [WeakRetained response];
    (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v8, v3);
  }
  else
  {
    if (v5)
    {
      id v9 = [0 localizedDescription];
      *(_DWORD *)buf = 138412546;
      id v17 = v9;
      __int16 v18 = 2048;
      uint64_t v19 = [WeakRetained action];
      _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - Post play auto-play (user settings) action succeeded -- %@. Request -- %lu", buf, 0x16u);
    }
    uint64_t v10 = *(void *)(a1 + 48);
    dispatch_queue_t v8 = [WeakRetained response];
    (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v8, 0);
  }

  id v11 = objc_loadWeakRetained((id *)(a1 + 64));
  id v12 = v11;
  if (*(unsigned char *)(a1 + 72))
  {
    id v13 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76__WLKPostPlayAutoPlayManager__performUserSettingsOperation_dsid_completion___block_invoke_65;
    v14[3] = &unk_1E6209F68;
    v14[4] = v11;
    id v15 = *(id *)(a1 + 40);
    dispatch_async(v13, v14);
  }
}

void __76__WLKPostPlayAutoPlayManager__performUserSettingsOperation_dsid_completion___block_invoke(uint64_t a1)
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if ([*(id *)(a1 + 32) action] != 1
    || ([*(id *)(a1 + 32) userSettings],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = [*(id *)(a1 + 32) userSettings];
    v27 = [v4 postPlayAutoPlaySettings];

    uint64_t v5 = [*(id *)(a1 + 32) action];
    id v6 = (WLKUserSettingsRequestOperation *)*(id *)(a1 + 32);
    uint64_t v7 = *(void **)(a1 + 40);
    if (!v7) {
      uint64_t v7 = &unk_1F13D9890;
    }
    id v8 = v7;
    if (v5 == 1)
    {
      id v9 = [WeakRetained ongoingUpdateOperations];
      uint64_t v10 = [v9 objectForKey:v8];

      if (v10 && ([v10 isCancelled] & 1) == 0)
      {
        objc_super v16 = WLKSystemLogObject();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(location[0]) = 0;
          _os_log_impl(&dword_1BA2E8000, v16, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - There is ongoing operation.", (uint8_t *)location, 2u);
        }

        id v17 = [v10 userSettings];
        __int16 v18 = [v17 postPlayAutoPlaySettings];

        int v19 = [v18 isEqual:v27];
        uint64_t v20 = WLKSystemLogObject();
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        if (v19)
        {
          if (v21)
          {
            LOWORD(location[0]) = 0;
            _os_log_impl(&dword_1BA2E8000, v20, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - The ongoing operation has the same settings, skipping the latest one.", (uint8_t *)location, 2u);
          }

          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          goto LABEL_12;
        }
        if (v21)
        {
          LOWORD(location[0]) = 0;
          _os_log_impl(&dword_1BA2E8000, v20, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - The ongoing operation has different settings, cancel the ongoing operation.", (uint8_t *)location, 2u);
        }

        [v10 cancel];
        id v22 = [WeakRetained ongoingUpdateOperations];
        [v22 removeObjectForKey:v8];

        v26 = (void *)[v27 _newSettingsMergedWithPreviousSettings:v18];
        id v23 = WLKSystemLogObject();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v26;
          _os_log_impl(&dword_1BA2E8000, v23, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - New settings: %@", (uint8_t *)location, 0xCu);
        }

        int v24 = [[WLKUserSettings alloc] initWithPostPlayAutoPlaySettings:v26];
        v25 = -[WLKUserSettingsRequestOperation initWithAction:userSettings:]([WLKUserSettingsRequestOperation alloc], "initWithAction:userSettings:", [*(id *)(a1 + 32) action], v24);

        id v6 = v25;
      }
      else
      {
      }
    }
    objc_initWeak(location, v6);
    objc_initWeak(&from, WeakRetained);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __76__WLKPostPlayAutoPlayManager__performUserSettingsOperation_dsid_completion___block_invoke_64;
    v28[3] = &unk_1E620B820;
    objc_copyWeak(&v31, location);
    id v30 = *(id *)(a1 + 56);
    objc_copyWeak(&v32, &from);
    BOOL v33 = v5 == 1;
    v28[4] = *(void *)(a1 + 48);
    id v11 = v8;
    id v29 = v11;
    [(WLKUserSettingsRequestOperation *)v6 setCompletionBlock:v28];
    if (v5 == 1)
    {
      id v12 = [WeakRetained ongoingUpdateOperations];
      [v12 setObject:v6 forKey:v11];
    }
    id v13 = [MEMORY[0x1E4F28F08] wlkDefaultQueue];
    [v13 addOperation:v6];

    objc_destroyWeak(&v32);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
LABEL_12:

    goto LABEL_13;
  }
  id v14 = WLKSystemLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_impl(&dword_1BA2E8000, v14, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - Post play auto-play (user settings) action will not be executed -- empty userSettings parameter.", (uint8_t *)location, 2u);
  }

  uint64_t v15 = *(void *)(a1 + 56);
  v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WLKPostPlayAutoPlayErrorDomain" code:-1 userInfo:0];
  (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v27);
LABEL_13:
}

+ (id)defaultManager
{
  if (defaultManager___once != -1) {
    dispatch_once(&defaultManager___once, &__block_literal_global_38);
  }
  uint64_t v2 = (void *)defaultManager___defaultManager;

  return v2;
}

void __44__WLKPostPlayAutoPlayManager_defaultManager__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [[WLKPostPlayAutoPlayCache alloc] initWithUserDefaults:v3];
  v1 = [[WLKPostPlayAutoPlayManager alloc] initWithCache:v0];
  uint64_t v2 = (void *)defaultManager___defaultManager;
  defaultManager___defaultManager = (uint64_t)v1;
}

- (BOOL)isEnabledForType:(unint64_t)a3
{
  id v4 = [(WLKPostPlayAutoPlayManager *)self cache];
  LOBYTE(a3) = [v4 currentSettingForType:a3];

  return a3;
}

- (void)getStatusForType:(unint64_t)a3 withCompletion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, uint64_t, void))a4;
  id v18 = 0;
  char v7 = WLKPostPlayAutoPlayCheckHasActiveAccount(&v18);
  id v8 = v18;
  if (v7)
  {
    id v9 = [(WLKPostPlayAutoPlayManager *)self cache];
    int v10 = [v9 hasCacheForType:a3];

    if (v10)
    {
      id v11 = [(WLKPostPlayAutoPlayManager *)self cache];
      uint64_t v12 = [v11 currentSettingForType:a3];

      id v13 = WLKSystemLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [NSNumber numberWithUnsignedInteger:a3];
        *(_DWORD *)buf = 138412546;
        uint64_t v20 = v14;
        __int16 v21 = 1024;
        int v22 = v12;
        _os_log_impl(&dword_1BA2E8000, v13, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - getStatusForType: %@, replied with cached state: %d", buf, 0x12u);
      }
      if (v6) {
        v6[2](v6, v12, 0);
      }
    }
    else
    {
      objc_super v16 = WLKSystemLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [NSNumber numberWithUnsignedInteger:a3];
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v17;
        _os_log_impl(&dword_1BA2E8000, v16, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - getStatusForType: %@, no cache found.", buf, 0xCu);
      }
      [(WLKPostPlayAutoPlayManager *)self _fetchStatusForType:a3 withCompletion:v6];
    }
  }
  else
  {
    uint64_t v15 = WLKSystemLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[WLKPostPlayAutoPlayManager getStatusForType:withCompletion:]();
    }

    if (v6) {
      ((void (**)(id, uint64_t, id))v6)[2](v6, 1, v8);
    }
  }
}

- (void)setSettings:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v15 = 0;
  char v8 = WLKPostPlayAutoPlayCheckHasActiveAccount(&v15);
  id v9 = v15;
  int v10 = WLKSystemLogObject();
  id v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_1BA2E8000, v11, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - setSettings: %@", buf, 0xCu);
    }

    if ([v6 _hasValues])
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __53__WLKPostPlayAutoPlayManager_setSettings_completion___block_invoke;
      v13[3] = &unk_1E620B730;
      id v14 = v7;
      [(WLKPostPlayAutoPlayManager *)self _performUserSettingsAction:1 settings:v6 dsid:0 isMigration:0 completion:v13];
    }
    else
    {
      uint64_t v12 = WLKSystemLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BA2E8000, v12, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - Nothing to update since settings has no values set", buf, 2u);
      }

      if (v7) {
        (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WLKPostPlayAutoPlayManager getStatusForType:withCompletion:]();
    }

    if (v7) {
      (*((void (**)(id, void, id))v7 + 2))(v7, 0, v9);
    }
  }
}

uint64_t __53__WLKPostPlayAutoPlayManager_setSettings_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __67__WLKPostPlayAutoPlayManager_fetchStatusForAllTypesWithCompletion___block_invoke_51(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setIsFetchingAllStatusInProgress:0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

void __67__WLKPostPlayAutoPlayManager_fetchStatusForAllTypesWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setIsFetchingAllStatusInProgress:0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

- (void)_migrateOffStatusWithCompletion:(id)a3
{
  id v4 = a3;
  id v14 = 0;
  char v5 = WLKPostPlayAutoPlayCheckHasActiveAccount(&v14);
  id v6 = v14;
  id v7 = WLKSystemLogObject();
  char v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - _migrateOffStatusWithCompletion", buf, 2u);
    }

    id v9 = objc_alloc_init(WLKPostPlayAutoPlaySettings);
    uint64_t v10 = MEMORY[0x1E4F1CC28];
    [(WLKPostPlayAutoPlaySettings *)v9 setNextEpisodeSettingValue:MEMORY[0x1E4F1CC28]];
    [(WLKPostPlayAutoPlaySettings *)v9 setRecommendedItemsSettingValue:v10];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__WLKPostPlayAutoPlayManager__migrateOffStatusWithCompletion___block_invoke;
    v11[3] = &unk_1E620B730;
    id v12 = v4;
    [(WLKPostPlayAutoPlayManager *)self _performUserSettingsAction:1 settings:v9 dsid:0 isMigration:1 completion:v11];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[WLKPostPlayAutoPlayManager getStatusForType:withCompletion:]();
    }

    if (v4) {
      (*((void (**)(id, id))v4 + 2))(v4, v6);
    }
  }
}

uint64_t __62__WLKPostPlayAutoPlayManager__migrateOffStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

void __94__WLKPostPlayAutoPlayManager__migrateFromSystemPreferencesStoreOrSettingsStoreWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (!v7)
  {
    id v3 = +[WLKSystemPreferencesStore sharedPreferences];
    [v3 removePostPlayAutoPlayNextVideoPreferences];
    id v4 = +[WLKSettingsStore sharedSettings];
    [v4 removePostPlayAutoPlayNextVideoPreferences];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setIsMigrationInProgress:0];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

- (void)_handleAccountDidChange:(id)a3
{
  id v4 = WLKSystemLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v5 = 0;
    _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - Invalidate cache due to _handleAccountDidChange", v5, 2u);
  }

  [(WLKPostPlayAutoPlayCache *)self->_cache invalidate];
  [(WLKPostPlayAutoPlayManager *)self fetchStatusForAllTypesWithCompletion:0];
}

- (void)_fetchStatusForType:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v15 = 0;
  char v7 = WLKPostPlayAutoPlayCheckHasActiveAccount(&v15);
  id v8 = v15;
  if (v7)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__WLKPostPlayAutoPlayManager__fetchStatusForType_withCompletion___block_invoke;
    block[3] = &unk_1E620B7D0;
    objc_copyWeak(v13, &location);
    v13[1] = (id)a3;
    id v12 = v6;
    dispatch_async(queue, block);

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v10 = WLKSystemLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WLKPostPlayAutoPlayManager getStatusForType:withCompletion:]();
    }

    if (v6) {
      (*((void (**)(id, uint64_t, id))v6 + 2))(v6, 1, v8);
    }
  }
}

void __65__WLKPostPlayAutoPlayManager__fetchStatusForType_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained isMigrationInProgress])
  {
    id v3 = [WeakRetained cache];
    uint64_t v4 = [v3 currentSettingForType:*(void *)(a1 + 48)];

    char v5 = WLKSystemLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v14) = v4;
      _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - fetchStatus replied with cached state because there is ongoing migration: %d", buf, 8u);
    }

    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(uint64_t, uint64_t, void))(v6 + 16))(v6, v4, 0);
    }
  }
  else
  {
    objc_initWeak(&location, WeakRetained);
    char v7 = WLKSystemLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - fetchStatusForType: %@", buf, 0xCu);
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__WLKPostPlayAutoPlayManager__fetchStatusForType_withCompletion___block_invoke_56;
    v9[3] = &unk_1E620B7A8;
    objc_copyWeak(v11, &location);
    v11[1] = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 32);
    [WeakRetained _performUserSettingsAction:0 settings:0 dsid:0 isMigration:0 completion:v9];

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
}

void __65__WLKPostPlayAutoPlayManager__fetchStatusForType_withCompletion___block_invoke_56(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = [WeakRetained cache];
  uint64_t v7 = [v6 currentSettingForType:*(void *)(a1 + 48)];

  id v8 = WLKSystemLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v4 localizedDescription];
    v11[0] = 67109378;
    v11[1] = v7;
    __int16 v12 = 2112;
    id v13 = v9;
    _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, "WLKPostPlayAutoPlay - fetchStatus replied with fresh state: %d, error: %@", (uint8_t *)v11, 0x12u);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, v7, v4);
  }
}

void __76__WLKPostPlayAutoPlayManager__performUserSettingsOperation_dsid_completion___block_invoke_65(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) ongoingUpdateOperations];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)setCache:(id)a3
{
}

- (void)setIsMigrationInProgress:(BOOL)a3
{
  self->_isMigrationInProgress = a3;
}

- (NSMutableDictionary)ongoingUpdateOperations
{
  return self->_ongoingUpdateOperations;
}

- (void)setOngoingUpdateOperations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ongoingUpdateOperations, 0);
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)getStatusForType:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BA2E8000, v0, v1, "WLKPostPlayAutoPlay - User is not signed in, returning early with error %@", v2, v3, v4, v5, v6);
}

void __94__WLKPostPlayAutoPlayManager__performUserSettingsAction_settings_dsid_isMigration_completion___block_invoke_cold_1()
{
  __assert_rtn("-[WLKPostPlayAutoPlayManager _performUserSettingsAction:settings:dsid:isMigration:completion:]_block_invoke", "WLKPostPlayAutoPlayManager.m", 587, "newSettings != nil");
}

@end