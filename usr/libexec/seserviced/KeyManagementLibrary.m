@interface KeyManagementLibrary
+ (id)sharedLibrary;
- (BOOL)isRunning;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (KeyManagementLibrary)init;
- (OS_dispatch_queue)kmlMainQueue;
- (unsigned)numberOfPairingSessionsQueued;
- (void)addNewSession:(id)a3 firstInQueue:(BOOL *)a4;
- (void)appletLockStateDidChange:(BOOL)a3;
- (void)clientAppIsBackGrounded:(id)a3;
- (void)clientAppIsForeGrounded:(id)a3;
- (void)clientAppIsSuspended:(id)a3;
- (void)handleFirstUnlock;
- (void)removeSession:(id)a3 withError:(id)a4;
- (void)startNextSession;
- (void)startService;
- (void)startServiceWithMachName:(id)a3;
- (void)stopService;
@end

@implementation KeyManagementLibrary

+ (id)sharedLibrary
{
  if (qword_1004683A8 != -1) {
    dispatch_once(&qword_1004683A8, &stru_100419D98);
  }
  v2 = (void *)qword_1004683A0;

  return v2;
}

- (KeyManagementLibrary)init
{
  v10.receiver = self;
  v10.super_class = (Class)KeyManagementLibrary;
  v2 = [(KeyManagementLibrary *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_isRunning = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.sesd.kml", v4);
    kmlMainQueue = v3->_kmlMainQueue;
    v3->_kmlMainQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = +[NSMutableArray array];
    sessions = v3->_sessions;
    v3->_sessions = (NSMutableArray *)v7;

    if (!v3->_kmlMainQueue || !v3->_sessions)
    {

      return 0;
    }
  }
  return v3;
}

- (void)startService
{
}

- (void)startServiceWithMachName:(id)a3
{
  id v4 = a3;
  if ([(KeyManagementLibrary *)self isRunning])
  {
    v9 = @"KML: service already running.";
    uint64_t v10 = 77;
  }
  else
  {
    os_state_add_handler();
    v11 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:v4];
    kmlListener = self->_kmlListener;
    self->_kmlListener = v11;

    [(NSXPCListener *)self->_kmlListener setDelegate:self];
    v13 = (KmlClientAppStateObserver *)sub_10032A6F0([KmlClientAppStateObserver alloc], self);
    appObserver = self->_appObserver;
    self->_appObserver = v13;

    [(NSXPCListener *)self->_kmlListener resume];
    self->_isRunning = 1;
    uint64_t v15 = (uint64_t)v4;
    v9 = @"Service %@ running";
    uint64_t v10 = 93;
  }
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary startServiceWithMachName:]", v10, v9, v5, v6, v7, v8, v15);
}

- (void)handleFirstUnlock
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary handleFirstUnlock]", 98, &stru_100421848, v2, v3, v4, v5, v9);
  sub_10031DB48();
  uint64_t v7 = (KmlSharingTransport *)objc_claimAutoreleasedReturnValue();
  idsListener = self->_idsListener;
  self->_idsListener = v7;

  sub_100340EB8();
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)stopService
{
  if (self->_isRunning)
  {
    idsListener = self->_idsListener;
    self->_idsListener = 0;

    [(NSXPCListener *)self->_kmlListener invalidate];
    [(NSXPCListener *)self->_kmlListener setDelegate:0];
    kmlListener = self->_kmlListener;
    self->_kmlListener = 0;

    self->_isRunning = 0;
    uint64_t v9 = @"XPC service stopped";
    uint64_t v10 = 121;
  }
  else
  {
    uint64_t v9 = @"KML: service is not running.";
    uint64_t v10 = 111;
  }

  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary stopService]", v10, v9, v2, v3, v4, v5, v12);
}

- (void)addNewSession:(id)a3 firstInQueue:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v7 = self->_sessions;
  objc_sync_enter(v7);
  if (a4) {
    *a4 = [(NSMutableArray *)self->_sessions count] == 0;
  }
  [(NSMutableArray *)self->_sessions addObject:v6];
  id v8 = [(NSMutableArray *)self->_sessions count];
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KeyManagementLibrary addNewSession:firstInQueue:]", 132, @"Add new seesion : #sessions = %u", v9, v10, v11, v12, (uint64_t)v8);
  objc_sync_exit(v7);

  kmlMainQueue = self->_kmlMainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031C868;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(kmlMainQueue, block);
}

