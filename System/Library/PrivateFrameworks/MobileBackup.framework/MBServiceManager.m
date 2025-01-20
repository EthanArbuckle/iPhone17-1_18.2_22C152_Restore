@interface MBServiceManager
+ (id)loadBackupStateInfoForInitialMegaBackup:(BOOL)a3 account:(id)a4;
+ (id)loadRestoreStateInfo;
+ (void)insufficientFreeSpaceToRestoreForAccount:(id)a3;
+ (void)saveBackupStateInfo:(id)a3 forInitialMegaBackup:(BOOL)a4 account:(id)a5;
+ (void)saveRestoreStateInfo:(id)a3;
- (BOOL)_removeDomainName:(id)a3 service:(id)a4 error:(id *)a5;
- (BOOL)_restoreBookWithPath:(id)a3 range:(_NSRange)a4 context:(id)a5 error:(id *)a6;
- (BOOL)_restoreSyncSettingsEnabledForMegaBackup:(id *)a3;
- (BOOL)_setBackupDisabledIfMissingFromAccount:(id)a3 connection:(id)a4;
- (BOOL)_shouldEnableHyperLogging;
- (BOOL)_startBackgroundRestoreWithSettingsContext:(id)a3 delegateContext:(id)a4 error:(id *)a5;
- (BOOL)acquireLockWithBackupUDID:(id)a3 account:(id)a4 owner:(id)a5 timeout:(double)a6 connection:(id)a7 error:(id *)a8;
- (BOOL)addFileToBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 fromPath:(id)a7 error:(id *)a8;
- (BOOL)allowiTunesBackup;
- (BOOL)cancelApplicationRestoreWithBundleID:(id)a3 error:(id *)a4;
- (BOOL)cancelDeviceTransferWithTaskType:(int64_t)a3 connection:(id)a4 error:(id *)a5;
- (BOOL)countCameraRollQuota;
- (BOOL)countCameraRollQuotaForBackupUDID:(id)a3 error:(id *)a4;
- (BOOL)deleteAccountWithServiceAccount:(id)a3 error:(id *)a4;
- (BOOL)deleteBackupUDID:(id)a3 disableIfCurrentDevice:(BOOL)a4 account:(id)a5 connection:(id)a6 error:(id *)a7;
- (BOOL)deleteItemFromBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 error:(id *)a7;
- (BOOL)deleteSnapshotID:(unint64_t)a3 fromBackupUDID:(id)a4 account:(id)a5 error:(id *)a6;
- (BOOL)discountCameraRollQuotaForBackupUDID:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6;
- (BOOL)discountCameraRollQuotaWithAccount:(id)a3 connection:(id)a4 error:(id *)a5;
- (BOOL)extractItemFromBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 toPath:(id)a7 account:(id)a8 connection:(id)a9 error:(id *)a10;
- (BOOL)inheritSnapshotWithAccount:(id)a3 fromSnapshot:(id)a4 fromDevice:(id)a5 error:(id *)a6;
- (BOOL)isBackupEnabledForDomainName:(id)a3 account:(id)a4;
- (BOOL)isInitialMegaBackupCompleted:(id)a3;
- (BOOL)isPrebuddyMode;
- (BOOL)mergeSnapshots:(id)a3 backupUUID:(id)a4 account:(id)a5 connection:(id)a6 error:(id *)a7;
- (BOOL)pinSnapshotID:(unint64_t)a3 backupUDID:(id)a4 account:(id)a5 connection:(id)a6 error:(id *)a7;
- (BOOL)prepareForBackgroundRestoreWithAccount:(id)a3 error:(id *)a4;
- (BOOL)releaseLockWithBackupUDID:(id)a3 account:(id)a4 owner:(id)a5 connection:(id)a6 error:(id *)a7;
- (BOOL)removeDomainName:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6;
- (BOOL)requestMegaBackupExpirationDate:(id)a3 account:(id)a4 error:(id *)a5;
- (BOOL)restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 qos:(id)a5 context:(id)a6 account:(id)a7 error:(id *)a8;
- (BOOL)restoreBookWithPath:(id)a3 context:(id)a4 account:(id)a5 error:(id *)a6;
- (BOOL)restoreDataExistsForApplicationWithBundleID:(id)a3 size:(unint64_t *)a4 account:(id)a5;
- (BOOL)restoreFileExistsWithPath:(id)a3 account:(id)a4;
- (BOOL)restoreFileWithPath:(id)a3 context:(id)a4 account:(id)a5 error:(id *)a6;
- (BOOL)restoreFilesWithPaths:(id)a3 context:(id)a4 account:(id)a5 error:(id *)a6;
- (BOOL)restorePreviousSettingsEnabledForMegaBackup:(id)a3 error:(id *)a4;
- (BOOL)resumeDeviceTransferWithTaskType:(int64_t)a3 connection:(id)a4 error:(id *)a5;
- (BOOL)saveBackgroundRestoreCellularAccess:(id)a3 account:(id)a4 error:(id *)a5;
- (BOOL)saveKeybagsForBackupUDID:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6;
- (BOOL)setupBackupWithPasscode:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6;
- (BOOL)startBackupWithOptions:(id)a3 reason:(int64_t)a4 xpcActivity:(id)a5 account:(id)a6 connection:(id)a7 error:(id *)a8;
- (BOOL)startDeviceTransferWithTaskType:(int64_t)a3 sessionInfo:(id)a4 connection:(id)a5 error:(id *)a6;
- (BOOL)startRestoreForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 account:(id)a5 connection:(id)a6 error:(id *)a7;
- (BOOL)startRestoreForSnapshot:(id)a3 options:(id)a4 account:(id)a5 connection:(id)a6 error:(id *)a7;
- (BOOL)startScanForBundleIDs:(id)a3 account:(id)a4 error:(id *)a5;
- (BOOL)startScanWithAccount:(id)a3 error:(id *)a4;
- (BOOL)unpinSnapshotID:(unint64_t)a3 backupUDID:(id)a4 account:(id)a5 connection:(id)a6 error:(id *)a7;
- (BOOL)wasBackupEnabledForMegaBackup:(id)a3;
- (MBDebugContext)debugContext;
- (MBPrebuddyFollowUpController)prebuddyFollowUpController;
- (MBServiceAccount)account;
- (MBServiceEncryptionManager)serviceEncryptionManager;
- (MBServiceLockManager)lockManager;
- (MBServiceManager)init;
- (MBServiceRestoreSession)restoreSession;
- (NSDictionary)restoreKeyBagsByID;
- (NSMutableSet)batchRestoreOps;
- (id)_deviceBackupFromCache;
- (id)_domainInfoForName:(id)a3 cache:(id)a4 appManager:(id)a5;
- (id)_restoreStateWithAccount:(id)a3;
- (id)_settingsContextForBackgroundAppRestoreWithBundleID:(id)a3 account:(id)a4 errorCode:(int)a5 delegateContext:(id)a6;
- (id)_settingsContextForBackgroundFileRestoreWithPath:(id)a3 account:(id)a4 delegateContext:(id)a5;
- (id)_settingsContextForBackupUDID:(id)a3 account:(id)a4;
- (id)_settingsContextForForegroundRestoreWithBackupUDID:(id)a3 account:(id)a4 snapshotID:(unint64_t)a5;
- (id)backgroundRestoreInfoWithAccount:(id)a3;
- (id)backupStateInfoForInitialMegaBackup:(BOOL)a3 account:(id)a4;
- (id)description;
- (id)deviceBackup;
- (id)deviceLockInfosWithAccount:(id)a3 connection:(id)a4 error:(id *)a5;
- (id)disabledDomainInfosForAccount:(id)a3;
- (id)domainInfoForName:(id)a3 account:(id)a4;
- (id)domainInfoListWithAccount:(id)a3;
- (id)fetchBackgroundRestoreCellularAccessForAccount:(id)a3 error:(id *)a4;
- (id)fetchRestorableSnapshotsForAccount:(id)a3 connection:(id)a4 error:(id *)a5;
- (id)fetchRestorableSnapshotsForAccount:(id)a3 error:(id *)a4;
- (id)filesForSnapshotID:(unint64_t)a3 backupUDID:(id)a4 account:(id)a5 connection:(id)a6 error:(id *)a7;
- (id)getAppleIDsForBackupUDID:(id)a3 account:(id)a4 snapshotID:(unint64_t)a5 activeAppleID:(id *)a6 connection:(id)a7 error:(id *)a8;
- (id)getAppleIDsMapForBackupUDID:(id)a3 account:(id)a4 snapshotID:(unint64_t)a5 activeAppleID:(id *)a6 connection:(id)a7 error:(id *)a8;
- (id)getBackupListWithFiltering:(BOOL)a3 account:(id)a4 connection:(id)a5 error:(id *)a6;
- (id)getBuddyDataStashForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 account:(id)a5 connection:(id)a6 error:(id *)a7;
- (id)journalForBackupUUID:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6;
- (id)journalLastModifiedForBackupUUID:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6;
- (id)loadRestoreStateWithAccount:(id)a3;
- (id)lockManagerWithAccount:(id)a3 backupUDID:(id)a4 type:(int)a5;
- (id)nextBackupSizeInfoWithAccount:(id)a3;
- (id)pendingSnapshotForCurrentDeviceAndAccount:(id)a3 error:(id *)a4;
- (id)reservedBackupSizeListWithAccount:(id)a3 connection:(id)a4 error:(id *)a5;
- (id)restoreFilesForDomain:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 range:(_NSRange)a6 account:(id)a7 error:(id *)a8;
- (id)restoreStateWithError:(id *)a3;
- (id)synchronizeFileListsWithDeviceUUID:(id)a3 commitID:(id)a4 account:(id)a5 error:(id *)a6;
- (int)serviceState;
- (unint64_t)nextBackupSizeWithAccount:(id)a3;
- (void)_alertUserOfIncompleteRestore;
- (void)_cancelAllBackgroundRestoreEngines;
- (void)_cleanupStaleStateWithAccount:(id)a3;
- (void)_clearDeferredDiscountingCameraRollQuota;
- (void)_clearMegaBackupTelemetries;
- (void)_clearPreferencesForRestoringSettingsEnabledForMegaBackup;
- (void)_clearRestoreSession;
- (void)_deferDiscountingCameraRollQuota;
- (void)_disableHyperLogging;
- (void)_disableKeychainSync:(id)a3;
- (void)_enableBackgroundHyperLogging;
- (void)_enableForegroundHyperLogging;
- (void)_finishRestore:(BOOL)a3;
- (void)_finishedRestore;
- (void)_notifyDisplayWifi;
- (void)_notifyRestoreCompleted;
- (void)_obliterating;
- (void)_performToolWithBackupUDID:(id)a3 account:(id)a4 snapshotID:(unint64_t)a5 block:(id)a6;
- (void)_prepareForBackgroundRestore;
- (void)_restoreBackupDomainsEnabledForMegaBackup:(id)a3;
- (void)_restoreBackupEnabledForMegaBackup:(id)a3;
- (void)_runRestoreWithSettingsContext:(id)a3 delegateContext:(id)a4;
- (void)_stopTrackingCoordinatorWithBundleID:(id)a3 success:(BOOL)a4 account:(id)a5;
- (void)_updateLockdownKeysForAccountState:(id)a3;
- (void)_updateProgressForCoordinatorWithBundleID:(id)a3 progress:(double)a4 account:(id)a5;
- (void)accountChanged:(id)a3;
- (void)beginPrebuddyBackupWithAccount:(id)a3 connection:(id)a4 fromManualSignal:(BOOL)a5;
- (void)boostBackgroundRestoreWithAccount:(id)a3 completionHandler:(id)a4;
- (void)cancelBackgroundRestoreWithAccount:(id)a3;
- (void)cancelBackupEngineWithError:(id)a3 connection:(id)a4;
- (void)cancelEnginesWithAccount:(id)a3 connection:(id)a4;
- (void)cancelRestore;
- (void)cancelRestoreEnginesWithReason:(int64_t)a3 connection:(id)a4;
- (void)clearPrebuddyWithAccount:(id)a3 accountSignOut:(BOOL)a4;
- (void)clearRestoreSessionWithAccount:(id)a3;
- (void)dealloc;
- (void)exitMegaBackupModeWithAccount:(id)a3;
- (void)finishAirTrafficRestoreWithAccount:(id)a3;
- (void)finishRestore;
- (void)keyBagIsLocking;
- (void)keyBagIsUnlocked;
- (void)lockManager:(id)a3 failedToReleaseLockWithError:(id)a4;
- (void)lockManagerDidReleaseLock:(id)a3;
- (void)postFollowUpForRestoreFailedForAccount:(id)a3 failedDomainNames:(id)a4;
- (void)prebuddyBackupDeletedWithAccount:(id)a3;
- (void)prioritizeRestoreFileWithPath:(id)a3 account:(id)a4;
- (void)reachabilityMonitorDidDetectWifiStatusChange:(BOOL)a3;
- (void)repair;
- (void)saveBackupDomainsEnabledForMegaBackup:(id)a3;
- (void)saveBackupEnabledForMegaBackup;
- (void)saveSyncSettingsEnabledForMegaBackup:(id)a3;
- (void)serviceDidHoldLock:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAllowiTunesBackup:(BOOL)a3;
- (void)setBackupEnabled:(BOOL)a3 account:(id)a4 connection:(id)a5;
- (void)setBackupEnabled:(BOOL)a3 forDomainName:(id)a4 account:(id)a5;
- (void)setBatchRestoreOps:(id)a3;
- (void)setDebugContext:(id)a3;
- (void)setLockManager:(id)a3;
- (void)setPrebuddyFollowUpController:(id)a3;
- (void)setPrebuddyMode:(BOOL)a3;
- (void)setRestoreQualityOfService:(int64_t)a3 account:(id)a4 connection:(id)a5;
- (void)setRestoreSessionWithBackupUDID:(id)a3 snapshotUUID:(id)a4 account:(id)a5 connection:(id)a6;
- (void)setServiceDelegate:(id)a3;
- (void)signalPrebuddy:(id)a3 account:(id)a4;
- (void)startDataTransferWithPreflightInfo:(id)a3 connection:(id)a4 completion:(id)a5;
- (void)startKeychainDataImportWithKeychainInfo:(id)a3 connection:(id)a4 completion:(id)a5;
- (void)startKeychainDataTransferWithConnection:(id)a3 completion:(id)a4;
- (void)startKeychainTransferWithConnection:(id)a3 completion:(id)a4;
- (void)startPreflightWithConnection:(id)a3 completion:(id)a4;
- (void)submitMegaLifeCycleTelemetriesWithAccount:(id)a3;
- (void)syncBackupEnabledWithAccount:(id)a3 connection:(id)a4;
- (void)updateMegaBackupExpirationDate:(id)a3 account:(id)a4;
- (void)updatePrebuddyFollowUp:(id)a3;
@end

@implementation MBServiceManager

- (MBServiceManager)init
{
  v44.receiver = self;
  v44.super_class = (Class)MBServiceManager;
  v2 = (MBServiceManager *)[(MBServiceManager *)&v44 _init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    engines = v2->_engines;
    v2->_engines = v3;

    v5 = (NSMapTable *)objc_alloc_init((Class)NSMapTable);
    enginesByContext = v2->_enginesByContext;
    v2->_enginesByContext = v5;

    uint64_t v7 = +[NSMapTable weakToStrongObjectsMapTable];
    restoreQosByContext = v2->_restoreQosByContext;
    v2->_restoreQosByContext = (NSMapTable *)v7;

    atomic_store(0, (unsigned __int8 *)&v2->_appDataDidFinishRestore);
    v9 = (objc_class *)objc_opt_class();
    Name = class_getName(v9);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(Name, v11);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v12;

    dispatch_group_t v14 = dispatch_group_create();
    serviceGroup = v2->_serviceGroup;
    v2->_serviceGroup = (OS_dispatch_group *)v14;

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.MobileBackup.user-notification-queue", 0);
    userNotificationQueue = v2->_userNotificationQueue;
    v2->_userNotificationQueue = (OS_dispatch_queue *)v16;

    v18 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    batchRestoreOps = v2->_batchRestoreOps;
    v2->_batchRestoreOps = v18;

    uint64_t v20 = objc_opt_new();
    personaState = v2->_personaState;
    v2->_personaState = (_TtC7backupd21MBPersonaStateManager *)v20;

    v22 = [MBServiceAccount alloc];
    v23 = +[UMUserPersona currentPersona];
    id v43 = 0;
    v24 = [(MBServiceAccount *)v22 initWithPersona:v23 error:&v43];
    id v25 = v43;
    account = v2->_account;
    v2->_account = v24;

    v27 = v2->_account;
    if (!v27)
    {
      v28 = MBGetDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v46 = v25;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to resolve the account for the current persona: %@", buf, 0xCu);
        id v40 = v25;
        _MBLog();
      }

      v27 = v2->_account;
    }
    buf[0] = 0;
    v29 = [(MBServiceAccount *)v27 persona];
    unsigned int v30 = [v29 getBooleanValueForKey:@"AirTrafficFinishedRestoring" keyExists:buf];

    if (buf[0]) {
      BOOL v31 = v30 == 0;
    }
    else {
      BOOL v31 = 1;
    }
    unsigned __int8 v32 = !v31;
    atomic_store(v32, (unsigned __int8 *)&v2->_airTrafficDidFinishRestore);
    v33 = v2->_stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100187434;
    block[3] = &unk_100411128;
    v34 = v2;
    v42 = v34;
    dispatch_sync(v33, block);
    if (v2->_account)
    {
      -[MBServiceManager backupStateInfoForInitialMegaBackup:account:](v34, "backupStateInfoForInitialMegaBackup:account:", 1);
      id v35 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v35 = [objc_alloc((Class)MBStateInfo) initWithState:0 progress:0 estimatedTimeRemaining:0 error:0 errors:0.0];
    }
    v36 = v35;
    v37 = [[MBPrebuddyFollowUpController alloc] initWithBackupState:v35];
    prebuddyFollowUpController = v34->_prebuddyFollowUpController;
    v34->_prebuddyFollowUpController = v37;
  }
  return v2;
}

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_lowDiskSource);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobile.data_eschaton", 0);
  userNotificationQueue = self->_userNotificationQueue;
  if (userNotificationQueue)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100187734;
    block[3] = &unk_100411128;
    void block[4] = self;
    dispatch_async(userNotificationQueue, block);
    dispatch_sync((dispatch_queue_t)self->_userNotificationQueue, &stru_100414FA0);
  }
  notify_cancel(self->_obliterateToken);
  v5.receiver = self;
  v5.super_class = (Class)MBServiceManager;
  [(MBServiceManager *)&v5 dealloc];
}

