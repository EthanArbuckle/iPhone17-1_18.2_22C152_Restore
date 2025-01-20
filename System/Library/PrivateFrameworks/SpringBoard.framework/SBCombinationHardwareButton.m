@interface SBCombinationHardwareButton
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (SBCombinationHardwareButton)initWithScreenshotGestureRecognizer:(id)a3 shutdownGestureRecognizer:(id)a4 homeHardwareButton:(id)a5 lockHardwareButton:(id)a6 volumeHardwareButton:(id)a7 proximitySensorManager:(id)a8 backlightController:(id)a9;
- (SBHardwareButtonCoordinator)hardwareButtonCoordinator;
- (id)backlightController;
- (id)hardwareButtonIdentifier;
- (id)homeHardwareButton;
- (id)preemptablePressGestureRecognizers;
- (id)proximitySensorManager;
- (id)setBacklightController:(id *)result;
- (id)setHomeHardwareButton:(id *)result;
- (id)setProximitySensorManager:(id *)result;
- (id)setVolumeHardwareButton:(id *)result;
- (id)volumeHardwareButton;
- (void)_backlightChanged:(id)a3;
- (void)_configureGestureRecognizers;
- (void)_configureSOSGestureBehaviors;
- (void)_setScreenshotDisabled:(BOOL)a3 forReason:(id)a4;
- (void)_sosTriggerMechanismDidChange;
- (void)cancelHardwareButtonPress;
- (void)dealloc;
- (void)provider:(id)a3 didUpdateButtonGestureParameters:(id)a4;
- (void)screenshotGesture:(id)a3;
- (void)setHardwareButtonCoordinator:(id)a3;
- (void)shutdownGesture:(id)a3;
- (void)sosClawAutoCallInteractiveStateChanged:(id)a3 interacting:(BOOL)a4;
- (void)sosClawDidBecomeActive:(id)a3;
- (void)sosClawDidBecomeInactive:(id)a3;
- (void)sosClawDidTriggerSOS:(id)a3 completion:(id)a4;
- (void)sosGesture:(id)a3;
- (void)sosLockDidTriggerSOS:(id)a3 completion:(id)a4;
- (void)sosLockTriggerDidBecomeActive:(id)a3;
- (void)sosLockTriggerDidBecomeInactive:(id)a3;
@end

@implementation SBCombinationHardwareButton

- (SBCombinationHardwareButton)initWithScreenshotGestureRecognizer:(id)a3 shutdownGestureRecognizer:(id)a4 homeHardwareButton:(id)a5 lockHardwareButton:(id)a6 volumeHardwareButton:(id)a7 proximitySensorManager:(id)a8 backlightController:(id)a9
{
  id v16 = a3;
  id v32 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v33.receiver = self;
  v33.super_class = (Class)SBCombinationHardwareButton;
  v22 = [(SBCombinationHardwareButton *)&v33 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_screenshotGestureRecognizer, a3);
    objc_storeStrong((id *)&v23->_shutdownGestureRecognizer, a4);
    objc_storeWeak((id *)&v23->_proximitySensorManager, v20);
    objc_storeWeak((id *)&v23->_backlightController, v21);
    v24 = objc_alloc_init(SBCombinationHardwareButtonActions);
    buttonActions = v23->_buttonActions;
    v23->_buttonActions = v24;

    v26 = [v18 hardwareButtonGestureParameters];
    [v26 longPressTimeInterval];
    double v28 = v27;

    [v16 setMaximumClickFormationDuration:v28];
    [v16 setMaximumClickDownDuration:-1.0];
    [v16 setAllPressesUpRequired:0];
    objc_storeWeak((id *)&v23->_homeHardwareButton, v17);
    objc_storeWeak((id *)&v23->_volumeHardwareButton, v19);
    objc_storeWeak((id *)&v23->_lockHardwareButton, v18);
    [v18 addHardwareButtonGestureParametersObserver:v23];
    [(SBCombinationHardwareButton *)v23 _configureGestureRecognizers];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v23, (CFNotificationCallback)_SBSOSTriggerMechanismDidChangeNotification, (CFStringRef)*MEMORY[0x1E4FA6190], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v30 addObserver:v23 selector:sel__backlightChanged_ name:*MEMORY[0x1E4FA7A18] object:0];
  }
  return v23;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBCombinationHardwareButton;
  [(SBCombinationHardwareButton *)&v4 dealloc];
}

