@interface SBScreenLongevityController
+ (id)_sharedInstanceCreateIfNeeded:(BOOL)a3;
+ (id)sharedInstance;
+ (id)sharedInstanceIfExists;
- (BOOL)_hasCameraAttributions;
- (BOOL)_isAutoLockSetToNever;
- (BOOL)_isValidCurrentTimer:(id)a3;
- (BOOL)_shouldEnable;
- (BOOL)isAdaptiveDimmingEnabled;
- (BOOL)isUnderAutoDimThreshold;
- (SBScreenLongevityController)init;
- (id)faceStreamAwarenessConfiguration;
- (void)_beginMonitoringAttentionAwarenessFeaturesEnablement;
- (void)_checkFaceAttentionAwareness;
- (void)_clientDidResetForUserAttention:(id)a3;
- (void)_dim;
- (void)_endMonitoringAttentionAwarenessFeaturesEnablement;
- (void)_mediaNowPlayingChanged;
- (void)_observeDefaults;
- (void)_screenBacklightStateChanged;
- (void)_startDimTimer;
- (void)_toggleBacklightAdaptiveDimming:(BOOL)a3;
- (void)_undim;
- (void)_updateCachedDefaults;
- (void)activityDidChangeForSensorActivityDataProvider:(id)a3;
- (void)client:(id)a3 attentionLostTimeoutDidExpire:(double)a4 forConfigurationGeneration:(unint64_t)a5 withAssociatedObject:(id)a6;
- (void)clientDidResetForUserAttention:(id)a3 withEvent:(id)a4;
- (void)dealloc;
- (void)dimTimerDidExpireForTimer:(id)a3;
- (void)evaluateEnablement;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)resetTimerForReason:(id)a3;
- (void)setAdaptiveDimmingEnabled:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)streamerClientDidResetForUserAttention:(id)a3;
@end

@implementation SBScreenLongevityController

+ (id)_sharedInstanceCreateIfNeeded:(BOOL)a3
{
  if (a3 && _sharedInstanceCreateIfNeeded__onceToken_2 != -1) {
    dispatch_once(&_sharedInstanceCreateIfNeeded__onceToken_2, &__block_literal_global_416);
  }
  v3 = (void *)_sharedInstanceCreateIfNeeded__controller_0;
  return v3;
}

void __61__SBScreenLongevityController__sharedInstanceCreateIfNeeded___block_invoke()
{
  v0 = objc_alloc_init(SBScreenLongevityController);
  v1 = (void *)_sharedInstanceCreateIfNeeded__controller_0;
  _sharedInstanceCreateIfNeeded__controller_0 = (uint64_t)v0;
}

+ (id)sharedInstance
{
  return (id)[a1 _sharedInstanceCreateIfNeeded:1];
}

+ (id)sharedInstanceIfExists
{
  return (id)[a1 _sharedInstanceCreateIfNeeded:0];
}

