@interface PLDeviceRestoreMigrationPostProcessingSupport
+ (BOOL)_writeTokenToPath:(id)a3 withInfo:(id)a4 allowOverwrite:(BOOL)a5 error:(id *)a6;
+ (BOOL)createForegroundRestoreFromCloudBackupCompleteTokenWithPathManager:(id)a3 error:(id *)a4;
+ (id)_readTokenAtPath:(id)a3 allowNotExists:(BOOL)a4 error:(id *)a5;
- (BOOL)foregroundRestoreFromCloudBackupCompleteTokenExists;
- (BOOL)isBackgroundRestorePostProcessingInProgressTokenValid;
- (BOOL)isModelMigrationRestorePostProcessingComplete;
- (BOOL)needsToPrepareForBackgroundRestore;
- (BOOL)writeBackgroundRestorePostProcessingCompleteAndArchiveTokens;
- (BOOL)writeBackgroundRestorePostProcessingInProgressToken;
- (BOOL)writeModelMigrationRestorePostProcessingCompleteToken;
- (PLDeviceRestoreMigrationPostProcessingSupport)initWithModelMigrator:(id)a3;
@end

@implementation PLDeviceRestoreMigrationPostProcessingSupport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_destroyWeak((id *)&self->_modelMigrator);
}

- (BOOL)isModelMigrationRestorePostProcessingComplete
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  if ([(PLPhotoLibraryPathManager *)self->_pathManager isDeviceRestoreSupported])
  {
    id v5 = [(PLPhotoLibraryPathManager *)self->_pathManager modelRestorePostProcessingCompleteTokenPath];
    PLSafeRunWithUnfairLock();
  }
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __94__PLDeviceRestoreMigrationPostProcessingSupport_isModelMigrationRestorePostProcessingComplete__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 fileExistsAtPath:*(void *)(a1 + 32) isDirectory:0];
}

- (BOOL)writeModelMigrationRestorePostProcessingCompleteToken
{
  char v3 = [(PLPhotoLibraryPathManager *)self->_pathManager modelRestorePostProcessingCompleteTokenPath];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_modelMigrator);
  id v5 = [WeakRetained deviceRestoreMigrationSupport];
  uint64_t v6 = [v5 restoreTypeDescription];
  v7 = (void *)v6;
  uint64_t v8 = @"error";
  if (v6) {
    uint64_t v8 = (__CFString *)v6;
  }
  char v9 = v8;

  v12 = v9;
  id v13 = v3;
  PLSafeRunWithUnfairLock();
  char v10 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v10;
}

void __102__PLDeviceRestoreMigrationPostProcessingSupport_writeModelMigrationRestorePostProcessingCompleteToken__block_invoke(void *a1)
{
  v23[6] = *MEMORY[0x1E4F143B8];
  v22[0] = @"Date";
  v18 = PLCompleteDateFormatter();
  char v17 = [MEMORY[0x1E4F1C9C8] date];
  id v2 = [v18 stringFromDate:v17];
  v23[0] = v2;
  v22[1] = @"Build";
  char v3 = [MEMORY[0x1E4F8B888] currentBuildVersionString];
  v23[1] = v3;
  v22[2] = @"Process";
  v4 = [MEMORY[0x1E4F28F80] processInfo];
  id v5 = [v4 processName];
  v23[2] = v5;
  v22[3] = @"PID";
  uint64_t v6 = NSNumber;
  v7 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v8 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "processIdentifier"));
  uint64_t v9 = a1[4];
  v23[3] = v8;
  v23[4] = v9;
  v22[4] = @"RestoreType";
  v22[5] = @"ModelVersion";
  char v10 = objc_msgSend(NSNumber, "numberWithInt:", +[PLModelMigrator currentModelVersion](PLModelMigrator, "currentModelVersion"));
  v23[5] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:6];

  v12 = objc_opt_class();
  uint64_t v13 = a1[6];
  id v19 = 0;
  char v14 = [v12 _writeTokenToPath:v13 withInfo:v11 allowOverwrite:0 error:&v19];
  id v15 = v19;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v14;
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    uint64_t v16 = PLMigrationGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v15;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Failed to write ModelRestorePostProcessingCompleteToken %@", buf, 0xCu);
    }
  }
}

