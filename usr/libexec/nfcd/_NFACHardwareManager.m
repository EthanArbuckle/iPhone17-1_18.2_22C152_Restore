@interface _NFACHardwareManager
+ (id)sharedHardwareManager;
- (BOOL)_loadHWInfo;
- (BOOL)_queueNewSession:(id)a3 onConnection:(id)a4;
- (BOOL)_validateSessionRequest:(id)a3 withConnection:(id)a4;
- (BOOL)isWalletAttached;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_NFACHardwareManager)init;
- (id)_executeWithDriverSessionSync:(id)a3 block:(id)a4;
- (id)_getDefaults;
- (id)_getInfo;
- (id)_readDriverSettings;
- (os_state_data_s)dumpState;
- (unint64_t)_loadHW;
- (void)_dequeueSession:(id)a3 startNextSession:(BOOL)a4;
- (void)_loadService;
- (void)_probeHW;
- (void)_startAfterRecovery:(BOOL)a3;
- (void)_sync_pushSignedRF:(id)a3 callback:(id)a4;
- (void)_unloadService;
- (void)basebandStateChanged:(BOOL)a3;
- (void)clearMultiTagState:(id)a3;
- (void)dequeueSession:(id)a3;
- (void)didCloseXPCConnection:(id)a3;
- (void)enableLPCD:(BOOL)a3 callback:(id)a4;
- (void)enableMultiTag:(BOOL)a3 callback:(id)a4;
- (void)getDieId:(id)a3;
- (void)getInfo:(id)a3;
- (void)getLastDetectedTags:(id)a3;
- (void)getMultiTagState:(id)a3;
- (void)getPowerCounters:(id)a3;
- (void)getRfSettings:(id)a3;
- (void)handleFailForwardCompleted;
- (void)handleHardwareReset:(const char *)a3;
- (void)handleMultiTagStateChanged:(id)a3 rfError:(BOOL)a4;
- (void)handlePLLUnlock;
- (void)handleReaderBurnoutCleared;
- (void)handleReaderBurnoutTimer;
- (void)handleRemoteTagsDetected:(id)a3;
- (void)handleRestartDiscovery;
- (void)handleStackLoad;
- (void)handleStackUnload;
- (void)isHWSupported:(id)a3;
- (void)maybeStartNextSession;
- (void)powerObserverSystemHasPoweredOn:(id)a3;
- (void)powerObserverSystemWillSleep:(id)a3;
- (void)preferencesDidChange;
- (void)primaryDelegateRegistered:(id)a3;
- (void)pushSignedRF:(id)a3 callback:(id)a4;
- (void)queueReaderSession:(id)a3 callback:(id)a4;
- (void)setClientName:(id)a3;
- (void)shutdownAndLeaveHWEnabled:(BOOL)a3 callback:(id)a4;
- (void)start;
- (void)stop;
- (void)stopFury;
- (void)triggerDelayedWake:(unsigned __int8)a3 callback:(id)a4;
@end

@implementation _NFACHardwareManager

+ (id)sharedHardwareManager
{
  if (qword_100347720 != -1) {
    dispatch_once(&qword_100347720, &stru_100308820);
  }
  v2 = (void *)qword_100347718;

  return v2;
}

- (_NFACHardwareManager)init
{
  v25.receiver = self;
  v25.super_class = (Class)_NFACHardwareManager;
  v2 = [(_NFACHardwareManager *)&v25 init];
  v3 = v2;
  if (v2)
  {
    v2->_hardwareState = 0;
    uint64_t v4 = objc_opt_new();
    sessions = v3->_sessions;
    v3->_sessions = (NSMutableArray *)v4;

    uint64_t v6 = objc_opt_new();
    xpcConnections = v3->_xpcConnections;
    v3->_xpcConnections = (NSMutableArray *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INTERACTIVE, -1);

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.nfcacd.xpc", v9);
    xpcConnectionQueue = v3->_xpcConnectionQueue;
    v3->_xpcConnectionQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_set_specific((dispatch_queue_t)v3->_xpcConnectionQueue, kNFLOG_DISPATCH_SPECIFIC_KEY, (void *)3, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.nfcacd.workQueue", v9);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_set_specific((dispatch_queue_t)v3->_workQueue, kNFLOG_DISPATCH_SPECIFIC_KEY, (void *)3, 0);
    uint64_t v14 = dispatch_get_global_queue(25, 0);
    xpcEventNotificationQueue = v3->_xpcEventNotificationQueue;
    v3->_xpcEventNotificationQueue = (OS_dispatch_queue *)v14;

    v16 = (NFPowerObserver *)[objc_alloc((Class)NFPowerObserver) initWithDelegate:v3];
    powerObserver = v3->_powerObserver;
    v3->_powerObserver = v16;

    uint64_t v18 = objc_opt_new();
    driverWrapper = v3->_driverWrapper;
    v3->_driverWrapper = (NFACDriverWrapper *)v18;

    [(NFACDriverWrapper *)v3->_driverWrapper setDelegate:v3];
    v20 = objc_alloc_init(NFBasebandMonitor);
    basebandMonitor = v3->_basebandMonitor;
    v3->_basebandMonitor = v20;

    v22 = (NFSecureXPCEventPublisher *)[objc_alloc((Class)NFSecureXPCEventPublisher) initWithMachPort:@"com.apple.accessoryd.nf-events" queue:v3->_xpcEventNotificationQueue];
    accessorydEventPublisher = v3->_accessorydEventPublisher;
    v3->_accessorydEventPublisher = v22;
  }
  return v3;
}

- (void)_probeHW
{
  if (self->_isRunning)
  {
    unint64_t v4 = [(NFACDriverWrapper *)self->_driverWrapper openSession:@"HW probe"];
    if (v4 == 1)
    {
      [(_NFACHardwareManager *)self maybeStartNextSession];
      driverWrapper = self->_driverWrapper;
      [(NFACDriverWrapper *)driverWrapper closeSession:@"HW probe"];
    }
    else
    {
      unint64_t v15 = v4;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v17 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v20 = 45;
        if (isMetaClass) {
          uint64_t v20 = 43;
        }
        v17(3, "%c[%{public}s %{public}s]:%i Failed to open a driver session: %lu", v20, ClassName, Name, 144, v15);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v21 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = object_getClass(self);
        if (class_isMetaClass(v22)) {
          int v23 = 43;
        }
        else {
          int v23 = 45;
        }
        *(_DWORD *)buf = 67110146;
        int v28 = v23;
        __int16 v29 = 2082;
        v30 = object_getClassName(self);
        __int16 v31 = 2082;
        v32 = sel_getName(a2);
        __int16 v33 = 1024;
        int v34 = 144;
        __int16 v35 = 2048;
        unint64_t v36 = v15;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open a driver session: %lu", buf, 0x2Cu);
      }
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v6 = NFLogGetLogger();
    if (v6)
    {
      v7 = (void (*)(uint64_t, const char *, ...))v6;
      v8 = object_getClass(self);
      BOOL v9 = class_isMetaClass(v8);
      dispatch_queue_t v10 = object_getClassName(self);
      objc_super v25 = sel_getName(a2);
      uint64_t v11 = 45;
      if (v9) {
        uint64_t v11 = 43;
      }
      v7(6, "%c[%{public}s %{public}s]:%i Not started yet?!", v11, v10, v25, 148);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    dispatch_queue_t v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v28 = v14;
      __int16 v29 = 2082;
      v30 = object_getClassName(self);
      __int16 v31 = 2082;
      v32 = sel_getName(a2);
      __int16 v33 = 1024;
      int v34 = 148;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Not started yet?!", buf, 0x22u);
    }
  }
}

- (void)_startAfterRecovery:(BOOL)a3
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 154);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  dispatch_queue_t v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v21 = v14;
    __int16 v22 = 2082;
    int v23 = object_getClassName(self);
    __int16 v24 = 2082;
    objc_super v25 = sel_getName(a2);
    __int16 v26 = 1024;
    int v27 = 154;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  unint64_t v15 = self;
  objc_sync_enter(v15);
  if (v15->_isRunning)
  {
    objc_sync_exit(v15);
  }
  else
  {
    [(_NFACHardwareManager *)v15 _loadService];
    v15->_isRunning = 1;
    objc_sync_exit(v15);

    workQueue = v15->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10025FE4C;
    block[3] = &unk_100301BC8;
    BOOL v19 = a3;
    block[4] = v15;
    dispatch_async(workQueue, block);
  }
}

