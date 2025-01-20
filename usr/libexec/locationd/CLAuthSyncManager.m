@interface CLAuthSyncManager
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)currentSyncSessionCollidedWithResetSync;
- (BOOL)isConflictResolutionMode;
- (BOOL)isCorrectiveCompensationSupported;
- (BOOL)isDeviceNearbyAndConnected;
- (BOOL)isPairedSyncSessionActive;
- (BOOL)isQuickSwitchInProgress;
- (BOOL)isQuickSwitchModeOn;
- (BOOL)isResetNotificationQueued;
- (BOOL)isThereAWatch;
- (BOOL)isWatchBuildVersionPriorTo:(unsigned int)a3;
- (BOOL)recoverySyncInProgress;
- (BOOL)resetRecoveryMode;
- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5;
- (BOOL)shouldConfirmHandlingPairingNotification;
- (BOOL)shouldConfirmHandlingQuickSwitchNotification;
- (BOOL)shouldResetAuthDbOnFullSync;
- (BOOL)shouldSendMoreDataInCurrentSyncSession;
- (BOOL)shouldSendResetNotificationDuringMigrationSyncIgnoringCache:(BOOL)a3;
- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4;
- (CLAuthSyncManager)init;
- (CLClientManagerPublicProtocol)clientManager;
- (CLSettingsMirror)settings;
- (IDSService)idsService;
- (NSDictionary)preDaytonaMapping;
- (NSMutableArray)deltaSyncObjectsInCompanionQueue;
- (NSMutableArray)deltaSyncObjectsInGizmoQueue;
- (NSMutableArray)fullSyncClientsList;
- (NSMutableArray)fullSyncObjectsInCompanionQueue;
- (NSMutableArray)fullSyncObjectsInGizmoQueue;
- (NSMutableArray)gizmoDeltaSyncObjects;
- (NSMutableArray)gizmoDeltaSyncObjectsWaitingForAck;
- (NSMutableArray)notificationsInCompanionQueue;
- (NSMutableArray)notificationsInGizmoQueue;
- (NSMutableDictionary)authSyncStoreState;
- (NSMutableDictionary)reunionSyncListPaths;
- (NSMutableDictionary)reunionSyncLists;
- (NSString)fullPathForSyncState;
- (NSUUID)activePairingID;
- (NSUUID)pairedDeviceUUID;
- (PSYServiceSyncSession)activeWatchSyncSession;
- (PSYSyncCoordinator)syncCoordinator;
- (SYService)syncService;
- (double)syncSessionRetryInterval;
- (id)getFullSyncObjects;
- (id)getTranslatedGizmoKeyForCompanionClient:(id)a3;
- (id)locationServicesToggleAsNotification;
- (id)migrationSyncResetVersionNumbersNotification;
- (id)resetAsNotifcation;
- (id)service:(id)a3 willPreferSession:(id)a4 overSession:(id)a5;
- (id)translatedKeyForSimulator:(id)a3;
- (int64_t)numberOfConsecutiveSyncSessionRetries;
- (unint64_t)syncRestriction;
- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5;
- (unsigned)watchProductVersion;
- (void)addObject:(id)a3 withSyncSessionReason:(id)a4;
- (void)applyAddMessage:(id)a3;
- (void)applyDeleteMessage:(id)a3;
- (void)applySyncMessage:(id)a3;
- (void)applyUpdateMessage:(id)a3;
- (void)beginService;
- (void)checkAllNotificationStatuses;
- (void)checkResetNotificationStatus;
- (void)checkSyncStoreState;
- (void)checkSyncStoreStateAfterBoot;
- (void)checkSyncStoreStateAfterQuickSwitch;
- (void)checkSyncStoreStateAftreRestrictionChange;
- (void)checkSyncStoreStateOnCompanion;
- (void)checkSyncStoreStateWhenDevicesConnectAfterDisconnection;
- (void)clearReunionSyncList;
- (void)considerPerformingAForcedFullSync;
- (void)createSyncStoreState;
- (void)deleteObject:(id)a3 withSyncSessionReason:(id)a4;
- (void)deltaSyncDidComplete:(id)a3;
- (void)deviceDidChangeCapabilitiesDarwinNotification;
- (void)endPairedSyncSessionWithError:(id)a3;
- (void)endService;
- (void)fullSyncDidComplete;
- (void)handleError:(id)a3 inSyncSession:(id)a4;
- (void)handlePairing;
- (void)handleQuickSwitch;
- (void)handleUnpairing;
- (void)handleZeroActiveWatch;
- (void)prepareToDoFullSync;
- (void)prepareToDoMigrationSync;
- (void)prepareToDoReunionSync;
- (void)refreshSettings;
- (void)resetSyncStateKeysRetainingResetKeys:(BOOL)a3;
- (void)reunionSyncDidComplete:(id)a3;
- (void)sendGlobalAuthStatus:(int)a3;
- (void)sendNotification:(int)a3;
- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5;
- (void)service:(id)a3 encounteredError:(id)a4 context:(id)a5;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5;
- (void)service:(id)a3 willSwitchFromPairingID:(id)a4 toPairingID:(id)a5;
- (void)setActivePairingID:(id)a3;
- (void)setActiveWatchSyncSession:(id)a3;
- (void)setAuthSyncStoreState:(id)a3;
- (void)setClientManager:(id)a3;
- (void)setCurrentSyncSessionCollidedWithResetSync:(BOOL)a3;
- (void)setDeltaSyncObjectsInCompanionQueue:(id)a3;
- (void)setDeltaSyncObjectsInGizmoQueue:(id)a3;
- (void)setFullPathForSyncState:(id)a3;
- (void)setFullSyncClientsList:(id)a3;
- (void)setFullSyncObjectsInCompanionQueue:(id)a3;
- (void)setFullSyncObjectsInGizmoQueue:(id)a3;
- (void)setGizmoDeltaSyncObjects:(id)a3;
- (void)setGizmoDeltaSyncObjectsWaitingForAck:(id)a3;
- (void)setIdsService:(id)a3;
- (void)setIsConflictResolutionMode:(BOOL)a3;
- (void)setIsCorrectiveCompensationSupported:(BOOL)a3;
- (void)setIsDeviceNearbyAndConnected:(BOOL)a3;
- (void)setIsQuickSwitchInProgress:(BOOL)a3;
- (void)setIsQuickSwitchModeOn:(BOOL)a3;
- (void)setIsThereAWatch:(BOOL)a3;
- (void)setNotificationsInCompanionQueue:(id)a3;
- (void)setNotificationsInGizmoQueue:(id)a3;
- (void)setNumberOfConsecutiveSyncSessionRetries:(int64_t)a3;
- (void)setPairedDeviceUUID:(id)a3;
- (void)setPairedSyncSessionActive:(BOOL)a3;
- (void)setPreDaytonaMapping:(id)a3;
- (void)setRecoverySyncInProgress:(BOOL)a3;
- (void)setResetRecoveryMode:(BOOL)a3;
- (void)setReunionSyncListPaths:(id)a3;
- (void)setReunionSyncLists:(id)a3;
- (void)setSettings:(id)a3;
- (void)setShouldConfirmHandlingPairingNotification:(BOOL)a3;
- (void)setShouldConfirmHandlingQuickSwitchNotification:(BOOL)a3;
- (void)setShouldResetAuthDbOnFullSync:(BOOL)a3;
- (void)setShouldSendMoreDataInCurrentSyncSession:(BOOL)a3;
- (void)setSilo:(id)a3;
- (void)setSyncCoordinator:(id)a3;
- (void)setSyncRestriction:(unint64_t)a3;
- (void)setSyncService:(id)a3;
- (void)setSyncSessionRetryInterval:(double)a3;
- (void)setWatchProductVersion:(unsigned int)a3;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4;
- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3;
- (void)syncReunionSyncList;
- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5;
- (void)syncSession:(id)a3 didEndWithError:(id)a4;
- (void)translateCompanionSyncAuthObjectsInPlace:(id)a3;
- (void)updateActivePairedDeviceInfo;
- (void)updateQuickSwitchMode;
- (void)updateRetrySyncInterval:(id)a3;
- (void)updateReunionSyncListsWithAuthSyncMessageKey:(id)a3;
- (void)updateSyncStoreState:(id)a3;
- (void)updateSyncStoreStateForVersionedKey:(id)a3 withUpdateReason:(id)a4;
- (void)watchMigrationDidEnd;
- (void)watchMigrationDidStart;
- (void)watchNeedsDeltaSync:(id)a3;
- (void)watchNeedsFullSync:(id)a3;
@end

@implementation CLAuthSyncManager

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10247F630 != -1) {
    dispatch_once(&qword_10247F630, &stru_1022D7F00);
  }
  return (id)qword_10247F628;
}

+ (BOOL)isSupported
{
  if (qword_10247F640 != -1) {
    dispatch_once(&qword_10247F640, &stru_1022D7F20);
  }
  return byte_10247F638;
}

- (CLAuthSyncManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLAuthSyncManager;
  return [(CLAuthSyncManager *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLAuthSyncManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLAuthSyncManagerClientProtocol];
}

- (void)setSilo:(id)a3
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  unint64_t v5 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync suspending silo until IDS becomes available\"}", buf, 0x12u);
  }
  [a3 suspend];
  v8.receiver = self;
  v8.super_class = (Class)CLAuthSyncManager;
  [(CLAuthSyncManager *)&v8 setSilo:a3];
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  v6 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync waiting on IDS to become available\"}", buf, 0x12u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1009D3DE8;
  v7[3] = &unk_1022B87F0;
  v7[4] = self;
  v7[5] = a3;
  +[IDSService serviceWithIdentifier:@"com.apple.private.alloy.location.auth" completion:v7];
}

- (void)beginService
{
  -[CLAuthSyncManager setClientManager:](self, "setClientManager:", [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "vendor") proxyForService:@"CLClientManager" forClient:@"CLAuthSyncManager"]);
  uint64_t v19 = off_10241F7E0[0]();
  v20 = &off_102392E28;
  objc_super v3 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  self->_syncService = (SYService *)[objc_alloc((Class)off_10241F7E8[0]()) initWithService:@"com.apple.private.alloy.location.auth" priority:20 asMasterStore:1 options:v3];
  [-[SYService setDelegate:queue:](-[CLAuthSyncManager syncService](self, "syncService"), "setDelegate:queue:", self, [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") queue]);
  -[IDSService addDelegate:queue:](-[CLAuthSyncManager idsService](self, "idsService"), "addDelegate:queue:", self, [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") queue]);
  [(CLAuthSyncManager *)self setFullSyncObjectsInCompanionQueue:+[NSMutableArray array]];
  [(CLAuthSyncManager *)self setFullSyncObjectsInGizmoQueue:+[NSMutableArray array]];
  [(CLAuthSyncManager *)self setDeltaSyncObjectsInCompanionQueue:+[NSMutableArray array]];
  [(CLAuthSyncManager *)self setDeltaSyncObjectsInGizmoQueue:+[NSMutableArray array]];
  [(CLAuthSyncManager *)self setNotificationsInCompanionQueue:+[NSMutableArray array]];
  [(CLAuthSyncManager *)self setNotificationsInGizmoQueue:+[NSMutableArray array]];
  [(CLAuthSyncManager *)self setPreDaytonaMapping:sub_1007C4A4C()];
  [(CLAuthSyncManager *)self setShouldSendMoreDataInCurrentSyncSession:0];
  [(CLAuthSyncManager *)self setShouldConfirmHandlingPairingNotification:0];
  [(CLAuthSyncManager *)self setShouldConfirmHandlingQuickSwitchNotification:0];
  [(CLAuthSyncManager *)self setResetRecoveryMode:0];
  [(CLAuthSyncManager *)self setRecoverySyncInProgress:0];
  [(CLAuthSyncManager *)self setIsThereAWatch:0];
  [(CLAuthSyncManager *)self setIsDeviceNearbyAndConnected:0];
  [(CLAuthSyncManager *)self setIsQuickSwitchInProgress:0];
  [(CLAuthSyncManager *)self setIsConflictResolutionMode:0];
  [(CLAuthSyncManager *)self setCurrentSyncSessionCollidedWithResetSync:0];
  [(CLAuthSyncManager *)self setShouldResetAuthDbOnFullSync:0];
  [(CLAuthSyncManager *)self setWatchProductVersion:0xFFFFFFFFLL];
  [(CLAuthSyncManager *)self setAuthSyncStoreState:+[NSMutableDictionary dictionary]];
  [(CLAuthSyncManager *)self setSyncSessionRetryInterval:300.0];
  [(CLAuthSyncManager *)self setNumberOfConsecutiveSyncSessionRetries:0];
  [(CLAuthSyncManager *)self setReunionSyncLists:+[NSMutableDictionary dictionary]];
  [(CLAuthSyncManager *)self setReunionSyncListPaths:+[NSMutableDictionary dictionary]];
  [(CLAuthSyncManager *)self updateActivePairedDeviceInfo];
  -[CLAuthSyncManager setSettings:](self, "setSettings:", [objc_alloc((Class)CLSettingsMirror) initWithInUniverse:[CLAuthSyncManager universe](self, "universe")]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1009D45E0;
  v12[3] = &unk_1022C85A0;
  v12[4] = self;
  [(CLSettingsMirror *)[(CLAuthSyncManager *)self settings] setSettingsChangeHandler:v12];
  v4 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v4 addObserver:self selector:"deviceDidPairNotification:" name:off_10241F7F0[0]() object:0];
  unint64_t v5 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v5 addObserver:self selector:"deviceDidUnpairNotification:" name:off_10241F7F8[0]() object:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v7 = (const __CFString *)off_10241F800[0]();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1009D45E8, v7, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  -[CLAuthSyncManager setSyncCoordinator:](self, "setSyncCoordinator:", [(Class)off_10241F808[0]() syncCoordinatorWithServiceName:@"com.apple.pairedsync.locationauth"]);
  [(PSYSyncCoordinator *)[(CLAuthSyncManager *)self syncCoordinator] setDelegate:self];
  [(CLAuthSyncManager *)self setSyncRestriction:[(PSYSyncCoordinator *)[(CLAuthSyncManager *)self syncCoordinator] syncRestriction]];
  [(CLAuthSyncManager *)self setActiveWatchSyncSession:0];
  if ([(CLAuthSyncManager *)self isThereAWatch])
  {
    id v11 = 0;
    [(SYService *)[(CLAuthSyncManager *)self syncService] resume:&v11];
    if (v11)
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      objc_super v8 = qword_102419538;
      if ([v11 code] == (id)2002)
      {
        os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      }
      else if ([v11 code] == (id)2003)
      {
        os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      }
      else
      {
        os_log_type_t v9 = OS_LOG_TYPE_FAULT;
      }
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 68289282;
        int v14 = 0;
        __int16 v15 = 2082;
        v16 = "";
        __int16 v17 = 2114;
        id v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "{\"msg%{public}.0s\":\"#authsync Resuming SYService failed\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
      }
    }
    else
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      int v10 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        int v14 = 0;
        __int16 v15 = 2082;
        v16 = "";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync SYService resumed\"}", buf, 0x12u);
      }
      [(CLAuthSyncManager *)self checkSyncStoreStateAfterBoot];
    }
  }
}

- (void)endService
{
  [(CLAuthSyncManager *)self setClientManager:0];
  [(CLAuthSyncManager *)self setSyncService:0];
  [(CLAuthSyncManager *)self setFullSyncObjectsInCompanionQueue:0];
  [(CLAuthSyncManager *)self setFullSyncObjectsInGizmoQueue:0];
  [(CLAuthSyncManager *)self setDeltaSyncObjectsInCompanionQueue:0];
  [(CLAuthSyncManager *)self setDeltaSyncObjectsInGizmoQueue:0];
  [(CLAuthSyncManager *)self setNotificationsInCompanionQueue:0];
  [(CLAuthSyncManager *)self setNotificationsInGizmoQueue:0];
  [(CLAuthSyncManager *)self setAuthSyncStoreState:0];
  [(CLSettingsMirror *)[(CLAuthSyncManager *)self settings] invalidate];

  [(CLAuthSyncManager *)self setSettings:0];
  [(PSYSyncCoordinator *)[(CLAuthSyncManager *)self syncCoordinator] setDelegate:0];
  [(CLAuthSyncManager *)self setSyncCoordinator:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
}

- (void)setFullPathForSyncState:(id)a3
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") assertInside];
  id v5 = a3;

  self->_fullPathForSyncState = (NSString *)a3;
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  v6 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    __int16 v8 = 2082;
    os_log_type_t v9 = "";
    __int16 v10 = 2082;
    id v11 = [a3 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Setting sync state store path\", \"storePath\":%{public, location:escape_only}s}", (uint8_t *)v7, 0x1Cu);
  }
}

- (BOOL)isPairedSyncSessionActive
{
  id v2 = [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] objectForKey:@"kCLPairedSyncSessionActive"];

  return [v2 BOOLValue];
}

- (void)setPairedSyncSessionActive:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CLAuthSyncManager *)self isPairedSyncSessionActive] != a3)
  {
    [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:+[NSNumber numberWithBool:v3] forKey:@"kCLPairedSyncSessionActive"];
    [(CLAuthSyncManager *)self updateSyncStoreState:@"kCLPairedSyncSessionActive"];
  }
}

- (BOOL)isWatchBuildVersionPriorTo:(unsigned int)a3
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") assertInside];
  if ([(CLAuthSyncManager *)self watchProductVersion] == -1)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    id v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
    {
      int v8 = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      id v11 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#authsync Checking isWatchBuildVersionPriorTo when watchProductVersion is NRProductVersionNone\"}", (uint8_t *)&v8, 0x12u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
    }
    v6 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      int v8 = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      id v11 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync Checking isWatchBuildVersionPriorTo when watchProductVersion is NRProductVersionNone", "{\"msg%{public}.0s\":\"#authsync Checking isWatchBuildVersionPriorTo when watchProductVersion is NRProductVersionNone\"}", (uint8_t *)&v8, 0x12u);
    }
  }
  return [(CLAuthSyncManager *)self watchProductVersion] < a3;
}

- (void)deviceDidChangeCapabilitiesDarwinNotification
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  BOOL v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    CFStringRef v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync NRPairedDeviceRegistryPairedDeviceDidChangeCapabilitiesDarwinNotification\"}", (uint8_t *)v5, 0x12u);
  }
  unsigned int v4 = [(CLAuthSyncManager *)self watchProductVersion];
  [(CLAuthSyncManager *)self updateActivePairedDeviceInfo];
  if ([(CLAuthSyncManager *)self isThereAWatch])
  {
    if (HIWORD(v4) <= 2u && [(CLAuthSyncManager *)self watchProductVersion] >= 0x30000) {
      [(CLAuthSyncManager *)self watchNeedsFullSync:@"GizmoUpdateToDaytona"];
    }
    [(CLAuthSyncManager *)self checkSyncStoreStateAfterBoot];
  }
}

- (void)watchMigrationDidStart
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  BOOL v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Handling MigrationSync start\"}", (uint8_t *)v4, 0x12u);
  }
  [(CLAuthSyncManager *)self prepareToDoMigrationSync];
  [(CLAuthSyncManager *)self resetSyncStateKeysRetainingResetKeys:[(CLAuthSyncManager *)self shouldSendResetNotificationDuringMigrationSyncIgnoringCache:1]];
  [(CLAuthSyncManager *)self sendNotification:2];
}

- (void)watchMigrationDidEnd
{
  if (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLHandledMigrationSyncResetVersionNumbersNotification"), "BOOLValue"))
  {
    [(CLAuthSyncManager *)self clearReunionSyncList];
    [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] removeObjectForKey:@"kCLHandledMigrationSyncResetVersionNumbersNotification"];
    [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] removeObjectForKey:@"kCLMigrationSyncInProgress"];
    [(CLAuthSyncManager *)self updateSyncStoreState:@"MigrationSyncComplete"];
    byte_10247F648 = 0;
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    BOOL v3 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      int v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Handling MigrationSync end\"}", (uint8_t *)&v6, 0x12u);
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    unsigned int v4 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
    {
      int v6 = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      int v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#authsync kCLHandledMigrationSyncResetVersionNumbersNotification=NO when a full sync completed during migration sync\"}", (uint8_t *)&v6, 0x12u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
    }
    __int16 v5 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      int v6 = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      int v9 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync kCLHandledMigrationSyncResetVersionNumbersNotification=NO when a full sync completed during migration sync", "{\"msg%{public}.0s\":\"#authsync kCLHandledMigrationSyncResetVersionNumbersNotification=NO when a full sync completed during migration sync\"}", (uint8_t *)&v6, 0x12u);
    }
    [(CLAuthSyncManager *)self sendNotification:2];
  }
}

- (void)handleQuickSwitch
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") assertInside];
  [(CLAuthSyncManager *)self setIsConflictResolutionMode:0];
  [(CLAuthSyncManager *)self setShouldConfirmHandlingPairingNotification:0];
  [(CLAuthSyncManager *)self checkSyncStoreStateAfterQuickSwitch];
  if ([(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInCompanionQueue] count])
  {
    if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLFullSyncInProgress"), "BOOLValue") & 1) != 0|| objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLDeltaSyncInProgress"), "BOOLValue"))
    {
      [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanTrue forKey:@"kCLFullSyncInProgress"];
      [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanFalse forKey:@"kCLDeltaSyncInProgress"];
      [(CLAuthSyncManager *)self updateSyncStoreState:@"QuickSwitchDuringDeltaSyncInProgress"];
    }
    [(CLAuthSyncManager *)self setRecoverySyncInProgress:1];
    [(CLAuthSyncManager *)self clearReunionSyncList];
    [(CLAuthSyncManager *)self watchNeedsFullSync:@"RecoveryDuringQS-DeltaSyncInProgress"];
  }
  else if ([(CLAuthSyncManager *)self recoverySyncInProgress])
  {
    [(CLAuthSyncManager *)self clearReunionSyncList];
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    BOOL v3 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 68289026;
      v4[1] = 0;
      __int16 v5 = 2082;
      int v6 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Quick switch, recovered from a pending sync\"}", (uint8_t *)v4, 0x12u);
    }
  }
  else
  {
    [(CLAuthSyncManager *)self syncReunionSyncList];
  }
}

- (void)updateQuickSwitchMode
{
  id v3 = [[[off_10241F810[0]() sharedInstance] getPairedDevices];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3052000000;
  v11[3] = sub_100177CE4;
  v11[4] = sub_100177454;
  v11[5] = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3052000000;
  v10[3] = sub_100177CE4;
  v10[4] = sub_100177454;
  v10[5] = 0;
  if ((unint64_t)[v3 count] < 2)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    int v7 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026;
      __int16 v13 = 2082;
      int v14 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Quick switch mode : OFF\"}", (uint8_t *)&buf, 0x12u);
    }
    [(CLAuthSyncManager *)self setIsQuickSwitchModeOn:0];
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    unsigned int v4 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026;
      __int16 v13 = 2082;
      int v14 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Quick switch mode : ON\"}", (uint8_t *)&buf, 0x12u);
    }
    [(CLAuthSyncManager *)self setIsQuickSwitchModeOn:1];
    [(NSMutableDictionary *)[(CLAuthSyncManager *)self reunionSyncListPaths] removeAllObjects];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1009D5580;
    v9[3] = &unk_1022D7F48;
    v9[5] = v11;
    v9[6] = v10;
    v9[4] = self;
    [v3 enumerateObjectsUsingBlock:v9];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1009D5768;
    v8[3] = &unk_1022D7F70;
    v8[4] = self;
    [(NSMutableDictionary *)[(CLAuthSyncManager *)self reunionSyncListPaths] enumerateKeysAndObjectsUsingBlock:v8];
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    __int16 v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(CLAuthSyncManager *)self reunionSyncLists];
      uint64_t buf = 68289282;
      __int16 v13 = 2082;
      int v14 = "";
      __int16 v15 = 2114;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Client keys in reunionSyncLists\", \"reunionSyncLists\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    }
  }
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v11, 8);
}

