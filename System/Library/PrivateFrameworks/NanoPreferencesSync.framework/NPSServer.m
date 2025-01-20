@interface NPSServer
+ (BOOL)isManagedConfigurationSettingPermittedForKind:(id)a3 feature:(id)a4;
+ (BOOL)shouldAllowSyncOfItemWithSyncGroups:(id)a3 allowedSyncGroups:(id)a4;
+ (double)maxSendTimeout;
+ (id)managedConfigurationData;
+ (id)managedConfigurationSettings;
+ (id)queueOneIdentifierForFileBackupMsg:(id)a3;
+ (id)queueOneIdentifierForManagedConfigurationMsg:(id)a3;
+ (id)queueOneIdentifierForUserDefaultsBackupMsg:(id)a3;
+ (id)queueOneIdentifierForUserDefaultsMsg:(id)a3;
+ (int64_t)purgeRetryDelay;
+ (void)logManagedConfigurationDictionary:(id)a3;
+ (void)setLaunchNotification:(id)a3 enabled:(BOOL)a4;
+ (void)setLaunchNotificationsEnabled:(BOOL)a3;
- (BOOL)checkActiveDeviceChangedVersion;
- (BOOL)checkIfTinkerLastActiveDateChanged;
- (BOOL)deleteCacheForDomain:(id)a3 isPerGizmo:(BOOL)a4;
- (BOOL)doesCurrentDeviceSupportGroupedTwoWayKeys;
- (BOOL)doesCurrentDeviceSupportNewIDSServiceForSync;
- (BOOL)handlePermittedUserDefaultsMsg:(id)a3 messageData:(id)a4 overwriteNewerTimestamps:(BOOL)a5 backupFile:(id)a6;
- (BOOL)hasPairedDevice;
- (BOOL)hasPerformedInitialSync;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)retryFileBackupRestoreForFilePath:(id)a3;
- (BOOL)writeCache:(id)a3 toDiskForDomain:(id)a4 isPerGizmo:(BOOL)a5;
- (IDSService)idsService;
- (IDSService)idsServiceSyncState;
- (NPProgressTracker)syncProgressTracker;
- (NPSDatabase)database;
- (NPSDeviceRegistry)deviceRegistry;
- (NPSFileBackupManager)fileBackupManager;
- (NPSOSLogStateProvider)dumper;
- (NPSServer)init;
- (NPSSettings)settings;
- (NSDictionary)allowedGroups;
- (NSMutableDictionary)syncSessionProgressDictionary;
- (NSString)currentlyUsedDomain;
- (NSUUID)activeDeviceID;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)mcDebounceSource;
- (OS_dispatch_source)purgeTimer;
- (OS_os_transaction)syncTransaction;
- (PSYServiceSyncSession)activeSyncSession;
- (PSYSyncCoordinator)pairedSyncCoordinatorFirstSync;
- (PSYSyncCoordinator)pairedSyncCoordinatorRemainderSync;
- (id)backupPathForDomain:(id)a3 container:(id)a4;
- (id)cachePathForDomain:(id)a3 isPerGizmo:(BOOL)a4;
- (id)createDirectoryIfNeeded:(id)a3;
- (id)dumpDomain:(id)a3;
- (id)getCachedTimeStampFor:(id)a3 key:(id)a4 usePerGizmoCache:(BOOL)a5;
- (id)newDefaultsMsgWithDomain:(id)a3;
- (id)readCacheFromDiskForDomain:(id)a3 isPerGizmo:(BOOL)a4;
- (id)restoreFileBackupForLocalFileURL:(id)a3 originalFileURL:(id)a4 isInitialSync:(BOOL)a5;
- (id)restoreRemoteFilesFromBackup;
- (id)restoreRemoteSettingsFromBackup;
- (id)sendManagedConfigurationSettings:(id)a3 isInitialSync:(BOOL)a4;
- (id)sendMessageData:(id)a3 messageType:(int)a4 queueOneIdentifier:(id)a5 identifier:(id *)a6 cloudEnabled:(BOOL)a7;
- (id)sendMessageData:(id)a3 messageType:(int)a4 queueOneIdentifier:(id)a5 identifier:(id *)a6 isPairedSyncMessage:(BOOL)a7 cloudEnabled:(BOOL)a8;
- (id)sendSetting:(id)a3 keys:(id)a4 allowedSyncGroups:(id)a5 messageIdentifier:(id *)a6 messageData:(id *)a7 cloudEnabled:(BOOL)a8 backupFile:(id)a9;
- (id)sendSettingsBackupInDomain:(id)a3 keys:(id)a4 container:(id)a5 isInitialSync:(BOOL)a6 backupFile:(id)a7;
- (id)systemBuildVersion;
- (unint64_t)remainingDataToSyncInBytes;
- (unint64_t)totalDataToSyncInBytes;
- (void)_completeActiveSyncSessionWithError:(id)a3;
- (void)_logUserDefaults:(id)a3 idsGuid:(id)a4;
- (void)_logUserDefaultsBackup:(id)a3 idsGuid:(id)a4;
- (void)_resumeIDSMessageProcessingWithDevice:(id)a3;
- (void)_suspendIDSMessageProcessing;
- (void)applyStashedSettingsSyncMessages;
- (void)checkAndUpdateCacheTimestamps;
- (void)dealloc;
- (void)debounceOnWorkerQueueWithblock:(id)a3;
- (void)forceResyncManagedConfigurationIsInitialSync:(BOOL)a3;
- (void)handleAppChangedRestrictions;
- (void)handleFileBackupMessage:(id)a3 resourceURL:(id)a4 backupFile:(id)a5;
- (void)handleFileBackupMessage:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleFullBackupMessage:(id)a3 resourceURL:(id)a4 idsGuid:(id)a5;
- (void)handleManagedConfigurationChangedNotification;
- (void)handleRestoreOfSyncingUserDefaultsMsg:(id)a3 backupFile:(id)a4;
- (void)handleUserDefaultsBackupMsg:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleUserDefaultsBackupMsgData:(id)a3 backupFile:(id)a4 idsGuid:(id)a5;
- (void)handleUserDefaultsMsg:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handleUserDefaultsMsgData:(id)a3 backupFile:(id)a4 idsGuid:(id)a5;
- (void)initCore:(id)a3;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performFirstLaunchIntoNewBuildTasks;
- (void)performFirstUnlockTasks;
- (void)performMigration;
- (void)profileConnectionDidReceiveDefaultsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4;
- (void)registerInitialSyncMessage:(id)a3 ofSize:(unint64_t)a4 orReportInitialSyncFailureWithError:(id)a5;
- (void)registerSyncMessageWithIdentifier:(id)a3 size:(unint64_t)a4;
- (void)resendMessagesForMessageID:(id)a3;
- (void)resetIfActiveDeviceChanged;
- (void)resyncManagedConfigurationIfNeeded;
- (void)resyncManagedConfigurationIfNeededIsInitialSync:(BOOL)a3;
- (void)sendPUDSettingsInDomain:(id)a3 keys:(id)a4 backupFile:(id)a5 allowedGroups:(id)a6;
- (void)sendSettingsInDomain:(id)a3 keys:(id)a4 cloudEnabled:(BOOL)a5 backupFile:(id)a6 allowedGroups:(id)a7;
- (void)sendUserDefaultMsg:(id)a3 forDomain:(id)a4 includedKeys:(id)a5 cloudEnabled:(BOOL)a6 backupFile:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)setActiveDeviceID:(id)a3;
- (void)setActiveSyncSession:(id)a3;
- (void)setAllowedGroups:(id)a3;
- (void)setCurrentlyUsedDomain:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setDeviceRegistry:(id)a3;
- (void)setDumper:(id)a3;
- (void)setHasPerformedInitialSync:(BOOL)a3 updateBuildVersion:(BOOL)a4 withDevice:(id)a5;
- (void)setIdsService:(id)a3;
- (void)setIdsServiceSyncState:(id)a3;
- (void)setMcDebounceSource:(id)a3;
- (void)setPairedSyncCoordinatorFirstSync:(id)a3;
- (void)setPairedSyncCoordinatorRemainderSync:(id)a3;
- (void)setPurgeTimer:(id)a3;
- (void)setRemainingDataToSyncInBytes:(unint64_t)a3;
- (void)setSettings:(id)a3;
- (void)setSyncProgressTracker:(id)a3;
- (void)setSyncTransaction:(id)a3;
- (void)setTotalDataToSyncInBytes:(unint64_t)a3;
- (void)setWorkQueue:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)startPrefsSyncWithGroups:(id)a3 backupWriter:(id)a4 withCompletionHandler:(id)a5;
- (void)syncCompletedWithError:(id)a3 withDevice:(id)a4;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)synchronizeNanoDomain:(id)a3 keys:(id)a4 cloudEnabled:(BOOL)a5;
- (void)synchronizeUserDefaultsDomain:(id)a3 keys:(id)a4 container:(id)a5 appGroupContainer:(id)a6 cloudEnabled:(BOOL)a7;
- (void)updateCacheForDomain:(id)a3 keys:(id)a4 twoWaySyncTimestamp:(id)a5 isPerGizmo:(BOOL)a6;
- (void)usingPrefsFromDomain:(id)a3;
@end

@implementation NPSServer

- (NPSServer)init
{
  v22.receiver = self;
  v22.super_class = (Class)NPSServer;
  v2 = [(NPSServer *)&v22 init];
  if (v2)
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = sub_100006068;
    v20[4] = sub_100006078;
    id v21 = (id)os_transaction_create();
    NPSLoggingDaemonObjectInit();
    v3 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Launching; \"NanoPreferencesSyncDaemon-314\" \"4785\"",
        buf,
        2u);
    }
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.nanoprefsync.workQueue", v4);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingIDSMessages = v2->_pendingIDSMessages;
    v2->_pendingIDSMessages = v7;

    v9 = v2->_workQueue;
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_100006080;
    v16 = &unk_10003CAC8;
    v10 = v2;
    v17 = v10;
    v18 = v20;
    dispatch_async(v9, &v13);
    v11 = +[MCProfileConnection sharedConnection];
    [v11 addObserver:v10];

    _Block_object_dispose(v20, 8);
  }
  return v2;
}

- (void)dealloc
{
  purgeTimer = self->_purgeTimer;
  if (purgeTimer) {
    dispatch_source_cancel(purgeTimer);
  }
  deviceRegistry = self->_deviceRegistry;
  if (deviceRegistry) {
    [(NPSDeviceRegistry *)deviceRegistry removeObserver:self forKeyPath:@"activeDevice"];
  }
  v5.receiver = self;
  v5.super_class = (Class)NPSServer;
  [(NPSServer *)&v5 dealloc];
}

- (void)resetIfActiveDeviceChanged
{
  activeDeviceID = self->_activeDeviceID;
  v4 = [(NPSDeviceRegistry *)self->_deviceRegistry activeDeviceID];

  if (activeDeviceID != v4)
  {
    objc_super v5 = [(NPSDeviceRegistry *)self->_deviceRegistry activeDeviceID];
    v6 = self->_activeDeviceID;
    self->_activeDeviceID = v5;

    fileBackupManager = self->_fileBackupManager;
    self->_fileBackupManager = 0;

    v8 = [(NPSDeviceRegistry *)self->_deviceRegistry activeDeviceID];

    if (v8)
    {
      [(NPSServer *)self performMigration];
    }
  }
}

- (void)initCore:(id)a3
{
  id v4 = a3;
  objc_super v5 = (NPSSettings *)objc_opt_new();
  settings = self->_settings;
  self->_settings = v5;

  [(NPSSettings *)self->_settings loadSettingsBundles];
  v7 = [NPSDatabase alloc];
  v8 = [(NPSDeviceRegistry *)self->_deviceRegistry databasePath];
  v9 = [(NPSDatabase *)v7 initWithPath:v8];
  database = self->_database;
  self->_database = v9;

  [(NPSDeviceRegistry *)self->_deviceRegistry startMonitoringPairingEventsWithQueue:self->_workQueue];
  [(NPSServer *)self resetIfActiveDeviceChanged];
  v11 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.nanoprefsync"];
  xpcListener = self->_xpcListener;
  self->_xpcListener = v11;

  [(NSXPCListener *)self->_xpcListener setDelegate:self];
  v13 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.preferencessync"];
  idsService = self->_idsService;
  self->_idsService = v13;

  v15 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.preferencessync.pairedsync"];
  idsServiceSyncState = self->_idsServiceSyncState;
  self->_idsServiceSyncState = v15;

  [(IDSService *)self->_idsService setProtobufAction:"handleUserDefaultsMsg:service:account:fromID:context:" forIncomingRequestsOfType:0];
  [(IDSService *)self->_idsServiceSyncState setProtobufAction:"handleUserDefaultsMsg:service:account:fromID:context:" forIncomingRequestsOfType:0];
  [(IDSService *)self->_idsService setProtobufAction:"handleFileBackupMessage:service:account:fromID:context:" forIncomingRequestsOfType:3];
  [(IDSService *)self->_idsService setProtobufAction:"handleUserDefaultsBackupMsg:service:account:fromID:context:" forIncomingRequestsOfType:2];
  v17 = +[PSYSyncCoordinator syncCoordinatorWithServiceName:@"com.apple.pairedsync.nanoprefsyncdfirst"];
  pairedSyncCoordinatorFirstSync = self->_pairedSyncCoordinatorFirstSync;
  self->_pairedSyncCoordinatorFirstSync = v17;

  [(PSYSyncCoordinator *)self->_pairedSyncCoordinatorFirstSync setDelegate:self queue:self->_workQueue];
  v19 = +[PSYSyncCoordinator syncCoordinatorWithServiceName:@"com.apple.pairedsync.nanoprefsyncd"];
  pairedSyncCoordinatorRemainderSync = self->_pairedSyncCoordinatorRemainderSync;
  self->_pairedSyncCoordinatorRemainderSync = v19;

  [(PSYSyncCoordinator *)self->_pairedSyncCoordinatorRemainderSync setDelegate:self queue:self->_workQueue];
  [(NSXPCListener *)self->_xpcListener resume];
  self->_processingIDSMessage = 1;
  [(IDSService *)self->_idsService addDelegate:self queue:self->_workQueue];
  [(IDSService *)self->_idsServiceSyncState addDelegate:self queue:self->_workQueue];
  xpc_set_event_stream_handler("com.apple.private.alloy.preferencessync-idswake", (dispatch_queue_t)self->_workQueue, &stru_10003CB08);
  xpc_set_event_stream_handler("com.apple.private.alloy.preferencessync.pairedsync-idswake", (dispatch_queue_t)self->_workQueue, &stru_10003CB28);
  workQueue = self->_workQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000675C;
  handler[3] = &unk_10003CB50;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", workQueue, handler);
  if ([(NPSServer *)self hasPerformedInitialSync])
  {
    objc_super v22 = [(NPSDeviceRegistry *)self->_deviceRegistry activeDevice];
    [(NPSServer *)self setHasPerformedInitialSync:1 updateBuildVersion:0 withDevice:v22];
  }
  [(NPSServer *)self checkIfTinkerLastActiveDateChanged];
  [(NPSServer *)self checkAndUpdateCacheTimestamps];
  deviceRegistry = self->_deviceRegistry;
  if (deviceRegistry) {
    [(NPSDeviceRegistry *)deviceRegistry addObserver:self forKeyPath:@"activeDevice" options:7 context:0];
  }
  dispatch_time_t v24 = dispatch_time(0, 5000000000);
  v25 = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000069E0;
  block[3] = &unk_10003CB78;
  block[4] = self;
  id v28 = v4;
  id v26 = v4;
  dispatch_after(v24, v25, block);
}

- (NPSFileBackupManager)fileBackupManager
{
  [(NPSServer *)self resetIfActiveDeviceChanged];
  fileBackupManager = self->_fileBackupManager;
  if (!fileBackupManager)
  {
    id v4 = [[NPSFileBackupManager alloc] initWithDeviceRegistry:self->_deviceRegistry];
    objc_super v5 = self->_fileBackupManager;
    self->_fileBackupManager = v4;

    fileBackupManager = self->_fileBackupManager;
  }
  return fileBackupManager;
}

- (void)invalidate
{
  [(NPSDatabase *)self->_database invalidate];
  database = self->_database;
  self->_database = 0;
}

- (NSDictionary)allowedGroups
{
  unsigned int v2 = [(NPSDeviceRegistry *)self->_deviceRegistry isAltAccountDevice];
  v3 = &off_10003D3B8;
  if (!v2) {
    v3 = &off_10003D3B0;
  }
  v7 = *v3;
  v8 = &__kCFBooleanTrue;
  id v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  id v5 = [v4 mutableCopy];

  return (NSDictionary *)v5;
}

+ (BOOL)shouldAllowSyncOfItemWithSyncGroups:(id)a3 allowedSyncGroups:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = objc_msgSend(v6, "objectForKeyedSubscript:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        uint64_t v14 = v13;
        if (v13)
        {
          if ([v13 isEqual:&__kCFBooleanFalse])
          {

            goto LABEL_13;
          }
          v10 |= [v14 isEqual:&__kCFBooleanTrue];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_13:
    LOBYTE(v10) = 0;
  }

  return v10 & 1;
}

- (void)performMigration
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = sub_100006068;
  v4[4] = sub_100006078;
  id v5 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100006E18;
  v3[3] = &unk_10003CBA0;
  v3[4] = v4;
  unsigned int v2 = objc_retainBlock(v3);
  ((void (*)(void *, const __CFString *))v2[2])(v2, @"notificationsIndicatorEnabled");
  ((void (*)(void *, const __CFString *))v2[2])(v2, @"customMonogram");

  _Block_object_dispose(v4, 8);
}

- (void)performFirstUnlockTasks
{
  if ((byte_100045728 & 1) == 0)
  {
    int v3 = MKBDeviceUnlockedSinceBoot();
    if (v3 == 1)
    {
      byte_100045728 = 1;
      [(NPSServer *)self applyStashedSettingsSyncMessages];
      [(NPSServer *)self resendMessagesForMessageID:0];
    }
    else
    {
      int v4 = v3;
      id v5 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        v6[0] = 67109120;
        v6[1] = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Failed checking first unlock state (%d)", (uint8_t *)v6, 8u);
      }
    }
  }
}

