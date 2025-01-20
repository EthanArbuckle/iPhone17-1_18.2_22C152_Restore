@interface PLComputeCacheManager
+ (BOOL)isEnabledWithPathManager:(id)a3 error:(id *)a4;
+ (BOOL)shouldPublishAnalyticsForRestoreError:(id)a3;
+ (id)_urlForLocation:(int64_t)a3 pathManager:(id)a4 createIfNeeded:(BOOL)a5 error:(id *)a6;
+ (id)baseURLFromPathManager:(id)a3;
+ (id)name;
+ (id)payloadClasses;
+ (id)restorePayloadClasses;
- (BOOL)_addBackupCreatedMarkerWithError:(id *)a3;
- (BOOL)_archivePrepareDirectoryWithError:(id *)a3;
- (BOOL)_archiveSnapshotIfNecessaryWithError:(id *)a3;
- (BOOL)_archiveSnapshotWithError:(id *)a3;
- (BOOL)_cleanupLegacyArchiveURL:(id)a3 replacementURL:(id)a4 error:(id *)a5;
- (BOOL)_createArchiveWithError:(id *)a3;
- (BOOL)_getRestoreCount:(signed __int16 *)a3 error:(id *)a4;
- (BOOL)_hasBackupArchive;
- (BOOL)_hasBackupCreatedMarker;
- (BOOL)_hasPrepareDataToBackupWithError:(id *)a3;
- (BOOL)_incrementRestoreCount:(signed __int16 *)a3 error:(id *)a4;
- (BOOL)_isInitialSyncWithInitialSyncDate:(id)a3;
- (BOOL)_isValidArchiveURL:(id)a3 filenameExclusionList:(id)a4;
- (BOOL)_performSnapshotWithError:(id *)a3;
- (BOOL)_removeComputeCacheDataForMatchingRestoreState:(int64_t)a3 error:(id *)a4;
- (BOOL)_removeLocation:(int64_t)a3 error:(id *)a4;
- (BOOL)_removeRestoreDataWithError:(id *)a3;
- (BOOL)_removeSnapshotWithError:(id *)a3;
- (BOOL)_restoreComputeCacheArchiveWithProgress:(id)a3 error:(id *)a4;
- (BOOL)_restoreComputeCacheWithProgress:(id)a3 error:(id *)a4;
- (BOOL)_snapshotJournalsWithError:(id *)a3;
- (BOOL)_transferAndPrepareComputeCacheFromBackupToRestoreLocationWithError:(id *)a3;
- (BOOL)_transferToBackupLocationWithError:(id *)a3;
- (BOOL)coalesceJournalsForPayloadClassIDs:(id)a3 withChangeJournalOverThreshold:(float)a4 error:(id *)a5;
- (BOOL)createArchiveWithError:(id *)a3;
- (BOOL)isReadyForAnalysis;
- (BOOL)resetComputeCacheWithError:(id *)a3;
- (BOOL)restoreComputeCacheWithProgress:(id)a3 error:(id *)a4;
- (BOOL)snapshotComputeCacheAndBackupIfNeededWithError:(id *)a3;
- (BOOL)snapshotJournalsForPayloadClassIDs:(id)a3 error:(id *)a4;
- (PLComputeCacheManager)initWithLibraryServicesManager:(id)a3;
- (id)_cachedPolicyConfiguration;
- (id)_filenameExclusionList;
- (id)_newTransientContext;
- (id)_shortLivedLibrary;
- (id)_snapshotPolicy;
- (id)managedObjectContext;
- (id)resolveLocalIdentifiersForCloudIdentifiers:(id)a3 error:(id *)a4;
- (id)status;
- (id)statusFromPolicy:(id)a3;
- (int64_t)_iCloudBackupState;
- (int64_t)_libraryAssetCount;
- (int64_t)_performBlockOnRestoreStateLockAndWait:(id)a3;
- (int64_t)_restoreState;
- (unint64_t)_getArchiveSize;
- (void)_cleanupLegacyArchiveFilename;
- (void)_enumerateComputeCachePrepareDirectoryUsingBlock:(id)a3;
- (void)_publish;
- (void)_resetRestoreState;
- (void)_setICloudBackupRestoreDateFromArchive;
- (void)_setRestoreState:(int64_t)a3;
- (void)_updateCachedPolicyConfigurationWithCPLConfiguration:(id)a3;
- (void)coalesceJournalsForPayloadClassIDs:(id)a3 withChangeJournalOverThreshold:(float)a4 completionHandler:(id)a5;
- (void)notifyCPLConfiguration:(id)a3;
- (void)notifyReadyToRestoreWithInitialSyncDate:(id)a3;
- (void)performTransactionAndWait:(id)a3;
- (void)snapshotJournalsForPayloadClassIDs:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation PLComputeCacheManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudBackupRestoreDateStart, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_restoreCachePhotoLibrary, 0);
  objc_storeStrong((id *)&self->_restoreState, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_journalManager, 0);
  objc_destroyWeak((id *)&self->_lsm);
}

- (id)resolveLocalIdentifiersForCloudIdentifiers:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__66748;
  v19 = __Block_byref_object_dispose__66749;
  id v20 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  v7 = [WeakRetained cloudPhotoLibraryManager];

  if (v7)
  {
    dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_211_66750);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__PLComputeCacheManager_resolveLocalIdentifiersForCloudIdentifiers_error___block_invoke_2;
    v12[3] = &unk_1E586D8E8;
    v14 = &v15;
    id v9 = v8;
    id v13 = v9;
    [v7 resolveLocalIdentifiersForCloudIdentifiers:v5 completionHandler:v12];
    dispatch_block_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __74__PLComputeCacheManager_resolveLocalIdentifiersForCloudIdentifiers_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performTransactionAndWait:(id)a3
{
}

- (id)managedObjectContext
{
  return [(PLPhotoLibrary *)self->_restoreCachePhotoLibrary managedObjectContext];
}

- (id)_shortLivedLibrary
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  self = (PLComputeCacheManager *)((char *)self + 8);
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.isa);
  v7 = [v3 stringWithFormat:@"%@ - identifier:%td", v5, objc_msgSend(WeakRetained, "wellKnownPhotoLibraryIdentifier")];

  id v8 = objc_loadWeakRetained((id *)&self->super.isa);
  id v9 = [v8 databaseContext];
  id v10 = v7;
  v11 = objc_msgSend(v9, "newShortLivedLibraryWithName:", objc_msgSend(v10, "UTF8String"));

  return v11;
}

- (int64_t)_libraryAssetCount
{
  v3 = [(PLComputeCacheManager *)self _shortLivedLibrary];
  id v4 = [[PLComputeCachePolicyDataSource alloc] initWithPhotoLibrary:v3 restoreState:[(PLComputeCacheManager *)self _restoreState]];
  uint64_t v5 = [(PLComputeCachePolicyDataSource *)v4 assetCount];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t v6 = -1;
  }
  else {
    int64_t v6 = v5;
  }

  return v6;
}

- (id)_newTransientContext
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
  id v4 = (void *)MEMORY[0x1E4F8B908];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  int64_t v6 = [WeakRetained pathManager];
  v7 = [v6 libraryURL];
  id v8 = [v4 redactedDescriptionForFileURL:v7];

  id v9 = NSString;
  id v10 = [(PLJournalManagerCore *)self->_journalManager name];
  v11 = [v9 stringWithFormat:@"ComputeCacheManager[%@] transient context (%@)", v10, v8];
  [v3 setName:v11];

  id v12 = objc_loadWeakRetained((id *)&self->_lsm);
  id v13 = [v12 persistentStoreCoordinator];
  [v3 setPersistentStoreCoordinator:v13];

  [v3 setStalenessInterval:0.0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __45__PLComputeCacheManager__newTransientContext__block_invoke;
  v17[3] = &unk_1E5875E18;
  id v14 = v3;
  id v18 = v14;
  v19 = self;
  [v14 performBlockAndWait:v17];
  id v15 = v14;

  return v15;
}

void __45__PLComputeCacheManager__newTransientContext__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  v2 = [WeakRetained pathManager];
  v3 = [*(id *)(a1 + 32) userInfo];
  [v3 setObject:v2 forKeyedSubscript:@"com.apple.photos.PLModelMigratorPathManagerKey"];
}

- (id)_cachedPolicyConfiguration
{
  v2 = (void *)MEMORY[0x1E4F8B858];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  id v4 = [WeakRetained libraryURL];
  uint64_t v5 = [v2 appPrivateDataForLibraryURL:v4];

  int64_t v6 = [v5 valueForKeyPath:@"ComputeCache.PolicyConfiguration"];
  v7 = [[PLComputeCachePolicyConfiguration alloc] initWithConfigurationDictionary:v6];

  return v7;
}

- (void)_updateCachedPolicyConfigurationWithCPLConfiguration:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 valueForKey:@"computecache.policyconfiguration"];
  uint64_t v5 = (void *)MEMORY[0x1E4F8B858];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  v7 = [WeakRetained libraryURL];
  id v8 = [v5 appPrivateDataForLibraryURL:v7];

  uint64_t v9 = [v8 valueForKeyPath:@"ComputeCache.PolicyConfiguration"];
  id v10 = (void *)v9;
  if (v4 | v9 && ([(id)v9 isEqual:v4] & 1) == 0)
  {
    v11 = PLMigrationGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      uint64_t v13 = v4;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "ComputeCacheManager: updating app private data policy configuration from CPL with dictionary: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    [v8 setValue:v4 forKeyPath:@"ComputeCache.PolicyConfiguration"];
  }
}

- (id)statusFromPolicy:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v3 snapshotAllowed]) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  [v4 setObject:v5 forKey:@"Snapshot Allowed"];
  if ([v3 snapshotRequired]) {
    int64_t v6 = @"YES";
  }
  else {
    int64_t v6 = @"NO";
  }
  [v4 setObject:v6 forKey:@"Snapshot Required"];
  v7 = PLStringFromPLComputeCacheSnapshotDenyPolicyShort([v3 denyPolicy]);
  if (v7) {
    [v4 setObject:v7 forKey:@"Snapshot Deny Policy"];
  }

  uint64_t v8 = [v3 denyPolicy];
  if ((unint64_t)(v8 - 1) > 4) {
    uint64_t v9 = @"Snapshot enabled. Check allow policy";
  }
  else {
    uint64_t v9 = off_1E5870060[v8 - 1];
  }
  id v10 = v9;
  [v4 setObject:v10 forKey:@"Snapshot Deny Policy Reason"];

  if (![v3 denyPolicy])
  {
    v11 = PLStringFromPLComputeCacheSnapshotAllowPolicyShort([v3 allowPolicy]);
    if (v11) {
      [v4 setObject:v11 forKey:@"Snapshot Allow Policy"];
    }

    uint64_t v12 = [v3 allowPolicy];
    uint64_t v13 = @"Snapshot disabled. Snapshot is current";
    if (v12 == 1) {
      uint64_t v13 = @"Snapshot required. Snapshot is out of date";
    }
    if (v12 == 2) {
      uint64_t v13 = @"Snapshot required. Snapshot has deleted asset records";
    }
    uint64_t v14 = v13;
    [v4 setObject:v14 forKey:@"Snapshot Allow Policy Reason"];
  }
  id v15 = [v3 reason];
  if (v15) {
    [v4 setObject:v15 forKey:@"Snapshot Reason"];
  }

  return v4;
}

