@interface SBUIContinuitySession
- (NSSet)externallyBlockedReasons;
- (NSSet)stepReasons;
- (NSString)displayHardwareIdentifier;
- (SBUIContinuitySession)init;
- (SBUIContinuitySession)initWithConnectionFactory:(id)a3 connectionQueue:(id)a4;
- (SBUIContinuitySessionAppearanceSettings)appearanceSettings;
- (SBUIContinuitySessionDelegate)delegate;
- (id)acquireScreenRecordingAssertion;
- (int64_t)hostedInterfaceOrientation;
- (int64_t)interfaceOrientation;
- (unint64_t)step;
- (unint64_t)supportedInterfaceOrientations;
- (void)_invalidateOrientations;
- (void)activate;
- (void)dealloc;
- (void)didSetDisplayHardwareIdentifier:(id)a3;
- (void)didUpdateContinuitySessionStep:(id)a3 reasons:(id)a4;
- (void)didUpdateCurrentInterfaceOrientation:(id)a3 supportedInterfaceOrientations:(id)a4;
- (void)handleContinuityButtonEvent:(unint64_t)a3;
- (void)handleLaunchEventOfType:(id)a3 payload:(id)a4;
- (void)invalidate;
- (void)noteHIDServicesConfigured;
- (void)noteScreenshotCaptured;
- (void)setDelegate:(id)a3;
- (void)setExternallyBlockedReasons:(id)a3;
- (void)setHostedInterfaceOrientation:(int64_t)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setSupportedInterfaceOrientations:(unint64_t)a3;
- (void)staging_adoptedMacDrivenScreenCaptureNotifications;
- (void)updateAppearanceSettings:(id)a3 withCompletion:(id)a4;
@end

@implementation SBUIContinuitySession

- (SBUIContinuitySession)init
{
  v3 = (void *)BSDispatchQueueCreateWithQualityOfService();
  v4 = objc_alloc_init(SBUIBSServiceConnectionWrapper);
  v5 = [(SBUIContinuitySession *)self initWithConnectionFactory:v4 connectionQueue:v3];

  return v5;
}

- (SBUIContinuitySession)initWithConnectionFactory:(id)a3 connectionQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)SBUIContinuitySession;
  v8 = [(SBUIContinuitySession *)&v40 init];
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v8->_lock_clientCalledActivate = 0;
    objc_storeStrong((id *)&v8->_connectionQueue, a4);
    v9->_lock_serverStep = 0;
    uint64_t v10 = [MEMORY[0x1E4F1CAD0] set];
    lock_serverBlockedReasons = v9->_lock_serverBlockedReasons;
    v9->_lock_serverBlockedReasons = (NSSet *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CAD0] set];
    lock_clientBlockedReasons = v9->_lock_clientBlockedReasons;
    v9->_lock_clientBlockedReasons = (NSSet *)v12;

    v9->_lock_hostedInterfaceOrientation = 0;
    v14 = objc_alloc_init(SBUIContinuitySessionAppearanceSettings);
    appearanceSettings = v9->_appearanceSettings;
    v9->_appearanceSettings = v14;

    objc_initWeak(&location, v9);
    v16 = (void *)MEMORY[0x1E4F4F6E8];
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __67__SBUIContinuitySession_initWithConnectionFactory_connectionQueue___block_invoke;
    v37[3] = &unk_1E5CCC630;
    objc_copyWeak(&v38, &location);
    uint64_t v19 = [v16 assertionWithIdentifier:v18 stateDidChangeHandler:v37];
    screenRecordingAssertions = v9->_screenRecordingAssertions;
    v9->_screenRecordingAssertions = (BSCompoundAssertion *)v19;

    v21 = v9->_screenRecordingAssertions;
    v22 = SBLogContinuitySessionService();
    [(BSCompoundAssertion *)v21 setLog:v22];

    v23 = (void *)MEMORY[0x1E4F62888];
    v24 = [MEMORY[0x1E4F62888] defaultShellMachName];
    v25 = +[SBUIContinuitySessionServiceSpecification identifier];
    v26 = [v23 endpointForMachName:v24 service:v25 instance:0];

    uint64_t v27 = [v6 connectionWithEndpoint:v26];
    connection = v9->_connection;
    v9->_connection = (BSServiceConnection *)v27;

    v29 = v9->_connection;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __67__SBUIContinuitySession_initWithConnectionFactory_connectionQueue___block_invoke_11;
    v35[3] = &unk_1E5CCE868;
    v30 = v9;
    v36 = v30;
    [(BSServiceConnection *)v29 configureConnection:v35];
    connectionQueue = v9->_connectionQueue;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __67__SBUIContinuitySession_initWithConnectionFactory_connectionQueue___block_invoke_2_16;
    v33[3] = &unk_1E5CCC580;
    v34 = v30;
    dispatch_sync(connectionQueue, v33);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __67__SBUIContinuitySession_initWithConnectionFactory_connectionQueue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 6);
    int v6 = BYTE1(v5[7]._os_unfair_lock_opaque);
    os_unfair_lock_unlock(v5 + 6);
    if (v6)
    {
      id v7 = SBLogContinuitySessionService();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = [v3 isActive];
        v9 = @"stop";
        if (v8) {
          v9 = @"start";
        }
        int v13 = 138543362;
        v14 = v9;
        _os_log_impl(&dword_1A7607000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring call to %{public}@ screen recording because the session has already ended", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      int v10 = [v3 isActive];
      v11 = SBLogContinuitySessionService();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v12)
        {
          LOWORD(v13) = 0;
          _os_log_impl(&dword_1A7607000, v11, OS_LOG_TYPE_DEFAULT, "Screen recording started", (uint8_t *)&v13, 2u);
        }

        id v7 = [*(id *)&v5[2]._os_unfair_lock_opaque remoteTarget];
        [v7 didStartScreenRecording];
      }
      else
      {
        if (v12)
        {
          LOWORD(v13) = 0;
          _os_log_impl(&dword_1A7607000, v11, OS_LOG_TYPE_DEFAULT, "Screen recording stopped", (uint8_t *)&v13, 2u);
        }

        id v7 = [*(id *)&v5[2]._os_unfair_lock_opaque remoteTarget];
        [v7 didStopScreenRecording];
      }
    }
  }
}