- (BOOL)hasPerformedInitialSync
{
  BOOL v3 = [(NPSDeviceRegistry *)self->_deviceRegistry isPaired];
  if (v3)
  {
    int v4 = [(NPSDeviceRegistry *)self->_deviceRegistry domainAccessor];
    id v5 = [v4 synchronize];
    unsigned __int8 v6 = [v4 BOOLForKey:kNPSInitialSyncKey];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)hasPairedDevice
{
  return [(NPSDeviceRegistry *)self->_deviceRegistry isPaired];
}

- (void)setHasPerformedInitialSync:(BOOL)a3 updateBuildVersion:(BOOL)a4 withDevice:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if (!v8)
  {
    id v8 = [(NPSDeviceRegistry *)self->_deviceRegistry activeDevice];
  }
  if (![(NPSDeviceRegistry *)self->_deviceRegistry isAltAccountDevice] || v6)
  {
    v12 = (void *)nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = NRDevicePropertyPairingID;
      uint64_t v14 = v12;
      v15 = [v8 valueForProperty:v13];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v52 = v6;
      *(_WORD *)&v52[4] = 1024;
      *(_DWORD *)&v52[6] = v5;
      *(_WORD *)v53 = 2114;
      *(void *)&v53[2] = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "setHasPerformedInitialSync: (%d, %d, %{public}@)", buf, 0x18u);
    }
    if ([(NPSDeviceRegistry *)self->_deviceRegistry isPaired]
      || ([(NPSDeviceRegistry *)self->_deviceRegistry activeDevice],
          long long v16 = objc_claimAutoreleasedReturnValue(),
          [v16 valueForProperty:NRDevicePropertyIsArchived],
          long long v17 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v18 = [v17 BOOLValue],
          v17,
          v16,
          (v18 & 1) != 0))
    {
      long long v19 = [(NPSDeviceRegistry *)self->_deviceRegistry domainAccessor];
      uint64_t v20 = kNPSInitialSyncKey;
      unsigned int v48 = [v19 BOOLForKey:kNPSInitialSyncKey];
      if (v6) {
        [v19 setBool:1 forKey:v20];
      }
      if (v5)
      {
        id v21 = [v8 valueForProperty:NRDevicePropertySystemBuildVersion];
        objc_super v22 = [v19 stringForKey:@"paired-device-build-version"];
        if (([v21 isEqual:v22] & 1) == 0)
        {
          if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_ERROR)) {
            sub_100028990();
          }
          [v19 setObject:v21 forKey:@"paired-device-build-version"];
        }
        v47 = v21;
        v23 = [(NPSServer *)self systemBuildVersion];
        dispatch_time_t v24 = [v19 stringForKey:@"local-device-build-version"];

        if (([v23 isEqual:v24] & 1) == 0)
        {
          if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_ERROR)) {
            sub_100028928();
          }
          [v19 setObject:v23 forKey:@"local-device-build-version"];
        }
        v25 = [(NPSServer *)self deviceRegistry];
        id v26 = [v25 lastActiveDate];

        [v26 timeIntervalSinceReferenceDate];
        unint64_t v28 = (unint64_t)v27;
        id v29 = [v19 integerForKey:@"last-active-date"];
        if (v29 != (id)v28)
        {
          id v30 = v29;
          v46 = v24;
          v31 = nps_daemon_log;
          if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)v52 = v30;
            *(_WORD *)&v52[8] = 2048;
            *(void *)v53 = v28;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "setHasPerformedInitialSync: LastActiveDate being updated from %llu -> %llu", buf, 0x16u);
          }
          v32 = +[NSNumber numberWithUnsignedInteger:v28];
          [v19 setObject:v32 forKey:@"last-active-date"];

          dispatch_time_t v24 = v46;
        }
      }
      id v33 = [v19 synchronize];
      v34 = [NPSSettingAccessor alloc];
      v35 = [v19 domain];
      v36 = [(NPSSettingAccessor *)v34 initWithNanoDomain:v35];

      if (v6) {
        [(NPSSettingAccessor *)v36 setObject:&__kCFBooleanTrue forKey:v20];
      }
      v37 = +[NSSet setWithObject:v20];
      v38 = [(NPSServer *)self allowedGroups];
      id v49 = 0;
      id v50 = 0;
      v39 = [(NPSServer *)self sendSetting:v36 keys:v37 allowedSyncGroups:v38 messageIdentifier:&v50 messageData:&v49 cloudEnabled:0 backupFile:0];
      id v40 = v50;
      id v41 = v49;

      if (v39)
      {
        if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_ERROR)) {
          sub_1000288F4();
        }
      }
      else
      {
        -[NPSServer registerSyncMessageWithIdentifier:size:](self, "registerSyncMessageWithIdentifier:size:", v40, [v41 length]);
      }
      if ([(NPSDeviceRegistry *)self->_deviceRegistry isAltAccountDevice])
      {
        if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_ERROR)) {
          sub_1000288C0();
        }
      }
      else
      {
        NPSHasCompletedInitialSync();
      }
      if (((v48 | !v6) & 1) == 0)
      {
        BOOL v43 = os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_ERROR);
        CFStringRef v44 = (const __CFString *)kNPSInitialSyncCompletionDarwinNotification;
        if (v43) {
          sub_100028858();
        }
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, v44, 0, 0, 0);
      }
    }
    else if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000289F8();
    }
  }
  else if (v8 {
         && ([v8 valueForProperty:NRDevicePropertyIsPaired],
  }
             id v9 = objc_claimAutoreleasedReturnValue(),
             unsigned int v10 = [v9 BOOLValue],
             v9,
             v10))
  {
    uint64_t v11 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "setHasPerformedInitialSync: Alt account device. Force set sync complete.", buf, 2u);
    }
    [(NPSServer *)self setHasPerformedInitialSync:1 updateBuildVersion:v5 withDevice:v8];
  }
  else
  {
    v42 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "setHasPerformedInitialSync: Alt account device. Not paired, not forcing sync complete", buf, 2u);
    }
  }
}

- (void)registerInitialSyncMessage:(id)a3 ofSize:(unint64_t)a4 orReportInitialSyncFailureWithError:(id)a5
{
  if (a5) {
    [(NPSServer *)self syncCompletedWithError:a5 withDevice:0];
  }
  else {
    [(NPSServer *)self registerSyncMessageWithIdentifier:a3 size:a4];
  }
}

- (void)syncCompletedWithError:(id)a3 withDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = [(NPSDeviceRegistry *)self->_deviceRegistry activeDevice];
  }
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_ERROR)) {
    sub_100028A2C();
  }
  [(NPSServer *)self setHasPerformedInitialSync:1 updateBuildVersion:1 withDevice:v7];
  [(NPSServer *)self _completeActiveSyncSessionWithError:v6];
  syncSessionProgressDictionary = self->_syncSessionProgressDictionary;
  self->_syncSessionProgressDictionary = 0;

  syncTransaction = self->_syncTransaction;
  self->_syncTransaction = 0;
}

- (void)_completeActiveSyncSessionWithError:(id)a3
{
  id v4 = a3;
  activeSyncSession = self->_activeSyncSession;
  p_activeSyncSession = &self->_activeSyncSession;
  if (activeSyncSession)
  {
    id v7 = nps_daemon_log;
    if (v4)
    {
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_ERROR)) {
        sub_100028A94();
      }
      [(PSYServiceSyncSession *)*p_activeSyncSession syncDidFailWithError:v4];
    }
    else
    {
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = *p_activeSyncSession;
        int v10 = 138412290;
        uint64_t v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_completeActiveSyncSessionWithError:Reporting successful sync completion to sync session: (%@)", (uint8_t *)&v10, 0xCu);
      }
      [(PSYServiceSyncSession *)*p_activeSyncSession syncDidComplete];
    }
    id v9 = *p_activeSyncSession;
    *p_activeSyncSession = 0;
  }
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  BOOL v5 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MCProfileConnectionObserver received EffectiveSettingsChangedNotification", v6, 2u);
  }
  [(NPSServer *)self handleManagedConfigurationChangedNotification];
}

- (void)profileConnectionDidReceiveDefaultsChangedNotification:(id)a3 userInfo:(id)a4
{
  BOOL v5 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MCProfileConnectionObserver received DefaultsChangedNotification", v6, 2u);
  }
  [(NPSServer *)self handleManagedConfigurationChangedNotification];
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  BOOL v5 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MCProfileConnectionObserver received RestrictionChangedNotification", v6, 2u);
  }
  [(NPSServer *)self handleManagedConfigurationChangedNotification];
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "coordinator: (%@)", buf, 0xCu);
  }
  id v9 = (OS_os_transaction *)os_transaction_create();
  syncTransaction = self->_syncTransaction;
  self->_syncTransaction = v9;

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007B94;
  block[3] = &unk_10003CBF0;
  block[4] = self;
  id v15 = v7;
  id v16 = v6;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(workQueue, block);
}

- (void)registerSyncMessageWithIdentifier:(id)a3 size:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    syncSessionProgressDictionary = self->_syncSessionProgressDictionary;
    if (syncSessionProgressDictionary)
    {
      *(int64x2_t *)&self->_totalDataToSyncInBytes = vaddq_s64(*(int64x2_t *)&self->_totalDataToSyncInBytes, vdupq_n_s64(a4));
      id v9 = v6;
      id v8 = +[NSNumber numberWithUnsignedLongLong:a4];
      [(NSMutableDictionary *)syncSessionProgressDictionary setObject:v8 forKey:v9];

      id v6 = v9;
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a5;
  id v9 = a3;
  int v10 = [v8 objectForKeyedSubscript:NSKeyValueChangeOldKey];
  uint64_t v11 = [v8 objectForKeyedSubscript:NSKeyValueChangeNewKey];

  LODWORD(v8) = [v9 isEqualToString:@"activeDevice"];
  if (!v8) {
    goto LABEL_18;
  }
  if (!v10)
  {
    char isKindOfClass = 0;
    if (v11) {
      goto LABEL_4;
    }
LABEL_6:
    char v13 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!v11) {
    goto LABEL_6;
  }
LABEL_4:
  objc_opt_class();
  char v13 = objc_opt_isKindOfClass();
LABEL_7:
  uint64_t v14 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = "";
    if (isKindOfClass) {
      id v16 = "non-";
    }
    else {
      id v16 = "";
    }
    if (v13) {
      id v15 = "non-";
    }
    *(_DWORD *)buf = 136315394;
    v23 = v16;
    __int16 v24 = 2080;
    v25 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Active device changed: %snil -> %snil", buf, 0x16u);
  }
  if (isKindOfClass & 1 | ((v13 & 1) == 0))
  {
    if (!(v13 & 1 | ((isKindOfClass & 1) == 0)))
    {
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000083EC;
      block[3] = &unk_10003CC40;
      block[4] = self;
      dispatch_async(workQueue, block);
    }
  }
  else
  {
    id v18 = self->_workQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000083E0;
    v20[3] = &unk_10003CC18;
    v20[4] = self;
    id v21 = v11;
    dispatch_async(v18, v20);
  }
LABEL_18:
}

- (void)startPrefsSyncWithGroups:(id)a3 backupWriter:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "startPrefsSyncWithGroups: %{public}@", buf, 0xCu);
  }
  id v12 = (OS_os_transaction *)os_transaction_create();
  syncTransaction = self->_syncTransaction;
  self->_syncTransaction = v12;

  uint64_t v14 = (NSMutableDictionary *)objc_opt_new();
  syncSessionProgressDictionary = self->_syncSessionProgressDictionary;
  self->_syncSessionProgressDictionary = v14;

  self->_totalDataToSyncInBytes = 0;
  self->_remainingDataToSyncInBytes = 0;
  workQueue = self->_workQueue;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100008594;
  v20[3] = &unk_10003CDF8;
  id v21 = v9;
  id v22 = v8;
  v23 = self;
  id v24 = v10;
  id v17 = v10;
  id v18 = v8;
  id v19 = v9;
  dispatch_async(workQueue, v20);
}

- (id)systemBuildVersion
{
  if (qword_100045730 != -1) {
    dispatch_once(&qword_100045730, &stru_10003CE38);
  }
  unsigned int v2 = (void *)qword_100045738;
  return v2;
}

- (void)performFirstLaunchIntoNewBuildTasks
{
  BOOL v3 = (void *)os_transaction_create();
  [(NPSServer *)self forceResyncManagedConfigurationIsInitialSync:1];
  id v4 = objc_opt_new();
  BOOL v5 = objc_opt_new();
  id v6 = [(NPSSettings *)self->_settings syncedUserDefaults];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000A27C;
  v13[3] = &unk_10003CEB0;
  v13[4] = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v13];

  +[NSDate timeIntervalSinceReferenceDate];
  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000A9EC;
  v11[3] = &unk_10003CED8;
  v11[4] = self;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v7;
  [v4 enumerateKeysAndObjectsUsingBlock:v11];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000AA9C;
  v9[3] = &unk_10003CED8;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];
}

- (BOOL)checkIfTinkerLastActiveDateChanged
{
  BOOL v3 = [(NPSServer *)self deviceRegistry];
  unsigned int v4 = [v3 isAltAccountDevice];

  if (!v4) {
    return 0;
  }
  BOOL v5 = [(NPSDeviceRegistry *)self->_deviceRegistry domainAccessor];
  id v6 = [v5 synchronize];
  id v7 = [(NPSServer *)self deviceRegistry];
  id v8 = [v7 lastActiveDate];

  [v8 timeIntervalSinceReferenceDate];
  unint64_t v10 = (unint64_t)v9;
  id v11 = [v5 integerForKey:@"last-active-date"];
  if (v11 == (id)v10)
  {

    return 0;
  }
  id v13 = v11;
  uint64_t v14 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    id v20 = v13;
    __int16 v21 = 2048;
    unint64_t v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "checkIfTinkerLastActiveDateChanged: LastActiveDate changed from %llu -> %llu Tinker watch switch detected", buf, 0x16u);
  }
  [(NPProgressTracker *)self->_syncProgressTracker clearState];
  CFStringRef v17 = @"Tinker";
  id v18 = &__kCFBooleanTrue;
  BOOL v12 = 1;
  id v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  [(NPSServer *)self startPrefsSyncWithGroups:v15 backupWriter:0 withCompletionHandler:0];

  return v12;
}

- (void)checkAndUpdateCacheTimestamps
{
  CFStringRef v3 = (const __CFString *)kNanoPreferencesSyncDomain;
  CFStringRef v4 = kCFPreferencesCurrentUser;
  CFStringRef v5 = kCFPreferencesAnyHost;
  id v6 = (__CFString *)CFPreferencesCopyValue(@"cache-is-valid", kNanoPreferencesSyncDomain, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  id v7 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v66 = "-[NPSServer checkAndUpdateCacheTimestamps]";
    __int16 v67 = 2112;
    CFStringRef v68 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: - value: %@", buf, 0x16u);
  }
  if (!v6 || ([(__CFString *)v6 BOOLValue] & 1) == 0)
  {
    id v8 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v66 = "-[NPSServer checkAndUpdateCacheTimestamps]";
      __int16 v67 = 2112;
      CFStringRef v68 = @"cache-is-valid";
      __int16 v69 = 2112;
      CFStringRef v70 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@ doesn't exist in domain %@ cache is not valid", buf, 0x20u);
    }
    double v9 = +[NSFileManager defaultManager];
    unint64_t v10 = [(NPSDeviceRegistry *)self->_deviceRegistry globalCacheDirectoryPath];
    id v62 = 0;
    id v11 = [v9 contentsOfDirectoryAtPath:v10 error:&v62];
    BOOL v12 = (__CFString *)v62;

    id v13 = nps_daemon_log;
    BOOL v14 = os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        deviceRegistry = self->_deviceRegistry;
        id v16 = v13;
        CFStringRef v17 = [(NPSDeviceRegistry *)deviceRegistry globalCacheDirectoryPath];
        *(_DWORD *)buf = 136315650;
        v66 = "-[NPSServer checkAndUpdateCacheTimestamps]";
        __int16 v67 = 2112;
        CFStringRef v68 = v17;
        __int16 v69 = 2112;
        CFStringRef v70 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: can't open cache dir(%@), assuming there is nothing to update: %@", buf, 0x20u);
      }
    }
    else
    {
      if (v14)
      {
        *(_DWORD *)buf = 136315138;
        v66 = "-[NPSServer checkAndUpdateCacheTimestamps]";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: setting all timestamps to now", buf, 0xCu);
      }
      +[NSDate timeIntervalSinceReferenceDate];
      double v19 = v18;
      unsigned int v48 = [(NPSDeviceRegistry *)self->_deviceRegistry globalCacheDirectoryPath];
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id obj = v11;
      id v49 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
      if (v49)
      {
        id v40 = 0;
        id v41 = v11;
        CFStringRef v42 = kCFPreferencesAnyHost;
        CFStringRef v43 = kCFPreferencesCurrentUser;
        CFStringRef v44 = v3;
        v45 = v6;
        id v20 = 0;
        uint64_t v47 = *(void *)v59;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v59 != v47) {
              objc_enumerationMutation(obj);
            }
            uint64_t v52 = v21;
            uint64_t v22 = *(void *)(*((void *)&v58 + 1) + 8 * v21);
            uint64_t v23 = [v48 stringByAppendingPathComponent:v22];

            id v50 = (void *)v23;
            id v24 = +[NSDictionary dictionaryWithContentsOfFile:v23];
            id v25 = [v24 mutableCopy];

            long long v56 = 0u;
            long long v57 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            id v26 = [v25 allKeys];
            id v27 = [v26 countByEnumeratingWithState:&v54 objects:v63 count:16];
            if (v27)
            {
              id v28 = v27;
              uint64_t v29 = *(void *)v55;
              do
              {
                for (i = 0; i != v28; i = (char *)i + 1)
                {
                  if (*(void *)v55 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  uint64_t v31 = *(void *)(*((void *)&v54 + 1) + 8 * i);
                  v32 = objc_msgSend(v25, "objectForKeyedSubscript:", v31, v40, v41, v42, v43, v44, v45);
                  id v33 = [v32 mutableCopy];

                  v34 = +[NSNumber numberWithDouble:v19];
                  [v33 setObject:v34 forKeyedSubscript:@"timestamp"];

                  [v25 setObject:v33 forKeyedSubscript:v31];
                }
                id v28 = [v26 countByEnumeratingWithState:&v54 objects:v63 count:16];
              }
              while (v28);
            }
            id v20 = v50;

            v35 = +[NSURL fileURLWithPath:v50];
            id v53 = 0;
            [v25 writeToURL:v35 error:&v53];
            v36 = (__CFString *)v53;

            if (v36)
            {
              v37 = (void *)nps_daemon_log;
              if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
              {
                v38 = v37;
                v39 = +[NSURL URLWithString:v50];
                *(_DWORD *)buf = 136315650;
                v66 = "-[NPSServer checkAndUpdateCacheTimestamps]";
                __int16 v67 = 2112;
                CFStringRef v68 = v39;
                __int16 v69 = 2112;
                CFStringRef v70 = v36;
                _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%s: Unable to write to url: %@.  Error: %@", buf, 0x20u);
              }
            }

            uint64_t v21 = v52 + 1;
          }
          while ((id)(v52 + 1) != v49);
          id v49 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
        }
        while (v49);

        CFStringRef v3 = v44;
        id v6 = v45;
        CFStringRef v5 = v42;
        CFStringRef v4 = v43;
        BOOL v12 = v40;
        id v11 = v41;
      }
    }
    CFPreferencesSetValue(@"cache-is-valid", &__kCFBooleanTrue, v3, v4, v5);
  }
}

- (BOOL)checkActiveDeviceChangedVersion
{
  if ([(NPSDeviceRegistry *)self->_deviceRegistry isPaired])
  {
    CFStringRef v3 = [(NPSDeviceRegistry *)self->_deviceRegistry domainAccessor];
    id v4 = [v3 synchronize];
    unsigned int v5 = [(NPSServer *)self hasPerformedInitialSync];
    id v6 = [(NPSServer *)self systemBuildVersion];
    id v7 = [v3 stringForKey:@"local-device-build-version"];
    id v8 = v7;
    if (v7)
    {
      if ([v7 isEqualToString:v6]) {
        goto LABEL_17;
      }
    }
    else if ((v5 & 1) == 0)
    {
      id v15 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v30 = 136315394;
        *(void *)&v30[4] = "-[NPSServer checkActiveDeviceChangedVersion]";
        *(_WORD *)&v30[12] = 2112;
        *(void *)&v30[14] = v6;
        BOOL v12 = "%s: Detected first launch after pairing; Local build version: (%@)";
        id v13 = v15;
        uint32_t v14 = 22;
        goto LABEL_12;
      }
LABEL_13:
      id v16 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v30 = 136315138;
        *(void *)&v30[4] = "-[NPSServer checkActiveDeviceChangedVersion]";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: Doing new build tasks", v30, 0xCu);
      }
      [(NPSServer *)self performFirstLaunchIntoNewBuildTasks];
      CFStringRef v17 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v30 = 136315138;
        *(void *)&v30[4] = "-[NPSServer checkActiveDeviceChangedVersion]";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: New build tasks completed", v30, 0xCu);
      }
LABEL_17:
      if (v5)
      {
        double v18 = [(NPSDeviceRegistry *)self->_deviceRegistry domainAccessor];
        double v19 = [(NPSDeviceRegistry *)self->_deviceRegistry activeDevice];
        id v20 = [v19 valueForProperty:NRDevicePropertySystemBuildVersion];
        id v21 = [v18 synchronize];
        uint64_t v22 = [v18 stringForKey:@"paired-device-build-version"];
        uint64_t v23 = nps_daemon_log;
        if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v30 = 136315650;
          *(void *)&v30[4] = "-[NPSServer checkActiveDeviceChangedVersion]";
          *(_WORD *)&v30[12] = 2112;
          *(void *)&v30[14] = v22;
          *(_WORD *)&v30[22] = 2112;
          uint64_t v31 = v20;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: lastRegisteredPairedDeviceBuildVersion: (%@); pairedDeviceBuildVersion: (%@)",
            v30,
            0x20u);
        }
        if (!v22
          || (unsigned int v24 = [v22 isEqualToString:v20], !v8)
          || !v24
          || ([v8 isEqualToString:v6] & 1) == 0)
        {
          id v27 = nps_daemon_log;
          if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id v30 = 136315138;
            *(void *)&v30[4] = "-[NPSServer checkActiveDeviceChangedVersion]";
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s: Doing a sync because of a build version change", v30, 0xCu);
          }
          [(NPProgressTracker *)self->_syncProgressTracker clearState];
          id v28 = [(NPSServer *)self allowedGroups];
          [(NPSServer *)self startPrefsSyncWithGroups:v28 backupWriter:0 withCompletionHandler:0];

          BOOL v10 = 1;
          goto LABEL_34;
        }
        id v25 = nps_daemon_log;
        if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v30 = 136315138;
          *(void *)&v30[4] = "-[NPSServer checkActiveDeviceChangedVersion]";
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s: No build version change detected.", v30, 0xCu);
        }
      }
      else
      {
        id v26 = nps_daemon_log;
        if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v30 = 136315138;
          *(void *)&v30[4] = "-[NPSServer checkActiveDeviceChangedVersion]";
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s: Skipping Paired Device Version change check. Has not performed initial sync yet.", v30, 0xCu);
        }
        [(NPSServer *)self setHasPerformedInitialSync:0 updateBuildVersion:1 withDevice:0];
      }
      BOOL v10 = 0;
