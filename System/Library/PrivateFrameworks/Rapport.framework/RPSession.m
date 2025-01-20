@interface RPSession
+ (BOOL)supportsSecureCoding;
- (NSArray)allowedMACAddresses;
- (NSArray)pairSetupACL;
- (NSData)pairingInfo;
- (NSString)label;
- (NSString)password;
- (NSString)peerID;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (RPConnection)cnx;
- (RPEndpoint)peerEndpoint;
- (RPSession)init;
- (RPSession)initWithCoder:(id)a3;
- (id)authCompletionHandler;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)hidePasswordHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)promptForPasswordHandler;
- (id)showPasswordHandler;
- (int)passwordType;
- (int)passwordTypeActual;
- (unint64_t)controlFlags;
- (unint64_t)sessionID;
- (unint64_t)startTicks;
- (unsigned)pairSetupFlags;
- (unsigned)pairVerifyFlags;
- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidated;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7;
- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6;
- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)setAllowedMACAddresses:(id)a3;
- (void)setAuthCompletionHandler:(id)a3;
- (void)setCnx:(id)a3;
- (void)setControlFlags:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setHidePasswordHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPairSetupACL:(id)a3;
- (void)setPairSetupFlags:(unsigned int)a3;
- (void)setPairVerifyFlags:(unsigned int)a3;
- (void)setPairingInfo:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordType:(int)a3;
- (void)setPeerEndpoint:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setPromptForPasswordHandler:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setSessionID:(unint64_t)a3;
- (void)setShowPasswordHandler:(id)a3;
- (void)setStartTicks:(unint64_t)a3;
@end

@implementation RPSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPSession;
  v2 = [(RPSession *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v3->_ucat = (LogCategory *)&gLogCategory_RPSession;
    v4 = v3;
  }

  return v3;
}

- (RPSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RPSession;
  v5 = [(RPSession *)&v13 init];
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E4F14428]);
    v6->_ucat = (LogCategory *)&gLogCategory_RPSession;
    id v7 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    label = v6->_label;
    if (label)
    {
      v9 = label;
      [(NSString *)v9 UTF8String];
      LogCategoryReplaceF();
    }
    id v10 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v11 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  label = self->_label;
  id v7 = v4;
  if (label)
  {
    [v4 encodeObject:label forKey:@"label"];
    id v4 = v7;
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    [v7 encodeObject:serviceType forKey:@"st"];
    id v4 = v7;
  }
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)RPSession;
  [(RPSession *)&v4 dealloc];
}

- (id)description
{
  return [(RPSession *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  NSAppendPrintF();
  id v4 = 0;
  v5 = v4;
  peerID = self->_peerID;
  if (peerID)
  {
    id v10 = v4;
    v9 = peerID;
    NSAppendPrintF();
    id v7 = v10;

    v5 = v7;
  }
  return v5;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  BOOL activateCalled = v5->_activateCalled;
  v5->_BOOL activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__RPSession_activateWithCompletion___block_invoke;
  block[3] = &unk_1E605B790;
  block[4] = v5;
  id v10 = v4;
  BOOL v11 = activateCalled;
  id v8 = v4;
  dispatch_async(dispatchQueue, block);

  objc_sync_exit(v5);
}

void __36__RPSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 9))
  {
    v3 = RPErrorF();
    int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 16);
    BOOL v11 = v3;
    if (v4 <= 115)
    {
      if (v4 != -1 || (int v7 = _LogCategory_Initialize(), v3 = v11, v7))
      {
        LogPrintF();
        v3 = v11;
      }
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);
      v3 = v11;
    }
  }
  else if (*(unsigned char *)(a1 + 48))
  {
    int v5 = **(_DWORD **)(v2 + 16);
    if (v5 <= 30 && (v5 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      id v10 = *(void (**)(void))(v9 + 16);
      v10();
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    [(id)v2 _activateWithCompletion:v6 reactivate:0];
  }
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int var0 = self->_ucat->var0;
  if (v4)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
LABEL_7:
    }
      LogPrintF();
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  [(RPSession *)self _ensureXPCStarted];
  xpcCnx = self->_xpcCnx;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__RPSession__activateWithCompletion_reactivate___block_invoke;
  v15[3] = &unk_1E605BCF0;
  BOOL v17 = v4;
  v15[4] = self;
  id v9 = v6;
  id v16 = v9;
  id v10 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v15];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__RPSession__activateWithCompletion_reactivate___block_invoke_2;
  v12[3] = &unk_1E605BCF0;
  BOOL v14 = v4;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 xpcSessionActivate:self completion:v12];
}

