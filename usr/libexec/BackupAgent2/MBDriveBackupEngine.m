@interface MBDriveBackupEngine
+ (id)backupEngineWithSettingsContext:(id)a3 debugContext:(id)a4;
- (BOOL)_isModifiedWithFileDescriptor:(int)a3 reason:(id *)a4;
- (BOOL)_shouldRetry;
- (BOOL)_uploadStatusToDriveWithSnapshotState:(int)a3 error:(id *)a4;
- (BOOL)cancel;
- (BOOL)fileScanner:(id)a3 isFileAddedOrModified:(id)a4;
- (BOOL)fileScanner:(id)a3 shouldExcludeFile:(id)a4;
- (BOOL)isFinalRetry;
- (BOOL)isModifiedSince:(int64_t)a3 reason:(id *)a4;
- (BOOL)movedOldBackup;
- (MBDriveBackupEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4;
- (MBDriveSettingsContext)settingsContext;
- (MBFileScanner)scanner;
- (MBManifestDB)backupManifestDB;
- (MBManifestDB)snapshotManifestDB;
- (MBMountedSnapshotTracker)mountedSnapshotTracker;
- (MBProgress)progress;
- (NSMutableSet)cloneIDCache;
- (NSMutableSet)inodeCache;
- (NSSet)prefixDirectories;
- (NSString)movedBackupName;
- (NSString)password;
- (double)startTime;
- (id)_addBackupPathsNotInManifestDB:(id)a3 operationType:(int)a4;
- (id)_addMetadataToFile:(id)a3;
- (id)_backupAfterPreflight;
- (id)_cleanup;
- (id)_cleanupDeviceSnapshotDir;
- (id)_compactSQLiteDatabaseAtPath:(id)a3 file:(id)a4 error:(id *)a5;
- (id)_deviceSnapshotDir;
- (id)_deviceSnapshotManifestDatabasePath;
- (id)_deviceSnapshotPropertiesPath;
- (id)_fileHandleWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5 error:(id *)a6;
- (id)_findPathsRemovedFromBackup;
- (id)_moveBatchWithPaths:(id)a3;
- (id)_moveInBatchesWithOperationType:(int)a3;
- (id)_moveWithOperationType:(int)a3;
- (id)_openBackupManifestForResume;
- (id)_postconditions;
- (id)_preconditions;
- (id)_preflight;
- (id)_prepareForPreflight;
- (id)_prepareForUpload;
- (id)_prepareFreeSpace;
- (id)_prepareMoveBackup;
- (id)_prepareProgress;
- (id)_prepareResume;
- (id)_prepareSnapshot;
- (id)_removeBatchWithPaths:(id)a3;
- (id)_removeDeviceSnapshot;
- (id)_removeInBatchesWithOperationType:(int)a3;
- (id)_removeOldBackup;
- (id)_removeWithOperationType:(int)a3;
- (id)_resume;
- (id)_resumeAfterFailureMoving;
- (id)_resumeAfterFailureRemoving;
- (id)_resumeAfterFailureUploading;
- (id)_resumeAfterSuccess;
- (id)_retry;
- (id)_scan;
- (id)_scanAllDomains;
- (id)_scanFinished;
- (id)_setup;
- (id)_setupEncryption;
- (id)_setupManifestDB;
- (id)_setupOperationJournal;
- (id)_setupSnapshotDirectory;
- (id)_snapshotFilesystem;
- (id)_upload;
- (id)_uploadInBatches;
- (id)_verifyBackupReloadingManifest:(BOOL)a3;
- (id)backup;
- (id)backupAfterPreflight;
- (id)cleanup;
- (id)endWithError:(id)a3;
- (id)fileHandleWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5 error:(id *)a6;
- (id)fileScanner:(id)a3 didFindFile:(id)a4;
- (id)preflight;
- (id)promptUser;
- (id)properties;
- (int)engineMode;
- (int)engineType;
- (int64_t)maximumModificationTime;
- (unint64_t)batchSize;
- (unint64_t)concurrentUploadBatchCount;
- (unint64_t)retryCount;
- (unint64_t)uploadFileCount;
- (unint64_t)uploadSize;
- (unint64_t)uploadSizeExcludingHardlinksAndClones;
- (void)_addFileToLeaveAlone:(id)a3 flags:(unint64_t)a4;
- (void)_addFileToMove:(id)a3;
- (void)_addFileToUploadAndMove:(id)a3 flags:(unint64_t)a4;
- (void)_recordCurrentTime;
- (void)_removeFilesystemSnapshot;
- (void)_uploadBatch:(id)a3 options:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)fileModifiedWhileUploadingFile:(id)a3 reason:(id)a4;
- (void)setBatchSize:(unint64_t)a3;
- (void)setCloneIDCache:(id)a3;
- (void)setConcurrentUploadBatchCount:(unint64_t)a3;
- (void)setEngineType:(int)a3;
- (void)setInodeCache:(id)a3;
- (void)setMountedSnapshotTracker:(id)a3;
- (void)setMovedBackupName:(id)a3;
- (void)setMovedOldBackup:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setPrefixDirectories:(id)a3;
- (void)setScanner:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setUploadFileCount:(unint64_t)a3;
- (void)setUploadSize:(unint64_t)a3;
- (void)setUploadSizeExcludingHardlinksAndClones:(unint64_t)a3;
@end

@implementation MBDriveBackupEngine

+ (id)backupEngineWithSettingsContext:(id)a3 debugContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MBDriveBackupEngine alloc] initWithSettingsContext:v6 debugContext:v5];

  return v7;
}

- (MBDriveBackupEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v46 = 0;
  v8 = +[MBPersona personalPersonaWithError:&v46];
  id v9 = v46;
  id v10 = [objc_alloc((Class)MBDomainManager) initWithPersona:v8];
  v45.receiver = self;
  v45.super_class = (Class)MBDriveBackupEngine;
  v11 = [(MBEngine *)&v45 initWithSettingsContext:v6 debugContext:v7 domainManager:v10];
  if (v11)
  {
    v12 = objc_alloc_init(MBProgress);
    progress = v11->_progress;
    v11->_progress = v12;

    v14 = [[MBDriveScript alloc] initWithProgress:v11->_progress];
    driveScript = v11->_driveScript;
    v11->_driveScript = v14;

    v16 = [MBProgressDrive alloc];
    v17 = v11->_driveScript;
    v18 = [(MBDriveBackupEngine *)v11 settingsContext];
    v19 = [v18 drive];
    v20 = [(MBProgressDrive *)v16 initWithScript:v17 delegate:v19];
    drive = v11->_drive;
    v11->_drive = &v20->super;

    v22 = [[MBBackupHelper alloc] initWithSettingsContext:v6 domainManager:v11->super._domainManager];
    backupHelper = v11->_backupHelper;
    v11->_backupHelper = v22;

    v24 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    modifiedDomains = v11->_modifiedDomains;
    v11->_modifiedDomains = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    uploadOperationsByPath = v11->_uploadOperationsByPath;
    v11->_uploadOperationsByPath = v26;

    uint64_t v28 = objc_opt_new();
    mountedSnapshotTracker = v11->_mountedSnapshotTracker;
    v11->_mountedSnapshotTracker = (MBMountedSnapshotTracker *)v28;

    v30 = [(MBDriveBackupEngine *)v11 settingsContext];
    unsigned int v31 = [v30 isDeviceTransfer];

    if (v31)
    {
      v11->_engineType = 4;
      if (v11->super._preflightProperties) {
        sub_100099104();
      }
      v32 = objc_alloc_init(MBProperties);
      preflightProperties = v11->super._preflightProperties;
      v11->super._preflightProperties = v32;
    }
    else
    {
      v11->_engineType = 1;
    }
    v34 = +[MBEngine stringForEngineType:[(MBDriveBackupEngine *)v11 engineType]];
    v35 = +[MBEngine stringForEngineMode:[(MBDriveBackupEngine *)v11 engineMode]];
    v36 = +[NSString stringWithFormat:@"%@.%@.%@", @"com.apple.MobileBackup", v34, v35];

    v37 = [[MBAnalyticsEvent alloc] initWithEventName:v36];
    [(MBEngine *)v11 setAnalyticsEvent:v37];

    v11->_concurrentUploadBatchCount = 1;
    unsigned int v38 = [v7 intForName:@"BatchSize"];
    if (v38) {
      int v39 = v38;
    }
    else {
      int v39 = 128;
    }
    v11->_batchSize = v39;
    if ((_os_feature_enabled_impl() & v31) == 1)
    {
      v40 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      inodeCache = v11->_inodeCache;
      v11->_inodeCache = v40;

      v42 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      cloneIDCache = v11->_cloneIDCache;
      v11->_cloneIDCache = v42;
    }
  }

  return v11;
}

- (void)dealloc
{
  [(MBDriveBackupEngine *)self setScanner:0];
  [(MBDriveBackupEngine *)self _removeFilesystemSnapshot];
  v3.receiver = self;
  v3.super_class = (Class)MBDriveBackupEngine;
  [(MBDriveBackupEngine *)&v3 dealloc];
}

- (MBDriveSettingsContext)settingsContext
{
  return (MBDriveSettingsContext *)self->super._settingsContext;
}

- (NSSet)prefixDirectories
{
  v2 = self;
  objc_sync_enter(v2);
  prefixDirectories = v2->_prefixDirectories;
  if (!prefixDirectories)
  {
    v4 = (NSSet *)objc_opt_new();
    uint64_t v5 = 0;
    do
    {
      id v6 = +[NSString stringWithFormat:@"%02x", v5];
      [(NSSet *)v4 addObject:v6];

      uint64_t v5 = (v5 + 1);
    }
    while (v5 != 256);
    id v7 = v2->_prefixDirectories;
    v2->_prefixDirectories = v4;

    prefixDirectories = v2->_prefixDirectories;
  }
  v8 = prefixDirectories;
  objc_sync_exit(v2);

  return v8;
}

- (id)preflight
{
  +[NSDate timeIntervalSinceReferenceDate];
  double v5 = v4;
  -[MBDriveBackupEngine setStartTime:](self, "setStartTime:");
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting backup", buf, 2u);
    _MBLog();
  }

  id v7 = [(MBDriveBackupEngine *)self settingsContext];
  [v7 log];

  v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    debugContext = self->super._debugContext;
    *(_DWORD *)buf = 138412290;
    double v19 = *(double *)&debugContext;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "DebugContext: %@", buf, 0xCu);
    _MBLog();
  }

  id v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting preflight", buf, 2u);
    _MBLog();
  }

  double v11 = [(MBDriveBackupEngine *)self _preflight];
  +[NSDate timeIntervalSinceReferenceDate];
  double v13 = v12;
  v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v19 = v13 - v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Finished preflight in %0.3fs", buf, 0xCu);
    _MBLog();
  }

  if (v11 != 0.0)
  {
    v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      double v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to preflight: %@", buf, 0xCu);
      _MBLog();
    }

    id v16 = [(MBDriveBackupEngine *)self _cleanup];
  }

  return *(id *)&v11;
}

- (id)backupAfterPreflight
{
  double v4 = [(MBDriveBackupEngine *)self _backupAfterPreflight];
  +[NSDate timeIntervalSinceReferenceDate];
  double v6 = v5;
  [(MBDriveBackupEngine *)self startTime];
  double v8 = v7;
  id v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v14 = v6 - v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Finished backup in %0.3fs", buf, 0xCu);
    _MBLog();
  }

  if (v4 != 0.0)
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      double v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to backup: %@", buf, 0xCu);
      _MBLog();
    }

    id v11 = [(MBDriveBackupEngine *)self _cleanup];
  }

  return *(id *)&v4;
}

- (id)cleanup
{
  double v4 = [(MBDriveBackupEngine *)self _cleanup];
  if (v4)
  {
    double v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      double v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to cleanup: %@", buf, 0xCu);
      _MBLog();
    }
  }

  return v4;
}

- (id)promptUser
{
  if (sub_100092304()
    && (v22[0] = 0,
        [(MBEngine *)self persona],
        objc_super v3 = objc_claimAutoreleasedReturnValue(),
        unsigned int v4 = [v3 getBooleanValueForKey:@"EnableLocalBackupPrompt" keyExists:v22],
        v3,
        v22[0])
    && !v4)
  {
    double v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = @"EnableLocalBackupPrompt";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@:%d", buf, 0x12u);
      _MBLog();
    }

    id v6 = 0;
    double v7 = 0;
  }
  else
  {
    id v9 = objc_opt_new();
    id v10 = MBLocalizedStringFromTable();
    uint64_t v11 = MBLocalizedStringFromTable();
    double v12 = (void *)v11;
    double v13 = 0;
    if (v10 && v11)
    {
      v26[0] = &off_1000FDD68;
      v26[1] = &off_1000FDD80;
      v27[0] = v10;
      v27[1] = v11;
      double v13 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v25 = 0;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100022608;
    v19[3] = &unk_1000F1540;
    v21 = buf;
    double v14 = dispatch_semaphore_create(0);
    v20 = v14;
    [v9 evaluatePolicy:1013 options:v13 reply:v19];
    dispatch_time_t v15 = dispatch_time(0, 1800000000000);
    intptr_t v16 = dispatch_semaphore_wait(v14, v15);
    if (v16)
    {
      v17 = MBGetDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v22 = 134217984;
        uint64_t v23 = 30;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Timed out waiting %lld minutes for passcode", v22, 0xCu);
        _MBLog();
      }

      [v9 invalidate];
      id v6 = +[MBError errorWithCode:208 format:@"Device locked - timeout waiting for passcode entry"];
      double v7 = v6;
    }
    else
    {
      if (*(unsigned char *)(*(void *)&buf[8] + 24))
      {
        id v6 = 0;
      }
      else
      {
        id v6 = +[MBError errorWithCode:208 format:@"Device locked"];
      }
      double v7 = 0;
    }

    _Block_object_dispose(buf, 8);
    if (!v16)
    {
      id v6 = v6;
      double v7 = v6;
    }
  }

  return v7;
}

- (id)backup
{
  objc_super v3 = [(MBDriveBackupEngine *)self promptUser];
  if (!v3)
  {
    objc_super v3 = [(MBDriveBackupEngine *)self preflight];
    if (!v3)
    {
      objc_super v3 = [(MBDriveBackupEngine *)self backupAfterPreflight];
      if (!v3)
      {
        objc_super v3 = [(MBDriveBackupEngine *)self cleanup];
      }
    }
  }

  return v3;
}

- (id)_preflight
{
  objc_super v3 = [(MBDriveBackupEngine *)self _preconditions];
  if (!v3)
  {
    objc_super v3 = [(MBDriveBackupEngine *)self _setup];
    if (!v3)
    {
      unsigned int v4 = [(MBDriveBackupEngine *)self settingsContext];
      double v5 = [v4 plugins];
      id v6 = [v5 objectEnumerator];
      objc_super v3 = sub_10003F3E4(self, v6, "startingBackupWithEngine:", (uint64_t)self);

      if (!v3)
      {
        objc_super v3 = [(MBDriveBackupEngine *)self _resume];
        if (!v3)
        {
          if (!self->_fullBackup)
          {
            uint64_t v7 = [(MBDriveBackupEngine *)self _verifyBackupReloadingManifest:0];
            if (v7)
            {
              double v8 = (void *)v7;
              id v9 = MBGetDefaultLog();
              if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                double v13 = v8;
                _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Existing backup is corrupt, forcing a full backup: %@", buf, 0xCu);
                uint64_t v11 = v8;
                _MBLog();
              }

              self->_fullBackup = 1;
            }
          }
          objc_super v3 = [(MBDriveBackupEngine *)self _scan];
          if (!v3)
          {
            objc_super v3 = [(MBDriveBackupEngine *)self _prepareForPreflight];
          }
        }
      }
    }
  }

  return v3;
}

- (id)_backupAfterPreflight
{
  while (1)
  {
    uint64_t v3 = [(MBDriveBackupEngine *)self _prepareForUpload];
    if (v3) {
      goto LABEL_7;
    }
    uint64_t v3 = [(MBDriveBackupEngine *)self _upload];
    if (v3) {
      goto LABEL_7;
    }
    if (![(MBDriveBackupEngine *)self _shouldRetry]) {
      break;
    }
    uint64_t v3 = [(MBDriveBackupEngine *)self _retry];
    if (!v3)
    {
      uint64_t v3 = [(MBDriveBackupEngine *)self _scan];
      if (!v3)
      {
        uint64_t v3 = [(MBDriveBackupEngine *)self _prepareForPreflight];
        if (!v3) {
          continue;
        }
      }
    }
    goto LABEL_7;
  }
  unsigned int v4 = [(MBDriveBackupEngine *)self _moveWithOperationType:3];
  if (!v4)
  {
    unsigned int v4 = [(MBDriveBackupEngine *)self _removeWithOperationType:4];
    if (!v4)
    {
      unsigned int v4 = [(MBDriveBackupEngine *)self _removeDeviceSnapshot];
      if (!v4)
      {
        unsigned int v4 = [(MBDriveBackupEngine *)self _removeOldBackup];
        if (!v4)
        {
          if ([(MBEngine *)self isDeviceTransferEngine]
            || ([(MBDriveBackupEngine *)self _verifyBackupReloadingManifest:1],
                (unsigned int v4 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            id v6 = [(MBDriveBackupEngine *)self settingsContext];
            uint64_t v7 = [v6 plugins];
            double v8 = [v7 reverseObjectEnumerator];
            unsigned int v4 = sub_10003F3E4(self, v8, "endingBackupWithEngine:", (uint64_t)self);

            if (!v4)
            {
              uint64_t v3 = [(MBDriveBackupEngine *)self _postconditions];
LABEL_7:
              unsigned int v4 = (void *)v3;
            }
          }
        }
      }
    }
  }

  return v4;
}

- (id)_setup
{
  if ([(MBDebugContext *)self->super._debugContext isFlagSet:@"SimulateCrash"]) {
    abort();
  }
  if ([(MBDebugContext *)self->super._debugContext isFlagSet:@"SimulateException"]) {
    +[NSException raise:@"SimulatedException" format:@"Simulated exception"];
  }
  signed int v4 = [(MBDebugContext *)self->super._debugContext intForName:@"SimulateErrorCode"];
  if (!v4)
  {
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Initializing app manager", buf, 2u);
      _MBLog();
    }

    uint64_t v7 = [MBAppManager alloc];
    double v8 = [(MBDriveBackupEngine *)self settingsContext];
    id v9 = [v8 mobileInstallation];
    id v10 = [(MBAppManager *)v7 initWithMobileInstallation:v9];
    appManager = self->super._appManager;
    self->super._appManager = v10;

    double v12 = self->super._appManager;
    double v13 = [(MBEngine *)self persona];
    id v75 = 0;
    LOBYTE(v12) = [(MBAppManager *)v12 loadAppsWithPersona:v13 safeHarbors:1 error:&v75];
    double v14 = (__CFString *)v75;

    if (v12)
    {
      dispatch_time_t v15 = MBGetDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Removing old safe harbors", buf, 2u);
        _MBLog();
      }

      intptr_t v16 = self->super._appManager;
      v17 = [(MBDriveBackupEngine *)self settingsContext];
      [v17 safeHarborExpiration];
      -[MBAppManager removeOldSafeHarborsWithExpiration:](v16, "removeOldSafeHarborsWithExpiration:");

      v18 = [(MBDomainManager *)self->super._domainManager domainForPath:@"/var/mobile/Applications" relativePath:0];

      double v19 = MBGetDefaultLog();
      v20 = v19;
      v64 = v14;
      if (v18)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v78 = @"/var/mobile/Applications";
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@ is being backed up directly", buf, 0xCu);
          v61 = @"/var/mobile/Applications";
          _MBLog();
        }
      }
      else
      {
        v63 = v3;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Creating container domains", buf, 2u);
          _MBLog();
        }

        v20 = [(MBAppManager *)self->super._appManager allRestrictedDomainNames];
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id obj = [(MBAppManager *)self->super._appManager allContainers];
        id v22 = [obj countByEnumeratingWithState:&v71 objects:v79 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v72;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v72 != v24) {
                objc_enumerationMutation(obj);
              }
              v26 = *(void **)(*((void *)&v71 + 1) + 8 * i);
              v27 = [v26 domain:v61];
              uint64_t v28 = [v27 name];
              unsigned __int8 v29 = [v20 containsObject:v28];

              if (v29)
              {
                v30 = MBGetDefaultLog();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  unsigned int v31 = [v26 identifier];
                  *(_DWORD *)buf = 138412290;
                  CFStringRef v78 = v31;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Not backing up restricted app: %@", buf, 0xCu);

                  v61 = [v26 identifier];
                  _MBLog();
                }
              }
              else
              {
                domainManager = self->super._domainManager;
                v30 = [v26 domain];
                [(MBDomainManager *)domainManager addDomain:v30];
              }
            }
            id v23 = [obj countByEnumeratingWithState:&v71 objects:v79 count:16];
          }
          while (v23);
        }

        uint64_t v3 = v63;
      }

      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      v33 = [(MBAppManager *)self->super._appManager allSystemContainers];
      id v34 = [v33 countByEnumeratingWithState:&v67 objects:v76 count:16];
      if (v34)
      {
        id v35 = v34;
        uint64_t v36 = *(void *)v68;
        do
        {
          for (j = 0; j != v35; j = (char *)j + 1)
          {
            if (*(void *)v68 != v36) {
              objc_enumerationMutation(v33);
            }
            unsigned int v38 = [*(id *)(*((void *)&v67 + 1) + 8 * (void)j) domain];
            int v39 = self->super._domainManager;
            v40 = [v38 name];
            LOBYTE(v39) = [(MBDomainManager *)v39 containsDomainName:v40];

            if ((v39 & 1) == 0) {
              [(MBDomainManager *)self->super._domainManager addDomain:v38];
            }
          }
          id v35 = [v33 countByEnumeratingWithState:&v67 objects:v76 count:16];
        }
        while (v35);
      }

      id v41 = objc_alloc((Class)NSMutableSet);
      v42 = [(MBDomainManager *)self->super._domainManager allDomains];
      v43 = (NSMutableSet *)[v41 initWithArray:v42];
      domainsToScan = self->_domainsToScan;
      self->_domainsToScan = v43;

      [(MBDebugContext *)self->super._debugContext setInt:0 forName:@"RetryCount"];
      if ([(MBEngine *)self isDeviceTransferEngine])
      {
        [(MBDriveBackupEngine *)self password];
        double v14 = v64;
        if (objc_claimAutoreleasedReturnValue()) {
          sub_100099130();
        }
      }
      else
      {
        v66 = v64;
        objc_super v45 = +[MBKeychainManager fetchLocalBackupPasswordAndReturnError:&v66];
        id v46 = v66;

        [(MBDriveBackupEngine *)self setPassword:v45];
        v47 = [(MBDriveBackupEngine *)self password];

        if (v47 || !+[MBError isError:v46 withCode:4])
        {
          if (v46)
          {
            v48 = MBGetDefaultLog();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              CFStringRef v78 = v46;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Error fetching backup password: %@", buf, 0xCu);
              _MBLog();
            }

            v21 = v46;
            double v14 = v21;
            goto LABEL_67;
          }
        }
        else
        {
        }
        v49 = [(MBDriveBackupEngine *)self password];

        if (v49)
        {
          v50 = [(MBDriveBackupEngine *)self settingsContext];
          v51 = [(MBDriveBackupEngine *)self password];
          [v50 updatePassword:v51];
        }
        double v14 = 0;
      }
      v52 = [(MBDriveBackupEngine *)self password];
      [(MBEngine *)self setEncrypted:v52 != 0];

      v53 = MBGetDefaultLog();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        if ([(MBEngine *)self encrypted]) {
          CFStringRef v54 = @"enabled";
        }
        else {
          CFStringRef v54 = @"disabled";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v78 = v54;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Encryption is %@", buf, 0xCu);
        if ([(MBEngine *)self encrypted]) {
          CFStringRef v55 = @"enabled";
        }
        else {
          CFStringRef v55 = @"disabled";
        }
        CFStringRef v62 = v55;
        _MBLog();
      }

      [(MBDebugContext *)self->super._debugContext setBool:[(MBEngine *)self encrypted] forName:@"IsEncrypted"];
      if ([(MBEngine *)self isDeviceTransferEngine]) {
        goto LABEL_65;
      }
      v56 = +[MBLockdown connect];
      if (v56)
      {
        v57 = v56;
        id v58 = [v56 objectForDomain:@"com.apple.mobile.backup" andKey:@"RequiresEncryption"];
        v59 = v58;
        if (!v58 || ![v58 BOOLValue] || -[MBEngine encrypted](self, "encrypted"))
        {
          [v57 disconnect:v62];

LABEL_65:
          double v5 = 0;
          goto LABEL_70;
        }
        double v5 = +[MBError errorWithCode:207 format:@"No backup password set when required by device management"];

LABEL_68:
        goto LABEL_69;
      }
      v21 = +[MBError errorWithCode:1 format:@"Failed to connect to lockdown"];
    }
    else
    {
      v21 = +[MBError errorWithCode:1 error:v14 format:@"Error initializing app manager"];
    }
