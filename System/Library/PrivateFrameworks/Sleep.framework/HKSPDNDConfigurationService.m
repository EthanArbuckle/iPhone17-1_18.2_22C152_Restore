@interface HKSPDNDConfigurationService
+ (BOOL)_readGlobalConfigForOptions:(unint64_t)a3;
+ (id)sleepFocusConfigurationService;
+ (id)sleepFocusConfigurationServiceWithOptions:(unint64_t)a3;
- (BOOL)_cacheSleepFocusConfig;
- (BOOL)_lock_updateCachedSleepFocusConfig:(id)a3 updatedSleepFocusConfig:(id)a4;
- (BOOL)_readGlobalConfig;
- (BOOL)_uncachedMirrorsFocusModes:(id *)a3;
- (BOOL)hasSleepFocusMode:(id *)a3;
- (DNDGlobalConfigurationService)globalConfigService;
- (DNDModeConfigurationService)modeConfigService;
- (HKSPDNDConfigurationService)initWithModeConfigService:(id)a3 globalConfigService:(id)a4;
- (HKSPDNDConfigurationService)initWithModeConfigService:(id)a3 globalConfigService:(id)a4 options:(unint64_t)a5;
- (HKSPSleepFocusModeBridgeDelegate)delegate;
- (id)_sleepFocusConfiguration:(id *)a3 checkCache:(BOOL)a4;
- (id)_uncachedModeConfiguration:(id *)a3;
- (id)sleepFocusConfiguration:(id *)a3;
- (unint64_t)options;
- (void)_checkForUpdatedSleepFocusConfig;
- (void)_fetchUpdatedSleepFocusConfigurationWithCompletion:(id)a3;
- (void)_loadCachedSleepFocusConfig;
- (void)_notifyDelegate;
- (void)_startListeningToGlobalConfigService;
- (void)_startListeningToModeConfigService;
- (void)_stopListeningToGlobalConfigService;
- (void)_stopListeningToModeConfigService;
- (void)_updateCacheAndNotifyWithBlock:(id)a3;
- (void)_updateCachedSleepFocusConfig:(id)a3;
- (void)_withLock:(id)a3;
- (void)globalConfigurationService:(id)a3 didReceiveUpdatedPairSyncState:(unint64_t)a4;
- (void)invalidate;
- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4;
- (void)setDelegate:(id)a3;
- (void)updateCachedMirrorsFocusModes:(BOOL)a3;
- (void)updateCachedUUID:(id)a3 state:(unint64_t)a4;
@end

@implementation HKSPDNDConfigurationService

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  if (a3)
  {
    [(HKSPDNDConfigurationService *)self _startListeningToModeConfigService];
    [(HKSPDNDConfigurationService *)self _startListeningToGlobalConfigService];
  }
  else
  {
    [(HKSPDNDConfigurationService *)self _stopListeningToModeConfigService];
    [(HKSPDNDConfigurationService *)self _stopListeningToGlobalConfigService];
  }
  [(HKSPDNDConfigurationService *)self _checkForUpdatedSleepFocusConfig];
}

- (id)sleepFocusConfiguration:(id *)a3
{
  BOOL v5 = [(HKSPDNDConfigurationService *)self _cacheSleepFocusConfig];
  return [(HKSPDNDConfigurationService *)self _sleepFocusConfiguration:a3 checkCache:v5];
}

- (BOOL)_cacheSleepFocusConfig
{
  return self->_options & 1;
}