void __48__RPSession__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  int v3 = **(_DWORD **)(*(void *)(a1 + 32) + 16);
  if (*(unsigned char *)(a1 + 48))
  {
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize())) {
LABEL_7:
    }
      LogPrintF();
  }
  else if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

void __48__RPSession__activateWithCompletion_reactivate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 16);
  id v6 = v3;
  if (v3)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      if (v4 <= 90 && (v4 != -1 || _LogCategory_Initialize())) {
LABEL_15:
      }
        LogPrintF();
    }
    else if (v4 <= 90 && (v4 != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_15;
    }
  }
  else if (*(unsigned char *)(a1 + 48))
  {
    if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize())) {
      goto LABEL_15;
    }
  }
  else if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_15;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

- (void)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.CompanionLink" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    uint64_t v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C39EE8];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v5];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __30__RPSession__ensureXPCStarted__block_invoke;
    v9[3] = &unk_1E605B540;
    v9[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v9];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __30__RPSession__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_1E605B540;
    v8[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v8];
    id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0C480E0];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_xpcCnx resume];
    int var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

uint64_t __30__RPSession__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __30__RPSession__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  int v4 = *(void **)(a1 + 32);
  return [v4 _invalidated];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int var0 = self->_ucat->var0;
  if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_activateCalled) {
    [(RPSession *)self _activateWithCompletion:0 reactivate:1];
  }
  id interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler)
  {
    uint64_t v5 = (void (*)(void))*((void *)interruptionHandler + 2);
    v5();
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__RPSession_invalidate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __23__RPSession_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 9))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 9) = 1;
    uint64_t v3 = *(void *)(result + 32);
    int v4 = **(_DWORD **)(v3 + 16);
    if (v4 <= 30)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v3 = *(void *)(v2 + 32), v5))
      {
        LogPrintF();
        uint64_t v3 = *(void *)(v2 + 32);
      }
    }
    [*(id *)(v3 + 24) invalidate];
    id v6 = *(void **)(v2 + 32);
    return [v6 _invalidated];
  }
  return result;
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2](invalidationHandler, a2);
    }
    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    cnx = self->_cnx;
    self->_cnx = 0;

    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
  if (a6) {
    (*((void (**)(id, void))a6 + 2))(a6, 0);
  }
}

- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7
{
  if (a7) {
    (*((void (**)(id, void))a7 + 2))(a7, 0);
  }
}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
}

- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
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
  self->_passwordType = a3;
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

- (NSData)pairingInfo
{
  return self->_pairingInfo;
}

- (void)setPairingInfo:(id)a3
{
}

- (unint64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unint64_t)a3
{
  self->_controlFlags = a3;
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

- (NSString)label
{
  return self->_label;
}

- (RPEndpoint)peerEndpoint
{
  return self->_peerEndpoint;
}

- (void)setPeerEndpoint:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (RPConnection)cnx
{
  return self->_cnx;
}

- (void)setCnx:(id)a3
{
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
}

- (unint64_t)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unint64_t)a3
{
  self->_sessionID = a3;
}

- (unint64_t)startTicks
{
  return self->_startTicks;
}

- (void)setStartTicks:(unint64_t)a3
{
  self->_startTicks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_cnx, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_peerEndpoint, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_pairingInfo, 0);
  objc_storeStrong(&self->_promptForPasswordHandler, 0);
  objc_storeStrong(&self->_hidePasswordHandler, 0);
  objc_storeStrong(&self->_showPasswordHandler, 0);
  objc_storeStrong(&self->_authCompletionHandler, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_pairSetupACL, 0);
  objc_storeStrong((id *)&self->_allowedMACAddresses, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end