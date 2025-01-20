@interface ICPersistentContainer
+ (BOOL)isDataProtectionError:(id)a3;
+ (BOOL)isDatabaseMissingError:(id)a3;
+ (ICExclusiveLock)databaseOpenLock;
+ (id)managedObjectModel;
+ (id)oldManagedObjectModel;
+ (id)standardStoreOptions;
+ (void)oldManagedObjectModel;
- (BOOL)abortAfterReplacingDatabase;
- (BOOL)allowsCoreDataMigration;
- (BOOL)isReadOnly;
- (BOOL)isTooLowOnDiskSpace;
- (BOOL)loadPersistentStore:(id *)a3;
- (BOOL)loadPersistentStore:(id *)a3 storeCreatedHandler:(id)a4;
- (BOOL)migrateFromOldDataModel;
- (ICPersistentContainer)initWithStoreURL:(id)a3 storeType:(id)a4 options:(id)a5 mergePolicy:(id)a6;
- (ICPersistentContainer)initWithStoreURL:(id)a3 storeType:(id)a4 options:(id)a5 mergePolicy:(id)a6 managedObjectModel:(id)a7;
- (NSDictionary)storeOptions;
- (NSMergePolicy)mergePolicy;
- (NSString)storeType;
- (NSURL)backupsDirectoryURL;
- (NSURL)storeURL;
- (id)newBackgroundContext;
- (id)performBlockWithDatabaseOpenLock:(id)a3;
- (unint64_t)fakeFreeDiskSpace;
- (void)backupPersistentStore;
- (void)isTooLowOnDiskSpace;
- (void)migrateFromOldDataModel;
- (void)setAbortAfterReplacingDatabase:(BOOL)a3;
- (void)setFakeFreeDiskSpace:(unint64_t)a3;
- (void)setMergePolicy:(id)a3;
- (void)setStoreOptions:(id)a3;
- (void)setStoreType:(id)a3;
- (void)setStoreURL:(id)a3;
- (void)setupPersistentStoreDescriptions;
- (void)setupViewContext;
- (void)vacuumStore;
- (void)vacuumStoreWithCompletionHandler:(id)a3;
@end

@implementation ICPersistentContainer

- (ICPersistentContainer)initWithStoreURL:(id)a3 storeType:(id)a4 options:(id)a5 mergePolicy:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(id)objc_opt_class() managedObjectModel];
  v15 = [(ICPersistentContainer *)self initWithStoreURL:v13 storeType:v12 options:v11 mergePolicy:v10 managedObjectModel:v14];

  return v15;
}

- (ICPersistentContainer)initWithStoreURL:(id)a3 storeType:(id)a4 options:(id)a5 mergePolicy:(id)a6 managedObjectModel:(id)a7
{
  id v13 = a3;
  id v21 = a4;
  id v20 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [v13 lastPathComponent];
  v17 = [v16 stringByDeletingPathExtension];

  v22.receiver = self;
  v22.super_class = (Class)ICPersistentContainer;
  v18 = [(NSPersistentContainer *)&v22 initWithName:v17 managedObjectModel:v15];

  if (v18)
  {
    objc_storeStrong((id *)&v18->_storeURL, a3);
    objc_storeStrong((id *)&v18->_storeType, a4);
    objc_storeStrong((id *)&v18->_storeOptions, a5);
    objc_storeStrong((id *)&v18->_mergePolicy, a6);
    [(ICPersistentContainer *)v18 setupPersistentStoreDescriptions];
  }

  return v18;
}

+ (id)managedObjectModel
{
  if (managedObjectModel_onceToken != -1) {
    dispatch_once(&managedObjectModel_onceToken, &__block_literal_global_10_0);
  }
  v2 = (void *)managedObjectModel_managedObjectModel;
  return v2;
}

