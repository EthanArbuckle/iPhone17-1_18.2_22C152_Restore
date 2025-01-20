@interface SBVolumeHardwareButton
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (NSHashTable)volumePressBandits;
- (SBHardwareButtonCoordinator)hardwareButtonCoordinator;
- (SBPressSequenceObserver)volumeDecreaseSequenceObserver;
- (SBPressSequenceObserver)volumeIncreaseSequenceObserver;
- (SBVolumeHardwareButton)initWithScreenshotGestureRecognizer:(id)a3 shutdownGestureRecognizer:(id)a4 homeButtonType:(int64_t)a5;
- (SBVolumeHardwareButtonActions)buttonActions;
- (id)hardwareButtonIdentifier;
- (id)preemptablePressGestureRecognizers;
- (void)_aggdLogVolumeDecreaseButtonDown:(BOOL)a3;
- (void)_aggdLogVolumeIncreaseButtonDown:(BOOL)a3;
- (void)_createGestureRecognizers;
- (void)_logVolumeButtonWithObserver:(id)a3 down:(BOOL)a4;
- (void)_rawVolumeDecreasePress:(BOOL)a3;
- (void)_rawVolumeIncreasePress:(BOOL)a3;
- (void)_rawVolumePress:(id)a3;
- (void)addVolumePressBandit:(id)a3;
- (void)cancelVolumePress;
- (void)dealloc;
- (void)removeVolumePressBandit:(id)a3;
- (void)setHardwareButtonCoordinator:(id)a3;
- (void)setVolumePressBandits:(id)a3;
- (void)volumeDecreasePress:(id)a3;
- (void)volumeIncreasePress:(id)a3;
@end

@implementation SBVolumeHardwareButton

- (void)dealloc
{
  [(BSInvalidatable *)self->_volumeIncreaseActiveAssertion invalidate];
  volumeIncreaseActiveAssertion = self->_volumeIncreaseActiveAssertion;
  self->_volumeIncreaseActiveAssertion = 0;

  [(BSInvalidatable *)self->_volumeDecreaseActiveAssertion invalidate];
  volumeDecreaseActiveAssertion = self->_volumeDecreaseActiveAssertion;
  self->_volumeDecreaseActiveAssertion = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBVolumeHardwareButton;
  [(SBVolumeHardwareButton *)&v5 dealloc];
}

- (SBVolumeHardwareButton)initWithScreenshotGestureRecognizer:(id)a3 shutdownGestureRecognizer:(id)a4 homeButtonType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBVolumeHardwareButton;
  v11 = [(SBVolumeHardwareButton *)&v20 init];
  v12 = v11;
  if (v11)
  {
    v11->_homeButtonType = a5;
    v13 = objc_alloc_init(SBVolumeHardwareButtonActions);
    buttonActions = v12->_buttonActions;
    v12->_buttonActions = v13;

    v15 = [[SBPressSequenceObserver alloc] initWithPressName:@"VolumeUp"];
    volumeIncreaseSequenceObserver = v12->_volumeIncreaseSequenceObserver;
    v12->_volumeIncreaseSequenceObserver = v15;

    v17 = [[SBPressSequenceObserver alloc] initWithPressName:@"VolumeDown"];
    volumeDecreaseSequenceObserver = v12->_volumeDecreaseSequenceObserver;
    v12->_volumeDecreaseSequenceObserver = v17;

    objc_storeStrong((id *)&v12->_screenshotGestureRecognizer, a3);
    objc_storeStrong((id *)&v12->_shutdownGestureRecognizer, a4);
    [(SBVolumeHardwareButton *)v12 _createGestureRecognizers];
  }

  return v12;
}

- (void)addVolumePressBandit:(id)a3
{
}

- (void)removeVolumePressBandit:(id)a3
{
}

- (void)cancelVolumePress
{
}

