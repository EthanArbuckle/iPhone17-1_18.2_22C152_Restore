@interface NACVolumeControllerProxy
- (BOOL)isMuted;
- (BOOL)isProminentHapticEnabled;
- (BOOL)isSystemMuted;
- (BOOL)isVolumeControlAvailable;
- (BOOL)isVolumeWarningEnabled;
- (NACVolumeControllerDelegate)delegate;
- (NACVolumeControllerProxy)initWithVolumeControlTarget:(id)a3;
- (NSOrderedSet)availableListeningModes;
- (NSString)currentListeningMode;
- (float)EUVolumeLimit;
- (float)hapticIntensity;
- (float)volumeValue;
- (id)_scheduleTimeoutWithBlock:(id)a3;
- (int64_t)hapticState;
- (int64_t)volumeWarningState;
- (void)_EUVolumeLimitDidChange;
- (void)_applicationDidBecomeActiveNotification:(id)a3;
- (void)_applicationWillResignActiveNotification:(id)a3;
- (void)_availableListeningModesDidChange;
- (void)_cancelSetHapticStateTimer;
- (void)_cancelSetHapticTimer;
- (void)_cancelSetProminentHapticTimer;
- (void)_cancelSetVolumeTimer;
- (void)_currentListeningModeDidChange;
- (void)_handleFailedToSetCurrentListeningModeNotification:(id)a3;
- (void)_hapticIntensityDidChange;
- (void)_hapticStateDidChange;
- (void)_hapticStateTimeout;
- (void)_hapticTimeout;
- (void)_mutedStateDidChange;
- (void)_notifyDelegateHapticChanged;
- (void)_notifyDelegateHapticStateChanged;
- (void)_notifyDelegateProminentHapticStateChanged;
- (void)_notifyDelegateSystemMutedStateChanged;
- (void)_notifyDelegateVolumeChanged;
- (void)_prominentHapticStateDidChange;
- (void)_prominentHapticTimeout;
- (void)_setHapticIntensity:(id)a3;
- (void)_setVolumeValue:(id)a3;
- (void)_systemMutedStateDidChange;
- (void)_volumeControlAvailabilityDidChange;
- (void)_volumeValueDidChange;
- (void)_volumeWarningDidChange;
- (void)beginObservingListeningModes;
- (void)beginObservingVolume;
- (void)dealloc;
- (void)endObservingListeningModes;
- (void)endObservingVolume;
- (void)setCurrentListeningMode:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHapticIntensity:(float)a3;
- (void)setHapticState:(int64_t)a3;
- (void)setMuted:(BOOL)a3;
- (void)setProminentHapticEnabled:(BOOL)a3;
- (void)setSystemMuted:(BOOL)a3;
- (void)setVolumeValue:(float)a3;
- (void)setVolumeValue:(float)a3 muted:(BOOL)a4 overrideEULimit:(BOOL)a5;
@end

@implementation NACVolumeControllerProxy

- (NACVolumeControllerProxy)initWithVolumeControlTarget:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NACVolumeControllerProxy;
  v6 = [(NACVolumeControllerProxy *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_target, a3);
    uint64_t v8 = +[NACXPCClient sharedClient];
    xpcClient = v7->_xpcClient;
    v7->_xpcClient = (NACXPCClient *)v8;

    objc_initWeak(&location, v7);
    uint64_t v10 = objc_opt_new();
    volumeThrottler = v7->_volumeThrottler;
    v7->_volumeThrottler = (NACEventThrottler *)v10;

    [(NACEventThrottler *)v7->_volumeThrottler setMinimumDelay:0.35];
    v12 = v7->_volumeThrottler;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __56__NACVolumeControllerProxy_initWithVolumeControlTarget___block_invoke;
    v20[3] = &unk_264CFC730;
    objc_copyWeak(&v21, &location);
    [(NACEventThrottler *)v12 setEventBlock:v20];
    uint64_t v13 = objc_opt_new();
    hapticThrottler = v7->_hapticThrottler;
    v7->_hapticThrottler = (NACEventThrottler *)v13;

    [(NACEventThrottler *)v7->_hapticThrottler setMinimumDelay:0.5];
    v15 = v7->_hapticThrottler;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __56__NACVolumeControllerProxy_initWithVolumeControlTarget___block_invoke_2;
    v18[3] = &unk_264CFC730;
    objc_copyWeak(&v19, &location);
    [(NACEventThrottler *)v15 setEventBlock:v18];
    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:v7 selector:sel__applicationDidBecomeActiveNotification_ name:*MEMORY[0x263F1D038] object:0];
    [v16 addObserver:v7 selector:sel__applicationWillResignActiveNotification_ name:*MEMORY[0x263F1D0D8] object:0];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __56__NACVolumeControllerProxy_initWithVolumeControlTarget___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setVolumeValue:v3];
}

