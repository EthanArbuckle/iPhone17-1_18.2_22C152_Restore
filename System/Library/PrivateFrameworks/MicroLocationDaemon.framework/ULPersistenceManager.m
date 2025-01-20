@interface ULPersistenceManager
+ (id)defaultLocalStoreFilename;
+ (id)defaultModelsDirectory;
- (BOOL)_destroyStore;
- (BOOL)_disconnectFromStore;
- (BOOL)_excludeDirectoryFromTimeMachineBackup:(id)a3;
- (BOOL)_isMainDatabase;
- (BOOL)_isStoreConnected;
- (BOOL)connectToStore;
- (BOOL)destroyStore;
- (BOOL)disconnectFromStore;
- (BOOL)isMainDatabase;
- (BOOL)isStoreConnected;
- (BOOL)useWal;
- (NSManagedObjectModel)managedObjectModel;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (NSURL)modelsDirectory;
- (NSURL)storesDirectory;
- (OS_dispatch_queue)queue;
- (ULDataContainer)dataContainer;
- (ULPersistenceManager)init;
- (ULPersistenceManager)initWithModelsDirectory:(id)a3 storesDirectory:(id)a4 managedObjectModel:(id)a5 useWal:(BOOL)a6;
- (ULPersistenceManager)initWithModelsDirectory:(id)a3 storesDirectory:(id)a4 useWal:(BOOL)a5;
- (ULPersistenceStore)persistenceStore;
- (id)_getDefaultStoresDirectory;
- (id)_getDefaultStoresDirectoryPathForCurrentPlatform;
- (id)_getLocalStoreURL;
- (id)createManagedObjectContext;
- (id)getLocalStoreURL;
- (void)_deleteDatabaseFilesAtPath:(id)a3;
- (void)_exitProcessWithFailureCode;
- (void)_handleCorruptedDatabase:(id)a3;
- (void)_handleDatabaseError:(id)a3;
- (void)handleDatabaseError:(id)a3;
- (void)setDataContainer:(id)a3;
- (void)setManagedObjectModel:(id)a3;
- (void)setModelsDirectory:(id)a3;
- (void)setPersistenceStore:(id)a3;
- (void)setPersistentStoreCoordinator:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStoresDirectory:(id)a3;
- (void)setUseWal:(BOOL)a3;
@end

@implementation ULPersistenceManager

