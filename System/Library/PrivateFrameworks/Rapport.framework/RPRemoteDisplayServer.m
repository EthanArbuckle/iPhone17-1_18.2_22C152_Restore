@interface RPRemoteDisplayServer
+ (BOOL)supportsSecureCoding;
- (NSArray)allowedMACAddresses;
- (NSArray)pairSetupACL;
- (NSData)pairingInfo;
- (NSString)password;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (RPRemoteDisplayServer)init;
- (RPRemoteDisplayServer)initWithCoder:(id)a3;
- (id)authCompletionHandler;
- (id)description;
- (id)hidePasswordHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)promptForPasswordHandler;
- (id)sessionEndedHandler;
- (id)sessionStartHandler;
- (id)showPasswordHandler;
- (int)passwordType;
- (int)passwordTypeActual;
- (unsigned)internalAuthFlags;
- (unsigned)pairSetupFlags;
- (unsigned)pairVerifyFlags;
- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidated;
- (void)activateWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)remoteDisplayHidePasswordWithFlags:(unsigned int)a3;
- (void)remoteDisplayReceivedEventID:(id)a3 event:(id)a4 options:(id)a5 sessionID:(id)a6;
- (void)remoteDisplayReceivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 sessionID:(id)a7;
- (void)remoteDisplaySessionEndedWithID:(id)a3;
- (void)remoteDisplayShowPassword:(id)a3 flags:(unsigned int)a4;
- (void)remoteDisplayStartServerSessionID:(id)a3 device:(id)a4 linkType:(id)a5 completion:(id)a6;
- (void)setAllowedMACAddresses:(id)a3;
- (void)setAuthCompletionHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setHidePasswordHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPairSetupACL:(id)a3;
- (void)setPairSetupFlags:(unsigned int)a3;
- (void)setPairVerifyFlags:(unsigned int)a3;
- (void)setPairingInfo:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordType:(int)a3;
- (void)setPromptForPasswordHandler:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setSessionEndedHandler:(id)a3;
- (void)setSessionStartHandler:(id)a3;
- (void)setShowPasswordHandler:(id)a3;
- (void)startPairingServerWithCompletion:(id)a3;
- (void)stopPairingServer;
- (void)tryPassword:(id)a3;
@end

@implementation RPRemoteDisplayServer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPRemoteDisplayServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPRemoteDisplayServer;
  v2 = [(RPRemoteDisplayServer *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v3->_passwordType = 3;
    v4 = v3;
  }

  return v3;
}

- (RPRemoteDisplayServer)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RPRemoteDisplayServer;
  v5 = [(RPRemoteDisplayServer *)&v10 init];
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E4F14428]);
    uint64_t v11 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v6->_internalAuthFlags = v11;
    }
    uint64_t v11 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v6->_passwordType = v11;
    }
    id v7 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t internalAuthFlags = self->_internalAuthFlags;
  id v8 = v4;
  if (internalAuthFlags)
  {
    [v4 encodeInt64:internalAuthFlags forKey:@"iaf"];
    id v4 = v8;
  }
  uint64_t passwordType = self->_passwordType;
  if (passwordType)
  {
    [v8 encodeInteger:passwordType forKey:@"pwTy"];
    id v4 = v8;
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    [v8 encodeObject:serviceType forKey:@"srvTy"];
    id v4 = v8;
  }
}

