@interface AUServiceShim
- (AUServiceShim)initWithCoder:(id)a3;
- (AUServiceShim)initWithDeviceClass:(id)a3 delegate:(id)delegate info:(id *)a5 options:(id)a6;
- (FudPluginDelegate)delegate;
- (NSString)deviceClass;
- (NSString)xpcServiceName;
- (NSXPCConnection)xpcServiceConn;
- (int)currentState;
- (void)applyFirmwareWithOptions:(id)a3;
- (void)bootstrapWithOptions:(id)a3;
- (void)closeXPCConnection;
- (void)connectToServer;
- (void)dealloc;
- (void)didApply:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didBootstrap:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didDownload:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didFind:(BOOL)a3 info:(id)a4 updateAvailable:(BOOL)a5 needsDownload:(BOOL)a6 error:(id)a7;
- (void)didFinish:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didPrepare:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)downloadFirmwareWithOptions:(id)a3;
- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4;
- (void)finishWithOptions:(id)a3;
- (void)handleServiceDisconnect;
- (void)issueNotification:(id)a3;
- (void)personalizationRequest:(id)a3;
- (void)personalizationResponse:(id)a3 response:(id)a4 status:(id)a5;
- (void)prepareFirmwareWithOptions:(id)a3;
- (void)progress:(double)a3;
- (void)progress:(double)a3 info:(id)a4;
- (void)queryDeviceList:(id *)a3;
- (void)reportAnalytics:(id)a3 info:(id)a4;
- (void)setCurrentState:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setXpcServiceConn:(id)a3;
- (void)setXpcServiceName:(id)a3;
@end

@implementation AUServiceShim

- (AUServiceShim)initWithDeviceClass:(id)a3 delegate:(id)delegate info:(id *)a5 options:(id)a6
{
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3052000000;
  v32 = sub_100007480;
  v33 = sub_100007490;
  uint64_t v34 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  v10 = (objc_class *)objc_opt_class();
  [delegate log:7, @"Initializing Plugin %@ for DeviceClass %@ with options %@", NSStringFromClass(v10), a3, a6 format];
  v24.receiver = self;
  v24.super_class = (Class)AUServiceShim;
  v11 = [(AUServiceShim *)&v24 init];
  v12 = v11;
  CFStringRef v13 = @"Init Failure";
  uint64_t v14 = 7;
  if (!delegate || !a3 || !v11) {
    goto LABEL_17;
  }
  v11->_deviceClass = (NSString *)a3;
  v11->_delegate = (FudPluginDelegate *)delegate;
  v11->_currentState = 2;
  v15 = (NSString *)objc_msgSend(a6, "objectForKey:", @"AUServiceName", @"Init Failure");
  v12->_xpcServiceName = v15;
  if (!v15)
  {
    CFStringRef v13 = @"Couldn't find XPCService name in options";
LABEL_16:
    delegate = v12->_delegate;
    uint64_t v14 = 3;
LABEL_17:
    [delegate log:v14 format:v13];
    goto LABEL_14;
  }
  if (*((unsigned char *)v26 + 24))
  {
    int v16 = -4;
    while (1)
    {
      int v17 = v16;
      [(AUServiceShim *)v12 connectToServer];
      xpcServiceConn = v12->_xpcServiceConn;
      if (!xpcServiceConn) {
        break;
      }
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10000749C;
      v23[3] = &unk_10007D1A0;
      v23[4] = v12;
      v23[5] = a3;
      v23[6] = &v35;
      v23[7] = &v25;
      id v19 = [(NSXPCConnection *)xpcServiceConn synchronousRemoteObjectProxyWithErrorHandler:v23];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10000751C;
      v22[3] = &unk_10007D1C8;
      v22[6] = &v35;
      v22[7] = &v25;
      v22[8] = &v29;
      v22[4] = v12;
      v22[5] = a3;
      [v19 deviceClassAttached:a3 options:a6 withReply:v22];
      if (*((unsigned char *)v26 + 24))
      {
        [(AUServiceShim *)v12 closeXPCConnection];
        +[NSThread sleepForTimeInterval:0.5];
        if (*((unsigned char *)v26 + 24))
        {
          int v16 = v17 + 1;
          if (v17) {
            continue;
          }
        }
      }
      goto LABEL_11;
    }
    CFStringRef v13 = @"Could not connect to XPCService";
    goto LABEL_16;
  }
LABEL_11:
  if (*((unsigned char *)v36 + 24))
  {
    *a5 = (id)v30[5];
  }
  else
  {
    [(AUServiceShim *)v12 closeXPCConnection];

    v12 = 0;
  }
LABEL_14:
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  return v12;
}

