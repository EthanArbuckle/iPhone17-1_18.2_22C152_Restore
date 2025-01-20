@interface PLDeviceRestoreMigrationSupport
- (BOOL)_userDataDispositionMatchesDisposition:(unsigned int)a3;
- (BOOL)hasCompletedDataMigratorPrerequisitesForTrackingRestoreFromCloud;
- (BOOL)hasDataMigratorPluginRequestedLibraryMigration;
- (BOOL)isEraseWithoutRestore;
- (BOOL)isOTARestoreInProgress;
- (BOOL)isRestoreFromBackup;
- (BOOL)isRestoreFromBackupSourceCloud;
- (BOOL)isRestoreFromBackupSourceDeviceToDevice;
- (BOOL)isRestoreFromBackupSourceDifferentDevice;
- (BOOL)isRestoreFromBackupSourceMegaBackup;
- (BOOL)isRestoreFromBackupSourceiTunes;
- (BOOL)isUpgradeWithoutRestore;
- (BOOL)prepareDatabaseForOTARestoreIfNecessaryWithMigrationType:(int64_t)a3;
- (PLDeviceRestoreMigrationSupport)initWithLibraryServicesManager:(id)a3;
- (id)_dataMigrationInfo;
- (id)_newShortLivedLibrarySupportingLibraryOpenWithName:(const char *)a3;
- (id)prerequisitesCompleteBlock;
- (id)restoreTypeDescription;
- (void)_batchDeleteAllAssetsExcludedFromOTARestoreWithContext:(id)a3;
- (void)_linkAsideAlbumMetadata;
- (void)_prepareDatabaseForOTAAssetsPhase;
- (void)_setAlbumPendingItemCountsWithContext:(id)a3 shouldSave:(BOOL)a4;
- (void)_setAssetsToOTARestoreAsIncompleteWithContext:(id)a3 populateAlbumMappings:(id)a4;
- (void)deletePhotoStreamData;
- (void)setDataMigratorPluginHasRequestedLibraryMigration:(BOOL)a3;
- (void)setPrerequisitesCompleteBlock:(id)a3;
- (void)waitForDataMigratorPrerequisitesForTrackingRestoreFromCloud;
@end

@implementation PLDeviceRestoreMigrationSupport

- (void).cxx_destruct
{
  objc_storeStrong(&self->_prerequisitesCompleteBlock, 0);
  objc_storeStrong((id *)&self->_libraryServicesManager, 0);
}

- (void)setPrerequisitesCompleteBlock:(id)a3
{
}

- (id)prerequisitesCompleteBlock
{
  return self->_prerequisitesCompleteBlock;
}

- (BOOL)hasDataMigratorPluginRequestedLibraryMigration
{
  return self->_dataMigratorPluginHasRequestedLibraryMigration;
}

- (void)setDataMigratorPluginHasRequestedLibraryMigration:(BOOL)a3
{
  self->_dataMigratorPluginHasRequestedLibraryMigration = a3;
  if (a3)
  {
    v3 = PLMigrationGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "data migrator plugin has requested library migration", buf, 2u);
    }

    PLRunWithUnfairLock();
  }
}

void __85__PLDeviceRestoreMigrationSupport_setDataMigratorPluginHasRequestedLibraryMigration___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) prerequisitesCompleteBlock];

  if (!v2)
  {
    int v5 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 24);
    v6 = PLMigrationGetLog();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        __int16 v11 = 0;
        v8 = "data migration prerequisites already marked complete [before plugin requested migration]";
        v9 = (uint8_t *)&v11;
LABEL_10:
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      }
    }
    else if (v7)
    {
      __int16 v10 = 0;
      v8 = "data migration prerequisites marked complete before waiting";
      v9 = (uint8_t *)&v10;
      goto LABEL_10;
    }

    return;
  }
  v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "data migration prerequisites are complete [plugin requested migration]", buf, 2u);
  }

  v4 = [*(id *)(a1 + 32) prerequisitesCompleteBlock];
  v4[2]();

  [*(id *)(a1 + 32) setPrerequisitesCompleteBlock:0];
}