void __56__NACVolumeControllerProxy_initWithVolumeControlTarget___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setHapticIntensity:v3];
}

- (void)dealloc
{
  [(NACVolumeControllerProxy *)self setDelegate:0];
  [(NACVolumeControllerProxy *)self endObservingVolume];
  [(NACVolumeControllerProxy *)self endObservingListeningModes];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NACVolumeControllerProxy;
  [(NACVolumeControllerProxy *)&v4 dealloc];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!obj || WeakRetained)
  {
    if (!obj)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
    }
  }
  else
  {
    id v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)_NACVolumeValueDidChangeNotification, @"NACVolumeValueDidChangeNotification", 0, (CFNotificationSuspensionBehavior)0);
    CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)_NACVolumeControlAvailabilityDidChangeNotification, @"NACVolumeControlAvailabilityDidChangeNotification", 0, (CFNotificationSuspensionBehavior)0);
    CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)_NACMutedStateDidChangeNotification, @"NACMutedStateDidChangeNotificaton", 0, (CFNotificationSuspensionBehavior)0);
    CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)_NACHapticIntensityDidChangeNotification, @"NACHapticIntensityDidChangeNotification", 0, (CFNotificationSuspensionBehavior)0);
    CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)_NACEUVolumeLimitDidChangeNotification, @"NACEULimitDidChangeNotification", 0, (CFNotificationSuspensionBehavior)0);
    CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)_NACVolumeWarningDidChangeNotification, @"NACVolumeWarningDidChangeNotification", 0, (CFNotificationSuspensionBehavior)0);
    CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)_NACSystemMutedStateDidChangeNotification, @"NACSystemMutedStateDidChangeNotification", 0, (CFNotificationSuspensionBehavior)0);
    CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)_NACProminentHapticStateDidChangeNotification, @"NACProminentHapticStateDidChangeNotification", 0, (CFNotificationSuspensionBehavior)0);
    CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)_NACHapticStateDidChangeNotification, @"NACHapticStateDidChangeNotification", 0, (CFNotificationSuspensionBehavior)0);
    CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)_NACAvailableListeningModesDidChangeNotification, @"NACAvailableListeningModesDidChangeNotification", 0, (CFNotificationSuspensionBehavior)0);
    CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)_NACCurrentListeningModeDidChangeNotification, @"NACCurrentListeningModeDidChangeNotification", 0, (CFNotificationSuspensionBehavior)0);
    v6 = [MEMORY[0x263F087C8] defaultCenter];
    [v6 addObserver:self selector:sel__handleFailedToSetCurrentListeningModeNotification_ name:@"NACFailedToSetCurrentListeningModeNotification" object:0 suspensionBehavior:4];

    [(NACVolumeControllerProxy *)self _volumeControlAvailabilityDidChange];
    [(NACVolumeControllerProxy *)self _volumeValueDidChange];
    [(NACVolumeControllerProxy *)self _mutedStateDidChange];
    [(NACVolumeControllerProxy *)self _systemMutedStateDidChange];
    [(NACVolumeControllerProxy *)self _hapticStateDidChange];
    [(NACVolumeControllerProxy *)self _volumeWarningDidChange];
    [(NACVolumeControllerProxy *)self _EUVolumeLimitDidChange];
    [(NACVolumeControllerProxy *)self _availableListeningModesDidChange];
    [(NACVolumeControllerProxy *)self _currentListeningModeDidChange];
    [(NACVolumeControllerProxy *)self _prominentHapticStateDidChange];
    [(NACVolumeControllerProxy *)self _hapticIntensityDidChange];
  }
  objc_storeWeak((id *)&self->_delegate, obj);
}

- (void)beginObservingVolume
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!self->_observingVolume)
  {
    id v3 = [MEMORY[0x263F1C408] sharedApplication];
    uint64_t v4 = [v3 applicationState];

    if (!v4)
    {
      id v5 = NMLogForCategory(4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        target = self->_target;
        int v7 = 138412290;
        uint64_t v8 = target;
        _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "VolumeControllerProxy begin observing volume for target: %@", (uint8_t *)&v7, 0xCu);
      }

      [(NACXPCClient *)self->_xpcClient beginObservingVolumeForTarget:self->_target];
    }
    self->_observingVolume = 1;
  }
}

- (void)endObservingVolume
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (self->_observingVolume)
  {
    id v3 = [MEMORY[0x263F1C408] sharedApplication];
    uint64_t v4 = [v3 applicationState];

    if (!v4)
    {
      id v5 = NMLogForCategory(4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        target = self->_target;
        int v7 = 138412290;
        uint64_t v8 = target;
        _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "VolumeControllerProxy end observing volume for target: %@", (uint8_t *)&v7, 0xCu);
      }

      [(NACXPCClient *)self->_xpcClient endObservingVolumeForTarget:self->_target];
    }
    self->_observingVolume = 0;
  }
}