- (void)start
{
  unint64_t v4 = _os_activity_create((void *)&_mh_execute_header, "_NFACHardwareManager started", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v4, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass(self);
    if (class_isMetaClass(Class)) {
      uint64_t v7 = 43;
    }
    else {
      uint64_t v7 = 45;
    }
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    Logger(6, "%c[%{public}s %{public}s]:%i starting", v7, ClassName, Name, 174);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  dispatch_queue_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    v13 = object_getClassName(self);
    int v14 = sel_getName(a2);
    *(_DWORD *)state = 67109890;
    *(_DWORD *)&state[4] = v12;
    *(_WORD *)&state[8] = 2082;
    *(void *)&state[10] = v13;
    __int16 v36 = 2082;
    v37 = v14;
    __int16 v38 = 1024;
    int v39 = 174;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i starting", state, 0x22u);
  }

  unint64_t v15 = NFSharedSignpostLog();
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)state = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_STARTED", (const char *)&unk_100286819, state, 2u);
  }

  v16 = self;
  objc_sync_enter(v16);
  if (NFProductSupportsAC())
  {
    v17 = sub_10020A934();
    sub_10020ACC0(v17, v16);

    handler[6] = _NSConcreteStackBlock;
    handler[7] = 3221225472;
    handler[8] = sub_1002603B4;
    handler[9] = &unk_1003041E0;
    handler[10] = v16;
    v16->_stateCaptureHandle = os_state_add_handler();
    uint64_t v18 = dispatch_get_global_queue(0, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100260494;
    handler[3] = &unk_100308888;
    handler[4] = v16;
    handler[5] = a2;
    xpc_set_event_stream_handler("com.apple.iokit.matching", v18, handler);

    objc_sync_exit(v16);
    BOOL v19 = (NFBackgroundActivityScheduler *)[objc_alloc((Class)NFBackgroundActivityScheduler) initWithQueue:v16->_workQueue];
    schedulingDailyUpdating = v16->_schedulingDailyUpdating;
    v16->_schedulingDailyUpdating = v19;

    int v21 = v16->_schedulingDailyUpdating;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100260908;
    v33[3] = &unk_100301F70;
    v33[4] = v16;
    v33[5] = a2;
    [(NFBackgroundActivityScheduler *)v21 schedulePreRegisteredActivity:@"com.apple.nfcacd.coreanalytics.event" callback:v33];
    [(_NFACHardwareManager *)v16 _startAfterRecovery:0];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v22 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v22)
    {
      int v23 = object_getClass(v16);
      if (class_isMetaClass(v23)) {
        uint64_t v24 = 43;
      }
      else {
        uint64_t v24 = 45;
      }
      objc_super v25 = object_getClassName(v16);
      __int16 v26 = sel_getName(a2);
      v22(6, "%c[%{public}s %{public}s]:%i started", v24, v25, v26, 227);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v27 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = object_getClass(v16);
      if (class_isMetaClass(v28)) {
        int v29 = 43;
      }
      else {
        int v29 = 45;
      }
      v30 = object_getClassName(v16);
      __int16 v31 = sel_getName(a2);
      *(_DWORD *)state = 67109890;
      *(_DWORD *)&state[4] = v29;
      *(_WORD *)&state[8] = 2082;
      *(void *)&state[10] = v30;
      __int16 v36 = 2082;
      v37 = v31;
      __int16 v38 = 1024;
      int v39 = 227;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i started", state, 0x22u);
    }
  }
  else
  {
    v16->_hardwareState = 2;
    v32 = dispatch_get_global_queue(0, 0);
    xpc_set_event_stream_handler("com.apple.iokit.matching", v32, &stru_100308860);

    objc_sync_exit(v16);
  }
}

- (void)stop
{
  unint64_t v4 = _os_activity_create((void *)&_mh_execute_header, "_NFACHardwareManager stopped", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v4, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
  {
    Class = object_getClass(self);
    if (class_isMetaClass(Class)) {
      uint64_t v7 = 43;
    }
    else {
      uint64_t v7 = 45;
    }
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    Logger(6, "%c[%{public}s %{public}s]:%i Nfcacd stopping", v7, ClassName, Name, 234);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  dispatch_queue_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    v13 = object_getClassName(self);
    int v14 = sel_getName(a2);
    *(_DWORD *)state = 67109890;
    *(_DWORD *)&state[4] = v12;
    *(_WORD *)&state[8] = 2082;
    *(void *)&state[10] = v13;
    __int16 v30 = 2082;
    __int16 v31 = v14;
    __int16 v32 = 1024;
    int v33 = 234;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Nfcacd stopping", state, 0x22u);
  }

  unint64_t v15 = NFSharedSignpostLog();
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)state = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_STOPPING", (const char *)&unk_100286819, state, 2u);
  }

  v16 = self;
  objc_sync_enter(v16);
  if (v16->_isRunning)
  {
    [(NFPowerObserver *)v16->_powerObserver unregisterForEvents];
    powerObserver = v16->_powerObserver;
    v16->_powerObserver = 0;

    [(NFPreferenceObserver *)v16->_preferenceObserver stop];
    preferenceObserver = v16->_preferenceObserver;
    v16->_preferenceObserver = 0;

    [(_NFACHardwareManager *)v16 _unloadService];
    v16->_isRunning = 0;
    [(NFACDriverWrapper *)v16->_driverWrapper stopNowAndLeveHWEnabled:0];
    [(NSMutableArray *)v16->_sessions removeAllObjects];
    objc_sync_exit(v16);

    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v19 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v19)
    {
      uint64_t v20 = object_getClass(v16);
      if (class_isMetaClass(v20)) {
        uint64_t v21 = 43;
      }
      else {
        uint64_t v21 = 45;
      }
      __int16 v22 = object_getClassName(v16);
      int v23 = sel_getName(a2);
      v19(6, "%c[%{public}s %{public}s]:%i nfcacd stopped", v21, v22, v23, 252);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    p_super = NFSharedLogGetLogger();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v25 = object_getClass(v16);
      if (class_isMetaClass(v25)) {
        int v26 = 43;
      }
      else {
        int v26 = 45;
      }
      int v27 = object_getClassName(v16);
      int v28 = sel_getName(a2);
      *(_DWORD *)state = 67109890;
      *(_DWORD *)&state[4] = v26;
      *(_WORD *)&state[8] = 2082;
      *(void *)&state[10] = v27;
      __int16 v30 = 2082;
      __int16 v31 = v28;
      __int16 v32 = 1024;
      int v33 = 252;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i nfcacd stopped", state, 0x22u);
    }
  }
  else
  {
    objc_sync_exit(v16);
    p_super = &v16->super;
  }
}

- (void)_loadService
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i Trying to create service", v9, ClassName, Name, 259);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  dispatch_queue_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v41 = v12;
    __int16 v42 = 2082;
    v43 = object_getClassName(self);
    __int16 v44 = 2082;
    v45 = sel_getName(a2);
    __int16 v46 = 1024;
    int v47 = 259;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Trying to create service", buf, 0x22u);
  }

  id v13 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.nfcacd.hwmanager"];
  int v14 = (void *)qword_100347710;
  qword_100347710 = (uint64_t)v13;

  [(id)qword_100347710 setDelegate:self];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v15 = NFLogGetLogger();
  if (v15)
  {
    v16 = (void (*)(uint64_t, const char *, ...))v15;
    v17 = object_getClass(self);
    BOOL v18 = class_isMetaClass(v17);
    BOOL v19 = object_getClassName(self);
    __int16 v38 = sel_getName(a2);
    uint64_t v20 = 45;
    if (v18) {
      uint64_t v20 = 43;
    }
    v16(6, "%c[%{public}s %{public}s]:%i mach service created", v20, v19, v38, 263);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v21 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v22 = object_getClass(self);
    if (class_isMetaClass(v22)) {
      int v23 = 43;
    }
    else {
      int v23 = 45;
    }
    uint64_t v24 = object_getClassName(self);
    objc_super v25 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v41 = v23;
    __int16 v42 = 2082;
    v43 = v24;
    __int16 v44 = 2082;
    v45 = v25;
    __int16 v46 = 1024;
    int v47 = 263;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i mach service created", buf, 0x22u);
  }

  [(id)qword_100347710 _setQueue:self->_xpcConnectionQueue];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v26 = NFLogGetLogger();
  if (v26)
  {
    int v27 = (void (*)(uint64_t, const char *, ...))v26;
    int v28 = object_getClass(self);
    BOOL v29 = class_isMetaClass(v28);
    __int16 v30 = object_getClassName(self);
    int v39 = sel_getName(a2);
    uint64_t v31 = 45;
    if (v29) {
      uint64_t v31 = 43;
    }
    v27(6, "%c[%{public}s %{public}s]:%i Resuming service", v31, v30, v39, 267);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  __int16 v32 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = object_getClass(self);
    if (class_isMetaClass(v33)) {
      int v34 = 43;
    }
    else {
      int v34 = 45;
    }
    __int16 v35 = object_getClassName(self);
    __int16 v36 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v41 = v34;
    __int16 v42 = 2082;
    v43 = v35;
    __int16 v44 = 2082;
    v45 = v36;
    __int16 v46 = 1024;
    int v47 = 267;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Resuming service", buf, 0x22u);
  }

  [(id)qword_100347710 resume];
}

- (void)_unloadService
{
  [(id)qword_100347710 invalidate];
  [(id)qword_100347710 setDelegate:0];
  v2 = (void *)qword_100347710;
  qword_100347710 = 0;
}

- (void)primaryDelegateRegistered:(id)a3
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v6 = a3;
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v12 = 45;
    if (isMetaClass) {
      uint64_t v12 = 43;
    }
    v8(6, "%c[%{public}s %{public}s]:%i ", v12, ClassName, Name, 280);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v18 = v15;
    __int16 v19 = 2082;
    uint64_t v20 = object_getClassName(self);
    __int16 v21 = 2082;
    __int16 v22 = sel_getName(a2);
    __int16 v23 = 1024;
    int v24 = 280;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  [(NFACDriverWrapper *)self->_driverWrapper setFailForwardDelegate:v6];
}

- (void)stopFury
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 286);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  dispatch_queue_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v26 = v12;
    __int16 v27 = 2082;
    int v28 = object_getClassName(self);
    __int16 v29 = 2082;
    __int16 v30 = sel_getName(a2);
    __int16 v31 = 1024;
    int v32 = 286;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  id v13 = self;
  objc_sync_enter(v13);
  if (v13->_isRunning)
  {
    v13->_stoppedForFailForward = 1;
    objc_sync_exit(v13);

    [(_NFACHardwareManager *)v13 stop];
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v14 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v14)
    {
      int v15 = object_getClass(v13);
      if (class_isMetaClass(v15)) {
        uint64_t v16 = 43;
      }
      else {
        uint64_t v16 = 45;
      }
      v17 = object_getClassName(v13);
      int v18 = sel_getName(a2);
      v14(6, "%c[%{public}s %{public}s]:%i Not started yet?!", v16, v17, v18, 289);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v19 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = object_getClass(v13);
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      __int16 v22 = object_getClassName(v13);
      __int16 v23 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v26 = v21;
      __int16 v27 = 2082;
      int v28 = v22;
      __int16 v29 = 2082;
      __int16 v30 = v23;
      __int16 v31 = 1024;
      int v32 = 289;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Not started yet?!", buf, 0x22u);
    }

    objc_sync_exit(v13);
  }
}