- (BOOL)loadPersistentStore:(id *)a3 storeCreatedHandler:(id)a4
{
  id v6 = a4;
  v7 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ICPersistentContainer loadPersistentStore:storeCreatedHandler:]();
  }

  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  char v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  char v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  char v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  char v33 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke;
  id v15 = &unk_2640CDBA0;
  v16 = self;
  v18 = &v28;
  v19 = v36;
  id v20 = v34;
  id v21 = v32;
  objc_super v22 = &v24;
  v23 = v38;
  id v8 = v6;
  id v17 = v8;
  v9 = [(ICPersistentContainer *)self performBlockWithDatabaseOpenLock:&v12];
  if (*((unsigned char *)v29 + 24)) {
    [(ICPersistentContainer *)self setupViewContext];
  }
  if (*((unsigned char *)v25 + 24))
  {
    id v11 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ICPersistentContainer loadPersistentStore:storeCreatedHandler:]();
    }

    exit(0);
  }
  if (a3) {
    *a3 = v9;
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);

  return v9 == 0;
}

- (void)setupViewContext
{
  v3 = [(ICPersistentContainer *)self mergePolicy];
  v4 = [(NSPersistentContainer *)self viewContext];
  [v4 setMergePolicy:v3];

  v5 = [(NSPersistentContainer *)self viewContext];
  [v5 setName:@"ViewContext"];

  id v6 = NSString;
  v7 = [MEMORY[0x263F08AB0] processInfo];
  id v8 = objc_msgSend(v6, "stringWithFormat:", @"%d", objc_msgSend(v7, "processIdentifier"));
  v9 = [(NSPersistentContainer *)self viewContext];
  [v9 setTransactionAuthor:v8];

  id v10 = [(NSPersistentContainer *)self viewContext];
  [v10 setAutomaticallyMergesChangesFromParent:1];

  id v11 = [(NSPersistentContainer *)self viewContext];
  [v11 setShouldDeleteInaccessibleFaults:1];
}

- (id)newBackgroundContext
{
  v6.receiver = self;
  v6.super_class = (Class)ICPersistentContainer;
  id v3 = [(NSPersistentContainer *)&v6 newBackgroundContext];
  v4 = [(ICPersistentContainer *)self mergePolicy];
  [v3 setMergePolicy:v4];

  return v3;
}

- (NSMergePolicy)mergePolicy
{
  return self->_mergePolicy;
}

- (id)performBlockWithDatabaseOpenLock:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = objc_opt_class();
  objc_sync_enter(v5);
  BOOL v6 = [(ICPersistentContainer *)self allowsCoreDataMigration];
  if (v6)
  {
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"ICPersistentContainerWillLockDatabaseNotification" object:self];

    id v8 = [(id)objc_opt_class() databaseOpenLock];
    [v8 lock];
  }
  v9 = v4[2](v4);
  if (v6)
  {
    id v10 = [(id)objc_opt_class() databaseOpenLock];
    [v10 unlock];

    id v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 postNotificationName:@"ICPersistentContainerDidUnlockDatabaseNotification" object:self];
  }
  objc_sync_exit(v5);

  return v9;
}