LABEL_67:
    double v5 = v21;
    goto LABEL_68;
  }
  double v5 = +[MBError errorWithCode:v4 format:@"Simulated error code"];
LABEL_69:
LABEL_70:

  return v5;
}

- (id)endWithError:(id)a3
{
  id v4 = a3;
  double v5 = [(MBDriveBackupEngine *)self settingsContext];
  id v6 = [v5 plugins];
  uint64_t v7 = [v6 reverseObjectEnumerator];
  double v8 = sub_10003F45C(self, v7, "endedBackupWithEngine:error:", (uint64_t)self, (uint64_t)v4);

  [(MBDriveBackupEngine *)self _removeFilesystemSnapshot];
  if (!v4 && v8)
  {
    id v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = +[MBError descriptionForError:v8];
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Backup error - %@", buf, 0xCu);

      dispatch_time_t v15 = +[MBError descriptionForError:v8];
      _MBLog();
    }
    id v4 = v8;
  }
  uint64_t v11 = [(MBEngine *)self analyticsEvent];
  [v11 setMetric:@"peakMemoryUsage" value:MBPeakProcessMemoryUsage()];

  double v12 = [(MBEngine *)self analyticsEvent];
  [v12 submit];

  double v13 = [(MBDriveBackupEngine *)self settingsContext];
  [v13 setEncryptionManager:0];

  return v4;
}

- (id)_cleanup
{
  [(MBBackupOperationJournal *)self->_operationJournal close];
  operationJournal = self->_operationJournal;
  self->_operationJournal = 0;

  [(MBManifestDB *)self->_snapshotManifestDB closeWithError:0];
  snapshotManifestDB = self->_snapshotManifestDB;
  self->_snapshotManifestDB = 0;

  [(MBManifestDB *)self->_backupManifestDB closeAndRemoveFileWithError:0];
  backupManifestDB = self->_backupManifestDB;
  self->_backupManifestDB = 0;

  return [(MBDriveBackupEngine *)self _cleanupDeviceSnapshotDir];
}

- (id)_cleanupDeviceSnapshotDir
{
  if (!self->_uuid)
  {
    double v8 = 0;
    goto LABEL_14;
  }
  uint64_t v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Removing snapshot on device", buf, 2u);
    _MBLog();
  }

  id v4 = +[NSFileManager defaultManager];
  double v5 = [(MBDriveBackupEngine *)self _deviceSnapshotDir];
  id v13 = 0;
  unsigned __int8 v6 = [v4 removeItemAtPath:v5 error:&v13];
  id v7 = v13;

  if ((v6 & 1) == 0)
  {
    id v9 = [v7 domain];
    if ([v9 isEqualToString:NSCocoaErrorDomain])
    {
      id v10 = [v7 code];

      if (v10 == (id)4)
      {
        double v8 = 0;
        uint64_t v11 = v7;
        id v7 = 0;
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
    }
    uint64_t v11 = [(MBDriveBackupEngine *)self _deviceSnapshotDir];
    double v8 = +[MBError errorWithCode:102 error:v7 path:v11 format:@"Error removing snapshot dir"];
    goto LABEL_12;
  }
  double v8 = 0;
LABEL_13:

LABEL_14:

  return v8;
}

- (void)fileModifiedWhileUploadingFile:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 absolutePath];
    id v10 = [v6 fileID];
    *(_DWORD *)buf = 138412802;
    id v20 = v7;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    uint64_t v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "File modified while being uploaded (%@): %@ (%@)", buf, 0x20u);

    uint64_t v11 = [v6 absolutePath];
    v18 = [v6 fileID];
    _MBLog();
  }
  snapshotManifestDB = self->_snapshotManifestDB;
  id v13 = [v6 fileID];
  id v14 = [(MBManifestDB *)snapshotManifestDB setFlags:16 mask:-9 forFileID:v13];

  dispatch_time_t v15 = self;
  objc_sync_enter(v15);
  modifiedDomains = v15->_modifiedDomains;
  v17 = [v6 domain];
  [(NSMutableSet *)modifiedDomains addObject:v17];

  objc_sync_exit(v15);
}

- (id)_preconditions
{
  id v4 = [(MBDriveBackupEngine *)self settingsContext];
  double v5 = [v4 targetIdentifier];
  id v6 = MBDeviceUDID_Legacy();
  unsigned __int8 v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    v26 = +[NSAssertionHandler currentHandler];
    v27 = [(MBDriveBackupEngine *)self settingsContext];
    uint64_t v28 = [v27 targetIdentifier];
    unsigned __int8 v29 = MBDeviceUDID_Legacy();
    [v26 handleFailureInMethod:a2, self, @"MBDriveBackupEngine.m", 518, @"Backup target device ID %@ doesn't match actual device ID %@", v28, v29 object file lineNumber description];
  }
  if (BYSetupAssistantNeedsToRun())
  {
    CFStringRef v8 = @"Unable to backup until Setup is finished";
    uint64_t v9 = 212;
LABEL_7:
    double v12 = +[MBError errorWithCode:v9 format:v8];
    goto LABEL_27;
  }
  id v10 = +[MCProfileConnection sharedConnection];
  unsigned int v11 = [v10 isEphemeralMultiUser];

  if (v11)
  {
    CFStringRef v8 = @"Backup disabled for this device";
    uint64_t v9 = 22;
    goto LABEL_7;
  }
  if ([(MBEngine *)self isDeviceTransferEngine])
  {
    id v13 = [(MBDriveBackupEngine *)self settingsContext];
    id v14 = [v13 manager];
  }
  else
  {
    id v14 = objc_alloc_init((Class)MBManager);
  }
  id v31 = 0;
  dispatch_time_t v15 = [v14 restoreStateWithError:&v31];
  id v16 = v31;
  if (v15)
  {
    id v17 = [v15 state];
    id v18 = v17;
    if (v17 >= 7 || ((0x71u >> (char)v17) & 1) == 0)
    {
      double v19 = MBGetDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v33) = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "iTunes Backup is unavailable while an iCloud Restore is in progress (%d)", buf, 8u);
        id v30 = v18;
        _MBLog();
      }

      CFStringRef v20 = @"iTunes Backup is unavailable while an iCloud Restore is in progress";
      uint64_t v21 = 25;
LABEL_25:
      double v12 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v21, v20, v30);
      goto LABEL_26;
    }
  }
  else
  {
    unsigned __int8 v22 = +[MBError isError:v16 withCode:210];
    __int16 v23 = MBGetDefaultLog();
    uint64_t v24 = v23;
    if ((v22 & 1) == 0)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v33 = v16;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to fetch iCloud Restore state: %{public}@", buf, 0xCu);
        id v30 = v16;
        _MBLog();
      }

      CFStringRef v20 = @"Failed to determine iCloud Restore state";
      uint64_t v21 = 1;
      goto LABEL_25;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "No iCloud account", buf, 2u);
      _MBLog();
    }
  }
  double v12 = 0;
LABEL_26:

LABEL_27:

  return v12;
}

- (id)_postconditions
{
  return 0;
}

- (id)_resume
{
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Starting to retrieve previous backup status", buf, 2u);
    _MBLog();
  }

  +[NSDate timeIntervalSinceReferenceDate];
  double v6 = v5;
  backupHelper = self->_backupHelper;
  id v55 = 0;
  CFStringRef v8 = [(MBBackupHelper *)backupHelper readStatusWithError:&v55];
  id v9 = v55;
  status = self->_status;
  self->_status = v8;

  unsigned int v11 = self->_status;
  if (!v11) {
    goto LABEL_10;
  }
  [(MBStatus *)v11 version];
  if (v12 >= 3.3)
  {
    debugContext = self->super._debugContext;
    uint64_t v21 = [(MBStatus *)self->_status backupStateName];
    [(MBDebugContext *)debugContext setValue:v21 forName:@"BackupState"];

    unsigned __int8 v22 = self->super._debugContext;
    __int16 v23 = [(MBStatus *)self->_status snapshotStateName];
    [(MBDebugContext *)v22 setValue:v23 forName:@"SnapshotState"];

    [(MBDebugContext *)self->super._debugContext setInt:[(MBStatus *)self->_status isFullBackup] forName:@"StatusIsFullBackup"];
    uint64_t v24 = [(MBStatus *)self->_status uuid];
    uuid = self->_uuid;
    self->_uuid = v24;

    self->_fullBackup = [(MBStatus *)self->_status isFullBackup];
    if (![(MBStatus *)self->_status isFinished])
    {
      v26 = MBGetDefaultLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        double v27 = [(MBStatus *)self->_status snapshotStateName];
        *(_DWORD *)buf = 138412290;
        double v57 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Resuming after failure during '%@' phase", buf, 0xCu);

        v52 = [(MBStatus *)self->_status snapshotStateName];
        _MBLog();
      }
    }
    if ([(MBStatus *)self->_status isUploading])
    {
      uint64_t v28 = [(MBDriveBackupEngine *)self _resumeAfterFailureUploading];
    }
    else if ([(MBStatus *)self->_status isMoving])
    {
      uint64_t v28 = [(MBDriveBackupEngine *)self _resumeAfterFailureMoving];
    }
    else if ([(MBStatus *)self->_status isRemoving])
    {
      uint64_t v28 = [(MBDriveBackupEngine *)self _resumeAfterFailureRemoving];
    }
    else
    {
      if ([(MBStatus *)self->_status isFinished]) {
        [(MBDriveBackupEngine *)self _resumeAfterSuccess];
      }
      else {
      uint64_t v28 = +[MBError errorWithCode:205, @"Invalid snapshot state: %d", [(MBStatus *)self->_status snapshotState] format];
      }
    }
    id v33 = (void *)v28;

    if (v33)
    {
      if (+[MBError isError:v33 withCode:203])
      {
        id v34 = MBGetDefaultLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          double v35 = +[MBError descriptionForError:v33];
          *(_DWORD *)buf = 138412290;
          double v57 = v35;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

          v53 = +[MBError descriptionForError:v33];
          _MBLog();
        }
        uint64_t v36 = MBGetDefaultLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Performing full backup to replace unsupported format", buf, 2u);
          _MBLog();
        }

        [(MBDebugContext *)self->super._debugContext setFlag:@"ManifestVersionUnsupported"];
        self->_fullBackup = 1;
      }
      else
      {
        if (!+[MBError isError:v33 withCode:207])
        {
          id v32 = v33;
          id v9 = v32;
          goto LABEL_72;
        }
        v37 = MBGetDefaultLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Password has changed. Performing full backup encrypted with new password.", buf, 2u);
          _MBLog();
        }

        self->_fullBackup = 1;
        id v38 = [(MBDriveBackupEngine *)self _cleanupDeviceSnapshotDir];
      }
    }
    snapshotManifestDB = self->_snapshotManifestDB;
    if (snapshotManifestDB && [(MBManifestDB *)snapshotManifestDB domainRedirects]
      || (backupManifestDB = self->_backupManifestDB) != 0
      && [(MBManifestDB *)backupManifestDB domainRedirects])
    {
      id v41 = MBGetDefaultLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Performing full backup because of domain redirects", buf, 2u);
        _MBLog();
      }

      self->_fullBackup = 1;
    }
    v42 = [(MBManifestDB *)self->_snapshotManifestDB properties];
    if ([v42 hasCorruptSQLiteDBs])
    {
    }
    else
    {
      v43 = [(MBManifestDB *)self->_backupManifestDB properties];
      unsigned int v44 = [v43 hasCorruptSQLiteDBs];

      if (!v44)
      {
LABEL_61:
        if ([(MBDebugContext *)self->super._debugContext isFlagSet:@"SimulateCrashAfterResumingSuccessfully", v54])abort(); {
        id v9 = 0;
        }
        goto LABEL_63;
      }
    }
    objc_super v45 = MBGetDefaultLog();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136380675;
      double v57 = COERCE_DOUBLE("9365479");
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "This backup has corrupt SQLite databases. Forcing a full backup to work around %{private}s", buf, 0xCu);
      CFStringRef v54 = "9365479";
      _MBLog();
    }

    self->_fullBackup = 1;
    goto LABEL_61;
  }
  id v13 = self->_status;
  if (v13)
  {
    [(MBStatus *)v13 version];
    if (v14 < 3.3)
    {
      dispatch_time_t v15 = MBGetDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        [(MBStatus *)self->_status version];
        *(_DWORD *)buf = 134217984;
        double v57 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Status: version=%0.1f", buf, 0xCu);
        [(MBStatus *)self->_status version];
        _MBLog();
      }

      [(MBDebugContext *)self->super._debugContext setFlag:@"OldStatusFound"];
      goto LABEL_27;
    }
  }
LABEL_10:
  if (!+[MBError isError:v9 withCode:4])
  {
    if (+[MBError isError:v9 withCode:203])
    {
      unsigned __int8 v29 = MBGetDefaultLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        double v30 = +[MBError descriptionForError:v9];
        *(_DWORD *)buf = 138412290;
        double v57 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

        v52 = +[MBError descriptionForError:v9];
        _MBLog();
      }
      id v31 = MBGetDefaultLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Performing full backup to replace unsupported format", buf, 2u);
        _MBLog();
      }

      id v18 = self->super._debugContext;
      CFStringRef v19 = @"StatusVersionUnsupported";
      goto LABEL_26;
    }
    id v32 = +[MBBackupHelper driveReadError:v9 description:@"Error reading status"];
LABEL_72:
    v50 = v32;
    goto LABEL_68;
  }
  id v17 = MBGetDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "No status exists", buf, 2u);
    _MBLog();
  }

  id v18 = self->super._debugContext;
  CFStringRef v19 = @"StatusNotFound";
LABEL_26:
  -[MBDebugContext setFlag:](v18, "setFlag:", v19, v52);

  id v9 = 0;
LABEL_27:
  self->_fullBackup = 1;
LABEL_63:
  if (!self->_uuid)
  {
    MBRandomUUID();
    id v46 = (NSString *)objc_claimAutoreleasedReturnValue();
    v47 = self->_uuid;
    self->_uuid = v46;
  }
  v48 = MBGetDefaultLog();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    +[NSDate timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 134217984;
    double v57 = v49 - v6;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "Retrieved previous backup status in %0.3f s", buf, 0xCu);
    +[NSDate timeIntervalSinceReferenceDate];
    _MBLog();
  }

  v50 = 0;
LABEL_68:

  return v50;
}

- (id)_openBackupManifestForResume
{
  if (!self->_fullBackup)
  {
    backupHelper = self->_backupHelper;
    id v19 = 0;
    v2 = [(MBBackupHelper *)backupHelper readBackupManifestDatabaseWithError:&v19];
    id v6 = v19;
    backupManifestDB = self->_backupManifestDB;
    self->_backupManifestDB = v2;

    if (v6)
    {
      id v8 = v6;
      id v9 = v8;
      goto LABEL_22;
    }
  }
  unsigned __int8 v4 = [(MBEngine *)self encrypted];
  if (v4)
  {
    if (![(MBEngine *)self encrypted]) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  v2 = [(MBManifestDB *)self->_backupManifestDB properties];
  if ([(MBManifestDB *)v2 encrypted])
  {

    goto LABEL_13;
  }
  if ([(MBEngine *)self encrypted])
  {
LABEL_10:
    id v10 = [(MBManifestDB *)self->_backupManifestDB properties];
    unsigned __int8 v11 = [v10 encrypted];

    if ((v4 & 1) == 0) {
    if (v11)
    }
      goto LABEL_15;
LABEL_13:
    self->_fullBackup = 1;
    id v9 = +[MBError errorWithCode:207 format:@"Encryption settings changed"];
    id v8 = 0;
    goto LABEL_22;
  }

LABEL_15:
  if ([(MBEngine *)self encrypted])
  {
    double v12 = self->_backupManifestDB;
    id v13 = [(MBDriveBackupEngine *)self password];
    id v18 = 0;
    unsigned __int8 v14 = [(MBManifestDB *)v12 setupEncryptionWithPassword:v13 withError:&v18];
    id v8 = v18;

    if ((v14 & 1) == 0)
    {
      dispatch_time_t v15 = MBGetDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v8;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to setup manifest encryption: %@", buf, 0xCu);
        _MBLog();
      }

      [(MBManifestDB *)self->_backupManifestDB closeWithError:0];
      double v16 = self->_backupManifestDB;
      self->_backupManifestDB = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = 0;
LABEL_22:

  return v9;
}

- (id)_resumeAfterFailureUploading
{
  uint64_t v3 = [(MBDriveBackupEngine *)self _openBackupManifestForResume];
  if (v3)
  {
    unsigned __int8 v4 = v3;
    double v5 = v4;
    goto LABEL_29;
  }
  id v6 = +[NSFileManager defaultManager];
  unsigned __int8 v7 = [(MBDriveBackupEngine *)self _deviceSnapshotManifestDatabasePath];
  unsigned int v8 = [v6 fileExistsAtPath:v7];

  if (v8)
  {
    id v9 = [MBManifestDB alloc];
    uint64_t v10 = [(MBDriveBackupEngine *)self _deviceSnapshotManifestDatabasePath];
    unsigned __int8 v11 = [(MBManifestDB *)v9 initWithPath:v10 domainManager:self->super._domainManager];

    id v83 = 0;
    LOBYTE(v10) = [(MBManifestDB *)v11 openWithError:&v83];
    unsigned __int8 v4 = v83;
    if (v10)
    {
      if ([(MBEngine *)self encrypted])
      {
        double v12 = [(MBDriveBackupEngine *)self password];
        v82 = v4;
        unsigned __int8 v13 = [(MBManifestDB *)v11 setupEncryptionWithPassword:v12 withError:&v82];
        unsigned __int8 v14 = v82;

        if ((v13 & 1) == 0)
        {
          uint64_t v36 = MBGetDefaultLog();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v85 = v14;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to setup manifest encryption: %@", buf, 0xCu);
            _MBLog();
          }

          [(MBManifestDB *)v11 closeWithError:0];
          v37 = v14;
LABEL_44:
          unsigned __int8 v4 = v37;
          double v5 = v37;
          goto LABEL_27;
        }
        unsigned __int8 v4 = v14;
      }
      dispatch_time_t v15 = v4;
      v81 = v4;
      unsigned __int8 v16 = [(MBManifestDB *)v11 checkWithError:&v81];
      unsigned __int8 v4 = v81;

      if (v16)
      {
        v80 = v4;
        unsigned __int8 v17 = [(MBManifestDB *)v11 closeWithError:&v80];
        id v18 = v80;

        if ((v17 & 1) == 0)
        {
          id v38 = MBGetDefaultLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v85 = v18;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Failed to close existing snapshot manifest database: %@", buf, 0xCu);
            _MBLog();
          }

          double v5 = 0;
          unsigned __int8 v4 = v18;
          goto LABEL_27;
        }

        id v19 = MBGetDefaultLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Reading snapshot properties from device", buf, 2u);
          _MBLog();
        }

        CFStringRef v20 = [(MBDriveBackupEngine *)self _deviceSnapshotPropertiesPath];
        v79 = v18;
        unsigned __int8 v11 = +[MBProperties propertiesWithFile:v20 error:&v79];
        id v21 = v79;

        if (v11)
        {
          uint64_t v22 = MBTemporaryPath();
          __int16 v23 = [(MBDriveBackupEngine *)self _deviceSnapshotManifestDatabasePath];
          CFStringRef v78 = v21;
          long long v71 = (void *)v22;
          unsigned __int8 v24 = [v6 moveItemAtPath:v23 toPath:v22 error:&v78];
          unsigned __int8 v4 = v78;

          char v25 = MBGetDefaultLog();
          v26 = v25;
          if ((v24 & 1) == 0)
          {
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v85 = v4;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to move existing snapshot manifest DB after upload failure: %@", buf, 0xCu);
              long long v69 = v4;
              _MBLog();
            }

            CFStringRef v41 = @"Failed to move snapshot manifest database";
            goto LABEL_48;
          }
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Removing snapshot on device", buf, 2u);
            _MBLog();
          }

          double v27 = +[NSFileManager defaultManager];
          uint64_t v28 = [(MBDriveBackupEngine *)self _deviceSnapshotDir];
          v77 = v4;
          unsigned __int8 v29 = [v27 removeItemAtPath:v28 error:&v77];
          double v30 = v77;

          if (v29)
          {
            id v31 = v71;
LABEL_18:
            id v32 = [(MBDriveBackupEngine *)self _setupSnapshotDirectory];

            if (v32)
            {
LABEL_19:
              id v33 = v32;
              unsigned __int8 v4 = v33;
LABEL_71:
              double v5 = v33;
              goto LABEL_72;
            }
            objc_super v45 = [(MBDriveBackupEngine *)self _deviceSnapshotManifestDatabasePath];
            id v76 = 0;
            unsigned __int8 v46 = [v6 moveItemAtPath:v31 toPath:v45 error:&v76];
            unsigned __int8 v4 = v76;

            if ((v46 & 1) == 0)
            {
              v65 = MBGetDefaultLog();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v85 = v4;
                _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "Failed to move existing snapshot manifest DB back in place after upload failure: %@", buf, 0xCu);
                _MBLog();
              }

              id v33 = +[MBError errorWithCode:102 error:v4 format:@"Failed to move snapshot manifest database back"];
              goto LABEL_71;
            }
            v47 = [MBManifestDB alloc];
            uint64_t v48 = [(MBDriveBackupEngine *)self _deviceSnapshotManifestDatabasePath];
            double v49 = [(MBManifestDB *)v47 initWithPath:v48 properties:v11 domainManager:self->super._domainManager];
            snapshotManifestDB = self->_snapshotManifestDB;
            self->_snapshotManifestDB = v49;

            v51 = self->_snapshotManifestDB;
            id v75 = v4;
            LOBYTE(v48) = [(MBManifestDB *)v51 openWithError:&v75];
            double v30 = v75;

            if (v48)
            {
              if ([(MBEngine *)self encrypted])
              {
                v52 = self->_snapshotManifestDB;
                v53 = [(MBDriveBackupEngine *)self password];
                long long v74 = v30;
                unsigned __int8 v54 = [(MBManifestDB *)v52 setupEncryptionWithPassword:v53 withError:&v74];
                id v32 = v74;

                if ((v54 & 1) == 0)
                {
                  long long v68 = MBGetDefaultLog();
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v85 = v32;
                    _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "Failed to setup manifest encryption: %@", buf, 0xCu);
                    _MBLog();
                  }

                  goto LABEL_19;
                }
                double v30 = v32;
              }
              id v55 = MBGetDefaultLog();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Determining which files were already uploaded to the backup", buf, 2u);
                _MBLog();
              }

              v56 = [(MBDriveBackupEngine *)self settingsContext];
              double v57 = [v56 drive];
              id v58 = [(MBDriveBackupEngine *)self settingsContext];
              v59 = [v58 driveSnapshotDir];
              v73[0] = _NSConcreteStackBlock;
              v73[1] = 3221225472;
              v73[2] = sub_100025900;
              v73[3] = &unk_1000F1568;
              v73[4] = self;
              long long v70 = [v57 enumerateContentsOfDirectoryAtPath:v59 options:0 foundItem:v73];

              v60 = [(MBDriveBackupEngine *)self settingsContext];
              v61 = [v60 drive];
              CFStringRef v62 = [(MBDriveBackupEngine *)self settingsContext];
              v63 = [v62 driveBackupDir];
              v72[0] = _NSConcreteStackBlock;
              v72[1] = 3221225472;
              v72[2] = sub_100025A9C;
              v72[3] = &unk_1000F1568;
              v72[4] = self;
              v64 = [v61 enumerateContentsOfDirectoryAtPath:v63 options:0 foundItem:v72];

              if (v64
                && +[MBError isError:v64 withCode:4])
              {
                double v5 = +[MBBackupHelper driveReadError:v64 description:@"Error getting contents of snapshot"];
                unsigned __int8 v4 = v64;
                goto LABEL_49;
              }
              unsigned __int8 v4 = [(MBManifestDB *)self->_snapshotManifestDB removeFilesNotAlreadyUploaded];

              if (!v4)
              {
                double v5 = 0;
                goto LABEL_49;
              }
              long long v67 = MBGetDefaultLog();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v85 = v4;
                _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "Failed to remove already uploaded files from snapshot manifest database: %@", buf, 0xCu);
                long long v69 = v4;
                _MBLog();
              }

              CFStringRef v41 = @"Failed to remove already uploaded files from snapshot manifest database";