LABEL_34:

      return v10;
    }
    id v11 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v30 = 136315650;
      *(void *)&v30[4] = "-[NPSServer checkActiveDeviceChangedVersion]";
      *(_WORD *)&v30[12] = 2112;
      *(void *)&v30[14] = v6;
      *(_WORD *)&v30[22] = 2112;
      uint64_t v31 = v8;
      BOOL v12 = "%s: Detected local device update; Current build version: (%@); Previous: (%@)";
      id v13 = v11;
      uint32_t v14 = 32;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, v30, v14);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  double v9 = nps_daemon_log;
  BOOL v10 = 0;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v30 = 136315138;
    *(void *)&v30[4] = "-[NPSServer checkActiveDeviceChangedVersion]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Skipping Paired Device Version change check. Not paired.", v30, 0xCu);
    return 0;
  }
  return v10;
}

+ (double)maxSendTimeout
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFStringRef v2 = (const __CFString *)kNanoPreferencesSyncDomain;
  CFPreferencesAppSynchronize(kNanoPreferencesSyncDomain);
  double result = (double)CFPreferencesGetAppIntegerValue(@"MessageSendTimeout", v2, &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return IDSMaxMessageTimeout;
  }
  return result;
}

+ (int64_t)purgeRetryDelay
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFStringRef v2 = (const __CFString *)kNanoPreferencesSyncDomain;
  CFPreferencesAppSynchronize(kNanoPreferencesSyncDomain);
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"PurgeRetryDelay", v2, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    return 1000000000 * AppIntegerValue;
  }
  else {
    return 300000000000;
  }
}

- (id)sendMessageData:(id)a3 messageType:(int)a4 queueOneIdentifier:(id)a5 identifier:(id *)a6 cloudEnabled:(BOOL)a7
{
  return [(NPSServer *)self sendMessageData:a3 messageType:*(void *)&a4 queueOneIdentifier:a5 identifier:a6 isPairedSyncMessage:0 cloudEnabled:a7];
}

- (BOOL)doesCurrentDeviceSupportNewIDSServiceForSync
{
  CFStringRef v2 = [(NPSDeviceRegistry *)self->_deviceRegistry activeDevice];
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"36A0EB23-E045-4E99-9D71-8FB9A853ADA7"];
  unsigned __int8 v4 = [v2 supportsCapability:v3];

  return v4;
}

- (id)sendMessageData:(id)a3 messageType:(int)a4 queueOneIdentifier:(id)a5 identifier:(id *)a6 isPairedSyncMessage:(BOOL)a7 cloudEnabled:(BOOL)a8
{
  BOOL v40 = a8;
  BOOL v8 = a7;
  id v12 = a5;
  id v13 = a3;
  id v14 = [objc_alloc((Class)IDSProtobuf) initWithProtobufData:v13 type:(unsigned __int16)a4 isResponse:0];

  BOOL v15 = self->_syncSessionProgressDictionary == 0;
  if (a4 >= 4) {
    uint64_t v16 = 100;
  }
  else {
    uint64_t v16 = 200;
  }
  CFStringRef v17 = [(NPSServer *)self idsService];
  if (v8)
  {
    if ([(NPSServer *)self doesCurrentDeviceSupportNewIDSServiceForSync])
    {
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEBUG)) {
        sub_100028B0C();
      }
      uint64_t v18 = [(NPSServer *)self idsServiceSyncState];

      BOOL v15 = 0;
      uint64_t v16 = 300;
      CFStringRef v17 = (void *)v18;
    }
    else
    {
      BOOL v15 = 0;
      uint64_t v16 = 300;
    }
  }
  v46[0] = IDSSendMessageOptionTimeoutKey;
  [(id)objc_opt_class() maxSendTimeout];
  double v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v47[0] = v19;
  v46[1] = IDSSendMessageOptionBypassDuetKey;
  id v20 = +[NSNumber numberWithBool:1];
  v47[1] = v20;
  v46[2] = IDSSendMessageOptionNonWakingKey;
  id v21 = +[NSNumber numberWithBool:v15];
  v46[3] = IDSSendMessageOptionEnforceRemoteTimeoutsKey;
  v47[2] = v21;
  v47[3] = &__kCFBooleanFalse;
  uint64_t v22 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:4];
  id v23 = [v22 mutableCopy];

  unsigned int v24 = v12;
  if (v12) {
    [v23 setObject:v12 forKeyedSubscript:IDSSendMessageOptionQueueOneIdentifierKey];
  }
  if (v40)
  {
    id v25 = +[NSNumber numberWithBool:1];
    [v23 setObject:v25 forKeyedSubscript:IDSSendMessageOptionAllowCloudDeliveryKey];
  }
  id v26 = [(NPSDeviceRegistry *)self->_deviceRegistry activeDevice];
  id v27 = +[NPSDeviceRegistry idsDestinationIDForNRDevice:v26 withIdsService:self->_idsService];

  if (v27)
  {
    id v28 = +[NSSet setWithObject:v27];
    id v41 = 0;
    unsigned int v29 = [v17 sendProtobuf:v14 toDestinations:v28 priority:v16 options:v23 identifier:v39 error:&v41];
    id v30 = (__CFString *)v41;

    usleep(0xC350u);
    if (v29)
    {
      uint64_t v31 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        if (v39) {
          CFStringRef v32 = *v39;
        }
        else {
          CFStringRef v32 = @"n/a";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v43 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Successfully sent message with identifier: (%@)", buf, 0xCu);
      }
      v35 = 0;
      goto LABEL_26;
    }
  }
  else
  {
    NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
    CFStringRef v45 = @"NPS should not try syncing when there is no active device";
    id v33 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    id v30 = +[NSError errorWithDomain:@"com.apple.NanoPreferencesSync" code:1 userInfo:v33];
  }
  v34 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v43 = v30;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Failed sending message with error: (%@)", buf, 0xCu);
  }
  v35 = v30;
LABEL_26:
  v36 = v35;

  return v36;
}

- (void)_suspendIDSMessageProcessing
{
  id v3 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Suspending IDS message processing", v4, 2u);
  }
  self->_processingIDSMessage = 0;
}

- (void)_resumeIDSMessageProcessingWithDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    pendingIDSMessages = self->_pendingIDSMessages;
    id v7 = v5;
    *(_DWORD *)buf = 134217984;
    id v37 = [(NSMutableArray *)pendingIDSMessages count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Resuming IDS message processing. Has %lu pending IDS messages to process.", buf, 0xCu);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  unsigned int v29 = self;
  BOOL v8 = self->_pendingIDSMessages;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v33;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v14 = [v13 fromIDSDevice];
        BOOL v15 = +[NPSDeviceRegistry nrDeviceForIDSDevice:v14];

        uint64_t v16 = [v15 pairingID];
        CFStringRef v17 = [v4 pairingID];
        unsigned int v18 = [v16 isEqual:v17];

        double v19 = nps_daemon_log;
        if (v18)
        {
          if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v37 = v13;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Processing %@", buf, 0xCu);
          }
          id v20 = [v13 messageType];
          id v21 = [v13 idsProtobuf];
          uint64_t v22 = [v21 context];
          id v23 = [v22 outgoingResponseIdentifier];

          switch((unint64_t)v20)
          {
            case 1uLL:
              unsigned int v24 = [v21 data];
              [(NPSServer *)v29 handleUserDefaultsMsgData:v24 backupFile:0 idsGuid:v23];
              goto LABEL_19;
            case 2uLL:
              unsigned int v24 = [v21 data];
              [(NPSServer *)v29 handleUserDefaultsBackupMsgData:v24 backupFile:0 idsGuid:v23];
              goto LABEL_19;
            case 3uLL:
              id v28 = nps_daemon_log;
              if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_ERROR)) {
                sub_100028B4C(&v30, v31, v28);
              }
              break;
            case 4uLL:
              unsigned int v24 = [v21 data];
              [(NPSServer *)v29 handleFileBackupMessage:v24 resourceURL:0 backupFile:0];
LABEL_19:

              break;
            default:
              break;
          }
        }
        else if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_ERROR))
        {
          id v25 = v19;
          id v26 = [v15 pairingID];
          id v27 = [v4 pairingID];
          *(_DWORD *)buf = 138412802;
          id v37 = v13;
          __int16 v38 = 2112;
          v39 = v26;
          __int16 v40 = 2112;
          id v41 = v27;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@ was originated from %@, not current active device %@; dropping.",
            buf,
            0x20u);
        }
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v10);
  }

  [(NSMutableArray *)v29->_pendingIDSMessages removeAllObjects];
  v29->_processingIDSMessage = 1;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = (uint64_t (*)(uint64_t, uint64_t))a5;
  id v15 = a7;
  uint64_t v16 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    CFStringRef v45 = v14;
    LOWORD(v46) = 1024;
    *(_DWORD *)((char *)&v46 + 2) = v8;
    HIWORD(v46) = 2112;
    id v47 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "service: (%@), account: (%@), identifier: (%@), success: (%d), error: (%@)", buf, 0x30u);
  }
  CFStringRef v17 = (void *)os_transaction_create();
  syncSessionProgressDictionary = self->_syncSessionProgressDictionary;
  if (syncSessionProgressDictionary)
  {
    double v19 = [(NSMutableDictionary *)syncSessionProgressDictionary objectForKey:v14];
    if (!v19)
    {
LABEL_17:

      goto LABEL_18;
    }
    if (v8) {
      goto LABEL_6;
    }
    id v25 = [v15 domain];
    if ([v25 isEqualToString:IDSErrorDomain])
    {
      id v26 = [v15 code];

      if (v26 == (id)24)
      {
LABEL_6:
        id v20 = [v19 unsignedLongLongValue];
        unint64_t totalDataToSyncInBytes = self->_totalDataToSyncInBytes;
        unint64_t v22 = self->_remainingDataToSyncInBytes - (void)v20;
        self->_unint64_t remainingDataToSyncInBytes = v22;
        if (totalDataToSyncInBytes)
        {
          double v23 = (double)(totalDataToSyncInBytes - v22) / (double)totalDataToSyncInBytes;
          unsigned int v24 = nps_daemon_log;
          if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v40 = self->_totalDataToSyncInBytes;
            unint64_t remainingDataToSyncInBytes = self->_remainingDataToSyncInBytes;
            *(_DWORD *)buf = 134218496;
            *(double *)&uint8_t buf[4] = v23;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v40;
            *(_WORD *)&buf[22] = 2048;
            CFStringRef v45 = (uint64_t (*)(uint64_t, uint64_t))remainingDataToSyncInBytes;
            _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "progress: (%f), total: (%llu), remaining: (%llu)", buf, 0x20u);
          }
          [(PSYServiceSyncSession *)self->_activeSyncSession reportProgress:v23];
        }
        [(NSMutableDictionary *)self->_syncSessionProgressDictionary removeObjectForKey:v14];
        if ([(NSMutableDictionary *)self->_syncSessionProgressDictionary count]) {
          goto LABEL_17;
        }
      }
    }
    else
    {
    }
    id v27 = [(PSYServiceSyncSession *)self->_activeSyncSession pairedDevice];
    [(NPSServer *)self syncCompletedWithError:0 withDevice:v27];

    goto LABEL_17;
  }
LABEL_18:
  if (v8)
  {
LABEL_21:
    [(NPSDatabase *)self->_database messageWasDelivered:v14];
    goto LABEL_32;
  }
  id v28 = [v15 domain];
  uint64_t v29 = IDSErrorDomain;
  if ([v28 isEqualToString:IDSErrorDomain])
  {
    id v30 = [v15 code];

    if (v30 == (id)24) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  uint64_t v31 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Message (%@) failed to be delivered with error: (%@)", buf, 0x16u);
  }
  long long v32 = [v15 domain];
  if ([v32 isEqualToString:v29])
  {
    id v33 = [v15 code];

    if (v33 == (id)23)
    {
      [(NPSServer *)self resendMessagesForMessageID:v14];
      goto LABEL_32;
    }
  }
  else
  {
  }
  [(NPSDatabase *)self->_database messageWasPurged:v14];
  purgeTimer = self->_purgeTimer;
  if (purgeTimer) {
    dispatch_source_cancel(purgeTimer);
  }
  id v35 = [(id)objc_opt_class() purgeRetryDelay];
  v36 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_workQueue);
  dispatch_time_t v37 = dispatch_time(0, (int64_t)v35);
  dispatch_source_set_timer(v36, v37, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)((double)(uint64_t)v35 / 10.0));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000C7C8;
  handler[3] = &unk_10003CC40;
  handler[4] = self;
  dispatch_source_set_event_handler(v36, handler);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  CFStringRef v45 = sub_100006068;
  v46 = sub_100006078;
  id v47 = (id)os_transaction_create();
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10000C85C;
  v42[3] = &unk_10003CAA0;
  v42[4] = buf;
  dispatch_source_set_cancel_handler(v36, v42);
  __int16 v38 = self->_purgeTimer;
  self->_purgeTimer = (OS_dispatch_source *)v36;
  v39 = v36;

  dispatch_resume(v39);
  _Block_object_dispose(buf, 8);

LABEL_32:
}

- (void)resendMessagesForMessageID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "messageID: (%@)", buf, 0xCu);
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000CB58;
  v21[3] = &unk_10003CC18;
  v21[4] = self;
  id v6 = v4;
  id v22 = v6;
  id v7 = objc_retainBlock(v21);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000CC58;
  v19[3] = &unk_10003CC18;
  v19[4] = self;
  id v8 = v6;
  id v20 = v8;
  id v9 = objc_retainBlock(v19);
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_10000CE3C;
  uint64_t v16 = &unk_10003CC18;
  CFStringRef v17 = self;
  id v10 = v8;
  id v18 = v10;
  uint64_t v11 = objc_retainBlock(&v13);
  if (v10)
  {
    *(_DWORD *)buf = 0;
    if (-[NPSDatabase getMessageType:forMessageID:](self->_database, "getMessageType:forMessageID:", buf, v10, v13, v14, v15, v16, v17))
    {
      id v12 = v7;
      if (*(_DWORD *)buf)
      {
        id v12 = v11;
        if (*(_DWORD *)buf != 2)
        {
          id v12 = v9;
          if (*(_DWORD *)buf != 1) {
            abort();
          }
        }
      }
      ((void (*)(void))v12[2])();
      [(NPSDatabase *)self->_database removeMessageFromMessageTypeTable:v10];
    }
  }
  else
  {
    ((void (*)(void ***))v7[2])(v7);
    ((void (*)(void ***))v9[2])(v9);
    ((void (*)(void ***))v11[2])(v11);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413570;
    id v32 = v14;
    __int16 v33 = 2112;
    id v34 = v15;
    __int16 v35 = 2112;
    id v36 = v16;
    __int16 v37 = 2112;
    id v38 = v17;
    __int16 v39 = 2112;
    id v40 = v18;
    __int16 v41 = 2112;
    id v42 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "service: (%@); account: (%@); incomingResourceAtURL: (%@); metadata: (%@); fromID: (%@); context: (%@)",
      buf,
      0x3Eu);
  }
  id v21 = [v17 objectForKeyedSubscript:@"type"];
  id v22 = [v17 objectForKeyedSubscript:@"content"];
  if (v21)
  {
    id v30 = v18;
    id v23 = v15;
    id v24 = v14;
    id v25 = (void *)os_transaction_create();
    unsigned int v26 = [v21 intValue];
    if (v26 == 4)
    {
      id v28 = [v19 outgoingResponseIdentifier];
      [(NPSServer *)self handleFullBackupMessage:v22 resourceURL:v16 idsGuid:v28];
    }
    else if (v26 == 3)
    {
      [(NPSServer *)self handleFileBackupMessage:v22 resourceURL:v16 backupFile:0];
    }
    else
    {
      uint64_t v29 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v21;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Un-handled message type: (%@)", buf, 0xCu);
      }
    }

    id v14 = v24;
    id v15 = v23;
    id v18 = v30;
  }
  else
  {
    id v27 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v17;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "nil messageType. metadata: (%@)", buf, 0xCu);
    }
  }
}

- (void)_logUserDefaults:(id)a3 idsGuid:(id)a4
{
  id v5 = a3;
  id v6 = (__CFString *)a4;
  id v7 = objc_opt_new();
  id v8 = v7;
  CFStringRef v9 = @"<n/a>";
  if (v6) {
    CFStringRef v9 = v6;
  }
  [v7 appendFormat:@"User defaults Msg: GUID: %@", v9];
  id v10 = [v5 domain];
  [v8 appendFormat:@"\nDomain: %@", v10];

  [v8 appendFormat:@"\nKeys: ["];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = [v5 keys];
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v15) key];
        [v8 appendFormat:@" %@,", v16];

        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v13);
  }

  [v8 appendFormat:@" ]"];
  id v17 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
}

- (void)_logUserDefaultsBackup:(id)a3 idsGuid:(id)a4
{
  id v5 = a3;
  id v6 = (__CFString *)a4;
  id v7 = objc_opt_new();
  id v8 = v7;
  CFStringRef v9 = @"<n/a>";
  if (v6) {
    CFStringRef v9 = v6;
  }
  [v7 appendFormat:@"User defaults Msg: GUID: %@", v9];
  id v10 = [v5 container];
  [v8 appendFormat:@"\tContainer: %@", v10];

  uint64_t v11 = [v5 domain];
  [v8 appendFormat:@"\tDomain: %@", v11];

  [v8 appendFormat:@"\tKeys: ["];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = [v5 keys];
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      id v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v16) key];
        [v8 appendFormat:@" %@,", v17];

        id v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v14);
  }

  [v8 appendFormat:@" ]"];
  long long v18 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
}

- (void)handleUserDefaultsMsg:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v10 context];
  id v14 = [v13 outgoingResponseIdentifier];

  uint64_t v15 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    BOOL processingIDSMessage = self->_processingIDSMessage;
    int v26 = 136315650;
    if (processingIDSMessage) {
      id v17 = "processing";
    }
    else {
      id v17 = "queueing";
    }
    id v27 = v17;
    __int16 v28 = 2048;
    id v29 = v10;
    __int16 v30 = 2112;
    uint64_t v31 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "handleUserDefaultsMsg: %s idsProtobuf: (%p); outgoingResponseIdentifier: (%@)",
      (uint8_t *)&v26,
      0x20u);
  }
  if (self->_processingIDSMessage)
  {
    long long v18 = [v10 data];
    [(NPSServer *)self handleUserDefaultsMsgData:v18 backupFile:0 idsGuid:v14];
  }
  else
  {
    long long v18 = [v11 deviceForFromID:v12];
    long long v19 = [PendingIDSProtobuf alloc];
    long long v20 = +[NSDate date];
    long long v21 = [(PendingIDSProtobuf *)v19 initWithIDSProtobuf:v10 ofType:1 from:v18 receivedAt:v20];

    [(NSMutableArray *)self->_pendingIDSMessages addObject:v21];
    long long v22 = (void *)nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      pendingIDSMessages = self->_pendingIDSMessages;
      id v24 = v22;
      id v25 = [(NSMutableArray *)pendingIDSMessages count];
      int v26 = 138412546;
      id v27 = (const char *)v21;
      __int16 v28 = 2048;
      id v29 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Added %@ to pending IDS messages queue, size = %lu", (uint8_t *)&v26, 0x16u);
    }
  }
}

- (void)handleUserDefaultsMsgData:(id)a3 backupFile:(id)a4 idsGuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_opt_new();
  id v12 = [objc_alloc((Class)PBDataReader) initWithData:v8];
  if (sub_100018AB4((uint64_t)v11, (uint64_t)v12))
  {
    [(NPSServer *)self _logUserDefaults:v11 idsGuid:v10];
    [(NPSServer *)self handlePermittedUserDefaultsMsg:v11 messageData:v8 overwriteNewerTimestamps:0 backupFile:v9];
  }
  else
  {
    id v13 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Could not parse incoming data", v14, 2u);
    }
  }
}

