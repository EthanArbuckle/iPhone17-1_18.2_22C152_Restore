@interface MBCKBackupEngine
+ (BOOL)_shouldRemoveSnapshotAfterError:(id)a3;
+ (BOOL)_startOTABackupWithAccount:(id)a3 error:(id *)a4;
+ (BOOL)_stopOTABackupWithAccount:(id)a3 error:(id *)a4;
- (BOOL)_handleSkippedFilesWithError:(id *)a3;
- (BOOL)_loadDomainsFromVolumesToBackUpWithError:(id *)a3;
- (BOOL)_mountSnapshotsWithError:(id *)a3;
- (BOOL)_notifyPluginsOfBackupEnded:(id)a3 error:(id *)a4;
- (BOOL)_shouldBackupUsingFSEvents;
- (BOOL)_shouldSimulateCancelationForState:(id)a3;
- (BOOL)_updateDomainListInPendingSnapshotDatabase:(id *)a3;
- (BOOL)_verifySnapshotWithError:(id *)a3;
- (BOOL)cancel;
- (BOOL)cancelWithError:(id)a3;
- (BOOL)checkIfBackupHasKeybagWithUUID:(id)a3;
- (BOOL)commitSnapshotWithError:(id *)a3;
- (BOOL)createVolumeSnapshots:(id *)a3;
- (BOOL)fileScanner:(id)a3 failedToStatFile:(id)a4 withErrno:(int)a5;
- (BOOL)fileScanner:(id)a3 isFileAddedOrModified:(id)a4;
- (BOOL)findChangesWithError:(id *)a3;
- (BOOL)finishBackupWithError:(id *)a3;
- (BOOL)prepareToUploadChangesWithError:(id *)a3;
- (BOOL)reserveQuotaWithError:(id *)a3;
- (BOOL)runWithError:(id *)a3;
- (BOOL)setUpWithError:(id *)a3;
- (BOOL)shouldCancelTranscription;
- (BOOL)shouldCancelVerification;
- (BOOL)synchronizeFileListsWithError:(id *)a3;
- (BOOL)uploadAssetsWithError:(id *)a3;
- (BOOL)uploadChangesWithError:(id *)a3;
- (BOOL)uploadDomainRecords:(id *)a3;
- (BYBuddyDaemonCloudSyncClient)cloudSyncClient;
- (MBBackupAttemptSummary)attemptSummary;
- (MBBackupLifecyclePluginNotifier)pluginNotifier;
- (MBBackupTelemetry)telemetry;
- (MBCKBackupEngine)initWithReason:(int64_t)a3 settingsContext:(id)a4 debugContext:(id)a5 serviceManager:(id)a6;
- (MBCKBackupEngine)initWithReason:(int64_t)a3 settingsContext:(id)a4 debugContext:(id)a5 serviceManager:(id)a6 domainManager:(id)a7;
- (MBCKSnapshot)currentSnapshot;
- (MBCKSnapshot)previousSnapshot;
- (MBCacheDeleteRequest)cacheDeleteRequest;
- (MBDurationEstimation)estimator;
- (MBFSEventState)nextBackupFSEventState;
- (MBMountedSnapshotTracker)mountedSnapshotTracker;
- (MBPendingSnapshotDB)pendingSnapshotDatabase;
- (MBSkippedFileTracker)skippedFileTracker;
- (NSDate)lastWatchdogResume;
- (NSString)backupStateDescription;
- (NSString)description;
- (NSString)pendingSnapshotID;
- (__MKBAssertion)lockAssertionRef;
- (id)_createDomainTranscriberForAPFSSnapshots:(id)a3 error:(id *)a4;
- (id)_fetchPreviousBackupFSEventState;
- (id)fileScanner:(id)a3 didFindFile:(id)a4;
- (id)powerAssertionName;
- (int)engineMode;
- (int64_t)_snapshotFormatForAccount:(id)a3 error:(id *)a4;
- (int64_t)backupReason;
- (int64_t)cameraRollBackupState;
- (int64_t)snapshotFormat;
- (int64_t)snapshotType;
- (unint64_t)_scannerMode;
- (unint64_t)backupState;
- (unint64_t)totalSize;
- (void)_clearPendingSnapshotAfterQuotaExceededError;
- (void)_finishCollectingTelemetry;
- (void)_handleStateTransition;
- (void)_releaseLockAssertion;
- (void)_saveLastPendingSnapshotSize:(unint64_t)a3;
- (void)_saveNextBackupFSEventState;
- (void)_sendTelemetryForStateChange:(unint64_t)a3 start:(id)a4 end:(id)a5;
- (void)_tearDown;
- (void)_unmountSnapshotsAndRemoveThem:(BOOL)a3;
- (void)cleanUpAfterError:(id)a3;
- (void)dealloc;
- (void)makeStateTransition;
- (void)resumeWatchdogIfNeeded;
- (void)sendEngineCompletionTelemetry:(id)a3 duration:(double)a4 peakMemoryUsage:(unint64_t)a5;
- (void)setBackupReason:(int64_t)a3;
- (void)setBackupState:(unint64_t)a3;
- (void)setBackupStateDescription:(id)a3;
- (void)setCacheDeleteRequest:(id)a3;
- (void)setCameraRollBackupState:(int64_t)a3;
- (void)setCloudSyncClient:(id)a3;
- (void)setCurrentSnapshot:(id)a3;
- (void)setEstimator:(id)a3;
- (void)setLastWatchdogResume:(id)a3;
- (void)setLockAssertionRef:(__MKBAssertion *)a3;
- (void)setMountedSnapshotTracker:(id)a3;
- (void)setNextBackupFSEventState:(id)a3;
- (void)setPendingSnapshotDatabase:(id)a3;
- (void)setPluginNotifier:(id)a3;
- (void)setPreviousSnapshot:(id)a3;
- (void)setSkippedFileTracker:(id)a3;
- (void)setSnapshotFormat:(int64_t)a3;
- (void)setSnapshotType:(int64_t)a3;
- (void)setTotalSize:(unint64_t)a3;
- (void)syncCompletedWithErrors:(id)a3;
- (void)syncProgress:(double)a3;
@end

@implementation MBCKBackupEngine

- (MBCKBackupEngine)initWithReason:(int64_t)a3 settingsContext:(id)a4 debugContext:(id)a5 serviceManager:(id)a6 domainManager:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [v12 account];
  if (!v16) {
    __assert_rtn("-[MBCKBackupEngine initWithReason:settingsContext:debugContext:serviceManager:domainManager:]", "MBCKBackupEngine.m", 138, "account");
  }
  v17 = (void *)v16;
  v29.receiver = self;
  v29.super_class = (Class)MBCKBackupEngine;
  v18 = [(MBCKEngine *)&v29 initWithSettingsContext:v12 debugContext:v13 domainManager:v15];
  v19 = v18;
  if (v18)
  {
    [(MBCKEngine *)v18 setServiceManager:v14];
    [(MBCKBackupEngine *)v19 setBackupState:1];
    v19->_backupReason = a3;
    v19->_snapshotType = -1;
    v20 = objc_alloc_init(MBCKProperties);
    [(MBCKEngine *)v19 setProperties:v20];

    v19->_lockAssertionRef = 0;
    v21 = objc_opt_new();
    [(MBCKBackupEngine *)v19 setEstimator:v21];

    v22 = [[MBBackupLifecyclePluginNotifier alloc] initWithEngine:v19];
    pluginNotifier = v19->_pluginNotifier;
    v19->_pluginNotifier = v22;

    uint64_t v24 = objc_opt_new();
    attemptSummary = v19->_attemptSummary;
    v19->_attemptSummary = (MBBackupAttemptSummary *)v24;

    uint64_t v26 = objc_opt_new();
    telemetry = v19->_telemetry;
    v19->_telemetry = (MBBackupTelemetry *)v26;
  }
  return v19;
}

- (MBCKBackupEngine)initWithReason:(int64_t)a3 settingsContext:(id)a4 debugContext:(id)a5 serviceManager:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v10 account];
  if (!v13) {
    __assert_rtn("-[MBCKBackupEngine initWithReason:settingsContext:debugContext:serviceManager:]", "MBCKBackupEngine.m", 157, "account");
  }
  id v14 = (void *)v13;
  id v15 = objc_alloc((Class)MBDomainManager);
  uint64_t v16 = [v14 persona];
  id v17 = [v15 initWithPersona:v16];

  v18 = [(MBCKBackupEngine *)self initWithReason:a3 settingsContext:v10 debugContext:v11 serviceManager:v12 domainManager:v17];
  return v18;
}

- (void)dealloc
{
  [(MBCKBackupEngine *)self _releaseLockAssertion];
  [(MBCKBackupEngine *)self _unmountSnapshotsAndRemoveThem:1];
  v3 = [(MBCKBackupEngine *)self pendingSnapshotDatabase];
  [v3 close:0];

  v4.receiver = self;
  v4.super_class = (Class)MBCKBackupEngine;
  [(MBCKEngine *)&v4 dealloc];
}

- (void)_releaseLockAssertion
{
  lockAssertionRef = self->_lockAssertionRef;
  self->_lockAssertionRef = 0;
  if (lockAssertionRef) {
    +[MBKeyBag releaseLockAssertion:](MBKeyBag, "releaseLockAssertion:");
  }
}

- (void)setBackupState:(unint64_t)a3
{
  self->_backupState = a3;
  MBCKStringForBackupState();
  self->_backupStateDescription = (NSString *)objc_claimAutoreleasedReturnValue();
  _objc_release_x1();
}

- (int)engineMode
{
  return 1;
}

- (id)powerAssertionName
{
  if (MBBackupReasonIsManual()) {
    return @"backup-manual";
  }
  if (MBBackupReasonIsScheduled()) {
    return @"backup-scheduled";
  }
  return @"backup";
}

- (BOOL)cancelWithError:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MBCKBackupEngine;
  BOOL v4 = [(MBCKEngine *)&v7 cancelWithError:a3];
  if (!v4)
  {
    v5 = [(MBCKBackupEngine *)self cacheDeleteRequest];
    [v5 cancel];
  }
  return v4;
}

- (BOOL)cancel
{
  return [(MBCKBackupEngine *)self cancelWithError:0];
}

- (void)_clearPendingSnapshotAfterQuotaExceededError
{
  v3 = [(MBCKEngine *)self device];
  BOOL v4 = v3;
  if (v3)
  {
    v5 = [v3 pendingSnapshotRecordID];
    v6 = +[MBCKSnapshot snapshotIDFromSnapshotRecordID:v5];

    objc_super v7 = [(MBCKEngine *)self cache];
    id v23 = 0;
    unsigned int v8 = [v7 hasPendingBackupContents:&v23];
    id v9 = v23;

    [v4 pendingSnapshotFormat];
    int v10 = MBSnapshotFormatContainsFileLists();
    if (v10 && v6)
    {
      id v11 = [(MBCKEngine *)self persona];
      id v12 = [v11 snapshotDatabaseDirectory];
      unsigned int v13 = MBSnapshotDirectoryExists(v12, v6);

      if (((v13 | v8) & 1) == 0) {
        goto LABEL_5;
      }
    }
    else if ((v8 & 1) == 0)
    {
LABEL_5:
      id v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Not deleting the pending snapshot because no local contents exist", buf, 2u);
        _MBLog();
      }
      goto LABEL_20;
    }
    [v4 clearPendingSnapshotAndRebuildFileChanges:1];
    id v14 = [(MBCKEngine *)self ckOperationTracker];
    if (!v14)
    {
LABEL_20:

      goto LABEL_21;
    }
    id v22 = v9;
    unsigned __int8 v15 = [v4 saveWithOperationTracker:v14 error:&v22];
    id v16 = v22;

    if (v15)
    {
      if (!v10)
      {
LABEL_19:
        id v9 = v16;
        goto LABEL_20;
      }
      if (!v6) {
        __assert_rtn("-[MBCKBackupEngine _clearPendingSnapshotAfterQuotaExceededError]", "MBCKBackupEngine.m", 248, "pendingSnapshotCommitID");
      }
      id v17 = [(MBCKEngine *)self persona];
      v18 = [v17 snapshotDatabaseDirectory];
      id v21 = v16;
      char v19 = MBStashMissedEncryptionKeysDB(v18, v6, (uint64_t)&v21);
      id v9 = v21;

      if (v19) {
        goto LABEL_20;
      }
      v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v9;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "=cloud-backup= Failed to stash missed encryption keys DB: %@", buf, 0xCu);
        _MBLog();
      }
      id v16 = v9;
    }
    else
    {
      v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v16;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to clear the pending snapshot record ID from the device record: %@", buf, 0xCu);
        _MBLog();
      }
    }

    goto LABEL_19;
  }
LABEL_21:
}

+ (BOOL)_shouldRemoveSnapshotAfterError:(id)a3
{
  if (!MBIsInternalInstall()) {
    return 1;
  }
  BOOL v4 = +[MBBehaviorOptions sharedOptions];
  v5 = v4;
  if (a3) {
    unsigned __int8 v6 = [v4 shouldKeepFileSystemSnapshotAfterBackupFailure];
  }
  else {
    unsigned __int8 v6 = [v4 shouldKeepFileSystemSnapshotAfterBackupSuccess];
  }
  char v7 = v6 ^ 1;

  return v7;
}

- (void)cleanUpAfterError:(id)a3
{
  id v4 = a3;
  if (+[MBError isCKError:v4 withCode:25]) {
    [(MBCKBackupEngine *)self _clearPendingSnapshotAfterQuotaExceededError];
  }
  v5 = [(MBCKEngine *)self ckOperationTracker];
  [v5 drain];

  -[MBCKBackupEngine _unmountSnapshotsAndRemoveThem:](self, "_unmountSnapshotsAndRemoveThem:", [(id)objc_opt_class() _shouldRemoveSnapshotAfterError:v4]);
  unsigned __int8 v6 = self->_currentSnapshot;
  if ((id)[(MBCKBackupEngine *)self backupState] == (id)3)
  {
    unsigned __int8 v7 = +[MBError isResumableCacheRefreshError:v4];
    if (!v6) {
      goto LABEL_13;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
    if (!v6) {
      goto LABEL_13;
    }
  }
  if ((v7 & 1) == 0)
  {
    unsigned int v8 = [(MBCKEngine *)self cache];
    id v9 = [v8 removeAllOrphanedItemsForSnapshot:v6];

    if (v9)
    {
      int v10 = MBGetDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to remove orphaned items for snapshot: %@", buf, 0xCu);
        id v11 = v9;
        _MBLog();
      }
    }
  }
LABEL_13:
  v12.receiver = self;
  v12.super_class = (Class)MBCKBackupEngine;
  -[MBCKEngine cleanUpAfterError:](&v12, "cleanUpAfterError:", v4, v11);
}

- (BOOL)runWithError:(id *)a3
{
  if ((id)[(MBEngine *)self backupPolicy] == (id)1)
  {
    v5 = [(MBCKBackupEngine *)self cloudSyncClient];

    if (!v5)
    {
      unsigned __int8 v6 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10008368C;
      block[3] = &unk_100411128;
      block[4] = self;
      dispatch_sync(v6, block);
    }
    unsigned __int8 v7 = [(MBCKBackupEngine *)self cloudSyncClient];
    [v7 startSync];
  }
  else
  {
    [(MBCKBackupEngine *)self setCloudSyncClient:0];
  }
  [(MBCKBackupEngine *)self makeStateTransition];
  if ([(MBEngine *)self isCanceled])
  {
    unsigned int v8 = [(MBCKBackupEngine *)self cloudSyncClient];

    if (v8)
    {
      id v9 = [(MBCKBackupEngine *)self cloudSyncClient];
      [v9 cancelSync];
    }
  }
  [(MBCKBackupEngine *)self _tearDown];
  unsigned int v10 = [(MBCKEngine *)self hasError];
  if (v10)
  {
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_super v12 = [(MBCKEngine *)self engineError];
      unsigned int v13 = +[MBError loggableDescriptionForError:v12];
      id v14 = [(MBCKEngine *)self engineError];
      *(_DWORD *)buf = 138543618;
      v28 = v13;
      __int16 v29 = 2112;
      v30 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "=cloud-backup= Backup failed: %{public}@, %@", buf, 0x16u);

      unsigned __int8 v15 = [(MBCKEngine *)self engineError];
      id v16 = +[MBError loggableDescriptionForError:v15];
      [(MBCKEngine *)self engineError];
      v25 = uint64_t v24 = v16;
      _MBLog();
    }
    id v17 = [(MBCKEngine *)self engineError];
    v18 = v17;
    if (a3) {
      *a3 = v17;
    }
    char v19 = [(MBCKEngine *)self persona];
    v20 = [v19 volumeMountPoint];
    id v21 = +[NSNumber numberWithUnsignedLongLong:MBFreeDiskSpaceForVolume()];
    id v22 = [(MBCKBackupEngine *)self telemetry];
    [v22 setFreeDiskSpace:v21];
  }
  return v10 ^ 1;
}

- (void)_tearDown
{
  v3 = [(MBCKBackupEngine *)self pendingSnapshotDatabase];

  if (v3)
  {
    id v4 = [(MBCKBackupEngine *)self pendingSnapshotDatabase];
    id v8 = 0;
    [v4 close:&v8];
    id v5 = v8;

    if (v5)
    {
      unsigned __int8 v6 = MBGetDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "=cloud-backup= Error closing pending snapshot database: %@", buf, 0xCu);
        id v7 = v5;
        _MBLog();
      }
    }
    -[MBCKBackupEngine setPendingSnapshotDatabase:](self, "setPendingSnapshotDatabase:", 0, v7);
  }
}

- (void)_handleStateTransition
{
  v3 = +[NSDate date];
  id v4 = [(MBCKEngine *)self cache];
  [v4 beginBatch];

  switch([(MBCKBackupEngine *)self backupState])
  {
    case 1uLL:
      [(MBCKBackupEngine *)self setBackupState:2];
      id v5 = [(MBCKEngine *)self multistateRetryStrategy];
      [v5 reset];

      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_10008411C;
      v38[3] = &unk_100411478;
      v38[4] = self;
      unsigned __int8 v6 = v38;
      goto LABEL_17;
    case 2uLL:
      [(MBCKBackupEngine *)self setBackupState:3];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100084184;
      v37[3] = &unk_100411478;
      v37[4] = self;
      unsigned __int8 v6 = v37;
      goto LABEL_17;
    case 3uLL:
      [(MBCKBackupEngine *)self setBackupState:12];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1000841F0;
      v36[3] = &unk_100411478;
      v36[4] = self;
      unsigned __int8 v6 = v36;
      goto LABEL_17;
    case 4uLL:
      [(MBCKBackupEngine *)self setBackupState:10];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_10008432C;
      v33[3] = &unk_100411478;
      v33[4] = self;
      unsigned __int8 v6 = v33;
      goto LABEL_17;
    case 5uLL:
      [(MBCKBackupEngine *)self setBackupState:13];
      id v7 = [(MBCKBackupEngine *)self telemetry];
      [v7 _startCollectingWiFiQualityMeasurements];

      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1000843F8;
      v31[3] = &unk_100411478;
      v31[4] = self;
      unsigned __int8 v6 = v31;
      goto LABEL_17;
    case 6uLL:
      [(MBCKBackupEngine *)self setBackupState:11];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100084410;
      v29[3] = &unk_100411478;
      v29[4] = self;
      unsigned __int8 v6 = v29;
      goto LABEL_17;
    case 7uLL:
      [(MBCKBackupEngine *)self setBackupState:8];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1000844E4;
      v27[3] = &unk_100411478;
      v27[4] = self;
      [(MBCKEngine *)self performRetryablePhase:v27];
      if ([(MBCKEngine *)self isFinished])
      {
        id v8 = [(MBCKEngine *)self engineError];
        unsigned int v9 = +[MBError isCancelledError:v8];

        if (v9) {
LABEL_12:
        }
          [(MBCKEngine *)self setEngineError:0];
      }
      else
      {
        [(MBCKEngine *)self setIsFinished:1];
        [(MBCKEngine *)self setEngineError:0];
        [(MBCKBackupEngine *)self setEstimator:0];
        uint64_t v24 = MBGetDefaultLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Backup finished successfully", buf, 2u);
          _MBLog();
        }
LABEL_34:
      }
LABEL_18:
      if (MBBackupReasonIsScheduled())
      {
        id v10 = [(MBCKEngine *)self engineError];
        unsigned int v11 = +[MBError isXPCActivityDeferredError:v10];

        if (v11)
        {
          objc_super v12 = [(MBCKEngine *)self engineError];
          unsigned int v13 = +[MBError errorWithCode:223 error:v12 format:@"Backup canceled (deferred)"];
          [(MBCKEngine *)self setEngineError:v13];
        }
      }
      [(MBCKBackupEngine *)self backupState];
      id v14 = MBCKStringForBackupState();
      if ([(MBCKBackupEngine *)self _shouldSimulateCancelationForState:v14])
      {
        unsigned __int8 v15 = +[MBError errorWithCode:202, @"Backup canceled (simulated for %@)", v14 format];
        [(MBCKEngine *)self setEngineError:v15];

        [(MBCKEngine *)self setIsFinished:1];
      }
      id v16 = +[NSDate date];
      [v16 timeIntervalSinceDate:v3];
      double v18 = v17;
      char v19 = MBGetDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v40 = v14;
        __int16 v41 = 2048;
        double v42 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "=cloud-backup= \"%{public}@\" done in %.3fs", buf, 0x16u);
        double v26 = v18;
        id v25 = v14;
        _MBLog();
      }

      v20 = [(MBCKBackupEngine *)self attemptSummary];
      [v20 trackDuration:v14 forEngineState:v18];

      [(MBCKBackupEngine *)self _sendTelemetryForStateChange:[(MBCKBackupEngine *)self backupState] start:v3 end:v16];
      if ([(MBCKEngine *)self isFinished])
      {
        if ([(MBCKBackupEngine *)self backupState] >= 3
          && (id)[(MBCKBackupEngine *)self backupState] != (id)8)
        {
          id v21 = [(MBCKEngine *)self engineError];
          [(MBCKBackupEngine *)self _notifyPluginsOfBackupEnded:v21 error:0];
        }
        [(MBCKBackupEngine *)self _finishCollectingTelemetry];
        id v22 = [(MBCKEngine *)self progressModel];
        [v22 ended];
      }
      id v23 = [(MBCKEngine *)self cache];
      [v23 flush];

      return;
    case 8uLL:
      [(MBCKEngine *)self setIsFinished:1];
      goto LABEL_12;
    case 9uLL:
      [(MBCKBackupEngine *)self setBackupState:4];
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1000842C4;
      v34[3] = &unk_100411478;
      v34[4] = self;
      unsigned __int8 v6 = v34;
      goto LABEL_17;
    case 0xAuLL:
      [(MBCKBackupEngine *)self setBackupState:5];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100084390;
      v32[3] = &unk_100411478;
      v32[4] = self;
      unsigned __int8 v6 = v32;
      goto LABEL_17;
    case 0xBuLL:
      [(MBCKBackupEngine *)self setBackupState:7];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10008447C;
      v28[3] = &unk_100411478;
      v28[4] = self;
      unsigned __int8 v6 = v28;
      goto LABEL_17;
    case 0xCuLL:
      [(MBCKBackupEngine *)self setBackupState:9];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10008425C;
      v35[3] = &unk_100411478;
      v35[4] = self;
      unsigned __int8 v6 = v35;
LABEL_17:
      [(MBCKEngine *)self performRetryablePhase:v6];
      goto LABEL_18;
    case 0xDuLL:
      [(MBCKBackupEngine *)self setBackupState:6];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100084404;
      v30[3] = &unk_100411478;
      v30[4] = self;
      [(MBCKEngine *)self performRetryablePhase:v30];
      uint64_t v24 = [(MBCKBackupEngine *)self telemetry];
      [v24 _stopCollectingWiFiQualityMeasurements];
      goto LABEL_34;
    default:
      __assert_rtn("-[MBCKBackupEngine _handleStateTransition]", "MBCKBackupEngine.m", 340, "0");
  }
}