- (void)beginObservingListeningModes
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!self->_observingListeningModes)
  {
    id v3 = [MEMORY[0x263F1C408] sharedApplication];
    uint64_t v4 = [v3 applicationState];

    if (!v4)
    {
      id v5 = NMLogForCategory(4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        target = self->_target;
        int v7 = 138412290;
        uint64_t v8 = target;
        _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "VolumeControllerProxy begin observing listening modes for target: %@", (uint8_t *)&v7, 0xCu);
      }

      [(NACXPCClient *)self->_xpcClient beginObservingListeningModesForTarget:self->_target];
    }
    self->_observingListeningModes = 1;
  }
}

- (void)endObservingListeningModes
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (self->_observingListeningModes)
  {
    id v3 = [MEMORY[0x263F1C408] sharedApplication];
    uint64_t v4 = [v3 applicationState];

    if (!v4)
    {
      id v5 = NMLogForCategory(4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        target = self->_target;
        int v7 = 138412290;
        uint64_t v8 = target;
        _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "VolumeControllerProxy end observing listening modes for target: %@", (uint8_t *)&v7, 0xCu);
      }

      [(NACXPCClient *)self->_xpcClient endObservingListeningModesForTarget:self->_target];
    }
    self->_observingListeningModes = 0;
  }
}

- (void)setVolumeValue:(float)a3 muted:(BOOL)a4 overrideEULimit:(BOOL)a5
{
  BOOL v5 = a4;
  -[NACVolumeControllerProxy setVolumeValue:](self, "setVolumeValue:", a4, a5);

  [(NACVolumeControllerProxy *)self setMuted:v5];
}

- (float)volumeValue
{
  [(NSNumber *)self->_volumeValue floatValue];
  return result;
}

- (void)setVolumeValue:(float)a3
{
  objc_msgSend(NSNumber, "numberWithFloat:");
  uint64_t v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  volumeValue = self->_volumeValue;
  self->_volumeValue = v4;

  volumeThrottler = self->_volumeThrottler;
  int v7 = self->_volumeValue;

  [(NACEventThrottler *)volumeThrottler setValue:v7];
}

- (void)_setVolumeValue:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 floatValue];
  float v6 = v5;
  int v7 = NMLogForCategory(4);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    target = self->_target;
    *(_DWORD *)buf = 134218242;
    double v15 = v6;
    __int16 v16 = 2112;
    v17 = target;
    _os_log_impl(&dword_237CD4000, v7, OS_LOG_TYPE_DEFAULT, "Setting volume: %f for target: %@", buf, 0x16u);
  }

  *(float *)&double v9 = v6;
  [(NACXPCClient *)self->_xpcClient setVolumeValue:self->_target forTarget:v9];
  [(NACVolumeControllerProxy *)self _cancelSetVolumeTimer];
  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__NACVolumeControllerProxy__setVolumeValue___block_invoke;
  v12[3] = &unk_264CFC518;
  objc_copyWeak(&v13, (id *)buf);
  uint64_t v10 = [(NACVolumeControllerProxy *)self _scheduleTimeoutWithBlock:v12];
  setVolumeTimer = self->_setVolumeTimer;
  self->_setVolumeTimer = v10;

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __44__NACVolumeControllerProxy__setVolumeValue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _volumeTimout];
}

- (void)setMuted:(BOOL)a3
{
}

- (float)hapticIntensity
{
  [(NSNumber *)self->_hapticIntensity floatValue];
  return result;
}

- (void)setHapticIntensity:(float)a3
{
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  hapticIntensity = self->_hapticIntensity;
  self->_hapticIntensity = v4;

  hapticThrottler = self->_hapticThrottler;
  int v7 = self->_hapticIntensity;

  [(NACEventThrottler *)hapticThrottler setValue:v7];
}

- (void)setSystemMuted:(BOOL)a3
{
  self->_systemMuted = a3;
  -[NACXPCClient setSystemMuted:](self->_xpcClient, "setSystemMuted:");
}

- (void)setProminentHapticEnabled:(BOOL)a3
{
  self->_prominentHapticEnabled = a3;
  -[NACXPCClient setProminentHapticEnabled:](self->_xpcClient, "setProminentHapticEnabled:");
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__NACVolumeControllerProxy_setProminentHapticEnabled___block_invoke;
  v6[3] = &unk_264CFC518;
  objc_copyWeak(&v7, &location);
  id v4 = [(NACVolumeControllerProxy *)self _scheduleTimeoutWithBlock:v6];
  setProminentHapticTimer = self->_setProminentHapticTimer;
  self->_setProminentHapticTimer = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __54__NACVolumeControllerProxy_setProminentHapticEnabled___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _prominentHapticTimeout];
}

