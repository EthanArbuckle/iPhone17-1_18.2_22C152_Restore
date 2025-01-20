@interface MTPersistentSyncChangeStore
- (MTPersistentSyncChangeStore)initWithDataModel:(id)a3;
- (NAScheduler)archiverScheduler;
- (NSString)syncDataFile;
- (NSString)syncDataPath;
- (id)loadChanges;
- (void)_removeSyncDataFile;
- (void)persistChanges:(id)a3;
- (void)setSyncDataFile:(id)a3;
- (void)setSyncDataPath:(id)a3;
- (void)setupSyncDataFileForDataModel:(id)a3;
@end

@implementation MTPersistentSyncChangeStore

- (MTPersistentSyncChangeStore)initWithDataModel:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTPersistentSyncChangeStore;
  v5 = [(MTPersistentSyncChangeStore *)&v12 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v7 = (void *)MEMORY[0x1E4F7A0F0];
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.MTSyncStore.archive-queue", v6);
    uint64_t v9 = [v7 schedulerWithDispatchQueue:v8];
    archiverScheduler = v5->_archiverScheduler;
    v5->_archiverScheduler = (NAScheduler *)v9;

    [(MTPersistentSyncChangeStore *)v5 setupSyncDataFileForDataModel:v4];
  }

  return v5;
}

- (void)setupSyncDataFileForDataModel:(id)a3
{
  id v4 = a3;
  v5 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v6 = [v5 firstObject];
  v7 = [MEMORY[0x1E4F28B50] mainBundle];
  dispatch_queue_t v8 = [v7 bundleIdentifier];
  uint64_t v9 = [v6 stringByAppendingPathComponent:v8];
  [(MTPersistentSyncChangeStore *)self setSyncDataPath:v9];

  id v12 = [v4 dataFileName];

  v10 = [(MTPersistentSyncChangeStore *)self syncDataPath];
  v11 = [v10 stringByAppendingPathComponent:v12];
  [(MTPersistentSyncChangeStore *)self setSyncDataFile:v11];
}

- (void)persistChanges:(id)a3
{
  id v4 = a3;
  v5 = [(MTPersistentSyncChangeStore *)self archiverScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__MTPersistentSyncChangeStore_persistChanges___block_invoke;
  v7[3] = &unk_1E5915000;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

void __46__MTPersistentSyncChangeStore_persistChanges___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = (id *)(a1 + 32);
  id v4 = [*(id *)(a1 + 32) syncDataFile];
  char v5 = [v2 fileExistsAtPath:v4];

  if (v5) {
    goto LABEL_7;
  }
  id v6 = MTLogForCategory(6);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = *v3;
    id v8 = [*v3 syncDataPath];
    *(_DWORD *)buf = 138543618;
    id v23 = v7;
    __int16 v24 = 2114;
    v25 = v8;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ creating sync directory at %{public}@", buf, 0x16u);
  }
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  v10 = [*v3 syncDataPath];
  id v21 = 0;
  [v9 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v21];
  id v11 = v21;

  if (!v11)
  {
LABEL_7:
    id v11 = [(NSKeyedArchiver *)[MTSyncChangeArchiver alloc] initRequiringSecureCoding:1];
    [v11 encodeObject:*(void *)(a1 + 40) forKey:@"MTSyncStoragePendingChanges"];
    LODWORD(v13) = 4.0;
    [v11 encodeFloat:@"MTSyncStorageVersion" forKey:v13];
    [v11 finishEncoding];
    id v12 = [v11 encodedData];
    v14 = [*(id *)(a1 + 32) syncDataFile];
    int v15 = [v12 writeToFile:v14 atomically:1];

    v16 = MTLogForCategory(6);
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(void **)(a1 + 32);
        v19 = *(void **)(a1 + 40);
        v20 = [v18 syncDataFile];
        *(_DWORD *)buf = 138543874;
        id v23 = v18;
        __int16 v24 = 2114;
        v25 = v19;
        __int16 v26 = 2114;
        v27 = v20;
        _os_log_impl(&dword_19CC95000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ wrote pending changes %{public}@ to file %{public}@", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __46__MTPersistentSyncChangeStore_persistChanges___block_invoke_cold_1((id *)(a1 + 32));
    }
  }
  else
  {
    id v12 = MTLogForCategory(6);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __46__MTPersistentSyncChangeStore_persistChanges___block_invoke_cold_2((id *)(a1 + 32));
    }
  }
}

