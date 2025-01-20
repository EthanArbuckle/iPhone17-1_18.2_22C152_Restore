@interface TRIAssetStore
+ (id)shortHashForAssetIdentifier:(id)a3;
- ($A5A652246548B43F8BC05201A1C72A70)_saveDirectoryAssetWithIdentifier:(id)a3 assetFilename:(id)a4 metadata:(id)a5 flockWitness:(TRIFlockWitness_ *)a6 error:(id *)a7;
- ($A5A652246548B43F8BC05201A1C72A70)saveAssetWithIdentifier:(id)a3 assetURL:(id)a4 metadata:(id)a5 error:(id *)a6;
- (BOOL)_acquireLockfileAndRunBlock:(id)a3;
- (BOOL)_clearUnrefAgeForAssetWithIdentifier:(id)a3;
- (BOOL)_forceRemoveItemAtPath:(id)a3;
- (BOOL)_isDirectoryAtPath:(id)a3 matchingAssetContentAtPath:(id)a4;
- (BOOL)_isFileAtPath:(id)a3 matchingAssetContentAtPath:(id)a4;
- (BOOL)_linkDirectoryAssetWithIdentifier:(id)a3 toCurrentPath:(id)a4 futurePath:(id)a5 flockWitness:(TRIFlockWitness_ *)a6;
- (BOOL)_linkFileAssetWithIdentifier:(id)a3 toCurrentPath:(id)a4 futurePath:(id)a5 flockWitness:(TRIFlockWitness_ *)a6;
- (BOOL)_nonAtomicOverwriteWithSrc:(id)a3 dest:(id)a4 finalPermissionBits:(const unsigned __int16 *)a5;
- (BOOL)_overwriteRenameAsAtomicallyAsPossibleWithSrc:(id)a3 dest:(id)a4;
- (BOOL)_saveFileAssetWithIdentifier:(id)a3 assetFilename:(id)a4 flockWitness:(TRIFlockWitness_ *)a5;
- (BOOL)_saveFileAssetWithIdentifier:(id)a3 assetFilename:(id)a4 workingTempDirectory:(id)a5 flockWitness:(TRIFlockWitness_ *)a6;
- (BOOL)collectGarbageOlderThanNumScans:(unsigned int)a3 deletedAssetSize:(unint64_t *)a4;
- (BOOL)collectGarbageOlderThanNumScans:(unsigned int)a3 ignoreRecentlyCreatedAssets:(BOOL)a4 deletedAssetSize:(unint64_t *)a5 deletedAssetIds:(id *)a6;
- (BOOL)hasAssetWithIdentifier:(id)a3 type:(unsigned __int8 *)a4;
- (BOOL)isValidTargetForSymlink:(id)a3 assetIdentifier:(id)a4;
- (BOOL)linkAssetWithIdentifier:(id)a3 toCurrentPath:(id)a4 futurePath:(id)a5;
- (BOOL)linkAssetWithIdentifier:(id)a3 toPath:(id)a4;
- (BOOL)referenceMAAutoAssetWithId:(id)a3 isFileFactor:(BOOL)a4 usingCurrentPath:(id)a5 futurePath:(id)a6;
- (BOOL)removeAssetWithIdentifier:(id)a3;
- (BOOL)saveAssetWithIdentifier:(id)a3 assetData:(id)a4 type:(unsigned __int8)a5;
- (BOOL)saveAssetWithIdentifier:(id)a3 builtFromAssetWithIdentifier:(id)a4 patchFilename:(id)a5 metadata:(id)a6 error:(id *)a7;
- (BOOL)setCreationDate:(id)a3 forAssetIdentifier:(id)a4;
- (TRIAssetStore)initWithGlobalPaths:(id)a3;
- (TRIAssetStore)initWithPaths:(id)a3;
- (TRIAssetStore)initWithPaths:(id)a3 extractor:(id)a4 patcher:(id)a5;
- (TRIAssetStore)initWithPaths:(id)a3 extractor:(id)a4 patcher:(id)a5 monitoredActivity:(id)a6;
- (TRIAssetStore)initWithPaths:(id)a3 monitoredActivity:(id)a4;
- (TRIAssetStoreOperations)assetOperator;
- (id)_createTempDir;
- (id)_requireAssetStoreTempDir;
- (id)pathForAssetContentWithIdentifier:(id)a3;
- (id)pathForAssetDirWithIdentifier:(id)a3;
- (id)pathForRefsToAssetWithIdentifier:(id)a3;
- (unint64_t)removableAssetsSizeOlderThanNumScans:(unsigned int)a3 ignoreRecentlyCreatedAssets:(BOOL)a4 includedCacheDeletableAssetIds:(id)a5 deleteableAssetIds:(id *)a6;
- (unint64_t)removableAssetsSizeOlderThanNumScans:(unsigned int)a3 includedCacheDeletableAssetIds:(id)a4;
- (void)_fixupPermissionsOnPath:(id)a3 permissionBits:(const unsigned __int16 *)a4;
- (void)enumerateAssetDirsUsingBlock:(id)a3;
- (void)enumerateSavedAssetsUsingBlock:(id)a3;
- (void)fixFileProtectionForAssetStoreFiles;
- (void)setAssetOperator:(id)a3;
@end

@implementation TRIAssetStore

- (TRIAssetStore)initWithPaths:(id)a3 extractor:(id)a4 patcher:(id)a5
{
  return [(TRIAssetStore *)self initWithPaths:a3 extractor:a4 patcher:a5 monitoredActivity:0];
}

- (BOOL)_acquireLockfileAndRunBlock:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint8_t *))a3;
  v5 = (void *)MEMORY[0x1E016E7F0]();
  v6 = [(TRIPaths *)self->_paths assetStoreUsingGlobal:self->_useGlobalPaths];
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v29 = 0;
  char v8 = [v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v29];
  id v9 = v29;

  if ((v8 & 1) == 0)
  {
    v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v31 = v9;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Failed to create AssetStore: %{public}@", buf, 0xCu);
    }
  }
  id v11 = [v6 stringByAppendingPathComponent:@"lock"];
  int v12 = open((const char *)[v11 fileSystemRepresentation], 514, 432);
  int v13 = v12;
  if (v12 < 0)
  {
    v16 = TRILogCategory_Server();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v23 = __error();
      v24 = strerror(*v23);
      int v25 = *__error();
      *(_DWORD *)buf = 138543874;
      id v31 = v11;
      __int16 v32 = 2080;
      v33 = v24;
      __int16 v34 = 1024;
      int v35 = v25;
      _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "Failed to open lockfile %{public}@: %s (%d)", buf, 0x1Cu);
    }

    char v15 = 0;
  }
  else
  {
    if (flock(v12, 2))
    {
      v14 = TRILogCategory_Server();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v20 = __error();
        v21 = strerror(*v20);
        int v22 = *__error();
        *(_DWORD *)buf = 138543874;
        id v31 = v11;
        __int16 v32 = 2080;
        v33 = v21;
        __int16 v34 = 1024;
        int v35 = v22;
        _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Failed to acquire lockfile %{public}@: %s (%d)", buf, 0x1Cu);
      }

      char v15 = 0;
    }
    else
    {
      v17 = (void *)MEMORY[0x1E016E7F0]();
      *(_DWORD *)buf = v13;
      v4[2](v4, buf);
      if (flock(v13, 8))
      {
        v18 = TRILogCategory_Server();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v26 = __error();
          v27 = strerror(*v26);
          int v28 = *__error();
          *(_DWORD *)buf = 138543874;
          id v31 = v11;
          __int16 v32 = 2080;
          v33 = v27;
          __int16 v34 = 1024;
          int v35 = v28;
          _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Failed to unlock lockfile %{public}@: %s (%d)", buf, 0x1Cu);
        }
      }
      char v15 = 1;
    }
    close(v13);
  }

  return v15 & 1;
}

- (id)_requireAssetStoreTempDir
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [(TRIPaths *)self->_paths assetStoreUsingGlobal:self->_useGlobalPaths];
  v3 = [v2 stringByAppendingPathComponent:@"tmp"];

  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v14 = 0;
  char v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v14];
  id v6 = v14;

  if ((v5 & 1) == 0)
  {
    v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v19.st_dev = 138543618;
      *(void *)&v19.st_mode = v3;
      WORD2(v19.st_ino) = 2114;
      *(__darwin_ino64_t *)((char *)&v19.st_ino + 6) = (__darwin_ino64_t)v6;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Failed to create directory %{public}@: %{public}@", (uint8_t *)&v19, 0x16u);
    }
  }
  memset(&v19, 0, sizeof(v19));
  id v8 = v3;
  if (stat((const char *)[v8 fileSystemRepresentation], &v19))
  {
    id v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = __error();
      int v13 = strerror(*v12);
      *(_DWORD *)buf = 138543618;
      id v16 = v8;
      __int16 v17 = 2080;
      v18 = v13;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Could not stat temporary directory %{public}@: %s", buf, 0x16u);
    }
  }
  else
  {
    v10 = (const char *)[v8 fileSystemRepresentation];
    chmod(v10, v19.st_mode | 0x92);
  }

  return v8;
}

