@interface HDSPNanoDefaults
- (BOOL)hksp_BOOLForKey:(id)a3;
- (HDSPNanoDefaults)initWithEnvironment:(id)a3 configuration:(id)a4;
- (HDSPSyncedUserDefaultsExternalChangeDelegate)delegate;
- (NPSDomainAccessor)npsDomainAccessor;
- (float)hksp_floatForKey:(id)a3;
- (id)_keysForChangeNotification:(id)a3;
- (id)hksp_dataForKey:(id)a3;
- (id)hksp_dictionaryRepresentation;
- (id)hksp_dictionaryRepresentationForKeys:(id)a3;
- (id)hksp_objectForKey:(id)a3;
- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4;
- (int64_t)hksp_integerForKey:(id)a3;
- (void)_handleActivePairedDeviceDidChange:(id)a3;
- (void)_handleNanoPreferencesSync:(id)a3;
- (void)_registerForNotifications;
- (void)_resetNPSDomainAccessor;
- (void)hdsp_forceSynchronizeWithCompletion:(id)a3;
- (void)hdsp_setExternalChangeDelegate:(id)a3;
- (void)hksp_removeObjectForKey:(id)a3;
- (void)hksp_removeObjectsForKeys:(id)a3;
- (void)hksp_reset;
- (void)hksp_saveDictionary:(id)a3;
- (void)hksp_setBool:(BOOL)a3 forKey:(id)a4;
- (void)hksp_setFloat:(float)a3 forKey:(id)a4;
- (void)hksp_setInteger:(int64_t)a3 forKey:(id)a4;
- (void)hksp_setObject:(id)a3 forKey:(id)a4;
- (void)hksp_synchronize;
- (void)hksp_synchronizeKeys:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HDSPNanoDefaults

- (HDSPNanoDefaults)initWithEnvironment:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HDSPNanoDefaults;
  v8 = [(HDSPNanoDefaults *)&v22 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_environment, v6);
    objc_storeStrong((id *)&v9->_configuration, a4);
    v10 = (NPSManager *)objc_alloc_init(MEMORY[0x263F57528]);
    npsManager = v9->_npsManager;
    v9->_npsManager = v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.sleep.NPSDomainAccessor.serial", 0);
    npsDomainAccessorQueue = v9->_npsDomainAccessorQueue;
    v9->_npsDomainAccessorQueue = (OS_dispatch_queue *)v12;

    objc_initWeak(&location, v9);
    id v14 = objc_alloc(MEMORY[0x263F75D90]);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __54__HDSPNanoDefaults_initWithEnvironment_configuration___block_invoke;
    v19[3] = &unk_2645DA2C8;
    objc_copyWeak(&v20, &location);
    uint64_t v15 = [v14 initWithInterval:v19 updateBlock:0.5];
    notifyAccumulator = v9->_notifyAccumulator;
    v9->_notifyAccumulator = (HKSPAccumulator *)v15;

    v17 = v9;
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __54__HDSPNanoDefaults_initWithEnvironment_configuration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2114;
    id v14 = v3;
    id v6 = v12;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] notifying for external change for keys: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  id v7 = [WeakRetained delegate];
  char v8 = objc_opt_respondsToSelector();

  v9 = [WeakRetained delegate];
  v10 = v9;
  if (v8) {
    [v9 syncedUserDefaults:WeakRetained didChangeExternallyForKeys:v3];
  }
  else {
    [v9 syncedUserDefaultsDidChangeExternally:WeakRetained];
  }
}

- (id)_keysForChangeNotification:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"com.apple.sleep.sync.SleepScheduleDidChange"])
  {
    configuration = self->_configuration;
LABEL_7:
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    char v8 = [(HDSPSyncedDefaultsConfiguration *)configuration keySetForIdentifier:v7];
    id v9 = [v8 keysToSync];

    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"com.apple.sleep.sync.SleepSettingsDidChange"])
  {
    configuration = self->_configuration;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"com.apple.sleep.sync.SleepRecordDidChange"])
  {
    configuration = self->_configuration;
    goto LABEL_7;
  }
  id v9 = objc_alloc_init(MEMORY[0x263EFFA08]);