- (void)_prominentHapticTimeout
{
  BOOL lastReceivedProminentHapticEnabled = self->_lastReceivedProminentHapticEnabled;
  if (self->_prominentHapticEnabled != lastReceivedProminentHapticEnabled)
  {
    self->_prominentHapticEnabled = lastReceivedProminentHapticEnabled;
    [(NACVolumeControllerProxy *)self _notifyDelegateProminentHapticStateChanged];
  }

  [(NACVolumeControllerProxy *)self _cancelSetProminentHapticTimer];
}

- (void)_setHapticIntensity:(id)a3
{
  id v4 = a3;
  [v4 floatValue];
  -[NACXPCClient setHapticIntensity:](self->_xpcClient, "setHapticIntensity:");
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__NACVolumeControllerProxy__setHapticIntensity___block_invoke;
  v7[3] = &unk_264CFC518;
  objc_copyWeak(&v8, &location);
  float v5 = [(NACVolumeControllerProxy *)self _scheduleTimeoutWithBlock:v7];
  setHapticTimer = self->_setHapticTimer;
  self->_setHapticTimer = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __48__NACVolumeControllerProxy__setHapticIntensity___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hapticTimeout];
}

- (void)_hapticTimeout
{
  [(NSNumber *)self->_hapticIntensity floatValue];
  if (v3 != self->_lastRecievedHapticIntensity)
  {
    objc_msgSend(NSNumber, "numberWithFloat:");
    id v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    hapticIntensity = self->_hapticIntensity;
    self->_hapticIntensity = v4;

    [(NACVolumeControllerProxy *)self _notifyDelegateHapticChanged];
  }

  [(NACVolumeControllerProxy *)self _cancelSetHapticTimer];
}

- (void)setHapticState:(int64_t)a3
{
  if (self->_hapticState != a3)
  {
    self->_hapticState = a3;
    -[NACXPCClient setHapticState:](self->_xpcClient, "setHapticState:");
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __43__NACVolumeControllerProxy_setHapticState___block_invoke;
    v6[3] = &unk_264CFC518;
    objc_copyWeak(&v7, &location);
    id v4 = [(NACVolumeControllerProxy *)self _scheduleTimeoutWithBlock:v6];
    setHapticStateTimer = self->_setHapticStateTimer;
    self->_setHapticStateTimer = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __43__NACVolumeControllerProxy_setHapticState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hapticStateTimeout];
}

- (void)_hapticStateTimeout
{
  int64_t lastReceivedHapticState = self->_lastReceivedHapticState;
  if (self->_hapticState != lastReceivedHapticState)
  {
    self->_hapticState = lastReceivedHapticState;
    [(NACVolumeControllerProxy *)self _notifyDelegateHapticStateChanged];
  }

  [(NACVolumeControllerProxy *)self _cancelSetHapticStateTimer];
}

- (NSOrderedSet)availableListeningModes
{
  return self->_availableListeningModes;
}

- (NSString)currentListeningMode
{
  return self->_currentListeningMode;
}

- (void)setCurrentListeningMode:(id)a3
{
  float v6 = (NSString *)a3;
  id v4 = self->_currentListeningMode;
  if (v4 == v6)
  {
  }
  else
  {
    char v5 = [(NSString *)v6 isEqual:v4];

    if ((v5 & 1) == 0) {
      [(NACXPCClient *)self->_xpcClient setCurrentListeningMode:v6 forTarget:self->_target];
    }
  }
}

- (void)_volumeValueDidChange
{
  xpcClient = self->_xpcClient;
  target = self->_target;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__NACVolumeControllerProxy__volumeValueDidChange__block_invoke;
  v4[3] = &unk_264CFC9A8;
  v4[4] = self;
  [(NACXPCClient *)xpcClient volumeValueForTarget:target result:v4];
}

void __49__NACVolumeControllerProxy__volumeValueDidChange__block_invoke(uint64_t a1, float a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __49__NACVolumeControllerProxy__volumeValueDidChange__block_invoke_2;
  v2[3] = &unk_264CFC478;
  float v3 = a2;
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

void *__49__NACVolumeControllerProxy__volumeValueDidChange__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = NMLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = *(float *)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    int v12 = 134218242;
    double v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    _os_log_impl(&dword_237CD4000, v2, OS_LOG_TYPE_DEFAULT, "Received volume value update: %f for target: %@", (uint8_t *)&v12, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  float result = *(void **)(v6 + 96);
  if (result)
  {
    float v8 = *(float *)(a1 + 40);
    float result = (void *)[result floatValue];
    if (vabds_f32(v8, *(float *)&v5) < 0.00000011921) {
      return result;
    }
    uint64_t v6 = *(void *)(a1 + 32);
  }
  if (!*(void *)(v6 + 32))
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 40);
    uint64_t v9 = [NSNumber numberWithFloat:v5];
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(v10 + 96);
    *(void *)(v10 + 96) = v9;

    return (void *)[*(id *)(a1 + 32) _notifyDelegateVolumeChanged];
  }
  return result;
}