- (SBScreenLongevityController)init
{
  v23.receiver = self;
  v23.super_class = (Class)SBScreenLongevityController;
  v2 = [(SBScreenLongevityController *)&v23 init];
  if (v2)
  {
    v3 = [(id)SBApp sensorActivityDataProvider];
    [v3 addObserver:v2];

    uint64_t v4 = +[SBScreenLongevityDomain rootSettings];
    settings = v2->_settings;
    v2->_settings = (SBScreenLongevitySettings *)v4;

    [(PTSettings *)v2->_settings addKeyObserver:v2];
    [(SBScreenLongevityController *)v2 _observeDefaults];
    v2->_attentionAwarenessFeatureMonitoringToken = 0;
    [(SBScreenLongevityController *)v2 _beginMonitoringAttentionAwarenessFeaturesEnablement];
    v6 = [MEMORY[0x1E4F74230] sharedConnection];
    [v6 registerObserver:v2];

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel__mediaNowPlayingChanged name:@"SBMediaNowPlayingChangedNotification" object:0];
    [v7 addObserver:v2 selector:sel__screenBacklightStateChanged name:@"SBBlankScreenStateChangeNotification" object:0];
    v8 = (AWAttentionAwarenessConfiguration *)objc_alloc_init(MEMORY[0x1E4F4E708]);
    idleTouchAwarenessConfiguration = v2->_idleTouchAwarenessConfiguration;
    v2->_idleTouchAwarenessConfiguration = v8;

    [(AWAttentionAwarenessConfiguration *)v2->_idleTouchAwarenessConfiguration setIdentifier:@"screen-longevity-idle-touch"];
    [(AWAttentionAwarenessConfiguration *)v2->_idleTouchAwarenessConfiguration setEventMask:94];
    v10 = v2->_idleTouchAwarenessConfiguration;
    [(SBScreenLongevitySettings *)v2->_settings touchAttentionLostTimeout];
    [(AWAttentionAwarenessConfiguration *)v10 setAttentionLostTimeout:"setAttentionLostTimeout:"];
    v11 = objc_alloc_init(SBAttentionAwarenessClient);
    idleTouchAwarenessClient = v2->_idleTouchAwarenessClient;
    v2->_idleTouchAwarenessClient = v11;

    [(SBAttentionAwarenessClient *)v2->_idleTouchAwarenessClient setDelegate:v2];
    [(SBAttentionAwarenessClient *)v2->_idleTouchAwarenessClient setConfiguration:v2->_idleTouchAwarenessConfiguration];
    [(SBAttentionAwarenessClient *)v2->_idleTouchAwarenessClient setEnabled:0];
    v13 = (BrightnessSystemClient *)objc_alloc_init(MEMORY[0x1E4F5B290]);
    brightnessSystemClient = v2->_brightnessSystemClient;
    v2->_brightnessSystemClient = v13;

    objc_initWeak(&location, v2);
    v15 = v2->_brightnessSystemClient;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __35__SBScreenLongevityController_init__block_invoke;
    v20 = &unk_1E6B0E908;
    objc_copyWeak(&v21, &location);
    [(BrightnessSystemClient *)v15 registerNotificationBlock:&v17 forProperties:&unk_1F33489F0];
    v2->_enabled = 0;
    [(SBScreenLongevityController *)v2 evaluateEnablement];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __35__SBScreenLongevityController_init__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SBScreenLongevityController_init__block_invoke_2;
  block[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __35__SBScreenLongevityController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained evaluateEnablement];
}

- (void)dealloc
{
  [(SBScreenLongevityController *)self setEnabled:0];
  idleTouchAwarenessClient = self->_idleTouchAwarenessClient;
  if (idleTouchAwarenessClient)
  {
    [(SBAttentionAwarenessClient *)idleTouchAwarenessClient invalidate];
    uint64_t v4 = self->_idleTouchAwarenessClient;
    self->_idleTouchAwarenessClient = 0;
  }
  faceStreamAwarenessClient = self->_faceStreamAwarenessClient;
  if (faceStreamAwarenessClient)
  {
    [(SBAttentionAwarenessStreamerClient *)faceStreamAwarenessClient invalidate];
    v6 = self->_faceStreamAwarenessClient;
    self->_faceStreamAwarenessClient = 0;
  }
  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self];

  v8 = [(id)SBApp sensorActivityDataProvider];
  [v8 removeObserver:self];

  [(PTSettings *)self->_settings removeKeyObserver:self];
  [(BSDefaultObserver *)self->_defaultsObserver invalidate];
  v9 = [MEMORY[0x1E4F74230] sharedConnection];
  [v9 unregisterObserver:self];

  [(SBScreenLongevityController *)self _endMonitoringAttentionAwarenessFeaturesEnablement];
  v10.receiver = self;
  v10.super_class = (Class)SBScreenLongevityController;
  [(SBScreenLongevityController *)&v10 dealloc];
}