+ (ICExclusiveLock)databaseOpenLock
{
  if (databaseOpenLock_onceToken != -1) {
    dispatch_once(&databaseOpenLock_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)databaseOpenLock__databaseOpenLock;
  return (ICExclusiveLock *)v2;
}

id __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke(uint64_t a1)
{
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__4;
  v52 = __Block_byref_object_dispose__4;
  id v53 = 0;
  v2 = *(void **)(a1 + 32);
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_24;
  v44[3] = &unk_2640CDB50;
  uint64_t v3 = *(void *)(a1 + 48);
  v44[4] = v2;
  v44[5] = v3;
  long long v45 = *(_OWORD *)(a1 + 56);
  long long v46 = *(_OWORD *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 88);
  v44[6] = &v48;
  uint64_t v47 = v4;
  [v2 loadPersistentStoresWithCompletionHandler:v44];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    v5 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C263000, v5, OS_LOG_TYPE_INFO, "Persistent store does not exist and we're opening read only. Need to create persistent store.", buf, 2u);
    }

    BOOL v6 = [*(id *)(a1 + 32) storeOptions];
    v7 = (void *)[v6 mutableCopy];

    [v7 removeObjectForKey:*MEMORY[0x263EFF138]];
    id v8 = [ICPersistentContainer alloc];
    v9 = [*(id *)(a1 + 32) storeURL];
    id v10 = [*(id *)(a1 + 32) mergePolicy];
    id v11 = [(ICPersistentContainer *)v8 initWithStoreURL:v9 storeType:*MEMORY[0x263EFF168] options:v7 mergePolicy:v10];

    id v42 = 0;
    BOOL v12 = [(ICPersistentContainer *)v11 loadPersistentStore:&v42];
    id v13 = v42;
    id v14 = os_log_create("com.apple.notes", "CoreData");
    id v15 = v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_cold_2();
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      uint64_t v16 = *(void *)(a1 + 40);
      if (v16)
      {
        id v17 = [(ICPersistentContainer *)v11 newBackgroundContext];
        (*(void (**)(uint64_t, id))(v16 + 16))(v16, v17);
      }
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_cold_5();
      }

      if (+[ICPersistentContainer isDataProtectionError:v13])
      {
        v18 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20C263000, v18, OS_LOG_TYPE_INFO, "Data protection prevented loading persistent store, because device has not been unlocked since boot", buf, 2u);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      }
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if (([*(id *)(a1 + 32) isReadOnly] & 1) == 0)
    {
      v19 = [*(id *)(a1 + 32) storeType];
      int v20 = [v19 isEqualToString:*MEMORY[0x263EFF1C0]];

      if (v20)
      {
        id v21 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20C263000, v21, OS_LOG_TYPE_INFO, "Failed to load persistent store, and we're using an XPC store. Possibly need to migrate the database", buf, 2u);
        }

        objc_super v22 = [ICPersistentContainer alloc];
        v23 = [*(id *)(a1 + 32) storeURL];
        uint64_t v24 = [*(id *)(a1 + 32) storeOptions];
        uint64_t v25 = [*(id *)(a1 + 32) mergePolicy];
        uint64_t v26 = [(ICPersistentContainer *)v22 initWithStoreURL:v23 storeType:*MEMORY[0x263EFF168] options:v24 mergePolicy:v25];

        id v41 = 0;
        LOBYTE(v25) = [(ICPersistentContainer *)v26 loadPersistentStore:&v41];
        id v27 = v41;
        uint64_t v28 = os_log_create("com.apple.notes", "CoreData");
        os_log_t v29 = v28;
        if (v25)
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_cold_2();
          }
          char v30 = 1;
        }
        else
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_cold_3();
          }

          if (!+[ICPersistentContainer isDataProtectionError:v27])goto LABEL_32; {
          os_log_t v29 = os_log_create("com.apple.notes", "CoreData");
          }
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20C263000, v29, OS_LOG_TYPE_INFO, "Data protection prevented loading persistent store, because device has not been unlocked since boot", buf, 2u);
          }
          char v30 = 0;
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v30;
LABEL_32:
      }
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
    && ([*(id *)(a1 + 32) migrateFromOldDataModel] & 1) == 0)
  {
    +[ICTelemetryManager postBasicEvent:1];
    char v31 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C263000, v31, OS_LOG_TYPE_DEFAULT, "Failed to migrate from old data model. Backing up and replacing the store", buf, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && ([*(id *)(a1 + 32) isReadOnly] & 1) == 0)
  {
    v32 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C263000, v32, OS_LOG_TYPE_INFO, "Destroying old persistent store and creating a new one", buf, 2u);
    }

    [*(id *)(a1 + 32) backupPersistentStore];
    +[ICTelemetryManager postBasicEvent:0];
    if ([*(id *)(a1 + 32) abortAfterReplacingDatabase])
    {
      +[ICTelemetryManager waitUntilAllPendingTelemetryHasBeenSent];
      char v33 = (void *)MEMORY[0x263EFF940];
      v34 = [*(id *)(a1 + 32) backupsDirectoryURL];
      char v35 = [v34 absoluteString];
      [v33 raise:*MEMORY[0x263EFF488], @"Crashing intentionally after replacing up the database. Backups can be found at %@", v35 format];
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    v36 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_cold_1();
    }

    char v37 = *(void **)(a1 + 32);
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_36;
    v40[3] = &unk_2640CDB78;
    v40[4] = *(void *)(a1 + 48);
    v40[5] = &v48;
    [v37 loadPersistentStoresWithCompletionHandler:v40];
  }
  id v38 = (id)v49[5];
  _Block_object_dispose(&v48, 8);

  return v38;
}