- (void)handleServiceDisconnect
{
  uint64_t currentState = self->_currentState;
  switch((int)currentState)
  {
    case 3:
      delegate = self->_delegate;
      [(FudPluginDelegate *)delegate didBootstrap:0 info:0 error:0];
      break;
    case 5:
      v4 = self->_delegate;
      [(FudPluginDelegate *)v4 didFind:0 info:0 updateAvailable:0 needsDownload:0 error:0];
      break;
    case 7:
      v5 = self->_delegate;
      [(FudPluginDelegate *)v5 didDownload:0 info:0 error:0];
      break;
    case 8:
      v6 = self->_delegate;
      [(FudPluginDelegate *)v6 didPrepare:0 info:0 error:0];
      break;
    case 9:
      v7 = self->_delegate;
      [(FudPluginDelegate *)v7 didApply:0 info:0 error:0];
      break;
    case 10:
      v8 = self->_delegate;
      [(FudPluginDelegate *)v8 didFinish:0 info:0 error:0];
      break;
    default:
      [(FudPluginDelegate *)self->_delegate log:3, @"XPC disconnected during unknown state: %d", currentState format];
      break;
  }
}

- (void)connectToServer
{
  if (!self->_xpcServiceConn)
  {
    v3 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithServiceName:self->_xpcServiceName];
    self->_xpcServiceConn = v3;
    if (v3)
    {
      uint64_t v4 = objc_opt_class();
      uint64_t v5 = objc_opt_class();
      v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, objc_opt_class(), 0);
      [(NSXPCConnection *)self->_xpcServiceConn setRemoteObjectInterface:+[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AUServiceProtocol]];
      [(NSXPCInterface *)[(NSXPCConnection *)self->_xpcServiceConn remoteObjectInterface] setClasses:v6 forSelector:"queryDeviceList:" argumentIndex:0 ofReply:1];
      [(NSXPCConnection *)self->_xpcServiceConn setExportedInterface:+[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AUDaemonProtocol]];
      [(NSXPCConnection *)self->_xpcServiceConn setExportedObject:self];
      v10[0] = 0;
      v10[1] = v10;
      v10[2] = 0x3052000000;
      v10[3] = sub_100007480;
      v10[4] = sub_100007490;
      v10[5] = self;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100007984;
      v9[3] = &unk_10007D1F0;
      v9[4] = self;
      v9[5] = v10;
      [(NSXPCConnection *)self->_xpcServiceConn setInvalidationHandler:v9];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000079F4;
      v8[3] = &unk_10007D1F0;
      v8[4] = self;
      v8[5] = v10;
      [(NSXPCConnection *)self->_xpcServiceConn setInterruptionHandler:v8];
      [(NSXPCConnection *)self->_xpcServiceConn resume];
      _Block_object_dispose(v10, 8);
    }
    else
    {
      delegate = self->_delegate;
      [(FudPluginDelegate *)delegate log:3 format:@"Failed to connect to XPCService"];
    }
  }
}

- (void)bootstrapWithOptions:(id)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3052000000;
  CFStringRef v13 = sub_100007480;
  uint64_t v14 = sub_100007490;
  uint64_t v15 = 0;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  xpcServiceConn = self->_xpcServiceConn;
  if (!xpcServiceConn)
  {
    char v9 = 0;
    goto LABEL_3;
  }
  self->_uint64_t currentState = 3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007BC8;
  v5[3] = &unk_10007D218;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = &v10;
  objc_msgSend(objc_msgSend(-[NSXPCConnection remoteObjectProxy](xpcServiceConn, "remoteObjectProxy"), "remoteObjectProxyWithErrorHandler:", v5), "bootstrapWithOptions:", a3);
  if (!*((unsigned char *)v7 + 24)) {
LABEL_3:
  }
    [(FudPluginDelegate *)self->_delegate didBootstrap:0 info:0 error:v11[5]];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint64_t v14 = sub_100007480;
  uint64_t v15 = sub_100007490;
  uint64_t v16 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  xpcServiceConn = self->_xpcServiceConn;
  if (!xpcServiceConn)
  {
    char v10 = 0;
    goto LABEL_3;
  }
  self->_uint64_t currentState = 5;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007DB8;
  v6[3] = &unk_10007D218;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = &v11;
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcServiceConn, "remoteObjectProxyWithErrorHandler:", v6), "findFirmwareWithOptions:remote:", a3, a4);
  if (!*((unsigned char *)v8 + 24)) {
LABEL_3:
  }
    [(FudPluginDelegate *)self->_delegate didFind:0 info:0 updateAvailable:0 needsDownload:0 error:v12[5]];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
}