- (void)handleFailForwardCompleted
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 300);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  dispatch_queue_t v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v18 = v12;
    __int16 v19 = 2082;
    uint64_t v20 = object_getClassName(self);
    __int16 v21 = 2082;
    __int16 v22 = sel_getName(a2);
    __int16 v23 = 1024;
    int v24 = 300;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  id v13 = self;
  objc_sync_enter(v13);
  if (v13->_stoppedForFailForward)
  {
    v13->_stoppedForFailForward = 0;
    [(_NFACHardwareManager *)v13 _startAfterRecovery:1];
  }
  else
  {
    workQueue = v13->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100261940;
    block[3] = &unk_100301C68;
    block[4] = v13;
    dispatch_async(workQueue, block);
  }
  objc_sync_exit(v13);
}

- (id)_getDefaults
{
  return +[NSUserDefaults standardUserDefaults];
}

- (void)powerObserverSystemWillSleep:(id)a3
{
  id v5 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 322);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v24 = v14;
    __int16 v25 = 2082;
    int v26 = object_getClassName(self);
    __int16 v27 = 2082;
    int v28 = sel_getName(a2);
    __int16 v29 = 1024;
    int v30 = 322;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  int v15 = NFSharedSignpostLog();
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_WILL_SLEEP", (const char *)&unk_100286819, buf, 2u);
  }

  uint64_t v16 = self->_sessions;
  objc_sync_enter(v16);
  self->_systemWillSleep = 1;
  objc_sync_exit(v16);

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100261BD0;
  block[3] = &unk_100301C90;
  id v21 = v5;
  SEL v22 = a2;
  block[4] = self;
  id v18 = v5;
  dispatch_sync(workQueue, block);
}

- (void)powerObserverSystemHasPoweredOn:(id)a3
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 351);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v19 = v13;
    __int16 v20 = 2082;
    id v21 = object_getClassName(self);
    __int16 v22 = 2082;
    __int16 v23 = sel_getName(a2);
    __int16 v24 = 1024;
    int v25 = 351;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  int v14 = NFSharedSignpostLog();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_POWERED_ON", (const char *)&unk_100286819, buf, 2u);
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026215C;
  block[3] = &unk_100301C68;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (id)_getInfo
{
  v3 = objc_opt_new();
  controllerInfo = self->_controllerInfo;
  if (controllerInfo)
  {
    id v5 = [(NFHardwareControllerInfo *)controllerInfo asDictionary];
    [v3 setObject:v5 forKeyedSubscript:@"Controller"];
  }
  id v6 = [(_NFACHardwareManager *)self _getDefaults];
  [v6 synchronize];
  uint64_t v7 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = [&off_1003229D0 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(&off_1003229D0);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        int v13 = [v6 objectForKey:v12];

        if (v13)
        {
          int v14 = [v6 objectForKey:v12];
          [v7 setObject:v14 forKey:v12];
        }
      }
      id v9 = [&off_1003229D0 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
  [v3 setObject:v7 forKeyedSubscript:@"Preferences"];
  int v15 = +[NFPowerAssertion sharedPowerAssertion];
  uint64_t v16 = [v15 assertionHolders];
  [v3 setObject:v16 forKeyedSubscript:@"PowerAssertions"];

  v17 = [(NFACDriverWrapper *)self->_driverWrapper owners];
  [v3 setObject:v17 forKeyedSubscript:@"DriverOwners"];

  id v18 = +[NSNumber numberWithBool:self->_stoppedForFailForward];
  [v3 setObject:v18 forKeyedSubscript:@"stoppedForFailForward"];

  return v3;
}

- (id)_executeWithDriverSessionSync:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(void))a4;
  unint64_t v9 = [(NFACDriverWrapper *)self->_driverWrapper openSession:v7];
  if (v9 == 1)
  {
    v8[2](v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    [(NFACDriverWrapper *)self->_driverWrapper closeSession:v7];
  }
  else
  {
    unint64_t v11 = v9;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v17 = 45;
      if (isMetaClass) {
        uint64_t v17 = 43;
      }
      v13(4, "%c[%{public}s %{public}s]:%i Failed to open session; %@ hwState=%lu",
        v17,
        ClassName,
        Name,
        404,
        v7,
        v11);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v18 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = object_getClass(self);
      if (class_isMetaClass(v19)) {
        int v20 = 43;
      }
      else {
        int v20 = 45;
      }
      *(_DWORD *)buf = 67110402;
      int v30 = v20;
      __int16 v31 = 2082;
      int v32 = object_getClassName(self);
      __int16 v33 = 2082;
      int v34 = sel_getName(a2);
      __int16 v35 = 1024;
      int v36 = 404;
      __int16 v37 = 2112;
      id v38 = v7;
      __int16 v39 = 2048;
      unint64_t v40 = v11;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open session; %@ hwState=%lu",
        buf,
        0x36u);
    }

    id v21 = objc_alloc((Class)NSError);
    long long v22 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    long long v23 = +[NSString stringWithUTF8String:"Stack Error"];
    int v28 = v23;
    __int16 v24 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    id v10 = [v21 initWithDomain:v22 code:15 userInfo:v24];
  }

  return v10;
}

- (void)getInfo:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10026277C;
  v7[3] = &unk_100302390;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)getDieId:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100262918;
  v7[3] = &unk_100302390;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)getPowerCounters:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100262CC8;
  v7[3] = &unk_100302390;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)getRfSettings:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100262F90;
  v7[3] = &unk_100302390;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)enableMultiTag:(BOOL)a3 callback:(id)a4
{
  BOOL v4 = a3;
  id v7 = (void (**)(id, id))a4;
  if (NFProductIsDevBoard()
    && ([(_NFACHardwareManager *)self _getDefaults],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v9 = [v8 BOOLForKey:@"forceMultiTagEnabled"],
        v8,
        (v9 & 1) == 0))
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v20 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v24 = 45;
      if (isMetaClass) {
        uint64_t v24 = 43;
      }
      v20(4, "%c[%{public}s %{public}s]:%i <MultiTag Detection is disabled on dev boards", v24, ClassName, Name, 495);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v25 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v26 = object_getClass(self);
      if (class_isMetaClass(v26)) {
        int v27 = 43;
      }
      else {
        int v27 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v41 = v27;
      __int16 v42 = 2082;
      v43 = object_getClassName(self);
      __int16 v44 = 2082;
      v45 = sel_getName(a2);
      __int16 v46 = 1024;
      int v47 = 495;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i <MultiTag Detection is disabled on dev boards", buf, 0x22u);
    }

    id v28 = objc_alloc((Class)NSError);
    __int16 v29 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v50 = NSLocalizedDescriptionKey;
    int v30 = +[NSString stringWithUTF8String:"Feature Not Supported"];
    v51 = v30;
    __int16 v31 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    id v32 = [v28 initWithDomain:v29 code:14 userInfo:v31];
    v7[2](v7, v32);
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v10 = NFLogGetLogger();
    if (v10)
    {
      unint64_t v11 = (void (*)(uint64_t, const char *, ...))v10;
      uint64_t v12 = object_getClass(self);
      BOOL v13 = class_isMetaClass(v12);
      __int16 v33 = object_getClassName(self);
      int v34 = sel_getName(a2);
      uint64_t v14 = 45;
      if (v13) {
        uint64_t v14 = 43;
      }
      v11(6, "%c[%{public}s %{public}s]:%i enable: %d", v14, v33, v34, 500, v4);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = object_getClass(self);
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v41 = v17;
      __int16 v42 = 2082;
      v43 = object_getClassName(self);
      __int16 v44 = 2082;
      v45 = sel_getName(a2);
      __int16 v46 = 1024;
      int v47 = 500;
      __int16 v48 = 1024;
      BOOL v49 = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i enable: %d", buf, 0x28u);
    }

    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002636D0;
    block[3] = &unk_100302E40;
    BOOL v39 = v4;
    block[4] = self;
    SEL v38 = a2;
    __int16 v37 = v7;
    dispatch_async(workQueue, block);
  }
}

- (void)enableLPCD:(BOOL)a3 callback:(id)a4
{
  id v7 = a4;
  workQueue = self->_workQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100263FB0;
  v10[3] = &unk_100302E40;
  BOOL v13 = a3;
  id v11 = v7;
  SEL v12 = a2;
  v10[4] = self;
  id v9 = v7;
  dispatch_async(workQueue, v10);
}

- (void)getLastDetectedTags:(id)a3
{
  id v5 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026469C;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(workQueue, block);
}

- (void)getMultiTagState:(id)a3
{
  id v5 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100264CA8;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(workQueue, block);
}

- (void)setClientName:(id)a3
{
  id v5 = a3;
  id v6 = +[NSXPCConnection currentConnection];
  id v7 = objc_opt_new();
  id v8 = +[NSMutableDictionary dictionaryWithObject:v7 forKey:@"ProxyObjects"];

  [v8 setObject:v5 forKeyedSubscript:@"ClientName"];
  [v6 setUserInfo:v8];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    SEL v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    id v19 = [v6 processIdentifier];
    uint64_t v15 = 45;
    if (isMetaClass) {
      uint64_t v15 = 43;
    }
    v10(6, "%c[%{public}s %{public}s]:%i new XPC connection from pid=%d, name=%{public}@", v15, ClassName, Name, 657, v19, v5);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v16 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = object_getClass(self);
    if (class_isMetaClass(v17)) {
      int v18 = 43;
    }
    else {
      int v18 = 45;
    }
    *(_DWORD *)buf = 67110402;
    int v21 = v18;
    __int16 v22 = 2082;
    long long v23 = object_getClassName(self);
    __int16 v24 = 2082;
    int v25 = sel_getName(a2);
    __int16 v26 = 1024;
    int v27 = 657;
    __int16 v28 = 1024;
    unsigned int v29 = [v6 processIdentifier];
    __int16 v30 = 2114;
    id v31 = v5;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i new XPC connection from pid=%d, name=%{public}@", buf, 0x32u);
  }
}

- (void)clearMultiTagState:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100265188;
  v7[3] = &unk_100302390;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (BOOL)_validateSessionRequest:(id)a3 withConnection:(id)a4
{
  return 1;
}