void __67__SBUIContinuitySession_initWithConnectionFactory_connectionQueue___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[SBUIContinuitySessionServiceSpecification interface];
  [v3 setInterface:v4];

  v5 = +[SBUIContinuitySessionServiceSpecification serviceQuality];
  [v3 setServiceQuality:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__SBUIContinuitySession_initWithConnectionFactory_connectionQueue___block_invoke_2;
  v6[3] = &unk_1E5CCE840;
  id v7 = *(id *)(a1 + 32);
  [v3 setInvalidationHandler:v6];
}

void __67__SBUIContinuitySession_initWithConnectionFactory_connectionQueue___block_invoke_2(uint64_t a1)
{
  v2 = SBLogContinuitySessionService();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7607000, v2, OS_LOG_TYPE_DEFAULT, "Ending session - server invalidated", buf, 2u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  *(unsigned char *)(*(void *)(a1 + 32) + 29) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  id v3 = *(id *)(a1 + 32);
  BSDispatchMain();
}

void __67__SBUIContinuitySession_initWithConnectionFactory_connectionQueue___block_invoke_12(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CAD0] setWithObject:@"serverInvalidated"];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;
  id v5 = v2;

  *(void *)(*(void *)(a1 + 32) + 40) = 7;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  id v6 = [*(id *)(a1 + 32) delegate];
  [v6 continuitySession:*(void *)(a1 + 32) didUpdateContinuitySessionStep:7 reasons:v5];
}

uint64_t __67__SBUIContinuitySession_initWithConnectionFactory_connectionQueue___block_invoke_2_16(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) activate];
}

- (void)dealloc
{
  [(BSCompoundAssertion *)self->_screenRecordingAssertions invalidate];
  screenRecordingAssertions = self->_screenRecordingAssertions;
  self->_screenRecordingAssertions = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBUIContinuitySession;
  [(SBUIContinuitySession *)&v4 dealloc];
}