- (BOOL)writeBackgroundRestorePostProcessingCompleteAndArchiveTokens
{
  id v2 = self;
  char v3 = [(PLPhotoLibraryPathManager *)self->_pathManager cloudRestoreForegroundPhaseCompleteTokenPath];
  v4 = [(PLPhotoLibraryPathManager *)v2->_pathManager cloudRestoreBackgroundPhaseInProgressTokenPath];
  id v5 = [(PLPhotoLibraryPathManager *)v2->_pathManager cloudRestoreCompleteTokenPath];
  uint64_t v6 = [MEMORY[0x1E4F8B888] currentBuildVersionString];
  v7 = [v3 stringByAppendingFormat:@"_%@", v6];

  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  id v9 = v3;
  id v10 = v7;
  id v11 = v4;
  id v12 = v5;
  PLSafeRunWithUnfairLock();
  LOBYTE(v2) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v2;
}

void __109__PLDeviceRestoreMigrationPostProcessingSupport_writeBackgroundRestorePostProcessingCompleteAndArchiveTokens__block_invoke(void *a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  id v49 = 0;
  char v5 = [v2 moveItemAtPath:v3 toPath:v4 error:&v49];
  id v6 = v49;
  v7 = v6;
  if (v5)
  {
    id v8 = v6;
    goto LABEL_12;
  }
  *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 0;
  id v9 = PLMigrationGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = (void *)a1[5];
    *(_DWORD *)buf = 138543618;
    v53 = v10;
    __int16 v54 = 2112;
    id v55 = v7;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Failed to archive foreground token to %{public}@: %@", buf, 0x16u);
  }

  uint64_t v11 = a1[4];
  id v48 = v7;
  char v12 = [v2 removeItemAtPath:v11 error:&v48];
  id v8 = v48;

  uint64_t v13 = PLMigrationGetLog();
  char v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = (void *)a1[4];
      *(_DWORD *)buf = 138543362;
      v53 = v15;
      char v16 = "Removed foreground token %{public}@";
      char v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
      uint32_t v19 = 12;
LABEL_10:
      _os_log_impl(&dword_19B3C7000, v17, v18, v16, buf, v19);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v20 = (void *)a1[4];
    *(_DWORD *)buf = 138543618;
    v53 = v20;
    __int16 v54 = 2112;
    id v55 = v8;
    char v16 = "Failed to remove foreground token %{public}@: %@";
    char v17 = v14;
    os_log_type_t v18 = OS_LOG_TYPE_ERROR;
    uint32_t v19 = 22;
    goto LABEL_10;
  }

LABEL_12:
  uint64_t v21 = a1[6];
  uint64_t v22 = a1[7];
  id v47 = v8;
  char v23 = [v2 moveItemAtPath:v21 toPath:v22 error:&v47];
  id v24 = v47;

  if ((v23 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 0;
    v25 = PLMigrationGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = (void *)a1[7];
      *(_DWORD *)buf = 138543618;
      v53 = v26;
      __int16 v54 = 2112;
      id v55 = v24;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Failed to create restore complete token by archiving in progress to %{public}@: %@", buf, 0x16u);
    }

    if ([v2 fileExistsAtPath:a1[7] isDirectory:0])
    {
      v27 = PLMigrationGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Found existing restore complete token", buf, 2u);
      }

      *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
    }
    else
    {
      v50[0] = @"Date";
      v45 = PLCompleteDateFormatter();
      v44 = [MEMORY[0x1E4F1C9C8] date];
      v28 = [v45 stringFromDate:v44];
      v51[0] = v28;
      v50[1] = @"Build";
      v29 = [MEMORY[0x1E4F8B888] currentBuildVersionString];
      v51[1] = v29;
      v50[2] = @"Process";
      v30 = [MEMORY[0x1E4F28F80] processInfo];
      v31 = [v30 processName];
      v51[2] = v31;
      v50[3] = @"PID";
      v32 = NSNumber;
      v33 = [MEMORY[0x1E4F28F80] processInfo];
      v34 = objc_msgSend(v32, "numberWithInt:", objc_msgSend(v33, "processIdentifier"));
      v50[4] = @"InProgressCounter";
      v51[3] = v34;
      v51[4] = &unk_1EEBEE3B8;
      v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:5];

      v36 = PLMigrationGetLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v53 = v35;
        _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "Creating new restore complete token with data %{public}@", buf, 0xCu);
      }

      v37 = objc_opt_class();
      uint64_t v38 = a1[7];
      id v46 = v24;
      int v39 = [v37 _writeTokenToPath:v38 withInfo:v35 allowOverwrite:1 error:&v46];
      id v40 = v46;

      v41 = PLMigrationGetLog();
      BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
      if (v39)
      {
        if (v42)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_ERROR, "Created new restore complete token", buf, 2u);
        }

        *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
      }
      else
      {
        if (v42)
        {
          v43 = (void *)a1[7];
          *(_DWORD *)buf = 138543618;
          v53 = v43;
          __int16 v54 = 2112;
          id v55 = v40;
          _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_ERROR, "Failed to create new restore complete token %{public}@: %@", buf, 0x16u);
        }
      }
      id v24 = v40;
    }
  }
}

