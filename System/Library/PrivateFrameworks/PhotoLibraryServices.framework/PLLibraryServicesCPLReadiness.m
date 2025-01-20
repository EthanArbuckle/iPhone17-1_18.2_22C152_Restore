@interface PLLibraryServicesCPLReadiness
- (BOOL)_checkForCPLReadinessAndCallBlocks;
- (BOOL)_isAssetsdReadyForCPLManagerWithStatus:(id *)a3;
- (BOOL)_isReadyForCloudPhotoLibraryWithStatus:(id *)a3;
- (BOOL)isReadyForCloudPhotoLibraryWithStatus:(id *)a3;
- (PLLibraryServicesCPLReadiness)initWithLibraryServicesManager:(id)a3;
- (id)libraryServicesManager;
- (void)_callOutstandingCPLReadinessBlocks;
- (void)_checkIsReadyForCloudPhotoLibrary;
- (void)_setupCPLReadinessTimerAndEventHandlerIfNeeded;
- (void)_stopWaitingForCPLReadiness;
- (void)_updateIsReady:(BOOL)a3 statusMessage:(id)a4;
- (void)cancelCPLReadinessBlocksAndStopWaiting;
- (void)pauseCloudPhotos:(BOOL)a3 reason:(signed __int16)a4;
- (void)performOnceLibraryIsReadyForCPLManager:(id)a3;
- (void)processCloudPhotosLibraryStateChange:(BOOL)a3;
@end

@implementation PLLibraryServicesCPLReadiness

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusMessage, 0);
  objc_storeStrong((id *)&self->_photoLibraryCPLReadinessBlocks, 0);
  objc_storeStrong((id *)&self->_photoLibraryCPLReadinessTimer, 0);
  objc_destroyWeak((id *)&self->_libraryServicesManager);
}

- (void)pauseCloudPhotos:(BOOL)a3 reason:(signed __int16)a4
{
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PLLibraryServicesCPLReadiness_pauseCloudPhotos_reason___block_invoke;
  v7[3] = &unk_1E586A6F8;
  objc_copyWeak(&v8, &location);
  BOOL v10 = a3;
  signed __int16 v9 = a4;
  [(PLLibraryServicesCPLReadiness *)self performOnceLibraryIsReadyForCPLManager:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __57__PLLibraryServicesCPLReadiness_pauseCloudPhotos_reason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained libraryServicesManager];
  v3 = [v2 cloudPhotoLibraryManager];
  [v3 setPause:*(unsigned __int8 *)(a1 + 42) reason:*(__int16 *)(a1 + 40)];
}

- (void)processCloudPhotosLibraryStateChange:(BOOL)a3
{
  if (a3)
  {
    v4 = [(PLLibraryServicesCPLReadiness *)self libraryServicesManager];
    v5 = [v4 cloudPhotoLibraryManager];
    objc_initWeak(&location, v5);

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__PLLibraryServicesCPLReadiness_processCloudPhotosLibraryStateChange___block_invoke;
    v8[3] = &unk_1E5875F08;
    objc_copyWeak(&v9, &location);
    [(PLLibraryServicesCPLReadiness *)self performOnceLibraryIsReadyForCPLManager:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    v6 = [(PLLibraryServicesCPLReadiness *)self libraryServicesManager];
    id v7 = [v6 cloudPhotoLibraryManager];

    [(PLLibraryServicesCPLReadiness *)self cancelCPLReadinessBlocksAndStopWaiting];
    [v7 disableiCPLWithCompletionHandler:&__block_literal_global_62];
  }
}

void __70__PLLibraryServicesCPLReadiness_processCloudPhotosLibraryStateChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained enableiCPLWithCompletionHandler:&__block_literal_global_46746];
}

void __70__PLLibraryServicesCPLReadiness_processCloudPhotosLibraryStateChange___block_invoke_3()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.ICPLStateChanged", 0, 0, 1u);
}

void __70__PLLibraryServicesCPLReadiness_processCloudPhotosLibraryStateChange___block_invoke_2()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow.ICPLStateChanged", 0, 0, 1u);
}