- (void)loadPersistentStore:storeCreatedHandler:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "Loading persistent store", v2, v3, v4, v5, v6);
}

- (BOOL)allowsCoreDataMigration
{
  uint64_t v2 = [(ICPersistentContainer *)self storeOptions];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263EFF070]];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setupPersistentStoreDescriptions
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFF328]);
  char v4 = [(ICPersistentContainer *)self storeURL];
  uint64_t v5 = (void *)[v3 initWithURL:v4];

  uint8_t v6 = [(ICPersistentContainer *)self storeType];
  [v5 setType:v6];

  v7 = [(ICPersistentContainer *)self storeOptions];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__ICPersistentContainer_setupPersistentStoreDescriptions__block_invoke;
  v10[3] = &unk_2640CDB28;
  id v8 = v5;
  id v11 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];

  if (v8)
  {
    v12[0] = v8;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    [(NSPersistentContainer *)self setPersistentStoreDescriptions:v9];
  }
}

- (NSDictionary)storeOptions
{
  return self->_storeOptions;
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (NSString)storeType
{
  return self->_storeType;
}

uint64_t __57__ICPersistentContainer_setupPersistentStoreDescriptions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setOption:a3 forKey:a2];
}

void __43__ICPersistentContainer_managedObjectModel__block_invoke()
{
  v0 = +[ICPaths managedObjectModelURL];
  uint64_t v1 = os_log_create("com.apple.notes", "CoreData");
  uint64_t v2 = v1;
  if (v0)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
      __43__ICPersistentContainer_managedObjectModel__block_invoke_cold_2();
    }

    uint64_t v3 = [objc_alloc(MEMORY[0x263EFF298]) initWithContentsOfURL:v0];
    uint64_t v2 = managedObjectModel_managedObjectModel;
    managedObjectModel_managedObjectModel = v3;
  }
  else if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    __43__ICPersistentContainer_managedObjectModel__block_invoke_cold_1();
  }
}

void __43__ICPersistentContainer_managedObjectModel__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Initializing managed object model from %@", v2, v3, v4, v5, v6);
}

+ (id)standardStoreOptions
{
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v3 = MEMORY[0x263EFFA88];
  [v2 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263EFF008]];
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x263EFF070]];
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x263EFF100]];
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x263EFF0B0]];
  return v2;
}

void __41__ICPersistentContainer_databaseOpenLock__block_invoke()
{
  v0 = [ICExclusiveLock alloc];
  id v4 = +[ICPaths applicationDocumentsURL];
  uint64_t v1 = [v4 path];
  uint64_t v2 = [(ICExclusiveLock *)v0 initWithName:@"com.apple.notes.databaseopen.lock" cachePath:v1];
  uint64_t v3 = (void *)databaseOpenLock__databaseOpenLock;
  databaseOpenLock__databaseOpenLock = v2;
}

void __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = os_log_create("com.apple.notes", "CoreData");
  id v8 = v7;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_24_cold_1();
    }

    uint64_t v13 = *(void *)(a1 + 40);
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_24_cold_3();
  }

  if ([*(id *)(a1 + 32) isTooLowOnDiskSpace])
  {
    v9 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C263000, v9, OS_LOG_TYPE_INFO, "Low on disk space and unable to load persistent store", buf, 2u);
    }

    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.notes" code:209 userInfo:0];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    BOOL v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

LABEL_17:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    goto LABEL_18;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  if (+[ICPersistentContainer isDataProtectionError:v6])
  {
    id v15 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_20C263000, v15, OS_LOG_TYPE_INFO, "Data protection prevented loading persistent store, because device has not been unlocked since boot", v18, 2u);
    }

    goto LABEL_17;
  }
  if ([v6 code] == 134140)
  {
    if ([*(id *)(a1 + 32) allowsCoreDataMigration])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
      goto LABEL_12;
    }
    uint64_t v13 = *(void *)(a1 + 80);
