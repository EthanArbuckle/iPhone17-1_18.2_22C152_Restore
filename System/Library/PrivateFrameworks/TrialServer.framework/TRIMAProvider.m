@interface TRIMAProvider
+ (id)fetchRetryDateFromAttribution:(id)a3 isDeferral:(BOOL)a4;
- (BOOL)_shouldMockMobileAssets;
- (id)_sqliteMADatabase;
- (id)createAutoAssetWithId:(id)a3 decryptionKey:(id)a4 error:(id *)a5;
- (id)downloadAssets:(id)a3 attribution:(id)a4 aggregateProgress:(id)a5 group:(id)a6 completion:(id)a7;
- (id)endAllPreviousLocksOfReasonSync:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5;
- (id)endAllPreviousLocksOfSelectorSync:(id)a3 forClientName:(id)a4;
- (id)installedAssetsMatchingFullAssetIds:(id)a3;
- (void)cancelActivityForSelector:(id)a3 completion:(id)a4;
- (void)eliminateAllForSelector:(id)a3 completion:(id)a4;
- (void)eliminatePromotedNeverLockedForSelector:(id)a3 completion:(id)a4;
@end

@implementation TRIMAProvider

+ (id)fetchRetryDateFromAttribution:(id)a3 isDeferral:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = [a3 networkOptions];
  BOOL v6 = [v5 discretionaryBehavior] == 0;

  return +[TRIFetchRetryUtils fetchRetryDateFromRetryAfterSeconds:0 isDeferral:v4 isRetryable:1 isNonDiscretionary:v6];
}

- (id)endAllPreviousLocksOfReasonSync:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(TRIMAProvider *)self _shouldMockMobileAssets])
  {
    v11 = [(TRIMAProvider *)self _sqliteMADatabase];
    [v11 endAllPreviousLocksOfReasonSync:v8 forAssetSelector:v10];

    v12 = 0;
  }
  else
  {
    v12 = [MEMORY[0x1E4F77FC8] endAllPreviousLocksOfReasonSync:v8 forClientName:v9 forAssetSelector:v10];
  }

  return v12;
}

- (id)endAllPreviousLocksOfSelectorSync:(id)a3 forClientName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(TRIMAProvider *)self _shouldMockMobileAssets])
  {
    id v8 = [(TRIMAProvider *)self _sqliteMADatabase];
    [v8 endAllPreviousLocksOfSelectorSync:v6 forClientName:v7];

    id v9 = 0;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F77FC8] endAllPreviousLocksOfSelectorSync:v6 forClientName:v7];
  }

  return v9;
}

- (void)cancelActivityForSelector:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(TRIMAProvider *)self _shouldMockMobileAssets])
  {
    id v7 = [(TRIMAProvider *)self _sqliteMADatabase];
    [v7 cancelActivityForSelector:v8 completion:v6];
  }
  else
  {
    [MEMORY[0x1E4F77FC8] cancelActivityForSelector:v8 completion:v6];
  }
}

- (void)eliminateAllForSelector:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(TRIMAProvider *)self _shouldMockMobileAssets])
  {
    id v7 = [(TRIMAProvider *)self _sqliteMADatabase];
    [v7 eliminateAllForSelector:v8 completion:v6];
  }
  else
  {
    [MEMORY[0x1E4F77FC8] eliminateAllForSelector:v8 completion:v6];
  }
}

- (void)eliminatePromotedNeverLockedForSelector:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(TRIMAProvider *)self _shouldMockMobileAssets])
  {
    id v7 = [(TRIMAProvider *)self _sqliteMADatabase];
    [v7 eliminatePromotedNeverLockedForSelector:v8 completion:v6];
  }
  else
  {
    [MEMORY[0x1E4F77FC8] eliminatePromotedNeverLockedForSelector:v8 completion:v6];
  }
}

- (id)createAutoAssetWithId:(id)a3 decryptionKey:(id)a4 error:(id *)a5
{
  id obj = 0;
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = [(TRIMAProvider *)self _shouldMockMobileAssets];
  v11 = off_1E6BB7540;
  if (!v10) {
    v11 = off_1E6BB7208;
  }
  v12 = (void *)[objc_alloc(*v11) initWithAssetId:v9 decryptionKey:v8 error:&obj];

  if (a5 && !v12) {
    objc_storeStrong(a5, obj);
  }

  return v12;
}

