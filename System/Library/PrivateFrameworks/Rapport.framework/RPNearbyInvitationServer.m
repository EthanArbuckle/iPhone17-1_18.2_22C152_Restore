@interface RPNearbyInvitationServer
+ (BOOL)supportsSecureCoding;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (RPNearbyInvitationServer)init;
- (RPNearbyInvitationServer)initWithCoder:(id)a3;
- (id)description;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)sessionEndedHandler;
- (id)sessionStartHandler;
- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidated;
- (void)activateWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)nearbyInvitationReceivedEventID:(id)a3 event:(id)a4 options:(id)a5 sessionID:(id)a6;
- (void)nearbyInvitationReceivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 sessionID:(id)a7;
- (void)nearbyInvitationSessionEndedWithID:(id)a3;
- (void)nearbyInvitationSessionError:(id)a3 withID:(id)a4;
- (void)nearbyInvitationStartServerSessionID:(id)a3 device:(id)a4 completion:(id)a5;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setSessionEndedHandler:(id)a3;
- (void)setSessionStartHandler:(id)a3;
@end

@implementation RPNearbyInvitationServer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPNearbyInvitationServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPNearbyInvitationServer;
  v2 = [(RPNearbyInvitationServer *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v4 = v3;
  }

  return v3;
}

