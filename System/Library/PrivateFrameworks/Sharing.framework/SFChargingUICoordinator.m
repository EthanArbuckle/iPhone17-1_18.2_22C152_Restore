@interface SFChargingUICoordinator
- (BOOL)shouldEscapeXpcTryCatch;
- (id)exportedInterface;
- (id)machServiceName;
- (id)remoteObjectInterface;
- (int64_t)defaultDuration;
- (void)_activate;
- (void)_dismissUI;
- (void)_initialViewControllerDidAppear;
- (void)_initialViewControllerDidDisappear;
- (void)_invalidate;
- (void)_requestToDismissUIHandler:(id)a3;
- (void)_requestToStartAnimationAtDate:(id)a3;
- (void)_sendDismissUIWithReason:(int64_t)a3;
- (void)_timingInvalidateMinTimer;
- (void)_timingRestartMinTimer;
- (void)activate;
- (void)initialViewControllerDidAppear;
- (void)initialViewControllerDidDisappear;
- (void)invalidate;
- (void)onqueue_connectionEstablished;
- (void)onqueue_connectionInterrupted;
- (void)onqueue_connectionInvalidated;
- (void)requestAnimationDateWithCompletion:(id)a3;
- (void)requestToDismissUIHandler:(id)a3;
- (void)requestToShowUIWithHandler:(id)a3;
- (void)requestToStartAnimationAtDate:(id)a3;
- (void)sendDismissUIWithReason:(int64_t)a3;
- (void)setDefaultDuration:(int64_t)a3;
@end

@implementation SFChargingUICoordinator

- (void)activate
{
  v3 = [(SFXPCClient *)self dispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SFChargingUICoordinator_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __35__SFChargingUICoordinator_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  v3 = [(SFXPCClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  v4 = charging_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A5389000, v4, OS_LOG_TYPE_DEFAULT, "Activate", buf, 2u);
  }

  if (self->_activateCalled)
  {
    v6 = charging_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Coordinator already activated";
LABEL_14:
      _os_log_impl(&dword_1A5389000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }
LABEL_15:

    return;
  }
  if (self->_invalidateCalled)
  {
    v6 = charging_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Coordinator activated after invalidate";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  self->_activateCalled = 1;
  if (IsAppleInternalBuild())
  {
    v5 = (void *)CFPreferencesCopyAppValue(@"ExperimentGroup", @"com.apple.da");
    self->_runningAsCarry = [v5 isEqual:@"walkabout"];
  }
  else
  {
    self->_runningAsCarry = 1;
  }
  v8.receiver = self;
  v8.super_class = (Class)SFChargingUICoordinator;
  [(SFXPCClient *)&v8 onqueue_activate];
}

- (void)invalidate
{
  v3 = [(SFXPCClient *)self dispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SFChargingUICoordinator_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __37__SFChargingUICoordinator_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  v3 = [(SFXPCClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  v4 = charging_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A5389000, v4, OS_LOG_TYPE_DEFAULT, "Invalidate", buf, 2u);
  }

  if (self->_invalidateCalled)
  {
    v5 = charging_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Coordinator already invalidated";
LABEL_11:
      _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    }
LABEL_12:

    return;
  }
  if (!self->_activateCalled)
  {
    v5 = charging_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Coordinator invalidated before activate";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  self->_invalidateCalled = 1;
  v7.receiver = self;
  v7.super_class = (Class)SFChargingUICoordinator;
  [(SFXPCClient *)&v7 onqueue_invalidate];
}

- (void)requestToShowUIWithHandler:(id)a3
{
  id v4 = a3;
  v5 = charging_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SFChargingUICoordinator requestToShowUIWithHandler:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  v13 = [(SFXPCClient *)self dispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SFChargingUICoordinator_requestToShowUIWithHandler___block_invoke;
  block[3] = &unk_1E5BBC658;
  id v16 = v4;
  id v14 = v4;
  dispatch_async(v13, block);
}

uint64_t __54__SFChargingUICoordinator_requestToShowUIWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestToStartAnimationAtDate:(id)a3
{
  id v4 = a3;
  v5 = [(SFXPCClient *)self dispatchQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SFChargingUICoordinator_requestToStartAnimationAtDate___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __57__SFChargingUICoordinator_requestToStartAnimationAtDate___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 34) = 1;
  return [*(id *)(a1 + 32) _requestToStartAnimationAtDate:*(void *)(a1 + 40)];
}

- (void)_requestToStartAnimationAtDate:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = charging_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "Client requesting to start animation at %@", buf, 0xCu);
  }

  id v6 = [(SFXPCClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v6);

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__SFChargingUICoordinator__requestToStartAnimationAtDate___block_invoke;
  v8[3] = &unk_1E5BBC898;
  id v9 = v4;
  id v7 = v4;
  [(SFXPCClient *)self onqueue_getRemoteObjectProxyOnQueue:v8];
}

uint64_t __58__SFChargingUICoordinator__requestToStartAnimationAtDate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sendAnimationDate:*(void *)(a1 + 32)];
}