- (void)setServiceDelegate:(id)a3
{
  id v4 = a3;
  if (v4
    && (![v4 conformsToProtocol:&OBJC_PROTOCOL___MBServiceManagerDelegate]
     || ([v4 conformsToProtocol:&OBJC_PROTOCOL___MBManagerDelegate] & 1) == 0))
  {
    __assert_rtn("-[MBServiceManager setServiceDelegate:]", "MBServiceManager.m", 309, "!delegate || ([delegate conformsToProtocol:@protocol(MBServiceManagerDelegate)] && [delegate conformsToProtocol:@protocol(MBManagerDelegate)])");
  }
  [(MBServiceManager *)self setDelegate:v4];
}

- (MBServiceEncryptionManager)serviceEncryptionManager
{
  serviceEncryptionManager = self->_serviceEncryptionManager;
  if (serviceEncryptionManager)
  {
    v3 = serviceEncryptionManager;
  }
  else
  {
    objc_super v5 = [MBServiceAccount alloc];
    v6 = +[UMUserPersona currentPersona];
    id v19 = 0;
    uint64_t v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v19];
    id v8 = v19;

    if (!v7)
    {
      v15 = +[NSAssertionHandler currentHandler];
      dispatch_queue_t v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[MBServiceManager serviceEncryptionManager]");
      [v15 handleFailureInFunction:v16, @"MBServiceManager.m", 318, @"nil account: %@", v8 file lineNumber description];
    }
    v9 = MBDeviceUDID_Legacy();
    v10 = [(MBServiceManager *)self _settingsContextForBackupUDID:v9 account:v7];

    v11 = [[MBServiceEncryptionManager alloc] initWithSettingsContext:v10];
    dispatch_queue_t v12 = self->_serviceEncryptionManager;
    self->_serviceEncryptionManager = v11;

    v13 = self->_serviceEncryptionManager;
    if (!v13)
    {
      v17 = +[NSAssertionHandler currentHandler];
      v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[MBServiceManager serviceEncryptionManager]");
      [v17 handleFailureInFunction:v18, @"MBServiceManager.m", 321, @"nil encryption manager: %@", v8 file lineNumber description];

      v13 = self->_serviceEncryptionManager;
    }
    v3 = v13;
  }
  return v3;
}

- (id)lockManagerWithAccount:(id)a3 backupUDID:(id)a4 type:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Using MBS lock manager", v13, 2u);
    _MBLog();
  }

  v11 = [[MBServiceLockManager alloc] initWithAccount:v9 backupUDID:v8 type:v5 delegate:self];
  return v11;
}

- (MBServiceLockManager)lockManager
{
  lockManager = self->_lockManager;
  if (lockManager)
  {
    v3 = lockManager;
  }
  else
  {
    uint64_t v5 = [(MBServiceManager *)self account];
    v6 = [v5 reloaded];
    uint64_t v7 = [(MBServiceRestoreSession *)self->_restoreSession backupUDID];
    v3 = [(MBServiceManager *)self lockManagerWithAccount:v6 backupUDID:v7 type:1];
  }
  return v3;
}

- (MBServiceAccount)account
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_account)
  {
    v3 = [MBServiceAccount alloc];
    id v4 = +[UMUserPersona currentPersona];
    id v11 = 0;
    uint64_t v5 = [(MBServiceAccount *)v3 initWithPersona:v4 error:&v11];
    id v6 = v11;
    account = v2->_account;
    v2->_account = v5;

    if (!v2->_account)
    {
      id v8 = MBGetDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "(MBS) Failed to fetch account: %@", buf, 0xCu);
        _MBLog();
      }
    }
  }
  objc_sync_exit(v2);

  id v9 = v2->_account;
  return v9;
}

+ (id)loadRestoreStateInfo
{
  v2 = (void *)CFPreferencesCopyValue(@"RestoreStateInfo", @"com.apple.MobileBackup", kMBMobileUserName, kCFPreferencesAnyHost);
  if (!v2) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v2 = 0;
LABEL_8:
    id v3 = 0;
    goto LABEL_9;
  }
  id v3 = [objc_alloc((Class)MBStateInfo) initWithDictionaryRepresentation:v2];
  if (v3)
  {
    id v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [v3 dictionaryRepresentation];
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Loaded restore state: %@", buf, 0xCu);

      uint64_t v7 = [v3 dictionaryRepresentation];
      _MBLog();
    }
  }
LABEL_9:

  return v3;
}

+ (void)saveRestoreStateInfo:(id)a3
{
  if (a3)
  {
    id v3 = [a3 dictionaryRepresentation];
    CFStringRef v4 = (const __CFString *)kMBMobileUserName;
    CFPreferencesSetValue(@"RestoreStateInfo", v3, @"com.apple.MobileBackup", kMBMobileUserName, kCFPreferencesAnyHost);
    int v5 = CFPreferencesSynchronize(@"com.apple.MobileBackup", v4, kCFPreferencesAnyHost);
    id v6 = MBGetDefaultLog();
    uint64_t v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v9 = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Saved restore state: %@", buf, 0xCu);
LABEL_7:
        _MBLog();
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v9 = @"com.apple.MobileBackup";
      __int16 v10 = 2112;
      CFStringRef v11 = @"RestoreStateInfo";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to sync preferences for %@ domain (%@)", buf, 0x16u);
      goto LABEL_7;
    }
  }
}

- (id)loadRestoreStateWithAccount:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  id v6 = [(MBPersonaStateManager *)self->_personaState objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 restore];

  if (v7)
  {
    id v8 = [v6 restore];
    id v9 = [v8 copy];

    goto LABEL_42;
  }
  __int16 v10 = +[MBServiceRestoreSession currentRestoreSessionWithAccount:v5];
  restoreSession = self->_restoreSession;
  self->_restoreSession = v10;

  if (self->_restoreSession)
  {
    dispatch_queue_t v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = self->_restoreSession;
      *(_DWORD *)buf = 138412290;
      v56 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Loaded restore session: %@", buf, 0xCu);
      id v46 = self->_restoreSession;
      _MBLog();
    }
  }
  id v14 = [(id)objc_opt_class() loadRestoreStateInfo];
  v15 = self->_restoreSession;
  if (!v15)
  {
    if (v14)
    {
      if ([v14 isBackground]
        && [v14 state] != 4
        && [v14 state] != 6)
      {
        [v14 setState:4];
        [v14 setIsBackground:1];
        LODWORD(v19) = 1.0;
        [v14 setProgress:v19];
        [v14 setEstimatedTimeRemaining:0];
        [(id)objc_opt_class() saveRestoreStateInfo:v14];
      }
    }
    else
    {
      id v14 = [objc_alloc((Class)MBStateInfo) initWithState:0 progress:0 estimatedTimeRemaining:0 error:0 errors:0.0];
    }
    objc_msgSend(v6, "setRestore:", v14, v46);
    goto LABEL_40;
  }
  unsigned int v16 = [(MBServiceRestoreSession *)v15 isFinishing];
  if (v16) {
    int v17 = 6;
  }
  else {
    int v17 = 5;
  }
  if (v16) {
    uint64_t v18 = 3;
  }
  else {
    uint64_t v18 = 2;
  }
  self->_serviceState = v17;
  [v6 setServiceState:v46];
  if (!v14)
  {
    id v14 = [objc_alloc((Class)MBStateInfo) initWithState:v18 progress:0 estimatedTimeRemaining:0 error:0 errors:0.0];
    [v14 setIsBackground:1];
    if (!v14) {
      __assert_rtn("-[MBServiceManager loadRestoreStateWithAccount:]", "MBServiceManager.m", 398, "restoreState");
    }
    goto LABEL_25;
  }
  if (![v14 isBackground] || objc_msgSend(v14, "state") != v18)
  {
    [v14 setState:v18];
    [v14 setIsBackground:1];
LABEL_25:
    [v6 setRestore:v14];
    [(id)objc_opt_class() saveRestoreStateInfo:v14];
    goto LABEL_26;
  }
  [v6 setRestore:v14];
LABEL_26:
  uint64_t v20 = objc_alloc_init(MBServiceReachabilityMonitor);
  reachabilityMonitor = self->_reachabilityMonitor;
  self->_reachabilityMonitor = v20;

  objc_initWeak(&location, self);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1001887E8;
  v52[3] = &unk_100414FC8;
  objc_copyWeak(&v53, &location);
  [(MBServiceReachabilityMonitor *)self->_reachabilityMonitor setWifiStatusChangedCallback:v52];
  [(MBServiceReachabilityMonitor *)self->_reachabilityMonitor setMonitoring:1];
  if ([(MBServiceRestoreSession *)self->_restoreSession isFinishing])
  {
    v22 = [(MBServiceManager *)self lockManager];
    [v22 releaseLockAsync];
  }
  else
  {
    v22 = [(MBServiceManager *)self lockManager];
    [v22 startRenewingLock];
  }

  v23 = [(MBServiceManager *)self serviceEncryptionManager];
  id v51 = 0;
  v24 = [v23 loadRestoreKeyBagsByIDWithError:&v51];
  id v25 = (MBServiceRestoreSession *)v51;
  restoreKeyBagsByID = self->_restoreKeyBagsByID;
  self->_restoreKeyBagsByID = v24;

  if (!self->_restoreKeyBagsByID)
  {
    v27 = MBGetDefaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v25;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to load restore keybags while loading restore session: %@", buf, 0xCu);
      v47 = v25;
      _MBLog();
    }

    v28 = [(MBServiceManager *)self account];
    v29 = [v28 persona];
    [v29 setPreferencesValue:&__kCFBooleanTrue forKey:@"NotifyDaemonNextTimeKeyBagIsUnlocked"];
  }
  [(MBServiceManager *)self _notifyRestoreCompleted];
  unsigned int v30 = [(MBServiceRestoreSession *)self->_restoreSession startDate];
  BOOL v31 = [v30 dateByAddingTimeInterval:1209600.0];

  unsigned __int8 v32 = MBGetDefaultLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    v33 = v32;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      MBStringWithDate();
      v34 = (MBServiceRestoreSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v56 = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Restore will time out on %@", buf, 0xCu);
    }
    v48 = MBStringWithDate();
    _MBLog();
  }
  [v31 timeIntervalSinceReferenceDate];
  CFAbsoluteTime v36 = v35;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100188838;
  block[3] = &unk_100414FF0;
  void block[4] = self;
  id v50 = v5;
  self->_warnTimerRef = CFRunLoopTimerCreateWithHandler(0, v36, 86400.0, 0, 0, block);
  Main = CFRunLoopGetMain();
  CFRunLoopAddTimer(Main, self->_warnTimerRef, kCFRunLoopCommonModes);
  v38 = +[MBDaemon sharedDaemon];
  [v38 holdWorkAssertion:a2];

  objc_destroyWeak(&v53);
  objc_destroyWeak(&location);
LABEL_40:
  v39 = objc_msgSend(v6, "restore", v48);
  if (!v39) {
    __assert_rtn("-[MBServiceManager loadRestoreStateWithAccount:]", "MBServiceManager.m", 467, "personaState.restore");
  }

  id v40 = +[MBNotificationCenter sharedNotificationCenter];
  v41 = [(MBPersonaStateManager *)self->_personaState objectForKeyedSubscript:v5];
  v42 = [v41 restore];
  unsigned int v43 = [v42 state];
  [v40 postNotification:kMBManagerRestoreStateChangedNotification ifStateChanged:v43];

  objc_super v44 = [v6 restore];
  id v9 = [v44 copy];

LABEL_42:
  return v9;
}

- (id)synchronizeFileListsWithDeviceUUID:(id)a3 commitID:(id)a4 account:(id)a5 error:(id *)a6
{
  return 0;
}

- (void)_clearRestoreSession
{
  id v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Clearing restore session", buf, 2u);
    _MBLog();
  }

  restoreSession = self->_restoreSession;
  self->_restoreSession = 0;

  id v5 = [(MBServiceManager *)self serviceEncryptionManager];
  id v18 = 0;
  unsigned __int8 v6 = [v5 removeRestoreKeyBagsWithError:&v18];
  id v7 = v18;

  if ((v6 & 1) == 0)
  {
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = +[MBError descriptionForError:v7];
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Error removing restore keybag: %@", buf, 0xCu);

      int v17 = +[MBError descriptionForError:v7];
      _MBLog();
    }
    id v7 = 0;
  }
  restoreKeyBagsByID = self->_restoreKeyBagsByID;
  self->_restoreKeyBagsByID = 0;

  CFStringRef v11 = [(MBServiceManager *)self account];
  +[MBServiceRestoreSession clearCurrentRestoreSessionWithAccount:v11];

  dispatch_queue_t v12 = +[MBUserNotificationManager sharedManager];
  id v13 = [(MBServiceManager *)self account];
  [v12 cancelNotificationWithIdentifier:@"WarnRestoreTimedOut" account:v13];

  id v14 = +[MBUserNotificationManager sharedManager];
  v15 = [(MBServiceManager *)self account];
  [v14 clearDidInformUserWithNotificationIdentifier:@"DidFinishRestore" account:v15];

  restoreTransaction = self->_restoreTransaction;
  self->_restoreTransaction = 0;
}

+ (id)loadBackupStateInfoForInitialMegaBackup:(BOOL)a3 account:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  if (!v5) {
    __assert_rtn("+[MBServiceManager loadBackupStateInfoForInitialMegaBackup:account:]", "MBServiceManager.m", 504, "account");
  }
  unsigned __int8 v6 = v5;
  id v7 = [v5 persona];
  if (v4) {
    CFStringRef v8 = @"InitialMegaBackupInfo";
  }
  else {
    CFStringRef v8 = @"BackupStateInfo";
  }
  id v9 = [v7 copyPreferencesValueForKey:v8 class:objc_opt_class()];

  if (v9)
  {
    id v10 = [objc_alloc((Class)MBStateInfo) initWithDictionaryRepresentation:v9];
    if (v10)
    {
      CFStringRef v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        dispatch_queue_t v12 = [v10 dictionaryRepresentation];
        *(_DWORD *)buf = 138412290;
        unsigned int v16 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Loaded backup state: %@", buf, 0xCu);

        id v14 = [v10 dictionaryRepresentation];
        _MBLog();
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (void)saveBackupStateInfo:(id)a3 forInitialMegaBackup:(BOOL)a4 account:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if (!v8) {
    __assert_rtn("+[MBServiceManager saveBackupStateInfo:forInitialMegaBackup:account:]", "MBServiceManager.m", 513, "account");
  }
  id v9 = v8;
  if (v7)
  {
    id v10 = [v7 dictionaryRepresentation];
    CFStringRef v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_t v12 = [v9 accountIdentifier];
      *(_DWORD *)buf = 138543618;
      double v19 = v12;
      __int16 v20 = 2112;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Saving backup state for account %{public}@: %@", buf, 0x16u);

      unsigned int v16 = [v9 accountIdentifier];
      int v17 = v10;
      _MBLog();
    }
    id v13 = [v9 persona];
    id v14 = v13;
    if (v6) {
      CFStringRef v15 = @"InitialMegaBackupInfo";
    }
    else {
      CFStringRef v15 = @"BackupStateInfo";
    }
    objc_msgSend(v13, "setPreferencesValue:forKey:", v10, v15, v16, v17);
  }
}