- (BOOL)_shouldSimulateCancelationForState:(id)a3
{
  id v4 = a3;
  if (MBIsInternalInstall() && ![(MBCKEngine *)self isFinished])
  {
    unsigned __int8 v6 = +[MBBehaviorOptions sharedOptions];
    id v7 = [v6 engineStateToCancelBackupAfter];
    unsigned __int8 v5 = [v7 isEqualToString:v4];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)makeStateTransition
{
  [(MBCKBackupEngine *)self _handleStateTransition];
  v4.receiver = self;
  v4.super_class = (Class)MBCKBackupEngine;
  [(MBCKEngine *)&v4 makeStateTransition];
}

- (int64_t)_snapshotFormatForAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ((id)[(MBCKBackupEngine *)self backupState] != (id)2) {
    __assert_rtn("-[MBCKBackupEngine _snapshotFormatForAccount:error:]", "MBCKBackupEngine.m", 527, "self.backupState == kMBCKBackupStateSetup");
  }
  int64_t v7 = +[MBBackupCloudFormatPolicy snapshotFormatForAccount:v6 error:a4];

  return v7;
}

- (BOOL)setUpWithError:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBCKBackupEngine setUpWithError:]", "MBCKBackupEngine.m", 533, "error");
  }
  v278 = [(MBCKEngine *)self serviceManager];
  if (!v278) {
    __assert_rtn("-[MBCKBackupEngine setUpWithError:]", "MBCKBackupEngine.m", 535, "serviceManager");
  }
  unsigned __int8 v5 = [(MBCKEngine *)self serviceAccount];
  if (!v5) {
    __assert_rtn("-[MBCKBackupEngine setUpWithError:]", "MBCKBackupEngine.m", 537, "serviceAccount");
  }
  char v288 = 0;
  id v6 = [(MBCKEngine *)self persona];
  unsigned int v7 = [v6 getBooleanValueForKey:@"HasDeferredDiscountingQuota" keyExists:&v288];

  if (v288 && v7)
  {
    id v287 = 0;
    unsigned __int8 v8 = [v278 discountCameraRollQuotaWithAccount:v5 connection:0 error:&v287];
    id v9 = v287;
    if ((v8 & 1) == 0)
    {
      id v10 = MBGetDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        unsigned int v11 = v10;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          unint64_t v290 = (unint64_t)v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to discount camera roll quota: %@", buf, 0xCu);
        }

        id v242 = v9;
        _MBLog();
      }
    }
  }
  objc_super v12 = [(MBEngine *)self domainManager];
  BOOL v13 = v12 == 0;

  if (!v13)
  {
    id v14 = [(MBCKEngine *)self persona];
    v277 = [v14 volumeMountPoint];

    unint64_t v15 = MBFreeDiskSpaceForVolume();
    if (!(v15 >> 31))
    {
      id v16 = MBGetDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        double v17 = v16;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          unint64_t v290 = v15;
          __int16 v291 = 2048;
          *(void *)v292 = 0x80000000;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Disk space too low: %llu bytes. Purging %llu bytes", buf, 0x16u);
        }

        id v243 = (id)v15;
        uint64_t v249 = 0x80000000;
        _MBLog();
      }

      double v18 = [(MBCKBackupEngine *)self cacheDeleteRequest];
      if (v18)
      {
        [(MBCKBackupEngine *)self setCacheDeleteRequest:v18];
      }
      else
      {
        id v21 = [[MBCacheDeleteRequest alloc] initWithVolumePath:v277];
        [(MBCKBackupEngine *)self setCacheDeleteRequest:v21];
      }
      id v22 = [(MBCKBackupEngine *)self cacheDeleteRequest];
      id v23 = [v22 purge:0x80000000];

      uint64_t v24 = MBGetDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = v24;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v290 = (unint64_t)v23;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "=cloud-backup= CacheDelete purged %llu bytes", buf, 0xCu);
        }

        id v243 = v23;
        _MBLog();
      }
    }
    self->_snapshotType = -1;
    uint64_t v26 = MBGetChargingType();
    v27 = [(MBCKBackupEngine *)self telemetry];
    [v27 setChargingType:v26];

    v286.receiver = self;
    v286.super_class = (Class)MBCKBackupEngine;
    if (![(MBCKEngine *)&v286 setUpWithError:a3])
    {
      BOOL v20 = 0;
LABEL_94:

      goto LABEL_95;
    }
    if (MBBackupReasonIsManual() && !self->_lockAssertionRef) {
      self->_lockAssertionRef = +[MBKeyBag holdLockAssertion:@"Manual Backup"];
    }
    if ((objc_msgSend(v5, "isEnabled", v243, v249) & 1) == 0)
    {
      __int16 v41 = MBGetDefaultLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "=cloud-backup= Account is not enabled for backup", buf, 2u);
        _MBLog();
      }

      +[MBError errorWithCode:210 format:@"Account not enabled"];
      BOOL v20 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_94;
    }
    v28 = [(MBCKEngine *)self ckOperationTracker];
    v276 = v28;
    if (!v28) {
      __assert_rtn("-[MBCKBackupEngine setUpWithError:]", "MBCKBackupEngine.m", 581, "tracker");
    }
    __int16 v29 = [v28 ckOperationPolicy];
    v275 = [v29 cellularAccess];

    if (v275)
    {
      if ([v275 allowsExpensiveNetworkAccess]) {
        uint64_t v30 = 2;
      }
      else {
        uint64_t v30 = 1;
      }
      v31 = [(MBCKBackupEngine *)self telemetry];
      [v31 setAllowedCellularCost:v30];
    }
    id v32 = [v278 networkConnectivity];
    uint64_t v34 = v33;
    v35 = [(MBCKBackupEngine *)self telemetry];
    objc_msgSend(v35, "setNetworkConnectivityAtStart:", v32, v34);

    v36 = [(MBCKEngine *)self cache];
    if (!v36) {
      __assert_rtn("-[MBCKBackupEngine setUpWithError:]", "MBCKBackupEngine.m", 591, "cache");
    }
    v37 = +[MBCKAccount fetchAccountWithOperationTracker:v276 cache:v36 create:1 error:a3];
    if (!v37)
    {
      if (!*a3) {
        __assert_rtn("-[MBCKBackupEngine setUpWithError:]", "MBCKBackupEngine.m", 597, "*error != nil");
      }
      v37 = 0;
      goto LABEL_92;
    }
    v38 = MBGetDefaultLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v39 = v38;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v290 = (unint64_t)v37;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "=cloud-backup= Account record is %@", buf, 0xCu);
      }

      v244 = v37;
      _MBLog();
    }

    if ([v36 invalidated])
    {
      v40 = [v278 openCacheWithAccount:v5 accessType:1 error:a3];

      if (!v40)
      {
        v36 = 0;
        goto LABEL_92;
      }
      [(MBCKEngine *)self setCache:v40];
    }
    else
    {
      v40 = v36;
    }
    if (objc_msgSend(v37, "fetchDevicesWithOperationTracker:error:", v276, a3, v244))
    {
      if (![(MBCKEngine *)self handleCancelation:a3])
      {
        double v42 = [(MBCKEngine *)self context];
        v43 = [v42 backupUDID];
        unsigned int v44 = [v37 backupsDisabledFromAnotherDeviceForUUID:v43];

        if (!v44)
        {
          v36 = v40;
LABEL_75:
          v274 = v37;
          unsigned __int8 v284 = 0;
          v55 = [(MBCKEngine *)self context];
          v56 = [v55 backupUDID];
          unsigned __int8 v57 = [v274 setupDeviceWithOperationTracker:v276 deviceUUID:v56 passcode:0 hasNewOTAKeyBag:&v284 error:a3];

          if ([v36 invalidated])
          {
            v271 = [v278 openCacheWithAccount:v5 accessType:1 error:a3];

            if (!v271)
            {
              v36 = 0;
LABEL_97:
              BOOL v20 = 0;
LABEL_144:
              v37 = v274;
              goto LABEL_93;
            }
            -[MBCKEngine setCache:](self, "setCache:");
          }
          else
          {
            v271 = v36;
          }
          v58 = [(MBCKBackupEngine *)self telemetry];
          unsigned __int8 v59 = [v58 createdNewOTAKeybag];

          if ((v59 & 1) == 0)
          {
            v60 = +[NSNumber numberWithBool:v284];
            v61 = [(MBCKBackupEngine *)self telemetry];
            [v61 setCreatedNewOTAKeybag:v60 != 0];
          }
          if (v57)
          {
            v62 = [(MBCKEngine *)self context];
            v63 = [v62 backupUDID];
            v64 = [v274 deviceForUUID:v63];
            [(MBCKEngine *)self setDevice:v64];

            v65 = [(MBCKEngine *)self device];
            BOOL v66 = v65 == 0;

            if (v66)
            {
              v76 = MBGetDefaultLog();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "=cloud-backup= Could not find device after setup, failing backup attempt", buf, 2u);
                _MBLog();
              }

              +[MBError errorWithCode:204 format:@"Could not find device after setup"];
              BOOL v20 = 0;
              *a3 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_140;
            }
            v67 = [(MBCKEngine *)self context];
            v68 = [v67 backupUDID];
            v69 = MBDeviceUUID();
            unsigned int v70 = [v68 isEqualToString:v69];

            if (v70)
            {
              buf[0] = 0;
              v71 = [(MBCKEngine *)self device];
              v72 = +[MBCKJournal journalForDevice:v71 cache:v271 engine:self];

              if ([v72 replayJournalResetOrDisableWithOperationTracker:v276 serviceManager:v278 disable:buf error:a3])
              {
                if (buf[0])
                {
                  [v278 setBackupEnabled:0 account:v5 connection:0];
                  CFStringRef v73 = @"Backups disabled from server action";
                }
                else
                {
                  CFStringRef v73 = @"Backups reset from server action";
                }
                *a3 = +[MBError errorWithCode:204 format:v73];
                goto LABEL_139;
              }
              if ([v271 invalidated])
              {
                v270 = [v278 openCacheWithAccount:v5 accessType:1 error:a3];

                if (!v270)
                {
                  v271 = 0;
LABEL_139:

                  BOOL v20 = 0;
LABEL_140:
                  v36 = v271;
                  v37 = v274;
                  goto LABEL_93;
                }
                -[MBCKEngine setCache:](self, "setCache:");
              }
              else
              {
                v270 = v271;
              }
            }
            else
            {
              v270 = v271;
            }
            v77 = [(MBCKEngine *)self device];
            if ([v77 hasFetchedSnapshots])
            {
            }
            else
            {
              v78 = [(MBCKEngine *)self device];
              unsigned __int8 v79 = [v78 fetchSnapshotsWithOperationTracker:v276 error:a3];

              if ((v79 & 1) == 0)
              {
                if (!*a3) {
                  __assert_rtn("-[MBCKBackupEngine setUpWithError:]", "MBCKBackupEngine.m", 691, "*error != nil");
                }
                goto LABEL_142;
              }
            }
            id v272 = [(MBCKBackupEngine *)self _snapshotFormatForAccount:v5 error:a3];
            if (v272 == (id)-1)
            {
LABEL_142:
              BOOL v20 = 0;
              goto LABEL_143;
            }
            v80 = [(MBCKEngine *)self device];
            v81 = [v80 snapshots];
            v82 = [v81 lastObject];
            previousSnapshot = self->_previousSnapshot;
            self->_previousSnapshot = v82;

            v84 = [(MBCKEngine *)self device];
            v85 = [v84 snapshots];
            BOOL v86 = [v85 count] == 0;

            if (v86)
            {
              int64_t v269 = 0;
            }
            else
            {
              v87 = [(MBCKEngine *)self device];
              unsigned __int8 v88 = [v87 requiresFullBackupForAccount:v5];

              if (v88)
              {
                uint64_t v89 = 2;
              }
              else
              {
                if ((id)[(MBCKSnapshot *)self->_previousSnapshot snapshotFormat] != v272)
                {
                  int64_t v269 = MBSnapshotTypeForFormatTransition([(MBCKSnapshot *)self->_previousSnapshot snapshotFormat], (uint64_t)v272, a3);
                  if (v269 == -1) {
                    goto LABEL_142;
                  }
                  goto LABEL_123;
                }
                uint64_t v89 = 1;
              }
              int64_t v269 = v89;
            }
LABEL_123:
            v90 = MBGetDefaultLog();
            if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
            {
              v91 = v90;
              if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
              {
                MBStringForSnapshotType();
                id v92 = (id)objc_claimAutoreleasedReturnValue();
                MBStringForSnapshotFormat();
                id v93 = (id)objc_claimAutoreleasedReturnValue();
                v94 = [(MBCKBackupEngine *)self telemetry];
                unsigned int v95 = [v94 createdNewOTAKeybag];
                *(_DWORD *)buf = 138412802;
                unint64_t v290 = (unint64_t)v92;
                __int16 v291 = 2112;
                *(void *)v292 = v93;
                *(_WORD *)&v292[8] = 1024;
                *(_DWORD *)&v292[10] = v95;
                _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_INFO, "=cloud-backup= Setting up backup, type:%@ format:%@ hasNewOTAKeyBag:%d", buf, 0x1Cu);
              }
              v96 = MBStringForSnapshotType();
              v97 = MBStringForSnapshotFormat();
              v98 = [(MBCKBackupEngine *)self telemetry];
              v250 = v97;
              uint64_t v252 = [v98 createdNewOTAKeybag];
              v246 = v96;
              _MBLog();
            }
            self->_snapshotType = v269;
            self->_snapshotFormat = (int64_t)v272;
            v99 = [(MBCKEngine *)self device];
            unsigned int v100 = [v99 shouldDeleteDevice];

            if (v100)
            {
              v101 = MBGetDefaultLog();
              if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Existing backup history has corrupt data. Deleting and starting a fresh backup", buf, 2u);
                _MBLog();
              }

              v102 = [(MBCKEngine *)self context];
              v103 = [v102 backupUDID];
              unsigned int v104 = [v274 deleteDeviceWithOperationTracker:v276 deviceUUID:v103 error:a3];

              if (v104)
              {
                v105 = MBGetDefaultLog();
                if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Resetting the cache - shouldDeleteDevice", buf, 2u);
                  _MBLog();
                }

                [v278 resetCacheWithAccount:v5 error:a3];
                id v283 = 0;
                v36 = [v278 openCacheWithAccount:v5 accessType:1 error:&v283];
                id v106 = v283;

                [(MBCKEngine *)self setCache:v36];
                [(MBCKEngine *)self setDevice:0];
                *a3 = +[MBError errorWithCode:17 format:@"Device deleted, please retry"];

                goto LABEL_97;
              }
              goto LABEL_142;
            }
            uint64_t v107 = [(MBCKEngine *)self device];
            [(id)v107 pinLatestGMSnapshotIfNeeded];

            v108 = [(MBCKEngine *)self device];
            LOBYTE(v107) = [v108 addUnreferencedKeybagsFromCacheWithOperationTracker:v276 error:a3];

            if (v107)
            {
              v109 = [(MBEngine *)self debugContext];
              unsigned int v110 = [v109 isFlagSet:@"NotEnoughFreeSpaceForBackup"];

              if (v110)
              {
                +[MBError errorWithCode:105 format:@"Not enough free cache space to perform a backup"];
                BOOL v20 = 0;
                *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_143:
                v36 = v270;
                goto LABEL_144;
              }
              v111 = +[MBBehaviorOptions sharedOptions];
              v267 = [v111 addRepairDomainToMBCKDevice];

              if ([v267 length])
              {
                v112 = [(MBCKEngine *)self device];
                v113 = [v112 hmacKey];
                v114 = MBDomainHMACForDomainName((uint64_t)v267, (uint64_t)v113);

                v115 = [(MBCKEngine *)self device];
                [v115 addRepairDomainHMAC:v114];
              }
              v116 = [(MBCKEngine *)self device];
              v117 = [v116 pendingSnapshotRecordID];
              BOOL v118 = v117 == 0;

              if (v118)
              {
                int v264 = 0;
                goto LABEL_223;
              }
              id v282 = 0;
              unsigned int v263 = [v270 hasBackupContentsWithError:&v282];
              id obj = v282;
              if ((v263 & 1) == 0)
              {
                v119 = MBGetDefaultLog();
                if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
                {
                  v120 = v119;
                  if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_INFO, "=cloud-backup= Cache does not have backup contents", buf, 2u);
                  }

                  _MBLog();
                }
              }
              v121 = [(MBCKEngine *)self device];
              id v122 = [v121 pendingSnapshotFormat];

              v123 = [(MBCKEngine *)self device];
              id v257 = [v123 pendingSnapshotType];

              v124 = [(MBCKEngine *)self device];
              os_log_t oslog = [v124 pendingSnapshotBuildVersion];

              if ((MBSnapshotFormatContainsFileLists() & 1) == 0 && !MBSnapshotFormatContainsFileLists())
              {
                BOOL v152 = 0;
                goto LABEL_211;
              }
              v125 = [(MBCKEngine *)self persona];
              v126 = [v125 snapshotDatabaseDirectory];
              v127 = [(MBCKEngine *)self device];
              v128 = [v127 pendingSnapshotRecordID];
              v129 = +[MBCKSnapshot snapshotIDFromSnapshotRecordID:v128];
              unsigned int v261 = MBSnapshotDirectoryExists(v126, v129);

              if ((v261 & 1) == 0)
              {
                v130 = MBGetDefaultLog();
                if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
                {
                  v131 = v130;
                  if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
                  {
                    v132 = [(MBCKEngine *)self device];
                    v133 = [v132 pendingSnapshotRecordID];
                    *(_DWORD *)buf = 138412290;
                    unint64_t v290 = (unint64_t)v133;
                    _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_INFO, "=cloud-backup= Pending snapshot dir %@ does not exist for commitID", buf, 0xCu);
                  }
                  v134 = [(MBCKEngine *)self device];
                  v247 = [v134 pendingSnapshotRecordID];
                  _MBLog();
                }
              }
              if (v122 == v272)
              {
                int v135 = 0;
              }
              else
              {
                v136 = MBGetDefaultLog();
                if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
                {
                  v137 = v136;
                  if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134218240;
                    unint64_t v290 = (unint64_t)v122;
                    __int16 v291 = 2048;
                    *(void *)v292 = v272;
                    _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Invalidating pending snapshot - format %ld != %ld", buf, 0x16u);
                  }

                  v247 = v122;
                  id v251 = v272;
                  _MBLog();
                }

                int v135 = 1;
              }
              MBBuildVersion();
              id v259 = (id)objc_claimAutoreleasedReturnValue();
              if (([oslog isEqualToString:v259] & 1) == 0)
              {
                v138 = MBGetDefaultLog();
                if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
                {
                  v139 = v138;
                  if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    unint64_t v290 = (unint64_t)oslog;
                    __int16 v291 = 2112;
                    *(void *)v292 = v259;
                    _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Invalidating pending snapshot - build %@ != %@", buf, 0x16u);
                  }

                  v247 = oslog;
                  id v251 = v259;
                  _MBLog();
                }

                int v135 = 1;
              }
              v140 = [(MBCKEngine *)self device];
              v141 = [v140 domainHMACsToRepair];
              if ([v141 count]) {
                unsigned int v142 = v261;
              }
              else {
                unsigned int v142 = 0;
              }

              if (!v142)
              {
LABEL_210:

                v263 |= v261;
                BOOL v152 = v135 != 0;
LABEL_211:
                if (v257 == (id)v269)
                {
                  int v158 = v263 ^ 1;
                  if (obj) {
                    int v158 = 1;
                  }
                  if ((v152 | v158) != 1)
                  {
                    int v264 = 1;
LABEL_222:

LABEL_223:
                    v162 = [(MBCKEngine *)self device];
                    v163 = [v162 pendingSnapshot];
                    BOOL v164 = v163 == 0;

                    if (v164) {
                      id v165 = [v270 deleteCloudFilesPendingDelete];
                    }
                    if ([(MBCKEngine *)self handleCancelation:a3])
                    {
                      BOOL v20 = 0;
LABEL_271:

                      goto LABEL_143;
                    }
                    v166 = [(MBCKEngine *)self device];
                    int64_t v167 = [(MBCKBackupEngine *)self backupReason];
                    v168 = [(MBCKEngine *)self persona];
                    +[MBCKSnapshot snapshotForDevice:reason:type:snapshotFormat:accountType:](MBCKSnapshot, "snapshotForDevice:reason:type:snapshotFormat:accountType:", v166, v167, v269, v272, [v168 accountType]);
                    id obj = (id)objc_claimAutoreleasedReturnValue();

                    if (!obj)
                    {
                      *a3 = +[MBError errorWithCode:1 format:@"Failed to create a new snapshot"];
                      MBGetDefaultLog();
                      os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
                      {
                        os_log_t oslog = oslog;
                        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
                        {
                          id v175 = *a3;
                          *(_DWORD *)buf = 138543362;
                          unint64_t v290 = (unint64_t)v175;
                          _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to create snapshot: %{public}@", buf, 0xCu);
                        }

                        _MBLog();
                      }
                      id obj = 0;
                      goto LABEL_268;
                    }
                    p_currentSnapshot = &self->_currentSnapshot;
                    objc_storeStrong((id *)&self->_currentSnapshot, obj);
                    v170 = MBOperationGroupNamePrefixForBackup(self->_previousSnapshot, (uint64_t)v272);
                    [v276 setGroupNamePrefix:v170];

                    v171 = MBGetDefaultLog();
                    BOOL v172 = os_log_type_enabled(v171, OS_LOG_TYPE_DEFAULT);
                    if (v264)
                    {
                      if (v172)
                      {
                        v173 = v171;
                        if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
                        {
                          v174 = [(MBCKSnapshot *)*p_currentSnapshot commitID];
                          *(_DWORD *)buf = 138412290;
                          unint64_t v290 = (unint64_t)v174;
                          _os_log_impl((void *)&_mh_execute_header, v173, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Resuming pending snapshot:%@", buf, 0xCu);
                        }
LABEL_241:

                        v248 = [(MBCKSnapshot *)*p_currentSnapshot commitID];
                        _MBLog();
                      }
                    }
                    else if (v172)
                    {
                      v173 = v171;
                      if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
                      {
                        v176 = [(MBCKSnapshot *)*p_currentSnapshot commitID];
                        *(_DWORD *)buf = 138412290;
                        unint64_t v290 = (unint64_t)v176;
                        _os_log_impl((void *)&_mh_execute_header, v173, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Creating new snapshot:%@", buf, 0xCu);
                      }
                      goto LABEL_241;
                    }

                    v177 = [(MBCKEngine *)self device];
                    unsigned __int8 v178 = [v177 addPendingSnapshot:obj error:a3];

                    if ((v178 & 1) == 0)
                    {
                      v225 = MBGetDefaultLog();
                      if (os_log_type_enabled(v225, OS_LOG_TYPE_ERROR))
                      {
                        v226 = v225;
                        if (os_log_type_enabled(v226, OS_LOG_TYPE_ERROR))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl((void *)&_mh_execute_header, v226, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to add snapshot to device", buf, 2u);
                        }

                        _MBLog();
                      }

                      if (!*a3) {
                        __assert_rtn("-[MBCKBackupEngine setUpWithError:]", "MBCKBackupEngine.m", 850, "*error != nil");
                      }
                      goto LABEL_265;
                    }
                    if ((v264 | MBSnapshotFormatContainsFileLists() ^ 1)) {
                      goto LABEL_297;
                    }
                    id v179 = [obj snapshotFormat];
                    v180 = [(MBCKEngine *)self device];
                    [v180 setPendingSnapshotFormat:v179];

                    id v181 = [obj type];
                    v182 = [(MBCKEngine *)self device];
                    [v182 setPendingSnapshotType:v181];

                    int64_t v183 = [(MBEngine *)self backupPolicy];
                    v184 = [(MBCKEngine *)self device];
                    [v184 setPendingSnapshotBackupPolicy:v183];

                    v185 = [(MBCKEngine *)self device];
                    v186 = [(MBCKEngine *)self ckOperationTracker];
                    unsigned __int8 v187 = [v185 saveWithOperationTracker:v186 error:a3];

                    if (v187)
                    {
LABEL_297:
                      if (!MBIsInternalInstall()) {
                        goto LABEL_247;
                      }
                      v188 = [(MBCKEngine *)self device];
                      v189 = [v188 recordID];
                      v190 = [(MBCKEngine *)self ckOperationTracker];
                      unsigned int v191 = +[MBCKDevice performKeyBagReferenceValidationOnDeviceWithRecordID:v189 tracker:v190 error:a3];

                      if (v191)
                      {
LABEL_247:
                        v192 = [(MBCKEngine *)self device];
                        os_log_t oslog = [v192 pendingSnapshotRecordID];

                        v262 = [v270 propertyForKey:@"PendingSnapshotID" error:a3];
                        if (!v262 || ([v262 isEqualToString:oslog] & 1) == 0)
                        {
                          id v193 = [v270 setProperty:oslog forKey:@"PendingSnapshotID"];
                          v194 = MBBuildVersion();
                          id v195 = [v270 setProperty:v194 forKey:@"PendingSnapshotBuildVersion"];
                        }
                        v196 = [(MBCKBackupEngine *)self pluginNotifier];
                        id v280 = 0;
                        unsigned __int8 v197 = [v196 notifyPluginsOfStartingBackupWithError:&v280];
                        id v198 = v280;

                        if (v197)
                        {
                          v199 = [(MBCKBackupEngine *)self pluginNotifier];
                          id v279 = v198;
                          unsigned __int8 v200 = [v199 notifyPluginsOfPreparingBackupWithError:&v279];
                          id v260 = v279;

                          if (v200)
                          {
                            v201 = [(MBCKSnapshot *)*p_currentSnapshot commitID];
                            v202 = [(MBCKBackupEngine *)self attemptSummary];
                            [v202 setCommitID:v201];

                            id v203 = [(MBCKSnapshot *)*p_currentSnapshot snapshotFormat];
                            v204 = [(MBCKBackupEngine *)self attemptSummary];
                            [v204 setSnapshotFormat:v203];

                            id v205 = [(MBCKSnapshot *)*p_currentSnapshot type];
                            v206 = [(MBCKBackupEngine *)self attemptSummary];
                            [v206 setSnapshotType:v205];

                            v207 = [(MBCKSnapshot *)self->_previousSnapshot commitID];
                            v208 = [(MBCKBackupEngine *)self attemptSummary];
                            [v208 setPreviousSnapshotCommitID:v207];

                            [(MBCKSnapshot *)*p_currentSnapshot setCameraRollBackupState:[(MBCKBackupEngine *)self cameraRollBackupState]];
                            v209 = [(MBCKEngine *)self ckOperationPolicy];
                            v210 = [v209 cellularAccess];
                            [(MBCKSnapshot *)*p_currentSnapshot setIsBackupAllowedOnCellular:v210 != 0];

                            if ((id)[(MBEngine *)self backupPolicy] == (id)1) {
                              [(MBCKSnapshot *)*p_currentSnapshot setBackupPolicy:1];
                            }
                            BOOL v211 = self->_previousSnapshot == 0;
                            v212 = MBGetDefaultLog();
                            BOOL v213 = os_log_type_enabled(v212, OS_LOG_TYPE_DEFAULT);
                            if (v211)
                            {
                              if (v213)
                              {
                                v232 = v212;
                                if (os_log_type_enabled(v232, OS_LOG_TYPE_DEFAULT))
                                {
                                  v233 = [obj commitID];
                                  MBStringForSnapshotType();
                                  id v234 = (id)objc_claimAutoreleasedReturnValue();
                                  MBStringForSnapshotFormat();
                                  id v268 = (id)objc_claimAutoreleasedReturnValue();
                                  v235 = [(MBCKBackupEngine *)self telemetry];
                                  unsigned int v236 = [v235 createdNewOTAKeybag];
                                  [obj backupPolicy];
                                  MBStringForBackupPolicy();
                                  id v237 = (id)objc_claimAutoreleasedReturnValue();
                                  *(_DWORD *)buf = 138413570;
                                  unint64_t v290 = (unint64_t)v233;
                                  __int16 v291 = 1024;
                                  *(_DWORD *)v292 = v264;
                                  *(_WORD *)&v292[4] = 2112;
                                  *(void *)&v292[6] = v234;
                                  __int16 v293 = 2112;
                                  id v294 = v268;
                                  __int16 v295 = 1024;
                                  *(_DWORD *)v296 = v236;
                                  *(_WORD *)&v296[4] = 2112;
                                  *(void *)&v296[6] = v237;
                                  _os_log_impl((void *)&_mh_execute_header, v232, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Finished setting up backup for initial snapshot %@ isResumed:%d type:%@ format:%@ hasNewOTAKeyBag:%d policy:%@", buf, 0x36u);
                                }
                                v238 = [obj commitID];
                                v239 = MBStringForSnapshotType();
                                v240 = MBStringForSnapshotFormat();
                                v241 = [(MBCKBackupEngine *)self telemetry];
                                [v241 createdNewOTAKeybag];
                                [obj backupPolicy];
                                v253 = MBStringForBackupPolicy();
                                _MBLog();
                              }
                            }
                            else if (v213)
                            {
                              v214 = v212;
                              if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
                              {
                                v215 = [obj commitID];
                                MBStringForSnapshotType();
                                id v216 = (id)objc_claimAutoreleasedReturnValue();
                                MBStringForSnapshotFormat();
                                id v258 = (id)objc_claimAutoreleasedReturnValue();
                                [(MBCKSnapshot *)self->_previousSnapshot snapshotFormat];
                                MBStringForSnapshotFormat();
                                id v256 = (id)objc_claimAutoreleasedReturnValue();
                                v217 = [(MBCKBackupEngine *)self telemetry];
                                unsigned int v218 = [v217 createdNewOTAKeybag];
                                [obj backupPolicy];
                                MBStringForBackupPolicy();
                                id v219 = (id)objc_claimAutoreleasedReturnValue();
                                *(_DWORD *)buf = 138413826;
                                unint64_t v290 = (unint64_t)v215;
                                __int16 v291 = 1024;
                                *(_DWORD *)v292 = v264;
                                *(_WORD *)&v292[4] = 2112;
                                *(void *)&v292[6] = v216;
                                __int16 v293 = 2112;
                                id v294 = v258;
                                __int16 v295 = 2112;
                                *(void *)v296 = v256;
                                *(_WORD *)&v296[8] = 1024;
                                *(_DWORD *)&v296[10] = v218;
                                __int16 v297 = 2112;
                                id v298 = v219;
                                _os_log_impl((void *)&_mh_execute_header, v214, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Finished setting up backup for %@ isResumed:%d type:%@ format:%@ previousFormat:%@ hasNewOTAKeyBag:%d policy:%@", buf, 0x40u);
                              }
                              v220 = [obj commitID];
                              v221 = MBStringForSnapshotType();
                              v222 = MBStringForSnapshotFormat();
                              [(MBCKSnapshot *)self->_previousSnapshot snapshotFormat];
                              v223 = MBStringForSnapshotFormat();
                              v224 = [(MBCKBackupEngine *)self telemetry];
                              [v224 createdNewOTAKeybag];
                              [obj backupPolicy];
                              v254 = MBStringForBackupPolicy();
                              _MBLog();
                            }
                            BOOL v20 = 1;
                            goto LABEL_292;
                          }
                          v230 = MBGetDefaultLog();
                          if (os_log_type_enabled(v230, OS_LOG_TYPE_ERROR))
                          {
                            v231 = v230;
                            if (os_log_type_enabled(v231, OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)buf = 138412290;
                              unint64_t v290 = (unint64_t)v260;
                              _os_log_impl((void *)&_mh_execute_header, v231, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to notify plugins of preparingBackupWithError: %@", buf, 0xCu);
                            }

                            _MBLog();
                          }

                          id v260 = v260;
                        }
                        else
                        {
                          v227 = MBGetDefaultLog();
                          if (os_log_type_enabled(v227, OS_LOG_TYPE_ERROR))
                          {
                            v228 = v227;
                            if (os_log_type_enabled(v228, OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)buf = 138412290;
                              unint64_t v290 = (unint64_t)v198;
                              _os_log_impl((void *)&_mh_execute_header, v228, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to notify plugins of startingBackupWithError: %@", buf, 0xCu);
                            }

                            _MBLog();
                          }

                          id v260 = v198;
                        }
                        BOOL v20 = 0;
                        *a3 = v260;
LABEL_292:

                        goto LABEL_269;
                      }
LABEL_265:
                      BOOL v20 = 0;
LABEL_270:

                      goto LABEL_271;
                    }
                    MBGetDefaultLog();
                    os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
                    {
                      os_log_t oslog = oslog;
                      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
                      {
                        id v229 = *a3;
                        *(_DWORD *)buf = 138412290;
                        unint64_t v290 = (unint64_t)v229;
                        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Failed to save pending snapshotID to server: %@", buf, 0xCu);
                      }

                      _MBLog();
                    }
LABEL_268:
                    BOOL v20 = 0;
LABEL_269:

                    goto LABEL_270;
                  }
                }
                else
                {
                  v159 = MBGetDefaultLog();
                  if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
                  {
                    v160 = v159;
                    if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 134218240;
                      unint64_t v290 = (unint64_t)v257;
                      __int16 v291 = 2048;
                      *(void *)v292 = v269;
                      _os_log_impl((void *)&_mh_execute_header, v160, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Invalidating pending snapshot - type %ld != %ld", buf, 0x16u);
                    }

                    v247 = v257;
                    id v251 = (id)v269;
                    _MBLog();
                  }
                }
                v161 = [(MBCKEngine *)self device];
                [v161 clearPendingSnapshotAndRebuildFileChanges:0];

                int v264 = 0;
                goto LABEL_222;
              }
              v143 = [(MBCKEngine *)self persona];
              v144 = [v143 snapshotDatabaseDirectory];
              v145 = [(MBCKEngine *)self device];
              v146 = [v145 pendingSnapshotRecordID];
              v147 = +[MBCKSnapshot snapshotIDFromSnapshotRecordID:v146];
              v255 = +[MBPendingSnapshotDB openOrCreateDatabaseIn:v144 commitID:v147 readonly:1 error:a3];

              if (!v255)
              {
                v153 = MBGetDefaultLog();
                if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
                {
                  v154 = v153;
                  if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
                  {
                    id v155 = *a3;
                    *(_DWORD *)buf = 138412290;
                    unint64_t v290 = (unint64_t)v155;
                    _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_ERROR, "=cloud-backup= =domain repair= Failed to open MBPendingSnapshotDB: %@", buf, 0xCu);
                  }

                  _MBLog();
                }

                goto LABEL_266;
              }
              char v281 = 0;
              v148 = [(MBCKEngine *)self device];
              v149 = [v148 domainHMACsToRepair];
              unsigned __int8 v150 = [v255 domainHMACsToRepairMatches:v149 outResult:&v281 error:a3];

              if (v150)
              {
                if (v281)
                {
                  int v151 = 0;
                  goto LABEL_208;
                }
                v156 = MBGetDefaultLog();
                if (os_log_type_enabled(v156, OS_LOG_TYPE_INFO))
                {
                  v156 = v156;
                  if (os_log_type_enabled(v156, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_INFO, "=cloud-backup= =domain repair= Invalidating pending snapshot", buf, 2u);
                  }

                  _MBLog();
                }
                int v151 = 0;
                int v135 = 1;
              }
              else
              {
                v156 = MBGetDefaultLog();
                if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
                {
                  v156 = v156;
                  if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
                  {
                    id v157 = *a3;
                    *(_DWORD *)buf = 138412290;
                    unint64_t v290 = (unint64_t)v157;
                    _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_ERROR, "=cloud-backup= =domain repair= Failed to compare pending and new domainHMACsToRepair for equality: %@", buf, 0xCu);
                  }

                  v247 = *a3;
                  _MBLog();
                }
                int v151 = 1;
              }

LABEL_208:
              if ([v255 close:a3])
              {

                if (!v151) {
                  goto LABEL_210;
                }
LABEL_267:

                goto LABEL_268;
              }
LABEL_266:

              goto LABEL_267;
            }
            if (!*a3) {
              __assert_rtn("-[MBCKBackupEngine setUpWithError:]", "MBCKBackupEngine.m", 732, "*error != nil");
            }
            goto LABEL_142;
          }
          v36 = v271;
          v37 = v274;
          if (!*a3) {
            __assert_rtn("-[MBCKBackupEngine setUpWithError:]", "MBCKBackupEngine.m", 655, "*error != nil");
          }
          goto LABEL_92;
        }
        int IsManual = MBBackupReasonIsManual();
        v46 = MBGetDefaultLog();
        BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
        if (IsManual)
        {
          if (v47)
          {
            v48 = v46;
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              v49 = [(MBCKEngine *)self context];
              v50 = [v49 backupUDID];
              *(_DWORD *)buf = 138412290;
              unint64_t v290 = (unint64_t)v50;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Disabled from another device triggered manually. Resetting the cache - cached device:%@", buf, 0xCu);
            }
            v51 = [(MBCKEngine *)self context];
            v245 = [v51 backupUDID];
            _MBLog();
          }
          unsigned int v273 = [v278 resetCacheWithAccount:v5 error:a3];
          v36 = [v278 openCacheWithAccount:v5 accessType:1 error:a3];

          [(MBCKEngine *)self setCache:v36];
          v52 = [(MBCKEngine *)self cache];
          uint64_t v53 = +[MBCKAccount fetchAccountWithOperationTracker:v276 cache:v52 error:a3];

          BOOL v20 = 0;
          v37 = (void *)v53;
          if (v53) {
            unsigned int v54 = v273;
          }
          else {
            unsigned int v54 = 0;
          }
          if (v54 != 1 || !v36) {
            goto LABEL_93;
          }
          goto LABEL_75;
        }
        if (v47)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Resetting the cache since the backup was disabled from another device", buf, 2u);
          _MBLog();
        }

        [v278 resetCacheWithAccount:v5 error:a3];
        id v285 = 0;
        v36 = [v278 openCacheWithAccount:v5 accessType:1 error:&v285];
        id v74 = v285;

        [(MBCKEngine *)self setCache:v36];
        [v278 setBackupEnabled:0 account:v5 connection:0];
        *a3 = +[MBError errorWithCode:204 format:@"Backups disabled from another device"];

