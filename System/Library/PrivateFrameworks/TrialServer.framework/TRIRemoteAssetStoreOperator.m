@interface TRIRemoteAssetStoreOperator
- (BOOL)addSymlinkFromAssetWithIdentifier:(id)a3 toPath:(id)a4 flockWitness:(TRIFlockWitness_ *)a5;
- (BOOL)collectGarbageOlderThanNumScans:(unsigned int)a3 deletedAssetSize:(unint64_t *)a4 ignoreRecentlyCreatedAssets:(BOOL)a5 dryRun:(BOOL)a6 includedCacheDeletableAssetIds:(id)a7 deletedAssetIds:(id *)a8;
- (BOOL)fixFileProtectionForAssetStoreFiles;
- (BOOL)migrateToGlobalAssetStoreIfNeeded;
- (BOOL)overwriteGlobalActiveFactorProvidersWithNamespaceMap:(id)a3 factorPackMap:(id)a4 rolloutDeploymentMap:(id)a5;
- (BOOL)removeAssetWithIdentifier:(id)a3;
- (BOOL)removeUnreferencedGlobalFactorPacksWithRemovedCount:(unsigned int *)a3;
- (BOOL)saveAssetWithIdentifier:(id)a3 sourcePath:(id)a4 flockWitness:(TRIFlockWitness_ *)a5 removeSourceOnFailure:(BOOL)a6;
- (BOOL)saveFactorPackToGlobalPath:(id)a3 fromTemporaryPath:(id)a4 factors:(id)a5;
- (BOOL)updateFactorPackAtGlobalPath:(id)a3 deletingFactors:(id)a4;
- (BOOL)updateFactorPackAtGlobalPath:(id)a3 withFactors:(id)a4;
- (TRIRemoteAssetStoreOperator)initWithPaths:(id)a3;
- (id)referenceMAAutoAssetWithId:(id)a3 futurePath:(id)a4 currentPath:(id)a5 isFileFactor:(BOOL)a6;
@end

@implementation TRIRemoteAssetStoreOperator

- (TRIRemoteAssetStoreOperator)initWithPaths:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TRIRemoteAssetStoreOperator;
  v6 = [(TRIRemoteAssetStoreOperator *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_paths, a3);
    uint64_t v8 = objc_opt_new();
    storageManagement = v7->_storageManagement;
    v7->_storageManagement = (TRIStorageManagementProtocol *)v8;

    v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3486860];
    id v11 = objc_alloc(MEMORY[0x1E4F93BC0]);
    v12 = TRILogCategory_Server();
    uint64_t v13 = [v11 initWithServiceName:@"com.apple.triald.system.internal" allowlistedServerInterface:v10 allowlistedClientInterface:0 serverInitiatedRequestHandler:0 allowSystemToUserConnection:1 interruptionHandler:&__block_literal_global_36 invalidationHandler:&__block_literal_global_322 logHandle:v12];
    internalHelper = v7->_internalHelper;
    v7->_internalHelper = (_PASXPCClientHelper *)v13;
  }
  return v7;
}

