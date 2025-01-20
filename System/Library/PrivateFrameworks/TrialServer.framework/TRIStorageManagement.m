@interface TRIStorageManagement
- (BOOL)_clearContainerStorage;
- (BOOL)_clearStorage;
- (BOOL)_readDeviceIdWithSchemaVersion:(unsigned int)a3 intoData:(id *)a4;
- (BOOL)_readSchemaVersion:(unsigned int *)a3 fileExists:(BOOL *)a4;
- (BOOL)_runNamespaceDatabaseBlock:(id)a3;
- (BOOL)_writeDeviceIdWithData:(id)a3 schemaVersion:(unsigned int)a4;
- (BOOL)_writeSchemaVersion:(unsigned int)a3;
- (BOOL)prepareTrialStorage;
- (BOOL)requestTrialStorageResetOnNextLaunch;
- (void)_eliminateAllMAAssets;
- (void)_notifyNamespaceUpdated;
@end

@implementation TRIStorageManagement

- (BOOL)prepareTrialStorage
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = (void *)os_transaction_create();
  unsigned int v24 = [MEMORY[0x1E4FB0240] legacySchemaVersion];
  char v23 = 0;
  BOOL v4 = 0;
  if ([(TRIStorageManagement *)self _readSchemaVersion:&v24 fileExists:&v23])
  {
    v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v24;
      _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "TRIStorageManagement on-disk schema version is %u.", buf, 8u);
    }

    unsigned int v6 = v24;
    if (v6 == [MEMORY[0x1E4FB0240] currentSchemaVersion])
    {
LABEL_5:
      BOOL v4 = 1;
      goto LABEL_26;
    }
    unsigned int v7 = v24;
    int v8 = [MEMORY[0x1E4FB0240] resetStorageRequestSchemaVersion];
    v9 = TRILogCategory_Server();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7 == v8)
    {
      if (!v10) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v24;
      v11 = "TRIStorageManagement schema version %u indicates an explicit request for storage reset; will attempt to clear user data.";
      v12 = v9;
      uint32_t v13 = 8;
    }
    else
    {
      if (!v10) {
        goto LABEL_12;
      }
      unsigned int v14 = v24;
      int v15 = [MEMORY[0x1E4FB0240] currentSchemaVersion];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v14;
      __int16 v28 = 1024;
      int v29 = v15;
      v11 = "TRIStorageManagement schema version has changed (%u --> %u); will attempt to clear user data.";
      v12 = v9;
      uint32_t v13 = 14;
    }
    _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_12:

    *(void *)buf = 0;
    if (![(TRIStorageManagement *)self _readDeviceIdWithSchemaVersion:v24 intoData:buf])goto LABEL_25; {
    if (v23)
    }
      [(TRIStorageManagement *)self _eliminateAllMAAssets];
    BOOL v16 = [(TRIStorageManagement *)self _clearStorage];
    BOOL v17 = v16;
    id v18 = *(id *)buf;
    if (*(void *)buf)
    {
      if (v16)
      {
        uint64_t v19 = [MEMORY[0x1E4FB0240] currentSchemaVersion];
        id v18 = *(id *)buf;
      }
      else
      {
        uint64_t v19 = v24;
      }
      [(TRIStorageManagement *)self _writeDeviceIdWithData:v18 schemaVersion:v19];
    }
    if (!v17
      || ([(TRIStorageManagement *)self _notifyNamespaceUpdated],
          !-[TRIStorageManagement _writeSchemaVersion:](self, "_writeSchemaVersion:", [MEMORY[0x1E4FB0240] currentSchemaVersion])))
    {
LABEL_25:

      BOOL v4 = 0;
      goto LABEL_26;
    }
    v20 = TRILogCategory_Server();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [MEMORY[0x1E4FB0240] currentSchemaVersion];
      *(_DWORD *)v25 = 67109120;
      int v26 = v21;
      _os_log_impl(&dword_1DA291000, v20, OS_LOG_TYPE_DEFAULT, "TRIStorageManagement user data cleared successfully; schema version is now %u.",
        v25,
        8u);
    }

    goto LABEL_5;
  }
LABEL_26:

  return v4;
}

- (BOOL)requestTrialStorageResetOnNextLaunch
{
  uint64_t v3 = [MEMORY[0x1E4FB0240] resetStorageRequestSchemaVersion];
  return [(TRIStorageManagement *)self _writeSchemaVersion:v3];
}