LABEL_92:
        BOOL v20 = 0;
        goto LABEL_93;
      }
    }
    else if (!*a3)
    {
      __assert_rtn("-[MBCKBackupEngine setUpWithError:]", "MBCKBackupEngine.m", 613, "*error != nil");
    }
    BOOL v20 = 0;
    v36 = v40;
LABEL_93:

    goto LABEL_94;
  }
  char v19 = MBGetDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "=cloud-backup= nil domain manager", buf, 2u);
    _MBLog();
  }

  +[MBError errorWithCode:1 format:@"nil domain manager"];
  BOOL v20 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_95:

  return v20;
}

- (BOOL)checkIfBackupHasKeybagWithUUID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(MBCKEngine *)self device];
  id v6 = [v5 keybagManager];
  unsigned __int8 v7 = [v6 hasKeybagWithUUID:v4];

  return v7;
}

- (BOOL)synchronizeFileListsWithError:(id *)a3
{
  unsigned int v44 = [(MBCKBackupEngine *)self currentSnapshot];
  if (!v44) {
    __assert_rtn("-[MBCKBackupEngine synchronizeFileListsWithError:]", "MBCKBackupEngine.m", 917, "currentSnapshot");
  }
  __int16 v41 = [(MBCKEngine *)self persona];
  if (!v41) {
    __assert_rtn("-[MBCKBackupEngine synchronizeFileListsWithError:]", "MBCKBackupEngine.m", 919, "persona");
  }
  v38 = [(MBCKEngine *)self device];
  if (!v38) {
    __assert_rtn("-[MBCKBackupEngine synchronizeFileListsWithError:]", "MBCKBackupEngine.m", 921, "device");
  }
  v37 = [(MBCKEngine *)self ckOperationTracker];
  if (!v37) {
    __assert_rtn("-[MBCKBackupEngine synchronizeFileListsWithError:]", "MBCKBackupEngine.m", 923, "tracker");
  }
  [v44 snapshotFormat];
  int v4 = MBSnapshotFormatContainsFileLists();
  unsigned __int8 v5 = [(MBCKBackupEngine *)self previousSnapshot];
  [v5 snapshotFormat];
  if (MBSnapshotFormatContainsFileLists())
  {
    uint64_t v6 = [v5 commitID];
    if (!v6) {
      __assert_rtn("-[MBCKBackupEngine synchronizeFileListsWithError:]", "MBCKBackupEngine.m", 930, "previousSnapshotCommitID");
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  v40 = (void *)v6;
  v43 = [v41 snapshotDatabaseDirectory];
  double v42 = [v44 commitID];
  id v53 = 0;
  v39 = +[MBPendingSnapshotDB openOrCreateDatabaseIn:v43 commitID:v42 readonly:0 error:&v53];
  id v7 = v53;
  unsigned __int8 v8 = v7;
  if (v39)
  {
    -[MBCKBackupEngine setPendingSnapshotDatabase:](self, "setPendingSnapshotDatabase:");
    char v9 = v4 ^ 1;
    if (!v40) {
      char v9 = 1;
    }
    if (v9)
    {
      v35 = +[NSSet setWithObject:v42];
    }
    else
    {
      v62[0] = v42;
      v62[1] = v40;
      id v10 = +[NSArray arrayWithObjects:v62 count:2];
      v35 = +[NSSet setWithArray:v10];
    }
    MBDeleteSnapshotDirectoriesNotBelongingToSnapshots(v43, v35);
    if (MBCreateSymlinksForPendingAndLatestSnapshots(v43, v42, v40, a3))
    {
      if (v40) {
        int v14 = v4;
      }
      else {
        int v14 = 0;
      }
      if (v14 != 1)
      {
        BOOL v13 = 1;
        goto LABEL_57;
      }
      if ([v39 clearDomainsFromPreviousSnapshot:a3])
      {
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v58 = 0x3032000000;
        unsigned __int8 v59 = sub_100087880;
        v60 = sub_100087890;
        id v61 = 0;
        uint64_t v15 = [v38 snapshots];
        uint64_t v34 = MBGetLatestDomainRecordReferencesFromSnapshots((void *)v15);

        id v16 = [v38 hmacKey];
        double v17 = [(MBCKBackupEngine *)self attemptSummary];
        id v52 = v8;
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_100087898;
        v49[3] = &unk_1004118E0;
        id v32 = v39;
        id v50 = v32;
        p_long long buf = &buf;
        LOBYTE(v15) = MBSynchronizeFileListsWithSnapshotDirectory(v43, v40, v16, v34, v37, v17, &v52, v49);
        id v33 = v52;

        if (v15)
        {

          if (!*(void *)(*((void *)&buf + 1) + 40))
          {
            v31 = [v38 domainHMACsToRepair];
            if (![v31 count]) {
              goto LABEL_51;
            }
            long long v47 = 0u;
            long long v48 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            id v21 = [v38 domainHMACsToRepair];
            id v22 = [v21 countByEnumeratingWithState:&v45 objects:v54 count:16];
            if (v22)
            {
              uint64_t v23 = *(void *)v46;
              do
              {
                for (i = 0; i != v22; i = (char *)i + 1)
                {
                  id v25 = v5;
                  if (*(void *)v46 != v23) {
                    objc_enumerationMutation(v21);
                  }
                  uint64_t v26 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                  v27 = MBGetDefaultLog();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)v55 = 138412290;
                    id v56 = v26;
                    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "=cloud-backup= =domain repair= Found domain HMAC to repair %@", v55, 0xCu);
                    _MBLog();
                  }

                  unsigned __int8 v5 = v25;
                }
                id v22 = [v21 countByEnumeratingWithState:&v45 objects:v54 count:16];
              }
              while (v22);
            }

            if (([v32 addDomainHMACsToRepair:v31 error:a3] & 1) == 0)
            {
              v28 = MBGetDefaultLog();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                id v29 = *a3;
                *(_DWORD *)v55 = 138412290;
                id v56 = v29;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "=cloud-backup= =domain repair= Failed to add repair domains to pending snapshot database: %@", v55, 0xCu);
                _MBLog();
              }

              BOOL v13 = 0;
            }
            else
            {
LABEL_51:
              BOOL v13 = 1;
            }

            goto LABEL_56;
          }
          double v18 = MBGetDefaultLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            char v19 = *(void **)(*((void *)&buf + 1) + 40);
            *(_DWORD *)v55 = 138412290;
            id v56 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to add domains into pending snapshot database: %@", v55, 0xCu);
            _MBLog();
          }

          if (a3)
          {
            BOOL v13 = 0;
            *a3 = *(id *)(*((void *)&buf + 1) + 40);
LABEL_56:

            _Block_object_dispose(&buf, 8);
            unsigned __int8 v8 = v33;
            goto LABEL_57;
          }
        }
        else
        {
          if (a3) {
            *a3 = v33;
          }
          BOOL v20 = MBGetDefaultLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v55 = 138412290;
            id v56 = v33;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to synchronize file lists: %@", v55, 0xCu);
            _MBLog();
          }
        }
        BOOL v13 = 0;
        goto LABEL_56;
      }
    }
    BOOL v13 = 0;
LABEL_57:
    objc_super v12 = v35;
    goto LABEL_58;
  }
  if (a3) {
    *a3 = v7;
  }
  unsigned int v11 = MBGetDefaultLog();
  objc_super v12 = v11;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to create pending snapshot database: %@", (uint8_t *)&buf, 0xCu);
    _MBLog();
    BOOL v13 = 0;
    objc_super v12 = v11;
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_58:

  return v13;
}

- (BOOL)_loadDomainsFromVolumesToBackUpWithError:(id *)a3
{
  uint64_t v5 = [(MBCKEngine *)self persona];
  if (!v5) {
    __assert_rtn("-[MBCKBackupEngine _loadDomainsFromVolumesToBackUpWithError:]", "MBCKBackupEngine.m", 1005, "persona");
  }
  uint64_t v6 = (void *)v5;
  uint64_t v7 = [(MBCKEngine *)self serviceAccount];
  if (!v7) {
    __assert_rtn("-[MBCKBackupEngine _loadDomainsFromVolumesToBackUpWithError:]", "MBCKBackupEngine.m", 1007, "serviceAccount");
  }
  unsigned __int8 v8 = (void *)v7;
  char v9 = [MBAppManager alloc];
  id v10 = [(MBCKEngine *)self context];
  unsigned int v11 = [v10 mobileInstallation];
  objc_super v12 = [(MBAppManager *)v9 initWithMobileInstallation:v11];

  if (!v12) {
    __assert_rtn("-[MBCKBackupEngine _loadDomainsFromVolumesToBackUpWithError:]", "MBCKBackupEngine.m", 1010, "appManager");
  }
  objc_storeStrong((id *)&self->super.super._appManager, v12);
  BOOL v13 = self->super.super._domainManager;
  if (!v13) {
    __assert_rtn("-[MBCKBackupEngine _loadDomainsFromVolumesToBackUpWithError:]", "MBCKBackupEngine.m", 1014, "domainManager");
  }
  int v14 = v13;
  if (MBBackupReasonIsScheduled())
  {
    if (![(MBAppManager *)v12 loadAppsWithPersona:v6 safeHarbors:1 error:a3])
    {
      BOOL v18 = 0;
      goto LABEL_15;
    }
    uint64_t v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Removing old safe harbors", v23, 2u);
      _MBLog();
    }

    id v16 = [(MBCKEngine *)self context];
    [v16 safeHarborExpiration];
    -[MBAppManager removeOldSafeHarborsWithExpiration:](v12, "removeOldSafeHarborsWithExpiration:");
  }
  else
  {
    unsigned int v17 = [(MBAppManager *)v12 loadAppsWithPersona:v6 safeHarbors:0 error:a3];
    BOOL v18 = 0;
    if (!v17) {
      goto LABEL_15;
    }
  }
  char v19 = [(MBCKEngine *)self serviceManager];
  [(MBDomainManager *)v14 addDomainsToBackUpToiCloudWithAppManager:v12 manager:v19 account:v8];

  [(MBAppManager *)v12 removeStaleStateForUninstalledAppsForPersona:v6];
  if (MBIsInternalInstall())
  {
    BOOL v20 = +[MBBehaviorOptions sharedOptions];
    id v21 = [v20 domainsToBackUpRegex];
    [(MBDomainManager *)v14 removeDomainsNotMatchingRegex:v21];
  }
  BOOL v18 = 1;
LABEL_15:

  return v18;
}