- (void)waitForDataMigratorPrerequisitesForTrackingRestoreFromCloud
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = [(PLLibraryServicesManager *)self->_libraryServicesManager pathManager];
  int v5 = [v4 isDeviceRestoreSupported];

  if (!v5)
  {
    v6 = PLMigrationGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "not waiting for data migrator plugin: device does not support restore from iCloud.", (uint8_t *)&buf, 2u);
    }
    goto LABEL_7;
  }
  if (self->_didWaitForPrerequisites)
  {
    __int16 v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PLDeviceRestoreMigrationSupport.m" lineNumber:511 description:@"Already waited for prerequisites"];
  }
  self->_didWaitForPrerequisites = 1;
  if ([(PLDeviceRestoreMigrationSupport *)self hasDataMigratorPluginRequestedLibraryMigration])
  {
    v6 = PLMigrationGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = @"com.apple.MobileSlideShow";
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "data migrator plugin %{public}@ is in progress and has requested library migration, not waiting for plugin to complete to avoid deadlock", (uint8_t *)&buf, 0xCu);
    }
LABEL_7:

    return;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__85186;
  v17 = __Block_byref_object_dispose__85187;
  id v18 = 0;
  v11[6] = MEMORY[0x1E4F143A8];
  v11[7] = 3221225472;
  v11[8] = __94__PLDeviceRestoreMigrationSupport_waitForDataMigratorPrerequisitesForTrackingRestoreFromCloud__block_invoke;
  v11[9] = &unk_1E5875E68;
  v11[10] = self;
  v11[11] = &buf;
  PLRunWithUnfairLock();
  BOOL v7 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94__PLDeviceRestoreMigrationSupport_waitForDataMigratorPrerequisitesForTrackingRestoreFromCloud__block_invoke_100;
  v11[3] = &unk_1E5873348;
  v11[4] = self;
  v11[5] = @"com.apple.MobileSlideShow";
  dispatch_async(v7, v11);

  v8 = PLMigrationGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v12 = 138543362;
    v13 = @"com.apple.MobileSlideShow";
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "waiting to verify migrator plugin %{public}@ is complete or to request library migration", v12, 0xCu);
  }

  dispatch_block_wait(*(dispatch_block_t *)(*((void *)&buf + 1) + 40), 0xFFFFFFFFFFFFFFFFLL);
  v9 = PLMigrationGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "done waiting for data migrator prerequisites", v12, 2u);
  }

  _Block_object_dispose(&buf, 8);
}

void __94__PLDeviceRestoreMigrationSupport_waitForDataMigratorPrerequisitesForTrackingRestoreFromCloud__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) prerequisitesCompleteBlock];

  if (!v2)
  {
    dispatch_block_t v3 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_99);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    int v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v6 setPrerequisitesCompleteBlock:v7];
  }
}

uint64_t __94__PLDeviceRestoreMigrationSupport_waitForDataMigratorPrerequisitesForTrackingRestoreFromCloud__block_invoke_100(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = PLMigrationGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "perform data migrator plugin if necessary: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v5 = (void (*)(uint64_t))getDMPerformMigrationReturningAfterPluginSymbolLoc_ptr;
  v16 = getDMPerformMigrationReturningAfterPluginSymbolLoc_ptr;
  if (!getDMPerformMigrationReturningAfterPluginSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    id v18 = __getDMPerformMigrationReturningAfterPluginSymbolLoc_block_invoke;
    uint64_t v19 = &unk_1E5875840;
    v20 = &v13;
    v6 = DataMigrationLibrary_85192();
    uint64_t v7 = dlsym(v6, "DMPerformMigrationReturningAfterPlugin");
    *(void *)(v20[1] + 24) = v7;
    getDMPerformMigrationReturningAfterPluginSymbolLoc_ptr = *(_UNKNOWN **)(v20[1] + 24);
    int v5 = (void (*)(uint64_t))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v5)
  {
    __int16 v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = [NSString stringWithUTF8String:"void PLDMPerformMigrationReturningAfterPlugin(CFStringRef)"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PLDeviceRestoreMigrationSupport.m", 47, @"%s", dlerror());

    __break(1u);
  }
  v5(v4);
  v8 = PLMigrationGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "data migrator plugin %{public}@ is complete", (uint8_t *)&buf, 0xCu);
  }

  return PLRunWithUnfairLock();
}

void __94__PLDeviceRestoreMigrationSupport_waitForDataMigratorPrerequisitesForTrackingRestoreFromCloud__block_invoke_101(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) prerequisitesCompleteBlock];

  uint64_t v3 = PLMigrationGetLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "data migration prerequisites are complete [plugin complete]", buf, 2u);
    }

    int v5 = [*(id *)(a1 + 32) prerequisitesCompleteBlock];
    v5[2]();

    [*(id *)(a1 + 32) setPrerequisitesCompleteBlock:0];
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "data migration prerequisites already marked complete [before plugin complete]", v6, 2u);
    }
  }
}

