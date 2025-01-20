@interface TCCDSyncController
+ (id)allowedClassesForSYChangeUnarchiving;
+ (id)allowedClassesForSavedSyncStateUnarchiving;
+ (id)sharedSyncController;
- (BOOL)_didPairToDeviceHook;
- (BOOL)_initializeSyncEngineAfterDeviceUnlockHook;
- (BOOL)_initializeSyncEngineHook;
- (BOOL)_writeSyncState;
- (BOOL)batchDeltaChanges;
- (BOOL)hostDeviceUnlocked;
- (BOOL)isMain;
- (BOOL)isSyncingEnabled;
- (BOOL)peerSupportsService:(id)a3 authVersion:(unint64_t)a4;
- (BOOL)retryTestMaxRetry;
- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5;
- (BOOL)sessionShouldCancelWhenActive;
- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4;
- (Class)nrPairedDeviceRegisteryClass;
- (Class)syServiceClass;
- (NRDevice)pairedDevice;
- (NSMapTable)syncSessionsHandlers;
- (NSMutableArray)pendingDeltaSyncChanges;
- (NSMutableArray)sessionPendingConfirmationSyncChanges;
- (NSMutableArray)sessionSyncChanges;
- (NSString)pairedDeviceStorageRoot;
- (OS_dispatch_queue)syncControllerQueue;
- (OS_dispatch_queue)syncSessionsQueue;
- (OS_os_transaction)syncTransaction;
- (SYService)syncService;
- (TCCDMessageController)messageController;
- (TCCDSyncController)init;
- (TCCDSyncController)initWithAsyncSyncEngineInitialization;
- (const)_syncTypeToString:(unsigned int)a3;
- (id)_beginResetSyncHook;
- (id)_makePostPairingContinuation;
- (id)_os_state_titleWithPrefix:(id)a3 withHints:(os_state_hints_s *)a4;
- (id)_savedSyncStateFile;
- (id)_syncSessionHandlerForUpdateAccessAction:(id)a3;
- (id)_syncStatusDescriptionString;
- (id)changeFromData:(id)a3 ofType:(int64_t)a4;
- (id)dataFromChange:(id)a3;
- (id)decodeChangeData:(id)a3 fromProtocolVersion:(int64_t)a4 ofType:(int64_t)a5;
- (id)dictionaryMessageSyncIDKey;
- (id)encodeSYChangeForBackwardCompatibility:(id)a3 protocolVersion:(int64_t)a4;
- (id)eventRetryBlock;
- (id)retryBlock;
- (id)service:(id)a3 willPreferSession:(id)a4 overSession:(id)a5;
- (id)stringForSYChangeType:(int64_t)a3;
- (int64_t)syChangeTypeForUpdateType:(unint64_t)a3;
- (unint64_t)eventRetryIntervalSecs;
- (unint64_t)maxRetryCount;
- (unint64_t)retryCount;
- (unint64_t)retryIntervalSecs;
- (unint64_t)sessionPerMessageTimeoutSecs;
- (unint64_t)stateHandler;
- (unint64_t)updateTypeForSYChangeType:(int64_t)a3;
- (unsigned)pendingSyncType;
- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5;
- (void)_acquireTransaction;
- (void)_addDeltaSyncChange:(id)a3;
- (void)_beginAsyncSyncEngineInitialization;
- (void)_didPairToDevice:(id)a3;
- (void)_didPairToNewDeviceHookWithContinuation:(id)a3;
- (void)_didReturnToPreviouslyPairedDevice:(id)a3;
- (void)_didReturnToPreviouslyPairedDeviceHookWithContinuation:(id)a3;
- (void)_didUnPairDevice;
- (void)_endDeltaChangeBatching;
- (void)_handleSyncObject:(id)a3 updateType:(unint64_t)a4;
- (void)_initializeSyncEngine;
- (void)_initializeSyncEngineAfterDeviceUnlock;
- (void)_initiateResetSync;
- (void)_loadSavedSyncState;
- (void)_notifySyncSessionHandlers:(id)a3 forUpdateAccessAction:(id)a4;
- (void)_release_transaction;
- (void)_removeSavedSyncState;
- (void)_resetSyncingAndCancelAnyInFlightSessions;
- (void)_retrySyncCancel;
- (void)_retrySyncReset;
- (void)_retrySyncSession:(id)a3;
- (void)_retrySyncType:(unsigned int)a3;
- (void)_sendSyncSessionDidFinishWithResult:(unsigned int)a3 error:(id)a4;
- (void)_setSyncingEnabled:(BOOL)a3;
- (void)_setupOSStateHandler;
- (void)_updateDatabase:(unint64_t)a3 forUpdateAccessAction:(id)a4;
- (void)_writeSyncStateAndAllowTermination;
- (void)beginBatchingDeltaChanges;
- (void)endBatchingDeltaChanges;
- (void)handleMemoryPressureCritical;
- (void)removeAccessDidUpdateHandlerForSession:(id)a3;
- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5;
- (void)service:(id)a3 encounteredError:(id)a4 context:(id)a5;
- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5;
- (void)service:(id)a3 targetDeviceProximityChanged:(BOOL)a4;
- (void)service:(id)a3 willSwitchFromPairingID:(id)a4 toPairingID:(id)a5;
- (void)setBatchDeltaChanges:(BOOL)a3;
- (void)setEventRetryBlock:(id)a3;
- (void)setEventRetryIntervalSecs:(unint64_t)a3;
- (void)setHostDeviceUnlocked:(BOOL)a3;
- (void)setIsMain:(BOOL)a3;
- (void)setMaxRetryCount:(unint64_t)a3;
- (void)setNrPairedDeviceRegisteryClass:(Class)a3;
- (void)setPairedDevice:(id)a3;
- (void)setPairedDeviceStorageRoot:(id)a3;
- (void)setPendingDeltaSyncChanges:(id)a3;
- (void)setPendingSyncType:(unsigned int)a3;
- (void)setRetryBlock:(id)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setRetryIntervalSecs:(unint64_t)a3;
- (void)setRetryTestMaxRetry:(BOOL)a3;
- (void)setSessionPendingConfirmationSyncChanges:(id)a3;
- (void)setSessionPerMessageTimeoutSecs:(unint64_t)a3;
- (void)setSessionShouldCancelWhenActive:(BOOL)a3;
- (void)setSessionSyncChanges:(id)a3;
- (void)setStateHandler:(unint64_t)a3;
- (void)setSyServiceClass:(Class)a3;
- (void)setSyncControllerQueue:(id)a3;
- (void)setSyncService:(id)a3;
- (void)setSyncSession:(id)a3 accessDidUpdateHandler:(id)a4;
- (void)setSyncSessionsHandlers:(id)a3;
- (void)setSyncSessionsQueue:(id)a3;
- (void)setSyncTransaction:(id)a3;
- (void)syncAccessAction:(id)a3 updateType:(unint64_t)a4;
- (void)syncAccessUpdateForServiceIdentifier:(id)a3 clientIdentifier:(id)a4 clientType:(int)a5 accessStatus:(unint64_t)a6 authorizationVersion:(unint64_t)a7 flags:(int)a8 updateType:(unint64_t)a9;
- (void)syncAccessUpdateForServiceIdentifier:(id)a3 mainClientIdentifier:(id)a4 replicaClientIdentifier:(id)a5 clientType:(int)a6 accessStatus:(unint64_t)a7 authorizationVersion:(unint64_t)a8 flags:(int)a9 updateType:(unint64_t)a10;
- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5;
- (void)syncSession:(id)a3 didEndWithError:(id)a4;
- (void)syncSession:(id)a3 successfullySynced:(id)a4;
- (void)testMemoryPressureCritical;
- (void)testSyncSet:(id)a3;
- (void)testSyncStatus;
- (void)willShutdown;
@end

@implementation TCCDSyncController

+ (id)sharedSyncController
{
  if (qword_1000AC4A8 != -1) {
    dispatch_once(&qword_1000AC4A8, &stru_1000953E8);
  }
  v2 = (void *)qword_1000AC4A0;
  return v2;
}

+ (id)allowedClassesForSavedSyncStateUnarchiving
{
  if (qword_1000AC4B8 != -1) {
    dispatch_once(&qword_1000AC4B8, &stru_100095408);
  }
  v2 = (void *)qword_1000AC4B0;
  return v2;
}

+ (id)allowedClassesForSYChangeUnarchiving
{
  if (qword_1000AC4C8 != -1) {
    dispatch_once(&qword_1000AC4C8, &stru_100095428);
  }
  v2 = (void *)qword_1000AC4C0;
  return v2;
}

- (TCCDSyncController)init
{
  v6.receiver = self;
  v6.super_class = (Class)TCCDSyncController;
  id v2 = [(TCCDSyncController *)&v6 init];
  if (v2)
  {
    [v2 setSyServiceClass:off_1000AC150()];
    [v2 setNrPairedDeviceRegisteryClass:off_1000AC158()];
    dispatch_queue_t v3 = dispatch_queue_create("TCCDSyncController", 0);
    v4 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v3;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v2 + 12), off_1000AC148, v2, 0);
    if ([v2 syServiceClass] && objc_msgSend(v2, "nrPairedDeviceRegisteryClass") && *((void *)v2 + 12))
    {
      if (qword_1000AC490 != -1) {
        dispatch_once(&qword_1000AC490, &stru_100095368);
      }
      *((unsigned char *)v2 + 8) = 0;
    }
    else
    {

      return 0;
    }
  }
  return (TCCDSyncController *)v2;
}