- (void)_startListeningToModeConfigService
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = HKSPLogForCategory(0x13uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = self;
    _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Start listening for mode config updates.", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v4 = [(HKSPDNDConfigurationService *)self modeConfigService];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__HKSPDNDConfigurationService__startListeningToModeConfigService__block_invoke;
  v5[3] = &unk_1E5D31F30;
  objc_copyWeak(&v6, (id *)buf);
  [v4 addListener:self withCompletionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

- (id)_sleepFocusConfiguration:(id *)a3 checkCache:(BOOL)a4
{
  if (a4)
  {
    if (self)
    {
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__4;
      v26 = __Block_byref_object_dispose__4;
      id v27 = 0;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __60__HKSPDNDConfigurationService_cachedSleepFocusConfiguration__block_invoke;
      v21[3] = &unk_1E5D320F8;
      v21[4] = self;
      v21[5] = &v22;
      [(HKSPDNDConfigurationService *)self _withLock:v21];
      BOOL v5 = (HKSPSleepFocusConfiguration *)(id)v23[5];
      _Block_object_dispose(&v22, 8);
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    id v20 = 0;
    v7 = [(HKSPDNDConfigurationService *)self _uncachedModeConfiguration:&v20];
    id v8 = v20;
    uint64_t v9 = objc_msgSend(v7, "hksp_configurationState");
    id v19 = 0;
    BOOL v10 = [(HKSPDNDConfigurationService *)self _uncachedMirrorsFocusModes:&v19];
    id v11 = v19;
    v12 = v11;
    if (v8) {
      v13 = v8;
    }
    else {
      v13 = v11;
    }
    id v14 = v13;
    if (v14)
    {
      if (a3) {
        *a3 = v14;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v15 = [HKSPSleepFocusConfiguration alloc];
    v16 = [v7 mode];
    v17 = [v16 identifier];
    BOOL v5 = [(HKSPSleepFocusConfiguration *)v15 initWithUUID:v17 mirrorsFocusModes:v10 state:v9];
  }
  return v5;
}

- (id)_uncachedModeConfiguration:(id *)a3
{
  v4 = [(HKSPDNDConfigurationService *)self modeConfigService];
  BOOL v5 = [v4 modeConfigurationForModeIdentifier:@"com.apple.sleep.sleep-mode" error:a3];

  return v5;
}

- (DNDModeConfigurationService)modeConfigService
{
  return self->_modeConfigService;
}

+ (id)sleepFocusConfigurationServiceWithOptions:(unint64_t)a3
{
  BOOL v5 = [MEMORY[0x1E4F5F690] serviceForClientIdentifier:@"com.apple.sleep.sleep-mode"];
  if ([a1 _readGlobalConfigForOptions:a3])
  {
    id v6 = [MEMORY[0x1E4F5F5E0] serviceForClientIdentifier:@"com.apple.sleep.sleep-mode"];
  }
  else
  {
    id v6 = 0;
  }
  v7 = [[HKSPDNDConfigurationService alloc] initWithModeConfigService:v5 globalConfigService:v6 options:a3];

  return v7;
}

- (HKSPDNDConfigurationService)initWithModeConfigService:(id)a3 globalConfigService:(id)a4 options:(unint64_t)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HKSPDNDConfigurationService;
  id v11 = [(HKSPDNDConfigurationService *)&v19 init];
  if (v11)
  {
    v12 = HKSPLogForCategory(0x13uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v21 = v13;
      __int16 v22 = 2048;
      v23 = v11;
      id v14 = v13;
      _os_log_impl(&dword_1A7E74000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);
    }
    objc_storeStrong((id *)&v11->_modeConfigService, a3);
    objc_storeStrong((id *)&v11->_globalConfigService, a4);
    uint64_t v15 = [MEMORY[0x1E4F7A0F0] serialDispatchQueueSchedulerWithName:@"com.apple.HKSPDNDConfigurationService.serial"];
    dndScheduler = v11->_dndScheduler;
    v11->_dndScheduler = (NAScheduler *)v15;

    v11->_options = a5;
    v11->_cacheLock._os_unfair_lock_opaque = 0;
    [(HKSPDNDConfigurationService *)v11 _loadCachedSleepFocusConfig];
    v17 = v11;
  }

  return v11;
}

- (void)_startListeningToGlobalConfigService
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(HKSPDNDConfigurationService *)self _readGlobalConfig])
  {
    v3 = HKSPLogForCategory(0x13uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v8 = self;
      _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Start listening for global config updates.", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v4 = [(HKSPDNDConfigurationService *)self globalConfigService];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __67__HKSPDNDConfigurationService__startListeningToGlobalConfigService__block_invoke;
    v5[3] = &unk_1E5D31F30;
    objc_copyWeak(&v6, (id *)buf);
    [v4 addListener:self withCompletionHandler:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }
}

- (BOOL)_uncachedMirrorsFocusModes:(id *)a3
{
  if ([(HKSPDNDConfigurationService *)self _readGlobalConfig])
  {
    BOOL v5 = [(HKSPDNDConfigurationService *)self globalConfigService];
    unint64_t v6 = ((unint64_t)[v5 getPairSyncStateReturningError:a3] >> 2) & 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

+ (BOOL)_readGlobalConfigForOptions:(unint64_t)a3
{
  return (a3 >> 1) & 1;
}

- (BOOL)_readGlobalConfig
{
  v3 = objc_opt_class();
  unint64_t options = self->_options;
  return [v3 _readGlobalConfigForOptions:options];
}

- (void)_loadCachedSleepFocusConfig
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(HKSPDNDConfigurationService *)self _cacheSleepFocusConfig])
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "hksp_sleepdUserDefaults");
    v4 = +[HKSPSleepFocusConfiguration readFromDefaults:v3];

    BOOL v5 = HKSPLogForCategory(0x13uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v14 = self;
      __int16 v15 = 2114;
      v16 = v4;
      _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Loaded cached sleep focus config: %{public}@", buf, 0x16u);
    }

    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    uint64_t v9 = __58__HKSPDNDConfigurationService__loadCachedSleepFocusConfig__block_invoke;
    id v10 = &unk_1E5D31AA8;
    id v11 = self;
    id v12 = v4;
    id v6 = v4;
    [(HKSPDNDConfigurationService *)self _withLock:&v7];
    [(HKSPDNDConfigurationService *)self _checkForUpdatedSleepFocusConfig];
  }
}

