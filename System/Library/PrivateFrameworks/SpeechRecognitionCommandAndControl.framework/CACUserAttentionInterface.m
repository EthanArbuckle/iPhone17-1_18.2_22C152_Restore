@interface CACUserAttentionInterface
+ (id)sharedManager;
- (BOOL)isAttentionAwarenessInterrupted;
- (CACUserAttentionController)_userAttentionController;
- (void)_setUserAttentionController:(id)a3;
- (void)cancelDelayedUserAttentionControllerStop;
- (void)setIsAttentionAwarenessInterrupted:(BOOL)a3;
- (void)startUserAttentionControllerIfNeeded;
- (void)startUserAttentionControllerIfNeededForTypes:(unint64_t)a3;
- (void)stopUserAttentionControllerIfNeeded;
- (void)stopUserAttentionControllerIfNeededAfterDelay:(double)a3;
- (void)userAttentionController:(id)a3 didGainAttentionWithEvent:(int64_t)a4;
- (void)userAttentionController:(id)a3 didLoseAttentionWithEvent:(int64_t)a4;
- (void)userAttentionControllerAttentionAwarenessInterrupted:(id)a3;
- (void)userAttentionControllerAttentionAwarenessInterruptionEnded:(id)a3;
@end

@implementation CACUserAttentionInterface

+ (id)sharedManager
{
  if (sharedManager_sSingletonInit != -1) {
    dispatch_once(&sharedManager_sSingletonInit, &__block_literal_global_33);
  }
  v2 = (void *)sharedManager_sSharedCACUserAttentionInterface;
  return v2;
}

uint64_t __42__CACUserAttentionInterface_sharedManager__block_invoke()
{
  sharedManager_sSharedCACUserAttentionInterface = objc_alloc_init(CACUserAttentionInterface);
  return MEMORY[0x270F9A758]();
}

- (void)startUserAttentionControllerIfNeeded
{
}

- (void)startUserAttentionControllerIfNeededForTypes:(unint64_t)a3
{
  v5 = CACLogAttentionAware();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_238377000, v5, OS_LOG_TYPE_INFO, "Starting Attention Aware Client ...", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v6 = (void *)MEMORY[0x263EF83A0];
  id v7 = MEMORY[0x263EF83A0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__CACUserAttentionInterface_startUserAttentionControllerIfNeededForTypes___block_invoke;
  v8[3] = &unk_264D12918;
  objc_copyWeak(v9, buf);
  v9[1] = (id)a3;
  CACGetDeviceSupportsUserAttentionDetection(v6, v8);

  objc_destroyWeak(v9);
  objc_destroyWeak(buf);
}

void __74__CACUserAttentionInterface_startUserAttentionControllerIfNeededForTypes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = [WeakRetained _userAttentionController];

    if (!v8)
    {
      v9 = [[CACUserAttentionController alloc] initWithSamplingInterval:a2 attentionLossTimeout:a3 supportedAttentionAwarenessEvents:2.0 deviceSupportsRaiseGestureDetection:4.0];
      [(CACUserAttentionController *)v9 setDelegate:v7];
      [v7 _setUserAttentionController:v9];
    }
    v10 = [v7 _userAttentionController];
    uint64_t v11 = *(void *)(a1 + 40);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __74__CACUserAttentionInterface_startUserAttentionControllerIfNeededForTypes___block_invoke_2;
    v13[3] = &unk_264D11CD0;
    v14 = v7;
    [v10 startIfNeededForTypes:v11 completionQueue:MEMORY[0x263EF83A0] completion:v13];

    v12 = v14;
  }
  else
  {
    v12 = CACLogAttentionAware();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __74__CACUserAttentionInterface_startUserAttentionControllerIfNeededForTypes___block_invoke_cold_1(v12);
    }
  }
}

void __74__CACUserAttentionInterface_startUserAttentionControllerIfNeededForTypes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = CACLogAttentionAware();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __74__CACUserAttentionInterface_startUserAttentionControllerIfNeededForTypes___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);
    }
  }
}

