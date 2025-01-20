@interface WeatherCloudPersistence
+ (BOOL)processIsWhitelistedForSync;
+ (id)cloudPersistenceWithDelegate:(id)a3;
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)isInitialSyncNotification:(id)a3;
- (BOOL)synchronize;
- (NSUbiquitousKeyValueStore)activeCloudStore;
- (NSUbiquitousKeyValueStore)encryptedStore;
- (NSUbiquitousKeyValueStore)nonEncryptedStore;
- (WeatherCloudMigrator)migrator;
- (WeatherCloudPersistence)init;
- (WeatherCloudPersistence)initWithDelegate:(id)a3;
- (WeatherCloudPersistenceDelegate)delegate;
- (id)arrayForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)objectForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (void)cloudCitiesChangedExternally:(id)a3;
- (void)encryptedStoreChanged:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setActiveCloudStore:(id)a3;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setEncryptedStore:(id)a3;
- (void)setNonEncryptedStore:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)synchronizeWithCompletionHandler:(id)a3;
@end

@implementation WeatherCloudPersistence

+ (BOOL)processIsWhitelistedForSync
{
  v2 = +[WeatherInternalPreferences sharedInternalPreferences];
  if ([v2 isInternalInstall])
  {
    v3 = +[WeatherInternalPreferences sharedInternalPreferences];
    v4 = [v3 objectForKey:@"DemoOverrideMode"];
    if ([v4 BOOLValue])
    {

      char v5 = 0;
LABEL_11:

      return v5;
    }
    char v7 = [(id)*MEMORY[0x263F1D020] launchedToTest];

    if ((v7 & 1) == 0)
    {
LABEL_7:
      v8 = [MEMORY[0x263F086E0] mainBundle];
      v2 = [v8 bundleIdentifier];

      if (([v2 isEqualToString:@"com.apple.weather"] & 1) != 0
        || ([v2 isEqualToString:@"com.apple.nanoweatherprefsd"] & 1) != 0)
      {
        char v5 = 1;
      }
      else
      {
        char v5 = [v2 isEqualToString:@"com.apple.weather.WeatherIntents"];
      }
      goto LABEL_11;
    }
  }
  else
  {
    char v6 = [(id)*MEMORY[0x263F1D020] launchedToTest];

    if ((v6 & 1) == 0) {
      goto LABEL_7;
    }
  }
  return 0;
}

+ (id)cloudPersistenceWithDelegate:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__WeatherCloudPersistence_cloudPersistenceWithDelegate___block_invoke;
  block[3] = &unk_2647E02D0;
  id v9 = v3;
  uint64_t v4 = cloudPersistenceWithDelegate__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&cloudPersistenceWithDelegate__onceToken, block);
  }
  id v6 = (id)cloudPersistenceWithDelegate__sharedCloudPersistence;

  return v6;
}

uint64_t __56__WeatherCloudPersistence_cloudPersistenceWithDelegate___block_invoke(uint64_t a1)
{
  v1 = [[WeatherCloudPersistence alloc] initWithDelegate:*(void *)(a1 + 32)];
  uint64_t v2 = cloudPersistenceWithDelegate__sharedCloudPersistence;
  cloudPersistenceWithDelegate__sharedCloudPersistence = (uint64_t)v1;
  return MEMORY[0x270F9A758](v1, v2);
}

- (WeatherCloudPersistence)init
{
  return [(WeatherCloudPersistence *)self initWithDelegate:0];
}

