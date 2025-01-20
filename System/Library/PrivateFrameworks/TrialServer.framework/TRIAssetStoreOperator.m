@interface TRIAssetStoreOperator
+ (unint64_t)_fileSizeInBytesForPath:(id)a3;
- (BOOL)_acquireLockfileAndRunBlock:(id)a3;
- (BOOL)_acquireLockfileInAssetStorePath:(id)a3 andRunBlock:(id)a4;
- (BOOL)_clearUnrefAgeForAssetWithIdentifier:(id)a3;
- (BOOL)_fixFileProtectionForFileURL:(id)a3;
- (BOOL)_forceRemoveItemAtPath:(id)a3;
- (BOOL)_incrementUnrefAgeForAssetWithIdentifier:(id)a3 newValue:(unsigned int *)a4 dryRun:(BOOL)a5;
- (BOOL)_migrateAssetContentsWithLocalAssetStorePath:(id)a3 flockWitness:(TRIFlockWitness_ *)a4;
- (BOOL)_migrateAssetsDatabaseWithLocalAssetStorePath:(id)a3;
- (BOOL)_moveDirectoryAssetFromDirectory:(id)a3 toLocationForAssetIdentifier:(id)a4;
- (BOOL)_nonAtomicOverwriteWithSrc:(id)a3 dest:(id)a4 finalPermissionBits:(const unsigned __int16 *)a5;
- (BOOL)_overwriteRenameAsAtomicallyAsPossibleWithSrc:(id)a3 dest:(id)a4;
- (BOOL)_relinkLocalAssetToGlobalAssetStore:(id)a3 withAssetId:(id)a4 localAssetDir:(id)a5;
- (BOOL)_removeAssetWithIdentifier:(id)a3 flockWitness:(TRIFlockWitness_ *)a4 deletedAssetSize:(unint64_t *)a5 dryRun:(BOOL)a6;
- (BOOL)_removeDeadSymlinksWithFlockWitness:(TRIFlockWitness_ *)a3 numRemoved:(unsigned int *)a4;
- (BOOL)_removePaths:(id)a3 numRemoved:(unsigned int *)a4;
- (BOOL)_removeUnreferencedAssetsWithFlockWitness:(TRIFlockWitness_ *)a3 olderThanAge:(unsigned int)a4 numRemoved:(unsigned int *)a5 deletedAssetsSize:(unint64_t *)a6 ignoreRecentlyCreatedAssets:(BOOL)a7 dryRun:(BOOL)a8 includedCacheDeletableAssetIds:(id)a9 deletedAssetIds:(id *)a10;
- (BOOL)addSymlinkFromAssetWithIdentifier:(id)a3 toPath:(id)a4 flockWitness:(TRIFlockWitness_ *)a5;
- (BOOL)collectGarbageOlderThanNumScans:(unsigned int)a3 deletedAssetSize:(unint64_t *)a4 ignoreRecentlyCreatedAssets:(BOOL)a5 dryRun:(BOOL)a6 includedCacheDeletableAssetIds:(id)a7 deletedAssetIds:(id *)a8;
- (BOOL)fixFileProtectionForAssetStoreFiles;
- (BOOL)migrateToGlobalAssetStoreFromLocalAssetStore:(id)a3;
- (BOOL)removeAssetWithIdentifier:(id)a3;
- (BOOL)saveAssetWithIdentifier:(id)a3 sourcePath:(id)a4 flockWitness:(TRIFlockWitness_ *)a5 removeSourceOnFailure:(BOOL)a6;
- (TRIAssetStoreOperator)initWithPaths:(id)a3 storageManagement:(id)a4 assetStore:(id)a5;
- (id)_collectDeadSymlinks;
- (id)_collectUnreferencedAssetsIncludingLinkTargetsForReferencedAssetIds:(id)a3 ignoreRecentlyCreatedAssets:(BOOL)a4;
- (id)_creationDateForAsset:(id)a3;
- (id)_requireAssetStoreTempDir;
- (id)referenceMAAutoAssetWithId:(id)a3 futurePath:(id)a4 currentPath:(id)a5 isFileFactor:(BOOL)a6;
- (unsigned)_hardLinkCountForAssetWithIdentifier:(id)a3;
- (unsigned)_hardLinkCountForFileWithPath:(id)a3;
- (void)_fixupPermissionsOnPath:(id)a3 permissionBits:(const unsigned __int16 *)a4;
@end

@implementation TRIAssetStoreOperator

- (TRIAssetStoreOperator)initWithPaths:(id)a3 storageManagement:(id)a4 assetStore:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TRIAssetStoreOperator;
  v12 = [(TRIAssetStoreOperator *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_paths, a3);
    objc_storeStrong((id *)&v13->_storageManagement, a4);
    objc_storeWeak((id *)&v13->_store, v11);
    [v11 setAssetOperator:v13];
  }

  return v13;
}

- (BOOL)saveAssetWithIdentifier:(id)a3 sourcePath:(id)a4 flockWitness:(TRIFlockWitness_ *)a5 removeSourceOnFailure:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  BOOL v10 = [(TRIAssetStoreOperator *)self _moveDirectoryAssetFromDirectory:v9 toLocationForAssetIdentifier:a3];
  if (!v10 && v6)
  {
    id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v11 triForceRemoveItemAtPath:v9 error:0];
  }
  return v10;
}

- (BOOL)_moveDirectoryAssetFromDirectory:(id)a3 toLocationForAssetIdentifier:(id)a4
{
  v81[2] = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v6 = a4;
  v58 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v8 = WeakRetained;
  v59 = v6;
  if (WeakRetained)
  {
    os_log_t oslog = [WeakRetained pathForAssetDirWithIdentifier:v6];
    id v60 = [v61 stringByAppendingPathComponent:@"content"];
    char v75 = 0;
    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v10 = [v9 fileExistsAtPath:v60 isDirectory:&v75];

    if ((v10 & 1) == 0)
    {
      id v11 = TRILogCategory_Server();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v80.st_dev = 138543618;
        *(void *)&v80.st_mode = v59;
        WORD2(v80.st_ino) = 2114;
        *(__darwin_ino64_t *)((char *)&v80.st_ino + 6) = (__darwin_ino64_t)v60;
        _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Unable to save asset %{public}@. Can't find source at %{public}@", (uint8_t *)&v80, 0x16u);
      }
    }
    if (v75)
    {
      id v12 = v60;
      if (chmod((const char *)[v12 fileSystemRepresentation], 0x168u))
      {
        v13 = TRILogCategory_Server();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v51 = __error();
          v52 = strerror(*v51);
          dev_t v53 = *__error();
          v80.st_dev = 138543874;
          *(void *)&v80.st_mode = v12;
          WORD2(v80.st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&v80.st_ino + 6) = (__darwin_ino64_t)v52;
          HIWORD(v80.st_gid) = 1024;
          v80.st_rdev = v53;
          _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Failed to set permissions on dir-asset toplevel directory %{public}@: %s (%d)", (uint8_t *)&v80, 0x1Cu);
        }

LABEL_57:
        BOOL v14 = 0;
LABEL_63:

        goto LABEL_64;
      }
      uint64_t v69 = 0;
      v70 = &v69;
      uint64_t v71 = 0x3032000000;
      v72 = __Block_byref_object_copy__43;
      v73 = __Block_byref_object_dispose__43;
      id v74 = 0;
      v55 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v12 isDirectory:1];
      objc_super v15 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v16 = *MEMORY[0x1E4F1C670];
      uint64_t v56 = *MEMORY[0x1E4F1C628];
      v81[0] = *MEMORY[0x1E4F1C628];
      v81[1] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __87__TRIAssetStoreOperator__moveDirectoryAssetFromDirectory_toLocationForAssetIdentifier___block_invoke;
      v68[3] = &unk_1E6BBB998;
      v68[4] = &v69;
      v18 = [v15 enumeratorAtURL:v55 includingPropertiesForKeys:v17 options:0 errorHandler:v68];

      if (v18)
      {
        while (1)
        {
          v19 = (void *)MEMORY[0x1E016E7F0]();
          v20 = [v18 nextObject];
          v21 = v20;
          if (!v20)
          {
            int v28 = 3;
            goto LABEL_29;
          }
          id v66 = 0;
          id v67 = 0;
          char v22 = [v20 getResourceValue:&v67 forKey:v16 error:&v66];
          id v23 = v67;
          id v24 = v66;
          if (v22)
          {
            if ([v23 BOOLValue])
            {
              v25 = [v21 path];
              if (!v25)
              {
                v42 = [MEMORY[0x1E4F28B00] currentHandler];
                [v42 handleFailureInMethod:a2, v58, @"TRIAssetStoreOperator.m", 140, @"Expression was unexpectedly nil/false: %@", @"childURL.path" object file lineNumber description];
              }
              v26 = v25;
              if (!chmod((const char *)[v26 fileSystemRepresentation], 0x124u))
              {
LABEL_43:
                int v28 = 2;
                goto LABEL_27;
              }
              v27 = TRILogCategory_Server();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                v39 = __error();
                v40 = strerror(*v39);
                dev_t v41 = *__error();
                v80.st_dev = 138543874;
                *(void *)&v80.st_mode = v26;
                WORD2(v80.st_ino) = 2080;
                *(__darwin_ino64_t *)((char *)&v80.st_ino + 6) = (__darwin_ino64_t)v40;
                HIWORD(v80.st_gid) = 1024;
                v80.st_rdev = v41;
                _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "Failed to set permissions on dir-asset file %{public}@: %s (%d)", (uint8_t *)&v80, 0x1Cu);
              }
              goto LABEL_23;
            }

            id v64 = 0;
            id v65 = 0;
            char v29 = [v21 getResourceValue:&v65 forKey:v56 error:&v64];
            id v23 = v65;
            id v24 = v64;
            if (v29)
            {
              if (![v23 BOOLValue])
              {
                int v28 = 0;
                goto LABEL_28;
              }
              v30 = [v21 path];
              if (!v30)
              {
                v43 = [MEMORY[0x1E4F28B00] currentHandler];
                [v43 handleFailureInMethod:a2, v58, @"TRIAssetStoreOperator.m", 167, @"Expression was unexpectedly nil/false: %@", @"childURL.path" object file lineNumber description];
              }
              memset(&v80, 0, sizeof(v80));
              v26 = v30;
              if (!lstat((const char *)[v26 fileSystemRepresentation], &v80)
                && (~v80.st_mode & 0x140) != 0)
              {
                v27 = TRILogCategory_Server();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v77 = v80.st_mode;
                  *(_WORD *)&v77[4] = 2114;
                  *(void *)&v77[6] = v61;
                  v34 = v27;
                  v35 = "Candidate asset subdirectory was constructed with bad permission bits 0%o: %{public}@";
                  uint32_t v36 = 18;
LABEL_50:
                  _os_log_error_impl(&dword_1DA291000, v34, OS_LOG_TYPE_ERROR, v35, buf, v36);
                }
              }
              else
              {
                v31 = v26;
                if (!chmod((const char *)[v31 fileSystemRepresentation], 0x168u)) {
                  goto LABEL_43;
                }
                v27 = TRILogCategory_Server();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  v32 = __error();
                  v54 = strerror(*v32);
                  int v33 = *__error();
                  *(_DWORD *)buf = 138543874;
                  *(void *)v77 = v31;
                  *(_WORD *)&v77[8] = 2080;
                  *(void *)&v77[10] = v54;
                  __int16 v78 = 1024;
                  int v79 = v33;
                  v34 = v27;
                  v35 = "Failed to set permissions on dir-asset subdirectory %{public}@: %s (%d)";
                  uint32_t v36 = 28;
                  goto LABEL_50;
                }
              }
