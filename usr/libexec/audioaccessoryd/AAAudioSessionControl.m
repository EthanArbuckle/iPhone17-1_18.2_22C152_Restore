@interface AAAudioSessionControl
+ (BOOL)supportsSecureCoding;
- (AAAudioSessionControl)init;
- (AAAudioSessionControl)initWithCoder:(id)a3;
- (NSXPCListenerEndpoint)testListenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (id)_ensureXPCStarted;
- (id)description;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (int)conversationDetectSignal;
- (unsigned)clientID;
- (void)_activate:(BOOL)a3;
- (void)_activateDirect:(id)a3;
- (void)_activateXPC:(id)a3 reactivate:(BOOL)a4;
- (void)_interrupted;
- (void)_invalidateDirect;
- (void)_invalidated;
- (void)_reportError:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setClientID:(unsigned int)a3;
- (void)setConversationDetectSignal:(int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMuteAction:(int)a3 auditToken:(id *)a4;
- (void)setMuteAction:(int)a3 auditToken:(id *)a4 bundleIdentifier:(id)a5;
- (void)setTestListenerEndpoint:(id)a3;
@end

@implementation AAAudioSessionControl

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AAAudioSessionControl)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AAAudioSessionControl *)self init];
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_clientID = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_conversationDetectSignal = 0;
    }
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t clientID = self->_clientID;
  id v7 = v4;
  if (clientID)
  {
    [v4 encodeInt64:clientID forKey:@"cid"];
    id v4 = v7;
  }
  uint64_t conversationDetectSignal = self->_conversationDetectSignal;
  if (conversationDetectSignal)
  {
    [v7 encodeInteger:conversationDetectSignal forKey:@"cds"];
    id v4 = v7;
  }
}

- (id)description
{
  NSAppendPrintF();
  id v3 = 0;
  id v4 = v3;
  if (self->_direct)
  {
    id v7 = v3;
    NSAppendPrintF_safe();
    id v5 = v7;

    id v4 = v5;
  }

  return v4;
}

- (AAAudioSessionControl)init
{
  v5.receiver = self;
  v5.super_class = (Class)AAAudioSessionControl;
  v2 = [(AAAudioSessionControl *)&v5 init];
  if (v2)
  {
    v2->_uint64_t clientID = sub_1000046E8();
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    id v3 = v2;
  }

  return v2;
}

- (void)setConversationDetectSignal:(int)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_activateCalled)
  {
    dispatchQueue = v4->_dispatchQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100003000;
    v6[3] = &unk_1002325D0;
    v6[4] = v4;
    int v7 = a3;
    dispatch_async(dispatchQueue, v6);
  }
  else
  {
    v4->_uint64_t conversationDetectSignal = a3;
  }
  objc_sync_exit(v4);
}

- (void)setMuteAction:(int)a3 auditToken:(id *)a4
{
  long long v4 = *(_OWORD *)&a4->var0[4];
  v5[0] = *(_OWORD *)a4->var0;
  v5[1] = v4;
  [(AAAudioSessionControl *)self setMuteAction:*(void *)&a3 auditToken:v5 bundleIdentifier:0];
}