- (void)downloadFirmwareWithOptions:(id)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = sub_100007480;
  uint64_t v14 = sub_100007490;
  uint64_t v15 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  xpcServiceConn = self->_xpcServiceConn;
  if (!xpcServiceConn)
  {
    char v9 = 0;
    goto LABEL_3;
  }
  self->_uint64_t currentState = 7;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007F90;
  v5[3] = &unk_10007D218;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = &v10;
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcServiceConn, "remoteObjectProxyWithErrorHandler:", v5), "downloadFirmwareWithOptions:", a3);
  if (!*((unsigned char *)v7 + 24)) {
LABEL_3:
  }
    [(FudPluginDelegate *)self->_delegate didDownload:0 info:0 error:v11[5]];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

- (void)prepareFirmwareWithOptions:(id)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = sub_100007480;
  uint64_t v14 = sub_100007490;
  uint64_t v15 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  xpcServiceConn = self->_xpcServiceConn;
  if (!xpcServiceConn)
  {
    char v9 = 0;
    goto LABEL_3;
  }
  self->_uint64_t currentState = 8;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100008168;
  v5[3] = &unk_10007D218;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = &v10;
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcServiceConn, "remoteObjectProxyWithErrorHandler:", v5), "prepareFirmwareWithOptions:", a3);
  if (!*((unsigned char *)v7 + 24)) {
LABEL_3:
  }
    [(FudPluginDelegate *)self->_delegate didPrepare:0 info:0 error:v11[5]];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

- (void)applyFirmwareWithOptions:(id)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = sub_100007480;
  uint64_t v14 = sub_100007490;
  uint64_t v15 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  xpcServiceConn = self->_xpcServiceConn;
  if (!xpcServiceConn)
  {
    char v9 = 0;
    goto LABEL_3;
  }
  self->_uint64_t currentState = 9;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100008340;
  v5[3] = &unk_10007D218;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = &v10;
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcServiceConn, "remoteObjectProxyWithErrorHandler:", v5), "applyFirmwareWithOptions:", a3);
  if (!*((unsigned char *)v7 + 24)) {
LABEL_3:
  }
    [(FudPluginDelegate *)self->_delegate didApply:0 info:0 error:v11[5]];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

- (void)finishWithOptions:(id)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = sub_100007480;
  uint64_t v14 = sub_100007490;
  uint64_t v15 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  xpcServiceConn = self->_xpcServiceConn;
  if (!xpcServiceConn)
  {
    char v9 = 0;
    goto LABEL_3;
  }
  self->_uint64_t currentState = 10;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000850C;
  v5[3] = &unk_10007D218;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = &v10;
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcServiceConn, "remoteObjectProxyWithErrorHandler:", v5), "finishWithOptions:", a3);
  if (!*((unsigned char *)v7 + 24)) {
LABEL_3:
  }
    [(FudPluginDelegate *)self->_delegate didFinish:0 info:0 error:v11[5]];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

- (void)queryDeviceList:(id *)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = sub_100007480;
  uint64_t v14 = sub_100007490;
  uint64_t v15 = 0;
  xpcServiceConn = self->_xpcServiceConn;
  if (xpcServiceConn)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000086E4;
    v9[3] = &unk_10007D240;
    v9[4] = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100008740;
    v8[3] = &unk_10007D268;
    v8[4] = &v10;
    objc_msgSend(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](xpcServiceConn, "synchronousRemoteObjectProxyWithErrorHandler:", v9), "queryDeviceList:", v8);
    uint64_t v6 = (id *)(v11 + 5);
    uint64_t v7 = (void *)v11[5];
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = (id *)&v15;
  }
  *a3 = v7;
  if (![*v6 count]) {
    [(AUServiceShim *)self closeXPCConnection];
  }
  _Block_object_dispose(&v10, 8);
}

- (void)closeXPCConnection
{
  xpcServiceConn = self->_xpcServiceConn;
  if (xpcServiceConn)
  {
    [(NSXPCConnection *)xpcServiceConn invalidate];
    self->_xpcServiceConn = 0;
    self->_uint64_t currentState = -1;
  }
}