- (id)_sqliteMADatabase
{
  db = self->_db;
  if (!db)
  {
    if (sqliteMADatabasePaths)
    {
      id v5 = (id)sqliteMADatabasePaths;
    }
    else
    {
      id v5 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
    }
    id v6 = v5;
    id v7 = [v5 trialRootDir];
    id v8 = [v7 stringByAppendingPathComponent:@"MASQLiteMock"];

    id v9 = [v8 stringByAppendingPathComponent:@"Database"];
    BOOL v10 = [[TRISQLiteMADatabase alloc] initWithParentDir:v9];
    if (!v10)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"TRIMAProviding.m", 394, @"Expression was unexpectedly nil/false: %@", @"[[TRISQLiteMADatabase alloc] initWithParentDir:parentDir]" object file lineNumber description];
    }
    v11 = self->_db;
    self->_db = v10;

    db = self->_db;
  }
  return db;
}

- (BOOL)_shouldMockMobileAssets
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"com.apple.triald.ma.sqliteMock"];

  return v3;
}

- (id)installedAssetsMatchingFullAssetIds:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  id v6 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__TRIMAProvider_installedAssetsMatchingFullAssetIds___block_invoke;
  v10[3] = &unk_1E6BBB770;
  v10[4] = self;
  v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  [v4 enumerateObjectsUsingBlock:v10];
  [v7 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_486];
  if (*((unsigned char *)v14 + 24)) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  _Block_object_dispose(&v13, 8);

  return v8;
}

void __53__TRIMAProvider_installedAssetsMatchingFullAssetIds___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v22 = 0;
  id v6 = [*(id *)(a1 + 32) createAutoAssetWithId:v5 decryptionKey:0 error:&v22];
  if (v6)
  {
    id v7 = objc_opt_new();
    [v7 setLockAcrossTermination:0];
    [v7 setUnlockAfterUsageSecs:-2];
    id v20 = 0;
    id v21 = 0;
    id v8 = [v6 lockContentSync:@"test asset presence" withUsagePolicy:v7 withTimeout:0 lockedAssetSelector:&v21 newerInProgress:0 error:&v20];
    id v9 = v21;
    id v19 = v20;
    if (v8 && v9)
    {
      BOOL v10 = [v9 assetVersion];
      BOOL v11 = v10 == 0;

      if (v11)
      {
        char v16 = TRILogCategory_Server();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v24 = v9;
          _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "lockContent returned asset selector with missing version: %{public}@", buf, 0xCu);
        }
      }
      else
      {
        id v12 = objc_alloc(MEMORY[0x1E4FB0178]);
        uint64_t v13 = [v9 assetType];
        v14 = [v9 assetSpecifier];
        uint64_t v15 = [v9 assetVersion];
        char v16 = [v12 initWithType:v13 specifier:v14 version:v15];

        id v17 = *(id *)(a1 + 40);
        objc_sync_enter(v17);
        [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v16];
        objc_sync_exit(v17);
      }
    }
    else
    {
      char v16 = TRILogCategory_Server();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v24 = v6;
        __int16 v25 = 2114;
        id v26 = v19;
        _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "MAAutoAsset %{public}@ not found when checking for presence: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    v18 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v5;
      __int16 v25 = 2112;
      id v26 = v22;
      _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Failed to init autoAsset %@: %@", buf, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a3 = 1;
  }
}

id __53__TRIMAProvider_installedAssetsMatchingFullAssetIds___block_invoke_483(uint64_t a1, uint64_t a2, void *a3)
{
  return (id)[a3 endLockUsageSync:@"test asset presence"];
}

- (id)downloadAssets:(id)a3 attribution:(id)a4 aggregateProgress:(id)a5 group:(id)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  char v16 = a6;
  id v17 = a7;
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v13, "count"));
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2020000000;
  char v70 = 1;
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke;
  v62[3] = &unk_1E6BBB7B8;
  v62[4] = self;
  id v19 = v17;
  id v65 = v19;
  id v20 = v14;
  id v63 = v20;
  v66 = &v67;
  id v21 = v18;
  id v64 = v21;
  [v13 enumerateKeysAndObjectsUsingBlock:v62];
  if (*((unsigned char *)v68 + 24))
  {
    SEL v36 = a2;
    v37 = v15;
    id v22 = objc_opt_new();
    v23 = [v20 networkOptions];
    uint64_t v24 = [v23 discretionaryBehavior];

    if (!v24) {
      [v22 setUserInitiated:1];
    }
    __int16 v25 = objc_alloc_init(TRICancelableMAOperation);
    if (v16) {
      dispatch_group_enter(v16);
    }
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2020000000;
    uint64_t v61 = 0;
    id v26 = [v20 networkOptions];
    uint64_t v27 = [v26 activity];

    if (v27)
    {
      v28 = [v20 networkOptions];
      v29 = [v28 activity];
      uint64_t v49 = MEMORY[0x1E4F143A8];
      uint64_t v50 = 3221225472;
      v51 = __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_490;
      v52 = &unk_1E6BBB808;
      v53 = v25;
      v57 = &v58;
      id v56 = v19;
      id v54 = v20;
      v55 = v16;
      v59[3] = xpc_activity_add_eligibility_changed_handler();
    }
    v30 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.triald.MADownloadQueue" qosClass:qos_class_self()];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_494;
    block[3] = &unk_1E6BBB8D0;
    id v39 = v21;
    v31 = v25;
    v40 = v31;
    id v41 = v22;
    SEL v48 = v36;
    v42 = self;
    id v43 = v37;
    v47 = &v58;
    id v46 = v19;
    id v44 = v20;
    v45 = v16;
    id v32 = v22;
    dispatch_async(v30, block);
    v33 = v45;
    v34 = v31;

    id v15 = v37;
    _Block_object_dispose(&v58, 8);
  }
  else
  {
    v34 = 0;
  }

  _Block_object_dispose(&v67, 8);
  return v34;
}

