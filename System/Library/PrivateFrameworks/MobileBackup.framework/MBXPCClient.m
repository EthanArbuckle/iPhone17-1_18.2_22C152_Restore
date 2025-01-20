@interface MBXPCClient
- (BOOL)_isBackupAgent2Running;
- (BOOL)_restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 qos:(id)a5 context:(id)a6 error:(id *)a7;
- (BOOL)acquireLockWithBackupUDID:(id)a3 owner:(id)a4 timeout:(double)a5 error:(id *)a6;
- (BOOL)addFileToBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 fromPath:(id)a7 error:(id *)a8;
- (BOOL)airTrafficShouldCreateAppPlaceholdersWithError:(id *)a3;
- (BOOL)allowiTunesBackup;
- (BOOL)archiveLogsTo:(id)a3 error:(id *)a4;
- (BOOL)cancelApplicationRestoreWithBundleID:(id)a3 error:(id *)a4;
- (BOOL)cancelDeviceTransferWithTaskType:(int64_t)a3 error:(id *)a4;
- (BOOL)clearAllPendingFollowUpsWithError:(id *)a3;
- (BOOL)countCameraRollQuota;
- (BOOL)countCameraRollQuotaForBackupUDID:(id)a3 error:(id *)a4;
- (BOOL)deleteAccountWithError:(id *)a3;
- (BOOL)deleteBackupUDID:(id)a3 error:(id *)a4;
- (BOOL)deleteItemFromBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 error:(id *)a7;
- (BOOL)deleteSnapshotID:(unint64_t)a3 fromBackupUDID:(id)a4 error:(id *)a5;
- (BOOL)discountCameraRollQuota;
- (BOOL)discountCameraRollQuotaForBackupUDID:(id)a3 error:(id *)a4;
- (BOOL)exitMegaBackupMode:(id *)a3;
- (BOOL)extractItemFromBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 toPath:(id)a7 error:(id *)a8;
- (BOOL)inheritSnapshot:(id)a3 fromDevice:(id)a4 error:(id *)a5;
- (BOOL)isBackupEnabled;
- (BOOL)isBackupEnabledForDomainName:(id)a3;
- (BOOL)isBackupOnCellularAllowedWithAccount:(id)a3 error:(id *)a4;
- (BOOL)isBackupOnCellularEnabledWithError:(id *)a3;
- (BOOL)isInitialMegaBackupCompleted:(id *)a3;
- (BOOL)isLocalBackupPasswordSetWithError:(id *)a3;
- (BOOL)isManualBackupOnCellularAllowedWithAccount:(id)a3 error:(id *)a4;
- (BOOL)logPrebuddyFlowTelemetry:(int64_t)a3 error:(id *)a4;
- (BOOL)mergeSnapshots:(id)a3 backupUUID:(id)a4 error:(id *)a5;
- (BOOL)pinSnapshotID:(unint64_t)a3 backupUDID:(id)a4 error:(id *)a5;
- (BOOL)postFollowUpForBackgroundRestoreProgress:(id)a3 error:(id *)a4;
- (BOOL)postFollowUpForDrySpellWithDuration:(double)a3 firstBackup:(BOOL)a4 error:(id *)a5;
- (BOOL)postFollowUpForRestoreFailedWithDomainNames:(id)a3 error:(id *)a4;
- (BOOL)postFollowUpForRestoreFinishedWithError:(id *)a3 skipiCloudQuotaOffer:(BOOL)a4;
- (BOOL)postFollowUpForRestoreTimeoutWithError:(id *)a3;
- (BOOL)prepareForBackgroundRestoreWithError:(id *)a3;
- (BOOL)recordRestoreFailure:(id)a3 error:(id *)a4;
- (BOOL)releaseLockWithBackupUDID:(id)a3 owner:(id)a4 error:(id *)a5;
- (BOOL)removeDomainName:(id)a3 error:(id *)a4;
- (BOOL)requestMegaBackupExpirationDate:(id)a3 error:(id *)a4;
- (BOOL)restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 context:(id)a5 error:(id *)a6;
- (BOOL)restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 error:(id *)a5;
- (BOOL)restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 withQOS:(int64_t)a5 context:(id)a6 error:(id *)a7;
- (BOOL)restoreBookWithPath:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)restoreBookWithPath:(id)a3 error:(id *)a4;
- (BOOL)restoreDataExistsForApplicationWithBundleID:(id)a3 size:(unint64_t *)a4;
- (BOOL)restoreDomain:(id)a3 deviceUUID:(id)a4 snapshotUUID:(id)a5 intoPath:(id)a6 error:(id *)a7;
- (BOOL)restoreFileExistsWithPath:(id)a3;
- (BOOL)restoreFileWithPath:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)restoreFileWithPath:(id)a3 error:(id *)a4;
- (BOOL)restoreFilesForDomain:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 range:(_NSRange)a6 error:(id *)a7 progress:(id)a8;
- (BOOL)restoreFilesWithPaths:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)restoreFilesWithPaths:(id)a3 error:(id *)a4;
- (BOOL)restorePreviousSettingsEnabledForMegaBackup:(id *)a3;
- (BOOL)restoreSupportsBatching;
- (BOOL)resumeDeviceTransferWithTaskType:(int64_t)a3 error:(id *)a4;
- (BOOL)saveKeybagsForBackupUDID:(id)a3 withError:(id *)a4;
- (BOOL)setBackupOnCellularEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)setEntryPointForMegaBackupTelemetry:(int64_t)a3 error:(id *)a4;
- (BOOL)setMegaBackupTurnOnAllAppsSyncTelemetry:(BOOL)a3 error:(id *)a4;
- (BOOL)setMegaBackupTurnOniCloudBackupTelemetry:(BOOL)a3 error:(id *)a4;
- (BOOL)setPrebuddyUIDeltaTelemetry:(id)a3 date:(id)a4 error:(id *)a5;
- (BOOL)setupBackupWithPasscode:(id)a3 error:(id *)a4;
- (BOOL)shouldSupportiTunes;
- (BOOL)startBackupWithError:(id *)a3;
- (BOOL)startBackupWithOptions:(id)a3 error:(id *)a4;
- (BOOL)startDeviceTransferWithTaskType:(int64_t)a3 sessionInfo:(id)a4 error:(id *)a5;
- (BOOL)startRestoreForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 error:(id *)a5;
- (BOOL)startScanForBundleIDs:(id)a3 error:(id *)a4;
- (BOOL)startScanWithError:(id *)a3;
- (BOOL)unpinSnapshotID:(unint64_t)a3 backupUDID:(id)a4 error:(id *)a5;
- (BOOL)unsetLocalBackupPasswordWithError:(id *)a3;
- (BOOL)updateMegaBackupExpirationDate:(id)a3 error:(id *)a4;
- (BOOL)wasBackupEnabledForMegaBackup:(id *)a3;
- (MBCellularDataSubscriptionMonitor)cellularDataSubscriptionMonitor;
- (MBConnection)connection;
- (MBXPCClient)initWithAccount:(id)a3 delegate:(id)a4 eventQueue:(id)a5;
- (MBXPCClient)initWithAccount:(id)a3 delegate:(id)a4 eventQueue:(id)a5 error:(id *)a6;
- (MBXPCClient)initWithDelegate:(id)a3 eventQueue:(id)a4;
- (MBXPCClient)initWithDelegate:(id)a3 eventQueue:(id)a4 personaIdentifier:(id)a5;
- (OS_dispatch_group)initialBackupOnCellularSupportGroup;
- (id)_makeConnection;
- (id)_sendRequest:(id)a3 arguments:(id)a4;
- (id)_sendRequest:(id)a3 arguments:(id)a4 error:(id *)a5;
- (id)backgroundRestoreCellularAccessWithError:(id *)a3;
- (id)backgroundRestoreInfo;
- (id)backupDeviceUUID;
- (id)backupState;
- (id)dateOfLastBackup;
- (id)dateOfLastBackupWithError:(id *)a3;
- (id)dateOfNextScheduledBackup;
- (id)dateOfNextScheduledBackupWithError:(id *)a3;
- (id)deviceLockInfosWithError:(id *)a3;
- (id)disabledDomainInfos;
- (id)domainInfoForName:(id)a3;
- (id)domainInfoList;
- (id)dryRestore:(id)a3 snapshotUUID:(id)a4 error:(id *)a5;
- (id)fetchBackupCKRecordsIntoDB:(id *)a3;
- (id)filesForSnapshotID:(unint64_t)a3 backupUDID:(id)a4 error:(id *)a5;
- (id)getAppleIDsForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 activeAppleID:(id *)a5 error:(id *)a6;
- (id)getAppleIDsForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 error:(id *)a5;
- (id)getAppleIDsMapForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 activeAppleID:(id *)a5 error:(id *)a6;
- (id)getBackupListWithError:(id *)a3;
- (id)getBackupListWithFiltering:(BOOL)a3 error:(id *)a4;
- (id)getBuddyDataStashForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 error:(id *)a5;
- (id)journalForBackupUUID:(id)a3 error:(id *)a4;
- (id)journalLastModifiedForBackupUUID:(id)a3 error:(id *)a4;
- (id)nextBackupSizeInfo;
- (id)pendingSnapshotForCurrentDeviceWithError:(id *)a3;
- (id)personalPersonaIdentifier;
- (id)reservedBackupSizeListWithError:(id *)a3;
- (id)restoreFailuresForDataclass:(id)a3 assetType:(id)a4 range:(_NSRange)a5;
- (id)restoreFilesForDomain:(id)a3 error:(id *)a4;
- (id)restoreFilesForDomain:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 error:(id *)a6;
- (id)restoreFilesForDomain:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 range:(_NSRange)a6 error:(id *)a7;
- (id)restoreInfo;
- (id)restoreState;
- (id)restoreStateWithError:(id *)a3;
- (id)scheduleActivities:(id)a3 error:(id *)a4;
- (id)synchronizeFileListsWithDeviceUUID:(id)a3 commitID:(id)a4 error:(id *)a5;
- (unint64_t)_backupOnCellularSupport;
- (unint64_t)backupOnCellularSupportWithAccount:(id)a3 error:(id *)a4;
- (unint64_t)countOfRestoreFailuresForDataclass:(id)a3 assetType:(id)a4;
- (unint64_t)nextBackupSize;
- (void)_makeConnection;
- (void)accountChanged:(id)a3;
- (void)boostBackgroundRestoreWithCompletionHandler:(id)a3;
- (void)cancel;
- (void)cancelRestore;
- (void)clearRestoreSession;
- (void)connection:(id)a3 didReceiveMessage:(id)a4;
- (void)connectionWasInterrupted:(id)a3;
- (void)connectionWasInvalidated:(id)a3;
- (void)dealloc;
- (void)fetchAppBundleIDsForSnapshot:(id)a3 completion:(id)a4;
- (void)fetchBackgroundRestoreCellularAccessWithCompletion:(id)a3;
- (void)fetchRestorableSnapshotsWithCompletion:(id)a3;
- (void)fetchiCloudRestoreIsCompleteWithCompletion:(id)a3;
- (void)finishRestore;
- (void)insufficientFreeSpaceToRestore;
- (void)keyBagIsLocking;
- (void)keyBagIsUnlocked;
- (void)prioritizeRestoreFileWithPath:(id)a3;
- (void)rebootDevice;
- (void)rebootDevice:(BOOL)a3;
- (void)repair;
- (void)saveBackgroundRestoreCellularAccess:(id)a3 completion:(id)a4;
- (void)saveBackupDomainsEnabledForMegaBackup:(id)a3;
- (void)saveBackupEnabledForMegaBackup;
- (void)saveSyncSettingsEnabledForMegaBackup:(id)a3;
- (void)setAllowiTunesBackup:(BOOL)a3;
- (void)setBackupEnabled:(BOOL)a3;
- (void)setBackupEnabled:(BOOL)a3 forDomainName:(id)a4;
- (void)setCellularDataSubscriptionMonitor:(id)a3;
- (void)setConnection:(id)a3;
- (void)setInitialBackupOnCellularSupportGroup:(id)a3;
- (void)setRestoreQualityOfService:(int64_t)a3;
- (void)setRestoreSessionWithBackupUDID:(id)a3 snapshotUUID:(id)a4;
- (void)setShouldSupportiTunes:(BOOL)a3;
- (void)setSupportsiTunes:(BOOL)a3;
- (void)startDataTransferWithPreflightInfo:(id)a3 completionHandler:(id)a4;
- (void)startKeychainDataImportWithKeychainInfo:(id)a3 completionHandler:(id)a4;
- (void)startKeychainDataTransferWithCompletionHandler:(id)a3;
- (void)startKeychainTransferWithCompletionHandler:(id)a3;
- (void)startPreflightWithCompletionHandler:(id)a3;
- (void)startRestoreForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 options:(id)a5 completion:(id)a6;
- (void)startRestoreForSnapshot:(id)a3 options:(id)a4 completion:(id)a5;
- (void)startWatchingBackupAgent2;
- (void)syncBackupEnabled;
- (void)wakeUp;
@end

@implementation MBXPCClient

- (MBXPCClient)initWithDelegate:(id)a3 eventQueue:(id)a4
{
  return [(MBXPCClient *)self initWithDelegate:a3 eventQueue:a4 personaIdentifier:0];
}

- (MBXPCClient)initWithDelegate:(id)a3 eventQueue:(id)a4 personaIdentifier:(id)a5
{
  id v8 = a3;
  dispatch_queue_t v9 = (dispatch_queue_t)a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MBXPCClient;
  v11 = [(MBManager *)&v16 _init];
  if (v11)
  {
    if (!v9)
    {
      v12 = (objc_class *)objc_opt_class();
      Name = class_getName(v12);
      v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v9 = dispatch_queue_create(Name, v14);
    }
    objc_storeStrong((id *)&v11->_eventQueue, v9);
    v11->_enabledToken = -1;
    objc_storeStrong((id *)&v11->_personaIdentifier, a5);
    [(MBManager *)v11 setDelegate:v8];
  }

  return v11;
}

- (MBXPCClient)initWithAccount:(id)a3 delegate:(id)a4 eventQueue:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10) {
    -[MBXPCClient initWithAccount:delegate:eventQueue:error:]();
  }
  v13 = v12;
  v14 = [v10 personaIdentifier];
  if ([v10 isDataSeparatedAccount])
  {
    if (!v14)
    {
      if (a6)
      {
        id v15 = +[MBError errorWithCode:1 format:@"Nil persona identifier for Data Separated account"];
        v14 = 0;
LABEL_11:
        objc_super v16 = 0;
        *a6 = v15;
        goto LABEL_25;
      }
      goto LABEL_23;
    }
  }
  else
  {
    if (!objc_msgSend(v10, "aa_isAccountClass:", *MEMORY[0x1E4F4BF38]))
    {
      if (a6)
      {
        id v15 = +[MBError errorWithCode:1 format:@"ACAccount not eligible for backup"];
        goto LABEL_11;
      }
LABEL_24:
      objc_super v16 = 0;
      goto LABEL_25;
    }
    if (!v14)
    {
      v17 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
      v18 = v17;
      if (v17)
      {
        uint64_t v19 = [v17 userPersonaUniqueString];
        if (v19)
        {
          v14 = (void *)v19;

          goto LABEL_8;
        }
        if (a6)
        {
          *a6 = +[MBError errorWithCode:1 format:@"Nil persona identifier for Primary account"];
        }
      }
      else
      {
        if (a6)
        {
          *a6 = +[MBError errorWithCode:1 format:@"Failed to fetch the attributes for personal persona"];
        }
        v20 = MBGetDefaultLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v28) = 0;
          _os_log_impl(&dword_1DD9AE000, v20, OS_LOG_TYPE_ERROR, "Failed to fetch the attributes for personal persona", (uint8_t *)&v28, 2u);
          _MBLog(@"ERROR", (uint64_t)"Failed to fetch the attributes for personal persona", v21, v22, v23, v24, v25, v26, v28);
        }
      }
LABEL_23:
      v14 = 0;
      goto LABEL_24;
    }
  }
LABEL_8:
  self = [(MBXPCClient *)self initWithDelegate:v11 eventQueue:v13 personaIdentifier:v14];
  objc_super v16 = self;
LABEL_25:

  return v16;
}

- (MBXPCClient)initWithAccount:(id)a3 delegate:(id)a4 eventQueue:(id)a5
{
  return [(MBXPCClient *)self initWithAccount:a3 delegate:a4 eventQueue:a5 error:0];
}