- (void)updateReunionSyncListsWithAuthSyncMessageKey:(id)a3
{
  if ([(CLAuthSyncManager *)self isQuickSwitchModeOn])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = [(NSMutableDictionary *)[(CLAuthSyncManager *)self reunionSyncLists] allKeys];
    id v4 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v32;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v32 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          id v8 = [(NSMutableDictionary *)[(CLAuthSyncManager *)self reunionSyncLists] objectForKey:v7];
          *(void *)uint64_t buf = 0;
          *(void *)v37 = buf;
          *(void *)&v37[8] = 0x3052000000;
          *(void *)&v37[16] = sub_100177CE4;
          *(void *)&v37[24] = sub_100177454;
          uint64_t v38 = 0;
          int v9 = [(CLAuthSyncManager *)self clientManager];
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_1009D5F78;
          v30[3] = &unk_1022CFDC8;
          v30[4] = a3;
          v30[5] = buf;
          [(CLClientManagerPublicProtocol *)v9 syncgetDoSync:v30];
          [v8 addObject:*(void *)(*(void *)v37 + 40)];
          [(NSMutableDictionary *)[(CLAuthSyncManager *)self reunionSyncLists] setObject:v8 forKey:v7];
          _Block_object_dispose(buf, 8);
        }
        id v4 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v4);
    }
    id obja = [(NSMutableDictionary *)[(CLAuthSyncManager *)self reunionSyncListPaths] allKeys];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = [obja countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v27;
      do
      {
        v12 = 0;
        do
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(obja);
          }
          __int16 v13 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v12);
          int v14 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", [[-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager reunionSyncLists](self, "reunionSyncLists"), "objectForKey:", -[NSMutableDictionary objectForKey:](-[CLAuthSyncManager reunionSyncListPaths](self, "reunionSyncListPaths"), "objectForKey:", v13)), "allObjects"]);
          if ([(NSArray *)v14 writeToFile:v13 atomically:1])
          {
            if (qword_102419530 != -1) {
              dispatch_once(&qword_102419530, &stru_1022D8200);
            }
            __int16 v15 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
            {
              id v16 = [v13 UTF8String];
              *(_DWORD *)uint64_t buf = 68289538;
              *(_DWORD *)&uint8_t buf[4] = 0;
              *(_WORD *)v37 = 2082;
              *(void *)&v37[2] = "";
              *(_WORD *)&v37[10] = 2082;
              *(void *)&v37[12] = v16;
              *(_WORD *)&v37[20] = 2114;
              *(void *)&v37[22] = v14;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#authsync Updating ReunionSyncList succeeded\", \"reunionSyncListPath\":%{public, location:escape_only}s, \"reunionSyncList\":%{public, location:escape_only}@}", buf, 0x26u);
            }
          }
          else
          {
            if (qword_102419530 != -1) {
              dispatch_once(&qword_102419530, &stru_1022D8200);
            }
            __int16 v17 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
            {
              id v18 = [v13 UTF8String];
              *(_DWORD *)uint64_t buf = 68289538;
              *(_DWORD *)&uint8_t buf[4] = 0;
              *(_WORD *)v37 = 2082;
              *(void *)&v37[2] = "";
              *(_WORD *)&v37[10] = 2082;
              *(void *)&v37[12] = v18;
              *(_WORD *)&v37[20] = 2114;
              *(void *)&v37[22] = v14;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Updating ReunionSyncList failed\", \"reunionSyncListPath\":%{public, location:escape_only}s, \"reunionSyncList\":%{public, location:escape_only}@}", buf, 0x26u);
              if (qword_102419530 != -1) {
                dispatch_once(&qword_102419530, &stru_1022D8200);
              }
            }
            uint64_t v19 = qword_102419538;
            if (os_signpost_enabled((os_log_t)qword_102419538))
            {
              id v20 = [v13 UTF8String];
              *(_DWORD *)uint64_t buf = 68289538;
              *(_DWORD *)&uint8_t buf[4] = 0;
              *(_WORD *)v37 = 2082;
              *(void *)&v37[2] = "";
              *(_WORD *)&v37[10] = 2082;
              *(void *)&v37[12] = v20;
              *(_WORD *)&v37[20] = 2114;
              *(void *)&v37[22] = v14;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync Updating ReunionSyncList failed", "{\"msg%{public}.0s\":\"#authsync Updating ReunionSyncList failed\", \"reunionSyncListPath\":%{public, location:escape_only}s, \"reunionSyncList\":%{public, location:escape_only}@}", buf, 0x26u);
            }
          }
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [obja countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v10);
    }
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    v21 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [(CLAuthSyncManager *)self reunionSyncLists];
      *(_DWORD *)uint64_t buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)v37 = 2082;
      *(void *)&v37[2] = "";
      *(_WORD *)&v37[10] = 2114;
      *(void *)&v37[12] = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Reunion sync lists on disk after update\", \"syncList\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
  }
}

- (void)syncReunionSyncList
{
  id v3 = [[(NSString *)[(CLAuthSyncManager *)self fullPathForSyncState] stringByDeletingLastPathComponent] stringByAppendingPathComponent:@"ReunionSyncList"];
  id v4 = +[NSMutableArray arrayWithContentsOfFile:v3];
  if (v4)
  {
    uint64_t v5 = v4;
    if ([(NSMutableArray *)v4 count])
    {
      int v6 = objc_opt_new();
      unsigned __int8 v7 = [(CLAuthSyncManager *)self isWatchBuildVersionPriorTo:0x40000];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1009D6480;
      v22[3] = &unk_1022D7F98;
      v22[4] = v6;
      v22[5] = v5;
      v22[6] = self;
      char v23 = v7 ^ 1;
      [(CLClientManagerPublicProtocol *)[(CLAuthSyncManager *)self clientManager] syncgetDoSync:v22];
      if ((v7 & 1) == 0)
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v8 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v19;
          while (2)
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v19 != v10) {
                objc_enumerationMutation(v5);
              }
              v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
              if (([v12 isEqualToString:&stru_10234F018] & 1) != 0
                || ([v12 isEqualToString:@"TOGGLE"] & 1) != 0)
              {
                [v6 addObject:-[CLAuthSyncManager locationServicesToggleAsNotification](self, "locationServicesToggleAsNotification")];
                goto LABEL_33;
              }
            }
            id v9 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
      }
LABEL_33:
      [(CLAuthSyncManager *)self clearReunionSyncList];
      [(CLAuthSyncManager *)self prepareToDoReunionSync];
      [(CLAuthSyncManager *)self translateCompanionSyncAuthObjectsInPlace:v6];
      [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInCompanionQueue] addObjectsFromArray:v6];
      [(CLAuthSyncManager *)self watchNeedsDeltaSync:@"Reunion"];
    }
    else
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      int v14 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t buf = 68289026;
        __int16 v26 = 2082;
        long long v27 = "";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Reunion sync : no sync\"}", (uint8_t *)&buf, 0x12u);
      }
      [(CLAuthSyncManager *)self reunionSyncDidComplete:0];
    }
  }
  else
  {
    if (objc_msgSend(+[NSMutableArray array](NSMutableArray, "array"), "writeToFile:atomically:", v3, 1))
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      __int16 v13 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t buf = 68289282;
        __int16 v26 = 2082;
        long long v27 = "";
        __int16 v28 = 2082;
        long long v29 = [(NSString *)v3 UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync ReunionSyncList created\", \"reunionSyncListPath\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
      }
    }
    else
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      __int16 v15 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        uint64_t buf = 68289282;
        __int16 v26 = 2082;
        long long v27 = "";
        __int16 v28 = 2082;
        long long v29 = [(NSString *)v3 UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync ReunionSyncList creation failed\", \"reunionSyncListPath\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022D8200);
        }
      }
      id v16 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        __int16 v17 = [(NSString *)v3 UTF8String];
        uint64_t buf = 68289282;
        __int16 v26 = 2082;
        long long v27 = "";
        __int16 v28 = 2082;
        long long v29 = v17;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync ReunionSyncList creation failed", "{\"msg%{public}.0s\":\"#authsync ReunionSyncList creation failed\", \"reunionSyncListPath\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
      }
    }
    [(CLAuthSyncManager *)self setRecoverySyncInProgress:1];
    [(CLAuthSyncManager *)self clearReunionSyncList];
    [(CLAuthSyncManager *)self watchNeedsFullSync:@"MissingReunionSyncList"];
  }
}

- (void)clearReunionSyncList
{
  id v2 = [[(NSString *)[(CLAuthSyncManager *)self fullPathForSyncState] stringByDeletingLastPathComponent] stringByAppendingPathComponent:@"ReunionSyncList"];
  if ([+[NSArray array] writeToFile:v2 atomically:1])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    id v3 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 68289282;
      int v8 = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      v12 = [(NSString *)v2 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync ReunionSyncList cleared\", \"reunionSyncListPath\":%{public, location:escape_only}s}", (uint8_t *)&v7, 0x1Cu);
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    id v4 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      int v7 = 68289282;
      int v8 = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      v12 = [(NSString *)v2 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync ReunionSyncList clear failed\", \"reunionSyncListPath\":%{public, location:escape_only}s}", (uint8_t *)&v7, 0x1Cu);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
    }
    uint64_t v5 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      int v6 = [(NSString *)v2 UTF8String];
      int v7 = 68289282;
      int v8 = 0;
      __int16 v9 = 2082;
      uint64_t v10 = "";
      __int16 v11 = 2082;
      v12 = v6;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync ReunionSyncList clear failed", "{\"msg%{public}.0s\":\"#authsync ReunionSyncList clear failed\", \"reunionSyncListPath\":%{public, location:escape_only}s}", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (void)createSyncStoreState
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") assertInside];
  if ([(CLAuthSyncManager *)self fullPathForSyncState])
  {
    [(CLAuthSyncManager *)self setAuthSyncStoreState:+[NSMutableDictionary dictionaryWithContentsOfFile:[(CLAuthSyncManager *)self fullPathForSyncState]]];
    if ([(CLAuthSyncManager *)self authSyncStoreState])
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      uint64_t v3 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t buf = 68289282;
        __int16 v40 = 2082;
        v41 = "";
        __int16 v42 = 2114;
        v43 = [(CLAuthSyncManager *)self authSyncStoreState];
        id v4 = "{\"msg%{public}.0s\":\"#authsync Sync store state exists already\", \"syncStoreState\":%{public, location:escape_only}@}";
        uint64_t v5 = v3;
        uint32_t v6 = 28;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&buf, v6);
      }
    }
    else
    {
      HIDWORD(v32) = 1;
      uint64_t v8 = sub_1000A6958();
      if (sub_10006EF84(v8, (const char *)[@"kCLResetNotification" UTF8String], (_DWORD *)&v32 + 1))
      {
        v37[0] = @"kCLPairedSyncSessionActive";
        v37[1] = @"kCLHandledPairingNotification";
        v38[0] = &__kCFBooleanFalse;
        v38[1] = &__kCFBooleanFalse;
        v37[2] = @"kCLFullSyncInProgress";
        v37[3] = @"kCLDeltaSyncInProgress";
        v38[2] = &__kCFBooleanFalse;
        v38[3] = &__kCFBooleanFalse;
        v38[4] = &__kCFBooleanTrue;
        v37[4] = @"kCLHandledResetNotification";
        v37[5] = @"kCLSupportsPrecisionReduction";
        v38[5] = +[NSNumber numberWithBool:[(CLAuthSyncManager *)self isCorrectiveCompensationSupported]];
        v37[6] = @"kCLResetNotification";
        __int16 v9 = +[NSNumber numberWithInt:HIDWORD(v32)];
        v37[7] = @"kCLToggleNotificationOnGizmo";
        v38[6] = v9;
        v38[7] = &off_102392E40;
        uint64_t v10 = v38;
        __int16 v11 = v37;
        uint64_t v12 = 8;
      }
      else
      {
        v35[0] = @"kCLPairedSyncSessionActive";
        v35[1] = @"kCLHandledPairingNotification";
        v36[0] = &__kCFBooleanFalse;
        v36[1] = &__kCFBooleanFalse;
        v35[2] = @"kCLFullSyncInProgress";
        v35[3] = @"kCLDeltaSyncInProgress";
        v36[2] = &__kCFBooleanFalse;
        v36[3] = &__kCFBooleanFalse;
        v36[4] = &__kCFBooleanTrue;
        v35[4] = @"kCLHandledResetNotification";
        v35[5] = @"kCLSupportsPrecisionReduction";
        __int16 v13 = +[NSNumber numberWithBool:[(CLAuthSyncManager *)self isCorrectiveCompensationSupported]];
        v35[6] = @"kCLToggleNotificationOnGizmo";
        v36[5] = v13;
        v36[6] = &off_102392E40;
        uint64_t v10 = v36;
        __int16 v11 = v35;
        uint64_t v12 = 7;
      }
      int v14 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v11 count:v12];
      LODWORD(v32) = 1;
      uint64_t v15 = sub_1000A6958();
      if ((sub_1004D0870(v15, (const char *)[@"kCLToggleNotificationOnCompanion" UTF8String], &v32) & 1) == 0)
      {
        uint64_t v16 = sub_1000A6958();
        sub_1004D2BC4(v16, (const char *)[@"kCLToggleNotificationOnCompanion" UTF8String], (unsigned int *)&v32);
        uint64_t v17 = *(void *)sub_1000A6958();
        (*(void (**)(void))(v17 + 944))();
      }
      [(CLAuthSyncManager *)self setShouldConfirmHandlingPairingNotification:1];
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      long long v18 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t buf = 68289282;
        __int16 v40 = 2082;
        v41 = "";
        __int16 v42 = 2114;
        v43 = (NSMutableDictionary *)v14;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Creating sync store state\", \"syncStoreState\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
      }
      long long v19 = +[NSFileManager defaultManager];
      long long v20 = [(NSString *)[(CLAuthSyncManager *)self fullPathForSyncState] stringByDeletingLastPathComponent];
      NSFileAttributeKey v33 = NSFileProtectionKey;
      NSFileProtectionType v34 = NSFileProtectionNone;
      [(NSFileManager *)v19 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:+[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1] error:&v31];
      if (v31)
      {
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022D8200);
        }
        long long v21 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
        {
          v22 = [(NSString *)[(CLAuthSyncManager *)self fullPathForSyncState] UTF8String];
          uint64_t buf = 68289282;
          __int16 v40 = 2082;
          v41 = "";
          __int16 v42 = 2082;
          v43 = (NSMutableDictionary *)v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Directory creation failed\", \"syncStorePath\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_1022D8200);
          }
        }
        char v23 = qword_102419538;
        if (os_signpost_enabled((os_log_t)qword_102419538))
        {
          v24 = [(NSString *)[(CLAuthSyncManager *)self fullPathForSyncState] UTF8String];
          uint64_t buf = 68289282;
          __int16 v40 = 2082;
          v41 = "";
          __int16 v42 = 2082;
          v43 = (NSMutableDictionary *)v24;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync Directory creation failed", "{\"msg%{public}.0s\":\"#authsync Directory creation failed\", \"syncStorePath\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
        }
      }
      else
      {
        if ([(NSDictionary *)v14 writeToFile:[(CLAuthSyncManager *)self fullPathForSyncState] atomically:1])
        {
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_1022D8200);
          }
          v25 = qword_102419538;
          if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v26 = [(NSString *)[(CLAuthSyncManager *)self fullPathForSyncState] UTF8String];
            uint64_t buf = 68289282;
            __int16 v40 = 2082;
            v41 = "";
            __int16 v42 = 2082;
            v43 = (NSMutableDictionary *)v26;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Creating sync state\", \"syncStorePath\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
          }
        }
        else
        {
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_1022D8200);
          }
          long long v27 = qword_102419538;
          if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
          {
            __int16 v28 = [(NSString *)[(CLAuthSyncManager *)self fullPathForSyncState] UTF8String];
            uint64_t buf = 68289282;
            __int16 v40 = 2082;
            v41 = "";
            __int16 v42 = 2082;
            v43 = (NSMutableDictionary *)v28;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Creating sync state failed\", \"syncStorePath\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
            if (qword_102419530 != -1) {
              dispatch_once(&qword_102419530, &stru_1022D8200);
            }
          }
          long long v29 = qword_102419538;
          if (os_signpost_enabled((os_log_t)qword_102419538))
          {
            v30 = [(NSString *)[(CLAuthSyncManager *)self fullPathForSyncState] UTF8String];
            uint64_t buf = 68289282;
            __int16 v40 = 2082;
            v41 = "";
            __int16 v42 = 2082;
            v43 = (NSMutableDictionary *)v30;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync Creating sync state failed", "{\"msg%{public}.0s\":\"#authsync Creating sync state failed\", \"syncStorePath\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
          }
        }
        [(CLAuthSyncManager *)self setAuthSyncStoreState:+[NSMutableDictionary dictionaryWithDictionary:v14]];
      }
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    uint64_t v7 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026;
      __int16 v40 = 2082;
      v41 = "";
      id v4 = "{\"msg%{public}.0s\":\"#authsync Empty sync store state path\"}";
      uint64_t v5 = v7;
      uint32_t v6 = 18;
      goto LABEL_11;
    }
  }
}

- (void)updateSyncStoreState:(id)a3
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") assertInside];
  if ([(CLAuthSyncManager *)self fullPathForSyncState])
  {
    if ([(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] writeToFile:[(CLAuthSyncManager *)self fullPathForSyncState] atomically:1])
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      uint64_t v5 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 68289538;
        int v14 = 0;
        __int16 v15 = 2082;
        uint64_t v16 = "";
        __int16 v17 = 2114;
        id v18 = a3;
        __int16 v19 = 2114;
        long long v20 = [(CLAuthSyncManager *)self authSyncStoreState];
        uint32_t v6 = "{\"msg%{public}.0s\":\"#authsync SyncStoreState updated\", \"updateReason\":%{public, location:escape_only}"
             "@, \"newSyncState\":%{public, location:escape_only}@}";
        uint64_t v7 = v5;
        uint32_t v8 = 38;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v13, v8);
      }
    }
    else
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      uint64_t v10 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        int v13 = 68289538;
        int v14 = 0;
        __int16 v15 = 2082;
        uint64_t v16 = "";
        __int16 v17 = 2114;
        id v18 = a3;
        __int16 v19 = 2082;
        long long v20 = [(NSString *)[(CLAuthSyncManager *)self fullPathForSyncState] UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Writing SyncStoreState failed\", \"updateReason\":%{public, location:escape_only}@, \"syncStorePath\":%{public, location:escape_only}s}", (uint8_t *)&v13, 0x26u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022D8200);
        }
      }
      __int16 v11 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        uint64_t v12 = [(NSString *)[(CLAuthSyncManager *)self fullPathForSyncState] UTF8String];
        int v13 = 68289538;
        int v14 = 0;
        __int16 v15 = 2082;
        uint64_t v16 = "";
        __int16 v17 = 2114;
        id v18 = a3;
        __int16 v19 = 2082;
        long long v20 = (NSMutableDictionary *)v12;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync Writing SyncStoreState failed", "{\"msg%{public}.0s\":\"#authsync Writing SyncStoreState failed\", \"updateReason\":%{public, location:escape_only}@, \"syncStorePath\":%{public, location:escape_only}s}", (uint8_t *)&v13, 0x26u);
      }
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    uint64_t v9 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 68289026;
      int v14 = 0;
      __int16 v15 = 2082;
      uint64_t v16 = "";
      uint32_t v6 = "{\"msg%{public}.0s\":\"#authsync Empty SyncStoreState path\"}";
      uint64_t v7 = v9;
      uint32_t v8 = 18;
      goto LABEL_11;
    }
  }
}

- (void)updateSyncStoreStateForVersionedKey:(id)a3 withUpdateReason:(id)a4
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") assertInside];
  if (![(CLAuthSyncManager *)self fullPathForSyncState])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    uint64_t v11 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v27 = 0;
      __int16 v28 = 2082;
      long long v29 = "";
      uint64_t v9 = "{\"msg%{public}.0s\":\"#authsync Empty SyncStoreState path\"}";
      uint64_t v10 = v11;
      uint32_t v12 = 18;
LABEL_31:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v12);
      return;
    }
    return;
  }
  unsigned int v25 = 1;
  uint64_t v7 = sub_1000A6958();
  if (sub_10006EF84(v7, (const char *)[a3 UTF8String], &v25))
  {
    if ([a3 isEqualToString:@"kCLResetNotification"]
      && [(CLAuthSyncManager *)self resetRecoveryMode])
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      uint64_t v8 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289538;
        int v27 = 0;
        __int16 v28 = 2082;
        long long v29 = "";
        __int16 v30 = 2082;
        uint64_t v31 = "sending reset notification";
        __int16 v32 = 2082;
        NSFileAttributeKey v33 = "skipping increment";
        uint64_t v9 = "{\"msg%{public}.0s\":\"#authsync Recovering\", \"action\":%{public, location:escape_only}s, \"versionNumber"
             "\":%{public, location:escape_only}s}";
        uint64_t v10 = v8;
LABEL_30:
        uint32_t v12 = 38;
        goto LABEL_31;
      }
      return;
    }
    int v13 = v25;
    if (v25 == 0x7FFFFFFF)
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      int v14 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        int v27 = 0;
        __int16 v28 = 2082;
        long long v29 = "";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Resetting the version number back to 1\"}", buf, 0x12u);
      }
      int v13 = 1;
    }
    unsigned int v25 = v13 + 1;
  }
  uint64_t v15 = sub_1000A6958();
  sub_1000EA838(v15, (const char *)[a3 UTF8String], &v25);
  uint64_t v16 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v16 + 944))();
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  __int16 v17 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = (const char *)[a3 UTF8String];
    *(_DWORD *)uint64_t buf = 68289794;
    int v27 = 0;
    __int16 v28 = 2082;
    long long v29 = "";
    __int16 v30 = 2114;
    uint64_t v31 = (const char *)a4;
    __int16 v32 = 2082;
    NSFileAttributeKey v33 = v18;
    __int16 v34 = 1026;
    unsigned int v35 = v25;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Updating daemon cache\", \"updateReason\":%{public, location:escape_only}@, \"key\":%{public, location:escape_only}s, \"value\":%{public}d}", buf, 0x2Cu);
  }
  if (([a3 isEqualToString:@"kCLToggleNotificationOnCompanion"] & 1) == 0)
  {
    [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:+[NSNumber numberWithInt:v25] forKey:a3];
    if ([(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] writeToFile:[(CLAuthSyncManager *)self fullPathForSyncState] atomically:1])
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      uint64_t v19 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        long long v20 = [(CLAuthSyncManager *)self authSyncStoreState];
        *(_DWORD *)uint64_t buf = 68289538;
        int v27 = 0;
        __int16 v28 = 2082;
        long long v29 = "";
        __int16 v30 = 2114;
        uint64_t v31 = (const char *)a4;
        __int16 v32 = 2114;
        NSFileAttributeKey v33 = (const char *)v20;
        uint64_t v9 = "{\"msg%{public}.0s\":\"#authsync SyncStoreState updated\", \"updateReason\":%{public, location:escape_only}"
             "@, \"newSyncState\":%{public, location:escape_only}@}";
        uint64_t v10 = v19;
        goto LABEL_30;
      }
    }
    else
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      long long v21 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        v22 = [(NSString *)[(CLAuthSyncManager *)self fullPathForSyncState] UTF8String];
        *(_DWORD *)uint64_t buf = 68289538;
        int v27 = 0;
        __int16 v28 = 2082;
        long long v29 = "";
        __int16 v30 = 2114;
        uint64_t v31 = (const char *)a4;
        __int16 v32 = 2082;
        NSFileAttributeKey v33 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Writing SyncStoreState failed\", \"updateReason\":%{public, location:escape_only}@, \"syncStorePath\":%{public, location:escape_only}s}", buf, 0x26u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022D8200);
        }
      }
      char v23 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        v24 = [(NSString *)[(CLAuthSyncManager *)self fullPathForSyncState] UTF8String];
        *(_DWORD *)uint64_t buf = 68289538;
        int v27 = 0;
        __int16 v28 = 2082;
        long long v29 = "";
        __int16 v30 = 2114;
        uint64_t v31 = (const char *)a4;
        __int16 v32 = 2082;
        NSFileAttributeKey v33 = v24;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync Writing SyncStoreState failed", "{\"msg%{public}.0s\":\"#authsync Writing SyncStoreState failed\", \"updateReason\":%{public, location:escape_only}@, \"syncStorePath\":%{public, location:escape_only}s}", buf, 0x26u);
      }
    }
  }
}