LABEL_48:
              double v5 = +[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 102, v4, v41, v69);
LABEL_49:
              id v31 = v71;
LABEL_72:

              goto LABEL_27;
            }
            v66 = MBGetDefaultLog();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v85 = v30;
              _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "Failed to open snapshot manifest database: %@", buf, 0xCu);
              _MBLog();
            }

            double v5 = +[MBError errorWithCode:102 error:v30 format:@"Failed to open resume snapshot manifest database"];
LABEL_57:
            unsigned __int8 v4 = v30;
            goto LABEL_72;
          }
          v42 = [v30 domain];
          id v31 = v71;
          if ([v42 isEqualToString:NSCocoaErrorDomain])
          {
            id v43 = [v30 code];

            if (v43 == (id)4)
            {

              double v30 = 0;
              goto LABEL_18;
            }
          }
          else
          {
          }
          unsigned int v44 = [(MBDriveBackupEngine *)self _deviceSnapshotDir];
          double v5 = +[MBError errorWithCode:102 error:v30 path:v44 format:@"Error removing snapshot dir"];

          goto LABEL_57;
        }
        if ((+[MBError isError:v21 withCode:4] & 1) != 0
          || +[MBError codeForNSError:v21] == 4)
        {
          int v39 = MBGetDefaultLog();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Snapshot properties not found", buf, 2u);
            _MBLog();
          }

          v40 = v21;
          id v21 = 0;
        }
        else
        {
          v40 = MBGetDefaultLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v85 = v21;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Error reading snapshot properties from device: %@", buf, 0xCu);
            _MBLog();
          }
        }

        v37 = v21;
        goto LABEL_44;
      }
      [(MBManifestDB *)v11 closeWithError:0];
      id v34 = MBGetDefaultLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v85 = v4;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Existing snapshot manifest database failed check: %@", buf, 0xCu);
        goto LABEL_25;
      }
    }
    else
    {
      id v34 = MBGetDefaultLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v85 = v4;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Failed to open existing snapshot manifest database: %@", buf, 0xCu);
LABEL_25:
        _MBLog();
      }
    }

    double v5 = 0;
LABEL_27:

    goto LABEL_28;
  }
  unsigned __int8 v4 = 0;
  double v5 = 0;
LABEL_28:

LABEL_29:

  return v5;
}

- (id)_resumeAfterFailureMoving
{
  uint64_t v3 = [(MBDriveBackupEngine *)self _setupOperationJournal];
  if (v3)
  {
    id v4 = v3;
    double v5 = v4;
    goto LABEL_14;
  }
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Determining which files which weren't already moved from the snapshot during the last backup", buf, 2u);
    _MBLog();
  }

  *(void *)buf = 0;
  unsigned __int8 v16 = buf;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  unsigned __int8 v7 = [(MBDriveBackupEngine *)self settingsContext];
  unsigned int v8 = [v7 drive];
  id v9 = [(MBDriveBackupEngine *)self settingsContext];
  uint64_t v10 = [v9 driveSnapshotDir];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100025E54;
  v14[3] = &unk_1000F1590;
  v14[4] = self;
  v14[5] = buf;
  id v4 = [v8 enumerateContentsOfDirectoryAtPath:v10 options:0 foundItem:v14];

  if (!v4 || !+[MBError isError:v4 withCode:4])
  {
    if (v16[24])
    {
      double v12 = [(MBDriveBackupEngine *)self _openBackupManifestForResume];

      if (v12)
      {
        id v11 = v12;
        id v4 = v11;
        goto LABEL_13;
      }
      id v4 = 0;
    }
    id v11 = [(MBDriveBackupEngine *)self _resumeAfterFailureRemoving];
    goto LABEL_13;
  }
  id v11 = +[MBBackupHelper driveReadError:v4 description:@"Error getting contents of snapshot"];
LABEL_13:
  double v5 = v11;
  _Block_object_dispose(buf, 8);
LABEL_14:

  return v5;
}

- (id)_resumeAfterFailureRemoving
{
  uint64_t v3 = [(MBDriveBackupEngine *)self _setupOperationJournal];
  if (!v3)
  {
    if (self->_backupManifestDB
      || ([(MBDriveBackupEngine *)self _openBackupManifestForResume],
          (uint64_t v3 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v3 = -[MBDriveBackupEngine _addBackupPathsNotInManifestDB:operationType:](self, "_addBackupPathsNotInManifestDB:operationType:");
      if (!v3)
      {
        uint64_t v3 = [(MBDriveBackupEngine *)self _resumeAfterSuccess];
      }
    }
  }

  return v3;
}

- (id)_resumeAfterSuccess
{
  if (self->_backupManifestDB
    || ([(MBDriveBackupEngine *)self _openBackupManifestForResume],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v3 = 0;
    self->_fullBackup = 0;
  }

  return v3;
}

- (id)_scan
{
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Starting to scan", buf, 2u);
    _MBLog();
  }

  +[NSDate timeIntervalSinceReferenceDate];
  double v6 = v5;
  unsigned __int8 v7 = [(MBDriveBackupEngine *)self _setupOperationJournal];
  if (v7) {
    goto LABEL_6;
  }
  unsigned __int8 v7 = [(MBDriveBackupEngine *)self _setupManifestDB];
  if (v7) {
    goto LABEL_6;
  }
  unsigned __int8 v7 = [(MBDriveBackupEngine *)self _setupEncryption];
  if (v7) {
    goto LABEL_6;
  }
  double v12 = [(MBDriveBackupEngine *)self settingsContext];
  unsigned __int8 v13 = [v12 plugins];
  unsigned __int8 v14 = [v13 objectEnumerator];
  dispatch_time_t v15 = sub_10003F3E4(self, v14, "preparingBackupWithEngine:", (uint64_t)self);

  if (v15)
  {
LABEL_12:
    unsigned int v8 = v15;
    goto LABEL_7;
  }
  unsigned __int8 v7 = [(MBDriveBackupEngine *)self _snapshotFilesystem];
  if (v7) {
    goto LABEL_6;
  }
  unsigned __int8 v16 = [(MBEngine *)self persona];
  unsigned int v17 = [v16 isPersonalPersona];

  if (v17)
  {
    char v18 = [(MBEngine *)self persona];
    id v19 = [v18 volumeMountPoint];

    CFStringRef v20 = [(MBDriveBackupEngine *)self mountedSnapshotTracker];
    id v21 = [v20 snapshotMountPointForVolumeMountPoint:v19];

    uint64_t v22 = +[MBiCloudDrivePlugin backUpiCloudDriveDatabaseManifestForUserVolume:v19 snapshotMountPoint:v21];
    if (v22
      || (+[MBiCloudDrivePlugin backUpFPFSDatabaseManifestForUserVolume:v19 snapshotMountPoint:v21], (uint64_t v22 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v9 = v22;

      uint64_t v10 = v9;
      goto LABEL_8;
    }
  }
  [(MBDriveBackupEngine *)self _recordCurrentTime];
  unsigned __int8 v7 = [(MBDriveBackupEngine *)self _scanAllDomains];
  if (v7) {
    goto LABEL_6;
  }
  __int16 v23 = [(MBDriveBackupEngine *)self settingsContext];
  unsigned __int8 v24 = [v23 plugins];
  char v25 = [v24 objectEnumerator];
  dispatch_time_t v15 = sub_10003F3E4(self, v25, "preparedBackupWithEngine:", (uint64_t)self);

  if (v15) {
    goto LABEL_12;
  }
  unsigned __int8 v7 = [(MBDriveBackupEngine *)self _findPathsRemovedFromBackup];
  if (v7
    || ([(MBDriveBackupEngine *)self _scanFinished],
        (unsigned __int8 v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_6:
    unsigned int v8 = v7;
LABEL_7:
    id v9 = v8;
    uint64_t v10 = v8;
    goto LABEL_8;
  }
  id v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    +[NSDate timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 134217984;
    double v28 = v26 - v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Scanned in %0.3f s", buf, 0xCu);
    +[NSDate timeIntervalSinceReferenceDate];
    _MBLog();
  }
  uint64_t v10 = 0;
LABEL_8:

  return v10;
}

- (void)_recordCurrentTime
{
  __darwin_time_t v3 = time(0);
  id v4 = [(MBDebugContext *)self->super._debugContext valueForName:@"SimulatedSystemDate"];
  double v5 = v4;
  if (v4)
  {
    [v4 timeIntervalSince1970];
    self->_int64_t maximumModificationTime = (uint64_t)v6;
    debugContext = self->super._debugContext;
    unsigned int v8 = [v5 dateByAddingTimeInterval:1.0];
    [(MBDebugContext *)debugContext setValue:v8 forName:@"SimulatedSystemDate"];
  }
  else
  {
    id v9 = [(MBDriveBackupEngine *)self mountedSnapshotTracker];
    uint64_t v10 = [v9 mountedSnapshots];
    id v11 = [v10 count];

    if (v11) {
      int64_t v12 = v3;
    }
    else {
      int64_t v12 = 0;
    }
    self->_int64_t maximumModificationTime = v12;
    do
    {
      v17[0].tv_sec = 0;
      *(void *)&v17[0].tv_usec = 0;
      gettimeofday(v17, 0);
      useconds_t v13 = 1000000 - v17[0].tv_usec;
      unsigned __int8 v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        useconds_t v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Rolling system clock forward %d us\n", buf, 8u);
        _MBLog();
      }

      usleep(v13);
    }
    while (time(0) <= v3);
  }
  dispatch_time_t v15 = MBGetDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int64_t maximumModificationTime = self->_maximumModificationTime;
    LODWORD(v17[0].tv_sec) = 134218240;
    *(__darwin_time_t *)((char *)&v17[0].tv_sec + 4) = v3;
    *((_WORD *)&v17[0].tv_usec + 2) = 2048;
    *(void *)((char *)&v17[0].tv_usec + 6) = maximumModificationTime;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "currentTime:%ld, maximumModificationTime:%ld", (uint8_t *)v17, 0x16u);
    _MBLog();
  }
}

- (id)_snapshotFilesystem
{
  [(MBDriveBackupEngine *)self mountedSnapshotTracker];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v51 = long long v71 = 0u;
  id v3 = [v51 mountedSnapshots];
  id v4 = [v3 countByEnumeratingWithState:&v68 objects:v81 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v69;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v69 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned int v8 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        id v9 = MBGetDefaultLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          double v10 = [v8 snapshotName];
          [v8 volumeMountPoint];
          v12 = id v11 = v3;
          useconds_t v13 = [v8 snapshotMountPoint];
          *(_DWORD *)buf = 138412802;
          double v76 = v10;
          __int16 v77 = 2112;
          CFStringRef v78 = v12;
          __int16 v79 = 2112;
          v80 = v13;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Found existing snapshot %@ for volume %@ mounted at %@", buf, 0x20u);

          id v3 = v11;
          unsigned __int8 v14 = [v8 snapshotName];
          dispatch_time_t v15 = [v8 volumeMountPoint];
          uint64_t v48 = [v8 snapshotMountPoint];
          _MBLog();
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v68 objects:v81 count:16];
    }
    while (v5);
    unsigned __int8 v16 = 0;
  }
  else
  {

    v50 = self;
    if ([(MBEngine *)self isDeviceTransferEngine]) {
      MBD2DSnapshotMountPoints();
    }
    else {
    unsigned int v17 = MBFinderSnapshotMountPoints();
    }
    char v18 = [(MBEngine *)v50 persona];
    useconds_t v19 = [v18 volumesToBackUp];

    MBSnapshotName();
    double v53 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v3 = v17;
    id v20 = [v3 countByEnumeratingWithState:&v64 objects:v74 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v65;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v65 != v22) {
            objc_enumerationMutation(v3);
          }
          +[MBFileSystemManager unmount:*(void *)(*((void *)&v64 + 1) + 8 * (void)j) error:0];
        }
        id v21 = [v3 countByEnumeratingWithState:&v64 objects:v74 count:16];
      }
      while (v21);
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v24 = v19;
    id v25 = [v24 countByEnumeratingWithState:&v60 objects:v73 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v61;
      do
      {
        for (k = 0; k != v26; k = (char *)k + 1)
        {
          if (*(void *)v61 != v27) {
            objc_enumerationMutation(v24);
          }
          +[MBFileSystemManager deleteAllSnapshotsForVolume:*(void *)(*((void *)&v60 + 1) + 8 * (void)k) withPrefix:@"com.apple.mobilebackup" error:0];
        }
        id v26 = [v24 countByEnumeratingWithState:&v60 objects:v73 count:16];
      }
      while (v26);
    }

    +[NSDate timeIntervalSinceReferenceDate];
    double v30 = v29;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v31 = v24;
    id v32 = v50;
    id v52 = [v31 countByEnumeratingWithState:&v56 objects:v72 count:16];
    if (v52)
    {
      uint64_t v33 = *(void *)v57;
      while (2)
      {
        for (m = 0; m != v52; m = (char *)m + 1)
        {
          id v35 = v3;
          if (*(void *)v57 != v33) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = *(void **)(*((void *)&v56 + 1) + 8 * (void)m);
          v54[4] = v32;
          id v55 = 0;
          v54[0] = _NSConcreteStackBlock;
          v54[1] = 3221225472;
          v54[2] = sub_100026D74;
          v54[3] = &unk_1000F15B8;
          v37 = +[MBFileSystemManager createAndMountSnapshotForVolume:name:atFirstAvailableMountPoint:error:cancelationHandler:](MBFileSystemManager, "createAndMountSnapshotForVolume:name:atFirstAvailableMountPoint:error:cancelationHandler:", v36, *(void *)&v53, v35, &v55, v54, *(void *)&v45, v46, v47);
          id v38 = v55;
          int v39 = v38;
          if (v37)
          {
            v40 = MBGetDefaultLog();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              double v76 = v53;
              __int16 v77 = 2112;
              CFStringRef v78 = v36;
              __int16 v79 = 2114;
              v80 = v37;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Snapshot %{public}@ for %@ was mounted successfully at %{public}@", buf, 0x20u);
              unsigned __int8 v46 = v36;
              v47 = v37;
              double v45 = v53;
              _MBLog();
            }

            [v51 trackSnapshotForVolume:v36 snapshotName:*(void *)&v53 mountPoint:v37];
            id v32 = v50;
          }
          else
          {
            id v49 = v38;
          }

          id v3 = v35;
          if (!v37)
          {
            id v43 = v31;
            unsigned __int8 v16 = v49;
            goto LABEL_45;
          }
        }
        id v52 = [v31 countByEnumeratingWithState:&v56 objects:v72 count:16];
        if (v52) {
          continue;
        }
        break;
      }
    }

    +[NSDate timeIntervalSinceReferenceDate];
    double v42 = v41;
    id v43 = MBGetDefaultLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v76 = v42 - v30;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Filesystem snapshots created and mounted in %.3fs", buf, 0xCu);
      _MBLog();
    }
    unsigned __int8 v16 = 0;
LABEL_45:
  }

  return v16;
}

- (void)_removeFilesystemSnapshot
{
  v2 = [(MBDriveBackupEngine *)self mountedSnapshotTracker];
  id v3 = [v2 mountedSnapshots];

  if ([v3 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = v3;
    id v4 = [obj countByEnumeratingWithState:&v21 objects:v31 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v22;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(obj);
          }
          unsigned int v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v9 = [v8 volumeMountPoint:v16, v17, v18];
          double v10 = [v8 snapshotMountPoint];
          id v11 = [v8 snapshotName];
          int64_t v12 = MBGetDefaultLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v26 = v11;
            __int16 v27 = 2112;
            double v28 = v10;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unmounting APFS snapshot %@ from %@ and removing it", buf, 0x16u);
            unsigned __int8 v16 = v11;
            unsigned int v17 = v10;
            _MBLog();
          }

          id v20 = 0;
          unsigned __int8 v13 = +[MBFileSystemManager unmountAndDeleteSnapshotForVolume:v9 name:v11 mountPoint:v10 error:&v20];
          id v14 = v20;
          if ((v13 & 1) == 0
            && (+[MBError isError:v14 withCode:4] & 1) == 0)
          {
            dispatch_time_t v15 = MBGetDefaultLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              id v26 = v11;
              __int16 v27 = 2112;
              double v28 = v10;
              __int16 v29 = 2112;
              id v30 = v14;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to unmount or delete the APFS snapshot %@ at %@: %@", buf, 0x20u);
              unsigned int v17 = v10;
              id v18 = v14;
              unsigned __int8 v16 = v11;
              _MBLog();
            }
          }
        }
        id v5 = [obj countByEnumeratingWithState:&v21 objects:v31 count:16];
      }
      while (v5);
    }
  }
}

- (id)_setupOperationJournal
{
  operationJournal = self->_operationJournal;
  id v4 = MBGetDefaultLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (operationJournal)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Operation journal already initialized", buf, 2u);
      _MBLog();
    }

    id v6 = 0;
LABEL_5:
    unsigned __int8 v7 = 0;
    goto LABEL_15;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Creating snapshot directory on device", buf, 2u);
    _MBLog();
  }

  unsigned int v8 = +[NSFileManager defaultManager];
  id v9 = [(MBDriveBackupEngine *)self _deviceSnapshotDir];
  v19[0] = NSFileOwnerAccountName;
  v19[1] = NSFileGroupOwnerAccountName;
  v20[0] = @"mobile";
  v20[1] = @"mobile";
  double v10 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  id v17 = 0;
  unsigned __int8 v11 = [v8 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:v10 error:&v17];
  id v6 = v17;

  if (v11)
  {
    int64_t v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Initializing operation journal", buf, 2u);
      _MBLog();
    }

    unsigned __int8 v13 = [[MBBackupOperationJournal alloc] initWithBatchSize:self->_batchSize];
    id v14 = self->_operationJournal;
    self->_operationJournal = v13;

    if (self->_operationJournal) {
      goto LABEL_5;
    }
    CFStringRef v15 = @"Error initializing operation journal";
  }
  else
  {
    CFStringRef v15 = @"Error creating snapshot directory on device";
  }
  unsigned __int8 v7 = +[MBError errorWithCode:102 error:v6 format:v15];
LABEL_15:

  return v7;
}

- (id)_setupSnapshotDirectory
{
  id v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Creating snapshot directory on device", buf, 2u);
    _MBLog();
  }

  id v4 = +[NSFileManager defaultManager];
  BOOL v5 = [(MBDriveBackupEngine *)self _deviceSnapshotDir];
  v13[0] = NSFileOwnerAccountName;
  v13[1] = NSFileGroupOwnerAccountName;
  v14[0] = @"mobile";
  v14[1] = @"mobile";
  id v6 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  id v11 = 0;
  unsigned __int8 v7 = [v4 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:v6 error:&v11];
  id v8 = v11;

  if ((v7 & 1) == 0)
  {
    uint64_t v9 = +[MBError errorWithCode:102 error:v8 format:@"Error creating snapshot directory on device"];

    id v8 = (id)v9;
  }

  return v8;
}