- (BOOL)handlePermittedUserDefaultsMsg:(id)a3 messageData:(id)a4 overwriteNewerTimestamps:(BOOL)a5 backupFile:(id)a6
{
  BOOL v80 = a5;
  id v8 = a3;
  id v79 = a4;
  id v82 = a6;
  v89 = v8;
  v94 = [v8 domain];
  unsigned int v92 = [v8 hasTimestamp];
  [v8 timestamp];
  id v10 = v9;
  id v11 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = "NO";
    *(_DWORD *)buf = 138413058;
    *(_WORD *)&buf[12] = 1024;
    *(void *)&uint8_t buf[4] = v94;
    if (v80) {
      id v12 = "YES";
    }
    *(_DWORD *)&buf[14] = v92;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = v10;
    *(_WORD *)&buf[28] = 2080;
    *(void *)&buf[30] = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Handling User Defaults message for domain: (%@);        hasTimestamp: (%d);        timestamp: (%f);        overwri"
      "teNewerTimestamps: (%s)",
      buf,
      0x26u);
  }
  v78 = objc_opt_new();
  id v13 = [(NPSSettings *)self->_settings permittedUserDefaults];
  v91 = [v13 objectForKeyedSubscript:v94];

  if (v91)
  {
    [(NPSServer *)self usingPrefsFromDomain:v94];
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id obj = [v8 keys];
    id v90 = [obj countByEnumeratingWithState:&v104 objects:v122 count:16];
    if (v90)
    {
      v86 = 0;
      v93 = 0;
      char v81 = 0;
      uint64_t v88 = *(void *)v105;
      uint64_t v15 = "NO";
      if (v80) {
        uint64_t v15 = "YES";
      }
      v84 = v15;
      *(void *)&long long v14 = 138413058;
      long long v77 = v14;
      while (1)
      {
        for (i = 0; i != v90; i = (char *)i + 1)
        {
          if (*(void *)v105 != v88) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(void **)(*((void *)&v104 + 1) + 8 * i);
          objc_msgSend(v17, "key", v77);
          double v18 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          v95 = [v17 value];
          long long v19 = nps_daemon_log;
          if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413570;
            long long v20 = "not-nil";
            if (!v95) {
              long long v20 = "nil";
            }
            *(void *)&uint8_t buf[4] = v94;
            *(_WORD *)&buf[12] = 2112;
            *(double *)&buf[14] = v18;
            *(_WORD *)&buf[22] = 2080;
            *(void *)&unsigned char buf[24] = v20;
            *(_WORD *)&buf[32] = 1024;
            *(_DWORD *)&buf[34] = v92 & 1;
            *(_WORD *)&buf[38] = 2048;
            id v119 = v10;
            __int16 v120 = 2080;
            v121 = v84;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Handling key in domain: (%@)            key: (%@);            value: (%s);            hasTimestamp: (%d); "
              "           timestamp: (%f);            overwriteNewerTimestamps: (%s)",
              buf,
              0x3Au);
          }
          if ([v17 hasTimestamp])
          {
            unsigned int v92 = [v17 hasTimestamp];
            [v17 timestamp];
            id v10 = v21;
            long long v22 = nps_daemon_log;
            if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218498;
              *(void *)&uint8_t buf[4] = v10;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v94;
              *(_WORD *)&buf[22] = 2112;
              *(double *)&unsigned char buf[24] = v18;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Using timestamp from user defaults message key (%f) for <Domain %@; key %@>.",
                buf,
                0x20u);
            }
          }
          else
          {
            unsigned int v92 = [v89 hasTimestamp];
            [v89 timestamp];
            id v10 = v23;
            id v24 = nps_daemon_log;
            if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218498;
              *(void *)&uint8_t buf[4] = v10;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v94;
              *(_WORD *)&buf[22] = 2112;
              *(double *)&unsigned char buf[24] = v18;
              _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Using timestamp from user defaults message (%f) for <Domain %@; key %@>.",
                buf,
                0x20u);
            }
          }
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x3032000000;
          *(void *)&unsigned char buf[24] = sub_100006068;
          *(void *)&buf[32] = sub_100006078;
          id v25 = [v91 keys];
          id v119 = [v25 objectForKeyedSubscript:*(void *)&v18];

          int v26 = *(void **)(*(void *)&buf[8] + 40);
          if (v26) {
            goto LABEL_25;
          }
          id v27 = [v91 keyPrefixes];
          v101[0] = _NSConcreteStackBlock;
          v101[1] = 3221225472;
          v101[2] = sub_10000EA48;
          v101[3] = &unk_10003CF78;
          id v28 = *(id *)&v18;
          id v102 = v28;
          v103 = buf;
          [v27 enumerateKeysAndObjectsUsingBlock:v101];

          if (*(void *)(*(void *)&buf[8] + 40))
          {

            int v26 = *(void **)(*(void *)&buf[8] + 40);
LABEL_25:
            id v29 = [v26 container];
            double v30 = [*(id *)(*(void *)&buf[8] + 40) appGroupContainer];
            if ([*(id *)(*(void *)&buf[8] + 40) isPerGizmoSetting])
            {
              uint64_t v31 = v86;
              if (!v86)
              {
                uint64_t v31 = [[NPSSettingAccessor alloc] initWithNanoDomain:v94];
                v86 = v31;
              }
            }
            else
            {
              if (v93)
              {
                id v32 = [(NPSSettingAccessor *)v93 container];
                if (v32 == v29)
                {
                  id v34 = [(NPSSettingAccessor *)v93 appGroupContainer];
                  BOOL v35 = v34 == *(void **)&v30;

                  if (v35)
                  {
                    uint64_t v31 = v93;
                    goto LABEL_38;
                  }
                }
                else
                {
                }
              }
              id v36 = nps_daemon_log;
              if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v110 = 138412802;
                double v111 = *(double *)&v94;
                __int16 v112 = 2112;
                double v113 = *(double *)&v29;
                __int16 v114 = 2112;
                double v115 = v30;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Creating domain accessor (domain: %@, container: %@, appGroupContainer: %@)", v110, 0x20u);
              }
              uint64_t v31 = [[NPSSettingAccessor alloc] initWithUserDefaultsDomain:v94 container:v29 appGroupContainer:*(void *)&v30];

              v93 = v31;
            }
LABEL_38:
            __int16 v37 = v31;
            id v38 = v37;
            if (!v37)
            {
              uint64_t v52 = nps_daemon_log;
              if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v110 = 138412546;
                double v111 = v18;
                __int16 v112 = 2112;
                double v113 = *(double *)&v94;
                _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Unable to create settings accessor for Key (%@) Domain (%@); dropping incoming message.",
                  v110,
                  0x16u);
              }
              goto LABEL_83;
            }
            if (![(NPSSettingAccessor *)v37 requiresDeviceUnlockedSinceBoot]
              || ([*(id *)(*(void *)&buf[8] + 40) isPerGizmoSetting] & 1) != 0
              || (int v39 = MKBDeviceUnlockedSinceBoot(), v39 > 0))
            {
              id v100 = 0;
              *(double *)&uint64_t v40 = +[NPSSettingAccessor unserializeObject:v95 error:&v100];
              id v87 = v100;
              if (v87) {
                goto LABEL_82;
              }
              __int16 v41 = nps_daemon_log;
              if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v110 = 138412802;
                double v111 = *(double *)&v94;
                __int16 v112 = 2112;
                double v113 = v18;
                __int16 v114 = 2112;
                double v115 = *(double *)&v40;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Received User Defaults value for <%@, %@>: (%@)", v110, 0x20u);
              }
              if (v82)
              {
                id v42 = objc_opt_class();
                CFStringRef v43 = [*(id *)(*(void *)&buf[8] + 40) syncGroups];
                NSErrorUserInfoKey v44 = [(NPSServer *)self allowedGroups];
                LODWORD(v42) = [v42 shouldAllowSyncOfItemWithSyncGroups:v43 allowedSyncGroups:v44];

                if (v42) {
                  [v82 writeMessage:0 data:v79];
                }
              }
              if ([*(id *)(*(void *)&buf[8] + 40) twoWaySync])
              {
                if (!v80
                  && (!v92
                   || ![v17 hasTwoWaySync]
                   || ![v17 twoWaySync]))
                {
                  long long v57 = nps_daemon_log;
                  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v110 = 138412546;
                    double v111 = *(double *)&v94;
                    __int16 v112 = 2112;
                    double v113 = v18;
                    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Local expects <%@, %@> to be 2-way-synced, but remote doesn't", v110, 0x16u);
                  }
                  char v81 = 1;
                  goto LABEL_75;
                }
                CFStringRef v45 = -[NPSServer getCachedTimeStampFor:key:usePerGizmoCache:](self, "getCachedTimeStampFor:key:usePerGizmoCache:", v94, *(void *)&v18, [*(id *)(*(void *)&buf[8] + 40) isPerGizmoSetting]);
                v46 = v45;
                if (v45)
                {
                  [v45 doubleValue];
                  double v48 = v47;
                  +[NSDate timeIntervalSinceReferenceDate];
                  double v50 = v49;
                  if (v49 - v48 < 0.0)
                  {
                    v51 = nps_daemon_log;
                    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v110 = v77;
                      double v111 = *(double *)&v94;
                      __int16 v112 = 2112;
                      double v113 = v18;
                      __int16 v114 = 2048;
                      double v115 = v48;
                      __int16 v116 = 2048;
                      double v117 = v50;
                      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Discarding cached timestamp for <%@, %@> since it is set to the future; cached: (%f); current: (%f)",
                        v110,
                        0x2Au);
                    }

                    v46 = 0;
                    goto LABEL_72;
                  }
                  if (v80) {
                    goto LABEL_72;
                  }
                  long long v58 = +[NSNumber numberWithDouble:*(double *)&v10];
                  BOOL v59 = [v46 compare:v58] == (id)-1;

                  if (v59) {
                    goto LABEL_72;
                  }
                  long long v60 = nps_daemon_log;
                  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v110 = 138412546;
                    double v111 = *(double *)&v94;
                    __int16 v112 = 2112;
                    double v113 = v18;
                    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Discarding incoming setting for <%@, %@>, local value is more recent", v110, 0x16u);
                  }
                  char v81 = 1;
LABEL_81:

LABEL_82:
LABEL_83:

                  goto LABEL_84;
                }
LABEL_72:
                long long v61 = nps_daemon_log;
                if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v110 = 138412802;
                  double v111 = *(double *)&v94;
                  __int16 v112 = 2112;
                  double v113 = v18;
                  __int16 v114 = 2048;
                  double v115 = *(double *)&v10;
                  _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Updating timestamp for domain:%@ key:%@ to timestamp: %f", v110, 0x20u);
                }
                double v109 = v18;
                id v62 = +[NSArray arrayWithObjects:&v109 count:1];
                v63 = +[NSNumber numberWithDouble:*(double *)&v10];
                -[NPSServer updateCacheForDomain:keys:twoWaySyncTimestamp:isPerGizmo:](self, "updateCacheForDomain:keys:twoWaySyncTimestamp:isPerGizmo:", v94, v62, v63, [*(id *)(*(void *)&buf[8] + 40) isPerGizmoSetting]);
              }
LABEL_75:
              uint64_t v64 = [(NPSSettingAccessor *)v38 objectForKey:*(void *)&v18];
              v46 = (void *)v64;
              if (v64 | v40 && ![(id)v64 isEqual:v40])
              {
                [(NPSSettingAccessor *)v38 setObject:v40 forKey:*(void *)&v18];
                v66 = [*(id *)(*(void *)&buf[8] + 40) notificationNames];

                if (v66)
                {
                  __int16 v67 = [*(id *)(*(void *)&buf[8] + 40) notificationNames];
                  [v78 unionSet:v67];
                }
              }
              else
              {
                v65 = nps_daemon_log;
                if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v110 = 138412802;
                  double v111 = v18;
                  __int16 v112 = 2112;
                  double v113 = *(double *)&v46;
                  __int16 v114 = 2112;
                  double v115 = *(double *)&v40;
                  _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Skipping key (%@) since incoming value is un-changed                Current value: %@; incoming value: %@",
                    v110,
                    0x20u);
                }
              }
              goto LABEL_81;
            }
            id v53 = nps_daemon_log;
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              long long v54 = [*(id *)(*(void *)&buf[8] + 40) container];
              *(_DWORD *)v110 = v77;
              double v111 = *(double *)&v54;
              __int16 v112 = 2112;
              double v113 = *(double *)&v94;
              __int16 v114 = 2112;
              double v115 = v18;
              __int16 v116 = 1024;
              LODWORD(v117) = v39;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Received containerized user defaults  (%@, %@, %@) before first unlock (%d); Stashing in database.",
                v110,
                0x26u);
            }
            database = self->_database;
            id v56 = [v17 twoWaySync];
            [v89 timestamp];
            -[NPSDatabase stashSettingsSyncData:forDomain:key:isTwoWaySync:timestamp:](database, "stashSettingsSyncData:forDomain:key:isTwoWaySync:timestamp:", v95, v94, *(void *)&v18, v56);
            goto LABEL_83;
          }
          __int16 v33 = nps_daemon_log;
          if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v110 = 138412546;
            double v111 = *(double *)&v28;
            __int16 v112 = 2112;
            double v113 = *(double *)&v94;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Key (%@) in domain (%@) not permitted; dropping incoming message",
              v110,
              0x16u);
          }
          char v81 = 1;
          id v29 = v102;
LABEL_84:

          _Block_object_dispose(buf, 8);
        }
        id v90 = [obj countByEnumeratingWithState:&v104 objects:v122 count:16];
        if (!v90) {
          goto LABEL_91;
        }
      }
    }
    v86 = 0;
    v93 = 0;
    char v81 = 0;
LABEL_91:

    [(NPSSettingAccessor *)v93 synchronizeForWriting];
    [(NPSSettingAccessor *)v86 synchronizeForWriting];
    if (v78)
    {
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      id v69 = v78;
      id v70 = [v69 countByEnumeratingWithState:&v96 objects:v108 count:16];
      if (v70)
      {
        uint64_t v71 = *(void *)v97;
        do
        {
          for (j = 0; j != v70; j = (char *)j + 1)
          {
            if (*(void *)v97 != v71) {
              objc_enumerationMutation(v69);
            }
            CFStringRef v73 = *(const __CFString **)(*((void *)&v96 + 1) + 8 * (void)j);
            v74 = nps_daemon_log;
            if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v73;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v94;
              _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Posting (%@) for domain (%@)", buf, 0x16u);
            }
            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            CFNotificationCenterPostNotification(DarwinNotifyCenter, v73, 0, 0, 0);
          }
          id v70 = [v69 countByEnumeratingWithState:&v96 objects:v108 count:16];
        }
        while (v70);
      }
    }
  }
  else
  {
    CFStringRef v68 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v94;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Domain (%@) not permitted; dropping incoming message",
        buf,
        0xCu);
    }
    v86 = 0;
    v93 = 0;
    char v81 = 1;
  }

  return v81 & 1;
}

- (void)handleRestoreOfSyncingUserDefaultsMsg:(id)a3 backupFile:(id)a4
{
  id v5 = a3;
  id v77 = a4;
  id v6 = objc_opt_new();
  id v70 = v5;
  id v61 = [objc_alloc((Class)PBDataReader) initWithData:v5];
  id v62 = v6;
  if (sub_100018AB4((uint64_t)v6, (uint64_t)v61))
  {
    v76 = [v6 domain];
    unsigned int v72 = [v6 hasTimestamp];
    [v6 timestamp];
    double v8 = v7;
    id v9 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v76;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v72;
      *(_WORD *)&buf[18] = 2048;
      *(double *)&buf[20] = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Handling Restore of User Defaults message for domain: (%@); hasTimestamp: (%d); timestamp: (%f)",
        buf,
        0x1Cu);
    }
    long long v60 = objc_opt_new();
    id v10 = [(NPSSettings *)self->_settings syncedUserDefaults];
    v66 = [v10 objectForKeyedSubscript:v76];

    if (v66)
    {
      [(NPSServer *)self usingPrefsFromDomain:v76];
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      id obj = [v62 keys];
      id v65 = [obj countByEnumeratingWithState:&v91 objects:v109 count:16];
      if (v65)
      {
        v74 = 0;
        v75 = 0;
        uint64_t v64 = *(void *)v92;
        while (1)
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v92 != v64)
            {
              uint64_t v12 = v11;
              objc_enumerationMutation(obj);
              uint64_t v11 = v12;
            }
            uint64_t v68 = v11;
            uint64_t v71 = *(void **)(*((void *)&v91 + 1) + 8 * v11);
            id v13 = [v71 key];
            id v69 = [v71 value];
            if ([v71 hasTimestamp])
            {
              LOBYTE(v72) = [v71 hasTimestamp];
              [v71 timestamp];
              double v8 = v14;
              uint64_t v15 = nps_daemon_log;
              if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218498;
                *(double *)&uint8_t buf[4] = v8;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v76;
                *(_WORD *)&buf[22] = 2112;
                *(void *)&unsigned char buf[24] = v13;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Using timestamp from user defaults message key (%f) for <Domain %@; key %@>.",
                  buf,
                  0x20u);
              }
            }
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&uint8_t buf[16] = 0x3032000000;
            *(void *)&unsigned char buf[24] = sub_100006068;
            long long v107 = sub_100006078;
            id v16 = [v66 keyArrays];
            id v108 = [v16 objectForKeyedSubscript:v13];

            if (*(void *)(*(void *)&buf[8] + 40)) {
              goto LABEL_16;
            }
            id v17 = [v66 keyPrefixArrays];
            v88[0] = _NSConcreteStackBlock;
            v88[1] = 3221225472;
            v88[2] = sub_10000F7AC;
            v88[3] = &unk_10003CFA0;
            id v18 = v13;
            id v89 = v18;
            id v90 = buf;
            [v17 enumerateKeysAndObjectsUsingBlock:v88];

            if (*(void *)(*(void *)&buf[8] + 40))
            {

LABEL_16:
              id v87 = 0;
              *(double *)&uint64_t v19 = +[NPSSettingAccessor unserializeObject:v69 error:&v87];
              id v67 = v87;
              if (!v67)
              {
                long long v20 = nps_daemon_log;
                if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)long long v97 = 138412802;
                  id v98 = v76;
                  __int16 v99 = 2112;
                  id v100 = v13;
                  __int16 v101 = 2112;
                  double v102 = *(double *)&v19;
                  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Received User Defaults value for <%@, %@>: (%@)", v97, 0x20u);
                }
                long long v85 = 0u;
                long long v86 = 0u;
                long long v83 = 0u;
                long long v84 = 0u;
                id v73 = *(id *)(*(void *)&buf[8] + 40);
                id v21 = [v73 countByEnumeratingWithState:&v83 objects:v105 count:16];
                if (v21)
                {
                  uint64_t v22 = *(void *)v84;
                  do
                  {
                    for (i = 0; i != v21; i = (char *)i + 1)
                    {
                      if (*(void *)v84 != v22) {
                        objc_enumerationMutation(v73);
                      }
                      id v24 = *(void **)(*((void *)&v83 + 1) + 8 * i);
                      if (v77)
                      {
                        id v25 = objc_opt_class();
                        int v26 = [v24 syncGroups];
                        id v27 = [(NPSServer *)self allowedGroups];
                        unsigned int v28 = [v25 shouldAllowSyncOfItemWithSyncGroups:v26 allowedSyncGroups:v27];

                        if (v28) {
                          [v77 writeMessage:0 data:v70];
                        }
                      }
                      if ([v24 twoWaySync])
                      {
                        if ((v72 & 1) != 0
                          && [v71 hasTwoWaySync]
                          && [v71 twoWaySync])
                        {
                          id v29 = -[NPSServer getCachedTimeStampFor:key:usePerGizmoCache:](self, "getCachedTimeStampFor:key:usePerGizmoCache:", v76, v13, [v24 isPerGizmoSetting]);
                          double v30 = v29;
                          if (v29)
                          {
                            [v29 doubleValue];
                            double v32 = v31;
                            +[NSDate timeIntervalSinceReferenceDate];
                            double v34 = v33;
                            if (v33 - v32 < 0.0)
                            {
                              BOOL v35 = nps_daemon_log;
                              if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)long long v97 = 138413058;
                                id v98 = v76;
                                __int16 v99 = 2112;
                                id v100 = v13;
                                __int16 v101 = 2048;
                                double v102 = v32;
                                __int16 v103 = 2048;
                                double v104 = v34;
                                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Discarding cached timestamp for <%@, %@> since it is set to the future; cached: (%f); current: (%f)",
                                  v97,
                                  0x2Au);
                              }

                              double v30 = 0;
                            }
                          }
                          id v36 = nps_daemon_log;
                          if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)long long v97 = 138412802;
                            id v98 = v76;
                            __int16 v99 = 2112;
                            id v100 = v13;
                            __int16 v101 = 2048;
                            double v102 = v8;
                            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Updating timestamp for domain:%@ key:%@ to timestamp: %f", v97, 0x20u);
                          }
                          long long v96 = v13;
                          __int16 v37 = +[NSArray arrayWithObjects:&v96 count:1];
                          id v38 = +[NSNumber numberWithDouble:v8];
                          -[NPSServer updateCacheForDomain:keys:twoWaySyncTimestamp:isPerGizmo:](self, "updateCacheForDomain:keys:twoWaySyncTimestamp:isPerGizmo:", v76, v37, v38, [v24 isPerGizmoSetting]);
                        }
                        else
                        {
                          int v39 = nps_daemon_log;
                          if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)long long v97 = 138412546;
                            id v98 = v76;
                            __int16 v99 = 2112;
                            id v100 = v13;
                            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Local expects <%@, %@> to be 2-way-synced, but remote doesn't", v97, 0x16u);
                          }
                        }
                      }
                      uint64_t v40 = [v24 container];
                      __int16 v41 = [v24 appGroupContainer];
                      if ([v24 isPerGizmoSetting])
                      {
                        id v42 = v74;
                        if (!v74)
                        {
                          id v42 = [[NPSSettingAccessor alloc] initWithNanoDomain:v76];
                          v74 = v42;
                        }
                      }
                      else
                      {
                        id v42 = v75;
                        if (!v75)
                        {
                          id v42 = [[NPSSettingAccessor alloc] initWithUserDefaultsDomain:v76 container:v40 appGroupContainer:v41];
                          v75 = v42;
                        }
                      }
                      CFStringRef v43 = v42;
                      NSErrorUserInfoKey v44 = v43;
                      if (v43)
                      {
                        uint64_t v45 = [(NPSSettingAccessor *)v43 objectForKey:v13];
                        v46 = (void *)v45;
                        if (v45 | v19 && ![(id)v45 isEqual:v19])
                        {
                          [(NPSSettingAccessor *)v44 setObject:v19 forKey:v13];
                        }
                        else
                        {
                          double v47 = nps_daemon_log;
                          if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)long long v97 = 138412802;
                            id v98 = v13;
                            __int16 v99 = 2112;
                            id v100 = v46;
                            __int16 v101 = 2112;
                            double v102 = *(double *)&v19;
                            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Skipping key (%@) since incoming value is un-changed                        Current value: %@; incoming value: %@",
                              v97,
                              0x20u);
                          }
                        }
                      }
                      else
                      {
                        double v48 = nps_daemon_log;
                        if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)long long v97 = 138412546;
                          id v98 = v13;
                          __int16 v99 = 2112;
                          id v100 = v76;
                          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Unable to create settings accessor for Key (%@) Domain (%@); dropping incoming message.",
                            v97,
                            0x16u);
                        }
                      }
                    }
                    id v21 = [v73 countByEnumeratingWithState:&v83 objects:v105 count:16];
                  }
                  while (v21);
                }
              }
              goto LABEL_59;
            }
            double v49 = nps_daemon_log;
            if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long v97 = 138412546;
              id v98 = v18;
              __int16 v99 = 2112;
              id v100 = v76;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Key (%@) in domain (%@) not synced; dropping incoming message",
                v97,
                0x16u);
            }

