@interface ABSyncInterface
+ (ABSyncInterface)sharedInstance;
+ (id)activeDevice;
- (ABSLasordaSession)syncSession;
- (ABSProgressReporter)preemptedSessionProgressReporter;
- (ABSSyncController)syncController;
- (ABSTestControl)statusReporter;
- (ABSyncInterface)init;
- (BOOL)_shouldFakeFailure;
- (BOOL)_shouldReallySendDeltaSessionWithAnchor:(id)a3 store:(id)a4;
- (BOOL)_startSendSession:(id)a3;
- (BOOL)automaticSync;
- (BOOL)externalChangesGoingOn;
- (BOOL)isCurrentlySyncing;
- (BOOL)mustBeReset;
- (BOOL)needsDeltaSync;
- (BOOL)oldDatabaseDelete;
- (BOOL)oldDatabaseExists;
- (BOOL)partialResetSyncOnPairingFeatureEnabled;
- (BOOL)partialSyncEligible;
- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5;
- (BOOL)shouldNextResetSyncBePartial;
- (BOOL)shouldResetSyncBePartial;
- (BOOL)shouldUseBackgroundPriority;
- (BOOL)watchSupportsPartialSyncs;
- (NDTServerState)serverState;
- (NDTSignalCoalescer)signalCoalescer;
- (NSString)watchBuildVersion;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)sessionIdleQueue;
- (OS_dispatch_queue)unlockQueue;
- (OS_dispatch_source)syncTimer;
- (OS_dispatch_source)unlockTimer;
- (PSYServiceSyncSession)psySyncSession;
- (PSYSyncCoordinator)psySyncCoordinator;
- (SYService)syncService;
- (SYSession)sySession;
- (char)activityIdentifier:(id)a3;
- (char)activitySubsystem:(id)a3;
- (double)_nextDelay:(int64_t)a3;
- (double)deltaRateEstimate;
- (double)fullRateEstimate;
- (double)messageTimeout;
- (double)objectDelay;
- (double)sessionTimeout;
- (id)_fetchAnchor;
- (id)_newFileName;
- (id)newFileName:(id)a3;
- (id)service:(id)a3 willPreferSession:(id)a4 overSession:(id)a5;
- (int64_t)objectCount;
- (void)_checkServerStateOnStartup;
- (void)_enableDisableLogging;
- (void)_initSyncStore;
- (void)_migrationCheck;
- (void)_recvSessionEnded:(id)a3 error:(id)a4;
- (void)_requestFullSync:(id)a3;
- (void)_saveAnchor:(id)a3;
- (void)_saveGuardianRestrictionBit;
- (void)_scheduleRetrySync;
- (void)_sendSessionEnded:(id)a3 error:(id)a4;
- (void)_setupLogging;
- (void)_startRecvSession:(id)a3;
- (void)activity:(id)a3 customizeCriteria:(id)a4;
- (void)activityRun:(id)a3;
- (void)dealloc;
- (void)registerForAddressBookDarwinNotifications;
- (void)requestFullSync:(id)a3;
- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5;
- (void)setDeltaRateEstimate:(double)a3;
- (void)setExternalChangesGoingOn:(BOOL)a3;
- (void)setFullRateEstimate:(double)a3;
- (void)setMustBeReset:(BOOL)a3;
- (void)setNeedsDeltaSync:(BOOL)a3;
- (void)setObjectCount:(int64_t)a3;
- (void)setPreemptedSessionProgressReporter:(id)a3;
- (void)setPsySyncCoordinator:(id)a3;
- (void)setPsySyncSession:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServerState:(id)a3;
- (void)setSessionIdleQueue:(id)a3;
- (void)setShouldResetSyncBePartial:(BOOL)a3;
- (void)setSignalCoalescer:(id)a3;
- (void)setStatusReporter:(id)a3;
- (void)setSySession:(id)a3;
- (void)setSyncController:(id)a3;
- (void)setSyncService:(id)a3;
- (void)setSyncSession:(id)a3;
- (void)setSyncTimer:(id)a3;
- (void)setUnlockQueue:(id)a3;
- (void)setUnlockTimer:(id)a3;
- (void)setWatchBuildVersion:(id)a3;
- (void)startUnlockTimer:(double)a3;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3;
- (void)tc_advanceChangeNumber;
- (void)tc_requestDelta;
- (void)tc_requestReset;
- (void)tc_setAutomaticSync:(BOOL)a3;
- (void)tc_setFailureProbablity:(double)a3;
- (void)tc_setFixedRetryInternal:(double)a3;
- (void)tc_setMessageTimeout:(double)a3;
- (void)tc_setNominal;
- (void)tc_setObjectDelay:(double)a3;
- (void)tc_setSessionTimeout:(double)a3;
- (void)tc_status:(id)a3;
- (void)watchUpdated:(id)a3;
@end

@implementation ABSyncInterface

+ (ABSyncInterface)sharedInstance
{
  if (qword_100069D68 != -1) {
    dispatch_once(&qword_100069D68, &stru_1000558C0);
  }
  v2 = (void *)qword_100069D60;

  return (ABSyncInterface *)v2;
}