- (BOOL)isStoreConnected
{
  v2 = self;
  v3 = [(ULPersistenceManager *)self queue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v4 = [(ULPersistenceManager *)v2 queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__ULPersistenceManager_isStoreConnected__block_invoke;
  v6[3] = &unk_2653F9310;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

uint64_t __40__ULPersistenceManager_isStoreConnected__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isStoreConnected];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_isStoreConnected
{
  v2 = [(ULPersistenceManager *)self persistentStoreCoordinator];
  v3 = [v2 persistentStores];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (ULPersistenceManager)init
{
  v3 = +[ULPersistenceManager defaultModelsDirectory];
  BOOL v4 = [(ULPersistenceManager *)self _getDefaultStoresDirectory];
  v5 = [(ULPersistenceManager *)self initWithModelsDirectory:v3 storesDirectory:v4 useWal:1];

  return v5;
}

- (ULPersistenceManager)initWithModelsDirectory:(id)a3 storesDirectory:(id)a4 useWal:(BOOL)a5
{
  return [(ULPersistenceManager *)self initWithModelsDirectory:a3 storesDirectory:a4 managedObjectModel:0 useWal:a5];
}

- (ULPersistenceManager)initWithModelsDirectory:(id)a3 storesDirectory:(id)a4 managedObjectModel:(id)a5 useWal:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (![v10 isFileURL] || !objc_msgSend(v11, "isFileURL")) {
    goto LABEL_19;
  }
  v48.receiver = self;
  v48.super_class = (Class)ULPersistenceManager;
  self = [(ULPersistenceManager *)&v48 init];
  if (self)
  {
    v13 = NSURL;
    v14 = [v10 path];
    v15 = [v13 fileURLWithPath:v14 isDirectory:1];
    [(ULPersistenceManager *)self setModelsDirectory:v15];

    v16 = NSURL;
    v17 = [v11 path];
    v18 = [v16 fileURLWithPath:v17 isDirectory:1];
    [(ULPersistenceManager *)self setStoresDirectory:v18];

    [(ULPersistenceManager *)self setUseWal:v6];
    [(ULPersistenceManager *)self _enableConcurrencyDebug];
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_126);
    }
    v19 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      v21 = [(ULPersistenceManager *)self storesDirectory];
      v22 = [v21 path];
      v23 = [(ULPersistenceManager *)self modelsDirectory];
      v24 = [v23 path];
      *(_DWORD *)buf = 68289539;
      *(_DWORD *)v51 = 0;
      *(_WORD *)&v51[4] = 2082;
      *(void *)&v51[6] = "";
      __int16 v52 = 2113;
      v53 = v22;
      __int16 v54 = 2113;
      v55 = v24;
      _os_log_impl(&dword_25631F000, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Initializing database\", \"store directory\":%{private, location:escape_only}@, \"model directory\":%{private, location:escape_only}@}", buf, 0x26u);
    }
    v25 = [(objc_class *)getSAPathManagerClass() defaultManager];
    v26 = [(ULPersistenceManager *)self storesDirectory];
    v27 = [v26 path];

    Class SAPathInfoClass = getSAPathInfoClass();
    v29 = [NSURL fileURLWithPath:v27];
    v30 = [(objc_class *)SAPathInfoClass pathInfoWithURL:v29];
    v49 = v30;
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __90__ULPersistenceManager_initWithModelsDirectory_storesDirectory_managedObjectModel_useWal___block_invoke;
    v47[3] = &unk_2653FA398;
    v47[4] = v27;
    [v25 registerPaths:v31 forBundleID:@"com.apple.milod" completionHandler:v47];

    if (v12)
    {
      [(ULPersistenceManager *)self setManagedObjectModel:v12];
    }
    else
    {
      id v32 = objc_alloc(MEMORY[0x263EFF298]);
      v33 = [(ULPersistenceManager *)self modelsDirectory];
      v34 = (void *)[v32 initWithContentsOfURL:v33];
      [(ULPersistenceManager *)self setManagedObjectModel:v34];
    }
    v35 = [(ULPersistenceManager *)self managedObjectModel];

    if (v35)
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_126);
      }
      v36 = (void *)logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        v37 = v36;
        v38 = [(ULPersistenceManager *)self managedObjectModel];
        v39 = [v38 versionIdentifiers];
        *(_DWORD *)buf = 138412290;
        *(void *)v51 = v39;
        _os_log_impl(&dword_25631F000, v37, OS_LOG_TYPE_DEFAULT, "Loaded ManagedObjectModel Version: %@", buf, 0xCu);
      }
      id v40 = objc_alloc(MEMORY[0x263EFF320]);
      v41 = [(ULPersistenceManager *)self managedObjectModel];
      v42 = (void *)[v40 initWithManagedObjectModel:v41];
      [(ULPersistenceManager *)self setPersistentStoreCoordinator:v42];

      v43 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v44 = dispatch_queue_create("com.apple.milod.ULPersistenceManager", v43);
      [(ULPersistenceManager *)self setQueue:v44];

      goto LABEL_17;
    }

LABEL_19:
    v45 = 0;
    goto LABEL_20;
  }
LABEL_17:
  self = self;
  v45 = self;
LABEL_20:

  return v45;
}

void __90__ULPersistenceManager_initWithModelsDirectory_storesDirectory_managedObjectModel_useWal___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_126);
    }
    uint64_t v4 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v12 = 138412546;
      uint64_t v13 = v5;
      __int16 v14 = 2112;
      id v15 = v3;
      BOOL v6 = "Failed to set space attribution for %@. Error: %@";
      uint64_t v7 = v4;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      uint32_t v9 = 22;
LABEL_10:
      _os_log_impl(&dword_25631F000, v7, v8, v6, (uint8_t *)&v12, v9);
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_126);
    }
    uint64_t v10 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138412290;
      uint64_t v13 = v11;
      BOOL v6 = "Set space attribution for %@";
      uint64_t v7 = v10;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
      uint32_t v9 = 12;
      goto LABEL_10;
    }
  }
}