- (void)_volumeControlAvailabilityDidChange
{
  xpcClient = self->_xpcClient;
  target = self->_target;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__NACVolumeControllerProxy__volumeControlAvailabilityDidChange__block_invoke;
  v4[3] = &unk_264CFC9D0;
  v4[4] = self;
  [(NACXPCClient *)xpcClient volumeControlAvailabilityForTarget:target result:v4];
}

void __63__NACVolumeControllerProxy__volumeControlAvailabilityDidChange__block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __63__NACVolumeControllerProxy__volumeControlAvailabilityDidChange__block_invoke_2;
  v2[3] = &unk_264CFC4A0;
  v2[4] = *(void *)(a1 + 32);
  char v3 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

void __63__NACVolumeControllerProxy__volumeControlAvailabilityDidChange__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 129) != v2)
  {
    *(unsigned char *)(v1 + 129) = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
      [v6 volumeControllerDidUpdateVolumeControlAvailibility:*(void *)(a1 + 32)];
    }
  }
}

- (void)_mutedStateDidChange
{
  xpcClient = self->_xpcClient;
  target = self->_target;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__NACVolumeControllerProxy__mutedStateDidChange__block_invoke;
  v4[3] = &unk_264CFC9D0;
  v4[4] = self;
  [(NACXPCClient *)xpcClient mutedStateForTarget:target result:v4];
}

void __48__NACVolumeControllerProxy__mutedStateDidChange__block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __48__NACVolumeControllerProxy__mutedStateDidChange__block_invoke_2;
  v2[3] = &unk_264CFC4A0;
  v2[4] = *(void *)(a1 + 32);
  char v3 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

void __48__NACVolumeControllerProxy__mutedStateDidChange__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 131) != v2)
  {
    *(unsigned char *)(v1 + 131) = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
      [v6 volumeControllerDidUpdateMutedState:*(void *)(a1 + 32)];
    }
  }
}

- (void)_hapticIntensityDidChange
{
  xpcClient = self->_xpcClient;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__NACVolumeControllerProxy__hapticIntensityDidChange__block_invoke;
  v3[3] = &unk_264CFC9A8;
  v3[4] = self;
  [(NACXPCClient *)xpcClient hapticIntensity:v3];
}

void __53__NACVolumeControllerProxy__hapticIntensityDidChange__block_invoke(uint64_t a1, float a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __53__NACVolumeControllerProxy__hapticIntensityDidChange__block_invoke_2;
  v2[3] = &unk_264CFC478;
  v2[4] = *(void *)(a1 + 32);
  float v3 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

void *__53__NACVolumeControllerProxy__hapticIntensityDidChange__block_invoke_2(uint64_t a1, double a2)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 76) = *(_DWORD *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  float result = *(void **)(v3 + 104);
  if (result)
  {
    float v5 = *(float *)(a1 + 40);
    float result = (void *)[result floatValue];
    if (vabds_f32(v5, *(float *)&a2) < 0.00000011921) {
      return result;
    }
    uint64_t v3 = *(void *)(a1 + 32);
  }
  if (!*(void *)(v3 + 40))
  {
    LODWORD(a2) = *(_DWORD *)(a1 + 40);
    uint64_t v6 = [NSNumber numberWithFloat:a2];
    uint64_t v7 = *(void *)(a1 + 32);
    float v8 = *(void **)(v7 + 104);
    *(void *)(v7 + 104) = v6;

    uint64_t v9 = *(void **)(a1 + 32);
    return (void *)[v9 _notifyDelegateHapticChanged];
  }
  return result;
}

- (void)_prominentHapticStateDidChange
{
  xpcClient = self->_xpcClient;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__NACVolumeControllerProxy__prominentHapticStateDidChange__block_invoke;
  v3[3] = &unk_264CFC9D0;
  v3[4] = self;
  [(NACXPCClient *)xpcClient prominentHapticEnabled:v3];
}

void __58__NACVolumeControllerProxy__prominentHapticStateDidChange__block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __58__NACVolumeControllerProxy__prominentHapticStateDidChange__block_invoke_2;
  v2[3] = &unk_264CFC4A0;
  v2[4] = *(void *)(a1 + 32);
  char v3 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __58__NACVolumeControllerProxy__prominentHapticStateDidChange__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 80) = *(unsigned char *)(result + 40);
  uint64_t v1 = *(void *)(result + 32);
  if (!*(void *)(v1 + 48))
  {
    *(unsigned char *)(v1 + 133) = *(unsigned char *)(result + 40);
    return [*(id *)(result + 32) _notifyDelegateProminentHapticStateChanged];
  }
  return result;
}

