@interface SFAppleIDClient
- (OS_dispatch_queue)dispatchQueue;
- (SFAppleIDClient)init;
- (__SecIdentity)copyIdentityForAppleID:(id)a3 error:(id *)a4;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)myAccountWithError:(id *)a3;
- (id)syncRemoteProxyWithError:(id *)a3;
- (void)_copyCertificateForAppleID:(id)a3 withCompletion:(id)a4;
- (void)_copyIdentityForAppleID:(id)a3 withCompletion:(id)a4;
- (void)_ensureAuthXPCStarted;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidated;
- (void)_myAccountWithCompletion:(id)a3;
- (void)_personInfoWithEmailOrPhone:(id)a3 completion:(id)a4;
- (void)authenticateAccountWithAppleID:(id)a3 password:(id)a4 completion:(id)a5;
- (void)copyCertificateForAppleID:(id)a3 withCompletion:(id)a4;
- (void)copyIdentityForAppleID:(id)a3 withCompletion:(id)a4;
- (void)dealloc;
- (void)ensureSyncXPCStarted;
- (void)invalidate;
- (void)myAccountWithCompletion:(id)a3;
- (void)personInfoWithEmailOrPhone:(id)a3 completion:(id)a4;
- (void)requestWithInfo:(id)a3 completion:(id)a4;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)statusInfoWithCompletion:(id)a3;
@end

@implementation SFAppleIDClient