- (void)_cleanupStaleStateWithAccount:(id)a3
{
  id v41 = a3;
  if (MBAcquireRestoreLock())
  {
    BOOL v4 = +[MBLockdown buddySetupState];
    if ([v4 isEqualToString:@"RestoringFromBackup"])
    {
      id v5 = +[MBLockdown connect];
      BOOL v6 = MBGetDefaultLog();
      id v7 = v4;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v56 = @"RestoringFromBackup";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cleanup: Clearing stale lockdown state %@", buf, 0xCu);
        CFStringRef v35 = @"RestoringFromBackup";
        _MBLog();
      }

      id v54 = 0;
      unsigned __int8 v8 = [v5 removeObjectWithDomain:@"com.apple.purplebuddy" andKey:@"SetupState" withError:&v54];
      id v9 = v54;
      if ((v8 & 1) == 0)
      {
        id v10 = MBGetDefaultLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v56 = @"RestoringFromBackup";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Cleanup: Failed to clear lockdown state %@", buf, 0xCu);
          CFStringRef v35 = @"RestoringFromBackup";
          _MBLog();
        }
      }
      id v53 = v9;
      unsigned __int8 v11 = objc_msgSend(v5, "removeObjectWithDomain:andKey:withError:", @"com.apple.purplebuddy", @"RestoreState", &v53, v35);
      id v12 = v53;

      if ((v11 & 1) == 0)
      {
        id v13 = MBGetDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v56 = @"RestoringFromBackup";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Cleanup: Failed to clear lockdown state %@", buf, 0xCu);
          CFStringRef v35 = @"RestoringFromBackup";
          _MBLog();
        }
      }
      [v5 disconnect];

      BOOL v4 = v7;
    }
    if (v4 && ([v4 isEqualToString:@"RestoringFromBackup"] & 1) == 0)
    {
      id v14 = [v41 persona];
      CFStringRef v15 = v14;
      v39 = v4;
      if (v14)
      {
        id v40 = v14;
      }
      else
      {
        id v40 = +[MBPersona personalPersonaWithError:0];
      }

      id v17 = [objc_alloc((Class)NSMutableArray) initWithCapacity:3];
      if (v40)
      {
        id v18 = [v40 userIncompleteRestoreDirectory];
        [v17 addObject:v18];

        double v19 = [v40 sharedIncompleteRestoreDirectory];
        [v17 addObject:v19];
      }
      if (v41)
      {
        __int16 v20 = [(MBServiceManager *)self _settingsContextForForegroundRestoreWithBackupUDID:0 account:v41 snapshotID:0];
        v21 = [v20 chunkStorePath];

        [v17 addObject:v21];
      }
      v22 = +[NSFileManager defaultManager];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id obj = v17;
      id v23 = [obj countByEnumeratingWithState:&v49 objects:v61 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v50;
        do
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v50 != v24) {
              objc_enumerationMutation(obj);
            }
            CFStringRef v26 = *(const __CFString **)(*((void *)&v49 + 1) + 8 * i);
            if (objc_msgSend(v22, "fileExistsAtPath:isDirectory:", v26, 0, v36, v37, v38))
            {
              id v48 = 0;
              v27 = +[MBTemporaryDirectory temporaryDirectoryOnSameVolumeAsPath:v26 identifiedBy:@"restore-cleanup" error:&v48];
              v28 = v48;
              if (v27)
              {
                v29 = [v27 makeTemporaryFilePath];
                v47 = v28;
                unsigned __int8 v30 = [v22 moveItemAtPath:v26 toPath:v29 error:&v47];
                BOOL v31 = v47;

                if (v30)
                {
                  unsigned __int8 v32 = +[MBDaemon sharedDaemon];
                  [v32 holdWorkAssertion:a2];

                  v33 = dispatch_get_global_queue(17, 0);
                  block[0] = _NSConcreteStackBlock;
                  block[1] = 3221225472;
                  block[2] = sub_100189798;
                  block[3] = &unk_100412A88;
                  v45 = v27;
                  SEL v46 = a2;
                  dispatch_async(v33, block);

                  v34 = v45;
                }
                else
                {
                  v34 = MBGetDefaultLog();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412802;
                    CFStringRef v56 = v26;
                    __int16 v57 = 2112;
                    v58 = v29;
                    __int16 v59 = 2112;
                    v60 = v31;
                    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Cleanup: Unable to move %@ to cleanup dir at %@, %@", buf, 0x20u);
                    v37 = v29;
                    v38 = v31;
                    CFStringRef v36 = v26;
                    _MBLog();
                  }
                }

                v28 = v31;
              }
              else
              {
                v29 = MBGetDefaultLog();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  CFStringRef v56 = v26;
                  __int16 v57 = 2112;
                  v58 = v28;
                  _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Cleanup: Unable to create cleanup dir on the same volume as %@, %@", buf, 0x16u);
                  CFStringRef v36 = v26;
                  v37 = v28;
                  _MBLog();
                }
              }
            }
          }
          id v23 = [obj countByEnumeratingWithState:&v49 objects:v61 count:16];
        }
        while (v23);
      }

      BOOL v4 = v39;
    }

    MBReleaseRestoreLock();
  }
  else
  {
    unsigned int v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Cleanup: Unable to acquire the MBS restore lock - skipping cleaning stale MBS restore state", buf, 2u);
      _MBLog();
    }
  }
}

- (void)setRestoreSessionWithBackupUDID:(id)a3 snapshotUUID:(id)a4 account:(id)a5 connection:(id)a6
{
}

- (BOOL)setupBackupWithPasscode:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6
{
  if (a6)
  {
    *a6 = +[MBError errorWithCode:203, @"MBS backups are disabled. Refusing to run a backup with this manager.", a5 format];
  }
  return 0;
}

- (BOOL)saveKeybagsForBackupUDID:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6
{
  return 0;
}

- (id)getAppleIDsMapForBackupUDID:(id)a3 account:(id)a4 snapshotID:(unint64_t)a5 activeAppleID:(id *)a6 connection:(id)a7 error:(id *)a8
{
  return 0;
}

- (BOOL)mergeSnapshots:(id)a3 backupUUID:(id)a4 account:(id)a5 connection:(id)a6 error:(id *)a7
{
  return 0;
}

- (BOOL)pinSnapshotID:(unint64_t)a3 backupUDID:(id)a4 account:(id)a5 connection:(id)a6 error:(id *)a7
{
  return 0;
}

- (BOOL)unpinSnapshotID:(unint64_t)a3 backupUDID:(id)a4 account:(id)a5 connection:(id)a6 error:(id *)a7
{
  return 0;
}

- (id)journalForBackupUUID:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6
{
  return 0;
}

- (id)journalLastModifiedForBackupUUID:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6
{
  return 0;
}

- (id)reservedBackupSizeListWithAccount:(id)a3 connection:(id)a4 error:(id *)a5
{
  return 0;
}

- (void)setRestoreQualityOfService:(int64_t)a3 account:(id)a4 connection:(id)a5
{
}

- (BOOL)saveBackgroundRestoreCellularAccess:(id)a3 account:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)fetchBackgroundRestoreCellularAccessForAccount:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)fetchRestorableSnapshotsForAccount:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)fetchRestorableSnapshotsForAccount:(id)a3 connection:(id)a4 error:(id *)a5
{
  return 0;
}

- (void)setBackupEnabled:(BOOL)a3 account:(id)a4 connection:(id)a5
{
}

- (BOOL)_setBackupDisabledIfMissingFromAccount:(id)a3 connection:(id)a4
{
  id v5 = a3;
  BOOL v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Double-checking that the backup for this device is missing from the account before disabling backup", buf, 2u);
    _MBLog();
  }

  id v7 = [[MBService alloc] initWithAccount:v5];
  id v19 = 0;
  unsigned __int8 v8 = [(MBService *)v7 accountWithError:&v19];
  id v9 = v19;

  if (!v8)
  {
    unsigned int v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Error getting account from service to see if backup was deleted: %@", buf, 0xCu);
      _MBLog();
    }

    goto LABEL_11;
  }
  id v10 = [v8 backupUDIDs];
  unsigned __int8 v11 = MBDeviceUDID_Legacy();
  id v12 = MBDataWithString();
  unsigned int v13 = [v10 containsObject:v12];

  id v14 = MBGetDefaultLog();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not disabling backup after getting the backup failed with a 404 Not Found because a backup for this device was found in the account", buf, 2u);
      _MBLog();
    }

LABEL_11:
    BOOL v17 = 0;
    goto LABEL_15;
  }
  if (v15)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Disabling backup because the backup for this device was deleted", buf, 2u);
    _MBLog();
  }

  [(MBServiceManager *)self setBackupEnabled:0 account:v5 connection:0];
  BOOL v17 = 1;
LABEL_15:

  return v17;
}

- (void)_updateLockdownKeysForAccountState:(id)a3
{
  id v3 = a3;
  unsigned __int8 v18 = 0;
  BOOL v4 = [v3 persona];
  unsigned int v5 = [v4 getBooleanValueForKey:@"AllowiTunesBackup" keyExists:&v18];

  int v6 = v18;
  id v7 = [v3 isEnabled];
  if (v6 && v5)
  {
    unsigned __int8 v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Clearing cloud backup lockdown key because the iTunes backup pref is set", buf, 2u);
      _MBLog();
    }

    id v7 = 0;
  }
  id v9 = +[MBLockdown connect];
  id v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    unsigned int v11 = [v3 isEnabled];
    *(_DWORD *)buf = 67109120;
    LODWORD(v20) = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Setting cloud backup lockdown key to %d", buf, 8u);
    unint64_t v16 = [v3 isEnabled];
    _MBLog();
  }

  id v12 = +[NSNumber numberWithBool:v7];
  id v17 = 0;
  unsigned __int8 v13 = [v9 setObject:v12 forDomain:@"com.apple.mobile.backup" andKey:@"CloudBackupEnabled" withError:&v17];
  id v14 = v17;

  if ((v13 & 1) == 0)
  {
    BOOL v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error setting lockdown cloud backup enabled key: %@", buf, 0xCu);
      unint64_t v16 = (unint64_t)v14;
      _MBLog();
    }
  }
  objc_msgSend(v9, "disconnect", v16);
}

- (void)keyBagIsLocking
{
  BOOL v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Keybag is locking", buf, 2u);
    _MBLog();
  }

  stateQueue = self->_stateQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10018A148;
  v6[3] = &unk_100412A88;
  v6[4] = self;
  v6[5] = a2;
  dispatch_async(stateQueue, v6);
}

- (void)keyBagIsUnlocked
{
  BOOL v4 = (void *)os_transaction_create();
  unsigned int v5 = [(MBServiceManager *)self serviceEncryptionManager];
  int v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Keybag is unlocked", buf, 2u);
    _MBLog();
  }

  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018A528;
  block[3] = &unk_100411358;
  void block[4] = self;
  id v8 = v5;
  id v26 = v8;
  id v9 = v4;
  id v27 = v9;
  dispatch_async(stateQueue, block);
  id v10 = self;
  unsigned int v11 = +[MBDaemon sharedDaemon];
  [v11 holdWorkAssertion:a2];

  id v12 = dispatch_get_global_queue(17, 0);
  unsigned __int8 v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  id v20 = sub_10018A6E8;
  id v21 = &unk_100412AB0;
  id v23 = v9;
  SEL v24 = a2;
  id v22 = v8;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v12, &v18);

  BOOL v15 = [(MBServiceManager *)self account];
  unint64_t v16 = [v15 persona];
  [v16 setPreferencesValue:&__kCFBooleanFalse forKey:@"NotifyDaemonNextTimeKeyBagIsUnlocked"];

  id v17 = self;
}

- (void)syncBackupEnabledWithAccount:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Syncing backup enabled", buf, 2u);
    _MBLog();
  }

  id v10 = [[MBService alloc] initWithAccount:v7];
  if (v10)
  {
    unsigned int v11 = +[MBDaemon sharedDaemon];
    [v11 holdWorkAssertion:a2];

    id v12 = dispatch_get_global_queue(17, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10018A920;
    block[3] = &unk_100412AD8;
    BOOL v15 = v10;
    unint64_t v16 = self;
    id v17 = v7;
    id v18 = v8;
    SEL v19 = a2;
    dispatch_async(v12, block);

    p_super = &v15->super;
  }
  else
  {
    p_super = MBGetDefaultLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_INFO, "Ignoring request to sync backup enabled without account", buf, 2u);
      _MBLog();
    }
  }
}

- (BOOL)deleteAccountWithServiceAccount:(id)a3 error:(id *)a4
{
  id v5 = a3;
  int v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Deleting account", v10, 2u);
    _MBLog();
  }

  id v7 = [[MBService alloc] initWithAccount:v5];
  if (v7)
  {
    unsigned __int8 v8 = [(MBService *)v7 deleteAccountWithError:a4];
  }
  else if (a4)
  {
    +[MBError errorWithCode:210 format:@"No account"];
    unsigned __int8 v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)deleteBackupUDID:(id)a3 disableIfCurrentDevice:(BOOL)a4 account:(id)a5 connection:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (!v13) {
    __assert_rtn("-[MBServiceManager deleteBackupUDID:disableIfCurrentDevice:account:connection:error:]", "MBServiceManager.m", 829, "account");
  }
  BOOL v15 = v14;
  unint64_t v16 = MBGetDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Deleting backup %@", (uint8_t *)&buf, 0xCu);
    _MBLog();
  }

  if ([v12 length])
  {
    id v17 = [[MBService alloc] initWithAccount:v13];
    if (v17)
    {
      id v18 = MBDeviceUDID_Legacy();
      unsigned int v19 = [v12 isEqualToString:v18];

      if (v19)
      {
        uint64_t v32 = 0;
        v33 = &v32;
        uint64_t v34 = 0x2020000000;
        char v35 = 1;
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v37 = 0x3032000000;
        v38 = sub_10018B140;
        v39 = sub_10018B150;
        id v40 = 0;
        stateQueue = self->_stateQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10018B158;
        block[3] = &unk_100415080;
        void block[4] = self;
        id v25 = v17;
        id v26 = v12;
        p_long long buf = &buf;
        BOOL v31 = a4;
        id v27 = v13;
        id v28 = v15;
        unsigned __int8 v30 = &v32;
        dispatch_sync(stateQueue, block);
        int v21 = *((unsigned __int8 *)v33 + 24);
        if (a7 && !*((unsigned char *)v33 + 24))
        {
          *a7 = *(id *)(*((void *)&buf + 1) + 40);
          int v21 = *((unsigned __int8 *)v33 + 24);
        }
        unsigned __int8 v22 = v21 != 0;

        _Block_object_dispose(&buf, 8);
        _Block_object_dispose(&v32, 8);
      }
      else
      {
        unsigned __int8 v22 = [(MBService *)v17 deleteBackupForUDID:v12 error:a7];
      }
    }
    else if (a7)
    {
      +[MBError errorWithCode:210 format:@"No account"];
      unsigned __int8 v22 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v22 = 0;
    }
  }
  else if (a7)
  {
    +[MBError errorWithCode:1 format:@"Empty backup UDID"];
    unsigned __int8 v22 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned __int8 v22 = 0;
  }

  return v22;
}

- (BOOL)deleteSnapshotID:(unint64_t)a3 fromBackupUDID:(id)a4 account:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    *(void *)&uint8_t buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Deleting snapshot %lu from backup %@", buf, 0x16u);
    _MBLog();
  }

  if ([v10 length])
  {
    id v13 = [[MBService alloc] initWithAccount:v11];
    if (v13)
    {
      id v14 = MBDeviceUDID_Legacy();
      unsigned int v15 = [v10 isEqualToString:v14];

      if (v15)
      {
        uint64_t v26 = 0;
        id v27 = &v26;
        uint64_t v28 = 0x2020000000;
        char v29 = 1;
        *(void *)long long buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        BOOL v31 = sub_10018B140;
        uint64_t v32 = sub_10018B150;
        id v33 = 0;
        stateQueue = self->_stateQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10018B5F4;
        block[3] = &unk_1004150D0;
        void block[4] = self;
        int v21 = v13;
        unint64_t v25 = a3;
        id v22 = v10;
        id v23 = buf;
        SEL v24 = &v26;
        dispatch_sync(stateQueue, block);
        int v17 = *((unsigned __int8 *)v27 + 24);
        if (a6 && !*((unsigned char *)v27 + 24))
        {
          *a6 = *(id *)(*(void *)&buf[8] + 40);
          int v17 = *((unsigned __int8 *)v27 + 24);
        }
        unsigned __int8 v18 = v17 != 0;

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(&v26, 8);
      }
      else
      {
        unsigned __int8 v18 = [(MBService *)v13 deleteSnapshotForID:a3 backupUDID:v10 lastModified:0 error:a6];
      }
    }
    else if (a6)
    {
      +[MBError errorWithCode:210 format:@"No account"];
      unsigned __int8 v18 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v18 = 0;
    }
  }
  else if (a6)
  {
    +[MBError errorWithCode:1 format:@"Empty backup UDID"];
    unsigned __int8 v18 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned __int8 v18 = 0;
  }

  return v18;
}