- (void)dealloc
{
  v3 = [(MBXPCClient *)self connection];
  [v3 cancel];

  [(MBXPCClient *)self setConnection:0];
  int iTunesRestoreStartedNotificationToken = self->_iTunesRestoreStartedNotificationToken;
  if (iTunesRestoreStartedNotificationToken) {
    notify_cancel(iTunesRestoreStartedNotificationToken);
  }
  int iTunesRestoreEndedNotificationToken = self->_iTunesRestoreEndedNotificationToken;
  if (iTunesRestoreEndedNotificationToken) {
    notify_cancel(iTunesRestoreEndedNotificationToken);
  }
  timer = self->_timer;
  if (timer) {
    dispatch_source_cancel(timer);
  }
  int enabledToken = self->_enabledToken;
  if (enabledToken != -1) {
    notify_cancel(enabledToken);
  }
  v8.receiver = self;
  v8.super_class = (Class)MBXPCClient;
  [(MBXPCClient *)&v8 dealloc];
}

- (BOOL)_isBackupAgent2Running
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)v18 = xmmword_1DD9F10C8;
  uint64_t v19 = 0;
  size_t size = 0;
  if (sysctl(v18, 3u, 0, &size, 0, 0))
  {
    v2 = MBGetDefaultLog();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      dispatch_queue_t v9 = 0;
      goto LABEL_9;
    }
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1DD9AE000, v2, OS_LOG_TYPE_ERROR, "Error obtaining process list size", (uint8_t *)&v16, 2u);
    dispatch_queue_t v9 = 0;
    id v10 = "Error obtaining process list size";
    goto LABEL_7;
  }
  dispatch_queue_t v9 = (char *)malloc_type_malloc(size, 0xBC1E9D96uLL);
  if (sysctl(v18, 3u, v9, &size, 0, 0))
  {
    v2 = MBGetDefaultLog();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

LABEL_10:
      BOOL v11 = 0;
      goto LABEL_11;
    }
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1DD9AE000, v2, OS_LOG_TYPE_ERROR, "Error obtaining process list", (uint8_t *)&v16, 2u);
    id v10 = "Error obtaining process list";
LABEL_7:
    _MBLog(@"ERROR", (uint64_t)v10, v3, v4, v5, v6, v7, v8, v16);
    goto LABEL_9;
  }
  unint64_t v13 = (int)size / 0x288uLL;
  if ((int)v13 < 1) {
    goto LABEL_10;
  }
  uint64_t v14 = 0;
  uint64_t v15 = 648 * v13;
  while (*(int *)&v9[v14 + 40] < 1
       || !strstr(&v9[v14 + 243], (const char *)[@"BackupAgent2" UTF8String]))
  {
    v14 += 648;
    if (v15 == v14) {
      goto LABEL_10;
    }
  }
  BOOL v11 = 1;
LABEL_11:
  free(v9);
  return v11;
}

- (void)startWatchingBackupAgent2
{
  uint64_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_eventQueue);
  timer = self->_timer;
  self->_timer = v3;

  uint64_t v5 = self->_timer;
  if (v5)
  {
    dispatch_time_t v6 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v5, v6, 0x12A05F200uLL, 5uLL);
    uint64_t v7 = self->_timer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __40__MBXPCClient_startWatchingBackupAgent2__block_invoke;
    handler[3] = &unk_1E6D00E18;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume((dispatch_object_t)self->_timer);
  }
  else
  {
    uint64_t v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD9AE000, v8, OS_LOG_TYPE_ERROR, "Failed to create timer to monitor BackupAgent2", buf, 2u);
      _MBLog(@"ERROR", (uint64_t)"Failed to create timer to monitor BackupAgent2", v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

void __40__MBXPCClient_startWatchingBackupAgent2__block_invoke(uint64_t a1)
{
  char v6 = 0;
  v2 = +[MBPersona personalPersonaWithError:0];
  int v3 = [v2 getBooleanValueForKey:@"DriveRestoreInProgress" keyExists:&v6];
  uint64_t v4 = *(unsigned __int8 **)(a1 + 32);
  if (v4[32] | v3)
  {
    if (([v4 _isBackupAgent2Running] & 1) == 0)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
      [v2 setPreferencesValue:0 forKey:@"DriveRestoreInProgress"];
      uint64_t v5 = [*(id *)(a1 + 32) delegate];
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
        [v5 managerDidFinishRestore:*(void *)(a1 + 32)];
      }
    }
  }
  else
  {
    [v4 startWatchingBackupAgent2];
  }
}

- (void)setSupportsiTunes:(BOOL)a3
{
  BOOL v3 = a3;
  -[MBXPCClient setShouldSupportiTunes:](self, "setShouldSupportiTunes:");
  if (v3)
  {
    uint64_t v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD9AE000, v5, OS_LOG_TYPE_INFO, "MBManager is now monitoring iTunes restores", buf, 2u);
      _MBLog(@"INFO", (uint64_t)"MBManager is now monitoring iTunes restores", v6, v7, v8, v9, v10, v11, v32[0]);
    }

    uint64_t v12 = (const char *)[@"com.apple.private.restrict-post.MobileBackup.Drive.RestoreStarted" UTF8String];
    eventQueue = self->_eventQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __33__MBXPCClient_setSupportsiTunes___block_invoke;
    handler[3] = &unk_1E6D011C0;
    handler[4] = self;
    if (notify_register_dispatch(v12, &self->_iTunesRestoreStartedNotificationToken, eventQueue, handler))
    {
      uint64_t v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD9AE000, v14, OS_LOG_TYPE_ERROR, "Failed to start monitoring for iTunes restore session start", buf, 2u);
        _MBLog(@"ERROR", (uint64_t)"Failed to start monitoring for iTunes restore session start", v15, v16, v17, v18, v19, v20, v32[0]);
      }
    }
    uint64_t v21 = (const char *)[@"com.apple.private.restrict-post.MobileBackup.Drive.RestoreEnded" UTF8String];
    uint64_t v22 = self->_eventQueue;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = (uint64_t)__33__MBXPCClient_setSupportsiTunes___block_invoke_38;
    v32[3] = (uint64_t)&unk_1E6D011C0;
    v32[4] = (uint64_t)self;
    if (notify_register_dispatch(v21, &self->_iTunesRestoreEndedNotificationToken, v22, v32))
    {
      uint64_t v23 = MBGetDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD9AE000, v23, OS_LOG_TYPE_ERROR, "Failed to start monitoring for iTunes restore session end", buf, 2u);
        _MBLog(@"ERROR", (uint64_t)"Failed to start monitoring for iTunes restore session end", v24, v25, v26, v27, v28, v29, v32[0]);
      }
    }
    [(MBXPCClient *)self startWatchingBackupAgent2];
  }
  else
  {
    int iTunesRestoreStartedNotificationToken = self->_iTunesRestoreStartedNotificationToken;
    if (iTunesRestoreStartedNotificationToken)
    {
      notify_cancel(iTunesRestoreStartedNotificationToken);
      self->_int iTunesRestoreStartedNotificationToken = 0;
    }
    int iTunesRestoreEndedNotificationToken = self->_iTunesRestoreEndedNotificationToken;
    if (iTunesRestoreEndedNotificationToken)
    {
      notify_cancel(iTunesRestoreEndedNotificationToken);
      self->_int iTunesRestoreEndedNotificationToken = 0;
    }
  }
}

uint64_t __33__MBXPCClient_setSupportsiTunes___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = 1;
  return result;
}

uint64_t __33__MBXPCClient_setSupportsiTunes___block_invoke_38(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    uint64_t v4 = (void *)v2;
    if (objc_opt_respondsToSelector()) {
      [v4 managerDidFinishRestore:*(void *)(a1 + 32)];
    }
  }
  return MEMORY[0x1F4181870]();
}

- (BOOL)setupBackupWithPasscode:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_1DD9AE000, "setupBackupWithPasscode:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v7, &v12);
  if (v6)
  {
    v13[0] = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v9 = [(MBXPCClient *)self _sendRequest:@"kMBMessageSetupBackup" arguments:v8 error:a4];
  char v10 = [v9 BOOLValue];

  os_activity_scope_leave(&v12);
  return v10;
}

- (BOOL)isBackupEnabled
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "isBackupEnabled", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  uint64_t v4 = [MEMORY[0x1E4F74230] sharedConnection];
  char v5 = [v4 isEphemeralMultiUser];

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4FB3700] currentPersona];
    uint64_t v8 = v7;
    if (!self->_personaIdentifier
      && (([v7 isPersonalPersona] & 1) != 0
       || ([v8 isDefaultPersona] & 1) != 0
       || [v8 isSystemPersona]))
    {
      uint64_t v18 = self;
      objc_sync_enter(v18);
      p_int enabledToken = &v18->_enabledToken;
      int enabledToken = v18->_enabledToken;
      if (enabledToken == -1)
      {
        uint32_t v21 = notify_register_check("com.apple.private.restrict-post.MobileBackup.EnabledState", &v18->_enabledToken);
        if (v21)
        {
          uint64_t v22 = MBGetDefaultLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v47 = v21;
            _os_log_impl(&dword_1DD9AE000, v22, OS_LOG_TYPE_ERROR, "notify_register_check failed: %lu", buf, 0xCu);
            _MBLog(@"ERROR", (uint64_t)"notify_register_check failed: %lu", v23, v24, v25, v26, v27, v28, v21);
          }

          int enabledToken = -1;
          *p_int enabledToken = -1;
        }
        else
        {
          int enabledToken = *p_enabledToken;
        }
      }
      objc_sync_exit(v18);

      if (enabledToken != -1)
      {
        uint64_t state64 = 0;
        uint32_t v29 = notify_get_state(enabledToken, &state64);
        if (v29)
        {
          v30 = MBGetDefaultLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v47 = v29;
            _os_log_impl(&dword_1DD9AE000, v30, OS_LOG_TYPE_ERROR, "notify_get_state failed: %lu", buf, 0xCu);
            _MBLog(@"ERROR", (uint64_t)"notify_get_state failed: %lu", v31, v32, v33, v34, v35, v36, v29);
          }

          uint64_t state64 = 0;
        }
        v37 = MBGetDefaultLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v47 = state64;
          _os_log_impl(&dword_1DD9AE000, v37, OS_LOG_TYPE_INFO, "Fetched the backup enabled notify state: 0x%llx", buf, 0xCu);
          _MBLog(@"INFO", (uint64_t)"Fetched the backup enabled notify state: 0x%llx", v38, v39, v40, v41, v42, v43, state64);
        }

        if (state64 == 1)
        {
          LOBYTE(v6) = 1;
          goto LABEL_7;
        }
        if (state64 == -1)
        {
          LOBYTE(v6) = 0;
LABEL_7:

          goto LABEL_8;
        }
      }
    }
    uint64_t v9 = [(MBXPCClient *)self _sendRequest:@"kMBMessageIsBackupEnabled" arguments:0];
    unsigned int v6 = [v9 BOOLValue];
    char v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v47) = v6;
      _os_log_impl(&dword_1DD9AE000, v10, OS_LOG_TYPE_INFO, "isBackupEnabled:%d", buf, 8u);
      _MBLog(@"INFO", (uint64_t)"isBackupEnabled:%d", v11, v12, v13, v14, v15, v16, v6);
    }

    goto LABEL_7;
  }
  LOBYTE(v6) = 0;
LABEL_8:
  os_activity_scope_leave(&state);

  return v6;
}