- (TRIAssetStore)initWithPaths:(id)a3
{
  return [(TRIAssetStore *)self initWithPaths:a3 monitoredActivity:0];
}

- (TRIAssetStore)initWithGlobalPaths:(id)a3
{
  result = [(TRIAssetStore *)self initWithPaths:a3];
  result->_useGlobalPaths = 1;
  return result;
}

- (TRIAssetStore)initWithPaths:(id)a3 monitoredActivity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[TRIRemoteAssetExtractor alloc] initWithMonitoredActivity:v6];
  id v9 = [[TRIRemoteAssetPatcher alloc] initWithMonitoredActivity:v6];
  v10 = [(TRIAssetStore *)self initWithPaths:v7 extractor:v8 patcher:v9 monitoredActivity:v6];

  return v10;
}

- (TRIAssetStore)initWithPaths:(id)a3 extractor:(id)a4 patcher:(id)a5 monitoredActivity:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2 object:self file:@"TRIAssetStore.m" lineNumber:141 description:@"XPC activity monitoring is available only for TRIRemoteAssetExtractor"];
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)TRIAssetStore;
  id v16 = [(TRIAssetStore *)&v24 init];
  __int16 v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_paths, a3);
    objc_storeStrong((id *)&v17->_extractor, a4);
    objc_storeStrong((id *)&v17->_patcher, a5);
    objc_storeStrong((id *)&v17->_monitoredActivity, a6);
    uint64_t v18 = objc_opt_new();
    storageManagement = v17->_storageManagement;
    v17->_storageManagement = (TRIStorageManagementProtocol *)v18;

    v17->_useGlobalPaths = 0;
    uint64_t v20 = [[TRIAssetStoreOperator alloc] initWithPaths:v12 storageManagement:v17->_storageManagement assetStore:v17];
    assetOperator = v17->_assetOperator;
    v17->_assetOperator = (TRIAssetStoreOperations *)v20;
  }
  return v17;
}

- (BOOL)saveAssetWithIdentifier:(id)a3 assetData:(id)a4 type:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(TRIAssetStore *)self _requireAssetStoreTempDir];
  id v11 = [NSString alloc];
  uint64_t v12 = objc_opt_new();
  id v13 = [(id)v12 UUIDString];
  id v14 = (void *)[v11 initWithFormat:@"temp-asset-%@", v13];
  id v15 = [v10 stringByAppendingPathComponent:v14];

  id v23 = 0;
  LOBYTE(v12) = [v9 writeToFile:v15 options:0 error:&v23];
  id v16 = v23;
  if (v12)
  {
    __int16 v17 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v15];
    uint64_t v18 = -[TRICKAssetMetadata initWithType:namespaceNameForEncryptionKey:treatmentIndex:downloadSize:compressionMode:]([TRICKAssetMetadata alloc], "initWithType:namespaceNameForEncryptionKey:treatmentIndex:downloadSize:compressionMode:", v5, 0, 0, [v9 length], 0);
    BOOL v19 = [(TRIAssetStore *)self saveAssetWithIdentifier:v8 assetURL:v17 metadata:v18 error:0] == 1;

    uint64_t v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v20 triForceRemoveItemAtPath:v15 error:0];
  }
  else
  {
    v21 = TRILogCategory_Server();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v16;
      _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "Failed to write NSData asset to temp file: %{public}@", buf, 0xCu);
    }

    BOOL v19 = 0;
  }

  return v19;
}

- ($A5A652246548B43F8BC05201A1C72A70)saveAssetWithIdentifier:(id)a3 assetURL:(id)a4 metadata:(id)a5 error:(id *)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_10:
    int v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"TRIAssetStore.m", 205, @"Invalid parameter not satisfying: %@", @"assetURL" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"TRIAssetStore.m", 204, @"Invalid parameter not satisfying: %@", @"assetIdentifier" object file lineNumber description];

  if (!v12) {
    goto LABEL_10;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_11:
  id v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"TRIAssetStore.m", 206, @"Invalid parameter not satisfying: %@", @"metadata" object file lineNumber description];

LABEL_4:
  id v14 = TRILogCategory_Server();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [(TRIPaths *)self->_paths assetStore];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v15;
    _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "Save asset %{public}@ to asset store: %{public}@", buf, 0x16u);
  }
  uint64_t v31 = 0;
  __int16 v32 = &v31;
  uint64_t v33 = 0x2810000000;
  __int16 v34 = "";
  char v35 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v37 = __Block_byref_object_copy__26;
  v38 = __Block_byref_object_dispose__26;
  id v39 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __65__TRIAssetStore_saveAssetWithIdentifier_assetURL_metadata_error___block_invoke;
  v24[3] = &unk_1E6BBB8F8;
  v24[4] = self;
  id v16 = v11;
  id v25 = v16;
  int v28 = &v31;
  id v17 = v13;
  id v26 = v17;
  id v18 = v12;
  id v29 = buf;
  SEL v30 = a2;
  id v27 = v18;
  [(TRIAssetStore *)self _acquireLockfileAndRunBlock:v24];
  if (a6) {
    *a6 = *(id *)(*(void *)&buf[8] + 40);
  }
  v19.var0 = *((unsigned char *)v32 + 32);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v31, 8);

  return v19;
}

void __65__TRIAssetStore_saveAssetWithIdentifier_assetURL_metadata_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) hasAssetWithIdentifier:*(void *)(a1 + 40) type:0])
  {
    v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "Warning: treating asset save as a no-op because asset is already present.", buf, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = 1;
    return;
  }
  uint64_t v5 = [*(id *)(a1 + 48) namespaceNameForEncryptionKey];

  if (!v5)
  {
    uint64_t v12 = [*(id *)(a1 + 56) path];
    if (v12)
    {
      id v13 = (void *)v12;
      id v7 = 0;
      goto LABEL_14;
    }
    v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 32), @"TRIAssetStore.m", 286, @"Expression was unexpectedly nil/false: %@", @"assetURL.path" object file lineNumber description];

    id v7 = 0;
LABEL_52:
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 32), @"TRIAssetStore.m", 288, @"Invalid parameter not satisfying: %@", @"assetFilename" object file lineNumber description];

    id v13 = 0;
LABEL_14:
    id v14 = (void *)os_transaction_create();
    int v15 = [*(id *)(a1 + 48) type];
    if (v15 == 1)
    {
      id v18 = *(void **)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 40);
      uint64_t v20 = *(void *)(a1 + 48);
      uint64_t v21 = *(void *)(*(void *)(a1 + 72) + 8);
      id obj = *(id *)(v21 + 40);
      char v16 = [v18 _saveDirectoryAssetWithIdentifier:v19 assetFilename:v13 metadata:v20 flockWitness:a2 error:&obj];
      objc_storeStrong((id *)(v21 + 40), obj);
    }
    else
    {
      if (v15)
      {
LABEL_25:
        if (v7) {
          [*(id *)(a1 + 32) _forceRemoveItemAtPath:v7];
        }

        return;
      }
      char v16 = [*(id *)(a1 + 32) _saveFileAssetWithIdentifier:*(void *)(a1 + 40) assetFilename:v13 flockWitness:a2];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = v16;
    goto LABEL_25;
  }
  uint64_t v6 = [*(id *)(a1 + 32) _createTempDir];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [*(id *)(a1 + 56) lastPathComponent];
    if (!v8)
    {
      v10 = TRILogCategory_Server();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v42 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        id v55 = v42;
        _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "assetURL for encrypted asset %{public}@ has nil lastPathComponent", buf, 0xCu);
      }
      char v11 = 0;
      goto LABEL_49;
    }
    id v9 = *(xpc_activity_t **)(a1 + 32);
    if (v9[4])
    {
      if (xpc_activity_should_defer(v9[4]))
      {
        v10 = TRILogCategory_Server();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          char v11 = 2;
          _os_log_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEFAULT, "Deferral requested before start of asset decryption.", buf, 2u);
        }
        else
        {
          char v11 = 2;
        }