- (void)_beginAsyncSyncEngineInitialization
{
  dispatch_queue_t v3 = [(TCCDSyncController *)self syncControllerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019FE8;
  block[3] = &unk_100094E78;
  block[4] = self;
  dispatch_async(v3, block);
}

- (TCCDSyncController)initWithAsyncSyncEngineInitialization
{
  id v2 = [(TCCDSyncController *)self init];
  dispatch_queue_t v3 = v2;
  if (v2)
  {
    [(TCCDSyncController *)v2 setIsMain:0];
    [(TCCDSyncController *)v3 _beginAsyncSyncEngineInitialization];
  }
  return v3;
}

- (BOOL)_initializeSyncEngineHook
{
  return 1;
}

- (id)_os_state_titleWithPrefix:(id)a3 withHints:(os_state_hints_s *)a4
{
  unsigned int var2 = a4->var2;
  CFStringRef v5 = @"Error";
  if (var2 == 3) {
    CFStringRef v5 = @"Request";
  }
  if (var2 == 2) {
    CFStringRef v6 = @"Fault";
  }
  else {
    CFStringRef v6 = v5;
  }
  return +[NSString stringWithFormat:@"%@ (why: %@)", a3, v6];
}

- (void)_setupOSStateHandler
{
  objc_initWeak(&location, self);
  dispatch_queue_t v3 = [(TCCDSyncController *)self syncControllerQueue];
  objc_copyWeak(&v4, &location);
  self->_stateHandler = os_state_add_handler();

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_initializeSyncEngine
{
  uint64_t v3 = tcc_sync_log();
  id v4 = (void *)qword_1000AC7A8;
  qword_1000AC7A8 = v3;

  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_100059F10();
  }
  if ([(TCCDSyncController *)self _initializeSyncEngineHook])
  {
    CFStringRef v5 = (OS_dispatch_queue *)dispatch_queue_create("TCCDSyncSessions", 0);
    syncSessionsQueue = self->_syncSessionsQueue;
    self->_syncSessionsQueue = v5;

    v7 = +[NSMapTable strongToStrongObjectsMapTable];
    syncSessionsHandlers = self->_syncSessionsHandlers;
    self->_syncSessionsHandlers = v7;

    v9 = +[NSMutableArray array];
    pendingDeltaSyncChanges = self->_pendingDeltaSyncChanges;
    self->_pendingDeltaSyncChanges = v9;

    v11 = +[NSMutableArray array];
    sessionSyncChanges = self->_sessionSyncChanges;
    self->_sessionSyncChanges = v11;

    v13 = +[NSMutableArray array];
    sessionPendingConfirmationSyncChanges = self->_sessionPendingConfirmationSyncChanges;
    self->_sessionPendingConfirmationSyncChanges = v13;

    if (self->_syncSessionsQueue
      && self->_syncSessionsHandlers
      && self->_pendingDeltaSyncChanges
      && self->_sessionSyncChanges
      && self->_sessionPendingConfirmationSyncChanges)
    {
      self->_pendingSyncType = 0;
      self->_maxRetryCount = 5;
      *(_OWORD *)&self->_sessionPerMessageTimeoutSecs = xmmword_1000763C0;
      *(int64x2_t *)&self->_retryIntervalSecs = vdupq_n_s64(0x3CuLL);
      [(TCCDSyncController *)self _setupOSStateHandler];
      v15 = +[TCCDPlatform currentPlatform];
      v16 = [v15 server];
      v17 = [v16 stateDirectory];
      v18 = [v17 stringByAppendingPathComponent:@"tccd_sync_config.plist"];

      v19 = +[NSData dataWithContentsOfFile:v18 options:0 error:0];
      if (v19)
      {
        id v39 = 0;
        v20 = +[NSPropertyListSerialization propertyListWithData:v19 options:0 format:0 error:&v39];
        id v21 = v39;
        if (v20)
        {
          v22 = [v20 objectForKeyedSubscript:@"maxRetry"];
          v23 = v22;
          if (v22) {
            -[TCCDSyncController setMaxRetryCount:](self, "setMaxRetryCount:", [v22 unsignedLongLongValue]);
          }
          v24 = [v20 objectForKeyedSubscript:@"retryInverval"];

          if (v24) {
            -[TCCDSyncController setRetryIntervalSecs:](self, "setRetryIntervalSecs:", [v24 unsignedLongLongValue]);
          }
          v25 = [v20 objectForKeyedSubscript:@"messageTimeout"];

          if (v25) {
            -[TCCDSyncController setSessionPerMessageTimeoutSecs:](self, "setSessionPerMessageTimeoutSecs:", [v25 unsignedLongLongValue]);
          }
          v26 = [v20 objectForKeyedSubscript:@"eventRetryInverval"];

          if (v26) {
            -[TCCDSyncController setEventRetryIntervalSecs:](self, "setEventRetryIntervalSecs:", [v26 unsignedLongLongValue]);
          }
          v27 = (void *)qword_1000AC7A8;
          if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
            sub_100059E04(v27, self);
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
        {
          sub_100059D6C();
        }
      }
      int v28 = MKBDeviceUnlockedSinceBoot();
      int v29 = v28;
      if (v28 < 0)
      {
        v31 = qword_1000AC7A8;
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
          sub_100059CC0(v29, v31);
        }
        BOOL v30 = 0;
      }
      else if (v28)
      {
        BOOL v30 = 1;
      }
      else
      {
        int out_token = 0;
        v32 = qword_1000AC7A8;
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "SyncEngine init: Device locked; waiting for unlock...",
            buf,
            2u);
        }
        v33 = [(TCCDSyncController *)self syncControllerQueue];
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_10001A814;
        handler[3] = &unk_100095478;
        handler[4] = self;
        notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &out_token, v33, handler);

        int v34 = MKBDeviceUnlockedSinceBoot();
        BOOL v30 = v34 == 1;
        if (v34 == 1)
        {
          notify_cancel(out_token);
          if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
            sub_100059D38();
          }
        }
      }
      v35 = qword_1000AC7A8;
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
      {
        v36 = "No";
        if (v30) {
          v36 = "Yes";
        }
        int out_token = 136315394;
        v41 = v36;
        __int16 v42 = 1024;
        int v43 = v29;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "SyncEngine init: deviceUnlocked: %s, unlockStatus: %d", (uint8_t *)&out_token, 0x12u);
      }
      if (v30)
      {
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
          sub_100059C8C();
        }
        [(TCCDSyncController *)self _initializeSyncEngineAfterDeviceUnlock];
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
    {
      sub_100059C58();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
  {
    sub_100059EDC();
  }
}

- (BOOL)_initializeSyncEngineAfterDeviceUnlockHook
{
  return 1;
}

- (void)_initializeSyncEngineAfterDeviceUnlock
{
  uint64_t v3 = (void *)qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_10005A014(v3);
  }
  id v4 = +[TCCDMessageController sharedMessageControllerForCurrentPlatform];
  messageController = self->_messageController;
  self->_messageController = v4;

  if (self->_messageController)
  {
    id v6 = objc_msgSend(objc_alloc(-[TCCDSyncController syServiceClass](self, "syServiceClass")), "initWithService:priority:asMasterStore:options:", @"com.apple.private.alloy.tccd.sync", 20, -[TCCDSyncController isMain](self, "isMain"), 0);
    [(TCCDSyncController *)self setSyncService:v6];

    v7 = [(TCCDSyncController *)self syncService];

    if (v7)
    {
      syncService = self->_syncService;
      v9 = [(TCCDSyncController *)self syncControllerQueue];
      [(SYService *)syncService setDelegate:self queue:v9];

      if ([(TCCDSyncController *)self _initializeSyncEngineAfterDeviceUnlockHook])
      {
        [(TCCDSyncController *)self setHostDeviceUnlocked:1];
        v10 = [(objc_class *)[(TCCDSyncController *)self nrPairedDeviceRegisteryClass] sharedInstance];
        v11 = [v10 getActivePairedDevice];

        if (v11)
        {
          [(TCCDSyncController *)self _didReturnToPreviouslyPairedDevice:v11];
        }
        else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG))
        {
          sub_100059FAC();
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG))
      {
        sub_100059FE0();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
    {
      sub_100059F78();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
  {
    sub_100059F44();
  }
}

- (void)_resetSyncingAndCancelAnyInFlightSessions
{
  [(TCCDSyncController *)self setPendingSyncType:0];
  uint64_t v3 = [(TCCDSyncController *)self pendingDeltaSyncChanges];
  [v3 removeAllObjects];

  id v4 = [(TCCDSyncController *)self sessionSyncChanges];
  [v4 removeAllObjects];

  CFStringRef v5 = [(TCCDSyncController *)self sessionPendingConfirmationSyncChanges];
  [v5 removeAllObjects];

  [(TCCDSyncController *)self _retrySyncReset];
}

- (void)_setSyncingEnabled:(BOOL)a3
{
  CFStringRef v5 = [(TCCDSyncController *)self syncControllerQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001AB9C;
  v6[3] = &unk_1000954A0;
  BOOL v7 = a3;
  v6[4] = self;
  sub_100019A24(v5, self, v6);
}

- (id)_makePostPairingContinuation
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001AE1C;
  v5[3] = &unk_1000954C8;
  objc_copyWeak(&v6, &location);
  id v2 = objc_retainBlock(v5);
  uint64_t v3 = objc_retainBlock(v2);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (void)_didReturnToPreviouslyPairedDeviceHookWithContinuation:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  (*((void (**)(id, id))a3 + 2))(v4, v5);
}

- (void)_didPairToNewDeviceHookWithContinuation:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  (*((void (**)(id, id))a3 + 2))(v4, v5);
}