- (BOOL)saveAssetWithIdentifier:(id)a3 sourcePath:(id)a4 flockWitness:(TRIFlockWitness_ *)a5 removeSourceOnFailure:(BOOL)a6
{
  BOOL v28 = a6;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = NSTemporaryDirectory();
  uint64_t v13 = objc_opt_new();
  uint64_t v14 = [v13 UUIDString];
  v15 = [v12 stringByAppendingPathComponent:v14];

  objc_super v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v35 = 0;
  LOBYTE(v14) = [v16 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:&v35];
  id v17 = v35;

  if ((v14 & 1) == 0)
  {
    v18 = TRILogCategory_Server();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Unable to create global source path at %{public}@: %@", buf, 0x16u);
    }
  }
  [MEMORY[0x1E4F28CB8] triForceRenameWithSourcePath:v11 destPath:v15];
  id v19 = v15;
  if (!v19)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"TRIRemoteAssetStoreOperator.m", 72, @"Expression was unexpectedly nil/false: %@", @"globalSourcePath" object file lineNumber description];
  }
  v20 = +[TRISandboxExtensionFactory extensionTokenForPath:v19 extensionClass:1];

  v21 = TRILogCategory_Server();
  v22 = v21;
  if (v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1DA291000, v22, OS_LOG_TYPE_DEBUG, "Successfully created save asset extension.", buf, 2u);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v37 = __Block_byref_object_copy__60;
    v38 = __Block_byref_object_dispose__60;
    id v39 = 0;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __101__TRIRemoteAssetStoreOperator_saveAssetWithIdentifier_sourcePath_flockWitness_removeSourceOnFailure___block_invoke;
    v34[3] = &unk_1E6BBBB50;
    v34[4] = buf;
    v23 = (void *)MEMORY[0x1E016EA80](v34);
    v24 = [(_PASXPCClientHelper *)self->_internalHelper synchronousRemoteObjectProxyWithErrorHandler:v23];
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __101__TRIRemoteAssetStoreOperator_saveAssetWithIdentifier_sourcePath_flockWitness_removeSourceOnFailure___block_invoke_2;
    v29[3] = &unk_1E6BBCE30;
    v29[4] = &v30;
    [v24 saveAssetWithIdentifier:v10 sourcePath:v19 flockWitness:a5 removeSourceOnFailure:v28 sourceExtension:v20 completion:v29];
    if (*(void *)(*(void *)&buf[8] + 40)) {
      BOOL v25 = 0;
    }
    else {
      BOOL v25 = *((unsigned char *)v31 + 24) != 0;
    }
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v22, OS_LOG_TYPE_ERROR, "Unable to get extension token. Bailing out from saveAssetWithIdentifier", buf, 2u);
    }

    BOOL v25 = 0;
  }

  return v25;
}

void __101__TRIRemoteAssetStoreOperator_saveAssetWithIdentifier_sourcePath_flockWitness_removeSourceOnFailure___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __101__TRIRemoteAssetStoreOperator_saveAssetWithIdentifier_sourcePath_flockWitness_removeSourceOnFailure___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)removeAssetWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  objc_super v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__60;
  id v19 = __Block_byref_object_dispose__60;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__TRIRemoteAssetStoreOperator_removeAssetWithIdentifier___block_invoke;
  v14[3] = &unk_1E6BBBB50;
  v14[4] = &v15;
  id v5 = (void *)MEMORY[0x1E016EA80](v14);
  v6 = [(_PASXPCClientHelper *)self->_internalHelper synchronousRemoteObjectProxyWithErrorHandler:v5];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__TRIRemoteAssetStoreOperator_removeAssetWithIdentifier___block_invoke_2;
  v9[3] = &unk_1E6BBCE30;
  v9[4] = &v10;
  [v6 removeAssetWithIdentifier:v4 completion:v9];
  if (v16[5]) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = *((unsigned char *)v11 + 24) != 0;
  }
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __57__TRIRemoteAssetStoreOperator_removeAssetWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __57__TRIRemoteAssetStoreOperator_removeAssetWithIdentifier___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)addSymlinkFromAssetWithIdentifier:(id)a3 toPath:(id)a4 flockWitness:(TRIFlockWitness_ *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([MEMORY[0x1E4FB0208] hostingProcessIsTrialdSystem])
  {
    uint64_t v10 = [[TRIAssetStore alloc] initWithPaths:self->_paths];
    id v11 = [[TRIAssetStoreOperator alloc] initWithPaths:self->_paths storageManagement:self->_storageManagement assetStore:v10];
    BOOL v12 = [(TRIAssetStoreOperator *)v11 addSymlinkFromAssetWithIdentifier:v8 toPath:v9 flockWitness:a5];
  }
  else
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    BOOL v25 = __Block_byref_object_copy__60;
    v26 = __Block_byref_object_dispose__60;
    id v27 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __85__TRIRemoteAssetStoreOperator_addSymlinkFromAssetWithIdentifier_toPath_flockWitness___block_invoke;
    v21[3] = &unk_1E6BBBB50;
    v21[4] = &v22;
    char v13 = (void *)MEMORY[0x1E016EA80](v21);
    uint64_t v14 = [(_PASXPCClientHelper *)self->_internalHelper synchronousRemoteObjectProxyWithErrorHandler:v13];
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __85__TRIRemoteAssetStoreOperator_addSymlinkFromAssetWithIdentifier_toPath_flockWitness___block_invoke_2;
    v16[3] = &unk_1E6BBCE30;
    v16[4] = &v17;
    [v14 addSymlinkFromAssetWithIdentifier:v8 toPath:v9 flockWitness:a5 completion:v16];
    if (v23[5]) {
      BOOL v12 = 0;
    }
    else {
      BOOL v12 = *((unsigned char *)v18 + 24) != 0;
    }
    _Block_object_dispose(&v17, 8);

    _Block_object_dispose(&v22, 8);
  }

  return v12;
}