LABEL_49:

        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = v11;
        goto LABEL_50;
      }
      id v9 = *(xpc_activity_t **)(a1 + 32);
    }
    int v22 = [(xpc_activity_t *)v9 _requireAssetStoreTempDir];
    id v23 = [NSString alloc];
    objc_super v24 = objc_opt_new();
    id v25 = [v24 UUIDString];
    id v26 = (void *)[v23 initWithFormat:@"encrypted-asset-%@", v25];
    id v27 = [v22 stringByAppendingPathComponent:v26];

    int v28 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v29 = [*(id *)(a1 + 56) path];
    if (!v29)
    {
      v48 = [MEMORY[0x1E4F28B00] currentHandler];
      [v48 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 32), @"TRIAssetStore.m", 255, @"Expression was unexpectedly nil/false: %@", @"assetURL.path" object file lineNumber description];
    }
    uint64_t v30 = *(void *)(*(void *)(a1 + 72) + 8);
    id v53 = *(id *)(v30 + 40);
    char v31 = [v28 copyItemAtPath:v29 toPath:v27 error:&v53];
    objc_storeStrong((id *)(v30 + 40), v53);

    if (v31)
    {
      __int16 v32 = [v8 stringByAppendingPathExtension:@"decrypted"];
      if (!v32)
      {
        v49 = [MEMORY[0x1E4F28B00] currentHandler];
        [v49 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 32), @"TRIAssetStore.m", 266, @"Expression was unexpectedly nil/false: %@", @"[assetFileName stringByAppendingPathExtension:@\"decrypted\"]" object file lineNumber description];
      }
      id v13 = [v7 stringByAppendingPathComponent:v32];

      uint64_t v33 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v27];
      __int16 v34 = [*(id *)(a1 + 48) namespaceNameForEncryptionKey];
      uint64_t v35 = *(void *)(*(void *)(a1 + 72) + 8);
      id v52 = *(id *)(v35 + 40);
      BOOL v36 = +[TRIRemoteAssetDecrypter decryptAssetWithURL:v33 destinationFilename:v13 namespaceName:v34 error:&v52];
      objc_storeStrong((id *)(v35 + 40), v52);

      v37 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v51 = 0;
      LOBYTE(v35) = [v37 removeItemAtPath:v27 error:&v51];
      id v38 = v51;

      if ((v35 & 1) == 0)
      {
        id v39 = TRILogCategory_Server();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v55 = v38;
          _os_log_error_impl(&dword_1DA291000, v39, OS_LOG_TYPE_ERROR, "Failed to remove copy of encrypted asset: %{public}@", buf, 0xCu);
        }
      }
      if (v36)
      {

        if (v13) {
          goto LABEL_14;
        }
        goto LABEL_52;
      }
      v41 = TRILogCategory_Server();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v44 = *(void **)(a1 + 40);
        v45 = [*(id *)(a1 + 48) namespaceNameForEncryptionKey];
        *(_DWORD *)buf = 138543618;
        id v55 = v44;
        __int16 v56 = 2114;
        v57 = v45;
        _os_log_error_impl(&dword_1DA291000, v41, OS_LOG_TYPE_ERROR, "Unable to decrypt asset with identifier: %{public}@, namespace name: %{public}@", buf, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = 0;
    }
    else
    {
      uint64_t v40 = TRILogCategory_Server();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v43 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138543362;
        id v55 = v43;
        _os_log_error_impl(&dword_1DA291000, v40, OS_LOG_TYPE_ERROR, "Failed to relocate encrypted asset file: %{public}@", buf, 0xCu);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = 0;
    }

LABEL_50:
    return;
  }
  id v17 = TRILogCategory_Server();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "Unable to create temp directory", buf, 2u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = 0;
}

- (BOOL)saveAssetWithIdentifier:(id)a3 builtFromAssetWithIdentifier:(id)a4 patchFilename:(id)a5 metadata:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __99__TRIAssetStore_saveAssetWithIdentifier_builtFromAssetWithIdentifier_patchFilename_metadata_error___block_invoke;
  v21[3] = &unk_1E6BBB920;
  v21[4] = self;
  id v16 = v12;
  id v22 = v16;
  id v26 = &v28;
  id v17 = v13;
  id v23 = v17;
  id v18 = v14;
  id v24 = v18;
  id v19 = v15;
  id v25 = v19;
  id v27 = a7;
  [(TRIAssetStore *)self _acquireLockfileAndRunBlock:v21];
  LOBYTE(a7) = *((unsigned char *)v29 + 24);

  _Block_object_dispose(&v28, 8);
  return (char)a7;
}

void __99__TRIAssetStore_saveAssetWithIdentifier_builtFromAssetWithIdentifier_patchFilename_metadata_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) hasAssetWithIdentifier:*(void *)(a1 + 40) type:0])
  {
    v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "Warning: treating asset save as a no-op because asset is already present.", buf, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  else
  {
    char v42 = 0;
    if ([*(id *)(a1 + 32) hasAssetWithIdentifier:*(void *)(a1 + 48) type:&v42]) {
      BOOL v5 = v42 == 1;
    }
    else {
      BOOL v5 = 0;
    }
    if (v5)
    {
      uint64_t v37 = os_transaction_create();
      uint64_t v38 = [*(id *)(a1 + 32) pathForAssetContentWithIdentifier:*(void *)(a1 + 48)];
      id v7 = [*(id *)(a1 + 32) _requireAssetStoreTempDir];
      id v8 = [NSString alloc];
      id v9 = objc_opt_new();
      v10 = [v9 UUIDString];
      uint64_t v11 = [v8 initWithFormat:@"partial-asset-%@", v10];
      id v12 = [v7 stringByAppendingPathComponent:v11];

      id v13 = [v12 stringByAppendingPathComponent:@"content"];
      id v14 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v41 = 0;
      LOBYTE(v11) = [v14 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v41];
      id v15 = v41;

      if (v11)
      {

        id v16 = [*(id *)(a1 + 32) _requireAssetStoreTempDir];
        id v17 = [NSString alloc];
        uint64_t v18 = objc_opt_new();
        id v19 = [(id)v18 UUIDString];
        uint64_t v20 = (void *)[v17 initWithFormat:@"patch-%@", v19];
        id v15 = [v16 stringByAppendingPathComponent:v20];

        uint64_t v21 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v22 = *(void *)(a1 + 56);
        id v40 = 0;
        LOBYTE(v18) = [v21 copyItemAtPath:v22 toPath:v15 error:&v40];
        id v23 = v40;

        if (v18)
        {

          id obj = 0;
          id v24 = (void *)v38;
          char v25 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "applyPatchWithFilename:toSrcDir:writingToEmptyDestDir:postPatchCompression:error:", v15, v38, v13, objc_msgSend(*(id *)(a1 + 64), "compressionMode"), &obj);
          id v26 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v26 removeItemAtPath:v15 error:0];

          if (v25 == 1)
          {

            *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 56) saveAssetWithIdentifier:*(void *)(a1 + 40) sourcePath:v12 flockWitness:a2 removeSourceOnFailure:1];
          }
          else
          {
            if (!v25)
            {
              id v27 = TRILogCategory_Server();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                uint64_t v35 = *(void **)(a1 + 40);
                uint64_t v36 = *(void *)(a1 + 48);
                *(_DWORD *)buf = 138543874;
                id v44 = v35;
                __int16 v45 = 2114;
                uint64_t v46 = v36;
                __int16 v47 = 2114;
                id v48 = obj;
                _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "Failed to construct asset %{public}@ by patching asset %{public}@: %{public}@", buf, 0x20u);
              }
            }
            uint64_t v28 = [MEMORY[0x1E4F28CB8] defaultManager];
            [v28 removeItemAtPath:v12 error:0];

            id v29 = *(id **)(a1 + 80);
            if (v29) {
              objc_storeStrong(v29, obj);
            }
            *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
          }
          char v31 = (void *)v37;
        }
        else
        {
          __int16 v32 = TRILogCategory_Server();
          char v31 = (void *)v37;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v44 = v23;
            _os_log_error_impl(&dword_1DA291000, v32, OS_LOG_TYPE_ERROR, "Failed to relocate patch file: %{public}@", buf, 0xCu);
          }

          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
          id v24 = (void *)v38;
        }
      }
      else
      {
        uint64_t v30 = TRILogCategory_Server();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v44 = v15;
          _os_log_error_impl(&dword_1DA291000, v30, OS_LOG_TYPE_ERROR, "Failed to create dest asset directory: %{public}@", buf, 0xCu);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
        char v31 = (void *)v37;
        id v24 = (void *)v38;
      }
    }
    else
    {
      uint64_t v6 = TRILogCategory_Server();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = *(void **)(a1 + 40);
        uint64_t v34 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        id v44 = v33;
        __int16 v45 = 2114;
        uint64_t v46 = v34;
        _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Can't create asset %{public}@ from patch because source asset %{public}@ is not present.", buf, 0x16u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    }
  }
}

- (BOOL)_saveFileAssetWithIdentifier:(id)a3 assetFilename:(id)a4 flockWitness:(TRIFlockWitness_ *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(TRIAssetStore *)self _createTempDir];
  if (!v10) {
    goto LABEL_5;
  }
  if (![(TRIAssetStore *)self _saveFileAssetWithIdentifier:v8 assetFilename:v9 workingTempDirectory:v10 flockWitness:a5])
  {
    [(TRIAssetStore *)self _forceRemoveItemAtPath:v10];
LABEL_5:
    BOOL v11 = 0;
    goto LABEL_6;
  }
  BOOL v11 = 1;
LABEL_6:

  return v11;
}

- (BOOL)_saveFileAssetWithIdentifier:(id)a3 assetFilename:(id)a4 workingTempDirectory:(id)a5 flockWitness:(TRIFlockWitness_ *)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  id v13 = [v11 stringByAppendingPathComponent:@"content"];
  id v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v30 = 0;
  char v15 = [v14 triSafeCopyItemAtPath:v12 toPath:v13 error:&v30];

  id v16 = (char *)v30;
  if ((v15 & 1) == 0)
  {
    id v19 = TRILogCategory_Server();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v32 = v13;
      __int16 v33 = 2114;
      uint64_t v34 = v16;
      _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "Failed to copy asset file to temporary file %{public}@: %{public}@", buf, 0x16u);
    }

    goto LABEL_8;
  }

  id v17 = v13;
  if (chmod((const char *)[v17 fileSystemRepresentation], 0x180u))
  {
    uint64_t v18 = TRILogCategory_Server();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_4;
    }
    id v27 = __error();
    uint64_t v28 = strerror(*v27);
    int v29 = *__error();
    *(_DWORD *)buf = 138543874;
    id v32 = v17;
    __int16 v33 = 2080;
    uint64_t v34 = v28;
    __int16 v35 = 1024;
    int v36 = v29;
    id v26 = "Failed to set permissions on file-asset file %{public}@: %s (%d)";