- (ABSyncInterface)init
{
  v38.receiver = self;
  v38.super_class = (Class)ABSyncInterface;
  id v2 = [(ABSyncInterface *)&v38 init];
  [v2 _setupLogging];
  if (v2)
  {
    objc_storeStrong((id *)&qword_100069D60, v2);
    *((unsigned char *)v2 + 36) = 0;
    uint64_t v3 = +[PSYSyncCoordinator syncCoordinatorWithServiceName:@"com.apple.pairedsync.addressbooksyncd"];
    v4 = (void *)*((void *)v2 + 20);
    *((void *)v2 + 20) = v3;

    [*((id *)v2 + 20) setDelegate:v2];
    uint64_t v5 = sub_100028AC4("com.apple.addressbook.sync.queue");
    v6 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v5;

    uint64_t v7 = sub_100028AC4("com.apple.addressbook.sync.unlockqueue");
    v8 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v7;

    uint64_t v9 = sub_100028AC4("com.apple.addressbook.sync.session.idle");
    v10 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v9;

    dispatch_activate(*((dispatch_object_t *)v2 + 12));
    v11 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "== Started AddressBookSync-283.3", buf, 2u);
    }
    v12 = +[ABSDatabaseFileManager pairingID];
    v13 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v40 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Pairing ID: %{public}@", buf, 0xCu);
    }
    v14 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Class C block", buf, 2u);
    }
    [v2 _blockUntilUnlock];
    v15 = [NDTSignalCoalescer alloc];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100032094;
    v36[3] = &unk_100054DD0;
    v16 = (id *)v2;
    v37 = v16;
    v17 = [(NDTSignalCoalescer *)v15 initWithLeadingEdgeDelay:&stru_1000558E0 nextDelay:v36 action:2.0];
    id v18 = v16[19];
    v16[19] = v17;

    [v16[19] setHoldTransaction:1];
    v19 = [NDTServerState alloc];
    v20 = +[ABSDatabaseFileManager syncStateDBPathFor:@"ServerState.plist"];
    v21 = [(NDTServerState *)v19 initWithPath:v20];
    id v22 = v16[6];
    v16[6] = v21;

    [v16 _initSyncStore];
    if (v16[5])
    {
      id v23 = v16[7];
      v16[7] = 0;

      id v24 = v16[9];
      v16[9] = 0;

      v16[13] = (id)-1;
      *((unsigned char *)v16 + 33) = 0;
      [v16[6] getDoubleValueForKey:@"deltaRate" default:5.0];
      v16[16] = v25;
      [v16[6] getDoubleValueForKey:@"fullRate" default:5.0];
      v16[17] = v26;
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v16, (CFNotificationCallback)sub_100032190, @"ABSyncClientBeginningMultiSave", 0, (CFNotificationSuspensionBehavior)0);
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v16, (CFNotificationCallback)sub_1000322C8, @"ABSyncClientFinishedMultiSave", 0, (CFNotificationSuspensionBehavior)0);
      v28 = +[NSNotificationCenter defaultCenter];
      [v28 addObserver:v16 selector:"watchUpdated:" name:SYDeviceOSInfoChangedNotification object:0];

      if ([v16 oldDatabaseExists])
      {
        v29 = *(NSObject **)(qword_100069D78 + 8);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Old database file found. Triggering full sync.", buf, 2u);
        }
        [v16 requestFullSync:@"Old database found"];
      }
    }
    [v16 registerForAddressBookDarwinNotifications];
    v30 = [[ABSTestControl alloc] initWithSyncInterface:v16];
    id v31 = v16[23];
    v16[23] = v30;

    v32 = [[NDTActivity alloc] initWithDelegate:v16];
    id v33 = v16[3];
    v16[3] = v32;

    v34 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "ABSyncInterface, init completed", buf, 2u);
    }
    [v16 _checkServerStateOnStartup];
  }
  return (ABSyncInterface *)v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"ABSyncClientBeginningMultiSave", 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"ABSyncClientFinishedMultiSave", 0);
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)ABSyncInterface;
  [(ABSyncInterface *)&v5 dealloc];
}

- (void)_initSyncStore
{
  double Current = CFAbsoluteTimeGetCurrent();
  v21[0] = SYServiceOptionDiskBufferProtectionClass;
  v21[1] = IDSSendMessageOptionBypassDuetKey;
  v22[0] = &off_100059BC0;
  v22[1] = &__kCFBooleanTrue;
  v4 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  objc_super v5 = (SYService *)[objc_alloc((Class)SYService) initWithService:@"com.apple.private.alloy.addressbooksync" priority:0 qos:17 asMasterStore:1 options:v4];
  syncService = self->_syncService;
  self->_syncService = v5;

  [(SYService *)self->_syncService setSendingBufferCap:0x40000];
  uint64_t v7 = self->_syncService;
  uint64_t v8 = [(ABSyncInterface *)self queue];
  [(SYService *)v7 setDelegate:self queue:v8];

  uint64_t v9 = self->_syncService;
  id v18 = 0;
  LOBYTE(v8) = [(SYService *)v9 resume:&v18];
  id v10 = v18;
  if ((v8 & 1) == 0)
  {
    v11 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100038AC4((uint64_t)v10, v11);
    }
    v12 = self->_syncService;
    self->_syncService = 0;
  }
  double v13 = CFAbsoluteTimeGetCurrent();
  v14 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v20 = v13 - Current;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CS Startup time: %f", buf, 0xCu);
  }
  v15 = +[SYDevice targetableDevice];
  v16 = [v15 systemBuildVersion];
  id v17 = [v16 copy];
  [(ABSyncInterface *)self setWatchBuildVersion:v17];
}

- (BOOL)partialSyncEligible
{
  unsigned __int8 v3 = [(ABSyncInterface *)self partialResetSyncOnPairingFeatureEnabled];
  unsigned __int8 v4 = [(ABSyncInterface *)self watchSupportsPartialSyncs];
  objc_super v5 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    int v8 = 136315650;
    uint64_t v9 = "-[ABSyncInterface partialSyncEligible]";
    __int16 v10 = 1024;
    unsigned int v11 = [(ABSyncInterface *)self partialResetSyncOnPairingFeatureEnabled];
    __int16 v12 = 1024;
    unsigned int v13 = [(ABSyncInterface *)self watchSupportsPartialSyncs];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s ffEnabled=%d watchSupportsPartialSync=%d", (uint8_t *)&v8, 0x18u);
  }
  return v3 & v4;
}

- (BOOL)shouldNextResetSyncBePartial
{
  unsigned __int8 v3 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v4 = v3;
    unsigned int v5 = [(ABSyncInterface *)self mustBeReset];
    unsigned int v6 = [(NDTServerState *)self->_serverState getBoolValueForKey:@"MustBePartialReset" default:1];
    int v8 = 136315650;
    uint64_t v9 = "-[ABSyncInterface shouldNextResetSyncBePartial]";
    __int16 v10 = 1024;
    unsigned int v11 = v5;
    __int16 v12 = 1024;
    unsigned int v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s mustBeReset=%d mustBePartialReset=%d", (uint8_t *)&v8, 0x18u);
  }
  if ([(ABSyncInterface *)self mustBeReset]) {
    return 0;
  }
  else {
    return [(NDTServerState *)self->_serverState getBoolValueForKey:@"MustBePartialReset" default:1];
  }
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136446722;
    unsigned int v13 = "ABSyncInterface.m";
    __int16 v14 = 1024;
    int v15 = 350;
    __int16 v16 = 2080;
    id v17 = "-[ABSyncInterface syncCoordinator:beginSyncSession:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s:%d %s --mark--", (uint8_t *)&v12, 0x1Cu);
  }
  [(ABSyncInterface *)self setPsySyncSession:v7];
  kdebug_trace();
  if ([v7 syncSessionType])
  {
    if ([v7 syncSessionType] == (id)1)
    {
      uint64_t v9 = *(NSObject **)(qword_100069D78 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Paired sync coordinator wants a delta sync.", (uint8_t *)&v12, 2u);
      }
      __int16 v10 = [(ABSyncInterface *)self syncService];
      [v10 setHasChangesAvailable];

      [v7 syncDidComplete];
    }
  }
  else
  {
    unsigned int v11 = +[ABSyncInterface sharedInstance];
    [v11 requestFullSync:@"Paired sync coordinator commanded it."];
  }
}

- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3
{
  id v3 = [a3 syncRestriction];
  if (v3 == (id)1)
  {
    unsigned int v5 = *(NSObject **)(qword_100069D78 + 8);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v10[0]) = 0;
    id v6 = "Paired sync restriction is now Limit Push";
    goto LABEL_7;
  }
  int v4 = (int)v3;
  if (!v3)
  {
    unsigned int v5 = *(NSObject **)(qword_100069D78 + 8);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v10[0]) = 0;
    id v6 = "Paired sync restriction is now None";