- (id)_setupManifestDB
{
  id v3 = [(MBDriveBackupEngine *)self _setupSnapshotDirectory];
  if (v3)
  {
    id v4 = v3;
    BOOL v5 = v4;
    goto LABEL_18;
  }
  id v6 = sub_100090888([(MBDriveBackupEngine *)self engineType]);
  unsigned __int8 v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "requiredProductVersion:%{public}@", buf, 0xCu);
    _MBLog();
  }

  snapshotManifestDB = self->_snapshotManifestDB;
  uint64_t v9 = MBGetDefaultLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (snapshotManifestDB)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Manifest database already initialized", buf, 2u);
      _MBLog();
    }
    id v4 = 0;
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Initializing snapshot manifest database", buf, 2u);
      _MBLog();
    }

    id v11 = [(MBDriveBackupEngine *)self _deviceSnapshotDir];
    uint64_t v9 = [v11 stringByAppendingPathComponent:@"Manifest.db"];

    backupManifestDB = self->_backupManifestDB;
    if (backupManifestDB)
    {
      unsigned __int8 v13 = [(MBManifestDB *)backupManifestDB properties];
    }
    else
    {
      unsigned __int8 v13 = 0;
    }
    id v14 = [[MBManifestDB alloc] initWithPath:v9 properties:v13 domainManager:self->super._domainManager];
    CFStringRef v15 = self->_snapshotManifestDB;
    self->_snapshotManifestDB = v14;

    unsigned __int8 v16 = self->_snapshotManifestDB;
    id v24 = 0;
    unsigned int v17 = [(MBManifestDB *)v16 openWithError:&v24];
    id v4 = v24;
    if (!v17)
    {
      long long v23 = MBGetDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v26 = v9;
        __int16 v27 = 2112;
        id v28 = v4;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to open snapshot manifest database at %@: %@", buf, 0x16u);
        _MBLog();
      }

      BOOL v5 = +[MBError errorWithCode:102 error:v4 format:@"Error initializing manifest database"];

      goto LABEL_17;
    }
  }
  id v18 = [(MBManifestDB *)self->_snapshotManifestDB properties];
  [v18 removeAllContainers];

  useconds_t v19 = [(MBManifestDB *)self->_snapshotManifestDB properties];
  id v20 = [(MBAppManager *)self->super._appManager allContainers];
  [v19 addContainersFromArray:v20];

  long long v21 = [(MBManifestDB *)self->_snapshotManifestDB properties];
  [v21 setRequiredProductVersion:v6];

  id v4 = v4;
  BOOL v5 = v4;
LABEL_17:

LABEL_18:

  return v5;
}

- (id)_setupEncryption
{
  snapshotManifestDB = self->_snapshotManifestDB;
  if (snapshotManifestDB)
  {
    BOOL v5 = snapshotManifestDB;
  }
  else
  {
    BOOL v5 = self->_backupManifestDB;
    if (!v5) {
      goto LABEL_13;
    }
  }
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v7 = [(MBManifestDB *)v5 properties];
    if ([v7 encrypted]) {
      CFStringRef v8 = @"encrypted";
    }
    else {
      CFStringRef v8 = @"unencrypted";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v58 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Existing backup is %@", buf, 0xCu);

    uint64_t v9 = [(MBManifestDB *)v5 properties];
    if ([v9 encrypted]) {
      CFStringRef v10 = @"encrypted";
    }
    else {
      CFStringRef v10 = @"unencrypted";
    }
    CFStringRef v51 = v10;
    _MBLog();
  }
LABEL_13:
  if ([(MBEngine *)self encrypted])
  {
    id v11 = [(MBDriveBackupEngine *)self password];

    if (!v11)
    {
      v50 = +[NSAssertionHandler currentHandler];
      [v50 handleFailureInMethod:a2 object:self file:@"MBDriveBackupEngine.m" lineNumber:1139 description:@"No password available for encrypted backup"];
    }
  }
  if ([(MBEngine *)self encrypted])
  {
    int64_t v12 = [(MBDriveBackupEngine *)self password];
    id v56 = 0;
    unsigned __int8 v13 = [(MBManifestDB *)v5 setupEncryptionWithPassword:v12 withError:&v56];
    id v14 = (__CFString *)v56;

    if ((v13 & 1) == 0)
    {
      CFStringRef v15 = MBGetDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v58 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to setup manifest encryption: %@", buf, 0xCu);
        _MBLog();
      }

      unsigned __int8 v16 = v14;
      unsigned int v17 = v16;
      goto LABEL_51;
    }
  }
  else
  {
    id v14 = 0;
  }
  id v18 = [(MBDriveBackupEngine *)self settingsContext];
  useconds_t v19 = [v18 keybag];

  if (v19)
  {
    if (!self->_fullBackup || self->_retryCount)
    {
      id v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Keybag already initialized", buf, 2u);
        _MBLog();
      }

      goto LABEL_53;
    }
    v37 = MBGetDefaultLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Performing full backup, creating keybag", buf, 2u);
      _MBLog();
    }

    id v38 = [(MBDriveBackupEngine *)self password];
    double v53 = v14;
    int v39 = +[MBKeyBag keybagWithPassword:v38 error:&v53];
    unsigned int v17 = v53;

    v40 = [(MBDriveBackupEngine *)self settingsContext];
    [v40 setKeybag:v39];

    if (v17)
    {
LABEL_50:
      unsigned __int8 v16 = +[MBError errorWithCode:1 error:v17 format:@"Error creating keybag"];
LABEL_51:
      double v41 = v16;
      goto LABEL_58;
    }
    id v14 = 0;
    goto LABEL_53;
  }
  long long v21 = [(MBManifestDB *)v5 properties];
  long long v22 = [v21 keybagData];
  if (v22)
  {
    BOOL fullBackup = self->_fullBackup;

    if (fullBackup) {
      goto LABEL_40;
    }
    id v24 = MBGetDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Decoding and unlocking keybag from manifest", buf, 2u);
      _MBLog();
    }

    id v25 = [(MBManifestDB *)v5 properties];
    long long v21 = [v25 keybagData];

    if (!v21)
    {
      double v41 = +[MBError errorWithCode:205 format:@"No keybag in manifest"];
      unsigned int v17 = v14;
      goto LABEL_57;
    }
    id v26 = [(MBDriveBackupEngine *)self password];
    id v55 = v14;
    __int16 v27 = +[MBKeyBag unlockedKeyBagWithData:v21 password:v26 error:&v55];
    unsigned int v17 = v55;

    id v28 = [(MBDriveBackupEngine *)self settingsContext];
    [v28 setKeybag:v27];

    if (v17)
    {
      if (!+[MBError isError:v17 withCode:207])
      {
        CFStringRef v46 = @"Error decoding keybag from manifest";
        uint64_t v47 = 205;
        goto LABEL_55;
      }
      __int16 v29 = MBGetDefaultLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Password in keychain doesn't match keybag", buf, 2u);
        _MBLog();
      }
    }
    id v14 = 0;
  }

LABEL_40:
  id v30 = [(MBDriveBackupEngine *)self settingsContext];
  id v31 = [v30 keybag];

  if (!v31)
  {
    id v32 = MBGetDefaultLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Creating keybag", buf, 2u);
      _MBLog();
    }

    uint64_t v33 = [(MBDriveBackupEngine *)self password];
    unsigned __int8 v54 = v14;
    id v34 = +[MBKeyBag keybagWithPassword:v33 error:&v54];
    unsigned int v17 = v54;

    id v35 = [(MBDriveBackupEngine *)self settingsContext];
    [v35 setKeybag:v34];

    if (!v17)
    {
      uint64_t v36 = MBGetDefaultLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Performing a full backup", buf, 2u);
        _MBLog();
      }

      id v14 = 0;
      self->_BOOL fullBackup = 1;
      goto LABEL_53;
    }
    goto LABEL_50;
  }
LABEL_53:
  BOOL v42 = [(MBEngine *)self encrypted];
  id v43 = [(MBManifestDB *)self->_snapshotManifestDB properties];
  [v43 setEncrypted:v42];

  unsigned int v44 = [(MBDriveBackupEngine *)self settingsContext];
  double v45 = [v44 keybag];
  id v52 = v14;
  long long v21 = [v45 dataWithError:&v52];
  unsigned int v17 = v52;

  if (!v17)
  {
    uint64_t v48 = [(MBManifestDB *)self->_snapshotManifestDB properties];
    [v48 setKeybagData:v21];

    double v41 = 0;
    goto LABEL_57;
  }
  CFStringRef v46 = @"Error encoding keybag";
  uint64_t v47 = 1;
LABEL_55:
  double v41 = +[MBError errorWithCode:v47 error:v17 format:v46];
LABEL_57:

LABEL_58:

  return v41;
}

- (id)_scanAllDomains
{
  debugContext = self->super._debugContext;
  id v4 = +[NSNumber numberWithBool:self->_fullBackup];
  [(MBDebugContext *)debugContext setValue:v4 forName:@"DidFullBackup"];

  BOOL v5 = self->super._debugContext;
  id v6 = +[NSNumber numberWithBool:[(MBDriveBackupEngine *)self isFinalRetry]];
  [(MBDebugContext *)v5 setValue:v6 forName:@"IsFinalRetry"];

  unsigned __int8 v7 = [[MBFileScanner alloc] initWithDelegate:self mode:1 enginePolicy:[(MBEngine *)self enginePolicy] debugContext:self->super._debugContext];
  [(MBDriveBackupEngine *)self setScanner:v7];
  if ([(MBEngine *)self isCanceled]) {
    [(MBFileScanner *)v7 cancel];
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  CFStringRef v8 = self->_domainsToScan;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v27;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        unsigned __int8 v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v14 = [(MBDriveBackupEngine *)self mountedSnapshotTracker];
        CFStringRef v15 = [v13 volumeMountPoint];
        unsigned __int8 v16 = [v14 snapshotMountPointForVolumeMountPoint:v15];

        if (!v16) {
          sub_10009915C();
        }
        if ([v13 isPlaceholderDomain])
        {
          unsigned int v17 = MBGetDefaultLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Skipping scanning the PlaceholderDomain", buf, 2u);
            _MBLog();
          }
        }
        else
        {
          id v18 = [(MBFileScanner *)v7 scanDomain:v13 snapshotMountPoint:v16];
          if (v18)
          {
            id v22 = v18;

            long long v23 = v22;
            goto LABEL_20;
          }
        }
      }
      id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  useconds_t v19 = MBGetDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = [(MBFileScanner *)v7 loggableStats];
    *(_DWORD *)buf = 138412290;
    id v31 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Finished scanning all domains - %@", buf, 0xCu);

    id v25 = [(MBFileScanner *)v7 loggableStats];
    _MBLog();
  }
  modifiedDomains = self->_modifiedDomains;
  id v22 = [(MBFileScanner *)v7 modifiedDomains];
  [(NSMutableSet *)modifiedDomains unionSet:v22];
  long long v23 = 0;
LABEL_20:

  return v23;
}

- (BOOL)fileScanner:(id)a3 isFileAddedOrModified:(id)a4
{
  id v5 = a4;
  id v6 = [v5 fileID];
  unsigned __int8 v7 = 0;
  if (([(MBManifestDB *)self->_snapshotManifestDB flagsForFileID:v6 error:0] & 8) != 0)
  {
    unsigned __int8 v7 = [(MBManifestDB *)self->_snapshotManifestDB fetchFileWithID:v6 error:0];
  }
  if (!self->_fullBackup && v7 == 0)
  {
    unsigned __int8 v7 = [(MBManifestDB *)self->_backupManifestDB fetchFileWithID:v6 error:0];
  }
  if (v7)
  {
    id v9 = [v5 lastModified];
    BOOL v10 = v9 != [v7 lastModified];
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (id)fileScanner:(id)a3 didFindFile:(id)a4
{
  id v5 = a4;
  snapshotManifestDB = self->_snapshotManifestDB;
  unsigned __int8 v7 = [v5 fileID];
  unsigned __int8 v8 = [(MBManifestDB *)snapshotManifestDB flagsForFileID:v7 error:0];

  id v9 = self->_snapshotManifestDB;
  BOOL v10 = [v5 fileID];
  unsigned __int8 v11 = [(MBManifestDB *)v9 flagsForFileID:v10 error:0];

  int64_t v12 = 0;
  if ((v8 & 8) != 0)
  {
    unsigned __int8 v13 = self->_snapshotManifestDB;
    id v14 = [v5 fileID];
    int64_t v12 = [(MBManifestDB *)v13 fetchFileWithID:v14 error:0];
  }
  if (self->_fullBackup || v12 != 0)
  {
LABEL_16:
    if (!v12)
    {
      long long v29 = MBGetDefaultLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        id v30 = [v5 typeString];
        id v31 = [v5 absolutePath];
        id v32 = [v5 fileID];
        *(_DWORD *)buf = 138412802;
        long long v66 = v30;
        __int16 v67 = 2112;
        long long v68 = v31;
        __int16 v69 = 2112;
        long long v70 = v32;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Added %@: %@ (%@)", buf, 0x20u);

        uint64_t v33 = [v5 typeString];
        id v34 = [v5 absolutePath];
        long long v62 = [v5 fileID];
        _MBLog();
      }
      if ([v5 isRegularFile])
      {
        [(MBDriveBackupEngine *)self _addFileToUploadAndMove:v5 flags:0];
LABEL_45:
        id v22 = 0;
        goto LABEL_46;
      }
      id v22 = [(MBDriveBackupEngine *)self _addMetadataToFile:v5];
      if (v22)
      {
        if (!+[MBError isError:v22 withCode:4]) {
          goto LABEL_46;
        }
        double v41 = MBGetDefaultLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v42 = [v5 absolutePath];
          id v43 = [v5 fileID];
          *(_DWORD *)buf = 138412546;
          long long v66 = v42;
          __int16 v67 = 2112;
          long long v68 = v43;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Removed while getting metadata: %@ (%@)", buf, 0x16u);

          unsigned int v44 = [v5 absolutePath];
          long long v60 = [v5 fileID];
          _MBLog();
        }
        modifiedDomains = self->_modifiedDomains;
        CFStringRef v46 = [v5 domain];
        [(NSMutableSet *)modifiedDomains addObject:v46];

        goto LABEL_45;
      }
      [(MBDriveBackupEngine *)self _addFileToLeaveAlone:v5 flags:0];
      goto LABEL_46;
    }
    goto LABEL_17;
  }
  backupManifestDB = self->_backupManifestDB;
  unsigned int v17 = [v5 fileID];
  int64_t v12 = [(MBManifestDB *)backupManifestDB fetchFileWithID:v17 error:0];

  id v18 = [(MBManifestDB *)self->_backupManifestDB properties];
  if ([v18 encrypted]) {
    BOOL v19 = v12 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  if (v19 || ([v12 isRegularFile] & 1) == 0)
  {

    goto LABEL_16;
  }
  id v20 = [v12 encryptionKey];

  if (!v20)
  {
    long long v21 = [v5 fileID];
    id v22 = +[MBError errorWithCode:205, @"Encryption key missing: %@ (%@)", v12, v21 format];

LABEL_51:
    goto LABEL_46;
  }
LABEL_17:
  id v23 = [v5 lastModified];
  if (v23 == [v12 lastModified])
  {
    id v24 = MBGetDefaultLog();
    id v25 = v24;
    if ((v8 & 8) != 0 && (v11 & 0x80) != 0)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        long long v26 = [v5 absolutePath];
        long long v27 = [v5 fileID];
        *(_DWORD *)buf = 138412546;
        long long v66 = v26;
        __int16 v67 = 2112;
        long long v68 = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Unmodified and already uploaded to snapshot: %@ (%@)", buf, 0x16u);

        long long v28 = [v5 absolutePath];
        long long v59 = [v5 fileID];
        _MBLog();
      }
      [(MBDriveBackupEngine *)self _addFileToMove:v12];
    }
    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v47 = [v5 typeString];
        uint64_t v48 = [v5 absolutePath];
        id v49 = [v5 fileID];
        *(_DWORD *)buf = 138412802;
        long long v66 = v47;
        __int16 v67 = 2112;
        long long v68 = v48;
        __int16 v69 = 2112;
        long long v70 = v49;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Unmodified %@: %@ (%@)", buf, 0x20u);

        v50 = [v5 typeString];
        CFStringRef v51 = [v5 absolutePath];
        long long v64 = [v5 fileID];
        _MBLog();
      }
      [(MBDriveBackupEngine *)self _addFileToLeaveAlone:v12 flags:0];
    }
    goto LABEL_44;
  }
  id v35 = MBGetDefaultLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    uint64_t v36 = [v5 typeString];
    v37 = [v5 absolutePath];
    id v38 = [v5 fileID];
    *(_DWORD *)buf = 138412802;
    long long v66 = v36;
    __int16 v67 = 2112;
    long long v68 = v37;
    __int16 v69 = 2112;
    long long v70 = v38;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Modified %@: %@ (%@)", buf, 0x20u);

    int v39 = [v5 typeString];
    v40 = [v5 absolutePath];
    long long v63 = [v5 fileID];
    _MBLog();
  }
  if ([v5 isRegularFile])
  {
    [(MBDriveBackupEngine *)self _addFileToUploadAndMove:v5 flags:0];
LABEL_44:

    goto LABEL_45;
  }
  id v22 = [(MBDriveBackupEngine *)self _addMetadataToFile:v5];
  if (!v22)
  {
    [(MBDriveBackupEngine *)self _addFileToLeaveAlone:v5 flags:0];
    goto LABEL_51;
  }
  if (+[MBError isError:v22 withCode:4])
  {
    id v52 = MBGetDefaultLog();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      double v53 = [v5 absolutePath];
      unsigned __int8 v54 = [v5 fileID];
      *(_DWORD *)buf = 138412546;
      long long v66 = v53;
      __int16 v67 = 2112;
      long long v68 = v54;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Removed while getting metadata: %@ (%@)", buf, 0x16u);

      id v55 = [v5 absolutePath];
      long long v61 = [v5 fileID];
      _MBLog();
    }
    id v56 = self->_modifiedDomains;
    long long v57 = [v5 domain];
    [(NSMutableSet *)v56 addObject:v57];

    goto LABEL_44;
  }
  id v22 = v22;

LABEL_46:

  return v22;
}

- (BOOL)fileScanner:(id)a3 shouldExcludeFile:(id)a4
{
  id v5 = a4;
  if ([(MBEngine *)self isDeviceTransferEngine]) {
    goto LABEL_7;
  }
  if ([(MBEngine *)self encrypted]) {
    goto LABEL_7;
  }
  id v6 = [v5 domain];
  unsigned __int8 v7 = [v6 relativePathsToOnlyBackupEncrypted];
  unsigned __int8 v8 = [v5 relativePath];
  unsigned int v9 = [v7 containsObject:v8];

  if (!v9)
  {
LABEL_7:
    BOOL v12 = 0;
  }
  else
  {
    BOOL v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v11 = [v5 absolutePath];
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "File excluded in unencrypted drive backups: %@", buf, 0xCu);

      id v14 = [v5 absolutePath];
      _MBLog();
    }
    BOOL v12 = 1;
  }

  return v12;
}

- (void)_addFileToUploadAndMove:(id)a3 flags:(unint64_t)a4
{
  id v21 = a3;
  id v6 = [v21 size];
  if (*(_OWORD *)&self->_inodeCache == 0)
  {
    uint64_t v9 = 0;
  }
  else
  {
    if ([v21 isHardLink])
    {
      unsigned __int8 v7 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v21 inodeNumber]);
      if ([(NSMutableSet *)self->_inodeCache containsObject:v7])
      {
        uint64_t v9 = 1;
      }
      else
      {
        [(NSMutableSet *)self->_inodeCache addObject:v7];
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    if ([v21 isFullClone])
    {
      unsigned __int8 v8 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v21 cloneID]);
      if ([(NSMutableSet *)self->_cloneIDCache containsObject:v8]) {
        uint64_t v9 = v9 | 2;
      }
      else {
        [(NSMutableSet *)self->_cloneIDCache addObject:v8];
      }
    }
  }
  BOOL v10 = [v21 domain];
  unsigned __int8 v11 = [v21 fileID];
  BOOL v12 = [v21 absolutePath];
  unsigned __int8 v13 = +[MBBackupOperation backupOperationWithType:2 domain:v10 fileID:v11 path:v12 size:v6 flags:v9];

  [(MBBackupOperationJournal *)self->_operationJournal addOperation:v13];
  id v14 = [v21 domain];
  CFStringRef v15 = [v21 fileID];
  unsigned __int8 v16 = +[MBBackupOperation backupOperationWithType:3 domain:v14 fileID:v15 path:0 size:0];

  [(MBBackupOperationJournal *)self->_operationJournal addOperation:v16];
  id v17 = [(MBManifestDB *)self->_snapshotManifestDB addPlaceholderForFile:v21 flags:a4];
  snapshotManifestDB = self->_snapshotManifestDB;
  BOOL v19 = [v21 fileID];
  id v20 = [(MBManifestDB *)snapshotManifestDB setFlags:0 mask:-65 forFileID:v19];
}

- (void)_addFileToMove:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domain];
  id v6 = [v4 fileID];
  id v10 = +[MBBackupOperation backupOperationWithType:3 domain:v5 fileID:v6 path:0 size:0];

  [(MBBackupOperationJournal *)self->_operationJournal addOperation:v10];
  snapshotManifestDB = self->_snapshotManifestDB;
  unsigned __int8 v8 = [v4 fileID];

  id v9 = [(MBManifestDB *)snapshotManifestDB setFlags:136 mask:-65 forFileID:v8];
}

- (void)_addFileToLeaveAlone:(id)a3 flags:(unint64_t)a4
{
  id v4 = [(MBManifestDB *)self->_snapshotManifestDB addFile:a3 flags:a4];
}