LABEL_23:

              goto LABEL_26;
            }
            v26 = TRILogCategory_Server();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              v80.st_dev = 138543362;
              *(void *)&v80.st_mode = v24;
              v37 = v26;
              v38 = "Failed to get directory attribute: %{public}@";
LABEL_46:
              _os_log_error_impl(&dword_1DA291000, v37, OS_LOG_TYPE_ERROR, v38, (uint8_t *)&v80, 0xCu);
            }
          }
          else
          {
            v26 = TRILogCategory_Server();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              v80.st_dev = 138543362;
              *(void *)&v80.st_mode = v24;
              v37 = v26;
              v38 = "Failed to get regular file attribute: %{public}@";
              goto LABEL_46;
            }
          }
LABEL_26:
          int v28 = 1;
LABEL_27:

LABEL_28:
LABEL_29:

          if (v28 && v28 != 2)
          {
            if (v28 == 3) {
              int v28 = v70[5] != 0;
            }
            goto LABEL_56;
          }
        }
      }
      v44 = TRILogCategory_Server();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v80.st_dev = 138543362;
        *(void *)&v80.st_mode = v12;
        _os_log_error_impl(&dword_1DA291000, v44, OS_LOG_TYPE_ERROR, "Failed to enumerate dir-asset toplevel directory: %{public}@", (uint8_t *)&v80, 0xCu);
      }

      int v28 = 1;
LABEL_56:

      _Block_object_dispose(&v69, 8);
      if (v28) {
        goto LABEL_57;
      }
    }
    v45 = [oslog stringByDeletingLastPathComponent];
    v46 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v63 = 0;
    char v47 = [v46 createDirectoryAtPath:v45 withIntermediateDirectories:1 attributes:0 error:&v63];
    id v48 = v63;

    if ((v47 & 1) == 0)
    {
      v49 = TRILogCategory_Server();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v80.st_dev = 138543362;
        *(void *)&v80.st_mode = v48;
        _os_log_error_impl(&dword_1DA291000, v49, OS_LOG_TYPE_ERROR, "Failed to create parent directory for asset: %{public}@", (uint8_t *)&v80, 0xCu);
      }
    }
    BOOL v14 = [(TRIAssetStoreOperator *)v58 _overwriteRenameAsAtomicallyAsPossibleWithSrc:v61 dest:oslog];
    goto LABEL_63;
  }
  TRILogCategory_Server();
  os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v80.st_dev) = 0;
    _os_log_error_impl(&dword_1DA291000, oslog, OS_LOG_TYPE_ERROR, "Asset store unexpectedly released from asset store operator.", (uint8_t *)&v80, 2u);
  }
  BOOL v14 = 0;
LABEL_64:

  return v14;
}

uint64_t __87__TRIAssetStoreOperator__moveDirectoryAssetFromDirectory_toLocationForAssetIdentifier___block_invoke(uint64_t a1, int a2, id obj)
{
  return 0;
}

- (BOOL)removeAssetWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"TRIAssetStoreOperator.m", 219, @"Invalid parameter not satisfying: %@", @"assetIdentifier" object file lineNumber description];
  }
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__TRIAssetStoreOperator_removeAssetWithIdentifier___block_invoke;
  v10[3] = &unk_1E6BBD5D0;
  id v12 = &v13;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  if ([(TRIAssetStoreOperator *)self _acquireLockfileAndRunBlock:v10]) {
    BOOL v7 = *((unsigned char *)v14 + 24) != 0;
  }
  else {
    BOOL v7 = 0;
  }

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __51__TRIAssetStoreOperator_removeAssetWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _removeAssetWithIdentifier:*(void *)(a1 + 40) flockWitness:a2 deletedAssetSize:0 dryRun:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

+ (unint64_t)_fileSizeInBytesForPath:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = [v4 attributesOfItemAtPath:v3 error:0];
  unint64_t v6 = [v5 fileSize];

  BOOL v7 = [v4 enumeratorAtPath:v3];
  v8 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v9 = [v7 nextObject];
  if (v9)
  {
    char v10 = (void *)v9;
    do
    {
      id v11 = [NSString stringWithFormat:@"%@/%@", v3, v10];
      id v12 = [v4 attributesOfItemAtPath:v11 error:0];
      uint64_t v13 = [v12 fileSize];

      v6 += v13;
      v8 = (void *)MEMORY[0x1E016E7F0]();
      uint64_t v14 = [v7 nextObject];

      char v10 = (void *)v14;
    }
    while (v14);
  }

  return v6;
}

- (BOOL)_removeAssetWithIdentifier:(id)a3 flockWitness:(TRIFlockWitness_ *)a4 deletedAssetSize:(unint64_t *)a5 dryRun:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  id v11 = TRILogCategory_Server();
  id v12 = v11;
  if (!WeakRetained)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Asset store unexpectedly released from asset store operator.", buf, 2u);
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = &stru_1F3455898;
    if (v6) {
      uint64_t v13 = @"(dry-run) ";
    }
    *(_DWORD *)buf = 138543618;
    id v24 = v13;
    __int16 v25 = 2114;
    id v26 = v9;
    _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Removing asset: %{public}@", buf, 0x16u);
  }

  if (a5) {
    *a5 = 0;
  }
  if ([WeakRetained hasAssetWithIdentifier:v9 type:0])
  {
    id v12 = [WeakRetained pathForAssetDirWithIdentifier:v9];
    unint64_t v14 = [(id)objc_opt_class() _fileSizeInBytesForPath:v12];
    if (v6)
    {
      if (!a5) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    char v22 = (void *)os_transaction_create();
    char v16 = [(TRIAssetStoreOperator *)self _requireAssetStoreTempDir];
    v17 = objc_opt_new();
    v18 = [v17 UUIDString];
    v19 = [v16 stringByAppendingPathComponent:v18];

    if ([(TRIAssetStoreOperator *)self _overwriteRenameAsAtomicallyAsPossibleWithSrc:v12 dest:v19])
    {
      BOOL v20 = [(TRIAssetStoreOperator *)self _forceRemoveItemAtPath:v19];

      BOOL v15 = 1;
      if (!a5 || !v20) {
        goto LABEL_21;
      }
LABEL_19:
      *a5 = v14;
LABEL_20:
      BOOL v15 = 1;
      goto LABEL_21;
    }

LABEL_14:
    BOOL v15 = 0;
LABEL_21:

    goto LABEL_22;
  }
  BOOL v15 = 1;
LABEL_22:

  return v15;
}

- (BOOL)addSymlinkFromAssetWithIdentifier:(id)a3 toPath:(id)a4 flockWitness:(TRIFlockWitness_ *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  char v10 = WeakRetained;
  if (WeakRetained)
  {
    id v11 = [WeakRetained pathForRefsToAssetWithIdentifier:v7];
    id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v31 = 0;
    char v13 = [v12 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v31];
    id v14 = v31;

    if ((v13 & 1) == 0)
    {
      BOOL v15 = TRILogCategory_Server();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v33 = v14;
        _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Failed to create directory: %{public}@", buf, 0xCu);
      }
    }
    id v16 = [NSString alloc];
    v17 = objc_opt_new();
    v18 = [v17 UUIDString];
    v19 = (void *)[v16 initWithFormat:@"link-%@", v18];
    BOOL v20 = [v11 stringByAppendingPathComponent:v19];

    id v21 = v8;
    char v22 = (const char *)[v21 fileSystemRepresentation];
    id v23 = v20;
    int v24 = symlink(v22, (const char *)[v23 fileSystemRepresentation]);
    BOOL v25 = v24 == 0;
    if (v24)
    {
      id v26 = TRILogCategory_Server();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        int v28 = __error();
        char v29 = strerror(*v28);
        int v30 = *__error();
        *(_DWORD *)buf = 138544130;
        id v33 = v23;
        __int16 v34 = 2114;
        id v35 = v21;
        __int16 v36 = 2080;
        v37 = v29;
        __int16 v38 = 1024;
        int v39 = v30;
        _os_log_error_impl(&dword_1DA291000, v26, OS_LOG_TYPE_ERROR, "Failed to create symlink %{public}@ --> %{public}@: %s (%d)", buf, 0x26u);
      }
    }
  }
  else
  {
    id v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Asset store unexpectedly released from asset store operator.", buf, 2u);
    }
    BOOL v25 = 0;
  }

  return v25;
}