- (BOOL)acquireLockWithBackupUDID:(id)a3 account:(id)a4 owner:(id)a5 timeout:(double)a6 connection:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (!v14) {
    __assert_rtn("-[MBServiceManager acquireLockWithBackupUDID:account:owner:timeout:connection:error:]", "MBServiceManager.m", 923, "account");
  }
  int v17 = v16;
  unsigned __int8 v18 = MBGetDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    id v25 = v13;
    __int16 v26 = 2112;
    id v27 = v15;
    __int16 v28 = 2048;
    double v29 = a6;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Acquiring lock on backup %@ owner %@ timeout %f", buf, 0x20u);
    _MBLog();
  }

  unsigned int v19 = [[MBService alloc] initWithAccount:v14];
  if (v19)
  {
    id v20 = +[MBSLock lockWithState:0 type:1 owner:v15 timeout:(unint64_t)a6];
    [(MBService *)v19 setLock:v20 forBackupUDID:v13];
    int v21 = [(MBService *)v19 backupForUDID:v13 lastModified:0 error:a8];
    BOOL v22 = v21 != 0;
  }
  else if (a8)
  {
    +[MBError errorWithCode:210 format:@"No account"];
    BOOL v22 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (BOOL)releaseLockWithBackupUDID:(id)a3 account:(id)a4 owner:(id)a5 connection:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  id v13 = MBGetDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Releasing lock on backup %@ owner %@", buf, 0x16u);
    _MBLog();
  }

  id v14 = [[MBService alloc] initWithAccount:v12];
  if (v14)
  {
    id v15 = +[MBSLock lockWithState:2 type:1 owner:v11 timeout:0];
    [(MBService *)v14 setLock:v15 forBackupUDID:v10];
    id v16 = [(MBService *)v14 backupForUDID:v10 lastModified:0 error:a7];
    BOOL v17 = v16 != 0;
  }
  else if (a7)
  {
    +[MBError errorWithCode:210 format:@"No account"];
    BOOL v17 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)deviceLockInfosWithAccount:(id)a3 connection:(id)a4 error:(id *)a5
{
  return 0;
}

- (void)cancelRestoreEnginesWithReason:(int64_t)a3 connection:(id)a4
{
  id v5 = a4;
  int v6 = v5;
  if (v5)
  {
    stateQueue = self->_stateQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10018BC78;
    v8[3] = &unk_1004110B0;
    v8[4] = self;
    id v9 = v5;
    dispatch_async(stateQueue, v8);
  }
}

- (void)cancelEnginesWithAccount:(id)a3 connection:(id)a4
{
  id v5 = a4;
  int v6 = (void *)os_transaction_create();
  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018BE70;
  block[3] = &unk_100411358;
  void block[4] = self;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(stateQueue, block);
}

- (void)cancelBackupEngineWithError:(id)a3 connection:(id)a4
{
}

- (void)_cancelAllBackgroundRestoreEngines
{
  id v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Canceling all background restore engines", buf, 2u);
    _MBLog();
  }

  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018C040;
  block[3] = &unk_100411128;
  void block[4] = self;
  dispatch_async(stateQueue, block);
}

- (id)backupStateInfoForInitialMegaBackup:(BOOL)a3 account:(id)a4
{
  return 0;
}

- (id)backgroundRestoreInfoWithAccount:(id)a3
{
  id v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Restore Background Info not supported for MBS", v5, 2u);
    _MBLog();
  }

  return 0;
}

- (id)getBuddyDataStashForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 account:(id)a5 connection:(id)a6 error:(id *)a7
{
  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "BuddyStashData not supported for MBS", v9, 2u);
    _MBLog();
  }

  return 0;
}

- (id)getBackupListWithFiltering:(BOOL)a3 account:(id)a4 connection:(id)a5 error:(id *)a6
{
  BOOL v7 = a3;
  id v8 = a4;
  id v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Listing MBS backups", buf, 2u);
    _MBLog();
  }

  id v10 = [[MBService alloc] initWithAccount:v8];
  id v11 = v10;
  if (!v10)
  {
    id v13 = +[MBError errorWithCode:210 format:@"No account"];
    goto LABEL_35;
  }
  id v60 = 0;
  id v12 = [(MBService *)v10 accountWithError:&v60];
  id v13 = v60;
  if (!v12)
  {
    id v41 = MBGetDefaultLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v63 = v13;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Error getting account from service: %@", buf, 0xCu);
      _MBLog();
    }

LABEL_35:
    id v40 = 0;
    v39 = 0;
LABEL_36:
    v42 = MBGetDefaultLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v63 = v13;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Failed to fetch the list of MBS backups: %@", buf, 0xCu);
      _MBLog();
    }

    if (a6)
    {
      id v13 = v13;
      unsigned int v43 = 0;
      *a6 = v13;
    }
    else
    {
      unsigned int v43 = 0;
    }
    goto LABEL_44;
  }
  id v48 = v8;
  long long v49 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v12 backupUDIDsCount]);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v47 = v12;
  id obj = [v12 backupUDIDs];
  id v14 = (char *)[obj countByEnumeratingWithState:&v56 objects:v66 count:16];
  if (v14)
  {
    id v15 = v14;
    v45 = a6;
    uint64_t v16 = *(void *)v57;
    while (2)
    {
      BOOL v17 = 0;
      unsigned __int8 v18 = v13;
      do
      {
        if (*(void *)v57 != v16) {
          objc_enumerationMutation(obj);
        }
        unsigned int v19 = MBStringWithData();
        id v55 = v18;
        id v20 = [(MBService *)v11 backupForUDID:v19 lastModified:0 error:&v55];
        id v21 = v55;

        if (!v20)
        {
          v38 = MBGetDefaultLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412546;
            id v63 = v19;
            __int16 v64 = 2112;
            id v65 = v21;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Error getting the MBS backup %@ from service: %@", buf, 0x16u);
            _MBLog();
          }

          id v13 = v21;
          v39 = v47;
          id v8 = v48;
          id v40 = v49;
          a6 = v45;
          goto LABEL_36;
        }
        +[MBBackup backupFromMBSBackup:v20 filterSnapshots:v7];
        id v23 = v22 = v11;
        [v49 addObject:v23];

        id v11 = v22;
        ++v17;
        unsigned __int8 v18 = v21;
      }
      while (v15 != v17);
      id v13 = v21;
      id v15 = (char *)[obj countByEnumeratingWithState:&v56 objects:v66 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  SEL v24 = v49;
  id v25 = [v49 indexOfObjectPassingTest:&stru_100415110];
  if (v25 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v26 = v25;
    [v49 objectAtIndexedSubscript:v25];
    v28 = id v27 = v11;
    [v49 removeObjectAtIndex:v26];
    [v49 insertObject:v28 atIndex:0];

    id v11 = v27;
  }
  id v29 = [v49 count];
  unsigned __int8 v30 = MBGetDefaultLog();
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
  if (v29)
  {
    id v8 = v48;
    if (v31)
    {
      *(_DWORD *)long long buf = 134217984;
      id v63 = v29;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Found %lu MBS backups", buf, 0xCu);
      _MBLog();
    }

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    unsigned __int8 v30 = v49;
    id v32 = [v30 countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (v32)
    {
      id v33 = v32;
      SEL v46 = v11;
      uint64_t v34 = *(void *)v52;
      do
      {
        for (i = 0; i != v33; i = (char *)i + 1)
        {
          if (*(void *)v52 != v34) {
            objc_enumerationMutation(v30);
          }
          CFStringRef v36 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          uint64_t v37 = MBGetDefaultLog();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            id v63 = v36;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Found %@", buf, 0xCu);
            _MBLog();
          }
        }
        id v33 = [v30 countByEnumeratingWithState:&v51 objects:v61 count:16];
      }
      while (v33);
      id v8 = v48;
      SEL v24 = v49;
      id v11 = v46;
    }
  }
  else
  {
    id v8 = v48;
    if (v31)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "No MBS backups found", buf, 2u);
      _MBLog();
    }
  }

  id v40 = v24;
  unsigned int v43 = v40;
  v39 = v47;
LABEL_44:

  return v43;
}

- (BOOL)startBackupWithOptions:(id)a3 reason:(int64_t)a4 xpcActivity:(id)a5 account:(id)a6 connection:(id)a7 error:(id *)a8
{
  if (a8)
  {
    *a8 = +[MBError errorWithCode:203, @"MBS backups are disabled. Refusing to run a backup with this manager", a5, a6, a7 format];
  }
  return 0;
}

- (id)filesForSnapshotID:(unint64_t)a3 backupUDID:(id)a4 account:(id)a5 connection:(id)a6 error:(id *)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_10018B140;
  SEL v24 = sub_10018B150;
  id v25 = (id)objc_opt_new();
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10018CA50;
  v16[3] = &unk_100415138;
  unint64_t v19 = a3;
  id v13 = v10;
  id v17 = v13;
  unsigned __int8 v18 = &v20;
  MBPerformWithCache((uint64_t)v16);
  id v14 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v14;
}

- (id)_restoreStateWithAccount:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBServiceManager _restoreStateWithAccount:]", "MBServiceManager.m", 1112, "account");
  }
  id v5 = v4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_10018B140;
  stateQueue = self->_stateQueue;
  id v17 = sub_10018B150;
  id v18 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018CDA0;
  block[3] = &unk_100411B38;
  id v11 = v5;
  id v12 = &v13;
  void block[4] = self;
  id v7 = v5;
  dispatch_sync(stateQueue, block);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)restoreStateWithError:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBServiceManager restoreStateWithError:]", "MBServiceManager.m", 1123, "error");
  }
  id v5 = [(MBServiceManager *)self account];
  if (v5)
  {
    id v6 = [(MBServiceManager *)self _restoreStateWithAccount:v5];
  }
  else
  {
    id v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = *a3;
      *(_DWORD *)long long buf = 138543362;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to fetch restore state due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }

    id v9 = +[UMUserPersona currentPersona];
    id v17 = 0;
    id v10 = +[MBPersona personaWithUMPersona:v9 error:&v17];
    id v11 = v17;

    if (v10)
    {
      id v12 = [v10 copyPreferencesValueForKey:@"RestoreSession" class:objc_opt_class()];
      id v13 = [v10 copyPreferencesValueForKey:@"RestoreStateInfo" class:objc_opt_class()];
      id v14 = v13;
      if (v12)
      {
        *a3 = +[MBError errorWithCode:210 format:@"No account found"];

        id v6 = 0;
      }
      else
      {
        if (!v13
          || (id v6 = [objc_alloc((Class)MBStateInfo) initWithDictionaryRepresentation:v13]) == 0)
        {
          id v6 = [objc_alloc((Class)MBStateInfo) initWithState:0 progress:0 estimatedTimeRemaining:0 error:0 errors:0.0];
        }
      }
    }
    else
    {
      uint64_t v15 = MBGetDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        id v19 = v11;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to create a persona: %{public}@", buf, 0xCu);
        _MBLog();
      }

      id v6 = 0;
      *a3 = v11;
    }
  }
  return v6;
}

- (BOOL)startRestoreForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 account:(id)a5 connection:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (!v13) {
    __assert_rtn("-[MBServiceManager startRestoreForBackupUDID:snapshotID:account:connection:error:]", "MBServiceManager.m", 1165, "account");
  }
  uint64_t v15 = v14;
  uint64_t v16 = [(MBPersonaStateManager *)self->_personaState objectForKeyedSubscript:v13];
  id v17 = [(MBServiceManager *)self _settingsContextForForegroundRestoreWithBackupUDID:v12 account:v13 snapshotID:a4];
  [v17 setShouldRestoreSystemFiles:1];
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 1;
  uint64_t v34 = 0;
  char v35 = &v34;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = sub_10018B140;
  stateQueue = self->_stateQueue;
  v38 = sub_10018B150;
  id v39 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10018D2FC;
  v26[3] = &unk_100415160;
  v26[4] = self;
  BOOL v31 = &v34;
  id v32 = &v40;
  id v19 = v16;
  id v27 = v19;
  id v20 = v13;
  id v28 = v20;
  id v21 = v12;
  id v29 = v21;
  unint64_t v33 = a4;
  id v22 = v17;
  id v30 = v22;
  dispatch_sync(stateQueue, v26);
  if (a7)
  {
    id v23 = (void *)v35[5];
    if (v23) {
      *a7 = v23;
    }
  }
  char v24 = *((unsigned char *)v41 + 24);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v24;
}

- (BOOL)restoreFileWithPath:(id)a3 context:(id)a4 account:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = [(MBServiceManager *)self _settingsContextForBackgroundFileRestoreWithPath:a3 account:a5 delegateContext:v10];
  LOBYTE(a6) = [(MBServiceManager *)self _startBackgroundRestoreWithSettingsContext:v11 delegateContext:v10 error:a6];

  return (char)a6;
}

- (BOOL)restoreFilesWithPaths:(id)a3 context:(id)a4 account:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = MBGetDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Starting batch restore of files: %@", buf, 0xCu);
    _MBLog();
  }

  if (v10 && [v10 count])
  {
    id v14 = +[MBServiceBatchRestoreOperation batchOperationWithFilePaths:v10 serviceManager:self delegateContext:v11];
    uint64_t v15 = [(MBServiceManager *)self batchRestoreOps];
    objc_sync_enter(v15);
    uint64_t v16 = [(MBServiceManager *)self batchRestoreOps];
    [v16 addObject:v14];

    objc_sync_exit(v15);
    unsigned __int8 v17 = [v14 startRestoreWithError:a6];
  }
  else
  {
    id v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Empty batch restore requested, nothing to do", buf, 2u);
      _MBLog();
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10018D87C;
    block[3] = &unk_100411128;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    unsigned __int8 v17 = 1;
  }

  return v17;
}

- (BOOL)_restoreBookWithPath:(id)a3 range:(_NSRange)a4 context:(id)a5 error:(id *)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a3;
  id v12 = a5;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = sub_10018B140;
  id v41 = sub_10018B150;
  id v42 = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10018DC58;
  v31[3] = &unk_100415188;
  uint64_t v34 = &v37;
  id v13 = v11;
  id v32 = v13;
  unint64_t v33 = self;
  NSUInteger v35 = location;
  NSUInteger v36 = length;
  MBPerformWithCache((uint64_t)v31);
  id v14 = (void *)v38[5];
  if (v14 && [v14 count])
  {
    uint64_t v15 = v38[5];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10018DD90;
    v22[3] = &unk_1004151B0;
    id v23 = v13;
    char v24 = self;
    id v25 = v12;
    NSUInteger v26 = location;
    NSUInteger v27 = length;
    uint64_t v16 = +[MBServiceBatchRestoreOperation batchOperationWithFilePaths:v15 serviceManager:self delegateContext:v25 batchCompletion:v22];
    unsigned __int8 v17 = [(MBServiceManager *)self batchRestoreOps];
    objc_sync_enter(v17);
    id v18 = [(MBServiceManager *)self batchRestoreOps];
    [v18 addObject:v16];

    objc_sync_exit(v17);
    unsigned __int8 v19 = [v16 startRestoreWithError:a6];
  }
  else
  {
    id v20 = MBGetDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v44 = v13;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "No paths to restore for book at %@", buf, 0xCu);
      _MBLog();
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10018DD04;
    block[3] = &unk_100411358;
    void block[4] = self;
    id v29 = v12;
    id v30 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    unsigned __int8 v19 = 1;
  }

  _Block_object_dispose(&v37, 8);
  return v19;
}

- (BOOL)restoreBookWithPath:(id)a3 context:(id)a4 account:(id)a5 error:(id *)a6
{
  return -[MBServiceManager _restoreBookWithPath:range:context:error:](self, "_restoreBookWithPath:range:context:error:", a3, 0, 10, a4, a6);
}

- (BOOL)restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 qos:(id)a5 context:(id)a6 account:(id)a7 error:(id *)a8
{
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a6;
  id v16 = a5;
  unsigned __int8 v17 = [(MBServiceManager *)self _settingsContextForBackgroundAppRestoreWithBundleID:v14 account:a7 errorCode:v12 delegateContext:v15];
  [v17 setQos:v16];

  id v18 = MBGetDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "MBS: Starting background restore for app with bundle ID %@", buf, 0xCu);
    _MBLog();
  }

  BOOL v19 = [(MBServiceManager *)self _startBackgroundRestoreWithSettingsContext:v17 delegateContext:v15 error:a8];
  return v19;
}

- (BOOL)cancelApplicationRestoreWithBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_10018B140;
  BOOL v19 = sub_10018B150;
  id v20 = 0;
  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018E3A8;
  block[3] = &unk_100412B00;
  void block[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v14 = &v15;
  dispatch_sync(stateQueue, block);
  id v9 = (void *)v16[5];
  if (a4 && v9)
  {
    *a4 = v9;
    id v9 = (void *)v16[5];
  }
  BOOL v10 = v9 == 0;

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (void)_finishRestore:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(MBServiceManager *)self account];
  if (!v5) {
    __assert_rtn("-[MBServiceManager _finishRestore:]", "MBServiceManager.m", 1354, "account");
  }
  id v6 = (void *)v5;
  id v7 = [(MBPersonaStateManager *)self->_personaState objectForKeyedSubscript:v5];
  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    BOOL v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "MBS, Finishing restore (%d)", buf, 8u);
    _MBLog();
  }

  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018E8FC;
  block[3] = &unk_100412B28;
  BOOL v13 = v3;
  void block[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_sync(stateQueue, block);
}