- (id)_addMetadataToFile:(id)a3
{
  id v5 = a3;
  if ([v5 isRegularFile])
  {
    id v20 = +[NSAssertionHandler currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"MBDriveBackupEngine.m" lineNumber:1406 description:@"Metadata should be added to files after upload"];
  }
  id v24 = 0;
  id v6 = +[MBExtendedAttributes attributesForPathFSR:error:](MBExtendedAttributes, "attributesForPathFSR:error:", [v5 absolutePathFSR], &v24);
  id v7 = v24;
  [v5 setExtendedAttributes:v6];

  unsigned __int8 v8 = [v5 extendedAttributes];

  if (v8)
  {
    id v9 = [v5 extendedAttributes];
    unint64_t v10 = +[MBExtendedAttributes sizeOfAttributes:v9];

    if (v10 >= 0x801)
    {
      unsigned __int8 v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v12 = [v5 absolutePath];
        *(_DWORD *)buf = 134218498;
        unint64_t v26 = v10;
        __int16 v27 = 1024;
        int v28 = 2048;
        __int16 v29 = 2112;
        id v30 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Extended attributes size greater than supported (%{bytes}lu > %{bytes}d): %@", buf, 0x1Cu);

        [v5 absolutePath];
        id v23 = v22 = 2048;
        unint64_t v21 = v10;
        _MBLog();
      }
      [v5 setExtendedAttributes:&__NSDictionary0__struct];
    }
    if (objc_msgSend(v5, "isSymbolicLink", v21, v22, v23))
    {
      if ([v5 isDataless])
      {
        unsigned __int8 v13 = [v5 relativePath];
        id v14 = +[MBError errorWithDomain:NSCocoaErrorDomain, 3328, @"Dataless symlinks are not supported: %@", v13 code format];
      }
      else
      {
        id v14 = [v5 backupSymbolicLinkTarget];

        if (v14)
        {
          id v7 = v14;
          id v14 = v7;
        }
        else
        {
          id v7 = 0;
        }
      }
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    unsigned int v15 = +[MBError isError:v7 withCode:4];
    unsigned __int8 v16 = [v5 absolutePath];
    if (v15)
    {
      CFStringRef v17 = @"File removed while getting extended attributes";
      uint64_t v18 = 4;
    }
    else
    {
      CFStringRef v17 = @"Error reading extended attributes";
      uint64_t v18 = 101;
    }
    id v14 = +[MBError errorWithCode:v18 error:v7 path:v16 format:v17];
  }

  return v14;
}

- (id)_findPathsRemovedFromBackup
{
  if (self->_fullBackup)
  {
    v2 = 0;
LABEL_9:
    id v4 = 0;
    goto LABEL_10;
  }
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Searching old manifest for removed regular files", buf, 2u);
    _MBLog();
  }

  *(void *)buf = 0;
  BOOL v12 = buf;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_100029794;
  unsigned int v15 = sub_1000297A4;
  id v16 = 0;
  backupManifestDB = self->_backupManifestDB;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000297AC;
  v10[3] = &unk_1000F15E0;
  v10[4] = self;
  v10[5] = buf;
  uint64_t v6 = [(MBManifestDB *)backupManifestDB enumerateFiles:v10];
  v2 = (void *)v6;
  id v7 = (void *)*((void *)v12 + 5);
  if (v7 || (id v7 = (void *)v6) != 0)
  {
    id v4 = v7;
    int v8 = 0;
  }
  else
  {
    int v8 = 1;
  }
  _Block_object_dispose(buf, 8);

  if (v8) {
    goto LABEL_9;
  }
LABEL_10:

  return v4;
}

- (id)_scanFinished
{
  id v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Committing operation journal", buf, 2u);
    _MBLog();
  }

  [(MBBackupOperationJournal *)self->_operationJournal commit];
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    unint64_t v5 = [(MBBackupOperationJournal *)self->_operationJournal size];
    *(_DWORD *)buf = 134217984;
    unint64_t v30 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Operation journal size: %{bytes}llu", buf, 0xCu);
    unint64_t v25 = [(MBBackupOperationJournal *)self->_operationJournal size];
    _MBLog();
  }

  if (![(MBEngine *)self encrypted])
  {
    id v13 = 0;
    goto LABEL_12;
  }
  uint64_t v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Fetching manifest encryption key", buf, 2u);
    _MBLog();
  }

  snapshotManifestDB = self->_snapshotManifestDB;
  int v8 = [(MBDriveBackupEngine *)self settingsContext];
  id v9 = [v8 keybag];
  id v28 = 0;
  unint64_t v10 = [(MBManifestDB *)snapshotManifestDB getEncryptedFileHandleWithKeybag:v9 error:&v28];
  id v11 = v28;

  if (!v10)
  {
    uint64_t v22 = MBGetDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Couldn't get an encrypted file handle for the manifest DB, and therefore couldn't write out its wrapped key", buf, 2u);
      _MBLog();
    }

    CFStringRef v20 = @"Error getting manifest encryption key";
    uint64_t v21 = 101;
LABEL_20:
    BOOL v19 = +[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", v21, v11, v20, v25);
    goto LABEL_21;
  }
  id v27 = v11;
  BOOL v12 = [v10 encryptionKeyWithError:&v27];
  id v13 = v27;

  if (v12)
  {
    id v14 = [(MBManifestDB *)self->_snapshotManifestDB properties];
    [v14 setManifestEncryptionKey:v12];

LABEL_12:
    unsigned int v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Saving snapshot properties", buf, 2u);
      _MBLog();
    }

    id v16 = [(MBManifestDB *)self->_snapshotManifestDB properties];
    CFStringRef v17 = [(MBDriveBackupEngine *)self _deviceSnapshotPropertiesPath];
    id v26 = v13;
    unsigned __int8 v18 = [v16 writeToFile:v17 error:&v26];
    id v11 = v26;

    if (v18)
    {
      BOOL v19 = 0;
      goto LABEL_21;
    }
    CFStringRef v20 = @"Error saving snapshot properties";
    uint64_t v21 = 102;
    goto LABEL_20;
  }
  id v24 = MBGetDefaultLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Couldn't get the wrapped key for the manifest DB", buf, 2u);
    _MBLog();
  }

  BOOL v19 = +[MBError errorWithCode:101 error:v13 format:@"Error getting manifest encryption key"];

  id v11 = v13;
LABEL_21:

  return v19;
}

- (id)_prepareForPreflight
{
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting to prepare for preflight", buf, 2u);
    _MBLog();
  }

  +[NSDate timeIntervalSinceReferenceDate];
  double v6 = v5;
  id v7 = [(MBDriveBackupEngine *)self _prepareProgress];
  if (v7
    || ([(MBDriveBackupEngine *)self _prepareFreeSpace],
        (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v8 = v7;
    id v9 = v8;
  }
  else
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v12 = v11;
    int v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v14 = v12 - v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Prepared for preflight in %0.3fs", buf, 0xCu);
      _MBLog();
    }
    id v9 = 0;
  }

  return v9;
}

- (id)_prepareForUpload
{
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Starting to prepare for backup", buf, 2u);
    _MBLog();
  }

  +[NSDate timeIntervalSinceReferenceDate];
  double v6 = v5;
  id v7 = [(MBDriveBackupEngine *)self _prepareResume];
  if (v7
    || ([(MBDriveBackupEngine *)self _prepareMoveBackup],
        (id v7 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(MBDriveBackupEngine *)self _prepareSnapshot],
        (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v8 = v7;
    id v9 = v8;
  }
  else
  {
    if ([(MBDebugContext *)self->super._debugContext isFlagSet:@"SimulateCrashAfterPreparing"])abort(); {
    +[NSDate timeIntervalSinceReferenceDate];
    }
    double v12 = v11;
    int v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v14 = v12 - v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Prepared for backup in %0.3fs", buf, 0xCu);
      _MBLog();
    }
    id v9 = 0;
  }

  return v9;
}

- (id)_prepareProgress
{
  id v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Calculating expected duration", buf, 2u);
    _MBLog();
  }

  if ([(MBStatus *)self->_status isMoving] && !self->_retryCount)
  {
    driveScript = self->_driveScript;
    double v5 = [(MBBackupOperationJournal *)self->_operationJournal driveOperationsForType:0];
    [(MBDriveScript *)driveScript addOperations:v5];

    double v6 = self->_driveScript;
    id v7 = +[MBDriveOperation operationToMoveItem];
    [(MBDriveScript *)v6 addOperation:v7];

    int v8 = self->_driveScript;
    id v9 = +[MBDriveOperation operationToMoveItem];
    [(MBDriveScript *)v8 addOperation:v9];

    unint64_t v10 = self->_driveScript;
    double v11 = +[MBDriveOperation operationToUploadFileWithSize:0];
    [(MBDriveScript *)v10 addOperation:v11];
  }
  if (([(MBStatus *)self->_status isMoving] || [(MBStatus *)self->_status isRemoving])
    && !self->_retryCount)
  {
    double v12 = self->_driveScript;
    id v13 = [(MBBackupOperationJournal *)self->_operationJournal driveOperationsForType:1];
    [(MBDriveScript *)v12 addOperations:v13];

    double v14 = self->_driveScript;
    unsigned int v15 = +[MBDriveOperation operationToRemoveItem];
    [(MBDriveScript *)v14 addOperation:v15];

    id v16 = self->_driveScript;
    CFStringRef v17 = +[MBDriveOperation operationToRemoveItem];
    [(MBDriveScript *)v16 addOperation:v17];

    unsigned __int8 v18 = self->_driveScript;
    BOOL v19 = +[MBDriveOperation operationToUploadFileWithSize:0];
    [(MBDriveScript *)v18 addOperation:v19];
  }
  status = self->_status;
  if (status)
  {
    [(MBStatus *)status version];
    if (v21 < 3.3 && ![(MBDriveBackupEngine *)self movedOldBackup])
    {
      uint64_t v22 = self->_driveScript;
      id v23 = +[MBDriveOperation operationToMoveItem];
      [(MBDriveScript *)v22 addOperation:v23];
    }
  }
  id v24 = self->_driveScript;
  unint64_t v25 = +[MBDriveOperation operationToCreateDirectory];
  [(MBDriveScript *)v24 addOperation:v25];

  id v26 = self->_driveScript;
  id v27 = +[MBDriveOperation operationToCreateDirectory];
  [(MBDriveScript *)v26 addOperation:v27];

  id v28 = [(MBDriveBackupEngine *)self prefixDirectories];
  int v29 = [v28 count];

  if (v29 >= 1)
  {
    do
    {
      unint64_t v30 = self->_driveScript;
      id v31 = +[MBDriveOperation operationToCreateDirectory];
      [(MBDriveScript *)v30 addOperation:v31];

      id v32 = self->_driveScript;
      uint64_t v33 = +[MBDriveOperation operationToCreateDirectory];
      [(MBDriveScript *)v32 addOperation:v33];

      --v29;
    }
    while (v29);
  }
  id v34 = self->_driveScript;
  id v35 = +[MBDriveOperation operationToUploadFileWithSize:0];
  [(MBDriveScript *)v34 addOperation:v35];

  uint64_t v36 = self->_driveScript;
  v37 = [(MBBackupOperationJournal *)self->_operationJournal driveOperationsForType:2];
  [(MBDriveScript *)v36 addOperations:v37];

  id v38 = self->_driveScript;
  int v39 = +[MBDriveOperation operationToUploadFileWithSize:0];
  [(MBDriveScript *)v38 addOperation:v39];

  v40 = self->_driveScript;
  double v41 = +[MBDriveOperation operationToUploadFileWithSize:0];
  [(MBDriveScript *)v40 addOperation:v41];

  BOOL v42 = self->_driveScript;
  id v43 = +[MBDriveOperation operationToUploadFileWithSize:0];
  [(MBDriveScript *)v42 addOperation:v43];

  unsigned int v44 = self->_driveScript;
  double v45 = [(MBBackupOperationJournal *)self->_operationJournal driveOperationsForType:3];
  [(MBDriveScript *)v44 addOperations:v45];

  CFStringRef v46 = self->_driveScript;
  uint64_t v47 = +[MBDriveOperation operationToMoveItem];
  [(MBDriveScript *)v46 addOperation:v47];

  uint64_t v48 = self->_driveScript;
  id v49 = +[MBDriveOperation operationToMoveItem];
  [(MBDriveScript *)v48 addOperation:v49];

  v50 = self->_driveScript;
  CFStringRef v51 = +[MBDriveOperation operationToUploadFileWithSize:0];
  [(MBDriveScript *)v50 addOperation:v51];

  id v52 = self->_driveScript;
  double v53 = [(MBBackupOperationJournal *)self->_operationJournal driveOperationsForType:4];
  [(MBDriveScript *)v52 addOperations:v53];

  unsigned __int8 v54 = self->_driveScript;
  id v55 = +[MBDriveOperation operationToRemoveItem];
  [(MBDriveScript *)v54 addOperation:v55];

  id v56 = self->_driveScript;
  long long v57 = +[MBDriveOperation operationToRemoveItem];
  [(MBDriveScript *)v56 addOperation:v57];

  CFStringRef v58 = self->_driveScript;
  long long v59 = +[MBDriveOperation operationToUploadFileWithSize:0];
  [(MBDriveScript *)v58 addOperation:v59];

  long long v60 = self->_status;
  if (v60)
  {
    [(MBStatus *)v60 version];
    if (v61 < 3.3)
    {
      long long v62 = self->_driveScript;
      long long v63 = +[MBDriveOperation operationToRemoveItem];
      [(MBDriveScript *)v62 addOperation:v63];
    }
  }
  [(MBDriveScript *)self->_driveScript beginPerforming];
  long long v64 = [(MBDebugContext *)self->super._debugContext valueForName:@"InjectedDriveErrorIndex"];

  if (v64)
  {
    long long v65 = [[MBErrorInjectorDrive alloc] initWithScript:self->_driveScript delegate:self->_drive index:(int)[(MBDebugContext *)self->super._debugContext intForName:@"InjectedDriveErrorIndex"] subindex:(int)[(MBDebugContext *)self->super._debugContext intForName:@"InjectedDriveErrorSubindex"]];
    objc_storeStrong((id *)&self->_drive, v65);
    if ([(MBErrorInjectorDrive *)v65 done])
    {
      [(MBDebugContext *)self->super._debugContext setFlag:@"DoneInjectingDriveErrors"];
    }
    else
    {
      [(MBDebugContext *)self->super._debugContext setInt:[(MBErrorInjectorDrive *)v65 nextIndex] forName:@"NextInjectedDriveErrorIndex"];
      [(MBDebugContext *)self->super._debugContext setInt:[(MBErrorInjectorDrive *)v65 nextSubindex] forName:@"NextInjectedDriveErrorSubindex"];
    }
  }
  long long v66 = MBGetDefaultLog();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    [(MBProgress *)self->_progress total];
    *(_DWORD *)buf = 134217984;
    uint64_t v70 = v67;
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "Expected duration: %0.3f s", buf, 0xCu);
    [(MBProgress *)self->_progress total];
    _MBLog();
  }

  return 0;
}

- (id)_prepareFreeSpace
{
  unint64_t v3 = [(MBBackupOperationJournal *)self->_operationJournal countForType:2];
  unint64_t v4 = [(MBBackupOperationJournal *)self->_operationJournal sizeForType:2];
  unint64_t v5 = [(MBBackupOperationJournal *)self->_operationJournal sizeExcludingHardlinksAndClonesForType:2];
  double v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    unint64_t v29 = v4;
    __int16 v30 = 2048;
    unint64_t v31 = v5;
    __int16 v32 = 2048;
    unint64_t v33 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "uploadSize:%llu(%llu), uploadFileCount:%llu", buf, 0x20u);
    _MBLog();
  }

  [(MBDriveBackupEngine *)self setUploadFileCount:v3];
  [(MBDriveBackupEngine *)self setUploadSize:v4];
  [(MBDriveBackupEngine *)self setUploadSizeExcludingHardlinksAndClones:v5];
  if ([(MBEngine *)self isDeviceTransferEngine])
  {
    id v7 = 0;
LABEL_5:
    id v7 = v7;
    int v8 = v7;
  }
  else
  {
    id v26 = 0;
    unint64_t v27 = 0;
    unsigned int v9 = [(MBDrive *)self->_drive freeSpace:&v27 error:&v26];
    id v7 = v26;
    if (v9)
    {
      char v10 = 0;
      unint64_t v11 = v4 + 0x8000000;
      while (1)
      {
        double v12 = MBGetDefaultLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          unint64_t v29 = v27;
          __int16 v30 = 2048;
          unint64_t v31 = v27;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Free disk space on drive: %llu (%{bytes}llu)", buf, 0x16u);
          _MBLog();
        }

        id v13 = (char *)(v11 - v27);
        if ((uint64_t)(v11 - v27) < 0) {
          goto LABEL_5;
        }
        if (v10) {
          break;
        }
        double v14 = MBGetDefaultLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v29 = (unint64_t)v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Need extra space on host: %lld. Requesting host to purge now", buf, 0xCu);
          _MBLog();
        }

        id v24 = v7;
        unint64_t v25 = 0;
        unsigned __int8 v15 = [(MBDrive *)self->_drive purgeDiskSpace:&v25 amountRequested:v13 + 0x80000000 urgencyLevel:4 error:&v24];
        id v16 = v24;

        CFStringRef v17 = MBGetDefaultLog();
        unsigned __int8 v18 = v17;
        if ((v15 & 1) == 0)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v29 = (unint64_t)v16;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to purge disk space of drive: %@", buf, 0xCu);
            _MBLog();
          }

          goto LABEL_28;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v29 = v25;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Successfully purged on host: %llu", buf, 0xCu);
          _MBLog();
        }

        drive = self->_drive;
        id v26 = v16;
        unsigned __int8 v20 = [(MBDrive *)drive freeSpace:&v27 error:&v26];
        id v7 = v26;

        char v10 = 1;
        if ((v20 & 1) == 0) {
          goto LABEL_18;
        }
      }
      id v16 = v7;
LABEL_28:
      id v23 = MBGetDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218496;
        unint64_t v29 = v27;
        __int16 v30 = 2048;
        unint64_t v31 = v4;
        __int16 v32 = 1024;
        LODWORD(v33) = 0x8000000;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Insufficient free disk space on drive to backup (%llu < %llu + %d)", buf, 0x1Cu);
        _MBLog();
      }

      id v7 = +[MBError errorWithCode:105 format:@"Insufficient free disk space on drive to back up"];

      goto LABEL_5;
    }
LABEL_18:
    double v21 = MBGetDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v29 = (unint64_t)v7;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to get the free space of drive: %@", buf, 0xCu);
      _MBLog();
    }

    int v8 = 0;
  }

  return v8;
}