- (void)_didReturnToPreviouslyPairedDevice:(id)a3
{
  id v4 = a3;
  [(TCCDSyncController *)self setPairedDevice:v4];
  id v5 = [(TCCDSyncController *)self pairedDevice];
  id v6 = off_1000AC160();
  BOOL v7 = [v5 valueForProperty:v6];
  v8 = [v7 stringByAppendingPathComponent:@"com.apple.tccd"];
  [(TCCDSyncController *)self setPairedDeviceStorageRoot:v8];

  v9 = (void *)qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
  {
    v10 = (void (__cdecl *)())off_1000AC168;
    v11 = v9;
    v12 = v10();
    v13 = [v4 valueForProperty:v12];
    v14 = [(TCCDSyncController *)self pairedDeviceStorageRoot];
    int v16 = 138412546;
    v17 = v13;
    __int16 v18 = 2112;
    v19 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Returning to a previous device: %@: %@", (uint8_t *)&v16, 0x16u);
  }
  [(TCCDSyncController *)self _loadSavedSyncState];
  v15 = [(TCCDSyncController *)self _makePostPairingContinuation];
  [(TCCDSyncController *)self _didReturnToPreviouslyPairedDeviceHookWithContinuation:v15];
}

- (BOOL)_didPairToDeviceHook
{
  return 1;
}

- (void)_didPairToDevice:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = off_1000AC168();
    id v6 = [v4 valueForProperty:v5];

    BOOL v7 = [(TCCDSyncController *)self pairedDevice];

    if (v7)
    {
      v8 = [(TCCDSyncController *)self pairedDevice];
      v9 = off_1000AC168();
      v10 = [v8 valueForProperty:v9];

      if ([v10 isEqual:v6])
      {
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
          sub_10005A434();
        }
        v11 = [(TCCDSyncController *)self _makePostPairingContinuation];
        [(TCCDSyncController *)self _didPairToNewDeviceHookWithContinuation:v11];
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
          sub_10005A468();
        }
        [(TCCDSyncController *)self setPairedDevice:0];
        [(TCCDSyncController *)self setPairedDeviceStorageRoot:0];
      }
    }
    else
    {
      [(TCCDSyncController *)self setPairedDevice:v4];
      v12 = [(TCCDSyncController *)self pairedDevice];
      v13 = off_1000AC160();
      v14 = [v12 valueForProperty:v13];
      v15 = [v14 stringByAppendingPathComponent:@"com.apple.tccd"];
      [(TCCDSyncController *)self setPairedDeviceStorageRoot:v15];

      memset(&v21, 0, sizeof(v21));
      *__error() = 0;
      id v16 = [(TCCDSyncController *)self pairedDeviceStorageRoot];
      LODWORD(v13) = stat((const char *)[v16 fileSystemRepresentation], &v21);

      if (v13)
      {
        if (*__error() == 2)
        {
          id v17 = [(TCCDSyncController *)self pairedDeviceStorageRoot];
          int v18 = mkdir((const char *)[v17 fileSystemRepresentation], 0x1EDu);

          v19 = (void *)qword_1000AC7A8;
          if (v18)
          {
            if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
              sub_10005A2D4(v19, self);
            }
          }
          else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG))
          {
            sub_10005A244(v19);
          }
        }
        else
        {
          v20 = (void *)qword_1000AC7A8;
          if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
            sub_10005A384(v20, self);
          }
        }
      }
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
        sub_10005A1AC();
      }
      v10 = [(TCCDSyncController *)self _makePostPairingContinuation];
      [(TCCDSyncController *)self _didPairToNewDeviceHookWithContinuation:v10];
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
  {
    sub_10005A178();
  }
}

- (void)_didUnPairDevice
{
  uint64_t v3 = (void *)qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_10005A510(v3);
  }
  id v4 = [(TCCDSyncController *)self syncService];
  id v5 = [v4 currentSession];

  if (v5 && os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
    sub_10005A4DC();
  }
  [(TCCDSyncController *)self _didUnPairDeviceHook];
  [(TCCDSyncController *)self setPairedDevice:0];
  [(TCCDSyncController *)self setPairedDeviceStorageRoot:0];
  [(TCCDSyncController *)self _setSyncingEnabled:0];
}

- (void)_acquireTransaction
{
  uint64_t v3 = [(TCCDSyncController *)self syncTransaction];

  if (!v3)
  {
    id v4 = (void *)os_transaction_create();
    [(TCCDSyncController *)self setSyncTransaction:v4];

    id v5 = qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "_acquire_transaction...", v6, 2u);
    }
  }
}

- (void)_release_transaction
{
  uint64_t v3 = [(TCCDSyncController *)self syncTransaction];

  if (v3)
  {
    [(TCCDSyncController *)self setSyncTransaction:0];
    id v4 = qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_release_transaction...", v5, 2u);
    }
  }
}

- (void)_initiateResetSync
{
  [(TCCDSyncController *)self _resetSyncingAndCancelAnyInFlightSessions];
  [(TCCDSyncController *)self _acquireTransaction];
  [(TCCDSyncController *)self setPendingSyncType:1];
  uint64_t v3 = [(TCCDSyncController *)self syncService];
  [v3 setNeedsResetSync];

  id v4 = qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Requesting a ResetSync", v5, 2u);
  }
}

- (void)_addDeltaSyncChange:(id)a3
{
  id v4 = a3;
  if ([(TCCDSyncController *)self pendingSyncType] == 1)
  {
    id v5 = (void *)qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
    {
      id v6 = v5;
      BOOL v7 = [v4 description];
      int v10 = 138412290;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Skipping pending delta sync change (%@) because we have a pending reset sync.", (uint8_t *)&v10, 0xCu);

LABEL_8:
    }
  }
  else
  {
    [(TCCDSyncController *)self setPendingSyncType:2];
    [(TCCDSyncController *)self _acquireTransaction];
    v8 = [(TCCDSyncController *)self pendingDeltaSyncChanges];
    [v8 addObject:v4];

    v9 = (void *)qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
      sub_10005A5A0(v9);
    }
    if (![(TCCDSyncController *)self batchDeltaChanges])
    {
      id v6 = [(TCCDSyncController *)self syncService];
      [v6 setHasChangesAvailable];
      goto LABEL_8;
    }
  }
}

- (void)_endDeltaChangeBatching
{
  [(TCCDSyncController *)self setBatchDeltaChanges:0];
  if ([(TCCDSyncController *)self pendingSyncType] == 1)
  {
    uint64_t v3 = qword_1000AC7A8;
    if (!os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO)) {
      return;
    }
    __int16 v13 = 0;
    id v4 = "Ending delta sync batching when we have a pending reset sync.";
    id v5 = (uint8_t *)&v13;
    id v6 = v3;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v4, v5, 2u);
    return;
  }
  unsigned int v7 = [(TCCDSyncController *)self pendingSyncType];
  v8 = qword_1000AC7A8;
  BOOL v9 = os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO);
  if (v7 != 2)
  {
    if (!v9) {
      return;
    }
    __int16 v11 = 0;
    id v4 = "Ending batching of changes; nothing to do.";
    id v5 = (uint8_t *)&v11;
    id v6 = v8;
    goto LABEL_10;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Ending batching of delta changes; requesting DeltaSync.",
      buf,
      2u);
  }
  int v10 = [(TCCDSyncController *)self syncService];
  [v10 setHasChangesAvailable];
}

- (id)_savedSyncStateFile
{
  uint64_t v3 = [(TCCDSyncController *)self pairedDeviceStorageRoot];

  if (v3)
  {
    id v4 = [(TCCDSyncController *)self pairedDeviceStorageRoot];
    id v5 = [v4 stringByAppendingPathComponent:@"PendedSyncState"];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)_loadSavedSyncState
{
  uint64_t v3 = [(TCCDSyncController *)self _savedSyncStateFile];
  if (v3)
  {
    uint64_t v4 = +[NSData dataWithContentsOfFile:v3];
    if (v4)
    {
      id v5 = (void *)v4;
      id v6 = +[TCCDSyncController allowedClassesForSavedSyncStateUnarchiving];
      id v17 = 0;
      unsigned int v7 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v6 fromData:v5 error:&v17];
      id v8 = v17;

      if (!v7)
      {
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
          sub_10005A630();
        }
        goto LABEL_21;
      }
      BOOL v9 = [v7 objectForKeyedSubscript:@"SyncType"];
      int v10 = [v7 objectForKeyedSubscript:@"SyncChanges"];
      if ([v9 isEqualToString:@"Reset"])
      {
        __int16 v11 = qword_1000AC7A8;
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v12 = "Unarchived reset sync.";
LABEL_7:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v12, buf, 2u);
        }
      }
      else
      {
        if (![v9 isEqualToString:@"Delta"])
        {
          if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
            sub_10005A70C();
          }
          goto LABEL_20;
        }
        if (!v10)
        {
          if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
            sub_10005A6A0();
          }
          goto LABEL_20;
        }
        if ([v10 count])
        {
          [(TCCDSyncController *)self setPendingSyncType:2];
          __int16 v13 = [(TCCDSyncController *)self pendingDeltaSyncChanges];
          [v13 addObjectsFromArray:v10];

          v14 = (void *)qword_1000AC7A8;
          if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
          {
            v15 = v14;
            id v16 = [v10 count];
            *(_DWORD *)buf = 134218242;
            id v19 = v16;
            __int16 v20 = 2112;
            stat v21 = v10;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Unarchived %lu delta changes: %@", buf, 0x16u);
          }
          goto LABEL_20;
        }
        __int16 v11 = qword_1000AC7A8;
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v12 = "Unarchived delta sync but there are 0 changes; reset sync instead";
          goto LABEL_7;
        }
      }
      [(TCCDSyncController *)self setPendingSyncType:1];