- (void)performOnceLibraryIsReadyForCPLManager:(id)a3
{
  id v4 = a3;
  v5 = +[PLConcurrencyLimiter sharedLimiter];
  v6 = [v5 sharedUtilityQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__PLLibraryServicesCPLReadiness_performOnceLibraryIsReadyForCPLManager___block_invoke;
  v8[3] = &unk_1E58742F0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

uint64_t __72__PLLibraryServicesCPLReadiness_performOnceLibraryIsReadyForCPLManager___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  v3 = (void *)MEMORY[0x19F38D650](*(void *)(a1 + 40));
  [v2 addObject:v3];

  uint64_t result = [*(id *)(a1 + 32) _checkForCPLReadinessAndCallBlocks];
  if ((result & 1) == 0)
  {
    v5 = *(void **)(a1 + 32);
    return [v5 _setupCPLReadinessTimerAndEventHandlerIfNeeded];
  }
  return result;
}

- (void)_setupCPLReadinessTimerAndEventHandlerIfNeeded
{
  v3 = +[PLConcurrencyLimiter sharedLimiter];
  id v4 = [v3 sharedUtilityQueue];
  dispatch_assert_queue_V2(v4);

  if (!self->_photoLibraryCPLReadinessTimer)
  {
    v5 = +[PLConcurrencyLimiter sharedLimiter];
    v6 = [v5 sharedUtilityQueue];
    id v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v6);
    photoLibraryCPLReadinessTimer = self->_photoLibraryCPLReadinessTimer;
    self->_photoLibraryCPLReadinessTimer = v7;

    objc_initWeak(&location, self);
    objc_copyWeak(&v11, &location);
    pl_dispatch_source_set_event_handler();
    id v9 = self->_photoLibraryCPLReadinessTimer;
    dispatch_time_t v10 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v9, v10, 0x12A05F200uLL, 0);
    dispatch_resume((dispatch_object_t)self->_photoLibraryCPLReadinessTimer);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __79__PLLibraryServicesCPLReadiness__setupCPLReadinessTimerAndEventHandlerIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _checkForCPLReadinessAndCallBlocks];
}

- (BOOL)_checkForCPLReadinessAndCallBlocks
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = +[PLConcurrencyLimiter sharedLimiter];
  id v4 = [v3 sharedUtilityQueue];
  dispatch_assert_queue_V2(v4);

  v16 = @"unknown";
  BOOL v5 = [(PLLibraryServicesCPLReadiness *)self _isAssetsdReadyForCPLManagerWithStatus:&v16];
  v6 = v16;
  id v7 = PLMigrationGetLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      id v9 = [(PLLibraryServicesCPLReadiness *)self libraryServicesManager];
      dispatch_time_t v10 = [v9 pathManager];
      id v11 = [v10 libraryURL];
      *(_DWORD *)buf = 138412290;
      v18 = v11;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Photo library is ready for Cloud Photos now: %@", buf, 0xCu);
    }
    [(PLLibraryServicesCPLReadiness *)self _stopWaitingForCPLReadiness];
    [(PLLibraryServicesCPLReadiness *)self _callOutstandingCPLReadinessBlocks];
  }
  else
  {
    if (v8)
    {
      v12 = [(PLLibraryServicesCPLReadiness *)self libraryServicesManager];
      v13 = [v12 pathManager];
      v14 = [v13 libraryURL];
      *(_DWORD *)buf = 138543618;
      v18 = v6;
      __int16 v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Photo library is not ready for Cloud Photos [status: %{public}@]. Waiting for library at %@", buf, 0x16u);
    }
  }

  return v5;
}

- (void)_callOutstandingCPLReadinessBlocks
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = +[PLConcurrencyLimiter sharedLimiter];
  id v4 = [v3 sharedUtilityQueue];
  dispatch_assert_queue_V2(v4);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v5 = self->_photoLibraryCPLReadinessBlocks;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        dispatch_time_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        id v11 = +[PLConcurrencyLimiter sharedLimiter];
        v12 = [v11 sharedUtilityQueue];
        dispatch_async(v12, v10);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_photoLibraryCPLReadinessBlocks removeAllObjects];
}

- (void)_stopWaitingForCPLReadiness
{
  v3 = +[PLConcurrencyLimiter sharedLimiter];
  id v4 = [v3 sharedUtilityQueue];
  dispatch_assert_queue_V2(v4);

  photoLibraryCPLReadinessTimer = self->_photoLibraryCPLReadinessTimer;
  if (photoLibraryCPLReadinessTimer)
  {
    dispatch_source_cancel(photoLibraryCPLReadinessTimer);
  }
}