- (void)_configureGestureRecognizers
{
  [(SBClickGestureRecognizer *)self->_screenshotGestureRecognizer addTarget:self action:sel_screenshotGesture_];
  [(SBClickGestureRecognizer *)self->_screenshotGestureRecognizer setDelegate:self];
  v3 = +[SBSystemGestureManager mainDisplayManager];
  [v3 addGestureRecognizer:self->_screenshotGestureRecognizer withType:91];

  objc_super v4 = [[SBPressGestureRecognizer alloc] initWithTarget:self action:sel_sosGesture_];
  sosGestureRecognizer = self->_sosGestureRecognizer;
  self->_sosGestureRecognizer = v4;

  [(SBPressGestureRecognizer *)self->_sosGestureRecognizer setName:@"LockVolumeButtons-SOS"];
  [(SBPressGestureRecognizer *)self->_sosGestureRecognizer setAllowedPressTypes:&unk_1F3347B50];
  [(SBPressGestureRecognizer *)self->_sosGestureRecognizer setDelegate:self];
  v6 = +[SBSystemGestureManager mainDisplayManager];
  [v6 addGestureRecognizer:self->_sosGestureRecognizer withType:86];

  v7 = objc_alloc_init(SBSOSClawGestureObserver);
  sosClawGestureObserver = self->_sosClawGestureObserver;
  self->_sosClawGestureObserver = v7;

  [(SBSOSClawGestureObserver *)self->_sosClawGestureObserver setDelegate:self];
  [(SBSOSClawGestureObserver *)self->_sosClawGestureObserver setGestureLoggingEnabled:1];
  v9 = [[SBSOSLockGestureObserver alloc] initWithConfiguration:1];
  sosLockGestureObserver = self->_sosLockGestureObserver;
  self->_sosLockGestureObserver = v9;

  [(SBSOSLockGestureObserver *)self->_sosLockGestureObserver setDelegate:self];
  [(SBSOSLockGestureObserver *)self->_sosLockGestureObserver setGestureLoggingEnabled:1];
  [(SBCombinationHardwareButton *)self _configureSOSGestureBehaviors];
  if (self->_shutdownGestureRecognizer)
  {
    BOOL v11 = [(SBSOSClawGestureObserver *)self->_sosClawGestureObserver isSOSEnabled];
    shutdownGestureRecognizer = self->_shutdownGestureRecognizer;
    if (v11)
    {
      [(SBLongPressGestureRecognizer *)shutdownGestureRecognizer setEnabled:0];
    }
    else
    {
      [(SBLongPressGestureRecognizer *)shutdownGestureRecognizer addTarget:self action:sel_shutdownGesture_];
      [(SBLongPressGestureRecognizer *)self->_shutdownGestureRecognizer setName:@"LockVolumeButtons-Shutdown"];
      [(SBClickGestureRecognizer *)self->_shutdownGestureRecognizer setNumberOfClicksRequired:0];
      [(SBClickGestureRecognizer *)self->_shutdownGestureRecognizer setAllPressesUpRequired:0];
      [(SBLongPressGestureRecognizer *)self->_shutdownGestureRecognizer setMinimumPressDuration:1.1];
      [(SBPressGestureRecognizer *)self->_shutdownGestureRecognizer setAllowedPressTypes:&unk_1F3347B68];
      [(SBClickGestureRecognizer *)self->_shutdownGestureRecognizer addShortcutWithPressTypes:&unk_1F3347B80];
      [(SBClickGestureRecognizer *)self->_shutdownGestureRecognizer addShortcutWithPressTypes:&unk_1F3347B98];
      [(SBLongPressGestureRecognizer *)self->_shutdownGestureRecognizer setDelegate:self];
      v13 = +[SBSystemGestureManager mainDisplayManager];
      [v13 addGestureRecognizer:self->_shutdownGestureRecognizer withType:87];

      [(SBLongPressGestureRecognizer *)self->_shutdownGestureRecognizer setEnabled:1];
      screenshotGestureRecognizer = self->_screenshotGestureRecognizer;
      v15 = self->_shutdownGestureRecognizer;
      [(SBClickGestureRecognizer *)screenshotGestureRecognizer requireGestureRecognizerToFail:v15];
    }
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_screenshotGestureRecognizer == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_proximitySensorManager);
    int v3 = [WeakRetained isObjectInProximity] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  v6 = (SBClickGestureRecognizer *)a3;
  id v7 = a4;
  BOOL v8 = 0;
  if (self->_screenshotGestureRecognizer == v6)
  {
    NSClassFromString(&cfstr_Sbhblongpressg.isa);
    if (objc_opt_isKindOfClass()) {
      BOOL v8 = 1;
    }
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  v6 = (SBLongPressGestureRecognizer *)a3;
  id v7 = (SBClickGestureRecognizer *)a4;
  BOOL v8 = v7;
  screenshotGestureRecognizer = self->_screenshotGestureRecognizer;
  BOOL v10 = screenshotGestureRecognizer == (SBClickGestureRecognizer *)v6 || screenshotGestureRecognizer == v7;
  if (v10
    || (SBLongPressGestureRecognizer *)self->_sosGestureRecognizer == v6
    || self->_shutdownGestureRecognizer == v6)
  {
    BOOL v12 = 1;
  }
  else
  {
    BOOL v11 = [(SBClickGestureRecognizer *)v7 allowedTouchTypes];
    BOOL v12 = [v11 count] != 0;
  }
  return v12;
}

- (void)_configureSOSGestureBehaviors
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Configuring SOS Gesture Behaviors - Unsupported Lock Button Trigger Click Count - disabling lock button trigger.", v1, 2u);
}