- (void)resetSyncStateKeysRetainingResetKeys:(BOOL)a3
{
  BOOL v3 = a3;
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") assertInside];
  HIDWORD(v15) = 1;
  uint64_t v5 = sub_1000A6958();
  if ((sub_1004D0870(v5, (const char *)[@"kCLToggleNotificationOnCompanion" UTF8String], (_DWORD *)&v15 + 1) & 1) == 0)
  {
    uint64_t v6 = sub_1000A6958();
    sub_1004D2BC4(v6, (const char *)[@"kCLToggleNotificationOnCompanion" UTF8String], (unsigned int *)&v15 + 1);
    uint64_t v7 = *(void *)sub_1000A6958();
    (*(void (**)(void))(v7 + 944))();
  }
  v16[0] = @"kCLPairedSyncSessionActive";
  v16[1] = @"kCLHandledPairingNotification";
  v17[0] = &__kCFBooleanTrue;
  v17[1] = &__kCFBooleanTrue;
  v16[2] = @"kCLFullSyncInProgress";
  v16[3] = @"kCLDeltaSyncInProgress";
  v17[2] = &__kCFBooleanFalse;
  v17[3] = &__kCFBooleanFalse;
  v16[4] = @"kCLMigrationSyncInProgress";
  v16[5] = @"kCLHandledMigrationSyncResetVersionNumbersNotification";
  v17[4] = &__kCFBooleanTrue;
  v17[5] = &__kCFBooleanFalse;
  v16[6] = @"kCLToggleNotificationOnGizmo";
  v17[6] = &off_102392E40;
  [(CLAuthSyncManager *)self setAuthSyncStoreState:+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:7])];
  if (v3)
  {
    LODWORD(v15) = 1;
    uint64_t v8 = sub_1000A6958();
    if ((sub_1004D0870(v8, (const char *)[@"kCLResetNotification" UTF8String], &v15) & 1) == 0)
    {
      uint64_t v9 = sub_1000A6958();
      sub_1004D2BC4(v9, (const char *)[@"kCLResetNotification" UTF8String], (unsigned int *)&v15);
      uint64_t v10 = *(void *)sub_1000A6958();
      (*(void (**)(void))(v10 + 944))();
    }
    [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanFalse forKey:@"kCLHandledResetNotification"];
    uint64_t v11 = [(CLAuthSyncManager *)self authSyncStoreState];
    uint32_t v12 = +[NSNumber numberWithUnsignedInt:v15];
    CFStringRef v13 = @"kCLResetNotification";
    int v14 = v11;
  }
  else
  {
    int v14 = [(CLAuthSyncManager *)self authSyncStoreState];
    uint32_t v12 = (NSNumber *)&__kCFBooleanTrue;
    CFStringRef v13 = @"kCLHandledResetNotification";
  }
  [(NSMutableDictionary *)v14 setObject:v12 forKey:v13];
  [(CLAuthSyncManager *)self updateSyncStoreState:@"MigrationSync-ResetCompanionVersionNumbers"];
}

- (void)checkSyncStoreState
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") assertInside];
  if ([(CLAuthSyncManager *)self fullPathForSyncState])
  {
    if ([(CLAuthSyncManager *)self authSyncStoreState])
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      BOOL v3 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 68289282;
        int v6 = 0;
        __int16 v7 = 2082;
        uint64_t v8 = "";
        __int16 v9 = 2114;
        uint64_t v10 = [(CLAuthSyncManager *)self authSyncStoreState];
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sync store state updated from disk\", \"syncState\":%{public, location:escape_only}@}", (uint8_t *)&v5, 0x1Cu);
      }
      [(CLAuthSyncManager *)self checkSyncStoreStateOnCompanion];
    }
    else
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      id v4 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 68289026;
        int v6 = 0;
        __int16 v7 = 2082;
        uint64_t v8 = "";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync No sync store state on disk\"}", (uint8_t *)&v5, 0x12u);
      }
      [(CLAuthSyncManager *)self createSyncStoreState];
      [(CLAuthSyncManager *)self watchNeedsFullSync:@"MissingSyncStoreStateOnDisk"];
    }
  }
}

- (void)checkSyncStoreStateOnCompanion
{
  if (![(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] objectForKey:@"kCLToggleNotificationOnGizmo"])
  {
    [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&off_102392E40 forKey:@"kCLToggleNotificationOnGizmo"];
    [(CLAuthSyncManager *)self updateSyncStoreState:@"CompanionUpdateToTigris"];
  }
  unsigned int v16 = 1;
  uint64_t v3 = sub_1000A6958();
  if ((sub_1004D0870(v3, (const char *)[@"kCLToggleNotificationOnCompanion" UTF8String], &v16) & 1) == 0)
  {
    uint64_t v4 = sub_1000A6958();
    sub_1004D2BC4(v4, (const char *)[@"kCLToggleNotificationOnCompanion" UTF8String], &v16);
    uint64_t v5 = *(void *)sub_1000A6958();
    (*(void (**)(void))(v5 + 944))();
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    int v6 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v18 = 0;
      __int16 v19 = 2082;
      long long v20 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Setting kCLToggleNotificationOnCompanion=1 on first update to Tigris\"}", buf, 0x12u);
    }
  }
  unsigned int v7 = [[-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLMigrationSyncInProgress") boolValue];
  uint64_t v8 = [(CLAuthSyncManager *)self authSyncStoreState];
  if (v7)
  {
    if (!objc_msgSend(-[NSMutableDictionary objectForKey:](v8, "objectForKey:", @"kCLHandledMigrationSyncResetVersionNumbersNotification"), "BOOLValue"))
    {
      [(CLAuthSyncManager *)self watchMigrationDidStart];
      return;
    }
    CFStringRef v9 = @"Recovery-kCLMigrationSyncInProgress";
    goto LABEL_25;
  }
  if ((objc_msgSend(-[NSMutableDictionary objectForKey:](v8, "objectForKey:", @"kCLHandledPairingNotification"), "BOOLValue") & 1) == 0)
  {
    if (!objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLHandledResetNotification"), "BOOLValue")|| (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLFullSyncInProgress"), "BOOLValue") & 1) != 0|| objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLDeltaSyncInProgress"), "BOOLValue"))
    {
      [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanTrue forKey:@"kCLHandledResetNotification"];
      [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanFalse forKey:@"kCLFullSyncInProgress"];
      [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanFalse forKey:@"kCLDeltaSyncInProgress"];
      [(CLAuthSyncManager *)self updateSyncStoreState:@"Recovery-kCLHandledPairingNotification"];
    }
    [(CLAuthSyncManager *)self setShouldConfirmHandlingPairingNotification:1];
    [(CLAuthSyncManager *)self setRecoverySyncInProgress:1];
    CFStringRef v9 = @"Recovery-kCLHandledPairingNotification";
    goto LABEL_25;
  }
  if (![(CLAuthSyncManager *)self recoverySyncInProgress]) {
    [(CLAuthSyncManager *)self checkAllNotificationStatuses];
  }
  unsigned int v10 = [[-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLFullSyncInProgress") boolValue];
  if (![(CLAuthSyncManager *)self recoverySyncInProgress] && v10)
  {
    if (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLDeltaSyncInProgress"), "BOOLValue"))
    {
      [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanFalse forKey:@"kCLDeltaSyncInProgress"];
      [(CLAuthSyncManager *)self updateSyncStoreState:@"Recovery-kCLFullSyncInProgress"];
    }
    [(CLAuthSyncManager *)self setRecoverySyncInProgress:1];
    CFStringRef v9 = @"Recovery-kCLFullSyncInProgress";
    goto LABEL_25;
  }
  unsigned int v12 = [(CLAuthSyncManager *)self isCorrectiveCompensationSupported];
  unsigned int v13 = [[-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLSupportsPrecisionReduction") boolValue];
  int v14 = [(CLAuthSyncManager *)self authSyncStoreState];
  if (v12 != v13)
  {
    [(NSMutableDictionary *)v14 setObject:+[NSNumber numberWithBool:[(CLAuthSyncManager *)self isCorrectiveCompensationSupported]] forKey:@"kCLSupportsPrecisionReduction"];
    [(CLAuthSyncManager *)self updateSyncStoreState:@"Recovery-CapabilitiesChanged-kCLFullSyncInProgress"];
    [(CLAuthSyncManager *)self setRecoverySyncInProgress:1];
    uint64_t v11 = self;
    CFStringRef v9 = @"Recovery-CapabilitiesChanged-kCLFullSyncInProgress";
    goto LABEL_26;
  }
  unsigned int v15 = [[-[NSMutableDictionary objectForKey:](v14, "objectForKey:", @"kCLDeltaSyncInProgress") boolValue];
  if (![(CLAuthSyncManager *)self recoverySyncInProgress] && v15)
  {
    [(CLAuthSyncManager *)self setRecoverySyncInProgress:1];
    CFStringRef v9 = @"Recovery-kCLDeltaSyncInProgress";
LABEL_25:
    uint64_t v11 = self;
LABEL_26:
    [(CLAuthSyncManager *)v11 watchNeedsFullSync:v9];
  }
}

- (void)checkSyncStoreStateWhenDevicesConnectAfterDisconnection
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") assertInside];
  if (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLMigrationSyncInProgress"), "BOOLValue"))
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    uint64_t v3 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 68289538;
      int v10 = 0;
      __int16 v11 = 2082;
      unsigned int v12 = "";
      __int16 v13 = 2082;
      int v14 = "migration sync";
      __int16 v15 = 2082;
      unsigned int v16 = "kCLMigrationSyncInProgress=1";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Syncing after devices connecting\", \"requestType\":%{public, location:escape_only}s, \"reason\":%{public, location:escape_only}s}", (uint8_t *)&v9, 0x26u);
    }
    if (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLHandledMigrationSyncResetVersionNumbersNotification"), "BOOLValue"))
    {
      CFStringRef v4 = @"Recovery-NearbyDevice-kCLMigrationSyncInProgress";
LABEL_20:
      [(CLAuthSyncManager *)self watchNeedsFullSync:v4];
      return;
    }
    [(CLAuthSyncManager *)self watchMigrationDidStart];
  }
  else if (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLHandledPairingNotification"), "BOOLValue"))
  {
    if (![(CLAuthSyncManager *)self recoverySyncInProgress]) {
      [(CLAuthSyncManager *)self checkAllNotificationStatuses];
    }
    unsigned int v5 = [[-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLFullSyncInProgress") boolValue];
    if (![(CLAuthSyncManager *)self recoverySyncInProgress] && v5)
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      int v6 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 68289538;
        int v10 = 0;
        __int16 v11 = 2082;
        unsigned int v12 = "";
        __int16 v13 = 2082;
        int v14 = "full sync";
        __int16 v15 = 2082;
        unsigned int v16 = "kCLFullSyncInProgress is 1";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Syncing after devices connecting\", \"requestType\":%{public, location:escape_only}s, \"reason\":%{public, location:escape_only}s}", (uint8_t *)&v9, 0x26u);
      }
      if (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLDeltaSyncInProgress"), "BOOLValue"))
      {
        [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanFalse forKey:@"kCLDeltaSyncInProgress"];
        [(CLAuthSyncManager *)self updateSyncStoreState:@"Recovery-NearbyDevice-kCLFullSyncInProgress"];
      }
      CFStringRef v4 = @"Recovery-NearbyDevice-kCLFullSyncInProgress";
      goto LABEL_20;
    }
    unsigned int v7 = [[-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLDeltaSyncInProgress") boolValue];
    if (![(CLAuthSyncManager *)self recoverySyncInProgress] && v7)
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      uint64_t v8 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 68289538;
        int v10 = 0;
        __int16 v11 = 2082;
        unsigned int v12 = "";
        __int16 v13 = 2082;
        int v14 = "delta sync";
        __int16 v15 = 2082;
        unsigned int v16 = "kCLDeltaSyncInProgress is 1";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Syncing after devices connecting\", \"requestType\":%{public, location:escape_only}s, \"reason\":%{public, location:escape_only}s}", (uint8_t *)&v9, 0x26u);
      }
      [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInCompanionQueue] addObjectsFromArray:[(CLAuthSyncManager *)self deltaSyncObjectsInGizmoQueue]];
      [(NSMutableArray *)[(CLAuthSyncManager *)self notificationsInCompanionQueue] addObjectsFromArray:[(CLAuthSyncManager *)self notificationsInGizmoQueue]];
      [(CLAuthSyncManager *)self watchNeedsDeltaSync:@"Recovery-NearbyDevice-kCLDeltaSyncInProgress"];
    }
  }
  else
  {
    if (!objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLHandledResetNotification"), "BOOLValue")|| (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLFullSyncInProgress"), "BOOLValue") & 1) != 0|| objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLDeltaSyncInProgress"), "BOOLValue"))
    {
      [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanTrue forKey:@"kCLHandledResetNotification"];
      [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanFalse forKey:@"kCLFullSyncInProgress"];
      [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanFalse forKey:@"kCLDeltaSyncInProgress"];
      [(CLAuthSyncManager *)self updateSyncStoreState:@"Recovery-NearbyDevice-kCLHandledPairingNotification"];
    }
    [(CLAuthSyncManager *)self setShouldConfirmHandlingPairingNotification:1];
    [(CLAuthSyncManager *)self watchNeedsFullSync:@"Recovery-NearbyDevice-kCLHandledPairingNotification"];
  }
}

- (void)checkSyncStoreStateAfterBoot
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") assertInside];
  [(CLAuthSyncManager *)self checkSyncStoreState];
  if ([(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] objectForKey:@"kCLHandledQuickSwitchNotification"])
  {
    uint64_t v3 = [[-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLHandledQuickSwitchNotification") boolValue] ^ 1];
  }
  else
  {
    uint64_t v3 = 0;
  }
  [(CLAuthSyncManager *)self setShouldConfirmHandlingQuickSwitchNotification:v3];
  if ([(CLAuthSyncManager *)self recoverySyncInProgress]
    && [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] objectForKey:@"kCLHandledQuickSwitchNotification"])
  {
    [(CLAuthSyncManager *)self clearReunionSyncList];
  }
  else if ([(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] objectForKey:@"kCLHandledQuickSwitchNotification"])
  {
    [(CLAuthSyncManager *)self syncReunionSyncList];
  }
}

- (void)checkSyncStoreStateAfterQuickSwitch
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") assertInside];
  [(CLAuthSyncManager *)self checkSyncStoreState];
  if ([(CLAuthSyncManager *)self recoverySyncInProgress])
  {
    [(CLAuthSyncManager *)self clearReunionSyncList];
  }
}

- (void)checkSyncStoreStateAftreRestrictionChange
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") assertInside];
  [(CLAuthSyncManager *)self checkSyncStoreState];
  if (![(CLAuthSyncManager *)self recoverySyncInProgress]
    && [(CLAuthSyncManager *)self isPairedSyncSessionActive])
  {
    [(CLAuthSyncManager *)self setRecoverySyncInProgress:1];
    [(CLAuthSyncManager *)self watchNeedsFullSync:@"ActivePairedSyncSession"];
  }
}

- (void)checkAllNotificationStatuses
{
}

- (void)checkResetNotificationStatus
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") assertInside];
  unsigned int v15 = 0;
  uint64_t v3 = sub_1000A6958();
  LODWORD(v3) = sub_10006EF84(v3, (const char *)[@"kCLResetNotification" UTF8String], &v15);
  CFStringRef v4 = [(CLAuthSyncManager *)self authSyncStoreState];
  if (v3)
  {
    id v5 = [(NSMutableDictionary *)v4 objectForKey:@"kCLResetNotification"];
    int v6 = [(CLAuthSyncManager *)self authSyncStoreState];
    if (v5)
    {
      unsigned int v7 = [[-[NSMutableDictionary objectForKey:](v6, "objectForKey:", @"kCLResetNotification") intValue];
      unsigned int v8 = v15;
      int v9 = [(CLAuthSyncManager *)self authSyncStoreState];
      if (v8 == v7)
      {
        if ([v9 objectForKey:@"kCLHandledResetNotification"].boolValue)return; {
        [(CLAuthSyncManager *)self setResetRecoveryMode:1];
        }
        [(CLAuthSyncManager *)self setRecoverySyncInProgress:1];
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022D8200);
        }
        int v10 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68289538;
          int v17 = 0;
          __int16 v18 = 2082;
          __int16 v19 = "";
          __int16 v20 = 2082;
          long long v21 = "reset notification";
          __int16 v22 = 2082;
          char v23 = "matched but reset wasn't handled";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Recovered\", \"notification\":%{public, location:escape_only}s, \"watchResetNotificationVersion\":%{public, location:escape_only}s}", buf, 0x26u);
        }
        if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLFullSyncInProgress"), "BOOLValue") & 1) != 0|| objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLDeltaSyncInProgress"), "BOOLValue"))
        {
          [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanFalse forKey:@"kCLFullSyncInProgress"];
          [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanTrue forKey:@"kCLDeltaSyncInProgress"];
          [(CLAuthSyncManager *)self updateSyncStoreState:@"Recovery-ResetNotification"];
        }
        __int16 v11 = &stru_1022D7FD8;
      }
      else
      {
        [(NSMutableDictionary *)v9 setObject:+[NSNumber numberWithInt:v15] forKey:@"kCLResetNotification"];
        [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanFalse forKey:@"kCLFullSyncInProgress"];
        [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanTrue forKey:@"kCLDeltaSyncInProgress"];
        [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanFalse forKey:@"kCLHandledResetNotification"];
        [(CLAuthSyncManager *)self updateSyncStoreState:@"Recovery-ResetNotification"];
        [(CLAuthSyncManager *)self setResetRecoveryMode:1];
        [(CLAuthSyncManager *)self setRecoverySyncInProgress:1];
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022D8200);
        }
        int v14 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68289538;
          int v17 = 0;
          __int16 v18 = 2082;
          __int16 v19 = "";
          __int16 v20 = 2082;
          long long v21 = "reset notification";
          __int16 v22 = 2082;
          char v23 = "mismatched";
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Recovered\", \"notification\":%{public, location:escape_only}s, \"watchResetNotificationVersion\":%{public, location:escape_only}s}", buf, 0x26u);
        }
        __int16 v11 = &stru_1022D7FF8;
      }
    }
    else
    {
      [(NSMutableDictionary *)v6 setObject:+[NSNumber numberWithInt:v15] forKey:@"kCLResetNotification"];
      [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanFalse forKey:@"kCLHandledResetNotification"];
      [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanFalse forKey:@"kCLFullSyncInProgress"];
      [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanTrue forKey:@"kCLDeltaSyncInProgress"];
      [(CLAuthSyncManager *)self updateSyncStoreState:@"Recovery-ResetNotification-MissingOnWatch"];
      [(CLAuthSyncManager *)self setResetRecoveryMode:1];
      [(CLAuthSyncManager *)self setRecoverySyncInProgress:1];
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      __int16 v13 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289538;
        int v17 = 0;
        __int16 v18 = 2082;
        __int16 v19 = "";
        __int16 v20 = 2082;
        long long v21 = "reset notification";
        __int16 v22 = 2082;
        char v23 = "missing";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Recovered\", \"notification\":%{public, location:escape_only}s, \"watchResetNotificationVersion\":%{public, location:escape_only}s}", buf, 0x26u);
      }
      __int16 v11 = &stru_1022D7FB8;
    }
  }
  else
  {
    if ([v4 objectForKey:@"kCLHandledResetNotification"] == 1)return; {
    if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLFullSyncInProgress"), "BOOLValue") & 1) != 0|| objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLDeltaSyncInProgress"), "BOOLValue"))
    }
    {
      [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanFalse forKey:@"kCLFullSyncInProgress"];
      [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanTrue forKey:@"kCLDeltaSyncInProgress"];
      [(CLAuthSyncManager *)self updateSyncStoreState:@"Recovery-ResetNotification-Mismatch"];
    }
    [(CLAuthSyncManager *)self setResetRecoveryMode:1];
    [(CLAuthSyncManager *)self setRecoverySyncInProgress:1];
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    unsigned int v12 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289538;
      int v17 = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      __int16 v20 = 2082;
      long long v21 = "reset notification";
      __int16 v22 = 2082;
      char v23 = "not present in cache";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Recovered\", \"notification\":%{public, location:escape_only}s, \"watchResetNotificationVersion\":%{public, location:escape_only}s}", buf, 0x26u);
    }
    __int16 v11 = &stru_1022D8018;
  }
  [(CLClientManagerPublicProtocol *)[(CLAuthSyncManager *)self clientManager] syncgetDoSync:v11];
}

- (void)updateActivePairedDeviceInfo
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") assertInside];
  id v3 = [(Class)off_10241F810[0]() sharedInstance];
  id v4 = [v3 getActivePairedDevice];
  if (v4)
  {
    id v5 = v4;
    -[CLAuthSyncManager setPairedDeviceUUID:](self, "setPairedDeviceUUID:", [v4 valueForProperty:off_10241F828[0]()]);
    id v6 = [[[v5 valueForProperty:off_10241F818[0]] stringByAppendingPathComponent:@"CoreLocation"] stringByAppendingPathComponent:@"AUTH"] stringByAppendingPathComponent:@"SyncState"];
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    unsigned int v7 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 68289794;
      int v12 = 0;
      __int16 v13 = 2082;
      int v14 = "";
      __int16 v15 = 2114;
      unsigned int v16 = [(CLAuthSyncManager *)self pairedDeviceUUID];
      __int16 v17 = 2082;
      id v18 = [[[v5 valueForProperty:off_10241F830[0]()] UTF8String];
      __int16 v19 = 2082;
      id v20 = [[[v5 valueForProperty:off_10241F838[0]()] UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Device info updated\", \"deviceUUID\":%{public, location:escape_only}@, \"buildVersion\":%{public, location:escape_only}s, \"deviceName\":%{public, location:escape_only}s}", (uint8_t *)&v11, 0x30u);
    }
    [(CLAuthSyncManager *)self setFullPathForSyncState:v6];
    [(CLAuthSyncManager *)self setAuthSyncStoreState:+[NSMutableDictionary dictionaryWithContentsOfFile:[(CLAuthSyncManager *)self fullPathForSyncState]]];
    unsigned int v8 = [(NSUUID *)[v3 deviceForNRDevice:v5 fromIDSDevices:-[IDSService linkedDevicesWithRelationship:](-[CLAuthSyncManager idsService](self, "idsService"), "linkedDevicesWithRelationship:", 1)];
    if ([(NSUUID *)v8 isNearby] && [(NSUUID *)v8 isConnected])
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      int v9 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 68289282;
        int v12 = 0;
        __int16 v13 = 2082;
        int v14 = "";
        __int16 v15 = 2114;
        unsigned int v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync device is nearby and connected\", \"idsDevice\":%{public, location:escape_only}@}", (uint8_t *)&v11, 0x1Cu);
      }
      [(CLAuthSyncManager *)self setIsDeviceNearbyAndConnected:1];
    }
    [(CLAuthSyncManager *)self setIsThereAWatch:1];
    [(CLAuthSyncManager *)self refreshSettings];
    [(CLAuthSyncManager *)self setWatchProductVersion:off_10241F840((uint64_t)v5)];
    [(CLAuthSyncManager *)self updateQuickSwitchMode];
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    int v10 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 68289026;
      int v12 = 0;
      __int16 v13 = 2082;
      int v14 = "";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync No active watch\"}", (uint8_t *)&v11, 0x12u);
    }
    [(CLAuthSyncManager *)self handleZeroActiveWatch];
  }
}

- (void)handleZeroActiveWatch
{
  [(CLAuthSyncManager *)self setFullPathForSyncState:0];
  [(CLAuthSyncManager *)self setShouldConfirmHandlingPairingNotification:0];
  [(CLAuthSyncManager *)self setShouldConfirmHandlingQuickSwitchNotification:0];
  [(CLAuthSyncManager *)self setIsThereAWatch:0];
  [(CLAuthSyncManager *)self setIsDeviceNearbyAndConnected:0];
  [(CLAuthSyncManager *)self setIsQuickSwitchInProgress:0];
  [(CLAuthSyncManager *)self setIsConflictResolutionMode:0];
  [(CLAuthSyncManager *)self setWatchProductVersion:0xFFFFFFFFLL];
  [(CLAuthSyncManager *)self setPairedDeviceUUID:0];
  [(CLAuthSyncManager *)self setNumberOfConsecutiveSyncSessionRetries:0];
  [(NSMutableArray *)[(CLAuthSyncManager *)self fullSyncObjectsInCompanionQueue] removeAllObjects];
  [(NSMutableArray *)[(CLAuthSyncManager *)self fullSyncObjectsInGizmoQueue] removeAllObjects];
  [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInCompanionQueue] removeAllObjects];
  [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInGizmoQueue] removeAllObjects];
  [(NSMutableArray *)[(CLAuthSyncManager *)self notificationsInCompanionQueue] removeAllObjects];
  [(NSMutableArray *)[(CLAuthSyncManager *)self notificationsInGizmoQueue] removeAllObjects];
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  id v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    id v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Zero paired watches\"}", (uint8_t *)v4, 0x12u);
  }
}

