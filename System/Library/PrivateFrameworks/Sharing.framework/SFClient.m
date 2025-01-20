@interface SFClient
- (OS_dispatch_queue)dispatchQueue;
- (SFClient)init;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)syncRemoteProxyWithError:(id *)a3;
- (id)wristStateMonitorCompletionHandler;
- (void)_ensureXPCStarted;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidated;
- (void)activateAssertionWithIdentifier:(id)a3;
- (void)activityStateWithCompletion:(id)a3;
- (void)appleIDInfoWithCompletion:(id)a3;
- (void)broadwayPresentCardWithCode:(id)a3 options:(id)a4 completion:(id)a5;
- (void)clearXPCHelperImageCacheWithCompletion:(id)a3;
- (void)contactIDForEmailHash:(id)a3 phoneHash:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)displayNameForEmailHash:(id)a3 phoneHash:(id)a4 completion:(id)a5;
- (void)displayStringForContactIdentifier:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5;
- (void)displayStringForContactIdentifierSync:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5;
- (void)ensureSyncXPCStarted;
- (void)findContact:(id)a3 completion:(id)a4;
- (void)findContact:(id)a3 skipIfContactBlocked:(BOOL)a4 completion:(id)a5;
- (void)getDeviceAssets:(id)a3 completion:(id)a4;
- (void)getPairedWatchWristStateWithCompletionHandler:(id)a3;
- (void)getPeopleSuggestions:(id)a3 completion:(id)a4;
- (void)getProblemFlagsWithCompletionHandler:(id)a3;
- (void)hashManagerControl:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)monitorPairedWatchWristStateWithCompletionHandler:(id)a3;
- (void)openSetupURL:(id)a3 completion:(id)a4;
- (void)pairedWatchWristStateChanged:(int64_t)a3;
- (void)preventExitForLocaleReason:(id)a3;
- (void)reenableProxCardType:(unsigned __int8)a3 completion:(id)a4;
- (void)repairDevice:(id)a3 completion:(id)a4;
- (void)repairDevice:(id)a3 flags:(unsigned int)a4 completion:(id)a5;
- (void)retriggerProximityPairing:(id)a3;
- (void)retriggerProximitySetup:(id)a3;
- (void)setAudioRoutingScore:(int)a3 completion:(id)a4;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setWristStateMonitorCompletionHandler:(id)a3;
- (void)setupDevice:(id)a3 home:(id)a4 completion:(id)a5;
- (void)showDevicePickerWithInfo:(id)a3 completion:(id)a4;
- (void)startProxCardTransactionWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)subCredentialPresentCardWithParams:(id)a3 completion:(id)a4;
- (void)testContinuityKeyboardBegin:(BOOL)a3;
- (void)triggerHomeKitDeviceDetectedWithURL:(id)a3 completion:(id)a4;
- (void)triggerProximityAutoFillDetectedWithURL:(id)a3 completion:(id)a4;
- (void)wifiPasswordSharingAvailabilityWithCompletion:(id)a3;
@end

@implementation SFClient

- (SFClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFClient;
  v2 = [(SFClient *)&v7 init];
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
    v6 = (SFClient *)FatalErrorF();
    [(SFClient *)v6 invalidate];
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
    v8.super_class = (Class)SFClient;
    [(SFClient *)&v8 dealloc];
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
    uint64_t v4 = v2->_syncXPCCnx;
    v2->_syncXPCCnx = 0;
  }
  objc_sync_exit(v2);

  dispatchQueue = v2->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__SFClient_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = v2;
  dispatch_async(dispatchQueue, block);
}

uint64_t __22__SFClient_invalidate__block_invoke(uint64_t a1)
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
      && gLogCategory_SFClient <= 30
      && (gLogCategory_SFClient != -1 || _LogCategory_Initialize()))
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
      [(SFClient *)self _invalidated];
    }
    id wristStateMonitorCompletionHandler = self->_wristStateMonitorCompletionHandler;
    self->_id wristStateMonitorCompletionHandler = 0;
  }
}