- (void)setBackupEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v10[1] = *MEMORY[0x1E4F143B8];
  char v5 = _os_activity_create(&dword_1DD9AE000, "setBackupEnabled:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v5, &v9);
  unsigned int v6 = [NSNumber numberWithBool:v3];
  v10[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v8 = [(MBXPCClient *)self _sendRequest:@"kMBMessageSetBackupEnabled" arguments:v7];

  os_activity_scope_leave(&v9);
}

- (void)syncBackupEnabled
{
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "syncBackupEnabled", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  id v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageSyncBackupEnabled" arguments:0];
  os_activity_scope_leave(&v5);
}

- (BOOL)isLocalBackupPasswordSetWithError:(id *)a3
{
  os_activity_scope_state_s v5 = _os_activity_create(&dword_1DD9AE000, "isLocalBackupPasswordSetWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  unsigned int v6 = [(MBXPCClient *)self _sendRequest:@"kMBMessageIsLocalBackupPasswordSet" arguments:0 error:a3];
  LOBYTE(a3) = [v6 BOOLValue];

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (BOOL)unsetLocalBackupPasswordWithError:(id *)a3
{
  os_activity_scope_state_s v5 = _os_activity_create(&dword_1DD9AE000, "unsetLocalBackupPasswordWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  unsigned int v6 = [(MBXPCClient *)self _sendRequest:@"kMBMessageUnsetLocalBackupPassword" arguments:0 error:a3];
  LOBYTE(a3) = [v6 BOOLValue];

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (id)getBackupListWithError:(id *)a3
{
  return [(MBXPCClient *)self getBackupListWithFiltering:1 error:a3];
}

- (id)getBackupListWithFiltering:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = _os_activity_create(&dword_1DD9AE000, "getBackupListWithFiltering:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v7, &v12);
  os_activity_scope_state_s v8 = [NSNumber numberWithBool:v5];
  v13[0] = v8;
  os_activity_scope_state_s v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  char v10 = [(MBXPCClient *)self _sendRequest:@"kMBMessageBackupList" arguments:v9 error:a4];

  os_activity_scope_leave(&v12);
  return v10;
}

- (BOOL)inheritSnapshot:(id)a3 fromDevice:(id)a4 error:(id *)a5
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  char v10 = _os_activity_create(&dword_1DD9AE000, "inheritSnapshot:snapshotID:fromDevice:error", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  v15[0] = v8;
  v15[1] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  os_activity_scope_state_s v12 = [(MBXPCClient *)self _sendRequest:@"kMBMessageInheritBackup" arguments:v11 error:a5];

  LOBYTE(a5) = [v12 BOOLValue];
  os_activity_scope_leave(&state);

  return (char)a5;
}

- (id)backupState
{
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "backupState", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  id v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageBackupState" arguments:0];
  os_activity_scope_leave(&v6);

  return v4;
}

- (id)backupDeviceUUID
{
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "backupDeviceUUID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v3, &v7);
  id v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageGetBackupDeviceUUID" arguments:0];
  BOOL v5 = objc_msgSend(v4, "mb_backupIDByAddingCKPrefix");

  os_activity_scope_leave(&v7);
  return v5;
}

- (BOOL)startBackupWithOptions:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_activity_scope_state_s v7 = _os_activity_create(&dword_1DD9AE000, "startBackupWithOptions:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v7, &v11);
  v12[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  id v9 = [(MBXPCClient *)self _sendRequest:@"kMBMessageStartBackup" arguments:v8 error:a4];

  LOBYTE(a4) = [v9 BOOLValue];
  os_activity_scope_leave(&v11);

  return (char)a4;
}

- (BOOL)startBackupWithError:(id *)a3
{
  BOOL v5 = objc_opt_new();
  LOBYTE(a3) = [(MBXPCClient *)self startBackupWithOptions:v5 error:a3];

  return (char)a3;
}

- (void)cancel
{
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "cancel", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  id v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageCancel" arguments:0];
  os_activity_scope_leave(&v5);
}

- (void)cancelRestore
{
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "cancelRestore", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  id v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageCancelRestore" arguments:0];
  os_activity_scope_leave(&v5);
}

- (id)restoreStateWithError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  os_activity_scope_state_s v5 = _os_activity_create(&dword_1DD9AE000, "restoreState", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  if ([(MBXPCClient *)self shouldSupportiTunes])
  {
    char v21 = 0;
    id v6 = +[MBPersona personalPersonaWithError:0];
    int v7 = [v6 getBooleanValueForKey:@"DriveRestoreInProgress" keyExists:&v21];
    if (self->_iTunesRestoreStarted | v7
      && [(MBXPCClient *)self _isBackupAgent2Running])
    {
      id v8 = MBGetDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        BOOL iTunesRestoreStarted = self->_iTunesRestoreStarted;
        *(_DWORD *)buf = 67109376;
        BOOL v24 = iTunesRestoreStarted;
        __int16 v25 = 1024;
        int v26 = v7;
        _os_log_impl(&dword_1DD9AE000, v8, OS_LOG_TYPE_INFO, "iTunes restore in progress (%d, %d)", buf, 0xEu);
        _MBLog(@"INFO", (uint64_t)"iTunes restore in progress (%d, %d)", v10, v11, v12, v13, v14, v15, self->_iTunesRestoreStarted);
      }

      uint64_t v16 = [[MBStateInfo alloc] initWithState:2 progress:0 estimatedTimeRemaining:0 isCloud:0 isBackground:0 error:0 errors:0.0 backupAttemptCount:0];
      goto LABEL_12;
    }
  }
  id v20 = 0;
  uint64_t v16 = [(MBXPCClient *)self _sendRequest:@"kMBMessageRestoreState" arguments:0 error:&v20];
  id v17 = v20;
  uint64_t v18 = v17;
  if (a3 && !v16) {
    *a3 = v17;
  }

LABEL_12:
  os_activity_scope_leave(&state);

  return v16;
}

- (id)restoreState
{
  return [(MBXPCClient *)self restoreStateWithError:0];
}

- (void)fetchiCloudRestoreIsCompleteWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[MBXPCClient fetchiCloudRestoreIsCompleteWithCompletion:]();
  }
  os_activity_scope_state_s v5 = v4;
  id v6 = dispatch_get_global_queue(17, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__MBXPCClient_fetchiCloudRestoreIsCompleteWithCompletion___block_invoke;
  v8[3] = &unk_1E6D00EB8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __58__MBXPCClient_fetchiCloudRestoreIsCompleteWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E01C2AA0]();
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "fetchiCloudRestoreIsCompleteWithCompletion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  id v4 = *(void **)(a1 + 32);
  id v8 = 0;
  os_activity_scope_state_s v5 = [v4 _sendRequest:@"kMBMessageRestoreState" arguments:0 error:&v8];
  id v6 = v8;
  id v7 = v6;
  if (v5)
  {

    [v5 state];
    id v7 = 0;
  }
  else if (!v6)
  {
    __assert_rtn("-[MBXPCClient fetchiCloudRestoreIsCompleteWithCompletion:]_block_invoke", "MBXPCClient.m", 426, "error");
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  os_activity_scope_leave(&state);
}

- (id)backgroundRestoreInfo
{
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "backgroundRestoreInfo", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  id v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageBackgroundRestoreInfo" arguments:0];
  os_activity_scope_leave(&v6);

  return v4;
}

- (BOOL)restoreFileExistsWithPath:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Null path"];
  }
  os_activity_scope_state_s v5 = _os_activity_create(&dword_1DD9AE000, "restoreFileExistsWithPath:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v5, &v10);
  v11[0] = v4;
  os_activity_scope_state_s v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v7 = [(MBXPCClient *)self _sendRequest:@"kMBMessageFileExists" arguments:v6];

  char v8 = [v7 BOOLValue];
  os_activity_scope_leave(&v10);

  return v8;
}

- (BOOL)restoreDataExistsForApplicationWithBundleID:(id)a3 size:(unint64_t *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_1DD9AE000, "restoreDataExistsForApplicationWithBundleID:size:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter(v7, &v15);
  v16[0] = v6;
  char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v9 = [(MBXPCClient *)self _sendRequest:@"kMBMessageDataExistsForApp" arguments:v8];

  os_activity_scope_state_s v10 = [v9 objectAtIndexedSubscript:0];
  uint64_t v11 = [v9 objectAtIndexedSubscript:1];
  uint64_t v12 = v11;
  if (a4) {
    *a4 = [v11 unsignedLongLongValue];
  }
  char v13 = [v10 BOOLValue];

  os_activity_scope_leave(&v15);
  return v13;
}

- (BOOL)restoreFilesForDomain:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 range:(_NSRange)a6 error:(id *)a7 progress:(id)a8
{
  BOOL v50 = a5;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  id v57 = a4;
  uint64_t v47 = (void (**)(id, void *))a8;
  id v9 = _os_activity_create(&dword_1DD9AE000, "restoreFilesForDomain:relativePath:pendingOnly:range:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_state_s v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v72 = v51;
    __int16 v73 = 2112;
    id v74 = v57;
    __int16 v75 = 1024;
    BOOL v76 = v50;
    _os_log_impl(&dword_1DD9AE000, v10, OS_LOG_TYPE_DEFAULT, "Listing restore files for domain:%@, relativePath:%@, pendingOnly:%d", buf, 0x1Cu);
    _MBLog(@"DEFAULT", (uint64_t)"Listing restore files for domain:%@, relativePath:%@, pendingOnly:%d", v11, v12, v13, v14, v15, v16, (uint64_t)v51);
  }

  id v48 = 0;
  do
  {
    context = (void *)MEMORY[0x1E01C2AA0]();
    if (a6.length >= 0x1964) {
      NSUInteger length = 6500;
    }
    else {
      NSUInteger length = a6.length;
    }
    v70[0] = v51;
    id v18 = v57;
    if (!v57)
    {
      v52 = [MEMORY[0x1E4F1CA98] null];
      id v18 = v52;
    }
    v70[1] = v18;
    uint64_t v19 = [NSNumber numberWithBool:v50];
    v70[2] = v19;
    id v20 = [NSNumber numberWithUnsignedInteger:a6.location];
    v70[3] = v20;
    char v21 = [NSNumber numberWithUnsignedInteger:length];
    v70[4] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:5];
    id v66 = 0;
    uint64_t v23 = [(MBXPCClient *)self _sendRequest:@"kMBMessageRestoreFiles" arguments:v22 error:&v66];
    NSUInteger v54 = length;
    id v56 = v66;

    if (!v57) {
    if (v23)
    }
    {
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v24 = v23;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v62 objects:v69 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v63;
        while (2)
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v63 != v26) {
              objc_enumerationMutation(v24);
            }
            uint64_t v28 = *(void **)(*((void *)&v62 + 1) + 8 * i);
            uint32_t v29 = [MEMORY[0x1E4F1CA98] null];
            LOBYTE(v28) = v28 == v29;

            if (v28)
            {
              int v30 = 1;
              goto LABEL_22;
            }
          }
          uint64_t v25 = [v24 countByEnumeratingWithState:&v62 objects:v69 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }
      int v30 = 0;
LABEL_22:

      unint64_t v31 = v54;
      uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v24, "count"));
      uint64_t v33 = v32;
      if (v30)
      {
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v34 = v24;
        uint64_t v35 = [v34 countByEnumeratingWithState:&v58 objects:v68 count:16];
        if (v35)
        {
          uint64_t v36 = *(void *)v59;
          do
          {
            for (uint64_t j = 0; j != v35; ++j)
            {
              if (*(void *)v59 != v36) {
                objc_enumerationMutation(v34);
              }
              uint64_t v38 = *(void **)(*((void *)&v58 + 1) + 8 * j);
              uint64_t v39 = [MEMORY[0x1E4F1CA98] null];
              BOOL v40 = v38 == v39;

              if (!v40) {
                [v33 addObject:v38];
              }
            }
            uint64_t v35 = [v34 countByEnumeratingWithState:&v58 objects:v68 count:16];
          }
          while (v35);
        }

        unint64_t v31 = v54;
      }
      else
      {
        [v32 addObjectsFromArray:v24];
      }
      v47[2](v47, v33);
      if ([v24 count] && objc_msgSend(v24, "count") >= v31)
      {
        a6.location += v31;
        a6.length -= v31;
        char v41 = 1;
      }
      else
      {
        char v41 = 0;
      }
    }
    else
    {
      char v41 = 0;
      uint64_t v33 = v48;
      id v48 = v56;
    }
  }
  while ((v41 & 1) != 0);
  uint64_t v42 = v48;
  if (a7) {
    BOOL v43 = v48 == 0;
  }
  else {
    BOOL v43 = 1;
  }
  BOOL v44 = v43;
  if (!v43)
  {
    *a7 = v48;
    uint64_t v42 = v48;
  }

  os_activity_scope_leave(&state);
  return v44;
}

- (id)restoreFilesForDomain:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 range:(_NSRange)a6 error:(id *)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  BOOL v10 = a5;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__0;
  uint64_t v38 = __Block_byref_object_dispose__0;
  id v39 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __74__MBXPCClient_restoreFilesForDomain_relativePath_pendingOnly_range_error___block_invoke;
  v33[3] = &unk_1E6D011E8;
  v33[4] = &v34;
  if (-[MBXPCClient restoreFilesForDomain:relativePath:pendingOnly:range:error:progress:](self, "restoreFilesForDomain:relativePath:pendingOnly:range:error:progress:", v13, v14, v10, location, length, a7, v33))
  {
    uint64_t v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = v15;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = [(id)v35[5] count];
        *(_DWORD *)buf = 134218754;
        uint64_t v41 = v16;
        __int16 v42 = 2112;
        id v43 = v13;
        __int16 v44 = 2112;
        id v45 = v14;
        __int16 v46 = 1024;
        BOOL v47 = v10;
        _os_log_impl(&dword_1DD9AE000, v15, OS_LOG_TYPE_DEFAULT, "Found %lu restore files for domain:%@, relativePath:%@, pendingOnly:%d", buf, 0x26u);
      }

      uint64_t v17 = [(id)v35[5] count];
      _MBLog(@"DEFAULT", (uint64_t)"Found %lu restore files for domain:%@, relativePath:%@, pendingOnly:%d", v18, v19, v20, v21, v22, v23, v17);
    }
  }
  else
  {
    uint64_t v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v24 = *a7;
      *(_DWORD *)buf = 138412546;
      uint64_t v41 = (uint64_t)v13;
      __int16 v42 = 2112;
      id v43 = v24;
      _os_log_impl(&dword_1DD9AE000, v15, OS_LOG_TYPE_ERROR, "Failed to query restore files for domain %@: %@", buf, 0x16u);
      _MBLog(@"ERROR", (uint64_t)"Failed to query restore files for domain %@: %@", v25, v26, v27, v28, v29, v30, (uint64_t)v13);
    }
  }

  id v31 = (id)v35[5];
  _Block_object_dispose(&v34, 8);

  return v31;
}

void __74__MBXPCClient_restoreFilesForDomain_relativePath_pendingOnly_range_error___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  BOOL v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v3)
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    BOOL v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  [v3 addObjectsFromArray:v7];
}

- (id)restoreFilesForDomain:(id)a3 error:(id *)a4
{
  return -[MBXPCClient restoreFilesForDomain:relativePath:pendingOnly:range:error:](self, "restoreFilesForDomain:relativePath:pendingOnly:range:error:", a3, 0, 1, 0, -1, a4);
}

- (id)restoreFilesForDomain:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 error:(id *)a6
{
  return -[MBXPCClient restoreFilesForDomain:relativePath:pendingOnly:range:error:](self, "restoreFilesForDomain:relativePath:pendingOnly:range:error:", a3, a4, a5, 0, -1, a6);
}

- (void)prioritizeRestoreFileWithPath:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_1DD9AE000, "prioritizeRestoreFileWithPath:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  v9[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v7 = [(MBXPCClient *)self _sendRequest:@"kMBMessagePrioritizeRestoreFile" arguments:v6];

  os_activity_scope_leave(&v8);
}

- (BOOL)recordRestoreFailure:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  os_activity_scope_state_s v8 = [v7 identifier];

  if (!v8)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"MBXPCClient.m" lineNumber:575 description:@"identifier must be non null"];
  }
  id v9 = [v7 dataclass];

  if (!v9)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"MBXPCClient.m" lineNumber:576 description:@"dataclass must be non null"];
  }
  BOOL v10 = _os_activity_create(&dword_1DD9AE000, "recordRestoreFailure:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v17.opaque[0] = 0;
  v17.opaque[1] = 0;
  os_activity_scope_enter(v10, &v17);
  v18[0] = v7;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  uint64_t v12 = [(MBXPCClient *)self _sendRequest:@"kMBMessageReportRestoreFailure" arguments:v11 error:a4];

  char v13 = [v12 BOOLValue];
  os_activity_scope_leave(&v17);

  return v13;
}

- (id)restoreFailuresForDataclass:(id)a3 assetType:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v19[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = _os_activity_create(&dword_1DD9AE000, "restoreFailuresForDataclass:assetType:range:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v18.opaque[0] = 0;
  v18.opaque[1] = 0;
  os_activity_scope_enter(v11, &v18);
  uint64_t v12 = v9;
  if (!v9)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[0] = v12;
  char v13 = v10;
  if (!v10)
  {
    char v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v19[1] = v13;
  v21.NSUInteger location = location;
  v21.NSUInteger length = length;
  id v14 = NSStringFromRange(v21);
  v19[2] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  uint64_t v16 = [(MBXPCClient *)self _sendRequest:@"kMBMessageListRestoreFailures" arguments:v15 error:0];

  if (!v10) {
  if (!v9)
  }

  os_activity_scope_leave(&v18);
  return v16;
}

- (unint64_t)countOfRestoreFailuresForDataclass:(id)a3 assetType:(id)a4
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_activity_scope_state_s v8 = _os_activity_create(&dword_1DD9AE000, "countOfRestoreFailuresForDataclass:assetType", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  id v9 = v6;
  if (!v6)
  {
    id v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[0] = v9;
  id v10 = v7;
  if (!v7)
  {
    id v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  uint64_t v12 = [(MBXPCClient *)self _sendRequest:@"kMBMessageCountRestoreFailures" arguments:v11 error:0];

  if (!v7) {
  if (!v6)
  }

  unint64_t v13 = [v12 unsignedIntegerValue];
  os_activity_scope_leave(&state);

  return v13;
}

- (id)dateOfLastBackup
{
  return [(MBXPCClient *)self dateOfLastBackupWithError:0];
}

- (id)dateOfNextScheduledBackup
{
  return [(MBXPCClient *)self dateOfNextScheduledBackupWithError:0];
}

- (id)dateOfLastBackupWithError:(id *)a3
{
  uint64_t v5 = _os_activity_create(&dword_1DD9AE000, "dateOfLastBackup", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  id v6 = [(MBXPCClient *)self _sendRequest:@"kMBMessageDateOfLastBackup" arguments:0 error:a3];
  os_activity_scope_leave(&v8);

  return v6;
}

- (id)dateOfNextScheduledBackupWithError:(id *)a3
{
  uint64_t v5 = _os_activity_create(&dword_1DD9AE000, "dateOfNextScheduledBackup", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  id v6 = [(MBXPCClient *)self _sendRequest:@"kMBMessageDateOfNextBackup" arguments:0 error:a3];
  os_activity_scope_leave(&v8);

  return v6;
}

- (BOOL)restoreSupportsBatching
{
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "restoreSupportsBatching:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  id v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageRestoreSupportsBatching" arguments:0];
  LOBYTE(self) = [v4 BOOLValue];

  os_activity_scope_leave(&v6);
  return (char)self;
}

- (void)setRestoreQualityOfService:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _os_activity_create(&dword_1DD9AE000, "setRestoreQualityOfService:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v5, &v9);
  os_activity_scope_state_s v6 = [NSNumber numberWithInteger:a3];
  v10[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v8 = [(MBXPCClient *)self _sendRequest:@"kMBMessageSetRestoreQualityOfService" arguments:v7];

  os_activity_scope_leave(&v9);
}

- (void)saveBackgroundRestoreCellularAccess:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MBXPCClient_saveBackgroundRestoreCellularAccess_completion___block_invoke;
  block[3] = &unk_1E6D01210;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __62__MBXPCClient_saveBackgroundRestoreCellularAccess_completion___block_invoke(void *a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E01C2AA0]();
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "saveBackgroundRestoreCellularAccess:completion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  id v4 = (void *)a1[4];
  v10[0] = a1[5];
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v8 = 0;
  id v6 = (id)[v4 _sendRequest:@"kMBMessageSaveBackgroundRestoreCellularAccess" arguments:v5 error:&v8];
  id v7 = v8;

  (*(void (**)(void))(a1[6] + 16))();
  os_activity_scope_leave(&state);
}

- (void)fetchBackgroundRestoreCellularAccessWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(17, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__MBXPCClient_fetchBackgroundRestoreCellularAccessWithCompletion___block_invoke;
  v7[3] = &unk_1E6D00EB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __66__MBXPCClient_fetchBackgroundRestoreCellularAccessWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E01C2AA0]();
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "fetchBackgroundRestoreCellularAccessWithCompletion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  id v4 = *(void **)(a1 + 32);
  id v7 = 0;
  uint64_t v5 = [v4 backgroundRestoreCellularAccessWithError:&v7];
  id v6 = v7;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  os_activity_scope_leave(&state);
}

- (id)backgroundRestoreCellularAccessWithError:(id *)a3
{
  id v4 = _os_activity_create(&dword_1DD9AE000, "backgroundRestoreCellularAccessWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  uint64_t v7 = 0;
  uint64_t v5 = [(MBXPCClient *)self _sendRequest:@"kMBMessageFetchBackgroundRestoreCellularAccess" arguments:0 error:&v7];
  os_activity_scope_leave(&state);

  return v5;
}

- (BOOL)startRestoreForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = objc_opt_new();
  [v9 cellularAccess];
  if (objc_claimAutoreleasedReturnValue()) {
    -[MBXPCClient startRestoreForBackupUDID:snapshotID:error:]();
  }
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  NSRange v21 = __Block_byref_object_copy__0;
  uint64_t v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  id v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__MBXPCClient_startRestoreForBackupUDID_snapshotID_error___block_invoke;
  void v15[3] = &unk_1E6D01238;
  os_activity_scope_state_s v17 = &v18;
  uint64_t v11 = v10;
  uint64_t v16 = v11;
  [(MBXPCClient *)self startRestoreForBackupUDID:v8 snapshotID:a4 options:v9 completion:v15];
  dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  id v12 = (void *)v19[5];
  if (a5 && v12)
  {
    *a5 = v12;
    id v12 = (void *)v19[5];
  }
  BOOL v13 = v12 == 0;

  _Block_object_dispose(&v18, 8);
  return v13;
}

void __58__MBXPCClient_startRestoreForBackupUDID_snapshotID_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)startRestoreForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!v10) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"must provide a valid backup UDID"];
  }
  BOOL v13 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__MBXPCClient_startRestoreForBackupUDID_snapshotID_options_completion___block_invoke;
  block[3] = &unk_1E6D01260;
  id v21 = v12;
  unint64_t v22 = a4;
  id v18 = v10;
  uint64_t v19 = self;
  id v20 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __71__MBXPCClient_startRestoreForBackupUDID_snapshotID_options_completion___block_invoke(void *a1)
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E01C2AA0]();
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "startRestoreForBackupUDID:snapshotID:options:completion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  id v4 = [[MBSnapshotIdentifier alloc] initWithBackupUDID:a1[4] snapshotID:a1[8]];
  id v6 = (void *)a1[5];
  uint64_t v5 = a1[6];
  v12[0] = v4;
  v12[1] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  id v10 = 0;
  id v8 = (id)[v6 _sendRequest:@"kMBMessageStartRestore" arguments:v7 error:&v10];
  id v9 = v10;

  (*(void (**)(void))(a1[7] + 16))();
  os_activity_scope_leave(&state);
}