void __94__PLDeviceRestoreMigrationSupport_waitForDataMigratorPrerequisitesForTrackingRestoreFromCloud__block_invoke_2()
{
  v0 = PLMigrationGetLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19B3C7000, v0, OS_LOG_TYPE_DEBUG, "running data migration prequisites complete block", v1, 2u);
  }
}

- (BOOL)hasCompletedDataMigratorPrerequisitesForTrackingRestoreFromCloud
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLLibraryServicesManager *)self->_libraryServicesManager pathManager];
  int v4 = [v3 isDeviceRestoreSupported];

  if (!v4) {
    return 1;
  }
  if ([(PLDeviceRestoreMigrationSupport *)self hasDataMigratorPluginRequestedLibraryMigration])
  {
    int v5 = PLMigrationGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      uint64_t v9 = @"com.apple.MobileSlideShow";
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Data migrator plugin %{public}@ is in progress and has requested library migration, not waiting for plugin to complete to avoid deadlock", (uint8_t *)&v8, 0xCu);
    }

    return 1;
  }
  PLDMIsMigrationNeeded();
  return v7 ^ 1;
}

- (id)restoreTypeDescription
{
  if ([(PLDeviceRestoreMigrationSupport *)self isRestoreFromBackupSourceDifferentDevice])
  {
    uint64_t v3 = @" from different device";
  }
  else
  {
    uint64_t v3 = @" from this device";
  }
  if ([(PLDeviceRestoreMigrationSupport *)self isRestoreFromBackupSourceCloud])
  {
    int v4 = [@"iCloud" stringByAppendingString:v3];
  }
  else
  {
    int v4 = @"unknown";
  }
  if ([(PLDeviceRestoreMigrationSupport *)self isRestoreFromBackupSourceMegaBackup])
  {
    uint64_t v5 = [@"MegaBackup" stringByAppendingString:v3];

    int v4 = (__CFString *)v5;
  }
  if ([(PLDeviceRestoreMigrationSupport *)self isRestoreFromBackupSourceDeviceToDevice])
  {
    uint64_t v6 = [@"DeviceToDevice" stringByAppendingString:v3];

    int v4 = (__CFString *)v6;
  }
  if ([(PLDeviceRestoreMigrationSupport *)self isRestoreFromBackupSourceiTunes])
  {
    uint64_t v7 = [@"iTunes" stringByAppendingString:v3];

    int v4 = (__CFString *)v7;
  }
  if ([(PLDeviceRestoreMigrationSupport *)self isEraseWithoutRestore])
  {

    int v4 = @"erase without restore";
  }
  if ([(PLDeviceRestoreMigrationSupport *)self isUpgradeWithoutRestore])
  {

    int v4 = @"upgrade without restore";
  }
  return v4;
}

- (BOOL)isUpgradeWithoutRestore
{
  return [(PLDeviceRestoreMigrationSupport *)self _userDataDispositionMatchesDisposition:2];
}

- (BOOL)isEraseWithoutRestore
{
  return [(PLDeviceRestoreMigrationSupport *)self _userDataDispositionMatchesDisposition:1];
}

- (BOOL)isRestoreFromBackupSourceDifferentDevice
{
  return [(PLDeviceRestoreMigrationSupport *)self _userDataDispositionMatchesDisposition:8];
}

- (BOOL)isRestoreFromBackupSourceDeviceToDevice
{
  return [(PLDeviceRestoreMigrationSupport *)self _userDataDispositionMatchesDisposition:64];
}

- (BOOL)isRestoreFromBackupSourceiTunes
{
  return [(PLDeviceRestoreMigrationSupport *)self _userDataDispositionMatchesDisposition:32];
}

- (BOOL)isRestoreFromBackupSourceMegaBackup
{
  BOOL v3 = [(PLDeviceRestoreMigrationSupport *)self isRestoreFromBackupSourceCloud];
  if (v3)
  {
    LOBYTE(v3) = [(PLDeviceRestoreMigrationSupport *)self _userDataDispositionMatchesDisposition:128];
  }
  return v3;
}

- (BOOL)isRestoreFromBackupSourceCloud
{
  return [(PLDeviceRestoreMigrationSupport *)self _userDataDispositionMatchesDisposition:16];
}

- (BOOL)isRestoreFromBackup
{
  return [(PLDeviceRestoreMigrationSupport *)self _userDataDispositionMatchesDisposition:4];
}

