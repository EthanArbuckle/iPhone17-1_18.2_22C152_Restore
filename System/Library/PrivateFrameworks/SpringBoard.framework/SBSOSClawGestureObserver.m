@interface SBSOSClawGestureObserver
- (BOOL)_isAutomaticCallCountdownEnabled;
- (BOOL)_isClawGestureActive;
- (BOOL)_isSOSActivated;
- (BOOL)_wasSOSTriggeredByClaw;
- (BOOL)isClawActivated;
- (BOOL)isGestureLoggingEnabled;
- (BOOL)isSOSEnabled;
- (BSAbsoluteMachTimer)sosTriggerTimer;
- (NSMutableSet)activePressTypes;
- (SBSOSClawGestureObserver)init;
- (SBSOSClawGestureObserverDelegate)delegate;
- (SBSOSDefaults)sosDefaults;
- (id)_currentSOSButtonPressState;
- (id)_initWithSOSManager:(id)a3 workspace:(id)a4;
- (void)_cancelSOSActivity;
- (void)_presentSOSInterface;
- (void)_setSOSDefaults:(id)a3;
- (void)_setWasSOSTriggeredByClaw:(BOOL)a3;
- (void)_updateActivePressesForPressType:(int64_t)a3 down:(BOOL)a4 timestamp:(double)a5;
- (void)dealloc;
- (void)didUpdateCurrentSOSInitiationState:(int64_t)a3;
- (void)noteButtonPress:(int64_t)a3 isDown:(BOOL)a4;
- (void)noteGestureReset;
- (void)setActivePressTypes:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGestureLoggingEnabled:(BOOL)a3;
- (void)setSOSEnabled:(BOOL)a3;
- (void)setSosTriggerTimer:(id)a3;
@end

@implementation SBSOSClawGestureObserver

- (SBSOSClawGestureObserver)init
{
  v3 = [MEMORY[0x1E4F97B88] sharedInstance];
  v4 = +[SBMainWorkspace sharedInstance];
  v5 = [(SBSOSClawGestureObserver *)self _initWithSOSManager:v3 workspace:v4];

  return v5;
}

- (id)_initWithSOSManager:(id)a3 workspace:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SBSOSClawGestureObserver;
  v9 = [(SBSOSClawGestureObserver *)&v21 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sosManager, a3);
    objc_storeStrong((id *)&v10->_workspace, a4);
    v11 = +[SBDefaults localDefaults];
    uint64_t v12 = [v11 sosDefaults];
    sosDefaults = v10->_sosDefaults;
    v10->_sosDefaults = (SBSOSDefaults *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBSOSClawGestureObserver.sosTriggerTimer"];
    sosTriggerTimer = v10->_sosTriggerTimer;
    v10->_sosTriggerTimer = (BSAbsoluteMachTimer *)v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activePressTypes = v10->_activePressTypes;
    v10->_activePressTypes = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activePressTypeToDownTimestamp = v10->_activePressTypeToDownTimestamp;
    v10->_activePressTypeToDownTimestamp = v18;
  }
  return v10;
}