- (void)setMuteAction:(int)a3 auditToken:(id *)a4 bundleIdentifier:(id)a5
{
  id v8 = a5;
  if (dword_100260B70 <= 30 && (dword_100260B70 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v9 = self;
  objc_sync_enter(v9);
  if (v9->_activateCalled)
  {
    dispatchQueue = v9->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    long long v11 = *(_OWORD *)&a4->var0[4];
    long long v15 = *(_OWORD *)a4->var0;
    block[2] = sub_100003284;
    block[3] = &unk_1002325F8;
    block[4] = v9;
    int v14 = a3;
    long long v16 = v11;
    id v13 = v8;
    dispatch_async(dispatchQueue, block);
  }
  else if (dword_100260B70 <= 90 && (dword_100260B70 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_sync_exit(v9);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000343C;
  v7[3] = &unk_100232620;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)_activate:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_100260B70 <= 30 && (dword_100260B70 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_testListenerEndpoint) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = qword_10026AAD0 == 0;
  }
  BOOL v6 = !v5;
  self->_direct = v6;
  if (self->_invalidateCalled)
  {
    NSErrorF();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (dword_100260B70 <= 90 && (dword_100260B70 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v8 = (void (**)(id, id))objc_retainBlock(self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v8) {
      v8[2](v8, v10);
    }
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100003770;
    v11[3] = &unk_100232648;
    v11[4] = self;
    BOOL v12 = v3;
    int v7 = objc_retainBlock(v11);
    if (self->_direct) {
      [(AAAudioSessionControl *)self _activateDirect:v7];
    }
    else {
      [(AAAudioSessionControl *)self _activateXPC:v7 reactivate:v3];
    }
  }
}

- (void)_activateDirect:(id)a3
{
  id v4 = a3;
  if (dword_100260B70 <= 30 && (dword_100260B70 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  BOOL v5 = (void *)qword_10026AAD0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000039F8;
  v7[3] = &unk_100232698;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 activateAudioSessionControl:self completion:v7];
}

- (void)_activateXPC:(id)a3 reactivate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (dword_100260B70 > 30) {
      goto LABEL_15;
    }
    if (dword_100260B70 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  if (dword_100260B70 > 30) {
    goto LABEL_15;
  }
  if (dword_100260B70 != -1 || _LogCategory_Initialize()) {
LABEL_7:
  }
    LogPrintF();
LABEL_11:
  if (dword_100260B70 <= 30 && (dword_100260B70 != -1 || _LogCategory_Initialize()))
  {
    uint64_t clientID = self->_clientID;
    LogPrintF();
  }
LABEL_15:
  int v7 = [(AAAudioSessionControl *)self _ensureXPCStarted];
  if (v7)
  {
    v6[2](v6, v7);
  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100003CFC;
    v14[3] = &unk_1002326C0;
    BOOL v16 = v4;
    v9 = v6;
    long long v15 = v9;
    id v10 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v14];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100003E08;
    v12[3] = &unk_1002326E8;
    id v13 = v9;
    [v10 audioSessionControlActivate:self completion:v12];
  }
}

- (id)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    BOOL v3 = self->_testListenerEndpoint;
    id v4 = objc_alloc((Class)NSXPCConnection);
    if (v3) {
      BOOL v5 = (NSXPCConnection *)[v4 initWithListenerEndpoint:v3];
    }
    else {
      BOOL v5 = (NSXPCConnection *)[v4 initWithMachServiceName:@"com.apple.AudioAccessoryServices" options:0];
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    int v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AAServicesXPCClientInterface];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v7];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100003FB0;
    v11[3] = &unk_100232710;
    v11[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v11];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100003FB8;
    v10[3] = &unk_100232710;
    v10[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v10];
    id v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AAServicesXPCDaemonInterface];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v8];

    [(NSXPCConnection *)self->_xpcCnx resume];
  }
  return 0;
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100260B70 <= 50 && (dword_100260B70 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  BOOL v3 = BTErrorF();
  [(AAAudioSessionControl *)self _reportError:v3];

  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  if (self->_activateCalled) {
    [(AAAudioSessionControl *)self _activate:1];
  }
  id interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler)
  {
    id v6 = (void (*)(void))*((void *)interruptionHandler + 2);
    v6();
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000415C;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_invalidateDirect
{
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && dword_100260B70 <= 50
      && (dword_100260B70 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_direct && !self->_xpcCnx)
    {
      id v8 = (void (**)(id, void *))objc_retainBlock(self->_activateCompletion);
      id activateCompletion = self->_activateCompletion;
      self->_id activateCompletion = 0;

      if (v8)
      {
        id v4 = BTErrorF();
        v8[2](v8, v4);
      }
      BOOL v5 = (void (**)(void))objc_retainBlock(self->_invalidationHandler);
      id invalidationHandler = self->_invalidationHandler;
      self->_id invalidationHandler = 0;

      if (v5) {
        v5[2](v5);
      }
      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0;

      self->_invalidateDone = 1;
      if (dword_100260B70 <= 10 && (dword_100260B70 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
}

- (void)_reportError:(id)a3
{
  id v6 = a3;
  if (dword_100260B70 <= 90 && (dword_100260B70 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v4 = (void (**)(id, id))objc_retainBlock(self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  if (v4) {
    v4[2](v4, v6);
  }
}

- (int)conversationDetectSignal
{
  return self->_conversationDetectSignal;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_uint64_t clientID = a3;
}

- (NSXPCListenerEndpoint)testListenerEndpoint
{
  return self->_testListenerEndpoint;
}

- (void)setTestListenerEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);

  objc_storeStrong(&self->_activateCompletion, 0);
}

@end