- (SFAppleIDClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFAppleIDClient;
  v2 = [(SFAppleIDClient *)&v6 init];
  if (v2)
  {
    uint64_t v3 = SFMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)dealloc
{
  if (self->_xpcCnx)
  {
    objc_super v6 = (SFAppleIDClient *)FatalErrorF();
    [(SFAppleIDClient *)v6 invalidate];
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
    v8.super_class = (Class)SFAppleIDClient;
    [(SFAppleIDClient *)&v8 dealloc];
  }
}

- (void)invalidate
{
  v2 = self;
  objc_sync_enter(v2);
  syncXPCCnx = v2->_syncXPCCnx;
  if (syncXPCCnx)
  {
    [(NSXPCConnection *)syncXPCCnx invalidate];
    v4 = v2->_syncXPCCnx;
    v2->_syncXPCCnx = 0;
  }
  objc_sync_exit(v2);

  dispatchQueue = v2->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__SFAppleIDClient_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = v2;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__SFAppleIDClient_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled) {
    return;
  }
  self->_invalidateCalled = 1;
  if (!self->_invalidateDone
    && gLogCategory_SFAppleIDClient <= 30
    && (gLogCategory_SFAppleIDClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    [(NSXPCConnection *)xpcCnx invalidate];
    v4 = self->_xpcCnx;
    self->_xpcCnx = 0;

    xpcAuthCnx = self->_xpcAuthCnx;
    if (!xpcAuthCnx) {
      return;
    }
    goto LABEL_11;
  }
  xpcAuthCnx = self->_xpcAuthCnx;
  if (xpcAuthCnx)
  {
LABEL_11:
    [(NSXPCConnection *)xpcAuthCnx invalidate];
    objc_super v6 = self->_xpcAuthCnx;
    self->_xpcAuthCnx = 0;

    return;
  }

  [(SFAppleIDClient *)self _invalidated];
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
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__SFAppleIDClient__ensureXPCStarted__block_invoke;
    v7[3] = &unk_1E5BBC870;
    v7[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v7];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __36__SFAppleIDClient__ensureXPCStarted__block_invoke_2;
    v6[3] = &unk_1E5BBC870;
    v6[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v6];
    v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA39080];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v5];

    [(NSXPCConnection *)self->_xpcCnx resume];
    if (gLogCategory_SFAppleIDClient <= 10
      && (gLogCategory_SFAppleIDClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __36__SFAppleIDClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __36__SFAppleIDClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)ensureSyncXPCStarted
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_syncXPCCnx)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.SharingServices" options:0];
    syncXPCCnx = v2->_syncXPCCnx;
    v2->_syncXPCCnx = (NSXPCConnection *)v3;

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__SFAppleIDClient_ensureSyncXPCStarted__block_invoke;
    v7[3] = &unk_1E5BBC870;
    v7[4] = v2;
    [(NSXPCConnection *)v2->_syncXPCCnx setInterruptionHandler:v7];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__SFAppleIDClient_ensureSyncXPCStarted__block_invoke_3;
    v6[3] = &unk_1E5BBC870;
    v6[4] = v2;
    [(NSXPCConnection *)v2->_syncXPCCnx setInvalidationHandler:v6];
    v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA39080];
    [(NSXPCConnection *)v2->_syncXPCCnx setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_syncXPCCnx resume];
    if (gLogCategory_SFAppleIDClient <= 10
      && (gLogCategory_SFAppleIDClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  objc_sync_exit(v2);
}

void __39__SFAppleIDClient_ensureSyncXPCStarted__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SFAppleIDClient_ensureSyncXPCStarted__block_invoke_2;
  block[3] = &unk_1E5BBC870;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __39__SFAppleIDClient_ensureSyncXPCStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

void __39__SFAppleIDClient_ensureSyncXPCStarted__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SFAppleIDClient_ensureSyncXPCStarted__block_invoke_4;
  block[3] = &unk_1E5BBC870;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __39__SFAppleIDClient_ensureSyncXPCStarted__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_ensureAuthXPCStarted
{
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFAppleIDClient <= 50
    && (gLogCategory_SFAppleIDClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler)
  {
    v4 = (void (*)(void))*((void *)interruptionHandler + 2);
    v4();
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SFAppleIDClient <= 50
      && (gLogCategory_SFAppleIDClient != -1 || _LogCategory_Initialize()))
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

    xpcAuthCnx = self->_xpcAuthCnx;
    self->_xpcAuthCnx = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_SFAppleIDClient <= 10
      && (gLogCategory_SFAppleIDClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (id)syncRemoteProxyWithError:(id *)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  v4 = self;
  objc_sync_enter(v4);
  syncXPCCnx = v4->_syncXPCCnx;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__SFAppleIDClient_syncRemoteProxyWithError___block_invoke;
  v8[3] = &unk_1E5BBD998;
  v8[4] = &v9;
  objc_super v6 = [(NSXPCConnection *)syncXPCCnx synchronousRemoteObjectProxyWithErrorHandler:v8];
  objc_sync_exit(v4);

  if (a3 && !v6) {
    *a3 = (id) v10[5];
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __44__SFAppleIDClient_syncRemoteProxyWithError___block_invoke(uint64_t a1, void *a2)
{
}

- (void)copyCertificateForAppleID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SFAppleIDClient_copyCertificateForAppleID_withCompletion___block_invoke;
  block[3] = &unk_1E5BBBC30;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __60__SFAppleIDClient_copyCertificateForAppleID_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _copyCertificateForAppleID:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
}

- (void)_copyCertificateForAppleID:(id)a3 withCompletion:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = _os_activity_create(&dword_1A5389000, "Sharing/SFAppleIDClient/copyCertificateForAppleID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v6 && v7)
  {
    [(SFAppleIDClient *)self _ensureXPCStarted];
    xpcCnx = self->_xpcCnx;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __61__SFAppleIDClient__copyCertificateForAppleID_withCompletion___block_invoke;
    v20[3] = &unk_1E5BBCD68;
    id v10 = v7;
    id v21 = v10;
    uint64_t v11 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v20];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __61__SFAppleIDClient__copyCertificateForAppleID_withCompletion___block_invoke_2;
    v18[3] = &unk_1E5BBD9C0;
    id v19 = v10;
    [v11 accountForAppleID:v6 withCompletion:v18];

    id v12 = v21;
  }
  else
  {
    if (!v7) {
      goto LABEL_5;
    }
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    uint64_t v14 = [NSString stringWithUTF8String:DebugGetErrorString()];
    id v12 = (void *)v14;
    v15 = @"?";
    if (v14) {
      v15 = (__CFString *)v14;
    }
    v24[0] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v17 = [v13 errorWithDomain:*MEMORY[0x1E4F28760] code:-6705 userInfo:v16];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v17);
  }
LABEL_5:
  os_activity_scope_leave(&state);
}

uint64_t __61__SFAppleIDClient__copyCertificateForAppleID_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__SFAppleIDClient__copyCertificateForAppleID_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 code])
  {
    id v10 = v6;
  }
  else
  {
    if (v5)
    {
      id v7 = [v5 identity];

      if (v7)
      {
        objc_super v8 = [v5 identity];
        uint64_t v9 = [v8 copyCertificate];

        if (v9)
        {
          id v10 = 0;
          goto LABEL_6;
        }
        id v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v22 = *MEMORY[0x1E4F28760];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        uint64_t v25 = [NSString stringWithUTF8String:DebugGetErrorString()];
        v15 = (void *)v25;
        v26 = @"?";
        if (v25) {
          v26 = (__CFString *)v25;
        }
        v28 = v26;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        uint64_t v20 = 201203;
      }
      else
      {
        id v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v22 = *MEMORY[0x1E4F28760];
        uint64_t v29 = *MEMORY[0x1E4F28568];
        uint64_t v23 = [NSString stringWithUTF8String:DebugGetErrorString()];
        v15 = (void *)v23;
        v24 = @"?";
        if (v23) {
          v24 = (__CFString *)v23;
        }
        v30 = v24;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        uint64_t v20 = 201205;
      }
      v18 = v21;
      uint64_t v19 = v22;
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F28760];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      uint64_t v14 = [NSString stringWithUTF8String:DebugGetErrorString()];
      v15 = (void *)v14;
      v16 = @"?";
      if (v14) {
        v16 = (__CFString *)v14;
      }
      v32[0] = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
      v18 = v12;
      uint64_t v19 = v13;
      uint64_t v20 = 201202;
    }
    id v10 = [v18 errorWithDomain:v19 code:v20 userInfo:v17];
  }
  uint64_t v9 = 0;
