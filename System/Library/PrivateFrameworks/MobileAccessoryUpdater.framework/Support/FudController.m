@interface FudController
- (BOOL)initializeFud;
- (BOOL)isWorkPending;
- (BOOL)processEvent:(id)a3;
- (BOOL)setupXPCStreamsWithPolicies:(id)a3 shouldRegister:(BOOL)a4;
- (BOOL)startDefaultClients;
- (FudController)initWithIdleTimeout:(int64_t)a3;
- (id)loadPolicyForAllPlugins;
- (id)loadPolicyForAllServices;
- (void)beginIdleTimer;
- (void)cancelIdleTimer;
- (void)doDeviceIdleCheck;
- (void)doInstallerCheck;
- (void)doMayRebootCheck;
- (void)doPeriodicCheck;
- (void)doSimulateIdleCheck;
- (void)handleBrokenConnection:(id)a3;
- (void)handleEAOverHIDXPCStreamEvent:(id)a3 forFilterName:(id)a4;
- (void)handleIdleTimeout;
- (void)handleInternalAPIEvent:(id)a3;
- (void)handleInternalClientMessage:(id)a3;
- (void)handleXPCAPIEvent:(id)a3;
- (void)handleXPCStreamEvent:(id)a3;
- (void)idleExit;
- (void)initIdleTimer;
- (void)initSignals;
- (void)initUARP:(BOOL)a3;
- (void)notifyClientsOfInstallerUpdate:(BOOL)a3;
- (void)processAPIDict:(id)a3;
- (void)registerForEAMatchingNotifications;
- (void)registerForNotifydNotification:(id)a3 filterName:(id)a4;
- (void)setActivityForDeviceIdleLaunch:(BOOL)a3;
- (void)setActivityForMayRebootLaunch:(BOOL)a3;
- (void)setActivityForPeriodicLaunch:(BOOL)a3;
- (void)setActivityForUARPPeriodicLaunch:(BOOL)a3;
- (void)watchSharedGroup;
@end

@implementation FudController

- (FudController)initWithIdleTimeout:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)FudController;
  id v4 = [(FudController *)&v12 init];
  *((unsigned char *)v4 + 31) = 0;
  *((void *)v4 + 11) = 0;
  *((_DWORD *)v4 + 6) = 0;
  *((_WORD *)v4 + 14) = 0;
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  *((void *)v4 + 9) = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_BACKGROUND, 0);
  *((void *)v4 + 2) = a3;
  if ([v4 initializeFud]
    && (v6 = [[FudIpcDispatch alloc] initWithStorage:*((void *)v4 + 12)], (*((void *)v4 + 10) = v6) != 0)&& (mach_service = xpc_connection_create_mach_service("com.apple.MobileAccessoryUpdater", *((dispatch_queue_t *)v4 + 6), 1uLL), (*((void *)v4 + 1) = mach_service) != 0))
  {
    xpc_connection_set_context(mach_service, 0);
    v8 = (_xpc_connection_s *)*((void *)v4 + 1);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000C6FC;
    handler[3] = &unk_10007D4D8;
    handler[4] = v4;
    xpc_connection_set_event_handler(v8, handler);
    dispatch_resume(*((dispatch_object_t *)v4 + 6));
    xpc_connection_resume(*((xpc_connection_t *)v4 + 1));
    FudLog();
  }
  else
  {
    FudLog();
    id v10 = v4;
    return 0;
  }
  return (FudController *)v4;
}

- (void)initUARP:(BOOL)a3
{
  BOOL v3 = a3;
  if (dlopen("/System/Library/PrivateFrameworks/CoreUARP.framework/CoreUARP", 16))
  {
    self->_uarpQueue = (OS_dispatch_queue *)dispatch_queue_create("UARP Manager", 0);
    v5 = [[UARPManagerAUD alloc] initWithQueue:self->_uarpQueue];
    self->_uarpManager = v5;
    [(UARPManagerAUD *)v5 start:v3];
    [(FudController *)self setActivityForUARPPeriodicLaunch:v3];
  }
}

- (void)initSignals
{
  signal(30, (void (__cdecl *)(int))nullsub_2);
  BOOL v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  self->_usr1SignalSource = v3;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000C93C;
  handler[3] = &unk_10007CF58;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v3, handler);
  dispatch_resume((dispatch_object_t)self->_usr1SignalSource);
}