LABEL_7:
    id v7 = v5;
    uint32_t v8 = 2;
    goto LABEL_10;
  }
  uint64_t v9 = *(NSObject **)(qword_100069D78 + 8);
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    return;
  }
  v10[0] = 67109120;
  v10[1] = v4;
  id v6 = "Paired sync restriction is unknown value: %d";
  id v7 = v9;
  uint32_t v8 = 8;
LABEL_10:
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)v10, v8);
}

- (void)registerForAddressBookDarwinNotifications
{
  id v3 = [(ABSyncInterface *)self queue];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100032F4C;
  handler[3] = &unk_100055930;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v3, handler);

  int v4 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v7 = "ABSyncInterface.m";
    __int16 v8 = 1024;
    int v9 = 429;
    __int16 v10 = 2080;
    unsigned int v11 = "-[ABSyncInterface registerForAddressBookDarwinNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%d %s --mark--", buf, 0x1Cu);
  }
}

- (char)activitySubsystem:(id)a3
{
  return "com.apple.addressbooksync";
}

- (char)activityIdentifier:(id)a3
{
  return "com.apple.addressbooksync.sync.retry";
}

- (void)activity:(id)a3 customizeCriteria:(id)a4
{
  serverState = self->_serverState;
  xpc_object_t xdict = a4;
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_ALLOW_BATTERY, [(NDTServerState *)serverState getIntegerValueForKey:@"failureCount" default:0] < 4);
}

- (void)activityRun:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)os_transaction_create();
  id v6 = [(ABSyncInterface *)self sessionIdleQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033350;
  block[3] = &unk_1000550E0;
  block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

- (void)_scheduleRetrySync
{
  uint64_t v3 = [(NDTServerState *)self->_serverState getIntegerValueForKey:@"failureCount" default:0];
  if (v3 < 1)
  {
    id v8 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_scheduleRetrySync doesn't see any failures. Not rescheduling.", (uint8_t *)v10, 2u);
    }
  }
  else
  {
    uint64_t v4 = v3;
    if ([(SYService *)self->_syncService targetIsConnected])
    {
      [(ABSyncInterface *)self _nextDelay:v4];
      uint64_t v6 = (uint64_t)(v5 + 0.5);
      id v7 = *(NSObject **)(qword_100069D78 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109120;
        v10[1] = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_scheduleRetrySync is scheduling retry in %d seconds.", (uint8_t *)v10, 8u);
      }
      [(NDTActivity *)self->_activity completeAndFireIn:v6];
    }
    else
    {
      int v9 = *(NSObject **)(qword_100069D78 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_scheduleRetrySync is requesting retry on connection", (uint8_t *)v10, 2u);
      }
      [(NDTActivity *)self->_activity completeAndFireOnConnection];
    }
  }
}