LABEL_20:
      [(TCCDSyncController *)self _removeSavedSyncState];

LABEL_21:
    }
  }
}

- (BOOL)_writeSyncState
{
  if (![(TCCDSyncController *)self pendingSyncType])
  {
    uint64_t v3 = [(TCCDSyncController *)self syncService];
    uint64_t v4 = [v3 currentSession];

    if (!v4) {
      return 1;
    }
    id v5 = [(TCCDSyncController *)self syncService];
    id v6 = [v5 currentSession];
    unsigned int v7 = [v6 isResetSync];

    if (v7)
    {
      [(TCCDSyncController *)self setPendingSyncType:1];
      id v8 = [(TCCDSyncController *)self sessionPendingConfirmationSyncChanges];
      [v8 removeAllObjects];

      id v9 = [(TCCDSyncController *)self sessionSyncChanges];
      [v9 removeAllObjects];
    }
    else
    {
      [(TCCDSyncController *)self setPendingSyncType:2];
      __int16 v11 = [(TCCDSyncController *)self pendingDeltaSyncChanges];
      id v9 = [v11 copy];

      v12 = [(TCCDSyncController *)self pendingDeltaSyncChanges];
      [v12 removeAllObjects];

      __int16 v13 = [(TCCDSyncController *)self pendingDeltaSyncChanges];
      v14 = [(TCCDSyncController *)self sessionPendingConfirmationSyncChanges];
      [v13 addObjectsFromArray:v14];

      v15 = [(TCCDSyncController *)self pendingDeltaSyncChanges];
      id v16 = [(TCCDSyncController *)self sessionSyncChanges];
      [v15 addObjectsFromArray:v16];

      id v17 = [(TCCDSyncController *)self pendingDeltaSyncChanges];
      [v17 addObjectsFromArray:v9];

      int v18 = [(TCCDSyncController *)self sessionPendingConfirmationSyncChanges];
      [v18 removeAllObjects];

      id v19 = [(TCCDSyncController *)self sessionSyncChanges];
      [v19 removeAllObjects];
    }
    [(TCCDSyncController *)self setSessionShouldCancelWhenActive:1];
  }
  __int16 v20 = objc_opt_new();
  if ([(TCCDSyncController *)self pendingSyncType] == 2)
  {
    [v20 setObject:@"Delta" forKeyedSubscript:@"SyncType"];
    stat v21 = [(TCCDSyncController *)self pendingDeltaSyncChanges];
    [v20 setObject:v21 forKeyedSubscript:@"SyncChanges"];

    v22 = (void *)qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
    {
      v23 = v22;
      v24 = [(TCCDSyncController *)self pendingDeltaSyncChanges];
      *(_DWORD *)buf = 134217984;
      id v37 = [v24 count];
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Adding %lu pending sync changes to archive.", buf, 0xCu);
    }
  }
  else
  {
    [v20 setObject:@"Reset" forKeyedSubscript:@"SyncType"];
    v25 = qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Adding Reset sync to archive.", buf, 2u);
    }
  }
  id v35 = 0;
  v26 = +[NSKeyedArchiver archivedDataWithRootObject:v20 requiringSecureCoding:1 error:&v35];
  id v27 = v35;
  if (v26)
  {
    int v28 = [(TCCDSyncController *)self _savedSyncStateFile];
    int v29 = qword_1000AC7A8;
    BOOL v30 = os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO);
    if (v28)
    {
      if (v30)
      {
        *(_DWORD *)buf = 138543362;
        id v37 = v28;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Writing sync state to: %{public}@", buf, 0xCu);
      }
      id v34 = 0;
      unsigned __int8 v10 = [v26 writeToFile:v28 options:1 error:&v34];
      id v31 = v34;
      v32 = qword_1000AC7A8;
      if (v10)
      {
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v37 = v28;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Wrote sync state to: %{public}@", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
      {
        sub_10005A7E8();
      }
    }
    else
    {
      if (v30)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Skipping the writing sync state... no paired-storage file.", buf, 2u);
      }
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_10005A77C();
    }
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (void)_removeSavedSyncState
{
  id v2 = [(TCCDSyncController *)self _savedSyncStateFile];
  uint64_t v3 = +[NSFileManager defaultManager];
  uint64_t v4 = v3;
  if (v2)
  {
    id v7 = 0;
    unsigned int v5 = [v3 removeItemAtPath:v2 error:&v7];
    id v6 = v7;
    if (v5 && os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
      sub_10005A880();
    }
  }
  else
  {
    id v6 = 0;
  }
}

- (void)_writeSyncStateAndAllowTermination
{
  [(TCCDSyncController *)self _writeSyncState];
  [(TCCDSyncController *)self setRetryCount:0];
  [(TCCDSyncController *)self _release_transaction];
}

- (void)_retrySyncCancel
{
  uint64_t v3 = [(TCCDSyncController *)self retryBlock];

  if (v3)
  {
    uint64_t v4 = (void *)qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
      sub_10005A8F4(v4);
    }
    unsigned int v5 = [(TCCDSyncController *)self retryBlock];
    dispatch_block_cancel(v5);

    [(TCCDSyncController *)self setRetryBlock:0];
  }
}

- (void)_retrySyncReset
{
  [(TCCDSyncController *)self _retrySyncCancel];
  [(TCCDSyncController *)self setRetryCount:0];
  uint64_t v3 = (void *)qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = v3;
    int v5 = 134217984;
    unint64_t v6 = [(TCCDSyncController *)self retryCount];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_retrySyncReset: retryCount: %llu", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_retrySyncSession:(id)a3
{
  id v4 = a3;
  if ([v4 isResetSync])
  {
    int v5 = 1;
    [(TCCDSyncController *)self setPendingSyncType:1];
    unint64_t v6 = [(TCCDSyncController *)self pendingDeltaSyncChanges];
    [v6 removeAllObjects];

    id v7 = [(TCCDSyncController *)self sessionPendingConfirmationSyncChanges];
    [v7 removeAllObjects];

    id v8 = [(TCCDSyncController *)self sessionSyncChanges];
    [v8 removeAllObjects];

    id v9 = (void *)qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v10 = v9;
      __int16 v11 = [v4 identifier];
      *(_DWORD *)buf = 138543362;
      unint64_t v58 = (unint64_t)v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "_retrySyncSession(session: %{public}@): for reset sync.", buf, 0xCu);
    }
  }
  else
  {
    [(TCCDSyncController *)self setPendingSyncType:2];
    v12 = [(TCCDSyncController *)self pendingDeltaSyncChanges];
    id v13 = [v12 copy];

    v14 = [(TCCDSyncController *)self pendingDeltaSyncChanges];
    [v14 removeAllObjects];

    v15 = (void *)qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
    {
      id v16 = v15;
      id v17 = [v4 identifier];
      int v18 = [(TCCDSyncController *)self sessionPendingConfirmationSyncChanges];
      id v19 = [v18 count];
      __int16 v20 = [(TCCDSyncController *)self sessionSyncChanges];
      *(_DWORD *)buf = 138544130;
      unint64_t v58 = (unint64_t)v17;
      __int16 v59 = 2048;
      unint64_t v60 = (unint64_t)v19;
      __int16 v61 = 2048;
      id v62 = [v20 count];
      __int16 v63 = 2048;
      id v64 = [v13 count];
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "_retrySyncSession(session: %{public}@): for delta sync: confirmationSyncChanges: %lu, sessionSyncChanges %lu, currentPendingChanges: %lu", buf, 0x2Au);
    }
    stat v21 = [(TCCDSyncController *)self pendingDeltaSyncChanges];
    v22 = [(TCCDSyncController *)self sessionPendingConfirmationSyncChanges];
    [v21 addObjectsFromArray:v22];

    v23 = [(TCCDSyncController *)self pendingDeltaSyncChanges];
    v24 = [(TCCDSyncController *)self sessionSyncChanges];
    [v23 addObjectsFromArray:v24];

    v25 = [(TCCDSyncController *)self pendingDeltaSyncChanges];
    [v25 addObjectsFromArray:v13];

    v26 = [(TCCDSyncController *)self sessionPendingConfirmationSyncChanges];
    [v26 removeAllObjects];

    id v27 = [(TCCDSyncController *)self sessionSyncChanges];
    [v27 removeAllObjects];

    int v5 = 2;
  }
  unint64_t v28 = [(TCCDSyncController *)self retryCount];
  [(TCCDSyncController *)self setRetryCount:(char *)[(TCCDSyncController *)self retryCount] + 1];
  [(TCCDSyncController *)self _retrySyncCancel];
  v49 = _NSConcreteStackBlock;
  uint64_t v50 = 3221225472;
  v51 = sub_10001CAE0;
  v52 = &unk_1000954F0;
  v53 = self;
  id v29 = v4;
  id v54 = v29;
  unint64_t v55 = v28;
  int v56 = v5;
  dispatch_block_t v30 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &v49);
  -[TCCDSyncController setRetryBlock:](self, "setRetryBlock:", v30, v49, v50, v51, v52, v53);

  id v31 = (void *)qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
  {
    v32 = v31;
    v33 = [(TCCDSyncController *)self retryBlock];
    id v34 = objc_retainBlock(v33);
    id v35 = [v29 identifier];
    unint64_t v36 = [(TCCDSyncController *)self retryCount];
    *(_DWORD *)buf = 134218754;
    unint64_t v58 = (unint64_t)v34;
    __int16 v59 = 2114;
    unint64_t v60 = (unint64_t)v35;
    __int16 v61 = 2048;
    id v62 = (id)v28;
    __int16 v63 = 2048;
    id v64 = (id)v36;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "_retrySyncSession(%p) session: %{public}@: current count: %llu, retryCount: %llu", buf, 0x2Au);
  }
  id v37 = [(TCCDSyncController *)self retryBlock];

  if (!v37)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_10005A998();
    }
    v47 = self;
    uint64_t v48 = 5;
    goto LABEL_20;
  }
  unint64_t v38 = [(TCCDSyncController *)self maxRetryCount];
  id v39 = (void *)qword_1000AC7A8;
  if (v28 >= v38)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_10005A9CC();
    }
    v47 = self;
    uint64_t v48 = 6;
