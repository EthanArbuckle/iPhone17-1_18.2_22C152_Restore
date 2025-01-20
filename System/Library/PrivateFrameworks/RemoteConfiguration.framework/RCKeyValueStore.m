@interface RCKeyValueStore
+ (BOOL)shouldDumpToJSON;
+ (id)persistenceQueue;
- (BOOL)BOOLValueForKey:(id)a3;
- (BOOL)_isBackupEnabled;
- (BOOL)_persistOnlyInMemoryEnabled;
- (BOOL)_shouldMigrateOnUpgrade;
- (BOOL)containsObjectForKey:(id)a3;
- (BOOL)needSave;
- (BOOL)shouldExportJSONSidecar;
- (NSDictionary)asDictionary;
- (NSMutableDictionary)objectsByKey;
- (NSString)name;
- (NSString)storeDirectory;
- (RCKeyValueStore)init;
- (RCKeyValueStore)initWithName:(id)a3 directory:(id)a4 version:(unint64_t)a5 options:(unint64_t)a6;
- (RCKeyValueStore)initWithName:(id)a3 directory:(id)a4 version:(unint64_t)a5 options:(unint64_t)a6 migrator:(id)a7;
- (RCKeyValueStoreMigrating)migrator;
- (RCMutexLock)writeLock;
- (RCOperationThrottler)saveThrottler;
- (id)_dictionary;
- (id)_initializeStoreDirectoryWithName:(id)a3;
- (id)_loadFromDisk;
- (id)allKeys;
- (id)objectForKey:(id)a3;
- (id)objectsForKeys:(id)a3;
- (unint64_t)clientVersion;
- (unint64_t)optionsMask;
- (unint64_t)storeSize;
- (void)_clearStore;
- (void)_loadFromDisk;
- (void)_logCacheStatus;
- (void)_queueSave;
- (void)_saveAsyncWithCompletionHandler:(id)a3;
- (void)addAllEntriesToDictionary:(id)a3;
- (void)addEntriesFromDictionary:(id)a3;
- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)removeObjectsForKeys:(id)a3;
- (void)saveWithCompletionHandler:(id)a3;
- (void)setBoolValue:(BOOL)a3 forKey:(id)a4;
- (void)setClientVersion:(unint64_t)a3;
- (void)setMigrator:(id)a3;
- (void)setName:(id)a3;
- (void)setNeedSave:(BOOL)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObjects:(id)a3 forKeys:(id)a4;
- (void)setObjectsByKey:(id)a3;
- (void)setOptionBackupEnabled:(BOOL)a3;
- (void)setOptionsMask:(unint64_t)a3;
- (void)setSaveThrottler:(id)a3;
- (void)setShouldExportJSONSidecar:(BOOL)a3;
- (void)setStoreDirectory:(id)a3;
- (void)setStoreSize:(unint64_t)a3;
- (void)setWriteLock:(id)a3;
- (void)updateObjectsForKeys:(id)a3 withBlock:(id)a4;
@end

@implementation RCKeyValueStore

- (RCKeyValueStore)initWithName:(id)a3 directory:(id)a4 version:(unint64_t)a5 options:(unint64_t)a6 migrator:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v29.receiver = self;
  v29.super_class = (Class)RCKeyValueStore;
  v16 = [(RCKeyValueStore *)&v29 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_name, a3);
    v17->_clientVersion = a5;
    v17->_optionsMask = a6;
    uint64_t v18 = [(RCKeyValueStore *)v17 _initializeStoreDirectoryWithName:v14];
    storeDirectory = v17->_storeDirectory;
    v17->_storeDirectory = (NSString *)v18;

    objc_storeStrong((id *)&v17->_migrator, a7);
    v20 = objc_alloc_init(RCMutexLock);
    writeLock = v17->_writeLock;
    v17->_writeLock = v20;

    v22 = (void *)MEMORY[0x1E4F1CA60];
    v23 = [(RCKeyValueStore *)v17 _loadFromDisk];
    uint64_t v24 = [v22 dictionaryWithDictionary:v23];
    objectsByKey = v17->_objectsByKey;
    v17->_objectsByKey = (NSMutableDictionary *)v24;

    v17->_needSave = 1;
    v26 = [[RCTimedOperationThrottler alloc] initWithDelegate:v17];
    [(RCTimedOperationThrottler *)v26 setCooldownTime:1.0];
    saveThrottler = v17->_saveThrottler;
    v17->_saveThrottler = (RCOperationThrottler *)v26;
  }
  return v17;
}