- (void)removeSession:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (KmlSession *)v6;
  KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KeyManagementLibrary removeSession:withError:]", 143, @"%@", v9, v10, v11, v12, (uint64_t)v8);
  [(KmlSession *)v8 stopWithError:v7];
  v13 = sub_1003212D0((id *)&v8->super.isa);
  v14 = [v13 userInfo];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"ProxyObjects"];
  [v15 removeObject:v8];
  v16 = self->_sessions;
  objc_sync_enter(v16);
  [(NSMutableArray *)self->_sessions removeObject:v8];
  if (self->_currentSession == v8)
  {
    KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KeyManagementLibrary removeSession:withError:]", 155, @"clearing current session", v17, v18, v19, v20, v28);
    currentSession = self->_currentSession;
    self->_currentSession = 0;
  }
  id v22 = [(NSMutableArray *)self->_sessions count];
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary removeSession:withError:]", 159, @" sessions = %u", v23, v24, v25, v26, (uint64_t)v22);
  objc_sync_exit(v16);

  kmlMainQueue = self->_kmlMainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031CA34;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(kmlMainQueue, block);
}

- (void)startNextSession
{
  obj = self->_sessions;
  objc_sync_enter(obj);
  currentSession = self->_currentSession;
  if (currentSession) {
    goto LABEL_2;
  }
  if ([(NSMutableArray *)self->_sessions count])
  {
    KmlLogFunc2(OS_LOG_TYPE_DEBUG, (uint64_t)"-[KeyManagementLibrary startNextSession]", 171, @"Dequeuing next session", v9, v10, v11, v12, v19);
    v13 = [(NSMutableArray *)self->_sessions objectAtIndex:0];
    v14 = self->_currentSession;
    self->_currentSession = v13;

    [(NSMutableArray *)self->_sessions removeObjectAtIndex:0];
    [(KmlSession *)self->_currentSession start];
  }
  else
  {
    currentSession = self->_currentSession;
    if (currentSession)
    {
LABEL_2:
      uint64_t v4 = [(KmlSession *)currentSession clientName];
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary startNextSession]", 177, @"Session (by %@) already in progress", v5, v6, v7, v8, (uint64_t)v4);

      goto LABEL_5;
    }
    if (![(NSMutableArray *)self->_sessions count]) {
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary startNextSession]", 180, @"No Sessions queued", v15, v16, v17, v18, v19);
    }
  }
LABEL_5:
  objc_sync_exit(obj);
}

- (unsigned)numberOfPairingSessionsQueued
{
  uint64_t v3 = self->_sessions;
  objc_sync_enter(v3);
  if (self->_currentSession && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned __int8 v8 = 1;
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary numberOfPairingSessionsQueued]", 191, @"Current session is pairing session", v4, v5, v6, v7, v22);
  }
  else
  {
    unsigned __int8 v8 = 0;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v9 = self->_sessions;
  uint64_t v10 = (char *)[(NSMutableArray *)v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary numberOfPairingSessionsQueued]", 198, @"A pairing session is already in queue", v13, v14, v15, v16, v22);
          ++v8;
        }
      }
      uint64_t v10 = (char *)[(NSMutableArray *)v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v3);
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary numberOfPairingSessionsQueued]", 204, @"Number of pairing sessions in queue : %u", v17, v18, v19, v20, v8);
  return v8;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v47 = a3;
  id v6 = a4;
  memset(buffer, 0, 255);
  proc_name((int)[v6 processIdentifier], buffer, 0xFEu);
  uint64_t v7 = +[NSString stringWithUTF8String:buffer];
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary listener:shouldAcceptNewConnection:]", 239, @"New Client: %s", v8, v9, v10, v11, (uint64_t)buffer);
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary listener:shouldAcceptNewConnection:]", 240, @"New client request from :%@", v12, v13, v14, v15, (uint64_t)v7);
  id v16 = sub_100321DC4([KmlEntitlementChecker alloc], v6);
  if (!sub_100052B9C((BOOL)v16))
  {
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[KeyManagementLibrary listener:shouldAcceptNewConnection:]", 245, @"Entitlement for XPC not found", v17, v18, v19, v20, v44);
    goto LABEL_5;
  }
  if (!sub_10032B2B4((uint64_t)self->_appObserver, v6))
  {
    uint64_t v26 = sub_10032B430((uint64_t)self->_appObserver, v6);
    if (v26 == 4279897)
    {
      uint64_t v35 = 1;
    }
    else
    {
      if (v26 != 1)
      {
        uint64_t v35 = 0;
        uint64_t v36 = 0;
        goto LABEL_13;
      }
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary listener:shouldAcceptNewConnection:]", 256, @"Client (%s) is in background", v27, v28, v29, v30, (uint64_t)buffer);
      if (!sub_100321FC8((BOOL)v16))
      {
        KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[KeyManagementLibrary listener:shouldAcceptNewConnection:]", 258, @"Can not allow this connection to resume", v31, v32, v33, v34, v45);
        goto LABEL_5;
      }
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary listener:shouldAcceptNewConnection:]", 261, @"But it has entitlement to continue.", v31, v32, v33, v34, v45);
      uint64_t v35 = 0;
    }
    uint64_t v36 = 1;