- (BOOL)_updateDomainListInPendingSnapshotDatabase:(id *)a3
{
  uint64_t v5 = [(MBCKEngine *)self persona];
  if (!v5) {
    __assert_rtn("-[MBCKBackupEngine _updateDomainListInPendingSnapshotDatabase:]", "MBCKBackupEngine.m", 1040, "persona");
  }
  uint64_t v6 = (void *)v5;
  uint64_t v7 = [(MBCKBackupEngine *)self pendingSnapshotDatabase];
  if (!v7) {
    __assert_rtn("-[MBCKBackupEngine _updateDomainListInPendingSnapshotDatabase:]", "MBCKBackupEngine.m", 1042, "pendingSnapshotDatabase");
  }
  unsigned __int8 v8 = (void *)v7;
  uint64_t v9 = [(MBEngine *)self domainManager];
  if (!v9) {
    __assert_rtn("-[MBCKBackupEngine _updateDomainListInPendingSnapshotDatabase:]", "MBCKBackupEngine.m", 1044, "domainManager");
  }
  id v10 = (void *)v9;
  unsigned int v11 = [(MBCKBackupEngine *)self currentSnapshot];
  if (!v11) {
    __assert_rtn("-[MBCKBackupEngine _updateDomainListInPendingSnapshotDatabase:]", "MBCKBackupEngine.m", 1046, "currentSnapshot");
  }
  objc_super v12 = v11;
  [v11 snapshotFormat];
  if (!MBSnapshotFormatContainsFileLists())
  {
    BOOL v38 = 1;
    goto LABEL_47;
  }
  id v60 = 0;
  unsigned __int8 v13 = [v8 markAllDomainsAsNotOnDisk:&v60];
  int v14 = v60;
  uint64_t v15 = v14;
  if ((v13 & 1) == 0)
  {
    v39 = MBGetDefaultLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      v62 = v15;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to mark all domains as not on disk: %@", buf, 0xCu);
      _MBLog();
    }

    if (a3)
    {
      uint64_t v15 = v15;
      BOOL v38 = 0;
      *a3 = v15;
    }
    else
    {
      BOOL v38 = 0;
    }
    goto LABEL_46;
  }
  id v50 = v14;
  id v52 = v12;
  v49 = [v12 commitID];
  id v16 = [(MBCKBackupEngine *)self previousSnapshot];
  id v53 = [v16 commitID];

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v47 = v10;
  id obj = [v10 allDomains];
  id v17 = [obj countByEnumeratingWithState:&v56 objects:v68 count:16];
  long long v48 = v6;
  if (!v17) {
    goto LABEL_31;
  }
  id v18 = v17;
  uint64_t v19 = *(void *)v57;
  v51 = v8;
  do
  {
    BOOL v20 = 0;
    do
    {
      if (*(void *)v57 != v19) {
        objc_enumerationMutation(obj);
      }
      id v21 = *(void **)(*((void *)&v56 + 1) + 8 * (void)v20);
      if ((objc_msgSend(v21, "isPlaceholderAppDomain", v44, v45, v46) & 1) == 0)
      {
        id v22 = [v21 name];
        unsigned __int8 v23 = [v8 markDomainAsPresentOnDisk:v22 error:a3];

        if ((v23 & 1) == 0)
        {
          v40 = MBGetDefaultLog();
          uint64_t v15 = v50;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v62 = v50;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to mark domains as present on disk: %@", buf, 0xCu);
            _MBLog();
          }

          id v10 = v47;
          uint64_t v6 = v48;
          objc_super v12 = v52;
          if (a3)
          {
            uint64_t v15 = v50;
            *a3 = v15;
          }
          goto LABEL_42;
        }
        if (v53)
        {
          uint64_t v24 = a3;
          [v52 type];
          unsigned int IsFull = MBSnapshotTypeIsFull();
          uint64_t v26 = [(MBCKBackupEngine *)self previousSnapshot];
          BOOL v27 = MBSnapshotsAreTransitioningFormats(v26, v52);

          [v52 type];
          if ((MBSnapshotTypeIsFull() & 1) != 0
            || ([(MBCKBackupEngine *)self previousSnapshot],
                v28 = objc_claimAutoreleasedReturnValue(),
                BOOL v29 = MBSnapshotsAreTransitioningFormats(v28, v52),
                v28,
                v29))
          {
            uint64_t v30 = MBGetDefaultLog();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              v31 = [v21 name];
              *(_DWORD *)long long buf = 138412802;
              v62 = v31;
              __int16 v63 = 1024;
              *(_DWORD *)v64 = IsFull;
              *(_WORD *)&v64[4] = 1024;
              *(_DWORD *)&v64[6] = v27;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "=cloud-backup= Not cloning file list for %@ isFullBackup:%d isTransitioningFormats:%d", buf, 0x18u);

              id v32 = [v21 name];
              uint64_t v45 = IsFull;
              BOOL v46 = v27;
              unsigned int v44 = v32;
              _MBLog();
              unsigned __int8 v8 = v51;
              a3 = v24;
              goto LABEL_24;
            }
            unsigned __int8 v8 = v51;
            a3 = v24;
          }
          else
          {
            uint64_t v30 = [v21 name];
            id v33 = [(MBCKEngine *)self device];
            unsigned int v34 = [v33 shouldRepairDomain:v30];

            if (v34)
            {
              [(MBBackupAttemptSummary *)self->_attemptSummary trackSkippedFileListCloneDomain:v30];
              id v32 = MBGetDefaultLog();
              a3 = v24;
              if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138412290;
                v62 = v30;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "=cloud-backup= =domain repair= Not cloning file list for domain pending repair: %@", buf, 0xCu);
                unsigned int v44 = v30;
                _MBLog();
              }
              unsigned __int8 v8 = v51;
LABEL_24:
            }
            else
            {
              v35 = [v48 snapshotDatabaseDirectory];
              v55 = v50;
              char v36 = MBCloneFileListDB(v35, v53, v49, v30, (uint64_t)&v55);
              uint64_t v15 = v55;

              a3 = v24;
              if ((v36 & 1) == 0)
              {
                v43 = MBGetDefaultLog();
                unsigned __int8 v8 = v51;
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 138413058;
                  v62 = v53;
                  __int16 v63 = 2112;
                  *(void *)v64 = v49;
                  *(_WORD *)&v64[8] = 2112;
                  v65 = v30;
                  __int16 v66 = 2112;
                  v67 = v15;
                  _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to clone FileListDatabase for (%@, %@, %@): %@", buf, 0x2Au);
                  _MBLog();
                }

                uint64_t v6 = v48;
                if (v24) {
                  *uint64_t v24 = v15;
                }

                id v10 = v47;
                objc_super v12 = v52;
LABEL_42:

                goto LABEL_43;
              }
              id v50 = v15;
              unsigned __int8 v8 = v51;
            }
          }
        }
      }
      BOOL v20 = (char *)v20 + 1;
    }
    while (v18 != v20);
    id v37 = [obj countByEnumeratingWithState:&v56 objects:v68 count:16];
    id v18 = v37;
  }
  while (v37);
LABEL_31:

  uint64_t v6 = v48;
  if ([v8 truncateDomainsNotPresentOnDisk:a3])
  {
    BOOL v38 = 1;
    id v10 = v47;
    objc_super v12 = v52;
    uint64_t v15 = v50;
  }
  else
  {
    double v42 = MBGetDefaultLog();
    id v10 = v47;
    objc_super v12 = v52;
    uint64_t v15 = v50;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      v62 = v50;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to truncate domains not present on disk: %@", buf, 0xCu);
      _MBLog();
    }

    if (a3)
    {
      uint64_t v15 = v50;
      BOOL v38 = 0;
      *a3 = v15;
    }
    else
    {
LABEL_43:
      BOOL v38 = 0;
    }
  }

LABEL_46:
LABEL_47:

  return v38;
}

- (BOOL)createVolumeSnapshots:(id *)a3
{
  uint64_t v5 = [(MBCKEngine *)self persona];
  if (!v5) {
    __assert_rtn("-[MBCKBackupEngine createVolumeSnapshots:]", "MBCKBackupEngine.m", 1109, "persona");
  }
  uint64_t v6 = (void *)v5;
  id v23 = 0;
  unsigned __int8 v7 = [(MBCKBackupEngine *)self _loadDomainsFromVolumesToBackUpWithError:&v23];
  id v8 = v23;
  if (v7)
  {
    uint64_t v9 = [v6 volumesToBackUp];
    id v22 = v8;
    id v10 = +[MBFSEventState stateForVolumeMountPoints:v9 error:&v22];
    id v11 = v22;

    if (!v10)
    {
      if (MBIsInternalInstall())
      {
        objc_super v12 = MBGetDefaultLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v25 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "=cloud-backup= =cloud-backup= Failed to fetch next backup FSEvent state: %@", buf, 0xCu);
          id v20 = v11;
          _MBLog();
        }
      }
      id v11 = 0;
    }
    -[MBCKBackupEngine setNextBackupFSEventState:](self, "setNextBackupFSEventState:", v10, v20);
    id v21 = v11;
    unsigned __int8 v13 = [(MBCKBackupEngine *)self _mountSnapshotsWithError:&v21];
    id v8 = v21;

    if (v13)
    {
      int v14 = [(MBCKBackupEngine *)self mountedSnapshotTracker];
      uint64_t v15 = [v14 mountedSnapshots];
      if (![v15 count]) {
        __assert_rtn("-[MBCKBackupEngine createVolumeSnapshots:]", "MBCKBackupEngine.m", 1135, "self.mountedSnapshotTracker.mountedSnapshots.count > 0");
      }

      BOOL v16 = [(MBCKBackupEngine *)self _updateDomainListInPendingSnapshotDatabase:a3];
    }
    else
    {
      id v18 = MBGetDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v25 = v8;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to mount the APFS snapshots %@", buf, 0xCu);
        _MBLog();
      }

      BOOL v16 = 0;
      if (a3) {
        *a3 = v8;
      }
    }
  }
  else
  {
    id v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to load domains to back up", buf, 2u);
      _MBLog();
    }

    if (a3)
    {
      id v8 = v8;
      BOOL v16 = 0;
      *a3 = v8;
    }
    else
    {
      BOOL v16 = 0;
    }
  }

  return v16;
}

- (BOOL)_mountSnapshotsWithError:(id *)a3
{
  int v4 = [(MBCKEngine *)self persona];
  uint64_t v5 = [v4 volumesToBackUp];

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v61 objects:v74 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v62;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v62 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v61 + 1) + 8 * i);
        if (MBIsInternalInstall())
        {
          objc_super v12 = +[NSDate dateWithTimeIntervalSinceNow:-2592000.0];
          +[MBFileSystemManager deleteAllSnapshotsForVolume:v11 withPrefix:@"com.appleinternal.mobilebackup" latestCreationDate:v12 error:0];
        }
        if ((+[MBFileSystemManager volumeSupportsLocalSnapshots:v11] & 1) == 0)
        {
          if (a3)
          {
            +[MBError errorWithCode:1 format:@"File system doesn't support local snapshot"];
            BOOL v37 = 0;
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            BOOL v37 = 0;
          }
          char v36 = v6;
          goto LABEL_49;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v61 objects:v74 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  unsigned int v44 = objc_opt_new();
  unsigned __int8 v13 = [(MBCKEngine *)self device];
  uint64_t v14 = [v13 pendingSnapshotRecordID];

  double v42 = (void *)v14;
  uint64_t v15 = MBSnapshotName();
  BOOL v16 = MBiCloudUserSessionSnapshotMountPoints();
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v17 = [v16 countByEnumeratingWithState:&v57 objects:v73 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v58;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v58 != v19) {
          objc_enumerationMutation(v16);
        }
        +[MBFileSystemManager unmount:*(void *)(*((void *)&v57 + 1) + 8 * (void)j) error:a3];
      }
      id v18 = [v16 countByEnumeratingWithState:&v57 objects:v73 count:16];
    }
    while (v18);
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v21 = v6;
  id v22 = [v21 countByEnumeratingWithState:&v53 objects:v72 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v54;
    do
    {
      for (k = 0; k != v23; k = (char *)k + 1)
      {
        if (*(void *)v54 != v24) {
          objc_enumerationMutation(v21);
        }
        +[MBFileSystemManager deleteAllSnapshotsForVolume:*(void *)(*((void *)&v53 + 1) + 8 * (void)k) withPrefix:@"com.apple.mobilebackup" error:0];
      }
      id v23 = [v21 countByEnumeratingWithState:&v53 objects:v72 count:16];
    }
    while (v23);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v21;
  id v26 = [obj countByEnumeratingWithState:&v49 objects:v71 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v45 = *(void *)v50;
    while (2)
    {
      for (m = 0; m != v27; m = (char *)m + 1)
      {
        id v29 = v6;
        if (*(void *)v50 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = *(void **)(*((void *)&v49 + 1) + 8 * (void)m);
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_100088DBC;
        v47[3] = &unk_100411908;
        v47[4] = self;
        id v48 = 0;
        v31 = +[MBFileSystemManager createAndMountSnapshotForVolume:name:atFirstAvailableMountPoint:error:cancelationHandler:](MBFileSystemManager, "createAndMountSnapshotForVolume:name:atFirstAvailableMountPoint:error:cancelationHandler:", v30, v15, v16, &v48, v47, v39, v40, v41, v42);
        id v32 = v48;
        id v33 = v32;
        if (v31)
        {
          unsigned int v34 = MBGetDefaultLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543874;
            __int16 v66 = v15;
            __int16 v67 = 2112;
            v68 = v30;
            __int16 v69 = 2114;
            unsigned int v70 = v31;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Snapshot %{public}@ for %@ was mounted successfully at %{public}@", buf, 0x20u);
            v40 = v30;
            __int16 v41 = v31;
            v39 = v15;
            _MBLog();
          }

          [v44 trackSnapshotForVolume:v30 snapshotName:v15 mountPoint:v31];
        }
        else
        {
          if (a3) {
            *a3 = v32;
          }
          v35 = MBGetDefaultLog();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138543618;
            __int16 v66 = v15;
            __int16 v67 = 2114;
            v68 = v33;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to create and mount the APFS snapshot (%{public}@): %{public}@", buf, 0x16u);
            v39 = v15;
            v40 = v33;
            _MBLog();
          }
        }
        if (!v31)
        {

          BOOL v37 = 0;
          id v6 = v29;
          char v36 = v44;
          goto LABEL_46;
        }
        id v6 = v29;
      }
      id v27 = [obj countByEnumeratingWithState:&v49 objects:v71 count:16];
      if (v27) {
        continue;
      }
      break;
    }
  }

  char v36 = v44;
  [(MBCKBackupEngine *)self setMountedSnapshotTracker:v44];
  BOOL v37 = 1;
LABEL_46:

LABEL_49:
  return v37;
}

- (void)_saveLastPendingSnapshotSize:(unint64_t)a3
{
  uint64_t v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    CFStringRef v9 = @"LastPendingSnapshotSize";
    __int16 v10 = 2048;
    unint64_t v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Saving %{public}@: %llu", buf, 0x16u);
    _MBLog();
  }

  id v6 = [(MBCKEngine *)self persona];
  id v7 = +[NSNumber numberWithUnsignedLongLong:a3];
  [v6 setPreferencesValue:v7 forKey:@"LastPendingSnapshotSize"];
}

+ (BOOL)_startOTABackupWithAccount:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (!v5) {
    __assert_rtn("+[MBCKBackupEngine _startOTABackupWithAccount:error:]", "MBCKBackupEngine.m", 1204, "account");
  }
  if (!a4) {
    __assert_rtn("+[MBCKBackupEngine _startOTABackupWithAccount:error:]", "MBCKBackupEngine.m", 1205, "error");
  }
  id v6 = v5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [v5 persona];
  id v8 = [v7 volumesToBackUp];

  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v14 = +[MBFileSystemManager volumeUUIDWithVolumeMountPoint:v13 error:a4];
        if (!v14)
        {
          id v17 = MBGetDefaultLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            id v18 = *a4;
            *(_DWORD *)long long buf = 138543618;
            uint64_t v25 = v13;
            __int16 v26 = 2112;
            id v27 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to fetch the volume UUID for %{public}@: %@", buf, 0x16u);
            _MBLog();
          }

          BOOL v16 = 0;
          goto LABEL_15;
        }
        uint64_t v15 = (void *)v14;
        +[MBKeyBag startOTABackupForVolumeUUID:v14];
      }
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_15:

  return v16;
}

+ (BOOL)_stopOTABackupWithAccount:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (!v5) {
    __assert_rtn("+[MBCKBackupEngine _stopOTABackupWithAccount:error:]", "MBCKBackupEngine.m", 1219, "account");
  }
  if (!a4) {
    __assert_rtn("+[MBCKBackupEngine _stopOTABackupWithAccount:error:]", "MBCKBackupEngine.m", 1220, "error");
  }
  id v6 = v5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [v5 persona];
  id v8 = [v7 volumesToBackUp];

  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v14 = +[MBFileSystemManager volumeUUIDWithVolumeMountPoint:v13 error:a4];
        if (!v14)
        {
          id v17 = MBGetDefaultLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            id v18 = *a4;
            *(_DWORD *)long long buf = 138543618;
            uint64_t v25 = v13;
            __int16 v26 = 2112;
            id v27 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to fetch the volume UUID for %{public}@: %@", buf, 0x16u);
            _MBLog();
          }

          BOOL v16 = 0;
          goto LABEL_15;
        }
        uint64_t v15 = (void *)v14;
        +[MBKeyBag stopOTABackupForVolumeUUID:v14];
      }
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_15:

  return v16;
}

- (BOOL)findChangesWithError:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBCKBackupEngine findChangesWithError:]", "MBCKBackupEngine.m", 1233, "error");
  }
  uint64_t v5 = [(MBCKEngine *)self serviceAccount];
  if (!v5) {
    __assert_rtn("-[MBCKBackupEngine findChangesWithError:]", "MBCKBackupEngine.m", 1235, "serviceAccount");
  }
  id v6 = (void *)v5;
  uint64_t v7 = [(MBCKEngine *)self persona];
  if (!v7) {
    __assert_rtn("-[MBCKBackupEngine findChangesWithError:]", "MBCKBackupEngine.m", 1237, "persona");
  }
  id v8 = (void *)v7;
  id v9 = self->super.super._domainManager;
  if (!v9) {
    __assert_rtn("-[MBCKBackupEngine findChangesWithError:]", "MBCKBackupEngine.m", 1239, "domainManager");
  }
  id v10 = v9;
  uint64_t v11 = [(MBCKBackupEngine *)self pendingSnapshotDatabase];
  if (!v11) {
    __assert_rtn("-[MBCKBackupEngine findChangesWithError:]", "MBCKBackupEngine.m", 1241, "pendingSnapshotDatabase");
  }
  objc_super v12 = (void *)v11;
  uint64_t v13 = MBGetDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v13;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Scanning files for changes", buf, 2u);
    }

    _MBLog();
  }

  if ([(MBCKEngine *)self handleCancelation:a3])
  {
    BOOL v15 = 0;
    goto LABEL_188;
  }
  if (MBSnapshotFormatContainsManifests())
  {
    BOOL v16 = [(MBCKEngine *)self cache];
    id v17 = [v16 removeAllFilesMissingEncryptionKeys];

    if (v17)
    {
      id v18 = MBGetDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)unsigned __int8 v197 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "=cloud-backup= Could not remove all missing encryption keys from the cache: %@", buf, 0xCu);
        _MBLog();
      }

      id v19 = v17;
      BOOL v15 = 0;
      *a3 = v19;
      goto LABEL_187;
    }
  }
  v171 = a3;
  long long v20 = [(MBCKBackupEngine *)self telemetry];
  [v20 setBackupFileCount:&off_100439EA0];

  long long v21 = [(MBCKBackupEngine *)self telemetry];
  [v21 setBackupDirectoryCount:&off_100439EA0];

  long long v22 = [(MBCKBackupEngine *)self telemetry];
  long long v23 = [v22 domainsWithMissingEncryptionKeys];
  [v23 removeAllObjects];

  if ([(MBCKBackupEngine *)self _shouldBackupUsingFSEvents])
  {
    id v19 = [(MBCKBackupEngine *)self _fetchPreviousBackupFSEventState];
  }
  else
  {
    id v19 = 0;
  }
  v163 = v12;
  BOOL v164 = v8;
  v162 = v6;
  BOOL v172 = objc_opt_new();
  v174 = objc_opt_new();
  long long v190 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  v166 = v10;
  id obj = [(MBDomainManager *)v10 allDomains];
  id v24 = [obj countByEnumeratingWithState:&v190 objects:v201 count:16];
  if (!v24)
  {
    v170 = 0;
    id v27 = v172;
    goto LABEL_64;
  }
  id v25 = v24;
  v170 = 0;
  uint64_t v26 = *(void *)v191;
  id v27 = v172;
  while (2)
  {
    v28 = 0;
    v170 = &v170[(void)v25];
    do
    {
      if (*(void *)v191 != v26) {
        objc_enumerationMutation(obj);
      }
      id v29 = [*(id *)(*((void *)&v190 + 1) + 8 * (void)v28) name];
      if (v19)
      {
        [(MBCKSnapshot *)self->_currentSnapshot snapshotFormat];
        char v189 = 0;
        if (MBSnapshotFormatContainsManifests())
        {
          id v30 = v19;
          v31 = [(MBCKEngine *)self cache];
          id v32 = [v31 hasDomainBeenBackedUp:v29 backedUp:&v189];

          if (v32)
          {
            id v33 = MBGetDefaultLog();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v34 = v33;
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412546;
                *(void *)unsigned __int8 v197 = v29;
                *(_WORD *)&v197[8] = 2112;
                id v198 = v32;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Failed to determine whether domain %@ has been backed up:%@", buf, 0x16u);
              }

              double v152 = *(double *)&v29;
              id v157 = v32;
              _MBLog();
            }
          }
          id v19 = v30;
          id v27 = v172;
        }
        char v188 = 0;
        if (MBSnapshotFormatContainsFileLists())
        {
          v35 = [(MBCKBackupEngine *)self pendingSnapshotDatabase];
          unsigned int v36 = [v35 isDomainInPreviousSnapshot:v29 outResult:&v188 error:v171];

          if (!v36)
          {
            BOOL v15 = 0;
            id v6 = v162;
            id v8 = v164;
            id v10 = v166;
            goto LABEL_186;
          }
        }
        if (v189) {
          BOOL v37 = v188 == 0;
        }
        else {
          BOOL v37 = 1;
        }
        int v38 = !v37;
        if (v37)
        {
          v39 = MBGetDefaultLog();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            v40 = v39;
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              *(void *)unsigned __int8 v197 = v29;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "=cloud-backup= Forcing a scan on new domain %@", buf, 0xCu);
            }

            double v152 = *(double *)&v29;
            _MBLog();
          }
        }
      }
      else
      {
        int v38 = 0;
      }
      __int16 v41 = [(MBCKEngine *)self device];
      unsigned int v42 = [v41 shouldRepairDomain:v29];

      if (v42)
      {
        v43 = [(MBCKEngine *)self device];
        unsigned int v44 = [v43 hmacKey];
        uint64_t v45 = MBDomainHMACForDomainName((uint64_t)v29, (uint64_t)v44);
        [v27 addObject:v45];

        BOOL v46 = MBGetDefaultLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          long long v47 = v46;
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "=cloud-backup= =domain repair= Forcing a scan on domain pending repair", buf, 2u);
          }

          _MBLog();
        }
      }
      else if (v38)
      {
        [v174 markUnmodifiedDomain:v29];
        goto LABEL_59;
      }
      [v174 markModifiedDomain:v29];
LABEL_59:

      v28 = (char *)v28 + 1;
    }
    while (v25 != v28);
    id v25 = [obj countByEnumeratingWithState:&v190 objects:v201 count:16];
    if (v25) {
      continue;
    }
    break;
  }