- (void)_createGestureRecognizers
{
  v3 = [[SBPressGestureRecognizer alloc] initWithTarget:self action:sel_volumeIncreasePress_];
  volumeIncreaseButtonPressGestureRecognizer = self->_volumeIncreaseButtonPressGestureRecognizer;
  self->_volumeIncreaseButtonPressGestureRecognizer = v3;

  [(SBPressGestureRecognizer *)self->_volumeIncreaseButtonPressGestureRecognizer setName:@"VolumeIncrease"];
  [(SBPressGestureRecognizer *)self->_volumeIncreaseButtonPressGestureRecognizer setAllowedPressTypes:&unk_1F33477A8];
  [(SBPressGestureRecognizer *)self->_volumeIncreaseButtonPressGestureRecognizer setDelegate:self];
  objc_super v5 = +[SBSystemGestureManager mainDisplayManager];
  [v5 addGestureRecognizer:self->_volumeIncreaseButtonPressGestureRecognizer withType:88];

  v6 = [[SBPressGestureRecognizer alloc] initWithTarget:self action:sel_volumeDecreasePress_];
  volumeDecreaseButtonPressGestureRecognizer = self->_volumeDecreaseButtonPressGestureRecognizer;
  self->_volumeDecreaseButtonPressGestureRecognizer = v6;

  [(SBPressGestureRecognizer *)self->_volumeDecreaseButtonPressGestureRecognizer setName:@"VolumeDecrease"];
  [(SBPressGestureRecognizer *)self->_volumeDecreaseButtonPressGestureRecognizer setAllowedPressTypes:&unk_1F33477C0];
  [(SBPressGestureRecognizer *)self->_volumeDecreaseButtonPressGestureRecognizer setDelegate:self];
  v8 = +[SBSystemGestureManager mainDisplayManager];
  [v8 addGestureRecognizer:self->_volumeDecreaseButtonPressGestureRecognizer withType:89];

  id v9 = [[SBPressGestureRecognizer alloc] initWithTarget:self action:sel__rawVolumePress_];
  rawVolumeButtonPressGestureRecognizer = self->_rawVolumeButtonPressGestureRecognizer;
  self->_rawVolumeButtonPressGestureRecognizer = v9;

  [(SBPressGestureRecognizer *)self->_rawVolumeButtonPressGestureRecognizer setName:@"VolumeRaw"];
  [(SBPressGestureRecognizer *)self->_rawVolumeButtonPressGestureRecognizer setAllowedPressTypes:&unk_1F33477D8];
  [(SBPressGestureRecognizer *)self->_rawVolumeButtonPressGestureRecognizer setDelegate:self];
  id v11 = +[SBSystemGestureManager mainDisplayManager];
  [v11 addGestureRecognizer:self->_rawVolumeButtonPressGestureRecognizer withType:90];
}

- (void)volumeIncreasePress:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 state];
  v6 = SBLogButtonsVolume();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v5 == 1;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "RECEIVED volumeIncreasePress down:%{BOOL}u", (uint8_t *)v9, 8u);
  }

  [(SBVolumeHardwareButton *)self _aggdLogVolumeIncreaseButtonDown:v5 == 1];
  [(SBVolumeHardwareButton *)self _logVolumeButtonWithObserver:self->_volumeIncreaseSequenceObserver down:v5 == 1];
  if (v5 == 1)
  {
    v7 = [v4 _activeEventOfType:3];
    -[SBVolumeHardwareButtonActions volumeIncreasePressDownWithModifiers:](self->_buttonActions, "volumeIncreasePressDownWithModifiers:", [v7 modifierFlags]);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"SBVolumeHardwareButtonIncreaseNotification" object:0];
  }
  else
  {
    [(SBVolumeHardwareButtonActions *)self->_buttonActions volumeIncreasePressUp];
  }
}

- (void)volumeDecreasePress:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 state];
  v6 = SBLogButtonsVolume();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v5 == 1;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "RECEIVED volumeDecreasePress down:%{BOOL}u", (uint8_t *)v9, 8u);
  }

  [(SBVolumeHardwareButton *)self _aggdLogVolumeDecreaseButtonDown:v5 == 1];
  [(SBVolumeHardwareButton *)self _logVolumeButtonWithObserver:self->_volumeDecreaseSequenceObserver down:v5 == 1];
  if (v5 == 1)
  {
    v7 = [v4 _activeEventOfType:3];
    -[SBVolumeHardwareButtonActions volumeDecreasePressDownWithModifiers:](self->_buttonActions, "volumeDecreasePressDownWithModifiers:", [v7 modifierFlags]);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"SBVolumeHardwareButtonDecreaseNotification" object:0];
  }
  else
  {
    [(SBVolumeHardwareButtonActions *)self->_buttonActions volumeDecreasePressUp];
  }
}

- (void)_logVolumeButtonWithObserver:(id)a3 down:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [a3 pressCollector];
  +[SBPressCollector currentTimeStamp];
  if (v4) {
    objc_msgSend(v5, "registerPressDownWithTimeStamp:");
  }
  else {
    objc_msgSend(v5, "registerPressUpWithTimeStamp:");
  }
}