- (WeatherCloudPersistence)initWithDelegate:(id)a3
{
  v35.receiver = self;
  v35.super_class = (Class)WeatherCloudPersistence;
  id v3 = [(WeatherCloudPersistence *)&v35 init];
  if (v3)
  {
    if ([(id)objc_opt_class() processIsWhitelistedForSync])
    {
      uint64_t v4 = [MEMORY[0x263F08C40] defaultStore];
      nonEncryptedStore = v3->_nonEncryptedStore;
      v3->_nonEncryptedStore = (NSUbiquitousKeyValueStore *)v4;

      id v6 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v7 = *MEMORY[0x263F085E8];
      v8 = [(WeatherCloudPersistence *)v3 nonEncryptedStore];
      [v6 addObserver:v3 selector:sel_cloudCitiesChangedExternally_ name:v7 object:v8];

      id v9 = [MEMORY[0x263F85F60] sharedInstance];
      v10 = [v9 userInfoManager];
      uint64_t v11 = [v10 encryptedStore];
      encryptedStore = v3->_encryptedStore;
      v3->_encryptedStore = (NSUbiquitousKeyValueStore *)v11;

      v13 = [MEMORY[0x263F08A00] defaultCenter];
      v14 = [(WeatherCloudPersistence *)v3 encryptedStore];
      [v13 addObserver:v3 selector:sel_encryptedStoreChanged_ name:v7 object:v14];

      v15 = [MEMORY[0x263F08A00] defaultCenter];
      v16 = [(WeatherCloudPersistence *)v3 encryptedStore];
      [v15 addObserver:v3 selector:sel_cloudCitiesChangedExternally_ name:v7 object:v16];

      v17 = objc_alloc_init(WeatherCloudMigrator);
      migrator = v3->_migrator;
      v3->_migrator = v17;

      v19 = v3->_migrator;
      v20 = [(WeatherCloudPersistence *)v3 encryptedStore];
      LODWORD(v15) = [(WeatherCloudMigrator *)v19 storeRequiresMigration:v20];

      v21 = WALogForCategory(14);
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (v22)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_226D1D000, v21, OS_LOG_TYPE_DEFAULT, "Store might require migration, starting migrator", buf, 2u);
        }

        v23 = [(WeatherCloudPersistence *)v3 nonEncryptedStore];
        [(WeatherCloudPersistence *)v3 setActiveCloudStore:v23];

        v24 = v3->_migrator;
        v25 = [(WeatherCloudPersistence *)v3 nonEncryptedStore];
        v26 = [(WeatherCloudPersistence *)v3 encryptedStore];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __44__WeatherCloudPersistence_initWithDelegate___block_invoke;
        v32[3] = &unk_2647E04B8;
        v33 = v3;
        [(WeatherCloudMigrator *)v24 migrateStore:v25 toStore:v26 completionBlock:v32];
      }
      else
      {
        if (v22)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_226D1D000, v21, OS_LOG_TYPE_DEFAULT, "Store doesn't require migration", buf, 2u);
        }

        v27 = [(WeatherCloudPersistence *)v3 encryptedStore];
        [(WeatherCloudPersistence *)v3 setActiveCloudStore:v27];

        v28 = v3->_migrator;
        v29 = [(WeatherCloudPersistence *)v3 nonEncryptedStore];
        [(WeatherCloudMigrator *)v28 eraseStoreIfNeeded:v29];

        [(WeatherCloudPersistence *)v3 synchronize];
      }
    }
    v30 = v3;
  }

  return v3;
}

void __44__WeatherCloudPersistence_initWithDelegate___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) encryptedStore];
    [*(id *)(a1 + 32) setActiveCloudStore:v3];

    uint64_t v4 = WALogForCategory(14);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_226D1D000, v4, OS_LOG_TYPE_DEFAULT, "Migrator finished processing, notifying clients of store change", v7, 2u);
    }

    id v5 = [MEMORY[0x263F089F8] notificationWithName:@"WeatherCloudStoreChangedExternally" object:*(void *)(a1 + 32) userInfo:0];
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotification:v5];

    [*(id *)(a1 + 32) synchronize];
  }
  else
  {
    id v5 = WALogForCategory(14);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __44__WeatherCloudPersistence_initWithDelegate___block_invoke_cold_1(a1, v5);
    }
  }
}

- (void)cloudCitiesChangedExternally:(id)a3
{
  id v4 = a3;
  id v5 = [(WeatherCloudPersistence *)self activeCloudStore];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__WeatherCloudPersistence_cloudCitiesChangedExternally___block_invoke;
  v7[3] = &unk_2647E0900;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 synchronizeWithCompletionHandler:v7];
}

void __56__WeatherCloudPersistence_cloudCitiesChangedExternally___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) isInitialSyncNotification:*(void *)(a1 + 40)];
  uint64_t v7 = @"WeatherCloudStoreIsInitialSyncKey";
  id v3 = [NSNumber numberWithBool:v2];
  v8[0] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];

  id v5 = [MEMORY[0x263F089F8] notificationWithName:@"WeatherCloudStoreChangedExternally" object:*(void *)(a1 + 32) userInfo:v4];
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotification:v5];
}

