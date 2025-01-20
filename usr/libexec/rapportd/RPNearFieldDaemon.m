@interface RPNearFieldDaemon
+ (id)sharedNearFieldDaemon;
- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5;
- (BOOL)diagnosticCommand:(id)a3 params:(id)a4;
- (BOOL)hasCurrentTransaction;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)removeXPCMatchingToken:(unint64_t)a3;
- (OS_dispatch_queue)dispatchQueue;
- (RPNearFieldDaemon)init;
- (RPNearFieldDaemonController)nearFieldController;
- (id)_exportedInterface;
- (id)_remoteObjectInterface;
- (id)transactionChangedHandler;
- (void)_activate;
- (void)_invalidate;
- (void)_invalidated;
- (void)_updateNearFieldDiscoveryPref;
- (void)activate;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setNearFieldController:(id)a3;
- (void)setTransactionChangedHandler:(id)a3;
@end

@implementation RPNearFieldDaemon

+ (id)sharedNearFieldDaemon
{
  if (qword_100142CD8 != -1) {
    dispatch_once(&qword_100142CD8, &stru_100122D00);
  }
  v2 = (void *)qword_100142CD0;

  return v2;
}

- (RPNearFieldDaemon)init
{
  v5.receiver = self;
  v5.super_class = (Class)RPNearFieldDaemon;
  v2 = [(RPNearFieldDaemon *)&v5 init];
  v3 = v2;
  if (v2) {
    [(RPNearFieldDaemon *)v2 _updateNearFieldDiscoveryPref];
  }
  return v3;
}

- (BOOL)hasCurrentTransaction
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = [(RPNearFieldDaemon *)self nearFieldController];
  unsigned __int8 v4 = [v3 hasCurrentTransaction];

  return v4;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100054928;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  if (dword_1001415C8 <= 30 && (dword_1001415C8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ((sub_1000552F8() & 1) == 0)
  {
    if (dword_1001415C8 > 90 || dword_1001415C8 == -1 && !_LogCategory_Initialize()) {
      return;
    }
    goto LABEL_13;
  }
  if (!self->_xpcListener)
  {
    v3 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.rapport.nearfield.service"];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v3;

    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    [(NSXPCListener *)self->_xpcListener _setQueue:self->_dispatchQueue];
    [(NSXPCListener *)self->_xpcListener resume];
  }
  self->_invalidateCalled = 0;
  if (dword_1001415C8 <= 30 && (dword_1001415C8 != -1 || _LogCategory_Initialize()))
  {
LABEL_13:
    LogPrintF();
  }
}

- (void)invalidate
{
  if (dword_1001415C8 <= 30 && (dword_1001415C8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100054B84;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_1001415C8 <= 30 && (dword_1001415C8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(NSXPCListener *)self->_xpcListener invalidate];
    xpcListener = self->_xpcListener;
    self->_xpcListener = 0;

    [(RPNearFieldDaemonController *)self->_nearFieldController invalidate];
    nearFieldController = self->_nearFieldController;
    self->_nearFieldController = 0;

    [(RPNearFieldDaemon *)self _invalidated];
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_nearFieldController && !self->_xpcListener)
  {
    self->_invalidateDone = 1;
    self->_activateCalled = 0;
    if (dword_1001415C8 <= 30 && (dword_1001415C8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_updateNearFieldDiscoveryPref
{
  BOOL v3 = CFPrefs_GetInt64() != 0;
  self->_prefEnableDiscovery = v3;
  unsigned __int8 v4 = [(RPNearFieldDaemon *)self nearFieldController];
  [v4 setEnabled:v3];
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  return 0;
}

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  return 0;
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  return 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = [v5 cuValueForEntitlementNoCache:@"com.apple.rapport.nearfield"];
  unsigned int v7 = [v6 isEqual:&__kCFBooleanFalse];

  if (v7)
  {
    if (dword_1001415C8 <= 90 && (dword_1001415C8 != -1 || _LogCategory_Initialize()))
    {
      [v5 processIdentifier];
      LogPrintF();
    }
  }
  else
  {
    v8 = [(RPNearFieldDaemon *)self nearFieldController];

    if (v8)
    {
      v9 = [(RPNearFieldDaemon *)self nearFieldController];
      [v9 invalidate];
    }
    v10 = [[RPNearFieldDaemonController alloc] initWithConnection:v5 dispatchQueue:self->_dispatchQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100055048;
    v15[3] = &unk_100121158;
    v15[4] = self;
    [(RPNearFieldDaemonController *)v10 setTransactionChangedHandler:v15];
    [(RPNearFieldDaemonController *)v10 setEnabled:self->_prefEnableDiscovery];
    [(RPNearFieldDaemon *)self setNearFieldController:v10];
    v11 = [(RPNearFieldDaemon *)self _exportedInterface];
    [v5 setExportedInterface:v11];

    [v5 setExportedObject:v10];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000550C8;
    v14[3] = &unk_100121158;
    v14[4] = self;
    [v5 setInvalidationHandler:v14];
    v12 = [(RPNearFieldDaemon *)self _remoteObjectInterface];
    [v5 setRemoteObjectInterface:v12];

    [v5 _setQueue:self->_dispatchQueue];
    [v5 resume];
    if (dword_1001415C8 <= 30 && (dword_1001415C8 != -1 || _LogCategory_Initialize()))
    {
      [v5 processIdentifier];
      LogPrintF();
    }
  }
  return v7 ^ 1;
}

- (id)_remoteObjectInterface
{
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPNearFieldXPCClientInterface];
  [v2 setClass:objc_opt_class() forSelector:"didBeginTransaction:" argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:"didUpdateTransaction:" argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:"didInterruptTransaction:withError:" argumentIndex:0 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:"didInterruptTransaction:withError:" argumentIndex:1 ofReply:0];

  return v2;
}

- (id)_exportedInterface
{
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPNearFieldXPCDaemonInterface];
  [v2 setClass:objc_opt_class() forSelector:"startPolling:context:" argumentIndex:1 ofReply:0];

  return v2;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)transactionChangedHandler
{
  return self->_transactionChangedHandler;
}

- (void)setTransactionChangedHandler:(id)a3
{
}

- (RPNearFieldDaemonController)nearFieldController
{
  return self->_nearFieldController;
}

- (void)setNearFieldController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearFieldController, 0);
  objc_storeStrong(&self->_transactionChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end