- (void)activateAssertionWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/activateAssertionWithIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__SFClient_activateAssertionWithIdentifier___block_invoke;
  v8[3] = &unk_1E5BBBD18;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __44__SFClient_activateAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:@"com.apple.sharing.EnhancedDiscovery"])
  {
    if (*(unsigned char *)(*(void *)(a1 + 40) + 16))
    {
      if (gLogCategory_SFClient <= 90 && (gLogCategory_SFClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      return;
    }
    if (gLogCategory_SFClient <= 30 && (gLogCategory_SFClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(a1 + 40) + 16) = 1;
  }
  v2 = *(void **)(*(void *)(a1 + 40) + 8);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v4 = *(void *)(a1 + 40);
    v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    v2 = *(void **)(*(void *)(a1 + 40) + 8);
  }
  [v2 addObject:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) _ensureXPCStarted];
  id v6 = [*(id *)(*(void *)(a1 + 40) + 40) remoteObjectProxy];
  [v6 activateAssertionWithIdentifier:*(void *)(a1 + 32)];
}

- (void)activityStateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/activityStateWithCompletion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__SFClient_activityStateWithCompletion___block_invoke;
  v8[3] = &unk_1E5BBC8C0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __40__SFClient_activityStateWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__SFClient_activityStateWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 activityStateWithCompletion:*(void *)(a1 + 40)];
}

uint64_t __40__SFClient_activityStateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)appleIDInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/appleIDInfoWithCompletion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__SFClient_appleIDInfoWithCompletion___block_invoke;
  v8[3] = &unk_1E5BBC8C0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __38__SFClient_appleIDInfoWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) remoteObjectProxy];
  [v2 appleIDInfoWithCompletion:*(void *)(a1 + 40)];
}

- (void)subCredentialPresentCardWithParams:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/subCredentialPresentCardWithParams", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SFClient_subCredentialPresentCardWithParams_completion___block_invoke;
  block[3] = &unk_1E5BBDA60;
  id v13 = v6;
  id v14 = v7;
  block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __58__SFClient_subCredentialPresentCardWithParams_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__SFClient_subCredentialPresentCardWithParams_completion___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 subCredentialPresentCardWithParams:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __58__SFClient_subCredentialPresentCardWithParams_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearXPCHelperImageCacheWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__SFClient_clearXPCHelperImageCacheWithCompletion___block_invoke;
  v7[3] = &unk_1E5BBC8C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __51__SFClient_clearXPCHelperImageCacheWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__SFClient_clearXPCHelperImageCacheWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 clearXPCHelperImageCacheWithCompletion:*(void *)(a1 + 40)];
}

uint64_t __51__SFClient_clearXPCHelperImageCacheWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)broadwayPresentCardWithCode:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/broadwayPresentCardWithCode", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  dispatchQueue = self->_dispatchQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__SFClient_broadwayPresentCardWithCode_options_completion___block_invoke;
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

void __59__SFClient_broadwayPresentCardWithCode_options_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__SFClient_broadwayPresentCardWithCode_options_completion___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 56);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 broadwayPresentCardWithCode:*(void *)(a1 + 40) options:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t __59__SFClient_broadwayPresentCardWithCode_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)contactIDForEmailHash:(id)a3 phoneHash:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/contactIDForEmailHash", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  dispatchQueue = self->_dispatchQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__SFClient_contactIDForEmailHash_phoneHash_completion___block_invoke;
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

void __55__SFClient_contactIDForEmailHash_phoneHash_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__SFClient_contactIDForEmailHash_phoneHash_completion___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 56);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 contactIDForEmailHash:*(void *)(a1 + 40) phoneHash:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t __55__SFClient_contactIDForEmailHash_phoneHash_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)displayNameForEmailHash:(id)a3 phoneHash:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/displayNameForEmailHash", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  dispatchQueue = self->_dispatchQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__SFClient_displayNameForEmailHash_phoneHash_completion___block_invoke;
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

void __57__SFClient_displayNameForEmailHash_phoneHash_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__SFClient_displayNameForEmailHash_phoneHash_completion___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 56);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 displayNameForEmailHash:*(void *)(a1 + 40) phoneHash:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t __57__SFClient_displayNameForEmailHash_phoneHash_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)displayStringForContactIdentifier:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/displayStringForContactIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  dispatchQueue = self->_dispatchQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__SFClient_displayStringForContactIdentifier_deviceIdentifier_completion___block_invoke;
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