LABEL_59:
            _Block_object_dispose(buf, 8);

            uint64_t v11 = v68 + 1;
          }
          while ((id)(v68 + 1) != v65);
          id v50 = [obj countByEnumeratingWithState:&v91 objects:v109 count:16];
          id v65 = v50;
          if (!v50) {
            goto LABEL_72;
          }
        }
      }
      v74 = 0;
      v75 = 0;
LABEL_72:

      [(NPSSettingAccessor *)v75 synchronizeForWriting];
      [(NPSSettingAccessor *)v74 synchronizeForWriting];
      if (v60)
      {
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        id v53 = v60;
        id v54 = [v53 countByEnumeratingWithState:&v79 objects:v95 count:16];
        if (v54)
        {
          uint64_t v55 = *(void *)v80;
          do
          {
            for (j = 0; j != v54; j = (char *)j + 1)
            {
              if (*(void *)v80 != v55) {
                objc_enumerationMutation(v53);
              }
              CFStringRef v57 = *(const __CFString **)(*((void *)&v79 + 1) + 8 * (void)j);
              long long v58 = nps_daemon_log;
              if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v57;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v76;
                _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Posting (%@) for domain (%@)", buf, 0x16u);
              }
              DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
              CFNotificationCenterPostNotification(DarwinNotifyCenter, v57, 0, 0, 0);
            }
            id v54 = [v53 countByEnumeratingWithState:&v79 objects:v95 count:16];
          }
          while (v54);
        }
      }
    }
    else
    {
      uint64_t v52 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v76;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Domain (%@) not synced; dropping incoming message",
          buf,
          0xCu);
      }
      v74 = 0;
      v75 = 0;
    }
  }
  else
  {
    v51 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Could not parse incoming data", buf, 2u);
    }
  }
}

+ (void)logManagedConfigurationDictionary:(id)a3
{
}

- (void)handleUserDefaultsBackupMsg:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v10 context];
  double v14 = [v13 outgoingResponseIdentifier];

  uint64_t v15 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    BOOL processingIDSMessage = self->_processingIDSMessage;
    int v26 = 136315650;
    if (processingIDSMessage) {
      id v17 = "processing";
    }
    else {
      id v17 = "queueing";
    }
    id v27 = v17;
    __int16 v28 = 2048;
    id v29 = v10;
    __int16 v30 = 2112;
    double v31 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "handleUserDefaultsBackupMsg: %s idsProtobuf: (%p); outgoingResponseIdentifier: (%@)",
      (uint8_t *)&v26,
      0x20u);
  }
  if (self->_processingIDSMessage)
  {
    id v18 = [v10 data];
    [(NPSServer *)self handleUserDefaultsBackupMsgData:v18 backupFile:0 idsGuid:v14];
  }
  else
  {
    id v18 = [v11 deviceForFromID:v12];
    uint64_t v19 = [PendingIDSProtobuf alloc];
    long long v20 = +[NSDate date];
    id v21 = [(PendingIDSProtobuf *)v19 initWithIDSProtobuf:v10 ofType:2 from:v18 receivedAt:v20];

    [(NSMutableArray *)self->_pendingIDSMessages addObject:v21];
    uint64_t v22 = (void *)nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      pendingIDSMessages = self->_pendingIDSMessages;
      id v24 = v22;
      id v25 = [(NSMutableArray *)pendingIDSMessages count];
      int v26 = 138412546;
      id v27 = (const char *)v21;
      __int16 v28 = 2048;
      id v29 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Added %@ to pending IDS messages queue, size = %lu", (uint8_t *)&v26, 0x16u);
    }
  }
}

- (void)handleUserDefaultsBackupMsgData:(id)a3 backupFile:(id)a4 idsGuid:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = objc_opt_new();
  id v10 = [objc_alloc((Class)PBDataReader) initWithData:v8];

  if (sub_100004F90((char *)v9, (uint64_t)v10))
  {
    [(NPSServer *)self _logUserDefaultsBackup:v9 idsGuid:v7];
    id v11 = [v9 domain];
    id v12 = [v9 container];
    id v13 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v41 = v12;
      __int16 v42 = 2112;
      id v43 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Handling User Defaults Backup message for container: (%@); domain: (%@)",
        buf,
        0x16u);
    }
    double v14 = [(NPSServer *)self backupPathForDomain:v11 container:v12];
    if (!v14
      || v12
      && ([(NPSServer *)self createDirectoryIfNeeded:v14],
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          v15))
    {

      goto LABEL_36;
    }
    id v17 = +[NSData dataWithContentsOfFile:v14];
    if (!v17)
    {
      id v19 = 0;
LABEL_19:
      id v18 = objc_opt_new();
LABEL_20:
      id v23 = [v9 keys];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1000101C4;
      v36[3] = &unk_10003D028;
      id v32 = v11;
      id v37 = v32;
      id v24 = v18;
      id v38 = v24;
      [v23 enumerateObjectsUsingBlock:v36];

      if (![v24 count])
      {
        __int16 v30 = +[NSFileManager defaultManager];
        if ([v30 fileExistsAtPath:v14])
        {
          id v33 = v19;
          [v30 removeItemAtPath:v14 error:&v33];
          id v26 = v33;

          if (v26)
          {
            double v31 = nps_daemon_log;
            if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              id v41 = v32;
              __int16 v42 = 2112;
              id v43 = v14;
              __int16 v44 = 2112;
              id v45 = v26;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Failed to delete backup for domain (%@) at path (%@) with error: (%@)", buf, 0x20u);
            }
          }
        }
        else
        {
          id v26 = v19;
        }

        __int16 v28 = v32;
        goto LABEL_35;
      }
      id v35 = 0;
      id v25 = +[NSPropertyListSerialization dataWithPropertyList:v24 format:200 options:0 error:&v35];
      id v26 = v35;

      if (v26)
      {
        id v27 = nps_daemon_log;
        __int16 v28 = v32;
        if (!os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
LABEL_32:
          id v17 = v25;
LABEL_35:

          goto LABEL_36;
        }
        *(_DWORD *)buf = 138412802;
        id v41 = v32;
        __int16 v42 = 2112;
        id v43 = v24;
        __int16 v44 = 2112;
        id v45 = v26;
        id v29 = "Failed to serialize updated domain (%@) backup dictionary (%@) with error: (%@)";
      }
      else
      {
        id v34 = 0;
        [v25 writeToFile:v14 options:268435457 error:&v34];
        id v26 = v34;
        __int16 v28 = v32;
        if (!v26) {
          goto LABEL_32;
        }
        id v27 = nps_daemon_log;
        if (!os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_32;
        }
        *(_DWORD *)buf = 138412802;
        id v41 = v32;
        __int16 v42 = 2112;
        id v43 = v14;
        __int16 v44 = 2112;
        id v45 = v26;
        id v29 = "Failed to write updated domain (%@) backup at path (%@) with error: (%@)";
      }
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v29, buf, 0x20u);
      goto LABEL_32;
    }
    id v39 = 0;
    id v18 = +[NSPropertyListSerialization propertyListWithData:v17 options:1 format:0 error:&v39];
    id v19 = v39;
    long long v20 = nps_daemon_log;
    BOOL v21 = os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (!v21) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 138412546;
      id v41 = v17;
      __int16 v42 = 2112;
      id v43 = v19;
      uint64_t v22 = "Failed to unserialized domain backup (%@) with error: (%@)";
    }
    else
    {
      if (!v21) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 138412546;
      id v41 = v11;
      __int16 v42 = 2112;
      id v43 = v18;
      uint64_t v22 = "Read pre-existing domain (%@) backup: (%@)";
    }
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v22, buf, 0x16u);
LABEL_18:
    if (v18) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  id v16 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Could not parse incoming data", buf, 2u);
  }
LABEL_36:
}

- (void)handleFileBackupMessage:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v10 context];
  double v14 = [v13 outgoingResponseIdentifier];

  uint64_t v15 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    BOOL processingIDSMessage = self->_processingIDSMessage;
    int v26 = 136315650;
    if (processingIDSMessage) {
      id v17 = "processing";
    }
    else {
      id v17 = "queueing";
    }
    id v27 = v17;
    __int16 v28 = 2048;
    id v29 = v10;
    __int16 v30 = 2112;
    double v31 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "handleFileBackupMessage: %s idsProtobuf: (%p); outgoingResponseIdentifier: (%@)",
      (uint8_t *)&v26,
      0x20u);
  }
  if (self->_processingIDSMessage)
  {
    id v18 = [v10 data];
    [(NPSServer *)self handleFileBackupMessage:v18 resourceURL:0 backupFile:0];
  }
  else
  {
    id v18 = [v11 deviceForFromID:v12];
    id v19 = [PendingIDSProtobuf alloc];
    long long v20 = +[NSDate date];
    BOOL v21 = [(PendingIDSProtobuf *)v19 initWithIDSProtobuf:v10 ofType:4 from:v18 receivedAt:v20];

    [(NSMutableArray *)self->_pendingIDSMessages addObject:v21];
    uint64_t v22 = (void *)nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      pendingIDSMessages = self->_pendingIDSMessages;
      id v24 = v22;
      id v25 = [(NSMutableArray *)pendingIDSMessages count];
      int v26 = 138412546;
      id v27 = (const char *)v21;
      __int16 v28 = 2048;
      id v29 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Added %@ to pending IDS messages queue, size = %lu", (uint8_t *)&v26, 0x16u);
    }
  }
}

- (void)handleFileBackupMessage:(id)a3 resourceURL:(id)a4 backupFile:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[NPSFileBackupMsg alloc] initWithData:v8];

  if (v9)
  {
    id v10 = +[NSSet setWithObject:objc_opt_class()];
    id v11 = [(NPSFileBackupMsg *)v9 fileURL];
    id v12 = +[NPSKeyedArchiverUtil unarchiveObjectOfClasses:v10 withData:v11];

    id v13 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v12;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Handling file backup message for path: (%@); Temporary URL: (%@)",
        (uint8_t *)&v16,
        0x16u);
    }
    double v14 = [(NPSServer *)self fileBackupManager];
    [v14 backupFileAtURL:v7 originalFileURL:v12];
  }
  else
  {
    uint64_t v15 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Could not parse incoming data", (uint8_t *)&v16, 2u);
    }
  }
}

- (void)handleFullBackupMessage:(id)a3 resourceURL:(id)a4 idsGuid:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [[NPSFileBackupMsg alloc] initWithData:v10];

  if (v11)
  {
    id v12 = [[NPSBackupReaderWriter alloc] initWithPathToLoadBackup:v8];
    if (v12)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100010880;
      v14[3] = &unk_10003D050;
      v14[4] = self;
      id v15 = v9;
      [(NPSBackupReaderWriter *)v12 enumerateMessages:v14];
    }
  }
  if (v8)
  {
    id v13 = +[NSFileManager defaultManager];
    [v13 removeItemAtURL:v8 error:0];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    id v13 = v6;
    __int16 v14 = 2048;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "listener: (%p); connection: (%p)", buf, 0x16u);
  }
  if (qword_100045740 != -1) {
    dispatch_once(&qword_100045740, &stru_10003D070);
  }
  [v7 setExportedInterface:qword_100045748];
  [v7 setExportedObject:self];
  objc_initWeak((id *)buf, v7);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100010C88;
  v10[3] = &unk_10003D098;
  objc_copyWeak(&v11, (id *)buf);
  [v7 setInvalidationHandler:v10];
  [v7 setInterruptionHandler:0];
  [v7 resume];
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (id)cachePathForDomain:(id)a3 isPerGizmo:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NPSDeviceRegistry *)self->_deviceRegistry perGizmoCacheDirectoryPath];
  if (!v4)
  {
    uint64_t v8 = [(NPSDeviceRegistry *)self->_deviceRegistry globalCacheDirectoryPath];

    id v7 = (void *)v8;
  }
  if (v7)
  {
    id v9 = [v7 stringByAppendingPathComponent:v6];
    id v10 = [v9 stringByStandardizingPath];

    if ([v10 hasPrefix:v7])
    {
      id v11 = v10;
    }
    else
    {
      id v12 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412546;
        id v15 = v6;
        __int16 v16 = 1024;
        BOOL v17 = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed to resolve cache path for domain: (%@); isPerGizmo: (%d)",
          (uint8_t *)&v14,
          0x12u);
      }
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)readCacheFromDiskForDomain:(id)a3 isPerGizmo:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v6;
    __int16 v18 = 1024;
    LODWORD(v19) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reading cache for domain: (%@); isPerGizmo: (%d)",
      buf,
      0x12u);
  }
  uint64_t v8 = [(NPSServer *)self cachePathForDomain:v6 isPerGizmo:v4];
  if (!v8)
  {
    id v10 = 0;
    id v13 = 0;
    goto LABEL_15;
  }
  id v9 = +[NSData dataWithContentsOfFile:v8];
  if (v9)
  {
    id v15 = 0;
    id v10 = +[NSPropertyListSerialization propertyListWithData:v9 options:1 format:0 error:&v15];
    id v11 = v15;
    id v12 = nps_daemon_log;
    if (v11)
    {
      id v13 = v11;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v17 = v9;
        __int16 v18 = 2112;
        id v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed to unserialized domain cache (%@) %@", buf, 0x16u);
      }

      id v10 = 0;
      goto LABEL_14;
    }
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEBUG)) {
      sub_100028B8C();
    }
  }
  else
  {
    id v10 = 0;
  }
  id v13 = 0;
LABEL_14:

LABEL_15:
  return v10;
}

- (BOOL)writeCache:(id)a3 toDiskForDomain:(id)a4 isPerGizmo:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v9;
    __int16 v23 = 1024;
    LODWORD(v24) = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Writing cache for domain: (%@); isPerGizmo: (%d)",
      buf,
      0x12u);
  }
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEBUG))
  {
    sub_100028C00();
    if (!v8) {
      goto LABEL_16;
    }
  }
  else if (!v8)
  {
    goto LABEL_16;
  }
  if ([v8 count])
  {
    id v20 = 0;
    id v11 = +[NSPropertyListSerialization dataWithPropertyList:v8 format:200 options:0 error:&v20];
    id v12 = v20;
    if (v12)
    {
      id v13 = v12;
      int v14 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v22 = v8;
        __int16 v23 = 2112;
        id v24 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to serialize updated domain cache dictionary (%@) with error: (%@)", buf, 0x16u);
      }
      BOOL v15 = 0;
      goto LABEL_20;
    }
    __int16 v16 = [(NPSServer *)self cachePathForDomain:v9 isPerGizmo:v5];
    if (v16)
    {
      id v19 = 0;
      [v11 writeToFile:v16 options:268435457 error:&v19];
      id v13 = v19;
      if (v13)
      {
        id v17 = nps_daemon_log;
        if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v22 = v16;
          __int16 v23 = 2112;
          id v24 = v13;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed to write updated domain cache (%@) with error: (%@)", buf, 0x16u);
        }
        BOOL v15 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      id v13 = 0;
    }
    BOOL v15 = 1;
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
LABEL_16:
  [(NPSServer *)self deleteCacheForDomain:v9 isPerGizmo:v5];
  BOOL v15 = 1;
LABEL_21:

  return v15;
}

- (BOOL)deleteCacheForDomain:(id)a3 isPerGizmo:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v6;
    __int16 v21 = 1024;
    BOOL v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Deleting cache for domain: (%@); isPerGizmo: (%d)",
      buf,
      0x12u);
  }
  id v8 = [(NPSServer *)self cachePathForDomain:v6 isPerGizmo:v4];
  if (v8)
  {
    id v9 = +[NSFileManager defaultManager];
    id v10 = +[NSFileManager defaultManager];
    unsigned __int8 v11 = [v10 fileExistsAtPath:v8];

    if (v11)
    {
      id v18 = 0;
      [v9 removeItemAtPath:v8 error:&v18];
      id v12 = v18;
      if (v12)
      {
        id v13 = v12;
        int v14 = nps_daemon_log;
        if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v20 = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to delete cache for domain: %@", buf, 0xCu);
        }

        BOOL v15 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      __int16 v16 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Cache for domain (%@) does not exist.", buf, 0xCu);
      }
    }
    BOOL v15 = 1;
LABEL_13:

    goto LABEL_14;
  }
  BOOL v15 = 0;
LABEL_14:

  return v15;
}

- (void)updateCacheForDomain:(id)a3 keys:(id)a4 twoWaySyncTimestamp:(id)a5 isPerGizmo:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v11 count])
  {
    __int16 v21 = self;
    id v24 = v10;
    BOOL v23 = v6;
    id v13 = [(NPSServer *)self readCacheFromDiskForDomain:v10 isPerGizmo:v6];
    if (!v13) {
      id v13 = objc_opt_new();
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v22 = v11;
    id obj = v11;
    id v14 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          id v19 = [v13 objectForKeyedSubscript:v18];
          if (!v19)
          {
            id v19 = objc_opt_new();
            [v13 setObject:v19 forKeyedSubscript:v18];
          }
          id v20 = nps_daemon_log;
          if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            id v31 = v24;
            __int16 v32 = 2112;
            uint64_t v33 = v18;
            __int16 v34 = 2112;
            id v35 = v12;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Updating timestamp for <%@; %@> to %@",
              buf,
              0x20u);
          }
          [v19 setObject:v12 forKeyedSubscript:@"timestamp"];
        }
        id v15 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
      }
      while (v15);
    }

    id v10 = v24;
    [(NPSServer *)v21 writeCache:v13 toDiskForDomain:v24 isPerGizmo:v23];

    id v11 = v22;
  }
}