void __85__TRIRemoteAssetStoreOperator_addSymlinkFromAssetWithIdentifier_toPath_flockWitness___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __85__TRIRemoteAssetStoreOperator_addSymlinkFromAssetWithIdentifier_toPath_flockWitness___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)referenceMAAutoAssetWithId:(id)a3 futurePath:(id)a4 currentPath:(id)a5 isFileFactor:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ([MEMORY[0x1E4FB0208] hostingProcessIsTrialdSystem])
  {
    uint64_t v14 = [[TRIAssetStore alloc] initWithPaths:self->_paths];
    uint64_t v15 = [[TRIAssetStoreOperator alloc] initWithPaths:self->_paths storageManagement:self->_storageManagement assetStore:v14];
    id v16 = [(TRIAssetStoreOperator *)v15 referenceMAAutoAssetWithId:v11 futurePath:v12 currentPath:v13 isFileFactor:v6];
  }
  else
  {
    uint64_t v17 = NSTemporaryDirectory();
    v18 = objc_opt_new();
    uint64_t v19 = [v18 UUIDString];
    char v20 = [v17 stringByAppendingPathComponent:v19];

    v21 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v45 = 0;
    LOBYTE(v19) = [v21 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:0 error:&v45];
    id v22 = v45;

    if ((v19 & 1) == 0)
    {
      v23 = TRILogCategory_Server();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v22;
        _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "Unable to create global temp path at %{public}@: %@", buf, 0x16u);
      }
    }
    uint64_t v24 = [v13 lastPathComponent];
    BOOL v25 = [v20 stringByAppendingPathComponent:v24];

    v26 = TRILogCategory_Server();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v25;
      _os_log_impl(&dword_1DA291000, v26, OS_LOG_TYPE_DEFAULT, "Trying to create maRef at %{public}@. To support this on macOS, we'll create it in a global location at %{public}@ first.", buf, 0x16u);
    }

    id v27 = v25;
    if (!v27)
    {
      v36 = [MEMORY[0x1E4F28B00] currentHandler];
      [v36 handleFailureInMethod:a2, self, @"TRIRemoteAssetStoreOperator.m", 179, @"Expression was unexpectedly nil/false: %@", @"globalPath" object file lineNumber description];
    }
    BOOL v28 = +[TRISandboxExtensionFactory extensionTokenForPath:v27 extensionClass:1];

    if (v28)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v51 = __Block_byref_object_copy__60;
      v52 = __Block_byref_object_dispose__60;
      id v53 = 0;
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __94__TRIRemoteAssetStoreOperator_referenceMAAutoAssetWithId_futurePath_currentPath_isFileFactor___block_invoke;
      v44[3] = &unk_1E6BBBB50;
      v44[4] = buf;
      v29 = (void *)MEMORY[0x1E016EA80](v44);
      uint64_t v30 = [(_PASXPCClientHelper *)self->_internalHelper synchronousRemoteObjectProxyWithErrorHandler:v29];
      uint64_t v38 = 0;
      id v39 = &v38;
      uint64_t v40 = 0x3032000000;
      v41 = __Block_byref_object_copy__60;
      v42 = __Block_byref_object_dispose__60;
      id v43 = 0;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __94__TRIRemoteAssetStoreOperator_referenceMAAutoAssetWithId_futurePath_currentPath_isFileFactor___block_invoke_2;
      v37[3] = &unk_1E6BBE700;
      v37[4] = &v38;
      [v30 referenceMAAutoAssetWithId:v11 futurePath:v12 currentPath:v27 isFileFactor:v6 sourceExtension:v28 completion:v37];
      if (*(void *)(*(void *)&buf[8] + 40))
      {
        id v16 = 0;
      }
      else
      {
        uint64_t v32 = (void *)v39[5];
        if (v32)
        {
          char v33 = TRILogCategory_Server();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v34 = v39[5];
            *(_DWORD *)v46 = 138543618;
            uint64_t v47 = v34;
            __int16 v48 = 2114;
            id v49 = v13;
            _os_log_impl(&dword_1DA291000, v33, OS_LOG_TYPE_DEFAULT, "Now that the maRef has been created at %{public}@ we will move it back to %{public}@.", v46, 0x16u);
          }

          [MEMORY[0x1E4F28CB8] triForceRenameWithSourcePath:v39[5] destPath:v13];
          uint64_t v32 = (void *)v39[5];
        }
        id v16 = v32;
      }
      _Block_object_dispose(&v38, 8);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v31 = TRILogCategory_Server();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DA291000, v31, OS_LOG_TYPE_ERROR, "Unable to get extension token. Bailing out from referenceMAAutoAssetWithId", buf, 2u);
      }

      id v16 = 0;
    }
  }
  return v16;
}