- (void)stopUserAttentionControllerIfNeeded
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_238377000, log, OS_LOG_TYPE_ERROR, "Failed to stop user attention controller: %{public}@, error: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)stopUserAttentionControllerIfNeededAfterDelay:(double)a3
{
  [(CACUserAttentionInterface *)self cancelDelayedUserAttentionControllerStop];
  [(CACUserAttentionInterface *)self performSelector:sel_stopUserAttentionControllerIfNeeded withObject:0 afterDelay:a3];
}

- (void)cancelDelayedUserAttentionControllerStop
{
  uint64_t v3 = objc_opt_class();
  [v3 cancelPreviousPerformRequestsWithTarget:self selector:sel_stopUserAttentionControllerIfNeeded object:0];
}

- (void)userAttentionController:(id)a3 didLoseAttentionWithEvent:(int64_t)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  __int16 v6 = CACLogAttentionAware();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    int64_t v9 = a4;
    _os_log_impl(&dword_238377000, v6, OS_LOG_TYPE_INFO, "Attention was lost with event=%zd", (uint8_t *)&v8, 0xCu);
  }

  if ([(CACUserAttentionInterface *)self isAttentionAwarenessInterrupted])
  {
    uint64_t v7 = CACLogAttentionAware();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_238377000, v7, OS_LOG_TYPE_INFO, "Attention awareness was interrupted. Ignoring event.", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    if ((unint64_t)(a4 - 1) > 1) {
      return;
    }
    uint64_t v7 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v7 attentionAwareLost];
  }
}

- (void)userAttentionController:(id)a3 didGainAttentionWithEvent:(int64_t)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  __int16 v6 = CACLogAttentionAware();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    int64_t v9 = a4;
    _os_log_impl(&dword_238377000, v6, OS_LOG_TYPE_INFO, "Attention was gained with event=%zd", (uint8_t *)&v8, 0xCu);
  }

  if ([(CACUserAttentionInterface *)self isAttentionAwarenessInterrupted])
  {
    uint64_t v7 = CACLogAttentionAware();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_238377000, v7, OS_LOG_TYPE_INFO, "Attention awareness was interrupted. Ignoring event.", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    if ((unint64_t)(a4 - 1) > 3) {
      return;
    }
    uint64_t v7 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v7 attentionAwareGained];
  }
}

- (void)userAttentionControllerAttentionAwarenessInterrupted:(id)a3
{
  if (![(CACUserAttentionInterface *)self isAttentionAwarenessInterrupted])
  {
    int v4 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v4 attentionAwareInterrupted];
  }
  [(CACUserAttentionInterface *)self setIsAttentionAwarenessInterrupted:1];
}

- (void)userAttentionControllerAttentionAwarenessInterruptionEnded:(id)a3
{
  if ([(CACUserAttentionInterface *)self isAttentionAwarenessInterrupted])
  {
    int v4 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v4 attentionAwareInterruptionEnded];
  }
  [(CACUserAttentionInterface *)self setIsAttentionAwarenessInterrupted:0];
}

- (CACUserAttentionController)_userAttentionController
{
  return self->_userAttentionController;
}

- (void)_setUserAttentionController:(id)a3
{
}

- (BOOL)isAttentionAwarenessInterrupted
{
  return self->_isAttentionAwarenessInterrupted;
}

- (void)setIsAttentionAwarenessInterrupted:(BOOL)a3
{
  self->_isAttentionAwarenessInterrupted = a3;
}

- (void).cxx_destruct
{
}

void __74__CACUserAttentionInterface_startUserAttentionControllerIfNeededForTypes___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_238377000, log, OS_LOG_TYPE_ERROR, "Failed to start user attention controller as CACUserAttentionInterface was released", v1, 2u);
}

void __74__CACUserAttentionInterface_startUserAttentionControllerIfNeededForTypes___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*(id *)(a1 + 32) _userAttentionController];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_238377000, a3, OS_LOG_TYPE_ERROR, "Failed to start user attention controller: %{public}@, error: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end