LABEL_16:
    _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, v26, buf, 0x1Cu);
    goto LABEL_4;
  }
  if (![MEMORY[0x1E4F28CB8] triRemoveFileProtectionIfPresentForPath:v17]) {
    goto LABEL_8;
  }
  id v22 = v17;
  if (!chmod((const char *)[v22 fileSystemRepresentation], 0x124u))
  {
    char v20 = [(TRIAssetStoreOperations *)self->_assetOperator saveAssetWithIdentifier:v10 sourcePath:v11 flockWitness:a6 removeSourceOnFailure:1];
    goto LABEL_9;
  }
  uint64_t v18 = TRILogCategory_Server();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    id v23 = __error();
    id v24 = strerror(*v23);
    int v25 = *__error();
    *(_DWORD *)buf = 138543874;
    id v32 = v22;
    __int16 v33 = 2080;
    uint64_t v34 = v24;
    __int16 v35 = 1024;
    int v36 = v25;
    id v26 = "Failed to set file permissions on temporary file %{public}@: %s (%d)";
    goto LABEL_16;
  }
LABEL_4:

LABEL_8:
  char v20 = 0;
LABEL_9:

  return v20;
}

- ($A5A652246548B43F8BC05201A1C72A70)_saveDirectoryAssetWithIdentifier:(id)a3 assetFilename:(id)a4 metadata:(id)a5 flockWitness:(TRIFlockWitness_ *)a6 error:(id *)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  char v15 = [(TRIAssetStore *)self _createTempDir];
  id v16 = v15;
  if (v15)
  {
    id v17 = [v15 stringByAppendingPathComponent:@"content"];
    if (mkdir((const char *)[v17 fileSystemRepresentation], 0x1F8u))
    {
      uint64_t v18 = TRILogCategory_Server();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v24 = __error();
        int v25 = strerror(*v24);
        int v26 = *__error();
        *(_DWORD *)buf = 138543874;
        id v29 = v17;
        __int16 v30 = 2080;
        char v31 = v25;
        __int16 v32 = 1024;
        int v33 = v26;
        _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Failed to create directory for dir-asset toplevel %{public}@: %s (%d)", buf, 0x1Cu);
      }
    }
    else if ([MEMORY[0x1E4F28CB8] triRemoveFileProtectionIfPresentForPath:v17])
    {
      extractor = self->_extractor;
      id v27 = 0;
      v19.var0 = -[TRIAssetExtracting extractArchiveFromFile:withArchiveName:toEmptyDirectory:postExtractionCompression:error:](extractor, "extractArchiveFromFile:withArchiveName:toEmptyDirectory:postExtractionCompression:error:", v13, v12, v17, [v14 compressionMode], &v27);
      id v21 = v27;
      id v22 = v21;
      if (v19.var0 == 1)
      {
        v19.var0 = [(TRIAssetStoreOperations *)self->_assetOperator saveAssetWithIdentifier:v12 sourcePath:v16 flockWitness:a6 removeSourceOnFailure:1];
LABEL_12:

        goto LABEL_13;
      }
      if (a7)
      {
        id v22 = v21;
        *a7 = v22;
      }
LABEL_11:
      [(TRIAssetStore *)self _forceRemoveItemAtPath:v16];
      goto LABEL_12;
    }
    v19.var0 = 0;
    id v22 = 0;
    goto LABEL_11;
  }
  v19.var0 = 0;
LABEL_13:

  return v19;
}

- (BOOL)removeAssetWithIdentifier:(id)a3
{
  return [(TRIAssetStoreOperations *)self->_assetOperator removeAssetWithIdentifier:a3];
}

- (BOOL)linkAssetWithIdentifier:(id)a3 toPath:(id)a4
{
  return [(TRIAssetStore *)self linkAssetWithIdentifier:a3 toCurrentPath:a4 futurePath:a4];
}

- (BOOL)linkAssetWithIdentifier:(id)a3 toCurrentPath:(id)a4 futurePath:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_18:
    $A5A652246548B43F8BC05201A1C72A70 v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"TRIAssetStore.m", 554, @"Invalid parameter not satisfying: %@", @"currentPath" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_19;
  }
  uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"TRIAssetStore.m", 553, @"Invalid parameter not satisfying: %@", @"assetIdentifier" object file lineNumber description];

  if (!v10) {
    goto LABEL_18;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_19:
  char v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"TRIAssetStore.m", 555, @"Invalid parameter not satisfying: %@", @"futurePath" object file lineNumber description];

LABEL_4:
  if (![v10 length])
  {
    id v16 = TRILogCategory_Server();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[TRIAssetStore linkAssetWithIdentifier:toCurrentPath:futurePath:]";
      _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "%s has empty path arg: currentPath", buf, 0xCu);
    }

    goto LABEL_15;
  }
  BOOL v12 = [v11 length] == 0;
  id v13 = TRILogCategory_Server();
  id v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[TRIAssetStore linkAssetWithIdentifier:toCurrentPath:futurePath:]";
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "%s has empty path arg: futurePath", buf, 0xCu);
    }

LABEL_15:
    BOOL v15 = 0;
    goto LABEL_16;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "Link asset: %{public}@ --> %{public}@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v27 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __66__TRIAssetStore_linkAssetWithIdentifier_toCurrentPath_futurePath___block_invoke;
  v21[3] = &unk_1E6BBB948;
  v21[4] = self;
  id v22 = v9;
  id v23 = v11;
  int v25 = buf;
  id v24 = v10;
  [(TRIAssetStore *)self _acquireLockfileAndRunBlock:v21];
  BOOL v15 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
LABEL_16:

  return v15;
}

void __66__TRIAssetStore_linkAssetWithIdentifier_toCurrentPath_futurePath___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = (void *)os_transaction_create();
  char v9 = 0;
  if ([*(id *)(a1 + 32) hasAssetWithIdentifier:*(void *)(a1 + 40) type:&v9])
  {
    if (v9 == 1)
    {
      char v5 = [*(id *)(a1 + 32) _linkDirectoryAssetWithIdentifier:*(void *)(a1 + 40) toCurrentPath:*(void *)(a1 + 56) futurePath:*(void *)(a1 + 48) flockWitness:a2];
    }
    else
    {
      if (v9) {
        goto LABEL_10;
      }
      char v5 = [*(id *)(a1 + 32) _linkFileAssetWithIdentifier:*(void *)(a1 + 40) toCurrentPath:*(void *)(a1 + 56) futurePath:*(void *)(a1 + 48) flockWitness:a2];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v5;
LABEL_10:
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      [*(id *)(a1 + 32) _clearUnrefAgeForAssetWithIdentifier:*(void *)(a1 + 40)];
    }
    goto LABEL_12;
  }
  uint64_t v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    uint64_t v13 = v8;
    _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Asset store has no asset with identifier: %{public}@. Tried to link to %{public}@", buf, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
LABEL_12:
}

- (BOOL)_linkFileAssetWithIdentifier:(id)a3 toCurrentPath:(id)a4 futurePath:(id)a5 flockWitness:(TRIFlockWitness_ *)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(TRIAssetStore *)self _requireAssetStoreTempDir];
  uint64_t v14 = [(TRIAssetStore *)self pathForAssetContentWithIdentifier:v10];
  BOOL v15 = objc_opt_new();
  id v16 = [v15 UUIDString];
  id v17 = [v13 stringByAppendingPathComponent:v16];

  id v18 = v14;
  $A5A652246548B43F8BC05201A1C72A70 v19 = (const char *)[v18 fileSystemRepresentation];
  id v20 = v17;
  if (link(v19, (const char *)[v20 fileSystemRepresentation]))
  {
    id v21 = TRILogCategory_Server();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v24 = __error();
      int v25 = strerror(*v24);
      int v26 = *__error();
      int v27 = 138544130;
      id v28 = v18;
      __int16 v29 = 2114;
      id v30 = v20;
      __int16 v31 = 2080;
      __int16 v32 = v25;
      __int16 v33 = 1024;
      int v34 = v26;
      _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "Failed to link file asset %{public}@ --> %{public}@: %s (%d)", (uint8_t *)&v27, 0x26u);
    }

    goto LABEL_9;
  }
  if (![(TRIAssetStoreOperations *)self->_assetOperator addSymlinkFromAssetWithIdentifier:v10 toPath:v12 flockWitness:a6]|| ![(TRIAssetStore *)self _overwriteRenameAsAtomicallyAsPossibleWithSrc:v20 dest:v11])
  {
    unlink((const char *)[v20 fileSystemRepresentation]);
LABEL_9:
    BOOL v22 = 0;
    goto LABEL_10;
  }
  BOOL v22 = 1;
