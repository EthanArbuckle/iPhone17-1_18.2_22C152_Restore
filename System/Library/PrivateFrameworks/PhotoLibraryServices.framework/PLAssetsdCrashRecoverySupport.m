@interface PLAssetsdCrashRecoverySupport
- (BOOL)isSafeToRecoverAfterCrash;
- (PLAssetsdCrashRecoverySupport)initWithPathManager:(id)a3;
- (void)_enqeueRecoveryJob:(id)a3 date:(id)a4 toImageWriter:(id)a5;
- (void)recoverFromCrashIfNeededWithImageWriter:(id)a3;
@end

@implementation PLAssetsdCrashRecoverySupport

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_recoveryJobCreationDate);
  objc_storeStrong((id *)&self->_pathManager, 0);
}

- (void)_enqeueRecoveryJob:(id)a3 date:(id)a4 toImageWriter:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    v11 = PLAssetImportGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = NSStringFromSelector(a2);
      int v32 = 138543618;
      v33 = v12;
      __int16 v34 = 1024;
      LODWORD(v35) = [v8 count];
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] passed %d incoming files", (uint8_t *)&v32, 0x12u);
    }
    v13 = v8;
  }
  else
  {
    v11 = [MEMORY[0x1E4F8B850] incomingDirectoryPath];
    v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    v13 = [v14 contentsOfDirectoryAtPath:v11 error:0];

    v15 = PLAssetImportGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = NSStringFromSelector(a2);
      int v32 = 138543618;
      v33 = v16;
      __int16 v34 = 1024;
      LODWORD(v35) = [v13 count];
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] found %d incoming files", (uint8_t *)&v32, 0x12u);
    }
  }

  if ([v13 count])
  {
    v17 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    uint64_t v18 = *MEMORY[0x1E4F8C998];
    [v17 setObject:*MEMORY[0x1E4F8C998] forKey:*MEMORY[0x1E4F8C970]];
    [v17 setObject:v13 forKey:@"CrashRecoveryFilenamesKey"];
    [v17 setObject:v9 forKey:@"CrashRecoveryJobCreationDateKey"];
    v19 = PLAssetImportGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      id v20 = v9;
      v22 = v21 = a2;
      int v32 = 138412802;
      v33 = v22;
      __int16 v34 = 2112;
      uint64_t v35 = v18;
      __int16 v36 = 2112;
      v37 = v13;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "[%@] enqueing existing files recovery job %@ (%@)", (uint8_t *)&v32, 0x20u);

      a2 = v21;
      id v9 = v20;
    }

    [v10 enqueueJob:v17];
  }
  v23 = [MEMORY[0x1E4F8B850] incomingDirectoryPathForPhotoStream];
  v24 = [MEMORY[0x1E4F28CB8] defaultManager];
  v25 = [v24 contentsOfDirectoryAtPath:v23 error:0];

  if ([v25 count])
  {
    id v26 = v9;
    v27 = a2;
    v28 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    uint64_t v29 = *MEMORY[0x1E4F8C998];
    [v28 setObject:*MEMORY[0x1E4F8C998] forKey:*MEMORY[0x1E4F8C970]];
    [v28 setObject:v25 forKey:@"CrashRecoveryPhotoStreamFilenamesKey"];
    v30 = PLAssetImportGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = NSStringFromSelector(v27);
      int v32 = 138412802;
      v33 = v31;
      __int16 v34 = 2112;
      uint64_t v35 = v29;
      __int16 v36 = 2112;
      v37 = v25;
      _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEFAULT, "[%@] enqueing photostream recovery job %@ (%@)", (uint8_t *)&v32, 0x20u);
    }
    [v10 enqueueJob:v28];

    id v9 = v26;
  }
}

- (BOOL)isSafeToRecoverAfterCrash
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F8B840] takingVideoIndicatorFilePath];
  v20[0] = v2;
  v3 = [MEMORY[0x1E4F8B840] takingPhotoIndicatorFilePath];
  v20[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v15 + 1) + 8 * i);
        int v11 = open((const char *)objc_msgSend(v10, "fileSystemRepresentation", (void)v15), 36);
        int v12 = v11;
        if (v11 < 0)
        {
          if (v11 == -1 && *__error() == 35)
          {
            BOOL v13 = 0;
            goto LABEL_14;
          }
        }
        else
        {
          flock(v11, 8);
          close(v12);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_14:

  return v13;
}