- (id)description
{
  NSAppendPrintF();
  id v3 = 0;
  id v4 = v3;
  serviceType = self->_serviceType;
  if (serviceType)
  {
    v9 = v3;
    id v8 = serviceType;
    NSAppendPrintF();
    id v6 = v9;

    id v4 = v6;
  }
  return v4;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__RPRemoteDisplayServer_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E605B650;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __48__RPRemoteDisplayServer_activateWithCompletion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40) reactivate:0];
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    if (gLogCategory_RPRemoteDisplayServer <= 30
      && (gLogCategory_RPRemoteDisplayServer != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPRemoteDisplayServer <= 30 {
         && (gLogCategory_RPRemoteDisplayServer != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  if (self->_authCompletionHandler) {
    self->_internalAuthFlags |= 8u;
  }
  if (self->_showPasswordHandler) {
    self->_internalAuthFlags |= 1u;
  }
  if (self->_hidePasswordHandler) {
    self->_internalAuthFlags |= 2u;
  }
  if (self->_promptForPasswordHandler) {
    self->_internalAuthFlags |= 4u;
  }
  [(RPRemoteDisplayServer *)self _ensureXPCStarted];
  xpcCnx = self->_xpcCnx;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__RPRemoteDisplayServer__activateWithCompletion_reactivate___block_invoke;
  v14[3] = &unk_1E605B7B8;
  BOOL v16 = v4;
  id v8 = v6;
  id v15 = v8;
  v9 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__RPRemoteDisplayServer__activateWithCompletion_reactivate___block_invoke_2;
  v11[3] = &unk_1E605B7B8;
  BOOL v13 = v4;
  id v12 = v8;
  id v10 = v8;
  [v9 remoteDisplayActivateServer:self completion:v11];
}

void __60__RPRemoteDisplayServer__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    if (gLogCategory_RPRemoteDisplayServer <= 90)
    {
      if (gLogCategory_RPRemoteDisplayServer != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        id v3 = v7;
      }
    }
  }
  else if (gLogCategory_RPRemoteDisplayServer <= 90)
  {
    if (gLogCategory_RPRemoteDisplayServer != -1) {
      goto LABEL_7;
    }
    int v5 = _LogCategory_Initialize();
    id v3 = v7;
    if (v5) {
      goto LABEL_7;
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    id v3 = v7;
  }
}

void __60__RPRemoteDisplayServer__activateWithCompletion_reactivate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = v3;
  if (v3)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      if (gLogCategory_RPRemoteDisplayServer <= 90)
      {
        if (gLogCategory_RPRemoteDisplayServer != -1 || (v5 = _LogCategory_Initialize(), id v3 = v9, v5))
        {
LABEL_15:
          LogPrintF();
          id v3 = v9;
        }
      }
    }
    else if (gLogCategory_RPRemoteDisplayServer <= 90)
    {
      if (gLogCategory_RPRemoteDisplayServer != -1) {
        goto LABEL_15;
      }
      int v7 = _LogCategory_Initialize();
      id v3 = v9;
      if (v7) {
        goto LABEL_15;
      }
    }
  }
  else if (*(unsigned char *)(a1 + 40))
  {
    if (gLogCategory_RPRemoteDisplayServer <= 30)
    {
      if (gLogCategory_RPRemoteDisplayServer != -1) {
        goto LABEL_15;
      }
      int v6 = _LogCategory_Initialize();
      id v3 = 0;
      if (v6) {
        goto LABEL_15;
      }
    }
  }
  else if (gLogCategory_RPRemoteDisplayServer <= 30)
  {
    if (gLogCategory_RPRemoteDisplayServer != -1) {
      goto LABEL_15;
    }
    int v8 = _LogCategory_Initialize();
    id v3 = 0;
    if (v8) {
      goto LABEL_15;
    }
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v9);
    id v3 = v9;
  }
}

- (void)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.RemoteDisplay" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    int v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C42760];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v5];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__RPRemoteDisplayServer__ensureXPCStarted__block_invoke;
    v8[3] = &unk_1E605B540;
    v8[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__RPRemoteDisplayServer__ensureXPCStarted__block_invoke_2;
    v7[3] = &unk_1E605B540;
    v7[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v7];
    int v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C48260];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_xpcCnx resume];
    if (gLogCategory_RPRemoteDisplayServer <= 10
      && (gLogCategory_RPRemoteDisplayServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __42__RPRemoteDisplayServer__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __42__RPRemoteDisplayServer__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_RPRemoteDisplayServer <= 50
    && (gLogCategory_RPRemoteDisplayServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_activateCalled) {
    [(RPRemoteDisplayServer *)self _activateWithCompletion:0 reactivate:1];
  }
  id interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler)
  {
    uint64_t v4 = (void (*)(void))*((void *)interruptionHandler + 2);
    v4();
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__RPRemoteDisplayServer_invalidate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__RPRemoteDisplayServer_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 9))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 9) = 1;
    if (gLogCategory_RPRemoteDisplayServer <= 30
      && (gLogCategory_RPRemoteDisplayServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v3 = *(void *)(v2 + 32);
    if (*(unsigned char *)(v3 + 11))
    {
      [(id)v3 stopPairingServer];
      uint64_t v3 = *(void *)(v2 + 32);
    }
    [*(id *)(v3 + 16) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_13];
    [*(id *)(*(void *)(v2 + 32) + 24) invalidate];
    uint64_t v4 = *(void **)(v2 + 32);
    return [v4 _invalidated];
  }
  return result;
}