- (id)status
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__66748;
  id v20 = __Block_byref_object_dispose__66749;
  id v21 = 0;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __31__PLComputeCacheManager_status__block_invoke;
  v15[3] = &unk_1E5875E68;
  v15[4] = self;
  v15[5] = &v16;
  dispatch_sync(queue, v15);
  uint64_t v5 = [(PLComputeCacheManager *)self _restoreState];
  BOOL v6 = [(PLComputeCacheManager *)self isReadyForAnalysis];
  v7 = @"NO";
  if (v6) {
    v7 = @"YES";
  }
  uint64_t v8 = v7;
  [v3 setObject:v8 forKey:@"Ready for Analysis"];

  uint64_t v9 = PLStringFromPLComputeCacheRestoreStateShort(v5);
  if (v9) {
    [v3 setObject:v9 forKey:@"Restore State"];
  }

  id v10 = [(id)v17[5] configuration];
  v11 = v10;
  if (v5 == 3)
  {
    uint64_t v12 = @"The restore is currently active";
LABEL_13:

LABEL_14:
    [v3 setObject:v12 forKey:@"Restore State Reason"];
    goto LABEL_15;
  }
  if (v5 != 2)
  {
    if (v5 == 1) {
      uint64_t v12 = @"The compute cache archive was created on this device";
    }
    else {
      uint64_t v12 = @"There is no compute cache to restore";
    }
    goto LABEL_13;
  }
  if ([v10 isRestoreEnabled])
  {
    uint64_t v12 = @"The compute cache archive is available for restore";
    goto LABEL_13;
  }
  uint64_t v12 = [@"The compute cache archive is available for restore" stringByAppendingString:@", but disabled by the configuration"];

  if (v12) {
    goto LABEL_14;
  }
LABEL_15:

  uint64_t v13 = [(PLComputeCacheManager *)self statusFromPolicy:v17[5]];
  [v3 addEntriesFromDictionary:v13];

  _Block_object_dispose(&v16, 8);
  return v3;
}

void __31__PLComputeCacheManager_status__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _snapshotPolicy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_setICloudBackupRestoreDateFromArchive
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  uint64_t v5 = [WeakRetained pathManager];
  BOOL v6 = [v3 _urlForLocation:6 pathManager:v5 createIfNeeded:0 error:0];

  id v7 = v6;
  memset(&v15, 0, sizeof(v15));
  if (stat((const char *)[v7 fileSystemRepresentation], &v15))
  {
    uint64_t v8 = PLMigrationGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = *__error();
      id v10 = __error();
      v11 = strerror(*v10);
      *(_DWORD *)buf = 67109378;
      int v17 = v9;
      __int16 v18 = 2080;
      v19 = v11;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Unable to stat the archive for the start date. Stat error[%d]: %s", buf, 0x12u);
    }

    iCloudBackupRestoreDateStart = self->_iCloudBackupRestoreDateStart;
    self->_iCloudBackupRestoreDateStart = 0;
  }
  else
  {
    iCloudBackupRestoreDateStart = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)v15.st_ctimespec.tv_sec];
    uint64_t v13 = (NSDate *)[iCloudBackupRestoreDateStart copy];
    uint64_t v14 = self->_iCloudBackupRestoreDateStart;
    self->_iCloudBackupRestoreDateStart = v13;
  }
}

- (BOOL)_cleanupLegacyArchiveURL:(id)a3 replacementURL:(id)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PLComputeCacheManager.m", 1176, @"Invalid parameter not satisfying: %@", @"legacyURL" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"PLComputeCacheManager.m", 1177, @"Invalid parameter not satisfying: %@", @"replacementURL" object file lineNumber description];

LABEL_3:
  id v28 = 0;
  int v12 = [v9 checkResourceIsReachableAndReturnError:&v28];
  id v13 = v28;
  id v14 = v13;
  if (!v12)
  {
    if ((PLIsErrorFileNotFound() & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  id v27 = v13;
  int v15 = [v11 checkResourceIsReachableAndReturnError:&v27];
  id v16 = v27;

  if (v15)
  {
    id v26 = v16;
    char v17 = [MEMORY[0x1E4F8B908] removeItemAtURL:v9 error:&v26];
    id v14 = v26;

    if ((v17 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_11:
    BOOL v20 = 1;
    goto LABEL_18;
  }
  if (PLIsErrorFileNotFound())
  {
    __int16 v18 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v25 = v16;
    char v19 = [v18 moveItemAtURL:v9 toURL:v11 error:&v25];
    id v14 = v25;

    if (v19) {
      goto LABEL_11;
    }
  }
  else
  {
    id v14 = v16;
  }
LABEL_13:
  id v21 = PLMigrationGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v14;
    _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to cleanup legacy archive location. Error: %@", buf, 0xCu);
  }

  if (a5)
  {
    id v14 = v14;
    BOOL v20 = 0;
    *a5 = v14;
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_18:

  return v20;
}

- (void)_cleanupLegacyArchiveFilename
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  uint64_t v5 = [WeakRetained pathManager];
  BOOL v6 = [v3 _urlForLocation:1 pathManager:v5 createIfNeeded:0 error:0];

  id v7 = [v6 URLByDeletingLastPathComponent];
  uint64_t v8 = [v7 URLByAppendingPathComponent:@"computecache.aar"];

  id v30 = 0;
  BOOL v9 = [(PLComputeCacheManager *)self _cleanupLegacyArchiveURL:v8 replacementURL:v6 error:&v30];
  id v10 = v30;
  if (v9)
  {
    v11 = objc_opt_class();
    id v12 = objc_loadWeakRetained((id *)&self->_lsm);
    id v13 = [v12 pathManager];
    id v14 = [v11 _urlForLocation:4 pathManager:v13 createIfNeeded:0 error:0];

    int v15 = [v14 URLByDeletingLastPathComponent];
    id v16 = [v15 URLByAppendingPathComponent:@"computecache.aar"];

    id v29 = v10;
    LODWORD(v15) = [(PLComputeCacheManager *)self _cleanupLegacyArchiveURL:v16 replacementURL:v14 error:&v29];
    id v17 = v29;

    if (v15)
    {
      __int16 v18 = objc_opt_class();
      id v19 = objc_loadWeakRetained((id *)&self->_lsm);
      BOOL v20 = [v19 pathManager];
      BOOL v6 = [v18 _urlForLocation:6 pathManager:v20 createIfNeeded:0 error:0];

      id v21 = [v6 URLByDeletingLastPathComponent];
      uint64_t v8 = [v21 URLByAppendingPathComponent:@"computecache.aar"];

      id v28 = v17;
      BOOL v22 = [(PLComputeCacheManager *)self _cleanupLegacyArchiveURL:v8 replacementURL:v6 error:&v28];
      id v10 = v28;

      id v23 = v10;
      if (v22) {
        goto LABEL_12;
      }
    }
    else
    {
      id v10 = v17;
      BOOL v6 = v14;
      uint64_t v8 = v16;
    }
  }
  v24 = PLMigrationGetLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v10;
    _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Resetting compute cache after failing to cleanup legacy archive. Error: %@", buf, 0xCu);
  }

  id v27 = v10;
  BOOL v25 = [(PLComputeCacheManager *)self resetComputeCacheWithError:&v27];
  id v23 = v27;

  if (!v25)
  {
    id v26 = PLMigrationGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v23;
      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to reset compute cache. Error: %@", buf, 0xCu);
    }
  }
LABEL_12:
}

- (BOOL)_archivePrepareDirectoryWithError:(id *)a3
{
  v48[1] = *MEMORY[0x1E4F143B8];
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 1;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__66748;
  v41 = __Block_byref_object_dispose__66749;
  id v42 = 0;
  p_lsm = &self->_lsm;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  id v7 = [WeakRetained clientSideEncryptionManager];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    *((unsigned char *)v44 + 24) = 0;
    id v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = *MEMORY[0x1E4F28228];
    v48[0] = @"Encryption manager not initialized";
    id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
    uint64_t v28 = [v26 errorWithDomain:*MEMORY[0x1E4F8C500] code:52011 userInfo:v27];
    id v29 = (void *)v38[5];
    v38[5] = v28;

    if (a3) {
      *a3 = (id) v38[5];
    }
    int v25 = *((unsigned __int8 *)v44 + 24);
  }
  else
  {
    BOOL v9 = objc_opt_class();
    id v10 = objc_loadWeakRetained((id *)p_lsm);
    v11 = [v10 pathManager];
    id v12 = [v9 _urlForLocation:1 pathManager:v11 createIfNeeded:1 error:0];

    id v13 = objc_opt_class();
    id v14 = objc_loadWeakRetained((id *)p_lsm);
    int v15 = [v14 pathManager];
    id v16 = [v13 _urlForLocation:0 pathManager:v15 createIfNeeded:1 error:0];

    id v17 = [(PLComputeCacheManager *)self _filenameExclusionList];
    dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
    id v19 = objc_loadWeakRetained((id *)p_lsm);
    BOOL v20 = [v19 clientSideEncryptionManager];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __59__PLComputeCacheManager__archivePrepareDirectoryWithError___block_invoke;
    v35[3] = &unk_1E586D898;
    v35[4] = self;
    id v21 = v17;
    id v36 = v21;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __59__PLComputeCacheManager__archivePrepareDirectoryWithError___block_invoke_2;
    v31[3] = &unk_1E586D8C0;
    uint64_t v33 = &v43;
    v34 = &v37;
    v31[4] = self;
    BOOL v22 = v18;
    id v32 = v22;
    [v20 archiveDirectoryAtURL:v16 toOutputURL:v12 dataType:1 options:0 entryPredicate:v35 completionHandler:v31];

    dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
    LODWORD(v20) = *((unsigned __int8 *)v44 + 24);
    id v23 = (id)v38[5];
    v24 = v23;
    if (!v20 && a3) {
      *a3 = v23;
    }

    int v25 = *((unsigned __int8 *)v44 + 24);
  }
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  return v25 != 0;
}

uint64_t __59__PLComputeCacheManager__archivePrepareDirectoryWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isValidArchiveURL:a2 filenameExclusionList:*(void *)(a1 + 40)];
}