- (id)loadChanges
{
  v3 = objc_opt_new();
  id v4 = [(MTPersistentSyncChangeStore *)self archiverScheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__MTPersistentSyncChangeStore_loadChanges__block_invoke;
  v9[3] = &unk_1E5915000;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [v4 performBlock:v9];

  id v6 = v10;
  id v7 = v5;

  return v7;
}

void __42__MTPersistentSyncChangeStore_loadChanges__block_invoke(uint64_t a1)
{
  v34[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = (id *)(a1 + 32);
  id v4 = [*(id *)(a1 + 32) syncDataFile];
  int v5 = [v2 fileExistsAtPath:v4 isDirectory:0];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    id v7 = [*v3 syncDataFile];
    id v8 = (void *)[v6 initWithContentsOfFile:v7];

    if (v8)
    {
      id v27 = 0;
      uint64_t v9 = (void *)[[MTSyncChangeUnarchiver alloc] initForReadingFromData:v8 error:&v27];
      id v10 = v27;
      if (v10)
      {
        id v11 = MTLogForCategory(6);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          __42__MTPersistentSyncChangeStore_loadChanges__block_invoke_cold_3((void *)(a1 + 32));
        }

        [*(id *)(a1 + 32) _removeSyncDataFile];
        [*(id *)(a1 + 40) finishWithResult:MEMORY[0x1E4F1CBF0]];
      }
      else
      {
        [v9 decodeFloatForKey:@"MTSyncStorageVersion"];
        if (v15 >= 4.0)
        {
          v18 = (void *)MEMORY[0x1E4F1CAD0];
          v34[0] = objc_opt_class();
          v34[1] = objc_opt_class();
          v34[2] = objc_opt_class();
          v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:3];
          v20 = [v18 setWithArray:v19];
          id v21 = [v9 decodeObjectOfClasses:v20 forKey:@"MTSyncStoragePendingChanges"];

          v22 = MTLogForCategory(6);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            id v23 = *v3;
            __int16 v24 = [*v3 syncDataFile];
            *(_DWORD *)buf = 138543874;
            id v29 = v23;
            __int16 v30 = 2114;
            v31 = v21;
            __int16 v32 = 2114;
            v33 = v24;
            _os_log_impl(&dword_19CC95000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ read pending changes %{public}@ from file %{public}@", buf, 0x20u);
          }
          v25 = v21;
          if (!v21)
          {
            __int16 v26 = MTLogForCategory(6);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              __42__MTPersistentSyncChangeStore_loadChanges__block_invoke_cold_2((uint64_t *)(a1 + 32), v26);
            }

            v25 = (void *)MEMORY[0x1E4F1CBF0];
          }
          [*(id *)(a1 + 40) finishWithResult:v25];
        }
        else
        {
          v16 = MTLogForCategory(6);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = *v3;
            *(_DWORD *)buf = 138543362;
            id v29 = v17;
            _os_log_impl(&dword_19CC95000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ stored sync version is too old", buf, 0xCu);
          }

          [*v3 _removeSyncDataFile];
          [*(id *)(a1 + 40) finishWithResult:MEMORY[0x1E4F1CBF0]];
        }
        [v9 finishDecoding];
      }
    }
    else
    {
      [*(id *)(a1 + 40) finishWithResult:MEMORY[0x1E4F1CBF0]];
    }
  }
  else
  {
    id v12 = MTLogForCategory(6);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = *v3;
      v14 = [*v3 syncDataFile];
      *(_DWORD *)buf = 138543618;
      id v29 = v13;
      __int16 v30 = 2114;
      v31 = v14;
      _os_log_impl(&dword_19CC95000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ had no pending changes in file %{public}@", buf, 0x16u);
    }
    [*(id *)(a1 + 40) finishWithResult:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)_removeSyncDataFile
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v1, v2, "%{public}@ failed to remove bogus pending changes with error %{public}@", (void)v3, DWORD2(v3));
}

- (NAScheduler)archiverScheduler
{
  return self->_archiverScheduler;
}

- (NSString)syncDataPath
{
  return self->_syncDataPath;
}

- (void)setSyncDataPath:(id)a3
{
}

- (NSString)syncDataFile
{
  return self->_syncDataFile;
}

- (void)setSyncDataFile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncDataFile, 0);
  objc_storeStrong((id *)&self->_syncDataPath, 0);
  objc_storeStrong((id *)&self->_archiverScheduler, 0);
}

void __46__MTPersistentSyncChangeStore_persistChanges___block_invoke_cold_1(id *a1)
{
  uint64_t v1 = [*a1 syncDataFile];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19CC95000, v2, v3, "%{public}@ failed to write pending changes to file %{public}@", v4, v5, v6, v7, v8);
}

void __46__MTPersistentSyncChangeStore_persistChanges___block_invoke_cold_2(id *a1)
{
  uint64_t v1 = [*a1 syncDataPath];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19CC95000, v2, v3, "%{public}@ failed to write create directory at %{public}@", v4, v5, v6, v7, v8);
}

void __42__MTPersistentSyncChangeStore_loadChanges__block_invoke_cold_1(void *a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v1, v2, "%{public}@ caught exception %{public}@ when trying to read pending changes", (void)v3, DWORD2(v3));
}

void __42__MTPersistentSyncChangeStore_loadChanges__block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_19CC95000, a2, OS_LOG_TYPE_ERROR, "%{public}@ got nil pending changes.", (uint8_t *)&v3, 0xCu);
}

void __42__MTPersistentSyncChangeStore_loadChanges__block_invoke_cold_3(void *a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_19CC95000, v1, v2, "%{public}@ unarchiving failed with error %{public}@", (void)v3, DWORD2(v3));
}

@end