- (void)handlePairing
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") assertInside];
  [(NSMutableArray *)[(CLAuthSyncManager *)self fullSyncObjectsInCompanionQueue] removeAllObjects];
  [(NSMutableArray *)[(CLAuthSyncManager *)self fullSyncObjectsInGizmoQueue] removeAllObjects];
  [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInCompanionQueue] removeAllObjects];
  [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInGizmoQueue] removeAllObjects];
  [(NSMutableArray *)[(CLAuthSyncManager *)self gizmoDeltaSyncObjects] removeAllObjects];
  [(NSMutableArray *)[(CLAuthSyncManager *)self gizmoDeltaSyncObjectsWaitingForAck] removeAllObjects];
  [(NSMutableArray *)[(CLAuthSyncManager *)self notificationsInCompanionQueue] removeAllObjects];
  [(NSMutableArray *)[(CLAuthSyncManager *)self notificationsInGizmoQueue] removeAllObjects];
  [(CLAuthSyncManager *)self setIsConflictResolutionMode:0];
  [(CLAuthSyncManager *)self updateActivePairedDeviceInfo];
  [(CLAuthSyncManager *)self createSyncStoreState];
  [(CLAuthSyncManager *)self setShouldConfirmHandlingPairingNotification:1];
  [(CLAuthSyncManager *)self setIsQuickSwitchInProgress:0];
  if ([(PSYSyncCoordinator *)[(CLAuthSyncManager *)self syncCoordinator] syncRestriction])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    id v3 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 68289026;
      v4[1] = 0;
      __int16 v5 = 2082;
      id v6 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sync restriction is up, waiting for PairedSync callback\"}", (uint8_t *)v4, 0x12u);
    }
  }
  else
  {
    [(CLAuthSyncManager *)self watchNeedsFullSync:@"Pairing"];
  }
}

- (void)handleUnpairing
{
  [(CLAuthSyncManager *)self updateActivePairedDeviceInfo];
  if ([(CLAuthSyncManager *)self isThereAWatch])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    id v3 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 68289026;
      v4[1] = 0;
      __int16 v5 = 2082;
      id v6 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync An inactive watch has unpaired\"}", (uint8_t *)v4, 0x12u);
    }
  }
  else
  {
    [(CLAuthSyncManager *)self handleZeroActiveWatch];
  }
}

- (void)prepareToDoFullSync
{
  if (!objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLFullSyncInProgress"), "BOOLValue")|| objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLDeltaSyncInProgress"), "BOOLValue"))
  {
    [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanTrue forKey:@"kCLFullSyncInProgress"];
    [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanFalse forKey:@"kCLDeltaSyncInProgress"];
    [(CLAuthSyncManager *)self updateSyncStoreState:@"FullSyncPrep"];
  }
  [(CLAuthSyncManager *)self setShouldSendMoreDataInCurrentSyncSession:0];
  [(NSMutableArray *)[(CLAuthSyncManager *)self fullSyncObjectsInCompanionQueue] removeAllObjects];
  [(NSMutableArray *)[(CLAuthSyncManager *)self fullSyncObjectsInGizmoQueue] removeAllObjects];
  [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInCompanionQueue] removeAllObjects];
  [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInGizmoQueue] removeAllObjects];
  [(NSMutableArray *)[(CLAuthSyncManager *)self notificationsInCompanionQueue] addObjectsFromArray:[(CLAuthSyncManager *)self notificationsInGizmoQueue]];
  id v3 = [(CLAuthSyncManager *)self notificationsInGizmoQueue];

  [(NSMutableArray *)v3 removeAllObjects];
}

- (void)prepareToDoReunionSync
{
  if ([(SYService *)[(CLAuthSyncManager *)self syncService] currentSession])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    id v3 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 68289282;
      v4[1] = 0;
      __int16 v5 = 2082;
      id v6 = "";
      __int16 v7 = 1026;
      unsigned int v8 = [[-[SYService currentSession](-[CLAuthSyncManager syncService](self, "syncService")) isResetSync];
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sync in progress already - dropping the queue\", \"syncSessionType\":%{public}hhd}", (uint8_t *)v4, 0x18u);
    }
  }
  [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanFalse forKey:@"kCLFullSyncInProgress"];
  [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanTrue forKey:@"kCLDeltaSyncInProgress"];
  [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanFalse forKey:@"kCLHandledQuickSwitchNotification"];
  [(CLAuthSyncManager *)self updateSyncStoreState:@"ReunionSyncPrep"];
  [(CLAuthSyncManager *)self setShouldSendMoreDataInCurrentSyncSession:0];
  [(CLAuthSyncManager *)self setShouldConfirmHandlingQuickSwitchNotification:1];
  [(NSMutableArray *)[(CLAuthSyncManager *)self fullSyncObjectsInCompanionQueue] removeAllObjects];
  [(NSMutableArray *)[(CLAuthSyncManager *)self fullSyncObjectsInGizmoQueue] removeAllObjects];
  [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInCompanionQueue] removeAllObjects];
  [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInGizmoQueue] removeAllObjects];
  [(NSMutableArray *)[(CLAuthSyncManager *)self notificationsInCompanionQueue] addObjectsFromArray:[(CLAuthSyncManager *)self notificationsInGizmoQueue]];
  [(NSMutableArray *)[(CLAuthSyncManager *)self notificationsInGizmoQueue] removeAllObjects];
}

- (void)prepareToDoMigrationSync
{
  byte_10247F648 = 0;
}

- (BOOL)shouldSendResetNotificationDuringMigrationSyncIgnoringCache:(BOOL)a3
{
  if (a3 || (byte_10247F64A & 1) == 0)
  {
    int v6 = 1;
    uint64_t v4 = sub_1000A6958();
    if (sub_10006EF84(v4, (const char *)[@"kCLResetNotification" UTF8String], &v6)) {
      byte_10247F649 = 1;
    }
    if ([[-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLHandledResetNotification") boolValue] & 1] == 0)byte_10247F649 = 1; {
    [+[NSArray arrayWithContentsOfFile:[[(NSString *)[(CLAuthSyncManager *)self fullPathForSyncState] stringByDeletingLastPathComponent] stringByAppendingPathComponent:@"ReunionSyncList"]] enumerateObjectsUsingBlock:&stru_1022D8058];
    }
    byte_10247F64A = 1;
  }
  return byte_10247F649;
}

- (id)getFullSyncObjects
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1009D9F54;
  v12[3] = &unk_1022CA588;
  v12[4] = v3;
  [(CLClientManagerPublicProtocol *)[(CLAuthSyncManager *)self clientManager] syncgetDoSync:v12];
  id v4 = objc_alloc_init((Class)NSMutableIndexSet);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1009D9F94;
  v11[3] = &unk_1022D8080;
  v11[4] = self;
  v11[5] = v4;
  [v3 enumerateObjectsUsingBlock:v11];
  if ((unint64_t)[v4 count] >= 2)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    __int16 v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v14 = 0;
      __int16 v15 = 2082;
      unsigned int v16 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Found more than one global auth state in the full sync queue\"}", buf, 0x12u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
    }
    int v6 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v14 = 0;
      __int16 v15 = 2082;
      unsigned int v16 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync Found more than one global auth state in the full sync queue", "{\"msg%{public}.0s\":\"#authsync Found more than one global auth state in the full sync queue\"}", buf, 0x12u);
    }
  }
  [v3 removeObjectsAtIndexes:v4];

  if (![(CLAuthSyncManager *)self isWatchBuildVersionPriorTo:0x40000])
  {
    [v3 addObject:-[CLAuthSyncManager locationServicesToggleAsNotification](self, "locationServicesToggleAsNotification")];
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    __int16 v7 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v14 = 0;
      __int16 v15 = 2082;
      unsigned int v16 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Adding LS-TOGGLE as a notification to the full sync queue\"}", buf, 0x12u);
    }
  }
  [(CLAuthSyncManager *)self translateCompanionSyncAuthObjectsInPlace:v3];
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  unsigned int v8 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v3 description];
    *(_DWORD *)uint64_t buf = 68289282;
    int v14 = 0;
    __int16 v15 = 2082;
    unsigned int v16 = "";
    __int16 v17 = 2114;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync syncObjects\", \"syncObjects\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  return v3;
}

- (id)locationServicesToggleAsNotification
{
  id v3 = objc_alloc_init(CLCompanionSyncAuthObject);
  [(CLCompanionSyncAuthObject *)v3 setClientKey:@"TOGGLE"];
  [(CLCompanionSyncAuthObject *)v3 setAuthMask:sub_1001198FC()];
  [(CLCompanionSyncAuthObject *)v3 setClearClient:0];
  [(CLCompanionSyncAuthObject *)v3 setNotification:1];
  [(CLCompanionSyncAuthObject *)v3 setOperationType:1];
  unsigned int v10 = 0;
  uint64_t v4 = sub_1000A6958();
  sub_1004D0870(v4, (const char *)[@"kCLToggleNotificationOnCompanion" UTF8String], &v10);
  __int16 v5 = objc_alloc_init(CLAuthSyncVectorClock);
  [(CLAuthSyncVectorClock *)v5 setKey:@"kCLToggleNotificationOnCompanion"];
  [(CLAuthSyncVectorClock *)v5 setValue:v10];
  int v6 = objc_alloc_init(CLAuthSyncVectorClock);
  [(CLAuthSyncVectorClock *)v6 setKey:@"kCLToggleNotificationOnGizmo"];
  -[CLAuthSyncVectorClock setValue:](v6, "setValue:", [(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLToggleNotificationOnGizmo")) unsignedIntValue]);
  [(CLCompanionSyncAuthObject *)v3 addVectorClocks:v5];
  [(CLCompanionSyncAuthObject *)v3 addVectorClocks:v6];
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  __int16 v7 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = [(CLCompanionSyncAuthObject *)v3 description];
    *(_DWORD *)uint64_t buf = 68289282;
    int v12 = 0;
    __int16 v13 = 2082;
    int v14 = "";
    __int16 v15 = 2114;
    unsigned int v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync LS TOGGLE as a notification\", \"locationServicesAsNotification\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  return v3;
}

- (id)resetAsNotifcation
{
  id v2 = objc_alloc_init(CLCompanionSyncAuthObject);
  [(CLCompanionSyncAuthObject *)v2 setClientKey:@"RESET"];
  [(CLCompanionSyncAuthObject *)v2 setAuthMask:sub_1001198FC()];
  [(CLCompanionSyncAuthObject *)v2 setClearClient:0];
  [(CLCompanionSyncAuthObject *)v2 setNotification:0];
  [(CLCompanionSyncAuthObject *)v2 setOperationType:1];
  return v2;
}

- (id)migrationSyncResetVersionNumbersNotification
{
  id v2 = objc_alloc_init(CLCompanionSyncAuthObject);
  [(CLCompanionSyncAuthObject *)v2 setClientKey:@"MIGRATION_SYNC_RESET_VERSION_NUMBERS"];
  [(CLCompanionSyncAuthObject *)v2 setAuthMask:sub_1001198FC()];
  [(CLCompanionSyncAuthObject *)v2 setClearClient:0];
  [(CLCompanionSyncAuthObject *)v2 setNotification:2];
  [(CLCompanionSyncAuthObject *)v2 setOperationType:1];
  return v2;
}

- (void)translateCompanionSyncAuthObjectsInPlace:(id)a3
{
  if (![(CLAuthSyncManager *)self isCorrectiveCompensationSupported])
  {
    [a3 enumerateObjectsUsingBlock:&stru_1022D80C0];
  }
}

- (id)getTranslatedGizmoKeyForCompanionClient:(id)a3
{
  if (![(CLAuthSyncManager *)self isWatchBuildVersionPriorTo:196608]) {
    return a3;
  }
  id v5 = [(NSDictionary *)[(CLAuthSyncManager *)self preDaytonaMapping] objectForKey:a3];
  if (!v5) {
    return a3;
  }
  int v6 = v5;
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  __int16 v7 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68289538;
    v9[1] = 0;
    __int16 v10 = 2082;
    int v11 = "";
    __int16 v12 = 2082;
    id v13 = [a3 UTF8String];
    __int16 v14 = 2082;
    id v15 = [v6 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync translating client keys\", \"fromClient\":%{public, location:escape_only}s, \"toClient\":%{public, location:escape_only}s}", (uint8_t *)v9, 0x26u);
  }
  return v6;
}

- (BOOL)isResetNotificationQueued
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  _DWORD v4[2] = sub_1009DA8B8;
  v4[3] = &unk_1022D80E8;
  v4[4] = &v5;
  [(NSMutableArray *)[(CLAuthSyncManager *)self notificationsInCompanionQueue] enumerateObjectsUsingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)endPairedSyncSessionWithError:(id)a3
{
  if ([(CLAuthSyncManager *)self isPairedSyncSessionActive])
  {
    uint64_t v5 = [(CLAuthSyncManager *)self activeWatchSyncSession];
    if (a3) {
      [(PSYServiceSyncSession *)v5 syncDidFailWithError:a3];
    }
    else {
      [(PSYServiceSyncSession *)v5 syncDidComplete];
    }
    [(CLAuthSyncManager *)self setPairedSyncSessionActive:0];
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    int v6 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68289026;
      v7[1] = 0;
      __int16 v8 = 2082;
      id v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sync session completion - PS - kCLPairedSyncSessionActive\"}", (uint8_t *)v7, 0x12u);
    }
  }
}

- (void)updateRetrySyncInterval:(id)a3
{
  id v5 = [a3 domain];
  if ([v5 isEqualToString:@"com.apple.identityservices.error"])
  {
    BOOL v6 = [a3 code] == (id)23;
  }
  else
  {
    if ([v5 isEqualToString:@"SYErrorDomain"])
    {
      id v7 = [a3 code];
      double v8 = 305.0;
      if (v7 != (id)2005 && v7 != (id)2023)
      {
        if (v7 == (id)2007) {
          double v8 = 5.0;
        }
        else {
          double v8 = 300.0;
        }
      }
      goto LABEL_12;
    }
    if (![v5 isEqualToString:@"NMSErrorDomain"]) {
      return;
    }
    BOOL v6 = [a3 code] == (id)2;
  }
  double v8 = 300.0;
  if (v6) {
    double v8 = 5.0;
  }
LABEL_12:

  [(CLAuthSyncManager *)self setSyncSessionRetryInterval:v8];
}

- (void)handleError:(id)a3 inSyncSession:(id)a4
{
  id v7 = &qword_102419000;
  double v8 = &qword_102419000;
  if ([a4 isSending])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    id v9 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      id v35 = [a4 identifier];
      id v33 = [a4 reason];
      unsigned int v31 = [a4 isResetSync];
      [a4 state];
      uint64_t v29 = [a4 state];
      unsigned int v10 = [a4 wasCancelled];
      unsigned int v11 = [objc_msgSend(a4, "service") targetIsInProximity];
      [(SYService *)[(CLAuthSyncManager *)self syncService] sessionStalenessInterval];
      *(_DWORD *)uint64_t buf = 68291842;
      int v40 = 0;
      __int16 v41 = 2082;
      __int16 v42 = "";
      __int16 v43 = 2114;
      uint64_t v44 = (uint64_t)v35;
      __int16 v45 = 2114;
      id v46 = v33;
      __int16 v47 = 1026;
      unsigned int v48 = v31;
      __int16 v49 = 2050;
      uint64_t v50 = v29;
      __int16 v51 = 1026;
      unsigned int v52 = v10;
      __int16 v53 = 1026;
      unsigned int v54 = v11;
      __int16 v55 = 2050;
      uint64_t v56 = (uint64_t)v12;
      __int16 v57 = 2114;
      id v58 = [a3 domain];
      __int16 v59 = 2050;
      id v60 = [a3 code];
      double v8 = &qword_102419000;
      __int16 v61 = 2114;
      id v62 = [[objc_msgSend(a3, "userInfo") objectForKey:NSLocalizedDescriptionKey];
      id v7 = &qword_102419000;
      __int16 v63 = 1026;
      unsigned int v64 = [(CLAuthSyncManager *)self numberOfConsecutiveSyncSessionRetries];
      id v13 = "{\"msg%{public}.0s\":\"#authsync Error in sending sync session\", \"sessionIdentifier\":%{public, location:e"
            "scape_only}@, \"reason\":%{public, location:escape_only}@, \"isResetSync\":%{public}hhd, \"state\":%{public,"
            " location:SYSessionState}lld, \"wasCancelled\":%{public}hhd, \"targetIsInProximity\":%{public}hhd, \"session"
            "StalenessInterval\":%{public}ld, \"errorDomain\":%{public, location:escape_only}@, \"errorCode\":%{public}ld"
            ", \"errorDesc\":%{public, location:escape_only}@, \"retryCount\":%{public}d}";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v13, buf, 0x70u);
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    id v9 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      id v36 = [a4 identifier];
      id v34 = [a4 reason];
      unsigned int v32 = [a4 isResetSync];
      [a4 state];
      uint64_t v30 = [a4 state];
      unsigned int v14 = [a4 wasCancelled];
      unsigned int v15 = [objc_msgSend(a4, "service") targetIsInProximity];
      [(SYService *)[(CLAuthSyncManager *)self syncService] sessionStalenessInterval];
      *(_DWORD *)uint64_t buf = 68291842;
      int v40 = 0;
      __int16 v41 = 2082;
      __int16 v42 = "";
      __int16 v43 = 2114;
      uint64_t v44 = (uint64_t)v36;
      __int16 v45 = 2114;
      id v46 = v34;
      __int16 v47 = 1026;
      unsigned int v48 = v32;
      __int16 v49 = 2050;
      uint64_t v50 = v30;
      __int16 v51 = 1026;
      unsigned int v52 = v14;
      __int16 v53 = 1026;
      unsigned int v54 = v15;
      __int16 v55 = 2050;
      uint64_t v56 = (uint64_t)v16;
      __int16 v57 = 2114;
      id v58 = [a3 domain];
      __int16 v59 = 2050;
      id v60 = [a3 code];
      double v8 = &qword_102419000;
      __int16 v61 = 2114;
      id v62 = [[objc_msgSend(a3, "userInfo") objectForKey:NSLocalizedDescriptionKey];
      id v7 = &qword_102419000;
      __int16 v63 = 1026;
      unsigned int v64 = [(CLAuthSyncManager *)self numberOfConsecutiveSyncSessionRetries];
      id v13 = "{\"msg%{public}.0s\":\"#authsync Error in receiving sync session\", \"sessionIdentifier\":%{public, location"
            ":escape_only}@, \"reason\":%{public, location:escape_only}@, \"isResetSync\":%{public}hhd, \"state\":%{publi"
            "c, location:SYSessionState}lld, \"wasCancelled\":%{public}hhd, \"targetIsInProximity\":%{public}hhd, \"sessi"
            "onStalenessInterval\":%{public}ld, \"errorDomain\":%{public, location:escape_only}@, \"errorCode\":%{public}"
            "ld, \"errorDesc\":%{public, location:escape_only}@, \"retryCount\":%{public}d}";
      goto LABEL_10;
    }
  }
  if (objc_msgSend(objc_msgSend(a4, "service"), "targetIsInProximity"))
  {
    [(CLAuthSyncManager *)self updateRetrySyncInterval:a3];
    if (![a4 isSending]) {
      return;
    }
    if ([a4 isResetSync])
    {
      if ([(CLAuthSyncManager *)self shouldConfirmHandlingPairingNotification])
      {
        if (v7[166] != -1) {
          dispatch_once(&qword_102419530, &stru_1022D8200);
        }
        __int16 v17 = v8[167];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68289026;
          int v40 = 0;
          __int16 v41 = 2082;
          __int16 v42 = "";
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Pairing notification handled\"}", buf, 0x12u);
        }
        if ([[-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLHandledPairingNotification") boolValue] & 1] == 0) [[-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLHandledPairingNotification") boolValue] & 1] == 0) {
        [(CLAuthSyncManager *)self setShouldConfirmHandlingPairingNotification:0];
        }
        [(CLAuthSyncManager *)self endPairedSyncSessionWithError:a3];
      }
      if ([(CLAuthSyncManager *)self isQuickSwitchInProgress]
        || [(CLAuthSyncManager *)self shouldConfirmHandlingQuickSwitchNotification])
      {
        [(CLAuthSyncManager *)self reunionSyncDidComplete:a3];
      }
      if ([(CLAuthSyncManager *)self numberOfConsecutiveSyncSessionRetries] <= 99)
      {
        [(CLAuthSyncManager *)self setNumberOfConsecutiveSyncSessionRetries:(char *)[(CLAuthSyncManager *)self numberOfConsecutiveSyncSessionRetries]+ 1];
        id v18 = [[-[CLAuthSyncManager universe](self, "universe") silo];
        [(CLAuthSyncManager *)self syncSessionRetryInterval];
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_1009DB330;
        v38[3] = &unk_10229FED8;
        v38[4] = self;
        [v18 afterInterval:v38];
      }
      goto LABEL_42;
    }
    if ([(CLAuthSyncManager *)self numberOfConsecutiveSyncSessionRetries] > 99)
    {
      if (v7[166] != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      __int16 v28 = v8[167];
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_41;
      }
      *(_DWORD *)uint64_t buf = 68289026;
      int v40 = 0;
      __int16 v41 = 2082;
      __int16 v42 = "";
      unsigned int v25 = "{\"msg%{public}.0s\":\"#Warning #authsync Retry limit reached\"}";
      __int16 v26 = v28;
      uint32_t v27 = 18;
    }
    else
    {
      [(CLAuthSyncManager *)self setNumberOfConsecutiveSyncSessionRetries:(char *)[(CLAuthSyncManager *)self numberOfConsecutiveSyncSessionRetries]+ 1];
      id v20 = [[-[CLAuthSyncManager universe](self, "universe") silo];
      [(CLAuthSyncManager *)self syncSessionRetryInterval];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1009DB450;
      v37[3] = &unk_10229FED8;
      v37[4] = self;
      [v20 afterInterval:v37];
      if (v7[166] != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      long long v21 = v8[167];
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_41;
      }
      [(CLAuthSyncManager *)self syncSessionRetryInterval];
      uint64_t v23 = (uint64_t)v22;
      unsigned int v24 = [(CLAuthSyncManager *)self numberOfConsecutiveSyncSessionRetries];
      *(_DWORD *)uint64_t buf = 68289538;
      int v40 = 0;
      __int16 v41 = 2082;
      __int16 v42 = "";
      __int16 v43 = 2050;
      uint64_t v44 = v23;
      __int16 v45 = 1026;
      LODWORD(v46) = v24;
      unsigned int v25 = "{\"msg%{public}.0s\":\"#authsync Will retry another sync session\", \"retryInterval\":%{public}ld, \"retryCo"
            "unt\":%{public}d}";
      __int16 v26 = v21;
      uint32_t v27 = 34;
    }
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
LABEL_41:
    [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInCompanionQueue] addObjectsFromArray:[(CLAuthSyncManager *)self deltaSyncObjectsInGizmoQueue]];
    [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInGizmoQueue] removeAllObjects];
LABEL_42:
    [(NSMutableArray *)[(CLAuthSyncManager *)self notificationsInCompanionQueue] addObjectsFromArray:[(CLAuthSyncManager *)self notificationsInGizmoQueue]];
    [(NSMutableArray *)[(CLAuthSyncManager *)self notificationsInGizmoQueue] removeAllObjects];
    return;
  }
  if (v7[166] != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  __int16 v19 = v8[167];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v40 = 0;
    __int16 v41 = 2082;
    __int16 v42 = "";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync No devices in promixity. Not retrying.\"}", buf, 0x12u);
  }
}