void __94__TRIRemoteAssetStoreOperator_referenceMAAutoAssetWithId_futurePath_currentPath_isFileFactor___block_invoke(uint64_t a1, void *a2)
{
}

void __94__TRIRemoteAssetStoreOperator_referenceMAAutoAssetWithId_futurePath_currentPath_isFileFactor___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)collectGarbageOlderThanNumScans:(unsigned int)a3 deletedAssetSize:(unint64_t *)a4 ignoreRecentlyCreatedAssets:(BOOL)a5 dryRun:(BOOL)a6 includedCacheDeletableAssetIds:(id)a7 deletedAssetIds:(id *)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  uint64_t v12 = *(void *)&a3;
  id v14 = a7;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__60;
  id v35 = __Block_byref_object_dispose__60;
  id v36 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __162__TRIRemoteAssetStoreOperator_collectGarbageOlderThanNumScans_deletedAssetSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke;
  v30[3] = &unk_1E6BBBB50;
  v30[4] = &v31;
  uint64_t v15 = (void *)MEMORY[0x1E016EA80](v30);
  uint64_t v24 = 0;
  BOOL v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__60;
  BOOL v28 = __Block_byref_object_dispose__60;
  id v29 = 0;
  id v16 = [(_PASXPCClientHelper *)self->_internalHelper synchronousRemoteObjectProxyWithErrorHandler:v15];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __162__TRIRemoteAssetStoreOperator_collectGarbageOlderThanNumScans_deletedAssetSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke_2;
  v19[3] = &unk_1E6BBE728;
  v19[4] = &v20;
  v19[5] = &v24;
  [v16 collectGarbageOlderThanNumScans:v12 deletedAssetSize:a4 ignoreRecentlyCreatedAssets:v10 dryRun:v9 includedCacheDeletableAssetIds:v14 completion:v19];
  if (a8) {
    objc_storeStrong(a8, (id)v25[5]);
  }
  if (v32[5]) {
    BOOL v17 = 0;
  }
  else {
    BOOL v17 = *((unsigned char *)v21 + 24) != 0;
  }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

void __162__TRIRemoteAssetStoreOperator_collectGarbageOlderThanNumScans_deletedAssetSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke(uint64_t a1, void *a2)
{
}