- (id)restoreRemoteSettingsFromBackup
{
  id v3 = (void *)os_transaction_create();
  +[NSFileManager defaultManager];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  __int16 v21 = sub_1000119F8;
  id v22 = sub_100011A24;
  id v23 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100011A2C;
  v14[3] = &unk_10003D0C0;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = self;
  id v17 = &v18;
  id v15 = v4;
  BOOL v5 = objc_retainBlock(v14);
  BOOL v6 = (void *)v19[5];
  void v19[5] = (uint64_t)v5;

  id v7 = [(NPSDeviceRegistry *)self->_deviceRegistry userDefaultsBackupDirectoryPath];
  unsigned int v8 = [v4 fileExistsAtPath:v7];
  id v9 = nps_daemon_log;
  BOOL v10 = os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Restoring remote settings from backup at path (%@)", buf, 0xCu);
    }
    id v11 = (*(void (**)(void))(v19[5] + 16))();
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No remote settings backup directory (%@)", buf, 0xCu);
    }
    id v11 = 0;
  }
  id v12 = (void *)v19[5];
  void v19[5] = 0;

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (id)restoreRemoteFilesFromBackup
{
  id v3 = (void *)os_transaction_create();
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_100006068;
  id v12 = sub_100006078;
  id v13 = 0;
  id v4 = [(NPSServer *)self fileBackupManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011E28;
  v7[3] = &unk_10003D0E8;
  v7[4] = self;
  v7[5] = &v8;
  [v4 enumerateFileBackupsUsingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)restoreFileBackupForLocalFileURL:(id)a3 originalFileURL:(id)a4 isInitialSync:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v49 = v9;
    __int16 v50 = 2112;
    id v51 = v8;
    __int16 v52 = 1024;
    LODWORD(v53) = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Restoring remote file (%@) stored locally at (%@); isInitialSync: (%d)",
      buf,
      0x1Cu);
  }
  if (v5)
  {
    id v47 = 0;
    id v46 = 0;
    unsigned int v11 = [v8 getResourceValue:&v47 forKey:NSURLFileSizeKey error:&v46];
    id v12 = v47;
    id v13 = v46;
    if (v11) {
      BOOL v14 = v13 == 0;
    }
    else {
      BOOL v14 = 0;
    }
    if (!v14)
    {
      id v15 = v13;
      uint64_t v16 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v49 = v8;
        __int16 v50 = 2112;
        id v51 = v15;
        __int16 v52 = 1024;
        LODWORD(v53) = v11;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to retrieve file size for file URL: (%@) with error: (%@); result: (%d)",
          buf,
          0x1Cu);
      }
      id v17 = v15;
      goto LABEL_23;
    }
  }
  else
  {
    id v12 = 0;
  }
  id v43 = v8;
  uint64_t v18 = objc_opt_new();
  id v19 = +[NPSKeyedArchiverUtil archiveObject:v9];
  [v18 setFileURL:v19];

  __int16 v42 = v9;
  uint64_t v20 = [(id)objc_opt_class() queueOneIdentifierForFileBackupMsg:v9];
  id v39 = v18;
  uint64_t v21 = [v18 data];
  v58[0] = @"type";
  v58[1] = @"content";
  v59[0] = &off_10003E9E8;
  v59[1] = v21;
  uint64_t v40 = (void *)v21;
  id v22 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:2];
  id v23 = [(NPSDeviceRegistry *)self->_deviceRegistry activeDevice];
  id v24 = +[NPSDeviceRegistry idsDestinationIDForNRDevice:v23 withIdsService:self->_idsService];

  id v41 = (void *)v20;
  if (v24)
  {
    id v25 = [(NPSServer *)self idsService];
    +[NSSet setWithObject:v24];
    v27 = id v26 = v12;
    v56[0] = IDSSendMessageOptionTimeoutKey;
    [(id)objc_opt_class() maxSendTimeout];
    long long v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v57[0] = v28;
    v57[1] = &__kCFBooleanTrue;
    v56[1] = IDSSendMessageOptionBypassDuetKey;
    v56[2] = IDSSendMessageOptionQueueOneIdentifierKey;
    v57[2] = v20;
    long long v29 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:3];
    id v44 = 0;
    id v45 = 0;
    [v25 sendResourceAtURL:v43 metadata:v22 toDestinations:v27 priority:200 options:v29 identifier:&v45 error:&v44];
    id v30 = v45;
    id v17 = v44;

    id v12 = v26;
  }
  else
  {
    NSErrorUserInfoKey v54 = NSLocalizedDescriptionKey;
    CFStringRef v55 = @"NPS should not try syncing when there is no active device";
    id v25 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    id v17 = +[NSError errorWithDomain:@"com.apple.NanoPreferencesSync" code:1 userInfo:v25];
    id v30 = 0;
  }

  id v31 = nps_daemon_log;
  BOOL v32 = os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    id v9 = v42;
    id v8 = v43;
    if (v32)
    {
      uint64_t v33 = v31;
      __int16 v34 = [v39 fileURL];
      *(_DWORD *)buf = 138412802;
      id v49 = v43;
      __int16 v50 = 2112;
      id v51 = v34;
      __int16 v52 = 2112;
      id v53 = v17;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Failed to send file resource (%@) for backup at (%@) with error: (%@)", buf, 0x20u);
    }
    id v35 = v17;
  }
  else
  {
    id v9 = v42;
    if (v32)
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v30;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Successfully sent file backup with identifier (%@)", buf, 0xCu);
    }
    database = self->_database;
    id v37 = [v42 path];
    [(NPSDatabase *)database sentFileBackupMessage:v30 forFileAtPath:v37];

    -[NPSServer registerSyncMessageWithIdentifier:size:](self, "registerSyncMessageWithIdentifier:size:", v30, (char *)[v12 unsignedLongLongValue] + (void)objc_msgSend(v40, "length"));
    id v8 = v43;
  }

LABEL_23:
  return v17;
}

- (id)createDirectoryIfNeeded:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[NSFileManager defaultManager];
    if ([v4 fileExistsAtPath:v3])
    {
      id v5 = 0;
    }
    else
    {
      NSFileAttributeKey v15 = NSFileProtectionKey;
      NSFileProtectionType v16 = NSFileProtectionNone;
      id v7 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      id v10 = 0;
      [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:v7 error:&v10];
      id v5 = v10;

      if (v5)
      {
        id v8 = nps_daemon_log;
        if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v12 = v3;
          __int16 v13 = 2112;
          id v14 = v5;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to create backup directory (%@) with error: (%@)", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    BOOL v6 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Requested to create directory with nil path", buf, 2u);
    }
    id v5 = 0;
  }

  return v5;
}

- (id)backupPathForDomain:(id)a3 container:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NPSDeviceRegistry *)self->_deviceRegistry userDefaultsBackupDirectoryPath];
  id v9 = v8;
  if (v7)
  {
    id v10 = [v8 stringByAppendingPathComponent:v7];
  }
  else
  {
    id v10 = v8;
  }
  unsigned int v11 = v10;
  id v12 = [v10 stringByAppendingPathComponent:v6];
  __int16 v13 = [v12 stringByStandardizingPath];

  if ([v13 hasPrefix:v9])
  {
    id v14 = v13;
  }
  else
  {
    NSFileAttributeKey v15 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to resolve backup path for domain: (%@) for container: (%@)", (uint8_t *)&v17, 0x16u);
    }
    id v14 = 0;
  }

  return v14;
}

- (void)usingPrefsFromDomain:(id)a3
{
  id v5 = a3;
  currentlyUsedDomain = self->_currentlyUsedDomain;
  p_currentlyUsedDomain = &self->_currentlyUsedDomain;
  id v8 = v5;
  if (([v5 isEqualToString:currentlyUsedDomain] & 1) == 0)
  {
    objc_storeStrong((id *)p_currentlyUsedDomain, a3);
    CFPreferencesFlushCaches();
  }
}

- (id)sendSetting:(id)a3 keys:(id)a4 allowedSyncGroups:(id)a5 messageIdentifier:(id *)a6 messageData:(id *)a7 cloudEnabled:(BOOL)a8 backupFile:(id)a9
{
  BOOL v9 = a8;
  id v14 = a3;
  id v68 = a4;
  v78 = (uint64_t (*)(uint64_t, uint64_t))a5;
  id v15 = a9;
  NSFileProtectionType v16 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[NPSServer sendSetting:keys:allowedSyncGroups:messageIdentifier:messageData:cloudEnabled:backupFile:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v68;
    *(_WORD *)&buf[22] = 2112;
    id v98 = v78;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: keys: %@; syncGroups: %@", buf, 0x20u);
  }
  v76 = v14;
  if (v14)
  {
    uint64_t v64 = a6;
    id v65 = a7;
    BOOL v63 = v9;
    v66 = v15;
    [v14 synchronizeForReading];
    v75 = objc_opt_new();
    int v17 = [v14 domain];
    [v75 setDomain:v17];

    id v18 = objc_opt_new();
    [v75 setKeys:v18];

    +[NSDate timeIntervalSinceReferenceDate];
    objc_msgSend(v75, "setTimestamp:");
    __int16 v19 = [(NPSSettings *)self->_settings syncedUserDefaults];
    id v20 = [v14 domain];
    id v70 = [v19 objectForKeyedSubscript:v20];

    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id obj = v68;
    id v72 = [obj countByEnumeratingWithState:&v86 objects:v101 count:16];
    if (v72)
    {
      uint64_t v21 = 0;
      id v22 = 0;
      uint64_t v71 = *(void *)v87;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v87 != v71)
          {
            uint64_t v24 = v23;
            objc_enumerationMutation(obj);
            uint64_t v23 = v24;
          }
          uint64_t v73 = v23;
          uint64_t v25 = *(void *)(*((void *)&v86 + 1) + 8 * v23);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&uint8_t buf[16] = 0x3032000000;
            id v98 = sub_100006068;
            __int16 v99 = sub_100006078;
            id v26 = [v70 keyArrays];
            id v100 = [v26 objectForKeyedSubscript:v25];

            uint64_t v27 = *(void *)&buf[8];
            if (!*(void *)(*(void *)&buf[8] + 40))
            {
              long long v28 = [v70 keyPrefixArrays];
              v85[0] = _NSConcreteStackBlock;
              v85[1] = 3221225472;
              v85[2] = sub_100013144;
              v85[3] = &unk_10003CFA0;
              v85[4] = v25;
              v85[5] = buf;
              [v28 enumerateKeysAndObjectsUsingBlock:v85];

              uint64_t v27 = *(void *)&buf[8];
            }
            long long v83 = 0u;
            long long v84 = 0u;
            long long v81 = 0u;
            long long v82 = 0u;
            id v77 = *(id *)(v27 + 40);
            id v29 = [v77 countByEnumeratingWithState:&v81 objects:v96 count:16];
            id v30 = v21;
            if (v29)
            {
              uint64_t v31 = *(void *)v82;
              do
              {
                for (i = 0; i != v29; i = (char *)i + 1)
                {
                  if (*(void *)v82 != v31) {
                    objc_enumerationMutation(v77);
                  }
                  uint64_t v33 = *(void **)(*((void *)&v81 + 1) + 8 * i);
                  __int16 v34 = [v33 syncGroups];
                  unsigned __int8 v35 = +[NPSServer shouldAllowSyncOfItemWithSyncGroups:v34 allowedSyncGroups:v78];

                  if (v35)
                  {
                    if ([v33 twoWaySync]
                      && ([v33 syncGroups],
                          id v36 = objc_claimAutoreleasedReturnValue(),
                          unsigned int v37 = +[NPSServer shouldAllowSyncOfItemWithSyncGroups:v36 allowedSyncGroups:v78], v36, v37))
                    {
                      id v38 = v30;
                      if (!v30) {
                        id v38 = objc_opt_new();
                      }
                      [v38 addObject:v25];
                    }
                    else
                    {
                      id v38 = v30;
                    }
                    id v30 = v38;
                    uint64_t v40 = objc_opt_new();
                    [v40 setKey:v25];
                    if ([v33 twoWaySync])
                    {
                      [v40 setTwoWaySync:1];
                      [v75 timestamp];
                      objc_msgSend(v40, "setTimestamp:");
                    }
                    id v80 = v22;
                    id v41 = [v76 serializedObjectForKey:v25 error:&v80];
                    id v42 = v80;

                    if (v42)
                    {
                      id v43 = nps_daemon_log;
                      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)id v90 = 136315650;
                        long long v91 = "-[NPSServer sendSetting:keys:allowedSyncGroups:messageIdentifier:messageData:cloudEnabled:backupFile:]";
                        __int16 v92 = 2112;
                        uint64_t v93 = v25;
                        __int16 v94 = 2112;
                        id v95 = v42;
                        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%s: Error serializing object for key %@. Error: %@", v90, 0x20u);
                      }
                    }
                    else
                    {
                      [v40 setValue:v41];
                      id v44 = [v75 keys];
                      [v44 addObject:v40];
                    }
                    id v22 = v42;
                  }
                  else
                  {
                    id v39 = nps_daemon_log;
                    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)id v90 = 136315138;
                      long long v91 = "-[NPSServer sendSetting:keys:allowedSyncGroups:messageIdentifier:messageData:cloudEnabled:backupFile:]";
                      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%s: Not allowed to sync items in this sync groups.", v90, 0xCu);
                    }
                  }
                }
                id v29 = [v77 countByEnumeratingWithState:&v81 objects:v96 count:16];
              }
              while (v29);
            }
            uint64_t v21 = v30;

            _Block_object_dispose(buf, 8);
          }
          else
          {
            id v45 = nps_daemon_log;
            if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v25;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Key (%@) is not a String.", buf, 0xCu);
            }
          }
          uint64_t v23 = v73 + 1;
        }
        while ((id)(v73 + 1) != v72);
        id v72 = [obj countByEnumeratingWithState:&v86 objects:v101 count:16];
      }
      while (v72);
    }
    else
    {
      uint64_t v21 = 0;
      id v22 = 0;
    }

    double v48 = [v75 keys];
    id v49 = [v48 count];

    if (v49)
    {
      __int16 v50 = [v75 data];
      id v51 = v50;
      if (v65) {
        id *v65 = v50;
      }
      if (v66)
      {
        [v66 writeMessage:0 data:v51];
        id v52 = 0;
      }
      else
      {
        if ([v76 type] == (id)1)
        {
          id v53 = [v76 domain];
          id v54 = [v53 isEqualToString:@"com.apple.pairedsync"];
        }
        else
        {
          id v54 = 0;
        }
        CFStringRef v55 = [(id)objc_opt_class() queueOneIdentifierForUserDefaultsMsg:v75];
        id v79 = 0;
        uint64_t v56 = [(NPSServer *)self sendMessageData:v51 messageType:0 queueOneIdentifier:v55 identifier:&v79 isPairedSyncMessage:v54 cloudEnabled:v63];
        id v52 = v79;

        if (v64) {
          *uint64_t v64 = v52;
        }
        BOOL v57 = [v76 type] == (id)1;
        long long v58 = [v76 domain];
        [v75 timestamp];
        BOOL v59 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [(NPSServer *)self updateCacheForDomain:v58 keys:v21 twoWaySyncTimestamp:v59 isPerGizmo:v57];

        if (!v56)
        {
          database = self->_database;
          id v61 = [v76 domain];
          [(NPSDatabase *)database sentSettingsSyncMessage:v52 forDomain:v61 keys:obj cloudEnabled:v63];
        }
        id v22 = (void *)v56;
      }
    }
    id v47 = v22;

    id v15 = v66;
  }
  else
  {
    id v46 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[NPSServer sendSetting:keys:allowedSyncGroups:messageIdentifier:messageData:cloudEnabled:backupFile:]";
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%s: Settings accessor not passed.", buf, 0xCu);
    }
    id v47 = 0;
  }

  return v47;
}

+ (id)queueOneIdentifierForUserDefaultsMsg:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = [v3 keys];
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v26 + 1) + 8 * i) key];
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  unsigned int v11 = [v4 allObjects];
  id v12 = [v11 sortedArrayUsingSelector:"compare:"];

  id v13 = [objc_alloc((Class)NSMutableString) initWithString:@"UserDefaults/"];
  id v14 = [v3 domain];
  [v13 appendString:v14];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v15 = v12;
  id v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v22 + 1) + 8 * (void)j);
        objc_msgSend(v13, "appendString:", @"|", (void)v22);
        [v13 appendString:v20];
      }
      id v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }

  return v13;
}

- (id)sendSettingsBackupInDomain:(id)a3 keys:(id)a4 container:(id)a5 isInitialSync:(BOOL)a6 backupFile:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  uint64_t v60 = 0;
  id v61 = (id *)&v60;
  uint64_t v62 = 0x3032000000;
  BOOL v63 = sub_100006068;
  uint64_t v64 = sub_100006078;
  id v65 = 0;
  id v47 = +[NSFileManager defaultManager];
  id v44 = self;
  id v15 = [(NPSDeviceRegistry *)self->_deviceRegistry userDefaultsBackupDirectoryPath];
  id v16 = v15;
  id v46 = v14;
  if (v13)
  {
    uint64_t v17 = [v15 stringByAppendingPathComponent:v13];

    id v16 = (void *)v17;
  }
  uint64_t v18 = [v16 stringByAppendingPathComponent:v11];

  __int16 v19 = +[NSData dataWithContentsOfFile:v18];
  if (v19)
  {
    uint64_t v20 = v61;
    id obj = 0;
    id v45 = +[NSPropertyListSerialization propertyListWithData:v19 options:0 format:0 error:&obj];
    objc_storeStrong(v20 + 5, obj);
    if (v61[5])
    {
      uint64_t v21 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = v61[5];
        *(_DWORD *)buf = 138413058;
        id v68 = v11;
        __int16 v69 = 2112;
        id v70 = v19;
        __int16 v71 = 2112;
        id v72 = v13;
        __int16 v73 = 2112;
        id v74 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Failed to unserialize domain (%@) backup (%@) for container (%@) with error: (%@)", buf, 0x2Au);
      }
      id v23 = 0;
    }
    else
    {
      long long v25 = objc_opt_new();
      long long v26 = objc_opt_new();
      [v26 setContainer:v13];
      [v26 setDomain:v11];
      id v27 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v45, "count"));
      [v26 setKeys:v27];

      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_100013A20;
      v53[3] = &unk_10003D110;
      id v39 = v11;
      id v54 = v39;
      id v38 = v13;
      id v55 = v38;
      long long v58 = &v60;
      id v28 = v26;
      id v56 = v28;
      id v40 = v25;
      id v57 = v40;
      [v45 enumerateKeysAndObjectsUsingBlock:v53];
      id v42 = v28;
      id v43 = [v28 data];
      if (v46)
      {
        [v46 writeMessage:0 data:v43];
        id v41 = 0;
        id v23 = 0;
      }
      else
      {
        unsigned int v37 = [(id)objc_opt_class() queueOneIdentifierForUserDefaultsBackupMsg:v28];
        id v52 = 0;
        uint64_t v29 = [(NPSServer *)v44 sendMessageData:v43 messageType:2 queueOneIdentifier:v37 identifier:&v52 cloudEnabled:0];
        id v41 = v52;
        id v30 = v61[5];
        v61[5] = (id)v29;

        if (v61[5])
        {
          id v23 = 0;
        }
        else
        {
          -[NPSServer registerSyncMessageWithIdentifier:size:](v44, "registerSyncMessageWithIdentifier:size:", v41, [v43 length]);
          if (!v12)
          {
            id v12 = (id)objc_opt_new();
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            uint64_t v31 = [v42 keys];
            id v32 = [v31 countByEnumeratingWithState:&v48 objects:v66 count:16];
            if (v32)
            {
              uint64_t v33 = *(void *)v49;
              do
              {
                for (i = 0; i != v32; i = (char *)i + 1)
                {
                  if (*(void *)v49 != v33) {
                    objc_enumerationMutation(v31);
                  }
                  unsigned __int8 v35 = [*(id *)(*((void *)&v48 + 1) + 8 * i) key];
                  [v12 addObject:v35];
                }
                id v32 = [v31 countByEnumeratingWithState:&v48 objects:v66 count:16];
              }
              while (v32);
            }
          }
          [(NPSDatabase *)v44->_database sentSettingsBackupMessage:v41 forContainer:v38 domain:v39 keys:v12];
          id v23 = v40;
        }
      }
    }
  }
  else
  {
    long long v24 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v68 = v11;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Remote backup for domain (%@) is empty; Deleting the associated .plist",
        buf,
        0xCu);
    }
    [v47 removeItemAtPath:v18 error:0];
    id v23 = 0;
  }

  _Block_object_dispose(&v60, 8);
  return v23;
}