- (RPNearbyInvitationServer)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RPNearbyInvitationServer;
  v5 = [(RPNearbyInvitationServer *)&v10 init];
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E4F14428]);
    id v7 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  serviceType = self->_serviceType;
  if (serviceType) {
    [a3 encodeObject:serviceType forKey:@"srvTy"];
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
    v8 = serviceType;
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
  v7[2] = __51__RPNearbyInvitationServer_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E605B650;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __51__RPNearbyInvitationServer_activateWithCompletion___block_invoke(uint64_t a1)
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
    if (gLogCategory_RPNearbyInvitationServer <= 30
      && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPNearbyInvitationServer <= 30 {
         && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  [(RPNearbyInvitationServer *)self _ensureXPCStarted];
  xpcCnx = self->_xpcCnx;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__RPNearbyInvitationServer__activateWithCompletion_reactivate___block_invoke;
  v14[3] = &unk_1E605B7B8;
  BOOL v16 = v4;
  id v8 = v6;
  id v15 = v8;
  v9 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__RPNearbyInvitationServer__activateWithCompletion_reactivate___block_invoke_2;
  v11[3] = &unk_1E605B7B8;
  BOOL v13 = v4;
  id v12 = v8;
  id v10 = v8;
  [v9 nearbyInvitationActivateServer:self completion:v11];
}

void __63__RPNearbyInvitationServer__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    if (gLogCategory_RPNearbyInvitationServer <= 90)
    {
      if (gLogCategory_RPNearbyInvitationServer != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        id v3 = v7;
      }
    }
  }
  else if (gLogCategory_RPNearbyInvitationServer <= 90)
  {
    if (gLogCategory_RPNearbyInvitationServer != -1) {
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

void __63__RPNearbyInvitationServer__activateWithCompletion_reactivate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = v3;
  if (v3)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      if (gLogCategory_RPNearbyInvitationServer <= 90)
      {
        if (gLogCategory_RPNearbyInvitationServer != -1 || (v5 = _LogCategory_Initialize(), id v3 = v9, v5))
        {
LABEL_15:
          LogPrintF();
          id v3 = v9;
        }
      }
    }
    else if (gLogCategory_RPNearbyInvitationServer <= 90)
    {
      if (gLogCategory_RPNearbyInvitationServer != -1) {
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
    if (gLogCategory_RPNearbyInvitationServer <= 30)
    {
      if (gLogCategory_RPNearbyInvitationServer != -1) {
        goto LABEL_15;
      }
      int v6 = _LogCategory_Initialize();
      id v3 = 0;
      if (v6) {
        goto LABEL_15;
      }
    }
  }
  else if (gLogCategory_RPNearbyInvitationServer <= 30)
  {
    if (gLogCategory_RPNearbyInvitationServer != -1) {
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
    id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.rapport.NearbyInvitation" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    int v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C3E138];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v5];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__RPNearbyInvitationServer__ensureXPCStarted__block_invoke;
    v8[3] = &unk_1E605B540;
    v8[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__RPNearbyInvitationServer__ensureXPCStarted__block_invoke_2;
    v7[3] = &unk_1E605B540;
    v7[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v7];
    int v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C48020];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_xpcCnx resume];
    if (gLogCategory_RPNearbyInvitationServer <= 10
      && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __45__RPNearbyInvitationServer__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __45__RPNearbyInvitationServer__ensureXPCStarted__block_invoke_2(uint64_t a1)
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
  if (gLogCategory_RPNearbyInvitationServer <= 50
    && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_activateCalled) {
    [(RPNearbyInvitationServer *)self _activateWithCompletion:0 reactivate:1];
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
  block[2] = __38__RPNearbyInvitationServer_invalidate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __38__RPNearbyInvitationServer_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 9))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 9) = 1;
    if (gLogCategory_RPNearbyInvitationServer <= 30
      && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [*(id *)(*(void *)(v2 + 32) + 16) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_0];
    [*(id *)(*(void *)(v2 + 32) + 24) invalidate];
    id v3 = *(void **)(v2 + 32);
    return [v3 _invalidated];
  }
  return result;
}

uint64_t __38__RPNearbyInvitationServer_invalidate__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
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
    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    id sessionStartHandler = self->_sessionStartHandler;
    self->_id sessionStartHandler = 0;

    id sessionEndedHandler = self->_sessionEndedHandler;
    self->_id sessionEndedHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_RPNearbyInvitationServer <= 30
      && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)nearbyInvitationStartServerSessionID:(id)a3 device:(id)a4 completion:(id)a5
{
  id v18 = a3;
  int v8 = (void (**)(id, void *))a5;
  dispatchQueue = self->_dispatchQueue;
  id v10 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  v11 = objc_alloc_init(RPNearbyInvitationSession);
  [(RPNearbyInvitationSession *)v11 setDestinationDevice:v10];

  [(RPNearbyInvitationSession *)v11 setDispatchQueue:self->_dispatchQueue];
  [(RPNearbyInvitationSession *)v11 setServer:self];
  [(RPNearbyInvitationSession *)v11 setSessionID:v18];
  [(RPNearbyInvitationSession *)v11 setXpcCnx:self->_xpcCnx];
  sessions = self->_sessions;
  if (!sessions)
  {
    BOOL v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v14 = self->_sessions;
    self->_sessions = v13;

    sessions = self->_sessions;
  }
  [(NSMutableDictionary *)sessions setObject:v11 forKeyedSubscript:v18];
  uint64_t v15 = MEMORY[0x1B3EBCC80](self->_sessionStartHandler);
  BOOL v16 = (void *)v15;
  if (v15)
  {
    (*(void (**)(uint64_t, RPNearbyInvitationSession *, void (**)(id, void *)))(v15 + 16))(v15, v11, v8);
  }
  else
  {
    v17 = RPErrorF();
    v8[2](v8, v17);
  }
}

- (void)nearbyInvitationSessionEndedWithID:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v4 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v7];
  if (v4)
  {
    uint64_t v5 = MEMORY[0x1B3EBCC80](self->_sessionEndedHandler);
    int v6 = (void *)v5;
    if (v5) {
      (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v4, 0);
    }
    [(NSMutableDictionary *)self->_sessions setObject:0 forKeyedSubscript:v7];
  }
}

- (void)nearbyInvitationReceivedEventID:(id)a3 event:(id)a4 options:(id)a5 sessionID:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    BOOL v13 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v12];
    v14 = v13;
    if (v13) {
      [v13 nearbyInvitationReceivedEventID:v15 event:v10 options:v11 sessionID:v12];
    }
  }
  else if (gLogCategory_RPNearbyInvitationServer <= 90 {
         && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)nearbyInvitationReceivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 sessionID:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    BOOL v16 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v15];
    v17 = v16;
    if (v16) {
      [v16 nearbyInvitationReceivedRequestID:v18 request:v12 options:v13 responseHandler:v14 sessionID:v15];
    }
  }
  else if (gLogCategory_RPNearbyInvitationServer <= 90 {
         && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)nearbyInvitationSessionError:(id)a3 withID:(id)a4
{
  id v8 = a3;
  int v6 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:a4];
  id v7 = v6;
  if (v6) {
    [v6 nearbyInvitationSessionError:v8];
  }
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

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sessionEndedHandler, 0);
  objc_storeStrong(&self->_sessionStartHandler, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
}

@end