- (BOOL)_userDataDispositionMatchesDisposition:(unsigned int)a3
{
  return (a3 & ~self->_userDataDisposition) == 0;
}

void __74__PLDeviceRestoreMigrationSupport__userDataDispositionMatchesDisposition___block_invoke(uint64_t a1)
{
  if (!*(_DWORD *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v6 = 0;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x2020000000;
    v2 = (uint64_t (*)(void))getDMGetUserDataDispositionSymbolLoc_ptr;
    uint64_t v9 = getDMGetUserDataDispositionSymbolLoc_ptr;
    if (!getDMGetUserDataDispositionSymbolLoc_ptr)
    {
      BOOL v3 = DataMigrationLibrary_85192();
      v7[3] = (uint64_t)dlsym(v3, "DMGetUserDataDisposition");
      getDMGetUserDataDispositionSymbolLoc_ptr = (_UNKNOWN *)v7[3];
      v2 = (uint64_t (*)(void))v7[3];
    }
    _Block_object_dispose(&v6, 8);
    if (v2)
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 16) = v2();
    }
    else
    {
      int v4 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"DMUserDataDisposition PLDMGetUserDataDisposition(void)"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PLDeviceRestoreMigrationSupport.m", 45, @"%s", dlerror());

      __break(1u);
    }
  }
}

- (BOOL)isOTARestoreInProgress
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2050000000;
  int v4 = (void *)getMBManagerClass_softClass_85245;
  uint64_t v27 = getMBManagerClass_softClass_85245;
  if (!getMBManagerClass_softClass_85245)
  {
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __getMBManagerClass_block_invoke_85246;
    v29 = &unk_1E5875840;
    v30 = &v24;
    __getMBManagerClass_block_invoke_85246((uint64_t)buf);
    int v4 = (void *)v25[3];
  }
  uint64_t v5 = v4;
  _Block_object_dispose(&v24, 8);
  id v6 = objc_alloc_init(v5);
  uint64_t v7 = objc_msgSend(v6, "restoreState", v24);
  uint64_t v8 = v7;
  if (v7)
  {
    BOOL v9 = [v7 state] - 4 < 3;
    if (![v8 state]
      && ![(PLDeviceRestoreMigrationSupport *)self isRestoreFromBackupSourceCloud])
    {
      uint64_t v10 = PLMigrationGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Data migrator indicates that we are not restoring from iCloud: RESTORE FINISHED", buf, 2u);
      }

      __int16 v11 = [(PLDeviceRestoreMigrationSupport *)self _dataMigrationInfo];
      v12 = v11;
      if (v11)
      {
        uint64_t v13 = [v11 objectForKeyedSubscript:@"PLDataMigrationDidRestoreFromCloudBackupKey"];
        int v14 = [v13 BOOLValue];

        uint64_t v15 = [MEMORY[0x1E4F8B888] currentBuildVersionString];
        v16 = [v12 objectForKeyedSubscript:@"PLDataMigrationBuildVersionKey"];
        int v17 = [v15 isEqualToString:v16];

        id v18 = PLMigrationGetLog();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
        if (v14)
        {
          if (!v17)
          {
            if (v19)
            {
              v22 = [v12 objectForKeyedSubscript:@"PLDataMigrationBuildVersionKey"];
              v23 = [MEMORY[0x1E4F8B888] currentBuildVersionString];
              *(_DWORD *)long long buf = 138543618;
              *(void *)&buf[4] = v22;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v23;
              _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Not starting up after an iCloud Restore, datamigrator info dictionary was from a different build %{public}@ than the current build %{public}@ so assuming the mobile backup restore state kMBStateIdle means there is no OTA restore in progress nor pending.", buf, 0x16u);
            }
            goto LABEL_19;
          }
          if (v19)
          {
            *(_WORD *)long long buf = 0;
            v20 = "Starting up after an iCloud Restore.  Assuming the mobile backup restore state kMBStateIdle means the "
                  "restore is complete.";
LABEL_18:
            _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, v20, buf, 2u);
          }
        }
        else if (v19)
        {
          *(_WORD *)long long buf = 0;
          v20 = "Not starting up after an iCloud Restore, datamigrator info dictionary indicates this wasn't an iCloud re"
                "store so the mobile backup restore state kMBStateIdle means there is no OTA restore in progress nor pending.";
          goto LABEL_18;
        }
      }
      else
      {
        id v18 = PLMigrationGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          v20 = "Not starting up after an iCloud Restore, but no datamigrator info dictionary found.  Assuming the mobile"
                " backup restore state kMBStateIdle means there is no OTA restore in progress nor pending.";
          goto LABEL_18;
        }
      }