- (void)_checkForUpdatedSleepFocusConfig
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(HKSPDNDConfigurationService *)self _cacheSleepFocusConfig])
  {
    v3 = HKSPLogForCategory(0x13uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v6 = self;
      _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Checking if sleep focus config has changed...", buf, 0xCu);
    }

    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __63__HKSPDNDConfigurationService__checkForUpdatedSleepFocusConfig__block_invoke;
    v4[3] = &unk_1E5D33518;
    v4[4] = self;
    [(HKSPDNDConfigurationService *)self _fetchUpdatedSleepFocusConfigurationWithCompletion:v4];
  }
}

void __65__HKSPDNDConfigurationService__startListeningToModeConfigService__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = HKSPLogForCategory(0x13uLL);
  uint64_t v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = WeakRetained;
      _os_log_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully started listening for mode config updates.", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = [v5 localizedDescription];
    int v10 = 138543618;
    id v11 = WeakRetained;
    __int16 v12 = 2114;
    v13 = v9;
    _os_log_error_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Encountered error while listening for mode config updates: %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

+ (id)sleepFocusConfigurationService
{
  return (id)[a1 sleepFocusConfigurationServiceWithOptions:0];
}

- (HKSPDNDConfigurationService)initWithModeConfigService:(id)a3 globalConfigService:(id)a4
{
  return [(HKSPDNDConfigurationService *)self initWithModeConfigService:a3 globalConfigService:a4 options:0];
}

- (void)_withLock:(id)a3
{
  p_cacheLock = &self->_cacheLock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_cacheLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_cacheLock);
}

void __58__HKSPDNDConfigurationService__loadCachedSleepFocusConfig__block_invoke(uint64_t a1)
{
}

uint64_t __63__HKSPDNDConfigurationService__checkForUpdatedSleepFocusConfig__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) _updateCachedSleepFocusConfig:a2];
  }
  return result;
}

- (void)_fetchUpdatedSleepFocusConfigurationWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HKSPLogForCategory(0x13uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = self;
    _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetching current sleep focus config...", buf, 0xCu);
  }

  dndScheduler = self->_dndScheduler;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__HKSPDNDConfigurationService__fetchUpdatedSleepFocusConfigurationWithCompletion___block_invoke;
  v8[3] = &unk_1E5D33540;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(NAScheduler *)dndScheduler performBlock:v8];
}

void __82__HKSPDNDConfigurationService__fetchUpdatedSleepFocusConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v10 = 0;
  v3 = [v2 _sleepFocusConfiguration:&v10 checkCache:0];
  id v4 = v10;
  id v5 = HKSPLogForCategory(0x13uLL);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = [v4 localizedDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      _os_log_error_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Encountered error while updating cached sleep focus config: %{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2114;
    uint64_t v14 = v3;
    _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetched current sleep focus config: %{public}@", buf, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_updateCachedSleepFocusConfig:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__HKSPDNDConfigurationService__updateCachedSleepFocusConfig___block_invoke;
  v6[3] = &unk_1E5D33568;
  id v7 = v4;
  id v5 = v4;
  [(HKSPDNDConfigurationService *)self _updateCacheAndNotifyWithBlock:v6];
}

id __61__HKSPDNDConfigurationService__updateCachedSleepFocusConfig___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)updateCachedUUID:(id)a3 state:(unint64_t)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__HKSPDNDConfigurationService_updateCachedUUID_state___block_invoke;
  v8[3] = &unk_1E5D33590;
  id v9 = v6;
  unint64_t v10 = a4;
  id v7 = v6;
  [(HKSPDNDConfigurationService *)self _updateCacheAndNotifyWithBlock:v8];
}

