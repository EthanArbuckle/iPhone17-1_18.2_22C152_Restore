@interface SFRemoteAutoFillSessionHelper
+ (BOOL)supportsSecureCoding;
- (OS_dispatch_queue)dispatchQueue;
- (SDAutoFillAgent)agent;
- (SFRemoteAutoFillSessionHelper)init;
- (SFRemoteAutoFillSessionHelper)initWithCoder:(id)a3;
- (id)dismissUserNotificationHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)pairingResponseHandler;
- (id)promptForPINHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidated;
- (void)activateWithCompletion:(id)a3;
- (void)autoFillDismissUserNotification;
- (void)autoFillPairingSucceeded:(BOOL)a3 completion:(id)a4;
- (void)autoFillPromptForPIN:(unsigned int)a3 throttleSeconds:(int)a4;
- (void)clientDismissUserNotification;
- (void)clientPairingSucceeded:(BOOL)a3 completion:(id)a4;
- (void)clientPromptForPIN:(unsigned int)a3 throttleSeconds:(int)a4;
- (void)invalidate;
- (void)serverDidPickUsername:(id)a3 password:(id)a4 error:(id)a5;
- (void)serverTryPIN:(id)a3;
- (void)serverUserNotificationDidActivate:(id)a3;
- (void)serverUserNotificationDidDismiss:(id)a3;
- (void)setAgent:(id)a3;
- (void)setDismissUserNotificationHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPairingResponseHandler:(id)a3;
- (void)setPromptForPINHandler:(id)a3;
@end

@implementation SFRemoteAutoFillSessionHelper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRemoteAutoFillSessionHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFRemoteAutoFillSessionHelper;
  v2 = [(SFRemoteAutoFillSessionHelper *)&v6 init];
  if (v2)
  {
    uint64_t v3 = SFMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (SFRemoteAutoFillSessionHelper)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SFRemoteAutoFillSessionHelper;
  uint64_t v3 = [(SFRemoteAutoFillSessionHelper *)&v7 init];
  if (v3)
  {
    uint64_t v4 = SFMainQueue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__SFRemoteAutoFillSessionHelper_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E5BBC8C0;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __56__SFRemoteAutoFillSessionHelper_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteAutoFillSessionHelper <= 30
    && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_invalidateCalled)
  {
    if (gLogCategory_SFRemoteAutoFillSessionHelper <= 60
      && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
    {
      uint64_t v14 = 4294960572;
      LogPrintF();
    }
    if (v4)
    {
      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28568];
      uint64_t v10 = [NSString stringWithUTF8String:DebugGetErrorString()];
      v5 = v10;
      v11 = @"?";
      if (v10) {
        v11 = (__CFString *)v10;
      }
      v19[0] = v11;
      v12 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1, v14);
      v13 = [v9 errorWithDomain:*MEMORY[0x1E4F28760] code:-6724 userInfo:v12];
      v4[2](v4, v13);

      goto LABEL_8;
    }
  }
  else if (!self->_agent)
  {
    v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFRemoteAutoFillSessionHelper/autoFillHelperActivate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v5, &state);
    [(SFRemoteAutoFillSessionHelper *)self _ensureXPCStarted];
    xpcCnx = self->_xpcCnx;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__SFRemoteAutoFillSessionHelper__activateWithCompletion___block_invoke;
    v15[3] = &unk_1E5BBCD68;
    id v7 = v4;
    v16 = v7;
    v8 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v15];
    [v8 autoFillHelperActivate:self completion:v7];

    os_activity_scope_leave(&state);
LABEL_8:
  }
}