LABEL_10:

  return v22;
}

- (BOOL)_linkDirectoryAssetWithIdentifier:(id)a3 toCurrentPath:(id)a4 futurePath:(id)a5 flockWitness:(TRIFlockWitness_ *)a6
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v77 = a3;
  id v72 = a4;
  id v73 = a5;
  v78 = self;
  v76 = [(TRIAssetStore *)self _requireAssetStoreTempDir];
  v74 = [(TRIAssetStore *)self pathForAssetContentWithIdentifier:v77];
  uint64_t v89 = 0;
  v90 = &v89;
  uint64_t v91 = 0x3032000000;
  v92 = __Block_byref_object_copy__26;
  v93 = __Block_byref_object_dispose__26;
  uint64_t v10 = objc_opt_new();
  id v11 = [(id)v10 UUIDString];
  id v94 = [v76 stringByAppendingPathComponent:v11];

  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = __89__TRIAssetStore__linkDirectoryAssetWithIdentifier_toCurrentPath_futurePath_flockWitness___block_invoke;
  v88[3] = &unk_1E6BBB970;
  v88[4] = self;
  v88[5] = &v89;
  id v12 = (uint64_t (**)(void))MEMORY[0x1E016EA80](v88);
  context = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v14 = v90[5];
  id v87 = 0;
  LOBYTE(v10) = [v13 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:&v87];
  v80 = (char *)v87;
  v75 = v13;
  if ((v10 & 1) == 0)
  {
    v54 = TRILogCategory_Server();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      uint64_t v60 = v90[5];
      *(_DWORD *)v104 = 138543618;
      *(void *)&v104[4] = v60;
      *(_WORD *)&v104[12] = 2114;
      *(void *)&v104[14] = v80;
      _os_log_error_impl(&dword_1DA291000, v54, OS_LOG_TYPE_ERROR, "Failed to create directory %{public}@ for dir-asset: %{public}@", v104, 0x16u);
    }

    char v6 = 0;
    int v26 = 1;
    goto LABEL_60;
  }
  *(void *)v104 = 0;
  *(void *)&v104[8] = v104;
  *(void *)&v104[16] = 0x3032000000;
  v105 = __Block_byref_object_copy__26;
  v106 = __Block_byref_object_dispose__26;
  id v107 = 0;
  v70 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v74 isDirectory:1];
  BOOL v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v16 = *MEMORY[0x1E4F1C670];
  uint64_t v79 = *MEMORY[0x1E4F1C628];
  v103[0] = *MEMORY[0x1E4F1C628];
  v103[1] = v16;
  uint64_t v69 = v16;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:2];
  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __89__TRIAssetStore__linkDirectoryAssetWithIdentifier_toCurrentPath_futurePath_flockWitness___block_invoke_353;
  v86[3] = &unk_1E6BBB998;
  v86[4] = v104;
  id v18 = [v15 enumeratorAtURL:v70 includingPropertiesForKeys:v17 options:24 errorHandler:v86];

  if (!v18)
  {
    v57 = TRILogCategory_Server();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v96 = v74;
      _os_log_error_impl(&dword_1DA291000, v57, OS_LOG_TYPE_ERROR, "Failed to enumerate dir-asset for linking: %{public}@", buf, 0xCu);
    }

    char v56 = v12[2](v12);
LABEL_58:
    char v6 = v56;
    int v26 = 1;
    goto LABEL_59;
  }
  do
  {
    $A5A652246548B43F8BC05201A1C72A70 v19 = (void *)MEMORY[0x1E016E7F0]();
    id v20 = [v18 nextObject];
    if (v20)
    {
      if ([v18 isEnumeratingDirectoryPostOrder])
      {
        id v21 = (void *)v90[5];
        BOOL v22 = [v20 relativePath];
        if (!v22)
        {
          id v51 = [MEMORY[0x1E4F28B00] currentHandler];
          [v51 handleFailureInMethod:a2, v78, @"TRIAssetStore.m", 685, @"Expression was unexpectedly nil/false: %@", @"childURL.relativePath" object file lineNumber description];
        }
        id v23 = [v21 stringByAppendingPathComponent:v22];

        id v24 = v23;
        if (chmod((const char *)[v24 fileSystemRepresentation], 0x16Du))
        {
          int v25 = TRILogCategory_Server();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            __int16 v45 = __error();
            uint64_t v46 = strerror(*v45);
            int v47 = *__error();
            *(_DWORD *)buf = 138543874;
            id v96 = v24;
            __int16 v97 = 2080;
            v98 = v46;
            __int16 v99 = 1024;
            LODWORD(v100) = v47;
            _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "Failed to set permissions on %{public}@: %s (%d)", buf, 0x1Cu);
          }

          char v6 = v12[2](v12);
          int v26 = 1;
        }
        else
        {
          int v26 = 2;
        }
        goto LABEL_43;
      }
      id v84 = 0;
      id v85 = 0;
      char v27 = [v20 getResourceValue:&v85 forKey:v79 error:&v84];
      id v24 = v85;
      id v28 = v84;
      if (v27)
      {
        if ([v24 BOOLValue])
        {
          __int16 v29 = (void *)v90[5];
          id v30 = [v20 relativePath];
          if (!v30)
          {
            id v52 = [MEMORY[0x1E4F28B00] currentHandler];
            [v52 handleFailureInMethod:a2, v78, @"TRIAssetStore.m", 712, @"Expression was unexpectedly nil/false: %@", @"childURL.relativePath" object file lineNumber description];
          }
          id v31 = [v29 stringByAppendingPathComponent:v30];

          v83 = v80;
          char v32 = [v75 createDirectoryAtPath:v31 withIntermediateDirectories:1 attributes:0 error:&v83];
          __int16 v33 = v83;

          if (v32)
          {
            int v26 = 2;
          }
          else
          {
            id v44 = TRILogCategory_Server();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              id v96 = v31;
              __int16 v97 = 2114;
              v98 = v33;
              _os_log_error_impl(&dword_1DA291000, v44, OS_LOG_TYPE_ERROR, "Failed to create subdirectory %{public}@ for dir-asset: %{public}@", buf, 0x16u);
            }

            char v6 = v12[2](v12);
            int v26 = 1;
          }
LABEL_41:

          v80 = v33;
          goto LABEL_42;
        }

        id v81 = 0;
        id v82 = 0;
        char v35 = [v20 getResourceValue:&v82 forKey:v69 error:&v81];
        id v24 = v82;
        id v28 = v81;
        if (v35)
        {
          if ([v24 BOOLValue])
          {
            int v36 = [v20 path];
            if (!v36)
            {
              id v53 = [MEMORY[0x1E4F28B00] currentHandler];
              [v53 handleFailureInMethod:a2, v78, @"TRIAssetStore.m", 741, @"Expression was unexpectedly nil/false: %@", @"childURL.path" object file lineNumber description];
            }
            uint64_t v37 = (void *)v90[5];
            uint64_t v38 = [v20 relativePath];
            if (!v38)
            {
              v66 = [MEMORY[0x1E4F28B00] currentHandler];
              [v66 handleFailureInMethod:a2, v78, @"TRIAssetStore.m", 743, @"Expression was unexpectedly nil/false: %@", @"childURL.relativePath" object file lineNumber description];
            }
            id v39 = [v37 stringByAppendingPathComponent:v38];

            id v31 = v36;
            id v40 = (const char *)[v31 fileSystemRepresentation];
            id v41 = v39;
            if (link(v40, (const char *)[v41 fileSystemRepresentation]))
            {
              char v42 = TRILogCategory_Server();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                id v48 = __error();
                uint64_t v49 = strerror(*v48);
                int v50 = *__error();
                *(_DWORD *)buf = 138544130;
                id v96 = v31;
                __int16 v97 = 2114;
                v98 = v41;
                __int16 v99 = 2080;
                v100 = v49;
                __int16 v101 = 1024;
                int v102 = v50;
                _os_log_error_impl(&dword_1DA291000, v42, OS_LOG_TYPE_ERROR, "Failed to link %{public}@ --> %{public}@ for dir-asset: %s (%d)", buf, 0x26u);
              }

              char v6 = v12[2](v12);
              v43 = v41;
              int v26 = 1;
            }
            else
            {
              v43 = v41;
              int v26 = 2;
            }

            __int16 v33 = v80;
            goto LABEL_41;
          }
          int v26 = 0;
LABEL_42:

LABEL_43:
          goto LABEL_44;
        }
        int v34 = TRILogCategory_Server();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v96 = v28;
          _os_log_error_impl(&dword_1DA291000, v34, OS_LOG_TYPE_ERROR, "Failed to determine regular file status: %{public}@", buf, 0xCu);
        }
      }
      else
      {
        int v34 = TRILogCategory_Server();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v96 = v28;
          _os_log_error_impl(&dword_1DA291000, v34, OS_LOG_TYPE_ERROR, "Failed to determine directory status: %{public}@", buf, 0xCu);
        }
      }

      char v6 = v12[2](v12);
      int v26 = 1;
      goto LABEL_42;
    }
    int v26 = 3;
