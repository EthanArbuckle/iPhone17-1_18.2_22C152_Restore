@interface HDSPSyncedDefaults
- (BOOL)hksp_BOOLForKey:(id)a3;
- (BOOL)needsInitialSync;
- (BOOL)needsSyncFromCloud;
- (BOOL)syncDisabled;
- (HDSPSyncedDefaults)initWithEnvironment:(id)a3 configuration:(id)a4;
- (HDSPSyncedDefaults)initWithEnvironment:(id)a3 configuration:(id)a4 nanoDefaultsProvider:(id)a5 cloudDefaultsProvider:(id)a6 throttleInterval:(double)a7;
- (HDSPSyncedUserDefaultsExternalChangeDelegate)delegate;
- (float)hksp_floatForKey:(id)a3;
- (id)_cloudDefaultsProvider;
- (id)_defaultsForKey:(id)a3;
- (id)_nanoDefaultsProvider;
- (id)cloudKitDefaultsDictionaryRepresentation;
- (id)hksp_dataForKey:(id)a3;
- (id)hksp_dictionaryRepresentation;
- (id)hksp_dictionaryRepresentationForKeys:(id)a3;
- (id)hksp_objectForKey:(id)a3;
- (id)localDefaultsDictionaryRepresentation;
- (int64_t)hksp_integerForKey:(id)a3;
- (void)_cloudDefaultsDidReceiveExternalChange;
- (void)_cloudDefaultsDidReceiveExternalChangeForKeys:(id)a3;
- (void)_differentialCloudKitSync;
- (void)_differentialCloudKitSyncForKeySet:(id)a3;
- (void)_hksp_synchronizeKeys:(id)a3;
- (void)_initialCloudKitSync;
- (void)_nanoDefaultsDidReceiveExternalChange;
- (void)_nanoDefaultsDidReceiveExternalChangeForKeys:(id)a3;
- (void)_setDefaultForKey:(id)a3 setBlock:(id)a4;
- (void)_setDefaultForKey:(id)a3 setBlock:(id)a4 syncToCloudKit:(BOOL)a5;
- (void)_syncCloudKitToLocal;
- (void)_syncKeysFromCloudKit:(id)a3;
- (void)_syncKeysToCloudKit:(id)a3;
- (void)_syncLocalToCloudKit;
- (void)_throttled_synchronizeKeys:(id)a3;
- (void)_withLock:(id)a3;
- (void)hdsp_forceSynchronizeWithCompletion:(id)a3;
- (void)hdsp_setExternalChangeDelegate:(id)a3;
- (void)hksp_removeObjectForKey:(id)a3;
- (void)hksp_removeObjectsForKeys:(id)a3;
- (void)hksp_removeObjectsForKeys:(id)a3 syncToCloudKit:(BOOL)a4;
- (void)hksp_reset;
- (void)hksp_saveDictionary:(id)a3;
- (void)hksp_saveDictionary:(id)a3 syncToCloudKit:(BOOL)a4;
- (void)hksp_setBool:(BOOL)a3 forKey:(id)a4;
- (void)hksp_setFloat:(float)a3 forKey:(id)a4;
- (void)hksp_setInteger:(int64_t)a3 forKey:(id)a4;
- (void)hksp_setObject:(id)a3 forKey:(id)a4;
- (void)hksp_synchronize;
- (void)resetCloudData;
- (void)saveCloudDataVersion;
- (void)saveDataVersion;
- (void)setDelegate:(id)a3;
- (void)setNeedsInitialSync:(BOOL)a3;
- (void)setNeedsSyncFromCloud:(BOOL)a3;
- (void)syncedUserDefaults:(id)a3 didChangeExternallyForKeys:(id)a4;
- (void)syncedUserDefaultsDidChangeExternally:(id)a3;
@end

@implementation HDSPSyncedDefaults

- (id)_nanoDefaultsProvider
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__HDSPSyncedDefaults__nanoDefaultsProvider__block_invoke;
  v4[3] = &unk_2645DA2A0;
  v4[4] = self;
  v2 = (void *)MEMORY[0x223C8D8E0](v4, a2);

  return v2;
}

HDSPNanoDefaults *__43__HDSPSyncedDefaults__nanoDefaultsProvider__block_invoke(uint64_t a1)
{
  v2 = [HDSPNanoDefaults alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v4 = [(HDSPNanoDefaults *)v2 initWithEnvironment:WeakRetained configuration:*(void *)(*(void *)(a1 + 32) + 16)];

  return v4;
}

- (id)_cloudDefaultsProvider
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__HDSPSyncedDefaults__cloudDefaultsProvider__block_invoke;
  v4[3] = &unk_2645DA2A0;
  v4[4] = self;
  v2 = (void *)MEMORY[0x223C8D8E0](v4, a2);

  return v2;
}

HDSPCloudDefaults *__44__HDSPSyncedDefaults__cloudDefaultsProvider__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v3 = [WeakRetained behavior];
  v4 = [v3 features];
  int v5 = [v4 sleepCloudKitSync];

  if (v5)
  {
    v6 = [HDSPCloudDefaults alloc];
    id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    v8 = [(HDSPCloudDefaults *)v6 initWithEnvironment:v7 configuration:*(void *)(*(void *)(a1 + 32) + 16)];
  }
  else
  {
    v9 = HKSPLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = (id)objc_opt_class();
      id v10 = v13;
      _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] cloud sync is disabled", (uint8_t *)&v12, 0xCu);
    }
    v8 = 0;
  }

  return v8;
}