- (BOOL)_shouldFakeFailure
{
  if (!+[NDTLog isInternalDevice]) {
    return 0;
  }
  id v2 = (void *)CFPreferencesCopyAppValue(@"internal_probabilityOfSyncFailure", @"com.apple.addressbooksync");
  uint64_t v3 = v2;
  BOOL v7 = 0;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
    uint32_t v6 = arc4random();
    if (scalbn((double)v6, -32) < v5) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (double)_nextDelay:(int64_t)a3
{
  [(NDTServerState *)self->_serverState getDoubleValueForKey:@"tc_fixedRetryInterval" default:-1.0];
  if (result < 0.0)
  {
    int64_t v5 = 4;
    if (a3 < 4) {
      int64_t v5 = a3;
    }
    return (double)*(int *)((char *)&unk_100044728 + (((v5 << 32) - 0x100000000) >> 30));
  }
  return result;
}

- (void)_checkServerStateOnStartup
{
  uint64_t v3 = (void *)os_transaction_create();
  double v4 = [(ABSyncInterface *)self sessionIdleQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003386C;
  v6[3] = &unk_100054FA8;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

- (void)startUnlockTimer:(double)a3
{
  id v5 = [(ABSyncInterface *)self unlockQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000339A8;
  v6[3] = &unk_100055958;
  v6[4] = self;
  *(double *)&void v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)_migrationCheck
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(ABSyncInterface *)self sessionIdleQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100033C48;
  v4[3] = &unk_100054E20;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)tc_status:(id)a3
{
  double v4 = (void (**)(id, id))a3;
  id v18 = (id)objc_opt_new();
  [(NDTServerState *)self->_serverState getDoubleValueForKey:@"tc_fixedRetryInterval" default:-1.0];
  uint64_t v6 = v5;
  id v7 = (void *)CFPreferencesCopyAppValue(@"internal_probabilityOfSyncFailure", @"com.apple.addressbooksync");
  id v8 = v7;
  if (v7)
  {
    [v7 doubleValue];
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = 0;
  }
  unsigned int v11 = [(ABSyncInterface *)self automaticSync];
  [(ABSyncInterface *)self sessionTimeout];
  uint64_t v13 = v12;
  [(ABSyncInterface *)self messageTimeout];
  uint64_t v15 = v14;
  [(ABSyncInterface *)self objectDelay];
  uint64_t v17 = v16;
  [v18 appendFormat:@"Fixed retry interval: %.3f\n", v6];
  [v18 appendFormat:@"Failure probability: %.3f\n", v10];
  [v18 appendFormat:@"Automatic sync: %d\n", v11];
  [v18 appendFormat:@"Session timeout: %.3f\n", v13];
  [v18 appendFormat:@"Message timeout: %.3f\n", v15];
  [v18 appendFormat:@"Object delay: %.3f\n", v17];
  v4[2](v4, v18);
}

- (void)tc_setNominal
{
  [(NDTServerState *)self->_serverState deleteKey:@"tc_fixedRetryInterval"];
  CFPreferencesSetAppValue(@"internal_probabilityOfSyncFailure", 0, @"com.apple.addressbooksync");
  [(NDTServerState *)self->_serverState setIntegerValue:1 forKey:@"tc_automaticSync"];
  [(ABSyncInterface *)self tc_setSessionTimeout:-1.0];
  [(ABSyncInterface *)self tc_setMessageTimeout:-1.0];

  [(ABSyncInterface *)self tc_setObjectDelay:0.0];
}

- (void)tc_setAutomaticSync:(BOOL)a3
{
}

- (void)tc_advanceChangeNumber
{
  uint64_t v3 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Advancing change number", v6, 2u);
  }
  id v4 = objc_alloc_init((Class)CNContactStore);
  uint64_t v5 = [v4 currentHistoryToken];
  [(ABSyncInterface *)self _saveAnchor:v5];
}

- (void)tc_setObjectDelay:(double)a3
{
}

- (void)tc_requestDelta
{
}

- (void)tc_requestReset
{
}

- (void)tc_setSessionTimeout:(double)a3
{
  if (a3 < 0.0) {
    a3 = 10800.0;
  }
  [(NDTServerState *)self->_serverState setDoubleValue:@"tc_sessionTimeout" forKey:a3];
}

- (void)tc_setMessageTimeout:(double)a3
{
  if (a3 < 0.0) {
    a3 = 1500.0;
  }
  [(NDTServerState *)self->_serverState setDoubleValue:@"tc_messageTimeout" forKey:a3];
}

- (void)tc_setFailureProbablity:(double)a3
{
  double valuePtr = a3;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  CFPreferencesSetAppValue(@"internal_probabilityOfSyncFailure", v3, @"com.apple.addressbooksync");
  CFRelease(v3);
}

- (void)tc_setFixedRetryInternal:(double)a3
{
}

- (BOOL)automaticSync
{
  return [(NDTServerState *)self->_serverState getIntegerValueForKey:@"tc_automaticSync" default:1] != 0;
}

- (double)sessionTimeout
{
  [(NDTServerState *)self->_serverState getDoubleValueForKey:@"tc_sessionTimeout" default:10800.0];
  return result;
}

- (double)messageTimeout
{
  [(NDTServerState *)self->_serverState getDoubleValueForKey:@"tc_messageTimeout" default:1500.0];
  return result;
}

- (double)objectDelay
{
  [(NDTServerState *)self->_serverState getDoubleValueForKey:@"tc_objectDelay" default:0.0];
  return result;
}

- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v9;
    unsigned int v11 = [v8 valueForKey:@"identifier"];
    if ([v8 isSending]) {
      CFStringRef v12 = @"sending";
    }
    else {
      CFStringRef v12 = @"receiving";
    }
    unsigned int v13 = [v8 isResetSync];
    CFStringRef v14 = @"delta";
    *(_DWORD *)buf = 136446978;
    v39 = "-[ABSyncInterface service:startSession:error:]";
    __int16 v40 = 2114;
    v41 = v11;
    if (v13) {
      CFStringRef v14 = @"reset";
    }
    __int16 v42 = 2114;
    CFStringRef v43 = v12;
    __int16 v44 = 2114;
    CFStringRef v45 = v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@ #%{public}@ #%{public}@", buf, 0x2Au);
  }
  if (!-[NDTServerState getBoolValueForKey:default:](self->_serverState, "getBoolValueForKey:default:", @"RetryMustBeReset", 0)|| ([v8 isResetSync] & 1) != 0)
  {
    [(ABSyncInterface *)self sessionIdleQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000345FC;
    block[3] = &unk_100054DD0;
    uint64_t v15 = (id)objc_claimAutoreleasedReturnValue();
    v37 = v15;
    dispatch_barrier_sync(v15, block);
    uint64_t v16 = objc_alloc_init(ABSLasordaSession);
    [(ABSyncInterface *)self setSyncSession:v16];

    [(ABSyncInterface *)self objectDelay];
    unint64_t v18 = (unint64_t)(v17 * 1000000.0);
    v19 = [(ABSyncInterface *)self syncSession];
    [v19 setDelayUs:v18];

    [(ABSyncInterface *)self setSySession:v8];
    Boolean keyExistsAndHasValidFormat = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"internal_abortAfter", @"com.apple.addressbooksync", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      CFIndex v21 = AppIntegerValue;
      if (AppIntegerValue >= 1)
      {
        if (+[NDTLog isInternalDevice])
        {
          CFPreferencesSetAppValue(@"internal_abortAfter", 0, @"com.apple.addressbooksync");
          id v22 = [(ABSyncInterface *)self syncSession];
          [v22 setAbortAfter:v21];
        }
      }
    }
    id v23 = [(ABSyncInterface *)self syncController];
    id v24 = [(ABSyncInterface *)self syncSession];
    [v24 setSyncController:v23];

    double Current = CFAbsoluteTimeGetCurrent();
    v26 = [(ABSyncInterface *)self syncSession];
    [v26 setStart:Current];

    [v8 setMaxConcurrentMessages:2];
    [(ABSyncInterface *)self sessionTimeout];
    [v8 setFullSessionTimeout:];
    [(ABSyncInterface *)self messageTimeout];
    [v8 setPerMessageTimeout:];
    v27 = [(ABSyncInterface *)self syncSession];
    [v8 setDelegate:v27];

    v28 = objc_opt_new();
    [v8 setSerializer:v28];

    [v8 setCanRestart:0];
    [v8 setCanRollback:0];
    if ([v8 isSending])
    {
      if (![(ABSyncInterface *)self _startSendSession:v8])
      {
        [(ABSyncInterface *)self setSyncSession:0];
        [(ABSyncInterface *)self setSySession:0];
        dispatch_resume(v15);
        [(NDTActivity *)self->_activity completeAndFireNever];
        BOOL v29 = 0;
LABEL_21:

        goto LABEL_25;
      }
    }
    else
    {
      [(ABSyncInterface *)self _startRecvSession:v8];
    }
    v30 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = v30;
      unsigned int v32 = [v8 protocolVersion];
      *(_DWORD *)buf = 67109120;
      LODWORD(v39) = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Session protocol version: %d", buf, 8u);
    }
    kdebug_trace();
    BOOL v29 = 1;
    goto LABEL_21;
  }
  id v33 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Rejecting delta sync request as we need a reset sync.", buf, 2u);
  }
  [(ABSyncInterface *)self requestFullSync:@"Reset recovery sync"];
  BOOL v29 = 0;
LABEL_25:

  return v29;
}

- (BOOL)shouldUseBackgroundPriority
{
  return __os_feature_enabled_impl("ContactSync", "backgroundPriorityForResetSyncs");
}

- (BOOL)partialResetSyncOnPairingFeatureEnabled
{
  return __os_feature_enabled_impl("ContactSync", "partialResetSyncOnPairing");
}

+ (id)activeDevice
{
  id v2 = +[NRPairedDeviceRegistry sharedInstance];
  CFNumberRef v3 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
  id v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  uint64_t v5 = [v4 firstObject];

  return v5;
}

- (BOOL)watchSupportsPartialSyncs
{
  id v2 = [(id)objc_opt_class() activeDevice];
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"B727AD95-5778-41B6-A9DB-05E7289820ED"];
  unsigned __int8 v4 = [v2 supportsCapability:v3];

  return v4;
}

