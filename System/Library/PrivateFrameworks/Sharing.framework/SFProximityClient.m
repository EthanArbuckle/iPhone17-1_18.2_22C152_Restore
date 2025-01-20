@interface SFProximityClient
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldAdvertise;
- (BOOL)wantsUpdates;
- (OS_dispatch_queue)dispatchQueue;
- (SFProximityClient)init;
- (SFProximityClient)initWithCoder:(id)a3;
- (id)deviceDidUntriggerHandler;
- (id)deviceEnteredImmediateHandler;
- (id)deviceEnteredNearbyHandler;
- (id)deviceExitedImmediateHandler;
- (id)deviceExitedNearbyHandler;
- (id)deviceUpdateHandler;
- (id)deviceWasDismissedHandler;
- (id)deviceWasDismissedHandlerEx;
- (id)deviceWasSelectedHandler;
- (id)deviceWillTriggerHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_dismissContentForDevice:(id)a3 completion:(id)a4;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidated;
- (void)_invokeBlockActivateSafe:(id)a3;
- (void)_provideContent:(id)a3 forDevice:(id)a4 force:(BOOL)a5 completion:(id)a6;
- (void)_stopSuppressingDevice:(id)a3 completion:(id)a4;
- (void)_suppressDevice:(id)a3 completion:(id)a4;
- (void)_updateContent:(id)a3 forDevice:(id)a4 completion:(id)a5;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)dismissContentForDevice:(id)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)provideContent:(id)a3 forDevice:(id)a4 force:(BOOL)a5 completion:(id)a6;
- (void)proximityClientDeviceDidUntriggerHandler:(id)a3;
- (void)proximityClientDeviceEnteredImmediate:(id)a3;
- (void)proximityClientDeviceEnteredNearby:(id)a3;
- (void)proximityClientDeviceExitedImmediate:(id)a3;
- (void)proximityClientDeviceExitedNearby:(id)a3;
- (void)proximityClientDeviceUpdated:(id)a3 rssi:(int64_t)a4 state:(int64_t)a5;
- (void)proximityClientDeviceWasDismissedHandler:(id)a3 reason:(int64_t)a4;
- (void)proximityClientDeviceWasSelectedHandler:(id)a3;
- (void)proximityClientDeviceWillTriggerHandler:(id)a3;
- (void)requestScannerTimerReset;
- (void)setDeviceDidUntriggerHandler:(id)a3;
- (void)setDeviceEnteredImmediateHandler:(id)a3;
- (void)setDeviceEnteredNearbyHandler:(id)a3;
- (void)setDeviceExitedImmediateHandler:(id)a3;
- (void)setDeviceExitedNearbyHandler:(id)a3;
- (void)setDeviceUpdateHandler:(id)a3;
- (void)setDeviceWasDismissedHandler:(id)a3;
- (void)setDeviceWasDismissedHandlerEx:(id)a3;
- (void)setDeviceWasSelectedHandler:(id)a3;
- (void)setDeviceWillTriggerHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setShouldAdvertise:(BOOL)a3;
- (void)setWantsUpdates:(BOOL)a3;
- (void)stopSuppressingDevice:(id)a3 completion:(id)a4;
- (void)suppressDevice:(id)a3 completion:(id)a4;
- (void)updateContent:(id)a3 forDevice:(id)a4 completion:(id)a5;
@end

@implementation SFProximityClient

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFProximityClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFProximityClient;
  v2 = [(SFProximityClient *)&v6 init];
  if (v2)
  {
    uint64_t v3 = SFMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (SFProximityClient)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFProximityClient;
  v5 = [(SFProximityClient *)&v12 init];
  if (v5)
  {
    uint64_t v6 = SFMainQueue();
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v6;

    id v8 = v4;
    if ([v8 containsValueForKey:@"sa"]) {
      v5->_shouldAdvertise = [v8 decodeBoolForKey:@"sa"];
    }

    id v9 = v8;
    if ([v9 containsValueForKey:@"wu"]) {
      v5->_wantsUpdates = [v9 decodeBoolForKey:@"wu"];
    }

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_shouldAdvertise)
  {
    [v4 encodeBool:1 forKey:@"sa"];
    id v4 = v5;
  }
  if (self->_wantsUpdates)
  {
    [v5 encodeBool:1 forKey:@"wu"];
    id v4 = v5;
  }
}