LABEL_11:
    uint64_t v14 = *(void *)(v13 + 8);
LABEL_12:
    *(unsigned char *)(v14 + 24) = 1;
    goto LABEL_18;
  }
  if (+[ICPersistentContainer isDatabaseMissingError:](ICPersistentContainer, "isDatabaseMissingError:", v6)&& [*(id *)(a1 + 32) isReadOnly])
  {
    uint64_t v13 = *(void *)(a1 + 88);
    goto LABEL_11;
  }
  uint64_t v16 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
    __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_24_cold_2(v6, v16);
  }

  +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICPersistentContainer loadPersistentStore:storeCreatedHandler:]_block_invoke", 1, 1, @"Failed to open modern notes database.");
  if ([*(id *)(a1 + 32) allowsCoreDataMigration])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v17 = *(void *)(a1 + 64);
  }
  else
  {
    uint64_t v17 = *(void *)(a1 + 80);
  }
  *(unsigned char *)(*(void *)(v17 + 8) + 24) = 1;
LABEL_18:
}

void __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_24_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Loaded persistent store %@", v2, v3, v4, v5, v6);
}

+ (id)oldManagedObjectModel
{
  uint64_t v2 = +[ICPaths oldManagedObjectModelURL];
  uint64_t v3 = os_log_create("com.apple.notes", "CoreData");
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      +[ICPersistentContainer oldManagedObjectModel]();
    }

    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFF298]) initWithContentsOfURL:v2];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      +[ICPersistentContainer oldManagedObjectModel]();
    }

    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)migrateFromOldDataModel
{
  v17[2] = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v3 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[ICPersistentContainer migrateFromOldDataModel]();
  }

  uint64_t v4 = *MEMORY[0x263EFF070];
  v16[0] = *MEMORY[0x263EFF008];
  v16[1] = v4;
  v17[0] = MEMORY[0x263EFFA88];
  v17[1] = MEMORY[0x263EFFA88];
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  uint8_t v6 = [(id)objc_opt_class() oldManagedObjectModel];
  v7 = [ICPersistentContainer alloc];
  id v8 = [(ICPersistentContainer *)self storeURL];
  v9 = [(ICPersistentContainer *)v7 initWithStoreURL:v8 storeType:*MEMORY[0x263EFF168] options:v5 mergePolicy:0 managedObjectModel:v6];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__ICPersistentContainer_migrateFromOldDataModel__block_invoke;
  v11[3] = &unk_2640CDB00;
  v11[4] = &v12;
  [(NSPersistentContainer *)v9 loadPersistentStoresWithCompletionHandler:v11];
  LOBYTE(v8) = *((unsigned char *)v13 + 24) != 0;

  _Block_object_dispose(&v12, 8);
  return (char)v8;
}

void __48__ICPersistentContainer_migrateFromOldDataModel__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.notes", "CoreData");
  uint8_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __48__ICPersistentContainer_migrateFromOldDataModel__block_invoke_cold_2();
    }
    char v7 = 0;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __48__ICPersistentContainer_migrateFromOldDataModel__block_invoke_cold_1();
    }
    char v7 = 1;
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7;
}

- (BOOL)loadPersistentStore:(id *)a3
{
  return [(ICPersistentContainer *)self loadPersistentStore:a3 storeCreatedHandler:0];
}

void __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_36(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.notes", "CoreData");
  uint8_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_36_cold_2();
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_36_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v4;
}

