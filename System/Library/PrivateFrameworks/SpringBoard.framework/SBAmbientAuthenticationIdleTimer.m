@interface SBAmbientAuthenticationIdleTimer
- (BOOL)_isAttentionClientActive;
- (BOOL)_isAuthenticated;
- (BOOL)isEnabled;
- (SBAmbientAuthenticationIdleTimer)init;
- (double)idleTimerDuration;
- (double)maximumAuthenticatedInterval;
- (id)_initWithKeyBag:(id)a3 attentionAwarenessClient:(id)a4;
- (void)_handleAttentionLost:(id)a3;
- (void)_recomputeAuthenticationLimitTimer;
- (void)_reconfigureAttentionClient;
- (void)_setAttentionClientActive:(BOOL)a3;
- (void)_setAuthenticated:(BOOL)a3;
- (void)_updateAttentionClientActive;
- (void)dealloc;
- (void)keybag:(id)a3 extendedStateDidChange:(id)a4;
- (void)setEnabled:(BOOL)a3;
- (void)setIdleTimerDuration:(double)a3;
- (void)setMaximumAuthenticatedInterval:(double)a3;
@end

@implementation SBAmbientAuthenticationIdleTimer

- (SBAmbientAuthenticationIdleTimer)init
{
  v3 = [MEMORY[0x1E4FA5F80] sharedInstance];
  v4 = objc_opt_new();
  v5 = [(SBAmbientAuthenticationIdleTimer *)self _initWithKeyBag:v3 attentionAwarenessClient:v4];

  return v5;
}

- (id)_initWithKeyBag:(id)a3 attentionAwarenessClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SBAmbientAuthenticationIdleTimer;
  v9 = [(SBAmbientAuthenticationIdleTimer *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keybag, a3);
    *(_OWORD *)&v10->_maximumAuthenticatedInterval = xmmword_1D8FD0B30;
    v10->_authenticated = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeStrong((id *)&v10->_attentionClient, a4);
    [(SBAmbientAuthenticationIdleTimer *)v10 _reconfigureAttentionClient];
    v11 = [(SBFMobileKeyBag *)v10->_keybag state];
    -[SBAmbientAuthenticationIdleTimer _setAuthenticated:](v10, "_setAuthenticated:", [v11 isEffectivelyLocked] ^ 1);

    objc_initWeak(&location, v10);
    attentionClient = v10->_attentionClient;
    uint64_t v13 = MEMORY[0x1E4F14428];
    id v14 = MEMORY[0x1E4F14428];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __77__SBAmbientAuthenticationIdleTimer__initWithKeyBag_attentionAwarenessClient___block_invoke;
    v16[3] = &unk_1E6AF9328;
    objc_copyWeak(&v17, &location);
    [(AWAttentionAwarenessClient *)attentionClient setEventHandlerWithQueue:v13 block:v16];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __77__SBAmbientAuthenticationIdleTimer__initWithKeyBag_attentionAwarenessClient___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 eventMask])
  {
    uint64_t v3 = objc_opt_class();
    id v4 = v8;
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        v5 = v4;
      }
      else {
        v5 = 0;
      }
    }
    else
    {
      v5 = 0;
    }
    id v6 = v5;

    if (v6)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      [WeakRetained _handleAttentionLost:v6];
    }
  }
}

- (void)dealloc
{
  [(BSContinuousMachTimer *)self->_authenticationLimitTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBAmbientAuthenticationIdleTimer;
  [(SBAmbientAuthenticationIdleTimer *)&v3 dealloc];
}

- (void)setMaximumAuthenticatedInterval:(double)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_maximumAuthenticatedInterval != a3)
  {
    self->_double maximumAuthenticatedInterval = a3;
    id v4 = SBLogAmbientAuthentication();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      double maximumAuthenticatedInterval = self->_maximumAuthenticatedInterval;
      int v6 = 134217984;
      double v7 = maximumAuthenticatedInterval;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Maximum authentication interval changed to %f", (uint8_t *)&v6, 0xCu);
    }

    [(SBAmbientAuthenticationIdleTimer *)self _recomputeAuthenticationLimitTimer];
  }
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_enabled != a3)
  {
    self->_BOOL enabled = a3;
    id v4 = SBLogAmbientAuthentication();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL enabled = self->_enabled;
      v8[0] = 67109120;
      v8[1] = enabled;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Enabled state changed to %{BOOL}u", (uint8_t *)v8, 8u);
    }

    keybag = self->_keybag;
    if (self->_enabled)
    {
      [(SBFMobileKeyBag *)keybag addObserver:self];
      double v7 = [(SBFMobileKeyBag *)self->_keybag state];
      -[SBAmbientAuthenticationIdleTimer _setAuthenticated:](self, "_setAuthenticated:", [v7 isEffectivelyLocked] ^ 1);
    }
    else
    {
      [(SBFMobileKeyBag *)keybag removeObserver:self];
    }
    [(SBAmbientAuthenticationIdleTimer *)self _updateAttentionClientActive];
    [(SBAmbientAuthenticationIdleTimer *)self _recomputeAuthenticationLimitTimer];
  }
}