- (void)activate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  uint64_t v15 = @"SBUIContinuitySession.m";
  __int16 v16 = 1024;
  int v17 = 165;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1A7607000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)setExternallyBlockedReasons:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v4)
  {
    uint64_t v5 = [v4 copy];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v6 = (void *)v5;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSSet *)self->_lock_clientBlockedReasons isEqual:v6])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    id v7 = (NSSet *)[v6 copy];
    lock_clientBlockedReasons = self->_lock_clientBlockedReasons;
    self->_lock_clientBlockedReasons = v7;

    BOOL lock_sessionEnded = self->_lock_sessionEnded;
    os_unfair_lock_unlock(&self->_lock);
    if (!lock_sessionEnded)
    {
      __int16 v10 = SBLogContinuitySessionService();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138543362;
        uint64_t v13 = v6;
        _os_log_impl(&dword_1A7607000, v10, OS_LOG_TYPE_DEFAULT, "Sending updated externally blocked reasons: %{public}@", (uint8_t *)&v12, 0xCu);
      }

      v11 = [(BSServiceConnection *)self->_connection remoteTarget];
      [v11 didUpdateExternalBlockedReasons:v6];
    }
  }
}

- (NSSet)externallyBlockedReasons
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSSet *)self->_lock_clientBlockedReasons copy];
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (unint64_t)step
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t lock_serverStep = self->_lock_serverStep;
  LODWORD(self) = self->_lock_sessionEnded;
  os_unfair_lock_unlock(p_lock);
  if (self) {
    BOOL v5 = lock_serverStep == 7;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    id v6 = SBLogContinuitySessionService();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = NSStringFromSBUIContinuitySessionStep(lock_serverStep);
      int v9 = 138543362;
      __int16 v10 = v7;
      _os_log_impl(&dword_1A7607000, v6, OS_LOG_TYPE_INFO, "overriding current state (%{public}@ to invalid because the session has ended", (uint8_t *)&v9, 0xCu);
    }
    return 7;
  }
  return lock_serverStep;
}

- (NSSet)stepReasons
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSSet *)self->_lock_serverBlockedReasons copy];
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (void)noteHIDServicesConfigured
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  BOOL hidServicesConfigured = self->_hidServicesConfigured;
  id v4 = SBLogContinuitySessionService();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (hidServicesConfigured)
  {
    if (v5)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1A7607000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring duplicate notification that HID services were configured.  I already told SB that...", v7, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7607000, v4, OS_LOG_TYPE_DEFAULT, "Sending note that HID services were configured", buf, 2u);
    }

    id v6 = [(BSServiceConnection *)self->_connection remoteTarget];
    [v6 noteHIDServicesConfigured];

    self->_BOOL hidServicesConfigured = 1;
  }
}

- (void)handleLaunchEventOfType:(id)a3 payload:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_sessionEnded = self->_lock_sessionEnded;
  os_unfair_lock_unlock(&self->_lock);
  int v9 = SBLogContinuitySessionService();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (lock_sessionEnded)
  {
    if (v10)
    {
      int v11 = 138543362;
      id v12 = v6;
      _os_log_impl(&dword_1A7607000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring call to handleLaunchEventOfType - %{public}@ because the session has ended", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    if (v10)
    {
      int v11 = 138543362;
      id v12 = v6;
      _os_log_impl(&dword_1A7607000, v9, OS_LOG_TYPE_DEFAULT, "Sending launch event: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    int v9 = [(BSServiceConnection *)self->_connection remoteTarget];
    [v9 handleLaunchEventOfType:v6 payload:v7];
  }
}

- (void)updateAppearanceSettings:(id)a3 withCompletion:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *, SBUIContinuitySessionTransitionContext *))a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __65__SBUIContinuitySession_updateAppearanceSettings_withCompletion___block_invoke;
  v30[3] = &unk_1E5CCE890;
  id v8 = v7;
  id v31 = v8;
  int v9 = (void (**)(void, void, void))MEMORY[0x1AD0CF1C0](v30);
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_sessionEnded = self->_lock_sessionEnded;
  os_unfair_lock_unlock(&self->_lock);
  if (lock_sessionEnded)
  {
    int v11 = SBLogContinuitySessionService();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7607000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring call to updateAppearanceSettings because the session has ended", buf, 2u);
    }

    SBUIContinuitySessionErrorCreate((void *)0xFFFFFFFFFFFFF82FLL, @"Session has ended", v12, v13, v14, v15, v16, v17, v28[0]);
    __int16 v18 = (SBUIContinuitySessionAppearanceSettings *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, SBUIContinuitySessionAppearanceSettings *))v9)[2](v9, 0, v18);
  }
  else
  {
    __int16 v18 = self->_appearanceSettings;
    uint64_t v19 = (void *)[(SBUIContinuitySessionAppearanceSettings *)v18 mutableCopy];
    uint64_t v20 = objc_alloc_init(SBUIContinuitySessionTransitionContext);
    if (v6)
    {
      v6[2](v6, v19, v20);
      v21 = (void *)[v19 copy];
      if ([(SBUIContinuitySessionAppearanceSettings *)v18 isEqual:v21])
      {
        v22 = SBLogContinuitySessionService();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v33 = v18;
          _os_log_impl(&dword_1A7607000, v22, OS_LOG_TYPE_DEFAULT, "Appearance settings not changed from %{public}@ - firing completion now", buf, 0xCu);
        }

        v9[2](v9, 1, 0);
      }
      else
      {
        v24 = (SBUIContinuitySessionAppearanceSettings *)[v19 copy];
        appearanceSettings = self->_appearanceSettings;
        self->_appearanceSettings = v24;

        v26 = SBLogContinuitySessionService();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v33 = v18;
          __int16 v34 = 2114;
          v35 = v21;
          _os_log_impl(&dword_1A7607000, v26, OS_LOG_TYPE_DEFAULT, "Appearance settings changed from %{public}@ to %{public}@ - sending appearance update", buf, 0x16u);
        }

        uint64_t v27 = [(BSServiceConnection *)self->_connection remoteTarget];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = (uint64_t)__65__SBUIContinuitySession_updateAppearanceSettings_withCompletion___block_invoke_32;
        v28[3] = (uint64_t)&unk_1E5CCE8E0;
        v29 = v9;
        [v27 updatedAppearanceSettings:v21 transitionContext:v20 completion:v28];
      }
    }
    else
    {
      v23 = SBLogContinuitySessionService();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7607000, v23, OS_LOG_TYPE_DEFAULT, "No updater block provided, firing completion now", buf, 2u);
      }

      v9[2](v9, 1, 0);
    }
  }
}