uint64_t __57__SFRemoteAutoFillSessionHelper__activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SFRemoteAutoFillSessionHelper_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __43__SFRemoteAutoFillSessionHelper_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (!self->_invalidateDone
      && gLogCategory_SFRemoteAutoFillSessionHelper <= 30
      && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    xpcCnx = self->_xpcCnx;
    if (xpcCnx)
    {
      [(NSXPCConnection *)xpcCnx invalidate];
      id v4 = self->_xpcCnx;
      self->_xpcCnx = 0;
    }
    else
    {
      [(SFRemoteAutoFillSessionHelper *)self _invalidated];
    }
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SFRemoteAutoFillSessionHelper <= 50
      && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    self->_invalidateDone = 1;
    id v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    id pairingResponseHandler = self->_pairingResponseHandler;
    self->_id pairingResponseHandler = 0;

    id promptForPINHandler = self->_promptForPINHandler;
    self->_id promptForPINHandler = 0;

    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    if (gLogCategory_SFRemoteAutoFillSessionHelper <= 10
      && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)serverDidPickUsername:(id)a3 password:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__SFRemoteAutoFillSessionHelper_serverDidPickUsername_password_error___block_invoke;
  v15[3] = &unk_1E5BBD050;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

void __70__SFRemoteAutoFillSessionHelper_serverDidPickUsername_password_error___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72))
  {
    if (gLogCategory_SFRemoteAutoFillSessionHelper <= 60
      && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    v2 = _os_activity_create(&dword_1A5389000, "Sharing/SFRemoteAutoFillSessionHelper/serverDidPickUsername", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v4.opaque[0] = 0;
    v4.opaque[1] = 0;
    os_activity_scope_enter(v2, &v4);
    [*(id *)(a1 + 32) _ensureXPCStarted];
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxy];
    [v3 autoFillHelperDidPickUsername:*(void *)(a1 + 40) password:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];

    os_activity_scope_leave(&v4);
  }
}

- (void)serverTryPIN:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__SFRemoteAutoFillSessionHelper_serverTryPIN___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __46__SFRemoteAutoFillSessionHelper_serverTryPIN___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72))
  {
    if (gLogCategory_SFRemoteAutoFillSessionHelper <= 60
      && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    v2 = _os_activity_create(&dword_1A5389000, "Sharing/SFRemoteAutoFillSessionHelper/autoFillHelperTryPin", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v4.opaque[0] = 0;
    v4.opaque[1] = 0;
    os_activity_scope_enter(v2, &v4);
    [*(id *)(a1 + 32) _ensureXPCStarted];
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxy];
    [v3 autoFillHelperTryPIN:*(void *)(a1 + 40)];

    os_activity_scope_leave(&v4);
  }
}

- (void)serverUserNotificationDidActivate:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__SFRemoteAutoFillSessionHelper_serverUserNotificationDidActivate___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __67__SFRemoteAutoFillSessionHelper_serverUserNotificationDidActivate___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72))
  {
    if (gLogCategory_SFRemoteAutoFillSessionHelper <= 60
      && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    v2 = _os_activity_create(&dword_1A5389000, "Sharing/SFRemoteAutoFillSessionHelper/autoFillHelperUserNotificationDidActivate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v4.opaque[0] = 0;
    v4.opaque[1] = 0;
    os_activity_scope_enter(v2, &v4);
    [*(id *)(a1 + 32) _ensureXPCStarted];
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxy];
    [v3 autoFillHelperUserNotificationDidActivate:*(void *)(a1 + 40)];

    os_activity_scope_leave(&v4);
  }
}

- (void)serverUserNotificationDidDismiss:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__SFRemoteAutoFillSessionHelper_serverUserNotificationDidDismiss___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __66__SFRemoteAutoFillSessionHelper_serverUserNotificationDidDismiss___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 72))
  {
    if (gLogCategory_SFRemoteAutoFillSessionHelper <= 60
      && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    v2 = _os_activity_create(&dword_1A5389000, "Sharing/SFRemoteAutoFillSessionHelper/autoFillHelperUserNotificationDidDismiss", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v4.opaque[0] = 0;
    v4.opaque[1] = 0;
    os_activity_scope_enter(v2, &v4);
    [*(id *)(a1 + 32) _ensureXPCStarted];
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxy];
    [v3 autoFillHelperUserNotificationDidDismiss:*(void *)(a1 + 40)];

    os_activity_scope_leave(&v4);
  }
}

- (void)autoFillDismissUserNotification
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteAutoFillSessionHelper <= 30
    && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id dismissUserNotificationHandler = self->_dismissUserNotificationHandler;
  if (dismissUserNotificationHandler)
  {
    os_activity_scope_state_s v4 = (void (*)(void))*((void *)dismissUserNotificationHandler + 2);
    v4();
  }
}

- (void)autoFillPairingSucceeded:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteAutoFillSessionHelper <= 30
    && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id pairingResponseHandler = (void (**)(id, BOOL, id))self->_pairingResponseHandler;
  if (pairingResponseHandler) {
    pairingResponseHandler[2](pairingResponseHandler, v4, v7);
  }

  MEMORY[0x1F4181820]();
}

