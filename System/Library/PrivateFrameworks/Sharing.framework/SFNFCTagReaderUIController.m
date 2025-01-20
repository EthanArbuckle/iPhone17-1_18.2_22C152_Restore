@interface SFNFCTagReaderUIController
- (NSString)purpose;
- (OS_dispatch_queue)dispatchQueue;
- (SFNFCTagReaderUIController)init;
- (id)invalidationHandler;
- (int64_t)mode;
- (int64_t)operationMode;
- (void)_activateWithCompletion:(id)a3;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidated;
- (void)_nfcTagScannedCount;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)nfcTagScanned;
- (void)nfcTagScannedCount:(int64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setOperationMode:(int64_t)a3;
- (void)setPurpose:(id)a3;
- (void)uiActivatedWithCompletion:(id)a3;
- (void)uiInvalidatedWithCompletion:(id)a3;
@end

@implementation SFNFCTagReaderUIController

- (SFNFCTagReaderUIController)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFNFCTagReaderUIController;
  v2 = [(SFNFCTagReaderUIController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    *(_OWORD *)&v3->_mode = xmmword_1A56EB310;
  }
  return v3;
}

- (void)setPurpose:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = v5->_dispatchQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__SFNFCTagReaderUIController_setPurpose___block_invoke;
    v7[3] = &unk_1E5BBBD18;
    v7[4] = v5;
    id v8 = v4;
    dispatch_async(dispatchQueue, v7);
  }
  else
  {
    objc_storeStrong((id *)&v5->_purpose, v4);
  }
  objc_sync_exit(v5);
}

void __41__SFNFCTagReaderUIController_setPurpose___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), *(id *)(a1 + 40));
  v2 = [*(id *)(*(void *)(a1 + 32) + 64) remoteObjectProxyWithErrorHandler:&__block_literal_global_59];
  v3 = v2;
  if (v2)
  {
    v5 = v2;
    [v2 setPurpose:*(void *)(a1 + 40)];
LABEL_3:
    v3 = v5;
    goto LABEL_8;
  }
  if (gLogCategory_SFNFCTagReaderUIController <= 60)
  {
    v5 = 0;
    if (gLogCategory_SFNFCTagReaderUIController != -1 || (int v4 = _LogCategory_Initialize(), v3 = 0, v4))
    {
      LogPrintF();
      goto LABEL_3;
    }
  }
LABEL_8:
}

void __41__SFNFCTagReaderUIController_setPurpose___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = v2;
  if (gLogCategory_SFNFCTagReaderUIController <= 60)
  {
    id v5 = v2;
    if (gLogCategory_SFNFCTagReaderUIController != -1 || (int v4 = _LogCategory_Initialize(), v3 = v5, v4))
    {
      LogPrintF();
      v3 = v5;
    }
  }
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__SFNFCTagReaderUIController_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E5BBC8C0;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __53__SFNFCTagReaderUIController_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogCategory_SFNFCTagReaderUIController <= 30
    && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFNFCTagReaderUIController *)self _ensureXPCStarted];
  id v5 = [(CUXPCAgent *)self->_xpcAgent listenerEndpoint];
  if (v5)
  {
    v6 = _os_activity_create(&dword_1A5389000, "Sharing/SFNFCTagReaderUIController/nfcTagReaderUIActivateWithEndpoint", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v6, &state);
    xpcCnx = self->_xpcCnx;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __54__SFNFCTagReaderUIController__activateWithCompletion___block_invoke;
    v18[3] = &unk_1E5BBCD68;
    id v8 = v4;
    id v19 = v8;
    id v9 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v18];
    v21[0] = @"mode";
    v10 = [NSNumber numberWithInteger:self->_mode];
    v22[0] = v10;
    v21[1] = @"operationMode";
    uint64_t v11 = [NSNumber numberWithInteger:self->_operationMode];
    v12 = (void *)v11;
    v21[2] = @"purpose";
    purpose = (__CFString *)self->_purpose;
    if (!purpose) {
      purpose = &stru_1EF9BDC68;
    }
    v22[1] = v11;
    v22[2] = purpose;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__SFNFCTagReaderUIController__activateWithCompletion___block_invoke_2;
    v16[3] = &unk_1E5BBCD68;
    id v17 = v8;
    [v9 nfcTagReaderUIActivateWithEndpoint:v5 params:v14 completion:v16];

    os_activity_scope_leave(&state);
  }
  else if (v4)
  {
    v15 = NSErrorWithOSStatusF();
    (*((void (**)(id, void *))v4 + 2))(v4, v15);
  }
}