- (id)referenceMAAutoAssetWithId:(id)a3 futurePath:(id)a4 currentPath:(id)a5 isFileFactor:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  char v29 = __Block_byref_object_copy__43;
  int v30 = __Block_byref_object_dispose__43;
  id v31 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __88__TRIAssetStoreOperator_referenceMAAutoAssetWithId_futurePath_currentPath_isFileFactor___block_invoke;
  v19[3] = &unk_1E6BBD618;
  v19[4] = self;
  id v14 = v11;
  id v20 = v14;
  id v15 = v12;
  BOOL v25 = a6;
  id v21 = v15;
  SEL v24 = a2;
  id v16 = v13;
  id v22 = v16;
  id v23 = &v26;
  [(TRIAssetStoreOperator *)self _acquireLockfileAndRunBlock:v19];
  id v17 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v17;
}

void __88__TRIAssetStoreOperator_referenceMAAutoAssetWithId_futurePath_currentPath_isFileFactor___block_invoke(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v2 = [[TRIAssetStoreDatabase alloc] initWithPaths:*(void *)(*(void *)(a1 + 32) + 8) storageManagement:*(void *)(*(void *)(a1 + 32) + 16)];
  if (v2)
  {
    id location = 0;
    v57 = objc_opt_new();
    id v3 = [v57 createAutoAssetWithId:*(void *)(a1 + 40) decryptionKey:0 error:&location];
    if (!v3)
    {
      os_log_t oslog = TRILogCategory_Server();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        uint64_t v34 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v34;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = location;
        _os_log_error_impl(&dword_1DA291000, oslog, OS_LOG_TYPE_ERROR, "Failed to instantiate MAAutoAsset %{public}@: %{public}@", buf, 0x16u);
      }
      goto LABEL_57;
    }
    id v4 = location;
    id location = 0;

    id obj = location;
    os_log_t oslog = [v3 currentLocksSync:&obj];
    objc_storeStrong(&location, obj);
    id v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = oslog;
      _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "MAAutoAssetStatus lock usage: %{public}@", buf, 0xCu);
    }

    dev_t v53 = [oslog objectForKeyedSubscript:@"persistently required by Trial"];
    if (oslog && [v53 intValue])
    {
      BOOL v6 = TRILogCategory_Server();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      uint64_t v7 = [v53 longValue];
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v3;
      id v8 = "MAAutoAsset already persistently locked %ld time(s), creating new lock anyway: %{public}@";
      id v9 = v6;
      uint32_t v10 = 22;
    }
    else
    {
      BOOL v6 = TRILogCategory_Server();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v3;
      id v8 = "MAAutoAsset was not persistently locked, creating new lock: %{public}@";
      id v9 = v6;
      uint32_t v10 = 12;
    }
    _os_log_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_12:

    v58 = objc_opt_new();
    [v58 setLockAcrossTermination:1];
    [v58 setLockAcrossReboot:1];
    [v58 setLockInhibitsEmergencyRemoval:1];
    id v11 = location;
    id location = 0;

    id v64 = location;
    uint64_t v56 = [v3 lockContentSync:@"persistently required by Trial" withUsagePolicy:v58 withTimeout:0 lockedAssetSelector:0 newerInProgress:0 error:&v64];
    objc_storeStrong(&location, v64);
    if (!v56)
    {
      log = TRILogCategory_Server();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v3;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = location;
        _os_log_error_impl(&dword_1DA291000, log, OS_LOG_TYPE_ERROR, "Could not create persistent lock for MAAutoAsset %{public}@: %{public}@", buf, 0x16u);
      }
      goto LABEL_56;
    }
    id v12 = [v3 assetSelector];
    id v13 = (id)[v57 endAllPreviousLocksOfReasonSync:@"transiently required by Trial" forClientName:*MEMORY[0x1E4FB04F0] forAssetSelector:v12];

    id v14 = objc_alloc(MEMORY[0x1E4F77FE0]);
    id v15 = [v3 assetSelector];
    id v16 = [v15 assetType];
    id v17 = [v3 assetSelector];
    v18 = [v17 assetSpecifier];
    log = [v14 initForAssetType:v16 withAssetSpecifier:v18];

    [v57 eliminatePromotedNeverLockedForSelector:log completion:&__block_literal_global_25];
    if (![(TRIAssetStoreDatabase *)v2 addReferenceToAutoAssetId:*(void *)(a1 + 40) forLifetimeOfPath:*(void *)(a1 + 48)])
    {
      v55 = TRILogCategory_Server();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        uint64_t v35 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v35;
        _os_log_error_impl(&dword_1DA291000, v55, OS_LOG_TYPE_ERROR, "Unable to add TRIAssetStoreDatabase reference for auto asset: %{public}@", buf, 0xCu);
      }
      goto LABEL_55;
    }
    if (*(unsigned char *)(a1 + 80))
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v73 = __Block_byref_object_copy__43;
      id v74 = __Block_byref_object_dispose__43;
      id v75 = 0;
      v19 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v20 = *MEMORY[0x1E4F1C670];
      uint64_t v71 = *MEMORY[0x1E4F1C670];
      id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __88__TRIAssetStoreOperator_referenceMAAutoAssetWithId_futurePath_currentPath_isFileFactor___block_invoke_327;
      v63[3] = &unk_1E6BBB998;
      v63[4] = buf;
      id v22 = [v19 enumeratorAtURL:v56 includingPropertiesForKeys:v21 options:1 errorHandler:v63];

      if (v22)
      {
        v55 = 0;
        while (1)
        {
          id v23 = (void *)MEMORY[0x1E016E7F0]();
          SEL v24 = [v22 nextObject];
          BOOL v25 = v24;
          if (!v24)
          {
            uint64_t v27 = TRILogCategory_Server();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v32 = [v56 path];
              *(_DWORD *)id v67 = 138543618;
              id v68 = v32;
              __int16 v69 = 2114;
              v70 = v3;
              _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "Factor level of File-type points to MAAutoAsset content directory \"%{public}@\" with no regular files: %{public}@", v67, 0x16u);
            }
            int v31 = 3;
            goto LABEL_30;
          }
          id v61 = 0;
          id v62 = 0;
          int v26 = [v24 getResourceValue:&v62 forKey:v20 error:&v61];
          uint64_t v27 = v62;
          id v28 = v61;
          if (v26)
          {
            if (![v27 BOOLValue])
            {
              int v31 = 2;
              goto LABEL_29;
            }
            uint64_t v29 = [v25 path];
            if (v29)
            {
              int v30 = v55;
              v55 = v29;
            }
            else
            {
              id v33 = [MEMORY[0x1E4F28B00] currentHandler];
              [v33 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 32), @"TRIAssetStoreOperator.m", 431, @"Expression was unexpectedly nil/false: %@", @"firstRegularFileURL.path" object file lineNumber description];

              int v30 = v55;
              v55 = 0;
            }
          }
          else
          {
            int v30 = TRILogCategory_Server();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)id v67 = 138543362;
              id v68 = v28;
              _os_log_error_impl(&dword_1DA291000, v30, OS_LOG_TYPE_ERROR, "Failed to determine regular file status: %{public}@", v67, 0xCu);
            }
          }

          int v31 = 3;
LABEL_29:

LABEL_30:
          if (v31 == 3) {
            goto LABEL_43;
          }
        }
      }
      __int16 v36 = TRILogCategory_Server();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v52 = *(void **)(*(void *)&buf[8] + 40);
        *(_DWORD *)id v67 = 138543362;
        id v68 = v52;
        _os_log_error_impl(&dword_1DA291000, v36, OS_LOG_TYPE_ERROR, "Unable to enumerate URL: %{public}@", v67, 0xCu);
      }

      v55 = 0;
LABEL_43:

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v55 = [v56 path];
    }
    v37 = (void *)[[NSString alloc] initWithFormat:@"%@\n", v55];
    __int16 v38 = [v37 dataUsingEncoding:4];

    uint64_t v39 = *(void *)(a1 + 56);
    id v60 = 0;
    char v40 = [v38 writeToFile:v39 options:0x10000000 error:&v60];
    id v41 = v60;
    v42 = v41;
    if (v40) {
      goto LABEL_45;
    }
    v49 = [v41 domain];
    if ([v49 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      BOOL v50 = [v42 code] == 516;

      if (v50)
      {
LABEL_45:
        v43 = TRILogCategory_Server();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v44 = *(void *)(a1 + 56);
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v44;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v55;
          _os_log_impl(&dword_1DA291000, v43, OS_LOG_TYPE_DEFAULT, "Created maRefs file at %{public}@ referencing MA asset at %{public}@", buf, 0x16u);
        }

        v45 = *(void **)(a1 + 56);
        uint64_t v46 = *(void *)(*(void *)(a1 + 64) + 8);
        id v47 = v45;
        id v48 = *(NSObject **)(v46 + 40);
        *(void *)(v46 + 40) = v47;
LABEL_54:

LABEL_55:
LABEL_56:

LABEL_57:
        goto LABEL_58;
      }
    }
    else
    {
    }
    id v48 = TRILogCategory_Server();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      uint64_t v51 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v51;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v42;
      _os_log_error_impl(&dword_1DA291000, v48, OS_LOG_TYPE_ERROR, "Failed to create file for MAAutoAsset reference at %@: %{public}@. ", buf, 0x16u);
    }
    goto LABEL_54;
  }
LABEL_58:
}

void __88__TRIAssetStoreOperator_referenceMAAutoAssetWithId_futurePath_currentPath_isFileFactor___block_invoke_325(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    BOOL v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543618;
      id v8 = v4;
      __int16 v9 = 2114;
      id v10 = v5;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Failed to eliminate pre-SU-staged MAAutoAsset %{public}@: %{public}@ ", (uint8_t *)&v7, 0x16u);
    }
  }
}

uint64_t __88__TRIAssetStoreOperator_referenceMAAutoAssetWithId_futurePath_currentPath_isFileFactor___block_invoke_327(uint64_t a1, int a2, id obj)
{
  return 1;
}