- (BOOL)writeBackgroundRestorePostProcessingInProgressToken
{
  [(PLPhotoLibraryPathManager *)self->_pathManager cloudRestoreBackgroundPhaseInProgressTokenPath];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__38002;
  v11[4] = __Block_byref_object_dispose__38003;
  id v12 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  int v10 = 1;
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  PLSafeRunWithUnfairLock();
  char v2 = *((unsigned char *)v6 + 24);

  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v11, 8);

  return v2;
}

void __100__PLDeviceRestoreMigrationPostProcessingSupport_writeBackgroundRestorePostProcessingInProgressToken__block_invoke(void *a1)
{
  v31[5] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [(id)objc_opt_class() _readTokenAtPath:a1[5] allowNotExists:1 error:0];
  uint64_t v2 = *(void *)(a1[6] + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;

  id v4 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectForKeyedSubscript:@"InProgressCounter"];
  *(_DWORD *)(*(void *)(a1[7] + 8) + 24) = [v4 intValue] + 1;

  v30[0] = @"Date";
  v25 = PLCompleteDateFormatter();
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [v25 stringFromDate:v5];
  v31[0] = v6;
  v30[1] = @"Build";
  uint64_t v7 = [MEMORY[0x1E4F8B888] currentBuildVersionString];
  v31[1] = v7;
  v30[2] = @"Process";
  char v8 = [MEMORY[0x1E4F28F80] processInfo];
  id v9 = [v8 processName];
  v31[2] = v9;
  v30[3] = @"PID";
  int v10 = NSNumber;
  uint64_t v11 = [MEMORY[0x1E4F28F80] processInfo];
  id v12 = objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "processIdentifier"));
  v31[3] = v12;
  v30[4] = @"InProgressCounter";
  uint64_t v13 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(a1[7] + 8) + 24)];
  v31[4] = v13;
  id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:5];

  if ([*(id *)(*(void *)(a1[6] + 8) + 40) count])
  {
    char v14 = v24;
    uint64_t v15 = (void *)[v24 mutableCopy];
    char v16 = (void *)[*(id *)(*(void *)(a1[6] + 8) + 40) mutableCopy];
    [v16 removeObjectForKey:@"History"];
    char v17 = [MEMORY[0x1E4F1CA48] array];
    os_log_type_t v18 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectForKeyedSubscript:@"History"];
    if ([v18 count]) {
      [v17 addObjectsFromArray:v18];
    }
    objc_msgSend(v17, "addObject:", v16, v24);
    [v15 setObject:v17 forKeyedSubscript:@"History"];
  }
  else
  {
    uint64_t v15 = v24;
  }
  uint32_t v19 = objc_opt_class();
  uint64_t v20 = a1[5];
  id v27 = 0;
  char v21 = [v19 _writeTokenToPath:v20 withInfo:v15 allowOverwrite:1 error:&v27];
  id v22 = v27;
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v21;
  if (!*(unsigned char *)(*(void *)(a1[8] + 8) + 24))
  {
    char v23 = PLMigrationGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v22;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Failed to write BackgroundPhaseInProgressToken %@", buf, 0xCu);
    }
  }
}