- (id)_prepareResume
{
  if (![(MBStatus *)self->_status isMoving]
    || self->_retryCount
    || ([(MBDriveBackupEngine *)self _moveWithOperationType:0],
        (unint64_t v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (([(MBStatus *)self->_status isMoving] || [(MBStatus *)self->_status isRemoving])
      && !self->_retryCount)
    {
      unint64_t v3 = [(MBDriveBackupEngine *)self _removeWithOperationType:1];
    }
    else
    {
      unint64_t v3 = 0;
    }
  }

  return v3;
}

- (id)_prepareMoveBackup
{
  status = self->_status;
  if (status
    && ([(MBStatus *)status version], v4 < 3.3)
    && ![(MBDriveBackupEngine *)self movedOldBackup])
  {
    id v7 = [(MBDriveBackupEngine *)self settingsContext];
    int v8 = [v7 targetIdentifier];

    unsigned int v9 = +[NSDate date];
    id v10 = objc_alloc_init((Class)NSDateFormatter);
    [v10 setDateFormat:@"yyyyMMdd-HHmmss"];
    unint64_t v11 = [v10 stringFromDate:v9];
    double v12 = +[NSString stringWithFormat:@"%@-%@", v8, v11];
    [(MBDriveBackupEngine *)self setMovedBackupName:v12];

    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      double v14 = [(MBDriveBackupEngine *)self movedBackupName];
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v8;
      __int16 v23 = 2112;
      id v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Renaming existing backup %@ to %@", buf, 0x16u);

      BOOL v19 = [(MBDriveBackupEngine *)self movedBackupName];
      _MBLog();
    }
    drive = self->_drive;
    id v16 = [(MBDriveBackupEngine *)self movedBackupName];
    id v20 = 0;
    unsigned int v17 = [(MBDrive *)drive moveItemAtPath:v8 toPath:v16 options:0 error:&v20];
    id v18 = v20;

    if (v17)
    {
      [(MBDriveBackupEngine *)self setMovedOldBackup:1];
      id v5 = 0;
    }
    else
    {
      id v5 = v18;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_prepareSnapshot
{
  unint64_t v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Creating backup directory", buf, 2u);
    _MBLog();
  }

  drive = self->_drive;
  id v5 = [(MBDriveBackupEngine *)self settingsContext];
  double v6 = [v5 driveBackupDir];
  id v58 = 0;
  unsigned __int8 v7 = [(MBDrive *)drive createDirectoryAtPath:v6 options:0 error:&v58];
  id v8 = v58;

  if ((v7 & 1) == 0)
  {
    if (!+[MBError isError:v8 withCode:3])
    {
      CFStringRef v40 = @"Error creating backup directory";
      goto LABEL_50;
    }

    id v8 = 0;
  }
  unsigned int v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Creating backup sub-directories", buf, 2u);
    _MBLog();
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v10 = [(MBDriveBackupEngine *)self prefixDirectories];
  id v11 = [v10 countByEnumeratingWithState:&v54 objects:v61 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v55;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v55 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        unsigned int v17 = [(MBDriveBackupEngine *)self settingsContext];
        uint64_t v18 = [v17 driveBackupDir];
        BOOL v19 = [(id)v18 stringByAppendingPathComponent:v15];

        id v20 = self->_drive;
        id v53 = v8;
        LOBYTE(v18) = [(MBDrive *)v20 createDirectoryAtPath:v19 options:0 error:&v53];
        id v21 = v53;

        if (v18)
        {
          id v8 = v21;
        }
        else
        {
          if (!+[MBError isError:v21 withCode:3])
          {
            id v8 = +[MBBackupHelper driveWriteError:v21 description:@"Error creating backup sub-directories"];

            goto LABEL_21;
          }

          id v8 = 0;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v54 objects:v61 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  if (!v8)
  {
    uint64_t v22 = MBGetDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Creating snapshot directory", buf, 2u);
      _MBLog();
    }

    __int16 v23 = self->_drive;
    id v24 = [(MBDriveBackupEngine *)self settingsContext];
    unint64_t v25 = [v24 driveSnapshotDir];
    id v52 = 0;
    unsigned __int8 v26 = [(MBDrive *)v23 createDirectoryAtPath:v25 options:0 error:&v52];
    id v8 = v52;

    if (v26)
    {
LABEL_27:
      unint64_t v27 = MBGetDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Creating snapshot sub-directories", buf, 2u);
        _MBLog();
      }

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v28 = [(MBDriveBackupEngine *)self prefixDirectories];
      id v29 = [v28 countByEnumeratingWithState:&v48 objects:v60 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = *(void *)v49;
        while (2)
        {
          for (j = 0; j != v30; j = (char *)j + 1)
          {
            if (*(void *)v49 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void *)(*((void *)&v48 + 1) + 8 * (void)j);
            id v35 = [(MBDriveBackupEngine *)self settingsContext];
            uint64_t v36 = [v35 driveSnapshotDir];
            v37 = [(id)v36 stringByAppendingPathComponent:v33];

            id v38 = self->_drive;
            id v47 = v8;
            LOBYTE(v36) = [(MBDrive *)v38 createDirectoryAtPath:v37 options:0 error:&v47];
            id v39 = v47;

            if (v36)
            {
              id v8 = v39;
            }
            else
            {
              if (!+[MBError isError:v39 withCode:3])
              {
                id v8 = +[MBBackupHelper driveWriteError:v39 description:@"Error creating snapshot sub-directories"];

                goto LABEL_43;
              }

              id v8 = 0;
            }
          }
          id v30 = [v28 countByEnumeratingWithState:&v48 objects:v60 count:16];
          if (v30) {
            continue;
          }
          break;
        }
      }
LABEL_43:

      if (!v8)
      {
        double v41 = MBGetDefaultLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Setting status to \"uploading\"", buf, 2u);
          _MBLog();
        }

        id v46 = 0;
        unsigned __int8 v42 = [(MBDriveBackupEngine *)self _uploadStatusToDriveWithSnapshotState:0 error:&v46];
        id v8 = v46;
        if (v42)
        {
          id v43 = 0;
          goto LABEL_52;
        }
      }
      goto LABEL_48;
    }
    if (+[MBError isError:v8 withCode:3])
    {

      id v8 = 0;
      goto LABEL_27;
    }
    CFStringRef v40 = @"Error creating snapshot directory";
LABEL_50:
    id v44 = +[MBBackupHelper driveWriteError:v8 description:v40];
    goto LABEL_51;
  }
LABEL_48:
  id v44 = v8;
  id v8 = v44;
LABEL_51:
  id v43 = v44;
LABEL_52:

  return v43;
}

- (id)_upload
{
  unint64_t v4 = [(MBBackupOperationJournal *)self->_operationJournal countForType:2];
  unint64_t v5 = [(MBBackupOperationJournal *)self->_operationJournal sizeForType:2];
  double v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v60 = v4;
    __int16 v61 = 2048;
    unint64_t v62 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting to upload %lu files of size %{bytes}llu", buf, 0x16u);
    unint64_t v40 = v4;
    unint64_t v41 = v5;
    _MBLog();
  }

  +[NSDate timeIntervalSinceReferenceDate];
  double v8 = v7;
  id v9 = [(MBDebugContext *)self->super._debugContext performSelectorForName:@"StartingUpload" withObject:self->super._debugContext];
  id v10 = [(MBDriveBackupEngine *)self _uploadInBatches];
  if (!v10)
  {
    if ([(MBDebugContext *)self->super._debugContext isFlagSet:@"SimulateErrorAfterUploading"])
    {
      id v10 = +[MBError errorWithCode:1 format:@"Simulated error after uploading"];
      goto LABEL_46;
    }
    if ([(MBDebugContext *)self->super._debugContext isFlagSet:@"SimulateCrashAfterUploading"])goto LABEL_49; {
    if ([(MBDriveBackupEngine *)self _shouldRetry])
    }
    {
      id v11 = 0;
      goto LABEL_9;
    }
    uint64_t v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Removing ephemeral files added and deleted during retries", buf, 2u);
      _MBLog();
    }

    id v10 = [(MBManifestDB *)self->_snapshotManifestDB removeEphemeralRetriedFiles];
    if (!v10)
    {
      id v16 = MBGetDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Preparing to close snapshot manifest database", buf, 2u);
        _MBLog();
      }

      id v10 = [(MBManifestDB *)self->_snapshotManifestDB unsetAlreadyUploadedFlags];
      if (!v10)
      {
        unsigned int v17 = MBGetDefaultLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Closing and checkpointing snapshot manifest database", buf, 2u);
          _MBLog();
        }

        snapshotManifestDB = self->_snapshotManifestDB;
        id v58 = 0;
        unsigned int v19 = [(MBManifestDB *)snapshotManifestDB closeWithError:&v58];
        id v10 = v58;
        if (v19)
        {
          id v20 = MBGetDefaultLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Uploading properties to snapshot", buf, 2u);
            _MBLog();
          }

          drive = self->_drive;
          id v21 = [(MBDriveBackupEngine *)self _deviceSnapshotPropertiesPath];
          long long v49 = [(MBDriveBackupEngine *)self settingsContext];
          uint64_t v22 = [v49 driveSnapshotPropertiesPath];
          id v57 = v10;
          LOBYTE(drive) = [(MBDrive *)drive uploadFileAtPath:v21 toPath:v22 options:0 error:&v57];
          id v44 = v57;

          if ((drive & 1) == 0)
          {
            id v10 = +[MBBackupHelper driveWriteError:v44 description:@"Error uploading properties to snapshot"];

            goto LABEL_46;
          }
          __int16 v23 = [(MBDriveBackupEngine *)self _deviceSnapshotPropertiesPath];
          id v56 = v44;
          id v24 = +[MBProperties propertiesWithFile:v23 error:&v56];
          id v50 = v56;

          if (v24)
          {
            long long v48 = v24;
            unint64_t v25 = self->_snapshotManifestDB;
            id v55 = v50;
            unsigned __int8 v26 = [(MBManifestDB *)v25 openWithError:&v55];
            id v27 = v55;

            if (v26)
            {
              id v28 = MBGetDefaultLog();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Uploading manifest database to snapshot", buf, 2u);
                _MBLog();
              }

              double v45 = self->_snapshotManifestDB;
              long long v51 = [(MBDriveBackupEngine *)self settingsContext];
              id v29 = [v51 driveSnapshotManifestDatabasePath];
              unsigned __int8 v42 = self->_drive;
              id v43 = [(MBDriveBackupEngine *)self settingsContext];
              id v30 = [v43 keybag];
              id v54 = v27;
              LOBYTE(v42) = [(MBManifestDB *)v45 uploadToPath:v29 withDrive:v42 keybag:v30 error:&v54];
              id v46 = v54;

              if (v42)
              {
                id v11 = v46;
                if (![(MBEngine *)self encrypted]) {
                  goto LABEL_32;
                }
                uint64_t v31 = self->_snapshotManifestDB;
                __int16 v32 = [(MBDriveBackupEngine *)self password];
                id v53 = v46;
                LOBYTE(v31) = [(MBManifestDB *)v31 setupEncryptionWithPassword:v32 withError:&v53];
                id v11 = v53;

                if ((v31 & 1) == 0)
                {
                  id v38 = MBGetDefaultLog();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    unint64_t v60 = (unint64_t)v11;
                    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Failed to setup manifest encryption: %@", buf, 0xCu);
                    _MBLog();
                  }
                }
                else
                {
LABEL_32:
                  uint64_t v33 = v11;
                  id v34 = MBGetDefaultLog();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Setting status to \"moving\"", buf, 2u);
                    _MBLog();
                  }

                  id v52 = v33;
                  unsigned __int8 v35 = [(MBDriveBackupEngine *)self _uploadStatusToDriveWithSnapshotState:1 error:&v52];
                  id v11 = v52;

                  if (v35)
                  {

LABEL_9:
                    if (![(MBDebugContext *)self->super._debugContext isFlagSet:@"SimulateCrashAfterUploadingSuccessfully", v40, v41])
                    {
                      +[NSDate timeIntervalSinceReferenceDate];
                      double v13 = v12;
                      double v14 = MBGetDefaultLog();
                      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 134218752;
                        unint64_t v60 = v4;
                        __int16 v61 = 2048;
                        unint64_t v62 = v5;
                        __int16 v63 = 2048;
                        double v64 = v13 - v8;
                        __int16 v65 = 2048;
                        unint64_t v66 = (unint64_t)((double)v5 / (v13 - v8));
                        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Uploaded %lu files of %{bytes}llu in %0.3f s at %{bytes}llu/s", buf, 0x2Au);
                        _MBLog();
                      }

                      id v10 = 0;
                      goto LABEL_46;
                    }
LABEL_49:
                    abort();
                  }
                }
                id v37 = v11;
                id v27 = v37;
              }
              else
              {
                id v27 = v46;
                id v37 = +[MBBackupHelper driveWriteError:v46 description:@"Error uploading database to snapshot"];
              }
            }
            else
            {
              uint64_t v36 = self->_snapshotManifestDB;
              self->_snapshotManifestDB = 0;

              id v37 = +[MBError errorWithCode:101 format:@"Error opening snapshot manifest database from device"];
            }
            id v10 = v37;
            id v24 = v48;
          }
          else
          {
            id v27 = v50;
            id v10 = v27;
          }
        }
      }
    }
  }
LABEL_46:

  return v10;
}

- (id)_uploadInBatches
{
  if (!self->_batchSize) {
    sub_100099188();
  }
  if (!self->_concurrentUploadBatchCount) {
    sub_1000991B4();
  }
  long long v68 = self->_drive;
  if (!v68) {
    sub_1000991E0();
  }
  v2 = MBGetDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = objc_opt_class();
    unint64_t batchSize = self->_batchSize;
    unint64_t concurrentUploadBatchCount = self->_concurrentUploadBatchCount;
    *(_DWORD *)buf = 138543874;
    *(void *)v121 = v3;
    *(_WORD *)&v121[8] = 2048;
    *(void *)&v121[10] = batchSize;
    *(_WORD *)&v121[18] = 2048;
    *(void *)&v121[20] = concurrentUploadBatchCount;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@, uploadBatchSize:%lu, concurrentUploadBatchCount:%lu", buf, 0x20u);
    uint64_t v6 = objc_opt_class();
    id v63 = self->_batchSize;
    unint64_t v64 = self->_concurrentUploadBatchCount;
    id v62 = (id)v6;
    _MBLog();
  }

  dispatch_semaphore_t v70 = dispatch_semaphore_create(self->_concurrentUploadBatchCount + (self->_concurrentUploadBatchCount >> 1));
  unsigned int v72 = [(MBEngine *)self isDeviceTransferEngine];
  id v76 = self->_batchSize;
  if (!v76) {
    sub_10009920C();
  }
  double v7 = [(MBDriveBackupEngine *)self settingsContext];
  long long v73 = [v7 driveSnapshotDir];

  if (!v73) {
    sub_100099238();
  }
  uint64_t v114 = 0;
  v115 = &v114;
  uint64_t v116 = 0x3032000000;
  v117 = sub_100029794;
  v118 = sub_1000297A4;
  id v119 = 0;
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x2020000000;
  uint64_t v113 = 0;
  uint64_t v106 = 0;
  v107 = &v106;
  uint64_t v108 = 0x2020000000;
  uint64_t v109 = 0;
  uint64_t v102 = 0;
  v103 = &v102;
  uint64_t v104 = 0x2020000000;
  uint64_t v105 = -1;
  uint64_t v98 = 0;
  v99 = &v98;
  uint64_t v100 = 0x2020000000;
  uint64_t v101 = 0;
  CFStringRef v130 = @"FileHandleFactory";
  v131 = self;
  long long v71 = +[NSDictionary dictionaryWithObjects:&v131 forKeys:&v130 count:1];
  group = dispatch_group_create();
  CFStringRef v78 = [(MBBackupOperationJournal *)self->_operationJournal operationEnumeratorWithDomainManager:self->super._domainManager];
  __uint64_t v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  __uint64_t v77 = 0;
  unint64_t v79 = 0;
  id v80 = 0;
  int v74 = 0;
  id v82 = 0;
  do
  {
    id v9 = [v78 nextObject];
    id v10 = v9;
    if (v9)
    {
      if ([v9 type] != 2) {
        goto LABEL_28;
      }
      id v11 = [v10 domain];
      BOOL v12 = v11 == 0;

      if (v12)
      {
        id v44 = +[NSAssertionHandler currentHandler];
        [v44 handleFailureInMethod:a2 object:self file:@"MBDriveBackupEngine.m" lineNumber:1920 description:@"No domain for upload operation"];
      }
      double v13 = [v10 fileID:v62, v63, v64, *(void *)&v65, v66];
      BOOL v14 = v13 == 0;

      if (v14)
      {
        double v45 = +[NSAssertionHandler currentHandler];
        [v45 handleFailureInMethod:a2 object:self file:@"MBDriveBackupEngine.m" lineNumber:1921 description:@"No file ID for upload operation"];
      }
      uint64_t v15 = [v10 path];
      BOOL v16 = v15 == 0;

      if (v16)
      {
        id v46 = +[NSAssertionHandler currentHandler];
        [v46 handleFailureInMethod:a2 object:self file:@"MBDriveBackupEngine.m" lineNumber:1922 description:@"No path for upload operation"];
      }
      if (!v82) {
        id v82 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v76];
      }
      if (!v80) {
        id v80 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v76];
      }
      unsigned int v17 = [v10 path];
      uint64_t v18 = [v10 fileID];
      unsigned int v19 = [v18 filenameWithPrefix];

      id v20 = [v73 stringByAppendingPathComponent:v19];
      if (v72)
      {
        [v82 objectForKeyedSubscript:v17];
        if (objc_claimAutoreleasedReturnValue()) {
          __assert_rtn("-[MBDriveBackupEngine _uploadInBatches]", "MBDriveBackupEngine.m", 1930, "!isDeviceTransfer || paths[fromPath] == nil");
        }
      }
      id v21 = [v10 size];
      [v82 setObject:v20 forKeyedSubscript:v17];
      id v22 = v17;
      __int16 v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v22 fileSystemRepresentation]);
      [v80 setObject:v10 forKeyedSubscript:v23];

      v79 += (unint64_t)v21;
    }
    else if ([v82 count])
    {
      goto LABEL_26;
    }
    if (objc_msgSend(v82, "count", v62, v63, v64) != v76)
    {
LABEL_28:
      LOBYTE(v25) = 0;
      goto LABEL_37;
    }
LABEL_26:
    id v24 = self;
    objc_sync_enter(v24);
    unsigned int v25 = [(MBEngine *)v24 isCanceled];
    if (v25)
    {
      uint64_t v26 = +[MBError errorWithCode:202 format:@"File upload cancelled"];
      id v27 = (void *)v115[5];
      v115[5] = v26;

      objc_sync_exit(v24);
    }
    else
    {
      [(NSMutableDictionary *)v24->_uploadOperationsByPath addEntriesFromDictionary:v80];
      objc_sync_exit(v24);

      __uint64_t v28 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
      id v29 = [[MBDriveUploadBatch alloc] initWithPaths:v82 size:v79 last:v10 == 0];
      __uint64_t v30 = v77;
      if (!v77) {
        __uint64_t v30 = v28;
      }
      __uint64_t v77 = v30;
      uint64_t add_explicit = atomic_fetch_add_explicit(&dword_100112EEC, 1u, memory_order_relaxed);
      __int16 v32 = MBGetDefaultLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        double v33 = (double)(v28 - v8) / 1000000000.0;
        id v34 = v32;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          unsigned int v35 = [(MBDriveUploadBatch *)v29 index];
          uint64_t v36 = [(MBDriveUploadBatch *)v29 paths];
          id v37 = [v36 count];
          *(_DWORD *)buf = 67110144;
          *(_DWORD *)v121 = v35;
          *(_WORD *)&v121[4] = 2048;
          *(void *)&v121[6] = v37;
          *(_WORD *)&v121[14] = 2048;
          *(void *)&v121[16] = v79;
          *(_WORD *)&v121[24] = 2048;
          *(double *)&v121[26] = v33;
          __int16 v122 = 1024;
          LODWORD(v123) = add_explicit;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Fetched batch i:%u, c:%lu, s:%llu, t:%.3f, o:%u", buf, 0x2Cu);
        }
        id v38 = (id)[(MBDriveUploadBatch *)v29 index];
        id v39 = [(MBDriveUploadBatch *)v29 paths];
        uint64_t v66 = add_explicit;
        double v65 = v33;
        id v63 = [v39 count];
        unint64_t v64 = v79;
        id v62 = v38;
        _MBLog();
      }
      dispatch_group_enter(group);
      v85[0] = _NSConcreteStackBlock;
      v85[1] = 3221225472;
      v85[2] = sub_10002CD10;
      v85[3] = &unk_1000F1608;
      unint64_t v40 = v70;
      v86 = v40;
      __uint64_t v96 = v28;
      __uint64_t v97 = v77;
      unint64_t v41 = v29;
      v87 = v41;
      v88 = v24;
      v91 = &v114;
      id v42 = v80;
      id v89 = v42;
      v92 = &v110;
      v93 = &v106;
      v94 = &v102;
      v95 = &v98;
      v90 = group;
      [(MBDriveBackupEngine *)v24 _uploadBatch:v41 options:v71 completion:v85];

      dispatch_semaphore_wait(v40, 0xFFFFFFFFFFFFFFFFLL);
      __uint64_t v8 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);

      unint64_t v79 = 0;
      id v80 = 0;
      id v82 = 0;
      ++v74;
      id v24 = (MBDriveBackupEngine *)v41;
    }

LABEL_37:
    char v43 = v25 ^ 1;
    if (!v10) {
      char v43 = 0;
    }
  }
  while ((v43 & 1) != 0);
  dispatch_group_enter(group);
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_10002D10C;
  v83[3] = &unk_1000F1630;
  id v47 = group;
  v84 = v47;
  [(MBDrive *)v68 finishBatchUploadsWithOptions:v71 completion:v83];
  MBGroupWaitForever();
  double v48 = (double)(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - v77) / 1000000000.0;
  double v49 = -1.0;
  if (v48 > 0.0) {
    double v49 = (double)(unint64_t)v111[3] / v48 / 1000000.0;
  }
  unint64_t v50 = v107[3];
  if (v50) {
    unint64_t v51 = v111[3] / v50;
  }
  else {
    unint64_t v51 = 0;
  }
  if (v115[5])
  {
    id v52 = MBGetDefaultLog();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      uint64_t v53 = v103[3];
      uint64_t v54 = v99[3];
      uint64_t v55 = v111[3];
      uint64_t v56 = v115[5];
      *(_DWORD *)buf = 67110914;
      *(_DWORD *)v121 = v74;
      *(_WORD *)&v121[4] = 2048;
      *(void *)&v121[6] = v53;
      *(_WORD *)&v121[14] = 2048;
      *(void *)&v121[16] = v54;
      *(_WORD *)&v121[24] = 2048;
      *(void *)&v121[26] = v51;
      __int16 v122 = 2048;
      uint64_t v123 = v55;
      __int16 v124 = 2048;
      double v125 = v48;
      __int16 v126 = 2048;
      double v127 = v49;
      __int16 v128 = 2112;
      uint64_t v129 = v56;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Failed to upload after %u batches, s:{%llu,%llu,%llu,%llu}, t:%.3f, r:%.3f - %@", buf, 0x4Eu);
      _MBLog();
    }
  }
  else
  {
    id v52 = MBGetDefaultLog();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v57 = v103[3];
      uint64_t v58 = v99[3];
      uint64_t v59 = v111[3];
      *(_DWORD *)buf = 67110656;
      *(_DWORD *)v121 = v74;
      *(_WORD *)&v121[4] = 2048;
      *(void *)&v121[6] = v57;
      *(_WORD *)&v121[14] = 2048;
      *(void *)&v121[16] = v58;
      *(_WORD *)&v121[24] = 2048;
      *(void *)&v121[26] = v51;
      __int16 v122 = 2048;
      uint64_t v123 = v59;
      __int16 v124 = 2048;
      double v125 = v48;
      __int16 v126 = 2048;
      double v127 = v49;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Finished uploading %u batches, s:{%llu,%llu,%llu,%llu}, t:%.3f, r:%.3f", buf, 0x44u);
      _MBLog();
    }
  }

  id v60 = (id)v115[5];
  _Block_object_dispose(&v98, 8);
  _Block_object_dispose(&v102, 8);
  _Block_object_dispose(&v106, 8);
  _Block_object_dispose(&v110, 8);
  _Block_object_dispose(&v114, 8);

  return v60;
}

- (void)_uploadBatch:(id)a3 options:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9) {
    sub_100099290();
  }
  BOOL v12 = v11;
  if (!v11) {
    sub_1000992BC();
  }
  double v13 = self->_drive;
  if (!v13) {
    sub_1000992E8();
  }
  BOOL v14 = v13;
  unsigned int v15 = [v9 index];
  [v9 paths];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002D290;
  v18[3] = &unk_1000F1658;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = self;
  unsigned int v23 = v15;
  id v21 = v12;
  SEL v22 = a2;
  id v16 = v12;
  id v17 = v19;
  [(MBDrive *)v14 uploadBatch:v9 options:v10 completion:v18];
}

- (id)_moveWithOperationType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unint64_t v6 = [(MBBackupOperationJournal *)self->_operationJournal countForType:v3];
  double v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v38 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Starting to move %lu items", buf, 0xCu);
    unint64_t v32 = v6;
    _MBLog();
  }

  +[NSDate timeIntervalSinceReferenceDate];
  double v9 = v8;
  if ([(MBDebugContext *)self->super._debugContext isFlagSet:@"SimulateErrorBeforeMoving"])
  {
    id v10 = +[MBError errorWithCode:1 format:@"Simulated error before moving"];
    goto LABEL_29;
  }
  id v10 = [(MBDriveBackupEngine *)self _moveInBatchesWithOperationType:v3];
  if (v10) {
    goto LABEL_29;
  }
  if ([(MBDebugContext *)self->super._debugContext isFlagSet:@"SimulateCrashAfterMoving"])goto LABEL_32; {
  double v33 = v5;
  }
  id v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Moving properties", buf, 2u);
    _MBLog();
  }

  drive = self->_drive;
  double v13 = [(MBDriveBackupEngine *)self settingsContext];
  BOOL v14 = [v13 driveSnapshotPropertiesPath];
  unsigned int v15 = [(MBDriveBackupEngine *)self settingsContext];
  id v16 = [v15 driveBackupPropertiesPath];
  id v36 = 0;
  unsigned __int8 v17 = [(MBDrive *)drive moveItemAtPath:v14 toPath:v16 options:0 error:&v36];
  id v18 = v36;

  if ((v17 & 1) == 0)
  {
    if (!+[MBError isError:v18 withCode:4])
    {
      id v10 = +[MBBackupHelper driveWriteError:v18 description:@"Error moving properties from snapshot"];

LABEL_28:
      unint64_t v5 = v33;
      goto LABEL_29;
    }

    id v18 = 0;
  }
  if ([(MBDebugContext *)self->super._debugContext isFlagSet:@"SimulateCrashAfterMovingProperties", v32])goto LABEL_32; {
  id v19 = MBGetDefaultLog();
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Moving manifest database", buf, 2u);
    _MBLog();
  }

  id v20 = self->_drive;
  id v21 = [(MBDriveBackupEngine *)self settingsContext];
  SEL v22 = [v21 driveSnapshotManifestDatabasePath];
  unsigned int v23 = [(MBDriveBackupEngine *)self settingsContext];
  id v24 = [v23 driveBackupManifestDatabasePath];
  id v35 = v18;
  unsigned __int8 v25 = [(MBDrive *)v20 moveItemAtPath:v22 toPath:v24 options:0 error:&v35];
  id v26 = v35;

  if (v25) {
    goto LABEL_18;
  }
  if (!+[MBError isError:v26 withCode:4])
  {
    id v10 = +[MBBackupHelper driveWriteError:v26 description:@"Error moving database from snapshot"];

    goto LABEL_28;
  }

  id v26 = 0;