uint64_t __65__SBUIContinuitySession_updateAppearanceSettings_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __65__SBUIContinuitySession_updateAppearanceSettings_withCompletion___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  id v9 = *(id *)(a1 + 32);
  id v6 = v8;
  id v7 = v5;
  BSDispatchMain();
}

uint64_t __65__SBUIContinuitySession_updateAppearanceSettings_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) BOOLValue];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v5(v2, v3, v4);
}

- (SBUIContinuitySessionAppearanceSettings)appearanceSettings
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  appearanceSettings = self->_appearanceSettings;
  return appearanceSettings;
}

- (void)handleContinuityButtonEvent:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_clientCalledActivate = self->_lock_clientCalledActivate;
  BOOL lock_sessionEnded = self->_lock_sessionEnded;
  os_unfair_lock_unlock(&self->_lock);
  if (lock_clientCalledActivate)
  {
    id v7 = SBLogContinuitySessionService();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (!lock_sessionEnded)
    {
      if (v8)
      {
        int v11 = NSStringFromSBUIContinuityButtonEventType(a3);
        int v12 = 138543362;
        uint64_t v13 = v11;
        _os_log_impl(&dword_1A7607000, v7, OS_LOG_TYPE_DEFAULT, "Sending button event: %{public}@", (uint8_t *)&v12, 0xCu);
      }
      id v7 = [(BSServiceConnection *)self->_connection remoteTarget];
      id v9 = [NSNumber numberWithUnsignedInteger:a3];
      [v7 handleContinuityButtonEvent:v9];
      goto LABEL_11;
    }
    if (v8)
    {
      id v9 = NSStringFromSBUIContinuityButtonEventType(a3);
      int v12 = 138543362;
      uint64_t v13 = v9;
      BOOL v10 = "Ignoring call to handleContinuityButtonEvent - %{public}@ because the session has ended";
LABEL_7:
      _os_log_impl(&dword_1A7607000, v7, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0xCu);
LABEL_11:
    }
  }
  else
  {
    id v7 = SBLogContinuitySessionService();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = NSStringFromSBUIContinuityButtonEventType(a3);
      int v12 = 138543362;
      uint64_t v13 = v9;
      BOOL v10 = "Ignoring call to handleContinuityButtonEvent - %{public}@ because the session hasn't been activated by the client";
      goto LABEL_7;
    }
  }
}

- (int64_t)hostedInterfaceOrientation
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_hostedInterfaceOrientation = self->_lock_hostedInterfaceOrientation;
  os_unfair_lock_unlock(p_lock);
  return lock_hostedInterfaceOrientation;
}