- (void)dealloc
{
  if (self->_xpcCnx)
  {
    uint64_t v6 = (SFProximityClient *)FatalErrorF();
    [(SFProximityClient *)v6 activateWithCompletion:v8];
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    if (dispatchQueue)
    {
      self->_dispatchQueue = 0;
    }
    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    v9.receiver = self;
    v9.super_class = (Class)SFProximityClient;
    [(SFProximityClient *)&v9 dealloc];
  }
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SFProximityClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E5BBC8C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __44__SFProximityClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFProximityClient/proximityClientActivate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_activateCalled)
  {
    int v9 = -6721;
  }
  else
  {
    if (gLogCategory_SFProximityClient <= 30
      && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_activateCalled = 1;
    [(SFProximityClient *)self _ensureXPCStarted];
    xpcCnx = self->_xpcCnx;
    if (xpcCnx)
    {
      SEL v7 = [(NSXPCConnection *)xpcCnx remoteObjectProxy];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __45__SFProximityClient__activateWithCompletion___block_invoke;
      v15[3] = &unk_1E5BBCD68;
      id v16 = v4;
      [v7 proximityClientActivate:self completion:v15];

      id v8 = v16;
      goto LABEL_8;
    }
    int v9 = -6753;
  }
  if (!v4) {
    goto LABEL_9;
  }
  v10 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v18 = *MEMORY[0x1E4F28568];
  uint64_t v11 = [NSString stringWithUTF8String:DebugGetErrorString()];
  id v8 = (void *)v11;
  objc_super v12 = @"?";
  if (v11) {
    objc_super v12 = (__CFString *)v11;
  }
  v19[0] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  v14 = [v10 errorWithDomain:*MEMORY[0x1E4F28760] code:v9 userInfo:v13];
  (*((void (**)(id, void *))v4 + 2))(v4, v14);

LABEL_8:
LABEL_9:
  os_activity_scope_leave(&state);
}

uint64_t __45__SFProximityClient__activateWithCompletion___block_invoke(uint64_t a1)
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
  block[2] = __31__SFProximityClient_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __31__SFProximityClient_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateDone)
  {
    if (gLogCategory_SFProximityClient <= 60
      && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    self->_invalidateCalled = 1;
    if (gLogCategory_SFProximityClient <= 30
      && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
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
      [(SFProximityClient *)self _invalidated];
    }
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SFProximityClient <= 50
      && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id v5 = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_SFProximityClient <= 10
      && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
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
    v8[2] = __38__SFProximityClient__ensureXPCStarted__block_invoke;
    v8[3] = &unk_1E5BBC870;
    v8[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38__SFProximityClient__ensureXPCStarted__block_invoke_2;
    v7[3] = &unk_1E5BBC870;
    v7[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v7];
    id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA38F60];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_xpcCnx resume];
    if (gLogCategory_SFProximityClient <= 10
      && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __38__SFProximityClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __38__SFProximityClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 50
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler)
  {
    id v4 = (void (*)(void))*((void *)interruptionHandler + 2);
    v4();
  }
}

- (void)_invokeBlockActivateSafe:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = v5->_dispatchQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__SFProximityClient__invokeBlockActivateSafe___block_invoke;
    v7[3] = &unk_1E5BBC9C8;
    v7[4] = v5;
    id v8 = v4;
    dispatch_async(dispatchQueue, v7);
  }
  else
  {
    v4[2](v4);
  }
  objc_sync_exit(v5);
}

void __46__SFProximityClient__invokeBlockActivateSafe___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) remoteObjectProxy];
  [v2 proximityClientUpdate:*(void *)(a1 + 32)];
}

- (void)setShouldAdvertise:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__SFProximityClient_setShouldAdvertise___block_invoke;
  v3[3] = &unk_1E5BBCD90;
  v3[4] = self;
  BOOL v4 = a3;
  [(SFProximityClient *)self _invokeBlockActivateSafe:v3];
}

uint64_t __40__SFProximityClient_setShouldAdvertise___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 40) = *(unsigned char *)(result + 40);
  return result;
}

- (void)dismissContentForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SFProximityClient_dismissContentForDevice_completion___block_invoke;
  block[3] = &unk_1E5BBBC30;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __56__SFProximityClient_dismissContentForDevice_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissContentForDevice:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_dismissContentForDevice:(id)a3 completion:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    id v17 = v6;
    LogPrintF();
  }
  [(SFProximityClient *)self _ensureXPCStarted];
  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    id v9 = [(NSXPCConnection *)xpcCnx remoteObjectProxy];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __57__SFProximityClient__dismissContentForDevice_completion___block_invoke;
    v18[3] = &unk_1E5BBCD68;
    id v19 = v7;
    [v9 proximityClientDismissContentForDevice:v6 completion:v18];

    id v10 = v19;
  }
  else
  {
    if (!v7) {
      goto LABEL_8;
    }
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28760];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    uint64_t v13 = [NSString stringWithUTF8String:DebugGetErrorString()];
    id v10 = (void *)v13;
    v14 = @"?";
    if (v13) {
      v14 = (__CFString *)v13;
    }
    v21[0] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v16 = [v11 errorWithDomain:v12 code:-6753 userInfo:v15];
    (*((void (**)(id, void *))v7 + 2))(v7, v16);
  }