- (BOOL)_queueNewSession:(id)a3 onConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = [(_NFACHardwareManager *)self _validateSessionRequest:v7 withConnection:v8];
  if (v9)
  {
    [v7 setConnection:v8];
    [v7 setQueue:self];
    [v7 setDriverWrapper:self->_driverWrapper];
    ++self->_sessionCounter;
    [v7 setSessionID:];
    SEL v10 = [v8 NF_userInfo];
    id v11 = [v10 objectForKeyedSubscript:@"ProxyObjects"];
    [v11 addObject:v7];

    SEL v12 = self->_sessions;
    objc_sync_enter(v12);
    [(NSMutableArray *)self->_sessions addObject:v7];
    if ([(NSMutableArray *)self->_sessions count] == (id)1)
    {
      BOOL v13 = +[NFPowerAssertion sharedPowerAssertion];
      [v13 holdPowerAssertion:@"NfcacdSessions"];
    }
    objc_sync_exit(v12);
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v15 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v19 = 45;
      if (isMetaClass) {
        uint64_t v19 = 43;
      }
      v15(3, "%c[%{public}s %{public}s]:%i New session failed validation", v19, ClassName, Name, 694);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v21 = object_getClass(self);
      if (class_isMetaClass(v21)) {
        int v22 = 43;
      }
      else {
        int v22 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v26 = v22;
      __int16 v27 = 2082;
      __int16 v28 = object_getClassName(self);
      __int16 v29 = 2082;
      __int16 v30 = sel_getName(a2);
      __int16 v31 = 1024;
      int v32 = 694;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i New session failed validation", buf, 0x22u);
    }
  }
  return v9;
}

- (void)queueReaderSession:(id)a3 callback:(id)a4
{
  id v7 = (void (**)(id, _NFACReaderSession *, void))a4;
  id v8 = a3;
  BOOL v9 = +[NSXPCConnection currentConnection];
  SEL v10 = NFSharedSignpostLog();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_QUEUE_READER_SESSION", (const char *)&unk_100286819, buf, 2u);
  }

  id v11 = [[_NFACReaderSession alloc] initWithRemoteObject:v8 workQueue:self->_workQueue];
  if ([(_NFACHardwareManager *)self _queueNewSession:v11 onConnection:v9])
  {
    SEL v12 = sub_1001AEFD0();
    [(_NFACReaderSession *)v11 setPowerConsumptionReporter:v12];

    v7[2](v7, v11, 0);
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100265A64;
    block[3] = &unk_100301C68;
    block[4] = self;
    dispatch_async(workQueue, block);
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v15 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v19 = 45;
      if (isMetaClass) {
        uint64_t v19 = 43;
      }
      v15(3, "%c[%{public}s %{public}s]:%i Failed to queue session", v19, ClassName, Name, 728);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v21 = object_getClass(self);
      if (class_isMetaClass(v21)) {
        int v22 = 43;
      }
      else {
        int v22 = 45;
      }
      long long v23 = object_getClassName(self);
      __int16 v24 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v35 = v22;
      __int16 v36 = 2082;
      __int16 v37 = v23;
      __int16 v38 = 2082;
      BOOL v39 = v24;
      __int16 v40 = 1024;
      int v41 = 728;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to queue session", buf, 0x22u);
    }

    id v25 = objc_alloc((Class)NSError);
    int v26 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
    __int16 v27 = +[NSString stringWithUTF8String:"Security Violation"];
    __int16 v33 = v27;
    __int16 v28 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    id v29 = [v25 initWithDomain:v26 code:8 userInfo:v28];
    ((void (**)(id, _NFACReaderSession *, id))v7)[2](v7, 0, v29);
  }
}

- (void)maybeStartNextSession
{
  v3 = self;
  objc_sync_enter(v3);
  BOOL isRunning = v3->_isRunning;
  objc_sync_exit(v3);

  if (!isRunning) {
    return;
  }
  id v5 = v3->_sessions;
  objc_sync_enter(v5);
  if (v3->_systemWillSleep)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(v3);
      if (class_isMetaClass(Class)) {
        uint64_t v8 = 43;
      }
      else {
        uint64_t v8 = 45;
      }
      ClassName = object_getClassName(v3);
      Name = sel_getName(a2);
      Logger(6, "%c[%{public}s %{public}s]:%i System is going to sleep - delaying start of new session", v8, ClassName, Name, 760);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      SEL v12 = object_getClass(v3);
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v87 = v13;
      __int16 v88 = 2082;
      v89 = object_getClassName(v3);
      __int16 v90 = 2082;
      v91 = sel_getName(a2);
      __int16 v92 = 1024;
      int v93 = 760;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i System is going to sleep - delaying start of new session", buf, 0x22u);
    }

    objc_sync_exit(v5);
LABEL_14:

    return;
  }
  if (v3->_currentSession || ![(NSMutableArray *)v3->_sessions count]) {
    goto LABEL_16;
  }
  uint64_t v14 = [(NSMutableArray *)v3->_sessions objectAtIndex:0];
  currentSession = v3->_currentSession;
  v3->_currentSession = (_NFACSession *)v14;

  uint64_t v16 = objc_opt_class();
  if (v16 == objc_opt_class()
    && [(NFACDriverWrapper *)v3->_driverWrapper readerModeProtectionActive])
  {
    int v17 = v3->_currentSession;
    v3->_currentSession = 0;

    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v18 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v18)
    {
      uint64_t v19 = object_getClass(v3);
      if (class_isMetaClass(v19)) {
        uint64_t v20 = 43;
      }
      else {
        uint64_t v20 = 45;
      }
      int v21 = object_getClassName(v3);
      int v22 = sel_getName(a2);
      v18(6, "%c[%{public}s %{public}s]:%i Reader session not dequeued : reader mode protection active", v20, v21, v22, 771);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    long long v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v24 = object_getClass(v3);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v87 = v25;
      __int16 v88 = 2082;
      v89 = object_getClassName(v3);
      __int16 v90 = 2082;
      v91 = sel_getName(a2);
      __int16 v92 = 1024;
      int v93 = 771;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Reader session not dequeued : reader mode protection active", buf, 0x22u);
    }

LABEL_16:
    objc_sync_exit(v5);

    goto LABEL_17;
  }
  [(NSMutableArray *)v3->_sessions removeObjectAtIndex:0];
  objc_sync_exit(v5);

  unsigned int v28 = [(_NFACSession *)v3->_currentSession willStartSession];
  id v29 = v3->_currentSession;
  if (v28)
  {
    [(_NFACSession *)v3->_currentSession didStartSession:0];
  }
  else
  {
    id v48 = objc_alloc((Class)NSError);
    BOOL v49 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v84 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v50 = +[NSString stringWithUTF8String:"Stack Error"];
    v85 = v50;
    v51 = +[NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];
    id v52 = [v48 initWithDomain:v49 code:15 userInfo:v51];
    [(_NFACSession *)v29 didStartSession:v52];

    v53 = v3->_currentSession;
    id v54 = objc_alloc((Class)NSError);
    v55 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v82 = NSLocalizedDescriptionKey;
    v56 = +[NSString stringWithUTF8String:"Stack Error"];
    v83 = v56;
    v57 = +[NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    id v58 = [v54 initWithDomain:v55 code:15 userInfo:v57];
    [(_NFACSession *)v53 didEndSession:v58];
  }
LABEL_17:
  if (!v3->_currentSession)
  {
    if (v3->_runLPCD)
    {
      driverWrapper = v3->_driverWrapper;
      id v5 = +[NFRoutingConfig accessoryReaderWithLPCD];
      id v27 = [(NFACDriverWrapper *)driverWrapper setRouting:v5];
    }
    else if (v3->_runMultiTagDetection)
    {
      basebandMonitor = v3->_basebandMonitor;
      if (basebandMonitor && sub_1001A3BF4(basebandMonitor))
      {
        if (v3->_needsMultiTagRestart)
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          __int16 v31 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v31)
          {
            NSErrorUserInfoKey v32 = object_getClass(v3);
            if (class_isMetaClass(v32)) {
              uint64_t v33 = 43;
            }
            else {
              uint64_t v33 = 45;
            }
            int v34 = object_getClassName(v3);
            int v35 = sel_getName(a2);
            v31(6, "%c[%{public}s %{public}s]:%i Restarting multitag detection", v33, v34, v35, 805);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          __int16 v36 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v37 = object_getClass(v3);
            if (class_isMetaClass(v37)) {
              int v38 = 43;
            }
            else {
              int v38 = 45;
            }
            BOOL v39 = object_getClassName(v3);
            __int16 v40 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            int v87 = v38;
            __int16 v88 = 2082;
            v89 = v39;
            __int16 v90 = 2082;
            v91 = v40;
            __int16 v92 = 1024;
            int v93 = 805;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Restarting multitag detection", buf, 0x22u);
          }

          int v41 = v3->_driverWrapper;
          __int16 v42 = +[NFRoutingConfig none];
          id v43 = [(NFACDriverWrapper *)v41 setRouting:v42];

          v3->_needsMultiTagRestart = 0;
        }
        if (NFProductIsDevBoard()
          && ([(_NFACHardwareManager *)v3 _getDefaults],
              __int16 v44 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v45 = [v44 BOOLForKey:@"forceMultiTagEnabled"],
              v44,
              (v45 & 1) == 0))
        {
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v73 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
          if (v73)
          {
            v74 = object_getClass(v3);
            if (class_isMetaClass(v74)) {
              uint64_t v75 = 43;
            }
            else {
              uint64_t v75 = 45;
            }
            v76 = object_getClassName(v3);
            v77 = sel_getName(a2);
            v73(6, "%c[%{public}s %{public}s]:%i Multitag detection is suppressed on dev boards", v75, v76, v77, 811);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          id v5 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            v78 = object_getClass(v3);
            if (class_isMetaClass(v78)) {
              int v79 = 43;
            }
            else {
              int v79 = 45;
            }
            v80 = object_getClassName(v3);
            v81 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            int v87 = v79;
            __int16 v88 = 2082;
            v89 = v80;
            __int16 v90 = 2082;
            v91 = v81;
            __int16 v92 = 1024;
            int v93 = 811;
            _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Multitag detection is suppressed on dev boards", buf, 0x22u);
          }
        }
        else
        {
          __int16 v46 = v3->_driverWrapper;
          id v5 = +[NFRoutingConfig accessoryMultiTag];
          id v47 = [(NFACDriverWrapper *)v46 setRouting:v5];
        }
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v61 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v61)
        {
          v62 = object_getClass(v3);
          if (class_isMetaClass(v62)) {
            uint64_t v63 = 43;
          }
          else {
            uint64_t v63 = 45;
          }
          v64 = object_getClassName(v3);
          v65 = sel_getName(a2);
          v61(6, "%c[%{public}s %{public}s]:%i Baseband not ready", v63, v64, v65, 799);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v66 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          v67 = object_getClass(v3);
          if (class_isMetaClass(v67)) {
            int v68 = 43;
          }
          else {
            int v68 = 45;
          }
          v69 = object_getClassName(v3);
          v70 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v87 = v68;
          __int16 v88 = 2082;
          v89 = v69;
          __int16 v90 = 2082;
          v91 = v70;
          __int16 v92 = 1024;
          int v93 = 799;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Baseband not ready", buf, 0x22u);
        }

        v71 = v3->_driverWrapper;
        id v5 = +[NFRoutingConfig none];
        id v72 = [(NFACDriverWrapper *)v71 setRouting:v5];
      }
    }
    else
    {
      v59 = v3->_driverWrapper;
      id v5 = +[NFRoutingConfig none];
      id v60 = [(NFACDriverWrapper *)v59 setRouting:v5];
    }
    goto LABEL_14;
  }
}