- (void)finishAirTrafficRestoreWithAccount:(id)a3
{
}

- (void)clearRestoreSessionWithAccount:(id)a3
{
}

- (void)cancelBackgroundRestoreWithAccount:(id)a3
{
}

- (void)finishRestore
{
}

- (void)cancelRestore
{
}

- (void)_finishedRestore
{
  uint64_t v4 = [(MBServiceManager *)self account];
  if (!v4) {
    __assert_rtn("-[MBServiceManager _finishedRestore]", "MBServiceManager.m", 1416, "account");
  }
  uint64_t v5 = (void *)v4;
  id v6 = [(MBPersonaStateManager *)self->_personaState objectForKeyedSubscript:v4];
  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MBS: Finished restore", buf, 2u);
    _MBLog();
  }

  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018EE4C;
  block[3] = &unk_100412AB0;
  id v11 = v6;
  id v12 = self;
  SEL v13 = a2;
  id v9 = v6;
  dispatch_async(stateQueue, block);
}

+ (void)insufficientFreeSpaceToRestoreForAccount:(id)a3
{
  id v3 = a3;
  id v9 = +[MBUserNotification notification];
  [v9 setIdentifier:@"InsufficientSpaceForRestore"];
  [v9 setInterval:86400.0];
  uint64_t v4 = MBLocalizedStringFromTable();
  [v9 setTitle:v4];

  uint64_t v5 = MBLocalizedStringFromTable();
  [v9 setBody:v5];

  id v6 = MBLocalizedStringFromTable();
  [v9 setButton:v6];

  id v7 = MBLocalizedStringFromTable();
  [v9 setAlternateButton:v7];

  [v9 setCompletionBlock:&stru_1004151F0];
  id v8 = +[MBUserNotificationManager sharedManager];
  [v8 presentUserNotification:v9 account:v3];
}

- (id)_deviceBackupFromCache
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_10018B140;
  id v9 = sub_10018B150;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10018F514;
  v4[3] = &unk_100414D00;
  v4[4] = &v5;
  MBPerformWithCache((uint64_t)v4);
  v2 = +[MBBackup backupFromMBSBackup:v6[5] filterSnapshots:1];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)deviceBackup
{
  v2 = [(MBServiceManager *)self getBackupListWithError:0];
  id v3 = [v2 indexOfObjectPassingTest:&stru_100415210];
  uint64_t v4 = 0;
  if (v3 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [v2 objectAtIndexedSubscript:v3];
  }

  return v4;
}

- (id)restoreFilesForDomain:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 range:(_NSRange)a6 account:(id)a7 error:(id *)a8
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v13 = a3;
  id v14 = a4;
  BOOL v15 = MBGetDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = location;
    *(_WORD *)&buf[22] = 2048;
    uint64_t v37 = (uint64_t (*)(uint64_t, uint64_t))length;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Listing restore files for domain %@ (range: %lu, %lu)", buf, 0x20u);
    _MBLog();
  }

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  uint64_t v37 = sub_10018B140;
  v38 = sub_10018B150;
  id v39 = 0;
  uint64_t v30 = 0;
  BOOL v31 = &v30;
  uint64_t v32 = 0x3032000000;
  unint64_t v33 = sub_10018B140;
  uint64_t v34 = sub_10018B150;
  id v35 = 0;
  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018F8F8;
  block[3] = &unk_100415260;
  void block[4] = self;
  id v17 = v13;
  id v23 = v17;
  id v25 = &v30;
  id v18 = v14;
  BOOL v29 = a5;
  NSUInteger v27 = location;
  NSUInteger v28 = length;
  id v24 = v18;
  NSUInteger v26 = buf;
  dispatch_sync(stateQueue, block);
  if (a8)
  {
    BOOL v19 = (void *)v31[5];
    if (v19) {
      *a8 = v19;
    }
  }
  id v20 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(buf, 8);

  return v20;
}

- (BOOL)restoreFileExistsWithPath:(id)a3 account:(id)a4
{
  id v5 = a4;
  id v6 = MBStandardizePath();
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  stateQueue = self->_stateQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10018FDDC;
  v11[3] = &unk_1004152B0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v5;
  id v14 = &v15;
  id v8 = v5;
  id v9 = v6;
  dispatch_sync(stateQueue, v11);
  LOBYTE(v5) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v5;
}

- (BOOL)restoreDataExistsForApplicationWithBundleID:(id)a3 size:(unint64_t *)a4 account:(id)a5
{
  id v7 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  stateQueue = self->_stateQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001902A0;
  v12[3] = &unk_100415300;
  v12[4] = self;
  id v9 = v7;
  id v13 = v9;
  id v14 = &v20;
  uint64_t v15 = &v16;
  dispatch_sync(stateQueue, v12);
  if (a4) {
    *a4 = v17[3];
  }
  char v10 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

- (void)prioritizeRestoreFileWithPath:(id)a3 account:(id)a4
{
  id v4 = a4;
  id v5 = MBStandardizePath();
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Prioritizing restore file: %@", buf, 0xCu);
    _MBLog();
  }

  id v7 = objc_alloc((Class)MBDomainManager);
  id v8 = [v4 persona];
  id v9 = [v7 initWithPersona:v8];

  id v15 = 0;
  char v10 = [v9 domainForPath:v5 relativePath:&v15];
  id v11 = v15;
  if (v10)
  {
    +[MBFileID fileIDWithDomain:v10 relativePath:v11];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100190824;
    v13[3] = &unk_100415058;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v12;
    MBPerformWithCache((uint64_t)v13);
  }
  else
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Domain not found for request to prioritize restore file: %@", buf, 0xCu);
      _MBLog();
    }
  }
}

- (BOOL)startScanWithAccount:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = +[MBError errorWithCode:203 format:@"MBS backups are disabled. Refusing to start a scan with this manager."];
  }
  return 0;
}

- (id)_domainInfoForName:(id)a3 cache:(id)a4 appManager:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = MBDeviceUDID_Legacy();
  id v11 = [v8 domainInfoForName:v7 backupUDID:v10];

  if (+[MBDomain isAppName:v7]
    && (+[MBDomain isAppPlaceholderName:v7] & 1) == 0)
  {
    id v12 = +[MBDomain containerIDWithName:v7];
    id v13 = [v9 appWithIdentifier:v12];

    if (v13 && [v13 isSystemApp]) {
      [v11 setSystemApp:1];
    }
  }
  if ([v7 isEqualToString:@"AppDomain-com.apple.iBooks"])
  {
    id v14 = MBDeviceUDID_Legacy();
    id v15 = [v8 domainInfoForName:@"BooksDomain" backupUDID:v14];

    objc_msgSend(v11, "setRemoteSize:", (char *)objc_msgSend(v15, "remoteSize") + (void)objc_msgSend(v11, "remoteSize"));
    objc_msgSend(v11, "setLocalSize:", (char *)objc_msgSend(v15, "localSize") + (void)objc_msgSend(v11, "localSize"));
  }
  return v11;
}

- (id)domainInfoForName:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Getting domain info for %@", (uint8_t *)&buf, 0xCu);
    _MBLog();
  }

  id v9 = [(MBServiceManager *)self account];
  char v10 = [(MBServiceManager *)self _settingsContextForBackupUDID:0 account:v9];
  id v11 = +[MBAppManager appManagerWithSettingsContext:v10];

  id v12 = [v7 persona];
  id v28 = 0;
  unsigned __int8 v13 = [v11 loadAppsWithPersona:v12 safeHarbors:0 error:&v28];
  id v14 = v28;

  if ((v13 & 1) == 0)
  {
    id v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = +[MBError descriptionForError:v14];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Error loading apps: %@", (uint8_t *)&buf, 0xCu);

      char v23 = +[MBError descriptionForError:v14];
      _MBLog();
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x3032000000;
  unint64_t v33 = sub_10018B140;
  uint64_t v34 = sub_10018B150;
  id v35 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100190DB8;
  v24[3] = &unk_100415288;
  p_long long buf = &buf;
  v24[4] = self;
  id v17 = v6;
  id v25 = v17;
  id v18 = v11;
  id v26 = v18;
  MBPerformWithCache((uint64_t)v24);
  uint64_t v19 = MBGetDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)BOOL v29 = 138412290;
    uint64_t v30 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "domain info: %@", v29, 0xCu);
    _MBLog();
  }

  id v21 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v21;
}

- (id)domainInfoListWithAccount:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBServiceManager domainInfoListWithAccount:]", "MBServiceManager.m", 1675, "account");
  }
  id v5 = v4;
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Listing domain info", buf, 2u);
    _MBLog();
  }

  id v7 = [(MBServiceManager *)self account];
  uint64_t v8 = [(MBServiceManager *)self _settingsContextForBackupUDID:0 account:v7];
  id v9 = +[MBAppManager appManagerWithSettingsContext:v8];

  char v10 = [v5 persona];
  id v36 = 0;
  LOBYTE(v8) = [v9 loadAppsWithPersona:v10 safeHarbors:0 error:&v36];
  id v11 = v36;

  if ((v8 & 1) == 0)
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v13 = +[MBError descriptionForError:v11];
      *(_DWORD *)long long buf = 138412290;
      id v39 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Error loading apps: %@", buf, 0xCu);

      id v26 = +[MBError descriptionForError:v11];
      _MBLog();
    }
  }
  id v28 = v11;
  id v14 = +[NSMutableArray array];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100191204;
  v33[3] = &unk_100415328;
  v33[4] = self;
  id v27 = v9;
  id v34 = v27;
  id v15 = v14;
  id v35 = v15;
  MBPerformWithCache((uint64_t)v33);
  [v15 sortUsingComparator:&stru_100415348];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v22 = MBGetDefaultLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v39 = v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "domain info: %@", buf, 0xCu);
          _MBLog();
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v18);
  }

  char v23 = v35;
  id v24 = v16;

  return v24;
}

- (BOOL)_removeDomainName:(id)a3 service:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v38 = 0;
  id v9 = MBDeviceUDID_Legacy();
  unsigned int v10 = [v8 removeDomainName:v7 backupUDID:v9 lastModified:&v38 error:a5];

  if (v10)
  {
    uint64_t v34 = 0;
    id v35 = &v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0;
    uint64_t v28 = 0;
    long long v29 = &v28;
    uint64_t v30 = 0x3032000000;
    long long v31 = sub_10018B140;
    long long v32 = sub_10018B150;
    id v33 = 0;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100191864;
    v23[3] = &unk_100415370;
    id v24 = v7;
    id v25 = &v34;
    id v26 = &v28;
    uint64_t v27 = v38;
    MBPerformWithCache((uint64_t)v23);
    id v11 = [(id)v29[5] snapshots];
    id v12 = [v11 lastObject];

    if (v12 && ![v12 committed])
    {
      [v12 setQuotaReserved:v35[3]];
      unsigned __int8 v13 = MBGetDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = v35[3];
        *(_DWORD *)long long buf = 134217984;
        *(void *)uint64_t v40 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Updating new reserved quota for snapshot: %{bytes}llu", buf, 0xCu);
        _MBLog();
      }

      id v15 = MBDeviceUDID_Legacy();
      id v22 = 0;
      unsigned __int8 v16 = [v8 updateSnapshot:v12 backupUDID:v15 lastModified:0 error:&v22];
      id v17 = v22;

      if ((v16 & 1) == 0)
      {
        id v18 = MBGetDefaultLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = v18;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v20 = [v12 snapshotID];
            *(_DWORD *)long long buf = 67109378;
            *(_DWORD *)uint64_t v40 = v20;
            *(_WORD *)&v40[4] = 2112;
            *(void *)&v40[6] = v17;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Failed to update quota reserve for uncommitted snapshot %d: %@", buf, 0x12u);
          }

          [v12 snapshotID];
          _MBLog();
        }
      }
    }

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v34, 8);
  }

  return v10;
}

- (BOOL)removeDomainName:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Removing %@", (uint8_t *)&buf, 0xCu);
    _MBLog();
  }

  id v12 = [[MBService alloc] initWithAccount:v10];
  if (v12)
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = sub_10018B140;
    uint64_t v28 = sub_10018B150;
    id v29 = 0;
    stateQueue = self->_stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100191C04;
    block[3] = &unk_100412B50;
    void block[4] = self;
    uint64_t v19 = &v21;
    id v17 = v9;
    id v18 = v12;
    p_long long buf = &buf;
    dispatch_sync(stateQueue, block);
    if (a6) {
      *a6 = *(id *)(*((void *)&buf + 1) + 40);
    }
    BOOL v14 = *((unsigned char *)v22 + 24) != 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v21, 8);
  }
  else if (a6)
  {
    +[MBError errorWithCode:210 format:@"No account"];
    BOOL v14 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)isBackupEnabledForDomainName:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[MBServiceManager isBackupEnabledForDomainName:account:]", "MBServiceManager.m", 1813, "0 && \"Unexpected call\"");
}

- (void)setBackupEnabled:(BOOL)a3 forDomainName:(id)a4 account:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      CFStringRef v10 = @"Enabling";
    }
    else {
      CFStringRef v10 = @"Disabling";
    }
    *(_DWORD *)long long buf = 138412546;
    CFStringRef v16 = v10;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);
    CFStringRef v13 = v10;
    id v14 = v7;
    _MBLog();
  }

  id v11 = [v8 persona];

  id v12 = +[MBAppManager appManager];
  [v12 setEnabled:v6 forDomainName:v7 persona:v11];
  if ([v7 isEqualToString:@"AppDomain-com.apple.iBooks"]) {
    [v12 setEnabled:v6 forDomainName:@"BooksDomain" persona:v11];
  }
  if (objc_msgSend(v7, "isEqualToString:", @"AppDomain-com.apple.Health", v13, v14)) {
    [v12 setEnabled:v6 forDomainName:@"HealthDomain" persona:v11];
  }
  if ([v7 isEqualToString:@"HealthDomain"]) {
    [v12 setEnabled:v6 forDomainName:@"AppDomain-com.apple.Health" persona:v11];
  }
}

- (id)disabledDomainInfosForAccount:(id)a3
{
  return 0;
}

- (id)getAppleIDsForBackupUDID:(id)a3 account:(id)a4 snapshotID:(unint64_t)a5 activeAppleID:(id *)a6 connection:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v39 = a4;
  id v37 = a7;
  id v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v43 = v13;
    __int16 v44 = 2048;
    unint64_t v45 = a5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Fetching the MBS Apple IDs for backupUDID:%@, snapshotID:%lu", buf, 0x16u);
    id v32 = v13;
    unint64_t v34 = a5;
    _MBLog();
  }

  id v15 = [(MBServiceManager *)self _settingsContextForBackupUDID:v13 account:v39];
  [v15 setSnapshotID:a5];
  uint64_t v38 = +[MBFileID fileIDWithDomainName:@"RootDomain" relativePath:@"Library/Caches/Backup/properties.plist"];
  CFStringRef v16 = MBTemporaryPath();
  __int16 v17 = +[MBServiceTools toolsWithSettingsContext:v15];
  [v17 open];
  id v41 = 0;
  unsigned __int8 v18 = [v17 extractFileID:v38 toPath:v16 progress:&stru_1004153B0 error:&v41];
  id v19 = v41;
  [v17 close];
  if (v18)
  {
    id v40 = v19;
    unsigned int v20 = +[MBProperties propertiesWithFile:v16 error:&v40];
    id v21 = v40;

    if (!v20)
    {
      uint64_t v23 = MBGetDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v43 = v21;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to get properties: %@", buf, 0xCu);
        id v32 = v21;
        _MBLog();
      }

      unsigned int v20 = 0;
    }
    id v19 = v21;
  }
  else
  {
    id v22 = MBGetDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v43 = v19;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Failed to extract file: %@", buf, 0xCu);
      id v32 = v19;
      _MBLog();
    }

    unsigned int v20 = 0;
  }
  char v24 = +[NSFileManager defaultManager];
  [v24 removeItemAtPath:v16 error:0];

  if (v20)
  {
    id v25 = [v20 appleIDs];
    uint64_t v26 = MBGetDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = MBStringWithDictionary();
      uint64_t v28 = [v20 activeAppleID];
      *(_DWORD *)long long buf = 138412546;
      id v43 = v27;
      __int16 v44 = 2112;
      unint64_t v45 = (unint64_t)v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "MBS Apple IDs = %@, active Apple ID = %@", buf, 0x16u);

      id v29 = MBStringWithDictionary();
      [v20 activeAppleID];
      id v35 = v33 = v29;
      _MBLog();
    }
    if (v25)
    {
      if (a6)
      {
        *a6 = [v20 activeAppleID];
      }
      uint64_t v30 = objc_msgSend(v25, "allKeys", v33, v35);
    }
    else
    {
      uint64_t v30 = &__NSArray0__struct;
    }
  }
  else
  {
    uint64_t v30 = 0;
    if (a8) {
      *a8 = v19;
    }
  }

  return v30;
}

- (void)repair
{
  v2 = MBGetDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Repairing file system if needed", v3, 2u);
    _MBLog();
  }
}

- (BOOL)countCameraRollQuota
{
  id v3 = MBDeviceUDID_Legacy();
  LOBYTE(self) = [(MBServiceManager *)self countCameraRollQuotaForBackupUDID:v3 error:0];

  return (char)self;
}