void __54__SFNFCTagReaderUIController__activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    if (gLogCategory_SFNFCTagReaderUIController <= 60)
    {
      if (gLogCategory_SFNFCTagReaderUIController != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        id v3 = v6;
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    id v3 = v6;
  }
}

void __54__SFNFCTagReaderUIController__activateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    if (gLogCategory_SFNFCTagReaderUIController <= 60)
    {
      if (gLogCategory_SFNFCTagReaderUIController != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        id v3 = v7;
      }
    }
  }
  else if (gLogCategory_SFNFCTagReaderUIController <= 30)
  {
    if (gLogCategory_SFNFCTagReaderUIController != -1) {
      goto LABEL_7;
    }
    int v5 = _LogCategory_Initialize();
    id v3 = 0;
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

- (void)_ensureXPCStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.SharingServices" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __47__SFNFCTagReaderUIController__ensureXPCStarted__block_invoke;
    v18[3] = &unk_1E5BBC870;
    void v18[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v18];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __47__SFNFCTagReaderUIController__ensureXPCStarted__block_invoke_2;
    v17[3] = &unk_1E5BBC870;
    v17[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v17];
    int v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA39680];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v5];

    [(NSXPCConnection *)self->_xpcCnx resume];
  }
  if (!self->_xpcAgent)
  {
    uint64_t v6 = (CUXPCAgent *)objc_alloc_init(MEMORY[0x1E4F5E238]);
    xpcAgent = self->_xpcAgent;
    self->_xpcAgent = v6;

    [(CUXPCAgent *)self->_xpcAgent setDispatchQueue:self->_dispatchQueue];
    id v8 = [NSString stringWithUTF8String:off_1E966F890];
    [(CUXPCAgent *)self->_xpcAgent setLabel:v8];

    id v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA396E0];
    [(CUXPCAgent *)self->_xpcAgent setExportedInterface:v9];

    [(CUXPCAgent *)self->_xpcAgent setExportedObject:self];
    v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA39740];
    [(CUXPCAgent *)self->_xpcAgent setRemoteObjectInterface:v10];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __47__SFNFCTagReaderUIController__ensureXPCStarted__block_invoke_3;
    v16[3] = &unk_1E5BC1068;
    void v16[4] = self;
    [(CUXPCAgent *)self->_xpcAgent setConnectionStartedHandler:v16];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __47__SFNFCTagReaderUIController__ensureXPCStarted__block_invoke_4;
    v15[3] = &unk_1E5BC1068;
    v15[4] = self;
    [(CUXPCAgent *)self->_xpcAgent setConnectionEndedHandler:v15];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__SFNFCTagReaderUIController__ensureXPCStarted__block_invoke_5;
    v14[3] = &unk_1E5BBC870;
    v14[4] = self;
    [(CUXPCAgent *)self->_xpcAgent setInvalidationHandler:v14];
    uint64_t v11 = self->_xpcAgent;
    id v13 = 0;
    LODWORD(v10) = [(CUXPCAgent *)v11 activateDirectAndReturnError:&v13];
    id v12 = v13;
    if (v10)
    {
      if (gLogCategory_SFNFCTagReaderUIController > 30
        || gLogCategory_SFNFCTagReaderUIController == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_14;
      }
    }
    else if (gLogCategory_SFNFCTagReaderUIController > 60 {
           || gLogCategory_SFNFCTagReaderUIController == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_14;
    }
    LogPrintF();
LABEL_14:
  }
}

uint64_t __47__SFNFCTagReaderUIController__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __47__SFNFCTagReaderUIController__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  int v4 = *(void **)(a1 + 32);

  return [v4 _invalidated];
}

void __47__SFNFCTagReaderUIController__ensureXPCStarted__block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  if (gLogCategory_SFNFCTagReaderUIController <= 30
    && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
  {
    id v5 = v6;
    LogPrintF();
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), a2);
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 40))
  {
    *(unsigned char *)(v4 + 40) = 0;
    if (gLogCategory_SFNFCTagReaderUIController <= 30
      && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "_nfcTagScannedCount", v5);
  }
}