- (void)autoFillPromptForPIN:(unsigned int)a3 throttleSeconds:(int)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteAutoFillSessionHelper <= 30
    && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id promptForPINHandler = self->_promptForPINHandler;
  if (promptForPINHandler)
  {
    id v6 = (void (*)(void))*((void *)promptForPINHandler + 2);
    v6();
  }
}

- (void)clientDismissUserNotification
{
  if (self->_agent)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__SFRemoteAutoFillSessionHelper_clientDismissUserNotification__block_invoke;
    block[3] = &unk_1E5BBC870;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
  else if (gLogCategory_SFRemoteAutoFillSessionHelper <= 60 {
         && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

uint64_t __62__SFRemoteAutoFillSessionHelper_clientDismissUserNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) autoFillDismissUserNotification];
}

- (void)clientPairingSucceeded:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (self->_agent)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__SFRemoteAutoFillSessionHelper_clientPairingSucceeded_completion___block_invoke;
    block[3] = &unk_1E5BBD078;
    block[4] = self;
    BOOL v11 = a3;
    id v10 = v6;
    dispatch_async(dispatchQueue, block);
  }
  else if (gLogCategory_SFRemoteAutoFillSessionHelper <= 60 {
         && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

uint64_t __67__SFRemoteAutoFillSessionHelper_clientPairingSucceeded_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) autoFillPairingSucceeded:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)clientPromptForPIN:(unsigned int)a3 throttleSeconds:(int)a4
{
  if (self->_agent)
  {
    dispatchQueue = self->_dispatchQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __68__SFRemoteAutoFillSessionHelper_clientPromptForPIN_throttleSeconds___block_invoke;
    v5[3] = &unk_1E5BBC910;
    v5[4] = self;
    unsigned int v6 = a3;
    int v7 = a4;
    dispatch_async(dispatchQueue, v5);
  }
  else if (gLogCategory_SFRemoteAutoFillSessionHelper <= 60 {
         && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

uint64_t __68__SFRemoteAutoFillSessionHelper_clientPromptForPIN_throttleSeconds___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) autoFillPromptForPIN:*(unsigned int *)(a1 + 40) throttleSeconds:*(unsigned int *)(a1 + 44)];
}

- (void)_ensureXPCStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    uint64_t v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.SharingServices" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA125E0];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v5];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__SFRemoteAutoFillSessionHelper__ensureXPCStarted__block_invoke;
    v8[3] = &unk_1E5BBC870;
    v8[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__SFRemoteAutoFillSessionHelper__ensureXPCStarted__block_invoke_2;
    v7[3] = &unk_1E5BBC870;
    v7[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v7];
    unsigned int v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA38FC0];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_xpcCnx resume];
    if (gLogCategory_SFRemoteAutoFillSessionHelper <= 10
      && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __50__SFRemoteAutoFillSessionHelper__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __50__SFRemoteAutoFillSessionHelper__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteAutoFillSessionHelper <= 50
    && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler) {
    interruptionHandler[2]();
  }
  if (self->_activateCalled)
  {
    BOOL v4 = _os_activity_create(&dword_1A5389000, "Sharing/SFRemoteAutoFillSessionHelper/autoFillHelperActivate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v6.opaque[0] = 0;
    v6.opaque[1] = 0;
    os_activity_scope_enter(v4, &v6);
    if (gLogCategory_SFRemoteAutoFillSessionHelper <= 50
      && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(SFRemoteAutoFillSessionHelper *)self _ensureXPCStarted];
    id v5 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
    [v5 autoFillHelperActivate:self completion:&__block_literal_global_8];

    os_activity_scope_leave(&v6);
  }
}

void __45__SFRemoteAutoFillSessionHelper__interrupted__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = v2;
  if (gLogCategory_SFRemoteAutoFillSessionHelper <= 30)
  {
    id v5 = v2;
    if (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || (v4 = _LogCategory_Initialize(), uint64_t v3 = v5, v4))
    {
      LogPrintF();
      uint64_t v3 = v5;
    }
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

- (id)dismissUserNotificationHandler
{
  return self->_dismissUserNotificationHandler;
}

- (void)setDismissUserNotificationHandler:(id)a3
{
}

- (id)pairingResponseHandler
{
  return self->_pairingResponseHandler;
}

- (void)setPairingResponseHandler:(id)a3
{
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
}

- (SDAutoFillAgent)agent
{
  return self->_agent;
}

- (void)setAgent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_pairingResponseHandler, 0);
  objc_storeStrong(&self->_dismissUserNotificationHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end