void __59__PLComputeCacheManager__archivePrepareDirectoryWithError___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v7 = PLMigrationGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      id v15 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to create archive. Error: %@", buf, 0xCu);
    }

    BOOL v9 = *(void **)(a1 + 32);
    id v13 = 0;
    char v10 = [v9 _removeLocation:1 error:&v13];
    id v11 = v13;
    if ((v10 & 1) == 0)
    {
      id v12 = PLMigrationGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v11;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to remove archive. Error: %@", buf, 0xCu);
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_isValidArchiveURL:(id)a3 filenameExclusionList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = [(PLComputeCacheManager *)self _filenameExclusionList];
  }
  id v12 = 0;
  [v6 getResourceValue:&v12 forKey:*MEMORY[0x1E4F1C628] error:0];
  id v8 = v12;
  if ([v8 BOOLValue])
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    uint64_t v11 = 0;
    [v6 getResourceValue:&v11 forKey:*MEMORY[0x1E4F1C6E8] error:0];
    int v9 = [v7 containsObject:v11] ^ 1;
  }

  return v9;
}

- (id)_filenameExclusionList
{
  uint64_t v3 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  uint64_t v5 = [WeakRetained pathManager];
  id v6 = [v3 _urlForLocation:2 pathManager:v5 createIfNeeded:0 error:0];
  id v7 = [v6 lastPathComponent];

  id v8 = objc_opt_class();
  id v9 = objc_loadWeakRetained((id *)&self->_lsm);
  char v10 = [v9 pathManager];
  uint64_t v11 = [v8 _urlForLocation:1 pathManager:v10 createIfNeeded:1 error:0];
  id v12 = [v11 lastPathComponent];

  id v13 = [(PLJournalManagerCore *)self->_journalManager historyTokenURL];
  id v14 = [v13 lastPathComponent];

  id v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v7, v12, v14, 0);

  return v15;
}

- (void)_enumerateComputeCachePrepareDirectoryUsingBlock:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, char *))a3;
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
    id v7 = [WeakRetained pathManager];
    id v8 = [v5 _urlForLocation:0 pathManager:v7 createIfNeeded:0 error:0];

    id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v10 = *MEMORY[0x1E4F1C628];
    v26[0] = *MEMORY[0x1E4F1C6E8];
    v26[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    id v12 = [v9 enumeratorAtURL:v8 includingPropertiesForKeys:v11 options:7 errorHandler:0];

    id v13 = [(PLComputeCacheManager *)self _filenameExclusionList];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
LABEL_4:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v21 + 1) + 8 * v18);
        if ([(PLComputeCacheManager *)self _isValidArchiveURL:v19 filenameExclusionList:v13])
        {
          char v20 = 0;
          v4[2](v4, v19, &v20);
          if (v20) {
            break;
          }
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v16) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (unint64_t)_getArchiveSize
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  uint64_t v5 = [WeakRetained pathManager];
  id v6 = [v3 _urlForLocation:6 pathManager:v5 createIfNeeded:0 error:0];

  id v14 = 0;
  uint64_t v7 = *MEMORY[0x1E4F1C5F8];
  id v13 = 0;
  LOBYTE(v5) = [v6 getResourceValue:&v14 forKey:v7 error:&v13];
  id v8 = v14;
  id v9 = v13;
  if ((v5 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
  {
    uint64_t v10 = PLMigrationGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to get the file size from the archive. Error: %@", buf, 0xCu);
    }
  }
  unint64_t v11 = [v8 unsignedIntegerValue];

  return v11;
}

- (BOOL)_getRestoreCount:(signed __int16 *)a3 error:(id *)a4
{
  v38[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v7 = objc_opt_class();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
    id v9 = [WeakRetained pathManager];
    uint64_t v10 = [v7 _urlForLocation:6 pathManager:v9 createIfNeeded:0 error:0];

    id v32 = 0;
    LOBYTE(WeakRetained) = [v10 checkResourceIsReachableAndReturnError:&v32];
    id v11 = v32;
    if (WeakRetained)
    {
      unsigned __int16 value = 0;
      ssize_t v12 = getxattr((const char *)[v10 fileSystemRepresentation], (const char *)objc_msgSend(@"com.apple.Photos.computecacherestorecount", "UTF8String"), &value, 2uLL, 0, 0);
      if (v12 == 2)
      {
        unsigned int v13 = bswap32(value) >> 16;
      }
      else
      {
        if (v12 < 0 && *__error() != 93)
        {
          uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v18 = *MEMORY[0x1E4F28798];
          uint64_t v19 = *__error();
          uint64_t v37 = *MEMORY[0x1E4F28228];
          char v20 = NSString;
          long long v21 = __error();
          long long v22 = objc_msgSend(v20, "stringWithFormat:", @"%s", strerror(*v21));
          v38[0] = v22;
          long long v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
          long long v24 = [v17 errorWithDomain:v18 code:v19 userInfo:v23];

          int v25 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v26 = *MEMORY[0x1E4F8C500];
          uint64_t v35 = *MEMORY[0x1E4F28A50];
          id v36 = v24;
          id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
          uint64_t v28 = [v25 errorWithDomain:v26 code:52002 userInfo:v27];

          id v29 = PLMigrationGetLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v28;
            _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to get the increment count. Error: %@", buf, 0xCu);
          }

          id v30 = v28;
          id v15 = v30;
          if (a4)
          {
            id v15 = v30;
            BOOL v14 = 0;
            *a4 = v15;
          }
          else
          {
            BOOL v14 = 0;
          }
          goto LABEL_11;
        }
        LOWORD(v13) = 0;
      }
      *a3 = v13;
    }
    id v15 = v11;
    BOOL v14 = 1;
LABEL_11:

    return v14;
  }
  return 1;
}

- (BOOL)_incrementRestoreCount:(signed __int16 *)a3 error:(id *)a4
{
  v43[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  id v9 = [WeakRetained pathManager];
  uint64_t v10 = [v7 _urlForLocation:6 pathManager:v9 createIfNeeded:0 error:0];

  id v37 = 0;
  LODWORD(v9) = [v10 checkResourceIsReachableAndReturnError:&v37];
  id v11 = v37;
  ssize_t v12 = v11;
  if (!v9)
  {
    uint64_t v28 = PLMigrationGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v12;
      _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEBUG, "ComputeCacheManager: Increment: Backup resource is not available. Error: %@", buf, 0xCu);
    }

    goto LABEL_10;
  }
  unsigned __int16 v36 = 0;
  id v35 = v11;
  BOOL v13 = [(PLComputeCacheManager *)self _getRestoreCount:&v36 error:&v35];
  id v14 = v35;

  if (!v13)
  {
    id v29 = PLMigrationGetLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v14;
      _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to increment count, missing initial value. Error: %@", buf, 0xCu);
    }

    goto LABEL_14;
  }
  unsigned int v15 = ++v36;
  __int16 value = bswap32(v15) >> 16;
  if (setxattr((const char *)[v10 fileSystemRepresentation], (const char *)objc_msgSend(@"com.apple.Photos.computecacherestorecount", "UTF8String"), &value, 2uLL, 0, 0))
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28798];
    uint64_t v18 = *__error();
    uint64_t v42 = *MEMORY[0x1E4F28228];
    uint64_t v19 = NSString;
    char v20 = __error();
    long long v21 = objc_msgSend(v19, "stringWithFormat:", @"%s", strerror(*v20));
    v43[0] = v21;
    long long v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
    long long v23 = [v16 errorWithDomain:v17 code:v18 userInfo:v22];

    long long v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F8C500];
    uint64_t v40 = *MEMORY[0x1E4F28A50];
    v41 = v23;
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    ssize_t v12 = [v24 errorWithDomain:v25 code:52002 userInfo:v26];

    id v27 = PLMigrationGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v12;
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to increment the restore count. Error: %@", buf, 0xCu);
    }

LABEL_10:
    id v14 = v12;
LABEL_14:
    id v30 = v14;
    id v31 = v30;
    if (a4)
    {
      id v31 = v30;
      BOOL v32 = 0;
      *a4 = v31;
    }
    else
    {
      BOOL v32 = 0;
    }
    goto LABEL_20;
  }
  if (a3) {
    *a3 = v36;
  }
  id v31 = v14;
  BOOL v32 = 1;
LABEL_20:

  return v32;
}

- (BOOL)_removeLocation:(int64_t)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  id v9 = [WeakRetained pathManager];
  uint64_t v10 = [v7 _urlForLocation:a3 pathManager:v9 createIfNeeded:0 error:0];

  id v15 = 0;
  char v11 = [MEMORY[0x1E4F8B908] removeItemAtURL:v10 error:&v15];
  id v12 = v15;
  if ((v11 & 1) == 0)
  {
    BOOL v13 = PLMigrationGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      int64_t v17 = a3;
      __int16 v18 = 2112;
      id v19 = v12;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to remove location %tu. Error: %@", buf, 0x16u);
    }

    if (a4) {
      *a4 = v12;
    }
  }

  return v11;
}

- (BOOL)_removeComputeCacheDataForMatchingRestoreState:(int64_t)a3 error:(id *)a4
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  __int16 v18 = __Block_byref_object_copy__66748;
  id v19 = __Block_byref_object_dispose__66749;
  id v20 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__PLComputeCacheManager__removeComputeCacheDataForMatchingRestoreState_error___block_invoke;
  v10[3] = &unk_1E586D870;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = &v15;
  v10[7] = a3;
  [(PLComputeCacheManager *)self _performBlockOnRestoreStateLockAndWait:v10];
  int v5 = *((unsigned __int8 *)v12 + 24);
  id v6 = (id)v16[5];
  uint64_t v7 = v6;
  if (!v5 && a4) {
    *a4 = v6;
  }

  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v8;
}