- (BOOL)isInitialSyncNotification:(id)a3
{
  id v3 = [a3 userInfo];
  id v4 = [v3 objectForKey:*MEMORY[0x263F085D8]];
  int v5 = [v4 intValue];

  return (v5 & 0xFFFFFFFD) == 1;
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  int v5 = [(WeatherCloudPersistence *)self activeCloudStore];
  id v6 = [v5 arrayForKey:v4];

  return v6;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  int v5 = [(WeatherCloudPersistence *)self activeCloudStore];
  id v6 = [v5 dictionaryForKey:v4];

  return v6;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  int v5 = [(WeatherCloudPersistence *)self activeCloudStore];
  id v6 = [v5 stringForKey:v4];

  return v6;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  int v5 = [(WeatherCloudPersistence *)self activeCloudStore];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WeatherCloudPersistence *)self activeCloudStore];
  [v8 setObject:v7 forKey:v6];
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(WeatherCloudPersistence *)self activeCloudStore];
  [v5 removeObjectForKey:v4];
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(WeatherCloudPersistence *)self activeCloudStore];
  char v6 = [v5 BOOLForKey:v4];

  return v6;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(WeatherCloudPersistence *)self activeCloudStore];
  [v7 setBool:v4 forKey:v6];
}

- (BOOL)synchronize
{
  id v3 = [(WeatherCloudPersistence *)self activeCloudStore];

  if (!v3) {
    return 0;
  }
  BOOL v4 = [(WeatherCloudPersistence *)self activeCloudStore];
  char v5 = [v4 synchronize];

  id v6 = [(WeatherCloudPersistence *)self delegate];
  [v6 cloudPersistenceDidSynchronize:self];

  return v5;
}

- (void)synchronizeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(WeatherCloudPersistence *)self activeCloudStore];
  [v5 synchronizeWithCompletionHandler:v4];
}

- (void)encryptedStoreChanged:(id)a3
{
  id v12 = a3;
  id v4 = [(WeatherCloudPersistence *)self encryptedStore];
  id v5 = [(WeatherCloudPersistence *)self activeCloudStore];

  if (v4 != v5)
  {
    id v6 = [(WeatherCloudPersistence *)self migrator];
    id v7 = [(WeatherCloudPersistence *)self encryptedStore];
    char v8 = [v6 storeRequiresMigration:v7];

    if (v8)
    {
      [(WeatherCloudPersistence *)self cloudCitiesChangedExternally:v12];
    }
    else
    {
      id v9 = [(WeatherCloudPersistence *)self encryptedStore];
      [(WeatherCloudPersistence *)self setActiveCloudStore:v9];

      v10 = [MEMORY[0x263F089F8] notificationWithName:@"WeatherCloudStoreChangedExternally" object:self userInfo:0];
      uint64_t v11 = [MEMORY[0x263F08A00] defaultCenter];
      [v11 postNotification:v10];
    }
  }
}

- (WeatherCloudPersistenceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WeatherCloudPersistenceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WeatherCloudMigrator)migrator
{
  return self->_migrator;
}

- (NSUbiquitousKeyValueStore)activeCloudStore
{
  return self->_activeCloudStore;
}

- (void)setActiveCloudStore:(id)a3
{
}

- (NSUbiquitousKeyValueStore)nonEncryptedStore
{
  return self->_nonEncryptedStore;
}

- (void)setNonEncryptedStore:(id)a3
{
}

- (NSUbiquitousKeyValueStore)encryptedStore
{
  return self->_encryptedStore;
}

- (void)setEncryptedStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedStore, 0);
  objc_storeStrong((id *)&self->_nonEncryptedStore, 0);
  objc_storeStrong((id *)&self->_activeCloudStore, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __44__WeatherCloudPersistence_initWithDelegate___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = [*(id *)(a1 + 32) nonEncryptedStore];
  id v5 = [v4 dictionaryRepresentation];
  id v6 = [*(id *)(a1 + 32) encryptedStore];
  id v7 = [v6 dictionaryRepresentation];
  int v8 = 138412546;
  id v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_226D1D000, a2, OS_LOG_TYPE_ERROR, "Migration failed, fromContents=%@, toContents=%@", (uint8_t *)&v8, 0x16u);
}

@end