- (void)startRestoreForSnapshot:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    -[MBXPCClient startRestoreForSnapshot:options:completion:]();
  }
  id v11 = v10;
  id v12 = dispatch_get_global_queue(17, 0);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __58__MBXPCClient_startRestoreForSnapshot_options_completion___block_invoke;
  void v16[3] = &unk_1E6D01288;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

void __58__MBXPCClient_startRestoreForSnapshot_options_completion___block_invoke(void *a1)
{
  void v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E01C2AA0]();
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "startRestoreForSnapshot:options:completion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[6];
  v11[0] = a1[5];
  v11[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  id v9 = 0;
  id v7 = (id)[v4 _sendRequest:@"kMBMessageStartRestore" arguments:v6 error:&v9];
  id v8 = v9;

  (*(void (**)(void))(a1[7] + 16))();
  os_activity_scope_leave(&state);
}

- (BOOL)restoreFileWithPath:(id)a3 error:(id *)a4
{
  return [(MBXPCClient *)self restoreFileWithPath:a3 context:0 error:a4];
}

- (BOOL)restoreFileWithPath:(id)a3 context:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"must provide a valid file path"];
  }
  id v10 = _os_activity_create(&dword_1DD9AE000, "restoreFileWithPath:context:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter(v10, &v15);
  v16[0] = v8;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v12 = [(MBXPCClient *)self _sendRequest:@"kMBMessageStartFileRestore" arguments:v11 error:a5];

  char v13 = [v12 BOOLValue];
  os_activity_scope_leave(&v15);

  return v13;
}

- (BOOL)restoreFilesWithPaths:(id)a3 error:(id *)a4
{
  return [(MBXPCClient *)self restoreFilesWithPaths:a3 context:0 error:a4];
}

- (BOOL)restoreFilesWithPaths:(id)a3 context:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8 || ![v8 count]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"must provide a valid array of file paths"];
  }
  id v10 = _os_activity_create(&dword_1DD9AE000, "restoreFilesWithPaths:context:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter(v10, &v15);
  v16[0] = v8;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v12 = [(MBXPCClient *)self _sendRequest:@"kMBMessageStartFilesRestore" arguments:v11 error:a5];

  char v13 = [v12 BOOLValue];
  os_activity_scope_leave(&v15);

  return v13;
}

- (BOOL)restoreBookWithPath:(id)a3 error:(id *)a4
{
  return [(MBXPCClient *)self restoreBookWithPath:a3 context:0 error:a4];
}

- (BOOL)restoreBookWithPath:(id)a3 context:(id)a4 error:(id *)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = _os_activity_create(&dword_1DD9AE000, "restoreBookWithPath:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v10, &v14);
  v15[0] = v8;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v12 = [(MBXPCClient *)self _sendRequest:@"kMBMessageStartBookRestore" arguments:v11 error:a5];

  LOBYTE(a5) = [v12 BOOLValue];
  os_activity_scope_leave(&v14);

  return (char)a5;
}

- (BOOL)_restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 qos:(id)a5 context:(id)a6 error:(id *)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[MBXPCClient _restoreApplicationWithBundleID:failed:qos:context:error:]();
    }
  }
  if (!v12) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"must provide a valid bundle id"];
  }
  os_activity_scope_state_s v15 = _os_activity_create(&dword_1DD9AE000, "restoreApplicationWithBundleID:failed:withQOS:context:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  id v16 = (void *)MEMORY[0x1E4F1C978];
  id v17 = [NSNumber numberWithBool:v10];
  id v18 = objc_msgSend(v16, "arrayWithObjects:", v12, v17, v13, 0);

  id v19 = [(MBXPCClient *)self _sendRequest:@"kMBMessageStartAppRestore" arguments:v18 error:a7];
  char v20 = [v19 BOOLValue];

  os_activity_scope_leave(&state);
  return v20;
}

- (BOOL)restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 withQOS:(int64_t)a5 context:(id)a6 error:(id *)a7
{
  BOOL v9 = a4;
  id v12 = NSNumber;
  id v13 = a6;
  id v14 = a3;
  os_activity_scope_state_s v15 = [v12 numberWithInteger:a5];
  LOBYTE(a7) = [(MBXPCClient *)self _restoreApplicationWithBundleID:v14 failed:v9 qos:v15 context:v13 error:a7];

  return (char)a7;
}

- (BOOL)restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 context:(id)a5 error:(id *)a6
{
  return [(MBXPCClient *)self _restoreApplicationWithBundleID:a3 failed:a4 qos:0 context:a5 error:a6];
}

- (BOOL)restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 error:(id *)a5
{
  return [(MBXPCClient *)self restoreApplicationWithBundleID:a3 failed:a4 context:0 error:a5];
}

- (BOOL)cancelApplicationRestoreWithBundleID:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"must provide a valid bundle id"];
  }
  id v7 = _os_activity_create(&dword_1DD9AE000, "cancelApplicationRestoreWithBundleID:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v7, &v12);
  v13[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  BOOL v9 = [(MBXPCClient *)self _sendRequest:@"kMBMessageCancelAppRestore" arguments:v8 error:a4];
  char v10 = [v9 BOOLValue];

  os_activity_scope_leave(&v12);
  return v10;
}

- (BOOL)saveKeybagsForBackupUDID:(id)a3 withError:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    id v8 = _os_activity_create(&dword_1DD9AE000, "saveKeybagsForBackupUDID:withError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v14.opaque[0] = 0;
    v14.opaque[1] = 0;
    os_activity_scope_enter(v8, &v14);
    BOOL v9 = objc_msgSend(v7, "mb_backupIDByRemovingCKPrefix");

    v15[0] = v9;
    char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v11 = [(MBXPCClient *)self _sendRequest:@"kMBMessageSaveKeybags" arguments:v10 error:a4];

    char v12 = [v11 BOOLValue];
    os_activity_scope_leave(&v14);
  }
  else if (a4)
  {
    +[MBError errorWithCode:1 format:@"must provide a valid backupUDID"];
    char v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v12;
}

- (void)finishRestore
{
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "finishRestore", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  id v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageFinishRestore" arguments:0];
  os_activity_scope_leave(&v5);
}

- (void)insufficientFreeSpaceToRestore
{
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "insufficientFreeSpaceToRestore", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  id v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageInsufficientFreeSpaceToRestore" arguments:0];
  os_activity_scope_leave(&v5);
}

- (void)wakeUp
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "wakeUp", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  id v13 = 0;
  id v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageWakeUp" arguments:0 error:&v13];
  id v5 = v13;
  if (v5)
  {
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_1DD9AE000, v6, OS_LOG_TYPE_ERROR, "Failed to send WakeUp message to backupd: %@", buf, 0xCu);
      _MBLog(@"ERROR", (uint64_t)"Failed to send WakeUp message to backupd: %@", v7, v8, v9, v10, v11, v12, (uint64_t)v5);
    }
  }
  os_activity_scope_leave(&state);
}

- (void)accountChanged:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1DD9AE000, "accountChanged", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v20[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  id v16 = 0;
  id v7 = [(MBXPCClient *)self _sendRequest:@"kMBMessageAccountChanged" arguments:v6 error:&v16];
  id v8 = v16;

  if (v8)
  {
    uint64_t v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v8;
      _os_log_impl(&dword_1DD9AE000, v9, OS_LOG_TYPE_ERROR, "Failed to send AccountChanged message to backupd: %@", buf, 0xCu);
      _MBLog(@"ERROR", (uint64_t)"Failed to send AccountChanged message to backupd: %@", v10, v11, v12, v13, v14, v15, (uint64_t)v8);
    }
  }
  os_activity_scope_leave(&state);
}

- (void)keyBagIsLocking
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "keyBagIsLocking", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  id v13 = 0;
  id v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageKeyBagIsLocking" arguments:0 error:&v13];
  id v5 = v13;
  if (v5)
  {
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_1DD9AE000, v6, OS_LOG_TYPE_ERROR, "Failed to send KeyBagIsLocking message to backupd: %@", buf, 0xCu);
      _MBLog(@"ERROR", (uint64_t)"Failed to send KeyBagIsLocking message to backupd: %@", v7, v8, v9, v10, v11, v12, (uint64_t)v5);
    }
  }
  os_activity_scope_leave(&state);
}

- (void)keyBagIsUnlocked
{
  v26[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)CFPreferencesCopyValue(@"NotifyDaemonNextTimeKeyBagIsUnlocked", @"com.apple.MobileBackup", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  unsigned int v4 = [v3 BOOLValue];
  id v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = v4;
    LOWORD(v26[0]) = 2112;
    *(void *)((char *)v26 + 2) = v3;
    _os_log_impl(&dword_1DD9AE000, v5, OS_LOG_TYPE_INFO, "kMBNotifyDaemonNextTimeKeyBagIsUnlocked %d (%@)", buf, 0x12u);
    _MBLog(@"INFO", (uint64_t)"kMBNotifyDaemonNextTimeKeyBagIsUnlocked %d (%@)", v6, v7, v8, v9, v10, v11, v4);
  }

  if (v4)
  {
    uint64_t v12 = _os_activity_create(&dword_1DD9AE000, "keyBagIsUnlocked", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    *(void *)buf = 0;
    v26[0] = 0;
    os_activity_scope_enter(v12, (os_activity_scope_state_t)buf);
    id v22 = 0;
    id v13 = [(MBXPCClient *)self _sendRequest:@"kMBMessageKeyBagIsUnlocked" arguments:0 error:&v22];
    id v14 = v22;
    if (v14)
    {
      uint64_t v15 = MBGetDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v23 = 138412290;
        id v24 = v14;
        _os_log_impl(&dword_1DD9AE000, v15, OS_LOG_TYPE_DEFAULT, "Failed to send KeyBagIsUnlocked message to backupd: %@", v23, 0xCu);
        _MBLog(@"DEFAULT", (uint64_t)"Failed to send KeyBagIsUnlocked message to backupd: %@", v16, v17, v18, v19, v20, v21, (uint64_t)v14);
      }
    }
    os_activity_scope_leave((os_activity_scope_state_t)buf);
  }
}

- (BOOL)deleteAccountWithError:(id *)a3
{
  id v5 = _os_activity_create(&dword_1DD9AE000, "deleteAccountWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  uint64_t v6 = [(MBXPCClient *)self _sendRequest:@"kMBMessageDeleteAccount" arguments:0 error:a3];
  LOBYTE(a3) = [v6 BOOLValue];

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (BOOL)deleteBackupUDID:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"must provide a valid backup"];
  }
  uint64_t v7 = _os_activity_create(&dword_1DD9AE000, "deleteBackupUDID:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v7, &v13);
  os_activity_scope_state_s v8 = objc_msgSend(v6, "mb_backupIDByRemovingCKPrefix");

  v14[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v10 = [(MBXPCClient *)self _sendRequest:@"kMBMessageDeleteBackup" arguments:v9 error:a4];

  char v11 = [v10 BOOLValue];
  os_activity_scope_leave(&v13);

  return v11;
}

- (BOOL)deleteSnapshotID:(unint64_t)a3 fromBackupUDID:(id)a4 error:(id *)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (!v8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"must provide a valid backup UDID"];
  }
  uint64_t v9 = _os_activity_create(&dword_1DD9AE000, "deleteSnapshotID:fromBackupUDID:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  uint64_t v10 = objc_msgSend(v8, "mb_backupIDByRemovingCKPrefix");

  char v11 = [NSNumber numberWithUnsignedInteger:a3];
  v17[0] = v11;
  v17[1] = v10;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  os_activity_scope_state_s v13 = [(MBXPCClient *)self _sendRequest:@"kMBMessageDeleteSnapshot" arguments:v12 error:a5];

  char v14 = [v13 BOOLValue];
  os_activity_scope_leave(&state);

  return v14;
}

- (id)journalLastModifiedForBackupUUID:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6 || ![v6 length]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"must provide a valid backup UDID"];
  }
  id v8 = _os_activity_create(&dword_1DD9AE000, "journalLastModifiedForBackupUUID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = objc_msgSend(v7, "mb_backupIDByRemovingCKPrefix");

  uint64_t v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v9;
    _os_log_impl(&dword_1DD9AE000, v10, OS_LOG_TYPE_DEFAULT, "journalLastModifiedForBackupUUID: %@", buf, 0xCu);
    _MBLog(@"DEFAULT", (uint64_t)"journalLastModifiedForBackupUUID: %@", v11, v12, v13, v14, v15, v16, (uint64_t)v9);
  }

  uint64_t v21 = v9;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  uint64_t v18 = [(MBXPCClient *)self _sendRequest:@"kMBMessageJournalLastModified" arguments:v17 error:a4];

  os_activity_scope_leave(&state);
  return v18;
}

- (id)journalForBackupUUID:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6 || ![v6 length]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"must provide a valid backup UDID"];
  }
  id v8 = _os_activity_create(&dword_1DD9AE000, "journalForBackupUUID:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = objc_msgSend(v7, "mb_backupIDByRemovingCKPrefix");

  uint64_t v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v9;
    _os_log_impl(&dword_1DD9AE000, v10, OS_LOG_TYPE_DEFAULT, "journalForBackup: backupUDID: %@", buf, 0xCu);
    _MBLog(@"DEFAULT", (uint64_t)"journalForBackup: backupUDID: %@", v11, v12, v13, v14, v15, v16, (uint64_t)v9);
  }

  uint64_t v21 = v9;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  uint64_t v18 = [(MBXPCClient *)self _sendRequest:@"kMBListJournalActions" arguments:v17 error:a4];

  os_activity_scope_leave(&state);
  return v18;
}