- (BOOL)collectGarbageOlderThanNumScans:(unsigned int)a3 deletedAssetSize:(unint64_t *)a4 ignoreRecentlyCreatedAssets:(BOOL)a5 dryRun:(BOOL)a6 includedCacheDeletableAssetIds:(id)a7 deletedAssetIds:(id *)a8
{
  id v14 = a7;
  if (a4) {
    *a4 = 0;
  }
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __156__TRIAssetStoreOperator_collectGarbageOlderThanNumScans_deletedAssetSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke;
  v18[3] = &unk_1E6BBD660;
  uint64_t v20 = &v26;
  id v21 = a4;
  v18[4] = self;
  unsigned int v23 = a3;
  BOOL v24 = a5;
  BOOL v25 = a6;
  id v15 = v14;
  id v19 = v15;
  id v22 = a8;
  [(TRIAssetStoreOperator *)self _acquireLockfileAndRunBlock:v18];
  char v16 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __156__TRIAssetStoreOperator_collectGarbageOlderThanNumScans_deletedAssetSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v20 = 0;
  char v4 = [*(id *)(a1 + 32) _removeDeadSymlinksWithFlockWitness:a2 numRemoved:&v20];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v5 + 24)) {
    char v6 = v4;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)(v5 + 24) = v6;
  int v7 = TRILogCategory_Server();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(*(void *)(a1 + 32) + 8) assetStore];
    *(_DWORD *)buf = 138543618;
    id v22 = v8;
    __int16 v23 = 1024;
    int v24 = v20;
    _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "Garbage collection for asset store %{public}@ removed %u dead symlinks.", buf, 0x12u);
  }
  int v20 = 0;
  char v9 = [*(id *)(a1 + 32) _removeUnreferencedAssetsWithFlockWitness:a2 olderThanAge:*(unsigned int *)(a1 + 72) numRemoved:&v20 deletedAssetsSize:*(void *)(a1 + 56) ignoreRecentlyCreatedAssets:*(unsigned __int8 *)(a1 + 76) dryRun:*(unsigned __int8 *)(a1 + 77) includedCacheDeletableAssetIds:*(void *)(a1 + 40) deletedAssetIds:*(void *)(a1 + 64)];
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v10 + 24)) {
    char v11 = v9;
  }
  else {
    char v11 = 0;
  }
  *(unsigned char *)(v10 + 24) = v11;
  id v12 = TRILogCategory_Server();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [*(id *)(*(void *)(a1 + 32) + 8) assetStore];
    *(_DWORD *)buf = 138543618;
    id v22 = v13;
    __int16 v23 = 1024;
    int v24 = v20;
    _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, "Garbage collection for asset store %{public}@ removed %u assets.", buf, 0x12u);
  }
  id v14 = [[TRIAssetStoreDatabase alloc] initWithPaths:*(void *)(*(void *)(a1 + 32) + 8) storageManagement:*(void *)(*(void *)(a1 + 32) + 16)];
  id v15 = v14;
  if (v14)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __156__TRIAssetStoreOperator_collectGarbageOlderThanNumScans_deletedAssetSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke_334;
    v18[3] = &__block_descriptor_41_e34_v32__0__TRIFullMAAssetId_8_B16_B24l;
    v18[4] = *(void *)(a1 + 56);
    char v19 = *(unsigned char *)(a1 + 77);
    [(TRIAssetStoreDatabase *)v14 enumerateAssetIdsWithoutLiveReferencesUsingBlock:v18];
    if (!*(unsigned char *)(a1 + 77))
    {
      char v16 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v17 = [*(id *)(a1 + 32) _requireAssetStoreTempDir];
      [v16 removeItemAtPath:v17 error:0];
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void __156__TRIAssetStoreOperator_collectGarbageOlderThanNumScans_deletedAssetSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke_334(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  char v6 = objc_opt_new();
  int v7 = [v6 createAutoAssetWithId:v5 decryptionKey:0 error:0];
  id v17 = 0;
  id v8 = [v7 currentAssetSizeOnDiskUsingStatus:&v17];
  id v9 = v17;
  if ([v8 longLongValue] < 1)
  {
    uint64_t v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v19 = v5;
      __int16 v20 = 2114;
      id v21 = v9;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Failed to get MA asset size for %{public}@ garbage collection: %{public}@", buf, 0x16u);
    }
  }
  else if (*(void *)(a1 + 32))
  {
    **(void **)(a1 + 32) += [v8 longLongValue];
  }
  int v11 = *(unsigned __int8 *)(a1 + 40);
  id v12 = TRILogCategory_Server();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v5;
      _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, "(Dry-run) Removing MAAutoAsset: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v7;
      _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, "Removing MAAutoAsset: %{public}@", buf, 0xCu);
    }

    *a3 = 1;
    id v14 = [v7 assetSelector];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __156__TRIAssetStoreOperator_collectGarbageOlderThanNumScans_deletedAssetSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke_335;
    v15[3] = &unk_1E6BB9900;
    char v16 = v7;
    [v6 eliminateAllForSelector:v14 completion:v15];

    id v12 = v16;
  }
}

void __156__TRIAssetStoreOperator_collectGarbageOlderThanNumScans_deletedAssetSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke_335(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TRILogCategory_Server();
  char v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Failed to eliminate MAAutoAsset %{public}@: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "Eliminated MAAutoAsset: %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

- (BOOL)_incrementUnrefAgeForAssetWithIdentifier:(id)a3 newValue:(unsigned int *)a4 dryRun:(BOOL)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  __int16 v11 = WeakRetained;
  if (WeakRetained)
  {
    id v12 = [WeakRetained pathForAssetDirWithIdentifier:v9];
    uint64_t v13 = [v12 stringByAppendingPathComponent:@"unref-age"];

    id v38 = 0;
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v13 options:0 error:&v38];
    id v15 = v38;
    char v16 = v15;
    if (v14)
    {
      uint64_t v17 = [[NSString alloc] initWithData:v14 encoding:4];
      if (v17)
      {
        v18 = v17;
        SEL v35 = a2;
        id v19 = v16;
        unint64_t v37 = -1;
        if (![MEMORY[0x1E4FB0198] convertFromString:v17 usingBase:10 toI64:&v37]
          || (int v20 = v37, HIDWORD(v37)))
        {
          uint64_t v25 = TRILogCategory_Server();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            char v40 = v18;
            _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "Failed to decode unref-age content: \"%{public}@\"", buf, 0xCu);
          }

          BOOL v22 = 0;
LABEL_32:
          char v16 = v19;
          goto LABEL_36;
        }

        unsigned int v21 = v20 + 1;
        if (v20 == -1) {
          unsigned int v21 = -1;
        }
        char v16 = v19;
LABEL_22:
        *a4 = v21;
        if (a5)
        {
          BOOL v22 = 1;
LABEL_37:

          goto LABEL_38;
        }
        v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"%u\n", *a4);
        char v29 = [v18 dataUsingEncoding:4];

        if (!v29)
        {
          [MEMORY[0x1E4F28B00] currentHandler];
          v34 = id v33 = v16;
          [v34 handleFailureInMethod:v35, self, @"TRIAssetStoreOperator.m", 616, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];

          char v16 = v33;
        }

        id v36 = 0;
        char v30 = [v29 writeToFile:v13 options:0x10000000 error:&v36];
        id v19 = v36;
        if ((v30 & 1) == 0)
        {
          int v31 = TRILogCategory_Server();
          char v16 = v19;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            char v40 = v19;
            _os_log_error_impl(&dword_1DA291000, v31, OS_LOG_TYPE_ERROR, "Failed to update content of unref-age: %{public}@", buf, 0xCu);
          }

          BOOL v22 = 0;
          id v14 = v29;
          goto LABEL_36;
        }
        BOOL v22 = 1;
        id v14 = v29;
        goto LABEL_32;
      }
      v18 = TRILogCategory_Server();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Failed to read non-UTF-8 unref-age.", buf, 2u);
      }
    }
    else
    {
      __int16 v23 = [v15 domain];
      int v24 = v23;
      if (v23 == (void *)*MEMORY[0x1E4F281F8])
      {
        SEL v35 = a2;
        uint64_t v26 = v16;
        uint64_t v27 = [v16 code];

        BOOL v28 = v27 == 260;
        char v16 = v26;
        if (v28)
        {
          unsigned int v21 = 1;
          goto LABEL_22;
        }
      }
      else
      {
      }
      v18 = TRILogCategory_Server();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        char v40 = v16;
        _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Failed to read content of unref-age: %{public}@", buf, 0xCu);
      }
      id v14 = 0;
    }
    BOOL v22 = 0;
LABEL_36:

    goto LABEL_37;
  }
  uint64_t v13 = TRILogCategory_Server();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Asset store unexpectedly released from asset store operator.", buf, 2u);
  }
  BOOL v22 = 0;
LABEL_38:

  return v22;
}

- (BOOL)_clearUnrefAgeForAssetWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  char v6 = WeakRetained;
  if (!WeakRetained)
  {
    id v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Asset store unexpectedly released from asset store operator.", (uint8_t *)&v16, 2u);
    }
    goto LABEL_10;
  }
  uint64_t v7 = [WeakRetained pathForAssetDirWithIdentifier:v4];
  uint64_t v8 = [v7 stringByAppendingPathComponent:@"unref-age"];

  id v9 = v8;
  if (unlink((const char *)[v9 fileSystemRepresentation]) && *__error() != 2)
  {
    __int16 v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = __error();
      id v14 = strerror(*v13);
      int v15 = *__error();
      int v16 = 136315394;
      uint64_t v17 = v14;
      __int16 v18 = 1024;
      int v19 = v15;
      _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Failed to unlink() unref-age: %s (%d)", (uint8_t *)&v16, 0x12u);
    }

LABEL_10:
    BOOL v10 = 0;
    goto LABEL_11;
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (id)_collectDeadSymlinks
{
  id v4 = (void *)MEMORY[0x1E016E7F0]();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  if (WeakRetained)
  {
    *(void *)buf = 0;
    uint64_t v17 = buf;
    uint64_t v18 = 0x3032000000;
    int v19 = __Block_byref_object_copy__43;
    uint64_t v20 = __Block_byref_object_dispose__43;
    id v21 = (id)objc_opt_new();
    if (*((void *)v17 + 5))
    {
      v14[0] = 0;
      v14[1] = v14;
      v14[2] = 0x2020000000;
      char v15 = 0;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __45__TRIAssetStoreOperator__collectDeadSymlinks__block_invoke;
      v9[3] = &unk_1E6BBD688;
      SEL v13 = a2;
      v9[4] = self;
      __int16 v11 = v14;
      id v10 = WeakRetained;
      id v12 = buf;
      [v10 enumerateAssetDirsUsingBlock:v9];
      id v6 = *((id *)v17 + 5);

      _Block_object_dispose(v14, 8);
    }
    else
    {
      id v6 = 0;
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Asset store unexpectedly released from asset store operator.", buf, 2u);
    }

    id v6 = 0;
  }

  return v6;
}