- (BOOL)connectToStore
{
  v2 = self;
  id v3 = [(ULPersistenceManager *)self queue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v7 = 0;
  os_log_type_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  uint64_t v4 = [(ULPersistenceManager *)v2 queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__ULPersistenceManager_connectToStore__block_invoke;
  v6[3] = &unk_2653FA3C0;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

void __38__ULPersistenceManager_connectToStore__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) _isStoreConnected] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 32) _getLocalStoreURL];
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_126);
    }
    id v3 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = v3;
      uint64_t v5 = [v2 path];
      *(_DWORD *)buf = 68289283;
      int v15 = 0;
      __int16 v16 = 2082;
      v17 = "";
      __int16 v18 = 2113;
      v19 = v5;
      _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Connecting to store\", \"store path\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    BOOL v6 = -[ULPersistenceStore initWithURL:useWal:]([ULPersistenceStore alloc], "initWithURL:useWal:", v2, [*(id *)(a1 + 32) useWal]);
    [*(id *)(a1 + 32) setPersistenceStore:v6];

    uint64_t v7 = [*(id *)(a1 + 32) persistenceStore];
    os_log_type_t v8 = [*(id *)(a1 + 32) persistentStoreCoordinator];
    id v13 = 0;
    char v9 = [v7 loadWithCoordinator:v8 error:&v13];
    id v10 = v13;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;

    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_126);
    }
    uint64_t v11 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      *(_DWORD *)buf = 67109120;
      int v15 = v12;
      _os_log_impl(&dword_25631F000, v11, OS_LOG_TYPE_DEFAULT, "Connect to store result: %d", buf, 8u);
    }
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      [*(id *)(a1 + 32) _handleDatabaseError:v10];
    }
  }
}

- (BOOL)_disconnectFromStore
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([(ULPersistenceManager *)self _isStoreConnected])
  {
    id v3 = [(ULPersistenceManager *)self persistentStoreCoordinator];
    uint64_t v4 = [v3 persistentStores];
    uint64_t v5 = [v4 firstObject];

    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_126);
    }
    BOOL v6 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v6;
      os_log_type_t v8 = [v5 URL];
      char v9 = [v8 path];
      *(_DWORD *)buf = 68289283;
      *(_DWORD *)uint64_t v20 = 0;
      *(_WORD *)&v20[4] = 2082;
      *(void *)&v20[6] = "";
      *(_WORD *)&v20[14] = 2113;
      *(void *)&v20[16] = v9;
      _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Disconnecting from store\", \"store path\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    id v10 = [(ULPersistenceManager *)self persistentStoreCoordinator];
    id v18 = 0;
    [v10 removePersistentStore:v5 error:&v18];
    id v11 = v18;

    if (v11)
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_126);
      }
      int v12 = (void *)logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        id v13 = v12;
        __int16 v14 = [v5 URL];
        *(_DWORD *)buf = 138412546;
        *(void *)uint64_t v20 = v14;
        *(_WORD *)&v20[8] = 2112;
        *(void *)&v20[10] = v11;
        _os_log_impl(&dword_25631F000, v13, OS_LOG_TYPE_ERROR, "Failed to disconnect from store %@ with error %@", buf, 0x16u);
      }
    }
    BOOL v15 = ![(ULPersistenceManager *)self _isStoreConnected];
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_126);
    }
    __int16 v16 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)uint64_t v20 = v15;
      _os_log_impl(&dword_25631F000, v16, OS_LOG_TYPE_DEFAULT, "Disconnect from store result: %d", buf, 8u);
    }
  }
  else
  {
    LOBYTE(v15) = 1;
  }
  return v15;
}

- (BOOL)disconnectFromStore
{
  v2 = self;
  id v3 = [(ULPersistenceManager *)self queue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v7 = 0;
  os_log_type_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  uint64_t v4 = [(ULPersistenceManager *)v2 queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__ULPersistenceManager_disconnectFromStore__block_invoke;
  v6[3] = &unk_2653F9310;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

uint64_t __43__ULPersistenceManager_disconnectFromStore__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _disconnectFromStore];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)createManagedObjectContext
{
  id v3 = [(ULPersistenceManager *)self queue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__23;
  int v12 = __Block_byref_object_dispose__23;
  id v13 = 0;
  uint64_t v4 = [(ULPersistenceManager *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__ULPersistenceManager_createManagedObjectContext__block_invoke;
  v7[3] = &unk_2653FA3C0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __50__ULPersistenceManager_createManagedObjectContext__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isStoreConnected];
  if (result)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFF288]) initWithConcurrencyType:1];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    BOOL v6 = [MEMORY[0x263EFF2B0] errorMergePolicy];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setMergePolicy:v6];

    uint64_t v7 = [*(id *)(a1 + 32) persistentStoreCoordinator];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setPersistentStoreCoordinator:v7];

    uint64_t v8 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v9 = [v8 processName];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setName:v9];

    uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) name];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setTransactionAuthor:v10];

    id v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    return [v11 setUndoManager:0];
  }
  return result;
}