- (void)_hapticStateDidChange
{
  xpcClient = self->_xpcClient;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__NACVolumeControllerProxy__hapticStateDidChange__block_invoke;
  v3[3] = &unk_264CFC9F8;
  v3[4] = self;
  [(NACXPCClient *)xpcClient hapticState:v3];
}

void __49__NACVolumeControllerProxy__hapticStateDidChange__block_invoke(uint64_t a1, uint64_t a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __49__NACVolumeControllerProxy__hapticStateDidChange__block_invoke_2;
  v2[3] = &unk_264CFC4C8;
  v2[4] = *(void *)(a1 + 32);
  void v2[5] = a2;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __49__NACVolumeControllerProxy__hapticStateDidChange__block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 88) = *(void *)(result + 40);
  uint64_t v1 = *(void *)(result + 32);
  if (!*(void *)(v1 + 56))
  {
    *(void *)(v1 + 160) = *(void *)(result + 40);
    return [*(id *)(result + 32) _notifyDelegateHapticStateChanged];
  }
  return result;
}

- (void)_systemMutedStateDidChange
{
  xpcClient = self->_xpcClient;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__NACVolumeControllerProxy__systemMutedStateDidChange__block_invoke;
  v3[3] = &unk_264CFC9D0;
  v3[4] = self;
  [(NACXPCClient *)xpcClient systemMutedState:v3];
}

void __54__NACVolumeControllerProxy__systemMutedStateDidChange__block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __54__NACVolumeControllerProxy__systemMutedStateDidChange__block_invoke_2;
  v2[3] = &unk_264CFC4A0;
  char v3 = a2;
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __54__NACVolumeControllerProxy__systemMutedStateDidChange__block_invoke_2(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 132))
  {
    *(unsigned char *)(v2 + 132) = v1;
    return [*(id *)(result + 32) _notifyDelegateSystemMutedStateChanged];
  }
  return result;
}

- (void)_EUVolumeLimitDidChange
{
  xpcClient = self->_xpcClient;
  target = self->_target;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__NACVolumeControllerProxy__EUVolumeLimitDidChange__block_invoke;
  v4[3] = &unk_264CFC9A8;
  v4[4] = self;
  [(NACXPCClient *)xpcClient EULimitForTarget:target result:v4];
}

void __51__NACVolumeControllerProxy__EUVolumeLimitDidChange__block_invoke(uint64_t a1, float a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __51__NACVolumeControllerProxy__EUVolumeLimitDidChange__block_invoke_2;
  v2[3] = &unk_264CFC478;
  float v3 = a2;
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

void __51__NACVolumeControllerProxy__EUVolumeLimitDidChange__block_invoke_2(uint64_t a1)
{
  float v1 = *(float *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v1 != *(float *)(v2 + 136))
  {
    *(float *)(v2 + 136) = v1;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
      [v6 volumeControllerDidUpdateEUVolumeLimit:*(void *)(a1 + 32)];
    }
  }
}

- (void)_volumeWarningDidChange
{
  xpcClient = self->_xpcClient;
  target = self->_target;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__NACVolumeControllerProxy__volumeWarningDidChange__block_invoke;
  v4[3] = &unk_264CFCA48;
  v4[4] = self;
  [(NACXPCClient *)xpcClient volumeWarningForTarget:target result:v4];
}

void __51__NACVolumeControllerProxy__volumeWarningDidChange__block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__NACVolumeControllerProxy__volumeWarningDidChange__block_invoke_2;
  block[3] = &unk_264CFCA20;
  char v4 = a2;
  block[4] = *(void *)(a1 + 32);
  block[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __51__NACVolumeControllerProxy__volumeWarningDidChange__block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2 != *(unsigned __int8 *)(v3 + 130))
  {
    *(unsigned char *)(v3 + 130) = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    char v5 = objc_opt_respondsToSelector();

    uint64_t v3 = *(void *)(a1 + 32);
    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)(v3 + 144));
      [v6 volumeControllerDidUpdateVolumeWarningEnabled:*(void *)(a1 + 32)];

      uint64_t v3 = *(void *)(a1 + 32);
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7 != *(void *)(v3 + 152))
  {
    *(void *)(v3 + 152) = v7;
    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
      [v10 volumeControllerDidUpdateVolumeWarningState:*(void *)(a1 + 32)];
    }
  }
}

- (void)_availableListeningModesDidChange
{
  xpcClient = self->_xpcClient;
  target = self->_target;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__NACVolumeControllerProxy__availableListeningModesDidChange__block_invoke;
  v4[3] = &unk_264CFCA70;
  v4[4] = self;
  [(NACXPCClient *)xpcClient availableListeningModesForTarget:target result:v4];
}