LABEL_6:
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, v9, v10);
  }
}

- (void)copyIdentityForAppleID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  if (gSDAppleIDAgent)
  {
    if (gLogCategory_SFAppleIDClient <= 90
      && (gLogCategory_SFAppleIDClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v9 = [(id)gSDAppleIDAgent copyIdentityForAppleID:v6];
    if (v9)
    {
      v7[2](v7, v9, 0);
    }
    else
    {
      id v10 = NSErrorF();
      ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v10);
    }
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__SFAppleIDClient_copyIdentityForAppleID_withCompletion___block_invoke;
    block[3] = &unk_1E5BBBC30;
    block[4] = self;
    id v12 = v6;
    uint64_t v13 = v7;
    dispatch_async(dispatchQueue, block);
  }
}

uint64_t __57__SFAppleIDClient_copyIdentityForAppleID_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _copyIdentityForAppleID:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
}

- (void)_copyIdentityForAppleID:(id)a3 withCompletion:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = _os_activity_create(&dword_1A5389000, "Sharing/SFAppleIDClient/copyIdentityForAppleID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v6 && v7)
  {
    [(SFAppleIDClient *)self _ensureXPCStarted];
    xpcCnx = self->_xpcCnx;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __58__SFAppleIDClient__copyIdentityForAppleID_withCompletion___block_invoke;
    v20[3] = &unk_1E5BBCD68;
    id v10 = v7;
    id v21 = v10;
    uint64_t v11 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v20];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __58__SFAppleIDClient__copyIdentityForAppleID_withCompletion___block_invoke_2;
    v18[3] = &unk_1E5BBD9C0;
    id v19 = v10;
    [v11 accountForAppleID:v6 withCompletion:v18];

    id v12 = v21;
  }
  else
  {
    if (!v7) {
      goto LABEL_5;
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    uint64_t v14 = [NSString stringWithUTF8String:DebugGetErrorString()];
    id v12 = (void *)v14;
    v15 = @"?";
    if (v14) {
      v15 = (__CFString *)v14;
    }
    v24[0] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v17 = [v13 errorWithDomain:*MEMORY[0x1E4F28760] code:-6705 userInfo:v16];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v17);
  }
LABEL_5:
  os_activity_scope_leave(&state);
}

