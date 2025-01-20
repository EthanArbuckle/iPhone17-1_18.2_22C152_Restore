@interface PCCLIClient
- (OS_dispatch_queue)dispatchQueue;
- (PCCLIClientDelegate)delegate;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidated;
- (void)_wakingXPCEnsureStarted;
- (void)_xpcEnsureStarted;
- (void)activateWithCompletion:(id)a3;
- (void)didProvideState:(id)a3;
- (void)dismissBannerWithCompletion:(id)a3;
- (void)invalidate;
- (void)presentBannerWithCompletion:(id)a3;
- (void)requestState;
- (void)setBannerScaleProgress:(float)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)stateWithCompletion:(id)a3;
- (void)tapBannerWithCompletion:(id)a3;
- (void)triggerHandoffFeedbackAlertWithCompletion:(id)a3;
- (void)updateLockscreenMediaThresholdWithCompletion:(id)a3;
@end

@implementation PCCLIClient

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__PCCLIClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_26443DDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __38__PCCLIClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  [(PCCLIClient *)self _xpcEnsureStarted];
  uint64_t v7 = MEMORY[0x21D4BA1D0](v5);

  id v6 = (void *)v7;
  if (v7)
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    id v6 = (void *)v7;
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__PCCLIClient_invalidate__block_invoke;
  block[3] = &unk_26443DDA0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__PCCLIClient_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  [(NSXPCConnection *)self->_xpcCnx invalidate];
  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0;

  [(PCCLIClient *)self _invalidated];
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = (void (**)(void))MEMORY[0x21D4BA1D0](self->_invalidationHandler);
  if (v3)
  {
    id v4 = v3;
    v3[2]();
    v3 = v4;
  }
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = (void (**)(void))MEMORY[0x21D4BA1D0](self->_interruptionHandler);
  if (v3)
  {
    id v4 = v3;
    v3[2]();
    v3 = v4;
  }
}

- (void)_wakingXPCEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_wakingXPCCnx)
  {
    v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD995A8];
    id v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD99608];
    id v5 = objc_alloc(MEMORY[0x263F08D68]);
    id v6 = (NSXPCConnection *)[v5 initWithMachServiceName:PCXPCLaunchingServiceName options:0];
    wakingXPCCnx = self->_wakingXPCCnx;
    self->_wakingXPCCnx = v6;

    [(NSXPCConnection *)self->_wakingXPCCnx _setQueue:self->_dispatchQueue];
    [(NSXPCConnection *)self->_wakingXPCCnx setExportedInterface:v3];
    [(NSXPCConnection *)self->_wakingXPCCnx setExportedObject:self];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __38__PCCLIClient__wakingXPCEnsureStarted__block_invoke;
    v9[3] = &unk_26443DDA0;
    v9[4] = self;
    [(NSXPCConnection *)self->_wakingXPCCnx setInterruptionHandler:v9];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __38__PCCLIClient__wakingXPCEnsureStarted__block_invoke_2;
    v8[3] = &unk_26443DDA0;
    v8[4] = self;
    [(NSXPCConnection *)self->_wakingXPCCnx setInvalidationHandler:v8];
    [(NSXPCConnection *)self->_wakingXPCCnx setRemoteObjectInterface:v4];
    [(NSXPCConnection *)self->_wakingXPCCnx resume];
  }
}

uint64_t __38__PCCLIClient__wakingXPCEnsureStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __38__PCCLIClient__wakingXPCEnsureStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_xpcEnsureStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD995A8];
    id v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD99608];
    id v5 = objc_alloc(MEMORY[0x263F08D68]);
    id v6 = (NSXPCConnection *)[v5 initWithMachServiceName:PCXPCServiceName options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v6;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v3];
    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __32__PCCLIClient__xpcEnsureStarted__block_invoke;
    v10[3] = &unk_26443DDA0;
    v10[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v10];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __32__PCCLIClient__xpcEnsureStarted__block_invoke_2;
    v9[3] = &unk_26443DDA0;
    v9[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v9];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v4];
    id v8 = [(NSXPCConnection *)self->_xpcCnx _xpcConnection];
    xpc_connection_set_non_launching();

    [(NSXPCConnection *)self->_xpcCnx resume];
  }
}