void __78__PLComputeCacheManager__removeComputeCacheDataForMatchingRestoreState_error___block_invoke(void *a1, unint64_t a2)
{
  v37[1] = *MEMORY[0x1E4F143B8];
  if (a2 >= 2)
  {
    if (a2 - 2 >= 2)
    {
      unint64_t v3 = a1[7];
    }
    else
    {
      unint64_t v3 = a1[7];
      if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        id v4 = (void *)a1[4];
        uint64_t v5 = *(void *)(a1[6] + 8);
        id obj = *(id *)(v5 + 40);
        char v6 = [v4 _removeLocation:3 error:&obj];
        objc_storeStrong((id *)(v5 + 40), obj);
        *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v6;
        if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
        {
          uint64_t v7 = (void *)a1[4];
          uint64_t v8 = *(void *)(a1[6] + 8);
          uint64_t v10 = *(void **)(v8 + 40);
          id v9 = (id *)(v8 + 40);
          id v30 = v10;
          char v11 = [v7 _removeLocation:5 error:&v30];
          id v12 = v30;
LABEL_9:
          objc_storeStrong(v9, v12);
          *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v11;
          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
LABEL_11:
    id v19 = objc_msgSend(NSString, "stringWithFormat:", @"Requested to remove the compute cache data with invalid restore state: [current:%td vs request:%td]", a2, v3);
    id v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F8C500];
    uint64_t v36 = *MEMORY[0x1E4F28228];
    v37[0] = v19;
    long long v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
    uint64_t v23 = [v20 errorWithDomain:v21 code:52010 userInfo:v22];
    uint64_t v24 = *(void *)(a1[6] + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

    uint64_t v26 = PLMigrationGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = *(void *)(*(void *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = v27;
      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Error removing the compute cache data. Error: %@", buf, 0xCu);
    }

    goto LABEL_14;
  }
  unint64_t v3 = a1[7];
  if (v3 > 1) {
    goto LABEL_11;
  }
  uint64_t v13 = (void *)a1[4];
  uint64_t v14 = *(void *)(a1[6] + 8);
  id v33 = *(id *)(v14 + 40);
  char v15 = [v13 _removeLocation:5 error:&v33];
  objc_storeStrong((id *)(v14 + 40), v33);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v15;
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    id v16 = (void *)a1[4];
    uint64_t v17 = *(void *)(a1[6] + 8);
    __int16 v18 = *(void **)(v17 + 40);
    id v9 = (id *)(v17 + 40);
    id v32 = v18;
    char v11 = [v16 _removeLocation:0 error:&v32];
    id v12 = v32;
    goto LABEL_9;
  }
LABEL_14:
  uint64_t v28 = a1[4];
  id v29 = *(void **)(v28 + 32);
  *(void *)(v28 + 32) = 0;
}

- (BOOL)_hasBackupArchive
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  uint64_t v5 = [WeakRetained pathManager];
  char v6 = [v3 _urlForLocation:6 pathManager:v5 createIfNeeded:0 error:0];

  id v11 = 0;
  char v7 = [v6 checkResourceIsReachableAndReturnError:&v11];
  id v8 = v11;
  if ((v7 & 1) == 0)
  {
    id v9 = PLMigrationGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "ComputeCacheManager: Backup archive is not available. Error: %@", buf, 0xCu);
    }
  }
  return v7;
}

- (BOOL)_hasBackupCreatedMarker
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  uint64_t v5 = [WeakRetained pathManager];
  char v6 = [v3 _urlForLocation:2 pathManager:v5 createIfNeeded:0 error:0];

  id v11 = 0;
  char v7 = [v6 checkResourceIsReachableAndReturnError:&v11];
  id v8 = v11;
  if ((v7 & 1) == 0)
  {
    id v9 = PLMigrationGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "ComputeCacheManager: Backup marker is not reachable. Error: %@", buf, 0xCu);
    }
  }
  return v7;
}

- (void)_resetRestoreState
{
}

void __43__PLComputeCacheManager__resetRestoreState__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0;
}

- (void)_setRestoreState:(int64_t)a3
{
}

void __42__PLComputeCacheManager__setRestoreState___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;
}

- (int64_t)_performBlockOnRestoreStateLockAndWait:(id)a3
{
  id v4 = (void (**)(id, int64_t))a3;
  p_restoreStateLock = &self->_restoreStateLock;
  os_unfair_lock_lock(&self->_restoreStateLock);
  restoreState = self->_restoreState;
  if (!restoreState)
  {
    self->_restoreState = (NSNumber *)&unk_1EEBEF4C8;
    if ([(PLComputeCacheManager *)self _hasBackupArchive])
    {
      char v7 = self->_restoreState;
      self->_restoreState = (NSNumber *)&unk_1EEBEF498;
    }
    BOOL v8 = [(PLComputeCacheManager *)self _hasBackupCreatedMarker];
    restoreState = self->_restoreState;
    if (v8)
    {
      self->_restoreState = (NSNumber *)&unk_1EEBEF4B0;

      restoreState = self->_restoreState;
    }
  }
  int64_t v9 = [(NSNumber *)restoreState integerValue];
  if (v4) {
    v4[2](v4, v9);
  }
  os_unfair_lock_unlock(p_restoreStateLock);

  return v9;
}

- (int64_t)_restoreState
{
  return [(PLComputeCacheManager *)self _performBlockOnRestoreStateLockAndWait:0];
}

- (BOOL)isReadyForAnalysis
{
  return ([(PLComputeCacheManager *)self _restoreState] & 0xFFFFFFFFFFFFFFFELL) != 2;
}

- (BOOL)_removeRestoreDataWithError:(id *)a3
{
  return [(PLComputeCacheManager *)self _removeComputeCacheDataForMatchingRestoreState:3 error:a3];
}

- (BOOL)_transferAndPrepareComputeCacheFromBackupToRestoreLocationWithError:(id *)a3
{
  v48[1] = *MEMORY[0x1E4F143B8];
  p_lsm = &self->_lsm;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  char v7 = [WeakRetained clientSideEncryptionManager];

  if (v7)
  {
    id v44 = 0;
    BOOL v8 = [(PLComputeCacheManager *)self _removeLocation:3 error:&v44];
    int64_t v9 = v44;
    if (v8)
    {
      uint64_t v10 = objc_opt_class();
      id v11 = objc_loadWeakRetained((id *)p_lsm);
      id v12 = [v11 pathManager];
      id v13 = [v10 _urlForLocation:6 pathManager:v12 createIfNeeded:0 error:0];

      uint64_t v14 = objc_opt_class();
      id v15 = objc_loadWeakRetained((id *)p_lsm);
      id v16 = [v15 pathManager];
      uint64_t v43 = v9;
      uint64_t v17 = [v14 _urlForLocation:4 pathManager:v16 createIfNeeded:1 error:&v43];
      __int16 v18 = v43;

      if (v17)
      {
        id v19 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
        uint64_t v42 = v18;
        char v20 = [v19 copyItemAtURL:v13 toURL:v17 error:&v42];
        int64_t v9 = v42;

        if (v20)
        {

          uint64_t v21 = objc_opt_class();
          id v22 = objc_loadWeakRetained((id *)p_lsm);
          uint64_t v23 = [v22 pathManager];
          id v13 = [v21 _urlForLocation:4 pathManager:v23 createIfNeeded:0 error:0];

          id v24 = objc_loadWeakRetained((id *)p_lsm);
          uint64_t v25 = [v24 clientSideEncryptionManager];
          v41 = v9;
          int v26 = [v25 unarchiveDirectoryAtURL:v13 error:&v41];
          uint64_t v27 = v41;

          if (v26)
          {
            uint64_t v40 = v27;
            char v28 = [MEMORY[0x1E4F8B908] removeItemAtURL:v13 error:&v40];
            int64_t v9 = v40;

            if (v28)
            {

              id v29 = v9;
              BOOL v30 = 1;
LABEL_26:

              goto LABEL_27;
            }
            uint64_t v17 = PLMigrationGetLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              char v46 = v9;
              _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to remove the archive from the restore location. Error: %@", buf, 0xCu);
            }
          }
          else
          {
            id v39 = 0;
            BOOL v35 = [(PLComputeCacheManager *)self _removeLocation:3 error:&v39];
            uint64_t v17 = v39;
            if (!v35)
            {
              uint64_t v36 = PLMigrationGetLog();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                char v46 = v17;
                _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to clean up the restore location. Error: %@", buf, 0xCu);
              }
            }
            int64_t v9 = v27;
          }
        }
        else
        {
          v34 = PLMigrationGetLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            char v46 = v9;
            _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to transfer the backup cache to the restore location. Error: %@", buf, 0xCu);
          }
        }
      }
      else
      {
        uint64_t v17 = PLMigrationGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          char v46 = v18;
          _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to create the restore location. Error: %@", buf, 0xCu);
        }
        int64_t v9 = v18;
      }
    }
    id v37 = v9;
    id v29 = v37;
    if (a3)
    {
      id v29 = v37;
      BOOL v30 = 0;
      *a3 = v29;
    }
    else
    {
      BOOL v30 = 0;
    }
    goto LABEL_26;
  }
  id v31 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v32 = *MEMORY[0x1E4F8C500];
  uint64_t v47 = *MEMORY[0x1E4F28228];
  v48[0] = @"Encryption manager not initialized";
  id v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
  id v29 = [v31 errorWithDomain:v32 code:52011 userInfo:v33];

  if (a3)
  {
    id v29 = v29;
    BOOL v30 = 0;
    *a3 = v29;
  }
  else
  {
    BOOL v30 = 0;
  }
LABEL_27:

  return v30;
}

- (BOOL)_restoreComputeCacheArchiveWithProgress:(id)a3 error:(id *)a4
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [(PLComputeCacheManager *)self _cachedPolicyConfiguration];
  if (([v7 isRestoreEnabled] & 1) == 0)
  {
    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v68 = *MEMORY[0x1E4F28228];
    v69[0] = @"Restore disabled by server configuration";
    char v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:&v68 count:1];
    id v18 = [v19 errorWithDomain:*MEMORY[0x1E4F8C500] code:52006 userInfo:v20];

    uint64_t v21 = PLMigrationGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "ComputeCacheManager: Restore disabled by server configuration", (uint8_t *)&buf, 2u);
    }

    goto LABEL_13;
  }
  [(PLComputeCacheManager *)self _setICloudBackupRestoreDateFromArchive];
  *(_WORD *)v62 = 0;
  id v61 = 0;
  BOOL v8 = [(PLComputeCacheManager *)self _incrementRestoreCount:v62 error:&v61];
  id v9 = v61;
  if (!v8) {
    goto LABEL_9;
  }
  __int16 v10 = *(_WORD *)v62;
  if (*(__int16 *)v62 >= 2)
  {
    iCloudBackupRestoreDateStart = self->_iCloudBackupRestoreDateStart;
    self->_iCloudBackupRestoreDateStart = 0;

    __int16 v10 = *(_WORD *)v62;
  }
  coreAnalyticsManager = self->_coreAnalyticsManager;
  id v13 = [NSNumber numberWithShort:v10];
  [(PLCoreAnalyticsEventManager *)coreAnalyticsManager setPayloadValue:v13 forKey:*MEMORY[0x1E4F8BCF0] onEventWithName:*MEMORY[0x1E4F8BCC8]];

  if (*(__int16 *)v62 >= 6)
  {
    uint64_t v14 = PLMigrationGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = *(__int16 *)v62;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Too many attempts to restore. Attempts count: %hd", (uint8_t *)&buf, 8u);
    }

    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v66 = *MEMORY[0x1E4F28228];
    v67 = @"Too many attempts to restore compute cache";
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    uint64_t v17 = [v15 errorWithDomain:*MEMORY[0x1E4F8C500] code:52003 userInfo:v16];

    id v9 = (id)v17;
