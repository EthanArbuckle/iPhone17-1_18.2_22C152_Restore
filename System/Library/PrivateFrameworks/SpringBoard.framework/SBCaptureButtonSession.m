@interface SBCaptureButtonSession
- (BOOL)isActive;
- (SBCaptureButtonSession)initWithInteraction:(id)a3 delegate:(id)a4 appInteractionEventSource:(id)a5 displayLayoutPublisher:(id)a6;
- (void)_handleNotification:(id)a3;
- (void)_sealIntentionalLaunch;
- (void)_sealIntentionalMitigation;
- (void)_sealLowConfidenceIntentionalLaunch;
- (void)_sealUnintentionalLaunch;
- (void)_sealWithReason:(id)a3 block:(id)a4;
- (void)_startCaptureInteractionTimer;
- (void)_startCountdown;
- (void)coalesceInteraction:(id)a3;
- (void)dealloc;
- (void)eventSource:(id)a3 userTouchedApplication:(id)a4;
- (void)invalidate;
- (void)logInteractionIntentions;
- (void)logToCoreAnalytics;
- (void)monitor:(id)a3 didUpdateLayout:(id)a4 withTransition:(id)a5;
@end

@implementation SBCaptureButtonSession

- (SBCaptureButtonSession)initWithInteraction:(id)a3 delegate:(id)a4 appInteractionEventSource:(id)a5 displayLayoutPublisher:(id)a6
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v38.receiver = self;
  v38.super_class = (Class)SBCaptureButtonSession;
  v14 = [(SBCaptureButtonSession *)&v38 init];
  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v39[0] = v10;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
    uint64_t v17 = [v15 initWithArray:v16];
    interactions = v14->_interactions;
    v14->_interactions = (NSMutableArray *)v17;

    v19 = [v10 context];
    uint64_t v20 = [v19 captureAppBundleID];
    captureAppBundleID = v14->_captureAppBundleID;
    v14->_captureAppBundleID = (NSString *)v20;

    objc_storeWeak((id *)&v14->_delegate, v11);
    v14->_sealed = 0;
    v14->_inCaptureApp = 0;
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"com.apple.SpringBoard.CaptureButton.SessionTimer"];
    timer = v14->_timer;
    v14->_timer = (BSAbsoluteMachTimer *)v22;

    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"com.apple.SpringBoard.CaptureButton.CaptureAppInteractionTimer"];
    captureAppInteractionTimer = v14->_captureAppInteractionTimer;
    v14->_captureAppInteractionTimer = (BSAbsoluteMachTimer *)v24;

    v26 = [MEMORY[0x1E4F62958] configurationForDefaultMainDisplayMonitor];
    objc_initWeak(&location, v14);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __104__SBCaptureButtonSession_initWithInteraction_delegate_appInteractionEventSource_displayLayoutPublisher___block_invoke;
    v35[3] = &unk_1E6AF9A38;
    objc_copyWeak(&v36, &location);
    [v26 setTransitionHandler:v35];
    uint64_t v27 = [MEMORY[0x1E4F62940] monitorWithConfiguration:v26];
    displayLayoutMonitor = v14->_displayLayoutMonitor;
    v14->_displayLayoutMonitor = (FBSDisplayLayoutMonitor *)v27;

    objc_storeWeak((id *)&v14->_displayLayoutPublisher, v13);
    objc_storeWeak((id *)&v14->_displayAppInteractionEventSource, v12);
    [v12 addObserver:v14];
    v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v29 addObserver:v14 selector:sel__handleNotification_ name:@"SBVolumeHardwareButtonIncreaseNotification" object:0];

    v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v30 addObserver:v14 selector:sel__handleNotification_ name:@"SBVolumeHardwareButtonDecreaseNotification" object:0];

    v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v31 addObserver:v14 selector:sel__handleNotification_ name:@"SBCaptureHardwareButtonPressNotification" object:0];

    v32 = SBLogCameraCaptureSessionLogs();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_1D85BA000, v32, OS_LOG_TYPE_DEFAULT, "New capture button interaction session created.", v34, 2u);
    }

    [(SBCaptureButtonSession *)v14 _startCountdown];
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  return v14;
}

void __104__SBCaptureButtonSession_initWithInteraction_delegate_appInteractionEventSource_displayLayoutPublisher___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained monitor:v9 didUpdateLayout:v8 withTransition:v7];
}