LABEL_8:
}

uint64_t __57__SFProximityClient__dismissContentForDevice_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)provideContent:(id)a3 forDevice:(id)a4 force:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SFProximityClient_provideContent_forDevice_force_completion___block_invoke;
  block[3] = &unk_1E5BBCDB8;
  block[4] = self;
  id v18 = v10;
  BOOL v21 = a5;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(dispatchQueue, block);
}

uint64_t __63__SFProximityClient_provideContent_forDevice_force_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _provideContent:*(void *)(a1 + 40) forDevice:*(void *)(a1 + 48) force:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 56)];
}

- (void)_provideContent:(id)a3 forDevice:(id)a4 force:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  v30[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = _os_activity_create(&dword_1A5389000, "Sharing/SFProximityClient/proximityClientprovideContent", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    id v14 = "no";
    if (v7) {
      id v14 = "yes";
    }
    v24 = v14;
    id v25 = v10;
    id v23 = v11;
    LogPrintF();
  }
  [(SFProximityClient *)self _ensureXPCStarted];
  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    id v16 = [(NSXPCConnection *)xpcCnx remoteObjectProxy];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __64__SFProximityClient__provideContent_forDevice_force_completion___block_invoke;
    v26[3] = &unk_1E5BBCD68;
    id v27 = v12;
    [v16 proximityClientProvideContent:v10 forDevice:v11 force:v7 completion:v26];

    id v17 = v27;
  }
  else
  {
    if (!v12) {
      goto LABEL_10;
    }
    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    uint64_t v19 = [NSString stringWithUTF8String:DebugGetErrorString()];
    id v17 = (void *)v19;
    id v20 = @"?";
    if (v19) {
      id v20 = (__CFString *)v19;
    }
    v30[0] = v20;
    BOOL v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    v22 = [v18 errorWithDomain:*MEMORY[0x1E4F28760] code:-6753 userInfo:v21];
    (*((void (**)(id, void *))v12 + 2))(v12, v22);
  }
LABEL_10:
  os_activity_scope_leave(&state);
}

uint64_t __64__SFProximityClient__provideContent_forDevice_force_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)suppressDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SFProximityClient_suppressDevice_completion___block_invoke;
  block[3] = &unk_1E5BBBC30;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __47__SFProximityClient_suppressDevice_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _suppressDevice:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_suppressDevice:(id)a3 completion:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    id v17 = v6;
    LogPrintF();
  }
  [(SFProximityClient *)self _ensureXPCStarted];
  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    id v9 = [(NSXPCConnection *)xpcCnx remoteObjectProxy];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __48__SFProximityClient__suppressDevice_completion___block_invoke;
    v18[3] = &unk_1E5BBCD68;
    id v19 = v7;
    [v9 proximityClientSuppressDevice:v6 completion:v18];

    id v10 = v19;
  }
  else
  {
    if (!v7) {
      goto LABEL_8;
    }
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28760];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    uint64_t v13 = [NSString stringWithUTF8String:DebugGetErrorString()];
    id v10 = (void *)v13;
    id v14 = @"?";
    if (v13) {
      id v14 = (__CFString *)v13;
    }
    v21[0] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v16 = [v11 errorWithDomain:v12 code:-6753 userInfo:v15];
    (*((void (**)(id, void *))v7 + 2))(v7, v16);
  }
LABEL_8:
}

uint64_t __48__SFProximityClient__suppressDevice_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)stopSuppressingDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SFProximityClient_stopSuppressingDevice_completion___block_invoke;
  block[3] = &unk_1E5BBBC30;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __54__SFProximityClient_stopSuppressingDevice_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopSuppressingDevice:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_stopSuppressingDevice:(id)a3 completion:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    id v17 = v6;
    LogPrintF();
  }
  [(SFProximityClient *)self _ensureXPCStarted];
  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    id v9 = [(NSXPCConnection *)xpcCnx remoteObjectProxy];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55__SFProximityClient__stopSuppressingDevice_completion___block_invoke;
    v18[3] = &unk_1E5BBCD68;
    id v19 = v7;
    [v9 proximityClientStopSuppressingDevice:v6 completion:v18];

    id v10 = v19;
  }
  else
  {
    if (!v7) {
      goto LABEL_8;
    }
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28760];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    uint64_t v13 = [NSString stringWithUTF8String:DebugGetErrorString()];
    id v10 = (void *)v13;
    id v14 = @"?";
    if (v13) {
      id v14 = (__CFString *)v13;
    }
    v21[0] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v16 = [v11 errorWithDomain:v12 code:-6753 userInfo:v15];
    (*((void (**)(id, void *))v7 + 2))(v7, v16);
  }
