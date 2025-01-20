@interface SFDiagnostics
- (OS_dispatch_queue)dispatchQueue;
- (SFDiagnostics)init;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidated;
- (void)_logControl:(id)a3 completion:(id)a4;
- (void)_show:(id)a3 completion:(id)a4;
- (void)bluetoothUserInteraction;
- (void)dealloc;
- (void)diagnosticBLEModeWithCompletion:(id)a3;
- (void)diagnosticControl:(id)a3 completion:(id)a4;
- (void)diagnosticMock:(id)a3 device:(id)a4 completion:(id)a5;
- (void)diagnosticMockStart:(id)a3;
- (void)diagnosticMockStop:(id)a3;
- (void)invalidate;
- (void)logControl:(id)a3 completion:(id)a4;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)show:(id)a3 completion:(id)a4;
- (void)unlockTestClientWithDevice:(id)a3;
- (void)unlockTestServer;
@end

@implementation SFDiagnostics

- (SFDiagnostics)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFDiagnostics;
  v2 = [(SFDiagnostics *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (void)dealloc
{
  if (self->_xpcCnx)
  {
    v6 = (SFDiagnostics *)FatalErrorF();
    [(SFDiagnostics *)v6 invalidate];
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

    v8.receiver = self;
    v8.super_class = (Class)SFDiagnostics;
    [(SFDiagnostics *)&v8 dealloc];
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__SFDiagnostics_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__SFDiagnostics_invalidate__block_invoke(uint64_t a1)
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
      && gLogCategory_SFDiagnostics <= 30
      && (gLogCategory_SFDiagnostics != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    xpcCnx = self->_xpcCnx;
    if (xpcCnx)
    {
      [(NSXPCConnection *)xpcCnx invalidate];
      uint64_t v4 = self->_xpcCnx;
      self->_xpcCnx = 0;
    }
    else
    {
      [(SFDiagnostics *)self _invalidated];
    }
  }
}

- (void)bluetoothUserInteraction
{
  v3 = _os_activity_create(&dword_1A5389000, "Sharing/SFDiagnostics/bluetoothUserInteraction", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SFDiagnostics_bluetoothUserInteraction__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
  os_activity_scope_leave(&state);
}

void __41__SFDiagnostics_bluetoothUserInteraction__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) remoteObjectProxy];
  [v2 bluetoothUserInteraction];
}

- (void)diagnosticBLEModeWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFDiagnostics/diagnosticBLEModeWithCompletion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__SFDiagnostics_diagnosticBLEModeWithCompletion___block_invoke;
  v8[3] = &unk_1E5BBC8C0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __49__SFDiagnostics_diagnosticBLEModeWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__SFDiagnostics_diagnosticBLEModeWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 40);
  v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 diagnosticBLEModeWithCompletion:*(void *)(a1 + 40)];
}

uint64_t __49__SFDiagnostics_diagnosticBLEModeWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)diagnosticControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = _os_activity_create(&dword_1A5389000, "Sharing/SFDiagnostics/diagnosticControl", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SFDiagnostics_diagnosticControl_completion___block_invoke;
  block[3] = &unk_1E5BBDA60;
  id v13 = v6;
  id v14 = v7;
  block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __46__SFDiagnostics_diagnosticControl_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__SFDiagnostics_diagnosticControl_completion___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 48);
  v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 diagnosticControl:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __46__SFDiagnostics_diagnosticControl_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)diagnosticMock:(id)a3 device:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_1A5389000, "Sharing/SFDiagnostics/diagnosticMock", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  dispatchQueue = self->_dispatchQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__SFDiagnostics_diagnosticMock_device_completion___block_invoke;
  v16[3] = &unk_1E5BBDA38;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  dispatch_async(dispatchQueue, v16);

  os_activity_scope_leave(&state);
}

void __50__SFDiagnostics_diagnosticMock_device_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__SFDiagnostics_diagnosticMock_device_completion___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 56);
  v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 diagnosticMock:*(void *)(a1 + 40) device:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t __50__SFDiagnostics_diagnosticMock_device_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)diagnosticMockStart:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFDiagnostics/diagnosticMockStart", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__SFDiagnostics_diagnosticMockStart___block_invoke;
  v8[3] = &unk_1E5BBC8C0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __37__SFDiagnostics_diagnosticMockStart___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__SFDiagnostics_diagnosticMockStart___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 40);
  v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 diagnosticMockStart:*(void *)(a1 + 40)];
}

uint64_t __37__SFDiagnostics_diagnosticMockStart___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)diagnosticMockStop:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFDiagnostics/diagnosticMockStop", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__SFDiagnostics_diagnosticMockStop___block_invoke;
  v8[3] = &unk_1E5BBC8C0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __36__SFDiagnostics_diagnosticMockStop___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__SFDiagnostics_diagnosticMockStop___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 40);
  v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 diagnosticMockStop:*(void *)(a1 + 40)];
}