LABEL_19:

      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return !v9;
}

- (id)_dataMigrationInfo
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [(PLLibraryServicesManager *)self->_libraryServicesManager pathManager];
  BOOL v3 = [v2 photoDirectoryWithType:6];

  int v4 = [v3 stringByAppendingPathComponent:*MEMORY[0x1E4F8C2F8]];
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
  id v11 = 0;
  uint64_t v7 = [v5 dictionaryWithContentsOfURL:v6 error:&v11];
  id v8 = v11;

  if (!v7)
  {
    BOOL v9 = PLMigrationGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      uint64_t v13 = v4;
      __int16 v14 = 2114;
      id v15 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Unable to read info dictionary: %{public}@: %{public}@", buf, 0x16u);
    }
  }
  return v7;
}

- (void)_linkAsideAlbumMetadata
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CB10];
  BOOL v3 = [(PLLibraryServicesManager *)self->_libraryServicesManager modelMigrator];
  int v4 = [v3 pathManager];
  uint64_t v5 = [v4 privateDirectoryWithSubType:4];
  id v6 = [v2 fileURLWithPath:v5 isDirectory:1];

  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = [v6 path];
  LODWORD(v5) = [v7 fileExistsAtPath:v8 isDirectory:0];

  if (v5)
  {
    uint64_t v9 = *MEMORY[0x1E4F1C6E8];
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1C6E8]];
    v30 = v6;
    id v11 = [v7 enumeratorAtURL:v6 includingPropertiesForKeys:v10 options:0 errorHandler:&__block_literal_global_85268];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v34;
      do
      {
        uint64_t v16 = 0;
        uint64_t v31 = v14;
        do
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v12);
          }
          int v17 = *(void **)(*((void *)&v33 + 1) + 8 * v16);
          id v32 = 0;
          int v18 = [v17 getResourceValue:&v32 forKey:v9 error:0];
          id v19 = v32;
          v20 = v19;
          if (v18 && [v19 length])
          {
            uint64_t v21 = v15;
            uint64_t v22 = v9;
            v23 = v12;
            uint64_t v24 = [v17 URLByAppendingPathExtension:@"aside"];
            v25 = [v24 path];
            uint64_t v26 = v7;
            char v27 = [v7 fileExistsAtPath:v25];

            if ((v27 & 1) == 0) {
              [v26 linkItemAtURL:v17 toURL:v24 error:0];
            }

            uint64_t v7 = v26;
            v12 = v23;
            uint64_t v9 = v22;
            uint64_t v15 = v21;
            uint64_t v14 = v31;
          }

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v14);
    }

    id v6 = v30;
  }
  else
  {
    v12 = PLMigrationGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      [v6 path];
      v29 = v28 = v7;
      *(_DWORD *)long long buf = 138543362;
      v38 = v29;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "No albums metadata found at path '%{public}@'", buf, 0xCu);

      uint64_t v7 = v28;
    }
  }
}

uint64_t __58__PLDeviceRestoreMigrationSupport__linkAsideAlbumMetadata__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = PLMigrationGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = [v4 path];
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Unable to enumerate '%{public}@': %@", (uint8_t *)&v9, 0x16u);
  }
  return 1;
}