- (void)shutdownAndLeaveHWEnabled:(BOOL)a3 callback:(id)a4
{
  id v7 = a4;
  uint64_t v8 = NFSharedSignpostLog();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_SHUTDOWN", (const char *)&unk_100286819, buf, 2u);
  }

  if (NFIsInternalBuild())
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      SEL v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v10(6, "%c[%{public}s %{public}s]:%i ", v14, ClassName, Name, 833);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = object_getClass(self);
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      int v18 = object_getClassName(self);
      uint64_t v19 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v32 = v17;
      __int16 v33 = 2082;
      int v34 = v18;
      __int16 v35 = 2082;
      __int16 v36 = v19;
      __int16 v37 = 1024;
      int v38 = 833;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
    }

    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10026672C;
    block[3] = &unk_100302E40;
    block[4] = self;
    SEL v29 = a2;
    id v28 = v7;
    BOOL v30 = a3;
    dispatch_async(workQueue, block);
  }
  else
  {
    id v21 = objc_alloc((Class)NSError);
    int v22 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
    long long v23 = +[NSString stringWithUTF8String:"Feature Not Supported"];
    __int16 v40 = v23;
    __int16 v24 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    id v25 = [v21 initWithDomain:v22 code:14 userInfo:v24];
    (*((void (**)(id, id))v7 + 2))(v7, v25);
  }
}

- (void)dequeueSession:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100266D1C;
  v7[3] = &unk_100301CB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)_dequeueSession:(id)a3 startNextSession:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (_NFACSession *)a3;
  id v8 = NFSharedSignpostLog();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_DEQUEUE_SESSION", (const char *)&unk_100286819, buf, 2u);
  }

  BOOL v9 = self;
  objc_sync_enter(v9);
  BOOL v10 = !v9->_isRunning;
  objc_sync_exit(v9);

  if (!v10)
  {
    id v11 = v9->_sessions;
    objc_sync_enter(v11);
    currentSession = v9->_currentSession;
    if (currentSession)
    {
      BOOL v13 = 1;
    }
    else
    {
      BOOL v13 = [(NSMutableArray *)v9->_sessions count] != 0;
      currentSession = v9->_currentSession;
    }
    if (currentSession == v7)
    {
      id v19 = objc_alloc((Class)NSError);
      uint64_t v20 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
      id v21 = +[NSString stringWithUTF8String:"Aborted"];
      id v54 = v21;
      int v22 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      id v23 = [v19 initWithDomain:v20 code:3 userInfo:v22];
      [(_NFACSession *)v7 didEndSession:v23];

      __int16 v24 = v9->_currentSession;
      v9->_currentSession = 0;

      if (v9->_systemWillSleep)
      {
        id v25 = NFSharedSignpostLog();
        if (os_signpost_enabled(v25))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "_dequeueSession: allowing to sleep", (const char *)&unk_100286819, buf, 2u);
        }

        [(NFPowerObserver *)v9->_powerObserver allowSleep];
      }
    }
    else
    {
      if ([(NSMutableArray *)v9->_sessions containsObject:v7])
      {
        [(NSMutableArray *)v9->_sessions removeObject:v7];
        id v14 = objc_alloc((Class)NSError);
        uint64_t v15 = +[NSString stringWithUTF8String:"nfcd"];
        NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
        uint64_t v16 = +[NSString stringWithUTF8String:"Aborted"];
        id v52 = v16;
        int v17 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
        id v18 = [v14 initWithDomain:v15 code:3 userInfo:v17];
        [(_NFACSession *)v7 didEndSession:v18];
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger)
        {
          Class = object_getClass(v9);
          if (class_isMetaClass(Class)) {
            uint64_t v28 = 43;
          }
          else {
            uint64_t v28 = 45;
          }
          ClassName = object_getClassName(v9);
          Name = sel_getName(a2);
          Logger(5, "%c[%{public}s %{public}s]:%i Session not found in queue %@", v28, ClassName, Name, 891, v7);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v15 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v31 = object_getClass(v9);
          if (class_isMetaClass(v31)) {
            int v32 = 43;
          }
          else {
            int v32 = 45;
          }
          __int16 v33 = object_getClassName(v9);
          int v34 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          int v42 = v32;
          __int16 v43 = 2082;
          __int16 v44 = v33;
          __int16 v45 = 2082;
          __int16 v46 = v34;
          __int16 v47 = 1024;
          int v48 = 891;
          __int16 v49 = 2112;
          NSErrorUserInfoKey v50 = v7;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session not found in queue %@", buf, 0x2Cu);
        }
      }
    }
    [(_NFACSession *)v7 releaseRemoteObject];
    __int16 v35 = [(_NFACSession *)v7 connection];
    __int16 v36 = [v35 NF_userInfo];
    __int16 v37 = [v36 objectForKeyedSubscript:@"ProxyObjects"];
    [v37 removeObject:v7];

    if (v13 && !v9->_currentSession && ![(NSMutableArray *)v9->_sessions count])
    {
      int v38 = +[NFPowerAssertion sharedPowerAssertion];
      [v38 releasePowerAssertion:@"NfcacdSessions"];
    }
    objc_sync_exit(v11);

    if (v4)
    {
      workQueue = v9->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100267290;
      block[3] = &unk_100301C68;
      block[4] = v9;
      dispatch_async(workQueue, block);
    }
  }
}

- (BOOL)_loadHWInfo
{
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1002674A4;
  v18[3] = &unk_100308928;
  v18[4] = self;
  v18[5] = a2;
  BOOL v4 = [(_NFACHardwareManager *)self _executeWithDriverSessionSync:@"Load HW Info" block:v18];
  if (v4)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v9 = 45;
      if (isMetaClass) {
        uint64_t v9 = 43;
      }
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 934, v4);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = object_getClass(self);
      if (class_isMetaClass(v11)) {
        int v12 = 43;
      }
      else {
        int v12 = 45;
      }
      BOOL v13 = object_getClassName(self);
      id v14 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v20 = v12;
      __int16 v21 = 2082;
      int v22 = v13;
      __int16 v23 = 2082;
      __int16 v24 = v14;
      __int16 v25 = 1024;
      int v26 = 934;
      __int16 v27 = 2114;
      uint64_t v28 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  return v4 == 0;
}