LABEL_64:

  if ([v27 count])
  {
    id v48 = [(MBCKEngine *)self device];
    [v48 setDomainHMACsToRepairOnDisk:v27];
  }
  id v8 = v164;
  id v10 = v166;
  if (v19)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    v187[0] = _NSConcreteStackBlock;
    v187[1] = 3221225472;
    v187[2] = sub_10008AB78;
    v187[3] = &unk_100411908;
    v187[4] = self;
    +[MBFSEventCollector markModificationsWith:v174 since:v19 domainManager:v166 persona:v164 cancellationHandler:v187];
    double v50 = CFAbsoluteTimeGetCurrent() - Current;
    long long v51 = MBGetDefaultLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      long long v52 = v51;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        *(double *)unsigned __int8 v197 = v50;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Finished collecting FSEvents in %.3fs", buf, 0xCu);
      }

      double v152 = v50;
      _MBLog();
    }

    long long v53 = [(MBCKBackupEngine *)self telemetry];
    [v53 setFseventDuration:v50];
  }
  objc_msgSend(v174, "unmodifiedDomainNames", *(void *)&v152);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  long long v54 = MBGetDefaultLog();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    long long v55 = v54;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      id v56 = [obj count];
      *(_DWORD *)long long buf = 134218498;
      *(void *)unsigned __int8 v197 = v56;
      *(_WORD *)&v197[8] = 2048;
      id v198 = v170;
      __int16 v199 = 2112;
      id v200 = obj;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Unmodified domains: (%lu/%lu) %@", buf, 0x20u);
    }

    id v157 = v170;
    id v158 = obj;
    id v153 = [obj count];
    _MBLog();
  }

  id v29 = [v174 modifiedDomainNames];
  long long v57 = MBGetDefaultLog();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    long long v58 = v57;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      id v59 = [v29 count];
      *(_DWORD *)long long buf = 134218498;
      *(void *)unsigned __int8 v197 = v59;
      *(_WORD *)&v197[8] = 2048;
      id v198 = v170;
      __int16 v199 = 2112;
      id v200 = v29;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Modified domains: (%lu/%lu) %@", buf, 0x20u);
    }

    id v157 = v170;
    id v158 = v29;
    id v153 = [v29 count];
    _MBLog();
  }
  id v169 = v19;

  long long v60 = (char *)[obj count];
  if (&v60[(void)[v29 count]] != v170) {
    __assert_rtn("-[MBCKBackupEngine findChangesWithError:]", "MBCKBackupEngine.m", 1336, "unmodifiedDomainNames.count + modifiedDomainNames.count == enabledDomainsCount");
  }
  [(MBCKSnapshot *)self->_currentSnapshot snapshotFormat];
  if (!MBSnapshotFormatContainsManifests()) {
    goto LABEL_91;
  }
  long long v61 = [(MBCKEngine *)self cache];
  long long v62 = [v61 markAllFileChangesAsDeleted];

  if (v62)
  {
    long long v63 = MBGetDefaultLog();
    id v6 = v162;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)unsigned __int8 v197 = v62;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to mark file changes as deleted: %@", buf, 0xCu);
      _MBLog();
    }
    goto LABEL_90;
  }
  long long v64 = [(MBCKEngine *)self cache];
  long long v62 = [v64 markFileChangesAsUnmodifiedForDomainNames:obj];

  if (!v62)
  {
LABEL_91:
    __int16 v66 = objc_opt_new();
    long long v183 = 0u;
    long long v184 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    id v29 = v29;
    id v67 = [v29 countByEnumeratingWithState:&v183 objects:v195 count:16];
    if (v67)
    {
      id v68 = v67;
      uint64_t v69 = *(void *)v184;
      do
      {
        for (i = 0; i != v68; i = (char *)i + 1)
        {
          if (*(void *)v184 != v69) {
            objc_enumerationMutation(v29);
          }
          uint64_t v71 = -[MBDomainManager domainForName:](self->super.super._domainManager, "domainForName:", *(void *)(*((void *)&v183 + 1) + 8 * i), v153, v157, v158);
          if (!v71) {
            __assert_rtn("-[MBCKBackupEngine findChangesWithError:]", "MBCKBackupEngine.m", 1360, "domain");
          }
          v72 = (void *)v71;
          [v66 addObject:v71];
        }
        id v68 = [v29 countByEnumeratingWithState:&v183 objects:v195 count:16];
      }
      while (v68);
    }

    CFStringRef v73 = +[MBBehaviorOptions sharedOptions];
    id v74 = [v73 domainsToSendInvalidChecksumRegex];
    id v75 = [v74 length];

    if (v75)
    {
      long long v181 = 0u;
      long long v182 = 0u;
      long long v179 = 0u;
      long long v180 = 0u;
      id v76 = v66;
      id v77 = [v76 countByEnumeratingWithState:&v179 objects:v194 count:16];
      if (v77)
      {
        id v78 = v77;
        uint64_t v79 = *(void *)v180;
        while (2)
        {
          for (j = 0; j != v78; j = (char *)j + 1)
          {
            if (*(void *)v180 != v79) {
              objc_enumerationMutation(v76);
            }
            v81 = objc_msgSend(*(id *)(*((void *)&v179 + 1) + 8 * (void)j), "name", v153);
            BOOL v82 = MBShouldSendInvalidChecksumForDomain(v81);

            if (v82)
            {
              [(MBCKSnapshot *)self->_currentSnapshot setTestCommitRepairChecksumOnLightrailChecksumMismatch:1];
              goto LABEL_110;
            }
          }
          id v78 = [v76 countByEnumeratingWithState:&v179 objects:v194 count:16];
          if (v78) {
            continue;
          }
          break;
        }
      }
LABEL_110:

      id v8 = v164;
    }
    if ((id)[(MBEngine *)self backupPolicy] != (id)1
      || ![v8 isPersonalPersona])
    {
LABEL_135:
      +[NSDate timeIntervalSinceReferenceDate];
      double v98 = v97;
      id v6 = v162;
      if (![(MBCKSnapshot *)self->_currentSnapshot type]
        && ![(id)objc_opt_class() _startOTABackupWithAccount:v162 error:v171])
      {
        BOOL v15 = 0;
        id v10 = v166;
LABEL_185:

        goto LABEL_186;
      }
      v99 = [MBSkippedFileTracker alloc];
      unsigned int v100 = [v8 skippedFileRecordsPlistPath];
      v101 = [(MBSkippedFileTracker *)v99 initWithPlistPath:v100];
      [(MBCKBackupEngine *)self setSkippedFileTracker:v101];

      [v66 sortUsingComparator:&stru_100411928];
      v102 = MBGetDefaultLog();
      if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      {
        v103 = v102;
        if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
        {
          id v104 = [v66 valueForKey:@"name"];
          *(_DWORD *)long long buf = 138412290;
          *(void *)unsigned __int8 v197 = v104;
          _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Scanning domains: %@", buf, 0xCu);
        }
        double v155 = [v66 valueForKey:@"name"];
        _MBLog();
      }
      v105 = [(MBCKBackupEngine *)self mountedSnapshotTracker];
      id v106 = [(MBCKBackupEngine *)self _createDomainTranscriberForAPFSSnapshots:v105 error:v171];

      if (!v106)
      {
        BOOL v15 = 0;
        id v10 = v166;
LABEL_184:

        goto LABEL_185;
      }
      uint64_t v107 = objc_opt_new();
      v108 = [(MBCKBackupEngine *)self pendingSnapshotDatabase];
      v109 = [(MBCKEngine *)self progressModel];
      id v178 = 0;
      id v165 = v106;
      v168 = (void *)v107;
      unsigned __int8 v110 = [v106 scanDomains:v66 pendingSnapshotDatabase:v108 progress:v109 summary:v107 error:&v178];
      id v111 = v178;

      if ((v110 & 1) == 0)
      {
        v116 = v168;
        if (+[MBError isError:v111 withCode:209])
        {
          +[MBCKEncryptionManager trackMissingEncryptionKeyForAccount:v162];
          v119 = [(MBCKBackupEngine *)self attemptSummary];
          [v119 trackDomainTranscription:v168];
        }
        id v120 = v111;
        BOOL v15 = 0;
        id *v171 = v120;
        id v106 = v165;
        id v10 = v166;
        goto LABEL_183;
      }
      +[NSDate timeIntervalSinceReferenceDate];
      double v113 = v112;
      id v177 = v111;
      [(id)objc_opt_class() _stopOTABackupWithAccount:v162 error:&v177];
      id v114 = v177;

      id v176 = v114;
      [(id)objc_opt_class() _startOTABackupWithAccount:v162 error:&v176];
      id v160 = v176;

      v115 = MBGetDefaultLog();
      id v106 = v165;
      v116 = v168;
      if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
      {
        double v117 = v113 - v98;
        BOOL v118 = v115;
        if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134217984;
          *(double *)unsigned __int8 v197 = v117;
          _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Finished scanning for changes in %0.3fs", buf, 0xCu);
        }

        double v155 = v117;
        _MBLog();
      }

      if ([(MBCKEngine *)self handleCancelation:v171])
      {
        BOOL v15 = 0;
        id v10 = v166;
      }
      else
      {
        [(MBCKSnapshot *)self->_currentSnapshot snapshotFormat];
        if (MBSnapshotFormatContainsManifests())
        {

          v121 = [(MBCKEngine *)self cache];
          id v175 = 0;
          id v122 = [v121 countFilesMissingEncryptionKeysWithError:&v175];
          id v161 = v175;

          if (v122)
          {
            id v123 = v122;
            v124 = MBGetDefaultLog();
            id v120 = v161;
            if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
            {
              v125 = v124;
              if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 134217984;
                *(void *)unsigned __int8 v197 = v123;
                _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Found %llu files with missing encryption keys during scan", buf, 0xCu);
              }

              _MBLog();
              v116 = v168;
            }

            +[MBError errorWithCode:209, @"Found %llu files with missing encryption keys during scan", v123 format];
            BOOL v15 = 0;
            id *v171 = (id)objc_claimAutoreleasedReturnValue();
            id v10 = v166;
            goto LABEL_183;
          }
          if (v161)
          {
            id v120 = v161;
            BOOL v15 = 0;
            id *v171 = v120;
            id v10 = v166;
LABEL_183:

            goto LABEL_184;
          }
          id v160 = 0;
        }
        id v10 = v166;
        [(MBCKSnapshot *)self->_currentSnapshot snapshotFormat];
        if (MBSnapshotFormatContainsFileLists())
        {
          +[NSDate timeIntervalSinceReferenceDate];
          double v127 = v126;
          v128 = [(MBCKSnapshot *)self->_previousSnapshot commitID];
          [(MBCKSnapshot *)self->_currentSnapshot type];
          uint64_t IsFull = MBSnapshotTypeIsFull();
          v130 = [(MBCKBackupEngine *)self previousSnapshot];
          BOOL v131 = MBSnapshotsAreTransitioningFormats(v130, self->_currentSnapshot);

          if ((IsFull & 1) != 0 || v131)
          {

            v132 = MBGetDefaultLog();
            if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
            {
              v133 = v132;
              if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 67109376;
                *(_DWORD *)unsigned __int8 v197 = IsFull;
                *(_WORD *)&v197[4] = 1024;
                *(_DWORD *)&v197[6] = v131;
                _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Ignoring previous snapshot from asset copy, isFullBackup:%d isTransitioningFormats:%d", buf, 0xEu);
              }

              double v156 = *(double *)&IsFull;
              id v157 = (char *)v131;
              _MBLog();
            }

            v159 = 0;
          }
          else
          {
            v159 = v128;
          }
          v134 = [(MBCKEngine *)self device];
          int v135 = [(MBEngine *)self appManager];
          unsigned int v136 = [v163 updateDomainListInPlaceholderDomainWithDevice:v134 appManager:v135 error:v171];

          if (!v136) {
            goto LABEL_189;
          }
          v137 = [v8 snapshotDatabaseDirectory];
          v138 = [(MBCKSnapshot *)self->_currentSnapshot commitID];
          v139 = [(MBCKEngine *)self device];
          unsigned int v140 = MBCopyAssetsToUploadIntoPendingSnapshotDatabase(v163, v137, v138, v159, v139, v171);

          if (!v140)
          {
LABEL_189:

            BOOL v15 = 0;
            id v106 = v165;
            id v10 = v166;
            id v19 = v169;
            v116 = v168;
            goto LABEL_182;
          }
          +[NSDate timeIntervalSinceReferenceDate];
          double v142 = v141 - v127;
          v143 = MBGetDefaultLog();
          if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
          {
            v144 = v143;
            if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 134217984;
              *(double *)unsigned __int8 v197 = v142;
              _os_log_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Finished copying assets into pending snapshot database in %.2f s", buf, 0xCu);
            }

            double v156 = v142;
            _MBLog();
          }

          v145 = [(MBCKBackupEngine *)self attemptSummary];
          [v145 setAssetCopyDuration:v142];

          v146 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v66 count]);
          v147 = [(MBCKBackupEngine *)self telemetry];
          [v147 setScannedDomainsCount:v146];

          v148 = +[NSNumber numberWithUnsignedLong:v170];
          v149 = [(MBCKBackupEngine *)self telemetry];
          [v149 setEnabledDomainsCount:v148];

          id v6 = v162;
          id v106 = v165;
          id v10 = v166;
          v116 = v168;
        }
        unsigned __int8 v150 = [(MBCKBackupEngine *)self attemptSummary];
        [v150 trackDomainTranscription:v116];

        BOOL v15 = 1;
      }
      id v19 = v169;
LABEL_182:
      id v120 = v160;
      goto LABEL_183;
    }
    v83 = [v8 volumeMountPoint];
    v84 = [(MBCKBackupEngine *)self mountedSnapshotTracker];
    v85 = [v84 snapshotMountPointForVolumeMountPoint:v83];

    BOOL v86 = +[MBiCloudDrivePlugin backUpiCloudDriveDatabaseManifestForUserVolume:v83 snapshotMountPoint:v85];
    v87 = MBGetDefaultLog();
    unsigned __int8 v88 = v87;
    if (v86)
    {
      if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
        goto LABEL_124;
      }
      int64_t v167 = v85;
      uint64_t v89 = v88;
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)unsigned __int8 v197 = v86;
        _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to save iCloud Drive Manifest: %@", buf, 0xCu);
      }

      v154 = v86;
    }
    else
    {
      if (!os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_124;
      }
      int64_t v167 = v85;
      v90 = v88;
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Saved iCloud Drive Manifest", buf, 2u);
      }
    }
    _MBLog();
    v85 = v167;
LABEL_124:

    v91 = +[MBiCloudDrivePlugin backUpFPFSDatabaseManifestForUserVolume:v83 snapshotMountPoint:v85];

    id v92 = MBGetDefaultLog();
    id v93 = v92;
    if (v91)
    {
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        v94 = v85;
        unsigned int v95 = v93;
        if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)unsigned __int8 v197 = v91;
          _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to save FPFS Manifest: %@", buf, 0xCu);
        }

        v154 = v91;
LABEL_133:
        _MBLog();
        v85 = v94;
      }
    }
    else if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      v94 = v85;
      v96 = v93;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Saved FPFS Manifest", buf, 2u);
      }

      goto LABEL_133;
    }

    goto LABEL_135;
  }
  long long v63 = MBGetDefaultLog();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)unsigned __int8 v197 = v62;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to mark file changes as unmodified: %@", buf, 0xCu);
    _MBLog();
  }
  id v6 = v162;
LABEL_90:

  id v65 = v62;
  id *v171 = v65;

  BOOL v15 = 0;
LABEL_186:

  objc_super v12 = v163;
LABEL_187:

LABEL_188:
  return v15;
}

- (BOOL)reserveQuotaWithError:(id *)a3
{
  uint64_t v5 = [(MBCKEngine *)self persona];
  if (!v5) {
    __assert_rtn("-[MBCKBackupEngine reserveQuotaWithError:]", "MBCKBackupEngine.m", 1495, "persona");
  }
  id v6 = [(MBCKEngine *)self ckOperationTracker];
  if (!v6) {
    __assert_rtn("-[MBCKBackupEngine reserveQuotaWithError:]", "MBCKBackupEngine.m", 1497, "tracker");
  }
  uint64_t v7 = [(MBCKBackupEngine *)self currentSnapshot];
  if (!v7) {
    __assert_rtn("-[MBCKBackupEngine reserveQuotaWithError:]", "MBCKBackupEngine.m", 1499, "currentSnapshot");
  }
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v57 = 0;
  long long v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = 0;
  [v7 snapshotFormat];
  if (MBSnapshotFormatContainsManifests())
  {
    id v9 = [(MBCKEngine *)self cache];
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_10008B4A8;
    v54[3] = &unk_100411950;
    id v55 = v8;
    id v56 = &v57;
    id v10 = [v9 summarizeFileChangesGroupByDomain:v54];

    if (v10)
    {
      uint64_t v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v62 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "=cloud-backup= Error when summarizing file changes:%@", buf, 0xCu);
        _MBLog();
      }

      if (a3) {
        *a3 = v10;
      }

      BOOL v12 = 0;
      id v13 = v55;
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v14 = [(MBCKBackupEngine *)self pendingSnapshotDatabase];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_10008B528;
    v51[3] = &unk_100411978;
    id v52 = v8;
    long long v53 = &v57;
    unsigned __int8 v15 = [v14 fetchQuotaReservationByDomain:a3 block:v51];

    if ((v15 & 1) == 0) {
      goto LABEL_32;
    }
  }
  if ((MBSnapshotTypeIsFull() & 1) == 0 && self->_snapshotType)
  {
    uint64_t v16 = v58[3];
    goto LABEL_18;
  }
  uint64_t v16 = v58[3];
  if (v16)
  {
LABEL_18:
    id v17 = +[NSNumber numberWithUnsignedLongLong:v16];
    id v18 = [(MBCKBackupEngine *)self telemetry];
    [v18 setBackupTotalSize:v17];

    id v19 = +[NSNumber numberWithUnsignedLongLong:v58[3]];
    [v8 setObject:v19 forKeyedSubscript:@"_TotalSize"];

    [v5 setPreferencesValue:v8 forKey:@"PreflightSizing"];
    uint64_t v20 = v58[3];
    long long v21 = [(MBCKBackupEngine *)self attemptSummary];
    [v21 setTotalQuotaReservation:v20];

    self->_totalSize = v58[3];
    long long v22 = MBDeviceName();
    long long v23 = [(MBCKEngine *)self device];
    [v23 setDeviceName:v22];

    [(MBCKBackupEngine *)self _saveLastPendingSnapshotSize:v58[3]];
    uint64_t v24 = v58[3];
    id v25 = [(MBCKEngine *)self device];
    [v25 setPendingSnapshotQuotaReserved:v24];

    int64_t v26 = [(MBCKSnapshot *)self->_currentSnapshot type];
    id v27 = [(MBCKEngine *)self device];
    [v27 setPendingSnapshotType:v26];

    int64_t v28 = [(MBCKSnapshot *)self->_currentSnapshot backupPolicy];
    id v29 = [(MBCKEngine *)self device];
    [v29 setPendingSnapshotBackupPolicy:v28];

    int64_t v30 = [(MBCKSnapshot *)self->_currentSnapshot snapshotFormat];
    v31 = [(MBCKEngine *)self device];
    [v31 setPendingSnapshotFormat:v30];

    id v32 = [(MBCKEngine *)self device];
    id v33 = [v32 domainHMACsToRepairOnDisk];
    BOOL v34 = [v33 count] == 0;

    v35 = [(MBCKEngine *)self device];
    if (v34)
    {
      [v35 setPendingRepairedDomainHMACs:0];
    }
    else
    {
      unsigned int v36 = [v35 domainHMACsToRepairOnDisk];
      BOOL v37 = [(MBCKEngine *)self device];
      [v37 setPendingRepairedDomainHMACs:v36];
    }
    int v38 = [(MBCKEngine *)self device];
    [v38 setPendingSnapshot:0];

    v39 = [(MBCKEngine *)self device];
    unsigned int v40 = [v39 saveWithOperationTracker:v6 error:a3];

    if (v40)
    {
      __int16 v41 = [(MBCKEngine *)self device];
      unsigned int v42 = [v41 deviceName];
      [(MBCKSnapshot *)self->_currentSnapshot setDeviceName:v42];

      currentSnapshot = self->_currentSnapshot;
      unsigned int v44 = [(MBCKEngine *)self device];
      [v44 setPendingSnapshot:currentSnapshot];

      uint64_t v45 = [(MBCKBackupEngine *)self pluginNotifier];
      id v50 = 0;
      LOBYTE(currentSnapshot) = [v45 notifyPluginsOfPreparedBackupWithError:&v50];
      id v13 = v50;

      if (currentSnapshot)
      {
        BOOL v12 = 1;
LABEL_38:

        goto LABEL_39;
      }
      id v48 = MBGetDefaultLog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v62 = v13;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to notify plugins of preparedBackupWithError: %@", buf, 0xCu);
        _MBLog();
      }

      if (a3)
      {
        id v13 = v13;
        BOOL v12 = 0;
        *a3 = v13;
        goto LABEL_38;
      }
LABEL_37:
      BOOL v12 = 0;
      goto LABEL_38;
    }
    goto LABEL_32;
  }
  if (MBIsInternalInstall()
    && !dword_100482390
    && !atomic_fetch_add_explicit(&dword_100482390, 1u, memory_order_relaxed))
  {
    BOOL v46 = MBGetDefaultLog();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_FAULT, "=cloud-backup= =cloud-backup= Backup has reserved quota size of 0", buf, 2u);
      _MBLog();
    }
  }
  if (a3)
  {
    MBStringForSnapshotType();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    long long v47 = [v13 localizedCapitalizedString];
    *a3 = +[MBError errorWithCode:205, @"%@ backup has a reserved quota size of 0", v47 format];

    goto LABEL_37;
  }
LABEL_32:
  BOOL v12 = 0;
LABEL_39:
  _Block_object_dispose(&v57, 8);

  return v12;
}

- (BOOL)_handleSkippedFilesWithError:(id *)a3
{
  uint64_t v5 = [(MBCKBackupEngine *)self skippedFileTracker];
  id v6 = [v5 skippedFilesCount];
  if (v6)
  {
    unint64_t v7 = (unint64_t)v6;
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      unint64_t v45 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Skipped %lld files during the file scan", buf, 0xCu);
      _MBLog();
    }

    id v9 = [(MBCKEngine *)self persona];
    id v10 = [v5 skippedFilesPlistValue];
    [v9 setPreferencesValue:v10 forKey:@"SkippedFilesFromBackup"];

    uint64_t v11 = [(MBCKEngine *)self persona];
    BOOL v12 = [v11 skippedFileRecordsPlistPath];

    id v42 = 0;
    unsigned __int8 v13 = [v5 writeSkippedFilesToPlistWithError:&v42];
    id v14 = v42;
    if ((v13 & 1) == 0)
    {
      id v18 = MBGetDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to write skipped files to plist", buf, 2u);
        _MBLog();
      }

      if (!a3) {
        goto LABEL_28;
      }
      id v15 = v14;
      goto LABEL_14;
    }
    if (v7 >= 0xB)
    {
      if (!a3)
      {
LABEL_28:

        BOOL v17 = 0;
        goto LABEL_29;
      }
      id v15 = +[MBError errorWithCode:100, @"Too many skipped files during scanning (%llu > %llu)", v7, 10 format];
LABEL_14:
      *a3 = v15;
      goto LABEL_28;
    }
    id v19 = self->super.super._domainManager;
    unsigned int v40 = v19;
    if (([(MBDomainManager *)v19 containsDomainName:@"SkippedFilesDomain"] & 1) == 0)
    {
      uint64_t v20 = [(MBCKEngine *)self persona];
      long long v21 = [v20 volumeMountPoint];
      long long v22 = [v12 stringByDeletingLastPathComponent];
      long long v23 = +[MBDomain skippedFilesDomainWithVolumeMountPoint:v21 rootPath:v22];

      uint64_t v24 = [v12 lastPathComponent];
      id v25 = +[NSSet setWithObject:v24];
      [v23 setRelativePathsToBackupAndRestore:v25];

      id v19 = v40;
      [(MBDomainManager *)v40 addDomain:v23];
    }
    int64_t v26 = MBGetDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      unint64_t v45 = (unint64_t)v12;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Scanning the skipped files plist (%@) from the live filesystem", buf, 0xCu);
      _MBLog();
    }

    id v27 = [(MBCKBackupEngine *)self _createDomainTranscriberForAPFSSnapshots:0 error:a3];
    if (v27)
    {
      v39 = v12;
      int64_t v28 = v27;
      id v29 = [(MBDomainManager *)v19 domainForName:@"SkippedFilesDomain"];
      v43 = v29;
      int64_t v30 = +[NSArray arrayWithObjects:&v43 count:1];
      v31 = [(MBCKBackupEngine *)self pendingSnapshotDatabase];
      id v32 = [(MBCKEngine *)self progressModel];
      id v41 = v14;
      int v38 = v28;
      LOBYTE(v28) = [v28 scanDomains:v30 pendingSnapshotDatabase:v31 progress:v32 summary:0 error:&v41];
      id v37 = v41;

      if (v28)
      {
        id v33 = +[NSNumber numberWithUnsignedLongLong:v7];
        BOOL v34 = [(MBCKBackupEngine *)self telemetry];
        [v34 setSkippedFilesCount:v33];

        goto LABEL_9;
      }
      id v19 = v40;
      v35 = MBGetDefaultLog();
      id v14 = v37;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        unint64_t v45 = (unint64_t)v37;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to transcribe skipped files domain: %@", buf, 0xCu);
        _MBLog();
      }

      BOOL v12 = v39;
      if (a3)
      {
        id v14 = v37;
        *a3 = v14;
      }
      id v27 = v38;
    }

    goto LABEL_28;
  }
  uint64_t v16 = [(MBCKEngine *)self persona];
  [v16 setPreferencesValue:0 forKey:@"SkippedFilesFromBackup"];

  [v5 writeSkippedFilesToPlistWithError:0];