LABEL_8:

  return v9;
}

- (NPSDomainAccessor)npsDomainAccessor
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__22;
  v10 = __Block_byref_object_dispose__22;
  id v11 = 0;
  npsDomainAccessorQueue = self->_npsDomainAccessorQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__HDSPNanoDefaults_npsDomainAccessor__block_invoke;
  v5[3] = &unk_2645D90E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(npsDomainAccessorQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NPSDomainAccessor *)v3;
}

void __37__HDSPNanoDefaults_npsDomainAccessor__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    id v3 = HKSPLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = (id)objc_opt_class();
      id v4 = v13;
      _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] initializing NPSDomainAccessor", (uint8_t *)&v12, 0xCu);
    }
    id v5 = objc_alloc(MEMORY[0x263F57520]);
    uint64_t v6 = [v5 initWithDomain:*MEMORY[0x263F75A90]];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 48);
    *(void *)(v7 + 48) = v6;

    v2 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v9 = HKSPLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      int v12 = 138543362;
      id v13 = v10;
      id v11 = v10;
      _os_log_error_impl(&dword_221A52000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] failed to create NPSDomainAccessor", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)_resetNPSDomainAccessor
{
  npsDomainAccessorQueue = self->_npsDomainAccessorQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__HDSPNanoDefaults__resetNPSDomainAccessor__block_invoke;
  block[3] = &unk_2645D90C0;
  block[4] = self;
  dispatch_sync(npsDomainAccessorQueue, block);
}

void __43__HDSPNanoDefaults__resetNPSDomainAccessor__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = HKSPLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v3 = v7;
    _os_log_impl(&dword_221A52000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] re-creating NPSDomainAccessor", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = 0;
}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (([v5 isEqualToString:@"com.apple.sleep.sync.SleepScheduleDidChange"] & 1) != 0
    || ([v5 isEqualToString:@"com.apple.sleep.sync.SleepSettingsDidChange"] & 1) != 0
    || [v5 isEqualToString:@"com.apple.sleep.sync.SleepRecordDidChange"])
  {
    int v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v11 = 138543618;
      *(void *)&v11[4] = objc_opt_class();
      *(_WORD *)&v11[12] = 2114;
      *(void *)&v11[14] = v5;
      id v7 = *(id *)&v11[4];
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] received %{public}@", v11, 0x16u);
    }
    uint64_t v8 = [(HDSPNanoDefaults *)self _keysForChangeNotification:v5];
    [(HDSPNanoDefaults *)self _handleNanoPreferencesSync:v8];
  }
  id v9 = objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", *(_OWORD *)v11, *(void *)&v11[16], v12);

  return v9;
}

- (void)_handleActivePairedDeviceDidChange:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2114;
    id v11 = v4;
    id v6 = v9;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] _handleActivePairedDeviceDidChange: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  [(HDSPNanoDefaults *)self _resetNPSDomainAccessor];
  id v7 = [(HDSPNanoDefaults *)self delegate];
  [v7 syncedUserDefaultsDidChangeExternally:self];
}

- (void)_handleNanoPreferencesSync:(id)a3
{
  id v4 = a3;
  id v5 = [(HDSPNanoDefaults *)self npsDomainAccessor];
  id v6 = (id)[v5 synchronize];

  notifyAccumulator = self->_notifyAccumulator;
  id v8 = [v4 allObjects];

  [(HKSPAccumulator *)notifyAccumulator accumulateValues:v8];
}