- (BOOL)isReadOnly
{
  uint64_t v2 = [(ICPersistentContainer *)self storeOptions];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263EFF138]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isTooLowOnDiskSpace
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ICPersistentContainer *)self storeURL];
  char v4 = [v3 URLByDeletingPathExtension];
  uint64_t v5 = [v4 URLByAppendingPathExtension:@"sqlite-wal"];

  if ([(ICPersistentContainer *)self fakeFreeDiskSpace])
  {
    uint8_t v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(ICPersistentContainer *)self isTooLowOnDiskSpace];
    }

    unint64_t v7 = [(ICPersistentContainer *)self fakeFreeDiskSpace];
    id v8 = 0;
  }
  else
  {
    v9 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v10 = [v3 URLByDeletingLastPathComponent];
    uint64_t v11 = [v10 path];
    id v31 = 0;
    uint64_t v12 = [v9 attributesOfFileSystemForPath:v11 error:&v31];
    id v8 = v31;

    if (v8)
    {
      uint64_t v13 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(ICPersistentContainer *)v3 isTooLowOnDiskSpace];
      }

      unint64_t v7 = 0;
    }
    else
    {
      uint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F080C8]];
      unint64_t v7 = [v13 unsignedIntegerValue];
    }
  }
  id v30 = 0;
  uint64_t v14 = *MEMORY[0x263EFF688];
  id v29 = 0;
  int v15 = [v3 getResourceValue:&v30 forKey:v14 error:&v29];
  id v16 = v30;
  id v17 = v29;

  if (v15)
  {
    uint64_t v18 = [v16 unsignedIntegerValue];
  }
  else
  {
    v19 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ICPersistentContainer isTooLowOnDiskSpace]();
    }

    uint64_t v18 = 0;
  }
  id v27 = 0;
  id v28 = 0;
  int v20 = [v5 getResourceValue:&v28 forKey:v14 error:&v27];
  id v21 = v28;

  id v22 = v27;
  if (v20)
  {
    v18 += [v21 unsignedIntegerValue];
  }
  else if ([v22 code] != 260)
  {
    v23 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[ICPersistentContainer isTooLowOnDiskSpace]();
    }
  }
  unint64_t v24 = 3 * v18 + 0x100000;
  uint64_t v25 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v33 = v24;
    __int16 v34 = 2048;
    unint64_t v35 = v7;
    _os_log_impl(&dword_20C263000, v25, OS_LOG_TYPE_INFO, "Minimum free space to open database: %lu, current free space: %lu", buf, 0x16u);
  }

  return v7 < v24;
}

+ (BOOL)isDataProtectionError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 code];
  uint64_t v5 = [v3 domain];
  uint64_t v6 = *MEMORY[0x263EFF150];
  if ([v5 isEqualToString:*MEMORY[0x263EFF150]])
  {
    unint64_t v7 = [NSNumber numberWithInteger:v4];
  }
  else
  {
    id v8 = [v3 userInfo];
    unint64_t v7 = [v8 objectForKeyedSubscript:v6];
  }
  uint64_t v9 = *MEMORY[0x263F08438];
  if ([v5 isEqualToString:*MEMORY[0x263F08438]])
  {
    uint64_t v10 = [NSNumber numberWithInteger:v4];
  }
  else
  {
    uint64_t v11 = [v3 userInfo];
    uint64_t v10 = [v11 objectForKeyedSubscript:v9];
  }
  BOOL v12 = [v7 intValue] == 23 || objc_msgSend(v10, "intValue") == 1;

  return v12;
}

+ (BOOL)isDatabaseMissingError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x263F08438]] && objc_msgSend(v3, "code") == 2)
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v6 = [v3 domain];
    if ([v6 isEqualToString:*MEMORY[0x263F07F70]]) {
      BOOL v5 = [v3 code] == 260;
    }
    else {
      BOOL v5 = 0;
    }
  }
  return v5;
}

- (NSURL)backupsDirectoryURL
{
  uint64_t v2 = [(ICPersistentContainer *)self storeURL];
  id v3 = [v2 URLByDeletingLastPathComponent];

  uint64_t v4 = [v3 URLByAppendingPathComponent:@"Backups" isDirectory:1];

  return (NSURL *)v4;
}

- (void)backupPersistentStore
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "Backing up persistent store", v2, v3, v4, v5, v6);
}

- (void)vacuumStore
{
}

- (void)vacuumStoreWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSPersistentContainer *)self viewContext];
  uint8_t v6 = [(ICPersistentContainer *)self storeURL];
  unint64_t v7 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ICPersistentContainer vacuumStoreWithCompletionHandler:]();
  }

  [v5 setShouldPerformSecureOperation:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__ICPersistentContainer_vacuumStoreWithCompletionHandler___block_invoke;
  v11[3] = &unk_2640CDBC8;
  id v12 = v5;
  id v13 = v6;
  id v14 = v4;
  id v8 = v4;
  id v9 = v6;
  id v10 = v5;
  [v10 performBlock:v11];
}