LABEL_20:
    [(TCCDSyncController *)v47 _sendSyncSessionDidFinishWithResult:v48 error:0];
    goto LABEL_21;
  }
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
  {
    v40 = v39;
    unint64_t v41 = [(TCCDSyncController *)self retryIntervalSecs];
    __int16 v42 = [(TCCDSyncController *)self retryBlock];
    id v43 = objc_retainBlock(v42);
    *(_DWORD *)buf = 134218496;
    unint64_t v58 = v41;
    __int16 v59 = 2048;
    unint64_t v60 = v28;
    __int16 v61 = 2048;
    id v62 = v43;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Will retry sync in %llu seconds with retry-block: %llu (%p)", buf, 0x20u);
  }
  dispatch_time_t v44 = dispatch_time(0, 1000000000 * [(TCCDSyncController *)self retryIntervalSecs]);
  v45 = [(TCCDSyncController *)self syncControllerQueue];
  v46 = [(TCCDSyncController *)self retryBlock];
  dispatch_after(v44, v45, v46);

LABEL_21:
}

- (void)_retrySyncType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(TCCDSyncController *)self _retrySyncCancel];
  int v5 = (void *)qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
  {
    unint64_t v6 = v5;
    int v9 = 136446210;
    unsigned __int8 v10 = [(TCCDSyncController *)self _syncTypeToString:v3];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Retry sync for pending state: requesting '%{public}s' sync", (uint8_t *)&v9, 0xCu);
  }
  if (v3 == 2)
  {
    id v8 = [(TCCDSyncController *)self syncService];
    [v8 setHasChangesAvailable];
  }
  else
  {
    if (v3 != 1) {
      return;
    }
    id v7 = [(TCCDSyncController *)self pendingDeltaSyncChanges];
    [v7 removeAllObjects];

    id v8 = [(TCCDSyncController *)self syncService];
    [v8 setNeedsResetSync];
  }

  [(TCCDSyncController *)self _acquireTransaction];
}

- (void)_sendSyncSessionDidFinishWithResult:(unsigned int)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = (void *)qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
  {
    if (a3 > 7) {
      CFStringRef v8 = @"<Unknown>";
    }
    else {
      CFStringRef v8 = (const __CFString *)*((void *)&off_100095588 + (int)a3);
    }
    *(_DWORD *)id v13 = 138543618;
    *(void *)&v13[4] = v8;
    *(_WORD *)&v13[12] = 2112;
    *(void *)&v13[14] = v6;
    int v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Send-Sync Session did finish: %{public}@, error: %@", v13, 0x16u);
  }
  switch(a3)
  {
    case 1u:
    case 2u:
      [(TCCDSyncController *)self _removeSavedSyncState];
      [(TCCDSyncController *)self _retrySyncReset];
      goto LABEL_9;
    case 3u:
      goto LABEL_9;
    case 5u:
    case 8u:
      [(TCCDSyncController *)self _resetSyncingAndCancelAnyInFlightSessions];
LABEL_9:
      [(TCCDSyncController *)self _release_transaction];
      break;
    case 6u:
      [(TCCDSyncController *)self _writeSyncStateAndAllowTermination];
      unsigned __int8 v10 = [(TCCDSyncController *)self syncService];
      unsigned int v11 = [v10 targetIsInProximity];

      BOOL v12 = os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR);
      if (v11)
      {
        if (v12) {
          sub_10005AA64();
        }
      }
      else if (v12)
      {
        sub_10005AA98();
      }
      break;
    case 7u:
      [(TCCDSyncController *)self _writeSyncStateAndAllowTermination];
      break;
    default:
      break;
  }
}

- (void)syncAccessUpdateForServiceIdentifier:(id)a3 mainClientIdentifier:(id)a4 replicaClientIdentifier:(id)a5 clientType:(int)a6 accessStatus:(unint64_t)a7 authorizationVersion:(unint64_t)a8 flags:(int)a9 updateType:(unint64_t)a10
{
  uint64_t v12 = *(void *)&a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [(TCCDSyncClientAccessAction *)[TCCDSyncUpdateAccessAction alloc] initWithServiceIdentifier:v18 mainClientIdentifier:v17 replicaClientIdentifier:v16 clientType:v12];

  [(TCCDSyncUpdateAccessAction *)v19 setUpdateAccessActionStatus:a7];
  [(TCCDSyncUpdateAccessAction *)v19 setAuthorizationVersion:a8];
  [(TCCDSyncUpdateAccessAction *)v19 setDatabaseFlags:a9];
  [(TCCDSyncController *)self syncAccessAction:v19 updateType:a10];
}

- (void)syncAccessUpdateForServiceIdentifier:(id)a3 clientIdentifier:(id)a4 clientType:(int)a5 accessStatus:(unint64_t)a6 authorizationVersion:(unint64_t)a7 flags:(int)a8 updateType:(unint64_t)a9
{
  uint64_t v12 = *(void *)&a5;
  id v15 = a3;
  id v16 = a4;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_10005AACC();
  }
  LODWORD(v17) = a8;
  [(TCCDSyncController *)self syncAccessUpdateForServiceIdentifier:v15 mainClientIdentifier:0 replicaClientIdentifier:v16 clientType:v12 accessStatus:a6 authorizationVersion:a7 flags:v17 updateType:a9];
}

- (id)stringForSYChangeType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3) {
    return (id)*((void *)&off_1000955C8 + a3 - 1);
  }
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_10005AB40();
  }
  return @"<Unknown>";
}

- (unint64_t)updateTypeForSYChangeType:(int64_t)a3
{
  if (a3 == 3) {
    return 2;
  }
  else {
    return a3 == 2;
  }
}

- (int64_t)syChangeTypeForUpdateType:(unint64_t)a3
{
  int64_t v3 = 1;
  if (a3 == 1) {
    int64_t v3 = 2;
  }
  if (a3 == 2) {
    return 3;
  }
  else {
    return v3;
  }
}

- (BOOL)isSyncingEnabled
{
  id v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  int64_t v3 = [(TCCDSyncController *)self syncControllerQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001D254;
  v5[3] = &unk_100095518;
  void v5[4] = v2;
  v5[5] = &v6;
  sub_100019A24(v3, v2, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)beginBatchingDeltaChanges
{
  int64_t v3 = [(TCCDSyncController *)self syncControllerQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001D2F4;
  v4[3] = &unk_100094E78;
  v4[4] = self;
  sub_100019A24(v3, self, v4);
}

- (void)endBatchingDeltaChanges
{
  int64_t v3 = [(TCCDSyncController *)self syncControllerQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001D3D0;
  v4[3] = &unk_100094E78;
  v4[4] = self;
  sub_100019A24(v3, self, v4);
}

- (void)willShutdown
{
  int64_t v3 = [(TCCDSyncController *)self syncControllerQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001D464;
  v4[3] = &unk_100094E78;
  v4[4] = self;
  sub_100019A24(v3, self, v4);
}

- (void)setSyncSession:(id)a3 accessDidUpdateHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TCCDSyncController *)self syncSessionsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D5B4;
  block[3] = &unk_100095540;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)removeAccessDidUpdateHandlerForSession:(id)a3
{
  id v4 = a3;
  int v5 = [(TCCDSyncController *)self syncSessionsQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D6C8;
  v7[3] = &unk_100094FE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)syncAccessAction:(id)a3 updateType:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = [(TCCDSyncController *)self syncControllerQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D790;
    block[3] = &unk_100095568;
    id v9 = v6;
    id v10 = self;
    unint64_t v11 = a4;
    dispatch_async(v7, block);
  }
}

- (id)dictionaryMessageSyncIDKey
{
  return off_1000AC170();
}

- (void)handleMemoryPressureCritical
{
  int64_t v3 = [(TCCDSyncController *)self syncControllerQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001D874;
  v4[3] = &unk_100094E78;
  v4[4] = self;
  sub_100019A24(v3, self, v4);
}

- (id)_syncSessionHandlerForUpdateAccessAction:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [(TCCDSyncController *)self syncSessionsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001DC40;
  block[3] = &unk_100094FB8;
  void block[4] = self;
  id v12 = v4;
  id v13 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_sync(v6, block);

  id v9 = [v7 copy];
  return v9;
}

- (void)_notifySyncSessionHandlers:(id)a3 forUpdateAccessAction:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v10);
        id v12 = qword_1000AC7A8;
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          id v18 = "-[TCCDSyncController _notifySyncSessionHandlers:forUpdateAccessAction:]";
          __int16 v19 = 2112;
          id v20 = v6;
          _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s: Running handler for session matching: %@", buf, 0x16u);
        }
        (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v8);
  }
}