- (RCKeyValueStore)initWithName:(id)a3 directory:(id)a4 version:(unint64_t)a5 options:(unint64_t)a6
{
  return [(RCKeyValueStore *)self initWithName:a3 directory:a4 version:a5 options:a6 migrator:0];
}

- (id)_initializeStoreDirectoryWithName:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3];

  if ((v5 & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v10 = 0;
    char v7 = [v6 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v10];
    id v8 = v10;

    if ((v7 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[RCKeyValueStore _initializeStoreDirectoryWithName:]((uint64_t)v8);
    }
  }

  return v3;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  char v5 = [(RCKeyValueStore *)self objectsByKey];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (NSMutableDictionary)objectsByKey
{
  return self->_objectsByKey;
}

- (id)allKeys
{
  v2 = [(RCKeyValueStore *)self objectsByKey];
  id v3 = [v2 allKeys];

  return v3;
}

- (id)_loadFromDisk
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = [(RCKeyValueStore *)self storeDirectory];
  id v4 = [(RCKeyValueStore *)self name];
  char v5 = [v3 stringByAppendingPathComponent:v4];

  double Current = CFAbsoluteTimeGetCurrent();
  char v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v5];
  id v8 = v7;
  if (v7)
  {
    -[RCKeyValueStore setStoreSize:](self, "setStoreSize:", [v7 length]);
    v9 = [MEMORY[0x1E4F1CA60] dictionary];
    id v44 = 0;
    id v10 = [MEMORY[0x1E4F28F98] propertyListWithData:v8 options:0 format:0 error:&v44];
    id v11 = v44;
    v12 = [v10 objectForKey:@"data"];
    [v9 addEntriesFromDictionary:v12];
    id v13 = [v10 objectForKey:@"version"];
    uint64_t v14 = [v13 unsignedIntegerValue];

    id v15 = [v10 objectForKey:@"clientVersion"];
    uint64_t v39 = [v15 unsignedIntegerValue];

    double v16 = CFAbsoluteTimeGetCurrent();
    v17 = RCSharedLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = [(RCKeyValueStore *)self name];
      *(_DWORD *)buf = 138412546;
      v47 = v18;
      __int16 v48 = 2048;
      double v49 = (v16 - Current) * 1000.0;
      _os_log_impl(&dword_1A4AB3000, v17, OS_LOG_TYPE_DEBUG, "Loaded %@ cache in %f ms", buf, 0x16u);
    }
    if (v14 == 1)
    {
      if (v39 == [(RCKeyValueStore *)self clientVersion])
      {
        id v19 = v9;
      }
      else
      {
        id v38 = v11;
        if ([(RCKeyValueStore *)self _shouldMigrateOnUpgrade])
        {
          v20 = [(RCKeyValueStore *)self migrator];

          if (!v20 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[RCKeyValueStore _loadFromDisk]();
          }
        }
        if ([(RCKeyValueStore *)self _shouldMigrateOnUpgrade]
          && ([(RCKeyValueStore *)self migrator],
              v21 = objc_claimAutoreleasedReturnValue(),
              int v22 = [v21 keyValueStore:self canMigrateFromVersion:v39],
              v21,
              v22))
        {
          v34 = v12;
          v35 = v10;
          v36 = v8;
          v37 = v5;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          v23 = [v9 allKeys];
          uint64_t v24 = (void *)[v23 copy];

          uint64_t v25 = [v24 countByEnumeratingWithState:&v40 objects:v45 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v41;
            do
            {
              for (uint64_t i = 0; i != v26; ++i)
              {
                if (*(void *)v41 != v27) {
                  objc_enumerationMutation(v24);
                }
                uint64_t v29 = *(void *)(*((void *)&v40 + 1) + 8 * i);
                v30 = [v9 objectForKey:v29];
                v31 = [(RCKeyValueStore *)self migrator];
                v32 = [v31 keyValueStore:self migrateObject:v30 forKey:v29 fromVersion:v39];

                if (v32) {
                  [v9 setObject:v32 forKey:v29];
                }
                else {
                  [v9 removeObjectForKey:v29];
                }
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v40 objects:v45 count:16];
            }
            while (v26);
          }

          id v19 = v9;
          id v8 = v36;
          char v5 = v37;
          v12 = v34;
          id v10 = v35;
        }
        else
        {
          [(RCKeyValueStore *)self _clearStore];
          id v19 = 0;
        }
        id v11 = v38;
      }
    }
    else
    {
      [(RCKeyValueStore *)self _clearStore];
      id v19 = 0;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (NSString)storeDirectory
{
  return self->_storeDirectory;
}

- (void)setStoreSize:(unint64_t)a3
{
  self->_storeSize = a3;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)clientVersion
{
  return self->_clientVersion;
}

+ (id)persistenceQueue
{
  if (persistenceQueue_onceToken != -1) {
    dispatch_once(&persistenceQueue_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)persistenceQueue_s_persistenceQueue;

  return v2;
}

void __35__RCKeyValueStore_persistenceQueue__block_invoke()
{
  id v2 = [@"com.apple.remoteconfiguration." stringByAppendingString:@"persistenceQueue"];
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)persistenceQueue_s_persistenceQueue;
  persistenceQueue_s_persistenceQueue = (uint64_t)v0;

  [(id)persistenceQueue_s_persistenceQueue setQualityOfService:9];
  [(id)persistenceQueue_s_persistenceQueue setMaxConcurrentOperationCount:1];
  [(id)persistenceQueue_s_persistenceQueue setName:v2];
}

+ (BOOL)shouldDumpToJSON
{
  return 0;
}

- (RCKeyValueStore)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[RCKeyValueStore init]";
    __int16 v9 = 2080;
    id v10 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Persistence/RCKeyValueStore.m";
    __int16 v11 = 1024;
    int v12 = 73;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  char v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[RCKeyValueStore init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)containsObjectForKey:(id)a3
{
  id v3 = [(RCKeyValueStore *)self objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      id v8 = [(RCKeyValueStore *)self objectsByKey];
      id v9 = [v8 objectForKey:v7];

      if (v9 != v6)
      {
        id v10 = [(RCKeyValueStore *)self writeLock];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __36__RCKeyValueStore_setObject_forKey___block_invoke;
        v11[3] = &unk_1E5B76C88;
        v11[4] = self;
        id v12 = v6;
        id v13 = v7;
        [v10 performWithLockSync:v11];
      }
      [(RCKeyValueStore *)self _queueSave];
    }
    else
    {
      [(RCKeyValueStore *)self removeObjectForKey:v7];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCKeyValueStore setObject:forKey:]();
  }
}

uint64_t __36__RCKeyValueStore_setObject_forKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectsByKey];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];

  id v3 = *(void **)(a1 + 32);

  return [v3 setNeedSave:1];
}