LABEL_9:
  BOOL v17 = 1;
LABEL_29:

  return v17;
}

- (BOOL)prepareToUploadChangesWithError:(id *)a3
{
  if (-[MBCKEngine handleCancelation:](self, "handleCancelation:")) {
    goto LABEL_2;
  }
  if (self->_currentSnapshot)
  {
    [(MBCKBackupEngine *)self _releaseLockAssertion];
    BOOL v5 = [(MBCKBackupEngine *)self _handleSkippedFilesWithError:a3];
    if (!v5) {
      return v5;
    }
    if (MBSnapshotFormatContainsManifests())
    {
      id v6 = objc_opt_new();
      unint64_t v7 = [(MBCKEngine *)self cache];
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_10008C290;
      v57[3] = &unk_1004114C8;
      id v8 = v6;
      id v58 = v8;
      id v9 = [v7 enumerateChangedDomainNames:v57];

      if (v9)
      {
        if (a3) {
          *a3 = v9;
        }
        id v10 = MBGetDefaultLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)uint64_t v60 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "=cloud-backup= Error enumerating changed domains: %@", buf, 0xCu);
          v31 = v9;
          _MBLog();
        }

        int v11 = 1;
      }
      else
      {
        unsigned __int8 v13 = [(MBCKEngine *)self cache];
        id v14 = [(MBCKSnapshot *)self->_currentSnapshot snapshotID];
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_10008C2B4;
        v56[3] = &unk_1004114C8;
        v56[4] = self;
        id v9 = [v13 enumerateDomainNamesOfPendingSnapshot:v14 domainCallback:v56];

        if (v9)
        {
          if (a3) {
            *a3 = v9;
          }
          id v15 = MBGetDefaultLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)uint64_t v60 = v9;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "=cloud-backup= Error enumerating changed already uploaded domains: %@", buf, 0xCu);
            v31 = v9;
            _MBLog();
          }
          int v11 = 1;
        }
        else
        {
          uint64_t v16 = [(MBEngine *)self domainManager];
          if (!v16) {
            __assert_rtn("-[MBCKBackupEngine prepareToUploadChangesWithError:]", "MBCKBackupEngine.m", 1675, "domainManager");
          }
          BOOL v17 = [v8 allObjects];
          v54[0] = _NSConcreteStackBlock;
          v54[1] = 3221225472;
          v54[2] = sub_10008C3A8;
          v54[3] = &unk_1004119A0;
          id v15 = v16;
          id v55 = v15;
          id obj = [v17 sortedArrayUsingComparator:v54];

          uint64_t v50 = 0;
          long long v51 = &v50;
          uint64_t v52 = 0x2020000000;
          int v53 = 0;
          BOOL v46 = 0;
          long long v47 = &v46;
          uint64_t v48 = 0x2020000000;
          uint64_t v49 = 0;
          uint64_t v42 = 0;
          v43 = &v42;
          uint64_t v44 = 0x2020000000;
          uint64_t v45 = 0;
          id v18 = [(MBCKEngine *)self cache];
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_10008C434;
          v41[3] = &unk_1004119C8;
          v41[4] = self;
          v41[5] = &v50;
          v41[6] = &v46;
          v41[7] = &v42;
          id v9 = [v18 summarizeFileChanges:v41];

          v39 = +[NSByteCountFormatter stringFromByteCount:v47[3] countStyle:0];
          id v19 = MBGetDefaultLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = v19;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              int v36 = *((_DWORD *)v51 + 6);
              id v37 = v47[3];
              uint64_t v21 = v43[3];
              id v22 = [obj count];
              *(_DWORD *)long long buf = 67110146;
              *(_DWORD *)uint64_t v60 = v36;
              *(_WORD *)&v60[4] = 2048;
              *(void *)&v60[6] = v37;
              *(_WORD *)&v60[14] = 2112;
              *(void *)&v60[16] = v39;
              *(_WORD *)&v60[24] = 2048;
              *(void *)&v60[26] = v21;
              __int16 v61 = 2048;
              id v62 = v22;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Going to upload %d file records with size %llu (%@) and %llu delete records for %lu domains", buf, 0x30u);
            }

            int v38 = (void *)*((unsigned int *)v51 + 6);
            long long v23 = v47[3];
            uint64_t v34 = v43[3];
            id v35 = [obj count];
            uint64_t v32 = (uint64_t)v23;
            id v33 = v39;
            v31 = v38;
            _MBLog();
          }

          if (v9)
          {
            if (a3) {
              *a3 = v9;
            }
            int v11 = 1;
          }
          else
          {
            objc_storeStrong((id *)&self->_domainNamesToUpload, obj);
            int v11 = 0;
          }

          _Block_object_dispose(&v42, 8);
          _Block_object_dispose(&v46, 8);
          _Block_object_dispose(&v50, 8);
        }
      }

      if (v11) {
        goto LABEL_2;
      }
    }
    if (!MBSnapshotFormatContainsAssets()) {
      goto LABEL_39;
    }
    uint64_t v50 = 0;
    BOOL v46 = 0;
    uint64_t v24 = [(MBCKBackupEngine *)self pendingSnapshotDatabase];
    unsigned int v25 = [v24 fetchPendingUploadSizeInBytes:&v50 assetCount:&v46 error:a3];

    if (v25)
    {
      int64_t v26 = +[NSByteCountFormatter stringFromByteCount:v50 countStyle:0];
      id v27 = MBGetDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218498;
        *(void *)uint64_t v60 = v46;
        *(_WORD *)&v60[8] = 2048;
        *(void *)&v60[10] = v50;
        *(_WORD *)&v60[18] = 2112;
        *(void *)&v60[20] = v26;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Going to upload %llu asset records with size %llu (%@)", buf, 0x20u);
        uint64_t v32 = v50;
        id v33 = v26;
        v31 = v46;
        _MBLog();
      }

      int64_t v28 = [(MBCKEngine *)self progressModel];
      [v28 willTransferItemsWithSize:v50 count:v46];

LABEL_39:
      id v29 = [(MBCKEngine *)self progressModel];
      [(MBCKModel *)self->_currentSnapshot setProgressModel:v29];

      LOBYTE(v5) = 1;
      return v5;
    }
LABEL_2:
    LOBYTE(v5) = 0;
    return v5;
  }
  if (!a3) {
    goto LABEL_2;
  }
  id v12 = +[MBError errorWithCode:1 format:@"Unable to upload without a snapshot"];
  LOBYTE(v5) = 0;
  *a3 = v12;
  return v5;
}

- (BOOL)uploadAssetsWithError:(id *)a3
{
  [(MBCKSnapshot *)self->_currentSnapshot snapshotFormat];
  if (!MBSnapshotFormatContainsFileLists()) {
    return 1;
  }
  uint64_t v16 = [(MBEngine *)self domainManager];
  BOOL v5 = [(MBCKBackupEngine *)self pendingSnapshotDatabase];
  id v18 = [(MBCKEngine *)self persona];
  id v6 = [v18 snapshotDatabaseDirectory];
  BOOL v17 = [(MBCKBackupEngine *)self currentSnapshot];
  id v15 = [v17 commitID];
  unint64_t v7 = [(MBCKEngine *)self device];
  id v8 = [(MBCKBackupEngine *)self mountedSnapshotTracker];
  id v9 = [(MBCKEngine *)self ckOperationTracker];
  id v10 = [(MBEngine *)self settingsContext];
  int v11 = [v10 plugins];
  id v12 = [(MBCKBackupEngine *)self attemptSummary];
  char v13 = MBUploadAssetsForBackup(v16, v5, v6, v15, v7, v8, v9, v11, v12, a3);

  return v13;
}

- (BOOL)uploadChangesWithError:(id *)a3
{
  [(MBCKSnapshot *)self->_currentSnapshot snapshotFormat];
  if (MBSnapshotFormatContainsManifests())
  {
    unsigned __int8 v110 = a3;
    if (!a3) {
      __assert_rtn("-[MBCKBackupEngine uploadChangesWithError:]", "MBCKBackupEngine.m", 1753, "error");
    }
    id v114 = [(MBCKEngine *)self serviceManager];
    if (!v114) {
      __assert_rtn("-[MBCKBackupEngine uploadChangesWithError:]", "MBCKBackupEngine.m", 1755, "serviceManager");
    }
    v119 = [(MBCKEngine *)self ckOperationTracker];
    if (!v119) {
      __assert_rtn("-[MBCKBackupEngine uploadChangesWithError:]", "MBCKBackupEngine.m", 1757, "tracker");
    }
    double v113 = [(MBCKEngine *)self serviceAccount];
    if (!v113) {
      __assert_rtn("-[MBCKBackupEngine uploadChangesWithError:]", "MBCKBackupEngine.m", 1759, "serviceAccount");
    }
    +[NSDate timeIntervalSinceReferenceDate];
    double v5 = v4;
    id v6 = objc_opt_new();
    long long v211 = 0u;
    long long v212 = 0u;
    long long v213 = 0u;
    long long v214 = 0u;
    unint64_t v7 = self->_domainNamesToUpload;
    id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v211 objects:v230 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v212;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v212 != v9) {
            objc_enumerationMutation(v7);
          }
          int v11 = [(MBCKSnapshot *)self->_currentSnapshot manifestForDomainName:*(void *)(*((void *)&v211 + 1) + 8 * i)];
          id v12 = v11;
          if (v11)
          {
            [v11 setFileUploadError:0];
            [v6 addObject:v12];
          }
        }
        id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v211 objects:v230 count:16];
      }
      while (v8);
    }

    v210[0] = 0;
    v210[1] = v210;
    v210[2] = 0x2020000000;
    v210[3] = 0;
    long long v206 = 0u;
    long long v207 = 0u;
    long long v208 = 0u;
    long long v209 = 0u;
    id obj = v6;
    id v13 = [obj countByEnumeratingWithState:&v206 objects:v229 count:16];
    if (v13)
    {
      uint64_t v118 = *(void *)v207;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v207 != v118) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v206 + 1) + 8 * (void)j);
          BOOL v17 = [v15 manifestID];
          id v18 = [v15 domainName];
          id v19 = MBGetDefaultLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543618;
            *(void *)&uint8_t buf[4] = v17;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v18;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Reclaiming quota from pending items for manifest %{public}@ (%@)", buf, 0x16u);
            id v105 = v17;
            id v106 = v18;
            _MBLog();
          }

          uint64_t v20 = [(MBCKEngine *)self cache];
          v205[0] = _NSConcreteStackBlock;
          v205[1] = 3221225472;
          v205[2] = sub_10008DB60;
          v205[3] = &unk_1004119F0;
          v205[4] = v210;
          id v21 = [v20 summarizeCloudFilesPendingDeleteForManifestID:v17 callback:v205];

          id v22 = dispatch_group_create();
          dispatch_group_enter(v22);
          long long v23 = [v119 startBatchDelete];
          [v23 setRetryWhenNetworkDisconnected:0];
          dispatch_group_enter(v22);
          v203[0] = _NSConcreteStackBlock;
          v203[1] = 3221225472;
          v203[2] = sub_10008DB78;
          v203[3] = &unk_100411128;
          uint64_t v24 = v22;
          v204 = v24;
          [v15 deletePendingCloudFilesWithBatchDelete:v23 completion:v203];
          v198[0] = _NSConcreteStackBlock;
          v198[1] = 3221225472;
          v198[2] = sub_10008DB80;
          v198[3] = &unk_100411A18;
          id v25 = v17;
          id v199 = v25;
          id v26 = v18;
          id v200 = v26;
          v201 = self;
          id v27 = v24;
          v202 = v27;
          [v119 finishBatchDelete:v23 completion:v198];
          MBGroupWaitForever();
        }
        id v13 = [obj countByEnumeratingWithState:&v206 objects:v229 count:16];
      }
      while (v13);
    }

    id obja = [v119 startBatchSave];
    uint64_t v194 = 0;
    id v195 = &v194;
    uint64_t v196 = 0x2020000000;
    uint64_t v197 = 0;
    uint64_t v190 = 0;
    long long v191 = &v190;
    uint64_t v192 = 0x2020000000;
    uint64_t v193 = 0;
    uint64_t v186 = 0;
    unsigned __int8 v187 = &v186;
    uint64_t v188 = 0x2020000000;
    uint64_t v189 = 0;
    uint64_t v180 = 0;
    long long v181 = (id *)&v180;
    uint64_t v182 = 0x3032000000;
    long long v183 = sub_100087880;
    long long v184 = sub_100087890;
    id v185 = 0;
    uint64_t v174 = 0;
    id v175 = &v174;
    uint64_t v176 = 0x3032000000;
    id v177 = sub_100087880;
    id v178 = sub_100087890;
    id v179 = 0;
    uint64_t v170 = 0;
    v171 = &v170;
    uint64_t v172 = 0x2020000000;
    char v173 = 1;
    id v111 = self->_domainNamesToUpload;
    int64_t v28 = MBGetDefaultLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = v28;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        NSUInteger v30 = [(NSArray *)v111 count];
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Uploading files for %lu domains", buf, 0xCu);
      }

      id v105 = [(NSArray *)v111 count];
      _MBLog();
    }

    uint64_t v31 = [v114 openCacheWithAccount:v113 accessType:2 cached:0 error:v110];
    if (!v31)
    {
      v72 = MBGetDefaultLog();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
      {
        id v77 = *v110;
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v77;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_FAULT, "=cloud-backup= Failed to open readonly cache %@", buf, 0xCu);
        _MBLog();
      }
      BOOL v76 = 0;
      goto LABEL_98;
    }
    v115 = (void *)v31;
    long long v168 = 0u;
    long long v169 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    uint64_t v32 = v111;
    id v33 = [(NSArray *)v32 countByEnumeratingWithState:&v166 objects:v228 count:16];
    double v112 = v32;
    if (v33)
    {
      uint64_t v34 = *(void *)v167;
LABEL_31:
      uint64_t v35 = 0;
      while (1)
      {
        if (*(void *)v167 != v34) {
          objc_enumerationMutation(v32);
        }
        int v36 = *(void **)(*((void *)&v166 + 1) + 8 * v35);
        int v38 = MBGetDefaultLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543362;
          *(void *)&uint8_t buf[4] = v36;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Uploading files for %{public}@", buf, 0xCu);
          id v105 = v36;
          _MBLog();
        }

        *(void *)long long buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v217 = sub_100087880;
        *(void *)unsigned int v218 = sub_100087890;
        *(void *)&v218[8] = 0;
        id v165 = 0;
        unsigned int v39 = [(MBCKEngine *)self handleCancelation:&v165];
        objc_storeStrong((id *)&v218[8], v165);
        if (v39)
        {
          objc_storeStrong(v181 + 5, *(id *)(*(void *)&buf[8] + 40));
          *((unsigned char *)v171 + 24) = 0;
          int v40 = 18;
        }
        else
        {
          uint64_t v161 = 0;
          v162 = &v161;
          uint64_t v163 = 0x2020000000;
          uint64_t v164 = 0;
          uint64_t v157 = 0;
          id v158 = &v157;
          uint64_t v159 = 0x2020000000;
          uint64_t v160 = 0;
          uint64_t v153 = 0;
          v154 = &v153;
          uint64_t v155 = 0x2020000000;
          uint64_t v156 = 0;
          v143[0] = _NSConcreteStackBlock;
          v143[1] = 3221225472;
          v143[2] = sub_10008DCA0;
          v143[3] = &unk_100411A40;
          v143[4] = self;
          v146 = buf;
          id v41 = v115;
          id v144 = v41;
          id v145 = obja;
          v147 = &v161;
          v148 = &v194;
          v149 = &v157;
          unsigned __int8 v150 = &v153;
          int v151 = &v190;
          double v152 = &v186;
          uint64_t v42 = [v41 enumerateFileChangesForDomainName:v36 skipUnmodified:1 foundChange:v143];
          v43 = MBGetDefaultLog();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v44 = (void *)v158[3];
            uint64_t v45 = (void *)v154[3];
            uint64_t v46 = v162[3];
            *(_DWORD *)v220 = 134218754;
            v221 = v44;
            __int16 v222 = 2048;
            id v223 = v45;
            __int16 v224 = 2048;
            uint64_t v225 = v46;
            __int16 v226 = 2114;
            v227 = v36;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Queued a total of %llu files (%llu) and %llu deletes for %{public}@", v220, 0x2Au);
            uint64_t v107 = v162[3];
            id v108 = v36;
            id v105 = (id)v158[3];
            id v106 = (id)v154[3];
            _MBLog();
          }

          unint64_t v47 = *(void *)(*(void *)&buf[8] + 40);
          if (v47 | v42)
          {
            objc_storeStrong(v181 + 5, (id)v47);
            if (!v181[5]) {
              objc_storeStrong(v181 + 5, (id)v42);
            }
            uint64_t v48 = MBGetDefaultLog();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              id v49 = v181[5];
              *(_DWORD *)v220 = 138412546;
              v221 = v36;
              __int16 v222 = 2112;
              id v223 = v49;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to upload files for domain %@: %@", v220, 0x16u);
              id v105 = v36;
              id v106 = v181[5];
              _MBLog();
            }

            *((unsigned char *)v171 + 24) = 0;
            int v40 = 18;
          }
          else
          {
            long long v141 = 0u;
            long long v142 = 0u;
            long long v139 = 0u;
            long long v140 = 0u;
            uint64_t v50 = [(MBCKSnapshot *)self->_currentSnapshot manifestsByDomainName];
            long long v51 = [v50 allValues];

            id v52 = [v51 countByEnumeratingWithState:&v139 objects:v219 count:16];
            if (v52)
            {
              uint64_t v53 = *(void *)v140;
              while (2)
              {
                for (k = 0; k != v52; k = (char *)k + 1)
                {
                  if (*(void *)v140 != v53) {
                    objc_enumerationMutation(v51);
                  }
                  uint64_t v55 = objc_msgSend(*(id *)(*((void *)&v139 + 1) + 8 * (void)k), "fileUploadError", v105, v106, v107, v108);
                  if (v55)
                  {
                    *((unsigned char *)v171 + 24) = 0;
                    id v56 = v181[5];
                    v181[5] = (id)v55;

                    uint64_t v32 = v112;
                    goto LABEL_56;
                  }
                }
                id v52 = [v51 countByEnumeratingWithState:&v139 objects:v219 count:16];
                uint64_t v32 = v112;
                if (v52) {
                  continue;
                }
                break;
              }
            }
LABEL_56:

            int v40 = v181[5] ? 18 : 0;
          }

          _Block_object_dispose(&v153, 8);
          _Block_object_dispose(&v157, 8);
          _Block_object_dispose(&v161, 8);
        }
        _Block_object_dispose(buf, 8);

        if (v40) {
          break;
        }
        if ((id)++v35 == v33)
        {
          id v33 = [(NSArray *)v32 countByEnumeratingWithState:&v166 objects:v228 count:16];
          if (v33) {
            goto LABEL_31;
          }
          break;
        }
      }
    }

    [v115 close];
    +[NSDate timeIntervalSinceReferenceDate];
    double v58 = v57;
    uint64_t v59 = MBGetDefaultLog();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      double v60 = v58 - v5;
      __int16 v61 = v59;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        id v62 = v32;
        uint64_t v63 = v191[3];
        uint64_t v64 = v187[3];
        id v65 = (uint64_t (*)(uint64_t, uint64_t))v195[3];
        NSUInteger v66 = [(NSArray *)v62 count];
        *(_DWORD *)long long buf = 134219008;
        *(void *)&uint8_t buf[4] = v63;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v64;
        *(_WORD *)&buf[22] = 2048;
        v217 = v65;
        *(_WORD *)unsigned int v218 = 2048;
        *(void *)&v218[2] = v66;
        *(_WORD *)&v218[10] = 2048;
        *(double *)&v218[12] = v60;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Finished queueing %llu files (%llu) and %llu deletes for %lu domains in %.2fs", buf, 0x34u);
        uint64_t v32 = v112;
      }

      id v67 = (void *)v191[3];
      id v68 = (void *)v187[3];
      double v109 = v60;
      uint64_t v107 = v195[3];
      id v108 = [(NSArray *)v32 count];
      id v105 = v67;
      id v106 = v68;
      _MBLog();
    }

    uint64_t v69 = MBGetDefaultLog();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = obja;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "=cloud-backup= Waiting for %{public}@ to complete", buf, 0xCu);
      id v105 = obja;
      _MBLog();
    }

    dispatch_semaphore_t v70 = dispatch_semaphore_create(0);
    v126[0] = _NSConcreteStackBlock;
    v126[1] = 3221225472;
    v126[2] = sub_10008E7D8;
    v126[3] = &unk_100411A68;
    v133 = &v190;
    v134 = &v186;
    int v135 = &v194;
    uint64_t v71 = v32;
    double v127 = v71;
    v128 = self;
    id v129 = v119;
    id v130 = v114;
    id v131 = v113;
    unsigned int v136 = &v170;
    v137 = &v174;
    v138 = &v180;
    v72 = v70;
    v132 = v72;
    [v129 finishBatchSave:obja completion:v126];
    CFStringRef v73 = [obja throughputEstimator];
    id v74 = [v73 throughputs];
    id v75 = [(MBCKBackupEngine *)self telemetry];
    [v75 setThroughputs:v74];

    if ([(MBCKEngine *)self handleCancelation:v110])
    {
      BOOL v76 = 0;
LABEL_97:

LABEL_98:
      _Block_object_dispose(&v170, 8);
      _Block_object_dispose(&v174, 8);

      _Block_object_dispose(&v180, 8);
      _Block_object_dispose(&v186, 8);
      _Block_object_dispose(&v190, 8);
      _Block_object_dispose(&v194, 8);

      _Block_object_dispose(v210, 8);
      return v76;
    }
    MBSemaphoreWaitForever();
    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    id v78 = v71;
    id v79 = [(NSArray *)v78 countByEnumeratingWithState:&v122 objects:v215 count:16];
    if (v79)
    {
      uint64_t v80 = *(void *)v123;
      while (2)
      {
        for (m = 0; m != v79; m = (char *)m + 1)
        {
          if (*(void *)v123 != v80) {
            objc_enumerationMutation(v78);
          }
          BOOL v82 = -[MBCKSnapshot manifestForDomainName:](self->_currentSnapshot, "manifestForDomainName:", *(void *)(*((void *)&v122 + 1) + 8 * (void)m), v105, v106, v107, v108, *(void *)&v109);
          v83 = [v82 fileUploadError];

          if (v83)
          {
            *((unsigned char *)v171 + 24) = 0;
            uint64_t v84 = [v82 fileUploadError];
            id v85 = v181[5];
            v181[5] = (id)v84;

            goto LABEL_85;
          }
        }
        id v79 = [(NSArray *)v78 countByEnumeratingWithState:&v122 objects:v215 count:16];
        if (v79) {
          continue;
        }
        break;
      }
    }