- (BOOL)_startSendSession:(id)a3
{
  id v4 = a3;
  activity = self->_activity;
  uint64_t v6 = [(ABSyncInterface *)self syncSession];
  [v6 setActivity:activity];

  id v7 = [(ABSyncInterface *)self _fetchAnchor];
  id v8 = objc_alloc_init((Class)CNContactStore);
  if ([v4 isResetSync])
  {
    if ([(ABSyncInterface *)self shouldUseBackgroundPriority]) {
      uint64_t v9 = -20;
    }
    else {
      uint64_t v9 = 0;
    }
    [v4 setPriority:v9];
    uint64_t v10 = [ABSContactsResetSource alloc];
    unsigned int v11 = sub_100018E28();
    CFStringRef v12 = [(ABSContactsResetSource *)v10 initWithKeys:v11 store:v8];

    id v49 = 0;
    unsigned int v13 = [v8 unifiedContactCountWithError:&v49];
    id v14 = v49;
    uint64_t v15 = (uint64_t)[v13 integerValue];

    if ([(ABSyncInterface *)self partialSyncEligible])
    {
      unsigned int v16 = [(ABSyncInterface *)self shouldNextResetSyncBePartial];
      if (v15 > 1000) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = 0;
      }
    }
    else
    {
      uint64_t v17 = 0;
    }
    [(ABSyncInterface *)self setShouldResetSyncBePartial:v17];
    [(NDTServerState *)self->_serverState setBoolValue:1 forKey:@"RetryMustBeReset"];

    [(ABSContactsResetSource *)v12 setShouldRunPartialResetSync:[(ABSyncInterface *)self shouldResetSyncBePartial]];
    id v24 = [(ABSyncInterface *)self syncSession];
    [v24 setContactsSource:v12];

    id v7 = 0;
  }
  else
  {
    if (![(ABSyncInterface *)self _shouldReallySendDeltaSessionWithAnchor:v7 store:v8])
    {
      v37 = *(NSObject **)(qword_100069D78 + 8);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Delta sync effort suppressed, no relevent changes", buf, 2u);
      }
      goto LABEL_29;
    }
    unint64_t v18 = [ABSContactsDeltaSource alloc];
    v19 = sub_100018E28();
    double v20 = [(ABSContactsDeltaSource *)v18 initWithAnchor:v7 keys:v19 store:v8];
    CFIndex v21 = [(ABSyncInterface *)self syncSession];
    [v21 setContactsSource:v20];

    id v22 = [(ABSyncInterface *)self syncSession];
    id v23 = [v22 contactsSource];

    if (!v23)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR)) {
        sub_100038B70();
      }
      goto LABEL_29;
    }
  }
  v25 = [(ABSyncInterface *)self syncSession];
  v26 = [v25 contactsSource];
  if ([v26 isReset])
  {
    unsigned __int8 v27 = [v4 isResetSync];

    if ((v27 & 1) == 0)
    {
      [(NDTServerState *)self->_serverState setBoolValue:1 forKey:@"RetryMustBeReset"];
      v28 = *(NSObject **)(qword_100069D78 + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Rejecting delta sync request as we need a reset sync (truncation?)", buf, 2u);
      }
      [(ABSyncInterface *)self requestFullSync:@"Reset recovery sync due to truncation"];
LABEL_29:
      BOOL v38 = 0;
      goto LABEL_34;
    }
  }
  else
  {
  }
  [(NDTServerState *)self->_serverState setIntegerValue:(char *)[(NDTServerState *)self->_serverState getIntegerValueForKey:@"failureCount" default:0]+ 1 forKey:@"failureCount"];
  BOOL v29 = +[ABSContactsShadow instance];
  [v29 beginTransaction];

  if ([v4 isResetSync])
  {
    v30 = [(ABSyncInterface *)self syncController];
    [v30 resetSyncState];
  }
  id v31 = [(ABSyncInterface *)self preemptedSessionProgressReporter];

  if (v31)
  {
    unsigned int v32 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Using preempted session", buf, 2u);
    }
    id v33 = [(ABSyncInterface *)self preemptedSessionProgressReporter];
    v34 = [(ABSyncInterface *)self syncSession];
    [v34 setProgressReporter:v33];

    v35 = [(ABSyncInterface *)self syncSession];
    v36 = [v35 progressReporter];
    [v36 resume];

    [(ABSyncInterface *)self setPreemptedSessionProgressReporter:0];
  }
  else
  {
    v39 = [ABSProgressTestifier alloc];
    __int16 v40 = [(ABSyncInterface *)self psySyncSession];
    v41 = [(ABSProgressReporter *)v39 initWithSession:v40];

    __int16 v42 = [(ABSyncInterface *)self syncSession];
    [v42 setProgressReporter:v41];
  }
  CFStringRef v43 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v44 = v43;
    [v4 fullSessionTimeout];
    *(_DWORD *)buf = 134217984;
    uint64_t v54 = v45;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Session timeout: %f", buf, 0xCu);
  }
  v51 = off_100069A08;
  v50 = off_100069A18;
  BOOL v38 = 1;
  v46 = +[NSArray arrayWithObjects:&v50 count:1];
  v52 = v46;
  v47 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
  [v4 setSessionMetadata:v47];

LABEL_34:
  return v38;
}

- (void)_startRecvSession:(id)a3
{
  id v3 = a3;
  id v4 = +[ABSContactsInterface sharedInstance];
  [v4 sendMultisaveBegin];

  id v5 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  uint64_t v6 = [v3 sessionMetadata];
  id v7 = [v6 objectForKeyedSubscript:off_100069A08];
  unsigned int v8 = [v7 containsObject:off_100069A18];

  if (v8)
  {
    [v5 setObject:off_100069A18 forKeyedSubscript:off_100069A08];
    uint64_t v9 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = "Selecting fast encoding";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
    }
  }
  else
  {
    unsigned int v11 = [v3 sessionMetadata];
    CFStringRef v12 = [v11 objectForKeyedSubscript:off_100069A08];
    unsigned int v13 = [v12 containsObject:off_100069A28];

    if (v13)
    {
      [v5 setObject:off_100069A28 forKeyedSubscript:off_100069A08];
      uint64_t v9 = *(NSObject **)(qword_100069D78 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v10 = "Selecting protobuf encoding";
        goto LABEL_9;
      }
    }
    else
    {
      [v5 setObject:off_100069A10 forKeyedSubscript:off_100069A08];
      uint64_t v9 = *(NSObject **)(qword_100069D78 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v10 = "Selecting vCard encoding";
        goto LABEL_9;
      }
    }
  }
  if (+[NDTLog isInternalDevice]
    && (Boolean keyExistsAndHasValidFormat = 0,
        int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"internal_accountIDs_accepted", @"com.apple.addressbooksync", &keyExistsAndHasValidFormat), keyExistsAndHasValidFormat))
  {
    int v15 = AppBooleanValue;
    BOOL v16 = AppBooleanValue != 0;
    uint64_t v17 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v22 = v15 != 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "accountIDsAccepted [override]: %d", buf, 8u);
    }
  }
  else
  {
    BOOL v16 = 1;
  }
  unint64_t v18 = +[NSNumber numberWithBool:v16];
  [v5 setObject:v18 forKeyedSubscript:off_100069A30];

  [v3 setSessionMetadata:v5];
  v19 = +[ABSContactsShadow instance];
  [v19 beginTransaction];
}

- (id)service:(id)a3 willPreferSession:(id)a4 overSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136446722;
    uint64_t v17 = "ABSyncInterface.m";
    __int16 v18 = 1024;
    int v19 = 891;
    __int16 v20 = 2080;
    CFIndex v21 = "-[ABSyncInterface service:willPreferSession:overSession:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s:%d %s --mark--", (uint8_t *)&v16, 0x1Cu);
  }
  if ([v10 isSending])
  {
    CFStringRef v12 = [v10 delegate];
    unsigned int v13 = [v12 progressReporter];
    [(ABSyncInterface *)self setPreemptedSessionProgressReporter:v13];

    id v14 = [(ABSyncInterface *)self preemptedSessionProgressReporter];
    [v14 pause];
  }

  return v9;
}