- (void)evaluateEnablement
{
  BOOL v3 = [(SBScreenLongevityController *)self _shouldEnable];
  [(SBScreenLongevityController *)self setEnabled:v3];
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_enabled != a3)
  {
    self->_BOOL enabled = a3;
    uint64_t v4 = SBLogScreenLongevityController();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL enabled = self->_enabled;
      *(_DWORD *)buf = 67109120;
      BOOL v10 = enabled;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "set enabled -> %{BOOL}u", buf, 8u);
    }

    if (![(SBScreenLongevitySettings *)self->_settings noOpButLogOnEnablementUpdate])
    {
      [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient setEnabled:self->_enabled];
      faceStreamAwarenessClient = self->_faceStreamAwarenessClient;
      if (faceStreamAwarenessClient)
      {
        [(SBAttentionAwarenessStreamerClient *)faceStreamAwarenessClient invalidate];
        v7 = self->_faceStreamAwarenessClient;
        self->_faceStreamAwarenessClient = 0;
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__SBScreenLongevityController_setEnabled___block_invoke;
      block[3] = &unk_1E6AF4AC0;
      void block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __42__SBScreenLongevityController_setEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 28))
  {
    if ([*(id *)(v2 + 64) isValid])
    {
      BOOL v3 = SBLogScreenLongevityController();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        __42__SBScreenLongevityController_setEnabled___block_invoke_cold_4();
      }

      [*(id *)(*(void *)(a1 + 32) + 64) invalidate];
      uint64_t v4 = *(void *)(a1 + 32);
      v5 = *(void **)(v4 + 64);
      *(void *)(v4 + 64) = 0;
LABEL_25:

      return;
    }
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = *(void *)(a1 + 32);
    BOOL v10 = *(void **)(v9 + 64);
    *(void *)(v9 + 64) = v8;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "setDelegate:");
    uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 64);
    [v11 start];
  }
  else
  {
    int v6 = [(id)v2 _isDimmed];
    uint64_t v7 = *(void *)(a1 + 32);
    if (v6)
    {
      if ([*(id *)(v7 + 72) isValid])
      {
        [*(id *)(*(void *)(a1 + 32) + 72) invalidate];
      }
      else
      {
        v14 = SBLogScreenLongevityController();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          __42__SBScreenLongevityController_setEnabled___block_invoke_cold_1();
        }
      }
      [*(id *)(a1 + 32) _undim];
    }
    else
    {
      if ([*(id *)(v7 + 64) isValid])
      {
        [*(id *)(*(void *)(a1 + 32) + 64) invalidate];
        uint64_t v12 = *(void *)(a1 + 32);
        v13 = *(void **)(v12 + 64);
        *(void *)(v12 + 64) = 0;
      }
      else
      {
        v15 = SBLogScreenLongevityController();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __42__SBScreenLongevityController_setEnabled___block_invoke_cold_3();
        }
      }
      if ([*(id *)(*(void *)(a1 + 32) + 72) isValid])
      {
        v16 = SBLogScreenLongevityController();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          __42__SBScreenLongevityController_setEnabled___block_invoke_cold_2();
        }

        [*(id *)(*(void *)(a1 + 32) + 72) invalidate];
        uint64_t v17 = *(void *)(a1 + 32);
        v5 = *(void **)(v17 + 72);
        *(void *)(v17 + 72) = 0;
        goto LABEL_25;
      }
    }
  }
}

- (void)resetTimerForReason:(id)a3
{
  if (self->_enabled) {
    [(SBScreenLongevityController *)self _clientDidResetForUserAttention:a3];
  }
}