uint64_t __32__PCCLIClient__xpcEnsureStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __32__PCCLIClient__xpcEnsureStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)dismissBannerWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__PCCLIClient_dismissBannerWithCompletion___block_invoke;
  v7[3] = &unk_26443DDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

void __43__PCCLIClient_dismissBannerWithCompletion___block_invoke(uint64_t a1)
{
  NSLog(&cfstr_Dismissbanner.isa);
  [*(id *)(a1 + 32) _xpcEnsureStarted];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__PCCLIClient_dismissBannerWithCompletion___block_invoke_2;
  v6[3] = &unk_26443DEC0;
  id v7 = *(id *)(a1 + 40);
  v3 = [v2 remoteObjectProxyWithErrorHandler:v6];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__PCCLIClient_dismissBannerWithCompletion___block_invoke_3;
  v4[3] = &unk_26443DEC0;
  id v5 = *(id *)(a1 + 40);
  [v3 dismissBannerWithCompletion:v4];
}

void __43__PCCLIClient_dismissBannerWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  NSLog(&cfstr_Remoteobjectpr.isa, v5);
  uint64_t v3 = MEMORY[0x21D4BA1D0](*(void *)(a1 + 32));
  id v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
}

void __43__PCCLIClient_dismissBannerWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  NSLog(&cfstr_DismissbannerC.isa, v4);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)presentBannerWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__PCCLIClient_presentBannerWithCompletion___block_invoke;
  v7[3] = &unk_26443DDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __43__PCCLIClient_presentBannerWithCompletion___block_invoke(uint64_t a1)
{
  NSLog(&cfstr_Presentbanner.isa);
  [*(id *)(a1 + 32) _xpcEnsureStarted];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__PCCLIClient_presentBannerWithCompletion___block_invoke_2;
  v6[3] = &unk_26443DEC0;
  id v7 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v6];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__PCCLIClient_presentBannerWithCompletion___block_invoke_3;
  v4[3] = &unk_26443DEC0;
  id v5 = *(id *)(a1 + 40);
  [v3 presentBannerWithCompletion:v4];
}

void __43__PCCLIClient_presentBannerWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  NSLog(&cfstr_Remoteobjectpr.isa, v5);
  uint64_t v3 = MEMORY[0x21D4BA1D0](*(void *)(a1 + 32));
  id v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
}

void __43__PCCLIClient_presentBannerWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  NSLog(&cfstr_PresentbannerC.isa, v4);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)setBannerScaleProgress:(float)a3 completion:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__PCCLIClient_setBannerScaleProgress_completion___block_invoke;
  block[3] = &unk_26443DEE8;
  block[4] = self;
  id v10 = v6;
  float v11 = a3;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

void __49__PCCLIClient_setBannerScaleProgress_completion___block_invoke(uint64_t a1)
{
  NSLog(&cfstr_Setbannerscale.isa);
  [*(id *)(a1 + 32) _xpcEnsureStarted];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__PCCLIClient_setBannerScaleProgress_completion___block_invoke_2;
  v8[3] = &unk_26443DEC0;
  id v9 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v8];
  int v4 = *(_DWORD *)(a1 + 48);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__PCCLIClient_setBannerScaleProgress_completion___block_invoke_3;
  v6[3] = &unk_26443DEC0;
  id v7 = *(id *)(a1 + 40);
  LODWORD(v5) = v4;
  [v3 setBannerScaleProgress:v6 completion:v5];
}

void __49__PCCLIClient_setBannerScaleProgress_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  NSLog(&cfstr_Remoteobjectpr.isa, v5);
  uint64_t v3 = MEMORY[0x21D4BA1D0](*(void *)(a1 + 32));
  int v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
}

void __49__PCCLIClient_setBannerScaleProgress_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  NSLog(&cfstr_Setbannerscale_0.isa, v4);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)tapBannerWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__PCCLIClient_tapBannerWithCompletion___block_invoke;
  v7[3] = &unk_26443DDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __39__PCCLIClient_tapBannerWithCompletion___block_invoke(uint64_t a1)
{
  NSLog(&cfstr_Tapbanner.isa);
  [*(id *)(a1 + 32) _xpcEnsureStarted];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__PCCLIClient_tapBannerWithCompletion___block_invoke_2;
  v6[3] = &unk_26443DEC0;
  id v7 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v6];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__PCCLIClient_tapBannerWithCompletion___block_invoke_3;
  v4[3] = &unk_26443DEC0;
  id v5 = *(id *)(a1 + 40);
  [v3 tapBannerWithCompletion:v4];
}