- (void)dealloc
{
  if (self->_sosEnabled) {
    [(SOSManager *)self->_sosManager removeObserver:self];
  }
  [(BSAbsoluteMachTimer *)self->_sosTriggerTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSOSClawGestureObserver;
  [(SBSOSClawGestureObserver *)&v3 dealloc];
}

- (void)noteButtonPress:(int64_t)a3 isDown:(BOOL)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a3 - 102;
  if ((unint64_t)(a3 - 102) >= 3)
  {
    v9 = SBLogButtonsCombo();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SBSOSClawGestureObserver noteButtonPress:isDown:](a3, v9);
    }
  }
  else
  {
    BOOL v6 = a4;
    BOOL v8 = [(SBSOSClawGestureObserver *)self _isClawGestureActive];
    v9 = [(SBSOSClawGestureObserver *)self activePressTypes];
    BSContinuousMachTimeNow();
    -[SBSOSClawGestureObserver _updateActivePressesForPressType:down:timestamp:](self, "_updateActivePressesForPressType:down:timestamp:", a3, v6);
    v10 = [v9 allObjects];
    v11 = objc_msgSend(v10, "bs_map:", &__block_literal_global_58);
    uint64_t v12 = [v11 componentsJoinedByString:@", "];

    BOOL v13 = [(SBSOSClawGestureObserver *)self _isClawGestureActive];
    uint64_t v14 = SBLogButtonsCombo();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      v17 = (void *)v16;
      if (v5 > 2) {
        v18 = @"<notSupported>";
      }
      else {
        v18 = off_1E6AFB000[v5];
      }
      *(_DWORD *)buf = 138544386;
      uint64_t v49 = v16;
      __int16 v50 = 2114;
      *(void *)v51 = v18;
      *(_WORD *)&v51[8] = 1024;
      BOOL v52 = v13;
      __int16 v53 = 1024;
      BOOL v54 = v6;
      __int16 v55 = 2114;
      v56 = v12;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - button press noted: %{public}@ down: %{BOOL}u active(%{BOOL}u): [%{public}@]", buf, 0x2Cu);
    }
    if ([(SBSOSClawGestureObserver *)self isSOSEnabled])
    {
      v19 = [(SBSOSClawGestureObserver *)self delegate];
      if (v13 || !v8)
      {
        if (v13 && !v8)
        {
          v20 = SBLogButtonsCombo();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_super v21 = (objc_class *)objc_opt_class();
            uint64_t v22 = NSStringFromClass(v21);
            v23 = (void *)v22;
            if (v5 > 2) {
              v24 = @"<notSupported>";
            }
            else {
              v24 = off_1E6AFB000[v5];
            }
            *(_DWORD *)buf = 138543618;
            uint64_t v49 = v22;
            __int16 v50 = 2114;
            *(void *)v51 = v24;
            _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ - Claw activated with press %{public}@", buf, 0x16u);
          }
          if ([(SBSOSClawGestureObserver *)self _isSOSActivated])
          {
            if ([(SBSOSClawGestureObserver *)self _isAutomaticCallCountdownEnabled]
              && [(SBSOSClawGestureObserver *)self _wasSOSTriggeredByClaw])
            {
              v32 = SBLogButtonsCombo();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                v33 = (objc_class *)objc_opt_class();
                v34 = NSStringFromClass(v33);
                *(_DWORD *)buf = 138543362;
                uint64_t v49 = (uint64_t)v34;
                _os_log_impl(&dword_1D85BA000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ - Setting SOS current interactive state to Starting due to claw activation", buf, 0xCu);
              }
              sosManager = self->_sosManager;
              v36 = [(SBSOSClawGestureObserver *)self _currentSOSButtonPressState];
              [(SOSManager *)sosManager setCurrentSOSButtonPressState:v36];

              [(SOSManager *)self->_sosManager setCurrentSOSInteractiveState:1];
              [v19 sosClawAutoCallInteractiveStateChanged:self interacting:1];
            }
            else
            {
              v39 = SBLogButtonsCombo();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                v40 = (objc_class *)objc_opt_class();
                v41 = NSStringFromClass(v40);
                BOOL v42 = [(SBSOSClawGestureObserver *)self _isAutomaticCallCountdownEnabled];
                BOOL v43 = [(SBSOSClawGestureObserver *)self _wasSOSTriggeredByClaw];
                *(_DWORD *)buf = 138543874;
                uint64_t v49 = (uint64_t)v41;
                __int16 v50 = 1024;
                *(_DWORD *)v51 = v42;
                *(_WORD *)&v51[4] = 1024;
                *(_DWORD *)&v51[6] = v43;
                _os_log_impl(&dword_1D85BA000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ - Claw has been activated, but claw for automatic call down requires automatic call down enabled: %{BOOL}u and SOS was triggered by claw: %{BOOL}u", buf, 0x18u);
              }
            }
          }
          else if (![(BSAbsoluteMachTimer *)self->_sosTriggerTimer isScheduled])
          {
            objc_initWeak((id *)buf, self);
            sosTriggerTimer = self->_sosTriggerTimer;
            id v38 = MEMORY[0x1E4F14428];
            v46[0] = MEMORY[0x1E4F143A8];
            v46[1] = 3221225472;
            v46[2] = __51__SBSOSClawGestureObserver_noteButtonPress_isDown___block_invoke_21;
            v46[3] = &unk_1E6AF5838;
            objc_copyWeak(&v47, (id *)buf);
            [(BSAbsoluteMachTimer *)sosTriggerTimer scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v46 queue:1.1 handler:0.0];

            objc_destroyWeak(&v47);
            objc_destroyWeak((id *)buf);
          }
          v44 = [(id)SBApp volumeHardwareButton];
          [v44 addVolumePressBandit:self];

          v45 = +[SBUIController sharedInstanceIfExists];
          [v45 cancelVolumeEvent];

          [v19 sosClawDidBecomeActive:self];
        }
      }
      else
      {
        v27 = SBLogButtonsCombo();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = (objc_class *)objc_opt_class();
          uint64_t v29 = NSStringFromClass(v28);
          v30 = (void *)v29;
          if (v5 > 2) {
            v31 = @"<notSupported>";
          }
          else {
            v31 = off_1E6AFB000[v5];
          }
          *(_DWORD *)buf = 138543618;
          uint64_t v49 = v29;
          __int16 v50 = 2114;
          *(void *)v51 = v31;
          _os_log_impl(&dword_1D85BA000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ - Claw deactivated with press %{public}@", buf, 0x16u);
        }
        [(SBSOSClawGestureObserver *)self _cancelSOSActivity];
      }
    }
    else
    {
      v19 = SBLogButtonsCombo();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        *(_DWORD *)buf = 138543362;
        uint64_t v49 = (uint64_t)v26;
        _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ - SOS is disabled so nothing left to do", buf, 0xCu);
      }
    }
  }
}