LABEL_8:
}

uint64_t __55__SFProximityClient__stopSuppressingDevice_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateContent:(id)a3 forDevice:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__SFProximityClient_updateContent_forDevice_completion___block_invoke;
  v15[3] = &unk_1E5BBCDE0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(dispatchQueue, v15);
}

uint64_t __56__SFProximityClient_updateContent_forDevice_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContent:*(void *)(a1 + 40) forDevice:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)_updateContent:(id)a3 forDevice:(id)a4 completion:(id)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    id v20 = v9;
    id v21 = v8;
    LogPrintF();
  }
  [(SFProximityClient *)self _ensureXPCStarted];
  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    id v12 = [(NSXPCConnection *)xpcCnx remoteObjectProxy];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __57__SFProximityClient__updateContent_forDevice_completion___block_invoke;
    v22[3] = &unk_1E5BBCD68;
    id v23 = v10;
    [v12 proximityClientUpdateContent:v8 forDevice:v9 completion:v22];

    id v13 = v23;
  }
  else
  {
    if (!v10) {
      goto LABEL_8;
    }
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28760];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    uint64_t v16 = [NSString stringWithUTF8String:DebugGetErrorString()];
    id v13 = (void *)v16;
    id v17 = @"?";
    if (v16) {
      id v17 = (__CFString *)v16;
    }
    v25[0] = v17;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v19 = [v14 errorWithDomain:v15 code:-6753 userInfo:v18];
    (*((void (**)(id, void *))v10 + 2))(v10, v19);
  }
LABEL_8:
}

uint64_t __57__SFProximityClient__updateContent_forDevice_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)requestScannerTimerReset
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SFProximityClient_requestScannerTimerReset__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __45__SFProximityClient_requestScannerTimerReset__block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v2)
  {
    id v10 = [v2 remoteObjectProxy];
    [v10 proximityClientRequestScannerTimerReset];
  }
  else if (gLogCategory_SFProximityClient <= 90 {
         && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  }
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = *MEMORY[0x1E4F28760];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    uint64_t v5 = [NSString stringWithUTF8String:DebugGetErrorString()];
    id v6 = (void *)v5;
    id v7 = @"?";
    if (v5) {
      id v7 = (__CFString *)v5;
    }
    v12[0] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v9 = [v3 errorWithDomain:v4 code:-6753 userInfo:v8];
    LogPrintF();
  }
}

- (void)proximityClientDeviceEnteredImmediate:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  deviceEnteredImmediateHandler = (void (**)(id, id))self->_deviceEnteredImmediateHandler;
  uint64_t v5 = v6;
  if (deviceEnteredImmediateHandler)
  {
    deviceEnteredImmediateHandler[2](deviceEnteredImmediateHandler, v6);
    uint64_t v5 = v6;
  }
}

- (void)proximityClientDeviceExitedImmediate:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  deviceExitedImmediateHandler = (void (**)(id, id))self->_deviceExitedImmediateHandler;
  uint64_t v5 = v6;
  if (deviceExitedImmediateHandler)
  {
    deviceExitedImmediateHandler[2](deviceExitedImmediateHandler, v6);
    uint64_t v5 = v6;
  }
}

- (void)proximityClientDeviceEnteredNearby:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  deviceEnteredNearbyHandler = (void (**)(id, id))self->_deviceEnteredNearbyHandler;
  uint64_t v5 = v6;
  if (deviceEnteredNearbyHandler)
  {
    deviceEnteredNearbyHandler[2](deviceEnteredNearbyHandler, v6);
    uint64_t v5 = v6;
  }
}

- (void)proximityClientDeviceExitedNearby:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  deviceExitedNearbyHandler = (void (**)(id, id))self->_deviceExitedNearbyHandler;
  uint64_t v5 = v6;
  if (deviceExitedNearbyHandler)
  {
    deviceExitedNearbyHandler[2](deviceExitedNearbyHandler, v6);
    uint64_t v5 = v6;
  }
}