- (void)setActivityForUARPPeriodicLaunch:(BOOL)a3
{
  BOOL v3 = a3;
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"uarpPeriodicFirmwareCheckInterval", @"com.apple.mobileaccessoryupdater", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v6 = AppIntegerValue == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    int64_t v7 = XPC_ACTIVITY_INTERVAL_1_DAY;
  }
  else
  {
    int64_t v7 = AppIntegerValue;
    FudLog();
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000CAEC;
  handler[3] = &unk_10007D4D8;
  handler[4] = self;
  if (v3)
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    if (v8)
    {
      v9 = v8;
      xpc_dictionary_set_BOOL(v8, XPC_ACTIVITY_REPEATING, 1);
      xpc_dictionary_set_int64(v9, XPC_ACTIVITY_INTERVAL, v7);
      xpc_dictionary_set_BOOL(v9, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
      FudLog();
      xpc_activity_register("com.apple.AccessoryUpdater.UARP.periodicFirmwareCheck", v9, handler);
      xpc_release(v9);
    }
  }
  else
  {
    FudLog();
    xpc_activity_register("com.apple.AccessoryUpdater.UARP.periodicFirmwareCheck", XPC_ACTIVITY_CHECK_IN, handler);
  }
}

- (void)handleInternalClientMessage:(id)a3
{
  FudLog();
  if (a3
    && (id v5 = [a3 userInfo]) != 0
    && [v5 objectForKey:@"InternalMessage"]
    && (uint64_t v6 = _CFXPCCreateXPCObjectFromCFObject()) != 0)
  {
    processingQueue = self->_processingQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000CD84;
    v8[3] = &unk_10007D4B0;
    v8[4] = self;
    v8[5] = v6;
    dispatch_group_async((dispatch_group_t)qword_1000975B0, processingQueue, v8);
  }
  else
  {
    FudLog();
  }
}

- (void)idleExit
{
  self->_isIdleExiting = 1;
  listener = self->_listener;
  if (listener)
  {
    xpc_connection_cancel(listener);
    self->_listener = 0;
  }
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"MAUInternalMessageFudNotification" object:0];
  fudIpcDispatch = self->_fudIpcDispatch;
  if (fudIpcDispatch)
  {
    self->_fudIpcDispatch = 0;
  }
  idleTimer = self->_idleTimer;
  if (idleTimer) {
    dispatch_release(idleTimer);
  }
  timeoutQueue = self->_timeoutQueue;
  if (timeoutQueue) {
    dispatch_release(timeoutQueue);
  }
  eaOverHID = self->_eaOverHID;
  if (eaOverHID)
  {

    self->_eaOverHID = 0;
  }
  eaOverHIDQueue = self->_eaOverHIDQueue;
  if (eaOverHIDQueue) {
    dispatch_release(eaOverHIDQueue);
  }
  fudStorage = self->_fudStorage;
  if (fudStorage)
  {
    unsigned int v10 = ![(FudStorage *)self->_fudStorage save];
    FudLog();
    self->_fudStorage = 0;
  }
  else
  {
    unsigned int v10 = 0;
  }
  [(NSMutableArray *)self->_defaultClients removeAllObjects];
  exit(v10);
}

- (BOOL)isWorkPending
{
  intptr_t v3 = dispatch_group_wait((dispatch_group_t)qword_1000975B0, 0);
  if (v3)
  {
    FudLog();
    [(FudController *)self cancelIdleTimer];
    [(FudController *)self watchSharedGroup];
  }
  return v3 != 0;
}

- (void)handleIdleTimeout
{
  FudLog();
  fudStorage = self->_fudStorage;
  if (fudStorage && [(FudStorage *)fudStorage isAnyStateMachineActive]) {
    goto LABEL_5;
  }
  if ([(FudController *)self isWorkPending]) {
    return;
  }
  if ([(UARPManagerAUD *)self->_uarpManager isBusy])
  {
LABEL_5:
    FudLog();
    [(FudController *)self cancelIdleTimer];
    [(FudController *)self watchSharedGroup];
  }
  else if (![(FudController *)self isWorkPending])
  {
    FudLog();
    [(FudController *)self idleExit];
  }
}

- (void)beginIdleTimer
{
  timeoutQueue = self->_timeoutQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D068;
  block[3] = &unk_10007CF58;
  block[4] = self;
  dispatch_async(timeoutQueue, block);
}

- (void)cancelIdleTimer
{
  timeoutQueue = self->_timeoutQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D1E8;
  block[3] = &unk_10007CF58;
  block[4] = self;
  dispatch_async(timeoutQueue, block);
}

- (void)initIdleTimer
{
  qword_1000975B0 = (uint64_t)dispatch_group_create();
  intptr_t v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MobileAccessoryUpdater.fud.timeoutQueue", (dispatch_queue_attr_t)self->_attr);
  self->_timeoutQueue = v3;
  id v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v3);
  self->_idleTimer = v4;
  dispatch_source_set_timer((dispatch_source_t)v4, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  idleTimer = self->_idleTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000D378;
  handler[3] = &unk_10007CF58;
  handler[4] = self;
  dispatch_source_set_event_handler(idleTimer, handler);
  dispatch_activate((dispatch_object_t)self->_idleTimer);
  timeoutQueue = self->_timeoutQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000D380;
  v7[3] = &unk_10007CF58;
  v7[4] = self;
  dispatch_async(timeoutQueue, v7);
}