uint64_t __54__HKSPDNDConfigurationService_updateCachedUUID_state___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sleepFocusConfigurationUpdatingUUID:*(void *)(a1 + 32) state:*(void *)(a1 + 40)];
}

- (void)updateCachedMirrorsFocusModes:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__HKSPDNDConfigurationService_updateCachedMirrorsFocusModes___block_invoke;
  v3[3] = &__block_descriptor_33_e66___HKSPSleepFocusConfiguration_16__0__HKSPSleepFocusConfiguration_8l;
  BOOL v4 = a3;
  [(HKSPDNDConfigurationService *)self _updateCacheAndNotifyWithBlock:v3];
}

uint64_t __61__HKSPDNDConfigurationService_updateCachedMirrorsFocusModes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sleepFocusConfigurationUpdatingMirrorsFocusModes:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_updateCacheAndNotifyWithBlock:(id)a3
{
  id v4 = a3;
  if ([(HKSPDNDConfigurationService *)self _cacheSleepFocusConfig])
  {
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62__HKSPDNDConfigurationService__updateCacheAndNotifyWithBlock___block_invoke;
    v5[3] = &unk_1E5D335D8;
    void v5[4] = self;
    id v6 = v4;
    id v7 = &v8;
    [(HKSPDNDConfigurationService *)self _withLock:v5];
    if (*((unsigned char *)v9 + 24)) {
      [(HKSPDNDConfigurationService *)self _notifyDelegate];
    }

    _Block_object_dispose(&v8, 8);
  }
}

void __62__HKSPDNDConfigurationService__updateCacheAndNotifyWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void (**)(uint64_t, id))(v2 + 16);
  id v4 = *(id *)(*(void *)(a1 + 32) + 24);
  v3(v2, v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_lock_updateCachedSleepFocusConfig:updatedSleepFocusConfig:", v4, v5);
}

- (BOOL)_lock_updateCachedSleepFocusConfig:(id)a3 updatedSleepFocusConfig:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = HKSPLogForCategory(0x13uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543618;
    uint64_t v15 = self;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] updatedSleepFocusConfiguration: %{public}@", (uint8_t *)&v14, 0x16u);
  }

  id v9 = HKSPLogForCategory(0x13uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543618;
    uint64_t v15 = self;
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_impl(&dword_1A7E74000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] cachedSleepFocusConfiguration: %{public}@", (uint8_t *)&v14, 0x16u);
  }

  char v10 = NAEqualObjects();
  if ((v10 & 1) == 0)
  {
    char v11 = HKSPLogForCategory(0x13uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543618;
      uint64_t v15 = self;
      __int16 v16 = 2114;
      id v17 = v7;
      _os_log_impl(&dword_1A7E74000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating cached sleep focus config: %{public}@", (uint8_t *)&v14, 0x16u);
    }

    objc_storeStrong((id *)&self->_cachedSleepFocusConfiguration, a4);
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CB18], "hksp_sleepdUserDefaults");
    [v7 writeToDefaults:v12];
  }
  return v10 ^ 1;
}

uint64_t __60__HKSPDNDConfigurationService_cachedSleepFocusConfiguration__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  return MEMORY[0x1F41817F8]();
}

- (HKSPSleepFocusModeBridgeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKSPSleepFocusModeBridgeDelegate *)WeakRetained;
}

- (BOOL)hasSleepFocusMode:(id *)a3
{
  v3 = [(HKSPDNDConfigurationService *)self sleepFocusConfiguration:a3];
  char v4 = [v3 hasSleepFocusMode];

  return v4;
}

- (void)invalidate
{
  [(HKSPDNDConfigurationService *)self _stopListeningToModeConfigService];
  [(HKSPDNDConfigurationService *)self _stopListeningToGlobalConfigService];
}

- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v5 = objc_msgSend(a4, "na_any:", &__block_literal_global_13);
  id v6 = HKSPLogForCategory(0x13uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    char v11 = self;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] didReceiveAvailableModesUpdate - hasSleepFocus: %d", buf, 0x12u);
  }

  if ([(HKSPDNDConfigurationService *)self _cacheSleepFocusConfig])
  {
    if (v5)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __87__HKSPDNDConfigurationService_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke_292;
      v9[3] = &unk_1E5D33518;
      v9[4] = self;
      [(HKSPDNDConfigurationService *)self _fetchUpdatedSleepFocusConfigurationWithCompletion:v9];
    }
    else
    {
      dndScheduler = self->_dndScheduler;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __87__HKSPDNDConfigurationService_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke_2;
      v8[3] = &unk_1E5D32170;
      void v8[4] = self;
      [(NAScheduler *)dndScheduler performBlock:v8];
    }
  }
  else
  {
    [(HKSPDNDConfigurationService *)self _notifyDelegate];
  }
}

uint64_t __87__HKSPDNDConfigurationService_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:@"com.apple.sleep.sleep-mode"];
}

void __87__HKSPDNDConfigurationService_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke_292(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v3 = a2;
    id v5 = [v3 uuid];
    uint64_t v4 = [v3 state];

    [v2 updateCachedUUID:v5 state:v4];
  }
}

uint64_t __87__HKSPDNDConfigurationService_modeConfigurationService_didReceiveAvailableModesUpdate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateCachedUUID:0 state:0];
}

- (void)globalConfigurationService:(id)a3 didReceiveUpdatedPairSyncState:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (a4 >> 2) & 1;
  id v6 = HKSPLogForCategory(0x13uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    char v11 = self;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] didReceiveUpdatedPairSyncState - mirrorsFocusModes: %d", buf, 0x12u);
  }

  if ([(HKSPDNDConfigurationService *)self _cacheSleepFocusConfig])
  {
    dndScheduler = self->_dndScheduler;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __89__HKSPDNDConfigurationService_globalConfigurationService_didReceiveUpdatedPairSyncState___block_invoke;
    v8[3] = &unk_1E5D31F58;
    void v8[4] = self;
    char v9 = v5;
    [(NAScheduler *)dndScheduler performBlock:v8];
  }
  else
  {
    [(HKSPDNDConfigurationService *)self _notifyDelegate];
  }
}

uint64_t __89__HKSPDNDConfigurationService_globalConfigurationService_didReceiveUpdatedPairSyncState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateCachedMirrorsFocusModes:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_stopListeningToModeConfigService
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = HKSPLogForCategory(0x13uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stop listening for mode config updates.", (uint8_t *)&v5, 0xCu);
  }

  uint64_t v4 = [(HKSPDNDConfigurationService *)self modeConfigService];
  [v4 removeListener:self];
}

void __67__HKSPDNDConfigurationService__startListeningToGlobalConfigService__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = HKSPLogForCategory(0x13uLL);
  uint64_t v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = WeakRetained;
      _os_log_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully started listening for global config updates.", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    char v9 = [v5 localizedDescription];
    int v10 = 138543618;
    id v11 = WeakRetained;
    __int16 v12 = 2114;
    int v13 = v9;
    _os_log_error_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Encountered error while listening for global config updates: %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)_stopListeningToGlobalConfigService
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(HKSPDNDConfigurationService *)self _readGlobalConfig])
  {
    id v3 = HKSPLogForCategory(0x13uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = self;
      _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stop listening for global config updates.", (uint8_t *)&v5, 0xCu);
    }

    uint64_t v4 = [(HKSPDNDConfigurationService *)self globalConfigService];
    [v4 removeListener:self];
  }
}

- (void)_notifyDelegate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = HKSPLogForCategory(0x13uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    char v9 = self;
    _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] notifying delegate", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v4 = [(HKSPDNDConfigurationService *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(HKSPDNDConfigurationService *)self delegate];
    uint64_t v7 = [(HKSPDNDConfigurationService *)self sleepFocusConfiguration:0];
    [v6 sleepFocusModeBridge:self didUpdateSleepFocusConfiguration:v7];
  }
}

- (DNDGlobalConfigurationService)globalConfigService
{
  return self->_globalConfigService;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalConfigService, 0);
  objc_storeStrong((id *)&self->_modeConfigService, 0);
  objc_storeStrong((id *)&self->_dndScheduler, 0);
  objc_storeStrong((id *)&self->_cachedSleepFocusConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end