__CFString *__51__SBSOSClawGestureObserver_noteButtonPress_isDown___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 integerValue];
  if ((unint64_t)(v2 - 102) > 2) {
    return @"<notSupported>";
  }
  else {
    return off_1E6AFB000[v2 - 102];
  }
}

void __51__SBSOSClawGestureObserver_noteButtonPress_isDown___block_invoke_21(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && [WeakRetained isSOSEnabled]) {
    [v4 _presentSOSInterface];
  }
  [v5 cancel];
}

- (void)noteGestureReset
{
  [(NSMutableSet *)self->_activePressTypes removeAllObjects];
  if ([(SBSOSClawGestureObserver *)self isSOSEnabled])
  {
    [(SBSOSClawGestureObserver *)self _cancelSOSActivity];
  }
}

- (void)setSOSEnabled:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_sosEnabled != a3)
  {
    BOOL v3 = a3;
    self->_sosEnabled = a3;
    [(NSMutableSet *)self->_activePressTypes removeAllObjects];
    id v5 = SBLogButtonsCombo();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v9 = 138543618;
      v10 = v7;
      __int16 v11 = 1024;
      BOOL v12 = v3;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - Set SOS Claw Gesture Enabled: %{BOOL}u", (uint8_t *)&v9, 0x12u);
    }
    if (v3)
    {
      BOOL v8 = +[SBSOSEventHandler sharedInstance];
      [v8 run];

      [(SOSManager *)self->_sosManager addObserver:self queue:MEMORY[0x1E4F14428]];
    }
    else
    {
      [(SOSManager *)self->_sosManager removeObserver:self];
    }
  }
}

- (BOOL)isClawActivated
{
  BOOL v3 = [(SBSOSClawGestureObserver *)self isSOSEnabled];
  if (v3)
  {
    LOBYTE(v3) = [(SBSOSClawGestureObserver *)self _isClawGestureActive];
  }
  return v3;
}

- (void)setSosTriggerTimer:(id)a3
{
  id v5 = (BSAbsoluteMachTimer *)a3;
  sosTriggerTimer = self->_sosTriggerTimer;
  p_sosTriggerTimer = &self->_sosTriggerTimer;
  BOOL v6 = sosTriggerTimer;
  if (sosTriggerTimer != v5)
  {
    int v9 = v5;
    [(BSAbsoluteMachTimer *)v6 invalidate];
    objc_storeStrong((id *)p_sosTriggerTimer, a3);
    id v5 = v9;
  }
}