- (BOOL)isBackgroundRestorePostProcessingInProgressTokenValid
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 1;
  PLSafeRunWithUnfairLock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __102__PLDeviceRestoreMigrationPostProcessingSupport_isBackgroundRestorePostProcessingInProgressTokenValid__block_invoke(uint64_t a1)
{
  char v2 = objc_opt_class();
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 24) cloudRestoreBackgroundPhaseInProgressTokenPath];
  id v6 = [v2 _readTokenAtPath:v3 allowNotExists:1 error:0];

  uint64_t v4 = v6;
  if (v6)
  {
    uint64_t v5 = [v6 objectForKeyedSubscript:@"InProgressCounter"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (int)[v5 intValue] < 11;

    uint64_t v4 = v6;
  }
}

- (BOOL)needsToPrepareForBackgroundRestore
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v3 = [(PLPhotoLibraryPathManager *)self->_pathManager cloudRestoreForegroundPhaseCompleteTokenPath];
  id v6 = [(PLPhotoLibraryPathManager *)self->_pathManager cloudRestoreCompleteTokenPath];
  id v7 = v3;
  PLSafeRunWithUnfairLock();
  char v4 = *((unsigned char *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return v4;
}

void __83__PLDeviceRestoreMigrationPostProcessingSupport_needsToPrepareForBackgroundRestore__block_invoke(void *a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v2 fileExistsAtPath:a1[4] isDirectory:0] & 1) == 0) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v2 fileExistsAtPath:a1[5] isDirectory:0];
  }
}

- (BOOL)foregroundRestoreFromCloudBackupCompleteTokenExists
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v4 = [(PLPhotoLibraryPathManager *)self->_pathManager cloudRestoreForegroundPhaseCompleteTokenPath];
  PLSafeRunWithUnfairLock();
  char v2 = *((unsigned char *)v6 + 24);

  _Block_object_dispose(&v5, 8);
  return v2;
}

void __100__PLDeviceRestoreMigrationPostProcessingSupport_foregroundRestoreFromCloudBackupCompleteTokenExists__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 fileExistsAtPath:*(void *)(a1 + 32) isDirectory:0];
}

- (PLDeviceRestoreMigrationPostProcessingSupport)initWithModelMigrator:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLDeviceRestoreMigrationPostProcessingSupport;
  uint64_t v5 = [(PLDeviceRestoreMigrationPostProcessingSupport *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_modelMigrator, v4);
    uint64_t v7 = [v4 pathManager];
    pathManager = v6->_pathManager;
    v6->_pathManager = (PLPhotoLibraryPathManager *)v7;

    v6->_tokenLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

+ (BOOL)_writeTokenToPath:(id)a3 withInfo:(id)a4 allowOverwrite:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  char v11 = (void *)MEMORY[0x1E4F8B908];
  id v12 = [v9 stringByDeletingLastPathComponent];
  id v32 = 0;
  LOBYTE(v11) = [v11 createDirectoryAtPath:v12 error:&v32];
  id v13 = v32;

  if ((v11 & 1) == 0)
  {
    char v14 = PLMigrationGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = [v9 stringByDeletingLastPathComponent];
      *(_DWORD *)buf = 138543618;
      id v34 = v15;
      __int16 v35 = 2112;
      id v36 = v13;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to create post processing token directory: %{public}@ %@", buf, 0x16u);
    }
  }
  id v31 = 0;
  char v16 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v10 format:100 options:0 error:&v31];
  id v17 = v31;

  if (!v16)
  {
    id v27 = PLMigrationGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v34 = v9;
      __int16 v35 = 2114;
      id v36 = v10;
      __int16 v37 = 2112;
      id v38 = v17;
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Failed to encode data for token %{public}@ with info %{public}@: %@", buf, 0x20u);
    }

    if (a6)
    {
      v26 = v17;
LABEL_23:
      id v20 = v26;
      BOOL v24 = 0;
      *a6 = v20;
      goto LABEL_25;
    }
  }
  if (v7) {
    uint64_t v18 = 0x40000000;
  }
  else {
    uint64_t v18 = 1073741826;
  }
  id v30 = v17;
  int v19 = [v16 writeToFile:v9 options:v18 error:&v30];
  id v20 = v30;

  if (!v19)
  {
    v25 = PLMigrationGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v34 = v9;
      __int16 v35 = 2114;
      id v36 = v10;
      __int16 v37 = 2112;
      id v38 = v20;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Failed to write token %{public}@ with info %{public}@: %@", buf, 0x20u);
    }

    if (!a6)
    {
      BOOL v24 = 0;
      goto LABEL_25;
    }
    v26 = v20;
    goto LABEL_23;
  }
  id v29 = 0;
  char v21 = [MEMORY[0x1E4F8B908] changeFileOwnerToMobileAtPath:v9 error:&v29];
  id v22 = v29;
  if ((v21 & 1) == 0)
  {
    char v23 = PLMigrationGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v34 = v9;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Failed to chown token file %{public}@ to mobile", buf, 0xCu);
    }
  }
  BOOL v24 = 1;