- (HDSPSyncedDefaults)initWithEnvironment:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HDSPSyncedDefaults *)self _nanoDefaultsProvider];
  v9 = [(HDSPSyncedDefaults *)self _cloudDefaultsProvider];
  id v10 = [(HDSPSyncedDefaults *)self initWithEnvironment:v7 configuration:v6 nanoDefaultsProvider:v8 cloudDefaultsProvider:v9 throttleInterval:0.25];

  return v10;
}

- (HDSPSyncedDefaults)initWithEnvironment:(id)a3 configuration:(id)a4 nanoDefaultsProvider:(id)a5 cloudDefaultsProvider:(id)a6 throttleInterval:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = (void (**)(void))a5;
  v15 = (void (**)(void))a6;
  v36.receiver = self;
  v36.super_class = (Class)HDSPSyncedDefaults;
  v16 = [(HDSPSyncedDefaults *)&v36 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_environment, v12);
    objc_storeStrong((id *)&v17->_configuration, a4);
    uint64_t v18 = [v12 userDefaults];
    localDefaults = v17->_localDefaults;
    v17->_localDefaults = (HKSPUserDefaults *)v18;

    uint64_t v20 = v14[2](v14);
    nanoDefaults = v17->_nanoDefaults;
    v17->_nanoDefaults = (HDSPSyncedUserDefaults *)v20;

    uint64_t v22 = v15[2](v15);
    cloudDefaults = v17->_cloudDefaults;
    v17->_cloudDefaults = (HDSPSyncedUserDefaults *)v22;

    v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    keysNeedingSynchronize = v17->_keysNeedingSynchronize;
    v17->_keysNeedingSynchronize = v24;

    objc_initWeak(&location, v17);
    id v26 = objc_alloc(MEMORY[0x263F75D90]);
    uint64_t v33 = MEMORY[0x263EF8330];
    objc_copyWeak(&v34, &location);
    v27 = objc_msgSend(v12, "defaultCallbackScheduler", v33, 3221225472, __116__HDSPSyncedDefaults_initWithEnvironment_configuration_nanoDefaultsProvider_cloudDefaultsProvider_throttleInterval___block_invoke, &unk_2645DA2C8);
    v28 = [v12 mutexGenerator];
    uint64_t v29 = [v26 initWithInterval:&v33 updateBlock:v27 scheduler:v28 mutexGenerator:a7];
    syncAccumulator = v17->_syncAccumulator;
    v17->_syncAccumulator = (HKSPAccumulator *)v29;

    v17->_lock._os_unfair_lock_opaque = 0;
    v31 = v17;
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  return v17;
}

void __116__HDSPSyncedDefaults_initWithEnvironment_configuration_nanoDefaultsProvider_cloudDefaultsProvider_throttleInterval___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_throttled_synchronizeKeys:", v3);
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)syncDisabled
{
  v2 = self;
  id v3 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration info];
  v4 = [v3 cloudSyncEnabledKey];
  LOBYTE(v2) = ![(HDSPSyncedDefaults *)v2 hksp_BOOLForKey:v4];

  return (char)v2;
}

- (id)hksp_dictionaryRepresentation
{
  id v3 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration allKeysToPersist];
  v4 = [(HDSPSyncedDefaults *)self hksp_dictionaryRepresentationForKeys:v3];

  return v4;
}

- (id)hksp_dictionaryRepresentationForKeys:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v44 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration allDefaultValues];
  v40 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration allPerGizmoKeys];
  v41 = v4;
  id v6 = objc_msgSend(v4, "na_setByRemovingObjectsFromSet:", v40);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v50 objects:v61 count:16];
  v42 = v6;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v51 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        id v12 = [(HKSPUserDefaults *)self->_localDefaults hksp_objectForKey:v11];
        if (v12)
        {
          [v5 setObject:v12 forKeyedSubscript:v11];
        }
        else
        {
          id v13 = [v44 objectForKeyedSubscript:v11];
          if (v13)
          {
            uint64_t v14 = HKSPLogForCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v15 = objc_opt_class();
              *(_DWORD *)buf = 138543874;
              v56 = v15;
              __int16 v57 = 2114;
              v58 = v13;
              __int16 v59 = 2114;
              uint64_t v60 = v11;
              id v16 = v15;
              _os_log_impl(&dword_221A52000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading default value %{public}@ for key: %{public}@", buf, 0x20u);

              id v6 = v42;
            }

            [v5 setObject:v13 forKeyedSubscript:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v50 objects:v61 count:16];
    }
    while (v8);
  }
  objc_msgSend(v41, "na_setByIntersectingWithSet:", v40);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v45 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v47 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v46 + 1) + 8 * j);
        v21 = HKSPLogForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v56 = v22;
          __int16 v57 = 2114;
          v58 = v20;
          id v23 = v22;
          _os_log_impl(&dword_221A52000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading value for per-gizmo key: %{public}@", buf, 0x16u);
        }
        v24 = [(HDSPSyncedUserDefaults *)self->_nanoDefaults hksp_objectForKey:v20];
        v25 = HKSPLogForCategory();
        BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        if (v24)
        {
          if (v26)
          {
            v27 = objc_opt_class();
            *(_DWORD *)buf = 138543874;
            v56 = v27;
            __int16 v57 = 2114;
            v58 = v24;
            __int16 v59 = 2114;
            uint64_t v60 = (uint64_t)v20;
            id v28 = v27;
            _os_log_impl(&dword_221A52000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading value %{public}@ for per-gizmo key: %{public}@", buf, 0x20u);
          }
          [v5 setObject:v24 forKeyedSubscript:v20];
        }
        else
        {
          if (v26)
          {
            uint64_t v29 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v56 = v29;
            __int16 v57 = 2114;
            v58 = v20;
            id v30 = v29;
            _os_log_impl(&dword_221A52000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] found nil value for per-gizmo key: %{public}@", buf, 0x16u);
          }
          v31 = [v44 objectForKeyedSubscript:v20];
          v32 = HKSPLogForCategory();
          BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
          if (v31)
          {
            if (v33)
            {
              id v34 = objc_opt_class();
              *(_DWORD *)buf = 138543874;
              v56 = v34;
              __int16 v57 = 2114;
              v58 = v31;
              __int16 v59 = 2114;
              uint64_t v60 = (uint64_t)v20;
              id v35 = v34;
              _os_log_impl(&dword_221A52000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading default value %{public}@ for per-gizmo key: %{public}@", buf, 0x20u);
            }
            [v5 setObject:v31 forKeyedSubscript:v20];
          }
          else
          {
            if (v33)
            {
              objc_super v36 = objc_opt_class();
              *(_DWORD *)buf = 138543618;
              v56 = v36;
              __int16 v57 = 2114;
              v58 = v20;
              id v37 = v36;
              _os_log_impl(&dword_221A52000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] no default value for per-gizmo key: %{public}@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v18);
  }
  v38 = (void *)[v5 copy];

  return v38;
}

- (void)hksp_saveDictionary:(id)a3
{
}

- (void)hksp_saveDictionary:(id)a3 syncToCloudKit:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v12 = [v6 objectForKeyedSubscript:v11];
        id v13 = HKSPNilify();

        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __57__HDSPSyncedDefaults_hksp_saveDictionary_syncToCloudKit___block_invoke;
        v15[3] = &unk_2645DA2F0;
        id v16 = v13;
        uint64_t v17 = v11;
        id v14 = v13;
        [(HDSPSyncedDefaults *)self _setDefaultForKey:v11 setBlock:v15 syncToCloudKit:v4];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
}

uint64_t __57__HDSPSyncedDefaults_hksp_saveDictionary_syncToCloudKit___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hksp_setObject:forKey:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)hksp_removeObjectsForKeys:(id)a3
{
}