void __162__TRIRemoteAssetStoreOperator_collectGarbageOlderThanNumScans_deletedAssetSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)fixFileProtectionForAssetStoreFiles
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__60;
  BOOL v17 = __Block_byref_object_dispose__60;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__TRIRemoteAssetStoreOperator_fixFileProtectionForAssetStoreFiles__block_invoke;
  v12[3] = &unk_1E6BBBB50;
  v12[4] = &v13;
  v3 = (void *)MEMORY[0x1E016EA80](v12, a2);
  id v4 = [(_PASXPCClientHelper *)self->_internalHelper synchronousRemoteObjectProxyWithErrorHandler:v3];
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__TRIRemoteAssetStoreOperator_fixFileProtectionForAssetStoreFiles__block_invoke_2;
  v7[3] = &unk_1E6BBCE30;
  v7[4] = &v8;
  [v4 fixFileProtectionForAssetStoreWithCompletion:v7];
  if (v14[5]) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = *((unsigned char *)v9 + 24) != 0;
  }
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v13, 8);
  return v5;
}

void __66__TRIRemoteAssetStoreOperator_fixFileProtectionForAssetStoreFiles__block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __66__TRIRemoteAssetStoreOperator_fixFileProtectionForAssetStoreFiles__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)saveFactorPackToGlobalPath:(id)a3 fromTemporaryPath:(id)a4 factors:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__60;
  uint64_t v30 = __Block_byref_object_dispose__60;
  id v31 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __84__TRIRemoteAssetStoreOperator_saveFactorPackToGlobalPath_fromTemporaryPath_factors___block_invoke;
  v25[3] = &unk_1E6BBBB50;
  v25[4] = &v26;
  uint64_t v12 = (void *)MEMORY[0x1E016EA80](v25);
  id v13 = v10;
  if (!v13)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"TRIRemoteAssetStoreOperator.m", 269, @"Expression was unexpectedly nil/false: %@", @"temporaryPath" object file lineNumber description];
  }
  id v14 = +[TRISandboxExtensionFactory extensionTokenForPath:v13 extensionClass:1];

  if (v14)
  {
    uint64_t v15 = [(_PASXPCClientHelper *)self->_internalHelper synchronousRemoteObjectProxyWithErrorHandler:v12];
    *(void *)buf = 0;
    uint64_t v22 = buf;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    id v16 = objc_msgSend(NSString, "stringWithFormat:", @"%u", getuid());
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __84__TRIRemoteAssetStoreOperator_saveFactorPackToGlobalPath_fromTemporaryPath_factors___block_invoke_353;
    v20[3] = &unk_1E6BBCE30;
    v20[4] = buf;
    [v15 saveFactorPackForUserId:v16 toGlobalPath:v9 fromTemporaryPath:v13 factors:v11 sourceExtension:v14 completion:v20];

    if (v27[5]) {
      BOOL v17 = 0;
    }
    else {
      BOOL v17 = v22[24] != 0;
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v15 = TRILogCategory_Server();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Unable to get extension token. Bailing out from saveFactorPackToGlobalPath", buf, 2u);
    }
    BOOL v17 = 0;
  }

  _Block_object_dispose(&v26, 8);
  return v17;
}