LABEL_44:
  }
  while (!v26 || v26 == 2);
  if (v26 == 3)
  {
    if (*(void *)(*(void *)&v104[8] + 40))
    {
      id v55 = TRILogCategory_Server();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        v65 = *(void **)(*(void *)&v104[8] + 40);
        *(_DWORD *)buf = 138543362;
        id v96 = v65;
        _os_log_error_impl(&dword_1DA291000, v55, OS_LOG_TYPE_ERROR, "Failed to enumerate directory during asset linking: %{public}@", buf, 0xCu);
      }

      char v56 = v12[2](v12);
      goto LABEL_58;
    }
    int v26 = 0;
  }
LABEL_59:

  _Block_object_dispose(v104, 8);
LABEL_60:

  if (!v26)
  {
    if (chmod((const char *)[ (id) v90[5] fileSystemRepresentation], 0x16Du))
    {
      uint64_t v58 = TRILogCategory_Server();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        uint64_t v61 = v90[5];
        v62 = __error();
        v63 = strerror(*v62);
        int v64 = *__error();
        *(_DWORD *)v104 = 138543874;
        *(void *)&v104[4] = v61;
        *(_WORD *)&v104[12] = 2080;
        *(void *)&v104[14] = v63;
        *(_WORD *)&v104[22] = 1024;
        LODWORD(v105) = v64;
        _os_log_error_impl(&dword_1DA291000, v58, OS_LOG_TYPE_ERROR, "Failed to set permissions on %{public}@: %s (%d)", v104, 0x1Cu);
      }

LABEL_68:
      char v6 = v12[2](v12);
    }
    else
    {
      if (![(TRIAssetStoreOperations *)v78->_assetOperator addSymlinkFromAssetWithIdentifier:v77 toPath:v73 flockWitness:a6]|| ![(TRIAssetStore *)v78 _overwriteRenameAsAtomicallyAsPossibleWithSrc:v90[5] dest:v72])
      {
        goto LABEL_68;
      }
      char v6 = 1;
    }
  }

  _Block_object_dispose(&v89, 8);
  return v6 & 1;
}

uint64_t __89__TRIAssetStore__linkDirectoryAssetWithIdentifier_toCurrentPath_futurePath_flockWitness___block_invoke(uint64_t a1)
{
  return 0;
}

uint64_t __89__TRIAssetStore__linkDirectoryAssetWithIdentifier_toCurrentPath_futurePath_flockWitness___block_invoke_353(uint64_t a1, int a2, id obj)
{
  return 0;
}

- (BOOL)referenceMAAutoAssetWithId:(id)a3 isFileFactor:(BOOL)a4 usingCurrentPath:(id)a5 futurePath:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v14 = [v13 fileExistsAtPath:v12];

  if (v14) {
    +[TRIReferenceManagedDir saveFromGarbageCollectionItemWithPath:v12];
  }
  BOOL v15 = [(TRIAssetStoreOperations *)self->_assetOperator referenceMAAutoAssetWithId:v10 futurePath:v12 currentPath:v11 isFileFactor:v8];
  BOOL v16 = v15 != 0;

  return v16;
}

- (unint64_t)removableAssetsSizeOlderThanNumScans:(unsigned int)a3 ignoreRecentlyCreatedAssets:(BOOL)a4 includedCacheDeletableAssetIds:(id)a5 deleteableAssetIds:(id *)a6
{
  BOOL v7 = a4;
  uint64_t v8 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v14 = 0;
  id v10 = a5;
  id v11 = TRILogCategory_Server();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(TRIPaths *)self->_paths assetStore];
    *(_DWORD *)buf = 67109378;
    int v16 = v8;
    __int16 v17 = 2114;
    id v18 = v12;
    _os_log_impl(&dword_1DA291000, v11, OS_LOG_TYPE_DEFAULT, "Starting dry run garbage collection with age threshold %u for asset store: %{public}@", buf, 0x12u);
  }
  [(TRIAssetStoreOperations *)self->_assetOperator collectGarbageOlderThanNumScans:v8 deletedAssetSize:&v14 ignoreRecentlyCreatedAssets:v7 dryRun:1 includedCacheDeletableAssetIds:v10 deletedAssetIds:a6];

  return v14;
}

- (unint64_t)removableAssetsSizeOlderThanNumScans:(unsigned int)a3 includedCacheDeletableAssetIds:(id)a4
{
  return [(TRIAssetStore *)self removableAssetsSizeOlderThanNumScans:*(void *)&a3 ignoreRecentlyCreatedAssets:1 includedCacheDeletableAssetIds:a4 deleteableAssetIds:0];
}

- (BOOL)collectGarbageOlderThanNumScans:(unsigned int)a3 deletedAssetSize:(unint64_t *)a4
{
  return [(TRIAssetStore *)self collectGarbageOlderThanNumScans:*(void *)&a3 ignoreRecentlyCreatedAssets:1 deletedAssetSize:a4 deletedAssetIds:0];
}

- (BOOL)collectGarbageOlderThanNumScans:(unsigned int)a3 ignoreRecentlyCreatedAssets:(BOOL)a4 deletedAssetSize:(unint64_t *)a5 deletedAssetIds:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v9 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v11 = TRILogCategory_Server();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(TRIPaths *)self->_paths assetStore];
    v14[0] = 67109378;
    v14[1] = v9;
    __int16 v15 = 2114;
    int v16 = v12;
    _os_log_impl(&dword_1DA291000, v11, OS_LOG_TYPE_DEFAULT, "Collecting garbage with age threshold %u for asset store: %{public}@", (uint8_t *)v14, 0x12u);
  }
  return [(TRIAssetStoreOperations *)self->_assetOperator collectGarbageOlderThanNumScans:v9 deletedAssetSize:a5 ignoreRecentlyCreatedAssets:v8 dryRun:0 includedCacheDeletableAssetIds:0 deletedAssetIds:a6];
}

- (BOOL)isValidTargetForSymlink:(id)a3 assetIdentifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v14 = 0;
  BOOL v7 = [(TRIAssetStore *)self pathForAssetContentWithIdentifier:a4];
  BOOL v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v9 = [v8 fileExistsAtPath:v7 isDirectory:&v14];

  if ((v9 & 1) == 0)
  {
    id v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      int v16 = v7;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Missing content %{public}@ while checking symlink", buf, 0xCu);
    }
    goto LABEL_7;
  }
  id v10 = [MEMORY[0x1E4F28CB8] triTargetPathForSymlink:v6];
  if (!v10)
  {
LABEL_7:
    BOOL v12 = 0;
    goto LABEL_10;
  }
  if (v14) {
    BOOL v11 = [(TRIAssetStore *)self _isDirectoryAtPath:v10 matchingAssetContentAtPath:v7];
  }
  else {
    BOOL v11 = [(TRIAssetStore *)self _isFileAtPath:v10 matchingAssetContentAtPath:v7];
  }
  BOOL v12 = v11;
LABEL_10:

  return v12;
}

- (BOOL)_isFileAtPath:(id)a3 matchingAssetContentAtPath:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  memset(&v14, 0, sizeof(v14));
  id v6 = a4;
  if (stat((const char *)objc_msgSend(v6, "fileSystemRepresentation", 0), &v14))
  {
    BOOL v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = __error();
      BOOL v12 = strerror(*v11);
      dev_t v13 = *__error();
      v15.st_dev = 138543874;
      *(void *)&v15.st_mode = v6;
      WORD2(v15.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v15.st_ino + 6) = (__darwin_ino64_t)v12;
      HIWORD(v15.st_gid) = 1024;
      v15.st_rdev = v13;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Unexpected failure to stat() asset content %{public}@: %s (%d)", (uint8_t *)&v15, 0x1Cu);
    }

    BOOL v8 = 0;
  }
  else
  {
    memset(&v15, 0, sizeof(v15));
    if (stat((const char *)[v5 fileSystemRepresentation], &v15)) {
      BOOL v9 = 0;
    }
    else {
      BOOL v9 = v14.st_ino == v15.st_ino;
    }
    BOOL v8 = v9;
  }

  return v8;
}