- (void)hksp_removeObjectsForKeys:(id)a3 syncToCloudKit:(BOOL)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[HDSPSyncedDefaults _setDefaultForKey:setBlock:syncToCloudKit:](self, "_setDefaultForKey:setBlock:syncToCloudKit:");
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

uint64_t __63__HDSPSyncedDefaults_hksp_removeObjectsForKeys_syncToCloudKit___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hksp_removeObjectForKey:", *(void *)(a1 + 32));
}

- (void)_setDefaultForKey:(id)a3 setBlock:(id)a4
{
}

- (void)_setDefaultForKey:(id)a3 setBlock:(id)a4 syncToCloudKit:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void *))a4;
  if ([(HDSPSyncedDefaultsConfiguration *)self->_configuration shouldPersistKey:v8])
  {
    long long v10 = [(HDSPSyncedDefaults *)self _defaultsForKey:v8];
    v9[2](v9, v10);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    long long v12 = [WeakRetained behavior];
    long long v13 = [v12 features];
    int v14 = [v13 sleepCloudKitSync];

    if (!v14)
    {
LABEL_11:
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __64__HDSPSyncedDefaults__setDefaultForKey_setBlock_syncToCloudKit___block_invoke;
      v25[3] = &unk_2645D9288;
      v25[4] = self;
      id v26 = v8;
      [(HDSPSyncedDefaults *)self _withLock:v25];

      goto LABEL_12;
    }
    if ([(HDSPSyncedDefaults *)self syncDisabled])
    {
      uint64_t v15 = HKSPLogForCategory();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:

        goto LABEL_11;
      }
      *(_DWORD *)buf = 138543362;
      id v28 = (id)objc_opt_class();
      id v16 = v28;
      uint64_t v17 = "[%{public}@] not syncing to CloudKit because sync disabled";
    }
    else
    {
      if (![(HDSPSyncedDefaults *)self needsInitialSync])
      {
        long long v18 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration info];
        long long v19 = [v18 cloudSyncEnabledKey];
        int v20 = [v8 isEqualToString:v19];

        if (v20)
        {
          long long v21 = HKSPLogForCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v28 = (id)objc_opt_class();
            id v22 = v28;
            _os_log_impl(&dword_221A52000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] sync now enabled, syncing from CloudKit", buf, 0xCu);
          }
          [(HDSPSyncedDefaults *)self setNeedsSyncFromCloud:1];
        }
        else if (v5 && [(HDSPSyncedDefaultsConfiguration *)self->_configuration shouldSyncKey:v8])
        {
          uint64_t v23 = HKSPLogForCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v28 = (id)objc_opt_class();
            __int16 v29 = 2112;
            id v30 = v8;
            id v24 = v28;
            _os_log_impl(&dword_221A52000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncing key to CloudKit: %@", buf, 0x16u);
          }
          v9[2](v9, self->_cloudDefaults);
        }
        goto LABEL_11;
      }
      uint64_t v15 = HKSPLogForCategory();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 138543362;
      id v28 = (id)objc_opt_class();
      id v16 = v28;
      uint64_t v17 = "[%{public}@] not syncing to CloudKit because initial sync needed";
    }
    _os_log_impl(&dword_221A52000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);

    goto LABEL_10;
  }
LABEL_12:
}

uint64_t __64__HDSPSyncedDefaults__setDefaultForKey_setBlock_syncToCloudKit___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
}

- (void)hdsp_forceSynchronizeWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] doing a full CloudKit sync", buf, 0xCu);
  }
  cloudDefaults = self->_cloudDefaults;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__HDSPSyncedDefaults_hdsp_forceSynchronizeWithCompletion___block_invoke;
  v9[3] = &unk_2645DA340;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(HDSPSyncedUserDefaults *)cloudDefaults hdsp_forceSynchronizeWithCompletion:v9];
}