void __45__TRIAssetStoreOperator__collectDeadSymlinks__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 lastPathComponent];
  if (!v6)
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"TRIAssetStoreOperator.m", 673, @"Invalid parameter not satisfying: %@", @"assetIdentifier" object file lineNumber description];
  }
  uint64_t v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"refs" relativeToURL:v5];
  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = [v7 path];
  if (!v9)
  {
    uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"TRIAssetStoreOperator.m", 677, @"Expression was unexpectedly nil/false: %@", @"refsURL.path" object file lineNumber description];
  }
  if ([v8 fileExistsAtPath:v9])
  {

    goto LABEL_13;
  }
  unsigned int v10 = [*(id *)(a1 + 32) _hardLinkCountForAssetWithIdentifier:v6];

  if (v10 >= 2)
  {
    int v11 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    id v12 = TRILogCategory_Server();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (v11)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138543362;
        BOOL v28 = v6;
LABEL_26:
        _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Asset %{public}@ has other hard link references but no refs folder", buf, 0xCu);
      }
    }
    else if (v13)
    {
      *(_DWORD *)buf = 138543362;
      BOOL v28 = v6;
      goto LABEL_26;
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
LABEL_13:
  id v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v15 = [v14 enumeratorAtURL:v7 includingPropertiesForKeys:0 options:1 errorHandler:0];

  int v16 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v17 = [v15 nextObject];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    do
    {
      int v19 = [v18 lastPathComponent];
      int v20 = [v19 hasPrefix:@"link-"];

      if (v20)
      {
        id v21 = [v18 path];
        if (!v21)
        {
          BOOL v22 = [MEMORY[0x1E4F28B00] currentHandler];
          [v22 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"TRIAssetStoreOperator.m", 696, @"Invalid parameter not satisfying: %@", @"symlinkPath" object file lineNumber description];
        }
        if (([*(id *)(a1 + 40) isValidTargetForSymlink:v21 assetIdentifier:v6] & 1) == 0
          && ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addString:v21] & 1) == 0)
        {
          uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
          int v24 = *(void **)(v23 + 40);
          *(void *)(v23 + 40) = 0;

          *a3 = 1;
          break;
        }
      }
      int v16 = (void *)MEMORY[0x1E016E7F0]();
      uint64_t v18 = [v15 nextObject];
    }
    while (v18);
  }
}

- (unsigned)_hardLinkCountForAssetWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    char v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"TRIAssetStoreOperator.m", 714, @"Invalid parameter not satisfying: %@", @"assetIdentifier" object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = [WeakRetained pathForAssetContentWithIdentifier:v5];
    char v16 = 0;
    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v10 = [v9 fileExistsAtPath:v8 isDirectory:&v16];

    unsigned __int16 v11 = 0;
    if (v10)
    {
      if (v16)
      {
        id v12 = [MEMORY[0x1E4F28CB8] triArbitraryFileInDirWithPath:v8];
      }
      else
      {
        id v12 = v8;
      }
      BOOL v13 = v12;
      if (v12) {
        unsigned __int16 v11 = [(TRIAssetStoreOperator *)self _hardLinkCountForFileWithPath:v12];
      }
      else {
        unsigned __int16 v11 = 0;
      }
    }
  }
  else
  {
    uint64_t v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Asset store unexpectedly released from asset store operator.", buf, 2u);
    }
    unsigned __int16 v11 = 0;
  }

  return v11;
}

- (unsigned)_hardLinkCountForFileWithPath:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  memset(&v10, 0, sizeof(v10));
  id v3 = a3;
  if (stat((const char *)objc_msgSend(v3, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                         0,
                         0),
         &v10))
  {
    id v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = __error();
      uint64_t v8 = strerror(*v7);
      int v9 = *__error();
      *(_DWORD *)buf = 138543874;
      id v12 = v3;
      __int16 v13 = 2080;
      id v14 = v8;
      __int16 v15 = 1024;
      int v16 = v9;
      _os_log_error_impl(&dword_1DA291000, v4, OS_LOG_TYPE_ERROR, "Failed to stat file at path %{public}@ to find hard link count: %s (%d)", buf, 0x1Cu);
    }

    nlink_t st_nlink = 0;
  }
  else
  {
    nlink_t st_nlink = v10.st_nlink;
  }

  return st_nlink;
}

- (BOOL)_removeDeadSymlinksWithFlockWitness:(TRIFlockWitness_ *)a3 numRemoved:(unsigned int *)a4
{
  id v6 = [(TRIAssetStoreOperator *)self _collectDeadSymlinks];
  if (v6) {
    BOOL v7 = [(TRIAssetStoreOperator *)self _removePaths:v6 numRemoved:a4];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_collectUnreferencedAssetsIncludingLinkTargetsForReferencedAssetIds:(id)a3 ignoreRecentlyCreatedAssets:(BOOL)a4
{
  id v7 = a3;
  uint64_t v8 = (void *)MEMORY[0x1E016E7F0]();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  if (WeakRetained)
  {
    *(void *)buf = 0;
    int v19 = buf;
    uint64_t v20 = 0x3032000000;
    id v21 = __Block_byref_object_copy__43;
    BOOL v22 = __Block_byref_object_dispose__43;
    id v23 = (id)objc_opt_new();
    if (*((void *)v19 + 5))
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __121__TRIAssetStoreOperator__collectUnreferencedAssetsIncludingLinkTargetsForReferencedAssetIds_ignoreRecentlyCreatedAssets___block_invoke;
      v13[3] = &unk_1E6BBD6B0;
      SEL v16 = a2;
      v13[4] = self;
      BOOL v17 = a4;
      id v14 = v7;
      __int16 v15 = buf;
      [WeakRetained enumerateAssetDirsUsingBlock:v13];
      id v10 = *((id *)v19 + 5);
    }
    else
    {
      id v10 = 0;
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    unsigned __int16 v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Asset store unexpectedly released from asset store operator.", buf, 2u);
    }

    id v10 = 0;
  }

  return v10;
}

void __121__TRIAssetStoreOperator__collectUnreferencedAssetsIncludingLinkTargetsForReferencedAssetIds_ignoreRecentlyCreatedAssets___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  SEL v35 = [v4 lastPathComponent];
  if (!v35)
  {
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"TRIAssetStoreOperator.m", 782, @"Invalid parameter not satisfying: %@", @"assetIdentifier" object file lineNumber description];
  }
  uint64_t v34 = v4;
  uint64_t v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"refs" relativeToURL:v4];
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v33 = (void *)v5;
  id v7 = [v6 enumeratorAtURL:v5 includingPropertiesForKeys:0 options:1 errorHandler:0];

  char v8 = 0;
  while (1)
  {
    int v9 = (void *)MEMORY[0x1E016E7F0]();
    id v10 = [v7 nextObject];
    if (!v10) {
      break;
    }
    unsigned __int16 v11 = v10;
    if (!*(void *)(a1 + 40))
    {

      uint64_t v20 = v33;
      int v19 = v34;
      goto LABEL_26;
    }
    id v12 = [v10 path];
    if (!v12)
    {
      uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"TRIAssetStoreOperator.m", 802, @"Invalid parameter not satisfying: %@", @"refPath" object file lineNumber description];
    }
    __int16 v13 = [MEMORY[0x1E4F28CB8] triTargetPathForSymlink:v12];
    if (v13)
    {
      [*(id *)(a1 + 40) objectForKeyedSubscript:v35];
      __int16 v15 = v14 = v7;
      char v16 = [v15 containsObject:v13];
      char v17 = v16 ^ 1;

      id v7 = v14;
    }
    else
    {
      char v17 = 0;
      char v16 = 1;
    }
    v8 |= v17;

    if ((v16 & 1) == 0) {
      goto LABEL_14;
    }
  }
LABEL_14:
  uint64_t v20 = v33;
  int v19 = v34;
  if (v8) {
    goto LABEL_26;
  }
  if (!*(unsigned char *)(a1 + 64)) {
    goto LABEL_23;
  }
  id v21 = *(void **)(a1 + 32);
  BOOL v22 = [v34 path];
  if (!v22)
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v31 = char v30 = v7;
    [v31 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"TRIAssetStoreOperator.m", 818, @"Expression was unexpectedly nil/false: %@", @"assetIdentifierURL.path" object file lineNumber description];

    id v7 = v30;
  }
  id v23 = [v21 _creationDateForAsset:v22];

  if (!v23 || ([v23 timeIntervalSinceNow], fabs(v24) >= 600.0))
  {
    uint64_t v25 = TRILogCategory_Server();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      unint64_t v37 = v34;
      __int16 v38 = 2112;
      uint64_t v39 = v23;
      _os_log_impl(&dword_1DA291000, v25, OS_LOG_TYPE_INFO, "Including asset directory %{public}@ for GC (created %@)", buf, 0x16u);
    }

LABEL_23:
    if (([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addString:v35] & 1) == 0)
    {
      uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = 0;

      *a3 = 1;
    }
    goto LABEL_26;
  }
  BOOL v28 = TRILogCategory_Server();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    unint64_t v37 = v34;
    __int16 v38 = 2112;
    uint64_t v39 = v23;
    _os_log_impl(&dword_1DA291000, v28, OS_LOG_TYPE_INFO, "Not including asset directory %{public}@ for GC because it's too new (created %@)", buf, 0x16u);
  }

LABEL_26:
}