uint64_t __58__SFAppleIDClient__copyIdentityForAppleID_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__SFAppleIDClient__copyIdentityForAppleID_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 code])
  {
    id v10 = v6;
  }
  else
  {
    if (v5)
    {
      id v7 = [v5 identity];

      if (v7)
      {
        objc_super v8 = [v5 identity];
        uint64_t v9 = [v8 copyIdentity];

        if (v9)
        {
          id v10 = 0;
          goto LABEL_6;
        }
        id v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v22 = *MEMORY[0x1E4F28760];
        uint64_t v30 = *MEMORY[0x1E4F28568];
        uint64_t v28 = [NSString stringWithUTF8String:DebugGetErrorString()];
        v15 = (void *)v28;
        uint64_t v29 = @"?";
        if (v28) {
          uint64_t v29 = (__CFString *)v28;
        }
        uint64_t v31 = v29;
        uint64_t v25 = (void *)MEMORY[0x1E4F1C9E8];
        v26 = &v31;
        uint64_t v27 = &v30;
      }
      else
      {
        id v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v22 = *MEMORY[0x1E4F28760];
        uint64_t v32 = *MEMORY[0x1E4F28568];
        uint64_t v23 = [NSString stringWithUTF8String:DebugGetErrorString()];
        v15 = (void *)v23;
        v24 = @"?";
        if (v23) {
          v24 = (__CFString *)v23;
        }
        v33 = v24;
        uint64_t v25 = (void *)MEMORY[0x1E4F1C9E8];
        v26 = &v33;
        uint64_t v27 = &v32;
      }
      v17 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:1];
      id v19 = v21;
      uint64_t v20 = v22;
      uint64_t v18 = 201205;
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F28760];
      uint64_t v34 = *MEMORY[0x1E4F28568];
      uint64_t v14 = [NSString stringWithUTF8String:DebugGetErrorString()];
      v15 = (void *)v14;
      v16 = @"?";
      if (v14) {
        v16 = (__CFString *)v14;
      }
      v35[0] = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
      uint64_t v18 = 201202;
      id v19 = v12;
      uint64_t v20 = v13;
    }
    id v10 = [v19 errorWithDomain:v20 code:v18 userInfo:v17];
  }
  uint64_t v9 = 0;
LABEL_6:
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, v9, v10);
  }
}

- (__SecIdentity)copyIdentityForAppleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = (id *)&v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  if (!v6) {
    goto LABEL_4;
  }
  if (!gSDAppleIDAgent)
  {
    [(SFAppleIDClient *)self ensureSyncXPCStarted];
    id v10 = v20;
    id obj = v20[5];
    id v9 = [(SFAppleIDClient *)self syncRemoteProxyWithError:&obj];
    objc_storeStrong(v10 + 5, obj);
    if (v9)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __48__SFAppleIDClient_copyIdentityForAppleID_error___block_invoke;
      v13[3] = &unk_1E5BBD9E8;
      v13[4] = &v19;
      v13[5] = &v15;
      [v9 accountForAppleID:v6 withCompletion:v13];
    }
    goto LABEL_7;
  }
  uint64_t v7 = [(id)gSDAppleIDAgent copyIdentityForAppleID:v6];
  v16[3] = v7;
  if (!v7)
  {
LABEL_4:
    uint64_t v8 = NSErrorF();
    id v9 = v20[5];
    v20[5] = (id)v8;
LABEL_7:
  }
  uint64_t v11 = (__SecIdentity *)v16[3];
  if (a4 && !v11)
  {
    *a4 = v20[5];
    uint64_t v11 = (__SecIdentity *)v16[3];
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v11;
}

void __48__SFAppleIDClient_copyIdentityForAppleID_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 code])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    goto LABEL_5;
  }
  if (!v5)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28760];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    uint64_t v11 = [NSString stringWithUTF8String:DebugGetErrorString()];
    id v12 = (void *)v11;
    uint64_t v13 = @"?";
    if (v11) {
      uint64_t v13 = (__CFString *)v11;
    }
    v35[0] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    uint64_t v15 = 201202;
    v16 = v9;
    uint64_t v17 = v10;
    goto LABEL_17;
  }
  uint64_t v7 = [v5 identity];

  if (!v7)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28760];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    uint64_t v20 = [NSString stringWithUTF8String:DebugGetErrorString()];
    id v12 = (void *)v20;
    uint64_t v21 = @"?";
    if (v20) {
      uint64_t v21 = (__CFString *)v20;
    }
    v33 = v21;
    uint64_t v22 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v23 = &v33;
    id v24 = &v32;
    goto LABEL_16;
  }
  uint64_t v8 = [v5 identity];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 copyIdentity];

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28760];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    uint64_t v25 = [NSString stringWithUTF8String:DebugGetErrorString()];
    id v12 = (void *)v25;
    v26 = @"?";
    if (v25) {
      v26 = (__CFString *)v25;
    }
    uint64_t v31 = v26;
    uint64_t v22 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v23 = &v31;
    id v24 = &v30;