uint64_t __35__RPRemoteDisplayServer_invalidate__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (void)_invalidated
{
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && ![(NSMutableDictionary *)self->_sessions count]
    && !self->_xpcCnx)
  {
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id authCompletionHandler = self->_authCompletionHandler;
    self->_id authCompletionHandler = 0;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id v6 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    id showPasswordHandler = self->_showPasswordHandler;
    self->_id showPasswordHandler = 0;

    id hidePasswordHandler = self->_hidePasswordHandler;
    self->_id hidePasswordHandler = 0;

    id promptForPasswordHandler = self->_promptForPasswordHandler;
    self->_id promptForPasswordHandler = 0;

    id sessionStartHandler = self->_sessionStartHandler;
    self->_id sessionStartHandler = 0;

    id sessionEndedHandler = self->_sessionEndedHandler;
    self->_id sessionEndedHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_RPRemoteDisplayServer <= 30
      && (gLogCategory_RPRemoteDisplayServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)tryPassword:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (gLogCategory_RPRemoteDisplayServer <= 90)
  {
    id v6 = v3;
    if (gLogCategory_RPRemoteDisplayServer != -1 || (v5 = _LogCategory_Initialize(), uint64_t v4 = v6, v5))
    {
      LogPrintF();
      uint64_t v4 = v6;
    }
  }
}

- (void)startPairingServerWithCompletion:(id)a3
{
  id v4 = a3;
  id sessionStartHandler = self->_sessionStartHandler;
  self->_id sessionStartHandler = &__block_literal_global_107;

  xpcCnx = self->_xpcCnx;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__RPRemoteDisplayServer_startPairingServerWithCompletion___block_invoke_2;
  v12[3] = &unk_1E605B600;
  id v7 = v4;
  id v13 = v7;
  int v8 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__RPRemoteDisplayServer_startPairingServerWithCompletion___block_invoke_3;
  v10[3] = &unk_1E605D470;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 remoteDisplayStartPairingServerWithCompletion:v10];
}

void __58__RPRemoteDisplayServer_startPairingServerWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (gLogCategory_RPRemoteDisplayServer <= 30
    && (gLogCategory_RPRemoteDisplayServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v4[2](v4, 0);
}

uint64_t __58__RPRemoteDisplayServer_startPairingServerWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __58__RPRemoteDisplayServer_startPairingServerWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = *(NSObject **)(v7 + 128);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__RPRemoteDisplayServer_startPairingServerWithCompletion___block_invoke_4;
  v12[3] = &unk_1E605BDB8;
  id v13 = v6;
  uint64_t v14 = v7;
  id v9 = *(id *)(a1 + 40);
  id v15 = v5;
  id v16 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, v12);
}

void *__58__RPRemoteDisplayServer_startPairingServerWithCompletion___block_invoke_4(void *result)
{
  if (!result[4]) {
    *(unsigned char *)(result[5] + 11) = 1;
  }
  uint64_t v1 = result[7];
  if (v1) {
    return (void *)(*(uint64_t (**)(void, void, void))(v1 + 16))(result[7], result[6], result[4]);
  }
  return result;
}

- (void)stopPairingServer
{
  id v3 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
  [v3 remoteDisplayStopPairingServer];

  self->_pairingServerRunning = 0;
}

- (void)remoteDisplayStartServerSessionID:(id)a3 device:(id)a4 linkType:(id)a5 completion:(id)a6
{
  id v22 = a3;
  id v10 = (void (**)(id, void *))a6;
  dispatchQueue = self->_dispatchQueue;
  id v12 = a5;
  id v13 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  uint64_t v14 = objc_alloc_init(RPRemoteDisplaySession);
  [(RPRemoteDisplaySession *)v14 setDestinationDevice:v13];

  [(RPRemoteDisplaySession *)v14 setDispatchQueue:self->_dispatchQueue];
  [(RPRemoteDisplaySession *)v14 setServer:self];
  [(RPRemoteDisplaySession *)v14 setSessionID:v22];
  [(RPRemoteDisplaySession *)v14 setXpcCnx:self->_xpcCnx];
  uint64_t v15 = [v12 intValue];

  [(RPRemoteDisplaySession *)v14 setLinkType:v15];
  sessions = self->_sessions;
  if (!sessions)
  {
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v18 = self->_sessions;
    self->_sessions = v17;

    sessions = self->_sessions;
  }
  [(NSMutableDictionary *)sessions setObject:v14 forKeyedSubscript:v22];
  uint64_t v19 = MEMORY[0x1B3EBCC80](self->_sessionStartHandler);
  v20 = (void *)v19;
  if (v19)
  {
    (*(void (**)(uint64_t, RPRemoteDisplaySession *, void (**)(id, void *)))(v19 + 16))(v19, v14, v10);
  }
  else
  {
    v21 = RPErrorF();
    v10[2](v10, v21);
  }
}