+ (id)defaultModelsDirectory
{
  v2 = NSURL;
  uint64_t v3 = [MEMORY[0x263F086E0] ULFrameworkBundle];
  uint64_t v4 = [v3 pathForResource:@"milo" ofType:@"momd"];
  id v5 = [v2 fileURLWithPath:v4 isDirectory:1];

  return v5;
}

+ (id)defaultLocalStoreFilename
{
  return (id)[@"milo" stringByAppendingPathExtension:@"db"];
}

- (BOOL)_excludeDirectoryFromTimeMachineBackup:(id)a3
{
  return 1;
}

- (id)_getDefaultStoresDirectoryPathForCurrentPlatform
{
  v2 = [MEMORY[0x263F08850] userLibraryDirectoryPath];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 stringByAppendingPathComponent:@"com.apple.milod"];
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_126);
    }
    id v5 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_ERROR, "Failed to resolve Cache Directory in User Space", v7, 2u);
    }
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_getDefaultStoresDirectory
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [(ULPersistenceManager *)self _getDefaultStoresDirectoryPathForCurrentPlatform];
  uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
  char v4 = [v3 fileExistsAtPath:v2];

  if ((v4 & 1) != 0
    || (([MEMORY[0x263F08850] defaultManager],
         id v5 = objc_claimAutoreleasedReturnValue(),
         id v12 = 0,
         v6 = [v5 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:&v12], id v7 = v12, v5, v6)? (v8 = v7 == 0): (v8 = 0), v8))
  {
    uint64_t v10 = [NSURL fileURLWithPath:v2 isDirectory:1];
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_126);
    }
    uint64_t v9 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v14 = v2;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_25631F000, v9, OS_LOG_TYPE_ERROR, "Failed to create %@, error, %@", buf, 0x16u);
    }

    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_getLocalStoreURL
{
  v2 = [(ULPersistenceManager *)self storesDirectory];
  uint64_t v3 = +[ULPersistenceManager defaultLocalStoreFilename];
  char v4 = [v2 URLByAppendingPathComponent:v3];

  return v4;
}