void __58__HDSPSyncedDefaults_hdsp_forceSynchronizeWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [*(id *)(a1 + 32) setNeedsInitialSync:a2 ^ 1];
  if ((a2 ^ 1))
  {
    id v6 = HKSPLogForCategory();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    int v9 = 138543618;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2114;
    id v12 = v5;
    id v7 = v10;
    _os_log_error_impl(&dword_221A52000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] full CloudKit sync failed: %{public}@", (uint8_t *)&v9, 0x16u);
    goto LABEL_4;
  }
  [*(id *)(a1 + 32) _initialCloudKitSync];
  id v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = (id)objc_opt_class();
    id v7 = v10;
    _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] full CloudKit sync completed", (uint8_t *)&v9, 0xCu);
LABEL_4:
  }
LABEL_6:

  (*(void (**)(void, uint64_t, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, v5, v8);
}

- (void)hdsp_setExternalChangeDelegate:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v4;
    id v6 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] hdsp_setExternalChangeDelegate %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [(HDSPSyncedDefaults *)self setDelegate:v4];
  [(HDSPSyncedUserDefaults *)self->_nanoDefaults hdsp_setExternalChangeDelegate:self];
  [(HDSPSyncedUserDefaults *)self->_cloudDefaults hdsp_setExternalChangeDelegate:self];
}

- (id)_defaultsForKey:(id)a3
{
  configuration = self->_configuration;
  id v5 = a3;
  id v6 = [(HDSPSyncedDefaultsConfiguration *)configuration allPerGizmoKeys];
  int v7 = [v6 containsObject:v5];

  uint64_t v8 = 24;
  if (v7) {
    uint64_t v8 = 32;
  }
  id v9 = *(id *)((char *)&self->super.isa + v8);

  return v9;
}

- (id)hksp_objectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HDSPSyncedDefaults *)self _defaultsForKey:v4];
  id v6 = objc_msgSend(v5, "hksp_objectForKey:", v4);
  int v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration allDefaultValues];
    id v8 = [v9 objectForKeyedSubscript:v4];
  }

  return v8;
}

- (void)hksp_setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__HDSPSyncedDefaults_hksp_setObject_forKey___block_invoke;
  v10[3] = &unk_2645DA2F0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(HDSPSyncedDefaults *)self _setDefaultForKey:v8 setBlock:v10];
}

uint64_t __44__HDSPSyncedDefaults_hksp_setObject_forKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hksp_setObject:forKey:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)hksp_removeObjectForKey:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__HDSPSyncedDefaults_hksp_removeObjectForKey___block_invoke;
  v6[3] = &unk_2645DA318;
  id v7 = v4;
  id v5 = v4;
  [(HDSPSyncedDefaults *)self _setDefaultForKey:v5 setBlock:v6];
}

uint64_t __46__HDSPSyncedDefaults_hksp_removeObjectForKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hksp_removeObjectForKey:", *(void *)(a1 + 32));
}

- (BOOL)hksp_BOOLForKey:(id)a3
{
  id v3 = [(HDSPSyncedDefaults *)self hksp_objectForKey:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)hksp_setBool:(BOOL)a3 forKey:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__HDSPSyncedDefaults_hksp_setBool_forKey___block_invoke;
  v8[3] = &unk_2645DA368;
  BOOL v10 = a3;
  id v9 = v6;
  id v7 = v6;
  [(HDSPSyncedDefaults *)self _setDefaultForKey:v7 setBlock:v8];
}

uint64_t __42__HDSPSyncedDefaults_hksp_setBool_forKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hksp_setBool:forKey:", *(unsigned __int8 *)(a1 + 40), *(void *)(a1 + 32));
}

- (float)hksp_floatForKey:(id)a3
{
  id v3 = [(HDSPSyncedDefaults *)self hksp_objectForKey:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)hksp_setFloat:(float)a3 forKey:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__HDSPSyncedDefaults_hksp_setFloat_forKey___block_invoke;
  v8[3] = &unk_2645DA390;
  float v10 = a3;
  id v9 = v6;
  id v7 = v6;
  [(HDSPSyncedDefaults *)self _setDefaultForKey:v7 setBlock:v8];
}

uint64_t __43__HDSPSyncedDefaults_hksp_setFloat_forKey___block_invoke(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(a2, "hksp_setFloat:forKey:", *(void *)(a1 + 32), a3);
}

- (int64_t)hksp_integerForKey:(id)a3
{
  id v3 = [(HDSPSyncedDefaults *)self hksp_objectForKey:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)hksp_setInteger:(int64_t)a3 forKey:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__HDSPSyncedDefaults_hksp_setInteger_forKey___block_invoke;
  v8[3] = &unk_2645DA3B8;
  id v9 = v6;
  int64_t v10 = a3;
  id v7 = v6;
  [(HDSPSyncedDefaults *)self _setDefaultForKey:v7 setBlock:v8];
}

uint64_t __45__HDSPSyncedDefaults_hksp_setInteger_forKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hksp_setInteger:forKey:", *(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)hksp_dataForKey:(id)a3
{
  id v4 = a3;
  float v5 = [(HDSPSyncedDefaults *)self _defaultsForKey:v4];
  id v6 = objc_msgSend(v5, "hksp_dataForKey:", v4);

  return v6;
}

- (id)localDefaultsDictionaryRepresentation
{
  return (id)[(HKSPUserDefaults *)self->_localDefaults hksp_dictionaryRepresentation];
}

- (id)cloudKitDefaultsDictionaryRepresentation
{
  return (id)[(HDSPSyncedUserDefaults *)self->_cloudDefaults hksp_dictionaryRepresentation];
}