LABEL_18:
  unint64_t v5 = v33;
  if ([(MBDebugContext *)self->super._debugContext isFlagSet:@"SimulateCrashAfterMovingManifest"])goto LABEL_32; {
  id v27 = MBGetDefaultLog();
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Setting status to \"removing\"", buf, 2u);
    _MBLog();
  }

  id v34 = v26;
  unsigned int v28 = [(MBDriveBackupEngine *)self _uploadStatusToDriveWithSnapshotState:2 error:&v34];
  id v10 = v34;

  if (v28)
  {
    if (![(MBDebugContext *)self->super._debugContext isFlagSet:@"SimulateCrashAfterMovingState"])
    {
      id v29 = MBGetDefaultLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        +[NSDate timeIntervalSinceReferenceDate];
        *(_DWORD *)buf = 134218240;
        unint64_t v38 = v6;
        __int16 v39 = 2048;
        double v40 = v30 - v9;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Moved %lu files in %0.3f s", buf, 0x16u);
        +[NSDate timeIntervalSinceReferenceDate];
        _MBLog();
      }

      id v10 = 0;
      goto LABEL_29;
    }
LABEL_32:
    abort();
  }
LABEL_29:

  return v10;
}

- (id)_moveInBatchesWithOperationType:(int)a3
{
  unint64_t v6 = +[NSMutableDictionary dictionaryWithCapacity:0];
  double v7 = [(MBBackupOperationJournal *)self->_operationJournal operationEnumeratorWithDomainManager:self->super._domainManager];
  uint64_t v9 = [v7 nextObject];
  if (!v9)
  {
LABEL_13:
    if ([v6 count])
    {
      id v28 = [(MBDriveBackupEngine *)self _moveBatchWithPaths:v6];
      if (!v28) {
        [v6 removeAllObjects];
      }
    }
    else
    {
      id v28 = 0;
    }
    goto LABEL_19;
  }
  id v10 = (void *)v9;
  SEL v30 = a2;
  int v31 = a3;
  while (1)
  {
    snapshotManifestDB = self->_snapshotManifestDB;
    BOOL v12 = [v10 fileID:v30];
    id v32 = 0;
    unsigned __int8 v13 = [(MBManifestDB *)snapshotManifestDB flagsForFileID:v12 error:&v32];
    id v14 = v32;

    if (v14)
    {
      id v28 = v14;
      goto LABEL_17;
    }
    if ([v10 type] == a3 && (v13 & 0x10) == 0) {
      break;
    }
LABEL_12:

    id v10 = [v7 nextObject];
    if (!v10) {
      goto LABEL_13;
    }
  }
  unsigned int v15 = v6;
  id v16 = v7;
  unsigned __int8 v17 = [v10 fileID];

  if (!v17)
  {
    id v27 = +[NSAssertionHandler currentHandler];
    [v27 handleFailureInMethod:v30 object:self file:@"MBDriveBackupEngine.m" lineNumber:2157 description:@"No file ID for move operation"];
  }
  id v18 = [v10 fileID];
  id v19 = [v18 filenameWithPrefix];

  id v20 = [(MBDriveBackupEngine *)self settingsContext];
  id v21 = [v20 driveSnapshotDir];
  SEL v22 = [v21 stringByAppendingPathComponent:v19];

  unsigned int v23 = [(MBDriveBackupEngine *)self settingsContext];
  id v24 = [v23 driveBackupDir];
  unsigned __int8 v25 = [v24 stringByAppendingPathComponent:v19];

  unint64_t v6 = v15;
  [v15 setObject:v25 forKeyedSubscript:v22];
  double v7 = v16;
  a3 = v31;
  if ([v15 count] != self->_batchSize)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v26 = [(MBDriveBackupEngine *)self _moveBatchWithPaths:v15];
  if (!v26)
  {
    [v15 removeAllObjects];
    goto LABEL_11;
  }
  id v28 = v26;

LABEL_17:

LABEL_19:

  return v28;
}

- (id)_moveBatchWithPaths:(id)a3
{
  id v4 = a3;
  unint64_t v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v33 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Moving batch of %lu items", buf, 0xCu);
    [v4 count];
    _MBLog();
  }

  drive = self->_drive;
  id v30 = 0;
  id v31 = 0;
  unsigned __int8 v7 = [(MBDrive *)drive moveItemsAtPaths:v4 options:0 results:&v31 error:&v30];
  id v8 = v31;
  id v9 = v30;
  id v10 = v9;
  id v11 = 0;
  if ((v7 & 1) == 0)
  {
    id v24 = v9;
    id v25 = v8;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = v8;
    id v13 = [v12 countByEnumeratingWithState:&v26 objects:v38 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          unsigned __int8 v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v18 = MBGetDefaultLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            id v19 = [v4 objectForKeyedSubscript:v17];
            id v20 = [v12 objectForKeyedSubscript:v17];
            *(_DWORD *)buf = 138412802;
            id v33 = v17;
            __int16 v34 = 2112;
            id v35 = v19;
            __int16 v36 = 2112;
            id v37 = v20;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error moving \"%@\" to \"%@\": %@", buf, 0x20u);

            id v21 = [v4 objectForKeyedSubscript:v17];
            unsigned int v23 = [v12 objectForKeyedSubscript:v17];
            _MBLog();
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v26 objects:v38 count:16];
      }
      while (v14);
    }

    id v10 = v24;
    id v11 = +[MBBackupHelper driveWriteError:v24 description:@"Error moving items from snapshot"];
    id v8 = v25;
  }

  return v11;
}

- (id)_removeWithOperationType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unint64_t v6 = [(MBBackupOperationJournal *)self->_operationJournal countForType:v3];
  unsigned __int8 v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v37 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Starting to remove %lu items", buf, 0xCu);
    unint64_t v32 = v6;
    _MBLog();
  }

  +[NSDate timeIntervalSinceReferenceDate];
  double v9 = v8;
  if ([(MBDebugContext *)self->super._debugContext isFlagSet:@"SimulateCrashBeforeRemoving"])goto LABEL_36; {
  id v10 = [(MBDriveBackupEngine *)self _removeInBatchesWithOperationType:v3];
  }
  if (v10)
  {
    id v11 = v10;
LABEL_6:
    id v12 = v11;
LABEL_7:
    id v13 = v11;
    goto LABEL_8;
  }
  if ([(MBDebugContext *)self->super._debugContext isFlagSet:@"SimulateCrashAfterRemoving"])LABEL_36:abort(); {
  uint64_t v15 = MBGetDefaultLog();
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Removing snapshot directory", buf, 2u);
    _MBLog();
  }

  drive = self->_drive;
  unsigned __int8 v17 = [(MBDriveBackupEngine *)self settingsContext];
  id v18 = [v17 driveSnapshotDir];
  id v35 = 0;
  unsigned __int8 v19 = [(MBDrive *)drive removeItemAtPath:v18 options:0 error:&v35];
  id v12 = v35;

  if (v19)
  {
    id v20 = v12;
  }
  else
  {
    if (!+[MBError isError:v12 withCode:4])
    {
      CFStringRef v31 = @"Error removing snapshot directory";
LABEL_35:
      +[MBBackupHelper driveWriteError:description:](MBBackupHelper, "driveWriteError:description:", v12, v31, v32);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }

    id v20 = 0;
  }
  if ([(MBDebugContext *)self->super._debugContext isFlagSet:@"SimulateCrashAfterRemovingSnapshot", v32])goto LABEL_36; {
  id v21 = MBGetDefaultLog();
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Removing old database index if it exists", buf, 2u);
    _MBLog();
  }

  SEL v22 = self->_drive;
  unsigned int v23 = [(MBDriveBackupEngine *)self settingsContext];
  id v24 = [v23 driveBackupDatabaseIndexPath];
  id v34 = v20;
  unsigned __int8 v25 = [(MBDrive *)v22 removeItemAtPath:v24 options:0 error:&v34];
  id v12 = v34;

  if (v25)
  {
    long long v26 = v12;
    goto LABEL_25;
  }
  if (!+[MBError isError:v12 withCode:4])
  {
    CFStringRef v31 = @"Error removing old database index";
    goto LABEL_35;
  }

  long long v26 = 0;
LABEL_25:
  long long v27 = MBGetDefaultLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Setting status to \"finished\"", buf, 2u);
    _MBLog();
  }

  id v33 = v26;
  unsigned __int8 v28 = [(MBDriveBackupEngine *)self _uploadStatusToDriveWithSnapshotState:3 error:&v33];
  id v12 = v33;

  if ((v28 & 1) == 0)
  {
    id v11 = v12;
    goto LABEL_6;
  }
  if ([(MBDebugContext *)self->super._debugContext isFlagSet:@"SimulateCrashAfterRemovingUploadingState"])goto LABEL_36; {
  long long v29 = MBGetDefaultLog();
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    +[NSDate timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 134218240;
    unint64_t v37 = v6;
    __int16 v38 = 2048;
    double v39 = v30 - v9;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Removed %lu items in %0.3f s", buf, 0x16u);
    +[NSDate timeIntervalSinceReferenceDate];
    _MBLog();
  }

  id v13 = 0;
LABEL_8:

  return v13;
}

- (id)_removeInBatchesWithOperationType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unint64_t v5 = +[NSMutableArray arrayWithCapacity:0];
  unint64_t v6 = [(MBBackupOperationJournal *)self->_operationJournal operationEnumeratorWithDomainManager:self->super._domainManager];
  uint64_t v8 = [v6 nextObject];
  if (v8)
  {
    double v9 = (void *)v8;
    unsigned __int8 v25 = v5;
    do
    {
      if ([v9 type] != v3) {
        goto LABEL_10;
      }
      id v10 = [v9 fileID];

      if (v10)
      {
        id v11 = [(MBDriveBackupEngine *)self settingsContext];
        id v12 = [v11 driveBackupDir];
        [v9 fileID];
        id v13 = self;
        v15 = uint64_t v14 = v3;
        [v15 filenameWithPrefix];
        v17 = id v16 = v6;
        id v18 = [v12 stringByAppendingPathComponent:v17];

        unint64_t v6 = v16;
        uint64_t v3 = v14;
        self = v13;
        unint64_t v5 = v25;

        if (!v18) {
          goto LABEL_13;
        }
      }
      else
      {
        id v18 = [v9 path];
        if (!v18)
        {
LABEL_13:
          +[NSAssertionHandler currentHandler];
          v21 = id v20 = v6;
          [v21 handleFailureInMethod:a2 object:self file:@"MBDriveBackupEngine.m" lineNumber:2275 description:@"No file ID or path for remove operation"];

          unint64_t v6 = v20;
        }
      }
      [v5 addObject:v18];
      if ([v5 count] == self->_batchSize)
      {
        unsigned __int8 v19 = [(MBDriveBackupEngine *)self _removeBatchWithPaths:v5];
        if (v19)
        {
          id v22 = v19;

          goto LABEL_19;
        }
        [v5 removeAllObjects];
      }

LABEL_10:
      double v9 = [v6 nextObject];
    }
    while (v9);
  }
  if ([v5 count])
  {
    id v22 = [(MBDriveBackupEngine *)self _removeBatchWithPaths:v5];
    if (!v22) {
      [v5 removeAllObjects];
    }
  }
  else
  {
    id v22 = 0;
  }
LABEL_19:

  return v22;
}

- (id)_removeBatchWithPaths:(id)a3
{
  id v4 = a3;
  unint64_t v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v32 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Removing batch of %lu items", buf, 0xCu);
    id v21 = [v4 count];
    _MBLog();
  }

  drive = self->_drive;
  id v29 = 0;
  id v30 = 0;
  unsigned __int8 v7 = [(MBDrive *)drive removeItemsAtPaths:v4 options:0 results:&v30 error:&v29];
  id v8 = v30;
  id v9 = v29;
  id v10 = 0;
  if ((v7 & 1) == 0)
  {
    if (+[MBError isError:v9 withCode:2])
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v11 = v8;
      id v12 = [v11 countByEnumeratingWithState:&v25 objects:v35 count:16];
      if (v12)
      {
        id v13 = v12;
        id v23 = v8;
        id v24 = v4;
        char v14 = 0;
        uint64_t v15 = *(void *)v26;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(v11);
            }
            unsigned __int8 v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            id v18 = [v11 objectForKeyedSubscript:v17, v21, v22];
            if ((+[MBError isError:v18 withCode:4] & 1) == 0)
            {
              unsigned __int8 v19 = MBGetDefaultLog();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                id v32 = v17;
                __int16 v33 = 2112;
                id v34 = v18;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error removing \"%@\": %@", buf, 0x16u);
                id v21 = v17;
                id v22 = v18;
                _MBLog();
              }

              char v14 = 1;
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v25 objects:v35 count:16];
        }
        while (v13);

        id v4 = v24;
        if (v14)
        {
          id v10 = +[MBBackupHelper driveWriteError:v9 description:@"Error removing files"];
        }
        else
        {
          id v10 = 0;
        }
        id v8 = v23;
      }
      else
      {

        id v10 = 0;
      }
    }
    else
    {
      id v10 = +[MBBackupHelper driveWriteError:v9 description:@"Error removing files"];
    }
  }

  return v10;
}

- (id)_removeDeviceSnapshot
{
  uint64_t v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Removing device snapshot directory", buf, 2u);
    _MBLog();
  }

  snapshotManifestDB = self->_snapshotManifestDB;
  if (snapshotManifestDB)
  {
    id v15 = 0;
    unsigned __int8 v5 = [(MBManifestDB *)snapshotManifestDB closeAndRemoveFileWithError:&v15];
    id v6 = v15;
    id v7 = v6;
    if (v5)
    {
      id v8 = self->_snapshotManifestDB;
      self->_snapshotManifestDB = 0;

LABEL_7:
      id v12 = 0;
      goto LABEL_10;
    }
    id v12 = v6;
    id v7 = v12;
  }
  else
  {
    id v9 = +[NSFileManager defaultManager];
    id v10 = [(MBDriveBackupEngine *)self _deviceSnapshotDir];
    id v14 = 0;
    unsigned __int8 v11 = [v9 removeItemAtPath:v10 error:&v14];
    id v7 = v14;

    if (v11) {
      goto LABEL_7;
    }
    id v12 = +[MBError errorWithCode:102 error:v7 format:@"Error cleaning up snapshot"];
  }
LABEL_10:

  return v12;
}

- (id)_removeOldBackup
{
  if (![(MBDriveBackupEngine *)self movedOldBackup]) {
    goto LABEL_6;
  }
  uint64_t v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(MBDriveBackupEngine *)self movedBackupName];
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Removing old backup %@", buf, 0xCu);

    id v9 = [(MBDriveBackupEngine *)self movedBackupName];
    _MBLog();
  }
  drive = self->_drive;
  id v6 = [(MBDriveBackupEngine *)self movedBackupName];
  id v10 = 0;
  LODWORD(drive) = [(MBDrive *)drive removeItemAtPath:v6 options:0 error:&v10];
  id v7 = v10;

  if (drive)
  {

LABEL_6:
    id v7 = 0;
  }

  return v7;
}

- (id)_verifyBackupReloadingManifest:(BOOL)a3
{
  BOOL v3 = a3;
  backupHelper = self->_backupHelper;
  id v54 = 0;
  id v6 = [(MBBackupHelper *)backupHelper readStatusWithError:&v54];
  id v7 = (__CFString *)v54;
  id v8 = v7;
  if (!v6)
  {
    id v14 = v7;
LABEL_15:
    id v8 = v14;
    id v13 = v14;
    goto LABEL_54;
  }
  [v6 version];
  double v10 = v9;
  unsigned __int8 v11 = MBGetDefaultLog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10 >= 3.3)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Verifying backup contents", buf, 2u);
      _MBLog();
    }

    if (self->_backupManifestDB) {
      BOOL v15 = !v3;
    }
    else {
      BOOL v15 = 0;
    }
    if (!v15)
    {
      id v16 = self->_backupHelper;
      uint64_t v53 = v8;
      unsigned __int8 v17 = [(MBBackupHelper *)v16 readBackupManifestDatabaseWithError:&v53];
      id v18 = v53;

      backupManifestDB = self->_backupManifestDB;
      self->_backupManifestDB = v17;

      if (v18)
      {
        id v14 = v18;
        goto LABEL_15;
      }
      id v8 = 0;
    }
    id v20 = v8;
    id v52 = v8;
    id v21 = +[MBKeychainManager fetchLocalBackupPasswordAndReturnError:&v52];
    id v8 = v52;

    if (+[MBError isError:v8 withCode:4])
    {

      id v8 = 0;
    }
    if ([(MBEngine *)self encrypted])
    {
      id v22 = self->_backupManifestDB;
      unint64_t v51 = v8;
      unsigned __int8 v23 = [(MBManifestDB *)v22 setupEncryptionWithPassword:v21 withError:&v51];
      id v24 = v51;

      if ((v23 & 1) == 0)
      {
        id v32 = MBGetDefaultLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v56 = v24;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to setup manifest encryption: %@", buf, 0xCu);
          _MBLog();
        }

        __int16 v33 = v24;
LABEL_51:
        id v8 = v33;
        goto LABEL_52;
      }
      id v8 = v24;
    }
    long long v25 = [(MBManifestDB *)self->_backupManifestDB properties];
    unsigned int v26 = [v25 encrypted];

    if (v26)
    {
      if (v21)
      {
        long long v27 = [(MBManifestDB *)self->_backupManifestDB properties];
        long long v28 = [v27 keybagData];

        if (v28)
        {
          unint64_t v50 = v8;
          id v29 = +[MBKeyBag unlockedKeyBagWithData:v28 password:v21 error:&v50];
          id v30 = v50;

          if (!v29)
          {
            id v8 = v30;

            id v13 = v8;
            goto LABEL_53;
          }
          id v8 = v30;
        }
        else
        {
          id v29 = 0;
        }

        goto LABEL_36;
      }
      CFStringRef v31 = @"Backup properties encrypted but no password set";
    }
    else
    {
      if (!v21)
      {
LABEL_36:
        id v34 = MBGetDefaultLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Getting contents of backup directory", buf, 2u);
          _MBLog();
        }

        id v35 = [(MBDriveBackupEngine *)self settingsContext];
        __int16 v36 = [v35 drive];
        unint64_t v37 = [(MBDriveBackupEngine *)self settingsContext];
        __int16 v38 = [v37 driveBackupDir];
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_10002F778;
        v49[3] = &unk_1000F1568;
        v49[4] = self;
        id v39 = [v36 enumerateContentsOfDirectoryAtPath:v38 options:0 foundItem:v49];

        if (!v8)
        {
          double v40 = self->_backupManifestDB;
          id v48 = 0;
          unsigned int v41 = [(MBManifestDB *)v40 hasUnverifiedFilesWithError:&v48];
          id v42 = (__CFString *)v48;
          id v8 = v42;
          if (v41)
          {
            if (!v42)
            {
              char v43 = MBGetDefaultLog();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Manifest references files that are not in the backup", buf, 2u);
                _MBLog();
              }

              id v13 = +[MBError errorWithCode:205 format:@"Manifest references files not in backup"];
              id v8 = 0;
              goto LABEL_53;
            }
          }
          else
          {
            id v44 = [(MBManifestDB *)self->_backupManifestDB unsetVerifiedFlags];
            double v45 = MBGetDefaultLog();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              if (v8) {
                CFStringRef v46 = v8;
              }
              else {
                CFStringRef v46 = @"clean";
              }
              *(_DWORD *)buf = 138412290;
              CFStringRef v56 = v46;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Finished verifying backup: %@", buf, 0xCu);
              _MBLog();
            }
          }
        }
        __int16 v33 = v8;
        goto LABEL_51;
      }
      CFStringRef v31 = @"Backup password set but properties not encrypted";
    }
    __int16 v33 = +[MBError errorWithCode:205 format:v31];
LABEL_52:
    id v13 = v33;
LABEL_53:

    goto LABEL_54;
  }
  if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Skipping verification of old format backup", buf, 2u);
    _MBLog();
  }

  id v13 = 0;
LABEL_54:

  return v13;
}

- (BOOL)_shouldRetry
{
  id v3 = [(NSMutableSet *)self->_modifiedDomains count];
  if (v3) {
    LOBYTE(v3) = self->_retryCount == 0;
  }
  return (char)v3;
}

- (BOOL)isFinalRetry
{
  return self->_retryCount == 1;
}