void __84__TRIRemoteAssetStoreOperator_saveFactorPackToGlobalPath_fromTemporaryPath_factors___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __84__TRIRemoteAssetStoreOperator_saveFactorPackToGlobalPath_fromTemporaryPath_factors___block_invoke_353(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)updateFactorPackAtGlobalPath:(id)a3 withFactors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__60;
  uint64_t v23 = __Block_byref_object_dispose__60;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__TRIRemoteAssetStoreOperator_updateFactorPackAtGlobalPath_withFactors___block_invoke;
  v18[3] = &unk_1E6BBBB50;
  v18[4] = &v19;
  uint64_t v8 = (void *)MEMORY[0x1E016EA80](v18);
  id v9 = [(_PASXPCClientHelper *)self->_internalHelper synchronousRemoteObjectProxyWithErrorHandler:v8];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%u", getuid());
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__TRIRemoteAssetStoreOperator_updateFactorPackAtGlobalPath_withFactors___block_invoke_2;
  v13[3] = &unk_1E6BBCE30;
  v13[4] = &v14;
  [v9 updateFactorPackForUserId:v10 atGlobalPath:v6 populatingFactors:v7 completion:v13];

  if (v20[5]) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = *((unsigned char *)v15 + 24) != 0;
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __72__TRIRemoteAssetStoreOperator_updateFactorPackAtGlobalPath_withFactors___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __72__TRIRemoteAssetStoreOperator_updateFactorPackAtGlobalPath_withFactors___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)updateFactorPackAtGlobalPath:(id)a3 deletingFactors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__60;
  uint64_t v23 = __Block_byref_object_dispose__60;
  id v24 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76__TRIRemoteAssetStoreOperator_updateFactorPackAtGlobalPath_deletingFactors___block_invoke;
  v18[3] = &unk_1E6BBBB50;
  v18[4] = &v19;
  uint64_t v8 = (void *)MEMORY[0x1E016EA80](v18);
  id v9 = [(_PASXPCClientHelper *)self->_internalHelper synchronousRemoteObjectProxyWithErrorHandler:v8];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%u", getuid());
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__TRIRemoteAssetStoreOperator_updateFactorPackAtGlobalPath_deletingFactors___block_invoke_2;
  v13[3] = &unk_1E6BBCE30;
  v13[4] = &v14;
  [v9 updateFactorPackForUserId:v10 atGlobalPath:v6 deletingFactors:v7 completion:v13];

  if (v20[5]) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = *((unsigned char *)v15 + 24) != 0;
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __76__TRIRemoteAssetStoreOperator_updateFactorPackAtGlobalPath_deletingFactors___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __76__TRIRemoteAssetStoreOperator_updateFactorPackAtGlobalPath_deletingFactors___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)removeUnreferencedGlobalFactorPacksWithRemovedCount:(unsigned int *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__60;
  uint64_t v19 = __Block_byref_object_dispose__60;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__TRIRemoteAssetStoreOperator_removeUnreferencedGlobalFactorPacksWithRemovedCount___block_invoke;
  v14[3] = &unk_1E6BBBB50;
  v14[4] = &v15;
  BOOL v5 = (void *)MEMORY[0x1E016EA80](v14, a2);
  id v6 = [(_PASXPCClientHelper *)self->_internalHelper synchronousRemoteObjectProxyWithErrorHandler:v5];
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__TRIRemoteAssetStoreOperator_removeUnreferencedGlobalFactorPacksWithRemovedCount___block_invoke_2;
  v9[3] = &unk_1E6BBE750;
  v9[4] = &v10;
  void v9[5] = a3;
  [v6 removeUnreferencedGlobalFactorPacksWithCompletion:v9];
  if (v16[5]) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = *((unsigned char *)v11 + 24) != 0;
  }
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __83__TRIRemoteAssetStoreOperator_removeUnreferencedGlobalFactorPacksWithRemovedCount___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __83__TRIRemoteAssetStoreOperator_removeUnreferencedGlobalFactorPacksWithRemovedCount___block_invoke_2(uint64_t result, char a2, int a3)
{
  v3 = *(_DWORD **)(result + 40);
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  if (v3) {
    _DWORD *v3 = a3;
  }
  return result;
}