- (void)cancelCPLReadinessBlocksAndStopWaiting
{
  v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "cancelCPLReadinessBlocksAndStopWaiting: removing CPL readiness blocks", buf, 2u);
  }

  id v4 = +[PLConcurrencyLimiter sharedLimiter];
  BOOL v5 = [v4 sharedUtilityQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PLLibraryServicesCPLReadiness_cancelCPLReadinessBlocksAndStopWaiting__block_invoke;
  block[3] = &unk_1E5875CE0;
  block[4] = self;
  dispatch_sync(v5, block);
}

void __71__PLLibraryServicesCPLReadiness_cancelCPLReadinessBlocksAndStopWaiting__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  [*(id *)(a1 + 32) _stopWaitingForCPLReadiness];
  v2 = PLMigrationGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "cancelCPLReadinessBlocksAndStopWaiting: CPL readiness blocks removed", v3, 2u);
  }
}

- (BOOL)_isAssetsdReadyForCPLManagerWithStatus:(id *)a3
{
  BOOL v5 = +[PLConcurrencyLimiter sharedLimiter];
  uint64_t v6 = [v5 sharedUtilityQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = [(PLLibraryServicesCPLReadiness *)self libraryServicesManager];
  if ([v7 state] < 6)
  {
    uint64_t v8 = NSString;
    uint64_t v9 = PLStringFromLibraryServicesState();
    dispatch_time_t v10 = [v8 stringWithFormat:@"libraryServicesManager is not ready: %@", v9];
    [(PLLibraryServicesCPLReadiness *)self _updateIsReady:0 statusMessage:v10];
  }
  else
  {
    [(PLLibraryServicesCPLReadiness *)self _checkIsReadyForCloudPhotoLibrary];
  }
  BOOL v11 = [(PLLibraryServicesCPLReadiness *)self _isReadyForCloudPhotoLibraryWithStatus:a3];

  return v11;
}

- (void)_checkIsReadyForCloudPhotoLibrary
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v3 = [(PLLibraryServicesCPLReadiness *)self libraryServicesManager];
  id v4 = v3;
  if (!v3)
  {
    [(PLLibraryServicesCPLReadiness *)self _updateIsReady:0 statusMessage:@"libraryServicesManager is nil"];
    goto LABEL_24;
  }
  BOOL v5 = [v3 databaseContext];
  uint64_t v6 = (void *)[v5 newShortLivedLibraryWithName:"-[PLLibraryServicesCPLReadiness _checkIsReadyForCloudPhotoLibrary]"];

  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  uint64_t v7 = [v6 globalValues];
  char v8 = [v7 didImportFileSystemAssets];

  char v47 = v8;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__46761;
  v42 = __Block_byref_object_dispose__46762;
  v43 = @"ready";
  if (!*((unsigned char *)v45 + 24))
  {
    v43 = @"file system import is not complete";
    v26 = @"ready";
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v9 = [v4 pathManager];
  int v10 = [v9 isDeviceRestoreSupported];

  if (v10)
  {
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    v32 = __66__PLLibraryServicesCPLReadiness__checkIsReadyForCloudPhotoLibrary__block_invoke;
    v33 = &unk_1E5874900;
    v34 = v6;
    id v11 = v4;
    id v35 = v11;
    v36 = &v44;
    v37 = &v38;
    [(__CFString *)v34 performBlockAndWait:&v30 completionHandler:0];
    v12 = v45;
    if (*((unsigned char *)v45 + 24))
    {
      long long v13 = objc_msgSend(v11, "modelMigrator", v30, v31, v32, v33);
      long long v14 = [v13 deviceRestoreMigrationSupport];
      char v15 = [v14 hasCompletedDataMigratorPrerequisitesForTrackingRestoreFromCloud];

      v12 = v45;
      if ((v15 & 1) == 0)
      {
        *((unsigned char *)v45 + 24) = 0;
        long long v16 = (void *)v39[5];
        v39[5] = @"data migrator prerequisites are not complete";

        v12 = v45;
      }
    }
    if (*((unsigned char *)v12 + 24))
    {
      v17 = [v11 pathManager];
      int v18 = [v17 isDCIM];

      if (v18)
      {
        __int16 v19 = [v11 modelMigrator];
        v20 = [v19 postProcessingToken];
        int v21 = [v20 needsToPrepareForBackgroundRestore];

        if (v21)
        {
          *((unsigned char *)v45 + 24) = 0;
          v22 = (void *)v39[5];
          v39[5] = @"needs to prepare for background restore";
        }
      }
    }
    if (*((unsigned char *)v45 + 24))
    {
      v23 = [v11 modelMigrator];
      int v24 = [v23 isLoadingFacesFromFileSystem];

      if (v24)
      {
        *((unsigned char *)v45 + 24) = 0;
        v25 = (void *)v39[5];
        v39[5] = @"loading faces";
      }
    }

    v26 = v34;
    goto LABEL_17;
  }
LABEL_18:
  if (*((unsigned char *)v45 + 24))
  {
    BOOL v27 = 1;
  }
  else
  {
    v28 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = v39[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v49 = v29;
      _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, "CPLReadiness: NOT ready because %{public}@", buf, 0xCu);
    }

    BOOL v27 = *((unsigned char *)v45 + 24) != 0;
  }
  -[PLLibraryServicesCPLReadiness _updateIsReady:statusMessage:](self, "_updateIsReady:statusMessage:", v27, v39[5], v30, v31, v32, v33);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
LABEL_24:
}