- (id)_creationDateForAsset:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = 0;
  uint64_t v5 = [v4 attributesOfItemAtPath:v3 error:&v12];
  id v6 = v12;

  if (v5)
  {
    id v7 = [v5 fileCreationDate];
    if (v7)
    {
      char v8 = v7;
      int v9 = v8;
      goto LABEL_10;
    }
    id v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v5;
      __int16 v15 = 2114;
      id v16 = v3;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Couldn't get creation date from file attributes %@ for %{public}@", buf, 0x16u);
    }

    char v8 = 0;
  }
  else
  {
    char v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v14 = v3;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Couldn't read file attributes for %{public}@: %{public}@", buf, 0x16u);
    }
  }
  int v9 = 0;
LABEL_10:

  return v9;
}

- (BOOL)_removeUnreferencedAssetsWithFlockWitness:(TRIFlockWitness_ *)a3 olderThanAge:(unsigned int)a4 numRemoved:(unsigned int *)a5 deletedAssetsSize:(unint64_t *)a6 ignoreRecentlyCreatedAssets:(BOOL)a7 dryRun:(BOOL)a8 includedCacheDeletableAssetIds:(id)a9 deletedAssetIds:(id *)a10
{
  BOOL v11 = a7;
  id v17 = a9;
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  uint64_t v18 = [(TRIAssetStoreOperator *)self _collectUnreferencedAssetsIncludingLinkTargetsForReferencedAssetIds:v17 ignoreRecentlyCreatedAssets:v11];
  int v19 = v18;
  if (v18)
  {
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 1;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __191__TRIAssetStoreOperator__removeUnreferencedAssetsWithFlockWitness_olderThanAge_numRemoved_deletedAssetsSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke;
    v22[3] = &unk_1E6BBD6D8;
    v22[4] = self;
    v22[5] = &v25;
    BOOL v24 = a8;
    unsigned int v23 = a4;
    v22[6] = a3;
    v22[7] = a5;
    v22[8] = a6;
    v22[9] = a10;
    if ([v18 enumerateStringsWithBlock:v22]) {
      BOOL v20 = *((unsigned char *)v26 + 24) != 0;
    }
    else {
      BOOL v20 = 0;
    }
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

void __191__TRIAssetStoreOperator__removeUnreferencedAssetsWithFlockWitness_olderThanAge_numRemoved_deletedAssetsSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = TRIValidateAssetId();
  if (!v2) {
    goto LABEL_14;
  }
  int v13 = 0;
  if ([*(id *)(a1 + 32) _incrementUnrefAgeForAssetWithIdentifier:v2 newValue:&v13 dryRun:*(unsigned __int8 *)(a1 + 84)])
  {
    unsigned int v3 = v13;
  }
  else
  {
    unsigned int v3 = -1;
    int v13 = -1;
  }
  if (v3 > *(_DWORD *)(a1 + 80))
  {
    *(void *)buf = 0;
    if ([*(id *)(a1 + 32) _removeAssetWithIdentifier:v2 flockWitness:*(void *)(a1 + 48) deletedAssetSize:buf dryRun:*(unsigned __int8 *)(a1 + 84)])
    {
      id v4 = *(_DWORD **)(a1 + 56);
      if (v4) {
        ++*v4;
      }
      uint64_t v5 = *(void **)(a1 + 64);
      if (v5) {
        *v5 += *(void *)buf;
      }
      id v6 = *(id **)(a1 + 72);
      if (v6)
      {
        if (*v6)
        {
          id v7 = *v6;
          id v8 = *v6;
          *id v6 = v7;
        }
        else
        {
          uint64_t v11 = objc_opt_new();
          id v12 = *(id **)(a1 + 72);
          id v8 = *v12;
          id *v12 = (id)v11;
        }

        [**(id **)(a1 + 72) addObject:v2];
      }
      goto LABEL_20;
    }
LABEL_14:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_20;
  }
  int v9 = TRILogCategory_Server();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *(_DWORD *)(a1 + 80) + 1;
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v2;
    __int16 v15 = 1024;
    int v16 = v13;
    __int16 v17 = 1024;
    int v18 = v10;
    _os_log_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEFAULT, "Asset %{public}@ has been unreferenced for %u sequential scans, has not yet reached threshold of %u.", buf, 0x18u);
  }

LABEL_20:
}

- (BOOL)_removePaths:(id)a3 numRemoved:(unsigned int *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4) {
    *a4 = 0;
  }
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__TRIAssetStoreOperator__removePaths_numRemoved___block_invoke;
  v9[3] = &unk_1E6BBD338;
  v9[4] = &v10;
  void v9[5] = a4;
  if ([v5 enumerateStringsWithBlock:v9]) {
    BOOL v7 = *((unsigned char *)v11 + 24) != 0;
  }
  else {
    BOOL v7 = 0;
  }
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __49__TRIAssetStoreOperator__removePaths_numRemoved___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 length])
  {
    id v4 = v3;
    if (unlink((const char *)[v4 fileSystemRepresentation]))
    {
      id v5 = TRILogCategory_Server();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        BOOL v7 = __error();
        id v8 = strerror(*v7);
        int v9 = *__error();
        int v10 = 138543874;
        id v11 = v4;
        __int16 v12 = 2080;
        char v13 = v8;
        __int16 v14 = 1024;
        int v15 = v9;
        _os_log_error_impl(&dword_1DA291000, v5, OS_LOG_TYPE_ERROR, "Failed to unlink %{public}@: %s (%d)", (uint8_t *)&v10, 0x1Cu);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    }
    else
    {
      id v6 = *(_DWORD **)(a1 + 40);
      if (v6) {
        ++*v6;
      }
    }
  }
}

- (BOOL)migrateToGlobalAssetStoreFromLocalAssetStore:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__TRIAssetStoreOperator_migrateToGlobalAssetStoreFromLocalAssetStore___block_invoke;
  v7[3] = &unk_1E6BBD5D0;
  int v9 = &v10;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  [(TRIAssetStoreOperator *)self _acquireLockfileInAssetStorePath:v5 andRunBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __70__TRIAssetStoreOperator_migrateToGlobalAssetStoreFromLocalAssetStore___block_invoke(uint64_t a1, uint64_t a2)
{
  char v4 = [*(id *)(a1 + 32) _migrateAssetsDatabaseWithLocalAssetStorePath:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v5 + 24)) {
    char v6 = v4;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)(v5 + 24) = v6;
  char v7 = [*(id *)(a1 + 32) _migrateAssetContentsWithLocalAssetStorePath:*(void *)(a1 + 40) flockWitness:a2];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v8 + 24)) {
    char v9 = v7;
  }
  else {
    char v9 = 0;
  }
  *(unsigned char *)(v8 + 24) = v9;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEFAULT, "Successfully migrated assets to the global asset store", v11, 2u);
    }
  }
}

- (BOOL)_migrateAssetsDatabaseWithLocalAssetStorePath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[TRIAssetStoreDatabase alloc] initWithPaths:self->_paths assetStorePath:v4 storageManagement:0];

  char v6 = [[TRIAssetStoreDatabase alloc] initWithPaths:self->_paths storageManagement:self->_storageManagement];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__TRIAssetStoreOperator__migrateAssetsDatabaseWithLocalAssetStorePath___block_invoke;
  v9[3] = &unk_1E6BBD700;
  uint64_t v10 = v6;
  char v7 = v6;
  LOBYTE(v4) = [(TRIAssetStoreDatabase *)v5 enumerateAllAutoAssetReferencesWithBlock:v9];
  [(TRIAssetStoreDatabase *)v5 closePermanently];
  [(TRIAssetStoreDatabase *)v7 closePermanently];

  return (char)v4;
}

uint64_t __71__TRIAssetStoreOperator__migrateAssetsDatabaseWithLocalAssetStorePath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addReferenceToAutoAssetId:a2 forLifetimeOfPath:a3];
}

- (BOOL)_migrateAssetContentsWithLocalAssetStorePath:(id)a3 flockWitness:(TRIFlockWitness_ *)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 1;
  uint64_t v5 = [(TRIPaths *)self->_paths assetStore];
  uint64_t v39 = [v5 stringByAppendingPathComponent:@"assets"];

  __int16 v38 = [v37 stringByAppendingPathComponent:@"assets"];
  char v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v7 = [v6 fileExistsAtPath:v39];

  if (v7)
  {
    uint64_t v8 = [[TRIAssetStore alloc] initWithGlobalPaths:self->_paths];
    char v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v38];
    id v11 = [v9 enumeratorAtURL:v10 includingPropertiesForKeys:0 options:1 errorHandler:0];

    do
    {
      uint64_t v12 = (void *)MEMORY[0x1E016E7F0]();
      char v13 = [v11 nextObject];
      __int16 v14 = v13;
      if (v13)
      {
        int v15 = [v13 lastPathComponent];
        if (v15)
        {
          uint64_t v16 = [v14 path];
          if (v16)
          {
            __int16 v17 = [MEMORY[0x1E4FB0160] arrayFromDirectory:v16];
            if (v17)
            {
              v40[0] = MEMORY[0x1E4F143A8];
              v40[1] = 3221225472;
              v40[2] = __83__TRIAssetStoreOperator__migrateAssetContentsWithLocalAssetStorePath_flockWitness___block_invoke;
              v40[3] = &unk_1E6BBD728;
              uint64_t v41 = v39;
              id v42 = v15;
              int v18 = v8;
              uint64_t v44 = self;
              v45 = &v48;
              v43 = v18;
              char v19 = [v17 enumerateStringsWithBlock:v40];
              if (*((unsigned char *)v49 + 24)) {
                char v20 = v19;
              }
              else {
                char v20 = 0;
              }
              *((unsigned char *)v49 + 24) = v20;

              int v21 = 0;
              BOOL v22 = v41;
            }
            else
            {
              BOOL v22 = TRILogCategory_Server();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                dev_t v53 = v15;
                _os_log_error_impl(&dword_1DA291000, v22, OS_LOG_TYPE_ERROR, "Couldn't locate asset folders for short hash: %@", buf, 0xCu);
              }
              int v21 = 3;
            }
          }
          else
          {
            __int16 v17 = TRILogCategory_Server();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              dev_t v53 = v14;
              _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "Local asset url and hash is non-nil but the path is nil: %{public}@", buf, 0xCu);
            }
            int v21 = 3;
          }
        }
        else
        {
          uint64_t v16 = TRILogCategory_Server();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            unsigned int v23 = [v14 path];
            *(_DWORD *)buf = 138543362;
            dev_t v53 = v23;
            _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "Invalid short hash found in local asset store url: %{public}@", buf, 0xCu);
          }
          int v21 = 3;
        }
      }
      else
      {
        int v21 = 2;
      }
    }
    while (v21 != 2);
    int v32 = *((unsigned __int8 *)v49 + 24);
  }
  else
  {
    BOOL v24 = TRILogCategory_Server();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      dev_t v53 = v39;
      _os_log_impl(&dword_1DA291000, v24, OS_LOG_TYPE_INFO, "No global assets folder exists at %@. Copying the entirety of the local assets folder.", buf, 0xCu);
    }

    uint64_t v25 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v26 = [v39 stringByDeletingLastPathComponent];
    id v47 = 0;
    char v27 = [v25 createDirectoryAtPath:v26 withIntermediateDirectories:1 attributes:0 error:&v47];
    id v28 = v47;

    if ((v27 & 1) == 0)
    {
      uint64_t v29 = TRILogCategory_Server();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        SEL v35 = [v28 localizedDescription];
        *(_DWORD *)buf = 138543618;
        dev_t v53 = v39;
        __int16 v54 = 2112;
        v55 = v35;
        _os_log_error_impl(&dword_1DA291000, v29, OS_LOG_TYPE_ERROR, "Failed to create global assets folder: %{public}@ with error:%@", buf, 0x16u);
      }
      *((unsigned char *)v49 + 24) = 0;
    }
    char v30 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v46 = v28;
    int v31 = [v30 moveItemAtPath:v38 toPath:v39 error:&v46];
    uint64_t v8 = (TRIAssetStore *)v46;

    if (v31)
    {
      int v32 = *((unsigned __int8 *)v49 + 24);
    }
    else
    {
      id v33 = TRILogCategory_Server();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        id v36 = [(TRIAssetStore *)v8 localizedDescription];
        *(_DWORD *)buf = 138543874;
        dev_t v53 = v38;
        __int16 v54 = 2114;
        v55 = v39;
        __int16 v56 = 2112;
        v57 = v36;
        _os_log_error_impl(&dword_1DA291000, v33, OS_LOG_TYPE_ERROR, "Failed to move local assets folder to the global assets folder: %{public}@ to %{public}@ with error:%@", buf, 0x20u);
      }
      int v32 = 0;
      *((unsigned char *)v49 + 24) = 0;
    }
  }

  _Block_object_dispose(&v48, 8);
  return v32 != 0;
}