- (void)provider:(id)a3 didUpdateButtonGestureParameters:(id)a4
{
  screenshotGestureRecognizer = self->_screenshotGestureRecognizer;
  objc_msgSend(a4, "longPressTimeInterval", a3);
  -[SBClickGestureRecognizer setMaximumClickFormationDuration:](screenshotGestureRecognizer, "setMaximumClickFormationDuration:");
}

- (id)preemptablePressGestureRecognizers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_screenshotGestureRecognizer;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (void)screenshotGesture:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = SBLogButtonsCombo();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = [v4 state];
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Take screenshot: %d", (uint8_t *)v6, 8u);
  }

  if ([v4 state] == 3) {
    [(SBCombinationHardwareButtonActions *)self->_buttonActions performTakeScreenshotAction];
  }
}

- (void)sosGesture:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 latestPressType];
  uint64_t v6 = [v4 latestPressPhase];
  uint64_t v7 = [v4 state];
  BOOL v8 = SBLogButtonsCombo();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 67109632;
    int v20 = v5;
    __int16 v21 = 1024;
    int v22 = v6;
    __int16 v23 = 1024;
    int v24 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "SOS button gesture: press type=%d, press phase=%d, recognizer state=%d", (uint8_t *)&v19, 0x14u);
  }

  [v4 latestPressTimestamp];
  double v10 = v9;
  if (BSFloatIsZero()) {
    goto LABEL_27;
  }
  if (v5 != 104) {
    goto LABEL_9;
  }
  if (v7 == 3)
  {
    sosLockGestureObserver = self->_sosLockGestureObserver;
    if (sosLockGestureObserver) {
      [(SBSOSLockGestureObserver *)sosLockGestureObserver registerPressUpWithTimestamp:v10];
    }
    goto LABEL_17;
  }
  if (v7 != 1)
  {
LABEL_9:
    if ((v7 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      BOOL v12 = SBLogButtonsCombo();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 67109120;
        int v20 = v7;
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "SOS button gesture reset due to recognizer canceled or failed: %d", (uint8_t *)&v19, 8u);
      }

      if (self) {
        sosClawGestureObserver = self->_sosClawGestureObserver;
      }
      else {
        sosClawGestureObserver = 0;
      }
      [(SBSOSClawGestureObserver *)sosClawGestureObserver noteGestureReset];
      goto LABEL_27;
    }
    goto LABEL_17;
  }
  BOOL v11 = self->_sosLockGestureObserver;
  if (v11) {
    [(SBSOSLockGestureObserver *)v11 registerPressDownWithTimestamp:v10];
  }