- (void)hksp_synchronize
{
  uint64_t v4 = 0;
  float v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__11;
  id v8 = __Block_byref_object_dispose__11;
  id v9 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38__HDSPSyncedDefaults_hksp_synchronize__block_invoke;
  v3[3] = &unk_2645D9630;
  v3[4] = self;
  v3[5] = &v4;
  [(HDSPSyncedDefaults *)self _withLock:v3];
  [(HDSPSyncedDefaults *)self _hksp_synchronizeKeys:v5[5]];
  _Block_object_dispose(&v4, 8);
}

uint64_t __38__HDSPSyncedDefaults_hksp_synchronize__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];

  return MEMORY[0x270F9A758]();
}

- (void)_hksp_synchronizeKeys:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(HDSPSyncedDefaults *)self saveDataVersion];
  [(HDSPSyncedDefaults *)self saveCloudDataVersion];
  float v5 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration info];
  uint64_t v6 = [v5 dataVersionKey];
  v13[0] = v6;
  id v7 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration info];
  id v8 = [v7 cloudDataVersionKey];
  v13[1] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  int64_t v10 = [v4 setByAddingObjectsFromArray:v9];

  syncAccumulator = self->_syncAccumulator;
  id v12 = [v10 allObjects];
  [(HKSPAccumulator *)syncAccumulator accumulateValues:v12];
}

- (void)_throttled_synchronizeKeys:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v19 = (id)objc_opt_class();
    __int16 v20 = 2114;
    id v21 = v4;
    id v6 = v19;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] synchronizing keys: %{public}@", buf, 0x16u);
  }
  [(HKSPUserDefaults *)self->_localDefaults hksp_synchronizeKeys:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v8 = [WeakRetained behavior];
  int v9 = [v8 supportsNanoSync];

  if (v9) {
    [(HDSPSyncedUserDefaults *)self->_nanoDefaults hksp_synchronizeKeys:v4];
  }
  int64_t v10 = objc_loadWeakRetained((id *)&self->_environment);
  id v11 = [v10 behavior];
  id v12 = [v11 features];
  if (![v12 sleepCloudKitSync])
  {

    goto LABEL_10;
  }
  BOOL v13 = [(HDSPSyncedDefaults *)self syncDisabled];

  if (!v13)
  {
    if ([(HDSPSyncedDefaults *)self needsInitialSync])
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __49__HDSPSyncedDefaults__throttled_synchronizeKeys___block_invoke;
      v17[3] = &unk_2645D9F58;
      v17[4] = self;
      [(HDSPSyncedDefaults *)self hdsp_forceSynchronizeWithCompletion:v17];
      goto LABEL_11;
    }
    if (![(HDSPSyncedDefaults *)self needsSyncFromCloud])
    {
      [(HDSPSyncedUserDefaults *)self->_cloudDefaults hksp_synchronizeKeys:v4];
      goto LABEL_11;
    }
    [(HDSPSyncedDefaults *)self setNeedsSyncFromCloud:0];
    [(HDSPSyncedDefaults *)self _syncCloudKitToLocal];
    int64_t v10 = [(HDSPSyncedDefaults *)self delegate];
    [v10 syncedUserDefaultsDidChangeExternally:self];
LABEL_10:
  }
LABEL_11:
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __49__HDSPSyncedDefaults__throttled_synchronizeKeys___block_invoke_2;
  v15[3] = &unk_2645D9288;
  void v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  [(HDSPSyncedDefaults *)self _withLock:v15];
}

void __49__HDSPSyncedDefaults__throttled_synchronizeKeys___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 syncedUserDefaultsDidChangeExternally:*(void *)(a1 + 32)];
}

uint64_t __49__HDSPSyncedDefaults__throttled_synchronizeKeys___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) minusSet:*(void *)(a1 + 40)];
}

- (void)saveDataVersion
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration info];
  id v4 = [v3 dataVersionKey];
  unint64_t v5 = [(HDSPSyncedDefaults *)self hksp_integerForKey:v4];

  id v6 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration info];
  unint64_t v7 = [v6 currentDataVersion];

  if (v5 >= v7)
  {
    if (v5 <= v7) {
      goto LABEL_9;
    }
    int64_t v10 = HKSPLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v25 = 138543874;
      *(void *)&v25[4] = objc_opt_class();
      *(_WORD *)&v25[12] = 2048;
      *(void *)&v25[14] = v5;
      *(_WORD *)&v25[22] = 2048;
      unint64_t v26 = v7;
      id v12 = *(id *)&v25[4];
      _os_log_impl(&dword_221A52000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] not updating newer stored data version from %lu to %lu", v25, 0x20u);
    }
  }
  else
  {
    id v8 = HKSPLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v25 = 138543874;
      *(void *)&v25[4] = objc_opt_class();
      *(_WORD *)&v25[12] = 2048;
      *(void *)&v25[14] = v5;
      *(_WORD *)&v25[22] = 2048;
      unint64_t v26 = v7;
      id v9 = *(id *)&v25[4];
      _os_log_impl(&dword_221A52000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating stored data version from %lu to %lu", v25, 0x20u);
    }
    int64_t v10 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration info];
    id v11 = [v10 dataVersionKey];
    [(HDSPSyncedDefaults *)self hksp_setInteger:v7 forKey:v11];
  }