- (void)setIdleTimerDuration:(double)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_idleTimerDuration != a3)
  {
    self->_double idleTimerDuration = a3;
    id v4 = SBLogAmbientAuthentication();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      double idleTimerDuration = self->_idleTimerDuration;
      int v6 = 134217984;
      double v7 = idleTimerDuration;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Updated idle timer duration to %f", (uint8_t *)&v6, 0xCu);
    }

    [(SBAmbientAuthenticationIdleTimer *)self _reconfigureAttentionClient];
  }
}

- (void)keybag:(id)a3 extendedStateDidChange:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  int v5 = [v4 isEffectivelyLocked] ^ 1;
  int v6 = SBLogAmbientAuthentication();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v8 = v4;
    __int16 v9 = 1024;
    int v10 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Extended keybag state did change to %@ isAuthenticated = %{BOOL}u", buf, 0x12u);
  }

  BSDispatchMain();
}

uint64_t __66__SBAmbientAuthenticationIdleTimer_keybag_extendedStateDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setAuthenticated:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)_isAuthenticated
{
  return BSSettingFlagIsYes();
}

- (void)_setAuthenticated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int64_t v5 = BSSettingFlagForBool();
  if (self->_authenticated != v5)
  {
    self->_authenticated = v5;
    int v6 = SBLogAmbientAuthentication();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = v3;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Authentication state changed to %{BOOL}u", (uint8_t *)v8, 8u);
    }

    if (BSSettingFlagIsYes())
    {
      BSContinuousMachTimeNow();
      self->_lastAuthenticationTime = v7;
    }
    [(SBAmbientAuthenticationIdleTimer *)self _updateAttentionClientActive];
    [(SBAmbientAuthenticationIdleTimer *)self _recomputeAuthenticationLimitTimer];
  }
}

- (void)_updateAttentionClientActive
{
  BOOL v3 = self->_enabled && [(SBAmbientAuthenticationIdleTimer *)self _isAuthenticated];
  [(SBAmbientAuthenticationIdleTimer *)self _setAttentionClientActive:v3];
}

- (void)_setAttentionClientActive:(BOOL)a3
{
  if (self->_attentionClientActive != a3)
  {
    BOOL v3 = a3;
    self->_attentionClientActive = a3;
    int64_t v5 = SBLogAmbientAuthentication();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Resuming attention client", buf, 2u);
      }

      [(AWAttentionAwarenessClient *)self->_attentionClient resumeWithError:0];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)double v7 = 0;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Suspending attention client", v7, 2u);
      }

      [(AWAttentionAwarenessClient *)self->_attentionClient suspendWithError:0];
    }
  }
}