- (BOOL)_shouldEnable
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (![(SBScreenLongevitySettings *)self->_settings overrideEnablement])
  {
    v5 = [MEMORY[0x1E4F74230] sharedConnection];
    int v6 = [v5 isAutoDimAllowed];

    int v7 = _AXSAttentionAwarenessFeaturesEnabled();
    BOOL v8 = [(SBScreenLongevityController *)self _hasCameraAttributions];
    BOOL v9 = [(SBScreenLongevityController *)self _isAutoLockSetToNever];
    BOOL v10 = [(SBScreenLongevitySettings *)self->_settings ignoreAutoLockSetToNever];
    uint64_t v4 = +[SBMediaController sharedInstance];
    int v23 = [v4 isPlaying];
    uint64_t v11 = [v4 playingMediaType];
    uint64_t v12 = v11;
    if (v11) {
      int v22 = [v11 isEqual:*MEMORY[0x1E4F77628]] ^ 1;
    }
    else {
      int v22 = 0;
    }
    v13 = +[SBIdleTimerService sharedInstance];
    int v21 = [v13 isDisabledByMediaPlayback];

    v14 = +[SBIdleTimerGlobalCoordinator sharedInstance];
    int v20 = [v14 isIdleTimerDisabled];

    BOOL v15 = [(SBScreenLongevityController *)self isUnderAutoDimThreshold];
    BOOL v16 = v15;
    int v3 = 0;
    int v17 = v6 ^ 1;
    if (!v7) {
      int v17 = 1;
    }
    if (((v17 | v8) & 1) == 0 && (!v9 || !v10))
    {
      if ((v23 & (v22 ^ 1) | v21)) {
        int v3 = 0;
      }
      else {
        int v3 = v20 & !v15;
      }
    }
    if (self->_enabled != v3 || [(SBScreenLongevitySettings *)self->_settings noisyLogging])
    {
      uint64_t v18 = SBLogScreenLongevityController();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67111424;
        int v25 = v3;
        __int16 v26 = 1024;
        int v27 = v6;
        __int16 v28 = 1024;
        BOOL v29 = v8;
        __int16 v30 = 1024;
        BOOL v31 = v9;
        __int16 v32 = 1024;
        BOOL v33 = v10;
        __int16 v34 = 1024;
        int v35 = v23;
        __int16 v36 = 1024;
        int v37 = v22;
        __int16 v38 = 1024;
        int v39 = v21;
        __int16 v40 = 1024;
        int v41 = v20;
        __int16 v42 = 1024;
        BOOL v43 = v16;
        _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "shouldEnable=%{BOOL}u, isDeviceAllowedByManagedConfiguration=%{BOOL}u, isCameraInUse=%{BOOL}u, isAutoLockDisabled=%{BOOL}u, shouldIgnoreAutoLockDisable=%{BOOL}u, isMediaNowPlaying=%{BOOL}u, isProbablyAudioOnly=%{BOOL}u, isIdleTimerDisabledByMediaPlayback=%{BOOL}u, isIdleTimerOffForAnyReason=%{BOOL}u isAutoDimThresholdPassed=%{BOOL}u", buf, 0x3Eu);
      }
    }
    goto LABEL_22;
  }
  int v3 = [(SBScreenLongevitySettings *)self->_settings enablement];
  if (self->_enabled != v3 || [(SBScreenLongevitySettings *)self->_settings noisyLogging])
  {
    uint64_t v4 = SBLogScreenLongevityController();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v25 = v3;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "shouldEnable=%{BOOL}u from override", buf, 8u);
    }
LABEL_22:
  }
  return v3;
}

- (void)_mediaNowPlayingChanged
{
  int v3 = SBLogScreenLongevityController();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Media now playing state changed", v4, 2u);
  }

  [(SBScreenLongevityController *)self evaluateEnablement];
}

- (void)_screenBacklightStateChanged
{
  int v3 = SBLogScreenLongevityController();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Screen backlight state changed", v4, 2u);
  }

  [(SBScreenLongevityController *)self evaluateEnablement];
}