LABEL_9:
  BOOL v13 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration info];
  id v14 = [v13 localDataVersionKey];
  unint64_t v15 = [(HDSPSyncedDefaults *)self hksp_integerForKey:v14];

  id v16 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration info];
  unint64_t v17 = [v16 currentLocalDataVersion];

  if (v15 >= v17)
  {
    if (v15 <= v17) {
      return;
    }
    id v21 = HKSPLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = objc_opt_class();
      *(_DWORD *)v25 = 138543874;
      *(void *)&v25[4] = v23;
      *(_WORD *)&v25[12] = 2048;
      *(void *)&v25[14] = v15;
      *(_WORD *)&v25[22] = 2048;
      unint64_t v26 = v17;
      id v24 = v23;
      _os_log_impl(&dword_221A52000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] not updating newer stored local data version from %lu to %lu", v25, 0x20u);
    }
  }
  else
  {
    long long v18 = HKSPLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = objc_opt_class();
      *(_DWORD *)v25 = 138543874;
      *(void *)&v25[4] = v19;
      *(_WORD *)&v25[12] = 2048;
      *(void *)&v25[14] = v15;
      *(_WORD *)&v25[22] = 2048;
      unint64_t v26 = v17;
      id v20 = v19;
      _os_log_impl(&dword_221A52000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating stored local data version from %lu to %lu", v25, 0x20u);
    }
    id v21 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration info];
    uint64_t v22 = [v21 localDataVersionKey];
    [(HDSPSyncedDefaults *)self hksp_setInteger:v17 forKey:v22];
  }
}

- (void)saveCloudDataVersion
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v4 = [WeakRetained behavior];
  unint64_t v5 = [v4 features];
  int v6 = [v5 sleepCloudKitSync];

  if (v6
    && ![(HDSPSyncedDefaults *)self syncDisabled]
    && ![(HDSPSyncedDefaults *)self needsInitialSync])
  {
    unint64_t v7 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration info];
    id v8 = [v7 cloudDataVersionKey];
    unint64_t v9 = [(HDSPSyncedDefaults *)self hksp_integerForKey:v8];

    int64_t v10 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration info];
    unint64_t v11 = [v10 currentCloudDataVersion];

    if (v9 >= v11)
    {
      if (v9 <= v11) {
        return;
      }
      id v14 = HKSPLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543874;
        id v18 = (id)objc_opt_class();
        __int16 v19 = 2048;
        unint64_t v20 = v9;
        __int16 v21 = 2048;
        unint64_t v22 = v11;
        id v16 = v18;
        _os_log_impl(&dword_221A52000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] not updating newer stored cloud data version from %lu to %lu", (uint8_t *)&v17, 0x20u);
      }
    }
    else
    {
      id v12 = HKSPLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543874;
        id v18 = (id)objc_opt_class();
        __int16 v19 = 2048;
        unint64_t v20 = v9;
        __int16 v21 = 2048;
        unint64_t v22 = v11;
        id v13 = v18;
        _os_log_impl(&dword_221A52000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating stored cloud data version from %lu to %lu", (uint8_t *)&v17, 0x20u);
      }
      id v14 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration info];
      unint64_t v15 = [v14 cloudDataVersionKey];
      [(HDSPSyncedDefaults *)self hksp_setInteger:v11 forKey:v15];
    }
  }
}

- (void)hksp_reset
{
}

- (void)syncedUserDefaultsDidChangeExternally:(id)a3
{
  id v4 = (HDSPSyncedUserDefaults *)a3;
  int v6 = v4;
  if (self->_nanoDefaults == v4)
  {
    [(HDSPSyncedDefaults *)self _nanoDefaultsDidReceiveExternalChange];
  }
  else if (self->_cloudDefaults == v4)
  {
    [(HDSPSyncedDefaults *)self _cloudDefaultsDidReceiveExternalChange];
  }
  unint64_t v5 = [(HDSPSyncedDefaults *)self delegate];
  [v5 syncedUserDefaultsDidChangeExternally:self];
}

- (void)syncedUserDefaults:(id)a3 didChangeExternallyForKeys:(id)a4
{
  unint64_t v11 = (HDSPSyncedUserDefaults *)a3;
  id v6 = a4;
  if (self->_nanoDefaults == v11)
  {
    [(HDSPSyncedDefaults *)self _nanoDefaultsDidReceiveExternalChangeForKeys:v6];
  }
  else if (self->_cloudDefaults == v11)
  {
    [(HDSPSyncedDefaults *)self _cloudDefaultsDidReceiveExternalChangeForKeys:v6];
  }
  unint64_t v7 = [(HDSPSyncedDefaults *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  unint64_t v9 = [(HDSPSyncedDefaults *)self delegate];
  int64_t v10 = v9;
  if (v8) {
    [v9 syncedUserDefaults:self didChangeExternallyForKeys:v6];
  }
  else {
    [v9 syncedUserDefaultsDidChangeExternally:self];
  }
}

- (void)_nanoDefaultsDidReceiveExternalChange
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = (id)objc_opt_class();
    id v4 = v9;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] _nanoDefaultsDidReceiveExternalChange", (uint8_t *)&v8, 0xCu);
  }
  [(HKSPUserDefaults *)self->_localDefaults hksp_synchronize];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v6 = [WeakRetained behavior];
  char v7 = [v6 isAppleWatch];

  if ((v7 & 1) == 0) {
    [(HDSPSyncedDefaults *)self _differentialCloudKitSync];
  }
}

- (void)_nanoDefaultsDidReceiveExternalChangeForKeys:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2114;
    id v13 = v4;
    id v6 = v11;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] _nanoDefaultsDidReceiveExternalChangeForKeys: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  [(HKSPUserDefaults *)self->_localDefaults hksp_synchronizeKeys:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v8 = [WeakRetained behavior];
  char v9 = [v8 isAppleWatch];

  if ((v9 & 1) == 0) {
    [(HDSPSyncedDefaults *)self _syncKeysToCloudKit:v4];
  }
}