- (id)_currentSOSButtonPressState
{
  id v3 = objc_alloc(MEMORY[0x1E4F97B80]);
  uint64_t v4 = [(NSMutableSet *)self->_activePressTypes containsObject:&unk_1F3349908];
  id v5 = [(NSMutableDictionary *)self->_activePressTypeToDownTimestamp objectForKeyedSubscript:&unk_1F3349908];
  [v5 doubleValue];
  double v7 = v6;
  uint64_t v8 = [(NSMutableSet *)self->_activePressTypes containsObject:&unk_1F3349920];
  int v9 = [(NSMutableDictionary *)self->_activePressTypeToDownTimestamp objectForKeyedSubscript:&unk_1F3349920];
  [v9 doubleValue];
  double v11 = v10;
  BOOL v12 = [(NSMutableDictionary *)self->_activePressTypeToDownTimestamp objectForKeyedSubscript:&unk_1F3349938];
  [v12 doubleValue];
  uint64_t v14 = (void *)[v3 initWithVolumeUpPressed:v4 Timestamp:v8 VolumeDownPressed:v7 Timestamp:v11 LockPressedTimestamp:v13];

  return v14;
}

- (void)_updateActivePressesForPressType:(int64_t)a3 down:(BOOL)a4 timestamp:(double)a5
{
  BOOL v6 = a4;
  id v11 = [NSNumber numberWithInteger:a3];
  activePressTypes = self->_activePressTypes;
  if (v6)
  {
    [(NSMutableSet *)activePressTypes addObject:v11];
    activePressTypeToDownTimestamp = self->_activePressTypeToDownTimestamp;
    double v10 = [NSNumber numberWithDouble:a5];
    [(NSMutableDictionary *)activePressTypeToDownTimestamp setObject:v10 forKey:v11];
  }
  else
  {
    [(NSMutableSet *)activePressTypes removeObject:v11];
    [(NSMutableDictionary *)self->_activePressTypeToDownTimestamp removeObjectForKey:v11];
  }
}

- (BOOL)_isClawGestureActive
{
  uint64_t v2 = [(SBSOSClawGestureObserver *)self activePressTypes];
  if ([v2 containsObject:&unk_1F3349938]) {
    BOOL v3 = (unint64_t)[v2 count] > 1;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)_cancelSOSActivity
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBSOSClawGestureObserver *)self delegate];
  uint64_t v4 = [(SBSOSClawGestureObserver *)self sosTriggerTimer];
  if ([v4 isScheduled]) {
    [v4 cancel];
  }
  if ([(SOSManager *)self->_sosManager currentSOSInteractiveState])
  {
    id v5 = SBLogButtonsCombo();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = (objc_class *)objc_opt_class();
      double v7 = NSStringFromClass(v6);
      int v9 = 138543362;
      double v10 = v7;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - Setting SOS current interactive state to Stopping due to claw release.", (uint8_t *)&v9, 0xCu);
    }
    [(SOSManager *)self->_sosManager setCurrentSOSInteractiveState:0];
    [v3 sosClawAutoCallInteractiveStateChanged:self interacting:0];
  }
  uint64_t v8 = [(id)SBApp volumeHardwareButton];
  [v8 removeVolumePressBandit:self];

  [v3 sosClawDidBecomeInactive:self];
}

- (void)_presentSOSInterface
{
  BOOL v3 = [(id)SBApp HUDController];
  [v3 dismissHUDs:1];

  uint64_t v4 = [(id)SBApp ringerControl];
  -[SBRingerControl dismissRingerHUD]((uint64_t)v4);

  id v5 = [(SBSOSClawGestureObserver *)self delegate];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__SBSOSClawGestureObserver__presentSOSInterface__block_invoke;
  v6[3] = &unk_1E6AF5350;
  v6[4] = self;
  [v5 sosClawDidTriggerSOS:self completion:v6];
}