- (void)_updateDatabase:(unint64_t)a3 forUpdateAccessAction:(id)a4
{
  id v6 = a4;
  id v7 = [(TCCDSyncController *)self _syncSessionHandlerForUpdateAccessAction:v6];
  id v8 = [v7 count];
  uint64_t v9 = (void *)qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG))
  {
    if (v8) {
      id v10 = "No";
    }
    else {
      id v10 = "Yes";
    }
    uint64_t v11 = v9;
    int v12 = 136315906;
    long long v13 = "-[TCCDSyncController _updateDatabase:forUpdateAccessAction:]";
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2080;
    uint64_t v17 = v10;
    __int16 v18 = 2048;
    id v19 = [v7 count];
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s: %@, killClient: %s, handler count: %ld", (uint8_t *)&v12, 0x2Au);
  }
  [v6 updateDatabase:a3 killClient:v8 == 0];
  if ([v7 count]) {
    [(TCCDSyncController *)self _notifySyncSessionHandlers:v7 forUpdateAccessAction:v6];
  }
}

- (void)_handleSyncObject:(id)a3 updateType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = sub_100020F50(a4);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v6;
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
        sub_10005AC50();
      }
      [(TCCDSyncController *)self _updateDatabase:a4 forUpdateAccessAction:v8];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v6;
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
          sub_10005ACC4();
        }
        [v9 updateDatabase:a4 killClient:1];
      }
      else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
      {
        sub_10005AD38();
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
  {
    sub_10005ADE4();
  }
}

- (id)_beginResetSyncHook
{
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
    sub_10005AE90();
  }
  id v2 = +[NSArray array];
  return v2;
}

- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v10;
    if ([(TCCDSyncController *)self isMain]) {
      int v12 = "Main";
    }
    else {
      int v12 = "Replica";
    }
    long long v13 = [v9 identifier];
    if ([v9 isResetSync]) {
      __int16 v14 = "ResetSync";
    }
    else {
      __int16 v14 = "DeltaSync";
    }
    unsigned int v15 = [v9 isSending];
    __int16 v16 = "Receiving";
    *(_DWORD *)buf = 136446978;
    v49 = v12;
    __int16 v50 = 2114;
    if (v15) {
      __int16 v16 = "Sending";
    }
    v51 = v13;
    __int16 v52 = 2082;
    v53 = v14;
    __int16 v54 = 2082;
    unint64_t v55 = v16;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "SYService %{public}s starting SYSession:%{public}@, type: %{public}s, direction: %{public}s", buf, 0x2Au);
  }
  if (!self->_isSyncingEnabled)
  {
    unsigned int v17 = [(TCCDSyncController *)self pendingSyncType];
    __int16 v18 = (void *)qword_1000AC7A8;
    if (!v17)
    {
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT))
      {
        id v37 = v18;
        unint64_t v38 = [v9 identifier];
        *(_DWORD *)buf = 138543362;
        v49 = v38;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Rejecting new SYSession:%{public}@ when syncing is not enabled.", buf, 0xCu);
      }
      id v39 = 0;
      goto LABEL_53;
    }
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_10005AEC4(v18);
    }
    id v19 = objc_alloc((Class)NSError);
    uint64_t v20 = 1;
LABEL_52:
    id v39 = [v19 initWithDomain:@"com.apple.tccd.TCCDSyncControllerErrorDomain" code:v20 userInfo:0];
LABEL_53:
    BOOL v23 = 0;
    *a5 = v39;
    goto LABEL_54;
  }
  if ([v9 isSending])
  {
    [(TCCDSyncController *)self setSessionShouldCancelWhenActive:0];
LABEL_23:
    [v9 setDelegate:self];
    [v9 setSerializer:self];
    v24 = [(TCCDSyncController *)self syncControllerQueue];
    [v9 setTargetQueue:v24];

    objc_msgSend(v9, "setPerMessageTimeout:", (double)-[TCCDSyncController sessionPerMessageTimeoutSecs](self, "sessionPerMessageTimeoutSecs"));
    if (![v9 isSending])
    {
      [(TCCDSyncController *)self _acquireTransaction];
LABEL_48:
      BOOL v23 = 1;
      goto LABEL_54;
    }
    v25 = [(TCCDSyncController *)self sessionSyncChanges];
    id v26 = [v25 count];

    if (v26)
    {
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
        sub_10005B12C();
      }
      id v27 = [(TCCDSyncController *)self sessionSyncChanges];
      [v27 removeAllObjects];
    }
    if (![v9 isResetSync])
    {
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
        sub_10005B080();
      }
      id v29 = [(TCCDSyncController *)self sessionSyncChanges];
      id v35 = [(TCCDSyncController *)self pendingDeltaSyncChanges];
      id v34 = v29;
      id v36 = v35;
      goto LABEL_47;
    }
    if ([(TCCDSyncController *)self isMain])
    {
      unint64_t v28 = [(TCCDSyncController *)self _beginResetSyncHook];
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
        sub_10005AF54();
      }
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v29 = v28;
      id v30 = [v29 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v30)
      {
        id v31 = v30;
        uint64_t v32 = *(void *)v44;
        do
        {
          for (i = 0; i != v31; i = (char *)i + 1)
          {
            if (*(void *)v44 != v32) {
              objc_enumerationMutation(v29);
            }
            objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * i), "setSyncChangeType:", 1, (void)v43);
          }
          id v31 = [v29 countByEnumeratingWithState:&v43 objects:v47 count:16];
        }
        while (v31);
      }

      id v34 = [(TCCDSyncController *)self sessionSyncChanges];
      id v35 = v34;
      id v36 = v29;
LABEL_47:
      objc_msgSend(v34, "addObjectsFromArray:", v36, (void)v43);

      v40 = [(TCCDSyncController *)self pendingDeltaSyncChanges];
      [v40 removeAllObjects];

      [(TCCDSyncController *)self setPendingSyncType:0];
      goto LABEL_48;
    }
    unint64_t v41 = (void *)qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_10005AFF0(v41);
    }
    id v19 = objc_alloc((Class)NSError);
    uint64_t v20 = 4;
    goto LABEL_52;
  }
  if (![v9 isResetSync]) {
    goto LABEL_23;
  }
  stat v21 = [(TCCDSyncController *)self retryBlock];

  if (!v21) {
    goto LABEL_23;
  }
  v22 = (void *)qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
    sub_10005B1D4(v22, v9);
  }
  *a5 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.tccd.TCCDSyncControllerErrorDomain" code:5 userInfo:0];
  [(TCCDSyncController *)self _retrySyncType:[(TCCDSyncController *)self pendingSyncType]];
  BOOL v23 = 0;
LABEL_54:

  return v23;
}

- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 state] == 5)
  {
    id v9 = [v8 domain];
    if ([v9 isEqualToString:@"com.apple.identityservices.error"]
      && [v8 code] == (id)23
      || [v9 isEqualToString:@"SYErrorDomain"]
      && [v8 code] == (id)2007)
    {
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
        sub_10005B29C();
      }
    }
    else if ([v9 isEqualToString:@"SYErrorDomain"] {
           && [v8 code] == (id)2023)
    }
    {
      long long v13 = (void *)qword_1000AC7A8;
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
        sub_10005B36C(v13);
      }
    }
    else if ([v9 isEqualToString:@"com.apple.tccd.TCCDSyncControllerErrorDomain"] {
           && [v8 code] == (id)5)
    }
    {
      unsigned int v17 = (void *)qword_1000AC7A8;
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
        sub_10005B3FC(v17);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_FAULT))
    {
      sub_10005B48C();
    }
    if ([v7 isSending]) {
      [(TCCDSyncController *)self _retrySyncSession:v7];
    }
  }
  else if ([v7 state] == 3)
  {
    unsigned int v10 = [(TCCDSyncController *)self sessionShouldCancelWhenActive];
    uint64_t v11 = (void *)qword_1000AC7A8;
    BOOL v12 = os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (v12) {
        sub_10005B54C(v11);
      }
      [(TCCDSyncController *)self setSessionShouldCancelWhenActive:0];
    }
    else
    {
      if (v12) {
        sub_10005B5DC(v11);
      }
      [(TCCDSyncController *)self _sendSyncSessionDidFinishWithResult:3 error:0];
      if ([v7 isSending]) {
        [(TCCDSyncController *)self _retrySyncSession:v7];
      }
    }
  }
  else
  {
    unsigned int v14 = [v7 state];
    unsigned int v15 = (void *)qword_1000AC7A8;
    if (v14 == 9)
    {
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
        sub_10005B66C(v15);
      }
      if ([v7 isSending])
      {
        if ([v7 isResetSync]) {
          uint64_t v16 = 2;
        }
        else {
          uint64_t v16 = 1;
        }
        [(TCCDSyncController *)self _sendSyncSessionDidFinishWithResult:v16 error:0];
      }
      else
      {
        [(TCCDSyncController *)self _release_transaction];
        __int16 v18 = [(TCCDSyncController *)self retryBlock];

        if (v18)
        {
          id v19 = qword_1000AC7A8;
          if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)stat v21 = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "After receive-session completed: retrying pending state.", v21, 2u);
          }
          uint64_t v20 = [(TCCDSyncController *)self retryBlock];
          v20[2]();
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
    {
      sub_10005B6FC(v15);
    }
  }
}

- (void)service:(id)a3 encounteredError:(id)a4 context:(id)a5
{
  id v6 = (void *)qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
    sub_10005B7B4(v6, a5);
  }
}

- (void)service:(id)a3 willSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG))
  {
    sub_10005B888();
    if (!v9) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v9) {
LABEL_3:
  }
    [(TCCDSyncController *)self _didUnPairDevice];