LABEL_13:
    v46 = objc_opt_new();
    sub_1002FAE84(v46, (char *)self->_kmlMainQueue);
    v37 = +[KmlManagerInterface interface];
    [v6 setExportedInterface:v37];

    [v6 setExportedObject:v46];
    v38 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___KmlManagerCallbacks];
    [v6 setRemoteObjectInterface:v38];

    v39 = +[NSMutableSet set];
    v40 = +[NSMutableDictionary dictionaryWithObject:v39 forKey:@"ProxyObjects"];

    [v40 setObject:v7 forKeyedSubscript:@"ClientName"];
    [v40 setObject:v16 forKeyedSubscript:@"Entitlements"];
    v41 = +[NSNumber numberWithBool:v36];
    [v40 setObject:v41 forKeyedSubscript:@"BackGroundClient"];

    v42 = +[NSNumber numberWithBool:v35];
    [v40 setObject:v42 forKeyedSubscript:@"ClientIsDaemon"];

    [v6 setUserInfo:v40];
    objc_initWeak(&location, self);
    objc_initWeak(&from, v6);
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_10031D4D4;
    v51[3] = &unk_100419DE0;
    objc_copyWeak(&v52, &from);
    objc_copyWeak(&v53, &location);
    [v6 setInvalidationHandler:v51];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10031D534;
    v48[3] = &unk_100419DE0;
    objc_copyWeak(&v49, &from);
    objc_copyWeak(&v50, &location);
    [v6 setInterruptionHandler:v48];
    sub_10032ADE0((uint64_t)self->_appObserver, v6);
    [v6 resume];
    objc_destroyWeak(&v50);
    objc_destroyWeak(&v49);
    objc_destroyWeak(&v53);
    objc_destroyWeak(&v52);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    BOOL v25 = 1;
    goto LABEL_14;
  }
  KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[KeyManagementLibrary listener:shouldAcceptNewConnection:]", 250, @"Client (%s) is suspended. Reject connection", v21, v22, v23, v24, (uint64_t)buffer);
LABEL_5:
  BOOL v25 = 0;
LABEL_14:

  return v25;
}

- (void)clientAppIsSuspended:(id)a3
{
  id v4 = a3;
  uint64_t v9 = v4;
  if (v4)
  {
    memset(buffer, 0, 255);
    proc_name((int)[v4 processIdentifier], buffer, 0xFEu);
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary clientAppIsSuspended:]", 347, &stru_100421848, v10, v11, v12, v13, v19);
    if (sub_10032B2B4((uint64_t)self->_appObserver, v9))
    {
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary clientAppIsSuspended:]", 351, @"Client (%s) is suspended", v14, v15, v16, v17, (uint64_t)buffer);
      sub_10032B0A8((uint64_t)self->_appObserver, v9);
      kmlMainQueue = self->_kmlMainQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10031D720;
      block[3] = &unk_10040B880;
      id v21 = v9;
      dispatch_async(kmlMainQueue, block);
    }
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary clientAppIsSuspended:]", 340, @"connection is nil", v5, v6, v7, v8, v19);
  }
}

- (void)clientAppIsBackGrounded:(id)a3
{
  id v4 = a3;
  uint64_t v9 = v4;
  if (v4)
  {
    kmlMainQueue = self->_kmlMainQueue;
    v11[0] = (uint64_t)_NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = (uint64_t)sub_10031D7EC;
    v11[3] = (uint64_t)&unk_10040D1A0;
    id v12 = v4;
    uint64_t v13 = self;
    dispatch_async(kmlMainQueue, v11);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary clientAppIsBackGrounded:]", 367, @"connection is nil", v5, v6, v7, v8, v11[0]);
  }
}

- (void)clientAppIsForeGrounded:(id)a3
{
  id v4 = a3;
  uint64_t v9 = v4;
  if (v4)
  {
    kmlMainQueue = self->_kmlMainQueue;
    v11[0] = (uint64_t)_NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = (uint64_t)sub_10031D9A8;
    v11[3] = (uint64_t)&unk_10040D1A0;
    id v12 = v4;
    uint64_t v13 = self;
    dispatch_async(kmlMainQueue, v11);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary clientAppIsForeGrounded:]", 392, @"connection is nil", v5, v6, v7, v8, v11[0]);
  }
}

- (void)appletLockStateDidChange:(BOOL)a3
{
  BOOL v7 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KeyManagementLibrary appletLockStateDidChange:]", 407, @"%d", v3, v4, v5, v6, a3);
  sub_10032872C();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 setAppletLockState:v7];
}

- (OS_dispatch_queue)kmlMainQueue
{
  return self->_kmlMainQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kmlMainQueue, 0);
  objc_storeStrong((id *)&self->_idsListener, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_appObserver, 0);

  objc_storeStrong((id *)&self->_kmlListener, 0);
}

@end