- (void)setObjects:(id)a3 forKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (v7)
    {
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v7];
      [(RCKeyValueStore *)self addEntriesFromDictionary:v9];

      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCKeyValueStore setObjects:forKeys:]();
  }
  if (!v8)
  {
LABEL_7:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[RCKeyValueStore setObjects:forKeys:]();
    }
  }
LABEL_9:
}

- (void)addEntriesFromDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v5 = [(RCKeyValueStore *)self writeLock];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __44__RCKeyValueStore_addEntriesFromDictionary___block_invoke;
    id v9 = &unk_1E5B75F80;
    id v10 = self;
    id v11 = v4;
    [v5 performWithLockSync:&v6];

    [(RCKeyValueStore *)self _queueSave];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCKeyValueStore addEntriesFromDictionary:]();
  }
}

uint64_t __44__RCKeyValueStore_addEntriesFromDictionary___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectsByKey];
  [v2 addEntriesFromDictionary:*(void *)(a1 + 40)];

  id v3 = *(void **)(a1 + 32);

  return [v3 setNeedSave:1];
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  char v5 = [(RCKeyValueStore *)self objectsByKey];
  uint64_t v6 = [v5 objectForKey:v4];

  if (v6)
  {
    uint64_t v7 = [(RCKeyValueStore *)self writeLock];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    id v10 = __38__RCKeyValueStore_removeObjectForKey___block_invoke;
    id v11 = &unk_1E5B75F80;
    id v12 = self;
    id v13 = v4;
    [v7 performWithLockSync:&v8];

    [(RCKeyValueStore *)self _queueSave];
  }
}