- (void)_beginMonitoringAttentionAwarenessFeaturesEnablement
{
  p_attentionAwarenessFeatureMonitoringToken = &self->_attentionAwarenessFeatureMonitoringToken;
  if (!self->_attentionAwarenessFeatureMonitoringToken)
  {
    objc_initWeak(&location, self);
    int v3 = (const char *)[ (id) *MEMORY[0x1E4FB90A8] UTF8String];
    uint64_t v4 = MEMORY[0x1E4F14428];
    id v5 = MEMORY[0x1E4F14428];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __83__SBScreenLongevityController__beginMonitoringAttentionAwarenessFeaturesEnablement__block_invoke;
    v6[3] = &unk_1E6B0E930;
    objc_copyWeak(&v7, &location);
    notify_register_dispatch(v3, p_attentionAwarenessFeatureMonitoringToken, v4, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __83__SBScreenLongevityController__beginMonitoringAttentionAwarenessFeaturesEnablement__block_invoke(uint64_t a1)
{
  uint64_t v2 = SBLogScreenLongevityController();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Attention awarenesss feature enablement changed", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained evaluateEnablement];
}

- (void)_endMonitoringAttentionAwarenessFeaturesEnablement
{
  int attentionAwarenessFeatureMonitoringToken = self->_attentionAwarenessFeatureMonitoringToken;
  if (attentionAwarenessFeatureMonitoringToken)
  {
    notify_cancel(attentionAwarenessFeatureMonitoringToken);
    self->_int attentionAwarenessFeatureMonitoringToken = 0;
  }
}

- (BOOL)_hasCameraAttributions
{
  uint64_t v2 = [(id)SBApp sensorActivityDataProvider];
  int v3 = [v2 activeCameraAndMicrophoneActivityAttributions];
  uint64_t v4 = objc_msgSend(v3, "bs_filter:", &__block_literal_global_25_3);

  LOBYTE(v2) = [v4 count] != 0;
  return (char)v2;
}

BOOL __53__SBScreenLongevityController__hasCameraAttributions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 sensor] == 0;
}

- (BOOL)_isAutoLockSetToNever
{
  uint64_t v2 = +[SBIdleTimerGlobalStateMonitor sharedInstance];
  int v3 = [v2 autoLockTimeout];

  LOBYTE(v2) = [v3 intValue] == 0x7FFFFFFF;
  return (char)v2;
}

- (void)_dim
{
  if (self->_enabled) {
    [(SBScreenLongevityController *)self _toggleBacklightAdaptiveDimming:1];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SBScreenLongevityController__dim__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __35__SBScreenLongevityController__dim__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 64) isValid])
  {
    [*(id *)(*(void *)(a1 + 32) + 64) invalidate];
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = *(void **)(v2 + 64);
    *(void *)(v2 + 64) = 0;
  }
}

- (void)_undim
{
  [(SBScreenLongevityController *)self _toggleBacklightAdaptiveDimming:0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SBScreenLongevityController__undim__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __37__SBScreenLongevityController__undim__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 72) isValid])
  {
    [*(id *)(*(void *)(a1 + 32) + 72) invalidate];
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = *(void **)(v2 + 72);
    *(void *)(v2 + 72) = 0;
  }
}

- (void)_toggleBacklightAdaptiveDimming:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v5 = SBLogScreenLongevityController();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Back light adaptive dimming enable -> %u", (uint8_t *)v6, 8u);
  }

  [(SBScreenLongevityController *)self setAdaptiveDimmingEnabled:v3];
}

- (void)_checkFaceAttentionAwareness
{
  faceStreamAwarenessClient = self->_faceStreamAwarenessClient;
  if (faceStreamAwarenessClient)
  {
    [(SBAttentionAwarenessStreamerClient *)faceStreamAwarenessClient invalidate];
    uint64_t v4 = self->_faceStreamAwarenessClient;
    self->_faceStreamAwarenessClient = 0;
  }
  id v5 = objc_alloc_init(SBAttentionAwarenessStreamerClient);
  int v6 = self->_faceStreamAwarenessClient;
  self->_faceStreamAwarenessClient = v5;

  [(SBAttentionAwarenessStreamerClient *)self->_faceStreamAwarenessClient setDelegate:self];
  uint64_t v7 = self->_faceStreamAwarenessClient;
  BOOL v8 = [(SBScreenLongevityController *)self faceStreamAwarenessConfiguration];
  [(SBAttentionAwarenessStreamerClient *)v7 setConfiguration:v8];

  BOOL v9 = self->_faceStreamAwarenessClient;
  [(SBAttentionAwarenessStreamerClient *)v9 resume];
}