LABEL_16:
    uint64_t v14 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
    v16 = v18;
    uint64_t v17 = v19;
    uint64_t v15 = 201205;
LABEL_17:
    uint64_t v27 = [v16 errorWithDomain:v17 code:v15 userInfo:v14];
    uint64_t v28 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;
  }
LABEL_5:
}

- (void)myAccountWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void, void))v4;
  if (gSDAppleIDAgent)
  {
    if (gLogCategory_SFAppleIDClient <= 90
      && (gLogCategory_SFAppleIDClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v7 = [(id)gSDAppleIDAgent myAccount];
    if (v7)
    {
      ((void (**)(void, void *, void))v5)[2](v5, v7, 0);
    }
    else
    {
      uint64_t v8 = NSErrorF();
      ((void (**)(void, void, void *))v5)[2](v5, 0, v8);
    }
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__SFAppleIDClient_myAccountWithCompletion___block_invoke;
    v9[3] = &unk_1E5BBC8C0;
    v9[4] = self;
    id v10 = v4;
    dispatch_async(dispatchQueue, v9);
  }
}

uint64_t __43__SFAppleIDClient_myAccountWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _myAccountWithCompletion:*(void *)(a1 + 40)];
}

- (void)_myAccountWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFAppleIDClient/myAccountWithCompletion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    [(SFAppleIDClient *)self _ensureXPCStarted];
    xpcCnx = self->_xpcCnx;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__SFAppleIDClient__myAccountWithCompletion___block_invoke;
    v11[3] = &unk_1E5BBCD68;
    id v7 = v4;
    id v12 = v7;
    uint64_t v8 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__SFAppleIDClient__myAccountWithCompletion___block_invoke_2;
    v9[3] = &unk_1E5BBD9C0;
    id v10 = v7;
    [v8 myAccountWithCompletion:v9];
  }
  os_activity_scope_leave(&state);
}

uint64_t __44__SFAppleIDClient__myAccountWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __44__SFAppleIDClient__myAccountWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 code])
  {
    id v7 = v6;
  }
  else if (v5)
  {
    id v7 = 0;
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28760];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    uint64_t v11 = [NSString stringWithUTF8String:DebugGetErrorString()];
    id v12 = (void *)v11;
    uint64_t v13 = @"?";
    if (v11) {
      uint64_t v13 = (__CFString *)v11;
    }
    v16[0] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v7 = [v9 errorWithDomain:v10 code:201202 userInfo:v14];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v7);
  }
}

- (id)myAccountWithError:(id *)a3
{
  uint64_t v21 = 0;
  uint64_t v22 = (id *)&v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__0;
  uint64_t v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__0;
  uint64_t v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  if (!gSDAppleIDAgent)
  {
    [(SFAppleIDClient *)self ensureSyncXPCStarted];
    id v9 = v22;
    id obj = v22[5];
    id v8 = [(SFAppleIDClient *)self syncRemoteProxyWithError:&obj];
    objc_storeStrong(v9 + 5, obj);
    if (v8)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __38__SFAppleIDClient_myAccountWithError___block_invoke;
      v13[3] = &unk_1E5BBD9E8;
      v13[4] = &v21;
      v13[5] = &v15;
      [v8 myAccountWithCompletion:v13];
    }
    goto LABEL_6;
  }
  uint64_t v5 = [(id)gSDAppleIDAgent myAccount];
  id v6 = (void *)v16[5];
  v16[5] = v5;

  if (!v16[5])
  {
    uint64_t v7 = NSErrorF();
    id v8 = v22[5];
    v22[5] = (id)v7;
LABEL_6:
  }
  uint64_t v10 = (void *)v16[5];
  if (a3 && !v10)
  {
    *a3 = v22[5];
    uint64_t v10 = (void *)v16[5];
  }
  id v11 = v10;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);

  return v11;
}