void __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = [v8 namespaceNameForEncryptionKey];

  if (v9)
  {
    BOOL v10 = [v8 namespaceNameForEncryptionKey];
    id v9 = +[TRINamespaceKeyLocator keyDataForNamespace:v10 asymmetric:1];
  }
  id v15 = 0;
  BOOL v11 = [*(id *)(a1 + 32) createAutoAssetWithId:v7 decryptionKey:v9 error:&v15];
  if (v11)
  {
    [*(id *)(a1 + 48) addObject:v11];
  }
  else
  {
    id v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v15;
      _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Failed to instantiate MAAutoAsset: %{public}@", buf, 0xCu);
    }

    uint64_t v13 = *(void *)(a1 + 56);
    id v14 = +[TRIMAProvider fetchRetryDateFromAttribution:*(void *)(a1 + 40) isDeferral:0];
    (*(void (**)(uint64_t, uint64_t, void, void *, id))(v13 + 16))(v13, 3, 0, v14, v15);

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_490(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = (void *)v4[1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_2;
  v8[3] = &unk_1E6BBB7E0;
  uint64_t v6 = *(void *)(a1 + 64);
  id v9 = v3;
  uint64_t v14 = v6;
  BOOL v10 = v4;
  id v13 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v7 = v3;
  [v5 runWithLockAcquired:v8];
}

void __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3[9])
  {
    id v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "Asked to defer but the deferral handler has already been removed", (uint8_t *)&v10, 2u);
    }
  }
  else if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
      xpc_activity_remove_eligibility_changed_handler();
    }
    v3[9] = 1;
    id v5 = (void *)xpc_activity_copy_identifier();
    uint64_t v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136446210;
      id v11 = v5;
      _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "Cancelling operation due to deferral of XPC activity: %{public}s", (uint8_t *)&v10, 0xCu);
    }

    free(v5);
    [*(id *)(a1 + 40) cancel];
    v3[8] = 1;
    uint64_t v7 = *(void *)(a1 + 64);
    id v8 = +[TRIMAProvider fetchRetryDateFromAttribution:*(void *)(a1 + 48) isDeferral:1];
    (*(void (**)(uint64_t, uint64_t, uint64_t, void *, void))(v7 + 16))(v7, 1, 1, v8, 0);

    id v9 = *(NSObject **)(a1 + 56);
    if (v9) {
      dispatch_group_leave(v9);
    }
  }
}