- (void)proximityClientDeviceWasDismissedHandler:(id)a3 reason:(int64_t)a4
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  deviceWasDismissedHandlerEx = (void (**)(id, id, int64_t))self->_deviceWasDismissedHandlerEx;
  id v7 = v8;
  if (deviceWasDismissedHandlerEx)
  {
    deviceWasDismissedHandlerEx[2](deviceWasDismissedHandlerEx, v8, a4);
    id v7 = v8;
  }
}

- (void)proximityClientDeviceWasSelectedHandler:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  deviceWasSelectedHandler = (void (**)(id, id))self->_deviceWasSelectedHandler;
  uint64_t v5 = v6;
  if (deviceWasSelectedHandler)
  {
    deviceWasSelectedHandler[2](deviceWasSelectedHandler, v6);
    uint64_t v5 = v6;
  }
}

- (void)proximityClientDeviceDidUntriggerHandler:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  deviceDidUntriggerHandler = (void (**)(id, id))self->_deviceDidUntriggerHandler;
  uint64_t v5 = v6;
  if (deviceDidUntriggerHandler)
  {
    deviceDidUntriggerHandler[2](deviceDidUntriggerHandler, v6);
    uint64_t v5 = v6;
  }
}

- (void)proximityClientDeviceWillTriggerHandler:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  deviceWillTriggerHandler = (void (**)(id, id))self->_deviceWillTriggerHandler;
  uint64_t v5 = v6;
  if (deviceWillTriggerHandler)
  {
    deviceWillTriggerHandler[2](deviceWillTriggerHandler, v6);
    uint64_t v5 = v6;
  }
}

- (void)proximityClientDeviceUpdated:(id)a3 rssi:(int64_t)a4 state:(int64_t)a5
{
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  deviceUpdateHandler = (void (**)(id, id, int64_t, int64_t))self->_deviceUpdateHandler;
  id v9 = v10;
  if (deviceUpdateHandler)
  {
    deviceUpdateHandler[2](deviceUpdateHandler, v10, a4, a5);
    id v9 = v10;
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

- (BOOL)shouldAdvertise
{
  return self->_shouldAdvertise;
}

- (id)deviceEnteredImmediateHandler
{
  return self->_deviceEnteredImmediateHandler;
}

- (void)setDeviceEnteredImmediateHandler:(id)a3
{
}

- (id)deviceExitedImmediateHandler
{
  return self->_deviceExitedImmediateHandler;
}

- (void)setDeviceExitedImmediateHandler:(id)a3
{
}

- (id)deviceEnteredNearbyHandler
{
  return self->_deviceEnteredNearbyHandler;
}

- (void)setDeviceEnteredNearbyHandler:(id)a3
{
}

- (id)deviceExitedNearbyHandler
{
  return self->_deviceExitedNearbyHandler;
}

- (void)setDeviceExitedNearbyHandler:(id)a3
{
}

- (id)deviceWasSelectedHandler
{
  return self->_deviceWasSelectedHandler;
}

- (void)setDeviceWasSelectedHandler:(id)a3
{
}

- (id)deviceWillTriggerHandler
{
  return self->_deviceWillTriggerHandler;
}

- (void)setDeviceWillTriggerHandler:(id)a3
{
}

- (id)deviceDidUntriggerHandler
{
  return self->_deviceDidUntriggerHandler;
}

- (void)setDeviceDidUntriggerHandler:(id)a3
{
}

- (id)deviceWasDismissedHandlerEx
{
  return self->_deviceWasDismissedHandlerEx;
}

- (void)setDeviceWasDismissedHandlerEx:(id)a3
{
}

- (id)deviceWasDismissedHandler
{
  return self->_deviceWasDismissedHandler;
}

- (void)setDeviceWasDismissedHandler:(id)a3
{
}

- (id)deviceUpdateHandler
{
  return self->_deviceUpdateHandler;
}

- (void)setDeviceUpdateHandler:(id)a3
{
}

- (BOOL)wantsUpdates
{
  return self->_wantsUpdates;
}

- (void)setWantsUpdates:(BOOL)a3
{
  self->_wantsUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceUpdateHandler, 0);
  objc_storeStrong(&self->_deviceWasDismissedHandler, 0);
  objc_storeStrong(&self->_deviceWasDismissedHandlerEx, 0);
  objc_storeStrong(&self->_deviceDidUntriggerHandler, 0);
  objc_storeStrong(&self->_deviceWillTriggerHandler, 0);
  objc_storeStrong(&self->_deviceWasSelectedHandler, 0);
  objc_storeStrong(&self->_deviceExitedNearbyHandler, 0);
  objc_storeStrong(&self->_deviceEnteredNearbyHandler, 0);
  objc_storeStrong(&self->_deviceExitedImmediateHandler, 0);
  objc_storeStrong(&self->_deviceEnteredImmediateHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end