@interface PLDuplicateMergeCrashRecovery
- (BOOL)removeCrashRecoveryMarkerFileWithError:(id *)a3;
- (BOOL)writeCrashRecoveryMarkerFileForTargetAssetUUID:(id)a3 error:(id *)a4;
- (PLDuplicateMergeCrashRecovery)initWithLibraryServicesManager:(id)a3;
- (PLDuplicateMergeCrashRecovery)initWithPhotoLibrary:(id)a3;
- (id)_crashRecoveryMarkerFileURL;
- (id)_readCrashRecoveryUUIDContainerMarkerFile;
- (id)_readCrashRecoveryUUIDListMarkerFile;
- (int64_t)_requestRecoveryActionForAsset:(id)a3;
- (void)_recoveryMasterRecordCleanupForAsset:(id)a3;
- (void)_recoveryMasterResourceRecordCleanupForAsset:(id)a3;
- (void)performCrashRecoveryIfNeeded;
@end

@implementation PLDuplicateMergeCrashRecovery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

- (void)_recoveryMasterResourceRecordCleanupForAsset:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 masterResourceForCPLType:1];
  v5 = [v4 cplFileURL];
  if (![v5 checkResourceIsReachableAndReturnError:0])
  {
    v8 = [v3 master];
    v9 = [v8 scopedIdentifier];
    v6 = [v9 identifier];

    v7 = [v4 fingerprint];
    if (-[NSObject length](v6, "length") && [v7 length]) {
      [v4 setFingerprint:v6];
    }
    goto LABEL_7;
  }
  v6 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = [v3 uuid];
    int v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Duplicate Merge: Unexpected original resource on disk for asset %{public}@.", (uint8_t *)&v10, 0xCu);
LABEL_7:
  }
}

- (void)_recoveryMasterRecordCleanupForAsset:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 master];
  if (v5)
  {
    v6 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v5 scopedIdentifier];
      v8 = [v4 uuid];
      int v11 = 138543618;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Duplicate Merge: Deleting master %{public}@ so a new master is created for asset %{public}@", (uint8_t *)&v11, 0x16u);
    }
    [v4 setMaster:0];
    +[PLCloudMaster deleteMasterIfNecessary:v5 inLibrary:self->_library];
  }
  v9 = PLDuplicateDetectionGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [v4 uuid];
    int v11 = 138543362;
    uint64_t v12 = v10;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Duplicate Merge: Marking asset %{public}@ as not pushed to get it re-pushed to CPL", (uint8_t *)&v11, 0xCu);
  }
  [v4 setCloudLocalState:0];
}

- (int64_t)_requestRecoveryActionForAsset:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 master];
  if (v4)
  {
    v5 = [v3 mainFileURL];
    v6 = [v3 master];
    v7 = [v6 scopedIdentifier];
    v8 = [v7 identifier];

    id v23 = 0;
    LODWORD(v6) = [v5 checkResourceIsReachableAndReturnError:&v23];
    id v9 = v23;
    if (v6)
    {
      int v10 = [MEMORY[0x1E4F59898] defaultFingerprintSchemeForUnknownRecord];
      id v22 = v9;
      int v11 = [v10 fingerPrintForFileAtURL:v5 error:&v22];
      id v12 = v22;

      if (v11)
      {
        int64_t v13 = [v8 isEqualToString:v11] ^ 1;
      }
      else
      {
        v19 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = [v3 uuid];
          *(_DWORD *)buf = 138543618;
          v25 = v20;
          __int16 v26 = 2112;
          id v27 = v12;
          _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Duplicate Merge: Failed to generate fingerprint for asset %{public}@. Error: %@", buf, 0x16u);
        }
        int v11 = 0;
        int64_t v13 = 0;
      }
    }
    else
    {
      int v14 = PLIsErrorFileNotFound();
      uint64_t v15 = PLDuplicateDetectionGetLog();
      int v11 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = [v3 uuid];
          *(_DWORD *)buf = 138543618;
          v25 = v16;
          __int16 v26 = 2112;
          id v27 = v9;
          _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "Duplicate Merge: No master resource found for asset %{public}@. Error: %@", buf, 0x16u);
        }
        int v11 = [v3 masterResourceForCPLType:1];
        v17 = [v11 fingerprint];
        if (v17)
        {
          if ([v8 isEqualToString:v17]) {
            int64_t v13 = 0;
          }
          else {
            int64_t v13 = 2;
          }
        }
        else
        {
          int64_t v13 = 0;
        }
      }
      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v18 = [v3 uuid];
          *(_DWORD *)buf = 138543618;
          v25 = v18;
          __int16 v26 = 2112;
          id v27 = v9;
          _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Duplicate Merge: Failed to check if the resource is available on disk for asset %{public}@. Error: %@", buf, 0x16u);
        }
        int64_t v13 = 0;
      }
      id v12 = v9;
    }
  }
  else
  {
    int64_t v13 = 0;
  }

  return v13;
}