LABEL_17:
  if ((unint64_t)(v6 - 3) < 2)
  {
    if (self) {
      v15 = self->_sosClawGestureObserver;
    }
    else {
      v15 = 0;
    }
    uint64_t v16 = v5;
    uint64_t v17 = 0;
    goto LABEL_26;
  }
  if (v6 == 2 || !v6)
  {
    if (self) {
      v15 = self->_sosClawGestureObserver;
    }
    else {
      v15 = 0;
    }
    uint64_t v16 = v5;
    uint64_t v17 = 1;
LABEL_26:
    [(SBSOSClawGestureObserver *)v15 noteButtonPress:v16 isDown:v17];
    goto LABEL_27;
  }
  id v18 = SBLogButtonsCombo();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 67109120;
    int v20 = v6;
    _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "Unhandled claw gesture button press phase: %d.", (uint8_t *)&v19, 8u);
  }

LABEL_27:
}

- (void)shutdownGesture:(id)a3
{
  if ([a3 state] == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lockHardwareButton);
    [WeakRetained cancelLongPress];

    buttonActions = self->_buttonActions;
    [(SBCombinationHardwareButtonActions *)buttonActions performPresentPowerDownTransientOverlayAction];
  }
}

- (void)sosLockDidTriggerSOS:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a4;
  id v8 = a3;
  double v9 = [v6 UUID];
  uint64_t v10 = [v8 triggerMechanism];

  BOOL v11 = SBLogButtonsCombo();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    v15 = v9;
    __int16 v16 = 1024;
    int v17 = v10;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "SOS Lock Gesture triggered SOS with UUID: %@ and trigger mechanism: %d", (uint8_t *)&v14, 0x12u);
  }

  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lockHardwareButton);
  }
  else {
    id WeakRetained = 0;
  }
  v13 = [WeakRetained buttonActions];
  [v13 performSOSActionsWithUUID:v9 triggerMechanism:v10 completion:v7];

  [(SBSOSLockGestureObserver *)self->_sosLockGestureObserver noteDidBeginSOSWithUUID:v9];
}

- (void)sosLockTriggerDidBecomeActive:(id)a3
{
  if (self) {
    self = (SBCombinationHardwareButton *)objc_loadWeakRetained((id *)&self->_lockHardwareButton);
  }
  id v4 = self;
  int v3 = [(SBCombinationHardwareButton *)self buttonActions];
  [v3 performSOSGestureBeganActions];
}

- (void)sosLockTriggerDidBecomeInactive:(id)a3
{
  if (self) {
    self = (SBCombinationHardwareButton *)objc_loadWeakRetained((id *)&self->_lockHardwareButton);
  }
  id v4 = self;
  int v3 = [(SBCombinationHardwareButton *)self buttonActions];
  [v3 performSOSGestureEndedActions];
}

- (void)sosClawDidTriggerSOS:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [(SBCombinationHardwareButton *)self _setScreenshotDisabled:1 forReason:@"SOSTriggered"];
  uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
  id v7 = SBLogButtonsCombo();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "SOS Claw Gesture triggered SOS with UUID: %@", (uint8_t *)&v9, 0xCu);
  }

  if (self) {
    self = (SBCombinationHardwareButton *)objc_loadWeakRetained((id *)&self->_lockHardwareButton);
  }
  id v8 = [(SBCombinationHardwareButton *)self buttonActions];
  [v8 performSOSActionsWithUUID:v6 triggerMechanism:3 completion:v5];
}

- (void)sosClawDidBecomeActive:(id)a3
{
  if (self) {
    self = (SBCombinationHardwareButton *)objc_loadWeakRetained((id *)&self->_lockHardwareButton);
  }
  id v4 = self;
  [(SBCombinationHardwareButton *)self cancelLongPress];
  int v3 = [(SBCombinationHardwareButton *)v4 buttonActions];
  [v3 performSOSGestureBeganActions];
}

- (void)sosClawDidBecomeInactive:(id)a3
{
  [(SBCombinationHardwareButton *)self _setScreenshotDisabled:0 forReason:@"SOSTriggered"];
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_lockHardwareButton);
  }
  else {
    id WeakRetained = 0;
  }
  id v6 = WeakRetained;
  id v5 = [WeakRetained buttonActions];
  [v5 performSOSGestureEndedActions];
}

- (void)sosClawAutoCallInteractiveStateChanged:(id)a3 interacting:(BOOL)a4
{
}