- (id)_retry
{
  ++self->_retryCount;
  -[MBDebugContext setInt:forName:](self->super._debugContext, "setInt:forName:");
  id v4 = MBGetDefaultLog();
  unsigned __int8 v5 = &selRef_setAccessibilityType_;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t retryCount = self->_retryCount;
    id v7 = [(NSMutableSet *)self->_modifiedDomains allObjects];
    id v8 = [v7 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 134218498;
    id v76 = retryCount;
    __int16 v77 = 1024;
    int v78 = 1;
    __int16 v79 = 2112;
    id v80 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Retrying backup (attempt %lu of %d, modified domains: {%@})", buf, 0x1Cu);

    unint64_t v9 = self->_retryCount;
    double v10 = [(NSMutableSet *)self->_modifiedDomains allObjects];
    [v10 componentsJoinedByString:@", "];
    v66 = uint64_t v64 = 1;
    unsigned __int8 v5 = &selRef_setAccessibilityType_;
    unint64_t v62 = v9;
    _MBLog();
  }
  [(MBProgress *)self->_progress current];
  -[MBProgress setTotal:](self->_progress, "setTotal:");
  unsigned __int8 v11 = [[MBDriveScript alloc] initWithProgress:self->_progress];
  driveScript = self->_driveScript;
  self->_driveScript = v11;

  id v13 = [MBProgressDrive alloc];
  id v14 = self->_driveScript;
  BOOL v15 = [(MBDriveBackupEngine *)self settingsContext];
  id v16 = [v15 drive];
  unsigned __int8 v17 = [(MBProgressDrive *)v13 initWithScript:v14 delegate:v16];
  drive = self->_drive;
  self->_drive = v17;

  snapshotManifestDB = self->_snapshotManifestDB;
  if (!snapshotManifestDB)
  {
    double v45 = [(MBDriveBackupEngine *)self _deviceSnapshotPropertiesPath];
    id v74 = 0;
    CFStringRef v46 = +[MBProperties propertiesWithFile:v45 error:&v74];
    id v47 = v74;

    if (v46)
    {
      id v48 = [MBManifestDB alloc];
      uint64_t v49 = [(MBDriveBackupEngine *)self _deviceSnapshotManifestDatabasePath];
      unint64_t v50 = [(MBManifestDB *)v48 initWithPath:v49 properties:v46 domainManager:self->super._domainManager];
      unint64_t v51 = self->_snapshotManifestDB;
      self->_snapshotManifestDB = v50;

      id v52 = self->_snapshotManifestDB;
      long long v73 = v47;
      LOBYTE(v49) = [(MBManifestDB *)v52 openWithError:&v73];
      id v20 = v73;

      if ((v49 & 1) == 0)
      {
        uint64_t v58 = self->_snapshotManifestDB;
        self->_snapshotManifestDB = 0;

        uint64_t v59 = +[MBError errorWithCode:101 format:@"Error opening snapshot manifest database from device"];
LABEL_52:
        uint64_t v43 = (uint64_t)v59;

        goto LABEL_53;
      }
      if (![(MBEngine *)self encrypted])
      {
        long long v68 = v3;
        goto LABEL_45;
      }
      uint64_t v53 = self->_snapshotManifestDB;
      id v54 = [(MBDriveBackupEngine *)self password];
      unsigned int v72 = v20;
      unsigned __int8 v55 = [(MBManifestDB *)v53 setupEncryptionWithPassword:v54 withError:&v72];
      id v47 = v72;

      if (v55)
      {
        long long v68 = v3;
        id v20 = v47;
        unsigned __int8 v5 = &selRef_setAccessibilityType_;
LABEL_45:

        snapshotManifestDB = self->_snapshotManifestDB;
        goto LABEL_5;
      }
      uint64_t v57 = MBGetDefaultLog();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v76 = v47;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Failed to setup manifest encryption: %@", buf, 0xCu);
        goto LABEL_50;
      }
    }
    else
    {
      if ((+[MBError isError:v47 withCode:4] & 1) != 0
        || +[MBError codeForNSError:v47] == 4)
      {
        CFStringRef v56 = MBGetDefaultLog();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "Snapshot properties not found", buf, 2u);
          _MBLog();
        }

        uint64_t v57 = v47;
        id v47 = 0;
        goto LABEL_51;
      }
      uint64_t v57 = MBGetDefaultLog();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v76 = v47;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Error reading snapshot properties from device: %@", buf, 0xCu);
LABEL_50:
        _MBLog();
      }
    }
LABEL_51:

    uint64_t v59 = v47;
    id v20 = v59;
    goto LABEL_52;
  }
  long long v68 = v3;
  id v20 = 0;
LABEL_5:
  id v21 = [(MBManifestDB *)snapshotManifestDB properties];
  [v21 removeAllContainers];

  id v22 = [(MBManifestDB *)self->_snapshotManifestDB properties];
  unsigned __int8 v23 = [(MBAppManager *)self->super._appManager allContainers];
  [v22 addContainersFromArray:v23];

  id obj = +[MBBackupOperationJournal backupOperationJournalWithBatchSize:self->_batchSize];
  p_operationJournal = &self->_operationJournal;
  id v24 = [(MBBackupOperationJournal *)self->_operationJournal operationEnumeratorWithDomainManager:self->super._domainManager];
  uint64_t v26 = [v24 nextObject];
  if (v26)
  {
    long long v27 = (void *)v26;
    while (1)
    {
      long long v28 = [v27 fileID:v63, v65];
      id v29 = [v27 domain];
      if (!v29
        || ![*(id *)((char *)&self->super.super.isa + *((int *)v5 + 804)) containsObject:v29])
      {
        if ([v27 type] != 2) {
          [obj addOperation:v27];
        }
        goto LABEL_22;
      }
      id v30 = self->_snapshotManifestDB;
      long long v71 = v20;
      unsigned __int8 v31 = [(MBManifestDB *)v30 flagsForFileID:v28 error:&v71];
      id v32 = v71;

      if (v32)
      {
        id v44 = v32;

        int v42 = 0;
        uint64_t v43 = (uint64_t)v44;
        goto LABEL_40;
      }
      if ([v27 type] != 2) {
        break;
      }
      unsigned __int8 v5 = &selRef_setAccessibilityType_;
      if (v28) {
        goto LABEL_17;
      }
LABEL_21:
      id v20 = 0;
LABEL_22:

      long long v27 = [v24 nextObject];
      if (!v27) {
        goto LABEL_23;
      }
    }
    id v20 = 0;
    unsigned __int8 v5 = &selRef_setAccessibilityType_;
    if ([v27 type] != 3 || !v28) {
      goto LABEL_22;
    }
LABEL_17:
    if ((v31 & 0x10) == 0)
    {
      __int16 v33 = MBGetDefaultLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v34 = [v27 type];
        *(_DWORD *)buf = 138412546;
        id v76 = v28;
        __int16 v77 = 1024;
        int v78 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "Already uploaded: %@ (operation: %d)", buf, 0x12u);
        id v63 = v28;
        id v65 = [v27 type];
        _MBLog();
      }

      id v35 = [(MBManifestDB *)self->_snapshotManifestDB setFlags:200 mask:-17 forFileID:v28];
    }
    goto LABEL_21;
  }
LABEL_23:
  [(MBBackupOperationJournal *)*p_operationJournal close];
  objc_storeStrong((id *)p_operationJournal, obj);
  uint64_t v36 = *((int *)v5 + 804);
  objc_storeStrong((id *)&self->_domainsToScan, *(id *)((char *)&self->super.super.isa + v36));
  unint64_t v37 = (objc_class *)objc_alloc_init((Class)NSMutableSet);
  __int16 v38 = *(Class *)((char *)&self->super.super.isa + v36);
  *(Class *)((char *)&self->super.super.isa + v36) = v37;

  id v39 = MBGetDefaultLog();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Refreshing installed apps", buf, 2u);
    _MBLog();
  }

  appManager = self->super._appManager;
  unsigned int v41 = [(MBEngine *)self persona];
  dispatch_semaphore_t v70 = v20;
  int v42 = 1;
  uint64_t v43 = [(MBAppManager *)appManager loadAppsWithPersona:v41 safeHarbors:1 error:&v70];
  id v44 = v70;

  if ((v43 & 1) == 0)
  {
    uint64_t v43 = +[MBError errorWithCode:1 error:v44 format:@"Error loading apps"];
    int v42 = 0;
  }
LABEL_40:

  if (v42)
  {
    int v60 = [(MBDebugContext *)self->super._debugContext intForName:@"SimulateCrashAfterRetrying"];
    if (v60 >= 1 && self->_retryCount >= v60) {
      abort();
    }
    uint64_t v43 = 0;
  }
LABEL_53:

  return (id)v43;
}

- (int)engineMode
{
  return 1;
}

- (id)properties
{
  return [(MBManifestDB *)self->_snapshotManifestDB properties];
}

- (id)_deviceSnapshotDir
{
  if (!self->_uuid)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MBDriveBackupEngine.m" lineNumber:2594 description:@"UUID not initialized"];
  }
  id v3 = [(MBDriveBackupEngine *)self settingsContext];
  id v4 = [v3 deviceCacheDir];
  unsigned __int8 v5 = [v4 stringByAppendingPathComponent:self->_uuid];

  return v5;
}

- (id)_deviceSnapshotPropertiesPath
{
  v2 = [(MBDriveBackupEngine *)self _deviceSnapshotDir];
  id v3 = [v2 stringByAppendingPathComponent:@"Manifest.plist"];

  return v3;
}

- (id)_deviceSnapshotManifestDatabasePath
{
  v2 = [(MBDriveBackupEngine *)self _deviceSnapshotDir];
  id v3 = [v2 stringByAppendingPathComponent:@"Manifest.db"];

  return v3;
}

- (id)_fileHandleWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  if ([(MBEngine *)self encrypted])
  {
    unsigned __int8 v11 = [(MBDriveBackupEngine *)self settingsContext];
    BOOL v12 = [v11 keybag];
    id v13 = +[MBEncryptedFileHandle encryptedFileHandleForBackupWithPath:v10 keybag:v12 error:a6];
  }
  else
  {
    id v13 = +[MBBasicFileHandle basicFileHandleWithPath:v10 flags:v8 mode:v7 error:a6];
  }

  return v13;
}

- (id)_compactSQLiteDatabaseAtPath:(id)a3 file:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    sub_100099314();
  }
  id v10 = v9;
  if (!v9) {
    sub_100099340();
  }
  if (!a5) {
    sub_10009936C();
  }
  if ([(MBEngine *)self isDeviceTransferEngine])
  {
    unsigned __int8 v11 = 0;
  }
  else
  {
    unsigned __int8 v11 = MBTemporaryPath();
    BOOL v12 = objc_opt_class();
    objc_sync_enter(v12);
    unsigned __int8 v13 = +[MBSQLiteFileHandle compactSQLiteDatabaseAtPath:v8 toPath:v11 error:a5];
    objc_sync_exit(v12);

    id v14 = v11;
    if (v13)
    {
LABEL_8:
      id v14 = v14;
      unsigned __int8 v17 = v14;
      goto LABEL_10;
    }
  }
  MBTemporaryPath();
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v15 = objc_opt_class();
  objc_sync_enter(v15);
  unsigned int v16 = +[MBSQLiteFileHandle copySQLiteFileAtPath:v8 toPath:v14 error:a5];
  objc_sync_exit(v15);

  if (v16) {
    goto LABEL_8;
  }
  unsigned __int8 v17 = 0;
LABEL_10:

  return v17;
}

- (id)fileHandleWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  uint64_t v6 = a5;
  uint64_t v7 = *(void *)&a4;
  id v10 = a3;
  unsigned __int8 v11 = self;
  objc_sync_enter(v11);
  uploadOperationsByPath = v11->_uploadOperationsByPath;
  id v13 = v10;
  id v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v13 fileSystemRepresentation]);
  BOOL v15 = [(NSMutableDictionary *)uploadOperationsByPath objectForKeyedSubscript:v14];

  objc_sync_exit(v11);
  if (!v15)
  {
    id v47 = +[NSAssertionHandler currentHandler];
    [v47 handleFailureInMethod:a2, v11, @"MBDriveBackupEngine.m", 2652, @"No operation found for path: %@", v13 object file lineNumber description];
  }
  unsigned int v16 = [v15 domain];
  id v54 = [v16 volumeMountPoint];
  unsigned __int8 v17 = [(MBDriveBackupEngine *)v11 mountedSnapshotTracker];
  id v18 = [v17 snapshotMountPointForVolumeMountPoint:v54];

  if (!v18) {
    sub_100099398();
  }
  unsigned int v19 = [v13 hasPrefix:v18];
  id v20 = [v16 rootPath];
  id v21 = v20;
  if (v19)
  {
    id v22 = MBSnapshotPathFromLivePath();

    unsigned __int8 v23 = [v13 substringFromIndex:[v22 length] + 1];
    id v24 = +[MBFile fileWithDomain:v16 snapshotPath:v18 relativePath:v23];
  }
  else
  {
    id v22 = [v13 substringFromIndex:([v20 length] + 1)];

    id v24 = +[MBFile fileWithDomain:v16 snapshotPath:0 relativePath:v22];
  }

  if (!v24) {
    sub_1000993C4();
  }
  long long v25 = [(MBDriveBackupEngine *)v11 _fileHandleWithPath:v13 flags:v7 mode:v6 error:a6];
  if (!v25)
  {
    unsigned __int8 v31 = 0;
    goto LABEL_20;
  }
  if ([(MBDriveBackupEngine *)v11 isFinalRetry]
    || ([v25 path],
        uint64_t v26 = objc_claimAutoreleasedReturnValue(),
        BOOL v27 = sub_10007B598(v26),
        v26,
        v27))
  {
    long long v28 = 0;
    goto LABEL_12;
  }
  char v58 = 0;
  id v57 = 0;
  unsigned int v33 = +[MBSQLiteFileHandle isSQLiteFileHandle:v25 result:&v58 error:&v57];
  id v34 = v57;
  long long v28 = v34;
  if (!v33)
  {
    if (a6) {
      *a6 = v34;
    }
    [v25 closeWithError:0];
    goto LABEL_36;
  }
  if (!v58) {
    goto LABEL_12;
  }
  id v56 = v34;
  id v52 = [(MBDriveBackupEngine *)v11 _compactSQLiteDatabaseAtPath:v13 file:v24 error:&v56];
  id v51 = v56;

  if (!v52)
  {
    double v40 = MBGetDefaultLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      unsigned int v41 = [v24 absolutePath];
      int v42 = [v24 fileID];
      *(_DWORD *)buf = 138412802;
      int v60 = v41;
      __int16 v61 = 2112;
      unint64_t v62 = v42;
      __int16 v63 = 2112;
      id v64 = v51;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Failed to compact/copy SQLite database at %@ (%@): %@", buf, 0x20u);

      uint64_t v43 = [v24 absolutePath];
      uint64_t v49 = [v24 fileID];
      id v50 = v51;
      id v48 = v43;
      _MBLog();
    }
    [(MBDriveBackupEngine *)v11 fileModifiedWhileUploadingFile:v24 reason:@"Couldn't compact SQLite file"];
    if (a6)
    {
      *a6 = +[MBError errorWithCode:9 path:v13 format:@"Couldn't compact SQLite file"];
    }
    [v25 closeWithError:0, v48, v49, v50];
    long long v28 = v51;
    goto LABEL_36;
  }
  id v35 = [(MBDriveBackupEngine *)v11 settingsContext];
  uint64_t v36 = [v35 plugins];
  unint64_t v37 = [v36 objectEnumerator];

  __int16 v38 = sub_10003F45C(v11, v37, "backingUpSQLiteFileCopyAtPath:temporaryPath:", (uint64_t)v13, (uint64_t)v52);

  if (v38)
  {
    [v25 closeWithError:0];
    id v39 = +[NSFileManager defaultManager];
    [v39 removeItemAtPath:v52 error:0];

    if (a6) {
      *a6 = v38;
    }

    long long v28 = v38;
    goto LABEL_36;
  }
  id v44 = [(MBDriveBackupEngine *)v11 _fileHandleWithPath:v52 flags:256 mode:0 error:a6];
  if (!v44)
  {
    [v25 closeWithError:0];
    CFStringRef v46 = +[NSFileManager defaultManager];
    [v46 removeItemAtPath:v52 error:0];

    long long v28 = v52;
LABEL_36:

    unsigned __int8 v31 = 0;
    goto LABEL_19;
  }
  [(MBDebugContext *)v11->super._debugContext setFlag:@"CopiedSQLiteFile"];
  uint64_t v45 = +[MBSQLiteFileHandle SQLiteFileHandleWithOriginalFileHandle:v25 copiedFileHandle:v44];

  long long v28 = 0;
  unsigned __int8 v31 = 0;
  long long v25 = (void *)v45;
  if (v45)
  {
LABEL_12:
    if ([(MBEngine *)v11 encrypted])
    {
      id v55 = v28;
      id v29 = [v25 encryptionKeyWithError:&v55];
      id v30 = v55;

      if (!v29)
      {
        if (a6)
        {
          *a6 = +[MBError errorWithCode:100, v30, @"Error getting encryption key for file: %@", v13 error format];
        }
        [v25 closeWithError:0];

        unsigned __int8 v31 = 0;
        goto LABEL_18;
      }
      [v24 setEncryptionKey:v29];
    }
    else
    {
      id v30 = v28;
    }
    unsigned __int8 v31 = [[MBBackupFileHandle alloc] initWithEngine:v11 fileHandle:v25 file:v24];

LABEL_18:
    long long v25 = v30;
LABEL_19:
  }
LABEL_20:

  return v31;
}

- (BOOL)_uploadStatusToDriveWithSnapshotState:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  unsigned int v7 = [(MBStatus *)self->_status backupState];
  if (!v5 || v7 == 2) {
    uint64_t v8 = [(MBStatus *)self->_status backupState];
  }
  else {
    uint64_t v8 = 2;
  }
  BOOL v10 = v5 != 3 && self->_fullBackup;
  unsigned __int8 v11 = +[MBStatus status];
  [v11 setUuid:self->_uuid];
  [v11 setBackupState:v8];
  [v11 setSnapshotState:v5];
  BOOL v12 = +[NSDate date];
  [v11 setDate:v12];

  [v11 setFullBackup:v10];
  id v13 = MBGetDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Writing status to drive: %@", buf, 0xCu);
    _MBLog();
  }

  drive = self->_drive;
  BOOL v15 = [(MBDriveBackupEngine *)self settingsContext];
  unsigned int v16 = [v15 driveBackupStatusPath];
  unsigned int v17 = [v11 writeToDrive:drive path:v16 error:a4];

  if (v17)
  {
    debugContext = self->super._debugContext;
    unsigned int v19 = +[MBStatus stringWithSnapshotState:v5];
    [(MBDebugContext *)debugContext setValue:v19 forName:@"LastStatusWrittenName"];
  }
  else if (a4)
  {
    *a4 = +[MBBackupHelper driveWriteError:*a4 description:@"Error writing status"];
  }

  return v17;
}

- (BOOL)isModifiedSince:(int64_t)a3 reason:(id *)a4
{
  int64_t maximumModificationTime = self->_maximumModificationTime;
  if (maximumModificationTime) {
    BOOL v5 = maximumModificationTime < a3;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5 || time(0) < a3) {
    return 0;
  }
  if (a4) {
    *a4 = @"mod time changed";
  }
  return 1;
}

- (BOOL)_isModifiedWithFileDescriptor:(int)a3 reason:(id *)a4
{
  memset(&v9, 0, sizeof(v9));
  if (!fstat(a3, &v9)) {
    return [(MBDriveBackupEngine *)self isModifiedSince:v9.st_mtimespec.tv_sec reason:a4];
  }
  uint64_t v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = *__error();
    *(_DWORD *)buf = 67109120;
    int v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error stat'ing file descriptor: %{errno}d", buf, 8u);
    __error();
    _MBLog();
  }

  return 0;
}

- (id)_addBackupPathsNotInManifestDB:(id)a3 operationType:(int)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  BOOL v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_100029794;
  id v30 = sub_1000297A4;
  id v31 = 0;
  int v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Searching backup contents for removed regular files", buf, 2u);
    _MBLog();
  }

  uint64_t v8 = [(MBDriveBackupEngine *)self settingsContext];
  stat v9 = [v8 drive];
  BOOL v10 = [(MBDriveBackupEngine *)self settingsContext];
  int v11 = [v10 driveBackupDir];
  unsigned int v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  unsigned int v19 = sub_1000312F4;
  id v20 = &unk_1000F1680;
  id v21 = self;
  id v12 = v6;
  id v22 = v12;
  unsigned __int8 v23 = &v26;
  int v24 = a4;
  id v13 = [v9 enumerateContentsOfDirectoryAtPath:v11 options:0 foundItem:&v17];

  if (+[MBError isError:withCode:](MBError, "isError:withCode:", v13, 4, v17, v18, v19, v20, v21))
  {
    id v14 = 0;
  }
  else
  {
    BOOL v15 = (void *)v27[5];
    if (!v15) {
      BOOL v15 = v13;
    }
    id v14 = v15;
  }

  _Block_object_dispose(&v26, 8);

  return v14;
}

- (BOOL)cancel
{
  v6.receiver = self;
  v6.super_class = (Class)MBDriveBackupEngine;
  BOOL v3 = [(MBEngine *)&v6 cancel];
  if (!v3)
  {
    id v4 = [(MBDriveBackupEngine *)self scanner];
    [v4 cancel];
  }
  return v3;
}

- (int)engineType
{
  return self->_engineType;
}

- (void)setEngineType:(int)a3
{
  self->_engineType = a3;
}

- (MBManifestDB)backupManifestDB
{
  return self->_backupManifestDB;
}

- (MBManifestDB)snapshotManifestDB
{
  return self->_snapshotManifestDB;
}

- (MBProgress)progress
{
  return self->_progress;
}

- (int64_t)maximumModificationTime
{
  return self->_maximumModificationTime;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_unint64_t batchSize = a3;
}

- (unint64_t)concurrentUploadBatchCount
{
  return self->_concurrentUploadBatchCount;
}

- (void)setConcurrentUploadBatchCount:(unint64_t)a3
{
  self->_unint64_t concurrentUploadBatchCount = a3;
}

- (unint64_t)uploadSize
{
  return self->_uploadSize;
}

- (void)setUploadSize:(unint64_t)a3
{
  self->_uploadSize = a3;
}

- (unint64_t)uploadFileCount
{
  return self->_uploadFileCount;
}

- (void)setUploadFileCount:(unint64_t)a3
{
  self->_uploadFileCount = a3;
}

- (unint64_t)uploadSizeExcludingHardlinksAndClones
{
  return self->_uploadSizeExcludingHardlinksAndClones;
}

- (void)setUploadSizeExcludingHardlinksAndClones:(unint64_t)a3
{
  self->_uploadSizeExcludingHardlinksAndClones = a3;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (BOOL)movedOldBackup
{
  return self->_movedOldBackup;
}

- (void)setMovedOldBackup:(BOOL)a3
{
  self->_movedOldBackup = a3;
}

- (NSString)movedBackupName
{
  return self->_movedBackupName;
}

- (void)setMovedBackupName:(id)a3
{
}

- (void)setPrefixDirectories:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (MBFileScanner)scanner
{
  return (MBFileScanner *)objc_getProperty(self, a2, 296, 1);
}

- (void)setScanner:(id)a3
{
}

- (MBMountedSnapshotTracker)mountedSnapshotTracker
{
  return self->_mountedSnapshotTracker;
}

- (void)setMountedSnapshotTracker:(id)a3
{
}

- (NSMutableSet)inodeCache
{
  return self->_inodeCache;
}

- (void)setInodeCache:(id)a3
{
}

- (NSMutableSet)cloneIDCache
{
  return self->_cloneIDCache;
}

- (void)setCloneIDCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloneIDCache, 0);
  objc_storeStrong((id *)&self->_inodeCache, 0);
  objc_storeStrong((id *)&self->_mountedSnapshotTracker, 0);
  objc_storeStrong((id *)&self->_scanner, 0);
  objc_storeStrong((id *)&self->_prefixDirectories, 0);
  objc_storeStrong((id *)&self->_movedBackupName, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_uploadOperationsByPath, 0);
  objc_storeStrong((id *)&self->_modifiedDomains, 0);
  objc_storeStrong((id *)&self->_operationJournal, 0);
  objc_storeStrong((id *)&self->_domainsToScan, 0);
  objc_storeStrong((id *)&self->_snapshotManifestDB, 0);
  objc_storeStrong((id *)&self->_backupManifestDB, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_backupHelper, 0);
  objc_storeStrong((id *)&self->_drive, 0);

  objc_storeStrong((id *)&self->_driveScript, 0);
}

@end