- (void)performCrashRecoveryIfNeeded
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(PLDuplicateMergeCrashRecovery *)self _readCrashRecoveryUUIDContainerMarkerFile];
  if ([v3 count])
  {
    id v4 = (void *)MEMORY[0x1E4F1C0D0];
    v5 = +[PLManagedAsset entityName];
    v6 = [v4 fetchRequestWithEntityName:v5];

    v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"uuid", v3];
    [v6 setPredicate:v7];

    v13[0] = @"master";
    v13[1] = @"modernResources";
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    [v6 setRelationshipKeyPathsForPrefetching:v8];

    library = self->_library;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__PLDuplicateMergeCrashRecovery_performCrashRecoveryIfNeeded__block_invoke;
    v11[3] = &unk_1E5875E18;
    v11[4] = self;
    id v12 = v6;
    id v10 = v6;
    [(PLPhotoLibrary *)library performTransactionAndWait:v11];
  }
  [(PLDuplicateMergeCrashRecovery *)self removeCrashRecoveryMarkerFileWithError:0];
}

void __61__PLDuplicateMergeCrashRecovery_performCrashRecoveryIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  id v24 = 0;
  id v4 = [v2 executeFetchRequest:v3 error:&v24];
  id v5 = v24;

  if (v4)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v18 = v5;
      v19 = v4;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v12 = PLDuplicateDetectionGetLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v13 = [v11 uuid];
            *(_DWORD *)buf = 138543362;
            id v26 = v13;
            _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Duplicate Merge: Crash recovery marker file found for asset UUID %{public}@", buf, 0xCu);
          }
          uint64_t v14 = [*(id *)(a1 + 32) _requestRecoveryActionForAsset:v11];
          uint64_t v15 = PLDuplicateDetectionGetLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = [v11 uuid];
            v17 = PLStringFromPLDuplicateMergeCrashRecoveryActionShort(v14);
            *(_DWORD *)buf = 138543618;
            id v26 = v16;
            __int16 v27 = 2114;
            uint64_t v28 = v17;
            _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Duplicate Merge: Crash recovery action for asset %{public}@: %{public}@", buf, 0x16u);
          }
          if (v14 == 2)
          {
            [*(id *)(a1 + 32) _recoveryMasterResourceRecordCleanupForAsset:v11];
          }
          else if (v14 == 1)
          {
            [*(id *)(a1 + 32) _recoveryMasterRecordCleanupForAsset:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v29 count:16];
      }
      while (v8);
      id v5 = v18;
      id v4 = v19;
    }
  }
  else
  {
    v6 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v5;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Duplicate Merge: Crash recovery marker file exists but we're unable to fetch associated assets. Error: %@", buf, 0xCu);
    }
  }
}

- (BOOL)removeCrashRecoveryMarkerFileWithError:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = [(PLDuplicateMergeCrashRecovery *)self _crashRecoveryMarkerFileURL];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = 0;
  char v6 = [v5 removeItemAtURL:v4 error:&v11];
  id v7 = v11;

  if (v6 & 1) != 0 || (PLIsErrorFileNotFound())
  {
    BOOL v8 = 1;
  }
  else
  {
    id v10 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Duplicate Merge: Failed to remove crash recovery marker file: %@", buf, 0xCu);
    }

    BOOL v8 = 0;
    if (a3) {
      *a3 = v7;
    }
  }

  return v8;
}