- (void)_cloudDefaultsDidReceiveExternalChange
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] _cloudDefaultsDidReceiveExternalChange", (uint8_t *)&v5, 0xCu);
  }
  [(HDSPSyncedDefaults *)self _differentialCloudKitSync];
}

- (void)_cloudDefaultsDidReceiveExternalChangeForKeys:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v4;
    id v6 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] _cloudDefaultsDidReceiveExternalChangeForKeys: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [(HDSPSyncedDefaults *)self _syncKeysFromCloudKit:v4];
}

- (void)_initialCloudKitSync
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v4 = [WeakRetained behavior];
  int v5 = [v4 features];
  int v6 = [v5 sleepCloudKitSync];

  if (v6 && ![(HDSPSyncedDefaults *)self syncDisabled])
  {
    [(HDSPSyncedDefaults *)self setNeedsInitialSync:0];
    int v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138543362;
      id v24 = (id)objc_opt_class();
      id v8 = v24;
      _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing initial sync", (uint8_t *)&v23, 0xCu);
    }
    cloudDefaults = self->_cloudDefaults;
    id v10 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration info];
    uint64_t v11 = [v10 cloudDataVersionKey];
    uint64_t v12 = [(HDSPSyncedUserDefaults *)cloudDefaults hksp_integerForKey:v11];

    localDefaults = self->_localDefaults;
    uint64_t v14 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration info];
    unint64_t v15 = [v14 cloudDataVersionKey];
    uint64_t v16 = [(HKSPUserDefaults *)localDefaults hksp_integerForKey:v15];

    int v17 = HKSPLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = objc_opt_class();
      int v23 = 138543618;
      id v24 = v18;
      __int16 v25 = 2048;
      uint64_t v26 = v12;
      id v19 = v18;
      _os_log_impl(&dword_221A52000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] serverCloudKitDataVersion %lu", (uint8_t *)&v23, 0x16u);
    }
    unint64_t v20 = HKSPLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = objc_opt_class();
      int v23 = 138543618;
      id v24 = v21;
      __int16 v25 = 2048;
      uint64_t v26 = v16;
      id v22 = v21;
      _os_log_impl(&dword_221A52000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] localCloudKitDataVersion %lu", (uint8_t *)&v23, 0x16u);
    }
    if (v12 | v16)
    {
      if (v12)
      {
        if (!v16) {
          [(HDSPSyncedDefaults *)self _syncCloudKitToLocal];
        }
      }
    }
    else
    {
      [(HDSPSyncedDefaults *)self _syncLocalToCloudKit];
    }
  }
}

- (void)_syncLocalToCloudKit
{
  id v3 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration allKeysToSync];
  [(HDSPSyncedDefaults *)self _syncKeysToCloudKit:v3];
}

- (void)_syncKeysToCloudKit:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v6 = [WeakRetained behavior];
  int v7 = [v6 features];
  int v8 = [v7 sleepCloudKitSync];

  if (v8 && ![(HDSPSyncedDefaults *)self syncDisabled])
  {
    __int16 v9 = HKSPLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543618;
      id v23 = (id)objc_opt_class();
      __int16 v24 = 2114;
      id v25 = v4;
      id v10 = v23;
      _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncing to CloudKit: %{public}@", (uint8_t *)&v22, 0x16u);
    }
    uint64_t v11 = [(HDSPSyncedDefaults *)self hksp_dictionaryRepresentationForKeys:v4];
    uint64_t v12 = (void *)MEMORY[0x263EFFA08];
    id v13 = [v11 allKeys];
    uint64_t v14 = [v12 setWithArray:v13];
    unint64_t v15 = objc_msgSend(v4, "na_setByRemovingObjectsFromSet:", v14);

    [(HDSPSyncedUserDefaults *)self->_cloudDefaults hksp_saveDictionary:v11];
    [(HDSPSyncedUserDefaults *)self->_cloudDefaults hksp_removeObjectsForKeys:v15];
    [(HDSPSyncedUserDefaults *)self->_cloudDefaults hksp_synchronizeKeys:v4];
    [(HDSPSyncedDefaults *)self saveCloudDataVersion];
    uint64_t v16 = HKSPLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = objc_opt_class();
      int v22 = 138543618;
      id v23 = v17;
      __int16 v24 = 2114;
      id v25 = v11;
      id v18 = v17;
      _os_log_impl(&dword_221A52000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] updates: %{public}@", (uint8_t *)&v22, 0x16u);
    }
    id v19 = HKSPLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v20 = objc_opt_class();
      int v22 = 138543618;
      id v23 = v20;
      __int16 v24 = 2114;
      id v25 = v15;
      id v21 = v20;
      _os_log_impl(&dword_221A52000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] removes: %{public}@", (uint8_t *)&v22, 0x16u);
    }
  }
}

- (void)_syncCloudKitToLocal
{
  id v3 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration allKeysToSync];
  [(HDSPSyncedDefaults *)self _syncKeysFromCloudKit:v3];
}