- (void)fullSyncDidComplete
{
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  char v2 = [(CLAuthSyncManager *)self fullSyncObjectsInGizmoQueue];
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v28 objects:v39 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v29;
    do
    {
      BOOL v6 = 0;
      do
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v6);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022D8200);
        }
        double v8 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68289282;
          int v34 = 0;
          __int16 v35 = 2082;
          id v36 = "";
          __int16 v37 = 2114;
          id v38 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Delivered\", \"fullSyncMessage\":%{public, location:escape_only}@}", buf, 0x1Cu);
        }
        BOOL v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v28 objects:v39 count:16];
    }
    while (v4);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(CLAuthSyncManager *)self notificationsInGizmoQueue];
  id v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (!v9)
  {
    char v22 = 0;
    goto LABEL_41;
  }
  id v10 = v9;
  char v22 = 0;
  uint64_t v11 = *(void *)v25;
  do
  {
    double v12 = 0;
    do
    {
      if (*(void *)v25 != v11) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v12);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      unsigned int v14 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289282;
        int v34 = 0;
        __int16 v35 = 2082;
        id v36 = "";
        __int16 v37 = 2114;
        id v38 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Delivered\", \"notificationMessage\":%{public, location:escape_only}@}", buf, 0x1Cu);
      }
      unsigned int v15 = [v13 notification];
      switch(v15)
      {
        case 2u:
          [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanTrue forKey:@"kCLHandledMigrationSyncResetVersionNumbersNotification"];
          if ([(CLAuthSyncManager *)self shouldSendResetNotificationDuringMigrationSyncIgnoringCache:0])
          {
            [(CLAuthSyncManager *)self sendNotification:0];
          }
          else
          {
            [(CLAuthSyncManager *)self watchNeedsFullSync:@"MigrationSync"];
          }
LABEL_36:
          char v22 = 1;
          goto LABEL_37;
        case 1u:
          goto LABEL_37;
        case 0u:
          [(CLAuthSyncManager *)self setResetRecoveryMode:0];
          if ([-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLHandledResetNotification") boolValue]) goto LABEL_37; {
          [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanTrue forKey:@"kCLHandledResetNotification"];
          }
          goto LABEL_36;
      }
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      double v16 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        id v17 = [[[v13 clientKey] UTF8String];
        *(_DWORD *)uint64_t buf = 68289282;
        int v34 = 0;
        __int16 v35 = 2082;
        id v36 = "";
        __int16 v37 = 2082;
        id v38 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Unknown notification type\", \"notificationName\":%{public, location:escape_only}s}", buf, 0x1Cu);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022D8200);
        }
      }
      id v18 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        id v19 = [[[v13 clientKey] UTF8String];
        *(_DWORD *)uint64_t buf = 68289282;
        int v34 = 0;
        __int16 v35 = 2082;
        id v36 = "";
        __int16 v37 = 2082;
        id v38 = v19;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync Unknown notification type", "{\"msg%{public}.0s\":\"#authsync Unknown notification type\", \"notificationName\":%{public, location:escape_only}s}", buf, 0x1Cu);
      }
LABEL_37:
      double v12 = (char *)v12 + 1;
    }
    while (v10 != v12);
    id v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  }
  while (v10);
LABEL_41:
  [(NSMutableArray *)[(CLAuthSyncManager *)self fullSyncObjectsInGizmoQueue] removeAllObjects];
  [(NSMutableArray *)[(CLAuthSyncManager *)self notificationsInGizmoQueue] removeAllObjects];
  if ([[-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLMigrationSyncInProgress") boolValue]-[CLAuthSyncManager watchMigrationDidEnd](self, "watchMigrationDidEnd"); {
  if ([(CLAuthSyncManager *)self shouldConfirmHandlingPairingNotification])
  }
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    id v20 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v34 = 0;
      __int16 v35 = 2082;
      id v36 = "";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Pairing notification handled\"}", buf, 0x12u);
    }
    if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLHandledPairingNotification"), "BOOLValue") & 1) == 0)
    {
      [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanTrue forKey:@"kCLHandledPairingNotification"];
      char v22 = 1;
    }
    [(CLAuthSyncManager *)self setShouldConfirmHandlingPairingNotification:0];
    [(CLAuthSyncManager *)self endPairedSyncSessionWithError:0];
  }
  if ([(CLAuthSyncManager *)self isQuickSwitchInProgress]
    || [(CLAuthSyncManager *)self shouldConfirmHandlingQuickSwitchNotification])
  {
    [(CLAuthSyncManager *)self reunionSyncDidComplete:0];
  }
  if (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLFullSyncInProgress"), "BOOLValue"))
  {
    [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanFalse forKey:@"kCLFullSyncInProgress"];
    goto LABEL_57;
  }
  if (v22) {
LABEL_57:
  }
    [(CLAuthSyncManager *)self updateSyncStoreState:@"FullSyncCompletion"];
  [(CLAuthSyncManager *)self setRecoverySyncInProgress:0];
}

- (void)deltaSyncDidComplete:(id)a3
{
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = [(CLAuthSyncManager *)self deltaSyncObjectsInGizmoQueue];
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v28 objects:v39 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      double v8 = 0;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v8);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022D8200);
        }
        id v10 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68289282;
          int v34 = 0;
          __int16 v35 = 2082;
          id v36 = "";
          __int16 v37 = 2114;
          id v38 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Delivered\", \"deltaSyncMessage\":%{public, location:escape_only}@}", buf, 0x1Cu);
        }
        double v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v28 objects:v39 count:16];
    }
    while (v6);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(CLAuthSyncManager *)self notificationsInGizmoQueue];
  id v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v11)
  {
    id v12 = v11;
    char v22 = 0;
    uint64_t v13 = *(void *)v25;
    while (1)
    {
      unsigned int v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(obj);
        }
        unsigned int v15 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v14);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022D8200);
        }
        double v16 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68289282;
          int v34 = 0;
          __int16 v35 = 2082;
          id v36 = "";
          __int16 v37 = 2114;
          id v38 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Delivered\", \"notificationMessage\":%{public, location:escape_only}@}", buf, 0x1Cu);
        }
        unsigned int v17 = [v15 notification];
        switch(v17)
        {
          case 2u:
            [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanTrue forKey:@"kCLHandledMigrationSyncResetVersionNumbersNotification"];
            if ([(CLAuthSyncManager *)self shouldSendResetNotificationDuringMigrationSyncIgnoringCache:0])
            {
              [(CLAuthSyncManager *)self sendNotification:0];
            }
            else
            {
              [(CLAuthSyncManager *)self watchNeedsFullSync:@"MigrationSync"];
            }
LABEL_36:
            char v22 = 1;
            goto LABEL_37;
          case 1u:
            goto LABEL_37;
          case 0u:
            [(CLAuthSyncManager *)self setResetRecoveryMode:0];
            if ([-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLHandledResetNotification") boolValue])goto LABEL_37; {
            [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanTrue forKey:@"kCLHandledResetNotification"];
            }
            goto LABEL_36;
        }
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022D8200);
        }
        id v18 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
        {
          id v19 = [[[v15 clientKey] UTF8String];
          *(_DWORD *)uint64_t buf = 68289282;
          int v34 = 0;
          __int16 v35 = 2082;
          id v36 = "";
          __int16 v37 = 2082;
          id v38 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Unknown notification type\", \"notificationName\":%{public, location:escape_only}s}", buf, 0x1Cu);
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_1022D8200);
          }
        }
        id v20 = qword_102419538;
        if (os_signpost_enabled((os_log_t)qword_102419538))
        {
          id v21 = [[[v15 clientKey] UTF8String];
          *(_DWORD *)uint64_t buf = 68289282;
          int v34 = 0;
          __int16 v35 = 2082;
          id v36 = "";
          __int16 v37 = 2082;
          id v38 = v21;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync Unknown notification type", "{\"msg%{public}.0s\":\"#authsync Unknown notification type\", \"notificationName\":%{public, location:escape_only}s}", buf, 0x1Cu);
        }
LABEL_37:
        unsigned int v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSMutableArray *)obj countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (!v12) {
        goto LABEL_41;
      }
    }
  }
  char v22 = 0;
LABEL_41:
  [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInGizmoQueue] removeAllObjects];
  [(NSMutableArray *)[(CLAuthSyncManager *)self notificationsInGizmoQueue] removeAllObjects];
  if ([(CLAuthSyncManager *)self isQuickSwitchInProgress]
    || [(CLAuthSyncManager *)self shouldConfirmHandlingQuickSwitchNotification])
  {
    [(CLAuthSyncManager *)self reunionSyncDidComplete:0];
  }
  if (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLDeltaSyncInProgress"), "BOOLValue"))
  {
    [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanFalse forKey:@"kCLDeltaSyncInProgress"];
LABEL_47:
    [(CLAuthSyncManager *)self updateSyncStoreState:@"DeltaSyncCompletion"];
    goto LABEL_48;
  }
  if (v22) {
    goto LABEL_47;
  }
LABEL_48:
  [(CLAuthSyncManager *)self setRecoverySyncInProgress:0];
}

- (void)reunionSyncDidComplete:(id)a3
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  id v5 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    double v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sync session completion - PS - reunion sync\"}", (uint8_t *)v6, 0x12u);
  }
  [(CLAuthSyncManager *)self endPairedSyncSessionWithError:a3];
  [(CLAuthSyncManager *)self setIsQuickSwitchInProgress:0];
  [(CLAuthSyncManager *)self setShouldConfirmHandlingQuickSwitchNotification:0];
  [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanTrue forKey:@"kCLHandledQuickSwitchNotification"];
  [(CLAuthSyncManager *)self updateSyncStoreState:@"ReunionSyncCompletion"];
}

- (id)translatedKeyForSimulator:(id)a3
{
  return a3;
}

- (void)applySyncMessage:(id)a3
{
  id v5 = [a3 changeType];
  if (v5 == (id)3)
  {
    [(CLAuthSyncManager *)self applyDeleteMessage:a3];
  }
  else if (v5 == (id)2)
  {
    [(CLAuthSyncManager *)self applyUpdateMessage:a3];
  }
  else if (v5 == (id)1)
  {
    [(CLAuthSyncManager *)self applyAddMessage:a3];
  }
}

- (void)applyAddMessage:(id)a3
{
  id v5 = &qword_102419000;
  if (![a3 hasNotification])
  {
    v73 = self;
    id v8 = [[-[CLAuthSyncManager translatedKeyForSimulator:](self, "translatedKeyForSimulator:", [a3 clientKey]) UTF8String];
    unsigned int v76 = [a3 authMask];
    if ([a3 hasCorrectiveCompensationMask])
    {
      unsigned int v9 = [a3 correctiveCompensationMask];
      unsigned int v10 = v9 & 0xFFFFFF00;
      int v11 = v9;
      id v12 = &_mh_execute_header;
    }
    else
    {
      id v12 = 0;
      int v11 = 0;
      unsigned int v10 = 0;
    }
    unsigned __int8 v13 = [a3 clearClient];
    id v14 = a3;
    if ([a3 hasSuppressShowingInSettings])
    {
      unsigned __int16 v15 = (unsigned __int16)[a3 suppressShowingInSettings];
      __int16 v16 = 1;
    }
    else
    {
      __int16 v16 = 0;
      unsigned __int16 v15 = 0;
    }
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    unsigned int v17 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      int v90 = 0;
      __int16 v91 = 2082;
      v92 = "";
      __int16 v93 = 2114;
      *(void *)v94 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Applying auth add message\", \"message\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v77[2] = sub_1009DD3C8;
    v77[3] = &unk_1022D8150;
    unsigned int v78 = v76;
    unint64_t v79 = (unint64_t)v12 | v10 | v11;
    unsigned __int8 v80 = v13;
    __int16 v81 = v15 | (v16 << 8);
    v77[4] = v14;
    v77[5] = v8;
    [(CLClientManagerPublicProtocol *)[(CLAuthSyncManager *)v73 clientManager] syncgetDoSync:v77];
    return;
  }
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  id v6 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    [a3 notification];
    *(_DWORD *)uint64_t buf = 68289282;
    int v90 = 0;
    __int16 v91 = 2082;
    v92 = "";
    __int16 v93 = 2050;
    *(void *)v94 = (int)[a3 notification];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Applying notification message\", \"notification\":%{public, location:CLCompanionSyncAuthObject_CLCompanionSyncNotification}lld}", buf, 0x1Cu);
  }
  unsigned int v7 = [a3 notification];
  if (v7 != 1)
  {
    if (!v7)
    {
      [(CLClientManagerPublicProtocol *)[(CLAuthSyncManager *)self clientManager] syncgetDoSync:&stru_1022D8108];
      [(CLAuthSyncManager *)self watchNeedsFullSync:@"ResetNotification"];
    }
    return;
  }
  id v71 = a3;
  v74 = self;
  if (![a3 vectorClocksCount]
    || (long long v87 = 0u,
        long long v88 = 0u,
        long long v85 = 0u,
        long long v86 = 0u,
        id v18 = [a3 vectorClocks],
        (id v19 = [v18 countByEnumeratingWithState:&v85 objects:v102 count:16]) == 0))
  {
    uint64_t v75 = 0;
    goto LABEL_76;
  }
  id v20 = v19;
  uint64_t v75 = 0;
  uint64_t v21 = *(void *)v86;
  do
  {
    char v22 = 0;
    do
    {
      if (*(void *)v86 != v21) {
        objc_enumerationMutation(v18);
      }
      uint64_t v23 = *(void **)(*((void *)&v85 + 1) + 8 * (void)v22);
      if (objc_msgSend(v23, "hasKey", v71))
      {
        if (objc_msgSend(objc_msgSend(v23, "key"), "isEqualToString:", @"kCLToggleNotificationOnCompanion"))
        {
          if ([v23 hasValue])
          {
            HIDWORD(v75) = [v23 value];
            goto LABEL_72;
          }
          if (v5[166] != -1) {
            dispatch_once(&qword_102419530, &stru_1022D8200);
          }
          id v33 = qword_102419538;
          if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
          {
            id v34 = [v23 key];
            *(_DWORD *)uint64_t buf = 68289282;
            int v90 = 0;
            __int16 v91 = 2082;
            v92 = "";
            __int16 v93 = 2114;
            *(void *)v94 = v34;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Missing vector clock value\", \"key\":%{public, location:escape_only}@}", buf, 0x1Cu);
            if (v5[166] != -1) {
              dispatch_once(&qword_102419530, &stru_1022D8200);
            }
          }
          uint64_t v35 = qword_102419538;
          if (os_signpost_enabled((os_log_t)qword_102419538))
          {
            id v36 = [v23 key];
            *(_DWORD *)uint64_t buf = 68289282;
            int v90 = 0;
            __int16 v91 = 2082;
            v92 = "";
            __int16 v93 = 2114;
            *(void *)v94 = v36;
            long long v28 = v35;
            long long v29 = "#authsync Missing vector clock value";
            long long v30 = "{\"msg%{public}.0s\":\"#authsync Missing vector clock value\", \"key\":%{public, location:escape_only}@}";
            goto LABEL_70;
          }
        }
        else
        {
          unsigned int v31 = [[[v23 key] isEqualToString:@"kCLToggleNotificationOnGizmo"]
          unsigned int v32 = [v23 hasValue];
          if (v31)
          {
            if (v32)
            {
              LODWORD(v75) = [v23 value];
              goto LABEL_72;
            }
            if (v5[166] != -1) {
              dispatch_once(&qword_102419530, &stru_1022D8200);
            }
            __int16 v45 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
            {
              id v46 = [v23 key];
              *(_DWORD *)uint64_t buf = 68289282;
              int v90 = 0;
              __int16 v91 = 2082;
              v92 = "";
              __int16 v93 = 2114;
              *(void *)v94 = v46;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#authsync Missing notificationValue\", \"key\":%{public, location:escape_only}@}", buf, 0x1Cu);
              if (v5[166] != -1) {
                dispatch_once(&qword_102419530, &stru_1022D8200);
              }
            }
            uint64_t v47 = qword_102419538;
            if (os_signpost_enabled((os_log_t)qword_102419538))
            {
              id v48 = [v23 key];
              *(_DWORD *)uint64_t buf = 68289282;
              int v90 = 0;
              __int16 v91 = 2082;
              v92 = "";
              __int16 v93 = 2114;
              *(void *)v94 = v48;
              long long v28 = v47;
              long long v29 = "#authsync Missing notificationValue";
              long long v30 = "{\"msg%{public}.0s\":\"#authsync Missing notificationValue\", \"key\":%{public, location:escape_only}@}";
              goto LABEL_70;
            }
          }
          else
          {
            uint64_t v37 = v5[166];
            if (v32)
            {
              if (v37 != -1) {
                dispatch_once(&qword_102419530, &stru_1022D8200);
              }
              id v38 = qword_102419538;
              if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
              {
                id v39 = [v23 key];
                unsigned int v40 = [v23 value];
                *(_DWORD *)uint64_t buf = 68289538;
                int v90 = 0;
                __int16 v91 = 2082;
                v92 = "";
                __int16 v93 = 2114;
                *(void *)v94 = v39;
                id v5 = &qword_102419000;
                *(_WORD *)&v94[8] = 1026;
                *(_DWORD *)v95 = v40;
                _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#authsync Unknown vector lock\", \"key\":%{public, location:escape_only}@, \"value\":%{public}d}", buf, 0x22u);
                if (qword_102419530 != -1) {
                  dispatch_once(&qword_102419530, &stru_1022D8200);
                }
              }
              uint64_t v41 = qword_102419538;
              if (os_signpost_enabled((os_log_t)qword_102419538))
              {
                id v42 = [v23 key];
                unsigned int v43 = [v23 value];
                *(_DWORD *)uint64_t buf = 68289538;
                int v90 = 0;
                __int16 v91 = 2082;
                v92 = "";
                __int16 v93 = 2114;
                *(void *)v94 = v42;
                id v5 = &qword_102419000;
                *(_WORD *)&v94[8] = 1026;
                *(_DWORD *)v95 = v43;
                long long v28 = v41;
                long long v29 = "#authsync Unknown vector lock";
                long long v30 = "{\"msg%{public}.0s\":\"#authsync Unknown vector lock\", \"key\":%{public, location:escape_only}@, "
                      "\"value\":%{public}d}";
                uint32_t v44 = 34;
                goto LABEL_71;
              }
            }
            else
            {
              if (v37 != -1) {
                dispatch_once(&qword_102419530, &stru_1022D8200);
              }
              __int16 v49 = qword_102419538;
              if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
              {
                id v50 = [v23 key];
                *(_DWORD *)uint64_t buf = 68289282;
                int v90 = 0;
                __int16 v91 = 2082;
                v92 = "";
                __int16 v93 = 2114;
                *(void *)v94 = v50;
                _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#authsync Unknown vector lock with no value\", \"key\":%{public, location:escape_only}@}", buf, 0x1Cu);
                if (v5[166] != -1) {
                  dispatch_once(&qword_102419530, &stru_1022D8200);
                }
              }
              uint64_t v51 = qword_102419538;
              if (os_signpost_enabled((os_log_t)qword_102419538))
              {
                id v52 = [v23 key];
                *(_DWORD *)uint64_t buf = 68289282;
                int v90 = 0;
                __int16 v91 = 2082;
                v92 = "";
                __int16 v93 = 2114;
                *(void *)v94 = v52;
                long long v28 = v51;
                long long v29 = "#authsync Unknown vector lock with no value";
                long long v30 = "{\"msg%{public}.0s\":\"#authsync Unknown vector lock with no value\", \"key\":%{public, location:escape_only}@}";
LABEL_70:
                uint32_t v44 = 28;
LABEL_71:
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v29, v30, buf, v44);
              }
            }
          }
        }
      }
      else
      {
        if (v5[166] != -1) {
          dispatch_once(&qword_102419530, &stru_1022D8200);
        }
        long long v24 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
        {
          id v25 = [v23 key];
          *(_DWORD *)uint64_t buf = 68289282;
          int v90 = 0;
          __int16 v91 = 2082;
          v92 = "";
          __int16 v93 = 2114;
          *(void *)v94 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Missing vector clock key\", \"key\":%{public, location:escape_only}@}", buf, 0x1Cu);
          if (v5[166] != -1) {
            dispatch_once(&qword_102419530, &stru_1022D8200);
          }
        }
        uint64_t v26 = qword_102419538;
        if (os_signpost_enabled((os_log_t)qword_102419538))
        {
          id v27 = [v23 key];
          *(_DWORD *)uint64_t buf = 68289282;
          int v90 = 0;
          __int16 v91 = 2082;
          v92 = "";
          __int16 v93 = 2114;
          *(void *)v94 = v27;
          long long v28 = v26;
          long long v29 = "#authsync Missing vector clock key";
          long long v30 = "{\"msg%{public}.0s\":\"#authsync Missing vector clock key\", \"key\":%{public, location:escape_only}@}";
          goto LABEL_70;
        }
      }
LABEL_72:
      char v22 = (char *)v22 + 1;
    }
    while (v20 != v22);
    id v20 = [v18 countByEnumeratingWithState:&v85 objects:v102 count:16];
  }
  while (v20);
LABEL_76:
  unsigned int v84 = 0;
  uint64_t v53 = sub_1000A6958();
  unsigned int v54 = HIDWORD(v75);
  if ((sub_1004D0870(v53, (const char *)[@"kCLToggleNotificationOnCompanion" UTF8String], &v84) & 1) == 0)
  {
    if (v5[166] != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    __int16 v55 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v90 = 0;
      __int16 v91 = 2082;
      v92 = "";
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Missing kCLToggleNotificationOnCompanion on disk\"}", buf, 0x12u);
      if (v5[166] != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
    }
    uint64_t v56 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v90 = 0;
      __int16 v91 = 2082;
      v92 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v56, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync Missing kCLToggleNotificationOnCompanion on disk", "{\"msg%{public}.0s\":\"#authsync Missing kCLToggleNotificationOnCompanion on disk\"}", buf, 0x12u);
    }
  }
  unsigned int v57 = [[-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState", v71), "objectForKey:", @"kCLToggleNotificationOnGizmo") unsignedIntValue];
  int v58 = sub_1001198FC();
  if (v5[166] != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  __int16 v59 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v60 = v84;
    unsigned int v61 = [v72 authMask];
    *(_DWORD *)uint64_t buf = 68290562;
    int v90 = 0;
    __int16 v91 = 2082;
    v92 = "";
    __int16 v93 = 1026;
    *(_DWORD *)v94 = v60;
    unsigned int v54 = HIDWORD(v75);
    *(_WORD *)&v94[4] = 1026;
    *(_DWORD *)&v94[6] = HIDWORD(v75);
    *(_WORD *)v95 = 1026;
    *(_DWORD *)&v95[2] = v57;
    __int16 v96 = 1026;
    int v97 = v75;
    __int16 v98 = 1026;
    BOOL v99 = v58 != 0;
    __int16 v100 = 1026;
    BOOL v101 = v61 != 0;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync TOGGLE vector clock\", \"onDiskCompanion\":%{public}d, \"onWireCompanion\":%{public}d, \"onDiskGizmo\":%{public}d, \"onWireGizmo\":%{public}d, \"onDiskLS\":%{public}hhd, \"onWireLS\":%{public}hhd}", buf, 0x36u);
  }
  unsigned int v62 = v84;
  if (v84 <= v54)
  {
LABEL_91:
    if (v75 <= v57) {
      uint64_t v63 = v57;
    }
    else {
      uint64_t v63 = v75;
    }
    BOOL v64 = v62 >= v54;
    if (v62 <= v54) {
      unsigned int v62 = v54;
    }
    unsigned int v83 = v62;
    if (!v64)
    {
      uint64_t v65 = sub_1000A6958();
      sub_1004D2BC4(v65, (const char *)[@"kCLToggleNotificationOnCompanion" UTF8String], &v83);
    }
    if (v75 > v57)
    {
      [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:+[NSNumber numberWithInt:v63] forKey:@"kCLToggleNotificationOnGizmo"];
      [(CLAuthSyncManager *)self updateSyncStoreState:@"ReceivedLSToggleNotification"];
    }
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_1009DD388;
    v82[3] = &unk_1022CA588;
    v82[4] = v72;
    [(CLClientManagerPublicProtocol *)[(CLAuthSyncManager *)self clientManager] syncgetDoSync:v82];
    if (v84 > v54 || v57 > v75)
    {
      if (v57 <= v75)
      {
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022D8200);
        }
        v70 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68289026;
          int v90 = 0;
          __int16 v91 = 2082;
          v92 = "";
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Resolving vector clock conflict\"}", buf, 0x12u);
        }
      }
      else
      {
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022D8200);
        }
        v66 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)uint64_t buf = 68289026;
          int v90 = 0;
          __int16 v91 = 2082;
          v92 = "";
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#authsync onDiskToggleVersionNumberOnGizmo > onWireToggleVersionNumberOnGizmo\"}", buf, 0x12u);
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_1022D8200);
          }
        }
        v67 = qword_102419538;
        if (os_signpost_enabled((os_log_t)qword_102419538))
        {
          *(_DWORD *)uint64_t buf = 68289026;
          int v90 = 0;
          __int16 v91 = 2082;
          v92 = "";
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v67, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync onDiskToggleVersionNumberOnGizmo > onWireToggleVersionNumberOnGizmo", "{\"msg%{public}.0s\":\"#authsync onDiskToggleVersionNumberOnGizmo > onWireToggleVersionNumberOnGizmo\"}", buf, 0x12u);
        }
      }
      goto LABEL_122;
    }
  }
  else
  {
    if ([v72 authMask] == (v58 != 0))
    {
      unsigned int v62 = v84;
      goto LABEL_91;
    }
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    v68 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v90 = 0;
      __int16 v91 = 2082;
      v92 = "";
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Resolving the conflict by turning off location services\"}", buf, 0x12u);
    }
    if (v75 <= v57) {
      uint64_t v69 = v57;
    }
    else {
      uint64_t v69 = v75;
    }
    [(NSMutableDictionary *)[(CLAuthSyncManager *)v74 authSyncStoreState] setObject:+[NSNumber numberWithUnsignedInt:v69] forKey:@"kCLToggleNotificationOnGizmo"];
    [(CLAuthSyncManager *)v74 updateSyncStoreState:@"LSToggleConflictResolutionDuringAdd"];
    [(CLClientManagerPublicProtocol *)[(CLAuthSyncManager *)v74 clientManager] syncgetDoSync:&stru_1022D8128];
    [(CLAuthSyncManager *)v74 setIsConflictResolutionMode:1];
