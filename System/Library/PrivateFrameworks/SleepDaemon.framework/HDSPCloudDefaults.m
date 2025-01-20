@interface HDSPCloudDefaults
- (BOOL)hksp_BOOLForKey:(id)a3;
- (HDSPCloudDefaults)initWithEnvironment:(id)a3 configuration:(id)a4;
- (HDSPSyncedUserDefaultsExternalChangeDelegate)delegate;
- (float)hksp_floatForKey:(id)a3;
- (id)_createKVS;
- (id)hksp_dataForKey:(id)a3;
- (id)hksp_dictionaryRepresentation;
- (id)hksp_dictionaryRepresentationForKeys:(id)a3;
- (id)hksp_objectForKey:(id)a3;
- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4;
- (int64_t)hksp_integerForKey:(id)a3;
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
- (void)keyValueStoreDidChange:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HDSPCloudDefaults

- (HDSPCloudDefaults)initWithEnvironment:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HDSPCloudDefaults;
  v9 = [(HDSPCloudDefaults *)&v21 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_environment, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    uint64_t v11 = [(HDSPCloudDefaults *)v10 _createKVS];
    store = v10->_store;
    v10->_store = (NSUbiquitousKeyValueStore *)v11;

    objc_initWeak(&location, v10);
    id v13 = objc_alloc(MEMORY[0x263F75D90]);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __55__HDSPCloudDefaults_initWithEnvironment_configuration___block_invoke;
    v18[3] = &unk_2645DA2C8;
    objc_copyWeak(&v19, &location);
    uint64_t v14 = [v13 initWithInterval:v18 updateBlock:0.5];
    accumulator = v10->_accumulator;
    v10->_accumulator = (HKSPAccumulator *)v14;

    v16 = v10;
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __55__HDSPCloudDefaults_initWithEnvironment_configuration___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [WeakRetained delegate];
  char v5 = objc_opt_respondsToSelector();

  v6 = [WeakRetained delegate];
  id v7 = v6;
  if (v5) {
    [v6 syncedUserDefaults:WeakRetained didChangeExternallyForKeys:v8];
  }
  else {
    [v6 syncedUserDefaultsDidChangeExternally:WeakRetained];
  }
}

- (id)_createKVS
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F08C40]);
  v4 = [(HDSPEnvironment *)self->_environment behavior];
  char v5 = [v4 features];
  v6 = objc_msgSend(v3, "_initWithStoreIdentifier:usingEndToEndEncryption:", @"com.apple.sleepd", objc_msgSend(v5, "sleepCloudKitManatee"));

  if (!v6)
  {
    id v7 = HKSPLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v10 = 138543362;
      *(void *)&v10[4] = objc_opt_class();
      id v9 = *(id *)&v10[4];
      _os_log_error_impl(&dword_221A52000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to create NSUbiquitousKeyValueStore", v10, 0xCu);
    }
  }
  objc_msgSend(v6, "synchronize", *(_OWORD *)v10);

  return v6;
}

- (void)keyValueStoreDidChange:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543618;
    id v17 = (id)objc_opt_class();
    __int16 v18 = 2114;
    id v19 = v4;
    id v6 = v17;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] keyValueStoreDidChange: %{public}@", (uint8_t *)&v16, 0x16u);
  }
  id v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F085D8]];
  uint64_t v9 = [v8 integerValue];

  v10 = [v4 userInfo];
  uint64_t v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F085E0]];
  v12 = (void *)v11;
  id v13 = (void *)MEMORY[0x263EFFA68];
  if (v11) {
    id v13 = (void *)v11;
  }
  id v14 = v13;

  if ((unint64_t)(v9 - 1) >= 3)
  {
    if (!v9) {
      [(HKSPAccumulator *)self->_accumulator accumulateValues:v14];
    }
  }
  else
  {
    v15 = [(HDSPCloudDefaults *)self delegate];
    [v15 syncedUserDefaultsDidChangeExternally:self];
  }
}

- (void)hdsp_forceSynchronizeWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing full sync", buf, 0xCu);
  }
  store = self->_store;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__HDSPCloudDefaults_hdsp_forceSynchronizeWithCompletion___block_invoke;
  v9[3] = &unk_2645DA808;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(NSUbiquitousKeyValueStore *)store synchronizeWithCompletionHandler:v9];
}