- (void)_syncKeysFromCloudKit:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  int v6 = [WeakRetained behavior];
  int v7 = [v6 features];
  int v8 = [v7 sleepCloudKitSync];

  if (v8 && ![(HDSPSyncedDefaults *)self syncDisabled])
  {
    __int16 v9 = HKSPLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543618;
      id v23 = (id)objc_opt_class();
      __int16 v24 = 2114;
      id v25 = v4;
      id v10 = v23;
      _os_log_impl(&dword_221A52000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncing from CloudKit: %{public}@", (uint8_t *)&v22, 0x16u);
    }
    uint64_t v11 = [(HDSPSyncedUserDefaults *)self->_cloudDefaults hksp_dictionaryRepresentationForKeys:v4];
    uint64_t v12 = (void *)MEMORY[0x263EFFA08];
    id v13 = [v11 allKeys];
    uint64_t v14 = [v12 setWithArray:v13];
    unint64_t v15 = objc_msgSend(v4, "na_setByRemovingObjectsFromSet:", v14);

    [(HDSPSyncedDefaults *)self hksp_saveDictionary:v11 syncToCloudKit:0];
    [(HDSPSyncedDefaults *)self hksp_removeObjectsForKeys:v15 syncToCloudKit:0];
    [(HDSPSyncedDefaults *)self hksp_synchronizeKeys:v4];
    uint64_t v16 = HKSPLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = objc_opt_class();
      int v22 = 138543618;
      id v23 = v17;
      __int16 v24 = 2114;
      id v25 = v11;
      id v18 = v17;
      _os_log_impl(&dword_221A52000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] updates: %{public}@", (uint8_t *)&v22, 0x16u);
    }
    id v19 = HKSPLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v20 = objc_opt_class();
      int v22 = 138543618;
      id v23 = v20;
      __int16 v24 = 2114;
      id v25 = v15;
      id v21 = v20;
      _os_log_impl(&dword_221A52000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] removes: %{public}@", (uint8_t *)&v22, 0x16u);
    }
  }
}

- (void)_differentialCloudKitSync
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  id v4 = [WeakRetained behavior];
  int v5 = [v4 features];
  int v6 = [v5 sleepCloudKitSync];

  if (v6 && ![(HDSPSyncedDefaults *)self syncDisabled])
  {
    int v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = (id)objc_opt_class();
      id v8 = v12;
      _os_log_impl(&dword_221A52000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing differential sync", buf, 0xCu);
    }
    __int16 v9 = [(HDSPSyncedDefaultsConfiguration *)self->_configuration keySets];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __47__HDSPSyncedDefaults__differentialCloudKitSync__block_invoke;
    v10[3] = &unk_2645DA3E0;
    void v10[4] = self;
    objc_msgSend(v9, "na_each:", v10);
  }
}

uint64_t __47__HDSPSyncedDefaults__differentialCloudKitSync__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _differentialCloudKitSyncForKeySet:a2];
}

- (void)_differentialCloudKitSyncForKeySet:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 identifier];
    int v28 = 138543618;
    __int16 v29 = v6;
    __int16 v30 = 2114;
    uint64_t v31 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] looking at keySet: %{public}@", (uint8_t *)&v28, 0x16u);
  }
  cloudDefaults = self->_cloudDefaults;
  id v10 = [v4 modificationDateKey];
  uint64_t v11 = [(HDSPSyncedUserDefaults *)cloudDefaults hksp_objectForKey:v10];

  localDefaults = self->_localDefaults;
  uint64_t v13 = [v4 modificationDateKey];
  uint64_t v14 = [(HKSPUserDefaults *)localDefaults hksp_objectForKey:v13];

  unint64_t v15 = HKSPLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = objc_opt_class();
    int v28 = 138543618;
    __int16 v29 = v16;
    __int16 v30 = 2114;
    uint64_t v31 = v14;
    id v17 = v16;
    _os_log_impl(&dword_221A52000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] local last modified: %{public}@", (uint8_t *)&v28, 0x16u);
  }
  id v18 = HKSPLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = objc_opt_class();
    int v28 = 138543618;
    __int16 v29 = v19;
    __int16 v30 = 2114;
    uint64_t v31 = v11;
    id v20 = v19;
    _os_log_impl(&dword_221A52000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] server last modified: %{public}@", (uint8_t *)&v28, 0x16u);
  }
  if ((NAEqualObjects() & 1) == 0)
  {
    if (v11 && !objc_msgSend(v14, "hksp_isAfterDate:", v11))
    {
      id v25 = HKSPLogForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = objc_opt_class();
        int v28 = 138543362;
        __int16 v29 = v26;
        id v27 = v26;
        _os_log_impl(&dword_221A52000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] server modified later, syncing from CloudKit", (uint8_t *)&v28, 0xCu);
      }
      __int16 v24 = [v4 keysToSync];
      [(HDSPSyncedDefaults *)self _syncKeysFromCloudKit:v24];
    }
    else
    {
      id v21 = HKSPLogForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = objc_opt_class();
        int v28 = 138543362;
        __int16 v29 = v22;
        id v23 = v22;
        _os_log_impl(&dword_221A52000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] local modified later, syncing to CloudKit", (uint8_t *)&v28, 0xCu);
      }
      __int16 v24 = [v4 keysToSync];
      [(HDSPSyncedDefaults *)self _syncKeysToCloudKit:v24];
    }
  }
}

- (void)resetCloudData
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] resetting", (uint8_t *)&v5, 0xCu);
  }
  [(HDSPSyncedUserDefaults *)self->_cloudDefaults hksp_reset];
}

- (HDSPSyncedUserDefaultsExternalChangeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDSPSyncedUserDefaultsExternalChangeDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)needsInitialSync
{
  return self->_needsInitialSync;
}

- (void)setNeedsInitialSync:(BOOL)a3
{
  self->_needsInitialSync = a3;
}

- (BOOL)needsSyncFromCloud
{
  return self->_needsSyncFromCloud;
}

- (void)setNeedsSyncFromCloud:(BOOL)a3
{
  self->_needsSyncFromCloud = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_syncAccumulator, 0);
  objc_storeStrong((id *)&self->_keysNeedingSynchronize, 0);
  objc_storeStrong((id *)&self->_cloudDefaults, 0);
  objc_storeStrong((id *)&self->_nanoDefaults, 0);
  objc_storeStrong((id *)&self->_localDefaults, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end