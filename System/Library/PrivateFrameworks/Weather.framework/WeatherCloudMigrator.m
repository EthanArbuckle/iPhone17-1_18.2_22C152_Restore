@interface WeatherCloudMigrator
- (BOOL)storeRequiresMigration:(id)a3;
- (WeatherCloudMigrator)init;
- (WeatherDeviceLookup)deviceLookup;
- (void)eraseStoreIfNeeded:(id)a3;
- (void)migrateStore:(id)a3 toStore:(id)a4 completionBlock:(id)a5;
@end

@implementation WeatherCloudMigrator

- (WeatherCloudMigrator)init
{
  v6.receiver = self;
  v6.super_class = (Class)WeatherCloudMigrator;
  v2 = [(WeatherCloudMigrator *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(WeatherDeviceLookup);
    deviceLookup = v2->_deviceLookup;
    v2->_deviceLookup = v3;
  }
  return v2;
}

- (BOOL)storeRequiresMigration:(id)a3
{
  v3 = [a3 objectForKey:@"version"];
  uint64_t v4 = [v3 integerValue];

  return v4 < 1;
}

- (void)migrateStore:(id)a3 toStore:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61__WeatherCloudMigrator_migrateStore_toStore_completionBlock___block_invoke;
  v14[3] = &unk_2647E0440;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  id v11 = v8;
  id v12 = v9;
  id v13 = v10;
  [v12 synchronizeWithCompletionHandler:v14];
}

void __61__WeatherCloudMigrator_migrateStore_toStore_completionBlock___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = WALogForCategory(14);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61__WeatherCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_cold_1((uint64_t)v3, v4);
    }

    v5 = (void (*)(void))*((void *)a1[7] + 2);
LABEL_10:
    v5();
    goto LABEL_11;
  }
  if (([a1[4] storeRequiresMigration:a1[5]] & 1) == 0)
  {
    id v9 = WALogForCategory(14);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226D1D000, v9, OS_LOG_TYPE_DEFAULT, "Syncronized store, already migrated", buf, 2u);
    }

    v5 = (void (*)(void))*((void *)a1[7] + 2);
    goto LABEL_10;
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__WeatherCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_1;
  v10[3] = &unk_2647E0440;
  id v6 = a1[6];
  id v14 = a1[7];
  id v11 = a1[6];
  id v7 = a1[5];
  id v8 = a1[4];
  id v12 = v7;
  id v13 = v8;
  [v6 synchronizeWithCompletionHandler:v10];

LABEL_11:
}

void __61__WeatherCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_1(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = WALogForCategory(14);
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61__WeatherCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_1_cold_1((uint64_t)v3, v5);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) dictionaryRepresentation];
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_226D1D000, v5, OS_LOG_TYPE_DEFAULT, "Migrating key-value store to encrypted store, contents=%@", buf, 0xCu);
    }
    id v7 = [*(id *)(a1 + 32) dictionaryRepresentation];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __61__WeatherCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_2;
    v8[3] = &unk_2647E0418;
    id v9 = *(id *)(a1 + 40);
    [v7 enumerateKeysAndObjectsUsingBlock:v8];

    [*(id *)(a1 + 40) setObject:&unk_26DAEAEF8 forKey:@"version"];
    [*(id *)(a1 + 40) synchronize];
    [*(id *)(a1 + 48) eraseStoreIfNeeded:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __61__WeatherCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

- (void)eraseStoreIfNeeded:(id)a3
{
  id v4 = a3;
  v5 = [v4 dictionaryRepresentation];
  id v6 = [v5 allKeys];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = +[WeatherInternalPreferences sharedInternalPreferences];
    unint64_t v9 = [v8 deviceInactivityThreshold];

    double v10 = 0.0;
    if (v9 <= 5) {
      double v10 = dbl_226D6EF08[v9];
    }
    id v11 = [(WeatherCloudMigrator *)self deviceLookup];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __43__WeatherCloudMigrator_eraseStoreIfNeeded___block_invoke;
    v13[3] = &unk_2647E0490;
    id v14 = v4;
    objc_msgSend(v11, "checkAllDevicesRunningMinimumiOSVersion:macOSVersion:orInactiveForTimeInterval:completionHandler:", 14, 0, 10, 16, v13, v10);

    uint64_t v12 = v14;
  }
  else
  {
    uint64_t v12 = WALogForCategory(14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226D1D000, v12, OS_LOG_TYPE_DEFAULT, "Store empty, no erase required", buf, 2u);
    }
  }
}

void __43__WeatherCloudMigrator_eraseStoreIfNeeded___block_invoke(uint64_t a1, int a2)
{
  id v4 = WALogForCategory(14);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226D1D000, v4, OS_LOG_TYPE_DEFAULT, "Erasing store", buf, 2u);
    }

    id v6 = [*(id *)(a1 + 32) dictionaryRepresentation];
    uint64_t v7 = [v6 allKeys];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __43__WeatherCloudMigrator_eraseStoreIfNeeded___block_invoke_7;
    v8[3] = &unk_2647E0468;
    unint64_t v9 = *(id *)(a1 + 32);
    [v7 enumerateObjectsUsingBlock:v8];

    [*(id *)(a1 + 32) synchronize];
    id v4 = v9;
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226D1D000, v4, OS_LOG_TYPE_DEFAULT, "Non-encrypted store still in use, no erase needed", buf, 2u);
  }
}

uint64_t __43__WeatherCloudMigrator_eraseStoreIfNeeded___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObjectForKey:a2];
}

- (WeatherDeviceLookup)deviceLookup
{
  return self->_deviceLookup;
}

- (void).cxx_destruct
{
}

void __61__WeatherCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226D1D000, a2, OS_LOG_TYPE_ERROR, "Failed to migrate the store. Could not synchronize the toStore, error=%@", (uint8_t *)&v2, 0xCu);
}

void __61__WeatherCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_1_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226D1D000, a2, OS_LOG_TYPE_ERROR, "Failed to migrate the store. Could not synchronize the fromStore, error=%@", (uint8_t *)&v2, 0xCu);
}

@end