- (void)_setAssetsToOTARestoreAsIncompleteWithContext:(id)a3 populateAlbumMappings:(id)a4
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1C0D0];
  int v9 = +[PLManagedAsset entityName];
  uint64_t v10 = [v8 fetchRequestWithEntityName:v9];

  __int16 v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"complete != 0"];
  [v10 setPredicate:v11];
  v36[0] = @"albums";
  v36[1] = @"mediaAnalysisAttributes";
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  [v10 setRelationshipKeyPathsForPrefetching:v12];

  [v10 setFetchBatchSize:100];
  id v33 = 0;
  uint64_t v13 = [v6 executeFetchRequest:v10 error:&v33];
  id v14 = v33;
  if (v13)
  {
    uint64_t v15 = [MEMORY[0x1E4F8B908] fileManager];
    if ([v13 count])
    {
      uint64_t v16 = [(PLLibraryServicesManager *)self->_libraryServicesManager modelMigrator];
      int v17 = [v16 generatePathToAssetUUIDRecoveryMapping];

      int v18 = [(PLLibraryServicesManager *)self->_libraryServicesManager modelMigrator];
      [v18 archiveAssetUUIDForPathPlist:v17];
    }
    BOOL v19 = [(PLDeviceRestoreMigrationSupport *)self isRestoreFromBackupSourceMegaBackup];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __103__PLDeviceRestoreMigrationSupport__setAssetsToOTARestoreAsIncompleteWithContext_populateAlbumMappings___block_invoke;
    v28[3] = &unk_1E5870588;
    id v29 = v15;
    BOOL v32 = v19;
    id v30 = v6;
    id v31 = v7;
    v20 = v15;
    uint64_t v21 = [v30 enumerateWithIncrementalSaveUsingObjects:v13 withBlock:v28];
    uint64_t v22 = PLMigrationGetLog();
    v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v35 = (uint64_t)v21;
        uint64_t v24 = "set assets to OTA restore as incomplete failed: %@";
        v25 = v23;
        os_log_type_t v26 = OS_LOG_TYPE_ERROR;
LABEL_11:
        _os_log_impl(&dword_19B3C7000, v25, v26, v24, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = [v13 count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v35 = v27;
      uint64_t v24 = "Fix %lu cloudMaster nil original filename";
      v25 = v23;
      os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_11;
    }

    goto LABEL_13;
  }
  v20 = PLBackendGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v35 = (uint64_t)v14;
    _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Failed to get all assets to OTA restore: %@", buf, 0xCu);
  }
LABEL_13:
}

void __103__PLDeviceRestoreMigrationSupport__setAssetsToOTARestoreAsIncompleteWithContext_populateAlbumMappings___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 mainFileURL];
  id v5 = v4;
  if (!v4
    || (id v6 = *(void **)(a1 + 32),
        [v4 path],
        id v7 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v6) = [v6 fileExistsAtPath:v7 isDirectory:0],
        v7,
        (v6 & 1) == 0))
  {
    [v3 setComplete:0];
    if (!*(unsigned char *)(a1 + 56)) {
      [v3 setEffectiveThumbnailIndex:0x7FFFFFFFFFFFFFFFLL];
    }
    if ([v3 kind] == 1)
    {
      uint64_t v8 = [v3 mediaAnalysisAttributes];
      if (v8)
      {
        int v9 = (void *)v8;
        int v10 = [v3 isVideoKeyFrameSet];

        if (v10)
        {
          __int16 v11 = *(void **)(a1 + 40);
          id v12 = [v3 mediaAnalysisAttributes];
          [v11 deleteObject:v12];

          [v3 resetVideoKeyFrameTime];
        }
      }
    }
    uint64_t v13 = [v3 albums];
    if ([v13 count])
    {
      id v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v15 = v13;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v24 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "uuid", (void)v23);
            [v14 addObject:v20];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v17);
      }

      uint64_t v21 = *(void **)(a1 + 48);
      uint64_t v22 = [v3 uuid];
      [v21 setObject:v14 forKey:v22];
    }
  }
}

- (void)_batchDeleteAllAssetsExcludedFromOTARestoreWithContext:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F8BA10];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "predicateForIncludeMask:useIndex:", objc_msgSend(v3, "maskForAssetsExcludedFromOTARestore"), 1);
  id v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = +[PLManagedAsset entityName];
  uint64_t v8 = [v6 fetchRequestWithEntityName:v7];

  [v8 setPredicate:v5];
  int v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v8];
  [v9 setResultType:2];
  id v15 = 0;
  int v10 = [v4 executeRequest:v9 error:&v15];

  id v11 = v15;
  id v12 = PLMigrationGetLog();
  uint64_t v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v10 result];
      *(_DWORD *)long long buf = 138543362;
      id v17 = v14;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Deleted %{public}@ assets excluded from OTA backup/restore (iTunes synced, iCloud shared, etc)", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v17 = v11;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "batch delete of assets excluded from OTA restore failed, %@", buf, 0xCu);
  }
}

- (void)_setAlbumPendingItemCountsWithContext:(id)a3 shouldSave:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[PLGenericAlbum allAlbumsInManagedObjectContext:v5];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v12 = [v11 kindValue];
        if (v12 != 2 && v12 != 1000 && v12 != 12) {
          continue;
        }
        id v14 = [v11 assets];
        uint64_t v15 = [v14 count];

        [v11 setPendingItemsCount:v15];
        [v11 setPendingItemsType:4];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v8);
  }
  if (v4)
  {
    if ([v5 hasChanges])
    {
      id v19 = 0;
      char v16 = [v5 save:&v19];
      id v17 = v19;
      if ((v16 & 1) == 0)
      {
        uint64_t v18 = PLMigrationGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          id v25 = v17;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "failed to save album pending counts: %@", buf, 0xCu);
        }

        [v5 rollback];
      }
    }
    else
    {
      id v17 = 0;
    }
  }
}