- (BOOL)_readSchemaVersion:(unsigned int *)a3 fileExists:(BOOL *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"TRIStorageManagement.m", 100, @"Invalid parameter not satisfying: %@", @"version" object file lineNumber description];
  }
  unsigned int v6 = (void *)MEMORY[0x1E016E7F0](self, a2);
  id v7 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  int v8 = [MEMORY[0x1E4FB0240] schemaVersionFile];
  id v33 = 0;
  v9 = (void *)[v7 initWithContentsOfFile:v8 options:1 error:&v33];
  id v10 = v33;

  if (v9)
  {
    v11 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
    *a4 = 1;
    if (v11)
    {
      uint64_t v32 = -1;
      if (![MEMORY[0x1E4FB0198] convertFromString:v11 usingBase:10 toI64:&v32]
        || (unsigned int v12 = v32, v32 < 0)
        || v32 >= 0x100000000)
      {
        uint32_t v13 = TRILogCategory_Server();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v27 = [MEMORY[0x1E4FB0240] schemaVersionFile];
          int v28 = [MEMORY[0x1E4FB0240] legacySchemaVersion];
          *(_DWORD *)buf = 138543874;
          v35 = v11;
          __int16 v36 = 2114;
          id v37 = v27;
          __int16 v38 = 1024;
          int v39 = v28;
          _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Could not parse string \"%{public}@\" from schema version file \"%{public}@\" as an unsigned int; treating as version %u.",
            buf,
            0x1Cu);
        }
        unsigned int v12 = [MEMORY[0x1E4FB0240] legacySchemaVersion];
      }
      *a3 = v12;
    }
    else
    {
      BOOL v16 = TRILogCategory_Server();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v25 = [MEMORY[0x1E4FB0240] schemaVersionFile];
        int v26 = [MEMORY[0x1E4FB0240] legacySchemaVersion];
        *(_DWORD *)buf = 138543618;
        v35 = v25;
        __int16 v36 = 1024;
        LODWORD(v37) = v26;
        _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "Schema version file \"%{public}@\" contains non-UTF-8 content; treating as version %u.",
          buf,
          0x12u);
      }
      *a3 = [MEMORY[0x1E4FB0240] legacySchemaVersion];
    }

LABEL_18:
    BOOL v17 = 1;
    goto LABEL_26;
  }
  unsigned int v14 = [v10 domain];
  int v15 = v14;
  if (v14 == (void *)*MEMORY[0x1E4F281F8])
  {
    uint64_t v18 = [v10 code];

    if (v18 == 260)
    {
      *a4 = 0;
      uint64_t v19 = TRILogCategory_Server();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [MEMORY[0x1E4FB0240] schemaVersionFile];
        int v21 = [MEMORY[0x1E4FB0240] legacySchemaVersion];
        *(_DWORD *)buf = 138543618;
        v35 = v20;
        __int16 v36 = 1024;
        LODWORD(v37) = v21;
        _os_log_impl(&dword_1DA291000, v19, OS_LOG_TYPE_DEFAULT, "Schema version file \"%{public}@\" is not present; treating as version %u.",
          buf,
          0x12u);
      }
      *a3 = [MEMORY[0x1E4FB0240] legacySchemaVersion];
      goto LABEL_18;
    }
  }
  else
  {
  }
  v22 = TRILogCategory_Server();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    unsigned int v24 = [MEMORY[0x1E4FB0240] schemaVersionFile];
    *(_DWORD *)buf = 138543618;
    v35 = v24;
    __int16 v36 = 2114;
    id v37 = v10;
    _os_log_error_impl(&dword_1DA291000, v22, OS_LOG_TYPE_ERROR, "Schema version file \"%{public}@\" is unreadable: %{public}@", buf, 0x16u);
  }
  BOOL v17 = 0;
LABEL_26:

  return v17;
}

- (BOOL)_writeSchemaVersion:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unsigned int v6 = (void *)MEMORY[0x1E016E7F0]();
  id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%u\n", v3);
  int v8 = [v7 dataUsingEncoding:4];
  if (!v8)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"TRIStorageManagement.m" lineNumber:153 description:@"Failed to generate UTF-8 representation of schemaVersion"];
  }
  v9 = [MEMORY[0x1E4FB0240] schemaVersionFile];
  id v10 = [v9 stringByDeletingLastPathComponent];

  v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v11 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:0];

  unsigned int v12 = [MEMORY[0x1E4FB0240] schemaVersionFile];
  id v19 = 0;
  char v13 = [v8 writeToFile:v12 options:268435457 error:&v19];
  id v14 = v19;

  if ((v13 & 1) == 0)
  {
    int v15 = TRILogCategory_Server();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      BOOL v17 = [MEMORY[0x1E4FB0240] schemaVersionFile];
      *(_DWORD *)buf = 138543618;
      int v21 = v17;
      __int16 v22 = 2114;
      id v23 = v14;
      _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Failed to write schema version file \"%{public}@\": %{public}@", buf, 0x16u);
    }
  }

  return v13;
}