LABEL_9:
    id v18 = v9;
    goto LABEL_13;
  }
  id v60 = v9;
  BOOL v25 = [(PLComputeCacheManager *)self _transferAndPrepareComputeCacheFromBackupToRestoreLocationWithError:&v60];
  id v18 = v60;

  if (v25)
  {
    int v26 = [(PLComputeCacheManager *)self _shortLivedLibrary];
    restoreCachePhotoLibrary = self->_restoreCachePhotoLibrary;
    self->_restoreCachePhotoLibrary = v26;

    v52 = [(PLPhotoLibrary *)self->_restoreCachePhotoLibrary libraryID];
    location = (id *)&self->_lsm;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
    id v29 = [WeakRetained pathManager];
    BOOL v30 = PLLibraryIDFromPathManager();
    char v31 = [v52 isEqual:v30];

    uint64_t v32 = self->_restoreCachePhotoLibrary;
    if ((v31 & 1) == 0)
    {
      [(PLPhotoLibrary *)v32 libraryID];
      objc_claimAutoreleasedReturnValue();
      [objc_loadWeakRetained(location) pathManager];
      objc_claimAutoreleasedReturnValue();
      PLLibraryIDFromPathManager();
      objc_claimAutoreleasedReturnValue();
      _PFAssertFailHandler();
      __break(1u);
    }
    [(PLPhotoLibrary *)v32 disableOpportunisticTasks];
    id v33 = objc_opt_class();
    id v34 = objc_loadWeakRetained(location);
    BOOL v35 = [v34 pathManager];
    uint64_t v36 = [v33 _urlForLocation:3 pathManager:v35 createIfNeeded:0 error:0];

    id v37 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v38 = +[PLComputeCacheManager restorePayloadClasses];
    id v39 = objc_msgSend(v37, "initWithCapacity:", objc_msgSend(v38, "count"));

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v64 = 0x2020000000;
    uint64_t v65 = 0;
    uint64_t v40 = +[PLComputeCacheManager restorePayloadClasses];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __71__PLComputeCacheManager__restoreComputeCacheArchiveWithProgress_error___block_invoke;
    v56[3] = &unk_1E586D7F8;
    id v41 = v36;
    id v57 = v41;
    p_long long buf = &buf;
    id v42 = v39;
    id v58 = v42;
    [v40 enumerateObjectsUsingBlock:v56];

    uint64_t v43 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:parent:pendingUnitCount:", *(void *)(*((void *)&buf + 1) + 24), v6, objc_msgSend(v6, "totalUnitCount"));
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __71__PLComputeCacheManager__restoreComputeCacheArchiveWithProgress_error___block_invoke_2;
    v53[3] = &unk_1E586D848;
    v53[4] = self;
    id v44 = v6;
    id v54 = v44;
    id v45 = v43;
    id v55 = v45;
    [v42 enumerateObjectsUsingBlock:v53];
    [(PLPhotoLibrary *)self->_restoreCachePhotoLibrary enableOpportunisticTasks];
    int v46 = [v44 isCancelled];
    if (v46)
    {
      uint64_t v47 = PLMigrationGetLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v62 = 0;
        _os_log_impl(&dword_19B3C7000, v47, OS_LOG_TYPE_ERROR, "ComputeCacheJournalManager: Early return from journal re-create non-assets due to progress cancel", v62, 2u);
      }

      v48 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41031 userInfo:0];
      v49 = v48;
      if (a4) {
        *a4 = v48;
      }
    }
    objc_msgSend(v45, "setCompletedUnitCount:", objc_msgSend(v45, "totalUnitCount"));
    v50 = self->_restoreCachePhotoLibrary;
    self->_restoreCachePhotoLibrary = 0;

    _Block_object_dispose(&buf, 8);
    if (!v46)
    {
      BOOL v23 = 1;
      goto LABEL_18;
    }
  }
LABEL_13:
  objc_msgSend(v6, "setCompletedUnitCount:", objc_msgSend(v6, "totalUnitCount"));
  id v22 = PLMigrationGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v18;
    _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to restore compute cache. Error: %@", (uint8_t *)&buf, 0xCu);
  }

  if (a4)
  {
    id v18 = v18;
    BOOL v23 = 0;
    *a4 = v18;
  }
  else
  {
    BOOL v23 = 0;
  }
LABEL_18:

  return v23;
}

void __71__PLComputeCacheManager__restoreComputeCacheArchiveWithProgress_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [[PLJournal alloc] initWithBaseURL:*(void *)(a1 + 32) payloadClass:a2];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [(PLJournal *)v3 countOfInsertEntriesWithError:0];
  [*(id *)(a1 + 40) addObject:v3];
}

void __71__PLComputeCacheManager__restoreComputeCacheArchiveWithProgress_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  char v7 = [[PLCloudAssetPayloadRestore alloc] initWithDelegate:*(void *)(a1 + 32) batchSize:100];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71__PLComputeCacheManager__restoreComputeCacheArchiveWithProgress_error___block_invoke_3;
  v18[3] = &unk_1E586D820;
  id v19 = *(id *)(a1 + 40);
  BOOL v8 = v7;
  char v20 = v8;
  id v21 = *(id *)(a1 + 48);
  id v17 = 0;
  char v9 = [v6 enumeratePayloadsUsingBlock:v18 error:&v17];
  id v10 = v17;
  if ((v9 & 1) == 0)
  {
    id v11 = PLMigrationGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = objc_msgSend((id)objc_msgSend(v6, "payloadClass"), "payloadClassID");
      *(_DWORD *)long long buf = 138543618;
      uint64_t v23 = (uint64_t)v12;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed enumerate journal for payload %{public}@. Error: %@", buf, 0x16u);
    }
  }
  if ([*(id *)(a1 + 40) isCancelled])
  {
    id v13 = PLMigrationGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Will abort journal enumeration due to progress cancel", buf, 2u);
    }

    *a4 = 1;
  }
  else
  {
    [(PLCloudAssetPayloadRestore *)v8 insertRemainingPayloads];
    if ([(PLCloudAssetPayloadRestore *)v8 totalSkipped])
    {
      uint64_t v14 = PLMigrationGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = [(PLCloudAssetPayloadRestore *)v8 totalSkipped];
        id v16 = objc_msgSend((id)objc_msgSend(v6, "payloadClass"), "payloadClassID");
        *(_DWORD *)long long buf = 134218242;
        uint64_t v23 = v15;
        __int16 v24 = 2112;
        id v25 = v16;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Dropped %tu unmatched %@ payloads", buf, 0x16u);
      }
    }
  }
}

void __71__PLComputeCacheManager__restoreComputeCacheArchiveWithProgress_error___block_invoke_3(id *a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if ([a1[4] isCancelled])
  {
    id v6 = PLMigrationGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)char v7 = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Will abort journal enumeration due to progress cancel", v7, 2u);
    }

    *a3 = 1;
  }
  else
  {
    [a1[5] addPayload:v5];
    objc_msgSend(a1[6], "setCompletedUnitCount:", objc_msgSend(a1[6], "completedUnitCount") + 1);
  }
}

- (BOOL)_restoreComputeCacheWithProgress:(id)a3 error:(id *)a4
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  char v9 = [WeakRetained pathManager];
  id v43 = 0;
  int v10 = [v7 isEnabledWithPathManager:v9 error:&v43];
  id v11 = v43;

  if (v10)
  {
    switch([(PLComputeCacheManager *)self _restoreState])
    {
      case 0:
        id v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v13 = *MEMORY[0x1E4F8C500];
        uint64_t v52 = *MEMORY[0x1E4F28228];
        v53[0] = @"Restore not required";
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
        uint64_t v15 = [v12 errorWithDomain:v13 code:52004 userInfo:v14];

        id v16 = PLMigrationGetLog();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_27;
        }
        *(_WORD *)long long buf = 0;
        id v17 = "ComputeCacheManager: Restore already completed";
        id v18 = v16;
        os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
        uint32_t v20 = 2;
        goto LABEL_26;
      case 1:
        id v33 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v34 = *MEMORY[0x1E4F8C500];
        uint64_t v50 = *MEMORY[0x1E4F28228];
        v51 = @"Restore not permitted for self created archive";
        BOOL v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
        uint64_t v15 = [v33 errorWithDomain:v34 code:52005 userInfo:v35];

        id v16 = PLMigrationGetLog();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        *(_DWORD *)long long buf = 138412290;
        id v45 = v15;
        id v17 = "ComputeCacheManager: Attempting to restore the compute cache from a self created archive. Error: %@";
        goto LABEL_25;
      case 2:
        [(PLComputeCacheManager *)self _setRestoreState:3];
        if (v6)
        {
          id v21 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:parent:pendingUnitCount:", 1, v6, objc_msgSend(v6, "totalUnitCount"));
        }
        else
        {
          id v21 = 0;
        }
        id v42 = v11;
        BOOL v24 = [(PLComputeCacheManager *)self _restoreComputeCacheArchiveWithProgress:v21 error:&v42];
        id v40 = v42;

        [v21 setCompletedUnitCount:[v21 completedUnitCount] + 1];
        id v11 = v40;
        goto LABEL_8;
      case 3:
        uint64_t v36 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v37 = *MEMORY[0x1E4F8C500];
        uint64_t v48 = *MEMORY[0x1E4F28228];
        v49 = @"Restore not permitted whilst restore is currently in progress";
        v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        uint64_t v15 = [v36 errorWithDomain:v37 code:52007 userInfo:v38];

        id v16 = PLMigrationGetLog();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        *(_DWORD *)long long buf = 138412290;
        id v45 = v15;
        id v17 = "ComputeCacheManager: Attempting to restore the compute cache when restore is currently in progress. Error: %@";
LABEL_25:
        id v18 = v16;
        os_log_type_t v19 = OS_LOG_TYPE_ERROR;
        uint32_t v20 = 12;
LABEL_26:
        _os_log_impl(&dword_19B3C7000, v18, v19, v17, buf, v20);
LABEL_27:

        id v31 = v15;
        if (!a4) {
          goto LABEL_28;
        }
        goto LABEL_16;
      default:
        id v31 = v11;
        goto LABEL_18;
    }
  }
  id v21 = PLMigrationGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = objc_loadWeakRetained((id *)&self->_lsm);
    uint64_t v23 = [v22 pathManager];
    *(_DWORD *)long long buf = 138412546;
    id v45 = v23;
    __int16 v46 = 2112;
    id v47 = v11;
    _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "ComputeCacheManager: : Restore not permitted for library %@. Error: %@", buf, 0x16u);
  }
  BOOL v24 = 0;
LABEL_8:

  id v25 = PLMigrationGetLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "ComputeCacheManager: : Cleaning up restore and backup archive", buf, 2u);
  }

  id v41 = 0;
  BOOL v26 = [(PLComputeCacheManager *)self _removeRestoreDataWithError:&v41];
  id v27 = v41;
  if (!v26)
  {
    char v28 = PLMigrationGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = objc_loadWeakRetained((id *)&self->_lsm);
      BOOL v30 = [v29 pathManager];
      *(_DWORD *)long long buf = 138412546;
      id v45 = v30;
      __int16 v46 = 2112;
      id v47 = v27;
      _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "ComputeCacheManager: : Cleanup restore data error for library %@. Error: %@", buf, 0x16u);
    }
  }
  [(PLComputeCacheManager *)self _resetRestoreState];

  id v31 = v11;
  if (v24)
  {
LABEL_18:
    BOOL v32 = 1;
  }
  else if (a4)
  {
LABEL_16:
    id v31 = v31;
    BOOL v32 = 0;
    *a4 = v31;
  }
  else
  {
LABEL_28:
    BOOL v32 = 0;
  }

  return v32;
}