- (void)_aggdLogVolumeIncreaseButtonDown:(BOOL)a3
{
  if (a3)
  {
    self->_volumeUpAggdStartTime = mach_absolute_time();
  }
  else if (self->_volumeUpAggdStartTime)
  {
    mach_absolute_time();
    BSAbsoluteTimeFromMachTime();
    double v5 = v4;
    BSAbsoluteTimeFromMachTime();
    if (v5 - v6 > 2.5) {
      ADPushTimeIntervalForDistributionKeySinceStartTime();
    }
    self->_volumeUpAggdStartTime = 0;
  }
}

- (void)_aggdLogVolumeDecreaseButtonDown:(BOOL)a3
{
  if (a3)
  {
    self->_volumeDownAggdStartTime = mach_absolute_time();
  }
  else if (self->_volumeDownAggdStartTime)
  {
    mach_absolute_time();
    BSAbsoluteTimeFromMachTime();
    double v5 = v4;
    BSAbsoluteTimeFromMachTime();
    if (v5 - v6 > 2.5) {
      ADPushTimeIntervalForDistributionKeySinceStartTime();
    }
    self->_volumeDownAggdStartTime = 0;
  }
}

- (void)_rawVolumePress:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 latestPressType];
  unint64_t v6 = [v4 latestPressPhase];

  if (v6 > 4 || ((1 << v6) & 0x19) == 0)
  {
    v8 = SBLogButtonsVolume();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      unint64_t v10 = v6;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring rawVolumePress phase: %li", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v5 == 103)
  {
    [(SBVolumeHardwareButton *)self _rawVolumeDecreasePress:v6 == 0];
  }
  else if (v5 == 102)
  {
    [(SBVolumeHardwareButton *)self _rawVolumeIncreasePress:v6 == 0];
  }
}

- (void)_rawVolumeIncreasePress:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = SBLogButtonsVolume();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "RECEIVED rawVolumeIncreasePress down:%{BOOL}u", (uint8_t *)v11, 8u);
  }

  volumeIncreaseActiveAssertion = self->_volumeIncreaseActiveAssertion;
  if (v3)
  {
    if (volumeIncreaseActiveAssertion) {
      return;
    }
    hardwareButtonCoordinator = self->_hardwareButtonCoordinator;
    v8 = [(SBVolumeHardwareButton *)self hardwareButtonIdentifier];
    int v9 = [(SBHardwareButtonCoordinator *)hardwareButtonCoordinator assertButtonIsActive:v8 dropletHintIdentifier:3];
    unint64_t v10 = self->_volumeIncreaseActiveAssertion;
    self->_volumeIncreaseActiveAssertion = v9;
  }
  else
  {
    [(BSInvalidatable *)volumeIncreaseActiveAssertion invalidate];
    v8 = self->_volumeIncreaseActiveAssertion;
    self->_volumeIncreaseActiveAssertion = 0;
  }
}

- (void)_rawVolumeDecreasePress:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = SBLogButtonsVolume();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "RECEIVED rawVolumeDecreasePress down:%{BOOL}u", (uint8_t *)v11, 8u);
  }

  volumeDecreaseActiveAssertion = self->_volumeDecreaseActiveAssertion;
  if (v3)
  {
    if (volumeDecreaseActiveAssertion) {
      return;
    }
    hardwareButtonCoordinator = self->_hardwareButtonCoordinator;
    v8 = [(SBVolumeHardwareButton *)self hardwareButtonIdentifier];
    int v9 = [(SBHardwareButtonCoordinator *)hardwareButtonCoordinator assertButtonIsActive:v8 dropletHintIdentifier:4];
    unint64_t v10 = self->_volumeDecreaseActiveAssertion;
    self->_volumeDecreaseActiveAssertion = v9;
  }
  else
  {
    [(BSInvalidatable *)volumeDecreaseActiveAssertion invalidate];
    v8 = self->_volumeDecreaseActiveAssertion;
    self->_volumeDecreaseActiveAssertion = 0;
  }
}