uint64_t __38__RCKeyValueStore_removeObjectForKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectsByKey];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];

  id v3 = *(void **)(a1 + 32);

  return [v3 setNeedSave:1];
}

- (void)removeObjectsForKeys:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    char v5 = [(RCKeyValueStore *)self writeLock];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    uint64_t v8 = __40__RCKeyValueStore_removeObjectsForKeys___block_invoke;
    uint64_t v9 = &unk_1E5B75F80;
    id v10 = self;
    id v11 = v4;
    [v5 performWithLockSync:&v6];

    [(RCKeyValueStore *)self _queueSave];
  }
}

uint64_t __40__RCKeyValueStore_removeObjectsForKeys___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectsByKey];
  [v2 removeObjectsForKeys:*(void *)(a1 + 40)];

  id v3 = *(void **)(a1 + 32);

  return [v3 setNeedSave:1];
}

- (void)removeAllObjects
{
  id v3 = [(RCKeyValueStore *)self writeLock];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__RCKeyValueStore_removeAllObjects__block_invoke;
  v4[3] = &unk_1E5B76100;
  v4[4] = self;
  [v3 performWithLockSync:v4];

  [(RCKeyValueStore *)self _queueSave];
}

uint64_t __35__RCKeyValueStore_removeAllObjects__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectsByKey];
  [v2 removeAllObjects];

  id v3 = *(void **)(a1 + 32);

  return [v3 setNeedSave:1];
}

- (void)updateObjectsForKeys:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (v7 && v8)
  {
    uint64_t v9 = [(RCKeyValueStore *)self writeLock];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__RCKeyValueStore_updateObjectsForKeys_withBlock___block_invoke;
    v10[3] = &unk_1E5B76CB0;
    id v11 = v6;
    id v12 = self;
    id v13 = v7;
    [v9 performWithLockSync:v10];

    [(RCKeyValueStore *)self _queueSave];
  }
}

uint64_t __50__RCKeyValueStore_updateObjectsForKeys_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "objectsByKey", (void)v13);
        uint64_t v9 = [v8 objectForKey:v7];

        if (v9)
        {
          id v10 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          id v11 = [*(id *)(a1 + 40) objectsByKey];
          [v11 setObject:v10 forKey:v7];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) setNeedSave:1];
}

- (id)objectsForKeys:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RCKeyValueStore *)self objectsByKey];
  uint64_t v6 = objc_msgSend(v5, "rc_subdictionaryForKeys:", v4);

  return v6;
}

- (void)setBoolValue:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(RCKeyValueStore *)self setObject:v8 forKey:v7];
}

- (BOOL)BOOLValueForKey:(id)a3
{
  uint64_t v3 = [(RCKeyValueStore *)self objectForKey:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)addAllEntriesToDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(RCKeyValueStore *)self objectsByKey];
  [v4 addEntriesFromDictionary:v5];
}

- (NSDictionary)asDictionary
{
  id v2 = [(RCKeyValueStore *)self objectsByKey];
  uint64_t v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (void)saveWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RCKeyValueStore *)self saveThrottler];
  [v5 tickleWithCompletion:v4];
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
}

- (id)_dictionary
{
  uint64_t v3 = [(RCKeyValueStore *)self writeLock];
  [v3 lock];

  id v4 = [(RCKeyValueStore *)self objectsByKey];
  id v5 = (void *)[v4 copy];

  uint64_t v6 = [(RCKeyValueStore *)self writeLock];
  [v6 unlock];

  return v5;
}

- (void)_saveAsyncWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() persistenceQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__RCKeyValueStore__saveAsyncWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5B75FF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