- (BOOL)_isDirectoryAtPath:(id)a3 matchingAssetContentAtPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned __int8 v33 = 0;
  BOOL v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v8 = [v7 fileExistsAtPath:v5 isDirectory:&v33];
  int v9 = v33;

  char v10 = 0;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    char v32 = [MEMORY[0x1E4F28CB8] defaultManager];
    BOOL v12 = [v32 enumeratorAtPath:v6];
    dev_t v13 = (void *)MEMORY[0x1E016E7F0]();
    uint64_t v14 = [v12 nextObject];
    if (v14)
    {
      stat v15 = (void *)v14;
      id v30 = v6;
      uint64_t v16 = *MEMORY[0x1E4F283B8];
      id v31 = (void *)*MEMORY[0x1E4F283C8];
      while (1)
      {
        uint64_t v17 = objc_msgSend(v5, "stringByAppendingPathComponent:", v15, v30);
        id v18 = [v32 attributesOfItemAtPath:v17 error:0];
        if (!v18)
        {
          char v10 = 0;
          goto LABEL_16;
        }
        id v19 = v5;
        id v20 = [v12 fileAttributes];
        id v21 = [v20 objectForKeyedSubscript:v16];
        BOOL v22 = [v18 objectForKeyedSubscript:v16];

        if (v21 != v22)
        {
          char v10 = 0;
          id v5 = v19;
          goto LABEL_16;
        }
        id v23 = [v12 fileAttributes];
        id v24 = [v23 objectForKeyedSubscript:v16];

        if (v24 == v31) {
          break;
        }
        id v5 = v19;

        dev_t v13 = (void *)MEMORY[0x1E016E7F0]();
        stat v15 = [v12 nextObject];
        if (!v15)
        {
          char v10 = 1;
          goto LABEL_17;
        }
      }
      int v25 = [v12 fileAttributes];
      uint64_t v26 = *MEMORY[0x1E4F28398];
      char v27 = [v25 objectForKeyedSubscript:*MEMORY[0x1E4F28398]];
      id v28 = [v18 objectForKeyedSubscript:v26];
      char v10 = [v27 isEqual:v28];

      id v5 = v19;
LABEL_16:

LABEL_17:
      id v6 = v30;
    }
    else
    {
      char v10 = 1;
    }
  }
  return v10;
}

- (BOOL)hasAssetWithIdentifier:(id)a3 type:(unsigned __int8 *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRIAssetStore.m", 996, @"Invalid parameter not satisfying: %@", @"assetIdentifier" object file lineNumber description];
  }
  int v8 = [(TRIAssetStore *)self pathForAssetDirWithIdentifier:v7];
  int v9 = [v8 stringByAppendingPathComponent:@"content"];

  char v10 = TRILogCategory_Server();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v9;
    _os_log_debug_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEBUG, "Checking for asset in path %@", buf, 0xCu);
  }

  buf[0] = 0;
  BOOL v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v12 = [v11 fileExistsAtPath:v9 isDirectory:buf];

  if (a4 && v12) {
    *a4 = buf[0];
  }

  return v12;
}

- (void)enumerateSavedAssetsUsingBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"TRIAssetStore.m", 1014, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__TRIAssetStore_enumerateSavedAssetsUsingBlock___block_invoke;
  v8[3] = &unk_1E6BBB9C0;
  id v9 = v5;
  SEL v10 = a2;
  v8[4] = self;
  id v6 = v5;
  [(TRIAssetStore *)self enumerateAssetDirsUsingBlock:v8];
}

void __48__TRIAssetStore_enumerateSavedAssetsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  v3 = [v16 lastPathComponent];
  if (!v3)
  {
    stat v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"TRIAssetStore.m", 1019, @"Invalid parameter not satisfying: %@", @"assetIdentifier" object file lineNumber description];
  }
  v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"refs" relativeToURL:v16];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [v5 enumeratorAtURL:v4 includingPropertiesForKeys:0 options:1 errorHandler:0];

  id v7 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v8 = [v6 nextObject];
  if (v8)
  {
    id v9 = (void *)v8;
    int v10 = 0;
    do
    {
      BOOL v11 = [v9 lastPathComponent];
      int v12 = [v11 hasPrefix:@"link-"];

      if (v12)
      {
        dev_t v13 = [v9 path];
        if (!v13)
        {
          uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
          [v14 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"TRIAssetStore.m", 1036, @"Invalid parameter not satisfying: %@", @"symlinkPath" object file lineNumber description];
        }
        v10 += [*(id *)(a1 + 32) isValidTargetForSymlink:v13 assetIdentifier:v3];
      }
      id v7 = (void *)MEMORY[0x1E016E7F0]();
      id v9 = [v6 nextObject];
    }
    while (v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fixFileProtectionForAssetStoreFiles
{
}

+ (id)shortHashForAssetIdentifier:(id)a3
{
  id v5 = [a3 dataUsingEncoding:4];
  if (!v5)
  {
    int v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"TRIAssetStore.m", 1057, @"Invalid parameter not satisfying: %@", @"utf8Identifier" object file lineNumber description];
  }
  id v6 = v5;
  [v6 bytes];
  [v6 length];
  char v11 = _PASMurmur3_x86_32();
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:&v11 length:1 freeWhenDone:0];
  uint64_t v8 = [v7 triHexlify];

  return v8;
}

- (BOOL)setCreationDate:(id)a3 forAssetIdentifier:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TRIAssetStore *)self pathForAssetDirWithIdentifier:v7];
  uint64_t v20 = *MEMORY[0x1E4F28310];
  v21[0] = v6;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  int v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v15 = 0;
  char v11 = [v10 setAttributes:v9 ofItemAtPath:v8 error:&v15];
  id v12 = v15;

  if ((v11 & 1) == 0)
  {
    dev_t v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v7;
      __int16 v18 = 2114;
      id v19 = v12;
      _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Failed to backdate %{public}@; %{public}@",
        buf,
        0x16u);
    }
  }
  return v11;
}

- (id)pathForAssetDirWithIdentifier:(id)a3
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  paths = self->_paths;
  id v5 = a3;
  id v6 = [(TRIPaths *)paths assetStore];
  v11[0] = v6;
  v11[1] = @"assets";
  id v7 = [(id)objc_opt_class() shortHashForAssetIdentifier:v5];
  v11[2] = v7;
  v11[3] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  id v9 = [v3 pathWithComponents:v8];

  return v9;
}

- (id)pathForAssetContentWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E016E7F0]();
  id v6 = [(TRIAssetStore *)self pathForAssetDirWithIdentifier:v4];
  id v7 = [v6 stringByAppendingPathComponent:@"content"];

  return v7;
}

- (id)pathForRefsToAssetWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E016E7F0]();
  id v6 = [(TRIAssetStore *)self pathForAssetDirWithIdentifier:v4];
  id v7 = [v6 stringByAppendingPathComponent:@"refs"];

  return v7;
}

- (id)_createTempDir
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = [(TRIAssetStore *)self _requireAssetStoreTempDir];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v28 = 0;
  char v6 = [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v28];
  id v7 = v28;

  if ((v6 & 1) == 0)
  {
    uint64_t v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v30 = v4;
      __int16 v31 = 2114;
      id v32 = v7;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Failed to create directory %{public}@: %{public}@", buf, 0x16u);
    }
  }
  id v9 = [v4 stringByAppendingPathComponent:@"partial-asset-XXXXXX"];
  int v10 = (const char *)[v9 UTF8String];
  if (!v10)
  {
    int v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"TRIAssetStore.m", 1112, @"Unexpected UTF-8 conversion failure: %@", v9 object file lineNumber description];
  }
  id v11 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:v10 length:strlen(v10) + 1];
  id v12 = (char *)[v11 mutableBytes];
  if (!v12)
  {
    id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v27);
  }
  dev_t v13 = v12;
  if (!mkdtemp(v12))
  {
    id v15 = TRILogCategory_Server();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      BOOL v22 = __error();
      id v23 = strerror(*v22);
      int v24 = *__error();
      *(_DWORD *)buf = 136315394;
      id v30 = v23;
      __int16 v31 = 1024;
      LODWORD(v32) = v24;
      _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Failed to create temp dir: %s (%d)", buf, 0x12u);
    }
    goto LABEL_17;
  }
  uint64_t v14 = (void *)[[NSString alloc] initWithUTF8String:v13];
  if (!v14)
  {
    uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"TRIAssetStore.m", 1123, @"Invalid parameter not satisfying: %@", @"result" object file lineNumber description];
  }
  id v15 = v14;
  if (chmod((const char *)[v15 fileSystemRepresentation], 0x1F8u))
  {
    id v16 = TRILogCategory_Server();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v19 = __error();
      uint64_t v20 = strerror(*v19);
      int v21 = *__error();
      *(_DWORD *)buf = 136315394;
      id v30 = v20;
      __int16 v31 = 1024;
      LODWORD(v32) = v21;
      _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "Failed to adjust permissions on temp dir: %s (%d)", buf, 0x12u);
    }

    [(TRIAssetStore *)self _forceRemoveItemAtPath:v15];
LABEL_17:
    id v17 = 0;
    goto LABEL_19;
  }
  id v15 = v15;
  id v17 = v15;
LABEL_19:

  return v17;
}

- (void)enumerateAssetDirsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  context = (void *)MEMORY[0x1E016E7F0]();
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v6 = (void *)MEMORY[0x1E4F1CB10];
  id v7 = [(TRIPaths *)self->_paths assetStore];
  uint64_t v8 = [v6 fileURLWithPath:v7];
  uint64_t v9 = [v6 fileURLWithPath:@"assets" relativeToURL:v8];

  id v19 = (void *)v9;
  int v10 = [v5 enumeratorAtURL:v9 includingPropertiesForKeys:0 options:1 errorHandler:0];
  id v11 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v12 = [v10 nextObject];
  if (v12)
  {
    dev_t v13 = (void *)v12;
    while (1)
    {
      uint64_t v14 = [v5 enumeratorAtURL:v13 includingPropertiesForKeys:0 options:1 errorHandler:0];
      id v15 = (void *)MEMORY[0x1E016E7F0]();
      uint64_t v16 = [v14 nextObject];
      if (v16) {
        break;
      }
LABEL_7:

      id v11 = (void *)MEMORY[0x1E016E7F0]();
      dev_t v13 = [v10 nextObject];
      if (!v13) {
        goto LABEL_10;
      }
    }
    id v17 = (void *)v16;
    while (1)
    {
      unsigned __int8 v21 = 0;
      __int16 v18 = (void *)MEMORY[0x1E016E7F0]();
      v4[2](v4, v17, &v21);
      LODWORD(v18) = v21;

      if (v18) {
        break;
      }
      id v15 = (void *)MEMORY[0x1E016E7F0]();
      id v17 = [v14 nextObject];
      if (!v17) {
        goto LABEL_7;
      }
    }
  }