- (void)dealloc
{
  [(SBCaptureButtonSession *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBCaptureButtonSession;
  [(SBCaptureButtonSession *)&v3 dealloc];
}

- (void)invalidate
{
  [(BSAbsoluteMachTimer *)self->_timer invalidate];
  [(BSAbsoluteMachTimer *)self->_captureAppInteractionTimer invalidate];
  [(FBSDisplayLayoutMonitor *)self->_displayLayoutMonitor invalidate];
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"SBVolumeHardwareButtonIncreaseNotification" object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"SBVolumeHardwareButtonDecreaseNotification" object:0];

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"SBCaptureHardwareButtonPressNotification" object:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayAppInteractionEventSource);
  [WeakRetained removeObserver:self];
}

- (void)coalesceInteraction:(id)a3
{
  id v5 = a3;
  if ([(SBCaptureButtonSession *)self isActive])
  {
    v6 = SBLogCameraCaptureSessionLogs();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Coalescing interaction.", v8, 2u);
    }

    [(SBCaptureButtonSession *)self _startCountdown];
    [(NSMutableArray *)self->_interactions addObject:v5];
  }
  else
  {
    id v7 = [NSString stringWithFormat:@"Sent coalesce message to a session that is NOT active."];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(SBCaptureButtonSession *)a2 coalesceInteraction:(uint64_t)v7];
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (BOOL)isActive
{
  return !self->_sealed;
}

- (void)logToCoreAnalytics
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_interactions;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v6++) logToCoreAnalytics];
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  id v7 = SBLogCameraCaptureSessionLogs();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Session logged to CoreAnalytics.", v8, 2u);
  }
}

- (void)logInteractionIntentions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = self->_interactions;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v8 = SBLogCameraCaptureStudyLogs();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          long long v9 = [v7 context];
          uint64_t v10 = [v9 machAbsoluteTimestamp];
          uint64_t v11 = [v7 intention];
          *(_DWORD *)buf = 134218240;
          uint64_t v18 = v10;
          __int16 v19 = 2048;
          uint64_t v20 = v11;
          _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "{\"machAbsoluteTimestamp\": %llu, \"intention\": %lu}", buf, 0x16u);
        }
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v4);
  }

  long long v12 = SBLogCameraCaptureSessionLogs();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Logged interaction intentions to the serial output.", buf, 2u);
  }
}

- (void)monitor:(id)a3 didUpdateLayout:(id)a4 withTransition:(id)a5
{
  uint64_t v6 = objc_msgSend(a4, "elements", a3);
  id v7 = [v6 lastObject];
  id v8 = [v7 bundleIdentifier];
  int v9 = [v8 isEqualToString:self->_captureAppBundleID];

  if (self->_inCaptureApp || !v9)
  {
    if (self->_inCaptureApp) {
      char v11 = v9;
    }
    else {
      char v11 = 1;
    }
    if ((v11 & 1) == 0)
    {
      self->_inCaptureApp = 0;
      long long v12 = SBLogCameraCaptureSessionLogs();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v13 = 0;
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Closed capture app.", v13, 2u);
      }

      [(SBCaptureButtonSession *)self _sealUnintentionalLaunch];
    }
  }
  else
  {
    self->_inCaptureApp = 1;
    [(SBCaptureButtonSession *)self _startCaptureInteractionTimer];
    uint64_t v10 = SBLogCameraCaptureSessionLogs();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Launched capture app.", buf, 2u);
    }
  }
}

- (void)eventSource:(id)a3 userTouchedApplication:(id)a4
{
  if ([a4 isEqualToString:self->_captureAppBundleID]
    && self->_inCaptureApp
    && ![(BSAbsoluteMachTimer *)self->_captureAppInteractionTimer isScheduled])
  {
    uint64_t v5 = SBLogCameraCaptureSessionLogs();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Interacted with capture app.", v6, 2u);
    }

    [(SBCaptureButtonSession *)self _sealIntentionalLaunch];
  }
}

- (void)_startCountdown
{
  objc_initWeak(&location, self);
  timer = self->_timer;
  uint64_t v4 = MEMORY[0x1E4F14428];
  id v5 = MEMORY[0x1E4F14428];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__SBCaptureButtonSession__startCountdown__block_invoke;
  v6[3] = &unk_1E6AF5838;
  objc_copyWeak(&v7, &location);
  [(BSAbsoluteMachTimer *)timer scheduleWithFireInterval:v4 leewayInterval:v6 queue:7.5 handler:0.0];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __41__SBCaptureButtonSession__startCountdown__block_invoke(uint64_t a1)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && [WeakRetained isActive])
  {
    int v3 = v2[56];
    uint64_t v4 = SBLogCameraCaptureSessionLogs();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Countdown timer expired while in capture app.", buf, 2u);
      }

      [v2 _sealLowConfidenceIntentionalLaunch];
    }
    else
    {
      if (v5)
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Countdown timer expired while NOT in capture app.", v6, 2u);
      }

      [v2 _sealIntentionalMitigation];
    }
  }
}