- (BOOL)overwriteGlobalActiveFactorProvidersWithNamespaceMap:(id)a3 factorPackMap:(id)a4 rolloutDeploymentMap:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__60;
  BOOL v25 = __Block_byref_object_dispose__60;
  id v26 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __119__TRIRemoteAssetStoreOperator_overwriteGlobalActiveFactorProvidersWithNamespaceMap_factorPackMap_rolloutDeploymentMap___block_invoke;
  v20[3] = &unk_1E6BBBB50;
  v20[4] = &v21;
  BOOL v11 = (void *)MEMORY[0x1E016EA80](v20);
  uint64_t v12 = [(_PASXPCClientHelper *)self->_internalHelper synchronousRemoteObjectProxyWithErrorHandler:v11];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __119__TRIRemoteAssetStoreOperator_overwriteGlobalActiveFactorProvidersWithNamespaceMap_factorPackMap_rolloutDeploymentMap___block_invoke_2;
  v15[3] = &unk_1E6BBCE30;
  v15[4] = &v16;
  [v12 overwriteGlobalActiveFactorProvidersWithNamespaceMap:v8 factorPackMap:v9 rolloutDeploymentMap:v10 completion:v15];
  if (v22[5]) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = *((unsigned char *)v17 + 24) != 0;
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __119__TRIRemoteAssetStoreOperator_overwriteGlobalActiveFactorProvidersWithNamespaceMap_factorPackMap_rolloutDeploymentMap___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __119__TRIRemoteAssetStoreOperator_overwriteGlobalActiveFactorProvidersWithNamespaceMap_factorPackMap_rolloutDeploymentMap___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)migrateToGlobalAssetStoreIfNeeded
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_INFO, "Considering migrating to the global asset store.", (uint8_t *)&buf, 2u);
  }

  BOOL v5 = [(TRIPaths *)self->_paths assetStoreUsingGlobal:0];
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v7 = [v6 fileExistsAtPath:v5];

  if (v7)
  {
    id v8 = [(TRIPaths *)self->_paths trialRootDirUsingGlobal:0];
    if (!v8)
    {
      id v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, self, @"TRIRemoteAssetStoreOperator.m", 390, @"Expression was unexpectedly nil/false: %@", @"extensionPath" object file lineNumber description];
    }
    id v9 = +[TRISandboxExtensionFactory extensionTokenForPath:v8 extensionClass:1];

    if (v9)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v31 = 0x3032000000;
      uint64_t v32 = __Block_byref_object_copy__60;
      uint64_t v33 = __Block_byref_object_dispose__60;
      id v34 = 0;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __64__TRIRemoteAssetStoreOperator_migrateToGlobalAssetStoreIfNeeded__block_invoke;
      v27[3] = &unk_1E6BBBB50;
      v27[4] = &buf;
      id v10 = (void *)MEMORY[0x1E016EA80](v27);
      BOOL v11 = [(_PASXPCClientHelper *)self->_internalHelper synchronousRemoteObjectProxyWithErrorHandler:v10];
      uint64_t v23 = 0;
      id v24 = &v23;
      uint64_t v25 = 0x2020000000;
      char v26 = 0;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __64__TRIRemoteAssetStoreOperator_migrateToGlobalAssetStoreIfNeeded__block_invoke_2;
      v22[3] = &unk_1E6BBCE30;
      v22[4] = &v23;
      [v11 migrateToGlobalAssetStoreIfNeededFromLocalStore:v5 sourceExtension:v9 completion:v22];
      if (*(void *)(*((void *)&buf + 1) + 40) || !*((unsigned char *)v24 + 24))
      {
        BOOL v12 = 0;
      }
      else
      {
        uint64_t v14 = TRILogCategory_Server();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v28 = 0;
          _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "Removing local asset store following successful migration to global.", v28, 2u);
        }

        uint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v21 = 0;
        char v16 = [v15 triForceRemoveItemAtPath:v5 error:&v21];
        id v17 = v21;

        if ((v16 & 1) == 0)
        {
          uint64_t v18 = TRILogCategory_Server();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t v28 = 138543362;
            id v29 = v5;
            _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Failed to delete local asset store after successfully migrating: %{public}@", v28, 0xCu);
          }

          *((unsigned char *)v24 + 24) = 0;
        }

        BOOL v12 = *((unsigned char *)v24 + 24) != 0;
      }
      _Block_object_dispose(&v23, 8);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      BOOL v13 = TRILogCategory_Server();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Unable to get extension token. Bailing out from migrateToGlobalAssetStoreIfNeeded", (uint8_t *)&buf, 2u);
      }

      BOOL v12 = 0;
    }
  }
  else
  {
    id v8 = TRILogCategory_Server();
    BOOL v12 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_1DA291000, v8, OS_LOG_TYPE_INFO, "No local asset store exists at %{public}@. No need to migrate.", (uint8_t *)&buf, 0xCu);
    }
  }

  return v12;
}

void __64__TRIRemoteAssetStoreOperator_migrateToGlobalAssetStoreIfNeeded__block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __64__TRIRemoteAssetStoreOperator_migrateToGlobalAssetStoreIfNeeded__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageManagement, 0);
  objc_storeStrong((id *)&self->_internalHelper, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end