- (BOOL)restoreComputeCacheWithProgress:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  os_log_type_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__66748;
  id v22 = __Block_byref_object_dispose__66749;
  id v23 = 0;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__PLComputeCacheManager_restoreComputeCacheWithProgress_error___block_invoke;
  v14[3] = &unk_1E5874900;
  id v16 = &v24;
  v14[4] = self;
  id v8 = v6;
  id v15 = v8;
  id v17 = &v18;
  dispatch_sync(queue, v14);
  int v9 = *((unsigned __int8 *)v25 + 24);
  id v10 = (id)v19[5];
  id v11 = v10;
  if (!v9 && a4) {
    *a4 = v10;
  }

  char v12 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v12;
}

void __63__PLComputeCacheManager_restoreComputeCacheWithProgress_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [v2 _restoreComputeCacheWithProgress:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
}

- (BOOL)_addBackupCreatedMarkerWithError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v5 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  char v7 = [WeakRetained pathManager];
  id v16 = 0;
  id v8 = [v5 _urlForLocation:2 pathManager:v7 createIfNeeded:1 error:&v16];
  id v9 = v16;

  if (v8)
  {
    id v15 = v9;
    BOOL v10 = +[PLJournalFile createEmptyURL:v8 error:&v15];
    id v11 = v15;

    if (v10)
    {
      BOOL v12 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    id v11 = v9;
  }
  uint64_t v13 = PLMigrationGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v18 = v11;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to create marker. Error: %@", buf, 0xCu);
  }

  if (a3)
  {
    id v11 = v11;
    BOOL v12 = 0;
    *a3 = v11;
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_10:

  return v12;
}

- (BOOL)_transferToBackupLocationWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  char v5 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  char v7 = [WeakRetained pathManager];
  id v28 = 0;
  id v8 = [v5 _urlForLocation:5 pathManager:v7 createIfNeeded:1 error:&v28];
  id v9 = v28;

  if (v8)
  {
    id v27 = v9;
    BOOL v10 = [(PLComputeCacheManager *)self _removeLocation:6 error:&v27];
    id v11 = v27;

    if (v10)
    {
      BOOL v12 = objc_opt_class();
      id v13 = objc_loadWeakRetained((id *)&self->_lsm);
      uint64_t v14 = [v13 pathManager];
      id v15 = [v12 _urlForLocation:6 pathManager:v14 createIfNeeded:0 error:0];

      id v16 = objc_opt_class();
      id v17 = objc_loadWeakRetained((id *)&self->_lsm);
      uint64_t v18 = [v17 pathManager];
      uint64_t v19 = [v16 _urlForLocation:1 pathManager:v18 createIfNeeded:0 error:0];

      uint64_t v20 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v26 = v11;
      LOBYTE(v18) = [v20 moveItemAtURL:v19 toURL:v15 error:&v26];
      id v9 = v26;

      if (v18)
      {

        id v21 = v9;
        BOOL v22 = 1;
        goto LABEL_15;
      }
      id v23 = PLMigrationGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v30 = v9;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to transfer the backup cache to the restore location. Error: %@", buf, 0xCu);
      }
    }
    else
    {
      id v15 = PLMigrationGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v30 = v11;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to remove previous backup archive. Error: %@", buf, 0xCu);
      }
      id v9 = v11;
    }
  }
  id v24 = v9;
  id v21 = v24;
  if (a3)
  {
    id v21 = v24;
    BOOL v22 = 0;
    *a3 = v21;
  }
  else
  {
    BOOL v22 = 0;
  }
LABEL_15:

  return v22;
}

- (BOOL)_archiveSnapshotWithError:(id *)a3
{
  id v14 = 0;
  BOOL v5 = [(PLComputeCacheManager *)self _archivePrepareDirectoryWithError:&v14];
  id v6 = v14;
  char v7 = v6;
  if (v5)
  {
    id v13 = v6;
    BOOL v8 = [(PLComputeCacheManager *)self _addBackupCreatedMarkerWithError:&v13];
    id v9 = v13;

    id v10 = v9;
    if (v8)
    {
      BOOL v11 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    id v10 = v6;
  }
  if (a3)
  {
    id v10 = v10;
    BOOL v11 = 0;
    *a3 = v10;
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_8:

  return v11;
}

- (BOOL)_hasPrepareDataToBackupWithError:(id *)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__PLComputeCacheManager__hasPrepareDataToBackupWithError___block_invoke;
  v13[3] = &unk_1E586D7D0;
  v13[4] = &v14;
  [(PLComputeCacheManager *)self _enumerateComputeCachePrepareDirectoryUsingBlock:v13];
  if (*((unsigned char *)v15 + 24))
  {
    id v4 = 0;
  }
  else
  {
    BOOL v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28228];
    v21[0] = @"Backup triggered on missing prepare data";
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    char v7 = [v5 errorWithDomain:*MEMORY[0x1E4F8C500] code:52009 userInfo:v6];

    BOOL v8 = PLMigrationGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v19 = v7;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Attempting to backup from prepare location with no data. Error: %@", buf, 0xCu);
    }

    int v9 = *((unsigned __int8 *)v15 + 24);
    id v10 = v7;
    id v4 = v10;
    if (!v9 && a3)
    {
      id v4 = v10;
      *a3 = v4;
    }
  }

  BOOL v11 = *((unsigned char *)v15 + 24) != 0;
  _Block_object_dispose(&v14, 8);
  return v11;
}

uint64_t __58__PLComputeCacheManager__hasPrepareDataToBackupWithError___block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

- (BOOL)_archiveSnapshotIfNecessaryWithError:(id *)a3
{
  BOOL v5 = -[PLComputeCacheManager _hasPrepareDataToBackupWithError:](self, "_hasPrepareDataToBackupWithError:")
    && [(PLComputeCacheManager *)self _archiveSnapshotWithError:a3]
    && [(PLComputeCacheManager *)self _transferToBackupLocationWithError:a3];
  [(PLComputeCacheManager *)self _resetRestoreState];
  return v5;
}

- (BOOL)_createArchiveWithError:(id *)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(PLComputeCacheManager *)self _restoreState];
  if (v5 < 2)
  {
    id v15 = 0;
    BOOL v11 = [(PLComputeCacheManager *)self _archiveSnapshotIfNecessaryWithError:&v15];
    id v12 = v15;
    if (v11)
    {
      BOOL v13 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    if (v5 - 2 > 1)
    {
      int v9 = 0;
    }
    else
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = *MEMORY[0x1E4F8C500];
      uint64_t v18 = *MEMORY[0x1E4F28228];
      v19[0] = @"Backup triggered before restore has completed";
      BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      int v9 = [v6 errorWithDomain:v7 code:52008 userInfo:v8];

      id v10 = PLMigrationGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        char v17 = v9;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Attempting to backup the compute cache archive before restore has completed. Error: %@", buf, 0xCu);
      }
    }
    id v12 = v9;
  }
  if (a3)
  {
    id v12 = v12;
    BOOL v13 = 0;
    *a3 = v12;
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_13:

  return v13;
}

- (BOOL)createArchiveWithError:(id *)a3
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PLComputeCacheManager_createArchiveWithError___block_invoke;
  block[3] = &unk_1E5873ED8;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __48__PLComputeCacheManager_createArchiveWithError___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _createArchiveWithError:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)coalesceJournalsForPayloadClassIDs:(id)a3 withChangeJournalOverThreshold:(float)a4 error:(id *)a5
{
  return 1;
}

- (void)coalesceJournalsForPayloadClassIDs:(id)a3 withChangeJournalOverThreshold:(float)a4 completionHandler:(id)a5
{
  if (a5) {
    (*((void (**)(id, float))a5 + 2))(a5, a4);
  }
}

- (id)_snapshotPolicy
{
  uint64_t v3 = [(PLComputeCacheManager *)self _shortLivedLibrary];
  char v4 = [[PLComputeCachePolicyDataSource alloc] initWithPhotoLibrary:v3 restoreState:[(PLComputeCacheManager *)self _restoreState]];
  unint64_t v5 = [(PLComputeCacheManager *)self _cachedPolicyConfiguration];
  id v6 = [[PLComputeCachePolicy alloc] initWithPolicyData:v4 configuration:v5];

  return v6;
}

- (BOOL)_removeSnapshotWithError:(id *)a3
{
  return [(PLComputeCacheManager *)self _removeComputeCacheDataForMatchingRestoreState:0 error:a3];
}

- (BOOL)_performSnapshotWithError:(id *)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  unint64_t v5 = +[PLConcurrencyLimiter sharedLimiter];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PLComputeCacheManager__performSnapshotWithError___block_invoke;
  v7[3] = &unk_1E5873ED8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  [v5 sync:v7 identifyingBlock:0 library:0];

  LOBYTE(a3) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a3;
}

void __51__PLComputeCacheManager__performSnapshotWithError___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = (void *)v2[2];
  char v4 = (void *)[v2 _newTransientContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__PLComputeCacheManager__performSnapshotWithError___block_invoke_2;
  v5[3] = &unk_1E586D7A8;
  v5[4] = a1[4];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v3 performFullSnapshotAppend:0 createOnlyIfNecessary:1 withManagedObjectContext:v4 entryLimitBlock:v5 error:a1[6]];
}

uint64_t __51__PLComputeCacheManager__performSnapshotWithError___block_invoke_2(uint64_t a1, void *a2)
{
  if (!objc_msgSend((id)objc_msgSend(a2, "payloadClass"), "isEqual:", objc_opt_class())) {
    return 0;
  }
  uint64_t v3 = [*(id *)(a1 + 32) _cachedPolicyConfiguration];
  uint64_t v4 = [v3 ambientSuggestionEntryLimit];

  return v4;
}

- (BOOL)_snapshotJournalsWithError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  uint64_t v7 = [WeakRetained pathManager];
  int v8 = [v5 isEnabledWithPathManager:v7 error:0];

  uint64_t v9 = PLMigrationGetLog();
  uint64_t v10 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v19 = objc_loadWeakRetained((id *)&self->_lsm);
      uint64_t v20 = [v19 pathManager];
      *(_DWORD *)long long buf = 138412290;
      id v24 = v20;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Snapshot disabled for library: %@", buf, 0xCu);
    }
    id v14 = 0;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = objc_loadWeakRetained((id *)&self->_lsm);
    id v12 = [v11 pathManager];
    *(_DWORD *)long long buf = 138412290;
    id v24 = v12;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "ComputeCacheManager: Performing snapshot for library: %@", buf, 0xCu);
  }
  id v22 = 0;
  BOOL v13 = [(PLComputeCacheManager *)self _performSnapshotWithError:&v22];
  id v14 = v22;
  if (v13)
  {
LABEL_12:
    BOOL v18 = 1;
    goto LABEL_13;
  }
  id v15 = PLMigrationGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    id v16 = objc_loadWeakRetained((id *)&self->_lsm);
    char v17 = [v16 pathManager];
    *(_DWORD *)long long buf = 138412546;
    id v24 = v17;
    __int16 v25 = 2112;
    id v26 = v14;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "ComputeCacheManager: : Snapshot failed for library %@. Error: %@", buf, 0x16u);
  }
  if (a3)
  {
    id v14 = v14;
    BOOL v18 = 0;
    *a3 = v14;
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_13:
  [(PLComputeCacheManager *)self _resetRestoreState];

  return v18;
}