- (id)faceStreamAwarenessConfiguration
{
  faceStreamAwarenessConfiguration = self->_faceStreamAwarenessConfiguration;
  if (!faceStreamAwarenessConfiguration)
  {
    uint64_t v4 = (AWAttentionAwarenessConfiguration *)objc_alloc_init(MEMORY[0x1E4F4E708]);
    id v5 = self->_faceStreamAwarenessConfiguration;
    self->_faceStreamAwarenessConfiguration = v4;

    [(AWAttentionAwarenessConfiguration *)self->_faceStreamAwarenessConfiguration setContinuousFaceDetectMode:1];
    [(AWAttentionAwarenessConfiguration *)self->_faceStreamAwarenessConfiguration setUnityStream:1];
    [(AWAttentionAwarenessConfiguration *)self->_faceStreamAwarenessConfiguration setIdentifier:@"screen-longevity-face-stream"];
    faceStreamAwarenessConfiguration = self->_faceStreamAwarenessConfiguration;
  }
  return faceStreamAwarenessConfiguration;
}

- (void)_observeDefaults
{
  v16[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[SBDefaults localDefaults];
  uint64_t v4 = [v3 screenLongevityDefaults];

  objc_initWeak(&location, self);
  id v5 = [NSString stringWithUTF8String:"dimInterval"];
  v16[0] = v5;
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v7 = MEMORY[0x1E4F14428];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __47__SBScreenLongevityController__observeDefaults__block_invoke;
  v13 = &unk_1E6AF4B10;
  objc_copyWeak(&v14, &location);
  BOOL v8 = [v4 observeDefaults:v6 onQueue:MEMORY[0x1E4F14428] withBlock:&v10];
  defaultsObserver = self->_defaultsObserver;
  self->_defaultsObserver = v8;

  [(SBScreenLongevityController *)self _updateCachedDefaults];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __47__SBScreenLongevityController__observeDefaults__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateCachedDefaults];
}

- (void)_updateCachedDefaults
{
  BOOL v3 = +[SBDefaults localDefaults];
  id v5 = [v3 screenLongevityDefaults];

  settings = self->_settings;
  [v5 dimInterval];
  -[SBScreenLongevitySettings setDimInterval:](settings, "setDimInterval:");
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (self->_settings == a3)
  {
    uint64_t v10 = v6;
    if (([v6 isEqualToString:@"ignoreAutoLockSetToNever"] & 1) != 0
      || ([v10 isEqualToString:@"overrideEnablement"] & 1) != 0
      || [v10 isEqualToString:@"enablement"])
    {
      [(SBScreenLongevityController *)self evaluateEnablement];
LABEL_6:
      id v7 = v10;
      goto LABEL_7;
    }
    int v8 = [v10 isEqualToString:@"touchAttentionLostTimeout"];
    id v7 = v10;
    if (v8)
    {
      [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient setEnabled:0];
      idleTouchAwarenessConfiguration = self->_idleTouchAwarenessConfiguration;
      [(SBScreenLongevitySettings *)self->_settings touchAttentionLostTimeout];
      [(AWAttentionAwarenessConfiguration *)idleTouchAwarenessConfiguration setAttentionLostTimeout:"setAttentionLostTimeout:"];
      [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient setConfiguration:self->_idleTouchAwarenessConfiguration];
      [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient setEnabled:1];
      goto LABEL_6;
    }
  }
LABEL_7:
}

- (void)activityDidChangeForSensorActivityDataProvider:(id)a3
{
  uint64_t v4 = SBLogScreenLongevityController();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Sensor activity updated", v5, 2u);
  }

  [(SBScreenLongevityController *)self evaluateEnablement];
}

- (void)_startDimTimer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SBScreenLongevityController__startDimTimer__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __45__SBScreenLongevityController__startDimTimer__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 64) isValid];
  if ((result & 1) == 0)
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 64);
    *(void *)(v4 + 64) = v3;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "setDelegate:");
    id v6 = *(void **)(*(void *)(a1 + 32) + 64);
    return [v6 start];
  }
  return result;
}