- (void)setHostedInterfaceOrientation:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_clientCalledActivate)
  {
    BOOL lock_sessionEnded = self->_lock_sessionEnded;
    self->_int64_t lock_hostedInterfaceOrientation = a3;
    os_unfair_lock_unlock(&self->_lock);
    if (!lock_sessionEnded)
    {
      id v6 = SBLogContinuitySessionService();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = BSInterfaceOrientationDescription();
        int v10 = 138543362;
        int v11 = v7;
        _os_log_impl(&dword_1A7607000, v6, OS_LOG_TYPE_DEFAULT, "Setting hosted interface orientation: %{public}@", (uint8_t *)&v10, 0xCu);
      }
      BOOL v8 = [(BSServiceConnection *)self->_connection remoteTarget];
      id v9 = [NSNumber numberWithInteger:a3];
      [v8 setHostedInterfaceOrientation:v9];
      goto LABEL_9;
    }
  }
  else
  {
    self->_int64_t lock_hostedInterfaceOrientation = a3;
    os_unfair_lock_unlock(&self->_lock);
  }
  BOOL v8 = SBLogContinuitySessionService();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = BSInterfaceOrientationDescription();
    int v10 = 138543362;
    int v11 = v9;
    _os_log_impl(&dword_1A7607000, v8, OS_LOG_TYPE_DEFAULT, "Pending call to set the hosted interface orientation: %{public}@ because the session hasn't been activated by the client or has ended", (uint8_t *)&v10, 0xCu);
LABEL_9:
  }
}

- (void)_invalidateOrientations
{
  self->_interfaceOrientation = 0;
  self->_supportedInterfaceOrientations = 0;
}

- (void)noteScreenshotCaptured
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_clientCalledActivate = self->_lock_clientCalledActivate;
  BOOL lock_sessionEnded = self->_lock_sessionEnded;
  os_unfair_lock_unlock(&self->_lock);
  if (lock_clientCalledActivate)
  {
    id v5 = SBLogContinuitySessionService();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (lock_sessionEnded)
    {
      if (v6)
      {
        __int16 v10 = 0;
        id v7 = "Ignoring call to note screenshot captured because the session has ended";
        BOOL v8 = (uint8_t *)&v10;
LABEL_7:
        _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      }
    }
    else
    {
      if (v6)
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "Noting screenshot captured", v9, 2u);
      }

      id v5 = [(BSServiceConnection *)self->_connection remoteTarget];
      [v5 didCaptureScreenshot];
    }
  }
  else
  {
    id v5 = SBLogContinuitySessionService();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v7 = "Ignoring call to note screenshot captured because the session hasn't been activated by the client";
      BOOL v8 = buf;
      goto LABEL_7;
    }
  }
}

- (id)acquireScreenRecordingAssertion
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
  screenRecordingAssertions = self->_screenRecordingAssertions;
  id v5 = [v3 UUIDString];
  BOOL v6 = [(BSCompoundAssertion *)screenRecordingAssertions acquireForReason:v5];

  return v6;
}

- (void)invalidate
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_sessionEnded)
  {
    uint64_t v3 = SBLogContinuitySessionService();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl(&dword_1A7607000, v3, OS_LOG_TYPE_DEFAULT, "Ending session - client manually invalidated session", v8, 2u);
    }

    uint64_t v4 = [MEMORY[0x1E4F1CAD0] set];
    lock_serverBlockedReasons = self->_lock_serverBlockedReasons;
    self->_lock_serverBlockedReasons = v4;

    self->_unint64_t lock_serverStep = 7;
  }
  self->_BOOL lock_sessionEnded = 1;
  [(SBUIContinuitySession *)self _invalidateOrientations];
  os_unfair_lock_unlock(&self->_lock);
  [(BSServiceConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  [(BSCompoundAssertion *)self->_screenRecordingAssertions invalidate];
  screenRecordingAssertions = self->_screenRecordingAssertions;
  self->_screenRecordingAssertions = 0;
}

- (void)didSetDisplayHardwareIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  id v5 = v4;
  BSDispatchMain();
}

void __57__SBUIContinuitySession_didSetDisplayHardwareIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = SBLogContinuitySessionService();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A7607000, v2, OS_LOG_TYPE_DEFAULT, "Received display hardware identifier: %{public}@", (uint8_t *)&v4, 0xCu);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 40) + 96), *(id *)(a1 + 32));
}