void __83__TRIAssetStoreOperator__migrateAssetContentsWithLocalAssetStorePath_flockWitness___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 lastPathComponent];
  uint64_t v5 = TRIValidateAssetId();

  if (v5 && [v5 length])
  {
    char v6 = (void *)MEMORY[0x1E016E7F0]();
    char v7 = *(void **)(a1 + 32);
    uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"%@/%@/", *(void *)(a1 + 40), v5];
    char v9 = [v7 stringByAppendingPathComponent:v8];

    LODWORD(v8) = [*(id *)(a1 + 48) hasAssetWithIdentifier:v5 type:0];
    uint64_t v10 = TRILogCategory_Server();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138543362;
        unsigned int v23 = v5;
        _os_log_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEFAULT, "Asset already present in the global asset store. Updating references - AssetId: %{public}@", buf, 0xCu);
      }

      char v12 = [*(id *)(a1 + 56) _relinkLocalAssetToGlobalAssetStore:*(void *)(a1 + 48) withAssetId:v5 localAssetDir:v3];
      uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
      if (*(unsigned char *)(v13 + 24)) {
        char v14 = v12;
      }
      else {
        char v14 = 0;
      }
      *(unsigned char *)(v13 + 24) = v14;
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138543362;
        unsigned int v23 = v5;
        _os_log_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEFAULT, "Asset not present in the global asset store. Migrating asset to the global store - AssetId: %{public}@", buf, 0xCu);
      }

      int v15 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v16 = [v9 stringByDeletingLastPathComponent];
      id v21 = 0;
      char v17 = [v15 createDirectoryAtPath:v16 withIntermediateDirectories:1 attributes:0 error:&v21];
      id v18 = v21;

      if ((v17 & 1) == 0)
      {
        char v19 = TRILogCategory_Server();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          char v20 = [v18 localizedDescription];
          *(_DWORD *)buf = 138543618;
          unsigned int v23 = v9;
          __int16 v24 = 2112;
          uint64_t v25 = v20;
          _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "Failed to create asset directory in global asset store: %{public}@ with error:%@", buf, 0x16u);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      }
      if (([MEMORY[0x1E4F28CB8] triForceRenameWithSourcePath:v3 destPath:v9] & 1) == 0) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      }
    }
  }
  else
  {
    char v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      unsigned int v23 = v3;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Invalid asset Id in local asset store: %{public}@", buf, 0xCu);
    }
  }
}

- (BOOL)_relinkLocalAssetToGlobalAssetStore:(id)a3 withAssetId:(id)a4 localAssetDir:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v9 = a4;
  id v29 = a5;
  id v28 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:");
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:relativeToURL:", @"refs");
  BOOL v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v12 = 1;
  char v27 = (void *)v10;
  uint64_t v13 = [v11 enumeratorAtURL:v10 includingPropertiesForKeys:0 options:1 errorHandler:0];

  char v14 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v15 = [v13 nextObject];
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    SEL v26 = a2;
    char v12 = 1;
    do
    {
      char v17 = [v16 lastPathComponent];
      int v18 = [v17 hasPrefix:@"link-"];

      if (v18)
      {
        char v19 = [v16 path];
        if (!v19)
        {
          BOOL v22 = [MEMORY[0x1E4F28B00] currentHandler];
          [v22 handleFailureInMethod:v26, self, @"TRIAssetStoreOperator.m", 1112, @"Invalid parameter not satisfying: %@", @"symlinkPath" object file lineNumber description];
        }
        char v20 = [MEMORY[0x1E4F28CB8] triTargetPathForSymlink:v19];
        if (!v20 || ([v30 linkAssetWithIdentifier:v9 toPath:v20] & 1) == 0)
        {
          id v21 = TRILogCategory_Server();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v32 = v20;
            _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "Failed to link from the global asset store to local treatment asset: %{public}@", buf, 0xCu);
          }

          char v12 = 0;
        }
      }
      char v14 = (void *)MEMORY[0x1E016E7F0]();
      uint64_t v16 = [v13 nextObject];
    }
    while (v16);
  }
  unsigned int v23 = TRILogCategory_Server();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    __int16 v24 = @"failed";
    if (v12) {
      __int16 v24 = @"completed successfully";
    }
    *(_DWORD *)buf = 138543618;
    id v32 = v9;
    __int16 v33 = 2112;
    uint64_t v34 = v24;
    _os_log_impl(&dword_1DA291000, v23, OS_LOG_TYPE_INFO, "Re-linking references to asset id %{public}@ to the global directory %@.", buf, 0x16u);
  }

  return v12 & 1;
}

- (BOOL)_acquireLockfileAndRunBlock:(id)a3
{
  id v3 = self;
  paths = self->_paths;
  id v5 = a3;
  char v6 = [(TRIPaths *)paths assetStore];
  LOBYTE(v3) = [(TRIAssetStoreOperator *)v3 _acquireLockfileInAssetStorePath:v6 andRunBlock:v5];

  return (char)v3;
}

- (BOOL)_acquireLockfileInAssetStorePath:(id)a3 andRunBlock:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = (void (**)(id, uint8_t *))a4;
  char v7 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v30 = 0;
  char v9 = [v8 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v30];
  id v10 = v30;

  if ((v9 & 1) == 0)
  {
    BOOL v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v32 = v10;
      _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Failed to create AssetStore: %{public}@", buf, 0xCu);
    }
  }
  id v12 = [v5 stringByAppendingPathComponent:@"lock"];
  int v13 = open((const char *)[v12 fileSystemRepresentation], 514, 432);
  int v14 = v13;
  if (v13 < 0)
  {
    char v17 = TRILogCategory_Server();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = __error();
      uint64_t v25 = strerror(*v24);
      int v26 = *__error();
      *(_DWORD *)buf = 138543874;
      id v32 = v12;
      __int16 v33 = 2080;
      uint64_t v34 = v25;
      __int16 v35 = 1024;
      int v36 = v26;
      _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "Failed to open lockfile %{public}@: %s (%d)", buf, 0x1Cu);
    }

    char v16 = 0;
  }
  else
  {
    if (flock(v13, 2))
    {
      uint64_t v15 = TRILogCategory_Server();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v21 = __error();
        BOOL v22 = strerror(*v21);
        int v23 = *__error();
        *(_DWORD *)buf = 138543874;
        id v32 = v12;
        __int16 v33 = 2080;
        uint64_t v34 = v22;
        __int16 v35 = 1024;
        int v36 = v23;
        _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Failed to acquire lockfile %{public}@: %s (%d)", buf, 0x1Cu);
      }

      char v16 = 0;
    }
    else
    {
      int v18 = (void *)MEMORY[0x1E016E7F0]();
      *(_DWORD *)buf = v14;
      v6[2](v6, buf);
      if (flock(v14, 8))
      {
        char v19 = TRILogCategory_Server();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          char v27 = __error();
          id v28 = strerror(*v27);
          int v29 = *__error();
          *(_DWORD *)buf = 138543874;
          id v32 = v12;
          __int16 v33 = 2080;
          uint64_t v34 = v28;
          __int16 v35 = 1024;
          int v36 = v29;
          _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "Failed to unlock lockfile %{public}@: %s (%d)", buf, 0x1Cu);
        }
      }
      char v16 = 1;
    }
    close(v14);
  }

  return v16 & 1;
}