- (void)hdsp_forceSynchronizeWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing full sync", buf, 0xCu);
  }
  id v7 = [(HDSPNanoDefaults *)self npsDomainAccessor];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__HDSPNanoDefaults_hdsp_forceSynchronizeWithCompletion___block_invoke;
  v9[3] = &unk_2645DA808;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 synchronizeWithCompletionHandler:v9];
}

void __56__HDSPNanoDefaults_hdsp_forceSynchronizeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HKSPLogForCategory();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543618;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 2114;
      id v11 = v3;
      id v6 = v9;
      _os_log_error_impl(&dword_221A52000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] full sync failed with error: %{public}@", (uint8_t *)&v8, 0x16u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = (id)objc_opt_class();
    id v6 = v9;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully completed full sync", (uint8_t *)&v8, 0xCu);
    goto LABEL_6;
  }

  (*(void (**)(void, BOOL, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3 == 0, v3, v7);
}

- (void)hdsp_setExternalChangeDelegate:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2114;
    id v12 = v4;
    id v6 = v10;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] hdsp_setExternalChangeDelegate %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [(HDSPNanoDefaults *)self setDelegate:v4];
  [(HDSPNanoDefaults *)self _registerForNotifications];
  uint64_t v7 = [(HDSPNanoDefaults *)self npsDomainAccessor];
  id v8 = (id)[v7 synchronize];
}

- (void)_registerForNotifications
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v4 = [WeakRetained notificationListener];
  [v4 addObserver:self];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel__handleActivePairedDeviceDidChange_ name:*MEMORY[0x263F57688] object:0];

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel__handleActivePairedDeviceDidChange_ name:*MEMORY[0x263F576A8] object:0];
}

- (id)hksp_objectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HDSPNanoDefaults *)self npsDomainAccessor];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)hksp_setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HDSPNanoDefaults *)self npsDomainAccessor];
  [v8 setObject:v7 forKey:v6];
}

- (void)hksp_removeObjectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HDSPNanoDefaults *)self npsDomainAccessor];
  [v5 removeObjectForKey:v4];
}

- (BOOL)hksp_BOOLForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HDSPNanoDefaults *)self npsDomainAccessor];
  char v6 = [v5 BOOLForKey:v4];

  return v6;
}

- (void)hksp_setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(HDSPNanoDefaults *)self npsDomainAccessor];
  [v7 setBool:v4 forKey:v6];
}

- (float)hksp_floatForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HDSPNanoDefaults *)self npsDomainAccessor];
  [v5 floatForKey:v4];
  float v7 = v6;

  return v7;
}

- (void)hksp_setFloat:(float)a3 forKey:(id)a4
{
  id v6 = a4;
  id v8 = [(HDSPNanoDefaults *)self npsDomainAccessor];
  *(float *)&double v7 = a3;
  [v8 setFloat:v6 forKey:v7];
}

- (int64_t)hksp_integerForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HDSPNanoDefaults *)self npsDomainAccessor];
  int64_t v6 = [v5 integerForKey:v4];

  return v6;
}

- (void)hksp_setInteger:(int64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = [(HDSPNanoDefaults *)self npsDomainAccessor];
  [v7 setInteger:a3 forKey:v6];
}

- (id)hksp_dataForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HDSPNanoDefaults *)self npsDomainAccessor];
  id v6 = [v5 dataForKey:v4];

  return v6;
}

- (id)hksp_dictionaryRepresentation
{
  v2 = [(HDSPNanoDefaults *)self npsDomainAccessor];
  id v3 = [v2 dictionaryRepresentation];

  return v3;
}

- (id)hksp_dictionaryRepresentationForKeys:(id)a3
{
  id v4 = a3;
  id v5 = [(HDSPNanoDefaults *)self hksp_dictionaryRepresentation];
  id v6 = objc_msgSend(v5, "hksp_dictionaryByFilteringKeys:", v4);

  return v6;
}

- (void)hksp_saveDictionary:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__HDSPNanoDefaults_hksp_saveDictionary___block_invoke;
  v3[3] = &unk_2645DA830;
  v3[4] = self;
  objc_msgSend(a3, "na_each:", v3);
}