- (void)dealloc
{
  [(AUServiceShim *)self closeXPCConnection];
  v3.receiver = self;
  v3.super_class = (Class)AUServiceShim;
  [(AUServiceShim *)&v3 dealloc];
}

- (void)progress:(double)a3 info:(id)a4
{
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (FudPluginDelegate *)a3;
}

- (void)didBootstrap:(BOOL)a3 info:(id)a4 error:(id)a5
{
  if (self->_currentState == 3)
  {
    uint64_t v8 = a3 & ~[(NSString *)self->_xpcServiceName containsString:@"AppleSTDP2700Bootstrap"];
    if ((v8 & 1) == 0) {
      [(AUServiceShim *)self closeXPCConnection];
    }
    delegate = self->_delegate;
    [(FudPluginDelegate *)delegate didBootstrap:v8 info:a4 error:a5];
  }
}

- (void)didFind:(BOOL)a3 info:(id)a4 updateAvailable:(BOOL)a5 needsDownload:(BOOL)a6 error:(id)a7
{
  if (self->_currentState == 5)
  {
    BOOL v8 = a6;
    BOOL v9 = a5;
    BOOL v11 = a3;
    if (!a3) {
      [(AUServiceShim *)self closeXPCConnection];
    }
    if (!v9) {
      [(AUServiceShim *)self closeXPCConnection];
    }
    delegate = self->_delegate;
    [(FudPluginDelegate *)delegate didFind:v11 info:a4 updateAvailable:v9 needsDownload:v8 error:a7];
  }
}

- (void)didDownload:(BOOL)a3 info:(id)a4 error:(id)a5
{
  if (self->_currentState == 7)
  {
    BOOL v7 = a3;
    if (!a3) {
      [(AUServiceShim *)self closeXPCConnection];
    }
    delegate = self->_delegate;
    [(FudPluginDelegate *)delegate didDownload:v7 info:a4 error:a5];
  }
}

- (void)didPrepare:(BOOL)a3 info:(id)a4 error:(id)a5
{
  if (self->_currentState == 8)
  {
    BOOL v7 = a3;
    if (!a3) {
      [(AUServiceShim *)self closeXPCConnection];
    }
    delegate = self->_delegate;
    [(FudPluginDelegate *)delegate didPrepare:v7 info:a4 error:a5];
  }
}

- (void)didApply:(BOOL)a3 info:(id)a4 error:(id)a5
{
  if (self->_currentState == 9)
  {
    BOOL v7 = a3;
    if (!a3) {
      [(AUServiceShim *)self closeXPCConnection];
    }
    delegate = self->_delegate;
    [(FudPluginDelegate *)delegate didApply:v7 info:a4 error:a5];
  }
}

- (void)didFinish:(BOOL)a3 info:(id)a4 error:(id)a5
{
  if (self->_currentState == 10)
  {
    BOOL v7 = a3;
    [(AUServiceShim *)self closeXPCConnection];
    delegate = self->_delegate;
    [(FudPluginDelegate *)delegate didFinish:v7 info:a4 error:a5];
  }
}

- (void)personalizationResponse:(id)a3 response:(id)a4 status:(id)a5
{
  xpcServiceConn = self->_xpcServiceConn;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008BBC;
  v6[3] = &unk_10007D240;
  v6[4] = self;
  objc_msgSend(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](xpcServiceConn, "synchronousRemoteObjectProxyWithErrorHandler:", v6), "personalizationResponse:response:status:", a3, a4, a5);
}

- (void)personalizationRequest:(id)a3
{
}

- (void)progress:(double)a3
{
}

- (void)reportAnalytics:(id)a3 info:(id)a4
{
}

- (void)issueNotification:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(FudPluginDelegate *)delegate issueNotification:a3];
  }
}

- (AUServiceShim)initWithCoder:(id)a3
{
  return 0;
}

- (int)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int)a3
{
  self->_uint64_t currentState = a3;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
  self->_deviceClass = (NSString *)a3;
}

- (FudPluginDelegate)delegate
{
  return self->_delegate;
}

- (NSString)xpcServiceName
{
  return self->_xpcServiceName;
}

- (void)setXpcServiceName:(id)a3
{
  self->_xpcServiceName = (NSString *)a3;
}

- (NSXPCConnection)xpcServiceConn
{
  return self->_xpcServiceConn;
}

- (void)setXpcServiceConn:(id)a3
{
  self->_xpcServiceConn = (NSXPCConnection *)a3;
}

@end