void __51__RCKeyValueStore__saveAsyncWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) _persistOnlyInMemoryEnabled])
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __51__RCKeyValueStore__saveAsyncWithCompletionHandler___block_invoke_2;
    v28[3] = &unk_1E5B76128;
    id v29 = *(id *)(a1 + 40);
    __51__RCKeyValueStore__saveAsyncWithCompletionHandler___block_invoke_2((uint64_t)v28);
    uint64_t v3 = v29;
    goto LABEL_24;
  }
  id v4 = [*v2 writeLock];
  [v4 lock];

  if ([*v2 needSave])
  {
    id v5 = [*v2 objectsByKey];
    uint64_t v3 = (void *)[v5 copy];
  }
  else
  {
    uint64_t v3 = 0;
  }
  [*v2 setNeedSave:0];
  id v6 = [*v2 writeLock];
  [v6 unlock];

  if (v3)
  {
    id v7 = [*v2 storeDirectory];
    id v8 = [*v2 name];
    uint64_t v9 = [v7 stringByAppendingPathComponent:v8];

    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
    [v10 setObject:&unk_1EF8E1D88 forKeyedSubscript:@"version"];
    id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*v2, "clientVersion"));
    [v10 setObject:v11 forKeyedSubscript:@"clientVersion"];

    [v10 setObject:v3 forKeyedSubscript:@"data"];
    id v27 = 0;
    id v12 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v10 format:200 options:0 error:&v27];
    id v13 = v27;
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __51__RCKeyValueStore__saveAsyncWithCompletionHandler___block_invoke_cold_1(v2, (uint64_t)v13);
      }
      long long v14 = RCSharedLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        long long v15 = [*v2 name];
        *(_DWORD *)buf = 138543618;
        v31 = v15;
        __int16 v32 = 2114;
        double v33 = *(double *)&v13;
        _os_log_impl(&dword_1A4AB3000, v14, OS_LOG_TYPE_ERROR, "failed to serialize %{public}@ key-value store plist with error: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (!v12)
      {
LABEL_21:

        goto LABEL_22;
      }
      objc_msgSend(*v2, "setStoreSize:", objc_msgSend(v12, "length"));
      double Current = CFAbsoluteTimeGetCurrent();
      long long v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
      [v12 writeToURL:v14 atomically:1];
      v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*v2, "_isBackupEnabled") ^ 1);
      uint64_t v18 = *MEMORY[0x1E4F1C630];
      id v26 = 0;
      char v19 = [v14 setResourceValue:v17 forKey:v18 error:&v26];
      id v25 = v26;

      if ((v19 & 1) == 0)
      {
        v20 = RCSharedLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v31 = v14;
          __int16 v32 = 2114;
          double v33 = *(double *)&v25;
          _os_log_impl(&dword_1A4AB3000, v20, OS_LOG_TYPE_ERROR, "Failed to set backup status for %{public}@ -- %{public}@", buf, 0x16u);
        }
      }
      double v21 = CFAbsoluteTimeGetCurrent();
      int v22 = RCSharedLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v23 = [*v2 name];
        *(_DWORD *)buf = 138412546;
        v31 = v23;
        __int16 v32 = 2048;
        double v33 = v21 - Current;
        _os_log_impl(&dword_1A4AB3000, v22, OS_LOG_TYPE_DEBUG, "Saved %@ cache in %f ms", buf, 0x16u);
      }
      [*v2 _logCacheStatus];
    }
    goto LABEL_21;
  }
LABEL_22:
  uint64_t v24 = *(void *)(a1 + 40);
  if (v24) {
    (*(void (**)(void))(v24 + 16))();
  }
LABEL_24:
}

uint64_t __51__RCKeyValueStore__saveAsyncWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_logCacheStatus
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(RCKeyValueStore *)self storeSize];
  id v4 = RCSharedLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [(RCKeyValueStore *)self name];
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2048;
    double v9 = (float)((float)v3 * 0.00000095367);
    _os_log_impl(&dword_1A4AB3000, v4, OS_LOG_TYPE_DEBUG, "Cache Status:\n* Cache name:\t\t%@\n* Total size (MB):\t%2.4f\n*", (uint8_t *)&v6, 0x16u);
  }
}

- (void)_queueSave
{
  id v2 = [(RCKeyValueStore *)self saveThrottler];
  [v2 tickle];
}

- (void)_clearStore
{
  unint64_t v3 = [(RCKeyValueStore *)self storeDirectory];
  id v4 = [(RCKeyValueStore *)self name];
  id v6 = [v3 stringByAppendingPathComponent:v4];

  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v5 removeItemAtPath:v6 error:0];

  [(RCKeyValueStore *)self setStoreSize:0];
}