void __74__SFClient_displayStringForContactIdentifier_deviceIdentifier_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__SFClient_displayStringForContactIdentifier_deviceIdentifier_completion___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 56);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 displayStringForContactIdentifier:*(void *)(a1 + 40) deviceIdentifier:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t __74__SFClient_displayStringForContactIdentifier_deviceIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)displayStringForContactIdentifierSync:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/displayStringForContactIdentifierSync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  [(SFClient *)self ensureSyncXPCStarted];
  id v14 = 0;
  v12 = [(SFClient *)self syncRemoteProxyWithError:&v14];
  id v13 = v14;
  if (v12) {
    [v12 displayStringForContactIdentifier:v8 deviceIdentifier:v9 completion:v10];
  }
  else {
    (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v13);
  }

  os_activity_scope_leave(&state);
}

- (void)ensureSyncXPCStarted
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_syncXPCCnx)
  {
    id v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA39440];
    id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v5 = objc_opt_class();
    id v6 = objc_msgSend(v4, "initWithObjects:", v5, objc_opt_class(), 0);
    [v3 setClasses:v6 forSelector:sel_getPeopleSuggestions_completion_ argumentIndex:0 ofReply:1];

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.SharingServices" options:0];
    syncXPCCnx = v2->_syncXPCCnx;
    v2->_syncXPCCnx = (NSXPCConnection *)v7;

    [(NSXPCConnection *)v2->_syncXPCCnx _setQueue:v2->_dispatchQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __32__SFClient_ensureSyncXPCStarted__block_invoke;
    v10[3] = &unk_1E5BBC870;
    v10[4] = v2;
    [(NSXPCConnection *)v2->_syncXPCCnx setInterruptionHandler:v10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __32__SFClient_ensureSyncXPCStarted__block_invoke_2;
    v9[3] = &unk_1E5BBC870;
    v9[4] = v2;
    [(NSXPCConnection *)v2->_syncXPCCnx setInvalidationHandler:v9];
    [(NSXPCConnection *)v2->_syncXPCCnx setRemoteObjectInterface:v3];
    [(NSXPCConnection *)v2->_syncXPCCnx resume];
    if (gLogCategory_SFClient <= 10 && (gLogCategory_SFClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  objc_sync_exit(v2);
}

uint64_t __32__SFClient_ensureSyncXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __32__SFClient_ensureSyncXPCStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)findContact:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/findContact", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SFClient_findContact_completion___block_invoke;
  block[3] = &unk_1E5BBBC30;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __35__SFClient_findContact_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) remoteObjectProxy];
  [v2 findContact:*(void *)(a1 + 40) skipIfContactBlocked:1 completion:*(void *)(a1 + 48)];
}

- (void)findContact:(id)a3 skipIfContactBlocked:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/findContact", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  dispatchQueue = self->_dispatchQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__SFClient_findContact_skipIfContactBlocked_completion___block_invoke;
  v14[3] = &unk_1E5BBF300;
  v14[4] = self;
  id v15 = v8;
  BOOL v17 = a4;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(dispatchQueue, v14);

  os_activity_scope_leave(&state);
}

void __56__SFClient_findContact_skipIfContactBlocked_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) remoteObjectProxy];
  [v2 findContact:*(void *)(a1 + 40) skipIfContactBlocked:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)getDeviceAssets:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SFClient_getDeviceAssets_completion___block_invoke;
  block[3] = &unk_1E5BBBC30;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __39__SFClient_getDeviceAssets_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) remoteObjectProxy];
  [v2 getDeviceAssets:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)getPeopleSuggestions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SFClient_getPeopleSuggestions_completion___block_invoke;
  block[3] = &unk_1E5BBDA60;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __44__SFClient_getPeopleSuggestions_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__SFClient_getPeopleSuggestions_completion___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 getPeopleSuggestions:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __44__SFClient_getPeopleSuggestions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPairedWatchWristStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/getPairedWatchWristStateWithCompletionHandler", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__SFClient_getPairedWatchWristStateWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5BBC8C0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __58__SFClient_getPairedWatchWristStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) remoteObjectProxy];
  [v2 getPairedWatchWristStateWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)monitorPairedWatchWristStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/monitorPairedWatchWristStateWithCompletionHandler", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__SFClient_monitorPairedWatchWristStateWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5BBC8C0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __62__SFClient_monitorPairedWatchWristStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v2;

  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 40) remoteObjectProxy];
  [v5 beginMonitoringPairedWatchWristState];
}