- (unint64_t)_loadHW
{
  BOOL v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_LOAD_HW", (const char *)&unk_100286819, buf, 2u);
  }

  driverWrapper = self->_driverWrapper;
  id v6 = [(_NFACHardwareManager *)self _readDriverSettings];
  [(NFACDriverWrapper *)driverWrapper configureDriverSettings:v6];

  if (([(NFPowerObserver *)self->_powerObserver registerForEvents] & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i Failed to register for power events", v12, ClassName, Name, 952);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = object_getClass(self);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      uint64_t v16 = object_getClassName(self);
      int v17 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v61 = v15;
      __int16 v62 = 2082;
      uint64_t v63 = v16;
      __int16 v64 = 2082;
      v65 = v17;
      __int16 v66 = 1024;
      int v67 = 952;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to register for power events", buf, 0x22u);
    }
  }
  if (!self->_preferenceObserver)
  {
    id v18 = (NFPreferenceObserver *)objc_opt_new();
    preferenceObserver = self->_preferenceObserver;
    self->_preferenceObserver = v18;

    int v20 = self->_preferenceObserver;
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100267D74;
    v59[3] = &unk_100301C68;
    v59[4] = self;
    [(NFPreferenceObserver *)v20 start:v59];
  }
  unint64_t v21 = [(NFACDriverWrapper *)self->_driverWrapper openSession:@"Load HW"];
  if (v21 != 1)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v27 = NFLogGetLogger();
    if (v27)
    {
      uint64_t v28 = (void (*)(uint64_t, const char *, ...))v27;
      SEL v29 = object_getClass(self);
      BOOL v30 = class_isMetaClass(v29);
      id v52 = object_getClassName(self);
      v55 = sel_getName(a2);
      uint64_t v31 = 45;
      if (v30) {
        uint64_t v31 = 43;
      }
      v28(4, "%c[%{public}s %{public}s]:%i Failed to open session; hwState=%lu", v31, v52, v55, 964, v21);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v32 = object_getClass(self);
      if (class_isMetaClass(v32)) {
        int v33 = 43;
      }
      else {
        int v33 = 45;
      }
      int v34 = object_getClassName(self);
      __int16 v35 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v61 = v33;
      __int16 v62 = 2082;
      uint64_t v63 = v34;
      __int16 v64 = 2082;
      v65 = v35;
      __int16 v66 = 1024;
      int v67 = 964;
      __int16 v68 = 2048;
      unint64_t v69 = v21;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to open session; hwState=%lu",
        buf,
        0x2Cu);
    }
    goto LABEL_48;
  }
  if ([(_NFACHardwareManager *)self _loadHWInfo])
  {
    uint64_t v22 = sub_1001ABC30((uint64_t)NFPowerTrackingConsumer, [(NFHardwareControllerInfo *)self->_controllerInfo siliconName]);
    __int16 v23 = v22;
    if (v22) {
      *(unsigned char *)(v22 + 16) = 0;
    }
    __int16 v24 = sub_1001AEFD0();
    sub_1001AED00((uint64_t)v24, v23);

    if (self->_runLPCD)
    {
      if ((id)[(NFACDriverWrapper *)self->_driverWrapper openSession:@"LpcdSession"] == (id)1)
      {
        __int16 v25 = (OS_os_transaction *)os_transaction_create();
        lpcdTransaction = self->_lpcdTransaction;
        self->_lpcdTransaction = v25;

        [(_NFACHardwareManager *)self maybeStartNextSession];
      }
    }
    else if (self->_runMultiTagDetection {
           && (id)[(NFACDriverWrapper *)self->_driverWrapper openSession:@"MultiTagSession"] == (id)1)
    }
    {
      __int16 v36 = (OS_os_transaction *)os_transaction_create();
      multiTagTransaction = self->_multiTagTransaction;
      self->_multiTagTransaction = v36;

      char v58 = 0;
      int v38 = self->_driverWrapper;
      id v57 = 0;
      NSErrorUserInfoKey v39 = [(NFACDriverWrapper *)v38 queryMultiTagState:&v58 error:&v57];
      id v40 = v57;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v41 = NFLogGetLogger();
      if (v41)
      {
        int v42 = (void (*)(uint64_t, const char *, ...))v41;
        __int16 v43 = object_getClass(self);
        BOOL v44 = class_isMetaClass(v43);
        NSErrorUserInfoKey v53 = object_getClassName(self);
        v56 = sel_getName(a2);
        uint64_t v45 = 45;
        if (v44) {
          uint64_t v45 = 43;
        }
        v42(6, "%c[%{public}s %{public}s]:%i detectedTags; %{public}@", v45, v53, v56, 994, v39);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v46 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v47 = object_getClass(self);
        if (class_isMetaClass(v47)) {
          int v48 = 43;
        }
        else {
          int v48 = 45;
        }
        __int16 v49 = object_getClassName(self);
        NSErrorUserInfoKey v50 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v61 = v48;
        __int16 v62 = 2082;
        uint64_t v63 = v49;
        __int16 v64 = 2082;
        v65 = v50;
        __int16 v66 = 1024;
        int v67 = 994;
        __int16 v68 = 2114;
        unint64_t v69 = (unint64_t)v39;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i detectedTags; %{public}@",
          buf,
          0x2Cu);
      }

      if (v58) {
        objc_storeStrong((id *)&self->_lastDetectedTags, v39);
      }
      [(_NFACHardwareManager *)self maybeStartNextSession];
    }
    sub_1001A3578(self->_basebandMonitor, self);
    [(NFACDriverWrapper *)self->_driverWrapper closeSession:@"Load HW"];
LABEL_48:

    return v21;
  }
  return 2;
}

- (void)didCloseXPCConnection:(id)a3
{
  id v5 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v12 = [v5 NF_userInfo];
    BOOL v13 = [v12 objectForKeyedSubscript:@"ClientName"];
    uint64_t v14 = 45;
    if (isMetaClass) {
      uint64_t v14 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i Removing XPC connection for %{public}@ - %{public}@", v14, ClassName, Name, 1012, v13, v5);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = object_getClass(self);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    id v18 = object_getClassName(self);
    id v19 = sel_getName(a2);
    int v20 = [v5 NF_userInfo];
    unint64_t v21 = [v20 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110402;
    int v29 = v17;
    __int16 v30 = 2082;
    uint64_t v31 = v18;
    __int16 v32 = 2082;
    int v33 = v19;
    __int16 v34 = 1024;
    int v35 = 1012;
    __int16 v36 = 2114;
    __int16 v37 = v21;
    __int16 v38 = 2114;
    id v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Removing XPC connection for %{public}@ - %{public}@", buf, 0x36u);
  }
  uint64_t v22 = NFSharedSignpostLog();
  if (os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_XPC_CONNECTION_CLOSE", (const char *)&unk_100286819, buf, 2u);
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100268050;
  block[3] = &unk_100301C90;
  id v26 = v5;
  SEL v27 = a2;
  block[4] = self;
  id v24 = v5;
  dispatch_async(workQueue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v49 = a3;
  id v7 = a4;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v9 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v13 = 45;
    if (isMetaClass) {
      uint64_t v13 = 43;
    }
    v9(6, "%c[%{public}s %{public}s]:%i ", v13, ClassName, Name, 1033);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    LODWORD(buf) = 67109890;
    HIDWORD(buf) = v16;
    __int16 v60 = 2082;
    int v61 = object_getClassName(self);
    __int16 v62 = 2082;
    uint64_t v63 = sel_getName(a2);
    __int16 v64 = 1024;
    int v65 = 1033;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", (uint8_t *)&buf, 0x22u);
  }

  int v17 = NFSharedSignpostLog();
  if (os_signpost_enabled(v17))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_XPC_CONNECT", (const char *)&unk_100286819, (uint8_t *)&buf, 2u);
  }

  id v18 = [v7 valueForEntitlement:@"com.apple.nfcacd.hwmanager"];
  if (v18)
  {
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x2020000000;
    uint64_t v58 = 0;
    id v19 = self;
    objc_sync_enter(v19);
    v56[3] = v19->_hardwareState;
    objc_sync_exit(v19);

    if ((v56[3] | 2) == 2)
    {
      workQueue = v19->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100268B68;
      block[3] = &unk_100301EB8;
      block[4] = v19;
      void block[5] = &v55;
      dispatch_sync(workQueue, block);
      if (v56[3] != 1)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        unint64_t v21 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (v21)
        {
          uint64_t v22 = object_getClass(v19);
          if (class_isMetaClass(v22)) {
            uint64_t v23 = 43;
          }
          else {
            uint64_t v23 = 45;
          }
          id v24 = object_getClassName(v19);
          __int16 v25 = sel_getName(a2);
          v21(4, "%c[%{public}s %{public}s]:%i Hardware not available : %lu", v23, v24, v25, 1056, v19->_hardwareState);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v26 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          SEL v27 = object_getClass(v19);
          if (class_isMetaClass(v27)) {
            int v28 = 43;
          }
          else {
            int v28 = 45;
          }
          int v29 = object_getClassName(v19);
          __int16 v30 = sel_getName(a2);
          unint64_t hardwareState = v19->_hardwareState;
          LODWORD(buf) = 67110146;
          HIDWORD(buf) = v28;
          __int16 v60 = 2082;
          int v61 = v29;
          __int16 v62 = 2082;
          uint64_t v63 = v30;
          __int16 v64 = 1024;
          int v65 = 1056;
          __int16 v66 = 2048;
          *(void *)int v67 = hardwareState;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Hardware not available : %lu", (uint8_t *)&buf, 0x2Cu);
        }
      }
      __int16 v32 = v19;
      objc_sync_enter(v32);
      v19->_unint64_t hardwareState = v56[3];
      objc_sync_exit(v32);
    }
    int v33 = sub_1001858B4();
    [v7 setRemoteObjectInterface:v33];

    __int16 v34 = sub_10018570C();
    [v7 setExportedInterface:v34];

    [v7 setExportedObject:v19];
    objc_initWeak(&buf, v7);
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100268C4C;
    v52[3] = &unk_100308950;
    v52[4] = v19;
    objc_copyWeak(&v53, &buf);
    [v7 setInvalidationHandler:v52];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100268CA0;
    v50[3] = &unk_100308950;
    v50[4] = v19;
    objc_copyWeak(&v51, &buf);
    [v7 setInterruptionHandler:v50];
    [v7 _setQueue:v19->_xpcConnectionQueue];
    int v35 = v19->_xpcConnections;
    objc_sync_enter(v35);
    [(NSMutableArray *)v19->_xpcConnections addObject:v7];
    objc_sync_exit(v35);

    [v7 resume];
    objc_destroyWeak(&v51);
    objc_destroyWeak(&v53);
    objc_destroyWeak(&buf);
    _Block_object_dispose(&v55, 8);
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v36 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v36)
    {
      __int16 v37 = object_getClass(self);
      if (class_isMetaClass(v37)) {
        uint64_t v38 = 43;
      }
      else {
        uint64_t v38 = 45;
      }
      id v39 = object_getClassName(self);
      id v40 = sel_getName(a2);
      v36(3, "%c[%{public}s %{public}s]:%i client; pid=%d is missing entitlement :%{public}@",
        v38,
        v39,
        v40,
        1037,
        [v7 processIdentifier],
        @"com.apple.nfcacd.hwmanager");
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v41 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      int v42 = object_getClass(self);
      if (class_isMetaClass(v42)) {
        int v43 = 43;
      }
      else {
        int v43 = 45;
      }
      BOOL v44 = object_getClassName(self);
      uint64_t v45 = sel_getName(a2);
      unsigned int v46 = [v7 processIdentifier];
      LODWORD(buf) = 67110402;
      HIDWORD(buf) = v43;
      __int16 v60 = 2082;
      int v61 = v44;
      __int16 v62 = 2082;
      uint64_t v63 = v45;
      __int16 v64 = 1024;
      int v65 = 1037;
      __int16 v66 = 1024;
      *(_DWORD *)int v67 = v46;
      *(_WORD *)&v67[4] = 2114;
      *(void *)&v67[6] = @"com.apple.nfcacd.hwmanager";
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i client; pid=%d is missing entitlement :%{public}@",
        (uint8_t *)&buf,
        0x32u);
    }
  }
  return v18 != 0;
}

