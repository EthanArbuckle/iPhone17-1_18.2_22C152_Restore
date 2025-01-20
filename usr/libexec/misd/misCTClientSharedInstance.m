@interface misCTClientSharedInstance
+ (id)sharedInstance;
- (BOOL)isDualSim;
- (BOOL)registerCellularDataStatusNotification:(BOOL)a3 callback:(void *)a4 callbackArg:(void *)a5;
- (__CTServerConnection)ctServerConnection;
- (int)activateTethering:(BOOL)a3;
- (int)getTetheringInterfaceName:(char *)a3;
- (int)getTetheringStatus:(mis_ctinterface_tethering_status *)a3;
- (int)isDataPlanEnabled:(BOOL *)a3;
- (misCTClientSharedInstance)init;
- (void)_setupCTServerConnection;
- (void)_updateDualSimStatus;
- (void)convertConnectionStatus:(id)a3 ctInterfaceConnStatus:(mis_ctinterface_ct_conn_status *)a4;
- (void)convertTetheringStatus:(mis_ctinterface_tethering_status *)a3 CTStatus:(id)a4;
- (void)dealloc;
- (void)handleCTNotification:(__CFString *)a3 notificationInfo:(__CFDictionary *)a4;
- (void)processCTConnectionStateChangeNotification:(id)a3 connection:(int)a4 connectionStatus:(id)a5 ctInterfaceConnStatus:(mis_ctinterface_ct_conn_status *)a6;
- (void)processCTTetheringStatusChangeNotification:(id)a3;
@end

@implementation misCTClientSharedInstance

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022148;
  block[3] = &unk_100034FD0;
  block[4] = a1;
  if (qword_100039410 != -1) {
    dispatch_once(&qword_100039410, block);
  }
  return (id)qword_100039418;
}

- (misCTClientSharedInstance)init
{
  v5.receiver = self;
  v5.super_class = (Class)misCTClientSharedInstance;
  v2 = [(misCTClientSharedInstance *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(misCTClientSharedInstance *)v2 _setupCTServerConnection];
    v3->_CTAssertion = 0;
  }
  return v3;
}

- (void)dealloc
{
  ctServerConnection = self->_ctServerConnection;
  if (ctServerConnection)
  {
    CFRelease(ctServerConnection);
    self->_ctServerConnection = 0;
  }
  CTAssertion = self->_CTAssertion;
  if (CTAssertion)
  {
    CFRelease(CTAssertion);
    self->_CTAssertion = 0;
  }
  [(CoreTelephonyClient *)self->_ctClient setDelegate:0];
  sub_100005EAC();
  v5.receiver = self;
  v5.super_class = (Class)misCTClientSharedInstance;
  [(misCTClientSharedInstance *)&v5 dealloc];
}

- (void)_setupCTServerConnection
{
  if (!self->_ctServerConnection)
  {
    v3 = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
    self->_ctServerConnection = v3;
    if (!v3
      || (sub_100005EAC(),
          id v4 = objc_alloc((Class)CoreTelephonyClient),
          self->_ctClient = (CoreTelephonyClient *)[v4 initWithQueue:qword_100039470],
          self->_ctClientDelegates = objc_alloc_init(misCTClientDelegates),
          (unint64_t)_CTServerConnectionRegisterForNotification() >> 32)
      || (unint64_t)_CTServerConnectionRegisterForNotification() >> 32)
    {
      sub_100005EAC();
      if (self->_ctServerConnection)
      {
        sub_100005EAC();
        CFRelease(self->_ctServerConnection);
        self->_ctServerConnection = 0;
      }
    }
  }
}

- (__CTServerConnection)ctServerConnection
{
  result = self->_ctServerConnection;
  if (!result)
  {
    [(misCTClientSharedInstance *)self _setupCTServerConnection];
    return self->_ctServerConnection;
  }
  return result;
}

- (BOOL)registerCellularDataStatusNotification:(BOOL)a3 callback:(void *)a4 callbackArg:(void *)a5
{
  BOOL v7 = a3;
  v9 = "NO";
  if (a3) {
    v9 = "YES";
  }
  v11 = v9;
  sub_100005EAC();
  if (!v7)
  {
    -[CoreTelephonyClient setDelegate:](self->_ctClient, "setDelegate:", 0, v11);
    self->_eventCallback = 0;
    self->_eventCallbackArg = 0;
    return 1;
  }
  if (self->_ctServerConnection)
  {
    -[CoreTelephonyClient setDelegate:](self->_ctClient, "setDelegate:", self->_ctClientDelegates, v11);
    self->_eventCallback = a4;
    self->_eventCallbackArg = a5;
    return 1;
  }
  sub_100005EAC();
  return 0;
}