void __61__NACVolumeControllerProxy__availableListeningModesDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__NACVolumeControllerProxy__availableListeningModesDidChange__block_invoke_2;
  v6[3] = &unk_264CFC3B0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __61__NACVolumeControllerProxy__availableListeningModesDidChange__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v11 = *(id *)(a1 + 32);
  id v2 = *(id *)(*(void *)(a1 + 40) + 112);
  if (v11 == v2)
  {
  }
  else
  {
    id v3 = v11;
    char v4 = [v3 isEqual:v2];

    if ((v4 & 1) == 0)
    {
      id v5 = NMLogForCategory(4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
        *(_DWORD *)buf = 138412546;
        uint64_t v13 = v6;
        __int16 v14 = 2112;
        uint64_t v15 = v7;
        _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "[NoiseControl] Received available listening modes update: %@ for target: %@", buf, 0x16u);
      }

      objc_storeStrong((id *)(*(void *)(a1 + 40) + 112), *(id *)(a1 + 32));
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 144));
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 144));
        [v10 volumeControllerDidUpdateAvailableListeningModes:*(void *)(a1 + 40)];
      }
    }
  }
}

- (void)_currentListeningModeDidChange
{
  xpcClient = self->_xpcClient;
  target = self->_target;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__NACVolumeControllerProxy__currentListeningModeDidChange__block_invoke;
  v4[3] = &unk_264CFCA98;
  v4[4] = self;
  [(NACXPCClient *)xpcClient currentListeningModeForTarget:target result:v4];
}

void __58__NACVolumeControllerProxy__currentListeningModeDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__NACVolumeControllerProxy__currentListeningModeDidChange__block_invoke_2;
  v6[3] = &unk_264CFC3B0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __58__NACVolumeControllerProxy__currentListeningModeDidChange__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v11 = *(id *)(a1 + 32);
  id v2 = *(id *)(*(void *)(a1 + 40) + 120);
  if (v11 == v2)
  {
  }
  else
  {
    id v3 = v11;
    char v4 = [v3 isEqual:v2];

    if ((v4 & 1) == 0)
    {
      id v5 = NMLogForCategory(4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
        *(_DWORD *)buf = 138412546;
        uint64_t v13 = v6;
        __int16 v14 = 2112;
        uint64_t v15 = v7;
        _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "Received current listening mode update: %@ for target: %@", buf, 0x16u);
      }

      objc_storeStrong((id *)(*(void *)(a1 + 40) + 120), *(id *)(a1 + 32));
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 144));
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 144));
        [v10 volumeControllerDidUpdateCurrentListeningMode:*(void *)(a1 + 40)];
      }
    }
  }
}

- (void)_handleFailedToSetCurrentListeningModeNotification:(id)a3
{
  char v4 = (void *)MEMORY[0x263F087E8];
  id v5 = a3;
  uint64_t v6 = [v5 userInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"errorDomain"];
  uint64_t v8 = [v5 userInfo];

  uint64_t v9 = [v8 objectForKeyedSubscript:@"errorCode"];
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v7, objc_msgSend((id)v9, "integerValue"), 0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v9) = objc_opt_respondsToSelector();

  if (v9)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 volumeController:self didFailToSetCurrentListeningModeWithError:v12];
  }
}

- (void)_notifyDelegateVolumeChanged
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__NACVolumeControllerProxy__notifyDelegateVolumeChanged__block_invoke;
  block[3] = &unk_264CFC388;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __56__NACVolumeControllerProxy__notifyDelegateVolumeChanged__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    [v4 volumeControllerDidUpdateVolumeValue:*(void *)(a1 + 32)];
  }
}

- (void)_notifyDelegateHapticChanged
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__NACVolumeControllerProxy__notifyDelegateHapticChanged__block_invoke;
  block[3] = &unk_264CFC388;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __56__NACVolumeControllerProxy__notifyDelegateHapticChanged__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    [v4 volumeControllerDidUpdateHapticIntensity:*(void *)(a1 + 32)];
  }
}

- (void)_notifyDelegateSystemMutedStateChanged
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__NACVolumeControllerProxy__notifyDelegateSystemMutedStateChanged__block_invoke;
  block[3] = &unk_264CFC388;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __66__NACVolumeControllerProxy__notifyDelegateSystemMutedStateChanged__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    [v4 volumeControllerDidUpdateSystemMutedState:*(void *)(a1 + 32)];
  }
}

- (void)_notifyDelegateProminentHapticStateChanged
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__NACVolumeControllerProxy__notifyDelegateProminentHapticStateChanged__block_invoke;
  block[3] = &unk_264CFC388;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __70__NACVolumeControllerProxy__notifyDelegateProminentHapticStateChanged__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    [v4 volumeControllerDidUpdateProminentHapticState:*(void *)(a1 + 32)];
  }
}

- (void)_notifyDelegateHapticStateChanged
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__NACVolumeControllerProxy__notifyDelegateHapticStateChanged__block_invoke;
  block[3] = &unk_264CFC388;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __61__NACVolumeControllerProxy__notifyDelegateHapticStateChanged__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    [v4 volumeControllerDidUpdateHapticState:*(void *)(a1 + 32)];
  }
}