+ (id)queueOneIdentifierForUserDefaultsBackupMsg:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = [v3 keys];
  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v29 + 1) + 8 * i) key];
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v7);
  }

  id v11 = [v4 allObjects];
  id v12 = [v11 sortedArrayUsingSelector:"compare:"];

  id v13 = [objc_alloc((Class)NSMutableString) initWithString:@"UserDefaultsBackup/"];
  uint64_t v14 = [v3 container];
  id v15 = (void *)v14;
  if (v14) {
    CFStringRef v16 = (const __CFString *)v14;
  }
  else {
    CFStringRef v16 = &stru_10003DD30;
  }
  uint64_t v17 = [v3 domain];
  [v13 appendFormat:@"%@|%@", v16, v17];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v18 = v12;
  id v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v25 + 1) + 8 * (void)j);
        [v13 appendString:@"|"];
        [v13 appendString:v23];
      }
      id v20 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }

  return v13;
}

- (BOOL)doesCurrentDeviceSupportGroupedTwoWayKeys
{
  CFStringRef v2 = [(NPSDeviceRegistry *)self->_deviceRegistry activeDevice];
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F4DCA831-3D30-45BC-BDCC-E99D0E482D94"];
  unsigned __int8 v4 = [v2 supportsCapability:v3];

  return v4;
}

- (id)getCachedTimeStampFor:(id)a3 key:(id)a4 usePerGizmoCache:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v8;
    if (v5) {
      CFStringRef v11 = @"YES";
    }
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2114;
    CFStringRef v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Reading cache for domain: (%@); key: (%@); isPerGizmo: (%{public}@)",
      buf,
      0x20u);
  }
  id v12 = [(NPSServer *)self cachePathForDomain:v8 isPerGizmo:v5];
  if (v12)
  {
    id v18 = 0;
    id v13 = +[NSData dataWithContentsOfFile:v12 options:1 error:&v18];
    id v14 = v18;
    if (v14 || !v13)
    {
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_ERROR)) {
        sub_100028C74();
      }
      id v15 = 0;
    }
    else
    {
      *(void *)buf = 0;
      +[NSSet setWithObject:v9];
      _CFPropertyListCreateFiltered();
      id v15 = [*(id *)buf objectForKey:v9];
      if (*(void *)buf) {
        CFRelease(*(CFTypeRef *)buf);
      }
    }
  }
  else
  {
    id v15 = 0;
    id v14 = 0;
  }
  CFStringRef v16 = [v15 objectForKeyedSubscript:@"timestamp"];

  return v16;
}

- (id)newDefaultsMsgWithDomain:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = objc_opt_new();
  [v4 setDomain:v3];

  BOOL v5 = objc_opt_new();
  [v4 setKeys:v5];

  return v4;
}

- (void)sendUserDefaultMsg:(id)a3 forDomain:(id)a4 includedKeys:(id)a5 cloudEnabled:(BOOL)a6 backupFile:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  CFStringRef v16 = (void *)nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = v16;
    *(_DWORD *)buf = 138412546;
    id v26 = v13;
    __int16 v27 = 2050;
    id v28 = [v14 count];
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Sending user defaults message for <Domain: %@, Keys: %{public}lu>", buf, 0x16u);
  }
  id v18 = [v12 data];
  id v19 = [v13 isEqualToString:@"com.apple.pairedsync"];
  if (v15)
  {
    [v15 writeMessage:0 data:v18];
  }
  else
  {
    id v20 = v19;
    id v21 = [(id)objc_opt_class() queueOneIdentifierForUserDefaultsMsg:v12];
    id v24 = 0;
    __int16 v22 = [(NPSServer *)self sendMessageData:v18 messageType:0 queueOneIdentifier:v21 identifier:&v24 isPairedSyncMessage:v20 cloudEnabled:v8];
    id v23 = v24;
    -[NPSServer registerInitialSyncMessage:ofSize:orReportInitialSyncFailureWithError:](self, "registerInitialSyncMessage:ofSize:orReportInitialSyncFailureWithError:", v23, [v18 length], v22);
    if (!v22) {
      [(NPSDatabase *)self->_database sentSettingsSyncMessage:v23 forDomain:v13 keys:v14 cloudEnabled:v8];
    }
  }
}

- (void)sendSettingsInDomain:(id)a3 keys:(id)a4 cloudEnabled:(BOOL)a5 backupFile:(id)a6 allowedGroups:(id)a7
{
  BOOL v66 = a5;
  id v76 = a3;
  id v10 = a4;
  id v65 = a6;
  id v11 = a7;
  id v12 = (void *)nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    id v14 = [v10 count];
    CFStringRef v15 = @"NO";
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v76;
    if (v66) {
      CFStringRef v15 = @"YES";
    }
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2114;
    long long v97 = (uint64_t (*)(uint64_t, uint64_t))v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Start sending settings in Domain: %{public}@ \t             Keys: %lu\t             cloudEnabled: %{public}@", buf, 0x20u);
  }
  id v73 = v11;
  BOOL v63 = v73;
  if (!v73)
  {
    id v73 = [(NPSServer *)self allowedGroups];
  }
  CFStringRef v16 = [(NPSSettings *)self->_settings syncedUserDefaults];
  uint64_t v60 = [v16 objectForKeyedSubscript:v76];

  long long v85 = 0u;
  long long v86 = 0u;
  long long v84 = 0u;
  long long v83 = 0u;
  id obj = v10;
  id v59 = [obj countByEnumeratingWithState:&v83 objects:v100 count:16];
  if (v59)
  {
    id v68 = 0;
    __int16 v69 = 0;
    uint64_t v64 = 0;
    uint64_t v58 = *(void *)v84;
    do
    {
      for (i = 0; i != v59; i = (char *)i + 1)
      {
        if (*(void *)v84 != v58) {
          objc_enumerationMutation(obj);
        }
        id v72 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        if (!v68)
        {
          id v68 = [(NPSServer *)self newDefaultsMsgWithDomain:v76];
          uint64_t v17 = objc_opt_new();

          uint64_t v64 = (void *)v17;
        }
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        long long v97 = sub_100006068;
        id v98 = sub_100006078;
        id v18 = [v60 keyArrays];
        id v99 = [v18 objectForKeyedSubscript:v72];

        if (![*(id *)(*(void *)&buf[8] + 40) count])
        {
          id v19 = [v60 keyPrefixArrays];
          v82[0] = _NSConcreteStackBlock;
          v82[1] = 3221225472;
          v82[2] = sub_100015074;
          v82[3] = &unk_10003CFA0;
          v82[4] = v72;
          v82[5] = buf;
          [v19 enumerateKeysAndObjectsUsingBlock:v82];
        }
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v70 = *(id *)(*(void *)&buf[8] + 40);
        id v20 = [v70 countByEnumeratingWithState:&v78 objects:v95 count:16];
        if (v20)
        {
          uint64_t v74 = *(void *)v79;
          do
          {
            id v75 = v20;
            for (j = 0; j != v75; j = (char *)j + 1)
            {
              if (*(void *)v79 != v74) {
                objc_enumerationMutation(v70);
              }
              __int16 v22 = *(void **)(*((void *)&v78 + 1) + 8 * (void)j);
              id v23 = [v22 syncGroups];
              unsigned __int8 v24 = +[NPSServer shouldAllowSyncOfItemWithSyncGroups:v23 allowedSyncGroups:v73];

              if (v24)
              {
                if ([v22 isPerGizmoSetting]
                  && ([v22 isMirroring] & 1) == 0)
                {
                  id v28 = [[NPSSettingAccessor alloc] initWithNanoDomain:v76];
                }
                else
                {
                  long long v25 = [NPSSettingAccessor alloc];
                  id v26 = [v22 container];
                  __int16 v27 = [v22 appGroupContainer];
                  id v28 = [(NPSSettingAccessor *)v25 initWithUserDefaultsDomain:v76 container:v26 appGroupContainer:v27];
                }
                if ([(NPSSettingAccessor *)v28 requiresDeviceUnlockedSinceBoot]
                  && (int v30 = MKBDeviceUnlockedSinceBoot(), v30 <= 0))
                {
                  id v41 = nps_daemon_log;
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                  {
                    id v42 = [v22 container];
                    *(_DWORD *)long long v87 = 138544130;
                    id v88 = v42;
                    __int16 v89 = 2114;
                    id v90 = v76;
                    __int16 v91 = 2114;
                    __int16 v92 = v72;
                    __int16 v93 = 1024;
                    int v94 = v30;
                    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Requested to mirror containerized settings (%{public}@, %{public}@, %{public}@) before first unlock (%d); Stashing in database.",
                      v87,
                      0x26u);
                  }
                  id v43 = v69;
                  if (!v69) {
                    id v43 = objc_opt_new();
                  }
                  __int16 v69 = v43;
                  [v43 addObject:v72];
                }
                else if (![v22 twoWaySync] {
                       || -[NPSServer doesCurrentDeviceSupportGroupedTwoWayKeys](self, "doesCurrentDeviceSupportGroupedTwoWayKeys")|| (unint64_t)[obj count] < 2)
                }
                {
                  uint64_t v33 = [(NPSSettingAccessor *)v28 typeString];
                  __int16 v34 = [v76 stringByAppendingFormat:@" | %@", v33];

                  if ([(NPProgressTracker *)self->_syncProgressTracker canStartOperation:v34])
                  {
                    [(NPSSettingAccessor *)v28 synchronizeForReading];
                    if (![(NPSSettingAccessor *)v28 sizeSafeToLoadInMemory])
                    {
                      unsigned __int8 v35 = nps_daemon_log;
                      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)long long v87 = 138543362;
                        id v88 = v76;
                        _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "<%{public}@>Domain size not safe to load in memory. Trying to send it once.", v87, 0xCu);
                      }
                      [(NPProgressTracker *)self->_syncProgressTracker addToProblematicOperationSet:v34];
                    }
                    id v77 = 0;
                    id v36 = [(NPSSettingAccessor *)v28 serializedObjectForKey:v72 error:&v77];
                    id v37 = v77;
                    if (v37)
                    {
                      id v38 = nps_daemon_log;
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                      {
                        id v39 = [v37 localizedDescription];
                        *(_DWORD *)long long v87 = 138543874;
                        id v88 = v76;
                        __int16 v89 = 2114;
                        id v90 = v72;
                        __int16 v91 = 2112;
                        __int16 v92 = v39;
                        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Failed to serialize value for <Domain: %{public}@; Key: %{public}@> (Error: %@)",
                          v87,
                          0x20u);
                      }
                    }
                    else
                    {
                      +[NSDate timeIntervalSinceReferenceDate];
                      id v38 = -[NPSServer getCachedTimeStampFor:key:usePerGizmoCache:](self, "getCachedTimeStampFor:key:usePerGizmoCache:", v76, v72, [v22 isPerGizmoSetting]);
                      if (![v22 twoWaySync] || v38 || v36)
                      {
                        [v38 doubleValue];
                        double v46 = v45;
                        objc_msgSend(v68, "setTimestamp:");
                        id v47 = objc_opt_new();
                        [v47 setKey:v72];
                        if ([v22 twoWaySync])
                        {
                          [v47 setTwoWaySync:1];
                          [v47 setTimestamp:v46];
                        }
                        [v47 setValue:v36];
                        long long v48 = [v68 keys];
                        [v48 addObject:v47];

                        [v64 addObject:v72];
                        long long v49 = [v68 data];
                        if ((unint64_t)[v49 length] <= 0xC831)
                        {
                        }
                        else
                        {
                          long long v50 = [v68 keys];
                          BOOL v51 = [v50 count] == 0;

                          if (!v51)
                          {
                            id v52 = nps_daemon_log;
                            if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_WORD *)long long v87 = 0;
                              _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Message size reached max allowed size. Sending current default message.", v87, 2u);
                            }
                            [(NPSServer *)self sendUserDefaultMsg:v68 forDomain:v76 includedKeys:v64 cloudEnabled:v66 backupFile:v65];

                            [v64 removeAllObjects];
                            id v68 = 0;
                          }
                        }
                      }
                      else
                      {
                        id v44 = nps_daemon_log;
                        if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)long long v87 = 138543618;
                          id v88 = v76;
                          __int16 v89 = 2114;
                          id v90 = v72;
                          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "No cached timestamp, and value is null. Not sending value for <Domain: %{public}@; Key: %{public}@>.",
                            v87,
                            0x16u);
                        }
                      }
                    }
                  }
                  else
                  {
                    id v40 = nps_daemon_log;
                    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)long long v87 = 138412546;
                      id v88 = v76;
                      __int16 v89 = 2112;
                      id v90 = v72;
                      _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Skipping <%@; %@>.",
                        v87,
                        0x16u);
                    }
                  }
                }
                else
                {
                  long long v31 = +[NSSet setWithObject:v72];
                  [(NPSServer *)self sendSettingsInDomain:v76 keys:v31 cloudEnabled:v66 backupFile:v65 allowedGroups:v63];

                  long long v32 = nps_daemon_log;
                  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)long long v87 = 138543618;
                    id v88 = v76;
                    __int16 v89 = 2114;
                    id v90 = v72;
                    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Sent <Domain: %{public}@; Key: %{public}@> as individual default sync message.",
                      v87,
                      0x16u);
                  }
                }
              }
              else
              {
                id v28 = (NPSSettingAccessor *)nps_daemon_log;
                if (os_log_type_enabled(&v28->super, OS_LOG_TYPE_DEFAULT))
                {
                  long long v29 = [v22 syncGroups];
                  *(_DWORD *)long long v87 = 138543618;
                  id v88 = v29;
                  __int16 v89 = 2114;
                  id v90 = v72;
                  _os_log_impl((void *)&_mh_execute_header, &v28->super, OS_LOG_TYPE_DEFAULT, "Not allowed to sync groups %{public}@. Skipping key %{public}@.", v87, 0x16u);
                }
              }
            }
            id v20 = [v70 countByEnumeratingWithState:&v78 objects:v95 count:16];
          }
          while (v20);
        }

        _Block_object_dispose(buf, 8);
      }
      id v59 = [obj countByEnumeratingWithState:&v83 objects:v100 count:16];
    }
    while (v59);
  }
  else
  {
    id v68 = 0;
    __int16 v69 = 0;
    uint64_t v64 = 0;
  }

  if ([v69 count]) {
    [(NPSDatabase *)self->_database sentSettingsSyncMessage:0 forDomain:v76 keys:v69 cloudEnabled:v66];
  }
  id v53 = [v68 keys];
  BOOL v54 = [v53 count] == 0;

  if (!v54) {
    [(NPSServer *)self sendUserDefaultMsg:v68 forDomain:v76 includedKeys:v64 cloudEnabled:v66 backupFile:v65];
  }
  id v55 = (void *)nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v56 = v55;
    id v57 = [obj count];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v76;
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = v57;
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "[STATS] Completed sending settings in <Domain: %{public}@; Keys: %lul>.",
      buf,
      0x16u);
  }
}

- (void)sendPUDSettingsInDomain:(id)a3 keys:(id)a4 backupFile:(id)a5 allowedGroups:(id)a6
{
  id v66 = a3;
  id v9 = a4;
  id v56 = a5;
  id v10 = (uint64_t (*)(uint64_t, uint64_t))a6;
  id v11 = (void *)nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v66;
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = [v9 count];
    *(_WORD *)&buf[22] = 2112;
    long long v80 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Start sending permitted defaults in Domain: %{public}@ \t            Keys: %lu\t AllowedGroups: %@", buf, 0x20u);
  }
  BOOL v63 = v10;
  id v55 = v63;
  if (!v63)
  {
    BOOL v63 = [(NPSServer *)self allowedGroups];
  }
  id v13 = [(NPSSettings *)self->_settings permittedUserDefaults];
  id v65 = [v13 objectForKeyedSubscript:v66];

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = v9;
  id v62 = [obj countByEnumeratingWithState:&v69 objects:v83 count:16];
  if (!v62)
  {
    uint64_t v60 = 0;
    id v14 = 0;
    goto LABEL_59;
  }
  id v14 = 0;
  uint64_t v61 = *(void *)v70;
  uint64_t v60 = 0;
  do
  {
    for (i = 0; i != v62; i = (char *)i + 1)
    {
      if (*(void *)v70 != v61) {
        objc_enumerationMutation(obj);
      }
      CFStringRef v16 = *(uint64_t (**)(uint64_t, uint64_t))(*((void *)&v69 + 1) + 8 * i);
      if (!v14)
      {
        id v14 = [(NPSServer *)self newDefaultsMsgWithDomain:v66];
        uint64_t v18 = objc_opt_new();

        uint64_t v60 = (void *)v18;
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      long long v80 = sub_100006068;
      long long v81 = sub_100006078;
      id v19 = [v65 keys];
      id v82 = [v19 objectForKeyedSubscript:v16];

      id v20 = *(void **)(*(void *)&buf[8] + 40);
      if (!v20)
      {
        id v21 = [v65 keyPrefixes];
        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472;
        v68[2] = sub_100015C38;
        v68[3] = &unk_10003CF78;
        v68[4] = v16;
        v68[5] = buf;
        [v21 enumerateKeysAndObjectsUsingBlock:v68];

        id v20 = *(void **)(*(void *)&buf[8] + 40);
      }
      __int16 v22 = [v20 syncGroups];
      unsigned __int8 v23 = +[NPSServer shouldAllowSyncOfItemWithSyncGroups:v22 allowedSyncGroups:v63];

      if (v23)
      {
        if (![*(id *)(*(void *)&buf[8] + 40) twoWaySync]
          || [(NPSServer *)self doesCurrentDeviceSupportGroupedTwoWayKeys]
          || (unint64_t)[obj count] < 2)
        {
          if ([*(id *)(*(void *)&buf[8] + 40) isPerGizmoSetting])
          {
            long long v29 = [[NPSSettingAccessor alloc] initWithNanoDomain:v66];
          }
          else
          {
            int v30 = [NPSSettingAccessor alloc];
            long long v31 = [*(id *)(*(void *)&buf[8] + 40) container];
            long long v32 = [*(id *)(*(void *)&buf[8] + 40) appGroupContainer];
            long long v29 = [(NPSSettingAccessor *)v30 initWithUserDefaultsDomain:v66 container:v31 appGroupContainer:v32];
          }
          uint64_t v33 = [(NPSSettingAccessor *)v29 typeString];
          __int16 v34 = [v66 stringByAppendingFormat:@" | %@", v33, v55];

          if (![(NPProgressTracker *)self->_syncProgressTracker canStartOperation:v34])
          {
            id v39 = nps_daemon_log;
            if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)id v73 = 138412546;
              uint64_t v74 = (uint64_t (*)(uint64_t, uint64_t))v66;
              __int16 v75 = 2112;
              id v76 = v16;
              _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Skipping <%@; %@>", v73, 0x16u);
            }
            goto LABEL_54;
          }
          [(NPSSettingAccessor *)v29 synchronizeForReading];
          if (![(NPSSettingAccessor *)v29 sizeSafeToLoadInMemory])
          {
            unsigned __int8 v35 = nps_daemon_log;
            if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)id v73 = 138543362;
              uint64_t v74 = (uint64_t (*)(uint64_t, uint64_t))v66;
              _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "<%{public}@>Domain size not safe to load in memory. Trying to load it once.", v73, 0xCu);
            }
            [(NPProgressTracker *)self->_syncProgressTracker addToProblematicOperationSet:v34];
          }
          id v67 = 0;
          id v36 = [(NPSSettingAccessor *)v29 serializedObjectForKey:v16 error:&v67];
          id v58 = v67;
          if (v58)
          {
            id v37 = nps_daemon_log;
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              id v38 = [v58 localizedDescription];
              *(_DWORD *)id v73 = 138543874;
              uint64_t v74 = (uint64_t (*)(uint64_t, uint64_t))v66;
              __int16 v75 = 2114;
              id v76 = v16;
              __int16 v77 = 2112;
              long long v78 = v38;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Failed to serialize value for <Domain: %{public}@; Key: %{public}@> (Error: %@)",
                v73,
                0x20u);
            }
            goto LABEL_53;
          }
          +[NSDate timeIntervalSinceReferenceDate];
          id v37 = -[NPSServer getCachedTimeStampFor:key:usePerGizmoCache:](self, "getCachedTimeStampFor:key:usePerGizmoCache:", v66, v16, [*(id *)(*(void *)&buf[8] + 40) isPerGizmoSetting]);
          if ([*(id *)(*(void *)&buf[8] + 40) twoWaySync] && !v37 && !v36)
          {
            id v40 = nps_daemon_log;
            if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)id v73 = 138543618;
              uint64_t v74 = (uint64_t (*)(uint64_t, uint64_t))v66;
              __int16 v75 = 2114;
              id v76 = v16;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "No cached timestamp, and value is null. Not sending value for <Domain: %{public}@; Key: %{public}@>.",
                v73,
                0x16u);
            }