- (void)cancelHardwareButtonPress
{
  if ([(SBLongPressGestureRecognizer *)self->_shutdownGestureRecognizer isEnabled])
  {
    [(SBLongPressGestureRecognizer *)self->_shutdownGestureRecognizer setEnabled:0];
    [(SBLongPressGestureRecognizer *)self->_shutdownGestureRecognizer setEnabled:1];
  }
  if ([(SBClickGestureRecognizer *)self->_screenshotGestureRecognizer isEnabled])
  {
    [(SBClickGestureRecognizer *)self->_screenshotGestureRecognizer setEnabled:0];
    screenshotGestureRecognizer = self->_screenshotGestureRecognizer;
    [(SBClickGestureRecognizer *)screenshotGestureRecognizer setEnabled:1];
  }
}

- (id)hardwareButtonIdentifier
{
  return @"Combination";
}

- (void)_sosTriggerMechanismDidChange
{
}

uint64_t __60__SBCombinationHardwareButton__sosTriggerMechanismDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureSOSGestureBehaviors];
}

- (void)_setScreenshotDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  BSDispatchQueueAssertMain();
  if (!v7)
  {
    int v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBCombinationHardwareButton.m", 396, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  screenshotDisableAssertions = self->_screenshotDisableAssertions;
  if (v4)
  {
    if (!screenshotDisableAssertions)
    {
      int v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v10 = self->_screenshotDisableAssertions;
      self->_screenshotDisableAssertions = v9;

      screenshotDisableAssertions = self->_screenshotDisableAssertions;
    }
    uint64_t v11 = [(NSMutableDictionary *)screenshotDisableAssertions objectForKeyedSubscript:v7];

    if (!v11)
    {
      objc_initWeak(&location, self);
      id v12 = objc_alloc(MEMORY[0x1E4F4F838]);
      uint64_t v13 = MEMORY[0x1E4F14428];
      id v14 = MEMORY[0x1E4F14428];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __64__SBCombinationHardwareButton__setScreenshotDisabled_forReason___block_invoke;
      v18[3] = &unk_1E6AF4FB8;
      objc_copyWeak(&v19, &location);
      v15 = (void *)[v12 initWithIdentifier:@"ScreenshotDisable" forReason:v7 queue:v13 invalidationBlock:v18];

      [(NSMutableDictionary *)self->_screenshotDisableAssertions setObject:v15 forKeyedSubscript:v7];
      [(SBClickGestureRecognizer *)self->_screenshotGestureRecognizer setEnabled:0];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    __int16 v16 = [(NSMutableDictionary *)screenshotDisableAssertions objectForKeyedSubscript:v7];
    [v16 invalidate];
  }
}

void __64__SBCombinationHardwareButton__setScreenshotDisabled_forReason___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained[1];
    id v6 = [v8 reason];
    [v5 removeObjectForKey:v6];

    if (![v4[1] count])
    {
      [v4[4] setEnabled:1];
      id v7 = v4[1];
      v4[1] = 0;
    }
  }
}

- (void)_backlightChanged:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

void __49__SBCombinationHardwareButton__backlightChanged___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) userInfo];
  id v4 = [v2 objectForKey:*MEMORY[0x1E4FA7A20]];

  [v4 floatValue];
  [*(id *)(a1 + 40) _setScreenshotDisabled:v3 <= 0.0 forReason:@"Backlight"];
}

- (SBHardwareButtonCoordinator)hardwareButtonCoordinator
{
  return self->_hardwareButtonCoordinator;
}

- (void)setHardwareButtonCoordinator:(id)a3
{
}

- (id)homeHardwareButton
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 5);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (id)setHomeHardwareButton:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 5, a2);
  }
  return result;
}

- (id)volumeHardwareButton
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 7);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (id)setVolumeHardwareButton:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 7, a2);
  }
  return result;
}

- (id)proximitySensorManager
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 8);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (id)setProximitySensorManager:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 8, a2);
  }
  return result;
}

- (id)backlightController
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 9);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (id)setBacklightController:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 9, a2);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shutdownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_sosLockGestureObserver, 0);
  objc_storeStrong((id *)&self->_sosClawGestureObserver, 0);
  objc_storeStrong((id *)&self->_sosGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_backlightController);
  objc_destroyWeak((id *)&self->_proximitySensorManager);
  objc_destroyWeak((id *)&self->_volumeHardwareButton);
  objc_destroyWeak((id *)&self->_lockHardwareButton);
  objc_destroyWeak((id *)&self->_homeHardwareButton);
  objc_storeStrong((id *)&self->_screenshotGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_buttonActions, 0);
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, 0);
  objc_storeStrong((id *)&self->_screenshotDisableAssertions, 0);
}

@end