- (id)filesForSnapshotID:(unint64_t)a3 backupUDID:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v8 || ![v8 length]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"must provide a valid backup UDID"];
  }
  uint64_t v10 = _os_activity_create(&dword_1DD9AE000, "filesForSnapshotID:backupUDID:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  uint64_t v11 = objc_msgSend(v9, "mb_backupIDByRemovingCKPrefix");

  uint64_t v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v26 = a3;
    __int16 v27 = 2112;
    uint64_t v28 = v11;
    _os_log_impl(&dword_1DD9AE000, v12, OS_LOG_TYPE_DEFAULT, "filesForSnapshot (client): %ld backupUDID: %@", buf, 0x16u);
    _MBLog(@"DEFAULT", (uint64_t)"filesForSnapshot (client): %ld backupUDID: %@", v13, v14, v15, v16, v17, v18, a3);
  }

  uint64_t v19 = [NSNumber numberWithUnsignedInteger:a3];
  v24[0] = v19;
  v24[1] = v11;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  uint64_t v21 = [(MBXPCClient *)self _sendRequest:@"kMBMessageListSnapshotFiles" arguments:v20 error:a5];

  os_activity_scope_leave(&state);
  return v21;
}

- (BOOL)mergeSnapshots:(id)a3 backupUUID:(id)a4 error:(id *)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = _os_activity_create(&dword_1DD9AE000, "mergeSnapshots:backupUUID:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v10, &v16);
  uint64_t v11 = objc_msgSend(v9, "mb_backupIDByRemovingCKPrefix");

  v17[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  uint64_t v13 = [v12 arrayByAddingObjectsFromArray:v8];
  uint64_t v14 = [(MBXPCClient *)self _sendRequest:@"kMBMessageMergeSnapshots" arguments:v13 error:a5];
  LOBYTE(a5) = [v14 BOOLValue];

  os_activity_scope_leave(&v16);
  return (char)a5;
}

- (BOOL)acquireLockWithBackupUDID:(id)a3 owner:(id)a4 timeout:(double)a5 error:(id *)a6
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = v12;
  if (!v11)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"MBXPCClient.m" lineNumber:978 description:@"Must provide a valid backup UDID"];

    if (v13) {
      goto LABEL_3;
    }
LABEL_5:
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"MBXPCClient.m" lineNumber:979 description:@"Must provide a valid lock owner"];

    goto LABEL_3;
  }
  if (!v12) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = _os_activity_create(&dword_1DD9AE000, "acquireLockWithBackupUDID:owner:timeout:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v23.opaque[0] = 0;
  v23.opaque[1] = 0;
  os_activity_scope_enter(v14, &v23);
  uint64_t v15 = objc_msgSend(v11, "mb_backupIDByRemovingCKPrefix");

  v24[0] = v15;
  v24[1] = v13;
  os_activity_scope_state_s v16 = [NSNumber numberWithDouble:a5];
  void v24[2] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
  uint64_t v18 = [(MBXPCClient *)self _sendRequest:@"kMBMessageAcquireLock" arguments:v17 error:a6];

  char v19 = [v18 BOOLValue];
  os_activity_scope_leave(&v23);

  return v19;
}

- (BOOL)releaseLockWithBackupUDID:(id)a3 owner:(id)a4 error:(id *)a5
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"MBXPCClient.m" lineNumber:992 description:@"Must provide a valid backup UDID"];

    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    char v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"MBXPCClient.m" lineNumber:993 description:@"Must provide a valid lock owner"];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  id v12 = _os_activity_create(&dword_1DD9AE000, "releaseLockWithBackupUDID:account:owner:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  uint64_t v13 = objc_msgSend(v9, "mb_backupIDByRemovingCKPrefix");

  v21[0] = v13;
  v21[1] = v11;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  uint64_t v15 = [(MBXPCClient *)self _sendRequest:@"kMBMessageReleaseLock" arguments:v14 error:a5];

  char v16 = [v15 BOOLValue];
  os_activity_scope_leave(&state);

  return v16;
}

- (id)deviceLockInfosWithError:(id *)a3
{
  id v5 = _os_activity_create(&dword_1DD9AE000, "deviceLockInfosWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  id v6 = [(MBXPCClient *)self _sendRequest:@"kMBMessageFetchDeviceLockInfos" arguments:0 error:a3];
  os_activity_scope_leave(&v8);

  return v6;
}

- (BOOL)startScanWithError:(id *)a3
{
  id v5 = _os_activity_create(&dword_1DD9AE000, "startScanWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  id v6 = [(MBXPCClient *)self _sendRequest:@"kMBMessageStartScan" arguments:0 error:a3];
  LOBYTE(a3) = [v6 BOOLValue];

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (BOOL)startScanForBundleIDs:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"MBXPCClient.m" lineNumber:1021 description:@"Must provide bundleIDs"];
  }
  os_activity_scope_state_s v8 = _os_activity_create(&dword_1DD9AE000, "startScanForBundleIDs:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v8, &v14);
  v15[0] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v10 = [(MBXPCClient *)self _sendRequest:@"kMBMessageStartScanForBundleIDs" arguments:v9 error:a4];

  char v11 = [v10 BOOLValue];
  os_activity_scope_leave(&v14);

  return v11;
}

- (unint64_t)nextBackupSize
{
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "nextBackupSize", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v3, &v7);
  unsigned int v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageNextBackupSize" arguments:0];
  unint64_t v5 = [v4 unsignedLongLongValue];

  os_activity_scope_leave(&v7);
  return v5;
}

- (id)nextBackupSizeInfo
{
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "nextBackupSizeInfo:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  unsigned int v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageNextBackupSizeInfo" arguments:0];
  os_activity_scope_leave(&v6);

  return v4;
}

- (id)domainInfoForName:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = _os_activity_create(&dword_1DD9AE000, "domainInfoForName:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v5, &v9);
  v10[0] = v4;
  os_activity_scope_state_s v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  os_activity_scope_state_s v7 = [(MBXPCClient *)self _sendRequest:@"kMBMessageDomainInfo" arguments:v6];

  os_activity_scope_leave(&v9);
  return v7;
}

- (id)domainInfoList
{
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "domainInfoList", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  if (domainInfoList_onceToken != -1) {
    dispatch_once(&domainInfoList_onceToken, &__block_literal_global_7);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)domainInfoList_domainInfosSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  id v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageDomainInfoList" arguments:0 error:0];
  dispatch_semaphore_signal((dispatch_semaphore_t)domainInfoList_domainInfosSemaphore);
  os_activity_scope_leave(&v6);

  return v4;
}

uint64_t __29__MBXPCClient_domainInfoList__block_invoke()
{
  domainInfoList_domainInfosSemaphore = (uint64_t)dispatch_semaphore_create(2);
  return MEMORY[0x1F41817F8]();
}

- (id)disabledDomainInfos
{
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "disabledDomainInfos", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  id v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageDisabledDomainInfos" arguments:0 error:0];
  os_activity_scope_leave(&v6);

  return v4;
}

- (BOOL)removeDomainName:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_activity_scope_state_s v7 = _os_activity_create(&dword_1DD9AE000, "removeDomainName:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v7, &v11);
  v12[0] = v6;
  os_activity_scope_state_s v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  os_activity_scope_state_s v9 = [(MBXPCClient *)self _sendRequest:@"kMBMessageRemoveDomain" arguments:v8 error:a4];

  LOBYTE(a4) = [v9 BOOLValue];
  os_activity_scope_leave(&v11);

  return (char)a4;
}

- (id)reservedBackupSizeListWithError:(id *)a3
{
  unint64_t v5 = _os_activity_create(&dword_1DD9AE000, "reservedBackupSizeList:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  id v6 = [(MBXPCClient *)self _sendRequest:@"kMBMessageReservedBackupSizeList" arguments:0 error:a3];
  os_activity_scope_leave(&v8);

  return v6;
}

- (BOOL)isBackupEnabledForDomainName:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = _os_activity_create(&dword_1DD9AE000, "isBackupEnabledForDomainName:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v5, &v9);
  v10[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  os_activity_scope_state_s v7 = [(MBXPCClient *)self _sendRequest:@"kMBMessageIsDomainEnabled" arguments:v6];

  LOBYTE(self) = [v7 BOOLValue];
  os_activity_scope_leave(&v9);

  return (char)self;
}

- (void)setBackupEnabled:(BOOL)a3 forDomainName:(id)a4
{
  BOOL v4 = a3;
  void v12[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  os_activity_scope_state_s v7 = _os_activity_create(&dword_1DD9AE000, "setBackupEnabled:forDomainName:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_state_s v8 = [NSNumber numberWithBool:v4];
  v12[0] = v8;
  v12[1] = v6;
  os_activity_scope_state_s v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  id v10 = [(MBXPCClient *)self _sendRequest:@"kMBMessageSetDomainEnabled" arguments:v9];
  os_activity_scope_leave(&state);
}

- (BOOL)extractItemFromBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 toPath:(id)a7 error:(id *)a8
{
  v26[5] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Null backup UDID"];
    if (v15)
    {
LABEL_3:
      if (v16) {
        goto LABEL_4;
      }
LABEL_8:
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Null relative path"];
      if (v17) {
        goto LABEL_5;
      }
LABEL_9:
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Null destination path"];
      goto LABEL_5;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Null domain name"];
  if (!v16) {
    goto LABEL_8;
  }
LABEL_4:
  if (!v17) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v18 = _os_activity_create(&dword_1DD9AE000, "extractItemFromBackupUDID:snapshotID:domainName:relativePath:toPath:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v25.opaque[0] = 0;
  v25.opaque[1] = 0;
  os_activity_scope_enter(v18, &v25);
  char v19 = objc_msgSend(v14, "mb_backupIDByRemovingCKPrefix");

  v26[0] = v19;
  uint64_t v20 = [NSNumber numberWithUnsignedInteger:a4];
  v26[1] = v20;
  v26[2] = v15;
  void v26[3] = v16;
  v26[4] = v17;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:5];

  id v22 = [(MBXPCClient *)self _sendRequest:@"kMBMessageExtractItem" arguments:v21 error:a8];
  char v23 = [v22 BOOLValue];

  os_activity_scope_leave(&v25);
  return v23;
}

- (BOOL)addFileToBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 fromPath:(id)a7 error:(id *)a8
{
  v26[5] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Null backup UDID"];
    if (v15)
    {
LABEL_3:
      if (v16) {
        goto LABEL_4;
      }
LABEL_8:
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Null relative path"];
      if (v17) {
        goto LABEL_5;
      }
LABEL_9:
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Null path"];
      goto LABEL_5;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Null domain name"];
  if (!v16) {
    goto LABEL_8;
  }
LABEL_4:
  if (!v17) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v18 = _os_activity_create(&dword_1DD9AE000, "addFileToBackupUDID:snapshotID:domainName:relativePath:fromPath:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v25.opaque[0] = 0;
  v25.opaque[1] = 0;
  os_activity_scope_enter(v18, &v25);
  char v19 = objc_msgSend(v14, "mb_backupIDByRemovingCKPrefix");

  v26[0] = v19;
  uint64_t v20 = [NSNumber numberWithUnsignedInteger:a4];
  v26[1] = v20;
  v26[2] = v15;
  void v26[3] = v16;
  v26[4] = v17;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:5];

  id v22 = [(MBXPCClient *)self _sendRequest:@"kMBMessageAddFile" arguments:v21 error:a8];
  char v23 = [v22 BOOLValue];

  os_activity_scope_leave(&v25);
  return v23;
}

- (BOOL)deleteItemFromBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 error:(id *)a7
{
  uint8_t v23[4] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_6:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Null domain name"];
    if (v14) {
      goto LABEL_4;
    }
LABEL_7:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Null relative path"];
    goto LABEL_4;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Null backup UDID"];
  if (!v13) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v14) {
    goto LABEL_7;
  }
LABEL_4:
  id v15 = _os_activity_create(&dword_1DD9AE000, "deleteItemFromBackupUDID:snapshotID:domainName:relativePath:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  id v16 = objc_msgSend(v12, "mb_backupIDByRemovingCKPrefix");

  v23[0] = v16;
  id v17 = [NSNumber numberWithUnsignedInteger:a4];
  v23[1] = v17;
  v23[2] = v13;
  v23[3] = v14;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];

  char v19 = [(MBXPCClient *)self _sendRequest:@"kMBMessageDeleteItem" arguments:v18 error:a7];
  char v20 = [v19 BOOLValue];

  os_activity_scope_leave(&state);
  return v20;
}

- (id)getAppleIDsForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 error:(id *)a5
{
  os_activity_scope_state_s v8 = objc_msgSend(a3, "mb_backupIDByRemovingCKPrefix");
  os_activity_scope_state_s v9 = [(MBXPCClient *)self getAppleIDsForBackupUDID:v8 snapshotID:a4 activeAppleID:0 error:a5];

  return v9;
}

- (id)getAppleIDsForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 activeAppleID:(id *)a5 error:(id *)a6
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (!v10) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"must provide a valid backup UDID"];
  }
  os_activity_scope_state_s v11 = _os_activity_create(&dword_1DD9AE000, "getAppleIDsForBackupUDID:snapshotID:activeAppleID:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  id v12 = objc_msgSend(v10, "mb_backupIDByRemovingCKPrefix");

  v22[0] = v12;
  id v13 = [NSNumber numberWithUnsignedInteger:a4];
  v22[1] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  id v15 = [(MBXPCClient *)self _sendRequest:@"kMBMessageGetAppleIDs" arguments:v14 error:a6];

  id v16 = objc_msgSend(v15, "subarrayWithRange:", 0, objc_msgSend(v15, "count") - 1);
  id v17 = [v15 lastObject];
  uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  if (v17 == v18)
  {
    char v19 = 0;
  }
  else
  {
    char v19 = [v15 lastObject];
  }

  if (a5) {
    *a5 = v19;
  }

  os_activity_scope_leave(&state);
  return v16;
}

- (id)getAppleIDsMapForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 activeAppleID:(id *)a5 error:(id *)a6
{
  void v24[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (!v10) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"must provide a valid backup UDID"];
  }
  os_activity_scope_state_s v11 = _os_activity_create(&dword_1DD9AE000, "getAppleIDsMapForBackupUDID:snapshotID:activeAppleID:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  id v12 = objc_msgSend(v10, "mb_backupIDByRemovingCKPrefix");

  v24[0] = v12;
  id v13 = [NSNumber numberWithUnsignedInteger:a4];
  v24[1] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  id v15 = [(MBXPCClient *)self _sendRequest:@"kMBMessageGetAppleIDsMap" arguments:v14 error:a6];

  id v16 = [v15 firstObject];
  id v17 = [MEMORY[0x1E4F1CA98] null];
  if (v16 == v17)
  {
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = [v15 firstObject];
  }

  char v19 = [v15 lastObject];
  char v20 = [MEMORY[0x1E4F1CA98] null];
  if (v19 == v20)
  {
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v21 = [v15 lastObject];
  }

  if (a5) {
    *a5 = v21;
  }

  os_activity_scope_leave(&state);
  return v18;
}

- (id)getBuddyDataStashForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 error:(id *)a5
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"must provide a valid backup UDID"];
  }
  os_activity_scope_state_s v9 = _os_activity_create(&dword_1DD9AE000, "getBuddyDataStashForBackupUDID:snapshotID:activeAppleID:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  id v10 = objc_msgSend(v8, "mb_backupIDByRemovingCKPrefix");

  v16[0] = v10;
  os_activity_scope_state_s v11 = [NSNumber numberWithUnsignedInteger:a4];
  v16[1] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  id v13 = [(MBXPCClient *)self _sendRequest:@"kMBMessageGetBuddyData" arguments:v12 error:a5];

  os_activity_scope_leave(&state);
  return v13;
}

- (id)restoreInfo
{
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "restoreInfo", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  BOOL v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageRestoreInfo" arguments:0];
  os_activity_scope_leave(&v6);

  return v4;
}

- (void)setRestoreSessionWithBackupUDID:(id)a3 snapshotUUID:(id)a4
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1DD9AE000, "setRestoreSessionWithBackupUDID:snapshotUUID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_state_s v9 = objc_msgSend(v6, "mb_backupIDByRemovingCKPrefix");

  v13[0] = v9;
  v13[1] = v7;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v11 = [(MBXPCClient *)self _sendRequest:@"kMBMessageSetRestoreSession" arguments:v10];

  os_activity_scope_leave(&state);
}

- (void)clearRestoreSession
{
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "clearRestoreSession", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  id v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageClearRestoreSession" arguments:0];
  os_activity_scope_leave(&v5);
}