LABEL_53:

LABEL_54:
            goto LABEL_55;
          }
          [v37 doubleValue];
          double v42 = v41;
          objc_msgSend(v14, "setTimestamp:");
          id v43 = objc_opt_new();
          [v43 setKey:v16];
          if ([*(id *)(*(void *)&buf[8] + 40) twoWaySync])
          {
            [v43 setTwoWaySync:1];
            [v43 setTimestamp:v42];
          }
          [v43 setValue:v36];
          id v44 = [v14 keys];
          [v44 addObject:v43];
          id v57 = v43;

          [v60 addObject:v16];
          double v45 = [v14 data];
          if ((unint64_t)[v45 length] <= 0xC831)
          {
          }
          else
          {
            double v46 = [v14 keys];
            BOOL v47 = [v46 count] == 0;

            if (!v47)
            {
              long long v48 = nps_daemon_log;
              if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)id v73 = 0;
                _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Message size reached max allowed size. Sending current default message.", v73, 2u);
              }
              [(NPSServer *)self sendUserDefaultMsg:v14 forDomain:v66 includedKeys:v60 cloudEnabled:0 backupFile:v56];

              [v60 removeAllObjects];
              long long v49 = v57;
              id v14 = 0;
              goto LABEL_52;
            }
          }
          long long v49 = v57;
LABEL_52:

          goto LABEL_53;
        }
        unsigned __int8 v24 = +[NSSet setWithObject:v16];
        [(NPSServer *)self sendPUDSettingsInDomain:v66 keys:v24 backupFile:v56 allowedGroups:v63];

        long long v25 = nps_daemon_log;
        if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v73 = 138543618;
          uint64_t v74 = (uint64_t (*)(uint64_t, uint64_t))v66;
          __int16 v75 = 2114;
          id v76 = v16;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Sent <Domain: %{public}@; Key: %{public}@> as individual default sync message.",
            v73,
            0x16u);
        }
      }
      else
      {
        id v26 = nps_daemon_log;
        if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v73 = 138412290;
          uint64_t v74 = v16;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Key: %@ not allowed, not syncing/backing up", v73, 0xCu);
        }
        __int16 v27 = nps_daemon_log;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          id v28 = [*(id *)(*(void *)&buf[8] + 40) syncGroups];
          *(_DWORD *)id v73 = 138412546;
          uint64_t v74 = v28;
          __int16 v75 = 2112;
          id v76 = v63;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Groups: %@, allowed groups: %@", v73, 0x16u);
        }
      }
LABEL_55:
      _Block_object_dispose(buf, 8);
    }
    id v62 = [obj countByEnumeratingWithState:&v69 objects:v83 count:16];
  }
  while (v62);
LABEL_59:

  long long v50 = [v14 keys];
  BOOL v51 = [v50 count] == 0;

  if (!v51) {
    [(NPSServer *)self sendUserDefaultMsg:v14 forDomain:v66 includedKeys:v60 cloudEnabled:0 backupFile:v56];
  }
  id v52 = (void *)nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v53 = v52;
    id v54 = [obj count];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v66;
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = v54;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "[STATS] Completed sending settings in <Domain: %{public}@; Keys: %lul>.",
      buf,
      0x16u);
  }
}

- (void)applyStashedSettingsSyncMessages
{
  id v3 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[NPSServer applyStashedSettingsSyncMessages]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  database = self->_database;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100015DC4;
  v5[3] = &unk_10003D138;
  v5[4] = self;
  [(NPSDatabase *)database getStashedSettingsSyncDataWithHandler:v5];
  [(NPSDatabase *)self->_database flushStashedSettingsSyncData];
}

+ (id)managedConfigurationSettings
{
  if (qword_100045758 != -1) {
    dispatch_once(&qword_100045758, &stru_10003D158);
  }
  CFStringRef v2 = (void *)qword_100045750;
  return v2;
}

+ (BOOL)isManagedConfigurationSettingPermittedForKind:(id)a3 feature:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [a1 managedConfigurationSettings];
  id v9 = [v8 objectForKeyedSubscript:v7];

  LOBYTE(v7) = [v9 containsObject:v6];
  return (char)v7;
}

- (void)handleAppChangedRestrictions
{
  id v3 = (id)objc_opt_new();
  CFStringRef v2 = +[NSSet setWithObjects:@"SBParentalControlsCapabilities", @"SBParentalControlsEnabled", 0];
  [v3 synchronizeUserDefaultsDomain:@"com.apple.springboard" keys:v2 cloudEnabled:1];
}

- (void)debounceOnWorkerQueueWithblock:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001665C;
  v7[3] = &unk_10003D1A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)handleManagedConfigurationChangedNotification
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100016B28;
  v2[3] = &unk_10003CC40;
  v2[4] = self;
  [(NPSServer *)self debounceOnWorkerQueueWithblock:v2];
}

+ (id)managedConfigurationData
{
  CFStringRef v2 = [(id)objc_opt_class() managedConfigurationSettings];
  id v3 = +[MCProfileConnection sharedConnection];
  id v4 = [v3 userSettings];
  [v3 effectiveRestrictions];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100016CD4;
  v11[3] = &unk_10003D1D0;
  id v12 = v4;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = (id)objc_opt_new();
  id v15 = (id)objc_opt_new();
  id v5 = v15;
  id v6 = v14;
  id v7 = v13;
  id v8 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v11];
  v16[0] = v6;
  v16[1] = v5;
  id v9 = +[NSArray arrayWithObjects:v16 count:2];

  return v9;
}

- (void)forceResyncManagedConfigurationIsInitialSync:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will force re-sync ManagedConfiguration state", v8, 2u);
  }
  id v6 = [(NPSDeviceRegistry *)self->_deviceRegistry domainAccessor];
  [v6 removeObjectForKey:@"mc-data-cache"];
  id v7 = [v6 synchronize];
  [(NPSServer *)self resyncManagedConfigurationIfNeededIsInitialSync:v3];
}

- (void)resyncManagedConfigurationIfNeeded
{
}

- (void)resyncManagedConfigurationIfNeededIsInitialSync:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NPSDeviceRegistry *)self->_deviceRegistry isAltAccountDevice])
  {
    id v5 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Skipping MC re-sync since Tinker watch", (uint8_t *)&v15, 2u);
    }
  }
  else
  {
    id v6 = [(NPSDeviceRegistry *)self->_deviceRegistry domainAccessor];
    id v7 = [v6 synchronize];
    id v8 = [(id)objc_opt_class() managedConfigurationData];
    id v9 = [v6 objectForKey:@"mc-data-cache"];
    id v10 = v9;
    if (v9 && ([v9 isEqualToArray:v8] & 1) != 0)
    {
      id v11 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 67109120;
        BOOL v16 = v3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Skipping MC re-sync since no change detected since last sync. isInitialSync: (%d)", (uint8_t *)&v15, 8u);
      }
    }
    else
    {
      id v12 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 67109120;
        BOOL v16 = v3;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Re-syncing MC since changes were detected since last sync. isInitialSync: (%d)", (uint8_t *)&v15, 8u);
      }
      id v13 = [(NPSServer *)self sendManagedConfigurationSettings:v8 isInitialSync:v3];
      if (!v13)
      {
        [v6 setObject:v8 forKey:@"mc-data-cache"];
        id v14 = [v6 synchronize];
      }
    }
  }
}

- (id)sendManagedConfigurationSettings:(id)a3 isInitialSync:(BOOL)a4
{
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = [v5 objectAtIndexedSubscript:0];
  }
  else
  {
    id v6 = 0;
  }
  if ((unint64_t)[v5 count] < 2)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [v5 objectAtIndexedSubscript:1];
  }
  id v8 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending MC user settings:", buf, 2u);
  }
  [(id)objc_opt_class() logManagedConfigurationDictionary:v6];
  id v9 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending MC restrictions:", buf, 2u);
  }
  [(id)objc_opt_class() logManagedConfigurationDictionary:v7];
  id v10 = objc_opt_new();
  id v19 = 0;
  id v11 = +[NPSSettingAccessor serializeObject:v5 error:&v19];
  id v12 = v19;
  [v10 setUserSettingsAndRestrictions:v11];

  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    id v14 = [v10 data];
    id v18 = 0;
    int v15 = [(NPSServer *)self sendMessageData:v14 messageType:1 queueOneIdentifier:@"ManagedConfiguration/" identifier:&v18 cloudEnabled:0];
    id v16 = v18;
    -[NPSServer registerInitialSyncMessage:ofSize:orReportInitialSyncFailureWithError:](self, "registerInitialSyncMessage:ofSize:orReportInitialSyncFailureWithError:", v16, [v14 length], v15);

    id v13 = v15;
  }

  return v13;
}

+ (id)queueOneIdentifierForManagedConfigurationMsg:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableString) initWithString:@"ManagedConfiguration/"];
  id v5 = [v3 kind];
  id v6 = [v3 feature];

  [v4 appendFormat:@"%@|%@", v5, v6];
  return v4;
}

- (BOOL)retryFileBackupRestoreForFilePath:(id)a3
{
  id v4 = a3;
  id v5 = +[NSURL fileURLWithPath:v4 isDirectory:0];
  id v6 = [(NPSServer *)self fileBackupManager];
  id v7 = [v6 localFileURLForOriginalFileURL:v5];

  if (v7)
  {
    id v8 = [(NPSServer *)self restoreFileBackupForLocalFileURL:v7 originalFileURL:v5 isInitialSync:0];
    BOOL v9 = v8 == 0;
  }
  else
  {
    id v10 = nps_daemon_log;
    BOOL v9 = 0;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "File Backup manager did not have an entry for original file path (%@)", (uint8_t *)&v12, 0xCu);
      BOOL v9 = 0;
    }
  }

  return v9;
}

+ (id)queueOneIdentifierForFileBackupMsg:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableString) initWithString:@"FileBackup/"];
  id v5 = [v3 path];

  [v4 appendString:v5];
  return v4;
}

- (void)synchronizeUserDefaultsDomain:(id)a3 keys:(id)a4 container:(id)a5 appGroupContainer:(id)a6 cloudEnabled:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    *(void *)&uint8_t buf[4] = "-[NPSServer synchronizeUserDefaultsDomain:keys:container:appGroupContainer:cloudEnabled:]";
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    __int16 v34 = v13;
    *(_WORD *)unsigned __int8 v35 = 2112;
    *(void *)&v35[2] = v14;
    *(_WORD *)&v35[10] = 2112;
    *(void *)&v35[12] = v15;
    __int16 v36 = 1024;
    BOOL v37 = v7;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: domain: (%@); keys: (%@); container: (%@); appGroupContainer: (%@); cloudEnabled: (%d)",
      buf,
      0x3Au);
  }
  if (v12 && [v13 count])
  {
    if (v14 || !v15)
    {
      __int16 v22 = [[NPSSettingAccessor alloc] initWithUserDefaultsDomain:v12 container:v14 appGroupContainer:v15];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      __int16 v34 = sub_100006068;
      *(void *)unsigned __int8 v35 = sub_100006078;
      *(void *)&v35[8] = os_transaction_create();
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001795C;
      block[3] = &unk_10003D1F8;
      id v26 = v22;
      id v27 = v14;
      id v28 = v12;
      long long v29 = v13;
      int v30 = self;
      BOOL v32 = v7;
      long long v31 = buf;
      unsigned __int8 v24 = v22;
      dispatch_async(workQueue, block);

      _Block_object_dispose(buf, 8);
      goto LABEL_13;
    }
    uint64_t v17 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      __int16 v34 = v13;
      id v18 = "Container should not be nil when specifing an app group container (%@) for domain (%@) and keys (%@).";
      id v19 = v17;
      uint32_t v20 = 32;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    }
  }
  else
  {
    id v21 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v13;
      id v18 = "Domain (%@) should not be nil, and keys (%@) should not be nil or empty.";
      id v19 = v21;
      uint32_t v20 = 22;
      goto LABEL_11;
    }
  }
LABEL_13:
}

- (void)synchronizeNanoDomain:(id)a3 keys:(id)a4 cloudEnabled:(BOOL)a5
{
  id v8 = a3;
  BOOL v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v10 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[NPSServer synchronizeNanoDomain:keys:cloudEnabled:]";
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: domain: (%@); keys: (%@)", buf, 0x20u);
  }
  if (v8 && [v9 count])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    id v19 = sub_100006068;
    uint32_t v20 = sub_100006078;
    id v21 = (id)os_transaction_create();
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100017D4C;
    block[3] = &unk_10003D220;
    void block[4] = self;
    id v14 = v8;
    BOOL v17 = a5;
    id v15 = v9;
    id v16 = buf;
    dispatch_async(workQueue, block);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v12 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Domain (%@) should not be nil, and keys (%@) should not be nil or empty.", buf, 0x16u);
    }
  }
}

+ (void)setLaunchNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  [a1 setLaunchNotification:@"com.apple.mobile.keybagd.first_unlock" enabled:a3];
  [a1 setLaunchNotification:@"com.apple.Preferences.ChangedRestrictionsEnabledStateNotification" enabled:v3];
  [a1 setLaunchNotification:MCSettingsChangedNotification enabled:v3];
  [a1 setLaunchNotification:MCRestrictionChangedNotification enabled:v3];
  uint64_t v5 = MCEffectiveSettingsChangedNotification;
  [a1 setLaunchNotification:v5 enabled:v3];
}

+ (void)setLaunchNotification:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v4)
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v6, "Notification", (const char *)[v5 UTF8String]);
  }
  else
  {
    xpc_object_t v6 = 0;
  }
  BOOL v7 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"disabling";
    if (v4) {
      CFStringRef v8 = @"enabling";
    }
    int v10 = 138412546;
    CFStringRef v11 = v8;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "setLaunchNotification: %@ launch notification %@", (uint8_t *)&v10, 0x16u);
  }
  id v9 = v5;
  [v9 UTF8String];
  xpc_set_event();
}

- (PSYSyncCoordinator)pairedSyncCoordinatorFirstSync
{
  return self->_pairedSyncCoordinatorFirstSync;
}

- (void)setPairedSyncCoordinatorFirstSync:(id)a3
{
}

- (PSYSyncCoordinator)pairedSyncCoordinatorRemainderSync
{
  return self->_pairedSyncCoordinatorRemainderSync;
}

- (void)setPairedSyncCoordinatorRemainderSync:(id)a3
{
}

- (PSYServiceSyncSession)activeSyncSession
{
  return self->_activeSyncSession;
}

- (void)setActiveSyncSession:(id)a3
{
}

- (unint64_t)totalDataToSyncInBytes
{
  return self->_totalDataToSyncInBytes;
}

- (void)setTotalDataToSyncInBytes:(unint64_t)a3
{
  self->_unint64_t totalDataToSyncInBytes = a3;
}

- (unint64_t)remainingDataToSyncInBytes
{
  return self->_remainingDataToSyncInBytes;
}

- (void)setRemainingDataToSyncInBytes:(unint64_t)a3
{
  self->_unint64_t remainingDataToSyncInBytes = a3;
}

- (NSMutableDictionary)syncSessionProgressDictionary
{
  return self->_syncSessionProgressDictionary;
}

- (OS_os_transaction)syncTransaction
{
  return self->_syncTransaction;
}

- (void)setSyncTransaction:(id)a3
{
}

- (NPProgressTracker)syncProgressTracker
{
  return self->_syncProgressTracker;
}

- (void)setSyncProgressTracker:(id)a3
{
}

- (NPSOSLogStateProvider)dumper
{
  return self->_dumper;
}

- (void)setDumper:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (NPSSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
}

- (IDSService)idsServiceSyncState
{
  return self->_idsServiceSyncState;
}

- (void)setIdsServiceSyncState:(id)a3
{
}

- (NPSDeviceRegistry)deviceRegistry
{
  return self->_deviceRegistry;
}

- (void)setDeviceRegistry:(id)a3
{
}

- (NPSDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (OS_dispatch_source)purgeTimer
{
  return self->_purgeTimer;
}

- (void)setPurgeTimer:(id)a3
{
}

- (void)setAllowedGroups:(id)a3
{
}

- (NSString)currentlyUsedDomain
{
  return self->_currentlyUsedDomain;
}

- (void)setCurrentlyUsedDomain:(id)a3
{
}

- (NSUUID)activeDeviceID
{
  return self->_activeDeviceID;
}

- (void)setActiveDeviceID:(id)a3
{
}

- (OS_dispatch_source)mcDebounceSource
{
  return self->_mcDebounceSource;
}

- (void)setMcDebounceSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mcDebounceSource, 0);
  objc_storeStrong((id *)&self->_activeDeviceID, 0);
  objc_storeStrong((id *)&self->_currentlyUsedDomain, 0);
  objc_storeStrong((id *)&self->_allowedGroups, 0);
  objc_storeStrong((id *)&self->_purgeTimer, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_deviceRegistry, 0);
  objc_storeStrong((id *)&self->_idsServiceSyncState, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_dumper, 0);
  objc_storeStrong((id *)&self->_syncProgressTracker, 0);
  objc_storeStrong((id *)&self->_syncTransaction, 0);
  objc_storeStrong((id *)&self->_syncSessionProgressDictionary, 0);
  objc_storeStrong((id *)&self->_activeSyncSession, 0);
  objc_storeStrong((id *)&self->_pairedSyncCoordinatorRemainderSync, 0);
  objc_storeStrong((id *)&self->_pairedSyncCoordinatorFirstSync, 0);
  objc_storeStrong((id *)&self->_fileBackupManager, 0);
  objc_storeStrong((id *)&self->_pendingIDSMessages, 0);
}

- (id)dumpDomain:(id)a3
{
  id v34 = a3;
  if (MGGetBoolAnswer()) {
    int v4 = 1;
  }
  else {
    int v4 = MGGetBoolAnswer();
  }
  id v5 = +[NSMutableString stringWithFormat:@"Domain <%@>", v34];
  xpc_object_t v6 = [(NPSServer *)self settings];
  BOOL v7 = [v6 syncedUserDefaults];
  CFStringRef v8 = [v7 objectForKeyedSubscript:v34];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v29 = v8;
  id v9 = [v8 keyArrays];
  int v10 = [v9 allValues];

  id obj = v10;
  id v32 = [v10 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v40;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v40 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v11;
        __int16 v12 = *(void **)(*((void *)&v39 + 1) + 8 * v11);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v13 = v12;
        id v14 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v36;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v36 != v16) {
                objc_enumerationMutation(v13);
              }
              id v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              if ([v18 isPerGizmoSetting]
                && ([v18 isMirroring] & 1) == 0)
              {
                __int16 v22 = [[NPSSettingAccessor alloc] initWithNanoDomain:v34];
              }
              else
              {
                id v19 = [NPSSettingAccessor alloc];
                uint32_t v20 = [v18 container];
                id v21 = [v18 appGroupContainer];
                __int16 v22 = [(NPSSettingAccessor *)v19 initWithUserDefaultsDomain:v34 container:v20 appGroupContainer:v21];
              }
              unsigned __int8 v23 = [v18 key];
              unsigned __int8 v24 = [(NPSSettingAccessor *)v22 objectForKey:v23];

              uint64_t v25 = [v18 key];
              id v26 = (void *)v25;
              CFStringRef v27 = @"YES";
              if (!v24) {
                CFStringRef v27 = @"NO";
              }
              if (v4) {
                CFStringRef v27 = v24;
              }
              [v5 appendFormat:@"<key: %@; Value: %@>", v25, v27];
            }
            id v15 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
          }
          while (v15);
        }

        uint64_t v11 = v33 + 1;
      }
      while ((id)(v33 + 1) != v32);
      id v32 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v32);
  }

  return v5;
}

@end