LABEL_85:

    if (!*((unsigned char *)v171 + 24))
    {
      id v86 = v181[5];
      if (!v86)
      {
        id v86 = (id)v175[5];
        if (!v86)
        {
          double v97 = MBGetDefaultLog();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_fault_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_FAULT, "success is false and uploadError and retryError are both nil", buf, 2u);
          }

          sub_1001E6FFC(@"success is false and uploadError and retryError are both nil", v98, v99, v100, v101, v102, v103, v104, (uint64_t)v105);
          BOOL v76 = 0;
          *unsigned __int8 v110 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_97;
        }
      }
      *unsigned __int8 v110 = v86;
    }
    v87 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v187[3], v105);
    unsigned __int8 v88 = [(MBCKBackupEngine *)self telemetry];
    [v88 setQueuedSize:v87];

    uint64_t v89 = +[NSNumber numberWithUnsignedLongLong:v195[3] + v191[3]];
    v90 = [(MBCKBackupEngine *)self telemetry];
    [v90 setQueuedFileCount:v89];

    v91 = [(MBCKEngine *)self cache];
    id v121 = 0;
    id v92 = [v91 countFilesMissingEncryptionKeysWithError:&v121];
    id v93 = v121;

    if (v92)
    {
      v94 = MBGetDefaultLog();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = v92;
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Found %llu files with missing encryption keys during upload", buf, 0xCu);
        _MBLog();
      }

      id v95 = +[MBError errorWithCode:209, @"Found %llu files with missing encryption keys during upload", v92 format];
    }
    else
    {
      if (!v93)
      {
        BOOL v76 = *((unsigned char *)v171 + 24) != 0;
        goto LABEL_96;
      }
      id v95 = v93;
    }
    BOOL v76 = 0;
    *unsigned __int8 v110 = v95;
LABEL_96:

    goto LABEL_97;
  }
  return 1;
}

- (BOOL)uploadDomainRecords:(id *)a3
{
  double v5 = [(MBCKBackupEngine *)self currentSnapshot];
  [v5 snapshotFormat];
  int v6 = MBSnapshotFormatContainsFileLists();

  if (!v6) {
    return 1;
  }
  id v18 = [(MBCKBackupEngine *)self pendingSnapshotDatabase];
  id v19 = [(MBCKEngine *)self persona];
  unint64_t v7 = [v19 snapshotDatabaseDirectory];
  id v8 = [(MBCKBackupEngine *)self currentSnapshot];
  uint64_t v9 = [v8 commitID];
  id v10 = [(MBCKEngine *)self device];
  int v11 = [v10 hmacKey];
  id v12 = [(MBCKEngine *)self device];
  id v13 = [v12 assetIDPrefix];
  id v14 = [(MBCKEngine *)self ckOperationTracker];
  id v15 = [(MBCKBackupEngine *)self attemptSummary];
  char v16 = MBUploadDomainRecordsForBackup(v18, v7, v9, v11, v13, v14, v15, a3);

  return v16;
}

- (BOOL)commitSnapshotWithError:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBCKBackupEngine commitSnapshotWithError:]", "MBCKBackupEngine.m", 2081, "error");
  }
  double v4 = self;
  uint64_t v5 = [(MBCKEngine *)self ckOperationTracker];
  if (!v5) {
    __assert_rtn("-[MBCKBackupEngine commitSnapshotWithError:]", "MBCKBackupEngine.m", 2083, "tracker");
  }
  int v6 = (void *)v5;
  uint64_t v7 = [(MBCKEngine *)v4 persona];
  if (!v7) {
    __assert_rtn("-[MBCKBackupEngine commitSnapshotWithError:]", "MBCKBackupEngine.m", 2085, "persona");
  }
  id v8 = (void *)v7;
  uint64_t v9 = [(MBCKBackupEngine *)v4 pendingSnapshotDatabase];
  if (!v9) {
    __assert_rtn("-[MBCKBackupEngine commitSnapshotWithError:]", "MBCKBackupEngine.m", 2087, "pendingSnapshotDatabase");
  }
  id v10 = (void *)v9;
  int v11 = v4->_currentSnapshot;
  id v12 = v11;
  if (v11)
  {
    id v13 = [(MBCKSnapshot *)v11 commitID];
    id v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v129 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Committing snapshot %{public}@", buf, 0xCu);
      id v92 = v13;
      _MBLog();
    }
    id v106 = a3;

    [(MBCKSnapshot *)v12 snapshotFormat];
    if (MBSnapshotFormatContainsManifests())
    {
      uint64_t v103 = v13;
      uint64_t v100 = v10;
      uint64_t v101 = v8;
      uint64_t v102 = v6;
      long long v126 = 0u;
      long long v127 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      id obj = [(MBCKSnapshot *)v12 manifestsByDomainName];
      id v112 = [obj countByEnumeratingWithState:&v124 objects:v135 count:16];
      if (v112)
      {
        uint64_t v108 = *(void *)v125;
        double v109 = v4;
        unsigned __int8 v110 = v12;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v125 != v108) {
              objc_enumerationMutation(obj);
            }
            uint64_t v117 = v15;
            uint64_t v16 = *(void *)(*((void *)&v124 + 1) + 8 * v15);
            BOOL v17 = [(MBCKSnapshot *)v12 manifestsByDomainName];
            id v114 = [v17 objectForKeyedSubscript:v16];

            appManager = v4->super.super._appManager;
            id v19 = +[MBDomain containerIDWithName:v16];
            uint64_t v20 = [(MBAppManager *)appManager appWithIdentifier:v19];

            id v21 = objc_alloc_init((Class)NSMutableSet);
            long long v120 = 0u;
            long long v121 = 0u;
            long long v122 = 0u;
            long long v123 = 0u;
            double v113 = v20;
            id v22 = [v20 containers];
            id v23 = [v22 countByEnumeratingWithState:&v120 objects:v134 count:16];
            if (v23)
            {
              id v24 = v23;
              uint64_t v25 = *(void *)v121;
              do
              {
                for (i = 0; i != v24; i = (char *)i + 1)
                {
                  if (*(void *)v121 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  id v27 = *(void **)(*((void *)&v120 + 1) + 8 * i);
                  int64_t v28 = objc_msgSend(v27, "domain", v92);
                  id v29 = [v28 name];
                  unsigned __int8 v30 = [v29 isEqualToString:v16];

                  if ((v30 & 1) == 0)
                  {
                    uint64_t v31 = [v27 domain];
                    uint64_t v32 = [v31 name];
                    [v21 addObject:v32];
                  }
                }
                id v24 = [v22 countByEnumeratingWithState:&v120 objects:v134 count:16];
              }
              while (v24);
            }

            [v114 setDependentDomainNames:v21];
            if ([v113 containerType] == 1
              || [v113 containerType] == 2)
            {
              id v33 = objc_msgSend(v113, "bundleID", v92);
              uint64_t v34 = [v113 entitlements];
              uint64_t v35 = [v113 entitlementsRelativePath];
              int v36 = MBGetDefaultLog();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412802;
                id v129 = v33;
                __int16 v130 = 2112;
                id v131 = v35;
                __int16 v132 = 2112;
                v133 = v34;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Adding entitlements for %@ (%@): %@", buf, 0x20u);
                uint64_t v98 = v35;
                uint64_t v99 = v34;
                id v93 = v33;
                _MBLog();
              }

              if ([v113 containerType] == 2)
              {
                id v37 = [v113 ownerBundleID];
                [v114 setOwningBundleID:v37];
              }
              objc_msgSend(v114, "setEntitlements:", v34, v93, v98, v99);
              [v114 setEntitlementsPath:v35];
            }
            uint64_t v15 = v117 + 1;
            id v12 = v110;
            double v4 = v109;
          }
          while ((id)(v117 + 1) != v112);
          id v112 = [obj countByEnumeratingWithState:&v124 objects:v135 count:16];
        }
        while (v112);
      }

      id v8 = v101;
      int v6 = v102;
      id v10 = v100;
      id v13 = v103;
    }
    [(MBCKSnapshot *)v12 snapshotFormat];
    if (MBSnapshotFormatContainsFileLists())
    {
      int v38 = [(MBCKBackupEngine *)v4 attemptSummary];
      id v119 = 0;
      unsigned __int8 v39 = [(MBCKSnapshot *)v12 addDomainRecordIDsFromPendingSnapshotDatabase:v10 attemptSummary:v38 error:&v119];
      id v40 = v119;

      if ((v39 & 1) == 0)
      {
        id v40 = v40;
        *id v106 = v40;
        id v41 = MBGetDefaultLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          id v129 = v40;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to add domain recordIDs to pending snapshot database: %@", buf, 0xCu);
          _MBLog();
        }
        BOOL v42 = 0;
        goto LABEL_75;
      }
    }
    else
    {
      id v40 = 0;
    }
    v43 = MBGetDefaultLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v129 = v13;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Saving properties for snapshot %{public}@", buf, 0xCu);
      v94 = v13;
      _MBLog();
    }

    uint64_t v44 = [(MBCKSnapshot *)v12 device];
    uint64_t v45 = [v44 hmacKey];

    if (v45)
    {
      uint64_t v46 = [(MBCKEngine *)v4 properties];
      [v46 setObject:v45 forKey:@"SnapshotHMACKey"];
    }
    uint64_t v118 = v45;
    uint64_t v47 = MBRequiredProductVersion([(MBCKEngine *)v4 engineType]);
    uint64_t v48 = [(MBCKEngine *)v4 properties];
    contexta = (void *)v47;
    [v48 setRequiredProductVersion:v47];

    id v49 = +[NSNumber numberWithInteger:[(MBCKSnapshot *)v12 accountType]];
    uint64_t v50 = [(MBCKEngine *)v4 properties];
    [v50 setAccountType:v49];

    long long v51 = [(MBCKEngine *)v4 properties];
    id v52 = [v51 dataWithError:v106];

    if (!v52)
    {
      id v52 = 0;
      uint64_t v71 = MBGetDefaultLog();
      if (!os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
LABEL_65:

LABEL_72:
        BOOL v42 = 0;
LABEL_73:
        id v77 = contexta;
LABEL_74:
        id v41 = v118;

LABEL_75:
        goto LABEL_76;
      }
      id v72 = *v106;
      *(_DWORD *)long long buf = 138543362;
      id v129 = v72;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to serialize backup properties: %{public}@", buf, 0xCu);
LABEL_64:
      _MBLog();
      goto LABEL_65;
    }
    -[MBCKSnapshot setBackupProperties:](v12, "setBackupProperties:");
    uint64_t v53 = [(MBCKEngine *)v4 device];
    [v53 unpinGMSnapshotAndSaveNewSnapshotIfNeeded:v12];

    long long v54 = +[MBBehaviorOptions sharedOptions];
    unsigned int v55 = [v54 shouldTriggerDeviceRecordOpLockFailureInBackupCommit];

    if (!v55)
    {
LABEL_53:
      uint64_t v63 = MBGetDefaultLog();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Saving device record", buf, 2u);
        _MBLog();
      }

      uint64_t v64 = [(MBCKEngine *)v4 device];
      unsigned __int8 v65 = [v64 saveWithOperationTracker:v6 error:v106];

      if (v65)
      {
        int v66 = MBSnapshotFormatContainsManifests();
        id v67 = [(MBCKEngine *)v4 cache];
        id v68 = v67;
        if (v66)
        {
          uint64_t v69 = [v67 removeDeletedFileChanges];

          if (v69)
          {
            dispatch_semaphore_t v70 = MBGetDefaultLog();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              id v129 = v69;
              _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "=cloud-backup= Could not remove deleted file changes from the cache: %@", buf, 0xCu);
LABEL_80:
              _MBLog();
              goto LABEL_81;
            }
            goto LABEL_81;
          }
        }
        else
        {
          uint64_t v69 = [v67 removeAllFileChanges];

          if (v69)
          {
            dispatch_semaphore_t v70 = MBGetDefaultLog();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              id v129 = v69;
              _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "=cloud-backup= Could not remove all file changes from the cache: %@", buf, 0xCu);
              goto LABEL_80;
            }
LABEL_81:

            id v40 = v69;
            BOOL v42 = 0;
            *id v106 = v40;
            goto LABEL_73;
          }
        }
        id v105 = v13;
        id v79 = [(MBCKEngine *)v4 cache];
        uint64_t v80 = [v79 removeAllFileEncryptionKeys];

        if (v80)
        {
          v81 = MBGetDefaultLog();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            id v129 = v80;
            _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "=cloud-backup= Could not remove all file encryption keys from cache: %@", buf, 0xCu);
            id v95 = v80;
            _MBLog();
          }
        }
        BOOL v82 = [(MBCKEngine *)v4 cache];
        v83 = [v82 removeAllFilesMissingEncryptionKeys];

        if (v83)
        {
          uint64_t v84 = MBGetDefaultLog();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            id v129 = v83;
            _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "=cloud-backup= Could not remove all missing encryption keys from the cache: %@", buf, 0xCu);
            v96 = v83;
            _MBLog();
          }
        }
        id v85 = [(MBCKEngine *)v4 cache];
        id v40 = [v85 rebuildEncryptionKeysTable];

        if (v40)
        {
          id v86 = MBGetDefaultLog();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            id v129 = v40;
            _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to rebuild the encryption keys table: %@", buf, 0xCu);
            id v97 = v40;
            _MBLog();
          }
        }
        [(MBCKBackupEngine *)v4 _saveNextBackupFSEventState];
        v87 = [(MBCKEngine *)v4 persona];
        unsigned __int8 v88 = [v87 snapshotDatabaseDirectory];
        int v89 = MBCreateSymlinksForPendingAndLatestSnapshots(v88, 0, v105, v106);

        if (v89)
        {
          currentSnapshot = v4->_currentSnapshot;
          v4->_currentSnapshot = 0;

          BOOL v42 = 1;
        }
        else
        {
          BOOL v42 = 0;
        }
        id v13 = v105;
        goto LABEL_73;
      }
      uint64_t v71 = MBGetDefaultLog();
      if (!os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
        goto LABEL_65;
      }
      id v73 = *v106;
      *(_DWORD *)long long buf = 138412290;
      id v129 = v73;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to save device: %@", buf, 0xCu);
      goto LABEL_64;
    }
    uint64_t v104 = v13;
    id v56 = [(MBCKEngine *)v4 cache];
    double v57 = +[MBCKAccount fetchAccountWithOperationTracker:v6 cache:v56 error:v106];

    if (v57)
    {
      if ([v57 fetchDevicesWithOperationTracker:v6 error:v106])
      {
        double v58 = MBDeviceUUID();
        uint64_t v59 = [v57 deviceForUUID:v58];

        if (v59)
        {
          id v111 = v12;
          [v59 setPendingSnapshotQuotaReserved:v4->_totalSize + 1];
          unsigned __int8 v60 = [v59 saveWithOperationTracker:v6 error:v106];
          __int16 v61 = MBGetDefaultLog();
          id v62 = v61;
          if (v60)
          {
            if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "=cloud-backup= Saved mutated device record", buf, 2u);
              _MBLog();
            }

            id v12 = v111;
            id v13 = v104;
            goto LABEL_53;
          }
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            id v91 = *v106;
            *(_DWORD *)long long buf = 138412290;
            id v129 = v91;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to save mutated device record: %@", buf, 0xCu);
            _MBLog();
          }
          id v12 = v111;
        }
        else
        {
          id v62 = MBGetDefaultLog();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "=cloud-backup= Could not find device record in account", buf, 2u);
            _MBLog();
          }
        }
        id v77 = contexta;

        BOOL v42 = 0;
        id v13 = v104;
        goto LABEL_74;
      }
      id v74 = MBGetDefaultLog();
      id v13 = v104;
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      {
        id v76 = *v106;
        *(_DWORD *)long long buf = 138412290;
        id v129 = v76;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to fetch devices: %@", buf, 0xCu);
        goto LABEL_70;
      }
    }
    else
    {
      id v74 = MBGetDefaultLog();
      id v13 = v104;
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      {
        id v75 = *v106;
        *(_DWORD *)long long buf = 138412290;
        id v129 = v75;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to fetch account record: %@", buf, 0xCu);
LABEL_70:
        _MBLog();
      }
    }

    goto LABEL_72;
  }
  +[MBError errorWithCode:205 format:@"Attempting to commit a snapshot that doesn't exist"];
  BOOL v42 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_76:

  return v42;
}

- (BOOL)_verifySnapshotWithError:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBCKBackupEngine _verifySnapshotWithError:]", "MBCKBackupEngine.m", 2229, "error");
  }
  int64_t v5 = [(MBEngine *)self backupPolicy];
  int64_t v6 = [(MBCKBackupEngine *)self backupReason];
  int64_t v7 = [(MBCKBackupEngine *)self snapshotFormat];
  id v8 = [(MBCKEngine *)self serviceAccount];
  LOBYTE(v5) = +[MBBackupSnapshotIntegrityVerifier shouldRunVerifierWithBackupPolicy:v5 backupReason:v6 snapshotFormat:v7 account:v8];

  uint64_t v9 = [(MBCKBackupEngine *)self telemetry];
  id v10 = v9;
  if (v5)
  {
    id v33 = a3;
    [v9 setSnapshotVerificationEnabled:1];

    int v11 = [(MBCKBackupEngine *)self attemptSummary];
    [v11 setSnapshotVerificationRan:1];

    id v12 = [(MBCKBackupEngine *)self telemetry];
    [v12 setSnapshotVerificationStatus:@"CANCELLED"];

    double v39 = 0.0;
    id v13 = [[MBBackupSnapshotIntegrityVerifier alloc] initWithDelegate:self];
    uint64_t v14 = [(MBCKEngine *)self ckOperationTracker];
    unint64_t v35 = [(MBCKBackupEngine *)self _scannerMode];
    unint64_t v34 = [(MBEngine *)self enginePolicy];
    uint64_t v15 = [(MBCKBackupEngine *)self mountedSnapshotTracker];
    uint64_t v16 = [(MBEngine *)self domainManager];
    BOOL v17 = [(MBCKEngine *)self device];
    id v18 = [v17 recordID];
    id v19 = [(MBCKEngine *)self device];
    uint64_t v20 = [v19 hmacKey];
    id v21 = [(MBCKBackupEngine *)self attemptSummary];
    id v37 = v13;
    id v38 = 0;
    id v22 = v13;
    id v23 = (void *)v14;
    LOBYTE(v14) = [(MBBackupSnapshotIntegrityVerifier *)v22 verifySnapshotAfterCommitWithOperationTracker:v14 scanMode:v35 enginePolicy:v34 snapshotTracker:v15 domainManager:v16 deviceRecordID:v18 hmacKey:v20 backupAttemptSummary:v21 duration:&v39 error:&v38];
    id v36 = v38;

    if (v14)
    {
      id v24 = [(MBCKBackupEngine *)self telemetry];
      [v24 setSnapshotVerificationStatus:@"PASS"];
      uint64_t v25 = v36;
    }
    else
    {
      uint64_t v25 = v36;
      if (+[MBError isError:withCodes:](MBError, "isError:withCodes:", v36, 500, 555, 0))
      {
        int64_t v28 = MBGetDefaultLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          id v41 = v36;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to verify snapshot: %@", buf, 0xCu);
          _MBLog();
        }

        id v29 = [(MBCKBackupEngine *)self telemetry];
        [v29 setSnapshotVerificationStatus:@"FAIL"];

        +[MBTapToRadar reportBackupVerificationFailure];
        BOOL v27 = 0;
        *id v33 = v36;
        goto LABEL_12;
      }
      id v24 = [(MBCKBackupEngine *)self telemetry];
      [v24 setSnapshotVerificationCancellationError:v36];
    }

    double v30 = v39;
    uint64_t v31 = [(MBCKBackupEngine *)self telemetry];
    [v31 setSnapshotVerificationDuration:v30];

    BOOL v27 = 1;
LABEL_12:

    return v27;
  }
  [v9 setSnapshotVerificationEnabled:0];

  id v26 = [(MBCKBackupEngine *)self attemptSummary];
  [v26 setSnapshotVerificationRan:0];

  return 1;
}

- (BOOL)finishBackupWithError:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBCKBackupEngine finishBackupWithError:]", "MBCKBackupEngine.m", 2274, "error");
  }
  BOOL v5 = -[MBCKBackupEngine _verifySnapshotWithError:](self, "_verifySnapshotWithError:");
  if (v5)
  {
    if ([(MBCKBackupEngine *)self _notifyPluginsOfBackupEnded:0 error:a3])
    {
      -[MBCKBackupEngine _unmountSnapshotsAndRemoveThem:](self, "_unmountSnapshotsAndRemoveThem:", [(id)objc_opt_class() _shouldRemoveSnapshotAfterError:0]);
      int64_t v6 = [(MBCKEngine *)self cache];
      int64_t v7 = [v6 size];
      id v8 = [(MBCKBackupEngine *)self telemetry];
      [v8 setCacheSize:v7];

      LOBYTE(v5) = 1;
    }
    else
    {
      uint64_t v9 = MBGetDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to notify plugins of backup ended", v11, 2u);
        _MBLog();
      }

      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (void)resumeWatchdogIfNeeded
{
  v3 = [(MBCKBackupEngine *)self lastWatchdogResume];

  if (!v3)
  {
    double v4 = +[NSDate date];
    [(MBCKBackupEngine *)self setLastWatchdogResume:v4];
  }
  BOOL v5 = [(MBCKBackupEngine *)self lastWatchdogResume];
  [v5 timeIntervalSinceNow];
  double v7 = v6;

  double v8 = -v7;
  if (v7 >= 0.0) {
    double v8 = v7;
  }
  if (v8 > 60.0)
  {
    uint64_t v9 = +[NSDate date];
    [(MBCKBackupEngine *)self setLastWatchdogResume:v9];

    id v10 = [(MBEngine *)self watchdog];
    [v10 resume];
  }
}

- (void)_unmountSnapshotsAndRemoveThem:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3 && (MBIsInternalInstall() & 1) == 0) {
    __assert_rtn("-[MBCKBackupEngine _unmountSnapshotsAndRemoveThem:]", "MBCKBackupEngine.m", 2310, "shouldRemove || MBIsInternalInstall()");
  }
  [(MBCKBackupEngine *)self mountedSnapshotTracker];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v23 = v30 = 0u;
  id obj = [v23 mountedSnapshots];
  id v5 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "volumeMountPoint", v19, v20, v21, v22);
        int v11 = [v9 snapshotMountPoint];
        id v12 = [v9 snapshotName];
        id v13 = MBGetDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138544130;
          uint64_t v32 = v12;
          __int16 v33 = 2114;
          unint64_t v34 = v10;
          __int16 v35 = 2114;
          id v36 = v11;
          __int16 v37 = 1024;
          LODWORD(v38) = v3;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Trying to unmount local snapshot %{public}@ for %{public}@ at %{public}@ (%d)", buf, 0x26u);
          id v21 = v11;
          id v22 = (id)v3;
          id v19 = v12;
          uint64_t v20 = v10;
          _MBLog();
        }

        if (v3)
        {
          id v26 = 0;
          unsigned __int8 v14 = +[MBFileSystemManager unmountAndDeleteSnapshotForVolume:v10 name:v12 mountPoint:v11 error:&v26];
          id v15 = v26;
          if (v14) {
            goto LABEL_18;
          }
        }
        else
        {
          uint64_t v16 = MBSnapshotNameWithCurrentDate();
          id v25 = 0;
          unsigned __int8 v17 = +[MBFileSystemManager unmountAndRenameSnapshotForVolume:v10 name:v12 mountPoint:v11 newName:v16 error:&v25];
          id v15 = v25;

          if (v17) {
            goto LABEL_18;
          }
        }
        if ((+[MBError isError:withCode:](MBError, "isError:withCode:", v15, 4, v19, v20, v21, v22) & 1) == 0)
        {
          id v18 = MBGetDefaultLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138544130;
            uint64_t v32 = v12;
            __int16 v33 = 2114;
            unint64_t v34 = v10;
            __int16 v35 = 2114;
            id v36 = v11;
            __int16 v37 = 2114;
            id v38 = v15;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to unmount snapshot %{public}@ for %{public}@ at %{public}@: %{public}@", buf, 0x2Au);
            id v21 = v11;
            id v22 = v15;
            id v19 = v12;
            uint64_t v20 = v10;
            _MBLog();
          }
        }
