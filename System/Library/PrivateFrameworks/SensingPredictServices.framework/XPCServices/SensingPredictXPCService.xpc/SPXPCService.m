@interface SPXPCService
+ (id)sharedInstance;
- (BOOL)_contextEngineShouldRun;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (SPXPCService)init;
- (void)_contextEngineEnsureStarted;
- (void)_contextEngineEnsureStopped;
- (void)_prefsChanged;
- (void)_update;
- (void)_updateContextEventSignal;
- (void)_updateLocationCategory;
- (void)_xpcConnectionInvalidated:(id)a3;
- (void)contextEventUpdated:(unsigned __int8)a3 fusedState:(unsigned int)a4;
- (void)locationCategoryChanged:(unsigned __int8)a3;
- (void)scheduleLocationCategoryUpdate;
@end

@implementation SPXPCService

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000827C;
  block[3] = &unk_100014660;
  block[4] = a1;
  if (qword_10001A538 != -1) {
    dispatch_once(&qword_10001A538, block);
  }
  v2 = (void *)qword_10001A540;

  return v2;
}

- (SPXPCService)init
{
  v12.receiver = self;
  v12.super_class = (Class)SPXPCService;
  v2 = [(SPXPCService *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.SPXPCService", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v2->_prefsChangedNotifyToken = -1;
    v6 = v2->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000083C4;
    handler[3] = &unk_100014888;
    v7 = v2;
    v11 = v7;
    notify_register_dispatch("com.apple.SensingPredict.prefsChanged", &v2->_prefsChangedNotifyToken, v6, handler);
    v8 = v7;
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = objc_alloc_init(SPServicesXPCConnection);
  [(SPServicesXPCConnection *)v6 setDispatchQueue:self->_dispatchQueue];
  [(SPServicesXPCConnection *)v6 setXpcCnx:v5];
  [(SPServicesXPCConnection *)v6 setXpcService:self];
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }
  [(NSMutableSet *)xpcConnections addObject:v6];
  v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SPXPCClientInterface];
  [v5 _setQueue:self->_dispatchQueue];
  v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SPXPCServiceInterface];
  [v5 setExportedInterface:v11];

  [v5 setExportedObject:v6];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100008614;
  v13[3] = &unk_100014718;
  v13[4] = self;
  v13[5] = v6;
  [v5 setInvalidationHandler:v13];
  [v5 setRemoteObjectInterface:v10];
  [v5 resume];
  if (dword_10001A288 <= 30 && (dword_10001A288 != -1 || _LogCategory_Initialize()))
  {
    [v5 processIdentifier];
    LogPrintF();
  }

  return 1;
}

- (void)_prefsChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v3 = CFPrefs_GetInt64() != 0;
  int prefsOverrideLocationCategory = self->_prefsOverrideLocationCategory;
  if (prefsOverrideLocationCategory != v3)
  {
    if (dword_10001A288 <= 10)
    {
      if (dword_10001A288 != -1)
      {
LABEL_4:
        id v5 = "yes";
        if (prefsOverrideLocationCategory) {
          v6 = "yes";
        }
        else {
          v6 = "no";
        }
        if (!v3) {
          id v5 = "no";
        }
        v11 = (void *)v6;
        objc_super v12 = (void *)v5;
        LogPrintF();
        goto LABEL_11;
      }
      if (_LogCategory_Initialize())
      {
        int prefsOverrideLocationCategory = self->_prefsOverrideLocationCategory;
        goto LABEL_4;
      }
    }
LABEL_11:
    self->_int prefsOverrideLocationCategory = v3;
    [(SPXPCService *)self scheduleLocationCategoryUpdate];
  }
  uint64_t Int64 = CFPrefs_GetInt64();
  uint64_t prefsLocationCategory = self->_prefsLocationCategory;
  if (Int64 == prefsLocationCategory) {
    goto LABEL_25;
  }
  if (dword_10001A288 <= 10)
  {
    if (dword_10001A288 != -1)
    {
LABEL_15:
      if (prefsLocationCategory > 9) {
        CFStringRef v9 = @"?";
      }
      else {
        CFStringRef v9 = (const __CFString *)*((void *)&off_100014910 + (char)prefsLocationCategory);
      }
      if (Int64 > 9u) {
        CFStringRef v10 = @"?";
      }
      else {
        CFStringRef v10 = (const __CFString *)*((void *)&off_100014910 + (char)Int64);
      }
      v11 = (void *)v9;
      objc_super v12 = (void *)v10;
      LogPrintF();
      goto LABEL_24;
    }
    if (_LogCategory_Initialize())
    {
      LODWORD(prefsLocationCategory) = self->_prefsLocationCategory;
      goto LABEL_15;
    }
  }
LABEL_24:
  self->_uint64_t prefsLocationCategory = Int64;
  [(SPXPCService *)self scheduleLocationCategoryUpdate];
LABEL_25:
  if (Int64) {
    [(SPXPCService *)self _update];
  }
}

- (void)_update
{
  if ([(SPXPCService *)self _contextEngineShouldRun])
  {
    [(SPXPCService *)self _contextEngineEnsureStarted];
  }
  else
  {
    [(SPXPCService *)self _contextEngineEnsureStopped];
  }
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (dword_10001A288 <= 20)
  {
    if (dword_10001A288 != -1 || (v6 = _LogCategory_Initialize(), id v4 = v8, v6))
    {
      id v5 = [v4 xpcCnx];
      id v7 = [v5 processIdentifier];
      LogPrintF();

      id v4 = v8;
    }
  }
  objc_msgSend(v4, "xpcConnectionInvalidated", v7);
  [(NSMutableSet *)self->_xpcConnections removeObject:v8];
  [(SPXPCService *)self _update];
}