LABEL_122:
    [(CLAuthSyncManager *)v74 sendNotification:1];
  }
}

- (void)applyUpdateMessage:(id)a3
{
  if ([a3 hasNotification])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    id v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      [a3 notification];
      *(_DWORD *)uint64_t buf = 68289282;
      int v22 = 0;
      __int16 v23 = 2082;
      long long v24 = "";
      __int16 v25 = 2050;
      id v26 = (id)(int)[a3 notification];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Applying notification message\", \"notification\":%{public, location:CLCompanionSyncAuthObject_CLCompanionSyncNotification}lld}", buf, 0x1Cu);
    }
    if (![a3 notification])
    {
      [(CLClientManagerPublicProtocol *)[(CLAuthSyncManager *)self clientManager] syncgetDoSync:&stru_1022D8170];
      [(CLAuthSyncManager *)self watchNeedsFullSync:@"ResetNotification"];
    }
  }
  else
  {
    id v6 = [[-[CLAuthSyncManager translatedKeyForSimulator:](self, "translatedKeyForSimulator:", [a3 clientKey]) UTF8String];
    unsigned int v15 = [a3 authMask];
    if ([a3 hasCorrectiveCompensationMask])
    {
      unsigned int v7 = [a3 correctiveCompensationMask];
      unsigned int v8 = v7 & 0xFFFFFF00;
      int v9 = v7;
      unsigned int v10 = &_mh_execute_header;
    }
    else
    {
      unsigned int v10 = 0;
      int v9 = 0;
      unsigned int v8 = 0;
    }
    unsigned __int8 v11 = [a3 clearClient];
    if ([a3 hasSuppressShowingInSettings])
    {
      unsigned __int16 v12 = (unsigned __int16)[a3 suppressShowingInSettings];
      __int16 v13 = 1;
    }
    else
    {
      __int16 v13 = 0;
      unsigned __int16 v12 = 0;
    }
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    id v14 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      int v22 = 0;
      __int16 v23 = 2082;
      long long v24 = "";
      __int16 v25 = 2114;
      id v26 = a3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Applying auth update message\", \"message\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1009DD788;
    v16[3] = &unk_1022D8150;
    unsigned int v17 = v15;
    unint64_t v18 = (unint64_t)v10 | v8 | v9;
    unsigned __int8 v19 = v11;
    __int16 v20 = v12 | (v13 << 8);
    v16[4] = a3;
    v16[5] = v6;
    [(CLClientManagerPublicProtocol *)[(CLAuthSyncManager *)self clientManager] syncgetDoSync:v16];
  }
}

- (void)applyDeleteMessage:(id)a3
{
  id v5 = [[-[CLAuthSyncManager translatedKeyForSimulator:](self, "translatedKeyForSimulator:", [a3 clientKey]) UTF8String];
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  id v6 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289282;
    int v9 = 0;
    __int16 v10 = 2082;
    unsigned __int8 v11 = "";
    __int16 v12 = 2114;
    id v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Applying auth delete message\", \"message\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  _DWORD v7[2] = sub_1009DD9B0;
  v7[3] = &unk_1022C1698;
  v7[4] = v5;
  [(CLClientManagerPublicProtocol *)[(CLAuthSyncManager *)self clientManager] syncgetDoSync:v7];
}

- (void)sendGlobalAuthStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(CLAuthSyncManager *)self isThereAWatch])
  {
    if ([(CLAuthSyncManager *)self isWatchBuildVersionPriorTo:0x40000])
    {
      [(CLAuthSyncManager *)self updateReunionSyncListsWithAuthSyncMessageKey:&stru_10234F018];
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      id v5 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        int v11 = 0;
        __int16 v12 = 2082;
        id v13 = "";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sending LS toggle to watch running pre-Fortune\"}", buf, 0x12u);
      }
      id v6 = objc_alloc_init(CLCompanionSyncAuthObject);
      [(CLCompanionSyncAuthObject *)v6 setClientKey:&stru_10234F018];
      [(CLCompanionSyncAuthObject *)v6 setAuthMask:v3];
      [(CLCompanionSyncAuthObject *)v6 setOperationType:1];
      id v7 = objc_alloc_init((Class)NSMutableIndexSet);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      _DWORD v9[2] = sub_1009DDD18;
      v9[3] = &unk_1022D8080;
      v9[4] = v6;
      v9[5] = v7;
      [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInCompanionQueue] enumerateObjectsUsingBlock:v9];
      [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInCompanionQueue] removeObjectsAtIndexes:v7];
      [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInCompanionQueue] addObject:v6];
      if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLDeltaSyncInProgress"), "BOOLValue") & 1) == 0)
      {
        [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanTrue forKey:@"kCLDeltaSyncInProgress"];
        [(CLAuthSyncManager *)self updateSyncStoreState:@"GlobalAuthState"];
      }
      [(CLAuthSyncManager *)self watchNeedsDeltaSync:@"GlobalAuthState"];
    }
    else
    {
      [(CLAuthSyncManager *)self sendNotification:1];
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    unsigned int v8 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v11 = 0;
      __int16 v12 = 2082;
      id v13 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Dropping add global auth sync message in the absence of an active watch\"}", buf, 0x12u);
    }
  }
}

- (void)sendNotification:(int)a3
{
  if (a3 == 2)
  {
    id v5 = [(CLAuthSyncManager *)self migrationSyncResetVersionNumbersNotification];
    CFStringRef v4 = @"MIGRATION_SYNC_RESET_VERSION_NUMBERS";
  }
  else if (a3 == 1)
  {
    [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanTrue forKey:@"kCLDeltaSyncInProgress"];
    [(CLAuthSyncManager *)self updateSyncStoreState:@"SendingLSToggleNotification"];
    [(CLAuthSyncManager *)self updateReunionSyncListsWithAuthSyncMessageKey:@"TOGGLE"];
    if (![(CLAuthSyncManager *)self isConflictResolutionMode]) {
      [(CLAuthSyncManager *)self updateSyncStoreStateForVersionedKey:@"kCLToggleNotificationOnCompanion" withUpdateReason:@"LSToggle"];
    }
    id v5 = [(CLAuthSyncManager *)self locationServicesToggleAsNotification];
    CFStringRef v4 = @"SendingLSToggleNotification";
  }
  else if (a3)
  {
    id v5 = 0;
    CFStringRef v4 = &stru_10234F018;
  }
  else
  {
    [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanFalse forKey:@"kCLHandledResetNotification"];
    CFStringRef v4 = @"MigrationSync-RESET";
    [(CLAuthSyncManager *)self updateSyncStoreState:@"MigrationSync-RESET"];
    if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLMigrationSyncInProgress"), "BOOLValue") & 1) == 0)
    {
      [(CLAuthSyncManager *)self updateSyncStoreStateForVersionedKey:@"kCLResetNotification" withUpdateReason:@"ResetNotification"];
      [(CLAuthSyncManager *)self updateReunionSyncListsWithAuthSyncMessageKey:@"RESET"];
      CFStringRef v4 = @"SendRESET";
    }
    id v5 = [(CLAuthSyncManager *)self resetAsNotifcation];
  }
  id v6 = objc_alloc_init((Class)NSMutableIndexSet);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  _DWORD v7[2] = sub_1009DE048;
  v7[3] = &unk_1022D8080;
  v7[4] = v5;
  void v7[5] = v6;
  [(NSMutableArray *)[(CLAuthSyncManager *)self notificationsInCompanionQueue] enumerateObjectsUsingBlock:v7];
  [(NSMutableArray *)[(CLAuthSyncManager *)self notificationsInCompanionQueue] removeObjectsAtIndexes:v6];
  [(NSMutableArray *)[(CLAuthSyncManager *)self notificationsInCompanionQueue] addObject:v5];
  [(CLAuthSyncManager *)self watchNeedsDeltaSync:v4];
}

- (void)addObject:(id)a3 withSyncSessionReason:(id)a4
{
  -[CLAuthSyncManager updateReunionSyncListsWithAuthSyncMessageKey:](self, "updateReunionSyncListsWithAuthSyncMessageKey:", [a3 clientKey]);
  if ([(CLAuthSyncManager *)self isThereAWatch])
  {
    [a3 setClientKey:-[CLAuthSyncManager getTranslatedGizmoKeyForCompanionClient:](self, "getTranslatedGizmoKeyForCompanionClient:", [a3 clientKey])];
    id v7 = objc_alloc_init((Class)NSMutableIndexSet);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    _DWORD v9[2] = sub_1009DE39C;
    v9[3] = &unk_1022D8080;
    v9[4] = a3;
    v9[5] = v7;
    [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInCompanionQueue] enumerateObjectsUsingBlock:v9];
    [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInCompanionQueue] removeObjectsAtIndexes:v7];
    [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInCompanionQueue] addObject:a3];
    if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLDeltaSyncInProgress"), "BOOLValue") & 1) == 0)
    {
      [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanTrue forKey:@"kCLDeltaSyncInProgress"];
      [(CLAuthSyncManager *)self updateSyncStoreState:@"AuthorizationAdd"];
    }
    [(CLAuthSyncManager *)self translateCompanionSyncAuthObjectsInPlace:[(CLAuthSyncManager *)self deltaSyncObjectsInCompanionQueue]];
    [(CLAuthSyncManager *)self watchNeedsDeltaSync:a4];
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    unsigned int v8 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v11 = 0;
      __int16 v12 = 2082;
      id v13 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Dropping add auth sync message - no watch\"}", buf, 0x12u);
    }
  }
}

- (void)deleteObject:(id)a3 withSyncSessionReason:(id)a4
{
  -[CLAuthSyncManager updateReunionSyncListsWithAuthSyncMessageKey:](self, "updateReunionSyncListsWithAuthSyncMessageKey:", [a3 clientKey]);
  if ([(CLAuthSyncManager *)self isThereAWatch])
  {
    [a3 setClientKey:-[CLAuthSyncManager getTranslatedGizmoKeyForCompanionClient:](self, "getTranslatedGizmoKeyForCompanionClient:", [a3 clientKey])];
    id v7 = objc_alloc_init((Class)NSMutableIndexSet);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    _DWORD v9[2] = sub_1009DE6DC;
    v9[3] = &unk_1022D8080;
    v9[4] = a3;
    v9[5] = v7;
    [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInCompanionQueue] enumerateObjectsUsingBlock:v9];
    [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInCompanionQueue] removeObjectsAtIndexes:v7];
    [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInCompanionQueue] addObject:a3];
    if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLDeltaSyncInProgress"), "BOOLValue") & 1) == 0)
    {
      [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanTrue forKey:@"kCLDeltaSyncInProgress"];
      [(CLAuthSyncManager *)self updateSyncStoreState:@"AuthorizationDelete"];
    }
    [(CLAuthSyncManager *)self watchNeedsDeltaSync:a4];
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    unsigned int v8 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v11 = 0;
      __int16 v12 = 2082;
      id v13 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Dropping delete auth sync request - no watch\"}", buf, 0x12u);
    }
  }
}

- (void)watchNeedsFullSync:(id)a3
{
  if (![(CLAuthSyncManager *)self isThereAWatch])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    uint64_t v6 = qword_102419538;
    if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    uint64_t v12 = 68289026;
    *(_WORD *)id v13 = 2082;
    *(void *)&v13[2] = "";
    id v7 = "{\"msg%{public}.0s\":\"#authsync Dropping full auth sync request - no watch\"}";
    unsigned int v8 = v6;
    uint32_t v9 = 18;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, v9);
LABEL_13:
    -[CLAuthSyncManager setRecoverySyncInProgress:](self, "setRecoverySyncInProgress:", 0, v12, *(_OWORD *)v13, *(_OWORD *)&v13[16]);
    return;
  }
  if ([(CLAuthSyncManager *)self syncRestriction])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    id v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = 68289026;
      *(_WORD *)id v13 = 2082;
      *(void *)&v13[2] = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Dropping full auth sync request - sync is restricted\"}", (uint8_t *)&v12, 0x12u);
    }
    [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanTrue forKey:@"kCLFullSyncInProgress"];
    [(CLAuthSyncManager *)self updateSyncStoreState:@"DroppingFullSyncRequest-PairedSyncRestrict"];
    goto LABEL_13;
  }
  if (!objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLFullSyncInProgress"), "BOOLValue")|| objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLDeltaSyncInProgress"), "BOOLValue"))
  {
    [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanTrue forKey:@"kCLFullSyncInProgress"];
    [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanFalse forKey:@"kCLDeltaSyncInProgress"];
    [(CLAuthSyncManager *)self updateSyncStoreState:@"FullSyncStart"];
  }
  if (![(CLAuthSyncManager *)self isDeviceNearbyAndConnected])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    uint64_t v11 = qword_102419538;
    if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    uint64_t v12 = 68289538;
    *(_WORD *)id v13 = 2082;
    *(void *)&v13[2] = "";
    *(_WORD *)&v13[10] = 2114;
    *(void *)&v13[12] = a3;
    *(_WORD *)&v13[20] = 2114;
    *(void *)&v13[22] = @"Device is disconnected";
    id v7 = "{\"msg%{public}.0s\":\"#authsync Dropping the full sync request\", \"syncReason\":%{public, location:escape_onl"
         "y}@, \"denialReason\":%{public, location:escape_only}@}";
    unsigned int v8 = v11;
    uint32_t v9 = 38;
    goto LABEL_12;
  }
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  __int16 v10 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = 68289282;
    *(_WORD *)id v13 = 2082;
    *(void *)&v13[2] = "";
    *(_WORD *)&v13[10] = 2114;
    *(void *)&v13[12] = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Requesting full sync\", \"syncReason\":%{public, location:escape_only}@}", (uint8_t *)&v12, 0x1Cu);
  }
  [(SYService *)[(CLAuthSyncManager *)self syncService] setNeedsResetSync];
}

- (void)watchNeedsDeltaSync:(id)a3
{
  if ([(CLAuthSyncManager *)self isDeviceNearbyAndConnected])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    id v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 68289282;
      int v8 = 0;
      __int16 v9 = 2082;
      __int16 v10 = "";
      __int16 v11 = 2114;
      id v12 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Requesting a delta sync session\", \"syncReason\":%{public, location:escape_only}@}", (uint8_t *)&v7, 0x1Cu);
    }
    [(SYService *)[(CLAuthSyncManager *)self syncService] setHasChangesAvailable];
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    uint64_t v6 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 68289538;
      int v8 = 0;
      __int16 v9 = 2082;
      __int16 v10 = "";
      __int16 v11 = 2114;
      id v12 = a3;
      __int16 v13 = 2114;
      CFStringRef v14 = @"Device is disconnected";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Dropping the delta sync request\", \"syncReason\":%{public, location:escape_only}@, \"denialReason\":%{public, location:escape_only}@}", (uint8_t *)&v7, 0x26u);
    }
  }
}

- (void)considerPerformingAForcedFullSync
{
  sub_100103240();
  if ((sub_10010145C() & 1) == 0)
  {
    sub_1000C7F88(buf);
    char v2 = sub_10013E418(*(uint64_t *)buf, @"kCLVersionOfLastFullSync", &dword_10247F64C);
    if (dword_10247F64C == 6) {
      char v3 = v2;
    }
    else {
      char v3 = 0;
    }
    if (*(void *)v24) {
      sub_1000DB0A0(*(std::__shared_weak_count **)v24);
    }
    if ((v3 & 1) == 0)
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      CFStringRef v4 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289538;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)long long v24 = 2082;
        *(void *)&v24[2] = "";
        __int16 v25 = 1026;
        *(_DWORD *)id v26 = dword_10247F64C;
        *(_WORD *)&v26[4] = 1026;
        *(_DWORD *)&v26[6] = 6;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Forcing full auth sync due to version\", \"foundVersion\":%{public}d, \"requiredVersion\":%{public}d}", buf, 0x1Eu);
      }
      id v5 = [[[off_10241F810[0]() sharedInstance] getPairedDevices];
      if ((unint64_t)[v5 count] >= 2)
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v6 = [v5 countByEnumeratingWithState:&v19 objects:v28 count:16];
        if (v6)
        {
          uint64_t v7 = *(void *)v20;
          do
          {
            int v8 = 0;
            do
            {
              if (*(void *)v20 != v7) {
                objc_enumerationMutation(v5);
              }
              id v9 = *(id *)(*((void *)&v19 + 1) + 8 * (void)v8);
              if (v9 != objc_msgSend(objc_msgSend((Class)off_10241F810[0](), "sharedInstance"), "getActivePairedDevice"))
              {
                id v10 = [[[[[objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v9, "valueForProperty:", off_10241F818[0]()), "stringByAppendingPathComponent:", @"CoreLocation"), "stringByAppendingPathComponent:", @"AUTH"), "stringByAppendingPathComponent:", @"SyncState");
                __int16 v11 = +[NSMutableDictionary dictionaryWithContentsOfFile:v10];
                [(NSMutableDictionary *)v11 setObject:&__kCFBooleanTrue forKey:@"kCLFullSyncInProgress"];
                if ([(NSMutableDictionary *)v11 writeToFile:v10 atomically:1])
                {
                  if (qword_102419530 != -1) {
                    dispatch_once(&qword_102419530, &stru_1022D8200);
                  }
                  id v12 = qword_102419538;
                  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
                  {
                    id v13 = [v10 UTF8String];
                    *(_DWORD *)uint64_t buf = 68289538;
                    *(_DWORD *)&uint8_t buf[4] = 0;
                    *(_WORD *)long long v24 = 2082;
                    *(void *)&v24[2] = "";
                    __int16 v25 = 2082;
                    *(void *)id v26 = v13;
                    *(_WORD *)&v26[8] = 2114;
                    id v27 = v11;
                    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync SyncStoreState updated\", \"syncStorePath\":%{public, location:escape_only}s, \"newSyncState\":%{public, location:escape_only}@}", buf, 0x26u);
                  }
                }
                else
                {
                  if (qword_102419530 != -1) {
                    dispatch_once(&qword_102419530, &stru_1022D8200);
                  }
                  CFStringRef v14 = qword_102419538;
                  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
                  {
                    id v15 = [v10 UTF8String];
                    *(_DWORD *)uint64_t buf = 68289282;
                    *(_DWORD *)&uint8_t buf[4] = 0;
                    *(_WORD *)long long v24 = 2082;
                    *(void *)&v24[2] = "";
                    __int16 v25 = 2082;
                    *(void *)id v26 = v15;
                    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync Writing SyncStoreState failed\", \"syncStorePath\":%{public, location:escape_only}s}", buf, 0x1Cu);
                    if (qword_102419530 != -1) {
                      dispatch_once(&qword_102419530, &stru_1022D8200);
                    }
                  }
                  __int16 v16 = qword_102419538;
                  if (os_signpost_enabled((os_log_t)qword_102419538))
                  {
                    id v17 = [v10 UTF8String];
                    *(_DWORD *)uint64_t buf = 68289282;
                    *(_DWORD *)&uint8_t buf[4] = 0;
                    *(_WORD *)long long v24 = 2082;
                    *(void *)&v24[2] = "";
                    __int16 v25 = 2082;
                    *(void *)id v26 = v17;
                    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync Writing SyncStoreState failed", "{\"msg%{public}.0s\":\"#authsync Writing SyncStoreState failed\", \"syncStorePath\":%{public, location:escape_only}s}", buf, 0x1Cu);
                  }
                }
              }
              int v8 = (char *)v8 + 1;
            }
            while (v6 != v8);
            id v6 = [v5 countByEnumeratingWithState:&v19 objects:v28 count:16];
          }
          while (v6);
        }
      }
      [(CLAuthSyncManager *)self watchNeedsFullSync:@"FullSyncVersionMismatch"];
    }
  }
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  if (objc_msgSend(a4, "count", a3))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [a4 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(a4);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (-[NSString isEqualToString:](-[NSUUID UUIDString](-[CLAuthSyncManager pairedDeviceUUID](self, "pairedDeviceUUID"), "UUIDString"), "isEqualToString:", objc_msgSend(objc_msgSend(v10, "nsuuid"), "UUIDString"))&& objc_msgSend(v10, "isNearby")&& objc_msgSend(v10, "isConnected"))
          {
            if (qword_102419530 != -1) {
              dispatch_once(&qword_102419530, &stru_1022D8200);
            }
            id v12 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t buf = 68289026;
              int v18 = 0;
              __int16 v19 = 2082;
              long long v20 = "";
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Device established peer-to-peer connection\"}", buf, 0x12u);
            }
            [(CLAuthSyncManager *)self setIsDeviceNearbyAndConnected:1];
            [(CLAuthSyncManager *)self checkSyncStoreStateWhenDevicesConnectAfterDisconnection];
            return;
          }
        }
        id v7 = [a4 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  [(CLAuthSyncManager *)self setIsDeviceNearbyAndConnected:0];
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  __int16 v11 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v18 = 0;
    __int16 v19 = 2082;
    long long v20 = "";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync No nearby devices with peer-to-peer connection\"}", buf, 0x12u);
  }
}

- (void)service:(id)a3 willSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe", a3, a4, a5), "silo") assertInside];
  [(SYService *)[(CLAuthSyncManager *)self syncService] suspend];
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  id v6 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289026;
    v7[1] = 0;
    __int16 v8 = 2082;
    id v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync SYService suspended\"}", (uint8_t *)v7, 0x12u);
  }
}

- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe", a3), "silo") assertInside];
  [(CLAuthSyncManager *)self setActivePairingID:a5];
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  __int16 v8 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289538;
    int v27 = 0;
    __int16 v28 = 2082;
    long long v29 = "";
    __int16 v30 = 2082;
    id v31 = [[[a4 UUIDString] UTF8String];
    __int16 v32 = 2082;
    id v33 = [[[a5 UUIDString] UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync SYService device switch\", \"oldPairingID\":%{public, location:escape_only}s, \"newPairingID\":%{public, location:escape_only}s}", buf, 0x26u);
  }
  id v25 = 0;
  [(SYService *)[(CLAuthSyncManager *)self syncService] resume:&v25];
  if (v25)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    id v9 = qword_102419538;
    if ([v25 code] == (id)2002)
    {
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    }
    else if ([v25 code] == (id)2003)
    {
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      os_log_type_t v10 = OS_LOG_TYPE_FAULT;
    }
    if (os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      int v27 = 0;
      __int16 v28 = 2082;
      long long v29 = "";
      __int16 v30 = 2114;
      id v31 = v25;
      id v12 = "{\"msg%{public}.0s\":\"#authsync Resuming SYService failed\", \"error\":%{public, location:escape_only}@}";
      long long v13 = v9;
      os_log_type_t v14 = v10;
      uint32_t v15 = 28;
      goto LABEL_19;
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    uint64_t v11 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v27 = 0;
      __int16 v28 = 2082;
      long long v29 = "";
      id v12 = "{\"msg%{public}.0s\":\"#authsync SYService resumed\"}";
      long long v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      uint32_t v15 = 18;
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, buf, v15);
    }
  }
  if (!a4)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    int v18 = qword_102419538;
    if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    *(_DWORD *)uint64_t buf = 68289026;
    int v27 = 0;
    __int16 v28 = 2082;
    long long v29 = "";
    __int16 v19 = "{\"msg%{public}.0s\":\"#authsync New/migrated device\"}";
    goto LABEL_33;
  }
  if (a5)
  {
    id v16 = [[[off_10241F810[0]() sharedInstance] getActivePairedDevice];
    if (v16)
    {
      if (+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v16, "valueForProperty:", off_10241F818[0]()), "stringByAppendingPathComponent:", @"CoreLocation"), "stringByAppendingPathComponent:", @"AUTH"), "stringByAppendingPathComponent:", @"SyncState")))
      {
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022D8200);
        }
        id v17 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68289026;
          int v27 = 0;
          __int16 v28 = 2082;
          long long v29 = "";
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Quick switch - CS\"}", buf, 0x12u);
        }
        [(CLAuthSyncManager *)self setIsQuickSwitchInProgress:1];
        [(CLAuthSyncManager *)self setShouldConfirmHandlingQuickSwitchNotification:1];
        [(CLAuthSyncManager *)self setIsThereAWatch:1];
        [(CLAuthSyncManager *)self setIsDeviceNearbyAndConnected:1];
        [(CLAuthSyncManager *)self updateActivePairedDeviceInfo];
        [(NSMutableDictionary *)[(CLAuthSyncManager *)self authSyncStoreState] setObject:&__kCFBooleanFalse forKey:@"kCLHandledQuickSwitchNotification"];
        [(CLAuthSyncManager *)self updateSyncStoreState:@"QuickSwitch-CS"];
        return;
      }
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      int v18 = qword_102419538;
      if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
LABEL_34:
        [(CLAuthSyncManager *)self handlePairing];
        return;
      }
      *(_DWORD *)uint64_t buf = 68289026;
      int v27 = 0;
      __int16 v28 = 2082;
      long long v29 = "";
      __int16 v19 = "{\"msg%{public}.0s\":\"#authsync Looks like a new paired device\"}";
LABEL_33:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0x12u);
      goto LABEL_34;
    }
    [(CLAuthSyncManager *)self setFullPathForSyncState:0];
    [(CLAuthSyncManager *)self setIsThereAWatch:0];
    [(CLAuthSyncManager *)self setIsDeviceNearbyAndConnected:0];
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    long long v21 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      id v22 = [[objc_msgSend(a5, "UUIDString") UTF8String];
      *(_DWORD *)uint64_t buf = 68289282;
      int v27 = 0;
      __int16 v28 = 2082;
      long long v29 = "";
      __int16 v30 = 2082;
      id v31 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#authsync No watch for pairing ID\", \"CSPairingID\":%{public, location:escape_only}s}", buf, 0x1Cu);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
    }
    __int16 v23 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      id v24 = [[objc_msgSend(a5, "UUIDString") UTF8String];
      *(_DWORD *)uint64_t buf = 68289282;
      int v27 = 0;
      __int16 v28 = 2082;
      long long v29 = "";
      __int16 v30 = 2082;
      id v31 = v24;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#authsync No watch for pairing ID", "{\"msg%{public}.0s\":\"#authsync No watch for pairing ID\", \"CSPairingID\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    long long v20 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v27 = 0;
      __int16 v28 = 2082;
      long long v29 = "";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Watch unpaired\"}", buf, 0x12u);
    }
    [(CLAuthSyncManager *)self handleUnpairing];
  }
}

- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe", a3, a4, a5), "silo") assertInside];
  [a4 setSerializer:objc_alloc_init(CLAuthSerializer)];
  [a4 setTargetQueue:[objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") queue]];
  [a4 setDelegate:self];
  [(CLAuthSyncManager *)self setShouldSendMoreDataInCurrentSyncSession:0];
  if ([a4 isSending])
  {
    if ([a4 isResetSync])
    {
      if (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLMigrationSyncInProgress"), "BOOLValue"))
      {
        [a4 setReason:@"SYSessionReasonMigrationSync-FullSync-FromCompanion"];
        if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLHandledMigrationSyncResetVersionNumbersNotification"), "BOOLValue") & 1) == 0)
        {
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_1009E0374;
          v44[3] = &unk_10229FED8;
          v44[4] = self;
          [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") afterInterval:v44 async:30.0];
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_1022D8200);
          }
          id v7 = qword_102419538;
          BOOL v8 = os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT);
          BOOL result = 0;
          if (v8)
          {
            id v10 = [a4 identifier];
            id v11 = [a4 reason];
            unsigned int v12 = [a4 isResetSync];
            [a4 state];
            uint64_t v13 = [a4 state];
            unsigned int v14 = [a4 wasCancelled];
            unsigned int v15 = [objc_msgSend(a4, "service") targetIsInProximity];
            [(SYService *)[(CLAuthSyncManager *)self syncService] sessionStalenessInterval];
            *(_DWORD *)uint64_t buf = 68291074;
            int v46 = 0;
            __int16 v47 = 2082;
            id v48 = "";
            __int16 v49 = 2114;
            id v50 = v10;
            __int16 v51 = 2114;
            id v52 = v11;
            __int16 v53 = 1026;
            unsigned int v54 = v12;
            __int16 v55 = 2050;
            uint64_t v56 = v13;
            __int16 v57 = 1026;
            unsigned int v58 = v14;
            __int16 v59 = 1026;
            unsigned int v60 = v15;
            __int16 v61 = 2050;
            uint64_t v62 = (uint64_t)v16;
            __int16 v63 = 2082;
            BOOL v64 = "MigrationSync-ResetVersionNumbersNotification needs to be handled";
            id v17 = "{\"msg%{public}.0s\":\"#authsync Sending sync session rejected\", \"sessionIdentifier\":%{public, loca"
                  "tion:escape_only}@, \"reason\":%{public, location:escape_only}@, \"isResetSync\":%{public}hhd, \"state"
                  "\":%{public, location:SYSessionState}lld, \"wasCancelled\":%{public}hhd, \"targetIsInProximity\":%{pub"
                  "lic}hhd, \"sessionStalenessInterval\":%{public}ld, \"rejectionReason\":%{public, location:escape_only}s}";
LABEL_25:
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v17, buf, 0x56u);
            return 0;
          }
          return result;
        }
        goto LABEL_28;
      }
      CFStringRef v27 = @"SYSessionReasonFullSyncFromCompanion";
    }
    else if ([(CLAuthSyncManager *)self isResetNotificationQueued])
    {
      CFStringRef v27 = @"SYSessionReasonResetFromCompanion";
    }
    else
    {
      if (objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLMigrationSyncInProgress"), "BOOLValue")&& objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLHandledMigrationSyncResetVersionNumbersNotification"), "BOOLValue"))
      {
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_1009E03D4;
        v43[3] = &unk_1022D8198;
        v43[4] = a4;
        [(NSMutableArray *)[(CLAuthSyncManager *)self notificationsInCompanionQueue] enumerateObjectsUsingBlock:v43];
LABEL_28:
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022D8200);
        }
        int v18 = qword_102419538;
        if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
          return 1;
        }
        id v36 = [a4 identifier];
        id v37 = [a4 reason];
        unsigned int v38 = [a4 isResetSync];
        [a4 state];
        uint64_t v39 = [a4 state];
        unsigned int v40 = [a4 wasCancelled];
        unsigned int v41 = [objc_msgSend(a4, "service") targetIsInProximity];
        [(SYService *)[(CLAuthSyncManager *)self syncService] sessionStalenessInterval];
        *(_DWORD *)uint64_t buf = 68290818;
        int v46 = 0;
        __int16 v47 = 2082;
        id v48 = "";
        __int16 v49 = 2114;
        id v50 = v36;
        __int16 v51 = 2114;
        id v52 = v37;
        __int16 v53 = 1026;
        unsigned int v54 = v38;
        __int16 v55 = 2050;
        uint64_t v56 = v39;
        __int16 v57 = 1026;
        unsigned int v58 = v40;
        __int16 v59 = 1026;
        unsigned int v60 = v41;
        __int16 v61 = 2050;
        uint64_t v62 = (uint64_t)v42;
        id v26 = "{\"msg%{public}.0s\":\"#authsync Sending sync session started\", \"sessionIdentifier\":%{public, location:"
              "escape_only}@, \"reason\":%{public, location:escape_only}@, \"isResetSync\":%{public}hhd, \"state\":%{publ"
              "ic, location:SYSessionState}lld, \"wasCancelled\":%{public}hhd, \"targetIsInProximity\":%{public}hhd, \"se"
              "ssionStalenessInterval\":%{public}ld}";
LABEL_32:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v26, buf, 0x4Cu);
        return 1;
      }
      CFStringRef v27 = @"SYSessionReasonDeltaSyncFromCompanion";
    }
    [a4 setReason:v27];
    goto LABEL_28;
  }
  if (!objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState"), "objectForKey:", @"kCLMigrationSyncInProgress"), "BOOLValue")|| objc_msgSend(a4, "reason") != @"StandAloneWatchAppAuthorization")
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    int v18 = qword_102419538;
    if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
      return 1;
    }
    id v19 = [a4 identifier];
    id v20 = [a4 reason];
    unsigned int v21 = [a4 isResetSync];
    [a4 state];
    uint64_t v22 = [a4 state];
    unsigned int v23 = [a4 wasCancelled];
    unsigned int v24 = [objc_msgSend(a4, "service") targetIsInProximity];
    [(SYService *)[(CLAuthSyncManager *)self syncService] sessionStalenessInterval];
    *(_DWORD *)uint64_t buf = 68290818;
    int v46 = 0;
    __int16 v47 = 2082;
    id v48 = "";
    __int16 v49 = 2114;
    id v50 = v19;
    __int16 v51 = 2114;
    id v52 = v20;
    __int16 v53 = 1026;
    unsigned int v54 = v21;
    __int16 v55 = 2050;
    uint64_t v56 = v22;
    __int16 v57 = 1026;
    unsigned int v58 = v23;
    __int16 v59 = 1026;
    unsigned int v60 = v24;
    __int16 v61 = 2050;
    uint64_t v62 = (uint64_t)v25;
    id v26 = "{\"msg%{public}.0s\":\"#authsync Receiving sync session started\", \"sessionIdentifier\":%{public, location:es"
          "cape_only}@, \"reason\":%{public, location:escape_only}@, \"isResetSync\":%{public}hhd, \"state\":%{public, lo"
          "cation:SYSessionState}lld, \"wasCancelled\":%{public}hhd, \"targetIsInProximity\":%{public}hhd, \"sessionStale"
          "nessInterval\":%{public}ld}";
    goto LABEL_32;
  }
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  id v7 = qword_102419538;
  BOOL v28 = os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v28)
  {
    id v29 = [a4 identifier];
    id v30 = [a4 reason];
    unsigned int v31 = [a4 isResetSync];
    [a4 state];
    uint64_t v32 = [a4 state];
    unsigned int v33 = [a4 wasCancelled];
    unsigned int v34 = [objc_msgSend(a4, "service") targetIsInProximity];
    [(SYService *)[(CLAuthSyncManager *)self syncService] sessionStalenessInterval];
    *(_DWORD *)uint64_t buf = 68291074;
    int v46 = 0;
    __int16 v47 = 2082;
    id v48 = "";
    __int16 v49 = 2114;
    id v50 = v29;
    __int16 v51 = 2114;
    id v52 = v30;
    __int16 v53 = 1026;
    unsigned int v54 = v31;
    __int16 v55 = 2050;
    uint64_t v56 = v32;
    __int16 v57 = 1026;
    unsigned int v58 = v33;
    __int16 v59 = 1026;
    unsigned int v60 = v34;
    __int16 v61 = 2050;
    uint64_t v62 = (uint64_t)v35;
    __int16 v63 = 2082;
    BOOL v64 = "MigrationSync is in progress";
    id v17 = "{\"msg%{public}.0s\":\"#authsync Receiving sync session rejected\", \"sessionIdentifier\":%{public, location:e"
          "scape_only}@, \"reason\":%{public, location:escape_only}@, \"isResetSync\":%{public}hhd, \"state\":%{public, l"
          "ocation:SYSessionState}lld, \"wasCancelled\":%{public}hhd, \"targetIsInProximity\":%{public}hhd, \"sessionStal"
          "enessInterval\":%{public}ld, \"rejectionReason\":%{public, location:escape_only}s}";
    goto LABEL_25;
  }
  return result;
}

- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe", a3), "silo") assertInside];
  [(CLAuthSyncManager *)self setShouldSendMoreDataInCurrentSyncSession:0];
  if (a5)
  {
    id v8 = [[objc_msgSend(a5, "userInfo") objectForKeyedSubscript:NSUnderlyingErrorKey];
    if (v8 && [v8 code] == (id)32)
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      uint64_t v9 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 68289026;
        int v17 = 0;
        __int16 v18 = 2082;
        id v19 = "";
        id v10 = "{\"msg%{public}.0s\":\"#authsync Sync to/from standalone watch is not supported\"}";
        id v11 = v9;
        os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
        uint32_t v13 = 18;
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)&v16, v13);
      }
    }
    else
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      uint64_t v14 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
      {
        int v16 = 68289538;
        int v17 = 0;
        __int16 v18 = 2082;
        id v19 = "";
        __int16 v20 = 2114;
        id v21 = [a4 reason];
        __int16 v22 = 2114;
        id v23 = a5;
        id v10 = "{\"msg%{public}.0s\":\"#authsync Session ended with failure\", \"syncSessionReason\":%{public, location:es"
              "cape_only}@, \"error\":%{public, location:escape_only}@}";
        id v11 = v14;
        os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
        uint32_t v13 = 38;
        goto LABEL_16;
      }
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    uint64_t v15 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 68289282;
      int v17 = 0;
      __int16 v18 = 2082;
      id v19 = "";
      __int16 v20 = 2114;
      id v21 = [a4 reason];
      id v10 = "{\"msg%{public}.0s\":\"#authsync Session ended successfully\", \"syncSessionReason\":%{public, location:escape_only}@}";
      id v11 = v15;
      os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
      uint32_t v13 = 28;
      goto LABEL_16;
    }
  }
}

- (void)service:(id)a3 encounteredError:(id)a4 context:(id)a5
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe", a3), "silo") assertInside];
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  id v7 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289538;
    v8[1] = 0;
    __int16 v9 = 2082;
    id v10 = "";
    __int16 v11 = 2114;
    id v12 = a4;
    __int16 v13 = 2114;
    id v14 = a5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning #authsync Error in service\", \"error\":%{public, location:escape_only}@, \"context\":%{public, location:escape_only}@}", (uint8_t *)v8, 0x26u);
  }
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe", a3, a4, a5), "silo") assertInside];
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  int v41 = 2;
  if ([a3 isResetSync])
  {
    if ([(CLAuthSyncManager *)self shouldSendMoreDataInCurrentSyncSession])
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      id v8 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        [a3 state];
        unsigned int v9 = [a3 state];
        *(void *)uint64_t buf = 68289282;
        *(_WORD *)id v48 = 2082;
        *(void *)&v48[2] = "";
        *(_WORD *)&v48[10] = 2050;
        *(void *)&v48[12] = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sending full sync session continues enqueuing\", \"sessionState\":%{public, location:SYSessionState}lld}", buf, 0x1Cu);
      }
    }
    else
    {
      [(CLAuthSyncManager *)self prepareToDoFullSync];
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      __int16 v13 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        [a3 state];
        unsigned int v14 = [a3 state];
        *(void *)uint64_t buf = 68289282;
        *(_WORD *)id v48 = 2082;
        *(void *)&v48[2] = "";
        *(_WORD *)&v48[10] = 2050;
        *(void *)&v48[12] = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sending full sync session begins enqueuing\", \"sessionState\":%{public, location:SYSessionState}lld}", buf, 0x1Cu);
      }
      [(NSMutableArray *)[(CLAuthSyncManager *)self fullSyncObjectsInCompanionQueue] removeAllObjects];
      [(NSMutableArray *)[(CLAuthSyncManager *)self fullSyncObjectsInCompanionQueue] addObjectsFromArray:[(CLAuthSyncManager *)self getFullSyncObjects]];
    }
    *(void *)uint64_t buf = 0;
    *(void *)id v48 = buf;
    *(void *)&v48[8] = 0x3052000000;
    *(void *)&v48[16] = sub_100177CE4;
    __int16 v49 = sub_100177454;
    id v50 = 0;
    id v50 = objc_alloc_init((Class)NSMutableIndexSet);
    uint64_t v32 = 0;
    unsigned int v33 = &v32;
    uint64_t v34 = 0x3052000000;
    double v35 = sub_100177CE4;
    id v36 = sub_100177454;
    id v37 = 0;
    id v37 = objc_alloc_init((Class)NSMutableIndexSet);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1009E1074;
    v31[3] = &unk_1022D81C0;
    v31[4] = self;
    v31[5] = a4;
    v31[6] = buf;
    v31[7] = &v38;
    [(NSMutableArray *)[(CLAuthSyncManager *)self fullSyncObjectsInCompanionQueue] enumerateObjectsUsingBlock:v31];
    uint64_t v15 = [(CLAuthSyncManager *)self fullSyncObjectsInCompanionQueue];
    [(NSMutableArray *)v15 removeObjectsAtIndexes:*(void *)(*(void *)v48 + 40)];
    if (*((_DWORD *)v39 + 6) == 2)
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1009E12DC;
      v30[3] = &unk_1022D81C0;
      v30[4] = self;
      v30[5] = a4;
      void v30[6] = &v32;
      v30[7] = &v38;
      [(NSMutableArray *)[(CLAuthSyncManager *)self notificationsInCompanionQueue] enumerateObjectsUsingBlock:v30];
      int v16 = [(CLAuthSyncManager *)self notificationsInCompanionQueue];
      [(NSMutableArray *)v16 removeObjectsAtIndexes:v33[5]];
    }
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    int v17 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = (char *)[*(id *)(*(void *)v48 + 40) count];
      id v19 = [(id)v33[5] count];
      uint64_t v42 = 68289282;
      __int16 v43 = 2082;
      uint32_t v44 = "";
      __int16 v45 = 2050;
      int v46 = &v18[(void)v19];
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sending full sync session finishes enqueuing\", \"numberOfFullSyncMessages\":%{public}lu}", (uint8_t *)&v42, 0x1Cu);
    }
    if (*((_DWORD *)v39 + 6) == 2) {
      [(CLAuthSyncManager *)self setShouldSendMoreDataInCurrentSyncSession:0];
    }
    goto LABEL_38;
  }
  if ([(CLAuthSyncManager *)self shouldSendMoreDataInCurrentSyncSession])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    id v10 = qword_102419538;
    if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    [a3 state];
    unsigned int v11 = [a3 state];
    *(void *)uint64_t buf = 68289282;
    *(_WORD *)id v48 = 2082;
    *(void *)&v48[2] = "";
    *(_WORD *)&v48[10] = 2050;
    *(void *)&v48[12] = v11;
    id v12 = "{\"msg%{public}.0s\":\"#authsync Sending delta sync session continues enqueuings\", \"syncSessionState\":%{pub"
          "lic, location:SYSessionState}lld}";
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    id v10 = qword_102419538;
    if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    [a3 state];
    unsigned int v20 = [a3 state];
    *(void *)uint64_t buf = 68289282;
    *(_WORD *)id v48 = 2082;
    *(void *)&v48[2] = "";
    *(_WORD *)&v48[10] = 2050;
    *(void *)&v48[12] = v20;
    id v12 = "{\"msg%{public}.0s\":\"#authsync Sending delta sync session begins enqueuing\", \"syncSessionState\":%{public,"
          " location:SYSessionState}lld}";
  }
  _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0x1Cu);
LABEL_30:
  *(void *)uint64_t buf = 0;
  *(void *)id v48 = buf;
  *(void *)&v48[8] = 0x3052000000;
  *(void *)&v48[16] = sub_100177CE4;
  __int16 v49 = sub_100177454;
  id v50 = 0;
  id v50 = objc_alloc_init((Class)NSMutableIndexSet);
  uint64_t v32 = 0;
  unsigned int v33 = &v32;
  uint64_t v34 = 0x3052000000;
  double v35 = sub_100177CE4;
  id v36 = sub_100177454;
  id v37 = 0;
  id v37 = objc_alloc_init((Class)NSMutableIndexSet);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1009E1544;
  v29[3] = &unk_1022D81C0;
  v29[4] = self;
  v29[5] = a4;
  v29[6] = buf;
  v29[7] = &v38;
  [(NSMutableArray *)[(CLAuthSyncManager *)self deltaSyncObjectsInCompanionQueue] enumerateObjectsUsingBlock:v29];
  id v21 = [(CLAuthSyncManager *)self deltaSyncObjectsInCompanionQueue];
  [(NSMutableArray *)v21 removeObjectsAtIndexes:*(void *)(*(void *)v48 + 40)];
  if (*((_DWORD *)v39 + 6) == 2)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1009E17B8;
    v28[3] = &unk_1022D81C0;
    v28[4] = self;
    v28[5] = a4;
    v28[6] = &v32;
    v28[7] = &v38;
    [(NSMutableArray *)[(CLAuthSyncManager *)self notificationsInCompanionQueue] enumerateObjectsUsingBlock:v28];
    __int16 v22 = [(CLAuthSyncManager *)self notificationsInCompanionQueue];
    [(NSMutableArray *)v22 removeObjectsAtIndexes:v33[5]];
  }
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  id v23 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v24 = (char *)[*(id *)(*(void *)v48 + 40) count];
    id v25 = [(id)v33[5] count];
    uint64_t v42 = 68289282;
    __int16 v43 = 2082;
    uint32_t v44 = "";
    __int16 v45 = 2050;
    int v46 = &v24[(void)v25];
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sending delta sync session finishes enqueuing\", \"numberOfDeltaSyncMessages\":%{public}lu}", (uint8_t *)&v42, 0x1Cu);
  }
  if (*((_DWORD *)v39 + 6) == 2) {
    [(CLAuthSyncManager *)self setShouldSendMoreDataInCurrentSyncSession:0];
  }
LABEL_38:
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(buf, 8);
  unsigned int v26 = *((_DWORD *)v39 + 6);
  _Block_object_dispose(&v38, 8);
  return v26;
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") assertInside];
  sub_100103240();
  if (sub_100106424() && [a3 isResetSync]) {
    sub_101A76860();
  }
  sub_100103240();
  if (sub_10010145C()) {
    unsigned int v9 = [a3 isResetSync];
  }
  else {
    unsigned int v9 = 0;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = [a4 countByEnumeratingWithState:&v24 objects:v54 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(a4);
        }
        unsigned int v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        -[CLAuthSyncManager updateReunionSyncListsWithAuthSyncMessageKey:](self, "updateReunionSyncListsWithAuthSyncMessageKey:", [v14 clientKey]);
        if (v9 && ([v14 hasNotification] & 1) == 0) {
          [(NSMutableArray *)[(CLAuthSyncManager *)self fullSyncClientsList] addObject:v14];
        }
        else {
          [(CLAuthSyncManager *)self applySyncMessage:v14];
        }
      }
      id v11 = [a4 countByEnumeratingWithState:&v24 objects:v54 count:16];
    }
    while (v11);
  }
  (*((void (**)(id, uint64_t, void))a5 + 2))(a5, 1, 0);
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  uint64_t v15 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [a3 service];
    id v17 = [a3 identifier];
    id v18 = [a3 reason];
    unsigned int v19 = [a3 isSending];
    unsigned int v20 = [a3 isResetSync];
    [a3 state];
    uint64_t v21 = [a3 state];
    unsigned int v22 = [a3 wasCancelled];
    unsigned int v23 = [objc_msgSend(a3, "service") targetIsInProximity];
    *(_DWORD *)uint64_t buf = 68291842;
    int v29 = 0;
    __int16 v30 = 2082;
    unsigned int v31 = "";
    __int16 v32 = 1026;
    unsigned int v33 = v9;
    __int16 v34 = 1026;
    int v35 = v9 ^ 1;
    __int16 v36 = 2114;
    id v37 = v16;
    __int16 v38 = 2114;
    id v39 = a3;
    __int16 v40 = 2114;
    id v41 = v17;
    __int16 v42 = 2114;
    id v43 = v18;
    __int16 v44 = 1026;
    unsigned int v45 = v19;
    __int16 v46 = 1026;
    unsigned int v47 = v20;
    __int16 v48 = 2050;
    uint64_t v49 = v21;
    __int16 v50 = 1026;
    unsigned int v51 = v22;
    __int16 v52 = 1026;
    unsigned int v53 = v23;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Receiving sync session changes\", \"queued\":%{public}hhd, \"applied\":%{public}hhd, \"service\":%{public, location:escape_only}@, \"session\":%{public, location:escape_only}@, \"sessionIdentifier\":%{public, location:escape_only}@, \"reason\":%{public, location:escape_only}@, \"isSending\":%{public}hhd, \"isResetSync\":%{public}hhd, \"state\":%{public, location:SYSessionState}lld, \"wasCancelled\":%{public}hhd, \"targetIsInProximity\":%{public}hhd}", buf, 0x68u);
  }
}