- (void)requestToDismissUIHandler:(id)a3
{
  id v4 = a3;
  v5 = [(SFXPCClient *)self dispatchQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SFChargingUICoordinator_requestToDismissUIHandler___block_invoke;
  v7[3] = &unk_1E5BBC8C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __53__SFChargingUICoordinator_requestToDismissUIHandler___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 34))
  {
    v2 = charging_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __53__SFChargingUICoordinator_requestToDismissUIHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }

    uint64_t v10 = *(void **)(a1 + 32);
    id v11 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v12 = [v11 dateByAddingTimeInterval:1.2];
    [v10 _requestToStartAnimationAtDate:v12];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_requestToDismissUIHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFXPCClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  if (self->_uiUpdateHandler)
  {
    uint64_t v8 = charging_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SFChargingUICoordinator _requestToDismissUIHandler:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    uint64_t v6 = _Block_copy(v4);
    id uiUpdateHandler = self->_uiUpdateHandler;
    self->_id uiUpdateHandler = v6;

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__SFChargingUICoordinator__requestToDismissUIHandler___block_invoke;
    v16[3] = &unk_1E5BBC898;
    v16[4] = self;
    [(SFXPCClient *)self onqueue_getRemoteObjectProxyOnQueue:v16];
    [(SFChargingUICoordinator *)self _timingRestartMinTimer];
  }
}

uint64_t __54__SFChargingUICoordinator__requestToDismissUIHandler___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__SFChargingUICoordinator__requestToDismissUIHandler___block_invoke_2;
  v3[3] = &unk_1E5BBC8E8;
  v3[4] = *(void *)(a1 + 32);
  return [a2 triggerChargingUIWithDismissHandler:v3];
}

void __54__SFChargingUICoordinator__requestToDismissUIHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = charging_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1A5389000, v4, OS_LOG_TYPE_DEFAULT, "Ready to dismiss UI (error: %@)", (uint8_t *)&v5, 0xCu);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 65) = 1;
  [*(id *)(a1 + 32) _dismissUI];
}

- (void)sendDismissUIWithReason:(int64_t)a3
{
  int v5 = [(SFXPCClient *)self dispatchQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SFChargingUICoordinator_sendDismissUIWithReason___block_invoke;
  v6[3] = &unk_1E5BBC910;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __51__SFChargingUICoordinator_sendDismissUIWithReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDismissUIWithReason:*(void *)(a1 + 40)];
}

- (void)_sendDismissUIWithReason:(int64_t)a3
{
  int v5 = charging_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "Sending dismiss UI", buf, 2u);
  }

  id v6 = [(SFXPCClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v6);

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SFChargingUICoordinator__sendDismissUIWithReason___block_invoke;
  v7[3] = &__block_descriptor_40_e8_v16__0_8l;
  v7[4] = a3;
  [(SFXPCClient *)self onqueue_getRemoteObjectProxyOnQueue:v7];
}

uint64_t __52__SFChargingUICoordinator__sendDismissUIWithReason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sendDismissUIWithReason:*(void *)(a1 + 32)];
}

- (void)_dismissUI
{
  id v3 = [(SFXPCClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  if (self->_uiUpdateHandler && self->_uiUpdateMinTimeElapsed && self->_uiUpdateShouldDismiss)
  {
    id v4 = charging_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1A5389000, v4, OS_LOG_TYPE_DEFAULT, "Asking client to dismiss UI", v6, 2u);
    }

    self->_uiUpdateMinTimeElapsed = 0;
    self->_uiUpdateShouldDismiss = 0;
    (*((void (**)(void))self->_uiUpdateHandler + 2))();
    id uiUpdateHandler = self->_uiUpdateHandler;
    self->_id uiUpdateHandler = 0;

    [(SFChargingUICoordinator *)self _timingInvalidateMinTimer];
  }
}

- (void)initialViewControllerDidAppear
{
  id v3 = [(SFXPCClient *)self dispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SFChargingUICoordinator_initialViewControllerDidAppear__block_invoke;
  block[3] = &unk_1E5BBC870;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __57__SFChargingUICoordinator_initialViewControllerDidAppear__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initialViewControllerDidAppear];
}

- (void)_initialViewControllerDidAppear
{
  id v3 = charging_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Sending initial view controller did appear", v5, 2u);
  }

  id v4 = [(SFXPCClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v4);

  [(SFXPCClient *)self onqueue_getRemoteObjectProxyOnQueue:&__block_literal_global_5];
}

uint64_t __58__SFChargingUICoordinator__initialViewControllerDidAppear__block_invoke(uint64_t a1, void *a2)
{
  return [a2 initialViewControllerDidAppear];
}