- (id)_requireAssetStoreTempDir
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [(TRIPaths *)self->_paths assetStore];
  id v3 = [v2 stringByAppendingPathComponent:@"tmp"];

  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v14 = 0;
  char v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v14];
  id v6 = v14;

  if ((v5 & 1) == 0)
  {
    char v7 = TRILogCategory_Server();
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
    char v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v12 = __error();
      int v13 = strerror(*v12);
      *(_DWORD *)buf = 138543618;
      id v16 = v8;
      __int16 v17 = 2080;
      int v18 = v13;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Could not stat temporary directory %{public}@: %s", buf, 0x16u);
    }
  }
  else
  {
    id v10 = (const char *)[v8 fileSystemRepresentation];
    chmod(v10, v19.st_mode | 0x92);
  }

  return v8;
}

- (BOOL)_fixFileProtectionForFileURL:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v27 = 0;
  uint64_t v6 = *MEMORY[0x1E4F1C628];
  id v26 = 0;
  int v7 = [v5 getResourceValue:&v27 forKey:v6 error:&v26];
  id v8 = v27;
  id v9 = v26;
  if (!v7)
  {
    BOOL v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v34.st_dev = 138543618;
      *(void *)&v34.st_mode = v5;
      WORD2(v34.st_ino) = 2114;
      *(__darwin_ino64_t *)((char *)&v34.st_ino + 6) = (__darwin_ino64_t)v9;
      id v12 = "Failed to determine if url %{public}@ is a directory: %{public}@";
      int v13 = (uint8_t *)&v34;
      id v14 = v11;
      uint32_t v15 = 22;
LABEL_12:
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, v12, v13, v15);
    }
LABEL_13:

    BOOL v10 = 0;
    goto LABEL_14;
  }
  if (([v8 BOOLValue] & 1) == 0)
  {
    memset(&v34, 0, sizeof(v34));
    id v16 = v5;
    if (stat((const char *)[v16 fileSystemRepresentation], &v34))
    {
      BOOL v11 = TRILogCategory_Server();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v29 = v16;
        id v12 = "Could not stat: %{public}@";
        int v13 = buf;
        id v14 = v11;
        uint32_t v15 = 12;
        goto LABEL_12;
      }
    }
    else
    {
      id v17 = v16;
      if (!chmod((const char *)[v17 fileSystemRepresentation], 0x1F8u))
      {
        BOOL v22 = (void *)MEMORY[0x1E4F28CB8];
        int v23 = [v17 path];
        if (!v23)
        {
          uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
          [v25 handleFailureInMethod:a2, self, @"TRIAssetStoreOperator.m", 1230, @"Expression was unexpectedly nil/false: %@", @"fileURL.path" object file lineNumber description];
        }
        [v22 triRemoveFileProtectionIfPresentForPath:v23];

        __int16 v24 = (const char *)[v17 fileSystemRepresentation];
        chmod(v24, v34.st_mode & 0x124);
        goto LABEL_3;
      }
      BOOL v11 = TRILogCategory_Server();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v18 = __error();
        stat v19 = strerror(*v18);
        int v20 = *__error();
        *(_DWORD *)buf = 138543874;
        id v29 = v17;
        __int16 v30 = 2080;
        int v31 = v19;
        __int16 v32 = 1024;
        int v33 = v20;
        id v12 = "Failed to adjust permissions on temp dir: %{public}@ %s (%d)";
        int v13 = buf;
        id v14 = v11;
        uint32_t v15 = 28;
        goto LABEL_12;
      }
    }
    goto LABEL_13;
  }
LABEL_3:
  BOOL v10 = 1;
LABEL_14:

  return v10;
}

- (BOOL)fixFileProtectionForAssetStoreFiles
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    *(void *)buf = 0;
    uint32_t v15 = buf;
    uint64_t v16 = 0x2020000000;
    char v17 = 1;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__TRIAssetStoreOperator_fixFileProtectionForAssetStoreFiles__block_invoke;
    v9[3] = &unk_1E6BBD310;
    id v10 = WeakRetained;
    BOOL v11 = self;
    id v12 = buf;
    SEL v13 = a2;
    [(TRIAssetStoreOperator *)self _acquireLockfileAndRunBlock:v9];
    BOOL v6 = v15[24] != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    int v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Asset store unexpectedly released from asset store operator.", buf, 2u);
    }

    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __60__TRIAssetStoreOperator_fixFileProtectionForAssetStoreFiles__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__TRIAssetStoreOperator_fixFileProtectionForAssetStoreFiles__block_invoke_2;
  v3[3] = &unk_1E6BBD750;
  uint64_t v5 = *(void *)(a1 + 56);
  long long v4 = *(_OWORD *)(a1 + 40);
  return [v1 enumerateAssetDirsUsingBlock:v3];
}

void __60__TRIAssetStoreOperator_fixFileProtectionForAssetStoreFiles__block_invoke_2(uint64_t a1, void *a2)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v4 = [v3 lastPathComponent];
  if (!v4)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"TRIAssetStoreOperator.m", 1257, @"Invalid parameter not satisfying: %@", @"assetIdentifier" object file lineNumber description];
  }
  uint64_t v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"content" relativeToURL:v3];
  char v24 = 0;
  BOOL v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v7 = [v5 path];
  if (!v7)
  {
    BOOL v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"TRIAssetStoreOperator.m", 1261, @"Expression was unexpectedly nil/false: %@", @"contentURL.path" object file lineNumber description];
  }
  char v8 = [v6 fileExistsAtPath:v7 isDirectory:&v24];

  if (v8)
  {
    if (v24)
    {
      id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      v25[0] = *MEMORY[0x1E4F1C628];
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __60__TRIAssetStoreOperator_fixFileProtectionForAssetStoreFiles__block_invoke_3;
      v23[3] = &unk_1E6BBB998;
      v23[4] = *(void *)(a1 + 40);
      BOOL v11 = [v9 enumeratorAtURL:v5 includingPropertiesForKeys:v10 options:0 errorHandler:v23];

      id v12 = (void *)MEMORY[0x1E016E7F0]();
      uint64_t v13 = [v11 nextObject];
      if (v13)
      {
        id v14 = (void *)v13;
        do
        {
          char v15 = [*(id *)(a1 + 32) _fixFileProtectionForFileURL:v14];
          uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
          if (*(unsigned char *)(v16 + 24)) {
            char v17 = v15;
          }
          else {
            char v17 = 0;
          }
          *(unsigned char *)(v16 + 24) = v17;

          id v12 = (void *)MEMORY[0x1E016E7F0]();
          id v14 = [v11 nextObject];
        }
        while (v14);
      }
    }
    else
    {
      char v18 = [*(id *)(a1 + 32) _fixFileProtectionForFileURL:v5];
      uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
      if (*(unsigned char *)(v19 + 24)) {
        char v20 = v18;
      }
      else {
        char v20 = 0;
      }
      *(unsigned char *)(v19 + 24) = v20;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

uint64_t __60__TRIAssetStoreOperator_fixFileProtectionForAssetStoreFiles__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = TRILogCategory_Server();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "Encountered error while enumerating over assets to fix file protection for %{public}@: %@", (uint8_t *)&v9, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  return 1;
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
    int v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL v22 = __error();
      int v23 = strerror(*v22);
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
    id v14 = &v29;
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
    id v14 = 0;
    if (!v12) {
      goto LABEL_10;
    }
  }
  id v15 = v8;
  uint64_t v16 = (const std::__fs::filesystem::path *)[v15 fileSystemRepresentation];
  id v17 = v11;
  char v18 = (const std::__fs::filesystem::path *)[v17 fileSystemRepresentation];
  rename(v16, v18, v19);
  if (!v20)
  {
    [(TRIAssetStoreOperator *)self _fixupPermissionsOnPath:v17 permissionBits:v14];
    BOOL v10 = 1;
    goto LABEL_19;
  }
  if (*__error() == 17 || *__error() == 66 || *__error() == 21 || *__error() == 20)
  {
    BOOL v10 = [(TRIAssetStoreOperator *)self _nonAtomicOverwriteWithSrc:v15 dest:v17 finalPermissionBits:v14];
    goto LABEL_19;
  }
  uint64_t v25 = TRILogCategory_Server();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    id v26 = __error();
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

  [(TRIAssetStoreOperator *)self _fixupPermissionsOnPath:v15 permissionBits:v14];
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
        int v9 = __error();
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
  BOOL v10 = [(TRIAssetStoreOperator *)self _requireAssetStoreTempDir];
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
    [(TRIAssetStoreOperator *)self _fixupPermissionsOnPath:v8 permissionBits:a5];
    int v20 = TRILogCategory_Server();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = __error();
      BOOL v22 = strerror(*v21);
      int v23 = *__error();
      int v40 = 138544130;
      id v41 = v14;
      __int16 v42 = 2114;
      id v43 = v16;
      __int16 v44 = 2080;
      v45 = v22;
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
    id v26 = (const std::__fs::filesystem::path *)[v25 fileSystemRepresentation];
    id v27 = v14;
    int v28 = (const std::__fs::filesystem::path *)[v27 fileSystemRepresentation];
    rename(v26, v28, v29);
    if (!v30)
    {
      [(TRIAssetStoreOperator *)self _fixupPermissionsOnPath:v27 permissionBits:a5];
      [(TRIAssetStoreOperator *)self _forceRemoveItemAtPath:v16];
      BOOL v35 = 1;
      goto LABEL_7;
    }
    stat v31 = (const std::__fs::filesystem::path *)[v16 fileSystemRepresentation];
    id v32 = v27;
    int v33 = (const std::__fs::filesystem::path *)[v32 fileSystemRepresentation];
    rename(v31, v33, v34);
    [(TRIAssetStoreOperator *)self _fixupPermissionsOnPath:v25 permissionBits:a5];
    int v20 = TRILogCategory_Server();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = __error();
      __int16 v38 = strerror(*v37);
      int v39 = *__error();
      int v40 = 138544130;
      id v41 = v25;
      __int16 v42 = 2114;
      id v43 = v32;
      __int16 v44 = 2080;
      v45 = v38;
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

- (BOOL)_forceRemoveItemAtPath:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  id v10 = 0;
  char v6 = [v5 triForceRemoveItemAtPath:v4 error:&v10];

  id v7 = v10;
  if ((v6 & 1) == 0)
  {
    id v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v7;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Failed to force-remove: %{public}@", buf, 0xCu);
    }
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_store);
  objc_storeStrong((id *)&self->_storageManagement, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end