- (id)_scheduleTimeoutWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_source_set_event_handler(v4, v3);

  dispatch_resume(v4);

  return v4;
}

- (void)_cancelSetVolumeTimer
{
  setVolumeTimer = self->_setVolumeTimer;
  if (setVolumeTimer)
  {
    dispatch_source_cancel(setVolumeTimer);
    id v4 = self->_setVolumeTimer;
    self->_setVolumeTimer = 0;
  }
}

- (void)_cancelSetHapticTimer
{
  setHapticTimer = self->_setHapticTimer;
  if (setHapticTimer)
  {
    dispatch_source_cancel(setHapticTimer);
    id v4 = self->_setHapticTimer;
    self->_setHapticTimer = 0;
  }
}

- (void)_cancelSetProminentHapticTimer
{
  setProminentHapticTimer = self->_setProminentHapticTimer;
  if (setProminentHapticTimer)
  {
    dispatch_source_cancel(setProminentHapticTimer);
    id v4 = self->_setProminentHapticTimer;
    self->_setProminentHapticTimer = 0;
  }
}

- (void)_cancelSetHapticStateTimer
{
  setHapticStateTimer = self->_setHapticStateTimer;
  if (setHapticStateTimer)
  {
    dispatch_source_cancel(setHapticStateTimer);
    id v4 = self->_setHapticStateTimer;
    self->_setHapticStateTimer = 0;
  }
}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_observingVolume)
  {
    dispatch_time_t v5 = NMLogForCategory(4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      target = self->_target;
      int v9 = 138412290;
      id v10 = target;
      _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "VolumeControllerProxy begin observing volume for target (%@) due to re-entering foreground", (uint8_t *)&v9, 0xCu);
    }

    [(NACXPCClient *)self->_xpcClient beginObservingVolumeForTarget:self->_target];
  }
  if (self->_observingListeningModes)
  {
    uint64_t v7 = NMLogForCategory(4);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = self->_target;
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_237CD4000, v7, OS_LOG_TYPE_DEFAULT, "VolumeControllerProxy begin observing listening modes for target (%@) due to re-entering foreground", (uint8_t *)&v9, 0xCu);
    }

    [(NACXPCClient *)self->_xpcClient beginObservingListeningModesForTarget:self->_target];
  }
}

- (void)_applicationWillResignActiveNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_observingVolume)
  {
    dispatch_time_t v5 = NMLogForCategory(4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      target = self->_target;
      int v9 = 138412290;
      id v10 = target;
      _os_log_impl(&dword_237CD4000, v5, OS_LOG_TYPE_DEFAULT, "VolumeControllerProxy end observing volume for target (%@) due to entering background", (uint8_t *)&v9, 0xCu);
    }

    [(NACXPCClient *)self->_xpcClient endObservingVolumeForTarget:self->_target];
  }
  if (self->_observingListeningModes)
  {
    uint64_t v7 = NMLogForCategory(4);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = self->_target;
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_237CD4000, v7, OS_LOG_TYPE_DEFAULT, "VolumeControllerProxy end observing listeningmodes for target (%@) due to entering background", (uint8_t *)&v9, 0xCu);
    }

    [(NACXPCClient *)self->_xpcClient endObservingListeningModesForTarget:self->_target];
  }
}

- (NACVolumeControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NACVolumeControllerDelegate *)WeakRetained;
}

- (BOOL)isVolumeControlAvailable
{
  return self->_volumeControlAvailable;
}

- (BOOL)isVolumeWarningEnabled
{
  return self->_volumeWarningEnabled;
}

- (int64_t)volumeWarningState
{
  return self->_volumeWarningState;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (float)EUVolumeLimit
{
  return self->_EUVolumeLimit;
}

- (BOOL)isSystemMuted
{
  return self->_systemMuted;
}

- (BOOL)isProminentHapticEnabled
{
  return self->_prominentHapticEnabled;
}

- (int64_t)hapticState
{
  return self->_hapticState;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentListeningMode, 0);
  objc_storeStrong((id *)&self->_availableListeningModes, 0);
  objc_storeStrong((id *)&self->_hapticIntensity, 0);
  objc_storeStrong((id *)&self->_volumeValue, 0);
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_setHapticStateTimer, 0);
  objc_storeStrong((id *)&self->_setProminentHapticTimer, 0);
  objc_storeStrong((id *)&self->_setHapticTimer, 0);
  objc_storeStrong((id *)&self->_setVolumeTimer, 0);
  objc_storeStrong((id *)&self->_hapticThrottler, 0);
  objc_storeStrong((id *)&self->_volumeThrottler, 0);

  objc_storeStrong((id *)&self->_target, 0);
}

@end