- (BOOL)countCameraRollQuotaForBackupUDID:(id)a3 error:(id *)a4
{
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NOTE: Counting camera roll against iCloud quota is an unsupported operation (no-op)", v6, 2u);
    _MBLog();
  }

  return 0;
}

- (BOOL)discountCameraRollQuotaWithAccount:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  CFStringRef v10 = MBDeviceUDID_Legacy();
  LOBYTE(a5) = [(MBServiceManager *)self discountCameraRollQuotaForBackupUDID:v10 account:v9 connection:v8 error:a5];

  return (char)a5;
}

- (BOOL)discountCameraRollQuotaForBackupUDID:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v25 = a5;
  id v13 = MBGetDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Not counting camera roll against iCloud quota", buf, 2u);
    _MBLog();
  }

  id v14 = [[MBService alloc] initWithAccount:v12];
  if (v14)
  {
    *(void *)long long buf = 0;
    id v29 = buf;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100192BB8;
    v27[3] = &unk_100414D00;
    v27[4] = buf;
    MBPerformWithCache((uint64_t)v27);
    if (v29[24])
    {
      id v15 = +[MBDaemon sharedDaemon];
      [v15 holdWorkAssertion:a2];

      id v26 = 0;
      unsigned __int8 v16 = [(MBService *)v14 discountCameraRollQuotaForBackupUDID:v11 error:&v26];
      id v17 = v26;
      if (v16)
      {
        BOOL v18 = 1;
      }
      else
      {
        id v21 = MBGetDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id v32 = 138412290;
          id v33 = v17;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to discount camera roll from iCloud quota: %@", v32, 0xCu);
          id v24 = v17;
          _MBLog();
        }

        BOOL v18 = 0;
      }
      id v22 = +[MBDaemon sharedDaemon];
      [v22 releaseWorkAssertion:a2];

      if (a6 && v17) {
        *a6 = v17;
      }
      if (v18) {
        [(MBServiceManager *)self _clearDeferredDiscountingCameraRollQuota];
      }
      else {
        [(MBServiceManager *)self _deferDiscountingCameraRollQuota];
      }
    }
    else
    {
      unsigned int v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v32 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Unable to modify quota: No backup", v32, 2u);
        _MBLog();
      }

      if (a6)
      {
        *a6 = +[MBError errorWithCode:204 format:@"No backup"];
      }
      [(MBServiceManager *)self _deferDiscountingCameraRollQuota];
      BOOL v18 = 0;
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v19 = MBGetDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unable to modify quota: No account", buf, 2u);
      _MBLog();
    }

    if (a6)
    {
      *a6 = +[MBError errorWithCode:210 format:@"No account"];
    }
    [(MBServiceManager *)self _deferDiscountingCameraRollQuota];
    BOOL v18 = 0;
  }

  return v18;
}

- (void)_deferDiscountingCameraRollQuota
{
  id v3 = [(MBServiceManager *)self account];
  v2 = [v3 persona];
  [v2 setPreferencesValue:&__kCFBooleanTrue forKey:@"HasDeferredDiscountingQuota"];
}

- (void)_clearDeferredDiscountingCameraRollQuota
{
  id v3 = [(MBServiceManager *)self account];
  v2 = [v3 persona];
  [v2 setPreferencesValue:0 forKey:@"HasDeferredDiscountingQuota"];
}

- (void)signalPrebuddy:(id)a3 account:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  id v7 = [(MBServiceManager *)self prebuddyFollowUpController];
  [v7 startFollowup:v6];

  id v8 = [v11 persona];
  [v8 setPreferencesValue:&off_10043A038 forKey:@"MegaBackupEntryPoint"];

  id v9 = [v11 persona];
  CFStringRef v10 = +[NSDate now];
  [v9 setPreferencesValue:v10 forKey:@"MegaBackupFlowStartDate"];

  [(MBServiceManager *)self submitMegaLifeCycleTelemetriesWithAccount:v11];
}

- (void)updatePrebuddyFollowUp:(id)a3
{
}

- (void)clearPrebuddyWithAccount:(id)a3 accountSignOut:(BOOL)a4
{
  [(MBServiceManager *)self _clearPreferencesForRestoringSettingsEnabledForMegaBackup];
  [(MBServiceManager *)self _clearMegaBackupTelemetries];
  [(MBServiceManager *)self setPrebuddyMode:0];
  id v5 = [(MBServiceManager *)self prebuddyFollowUpController];
  [v5 reset];
}

- (void)beginPrebuddyBackupWithAccount:(id)a3 connection:(id)a4 fromManualSignal:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    __assert_rtn("-[MBServiceManager beginPrebuddyBackupWithAccount:connection:fromManualSignal:]", "MBServiceManager.m", 1982, "account");
  }
  id v9 = v8;
  [(MBServiceManager *)self setPrebuddyMode:1];
  CFStringRef v10 = objc_opt_new();
  [v10 setBackupPolicy:1];
  uint64_t v13 = 0;
  if ([(MBServiceManager *)self startBackupWithOptions:v10 reason:1 xpcActivity:0 account:v7 connection:v9 error:&v13])
  {
    id v11 = [(MBServiceManager *)self prebuddyFollowUpController];
    id v12 = [(MBServiceManager *)self backupStateInfoForInitialMegaBackup:1 account:v7];
    [v11 updateFollowupWithBackupProgress:v12];
  }
}

- (BOOL)isPrebuddyMode
{
  char v7 = 0;
  v2 = [(MBServiceManager *)self account];
  id v3 = [v2 persona];
  unsigned int v4 = [v3 getBooleanValueForKey:@"IsPrebuddyMode" keyExists:&v7];

  if (v7) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

- (void)setPrebuddyMode:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSNumber numberWithBool:v3];
    *(_DWORD *)long long buf = 138543362;
    uint64_t v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setPrebuddyMode: %{public}@", buf, 0xCu);

    id v11 = +[NSNumber numberWithBool:v3];
    _MBLog();
  }
  char v7 = [(MBServiceManager *)self account];
  id v8 = [v7 persona];
  id v9 = v8;
  if (v3) {
    CFStringRef v10 = &__kCFBooleanTrue;
  }
  else {
    CFStringRef v10 = 0;
  }
  objc_msgSend(v8, "setPreferencesValue:forKey:", v10, @"IsPrebuddyMode", v11);
}

- (BOOL)isInitialMegaBackupCompleted:(id)a3
{
  return 0;
}

- (void)saveBackupEnabledForMegaBackup
{
  BOOL v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Saving backup enabled for mega backup.", v6, 2u);
    _MBLog();
  }

  unsigned int v4 = [(MBServiceManager *)self account];
  BOOL v5 = [v4 persona];
  [v5 setPreferencesValue:&__kCFBooleanTrue forKey:@"BackupEnabledForMegaBackup"];
}

- (BOOL)wasBackupEnabledForMegaBackup:(id)a3
{
  return 0;
}

- (void)saveSyncSettingsEnabledForMegaBackup:(id)a3
{
  id v4 = a3;
  BOOL v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Saving sync settings enabled for mega backup: %@", buf, 0xCu);
    _MBLog();
  }

  id v6 = [(MBServiceManager *)self account];
  char v7 = [v6 persona];
  [v7 setPreferencesValue:v4 forKey:@"SyncSettingsEnabledForMegaBackup"];
}

- (void)saveBackupDomainsEnabledForMegaBackup:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      CFStringRef v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) domainName];
        [v5 addObject:v11];

        CFStringRef v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v8);
  }

  id v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Saving backup domains enabled for mega backup: %@", buf, 0xCu);
    _MBLog();
  }

  uint64_t v13 = [(MBServiceManager *)self account];
  id v14 = [v13 persona];
  [v14 setPreferencesValue:v5 forKey:@"BackupDomainsEnabledForMegaBackup"];
}

- (BOOL)restorePreviousSettingsEnabledForMegaBackup:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Restoring previous settings enabled for mega backup.", v10, 2u);
    _MBLog();
  }

  [(MBServiceManager *)self _restoreBackupEnabledForMegaBackup:v6];
  BOOL v8 = [(MBServiceManager *)self _restoreSyncSettingsEnabledForMegaBackup:a4];
  [(MBServiceManager *)self _restoreBackupDomainsEnabledForMegaBackup:v6];

  [(MBServiceManager *)self _clearPreferencesForRestoringSettingsEnabledForMegaBackup];
  return v8;
}

- (void)_restoreBackupEnabledForMegaBackup:(id)a3
{
  id v4 = a3;
  char v9 = 0;
  id v5 = [v4 persona];
  unsigned int v6 = [v5 getBooleanValueForKey:@"BackupEnabledForMegaBackup" keyExists:&v9];

  if (v9) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    BOOL v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Restoring backup enabled setting that was previously enabled for mega backup: %@", buf, 0xCu);
      _MBLog();
    }

    [(MBServiceManager *)self setBackupEnabled:0 account:v4 connection:0];
  }
}

- (BOOL)_restoreSyncSettingsEnabledForMegaBackup:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBServiceManager _restoreSyncSettingsEnabledForMegaBackup:]", "MBServiceManager.m", 2067, "error != nil");
  }
  id v5 = [(MBServiceManager *)self account];
  unsigned int v6 = [v5 persona];
  id v7 = [v6 copyPreferencesValueForKey:@"SyncSettingsEnabledForMegaBackup" class:objc_opt_class()];

  if (v7)
  {
    BOOL v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Restoring sync settings enabled for mega backup: %@", (uint8_t *)&buf, 0xCu);
      id v24 = v7;
      _MBLog();
    }

    char v9 = +[ACAccountStore defaultStore];
    CFStringRef v10 = objc_msgSend(v9, "aa_primaryAppleAccount");
    if (v10)
    {
      id v11 = dispatch_group_create();
      uint64_t v50 = 0;
      long long v51 = &v50;
      uint64_t v52 = 0x2020000000;
      char v53 = 1;
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v56 = 0x3032000000;
      long long v57 = sub_10018B140;
      long long v58 = sub_10018B150;
      id v59 = 0;
      if ([v7 containsObject:ACAccountDataclassKeychainSync])
      {
        dispatch_group_enter(v11);
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_100193C98;
        v46[3] = &unk_1004153D8;
        id v48 = &v50;
        p_long long buf = &buf;
        v47 = v11;
        [(MBServiceManager *)self _disableKeychainSync:v46];
      }
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v12 = v7;
      id v13 = [v12 countByEnumeratingWithState:&v42 objects:v54 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v43;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v43 != v14) {
              objc_enumerationMutation(v12);
            }
            objc_msgSend(v10, "setEnabled:forDataclass:", 0, *(void *)(*((void *)&v42 + 1) + 8 * i), v24);
          }
          id v13 = [v12 countByEnumeratingWithState:&v42 objects:v54 count:16];
        }
        while (v13);
      }

      id v41 = 0;
      long long v16 = [v9 dataclassActionsForAccountSave:v10 error:&v41];
      id v17 = v41;
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_100193D08;
      v39[3] = &unk_100414BC0;
      id v18 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v16, "count"));
      id v40 = v18;
      [v16 enumerateKeysAndObjectsUsingBlock:v39];
      uint64_t v35 = 0;
      uint64_t v36 = &v35;
      uint64_t v37 = 0x2020000000;
      char v38 = 0;
      uint64_t v29 = 0;
      uint64_t v30 = &v29;
      uint64_t v31 = 0x3032000000;
      id v32 = sub_10018B140;
      id v33 = sub_10018B150;
      id v34 = 0;
      dispatch_group_enter(v11);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100193D9C;
      v25[3] = &unk_1004153D8;
      uint64_t v27 = &v35;
      uint64_t v28 = &v29;
      id v19 = v11;
      id v26 = v19;
      [v9 saveAccount:v10 withDataclassActions:v18 completion:v25];
      dispatch_group_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
      id v20 = *(void **)(*((void *)&buf + 1) + 40);
      if (v20) {
        *a3 = v20;
      }
      id v21 = (void *)v30[5];
      if (v21) {
        *a3 = v21;
      }
      if (*((unsigned char *)v51 + 24)) {
        BOOL v22 = *((unsigned char *)v36 + 24) != 0;
      }
      else {
        BOOL v22 = 0;
      }

      _Block_object_dispose(&v29, 8);
      _Block_object_dispose(&v35, 8);

      _Block_object_dispose(&buf, 8);
      _Block_object_dispose(&v50, 8);
    }
    else
    {
      +[MBError errorWithCode:1 format:@"Couldn't get the Apple Account."];
      BOOL v22 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    BOOL v22 = 1;
  }

  return v22;
}

- (void)_disableKeychainSync:(id)a3
{
  id v3 = a3;
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Disabling Keychain Sync.", buf, 2u);
    _MBLog();
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100193FE0;
  v6[3] = &unk_100415400;
  id v7 = v3;
  id v5 = v3;
  +[CDPKeychainSync setUserVisibleKeychainSyncEnabled:0 withCompletion:v6];
}

- (void)_restoreBackupDomainsEnabledForMegaBackup:(id)a3
{
  id v4 = a3;
  id v5 = [(MBServiceManager *)self account];
  unsigned int v6 = [v5 persona];
  id v7 = [v6 copyPreferencesValueForKey:@"BackupDomainsEnabledForMegaBackup" class:objc_opt_class()];

  if (v7)
  {
    BOOL v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v22 = v4;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Restoring backup domains enabled for mega backup: %@, domainNames: %@", buf, 0x16u);
      id v14 = v4;
      id v15 = v7;
      _MBLog();
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          -[MBServiceManager setBackupEnabled:forDomainName:account:](self, "setBackupEnabled:forDomainName:account:", 0, *(void *)(*((void *)&v16 + 1) + 8 * (void)v13), v4, v14, v15, (void)v16);
          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
}

- (void)_clearPreferencesForRestoringSettingsEnabledForMegaBackup
{
  id v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deleting preferences for restoring settings enabled for mega backup", buf, 2u);
    _MBLog();
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [&off_10043B478 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(&off_10043B478);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
        id v9 = [(MBServiceManager *)self account];
        id v10 = [v9 persona];
        [v10 setPreferencesValue:0 forKey:v8];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [&off_10043B478 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)_clearMegaBackupTelemetries
{
  id v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deleting preferences for mega backup telemetries", buf, 2u);
    _MBLog();
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [&off_10043B490 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(&off_10043B490);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
        id v9 = [(MBServiceManager *)self account];
        id v10 = [v9 persona];
        [v10 setPreferencesValue:0 forKey:v8];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [&off_10043B490 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v5);
  }
}

- (BOOL)requestMegaBackupExpirationDate:(id)a3 account:(id)a4 error:(id *)a5
{
  return 0;
}

- (void)updateMegaBackupExpirationDate:(id)a3 account:(id)a4
{
}

- (void)exitMegaBackupModeWithAccount:(id)a3
{
  [(MBServiceManager *)self _clearMegaBackupTelemetries];
  id v4 = [(MBServiceManager *)self prebuddyFollowUpController];
  [v4 reset];
}

- (void)prebuddyBackupDeletedWithAccount:(id)a3
{
}

- (void)submitMegaLifeCycleTelemetriesWithAccount:(id)a3
{
}

- (id)_settingsContextForBackupUDID:(id)a3 account:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(MBServiceSettingsContext);
  [(MBServiceSettingsContext *)v8 setAccount:v6];

  [(MBServiceSettingsContext *)v8 setLockManager:self->_lockManager];
  [(MBServiceSettingsContext *)v8 setBackupUDID:v7];

  id v9 = MBGetCacheDir();
  [(MBServiceSettingsContext *)v8 setCacheDir:v9];

  return v8;
}

- (id)_settingsContextForForegroundRestoreWithBackupUDID:(id)a3 account:(id)a4 snapshotID:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v9 persona];
  if (!v10) {
    __assert_rtn("-[MBServiceManager _settingsContextForForegroundRestoreWithBackupUDID:account:snapshotID:]", "MBServiceManager.m", 2207, "persona");
  }
  long long v11 = (void *)v10;
  long long v12 = [(MBServiceManager *)self _settingsContextForBackupUDID:v8 account:v9];
  [v12 setSnapshotID:a5];
  long long v13 = +[MBServiceRestoreMode foregroundRestoreMode];
  [v12 setRestoreMode:v13];

  return v12;
}

- (id)_settingsContextForBackgroundAppRestoreWithBundleID:(id)a3 account:(id)a4 errorCode:(int)a5 delegateContext:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  restoreSession = self->_restoreSession;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  long long v14 = [(MBServiceRestoreSession *)restoreSession backupUDID];
  id v15 = [(MBServiceManager *)self _settingsContextForBackupUDID:v14 account:v12];

  objc_msgSend(v15, "setSnapshotID:", -[MBServiceRestoreSession snapshotID](self->_restoreSession, "snapshotID"));
  long long v16 = +[MBServiceRestoreMode backgroundAppRestoreModeWithBundleID:v13 errorCode:v6];

  [v15 setRestoreMode:v16];
  long long v17 = [(NSMapTable *)self->_restoreQosByContext objectForKey:v11];

  if (v17)
  {
    long long v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v21 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Restore request will be serviced with qos:%@", buf, 0xCu);
      _MBLog();
    }

    [v15 setQos:v17];
  }

  return v15;
}