- (BOOL)_shouldReallySendDeltaSessionWithAnchor:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(ABSFavoritesSyncObject);
  id v9 = objc_alloc_init(ABSFavoritesDiffObject);
  if ([(ABSFavoritesDiffObject *)v9 matches:v8])
  {

    id v8 = objc_alloc_init(ABSAccountsDiffObject);
    if ([(ABSSyncObject *)v8 matches:0])
    {
      id v10 = +[ABSyncInterface sharedInstance];
      unsigned int v11 = [v10 serverState];

      id v12 = [v11 getIntegerValueForKey:@"isGuardianRestricted" default:0];
      if ((id)+[ABSContainerSyncObject currentGuardianRestriction] != v12)
      {
        BOOL v16 = 1;
LABEL_26:

        goto LABEL_27;
      }
      unint64_t v13 = (unint64_t)[(id)objc_opt_class() estimatedLogCountForAnchor:v6 store:v7];
      if (v13 >> 3 >= 0x271)
      {
        int v14 = v13;
        int v15 = *(NSObject **)(qword_100069D78 + 8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v25[0] = 67109120;
          v25[1] = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Change log appears to be large (%d), bailing to reset behavior.", (uint8_t *)v25, 8u);
        }
        [(ABSyncInterface *)self requestFullSync:@"Big change log"];
        BOOL v16 = 0;
        goto LABEL_26;
      }
      int v19 = [[ABSContactsDeltaSource alloc] initWithAnchor:v6 keys:0 store:v7];
      __int16 v20 = v19;
      if (v19)
      {
        unsigned int v21 = [(ABSContactsDeltaSource *)v19 containsInterestingChanges];
        BOOL v22 = *(NSObject **)(qword_100069D78 + 8);
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if (v21)
        {
          if (v23)
          {
            LOWORD(v25[0]) = 0;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Contacts change detected", (uint8_t *)v25, 2u);
          }
          BOOL v16 = 1;
          goto LABEL_25;
        }
        if (v23)
        {
          LOWORD(v25[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Upon further reflection, we have decided this session is not worth our precious electrons.", (uint8_t *)v25, 2u);
        }
      }
      else if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR))
      {
        sub_100038BA4();
      }
      BOOL v16 = 0;
LABEL_25:

      goto LABEL_26;
    }
    __int16 v18 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Accounts change detected", (uint8_t *)v25, 2u);
    }
  }
  else
  {
    uint64_t v17 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Favorites change detected", (uint8_t *)v25, 2u);
    }
  }
  BOOL v16 = 1;
LABEL_27:

  return v16;
}

- (void)service:(id)a3 sessionEnded:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    unint64_t v13 = [v9 valueForKey:@"identifier"];
    if ([v9 isSending]) {
      CFStringRef v14 = @"sending";
    }
    else {
      CFStringRef v14 = @"receiving";
    }
    unsigned int v15 = [v9 isResetSync];
    CFStringRef v16 = @"delta";
    *(_DWORD *)id v24 = 136446978;
    *(void *)&v24[4] = "-[ABSyncInterface service:sessionEnded:error:]";
    *(_WORD *)&v24[12] = 2114;
    *(void *)&v24[14] = v13;
    if (v15) {
      CFStringRef v16 = @"reset";
    }
    *(_WORD *)&v24[22] = 2114;
    CFStringRef v25 = v14;
    __int16 v26 = 2114;
    CFStringRef v27 = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s %{public}@ #%{public}@ #%{public}@", v24, 0x2Au);
  }
  kdebug_trace();
  uint64_t v17 = [(ABSyncInterface *)self syncSession];
  __int16 v18 = [v17 capturedError];

  if (v18)
  {
    uint64_t v19 = [v17 capturedError];

    id v10 = (id)v19;
  }
  if (v10)
  {
    __int16 v20 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100038BD8((uint64_t)v10, v20);
    }
  }
  if (objc_msgSend(v9, "isSending", *(_OWORD *)v24, *(void *)&v24[16])) {
    [(ABSyncInterface *)self _sendSessionEnded:v9 error:v10];
  }
  else {
    [(ABSyncInterface *)self _recvSessionEnded:v9 error:v10];
  }
  [(ABSyncInterface *)self setSySession:0];
  [v9 setDelegate:0];
  [(ABSyncInterface *)self setSyncSession:0];
  [(ABSyncInterface *)self setPsySyncSession:0];
  if (self->_activity)
  {
    unsigned int v21 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Telling XPC_ACTIVITY we're done.", v24, 2u);
    }
    [(NDTActivity *)self->_activity completeAndFireNever];
  }
  BOOL v22 = [(ABSyncInterface *)self sessionIdleQueue];
  dispatch_resume(v22);

  BOOL v23 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Done.", v24, 2u);
  }
}