- (void)watchSharedGroup
{
  FudLog();
  timeoutQueue = self->_timeoutQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D420;
  block[3] = &unk_10007CF58;
  block[4] = self;
  dispatch_async(timeoutQueue, block);
}

- (BOOL)processEvent:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    processingQueue = self->_processingQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000D5E8;
    v8[3] = &unk_10007D4B0;
    v8[4] = self;
    v8[5] = a3;
    dispatch_group_async((dispatch_group_t)qword_1000975B0, processingQueue, v8);
  }
  return a3 != 0;
}

- (void)handleBrokenConnection:(id)a3
{
  if (a3
    && (context = xpc_connection_get_context((xpc_connection_t)a3), FudLog(), FudLog(), context)
    && (id v5 = -[FudStorage getClientWithName:](self->_fudStorage, "getClientWithName:", context, context)) != 0)
  {
    [v5 setConnection:0];
    fudStorage = self->_fudStorage;
    [(FudStorage *)fudStorage unregisterClientFromAllPlugins:context];
  }
  else
  {
    FudLog();
  }
}

- (void)handleEAOverHIDXPCStreamEvent:(id)a3 forFilterName:(id)a4
{
  eaOverHIDQueue = self->_eaOverHIDQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D790;
  block[3] = &unk_10007D500;
  block[4] = a3;
  void block[5] = a4;
  block[6] = self;
  dispatch_group_async((dispatch_group_t)qword_1000975B0, eaOverHIDQueue, block);
}

- (void)handleXPCStreamEvent:(id)a3
{
  if (self->_isIdleExiting)
  {
    FudLog();
  }
  else
  {
    processingQueue = self->_processingQueue;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10000D984;
    v4[3] = &unk_10007D4B0;
    v4[4] = a3;
    v4[5] = self;
    dispatch_group_async((dispatch_group_t)qword_1000975B0, processingQueue, v4);
  }
}

- (void)handleInternalAPIEvent:(id)a3
{
  FudLog();
  if (a3)
  {
    if (xpc_dictionary_get_int64(a3, "Command") != 116)
    {
LABEL_6:
      FudLog();
      return;
    }
    string = xpc_dictionary_get_string(a3, "FilterIdentifier");
    if (string)
    {
      uint64_t v6 = string;
      size_t length = 0;
      data = xpc_dictionary_get_data(a3, "Options", &length);
      xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
      if (v8)
      {
        v9 = v8;
        xpc_dictionary_set_string(v8, _xpc_event_key_name, v6);
        xpc_dictionary_set_data(v9, "Options", data, length);
        FudLog();
        -[FudController handleXPCStreamEvent:](self, "handleXPCStreamEvent:", v9, v6);
        xpc_release(v9);
        return;
      }
      goto LABEL_6;
    }
  }
  FudLog();
}

- (void)processAPIDict:(id)a3
{
  processingQueue = self->_processingQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000DFE0;
  v4[3] = &unk_10007D4B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_group_async((dispatch_group_t)qword_1000975B0, processingQueue, v4);
}

- (void)handleXPCAPIEvent:(id)a3
{
  FudLog();
  ++self->_numProcessedConnection;
  if (a3)
  {
    id v5 = xpc_copy_description(a3);
    FudLog();
    if (xpc_get_type(a3) == (xpc_type_t)&_xpc_type_connection)
    {
      xpc_connection_set_context((xpc_connection_t)a3, 0);
      xpc_connection_set_target_queue((xpc_connection_t)a3, (dispatch_queue_t)self->_processingQueue);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10000E3BC;
      handler[3] = &unk_10007D528;
      handler[4] = self;
      void handler[5] = a3;
      xpc_connection_set_event_handler((xpc_connection_t)a3, handler);
      xpc_connection_resume((xpc_connection_t)a3);
    }
    if (v5) {
      free(v5);
    }
  }
  else
  {
    FudLog();
  }
}