void __48__SBSOSClawGestureObserver__presentSOSInterface__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    BSDispatchMain();
  }
  else
  {
    BOOL v3 = SBLogButtonsCombo();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __48__SBSOSClawGestureObserver__presentSOSInterface__block_invoke_cold_1(a1, v3);
    }
  }
}

uint64_t __48__SBSOSClawGestureObserver__presentSOSInterface__block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _setWasSOSTriggeredByClaw:1];
  uint64_t result = [*(id *)(a1 + 32) isClawActivated];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) _isAutomaticCallCountdownEnabled];
    if (result)
    {
      BOOL v3 = SBLogButtonsCombo();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = (objc_class *)objc_opt_class();
        id v5 = NSStringFromClass(v4);
        int v9 = 138543362;
        double v10 = v5;
        _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - Setting SOS current interactive state to Starting upon SOS presentation.", (uint8_t *)&v9, 0xCu);
      }
      BOOL v6 = *(void **)(a1 + 32);
      double v7 = (void *)v6[1];
      uint64_t v8 = [v6 _currentSOSButtonPressState];
      [v7 setCurrentSOSButtonPressState:v8];

      return [*(id *)(*(void *)(a1 + 32) + 8) setCurrentSOSInteractiveState:1];
    }
  }
  return result;
}

- (BOOL)_isAutomaticCallCountdownEnabled
{
  uint64_t v2 = [(SBSOSClawGestureObserver *)self sosDefaults];
  char v3 = [v2 isAutomaticCallCountdownEnabled];

  return v3;
}

- (BOOL)_isSOSActivated
{
  return [(SOSManager *)self->_sosManager currentSOSInitiationState] == 1;
}

- (void)didUpdateCurrentSOSInitiationState:(int64_t)a3
{
}

void __63__SBSOSClawGestureObserver_didUpdateCurrentSOSInitiationState___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = SBLogButtonsCombo();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    char v3 = (objc_class *)objc_opt_class();
    uint64_t v4 = NSStringFromClass(v3);
    int v5 = [*(id *)(a1 + 32) _isSOSActivated];
    int v6 = 138543618;
    double v7 = v4;
    __int16 v8 = 1024;
    int v9 = v5;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - SOS UI initiation state changed. SOS activated: %{BOOL}u", (uint8_t *)&v6, 0x12u);
  }
  if (!*(void *)(a1 + 40)) {
    [*(id *)(a1 + 32) _setWasSOSTriggeredByClaw:0];
  }
}

- (NSMutableSet)activePressTypes
{
  return self->_activePressTypes;
}

- (void)setActivePressTypes:(id)a3
{
}

- (SBSOSClawGestureObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSOSClawGestureObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBSOSDefaults)sosDefaults
{
  return self->_sosDefaults;
}

- (void)_setSOSDefaults:(id)a3
{
}

- (BOOL)isSOSEnabled
{
  return self->_sosEnabled;
}

- (BSAbsoluteMachTimer)sosTriggerTimer
{
  return self->_sosTriggerTimer;
}

- (BOOL)_wasSOSTriggeredByClaw
{
  return self->_wasSOSTiggeredByClaw;
}

- (void)_setWasSOSTriggeredByClaw:(BOOL)a3
{
  self->_wasSOSTiggeredByClaw = a3;
}

- (BOOL)isGestureLoggingEnabled
{
  return self->_gestureLoggingEnabled;
}

- (void)setGestureLoggingEnabled:(BOOL)a3
{
  self->_gestureLoggingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sosTriggerTimer, 0);
  objc_storeStrong((id *)&self->_sosDefaults, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activePressTypes, 0);
  objc_storeStrong((id *)&self->_activePressTypeToDownTimestamp, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_sosManager, 0);
}

- (void)noteButtonPress:(int)a1 isDown:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "must be a volume or lock button press, not %d", (uint8_t *)v2, 8u);
}

void __48__SBSOSClawGestureObserver__presentSOSInterface__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138543362;
  int v6 = v4;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "%{public}@ - Claw triggered SOS, but SOS responded without success.", (uint8_t *)&v5, 0xCu);
}

@end