- (id)_settingsContextForBackgroundFileRestoreWithPath:(id)a3 account:(id)a4 delegateContext:(id)a5
{
  restoreSession = self->_restoreSession;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(MBServiceRestoreSession *)restoreSession backupUDID];
  id v13 = [(MBServiceManager *)self _settingsContextForBackupUDID:v12 account:v10];

  objc_msgSend(v13, "setSnapshotID:", -[MBServiceRestoreSession snapshotID](self->_restoreSession, "snapshotID"));
  long long v14 = +[MBServiceRestoreMode backgroundFileRestoreModeWithPath:v11];

  [v13 setRestoreMode:v14];
  id v15 = [(NSMapTable *)self->_restoreQosByContext objectForKey:v9];

  if (v15)
  {
    long long v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      long long v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Restore request will be serviced with qos:%@", buf, 0xCu);
      _MBLog();
    }

    [v13 setQos:v15];
  }

  return v13;
}

- (void)_notifyRestoreCompleted
{
  id v3 = +[MBNotificationCenter sharedNotificationCenter];
  id v4 = +[MBUserNotificationManager sharedManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100194C34;
  v6[3] = &unk_1004110B0;
  id v7 = v3;
  id v8 = self;
  id v5 = v3;
  [v4 deferUntilAfterSetupIsDone:v6];
}

- (void)_alertUserOfIncompleteRestore
{
  id v9 = +[MBUserNotification notification];
  [v9 setIdentifier:@"IncompleteRestore"];
  id v3 = +[NSDate distantFuture];
  [v3 timeIntervalSinceReferenceDate];
  objc_msgSend(v9, "setInterval:");

  id v4 = MBLocalizedStringFromTable();
  [v9 setTitle:v4];

  id v5 = MBLocalizedStringFromTable();
  [v9 setBody:v5];

  uint64_t v6 = MBLocalizedStringFromTable();
  [v9 setButton:v6];

  id v7 = +[MBUserNotificationManager sharedManager];
  id v8 = [(MBServiceManager *)self account];
  [v7 presentUserNotification:v9 account:v8];
}

- (void)_prepareForBackgroundRestore
{
  id v3 = [(MBServiceAccount *)self->_account persona];
  id v5 = [v3 userIncompleteRestoreDirectory];

  id v4 = [v5 stringByAppendingPathComponent:@"/var/mobile/Library/Preferences/com.apple.MobileBackup.plist"];
  [(MBServiceRestoreSession *)self->_restoreSession saveAtPath:v4];
}

- (BOOL)_startBackgroundRestoreWithSettingsContext:(id)a3 delegateContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 account];

  if (v10)
  {
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 1;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v28 = 0x3032000000;
    uint64_t v29 = sub_10018B140;
    uint64_t v30 = sub_10018B150;
    id v31 = 0;
    stateQueue = self->_stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001952D4;
    block[3] = &unk_100415428;
    void block[4] = self;
    id v19 = v8;
    p_long long buf = &buf;
    id v22 = &v23;
    id v20 = v9;
    dispatch_sync(stateQueue, block);
    if (a5)
    {
      id v12 = *(void **)(*((void *)&buf + 1) + 40);
      if (v12) {
        *a5 = v12;
      }
    }
    BOOL v13 = *((unsigned char *)v24 + 24) != 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    long long v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v8 restoreMode];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Ignoring background restore request without account: %@", (uint8_t *)&buf, 0xCu);

      long long v17 = [v8 restoreMode];
      _MBLog();
    }
    if (a5)
    {
      +[MBError errorWithCode:210 format:@"No account"];
      BOOL v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (void)_updateProgressForCoordinatorWithBundleID:(id)a3 progress:(double)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[MBServiceManager _updateProgressForCoordinatorWithBundleID:progress:account:]", "MBServiceManager.m", 2333, "[self isKindOfClass: MBCKManager.class]");
  }
  id v10 = +[AppRestoreDispatcher shared];
  stateQueue = self->_stateQueue;
  id v15 = 0;
  id v12 = [v10 appRestorerForAccount:v9 stateQueue:stateQueue delegate:self error:&v15];
  id v13 = v15;

  if (v12)
  {
    [v12 updateProgressForCoordinatorWithBundleID:v8 progress:a4];
  }
  else
  {
    long long v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to find the app restore manager for %@ error: %@", buf, 0x16u);
      _MBLog();
    }
  }
}

- (void)_stopTrackingCoordinatorWithBundleID:(id)a3 success:(BOOL)a4 account:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[MBServiceManager _stopTrackingCoordinatorWithBundleID:success:account:]", "MBServiceManager.m", 2344, "[self isKindOfClass:MBCKManager.class]");
  }
  id v10 = +[AppRestoreDispatcher shared];
  stateQueue = self->_stateQueue;
  id v15 = 0;
  id v12 = [v10 appRestorerForAccount:v9 stateQueue:stateQueue delegate:self error:&v15];
  id v13 = v15;

  if (v12)
  {
    [v12 stopTrackingCoordinatorWithBundleID:v8 success:v6];
  }
  else
  {
    long long v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to find the app restore manager for %@ error: %@", buf, 0x16u);
      _MBLog();
    }
  }
}

- (void)_runRestoreWithSettingsContext:(id)a3 delegateContext:(id)a4
{
  id v44 = a3;
  id v7 = a4;
  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Initiating restore", (uint8_t *)&buf, 2u);
    _MBLog();
  }

  id v9 = [(MBServiceManager *)self account];
  id v10 = [v9 persona];
  [v10 cleanupRestoreDirectoriesWithError:0];

  id v11 = [MBServiceRestoreEngine alloc];
  id v12 = [(MBServiceManager *)self debugContext];
  id v13 = [(MBServiceRestoreEngine *)v11 initWithSettingsContext:v44 debugContext:v12];

  [(MBServiceRestoreEngine *)v13 setKeybagsByID:self->_restoreKeyBagsByID];
  long long v14 = MBAllServicePlugins();
  id v15 = [(MBServiceEngine *)v13 settingsContext];
  [v15 setPlugins:v14];

  [(NSMutableArray *)self->_engines addObject:v13];
  long long v16 = [(MBServiceEngine *)v13 service];
  [v16 setDelegate:self];

  if (v7) {
    [(NSMapTable *)self->_enginesByContext setObject:v13 forKey:v7];
  }
  id v17 = [v44 restoreMode];
  unsigned int v18 = [v17 isForeground];

  if (v18)
  {
    id v19 = MBGetDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Fetching account information from service.", (uint8_t *)&buf, 2u);
      _MBLog();
    }

    id v20 = [MBService alloc];
    id v21 = [v44 account];
    id v22 = [v21 reloaded];
    uint64_t v23 = [(MBService *)v20 initWithAccount:v22];
    id v61 = 0;
    id v24 = [(MBService *)v23 accountWithError:&v61];
    id v25 = v61;

    char v26 = MBGetDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v24;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Account %@", (uint8_t *)&buf, 0xCu);
      long long v43 = v24;
      _MBLog();
    }

    if (v24)
    {
      if ([v24 hasLoggingEnabled] && objc_msgSend(v24, "loggingEnabled")) {
        self->_serverLoggingOverride = 1;
      }
    }
    else
    {
      uint64_t v27 = MBGetDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Could not fetch account information from service: %@", (uint8_t *)&buf, 0xCu);
        long long v43 = 0;
        _MBLog();
      }
    }
    [(MBServiceManager *)self _enableForegroundHyperLogging];
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v63 = 0x3032000000;
  __int16 v64 = sub_10018B140;
  id v65 = sub_10018B150;
  v66 = objc_alloc_init(MBWatchdog);
  [*(id *)(*((void *)&buf + 1) + 40) setTimeout:3600.0];
  [*(id *)(*((void *)&buf + 1) + 40) setTimeoutBlock:&stru_100415448];
  [*(id *)(*((void *)&buf + 1) + 40) resume];
  uint64_t v55 = 0;
  uint64_t v56 = &v55;
  uint64_t v57 = 0x3032000000;
  long long v58 = sub_10018B140;
  id v59 = sub_10018B150;
  id v60 = [[MBPowerAssertion alloc] initWithName:@"restore" timeout:0.0];
  uint64_t v28 = *(void *)(*((void *)&buf + 1) + 40);
  uint64_t v29 = [(MBServiceEngine *)v13 settingsContext];
  [v29 setWatchdog:v28];

  uint64_t v30 = v56[5];
  id v31 = [(MBServiceEngine *)v13 settingsContext];
  [v31 setPowerAssertion:v30];

  id v32 = [v44 restoreMode];
  unsigned __int8 v33 = [v32 isForeground];

  char v34 = v33 ^ 1;
  if (!v7) {
    char v34 = 1;
  }
  if ((v34 & 1) == 0) {
    __assert_rtn("-[MBServiceManager _runRestoreWithSettingsContext:delegateContext:]", "MBServiceManager.m", 2411, "!isForeground || delegateContext == nil");
  }
  uint64_t v35 = [v44 account];
  if (!v35) {
    __assert_rtn("-[MBServiceManager _runRestoreWithSettingsContext:delegateContext:]", "MBServiceManager.m", 2414, "account");
  }
  uint64_t v36 = [(MBPersonaStateManager *)self->_personaState objectForKeyedSubscript:v35];
  serviceGroup = self->_serviceGroup;
  char v38 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100196148;
  block[3] = &unk_1004154E8;
  SEL v46 = v13;
  v47 = self;
  unsigned __int8 v54 = v33;
  uint64_t v52 = &v55;
  SEL v53 = a2;
  id v48 = v36;
  id v49 = v7;
  id v50 = v35;
  p_long long buf = &buf;
  id v39 = v35;
  id v40 = v7;
  id v41 = v36;
  long long v42 = v13;
  dispatch_group_async(serviceGroup, v38, block);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&buf, 8);
}

- (void)serviceDidHoldLock:(id)a3
{
  id v3 = [(MBServiceManager *)self lockManager];
  [v3 resetRenewalTimer];
}

- (void)lockManagerDidReleaseLock:(id)a3
{
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MBS: -lockManagerDidReleaseLock", v5, 2u);
    _MBLog();
  }

  [(MBServiceManager *)self _finishedRestore];
}

- (void)lockManager:(id)a3 failedToReleaseLockWithError:(id)a4
{
  id v5 = a4;
  BOOL v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "-lockManager:failedToReleaseLockWithError: %{public}@", buf, 0xCu);
    _MBLog();
  }

  [(MBServiceManager *)self _finishedRestore];
}

- (void)_obliterating
{
  id v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Obliteration notification received", buf, 2u);
    _MBLog();
  }

  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100197758;
  block[3] = &unk_100411128;
  void block[4] = self;
  dispatch_async(stateQueue, block);
}

- (void)_notifyDisplayWifi
{
  id v12 = +[MBUserNotification notification];
  [v12 setIdentifier:@"NeedsWifiAlert"];
  [v12 setInterval:86400.0];
  id v3 = objc_msgSend(@"MBS_WIFI_NEEDED_ALERT_TITLE", "mb_stringByAppendingGreenteaSuffix");
  id v4 = MBLocalizedStringFromTable();
  [v12 setTitle:v4];

  id v5 = objc_msgSend(@"MBS_WIFI_NEEDED_ALERT_DESCRIPTION", "mb_stringByAppendingGreenteaSuffix");
  BOOL v6 = MBLocalizedStringFromTable();
  [v12 setBody:v6];

  id v7 = objc_msgSend(@"MBS_WIFI_NEEDED_ALERT_SETTINGS_BUTTON", "mb_stringByAppendingGreenteaSuffix");
  id v8 = MBLocalizedStringFromTable();
  [v12 setButton:v8];

  id v9 = MBLocalizedStringFromTable();
  [v12 setAlternateButton:v9];

  [v12 setCompletionBlock:&stru_100415508];
  id v10 = +[MBUserNotificationManager sharedManager];
  id v11 = [(MBServiceManager *)self account];
  [v10 presentUserNotification:v12 account:v11];
}

- (void)reachabilityMonitorDidDetectWifiStatusChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (v3) {
      BOOL v6 = "Y";
    }
    else {
      BOOL v6 = "N";
    }
    *(_DWORD *)long long buf = 136315138;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Got reachability callback in delegate. hasWifi: %s", buf, 0xCu);
    _MBLog();
  }

  userNotificationQueue = self->_userNotificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100197B1C;
  block[3] = &unk_100411B10;
  BOOL v9 = v3;
  void block[4] = self;
  dispatch_async(userNotificationQueue, block);
}

- (void)_performToolWithBackupUDID:(id)a3 account:(id)a4 snapshotID:(unint64_t)a5 block:(id)a6
{
  id v10 = (void (**)(id, void *, void *))a6;
  id v11 = [(MBServiceManager *)self _settingsContextForBackupUDID:a3 account:a4];
  [v11 setSnapshotID:a5];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100197E6C;
  v14[3] = &unk_100415530;
  v14[4] = self;
  id v12 = objc_retainBlock(v14);
  id v13 = +[MBServiceTools toolsWithSettingsContext:v11];
  [v13 open];
  v10[2](v10, v13, v12);

  [v13 close];
}

- (BOOL)extractItemFromBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 toPath:(id)a7 account:(id)a8 connection:(id)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = sub_10018B140;
  char v38 = sub_10018B150;
  id v39 = 0;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100198178;
  v28[3] = &unk_100415558;
  id v32 = &v40;
  id v22 = v17;
  id v29 = v22;
  id v23 = v18;
  id v30 = v23;
  id v24 = v19;
  id v31 = v24;
  unsigned __int8 v33 = &v34;
  [(MBServiceManager *)self _performToolWithBackupUDID:v16 account:v20 snapshotID:a4 block:v28];
  int v25 = *((unsigned __int8 *)v41 + 24);
  if (a10 && !*((unsigned char *)v41 + 24))
  {
    *a10 = (id) v35[5];
    int v25 = *((unsigned __int8 *)v41 + 24);
  }
  BOOL v26 = v25 != 0;

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v26;
}

- (BOOL)addFileToBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 fromPath:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v37 = 0;
  char v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = sub_10018B140;
  uint64_t v35 = sub_10018B150;
  id v36 = 0;
  id v18 = [(MBServiceManager *)self account];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001983F8;
  v25[3] = &unk_100415558;
  id v29 = &v37;
  id v19 = v15;
  id v26 = v19;
  id v20 = v16;
  id v27 = v20;
  id v21 = v17;
  id v28 = v21;
  id v30 = &v31;
  [(MBServiceManager *)self _performToolWithBackupUDID:v14 account:v18 snapshotID:a4 block:v25];

  int v22 = *((unsigned __int8 *)v38 + 24);
  if (a8 && !*((unsigned char *)v38 + 24))
  {
    *a8 = (id) v32[5];
    int v22 = *((unsigned __int8 *)v38 + 24);
  }
  BOOL v23 = v22 != 0;

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v23;
}

- (BOOL)deleteItemFromBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_10018B140;
  id v30 = sub_10018B150;
  id v31 = 0;
  id v15 = [(MBServiceManager *)self account];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100198654;
  v21[3] = &unk_100415580;
  id v24 = &v32;
  id v16 = v13;
  id v22 = v16;
  id v17 = v14;
  id v23 = v17;
  int v25 = &v26;
  [(MBServiceManager *)self _performToolWithBackupUDID:v12 account:v15 snapshotID:a4 block:v21];

  int v18 = *((unsigned __int8 *)v33 + 24);
  if (a7 && !*((unsigned char *)v33 + 24))
  {
    *a7 = (id) v27[5];
    int v18 = *((unsigned __int8 *)v33 + 24);
  }
  BOOL v19 = v18 != 0;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v19;
}

- (BOOL)_shouldEnableHyperLogging
{
  char v7 = 0;
  BOOL v3 = [(MBServiceManager *)self account];
  id v4 = [v3 persona];
  unsigned int v5 = [v4 getBooleanValueForKey:@"UseHyperLogging" keyExists:&v7];

  if (v7) {
    return v5 != 0;
  }
  if (self->_serverLoggingOverride) {
    return 1;
  }
  return MBIsInternalInstall();
}

- (void)_enableForegroundHyperLogging
{
  if ([(MBServiceManager *)self _shouldEnableHyperLogging])
  {
    NSLog(@"Enabling full debug logging for foreground restore");
    id v2 = +[NSNumber numberWithInt:3];
    CFPreferencesSetAppValue(@"DebugLevel", v2, @"com.apple.mmcs");
  }
}