- (void)getProblemFlagsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/getProblemFlagsWithCompletion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__SFClient_getProblemFlagsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5BBC8C0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __49__SFClient_getProblemFlagsWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__SFClient_getProblemFlagsWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 getProblemFlagsWithCompletionHandler:*(void *)(a1 + 40)];
}

uint64_t __49__SFClient_getProblemFlagsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)hashManagerControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/hashManagerControl", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SFClient_hashManagerControl_completion___block_invoke;
  block[3] = &unk_1E5BBDA60;
  id v13 = v6;
  id v14 = v7;
  block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __42__SFClient_hashManagerControl_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__SFClient_hashManagerControl_completion___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 48);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 hashManagerControl:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __42__SFClient_hashManagerControl_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)openSetupURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/openSetupURL", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__SFClient_openSetupURL_completion___block_invoke;
  block[3] = &unk_1E5BBBC30;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __36__SFClient_openSetupURL_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) remoteObjectProxy];
  [v2 openSetupURL:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)preventExitForLocaleReason:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/preventExitForLocaleReason", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__SFClient_preventExitForLocaleReason___block_invoke;
  v8[3] = &unk_1E5BBBD18;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __39__SFClient_preventExitForLocaleReason___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) remoteObjectProxy];
  [v2 preventExitForLocaleReason:*(void *)(a1 + 40)];
}

- (void)reenableProxCardType:(unsigned __int8)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/reenableProxCardType", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SFClient_reenableProxCardType_completion___block_invoke;
  block[3] = &unk_1E5BBD078;
  block[4] = self;
  id v11 = v6;
  unsigned __int8 v12 = a3;
  id v9 = v6;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __44__SFClient_reenableProxCardType_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__SFClient_reenableProxCardType_completion___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 reenableProxCardType:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

uint64_t __44__SFClient_reenableProxCardType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)repairDevice:(id)a3 completion:(id)a4
{
}

- (void)repairDevice:(id)a3 flags:(unsigned int)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/repairDevice", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  dispatchQueue = self->_dispatchQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __42__SFClient_repairDevice_flags_completion___block_invoke;
  v14[3] = &unk_1E5BBFC20;
  unsigned int v18 = a4;
  id v15 = v8;
  id v16 = self;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(dispatchQueue, v14);

  os_activity_scope_leave(&state);
}

void __42__SFClient_repairDevice_flags_completion___block_invoke(uint64_t a1)
{
  if (gLogCategory_SFClient <= 30 && (gLogCategory_SFClient != -1 || _LogCategory_Initialize()))
  {
    id v5 = &unk_1A56EA785;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v4 = *(unsigned int *)(a1 + 56);
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted", v4, v5, v6);
  id v2 = *(void **)(*(void *)(a1 + 40) + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SFClient_repairDevice_flags_completion___block_invoke_2;
  v7[3] = &unk_1E5BBCD68;
  id v8 = *(id *)(a1 + 48);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  [v3 repairDevice:*(void *)(a1 + 32) flags:*(unsigned int *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

uint64_t __42__SFClient_repairDevice_flags_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retriggerProximityPairing:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/retriggerProximityPairing", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__SFClient_retriggerProximityPairing___block_invoke;
  v8[3] = &unk_1E5BBC8C0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __38__SFClient_retriggerProximityPairing___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__SFClient_retriggerProximityPairing___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 retriggerProximityPairing:*(void *)(a1 + 40)];
}

uint64_t __38__SFClient_retriggerProximityPairing___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retriggerProximitySetup:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/retriggerProximitySetup", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__SFClient_retriggerProximitySetup___block_invoke;
  v8[3] = &unk_1E5BBC8C0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __36__SFClient_retriggerProximitySetup___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__SFClient_retriggerProximitySetup___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 retriggerProximitySetup:*(void *)(a1 + 40)];
}

uint64_t __36__SFClient_retriggerProximitySetup___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setAudioRoutingScore:(int)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/setAudioRoutingScore", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SFClient_setAudioRoutingScore_completion___block_invoke;
  block[3] = &unk_1E5BBFC48;
  block[4] = self;
  id v11 = v6;
  int v12 = a3;
  id v9 = v6;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __44__SFClient_setAudioRoutingScore_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__SFClient_setAudioRoutingScore_completion___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 setAudioRoutingScore:*(unsigned int *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

uint64_t __44__SFClient_setAudioRoutingScore_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setupDevice:(id)a3 home:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/setupDevice", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  dispatchQueue = self->_dispatchQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __40__SFClient_setupDevice_home_completion___block_invoke;
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

void __40__SFClient_setupDevice_home_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__SFClient_setupDevice_home_completion___block_invoke_2;
  v6[3] = &unk_1E5BBCD68;
  id v7 = *(id *)(a1 + 56);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v6];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) uniqueIdentifier];
  [v3 setupDevice:v4 homeIdentifier:v5 completion:*(void *)(a1 + 56)];
}