- (void)setAllowiTunesBackup:(BOOL)a3
{
  BOOL v3 = a3;
  v10[1] = *MEMORY[0x1E4F143B8];
  os_activity_scope_state_s v5 = _os_activity_create(&dword_1DD9AE000, "setAllowiTunesBackup:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v5, &v9);
  id v6 = [NSNumber numberWithBool:v3];
  v10[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  id v8 = [(MBXPCClient *)self _sendRequest:@"kMBMessageSetAllowiTunesBackup" arguments:v7];
  os_activity_scope_leave(&v9);
}

- (BOOL)allowiTunesBackup
{
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "allowiTunesBackup", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  id v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageGetAllowiTunesBackup" arguments:0];
  LOBYTE(self) = [v4 BOOLValue];

  os_activity_scope_leave(&v6);
  return (char)self;
}

- (BOOL)airTrafficShouldCreateAppPlaceholdersWithError:(id *)a3
{
  return 1;
}

- (void)rebootDevice
{
}

- (void)rebootDevice:(BOOL)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = [NSNumber numberWithBool:a3];
  v12[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  os_activity_scope_state_s v6 = dispatch_semaphore_create(0);
  id v7 = MEMORY[0x1E4F144F0];
  while (1)
  {
    id v8 = _os_activity_create(&dword_1DD9AE000, "rebootDevice", v7, OS_ACTIVITY_FLAG_DEFAULT);
    v11.opaque[0] = 0;
    v11.opaque[1] = 0;
    os_activity_scope_enter(v8, &v11);
    id v9 = [(MBXPCClient *)self _sendRequest:@"kMBMessageRebootDevice" arguments:v5];
    dispatch_time_t v10 = dispatch_time(0, 300000000000);
    dispatch_semaphore_wait(v6, v10);
    os_activity_scope_leave(&v11);
  }
}

- (void)repair
{
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "repair", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  id v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageRepair" arguments:0];
  os_activity_scope_leave(&v5);
}

- (BOOL)countCameraRollQuota
{
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "countCameraRollQuota", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  id v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageCountCameraRollQuota" arguments:0];
  LOBYTE(self) = [v4 BOOLValue];

  os_activity_scope_leave(&v6);
  return (char)self;
}

- (BOOL)countCameraRollQuotaForBackupUDID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = _os_activity_create(&dword_1DD9AE000, "countCameraRollQuotaForBackupUDID:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v7, &v10);
  id v8 = [(MBXPCClient *)self _sendRequest:@"kMBMessageCountCameraRollQuota" arguments:0 error:a4];
  LOBYTE(a4) = [v8 BOOLValue];

  os_activity_scope_leave(&v10);
  return (char)a4;
}

- (BOOL)discountCameraRollQuota
{
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "discountCameraRollQuota", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  id v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageDiscountCameraRollQuota" arguments:0];
  LOBYTE(self) = [v4 BOOLValue];

  os_activity_scope_leave(&v6);
  return (char)self;
}

- (BOOL)discountCameraRollQuotaForBackupUDID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = _os_activity_create(&dword_1DD9AE000, "discountCameraRollQuotaForBackupUDID:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v7, &v10);
  id v8 = [(MBXPCClient *)self _sendRequest:@"kMBMessageDiscountCameraRollQuota" arguments:0 error:a4];
  LOBYTE(a4) = [v8 BOOLValue];

  os_activity_scope_leave(&v10);
  return (char)a4;
}

- (BOOL)prepareForBackgroundRestoreWithError:(id *)a3
{
  os_activity_scope_state_s v5 = _os_activity_create(&dword_1DD9AE000, "prepareForBackgroundRestoreWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  id v6 = [(MBXPCClient *)self _sendRequest:@"kMBMessagePrepareForBackgroundRestore" arguments:0 error:a3];
  LOBYTE(a3) = [v6 BOOLValue];

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (BOOL)archiveLogsTo:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_1DD9AE000, "archiveLogsTo:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter(v7, &v15);
  v18[0] = v6;
  os_activity_scope_state_s v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v9 = [(MBXPCClient *)self _sendRequest:@"kMBMessageArchiveLogs" arguments:v8 error:a4];
  uint64_t v10 = [v9 intValue];

  if (a4 && v10)
  {
    os_activity_scope_state_s v11 = (void *)MEMORY[0x1E4F28C58];
    id v16 = @"status";
    id v12 = [NSNumber numberWithInt:v10];
    id v17 = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    *a4 = [v11 errorWithDomain:@"MBErrorDomain" code:1 userInfo:v13];
  }
  os_activity_scope_leave(&v15);

  return v10 == 0;
}

- (BOOL)pinSnapshotID:(unint64_t)a3 backupUDID:(id)a4 error:(id *)a5
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (!v8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"must provide a valid backup UDID"];
  }
  id v9 = _os_activity_create(&dword_1DD9AE000, "pinSnapshotID:backupUDID:error", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  uint64_t v10 = objc_msgSend(v8, "mb_backupIDByRemovingCKPrefix");

  os_activity_scope_state_s v11 = [NSNumber numberWithUnsignedInteger:a3];
  v17[0] = v11;
  v17[1] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v13 = [(MBXPCClient *)self _sendRequest:@"kMBMessagePinSnapshot" arguments:v12 error:a5];

  char v14 = [v13 BOOLValue];
  os_activity_scope_leave(&state);

  return v14;
}

- (BOOL)unpinSnapshotID:(unint64_t)a3 backupUDID:(id)a4 error:(id *)a5
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (!v8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"must provide a valid backup UDID"];
  }
  id v9 = _os_activity_create(&dword_1DD9AE000, "unpinSnapshotID:backupUDID:error", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  uint64_t v10 = objc_msgSend(v8, "mb_backupIDByRemovingCKPrefix");

  os_activity_scope_state_s v11 = [NSNumber numberWithUnsignedInteger:a3];
  v17[0] = v11;
  v17[1] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v13 = [(MBXPCClient *)self _sendRequest:@"kMBMessageUnpinSnapshot" arguments:v12 error:a5];

  char v14 = [v13 BOOLValue];
  os_activity_scope_leave(&state);

  return v14;
}

- (void)boostBackgroundRestoreWithCompletionHandler:(id)a3
{
  id v4 = a3;
  os_activity_scope_state_s v5 = dispatch_get_global_queue(17, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__MBXPCClient_boostBackgroundRestoreWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6D00EB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__MBXPCClient_boostBackgroundRestoreWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E01C2AA0]();
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "boostRunningBackgroundRestore:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  id v4 = *(void **)(a1 + 32);
  id v7 = 0;
  id v5 = (id)[v4 _sendRequest:@"kMBMessageBoostBackgroundRestore" arguments:0 error:&v7];
  id v6 = v7;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  os_activity_scope_leave(&state);
}

- (void)fetchAppBundleIDsForSnapshot:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MBXPCClient_fetchAppBundleIDsForSnapshot_completion___block_invoke;
  block[3] = &unk_1E6D01210;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __55__MBXPCClient_fetchAppBundleIDsForSnapshot_completion___block_invoke(void *a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E01C2AA0]();
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "fetchAppBundleIDs", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  id v4 = (void *)a1[4];
  v10[0] = a1[5];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v8 = 0;
  id v6 = [v4 _sendRequest:@"kMBMessageFetchBundleIDs" arguments:v5 error:&v8];
  id v7 = v8;

  (*(void (**)(void))(a1[6] + 16))();
  os_activity_scope_leave(&state);
}

- (void)fetchRestorableSnapshotsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(17, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__MBXPCClient_fetchRestorableSnapshotsWithCompletion___block_invoke;
  v7[3] = &unk_1E6D00EB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__MBXPCClient_fetchRestorableSnapshotsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E01C2AA0]();
  BOOL v3 = _os_activity_create(&dword_1DD9AE000, "fetchRestorableSnapshots", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  id v4 = *(void **)(a1 + 32);
  id v7 = 0;
  id v5 = [v4 _sendRequest:@"kMBMessageFetchRestorableSnapshots" arguments:0 error:&v7];
  id v6 = v7;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  os_activity_scope_leave(&state);
}

- (id)pendingSnapshotForCurrentDeviceWithError:(id *)a3
{
  id v5 = _os_activity_create(&dword_1DD9AE000, "pendingSnapshotForCurrentDeviceWithError", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  id v6 = [(MBXPCClient *)self _sendRequest:@"kMBMessagePendingSnapshotForCurrentDevice" arguments:0 error:a3];
  os_activity_scope_leave(&v8);

  return v6;
}

- (unint64_t)_backupOnCellularSupport
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(MBXPCClient *)v2 cellularDataSubscriptionMonitor];
  if (v3)
  {
    id v4 = [(MBXPCClient *)v2 initialBackupOnCellularSupportGroup];
  }
  else
  {
    objc_initWeak(&location, v2);
    id v4 = dispatch_group_create();
    [(MBXPCClient *)v2 setInitialBackupOnCellularSupportGroup:v4];
    dispatch_group_enter(v4);
    id v5 = (objc_class *)objc_opt_class();
    Name = class_getName(v5);
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create(Name, v7);

    BOOL v3 = [[MBCellularDataSubscriptionMonitor alloc] initWithQueue:v8 timeout:30];
    [(MBXPCClient *)v2 setCellularDataSubscriptionMonitor:v3];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __39__MBXPCClient__backupOnCellularSupport__block_invoke;
    char v14 = &unk_1E6D00E68;
    objc_copyWeak(&v15, &location);
    [(MBCellularDataSubscriptionMonitor *)v3 setBackupOnCellularSupportHandler:&v11];
    [(MBCellularDataSubscriptionMonitor *)v3 start];
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);

  if (v4) {
    dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  }
  unint64_t v9 = [(MBCellularDataSubscriptionMonitor *)v3 backupOnCellularSupport];

  return v9;
}

void __39__MBXPCClient__backupOnCellularSupport__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = [WeakRetained initialBackupOnCellularSupportGroup];
    if (v2)
    {
      [v3 setInitialBackupOnCellularSupportGroup:0];
      dispatch_group_leave(v2);
    }

    id WeakRetained = v3;
  }
}

- (BOOL)isBackupOnCellularAllowedWithAccount:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5 && objc_msgSend(v5, "aa_useCellularForDataclass:", *MEMORY[0x1E4F17528])) {
    unint64_t v7 = ([(MBXPCClient *)self _backupOnCellularSupport] >> 1) & 1;
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isManualBackupOnCellularAllowedWithAccount:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5 && objc_msgSend(v5, "aa_useCellularForDataclass:", *MEMORY[0x1E4F17528])) {
    unint64_t v7 = [(MBXPCClient *)self _backupOnCellularSupport] & 1;
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (unint64_t)backupOnCellularSupportWithAccount:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5 && objc_msgSend(v5, "aa_useCellularForDataclass:", *MEMORY[0x1E4F17528])) {
    unint64_t v7 = [(MBXPCClient *)self _backupOnCellularSupport];
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)isBackupOnCellularEnabledWithError:(id *)a3
{
  id v5 = _os_activity_create(&dword_1DD9AE000, "isBackupOnCellularEnabledWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  id v6 = [(MBXPCClient *)self _sendRequest:@"kMBMessageIsBackupOnCellularEnabled" arguments:0 error:a3];
  LOBYTE(a3) = [v6 BOOLValue];

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (BOOL)setBackupOnCellularEnabled:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  v13[1] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = _os_activity_create(&dword_1DD9AE000, "setBackupOnCellularEnabled:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v7, &v12);
  os_activity_scope_state_s v8 = [NSNumber numberWithBool:v5];
  v13[0] = v8;
  unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v10 = [(MBXPCClient *)self _sendRequest:@"kMBMessageSetBackupOnCellularEnabled" arguments:v9 error:a4];

  LOBYTE(a4) = [v10 BOOLValue];
  os_activity_scope_leave(&v12);

  return (char)a4;
}

- (BOOL)setEntryPointForMegaBackupTelemetry:(int64_t)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = _os_activity_create(&dword_1DD9AE000, "setEntryPointForMegaBackupTelemetry:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v7, &v12);
  os_activity_scope_state_s v8 = [NSNumber numberWithInteger:a3];
  v13[0] = v8;
  unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v10 = [(MBXPCClient *)self _sendRequest:@"kMBMessageSetEntryPointForMegaBackupTelemetry" arguments:v9 error:a4];

  LOBYTE(a4) = [v10 BOOLValue];
  os_activity_scope_leave(&v12);

  return (char)a4;
}

- (BOOL)setPrebuddyUIDeltaTelemetry:(id)a3 date:(id)a4 error:(id *)a5
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = _os_activity_create(&dword_1DD9AE000, "setPrebuddyUIDeltaTelemetry:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  v15[0] = v8;
  v15[1] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  os_activity_scope_state_s v12 = [(MBXPCClient *)self _sendRequest:@"kMBMessageSetPrebuddyUIDeltaTelemetry" arguments:v11 error:a5];

  LOBYTE(a5) = [v12 BOOLValue];
  os_activity_scope_leave(&state);

  return (char)a5;
}

- (BOOL)logPrebuddyFlowTelemetry:(int64_t)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = _os_activity_create(&dword_1DD9AE000, "logPrebuddyFlowTelemetry:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v7, &v12);
  id v8 = [NSNumber numberWithInteger:a3];
  v13[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v10 = [(MBXPCClient *)self _sendRequest:@"kMBMessageLogPrebuddyFlowTelemetry" arguments:v9 error:a4];

  LOBYTE(a4) = [v10 BOOLValue];
  os_activity_scope_leave(&v12);

  return (char)a4;
}

- (id)synchronizeFileListsWithDeviceUUID:(id)a3 commitID:(id)a4 error:(id *)a5
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  v14[0] = a3;
  v14[1] = a4;
  id v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v8 arrayWithObjects:v14 count:2];

  os_activity_scope_state_s v12 = [(MBXPCClient *)self _sendRequest:@"kMBMessageSynchronizeFileLists" arguments:v11 error:a5];

  return v12;
}

- (id)dryRestore:(id)a3 snapshotUUID:(id)a4 error:(id *)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = (void *)MEMORY[0x1E4F1CA60];
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v8 dictionary];
  [v11 setObject:v10 forKeyedSubscript:@"kMBMessageDryRestoreAllowance"];

  [v11 setObject:v9 forKeyedSubscript:@"kMBMessageDryRestoreSnapshotUUID"];
  v15[0] = v11;
  os_activity_scope_state_s v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v13 = [(MBXPCClient *)self _sendRequest:@"kMBMessageDryRestore" arguments:v12 error:a5];

  return v13;
}

- (BOOL)restoreDomain:(id)a3 deviceUUID:(id)a4 snapshotUUID:(id)a5 intoPath:(id)a6 error:(id *)a7
{
  v20[4] = *MEMORY[0x1E4F143B8];
  v20[0] = a3;
  v20[1] = a4;
  void v20[2] = a5;
  v20[3] = a6;
  os_activity_scope_state_s v12 = (void *)MEMORY[0x1E4F1C978];
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v12 arrayWithObjects:v20 count:4];

  uint64_t v18 = [(MBXPCClient *)self _sendRequest:@"kMBMessageRestoreDomain" arguments:v17 error:a7];

  LOBYTE(a7) = [v18 BOOLValue];
  return (char)a7;
}

- (id)fetchBackupCKRecordsIntoDB:(id *)a3
{
  return [(MBXPCClient *)self _sendRequest:@"kMBMessageFetchBackupCKRecordsIntoDB" arguments:0 error:a3];
}

- (id)scheduleActivities:(id)a3 error:(id *)a4
{
  return [(MBXPCClient *)self _sendRequest:@"kMBMessageScheduleActivities" arguments:a3 error:a4];
}

- (BOOL)startDeviceTransferWithTaskType:(int64_t)a3 sessionInfo:(id)a4 error:(id *)a5
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (!a3) {
    -[MBXPCClient startDeviceTransferWithTaskType:sessionInfo:error:]();
  }
  id v9 = v8;
  if (!v8) {
    -[MBXPCClient startDeviceTransferWithTaskType:sessionInfo:error:]();
  }
  if (!a5) {
    -[MBXPCClient startDeviceTransferWithTaskType:sessionInfo:error:]();
  }
  id v10 = _os_activity_create(&dword_1DD9AE000, "startDeviceTransfer", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  uint64_t v11 = [NSNumber numberWithInteger:a3];
  v17[0] = v11;
  v17[1] = v9;
  os_activity_scope_state_s v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  id v13 = [(MBXPCClient *)self _sendRequest:@"kMBMessageStartDeviceTransfer" arguments:v12 error:a5];

  char v14 = [v13 BOOLValue];
  os_activity_scope_leave(&state);

  return v14;
}

