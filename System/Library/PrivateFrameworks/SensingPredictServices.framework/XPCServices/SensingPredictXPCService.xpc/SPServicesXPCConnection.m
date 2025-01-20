@interface SPServicesXPCConnection
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)entitled;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (SPContext)context;
- (SPContextMonitor)contextMonitor;
- (SPXPCService)xpcService;
- (void)contextMonitorActivate:(id)a3 completion:(id)a4;
- (void)contextMonitorReportContextSignalUpdated:(id)a3 contextFusedState:(unsigned int)a4;
- (void)contextMonitorReportLocationChanged:(id)a3;
- (void)contextMonitorUpdate:(id)a3;
- (void)setContext:(id)a3;
- (void)setContextMonitor:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEntitled:(BOOL)a3;
- (void)setXpcCnx:(id)a3;
- (void)setXpcService:(id)a3;
@end

@implementation SPServicesXPCConnection

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled) {
    return 1;
  }
  v6 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.SensingPredict"];
  unsigned int v7 = [v6 isEqual:&__kCFBooleanTrue];

  if (v7)
  {
    BOOL result = 1;
    self->_entitled = 1;
  }
  else
  {
    if (dword_10001A288 <= 90 && (dword_10001A288 != -1 || _LogCategory_Initialize()))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    if (a3)
    {
      NSErrorF();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a3 = v8;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)contextMonitorActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100009424;
  v21 = sub_100009434;
  id v22 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000943C;
  v14[3] = &unk_1000148B0;
  v16 = &v17;
  id v8 = a4;
  id v15 = v8;
  v9 = objc_retainBlock(v14);
  if (dword_10001A288 <= 30 && (dword_10001A288 != -1 || _LogCategory_Initialize()))
  {
    id v12 = v7;
    LogPrintF();
  }
  v10 = (id *)(v18 + 5);
  id obj = (id)v18[5];
  unsigned __int8 v11 = -[SPServicesXPCConnection _entitledAndReturnError:](self, "_entitledAndReturnError:", &obj, v12);
  objc_storeStrong(v10, obj);
  if (v11)
  {
    objc_storeStrong((id *)&self->_contextMonitor, a3);
    objc_storeStrong((id *)&self->_xpcService->_contextMonitor, a3);
    if (v8) {
      (*((void (**)(id, void))v8 + 2))(v8, 0);
    }
    [(SPXPCService *)self->_xpcService _update];
  }
  ((void (*)(void *))v9[2])(v9);

  _Block_object_dispose(&v17, 8);
}

- (void)contextMonitorUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_100009424;
  uint64_t v19 = sub_100009434;
  id v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100009750;
  v14[3] = &unk_1000148D8;
  void v14[4] = &v15;
  v5 = objc_retainBlock(v14);
  v6 = (id *)(v16 + 5);
  id obj = (id)v16[5];
  unsigned __int8 v7 = [(SPServicesXPCConnection *)self _entitledAndReturnError:&obj];
  objc_storeStrong(v6, obj);
  if (v7)
  {
    if (dword_10001A288 <= 30 && (dword_10001A288 != -1 || _LogCategory_Initialize()))
    {
      id v10 = v4;
      LogPrintF();
    }
    id v8 = [(SPContextMonitor *)self->_contextMonitor contextChangeFlags];
    id v9 = [v4 contextChangeFlags];
    if (v8 != v9)
    {
      if (dword_10001A288 <= 30 && (dword_10001A288 != -1 || _LogCategory_Initialize()))
      {
        id v11 = v8;
        id v12 = v9;
        LogPrintF();
      }
      -[SPContextMonitor setContextChangeFlags:](self->_contextMonitor, "setContextChangeFlags:", v9, v11, v12);
      [(SPXPCService *)self->_xpcService _update];
    }
  }
  ((void (*)(void *))v5[2])(v5);

  _Block_object_dispose(&v15, 8);
}

- (void)contextMonitorReportContextSignalUpdated:(id)a3 contextFusedState:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v13 = a3;
  v6 = self->_contextMonitor;
  if (v6)
  {
    if (dword_10001A288 <= 30 && (dword_10001A288 != -1 || _LogCategory_Initialize()))
    {
      unsigned int v7 = [v13 locationCategory];
      if (v7 > 9) {
        CFStringRef v8 = @"?";
      }
      else {
        CFStringRef v8 = (const __CFString *)*((void *)&off_100014910 + (char)v7);
      }
      if (v4 > 2) {
        id v9 = "?";
      }
      else {
        id v9 = off_1000148F8[(int)v4];
      }
      CFStringRef v11 = v8;
      id v12 = v9;
      LogPrintF();
    }
    id v10 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
    [v10 contextSignalUpdated:v13 fusedState:v4];
  }
}

- (void)contextMonitorReportLocationChanged:(id)a3
{
  id v9 = a3;
  uint64_t v4 = self->_contextMonitor;
  if (v4)
  {
    if (dword_10001A288 <= 30 && (dword_10001A288 != -1 || _LogCategory_Initialize()))
    {
      unsigned int v5 = [v9 locationCategory];
      if (v5 > 9) {
        CFStringRef v6 = @"?";
      }
      else {
        CFStringRef v6 = (const __CFString *)*((void *)&off_100014910 + (char)v5);
      }
      CFStringRef v8 = v6;
      LogPrintF();
    }
    unsigned int v7 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
    [v7 contextMonitorContextChanged:v9];
  }
}

- (SPContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (SPContextMonitor)contextMonitor
{
  return self->_contextMonitor;
}

- (void)setContextMonitor:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
}

- (SPXPCService)xpcService
{
  return self->_xpcService;
}

- (void)setXpcService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcService, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_contextMonitor, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end