- (id)loadPolicyForAllServices
{
  v2 = +[NSMutableArray arrayWithCapacity:10];
  if (v2
    && (intptr_t v3 = v2,
        (id v4 = +[NSURL fileURLWithPath:@"/System/Library/PrivateFrameworks/MobileAccessoryUpdater.framework/XPCServices/" isDirectory:1]) != 0))
  {
    id v5 = [+[NSFileManager defaultManager] enumeratorAtURL:v4 includingPropertiesForKeys:0 options:1 errorHandler:0];
    uint64_t v6 = (NSBundle *)[(NSDirectoryEnumerator *)v5 nextObject];
    if (v6)
    {
      int64_t v7 = v6;
      while (1)
      {
        xpc_object_t v8 = +[NSBundle bundleWithURL:v7];
        v15 = v8;
        FudLog();
        if (!v8) {
          goto LABEL_15;
        }
        v9 = [(NSBundle *)v8 infoDictionary];
        if (!v9) {
          goto LABEL_15;
        }
        unsigned int v10 = v9;
        if ((objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", @"UARP Updater"), "BOOLValue") & 1) == 0)break; {
LABEL_16:
        }
        int64_t v7 = (NSBundle *)[(NSDirectoryEnumerator *)v5 nextObject];
        if (!v7) {
          return v3;
        }
      }
      v11 = [[PluginPolicy alloc] initWithPolicyDictionary:v10 pluginName:[(NSBundle *)v8 bundleIdentifier]];
      if (v11)
      {
        objc_super v12 = v11;
        v13 = v11;
        if ([(PluginPolicy *)v12 isValid])
        {
          [(NSMutableArray *)v3 addObject:v12];
          v15 = [(NSBundle *)v8 bundleIdentifier];
        }
        else
        {
          v15 = v7;
        }
      }
LABEL_15:
      FudLog();
      goto LABEL_16;
    }
  }
  else
  {
    FudLog();
    return 0;
  }
  return v3;
}

- (id)loadPolicyForAllPlugins
{
  v2 = +[NSMutableArray arrayWithCapacity:10];
  if (v2
    && (intptr_t v3 = v2,
        (id v4 = +[NSURL fileURLWithPath:@"/System/Library/AccessoryUpdaterBundles" isDirectory:1]) != 0))
  {
    id v5 = [+[NSFileManager defaultManager] enumeratorAtURL:v4 includingPropertiesForKeys:0 options:1 errorHandler:0];
    uint64_t v6 = (NSBundle *)[(NSDirectoryEnumerator *)v5 nextObject];
    if (v6)
    {
      int64_t v7 = v6;
      do
      {
        xpc_object_t v8 = +[NSBundle bundleWithURL:](NSBundle, "bundleWithURL:", v7, v14);
        v14 = v8;
        FudLog();
        if (v8)
        {
          v9 = [(NSBundle *)v8 infoDictionary];
          if (v9)
          {
            unsigned int v10 = [[PluginPolicy alloc] initWithPolicyDictionary:v9 pluginName:[(NSBundle *)v8 bundleIdentifier]];
            if (v10)
            {
              v11 = v10;
              objc_super v12 = v10;
              if ([(PluginPolicy *)v11 isValid])
              {
                [(NSMutableArray *)v3 addObject:v11];
                v14 = [(NSBundle *)v8 bundleIdentifier];
              }
              else
              {
                v14 = v7;
              }
            }
          }
        }
        FudLog();
        int64_t v7 = (NSBundle *)[(NSDirectoryEnumerator *)v5 nextObject];
      }
      while (v7);
    }
  }
  else
  {
    FudLog();
    return 0;
  }
  return v3;
}

- (void)registerForEAMatchingNotifications
{
  FudLog();
  processingQueue = self->_processingQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000EA78;
  handler[3] = &unk_10007D4D8;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.ExternalAccessory.matching", processingQueue, handler);
}

- (void)registerForNotifydNotification:(id)a3 filterName:(id)a4
{
  CFStringRef v9 = @"Notification";
  id v10 = a3;
  +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  uint64_t v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  FudLog();
  objc_msgSend(a4, "cStringUsingEncoding:", 4, a4);
  xpc_set_event();
  processingQueue = self->_processingQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000EBB0;
  handler[3] = &unk_10007D4D8;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", processingQueue, handler);
  if (v6) {
    xpc_release(v6);
  }
}

- (BOOL)setupXPCStreamsWithPolicies:(id)a3 shouldRegister:(BOOL)a4
{
  BOOL v4 = a4;
  [(FudController *)self registerForEAMatchingNotifications];
  uint64_t v6 = +[NSMutableDictionary dictionaryWithCapacity:5];
  if (v6)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v26 = [a3 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v26)
    {
      uint64_t v24 = *(void *)v37;
      id v25 = a3;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v37 != v24) {
            objc_enumerationMutation(a3);
          }
          uint64_t v27 = v7;
          xpc_object_t v8 = *(void **)(*((void *)&v36 + 1) + 8 * v7);
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          v29 = v8;
          id v9 = [v8 matchingFilters];
          id v10 = [v9 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v33;
            do
            {
              v13 = 0;
              id v30 = v11;
              do
              {
                if (*(void *)v33 != v12) {
                  objc_enumerationMutation(v9);
                }
                v14 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v13);
                [v14 filter];
                uint64_t v15 = _CFXPCCreateXPCObjectFromCFObject();
                if (v15)
                {
                  v16 = (void *)v15;
                  v17 = (const char *)objc_msgSend(objc_msgSend(v14, "filterType"), "cStringUsingEncoding:", 4);
                  if (v17)
                  {
                    v18 = v17;
                    if (v4)
                    {
                      id v21 = [v14 filterName];
                      FudLog();
                      objc_msgSend(objc_msgSend(v14, "filterName", v21), "cStringUsingEncoding:", 4);
                      xpc_set_event();
                    }
                    if (!-[NSMutableDictionary objectForKey:](v6, "objectForKey:", [v14 filterType]))
                    {
                      id v22 = [v29 pluginName];
                      id v23 = [v14 filterName];
                      id v11 = v30;
                      FudLog();
                      processingQueue = self->_processingQueue;
                      handler[0] = _NSConcreteStackBlock;
                      handler[1] = 3221225472;
                      handler[2] = sub_10000EF38;
                      handler[3] = &unk_10007D4D8;
                      handler[4] = self;
                      xpc_set_event_stream_handler(v18, processingQueue, handler);
                      -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1, v22, v23), [v14 filterType]);
                    }
                  }
                  else
                  {
                    FudLog();
                  }
                  xpc_release(v16);
                }
                else
                {
                  FudLog();
                }
                v13 = (char *)v13 + 1;
              }
              while (v11 != v13);
              id v11 = [v9 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }
            while (v11);
          }
          uint64_t v7 = v27 + 1;
          a3 = v25;
        }
        while ((id)(v27 + 1) != v26);
        id v26 = [v25 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v26);
    }
  }
  else
  {
    FudLog();
  }
  return v6 != 0;
}