- (BOOL)cancelDeviceTransferWithTaskType:(int64_t)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    -[MBXPCClient cancelDeviceTransferWithTaskType:error:]();
  }
  if (!a4) {
    -[MBXPCClient cancelDeviceTransferWithTaskType:error:]();
  }
  unint64_t v7 = _os_activity_create(&dword_1DD9AE000, "cancelDeviceTransfer", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v7, &v13);
  id v8 = [NSNumber numberWithInteger:a3];
  v14[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v10 = [(MBXPCClient *)self _sendRequest:@"kMBMessageCancelDeviceTransfer" arguments:v9 error:a4];

  char v11 = [v10 BOOLValue];
  os_activity_scope_leave(&v13);

  return v11;
}

- (BOOL)resumeDeviceTransferWithTaskType:(int64_t)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    -[MBXPCClient resumeDeviceTransferWithTaskType:error:]();
  }
  if (!a4) {
    -[MBXPCClient resumeDeviceTransferWithTaskType:error:]();
  }
  unint64_t v7 = _os_activity_create(&dword_1DD9AE000, "resumeDeviceTransfer", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v7, &v13);
  id v8 = [NSNumber numberWithInteger:a3];
  v14[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v10 = [(MBXPCClient *)self _sendRequest:@"kMBMessageResumeDeviceTransfer" arguments:v9 error:a4];

  char v11 = [v10 BOOLValue];
  os_activity_scope_leave(&v13);

  return v11;
}

- (void)startPreflightWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = dispatch_get_global_queue(17, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__MBXPCClient_startPreflightWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6D00EB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __51__MBXPCClient_startPreflightWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E01C2AA0]();
  id v3 = _os_activity_create(&dword_1DD9AE000, "preflight", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  id v4 = *(void **)(a1 + 32);
  id v9 = 0;
  uint64_t v5 = [v4 _sendRequest:@"kMBMessageStartPreflight" arguments:MEMORY[0x1E4F1CBF0] error:&v9];
  unint64_t v6 = (unint64_t)v9;
  if (!(v5 | v6)) {
    __assert_rtn("-[MBXPCClient startPreflightWithCompletionHandler:]_block_invoke", "MBXPCClient.m", 1618, "preflightInfo || error");
  }
  unint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, v5, v7);
  }

  os_activity_scope_leave(&state);
}

- (void)startKeychainTransferWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(17, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__MBXPCClient_startKeychainTransferWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6D00EB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __58__MBXPCClient_startKeychainTransferWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E01C2AA0]();
  id v3 = _os_activity_create(&dword_1DD9AE000, "keychainTransfer", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  id v4 = *(void **)(a1 + 32);
  id v9 = 0;
  uint64_t v5 = [v4 _sendRequest:@"kMBMessageStarKeychainTransfer" arguments:MEMORY[0x1E4F1CBF0] error:&v9];
  unint64_t v6 = (unint64_t)v9;
  if (!(v5 | v6)) {
    __assert_rtn("-[MBXPCClient startKeychainTransferWithCompletionHandler:]_block_invoke", "MBXPCClient.m", 1633, "result || error");
  }
  unint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v7);
  }

  os_activity_scope_leave(&state);
}

- (void)startKeychainDataTransferWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(17, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__MBXPCClient_startKeychainDataTransferWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6D00EB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __62__MBXPCClient_startKeychainDataTransferWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E01C2AA0]();
  id v3 = _os_activity_create(&dword_1DD9AE000, "keychainDataTransfer", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  id v4 = *(void **)(a1 + 32);
  id v9 = 0;
  uint64_t v5 = [v4 _sendRequest:@"kMBMessageStarKeychainDataTransfer" arguments:MEMORY[0x1E4F1CBF0] error:&v9];
  unint64_t v6 = (unint64_t)v9;
  if (!(v5 | v6)) {
    __assert_rtn("-[MBXPCClient startKeychainDataTransferWithCompletionHandler:]_block_invoke", "MBXPCClient.m", 1647, "keychainInfo || error");
  }
  unint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, v5, v7);
  }

  os_activity_scope_leave(&state);
}

- (void)startKeychainDataImportWithKeychainInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    -[MBXPCClient startKeychainDataImportWithKeychainInfo:completionHandler:]();
  }
  uint64_t v8 = v7;
  id v9 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__MBXPCClient_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke;
  block[3] = &unk_1E6D01210;
  void block[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __73__MBXPCClient_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke(void *a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E01C2AA0]();
  id v3 = _os_activity_create(&dword_1DD9AE000, "keychainDataImport", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  id v4 = (void *)a1[4];
  v11[0] = a1[5];
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = 0;
  uint64_t v6 = [v4 _sendRequest:@"kMBMessageStarKeychainDataImport" arguments:v5 error:&v9];
  unint64_t v7 = (unint64_t)v9;

  if (!(v6 | v7)) {
    __assert_rtn("-[MBXPCClient startKeychainDataImportWithKeychainInfo:completionHandler:]_block_invoke", "MBXPCClient.m", 1662, "result || error");
  }
  uint64_t v8 = a1[6];
  if (v8) {
    (*(void (**)(uint64_t, unint64_t))(v8 + 16))(v8, v7);
  }

  os_activity_scope_leave(&state);
}

- (void)startDataTransferWithPreflightInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    -[MBXPCClient startDataTransferWithPreflightInfo:completionHandler:]();
  }
  uint64_t v8 = v7;
  id v9 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__MBXPCClient_startDataTransferWithPreflightInfo_completionHandler___block_invoke;
  block[3] = &unk_1E6D01210;
  void block[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __68__MBXPCClient_startDataTransferWithPreflightInfo_completionHandler___block_invoke(void *a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E01C2AA0]();
  id v3 = _os_activity_create(&dword_1DD9AE000, "dataTransfer", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  id v4 = (void *)a1[4];
  v11[0] = a1[5];
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = 0;
  uint64_t v6 = [v4 _sendRequest:@"kMBMessageStartDataTransfer" arguments:v5 error:&v9];
  unint64_t v7 = (unint64_t)v9;

  if (!(v6 | v7)) {
    __assert_rtn("-[MBXPCClient startDataTransferWithPreflightInfo:completionHandler:]_block_invoke", "MBXPCClient.m", 1677, "result || error");
  }
  uint64_t v8 = a1[6];
  if (v8) {
    (*(void (**)(uint64_t, unint64_t))(v8 + 16))(v8, v7);
  }

  os_activity_scope_leave(&state);
}

- (id)personalPersonaIdentifier
{
  id v3 = _os_activity_create(&dword_1DD9AE000, "personalPersonaIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  id v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageFetchPersonalPersonaIdentifier" arguments:0];
  os_activity_scope_leave(&v6);

  return v4;
}

- (id)_makeConnection
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = [(MBXPCClient *)v2 connection];
  if (!v3)
  {
    id v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v2;
      __int16 v14 = 2112;
      id v15 = @"com.apple.backupd";
      _os_log_impl(&dword_1DD9AE000, v4, OS_LOG_TYPE_INFO, "%@ connecting to \"%@\"", buf, 0x16u);
      _MBLog(@"INFO", (uint64_t)"%@ connecting to \"%@\"", v5, v6, v7, v8, v9, v10, (uint64_t)v2);
    }

    id v3 = [[MBConnection alloc] initWithServiceName:@"com.apple.backupd" delegate:v2 delegateQueue:v2->_eventQueue];
    [(MBXPCClient *)v2 setConnection:v3];
    [(MBConnection *)v3 resume];
  }
  objc_sync_exit(v2);

  if (!v3) {
    -[MBXPCClient _makeConnection]();
  }
  return v3;
}

- (id)_sendRequest:(id)a3 arguments:(id)a4
{
  return [(MBXPCClient *)self _sendRequest:a3 arguments:a4 error:0];
}

- (id)_sendRequest:(id)a3 arguments:(id)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = +[MBMessage messageWithName:v8 arguments:a4 personaIdentifier:self->_personaIdentifier];
  uint64_t v10 = [(MBXPCClient *)self _makeConnection];
  id v42 = 0;
  id v11 = [v10 sendMessageWithReplyAndSync:v9 error:&v42];
  id v12 = v42;

  if (v11) {
    goto LABEL_2;
  }
  BOOL v17 = +[MBError isError:v12 withCode:19];
  uint64_t v18 = MBGetDefaultLog();
  char v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v44 = v8;
      __int16 v45 = 2112;
      id v46 = v12;
      _os_log_impl(&dword_1DD9AE000, v19, OS_LOG_TYPE_DEFAULT, "Failed to send \"%@\" message - retrying once: %@", buf, 0x16u);
      _MBLog(@"DEFAULT", (uint64_t)"Failed to send \"%@\" message - retrying once: %@", v20, v21, v22, v23, v24, v25, (uint64_t)v8);
    }

    unint64_t v26 = [(MBXPCClient *)self _makeConnection];
    id v41 = v12;
    id v11 = [v26 sendMessageWithReplyAndSync:v9 error:&v41];
    id v27 = v41;

    if (v11)
    {
      id v12 = v27;
LABEL_2:
      id v13 = [v11 replyError];
      __int16 v14 = v13;
      if (a5 && v13) {
        *a5 = v13;
      }
      id v15 = [v11 reply];

      goto LABEL_6;
    }
    uint64_t v34 = MBGetDefaultLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v44 = v8;
      __int16 v45 = 2112;
      id v46 = v27;
      _os_log_impl(&dword_1DD9AE000, v34, OS_LOG_TYPE_ERROR, "Failed to send \"%@\" message on retry: %@", buf, 0x16u);
      _MBLog(@"ERROR", (uint64_t)"Failed to send \"%@\" message on retry: %@", v35, v36, v37, v38, v39, v40, (uint64_t)v8);
    }

    if (a5)
    {
      +[MBError errorWithCode:19 error:v27 format:@"Connection to backupd interrupted"];
      id v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v15 = 0;
    }
    id v12 = v27;
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v44 = v8;
      __int16 v45 = 2112;
      id v46 = v12;
      _os_log_impl(&dword_1DD9AE000, v19, OS_LOG_TYPE_ERROR, "Failed to send \"%@\" message: %@", buf, 0x16u);
      _MBLog(@"ERROR", (uint64_t)"Failed to send \"%@\" message: %@", v28, v29, v30, v31, v32, v33, (uint64_t)v8);
    }

    if (a5)
    {
      +[MBError errorWithCode:20 error:v12 format:@"Connection to backupd invalid"];
      id v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v15 = 0;
    }
  }
LABEL_6:

  return v15;
}

- (void)connection:(id)a3 didReceiveMessage:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [(MBManager *)self delegate];
  if (v6)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
    uint64_t v7 = [v5 name];
    id v8 = [v5 arguments];
    uint64_t v9 = [v5 error];
    if ([(__CFString *)v7 isEqualToString:@"kMBMessageDidFinishBackup"])
    {
      if (objc_opt_respondsToSelector()) {
        [v6 managerDidFinishBackup:self];
      }
      goto LABEL_31;
    }
    if ([(__CFString *)v7 isEqualToString:@"kMBMessageDidFinishScan"])
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v10 = [v8 objectAtIndexedSubscript:0];
        uint64_t v11 = [v10 unsignedLongLongValue];

        [v6 managerDidFinishScan:self bytesUsed:v11];
      }
      if (objc_opt_respondsToSelector()) {
        [v6 managerDidFinishScan:self];
      }
      goto LABEL_31;
    }
    if ([(__CFString *)v7 isEqualToString:@"kMBMessageDidFinishVerification"])
    {
      if (objc_opt_respondsToSelector()) {
        [v6 managerDidFinishVerification:self];
      }
      goto LABEL_31;
    }
    if ([(__CFString *)v7 isEqualToString:@"kMBMessageDidFinishRestore"])
    {
      if (objc_opt_respondsToSelector()) {
        [v6 managerDidFinishRestore:self];
      }
      goto LABEL_31;
    }
    if ([(__CFString *)v7 isEqualToString:@"kMBMessageDidFinishFileRestore"])
    {
      if (objc_opt_respondsToSelector())
      {
        id v12 = [v8 objectAtIndexedSubscript:0];
        [v6 manager:self didFinishRestoreForPath:v12];
LABEL_30:
      }
LABEL_31:

      goto LABEL_32;
    }
    if ([(__CFString *)v7 isEqualToString:@"kMBMessageDidScanBundle"])
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_31;
      }
      id v12 = [v8 objectAtIndexedSubscript:0];
      id v13 = [v8 objectAtIndexedSubscript:1];
      objc_msgSend(v6, "manager:didScanBundleWithID:bytesUsed:", self, v12, objc_msgSend(v13, "unsignedLongLongValue"));
    }
    else
    {
      if ([(__CFString *)v7 isEqualToString:@"kMBMessageDidScanDomainForBundle"])
      {
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_31;
        }
        id v12 = [v8 objectAtIndexedSubscript:0];
        id v13 = [v8 objectAtIndexedSubscript:1];
        __int16 v14 = [v8 objectAtIndexedSubscript:2];
        objc_msgSend(v6, "manager:didScanDomainWithName:forBundleID:bytesUsed:", self, v12, v13, objc_msgSend(v14, "unsignedLongLongValue"));
      }
      else
      {
        if (![(__CFString *)v7 isEqualToString:@"kMBMessageDidScanFilesForBundle"])
        {
          if ([(__CFString *)v7 isEqualToString:@"kMBMessageDidFailBackup"])
          {
            if (objc_opt_respondsToSelector()) {
              [v6 manager:self didFailBackupWithError:v9];
            }
            goto LABEL_31;
          }
          if ([(__CFString *)v7 isEqualToString:@"kMBMessageDidFailScan"])
          {
            if (objc_opt_respondsToSelector()) {
              [v6 manager:self didFailScanWithError:v9];
            }
            goto LABEL_31;
          }
          if ([(__CFString *)v7 isEqualToString:@"kMBMessageDidFailVerification"])
          {
            if (objc_opt_respondsToSelector()) {
              [v6 manager:self didFailVerificationWithError:v9];
            }
            goto LABEL_31;
          }
          if ([(__CFString *)v7 isEqualToString:@"kMBMessageDidFailRestore"])
          {
            if (objc_opt_respondsToSelector()) {
              [v6 manager:self didFailRestoreWithError:v9];
            }
            goto LABEL_31;
          }
          if ([(__CFString *)v7 isEqualToString:@"kMBMessageDidFailFileRestore"])
          {
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              goto LABEL_31;
            }
            id v12 = [v8 objectAtIndexedSubscript:0];
            [v6 manager:self didFailRestoreForPath:v12 withError:v9];
          }
          else
          {
            if ([(__CFString *)v7 isEqualToString:@"kMBMessageDidCancelRestore"])
            {
              if (objc_opt_respondsToSelector()) {
                [v6 managerDidCancelRestore:self];
              }
              goto LABEL_31;
            }
            if ([(__CFString *)v7 isEqualToString:@"kMBMessageDidUpdateProgress"])
            {
              id v15 = [v8 objectAtIndexedSubscript:0];
              [v15 floatValue];
              int v17 = v16;

              uint64_t v18 = [v8 objectAtIndexedSubscript:1];
              uint64_t v19 = [v18 unsignedIntegerValue];

              uint64_t v20 = [v8 objectAtIndexedSubscript:2];
              uint64_t v21 = [v20 unsignedLongLongValue];

              uint64_t v22 = [v8 objectAtIndexedSubscript:3];
              if (objc_opt_respondsToSelector())
              {
                LODWORD(v23) = v17;
                [v6 manager:self didUpdateProgress:v19 estimatedTimeRemaining:v23];
              }
              else if (objc_opt_respondsToSelector())
              {
                LODWORD(v24) = v17;
                [v6 manager:self didUpdateProgress:v19 estimatedTimeRemaining:v21 bytesRemaining:v22 state:v24];
              }

              goto LABEL_31;
            }
            if ([(__CFString *)v7 isEqualToString:@"kMBMessageDidSetBackupEnabled"])
            {
              if ((objc_opt_respondsToSelector() & 1) == 0) {
                goto LABEL_31;
              }
              id v12 = [v8 objectAtIndexedSubscript:0];
              objc_msgSend(v6, "manager:didSetBackupEnabled:", self, objc_msgSend(v12, "BOOLValue"));
            }
            else
            {
              if ([(__CFString *)v7 isEqualToString:@"kMBMessageDidUpdateBackgroundRestoreProgress"])
              {
                if (objc_opt_respondsToSelector()) {
                  [v6 managerDidUpdateBackgroundRestoreProgress:self];
                }
                goto LABEL_31;
              }
              if ([(__CFString *)v7 isEqualToString:@"kMBMessageDidFinishDeviceTransfer"])
              {
                uint64_t v25 = MBGetDefaultLog();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  id v57 = @"kMBMessageDidFinishDeviceTransfer";
                  _os_log_impl(&dword_1DD9AE000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
                  _MBLog(@"DEFAULT", (uint64_t)"%{public}@", v26, v27, v28, v29, v30, v31, @"kMBMessageDidFinishDeviceTransfer");
                }

                if (objc_opt_respondsToSelector()) {
                  [v6 manager:self didFinishDeviceTransferWithError:v9];
                }
                goto LABEL_31;
              }
              if ([(__CFString *)v7 isEqualToString:@"kMBMessageDidFinishDeviceTransferKeychainTransfer"])
              {
                if (objc_opt_respondsToSelector()) {
                  [v6 manager:self didFinishDeviceTransferKeychainTransfer:0];
                }
                goto LABEL_31;
              }
              if ([(__CFString *)v7 isEqualToString:@"kMBMessageDidFinishDeviceTransferPreflight"])
              {
                if ((objc_opt_respondsToSelector() & 1) == 0) {
                  goto LABEL_31;
                }
                id v12 = [v8 firstObject];
                [v6 manager:self didFinishDeviceTransferPreflight:v12 error:v9];
              }
              else if ([(__CFString *)v7 isEqualToString:@"kMBMessageDidUpdateDeviceTransferProgress"])
              {
                id v12 = [v8 firstObject];
                uint64_t v32 = MBGetDefaultLog();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  [v12 progress];
                  *(_DWORD *)buf = 134217984;
                  id v57 = v33;
                  _os_log_impl(&dword_1DD9AE000, v32, OS_LOG_TYPE_DEFAULT, "p:%.2f", buf, 0xCu);
                  [v12 progress];
                  _MBLog(@"DEFAULT", (uint64_t)"p:%.2f", v34, v35, v36, v37, v38, v39, v40);
                }

                if (objc_opt_respondsToSelector()) {
                  [v6 manager:self didUpdateDeviceTransferProgress:v12];
                }
              }
              else
              {
                if (![(__CFString *)v7 isEqualToString:@"kMBMessageDidUpdateDeviceTransferConnectionInfo"])
                {
                  v49 = MBGetDefaultLog();
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v57 = v7;
                    _os_log_impl(&dword_1DD9AE000, v49, OS_LOG_TYPE_ERROR, "Unknown command '%@' from daemon", buf, 0xCu);
                    _MBLog(@"ERROR", (uint64_t)"Unknown command '%@' from daemon", v50, v51, v52, v53, v54, v55, (uint64_t)v7);
                  }

                  goto LABEL_31;
                }
                id v12 = [v8 firstObject];
                id v41 = MBGetDefaultLog();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134218240;
                  id v57 = (__CFString *)[v12 connectionState];
                  __int16 v58 = 2048;
                  uint64_t v59 = [v12 connectionType];
                  _os_log_impl(&dword_1DD9AE000, v41, OS_LOG_TYPE_DEFAULT, "s:%ld, t:%ld", buf, 0x16u);
                  uint64_t v42 = [v12 connectionState];
                  [v12 connectionType];
                  _MBLog(@"DEFAULT", (uint64_t)"s:%ld, t:%ld", v43, v44, v45, v46, v47, v48, v42);
                }

                if (objc_opt_respondsToSelector()) {
                  [v6 manager:self didUpdateDeviceTransferConnectionInfo:v12];
                }
              }
            }
          }
          goto LABEL_30;
        }
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_31;
        }
        id v12 = [v8 objectAtIndexedSubscript:0];
        id v13 = [v8 objectAtIndexedSubscript:1];
        __int16 v14 = [v8 objectAtIndexedSubscript:2];
        [v6 manager:self didScanFiles:v12 forDomainWithName:v13 bundleID:v14];
      }
    }
    goto LABEL_30;
  }