- (void)snapshotJournalsForPayloadClassIDs:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__PLComputeCacheManager_snapshotJournalsForPayloadClassIDs_withCompletionHandler___block_invoke;
  v8[3] = &unk_1E58742F0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __82__PLComputeCacheManager_snapshotJournalsForPayloadClassIDs_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v5 = 0;
  [v2 _snapshotJournalsWithError:&v5];
  id v3 = v5;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

- (BOOL)snapshotJournalsForPayloadClassIDs:(id)a3 error:(id *)a4
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__66748;
  id v16 = __Block_byref_object_dispose__66749;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PLComputeCacheManager_snapshotJournalsForPayloadClassIDs_error___block_invoke;
  block[3] = &unk_1E5875A90;
  block[4] = self;
  block[5] = &v18;
  block[6] = &v12;
  dispatch_sync(queue, block);
  int v6 = *((unsigned __int8 *)v19 + 24);
  id v7 = (id)v13[5];
  int v8 = v7;
  if (!v6 && a4) {
    *a4 = v7;
  }

  char v9 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __66__PLComputeCacheManager_snapshotJournalsForPayloadClassIDs_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = [v2 _snapshotJournalsWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v4;
}

- (BOOL)snapshotComputeCacheAndBackupIfNeededWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__66748;
  id v15 = __Block_byref_object_dispose__66749;
  id v16 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PLComputeCacheManager_snapshotComputeCacheAndBackupIfNeededWithError___block_invoke;
  block[3] = &unk_1E5875A90;
  block[4] = self;
  block[5] = &v17;
  block[6] = &v11;
  dispatch_sync(queue, block);
  int v5 = *((unsigned __int8 *)v18 + 24);
  id v6 = (id)v12[5];
  id v7 = v6;
  if (!v5 && a3) {
    *a3 = v6;
  }

  char v8 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __72__PLComputeCacheManager_snapshotComputeCacheAndBackupIfNeededWithError___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _snapshotPolicy];
  if ([v2 snapshotAllowed])
  {
    char v3 = [v2 snapshotRequired];
    char v4 = PLMigrationGetLog();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        id v6 = [v2 reason];
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
        char v8 = [WeakRetained pathManager];
        *(_DWORD *)long long buf = 138543618;
        id v45 = v6;
        __int16 v46 = 2112;
        id v47 = v8;
        _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "ComputeCacheManager: Updating compute cache snapshot with reason [%{public}@] for library: %@", buf, 0x16u);
      }
      [*(id *)(*(void *)(a1 + 32) + 24) startRecordingTimedEventToken];
      double v10 = v9;
      uint64_t v11 = *(void **)(a1 + 32);
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      id obj = *(id *)(v12 + 40);
      char v13 = [v11 _snapshotJournalsWithError:&obj];
      objc_storeStrong((id *)(v12 + 40), obj);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v13;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        uint64_t v14 = *(void **)(a1 + 32);
        uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
        id v41 = *(id *)(v15 + 40);
        char v16 = [v14 _createArchiveWithError:&v41];
        objc_storeStrong((id *)(v15 + 40), v41);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v16;
      }
      uint64_t v17 = *MEMORY[0x1E4F8BCC8];
      [*(id *)(*(void *)(a1 + 32) + 24) stopRecordingTimedEventWithToken:*MEMORY[0x1E4F8BCE8] forKey:*MEMORY[0x1E4F8BCC8] onEventWithName:v10];
      [*(id *)(*(void *)(a1 + 32) + 24) setPayloadValue:&unk_1EEBEF4B0 forKey:*MEMORY[0x1E4F8BD00] onEventWithName:v17];
      uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 24);
      uint64_t v19 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
      [v18 setPayloadValue:v19 forKey:*MEMORY[0x1E4F8BCF8] onEventWithName:v17];

      char v20 = *(void **)(a1 + 32);
      char v21 = (void *)v20[3];
      id v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "_libraryAssetCount"));
      [v21 setPayloadValue:v22 forKey:*MEMORY[0x1E4F8BCD0] onEventWithName:v17];

      id v23 = *(void **)(a1 + 32);
      id v24 = (void *)v23[3];
      __int16 v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v23, "_getArchiveSize"));
      [v24 setPayloadValue:v25 forKey:*MEMORY[0x1E4F8BCB0] onEventWithName:v17];

      id v26 = *(void **)(*(void *)(a1 + 32) + 24);
      uint64_t v27 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "allowPolicy"));
      [v26 setPayloadValue:v27 forKey:*MEMORY[0x1E4F8BCB8] onEventWithName:v17];

      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        id v28 = *(void **)(*(void *)(a1 + 32) + 24);
        id v29 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "code"));
        [v28 setPayloadValue:v29 forKey:*MEMORY[0x1E4F8BCC0] onEventWithName:v17];
      }
      [*(id *)(a1 + 32) _publish];
      goto LABEL_18;
    }
    if (v5)
    {
      v38 = [v2 reason];
      id v39 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      id v40 = [v39 pathManager];
      *(_DWORD *)long long buf = 138543618;
      id v45 = v38;
      __int16 v46 = 2112;
      id v47 = v40;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "ComputeCacheManager: Skipping compute cache snapshot with reason [%{public}@] for library: %@", buf, 0x16u);
    }
LABEL_17:

    goto LABEL_18;
  }
  id v30 = PLMigrationGetLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = [v2 reason];
    id v32 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    id v33 = [v32 pathManager];
    *(_DWORD *)long long buf = 138543618;
    id v45 = v31;
    __int16 v46 = 2112;
    id v47 = v33;
    _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEFAULT, "ComputeCacheManager: Snapshot not allowed, performing snapshot cleanup with reason [%{public}@] for library: %@", buf, 0x16u);
  }
  uint64_t v34 = *(void **)(a1 + 32);
  uint64_t v35 = *(void *)(*(void *)(a1 + 48) + 8);
  id v43 = *(id *)(v35 + 40);
  char v36 = [v34 _removeSnapshotWithError:&v43];
  objc_storeStrong((id *)(v35 + 40), v43);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v36;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    char v4 = PLMigrationGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)long long buf = 138412290;
      id v45 = v37;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to remove snapshot data. Error: %@", buf, 0xCu);
    }
    goto LABEL_17;
  }
LABEL_18:
}

- (BOOL)resetComputeCacheWithError:(id *)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__66748;
  uint64_t v15 = __Block_byref_object_dispose__66749;
  id v16 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PLComputeCacheManager_resetComputeCacheWithError___block_invoke;
  block[3] = &unk_1E5875A90;
  block[4] = self;
  block[5] = &v17;
  block[6] = &v11;
  dispatch_sync(queue, block);
  int v5 = *((unsigned __int8 *)v18 + 24);
  id v6 = (id)v12[5];
  id v7 = v6;
  if (!v5 && a3) {
    *a3 = v6;
  }

  char v8 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

uint64_t __52__PLComputeCacheManager_resetComputeCacheWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = [v2 _removeLocation:5 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v15 = *(id *)(v7 + 40);
    char v8 = [v6 _removeLocation:0 error:&v15];
    objc_storeStrong((id *)(v7 + 40), v15);
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  else
  {
    char v8 = 0;
  }
  *(unsigned char *)(v5 + 24) = v8;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v9 + 24))
  {
    double v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v14 = *(id *)(v11 + 40);
    char v12 = [v10 _removeLocation:3 error:&v14];
    objc_storeStrong((id *)(v11 + 40), v14);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  else
  {
    char v12 = 0;
  }
  *(unsigned char *)(v9 + 24) = v12;
  return [*(id *)(a1 + 32) _resetRestoreState];
}

- (int64_t)_iCloudBackupState
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F78010]);
  if ([v2 isBackupEnabled]) {
    int64_t v3 = [v2 isBackupEnabledForDomainName:@"CameraRollDomain"];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (BOOL)_isInitialSyncWithInitialSyncDate:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = v3;
  if (!v3)
  {
LABEL_7:
    BOOL v7 = 0;
    goto LABEL_8;
  }
  [v3 timeIntervalSinceNow];
  double v6 = v5;
  if (v5 >= 0.0)
  {
    char v8 = PLMigrationGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 134217984;
      double v11 = v6;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Initial sync date has been set in the future. Interval: %lf", (uint8_t *)&v10, 0xCu);
    }

    goto LABEL_7;
  }
  BOOL v7 = fabs(v5) <= 120.0;
LABEL_8:

  return v7;
}

- (void)notifyCPLConfiguration:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__PLComputeCacheManager_notifyCPLConfiguration___block_invoke;
  v7[3] = &unk_1E5875E18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __48__PLComputeCacheManager_notifyCPLConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCachedPolicyConfigurationWithCPLConfiguration:*(void *)(a1 + 40)];
}

- (void)notifyReadyToRestoreWithInitialSyncDate:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x19F38BDA0]()
    && ([MEMORY[0x1E4F1CB18] standardUserDefaults],
        double v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 BOOLForKey:@"PLDisableAutoComputeCacheRestore"],
        v5,
        v6))
  {
    BOOL v7 = PLMigrationGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "ComputeCacheManager: notified ready to restore but auto-restore disabled", buf, 2u);
    }
  }
  else
  {
    BOOL v8 = [(PLComputeCacheManager *)self _isInitialSyncWithInitialSyncDate:v4];
    queue = self->_queue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__PLComputeCacheManager_notifyReadyToRestoreWithInitialSyncDate___block_invoke;
    v10[3] = &unk_1E58748B0;
    v10[4] = self;
    BOOL v11 = v8;
    dispatch_async(queue, v10);
  }
}