void __66__PLLibraryServicesCPLReadiness__checkIsReadyForCloudPhotoLibrary__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasPendingAssetsIgnoreiTunes:1])
  {
    v2 = [*(id *)(a1 + 40) modelMigrator];
    v3 = [v2 deviceRestoreMigrationSupport];

    if ([v3 isOTARestoreInProgress])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
      BOOL v5 = *(void **)(v4 + 40);
      uint64_t v6 = @"OTA restore is in progress";
    }
    else
    {
      uint64_t v7 = PLMigrationGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)char v8 = 0;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "iCloud Restore is finished but there are still pending assets, attempting cleanup", v8, 2u);
      }

      PLSimulateCrash();
      [*(id *)(a1 + 32) cleanupIncompleteAssetsAfterOTARestore];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
      BOOL v5 = *(void **)(v4 + 40);
      uint64_t v6 = @"ready (had pending assets, but ota restore is complete - forced cleanup)";
    }
    *(void *)(v4 + 40) = v6;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void)_updateIsReady:(BOOL)a3 statusMessage:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  PLRunWithUnfairLock();
}

void __62__PLLibraryServicesCPLReadiness__updateIsReady_statusMessage___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 48))
  {
    *(unsigned char *)(v1 + 48) = *(unsigned char *)(a1 + 48);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  }
}

- (BOOL)_isReadyForCloudPhotoLibraryWithStatus:(id *)a3
{
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__46761;
  int v10 = __Block_byref_object_dispose__46762;
  id v11 = 0;
  PLRunWithUnfairLock();
  if (a3) {
    *a3 = (id) v7[5];
  }
  char v4 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(&v12, 8);
  return v4;
}

void __72__PLLibraryServicesCPLReadiness__isReadyForCloudPhotoLibraryWithStatus___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(a1[4] + 48);
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 40));
}

- (BOOL)isReadyForCloudPhotoLibraryWithStatus:(id *)a3
{
  BOOL v4 = [(PLLibraryServicesCPLReadiness *)self _isReadyForCloudPhotoLibraryWithStatus:a3];
  if (!v4)
  {
    objc_initWeak(&location, self);
    id v5 = +[PLConcurrencyLimiter sharedLimiter];
    uint64_t v6 = [v5 sharedUtilityQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__PLLibraryServicesCPLReadiness_isReadyForCloudPhotoLibraryWithStatus___block_invoke;
    v8[3] = &unk_1E5875F08;
    objc_copyWeak(&v9, &location);
    dispatch_async(v6, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __71__PLLibraryServicesCPLReadiness_isReadyForCloudPhotoLibraryWithStatus___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _checkIsReadyForCloudPhotoLibrary];
}

- (id)libraryServicesManager
{
  p_libraryServicesManager = &self->_libraryServicesManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);

  if (!WeakRetained)
  {
    BOOL v4 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "CPLReadiness: LSM is nil", v7, 2u);
    }
  }
  id v5 = objc_loadWeakRetained((id *)p_libraryServicesManager);
  return v5;
}

- (PLLibraryServicesCPLReadiness)initWithLibraryServicesManager:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLLibraryServicesCPLReadiness;
  id v5 = [(PLLibraryServicesCPLReadiness *)&v10 init];
  if (v5)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    photoLibraryCPLReadinessBlocks = v5->_photoLibraryCPLReadinessBlocks;
    v5->_photoLibraryCPLReadinessBlocks = v6;

    objc_storeWeak((id *)&v5->_libraryServicesManager, v4);
    v5->_stateLock._os_unfair_lock_opaque = 0;
    v5->_isReadyForCPL = 0;
    statusMessage = v5->_statusMessage;
    v5->_statusMessage = 0;
  }
  return v5;
}

@end