LABEL_10:
}

- (BOOL)_forceRemoveItemAtPath:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  id v10 = 0;
  char v6 = [v5 triForceRemoveItemAtPath:v4 error:&v10];

  id v7 = v10;
  if ((v6 & 1) == 0)
  {
    uint64_t v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v7;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Failed to force-remove: %{public}@", buf, 0xCu);
    }
  }
  return v6;
}

- (BOOL)_overwriteRenameAsAtomicallyAsPossibleWithSrc:(id)a3 dest:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(&v31, 0, sizeof(v31));
  id v8 = v6;
  if (stat((const char *)[v8 fileSystemRepresentation], &v31))
  {
    uint64_t v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v22 = __error();
      id v23 = strerror(*v22);
      dev_t v24 = *__error();
      v30.st_dev = 138543874;
      *(void *)&v30.st_mode = v8;
      WORD2(v30.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v30.st_ino + 6) = (__darwin_ino64_t)v23;
      HIWORD(v30.st_gid) = 1024;
      v30.st_rdev = v24;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Failed to stat %{public}@: %s (%d)", (uint8_t *)&v30, 0x1Cu);
    }

    goto LABEL_5;
  }
  __int16 v29 = v31.st_mode & 0x1FF;
  memset(&v30, 0, sizeof(v30));
  id v11 = v7;
  int v12 = stat((const char *)[v11 fileSystemRepresentation], &v30);
  int v13 = v12;
  if ((v31.st_mode & 0xF000) == 0x4000)
  {
    chmod((const char *)[v8 fileSystemRepresentation], 0x1F8u);
    uint64_t v14 = &v29;
    if (!v13)
    {
LABEL_10:
      if ((v30.st_mode & 0xF000) == 0x4000) {
        chmod((const char *)[v11 fileSystemRepresentation], 0x1F8u);
      }
    }
  }
  else
  {
    uint64_t v14 = 0;
    if (!v12) {
      goto LABEL_10;
    }
  }
  id v15 = v8;
  uint64_t v16 = (const std::__fs::filesystem::path *)[v15 fileSystemRepresentation];
  id v17 = v11;
  __int16 v18 = (const std::__fs::filesystem::path *)[v17 fileSystemRepresentation];
  rename(v16, v18, v19);
  if (!v20)
  {
    [(TRIAssetStore *)self _fixupPermissionsOnPath:v17 permissionBits:v14];
    BOOL v10 = 1;
    goto LABEL_19;
  }
  if (*__error() == 17 || *__error() == 66 || *__error() == 21 || *__error() == 20)
  {
    BOOL v10 = [(TRIAssetStore *)self _nonAtomicOverwriteWithSrc:v15 dest:v17 finalPermissionBits:v14];
    goto LABEL_19;
  }
  int v25 = TRILogCategory_Server();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    uint64_t v26 = __error();
    id v27 = strerror(*v26);
    int v28 = *__error();
    v31.st_dev = 138544130;
    *(void *)&v31.st_mode = v15;
    WORD2(v31.st_ino) = 2114;
    *(__darwin_ino64_t *)((char *)&v31.st_ino + 6) = (__darwin_ino64_t)v17;
    HIWORD(v31.st_gid) = 2080;
    *(void *)&v31.st_rdev = v27;
    LOWORD(v31.st_atimespec.tv_sec) = 1024;
    *(_DWORD *)((char *)&v31.st_atimespec.tv_sec + 2) = v28;
    _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "Failed to rename() %{public}@ --> %{public}@: %s (%d)", (uint8_t *)&v31, 0x26u);
  }

  [(TRIAssetStore *)self _fixupPermissionsOnPath:v15 permissionBits:v14];
LABEL_5:
  BOOL v10 = 0;
LABEL_19:

  return v10;
}

- (void)_fixupPermissionsOnPath:(id)a3 permissionBits:(const unsigned __int16 *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    id v7 = v5;
    if (chmod((const char *)[v7 fileSystemRepresentation], *a4))
    {
      id v8 = TRILogCategory_Server();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = __error();
        BOOL v10 = strerror(*v9);
        int v11 = *__error();
        int v12 = 138543874;
        id v13 = v7;
        __int16 v14 = 2080;
        id v15 = v10;
        __int16 v16 = 1024;
        int v17 = v11;
        _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Failed to restore permission bits on %{public}@: %s (%d)", (uint8_t *)&v12, 0x1Cu);
      }
    }
  }
}

- (BOOL)_nonAtomicOverwriteWithSrc:(id)a3 dest:(id)a4 finalPermissionBits:(const unsigned __int16 *)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(TRIAssetStore *)self _requireAssetStoreTempDir];
  int v11 = objc_opt_new();
  int v12 = [v11 UUIDString];
  id v13 = [v10 stringByAppendingPathComponent:v12];

  id v14 = v9;
  id v15 = (const std::__fs::filesystem::path *)[v14 fileSystemRepresentation];
  id v16 = v13;
  int v17 = (const std::__fs::filesystem::path *)[v16 fileSystemRepresentation];
  rename(v15, v17, v18);
  if (v19)
  {
    [(TRIAssetStore *)self _fixupPermissionsOnPath:v8 permissionBits:a5];
    int v20 = TRILogCategory_Server();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v21 = __error();
      BOOL v22 = strerror(*v21);
      int v23 = *__error();
      int v40 = 138544130;
      id v41 = v14;
      __int16 v42 = 2114;
      id v43 = v16;
      __int16 v44 = 2080;
      __int16 v45 = v22;
      __int16 v46 = 1024;
      int v47 = v23;
      dev_t v24 = "Failed rename() to relocate before overwrite %{public}@ -> %{public}@: %s (%d)";
LABEL_10:
      _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v40, 0x26u);
    }
  }
  else
  {
    id v25 = v8;
    uint64_t v26 = (const std::__fs::filesystem::path *)[v25 fileSystemRepresentation];
    id v27 = v14;
    int v28 = (const std::__fs::filesystem::path *)[v27 fileSystemRepresentation];
    rename(v26, v28, v29);
    if (!v30)
    {
      [(TRIAssetStore *)self _fixupPermissionsOnPath:v27 permissionBits:a5];
      [(TRIAssetStore *)self _forceRemoveItemAtPath:v16];
      BOOL v35 = 1;
      goto LABEL_7;
    }
    stat v31 = (const std::__fs::filesystem::path *)[v16 fileSystemRepresentation];
    id v32 = v27;
    uint64_t v33 = (const std::__fs::filesystem::path *)[v32 fileSystemRepresentation];
    rename(v31, v33, v34);
    [(TRIAssetStore *)self _fixupPermissionsOnPath:v25 permissionBits:a5];
    int v20 = TRILogCategory_Server();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = __error();
      uint64_t v38 = strerror(*v37);
      int v39 = *__error();
      int v40 = 138544130;
      id v41 = v25;
      __int16 v42 = 2114;
      id v43 = v32;
      __int16 v44 = 2080;
      __int16 v45 = v38;
      __int16 v46 = 1024;
      int v47 = v39;
      dev_t v24 = "Failed to rename() even after relocating destination: %{public}@ --> %{public}@: %s (%d)";
      goto LABEL_10;
    }
  }

  BOOL v35 = 0;
LABEL_7:

  return v35;
}

- (BOOL)_clearUnrefAgeForAssetWithIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(TRIAssetStore *)self pathForAssetDirWithIdentifier:a3];
  id v4 = [v3 stringByAppendingPathComponent:@"unref-age"];

  id v5 = v4;
  if (unlink((const char *)[v5 fileSystemRepresentation]) && *__error() != 2)
  {
    id v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = __error();
      BOOL v10 = strerror(*v9);
      int v11 = *__error();
      int v12 = 136315394;
      id v13 = v10;
      __int16 v14 = 1024;
      int v15 = v11;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Failed to unlink() unref-age: %s (%d)", (uint8_t *)&v12, 0x12u);
    }

    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (TRIAssetStoreOperations)assetOperator
{
  return self->_assetOperator;
}

- (void)setAssetOperator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetOperator, 0);
  objc_storeStrong((id *)&self->_storageManagement, 0);
  objc_storeStrong((id *)&self->_monitoredActivity, 0);
  objc_storeStrong((id *)&self->_patcher, 0);
  objc_storeStrong((id *)&self->_extractor, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end