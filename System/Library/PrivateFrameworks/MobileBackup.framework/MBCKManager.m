@interface MBCKManager
+ (MBCKManager)sharedInstance;
+ (double)inexpensiveCellularBalance;
+ (id)_removeIncompatibleSnapshotsWithAccountType:(int64_t)a3 device:(id)a4 snapshots:(id)a5;
+ (id)loadRestoreStateInfoWithAccount:(id)a3;
+ (id)restoreInfoForAccount:(id)a3;
+ (void)saveRestoreStateInfo:(id)a3 account:(id)a4;
- ($1C6001547D93A6C6CE4901F2C331F3E5)networkConnectivity;
- (BOOL)_ckStartBackgroundRestoreWithSettingsContext:(id)a3 delegateContext:(id)a4 error:(id *)a5;
- (BOOL)_discountCameraRollQuotaForBackupUDID:(id)a3 account:(id)a4 operationTracker:(id)a5 error:(id *)a6;
- (BOOL)_isInitialMegaBackupCompleted;
- (BOOL)_isMegaBackupMode;
- (BOOL)_isRestoreFromMegaBackup:(id)a3 error:(id *)a4;
- (BOOL)_isRestoreOnCellularSupported;
- (BOOL)_refreshLockdownLastBackupDateWithAccount:(id)a3;
- (BOOL)_restoreFileWithPath:(id)a3 isBatch:(BOOL)a4 context:(id)a5 account:(id)a6 error:(id *)a7;
- (BOOL)_startScanWithSettingsContext:(id)a3 error:(id *)a4;
- (BOOL)acquireLockWithBackupUDID:(id)a3 account:(id)a4 owner:(id)a5 timeout:(double)a6 connection:(id)a7 error:(id *)a8;
- (BOOL)airTrafficDidFinishRestore;
- (BOOL)allowiTunesBackup;
- (BOOL)cancelApplicationRestoreWithBundleID:(id)a3 error:(id *)a4;
- (BOOL)cancelDeviceTransferWithTaskType:(int64_t)a3 connection:(id)a4 error:(id *)a5;
- (BOOL)clearPendingSnapshotForBackupUUID:(id)a3 enabledState:(BOOL)a4 account:(id)a5 error:(id *)a6;
- (BOOL)closeRestorePlanForAccount:(id)a3 snapshotUUID:(id)a4 error:(id *)a5;
- (BOOL)countCameraRollQuota;
- (BOOL)countCameraRollQuotaForBackupUDID:(id)a3 error:(id *)a4;
- (BOOL)deleteAccountWithServiceAccount:(id)a3 error:(id *)a4;
- (BOOL)deleteBackupUDID:(id)a3 disableIfCurrentDevice:(BOOL)a4 account:(id)a5 connection:(id)a6 error:(id *)a7;
- (BOOL)discountCameraRollQuotaForBackupUDID:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6;
- (BOOL)discountCameraRollQuotaWithAccount:(id)a3 connection:(id)a4 error:(id *)a5;
- (BOOL)extractItemFromBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 toPath:(id)a7 account:(id)a8 connection:(id)a9 error:(id *)a10;
- (BOOL)hardwareModelNeedsH8Workaround:(id)a3;
- (BOOL)inheritSnapshotWithAccount:(id)a3 fromSnapshot:(id)a4 fromDevice:(id)a5 error:(id *)a6;
- (BOOL)isBackgroundRestoringAccount:(id)a3;
- (BOOL)isBackgroundRestoringAnyAccount;
- (BOOL)isBackupEnabledForDomainName:(id)a3 account:(id)a4;
- (BOOL)isEngineInProgressForBundleID:(id)a3 percentComplete:(double)a4;
- (BOOL)isIdle;
- (BOOL)isPowerBudgetAvailableForRestore;
- (BOOL)isPrebuddyBackupInProgress:(id)a3;
- (BOOL)isRestoringAccount:(id)a3;
- (BOOL)mergeSnapshots:(id)a3 backupUUID:(id)a4 account:(id)a5 connection:(id)a6 error:(id *)a7;
- (BOOL)pinSnapshotID:(unint64_t)a3 backupUDID:(id)a4 account:(id)a5 connection:(id)a6 error:(id *)a7;
- (BOOL)prepareForBackgroundRestoreWithAccount:(id)a3 error:(id *)a4;
- (BOOL)releaseLockWithBackupUDID:(id)a3 account:(id)a4 owner:(id)a5 connection:(id)a6 error:(id *)a7;
- (BOOL)removeDomainName:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6;
- (BOOL)requestMegaBackupExpirationDate:(id)a3 account:(id)a4 error:(id *)a5;
- (BOOL)resetCacheWithAccount:(id)a3 error:(id *)a4;
- (BOOL)restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 qos:(id)a5 context:(id)a6 account:(id)a7 error:(id *)a8;
- (BOOL)restoreBookWithPath:(id)a3 context:(id)a4 account:(id)a5 error:(id *)a6;
- (BOOL)restoreDataExistsForApplicationWithBundleID:(id)a3 size:(unint64_t *)a4 account:(id)a5;
- (BOOL)restoreFileExistsWithPath:(id)a3 account:(id)a4;
- (BOOL)restoreFileWithPath:(id)a3 context:(id)a4 account:(id)a5 error:(id *)a6;
- (BOOL)restoreFilesWithPaths:(id)a3 context:(id)a4 account:(id)a5 error:(id *)a6;
- (BOOL)restoreSupportsBatching;
- (BOOL)resumeDeviceTransferWithTaskType:(int64_t)a3 connection:(id)a4 error:(id *)a5;
- (BOOL)saveBackgroundRestoreCellularAccess:(id)a3 account:(id)a4 error:(id *)a5;
- (BOOL)saveKeybagsForBackupUDID:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6;
- (BOOL)setupBackupWithPasscode:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6;
- (BOOL)setupRestorePlanForAccount:(id)a3 snapshotUUID:(id)a4 error:(id *)a5;
- (BOOL)shouldInheritBackupsFromDevice:(id)a3 toDevice:(id)a4 error:(id *)a5;
- (BOOL)startBackupWithOptions:(id)a3 reason:(int64_t)a4 xpcActivity:(id)a5 account:(id)a6 connection:(id)a7 error:(id *)a8;
- (BOOL)startDeviceTransferWithTaskType:(int64_t)a3 sessionInfo:(id)a4 connection:(id)a5 error:(id *)a6;
- (BOOL)startRestoreForSnapshot:(id)a3 options:(id)a4 account:(id)a5 connection:(id)a6 error:(id *)a7;
- (BOOL)startScanForBundleIDs:(id)a3 account:(id)a4 error:(id *)a5;
- (BOOL)startScanWithAccount:(id)a3 error:(id *)a4;
- (BOOL)unpinSnapshotID:(unint64_t)a3 backupUDID:(id)a4 account:(id)a5 connection:(id)a6 error:(id *)a7;
- (BOOL)wasBackupEnabledForMegaBackup:(id)a3;
- (MBCKDatabaseManager)databaseManager;
- (MBCKManager)init;
- (MBNetworkPathMonitor)networkPathMonitor;
- (MBThermalPressureMonitor)thermalPressureMonitor;
- (MBXPCActivityTimer)prebuddyFollowUpTimer;
- (NSDictionary)cachedBackupsByUDID;
- (NSMutableDictionary)cacheTrackersByAccountIdentifier;
- (NSObject)accountObserver;
- (OS_dispatch_queue)quotaManagerQueue;
- (_TtC7backupd19MBDryRestoreManager)dryRestoreManager;
- (id)_backupEngineWithReason:(int64_t)a3 settingsContext:(id)a4 account:(id)a5;
- (id)_cacheTrackerWithAccount:(id)a3;
- (id)_ckSettingsContextForBackupUDID:(id)a3 account:(id)a4;
- (id)_ckSettingsContextForRestoreWithDeviceUUID:(id)a3 account:(id)a4 delegateContext:(id)a5;
- (id)_copyBackupStateInfoForInitialMegaBackup:(BOOL)a3 account:(id)a4;
- (id)_defaultMegaBackupExpirationDate;
- (id)_domainDisplayNamesForFailedDomainsWithAccount:(id)a3;
- (id)_findTargetDeviceTransferEngineWithConnection:(id)a3 error:(id *)a4;
- (id)_megaBackupExpirationDate;
- (id)_restoreEngineWithRestoreType:(int)a3 settingsContext:(id)a4 debugContext:(id)a5 excludedAppBundleIDs:(id)a6;
- (id)_sanitizeError:(id)a3;
- (id)_snapshotForSnapshotID:(unint64_t)a3 backupUDID:(id)a4 cached:(BOOL)a5 operationTracker:(id)a6 error:(id *)a7;
- (id)_startNetworkPathMonitor;
- (id)allRestrictedDomainNames:(id)a3 account:(id)a4;
- (id)backgroundRestoreInfoWithAccount:(id)a3;
- (id)backupStateInfoForInitialMegaBackup:(BOOL)a3 account:(id)a4;
- (id)cellularAccessForRestoreType:(int)a3 account:(id)a4;
- (id)deviceLockInfosWithAccount:(id)a3 connection:(id)a4 error:(id *)a5;
- (id)disabledDomainInfosForAccount:(id)a3;
- (id)fetchBackgroundRestoreCellularAccessForAccount:(id)a3 error:(id *)a4;
- (id)fetchDeviceForRestoreWithUUID:(id)a3 tracker:(id)a4 isForegroundRestore:(BOOL)a5 cache:(id)a6 error:(id *)a7;
- (id)fetchPluginFieldsForLockManger:(id)a3;
- (id)fetchRestorableSnapshotsForAccount:(id)a3 connection:(id)a4 error:(id *)a5;
- (id)filesForSnapshotID:(unint64_t)a3 backupUDID:(id)a4 account:(id)a5 connection:(id)a6 error:(id *)a7;
- (id)getAppleIDsForBackupUDID:(id)a3 account:(id)a4 snapshotID:(unint64_t)a5 activeAppleID:(id *)a6 connection:(id)a7 error:(id *)a8;
- (id)getAppleIDsMapForBackupUDID:(id)a3 account:(id)a4 snapshotID:(unint64_t)a5 activeAppleID:(id *)a6 connection:(id)a7 error:(id *)a8;
- (id)getBackupListWithFiltering:(BOOL)a3 account:(id)a4 connection:(id)a5 error:(id *)a6;
- (id)getBackupListWithOperationTracker:(id)a3 shouldFilter:(BOOL)a4 error:(id *)a5;
- (id)getBuddyDataStashForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 account:(id)a5 connection:(id)a6 error:(id *)a7;
- (id)journalForBackupUUID:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6;
- (id)journalLastModifiedForBackupUUID:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6;
- (id)loadRestoreStateWithAccount:(id)a3;
- (id)nextBackupSizeInfoWithAccount:(id)a3;
- (id)openCacheWithAccount:(id)a3 accessType:(int)a4 cached:(BOOL)a5 error:(id *)a6;
- (id)openCacheWithAccount:(id)a3 accessType:(int)a4 error:(id *)a5;
- (id)pendingSnapshotForCurrentDeviceAndAccount:(id)a3 error:(id *)a4;
- (id)prebuddyFollowUpTimerForAccount:(id)a3;
- (id)reservedBackupSizeListWithAccount:(id)a3 connection:(id)a4 error:(id *)a5;
- (id)restoreFilesForDomain:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 range:(_NSRange)a6 account:(id)a7 error:(id *)a8;
- (id)restorePlanForAccount:(id)a3 snapshotUUID:(id)a4 error:(id *)a5;
- (id)snapshotForSnapshotID:(unint64_t)a3 backupUDID:(id)a4 operationTracker:(id)a5 error:(id *)a6;
- (id)synchronizeFileListsWithDeviceUUID:(id)a3 commitID:(id)a4 account:(id)a5 error:(id *)a6;
- (unint64_t)_snapshotIDForSnapshotUUID:(id)a3 backupUDID:(id)a4 operationTracker:(id)a5 error:(id *)a6;
- (unint64_t)nextBackupSizeWithAccount:(id)a3;
- (unint64_t)restoreTelemetryID;
- (void)_airTrafficFinishedRestoring;
- (void)_alertUserOfFinishedRestoreForAccount:(id)a3;
- (void)_cancelBackgroundRestoreTTRTimerWithAccount:(id)a3;
- (void)_cancelBackupAndScanEnginesWithAccount:(id)a3 timeout:(unint64_t)a4 completion:(id)a5;
- (void)_cancelBackupAndScanEnginesWithTimeout:(unint64_t)a3 completion:(id)a4;
- (void)_cancelBackupEngineWithError:(id)a3 account:(id)a4 connection:(id)a5;
- (void)_cancelDelayedBackgroundRestoreTimerWithAccount:(id)a3;
- (void)_ckClearRestoreSessionWithAccount:(id)a3;
- (void)_clearRestoreSessionWithAccount:(id)a3;
- (void)_didUpdateBackupProgress:(float)a3 estimatedTimeRemaining:(unint64_t)a4 bytesRemaining:(int64_t)a5 engineState:(id)a6 stateInfo:(id)a7 isInitialMegaBackup:(BOOL)a8;
- (void)_finishRestoreWithAccount:(id)a3 cancelled:(BOOL)a4;
- (void)_finishedRestoreWithAccount:(id)a3 reason:(id)a4;
- (void)_handleAccountAvailable;
- (void)_handleNetworkPathUpdateWithPathType:(int)a3 state:(id)a4;
- (void)_keyBagIsLockingWithAccount:(id)a3;
- (void)_keychainSyncStatusDidChange;
- (void)_loadRestoreState;
- (void)_migrateMobileBackupDatabaseFromRootToMobile;
- (void)_retryAppDataDownloadsWithConnectivity:(id)a3 account:(id)a4;
- (void)_saveForegroundRestoreCellularAccess:(id)a3 account:(id)a4;
- (void)_scheduleBackgroundRestoreTimeoutTTRWithAccount:(id)a3;
- (void)_scheduleDelayedBackgroundRestoreTimerWithAccount:(id)a3;
- (void)_setIsInitialMegaBackupCompleted:(BOOL)a3;
- (void)_setMegaBackupExpirationDate:(id)a3 account:(id)a4;
- (void)_setMegaBackupMode:(BOOL)a3;
- (void)_startBackupWithEngine:(id)a3 account:(id)a4;
- (void)_startEngine:(id)a3 delegateContext:(id)a4;
- (void)_startRestoreWithEngine:(id)a3 delegateContext:(id)a4;
- (void)_startSourceDeviceTransferWithSessionInfo:(id)a3 connection:(id)a4 personaIdentifier:(id)a5 completion:(id)a6;
- (void)_startTargetDeviceTransferWithSessionInfo:(id)a3 connection:(id)a4 personaIdentifier:(id)a5 completion:(id)a6;
- (void)_syncBackupEnabledWithAccount:(id)a3 connection:(id)a4;
- (void)_updateLockdownKeysForAccountState:(id)a3;
- (void)_updateMegaBackupStatus:(int64_t)a3 account:(id)a4;
- (void)_waitForRestoreConditions:(id)a3;
- (void)_warnUserOfPowerBudgetSuspendingRestoreForAccount:(id)a3;
- (void)accountChanged:(id)a3;
- (void)boostBackgroundRestoreWithAccount:(id)a3 completionHandler:(id)a4;
- (void)cancelBackgroundRestoreWithAccount:(id)a3;
- (void)cancelBackupEngineWithError:(id)a3 connection:(id)a4;
- (void)cancelDeviceTransferWithConnection:(id)a3;
- (void)cancelEnginesWithAccount:(id)a3 connection:(id)a4;
- (void)cancelRestoreEnginesWithReason:(int64_t)a3 connection:(id)a4;
- (void)clearPrebuddyWithAccount:(id)a3 accountSignOut:(BOOL)a4;
- (void)clearRestoreSessionWithAccount:(id)a3;
- (void)dealloc;
- (void)didFinishAppRestoresWithAccount:(id)a3 cancelled:(BOOL)a4;
- (void)exitMegaBackupModeWithAccount:(id)a3;
- (void)fetchNetworkConnectivityWithBlock:(id)a3;
- (void)finishAirTrafficRestoreWithAccount:(id)a3;
- (void)keyBagIsLocking;
- (void)keyBagIsUnlocked;
- (void)keybagIsUnlockedWithAccount:(id)a3 completion:(id)a4;
- (void)lockManager:(id)a3 failedToReleaseLockWithError:(id)a4;
- (void)lockManagerDidReleaseLock:(id)a3;
- (void)postFollowUpForRestoreFailedForAccount:(id)a3 failedDomainNames:(id)a4;
- (void)prebuddyBackupDeletedWithAccount:(id)a3;
- (void)prioritizeRestoreFileWithPath:(id)a3 account:(id)a4;
- (void)retryAppDataDownloadsWithNetworkConnectivity:(id)a3;
- (void)saveFailedBackupShadowStateWithAccount:(id)a3;
- (void)setAccountObserver:(id)a3;
- (void)setAllowiTunesBackup:(BOOL)a3;
- (void)setBackupEnabled:(BOOL)a3 account:(id)a4 connection:(id)a5;
- (void)setBackupEnabled:(BOOL)a3 forDomainName:(id)a4 account:(id)a5;
- (void)setCacheTrackersByAccountIdentifier:(id)a3;
- (void)setCachedBackupsByUDID:(id)a3;
- (void)setNetworkPathMonitor:(id)a3;
- (void)setPrebuddyFollowUpTimer:(id)a3;
- (void)setQuotaManagerQueue:(id)a3;
- (void)setRestoreQualityOfService:(int64_t)a3 account:(id)a4 connection:(id)a5;
- (void)setRestoreSessionWithBackupUDID:(id)a3 snapshotUUID:(id)a4 account:(id)a5 connection:(id)a6;
- (void)setThermalPressureMonitor:(id)a3;
- (void)setUpXPCEventHandler;
- (void)startDataTransferWithPreflightInfo:(id)a3 connection:(id)a4 completion:(id)a5;
- (void)startKeychainDataImportWithKeychainInfo:(id)a3 connection:(id)a4 completion:(id)a5;
- (void)startKeychainDataTransferWithConnection:(id)a3 completion:(id)a4;
- (void)startKeychainTransferWithConnection:(id)a3 completion:(id)a4;
- (void)startPreflightWithConnection:(id)a3 completion:(id)a4;
- (void)submitMegaLifeCycleTelemetriesWithAccount:(id)a3;
- (void)syncBackupEnabledWithAccount:(id)a3 connection:(id)a4;
- (void)updateMegaBackupExpirationDate:(id)a3 account:(id)a4;
- (void)updatePrebuddyFollowUp:(id)a3;
- (void)userLanguageDidChange;
@end

@implementation MBCKManager

+ (MBCKManager)sharedInstance
{
  if (qword_1004823F0 != -1) {
    dispatch_once(&qword_1004823F0, &stru_100411FD8);
  }
  v2 = (void *)qword_1004823E8;
  return (MBCKManager *)v2;
}

- (MBCKManager)init
{
  v24.receiver = self;
  v24.super_class = (Class)MBCKManager;
  v2 = [(MBServiceManager *)&v24 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("_ICQMegaBackupManager queue", v3);
    quotaManagerQueue = v2->_quotaManagerQueue;
    v2->_quotaManagerQueue = (OS_dispatch_queue *)v4;

    v6 = [MBCKDatabaseManager alloc];
    v7 = +[MBBehaviorOptions sharedOptions];
    v8 = -[MBCKDatabaseManager initWithSandbox:](v6, "initWithSandbox:", [v7 useSandboxCKContainer]);
    databaseManager = v2->_databaseManager;
    v2->_databaseManager = v8;

    uint64_t v10 = objc_opt_new();
    cacheTrackersByAccountIdentifier = v2->_cacheTrackersByAccountIdentifier;
    v2->_cacheTrackersByAccountIdentifier = (NSMutableDictionary *)v10;

    v2->_restoreTelemetryID = arc4random_uniform(0xFFFFu);
    stateQueue = v2->super._stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AC350;
    block[3] = &unk_100411128;
    v23 = v2;
    dispatch_sync(stateQueue, block);
  }
  if ([(MBServiceManager *)v2 isPrebuddyMode])
  {
    v13 = [(MBCKManager *)v2 _megaBackupExpirationDate];
    v14 = [(MBServiceManager *)v2 prebuddyFollowUpController];
    v15 = [v14 megaBackupExpirationDate];

    if (v15) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = v13 == 0;
    }
    if (!v16)
    {
      v17 = [(MBServiceManager *)v2 prebuddyFollowUpController];
      [v17 setMegaBackupExpirationDate:v13];
    }
    v18 = [(MBServiceManager *)v2 account];
    uint64_t v19 = [(MBCKManager *)v2 prebuddyFollowUpTimerForAccount:v18];
    prebuddyFollowUpTimer = v2->_prebuddyFollowUpTimer;
    v2->_prebuddyFollowUpTimer = (MBXPCActivityTimer *)v19;
  }
  return v2;
}

- (void)dealloc
{
  if (self->_accountObserver)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_accountObserver];
  }
  dispatch_queue_t v4 = [(MBServiceManager *)self account];
  [(MBCKManager *)self _cancelDelayedBackgroundRestoreTimerWithAccount:v4];

  v5 = [(MBServiceManager *)self account];
  [(MBCKManager *)self _cancelBackgroundRestoreTTRTimerWithAccount:v5];

  v6.receiver = self;
  v6.super_class = (Class)MBCKManager;
  [(MBServiceManager *)&v6 dealloc];
}

- (BOOL)_isRestoreOnCellularSupported
{
  [(MBCKManager *)self networkConnectivity];
  return (v2 >> 2) & 1;
}

- (void)_migrateMobileBackupDatabaseFromRootToMobile
{
  unint64_t v2 = +[NSMutableArray arrayWithObject:@"cloudkit_cache.db"];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v3 = MBSQLiteJournalSuffixes();
  id v4 = [v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [@"cloudkit_cache.db" stringByAppendingString:*(void *)(*((void *)&v21 + 1) + 8 * (void)v7)];
        [v2 addObject:v8];

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v5);
  }

  v9 = +[NSFileManager defaultManager];
  uint64_t v10 = MBGetCacheDir();
  id v20 = 0;
  unsigned __int8 v11 = objc_msgSend(v9, "mb_migrateIfNeededFromSource:sourceSubPaths:toDestination:destinationSubPaths:error:", @"/var/root/Library/Caches/Backup", v2, v10, v2, &v20);
  id v12 = v20;

  if ((v11 & 1) == 0)
  {
    v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v26 = @"cloudkit_cache.db";
      __int16 v27 = 2112;
      id v28 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Error migrating %@ from root to mobile: %@", buf, 0x16u);
      CFStringRef v17 = @"cloudkit_cache.db";
      id v18 = v12;
      _MBLog();
    }
  }
  id v19 = v12;
  unsigned __int8 v14 = objc_msgSend(v9, "mb_migrateIfNeededFromSource:sourceSubPaths:toDestination:destinationSubPaths:error:", @"/var/root/Library/Preferences", &off_10043B160, @"/var/mobile/Library/Preferences", &off_10043B178, &v19, v17, v18);
  id v15 = v19;

  if ((v14 & 1) == 0)
  {
    BOOL v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v26 = @"com.apple.MobileBackup.plist";
      __int16 v27 = 2112;
      id v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "Error migrating %@ from root to mobile: %@", buf, 0x16u);
      _MBLog();
    }
  }
}

- (void)setRestoreSessionWithBackupUDID:(id)a3 snapshotUUID:(id)a4 account:(id)a5 connection:(id)a6
{
  uint64_t v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v63 = a6;
  if (!v12) {
    __assert_rtn("-[MBCKManager setRestoreSessionWithBackupUDID:snapshotUUID:account:connection:]", "MBCKManager.m", 292, "serviceAccount");
  }
  v13 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v12];
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x3032000000;
  v85 = sub_1000AD5B8;
  v86 = sub_1000AD5C8;
  id v87 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AD5D0;
  block[3] = &unk_100412050;
  v81 = &v82;
  id v15 = v13;
  id v80 = v15;
  dispatch_sync(stateQueue, block);
  if (v83[5])
  {
    BOOL v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Refusing to overwrite existing restore session", buf, 2u);
      _MBLog();
    }
  }
  else
  {
    id v78 = 0;
    CFStringRef v17 = [(MBCKManager *)self openCacheWithAccount:v12 accessType:1 error:&v78];
    BOOL v16 = v78;
    if (v17)
    {
      v61 = v17;
      v62 = +[MBCKOperationPolicy expensiveCellularPolicy];
      id v18 = [(MBCKManager *)self databaseManager];
      v77 = v16;
      id v19 = +[MBCKOperationTracker operationTrackerWithAccount:v12 databaseManager:v18 policy:v62 error:&v77];
      id v20 = v77;

      if (v19)
      {
        long long v21 = [v63 processName];
        v60 = [v62 operationGroupWithName:@"setRestoreSession" processName:v21];

        [v19 setCkOperationGroup:v60];
        v76 = v20;
        unint64_t v57 = [(MBCKManager *)self _snapshotIDForSnapshotUUID:v11 backupUDID:v10 operationTracker:v19 error:&v76];
        BOOL v16 = v76;

        if (v57)
        {
          long long v22 = MBGetDefaultLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v91 = v10;
            __int16 v92 = 1024;
            int v93 = v57;
            __int16 v94 = 2112;
            id v95 = v11;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Creating temporary restore session for %@:(%d)%@", buf, 0x1Cu);
            unint64_t v48 = v57;
            id v49 = v11;
            v47 = v10;
            _MBLog();
          }

          v75 = v16;
          v56 = +[MBCKAccount fetchAccountWithOperationTracker:v19 cache:v61 error:&v75];
          long long v23 = v75;

          if (v56)
          {
            v74 = v23;
            unsigned __int8 v24 = [v56 fetchDevicesWithOperationTracker:v19 error:&v74];
            v55 = v74;

            if (v24)
            {
              v25 = v10;
              CFStringRef v26 = MBDeviceUDID_Legacy();
              unsigned int v27 = [v25 isEqualToString:v26];
              v53 = v25;

              id v28 = v25;
              if (v27)
              {
                uint64_t v29 = MBDeviceUUID();

                id v28 = v29;
              }
              v52 = v28;
              v54 = -[NSObject deviceForUUID:](v56, "deviceForUUID:", v47, v48, v49);
              if (v54)
              {
                v30 = MBGetDefaultLog();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Fetching keybags for device", buf, 2u);
                  _MBLog();
                }

                v31 = [v54 keybagManager];
                v73 = v55;
                unsigned __int8 v32 = [v31 fetchKeybagsWithOperationTracker:v19 error:&v73];
                v33 = v73;

                if (v32)
                {
                  v72 = v33;
                  unsigned __int8 v34 = [v54 fetchSnapshotsWithOperationTracker:v19 retry:1 error:&v72];
                  v55 = v72;

                  if (v34)
                  {
                    v50 = +[MBCKEncryptionManager restoreKeyBagsForDevice:v54];
                    if (!v50) {
                      __assert_rtn("-[MBCKManager setRestoreSessionWithBackupUDID:snapshotUUID:account:connection:]", "MBCKManager.m", 358, "restoreKeyBagsByID");
                    }
                    v88[0] = @"personaIdentifier";
                    v51 = [v12 persona];
                    v35 = [v51 personaIdentifier];
                    v89[0] = v35;
                    v89[1] = v53;
                    v88[1] = @"backupUDID";
                    v88[2] = @"snapshotID";
                    v36 = +[NSNumber numberWithUnsignedInteger:v57];
                    v88[3] = @"snapshotUUID";
                    v89[2] = v36;
                    v89[3] = v11;
                    v37 = +[NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:4];

                    uint64_t v38 = +[MBServiceRestoreSession restoreSessionWithPropertyList:v37];
                    v39 = (void *)v83[5];
                    v83[5] = v38;

                    v58 = [MBCKLockManager alloc];
                    v40 = [(MBCKManager *)self databaseManager];
                    v41 = [(MBCKManager *)self thermalPressureMonitor];
                    v59 = [(MBCKLockManager *)v58 initWithAccount:v12 restoreType:1 backupUDID:v53 databaseManager:v40 delegate:self operationGroup:v60 thermalPressureMonitor:v41 snapshotUUID:v11];

                    v42 = self->super._stateQueue;
                    v64[0] = _NSConcreteStackBlock;
                    v64[1] = 3221225472;
                    v64[2] = sub_1000AD61C;
                    v64[3] = &unk_100412078;
                    id v65 = v15;
                    id v66 = v54;
                    v67 = v59;
                    v71 = &v82;
                    id v68 = v50;
                    id v69 = v12;
                    id v70 = v11;
                    id v43 = v50;
                    v44 = v59;
                    dispatch_sync(v42, v64);
                  }
                  else
                  {
                    v37 = MBGetDefaultLog();
                    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v91 = v55;
                      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Failed to fetch snapshots: %@", buf, 0xCu);
                      _MBLog();
                    }
                  }
                }
                else
                {
                  v37 = MBGetDefaultLog();
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v91 = v33;
                    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Failed to fetch keybags: %@", buf, 0xCu);
                    _MBLog();
                  }
                  v55 = v33;
                }
              }
              else
              {
                v37 = MBGetDefaultLog();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Could not find device record in account", buf, 2u);
                  _MBLog();
                }
              }

              long long v23 = v55;
              v46 = v52;
            }
            else
            {
              v46 = MBGetDefaultLog();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                long long v23 = v55;
                v91 = v55;
                _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Failed to fetch devices: %@", buf, 0xCu);
                _MBLog();
              }
              else
              {
                long long v23 = v55;
              }
            }
          }
          else
          {
            v46 = MBGetDefaultLog();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v91 = v23;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Failed to fetch account record: %@", buf, 0xCu);
              _MBLog();
            }
          }

          BOOL v16 = v23;
          v45 = v56;
        }
        else
        {
          v45 = MBGetDefaultLog();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v91 = v16;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Failed to set restore session: unable to determine snapshot ID: %@", buf, 0xCu);
            _MBLog();
          }
        }
      }
      else
      {
        BOOL v16 = v20;
      }

      CFStringRef v17 = v61;
    }
  }
  _Block_object_dispose(&v82, 8);
}

- (void)_clearRestoreSessionWithAccount:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKManager _clearRestoreSessionWithAccount:]", "MBCKManager.m", 387, "account");
  }
  id v5 = v4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._stateQueue);
  uint64_t v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v5 accountIdentifier];
    v8 = [v5 persona];
    v9 = [v8 personaIdentifier];
    *(_DWORD *)buf = 138543618;
    id v15 = v7;
    __int16 v16 = 2114;
    CFStringRef v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Clearing the restore session for account %{public}@(%{public}@)", buf, 0x16u);

    uint64_t v10 = [v5 accountIdentifier];
    id v11 = [v5 persona];
    v13 = [v11 personaIdentifier];
    _MBLog();
  }
  id v12 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v5];
  [v12 clearRestoreSession];
  [v12 setServiceState:0];
}

- (void)clearRestoreSessionWithAccount:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKManager clearRestoreSessionWithAccount:]", "MBCKManager.m", 399, "account");
  }
  id v5 = v4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->super._stateQueue);
  stateQueue = self->super._stateQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000ADA14;
  v8[3] = &unk_1004110B0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(stateQueue, v8);
}

+ (id)loadRestoreStateInfoWithAccount:(id)a3
{
  id v3 = a3;
  if (!v3) {
    __assert_rtn("+[MBCKManager loadRestoreStateInfoWithAccount:]", "MBCKManager.m", 408, "account");
  }
  id v4 = v3;
  id v5 = [v3 persona];
  id v6 = [v5 copyPreferencesValueForKey:@"RestoreStateInfo" class:objc_opt_class()];

  if (v6)
  {
    id v7 = [objc_alloc((Class)MBStateInfo) initWithDictionaryRepresentation:v6];
    v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v4 accountIdentifier];
      uint64_t v10 = [v4 persona];
      id v11 = [v10 personaIdentifier];
      *(_DWORD *)buf = 138543874;
      CFStringRef v17 = v9;
      __int16 v18 = 2114;
      id v19 = v11;
      __int16 v20 = 2114;
      id v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Loaded restore state for account %{public}@(%{public}@): %{public}@", buf, 0x20u);

      id v12 = [v4 accountIdentifier];
      v13 = [v4 persona];
      id v15 = [v13 personaIdentifier];
      _MBLog();
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (void)saveRestoreStateInfo:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6) {
    __assert_rtn("+[MBCKManager saveRestoreStateInfo:account:]", "MBCKManager.m", 418, "account");
  }
  id v7 = v6;
  if (v5)
  {
    v8 = [v5 dictionaryRepresentation];
    id v9 = [v7 persona];
    [v9 setPreferencesValue:v8 forKey:@"RestoreStateInfo"];

    uint64_t v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [v7 accountIdentifier];
      *(_DWORD *)buf = 138543618;
      unsigned __int8 v14 = v8;
      __int16 v15 = 2114;
      __int16 v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Saved the restore state for account %{public}@: %{public}@", buf, 0x16u);

      id v12 = [v7 accountIdentifier];
      _MBLog();
    }
  }
}

- (id)loadRestoreStateWithAccount:(id)a3
{
  id v5 = a3;
  if (!v5) {
    __assert_rtn("-[MBCKManager loadRestoreStateWithAccount:]", "MBCKManager.m", 427, "account");
  }
  id v6 = v5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._stateQueue);
  id v7 = [v6 accountIdentifier];
  v8 = [v6 persona];
  id v9 = [v8 personaIdentifier];

  unsigned int v10 = [v6 isPrimaryAccount];
  id v11 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v6];
  id v12 = [v11 serviceState];
  id v13 = [v11 restore];
  unsigned __int8 v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    *(void *)v113 = v7;
    *(_WORD *)&v113[8] = 2114;
    *(void *)&v113[10] = v9;
    __int16 v114 = 1024;
    *(_DWORD *)v115 = v12;
    *(_WORD *)&v115[4] = 2048;
    *(void *)&v115[6] = v13;
    __int16 v116 = 2114;
    id v117 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "=restore-boot= Loading restore session for account %{public}@(%{public}@): (%d) (%p) %{public}@", buf, 0x30u);
    id v90 = v13;
    id v91 = v13;
    v86 = v9;
    v89 = v12;
    uint64_t v82 = v7;
    _MBLog();
  }

  if (v13)
  {
    id v15 = [v13 copy];
    goto LABEL_88;
  }
  __int16 v16 = +[MBServiceRestoreSession currentRestoreSessionWithAccount:v6];
  if (v16)
  {
    CFStringRef v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = [v16 propertyList];
      *(_DWORD *)buf = 138543874;
      *(void *)v113 = v7;
      *(_WORD *)&v113[8] = 2114;
      *(void *)&v113[10] = v9;
      __int16 v114 = 2114;
      *(void *)v115 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "=restore-boot= Loaded restore session for account %{public}@(%{public}@): %{public}@", buf, 0x20u);

      [v16 propertyList];
      v89 = v86 = v9;
      uint64_t v82 = v7;
      _MBLog();
    }
    [v11 setRestoreSession:v16];
    if ([v16 isMBSSession])
    {
      id v19 = MBGetDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "=restore-boot= Loading MBS restore session", buf, 2u);
        _MBLog();
      }

      __int16 v20 = (void *)os_transaction_create();
      [v11 setRestoreTransaction:v20];

      v111.receiver = self;
      v111.super_class = (Class)MBCKManager;
      id v21 = [(MBServiceManager *)&v111 loadRestoreStateWithAccount:v6];
      if (self->super._serviceState == 5)
      {
        long long v22 = +[AppRestoreDispatcher shared];
        long long v23 = [v22 appRestorerForAccount:v6 stateQueue:self->super._stateQueue delegate:self error:0];

        if (v23)
        {
          [v11 setFinishedAppRestores:0];
          [v23 startObservingInstallCoordinators];
        }
        else
        {
          id v80 = MBGetDefaultLog();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v113 = v6;
            _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "Failed to find the app restore manager for %@", buf, 0xCu);
            _MBLog();
          }
        }
      }
      if (!v21) {
        __assert_rtn("-[MBCKManager loadRestoreStateWithAccount:]", "MBCKManager.m", 461, "restoreState");
      }
      id v73 = v21;
      id v13 = v73;
      goto LABEL_87;
    }
  }
  else
  {
    [v11 setRestoreSession:0];
  }
  id v13 = [(id)objc_opt_class() loadRestoreStateInfoWithAccount:v6];
  if (v16)
  {
    if ([v16 telemetryID]) {
      self->_restoreTelemetryID = (unint64_t)[v16 telemetryID];
    }
    if (objc_msgSend(v16, "isMBSSession", v82, v86, v89, v90, v91)) {
      __assert_rtn("-[MBCKManager loadRestoreStateWithAccount:]", "MBCKManager.m", 469, "!restoreSession.isMBSSession");
    }
    unsigned __int8 v24 = (void *)os_transaction_create();
    [v11 setRestoreTransaction:v24];

    unsigned __int8 v103 = [v16 isFinishing];
    v101 = v9;
    v102 = v7;
    if (v103)
    {
      uint64_t v25 = 3;
      uint64_t v26 = 6;
    }
    else
    {
      uint64_t v29 = MBBackgroundRestoreSignpostHandle();
      if (os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "BackgroundRestore", " enableTelemetry=YES ", buf, 2u);
      }

      uint64_t v25 = 2;
      uint64_t v26 = 5;
    }
    [v11 setServiceState:v26];
    v30 = MBGetDefaultLog();
    unsigned int v100 = v10;
    SEL v92 = a2;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = [v6 persona];
      unsigned __int8 v32 = [v31 personaIdentifier];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v113 = v26;
      *(_WORD *)&v113[4] = 2112;
      *(void *)&v113[6] = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "=restore-boot= Setting service state to %u for persona %@", buf, 0x12u);

      v33 = [v6 persona];
      [v33 personaIdentifier];
      id v87 = v83 = v26;
      _MBLog();
    }
    if (v13)
    {
      if ([v13 isBackground] && objc_msgSend(v13, "state") == v25)
      {
        [v11 setRestore:v13];
LABEL_41:
        id v35 = [(MBCKManager *)self _startNetworkPathMonitor];
        uint64_t v36 = [v16 snapshotUUID];
        v37 = [MBBackgroundRestoreProgressMonitor alloc];
        uint64_t v38 = [(MBCKManager *)self thermalPressureMonitor];
        v39 = [(MBBackgroundRestoreProgressMonitor *)v37 initWithAccount:v6 serviceManager:self thermalPressureMonitor:v38 snapshotUUID:v36];

        [v11 setBackgroundRestoreProgressMonitor:v39];
        v99 = v39;
        [(MBBackgroundRestoreProgressMonitor *)v39 start];
        v40 = +[MBCKOperationPolicy expensiveCellularPolicy];
        v41 = +[MBEngine stringForRestoreType:2];
        uint64_t v42 = [v41 capitalizedString];

        v97 = (void *)v42;
        v98 = v40;
        id v96 = [objc_alloc((Class)NSString) initWithFormat:@"%@ Restore", v42];
        objc_msgSend(v40, "operationGroupWithName:");
        v44 = id v43 = v16;
        v45 = [MBCKLockManager alloc];
        v107 = v43;
        v46 = [v43 backupUDID];
        v47 = [(MBCKManager *)self databaseManager];
        unint64_t v48 = [(MBCKManager *)self thermalPressureMonitor];
        v105 = (void *)v36;
        id v95 = (void *)v44;
        id v49 = [(MBCKLockManager *)v45 initWithAccount:v6 restoreType:2 backupUDID:v46 databaseManager:v47 delegate:self operationGroup:v44 thermalPressureMonitor:v48 snapshotUUID:v36];

        [v11 setLockManager:v49];
        v50 = [v6 persona];
        v106 = v50;
        if (MBIsInternalInstall())
        {
          v51 = +[MBBehaviorOptions sharedOptions];
          unsigned int v52 = [v51 useRestoreOperationLog];

          if (v52)
          {
            v53 = MBGetDefaultLog();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "=restore-boot= Using restore operation log for background restore", buf, 2u);
              _MBLog();
            }

            v54 = [MBRestoreOperationLogger alloc];
            v50 = v106;
            v55 = [v106 restoreOperationLogPath];
            v56 = [(MBRestoreOperationLogger *)v54 initWithPath:v55];
            [v11 setRestoreLogger:v56];
          }
        }
        if ([v107 isFinishing]) {
          [(MBCKLockManager *)v49 releaseLockAsync];
        }
        else {
          [(MBCKLockManager *)v49 startRenewingLock];
        }
        unsigned __int8 v57 = v103;
        id v110 = 0;
        uint64_t v58 = +[MBCKEncryptionManager loadRestoreKeyBagsWithAccount:v6 error:&v110];
        id v104 = v110;
        __int16 v94 = v49;
        if (v58)
        {
          [v11 setRestoreKeyBagsByID:v58];
        }
        else
        {
          v59 = MBGetDefaultLog();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v113 = v104;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "=restore-boot= Failed to load restore keybags while loading restore session: %@", buf, 0xCu);
            uint64_t v84 = v104;
            _MBLog();
          }

          v50 = v106;
          [v106 setPreferencesValue:&__kCFBooleanTrue forKey:@"NotifyDaemonNextTimeKeyBagIsUnlocked"];
        }
        v60 = MBGetDefaultLog();
        BOOL v61 = os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT);
        int v93 = (void *)v58;
        if (v57)
        {
          if (v61)
          {
            v62 = [v6 persona];
            id v63 = [v62 personaIdentifier];
            *(_DWORD *)buf = 138412290;
            *(void *)v113 = v63;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "=restore-boot= Not setting up app restore manager for persona %@", buf, 0xCu);

            v64 = [v6 persona];
            uint64_t v84 = [v64 personaIdentifier];
            _MBLog();
          }
          [v11 setFinishedAppRestores:1];
        }
        else
        {
          if (v61)
          {
            id v65 = [v6 persona];
            id v66 = [v65 personaIdentifier];
            *(_DWORD *)buf = 138412290;
            *(void *)v113 = v66;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "=restore-boot= Setting up app restore manager for persona %@", buf, 0xCu);

            v67 = [v6 persona];
            uint64_t v84 = [v67 personaIdentifier];
            _MBLog();
          }
          id v68 = +[AppRestoreDispatcher shared];
          stateQueue = self->super._stateQueue;
          id v109 = 0;
          id v70 = [v68 appRestorerForAccount:v6 stateQueue:stateQueue delegate:self error:&v109];
          id v71 = v109;

          if (v70)
          {
            [v11 setFinishedAppRestores:0];
            [v70 startObservingInstallCoordinators];
          }
          else
          {
            v74 = MBGetDefaultLog();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)v113 = v6;
              *(_WORD *)&v113[8] = 2112;
              *(void *)&v113[10] = v71;
              _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "=restore-boot= Failed to find the app restore manager for %@: %@", buf, 0x16u);
              uint64_t v84 = v6;
              id v88 = v71;
              _MBLog();
            }

            [v11 setFinishedAppRestores:1];
          }

          v50 = v106;
        }
        -[MBCKManager _scheduleDelayedBackgroundRestoreTimerWithAccount:](self, "_scheduleDelayedBackgroundRestoreTimerWithAccount:", v6, v84, v88);
        [(MBCKManager *)self _scheduleBackgroundRestoreTimeoutTTRWithAccount:v6];
        id v9 = v101;
        id v7 = v102;
        if (([v11 isHoldingWorkAssertionForBackgroundRestore] & 1) == 0)
        {
          v75 = +[MBDaemon sharedDaemon];
          [v75 holdWorkAssertion:v92];

          [v11 setIsHoldingWorkAssertionForBackgroundRestore:1];
        }
        v76 = v105;
        id v108 = v104;
        v77 = [v11 openOrUseExistingPlanWithPersona:v50 snapshotUUID:v105 error:&v108];
        id v78 = v108;

        __int16 v16 = v107;
        if (!v77)
        {
          v79 = MBGetDefaultLog();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v113 = v78;
            _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_FAULT, "Failed to open plan while loading restore session: %@", buf, 0xCu);
            id v85 = v78;
            _MBLog();
          }

          v76 = v105;
          v50 = v106;
        }

        if (!v100) {
          goto LABEL_68;
        }
        goto LABEL_67;
      }
      objc_msgSend(v13, "setState:", v25, v83, v87);
      [v13 setIsBackground:1];
    }
    else
    {
      id v13 = [objc_alloc((Class)MBStateInfo) initWithState:v25 progress:0 estimatedTimeRemaining:0 error:0 errors:0.0];
      [v13 setIsBackground:1];
      unsigned __int8 v34 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v16 snapshotBackupPolicy]);
      [v13 setRestoredSnapshotBackupPolicy:v34];

      if (!v13) {
        __assert_rtn("-[MBCKManager loadRestoreStateWithAccount:]", "MBCKManager.m", 497, "restoreState");
      }
    }
    objc_msgSend(v11, "setRestore:", v13, v83);
    [(id)objc_opt_class() saveRestoreStateInfo:v13 account:v6];
    goto LABEL_41;
  }
  unsigned int v27 = MBGetDefaultLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "=restore-boot= No restore session found", buf, 2u);
    _MBLog();
  }

  if (v13)
  {
    if ([v13 isBackground]
      && [v13 state] != 4
      && [v13 state] != 6)
    {
      [v13 setState:4];
      [v13 setIsBackground:1];
      LODWORD(v28) = 1.0;
      [v13 setProgress:v28];
      [v13 setEstimatedTimeRemaining:0];
      [(id)objc_opt_class() saveRestoreStateInfo:v13 account:v6];
    }
  }
  else
  {
    id v13 = [objc_alloc((Class)MBStateInfo) initWithState:0 progress:0 estimatedTimeRemaining:0 error:0 errors:0.0];
  }
  objc_msgSend(v11, "setRestore:", v13, v82, v86, v89, v90, v91);
  [v11 setFinishedAppRestores:1];
  if (v10) {
    atomic_store(1u, (unsigned __int8 *)&self->super._appDataDidFinishRestore);
  }
  if (!v13) {
    __assert_rtn("-[MBCKManager loadRestoreStateWithAccount:]", "MBCKManager.m", 595, "restoreState");
  }
  if (!v10) {
    goto LABEL_68;
  }
LABEL_67:
  v72 = +[MBNotificationCenter sharedNotificationCenter];
  objc_msgSend(v72, "postNotification:ifStateChanged:", kMBManagerRestoreStateChangedNotification, objc_msgSend(v13, "state"));

LABEL_68:
  id v73 = objc_msgSend(v13, "copy", v85);
LABEL_87:
  id v15 = v73;

LABEL_88:
  return v15;
}

- (void)_loadRestoreState
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = +[MBServiceAccount allServiceAccounts];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [(MBCKManager *)self loadRestoreStateWithAccount:*(void *)(*((void *)&v9 + 1) + 8 * (void)v7)];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_cancelBackgroundRestoreTTRTimerWithAccount:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._stateQueue);
  id v5 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 restoreTTRTimer];
  if (v6)
  {
    id v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cancelling background restore TTR Timer for %@", buf, 0xCu);
      _MBLog();
    }

    dispatch_source_cancel(v6);
    [v5 setRestoreTTRTimer:0];
  }
}

- (void)_cancelDelayedBackgroundRestoreTimerWithAccount:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._stateQueue);
  id v5 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 delayedRestoreTimer];
  if (v6)
  {
    id v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cancelling delayed background restore timer for %@", buf, 0xCu);
      _MBLog();
    }

    dispatch_source_cancel(v6);
    [v5 setDelayedRestoreTimer:0];
  }
}

- (void)_scheduleDelayedBackgroundRestoreTimerWithAccount:(id)a3
{
  id v4 = a3;
  personaState = self->super._personaState;
  uint64_t v6 = [v4 persona];
  id v7 = [v6 personaIdentifier];
  id v8 = [(MBPersonaStateManager *)personaState restoreSessionForPersonaID:v7];
  id v9 = [v8 startDate];

  if (v9)
  {
    long long v10 = [v4 persona];
    long long v11 = [v10 copyPreferencesValueForKey:@"DelayedRestoreWarningTimeout" class:objc_opt_class()];

    int v12 = MBIsInternalInstall();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 doubleValue];
    }
    else
    {
      double v13 = 1209600.0;
      if (v12) {
        double v13 = 604800.0;
      }
    }
    id v15 = [v9 dateByAddingTimeInterval:v13];
    __int16 v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      CFStringRef v17 = MBStringWithDate();
      *(_DWORD *)buf = 138543362;
      double v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Restore will time out on %{public}@", buf, 0xCu);

      unsigned __int8 v24 = MBStringWithDate();
      _MBLog();
    }
    __int16 v18 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v4];
    id v19 = [v18 delayedRestoreTimer];

    if (!v19)
    {
      __int16 v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Starting delayed restore timer", buf, 2u);
        _MBLog();
      }

      id v21 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
      [v15 timeIntervalSinceReferenceDate];
      dispatch_time_t v23 = dispatch_walltime(0, (uint64_t)(v22 * 1000000000.0));
      dispatch_source_set_timer(v21, v23, 0x4E94914F0000uLL, 0);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1000AF4C0;
      handler[3] = &unk_100411128;
      id v26 = v4;
      dispatch_source_set_event_handler(v21, handler);
      [v18 setDelayedRestoreTimer:v21];
      dispatch_resume(v21);
    }
    goto LABEL_15;
  }
  long long v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    unsigned __int8 v14 = [v4 accountIdentifier];
    *(_DWORD *)buf = 138543362;
    double v28 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "nil start date for the restore session for account %{public}@", buf, 0xCu);

    id v15 = [v4 accountIdentifier];
    _MBLog();
LABEL_15:
  }
}

- (void)_scheduleBackgroundRestoreTimeoutTTRWithAccount:(id)a3
{
  id v4 = a3;
  if (MBIsInternalInstall())
  {
    personaState = self->super._personaState;
    uint64_t v6 = [v4 persona];
    id v7 = [v6 personaIdentifier];
    id v8 = [(MBPersonaStateManager *)personaState restoreSessionForPersonaID:v7];
    id v9 = [v8 startDate];

    if (v9)
    {
      long long v10 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v4];
      long long v11 = [v4 persona];
      id v12 = [v11 copyPreferencesValueForKey:@"BackgroundRestoreTimeoutTTRInterval" class:objc_opt_class()];

      if (v12) {
        [v12 doubleValue];
      }
      else {
        double v13 = 172800.0;
      }
      id v15 = [v9 dateByAddingTimeInterval:v13];
      __int16 v16 = MBGetDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        CFStringRef v17 = MBStringWithDate();
        *(_DWORD *)buf = 138543362;
        unsigned int v27 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Background Restore TTR timer will fire on %{public}@", buf, 0xCu);

        dispatch_time_t v23 = MBStringWithDate();
        _MBLog();
      }
      __int16 v18 = [v10 restoreTTRTimer];

      if (!v18)
      {
        id v19 = MBGetDefaultLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Starting background restore TTR timer", buf, 2u);
          _MBLog();
        }

        __int16 v20 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
        [v15 timeIntervalSinceReferenceDate];
        dispatch_time_t v22 = dispatch_walltime(0, (uint64_t)(v21 * 1000000000.0));
        dispatch_source_set_timer(v20, v22, 0x4E94914F0000uLL, 0);
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_1000AF948;
        handler[3] = &unk_100411128;
        id v25 = v4;
        dispatch_source_set_event_handler(v20, handler);
        [v10 setRestoreTTRTimer:v20];
        dispatch_resume(v20);
      }
    }
    else
    {
      long long v10 = MBGetDefaultLog();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_16:

        goto LABEL_17;
      }
      unsigned __int8 v14 = [v4 accountIdentifier];
      *(_DWORD *)buf = 138543362;
      unsigned int v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "nil start date for the restore session for account %{public}@", buf, 0xCu);

      id v12 = [v4 accountIdentifier];
      _MBLog();
    }

    goto LABEL_16;
  }
LABEL_17:
}

- (id)_ckSettingsContextForBackupUDID:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MBServiceManager *)self debugContext];
  id v9 = [v8 valueForName:@"SettingsContext"];

  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    long long v10 = objc_alloc_init(MBCKSettingsContext);

    long long v11 = MBGetCacheDir();
    [(MBServiceSettingsContext *)v10 setCacheDir:v11];

    id v9 = v10;
  }
  if (v7) {
    [v9 setAccount:v7];
  }
  [v9 setBackupUDID:v6];

  return v9;
}

- (id)_ckSettingsContextForRestoreWithDeviceUUID:(id)a3 account:(id)a4 delegateContext:(id)a5
{
  id v7 = a4;
  id v8 = [(MBCKManager *)self _ckSettingsContextForBackupUDID:a3 account:v7];
  id v9 = [(MBServiceManager *)self debugContext];
  long long v10 = [v9 valueForName:@"SettingsContext"];

  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    long long v11 = [v7 persona];
    objc_msgSend(v8, "setShouldRestoreSystemFiles:", objc_msgSend(v11, "shouldRestoreToSharedVolume"));
  }
  return v8;
}

- (void)saveFailedBackupShadowStateWithAccount:(id)a3
{
  id v3 = a3;
  if (!v3) {
    __assert_rtn("-[MBCKManager saveFailedBackupShadowStateWithAccount:]", "MBCKManager.m", 725, "account");
  }
  id v11 = v3;
  id v4 = [v3 persona];
  id v5 = [v4 copyPreferencesValueForKey:@"BackupStateInfo" class:objc_opt_class()];

  if (v5) {
    id v6 = [objc_alloc((Class)MBStateInfo) initWithDictionaryRepresentation:v5];
  }
  else {
    id v6 = 0;
  }
  id v7 = objc_alloc((Class)MBStateInfo);
  id v8 = +[MBError errorWithCode:1 format:@"Service crashed"];
  id v9 = [v6 errors];
  id v10 = [v7 initWithState:6 progress:0 estimatedTimeRemaining:v8 error:v9 errors:0.0];

  [(id)objc_opt_class() saveBackupStateInfo:v10 forInitialMegaBackup:0 account:v11];
}

- (id)_sanitizeError:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)_snapshotForSnapshotID:(unint64_t)a3 backupUDID:(id)a4 cached:(BOOL)a5 operationTracker:(id)a6 error:(id *)a7
{
  BOOL v45 = a5;
  id v10 = a4;
  id v44 = a6;
  if (!v44) {
    __assert_rtn("-[MBCKManager _snapshotForSnapshotID:backupUDID:cached:operationTracker:error:]", "MBCKManager.m", 739, "tracker");
  }
  id v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    unint64_t v52 = a3;
    __int16 v53 = 2112;
    unint64_t v54 = (unint64_t)v10;
    __int16 v55 = 1024;
    LODWORD(v56[0]) = v45;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Fetching the snapshot for snapshotID:%lu, backupUDID:%@, cached:%d", buf, 0x1Cu);
    id v41 = v10;
    BOOL v42 = v45;
    unint64_t v40 = a3;
    _MBLog();
  }

  if (v45)
  {
    id v12 = self;
    objc_sync_enter(v12);
    double v13 = [(MBCKManager *)v12 cachedBackupsByUDID];
    id v14 = [v13 copy];

    objc_sync_exit(v12);
  }
  else
  {
    id v14 = 0;
  }
  if (objc_msgSend(v14, "count", v40, v41, v42))
  {
    id v15 = 0;
  }
  else
  {
    __int16 v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Refreshing the list of backups", buf, 2u);
      _MBLog();
    }

    id v50 = 0;
    CFStringRef v17 = [(MBCKManager *)self getBackupListWithOperationTracker:v44 shouldFilter:0 error:&v50];
    id v15 = v50;

    if (!v17)
    {
      unsigned __int8 v32 = MBGetDefaultLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v52 = (unint64_t)v15;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to refresh the list of backups: %@", buf, 0xCu);
        _MBLog();
      }
      dispatch_time_t v22 = 0;
      goto LABEL_35;
    }
    __int16 v18 = self;
    objc_sync_enter(v18);
    id v19 = [(MBCKManager *)v18 cachedBackupsByUDID];
    id v20 = [v19 copy];

    objc_sync_exit(v18);
    id v14 = v20;
  }
  double v21 = [v14 objectForKeyedSubscript:v10];
  dispatch_time_t v22 = v21;
  if (!v21)
  {
    v30 = MBGetDefaultLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      unint64_t v52 = (unint64_t)v10;
      __int16 v53 = 2048;
      unint64_t v54 = a3;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "The specified backup does not exist, backupUDID:%@, snapshotID:%lu", buf, 0x16u);
      _MBLog();
    }

    uint64_t v31 = +[MBError errorWithCode:204, @"Backup %@ does not exist", v10 format];
    dispatch_time_t v22 = 0;
    goto LABEL_34;
  }
  dispatch_time_t v23 = [v21 snapshots];
  BOOL v24 = [v23 count] == 0;

  if (v24)
  {
    uint64_t v31 = +[MBError errorWithCode:204, @"No snapshots found in backup %@", v10 format];
LABEL_34:
    unsigned __int8 v32 = v15;
    id v15 = v31;
LABEL_35:

    unsigned __int8 v34 = MBGetDefaultLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      unint64_t v52 = (unint64_t)v10;
      __int16 v53 = 2048;
      unint64_t v54 = a3;
      __int16 v55 = 2112;
      v56[0] = v15;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to fetch the snapshot for backupUDID:%@, snapshotID:%lu: %@", buf, 0x20u);
      _MBLog();
    }

    if (a7)
    {
      id v15 = v15;
      id v33 = 0;
      *a7 = v15;
    }
    else
    {
      id v33 = 0;
    }
    goto LABEL_46;
  }
  if (a3)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v25 = [v22 snapshots];
    id v26 = [v25 countByEnumeratingWithState:&v46 objects:v57 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v47;
LABEL_18:
      uint64_t v28 = 0;
      while (1)
      {
        if (*(void *)v47 != v27) {
          objc_enumerationMutation(v25);
        }
        uint64_t v29 = *(void **)(*((void *)&v46 + 1) + 8 * v28);
        if ([v29 snapshotID] == (id)a3) {
          break;
        }
        if (v26 == (id)++v28)
        {
          id v26 = [v25 countByEnumeratingWithState:&v46 objects:v57 count:16];
          if (v26) {
            goto LABEL_18;
          }
          goto LABEL_24;
        }
      }
      id v33 = v29;

      if (v33) {
        goto LABEL_43;
      }
    }
    else
    {
LABEL_24:
    }
    uint64_t v31 = +[MBError errorWithCode:204, @"Specified snapshot %lu not found in backup %@", a3, v10 format];
    goto LABEL_34;
  }
  id v35 = [v22 snapshots];
  id v33 = [v35 lastObject];

  uint64_t v36 = MBGetDefaultLog();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    id v37 = [v33 snapshotID];
    *(_DWORD *)buf = 134218498;
    unint64_t v52 = (unint64_t)v37;
    __int16 v53 = 2112;
    unint64_t v54 = (unint64_t)v10;
    __int16 v55 = 2048;
    v56[0] = 0;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Selecting the last snapshot(%lu) automatically, backupUDID:%@, snapshotID:%lu", buf, 0x20u);
    [v33 snapshotID];
    _MBLog();
  }

  if (!v33) {
    __assert_rtn("-[MBCKManager _snapshotForSnapshotID:backupUDID:cached:operationTracker:error:]", "MBCKManager.m", 790, "foundSnapshot");
  }
LABEL_43:
  uint64_t v38 = MBGetDefaultLog();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    unint64_t v52 = (unint64_t)v10;
    __int16 v53 = 2048;
    unint64_t v54 = a3;
    __int16 v55 = 1024;
    LODWORD(v56[0]) = v45;
    WORD2(v56[0]) = 2112;
    *(void *)((char *)v56 + 6) = v33;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Found the snapshot for backupUDID:%@, snapshotID:%lu (%d): %@", buf, 0x26u);
    _MBLog();
  }

LABEL_46:
  return v33;
}

- (id)snapshotForSnapshotID:(unint64_t)a3 backupUDID:(id)a4 operationTracker:(id)a5 error:(id *)a6
{
  return [(MBCKManager *)self _snapshotForSnapshotID:a3 backupUDID:a4 cached:1 operationTracker:a5 error:a6];
}

- (unint64_t)_snapshotIDForSnapshotUUID:(id)a3 backupUDID:(id)a4 operationTracker:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v27 = a4;
  id v26 = a5;
  if (!v26) {
    __assert_rtn("-[MBCKManager _snapshotIDForSnapshotUUID:backupUDID:operationTracker:error:]", "MBCKManager.m", 808, "tracker");
  }
  id v11 = self;
  objc_sync_enter(v11);
  id v12 = [(MBCKManager *)v11 cachedBackupsByUDID];
  id v13 = [v12 copy];

  objc_sync_exit(v11);
  if (![v13 count])
  {
    id v14 = [(MBCKManager *)v11 getBackupListWithOperationTracker:v26 shouldFilter:0 error:a6];

    if (!v14)
    {
      id v24 = 0;
      goto LABEL_19;
    }
  }
  id v15 = objc_msgSend(v13, "objectForKeyedSubscript:", v27, v26);
  __int16 v16 = v15;
  if (v15)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    CFStringRef v17 = [v15 snapshots];
    id v18 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v29;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v17);
          }
          double v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          dispatch_time_t v22 = [v21 snapshotUUID];
          unsigned __int8 v23 = [v22 isEqualToString:v10];

          if (v23)
          {
            id v24 = [v21 snapshotID];

            goto LABEL_18;
          }
        }
        id v18 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    goto LABEL_17;
  }
  if (!a6)
  {
LABEL_17:
    id v24 = 0;
    goto LABEL_18;
  }
  +[MBError errorWithCode:204 format:@"Backup does not exist"];
  id v24 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

LABEL_19:
  return (unint64_t)v24;
}

- (void)_waitForRestoreConditions:(id)a3
{
  id v3 = a3;
  while (1)
  {
    int v4 = MKBDeviceUnlockedSinceBoot();
    if (v4 == 1) {
      break;
    }
    int v9 = v4;
    id v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Unable to service background restore request before the first unlock (%d)", buf, 8u);
      _MBLog();
    }
    unsigned int v8 = 60;
LABEL_11:

    sleep(v8);
  }
  id v5 = [v3 reloaded];
  unsigned __int8 v6 = [v5 isAuthenticated];

  if ((v6 & 1) == 0 && BYSetupAssistantNeedsToRun())
  {
    id v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unable to service background restore request while Setup is active", buf, 2u);
      _MBLog();
    }
    unsigned int v8 = 10;
    goto LABEL_11;
  }
}

- (id)_domainDisplayNamesForFailedDomainsWithAccount:(id)a3
{
  id v4 = a3;
  id v5 = [v4 persona];
  unsigned __int8 v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v4 accountIdentifier];
    unsigned int v8 = [v5 personaIdentifier];
    *(_DWORD *)buf = 138543618;
    id v26 = v7;
    __int16 v27 = 2114;
    long long v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Checking for an incomplete restore for account %{public}@%{public}@", buf, 0x16u);

    int v9 = [v4 accountIdentifier];
    dispatch_time_t v22 = [v5 personaIdentifier];
    _MBLog();
  }
  id v24 = 0;
  id v10 = [(MBCKManager *)self openCacheWithAccount:v4 accessType:1 error:&v24];
  id v11 = v24;
  id v12 = v11;
  if (v10)
  {
    id v13 = [objc_alloc((Class)MBDomainManager) initWithPersona:v5];
    id v23 = v12;
    id v14 = [v10 domainNamesForRestoreFailures:&v23];
    id v15 = v23;

    __int16 v16 = MBGetDefaultLog();
    CFStringRef v17 = v16;
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [v14 count];
        *(_DWORD *)buf = 134218242;
        id v26 = v18;
        __int16 v27 = 2114;
        long long v28 = v14;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Found %ld failed domains: %{public}@", buf, 0x16u);
        [v14 count];
        _MBLog();
      }

      uint64_t v19 = +[MBMobileInstallation displayNamesForDomainNames:v14 domainManager:v13];
      CFStringRef v17 = MBGetDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [v19 count];
        *(_DWORD *)buf = 134218242;
        id v26 = v20;
        __int16 v27 = 2114;
        long long v28 = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Found %ld display names: %{public}@", buf, 0x16u);
        [v19 count];
        _MBLog();
      }
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v15;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to fetch the failed domain names: %@", buf, 0xCu);
        _MBLog();
      }
      uint64_t v19 = 0;
    }
  }
  else
  {
    uint64_t v19 = 0;
    id v15 = v11;
  }

  return v19;
}

- (BOOL)_isRestoreFromMegaBackup:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._stateQueue);
  id v7 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v6];
  unsigned int v8 = +[MBCKOperationPolicy expensiveCellularPolicy];
  int v9 = [(MBCKManager *)self databaseManager];
  id v10 = +[MBCKOperationTracker operationTrackerWithAccount:v6 databaseManager:v9 policy:v8 error:a4];

  if (v10)
  {
    id v11 = [v7 deviceForRestore];
    if ([v11 fetchSnapshotsWithOperationTracker:v10 error:a4])
    {
      id v12 = [v7 restoreSession];
      id v13 = [v12 snapshotUUID];

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v14 = [v11 snapshots];
      id v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v15)
      {
        dispatch_time_t v22 = v11;
        id v23 = v8;
        id v24 = v7;
        uint64_t v16 = *(void *)v26;
        while (2)
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v14);
            }
            id v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            uint64_t v19 = [v18 snapshotID];
            unsigned int v20 = [v19 isEqualToString:v13];

            if (v20)
            {
              LOBYTE(v15) = [v18 backupPolicy] == (id)1;
              goto LABEL_15;
            }
          }
          id v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v15) {
            continue;
          }
          break;
        }
LABEL_15:
        unsigned int v8 = v23;
        id v7 = v24;
        id v11 = v22;
      }
    }
    else
    {
      LOBYTE(v15) = 0;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return (char)v15;
}

- (void)_alertUserOfFinishedRestoreForAccount:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._stateQueue);
  if (!v4) {
    __assert_rtn("-[MBCKManager _alertUserOfFinishedRestoreForAccount:]", "MBCKManager.m", 908, "account");
  }
  id v5 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v4];
  id v6 = [(MBCKManager *)self _domainDisplayNamesForFailedDomainsWithAccount:v4];
  if (![v6 count])
  {
    id v10 = [v5 restoreSession];
    unsigned int v11 = [v10 wasCancelled];

    unsigned int v12 = [v4 isPrimaryAccount];
    id v13 = [v5 restore];
    id v14 = [v13 restoredSnapshotBackupPolicy];
    id v15 = [v14 integerValue];

    uint64_t v16 = MBGetDefaultLog();
    int v9 = v16;
    if ((v11 & 1) != 0 || !v12 || v15 == (id)1)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109632;
        unsigned int v19 = v11;
        __int16 v20 = 1024;
        unsigned int v21 = v12;
        __int16 v22 = 1024;
        BOOL v23 = v15 == (id)1;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Not alerting user of restore finished cancelled:%d isPrimaryAccount:%d isRestoreFromMegaBackup:%d", buf, 0x14u);
        _MBLog();
      }
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Alerting user of restore finished", buf, 2u);
        _MBLog();
      }

      int v9 = +[MBFollowUpManager sharedManager];
      id v17 = [v9 postFollowUpForRestoreFinishedForAccount:v4 skipiCloudQuotaOffer:0];
    }
    goto LABEL_15;
  }
  id v7 = +[MBFollowUpManager sharedManager];
  id v8 = [v7 postFollowUpForRestoreFailedForAccount:v4 failedDomainDisplayNames:v6];

  if (MBIsInternalInstall()
    && !dword_1004823D0
    && !atomic_fetch_add_explicit(&dword_1004823D0, 1u, memory_order_relaxed))
  {
    CFStringRef v24 = @"failedDomainNames";
    long long v25 = v6;
    int v9 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    _MBCreateDiagnosticReport(@"Restore Incomplete", v9);
LABEL_15:
  }
}

- (void)postFollowUpForRestoreFailedForAccount:(id)a3 failedDomainNames:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  if (!v12) {
    __assert_rtn("-[MBCKManager postFollowUpForRestoreFailedForAccount:failedDomainNames:]", "MBCKManager.m", 938, "account");
  }
  id v6 = objc_alloc((Class)MBDomainManager);
  id v7 = [v12 persona];
  id v8 = [v6 initWithPersona:v7];

  int v9 = +[MBMobileInstallation displayNamesForDomainNames:v5 domainManager:v8];
  id v10 = +[MBFollowUpManager sharedManager];
  id v11 = [v10 postFollowUpForRestoreFailedForAccount:v12 failedDomainDisplayNames:v9];
}

- (void)_warnUserOfPowerBudgetSuspendingRestoreForAccount:(id)a3
{
  id v3 = a3;
  id v8 = +[MBUserNotification notification];
  [v8 setIdentifier:@"RestoreOverBudget"];
  [v8 setInterval:86400.0];
  id v4 = MBLocalizedStringFromTable();
  [v8 setTitle:v4];

  id v5 = MBLocalizedStringFromTable();
  [v8 setBody:v5];

  id v6 = MBLocalizedStringFromTable();
  [v8 setButton:v6];

  id v7 = +[MBUserNotificationManager sharedManager];
  [v7 presentUserNotification:v8 account:v3];
}

- (BOOL)isPowerBudgetAvailableForRestore
{
  return 1;
}

- (BOOL)isPrebuddyBackupInProgress:(id)a3
{
  BOOL v4 = [(MBCKManager *)self _isMegaBackupMode];
  if (v4) {
    LOBYTE(v4) = ![(MBCKManager *)self _isInitialMegaBackupCompleted];
  }
  return v4;
}

- (void)_keychainSyncStatusDidChange
{
  id v3 = [(MBServiceManager *)self account];
  [(MBCKManager *)self updatePrebuddyFollowUp:v3];
}

- (BOOL)setupBackupWithPasscode:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6
{
  id v36 = a3;
  id v10 = a4;
  id v37 = a5;
  if (!v10) {
    __assert_rtn("-[MBCKManager setupBackupWithPasscode:account:connection:error:]", "MBCKManager.m", 981, "serviceAccount");
  }
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  char v61 = 0;
  uint64_t v52 = 0;
  __int16 v53 = (id *)&v52;
  uint64_t v54 = 0x3032000000;
  __int16 v55 = sub_1000AD5B8;
  v56 = sub_1000AD5C8;
  id v57 = 0;
  id v11 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v10];
  stateQueue = self->super._stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B1A30;
  block[3] = &unk_1004120A0;
  id v13 = v11;
  id v49 = v13;
  id v50 = &v52;
  v51 = &v58;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v59 + 24))
  {
    *((unsigned char *)v59 + 24) = 0;
    id v14 = self->super._stateQueue;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1000B1B18;
    v44[3] = &unk_1004120A0;
    id v15 = v13;
    id v45 = v15;
    long long v46 = &v52;
    long long v47 = &v58;
    dispatch_sync(v14, v44);
    if (*((unsigned char *)v59 + 24))
    {
      *((unsigned char *)v59 + 24) = 0;
      uint64_t v16 = v53;
      id obj = v53[5];
      id v35 = [(MBCKManager *)self openCacheWithAccount:v10 accessType:1 error:&obj];
      objc_storeStrong(v16 + 5, obj);
      if (v35)
      {
        unsigned __int8 v34 = +[MBCKOperationPolicy expensiveCellularPolicy];
        id v17 = [(MBCKManager *)self databaseManager];
        id v18 = v53;
        id v42 = v53[5];
        unsigned int v19 = +[MBCKOperationTracker operationTrackerWithAccount:v10 databaseManager:v17 policy:v34 error:&v42];
        objc_storeStrong(v18 + 5, v42);

        if (v19)
        {
          __int16 v20 = [v37 processName];
          unsigned int v21 = [v34 operationGroupWithName:@"setupBackup" processName:v20];
          [v19 setCkOperationGroup:v21];

          __int16 v22 = v53;
          id v41 = v53[5];
          id v33 = +[MBCKAccount fetchAccountWithOperationTracker:v19 cache:v35 create:1 error:&v41];
          objc_storeStrong(v22 + 5, v41);
          if (v33)
          {
            BOOL v23 = MBDeviceUUID();
            CFStringRef v24 = v53;
            id v40 = v53[5];
            unsigned __int8 v25 = [v33 setupDeviceWithOperationTracker:v19 deviceUUID:v23 passcode:v36 error:&v40];
            objc_storeStrong(v24 + 5, v40);

            if (v25)
            {
              *((unsigned char *)v59 + 24) = 1;
            }
            else
            {
              long long v29 = MBGetDefaultLog();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                id v30 = v53[5];
                *(_DWORD *)buf = 138412290;
                id v63 = v30;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to setup backup: %@", buf, 0xCu);
                _MBLog();
              }
            }
          }
          else
          {
            long long v27 = MBGetDefaultLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              id v28 = v53[5];
              *(_DWORD *)buf = 138412290;
              id v63 = v28;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to fetch account: %@", buf, 0xCu);
              _MBLog();
            }
          }
        }
      }
      long long v31 = self->super._stateQueue;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_1000B1C90;
      v38[3] = &unk_100411128;
      id v39 = v15;
      dispatch_sync(v31, v38);
      BOOL v26 = *((unsigned char *)v59 + 24) != 0;
      if (a6 && !*((unsigned char *)v59 + 24)) {
        *a6 = v53[5];
      }
    }
    else
    {
      BOOL v26 = 0;
      if (a6) {
        *a6 = v53[5];
      }
    }
  }
  else
  {
    BOOL v26 = 0;
    if (a6) {
      *a6 = v53[5];
    }
  }

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  return v26;
}

- (void)setBackupEnabled:(BOOL)a3 account:(id)a4 connection:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8) {
    __assert_rtn("-[MBCKManager setBackupEnabled:account:connection:]", "MBCKManager.m", 1052, "account");
  }
  id v10 = v9;
  id v11 = [v8 persona];
  id v12 = [v11 volumeMountPoint];
  if (v6)
  {
    +[MBFileSystemManager stopFilesystemKeyRollingWithPath:v12 error:0];
LABEL_4:

    goto LABEL_16;
  }
  +[MBFileSystemManager startFilesystemKeyRollingWithPath:v12 error:0];

  if ([v8 isPrimaryAccount])
  {
    id v13 = +[MBLockdown connect];
    if (v13)
    {
      id v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Clearing dateOfLastBackup from lockdown", buf, 2u);
        _MBLog();
      }

      id v31 = 0;
      unsigned __int8 v15 = [v13 removeObjectWithDomain:@"com.apple.mobile.backup" andKey:@"LastCloudBackupDate" withError:&v31];
      id v16 = v31;
      if ((v15 & 1) == 0)
      {
        id v17 = MBGetDefaultLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to clear dateOfLastBackup from lockdown: %@", buf, 0xCu);
          id v23 = v16;
          _MBLog();
        }
      }
    }
    objc_msgSend(v13, "disconnect", v23);
  }
  id v18 = +[MBXPCServer sharedInstance];
  uint64_t v19 = [v18 scheduler];
  [(id)v19 clearNilBackupDateFetchDateForAccount:v8];

  id v30 = 0;
  LOBYTE(v19) = [(MBCKManager *)self resetCacheWithAccount:v8 error:&v30];
  id v11 = v30;
  if ((v19 & 1) == 0)
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to reset cache: %@", buf, 0xCu);
      _MBLog();
    }
    goto LABEL_4;
  }
LABEL_16:

  __int16 v20 = dispatch_group_create();
  dispatch_group_enter(v20);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000B2090;
  v28[3] = &unk_100411060;
  unsigned int v21 = v20;
  long long v29 = v21;
  [v8 setBackupEnabled:v6 completion:v28];
  MBGroupWaitForever();
  __int16 v22 = [(MBCKManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B2098;
    block[3] = &unk_100412B28;
    id v25 = v22;
    BOOL v26 = self;
    BOOL v27 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)syncBackupEnabledWithAccount:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    __assert_rtn("-[MBCKManager syncBackupEnabledWithAccount:connection:]", "MBCKManager.m", 1100, "account");
  }
  id v9 = v8;
  id v10 = (void *)os_transaction_create();
  id v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Syncing backup enabled", buf, 2u);
    _MBLog();
  }

  id v12 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v7];
  *(void *)buf = 0;
  id v28 = buf;
  uint64_t v29 = 0x2020000000;
  int v30 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B23DC;
  block[3] = &unk_100412050;
  BOOL v26 = buf;
  id v14 = v12;
  id v25 = v14;
  dispatch_sync(stateQueue, block);
  if ((*((_DWORD *)v28 + 6) - 4) > 2)
  {
    id v16 = +[MBDaemon sharedDaemon];
    [v16 holdWorkAssertion:a2];

    id v17 = dispatch_get_global_queue(17, 0);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000B2410;
    v18[3] = &unk_100412AD8;
    v18[4] = self;
    id v19 = v7;
    id v20 = v9;
    SEL v22 = a2;
    id v21 = v10;
    dispatch_async(v17, v18);
  }
  else
  {
    unsigned __int8 v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Ignoring syncBackupEnabled during restore", v23, 2u);
      _MBLog();
    }
  }
  _Block_object_dispose(buf, 8);
}

- (BOOL)isBackupEnabledForDomainName:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[MBAppManager appManager];
  id v8 = [v6 persona];
  id v9 = [v7 allDisabledDomainNamesForPersona:v8];

  if (!v9) {
    __assert_rtn("-[MBCKManager isBackupEnabledForDomainName:account:]", "MBCKManager.m", 1130, "disabledDomains");
  }
  char v10 = [v9 containsObject:v5] ^ 1;

  return v10;
}

- (void)setBackupEnabled:(BOOL)a3 forDomainName:(id)a4 account:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      id v11 = "Enabling";
    }
    else {
      id v11 = "Disabling";
    }
    *(_DWORD *)buf = 136315394;
    id v17 = v11;
    __int16 v18 = 2114;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s domain \"%{public}@\"", buf, 0x16u);
    id v14 = v11;
    id v15 = v8;
    _MBLog();
  }

  id v12 = [v9 persona];
  id v13 = +[MBAppManager appManager];
  [v13 setEnabled:v6 forDomainName:v8 persona:v12];
  if ([v8 isEqualToString:@"AppDomain-com.apple.iBooks"]) {
    [v13 setEnabled:v6 forDomainName:@"BooksDomain" persona:v12];
  }
  if (objc_msgSend(v8, "isEqualToString:", @"AppDomain-com.apple.Health", v14, v15))
  {
    [v13 setEnabled:v6 forDomainName:@"HealthDomain" persona:v12];
    [v13 setEnabled:v6 forDomainName:@"AppDomain-com.apple.HealthPrivacyService" persona:v12];
  }
  if ([v8 isEqualToString:@"HealthDomain"])
  {
    [v13 setEnabled:v6 forDomainName:@"AppDomain-com.apple.Health" persona:v12];
    [v13 setEnabled:v6 forDomainName:@"AppDomain-com.apple.HealthPrivacyService" persona:v12];
  }
  if ([v8 isEqualToString:@"AppDomain-com.apple.HealthPrivacyService"])
  {
    [v13 setEnabled:v6 forDomainName:@"AppDomain-com.apple.Health" persona:v12];
    [v13 setEnabled:v6 forDomainName:@"HealthDomain" persona:v12];
  }
  [(MBCKManager *)self updatePrebuddyFollowUp:v9];
}

- (void)setAllowiTunesBackup:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MBCKManager;
  [(MBServiceManager *)&v3 setAllowiTunesBackup:a3];
}

- (BOOL)allowiTunesBackup
{
  v3.receiver = self;
  v3.super_class = (Class)MBCKManager;
  return [(MBServiceManager *)&v3 allowiTunesBackup];
}

- (id)backupStateInfoForInitialMegaBackup:(BOOL)a3 account:(id)a4
{
  id v6 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKManager backupStateInfoForInitialMegaBackup:account:]", "MBCKManager.m", 1175, "account");
  }
  id v7 = v6;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->super._stateQueue);
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_1000AD5B8;
  id v20 = sub_1000AD5C8;
  id v21 = 0;
  stateQueue = self->super._stateQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000B2970;
  v12[3] = &unk_1004120C8;
  id v13 = v7;
  id v14 = &v16;
  BOOL v15 = a3;
  v12[4] = self;
  id v9 = v7;
  dispatch_sync(stateQueue, v12);
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)_copyBackupStateInfoForInitialMegaBackup:(BOOL)a3 account:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKManager _copyBackupStateInfoForInitialMegaBackup:account:]", "MBCKManager.m", 1192, "account");
  }
  id v7 = v6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._stateQueue);
  id v8 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v7];
  uint64_t v9 = [v7 accountIdentifier];
  if (!v9) {
    __assert_rtn("-[MBCKManager _copyBackupStateInfoForInitialMegaBackup:account:]", "MBCKManager.m", 1196, "accountIdentifier");
  }
  id v10 = (void *)v9;
  if (v4) {
    [v8 initialMegaBackup];
  }
  else {
  id v11 = [v8 backup];
  }
  if (!v11)
  {
    id v11 = [(id)objc_opt_class() loadBackupStateInfoForInitialMegaBackup:v4 account:v7];
    if (!v11 && !v4) {
      id v11 = [objc_alloc((Class)MBStateInfo) initWithState:0 progress:0 estimatedTimeRemaining:0 error:0 errors:0.0];
    }
    if (v11)
    {
      if (v4) {
        [v8 setInitialMegaBackup:v11];
      }
      else {
        [v8 setBackup:v11];
      }
    }
  }
  id v12 = [v11 copy];

  return v12;
}

+ (id)_removeIncompatibleSnapshotsWithAccountType:(int64_t)a3 device:(id)a4 snapshots:(id)a5
{
  id v7 = a5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000B2C14;
  v11[3] = &unk_1004120E8;
  unsigned __int8 v12 = [a4 canRestoreSystemFiles];
  v11[4] = a3;
  id v8 = +[NSPredicate predicateWithBlock:v11];
  uint64_t v9 = [v7 filteredArrayUsingPredicate:v8];

  return v9;
}

- (id)getBackupListWithOperationTracker:(id)a3 shouldFilter:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBCKManager getBackupListWithOperationTracker:shouldFilter:error:]", "MBCKManager.m", 1237, "tracker");
  }
  id v7 = v6;
  id v8 = [v6 account];
  id v45 = v8;
  if (!v8) {
    __assert_rtn("-[MBCKManager getBackupListWithOperationTracker:shouldFilter:error:]", "MBCKManager.m", 1239, "serviceAccount");
  }
  uint64_t v9 = [v8 persona];
  id v10 = [v9 accountType];

  id v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v12 = [v45 accountIdentifier];
    id v13 = [v45 persona];
    id v14 = [v13 personaIdentifier];
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v107) = v5;
    WORD2(v107) = 2048;
    *(void *)((char *)&v107 + 6) = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Fetching iCloud backups for account %{public}@(%{public}@), filter:%d, accountType:%ld", buf, 0x26u);

    BOOL v15 = [v45 accountIdentifier];
    uint64_t v16 = [v45 persona];
    id v39 = [v16 personaIdentifier];
    _MBLog();
  }
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v18 = objc_opt_new();
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&long long v107 = sub_1000AD5B8;
  *((void *)&v107 + 1) = sub_1000AD5C8;
  id v108 = 0;
  v99[0] = 0;
  v99[1] = v99;
  v99[2] = 0x3032000000;
  v99[3] = sub_1000AD5B8;
  v99[4] = sub_1000AD5C8;
  id v100 = 0;
  uint64_t v95 = 0;
  id v96 = &v95;
  uint64_t v97 = 0x2020000000;
  char v98 = 0;
  uint64_t v89 = 0;
  id v90 = &v89;
  uint64_t v91 = 0x3032000000;
  SEL v92 = sub_1000AD5B8;
  int v93 = sub_1000AD5C8;
  id v94 = 0;
  dispatch_group_t v19 = dispatch_group_create();
  id v20 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B377C;
  block[3] = &unk_100412138;
  id v21 = v7;
  id v82 = v21;
  id v85 = &v95;
  v86 = &v89;
  id v87 = buf;
  id v22 = v18;
  id v83 = v22;
  uint64_t v84 = v19;
  id v88 = v99;
  group = v84;
  dispatch_group_async(v84, v20, block);

  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x3032000000;
  v79[3] = sub_1000AD5B8;
  v79[4] = sub_1000AD5C8;
  id v80 = 0;
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_1000B3C34;
  v74[3] = &unk_1004120C8;
  v77 = v79;
  BOOL v78 = v5;
  id v40 = v21;
  id v75 = v40;
  v76 = self;
  dispatch_group_async(group, v20, v74);

  uint64_t v68 = 0;
  id v69 = &v68;
  uint64_t v70 = 0x3032000000;
  id v71 = sub_1000AD5B8;
  v72 = sub_1000AD5C8;
  id v73 = 0;
  uint64_t v62 = 0;
  id v63 = &v62;
  uint64_t v64 = 0x3032000000;
  id v65 = sub_1000AD5B8;
  id v66 = sub_1000AD5C8;
  id v67 = 0;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_1000B3CF0;
  v51[3] = &unk_1004121A0;
  uint64_t v54 = &v95;
  __int16 v55 = v79;
  v56 = buf;
  id v57 = v99;
  id v41 = v22;
  id v52 = v41;
  __int16 v53 = self;
  v59 = &v62;
  id v60 = v10;
  BOOL v61 = v5;
  uint64_t v58 = &v68;
  dispatch_block_t v42 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v51);
  dispatch_group_notify(group, v20, v42);

  dispatch_block_wait(v42, 0xFFFFFFFFFFFFFFFFLL);
  if (*((unsigned char *)v96 + 24))
  {
    double v23 = CFAbsoluteTimeGetCurrent();
    CFStringRef v24 = MBGetDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      double v25 = v23 - Current;
      BOOL v26 = v24;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = [(id)v63[5] count];
        *(_DWORD *)v102 = 134218240;
        id v103 = v27;
        __int16 v104 = 2048;
        double v105 = v25;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Found %lu iCloud backups, t:%.3fs", v102, 0x16u);
      }

      [(id)v63[5] count];
      _MBLog();
    }

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v28 = (id)v63[5];
    id v29 = [v28 countByEnumeratingWithState:&v47 objects:v101 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v48;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v48 != v30) {
            objc_enumerationMutation(v28);
          }
          unsigned __int8 v32 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          id v33 = MBGetDefaultLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v102 = 138412290;
            id v103 = v32;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Found %@", v102, 0xCu);
            _MBLog();
          }
        }
        id v29 = [v28 countByEnumeratingWithState:&v47 objects:v101 count:16];
      }
      while (v29);
    }

    unsigned __int8 v34 = self;
    objc_sync_enter(v34);
    [(MBCKManager *)v34 setCachedBackupsByUDID:v69[5]];
    objc_sync_exit(v34);

    id v35 = (id)v63[5];
  }
  else
  {
    if (!v90[5]) {
      __assert_rtn("-[MBCKManager getBackupListWithOperationTracker:shouldFilter:error:]", "MBCKManager.m", 1379, "fetchError");
    }
    id v36 = MBGetDefaultLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      id v37 = (void *)v90[5];
      *(_DWORD *)v102 = 138412290;
      id v103 = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to fetch the iCloud backups: %@", v102, 0xCu);
      _MBLog();
    }

    id v35 = 0;
    if (a5) {
      *a5 = (id) v90[5];
    }
  }

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(v79, 8);
  _Block_object_dispose(&v89, 8);

  _Block_object_dispose(&v95, 8);
  _Block_object_dispose(v99, 8);

  _Block_object_dispose(buf, 8);
  return v35;
}

- (id)getBackupListWithFiltering:(BOOL)a3 account:(id)a4 connection:(id)a5 error:(id *)a6
{
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = a4;
  unsigned __int8 v12 = +[MBCKOperationPolicy expensiveCellularPolicy];
  id v13 = [(MBCKManager *)self databaseManager];
  id v14 = +[MBCKOperationTracker operationTrackerWithAccount:v11 databaseManager:v13 policy:v12 error:a6];

  if (v14)
  {
    BOOL v15 = [v10 processName];
    uint64_t v16 = [v12 operationGroupWithName:@"getBackups" processName:v15];
    [v14 setCkOperationGroup:v16];

    id v17 = [(MBCKManager *)self getBackupListWithOperationTracker:v14 shouldFilter:v8 error:a6];
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (BOOL)hardwareModelNeedsH8Workaround:(id)a3
{
  id v3 = a3;
  if (([v3 hasPrefix:@"N66"] & 1) != 0
    || ([v3 hasPrefix:@"N71"] & 1) != 0
    || ([v3 hasPrefix:@"J98"] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = [v3 hasPrefix:@"J99"];
  }

  return v4;
}

- (BOOL)shouldInheritBackupsFromDevice:(id)a3 toDevice:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8)
  {
    if (a5)
    {
      CFStringRef v13 = @"Reference to the old device is nil";
      goto LABEL_9;
    }
LABEL_10:
    BOOL v14 = 0;
    goto LABEL_42;
  }
  if (!v9)
  {
    BOOL v15 = [v8 deviceClass];
    uint64_t v16 = MBDeviceClass();
    if (v15)
    {
      if ([v15 isEqualToString:v16])
      {
        id v17 = [v8 hardwareModel];
        uint64_t v18 = MBHardwareModel();
        if (v17)
        {
          if ([(MBCKManager *)self hardwareModelNeedsH8Workaround:v17])
          {
            dispatch_group_t v19 = MBGetDefaultLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Snapshot was made on a device model that was potentially affected by 23631672. Not inheriting", buf, 2u);
              _MBLog();
            }

            if (a5)
            {
              CFStringRef v20 = @"Inheritance is not supported for backups made on devices that were affected by 23631672";
LABEL_38:
              +[MBError errorWithCode:1 format:v20];
              BOOL v14 = 0;
              *a5 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_40;
            }
          }
          else
          {
            if (![(MBCKManager *)self hardwareModelNeedsH8Workaround:v18])
            {
              BOOL v14 = 1;
              goto LABEL_40;
            }
            id v28 = MBGetDefaultLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Restoring to a device model that was affected by 23631672. Not inheriting", buf, 2u);
              _MBLog();
            }

            if (a5)
            {
              CFStringRef v20 = @"Inheritance is not supported when restoring to devices that were affected by 23631672";
              goto LABEL_38;
            }
          }
        }
        else
        {
          double v25 = MBGetDefaultLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            BOOL v26 = [v8 deviceUUID];
            *(_DWORD *)buf = 138412290;
            unsigned __int8 v34 = v26;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Couldn't determine the hardware model of the device %@ that made the backup snapshot", buf, 0xCu);

            unsigned __int8 v32 = [v8 deviceUUID];
            _MBLog();
          }
          if (a5)
          {
            id v27 = [v8 deviceUUID];
            *a5 = +[MBError errorWithCode:1, @"Couldn't determine the hardware model of old device %@. Not inheriting backups", v27 format];
          }
        }
        BOOL v14 = 0;
LABEL_40:

        goto LABEL_41;
      }
      CFStringRef v24 = MBGetDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        unsigned __int8 v34 = v15;
        __int16 v35 = 2112;
        id v36 = v16;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Not inheriting backups for cross-device restore. Old device class: %@, inheriting device class: %@", buf, 0x16u);
        _MBLog();
      }

      if (a5)
      {
        +[MBError errorWithCode:1, @"Inheriting backups is not supported across cross-device restores. Old device class: %@, Restoring device class: %@ ", v15, v16 format];
        BOOL v14 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_41:

        goto LABEL_42;
      }
    }
    else
    {
      id v21 = MBGetDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = [v8 deviceUUID];
        *(_DWORD *)buf = 138412290;
        unsigned __int8 v34 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Couldn't determine the device class of the old device %@", buf, 0xCu);

        id v31 = [v8 deviceUUID];
        _MBLog();
      }
      if (a5)
      {
        double v23 = [v8 deviceUUID];
        *a5 = +[MBError errorWithCode:1, @"Couldn't determine the device class of old device %@. Not inheriting backups", v23 format];
      }
    }
    BOOL v14 = 0;
    goto LABEL_41;
  }
  id v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    unsigned __int8 v12 = [v10 deviceUUID];
    *(_DWORD *)buf = 138412290;
    unsigned __int8 v34 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Device record already exists for the device being restored to (%@). Can't inherit", buf, 0xCu);

    uint64_t v30 = [v10 deviceUUID];
    _MBLog();
  }
  if (!a5) {
    goto LABEL_10;
  }
  CFStringRef v13 = @"Device record already exists for the currently restoring device. Not inheriting snapshot";
LABEL_9:
  +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, v13, v30);
  BOOL v14 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:

  return v14;
}

- (BOOL)inheritSnapshotWithAccount:(id)a3 fromSnapshot:(id)a4 fromDevice:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10) {
    __assert_rtn("-[MBCKManager inheritSnapshotWithAccount:fromSnapshot:fromDevice:error:]", "MBCKManager.m", 1475, "serviceAccount");
  }
  CFStringRef v13 = v12;
  if (![v10 isBeneficiaryAccount])
  {
    if (!v11 || !v13)
    {
      if (a6)
      {
        id v15 = +[MBError errorWithCode:1 format:@"Both snapshotID and deviceUUID need to be specified to inherit backups"];
        goto LABEL_27;
      }
LABEL_28:
      BOOL v32 = 0;
      goto LABEL_112;
    }
    v106 = +[MBCKOperationPolicy expensiveCellularPolicy];
    uint64_t v16 = [(MBCKManager *)self databaseManager];
    long long v107 = +[MBCKOperationTracker operationTrackerWithAccount:v10 databaseManager:v16 policy:v106 error:a6];

    if (!v107)
    {
      BOOL v32 = 0;
LABEL_111:

      goto LABEL_112;
    }
    id v17 = [v106 operationGroupWithName:@"inheritBackup"];
    [v107 setCkOperationGroup:v17];

    double v105 = [(MBCKManager *)self openCacheWithAccount:v10 accessType:1 error:a6];
    if (!v105)
    {
      BOOL v32 = 0;
LABEL_110:

      goto LABEL_111;
    }
    *(void *)buf = 0;
    v124 = buf;
    uint64_t v125 = 0x3032000000;
    v126 = sub_1000AD5B8;
    v127 = sub_1000AD5C8;
    id v128 = 0;
    id v103 = v13;
    v102 = MBDeviceUUID();
    uint64_t v18 = (id *)(v124 + 40);
    id obj = (id)*((void *)v124 + 5);
    __int16 v104 = +[MBCKAccount fetchAccountWithOperationTracker:v107 cache:v105 error:&obj];
    objc_storeStrong(v18, obj);
    if (v104)
    {
      dispatch_group_t v19 = (id *)(v124 + 40);
      id v121 = (id)*((void *)v124 + 5);
      unsigned __int8 v20 = [v104 fetchDevicesWithOperationTracker:v107 error:&v121];
      objc_storeStrong(v19, v121);
      if (v20)
      {
        uint64_t v21 = [v104 deviceForUUID:v102];
        id v22 = [v104 deviceForUUID:v103];
        id v100 = (void *)v21;
        if (!v22)
        {
          uint64_t v38 = MBGetDefaultLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v129 = 138412290;
            *(void *)&v129[4] = v103;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Couldn't find device record for old device %@ under the account. Not inheriting backups", v129, 0xCu);
            _MBLog();
          }

          if (a6)
          {
            +[MBError errorWithCode:1, @"Couldn't find device record for old device %@. Can't inherit backups from this device", v103 format];
            BOOL v32 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            BOOL v32 = 0;
          }
          id v22 = 0;
          goto LABEL_108;
        }
        if (![(MBCKManager *)self shouldInheritBackupsFromDevice:v22 toDevice:v21 error:a6])
        {
          BOOL v32 = 0;
LABEL_108:

          goto LABEL_109;
        }
        double v23 = (id *)(v124 + 40);
        id v120 = (id)*((void *)v124 + 5);
        unsigned __int8 v24 = [v22 fetchSnapshotsWithOperationTracker:v107 retry:1 error:&v120];
        uint64_t v97 = v22;
        objc_storeStrong(v23, v120);
        if ((v24 & 1) == 0)
        {
          id v39 = MBGetDefaultLog();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            uint64_t v40 = *((void *)v124 + 5);
            *(_DWORD *)v129 = 138412546;
            *(void *)&v129[4] = v103;
            *(_WORD *)&v129[12] = 2112;
            *(void *)&v129[14] = v40;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Couldn't fetch snapshot records for old device %@ - %@", v129, 0x16u);
            _MBLog();
          }

          BOOL v32 = 0;
          if (a6) {
            *a6 = *((id *)v124 + 5);
          }
          goto LABEL_107;
        }
        long long v119 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v116 = 0u;
        double v25 = [v22 snapshots];
        id v26 = [v25 countByEnumeratingWithState:&v116 objects:v131 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v117;
          id v98 = v25;
LABEL_18:
          uint64_t v28 = 0;
          while (1)
          {
            if (*(void *)v117 != v27) {
              objc_enumerationMutation(v98);
            }
            id v29 = *(void **)(*((void *)&v116 + 1) + 8 * v28);
            uint64_t v30 = [v29 snapshotID];
            unsigned int v31 = [v30 isEqualToString:v11];

            if (v31) {
              break;
            }
            if (v26 == (id)++v28)
            {
              double v25 = v98;
              id v26 = [v98 countByEnumeratingWithState:&v116 objects:v131 count:16];
              if (v26) {
                goto LABEL_18;
              }
              goto LABEL_24;
            }
          }
          id v41 = [v29 productVersion];
          if (!v41
            || (MBProductVersion(),
                dispatch_block_t v42 = objc_claimAutoreleasedReturnValue(),
                BOOL v43 = MBCompareVersionStrings() == -1,
                v42,
                !v43))
          {
            id v44 = v29;

            if (!v44) {
              goto LABEL_62;
            }
            [v44 snapshotFormat];
            if (MBSnapshotFormatContainsFileLists())
            {
              id v45 = MBGetDefaultLog();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                long long v46 = v45;
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  long long v47 = MBStringForSnapshotFormat();
                  *(_DWORD *)v129 = 138412290;
                  *(void *)&v129[4] = v47;
                  _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Not inheriting snapshot with format %@", v129, 0xCu);
                }
                uint64_t v91 = MBStringForSnapshotFormat();
                _MBLog();
              }
              if (a6)
              {
                long long v48 = MBStringForSnapshotFormat();
                *a6 = +[MBError errorWithCode:1, @"Not enabling inheriting snapshot with format %@", v48 format];
              }
              goto LABEL_88;
            }
            long long v50 = MBGetDefaultLog();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v129 = 138412290;
              *(void *)&v129[4] = v102;
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Creating new device record for device %@", v129, 0xCu);
              _MBLog();
            }

            v51 = [MBCKDevice alloc];
            id v52 = [v107 account];
            v99 = -[MBCKDevice initWithUUID:cache:backupEnabled:](v51, "initWithUUID:cache:backupEnabled:", v102, 0, [v52 isEnabled]);

            __int16 v53 = (id *)(v124 + 40);
            id v115 = (id)*((void *)v124 + 5);
            [v104 addDevice:v99 error:&v115];
            objc_storeStrong(v53, v115);
            uint64_t v54 = (id *)(v124 + 40);
            id v114 = (id)*((void *)v124 + 5);
            LOBYTE(v51) = [(MBCKModel *)v99 saveWithOperationTracker:v107 error:&v114];
            objc_storeStrong(v54, v114);
            if (v51)
            {
              __int16 v55 = (id *)(v124 + 40);
              id v113 = (id)*((void *)v124 + 5);
              unsigned __int8 v56 = [v104 saveWithOperationTracker:v107 error:&v113];
              objc_storeStrong(v55, v113);
              if (v56)
              {
                id v57 = [v44 snapshotFormat];
                uint64_t v58 = MBRandomUUID();
                v59 = +[MBCKSnapshot snapshotForDevice:v99 reason:0 type:4 snapshotFormat:v57 snapshotID:v58];

                [v59 setIsInherited:1];
                id v60 = [v44 backupProperties];
                [v59 setBackupProperties:v60];

                BOOL v61 = MBGetDefaultLog();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
                {
                  uint64_t v62 = v61;
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                  {
                    id v63 = [v59 backupProperties];
                    id v64 = [v63 length];
                    *(_DWORD *)v129 = 134217984;
                    *(void *)&v129[4] = v64;
                    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "Found %lu bytes for buddy stash data on the old snapshot. Copied it over to the inheriting snapshot record", v129, 0xCu);
                  }
                  id v65 = [v59 backupProperties];
                  [v65 length];
                  _MBLog();
                }
                id v66 = (id *)(v124 + 40);
                id v112 = (id)*((void *)v124 + 5);
                unsigned __int8 v67 = [v59 saveWithOperationTracker:v107 error:&v112];
                objc_storeStrong(v66, v112);
                if (v67)
                {
                  id v68 = objc_alloc((Class)CKReference);
                  id v69 = [v97 recordID];
                  id v96 = [v68 initWithRecordID:v69 action:0];

                  id v70 = objc_alloc((Class)CKReference);
                  id v71 = [(MBCKModel *)v99 recordID];
                  id v95 = [v70 initWithRecordID:v71 action:0];

                  id v72 = objc_alloc((Class)CKReference);
                  id v73 = [v44 recordID];
                  id v94 = [v72 initWithRecordID:v73 action:0];

                  id v74 = objc_alloc((Class)CKReference);
                  id v75 = [v59 recordID];
                  id v76 = [v74 initWithRecordID:v75 action:0];

                  uint64_t v77 = +[NSPredicate predicateWithFormat:@"oldDevice==%@ AND newDevice==%@ AND restoreSnapshot==%@ AND inheritedSnapshot==%@", v96, v95, v94, v76];
                  id v93 = [objc_alloc((Class)CKQuery) initWithRecordType:@"InheritBackup" predicate:v77];
                  SEL v92 = (void *)v77;
                  dispatch_semaphore_t v78 = dispatch_semaphore_create(0);
                  *(void *)v129 = 0;
                  *(void *)&v129[8] = v129;
                  *(void *)&v129[16] = 0x2020000000;
                  char v130 = 0;
                  id v101 = [objc_alloc((Class)CKQueryOperation) initWithQuery:v93];
                  [v101 setFetchAllResults:1];
                  [v101 setRecordFetchedBlock:&stru_1004121E0];
                  v108[0] = _NSConcreteStackBlock;
                  v108[1] = 3221225472;
                  v108[2] = sub_1000B5DFC;
                  v108[3] = &unk_100412208;
                  id v110 = buf;
                  objc_super v111 = v129;
                  v79 = v78;
                  id v109 = v79;
                  [v101 setQueryCompletionBlock:v108];
                  [v107 addDatabaseOperation:v101];
                  MBSemaphoreWaitForever();
                  int v80 = *(unsigned __int8 *)(*(void *)&v129[8] + 24);
                  if (*(unsigned char *)(*(void *)&v129[8] + 24))
                  {
                    v81 = +[MBXPCServer sharedInstance];
                    id v82 = [v81 scheduler];
                    [v82 clearNilBackupDateFetchDateForAccount:v10];

                    int v80 = *(unsigned __int8 *)(*(void *)&v129[8] + 24);
                  }
                  if (a6 && !v80)
                  {
                    *a6 = *((id *)v124 + 5);
                    int v80 = *(unsigned __int8 *)(*(void *)&v129[8] + 24);
                  }
                  BOOL v32 = v80 != 0;

                  _Block_object_dispose(v129, 8);
                }
                else
                {
                  uint64_t v89 = MBGetDefaultLog();
                  if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)v129 = 0;
                    _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "Couldn't save new snapshot record to inherit to", v129, 2u);
                    _MBLog();
                  }

                  BOOL v32 = 0;
                  if (a6) {
                    *a6 = *((id *)v124 + 5);
                  }
                }

                goto LABEL_105;
              }
              id v87 = MBGetDefaultLog();
              if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
              {
                uint64_t v88 = *((void *)v124 + 5);
                *(_DWORD *)v129 = 138412546;
                *(void *)&v129[4] = v102;
                *(_WORD *)&v129[12] = 2112;
                *(void *)&v129[14] = v88;
                _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "Couldn't add new device to account record for device %@ - %@", v129, 0x16u);
                _MBLog();
              }

              if (a6)
              {
                id v86 = *((id *)v124 + 5);
                goto LABEL_98;
              }
            }
            else
            {
              uint64_t v84 = MBGetDefaultLog();
              if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
              {
                uint64_t v85 = *((void *)v124 + 5);
                *(_DWORD *)v129 = 138412546;
                *(void *)&v129[4] = v102;
                *(_WORD *)&v129[12] = 2112;
                *(void *)&v129[14] = v85;
                _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "Couldn't save new device record for device %@ - %@", v129, 0x16u);
                _MBLog();
              }

              if (a6)
              {
                id v86 = *((id *)v124 + 5);
LABEL_98:
                BOOL v32 = 0;
                *a6 = v86;
LABEL_105:
                id v100 = v99;
                goto LABEL_106;
              }
            }
            BOOL v32 = 0;
            goto LABEL_105;
          }
          id v83 = MBGetDefaultLog();
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v129 = 138412546;
            *(void *)&v129[4] = v11;
            *(_WORD *)&v129[12] = 2112;
            *(void *)&v129[14] = v103;
            _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "Ignoring snapshot %@ from the old device %@ since it was created on a newer OS version", v129, 0x16u);
            _MBLog();
          }

          if (a6)
          {
            *a6 = +[MBError errorWithCode:1 format:@"The snapshot record was created on a newer OS version"];
          }
        }
        else
        {
LABEL_24:

LABEL_62:
          long long v49 = MBGetDefaultLog();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v129 = 138412546;
            *(void *)&v129[4] = v11;
            *(_WORD *)&v129[12] = 2112;
            *(void *)&v129[14] = v103;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Couldn't find snapshot record for snapshot ID %@ on the old device %@", v129, 0x16u);
            _MBLog();
          }

          if (a6)
          {
            +[MBError errorWithCode:1, @"Couldn't find snapshot record for snapshot %@ under device %@", v11, v103 format];
            id v44 = 0;
            BOOL v32 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_106:

LABEL_107:
            id v22 = v97;
            goto LABEL_108;
          }
        }
        id v44 = 0;
LABEL_88:
        BOOL v32 = 0;
        goto LABEL_106;
      }
      id v36 = MBGetDefaultLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = *((void *)v124 + 5);
        *(_DWORD *)v129 = 138412290;
        *(void *)&v129[4] = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Couldn't fetch device records - %@", v129, 0xCu);
        _MBLog();
      }

      if (a6)
      {
        id v35 = *((id *)v124 + 5);
        goto LABEL_39;
      }
    }
    else
    {
      id v33 = MBGetDefaultLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v34 = *((void *)v124 + 5);
        *(_DWORD *)v129 = 138412290;
        *(void *)&v129[4] = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Couldn't fetch account record - %@", v129, 0xCu);
        _MBLog();
      }

      if (a6)
      {
        id v35 = *((id *)v124 + 5);
LABEL_39:
        BOOL v32 = 0;
        *a6 = v35;
LABEL_109:

        _Block_object_dispose(buf, 8);
        goto LABEL_110;
      }
    }
    BOOL v32 = 0;
    goto LABEL_109;
  }
  BOOL v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not inheriting backup because account is beneficiary", buf, 2u);
    _MBLog();
  }

  if (!a6) {
    goto LABEL_28;
  }
  id v15 = +[MBError errorWithCode:1 format:@"No inheritance backup for beneficiary account"];
LABEL_27:
  BOOL v32 = 0;
  *a6 = v15;
LABEL_112:

  return v32;
}

- (unint64_t)nextBackupSizeWithAccount:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKManager nextBackupSizeWithAccount:]", "MBCKManager.m", 1636, "account");
  }
  BOOL v5 = v4;
  id v6 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v4];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  unsigned __int8 v20 = sub_1000AD5B8;
  uint64_t v21 = sub_1000AD5C8;
  id v22 = 0;
  stateQueue = self->super._stateQueue;
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  CFStringRef v13 = sub_1000B607C;
  BOOL v14 = &unk_100412050;
  uint64_t v16 = &v17;
  id v8 = v6;
  id v15 = v8;
  dispatch_sync(stateQueue, &v11);
  id v9 = objc_msgSend((id)v18[5], "unsignedLongLongValue", v11, v12, v13, v14);

  _Block_object_dispose(&v17, 8);
  return (unint64_t)v9;
}

- (id)nextBackupSizeInfoWithAccount:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKManager nextBackupSizeInfoWithAccount:]", "MBCKManager.m", 1648, "account");
  }
  BOOL v5 = v4;
  id v6 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v4];
  id v7 = objc_opt_new();
  stateQueue = self->super._stateQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000B61FC;
  v14[3] = &unk_1004110B0;
  id v15 = v6;
  id v9 = v7;
  id v16 = v9;
  id v10 = v6;
  dispatch_sync(stateQueue, v14);
  id v11 = v16;
  id v12 = v9;

  return v12;
}

- (id)_backupEngineWithReason:(int64_t)a3 settingsContext:(id)a4 account:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!v9) {
    __assert_rtn("-[MBCKManager _backupEngineWithReason:settingsContext:account:]", "MBCKManager.m", 1668, "account");
  }
  id v10 = v9;
  if (MBBackupReasonIsManual())
  {
    uint64_t v11 = 25;
  }
  else if (MBBackupReasonIsScheduled())
  {
    id v12 = +[MBBehaviorOptions sharedOptions];
    unsigned int v13 = [v12 useBackgroundOperationsForBackup];

    if (v13) {
      uint64_t v11 = 9;
    }
    else {
      uint64_t v11 = 17;
    }
  }
  else
  {
    uint64_t v11 = 17;
  }
  if ([v10 isPrimaryAccount]
    && [(MBCKManager *)self _isMegaBackupMode])
  {
    [v8 setBackupPolicy:1];
  }
  BOOL v14 = [MBCKBackupEngine alloc];
  id v15 = [(MBServiceManager *)self debugContext];
  id v16 = [(MBCKBackupEngine *)v14 initWithReason:a3 settingsContext:v8 debugContext:v15 serviceManager:self];

  [(MBCKEngine *)v16 cache];
  if (objc_claimAutoreleasedReturnValue()) {
    __assert_rtn("-[MBCKManager _backupEngineWithReason:settingsContext:account:]", "MBCKManager.m", 1683, "!engine.cache");
  }
  [(MBCKEngine *)v16 setQualityOfService:v11];
  uint64_t v17 = MBAllCKPlugins();
  uint64_t v18 = [(MBCKEngine *)v16 context];
  [v18 setPlugins:v17];

  uint64_t v19 = objc_alloc_init(MBWatchdog);
  [(MBWatchdog *)v19 setTimeout:14400.0];
  [(MBWatchdog *)v19 setTimeoutBlock:&stru_100412228];
  [(MBEngine *)v16 setWatchdog:v19];

  return v16;
}

- (BOOL)startBackupWithOptions:(id)a3 reason:(int64_t)a4 xpcActivity:(id)a5 account:(id)a6 connection:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v52 = a7;
  id v57 = v13;
  if (!v13) {
    __assert_rtn("-[MBCKManager startBackupWithOptions:reason:xpcActivity:account:connection:error:]", "MBCKManager.m", 1700, "options");
  }
  if (!a4) {
    __assert_rtn("-[MBCKManager startBackupWithOptions:reason:xpcActivity:account:connection:error:]", "MBCKManager.m", 1701, "reason != kMBBackupReasonUnspecified");
  }
  if (!v15) {
    __assert_rtn("-[MBCKManager startBackupWithOptions:reason:xpcActivity:account:connection:error:]", "MBCKManager.m", 1702, "account");
  }
  unsigned __int8 v56 = [v15 accountIdentifier];
  if (!v56) {
    __assert_rtn("-[MBCKManager startBackupWithOptions:reason:xpcActivity:account:connection:error:]", "MBCKManager.m", 1704, "accountIdentifier");
  }
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->super._stateQueue);
  v51 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v15];
  id v16 = [(MBCKManager *)self dryRestoreManager];
  [v16 interruptWithCause:0];

  [(MBCKManager *)self networkConnectivity];
  if (v17 & 2) != 0 || (id v54 = 0, a4 == 1) && (v17)
  {
    uint64_t v18 = [v13 cellularAccess];
    uint64_t v19 = v18;
    if (v18)
    {
      id v54 = v18;
    }
    else
    {
      id v54 = +[MBCellularAccess inexpensiveCellularAccess];
    }
  }
  __int16 v55 = MBStringForBackupReason();
  unsigned __int8 v20 = MBGetDefaultLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v55;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a4;
    *(_WORD *)&buf[22] = 2114;
    v81 = v56;
    LOWORD(v82) = 2114;
    *(void *)((char *)&v82 + 2) = v13;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Starting backup, reason:%{public}@(%ld), account:%{public}@, options:%{public}@", buf, 0x2Au);
    _MBLog();
  }

  if (BYSetupAssistantNeedsToRun())
  {
    uint64_t v21 = MBGetDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Refusing request to start backup while Buddy is active", buf, 2u);
      _MBLog();
    }

    if (a8)
    {
      +[MBError errorWithCode:212 format:@"Refusing to backup while buddy is active"];
      BOOL v22 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    }
LABEL_26:
    BOOL v22 = 0;
    goto LABEL_38;
  }
  if ([v13 backupPolicy] == (id)1)
  {
    [(MBCKManager *)self _setMegaBackupMode:1];
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v81 = sub_1000AD5B8;
    *(void *)&long long v82 = sub_1000AD5C8;
    *((void *)&v82 + 1) = 0;
    double v23 = dispatch_group_create();
    dispatch_group_enter(v23);
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_1000B6ED0;
    v74[3] = &unk_100410FC8;
    id v76 = buf;
    unsigned __int8 v24 = v23;
    id v75 = v24;
    [(MBCKManager *)self _cancelBackupAndScanEnginesWithAccount:v15 timeout:300 completion:v74];
    MBGroupWaitForever();
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      double v25 = MBGetDefaultLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = *(void *)(*(void *)&buf[8] + 40);
        LODWORD(v77) = 138412290;
        *(void *)((char *)&v77 + 4) = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to cancel already in-progress backup: %@", (uint8_t *)&v77, 0xCu);
        _MBLog();
      }

      if (a8) {
        *a8 = *(id *)(*(void *)&buf[8] + 40);
      }

      _Block_object_dispose(buf, 8);
      goto LABEL_26;
    }

    _Block_object_dispose(buf, 8);
  }
  uint64_t v27 = objc_opt_new();
  [v27 setCellularAccess:v54];
  uint64_t v28 = [(MBCKManager *)self databaseManager];
  id v50 = +[MBCKOperationTracker operationTrackerWithAccount:v15 databaseManager:v28 policy:v27 error:a8];

  id v29 = v50;
  if (v50)
  {
    [v50 setXpcActivity:v14];
    id v30 = objc_alloc((Class)NSString);
    unsigned int v31 = [v55 capitalizedString];
    id v48 = [v30 initWithFormat:@"%@ Backup", v31];

    BOOL v32 = [v52 processName];
    long long v49 = [v27 operationGroupWithName:v48 processName:v32];

    [v50 setCkOperationGroup:v49];
    id v33 = MBDeviceUUID();
    long long v46 = [(MBCKManager *)self _ckSettingsContextForBackupUDID:v33 account:v15];

    long long v47 = v27;
    uint64_t v34 = dispatch_group_create();
    dispatch_group_enter(v34);
    stateQueue = self->super._stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B6F30;
    block[3] = &unk_100411608;
    id v36 = v51;
    id v70 = v36;
    id v71 = self;
    id v37 = v15;
    id v72 = v37;
    id v38 = v14;
    id v39 = v34;
    id v73 = v39;
    dispatch_async(stateQueue, block);
    id v44 = v39;
    MBGroupWaitForever();
    id v45 = v38;
    *(void *)&long long v77 = 0;
    *((void *)&v77 + 1) = &v77;
    uint64_t v78 = 0x2020000000;
    char v79 = 0;
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v81 = sub_1000AD5B8;
    *(void *)&long long v82 = sub_1000AD5C8;
    *((void *)&v82 + 1) = 0;
    uint64_t v40 = self->super._stateQueue;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_1000B7068;
    v58[3] = &unk_100412250;
    id v66 = buf;
    unsigned __int8 v67 = &v77;
    id v59 = v36;
    id v60 = self;
    int64_t v68 = a4;
    id v41 = v46;
    id v61 = v41;
    id v62 = v37;
    id v42 = v49;
    id v63 = v42;
    id v64 = v47;
    id v65 = v50;
    dispatch_sync(v40, v58);
    if (*(unsigned char *)(*((void *)&v77 + 1) + 24))
    {
      BOOL v22 = 1;
      id v14 = v45;
      uint64_t v27 = v47;
    }
    else
    {
      if (!*(void *)(*(void *)&buf[8] + 40)) {
        __assert_rtn("-[MBCKManager startBackupWithOptions:reason:xpcActivity:account:connection:error:]", "MBCKManager.m", 1811, "success || localError");
      }
      id v14 = v45;
      uint64_t v27 = v47;
      if (a8)
      {
        -[MBCKManager _sanitizeError:](self, "_sanitizeError:");
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v22 = *(unsigned char *)(*((void *)&v77 + 1) + 24) != 0;
      }
      else
      {
        BOOL v22 = 0;
      }
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v77, 8);

    id v29 = v50;
  }
  else
  {
    BOOL v22 = 0;
  }

LABEL_38:
  return v22;
}

- (void)_didUpdateBackupProgress:(float)a3 estimatedTimeRemaining:(unint64_t)a4 bytesRemaining:(int64_t)a5 engineState:(id)a6 stateInfo:(id)a7 isInitialMegaBackup:(BOOL)a8
{
  BOOL v8 = a8;
  id v18 = a7;
  id v14 = a6;
  id v15 = [(MBServiceManager *)self serviceDelegate];
  *(float *)&double v16 = a3;
  [v15 manager:self didUpdateProgress:a4 estimatedTimeRemaining:a5 bytesRemaining:v14 state:0 context:v16];

  if (v8 && [(MBServiceManager *)self isPrebuddyMode])
  {
    char v17 = [(MBServiceManager *)self prebuddyFollowUpController];
    [v17 updateFollowupWithBackupProgress:v18];
  }
}

- (void)_startBackupWithEngine:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._stateQueue);
  if (!v6) {
    __assert_rtn("-[MBCKManager _startBackupWithEngine:account:]", "MBCKManager.m", 1836, "engine");
  }
  if (!v7) {
    __assert_rtn("-[MBCKManager _startBackupWithEngine:account:]", "MBCKManager.m", 1837, "account");
  }
  uint64_t v8 = [v7 accountIdentifier];
  if (!v8) {
    __assert_rtn("-[MBCKManager _startBackupWithEngine:account:]", "MBCKManager.m", 1839, "accountIdentifier");
  }
  id v9 = (void *)v8;
  uint64_t v10 = [v6 context];
  if (!v10) {
    __assert_rtn("-[MBCKManager _startBackupWithEngine:account:]", "MBCKManager.m", 1841, "settingsContext");
  }
  uint64_t v11 = (void *)v10;
  id v12 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v7];
  id v33 = v11;
  if ([v7 isPrimaryAccount]
    && [(MBCKManager *)self _isMegaBackupMode]
    && ![(MBCKManager *)self _isInitialMegaBackupCompleted])
  {
    char v14 = 1;
    id v13 = [objc_alloc((Class)MBStateInfo) initWithState:1 progress:-1 estimatedTimeRemaining:0 error:0 errors:0.0];
  }
  else
  {
    id v13 = [(MBCKManager *)self _copyBackupStateInfoForInitialMegaBackup:0 account:v7];
    char v14 = 0;
  }
  id v15 = (char *)[v13 backupAttemptCount] + 1;
  double v16 = [v6 telemetry];
  [v16 setBackupAttemptCount:v15];

  [v6 backupReason];
  char v17 = MBStringForBackupReason();
  [v6 qualityOfService];
  id v18 = MBLogStringForNSQualityOfService();
  uint64_t v19 = MBGetDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v45 = v17;
    __int16 v46 = 2114;
    long long v47 = v18;
    __int16 v48 = 2114;
    long long v49 = v9;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Starting backup, reason:%{public}@, qos:%{public}@, account:%{public}@", buf, 0x20u);
    _MBLog();
  }

  id v20 = [(MBCKManager *)self _startNetworkPathMonitor];
  [(MBCKManager *)self saveFailedBackupShadowStateWithAccount:v7];
  uint64_t v21 = [v6 estimator];
  [v6 progressModel];
  BOOL v22 = v32 = v9;
  LODWORD(v23) = 1048911544;
  [v21 setProgressHysteresis:v23];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000B7834;
  v34[3] = &unk_100412278;
  id v35 = v6;
  id v36 = self;
  id v37 = v13;
  id v38 = v17;
  char v43 = v14;
  id v39 = v7;
  id v40 = v21;
  id v41 = v22;
  id v42 = v12;
  id v24 = v12;
  id v25 = v22;
  id v26 = v21;
  id v27 = v7;
  id v28 = v17;
  id v29 = v13;
  id v30 = v6;
  unsigned int v31 = objc_retainBlock(v34);
  [v30 setStateChange:v31];
  [(MBCKManager *)self _startEngine:v30 delegateContext:0];
}

- (void)submitMegaLifeCycleTelemetriesWithAccount:(id)a3
{
  id v3 = [a3 persona];
  id v4 = +[NSMutableDictionary dictionary];
  char v40 = 0;
  id v5 = [v3 getBooleanValueForKey:@"MegaBackupTurnOniCloudBackup" keyExists:&v40];
  if (v40)
  {
    id v6 = +[NSNumber numberWithUnsignedChar:v5];
    [v4 setObject:v6 forKeyedSubscript:@"MegaBackupTurnOniCloudBackup"];
  }
  char v40 = 0;
  id v7 = [v3 getBooleanValueForKey:@"MegaBackupTurnOnAllAppsSync" keyExists:&v40];
  if (v40)
  {
    uint64_t v8 = +[NSNumber numberWithUnsignedChar:v7];
    [v4 setObject:v8 forKeyedSubscript:@"MegaBackupTurnOnAllAppsSync"];
  }
  char v40 = 0;
  id v9 = [v3 copyPreferencesValueForKey:@"MegaBackupEntryPoint" class:objc_opt_class()];
  if (v9) {
    [v4 setObject:v9 forKeyedSubscript:@"MegaBackupEntryPoint"];
  }
  id v38 = v9;
  id v10 = [v3 copyPreferencesValueForKey:@"SyncSettingsEnabledForMegaBackup" class:objc_opt_class()];
  if ([v10 count]) {
    [v4 setObject:v10 forKeyedSubscript:@"SyncSettingsEnabledForMegaBackup"];
  }
  id v37 = v10;
  id v11 = [v3 copyPreferencesValueForKey:@"MegaBackupFlowStartDate" class:objc_opt_class()];
  id v12 = v11;
  if (v11)
  {
    [v11 timeIntervalSince1970];
    char v14 = +[NSNumber numberWithLongLong:(uint64_t)v13];
    [v4 setObject:v14 forKeyedSubscript:@"MegaBackupFlowStartDate"];
  }
  id v36 = v12;
  id v15 = [v3 copyPreferencesValueForKey:@"EnterPrebuddyUIDateDelta" class:objc_opt_class()];
  if (v15) {
    [v4 setObject:v15 forKeyedSubscript:@"EnterPrebuddyUIDateDelta"];
  }
  id v16 = [v3 copyPreferencesValueForKey:@"InitialMegaBackupStartDateDelta" class:objc_opt_class()];

  if (v16) {
    [v4 setObject:v16 forKeyedSubscript:@"InitialMegaBackupStartDateDelta"];
  }
  id v17 = [v3 copyPreferencesValueForKey:@"InitialMegaBackupFinishedDateDelta" class:objc_opt_class()];

  if (v17) {
    [v4 setObject:v17 forKeyedSubscript:@"InitialMegaBackupFinishedDateDelta"];
  }
  id v18 = [v3 copyPreferencesValueForKey:@"RestoreAfterMegaBackupDateDelta" class:objc_opt_class()];

  if (v18) {
    [v4 setObject:v18 forKeyedSubscript:@"RestoreAfterMegaBackupDateDelta"];
  }
  id v19 = [v3 copyPreferencesValueForKey:@"RestoreFinishedAfterMegaBackupDateDelta" class:objc_opt_class()];

  if (v19) {
    [v4 setObject:v19 forKeyedSubscript:@"RestoreFinishedAfterMegaBackupDateDelta"];
  }
  id v20 = [v3 copyPreferencesValueForKey:@"MegaBackupRefreshDelta" class:objc_opt_class()];

  if (v20) {
    [v4 setObject:v20 forKeyedSubscript:@"MegaBackupRefreshDelta"];
  }
  id v21 = [v3 copyPreferencesValueForKey:@"PrebuddyFlowStep" class:objc_opt_class()];
  if (v21) {
    [v4 setObject:v21 forKeyedSubscript:@"PrebuddyFlowStep"];
  }
  id v22 = [v3 copyPreferencesValueForKey:@"MegaBackupSourceDeviceUUID" class:objc_opt_class()];
  double v23 = v22;
  if (v22)
  {
    id v24 = v22;
  }
  else
  {
    MBDeviceUUID();
    id v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v25 = v24;

  [v4 setObject:v25 forKeyedSubscript:@"DeviceID"];
  v45[0] = kRTCReportingSessionInfoClientType;
  v45[1] = kRTCReportingSessionInfoClientVersion;
  v46[0] = &off_100439EE8;
  v46[1] = &off_100439F00;
  v45[2] = kRTCReportingSessionInfoSessionID;
  id v26 = +[NSNumber numberWithUnsignedInt:arc4random()];
  v46[2] = v26;
  v46[3] = &__kCFBooleanTrue;
  v45[3] = kRTCReportingSessionInfoBatchEvent;
  v45[4] = kRTCReportingSessionInfoContainsRealtimeEvents;
  v45[5] = kRTCReportingSessionInfoSamplingUUIID;
  v46[4] = &__kCFBooleanFalse;
  v46[5] = v25;
  id v27 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:6];

  v43[0] = kRTCReportingUserInfoClientName;
  v43[1] = kRTCReportingUserInfoServiceName;
  v44[0] = @"backupd";
  v44[1] = @"mega-backup";
  id v28 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
  id v29 = +[NSDate date];
  [v29 timeIntervalSince1970];
  unsigned int v31 = +[NSNumber numberWithLongLong:(uint64_t)v30];
  [v4 setObject:v31 forKeyedSubscript:@"RTCEventSubmitTime"];

  id v32 = [v4 copy];
  id v39 = 0;
  unsigned __int8 v33 = +[RTCReporting sendOneMessageWithSessionInfo:v27 userInfo:v28 category:1 type:0 payload:v32 error:&v39];
  id v34 = v39;

  if ((v33 & 1) == 0)
  {
    id v35 = MBGetDefaultLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v34;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "RTCReporting send one message failed: %@", buf, 0xCu);
      _MBLog();
    }
  }
}

- (id)prebuddyFollowUpTimerForAccount:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if (MBIsInternalInstall())
  {
    id v5 = [v4 persona];
    id v6 = [v5 copyPreferencesValueForKey:@"PrebuddyFollowupTimerInterval" class:objc_opt_class()];

    if (v6) {
      double v7 = (double)(unint64_t)[v6 unsignedIntegerValue];
    }
    else {
      double v7 = 86400.0;
    }
  }
  else
  {
    double v7 = 86400.0;
  }
  uint64_t v8 = [MBXPCActivityTimer alloc];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000B8B34;
  v13[3] = &unk_1004122A0;
  objc_copyWeak(&v15, &location);
  id v9 = v4;
  id v14 = v9;
  id v10 = [(MBXPCActivityTimer *)v8 initWithName:@"com.apple.PrebuddyFollowUpTimer" timeInterval:1 priority:8707 options:v13 block:v7];
  id v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Finished setting up prebuddy followup timer: %@", buf, 0xCu);
    _MBLog();
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v10;
}

- (BOOL)deleteBackupUDID:(id)a3 disableIfCurrentDevice:(BOOL)a4 account:(id)a5 connection:(id)a6 error:(id *)a7
{
  BOOL v39 = a4;
  id v11 = a3;
  id v12 = a5;
  id v41 = a6;
  if (!v12) {
    __assert_rtn("-[MBCKManager deleteBackupUDID:disableIfCurrentDevice:account:connection:error:]", "MBCKManager.m", 2162, "serviceAccount");
  }
  if (!a7) {
    __assert_rtn("-[MBCKManager deleteBackupUDID:disableIfCurrentDevice:account:connection:error:]", "MBCKManager.m", 2163, "error");
  }
  id v42 = a7;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->super._stateQueue);
  char v40 = (void *)os_transaction_create();
  double v13 = MBGetDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Deleting all backups for %{public}@", (uint8_t *)&buf, 0xCu);
    _MBLog();
  }

  id v14 = v11;
  id v15 = MBDeviceUDID_Legacy();
  unsigned int v16 = [v14 isEqualToString:v15];

  id v17 = v14;
  if (v16)
  {
    id v17 = MBDeviceUUID();
  }
  id v18 = MBDeviceUUID();
  unsigned int v19 = [v17 isEqualToString:v18];

  id v20 = +[MBCKOperationPolicy expensiveCellularPolicy];
  id v21 = [(MBCKManager *)self databaseManager];
  id v22 = +[MBCKOperationTracker operationTrackerWithAccount:v12 databaseManager:v21 policy:v20 error:v42];

  if (v22)
  {
    double v23 = [v41 processName];
    id v24 = [v20 operationGroupWithName:@"deleteBackup" processName:v23];
    [v22 setCkOperationGroup:v24];

    if (v19) {
      [(MBCKManager *)self _cancelBackupAndScanEnginesWithAccount:v12 timeout:0 completion:&stru_1004122E0];
    }
    id v25 = MBGetDefaultLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Fetching the account record", (uint8_t *)&buf, 2u);
      _MBLog();
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v71 = 0x3032000000;
    id v72 = sub_1000AD5B8;
    id v73 = sub_1000AD5C8;
    id v74 = 0;
    id v62 = 0;
    id v26 = +[MBCKAccount fetchAccountWithOperationTracker:v22 cache:0 error:&v62];
    objc_storeStrong(&v74, v62);
    if (v26)
    {
      id v27 = MBGetDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v67) = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Fetching the device records", (uint8_t *)&v67, 2u);
        _MBLog();
      }

      if ([v26 fetchDevicesWithOperationTracker:v22 error:v42])
      {
        id v38 = [v26 deviceForUUID:v17];
        if (v38)
        {
          id v28 = MBGetDefaultLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v67) = 138543362;
            *(void *)((char *)&v67 + 4) = v17;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Found the device record for %{public}@", (uint8_t *)&v67, 0xCu);
            _MBLog();
          }

          *(void *)&long long v67 = 0;
          *((void *)&v67 + 1) = &v67;
          uint64_t v68 = 0x2020000000;
          char v69 = 0;
          id v29 = *(void **)(*((void *)&buf + 1) + 40);
          *(void *)(*((void *)&buf + 1) + 40) = 0;

          if (v19)
          {
            double v30 = dispatch_group_create();
            dispatch_group_enter(v30);
            v49[0] = _NSConcreteStackBlock;
            v49[1] = 3221225472;
            v49[2] = sub_1000B9574;
            v49[3] = &unk_100412308;
            v49[4] = self;
            id v50 = v38;
            id v51 = v17;
            BOOL v59 = v39;
            id v52 = v22;
            p_long long buf = &buf;
            id v53 = v12;
            id v54 = v41;
            id v55 = v26;
            uint64_t v58 = &v67;
            unsigned int v31 = v30;
            unsigned __int8 v56 = v31;
            [(MBCKManager *)self _cancelBackupAndScanEnginesWithAccount:v53 timeout:60 completion:v49];
            MBGroupWaitForever();
          }
          else
          {
            stateQueue = self->super._stateQueue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000B99F8;
            block[3] = &unk_100412A60;
            id v44 = v26;
            id v45 = v22;
            id v46 = v17;
            long long v47 = &buf;
            __int16 v48 = &v67;
            dispatch_sync(stateQueue, block);

            unsigned int v31 = v44;
          }

          if (*(unsigned char *)(*((void *)&v67 + 1) + 24))
          {
            id v35 = MBGetDefaultLog();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)id v63 = 138543362;
              id v64 = v14;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Deleted all backups for %{public}@", v63, 0xCu);
              _MBLog();
            }
          }
          else
          {
            id v35 = MBGetDefaultLog();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              uint64_t v36 = *(void *)(*((void *)&buf + 1) + 40);
              *(_DWORD *)id v63 = 138543618;
              id v64 = v14;
              __int16 v65 = 2112;
              uint64_t v66 = v36;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Failed to delete all backups for %{public}@: %@", v63, 0x16u);
              _MBLog();
            }
          }

          if (*(unsigned char *)(*((void *)&v67 + 1) + 24))
          {
            unsigned __int8 v32 = 1;
          }
          else
          {
            id *v42 = *(id *)(*((void *)&buf + 1) + 40);
            unsigned __int8 v32 = *(unsigned char *)(*((void *)&v67 + 1) + 24) != 0;
          }
          _Block_object_dispose(&v67, 8);
        }
        else
        {
          unsigned __int8 v33 = MBGetDefaultLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v67) = 138412290;
            *(void *)((char *)&v67 + 4) = v17;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Couldn't find the device record for %@", (uint8_t *)&v67, 0xCu);
            _MBLog();
          }

          if ([v12 isPrimaryAccount])
          {
            v60.receiver = self;
            v60.super_class = (Class)MBCKManager;
            unsigned __int8 v32 = [(MBServiceManager *)&v60 deleteBackupUDID:v14 disableIfCurrentDevice:v39 account:v12 connection:0 error:v42];
          }
          else
          {
            unsigned __int8 v32 = 1;
          }
        }
      }
      else
      {
        unsigned __int8 v32 = 0;
      }
    }
    else if (+[MBRetryStrategy couldRetryError:](MBRetryStrategy, "couldRetryError:", *(void *)(*((void *)&buf + 1) + 40))|| ![v12 isPrimaryAccount])
    {
      unsigned __int8 v32 = 0;
      id *v42 = *(id *)(*((void *)&buf + 1) + 40);
    }
    else
    {
      v61.receiver = self;
      v61.super_class = (Class)MBCKManager;
      unsigned __int8 v32 = [(MBServiceManager *)&v61 deleteBackupUDID:v14 disableIfCurrentDevice:v39 account:v12 connection:0 error:v42];
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    unsigned __int8 v32 = 0;
  }

  return v32;
}

- (id)synchronizeFileListsWithDeviceUUID:(id)a3 commitID:(id)a4 account:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!a6) {
    __assert_rtn("-[MBCKManager synchronizeFileListsWithDeviceUUID:commitID:account:error:]", "MBCKManager.m", 2281, "error");
  }
  double v13 = v12;
  id v14 = +[MBCKOperationPolicy expensiveCellularPolicy];
  id v15 = [(MBCKManager *)self databaseManager];
  unsigned int v16 = +[MBCKOperationTracker operationTrackerWithAccount:v13 databaseManager:v15 policy:v14 error:a6];

  if (v16)
  {
    id v17 = [v14 operationGroupWithName:@"synchronizeFileLists" processName:0];
    [v16 setCkOperationGroup:v17];
    id v18 = +[MBCKAccount fetchDeviceRecordAndSnapshots:v10 account:v13 manager:self tracker:v16 error:a6];
    if (v18)
    {
      unsigned int v19 = [v13 persona];
      id v20 = [v19 snapshotDatabaseDirectory];
      id v21 = [v18 synchronizeFileListsWithOperationTracker:v16 snapshotDirectory:v20 commitID:v11 error:a6 fetchedFileListBlock:&stru_100412328];

      id v22 = MBGetDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v25 = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Synchronized to %@", buf, 0xCu);
        _MBLog();
      }
    }
    else
    {
      id v21 = 0;
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (BOOL)clearPendingSnapshotForBackupUUID:(id)a3 enabledState:(BOOL)a4 account:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v29 = v10;
    __int16 v30 = 1024;
    BOOL v31 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Removing the pending snapshot from the device record for device %{public}@, enabledState:%d", buf, 0x12u);
    id v26 = v10;
    BOOL v27 = v8;
    _MBLog();
  }

  double v13 = +[MBCKOperationPolicy expensiveCellularPolicy];
  id v14 = [(MBCKManager *)self databaseManager];
  id v15 = +[MBCKOperationTracker operationTrackerWithAccount:v11 databaseManager:v14 policy:v13 error:a6];

  if (v15)
  {
    unsigned int v16 = [v13 operationGroupWithName:@"accountChanged" processName:0];
    [v15 setCkOperationGroup:v16];

    id v17 = [(MBCKManager *)self openCacheWithAccount:v11 accessType:1 error:a6];
    if (!v17)
    {
      BOOL v23 = 0;
LABEL_24:

      goto LABEL_25;
    }
    id v18 = +[MBCKAccount fetchAccountWithOperationTracker:v15 cache:v17 error:a6];
    unsigned int v19 = v18;
    if (!v18 || ![v18 fetchDevicesWithOperationTracker:v15 error:a6])
    {
      BOOL v23 = 0;
LABEL_23:

      goto LABEL_24;
    }
    id v20 = MBDeviceUUID();
    id v21 = [v19 deviceForUUID:v20];

    if (v21 && [v21 pendingSnapshotQuotaReserved])
    {
      [v21 clearPendingSnapshotAndRebuildFileChanges:1];
      id v22 = [v21 backupEnabled];
      if (v22 == v8) {
        goto LABEL_16;
      }
    }
    else
    {
      id v22 = objc_msgSend(v21, "backupEnabled", v26, v27);
      if (v22 == v8) {
        goto LABEL_20;
      }
    }
    objc_msgSend(v21, "setBackupEnabled:", v8, v26);
LABEL_16:
    if ((objc_msgSend(v21, "saveWithOperationTracker:error:", v15, a6, v26) & 1) == 0)
    {
      [v21 setBackupEnabled:v22];
      BOOL v23 = 0;
      goto LABEL_22;
    }
    id v24 = MBGetDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v29 = v10;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Removed the pending snapshot for device %{public}@", buf, 0xCu);
      _MBLog();
    }

LABEL_20:
    BOOL v23 = 1;
LABEL_22:

    goto LABEL_23;
  }
  BOOL v23 = 0;
LABEL_25:

  return v23;
}

- (id)backgroundRestoreInfoWithAccount:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKManager backgroundRestoreInfoWithAccount:]", "MBCKManager.m", 2345, "account");
  }
  id v5 = v4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->super._stateQueue);
  id v73 = v5;
  id v6 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v5];
  uint64_t v106 = 0;
  long long v107 = &v106;
  uint64_t v108 = 0x2020000000;
  char v109 = 0;
  uint64_t v100 = 0;
  id v101 = &v100;
  uint64_t v102 = 0x3032000000;
  id v103 = sub_1000AD5B8;
  __int16 v104 = sub_1000AD5C8;
  id v105 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BADD4;
  block[3] = &unk_100412350;
  id v98 = &v100;
  id v74 = v6;
  id v97 = v74;
  v99 = &v106;
  dispatch_sync(stateQueue, block);
  if ([(id)v101[5] isMBSSession])
  {
    BOOL v8 = 0;
    goto LABEL_84;
  }
  id v76 = objc_opt_new();
  id v9 = [v74 backgroundRestoreProgressMonitor];
  uint64_t v71 = v9;
  if (!v9)
  {
    id v55 = MBGetDefaultLog();
    id v72 = v55;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Background restore progress monitor is not running", buf, 2u);
      _MBLog();
    }
    BOOL v8 = 0;
    goto LABEL_83;
  }
  id v95 = 0;
  id v10 = [v9 estimatedBackgroundRestoreSizeWithError:&v95];
  id v72 = v95;
  if (v72)
  {
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      objc_super v111 = v72;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unable to update background progress (size): %@", buf, 0xCu);
      objc_super v61 = v72;
      _MBLog();
    }
  }
  -[NSObject setBytesRemaining:](v76, "setBytesRemaining:", v10, v61);
  if (![v5 isPrimaryAccount])
  {
    unsigned int v56 = 0;
    goto LABEL_77;
  }
  id v12 = objc_opt_new();
  [v76 setRecentATCErrors:v12];

  double v13 = objc_opt_new();
  [v76 setPerClassItemsRemaining:v13];

  +[ATSession sessionsWithSessionTypeIdentifier:ATSessionTypeRestore];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v67 = [obj countByEnumeratingWithState:&v91 objects:v120 count:16];
  if (!v67)
  {
    int v78 = 0;
    goto LABEL_76;
  }
  int v78 = 0;
  uint64_t v68 = *(void *)v92;
  do
  {
    for (i = 0; i != v67; i = (char *)i + 1)
    {
      if (*(void *)v92 != v68) {
        objc_enumerationMutation(obj);
      }
      id v14 = objc_msgSend(*(id *)(*((void *)&v91 + 1) + 8 * i), "sessionTasks", v62, v64, v65, v66);
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v75 = v14;
      id v79 = [v75 countByEnumeratingWithState:&v87 objects:v119 count:16];
      if (v79)
      {
        uint64_t v77 = *(void *)v88;
        do
        {
          int v80 = 0;
          do
          {
            if (*(void *)v88 != v77) {
              objc_enumerationMutation(v75);
            }
            id v15 = *(void **)(*((void *)&v87 + 1) + 8 * (void)v80);
            unsigned int v16 = objc_msgSend(v15, "recentlyFailedAssets", v62);
            v81 = v15;
            id v17 = objc_opt_new();
            long long v85 = 0u;
            long long v86 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            id v82 = v16;
            id v18 = [v82 countByEnumeratingWithState:&v83 objects:v118 count:16];
            if (v18)
            {
              uint64_t v19 = *(void *)v84;
              do
              {
                for (j = 0; j != v18; j = (char *)j + 1)
                {
                  if (*(void *)v84 != v19) {
                    objc_enumerationMutation(v82);
                  }
                  id v21 = *(NSObject **)(*((void *)&v83 + 1) + 8 * (void)j);
                  id v22 = [v21 error];
                  if (v22)
                  {
                    BOOL v23 = MBGetDefaultLog();
                    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)long long buf = 138412546;
                      objc_super v111 = v21;
                      __int16 v112 = 2112;
                      id v113 = v22;
                      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "ATSessionTask recentlyFailedAsset:%@, error:%@", buf, 0x16u);
                      _MBLog();
                    }

                    id v24 = [v22 domain];
                    id v25 = [v22 code];
                    id v26 = [v22 localizedDescription];
                    BOOL v27 = +[NSString stringWithFormat:@"%@|%ld|%@", v24, v25, v26];
                    [v17 addObject:v27];
                  }
                }
                id v18 = [v82 countByEnumeratingWithState:&v83 objects:v118 count:16];
              }
              while (v18);
            }

            id v28 = [v81 totalItemCount];
            id v29 = [v81 completedItemCount];
            id v30 = [v81 totalItemCount];
            if (v30 >= [v81 completedItemCount])
            {
              id v37 = (id)(v28 - v29);
            }
            else
            {
              BOOL v31 = MBGetDefaultLog();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                unsigned __int8 v32 = v31;
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  unsigned __int8 v33 = [v81 localizedDescription];
                  id v34 = [v81 completedItemCount];
                  id v35 = [v81 totalItemCount];
                  *(_DWORD *)long long buf = 138412802;
                  objc_super v111 = v33;
                  __int16 v112 = 2048;
                  id v113 = v34;
                  __int16 v114 = 2048;
                  id v115 = v35;
                  _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Pending AirTraffic Restore: %@ completed:%lu > total:%lu [inconsistent]", buf, 0x20u);
                }
                uint64_t v36 = [v81 localizedDescription];
                id v64 = [v81 completedItemCount];
                id v65 = [v81 totalItemCount];
                id v63 = v36;
                _MBLog();
              }
              id v37 = [v81 totalItemCount];
            }
            if (objc_msgSend(v81, "totalItemCount", v63) && v37)
            {
              id v38 = [v81 localizedDescription];
              if ([v38 containsString:@"Book"])
              {
                int v39 = v78 | 2;
                goto LABEL_54;
              }
              if ([v38 containsString:@"Photo"])
              {
                int v39 = v78 | 1;
                goto LABEL_54;
              }
              if ([v38 containsString:@"Application"])
              {
                int v39 = v78 | 0x20;
                goto LABEL_54;
              }
              if ([v38 containsString:@"Ringtone"])
              {
                int v39 = v78 | 4;
                goto LABEL_54;
              }
              if ([v38 containsString:@"Media"])
              {
                int v39 = v78 | 8;
                goto LABEL_54;
              }
              if ([v38 containsString:@"MessagePart"])
              {
                int v39 = v78 | 0x10;
                goto LABEL_54;
              }
              if ([v38 containsString:@"File"])
              {
                int v39 = v78 | 0x40;
LABEL_54:
                int v78 = v39;
              }
              else
              {
                unsigned int v52 = [v38 isEqualToString:@"VoiceMemo"];
                int v53 = v78;
                if (v52) {
                  int v53 = v78 | 0x80;
                }
                int v78 = v53;
              }
              char v40 = +[NSNumber numberWithUnsignedInteger:v37];
              id v41 = [v76 perClassItemsRemaining];
              id v42 = [v81 dataClass];
              [v41 setObject:v40 forKeyedSubscript:v42];

              if ([v17 count])
              {
                char v43 = [v76 recentATCErrors];
                id v44 = [v81 dataClass];
                [v43 setObject:v17 forKeyedSubscript:v44];
              }
            }
            id v45 = MBGetDefaultLog();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              id v46 = v45;
              if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
              {
                long long v47 = [v81 localizedDescription];
                id v48 = [v81 completedItemCount];
                id v49 = [v81 totalItemCount];
                *(_DWORD *)long long buf = 138413058;
                objc_super v111 = v47;
                __int16 v112 = 2048;
                id v113 = v48;
                __int16 v114 = 2048;
                id v115 = v49;
                __int16 v116 = 2048;
                id v117 = v37;
                _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Pending AirTraffic Restore: %@, completed:%lu, total:%lu, remaining:%lu", buf, 0x2Au);
              }
              id v50 = [v81 localizedDescription];
              id v51 = [v81 completedItemCount];
              id v65 = [v81 totalItemCount];
              id v66 = v37;
              id v62 = v50;
              id v64 = v51;
              _MBLog();
            }
            int v80 = (char *)v80 + 1;
          }
          while (v80 != v79);
          id v54 = [v75 countByEnumeratingWithState:&v87 objects:v119 count:16];
          id v79 = v54;
        }
        while (v54);
      }
    }
    id v67 = [obj countByEnumeratingWithState:&v91 objects:v120 count:16];
  }
  while (v67);
LABEL_76:

  unsigned int v56 = v78;
LABEL_77:
  if (*((unsigned char *)v107 + 24)) {
    uint64_t v57 = v56;
  }
  else {
    uint64_t v57 = v56 | 0x20;
  }
  -[NSObject setDataClassesRemaining:](v76, "setDataClassesRemaining:", v57, v62);
  [v76 setFailedDomains:&__NSArray0__struct];
  [v76 setAppDataDidFinishRestore:*((unsigned __int8 *)v107 + 24)];
  unsigned __int8 v58 = atomic_load((unsigned __int8 *)&self->super._airTrafficDidFinishRestore);
  [v76 setAirTrafficDidFinishRestore:v58 & 1];
  BOOL v59 = MBGetDefaultLog();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    objc_super v111 = v76;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "Pending Background Restore: %@", buf, 0xCu);
    _MBLog();
  }

  BOOL v8 = v76;
LABEL_83:

LABEL_84:
  _Block_object_dispose(&v100, 8);

  _Block_object_dispose(&v106, 8);
  return v8;
}

- (BOOL)restoreSupportsBatching
{
  return 1;
}

- (void)setRestoreQualityOfService:(int64_t)a3 account:(id)a4 connection:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  if (!v12) {
    __assert_rtn("-[MBCKManager setRestoreQualityOfService:account:connection:]", "MBCKManager.m", 2453, "account");
  }
  if (!v8) {
    __assert_rtn("-[MBCKManager setRestoreQualityOfService:account:connection:]", "MBCKManager.m", 2454, "connection");
  }
  id v9 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v12];
  id v10 = [v9 restoreQosByContext];
  id v11 = +[NSNumber numberWithInteger:a3];
  [v10 setObject:v11 forKey:v8];
}

- (void)_saveForegroundRestoreCellularAccess:(id)a3 account:(id)a4
{
  id v5 = a4;
  id v6 = [a3 dictionaryRepresentation];
  double v7 = [v5 persona];

  [v7 setPreferencesValue:v6 forKey:@"ForegroundRestoreCellularAccess"];
  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Saved foreground restore cellular access: %{public}@", buf, 0xCu);
    _MBLog();
  }
}

- (BOOL)saveBackgroundRestoreCellularAccess:(id)a3 account:(id)a4 error:(id *)a5
{
  unint64_t v8 = (unint64_t)a3;
  id v9 = a4;
  uint64_t v10 = [(MBCKManager *)self fetchBackgroundRestoreCellularAccessForAccount:v9 error:a5];
  id v11 = (void *)v10;
  if (v8 | v10 && ([(id)v10 isEqual:v8] & 1) == 0)
  {
    id v12 = [(id)v8 dictionaryRepresentation];
    double v13 = [v9 persona];
    [v13 setPreferencesValue:v12 forKey:@"BackgroundRestoreCellularAccess"];

    id v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v9 accountIdentifier];
      *(_DWORD *)long long buf = 138412546;
      CFStringRef v28 = v15;
      __int16 v29 = 2114;
      id v30 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Saved background restore cellular access for account %@ %{public}@", buf, 0x16u);

      BOOL v23 = [v9 accountIdentifier];
      _MBLog();
    }
    unsigned int v16 = MBGetDefaultLog();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    uint64_t v18 = kMBBackgroundRestoreCellularAccessChangedNotification;
    if (v17)
    {
      *(_DWORD *)long long buf = 138543362;
      CFStringRef v28 = (const __CFString *)kMBBackgroundRestoreCellularAccessChangedNotification;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Posting \"%{public}@\"", buf, 0xCu);
      _MBLog();
    }

    uint64_t v19 = +[MBNotificationCenter sharedNotificationCenter];
    [v19 postNotification:v18];

    id v20 = MBGetDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      CFStringRef v28 = @"com.apple.MobileBackup.backgroundCellularAccessChanged";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Posting \"%{public}@\"", buf, 0xCu);
      _MBLog();
    }

    id v21 = +[MBNotificationCenter sharedNotificationCenter];
    [v21 postNotification:@"com.apple.MobileBackup.backgroundCellularAccessChanged"];

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000BB364;
    v24[3] = &unk_100412378;
    id v25 = v9;
    id v26 = self;
    [(MBCKManager *)self fetchNetworkConnectivityWithBlock:v24];
  }
  return 1;
}

- (id)fetchBackgroundRestoreCellularAccessForAccount:(id)a3 error:(id *)a4
{
  id v4 = [(MBCKManager *)self cellularAccessForRestoreType:2 account:a3];
  id v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543362;
    unint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Fetched background restore cellular access: %{public}@", buf, 0xCu);
    _MBLog();
  }

  return v4;
}

- (id)cellularAccessForRestoreType:(int)a3 account:(id)a4
{
  id v5 = a4;
  if (!v5) {
    __assert_rtn("-[MBCKManager cellularAccessForRestoreType:account:]", "MBCKManager.m", 2501, "account");
  }
  id v6 = v5;
  if (a3 == 1)
  {
    CFStringRef v7 = @"ForegroundRestoreCellularAccess";
  }
  else
  {
    if (a3 != 2) {
      __assert_rtn("-[MBCKManager cellularAccessForRestoreType:account:]", "MBCKManager.m", 2512, "key");
    }
    CFStringRef v7 = @"BackgroundRestoreCellularAccess";
  }
  unint64_t v8 = [v5 persona];
  id v9 = [v8 copyPreferencesValueForKey:v7 class:objc_opt_class()];

  if (v9) {
    id v10 = [objc_alloc((Class)MBCellularAccess) initWithDictionaryRepresentation:v9];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)restoreFileWithPath:(id)a3 context:(id)a4 account:(id)a5 error:(id *)a6
{
  return [(MBCKManager *)self _restoreFileWithPath:a3 isBatch:0 context:a4 account:a5 error:a6];
}

- (BOOL)_restoreFileWithPath:(id)a3 isBatch:(BOOL)a4 context:(id)a5 account:(id)a6 error:(id *)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (!v14) {
    __assert_rtn("-[MBCKManager _restoreFileWithPath:isBatch:context:account:error:]", "MBCKManager.m", 2525, "account");
  }
  id v15 = v14;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->super._stateQueue);
  unsigned int v16 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v15];
  BOOL v17 = [(MBCKManager *)self dryRestoreManager];
  [v17 interruptWithCause:1];

  [(MBCKManager *)self _waitForRestoreConditions:v15];
  if ([(MBCKManager *)self isPowerBudgetAvailableForRestore])
  {
    *(void *)long long buf = 0;
    id v49 = buf;
    uint64_t v50 = 0x3032000000;
    id v51 = sub_1000AD5B8;
    unsigned int v52 = sub_1000AD5C8;
    id v53 = 0;
    uint64_t v42 = 0;
    char v43 = &v42;
    uint64_t v44 = 0x3032000000;
    id v45 = sub_1000AD5B8;
    id v46 = sub_1000AD5C8;
    id v47 = 0;
    uint64_t v36 = 0;
    id v37 = &v36;
    uint64_t v38 = 0x3032000000;
    int v39 = sub_1000AD5B8;
    char v40 = sub_1000AD5C8;
    id v41 = 0;
    stateQueue = self->super._stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BBBD0;
    block[3] = &unk_1004123A0;
    unsigned __int8 v33 = &v42;
    id v31 = v16;
    id v34 = &v36;
    id v35 = buf;
    id v19 = v13;
    id v32 = v19;
    dispatch_sync(stateQueue, block);
    if ([(id)v43[5] isMBSSession])
    {
      v29.receiver = self;
      v29.super_class = (Class)MBCKManager;
      BOOL v20 = [(MBServiceManager *)&v29 restoreFileWithPath:v12 context:v19 account:v15 error:a7];
    }
    else
    {
      id v22 = MBGetDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v55 = 138412546;
        id v56 = v12;
        __int16 v57 = 1024;
        BOOL v58 = v10;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "=atc= Requesting restore of: %@ [%d]", v55, 0x12u);
        _MBLog();
      }

      BOOL v23 = [(id)v43[5] backupUDID];
      id v24 = [(MBCKManager *)self _ckSettingsContextForRestoreWithDeviceUUID:v23 account:v15 delegateContext:v19];

      [v24 setLockManager:v37[5]];
      [v24 setQos:*((void *)v49 + 5)];
      objc_msgSend(v24, "setSnapshotID:", objc_msgSend((id)v43[5], "snapshotID"));
      id v25 = [(id)v43[5] snapshotUUID];
      [v24 setSnapshotUUID:v25];

      if (v10)
      {
        id v54 = v12;
        id v26 = +[NSArray arrayWithObjects:&v54 count:1];
        BOOL v27 = +[MBServiceRestoreMode backgroundFilesRestoreModeWithPaths:v26];
        [v24 setRestoreMode:v27];
      }
      else
      {
        id v26 = +[MBServiceRestoreMode backgroundFileRestoreModeWithPath:v12];
        [v24 setRestoreMode:v26];
      }

      BOOL v20 = [(MBCKManager *)self _ckStartBackgroundRestoreWithSettingsContext:v24 delegateContext:v19 error:a7];
    }

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v42, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v21 = MBGetDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Restore power budget exhausted. Refusing restore request.", buf, 2u);
      _MBLog();
    }

    [(MBCKManager *)self _warnUserOfPowerBudgetSuspendingRestoreForAccount:v15];
    if (a7)
    {
      +[MBError errorWithCode:23 format:@"Restore over budget"];
      BOOL v20 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v20 = 0;
    }
  }

  return v20;
}

- (BOOL)restoreFilesWithPaths:(id)a3 context:(id)a4 account:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v12) {
    __assert_rtn("-[MBCKManager restoreFilesWithPaths:context:account:error:]", "MBCKManager.m", 2570, "account");
  }
  id v13 = v12;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->super._stateQueue);
  id v14 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v13];
  id v15 = [(MBCKManager *)self dryRestoreManager];
  [v15 interruptWithCause:1];

  [(MBCKManager *)self _waitForRestoreConditions:v13];
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x3032000000;
  id v51 = sub_1000AD5B8;
  unsigned int v52 = sub_1000AD5C8;
  id v53 = 0;
  uint64_t v42 = 0;
  char v43 = &v42;
  uint64_t v44 = 0x3032000000;
  id v45 = sub_1000AD5B8;
  id v46 = sub_1000AD5C8;
  id v47 = 0;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  int v39 = sub_1000AD5B8;
  char v40 = sub_1000AD5C8;
  id v41 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BC1B0;
  block[3] = &unk_1004123A0;
  unsigned __int8 v33 = &v48;
  id v17 = v14;
  id v31 = v17;
  id v34 = &v42;
  id v35 = &v36;
  id v18 = v11;
  id v32 = v18;
  dispatch_sync(stateQueue, block);
  if ([(id)v49[5] isMBSSession])
  {
    v29.receiver = self;
    v29.super_class = (Class)MBCKManager;
    BOOL v19 = [(MBServiceManager *)&v29 restoreFilesWithPaths:v10 context:v18 account:v13 error:a6];
  }
  else if ([(MBCKManager *)self isPowerBudgetAvailableForRestore])
  {
    BOOL v20 = MBGetDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = v20;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = [v10 count];
        *(_DWORD *)long long buf = 134217984;
        id v55 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "=atc= Requesting restore of %ld files", buf, 0xCu);
      }

      [v10 count];
      _MBLog();
    }

    BOOL v23 = [(id)v49[5] backupUDID];
    id v24 = [(MBCKManager *)self _ckSettingsContextForRestoreWithDeviceUUID:v23 account:v13 delegateContext:v18];

    [v24 setLockManager:v43[5]];
    [v24 setQos:v37[5]];
    objc_msgSend(v24, "setSnapshotID:", objc_msgSend((id)v49[5], "snapshotID"));
    id v25 = [(id)v49[5] snapshotUUID];
    [v24 setSnapshotUUID:v25];

    id v26 = +[MBServiceRestoreMode backgroundFilesRestoreModeWithPaths:v10];
    [v24 setRestoreMode:v26];

    BOOL v19 = [(MBCKManager *)self _ckStartBackgroundRestoreWithSettingsContext:v24 delegateContext:v18 error:a6];
  }
  else
  {
    BOOL v27 = MBGetDefaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Restore power budget exhausted. Refusing restore request.", buf, 2u);
      _MBLog();
    }

    [(MBCKManager *)self _warnUserOfPowerBudgetSuspendingRestoreForAccount:v13];
    if (a6)
    {
      +[MBError errorWithCode:23 format:@"Restore over budget"];
      BOOL v19 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v19 = 0;
    }
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
  return v19;
}

- (BOOL)restoreBookWithPath:(id)a3 context:(id)a4 account:(id)a5 error:(id *)a6
{
  uint64_t v42 = (char *)a3;
  id v41 = a4;
  id v10 = a5;
  if (!v10) {
    __assert_rtn("-[MBCKManager restoreBookWithPath:context:account:error:]", "MBCKManager.m", 2612, "account");
  }
  if (!a6) {
    __assert_rtn("-[MBCKManager restoreBookWithPath:context:account:error:]", "MBCKManager.m", 2613, "error");
  }
  id v11 = v10;
  char v40 = a6;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->super._stateQueue);
  id v12 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v11];
  uint64_t v51 = 0;
  unsigned int v52 = &v51;
  uint64_t v53 = 0x3032000000;
  id v54 = sub_1000AD5B8;
  id v55 = sub_1000AD5C8;
  id v56 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BC844;
  block[3] = &unk_100412050;
  uint64_t v50 = &v51;
  id v39 = v12;
  id v49 = v39;
  dispatch_sync(stateQueue, block);
  if ([(id)v52[5] isMBSSession])
  {
    v47.receiver = self;
    v47.super_class = (Class)MBCKManager;
    BOOL v14 = [(MBServiceManager *)&v47 restoreBookWithPath:v42 context:v41 account:v11 error:a6];
  }
  else
  {
    id v15 = objc_alloc((Class)MBDomainManager);
    unsigned int v16 = [v11 persona];
    id v38 = [v15 initWithPersona:v16];

    id v17 = [v38 systemDomainsByName];
    id v37 = [v17 objectForKeyedSubscript:@"BooksDomain"];

    id v18 = [v37 rootPath];
    BOOL v19 = (char *)[v18 length];

    id v35 = [v42 substringFromIndex:v19 + 1];
    BOOL v20 = -[MBCKManager restoreFilesForDomain:relativePath:pendingOnly:range:account:error:](self, "restoreFilesForDomain:relativePath:pendingOnly:range:account:error:", @"BooksDomain", a6);
    uint64_t v36 = v20;
    if (v20)
    {
      id v21 = (char *)[v20 count];
      if (v21)
      {
        id v22 = +[NSMutableArray arrayWithCapacity:v21];
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v23 = v36;
        id v24 = [v23 countByEnumeratingWithState:&v43 objects:v63 count:16];
        id v34 = v21;
        uint64_t v25 = 0;
        if (v24)
        {
          uint64_t v26 = *(void *)v44;
          do
          {
            for (i = 0; i != v24; i = (char *)i + 1)
            {
              if (*(void *)v44 != v26) {
                objc_enumerationMutation(v23);
              }
              CFStringRef v28 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                objc_super v29 = [v28 path];
                [v22 addObject:v29];
              }
              else
              {
                ++v25;
              }
            }
            id v24 = [v23 countByEnumeratingWithState:&v43 objects:v63 count:16];
          }
          while (v24);
        }

        id v30 = MBGetDefaultLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 134218498;
          BOOL v58 = &v34[-v25];
          __int16 v59 = 2048;
          objc_super v60 = v34;
          __int16 v61 = 2112;
          id v62 = v42;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Restoring %llu/%llu books files with absolutePath: %@", buf, 0x20u);
          _MBLog();
        }

        BOOL v14 = [(MBCKManager *)self restoreFilesWithPaths:v22 context:v41 account:v11 error:v40];
      }
      else
      {
        id v22 = [(MBServiceManager *)self serviceDelegate];
        id v31 = MBGetDefaultLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          BOOL v58 = v42;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Restore for book at %@ has no pending restore files", buf, 0xCu);
          _MBLog();
        }

        id v32 = +[MBError errorWithCode:4 path:v42 format:@"No pending restore files found"];
        id *v40 = v32;
        [v22 manager:self didFailRestoreWithContext:v41 error:v32];
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  _Block_object_dispose(&v51, 8);

  return v14;
}

- (BOOL)restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 qos:(id)a5 context:(id)a6 account:(id)a7 error:(id *)a8
{
  BOOL v11 = a4;
  id v13 = a3;
  id v14 = a5;
  id v41 = a6;
  id v15 = a7;
  if (!v15) {
    __assert_rtn("-[MBCKManager restoreApplicationWithBundleID:failed:qos:context:account:error:]", "MBCKManager.m", 2663, "account");
  }
  unsigned int v16 = v15;
  BOOL v38 = v11;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->super._stateQueue);
  id v17 = [v16 persona];
  unsigned int v18 = [v17 isDataSeparatedPersona];

  BOOL v19 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v16];
  BOOL v20 = [(MBCKManager *)self dryRestoreManager];
  [v20 interruptWithCause:1];

  id v21 = MBGetDefaultLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v18;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Starting background restore for %@ (%d)", buf, 0x12u);
    id v36 = v13;
    uint64_t v37 = v18;
    _MBLog();
  }

  [(MBCKManager *)self _waitForRestoreConditions:v16];
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  __int16 v59 = sub_1000AD5B8;
  objc_super v60 = sub_1000AD5C8;
  id v61 = 0;
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x3032000000;
  uint64_t v51 = sub_1000AD5B8;
  unsigned int v52 = sub_1000AD5C8;
  id v53 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BCF9C;
  block[3] = &unk_100412350;
  long long v46 = buf;
  id v39 = v19;
  id v45 = v39;
  objc_super v47 = &v48;
  dispatch_sync(stateQueue, block);
  if (!v14
    || [v14 integerValue] == (id)25
    || [v14 integerValue] == (id)33
    || [(MBCKManager *)self isPowerBudgetAvailableForRestore])
  {
    id v23 = +[AppRestoreDispatcher shared];
    id v24 = [v23 appRestorerForAccount:v16 stateQueue:self->super._stateQueue delegate:self error:0];

    if (v24)
    {
      id v43 = 0;
      uint64_t v25 = [v24 setUpDataPromiseForBundleID:v13 error:&v43];
      id v26 = v43;
      if (v25)
      {
        if ([*(id *)(*(void *)&buf[8] + 40) isMBSSession])
        {
          v42.receiver = self;
          v42.super_class = (Class)MBCKManager;
          BOOL v27 = [(MBServiceManager *)&v42 restoreApplicationWithBundleID:v13 failed:v38 qos:v14 context:v41 account:v16 error:a8];
        }
        else
        {
          id v30 = [*(id *)(*(void *)&buf[8] + 40) backupUDID];
          id v31 = [(MBCKManager *)self _ckSettingsContextForRestoreWithDeviceUUID:v30 account:v16 delegateContext:v41];

          [v31 setLockManager:v49[5]];
          [v31 setQos:v14];
          objc_msgSend(v31, "setSnapshotID:", objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "snapshotID"));
          id v32 = [*(id *)(*(void *)&buf[8] + 40) snapshotUUID];
          [v31 setSnapshotUUID:v32];

          if (v18) {
            +[MBServiceRestoreMode backgroundDataSeparatedAppRestoreModeWithBundleID:v13];
          }
          else {
          unsigned __int8 v33 = +[MBServiceRestoreMode backgroundAppRestoreModeWithBundleID:v13];
          }
          [v31 setRestoreMode:v33];

          [v31 setInstallCoordinator:v25];
          BOOL v27 = [(MBCKManager *)self _ckStartBackgroundRestoreWithSettingsContext:v31 delegateContext:v41 error:a8];
        }
      }
      else
      {
        objc_super v29 = MBGetDefaultLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id v54 = 138412546;
          id v55 = v13;
          __int16 v56 = 2112;
          id v57 = v26;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to setup data promise for %@: %@", v54, 0x16u);
          _MBLog();
        }

        BOOL v27 = 0;
        if (a8) {
          *a8 = v26;
        }
      }
    }
    else
    {
      CFStringRef v28 = MBGetDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id v54 = 138412546;
        id v55 = v16;
        __int16 v56 = 2112;
        id v57 = v13;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to find the app restore manager for %@ while trying to restore %@", v54, 0x16u);
        _MBLog();
      }

      if (a8)
      {
        +[MBError errorWithCode:1 format:@"nil app restore manager"];
        BOOL v27 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v27 = 0;
      }
    }
  }
  else
  {
    id v35 = MBGetDefaultLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v54 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Restore power budget exhausted. Refusing restore request.", v54, 2u);
      _MBLog();
    }

    [(MBCKManager *)self _warnUserOfPowerBudgetSuspendingRestoreForAccount:v16];
    if (a8)
    {
      +[MBError errorWithCode:23 format:@"Restore over budget"];
      BOOL v27 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v27 = 0;
    }
  }

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(buf, 8);

  return v27;
}

- (BOOL)cancelApplicationRestoreWithBundleID:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)_restoreEngineWithRestoreType:(int)a3 settingsContext:(id)a4 debugContext:(id)a5 excludedAppBundleIDs:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._stateQueue);
  if (!v10) {
    __assert_rtn("-[MBCKManager _restoreEngineWithRestoreType:settingsContext:debugContext:excludedAppBundleIDs:]", "MBCKManager.m", 2730, "settingsContext");
  }
  uint64_t v13 = [v10 account];
  if (!v13) {
    __assert_rtn("-[MBCKManager _restoreEngineWithRestoreType:settingsContext:debugContext:excludedAppBundleIDs:]", "MBCKManager.m", 2732, "serviceAccount");
  }
  id v14 = (void *)v13;
  id v15 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v13];
  unsigned int v16 = [[MBCKRestoreEngine alloc] initWithSettingsContext:v10 debugContext:v11 domainManager:0 serviceManager:self excludedAppBundleIDs:v12];
  [(MBCKEngine *)v16 cache];
  if (objc_claimAutoreleasedReturnValue()) {
    __assert_rtn("-[MBCKManager _restoreEngineWithRestoreType:settingsContext:debugContext:excludedAppBundleIDs:]", "MBCKManager.m", 2738, "!engine.cache");
  }
  if (a3 == 1) {
    uint64_t v17 = 25;
  }
  else {
    uint64_t v17 = 17;
  }
  [(MBCKEngine *)v16 setQualityOfService:v17];
  unsigned int v18 = [v15 restoreKeyBagsByID];
  [(MBCKRestoreEngine *)v16 setStoredKeybagsByUUIDString:v18];

  BOOL v19 = MBAllCKPlugins();
  BOOL v20 = [(MBCKEngine *)v16 context];
  [v20 setPlugins:v19];

  id v21 = [v15 encryptionManager];
  [(MBCKRestoreEngine *)v16 setEncryptionManager:v21];

  return v16;
}

- (BOOL)_ckStartBackgroundRestoreWithSettingsContext:(id)a3 delegateContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    __assert_rtn("-[MBCKManager _ckStartBackgroundRestoreWithSettingsContext:delegateContext:error:]", "MBCKManager.m", 2748, "settingsContext");
  }
  id v10 = v9;
  uint64_t v11 = [v8 account];
  if (!v11) {
    __assert_rtn("-[MBCKManager _ckStartBackgroundRestoreWithSettingsContext:delegateContext:error:]", "MBCKManager.m", 2750, "account");
  }
  id v12 = (void *)v11;
  uint64_t v13 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v11];
  uint64_t v46 = 0;
  objc_super v47 = (id *)&v46;
  uint64_t v48 = 0x3032000000;
  id v49 = sub_1000AD5B8;
  uint64_t v50 = sub_1000AD5C8;
  id v51 = 0;
  unsigned int v14 = [(MBCKManager *)self _isRestoreOnCellularSupported];
  id v15 = objc_opt_new();
  if (v14)
  {
    unsigned int v16 = v47;
    id v45 = v47[5];
    uint64_t v17 = [(MBCKManager *)self fetchBackgroundRestoreCellularAccessForAccount:v12 error:&v45];
    objc_storeStrong(v16 + 5, v45);
    [v15 setCellularAccess:v17];
  }
  unsigned int v18 = +[MBEngine stringForRestoreType:2];
  BOOL v19 = [v18 capitalizedString];

  id v20 = [objc_alloc((Class)NSString) initWithFormat:@"%@ Restore", v19];
  id v31 = a5;
  id v21 = [v15 operationGroupWithName:v20];
  uint64_t v41 = 0;
  objc_super v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BD5A4;
  block[3] = &unk_1004123C8;
  id v23 = v13;
  id v33 = v23;
  id v24 = v8;
  id v34 = v24;
  id v39 = &v46;
  id v25 = v10;
  id v35 = v25;
  id v36 = self;
  id v26 = v21;
  id v37 = v26;
  id v27 = v15;
  id v38 = v27;
  char v40 = &v41;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v42 + 24))
  {
    BOOL v28 = 1;
  }
  else
  {
    id v29 = v47[5];
    if (!v29) {
      __assert_rtn("-[MBCKManager _ckStartBackgroundRestoreWithSettingsContext:delegateContext:error:]", "MBCKManager.m", 2802, "success || error");
    }
    if (v31)
    {
      id *v31 = v29;
      BOOL v28 = *((unsigned char *)v42 + 24) != 0;
    }
    else
    {
      BOOL v28 = 0;
    }
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v46, 8);

  return v28;
}

- (BOOL)startRestoreForSnapshot:(id)a3 options:(id)a4 account:(id)a5 connection:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v53 = a4;
  id v12 = a5;
  id v50 = a6;
  if (!v12) {
    __assert_rtn("-[MBCKManager startRestoreForSnapshot:options:account:connection:error:]", "MBCKManager.m", 2808, "account");
  }
  if (!v11) {
    __assert_rtn("-[MBCKManager startRestoreForSnapshot:options:account:connection:error:]", "MBCKManager.m", 2809, "snapshotIdentifier");
  }
  id v49 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v12];
  uint64_t v13 = [(MBCKManager *)self dryRestoreManager];
  [v13 interruptWithCause:1];

  if ([(MBCKManager *)self _isRestoreOnCellularSupported])
  {
    uint64_t v14 = [v53 cellularAccess];
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = objc_opt_new();
  uint64_t v48 = (void *)v14;
  [v15 setCellularAccess:v14];
  unsigned int v16 = [(MBCKManager *)self databaseManager];
  uint64_t v17 = +[MBCKOperationTracker operationTrackerWithAccount:v12 databaseManager:v16 policy:v15 error:a7];

  if (v17)
  {
    unsigned int v52 = [v12 persona];
    unsigned int v42 = [v52 isDataSeparatedPersona];
    if (v42) {
      +[MBServiceRestoreMode foregroundDataSeparatedRestoreMode];
    }
    else {
    id v45 = +[MBServiceRestoreMode foregroundRestoreMode];
    }
    BOOL v19 = +[MBEngine stringForRestoreType:1];
    uint64_t v46 = [v19 capitalizedString];

    id v44 = [objc_alloc((Class)NSString) initWithFormat:@"%@ Restore", v46];
    objc_super v47 = objc_msgSend(v15, "operationGroupWithName:");
    [v17 setCkOperationGroup:v47];
    id v20 = MBGetDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Received snapshot identifier:%@", buf, 0xCu);
      id v40 = v11;
      _MBLog();
    }

    id v21 = [v11 backupUDID];

    if (v21)
    {
      id v22 = [v11 snapshotID];
      id v23 = [v11 backupUDID];
      id v24 = [(MBCKManager *)self snapshotForSnapshotID:v22 backupUDID:v23 operationTracker:v17 error:a7];

      if (!v24)
      {
        unsigned __int8 v18 = 0;
LABEL_37:

        goto LABEL_38;
      }
      id v25 = [v24 snapshotUUID];
      BOOL v26 = v25 == 0;

      id v27 = [v11 backupUDID];
      if (v26)
      {
        v74.receiver = self;
        v74.super_class = (Class)MBCKManager;
        unsigned __int8 v18 = -[MBServiceManager startRestoreForBackupUDID:snapshotID:account:connection:error:](&v74, "startRestoreForBackupUDID:snapshotID:account:connection:error:", v27, [v11 snapshotID], v12, 0, a7);
LABEL_36:

        goto LABEL_37;
      }
      BOOL v28 = [v11 backupUDID];
      id v29 = MBDeviceUDID_Legacy();
      unsigned int v30 = [v28 isEqualToString:v29];

      if (v30)
      {
        uint64_t v31 = MBDeviceUUID();

        id v27 = (id)v31;
      }
      id v32 = objc_msgSend(v24, "snapshotUUID", v40);
      uint64_t v43 = (uint64_t (*)(uint64_t, uint64_t))[v11 snapshotID];
    }
    else
    {
      id v27 = [v11 backupUUID];
      id v32 = [v11 snapshotUUID];
      uint64_t v43 = 0;
    }
    id v33 = MBGetDefaultLog();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
    if (v42)
    {
      if (v34)
      {
        id v35 = [v12 accountIdentifier];
        id v36 = [v52 personaIdentifier];
        *(_DWORD *)long long buf = 138413570;
        *(void *)&uint8_t buf[4] = v27;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v32;
        *(_WORD *)&buf[22] = 2048;
        id v76 = v43;
        *(_WORD *)uint64_t v77 = 2114;
        *(void *)&v77[2] = v53;
        *(_WORD *)&v77[10] = 2114;
        *(void *)&v77[12] = v35;
        __int16 v78 = 2114;
        id v79 = v36;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Starting EDS restore for backupUUID:%@, snapshotUUID:%@, snapshotID:%lu, options:%{public}@, account:%{public}@(%{public}@)", buf, 0x3Eu);

        id v37 = [v12 accountIdentifier];
        uint64_t v41 = [v52 personaIdentifier];
        _MBLog();
      }
    }
    else if (v34)
    {
      *(_DWORD *)long long buf = 138413058;
      *(void *)&uint8_t buf[4] = v27;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v32;
      *(_WORD *)&buf[22] = 2048;
      id v76 = v43;
      *(_WORD *)uint64_t v77 = 2114;
      *(void *)&v77[2] = v53;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Starting restore for backupUUID:%@, snapshotUUID:%@, snapshotID:%lu, options:%{public}@", buf, 0x2Au);
      _MBLog();
    }

    if (!v27) {
      __assert_rtn("-[MBCKManager startRestoreForSnapshot:options:account:connection:error:]", "MBCKManager.m", 2859, "backupUUID");
    }
    if (!v32) {
      __assert_rtn("-[MBCKManager startRestoreForSnapshot:options:account:connection:error:]", "MBCKManager.m", 2860, "snapshotUUID");
    }
    [(MBCKManager *)self _saveForegroundRestoreCellularAccess:v48 account:v12];
    [v52 setPreferencesValue:v27 forKey:@"MegaBackupSourceDeviceUUID"];
    uint64_t v70 = 0;
    uint64_t v71 = &v70;
    uint64_t v72 = 0x2020000000;
    char v73 = 0;
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v76 = sub_1000AD5B8;
    *(void *)uint64_t v77 = sub_1000AD5C8;
    *(void *)&v77[8] = 0;
    stateQueue = self->super._stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BE33C;
    block[3] = &unk_1004123F0;
    id v55 = v49;
    id v67 = buf;
    id v56 = v12;
    id v24 = v27;
    id v57 = v24;
    BOOL v58 = self;
    id v59 = v47;
    id v27 = v32;
    id v60 = v27;
    char v69 = v43;
    id v61 = v45;
    id v62 = v52;
    id v63 = v53;
    id v64 = v15;
    id v65 = v17;
    id v66 = v50;
    uint64_t v68 = &v70;
    dispatch_sync(stateQueue, block);
    if (*((unsigned char *)v71 + 24))
    {
      unsigned __int8 v18 = 1;
    }
    else
    {
      if (!*(void *)(*(void *)&buf[8] + 40)) {
        __assert_rtn("-[MBCKManager startRestoreForSnapshot:options:account:connection:error:]", "MBCKManager.m", 2932, "success || error");
      }
      if (a7)
      {
        -[MBCKManager _sanitizeError:](self, "_sanitizeError:");
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        unsigned __int8 v18 = *((unsigned char *)v71 + 24) != 0;
      }
      else
      {
        unsigned __int8 v18 = 0;
      }
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v70, 8);
    goto LABEL_36;
  }
  unsigned __int8 v18 = 0;
LABEL_38:

  return v18;
}

- (BOOL)setupRestorePlanForAccount:(id)a3 snapshotUUID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!a5) {
    __assert_rtn("-[MBCKManager setupRestorePlanForAccount:snapshotUUID:error:]", "MBCKManager.m", 2938, "error");
  }
  id v10 = v9;
  id v11 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v8];
  id v12 = [v8 persona];
  unsigned __int8 v13 = [v11 createRestorePlanWithPersona:v12 snapshotUUID:v10 error:a5];

  uint64_t v14 = MBGetDefaultLog();
  id v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v16 = [v11 restorePlan];
      *(_DWORD *)long long buf = 138412290;
      id v21 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Set up new restore plan: %@", buf, 0xCu);

      BOOL v19 = [v11 restorePlan];
      _MBLog();
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    id v17 = *a5;
    *(_DWORD *)long long buf = 138412290;
    id v21 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to set up new restore plan: %@", buf, 0xCu);
    _MBLog();
  }

  return v13;
}

- (id)fetchDeviceForRestoreWithUUID:(id)a3 tracker:(id)a4 isForegroundRestore:(BOOL)a5 cache:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->super._stateQueue);
  if (!v13) {
    __assert_rtn("-[MBCKManager fetchDeviceForRestoreWithUUID:tracker:isForegroundRestore:cache:error:]", "MBCKManager.m", 2953, "tracker");
  }
  if (!v14) {
    __assert_rtn("-[MBCKManager fetchDeviceForRestoreWithUUID:tracker:isForegroundRestore:cache:error:]", "MBCKManager.m", 2954, "cache");
  }
  if (!a7) {
    __assert_rtn("-[MBCKManager fetchDeviceForRestoreWithUUID:tracker:isForegroundRestore:cache:error:]", "MBCKManager.m", 2955, "error");
  }
  id v15 = [v13 account];
  if (!v15) {
    __assert_rtn("-[MBCKManager fetchDeviceForRestoreWithUUID:tracker:isForegroundRestore:cache:error:]", "MBCKManager.m", 2958, "serviceAccount");
  }
  unsigned int v16 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v15];
  if (qword_100482400 != -1) {
    dispatch_once(&qword_100482400, &stru_100412410);
  }
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x3032000000;
  uint64_t v48 = sub_1000AD5B8;
  id v49 = sub_1000AD5C8;
  id v50 = 0;
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x3032000000;
  unsigned int v42 = sub_1000AD5B8;
  uint64_t v43 = sub_1000AD5C8;
  id v44 = 0;
  id v17 = qword_1004823F8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BEFE4;
  block[3] = &unk_100412438;
  void block[4] = self;
  id v36 = &v45;
  id v18 = v16;
  id v32 = v18;
  BOOL v38 = a5;
  id v19 = v12;
  id v33 = v19;
  id v20 = v13;
  id v34 = v20;
  id v21 = v14;
  id v35 = v21;
  id v37 = &v39;
  dispatch_sync(v17, block);
  id v22 = (void *)v46[5];
  if (v22)
  {
    id v23 = [v22 deviceUUID];
    if (([v23 isEqualToString:v19] & 1) == 0)
    {
      id v29 = "!device || [device.deviceUUID isEqualToString:deviceUUID]";
      int v30 = 3024;
      goto LABEL_23;
    }

    id v24 = (void *)v46[5];
    if (v24) {
      goto LABEL_14;
    }
  }
  if (!v40[5])
  {
    id v29 = "device || fetchError";
    int v30 = 3025;
LABEL_23:
    __assert_rtn("-[MBCKManager fetchDeviceForRestoreWithUUID:tracker:isForegroundRestore:cache:error:]", "MBCKManager.m", v30, v29);
  }
  id v25 = MBGetDefaultLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    uint64_t v26 = v40[5];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v52 = v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to fetch device for restore %@", buf, 0xCu);
    _MBLog();
  }

  *a7 = (id) v40[5];
  id v24 = (void *)v46[5];
LABEL_14:
  id v27 = v24;

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v27;
}

- (void)_startRestoreWithEngine:(id)a3 delegateContext:(id)a4
{
  id v6 = a3;
  id v46 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._stateQueue);
  if (!v6) {
    __assert_rtn("-[MBCKManager _startRestoreWithEngine:delegateContext:]", "MBCKManager.m", 3036, "engine");
  }
  CFStringRef v7 = [v6 context];
  id v8 = v7;
  if (!v7) {
    __assert_rtn("-[MBCKManager _startRestoreWithEngine:delegateContext:]", "MBCKManager.m", 3038, "settingsContext");
  }
  id v9 = [v7 account];
  if (!v9) {
    __assert_rtn("-[MBCKManager _startRestoreWithEngine:delegateContext:]", "MBCKManager.m", 3040, "serviceAccount");
  }
  id v10 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v9];
  id v11 = [(MBServiceManager *)self debugContext];
  unsigned int v12 = [v11 BOOLForName:@"ShouldSkipRestore"];

  if (v12)
  {
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Not running restore as requested by delegate context", buf, 2u);
      _MBLog();
    }

    stateQueue = self->super._stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BFE1C;
    block[3] = &unk_100411128;
    id v60 = v10;
    dispatch_async(stateQueue, block);
    id v15 = v60;
  }
  else
  {
    unsigned int v16 = [v6 restoreType];
    [v6 qualityOfService];
    uint64_t v45 = MBLogStringForNSQualityOfService();
    id v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      if (v16 == 1) {
        id v18 = "fg";
      }
      else {
        id v18 = "bg";
      }
      *(_DWORD *)long long buf = 136446466;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v45;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Starting %{public}s restore, qos:%{public}@", buf, 0x16u);
      id v40 = v18;
      uint64_t v41 = v45;
      _MBLog();
    }

    unsigned __int8 v44 = [v9 isPrimaryAccount];
    id v19 = [v9 persona];
    unsigned __int8 v43 = [v19 isDataSeparatedPersona];

    id v20 = [v8 restoreMode];
    unsigned int v21 = [v20 isForeground];

    if ([v6 backupPolicy] == (id)1) {
      unsigned int v22 = v21;
    }
    else {
      unsigned int v22 = 0;
    }
    if (v22 == 1)
    {
      id v23 = [v9 persona];
      id v24 = [v23 copyPreferencesValueForKey:@"MegaBackupFlowStartDate" class:objc_opt_class()];

      id v25 = [v9 persona];
      id v26 = [v25 copyPreferencesValueForKey:@"RestoreAfterMegaBackupDateDelta" class:objc_opt_class()];

      if (v24 && !v26)
      {
        unsigned int v42 = [v9 persona];
        id v27 = +[NSDate now];
        [v27 timeIntervalSinceDate:v24];
        id v29 = +[NSNumber numberWithInt:(int)v28];
        [v42 setPreferencesValue:v29 forKey:@"RestoreAfterMegaBackupDateDelta"];
      }
      -[MBCKManager submitMegaLifeCycleTelemetriesWithAccount:](self, "submitMegaLifeCycleTelemetriesWithAccount:", v9, v40, v41);
    }
    id v30 = [(MBCKManager *)self _startNetworkPathMonitor];
    uint64_t v31 = [v6 estimator];
    id v32 = v31;
    if (v21)
    {
      [v31 setEstimationHysteresis:600.0];
      LODWORD(v33) = 1036831949;
      [v32 setProgressHysteresis:v33];
    }
    id v34 = [v10 restore];
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    int v62 = 0;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_1000BFE74;
    v47[3] = &unk_1004124B0;
    v47[4] = self;
    char v56 = v21;
    id v35 = v34;
    id v48 = v35;
    id v36 = v46;
    id v49 = v36;
    id v50 = v8;
    id v55 = buf;
    id v37 = v32;
    id v51 = v37;
    unsigned __int8 v57 = v43;
    id v52 = v10;
    id v53 = v9;
    id v38 = v6;
    id v54 = v38;
    unsigned __int8 v58 = v44;
    uint64_t v39 = objc_retainBlock(v47);
    [v38 setStateChange:v39];
    [(MBCKManager *)self _startEngine:v38 delegateContext:v36];

    _Block_object_dispose(buf, 8);
    id v15 = (void *)v45;
  }
}

- (BOOL)saveKeybagsForBackupUDID:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v11) {
    __assert_rtn("-[MBCKManager saveKeybagsForBackupUDID:account:connection:error:]", "MBCKManager.m", 3271, "serviceAccount");
  }
  id v13 = v12;
  id v14 = [(MBCKManager *)self openCacheWithAccount:v11 accessType:1 error:a6];
  if (v14)
  {
    id v15 = +[MBCKOperationPolicy expensiveCellularPolicy];
    unsigned int v16 = [(MBCKManager *)self databaseManager];
    id v17 = +[MBCKOperationTracker operationTrackerWithAccount:v11 databaseManager:v16 policy:v15 error:a6];

    if (v17)
    {
      id v18 = [v13 processName];
      id v19 = [v15 operationGroupWithName:@"saveKeybags" processName:v18];
      [v17 setCkOperationGroup:v19];

      id v20 = +[MBCKAccount fetchAccountWithOperationTracker:v17 cache:v14 create:0 error:a6];
      unsigned int v21 = v20;
      if (v20 && [v20 fetchDevicesWithOperationTracker:v17 error:a6])
      {
        id v33 = v10;
        id v22 = v10;
        id v23 = MBDeviceUDID_Legacy();
        unsigned int v24 = [v22 isEqualToString:v23];

        if (v24)
        {
          id v25 = MBDeviceUUID();
        }
        else
        {
          id v25 = v22;
        }
        id v27 = [v21 deviceForUUID:v25];
        if (v27)
        {
          double v28 = v25;
          id v32 = v27;
          id v29 = [v27 keybagManager];
          unsigned int v30 = [v29 fetchKeybagsWithOperationTracker:v17 error:a6];

          if (v30) {
            BOOL v26 = +[MBCKEncryptionManager saveRestoreKeyBagsWithAccount:v11 device:v32 error:a6];
          }
          else {
            BOOL v26 = 0;
          }
          id v25 = v28;
          id v27 = v32;
          id v10 = v33;
        }
        else
        {
          if (a6)
          {
            +[MBError errorWithCode:4 format:@"No device record"];
            BOOL v26 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
            id v27 = 0;
          }
          else
          {
            BOOL v26 = 0;
          }
          id v10 = v33;
        }
      }
      else
      {
        BOOL v26 = 0;
      }
    }
    else
    {
      BOOL v26 = 0;
    }
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

- (void)boostBackgroundRestoreWithAccount:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKManager boostBackgroundRestoreWithAccount:completionHandler:]", "MBCKManager.m", 3306, "account");
  }
  id v8 = v7;
  id v9 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v6];
  stateQueue = self->super._stateQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000C157C;
  v13[3] = &unk_1004124D8;
  id v14 = v9;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_sync(stateQueue, v13);
}

- (id)fetchRestorableSnapshotsForAccount:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[MBCKOperationPolicy expensiveCellularPolicy];
  id v11 = [(MBCKManager *)self databaseManager];
  id v12 = +[MBCKOperationTracker operationTrackerWithAccount:v8 databaseManager:v11 policy:v10 error:a5];

  uint64_t v41 = v12;
  if (v12)
  {
    id v13 = [v9 processName];
    id v14 = [v10 operationGroupWithName:@"fetchRestorableSnapshots" processName:v13];
    [v12 setCkOperationGroup:v14];

    id v15 = MBDeviceClass();
    unsigned int v16 = MBDeviceUUID();
    id v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v60 = v16;
      __int16 v61 = 2112;
      int v62 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Current uuid:%@ class:%@", buf, 0x16u);
      id v35 = v16;
      id v36 = v15;
      _MBLog();
    }

    id v18 = [(MBCKManager *)self getBackupListWithOperationTracker:v12 shouldFilter:1 error:a5];
    if (v18)
    {
      id v38 = v16;
      id v39 = v9;
      id v40 = v8;
      id v19 = v18;
      id v12 = objc_opt_new();
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v37 = v19;
      id obj = v19;
      id v20 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v54;
        uint64_t v42 = *(void *)v54;
        unsigned __int8 v43 = v15;
        do
        {
          uint64_t v23 = 0;
          id v44 = v21;
          do
          {
            if (*(void *)v54 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v46 = v23;
            unsigned int v24 = *(void **)(*((void *)&v53 + 1) + 8 * v23);
            id v25 = objc_msgSend(v24, "deviceClass", v35, v36);
            unsigned __int8 v26 = [v25 isEqualToString:v15];

            if (v26)
            {
              long long v51 = 0u;
              long long v52 = 0u;
              long long v49 = 0u;
              long long v50 = 0u;
              id v27 = [v24 snapshots];
              id v28 = [v27 countByEnumeratingWithState:&v49 objects:v57 count:16];
              if (v28)
              {
                id v29 = v28;
                uint64_t v30 = *(void *)v50;
                do
                {
                  for (i = 0; i != v29; i = (char *)i + 1)
                  {
                    if (*(void *)v50 != v30) {
                      objc_enumerationMutation(v27);
                    }
                    id v32 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                    if (objc_msgSend(v32, "isCompatible", v35))
                    {
                      [v12 addObject:v32];
                    }
                    else
                    {
                      id v33 = MBGetDefaultLog();
                      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)long long buf = 138412290;
                        id v60 = v32;
                        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Excluding %@", buf, 0xCu);
                        id v35 = v32;
                        _MBLog();
                      }
                    }
                  }
                  id v29 = [v27 countByEnumeratingWithState:&v49 objects:v57 count:16];
                }
                while (v29);
                uint64_t v22 = v42;
                id v15 = v43;
                id v21 = v44;
              }
            }
            else
            {
              id v27 = MBGetDefaultLog();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412290;
                id v60 = v24;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Excluding %@", buf, 0xCu);
                id v35 = v24;
                _MBLog();
              }
            }

            uint64_t v23 = v46 + 1;
          }
          while ((id)(v46 + 1) != v21);
          id v21 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
        }
        while (v21);
      }

      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_1000C1B1C;
      v47[3] = &unk_100412500;
      unsigned int v16 = v38;
      id v48 = v38;
      [v12 sortUsingComparator:v47];

      id v9 = v39;
      id v8 = v40;
      id v18 = v37;
    }
    else
    {
      id v12 = 0;
    }
  }
  return v12;
}

- (void)_finishRestoreWithAccount:(id)a3 cancelled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBCKManager _finishRestoreWithAccount:cancelled:]", "MBCKManager.m", 3364, "account");
  }
  id v7 = v6;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->super._stateQueue);
  id v8 = [v7 persona];
  unsigned __int8 v9 = [v8 isDataSeparatedPersona];

  id v10 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v7];
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = sub_1000AD5B8;
  id v40 = sub_1000AD5C8;
  id v41 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C2008;
  block[3] = &unk_100412050;
  id v35 = &v36;
  id v12 = v10;
  id v34 = v12;
  dispatch_sync(stateQueue, block);
  if ([(id)v37[5] isMBSSession])
  {
    if (v4)
    {
      id v32 = self;
      id v13 = &selRef_cancelRestore;
      id v14 = (objc_super *)&v32;
    }
    else
    {
      v31.receiver = self;
      id v13 = &selRef_finishRestore;
      id v14 = &v31;
    }
    v14->super_class = (Class)MBCKManager;
    objc_msgSendSuper2(v14, *v13);
  }
  else
  {
    id v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v16 = v15;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v24 = v9;
        id v17 = [v7 accountIdentifier];
        id v18 = [v7 persona];
        id v19 = [v18 personaIdentifier];
        *(_DWORD *)long long buf = 138543874;
        unsigned __int8 v43 = v17;
        __int16 v44 = 2114;
        uint64_t v45 = v19;
        __int16 v46 = 1024;
        BOOL v47 = v4;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Finishing restore for account %{public}@(%{public}@) (%d)", buf, 0x1Cu);

        unsigned __int8 v9 = v24;
      }

      id v20 = [v7 accountIdentifier];
      id v21 = [v7 persona];
      uint64_t v23 = [v21 personaIdentifier];
      _MBLog();
    }
    uint64_t v22 = self->super._stateQueue;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000C2054;
    v25[3] = &unk_100412528;
    BOOL v29 = v4;
    id v26 = v12;
    id v27 = self;
    id v28 = v7;
    unsigned __int8 v30 = v9;
    dispatch_sync(v22, v25);
  }
  _Block_object_dispose(&v36, 8);
}

- (_TtC7backupd19MBDryRestoreManager)dryRestoreManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C2CEC;
  block[3] = &unk_100411128;
  void block[4] = self;
  if (qword_1004823D8 != -1) {
    dispatch_once(&qword_1004823D8, block);
  }
  return self->_dryRestoreManager;
}

- (BOOL)airTrafficDidFinishRestore
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->super._airTrafficDidFinishRestore);
  return v2 & 1;
}

- (void)_airTrafficFinishedRestoring
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->super._airTrafficDidFinishRestore, 1u) & 1) == 0)
  {
    id v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AirTraffic finished restoring", v6, 2u);
      _MBLog();
    }

    BOOL v4 = [(MBServiceManager *)self account];
    id v5 = [v4 persona];
    [v5 setPreferencesValue:&__kCFBooleanTrue forKey:@"AirTrafficFinishedRestoring"];
  }
}

- (void)finishAirTrafficRestoreWithAccount:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKManager finishAirTrafficRestoreWithAccount:]", "MBCKManager.m", 3521, "account");
  }
  id v5 = v4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->super._stateQueue);
  id v6 = (void *)os_transaction_create();
  [(MBCKManager *)self _airTrafficFinishedRestoring];
  if (BYSetupAssistantNeedsToRun())
  {
    id v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Can't finish restore until mini-buddy is done", buf, 2u);
      _MBLog();
    }

    dispatch_time_t v8 = dispatch_time(0, 10000000000);
    unsigned __int8 v9 = dispatch_get_global_queue(17, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C2FE4;
    block[3] = &unk_100411358;
    void block[4] = self;
    id v11 = v5;
    id v12 = v6;
    dispatch_after(v8, v9, block);
  }
  else
  {
    [(MBCKManager *)self _finishRestoreWithAccount:v5 cancelled:0];
  }
}

- (void)_finishedRestoreWithAccount:(id)a3 reason:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    __assert_rtn("-[MBCKManager _finishedRestoreWithAccount:reason:]", "MBCKManager.m", 3544, "account");
  }
  unsigned __int8 v9 = v8;
  SEL v93 = a2;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._stateQueue);
  unsigned int v10 = [v7 isPrimaryAccount];
  id v11 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v7];
  id v12 = [v11 serviceState];
  id v13 = MBGetDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v7 accountIdentifier];
    id v15 = [v7 persona];
    unsigned int v16 = [v15 personaIdentifier];
    *(_DWORD *)long long buf = 138544130;
    *(void *)&uint8_t buf[4] = v14;
    __int16 v116 = 2114;
    id v117 = v16;
    __int16 v118 = 1024;
    int v119 = (int)v12;
    __int16 v120 = 2112;
    id v121 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Finished restore for account %{public}@/%{public}@ (%d): %@", buf, 0x26u);

    id v17 = [v7 accountIdentifier];
    id v18 = [v7 persona];
    [v18 personaIdentifier];
    id v86 = v12;
    long long v87 = v9;
    long long v85 = v77 = v17;
    _MBLog();
  }
  if (v12)
  {
    [v11 setServiceState:0];
    id v19 = [v11 restore];
    id v20 = [v11 restoreSession];
    [v19 setState:4];
    LODWORD(v21) = 1.0;
    [v19 setProgress:v21];
    [v19 setIsBackground:1];
    [(id)objc_opt_class() saveRestoreStateInfo:v19 account:v7];
    if (v10)
    {
      uint64_t v22 = +[MBNotificationCenter sharedNotificationCenter];
      objc_msgSend(v22, "postNotification:ifStateChanged:", kMBManagerRestoreStateChangedNotification, -[NSObject state](v19, "state"));
    }
    -[MBCKManager _alertUserOfFinishedRestoreForAccount:](self, "_alertUserOfFinishedRestoreForAccount:", v7, v77, v85, v86, v87);
    uint64_t v23 = MBBackgroundRestoreSignpostHandle();
    if (os_signpost_enabled(v23))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "BackgroundRestore", "", buf, 2u);
    }

    uint64_t v24 = [v20 startDate];
    long long v91 = (void *)v24;
    long long v92 = v9;
    if (!v24)
    {
      double v28 = NAN;
LABEL_22:
      id v101 = v11;
      id v33 = objc_msgSend(v7, "persona", *(void *)&v78);
      int64_t v34 = +[MBRestoreCloudFormatPolicy snapshotFormatForCurrentRestore:v33];

      unsigned __int8 v114 = 0;
      int64_t v94 = v34;
      if (MBSnapshotFormatContainsFileLists())
      {
        id v35 = [v7 persona];
        id v113 = 0;
        unsigned __int8 v36 = +[MBRestoreCloudFormatPolicy isRestoringFromFileLists:&v114 persona:v35 error:&v113];
        id v37 = v113;

        if ((v36 & 1) == 0)
        {
          uint64_t v38 = MBGetDefaultLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v37;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_FAULT, "Could not determine if restoring using file lists: %@", buf, 0xCu);
            id v79 = v37;
            _MBLog();
          }
        }
      }
      id v39 = [(MBCKManager *)self databaseManager];
      id v40 = [v20 backupUDID];
      id v41 = [v20 snapshotUUID];
      v99 = v20;
      id v42 = [v20 snapshotID];
      unsigned __int8 v43 = v114;
      __int16 v44 = [v101 restorePlan];
      uint64_t v100 = v19;
      uint64_t v45 = [v19 error];
      LOBYTE(v80) = v43;
      +[MBCKStatusRequest sendStatusRequestForBackgroundRestoreCompletionWithAccount:v7 databaseManager:v39 sourceDeviceID:v40 snapshotUUID:v41 snapshotIndex:v42 snapshotFormat:v94 isRestoringUsingFileLists:v28 plan:v80 duration:v44 error:v45];

      id v112 = 0;
      __int16 v46 = [(MBCKManager *)self openCacheWithAccount:v7 accessType:2 error:&v112];
      id v47 = v112;
      id v48 = v47;
      long long v90 = v46;
      if (v46)
      {
        id v111 = v47;
        id v98 = [v46 fetchDomainsWithTopNSizes:5 error:&v111];
        id v49 = v111;

        id v110 = v49;
        id v97 = [v46 fetchDomainsWithTopNFileCounts:5 error:&v110];
        id v50 = v110;

        id v109 = v50;
        id v96 = [v46 domainNamesForRestoreFailures:&v109];
        id v89 = v109;
      }
      else
      {
        id v89 = v47;
        id v96 = 0;
        id v97 = 0;
        id v98 = 0;
      }
      uint64_t v51 = MBPeakProcessMemoryUsage();
      uint64_t v52 = +[NSMutableArray array];
      long long v53 = [v101 restorePlan];
      id v108 = 0;
      v106[0] = _NSConcreteStackBlock;
      v106[1] = 3221225472;
      v106[2] = sub_1000C3CC4;
      v106[3] = &unk_100412550;
      id v95 = (id)v52;
      id v107 = v95;
      LOBYTE(v52) = [v53 enumerateRestoreFailuresOfType:2 isFatal:1 error:&v108 enumerator:v106];
      id v54 = v108;

      if ((v52 & 1) == 0)
      {
        long long v55 = MBGetDefaultLog();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v54;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "Failed to fetch fatal restore errors from restore plan %@", buf, 0xCu);
          _MBLog();
        }
      }
      long long v88 = v54;

      unint64_t v56 = [(MBCKManager *)self restoreTelemetryID];
      unsigned __int8 v57 = [v99 snapshotUUID];
      id v58 = [v99 snapshotID];
      uint64_t v59 = v114;
      id v60 = [v100 error];
      +[MBCKTelemetry sendBackgroundRestoreCompletion:v56 snapshotUUID:v57 snapshotIndex:v58 snapshotFormat:v94 isRestoringUsingFileLists:v59 duration:v51 peakMemoryUsage:v28 error:v60 fatalErrors:v95 domainsTopNSizes:v98 domainsTopNFileCount:v97 failedDomains:v96];

      __int16 v61 = +[MBLockdown connect];
      id v105 = 0;
      unsigned __int8 v62 = [v61 setObject:@"RestoredFromiCloudBackup" forDomain:@"com.apple.purplebuddy" andKey:@"SetupState" withError:&v105];
      id v63 = v105;
      if ((v62 & 1) == 0)
      {
        id v64 = MBGetDefaultLog();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v63;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "Error setting lockdown setup state key: %@", buf, 0xCu);
          id v81 = v63;
          _MBLog();
        }
      }
      id v104 = v63;
      unsigned __int8 v65 = objc_msgSend(v61, "setObject:forDomain:andKey:withError:", @"RestoredFromiCloudBackup", @"com.apple.purplebuddy", @"RestoreState", &v104, v81);
      id v66 = v104;

      id v32 = v100;
      id v11 = v101;
      if ((v65 & 1) == 0)
      {
        id v67 = MBGetDefaultLog();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v66;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "Error setting lockdown restore state key: %@", buf, 0xCu);
          id v82 = v66;
          _MBLog();
        }
      }
      id v103 = v66;
      unsigned __int8 v68 = objc_msgSend(v61, "removeObjectWithDomain:andKey:withError:", @"com.apple.mobile.backup", @"LastCloudBackupDate", &v103, v82);
      id v69 = v103;

      if ((v68 & 1) == 0)
      {
        uint64_t v70 = MBGetDefaultLog();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v69;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "Failed to remove last backup date from lockdown: %@", buf, 0xCu);
          id v83 = v69;
          _MBLog();
        }
      }
      objc_msgSend(v61, "disconnect", v83);
      [(MBCKManager *)self _cancelDelayedBackgroundRestoreTimerWithAccount:v7];
      [(MBCKManager *)self _cancelBackgroundRestoreTTRTimerWithAccount:v7];
      [(MBCKManager *)self _ckClearRestoreSessionWithAccount:v7];
      uint64_t v71 = MBGetDefaultLog();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Resetting the cache since we finished restoring", buf, 2u);
        _MBLog();
      }

      id v102 = 0;
      unsigned __int8 v72 = [(MBCKManager *)self resetCacheWithAccount:v7 error:&v102];
      id v73 = v102;
      if ((v72 & 1) == 0)
      {
        objc_super v74 = MBGetDefaultLog();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v73;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "Failed to reset cache after finishing restore: %@", buf, 0xCu);
          id v84 = v73;
          _MBLog();
        }
      }
      id v75 = objc_msgSend(v7, "persona", v84);
      [v75 removeRestorePrefetchCachesOlderThanDate:0];

      if ([v101 isHoldingWorkAssertionForBackgroundRestore])
      {
        id v76 = +[MBDaemon sharedDaemon];
        [v76 releaseWorkAssertion:v93];

        [v101 setIsHoldingWorkAssertionForBackgroundRestore:0];
      }

      unsigned __int8 v9 = v92;
      goto LABEL_56;
    }
    uint64_t v25 = v24;
    id v26 = +[NSDate date];
    [v26 timeIntervalSinceDate:v25];
    double v28 = v27;

    if (v28 < 0.0) {
      double v28 = 0.0;
    }
    unsigned int v29 = [v20 wasCancelled];
    unsigned __int8 v30 = MBGetDefaultLog();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
    if (v29)
    {
      if (v31)
      {
        *(_DWORD *)long long buf = 134217984;
        *(double *)&uint8_t buf[4] = v28;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Restore cancelled after %g seconds", buf, 0xCu);
LABEL_20:
        double v78 = v28;
        _MBLog();
      }
    }
    else if (v31)
    {
      *(_DWORD *)long long buf = 134217984;
      *(double *)&uint8_t buf[4] = v28;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Successful restore took %g seconds", buf, 0xCu);
      goto LABEL_20;
    }

    goto LABEL_22;
  }
  id v32 = MBGetDefaultLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(void *)long long buf = 67109120;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "_finishedRestoreWithAccount called with an invalid service state (%d)", buf, 8u);
    _MBLog();
  }
LABEL_56:
}

- (void)_ckClearRestoreSessionWithAccount:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKManager _ckClearRestoreSessionWithAccount:]", "MBCKManager.m", 3676, "account");
  }
  id v5 = v4;
  id v6 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v4];
  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 accountIdentifier];
    unsigned __int8 v9 = [v5 persona];
    unsigned int v10 = [v9 personaIdentifier];
    *(_DWORD *)long long buf = 138543618;
    id v17 = v8;
    __int16 v18 = 2114;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Clearing restore session for account %{public}@(%{public}@)", buf, 0x16u);

    id v11 = [v5 accountIdentifier];
    id v12 = [v5 persona];
    id v15 = [v12 personaIdentifier];
    _MBLog();
  }
  id v13 = [v6 deviceForRestore];
  +[MBCKEncryptionManager removeRestoreKeyBagsWithAccount:v5 device:v13];
  +[MBServiceRestoreSession clearCurrentRestoreSessionWithAccount:v5];
  id v14 = +[MBFollowUpManager sharedManager];
  [v14 clearPendingFollowUpsWithAccount:v5 identifiers:&off_10043B190];

  [v6 clearRestoreSession];
}

- (BOOL)restoreFileExistsWithPath:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    __assert_rtn("-[MBCKManager restoreFileExistsWithPath:account:]", "MBCKManager.m", 3691, "account");
  }
  id v8 = v7;
  unsigned __int8 v9 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v7];
  unsigned int v10 = [v9 restoreSession];

  if ([v10 isMBSSession])
  {
    v34.receiver = self;
    v34.super_class = (Class)MBCKManager;
    unsigned __int8 v11 = [(MBServiceManager *)&v34 restoreFileExistsWithPath:v6 account:v8];
  }
  else
  {
    id v12 = [(MBCKManager *)self restorePlanForAccount:v8 snapshotUUID:0 error:0];
    if (([v12 isPopulated] & 1) == 0)
    {

      id v12 = 0;
    }
    id v33 = 0;
    id v13 = [(MBCKManager *)self openCacheWithAccount:v8 accessType:1 error:&v33];
    id v14 = v33;
    if (v13)
    {
      id v15 = objc_alloc((Class)MBDomainManager);
      unsigned int v16 = [v8 persona];
      id v17 = [v15 initWithPersona:v16];

      __int16 v18 = MBStandardizePath();

      uint64_t v29 = 0;
      unsigned __int8 v30 = &v29;
      uint64_t v31 = 0x2020000000;
      char v32 = 0;
      stateQueue = self->super._stateQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C4188;
      block[3] = &unk_1004125A0;
      id v23 = v10;
      id v6 = v18;
      id v24 = v6;
      id v25 = v17;
      id v26 = v12;
      double v28 = &v29;
      id v27 = v13;
      id v20 = v17;
      dispatch_sync(stateQueue, block);
      unsigned __int8 v11 = *((unsigned char *)v30 + 24) != 0;

      _Block_object_dispose(&v29, 8);
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  return v11;
}

- (BOOL)restoreDataExistsForApplicationWithBundleID:(id)a3 size:(unint64_t *)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v9) {
    __assert_rtn("-[MBCKManager restoreDataExistsForApplicationWithBundleID:size:account:]", "MBCKManager.m", 3754, "account");
  }
  unsigned int v10 = v9;
  unsigned __int8 v11 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v9];
  id v12 = [v11 restoreSession];

  if ([v12 isMBSSession])
  {
    v33.receiver = self;
    v33.super_class = (Class)MBCKManager;
    unsigned __int8 v13 = [(MBServiceManager *)&v33 restoreDataExistsForApplicationWithBundleID:v8 size:a4 account:v10];
  }
  else
  {
    id v32 = 0;
    id v14 = [(MBCKManager *)self openCacheWithAccount:v10 accessType:1 error:&v32];
    id v15 = v32;
    if (v14)
    {
      uint64_t v28 = 0;
      uint64_t v29 = &v28;
      uint64_t v30 = 0x2020000000;
      char v31 = 0;
      uint64_t v24 = 0;
      id v25 = &v24;
      uint64_t v26 = 0x2020000000;
      uint64_t v27 = 0;
      stateQueue = self->super._stateQueue;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000C474C;
      v18[3] = &unk_100412A60;
      id v19 = v12;
      id v20 = v8;
      id v21 = v14;
      uint64_t v22 = &v28;
      id v23 = &v24;
      dispatch_sync(stateQueue, v18);
      if (a4) {
        *a4 = v25[3];
      }
      unsigned __int8 v13 = *((unsigned char *)v29 + 24) != 0;

      _Block_object_dispose(&v24, 8);
      _Block_object_dispose(&v28, 8);
    }
    else
    {
      unsigned __int8 v13 = 0;
    }
  }
  return v13;
}

- (id)restoreFilesForDomain:(id)a3 relativePath:(id)a4 pendingOnly:(BOOL)a5 range:(_NSRange)a6 account:(id)a7 error:(id *)a8
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  BOOL v11 = a5;
  id v14 = (char *)a3;
  id v47 = a4;
  id v15 = a7;
  if (!v15) {
    __assert_rtn("-[MBCKManager restoreFilesForDomain:relativePath:pendingOnly:range:account:error:]", "MBCKManager.m", 3811, "account");
  }
  unsigned int v16 = v15;
  id v17 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v15];
  __int16 v18 = [v17 restoreSession];

  if ([v18 isMBSSession])
  {
    v58.receiver = self;
    v58.super_class = (Class)MBCKManager;
    -[MBServiceManager restoreFilesForDomain:relativePath:pendingOnly:range:account:error:](&v58, "restoreFilesForDomain:relativePath:pendingOnly:range:account:error:", v14, v47, v11, location, length, v16, a8);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  id v20 = MBGetDefaultLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138413058;
    id v60 = v14;
    __int16 v61 = 1024;
    *(_DWORD *)unsigned __int8 v62 = v11;
    *(_WORD *)&v62[4] = 2048;
    *(void *)&v62[6] = location;
    *(_WORD *)&v62[14] = 2048;
    *(void *)&v62[16] = length;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "=atc= Listing restore files for domain:%@, pendingOnly:%d range:(%lu, %lu)", buf, 0x26u);
    NSUInteger v39 = location;
    NSUInteger v40 = length;
    id v37 = v14;
    BOOL v38 = v11;
    _MBLog();
  }

  id v21 = objc_alloc((Class)MBDomainManager);
  uint64_t v22 = [v16 persona];
  id v45 = [v21 initWithPersona:v22];

  __int16 v46 = [v45 domainForName:v14];
  if (!v46)
  {
    if (a8)
    {
      +[MBError errorWithCode:1, @"Unknown domain %@", v14 format];
      id v19 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v19 = 0;
    }
    goto LABEL_34;
  }
  __int16 v44 = [(MBCKManager *)self restorePlanForAccount:v16 snapshotUUID:0 error:0];
  if ([v44 isPopulated])
  {
    id v23 = [v44 planForDomain:v46 restoreType:2 error:a8];
    id v57 = 0;
    objc_msgSend(v23, "atcFileInfosMatchingRelativePath:pendingOnly:range:error:", v47, v11, location, length, &v57);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    id v43 = v57;
    if (v19)
    {
      id v24 = v19;
    }
    else if (a8)
    {
      *a8 = v43;
    }

LABEL_32:
    goto LABEL_33;
  }
  id v43 = [(MBCKManager *)self openCacheWithAccount:v16 accessType:1 error:a8];
  if (v43)
  {
    uint64_t v53 = 0;
    id v54 = &v53;
    uint64_t v55 = 0x2020000000;
    uint64_t v56 = 0;
    id v25 = objc_opt_new();
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1000C5264;
    v48[3] = &unk_1004125F0;
    id v26 = v47;
    id v49 = v26;
    uint64_t v52 = &v53;
    id v27 = v25;
    id v50 = v27;
    id v51 = v46;
    id v42 = objc_retainBlock(v48);
    if (v11) {
      uint64_t v28 = 11;
    }
    else {
      uint64_t v28 = -1;
    }
    uint64_t v29 = objc_msgSend(v43, "enumerateRestoreFilesForDomain:excludingState:foundRestorable:range:", v14, v28, v42, location, length, v37, v38, v39, v40);
    if (v29)
    {
      uint64_t v30 = MBGetDefaultLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412802;
        id v60 = v14;
        __int16 v61 = 2112;
        *(void *)unsigned __int8 v62 = v26;
        *(_WORD *)&v62[8] = 2112;
        *(void *)&v62[10] = v29;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "=atc= Failed finding restore files from cache for domain:%@, relativePath:%@ %@", buf, 0x20u);
        _MBLog();
      }

      id v19 = 0;
      if (a8) {
        *a8 = v29;
      }
    }
    else
    {
      char v31 = v27;
      id v32 = MBGetDefaultLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v33 = v32;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          id v41 = (char *)[v27 count];
          uint64_t v34 = v54[3];
          id v35 = [v31 count];
          *(_DWORD *)long long buf = 134218754;
          id v60 = &v41[-v34];
          __int16 v61 = 2048;
          *(void *)unsigned __int8 v62 = v35;
          *(_WORD *)&v62[8] = 2112;
          *(void *)&v62[10] = v14;
          *(_WORD *)&v62[18] = 2112;
          *(void *)&v62[20] = v26;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "=atc= Found %llu/%lu restore files from cache for domain:%@, relativePath:%@", buf, 0x2Au);
        }

        [v31 count];
        [v31 count];
        _MBLog();
      }

      id v27 = v31;
      id v19 = v31;
    }

    _Block_object_dispose(&v53, 8);
    goto LABEL_32;
  }
  id v19 = 0;

LABEL_33:
LABEL_34:

LABEL_35:
  return v19;
}

- (void)prioritizeRestoreFileWithPath:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    __assert_rtn("-[MBCKManager prioritizeRestoreFileWithPath:account:]", "MBCKManager.m", 3877, "account");
  }
  id v8 = v7;
  id v9 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v7];
  unsigned int v10 = [v9 restoreSession];

  if ([v10 isMBSSession])
  {
    v36.receiver = self;
    v36.super_class = (Class)MBCKManager;
    [(MBServiceManager *)&v36 prioritizeRestoreFileWithPath:v6 account:v8];
    BOOL v11 = v6;
  }
  else
  {
    BOOL v11 = MBStandardizePath();

    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v38 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Prioritizing restore file: %@", buf, 0xCu);
      uint64_t v28 = v11;
      _MBLog();
    }

    id v35 = 0;
    unsigned __int8 v13 = [(MBCKManager *)self openCacheWithAccount:v8 accessType:1 error:&v35];
    id v14 = v35;
    if (v13)
    {
      id v15 = objc_alloc((Class)MBDomainManager);
      unsigned int v16 = [v8 persona];
      id v17 = [v15 initWithPersona:v16];

      id v34 = 0;
      __int16 v18 = [v17 domainForPath:v11 relativePath:&v34];
      id v19 = v34;
      if (v18)
      {
        id v31 = v17;
        id v20 = [v18 name];
        id v21 = [v13 prioritizeRestoreFileWithDomain:v20 relativePath:v19];

        if (v21)
        {
          uint64_t v22 = MBGetDefaultLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412546;
            id v38 = v11;
            __int16 v39 = 2112;
            id v40 = v21;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to set cache priority for path %@: %@", buf, 0x16u);
            uint64_t v28 = v11;
            uint64_t v30 = v21;
            _MBLog();
          }
        }
        id v33 = v21;
        id v23 = -[MBCKManager restorePlanForAccount:snapshotUUID:error:](self, "restorePlanForAccount:snapshotUUID:error:", v8, 0, &v33, v28, v30);
        id v24 = v33;

        if (!v23)
        {
          id v25 = MBGetDefaultLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            id v38 = v24;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to get plan to set priority: %@", buf, 0xCu);
            id v29 = v24;
            _MBLog();
          }
        }
        id v32 = v24;
        unsigned __int8 v26 = -[NSObject incrementPriorityOfRestorableForDomain:relativePath:error:](v23, "incrementPriorityOfRestorableForDomain:relativePath:error:", v18, v19, &v32, v29);
        id v14 = v32;

        if ((v26 & 1) == 0)
        {
          id v27 = MBGetDefaultLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412546;
            id v38 = v11;
            __int16 v39 = 2112;
            id v40 = v14;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to set priority in plan for path %@: %@", buf, 0x16u);
            _MBLog();
          }
        }
        id v17 = v31;
      }
      else
      {
        id v23 = MBGetDefaultLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          id v38 = v11;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Domain not found for request to prioritize restore file: %@", buf, 0xCu);
          _MBLog();
        }
      }
    }
  }
}

- (id)getBuddyDataStashForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 account:(id)a5 connection:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (!v11) {
    __assert_rtn("-[MBCKManager getBuddyDataStashForBackupUDID:snapshotID:account:connection:error:]", "MBCKManager.m", 3919, "serviceAccount");
  }
  unsigned __int8 v13 = v12;
  id v14 = v10;
  id v15 = MBDeviceUDID_Legacy();
  unsigned int v16 = [v14 isEqualToString:v15];

  uint64_t v17 = (uint64_t)v14;
  if (v16)
  {
    uint64_t v17 = MBDeviceUUID();
  }
  __int16 v18 = MBGetDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    unint64_t v96 = (unint64_t)v14;
    __int16 v97 = 2112;
    uint64_t v98 = v17;
    __int16 v99 = 2048;
    unint64_t v100 = a4;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Fetching the buddy data stash, backupUDID:%@, backupUUID:%@, snapshotID:%lu", buf, 0x20u);
    uint64_t v66 = v17;
    unint64_t v68 = a4;
    id v65 = v14;
    _MBLog();
  }
  id v79 = (void *)v17;

  id v19 = +[MBCKOperationPolicy expensiveCellularPolicy];
  id v20 = [(MBCKManager *)self databaseManager];
  id v94 = 0;
  id v21 = +[MBCKOperationTracker operationTrackerWithAccount:v11 databaseManager:v20 policy:v19 error:&v94];
  uint64_t v22 = self;
  id v23 = v94;

  uint64_t v71 = v13;
  unsigned __int8 v72 = v19;
  if (!v21)
  {
    id v75 = 0;
LABEL_39:
    id v38 = 0;
    id v82 = 0;
    id v43 = 0;
    uint64_t v28 = 0;
    goto LABEL_53;
  }
  id v24 = [v13 processName];
  id v25 = [v19 operationGroupWithName:@"getBuddyDataStash" processName:v24];
  [v21 setCkOperationGroup:v25];

  SEL v93 = v23;
  double v78 = v22;
  uint64_t v26 = [(MBCKManager *)v22 openCacheWithAccount:v11 accessType:1 error:&v93];
  id v27 = v93;

  id v75 = (void *)v26;
  if (!v26)
  {
    id v75 = 0;
    id v23 = v27;
    goto LABEL_39;
  }
  id v69 = v11;
  id v82 = 0;
  id v83 = 0;
  uint64_t v28 = 0;
  char v29 = 1;
  uint64_t v30 = v79;
  id v73 = v14;
  objc_super v74 = v21;
  do
  {
    id v31 = v28;
    long long v92 = v27;
    uint64_t v28 = [(MBCKManager *)v78 _snapshotForSnapshotID:a4 backupUDID:v14 cached:v29 & 1 operationTracker:v21 error:&v92];
    id v23 = v92;

    if (!v28
      || ([v28 snapshotUUID], id v32 = objc_claimAutoreleasedReturnValue(), v32, !v32))
    {
      id v34 = +[MBError errorWithCode:204, @"Specified snapshot %lu not found in backup %@", a4, v14, v68 format];
      id v11 = v69;
      id v38 = v83;
LABEL_48:
      unsigned __int8 v62 = context;

      id v23 = v34;
      goto LABEL_52;
    }
    if (v83) {
      goto LABEL_14;
    }
    long long v91 = v23;
    id v33 = +[MBCKAccount fetchAccountWithOperationTracker:v21 cache:v75 error:&v91];
    id v34 = v91;

    if (!v33)
    {
      id v23 = MBGetDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        unint64_t v96 = (unint64_t)v34;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to fetch the account record: %@", buf, 0xCu);
        _MBLog();
      }
      id v38 = 0;
LABEL_47:
      id v11 = v69;
      goto LABEL_48;
    }
    long long v90 = v34;
    id v83 = v33;
    unsigned int v35 = [v33 fetchDevicesWithOperationTracker:v21 error:&v90];
    id v23 = v90;

    if (!v35) {
      goto LABEL_51;
    }
LABEL_14:
    objc_super v36 = v82;
    if (v82)
    {
      id v37 = v23;
      goto LABEL_18;
    }
    id v38 = v83;
    __int16 v39 = [v83 deviceForUUID:v30];
    if (!v39)
    {
      __int16 v61 = MBGetDefaultLog();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        unint64_t v96 = (unint64_t)v14;
        __int16 v97 = 2112;
        uint64_t v98 = (uint64_t)v30;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "No device found for backupUDID:%@, backupUUID:%@", buf, 0x16u);
        _MBLog();
      }

      id v34 = +[MBError errorWithCode:1, @"No device found for %@", v14 format];
      id v82 = 0;
      goto LABEL_47;
    }
    objc_super v36 = v39;
    id v89 = v23;
    unsigned int v40 = [v39 fetchSnapshotsWithOperationTracker:v21 retry:1 error:&v89];
    id v37 = v89;

    if (!v40)
    {
      id v82 = v36;
      id v23 = v37;
LABEL_51:
      id v11 = v69;
      id v38 = v83;
      unsigned __int8 v62 = context;
LABEL_52:
      id v43 = 0;
      goto LABEL_53;
    }
LABEL_18:
    id v41 = objc_msgSend(v28, "snapshotUUID", v65, v66, v68);
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v82 = v36;
    id v42 = [v36 snapshots];
    id v43 = [v42 countByEnumeratingWithState:&v85 objects:v103 count:16];
    if (v43)
    {
      id v76 = v28;
      uint64_t v44 = *(void *)v86;
      while (2)
      {
        for (i = 0; i != v43; i = (char *)i + 1)
        {
          if (*(void *)v86 != v44) {
            objc_enumerationMutation(v42);
          }
          __int16 v46 = *(void **)(*((void *)&v85 + 1) + 8 * i);
          id v47 = [v46 snapshotID];
          unsigned int v48 = [v47 isEqualToString:v41];

          if (v48)
          {
            id v43 = v46;
            goto LABEL_28;
          }
        }
        id v43 = [v42 countByEnumeratingWithState:&v85 objects:v103 count:16];
        if (v43) {
          continue;
        }
        break;
      }
LABEL_28:
      id v14 = v73;
      id v21 = v74;
      uint64_t v30 = v79;
      uint64_t v28 = v76;
    }

    char v49 = v29 & (v43 == 0);
    char v29 = 0;
    id v27 = v37;
  }
  while ((v49 & 1) != 0);
  if (v43)
  {
    uint64_t v77 = v28;
    id v50 = MBGetDefaultLog();
    id v11 = v69;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      id v51 = [v43 snapshotID];
      *(_DWORD *)long long buf = 134218498;
      unint64_t v96 = a4;
      __int16 v97 = 2112;
      uint64_t v98 = (uint64_t)v51;
      __int16 v99 = 2112;
      unint64_t v100 = (unint64_t)v14;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Found snapshot %lu (%@) in backup %@", buf, 0x20u);

      id v67 = [v43 snapshotID];
      _MBLog();
    }
    uint64_t v52 = [MBCKProperties alloc];
    uint64_t v53 = [v43 backupProperties];
    id v84 = v27;
    id v54 = [(MBProperties *)v52 initWithData:v53 error:&v84];
    id v23 = v84;

    uint64_t v55 = MBGetDefaultLog();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v56 = [(MBProperties *)v54 buddyStashData];
      id v57 = [v56 length];
      *(_DWORD *)long long buf = 134218754;
      unint64_t v96 = (unint64_t)v57;
      __int16 v97 = 2112;
      uint64_t v98 = (uint64_t)v14;
      __int16 v99 = 2112;
      unint64_t v100 = (unint64_t)v79;
      __int16 v101 = 2048;
      unint64_t v102 = a4;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Found %lu bytes for the buddy data stash, backupUDID:%@, backupUUID:%@, snapshotID:%lu", buf, 0x2Au);

      objc_super v58 = [(MBProperties *)v54 buddyStashData];
      [v58 length];
      _MBLog();
    }
    if (v54)
    {
      uint64_t v59 = [(MBProperties *)v54 buddyStashData];

      id v60 = v71;
      uint64_t v28 = v77;
      goto LABEL_59;
    }
    uint64_t v28 = v77;
  }
  else
  {
    id v23 = +[MBError errorWithCode:1, @"Specified snapshot %lu not found in backup %@", a4, v14 format];

    id v11 = v69;
  }
  id v38 = v83;
LABEL_53:
  id v63 = MBGetDefaultLog();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138413058;
    unint64_t v96 = (unint64_t)v14;
    __int16 v97 = 2112;
    uint64_t v98 = (uint64_t)v79;
    __int16 v99 = 2048;
    unint64_t v100 = a4;
    __int16 v101 = 2112;
    unint64_t v102 = (unint64_t)v23;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "Failed to fetch buddy data stash for backupUDID:%@, backupUUID:%@, snapshotID:%lu: %@", buf, 0x2Au);
    _MBLog();
  }
  id v83 = v38;

  if (a7)
  {
    id v23 = v23;
    uint64_t v59 = 0;
    *a7 = v23;
  }
  else
  {
    uint64_t v59 = 0;
  }
  id v60 = v71;
LABEL_59:

  return v59;
}

- (id)getAppleIDsForBackupUDID:(id)a3 account:(id)a4 snapshotID:(unint64_t)a5 activeAppleID:(id *)a6 connection:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  uint64_t v17 = [(MBCKManager *)self openCacheWithAccount:v15 accessType:1 error:a8];
  if (!v17)
  {
    id v42 = 0;
    goto LABEL_58;
  }
  id v67 = a6;
  __int16 v18 = +[MBCKOperationPolicy expensiveCellularPolicy];
  id v19 = [(MBCKManager *)self databaseManager];
  id v20 = +[MBCKOperationTracker operationTrackerWithAccount:v15 databaseManager:v19 policy:v18 error:a8];

  if (v20)
  {
    id v21 = [v16 processName];
    unint64_t v68 = v18;
    uint64_t v22 = [v18 operationGroupWithName:@"getAppleIDs" processName:v21];
    [v20 setCkOperationGroup:v22];

    id v23 = [(MBCKManager *)self snapshotForSnapshotID:a5 backupUDID:v14 operationTracker:v20 error:a8];
    id v24 = v23;
    id v66 = v14;
    if (!v23
      || ([v23 snapshotUUID], id v25 = objc_claimAutoreleasedReturnValue(), v25, !v25))
    {
      id v43 = v14;
      __int16 v39 = v24;
      v74.receiver = self;
      v74.super_class = (Class)MBCKManager;
      id v42 = [(MBServiceManager *)&v74 getAppleIDsForBackupUDID:v43 account:v15 snapshotID:a5 activeAppleID:v67 connection:0 error:a8];
      __int16 v18 = v68;
LABEL_56:

      id v14 = v66;
      goto LABEL_57;
    }
    uint64_t v26 = v14;
    id v27 = MBDeviceUDID_Legacy();
    unsigned int v28 = [v26 isEqualToString:v27];

    if (v28)
    {
      uint64_t v29 = MBDeviceUUID();

      uint64_t v26 = v29;
    }
    __int16 v18 = v68;
    uint64_t v30 = MBGetDefaultLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v77 = v26;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Fetching Apple IDs for %@", buf, 0xCu);
      uint64_t v55 = v26;
      _MBLog();
    }

    id v73 = 0;
    id v31 = +[MBCKAccount fetchAccountWithOperationTracker:v20 cache:v17 error:&v73];
    id v65 = v73;
    if (!v31)
    {
      uint64_t v44 = MBGetDefaultLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v77 = v65;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Failed to fetch account record: %@", buf, 0xCu);
        _MBLog();
      }
      __int16 v39 = v24;

      id v42 = 0;
      if (a8) {
        *a8 = v65;
      }
      id v31 = 0;
      goto LABEL_55;
    }
    if (![v31 fetchDevicesWithOperationTracker:v20 error:a8])
    {
      __int16 v39 = v24;
      id v42 = 0;
LABEL_55:

      goto LABEL_56;
    }
    id v32 = [v31 deviceForUUID:v26];
    objc_super v58 = v32;
    if (v32)
    {
      id v57 = v26;
      id v33 = v32;
      if (![v32 fetchSnapshotsWithOperationTracker:v20 retry:1 error:a8])
      {
        __int16 v39 = v24;
        id v42 = 0;
        uint64_t v26 = v57;
LABEL_54:

        goto LABEL_55;
      }
      id v60 = v31;
      id v34 = [v33 snapshots];
      id v35 = [v34 count];

      if (v35)
      {
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id obj = [v33 snapshots];
        __int16 v18 = v68;
        id v63 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
        if (v63)
        {
          uint64_t v61 = *(void *)v70;
          id v56 = v16;
LABEL_16:
          objc_super v36 = 0;
          while (1)
          {
            if (*(void *)v70 != v61) {
              objc_enumerationMutation(obj);
            }
            id v37 = *(void **)(*((void *)&v69 + 1) + 8 * (void)v36);
            id v38 = objc_msgSend(v37, "snapshotID", v55);
            __int16 v39 = v24;
            unsigned int v40 = [v24 snapshotUUID];
            unsigned __int8 v41 = [v38 isEqualToString:v40];

            if (v41) {
              break;
            }
            objc_super v36 = (char *)v36 + 1;
            __int16 v18 = v68;
            id v24 = v39;
            if (v63 == v36)
            {
              id v16 = v56;
              id v63 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
              if (v63) {
                goto LABEL_16;
              }
              goto LABEL_22;
            }
          }
          id v47 = v37;

          id v16 = v56;
          __int16 v18 = v68;
          id v24 = v39;
          if (!v47) {
            goto LABEL_45;
          }
          unsigned int v48 = [MBCKProperties alloc];
          unsigned __int8 v62 = v47;
          char v49 = [v47 backupProperties];
          id v50 = [(MBProperties *)v48 initWithData:v49 error:a8];

          uint64_t v26 = v57;
          id v64 = v50;
          if (v50)
          {
            id v51 = [(MBProperties *)v50 appleIDs];
            uint64_t v52 = MBGetDefaultLog();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v77 = v51;
              _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "AppleIDs: %@", buf, 0xCu);
              uint64_t v55 = v51;
              _MBLog();
            }

            __int16 v18 = v68;
            if (v51)
            {
              id v31 = v60;
              if (v67)
              {
                id *v67 = [(MBProperties *)v64 activeAppleID];
              }
              id v42 = [v51 allKeys];
            }
            else
            {
              id v42 = &__NSArray0__struct;
              id v31 = v60;
            }
          }
          else
          {
            id v51 = MBGetDefaultLog();
            __int16 v18 = v68;
            id v31 = v60;
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Failed to fetch snapshot properties", buf, 2u);
              _MBLog();
            }
            id v42 = 0;
          }

          goto LABEL_54;
        }
LABEL_22:

LABEL_45:
        __int16 v39 = v24;
      }
      else
      {
        uint64_t v53 = MBGetDefaultLog();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "No snapshots for device", buf, 2u);
          _MBLog();
        }
        __int16 v39 = v24;

        __int16 v18 = v68;
      }
      uint64_t v26 = v57;
      if (a8)
      {
        CFStringRef v46 = @"Snapshot not found";
        goto LABEL_51;
      }
    }
    else
    {
      id v60 = v31;
      id v45 = MBGetDefaultLog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v77 = v26;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "No backups for device %@", buf, 0xCu);
        uint64_t v55 = v26;
        _MBLog();
      }
      __int16 v39 = v24;

      if (a8)
      {
        CFStringRef v46 = @"No backups for device";
LABEL_51:
        +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, v46, v55);
        id v42 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_53:
        id v31 = v60;
        goto LABEL_54;
      }
    }
    id v42 = 0;
    goto LABEL_53;
  }
  id v42 = 0;
LABEL_57:

LABEL_58:
  return v42;
}

+ (id)restoreInfoForAccount:(id)a3
{
  id v3 = [a3 persona];
  id v4 = [v3 copyPreferencesValueForKey:@"RestoreInfo" class:objc_opt_class()];

  if (v4) {
    id v5 = [objc_alloc((Class)MBRestoreInfo) initWithDictionaryRepresentation:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)getAppleIDsMapForBackupUDID:(id)a3 account:(id)a4 snapshotID:(unint64_t)a5 activeAppleID:(id *)a6 connection:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = v14;
  __int16 v18 = MBDeviceUDID_Legacy();
  LODWORD(a4) = [v17 isEqualToString:v18];

  id v19 = v17;
  if (a4)
  {
    id v19 = MBDeviceUUID();
  }
  id v20 = MBGetDefaultLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    unint64_t v114 = (unint64_t)v17;
    __int16 v115 = 2112;
    __int16 v116 = v19;
    __int16 v117 = 2048;
    unint64_t v118 = a5;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Fetching the iCloud Apple IDs for backupUDID:%@, backupUUID:%@, snapshotID:%lu", buf, 0x20u);
    id v76 = v19;
    unint64_t v78 = a5;
    id v75 = v17;
    _MBLog();
  }

  long long v87 = [(MBCKManager *)self openCacheWithAccount:v15 accessType:1 error:a8];
  if (!v87)
  {
    id v56 = 0;
    id v57 = 0;
    objc_super v58 = 0;
    uint64_t v59 = 0;
    id v24 = 0;
    goto LABEL_76;
  }
  id v79 = a6;
  id v82 = a8;
  id v21 = +[MBCKOperationPolicy expensiveCellularPolicy];
  long long v88 = self;
  uint64_t v22 = [(MBCKManager *)self databaseManager];
  id v112 = 0;
  id v23 = +[MBCKOperationTracker operationTrackerWithAccount:v15 databaseManager:v22 policy:v21 error:&v112];
  id v24 = v112;

  long long v86 = v23;
  id v83 = v16;
  if (!v23)
  {
    long long v90 = 0;
    id v92 = 0;
    id v94 = 0;
    id v95 = 0;
    id v42 = 0;
    id v60 = v21;
    goto LABEL_39;
  }
  id v80 = v15;
  id v25 = [v16 processName];
  id v81 = v21;
  uint64_t v26 = [v21 operationGroupWithName:@"getAppleIDsMap" processName:v25];
  [v23 setCkOperationGroup:v26];

  id v94 = 0;
  id v95 = 0;
  id v27 = 0;
  char v28 = 1;
  unint64_t v84 = a5;
  long long v85 = v19;
  do
  {
    uint64_t v29 = v27;
    id v111 = v24;
    id v27 = [(MBCKManager *)v88 _snapshotForSnapshotID:a5 backupUDID:v17 cached:v28 & 1 operationTracker:v23 error:&v111];
    uint64_t v30 = v111;

    if (!v27
      || ([v27 snapshotUUID], id v31 = objc_claimAutoreleasedReturnValue(), v31, !v31))
    {
      long long v90 = v27;
      id v109 = v30;
      id v110 = 0;
      v108.receiver = v88;
      v108.super_class = (Class)MBCKManager;
      id v15 = v80;
      uint64_t v61 = -[MBServiceManager getAppleIDsForBackupUDID:account:snapshotID:activeAppleID:connection:error:](&v108, "getAppleIDsForBackupUDID:account:snapshotID:activeAppleID:connection:error:", v17, v80, a5, &v110, 0, &v109, v75, v76, v78);
      id v92 = v110;
      id v24 = v109;

      uint64_t v55 = objc_opt_new();
      long long v104 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      id v62 = v61;
      id v63 = [v62 countByEnumeratingWithState:&v104 objects:v124 count:16];
      id v54 = (MBCKProperties *)v82;
      if (v63)
      {
        id v64 = v63;
        uint64_t v65 = *(void *)v105;
        do
        {
          for (i = 0; i != v64; i = (char *)i + 1)
          {
            if (*(void *)v105 != v65) {
              objc_enumerationMutation(v62);
            }
            [v55 setObject:&__NSDictionary0__struct forKeyedSubscript:*(void *)(*((void *)&v104 + 1) + 8 * i)];
          }
          id v64 = [v62 countByEnumeratingWithState:&v104 objects:v124 count:16];
        }
        while (v64);
      }

      id v42 = 0;
      if (!v55)
      {
        a5 = v84;
        id v19 = v85;
        id v60 = v81;
        goto LABEL_70;
      }
      id v54 = 0;
      a5 = v84;
      id v19 = v85;
LABEL_49:
      id v60 = v81;
      id v67 = MBGetDefaultLog();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138413314;
        unint64_t v114 = (unint64_t)v17;
        __int16 v115 = 2112;
        __int16 v116 = v19;
        __int16 v117 = 2048;
        unint64_t v118 = a5;
        __int16 v119 = 2112;
        __int16 v120 = v55;
        __int16 v121 = 2112;
        id v122 = v92;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Fetched the iCloud Apple IDs for backupUDID:%@, backupUUID:%@, snapshotID:%lu: %@, active Apple ID = %@", buf, 0x34u);
        id v60 = v81;
        _MBLog();
      }

      objc_super v58 = v92;
      if (v79) {
        id *v79 = v92;
      }
      uint64_t v59 = v55;
      unint64_t v68 = v90;
      goto LABEL_75;
    }
    id v32 = v95;
    if (!v95)
    {
      id v103 = v30;
      id v32 = +[MBCKAccount fetchAccountWithOperationTracker:v23 cache:v87 error:&v103];
      id v33 = v103;

      if (!v32)
      {
        uint64_t v30 = MBGetDefaultLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          unint64_t v114 = (unint64_t)v33;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to fetch account record: %@", buf, 0xCu);
          _MBLog();
        }
        id v32 = 0;
        goto LABEL_68;
      }
      unint64_t v102 = v33;
      unsigned int v34 = [v32 fetchDevicesWithOperationTracker:v23 error:&v102];
      uint64_t v30 = v102;

      if (!v34)
      {
        id v95 = v32;
        long long v90 = v27;
LABEL_63:
        id v15 = v80;
        id v60 = v81;
        id v54 = (MBCKProperties *)v82;
LABEL_69:
        id v92 = 0;
        id v42 = 0;
        id v24 = v30;
        goto LABEL_70;
      }
    }
    id v35 = v94;
    id v95 = v32;
    if (v94)
    {
      long long v91 = v30;
      goto LABEL_18;
    }
    objc_super v36 = [v32 deviceForUUID:v19];
    if (!v36)
    {
      long long v69 = MBGetDefaultLog();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        unint64_t v114 = (unint64_t)v17;
        __int16 v115 = 2112;
        __int16 v116 = v19;
        _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "No device found for backupUDID:%@, backupUUID:%@,", buf, 0x16u);
        _MBLog();
      }

      id v33 = +[MBError errorWithCode:1, @"No device found for %@", v17 format];
      id v94 = 0;
LABEL_68:
      id v15 = v80;
      id v60 = v81;
      id v54 = (MBCKProperties *)v82;
      id v95 = v32;
      long long v90 = v27;

      uint64_t v30 = v33;
      goto LABEL_69;
    }
    id v35 = v36;
    __int16 v101 = v30;
    unsigned int v37 = [v36 fetchSnapshotsWithOperationTracker:v23 retry:1 error:&v101];
    long long v91 = v101;

    if (!v37)
    {
      id v94 = v35;
      long long v90 = v27;
      uint64_t v30 = v91;
      goto LABEL_63;
    }
    id v38 = [v35 snapshots];
    id v39 = [v38 count];

    if (!v39)
    {
      id v94 = v35;
      long long v70 = MBGetDefaultLog();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        unint64_t v114 = (unint64_t)v17;
        __int16 v115 = 2112;
        __int16 v116 = v19;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "No snapshots found for backupUDID:%@, backupUUID:%@", buf, 0x16u);
        _MBLog();
      }

      id v33 = +[MBError errorWithCode:1, @"No snapshots found for %@", v17 format];
      uint64_t v30 = v91;
      goto LABEL_68;
    }
LABEL_18:
    unsigned int v40 = objc_msgSend(v27, "snapshotUUID", v75, v76, v78);
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v94 = v35;
    unsigned __int8 v41 = [v35 snapshots];
    id v42 = [v41 countByEnumeratingWithState:&v97 objects:v123 count:16];
    if (v42)
    {
      id v89 = v27;
      id v43 = v17;
      uint64_t v44 = *(void *)v98;
      while (2)
      {
        for (j = 0; j != v42; j = (char *)j + 1)
        {
          if (*(void *)v98 != v44) {
            objc_enumerationMutation(v41);
          }
          CFStringRef v46 = *(void **)(*((void *)&v97 + 1) + 8 * (void)j);
          id v47 = [v46 snapshotID];
          unsigned int v48 = [v47 isEqualToString:v40];

          if (v48)
          {
            id v42 = v46;
            goto LABEL_28;
          }
        }
        id v42 = [v41 countByEnumeratingWithState:&v97 objects:v123 count:16];
        if (v42) {
          continue;
        }
        break;
      }
LABEL_28:
      id v17 = v43;
      a5 = v84;
      id v19 = v85;
      id v23 = v86;
      id v27 = v89;
    }

    char v49 = v28 & (v42 == 0);
    char v28 = 0;
    id v24 = v91;
  }
  while ((v49 & 1) != 0);
  long long v90 = v27;
  if (!v42)
  {
    id v24 = +[MBError errorWithCode:1, @"Specified snapshot %lu not found in backup %@", a5, v17 format];

    id v92 = 0;
    id v15 = v80;
    id v60 = v81;
    goto LABEL_39;
  }
  id v50 = MBGetDefaultLog();
  id v15 = v80;
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    id v51 = [v42 snapshotID];
    *(_DWORD *)long long buf = 134218498;
    unint64_t v114 = a5;
    __int16 v115 = 2112;
    __int16 v116 = v51;
    __int16 v117 = 2112;
    unint64_t v118 = (unint64_t)v17;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Found snapshot %lu (%@) in backup %@", buf, 0x20u);

    uint64_t v77 = [v42 snapshotID];
    _MBLog();
  }
  uint64_t v52 = [MBCKProperties alloc];
  uint64_t v53 = [v42 backupProperties];
  unint64_t v96 = v91;
  id v54 = [(MBProperties *)v52 initWithData:v53 error:&v96];
  id v24 = v96;

  if (v54)
  {
    uint64_t v55 = [(MBProperties *)v54 appleIDs];
    id v92 = [(MBProperties *)v54 activeAppleID];
    if (!v55) {
      uint64_t v55 = &__NSDictionary0__struct;
    }
    goto LABEL_49;
  }
  objc_super v74 = MBGetDefaultLog();
  id v60 = v81;
  if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138413058;
    unint64_t v114 = (unint64_t)v17;
    __int16 v115 = 2112;
    __int16 v116 = v19;
    __int16 v117 = 2048;
    unint64_t v118 = a5;
    __int16 v119 = 2112;
    __int16 v120 = v24;
    _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "Failed to fetch the snapshot properties for backupUDID:%@, backupUUID:%@, snapshotID:%lu: %@", buf, 0x2Au);
    _MBLog();
  }

  id v92 = 0;
LABEL_39:
  id v54 = (MBCKProperties *)v82;
LABEL_70:
  long long v71 = MBGetDefaultLog();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138413058;
    unint64_t v114 = (unint64_t)v17;
    __int16 v115 = 2112;
    __int16 v116 = v19;
    __int16 v117 = 2048;
    unint64_t v118 = a5;
    __int16 v119 = 2112;
    __int16 v120 = v24;
    _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "Failed to fetch the iCloud Apple IDs for backupUDID:%@, backupUUID:%@, snapshotID:%lu: %@", buf, 0x2Au);
    _MBLog();
  }

  unint64_t v68 = v90;
  objc_super v58 = v92;
  if (v54)
  {
    id v24 = v24;
    long long v72 = v54;
    id v54 = 0;
    uint64_t v59 = 0;
    v72->super.super.isa = (Class)v24;
  }
  else
  {
    uint64_t v59 = 0;
  }
LABEL_75:

  id v16 = v83;
  id v56 = v94;
  id v57 = v95;
LABEL_76:

  return v59;
}

- (BOOL)prepareForBackgroundRestoreWithAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBCKManager prepareForBackgroundRestoreWithAccount:error:]", "MBCKManager.m", 4202, "account");
  }
  if (!a4) {
    __assert_rtn("-[MBCKManager prepareForBackgroundRestoreWithAccount:error:]", "MBCKManager.m", 4203, "error");
  }
  id v7 = v6;
  id v8 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v6];
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = sub_1000AD5B8;
  char v28 = sub_1000AD5C8;
  id v29 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C785C;
  block[3] = &unk_100412B50;
  id v10 = v8;
  id v15 = v10;
  __int16 v18 = &v20;
  id v11 = v7;
  id v16 = v11;
  id v17 = self;
  id v19 = &v24;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v21 + 24))
  {
    BOOL v12 = 1;
  }
  else
  {
    *a4 = (id) v25[5];
    BOOL v12 = *((unsigned char *)v21 + 24) != 0;
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (BOOL)startScanForBundleIDs:(id)a3 account:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = MBDeviceUUID();
  id v11 = [(MBCKManager *)self _ckSettingsContextForBackupUDID:v10 account:v8];

  id v12 = [v11 copy];
  [v12 setBundleIDs:v9];

  LOBYTE(a5) = [(MBCKManager *)self _startScanWithSettingsContext:v12 error:a5];
  return (char)a5;
}

- (BOOL)startScanWithAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBCKManager startScanWithAccount:error:]", "MBCKManager.m", 4242, "account");
  }
  id v7 = v6;
  id v8 = MBDeviceUUID();
  id v9 = [(MBCKManager *)self _ckSettingsContextForBackupUDID:v8 account:v7];

  BOOL v10 = [(MBCKManager *)self _startScanWithSettingsContext:v9 error:a4];
  return v10;
}

- (BOOL)_startScanWithSettingsContext:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v8 = [v7 account];
  if (!v8) {
    __assert_rtn("-[MBCKManager _startScanWithSettingsContext:error:]", "MBCKManager.m", 4250, "account");
  }
  id v9 = (void *)v8;
  BOOL v10 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v8];
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  char v28 = sub_1000AD5B8;
  id v29 = sub_1000AD5C8;
  id v30 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C7DE0;
  block[3] = &unk_100412640;
  id v12 = v10;
  id v18 = v12;
  uint64_t v22 = &v25;
  char v23 = &v31;
  id v13 = v9;
  id v19 = v13;
  id v14 = v7;
  id v20 = v14;
  id v21 = self;
  SEL v24 = a2;
  dispatch_sync(stateQueue, block);
  if (a4 && v26[5])
  {
    -[MBCKManager _sanitizeError:](self, "_sanitizeError:");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  char v15 = *((unsigned char *)v32 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v15;
}

- (id)filesForSnapshotID:(unint64_t)a3 backupUDID:(id)a4 account:(id)a5 connection:(id)a6 error:(id *)a7
{
  id v63 = a4;
  id v12 = a5;
  id v59 = a6;
  if (!v12) {
    __assert_rtn("-[MBCKManager filesForSnapshotID:backupUDID:account:connection:error:]", "MBCKManager.m", 4302, "serviceAccount");
  }
  if (!a7) {
    __assert_rtn("-[MBCKManager filesForSnapshotID:backupUDID:account:connection:error:]", "MBCKManager.m", 4303, "error");
  }
  id v64 = v12;
  uint64_t v61 = a7;
  uint64_t v65 = [(MBCKManager *)self openCacheWithAccount:v12 accessType:1 error:a7];
  if (!v65)
  {
    id v37 = 0;
    goto LABEL_57;
  }
  id v60 = +[MBCKOperationPolicy expensiveCellularPolicy];
  id v13 = [(MBCKManager *)self databaseManager];
  id v62 = +[MBCKOperationTracker operationTrackerWithAccount:v12 databaseManager:v13 policy:v60 error:a7];

  if (v62)
  {
    id v14 = [v59 processName];
    char v15 = [v60 operationGroupWithName:@"getFilesForSnapshot" processName:v14];
    [v62 setCkOperationGroup:v15];

    id v16 = [(MBCKManager *)self snapshotForSnapshotID:a3 backupUDID:v63 operationTracker:v62 error:v61];
    id v17 = v16;
    if (!v16
      || ([v16 snapshotUUID], id v18 = objc_claimAutoreleasedReturnValue(), v18, !v18))
    {
      +[MBError errorWithCode:1 format:@"Failed to find snapshot"];
      id v37 = 0;
      id *v61 = (id)objc_claimAutoreleasedReturnValue();
LABEL_55:

      goto LABEL_56;
    }
    id v19 = v63;
    id v20 = MBDeviceUDID_Legacy();
    uint64_t v21 = (uint64_t)v19;
    unsigned int v22 = [v19 isEqualToString:v20];

    if (v22)
    {
      uint64_t v21 = MBDeviceUUID();
    }
    id v54 = (void *)v21;
    id v56 = [(MBCKManager *)self _ckSettingsContextForBackupUDID:v21 account:v64];
    objc_super v58 = [(MBCKManager *)self _backupEngineWithReason:1 settingsContext:v56 account:v64];
    [v58 setCache:v65];
    char v23 = [v58 context];
    [v23 setPlugins:0];

    [v58 setCkOperationPolicy:v60];
    [v58 setCkOperationTracker:v62];
    id v77 = 0;
    id v57 = +[MBCKAccount fetchAccountWithOperationTracker:v62 cache:v65 error:&v77];
    id v55 = v77;
    if (!v57)
    {
      id v38 = MBGetDefaultLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v55;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Failed to fetch account record: %@", (uint8_t *)&buf, 0xCu);
        _MBLog();
      }

      id v37 = 0;
      id *v61 = v55;
      goto LABEL_54;
    }
    if (![v57 fetchDevicesWithOperationTracker:v62 error:v61])
    {
      id v37 = 0;
LABEL_54:

      goto LABEL_55;
    }
    SEL v24 = [v57 deviceForUUID:v21];
    uint64_t v53 = v24;
    if (!v24)
    {
      id v39 = MBGetDefaultLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v21;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "No backups for device %@", (uint8_t *)&buf, 0xCu);
        _MBLog();
      }

      +[MBError errorWithCode:1 format:@"No backups for device"];
      id v37 = 0;
      id *v61 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_53;
    }
    if (![v24 fetchSnapshotsWithOperationTracker:v62 retry:1 error:v61]
      || ([v58 setDevice:v53], (objc_msgSend(v53, "validateCache") & 1) == 0)
      && ![v58 refreshCacheWithError:v61])
    {
      id v37 = 0;
LABEL_53:

      goto LABEL_54;
    }
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    uint64_t v25 = [v53 snapshots];
    uint64_t v26 = 0;
    id v27 = [v25 countByEnumeratingWithState:&v73 objects:v84 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v74;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v74 != v28) {
            objc_enumerationMutation(v25);
          }
          id v30 = *(void **)(*((void *)&v73 + 1) + 8 * i);
          uint64_t v31 = [v30 snapshotID];
          id v32 = [v17 snapshotUUID];
          unsigned int v33 = [v31 isEqualToString:v32];

          if (v33)
          {
            id v34 = v30;

            uint64_t v26 = v34;
          }
        }
        id v27 = [v25 countByEnumeratingWithState:&v73 objects:v84 count:16];
      }
      while (v27);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v80 = 0x3032000000;
    id v81 = sub_1000AD5B8;
    id v82 = sub_1000AD5C8;
    id v83 = objc_alloc_init((Class)NSMutableArray);
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_1000C8CC0;
    v72[3] = &unk_100412668;
    v72[4] = &buf;
    id v35 = [v65 enumerateManifestsForSnapshot:v26 foundManifest:v72];
    if (v35)
    {
      id v36 = v35;
      id v37 = 0;
      id *v61 = v36;
LABEL_52:

      _Block_object_dispose(&buf, 8);
      goto LABEL_53;
    }
    unsigned int v40 = objc_opt_new();
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id obj = *(id *)(*((void *)&buf + 1) + 40);
    id v41 = [obj countByEnumeratingWithState:&v68 objects:v78 count:16];
    if (v41)
    {
      id v42 = v41;
      id v43 = 0;
      uint64_t v44 = *(void *)v69;
LABEL_39:
      uint64_t v45 = 0;
      while (1)
      {
        if (*(void *)v69 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v46 = *(void *)(*((void *)&v68 + 1) + 8 * v45);
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472;
        v66[2] = sub_1000C8CEC;
        v66[3] = &unk_100412690;
        id v67 = v40;
        unsigned int v48 = [v65 enumerateFilesForManifest:v46 foundFile:v66];
        char v49 = v48;
        if (v48)
        {
          id v50 = v48;

          id v43 = v50;
        }

        if (v49) {
          break;
        }
        if (v42 == (id)++v45)
        {
          id v42 = [obj countByEnumeratingWithState:&v68 objects:v78 count:16];
          if (v42) {
            goto LABEL_39;
          }
          break;
        }
      }

      if (v43)
      {
        id v36 = v43;
        id v37 = 0;
        id *v61 = v36;
LABEL_51:

        goto LABEL_52;
      }
    }
    else
    {
    }
    id v37 = v40;
    id v36 = 0;
    goto LABEL_51;
  }
  id v37 = 0;
LABEL_56:

LABEL_57:
  return v37;
}

- (BOOL)mergeSnapshots:(id)a3 backupUUID:(id)a4 account:(id)a5 connection:(id)a6 error:(id *)a7
{
  id v53 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v13) {
    __assert_rtn("-[MBCKManager mergeSnapshots:backupUUID:account:connection:error:]", "MBCKManager.m", 4422, "serviceAccount");
  }
  char v15 = v14;
  id v16 = [(MBCKManager *)self openCacheWithAccount:v13 accessType:1 error:a7];
  if (v16)
  {
    id v17 = +[MBCKOperationPolicy expensiveCellularPolicy];
    id v18 = [(MBCKManager *)self databaseManager];
    id v19 = +[MBCKOperationTracker operationTrackerWithAccount:v13 databaseManager:v18 policy:v17 error:a7];

    if (!v19)
    {
      unsigned __int8 v39 = 0;
LABEL_38:

      goto LABEL_39;
    }
    id v20 = [v15 processName];
    uint64_t v21 = [v17 operationGroupWithName:@"mergeSnapshots" processName:v20];
    [v19 setCkOperationGroup:v21];

    id v58 = 0;
    unsigned int v22 = +[MBCKAccount fetchAccountWithOperationTracker:v19 cache:v16 error:&v58];
    id v52 = v58;
    if (v22)
    {
      if ([v22 fetchDevicesWithOperationTracker:v19 error:a7])
      {
        char v23 = [v22 deviceForUUID:v12];
        id v51 = v23;
        if (v23)
        {
          SEL v24 = v23;
          if ([v23 fetchSnapshotsWithOperationTracker:v19 error:a7])
          {
            uint64_t v44 = v22;
            uint64_t v45 = v19;
            uint64_t v46 = a7;
            id v47 = v17;
            unsigned int v48 = v16;
            char v49 = v15;
            id v50 = v13;
            uint64_t v25 = +[MBCKSnapshotMergeRequest snapshotMergeRequestForDevice:v24];
            long long v54 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            uint64_t v26 = [v24 snapshots];
            id v27 = [v26 countByEnumeratingWithState:&v54 objects:v59 count:16];
            uint64_t v28 = v53;
            if (!v27) {
              goto LABEL_23;
            }
            id v29 = v27;
            uint64_t v30 = *(void *)v55;
            while (1)
            {
              for (i = 0; i != v29; i = (char *)i + 1)
              {
                if (*(void *)v55 != v30) {
                  objc_enumerationMutation(v26);
                }
                id v32 = *(void **)(*((void *)&v54 + 1) + 8 * i);
                unsigned int v33 = objc_msgSend(v32, "recordIDString", v43);
                if ([v28 indexOfObject:v33] == (id)0x7FFFFFFFFFFFFFFFLL)
                {
                  id v34 = [v32 snapshotID];
                  id v35 = [v28 indexOfObject:v34];

                  BOOL v36 = v35 == (id)0x7FFFFFFFFFFFFFFFLL;
                  uint64_t v28 = v53;
                  if (v36) {
                    continue;
                  }
                }
                else
                {
                }
                id v37 = MBGetDefaultLog();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                {
                  id v38 = [v32 recordIDString];
                  *(_DWORD *)long long buf = 138543362;
                  id v61 = v38;
                  _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Found snapshot to merge: %{public}@", buf, 0xCu);

                  id v43 = [v32 recordIDString];
                  _MBLog();
                }
                [v25 addSnapshotToMerge:v32];
              }
              id v29 = [v26 countByEnumeratingWithState:&v54 objects:v59 count:16];
              if (!v29)
              {
LABEL_23:

                unsigned __int8 v39 = [v25 saveWithOperationTracker:v45 error:v46];
                id v19 = v45;
                id v13 = v50;
                id v16 = v48;
                char v15 = v49;
                id v17 = v47;
                unsigned int v22 = v44;
                goto LABEL_36;
              }
            }
          }
        }
        else
        {
          id v41 = MBGetDefaultLog();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            id v61 = v12;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "No backups for device %@", buf, 0xCu);
            _MBLog();
          }

          if (a7)
          {
            +[MBError errorWithCode:1 format:@"No backups for device"];
            unsigned __int8 v39 = 0;
            *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:

            goto LABEL_37;
          }
        }
        unsigned __int8 v39 = 0;
        goto LABEL_36;
      }
    }
    else
    {
      unsigned int v40 = MBGetDefaultLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v61 = v52;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Failed to fetch account record: %@", buf, 0xCu);
        _MBLog();
      }

      if (a7)
      {
        unsigned __int8 v39 = 0;
        *a7 = v52;
LABEL_37:

        goto LABEL_38;
      }
    }
    unsigned __int8 v39 = 0;
    goto LABEL_37;
  }
  unsigned __int8 v39 = 0;
LABEL_39:

  return v39;
}

- (BOOL)pinSnapshotID:(unint64_t)a3 backupUDID:(id)a4 account:(id)a5 connection:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v13) {
    __assert_rtn("-[MBCKManager pinSnapshotID:backupUDID:account:connection:error:]", "MBCKManager.m", 4469, "serviceAccount");
  }
  char v15 = v14;
  id v16 = [(MBCKManager *)self openCacheWithAccount:v13 accessType:1 error:a7];
  if (v16)
  {
    id v17 = +[MBCKOperationPolicy expensiveCellularPolicy];
    id v18 = [(MBCKManager *)self databaseManager];
    id v19 = +[MBCKOperationTracker operationTrackerWithAccount:v13 databaseManager:v18 policy:v17 error:a7];

    if (!v19)
    {
      unsigned __int8 v29 = 0;
LABEL_33:

      goto LABEL_34;
    }
    id v37 = v15;
    id v20 = [v15 processName];
    uint64_t v21 = [v17 operationGroupWithName:@"pinSnapshot" processName:v20];
    [v19 setCkOperationGroup:v21];

    unsigned int v22 = [(MBCKManager *)self snapshotForSnapshotID:a3 backupUDID:v12 operationTracker:v19 error:a7];
    char v23 = v22;
    if (v22)
    {
      SEL v24 = [v22 snapshotUUID];

      if (v24)
      {
        id v38 = 0;
        uint64_t v25 = +[MBCKAccount fetchAccountWithOperationTracker:v19 cache:v16 error:&v38];
        id v36 = v38;
        if (v25)
        {
          if ([v25 fetchDevicesWithOperationTracker:v19 error:a7])
          {
            uint64_t v26 = [v25 deviceForUUID:v12];
            id v35 = (void *)v26;
            if (v26)
            {
              id v27 = (void *)v26;
              unsigned int v33 = [v23 snapshotUUID];
              uint64_t v28 = +[MBCKSnapshot snapshotForDevice:v27 reason:1 type:0 snapshotFormat:0 snapshotID:v33];

              id v34 = (void *)v28;
              if ([v27 pinSnapshot:v28 error:a7]) {
                unsigned __int8 v29 = [v27 saveWithOperationTracker:v19 error:a7];
              }
              else {
                unsigned __int8 v29 = 0;
              }
              char v15 = v37;
            }
            else
            {
              uint64_t v31 = MBGetDefaultLog();
              char v15 = v37;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412290;
                id v41 = v12;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "No backups for device %@", buf, 0xCu);
                _MBLog();
              }

              if (a7)
              {
                +[MBError errorWithCode:1 format:@"No backups for device"];
                unsigned __int8 v29 = 0;
                *a7 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                unsigned __int8 v29 = 0;
              }
            }
          }
          else
          {
            unsigned __int8 v29 = 0;
            char v15 = v37;
          }
        }
        else
        {
          uint64_t v30 = MBGetDefaultLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            id v41 = v36;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to fetch account record: %@", buf, 0xCu);
            _MBLog();
          }

          char v15 = v37;
          unsigned __int8 v29 = 0;
          if (a7) {
            *a7 = v36;
          }
        }

        goto LABEL_32;
      }
      v39.receiver = self;
      v39.super_class = (Class)MBCKManager;
      unsigned __int8 v29 = [(MBCKManager *)&v39 pinSnapshotID:a3 backupUDID:v12 error:a7];
    }
    else if (a7)
    {
      +[MBError errorWithCode:1 format:@"Invalid snapshot"];
      unsigned __int8 v29 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v29 = 0;
    }
    char v15 = v37;
LABEL_32:

    goto LABEL_33;
  }
  unsigned __int8 v29 = 0;
LABEL_34:

  return v29;
}

- (BOOL)unpinSnapshotID:(unint64_t)a3 backupUDID:(id)a4 account:(id)a5 connection:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v13) {
    __assert_rtn("-[MBCKManager unpinSnapshotID:backupUDID:account:connection:error:]", "MBCKManager.m", 4516, "serviceAccount");
  }
  char v15 = v14;
  id v16 = [(MBCKManager *)self openCacheWithAccount:v13 accessType:1 error:a7];
  if (v16)
  {
    id v17 = +[MBCKOperationPolicy expensiveCellularPolicy];
    id v18 = [(MBCKManager *)self databaseManager];
    id v19 = +[MBCKOperationTracker operationTrackerWithAccount:v13 databaseManager:v18 policy:v17 error:a7];

    if (!v19)
    {
      unsigned __int8 v29 = 0;
LABEL_33:

      goto LABEL_34;
    }
    id v37 = v15;
    id v20 = [v15 processName];
    uint64_t v21 = [v17 operationGroupWithName:@"unpinSnapshot" processName:v20];
    [v19 setCkOperationGroup:v21];

    unsigned int v22 = [(MBCKManager *)self snapshotForSnapshotID:a3 backupUDID:v12 operationTracker:v19 error:a7];
    char v23 = v22;
    if (v22)
    {
      SEL v24 = [v22 snapshotUUID];

      if (v24)
      {
        id v38 = 0;
        uint64_t v25 = +[MBCKAccount fetchAccountWithOperationTracker:v19 cache:v16 error:&v38];
        id v36 = v38;
        if (v25)
        {
          if ([v25 fetchDevicesWithOperationTracker:v19 error:a7])
          {
            uint64_t v26 = [v25 deviceForUUID:v12];
            id v35 = (void *)v26;
            if (v26)
            {
              id v27 = (void *)v26;
              unsigned int v33 = [v23 snapshotUUID];
              uint64_t v28 = +[MBCKSnapshot snapshotForDevice:v27 reason:1 type:0 snapshotFormat:0 snapshotID:v33];

              id v34 = (void *)v28;
              if ([v27 unpinSnapshot:v28 error:a7]) {
                unsigned __int8 v29 = [v27 saveWithOperationTracker:v19 error:a7];
              }
              else {
                unsigned __int8 v29 = 0;
              }
              char v15 = v37;
            }
            else
            {
              uint64_t v31 = MBGetDefaultLog();
              char v15 = v37;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412290;
                id v41 = v12;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "No backups for device %@", buf, 0xCu);
                _MBLog();
              }

              if (a7)
              {
                +[MBError errorWithCode:1 format:@"No backups for device"];
                unsigned __int8 v29 = 0;
                *a7 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                unsigned __int8 v29 = 0;
              }
            }
          }
          else
          {
            unsigned __int8 v29 = 0;
            char v15 = v37;
          }
        }
        else
        {
          uint64_t v30 = MBGetDefaultLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            id v41 = v36;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to fetch account record: %@", buf, 0xCu);
            _MBLog();
          }

          char v15 = v37;
          unsigned __int8 v29 = 0;
          if (a7) {
            *a7 = v36;
          }
        }

        goto LABEL_32;
      }
      v39.receiver = self;
      v39.super_class = (Class)MBCKManager;
      unsigned __int8 v29 = [(MBCKManager *)&v39 unpinSnapshotID:a3 backupUDID:v12 error:a7];
    }
    else if (a7)
    {
      +[MBError errorWithCode:1 format:@"Invalid snapshot"];
      unsigned __int8 v29 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v29 = 0;
    }
    char v15 = v37;
LABEL_32:

    goto LABEL_33;
  }
  unsigned __int8 v29 = 0;
LABEL_34:

  return v29;
}

- (id)journalForBackupUUID:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v11) {
    __assert_rtn("-[MBCKManager journalForBackupUUID:account:connection:error:]", "MBCKManager.m", 4564, "serviceAccount");
  }
  id v13 = v12;
  id v14 = [(MBCKManager *)self openCacheWithAccount:v11 accessType:1 error:a6];
  if (v14)
  {
    char v15 = +[MBCKOperationPolicy expensiveCellularPolicy];
    id v16 = [(MBCKManager *)self databaseManager];
    id v17 = +[MBCKOperationTracker operationTrackerWithAccount:v11 databaseManager:v16 policy:v15 error:a6];

    if (v17)
    {
      id v18 = [v13 processName];
      id v19 = [v15 operationGroupWithName:@"getJournal" processName:v18];
      [v17 setCkOperationGroup:v19];

      id v39 = 0;
      id v20 = +[MBCKAccount fetchAccountWithOperationTracker:v17 cache:v14 error:&v39];
      id v21 = v39;
      unsigned int v22 = v21;
      if (v20)
      {
        if ([v20 fetchDevicesWithOperationTracker:v17 error:a6])
        {
          id v37 = v22;
          uint64_t v23 = [v20 deviceForUUID:v10];
          id v36 = (void *)v23;
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = objc_opt_new();
            uint64_t v26 = +[MBCKJournal journalForDevice:v24 cache:v14 engine:0];
            [v26 fetchFromServerWithOperationTracker:v17 error:a6];
            id v27 = [v26 snapshotActions];

            if (v27)
            {
              uint64_t v28 = [v26 snapshotActions];
            }
            else
            {
              uint64_t v28 = objc_opt_new();
            }
            uint64_t v31 = (void *)v28;
            [v25 setObject:v28 forKeyedSubscript:@"snapshotActions"];

            id v32 = [v26 processedSnapshotActions];

            if (v32)
            {
              uint64_t v33 = [v26 processedSnapshotActions];
            }
            else
            {
              uint64_t v33 = objc_opt_new();
            }
            id v34 = (void *)v33;
            [v25 setObject:v33 forKeyedSubscript:@"processedSnapshotActions"];
          }
          else
          {
            uint64_t v30 = MBGetDefaultLog();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              id v41 = v10;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "No backups for device %@", buf, 0xCu);
              _MBLog();
            }

            if (a6)
            {
              +[MBError errorWithCode:1 format:@"No backups for device"];
              uint64_t v25 = 0;
              *a6 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              uint64_t v25 = 0;
            }
          }
          unsigned int v22 = v37;
        }
        else
        {
          uint64_t v25 = 0;
        }
      }
      else
      {
        id v38 = v21;
        unsigned __int8 v29 = MBGetDefaultLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          id v41 = v38;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to fetch account record: %@", buf, 0xCu);
          _MBLog();
        }

        if (a6)
        {
          unsigned int v22 = v38;
          uint64_t v25 = 0;
          *a6 = v38;
        }
        else
        {
          uint64_t v25 = 0;
          unsigned int v22 = v38;
        }
      }
    }
    else
    {
      uint64_t v25 = 0;
    }
  }
  else
  {
    uint64_t v25 = 0;
  }

  return v25;
}

- (id)journalLastModifiedForBackupUUID:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v11) {
    __assert_rtn("-[MBCKManager journalLastModifiedForBackupUUID:account:connection:error:]", "MBCKManager.m", 4612, "serviceAccount");
  }
  id v13 = v12;
  id v14 = [(MBCKManager *)self openCacheWithAccount:v11 accessType:1 error:a6];
  if (!v14)
  {
    uint64_t v26 = 0;
    goto LABEL_27;
  }
  char v15 = +[MBCKOperationPolicy expensiveCellularPolicy];
  id v16 = [(MBCKManager *)self databaseManager];
  id v17 = +[MBCKOperationTracker operationTrackerWithAccount:v11 databaseManager:v16 policy:v15 error:a6];

  if (v17)
  {
    id v18 = [v13 processName];
    id v19 = [v15 operationGroupWithName:@"getLastModifiedDateFromJournal" processName:v18];
    [v17 setCkOperationGroup:v19];

    id v34 = 0;
    id v20 = +[MBCKAccount fetchAccountWithOperationTracker:v17 cache:v14 error:&v34];
    id v21 = v34;
    if (v20)
    {
      if ([v20 fetchDevicesWithOperationTracker:v17 error:a6])
      {
        uint64_t v22 = [v20 deviceForUUID:v10];
        id v32 = (void *)v22;
        if (v22)
        {
          uint64_t v23 = +[MBCKJournal journalForDevice:v22 cache:v14 engine:0];

          id v33 = 0;
          [v23 fetchFromServerWithOperationTracker:v17 error:&v33];
          id v21 = v33;
          if (!v23)
          {
            uint64_t v24 = MBGetDefaultLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              id v36 = v21;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to fetch journal record: %@", buf, 0xCu);
              id v30 = v21;
              _MBLog();
            }
          }
          objc_msgSend(v23, "recordRepresentation", v30);
          uint64_t v25 = v31 = v23;
          uint64_t v26 = [v25 modificationDate];
        }
        else
        {
          uint64_t v28 = MBGetDefaultLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            id v36 = v10;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "No backups for device %@", buf, 0xCu);
            _MBLog();
          }

          if (a6)
          {
            +[MBError errorWithCode:1 format:@"No backups for device"];
            uint64_t v26 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            uint64_t v26 = 0;
          }
        }

        goto LABEL_25;
      }
    }
    else
    {
      id v27 = MBGetDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v36 = v21;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to fetch account record: %@", buf, 0xCu);
        _MBLog();
      }

      if (a6)
      {
        id v21 = v21;
        uint64_t v26 = 0;
        *a6 = v21;
LABEL_25:

        goto LABEL_26;
      }
    }
    uint64_t v26 = 0;
    goto LABEL_25;
  }
  uint64_t v26 = 0;
LABEL_26:

LABEL_27:
  return v26;
}

- (void)cancelBackgroundRestoreWithAccount:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKManager cancelBackgroundRestoreWithAccount:]", "MBCKManager.m", 4657, "account");
  }
  id v5 = v4;
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 accountIdentifier];
    uint64_t v8 = [v5 persona];
    id v9 = [v8 personaIdentifier];
    *(_DWORD *)long long buf = 138543618;
    id v17 = v7;
    __int16 v18 = 2114;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Canceling background restore for account %{public}@(%{public}@)", buf, 0x16u);

    id v10 = [v5 accountIdentifier];
    id v11 = [v5 persona];
    [v11 personaIdentifier];
    v15 = id v14 = v10;
    _MBLog();
  }
  if (BYSetupAssistantNeedsToRun())
  {
    do
    {
      id v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Can't cancel restore until mini-buddy is done", buf, 2u);
        _MBLog();
      }

      sleep(0xAu);
    }
    while ((BYSetupAssistantNeedsToRun() & 1) != 0);
  }
  id v13 = +[AppRestoreDispatcher shared];
  [v13 cancelAndUninstallRestorerForAccount:v5];

  [(MBCKManager *)self _airTrafficFinishedRestoring];
  [(MBCKManager *)self _finishRestoreWithAccount:v5 cancelled:1];
}

- (void)cancelRestoreEnginesWithReason:(int64_t)a3 connection:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MBCKManager;
  [(MBServiceManager *)&v20 cancelRestoreEnginesWithReason:a3 connection:v6];
  id v7 = [MBServiceAccount alloc];
  uint64_t v8 = +[UMUserPersona currentPersona];
  id v19 = 0;
  id v9 = [(MBServiceAccount *)v7 initWithPersona:v8 error:&v19];
  id v10 = v19;

  if (v9)
  {
    id v11 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v9];
    stateQueue = self->super._stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CA9C8;
    block[3] = &unk_100412AB0;
    id v16 = v11;
    id v17 = v6;
    int64_t v18 = a3;
    id v13 = v11;
    dispatch_block_t v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, block);
    dispatch_async(stateQueue, v14);
  }
  else
  {
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to cancel the restore engines due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }
  }
}

- (void)cancelEnginesWithAccount:(id)a3 connection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)os_transaction_create();
  v16.receiver = self;
  v16.super_class = (Class)MBCKManager;
  [(MBServiceManager *)&v16 cancelEnginesWithAccount:v7 connection:v6];

  id v9 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v7];

  stateQueue = self->super._stateQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000CAC58;
  v13[3] = &unk_1004110B0;
  id v14 = v9;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(stateQueue, v13);
}

- (void)_cancelBackupEngineWithError:(id)a3 account:(id)a4 connection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9) {
    __assert_rtn("-[MBCKManager _cancelBackupEngineWithError:account:connection:]", "MBCKManager.m", 4709, "account");
  }
  id v11 = v10;
  id v12 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v9];
  id v13 = (void *)os_transaction_create();
  stateQueue = self->super._stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CAE8C;
  block[3] = &unk_100412B78;
  id v21 = v12;
  id v22 = v9;
  id v23 = v11;
  id v24 = v8;
  id v25 = v13;
  id v15 = v13;
  id v16 = v8;
  id v17 = v11;
  id v18 = v9;
  id v19 = v12;
  dispatch_async(stateQueue, block);
}

- (void)cancelBackupEngineWithError:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[MBServiceAccount allServiceAccounts];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v12);
        -[MBCKManager _cancelBackupEngineWithError:account:connection:](self, "_cancelBackupEngineWithError:account:connection:", v6, v13, v7, (void)v15);
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)_cancelBackupAndScanEnginesWithTimeout:(unint64_t)a3 completion:(id)a4
{
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0;
  uint64_t v28 = 0;
  unsigned __int8 v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = sub_1000CB480;
  id v32 = sub_1000CB4AC;
  id v33 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_1000CB480;
  uint64_t v26 = sub_1000CB4AC;
  id v27 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CB4B4;
  block[3] = &unk_1004126B8;
  objc_super v20 = &v28;
  id v21 = &v22;
  void block[4] = self;
  id v6 = a4;
  id v19 = v6;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  id v8 = (void *)v23[5];
  v23[5] = (uint64_t)v7;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000CB628;
  v12[3] = &unk_1004126E0;
  id v14 = &v28;
  long long v15 = v34;
  long long v16 = &v22;
  unint64_t v17 = a3;
  v12[4] = self;
  id v13 = v6;
  id v9 = v6;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v12);
  uint64_t v11 = (void *)v29[5];
  v29[5] = (uint64_t)v10;

  dispatch_async((dispatch_queue_t)self->super._stateQueue, (dispatch_block_t)v29[5]);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v34, 8);
}

- (void)_cancelBackupAndScanEnginesWithAccount:(id)a3 timeout:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v8) {
    __assert_rtn("-[MBCKManager _cancelBackupAndScanEnginesWithAccount:timeout:completion:]", "MBCKManager.m", 4820, "account");
  }
  dispatch_block_t v10 = v9;
  [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v8];
  v44[0] = 0;
  v44[1] = v44;
  void v44[2] = 0x2020000000;
  v44[3] = 0;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = sub_1000CB480;
  id v42 = sub_1000CB4AC;
  id v43 = 0;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_1000CB480;
  id v36 = sub_1000CB4AC;
  id v37 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CBD30;
  block[3] = &unk_1004126B8;
  uint64_t v30 = &v38;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v28 = v11;
  uint64_t v31 = &v32;
  id v12 = v10;
  id v29 = v12;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  id v14 = (void *)v33[5];
  v33[5] = (uint64_t)v13;

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000CBDD0;
  v19[3] = &unk_100412708;
  id v25 = &v32;
  unint64_t v26 = a4;
  id v20 = v11;
  id v21 = self;
  id v23 = &v38;
  uint64_t v24 = v44;
  id v22 = v12;
  id v15 = v12;
  id v16 = v11;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v19);
  long long v18 = (void *)v39[5];
  v39[5] = (uint64_t)v17;

  dispatch_async((dispatch_queue_t)self->super._stateQueue, (dispatch_block_t)v39[5]);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v44, 8);
}

- (BOOL)deleteAccountWithServiceAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(MBCKManager *)self databaseManager];
  if (!v7) {
    __assert_rtn("-[MBCKManager deleteAccountWithServiceAccount:error:]", "MBCKManager.m", 4876, "databaseManager");
  }
  id v8 = (void *)v7;
  id v9 = +[MBCKOperationPolicy expensiveCellularPolicy];
  dispatch_block_t v10 = [v9 operationGroupWithName:@"deleteAccount" processName:0];
  if ([v8 resetDatabaseWithAccount:v6 policy:v9 operationGroup:v10 error:a4])
  {
    id v11 = +[MBLockdown connect];
    id v12 = v11;
    if (v11)
    {
      id v19 = 0;
      unsigned __int8 v13 = [v11 removeObjectWithDomain:@"com.apple.mobile.backup" andKey:@"LastCloudBackupDate" withError:&v19];
      id v14 = v19;
      if ((v13 & 1) == 0)
      {
        id v15 = MBGetDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          id v21 = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to remove last backup date from lockdown: %@", buf, 0xCu);
          id v18 = v14;
          _MBLog();
        }
      }
    }
    objc_msgSend(v12, "disconnect", v18);
    BOOL v16 = [(MBCKManager *)self resetCacheWithAccount:v6 error:a4];
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)_syncBackupEnabledWithAccount:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKManager _syncBackupEnabledWithAccount:connection:]", "MBCKManager.m", 4897, "serviceAccount");
  }
  id v8 = v7;
  id v25 = 0;
  id v9 = [(MBCKManager *)self openCacheWithAccount:v6 accessType:2 error:&v25];
  id v10 = v25;
  if (v9)
  {
    id v11 = +[MBCKOperationPolicy expensiveCellularPolicy];
    id v12 = [(MBCKManager *)self databaseManager];
    id v24 = v10;
    unsigned __int8 v13 = +[MBCKOperationTracker operationTrackerWithAccount:v6 databaseManager:v12 policy:v11 error:&v24];
    id v14 = v24;

    if (!v13)
    {
LABEL_15:

      id v10 = v14;
      goto LABEL_16;
    }
    id v15 = [v8 processName];
    BOOL v16 = [v11 operationGroupWithName:@"syncBackupEnabled" processName:v15];
    [v13 setCkOperationGroup:v16];

    id v23 = v14;
    dispatch_block_t v17 = +[MBCKAccount fetchAccountWithOperationTracker:v13 cache:v9 error:&v23];
    id v18 = v23;

    if (v17)
    {
      id v22 = v18;
      unsigned int v19 = [v17 fetchDevicesWithOperationTracker:v13 error:&v22];
      id v14 = v22;

      if (!v19)
      {
LABEL_14:

        goto LABEL_15;
      }
      id v20 = MBDeviceUUID();
      if ([v17 backupsDisabledFromAnotherDeviceForUUID:v20])
      {
        id v21 = MBGetDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Disabling backup because the backup for this device was deleted", buf, 2u);
          _MBLog();
        }

        [(MBCKManager *)self setBackupEnabled:0 account:v6 connection:v8];
      }
    }
    else
    {
      id v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v27 = v18;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to fetch account record: %@", buf, 0xCu);
        _MBLog();
      }
      id v14 = v18;
    }

    goto LABEL_14;
  }
LABEL_16:
}

- (id)allRestrictedDomainNames:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKManager allRestrictedDomainNames:account:]", "MBCKManager.m", 4929, "account");
  }
  id v7 = v6;
  unsigned int v8 = [v6 isManagedAppleID];
  id v9 = objc_opt_new();
  uint64_t v10 = [v5 allRestrictedDomainNames];
  if (v10) {
    [v9 setSet:v10];
  }
  if (v8)
  {
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Managed AppleID - restricting health related domains", buf, 2u);
      _MBLog();
    }

    id v12 = MBGetHealthRelatedDomains();
    [v9 unionSet:v12];
  }
  id v29 = (void *)v10;
  uint64_t v30 = v5;
  unsigned __int8 v13 = +[MBCKRemoteConfiguration sharedInstance];
  id v14 = [v13 valueForKey:@"ServerRestrictedDomains" account:v7];

  id v15 = [v14 componentsSeparatedByString:@"|"];
  id v16 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v15, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v17 = v15;
  id v18 = [v17 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v23 = +[NSCharacterSet whitespaceCharacterSet];
        id v24 = [v22 stringByTrimmingCharactersInSet:v23];
        [v16 addObject:v24];
      }
      id v19 = [v17 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v19);
  }

  if ([v16 count])
  {
    id v25 = MBGetDefaultLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v36 = v16;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Server restricted domains: %@", buf, 0xCu);
      _MBLog();
    }

    [v9 unionSet:v16];
  }

  unint64_t v26 = MBGetDefaultLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v36 = v9;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Restricted domains: %@", buf, 0xCu);
    _MBLog();
  }

  return v9;
}

- (id)disabledDomainInfosForAccount:(id)a3
{
  id v3 = a3;
  id v4 = +[MBAppManager appManager];
  id v5 = [v3 persona];
  id v6 = [v4 allDisabledDomainNamesForPersona:v5];

  id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v14 = objc_alloc((Class)MBDomainInfo);
        id v15 = objc_msgSend(v14, "initWithDomainName:systemApp:remoteSize:localSize:enabled:restricted:", v13, 0, 0, 0, 0, 0, (void)v17);
        [v7 addObject:v15];
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (BOOL)removeDomainName:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10) {
    __assert_rtn("-[MBCKManager removeDomainName:account:connection:error:]", "MBCKManager.m", 4972, "serviceAccount");
  }
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_1000AD5B8;
  unint64_t v26 = sub_1000AD5C8;
  id v27 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CCD38;
  block[3] = &unk_100412730;
  void block[4] = self;
  id v18 = v10;
  id v20 = v11;
  id v21 = &v22;
  id v19 = v9;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_sync(stateQueue, block);
  LOBYTE(stateQueue) = v23[5] == 0;

  _Block_object_dispose(&v22, 8);
  return (char)stateQueue;
}

- (id)reservedBackupSizeListWithAccount:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    __assert_rtn("-[MBCKManager reservedBackupSizeListWithAccount:connection:error:]", "MBCKManager.m", 5006, "serviceAccount");
  }
  id v10 = v9;
  id v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Fetching quota reservations for all devices", buf, 2u);
    _MBLog();
  }

  id v12 = [(MBCKManager *)self openCacheWithAccount:v8 accessType:1 error:a5];
  if (v12)
  {
    id v13 = +[MBCKOperationPolicy expensiveCellularPolicy];
    id v14 = [(MBCKManager *)self databaseManager];
    id v15 = +[MBCKOperationTracker operationTrackerWithAccount:v8 databaseManager:v14 policy:v13 error:a5];

    if (v15)
    {
      id v16 = [v10 processName];
      long long v17 = [v13 operationGroupWithName:@"getPendingSnapshotQuotaReserved" processName:v16];
      [v15 setCkOperationGroup:v17];

      id v18 = +[MBCKAccount fetchAccountWithOperationTracker:v15 cache:v12 error:a5];
      id v19 = v18;
      if (v18 && [v18 fetchDevicesWithOperationTracker:v15 error:a5])
      {
        long long v31 = v13;
        long long v32 = v12;
        long long v33 = v10;
        id v34 = v8;
        id v20 = objc_opt_new();
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v21 = [v19 devicesByUUID];
        id v22 = [v21 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v36;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v36 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void *)(*((void *)&v35 + 1) + 8 * i);
              id v27 = [v19 devicesByUUID];
              id v28 = [v27 objectForKeyedSubscript:v26];

              id v29 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v28 pendingSnapshotQuotaReserved]);
              [v20 setObject:v29 forKeyedSubscript:v26];
            }
            id v23 = [v21 countByEnumeratingWithState:&v35 objects:v40 count:16];
          }
          while (v23);
        }

        id v10 = v33;
        id v8 = v34;
        id v13 = v31;
        id v12 = v32;
      }
      else
      {
        id v20 = 0;
      }
    }
    else
    {
      id v20 = 0;
    }
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (id)pendingSnapshotForCurrentDeviceAndAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Fetching pending snapshot for current device", buf, 2u);
    _MBLog();
  }

  id v8 = objc_opt_new();
  id v9 = [(MBCKManager *)self databaseManager];
  id v10 = +[MBCKOperationTracker operationTrackerWithAccount:v6 databaseManager:v9 policy:v8 error:a4];

  if (!v10)
  {
    id v22 = 0;
    goto LABEL_22;
  }
  id v11 = [(MBCKManager *)self openCacheWithAccount:v6 accessType:1 error:a4];
  if (v11)
  {
    id v12 = +[MBCKAccount fetchAccountWithOperationTracker:v10 cache:v11 error:a4];
    id v13 = v12;
    if (!v12 || ![v12 fetchDevicesWithOperationTracker:v10 error:a4])
    {
      id v22 = 0;
LABEL_20:

      goto LABEL_21;
    }
    uint64_t v14 = MBDeviceUUID();
    id v15 = [v13 devicesByUUID];
    long long v33 = (void *)v14;
    id v16 = [v15 objectForKeyedSubscript:v14];

    if (v16)
    {
      long long v17 = [v16 pendingSnapshotRecordID];

      if (v17)
      {
        id v18 = [v16 pendingSnapshotRecordID];
        long long v32 = +[MBCKSnapshot snapshotIDFromSnapshotRecordID:v18];

        id v31 = objc_alloc((Class)MBSnapshot);
        uint64_t v30 = [v16 deviceUUID];
        id v29 = [v16 pendingSnapshotFormat];
        id v28 = [v16 deviceName];
        uint64_t v26 = [v16 pendingSnapshotBuildVersion];
        id v27 = [v16 pendingSnapshotQuotaReserved];
        id v19 = [v16 pendingSnapshotType];
        id v20 = [v16 pendingSnapshotBackupPolicy];
        id v21 = [v6 persona];
        BYTE4(v25) = 1;
        LODWORD(v25) = 2;
        id v22 = [v31 initWithSnapshotID:0 backupUUID:v30 snapshotUUID:v32 commitID:v32 format:v29 deviceName:v28 date:0 created:0 modified:0 state:v25 isCompatible:@"N/A" systemVersion:v26 buildVersion:v27 quotaReserved:v19 type:v20 backupPolicy:objc_msgSend(v21 accountType:"accountType")];

LABEL_19:
        goto LABEL_20;
      }
      id v23 = MBGetDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v35 = v14;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No pending snapshot found for %@", buf, 0xCu);
        _MBLog();
      }
    }
    else if (a4)
    {
      +[MBError errorWithCode:4, @"No device record found for %@", v14 format];
      id v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    id v22 = 0;
    goto LABEL_19;
  }
  id v22 = 0;
LABEL_21:

LABEL_22:
  return v22;
}

- (BOOL)countCameraRollQuota
{
  v3.receiver = self;
  v3.super_class = (Class)MBCKManager;
  return [(MBServiceManager *)&v3 countCameraRollQuota];
}

- (BOOL)countCameraRollQuotaForBackupUDID:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MBCKManager;
  return [(MBServiceManager *)&v5 countCameraRollQuotaForBackupUDID:a3 error:a4];
}

- (BOOL)discountCameraRollQuotaWithAccount:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    __assert_rtn("-[MBCKManager discountCameraRollQuotaWithAccount:connection:error:]", "MBCKManager.m", 5094, "account");
  }
  id v10 = v9;
  id v11 = MBDeviceUUID();
  BOOL v12 = [(MBCKManager *)self discountCameraRollQuotaForBackupUDID:v11 account:v8 connection:v10 error:a5];

  return v12;
}

- (BOOL)discountCameraRollQuotaForBackupUDID:(id)a3 account:(id)a4 connection:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = +[MBCKOperationPolicy expensiveCellularPolicy];
  uint64_t v14 = [(MBCKManager *)self databaseManager];
  id v15 = +[MBCKOperationTracker operationTrackerWithAccount:v11 databaseManager:v14 policy:v13 error:a6];

  if (v15)
  {
    id v16 = [v12 processName];
    long long v17 = [v13 operationGroupWithName:@"discountCameraRollQuota" processName:v16];
    [v15 setCkOperationGroup:v17];

    BOOL v18 = [(MBCKManager *)self _discountCameraRollQuotaForBackupUDID:v10 account:v11 operationTracker:v15 error:a6];
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)_discountCameraRollQuotaForBackupUDID:(id)a3 account:(id)a4 operationTracker:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v50 = a4;
  id v9 = a5;
  if (!v8) {
    __assert_rtn("-[MBCKManager _discountCameraRollQuotaForBackupUDID:account:operationTracker:error:]", "MBCKManager.m", 5109, "backupUDID");
  }
  id v10 = v9;
  if (!v9) {
    __assert_rtn("-[MBCKManager _discountCameraRollQuotaForBackupUDID:account:operationTracker:error:]", "MBCKManager.m", 5110, "tracker");
  }
  id v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not counting camera roll against iCloud quota, backupUDID:%@", (uint8_t *)&buf, 0xCu);
    id v44 = v8;
    _MBLog();
  }

  id v12 = [(MBCKManager *)self openCacheWithAccount:v50 accessType:1 error:a6];
  if (v12)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v64 = 0x3032000000;
    uint64_t v65 = sub_1000AD5B8;
    id v66 = sub_1000AD5C8;
    id v67 = 0;
    id v13 = +[MBDaemon sharedDaemon];
    [v13 holdWorkAssertion:a2];

    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_1000CE024;
    v57[3] = &unk_100412758;
    uint64_t v14 = (uint64_t)v50;
    p_long long buf = &buf;
    id v58 = (id)v14;
    id v59 = self;
    id v15 = objc_retainBlock(v57);
    id v56 = 0;
    id v16 = +[MBCKAccount fetchAccountWithOperationTracker:v10 cache:v12 error:&v56];
    id v17 = v56;
    BOOL v18 = v17;
    if (v16)
    {
      id v55 = v17;
      unsigned __int8 v19 = [v16 fetchDevicesWithOperationTracker:v10 error:&v55];
      id v20 = v55;

      if (v19)
      {
        id v21 = v8;
        id v22 = MBDeviceUDID_Legacy();
        unsigned int v23 = [v21 isEqualToString:v22];

        if (v23)
        {
          uint64_t v24 = MBDeviceUUID();

          id v21 = (id)v24;
        }
        uint64_t v25 = objc_msgSend(v16, "devicesByUUID", v44);
        uint64_t v46 = [v25 objectForKeyedSubscript:v21];
        uint64_t v45 = v21;

        if (v46)
        {
          uint64_t v26 = [v46 hmacKey];
          id v27 = +[MBCKManifest domainHmac:@"CameraRollDomain" key:v26];

          dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
          uint64_t v14 = +[MBCKEnableCameraRollGraceRequest requestWithDevice:v46 domainHMAC:v27];
          id v29 = [(id)v14 recordRepresentation];
          v51[0] = _NSConcreteStackBlock;
          v51[1] = 3221225472;
          v51[2] = sub_1000CE128;
          v51[3] = &unk_100412780;
          id v53 = &buf;
          uint64_t v30 = v28;
          id v52 = v30;
          [v10 saveRecord:v29 delegate:0 completion:v51];

          MBSemaphoreWaitForever();
          int v31 = 0;
        }
        else
        {
          id v27 = MBDeviceUDID_Legacy();
          v54.receiver = self;
          v54.super_class = (Class)MBCKManager;
          LOBYTE(v14) = [(MBServiceManager *)&v54 discountCameraRollQuotaForBackupUDID:v27 account:v14 connection:0 error:a6];
          int v31 = 1;
        }

        goto LABEL_22;
      }
    }
    else
    {
      id v20 = v17;
    }
    char v32 = ((uint64_t (*)(void *, id))v15[2])(v15, v20);
    LOBYTE(v14) = v32;
    if (a6) {
      char v33 = v32;
    }
    else {
      char v33 = 1;
    }
    if ((v33 & 1) == 0)
    {
      LOBYTE(v14) = 0;
      *a6 = *(id *)(*((void *)&buf + 1) + 40);
    }
    int v31 = 1;
LABEL_22:

    id v34 = +[MBDaemon sharedDaemon];
    [v34 releaseWorkAssertion:a2];

    if (v31)
    {
LABEL_34:
      _Block_object_dispose(&buf, 8);

      goto LABEL_35;
    }
    uint64_t v35 = *(void *)(*((void *)&buf + 1) + 40);
    if (v35)
    {
      long long v36 = MBGetDefaultLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)id v61 = 138412290;
        uint64_t v62 = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to discount camera roll from iCloud quota: %@", v61, 0xCu);
        id v44 = *(id *)(*((void *)&buf + 1) + 40);
        _MBLog();
      }

      if (a6) {
        *a6 = *(id *)(*((void *)&buf + 1) + 40);
      }
    }
    long long v38 = [(MBServiceManager *)self debugContext];
    unsigned int v39 = [v38 isFlagSet:@"SimulateErrorDiscountingCameraRollQuota"];

    if (v39)
    {
      uint64_t v40 = +[MBError errorWithCode:1 format:@"Simulated error discounting camera roll quota"];
      id v41 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v40;

      if (a6) {
        *a6 = *(id *)(*((void *)&buf + 1) + 40);
      }
    }
    else if (!v35)
    {
      id v42 = [v50 persona];
      [v42 setPreferencesValue:0 forKey:@"HasDeferredDiscountingQuota"];
      LOBYTE(v14) = 1;
      goto LABEL_33;
    }
    id v42 = [v50 persona];
    [v42 setPreferencesValue:&__kCFBooleanTrue forKey:@"HasDeferredDiscountingQuota"];
    LOBYTE(v14) = 0;
LABEL_33:

    goto LABEL_34;
  }
  LOBYTE(v14) = 0;
LABEL_35:

  return v14 & 1;
}

- (BOOL)wasBackupEnabledForMegaBackup:(id)a3
{
  char v7 = 0;
  objc_super v3 = [a3 persona];
  unsigned int v4 = [v3 getBooleanValueForKey:@"BackupEnabledForMegaBackup" keyExists:&v7];

  if (v7) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

- (void)_setMegaBackupMode:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSNumber numberWithBool:v3];
    *(_DWORD *)long long buf = 138543362;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_setMegaBackupMode: %{public}@", buf, 0xCu);

    id v10 = +[NSNumber numberWithBool:v3];
    _MBLog();
  }
  char v7 = [(MBServiceManager *)self account];
  id v8 = [v7 persona];

  if (v3) {
    id v9 = &__kCFBooleanTrue;
  }
  else {
    id v9 = 0;
  }
  objc_msgSend(v8, "setPreferencesValue:forKey:", v9, @"IsMegaBackupMode", v10);
  if (!v3)
  {
    [v8 setPreferencesValue:0 forKey:@"IsInitialMegaBackupModeCompleted"];
    [v8 setPreferencesValue:0 forKey:@"MegaBackupModeExpirationDate"];
  }
}

- (BOOL)_isMegaBackupMode
{
  char v7 = 0;
  unsigned __int8 v2 = [(MBServiceManager *)self account];
  BOOL v3 = [v2 persona];
  unsigned int v4 = [v3 getBooleanValueForKey:@"IsMegaBackupMode" keyExists:&v7];

  if (v7) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

- (BOOL)_isInitialMegaBackupCompleted
{
  char v7 = 0;
  unsigned __int8 v2 = [(MBServiceManager *)self account];
  BOOL v3 = [v2 persona];
  unsigned int v4 = [v3 getBooleanValueForKey:@"IsInitialMegaBackupModeCompleted" keyExists:&v7];

  if (v7) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

- (void)_setIsInitialMegaBackupCompleted:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSNumber numberWithBool:v3];
    *(_DWORD *)long long buf = 138543362;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_setIsInitialMegaBackupCompleted: %{public}@", buf, 0xCu);

    id v11 = +[NSNumber numberWithBool:v3];
    _MBLog();
  }
  char v7 = [(MBServiceManager *)self account];
  id v8 = [v7 persona];
  id v9 = v8;
  if (v3) {
    id v10 = &__kCFBooleanTrue;
  }
  else {
    id v10 = 0;
  }
  objc_msgSend(v8, "setPreferencesValue:forKey:", v10, @"IsInitialMegaBackupModeCompleted", v11);
}

- (id)_megaBackupExpirationDate
{
  unsigned __int8 v2 = [(MBServiceManager *)self account];
  BOOL v3 = [v2 persona];
  id v4 = [v3 copyPreferencesValueForKey:@"MegaBackupModeExpirationDate" class:objc_opt_class()];

  return v4;
}

- (void)_setMegaBackupExpirationDate:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "setMegaBackupExpirationDate: %{public}@", buf, 0xCu);
    _MBLog();
  }

  id v9 = [v7 persona];
  [v9 setPreferencesValue:v6 forKey:@"MegaBackupModeExpirationDate"];

  id v10 = [(MBServiceManager *)self prebuddyFollowUpController];
  [v10 setMegaBackupExpirationDate:v6];

  [(MBCKManager *)self updatePrebuddyFollowUp:v7];
}

- (id)_defaultMegaBackupExpirationDate
{
  unsigned __int8 v2 = +[NSDate date];
  BOOL v3 = +[NSCalendar currentCalendar];
  id v4 = [v3 dateByAddingUnit:16 value:21 toDate:v2 options:0];

  BOOL v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Default mega backup expiration date: %{public}@", buf, 0xCu);
    _MBLog();
  }

  return v4;
}

- (void)_updateMegaBackupStatus:(int64_t)a3 account:(id)a4
{
  id v6 = a4;
  if (!a3)
  {
    id v7 = [(MBCKManager *)self _defaultMegaBackupExpirationDate];
    [(MBCKManager *)self _setMegaBackupExpirationDate:v7 account:v6];
  }
  if ([(MBServiceManager *)self isPrebuddyMode])
  {
    id v8 = +[NSUUID UUID];
    id v9 = [v8 UUIDString];

    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218242;
      int64_t v25 = a3;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updating Mega Backup Status (%ld): %@", buf, 0x16u);
      _MBLog();
    }

    id v11 = +[ACAccountStore defaultStore];
    id v12 = [v6 accountIdentifier];
    id v13 = [v11 accountWithIdentifier:v12];

    uint64_t v14 = MBDeviceUUID();
    id v15 = objc_msgSend(v14, "mb_backupIDByAddingCKPrefix");

    id v16 = objc_alloc_init((Class)_ICQMegaBackupManager);
    quotaManagerQueue = self->_quotaManagerQueue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000CEAAC;
    v19[3] = &unk_1004127A8;
    id v20 = v9;
    id v21 = self;
    id v22 = v6;
    int64_t v23 = a3;
    id v18 = v9;
    [v16 updateMegaBackupStatusForAccount:v13 deviceBackupUUID:v15 status:a3 queue:quotaManagerQueue completion:v19];
  }
}

- (void)clearPrebuddyWithAccount:(id)a3 accountSignOut:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBCKManager clearPrebuddyWithAccount:accountSignOut:]", "MBCKManager.m", 5287, "account");
  }
  id v7 = v6;
  [(MBCKManager *)self exitMegaBackupModeWithAccount:v6];
  if (!v4)
  {
    id v8 = dispatch_get_global_queue(9, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CEDFC;
    block[3] = &unk_1004110B0;
    void block[4] = self;
    id v13 = v7;
    dispatch_async(v8, block);
  }
  id v9 = [(MBCKManager *)self prebuddyFollowUpTimer];

  if (v9)
  {
    id v10 = [(MBCKManager *)self prebuddyFollowUpTimer];
    [v10 invalidate];

    [(MBCKManager *)self setPrebuddyFollowUpTimer:0];
  }
  v11.receiver = self;
  v11.super_class = (Class)MBCKManager;
  [(MBServiceManager *)&v11 clearPrebuddyWithAccount:v7 accountSignOut:v4];
}

- (void)exitMegaBackupModeWithAccount:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKManager exitMegaBackupModeWithAccount:]", "MBCKManager.m", 5309, "account");
  }
  BOOL v5 = v4;
  id v6 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v4];
  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    objc_super v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Exiting Mega Backup Mode: %@", buf, 0xCu);
    _MBLog();
  }

  [v6 setInitialMegaBackup:0];
  id v8 = [v5 persona];
  [v8 setPreferencesValue:0 forKey:@"InitialMegaBackupInfo"];

  [(MBCKManager *)self _setIsInitialMegaBackupCompleted:0];
  [(MBCKManager *)self _setMegaBackupMode:0];
  v9.receiver = self;
  v9.super_class = (Class)MBCKManager;
  [(MBServiceManager *)&v9 exitMegaBackupModeWithAccount:v5];
}

- (BOOL)_refreshLockdownLastBackupDateWithAccount:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[MBCKOperationPolicy expensiveCellularPolicy];
  id v6 = [(MBCKManager *)self databaseManager];
  id v32 = 0;
  id v7 = +[MBCKOperationTracker operationTrackerWithAccount:v4 databaseManager:v6 policy:v5 error:&v32];
  id v8 = v32;

  if (v7)
  {
    objc_super v9 = [v5 operationGroupWithName:@"refreshLockdownLastBackupDate" processName:0];
    [v7 setCkOperationGroup:v9];

    id v10 = [MBCKDevice alloc];
    objc_super v11 = MBDeviceUUID();
    id v12 = -[MBCKDevice initWithUUID:cache:backupEnabled:](v10, "initWithUUID:cache:backupEnabled:", v11, 0, [v4 isEnabledForBackup]);

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v36 = 0x3032000000;
    uint64_t v37 = sub_1000AD5B8;
    long long v38 = sub_1000AD5C8;
    id v39 = 0;
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    uint64_t v14 = [(MBCKModel *)v12 recordID];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000CF594;
    v28[3] = &unk_1004127D0;
    id v15 = v12;
    id v29 = v15;
    p_long long buf = &buf;
    id v16 = v13;
    uint64_t v30 = v16;
    [v7 fetchRecordWithID:v14 completion:v28];

    MBSemaphoreWaitForever();
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      BOOL v17 = 0;
    }
    else
    {
      id v18 = [v15 dateOfLastBackup];
      if (v18)
      {
        unsigned __int8 v19 = +[MBLockdown connect];
        if (v19)
        {
          [v18 timeIntervalSinceReferenceDate];
          id v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          id v27 = 0;
          unsigned __int8 v21 = [v19 setObject:v20 forDomain:@"com.apple.mobile.backup" andKey:@"LastCloudBackupDate" withError:&v27];
          __int16 v26 = v27;

          if (v21)
          {
            [v19 disconnect];
            id v22 = MBGetDefaultLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)char v33 = 138412290;
              id v34 = v18;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Successfully refreshed lockdown last backup date key to: %@", v33, 0xCu);
              _MBLog();
            }

            BOOL v17 = 1;
          }
          else
          {
            uint64_t v24 = MBGetDefaultLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)char v33 = 138412290;
              id v34 = v26;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to set lockdown last backup date key: %@", v33, 0xCu);
              _MBLog();
            }

            [v19 disconnect];
            BOOL v17 = 0;
          }
          int64_t v23 = v26;
        }
        else
        {
          int64_t v23 = MBGetDefaultLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)char v33 = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to connect to lockdown to set last backup date key", v33, 2u);
            _MBLog();
          }
          BOOL v17 = 0;
        }
      }
      else
      {
        unsigned __int8 v19 = MBGetDefaultLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)char v33 = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to refresh lockdown last backup date key because of nil date in device record", v33, 2u);
          _MBLog();
        }
        BOOL v17 = 0;
      }
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to refresh last backup date from server: %@", (uint8_t *)&buf, 0xCu);
      _MBLog();
    }
    BOOL v17 = 0;
  }

  return v17;
}

- (void)prebuddyBackupDeletedWithAccount:(id)a3
{
  id v4 = a3;
  [(MBCKManager *)self exitMegaBackupModeWithAccount:v4];
  v5.receiver = self;
  v5.super_class = (Class)MBCKManager;
  [(MBServiceManager *)&v5 prebuddyBackupDeletedWithAccount:v4];
}

- (BOOL)requestMegaBackupExpirationDate:(id)a3 account:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!a5) {
    __assert_rtn("-[MBCKManager requestMegaBackupExpirationDate:account:error:]", "MBCKManager.m", 5379, "error != nil");
  }
  id v10 = v9;
  objc_super v11 = +[ACAccountStore defaultStore];
  id v12 = [v10 altDSID];
  dispatch_semaphore_t v13 = objc_msgSend(v11, "aa_appleAccountWithAltDSID:", v12);

  if (v13)
  {
    uint64_t v14 = MBDeviceUUID();
    id v15 = objc_msgSend(v14, "mb_backupIDByAddingCKPrefix");

    uint64_t v34 = 0;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 0;
    uint64_t v28 = 0;
    id v29 = &v28;
    uint64_t v30 = 0x3032000000;
    int v31 = sub_1000AD5B8;
    id v32 = sub_1000AD5C8;
    id v33 = 0;
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    id v17 = objc_alloc_init((Class)_ICQMegaBackupManager);
    quotaManagerQueue = self->_quotaManagerQueue;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000CFA04;
    v22[3] = &unk_1004127F8;
    __int16 v26 = &v28;
    v22[4] = self;
    id v23 = v10;
    id v27 = &v34;
    id v24 = v8;
    unsigned __int8 v19 = v16;
    int64_t v25 = v19;
    [v17 extendExpirationForAccount:v13 deviceBackupUUID:v15 requestedExpirationDate:v24 queue:quotaManagerQueue completion:v22];
    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    *a5 = (id) v29[5];
    BOOL v20 = *((unsigned char *)v35 + 24) != 0;

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v34, 8);
  }
  else
  {
    +[MBError errorWithCode:1, @"Couldn't get account for service account: %@", v10 format];
    BOOL v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (void)updateMegaBackupExpirationDate:(id)a3 account:(id)a4
{
  if (a3)
  {
    -[MBCKManager _setMegaBackupExpirationDate:account:](self, "_setMegaBackupExpirationDate:account:");
  }
  else
  {
    uint64_t v8 = v4;
    uint64_t v9 = v5;
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Cannot update with a nil mega backup expiration date.", v7, 2u);
      _MBLog();
    }
  }
}

- (void)updatePrebuddyFollowUp:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->super._stateQueue);
  if ([(MBServiceManager *)self isPrebuddyMode]
    && [(MBCKManager *)self _isMegaBackupMode])
  {
    uint64_t v4 = [(MBServiceManager *)self prebuddyFollowUpController];
    uint64_t v5 = [(MBCKManager *)self backupStateInfoForInitialMegaBackup:1 account:v6];
    [v4 updateFollowupWithBackupProgress:v5];
  }
}

- (void)userLanguageDidChange
{
  BOOL v3 = [MBServiceAccount alloc];
  uint64_t v4 = +[UMUserPersona currentPersona];
  id v9 = 0;
  uint64_t v5 = [(MBServiceAccount *)v3 initWithPersona:v4 error:&v9];
  id v6 = v9;

  if (!v5)
  {
    id v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unable to get account to update prebuddy follow up: %@", buf, 0xCu);
      _MBLog();
    }
    goto LABEL_8;
  }
  if (![(MBServiceManager *)self isPrebuddyMode])
  {
    if (!+[MBPrebuddyManager hasPrebuddyFollowUp]) {
      goto LABEL_9;
    }
    uint64_t v8 = [(MBServiceManager *)self prebuddyFollowUpController];
    [v8 reset];

    id v7 = [(MBServiceManager *)self prebuddyFollowUpController];
    [v7 startFollowup:&__NSDictionary0__struct];
LABEL_8:

    goto LABEL_9;
  }
  [(MBCKManager *)self updatePrebuddyFollowUp:v5];
LABEL_9:
}

- (void)_keyBagIsLockingWithAccount:(id)a3
{
  id v5 = a3;
  if (!v5) {
    __assert_rtn("-[MBCKManager _keyBagIsLockingWithAccount:]", "MBCKManager.m", 5457, "account");
  }
  id v6 = v5;
  id v7 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v5];
  uint64_t v8 = (void *)os_transaction_create();
  id v9 = +[MBDaemon sharedDaemon];
  [v9 holdWorkAssertion:a2];

  stateQueue = self->super._stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CFF0C;
  block[3] = &unk_100412AD8;
  id v15 = v7;
  id v16 = v6;
  id v18 = v8;
  SEL v19 = a2;
  id v17 = self;
  id v11 = v8;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(stateQueue, block);
}

- (void)keyBagIsLocking
{
  BOOL v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Keybag is locking", buf, 2u);
    _MBLog();
  }

  uint64_t v4 = +[MBServiceAccount allServiceAccounts];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MBCKManager *)self _keyBagIsLockingWithAccount:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)keybagIsUnlockedWithAccount:(id)a3 completion:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(void))a4;
  if (!v8) {
    __assert_rtn("-[MBCKManager keybagIsUnlockedWithAccount:completion:]", "MBCKManager.m", 5493, "completion");
  }
  long long v9 = v8;
  long long v10 = (void *)os_transaction_create();
  long long v11 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v7];
  long long v12 = [v11 restoreSession];
  id v13 = [v7 persona];
  unsigned int v14 = [v12 isMBSSession];
  unsigned int v15 = [v7 isPrimaryAccount];
  if (v14)
  {
    if ((v15 & 1) == 0) {
      __assert_rtn("-[MBCKManager keybagIsUnlockedWithAccount:completion:]", "MBCKManager.m", 5500, "account.isPrimaryAccount");
    }
    v42.receiver = self;
    v42.super_class = (Class)MBCKManager;
    [(MBServiceManager *)&v42 keyBagIsUnlocked];
    v9[2](v9);
  }
  else
  {
    __int16 v26 = v12;
    if (v12) {
      unsigned int v16 = 0;
    }
    else {
      unsigned int v16 = v15;
    }
    if (v16 == 1)
    {
      v41.receiver = self;
      v41.super_class = (Class)MBCKManager;
      [(MBServiceManager *)&v41 keyBagIsUnlocked];
    }
    id v17 = dispatch_group_create();
    stateQueue = self->super._stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D06A0;
    block[3] = &unk_100411608;
    id v37 = v11;
    id v27 = v11;
    id v19 = v7;
    id v38 = v19;
    id v20 = v13;
    id v39 = v20;
    uint64_t v28 = v10;
    id v21 = v10;
    id v40 = v21;
    dispatch_group_async(v17, stateQueue, block);
    id v22 = +[MBDaemon sharedDaemon];
    [v22 holdWorkAssertion:a2];

    id v23 = dispatch_get_global_queue(17, 0);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000D0804;
    v33[3] = &unk_1004110B0;
    id v24 = v19;
    long long v11 = v27;
    id v34 = v24;
    uint64_t v35 = self;
    dispatch_group_async(v17, v23, v33);

    [v20 setPreferencesValue:&__kCFBooleanFalse forKey:@"NotifyDaemonNextTimeKeyBagIsUnlocked"];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000D0850;
    v29[3] = &unk_100412820;
    int v31 = v9;
    SEL v32 = a2;
    id v25 = v21;
    long long v10 = v28;
    id v30 = v25;
    dispatch_group_notify(v17, v23, v29);

    long long v12 = v26;
  }
}

- (void)keyBagIsUnlocked
{
  BOOL v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Keybag is unlocked", buf, 2u);
    _MBLog();
  }

  uint64_t v4 = +[MBServiceAccount allServiceAccounts];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        buf[0] = 0;
        long long v10 = [v9 persona];
        unsigned int v11 = [v10 getBooleanValueForKey:@"NotifyDaemonNextTimeKeyBagIsUnlocked" keyExists:buf];

        if (buf[0] && v11) {
          [(MBCKManager *)self keybagIsUnlockedWithAccount:v9 completion:&stru_100412840];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)_updateLockdownKeysForAccountState:(id)a3
{
  unsigned __int8 v24 = 0;
  id v3 = a3;
  uint64_t v4 = [v3 persona];
  unsigned int v5 = [v4 getBooleanValueForKey:@"AllowiTunesBackup" keyExists:&v24];

  LODWORD(v4) = v24;
  id v6 = [v3 isEnabled];

  uint64_t v7 = +[MBLockdown connect];
  if (v4 && v5)
  {
    uint64_t v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Clearing cloud backup lockdown key because the iTunes backup pref is set", buf, 2u);
      _MBLog();
    }

    id v6 = 0;
  }
  id v9 = [v7 objectForDomain:@"com.apple.mobile.backup" andKey:@"CloudBackupEnabled"];
  long long v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    CFStringRef v26 = @"CloudBackupEnabled";
    __int16 v27 = 2112;
    id v28 = v9;
    __int16 v29 = 1024;
    int v30 = (int)v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "\"%@\" was %@, setting it to %d", buf, 0x1Cu);
    id v20 = v9;
    uint64_t v21 = v6;
    CFStringRef v19 = @"CloudBackupEnabled";
    _MBLog();
  }

  unsigned int v11 = +[NSNumber numberWithBool:v6];
  id v23 = 0;
  unsigned __int8 v12 = [v7 setObject:v11 forDomain:@"com.apple.mobile.backup" andKey:@"CloudBackupEnabled" withError:&v23];
  long long v13 = (__CFString *)v23;

  if ((v12 & 1) == 0)
  {
    long long v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error setting lockdown cloud backup enabled key: %@", buf, 0xCu);
      CFStringRef v19 = v13;
      _MBLog();
    }
  }
  if ((v6 & 1) == 0)
  {
    long long v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Clearing last backup date from lockdown", buf, 2u);
      _MBLog();
    }

    id v22 = 0;
    unsigned __int8 v16 = [v7 removeObjectWithDomain:@"com.apple.mobile.backup" andKey:@"LastCloudBackupDate" withError:&v22];
    id v17 = (__CFString *)v22;
    if ((v16 & 1) == 0)
    {
      id v18 = MBGetDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        CFStringRef v26 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to remove last backup date from lockdown: %@", buf, 0xCu);
        CFStringRef v19 = v17;
        _MBLog();
      }
    }
  }
  objc_msgSend(v7, "disconnect", v19, v20, v21);
}

- (void)_handleAccountAvailable
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._stateQueue);
  id v3 = (void *)os_transaction_create();
  +[MBServiceAccount allServiceAccounts];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * (void)v8)];
        unsigned int v10 = [v9 serviceState];

        if (v10 == 5)
        {

          if ((atomic_exchange((atomic_uchar *volatile)&self->_pendingAccountAvailableHandler, 1u) & 1) == 0)
          {
            unsigned int v11 = MBGetDefaultLog();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Account became available during background restore - retrying pending downloads if necessary", buf, 2u);
              _MBLog();
            }

            v12[0] = _NSConcreteStackBlock;
            v12[1] = 3221225472;
            v12[2] = sub_1000D1058;
            v12[3] = &unk_100412378;
            v12[4] = self;
            id v13 = v3;
            [(MBCKManager *)self fetchNetworkConnectivityWithBlock:v12];
          }
          goto LABEL_14;
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

LABEL_14:
}

- (void)accountChanged:(id)a3
{
  id v5 = a3;
  id v6 = (void *)os_transaction_create();
  stateQueue = self->super._stateQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000D1184;
  v10[3] = &unk_100412888;
  id v11 = v5;
  unsigned __int8 v12 = self;
  id v13 = v6;
  SEL v14 = a2;
  id v8 = v6;
  id v9 = v5;
  dispatch_sync(stateQueue, v10);
}

- (BOOL)extractItemFromBackupUDID:(id)a3 snapshotID:(unint64_t)a4 domainName:(id)a5 relativePath:(id)a6 toPath:(id)a7 account:(id)a8 connection:(id)a9 error:(id *)a10
{
  if (a10)
  {
    *a10 = +[MBError errorWithCode:1, @"Invalid request", a5, a6, a7, a8 format];
  }
  return 0;
}

- (void)lockManagerDidReleaseLock:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 account];
  if (!v6) {
    __assert_rtn("-[MBCKManager lockManagerDidReleaseLock:]", "MBCKManager.m", 5815, "account");
  }
  uint64_t v7 = (void *)v6;
  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 accountIdentifier];
    unsigned int v10 = [v7 persona];
    id v11 = [v10 personaIdentifier];
    *(_DWORD *)long long buf = 138543618;
    id v23 = v9;
    __int16 v24 = 2114;
    id v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "-lockManagerDidReleaseLock called for account %{public}@(%{public}@)", buf, 0x16u);

    unsigned __int8 v12 = [v7 accountIdentifier];
    id v13 = [v7 persona];
    long long v17 = [v13 personaIdentifier];
    _MBLog();
  }
  stateQueue = self->super._stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D28A8;
  block[3] = &unk_100412888;
  void block[4] = self;
  id v19 = v7;
  id v20 = v5;
  SEL v21 = a2;
  id v15 = v5;
  id v16 = v7;
  dispatch_async(stateQueue, block);
}

- (void)lockManager:(id)a3 failedToReleaseLockWithError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 account];
  if (!v9) {
    __assert_rtn("-[MBCKManager lockManager:failedToReleaseLockWithError:]", "MBCKManager.m", 5835, "account");
  }
  unsigned int v10 = (void *)v9;
  id v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v12 = [v10 accountIdentifier];
    id v13 = [v10 persona];
    SEL v14 = [v13 personaIdentifier];
    *(_DWORD *)long long buf = 138543874;
    CFStringRef v26 = v12;
    __int16 v27 = 2114;
    id v28 = v14;
    __int16 v29 = 2114;
    id v30 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "-lockManager:failedToReleaseLockWithError: called for account %{public}@(%{public}@): %{public}@", buf, 0x20u);

    id v15 = [v10 accountIdentifier];
    id v16 = [v10 persona];
    id v20 = [v16 personaIdentifier];
    _MBLog();
  }
  stateQueue = self->super._stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D2BB8;
  block[3] = &unk_100412888;
  void block[4] = self;
  id v22 = v10;
  id v23 = v7;
  SEL v24 = a2;
  id v18 = v7;
  id v19 = v10;
  dispatch_async(stateQueue, block);
}

- (id)fetchPluginFieldsForLockManger:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKManager fetchPluginFieldsForLockManger:]", "MBCKManager.m", 5855, "lockManager");
  }
  id v5 = v4;
  uint64_t v6 = [v4 account];
  if (!v6) {
    __assert_rtn("-[MBCKManager fetchPluginFieldsForLockManger:]", "MBCKManager.m", 5857, "account");
  }
  id v7 = v6;
  uint64_t v8 = [v6 persona];
  if (!v8) {
    __assert_rtn("-[MBCKManager fetchPluginFieldsForLockManger:]", "MBCKManager.m", 5859, "persona");
  }
  uint64_t v9 = v8;
  unint64_t v84 = v7;
  id v81 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v7];
  id v10 = [v81 finishedAppRestores];
  BOOL v11 = [(MBCKManager *)self airTrafficDidFinishRestore];
  uint64_t v12 = BYSetupAssistantNeedsToRun() ^ 1;
  int64_t v13 = +[MBRestoreCloudFormatPolicy snapshotFormatForCurrentRestore:v9];
  unsigned __int8 v118 = 0;
  id v117 = 0;
  id v83 = (void *)v9;
  LOBYTE(v9) = +[MBRestoreCloudFormatPolicy isRestoringFromFileLists:&v118 persona:v9 error:&v117];
  id v14 = v117;
  if ((v9 & 1) == 0)
  {
    id v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v122 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "Failed to determine if restoring from file lists: %@", buf, 0xCu);
      id v76 = v14;
      _MBLog();
    }
  }
  uint64_t v80 = v14;
  id v104 = objc_alloc((Class)NSMutableDictionary);
  v132[0] = @"appRestoreComplete";
  id v16 = ATClientController_ptr;
  long long v17 = +[NSNumber numberWithBool:v10];
  v133[0] = v17;
  v132[1] = @"atRestoreComplete";
  id v18 = +[NSNumber numberWithBool:v11];
  v133[1] = v18;
  v132[2] = @"setupAssistantFinished";
  id v19 = +[NSNumber numberWithBool:v12];
  v133[2] = v19;
  v132[3] = @"thermalPressureLevel";
  id v20 = [v5 thermalPressureMonitor];
  SEL v21 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v20 thermalPressureLevel]);
  v133[3] = v21;
  v132[4] = @"snapshotUUID";
  id v82 = v5;
  id v22 = [v5 snapshotUUID];
  v133[4] = v22;
  v132[5] = @"snapshotFormat";
  id v23 = +[NSNumber numberWithLongLong:v13];
  v133[5] = v23;
  v132[6] = @"isRestoringWithFileLists";
  SEL v24 = +[NSNumber numberWithBool:v118];
  v133[6] = v24;
  id v25 = +[NSDictionary dictionaryWithObjects:v133 forKeys:v132 count:7];
  id v85 = [v104 initWithDictionary:v25];

  CFStringRef v26 = v84;
  __int16 v27 = v83;
  if ([v84 isPrimaryAccount])
  {
    uint64_t v28 = objc_opt_new();
    __int16 v29 = +[ATSession sessionsWithSessionTypeIdentifier:ATSessionTypeRestore];
    id v30 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v29 count]);
    [v85 setObject:v30 forKeyedSubscript:@"atRestoreSessionsCount"];

    long long v115 = 0u;
    long long v116 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    id obj = v29;
    id v88 = [obj countByEnumeratingWithState:&v113 objects:v131 count:16];
    long long v97 = (void *)v28;
    if (!v88)
    {
      id v90 = 0;
      id v91 = 0;
      id v92 = 0;
      id v93 = 0;
      id v94 = 0;
      id v95 = 0;
      id v96 = 0;
      goto LABEL_64;
    }
    id v90 = 0;
    id v91 = 0;
    id v92 = 0;
    id v93 = 0;
    id v94 = 0;
    id v95 = 0;
    id v96 = 0;
    uint64_t v87 = *(void *)v114;
    while (1)
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v114 != v87) {
          objc_enumerationMutation(obj);
        }
        uint64_t v89 = v31;
        SEL v32 = objc_msgSend(*(id *)(*((void *)&v113 + 1) + 8 * v31), "sessionTasks", v76, v77, v78, v79, v80);
        long long v109 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        id v98 = v32;
        id v100 = [v98 countByEnumeratingWithState:&v109 objects:v130 count:16];
        if (v100)
        {
          uint64_t v99 = *(void *)v110;
          do
          {
            uint64_t v33 = 0;
            do
            {
              if (*(void *)v110 != v99) {
                objc_enumerationMutation(v98);
              }
              uint64_t v103 = v33;
              __int16 v101 = *(void **)(*((void *)&v109 + 1) + 8 * v33);
              id v34 = [v101 recentlyFailedAssets];
              uint64_t v35 = objc_opt_new();
              long long v105 = 0u;
              long long v106 = 0u;
              long long v107 = 0u;
              long long v108 = 0u;
              id v36 = v34;
              id v37 = [v36 countByEnumeratingWithState:&v105 objects:v129 count:16];
              if (v37)
              {
                id v38 = v37;
                uint64_t v39 = *(void *)v106;
                do
                {
                  for (i = 0; i != v38; i = (char *)i + 1)
                  {
                    if (*(void *)v106 != v39) {
                      objc_enumerationMutation(v36);
                    }
                    objc_super v41 = *(void **)(*((void *)&v105 + 1) + 8 * i);
                    objc_super v42 = objc_msgSend(v41, "error", v76);
                    if (v42)
                    {
                      id v43 = MBGetDefaultLog();
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)long long buf = 138412546;
                        id v122 = v41;
                        __int16 v123 = 2112;
                        id v124 = v42;
                        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "ATSessionTask recentlyFailedAsset:%@, error:%@", buf, 0x16u);
                        _MBLog();
                      }

                      id v44 = [v42 domain];
                      id v45 = [v42 code];
                      uint64_t v46 = [v42 localizedDescription];
                      id v47 = +[NSString stringWithFormat:@"%@|%ld|%@", v44, v45, v46];
                      [v35 addObject:v47];
                    }
                  }
                  id v38 = [v36 countByEnumeratingWithState:&v105 objects:v129 count:16];
                }
                while (v38);
              }

              unsigned int v48 = [v101 totalItemCount];
              char v49 = [v101 completedItemCount];
              id v50 = [v101 totalItemCount];
              if (v50 >= [v101 completedItemCount])
              {
                id v56 = (id)(v48 - v49);
              }
              else
              {
                id v51 = MBGetDefaultLog();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                {
                  id v52 = [v101 localizedDescription];
                  id v53 = [v101 completedItemCount];
                  id v54 = [v101 totalItemCount];
                  *(_DWORD *)long long buf = 138412802;
                  id v122 = v52;
                  __int16 v123 = 2048;
                  id v124 = v53;
                  __int16 v125 = 2048;
                  id v126 = v54;
                  _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Pending AirTraffic Restore: %@ completed: %lu > total: %lu [inconsistent]", buf, 0x20u);

                  id v55 = [v101 localizedDescription];
                  id v77 = [v101 completedItemCount];
                  id v78 = [v101 totalItemCount];
                  id v76 = v55;
                  _MBLog();
                }
                id v56 = [v101 totalItemCount];
              }
              if (objc_msgSend(v101, "totalItemCount", v76) && v56)
              {
                long long v57 = [v101 dataClass];
                if ([v57 isEqualToString:@"Book"])
                {
                  id v96 = v56;
                  CFStringRef v58 = @"bookRecentErrors";
LABEL_51:
                  if ([v35 count]) {
                    [v97 setValue:v35 forKey:v58];
                  }
                }
                else
                {
                  if ([v57 isEqualToString:@"Photo"])
                  {
                    id v95 = v56;
                    CFStringRef v58 = @"photoRecentErrors";
                    goto LABEL_51;
                  }
                  if ([v57 isEqualToString:@"Ringtone"])
                  {
                    id v94 = v56;
                    CFStringRef v58 = @"ringtoneRecentErrors";
                    goto LABEL_51;
                  }
                  if ([v57 isEqualToString:@"Media"])
                  {
                    id v93 = v56;
                    CFStringRef v58 = @"mediaRecentErrors";
                    goto LABEL_51;
                  }
                  if ([v57 isEqualToString:@"MessagePart"])
                  {
                    id v92 = v56;
                    CFStringRef v58 = @"messagePartRecentErrors";
                    goto LABEL_51;
                  }
                  if ([v57 isEqualToString:@"VoiceMemo"])
                  {
                    id v91 = v56;
                    CFStringRef v58 = @"voiceMemoRecentErrors";
                    goto LABEL_51;
                  }
                  if ([v57 isEqualToString:@"File"])
                  {
                    id v90 = v56;
                    CFStringRef v58 = @"localFilesRecentErrors";
                    goto LABEL_51;
                  }
                  [v35 count];
                }
              }
              id v59 = MBGetDefaultLog();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
              {
                id v60 = [v101 localizedDescription];
                id v61 = [v101 completedItemCount];
                id v62 = [v101 totalItemCount];
                *(_DWORD *)long long buf = 138413058;
                id v122 = v60;
                __int16 v123 = 2048;
                id v124 = v61;
                __int16 v125 = 2048;
                id v126 = v62;
                __int16 v127 = 2048;
                id v128 = v56;
                _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "Pending AirTraffic Restore: %@ completed: %lu total: %lu remaining: %lu", buf, 0x2Au);

                id v63 = [v101 localizedDescription];
                id v64 = [v101 completedItemCount];
                id v78 = [v101 totalItemCount];
                id v79 = v56;
                id v76 = v63;
                id v77 = v64;
                _MBLog();
              }
              uint64_t v33 = v103 + 1;
            }
            while ((id)(v103 + 1) != v100);
            id v65 = [v98 countByEnumeratingWithState:&v109 objects:v130 count:16];
            id v100 = v65;
          }
          while (v65);
        }

        uint64_t v31 = v89 + 1;
        id v16 = ATClientController_ptr;
      }
      while ((id)(v89 + 1) != v88);
      id v88 = [obj countByEnumeratingWithState:&v113 objects:v131 count:16];
      if (!v88)
      {
LABEL_64:

        v119[0] = @"bookPendingItemCount";
        id v66 = [v16[132] numberWithUnsignedInteger:v96];
        v120[0] = v66;
        v119[1] = @"photoPendingItemCount";
        id v67 = [v16[132] numberWithUnsignedInteger:v95];
        v120[1] = v67;
        v119[2] = @"ringtonePendingItemCount";
        [v16[132] numberWithUnsignedInteger:v94];
        v69 = long long v68 = v16;
        v120[2] = v69;
        v119[3] = @"mediaPendingItemCount";
        long long v70 = [v16[132] numberWithUnsignedInteger:v93];
        v120[3] = v70;
        v119[4] = @"messagePartPendingItemCount";
        long long v71 = [v68[132] numberWithUnsignedInteger:v92];
        v120[4] = v71;
        v119[5] = @"voiceMemoPendingItemCount";
        long long v72 = [v68[132] numberWithUnsignedInteger:v91];
        v120[5] = v72;
        v119[6] = @"localFilesPendingItemCount";
        long long v73 = [v68[132] numberWithUnsignedInteger:v90];
        v120[6] = v73;
        long long v74 = +[NSDictionary dictionaryWithObjects:v120 forKeys:v119 count:7];
        [v85 addEntriesFromDictionary:v74];

        if ([v97 count]) {
          [v85 addEntriesFromDictionary:v97];
        }

        __int16 v27 = v83;
        CFStringRef v26 = v84;
        break;
      }
    }
  }

  return v85;
}

- (BOOL)acquireLockWithBackupUDID:(id)a3 account:(id)a4 owner:(id)a5 timeout:(double)a6 connection:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  if (!v15) {
    __assert_rtn("-[MBCKManager acquireLockWithBackupUDID:account:owner:timeout:connection:error:]", "MBCKManager.m", 5971, "account");
  }
  if (!v14) {
    __assert_rtn("-[MBCKManager acquireLockWithBackupUDID:account:owner:timeout:connection:error:]", "MBCKManager.m", 5972, "backupUDID");
  }
  if (!a8) {
    __assert_rtn("-[MBCKManager acquireLockWithBackupUDID:account:owner:timeout:connection:error:]", "MBCKManager.m", 5973, "error");
  }
  id v18 = v17;
  id v19 = MBGetDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v33 = v14;
    __int16 v34 = 2048;
    double v35 = a6;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Acquiring CK lock for device:%@, timeout:%.3f", buf, 0x16u);
    _MBLog();
  }

  id v20 = +[MBCKOperationPolicy expensiveCellularPolicy];
  SEL v21 = [MBCKLock alloc];
  id v22 = [(MBCKManager *)self databaseManager];
  id v23 = [(MBCKLock *)v21 initWithDeviceUUID:v14 databaseManager:v22];

  [(MBCKLock *)v23 setOwner:v16];
  SEL v24 = [v18 processName];
  id v25 = [v20 operationGroupWithName:@"acquireLock" processName:v24];
  [(MBCKLock *)v23 setCkOperationGroup:v25];

  id v31 = 0;
  unsigned __int8 v26 = [(MBCKLock *)v23 saveLockWithAccount:v15 timeout:&__NSDictionary0__struct pluginFields:&v31 error:a6];
  id v27 = v31;
  uint64_t v28 = MBGetDefaultLog();
  __int16 v29 = v28;
  if (v26)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v33 = v14;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Acquired the CK lock for device:%@", buf, 0xCu);
      _MBLog();
    }
  }
  else
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v33 = v14;
      __int16 v34 = 2112;
      double v35 = *(double *)&v27;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to acquire the CK lock for device:%@: %@", buf, 0x16u);
      _MBLog();
    }

    *a8 = v27;
  }

  return v26;
}

- (BOOL)releaseLockWithBackupUDID:(id)a3 account:(id)a4 owner:(id)a5 connection:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!a7) {
    __assert_rtn("-[MBCKManager releaseLockWithBackupUDID:account:owner:connection:error:]", "MBCKManager.m", 5994, "error");
  }
  if (!v12) {
    __assert_rtn("-[MBCKManager releaseLockWithBackupUDID:account:owner:connection:error:]", "MBCKManager.m", 5995, "backupUDID");
  }
  id v16 = v15;
  id v17 = MBGetDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v31 = v12;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Releasing the CK lock for device:%@", buf, 0xCu);
    _MBLog();
  }

  id v18 = +[MBCKOperationPolicy expensiveCellularPolicy];
  id v19 = [MBCKLock alloc];
  id v20 = [(MBCKManager *)self databaseManager];
  SEL v21 = [(MBCKLock *)v19 initWithDeviceUUID:v12 databaseManager:v20];

  [(MBCKLock *)v21 setOwner:v14];
  id v22 = [v16 processName];
  id v23 = [v18 operationGroupWithName:@"releaseLock" processName:v22];
  [(MBCKLock *)v21 setCkOperationGroup:v23];

  id v29 = 0;
  unsigned __int8 v24 = [(MBCKLock *)v21 clearLockWithAccount:v13 pluginFields:&__NSDictionary0__struct error:&v29];
  id v25 = v29;
  unsigned __int8 v26 = MBGetDefaultLog();
  id v27 = v26;
  if (v24)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v31 = v12;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Released CK lock for device:%@", buf, 0xCu);
      _MBLog();
    }
  }
  else
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v31 = v12;
      __int16 v32 = 2112;
      id v33 = v25;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to release the CK lock for device:%@: %@", buf, 0x16u);
      _MBLog();
    }

    *a7 = v25;
  }

  return v24;
}

- (id)deviceLockInfosWithAccount:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v36 = a4;
  id v37 = v7;
  if (!v7) {
    __assert_rtn("-[MBCKManager deviceLockInfosWithAccount:connection:error:]", "MBCKManager.m", 6016, "serviceAccount");
  }
  if (!a5) {
    __assert_rtn("-[MBCKManager deviceLockInfosWithAccount:connection:error:]", "MBCKManager.m", 6017, "error");
  }
  double v35 = a5;
  id v38 = +[MBCKOperationPolicy expensiveCellularPolicy];
  uint64_t v8 = [(MBCKManager *)self databaseManager];
  id v43 = +[MBCKOperationTracker operationTrackerWithAccount:v7 databaseManager:v8 policy:v38 error:a5];

  if (!v43)
  {
    id v30 = 0;
    goto LABEL_25;
  }
  uint64_t v9 = [v36 processName];
  id v10 = [v38 operationGroupWithName:@"fetchDeviceLocks" processName:v9];
  [v43 setCkOperationGroup:v10];

  uint64_t v63 = 0;
  id v64 = &v63;
  uint64_t v65 = 0x3032000000;
  id v66 = sub_1000AD5B8;
  id v67 = sub_1000AD5C8;
  id v68 = 0;
  id obj = 0;
  __int16 v34 = +[MBCKAccount fetchAccountWithOperationTracker:v43 cache:0 error:&obj];
  objc_storeStrong(&v68, obj);
  if (v34)
  {
    BOOL v11 = (id *)(v64 + 5);
    id v61 = (id)v64[5];
    unsigned __int8 v12 = [v34 fetchDevicesWithOperationTracker:v43 error:&v61];
    objc_storeStrong(v11, v61);
    if (v12)
    {
      id v13 = [v34 devicesByUUID];
      id v14 = [v13 allValues];
      id v40 = v13;
      objc_super v41 = objc_opt_new();
      id v33 = dispatch_group_create();
      dispatch_group_enter(v33);
      uint64_t v57 = 0;
      CFStringRef v58 = &v57;
      uint64_t v59 = 0x2020000000;
      uint64_t v60 = 0;
      id v15 = [v43 startBatchFetch];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v39 = v14;
      id v16 = [v39 countByEnumeratingWithState:&v53 objects:v69 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v54;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v54 != v17) {
              objc_enumerationMutation(v39);
            }
            id v19 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            id v20 = [v19 deviceName];
            SEL v21 = [v19 deviceUUID];
            id v22 = +[MBCKLock recordNameWithDeviceUUID:v21];
            id v23 = objc_alloc((Class)CKRecordID);
            unsigned __int8 v24 = [v43 syncZoneID];
            id v25 = [v23 initWithRecordName:v22 zoneID:v24];

            v47[0] = _NSConcreteStackBlock;
            v47[1] = 3221225472;
            v47[2] = sub_1000D4554;
            v47[3] = &unk_1004128B0;
            void v47[4] = self;
            id v52 = &v57;
            id v48 = v40;
            id v26 = v20;
            id v49 = v26;
            id v27 = v21;
            id v50 = v27;
            id v51 = v41;
            [v15 fetchRecordWithID:v25 completion:v47];
          }
          id v16 = [v39 countByEnumeratingWithState:&v53 objects:v69 count:16];
        }
        while (v16);
      }

      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      void v44[2] = sub_1000D4A84;
      v44[3] = &unk_100410FC8;
      uint64_t v46 = &v63;
      uint64_t v28 = v33;
      id v45 = v28;
      [v43 finishBatchFetch:v15 completion:v44];
      MBGroupWaitForever();
      if (v64[5] && (id v29 = (id)v58[3], v29 != [v39 count]))
      {
        id v30 = 0;
        id *v35 = (id) v64[5];
      }
      else
      {
        id v30 = v41;
      }

      _Block_object_dispose(&v57, 8);
      goto LABEL_24;
    }
    id v31 = (id) v64[5];
    goto LABEL_21;
  }
  if ((+[MBError isError:v64[5] withCode:204] & 1) == 0)
  {
    id v31 = (id) v64[5];
LABEL_21:
    id v30 = 0;
    *a5 = v31;
    goto LABEL_24;
  }
  id v30 = &__NSArray0__struct;
LABEL_24:

  _Block_object_dispose(&v63, 8);
LABEL_25:

  return v30;
}

- (void)_retryAppDataDownloadsWithConnectivity:(id)a3 account:(id)a4
{
  char var4 = a3.var4;
  unsigned int v5 = *(_DWORD *)&a3.var0;
  id v7 = a4;
  uint64_t v8 = 0;
  if ((v5 & 1) == 0)
  {
    if ((v5 & 0x100) == 0 || (var4 & 4) == 0) {
      goto LABEL_9;
    }
    id v15 = 0;
    uint64_t v8 = [(MBCKManager *)self fetchBackgroundRestoreCellularAccessForAccount:v7 error:&v15];
    id v9 = v15;
    if (v9)
    {
      id v10 = MBGetDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        id v17 = v7;
        __int16 v18 = 2112;
        *(void *)id v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error fetching cellular access for account (%@): %@", buf, 0x16u);
        _MBLog();
      }

      goto LABEL_8;
    }
    if (!v8)
    {
LABEL_8:

      goto LABEL_9;
    }
    if ((v5 & 0x10000) != 0 && ([v8 allowsExpensiveNetworkAccess] & 1) == 0)
    {
LABEL_9:
      BOOL v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138413314;
        id v17 = v7;
        __int16 v18 = 1024;
        *(_DWORD *)id v19 = 0;
        *(_WORD *)&void v19[4] = 1024;
        *(_DWORD *)&v19[6] = (v5 >> 8) & 1;
        __int16 v20 = 1024;
        int v21 = HIWORD(v5) & 1;
        __int16 v22 = 2114;
        id v23 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not retrying app downloads for account %@, isOnWiFi:%d, isOnCellular:%d(%d), cellularAccess:%{public}@", buf, 0x28u);
        _MBLog();
      }
      goto LABEL_17;
    }
  }
  if (qword_100482410 != -1) {
    dispatch_once(&qword_100482410, &stru_1004128D0);
  }
  unsigned __int8 v12 = qword_100482408;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D4DDC;
  block[3] = &unk_100411128;
  id v14 = v7;
  dispatch_async(v12, block);
  BOOL v11 = v14;
LABEL_17:
}

- (void)retryAppDataDownloadsWithNetworkConnectivity:(id)a3
{
  unint64_t var4 = a3.var4;
  uint64_t v4 = *(void *)&a3.var0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = +[MBServiceAccount allServiceAccounts];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[MBCKManager _retryAppDataDownloadsWithConnectivity:account:](self, "_retryAppDataDownloadsWithConnectivity:account:", v4, var4, *(void *)(*((void *)&v11 + 1) + 8 * (void)v10));
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_startEngine:(id)a3 delegateContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._stateQueue);
  if (!v7) {
    __assert_rtn("-[MBCKManager _startEngine:delegateContext:]", "MBCKManager.m", 6146, "engine");
  }
  uint64_t v9 = [v7 serviceAccount];
  if (!v9) {
    __assert_rtn("-[MBCKManager _startEngine:delegateContext:]", "MBCKManager.m", 6148, "serviceAccount");
  }
  id v29 = (void *)v9;
  id v10 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v9];
  long long v11 = (objc_class *)objc_opt_class();
  class_getName(v11);
  long long v12 = (void *)os_transaction_create();
  long long v13 = +[MBDaemon sharedDaemon];
  [v13 holdWorkAssertion:a2];

  long long v14 = [v10 engines];
  id v15 = [v14 arrayByAddingObject:v7];
  [v10 setEngines:v15];

  if (v8)
  {
    id v16 = [v10 enginesByContext];
    [v16 setObject:v7 forKey:v8];
  }
  id v17 = [v7 watchdog];
  [v17 resume];

  __int16 v18 = [v7 powerAssertionName];
  if (v18) {
    id v19 = [[MBPowerAssertion alloc] initWithName:v18 timeout:0.0];
  }
  else {
    id v19 = 0;
  }
  [(MBPowerAssertion *)v19 hold];
  unint64_t v20 = __ROR8__((char *)[v7 qualityOfService] - 9, 3);
  if (v20 > 3) {
    intptr_t v21 = 21;
  }
  else {
    intptr_t v21 = qword_1003B34E0[v20];
  }
  __int16 v22 = [v10 serviceGroup];
  id v23 = dispatch_get_global_queue(v21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D5248;
  block[3] = &unk_1004128F8;
  id v31 = v7;
  __int16 v32 = v19;
  id v36 = v12;
  SEL v37 = a2;
  id v33 = self;
  id v34 = v8;
  id v35 = v10;
  id v24 = v12;
  id v25 = v10;
  id v26 = v8;
  id v27 = v19;
  id v28 = v7;
  dispatch_group_async(v22, v23, block);
}

- (BOOL)startDeviceTransferWithTaskType:(int64_t)a3 sessionInfo:(id)a4 connection:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL) {
    __assert_rtn("-[MBCKManager startDeviceTransferWithTaskType:sessionInfo:connection:error:]", "MBCKManager.m", 6187, "taskType == MBDeviceTransferTaskTypeSource || taskType == MBDeviceTransferTaskTypeTarget");
  }
  if (!a6) {
    __assert_rtn("-[MBCKManager startDeviceTransferWithTaskType:sessionInfo:connection:error:]", "MBCKManager.m", 6188, "error");
  }
  long long v12 = v11;
  long long v13 = (void *)os_transaction_create();
  long long v14 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  uint64_t v15 = [v14 userPersonaUniqueString];
  id v16 = (void *)v15;
  if (v14 && v15)
  {
    id v17 = dispatch_group_create();
    *(void *)long long buf = 0;
    id v33 = buf;
    uint64_t v34 = 0x3032000000;
    id v35 = sub_1000AD5B8;
    id v36 = sub_1000AD5C8;
    id v37 = 0;
    dispatch_group_enter(v17);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000D57F0;
    v24[3] = &unk_100412920;
    id v30 = buf;
    __int16 v18 = v17;
    int64_t v31 = a3;
    id v25 = v18;
    id v26 = self;
    id v27 = v10;
    id v28 = v12;
    id v29 = v16;
    [(MBCKManager *)self _cancelBackupAndScanEnginesWithTimeout:300 completion:v24];
    MBGroupWaitForever();
    id v19 = self;
    unint64_t v20 = (void *)*((void *)v33 + 5);
    if (v20)
    {
      *a6 = v20;
      BOOL v21 = *((void *)v33 + 5) == 0;
    }
    else
    {
      BOOL v21 = 1;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    __int16 v22 = MBGetDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to fetch the persona identifier", buf, 2u);
      _MBLog();
    }

    +[MBError errorWithCode:1 format:@"nil persona indentifier"];
    BOOL v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

- (void)_startSourceDeviceTransferWithSessionInfo:(id)a3 connection:(id)a4 personaIdentifier:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._stateQueue);
  if (!v11) {
    __assert_rtn("-[MBCKManager _startSourceDeviceTransferWithSessionInfo:connection:personaIdentifier:completion:]", "MBCKManager.m", 6231, "sessionInfo");
  }
  if (!v12) {
    __assert_rtn("-[MBCKManager _startSourceDeviceTransferWithSessionInfo:connection:personaIdentifier:completion:]", "MBCKManager.m", 6232, "connection");
  }
  if (!v14) {
    __assert_rtn("-[MBCKManager _startSourceDeviceTransferWithSessionInfo:connection:personaIdentifier:completion:]", "MBCKManager.m", 6233, "completion");
  }
  if (!v13) {
    __assert_rtn("-[MBCKManager _startSourceDeviceTransferWithSessionInfo:connection:personaIdentifier:completion:]", "MBCKManager.m", 6234, "personaIdentifier");
  }
  uint64_t v15 = [(MBCKManager *)self delegate];
  if (!v15) {
    __assert_rtn("-[MBCKManager _startSourceDeviceTransferWithSessionInfo:connection:personaIdentifier:completion:]", "MBCKManager.m", 6236, "delegate");
  }
  id v16 = (void *)v15;
  id v17 = [(MBPersonaStateManager *)self->super._personaState personaStateForPersonaID:v13];
  if ([v17 serviceState]) {
    __assert_rtn("-[MBCKManager _startSourceDeviceTransferWithSessionInfo:connection:personaIdentifier:completion:]", "MBCKManager.m", 6239, "personaState.serviceState == kMBServiceManagerStateIdle");
  }
  self->super._serviceState = 3;
  [v17 setServiceState:3];
  __int16 v18 = +[MBDaemon sharedDaemon];
  [v18 holdWorkAssertion:a2];

  id v19 = [[MBSourceDeviceTransferEngine alloc] initWithSessionInfo:v11];
  id v26 = v12;
  [(MBSourceDeviceTransferEngine *)v19 setConnection:v12];
  [(MBSourceDeviceTransferEngine *)v19 setDelegate:v16];
  objc_initWeak(location, v19);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000D5DF0;
  v30[3] = &unk_100412948;
  objc_copyWeak(v32, location);
  v30[4] = self;
  id v20 = v17;
  id v31 = v20;
  v32[1] = (id)a2;
  [(MBSourceDeviceTransferEngine *)v19 setCompletionHandler:v30];
  BOOL v21 = v11;
  [(NSMutableArray *)self->super._engines addObject:v19];
  serviceGroup = self->super._serviceGroup;
  id v23 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D5F5C;
  block[3] = &unk_100412970;
  id v28 = v19;
  id v29 = v14;
  void block[4] = self;
  id v24 = v19;
  id v25 = v14;
  dispatch_group_async(serviceGroup, v23, block);

  objc_destroyWeak(v32);
  objc_destroyWeak(location);
}

- (void)_startTargetDeviceTransferWithSessionInfo:(id)a3 connection:(id)a4 personaIdentifier:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._stateQueue);
  if (!v11) {
    __assert_rtn("-[MBCKManager _startTargetDeviceTransferWithSessionInfo:connection:personaIdentifier:completion:]", "MBCKManager.m", 6269, "sessionInfo");
  }
  if (!v12) {
    __assert_rtn("-[MBCKManager _startTargetDeviceTransferWithSessionInfo:connection:personaIdentifier:completion:]", "MBCKManager.m", 6270, "connection");
  }
  if (!v14) {
    __assert_rtn("-[MBCKManager _startTargetDeviceTransferWithSessionInfo:connection:personaIdentifier:completion:]", "MBCKManager.m", 6271, "completion");
  }
  if (!v13) {
    __assert_rtn("-[MBCKManager _startTargetDeviceTransferWithSessionInfo:connection:personaIdentifier:completion:]", "MBCKManager.m", 6272, "personaIdentifier");
  }
  uint64_t v15 = [(MBCKManager *)self delegate];
  if (!v15) {
    __assert_rtn("-[MBCKManager _startTargetDeviceTransferWithSessionInfo:connection:personaIdentifier:completion:]", "MBCKManager.m", 6274, "delegate");
  }
  id v16 = (void *)v15;
  id v17 = [(MBPersonaStateManager *)self->super._personaState personaStateForPersonaID:v13];
  if ([v17 serviceState]) {
    __assert_rtn("-[MBCKManager _startTargetDeviceTransferWithSessionInfo:connection:personaIdentifier:completion:]", "MBCKManager.m", 6277, "personaState.serviceState == kMBServiceManagerStateIdle");
  }
  self->super._serviceState = 3;
  [v17 setServiceState:3];
  __int16 v18 = +[MBDaemon sharedDaemon];
  [v18 holdWorkAssertion:a2];

  id v19 = [[MBTargetDeviceTransferEngine alloc] initWithSessionInfo:v11];
  id v26 = v12;
  [(MBTargetDeviceTransferEngine *)v19 setConnection:v12];
  [(MBTargetDeviceTransferEngine *)v19 setDelegate:v16];
  objc_initWeak(location, v19);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000D636C;
  v30[3] = &unk_100412948;
  objc_copyWeak(v32, location);
  v30[4] = self;
  id v20 = v17;
  id v31 = v20;
  v32[1] = (id)a2;
  [(MBTargetDeviceTransferEngine *)v19 setCompletionHandler:v30];
  BOOL v21 = v11;
  [(NSMutableArray *)self->super._engines addObject:v19];
  serviceGroup = self->super._serviceGroup;
  id v23 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D64D8;
  block[3] = &unk_100412998;
  void block[4] = self;
  id v28 = v19;
  id v29 = v14;
  id v24 = v14;
  id v25 = v19;
  dispatch_group_async(serviceGroup, v23, block);

  objc_destroyWeak(v32);
  objc_destroyWeak(location);
}

- (BOOL)cancelDeviceTransferWithTaskType:(int64_t)a3 connection:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL) {
    __assert_rtn("-[MBCKManager cancelDeviceTransferWithTaskType:connection:error:]", "MBCKManager.m", 6306, "taskType == MBDeviceTransferTaskTypeSource || taskType == MBDeviceTransferTaskTypeTarget");
  }
  if (!v8) {
    __assert_rtn("-[MBCKManager cancelDeviceTransferWithTaskType:connection:error:]", "MBCKManager.m", 6307, "connection");
  }
  if (!a5) {
    __assert_rtn("-[MBCKManager cancelDeviceTransferWithTaskType:connection:error:]", "MBCKManager.m", 6308, "error");
  }
  stateQueue = self->super._stateQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000D6674;
  v12[3] = &unk_1004110B0;
  v12[4] = self;
  id v13 = v8;
  id v10 = v8;
  dispatch_sync(stateQueue, v12);

  return 1;
}

- (void)cancelDeviceTransferWithConnection:(id)a3
{
  id v8 = 0;
  id v4 = a3;
  [(MBCKManager *)self cancelDeviceTransferWithTaskType:1 connection:v4 error:&v8];
  id v5 = v8;
  id v7 = v5;
  [(MBCKManager *)self cancelDeviceTransferWithTaskType:2 connection:v4 error:&v7];

  id v6 = v7;
}

- (BOOL)resumeDeviceTransferWithTaskType:(int64_t)a3 connection:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL) {
    __assert_rtn("-[MBCKManager resumeDeviceTransferWithTaskType:connection:error:]", "MBCKManager.m", 6335, "taskType == MBDeviceTransferTaskTypeSource || taskType == MBDeviceTransferTaskTypeTarget");
  }
  if (!v8) {
    __assert_rtn("-[MBCKManager resumeDeviceTransferWithTaskType:connection:error:]", "MBCKManager.m", 6336, "connection");
  }
  if (!a5) {
    __assert_rtn("-[MBCKManager resumeDeviceTransferWithTaskType:connection:error:]", "MBCKManager.m", 6337, "error");
  }
  stateQueue = self->super._stateQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000D69B4;
  v12[3] = &unk_1004110B0;
  v12[4] = self;
  id v13 = v8;
  id v10 = v8;
  dispatch_sync(stateQueue, v12);

  return 1;
}

- (id)_findTargetDeviceTransferEngineWithConnection:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBCKManager _findTargetDeviceTransferEngineWithConnection:error:]", "MBCKManager.m", 6358, "connection");
  }
  if (!a4) {
    __assert_rtn("-[MBCKManager _findTargetDeviceTransferEngineWithConnection:error:]", "MBCKManager.m", 6359, "error");
  }
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  __int16 v32 = sub_1000AD5B8;
  id v33 = sub_1000AD5C8;
  id v34 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_1000AD5B8;
  id v27 = sub_1000AD5C8;
  id v28 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D6E98;
  block[3] = &unk_1004129C0;
  void block[4] = self;
  BOOL v21 = &v23;
  id v8 = v6;
  id v20 = v8;
  __int16 v22 = &v29;
  dispatch_sync(stateQueue, block);
  uint64_t v9 = (void *)v30[5];
  if (!v9)
  {
    id v10 = (void *)v24[5];
    if (!v10)
    {
      id v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = v11;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v13 = objc_opt_class();
          *(_DWORD *)long long buf = 138412290;
          uint64_t v36 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to find an %@ instance", buf, 0xCu);
        }

        objc_opt_class();
        _MBLog();
      }

      uint64_t v14 = +[MBError errorWithCode:1, @"Failed to find an %@ instance", objc_opt_class() format];
      uint64_t v15 = (void *)v24[5];
      v24[5] = v14;

      id v10 = (void *)v24[5];
    }
    id v16 = v10;
    *a4 = v16;
    uint64_t v9 = (void *)v30[5];
    if (!v9)
    {
      if (!v16) {
        __assert_rtn("-[MBCKManager _findTargetDeviceTransferEngineWithConnection:error:]", "MBCKManager.m", 6384, "dtEngine || *error");
      }
      uint64_t v9 = 0;
    }
  }
  id v17 = v9;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v17;
}

- (void)startPreflightWithConnection:(id)a3 completion:(id)a4
{
  id v9 = 0;
  id v6 = (void (**)(id, void, id))a4;
  id v7 = [(MBCKManager *)self _findTargetDeviceTransferEngineWithConnection:a3 error:&v9];
  id v8 = v9;
  if (v7) {
    [v7 startPreflightWithCompletion:v6];
  }
  else {
    v6[2](v6, 0, v8);
  }
}

- (void)startKeychainTransferWithConnection:(id)a3 completion:(id)a4
{
  id v9 = 0;
  id v6 = (void (**)(id, id))a4;
  id v7 = [(MBCKManager *)self _findTargetDeviceTransferEngineWithConnection:a3 error:&v9];
  id v8 = v9;
  if (v7) {
    [v7 startKeychainTransferWithCompletion:v6];
  }
  else {
    v6[2](v6, v8);
  }
}

- (void)startKeychainDataTransferWithConnection:(id)a3 completion:(id)a4
{
  id v9 = 0;
  id v6 = (void (**)(id, void, id))a4;
  id v7 = [(MBCKManager *)self _findTargetDeviceTransferEngineWithConnection:a3 error:&v9];
  id v8 = v9;
  if (v7) {
    [v7 startKeychainDataTransferWithCompletion:v6];
  }
  else {
    v6[2](v6, 0, v8);
  }
}

- (void)startKeychainDataImportWithKeychainInfo:(id)a3 connection:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v12 = 0;
  id v9 = (void (**)(id, id))a5;
  id v10 = [(MBCKManager *)self _findTargetDeviceTransferEngineWithConnection:a4 error:&v12];
  id v11 = v12;
  if (v10) {
    [v10 startKeychainDataImportWithKeychainInfo:v8 completion:v9];
  }
  else {
    v9[2](v9, v11);
  }
}

- (void)startDataTransferWithPreflightInfo:(id)a3 connection:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v12 = 0;
  id v9 = (void (**)(id, id))a5;
  id v10 = [(MBCKManager *)self _findTargetDeviceTransferEngineWithConnection:a4 error:&v12];
  id v11 = v12;
  if (v10) {
    [v10 startDataTransferWithPreflightInfo:v8 completion:v9];
  }
  else {
    v9[2](v9, v11);
  }
}

- (BOOL)isEngineInProgressForBundleID:(id)a3 percentComplete:(double)a4
{
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = self->super._engines;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = ((char *)i + 1))
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v12 = [v11 restoringBundleID];
          if (v12 && [v6 isEqualToString:v12])
          {
            id v8 = MBGetDefaultLog();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412546;
              id v19 = v6;
              __int16 v20 = 2048;
              double v21 = a4;
              _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "IX: Restore engine already ongoing for app %@. Progress: %.2f", buf, 0x16u);
              _MBLog();
            }

            LOBYTE(v8) = 1;
            goto LABEL_16;
          }
        }
      }
      id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return (char)v8;
}

- (void)didFinishAppRestoresWithAccount:(id)a3 cancelled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBCKManager didFinishAppRestoresWithAccount:cancelled:]", "MBCKManager.m", 6468, "account");
  }
  id v7 = v6;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->super._stateQueue);
  id v8 = [(MBPersonaStateManager *)self->super._personaState objectForKeyedSubscript:v7];
  stateQueue = self->super._stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D76F8;
  block[3] = &unk_100411128;
  id v12 = v8;
  id v10 = v8;
  dispatch_sync(stateQueue, block);
  atomic_store(1u, (unsigned __int8 *)&self->super._appDataDidFinishRestore);
  [(MBCKManager *)self _finishRestoreWithAccount:v7 cancelled:v4];
}

- (id)_cacheTrackerWithAccount:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKManager _cacheTrackerWithAccount:]", "MBCKManager.m", 6484, "account");
  }
  id v5 = v4;
  uint64_t v6 = [v4 accountIdentifier];
  if (!v6) {
    __assert_rtn("-[MBCKManager _cacheTrackerWithAccount:]", "MBCKManager.m", 6486, "accountIdentifier");
  }
  id v7 = (void *)v6;
  id v8 = [(MBCKManager *)self cacheTrackersByAccountIdentifier];
  objc_sync_enter(v8);
  uint64_t v9 = [(MBCKManager *)self cacheTrackersByAccountIdentifier];
  id v10 = [v9 objectForKeyedSubscript:v7];

  if (!v10)
  {
    id v11 = [v5 persona];
    id v12 = [v11 cacheDirectory];

    id v10 = [[MBCKCacheTracker alloc] initWithCacheDirectory:v12];
    uint64_t v13 = [(MBCKManager *)self cacheTrackersByAccountIdentifier];
    [v13 setObject:v10 forKeyedSubscript:v7];
  }
  objc_sync_exit(v8);

  if (!v10) {
    __assert_rtn("-[MBCKManager _cacheTrackerWithAccount:]", "MBCKManager.m", 6497, "cacheTracker");
  }

  return v10;
}

- (id)openCacheWithAccount:(id)a3 accessType:(int)a4 cached:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  if (!a6) {
    __assert_rtn("-[MBCKManager openCacheWithAccount:accessType:cached:error:]", "MBCKManager.m", 6502, "error");
  }
  id v11 = v10;
  id v12 = [(MBCKManager *)self _cacheTrackerWithAccount:v10];
  uint64_t v13 = [v12 openCacheWithAccessType:v8 cached:v7 error:a6];

  return v13;
}

- (id)openCacheWithAccount:(id)a3 accessType:(int)a4 error:(id *)a5
{
  return [(MBCKManager *)self openCacheWithAccount:a3 accessType:*(void *)&a4 cached:1 error:a5];
}

- (BOOL)resetCacheWithAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    __assert_rtn("-[MBCKManager resetCacheWithAccount:error:]", "MBCKManager.m", 6513, "account");
  }
  BOOL v7 = v6;
  uint64_t v8 = [v6 accountIdentifier];
  if (!v8) {
    __assert_rtn("-[MBCKManager resetCacheWithAccount:error:]", "MBCKManager.m", 6515, "accountIdentifier");
  }
  double v21 = (void *)v8;
  id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  id v10 = [(MBCKManager *)self _cacheTrackerWithAccount:v7];
  id v23 = 0;
  unsigned __int8 v11 = [v10 resetDatabaseForAccount:v7 error:&v23];
  id v12 = v23;
  if ((v11 & 1) == 0)
  {
    [v9 addObject:v12];

    id v12 = 0;
  }
  uint64_t v13 = +[NSFileManager defaultManager];
  long long v14 = [v7 persona];
  long long v15 = [v14 snapshotDatabaseDirectory];
  id v22 = v12;
  unsigned __int8 v16 = objc_msgSend(v13, "mb_moveToTmpDirThenRemoveItemAtPath:error:", v15, &v22);
  id v17 = v22;

  if ((v16 & 1) == 0) {
    [v9 addObject:v17];
  }
  id v18 = [v9 count];
  id v19 = v18;
  if (a4 && v18)
  {
    *a4 = +[MBError errorWithErrors:v9];
  }

  return v19 == 0;
}

- (void)_handleNetworkPathUpdateWithPathType:(int)a3 state:(id)a4
{
  stateQueue = self->super._stateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000D7BA0;
  v5[3] = &unk_100412A88;
  v5[4] = self;
  int v6 = a3;
  $294CB042FB18EDF8FD74FDF4F765ED39 v7 = a4;
  dispatch_async(stateQueue, v5);
}

- (id)_startNetworkPathMonitor
{
  unsigned __int8 v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_networkPathMonitor;
  if (!v3)
  {
    id v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting the network path monitor", (uint8_t *)buf, 2u);
      _MBLog();
    }

    id v5 = (MBNetworkPathMonitor *)objc_opt_new();
    networkPathMonitor = v2->_networkPathMonitor;
    v2->_networkPathMonitor = v5;

    id v3 = v5;
    objc_initWeak(buf, v2);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000D7E88;
    v8[3] = &unk_1004129E8;
    objc_copyWeak(&v9, buf);
    [(MBNetworkPathMonitor *)v2->_networkPathMonitor setNetworkPathUpdateHandler:v8];
    [(MBNetworkPathMonitor *)v2->_networkPathMonitor start];
    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)fetchNetworkConnectivityWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MBCKManager *)self _startNetworkPathMonitor];
  [v5 fetchNetworkConnectivityWithBlock:v4];
}

- ($1C6001547D93A6C6CE4901F2C331F3E5)networkConnectivity
{
  id v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3010000000;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  long long v15 = "";
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000D8048;
  v9[3] = &unk_100412A10;
  unsigned __int8 v11 = &v12;
  id v4 = v3;
  id v10 = v4;
  [(MBCKManager *)self fetchNetworkConnectivityWithBlock:v9];
  MBGroupWaitForever();
  uint64_t v5 = v13[4];
  unint64_t v6 = v13[5];

  _Block_object_dispose(&v12, 8);
  BOOL v7 = v5;
  unint64_t v8 = v6;
  result.unint64_t var4 = v8;
  result.var0 = v7;
  result.var1 = BYTE1(v7);
  result.var2 = BYTE2(v7);
  result.var3 = HIDWORD(v7);
  return result;
}

- (void)setUpXPCEventHandler
{
  objc_initWeak(&location, self);
  id v2 = &_dispatch_main_q;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000D8138;
  v3[3] = &unk_100412A38;
  objc_copyWeak(&v4, &location);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

+ (double)inexpensiveCellularBalance
{
  id v2 = +[_DASScheduler sharedScheduler];
  [v2 balanceForBudgetWithName:@"com.apple.dasd.systemCellular"];
  double v4 = v3 * 20.0;

  return v4;
}

- (BOOL)isBackgroundRestoringAccount:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKManager isBackgroundRestoringAccount:]", "MBCKManager.m", 6640, "account");
  }
  uint64_t v5 = v4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->super._stateQueue);
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  stateQueue = self->super._stateQueue;
  char v15 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D8490;
  block[3] = &unk_100412B00;
  void block[4] = self;
  id v10 = v5;
  unsigned __int8 v11 = &v12;
  id v7 = v5;
  dispatch_sync(stateQueue, block);
  LOBYTE(v5) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v5;
}

- (BOOL)isRestoringAccount:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKManager isRestoringAccount:]", "MBCKManager.m", 6652, "account");
  }
  uint64_t v5 = v4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->super._stateQueue);
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  stateQueue = self->super._stateQueue;
  char v15 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D8614;
  block[3] = &unk_100412B00;
  void block[4] = self;
  id v10 = v5;
  unsigned __int8 v11 = &v12;
  id v7 = v5;
  dispatch_sync(stateQueue, block);
  LOBYTE(v5) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v5;
}

- (BOOL)isBackgroundRestoringAnyAccount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->super._stateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000D8748;
  v5[3] = &unk_100411100;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isIdle
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  stateQueue = self->super._stateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000D892C;
  v5[3] = &unk_100411100;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)restorePlanForAccount:(id)a3 snapshotUUID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->super._stateQueue);
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_1000AD5B8;
  uint64_t v31 = sub_1000AD5C8;
  id v32 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_1000AD5B8;
  uint64_t v25 = sub_1000AD5C8;
  id v26 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D8C1C;
  block[3] = &unk_100412A60;
  void block[4] = self;
  id v11 = v8;
  id v17 = v11;
  id v19 = &v27;
  id v12 = v9;
  id v18 = v12;
  __int16 v20 = &v21;
  dispatch_sync(stateQueue, block);
  if (a5)
  {
    uint64_t v13 = (void *)v22[5];
    if (v13) {
      *a5 = v13;
    }
  }
  id v14 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (BOOL)closeRestorePlanForAccount:(id)a3 snapshotUUID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->super._stateQueue);
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_1000AD5B8;
  uint64_t v25 = sub_1000AD5C8;
  id v26 = 0;
  stateQueue = self->super._stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D8E70;
  block[3] = &unk_100412A60;
  void block[4] = self;
  id v11 = v8;
  id v17 = v11;
  id v19 = &v27;
  id v12 = v9;
  id v18 = v12;
  __int16 v20 = &v21;
  dispatch_sync(stateQueue, block);
  if (a5)
  {
    uint64_t v13 = (void *)v22[5];
    if (v13) {
      *a5 = v13;
    }
  }
  char v14 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (MBCKDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (unint64_t)restoreTelemetryID
{
  return self->_restoreTelemetryID;
}

- (NSDictionary)cachedBackupsByUDID
{
  return self->_cachedBackupsByUDID;
}

- (void)setCachedBackupsByUDID:(id)a3
{
}

- (NSObject)accountObserver
{
  return self->_accountObserver;
}

- (void)setAccountObserver:(id)a3
{
}

- (NSMutableDictionary)cacheTrackersByAccountIdentifier
{
  return self->_cacheTrackersByAccountIdentifier;
}

- (void)setCacheTrackersByAccountIdentifier:(id)a3
{
}

- (MBNetworkPathMonitor)networkPathMonitor
{
  return self->_networkPathMonitor;
}

- (void)setNetworkPathMonitor:(id)a3
{
}

- (MBThermalPressureMonitor)thermalPressureMonitor
{
  return self->_thermalPressureMonitor;
}

- (void)setThermalPressureMonitor:(id)a3
{
}

- (MBXPCActivityTimer)prebuddyFollowUpTimer
{
  return self->_prebuddyFollowUpTimer;
}

- (void)setPrebuddyFollowUpTimer:(id)a3
{
}

- (OS_dispatch_queue)quotaManagerQueue
{
  return self->_quotaManagerQueue;
}

- (void)setQuotaManagerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quotaManagerQueue, 0);
  objc_storeStrong((id *)&self->_prebuddyFollowUpTimer, 0);
  objc_storeStrong((id *)&self->_thermalPressureMonitor, 0);
  objc_storeStrong((id *)&self->_networkPathMonitor, 0);
  objc_storeStrong((id *)&self->_cacheTrackersByAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_accountObserver, 0);
  objc_storeStrong((id *)&self->_cachedBackupsByUDID, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_dryRestoreManager, 0);
}

@end