void __65__PLComputeCacheManager_notifyReadyToRestoreWithInitialSyncDate___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v2 = PLMigrationGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_INFO, "ComputeCacheManager: notified restore start", buf, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  id v4 = (void *)v3[3];
  double v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "_getArchiveSize"));
  uint64_t v6 = *MEMORY[0x1E4F8BCC8];
  [v4 setPayloadValue:v5 forKey:*MEMORY[0x1E4F8BCB0] onEventWithName:*MEMORY[0x1E4F8BCC8]];

  [*(id *)(*(void *)(a1 + 32) + 24) startRecordingTimedEventToken];
  double v8 = v7;
  uint64_t v9 = *(void **)(a1 + 32);
  id v32 = 0;
  uint64_t v10 = [v9 _restoreComputeCacheWithProgress:0 error:&v32];
  id v11 = v32;
  [*(id *)(*(void *)(a1 + 32) + 24) stopRecordingTimedEventWithToken:*MEMORY[0x1E4F8BCE8] forKey:v6 onEventWithName:v8];
  [*(id *)(*(void *)(a1 + 32) + 24) setPayloadValue:&unk_1EEBEF498 forKey:*MEMORY[0x1E4F8BD00] onEventWithName:v6];
  uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v13 = [NSNumber numberWithBool:v10];
  [v12 setPayloadValue:v13 forKey:*MEMORY[0x1E4F8BCF8] onEventWithName:v6];

  id v14 = *(void **)(a1 + 32);
  id v15 = (void *)v14[3];
  id v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "_libraryAssetCount"));
  [v15 setPayloadValue:v16 forKey:*MEMORY[0x1E4F8BCD0] onEventWithName:v6];

  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v18 = *(void **)(v17 + 24);
  uint64_t v19 = NSNumber;
  [*(id *)(v17 + 64) timeIntervalSinceNow];
  char v21 = [v19 numberWithDouble:-v20];
  [v18 setPayloadValue:v21 forKey:*MEMORY[0x1E4F8BCD8] onEventWithName:v6];

  id v22 = *(void **)(a1 + 32);
  id v23 = (void *)v22[3];
  id v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v22, "_iCloudBackupState"));
  [v23 setPayloadValue:v24 forKey:*MEMORY[0x1E4F8BCE0] onEventWithName:v6];

  if (v10)
  {
    __int16 v25 = PLMigrationGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_INFO, "ComputeCacheManager: restore completed", buf, 2u);
    }

    id v26 = [*(id *)(a1 + 32) _shortLivedLibrary];
    +[PLPhotoAnalysisPhotoLibraryService notifyComputeCacheDidLoadForLibrary:v26 reply:&__block_literal_global_66967];

    goto LABEL_16;
  }
  if ([(id)objc_opt_class() shouldPublishAnalyticsForRestoreError:v11])
  {
    uint64_t v27 = PLMigrationGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v34 = v11;
      id v28 = "ComputeCacheManager: Restore compute cache failed or denied on notify. Error: %@";
LABEL_14:
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, v28, buf, 0xCu);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (*(unsigned char *)(a1 + 40) && PLIsErrorEqualToCode())
  {
    uint64_t v27 = PLMigrationGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v34 = v11;
      id v28 = "ComputeCacheManager: Restore compute cache failed. No restore archive available. Error: %@";
      goto LABEL_14;
    }
LABEL_15:

    id v29 = *(void **)(*(void *)(a1 + 32) + 24);
    id v30 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "code"));
    [v29 setPayloadValue:v30 forKey:*MEMORY[0x1E4F8BCC0] onEventWithName:v6];

LABEL_16:
    [*(id *)(a1 + 32) _publish];
    goto LABEL_17;
  }
  uint64_t v31 = PLMigrationGetLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v34 = v11;
    _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_INFO, "ComputeCacheManager: Restore compute cache failed or denied on notify. Error: %@", buf, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 24) removeEventWithName:v6];
LABEL_17:
}

void __65__PLComputeCacheManager_notifyReadyToRestoreWithInitialSyncDate___block_invoke_94(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = PLMigrationGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "ComputeCacheManager: photoanalysisd FTE registration failed. Error: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)_publish
{
  [(PLCoreAnalyticsEventManager *)self->_coreAnalyticsManager publishAllEvents];
  coreAnalyticsManager = self->_coreAnalyticsManager;
  uint64_t v4 = *MEMORY[0x1E4F8BCC8];
  [(PLCoreAnalyticsEventManager *)coreAnalyticsManager removeEventWithName:v4];
}

- (PLComputeCacheManager)initWithLibraryServicesManager:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PLComputeCacheManager.m", 246, @"Invalid parameter not satisfying: %@", @"lsm" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)PLComputeCacheManager;
  uint64_t v6 = [(PLComputeCacheManager *)&v19 init];
  if (v6)
  {
    uint64_t v7 = +[PLJournalManager journalManagerWithClass:objc_opt_class() libraryServiceManager:v5];
    journalManager = v6->_journalManager;
    v6->_journalManager = (PLJournalManager *)v7;

    uint64_t v9 = (PLCoreAnalyticsEventManager *)objc_alloc_init(MEMORY[0x1E4F8B8C0]);
    coreAnalyticsManager = v6->_coreAnalyticsManager;
    v6->_coreAnalyticsManager = v9;

    objc_storeWeak((id *)&v6->_lsm, v5);
    id v11 = [NSString stringWithFormat:@"com.apple.%s.%@.queue", "assetsd", objc_opt_class()];
    uint64_t v12 = (const char *)[v11 UTF8String];
    uint64_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v15 = dispatch_queue_create(v12, v14);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v15;

    v6->_restoreStateLock._os_unfair_lock_opaque = 0;
    [(PLComputeCacheManager *)v6 _resetRestoreState];
  }
  return v6;
}

+ (id)_urlForLocation:(int64_t)a3 pathManager:(id)a4 createIfNeeded:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  uint64_t v10 = v9;
  if (v7)
  {
    [v9 privateCacheDirectoryCreationMaskResetWithSubType:15];
    [v10 privateDirectoryCreationMaskResetWithSubType:10];
  }
  switch(a3)
  {
    case 0:
      uint64_t v27 = 0;
      uint64_t v11 = 1;
      uint64_t v12 = [v10 privateCacheDirectoryWithSubType:15 leafType:1 additionalPathComponents:@"prepare" createIfNeeded:v7 error:&v27];
      uint64_t v13 = v27;
      goto LABEL_8;
    case 1:
      id v26 = 0;
      id v14 = [v10 privateCacheDirectoryWithSubType:15 leafType:1 additionalPathComponents:@"prepare" createIfNeeded:v7 error:&v26];
      uint64_t v17 = v26;
      goto LABEL_21;
    case 2:
      id v25 = 0;
      id v14 = [v10 privateCacheDirectoryWithSubType:15 leafType:1 additionalPathComponents:@"prepare" createIfNeeded:v7 error:&v25];
      id v15 = v25;
      id v16 = @"backupcreatedmarker";
      goto LABEL_22;
    case 3:
      id v24 = 0;
      uint64_t v11 = 1;
      uint64_t v12 = [v10 privateCacheDirectoryWithSubType:15 leafType:1 additionalPathComponents:@"restore" createIfNeeded:v7 error:&v24];
      uint64_t v13 = v24;
LABEL_8:
      id v15 = v13;
      if (!v15) {
        goto LABEL_13;
      }
      goto LABEL_23;
    case 4:
      id v23 = 0;
      id v14 = [v10 privateCacheDirectoryWithSubType:15 leafType:1 additionalPathComponents:@"restore" createIfNeeded:v7 error:&v23];
      uint64_t v17 = v23;
      goto LABEL_21;
    case 5:
      id v22 = 0;
      uint64_t v12 = [v10 privateDirectoryWithSubType:10 createIfNeeded:v7 error:&v22];
      id v15 = v22;
      uint64_t v11 = 1;
      if (!v15) {
        goto LABEL_13;
      }
      goto LABEL_23;
    case 6:
      char v21 = 0;
      id v14 = [v10 privateDirectoryWithSubType:10 createIfNeeded:v7 error:&v21];
      uint64_t v17 = v21;
LABEL_21:
      id v15 = v17;
      id v16 = @"computecache.aea";
LABEL_22:
      uint64_t v12 = [v14 stringByAppendingPathComponent:v16];

      uint64_t v11 = 0;
      if (!v15) {
        goto LABEL_13;
      }
LABEL_23:
      double v20 = PLMigrationGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 134218242;
        int64_t v29 = a3;
        __int16 v30 = 2112;
        id v31 = v15;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to create location %tu compute cache data. Error: %@", buf, 0x16u);
      }

      id v18 = v15;
      if (!a6) {
        goto LABEL_16;
      }
      goto LABEL_15;
    default:
      uint64_t v12 = 0;
      uint64_t v11 = 1;
LABEL_13:
      id v18 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12 isDirectory:v11];
      if (v18) {
        goto LABEL_17;
      }
      if (a6) {
LABEL_15:
      }
        *a6 = v18;
LABEL_16:

      id v18 = 0;
LABEL_17:

      return v18;
  }
}

+ (BOOL)shouldPublishAnalyticsForRestoreError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F8C500]];

  if (!v5
    || ((uint64_t v6 = [v3 code], v7 = 0, (unint64_t)(v6 - 52001) > 6)
     || ((1 << (v6 - 33)) & 0x59) == 0)
    && v6 != 45999)
  {
    BOOL v7 = 1;
  }

  return v7;
}

+ (BOOL)isEnabledWithPathManager:(id)a3 error:(id *)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"PLComputeCacheManager.m", 183, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];
  }
  double v8 = (void *)MEMORY[0x1E4F8B980];
  id v9 = [v7 libraryURL];
  unint64_t v10 = [v8 wellKnownPhotoLibraryIdentifierForURL:v9];

  if (v10 - 2 < 2)
  {
    id v14 = PLMigrationGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "ComputeCacheManager: Disabled journal for invalid well known library type", buf, 2u);
    }

    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F8C500];
    uint64_t v28 = *MEMORY[0x1E4F28228];
    int64_t v29 = @"Disabled journal for invalid well known library type";
    uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
    id v18 = &v29;
    objc_super v19 = &v28;
  }
  else
  {
    if (v10 > 1
      || ([v7 libraryURL],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          char v12 = PLIsCloudPhotoLibraryEnabledForPhotoLibraryURL(v11),
          v11,
          (v12 & 1) != 0))
    {
      BOOL v13 = 1;
      goto LABEL_16;
    }
    double v20 = PLMigrationGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEBUG, "ComputeCacheManager: Disabled journal manager for CPL disabled library", buf, 2u);
    }

    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F8C500];
    uint64_t v30 = *MEMORY[0x1E4F28228];
    v31[0] = @"Disabled journal manager for CPL disabled library";
    uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
    id v18 = (__CFString **)v31;
    objc_super v19 = &v30;
  }
  char v21 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:1];
  id v22 = [v15 errorWithDomain:v16 code:52001 userInfo:v21];

  id v23 = v22;
  id v24 = v23;
  if (a4) {
    *a4 = v23;
  }

  BOOL v13 = 0;
LABEL_16:

  return v13;
}

+ (id)restorePayloadClasses
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

+ (id)payloadClasses
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

+ (id)baseURLFromPathManager:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = 0;
    id v3 = [a1 _urlForLocation:0 pathManager:a3 createIfNeeded:1 error:&v7];
    id v4 = v7;
    if (v4)
    {
      int v5 = PLMigrationGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v9 = v4;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to save prepare compute cache data. Error: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

+ (id)name
{
  return @"ComputeCache";
}

@end