- (void)deletePhotoStreamData
{
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  [v4 setObject:*MEMORY[0x1E4F8C9A8] forKey:*MEMORY[0x1E4F8C970]];
  id v3 = [(PLLibraryServicesManager *)self->_libraryServicesManager imageWriter];
  [v3 enqueueJob:v4];
}

- (void)_prepareDatabaseForOTAAssetsPhase
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ((PLIsAssetsd() & 1) == 0)
  {
    long long v20 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v21 = NSStringFromSelector(a2);
    [v20 handleFailureInMethod:a2, self, @"PLDeviceRestoreMigrationSupport.m", 150, @"%@ can only be called from assetsd", v21 object file lineNumber description];
  }
  id v4 = PLMigrationGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Starting _prepareDatabaseForOTAAssetsPhase", buf, 2u);
  }

  id v5 = [(PLLibraryServicesManager *)self->_libraryServicesManager modelMigrator];
  id v6 = [(PLLibraryServicesManager *)self->_libraryServicesManager persistentStoreCoordinator];
  uint64_t v7 = [v5 managedObjectContextForMigrationWithName:"-[PLDeviceRestoreMigrationSupport _prepareDatabaseForOTAAssetsPhase]" persistentStoreCoordinator:v6 concurrencyType:1];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __68__PLDeviceRestoreMigrationSupport__prepareDatabaseForOTAAssetsPhase__block_invoke;
  v26[3] = &unk_1E5873A50;
  v26[4] = self;
  id v9 = v7;
  id v27 = v9;
  id v10 = v8;
  id v28 = v10;
  [v9 performBlockAndWait:v26];
  id v11 = [(PLLibraryServicesManager *)self->_libraryServicesManager pathManager];
  int v12 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v10 format:100 options:0 error:0];
  uint64_t v13 = [v11 pathToAssetsToAlbumsMapping];
  id v25 = 0;
  char v14 = [v12 writeToFile:v13 options:1073741825 error:&v25];
  id v15 = v25;

  if ((v14 & 1) == 0)
  {
    char v16 = PLMigrationGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v30 = v15;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Failed to write assetsToAlbums mapping %@", buf, 0xCu);
    }
  }
  [(PLDeviceRestoreMigrationSupport *)self deletePhotoStreamData];
  id v17 = PLMigrationGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Performing reset face analysis to force reanalysis of faceprint data after restore from iCloud", buf, 2u);
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __68__PLDeviceRestoreMigrationSupport__prepareDatabaseForOTAAssetsPhase__block_invoke_36;
  v22[3] = &unk_1E5875E18;
  id v23 = v11;
  id v24 = v9;
  id v18 = v9;
  id v19 = v11;
  [v18 performBlockAndWait:v22];
}

uint64_t __68__PLDeviceRestoreMigrationSupport__prepareDatabaseForOTAAssetsPhase__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _batchDeleteAllAssetsExcludedFromOTARestoreWithContext:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _setAlbumPendingItemCountsWithContext:*(void *)(a1 + 40) shouldSave:1];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  return [v2 _setAssetsToOTARestoreAsIncompleteWithContext:v3 populateAlbumMappings:v4];
}

BOOL __68__PLDeviceRestoreMigrationSupport__prepareDatabaseForOTAAssetsPhase__block_invoke_36(uint64_t a1)
{
  return +[PLModelMigrator performFaceAnalysisResetWithResetLevel:2 pathManager:*(void *)(a1 + 32) context:*(void *)(a1 + 40)];
}