uint64_t __40__SFClient_setupDevice_home_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showDevicePickerWithInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/showDevicePickerWithInfo", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SFClient_showDevicePickerWithInfo_completion___block_invoke;
  block[3] = &unk_1E5BBDA60;
  id v13 = v6;
  id v14 = v7;
  block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __48__SFClient_showDevicePickerWithInfo_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__SFClient_showDevicePickerWithInfo_completion___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 48);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 showDevicePickerWithInfo:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __48__SFClient_showDevicePickerWithInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)syncRemoteProxyWithError:(id *)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy__8;
  id v13 = __Block_byref_object_dispose__8;
  id v14 = 0;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  syncXPCCnx = v4->_syncXPCCnx;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__SFClient_syncRemoteProxyWithError___block_invoke;
  v8[3] = &unk_1E5BBD998;
  void v8[4] = &v9;
  id v6 = [(NSXPCConnection *)syncXPCCnx synchronousRemoteObjectProxyWithErrorHandler:v8];
  objc_sync_exit(v4);

  if (a3 && !v6) {
    *a3 = (id) v10[5];
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __37__SFClient_syncRemoteProxyWithError___block_invoke(uint64_t a1, void *a2)
{
}

- (void)testContinuityKeyboardBegin:(BOOL)a3
{
  id v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/testContinuityKeyboardBegin", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__SFClient_testContinuityKeyboardBegin___block_invoke;
  v7[3] = &unk_1E5BBCD90;
  void v7[4] = self;
  BOOL v8 = a3;
  dispatch_async(dispatchQueue, v7);
  os_activity_scope_leave(&state);
}

void __40__SFClient_testContinuityKeyboardBegin___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) remoteObjectProxy];
  [v2 testContinuityKeyboardBegin:*(unsigned __int8 *)(a1 + 40)];
}

- (void)triggerHomeKitDeviceDetectedWithURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/triggerHomeKitDeviceDetectedWithURL", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SFClient_triggerHomeKitDeviceDetectedWithURL_completion___block_invoke;
  block[3] = &unk_1E5BBDA60;
  id v13 = v6;
  id v14 = v7;
  block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __59__SFClient_triggerHomeKitDeviceDetectedWithURL_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__SFClient_triggerHomeKitDeviceDetectedWithURL_completion___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 48);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 triggerHomeKitDeviceDetectedWithURL:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __59__SFClient_triggerHomeKitDeviceDetectedWithURL_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)triggerProximityAutoFillDetectedWithURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/triggerProximityAutoFillDetectedWithURL", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SFClient_triggerProximityAutoFillDetectedWithURL_completion___block_invoke;
  block[3] = &unk_1E5BBDA60;
  id v13 = v6;
  id v14 = v7;
  block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __63__SFClient_triggerProximityAutoFillDetectedWithURL_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__SFClient_triggerProximityAutoFillDetectedWithURL_completion___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 48);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 triggerProximityAutoFillDetectedWithURL:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __63__SFClient_triggerProximityAutoFillDetectedWithURL_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)wifiPasswordSharingAvailabilityWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/wifiPasswordSharingAvailabilityWithCompletion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__SFClient_wifiPasswordSharingAvailabilityWithCompletion___block_invoke;
  v8[3] = &unk_1E5BBC8C0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __58__SFClient_wifiPasswordSharingAvailabilityWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__SFClient_wifiPasswordSharingAvailabilityWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 wifiPasswordSharingAvailabilityWithCompletion:*(void *)(a1 + 40)];
}