- (void)didUpdateContinuitySessionStep:(id)a3 reasons:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  __int16 v10 = v7;
  id v8 = v7;
  id v9 = v6;
  BSDispatchMain();
}

void __64__SBUIContinuitySession_didUpdateContinuitySessionStep_reasons___block_invoke(id *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (int)[a1[4] intValue];
  os_unfair_lock_lock((os_unfair_lock_t)a1[5] + 6);
  int v3 = BSEqualObjects();
  id v4 = a1[5];
  uint64_t v5 = *((void *)v4 + 5);
  objc_storeStrong((id *)v4 + 6, a1[6]);
  *((void *)a1[5] + 5) = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)a1[5] + 6);
  if (v5 == v2) {
    int v6 = v3;
  }
  else {
    int v6 = 0;
  }
  id v7 = SBLogContinuitySessionService();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      id v8 = &stru_1EFCB7578;
    }
    else {
      id v8 = @"updated";
    }
    id v9 = NSStringFromSBUIContinuitySessionStep(v2);
    __int16 v10 = objc_msgSend(a1[6], "bs_array");
    int v12 = 138543874;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    _os_log_impl(&dword_1A7607000, v7, OS_LOG_TYPE_DEFAULT, "Received %{public}@ state: %{public}@ reasons: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  if ((v6 & 1) == 0)
  {
    int v11 = [a1[5] delegate];
    [v11 continuitySession:a1[5] didUpdateContinuitySessionStep:v2 reasons:a1[6]];
  }
}

- (void)didUpdateCurrentInterfaceOrientation:(id)a3 supportedInterfaceOrientations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  __int16 v10 = v7;
  id v8 = v7;
  id v9 = v6;
  BSDispatchMain();
}

void __93__SBUIContinuitySession_didUpdateCurrentInterfaceOrientation_supportedInterfaceOrientations___block_invoke(id *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] unsignedIntValue];
  uint64_t v3 = [a1[5] unsignedIntValue];
  id v4 = [a1[6] delegate];
  os_unfair_lock_lock((os_unfair_lock_t)a1[6] + 6);
  uint64_t v5 = [a1[6] interfaceOrientation];
  uint64_t v6 = [a1[6] supportedInterfaceOrientations];
  [a1[6] setInterfaceOrientation:v2];
  [a1[6] setSupportedInterfaceOrientations:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)a1[6] + 6);
  if (v5 != v2 || v6 != v3)
  {
    id v7 = SBLogContinuitySessionService();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = BSInterfaceOrientationDescription();
      id v9 = BSInterfaceOrientationMaskDescription();
      int v10 = 138543618;
      int v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1A7607000, v7, OS_LOG_TYPE_DEFAULT, "Received interfaceOrientation: %{public}@ supportedOrientations: %{public}@", (uint8_t *)&v10, 0x16u);
    }
    [v4 continuitySession:a1[6] didUpdateCurrentInterfaceOrientation:v2 supportedInterfaceOrientations:v3];
  }
}

- (SBUIContinuitySessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBUIContinuitySessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)displayHardwareIdentifier
{
  return self->_displayHardwareIdentifier;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (unint64_t)supportedInterfaceOrientations
{
  return self->_supportedInterfaceOrientations;
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_supportedInterfaceOrientations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayHardwareIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appearanceSettings, 0);
  objc_storeStrong((id *)&self->_screenRecordingAssertions, 0);
  objc_storeStrong((id *)&self->_lock_serverBlockedReasons, 0);
  objc_storeStrong((id *)&self->_lock_clientBlockedReasons, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)staging_adoptedMacDrivenScreenCaptureNotifications
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  os_unfair_lock_lock(&self->_lock);
  BOOL lock_sessionEnded = self->_lock_sessionEnded;
  os_unfair_lock_unlock(&self->_lock);
  id v4 = SBLogContinuitySessionService();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (lock_sessionEnded)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7607000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring client telling me they adopted screen capture notifications because the session has ended", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1A7607000, v4, OS_LOG_TYPE_DEFAULT, "Client has adopted screen capture notifications", v6, 2u);
    }

    id v4 = [(BSServiceConnection *)self->_connection remoteTarget];
    [v4 clientHasAdoptedScreenCaptureNotifications];
  }
}

@end