- (void)_eliminateAllMAAssets
{
  v2 = +[TRIMobileAssetUtil allTrialAssetTypes];
  uint64_t v3 = TRILogCategory_Server();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_1DA291000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to eliminate all MA assets that exist on the device", v4, 2u);
  }

  [v2 enumerateObjectsUsingBlock:&__block_literal_global_28];
}

void __45__TRIStorageManagement__eliminateAllMAAssets__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [MEMORY[0x1E4F77FC8] eliminateAllForAssetTypeSync:v2];
  if (v3)
  {
    BOOL v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543618;
      id v6 = v2;
      __int16 v7 = 2114;
      int v8 = v3;
      _os_log_error_impl(&dword_1DA291000, v4, OS_LOG_TYPE_ERROR, "Failed to eliminate asset type %{public}@ : %{public}@", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (BOOL)_clearStorage
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = TRILogCategory_Server();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1DA291000, v3, OS_LOG_TYPE_DEBUG, "attempting to delete Trial data dirs from containers", buf, 2u);
  }

  if (![(TRIStorageManagement *)self _clearContainerStorage])
  {
    BOOL v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v4, OS_LOG_TYPE_ERROR, "failed to delete Trial data dirs from all containers", buf, 2u);
    }
  }
  int v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
  __int16 v7 = [v6 trialRootDir];
  id v18 = 0;
  char v8 = [v5 triForceRemoveItemAtPath:v7 error:&v18];
  id v9 = v18;

  if (v8) {
    goto LABEL_8;
  }
  v11 = [v9 domain];
  unsigned int v12 = v11;
  if (v11 == (void *)*MEMORY[0x1E4F281F8])
  {
    uint64_t v13 = [v9 code];

    if (v13 == 4)
    {
LABEL_8:
      BOOL v10 = 1;
      goto LABEL_15;
    }
  }
  else
  {
  }
  id v14 = TRILogCategory_Server();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    BOOL v16 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
    BOOL v17 = [v16 trialRootDir];
    *(_DWORD *)buf = 138543618;
    v20 = v17;
    __int16 v21 = 2114;
    id v22 = v9;
    _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Failed to remove Trial data directory \"%{public}@\": %{public}@", buf, 0x16u);
  }
  BOOL v10 = 0;
LABEL_15:

  return v10;
}

- (BOOL)_runNamespaceDatabaseBlock:(id)a3
{
  BOOL v4 = (uint64_t (**)(id, TRINamespaceDatabase *))a3;
  int v5 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
  id v6 = [[TRIDatabase alloc] initWithPaths:v5 storageManagement:self];
  if (v6)
  {
    __int16 v7 = [[TRINamespaceDatabase alloc] initWithDatabase:v6];
    char v8 = v4[2](v4, v7);
    [(TRIDatabase *)v6 closePermanently];
  }
  else
  {
    id v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "failed to open database.  Cannot delete container Trial data directories", v11, 2u);
    }

    char v8 = 0;
  }

  return v8;
}

- (BOOL)_clearContainerStorage
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  int v28 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
  uint64_t v3 = objc_opt_new();
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __46__TRIStorageManagement__clearContainerStorage__block_invoke;
  v34[3] = &unk_1E6BBD9D8;
  id v4 = v3;
  id v35 = v4;
  BOOL v5 = [(TRIStorageManagement *)self _runNamespaceDatabaseBlock:v34];
  if ([v4 count])
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obj = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      BOOL v26 = v5;
      id v25 = v4;
      uint64_t v8 = *(void *)v31;
      id v9 = (void *)*MEMORY[0x1E4F281F8];
      while (1)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          unsigned int v12 = (void *)MEMORY[0x1E016E7F0]();
          uint64_t v13 = [v28 pathsForContainer:v11 asClientProcess:0];
          id v14 = v13;
          if (v13)
          {
            int v15 = v9;
            BOOL v16 = [v13 trialRootDir];
            BOOL v17 = TRILogCategory_Server();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              id v37 = v16;
              _os_log_debug_impl(&dword_1DA291000, v17, OS_LOG_TYPE_DEBUG, "removing container Trial data directory \"%{public}@\"", buf, 0xCu);
            }

            id v18 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v29 = 0;
            char v19 = [v18 triForceRemoveItemAtPath:v16 error:&v29];
            v20 = v29;

            if (v19)
            {
              id v9 = v15;
            }
            else
            {
              __int16 v21 = [v20 domain];
              id v9 = v15;
              if (v21 != v15)
              {

LABEL_17:
                uint64_t v23 = TRILogCategory_Server();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  id v37 = v16;
                  __int16 v38 = 2114;
                  int v39 = v20;
                  _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "Failed to remove container Trial data directory \"%{public}@\": %{public}@", buf, 0x16u);
                }

                BOOL v26 = 0;
                goto LABEL_20;
              }
              uint64_t v22 = [v20 code];

              if (v22 != 4) {
                goto LABEL_17;
              }
            }
          }
          else
          {
            BOOL v16 = TRILogCategory_Server();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_21;
            }
            v20 = [v11 identifier];
            *(_DWORD *)buf = 138543362;
            id v37 = v20;
            _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "not clearing Trial data from missing app container: %{public}@", buf, 0xCu);
          }