uint64_t __58__SFClient_wifiPasswordSharingAvailabilityWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startProxCardTransactionWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = _os_activity_create(&dword_1A5389000, "Sharing/SFClient/startProxCardTransactionWithOptions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  if (gLogCategory_SFClient <= 40 && (gLogCategory_SFClient != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SFClient_startProxCardTransactionWithOptions_completion___block_invoke;
  block[3] = &unk_1E5BBEB70;
  block[4] = self;
  id v11 = v6;
  unint64_t v12 = a3;
  id v9 = v6;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __59__SFClient_startProxCardTransactionWithOptions_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureXPCStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__SFClient_startProxCardTransactionWithOptions_completion___block_invoke_2;
  v4[3] = &unk_1E5BBCD68;
  id v5 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 startProxCardTransactionWithOptions:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

uint64_t __59__SFClient_startProxCardTransactionWithOptions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)pairedWatchWristStateChanged:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__SFClient_pairedWatchWristStateChanged___block_invoke;
  v4[3] = &unk_1E5BBC910;
  void v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

void __41__SFClient_pairedWatchWristStateChanged___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) wristStateMonitorCompletionHandler];

  if (v2)
  {
    if (gLogCategory_SFClient <= 40 && (gLogCategory_SFClient != -1 || _LogCategory_Initialize()))
    {
      unint64_t v3 = *(void *)(a1 + 40);
      if (v3 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Undefined state (%ld)", *(void *)(a1 + 40));
        id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v4 = off_1E5BBFC68[v3];
      }
      id v5 = v4;
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "wristStateMonitorCompletionHandler", v5);
    id v6 = (void (**)(id, void))objc_claimAutoreleasedReturnValue();
    v6[2](v6, *(void *)(a1 + 40));
  }
}

- (void)_ensureXPCStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    unint64_t v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA39440];
    id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v5 = objc_opt_class();
    id v6 = objc_msgSend(v4, "initWithObjects:", v5, objc_opt_class(), 0);
    [v3 setClasses:v6 forSelector:sel_getPeopleSuggestions_completion_ argumentIndex:0 ofReply:1];

    id v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA125E0];
    BOOL v8 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.SharingServices" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v8;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __29__SFClient__ensureXPCStarted__block_invoke;
    v11[3] = &unk_1E5BBC870;
    v11[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v11];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __29__SFClient__ensureXPCStarted__block_invoke_2;
    v10[3] = &unk_1E5BBC870;
    v10[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v10];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v3];
    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v7];
    [(NSXPCConnection *)self->_xpcCnx resume];
    if (gLogCategory_SFClient <= 10 && (gLogCategory_SFClient != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

uint64_t __29__SFClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __29__SFClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_interrupted
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFClient <= 50 && (gLogCategory_SFClient != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ([(NSMutableSet *)self->_assertions count])
  {
    [(SFClient *)self _ensureXPCStarted];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    unint64_t v3 = self->_assertions;
    uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if (gLogCategory_SFClient <= 50 && (gLogCategory_SFClient != -1 || _LogCategory_Initialize()))
          {
            uint64_t v11 = v8;
            LogPrintF();
          }
          id v9 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
          [v9 activateAssertionWithIdentifier:v8];
        }
        uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
  }
  id interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler) {
    interruptionHandler[2]();
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SFClient <= 50
      && (gLogCategory_SFClient != -1 || _LogCategory_Initialize()))
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
    if (gLogCategory_SFClient <= 10 && (gLogCategory_SFClient != -1 || _LogCategory_Initialize()))
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

- (id)wristStateMonitorCompletionHandler
{
  return self->_wristStateMonitorCompletionHandler;
}

- (void)setWristStateMonitorCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_wristStateMonitorCompletionHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_syncXPCCnx, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_assertions, 0);
}

@end