- (void)syncSession:(id)a3 didEndWithError:(id)a4
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") assertInside];
  sub_100103240();
  if (sub_10010145C())
  {
    unsigned int v7 = [a3 isResetSync];
    BOOL v8 = a4 != 0;
    if (!a4 && v7)
    {
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1009E2418;
      v37[3] = &unk_1022CA588;
      v37[4] = self;
      [(CLClientManagerPublicProtocol *)[(CLAuthSyncManager *)self clientManager] syncgetDoSync:v37];
      [(CLAuthSyncManager *)self setShouldResetAuthDbOnFullSync:0];
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      unsigned int v9 = qword_102419538;
      BOOL v8 = 0;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        id v36 = [a3 service];
        id v10 = [a3 identifier];
        id v11 = [a3 reason];
        unsigned int v12 = [a3 isSending];
        unsigned int v13 = [a3 isResetSync];
        [a3 state];
        unsigned int v14 = [a3 state];
        unsigned int v15 = [a3 wasCancelled];
        unsigned int v16 = [objc_msgSend(a3, "service") targetIsInProximity];
        *(_DWORD *)uint64_t buf = 68291330;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)id v39 = 2082;
        *(void *)&v39[2] = "";
        __int16 v40 = 2114;
        id v41 = v36;
        __int16 v42 = 2114;
        id v43 = a3;
        __int16 v44 = 2114;
        *(void *)unsigned int v45 = v10;
        *(_WORD *)&v45[8] = 2114;
        *(void *)&v45[10] = v11;
        *(_WORD *)&v45[18] = 1026;
        *(_DWORD *)__int16 v46 = v12;
        *(_WORD *)&v46[4] = 1026;
        *(_DWORD *)unsigned int v47 = v13;
        *(_WORD *)&v47[4] = 2050;
        *(void *)&v47[6] = v14;
        __int16 v48 = 1026;
        unsigned int v49 = v15;
        __int16 v50 = 1026;
        unsigned int v51 = v16;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Queued sync session changes applied\", \"service\":%{public, location:escape_only}@, \"session\":%{public, location:escape_only}@, \"sessionIdentifier\":%{public, location:escape_only}@, \"reason\":%{public, location:escape_only}@, \"isSending\":%{public}hhd, \"isResetSync\":%{public}hhd, \"state\":%{public, location:SYSessionState}lld, \"wasCancelled\":%{public}hhd, \"targetIsInProximity\":%{public}hhd}", buf, 0x5Cu);
        BOOL v8 = 0;
      }
    }
  }
  else
  {
    BOOL v8 = a4 != 0;
  }
  [(NSMutableArray *)[(CLAuthSyncManager *)self fullSyncClientsList] removeAllObjects];
  [(CLAuthSyncManager *)self setIsConflictResolutionMode:0];
  [(CLAuthSyncManager *)self setShouldSendMoreDataInCurrentSyncSession:0];
  unsigned int v17 = [a3 isResetSync];
  if (dword_10247F64C == 6) {
    unsigned int v18 = 0;
  }
  else {
    unsigned int v18 = v17;
  }
  if (v18 == 1)
  {
    sub_1000C7F88(buf);
    sub_1000EA2A4(*(uint64_t *)buf, @"kCLVersionOfLastFullSync", &unk_101D55F70);
    if (*(void *)v39) {
      sub_1000DB0A0(*(std::__shared_weak_count **)v39);
    }
    sub_1000C7F88(buf);
    sub_10051F604(*(uint64_t *)buf);
    if (*(void *)v39) {
      sub_1000DB0A0(*(std::__shared_weak_count **)v39);
    }
    dword_10247F64C = 6;
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    unsigned int v19 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)id v39 = 2082;
      *(void *)&v39[2] = "";
      __int16 v40 = 1026;
      LODWORD(v41) = 6;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Updated the kCLVersionOfLastFullAuthSync to currentVersion\", \"kCLCurrentAuthSyncVersion\":%{public}d}", buf, 0x18u);
    }
  }
  [(CLAuthSyncManager *)self endPairedSyncSessionWithError:a4];
  if (v8)
  {
    [(CLAuthSyncManager *)self handleError:a4 inSyncSession:a3];
    return;
  }
  [(CLAuthSyncManager *)self setNumberOfConsecutiveSyncSessionRetries:0];
  if ([a3 isResetSync]) {
    [(CLAuthSyncManager *)self fullSyncDidComplete];
  }
  else {
    [(CLAuthSyncManager *)self deltaSyncDidComplete:a3];
  }
  if ([a3 isSending])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    unsigned int v20 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [a3 identifier];
      id v22 = [a3 reason];
      unsigned int v23 = [a3 isResetSync];
      [a3 state];
      unsigned int v24 = [a3 state];
      unsigned int v25 = [a3 wasCancelled];
      unsigned int v26 = [objc_msgSend(a3, "service") targetIsInProximity];
      [(SYService *)[(CLAuthSyncManager *)self syncService] sessionStalenessInterval];
      *(_DWORD *)uint64_t buf = 68290818;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)id v39 = 2082;
      *(void *)&v39[2] = "";
      __int16 v40 = 2114;
      id v41 = v21;
      __int16 v42 = 2114;
      id v43 = v22;
      __int16 v44 = 1026;
      *(_DWORD *)unsigned int v45 = v23;
      *(_WORD *)&v45[4] = 2050;
      *(void *)&v45[6] = v24;
      *(_WORD *)&v45[14] = 1026;
      *(_DWORD *)&v45[16] = v25;
      *(_WORD *)__int16 v46 = 1026;
      *(_DWORD *)&v46[2] = v26;
      *(_WORD *)unsigned int v47 = 2050;
      *(void *)&v47[2] = (uint64_t)v27;
      BOOL v28 = "{\"msg%{public}.0s\":\"#authsync Sending sync session ended successfully\", \"sessionIdentifier\":%{public, "
            "location:escape_only}@, \"reason\":%{public, location:escape_only}@, \"isResetSync\":%{public}hhd, \"state\""
            ":%{public, location:SYSessionState}lld, \"wasCancelled\":%{public}hhd, \"targetIsInProximity\":%{public}hhd,"
            " \"sessionStalenessInterval\":%{public}ld}";
LABEL_35:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v28, buf, 0x4Cu);
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    unsigned int v20 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = [a3 identifier];
      id v30 = [a3 reason];
      unsigned int v31 = [a3 isResetSync];
      [a3 state];
      unsigned int v32 = [a3 state];
      unsigned int v33 = [a3 wasCancelled];
      unsigned int v34 = [objc_msgSend(a3, "service") targetIsInProximity];
      [(SYService *)[(CLAuthSyncManager *)self syncService] sessionStalenessInterval];
      *(_DWORD *)uint64_t buf = 68290818;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)id v39 = 2082;
      *(void *)&v39[2] = "";
      __int16 v40 = 2114;
      id v41 = v29;
      __int16 v42 = 2114;
      id v43 = v30;
      __int16 v44 = 1026;
      *(_DWORD *)unsigned int v45 = v31;
      *(_WORD *)&v45[4] = 2050;
      *(void *)&v45[6] = v32;
      *(_WORD *)&v45[14] = 1026;
      *(_DWORD *)&v45[16] = v33;
      *(_WORD *)__int16 v46 = 1026;
      *(_DWORD *)&v46[2] = v34;
      *(_WORD *)unsigned int v47 = 2050;
      *(void *)&v47[2] = (uint64_t)v35;
      BOOL v28 = "{\"msg%{public}.0s\":\"#authsync Receiving sync session ended successfully\", \"sessionIdentifier\":%{public"
            ", location:escape_only}@, \"reason\":%{public, location:escape_only}@, \"isResetSync\":%{public}hhd, \"state"
            "\":%{public, location:SYSessionState}lld, \"wasCancelled\":%{public}hhd, \"targetIsInProximity\":%{public}hh"
            "d, \"sessionStalenessInterval\":%{public}ld}";
      goto LABEL_35;
    }
  }
}

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  return 1;
}

- (id)service:(id)a3 willPreferSession:(id)a4 overSession:(id)a5
{
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe", a3), "silo") assertInside];
  [(CLAuthSyncManager *)self setCurrentSyncSessionCollidedWithResetSync:0];
  if (objc_msgSend(objc_msgSend(a5, "reason"), "isEqualToString:", @"SYSessionReasonResetFromCompanion"))
  {
    [(CLAuthSyncManager *)self setCurrentSyncSessionCollidedWithResetSync:1];
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    BOOL v8 = qword_102419538;
    if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
    {
      id v9 = a5;
      goto LABEL_10;
    }
    int v18 = 68289026;
    int v19 = 0;
    __int16 v20 = 2082;
    id v21 = "";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#authsync RESET from companion and delta sync from gizmo collided\"}", (uint8_t *)&v18, 0x12u);
    id v9 = a5;
  }
  else
  {
    id v9 = a4;
    a4 = a5;
  }
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
LABEL_10:
  id v10 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v9 identifier];
    id v12 = [v9 reason];
    id v13 = [a4 identifier];
    id v14 = [a4 reason];
    [v9 state];
    uint64_t v15 = [v9 state];
    [a4 state];
    unsigned int v16 = [a4 state];
    int v18 = 68290562;
    int v19 = 0;
    __int16 v20 = 2082;
    id v21 = "";
    __int16 v22 = 2114;
    id v23 = v11;
    __int16 v24 = 2114;
    id v25 = v12;
    __int16 v26 = 2114;
    id v27 = v13;
    __int16 v28 = 2114;
    id v29 = v14;
    __int16 v30 = 2050;
    uint64_t v31 = v15;
    __int16 v32 = 2050;
    uint64_t v33 = v16;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sessions collided\", \"P-identifier\":%{public, location:escape_only}@, \"P-SyncReason\":%{public, location:escape_only}@, \"R-Identifier\":%{public, location:escape_only}@, \"R-SyncReason\":%{public, location:escape_only}@, \"P-syncState\":%{public, location:SYSessionState}lld, \"R-syncState\":%{public, location:SYSessionState}lld}", (uint8_t *)&v18, 0x4Eu);
  }
  return v9;
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  unsigned int v7 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    [a4 syncSessionType];
    id v8 = [a4 syncSessionType];
    id v9 = [[[a4 sessionIdentifier] UUIDString] UTF8String];
    [a3 syncRestriction];
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    id v14 = "";
    __int16 v15 = 2050;
    id v16 = v8;
    __int16 v17 = 2082;
    id v18 = v9;
    __int16 v19 = 2050;
    id v20 = [a3 syncRestriction];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sync coordinator start session\", \"syncSessionType\":%{public, location:PSYSyncSessionType}lld, \"syncSessionIdentifier\":%{public, location:escape_only}s, \"syncRestriction\":%{public, location:PSYSyncRestriction}lld}", buf, 0x30u);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009E28A8;
  v10[3] = &unk_10229FF28;
  v10[4] = self;
  v10[5] = a3;
  void v10[6] = a4;
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") sync:v10];
}

- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022D8200);
  }
  unsigned int v7 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    [a4 syncSessionType];
    id v8 = [a4 syncSessionType];
    id v9 = [[[a4 sessionIdentifier] UUIDString] UTF8String];
    [a3 syncRestriction];
    *(_DWORD *)uint64_t buf = 68289794;
    int v12 = 0;
    __int16 v13 = 2082;
    id v14 = "";
    __int16 v15 = 2050;
    id v16 = v8;
    __int16 v17 = 2082;
    id v18 = v9;
    __int16 v19 = 2050;
    id v20 = [a3 syncRestriction];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync Sync coordinator invalidated session\", \"syncType\":%{public, location:PSYSyncSessionType}lld, \"sessionUUID\":%{public, location:escape_only}s, \"syncRestriction\":%{public, location:PSYSyncRestriction}lld}", buf, 0x30u);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009E2CA4;
  v10[3] = &unk_10229FEB0;
  v10[4] = self;
  v10[5] = a3;
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") sync:v10];
}

- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1009E2D80;
  v3[3] = &unk_10229FEB0;
  v3[4] = a3;
  v3[5] = self;
  [objc_msgSend(-[CLAuthSyncManager universe](self, "universe"), "silo") sync:v3];
}

- (void)refreshSettings
{
  if (![(CLAuthSyncManager *)self isThereAWatch]) {
    return;
  }
  if ([(CLSettingsMirror *)[(CLAuthSyncManager *)self settings] hasValueForKey:@"AuthSync-SupportsPrecisionReduction"])
  {
    [(CLAuthSyncManager *)self setIsCorrectiveCompensationSupported:[(CLSettingsMirror *)[(CLAuthSyncManager *)self settings] BOOLForKey:@"AuthSync-SupportsPrecisionReduction" defaultValue:0]];
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    char v3 = qword_102419538;
    if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    uint64_t v7 = 68289282;
    LOWORD(v8) = 2082;
    *(void *)((char *)&v8 + 2) = "";
    WORD5(v8) = 1026;
    HIDWORD(v8) = [(CLAuthSyncManager *)self isCorrectiveCompensationSupported];
    CFStringRef v4 = "{\"msg%{public}.0s\":\"#authsync overrides set\", \"isCorrectiveCompensationSupported\":%{public}hhd}";
  }
  else
  {
    id v5 = [[[off_10241F810[0]() sharedInstance] getActivePairedDevice];
    if (v5)
    {
      -[CLAuthSyncManager setIsCorrectiveCompensationSupported:](self, "setIsCorrectiveCompensationSupported:", [objc_alloc((Class)NSUUID) initWithUUIDString:@"54B99808-A820-45A2-8FF1-51C9DD7328F6"]);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      char v3 = qword_102419538;
      if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      uint64_t v7 = 68289282;
      LOWORD(v8) = 2082;
      *(void *)((char *)&v8 + 2) = "";
      WORD5(v8) = 1026;
      HIDWORD(v8) = [(CLAuthSyncManager *)self isCorrectiveCompensationSupported];
      CFStringRef v4 = "{\"msg%{public}.0s\":\"#authsync nanoregistry read\", \"isCorrectiveCompensationSupported\":%{public}hhd}";
    }
    else
    {
      [(CLAuthSyncManager *)self setIsCorrectiveCompensationSupported:0];
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022D8200);
      }
      char v3 = qword_102419538;
      if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      uint64_t v7 = 68289282;
      LOWORD(v8) = 2082;
      *(void *)((char *)&v8 + 2) = "";
      WORD5(v8) = 1026;
      HIDWORD(v8) = [(CLAuthSyncManager *)self isCorrectiveCompensationSupported];
      CFStringRef v4 = "{\"msg%{public}.0s\":\"#authsync default value\", \"isCorrectiveCompensationSupported\":%{public}hhd}";
    }
  }
  _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v7, 0x18u);
LABEL_17:
  if ((objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLAuthSyncManager authSyncStoreState](self, "authSyncStoreState", v7, v8), "objectForKey:", @"kCLFullSyncInProgress"), "BOOLValue") & 1) == 0)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022D8200);
    }
    id v6 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = 68289026;
      LOWORD(v8) = 2082;
      *(void *)((char *)&v8 + 2) = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#authsync refreshSettings check sync store state for full sync\"}", (uint8_t *)&v7, 0x12u);
    }
    [(CLAuthSyncManager *)self checkSyncStoreState];
  }
}

- (CLClientManagerPublicProtocol)clientManager
{
  return self->_clientManager;
}

- (void)setClientManager:(id)a3
{
}

- (NSString)fullPathForSyncState
{
  return self->_fullPathForSyncState;
}

- (SYService)syncService
{
  return self->_syncService;
}

- (void)setSyncService:(id)a3
{
}

- (IDSService)idsService
{
  return (IDSService *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIdsService:(id)a3
{
}

- (NSMutableArray)fullSyncObjectsInCompanionQueue
{
  return self->_fullSyncObjectsInCompanionQueue;
}

- (void)setFullSyncObjectsInCompanionQueue:(id)a3
{
}

- (NSMutableArray)fullSyncObjectsInGizmoQueue
{
  return self->_fullSyncObjectsInGizmoQueue;
}

- (void)setFullSyncObjectsInGizmoQueue:(id)a3
{
}

- (NSMutableArray)deltaSyncObjectsInCompanionQueue
{
  return self->_deltaSyncObjectsInCompanionQueue;
}

- (void)setDeltaSyncObjectsInCompanionQueue:(id)a3
{
}

- (NSMutableArray)deltaSyncObjectsInGizmoQueue
{
  return self->_deltaSyncObjectsInGizmoQueue;
}

- (void)setDeltaSyncObjectsInGizmoQueue:(id)a3
{
}

- (NSMutableArray)gizmoDeltaSyncObjects
{
  return self->_gizmoDeltaSyncObjects;
}

- (void)setGizmoDeltaSyncObjects:(id)a3
{
}

- (NSMutableArray)gizmoDeltaSyncObjectsWaitingForAck
{
  return self->_gizmoDeltaSyncObjectsWaitingForAck;
}

- (void)setGizmoDeltaSyncObjectsWaitingForAck:(id)a3
{
}

- (NSMutableArray)notificationsInCompanionQueue
{
  return self->_notificationsInCompanionQueue;
}

- (void)setNotificationsInCompanionQueue:(id)a3
{
}

- (NSMutableArray)notificationsInGizmoQueue
{
  return self->_notificationsInGizmoQueue;
}

- (void)setNotificationsInGizmoQueue:(id)a3
{
}

- (NSDictionary)preDaytonaMapping
{
  return self->_preDaytonaMapping;
}

- (void)setPreDaytonaMapping:(id)a3
{
}

- (BOOL)shouldConfirmHandlingPairingNotification
{
  return self->_shouldConfirmHandlingPairingNotification;
}

- (void)setShouldConfirmHandlingPairingNotification:(BOOL)a3
{
  self->_shouldConfirmHandlingPairingNotification = a3;
}

- (BOOL)shouldConfirmHandlingQuickSwitchNotification
{
  return self->_shouldConfirmHandlingQuickSwitchNotification;
}

- (void)setShouldConfirmHandlingQuickSwitchNotification:(BOOL)a3
{
  self->_shouldConfirmHandlingQuickSwitchNotification = a3;
}

- (BOOL)shouldSendMoreDataInCurrentSyncSession
{
  return self->_shouldSendMoreDataInCurrentSyncSession;
}

- (void)setShouldSendMoreDataInCurrentSyncSession:(BOOL)a3
{
  self->_shouldSendMoreDataInCurrentSyncSession = a3;
}

- (BOOL)resetRecoveryMode
{
  return self->_resetRecoveryMode;
}

- (void)setResetRecoveryMode:(BOOL)a3
{
  self->_resetRecoveryMode = a3;
}

- (BOOL)recoverySyncInProgress
{
  return self->_recoverySyncInProgress;
}

- (void)setRecoverySyncInProgress:(BOOL)a3
{
  self->_recoverySyncInProgress = a3;
}

- (BOOL)isThereAWatch
{
  return self->_isThereAWatch;
}

- (void)setIsThereAWatch:(BOOL)a3
{
  self->_isThereAWatch = a3;
}

- (BOOL)isCorrectiveCompensationSupported
{
  return self->_isCorrectiveCompensationSupported;
}

- (void)setIsCorrectiveCompensationSupported:(BOOL)a3
{
  self->_isCorrectiveCompensationSupported = a3;
}

- (BOOL)isDeviceNearbyAndConnected
{
  return self->_isDeviceNearbyAndConnected;
}

- (void)setIsDeviceNearbyAndConnected:(BOOL)a3
{
  self->_isDeviceNearbyAndConnected = a3;
}

- (BOOL)isQuickSwitchModeOn
{
  return self->_isQuickSwitchModeOn;
}

- (void)setIsQuickSwitchModeOn:(BOOL)a3
{
  self->_isQuickSwitchModeOn = a3;
}

- (BOOL)isConflictResolutionMode
{
  return self->_isConflictResolutionMode;
}

- (void)setIsConflictResolutionMode:(BOOL)a3
{
  self->_isConflictResolutionMode = a3;
}

- (BOOL)currentSyncSessionCollidedWithResetSync
{
  return self->_currentSyncSessionCollidedWithResetSync;
}

- (void)setCurrentSyncSessionCollidedWithResetSync:(BOOL)a3
{
  self->_currentSyncSessionCollidedWithResetSync = a3;
}

- (NSUUID)activePairingID
{
  return self->_activePairingID;
}

- (void)setActivePairingID:(id)a3
{
}

- (NSUUID)pairedDeviceUUID
{
  return self->_pairedDeviceUUID;
}

- (void)setPairedDeviceUUID:(id)a3
{
}

- (unsigned)watchProductVersion
{
  return self->_watchProductVersion;
}

- (void)setWatchProductVersion:(unsigned int)a3
{
  self->_watchProductVersion = a3;
}

- (NSMutableDictionary)authSyncStoreState
{
  return self->_authSyncStoreState;
}

- (void)setAuthSyncStoreState:(id)a3
{
}

- (NSMutableArray)fullSyncClientsList
{
  return self->_fullSyncClientsList;
}

- (void)setFullSyncClientsList:(id)a3
{
}

- (NSMutableDictionary)reunionSyncListPaths
{
  return self->_reunionSyncListPaths;
}

- (void)setReunionSyncListPaths:(id)a3
{
}

- (NSMutableDictionary)reunionSyncLists
{
  return self->_reunionSyncLists;
}

- (void)setReunionSyncLists:(id)a3
{
}

- (BOOL)isQuickSwitchInProgress
{
  return self->_isQuickSwitchInProgress;
}

- (void)setIsQuickSwitchInProgress:(BOOL)a3
{
  self->_isQuickSwitchInProgress = a3;
}

- (double)syncSessionRetryInterval
{
  return self->_syncSessionRetryInterval;
}

- (void)setSyncSessionRetryInterval:(double)a3
{
  self->_syncSessionRetryInterval = a3;
}

- (int64_t)numberOfConsecutiveSyncSessionRetries
{
  return self->_numberOfConsecutiveSyncSessionRetries;
}

- (void)setNumberOfConsecutiveSyncSessionRetries:(int64_t)a3
{
  self->_numberOfConsecutiveSyncSessionRetries = a3;
}

- (BOOL)shouldResetAuthDbOnFullSync
{
  return self->_shouldResetAuthDbOnFullSync;
}

- (void)setShouldResetAuthDbOnFullSync:(BOOL)a3
{
  self->_shouldResetAuthDbOnFullSync = a3;
}

- (PSYServiceSyncSession)activeWatchSyncSession
{
  return self->_activeWatchSyncSession;
}

- (void)setActiveWatchSyncSession:(id)a3
{
}

- (PSYSyncCoordinator)syncCoordinator
{
  return self->_syncCoordinator;
}

- (void)setSyncCoordinator:(id)a3
{
}

- (CLSettingsMirror)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (unint64_t)syncRestriction
{
  return self->_syncRestriction;
}

- (void)setSyncRestriction:(unint64_t)a3
{
  self->_syncRestriction = a3;
}

@end