- (void)client:(id)a3 attentionLostTimeoutDidExpire:(double)a4 forConfigurationGeneration:(unint64_t)a5 withAssociatedObject:(id)a6
{
  BOOL v9 = (SBAttentionAwarenessClient *)a3;
  id v8 = a6;
  if (self->_enabled && self->_idleTouchAwarenessClient == v9) {
    [(SBScreenLongevityController *)self _startDimTimer];
  }
}

- (void)_clientDidResetForUserAttention:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogScreenLongevityController();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Reset for user attention: %@", buf, 0xCu);
  }

  if ([(SBScreenLongevityController *)self _isDimmed]) {
    [(SBScreenLongevityController *)self _undim];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SBScreenLongevityController__clientDidResetForUserAttention___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __63__SBScreenLongevityController__clientDidResetForUserAttention___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 64);
  if (v2)
  {
    if (![v2 isValid]) {
      goto LABEL_7;
    }
    [*(id *)(*(void *)(a1 + 32) + 64) elapsedTime];
    if (v3 <= 1.0) {
      goto LABEL_7;
    }
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 64);
  }
  if ([v2 isValid])
  {
    [*(id *)(*(void *)(a1 + 32) + 64) invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 64);
    *(void *)(v4 + 64) = 0;
  }
LABEL_7:
  if ([*(id *)(*(void *)(a1 + 32) + 72) isValid])
  {
    [*(id *)(*(void *)(a1 + 32) + 72) invalidate];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 72);
    *(void *)(v6 + 72) = 0;
  }
}

- (void)clientDidResetForUserAttention:(id)a3 withEvent:(id)a4
{
  uint64_t v9 = (SBAttentionAwarenessClient *)a3;
  id v6 = a4;
  if (self->_enabled && self->_idleTouchAwarenessClient == v9)
  {
    id v7 = [(SBAttentionAwarenessClient *)v9 configuration];
    id v8 = [v7 identifier];
    [(SBScreenLongevityController *)self _clientDidResetForUserAttention:v8];
  }
}

- (void)streamerClientDidResetForUserAttention:(id)a3
{
  uint64_t v4 = (SBAttentionAwarenessStreamerClient *)a3;
  if (self->_enabled && self->_faceStreamAwarenessClient == v4)
  {
    id v7 = v4;
    id v5 = [(SBAttentionAwarenessStreamerClient *)v4 configuration];
    id v6 = [v5 identifier];
    [(SBScreenLongevityController *)self _clientDidResetForUserAttention:v6];

    [(SBScreenLongevityController *)self _startDimTimer];
    uint64_t v4 = v7;
  }
}

- (void)dimTimerDidExpireForTimer:(id)a3
{
  if (![(SBScreenLongevityController *)self _isDimmed]) {
    [(SBScreenLongevityController *)self _dim];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SBScreenLongevityController_dimTimerDidExpireForTimer___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __57__SBScreenLongevityController_dimTimerDidExpireForTimer___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 64) isValid])
  {
    uint64_t v2 = SBLogScreenLongevityController();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "Dim timer remains valid after expire", (uint8_t *)buf, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 64) invalidate];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = 0;

  if ([*(id *)(*(void *)(a1 + 32) + 72) isValid])
  {
    id v5 = SBLogScreenLongevityController();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __57__SBScreenLongevityController_dimTimerDidExpireForTimer___block_invoke_cold_1();
    }

    [*(id *)(*(void *)(a1 + 32) + 72) invalidate];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 72);
    *(void *)(v6 + 72) = 0;
  }
  if (!*(void *)(*(void *)(a1 + 32) + 72))
  {
    id v8 = SBLogScreenLongevityController();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Start undim timer", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, *(id *)(a1 + 32));
    [*(id *)(*(void *)(a1 + 32) + 72) invalidate];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 72);
    *(void *)(v9 + 72) = 0;

    uint64_t v11 = (void *)MEMORY[0x1E4F1CB00];
    [*(id *)(*(void *)(a1 + 32) + 8) undimFaceDetectionInterval];
    double v13 = v12;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __57__SBScreenLongevityController_dimTimerDidExpireForTimer___block_invoke_48;
    v17[3] = &unk_1E6AF61A0;
    objc_copyWeak(&v18, buf);
    uint64_t v14 = [v11 scheduledTimerWithTimeInterval:1 repeats:v17 block:v13];
    uint64_t v15 = *(void *)(a1 + 32);
    BOOL v16 = *(void **)(v15 + 72);
    *(void *)(v15 + 72) = v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(buf);
  }
}