uint64_t __36__SFDiagnostics_diagnosticMockStop___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)logControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SFDiagnostics_logControl_completion___block_invoke;
  block[3] = &unk_1E5BBBC30;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__SFDiagnostics_logControl_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _logControl:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_logControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A5389000, "Sharing/SFDiagnostics/diagnosticLogControl", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(SFDiagnostics *)self _ensureXPCStarted];
  xpcCnx = self->_xpcCnx;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __40__SFDiagnostics__logControl_completion___block_invoke;
  v15[3] = &unk_1E5BBCD68;
  id v10 = v7;
  id v16 = v10;
  id v11 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__SFDiagnostics__logControl_completion___block_invoke_2;
  v13[3] = &unk_1E5BC1040;
  id v12 = v10;
  id v14 = v12;
  [v11 diagnosticLogControl:v6 completion:v13];

  os_activity_scope_leave(&state);
}

void __40__SFDiagnostics__logControl_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    NSPrintF();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

void __40__SFDiagnostics__logControl_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v7 = v3;
    if (v3)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    }
    else
    {
      id v6 = NSPrintF();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    }
    id v4 = v7;
  }
}

- (void)show:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SFDiagnostics_show_completion___block_invoke;
  block[3] = &unk_1E5BBBC30;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __33__SFDiagnostics_show_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _show:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_show:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A5389000, "Sharing/SFDiagnostics/diagnosticShow", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(SFDiagnostics *)self _ensureXPCStarted];
  xpcCnx = self->_xpcCnx;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __34__SFDiagnostics__show_completion___block_invoke;
  v15[3] = &unk_1E5BBCD68;
  id v10 = v7;
  id v16 = v10;
  id v11 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __34__SFDiagnostics__show_completion___block_invoke_2;
  v13[3] = &unk_1E5BC1040;
  id v12 = v10;
  id v14 = v12;
  [v11 diagnosticShow:v6 completion:v13];

  os_activity_scope_leave(&state);
}

void __34__SFDiagnostics__show_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    NSPrintF();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

void __34__SFDiagnostics__show_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v7 = v3;
    if (v3)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    }
    else
    {
      id v6 = NSPrintF();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    }
    id v4 = v7;
  }
}

- (void)unlockTestClientWithDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFDiagnostics/diagnosticUnlockTestClientWithDevice", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__SFDiagnostics_unlockTestClientWithDevice___block_invoke;
  v8[3] = &unk_1E5BBBD18;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __44__SFDiagnostics_unlockTestClientWithDevice___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) remoteObjectProxy];
  [v2 diagnosticUnlockTestClientWithDevice:*(void *)(a1 + 40)];
}

- (void)unlockTestServer
{
  id v3 = _os_activity_create(&dword_1A5389000, "Sharing/SFDiagnostics/diagnosticUnlockTestServer", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SFDiagnostics_unlockTestServer__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
  os_activity_scope_leave(&state);
}

void __33__SFDiagnostics_unlockTestServer__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) remoteObjectProxy];
  [v2 diagnosticUnlockTestServer];
}

- (void)_ensureXPCStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.SharingServices" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __34__SFDiagnostics__ensureXPCStarted__block_invoke;
    v7[3] = &unk_1E5BBC870;
    v7[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v7];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __34__SFDiagnostics__ensureXPCStarted__block_invoke_2;
    v6[3] = &unk_1E5BBC870;
    v6[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v6];
    uint64_t v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA39620];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v5];

    [(NSXPCConnection *)self->_xpcCnx resume];
    if (gLogCategory_SFDiagnostics <= 10
      && (gLogCategory_SFDiagnostics != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __34__SFDiagnostics__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __34__SFDiagnostics__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFDiagnostics <= 50 && (gLogCategory_SFDiagnostics != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler) {
    interruptionHandler[2]();
  }
  if (self->_btUser)
  {
    id v4 = _os_activity_create(&dword_1A5389000, "Sharing/SFDiagnostics/bluetoothUserInteraction", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v6.opaque[0] = 0;
    v6.opaque[1] = 0;
    os_activity_scope_enter(v4, &v6);
    uint64_t v5 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
    [v5 bluetoothUserInteraction];

    os_activity_scope_leave(&v6);
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SFDiagnostics <= 50
      && (gLogCategory_SFDiagnostics != -1 || _LogCategory_Initialize()))
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
    if (gLogCategory_SFDiagnostics <= 10
      && (gLogCategory_SFDiagnostics != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end