void __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_494(uint64_t a1)
{
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__25;
  v23[4] = __Block_byref_object_dispose__25;
  id v24 = 0;
  v2 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_495;
  v15[3] = &unk_1E6BBB880;
  id v16 = v2;
  id v17 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v22 = *(void *)(a1 + 104);
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = *(void **)(a1 + 64);
  id v18 = v3;
  uint64_t v19 = v4;
  id v20 = v5;
  id v21 = v23;
  [v16 enumerateObjectsUsingBlock:v15];
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = (void *)v6[1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_506;
  v8[3] = &unk_1E6BBB8A8;
  uint64_t v13 = *(void *)(a1 + 96);
  uint64_t v14 = v23;
  id v9 = v6;
  id v12 = *(id *)(a1 + 88);
  id v10 = *(id *)(a1 + 72);
  id v11 = *(id *)(a1 + 80);
  [v7 runWithLockAcquired:v8];

  _Block_object_dispose(v23, 8);
}

void __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_495(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_2_496;
  v35[3] = &unk_1E6BB8450;
  uint64_t v37 = a3;
  id v36 = *(id *)(a1 + 32);
  id v8 = (void (**)(void))MEMORY[0x1E016EA80](v35);
  if ([*(id *)(a1 + 40) isCanceled])
  {
    id v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEFAULT, "Download thread terminated due to delayed handling of task teardown.", (uint8_t *)&buf, 2u);
    }

    v8[2](v8);
    *a4 = 1;
  }
  else
  {
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    [*(id *)(a1 + 40) addSemaphore:v10];
    [*(id *)(a1 + 40) setCurrentAsset:v7];
    id v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v7 assetSelector];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_1DA291000, v11, OS_LOG_TYPE_DEFAULT, "Requesting download/lock of MAAutoAsset: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v43 = 0x3032000000;
    id v44 = __Block_byref_object_copy__25;
    v45 = __Block_byref_object_dispose__25;
    id v46 = 0;
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_498;
    v32[3] = &unk_1E6BBB830;
    id v15 = *(void **)(a1 + 64);
    uint64_t v34 = *(void *)(a1 + 80);
    v32[4] = v13;
    id v33 = v15;
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_503;
    v28 = &unk_1E6BBB858;
    uint64_t v16 = *(void *)(a1 + 72);
    p_long long buf = &buf;
    uint64_t v31 = v16;
    id v17 = v10;
    v29 = v17;
    [v7 lockContent:@"transiently required by Trial" withUsagePolicy:v14 withTimeout:-1 reportingProgress:v32 completion:&v25];
    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      id v18 = TRILogCategory_Server();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = objc_msgSend(v7, "assetSelector", v25, v26, v27, v28);
        uint64_t v20 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)v38 = 138543618;
        id v39 = v19;
        __int16 v40 = 2114;
        uint64_t v41 = v20;
        _os_log_impl(&dword_1DA291000, v18, OS_LOG_TYPE_DEFAULT, "Successfully locked MAAutoAsset: %{public}@ at path: %{public}@", v38, 0x16u);
      }
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 40), "isCanceled", v25, v26, v27, v28))
      {
        id v21 = TRILogCategory_Server();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = [v7 assetSelector];
          *(_DWORD *)v38 = 138543362;
          id v39 = v22;
          _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "Failed to lock MAAutoAsset: %{public}@: Download operation was cancelled.", v38, 0xCu);
        }
      }
      else
      {
        id v21 = TRILogCategory_Server();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v23 = [v7 assetSelector];
          uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
          *(_DWORD *)v38 = 138543618;
          id v39 = v23;
          __int16 v40 = 2114;
          uint64_t v41 = v24;
          _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "Failed to lock MAAutoAsset: %{public}@: %{public}@", v38, 0x16u);
        }
      }

      v8[2](v8);
      *a4 = 1;
    }

    _Block_object_dispose(&buf, 8);
  }
}

void __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_2_496(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    unint64_t v2 = 0;
    do
    {
      id v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v2];
      id v4 = (id)[v3 endLockUsageSync:@"transiently required by Trial"];

      ++v2;
    }
    while (v2 < *(void *)(a1 + 40));
  }
}

void __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_498(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4FB0178]);
  id v5 = [v3 assetSelector];
  uint64_t v6 = [v5 assetType];
  id v7 = [v3 assetSelector];
  id v8 = [v7 assetSpecifier];
  id v9 = [v3 assetSelector];
  dispatch_semaphore_t v10 = [v9 assetVersion];

  if (!v10)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"TRIMAProviding.m", 563, @"Expression was unexpectedly nil/false: %@", @"status.assetSelector.assetVersion" object file lineNumber description];
  }
  id v11 = (void *)[v4 initWithType:v6 specifier:v8 version:v10];

  id v12 = [v3 downloadProgress];
  double v13 = (double)[v12 totalWrittenBytes];
  uint64_t v14 = [v3 downloadProgress];
  double v15 = v13 / (double)[v14 totalExpectedBytes];

  uint64_t v16 = TRILogCategory_Server();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    double v19 = v15;
    __int16 v20 = 2114;
    id v21 = v11;
    _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "Reporting progress: %f for assetId: %{public}@", buf, 0x16u);
  }

  [*(id *)(a1 + 40) setFractionCompleted:v11 forMAAsset:v15];
}

void __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_503(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6)
{
  id v8 = a4;
  id v9 = a6;
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;
  id v15 = v8;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  double v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v9;
  id v14 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __79__TRIMAProvider_downloadAssets_attribution_aggregateProgress_group_completion___block_invoke_506(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!v3[8])
  {
    uint64_t v10 = v3;
    if (!v3[9])
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        xpc_activity_remove_eligibility_changed_handler();
        id v4 = v10;
      }
      v4[9] = 1;
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      uint64_t v5 = 1;
    }
    else if ([*(id *)(a1 + 32) isCanceled])
    {
      uint64_t v5 = 4;
    }
    else
    {
      uint64_t v5 = 2;
    }
    uint64_t v6 = *(void *)(a1 + 56);
    id v7 = +[TRIMAProvider fetchRetryDateFromAttribution:*(void *)(a1 + 40) isDeferral:0];
    (*(void (**)(uint64_t, uint64_t, void, void *, void))(v6 + 16))(v6, v5, 0, v7, *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));

    id v8 = *(NSObject **)(a1 + 48);
    if (v8) {
      dispatch_group_leave(v8);
    }
  }
  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

@end