LABEL_18:
      }
      id v6 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v6);
  }
}

- (BOOL)_notifyPluginsOfBackupEnded:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(MBCKBackupEngine *)self pluginNotifier];
  id v18 = 0;
  unsigned __int8 v8 = [v7 notifyPluginsOfEndingBackupWithError:&v18];
  id v9 = v18;
  id v10 = v9;
  if (v8)
  {
    id v17 = v9;
    unsigned __int8 v11 = [v7 notifyPluginsOfEndedBackup:v6 error:&v17];
    id v12 = v17;

    if (v11)
    {
      BOOL v13 = 1;
LABEL_14:
      id v10 = v12;
      goto LABEL_15;
    }
    id v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to notify plugins of endingBackupWithEngine: %@", buf, 0xCu);
      _MBLog();
    }

    if (!a4)
    {
      BOOL v13 = 0;
      goto LABEL_14;
    }
    id v10 = v12;
    goto LABEL_12;
  }
  unsigned __int8 v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to notify plugins of endingBackupWithEngine: %@", buf, 0xCu);
    _MBLog();
  }

  if (a4)
  {
LABEL_12:
    id v10 = v10;
    BOOL v13 = 0;
    *a4 = v10;
    goto LABEL_15;
  }
  BOOL v13 = 0;
LABEL_15:

  return v13;
}

- (BOOL)fileScanner:(id)a3 isFileAddedOrModified:(id)a4
{
  id v5 = a4;
  id v6 = [(MBCKEngine *)self cache];
  uint64_t v7 = +[MBCKFile fileWithMBFile:v5 cache:v6];

  LOBYTE(v6) = (char *)[v7 changeType] - 1 < (char *)2;
  return (char)v6;
}

- (id)fileScanner:(id)a3 didFindFile:(id)a4
{
  id v5 = a4;
  id v6 = [(MBCKEngine *)self cache];
  uint64_t v7 = +[MBCKFile fileWithMBFile:v5 cache:v6];

  [(MBCKSnapshot *)self->_currentSnapshot type];
  uint64_t IsFull = MBSnapshotTypeIsFull();
  id v9 = [v7 changeTypeForFullBackup:IsFull];
  if (IsFull)
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v11 = [v5 domain];
      id v12 = [v5 relativePath];
      *(_DWORD *)long long buf = 134218498;
      id v50 = v9;
      __int16 v51 = 2112;
      id v52 = v11;
      __int16 v53 = 2112;
      *(void *)long long v54 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "=cloud-backup= Detected change type %lu for %@:%@ during full backup", buf, 0x20u);

      BOOL v13 = [v5 domain];
      [v5 relativePath];
      uint64_t v40 = v39 = v13;
      id v38 = v9;
      _MBLog();
    }
  }
  if (v9) {
    BOOL v14 = v9 == (id)3;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    id v15 = [(MBCKEngine *)self serviceAccount];
    uint64_t v16 = [(MBCKEngine *)self device];
    id v48 = 0;
    unsigned __int8 v17 = [v7 fetchEncryptionKeyWithAccount:v15 device:v16 error:&v48];
    id v18 = v48;

    if ((v17 & 1) == 0)
    {
      id v19 = MBGetDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v45 = [v5 inodeNumber];
        id v20 = [v5 size];
        id v47 = v18;
        unsigned int v21 = [v5 protectionClass];
        id v22 = [v5 domain];
        id v23 = [v22 name];
        id v24 = [v5 relativePath];
        *(_DWORD *)long long buf = 134219522;
        id v50 = v45;
        __int16 v51 = 2048;
        id v52 = v20;
        __int16 v53 = 1024;
        *(_DWORD *)long long v54 = v21;
        *(_WORD *)&void v54[4] = 2048;
        *(void *)&v54[6] = v9;
        __int16 v55 = 2112;
        id v56 = v23;
        __int16 v57 = 2112;
        double v58 = v24;
        __int16 v59 = 2112;
        id v60 = v47;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to fetch encryption key for inode:%llu, sz:%lld, pc:%d, changeType:%lu, (%@:%@): %@", buf, 0x44u);

        id v46 = [v5 inodeNumber];
        id v25 = [v5 size];
        LODWORD(v23) = [v5 protectionClass];
        id v26 = [v5 domain];
        long long v27 = [v26 name];
        v43 = [v5 relativePath];
        id v44 = v47;
        id v41 = v9;
        BOOL v42 = v27;
        id v39 = v25;
        uint64_t v40 = v23;
        id v38 = v46;
        _MBLog();

        id v18 = v47;
      }

      if (+[MBError isError:v18 withCode:209])
      {
        long long v28 = [(MBCKBackupEngine *)self telemetry];
        [v28 _countMissingEncryptionKeyForFile:v7];
      }
    }
    unsigned int v29 = objc_msgSend(v7, "isDirectory", v38, v39, v40, v41, v42, v43, v44);
    long long v30 = [(MBCKBackupEngine *)self telemetry];
    uint64_t v31 = v30;
    if (v29)
    {
      uint64_t v32 = [v30 backupDirectoryCount];
      __int16 v33 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v32 integerValue] + 1);
      unint64_t v34 = [(MBCKBackupEngine *)self telemetry];
      [v34 setBackupDirectoryCount:v33];
    }
    else
    {
      uint64_t v32 = [v30 backupFileCount];
      __int16 v33 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v32 integerValue] + 1);
      unint64_t v34 = [(MBCKBackupEngine *)self telemetry];
      [v34 setBackupFileCount:v33];
    }
  }
  __int16 v35 = [(MBCKEngine *)self cache];
  id v36 = [v35 fileSeen:v7 changeType:v9];

  return v36;
}

- (BOOL)fileScanner:(id)a3 failedToStatFile:(id)a4 withErrno:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a4;
  unsigned __int8 v8 = [v7 domain];
  id v9 = [v8 name];

  id v10 = [v7 relativePath];
  if (![v9 isEqualToString:@"SkippedFilesDomain"])
  {
    if ((int)v5 > 82)
    {
      if (v5 != 83 && v5 != 92) {
        goto LABEL_22;
      }
    }
    else if (v5 != 6 && v5 != 22)
    {
LABEL_22:
      unsigned __int8 v11 = MBGetDefaultLog();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      *(_DWORD *)long long buf = 138412802;
      long long v27 = v9;
      __int16 v28 = 2112;
      unsigned int v29 = v10;
      __int16 v30 = 1024;
      int v31 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "=cloud-backup= Not skipping file %@ %@ after stat error: %{errno}d", buf, 0x1Cu);
      goto LABEL_4;
    }
    unsigned __int8 v11 = [(MBCKEngine *)self cache];
    id v25 = 0;
    BOOL v13 = [v11 lastBackedUpFileWithDomainName:v9 relativePath:v10 error:&v25];
    BOOL v14 = v25;
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = MBGetDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "=cloud-backup= Error fetching last backed up file", buf, 2u);
        _MBLog();
      }

LABEL_16:
      BOOL v12 = 0;
LABEL_17:

      goto LABEL_18;
    }
    if ([v13 isDirectory])
    {
      id v15 = MBGetDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        long long v27 = v9;
        __int16 v28 = 2112;
        unsigned int v29 = v10;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "=cloud-backup= Cannot skip file %@ %@ from backup because it's a directory", buf, 0x16u);
        _MBLog();
      }
      goto LABEL_16;
    }
    id v15 = [(MBCKBackupEngine *)self skippedFileTracker];
    id v18 = MBGetDefaultLog();
    id v19 = v18;
    if (v15)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412802;
        long long v27 = v9;
        __int16 v28 = 2112;
        unsigned int v29 = v10;
        __int16 v30 = 1024;
        int v31 = v5;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Skipping file %@ %@ after stat error: %{errno}d", buf, 0x1Cu);
        _MBLog();
      }

      id v19 = [v15 trackSkippedFile:v7 syscallType:1 syscallErrno:v5];
      id v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        long long v27 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "=cloud-backup= Tracking skipped file %@", buf, 0xCu);
        _MBLog();
      }

      if (!v13) {
        goto LABEL_36;
      }
      unsigned int v21 = MBGetDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        long long v27 = v9;
        __int16 v28 = 2112;
        unsigned int v29 = v10;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Marking previously backed up file %@ %@ as unmodified", buf, 0x16u);
        _MBLog();
      }

      uint64_t v22 = [v11 fileSeen:v13 changeType:0];
      if (!v22)
      {
LABEL_36:
        BOOL v12 = 1;
LABEL_40:

        goto LABEL_17;
      }
      id v23 = (void *)v22;
      id v24 = MBGetDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to mark previously backed up file as modified", buf, 2u);
        _MBLog();
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "=cloud-backup= Not skipping file, nil skippedFileTracker", buf, 2u);
      _MBLog();
    }
    BOOL v12 = 0;
    goto LABEL_40;
  }
  unsigned __int8 v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "=cloud-backup= Not skipping file error encountered in skipped file domain", buf, 2u);
LABEL_4:
    _MBLog();
  }
LABEL_5:
  BOOL v12 = 0;
LABEL_18:

  return v12;
}

- (NSString)description
{
  BOOL v3 = (objc_class *)objc_opt_class();
  Name = class_getName(v3);
  [(MBCKBackupEngine *)self backupState];
  uint64_t v5 = MBCKStringForBackupState();
  id v6 = +[NSString stringWithFormat:@"<%p: %s, state:%@, cancelled:%d>", self, Name, v5, [(MBEngine *)self isCanceled]];

  return (NSString *)v6;
}

- (BOOL)shouldCancelVerification
{
  [(MBCKBackupEngine *)self resumeWatchdogIfNeeded];
  return [(MBCKEngine *)self handleCancelation:0];
}

- (BOOL)shouldCancelTranscription
{
  [(MBCKBackupEngine *)self resumeWatchdogIfNeeded];
  return [(MBCKEngine *)self handleCancelation:0];
}

- (unint64_t)_scannerMode
{
  if (_os_feature_enabled_impl() && (id)[(MBEngine *)self backupPolicy] != (id)1) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)_createDomainTranscriberForAPFSSnapshots:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(MBCKEngine *)self persona];
  if (!v7) {
    __assert_rtn("-[MBCKBackupEngine _createDomainTranscriberForAPFSSnapshots:error:]", "MBCKBackupEngine.m", 2471, "persona");
  }
  unsigned __int8 v8 = (void *)v7;
  uint64_t v9 = [(MBCKBackupEngine *)self currentSnapshot];
  if (!v9) {
    __assert_rtn("-[MBCKBackupEngine _createDomainTranscriberForAPFSSnapshots:error:]", "MBCKBackupEngine.m", 2474, "currentSnapshot");
  }
  id v10 = (void *)v9;
  unsigned __int8 v11 = [(MBCKBackupEngine *)self currentSnapshot];
  BOOL v12 = [v11 commitID];

  if (!v12) {
    __assert_rtn("-[MBCKBackupEngine _createDomainTranscriberForAPFSSnapshots:error:]", "MBCKBackupEngine.m", 2477, "currentSnapshotCommitID");
  }
  uint64_t v31 = 0;
  BOOL v13 = +[MBVolumeMap createOrLoadForPersona:v8 outLoadType:&v31 error:a4];
  if (v13)
  {
    BOOL v14 = +[MBVolumeMap loadTypeToStringWithLoadType:v31];
    [(MBCKBackupEngine *)self attemptSummary];
    id v15 = v30 = v12;
    [v15 setVolumeMapLoadType:v14];

    if ([v10 snapshotFormat] == (id)3) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = self;
    }
    unsigned __int8 v17 = v16;
    __int16 v28 = [MBDomainTranscriber alloc];
    id v18 = [v8 snapshotDatabaseDirectory];
    unint64_t v27 = [(MBCKBackupEngine *)self _scannerMode];
    unint64_t v19 = [(MBEngine *)self enginePolicy];
    id v20 = [v10 snapshotFormat];
    [(MBCKEngine *)self device];
    unsigned int v29 = v8;
    v22 = id v21 = v6;
    id v23 = [(MBCKBackupEngine *)self attemptSummary];
    id v24 = [(MBDomainTranscriber *)v28 initWithPendingCommitID:v30 snapshotDatabaseDirectory:v18 scanMode:v27 enginePolicy:v19 snapshotFormat:v20 device:v22 volumeMap:v13 snapshotTracker:v21 attemptSummary:v23 compatibilityDelegate:v17 delegate:self];

    BOOL v12 = v30;
    id v6 = v21;
    unsigned __int8 v8 = v29;
  }
  else
  {
    id v25 = MBGetDefaultLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to load volume map: %@", buf, 0xCu);
      _MBLog();
    }

    id v24 = 0;
    if (a4) {
      *a4 = 0;
    }
  }

  return v24;
}

- (BOOL)_shouldBackupUsingFSEvents
{
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    if (self->_snapshotType != 1 || MBSnapshotsAreTransitioningFormats(self->_previousSnapshot, self->_currentSnapshot))
    {
LABEL_4:
      LOBYTE(v3) = 0;
      return v3;
    }
    if (MBSnapshotFormatContainsManifests())
    {
      double v4 = [(MBCKEngine *)self cache];
      unsigned int v5 = [v4 previousSnapshotHasSkippedFiles];

      if (v5)
      {
        id v6 = MBGetDefaultLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)unsigned __int8 v8 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Previous snapshot has skipped files, not using FSEvents", v8, 2u);
          _MBLog();
        }

        goto LABEL_4;
      }
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (id)_fetchPreviousBackupFSEventState
{
  v2 = [(MBCKEngine *)self persona];
  id v3 = [v2 copyPreferencesValueForKey:@"FSEventState" class:objc_opt_class()];

  double v4 = [[MBFSEventState alloc] initWithDictionaryRepresentation:v3];
  unsigned int v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    unsigned __int8 v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Fetched previous FSEvent state of: %@", buf, 0xCu);
    _MBLog();
  }

  return v4;
}

- (void)_saveNextBackupFSEventState
{
  id v3 = [(MBCKBackupEngine *)self nextBackupFSEventState];
  double v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    unsigned __int8 v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "=cloud-backup= Updating FSEvent state to: %@", buf, 0xCu);
    _MBLog();
  }

  unsigned int v5 = [(MBCKEngine *)self persona];
  id v6 = [v3 dictionaryRepresentation];
  [v5 setPreferencesValue:v6 forKey:@"FSEventState"];
}

- (void)_sendTelemetryForStateChange:(unint64_t)a3 start:(id)a4 end:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  +[MBCKStatusReporter reportBackupStateChangeForEngine:self state:a3 start:v9 end:v8];
  +[MBPowerLog reportBackupStateChangeForEngine:self state:a3 start:v9 end:v8];
  +[MBCKTelemetry sendBackupEngineStateChangeStatus:self state:a3 start:v9 end:v8];
}

- (void)sendEngineCompletionTelemetry:(id)a3 duration:(double)a4 peakMemoryUsage:(unint64_t)a5
{
  id v8 = a3;
  +[MBCKStatusRequest sendStatusRequestWithEngine:self duration:v8 error:a4];
  +[MBCKTelemetry sendBackupEngineCompletionStatus:self duration:a5 peakMemoryUsage:v8 error:a4];
}

- (void)_finishCollectingTelemetry
{
  [(MBCKBackupEngine *)self backupReason];
  if (MBBackupReasonIsScheduled())
  {
    id v3 = [(MBCKEngine *)self ckOperationTracker];
    double v4 = [v3 ckOperationPolicy];
    unsigned int v5 = [v4 cellularAccess];

    if (v5)
    {
      +[MBCKManager inexpensiveCellularBalance];
      id v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      uint64_t v7 = [(MBCKBackupEngine *)self telemetry];
      [v7 setRemainingCellularBalance:v6];
    }
  }
  id v8 = [(MBCKBackupEngine *)self estimator];
  [v8 progressAtLastUpdate];
  if (v9 > 0.0)
  {
    id v10 = [v8 minutesRemaining];
    if (v10 != (id)-1)
    {
      unsigned __int8 v11 = +[NSNumber numberWithUnsignedInteger:v10];
      BOOL v12 = [(MBCKBackupEngine *)self telemetry];
      [v12 setMinutesRemaining:v11];
    }
  }
  BOOL v13 = [(MBCKEngine *)self serviceManager];
  id v14 = [v13 networkConnectivity];
  uint64_t v16 = v15;
  unsigned __int8 v17 = [(MBCKBackupEngine *)self telemetry];
  objc_msgSend(v17, "setNetworkConnectivityAtFinish:", v14, v16);

  id v18 = [(MBCKEngine *)self engineError];
  unint64_t v19 = [(MBCKBackupEngine *)self attemptSummary];
  [v19 setError:v18];

  id v20 = [(MBCKEngine *)self cache];
  id v21 = [v20 size];
  id v22 = [v21 unsignedLongLongValue];
  id v23 = [(MBCKBackupEngine *)self attemptSummary];
  [v23 setLegacyCacheSize:v22];

  uint64_t v45 = 0;
  id v24 = [(MBCKEngine *)self persona];
  id v25 = [v24 snapshotDatabaseDirectory];
  id v44 = 0;
  uint64_t v26 = MBCalculateDiskUsageForSnapshotDirectory(v25, &v45, &v44);
  id v27 = v44;

  if (v26 < 0)
  {
    __int16 v30 = MBGetDefaultLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v47 = v27;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "=cloud-backup= Failed to calculate disk usage for snapshot directory: %@", buf, 0xCu);
      _MBLog();
    }
  }
  else
  {
    __int16 v28 = [(MBCKBackupEngine *)self attemptSummary];
    [v28 setSnapshotDirectorySize:v26];

    uint64_t v29 = v45;
    __int16 v30 = [(MBCKBackupEngine *)self attemptSummary];
    [v30 setSnapshotDirectoryCloneSize:v29];
  }

  uint64_t v31 = MBPeakProcessMemoryUsage();
  uint64_t v32 = [(MBCKBackupEngine *)self attemptSummary];
  [v32 setPeakMemoryUsage:v31];

  if (MBIsInternalInstall())
  {
    uint64_t v33 = [(MBCKBackupEngine *)self attemptSummary];
    unint64_t v34 = [v33 commitID];

    if (v34)
    {
      __int16 v35 = [(MBCKBackupEngine *)self attemptSummary];
      id v36 = [(MBCKEngine *)self persona];
      __int16 v37 = [v36 snapshotDatabaseDirectory];
      id v38 = [(MBCKBackupEngine *)self attemptSummary];
      id v39 = [v38 commitID];
      id v43 = 0;
      char v40 = MBAppendAttemptSummaryToPlist(v35, v37, (uint64_t)v39, &v43);
      id v41 = v43;

      if ((v40 & 1) == 0 && !dword_100482394 && !atomic_fetch_add_explicit(&dword_100482394, 1u, memory_order_relaxed))
      {
        BOOL v42 = MBGetDefaultLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v47 = v41;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_FAULT, "=cloud-backup= =cloud-backup= Failed to append attempt summary to plist: %@", buf, 0xCu);
          _MBLog();
        }
      }
    }
  }
}

- (NSString)pendingSnapshotID
{
  v2 = [(MBCKBackupEngine *)self currentSnapshot];
  id v3 = [v2 snapshotID];

  return (NSString *)v3;
}

- (void)syncProgress:(double)a3
{
  double v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134217984;
    double v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "=cloud-backup= BYClientDaemonCloudSyncProtocol sync progress: %f", buf, 0xCu);
    _MBLog();
  }
}

- (void)syncCompletedWithErrors:(id)a3
{
  id v3 = a3;
  id v4 = [v3 count];
  unsigned int v5 = MBGetDefaultLog();
  double v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "=cloud-backup= BYClientDaemonCloudSyncProtocol syncCompletedWithErrors: %@", buf, 0xCu);
LABEL_6:
      _MBLog();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "=cloud-backup= BYClientDaemonCloudSyncProtocol sync completed.", buf, 2u);
    goto LABEL_6;
  }
}

- (int64_t)backupReason
{
  return self->_backupReason;
}

- (void)setBackupReason:(int64_t)a3
{
  self->_backupReason = a3;
}

- (int64_t)snapshotType
{
  return self->_snapshotType;
}

- (void)setSnapshotType:(int64_t)a3
{
  self->_snapshotType = a3;
}

- (NSString)backupStateDescription
{
  return self->_backupStateDescription;
}

- (void)setBackupStateDescription:(id)a3
{
}

- (int64_t)snapshotFormat
{
  return self->_snapshotFormat;
}

- (void)setSnapshotFormat:(int64_t)a3
{
  self->_snapshotFormat = a3;
}

- (MBDurationEstimation)estimator
{
  return (MBDurationEstimation *)objc_getProperty(self, a2, 304, 1);
}

- (void)setEstimator:(id)a3
{
}

- (int64_t)cameraRollBackupState
{
  return self->_cameraRollBackupState;
}

- (void)setCameraRollBackupState:(int64_t)a3
{
  self->_cameraRollBackupState = a3;
}

- (MBBackupTelemetry)telemetry
{
  return self->_telemetry;
}

- (MBBackupAttemptSummary)attemptSummary
{
  return self->_attemptSummary;
}

- (MBCKSnapshot)previousSnapshot
{
  return self->_previousSnapshot;
}

- (void)setPreviousSnapshot:(id)a3
{
}

- (MBCKSnapshot)currentSnapshot
{
  return self->_currentSnapshot;
}

- (void)setCurrentSnapshot:(id)a3
{
}

- (unint64_t)backupState
{
  return self->_backupState;
}

- (NSDate)lastWatchdogResume
{
  return self->_lastWatchdogResume;
}

- (void)setLastWatchdogResume:(id)a3
{
}

- (MBMountedSnapshotTracker)mountedSnapshotTracker
{
  return self->_mountedSnapshotTracker;
}

- (void)setMountedSnapshotTracker:(id)a3
{
}

- (MBFSEventState)nextBackupFSEventState
{
  return self->_nextBackupFSEventState;
}

- (void)setNextBackupFSEventState:(id)a3
{
}

- (__MKBAssertion)lockAssertionRef
{
  return self->_lockAssertionRef;
}

- (void)setLockAssertionRef:(__MKBAssertion *)a3
{
  self->_lockAssertionRef = a3;
}

- (MBBackupLifecyclePluginNotifier)pluginNotifier
{
  return self->_pluginNotifier;
}

- (void)setPluginNotifier:(id)a3
{
}

- (MBSkippedFileTracker)skippedFileTracker
{
  return self->_skippedFileTracker;
}

- (void)setSkippedFileTracker:(id)a3
{
}

- (MBPendingSnapshotDB)pendingSnapshotDatabase
{
  return self->_pendingSnapshotDatabase;
}

- (void)setPendingSnapshotDatabase:(id)a3
{
}

- (MBCacheDeleteRequest)cacheDeleteRequest
{
  return (MBCacheDeleteRequest *)objc_getProperty(self, a2, 416, 1);
}

- (void)setCacheDeleteRequest:(id)a3
{
}

- (BYBuddyDaemonCloudSyncClient)cloudSyncClient
{
  return self->_cloudSyncClient;
}

- (void)setCloudSyncClient:(id)a3
{
}

- (unint64_t)totalSize
{
  return self->_totalSize;
}

- (void)setTotalSize:(unint64_t)a3
{
  self->_totalSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudSyncClient, 0);
  objc_storeStrong((id *)&self->_cacheDeleteRequest, 0);
  objc_storeStrong((id *)&self->_pendingSnapshotDatabase, 0);
  objc_storeStrong((id *)&self->_skippedFileTracker, 0);
  objc_storeStrong((id *)&self->_pluginNotifier, 0);
  objc_storeStrong((id *)&self->_nextBackupFSEventState, 0);
  objc_storeStrong((id *)&self->_mountedSnapshotTracker, 0);
  objc_storeStrong((id *)&self->_lastWatchdogResume, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_previousSnapshot, 0);
  objc_storeStrong((id *)&self->_attemptSummary, 0);
  objc_storeStrong((id *)&self->_telemetry, 0);
  objc_storeStrong((id *)&self->_estimator, 0);
  objc_storeStrong((id *)&self->_backupStateDescription, 0);
  objc_storeStrong((id *)&self->_domainNamesToUpload, 0);
}

@end