uint64_t __40__HDSPNanoDefaults_hksp_saveDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "hksp_setObject:forKey:", a3, a2);
}

- (void)hksp_removeObjectsForKeys:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__HDSPNanoDefaults_hksp_removeObjectsForKeys___block_invoke;
  v3[3] = &unk_2645DA858;
  v3[4] = self;
  objc_msgSend(a3, "na_each:", v3);
}

uint64_t __46__HDSPNanoDefaults_hksp_removeObjectsForKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hksp_removeObjectForKey:", a2);
}

- (void)hksp_synchronize
{
  id v3 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration allKeysToSync];
  [(HDSPNanoDefaults *)self hksp_synchronizeKeys:v3];
}

- (void)hksp_synchronizeKeys:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HDSPNanoDefaults *)self npsDomainAccessor];
  id v6 = [v5 synchronize];

  if (v6)
  {
    id v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)objc_super v22 = 138543618;
      *(void *)&v22[4] = objc_opt_class();
      *(_WORD *)&v22[12] = 2114;
      *(void *)&v22[14] = v6;
      id v8 = *(id *)&v22[4];
      int v9 = "[%{public}@] synchronize failed with error %{public}@";
      id v10 = v7;
      uint32_t v11 = 22;
LABEL_4:
      _os_log_error_impl(&dword_221A52000, v10, OS_LOG_TYPE_ERROR, v9, v22, v11);
    }
  }
  else
  {
    if (!self->_npsManager)
    {
      id v7 = HKSPLogForCategory();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      *(_DWORD *)objc_super v22 = 138543362;
      *(void *)&v22[4] = objc_opt_class();
      id v8 = *(id *)&v22[4];
      int v9 = "[%{public}@] npsManager is nil when syncing";
      id v10 = v7;
      uint32_t v11 = 12;
      goto LABEL_4;
    }
    id v12 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration allPerGizmoKeys];
    id v7 = objc_msgSend(v4, "na_setByRemovingObjectsFromSet:", v12);

    uint64_t v13 = [v7 count];
    uint64_t v14 = (void *)MEMORY[0x263F75A90];
    if (v13)
    {
      uint64_t v15 = HKSPLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)objc_super v22 = 138543618;
        *(void *)&v22[4] = objc_opt_class();
        *(_WORD *)&v22[12] = 2114;
        *(void *)&v22[14] = v7;
        id v16 = *(id *)&v22[4];
        _os_log_impl(&dword_221A52000, v15, OS_LOG_TYPE_INFO, "[%{public}@] syncing keys: %{public}@", v22, 0x16u);
      }
      [(NPSManager *)self->_npsManager synchronizeUserDefaultsDomain:*v14 keys:v7];
    }
    v17 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration allPerGizmoKeys];
    v18 = objc_msgSend(v4, "na_setByIntersectingWithSet:", v17);

    if ([v18 count])
    {
      v19 = HKSPLogForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = objc_opt_class();
        *(_DWORD *)objc_super v22 = 138543618;
        *(void *)&v22[4] = v20;
        *(_WORD *)&v22[12] = 2114;
        *(void *)&v22[14] = v18;
        id v21 = v20;
        _os_log_impl(&dword_221A52000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncing per-gizmo keys: %{public}@", v22, 0x16u);
      }
      [(NPSManager *)self->_npsManager synchronizeNanoDomain:*v14 keys:v18];
    }
  }
LABEL_16:
}

- (void)hksp_reset
{
}

- (HDSPSyncedUserDefaultsExternalChangeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDSPSyncedUserDefaultsExternalChangeDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_npsDomainAccessor, 0);
  objc_storeStrong((id *)&self->_notifyAccumulator, 0);
  objc_storeStrong((id *)&self->_npsDomainAccessorQueue, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end