- (void)_updateDualSimStatus
{
  uint64_t v6 = 0;
  self->_isDualSim = 0;
  ctClient = self->_ctClient;
  if (ctClient)
  {
    id v4 = [(CoreTelephonyClient *)ctClient getSubscriptionInfoWithError:&v6];
    if (!v6)
    {
      objc_super v5 = v4;
      if (v4)
      {
        if ([v4 subscriptionsInUse]
          && (unint64_t)objc_msgSend(objc_msgSend(v5, "subscriptionsInUse"), "count") > 1)
        {
          self->_isDualSim = 1;
        }
      }
    }
  }
  sub_100005EAC();
}

- (BOOL)isDualSim
{
  return self->_isDualSim;
}

- (int)activateTethering:(BOOL)a3
{
  if (!self->_ctClient)
  {
    sub_100005EAC();
    return -1;
  }
  BOOL v3 = a3;
  if (![(misCTClientSharedInstance *)self ctServerConnection]) {
    sub_10002772C();
  }
  if (v3)
  {
    id v9 = 0;
    sub_100005EAC();
    ctClient = self->_ctClient;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100022718;
    v8[3] = &unk_100035020;
    v8[4] = self;
    self->_CTAssertion = -[CoreTelephonyClient createAssertionForConnectionType:allocator:error:onReAssertError:](ctClient, "createAssertionForConnectionType:allocator:error:onReAssertError:", 4, 0, &v9, v8, "-[misCTClientSharedInstance activateTethering:]");
    int result = (int)v9;
    if (v9)
    {
      id v7 = [[objc_msgSend(v9, "description") UTF8String];
      sub_100005EAC();
      -[misCTClientSharedInstance activateTethering:](self, "activateTethering:", 0, "-[misCTClientSharedInstance activateTethering:]", v7);
      return -1;
    }
  }
  else if (self->_CTAssertion)
  {
    sub_100005EAC();
    CFRelease(self->_CTAssertion);
    int result = 0;
    self->_CTAssertion = 0;
  }
  else
  {
    return 0;
  }
  return result;
}

- (void)convertConnectionStatus:(id)a3 ctInterfaceConnStatus:(mis_ctinterface_ct_conn_status *)a4
{
  uint64_t v6 = +[NSMutableString stringWithCapacity:20];
  unsigned int v7 = [a3 state];
  if (v7 >= 4)
  {
    [a3 state];
    sub_100005EAC();
  }
  else
  {
    int v8 = v7 + 1;
    [(NSMutableString *)v6 setString:off_100035040[v7]];
    a4->var0 = v8;
    id v9 = [(NSMutableString *)v6 UTF8String];
    id v10 = [[[a3 interfaceName] UTF8String];
    id v11 = [[objc_msgSend(a3, "pdp") intValue];
    sub_100005EAC();
    if (objc_msgSend(a3, "interfaceName", v9, v10, v11))
    {
      strncpy(a4->var2, (const char *)[objc_msgSend(objc_msgSend(a3, "interfaceName"), "UTF8String") UTF8String], 0xFuLL);
      a4->var1 = [objc_msgSend(objc_msgSend(a3, "pdp"), "intValue") intValue];
    }
    else
    {
      a4->var2[0] = 0;
      a4->var1 = -1;
    }
  }
}

- (void)convertTetheringStatus:(mis_ctinterface_tethering_status *)a3 CTStatus:(id)a4
{
  if (![a4 carrierEnabled]
    || !objc_msgSend(objc_msgSend(a4, "carrierEnabled"), "intValue"))
  {
    a3->var0 = 0;
LABEL_9:
    a3->var1 = 0;
    goto LABEL_10;
  }
  a3->var0 = 1;
  if (![a4 userAuthenticated]
    || !objc_msgSend(objc_msgSend(a4, "userAuthenticated"), "intValue"))
  {
    goto LABEL_9;
  }
  a3->var1 = 1;
  if ([a4 connectionAvailabilityStatus]
    && (objc_msgSend(objc_msgSend(a4, "connectionAvailabilityStatus"), "available") & 1) != 0)
  {
    BOOL v7 = 1;
    goto LABEL_11;
  }
LABEL_10:
  BOOL v7 = 0;
LABEL_11:
  a3->var2 = v7;
  if ([a4 misPdpMaxHosts]) {
    unsigned int v8 = [[objc_msgSend(a4, "misPdpMaxHosts") intValue];
  }
  else {
    unsigned int v8 = 3;
  }
  a3->var3 = v8;
  id v9 = [a4 connectionStatus];

  [(misCTClientSharedInstance *)self convertConnectionStatus:v9 ctInterfaceConnStatus:&a3->var4];
}

- (int)getTetheringStatus:(mis_ctinterface_tethering_status *)a3
{
  id v8 = 0;
  ctClient = self->_ctClient;
  if (!ctClient) {
    goto LABEL_4;
  }
  id v6 = [(CoreTelephonyClient *)ctClient getTetheringStatusSync:&v8 connectionType:4];
  if (v8)
  {
    [objc_msgSend(v8, "domain") UTF8String];
    [v8 code];
    [objc_msgSend(v8, "description") UTF8String];
LABEL_4:
    sub_100005EAC();
    return -1;
  }
  if (!v6) {
    goto LABEL_4;
  }
  [(misCTClientSharedInstance *)self convertTetheringStatus:a3 CTStatus:v6];
  [objc_msgSend(objc_msgSend(objc_msgSend(v6, "connectionStatus"), "interfaceName"), "UTF8String"]
  sub_100005EAC();
  return 0;
}

- (int)getTetheringInterfaceName:(char *)a3
{
  long long v6 = 0u;
  *(_OWORD *)BOOL v7 = 0u;
  unsigned int v4 = [(misCTClientSharedInstance *)self getTetheringStatus:&v6];
  int result = -1;
  if (!v4)
  {
    if (v7[0])
    {
      strncpy(a3, v7, 0xFuLL);
      return 0;
    }
  }
  return result;
}

- (int)isDataPlanEnabled:(BOOL *)a3
{
  *a3 = 0;
  [(misCTClientSharedInstance *)self ctServerConnection];
  if (!((unint64_t)_CTServerConnectionGetCellularDataIsEnabled() >> 32)) {
    return 0;
  }
  sub_100005EAC();
  return 12;
}

- (void)processCTTetheringStatusChangeNotification:(id)a3
{
  if (a3)
  {
    memset(v5, 0, sizeof(v5));
    [(misCTClientSharedInstance *)self convertTetheringStatus:v5 CTStatus:a3];
    eventCallback = (void (*)(uint64_t, _OWORD *, void *))self->_eventCallback;
    if (eventCallback) {
      eventCallback(1, v5, self->_eventCallbackArg);
    }
  }
  else
  {
    sub_100005EAC();
  }
}

- (void)processCTConnectionStateChangeNotification:(id)a3 connection:(int)a4 connectionStatus:(id)a5 ctInterfaceConnStatus:(mis_ctinterface_ct_conn_status *)a6
{
  if (a4 == 4)
  {
    [(misCTClientSharedInstance *)self convertConnectionStatus:a5 ctInterfaceConnStatus:a6];
    eventCallback = (void (*)(uint64_t, mis_ctinterface_ct_conn_status *, void *))self->_eventCallback;
    if (eventCallback)
    {
      eventCallbackArg = self->_eventCallbackArg;
      eventCallback(2, a6, eventCallbackArg);
    }
  }
  else
  {
    sub_100005EAC();
  }
}

- (void)handleCTNotification:(__CFString *)a3 notificationInfo:(__CFDictionary *)a4
{
  if (!self->_eventCallback) {
    goto LABEL_11;
  }
  if (!CFEqual(a3, kCTConnectionInvalidatedNotification))
  {
    if (CFEqual(a3, kCTDaemonReadyNotification))
    {
      uint64_t v7 = 4;
      goto LABEL_7;
    }
    CFStringGetCStringPtr(a3, 0x8000100u);
LABEL_11:
    sub_100005EAC();
    return;
  }
  uint64_t v7 = 3;
LABEL_7:
  eventCallback = (void (*)(uint64_t, __CFDictionary *, void *))self->_eventCallback;
  eventCallbackArg = self->_eventCallbackArg;

  eventCallback(v7, a4, eventCallbackArg);
}

@end