- (void)_startCaptureInteractionTimer
{
}

- (void)_handleNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 name];
  if (([v5 isEqualToString:@"SBVolumeHardwareButtonIncreaseNotification"] & 1) == 0)
  {
    uint64_t v6 = [v4 name];
    if (![v6 isEqualToString:@"SBVolumeHardwareButtonDecreaseNotification"])
    {
      id v8 = [v4 name];
      char v9 = [v8 isEqualToString:@"SBCaptureHardwareButtonPressNotification"];

      if ((v9 & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  if (self->_inCaptureApp)
  {
    id v7 = SBLogCameraCaptureSessionLogs();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Interacted with app using hardware buttons.", v10, 2u);
    }

    [(SBCaptureButtonSession *)self _sealIntentionalLaunch];
  }
LABEL_10:
}

- (void)_sealIntentionalLaunch
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__SBCaptureButtonSession__sealIntentionalLaunch__block_invoke;
  v2[3] = &unk_1E6AF4AC0;
  v2[4] = self;
  [(SBCaptureButtonSession *)self _sealWithReason:@"intentional launch" block:v2];
}

void __48__SBCaptureButtonSession__sealIntentionalLaunch__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "launched", (void)v8)) {
          uint64_t v7 = 1;
        }
        else {
          uint64_t v7 = 2;
        }
        [v6 setIntention:v7];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

- (void)_sealLowConfidenceIntentionalLaunch
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __61__SBCaptureButtonSession__sealLowConfidenceIntentionalLaunch__block_invoke;
  v2[3] = &unk_1E6AF4AC0;
  v2[4] = self;
  [(SBCaptureButtonSession *)self _sealWithReason:@"low confidence intentional launch" block:v2];
}

void __61__SBCaptureButtonSession__sealLowConfidenceIntentionalLaunch__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "launched", (void)v8)) {
          uint64_t v7 = 3;
        }
        else {
          uint64_t v7 = 2;
        }
        [v6 setIntention:v7];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

- (void)_sealUnintentionalLaunch
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__SBCaptureButtonSession__sealUnintentionalLaunch__block_invoke;
  v2[3] = &unk_1E6AF4AC0;
  v2[4] = self;
  [(SBCaptureButtonSession *)self _sealWithReason:@"unintentional launch" block:v2];
}

void __50__SBCaptureButtonSession__sealUnintentionalLaunch__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "launched", (void)v8)) {
          uint64_t v7 = 2;
        }
        else {
          uint64_t v7 = 1;
        }
        [v6 setIntention:v7];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

- (void)_sealIntentionalMitigation
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __52__SBCaptureButtonSession__sealIntentionalMitigation__block_invoke;
  v2[3] = &unk_1E6AF4AC0;
  v2[4] = self;
  [(SBCaptureButtonSession *)self _sealWithReason:@"intentional mitigation" block:v2];
}

void __52__SBCaptureButtonSession__sealIntentionalMitigation__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if (objc_msgSend(v6, "mitigated", (void)v7)) {
          [v6 setIntention:1];
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)_sealWithReason:(id)a3 block:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v7 = (void (**)(void))a4;
  long long v8 = SBLogCameraCaptureSessionLogs();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v6;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to seal %{public}@.", (uint8_t *)&v11, 0xCu);
  }

  if (self->_sealed)
  {
    id WeakRetained = SBLogCameraCaptureSessionLogs();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      -[SBCaptureButtonSession _sealWithReason:block:](WeakRetained);
    }
  }
  else
  {
    self->_sealed = 1;
    [(SBCaptureButtonSession *)self invalidate];
    if (v7) {
      v7[2](v7);
    }
    long long v10 = SBLogCameraCaptureSessionLogs();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v6;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Sealed %{public}@.", (uint8_t *)&v11, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained sessionDidFinalize:self];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_displayLayoutPublisher);
  objc_destroyWeak((id *)&self->_displayAppInteractionEventSource);
  objc_storeStrong((id *)&self->_captureAppInteractionTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_captureAppBundleID, 0);
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_interactions, 0);
}

- (void)coalesceInteraction:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  long long v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  long long v9 = v5;
  __int16 v10 = 2114;
  int v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  long long v15 = @"SBCaptureButtonSession.m";
  __int16 v16 = 1024;
  int v17 = 108;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)_sealWithReason:(os_log_t)log block:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Tried sealing an already sealed session. Aborting.", v1, 2u);
}

@end