void __47__SFNFCTagReaderUIController__ensureXPCStarted__block_invoke_4(uint64_t a1, void *a2)
{
  id v8 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  if (gLogCategory_SFNFCTagReaderUIController <= 30
    && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(id *)(v3 + 64) == v8)
  {
    *(void *)(v3 + 64) = 0;

    uint64_t v3 = *(void *)(a1 + 32);
  }
  uint64_t v4 = *(void *)(v3 + 72);
  if (v4)
  {
    id v5 = NSErrorWithOSStatusF();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 72);
    *(void *)(v6 + 72) = 0;
  }
}

uint64_t __47__SFNFCTagReaderUIController__ensureXPCStarted__block_invoke_5(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  if (gLogCategory_SFNFCTagReaderUIController <= 30
    && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 _invalidated];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFNFCTagReaderUIController <= 50
    && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SFNFCTagReaderUIController_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __40__SFNFCTagReaderUIController_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    if (gLogCategory_SFNFCTagReaderUIController <= 30
      && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [*(id *)(*(void *)(v2 + 32) + 48) invalidate];
    [*(id *)(*(void *)(v2 + 32) + 56) invalidate];
    uint64_t v3 = *(void **)(v2 + 32);
    return [v3 _invalidated];
  }
  return result;
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SFNFCTagReaderUIController <= 50
      && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_xpcAgent && !self->_xpcCnx && !self->_xpcUICnx)
    {
      invalidationHandler = (void (**)(id, void))self->_invalidationHandler;
      if (invalidationHandler)
      {
        invalidationHandler[2](invalidationHandler, 0);
        id v4 = self->_invalidationHandler;
      }
      else
      {
        id v4 = 0;
      }
      self->_invalidationHandler = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_SFNFCTagReaderUIController <= 30
        && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)nfcTagScanned
{
}

- (void)nfcTagScannedCount:(int64_t)a3
{
  self->_nfcTagScanCount += a3;
  if (gLogCategory_SFNFCTagReaderUIController <= 30
    && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  [(SFNFCTagReaderUIController *)self _nfcTagScannedCount];
}

- (void)_nfcTagScannedCount
{
  uint64_t v3 = [(CUXPCAgentConnection *)self->_xpcUICnx remoteObjectProxyWithErrorHandler:&__block_literal_global_175_0];
  id v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    [v3 nfcTagScannedCount:self->_nfcTagScanCount];
LABEL_3:
    id v4 = v6;
    goto LABEL_8;
  }
  self->_nfcTagScanPending = 1;
  if (gLogCategory_SFNFCTagReaderUIController <= 30)
  {
    uint64_t v6 = 0;
    if (gLogCategory_SFNFCTagReaderUIController != -1 || (v5 = _LogCategory_Initialize(), id v4 = 0, v5))
    {
      LogPrintF();
      goto LABEL_3;
    }
  }
LABEL_8:
}

void __49__SFNFCTagReaderUIController__nfcTagScannedCount__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = v2;
  if (gLogCategory_SFNFCTagReaderUIController <= 60)
  {
    id v5 = v2;
    if (gLogCategory_SFNFCTagReaderUIController != -1 || (int v4 = _LogCategory_Initialize(), v3 = v5, v4))
    {
      LogPrintF();
      uint64_t v3 = v5;
    }
  }
}

- (void)uiActivatedWithCompletion:(id)a3
{
  int v4 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFNFCTagReaderUIController <= 30
    && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_nfcTagScanCount >= 1) {
    [(SFNFCTagReaderUIController *)self _nfcTagScannedCount];
  }
  v4[2](v4, 0);
}

- (void)uiInvalidatedWithCompletion:(id)a3
{
  id v7 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFNFCTagReaderUIController <= 30
    && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  invalidationHandler = (void (**)(id, void *))self->_invalidationHandler;
  if (invalidationHandler)
  {
    id v5 = NSErrorWithOSStatusF();
    invalidationHandler[2](invalidationHandler, v5);

    id v6 = self->_invalidationHandler;
    self->_invalidationHandler = 0;
  }
  v7[2](v7, 0);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)operationMode
{
  return self->_operationMode;
}

- (void)setOperationMode:(int64_t)a3
{
  self->_operationMode = a3;
}

- (NSString)purpose
{
  return self->_purpose;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_xpcUICnx, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_xpcAgent, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end