- (BOOL)writeCrashRecoveryMarkerFileForTargetAssetUUID:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 length])
  {
    id v7 = [(PLDuplicateMergeCrashRecovery *)self _crashRecoveryMarkerFileURL];
    BOOL v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v9 = [v7 path];
    int v10 = [v8 fileExistsAtPath:v9];

    if (v10)
    {
      id v24 = 0;
      id v11 = [MEMORY[0x1E4F28CB0] fileHandleForUpdatingURL:v7 error:&v24];
      id v12 = v24;
      if (v11)
      {
        id v13 = [NSString stringWithFormat:@"%@%@", @",", v6];
        uint64_t v14 = [v13 dataUsingEncoding:4];
        [v11 seekToEndOfFile];
        [v11 writeData:v14];
        [v11 closeFile];
        uint64_t v15 = PLDuplicateDetectionGetLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v26 = v6;
          _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "Duplicate Merge: Successfully updated crash recovery marker file for asset UUID %{public}@", buf, 0xCu);
        }

LABEL_11:
        id v19 = v12;
        BOOL v16 = 1;
LABEL_20:

        goto LABEL_21;
      }
      id v11 = PLDuplicateDetectionGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v26 = v6;
        __int16 v27 = 2112;
        id v28 = v12;
        long long v20 = "Duplicate Merge: Failed to update crash recovery marker file for asset UUID %{public}@: %@";
        goto LABEL_16;
      }
    }
    else
    {
      id v23 = 0;
      int v17 = [v6 writeToURL:v7 atomically:1 encoding:4 error:&v23];
      id v12 = v23;
      id v18 = PLDuplicateDetectionGetLog();
      id v11 = v18;
      if (v17)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v26 = v6;
          _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "Duplicate Merge: Successfully created crash recovery marker file for asset UUID %{public}@", buf, 0xCu);
        }
        goto LABEL_11;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v26 = v6;
        __int16 v27 = 2112;
        id v28 = v12;
        long long v20 = "Duplicate Merge: Failed to create crash recovery marker file for asset UUID %{public}@: %@";
LABEL_16:
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, v20, buf, 0x16u);
      }
    }

    id v21 = v12;
    id v19 = v21;
    if (a4)
    {
      id v19 = v21;
      BOOL v16 = 0;
      *a4 = v19;
    }
    else
    {
      BOOL v16 = 0;
    }
    goto LABEL_20;
  }
  BOOL v16 = 1;
LABEL_21:

  return v16;
}

- (id)_readCrashRecoveryUUIDListMarkerFile
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [(PLDuplicateMergeCrashRecovery *)self _crashRecoveryMarkerFileURL];
  id v7 = 0;
  uint64_t v3 = (void *)[[NSString alloc] initWithContentsOfURL:v2 encoding:4 error:&v7];
  id v4 = v7;
  if (!v3 && (PLIsErrorFileNotFound() & 1) == 0)
  {
    id v5 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Duplicate Merge: Failed to read the crash recovery marker file: %@", buf, 0xCu);
    }
  }
  if (![v3 length])
  {

    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_readCrashRecoveryUUIDContainerMarkerFile
{
  v2 = [(PLDuplicateMergeCrashRecovery *)self _readCrashRecoveryUUIDListMarkerFile];
  uint64_t v3 = [v2 componentsSeparatedByString:@","];

  return v3;
}

- (id)_crashRecoveryMarkerFileURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v3 = [(PLPhotoLibraryPathManager *)self->_pathManager photoDirectoryWithType:5 createIfNeeded:1 error:0];
  id v4 = [v3 stringByAppendingPathComponent:@"duplicateMergeMarkerFile.txt"];
  id v5 = [v2 fileURLWithPath:v4 isDirectory:0];

  return v5;
}

- (PLDuplicateMergeCrashRecovery)initWithPhotoLibrary:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PLDuplicateMergeCrashRecovery.m", 61, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PLDuplicateMergeCrashRecovery;
  id v7 = [(PLDuplicateMergeCrashRecovery *)&v13 init];
  BOOL v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_library, a3);
    uint64_t v9 = [v6 pathManager];
    pathManager = v8->_pathManager;
    v8->_pathManager = (PLPhotoLibraryPathManager *)v9;
  }
  return v8;
}

- (PLDuplicateMergeCrashRecovery)initWithLibraryServicesManager:(id)a3
{
  id v4 = [a3 databaseContext];
  id v5 = (void *)[v4 newShortLivedLibraryWithName:"-[PLDuplicateMergeCrashRecovery initWithLibraryServicesManager:]"];

  if (v5)
  {
    id v6 = [(PLDuplicateMergeCrashRecovery *)self initWithPhotoLibrary:v5];
  }
  else
  {

    id v6 = 0;
  }

  return v6;
}

@end