- (void)_enableBackgroundHyperLogging
{
  if ([(MBServiceManager *)self _shouldEnableHyperLogging])
  {
    NSLog(@"Enabling full debug logging for background restore");
    id v3 = objc_alloc_init((Class)NSFileManager);
    id v4 = [(MBServiceAccount *)self->_account persona];
    unsigned int v5 = [v4 userIncompleteRestoreDirectory];
    v73 = v4;
    BOOL v6 = [v4 sharedIncompleteRestoreDirectory];
    uint64_t v7 = [v5 stringByAppendingPathComponent:@"/var/mobile/Library/Preferences/com.apple.MobileBackup.plist"];
    if (([v3 fileExistsAtPath:v7] & 1) == 0) {
      [&__NSDictionary0__struct writeToFile:v7 atomically:1];
    }
    id v8 = +[NSMutableDictionary dictionaryWithContentsOfFile:v7];
    BOOL v9 = [v6 stringByAppendingPathComponent:@"var/root/Library/Preferences/com.apple.mmcs.plist"];
    if (([v3 fileExistsAtPath:v9] & 1) == 0) {
      [&__NSDictionary0__struct writeToFile:v9 atomically:1];
    }
    v71 = (void *)v7;
    id v10 = +[NSMutableDictionary dictionaryWithContentsOfFile:v9];
    id v11 = [v10 objectForKeyedSubscript:@"DebugLevel"];
    if (v11) {
      [v8 setObject:v11 forKeyedSubscript:@"SavedMMCSLogLevel"];
    }
    id v12 = +[NSNumber numberWithInt:3];
    [v10 setValue:v12 forKey:@"DebugLevel"];

    v70 = v10;
    [v10 writeToFile:v9 atomically:1];
    v74 = v5;
    id v13 = [v5 stringByAppendingPathComponent:@"var/mobile/Library/Preferences/.GlobalPreferences.plist"];
    if (([v3 fileExistsAtPath:v13] & 1) == 0) {
      [&__NSDictionary0__struct writeToFile:v13 atomically:1];
    }
    id v14 = +[NSMutableDictionary dictionaryWithContentsOfFile:v13];
    id v15 = [v14 objectForKeyedSubscript:@"ATLogLevel"];

    if (v15) {
      [v8 setObject:v15 forKeyedSubscript:@"SavedATLogLevel"];
    }
    id v16 = +[NSNumber numberWithInt:7];
    [v14 setValue:v16 forKey:@"ATLogLevel"];

    [v14 writeToFile:v13 atomically:1];
    id v69 = v13;
    id v17 = (const char *)[v69 fileSystemRepresentation];
    uid_t v18 = MBMobileUID();
    gid_t v19 = MBMobileUID();
    lchown(v17, v18, v19);
    v72 = v6;
    id v20 = [v6 stringByAppendingPathComponent:@"var/Managed Preferences/mobile/.GlobalPreferences.plist"];
    if (([v3 fileExistsAtPath:v20] & 1) == 0)
    {
      id v21 = [v20 stringByDeletingLastPathComponent];
      id v22 = MBMobileFileAttributes();
      [v3 createDirectoryAtPath:v21 withIntermediateDirectories:1 attributes:v22 error:0];

      [&__NSDictionary0__struct writeToFile:v20 atomically:1];
    }
    id v23 = +[NSMutableDictionary dictionaryWithContentsOfFile:v20];
    id v24 = [v23 objectForKeyedSubscript:@"ACLogLevel"];

    if (v24) {
      [v8 setObject:v24 forKeyedSubscript:@"SavedACLogLevel"];
    }
    int v25 = +[NSNumber numberWithInt:7];
    [v23 setValue:v25 forKey:@"ACLogLevel"];

    [v23 writeToFile:v20 atomically:1];
    id v68 = v20;
    uint64_t v26 = (const char *)[v68 fileSystemRepresentation];
    uid_t v27 = MBMobileUID();
    gid_t v28 = MBMobileUID();
    lchown(v26, v27, v28);
    if (MBIsInternalInstall())
    {
      id v29 = [v74 stringByAppendingPathComponent:@"var/mobile/Library/Preferences/com.apple.itunesstored.plist"];
      if (([v3 fileExistsAtPath:v29] & 1) == 0) {
        [&__NSDictionary0__struct writeToFile:v29 atomically:1];
      }
      id v30 = +[NSMutableDictionary dictionaryWithContentsOfFile:v29];
      uint64_t v31 = [v30 objectForKeyedSubscript:@"DebugFileLevel"];

      if (v31) {
        [v8 setObject:v31 forKeyedSubscript:@"SavediTunesLogLevel"];
      }
      uint64_t v32 = +[NSNumber numberWithInt:3];
      [v30 setValue:v32 forKey:@"DebugFileLevel"];

      [v30 writeToFile:v29 atomically:1];
      id v33 = v29;
      uint64_t v34 = (const char *)[v33 fileSystemRepresentation];
      char v35 = (void *)v31;
      uid_t v36 = MBMobileUID();
      gid_t v37 = MBMobileUID();
      uid_t v38 = v36;
      uint64_t v39 = v35;
      lchown(v34, v38, v37);
    }
    else
    {
      uint64_t v39 = v24;
    }
    [v8 writeToFile:v71 atomically:1];
    if (MBIsInternalInstall()) {
      goto LABEL_51;
    }
    id v65 = v39;
    char v40 = MBGetLogDir();
    id v41 = MBMobileFileAttributes();
    id v76 = 0;
    unsigned __int8 v42 = [v3 createDirectoryAtPath:v40 withIntermediateDirectories:1 attributes:v41 error:&v76];
    v67 = (__CFString *)v76;

    if ((v42 & 1) == 0)
    {
      char v43 = MBGetDefaultLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        CFStringRef v78 = v67;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Could not create MobileBackup log directory: %@", buf, 0xCu);
        id v61 = v67;
        _MBLog();
      }
    }
    id v44 = +[MBServiceCache systemPath];
    long long v45 = MBGetLogDir();
    SEL v46 = [v44 lastPathComponent];
    v47 = [v45 stringByAppendingPathComponent:v46];

    if ([v3 fileExistsAtPath:v44])
    {
      if (!link((const char *)[v44 fileSystemRepresentation], (const char *)objc_msgSend(objc_retainAutorelease(v47), "fileSystemRepresentation")))
      {
LABEL_36:
        __int16 v64 = v47;
        id v49 = MBGetLogDir();
        id v50 = [@"/var/mobile/Library/Logs/AirTraffic/airtraffic.log" lastPathComponent];
        id v63 = [v49 stringByAppendingPathComponent:v50];

        if ([v3 fileExistsAtPath:@"/var/mobile/Library/Logs/AirTraffic/airtraffic.log"])
        {
          v66 = v67;
          uint64_t v39 = v65;
        }
        else
        {
          long long v51 = +[NSData data];
          v75 = v67;
          unsigned __int8 v52 = [v51 writeToFile:@"/var/mobile/Library/Logs/AirTraffic/airtraffic.log" options:0 error:&v75];
          v66 = v75;

          uint64_t v39 = v65;
          if ((v52 & 1) == 0)
          {
            SEL v53 = MBGetDefaultLog();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              CFStringRef v78 = v66;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Could not create empty log file for atc: %@", buf, 0xCu);
              CFStringRef v62 = v66;
              _MBLog();
            }
          }
          unsigned __int8 v54 = (const char *)objc_msgSend(@"/var/mobile/Library/Logs/AirTraffic/airtraffic.log", "fileSystemRepresentation", v62);
          uid_t v55 = MBMobileUID();
          gid_t v56 = MBMobileUID();
          if (lchown(v54, v55, v56))
          {
            uint64_t v57 = MBGetDefaultLog();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              CFStringRef v78 = @"/var/mobile/Library/Logs/AirTraffic/airtraffic.log";
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "lchown failed for %@", buf, 0xCu);
              CFStringRef v62 = @"/var/mobile/Library/Logs/AirTraffic/airtraffic.log";
              _MBLog();
            }
          }
        }
        long long v58 = (const char *)objc_msgSend(@"/var/mobile/Library/Logs/AirTraffic/airtraffic.log", "fileSystemRepresentation", v62);
        id v59 = v63;
        if (link(v58, (const char *)[v59 fileSystemRepresentation]))
        {
          id v60 = MBGetDefaultLog();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "Could not create link to airtraffic.log. link() failed.", buf, 2u);
            _MBLog();
          }
        }
LABEL_51:

        return;
      }
      id v48 = MBGetDefaultLog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Could not create link for cache.db. link() failed.", buf, 2u);
LABEL_34:
        _MBLog();
      }
    }
    else
    {
      id v48 = MBGetDefaultLog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Could not create link for cache.db. File does not exist.", buf, 2u);
        goto LABEL_34;
      }
    }

    goto LABEL_36;
  }
}

- (void)_disableHyperLogging
{
  CFStringRef v2 = (const __CFString *)kMBMobileUserName;
  id v3 = (void *)CFPreferencesCopyValue(@"SavedMMCSLogLevel", @"com.apple.MobileBackup", kMBMobileUserName, kCFPreferencesAnyHost);
  CFPreferencesSetValue(@"SavedMMCSLogLevel", 0, @"com.apple.MobileBackup", v2, kCFPreferencesAnyHost);
  CFPreferencesSetAppValue(@"DebugLevel", v3, @"com.apple.mmcs");
  CFPreferencesAppSynchronize(@"com.apple.mmcs");
  value = (void *)CFPreferencesCopyValue(@"SavedATLogLevel", @"com.apple.MobileBackup", v2, kCFPreferencesAnyHost);

  CFPreferencesSetValue(@"SavedATLogLevel", 0, @"com.apple.MobileBackup", v2, kCFPreferencesAnyHost);
  CFPreferencesSetValue(@"ATLogLevel", value, kCFPreferencesAnyApplication, v2, kCFPreferencesCurrentHost);
  CFPreferencesAppSynchronize(kCFPreferencesAnyApplication);
  id v4 = +[NSMutableDictionary dictionaryWithContentsOfFile:@"/var/Managed Preferences/mobile/.GlobalPreferences.plist"];
  [v4 removeObjectForKey:@"ACLogLevel"];
  [v4 writeToFile:@"/var/Managed Preferences/mobile/.GlobalPreferences.plist" atomically:1];
  if (MBIsInternalInstall())
  {
    CFPropertyListRef v5 = CFPreferencesCopyValue(@"SavediTunesLogLevel", @"com.apple.MobileBackup", v2, kCFPreferencesAnyHost);

    CFPreferencesSetValue(@"SavediTunesLogLevel", 0, @"com.apple.MobileBackup", v2, kCFPreferencesAnyHost);
    CFPreferencesSetValue(@"DebugFileLevel", v5, @"com.apple.itunesstored", v2, kCFPreferencesCurrentHost);
    CFPreferencesAppSynchronize(@"com.apple.itunesstored");
    notify_post("com.apple.itunesstored.defaultschange");
    value = (void *)v5;
  }
  CFPreferencesSynchronize(@"com.apple.MobileBackup", v2, kCFPreferencesAnyHost);
}

- (MBDebugContext)debugContext
{
  CFStringRef v2 = self;
  objc_sync_enter(v2);
  if (!v2->_debugContext)
  {
    uint64_t v3 = +[MBDebugContext defaultDebugContext];
    debugContext = v2->_debugContext;
    v2->_debugContext = (MBDebugContext *)v3;
  }
  objc_sync_exit(v2);

  CFPropertyListRef v5 = v2->_debugContext;
  return v5;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)MBServiceManager;
  uint64_t v3 = [(MBServiceManager *)&v10 description];
  engines = self->_engines;
  CFPropertyListRef v5 = [(MBServiceRestoreSession *)self->_restoreSession backupUDID];
  unint64_t v6 = [(MBServiceRestoreSession *)self->_restoreSession snapshotID];
  uint64_t v7 = [(MBServiceManager *)self delegate];
  id v8 = +[NSString stringWithFormat:@"{ %@ engine = %@ backupUUID = %@ snapshotID = %d delegate = %@ }", v3, engines, v5, v6, v7];

  return v8;
}

- (BOOL)allowiTunesBackup
{
  char v7 = 0;
  CFStringRef v2 = [(MBServiceManager *)self account];
  uint64_t v3 = [v2 persona];
  unsigned int v4 = [v3 getBooleanValueForKey:@"AllowiTunesBackup" keyExists:&v7];

  if (v7) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

- (void)setAllowiTunesBackup:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v4 = [(MBServiceManager *)self account];
  BOOL v5 = [v4 persona];
  uint64_t v6 = +[NSNumber numberWithBool:v3];
  [v5 setPreferencesValue:v6 forKey:@"AllowiTunesBackup"];

  char v7 = +[MBLockdown connect];
  id v8 = +[NSNumber numberWithBool:v3];
  id v12 = 0;
  LOBYTE(v6) = [v7 setObject:v8 forDomain:@"com.apple.mobile.backup" andKey:@"CloudBackupEnabled" withError:&v12];
  id v9 = v12;

  if ((v6 & 1) == 0)
  {
    objc_super v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error setting lockdown cloud backup enabled key: %@", buf, 0xCu);
      id v11 = v9;
      _MBLog();
    }
  }
  objc_msgSend(v7, "disconnect", v11);
}

- (BOOL)startDeviceTransferWithTaskType:(int64_t)a3 sessionInfo:(id)a4 connection:(id)a5 error:(id *)a6
{
  return 0;
}

- (BOOL)cancelDeviceTransferWithTaskType:(int64_t)a3 connection:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)resumeDeviceTransferWithTaskType:(int64_t)a3 connection:(id)a4 error:(id *)a5
{
  return 0;
}

- (void)startPreflightWithConnection:(id)a3 completion:(id)a4
{
  id v6 = a4;
  [(MBServiceManager *)self doesNotRecognizeSelector:a2];
  (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
}

- (void)startKeychainTransferWithConnection:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  [(MBServiceManager *)self doesNotRecognizeSelector:a2];
  v6[2](v6, 0);
}

- (void)startKeychainDataTransferWithConnection:(id)a3 completion:(id)a4
{
  id v6 = a4;
  [(MBServiceManager *)self doesNotRecognizeSelector:a2];
  (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
}

- (void)startKeychainDataImportWithKeychainInfo:(id)a3 connection:(id)a4 completion:(id)a5
{
  char v7 = (void (**)(id, void))a5;
  [(MBServiceManager *)self doesNotRecognizeSelector:a2];
  v7[2](v7, 0);
}

- (void)startDataTransferWithPreflightInfo:(id)a3 connection:(id)a4 completion:(id)a5
{
  char v7 = (void (**)(id, void))a5;
  [(MBServiceManager *)self doesNotRecognizeSelector:a2];
  v7[2](v7, 0);
}

- (BOOL)startScanForBundleIDs:(id)a3 account:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)startRestoreForSnapshot:(id)a3 options:(id)a4 account:(id)a5 connection:(id)a6 error:(id *)a7
{
  return 0;
}

- (id)nextBackupSizeInfoWithAccount:(id)a3
{
  return 0;
}

- (id)pendingSnapshotForCurrentDeviceAndAccount:(id)a3 error:(id *)a4
{
  return 0;
}

- (unint64_t)nextBackupSizeWithAccount:(id)a3
{
  return 0;
}

- (void)accountChanged:(id)a3
{
}

- (void)boostBackgroundRestoreWithAccount:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  [(MBServiceManager *)self doesNotRecognizeSelector:a2];
  v6[2](v6, 0);
}

- (BOOL)prepareForBackgroundRestoreWithAccount:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)inheritSnapshotWithAccount:(id)a3 fromSnapshot:(id)a4 fromDevice:(id)a5 error:(id *)a6
{
  return 0;
}

- (void)postFollowUpForRestoreFailedForAccount:(id)a3 failedDomainNames:(id)a4
{
}

- (MBServiceRestoreSession)restoreSession
{
  return self->_restoreSession;
}

- (NSDictionary)restoreKeyBagsByID
{
  return self->_restoreKeyBagsByID;
}

- (void)setDebugContext:(id)a3
{
}

- (NSMutableSet)batchRestoreOps
{
  return self->_batchRestoreOps;
}

- (void)setBatchRestoreOps:(id)a3
{
}

- (void)setAccount:(id)a3
{
}

- (int)serviceState
{
  return self->_serviceState;
}

- (MBPrebuddyFollowUpController)prebuddyFollowUpController
{
  return self->_prebuddyFollowUpController;
}

- (void)setPrebuddyFollowUpController:(id)a3
{
}

- (void)setLockManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockManager, 0);
  objc_storeStrong((id *)&self->_prebuddyFollowUpController, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_batchRestoreOps, 0);
  objc_storeStrong((id *)&self->_debugContext, 0);
  objc_storeStrong((id *)&self->_serviceEncryptionManager, 0);
  objc_storeStrong((id *)&self->_restoreTransaction, 0);
  objc_storeStrong((id *)&self->_restoreSession, 0);
  objc_storeStrong((id *)&self->_lowDiskSource, 0);
  objc_storeStrong((id *)&self->_userNotificationQueue, 0);
  objc_storeStrong((id *)&self->_reachabilityMonitor, 0);
  objc_storeStrong((id *)&self->_restoreKeyBagsByID, 0);
  objc_storeStrong((id *)&self->_restoreQosByContext, 0);
  objc_storeStrong((id *)&self->_enginesByContext, 0);
  objc_storeStrong((id *)&self->_personaState, 0);
  objc_storeStrong((id *)&self->_engines, 0);
  objc_storeStrong((id *)&self->_serviceGroup, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
}

@end