- (id)getLocalStoreURL
{
  uint64_t v3 = [(ULPersistenceManager *)self queue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__23;
  id v12 = __Block_byref_object_dispose__23;
  id v13 = 0;
  char v4 = [(ULPersistenceManager *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__ULPersistenceManager_getLocalStoreURL__block_invoke;
  v7[3] = &unk_2653F9310;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __40__ULPersistenceManager_getLocalStoreURL__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _getLocalStoreURL];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)_isMainDatabase
{
  uint64_t v3 = [(ULPersistenceManager *)self _getDefaultStoresDirectory];
  char v4 = +[ULPersistenceManager defaultLocalStoreFilename];
  id v5 = [v3 URLByAppendingPathComponent:v4];

  int v6 = [(ULPersistenceManager *)self _getLocalStoreURL];
  LOBYTE(v3) = [v6 isEqual:v5];

  return (char)v3;
}

- (BOOL)isMainDatabase
{
  uint64_t v2 = self;
  uint64_t v3 = [(ULPersistenceManager *)self queue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  char v4 = [(ULPersistenceManager *)v2 queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__ULPersistenceManager_isMainDatabase__block_invoke;
  v6[3] = &unk_2653F9310;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

uint64_t __38__ULPersistenceManager_isMainDatabase__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isMainDatabase];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)destroyStore
{
  uint64_t v2 = self;
  uint64_t v3 = [(ULPersistenceManager *)self queue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  char v4 = [(ULPersistenceManager *)v2 queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__ULPersistenceManager_destroyStore__block_invoke;
  v6[3] = &unk_2653F9310;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

uint64_t __36__ULPersistenceManager_destroyStore__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _destroyStore];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_destroyStore
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ULPersistenceManager *)self persistenceStore];
  char v4 = [v3 storeDescription];

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_126);
  }
  id v5 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
  {
    int v6 = v5;
    uint64_t v7 = [v4 URL];
    uint64_t v8 = [v7 path];
    *(_DWORD *)buf = 68289283;
    int v26 = 0;
    __int16 v27 = 2082;
    v28 = "";
    __int16 v29 = 2113;
    id v30 = v8;
    _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Destroying local store\", \"store path\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_126);
  }
  uint64_t v9 = (void *)logObject_MicroLocation_Default;
  if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
  {
    char v10 = v9;
    id v11 = [v4 URL];
    id v12 = [v11 path];
    *(_DWORD *)buf = 68289283;
    int v26 = 0;
    __int16 v27 = 2082;
    v28 = "";
    __int16 v29 = 2113;
    id v30 = v12;
    _os_signpost_emit_with_name_impl(&dword_25631F000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Destroying local store", "{\"msg%{public}.0s\":\"Destroying local store\", \"store path\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  if ([(ULPersistenceManager *)self _disconnectFromStore])
  {
    id v13 = objc_alloc(MEMORY[0x263EFF320]);
    __int16 v14 = [(ULPersistenceManager *)self managedObjectModel];
    __int16 v15 = (void *)[v13 initWithManagedObjectModel:v14];

    id v16 = [v4 URL];
    uint64_t v17 = [v4 type];
    id v18 = [v4 options];
    id v24 = 0;
    char v19 = [v15 destroyPersistentStoreAtURL:v16 withType:v17 options:v18 error:&v24];
    id v20 = v24;

    if ((v19 & 1) == 0)
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_126);
      }
      uint64_t v21 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289282;
        int v26 = 0;
        __int16 v27 = 2082;
        v28 = "";
        __int16 v29 = 2114;
        id v30 = v20;
        _os_log_impl(&dword_25631F000, v21, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Destroy store failed with error\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
      }
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_126);
      }
      v22 = logObject_MicroLocation_Default;
      if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
      {
        *(_DWORD *)buf = 68289282;
        int v26 = 0;
        __int16 v27 = 2082;
        v28 = "";
        __int16 v29 = 2114;
        id v30 = v20;
        _os_signpost_emit_with_name_impl(&dword_25631F000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Destroy store failed with error", "{\"msg%{public}.0s\":\"Destroy store failed with error\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
      }
    }
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (void)handleDatabaseError:(id)a3
{
  id v4 = a3;
  id v5 = [(ULPersistenceManager *)self queue];
  dispatch_assert_queue_not_V2(v5);

  int v6 = [(ULPersistenceManager *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__ULPersistenceManager_handleDatabaseError___block_invoke;
  v8[3] = &unk_2653F9228;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

uint64_t __44__ULPersistenceManager_handleDatabaseError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDatabaseError:*(void *)(a1 + 40)];
}

- (void)_handleDatabaseError:(id)a3
{
  id v13 = a3;
  BOOL v4 = [(ULPersistenceManager *)self _isMainDatabase];
  id v5 = v13;
  if (v4)
  {
    int v6 = [v13 domain];
    uint64_t v7 = *MEMORY[0x263EFF150];
    int v8 = [v6 isEqualToString:*MEMORY[0x263EFF150]];

    if (v8)
    {
      id v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "code"));
    }
    else
    {
      char v10 = [v13 userInfo];
      id v9 = [v10 objectForKeyedSubscript:v7];
    }
    int v11 = [v9 intValue];
    if (v11 == 26 || v11 == 11)
    {
      [(ULPersistenceManager *)self _handleCorruptedDatabase:v13];
      [(ULPersistenceManager *)self _exitProcessWithFailureCode];
    }

    id v5 = v13;
  }
}

- (void)_exitProcessWithFailureCode
{
}

- (void)_handleCorruptedDatabase:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ULPersistenceManager *)self _getLocalStoreURL];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_126);
  }
  int v6 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_FAULT))
  {
    uint64_t v7 = v6;
    int v8 = [v5 path];
    int v12 = 68289539;
    int v13 = 0;
    __int16 v14 = 2082;
    __int16 v15 = "";
    __int16 v16 = 2114;
    id v17 = v4;
    __int16 v18 = 2113;
    char v19 = v8;
    _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Sqlite returned error indicating database corruption. deleting database and exiting\", \"error\":%{public, location:escape_only}@, \"store path\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x26u);
  }
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_126);
  }
  id v9 = (void *)logObject_MicroLocation_Default;
  if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
  {
    char v10 = v9;
    int v11 = [v5 path];
    int v12 = 68289539;
    int v13 = 0;
    __int16 v14 = 2082;
    __int16 v15 = "";
    __int16 v16 = 2114;
    id v17 = v4;
    __int16 v18 = 2113;
    char v19 = v11;
    _os_signpost_emit_with_name_impl(&dword_25631F000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Sqlite returned error indicating database corruption. deleting database and exiting", "{\"msg%{public}.0s\":\"Sqlite returned error indicating database corruption. deleting database and exiting\", \"error\":%{public, location:escape_only}@, \"store path\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x26u);
  }
  if ([(ULPersistenceManager *)self _disconnectFromStore]
    && ![(ULPersistenceManager *)self _destroyStore])
  {
    [(ULPersistenceManager *)self _deleteDatabaseFilesAtPath:v5];
  }
}

- (void)_deleteDatabaseFilesAtPath:(id)a3
{
  v38[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v5 = [v3 path];
  v38[0] = v5;
  int v6 = [v3 path];
  uint64_t v7 = [v6 stringByAppendingString:@"-wal"];
  v38[1] = v7;
  v23 = v3;
  int v8 = [v3 path];
  id v9 = [v8 stringByAppendingString:@"-shm"];
  v38[2] = v9;
  char v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:3];

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_126);
  }
  int v11 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289283;
    int v30 = 0;
    __int16 v31 = 2082;
    id v32 = "";
    __int16 v33 = 2113;
    v34 = v10;
    _os_log_impl(&dword_25631F000, v11, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Deleting store files\", \"store files\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    __int16 v15 = 0;
    uint64_t v16 = *(void *)v26;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v12);
        }
        __int16 v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
        if ([v4 fileExistsAtPath:v18])
        {
          id v24 = v15;
          char v19 = [v4 removeItemAtPath:v18 error:&v24];
          id v20 = v24;

          if ((v19 & 1) == 0)
          {
            if (onceToken_MicroLocation_Default != -1) {
              dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_126);
            }
            uint64_t v21 = logObject_MicroLocation_Default;
            if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 68289539;
              int v30 = 0;
              __int16 v31 = 2082;
              id v32 = "";
              __int16 v33 = 2113;
              v34 = v18;
              __int16 v35 = 2114;
              id v36 = v20;
              _os_log_impl(&dword_25631F000, v21, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Failed to delete file\", \"filePath\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
            }
            if (onceToken_MicroLocation_Default != -1) {
              dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_126);
            }
            v22 = logObject_MicroLocation_Default;
            if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
            {
              *(_DWORD *)buf = 68289539;
              int v30 = 0;
              __int16 v31 = 2082;
              id v32 = "";
              __int16 v33 = 2113;
              v34 = v18;
              __int16 v35 = 2114;
              id v36 = v20;
              _os_signpost_emit_with_name_impl(&dword_25631F000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Failed to delete file", "{\"msg%{public}.0s\":\"Failed to delete file\", \"filePath\":%{private, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
            }
          }
          __int16 v15 = v20;
        }
        ++v17;
      }
      while (v14 != v17);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v14);
  }
  else
  {
    __int16 v15 = 0;
  }
}

- (NSURL)modelsDirectory
{
  return self->_modelsDirectory;
}

- (void)setModelsDirectory:(id)a3
{
}

- (NSURL)storesDirectory
{
  return self->_storesDirectory;
}

- (void)setStoresDirectory:(id)a3
{
}

- (BOOL)useWal
{
  return self->_useWal;
}

- (void)setUseWal:(BOOL)a3
{
  self->_useWal = a3;
}

- (NSManagedObjectModel)managedObjectModel
{
  return self->_managedObjectModel;
}

- (void)setManagedObjectModel:(id)a3
{
}

- (void)setPersistentStoreCoordinator:(id)a3
{
}

- (ULPersistenceStore)persistenceStore
{
  return self->_persistenceStore;
}

- (void)setPersistenceStore:(id)a3
{
}

- (ULDataContainer)dataContainer
{
  return self->_dataContainer;
}

- (void)setDataContainer:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dataContainer, 0);
  objc_storeStrong((id *)&self->_persistenceStore, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_storesDirectory, 0);
  objc_storeStrong((id *)&self->_modelsDirectory, 0);
}

@end