- (void)recoverFromCrashIfNeededWithImageWriter:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PLAssetsdCrashRecoverySupport.m", 43, @"Invalid parameter not satisfying: %@", @"imageWriter" object file lineNumber description];
  }
  if ((PLIsAssetsd() & 1) == 0)
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"PLAssetsdCrashRecoverySupport.m" lineNumber:44 description:@"recoverFromCrashIfNeededWithImageWriter can only be called from assetsd"];
  }
  uint64_t v6 = +[PLPhotoLibraryBundleController sharedBundleController];
  uint64_t v7 = [(PLPhotoLibraryPathManager *)self->_pathManager libraryURL];
  uint64_t v8 = [v6 openBundleAtLibraryURL:v7];

  id v9 = [v8 indicatorFileCoordinator];
  id v10 = [MEMORY[0x1E4F8B850] incomingDirectoryPath];
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__26090;
  uint64_t v38 = __Block_byref_object_dispose__26091;
  id v39 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__26090;
  int v32 = __Block_byref_object_dispose__26091;
  id v33 = 0;
  int v11 = PLAssetImportGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    v49 = v12;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] checking for crash recovery files", buf, 0xCu);
  }
  id v13 = v9;
  id v14 = v10;
  PLSafeRunWithUnfairLock();
  if (*((unsigned char *)v45 + 24))
  {
    if (*((unsigned char *)v41 + 24))
    {
      long long v15 = PLAssetImportGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        long long v16 = NSStringFromSelector(a2);
        uint64_t v17 = v29[5];
        *(_DWORD *)buf = 138543618;
        v49 = v16;
        __int16 v50 = 2114;
        uint64_t v51 = v17;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueing delayed recovery job requested at %{public}@", buf, 0x16u);
      }
      dispatch_time(0, 2000000000);
      long long v18 = +[PLConcurrencyLimiter sharedLimiter];
      v19 = [v18 sharedUtilityQueue];
      id v27 = v5;
      pl_dispatch_after();
    }
    else
    {
      v22 = PLAssetImportGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = NSStringFromSelector(a2);
        uint64_t v24 = v29[5];
        *(_DWORD *)buf = 138543618;
        v49 = v23;
        __int16 v50 = 2114;
        uint64_t v51 = v24;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueing recovery job requested at %{public}@", buf, 0x16u);
      }
      [(PLAssetsdCrashRecoverySupport *)self _enqeueRecoveryJob:v35[5] date:v29[5] toImageWriter:v5];
    }
  }
  else
  {
    id v20 = PLAssetImportGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138543362;
      v49 = v21;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] no indicator or incoming files found", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
}

void __73__PLAssetsdCrashRecoverySupport_recoverFromCrashIfNeededWithImageWriter___block_invoke(uint64_t a1)
{
  BOOL v2 = 1;
  char v3 = [*(id *)(a1 + 32) needsRecoveryAfterCrashOptionallyRemoveAllIndicatorFiles:1];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = [v4 contentsOfDirectoryAtPath:*(void *)(a1 + 48) error:0];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if ((v3 & 1) == 0) {
    BOOL v2 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count] != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v2;
  char v8 = v3 ^ 1;
  if (WeakRetained) {
    char v8 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v8;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
    int v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    objc_storeWeak((id *)(*(void *)(a1 + 40) + 24), *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
  }
}

uint64_t __73__PLAssetsdCrashRecoverySupport_recoverFromCrashIfNeededWithImageWriter___block_invoke_22(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enqeueRecoveryJob:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) date:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) toImageWriter:*(void *)(a1 + 40)];
}

- (PLAssetsdCrashRecoverySupport)initWithPathManager:(id)a3
{
  id v6 = a3;
  if (PLIsAssetsd())
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PLAssetsdCrashRecoverySupport.m" lineNumber:32 description:@"Must only be used in assetsd"];

    if (v6) {
      goto LABEL_3;
    }
  }
  int v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"PLAssetsdCrashRecoverySupport.m", 33, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

LABEL_3:
  v12.receiver = self;
  v12.super_class = (Class)PLAssetsdCrashRecoverySupport;
  uint64_t v7 = [(PLAssetsdCrashRecoverySupport *)&v12 init];
  char v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_pathManager, a3);
    v8->_recoveryIndicatorCheckLock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

@end