LABEL_4:
}

- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG))
  {
    sub_10005B930();
    if (!v10) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v10)
  {
LABEL_3:
    uint64_t v11 = [(objc_class *)[(TCCDSyncController *)self nrPairedDeviceRegisteryClass] sharedInstance];
    BOOL v12 = [v11 deviceForPairingID:v10];
    [(TCCDSyncController *)self _didPairToDevice:v12];
  }
LABEL_4:
}

- (void)service:(id)a3 targetDeviceProximityChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    if ([(TCCDSyncController *)self pendingSyncType])
    {
      [(TCCDSyncController *)self _acquireTransaction];
      id v7 = qword_1000AC7A8;
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Paired device is now in proximity: requesting sync of pending state.", v8, 2u);
      }
      [(TCCDSyncController *)self _retrySyncType:[(TCCDSyncController *)self pendingSyncType]];
      [(TCCDSyncController *)self setRetryCount:0];
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG))
    {
      sub_10005B9D8();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG))
  {
    sub_10005BA0C();
  }
}

- (id)service:(id)a3 willPreferSession:(id)a4 overSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_10005BA40();
  }
  if (![v10 isSending]) {
    goto LABEL_7;
  }
  uint64_t v11 = [(TCCDSyncController *)self syncService];
  id v12 = [v11 currentSession];
  if (v12 != v10)
  {

LABEL_7:
    id v14 = 0;
    goto LABEL_8;
  }
  unsigned __int8 v13 = [v9 isSending];

  if (v13) {
    goto LABEL_7;
  }
  uint64_t v16 = [(TCCDSyncController *)self syncService];
  unsigned int v17 = [v16 currentSession];
  [(TCCDSyncController *)self _retrySyncSession:v17];

  id v14 = v9;
LABEL_8:

  return v14;
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (uint64_t (**)(id, void))a4;
  if ([(TCCDSyncController *)self sessionShouldCancelWhenActive])
  {
    id v10 = (void *)qword_1000AC7A8;
    if (!os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      unsigned int v14 = 3;
      goto LABEL_25;
    }
    uint64_t v11 = v10;
    id v12 = [v8 identifier];
    *(_DWORD *)buf = 138543362;
    id v34 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Cancelling an active SYSession:%{public}@ in enqueueChanges", buf, 0xCu);

LABEL_8:
    goto LABEL_9;
  }
  if ([(TCCDSyncController *)self retryTestMaxRetry])
  {
    [(TCCDSyncController *)self setRetryTestMaxRetry:0];
    [(TCCDSyncController *)self setRetryCount:[(TCCDSyncController *)self maxRetryCount]];
    unsigned __int8 v13 = (void *)qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_10005BAE8(v13);
    }
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    CFStringRef v32 = @"Testing maxRetry handling.";
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    *a5 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.tccd.TCCDSyncControllerErrorDomain" code:6 userInfo:v11];
    goto LABEL_8;
  }
  unsigned int v15 = [(TCCDSyncController *)self sessionSyncChanges];
  id v16 = [v15 copy];

  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_10005BC24();
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v17 = v16;
  id v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v27;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        if ((v9[2](v9, v22) & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
            sub_10005BB78();
          }
          unsigned int v14 = 1;
          goto LABEL_24;
        }
        BOOL v23 = [(TCCDSyncController *)self sessionSyncChanges];
        [v23 removeObjectAtIndex:0];

        v24 = [(TCCDSyncController *)self sessionPendingConfirmationSyncChanges];
        [v24 addObject:v22];
      }
      id v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
  unsigned int v14 = 2;
LABEL_24:

LABEL_25:
  return v14;
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  CFStringRef v32 = (void (**)(id, BOOL, id))a5;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_10005BCC4();
  }
  v33 = v8;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (!v11)
  {
    id v13 = 0;
    goto LABEL_28;
  }
  id v12 = v11;
  id v13 = 0;
  uint64_t v14 = *(void *)v35;
  do
  {
    unsigned int v15 = 0;
    do
    {
      if (*(void *)v35 != v14) {
        objc_enumerationMutation(v10);
      }
      id v16 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v15);
      id v17 = objc_msgSend(v16, "changeType", v32, v33);
      unint64_t v18 = [(TCCDSyncController *)self updateTypeForSYChangeType:v17];
      id v19 = [(TCCDSyncController *)self stringForSYChangeType:v17];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v22 = (void *)qword_1000AC7A8;
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
        {
          v25 = v22;
          id v30 = (objc_class *)objc_opt_class();
          long long v27 = NSStringFromClass(v30);
          *(_DWORD *)buf = 138543618;
          id v39 = v19;
          __int16 v40 = 2114;
          id v41 = v27;
          long long v28 = v25;
          long long v29 = "applying change: %{public}@: Unexpected object of class: %{public}@";
LABEL_24:
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, v29, buf, 0x16u);
        }
LABEL_14:
        id v20 = v13;
        id v13 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.tccd.TCCDSyncControllerErrorDomain" code:2 userInfo:0];
        goto LABEL_15;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = v16;
        stat v21 = qword_1000AC7A8;
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v39 = v19;
          __int16 v40 = 2112;
          id v41 = v20;
          _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "applying change: update access: %@ -> %@", buf, 0x16u);
        }
        [(TCCDSyncController *)self _updateDatabase:v18 forUpdateAccessAction:v20];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v24 = (void *)qword_1000AC7A8;
          if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
          {
            v25 = v24;
            long long v26 = (objc_class *)objc_opt_class();
            long long v27 = NSStringFromClass(v26);
            *(_DWORD *)buf = 138543618;
            id v39 = v19;
            __int16 v40 = 2114;
            id v41 = v27;
            long long v28 = v25;
            long long v29 = "applying change: %{public}@: Unexpected subclass: %{public}@";
            goto LABEL_24;
          }
          goto LABEL_14;
        }
        id v20 = v16;
        BOOL v23 = qword_1000AC7A8;
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v39 = v19;
          __int16 v40 = 2112;
          id v41 = v20;
          _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "applying change: override access: %@ -> %@", buf, 0x16u);
        }
        [v20 updateDatabase:v18 killClient:1];
      }
LABEL_15:

      unsigned int v15 = (char *)v15 + 1;
    }
    while (v12 != v15);
    id v31 = [v10 countByEnumeratingWithState:&v34 objects:v42 count:16];
    id v12 = v31;
  }
  while (v31);
LABEL_28:

  v32[2](v32, v13 == 0, v13);
}

- (void)syncSession:(id)a3 didEndWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)qword_1000AC7A8;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10005BD64(v6, v7);
  }

  if (!v7)
  {
    id v9 = [(TCCDSyncController *)self sessionPendingConfirmationSyncChanges];
    [v9 removeAllObjects];
  }
}

- (void)syncSession:(id)a3 successfullySynced:(id)a4
{
  id v6 = (void *)qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = a4;
    id v9 = [a3 identifier];
    id v10 = [v8 count];

    int v11 = 138543618;
    id v12 = v9;
    __int16 v13 = 2048;
    id v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "SYSession:%{public}@; successfullySynced: %lu changes",
      (uint8_t *)&v11,
      0x16u);
  }
}

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = [(TCCDSyncController *)self isMain];
  id v8 = (void *)qword_1000AC7A8;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_10005BE2C(v8);
    }
    id v9 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.tccd.TCCDSyncControllerErrorDomain" code:3 userInfo:0];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
      sub_10005BEBC(v8);
    }
    sub_1000230C0();
    id v9 = 0;
  }
  *a4 = v9;

  return v7 ^ 1;
}

- (id)dataFromChange:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v8 = 0;
    BOOL v4 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v8];
    id v5 = v8;
    if (!v4 && os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_10005BF4C();
    }
  }
  else
  {
    id v6 = (void *)qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_10005BFB8(v6);
    }
    BOOL v4 = 0;
  }

  return v4;
}

- (id)changeFromData:(id)a3 ofType:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[TCCDSyncController allowedClassesForSYChangeUnarchiving];
  id v11 = 0;
  unsigned int v7 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v6 fromData:v5 error:&v11];

  id v8 = v11;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v7 setSyncChangeType:a4];
      goto LABEL_11;
    }
    id v9 = (void *)qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_10005C0BC(v9);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
  {
    sub_10005C050();
  }
  unsigned int v7 = 0;
LABEL_11:

  return v7;
}

- (id)encodeSYChangeForBackwardCompatibility:(id)a3 protocolVersion:(int64_t)a4
{
  return -[TCCDSyncController dataFromChange:](self, "dataFromChange:", a3, a4);
}

- (id)decodeChangeData:(id)a3 fromProtocolVersion:(int64_t)a4 ofType:(int64_t)a5
{
  return [(TCCDSyncController *)self changeFromData:a3 ofType:a5];
}

- (const)_syncTypeToString:(unsigned int)a3
{
  if (a3 > 2) {
    return "<Unknown TCCDSyncType>";
  }
  else {
    return off_1000955E0[a3];
  }
}