void __57__SBScreenLongevityController_dimTimerDidExpireForTimer___block_invoke_48(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  LODWORD(v2) = [WeakRetained _isValidCurrentTimer:v3];

  if (v2) {
    [WeakRetained _checkFaceAttentionAwareness];
  }
}

- (BOOL)_isValidCurrentTimer:(id)a3
{
  if (self->_undimTimer == a3) {
    return [a3 isValid];
  }
  else {
    return 0;
  }
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v5 = SBLogScreenLongevityController();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Management configuration profile settings updated", v6, 2u);
  }

  [(SBScreenLongevityController *)self evaluateEnablement];
}

- (void)setAdaptiveDimmingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = (id)[objc_alloc(NSNumber) initWithInt:a3];
  id v5 = objc_alloc(NSNumber);
  settings = self->_settings;
  if (v3) {
    [(SBScreenLongevitySettings *)settings dimmingAnimationLength];
  }
  else {
    [(SBScreenLongevitySettings *)settings undimmingAnimationLength];
  }
  *(float *)&double v7 = v7;
  id v8 = (void *)[v5 initWithFloat:v7];
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v10, @"AmbientAdaptiveDimmingEnable", v8, @"AmbientAdaptiveDimmingPeriod", 0);
  [(BrightnessSystemClient *)self->_brightnessSystemClient setProperty:v9 forKey:@"AmbientAdaptiveDimming"];
}

- (BOOL)isAdaptiveDimmingEnabled
{
  uint64_t v2 = (void *)[(BrightnessSystemClient *)self->_brightnessSystemClient copyPropertyForKey:@"AmbientAdaptiveDimming"];
  BOOL v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 objectForKey:@"AmbientAdaptiveDimmingEnable"];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isUnderAutoDimThreshold
{
  uint64_t v2 = (void *)[(BrightnessSystemClient *)self->_brightnessSystemClient copyPropertyForKey:@"CBBrightnessIsUnderAutoDimThreshold"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
  objc_storeStrong((id *)&self->_undimTimer, 0);
  objc_storeStrong((id *)&self->_dimTimer, 0);
  objc_storeStrong((id *)&self->_idleTouchAwarenessClient, 0);
  objc_storeStrong((id *)&self->_idleTouchAwarenessConfiguration, 0);
  objc_storeStrong((id *)&self->_faceStreamAwarenessClient, 0);
  objc_storeStrong((id *)&self->_faceStreamAwarenessConfiguration, 0);
  objc_storeStrong((id *)&self->_defaultsObserver, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

void __42__SBScreenLongevityController_setEnabled___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1D85BA000, v0, v1, "In dimmed state without a valid undim timer", v2, v3, v4, v5, v6);
}

void __42__SBScreenLongevityController_setEnabled___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1D85BA000, v0, v1, "In undimmed state with a valid undim timer", v2, v3, v4, v5, v6);
}

void __42__SBScreenLongevityController_setEnabled___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1D85BA000, v0, v1, "In undimmed state without a valid dim timer", v2, v3, v4, v5, v6);
}

void __42__SBScreenLongevityController_setEnabled___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1D85BA000, v0, v1, "Enable, old dim timer still valid", v2, v3, v4, v5, v6);
}

void __57__SBScreenLongevityController_dimTimerDidExpireForTimer___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1D85BA000, v0, v1, "Dim timer expire with a valid undim timer", v2, v3, v4, v5, v6);
}

@end