- (void)_recomputeAuthenticationLimitTimer
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([(BSContinuousMachTimer *)self->_authenticationLimitTimer isScheduled])
  {
    BOOL v3 = SBLogAmbientAuthentication();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating authentication limit timer", buf, 2u);
    }
  }
  [(BSContinuousMachTimer *)self->_authenticationLimitTimer invalidate];
  if ([(SBAmbientAuthenticationIdleTimer *)self _isAuthenticated]
    && [(SBAmbientAuthenticationIdleTimer *)self isEnabled])
  {
    BSContinuousMachTimeNow();
    double v5 = v4;
    double lastAuthenticationTime = self->_lastAuthenticationTime;
    [(SBAmbientAuthenticationIdleTimer *)self maximumAuthenticatedInterval];
    double v8 = v7;
    uint64_t v9 = SBLogAmbientAuthentication();
    double v10 = lastAuthenticationTime + v8 - v5;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      [(SBAmbientAuthenticationIdleTimer *)self maximumAuthenticatedInterval];
      *(_DWORD *)buf = 134218240;
      uint64_t v26 = v11;
      __int16 v27 = 2048;
      double v28 = v10;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Updating authentication limit timer. maxInterval = %f remainingInterval = %f", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __70__SBAmbientAuthenticationIdleTimer__recomputeAuthenticationLimitTimer__block_invoke;
    v23[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v24, (id *)buf);
    v12 = (void (**)(void))MEMORY[0x1D948C7A0](v23);
    if (v10 <= 0.0)
    {
      objc_super v19 = SBLogAmbientAuthentication();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "Authentication limit in the past; locking immediately",
          v20,
          2u);
      }

      v12[2](v12);
    }
    else
    {
      uint64_t v13 = [objc_alloc(MEMORY[0x1E4F4F6F0]) initWithIdentifier:@"com.apple.SpringBoard.AmbientAuthentication"];
      authenticationLimitTimer = self->_authenticationLimitTimer;
      p_authenticationLimitTimer = &self->_authenticationLimitTimer;
      *p_authenticationLimitTimer = (BSContinuousMachTimer *)v13;

      v16 = *p_authenticationLimitTimer;
      uint64_t v17 = MEMORY[0x1E4F14428];
      id v18 = MEMORY[0x1E4F14428];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __70__SBAmbientAuthenticationIdleTimer__recomputeAuthenticationLimitTimer__block_invoke_2;
      v21[3] = &unk_1E6AF9350;
      v22 = v12;
      [(BSContinuousMachTimer *)v16 scheduleWithFireInterval:v17 leewayInterval:v21 queue:v10 handler:1.0];
    }
    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
}

void __70__SBAmbientAuthenticationIdleTimer__recomputeAuthenticationLimitTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    double v4 = WeakRetained;
    int v3 = [WeakRetained isEnabled];
    v2 = v4;
    if (v3)
    {
      [v4[1] lockSkippingGracePeriod:0];
      v2 = v4;
    }
  }
}

uint64_t __70__SBAmbientAuthenticationIdleTimer__recomputeAuthenticationLimitTimer__block_invoke_2(uint64_t a1)
{
  v2 = SBLogAmbientAuthentication();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Authentication limit reached. Locking", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_reconfigureAttentionClient
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F4E708]);
  [v3 setIdentifier:@"com.apple.SpringBoard.AmbientAuthentication"];
  [v3 setEventMask:4095];
  [v3 setAttentionLostEventMask:0];
  [v3 setSamplingInterval:4.0];
  [(SBAmbientAuthenticationIdleTimer *)self idleTimerDuration];
  objc_msgSend(v3, "setAttentionLostTimeout:");
  double v4 = SBLogAmbientAuthentication();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Updating attention client with configuration %{public}@", (uint8_t *)&v5, 0xCu);
  }

  [(AWAttentionAwarenessClient *)self->_attentionClient setConfiguration:v3];
}

- (void)_handleAttentionLost:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  double v4 = SBLogAmbientAuthentication();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = [(SBAmbientAuthenticationIdleTimer *)self isEnabled];
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Attention lost. isEnabled = %{BOOL}u", (uint8_t *)v6, 8u);
  }

  if ([(SBAmbientAuthenticationIdleTimer *)self isEnabled])
  {
    int v5 = SBLogAmbientAuthentication();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Locking due to attention loss", (uint8_t *)v6, 2u);
    }

    [(SBFMobileKeyBag *)self->_keybag lockSkippingGracePeriod:0];
  }
}

- (double)maximumAuthenticatedInterval
{
  return self->_maximumAuthenticatedInterval;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (double)idleTimerDuration
{
  return self->_idleTimerDuration;
}

- (BOOL)_isAttentionClientActive
{
  return self->_attentionClientActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attentionClient, 0);
  objc_storeStrong((id *)&self->_authenticationLimitTimer, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
}

@end