- (id)_syncStatusDescriptionString
{
  id v3 = objc_opt_new();
  [v3 appendFormat:@"Sync Status:\n"];
  BOOL v4 = "No";
  if ([(TCCDSyncController *)self isSyncingEnabled]) {
    id v5 = "Yes";
  }
  else {
    id v5 = "No";
  }
  objc_msgSend(v3, "appendFormat:", @"  syncing enabled: %s\n", v5);
  uint64_t v6 = [(TCCDSyncController *)self pairedDeviceStorageRoot];
  unsigned int v7 = (void *)v6;
  CFStringRef v8 = @"<not paired>";
  if (v6) {
    CFStringRef v8 = (const __CFString *)v6;
  }
  [v3 appendFormat:@"  paired storage root %@\n", v8];

  id v9 = [(TCCDSyncController *)self syncService];
  unsigned int v10 = [v9 targetIsInProximity];
  CFStringRef v11 = @"Not";
  if (v10) {
    CFStringRef v11 = @"In";
  }
  [v3 appendFormat:@"  proximity: %@\n", v11];

  id v12 = [(TCCDSyncController *)self _syncTypeToString:[(TCCDSyncController *)self pendingSyncType]];
  __int16 v13 = [(TCCDSyncController *)self pendingDeltaSyncChanges];
  id v14 = [v13 count];
  if ([(TCCDSyncController *)self batchDeltaChanges]) {
    unsigned int v15 = "Yes";
  }
  else {
    unsigned int v15 = "No";
  }
  [v3 appendFormat:@"  pendingSync -- type: %s, number of pendingDeltaSyncChanges: %lu, batching: %s\n", v12, v14, v15];

  id v16 = [(TCCDSyncController *)self syncService];
  id v17 = [v16 currentSession];
  if (v17)
  {
    v33 = [(TCCDSyncController *)self syncService];
    BOOL v4 = [v33 currentSession];
    unint64_t v18 = [v4 identifier];
  }
  else
  {
    unint64_t v18 = @"<None>";
  }
  id v19 = [(TCCDSyncController *)self sessionSyncChanges];
  id v20 = [v19 count];
  stat v21 = [(TCCDSyncController *)self sessionPendingConfirmationSyncChanges];
  [v3 appendFormat:@"  session -- currentSession: %@, sessionSyncChanges.count: %lu, sessionPendingConfirmationSyncChanges.count:  %lu, per-message timeout %llu secs.\n", v18, v20, objc_msgSend(v21, "count"), -[TCCDSyncController sessionPerMessageTimeoutSecs](self, "sessionPerMessageTimeoutSecs")];

  if (v17)
  {
  }
  unsigned int v22 = [(TCCDSyncController *)self sessionShouldCancelWhenActive];
  BOOL v23 = "No";
  if (v22) {
    BOOL v23 = "Yes";
  }
  objc_msgSend(v3, "appendFormat:", @"  session -- ShouldCancelWhenActive: %s\n", v23);
  unint64_t v24 = [(TCCDSyncController *)self retryCount];
  unint64_t v25 = [(TCCDSyncController *)self maxRetryCount];
  unint64_t v26 = [(TCCDSyncController *)self retryIntervalSecs];
  long long v27 = [(TCCDSyncController *)self retryBlock];
  id v28 = objc_retainBlock(v27);
  [v3 appendFormat:@"  retry -- current count: %llu, max count: %llu, interval: %llu secs, retryBlock: %p\n", v24, v25, v26, v28];

  long long v29 = [(TCCDSyncController *)self syncTransaction];
  id v30 = "Acquired";
  if (!v29) {
    id v30 = "None";
  }
  objc_msgSend(v3, "appendFormat:", @"  transaction -- %s\n", v30);

  id v31 = [v3 copy];
  return v31;
}

- (void)testSyncStatus
{
  id v3 = [(TCCDSyncController *)self syncControllerQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000200F4;
  v4[3] = &unk_100094E78;
  v4[4] = self;
  sub_100019AAC(v3, self, v4);
}

- (void)testSyncSet:(id)a3
{
  id v4 = a3;
  id v5 = [(TCCDSyncController *)self syncControllerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100020298;
  v7[3] = &unk_100094FE0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  sub_100019A24(v5, self, v7);
}

- (void)testMemoryPressureCritical
{
  id v3 = [(TCCDSyncController *)self syncControllerQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000206CC;
  v4[3] = &unk_100094E78;
  v4[4] = self;
  sub_100019AAC(v3, self, v4);
}

- (BOOL)peerSupportsService:(id)a3 authVersion:(unint64_t)a4
{
  unsigned int v6 = [a3 isEqualToString:@"kTCCServiceCalendar"];
  if (a4 != 2 || !v6) {
    return 1;
  }
  unsigned int v7 = [(TCCDSyncController *)self pairedDevice];
  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E7B1CD81-445C-4840-9F24-3A32B510B6A1"];
  unsigned __int8 v9 = [v7 supportsCapability:v8];

  return v9;
}

- (TCCDMessageController)messageController
{
  return (TCCDMessageController *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isMain
{
  return self->_isMain;
}

- (void)setIsMain:(BOOL)a3
{
  self->_isMain = a3;
}

- (Class)syServiceClass
{
  return (Class)objc_getProperty(self, a2, 32, 1);
}

- (void)setSyServiceClass:(Class)a3
{
}

- (Class)nrPairedDeviceRegisteryClass
{
  return (Class)objc_getProperty(self, a2, 40, 1);
}

- (void)setNrPairedDeviceRegisteryClass:(Class)a3
{
}

- (unint64_t)stateHandler
{
  return self->_stateHandler;
}

- (void)setStateHandler:(unint64_t)a3
{
  self->_stateHandler = a3;
}

- (NRDevice)pairedDevice
{
  return (NRDevice *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPairedDevice:(id)a3
{
}

- (NSString)pairedDeviceStorageRoot
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPairedDeviceStorageRoot:(id)a3
{
}

- (SYService)syncService
{
  return (SYService *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSyncService:(id)a3
{
}

- (NSMapTable)syncSessionsHandlers
{
  return (NSMapTable *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSyncSessionsHandlers:(id)a3
{
}

- (OS_dispatch_queue)syncSessionsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSyncSessionsQueue:(id)a3
{
}

- (OS_dispatch_queue)syncControllerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSyncControllerQueue:(id)a3
{
}

- (BOOL)hostDeviceUnlocked
{
  return self->_hostDeviceUnlocked;
}

- (void)setHostDeviceUnlocked:(BOOL)a3
{
  self->_hostDeviceUnlocked = a3;
}

- (BOOL)batchDeltaChanges
{
  return self->_batchDeltaChanges;
}

- (void)setBatchDeltaChanges:(BOOL)a3
{
  self->_batchDeltaChanges = a3;
}

- (unsigned)pendingSyncType
{
  return self->_pendingSyncType;
}

- (void)setPendingSyncType:(unsigned int)a3
{
  self->_pendingSyncType = a3;
}

- (NSMutableArray)pendingDeltaSyncChanges
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPendingDeltaSyncChanges:(id)a3
{
}

- (NSMutableArray)sessionSyncChanges
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSessionSyncChanges:(id)a3
{
}

- (NSMutableArray)sessionPendingConfirmationSyncChanges
{
  return (NSMutableArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSessionPendingConfirmationSyncChanges:(id)a3
{
}

- (unint64_t)sessionPerMessageTimeoutSecs
{
  return self->_sessionPerMessageTimeoutSecs;
}

- (void)setSessionPerMessageTimeoutSecs:(unint64_t)a3
{
  self->_sessionPerMessageTimeoutSecs = a3;
}

- (BOOL)sessionShouldCancelWhenActive
{
  return self->_sessionShouldCancelWhenActive;
}

- (void)setSessionShouldCancelWhenActive:(BOOL)a3
{
  self->_sessionShouldCancelWhenActive = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (unint64_t)maxRetryCount
{
  return self->_maxRetryCount;
}

- (void)setMaxRetryCount:(unint64_t)a3
{
  self->_maxRetryCount = a3;
}

- (id)retryBlock
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setRetryBlock:(id)a3
{
}

- (unint64_t)retryIntervalSecs
{
  return self->_retryIntervalSecs;
}

- (void)setRetryIntervalSecs:(unint64_t)a3
{
  self->_retryIntervalSecs = a3;
}

- (BOOL)retryTestMaxRetry
{
  return self->_retryTestMaxRetry;
}

- (void)setRetryTestMaxRetry:(BOOL)a3
{
  self->_retryTestMaxRetry = a3;
}

- (unint64_t)eventRetryIntervalSecs
{
  return self->_eventRetryIntervalSecs;
}

- (void)setEventRetryIntervalSecs:(unint64_t)a3
{
  self->_eventRetryIntervalSecs = a3;
}

- (id)eventRetryBlock
{
  return objc_getProperty(self, a2, 176, 1);
}

- (void)setEventRetryBlock:(id)a3
{
}

- (OS_os_transaction)syncTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 184, 1);
}

- (void)setSyncTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncTransaction, 0);
  objc_storeStrong(&self->_eventRetryBlock, 0);
  objc_storeStrong(&self->_retryBlock, 0);
  objc_storeStrong((id *)&self->_sessionPendingConfirmationSyncChanges, 0);
  objc_storeStrong((id *)&self->_sessionSyncChanges, 0);
  objc_storeStrong((id *)&self->_pendingDeltaSyncChanges, 0);
  objc_storeStrong((id *)&self->_syncControllerQueue, 0);
  objc_storeStrong((id *)&self->_syncSessionsQueue, 0);
  objc_storeStrong((id *)&self->_syncSessionsHandlers, 0);
  objc_storeStrong((id *)&self->_syncService, 0);
  objc_storeStrong((id *)&self->_pairedDeviceStorageRoot, 0);
  objc_storeStrong((id *)&self->_pairedDevice, 0);
  objc_storeStrong((id *)&self->_nrPairedDeviceRegisteryClass, 0);
  objc_storeStrong((id *)&self->_syServiceClass, 0);
  objc_storeStrong((id *)&self->_messageController, 0);
}

@end