LABEL_20:

LABEL_21:
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
        if (!v7)
        {
          id v4 = v25;
          BOOL v5 = v26;
          break;
        }
      }
    }
  }
  else
  {
    obj = TRILogCategory_Server();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1DA291000, obj, OS_LOG_TYPE_DEBUG, "no container Trial data directories to delete", buf, 2u);
    }
  }

  return v5;
}

uint64_t __46__TRIStorageManagement__clearContainerStorage__block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__TRIStorageManagement__clearContainerStorage__block_invoke_2;
  v5[3] = &unk_1E6BB8CF0;
  id v6 = *(id *)(a1 + 32);
  uint64_t v3 = [a2 enumerateDynamicNamespaceRecordsWithBlock:v5];

  return v3;
}

void __46__TRIStorageManagement__clearContainerStorage__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 appContainer];
  [v2 addObject:v3];
}

- (BOOL)_readDeviceIdWithSchemaVersion:(unsigned int)a3 intoData:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"TRIStorageManagement.m", 267, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB0240]) initWithSchemaVersion:v5];
  id v7 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v8 = [v6 deviceIdentifierFile];
  id v21 = 0;
  id v9 = (void *)[v7 initWithContentsOfFile:v8 options:0 error:&v21];
  id v10 = v21;

  if (v9)
  {
    id v11 = v9;
    unsigned int v12 = *a4;
    *a4 = v11;
LABEL_5:
    BOOL v13 = 1;
    goto LABEL_13;
  }
  id v14 = [v10 domain];
  int v15 = v14;
  if (v14 == (void *)*MEMORY[0x1E4F281F8])
  {
    uint64_t v16 = [v10 code];

    if (v16 == 260)
    {
      unsigned int v12 = *a4;
      *a4 = 0;
      goto LABEL_5;
    }
  }
  else
  {
  }
  unsigned int v12 = TRILogCategory_Server();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = v10;
    _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Failed to read subject identifier prior to storage clear: %{public}@", buf, 0xCu);
  }
  BOOL v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)_writeDeviceIdWithData:(id)a3 schemaVersion:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    BOOL v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIStorageManagement.m", 292, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB0240]) initWithSchemaVersion:v4];
  id v9 = [v8 deviceIdentifierFile];
  id v10 = [v9 stringByDeletingLastPathComponent];

  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v11 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:0];

  unsigned int v12 = [v8 deviceIdentifierFile];
  id v18 = 0;
  char v13 = [v7 writeToFile:v12 options:1 error:&v18];
  id v14 = v18;

  if ((v13 & 1) == 0)
  {
    int v15 = TRILogCategory_Server();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v14;
      _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Failed to restore subject identifier after storage clear: %{public}@", buf, 0xCu);
    }
  }
  return v13;
}

- (void)_notifyNamespaceUpdated
{
  id v2 = TRILogCategory_Server();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_debug_impl(&dword_1DA291000, v2, OS_LOG_TYPE_DEBUG, "Starting notification of namespaces after schema version update", v7, 2u);
  }

  id v3 = (void *)MEMORY[0x1E4FB01A0];
  uint64_t v4 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
  uint64_t v5 = [v4 namespaceDescriptorsDefaultDir];
  id v6 = [v3 descriptorsForDirectory:v5 filterBlock:0];

  [v6 enumerateObjectsUsingBlock:&__block_literal_global_315];
}

void __47__TRIStorageManagement__notifyNamespaceUpdated__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4FB01E8];
  id v3 = [a2 namespaceName];
  [v2 notifyUpdateForNamespaceName:v3];
}

@end