- (id)preemptablePressGestureRecognizers
{
  v5[2] = *MEMORY[0x1E4F143B8];
  volumeDecreaseButtonPressGestureRecognizer = self->_volumeDecreaseButtonPressGestureRecognizer;
  v5[0] = self->_volumeIncreaseButtonPressGestureRecognizer;
  v5[1] = volumeDecreaseButtonPressGestureRecognizer;
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  return v3;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (SBPressGestureRecognizer *)a3;
  if (self->_rawVolumeButtonPressGestureRecognizer != v4)
  {
    hardwareButtonCoordinator = self->_hardwareButtonCoordinator;
    unint64_t v6 = [(SBVolumeHardwareButton *)self hardwareButtonIdentifier];
    LOBYTE(hardwareButtonCoordinator) = [(SBHardwareButtonCoordinator *)hardwareButtonCoordinator buttonShouldStart:v6];

    if ((hardwareButtonCoordinator & 1) == 0)
    {
      v8 = SBLogButtonsVolume();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring volume buttons events because hardware button coordinator says nope", (uint8_t *)&v17, 2u);
      }
      BOOL v13 = 0;
      goto LABEL_14;
    }
    v7 = [(id)SBApp restartManager];
    v8 = v7;
    if (v7
      && ([v7 startupTransition],
          int v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          !v9))
    {
      int v15 = [v8 isPendingExit];
      unint64_t v10 = SBLogButtonsVolume();
      BOOL v16 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (!v15)
      {
        if (v16)
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "will begin volume button press", (uint8_t *)&v17, 2u);
        }
        BOOL v13 = 1;
        goto LABEL_9;
      }
      if (v16)
      {
        uint64_t v11 = [v8 pendingRestartTransitionRequest];
        int v17 = 138412290;
        v18 = v11;
        uint64_t v12 = "Ignoring volume buttons event because we are pending a restart: %@";
        goto LABEL_7;
      }
    }
    else
    {
      unint64_t v10 = SBLogButtonsVolume();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [v8 startupTransition];
        int v17 = 138412290;
        v18 = v11;
        uint64_t v12 = "Ignoring volume buttons events because we're in a startup transition: %@";
LABEL_7:
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, 0xCu);
      }
    }
    BOOL v13 = 0;
LABEL_9:

LABEL_14:
    goto LABEL_15;
  }
  BOOL v13 = 1;
LABEL_15:

  return v13;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (SBPressGestureRecognizer *)a3;
  v7 = (UIGestureRecognizer *)a4;
  v8 = v7;
  if (self->_rawVolumeButtonPressGestureRecognizer == v6)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    if (self->_homeButtonType == 2
      && (self->_volumeIncreaseButtonPressGestureRecognizer == v6
       || self->_volumeDecreaseButtonPressGestureRecognizer == v6)
      && (self->_screenshotGestureRecognizer == v7 || self->_shutdownGestureRecognizer == v7))
    {
      uint64_t v12 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
      BOOL v13 = [v12 physicalButtonSceneOverrideManager];

      BOOL v14 = -[SBPhysicalButtonSceneOverrideManager isTargetingButton:withConfigurationIdentifier:](v13, 1, 1);
      BOOL v15 = -[SBPhysicalButtonSceneOverrideManager isTargetingButton:withConfigurationIdentifier:](v13, 1, 2);
      int v9 = 0;
      if (!v14 && !v15)
      {
        BOOL v16 = [(id)SBApp ringerControl];
        int v9 = -[SBRingerControl isRingerHUDVisible]((uint64_t)v16) ^ 1;
      }
    }
    else
    {
      int v9 = 0;
    }
    unint64_t v10 = SBLogButtonsVolume();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17[0] = 67109120;
      v17[1] = v9;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "shouldRequireFailure: %{BOOL}u", (uint8_t *)v17, 8u);
    }
  }
  return v9;
}

- (id)hardwareButtonIdentifier
{
  return @"Volume";
}

- (SBHardwareButtonCoordinator)hardwareButtonCoordinator
{
  return self->_hardwareButtonCoordinator;
}

- (void)setHardwareButtonCoordinator:(id)a3
{
}

- (NSHashTable)volumePressBandits
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_volumePressBandits);
  return (NSHashTable *)WeakRetained;
}

- (void)setVolumePressBandits:(id)a3
{
}

- (SBPressSequenceObserver)volumeIncreaseSequenceObserver
{
  return self->_volumeIncreaseSequenceObserver;
}

- (SBPressSequenceObserver)volumeDecreaseSequenceObserver
{
  return self->_volumeDecreaseSequenceObserver;
}

- (SBVolumeHardwareButtonActions)buttonActions
{
  return self->_buttonActions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonActions, 0);
  objc_storeStrong((id *)&self->_volumeDecreaseSequenceObserver, 0);
  objc_storeStrong((id *)&self->_volumeIncreaseSequenceObserver, 0);
  objc_destroyWeak((id *)&self->_volumePressBandits);
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, 0);
  objc_storeStrong((id *)&self->_volumeDecreaseActiveAssertion, 0);
  objc_storeStrong((id *)&self->_volumeIncreaseActiveAssertion, 0);
  objc_storeStrong((id *)&self->_shutdownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_screenshotGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rawVolumeButtonPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_volumeDecreaseButtonPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_volumeIncreaseButtonPressGestureRecognizer, 0);
}

@end