void __39__PCCLIClient_tapBannerWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  NSLog(&cfstr_Remoteobjectpr.isa, v5);
  uint64_t v3 = MEMORY[0x21D4BA1D0](*(void *)(a1 + 32));
  id v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
}

void __39__PCCLIClient_tapBannerWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  NSLog(&cfstr_TapbannerCompl.isa, v4);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)didProvideState:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained client:self didProvideState:v5];
  }
}

- (void)requestState
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__PCCLIClient_requestState__block_invoke;
  block[3] = &unk_26443DDA0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __27__PCCLIClient_requestState__block_invoke(uint64_t a1)
{
  NSLog(&cfstr_Requeststate.isa);
  [*(id *)(a1 + 32) _xpcEnsureStarted];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxy];
  [v2 requestState];
}

- (void)stateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__PCCLIClient_stateWithCompletion___block_invoke;
  v7[3] = &unk_26443DDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __35__PCCLIClient_stateWithCompletion___block_invoke(uint64_t a1)
{
  NSLog(&cfstr_State.isa);
  [*(id *)(a1 + 32) _wakingXPCEnsureStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__PCCLIClient_stateWithCompletion___block_invoke_2;
  v6[3] = &unk_26443DEC0;
  id v7 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v6];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__PCCLIClient_stateWithCompletion___block_invoke_3;
  v4[3] = &unk_26443DF10;
  id v5 = *(id *)(a1 + 40);
  [v3 stateWithCompletion:v4];
}

void __35__PCCLIClient_stateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  NSLog(&cfstr_Remoteobjectpr.isa, v5);
  uint64_t v3 = (void (**)(void, void))MEMORY[0x21D4BA1D0](*(void *)(a1 + 32));
  if (v3)
  {
    id v4 = [v5 localizedDescription];
    ((void (**)(void, void *))v3)[2](v3, v4);
  }
}

void __35__PCCLIClient_stateWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = (void *)MEMORY[0x21D4BA1D0](*(void *)(a1 + 32));
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)triggerHandoffFeedbackAlertWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__PCCLIClient_triggerHandoffFeedbackAlertWithCompletion___block_invoke;
  v7[3] = &unk_26443DDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __57__PCCLIClient_triggerHandoffFeedbackAlertWithCompletion___block_invoke(uint64_t a1)
{
  NSLog(&cfstr_TriggerHandoff.isa);
  [*(id *)(a1 + 32) _wakingXPCEnsureStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__PCCLIClient_triggerHandoffFeedbackAlertWithCompletion___block_invoke_2;
  v4[3] = &unk_26443DEC0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 triggerHandoffFeedbackAlertWithCompletion:*(void *)(a1 + 40)];
}

void __57__PCCLIClient_triggerHandoffFeedbackAlertWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  NSLog(&cfstr_Remoteobjectpr.isa, v5);
  uint64_t v3 = MEMORY[0x21D4BA1D0](*(void *)(a1 + 32));
  id v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v5, 0);
  }
}

- (void)updateLockscreenMediaThresholdWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__PCCLIClient_updateLockscreenMediaThresholdWithCompletion___block_invoke;
  v7[3] = &unk_26443DDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __60__PCCLIClient_updateLockscreenMediaThresholdWithCompletion___block_invoke(uint64_t a1)
{
  NSLog(&cfstr_UpdateLockscre.isa);
  [*(id *)(a1 + 32) _wakingXPCEnsureStarted];
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__PCCLIClient_updateLockscreenMediaThresholdWithCompletion___block_invoke_2;
  v4[3] = &unk_26443DEC0;
  id v5 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 updateLockscreenMediaThresholdWithCompletion:*(void *)(a1 + 40)];
}

void __60__PCCLIClient_updateLockscreenMediaThresholdWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  NSLog(&cfstr_Remoteobjectpr.isa, v5);
  uint64_t v3 = MEMORY[0x21D4BA1D0](*(void *)(a1 + 32));
  id v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
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

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (PCCLIClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PCCLIClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_wakingXPCCnx, 0);
}

@end