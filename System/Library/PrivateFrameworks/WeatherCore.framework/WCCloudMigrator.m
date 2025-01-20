@interface WCCloudMigrator
+ (BOOL)isRunningInTheWeatherAppProcess;
- (BOOL)storeRequiresMigration:(id)a3;
- (WCCloudMigrator)init;
- (WCDeviceLookup)deviceLookup;
- (void)eraseStoreIfNeeded:(id)a3;
- (void)migrateStore:(id)a3 toStore:(id)a4 completionBlock:(id)a5;
@end

@implementation WCCloudMigrator

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
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__WCCloudMigrator_migrateStore_toStore_completionBlock___block_invoke;
  v14[3] = &unk_1E60A1FA8;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  id v11 = v8;
  id v12 = v9;
  id v13 = v10;
  [v12 synchronizeWithCompletionHandler:v14];
}

- (WCCloudMigrator)init
{
  v7.receiver = self;
  v7.super_class = (Class)WCCloudMigrator;
  v2 = [(WCCloudMigrator *)&v7 init];
  if (v2)
  {
    if (+[WCCloudMigrator isRunningInTheWeatherAppProcess])
    {
      v3 = objc_alloc_init(WCDeviceLookup);
      p_super = &v2->_deviceLookup->super;
      v2->_deviceLookup = v3;
    }
    else
    {
      p_super = WCLogForCategory(2uLL);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1B4900000, p_super, OS_LOG_TYPE_DEFAULT, "Not running in the Weather app, skipping device lookup", v6, 2u);
      }
    }
  }
  return v2;
}

+ (BOOL)isRunningInTheWeatherAppProcess
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.weather"];

  return v4;
}

void __56__WCCloudMigrator_migrateStore_toStore_completionBlock___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    char v4 = WCLogForCategory(2uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __56__WCCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_cold_1((uint64_t)v3, v4);
    }

    v5 = (void (*)(void))*((void *)a1[7] + 2);
LABEL_10:
    v5();
    goto LABEL_11;
  }
  if (([a1[4] storeRequiresMigration:a1[5]] & 1) == 0)
  {
    id v9 = WCLogForCategory(2uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4900000, v9, OS_LOG_TYPE_DEFAULT, "Syncronized store, already migrated", buf, 2u);
    }

    v5 = (void (*)(void))*((void *)a1[7] + 2);
    goto LABEL_10;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__WCCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_2;
  v10[3] = &unk_1E60A1FA8;
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

void __56__WCCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B4900000, a2, OS_LOG_TYPE_ERROR, "Failed to migrate the store. Could not synchronize the toStore, error=%@", (uint8_t *)&v2, 0xCu);
}

void __56__WCCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = WCLogForCategory(2uLL);
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __56__WCCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_2_cold_1((uint64_t)v3, v5);
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
      _os_log_impl(&dword_1B4900000, v5, OS_LOG_TYPE_DEFAULT, "Migrating key-value store to encrypted store, contents=%@", buf, 0xCu);
    }
    id v7 = [*(id *)(a1 + 32) dictionaryRepresentation];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__WCCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_3;
    v8[3] = &unk_1E60A1F80;
    id v9 = *(id *)(a1 + 40);
    [v7 enumerateKeysAndObjectsUsingBlock:v8];

    [*(id *)(a1 + 40) setObject:&unk_1F0D523F8 forKey:@"version"];
    [*(id *)(a1 + 40) synchronize];
    [*(id *)(a1 + 48) eraseStoreIfNeeded:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __56__WCCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

- (void)eraseStoreIfNeeded:(id)a3
{
  id v4 = a3;
  if (!+[WCCloudMigrator isRunningInTheWeatherAppProcess])
  {
    id v9 = WCLogForCategory(2uLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    id v10 = "Not running in the Weather app, not erasing";
LABEL_8:
    _os_log_impl(&dword_1B4900000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
    goto LABEL_9;
  }
  v5 = [v4 dictionaryRepresentation];
  id v6 = [v5 allKeys];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    id v9 = WCLogForCategory(2uLL);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    id v10 = "Store empty, no erase required";
    goto LABEL_8;
  }
  id v8 = [(WCCloudMigrator *)self deviceLookup];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__WCCloudMigrator_eraseStoreIfNeeded___block_invoke;
  v11[3] = &unk_1E60A1FF8;
  uint64_t v12 = v4;
  objc_msgSend(v8, "checkAllDevicesRunningMinimumiOSVersion:macOSVersion:orInactiveForTimeInterval:completionHandler:", 14, 0, 10, 16, v11, 15552000.0);

  id v9 = v12;
LABEL_9:
}

void __38__WCCloudMigrator_eraseStoreIfNeeded___block_invoke(uint64_t a1, int a2)
{
  id v4 = WCLogForCategory(2uLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4900000, v4, OS_LOG_TYPE_DEFAULT, "Erasing store", buf, 2u);
    }

    id v6 = [*(id *)(a1 + 32) dictionaryRepresentation];
    uint64_t v7 = [v6 allKeys];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __38__WCCloudMigrator_eraseStoreIfNeeded___block_invoke_7;
    v8[3] = &unk_1E60A1FD0;
    id v9 = *(id *)(a1 + 32);
    [v7 enumerateObjectsUsingBlock:v8];

    [*(id *)(a1 + 32) synchronize];
    id v4 = v9;
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B4900000, v4, OS_LOG_TYPE_DEFAULT, "Non-encrypted store still in use, no erase needed", buf, 2u);
  }
}

uint64_t __38__WCCloudMigrator_eraseStoreIfNeeded___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObjectForKey:a2];
}

- (WCDeviceLookup)deviceLookup
{
  return self->_deviceLookup;
}

- (void).cxx_destruct
{
}

void __56__WCCloudMigrator_migrateStore_toStore_completionBlock___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B4900000, a2, OS_LOG_TYPE_ERROR, "Failed to migrate the store. Could not synchronize the fromStore, error=%@", (uint8_t *)&v2, 0xCu);
}

@end