- (BOOL)startDefaultClients
{
  intptr_t v3 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:1];
  self->_defaultClients = v3;
  if (v3
    && (BOOL v4 = [[DefaultModalClient alloc] initWithGroup:@"Modal UI"]) != 0)
  {
    id v5 = v4;
    [(DefaultModalClient *)v4 setInstallerUpdateActive:self->_isInstallerUpdate];
    [(NSMutableArray *)self->_defaultClients addObject:v5];

    return 1;
  }
  else
  {
    FudLog();
    return 0;
  }
}

- (void)notifyClientsOfInstallerUpdate:(BOOL)a3
{
  self->_isInstallerUpdate = a3;
  defaultClients = self->_defaultClients;
  if (defaultClients && (BOOL v5 = a3, [(NSMutableArray *)defaultClients count]))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = self->_defaultClients;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (!v7) {
      goto LABEL_13;
    }
    id v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v12 setInstallerUpdateActive:v5];
          char v9 = 1;
        }
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
    if ((v9 & 1) == 0) {
LABEL_13:
    }
      FudLog();
  }
  else
  {
    FudLog();
  }
}

- (BOOL)initializeFud
{
  BOOL v3 = +[FudUtilities isFirstLaunchSinceBoot];
  uint64_t v25 = 0;
  BOOL v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.fud.processing.queue", (dispatch_queue_attr_t)self->_attr);
  self->_processingQueue = v4;
  if (!v4) {
    goto LABEL_21;
  }
  dispatch_suspend((dispatch_object_t)v4);
  BOOL v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.fud.eaOverHID.queue", (dispatch_queue_attr_t)self->_attr);
  self->_eaOverHIDQueue = v5;
  if (!v5) {
    goto LABEL_21;
  }
  uint64_t v6 = +[NSFileManager defaultManager];
  if (!v6) {
    goto LABEL_21;
  }
  id v7 = v6;
  if (![(NSFileManager *)v6 fileExistsAtPath:@"/var/db/accessoryupdater"]
    && ![(NSFileManager *)v7 createDirectoryAtPath:@"/var/db/accessoryupdater" withIntermediateDirectories:1 attributes:0 error:&v25])
  {
    goto LABEL_21;
  }
  id v8 = +[NSString stringWithFormat:@"%@/%@", @"/var/db/accessoryupdater", @"remoteCheckLedger.plist"];
  if (!v8) {
    goto LABEL_21;
  }
  char v9 = +[FudStorage storageWithFile:v8];
  self->_fudStorage = v9;
  if (!v9) {
    goto LABEL_21;
  }
  uint64_t v10 = v9;
  [(FudController *)self initIdleTimer];
  [(FudController *)self initUARP:v3];
  [(FudController *)self initSignals];
  FudLog();
  id v11 = [(FudController *)self loadPolicyForAllServices];
  objc_msgSend(v11, "addObjectsFromArray:", -[FudController loadPolicyForAllPlugins](self, "loadPolicyForAllPlugins"));
  if (!v11) {
    goto LABEL_21;
  }
  [(FudStorage *)self->_fudStorage setPoliciesWithArray:v11];
  if ([(FudController *)self setupXPCStreamsWithPolicies:v11 shouldRegister:v3])
  {
    if (v3)
    {
      uint64_t v12 = [(NSFileManager *)v7 contentsOfDirectoryAtPath:@"/var/db/fud" error:0];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v22;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            -[NSFileManager removeItemAtPath:error:](v7, "removeItemAtPath:error:", [@"/var/db/fud" stringByAppendingPathComponent:*(void *)(*((void *)&v21 + 1) + 8 * i)], 0);
          }
          id v14 = [(NSArray *)v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v14);
      }
    }
    [(FudController *)self setActivityForPeriodicLaunch:v3];
    [(FudController *)self setActivityForDeviceIdleLaunch:v3];
    [+[NSNotificationCenter defaultCenter] addObserver:self selector:"handleInternalClientMessage:" name:@"MAUInternalMessageFudNotification" object:0];
    if (+[FudUtilities shouldDefaultModalClientBeEnabled])
    {
      v17 = qword_1000975B0;
      global_queue = dispatch_get_global_queue(2, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000F530;
      block[3] = &unk_10007CF58;
      block[4] = self;
      dispatch_group_async(v17, global_queue, block);
    }
    return 1;
  }
  else
  {
LABEL_21:
    FudLog();
    return 0;
  }
}