void __57__HDSPCloudDefaults_hdsp_forceSynchronizeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HKSPLogForCategory();
  char v5 = v4;
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
  char v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2114;
    id v12 = v4;
    id v6 = v10;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] hdsp_setExternalChangeDelegate %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [(HDSPCloudDefaults *)self setDelegate:v4];
  uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel_keyValueStoreDidChange_ name:*MEMORY[0x263F085E8] object:self->_store];

  int v8 = [(HDSPEnvironment *)self->_environment notificationListener];
  [v8 addObserver:self];
}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([v5 isEqualToString:@"com.apple.kvs.store-did-change.com.apple.sleepd"])
  {
    id v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v10 = 138543618;
      *(void *)&v10[4] = objc_opt_class();
      *(_WORD *)&v10[12] = 2114;
      *(void *)&v10[14] = v5;
      id v7 = *(id *)&v10[4];
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] received %{public}@, synchronizing...", v10, 0x16u);
    }
    [(HDSPCloudDefaults *)self hksp_synchronize];
  }
  int v8 = objc_msgSend(MEMORY[0x263F58190], "futureWithNoResult", *(_OWORD *)v10, *(void *)&v10[16], v11);

  return v8;
}

- (id)hksp_objectForKey:(id)a3
{
  return [(NSUbiquitousKeyValueStore *)self->_store objectForKey:a3];
}

- (void)hksp_setObject:(id)a3 forKey:(id)a4
{
}

- (void)hksp_removeObjectForKey:(id)a3
{
}

- (BOOL)hksp_BOOLForKey:(id)a3
{
  return [(NSUbiquitousKeyValueStore *)self->_store BOOLForKey:a3];
}

- (void)hksp_setBool:(BOOL)a3 forKey:(id)a4
{
}

- (float)hksp_floatForKey:(id)a3
{
  id v3 = [(NSUbiquitousKeyValueStore *)self->_store objectForKey:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (void)hksp_setFloat:(float)a3 forKey:(id)a4
{
  store = self->_store;
  id v6 = NSNumber;
  id v7 = a4;
  *(float *)&double v8 = a3;
  id v9 = [v6 numberWithFloat:v8];
  [(NSUbiquitousKeyValueStore *)store setObject:v9 forKey:v7];
}

- (int64_t)hksp_integerForKey:(id)a3
{
  id v3 = [(NSUbiquitousKeyValueStore *)self->_store objectForKey:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)hksp_setInteger:(int64_t)a3 forKey:(id)a4
{
  store = self->_store;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInteger:a3];
  [(NSUbiquitousKeyValueStore *)store setObject:v8 forKey:v7];
}

- (id)hksp_dataForKey:(id)a3
{
  return [(NSUbiquitousKeyValueStore *)self->_store dataForKey:a3];
}

- (id)hksp_dictionaryRepresentation
{
  return [(NSUbiquitousKeyValueStore *)self->_store dictionaryRepresentation];
}

- (id)hksp_dictionaryRepresentationForKeys:(id)a3
{
  id v4 = a3;
  float v5 = [(HDSPCloudDefaults *)self hksp_dictionaryRepresentation];
  id v6 = objc_msgSend(v5, "hksp_dictionaryByFilteringKeys:", v4);

  return v6;
}

- (void)hksp_saveDictionary:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__HDSPCloudDefaults_hksp_saveDictionary___block_invoke;
  v3[3] = &unk_2645DA830;
  v3[4] = self;
  objc_msgSend(a3, "na_each:", v3);
}

uint64_t __41__HDSPCloudDefaults_hksp_saveDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "hksp_setObject:forKey:", a3, a2);
}

- (void)hksp_removeObjectsForKeys:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__HDSPCloudDefaults_hksp_removeObjectsForKeys___block_invoke;
  v3[3] = &unk_2645DA858;
  v3[4] = self;
  objc_msgSend(a3, "na_each:", v3);
}

uint64_t __47__HDSPCloudDefaults_hksp_removeObjectsForKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hksp_removeObjectForKey:", a2);
}

- (void)hksp_synchronize
{
}

- (void)hksp_synchronizeKeys:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  float v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v4;
    id v6 = v8;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_INFO, "[%{public}@] syncing keys: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [(HDSPCloudDefaults *)self hksp_synchronize];
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
  objc_storeStrong((id *)&self->_accumulator, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_environment, 0);
}

@end