- (void)handleReaderBurnoutTimer
{
  BOOL v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_READER_TIMER", (const char *)&unk_100286819, buf, 2u);
  }

  workQueue = self->_workQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100268DD0;
  v6[3] = &unk_100301C40;
  v6[4] = self;
  v6[5] = a2;
  dispatch_async(workQueue, v6);
}

- (void)handleReaderBurnoutCleared
{
  BOOL v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_READER_TIMER_CLEARED", (const char *)&unk_100286819, buf, 2u);
  }

  workQueue = self->_workQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100269080;
  v6[3] = &unk_100301C40;
  v6[4] = self;
  v6[5] = a2;
  dispatch_sync(workQueue, v6);
}

- (void)handleRestartDiscovery
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 1117);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  BOOL v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = object_getClass(self);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)id buf = 67109890;
    int v15 = v12;
    __int16 v16 = 2082;
    int v17 = object_getClassName(self);
    __int16 v18 = 2082;
    id v19 = sel_getName(a2);
    __int16 v20 = 1024;
    int v21 = 1117;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }
}

- (void)handleHardwareReset:(const char *)a3
{
  id v5 = NFSharedSignpostLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_HW_RESET", (const char *)&unk_100286819, v6, 2u);
  }

  [(NFACDriverWrapper *)self->_driverWrapper simulateCrash:57005 reason:a3];
}

- (void)handlePLLUnlock
{
  BOOL v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_PLL_UNLOCK", (const char *)&unk_100286819, buf, 2u);
  }

  workQueue = self->_workQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100269520;
  v6[3] = &unk_100301C40;
  v6[4] = self;
  v6[5] = a2;
  dispatch_async(workQueue, v6);
}

- (void)handleStackUnload
{
  BOOL v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_STACK_UNLOAD", (const char *)&unk_100286819, buf, 2u);
  }

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 1166);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(self);
    int v15 = sel_getName(a2);
    *(_DWORD *)id buf = 67109890;
    int v18 = v13;
    __int16 v19 = 2082;
    __int16 v20 = v14;
    __int16 v21 = 2082;
    uint64_t v22 = v15;
    __int16 v23 = 1024;
    int v24 = 1166;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }
}

- (void)handleStackLoad
{
  BOOL v4 = NFSharedSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NFCACD_STACK_LOAD", (const char *)&unk_100286819, buf, 2u);
  }

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 1172);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(self);
    int v15 = sel_getName(a2);
    *(_DWORD *)id buf = 67109890;
    int v18 = v13;
    __int16 v19 = 2082;
    __int16 v20 = v14;
    __int16 v21 = 2082;
    uint64_t v22 = v15;
    __int16 v23 = 1024;
    int v24 = 1172;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }
}

- (void)handleRemoteTagsDetected:(id)a3
{
  id v5 = a3;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100269D88;
  block[3] = &unk_100301C90;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(workQueue, block);
}

- (void)handleMultiTagStateChanged:(id)a3 rfError:(BOOL)a4
{
  id v7 = a3;
  workQueue = self->_workQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10026A60C;
  v10[3] = &unk_100304998;
  id v11 = v7;
  SEL v12 = a2;
  v10[4] = self;
  BOOL v13 = a4;
  id v9 = v7;
  dispatch_async(workQueue, v10);
}

- (void)preferencesDidChange
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = nullsub_9;
  block[3] = &unk_100301C68;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (id)_readDriverSettings
{
  BOOL v4 = objc_opt_new();
  id v5 = [(_NFACHardwareManager *)self _getDefaults];
  [v5 synchronize];
  self->_runLPCD = [v5 BOOLForKey:@"LpcdAlwaysOn"];
  self->_runMultiTagDetection = [v5 BOOLForKey:@"MultiTagDetectionOn"];
  if ([v5 BOOLForKey:@"LogNCI"]) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 0;
  }
  if ([v5 BOOLForKey:@"LogAPI"]) {
    v6 |= 8uLL;
  }
  if ([v5 BOOLForKey:@"LogAPDU"]) {
    v6 |= 0x10uLL;
  }
  if ([v5 BOOLForKey:@"LogLPCD"]) {
    v6 |= 0x2000uLL;
  }
  if ([v5 BOOLForKey:@"MultiTagDebug"]) {
    v6 |= 0x800000uLL;
  }
  id v7 = [v5 integerForKey:@"LogRF"];
  uint64_t v8 = v6 | 1;
  uint64_t v9 = v6 | 2;
  if (v7 != (id)1) {
    uint64_t v9 = v6;
  }
  if (v7 != (id)2) {
    uint64_t v8 = v9;
  }
  if (v7 == (id)4) {
    unint64_t v10 = v6 | 3;
  }
  else {
    unint64_t v10 = v8;
  }
  id v11 = objc_alloc((Class)NSDictionary);
  SEL v12 = +[NSString stringWithUTF8String:"/Library/Preferences/Logging/Subsystems/com.apple.nfcac.plist"];
  id v13 = [v11 initWithContentsOfFile:v12];

  if (v13)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v15 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v19 = 45;
      if (isMetaClass) {
        uint64_t v19 = 43;
      }
      v15(6, "%c[%{public}s %{public}s]:%i Loading managed profile settings", v19, ClassName, Name, 1304);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = object_getClass(self);
      if (class_isMetaClass(v21)) {
        int v22 = 43;
      }
      else {
        int v22 = 45;
      }
      *(_DWORD *)id buf = 67109890;
      int v119 = v22;
      __int16 v120 = 2082;
      v121 = object_getClassName(self);
      __int16 v122 = 2082;
      v123 = sel_getName(a2);
      __int16 v124 = 1024;
      int v125 = 1304;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Loading managed profile settings", buf, 0x22u);
    }

    __int16 v23 = [v13 objectForKey:@"LpcdAlwaysOn"];

    if (v23)
    {
      int v24 = [v13 objectForKey:@"LpcdAlwaysOn"];
      unsigned int v25 = [v24 BOOLValue];

      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v26 = NFLogGetLogger();
      if (v26)
      {
        SEL v27 = (void (*)(uint64_t, const char *, ...))v26;
        int v28 = object_getClass(self);
        BOOL v29 = class_isMetaClass(v28);
        v107 = object_getClassName(self);
        v113 = sel_getName(a2);
        uint64_t v30 = 45;
        if (v29) {
          uint64_t v30 = 43;
        }
        v27(5, "%c[%{public}s %{public}s]:%i Overriding pref settings for LpcdAlwaysOn with managed profile: %d", v30, v107, v113, 1308, v25);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v31 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v32 = object_getClass(self);
        if (class_isMetaClass(v32)) {
          int v33 = 43;
        }
        else {
          int v33 = 45;
        }
        __int16 v34 = object_getClassName(self);
        int v35 = sel_getName(a2);
        *(_DWORD *)id buf = 67110146;
        int v119 = v33;
        __int16 v120 = 2082;
        v121 = v34;
        __int16 v122 = 2082;
        v123 = v35;
        __int16 v124 = 1024;
        int v125 = 1308;
        __int16 v126 = 1024;
        unsigned int v127 = v25;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Overriding pref settings for LpcdAlwaysOn with managed profile: %d", buf, 0x28u);
      }

      self->_runLPCD = v25;
    }
    __int16 v36 = [v13 objectForKey:@"LogAPDU"];

    if (v36)
    {
      __int16 v37 = [v13 objectForKey:@"LogAPDU"];
      unsigned int v38 = [v37 BOOLValue];

      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v39 = NFLogGetLogger();
      if (v39)
      {
        id v40 = (void (*)(uint64_t, const char *, ...))v39;
        uint64_t v41 = object_getClass(self);
        BOOL v42 = class_isMetaClass(v41);
        v108 = object_getClassName(self);
        v114 = sel_getName(a2);
        uint64_t v43 = 45;
        if (v42) {
          uint64_t v43 = 43;
        }
        v40(5, "%c[%{public}s %{public}s]:%i Overriding pref settings for LogAPDU with managed profile: %d", v43, v108, v114, 1313, v38);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      BOOL v44 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = object_getClass(self);
        if (class_isMetaClass(v45)) {
          int v46 = 43;
        }
        else {
          int v46 = 45;
        }
        __int16 v47 = object_getClassName(self);
        int v48 = sel_getName(a2);
        *(_DWORD *)id buf = 67110146;
        int v119 = v46;
        __int16 v120 = 2082;
        v121 = v47;
        __int16 v122 = 2082;
        v123 = v48;
        __int16 v124 = 1024;
        int v125 = 1313;
        __int16 v126 = 1024;
        unsigned int v127 = v38;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Overriding pref settings for LogAPDU with managed profile: %d", buf, 0x28u);
      }

      uint64_t v49 = 16;
      if (!v38) {
        uint64_t v49 = 0;
      }
      unint64_t v10 = v49 | v10 & 0xFFFFFFFFFFFFFFEFLL;
    }
    NSErrorUserInfoKey v50 = [v13 objectForKey:@"LogAPI"];

    if (v50)
    {
      id v51 = [v13 objectForKey:@"LogAPI"];
      unsigned int v52 = [v51 BOOLValue];

      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v53 = NFLogGetLogger();
      if (v53)
      {
        id v54 = (void (*)(uint64_t, const char *, ...))v53;
        uint64_t v55 = object_getClass(self);
        BOOL v56 = class_isMetaClass(v55);
        v109 = object_getClassName(self);
        v115 = sel_getName(a2);
        uint64_t v57 = 45;
        if (v56) {
          uint64_t v57 = 43;
        }
        v54(5, "%c[%{public}s %{public}s]:%i Overriding pref settings for LogAPI with managed profile: %d", v57, v109, v115, 1319, v52);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v58 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = object_getClass(self);
        if (class_isMetaClass(v59)) {
          int v60 = 43;
        }
        else {
          int v60 = 45;
        }
        int v61 = object_getClassName(self);
        __int16 v62 = sel_getName(a2);
        *(_DWORD *)id buf = 67110146;
        int v119 = v60;
        __int16 v120 = 2082;
        v121 = v61;
        __int16 v122 = 2082;
        v123 = v62;
        __int16 v124 = 1024;
        int v125 = 1319;
        __int16 v126 = 1024;
        unsigned int v127 = v52;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Overriding pref settings for LogAPI with managed profile: %d", buf, 0x28u);
      }

      uint64_t v63 = 8;
      if (!v52) {
        uint64_t v63 = 0;
      }
      unint64_t v10 = v63 | v10 & 0xFFFFFFFFFFFFFFF7;
    }
    __int16 v64 = [v13 objectForKey:@"LogNCI"];

    if (v64)
    {
      int v65 = [v13 objectForKey:@"LogNCI"];
      unsigned int v66 = [v65 BOOLValue];

      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v67 = NFLogGetLogger();
      if (v67)
      {
        __int16 v68 = (void (*)(uint64_t, const char *, ...))v67;
        unint64_t v69 = object_getClass(self);
        BOOL v70 = class_isMetaClass(v69);
        v110 = object_getClassName(self);
        v116 = sel_getName(a2);
        uint64_t v71 = 45;
        if (v70) {
          uint64_t v71 = 43;
        }
        v68(5, "%c[%{public}s %{public}s]:%i Overriding pref settings with LogNCI managed profile: %d", v71, v110, v116, 1325, v66);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v72 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        v73 = object_getClass(self);
        if (class_isMetaClass(v73)) {
          int v74 = 43;
        }
        else {
          int v74 = 45;
        }
        uint64_t v75 = object_getClassName(self);
        v76 = sel_getName(a2);
        *(_DWORD *)id buf = 67110146;
        int v119 = v74;
        __int16 v120 = 2082;
        v121 = v75;
        __int16 v122 = 2082;
        v123 = v76;
        __int16 v124 = 1024;
        int v125 = 1325;
        __int16 v126 = 1024;
        unsigned int v127 = v66;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Overriding pref settings with LogNCI managed profile: %d", buf, 0x28u);
      }

      uint64_t v77 = 4;
      if (!v66) {
        uint64_t v77 = 0;
      }
      unint64_t v10 = v77 | v10 & 0xFFFFFFFFFFFFFFFBLL;
    }
    v78 = [v13 objectForKey:@"LogRF"];

    if (v78)
    {
      int v79 = [v13 objectForKey:@"LogRF"];
      id v80 = [v79 intValue];

      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v81 = NFLogGetLogger();
      if (v81)
      {
        NSErrorUserInfoKey v82 = (void (*)(uint64_t, const char *, ...))v81;
        v83 = object_getClass(self);
        BOOL v84 = class_isMetaClass(v83);
        v111 = object_getClassName(self);
        v117 = sel_getName(a2);
        uint64_t v85 = 45;
        if (v84) {
          uint64_t v85 = 43;
        }
        v82(5, "%c[%{public}s %{public}s]:%i Overriding pref settings with LogRF managed profile: 0x%04x", v85, v111, v117, 1331, v80);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v86 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      {
        int v87 = object_getClass(self);
        if (class_isMetaClass(v87)) {
          int v88 = 43;
        }
        else {
          int v88 = 45;
        }
        v89 = object_getClassName(self);
        __int16 v90 = sel_getName(a2);
        *(_DWORD *)id buf = 67110146;
        int v119 = v88;
        __int16 v120 = 2082;
        v121 = v89;
        __int16 v122 = 2082;
        v123 = v90;
        __int16 v124 = 1024;
        int v125 = 1331;
        __int16 v126 = 1024;
        unsigned int v127 = v80;
        _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Overriding pref settings with LogRF managed profile: 0x%04x", buf, 0x28u);
      }

      unint64_t v91 = v10 & 0xFFFFFFFFFFFFFFFCLL;
      if (v80 == 1) {
        unint64_t v91 = v10 & 0xFFFFFFFFFFFFFFFCLL | 2;
      }
      if (v80 == 2) {
        unint64_t v91 = v10 & 0xFFFFFFFFFFFFFFFCLL | 1;
      }
      if (v80 == 4) {
        v10 |= 3uLL;
      }
      else {
        unint64_t v10 = v91;
      }
    }
  }
  uint64_t v92 = (uint64_t)[v5 integerForKey:@"PollingPeriod"];
  uint64_t v93 = v92 & ~(v92 >> 63);
  v94 = +[NSNumber numberWithUnsignedLongLong:v10];
  [v4 setObject:v94 forKeyedSubscript:@"flags"];

  v95 = +[NSNumber numberWithInteger:v93];
  [v4 setObject:v95 forKeyedSubscript:@"pollPeriod"];

  uint64_t v96 = (uint64_t)[v5 integerForKey:@"MultiTagPollingPeriod"];
  v97 = +[NSNumber numberWithInteger:v96 & ~(v96 >> 63)];
  [v4 setObject:v97 forKeyedSubscript:@"multiTagPollPeriod"];

  uint64_t v98 = (uint64_t)[v5 integerForKey:@"MultiTagPollingRetries"];
  v99 = +[NSNumber numberWithInteger:v98 & ~(v98 >> 63)];
  [v4 setObject:v99 forKeyedSubscript:@"multiTagPollRetries"];

  uint64_t v100 = (uint64_t)[v5 integerForKey:@"NTAG5DataRate"];
  v101 = +[NSNumber numberWithInteger:v100 & ~(v100 >> 63)];
  [v4 setObject:v101 forKeyedSubscript:@"ntag5DataRate"];

  uint64_t v102 = (uint64_t)[v5 integerForKey:@"TypeATagDataRate"];
  v103 = +[NSNumber numberWithInteger:v102 & ~(v102 >> 63)];
  [v4 setObject:v103 forKeyedSubscript:@"typeATagDataRate"];

  uint64_t v104 = (uint64_t)[v5 integerForKey:@"NTAG5T1"];
  v105 = +[NSNumber numberWithInteger:v104 & ~(v104 >> 63)];
  [v4 setObject:v105 forKeyedSubscript:@"ntag5T1"];

  return v4;
}