- (BOOL)_contextEngineShouldRun
{
  id v2 = [(NSMutableSet *)self->_xpcConnections count];
  if (v2)
  {
    if (_os_feature_enabled_impl())
    {
      LOBYTE(v2) = 1;
      return (char)v2;
    }
    if (dword_10001A288 > 30)
    {
LABEL_7:
      LOBYTE(v2) = 0;
      return (char)v2;
    }
    if (dword_10001A288 != -1 || (LODWORD(v2) = _LogCategory_Initialize(), v2))
    {
      LogPrintF();
      goto LABEL_7;
    }
  }
  return (char)v2;
}

- (void)_contextEngineEnsureStarted
{
  contextEngine = self->_contextEngine;
  if (!contextEngine)
  {
    id v4 = [[SPContextEngine alloc] initWithQueue:self->_dispatchQueue];
    id v5 = self->_contextEngine;
    self->_contextEngine = v4;

    [(SPContextEngine *)self->_contextEngine activate];
    contextEngine = self->_contextEngine;
  }
  id v6 = [(SPContextMonitor *)self->_contextMonitor contextChangeFlags];

  [(SPContextEngine *)contextEngine processContextChangeFlags:v6];
}

- (void)_contextEngineEnsureStopped
{
  [(SPContextEngine *)self->_contextEngine invalidate];
  contextEngine = self->_contextEngine;
  self->_contextEngine = 0;
}

- (void)locationCategoryChanged:(unsigned __int8)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_locationCategory = a3;

  [(SPXPCService *)self scheduleLocationCategoryUpdate];
}

- (void)_updateContextEventSignal
{
  self->_conextEventSignalPending = 0;
  currentContext = self->_currentContext;
  if (!currentContext)
  {
    id v4 = (SPContext *)objc_alloc_init((Class)SPContext);
    id v5 = self->_currentContext;
    self->_currentContext = v4;

    currentContext = self->_currentContext;
  }
  uint64_t v6 = 57;
  if (!self->_prefsOverrideLocationCategory) {
    uint64_t v6 = 48;
  }
  LODWORD(v7) = *((unsigned __int8 *)&self->super.isa + v6);
  if (v7 != [(SPContext *)currentContext locationCategory]
    && self->_spFusedState)
  {
    if (dword_10001A288 <= 30 && (dword_10001A288 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = (char)v7;
      unsigned int v8 = [(SPContext *)self->_currentContext locationCategory];
      if (v8 > 9) {
        CFStringRef v9 = @"?";
      }
      else {
        CFStringRef v9 = (const __CFString *)*((void *)&off_100014910 + (char)v8);
      }
      if (v7 > 9) {
        CFStringRef v10 = @"?";
      }
      else {
        CFStringRef v10 = (const __CFString *)*((void *)&off_100014910 + v7);
      }
      uint64_t spFusedState = (int)self->_spFusedState;
      if (spFusedState > 2) {
        objc_super v12 = "?";
      }
      else {
        objc_super v12 = off_1000148F8[spFusedState];
      }
      CFStringRef v19 = v10;
      v20 = v12;
      CFStringRef v18 = v9;
      LogPrintF();
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v13 = self->_xpcConnections;
    id v14 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "contextMonitorReportContextSignalUpdated:contextFusedState:", self->_currentContext, self->_spFusedState, v18, v19, v20);
        }
        id v15 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v15);
    }
  }
}

- (void)contextEventUpdated:(unsigned __int8)a3 fusedState:(unsigned int)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_conextEventSignalPending)
  {
    self->_conextEventSignalPending = 1;
    self->_locationCategory = a3;
    self->_uint64_t spFusedState = a4;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008DD8;
    block[3] = &unk_100014688;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)scheduleLocationCategoryUpdate
{
  if (!self->_locationUpdatePending)
  {
    self->_locationUpdatePending = 1;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008E64;
    block[3] = &unk_100014688;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)_updateLocationCategory
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_locationUpdatePending = 0;
  currentContext = self->_currentContext;
  if (!currentContext)
  {
    id v4 = (SPContext *)objc_alloc_init((Class)SPContext);
    id v5 = self->_currentContext;
    self->_currentContext = v4;

    currentContext = self->_currentContext;
  }
  uint64_t v6 = 57;
  if (!self->_prefsOverrideLocationCategory) {
    uint64_t v6 = 48;
  }
  LODWORD(v7) = *((unsigned __int8 *)&self->super.isa + v6);
  if (v7 != [(SPContext *)currentContext locationCategory])
  {
    uint64_t v7 = (char)v7;
    if (dword_10001A288 <= 30 && (dword_10001A288 != -1 || _LogCategory_Initialize()))
    {
      unsigned int v8 = [(SPContext *)self->_currentContext locationCategory];
      if (v8 > 9) {
        CFStringRef v9 = @"?";
      }
      else {
        CFStringRef v9 = (const __CFString *)*((void *)&off_100014910 + (char)v8);
      }
      if (v7 > 9) {
        CFStringRef v10 = @"?";
      }
      else {
        CFStringRef v10 = (const __CFString *)*((void *)&off_100014910 + v7);
      }
      CFStringRef v16 = v9;
      CFStringRef v17 = v10;
      LogPrintF();
    }
    -[SPContext setLocationCategory:](self->_currentContext, "setLocationCategory:", v7, v16, v17);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v11 = self->_xpcConnections;
    id v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * i) contextMonitorReportLocationChanged:self->_currentContext];
        }
        id v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_contextMonitor, 0);
  objc_storeStrong((id *)&self->_contextEngine, 0);

  objc_storeStrong((id *)&self->_currentContext, 0);
}

@end