- (void)setActivityForMayRebootLaunch:(BOOL)a3
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000F6D8;
  handler[3] = &unk_10007D4D8;
  handler[4] = self;
  if (a3)
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    if (v3)
    {
      BOOL v4 = v3;
      xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_MAY_REBOOT_DEVICE, 1);
      xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
      xpc_dictionary_set_int64(v4, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_1_DAY);
      FudLog();
      xpc_activity_register("com.apple.MobileAccessoryUpdater.mayRebootCheck", v4, handler);
      xpc_release(v4);
    }
  }
  else
  {
    FudLog();
    xpc_activity_register("com.apple.MobileAccessoryUpdater.mayRebootCheck", XPC_ACTIVITY_CHECK_IN, handler);
  }
}

- (void)setActivityForDeviceIdleLaunch:(BOOL)a3
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000FA00;
  handler[3] = &unk_10007D4D8;
  handler[4] = self;
  if (a3)
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    if (v3)
    {
      BOOL v4 = v3;
      xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY, 1);
      xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 1);
      xpc_dictionary_set_int64(v4, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_1_DAY);
      xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
      FudLog();
      xpc_activity_register("com.apple.MobileAccessoryUpdater.deviceIdleCheck", v4, handler);
      xpc_release(v4);
    }
  }
  else
  {
    FudLog();
    xpc_activity_register("com.apple.MobileAccessoryUpdater.deviceIdleCheck", XPC_ACTIVITY_CHECK_IN, handler);
  }
}

- (void)setActivityForPeriodicLaunch:(BOOL)a3
{
  BOOL v3 = a3;
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"periodicFirmwareCheckInterval", @"com.apple.MobileAccessoryUpdater", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v6 = AppIntegerValue == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    int64_t v7 = 3 * XPC_ACTIVITY_INTERVAL_1_DAY;
  }
  else
  {
    int64_t v7 = AppIntegerValue;
    FudLog();
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000FD64;
  handler[3] = &unk_10007D4D8;
  handler[4] = self;
  if (v3)
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    if (v8)
    {
      char v9 = v8;
      xpc_dictionary_set_BOOL(v8, XPC_ACTIVITY_REPEATING, 1);
      xpc_dictionary_set_int64(v9, XPC_ACTIVITY_INTERVAL, v7);
      xpc_dictionary_set_BOOL(v9, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
      FudLog();
      xpc_activity_register("com.apple.MobileAccessoryUpdater.periodicFirmwareCheck", v9, handler);
      xpc_release(v9);
    }
  }
  else
  {
    FudLog();
    xpc_activity_register("com.apple.MobileAccessoryUpdater.periodicFirmwareCheck", XPC_ACTIVITY_CHECK_IN, handler);
  }
}

- (void)doMayRebootCheck
{
  id v3 = [(NSMutableDictionary *)[(FudStorage *)self->_fudStorage pluginToPolicy] allValues];
  if (v3)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v3;
    id v21 = [v3 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v21)
    {
      uint64_t v20 = *(void *)v28;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = v4;
          BOOL v5 = *(void **)(*((void *)&v27 + 1) + 8 * v4);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v6 = [v5 matchingFilters];
          id v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v7)
          {
            id v8 = v7;
            uint64_t v9 = *(void *)v24;
            do
            {
              uint64_t v10 = 0;
              do
              {
                if (*(void *)v24 != v9) {
                  objc_enumerationMutation(v6);
                }
                id v11 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v10);
                if ([v11 needsMayRebootCheck])
                {
                  id v16 = [v11 filterName];
                  FudLog();
                  if (objc_msgSend(objc_msgSend(v11, "filterType", v16), "cStringUsingEncoding:", 4)
                    && ((objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4),
                         (uint64_t v12 = (void *)xpc_copy_event()) != 0)
                     || (id v17 = [v11 filterName],
                         FudLog(),
                         objc_msgSend(v11, "filter", v17),
                         (uint64_t v12 = (void *)_CFXPCCreateXPCObjectFromCFObject()) != 0)))
                  {
                    id v13 = objc_msgSend(objc_msgSend(v11, "filterName"), "rangeOfString:options:", @"com.apple.MobileAccessoryUpdater.EA.", 1);
                    id v14 = (const char *)objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4);
                    if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
                    {
                      xpc_set_event();
                      objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4);
                      xpc_set_event();
                    }
                    else
                    {
                      xpc_dictionary_set_string(v12, _xpc_event_key_name, v14);
                      id v18 = [v11 filterName];
                      FudLog();
                      -[FudController handleXPCStreamEvent:](self, "handleXPCStreamEvent:", v12, v18, v12);
                    }
                    [(FudController *)self watchSharedGroup];
                    xpc_release(v12);
                  }
                  else
                  {
                    FudLog();
                  }
                }
                uint64_t v10 = (char *)v10 + 1;
              }
              while (v8 != v10);
              id v15 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
              id v8 = v15;
            }
            while (v15);
          }
          uint64_t v4 = v22 + 1;
        }
        while ((id)(v22 + 1) != v21);
        id v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v21);
    }
  }
  else
  {
    FudLog();
  }
}