- (void)isHWSupported:(id)a3
{
  unint64_t hardwareState = self->_hardwareState;
  if (hardwareState < 4) {
    uint64_t v4 = (hardwareState + 1);
  }
  else {
    uint64_t v4 = 0;
  }
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v4);
}

- (void)triggerDelayedWake:(unsigned __int8)a3 callback:(id)a4
{
  id v7 = a4;
  workQueue = self->_workQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10026B89C;
  v10[3] = &unk_100302E40;
  id v11 = v7;
  SEL v12 = a2;
  v10[4] = self;
  unsigned __int8 v13 = a3;
  id v9 = v7;
  dispatch_async(workQueue, v10);
}

- (void)pushSignedRF:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026BE7C;
  block[3] = &unk_100304588;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)_sync_pushSignedRF:(id)a3 callback:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10026BF68;
  v10[3] = &unk_100308978;
  id v11 = a3;
  SEL v12 = a2;
  v10[4] = self;
  id v7 = v11;
  uint64_t v8 = (void (**)(id, void *))a4;
  id v9 = [(_NFACHardwareManager *)self _executeWithDriverSessionSync:@"Push RF" block:v10];
  v8[2](v8, v9);
}

- (void)basebandStateChanged:(BOOL)a3
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10026C2D4;
  block[3] = &unk_1003089A0;
  block[4] = self;
  void block[5] = a2;
  BOOL v5 = a3;
  dispatch_async(workQueue, block);
}

- (os_state_data_s)dumpState
{
  id v4 = objc_alloc((Class)NSMutableDictionary);
  BOOL v5 = [(_NFACHardwareManager *)self _getInfo];
  id v6 = [v4 initWithDictionary:v5];

  id v7 = [(NFACDriverWrapper *)self->_driverWrapper state];
  [v6 setObject:v7 forKeyedSubscript:@"driverwrapperState"];

  id v26 = 0;
  uint64_t v8 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:200 options:0 error:&v26];
  id v9 = v26;
  if (v9)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v11(3, "%c[%{public}s %{public}s]:%i Failed to serialize state dump: %{public}@", v14, ClassName, Name, 1484, v9);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = object_getClass(self);
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      int v18 = object_getClassName(self);
      uint64_t v19 = sel_getName(a2);
      *(_DWORD *)id buf = 67110146;
      int v28 = v17;
      __int16 v29 = 2082;
      uint64_t v30 = v18;
      __int16 v31 = 2082;
      __int16 v32 = v19;
      __int16 v33 = 1024;
      int v34 = 1484;
      __int16 v35 = 2114;
      id v36 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to serialize state dump: %{public}@", buf, 0x2Cu);
    }
  }
  id v20 = [v8 length];
  __int16 v21 = (os_state_data_s *)malloc_type_calloc(1uLL, (size_t)v20 + 200, 0x7747207EuLL);
  v21->var0 = 1;
  v21->var1.var1 = v20;
  __strlcpy_chk();
  id v22 = v8;
  memcpy(v21->var4, [v22 bytes], (size_t)v20);

  return v21;
}

- (BOOL)isWalletAttached
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_lastDetectedTags;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v6, "silentType", (void)v10) == 3)
        {
          id v7 = [v6 tagID];
          uint64_t v8 = (unsigned __int8 *)[v7 bytes];

          if (v8)
          {
            if (*v8 - 87 < 2)
            {
              LOBYTE(v3) = 1;
              goto LABEL_13;
            }
          }
        }
      }
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (char)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulingDailyUpdating, 0);
  objc_storeStrong((id *)&self->_accessorydEventPublisher, 0);
  objc_storeStrong((id *)&self->_basebandMonitor, 0);
  objc_storeStrong((id *)&self->_lastDetectedTags, 0);
  objc_storeStrong((id *)&self->_controllerInfo, 0);
  objc_storeStrong((id *)&self->_multiTagTransaction, 0);
  objc_storeStrong((id *)&self->_lpcdTransaction, 0);
  objc_storeStrong((id *)&self->_driverWrapper, 0);
  objc_storeStrong((id *)&self->_preferenceObserver, 0);
  objc_storeStrong((id *)&self->_powerObserver, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_xpcEventNotificationQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end