LABEL_25:

  return v24;
}

+ (id)_readTokenAtPath:(id)a3 allowNotExists:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v18 = 0;
  char v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v7 options:0 error:&v18];
  id v9 = v18;
  if ([v8 length])
  {
    id v17 = 0;
    id v10 = [MEMORY[0x1E4F28F98] propertyListWithData:v8 options:0 format:0 error:&v17];
    id v11 = v17;

    if (v10) {
      goto LABEL_17;
    }
    id v12 = PLMigrationGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Failed to extract info from token data %{public}@: %@", buf, 0x16u);
    }

    if (!a5)
    {
      id v10 = 0;
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  if (v6
    && (PLUnderlyingPOSIXError(),
        id v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v13 code],
        v13,
        v14 == 2))
  {
    id v10 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    uint64_t v15 = PLMigrationGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to read data for token %{public}@: %@", buf, 0x16u);
    }

    if (a5)
    {
      id v11 = v9;
LABEL_14:
      id v11 = v11;
      id v10 = 0;
      *a5 = v11;
      goto LABEL_17;
    }
    id v10 = 0;
  }
  id v11 = v9;
LABEL_17:

  return v10;
}

+ (BOOL)createForegroundRestoreFromCloudBackupCompleteTokenWithPathManager:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 cloudRestoreForegroundPhaseCompleteTokenPath];
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v6 = [v5 fileExistsAtPath:v4 isDirectory:0];

  if (v6)
  {
    id v7 = PLMigrationGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      char v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v4];
      *(_DWORD *)buf = 138543362;
      id v29 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_FAULT, "Foreground restore token already exists!  Should only be possible if MobileSlideShow datamigrator plugin has run twice: %{public}@", buf, 0xCu);
    }
  }
  v26[0] = @"Date";
  id v9 = PLCompleteDateFormatter();
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  id v11 = [v9 stringFromDate:v10];
  v27[0] = v11;
  v26[1] = @"Build";
  id v12 = [MEMORY[0x1E4F8B888] currentBuildVersionString];
  v27[1] = v12;
  v26[2] = @"Process";
  id v13 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v14 = [v13 processName];
  v27[2] = v14;
  v26[3] = @"PID";
  uint64_t v15 = NSNumber;
  char v16 = [MEMORY[0x1E4F28F80] processInfo];
  id v17 = objc_msgSend(v15, "numberWithInt:", objc_msgSend(v16, "processIdentifier"));
  v27[3] = v17;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];

  id v25 = 0;
  char v19 = [a1 _writeTokenToPath:v4 withInfo:v18 allowOverwrite:1 error:&v25];
  id v20 = v25;
  if ((v19 & 1) == 0)
  {
    __int16 v21 = PLMigrationGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v20;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Failed to write ForegroundRestoreFromCloudBackupCompleteToken %@", buf, 0xCu);
    }

    if (a4) {
      *a4 = v20;
    }
  }

  return v19;
}

@end