- (void)remoteDisplaySessionEndedWithID:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  id v8 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v5];

  if (v8)
  {
    uint64_t v6 = MEMORY[0x1B3EBCC80](self->_sessionEndedHandler);
    uint64_t v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t, id, void))(v6 + 16))(v6, v8, 0);
    }
  }
}

- (void)remoteDisplayReceivedEventID:(id)a3 event:(id)a4 options:(id)a5 sessionID:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  dispatchQueue = self->_dispatchQueue;
  id v13 = a6;
  dispatch_assert_queue_V2(dispatchQueue);
  uint64_t v14 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v13];

  if (v14) {
    [v14 remoteDisplayReceivedEventID:v15 event:v10 options:v11];
  }
}

- (void)remoteDisplayReceivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 sessionID:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  dispatchQueue = self->_dispatchQueue;
  id v16 = a7;
  dispatch_assert_queue_V2(dispatchQueue);
  v17 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v16];

  if (v17) {
    [v17 remoteDisplayReceivedRequestID:v18 request:v12 options:v13 responseHandler:v14];
  }
}

- (void)remoteDisplayShowPassword:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v6 = v9;
  if (!self->_invalidateCalled)
  {
    uint64_t v7 = MEMORY[0x1B3EBCC80](self->_showPasswordHandler);
    id v8 = (void *)v7;
    if (v7)
    {
      (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v4, v9);
    }
    else if (gLogCategory_RPRemoteDisplayServer <= 90 {
           && (gLogCategory_RPRemoteDisplayServer != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }

    uint64_t v6 = v9;
  }
}

- (void)remoteDisplayHidePasswordWithFlags:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled) {
    return;
  }
  uint64_t v5 = MEMORY[0x1B3EBCC80](self->_hidePasswordHandler);
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    id v8 = (void *)v5;
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v3);
LABEL_4:
    uint64_t v6 = v8;
    goto LABEL_9;
  }
  if (gLogCategory_RPRemoteDisplayServer <= 90)
  {
    id v8 = 0;
    if (gLogCategory_RPRemoteDisplayServer != -1 || (v7 = _LogCategory_Initialize(), uint64_t v6 = 0, v7))
    {
      LogPrintF();
      goto LABEL_4;
    }
  }
LABEL_9:
}

- (NSArray)allowedMACAddresses
{
  return self->_allowedMACAddresses;
}

- (void)setAllowedMACAddresses:(id)a3
{
}

- (NSArray)pairSetupACL
{
  return self->_pairSetupACL;
}

- (void)setPairSetupACL:(id)a3
{
}

- (unsigned)pairSetupFlags
{
  return self->_pairSetupFlags;
}

- (void)setPairSetupFlags:(unsigned int)a3
{
  self->_pairSetupFlags = a3;
}

- (unsigned)pairVerifyFlags
{
  return self->_pairVerifyFlags;
}

- (void)setPairVerifyFlags:(unsigned int)a3
{
  self->_pairVerifyFlags = a3;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (int)passwordType
{
  return self->_passwordType;
}

- (void)setPasswordType:(int)a3
{
  self->_uint64_t passwordType = a3;
}

- (int)passwordTypeActual
{
  return self->_passwordTypeActual;
}

- (id)authCompletionHandler
{
  return self->_authCompletionHandler;
}

- (void)setAuthCompletionHandler:(id)a3
{
}

- (id)showPasswordHandler
{
  return self->_showPasswordHandler;
}

- (void)setShowPasswordHandler:(id)a3
{
}

- (id)hidePasswordHandler
{
  return self->_hidePasswordHandler;
}

- (void)setHidePasswordHandler:(id)a3
{
}

- (id)promptForPasswordHandler
{
  return self->_promptForPasswordHandler;
}

- (void)setPromptForPasswordHandler:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (NSData)pairingInfo
{
  return self->_pairingInfo;
}

- (void)setPairingInfo:(id)a3
{
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

- (id)sessionStartHandler
{
  return self->_sessionStartHandler;
}

- (void)setSessionStartHandler:(id)a3
{
}

- (id)sessionEndedHandler
{
  return self->_sessionEndedHandler;
}

- (void)setSessionEndedHandler:(id)a3
{
}

- (unsigned)internalAuthFlags
{
  return self->_internalAuthFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sessionEndedHandler, 0);
  objc_storeStrong(&self->_sessionStartHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_pairingInfo, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong(&self->_promptForPasswordHandler, 0);
  objc_storeStrong(&self->_hidePasswordHandler, 0);
  objc_storeStrong(&self->_showPasswordHandler, 0);
  objc_storeStrong(&self->_authCompletionHandler, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_pairSetupACL, 0);
  objc_storeStrong((id *)&self->_allowedMACAddresses, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
}

@end