- (void)_sendSessionEnded:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  id v8 = [(ABSyncInterface *)self syncSession];
  BOOL v9 = [(ABSyncInterface *)self shouldResetSyncBePartial];
  [(ABSyncInterface *)self setShouldResetSyncBePartial:0];
  if (!v7
    && ![(ABSyncInterface *)self _shouldFakeFailure]
    && [v6 state] == 9)
  {
    if ([v6 isResetSync]) {
      uint64_t v10 = 136;
    }
    else {
      uint64_t v10 = 128;
    }
    double Current = CFAbsoluteTimeGetCurrent();
    [v8 start];
    double v13 = v12;
    CFStringRef v14 = +[ABSContactsShadow instance];
    [v14 commitTransaction];

    if ([v8 count])
    {
      double v15 = (double)(unint64_t)[v8 count] / (Current - v13);
      CFStringRef v16 = *(NSObject **)(qword_100069D80 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v37 = 134217984;
        *(double *)&v37[4] = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Session rate: %f", v37, 0xCu);
      }
      *(double *)((char *)&self->super.isa + v10) = (v15
                                                   + *(double *)((char *)&self->super.isa + v10)
                                                   + *(double *)((char *)&self->super.isa + v10))
                                                  / 3.0;
      [(NDTServerState *)self->_serverState setDoubleValue:@"fullRate" forKey:self->_fullRateEstimate];
      [(NDTServerState *)self->_serverState setDoubleValue:@"deltaRate" forKey:self->_deltaRateEstimate];
      uint64_t v17 = *(NSObject **)(qword_100069D80 + 8);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      double deltaRateEstimate = self->_deltaRateEstimate;
      double fullRateEstimate = self->_fullRateEstimate;
      *(_DWORD *)v37 = 134218240;
      *(double *)&v37[4] = fullRateEstimate;
      *(_WORD *)&v37[12] = 2048;
      *(double *)&v37[14] = deltaRateEstimate;
      __int16 v20 = "Full sync rate: %f, Delta: %f";
      unsigned int v21 = v17;
      uint32_t v22 = 22;
    }
    else
    {
      id v33 = *(NSObject **)(qword_100069D78 + 8);
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
LABEL_35:
        [(NDTServerState *)self->_serverState setIntegerValue:0, @"failureCount", *(_OWORD *)v37, *(void *)&v37[16] forKey];
        if ([v6 isResetSync])
        {
          if (!v9) {
            [(NDTServerState *)self->_serverState setIntegerValue:7 forKey:@"sessionEdition"];
          }
          [(NDTServerState *)self->_serverState setBoolValue:0 forKey:@"MustBePartialReset"];
        }
        [(NDTServerState *)self->_serverState setBoolValue:v9 forKey:@"RetryMustBeReset"];
        v34 = [(ABSyncInterface *)self syncSession];
        v35 = [v34 contactsSource];
        v36 = [v35 historyAnchor];
        [(ABSyncInterface *)self _saveAnchor:v36];

        [(ABSyncInterface *)self _saveGuardianRestrictionBit];
        goto LABEL_24;
      }
      *(_WORD *)v37 = 0;
      __int16 v20 = "Count was zero, not updating rate estimates.";
      unsigned int v21 = v33;
      uint32_t v22 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, v37, v22);
    goto LABEL_35;
  }
  BOOL v23 = *(NSObject **)(qword_100069D88 + 8);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    if (v7) {
      CFStringRef v31 = v7;
    }
    else {
      CFStringRef v31 = @"(FAKE/None)";
    }
    unsigned int v32 = v23;
    *(_DWORD *)v37 = 138543618;
    *(void *)&v37[4] = v31;
    *(_WORD *)&v37[12] = 1024;
    *(_DWORD *)&v37[14] = [v6 state];
    _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "There was a sync error %{public}@, cs_state: %{companionsync:SYSessionState}d.", v37, 0x12u);
  }
  id v24 = +[ABSContactsShadow instance];
  [v24 rollbackTransaction];

  if ([(__CFString *)v7 code] == (id)2007)
  {
    if ([v6 isResetSync]) {
      uint64_t v25 = 136;
    }
    else {
      uint64_t v25 = 128;
    }
    __int16 v26 = [(ABSyncInterface *)self syncSession];
    double v27 = (double)(unint64_t)[v26 count];
    [v6 fullSessionTimeout];
    *(double *)((char *)&self->super.isa + v25) = v27 / (v28 + v28);

    [(NDTServerState *)self->_serverState setDoubleValue:@"fullRate" forKey:self->_fullRateEstimate];
    [(NDTServerState *)self->_serverState setDoubleValue:@"deltaRate" forKey:self->_deltaRateEstimate];
    goto LABEL_21;
  }
  if ([(__CFString *)v7 code] != (id)2023)
  {
LABEL_21:
    [v6 isResetSync];
    BOOL v29 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Rescheduling.", v37, 2u);
    }
    [(ABSyncInterface *)self _scheduleRetrySync];
    goto LABEL_24;
  }
  if ([v6 isResetSync])
  {
    [(ABSyncInterface *)self requestFullSync:@"Requesting reset sync due to collision"];
  }
  else
  {
    v30 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Requesting delta sync due to collision", v37, 2u);
    }
    [(SYService *)self->_syncService setHasChangesAvailable];
  }
LABEL_24:
}

- (void)_recvSessionEnded:(id)a3 error:(id)a4
{
  id v22 = a3;
  id v6 = [(ABSyncInterface *)self syncSession];
  if (!a4)
  {
    id v7 = [(ABSyncInterface *)self syncSession];
    id v8 = [v7 accountsMessage];

    if (v8)
    {
      BOOL v9 = [(ABSyncInterface *)self syncSession];
      uint64_t v10 = [v9 accountsMessage];
      +[ABSAccountsSyncObject processSyncObjEndOfSessionPortion:v10];
    }
  }
  if ([v22 isResetSync])
  {
    unsigned int v11 = [v6 capturedError];
    if (v11)
    {
    }
    else
    {
      double v12 = [v22 error];

      if (!v12)
      {
        double v13 = [(ABSyncInterface *)self syncController];
        [v13 deleteUnmarked];

        CFStringRef v14 = [v6 accountIdentifiers];
        id v15 = objc_alloc_init((Class)CNContactStore);
        +[ABSAccountsManager deleteNotThese:v14 fromStore:v15];

        [(NDTServerState *)self->_serverState setBoolValue:0 forKey:@"RetryMustBeReset"];
      }
    }
  }
  CFStringRef v16 = [(ABSyncInterface *)self syncSession];
  uint64_t v17 = [v16 validationMessage];

  if (!a4 && v17)
  {
    __int16 v18 = [(ABSyncInterface *)self syncSession];
    uint64_t v19 = [v18 validationMessage];
    +[ABSValidationSyncObject validateAgainst:v19];
  }
  __int16 v20 = +[ABSContactsShadow instance];
  [v20 commitTransaction];

  unsigned int v21 = +[ABSContactsInterface sharedInstance];
  [v21 sendMultisaveFinished];
}

- (id)_fetchAnchor
{
  id v2 = [(NDTServerState *)self->_serverState getStringValueForKey:@"syncAnchor" default:0];
  if (v2) {
    id v3 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v2 options:0];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)_saveAnchor:(id)a3
{
  id v6 = a3;
  if (v6 && ([v6 base64EncodedStringWithOptions:0], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = (void *)v4;
    [(NDTServerState *)self->_serverState setStringValue:v4 forKey:@"syncAnchor"];
  }
  else
  {
    [(NDTServerState *)self->_serverState deleteKey:@"syncAnchor"];
  }
}

- (void)_saveGuardianRestrictionBit
{
  int64_t v3 = +[ABSContainerSyncObject currentGuardianRestriction];
  serverState = self->_serverState;

  [(NDTServerState *)serverState setIntegerValue:v3 forKey:@"isGuardianRestricted"];
}

- (BOOL)oldDatabaseExists
{
  id v2 = +[NSFileManager defaultManager];
  int64_t v3 = +[ABSDatabaseFileManager syncStateDBPathFor:@"ABSyncState.local"];
  unsigned __int8 v4 = [v2 fileExistsAtPath:v3];

  return v4;
}

- (BOOL)oldDatabaseDelete
{
  id v2 = +[NSFileManager defaultManager];
  int64_t v3 = +[ABSDatabaseFileManager syncStateDBPathFor:@"ABSyncState.local"];
  unsigned __int8 v4 = [v2 removeItemAtPath:v3 error:0];

  return v4;
}

- (void)_requestFullSync:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  uint64_t v6 = [(ABSyncInterface *)self sySession];
  if (v6
    && (id v7 = (void *)v6,
        [(ABSyncInterface *)self sySession],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 isResetSync],
        v8,
        v7,
        v9))
  {
    uint64_t v10 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Disregarding reset request during a reset session, proposed reason: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    unsigned int v11 = [(ABSyncInterface *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100036450;
    block[3] = &unk_1000550E0;
    void block[4] = self;
    id v13 = v4;
    id v14 = v5;
    dispatch_async(v11, block);
  }
}

- (void)requestFullSync:(id)a3
{
}

- (ABSSyncController)syncController
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_syncController)
  {
    int64_t v3 = objc_alloc_init(ABSSyncController);
    syncController = v2->_syncController;
    v2->_syncController = v3;
  }
  objc_sync_exit(v2);

  id v5 = v2->_syncController;

  return v5;
}