- (void)doSimulateIdleCheck
{
  uint64_t state64 = 0;
  int out_token = 0;
  int check = 0;
  FudLog();
  if (!notify_register_check((const char *)objc_msgSend(@"com.apple.MobileAccessoryUpdater.auSimulateIdleLaunch", "UTF8String", "-[FudController doSimulateIdleCheck]"), &out_token)&& !notify_check(out_token, &check))
  {
    uint64_t v3 = check;
    if (check)
    {
      notify_get_state(out_token, &state64);
      uint64_t v3 = check;
      uint64_t v4 = state64;
    }
    else
    {
      uint64_t v4 = 0;
    }
    uint64_t v5 = v3;
    uint64_t v6 = v4;
    FudLog();
    self->_simulateIdleUseFilepath = state64 == 1;
    self->_isSimulatedDeviceIdleLaunch = 1;
    -[FudController doDeviceIdleCheck](self, "doDeviceIdleCheck", "-[FudController doSimulateIdleCheck]", v5, v6);
  }
}

- (void)doDeviceIdleCheck
{
  self->_isDeviceIdleLaunch = 1;
  id v3 = [(NSMutableDictionary *)[(FudStorage *)self->_fudStorage pluginToPolicy] allValues];
  if (v3)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v3;
    id v21 = [v3 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v21)
    {
      uint64_t v20 = *(void *)v28;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = v4;
          uint64_t v5 = *(void **)(*((void *)&v27 + 1) + 8 * v4);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v6 = [v5 matchingFilters];
          id v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v7)
          {
            id v8 = v7;
            uint64_t v9 = *(void *)v24;
            do
            {
              uint64_t v10 = 0;
              do
              {
                if (*(void *)v24 != v9) {
                  objc_enumerationMutation(v6);
                }
                id v11 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v10);
                if ([v11 needsDeviceIdleCheck])
                {
                  id v16 = [v11 filterName];
                  FudLog();
                  if (objc_msgSend(objc_msgSend(v11, "filterType", v16), "cStringUsingEncoding:", 4)
                    && ((objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4),
                         (uint64_t v12 = (void *)xpc_copy_event()) != 0)
                     || (id v17 = [v11 filterName],
                         FudLog(),
                         objc_msgSend(v11, "filter", v17),
                         (uint64_t v12 = (void *)_CFXPCCreateXPCObjectFromCFObject()) != 0)))
                  {
                    id v13 = objc_msgSend(objc_msgSend(v11, "filterName"), "rangeOfString:options:", @"com.apple.MobileAccessoryUpdater.EA.", 1);
                    id v14 = (const char *)objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4);
                    if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
                    {
                      xpc_set_event();
                      objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4);
                      xpc_set_event();
                    }
                    else
                    {
                      xpc_dictionary_set_string(v12, _xpc_event_key_name, v14);
                      id v18 = [v11 filterName];
                      FudLog();
                      -[FudController handleXPCStreamEvent:](self, "handleXPCStreamEvent:", v12, v18, v12);
                    }
                    [(FudController *)self watchSharedGroup];
                    xpc_release(v12);
                  }
                  else
                  {
                    FudLog();
                  }
                }
                uint64_t v10 = (char *)v10 + 1;
              }
              while (v8 != v10);
              id v15 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
              id v8 = v15;
            }
            while (v15);
          }
          uint64_t v4 = v22 + 1;
        }
        while ((id)(v22 + 1) != v21);
        id v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v21);
    }
  }
  else
  {
    FudLog();
  }
}