- (void)initialViewControllerDidDisappear
{
  id v3 = [(SFXPCClient *)self dispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SFChargingUICoordinator_initialViewControllerDidDisappear__block_invoke;
  block[3] = &unk_1E5BBC870;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __60__SFChargingUICoordinator_initialViewControllerDidDisappear__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initialViewControllerDidDisappear];
}

- (void)_initialViewControllerDidDisappear
{
  id v3 = charging_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Sending initial view controller did disappear", v5, 2u);
  }

  id v4 = [(SFXPCClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v4);

  [(SFXPCClient *)self onqueue_getRemoteObjectProxyOnQueue:&__block_literal_global_133];
}

uint64_t __61__SFChargingUICoordinator__initialViewControllerDidDisappear__block_invoke(uint64_t a1, void *a2)
{
  return [a2 initialViewControllerDidDisappear];
}

- (void)requestAnimationDateWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = charging_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "Client requesting animation date", buf, 2u);
  }

  id v6 = [(SFXPCClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v6);

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__SFChargingUICoordinator_requestAnimationDateWithCompletion___block_invoke;
  v8[3] = &unk_1E5BBC978;
  id v9 = v4;
  id v7 = v4;
  [(SFXPCClient *)self onqueue_getRemoteObjectProxyOnQueue:v8];
}

uint64_t __62__SFChargingUICoordinator_requestAnimationDateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 requestAnimationDateWithCompletion:*(void *)(a1 + 32)];
}

- (void)_timingRestartMinTimer
{
  id v3 = charging_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A5389000, v3, OS_LOG_TYPE_DEFAULT, "Restarting UI minimum timer", buf, 2u);
  }

  id v4 = [(SFXPCClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v4);

  if (!self->_uiUpdateTimer)
  {
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    int v5 = [(SFXPCClient *)self dispatchQueue];
    id v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v5);
    uiUpdateTimer = self->_uiUpdateTimer;
    self->_uiUpdateTimer = v6;

    uint64_t v8 = self->_uiUpdateTimer;
    dispatch_time_t v9 = dispatch_time(0, 2147483647000000000);
    dispatch_source_set_timer(v8, v9, 0x1DCD64FFC4653600uLL, 0);
    uint64_t v10 = self->_uiUpdateTimer;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__SFChargingUICoordinator__timingRestartMinTimer__block_invoke;
    v12[3] = &unk_1E5BBC5B8;
    v12[4] = self;
    objc_copyWeak(&v13, (id *)buf);
    dispatch_source_set_event_handler(v10, v12);
    dispatch_resume((dispatch_object_t)self->_uiUpdateTimer);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  dispatch_time_t v11 = dispatch_time(0, 1500000000);
  dispatch_source_set_timer((dispatch_source_t)self->_uiUpdateTimer, v11, 0x1DCD64FFC4653600uLL, 0);
}

void __49__SFChargingUICoordinator__timingRestartMinTimer__block_invoke(uint64_t a1)
{
  v2 = charging_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A5389000, v2, OS_LOG_TYPE_DEFAULT, "Minimum timer complete", v4, 2u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _dismissUI];
}

- (void)_timingInvalidateMinTimer
{
  id v3 = [(SFXPCClient *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  uiUpdateTimer = self->_uiUpdateTimer;
  if (uiUpdateTimer)
  {
    dispatch_source_cancel(uiUpdateTimer);
    int v5 = self->_uiUpdateTimer;
    self->_uiUpdateTimer = 0;
  }
}

- (id)machServiceName
{
  return @"com.apple.sharingd.paireddevice";
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA38EA0];
}

- (id)remoteObjectInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA38F00];
}

- (BOOL)shouldEscapeXpcTryCatch
{
  return 1;
}

- (void)onqueue_connectionEstablished
{
  v2 = charging_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1A5389000, v2, OS_LOG_TYPE_DEFAULT, "Charging UI coordinator connection established", v3, 2u);
  }
}

- (void)onqueue_connectionInterrupted
{
  v2 = charging_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1A5389000, v2, OS_LOG_TYPE_DEFAULT, "Charging UI coordinator connection interrupted", v3, 2u);
  }
}

- (void)onqueue_connectionInvalidated
{
  v2 = charging_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1A5389000, v2, OS_LOG_TYPE_DEFAULT, "Charging UI coordinator connection invalidated", v3, 2u);
  }
}

- (int64_t)defaultDuration
{
  return self->_defaultDuration;
}

- (void)setDefaultDuration:(int64_t)a3
{
  self->_defaultDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiUpdateTimer, 0);
  objc_storeStrong(&self->_uiUpdateHandler, 0);
  objc_storeStrong((id *)&self->_uiUpdateRequestDate, 0);

  objc_storeStrong((id *)&self->_uiUpdateMaxDate, 0);
}

- (void)requestToShowUIWithHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __53__SFChargingUICoordinator_requestToDismissUIHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_requestToDismissUIHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end