- (void)_setupLogging
{
  uint64_t v3 = +[NDTLog facilityWithSubsystem:@"com.apple.addressbooksync" category:@"phone"];
  id v4 = (void *)qword_100069D78;
  qword_100069D78 = v3;

  uint64_t v5 = +[NDTLog facilityWithSubsystem:@"com.apple.addressbooksync" category:@"cs"];
  uint64_t v6 = (void *)qword_100069D88;
  qword_100069D88 = v5;

  uint64_t v7 = +[NDTLog facilityWithSubsystem:@"com.apple.addressbooksync" category:@"performance"];
  id v8 = (void *)qword_100069D80;
  qword_100069D80 = v7;

  [(ABSyncInterface *)self _enableDisableLogging];
}

- (id)_newFileName
{
  id v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  uint64_t v3 = [v2 objectAtIndex:0];
  id v4 = [v3 stringByAppendingPathComponent:@"Logs/CrashReporter/DiagnosticLogs/AddressBookSync"];

  uint64_t v5 = +[NSFileManager defaultManager];
  [v5 contentsOfDirectoryAtPath:v4 error:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "length", (void)v14) == (id)32
          && [v11 hasPrefix:@"abs-log-"]
          && ([v11 hasSuffix:@".sqlitedb"] & 1) != 0)
        {
          double v12 = [v4 stringByAppendingPathComponent:v11];

          goto LABEL_13;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  double v12 = [v4 stringByAppendingPathComponent:@"abs-log-%t.sqlitedb"];
LABEL_13:

  return v12;
}

- (id)newFileName:(id)a3
{
  return [(ABSyncInterface *)self _newFileName];
}

- (void)_enableDisableLogging
{
  dword_100069D70 = 1;
}

- (void)watchUpdated:(id)a3
{
  id v4 = (void *)os_transaction_create();
  uint64_t v5 = [(ABSyncInterface *)self sessionIdleQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100036960;
  v7[3] = &unk_100054FA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (SYService)syncService
{
  return self->_syncService;
}

- (void)setSyncService:(id)a3
{
}

- (BOOL)isCurrentlySyncing
{
  return self->_isCurrentlySyncing;
}

- (NDTServerState)serverState
{
  return self->_serverState;
}

- (void)setServerState:(id)a3
{
}

- (void)setSyncController:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)syncTimer
{
  return self->_syncTimer;
}

- (void)setSyncTimer:(id)a3
{
}

- (OS_dispatch_source)unlockTimer
{
  return self->_unlockTimer;
}

- (void)setUnlockTimer:(id)a3
{
}

- (OS_dispatch_queue)unlockQueue
{
  return self->_unlockQueue;
}

- (void)setUnlockQueue:(id)a3
{
}

- (OS_dispatch_queue)sessionIdleQueue
{
  return self->_sessionIdleQueue;
}

- (void)setSessionIdleQueue:(id)a3
{
}

- (int64_t)objectCount
{
  return self->_objectCount;
}

- (void)setObjectCount:(int64_t)a3
{
  self->_objectCount = a3;
}

- (BOOL)externalChangesGoingOn
{
  return self->_externalChangesGoingOn;
}

- (void)setExternalChangesGoingOn:(BOOL)a3
{
  self->_externalChangesGoingOn = a3;
}

- (BOOL)needsDeltaSync
{
  return self->_needsDeltaSync;
}

- (void)setNeedsDeltaSync:(BOOL)a3
{
  self->_needsDeltaSync = a3;
}

- (ABSLasordaSession)syncSession
{
  return self->_syncSession;
}

- (void)setSyncSession:(id)a3
{
}

- (SYSession)sySession
{
  return self->_sySession;
}

- (void)setSySession:(id)a3
{
}

- (double)deltaRateEstimate
{
  return self->_deltaRateEstimate;
}

- (void)setDeltaRateEstimate:(double)a3
{
  self->_double deltaRateEstimate = a3;
}

- (double)fullRateEstimate
{
  return self->_fullRateEstimate;
}

- (void)setFullRateEstimate:(double)a3
{
  self->_double fullRateEstimate = a3;
}

- (NSString)watchBuildVersion
{
  return self->_watchBuildVersion;
}

- (void)setWatchBuildVersion:(id)a3
{
}

- (NDTSignalCoalescer)signalCoalescer
{
  return self->_signalCoalescer;
}

- (void)setSignalCoalescer:(id)a3
{
}

- (BOOL)mustBeReset
{
  return self->_mustBeReset;
}

- (void)setMustBeReset:(BOOL)a3
{
  self->_mustBeReset = a3;
}

- (PSYSyncCoordinator)psySyncCoordinator
{
  return self->_psySyncCoordinator;
}

- (void)setPsySyncCoordinator:(id)a3
{
}

- (PSYServiceSyncSession)psySyncSession
{
  return self->_psySyncSession;
}

- (void)setPsySyncSession:(id)a3
{
}

- (ABSProgressReporter)preemptedSessionProgressReporter
{
  return self->_preemptedSessionProgressReporter;
}

- (void)setPreemptedSessionProgressReporter:(id)a3
{
}

- (ABSTestControl)statusReporter
{
  return self->_statusReporter;
}

- (void)setStatusReporter:(id)a3
{
}

- (BOOL)shouldResetSyncBePartial
{
  return self->_shouldResetSyncBePartial;
}

- (void)setShouldResetSyncBePartial:(BOOL)a3
{
  self->_shouldResetSyncBePartial = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusReporter, 0);
  objc_storeStrong((id *)&self->_preemptedSessionProgressReporter, 0);
  objc_storeStrong((id *)&self->_psySyncSession, 0);
  objc_storeStrong((id *)&self->_psySyncCoordinator, 0);
  objc_storeStrong((id *)&self->_signalCoalescer, 0);
  objc_storeStrong((id *)&self->_watchBuildVersion, 0);
  objc_storeStrong((id *)&self->_sySession, 0);
  objc_storeStrong((id *)&self->_syncSession, 0);
  objc_storeStrong((id *)&self->_sessionIdleQueue, 0);
  objc_storeStrong((id *)&self->_unlockQueue, 0);
  objc_storeStrong((id *)&self->_unlockTimer, 0);
  objc_storeStrong((id *)&self->_syncTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_syncController, 0);
  objc_storeStrong((id *)&self->_serverState, 0);
  objc_storeStrong((id *)&self->_syncService, 0);
  objc_storeStrong((id *)&self->_activity, 0);

  objc_storeStrong((id *)&self->_logDbFile, 0);
}

@end