- (BOOL)prepareDatabaseForOTARestoreIfNecessaryWithMigrationType:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = [(PLLibraryServicesManager *)self->_libraryServicesManager modelMigrator];
  id v6 = [v5 postProcessingToken];

  int v7 = [v6 needsToPrepareForBackgroundRestore];
  id v8 = PLMigrationGetLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Found OTA post-processing token, will prepare for OTA background restore", (uint8_t *)&buf, 2u);
    }

    id v8 = -[PLDeviceRestoreMigrationSupport _newShortLivedLibrarySupportingLibraryOpenWithName:](self, "_newShortLivedLibrarySupportingLibraryOpenWithName:", "-[PLDeviceRestoreMigrationSupport prepareDatabaseForOTARestoreIfNecessaryWithMigrationType:]");
    id v10 = [(PLLibraryServicesManager *)self->_libraryServicesManager modelMigrator];
    [v10 dontImportFileSystemDataIntoDatabaseWithPhotoLibrary:v8];

    if ((unint64_t)a3 <= 4 && ((1 << a3) & 0x15) != 0)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v24 = 0x2020000000;
      char v25 = 0;
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      id v18 = __92__PLDeviceRestoreMigrationSupport_prepareDatabaseForOTARestoreIfNecessaryWithMigrationType___block_invoke;
      id v19 = &unk_1E5875340;
      id v20 = v6;
      long long v21 = self;
      p_long long buf = &buf;
      pl_dispatch_once();
      if (!*(unsigned char *)(*((void *)&buf + 1) + 24))
      {
        id v11 = PLMigrationGetLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v15 = 0;
          _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Already prepared database for OTA background restore, invalid token state returned YES from needsToPrepareForBackgroundRestore", v15, 2u);
        }
      }
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      int v12 = PLMigrationGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = PLStringFromMigrationType(a3, 1);
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v13;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Writing OTA post-processing complete token, should prepare database for OTA restore with migration type %{public}@ returned NO (expected after creating new database)", (uint8_t *)&buf, 0xCu);
      }
      [v6 writeBackgroundRestorePostProcessingCompleteAndArchiveTokens];
    }
  }
  else if (v9)
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "No OTA post-processing token found, no need to prepare for background restore", (uint8_t *)&buf, 2u);
  }

  return v7;
}

uint64_t __92__PLDeviceRestoreMigrationSupport_prepareDatabaseForOTARestoreIfNecessaryWithMigrationType___block_invoke(uint64_t a1)
{
  v2 = PLMigrationGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Preparing database for OTA background restore, (foreground restore complete)", buf, 2u);
  }

  [*(id *)(a1 + 32) writeBackgroundRestorePostProcessingInProgressToken];
  [*(id *)(a1 + 40) _linkAsideAlbumMetadata];
  [*(id *)(a1 + 40) _prepareDatabaseForOTAAssetsPhase];
  uint64_t v3 = PLMigrationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Done preparing database for OTA background restore (writing post-processing complete token)", v5, 2u);
  }

  uint64_t result = [*(id *)(a1 + 32) writeBackgroundRestorePostProcessingCompleteAndArchiveTokens];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

- (PLDeviceRestoreMigrationSupport)initWithLibraryServicesManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLDeviceRestoreMigrationSupport;
  id v6 = [(PLDeviceRestoreMigrationSupport *)&v9 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryServicesManager, a3);
    *(void *)&v7->_userDataDisposition = 0;
    v7->_prerequisitesCompleteBlockLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (id)_newShortLivedLibrarySupportingLibraryOpenWithName:(const char *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(PLPhotoLibraryOptions);
  [(PLPhotoLibraryOptions *)v5 setRequiredState:[(PLLibraryServicesManager *)self->_libraryServicesManager state]];
  [(PLPhotoLibraryOptions *)v5 setRefreshesAfterSave:0];
  id v6 = [(PLLibraryServicesManager *)self->_libraryServicesManager libraryBundle];
  id v16 = 0;
  id v7 = +[PLPhotoLibrary newPhotoLibraryWithName:a3 loadedFromBundle:v6 options:v5 error:&v16];
  id v8 = v16;

  if (!v7)
  {
    id v10 = v8;
    id v11 = v5;
    int v12 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      [(PLPhotoLibraryOptions *)v11 requiredState];
      uint64_t v13 = PLStringFromLibraryServicesState();
      char v14 = [(PLLibraryServicesManager *)self->_libraryServicesManager libraryBundle];
      id v15 = [v14 libraryURL];
      *(_DWORD *)long long buf = 136446978;
      id v18 = "-[PLDeviceRestoreMigrationSupport _newShortLivedLibrarySupportingLibraryOpenWithName:]";
      __int16 v19 = 2114;
      id v20 = v13;
      __int16 v21 = 2112;
      long long v22 = v15;
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Failed to load photo library %{public}s in state %{public}@ with url %@, %@", buf, 0x2Au);
    }
    __break(1u);
  }

  return v7;
}

@end