- (BOOL)_shouldMigrateOnUpgrade
{
  return (LOBYTE(self->_optionsMask) >> 1) & 1;
}

- (BOOL)_isBackupEnabled
{
  return self->_optionsMask & 1;
}

- (BOOL)_persistOnlyInMemoryEnabled
{
  return (LOBYTE(self->_optionsMask) >> 2) & 1;
}

- (void)setOptionBackupEnabled:(BOOL)a3
{
  id v5 = [(RCKeyValueStore *)self writeLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__RCKeyValueStore_setOptionBackupEnabled___block_invoke;
  v6[3] = &unk_1E5B76CD8;
  BOOL v7 = a3;
  v6[4] = self;
  [v5 performWithLockSync:v6];
}

uint64_t __42__RCKeyValueStore_setOptionBackupEnabled___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 56) = *(void *)(*(void *)(result + 32) + 56) & 0xFFFFFFFFFFFFFFFELL | *(unsigned __int8 *)(result + 40);
  return result;
}

- (BOOL)shouldExportJSONSidecar
{
  return self->_shouldExportJSONSidecar;
}

- (void)setShouldExportJSONSidecar:(BOOL)a3
{
  self->_shouldExportJSONSidecar = a3;
}

- (void)setName:(id)a3
{
}

- (unint64_t)storeSize
{
  return self->_storeSize;
}

- (void)setObjectsByKey:(id)a3
{
}

- (BOOL)needSave
{
  return self->_needSave;
}

- (void)setNeedSave:(BOOL)a3
{
  self->_needSave = a3;
}

- (void)setStoreDirectory:(id)a3
{
}

- (void)setClientVersion:(unint64_t)a3
{
  self->_clientVersion = a3;
}

- (unint64_t)optionsMask
{
  return self->_optionsMask;
}

- (void)setOptionsMask:(unint64_t)a3
{
  self->_optionsMask = a3;
}

- (RCKeyValueStoreMigrating)migrator
{
  return self->_migrator;
}

- (void)setMigrator:(id)a3
{
}

- (RCMutexLock)writeLock
{
  return self->_writeLock;
}

- (void)setWriteLock:(id)a3
{
}

- (RCOperationThrottler)saveThrottler
{
  return self->_saveThrottler;
}

- (void)setSaveThrottler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveThrottler, 0);
  objc_storeStrong((id *)&self->_writeLock, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong((id *)&self->_storeDirectory, 0);
  objc_storeStrong((id *)&self->_objectsByKey, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setObject:forKey:.cold.1()
{
  id v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"key", v6, 2u);
}

- (void)setObjects:forKeys:.cold.1()
{
  id v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"keys", v6, 2u);
}

- (void)setObjects:forKeys:.cold.2()
{
  id v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"objects", v6, 2u);
}

- (void)addEntriesFromDictionary:.cold.1()
{
  id v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"otherDictionary", v6, 2u);
}

- (void)_loadFromDisk
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v0 = (void *)[[NSString alloc] initWithFormat:@"must have a migrator in order to migrate between KVS client versions"];
  int v1 = 136315906;
  int v2 = "-[RCKeyValueStore _loadFromDisk]";
  __int16 v3 = 2080;
  int v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Persistence/RCKeyValueStore.m";
  __int16 v5 = 1024;
  int v6 = 329;
  __int16 v7 = 2114;
  __int16 v8 = v0;
  _os_log_error_impl(&dword_1A4AB3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

void __51__RCKeyValueStore__saveAsyncWithCompletionHandler___block_invoke_cold_1(id *a1, uint64_t a2)
{
  id v4 = [NSString alloc];
  __int16 v5 = [*a1 name];
  uint64_t v12 = a2;
  int v6 = (void *)[v4 initWithFormat:@"failed to serialize %@ key-value store plist with error: %@"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v7, "*** Assertion failure: %s %s:%d %{public}@", v8, v9, v10, v11, (uint64_t)v5, v12, 2u);
}

- (void)_initializeStoreDirectoryWithName:(uint64_t)a1 .cold.1(uint64_t a1)
{
  int v1 = (void *)[[NSString alloc] initWithFormat:@"failed to create cache directory with error: %@"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v2, "*** Assertion failure: %s %s:%d %{public}@", v3, v4, v5, v6, a1, v8, 2u);
}

@end