- (void)doInstallerCheck
{
  id v3 = [(NSMutableDictionary *)[(FudStorage *)self->_fudStorage pluginToPolicy] allValues];
  if (v3)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v3;
    id v21 = [v3 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v21)
    {
      uint64_t v20 = *(void *)v28;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = v4;
          uint64_t v5 = *(void **)(*((void *)&v27 + 1) + 8 * v4);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v6 = [v5 matchingFilters];
          id v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v7)
          {
            id v8 = v7;
            uint64_t v9 = *(void *)v24;
            do
            {
              uint64_t v10 = 0;
              do
              {
                if (*(void *)v24 != v9) {
                  objc_enumerationMutation(v6);
                }
                id v11 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v10);
                if ([v11 needsInstallerCheck])
                {
                  id v16 = [v11 filterName];
                  FudLog();
                  if (objc_msgSend(objc_msgSend(v11, "filterType", v16), "cStringUsingEncoding:", 4)
                    && ((objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4),
                         (uint64_t v12 = (void *)xpc_copy_event()) != 0)
                     || (id v17 = [v11 filterName],
                         FudLog(),
                         objc_msgSend(v11, "filter", v17),
                         (uint64_t v12 = (void *)_CFXPCCreateXPCObjectFromCFObject()) != 0)))
                  {
                    [(FudController *)self notifyClientsOfInstallerUpdate:1];
                    id v13 = objc_msgSend(objc_msgSend(v11, "filterName"), "rangeOfString:options:", @"com.apple.MobileAccessoryUpdater.EA.", 1);
                    id v14 = (const char *)objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4);
                    if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
                    {
                      xpc_set_event();
                      objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4);
                      xpc_set_event();
                    }
                    else
                    {
                      xpc_dictionary_set_string(v12, _xpc_event_key_name, v14);
                      id v18 = [v11 filterName];
                      FudLog();
                      -[FudController handleXPCStreamEvent:](self, "handleXPCStreamEvent:", v12, v18, v12);
                    }
                    [(FudController *)self watchSharedGroup];
                    xpc_release(v12);
                  }
                  else
                  {
                    FudLog();
                  }
                }
                uint64_t v10 = (char *)v10 + 1;
              }
              while (v8 != v10);
              id v15 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
              id v8 = v15;
            }
            while (v15);
          }
          uint64_t v4 = v22 + 1;
        }
        while ((id)(v22 + 1) != v21);
        id v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v21);
    }
  }
  else
  {
    FudLog();
  }
}

- (void)doPeriodicCheck
{
  id v3 = [(NSMutableDictionary *)[(FudStorage *)self->_fudStorage pluginToPolicy] allValues];
  if (v3)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v3;
    id v21 = [v3 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v21)
    {
      uint64_t v20 = *(void *)v28;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = v4;
          uint64_t v5 = *(void **)(*((void *)&v27 + 1) + 8 * v4);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v6 = [v5 matchingFilters];
          id v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v7)
          {
            id v8 = v7;
            uint64_t v9 = *(void *)v24;
            do
            {
              uint64_t v10 = 0;
              do
              {
                if (*(void *)v24 != v9) {
                  objc_enumerationMutation(v6);
                }
                id v11 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v10);
                if ([v11 needsPeriodicFirmwareCheck])
                {
                  id v16 = [v11 filterName];
                  FudLog();
                  if (objc_msgSend(objc_msgSend(v11, "filterType", v16), "cStringUsingEncoding:", 4)
                    && ((objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4),
                         (uint64_t v12 = (void *)xpc_copy_event()) != 0)
                     || (id v17 = [v11 filterName],
                         FudLog(),
                         objc_msgSend(v11, "filter", v17),
                         (uint64_t v12 = (void *)_CFXPCCreateXPCObjectFromCFObject()) != 0)))
                  {
                    id v13 = objc_msgSend(objc_msgSend(v11, "filterName"), "rangeOfString:options:", @"com.apple.MobileAccessoryUpdater.EA.", 1);
                    id v14 = (const char *)objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4);
                    if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
                    {
                      xpc_set_event();
                      objc_msgSend(objc_msgSend(v11, "filterName"), "cStringUsingEncoding:", 4);
                      xpc_set_event();
                    }
                    else
                    {
                      xpc_dictionary_set_string(v12, _xpc_event_key_name, v14);
                      id v18 = [v11 filterName];
                      FudLog();
                      -[FudController handleXPCStreamEvent:](self, "handleXPCStreamEvent:", v12, v18, v12);
                    }
                    [(FudController *)self watchSharedGroup];
                    xpc_release(v12);
                  }
                  else
                  {
                    FudLog();
                  }
                }
                uint64_t v10 = (char *)v10 + 1;
              }
              while (v8 != v10);
              id v15 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
              id v8 = v15;
            }
            while (v15);
          }
          uint64_t v4 = v22 + 1;
        }
        while ((id)(v22 + 1) != v21);
        id v21 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v21);
    }
  }
  else
  {
    FudLog();
  }
}

@end