void __38__SFAppleIDClient_myAccountWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if ([v7 code])
  {
    id v8 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v9 = a3;
    goto LABEL_4;
  }
  if (v6)
  {
    id v8 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v9 = a2;
LABEL_4:
    objc_storeStrong(v8, v9);
    goto LABEL_5;
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F28760];
  uint64_t v19 = *MEMORY[0x1E4F28568];
  uint64_t v12 = [NSString stringWithUTF8String:DebugGetErrorString()];
  uint64_t v13 = (void *)v12;
  uint64_t v14 = @"?";
  if (v12) {
    uint64_t v14 = (__CFString *)v12;
  }
  v20[0] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  uint64_t v16 = [v10 errorWithDomain:v11 code:201202 userInfo:v15];
  uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

LABEL_5:
}

- (void)personInfoWithEmailOrPhone:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SFAppleIDClient_personInfoWithEmailOrPhone_completion___block_invoke;
  block[3] = &unk_1E5BBBC30;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __57__SFAppleIDClient_personInfoWithEmailOrPhone_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _personInfoWithEmailOrPhone:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_personInfoWithEmailOrPhone:(id)a3 completion:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A5389000, "Sharing/SFAppleIDClient/personInfoWithEmailOrPhone", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v7)
  {
    if (v6)
    {
      [(SFAppleIDClient *)self _ensureXPCStarted];
      xpcCnx = self->_xpcCnx;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      void v20[2] = __58__SFAppleIDClient__personInfoWithEmailOrPhone_completion___block_invoke;
      v20[3] = &unk_1E5BBCD68;
      id v10 = v7;
      id v21 = v10;
      uint64_t v11 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v20];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __58__SFAppleIDClient__personInfoWithEmailOrPhone_completion___block_invoke_2;
      v18[3] = &unk_1E5BBDA10;
      void v18[4] = self;
      id v19 = v10;
      [v11 personInfoWithEmailOrPhone:v6 completion:v18];

      id v12 = v21;
    }
    else
    {
      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      uint64_t v14 = [NSString stringWithUTF8String:DebugGetErrorString()];
      id v12 = (void *)v14;
      uint64_t v15 = @"?";
      if (v14) {
        uint64_t v15 = (__CFString *)v14;
      }
      v24[0] = v15;
      uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      uint64_t v17 = [v13 errorWithDomain:*MEMORY[0x1E4F28760] code:-6705 userInfo:v16];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v17);
    }
  }
  os_activity_scope_leave(&state);
}

uint64_t __58__SFAppleIDClient__personInfoWithEmailOrPhone_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__SFAppleIDClient__personInfoWithEmailOrPhone_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  if ([v5 code]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v6);
  }
}

- (void)authenticateAccountWithAppleID:(id)a3 password:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__SFAppleIDClient_authenticateAccountWithAppleID_password_completion___block_invoke;
  v15[3] = &unk_1E5BBDA38;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(dispatchQueue, v15);
}

void __70__SFAppleIDClient_authenticateAccountWithAppleID_password_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureAuthXPCStarted];
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__SFAppleIDClient_authenticateAccountWithAppleID_password_completion___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 56);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 authenticateAccountWithAppleID:*(void *)(a1 + 40) password:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t __70__SFAppleIDClient_authenticateAccountWithAppleID_password_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestWithInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A5389000, "Sharing/SFAppleIDClient/requestWithInfo", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SFAppleIDClient_requestWithInfo_completion___block_invoke;
  block[3] = &unk_1E5BBDA60;
  id v13 = v6;
  id v14 = v7;
  block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __46__SFAppleIDClient_requestWithInfo_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__SFAppleIDClient_requestWithInfo_completion___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 48);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 requestWithInfo:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __46__SFAppleIDClient_requestWithInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)statusInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFAppleIDClient/statusInfoWithCompletion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__SFAppleIDClient_statusInfoWithCompletion___block_invoke;
  v8[3] = &unk_1E5BBC8C0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __44__SFAppleIDClient_statusInfoWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__SFAppleIDClient_statusInfoWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 statusInfoWithCompletion:*(void *)(a1 + 40)];
}

uint64_t __44__SFAppleIDClient_statusInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
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
  objc_storeStrong((id *)&self->_xpcAuthCnx, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_syncXPCCnx, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end