uint64_t __58__ICPersistentContainer_vacuumStoreWithCompletionHandler___block_invoke(uint64_t a1)
{
  int v2 = objc_msgSend(*(id *)(a1 + 32), "ic_save");
  uint64_t v3 = os_log_create("com.apple.notes", "CoreData");
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __58__ICPersistentContainer_vacuumStoreWithCompletionHandler___block_invoke_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __58__ICPersistentContainer_vacuumStoreWithCompletionHandler___block_invoke_cold_2(a1, v4, v11, v12, v13, v14, v15, v16);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setStoreOptions:(id)a3
{
}

- (void)setStoreURL:(id)a3
{
}

- (void)setStoreType:(id)a3
{
}

- (void)setMergePolicy:(id)a3
{
}

- (unint64_t)fakeFreeDiskSpace
{
  return self->_fakeFreeDiskSpace;
}

- (void)setFakeFreeDiskSpace:(unint64_t)a3
{
  self->_fakeFreeDiskSpace = a3;
}

- (BOOL)abortAfterReplacingDatabase
{
  return self->_abortAfterReplacingDatabase;
}

- (void)setAbortAfterReplacingDatabase:(BOOL)a3
{
  self->_abortAfterReplacingDatabase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergePolicy, 0);
  objc_storeStrong((id *)&self->_storeType, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_storeOptions, 0);
}

void __43__ICPersistentContainer_managedObjectModel__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_20C263000, v0, OS_LOG_TYPE_ERROR, "Could not find URL for managed object model", v1, 2u);
}

+ (void)oldManagedObjectModel
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Initializing old managed object model from %@", v2, v3, v4, v5, v6);
}

- (void)migrateFromOldDataModel
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "Trying to migrate using the old data model", v2, v3, v4, v5, v6);
}

void __48__ICPersistentContainer_migrateFromOldDataModel__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "Successfully loaded persistent store using old data model", v2, v3, v4, v5, v6);
}

void __48__ICPersistentContainer_migrateFromOldDataModel__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20C263000, v0, v1, "Error loading persistent store using old data model: %@", v2, v3, v4, v5, v6);
}

- (void)loadPersistentStore:storeCreatedHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20C263000, v0, v1, "Exiting due to failure to open the database: %@", v2, v3, v4, v5, v6);
}

void __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "Trying to load persistent store again", v2, v3, v4, v5, v6);
}

void __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "Successfully loaded store in-process", v2, v3, v4, v5, v6);
}

void __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20C263000, v0, v1, "Error loading persistent store in-process with SQLite: %@", v2, v3, v4, v5, v6);
}

void __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20C263000, v0, v1, "Error creating persistent store: %@", v2, v3, v4, v5, v6);
}

void __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_24_cold_2(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 userInfo];
  int v5 = 138412546;
  uint8_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_fault_impl(&dword_20C263000, a2, OS_LOG_TYPE_FAULT, "Unexpected error while opening database %@, %@", (uint8_t *)&v5, 0x16u);
}

void __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_24_cold_3()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5_0();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_20C263000, v1, OS_LOG_TYPE_ERROR, "Error loading persistent store %@: %@", v2, 0x16u);
}

void __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_36_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_20C263000, v0, v1, "Successfully loaded persistent store on the second try", v2, v3, v4, v5, v6);
}

void __65__ICPersistentContainer_loadPersistentStore_storeCreatedHandler___block_invoke_36_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20C263000, v0, v1, "Error trying to load persistent store again: %@", v2, v3, v4, v5, v6);
}

- (void)isTooLowOnDiskSpace
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  [a1 fakeFreeDiskSpace];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_20C263000, a2, OS_LOG_TYPE_DEBUG, "Using fake free disk space: %lu", v3, 0xCu);
}

- (void)vacuumStoreWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Vaccuming persistent store at %@", v2, v3, v4, v5, v6);
}

void __58__ICPersistentContainer_vacuumStoreWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __58__ICPersistentContainer_vacuumStoreWithCompletionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end