LABEL_32:
}

- (void)connectionWasInterrupted:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MBManager *)self delegate];
  if (v5)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
    if (objc_opt_respondsToSelector())
    {
      id v6 = [(MBXPCClient *)self connection];
      uint64_t v7 = MBGetDefaultLog();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6 == v4)
      {
        if (v8)
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v4;
          _os_log_impl(&dword_1DD9AE000, v7, OS_LOG_TYPE_DEFAULT, "Informing client connection was interrupted: %@", buf, 0xCu);
          _MBLog(@"DEFAULT", (uint64_t)"Informing client connection was interrupted: %@", v15, v16, v17, v18, v19, v20, (uint64_t)v4);
        }

        [v5 managerDidLoseConnectionToService:self];
      }
      else
      {
        if (v8)
        {
          *(_DWORD *)buf = 138412546;
          id v22 = v4;
          __int16 v23 = 2112;
          id v24 = v6;
          _os_log_impl(&dword_1DD9AE000, v7, OS_LOG_TYPE_DEFAULT, "Not informing client connection was interrupted because there is a new connection already(%@ != %@)", buf, 0x16u);
          _MBLog(@"DEFAULT", (uint64_t)"Not informing client connection was interrupted because there is a new connection already(%@ != %@)", v9, v10, v11, v12, v13, v14, (uint64_t)v4);
        }
      }
    }
  }
}

- (void)connectionWasInvalidated:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(MBXPCClient *)v4 setConnection:0];
  objc_sync_exit(v4);
}

- (BOOL)isInitialMegaBackupCompleted:(id *)a3
{
  id v5 = _os_activity_create(&dword_1DD9AE000, "isInitialMegaBackupCompleted", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  id v6 = [(MBXPCClient *)self _sendRequest:@"kMBMessageIsInitialMegaBackupCompleted" arguments:0 error:a3];
  LOBYTE(a3) = [v6 BOOLValue];

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (void)saveBackupEnabledForMegaBackup
{
  id v3 = _os_activity_create(&dword_1DD9AE000, "saveBackupEnabledForMegaBackup", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  id v4 = [(MBXPCClient *)self _sendRequest:@"kMBMessageSaveBackupEnabledForMegaBackup" arguments:0];
  os_activity_scope_leave(&v5);
}

- (BOOL)wasBackupEnabledForMegaBackup:(id *)a3
{
  os_activity_scope_state_s v5 = _os_activity_create(&dword_1DD9AE000, "wasBackupEnabledForMegaBackup:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  id v6 = [(MBXPCClient *)self _sendRequest:@"kMBMessageWasBackupEnabledForMegaBackup" arguments:0 error:a3];
  LOBYTE(a3) = [v6 BOOLValue];

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (void)saveSyncSettingsEnabledForMegaBackup:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_activity_scope_state_s v5 = _os_activity_create(&dword_1DD9AE000, "saveSyncSettingsEnabledForMegaBackup:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  v9[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v7 = [(MBXPCClient *)self _sendRequest:@"kMBMessageSaveSyncSettingsEnabledForMegaBackup" arguments:v6];

  os_activity_scope_leave(&v8);
}

- (void)saveBackupDomainsEnabledForMegaBackup:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_activity_scope_state_s v5 = _os_activity_create(&dword_1DD9AE000, "saveBackupDomainsEnabledForMegaBackup:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  v9[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v7 = [(MBXPCClient *)self _sendRequest:@"kMBMessageSaveBackupDomainsEnabledForMegaBackup" arguments:v6];

  os_activity_scope_leave(&v8);
}

- (BOOL)restorePreviousSettingsEnabledForMegaBackup:(id *)a3
{
  os_activity_scope_state_s v5 = _os_activity_create(&dword_1DD9AE000, "restorePreviousSettingsForMegaBackup:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  id v6 = [(MBXPCClient *)self _sendRequest:@"kMBMessageRestorePreviousSettingsEnabledForMegaBackup" arguments:0 error:a3];
  LOBYTE(a3) = [v6 BOOLValue];

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (BOOL)requestMegaBackupExpirationDate:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_1DD9AE000, "requestMegaBackupExpirationDate:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v7, &v11);
  v12[0] = v6;
  os_activity_scope_state_s v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v9 = [(MBXPCClient *)self _sendRequest:@"kMBMessageRequestMegaBackupExpirationDate" arguments:v8 error:a4];

  LOBYTE(a4) = [v9 BOOLValue];
  os_activity_scope_leave(&v11);

  return (char)a4;
}

- (BOOL)updateMegaBackupExpirationDate:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_1DD9AE000, "updateMegaBackupExpirationDate:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v7, &v11);
  v12[0] = v6;
  os_activity_scope_state_s v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v9 = [(MBXPCClient *)self _sendRequest:@"kMBMessageUpdateMegaBackupExpirationDate" arguments:v8 error:a4];

  LOBYTE(a4) = [v9 BOOLValue];
  os_activity_scope_leave(&v11);

  return (char)a4;
}

- (BOOL)exitMegaBackupMode:(id *)a3
{
  os_activity_scope_state_s v5 = _os_activity_create(&dword_1DD9AE000, "exitMegaBackupMode", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  id v6 = [(MBXPCClient *)self _sendRequest:@"kMBMessageExitMegaBackupMode" arguments:0 error:a3];
  LOBYTE(a3) = [v6 BOOLValue];

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (BOOL)setMegaBackupTurnOniCloudBackupTelemetry:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = _os_activity_create(&dword_1DD9AE000, "setMegaBackupTurnOniCloudBackupTelemetry:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v6, &v11);
  id v7 = [NSNumber numberWithBool:v4];
  v12[0] = v7;
  os_activity_scope_state_s v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v9 = [(MBXPCClient *)self _sendRequest:@"kMBMessageSetMegaBackupTurnOniCloudBackupTelemetry" arguments:v8];

  LOBYTE(self) = [v9 BOOLValue];
  os_activity_scope_leave(&v11);

  return (char)self;
}

- (BOOL)setMegaBackupTurnOnAllAppsSyncTelemetry:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = _os_activity_create(&dword_1DD9AE000, "setMegaBackupTurnOnAllAppsSyncTelemetry:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v6, &v11);
  id v7 = [NSNumber numberWithBool:v4];
  v12[0] = v7;
  os_activity_scope_state_s v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v9 = [(MBXPCClient *)self _sendRequest:@"kMBMessageSetMegaBackupTurnOnAllAppsSyncTelemetry" arguments:v8];

  LOBYTE(self) = [v9 BOOLValue];
  os_activity_scope_leave(&v11);

  return (char)self;
}

- (BOOL)postFollowUpForDrySpellWithDuration:(double)a3 firstBackup:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  void v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = _os_activity_create(&dword_1DD9AE000, "postFollowUpForDrySpellWithDuration:firstBackup:error", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  uint64_t v10 = [NSNumber numberWithDouble:a3];
  v16[0] = v10;
  os_activity_scope_state_s v11 = [NSNumber numberWithBool:v6];
  v16[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  uint64_t v13 = [(MBXPCClient *)self _sendRequest:@"kMBMessagePostFollowUpForDrySpell" arguments:v12 error:a5];

  LOBYTE(self) = [v13 BOOLValue];
  os_activity_scope_leave(&state);

  return (char)self;
}

- (BOOL)postFollowUpForRestoreTimeoutWithError:(id *)a3
{
  os_activity_scope_state_s v5 = _os_activity_create(&dword_1DD9AE000, "postFollowUpForRestoreTimeoutWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  BOOL v6 = [(MBXPCClient *)self _sendRequest:@"kMBMessagePostFollowUpForRestoreTimeout" arguments:0 error:a3];
  LOBYTE(a3) = [v6 BOOLValue];

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (BOOL)postFollowUpForBackgroundRestoreProgress:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_1DD9AE000, "postFollowUpForBackgroundRestoreProgress:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v7, &v11);
  v12[0] = v6;
  os_activity_scope_state_s v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v9 = [(MBXPCClient *)self _sendRequest:@"kMBMessagePostFollowUpForBackgroundRestoreProgress" arguments:v8 error:a4];

  LOBYTE(a4) = [v9 BOOLValue];
  os_activity_scope_leave(&v11);

  return (char)a4;
}

- (BOOL)postFollowUpForRestoreFinishedWithError:(id *)a3 skipiCloudQuotaOffer:(BOOL)a4
{
  BOOL v4 = a4;
  v13[1] = *MEMORY[0x1E4F143B8];
  id v7 = _os_activity_create(&dword_1DD9AE000, "postFollowUpForRestoreFinishedWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v7, &v12);
  os_activity_scope_state_s v8 = [NSNumber numberWithBool:v4];
  v13[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  uint64_t v10 = [(MBXPCClient *)self _sendRequest:@"kMBMessagePostFollowUpForRestoreFinished" arguments:v9 error:a3];

  LOBYTE(a3) = [v10 BOOLValue];
  os_activity_scope_leave(&v12);

  return (char)a3;
}

- (BOOL)postFollowUpForRestoreFailedWithDomainNames:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_1DD9AE000, "postFollowUpForRestoreFailedWithDomainNames:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v7, &v12);
  if (v6)
  {
    v13[0] = v6;
    os_activity_scope_state_s v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  }
  else
  {
    os_activity_scope_state_s v8 = 0;
  }
  uint64_t v9 = [(MBXPCClient *)self _sendRequest:@"kMBMessagePostFollowUpForRestoreFailed" arguments:v8 error:a4];
  if (v6) {

  }
  char v10 = [v9 BOOLValue];
  os_activity_scope_leave(&v12);

  return v10;
}

- (BOOL)clearAllPendingFollowUpsWithError:(id *)a3
{
  os_activity_scope_state_s v5 = _os_activity_create(&dword_1DD9AE000, "clearAllPendingFollowUpsWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  id v6 = [(MBXPCClient *)self _sendRequest:@"kMBMessageClearAllPendingFollowUps" arguments:0 error:a3];
  LOBYTE(a3) = [v6 BOOLValue];

  os_activity_scope_leave(&v8);
  return (char)a3;
}

- (MBConnection)connection
{
  return (MBConnection *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConnection:(id)a3
{
}

- (BOOL)shouldSupportiTunes
{
  return self->_shouldSupportiTunes;
}

- (void)setShouldSupportiTunes:(BOOL)a3
{
  self->_shouldSupportiTunes = a3;
}

- (MBCellularDataSubscriptionMonitor)cellularDataSubscriptionMonitor
{
  return self->_cellularDataSubscriptionMonitor;
}

- (void)setCellularDataSubscriptionMonitor:(id)a3
{
}

- (OS_dispatch_group)initialBackupOnCellularSupportGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInitialBackupOnCellularSupportGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialBackupOnCellularSupportGroup, 0);
  objc_storeStrong((id *)&self->_cellularDataSubscriptionMonitor, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
}

- (void)initWithAccount:delegate:eventQueue:error:.cold.1()
{
}

- (void)fetchiCloudRestoreIsCompleteWithCompletion:.cold.1()
{
}

- (void)startRestoreForBackupUDID:snapshotID:error:.cold.1()
{
}

- (void)startRestoreForSnapshot:options:completion:.cold.1()
{
}

- (void)_restoreApplicationWithBundleID:failed:qos:context:error:.cold.1()
{
  __assert_rtn("-[MBXPCClient _restoreApplicationWithBundleID:failed:qos:context:error:]", "MBXPCClient.m", 761, "qos == nil || [qos isKindOfClass:[NSNumber class]]");
}

- (void)startDeviceTransferWithTaskType:sessionInfo:error:.cold.1()
{
  __assert_rtn("-[MBXPCClient startDeviceTransferWithTaskType:sessionInfo:error:]", "MBXPCClient.m", 1577, "taskType != MBDeviceTransferTaskTypeUnspecified");
}

- (void)startDeviceTransferWithTaskType:sessionInfo:error:.cold.2()
{
}

- (void)startDeviceTransferWithTaskType:sessionInfo:error:.cold.3()
{
}

- (void)cancelDeviceTransferWithTaskType:error:.cold.1()
{
  __assert_rtn("-[MBXPCClient cancelDeviceTransferWithTaskType:error:]", "MBXPCClient.m", 1589, "taskType != MBDeviceTransferTaskTypeUnspecified");
}

- (void)cancelDeviceTransferWithTaskType:error:.cold.2()
{
}

- (void)resumeDeviceTransferWithTaskType:error:.cold.1()
{
  __assert_rtn("-[MBXPCClient resumeDeviceTransferWithTaskType:error:]", "MBXPCClient.m", 1600, "taskType != MBDeviceTransferTaskTypeUnspecified");
}

- (void)resumeDeviceTransferWithTaskType:error:.cold.2()
{
}

- (void)startKeychainDataImportWithKeychainInfo:completionHandler:.cold.1()
{
}

- (void)startDataTransferWithPreflightInfo:completionHandler:.cold.1()
{
}

- (void)_makeConnection
{
}

@end