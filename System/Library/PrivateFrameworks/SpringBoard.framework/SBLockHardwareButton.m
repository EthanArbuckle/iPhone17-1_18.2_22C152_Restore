@interface SBLockHardwareButton
- (BOOL)_shouldRunActions;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isButtonDown;
- (BOOL)reverseFadeOutIfNeeded;
- (BSInvalidatable)buttonActiveAssertion;
- (SBClickGestureRecognizer)doublePressGestureRecognizer;
- (SBClickGestureRecognizer)quadruplePressGestureRecognizer;
- (SBClickGestureRecognizer)singlePressGestureRecognizer;
- (SBClickGestureRecognizer)triplePressGestureRecognizer;
- (SBHardwareButtonCoordinator)hardwareButtonCoordinator;
- (SBHardwareButtonGestureParameters)buttonGestureParameters;
- (SBHomeHardwareButton)homeHardwareButton;
- (SBLockHardwareButton)initWithScreenshotGestureRecognizer:(id)a3 shutdownGestureRecognizer:(id)a4 proximitySensorManager:(id)a5 homeHardwareButton:(id)a6 volumeHardwareButton:(id)a7 buttonActions:(id)a8 homeButtonType:(int64_t)a9 createGestures:(BOOL)a10;
- (SBLockHardwareButton)initWithScreenshotGestureRecognizer:(id)a3 shutdownGestureRecognizer:(id)a4 proximitySensorManager:(id)a5 homeHardwareButton:(id)a6 volumeHardwareButton:(id)a7 homeButtonType:(int64_t)a8;
- (SBLockHardwareButtonActions)buttonActions;
- (SBLongPressGestureRecognizer)longPressGestureRecognizer;
- (SBLongPressGestureRecognizer)shutdownGestureRecognizer;
- (SBLongPressGestureRecognizer)terminalLockLongPressGestureRecognizer;
- (SBPressGestureRecognizer)buttonDownGestureRecognizer;
- (SBVolumeHardwareButton)volumeHardwareButton;
- (UIGestureRecognizer)screenshotGestureRecognizer;
- (id)hardwareButtonGestureParameters;
- (id)hardwareButtonIdentifier;
- (id)preemptablePressGestureRecognizers;
- (int64_t)homeButtonType;
- (unint64_t)configuredMaximumPressCount;
- (unint64_t)currentPressCount;
- (void)_cancelGestureRecognizer:(id)a3;
- (void)_cancelLongPressRecognizer:(id)a3;
- (void)_createGestureRecognizers;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_reconfigureButtonGestureRecognizers;
- (void)_reportAggdLoggingForButtonEventIsDownEvent:(BOOL)a3;
- (void)_updatePressCountForDownEvent;
- (void)buttonDown:(id)a3;
- (void)cancelHardwareButtonPress;
- (void)cancelLongPress;
- (void)doublePress:(id)a3;
- (void)forceResetSequenceDidBegin;
- (void)longPress:(id)a3;
- (void)provider:(id)a3 didUpdateButtonGestureParameters:(id)a4;
- (void)quadruplePress:(id)a3;
- (void)screenshotRecognizerDidRecognize:(id)a3;
- (void)setButtonActions:(id)a3;
- (void)setButtonActiveAssertion:(id)a3;
- (void)setButtonDownGestureRecognizer:(id)a3;
- (void)setButtonGestureParameters:(id)a3;
- (void)setConfiguredMaximumPressCount:(unint64_t)a3;
- (void)setCurrentPressCount:(unint64_t)a3;
- (void)setDoublePressGestureRecognizer:(id)a3;
- (void)setHardwareButtonCoordinator:(id)a3;
- (void)setHomeButtonType:(int64_t)a3;
- (void)setHomeHardwareButton:(id)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setQuadruplePressGestureRecognizer:(id)a3;
- (void)setScreenshotGestureRecognizer:(id)a3;
- (void)setShutdownGestureRecognizer:(id)a3;
- (void)setSinglePressGestureRecognizer:(id)a3;
- (void)setTerminalLockLongPressGestureRecognizer:(id)a3;
- (void)setTriplePressGestureRecognizer:(id)a3;
- (void)setVolumeHardwareButton:(id)a3;
- (void)singlePress:(id)a3;
- (void)terminalLockLongPress:(id)a3;
- (void)triplePress:(id)a3;
@end

@implementation SBLockHardwareButton

- (SBLockHardwareButton)initWithScreenshotGestureRecognizer:(id)a3 shutdownGestureRecognizer:(id)a4 proximitySensorManager:(id)a5 homeHardwareButton:(id)a6 volumeHardwareButton:(id)a7 homeButtonType:(int64_t)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = [[SBLockHardwareButtonActions alloc] initWithHomeButtonType:a8 proximitySensorManager:v16];
  LOBYTE(v22) = 1;
  v20 = [(SBLockHardwareButton *)self initWithScreenshotGestureRecognizer:v18 shutdownGestureRecognizer:v17 proximitySensorManager:v16 homeHardwareButton:v15 volumeHardwareButton:v14 buttonActions:v19 homeButtonType:a8 createGestures:v22];

  return v20;
}

- (SBLockHardwareButton)initWithScreenshotGestureRecognizer:(id)a3 shutdownGestureRecognizer:(id)a4 proximitySensorManager:(id)a5 homeHardwareButton:(id)a6 volumeHardwareButton:(id)a7 buttonActions:(id)a8 homeButtonType:(int64_t)a9 createGestures:(BOOL)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)SBLockHardwareButton;
  v20 = [(SBLockHardwareButton *)&v25 init];
  v21 = v20;
  if (v20)
  {
    v20->_lastPressDownTime = -1.79769313e308;
    objc_storeWeak((id *)&v20->_screenshotGestureRecognizer, v15);
    objc_storeWeak((id *)&v21->_shutdownGestureRecognizer, v16);
    objc_storeWeak((id *)&v21->_homeHardwareButton, v17);
    objc_storeWeak((id *)&v21->_volumeHardwareButton, v18);
    v21->_homeButtonType = a9;
    objc_storeStrong((id *)&v21->_buttonActions, a8);
    [(SBHardwareButtonGestureParametersProviderBase *)v21->_buttonActions addHardwareButtonGestureParametersObserver:v21];
    uint64_t v22 = [(SBLockHardwareButtonActions *)v21->_buttonActions hardwareButtonGestureParameters];
    buttonGestureParameters = v21->_buttonGestureParameters;
    v21->_buttonGestureParameters = (SBHardwareButtonGestureParameters *)v22;

    if (a10) {
      [(SBLockHardwareButton *)v21 _createGestureRecognizers];
    }
  }

  return v21;
}

- (void)_createGestureRecognizers
{
  v3 = [[SBPressGestureRecognizer alloc] initWithTarget:self action:sel_buttonDown_];
  buttonDownGestureRecognizer = self->_buttonDownGestureRecognizer;
  self->_buttonDownGestureRecognizer = v3;

  [(SBPressGestureRecognizer *)self->_buttonDownGestureRecognizer setName:@"LockButton-buttonDown"];
  [(SBPressGestureRecognizer *)self->_buttonDownGestureRecognizer setAllowedPressTypes:&unk_1F3348420];
  [(SBPressGestureRecognizer *)self->_buttonDownGestureRecognizer setDelegate:self];
  v5 = +[SBSystemGestureManager mainDisplayManager];
  [v5 addGestureRecognizer:self->_buttonDownGestureRecognizer withType:79];

  v6 = [[SBClickGestureRecognizer alloc] initWithTarget:self action:sel_singlePress_];
  singlePressGestureRecognizer = self->_singlePressGestureRecognizer;
  self->_singlePressGestureRecognizer = v6;

  [(SBClickGestureRecognizer *)self->_singlePressGestureRecognizer setName:@"LockButton-singlePress"];
  [(SBPressGestureRecognizer *)self->_singlePressGestureRecognizer setAllowedPressTypes:&unk_1F3348438];
  [(SBClickGestureRecognizer *)self->_singlePressGestureRecognizer addShortcutWithPressTypes:&unk_1F3348450];
  [(SBClickGestureRecognizer *)self->_singlePressGestureRecognizer addShortcutWithPressTypes:&unk_1F3348468];
  [(SBClickGestureRecognizer *)self->_singlePressGestureRecognizer setDelegate:self];
  v8 = +[SBSystemGestureManager mainDisplayManager];
  [v8 addGestureRecognizer:self->_singlePressGestureRecognizer withType:80];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_screenshotGestureRecognizer);
  [(SBClickGestureRecognizer *)self->_singlePressGestureRecognizer requireGestureRecognizerToFail:WeakRetained];
  [WeakRetained addTarget:self action:sel_screenshotRecognizerDidRecognize_];
  v9 = [[SBLongPressGestureRecognizer alloc] initWithTarget:self action:sel_terminalLockLongPress_];
  terminalLockLongPressGestureRecognizer = self->_terminalLockLongPressGestureRecognizer;
  self->_terminalLockLongPressGestureRecognizer = v9;

  [(SBLongPressGestureRecognizer *)self->_terminalLockLongPressGestureRecognizer setName:@"LockButton-terminalLockLongPress"];
  [(SBPressGestureRecognizer *)self->_terminalLockLongPressGestureRecognizer setAllowedPressTypes:&unk_1F3348480];
  [(SBLongPressGestureRecognizer *)self->_terminalLockLongPressGestureRecognizer setDelegate:self];
  [(SBLongPressGestureRecognizer *)self->_terminalLockLongPressGestureRecognizer setMinimumPressDuration:0.75];
  [(SBClickGestureRecognizer *)self->_terminalLockLongPressGestureRecognizer setMaximumClickFormationDuration:0.75];
  v11 = +[SBSystemGestureManager mainDisplayManager];
  [v11 addGestureRecognizer:self->_terminalLockLongPressGestureRecognizer withType:85];

  v12 = [[SBLongPressGestureRecognizer alloc] initWithTarget:self action:sel_longPress_];
  longPressGestureRecognizer = self->_longPressGestureRecognizer;
  self->_longPressGestureRecognizer = v12;

  [(SBLongPressGestureRecognizer *)self->_longPressGestureRecognizer setName:@"LockButton-longPress"];
  [(SBPressGestureRecognizer *)self->_longPressGestureRecognizer setAllowedPressTypes:&unk_1F3348498];
  [(SBLongPressGestureRecognizer *)self->_longPressGestureRecognizer setDelegate:self];
  id v14 = self->_longPressGestureRecognizer;
  [(SBHardwareButtonGestureParameters *)self->_buttonGestureParameters longPressTimeInterval];
  -[SBLongPressGestureRecognizer setMinimumPressDuration:](v14, "setMinimumPressDuration:");
  id v15 = self->_longPressGestureRecognizer;
  [(SBHardwareButtonGestureParameters *)self->_buttonGestureParameters longPressTimeInterval];
  -[SBClickGestureRecognizer setMaximumClickFormationDuration:](v15, "setMaximumClickFormationDuration:");
  id v16 = +[SBSystemGestureManager mainDisplayManager];
  [v16 addGestureRecognizer:self->_longPressGestureRecognizer withType:81];

  id v17 = objc_loadWeakRetained((id *)&self->_shutdownGestureRecognizer);
  if (v17)
  {
    [(SBHardwareButtonGestureParameters *)self->_buttonGestureParameters longPressTimeInterval];
    objc_msgSend(v17, "setMaximumClickFormationDuration:");
    [(SBLongPressGestureRecognizer *)self->_longPressGestureRecognizer requireGestureRecognizerToFail:v17];
  }
  id v18 = [[SBClickGestureRecognizer alloc] initWithTarget:self action:sel_doublePress_];
  doublePressGestureRecognizer = self->_doublePressGestureRecognizer;
  self->_doublePressGestureRecognizer = v18;

  [(SBClickGestureRecognizer *)self->_doublePressGestureRecognizer setName:@"LockButton-doublePress"];
  [(SBPressGestureRecognizer *)self->_doublePressGestureRecognizer setAllowedPressTypes:&unk_1F33484B0];
  [(SBClickGestureRecognizer *)self->_doublePressGestureRecognizer setNumberOfClicksRequired:2];
  [(SBClickGestureRecognizer *)self->_doublePressGestureRecognizer setDelegate:self];
  v20 = +[SBSystemGestureManager mainDisplayManager];
  [v20 addGestureRecognizer:self->_doublePressGestureRecognizer withType:82];

  if (self->_homeButtonType == 2)
  {
    v21 = [[SBClickGestureRecognizer alloc] initWithTarget:self action:sel_triplePress_];
    triplePressGestureRecognizer = self->_triplePressGestureRecognizer;
    self->_triplePressGestureRecognizer = v21;

    [(SBClickGestureRecognizer *)self->_triplePressGestureRecognizer setName:@"LockButton-triplePress"];
    [(SBPressGestureRecognizer *)self->_triplePressGestureRecognizer setAllowedPressTypes:&unk_1F33484C8];
    [(SBClickGestureRecognizer *)self->_triplePressGestureRecognizer setNumberOfClicksRequired:3];
    [(SBClickGestureRecognizer *)self->_triplePressGestureRecognizer setDelegate:self];
    v23 = +[SBSystemGestureManager mainDisplayManager];
    [v23 addGestureRecognizer:self->_triplePressGestureRecognizer withType:83];

    v24 = [[SBClickGestureRecognizer alloc] initWithTarget:self action:sel_quadruplePress_];
    quadruplePressGestureRecognizer = self->_quadruplePressGestureRecognizer;
    self->_quadruplePressGestureRecognizer = v24;

    [(SBClickGestureRecognizer *)self->_quadruplePressGestureRecognizer setName:@"LockButton-quadruplePress"];
    [(SBPressGestureRecognizer *)self->_quadruplePressGestureRecognizer setAllowedPressTypes:&unk_1F33484E0];
    [(SBClickGestureRecognizer *)self->_quadruplePressGestureRecognizer setNumberOfClicksRequired:4];
    [(SBClickGestureRecognizer *)self->_quadruplePressGestureRecognizer setDelegate:self];
    v26 = +[SBSystemGestureManager mainDisplayManager];
    [v26 addGestureRecognizer:self->_quadruplePressGestureRecognizer withType:84];
  }
  [(SBClickGestureRecognizer *)self->_singlePressGestureRecognizer requireGestureRecognizerToFail:self->_longPressGestureRecognizer];
  [(SBClickGestureRecognizer *)self->_singlePressGestureRecognizer requireGestureRecognizerToFail:self->_terminalLockLongPressGestureRecognizer];
  [(SBClickGestureRecognizer *)self->_singlePressGestureRecognizer requireGestureRecognizerToFail:WeakRetained];
  [(SBLockHardwareButton *)self _reconfigureButtonGestureRecognizers];
}

- (void)screenshotRecognizerDidRecognize:(id)a3
{
  if ([a3 state] == 3)
  {
    [(SBLockHardwareButton *)self cancelLongPress];
    [(SBLockHardwareButtonActions *)self->_buttonActions performButtonUpPreActions];
    buttonActions = self->_buttonActions;
    [(SBLockHardwareButtonActions *)buttonActions performFinalButtonUpActions];
  }
}

- (void)_reconfigureButtonGestureRecognizers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = SBLogButtonsLock();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    buttonGestureParameters = self->_buttonGestureParameters;
    int v13 = 138543362;
    id v14 = buttonGestureParameters;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "reconfigured lock button: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  longPressGestureRecognizer = self->_longPressGestureRecognizer;
  [(SBHardwareButtonGestureParameters *)self->_buttonGestureParameters longPressTimeInterval];
  -[SBLongPressGestureRecognizer setMinimumPressDuration:](longPressGestureRecognizer, "setMinimumPressDuration:");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shutdownGestureRecognizer);
  [(SBHardwareButtonGestureParameters *)self->_buttonGestureParameters longPressTimeInterval];
  objc_msgSend(WeakRetained, "setMaximumClickFormationDuration:");

  int64_t v7 = [(SBHardwareButtonGestureParameters *)self->_buttonGestureParameters maximumPressCount];
  if (self->_configuredMaximumPressCount != v7)
  {
    uint64_t v8 = v7;
    self->_configuredMaximumPressCount = v7;
    BOOL v9 = v7 > 2;
    [(SBClickGestureRecognizer *)self->_doublePressGestureRecognizer setEnabled:v7 > 1];
    [(SBClickGestureRecognizer *)self->_triplePressGestureRecognizer setEnabled:v9];
    [(SBClickGestureRecognizer *)self->_quadruplePressGestureRecognizer setEnabled:v9];
    if (v8 < 3)
    {
      [(SBClickGestureRecognizer *)self->_doublePressGestureRecognizer removeFailureRequirement:self->_triplePressGestureRecognizer];
    }
    else
    {
      v10 = SBLogButtonsLock();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "triple-click enabled", (uint8_t *)&v13, 2u);
      }

      [(SBClickGestureRecognizer *)self->_doublePressGestureRecognizer requireGestureRecognizerToFail:self->_triplePressGestureRecognizer];
    }
  }
  if (self->_homeButtonType == 2)
  {
    _AXSSideButtonClickSpeed();
    double v12 = v11;
    [(SBClickGestureRecognizer *)self->_singlePressGestureRecognizer setMaximumBetweenClicksDelay:v11];
    [(SBClickGestureRecognizer *)self->_doublePressGestureRecognizer setMaximumBetweenClicksDelay:v12];
    [(SBClickGestureRecognizer *)self->_triplePressGestureRecognizer setMaximumBetweenClicksDelay:v12];
    [(SBClickGestureRecognizer *)self->_quadruplePressGestureRecognizer setMaximumBetweenClicksDelay:v12];
  }
}

- (BOOL)isButtonDown
{
  return [(SBLockHardwareButtonActions *)self->_buttonActions isButtonDown];
}

- (BOOL)reverseFadeOutIfNeeded
{
  return [(SBLockHardwareButtonActions *)self->_buttonActions reverseFadeOutIfNeeded];
}

- (void)forceResetSequenceDidBegin
{
  v3 = SBLogButtonsLock();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Failing long press due to pending force reset sequence", v4, 2u);
  }

  [(SBLockHardwareButton *)self cancelLongPress];
  [(SBLockHardwareButtonActions *)self->_buttonActions performForceResetSequenceBeganActions];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v4 = (SBLongPressGestureRecognizer *)a3;
  v5 = [(id)SBApp restartManager];
  v6 = v5;
  if (v5)
  {
    int64_t v7 = [v5 startupTransition];

    if (!v7)
    {
      if ([v6 isPendingExit])
      {
        uint64_t v8 = SBLogButtonsLock();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_7;
        }
        BOOL v9 = [(UIGestureRecognizer *)v4 sb_briefDescription];
        v10 = [v6 pendingRestartTransitionRequest];
        *(_DWORD *)buf = 138543618;
        v32 = v9;
        __int16 v33 = 2114;
        v34 = v10;
        float v11 = "Preventing lock recognizer (%{public}@) because we are pending a restart: %{public}@";
        goto LABEL_5;
      }
      if ((SBLongPressGestureRecognizer *)self->_buttonDownGestureRecognizer != v4)
      {
        if (![(SBLockHardwareButton *)self _shouldRunActions])
        {
          uint64_t v8 = SBLogButtonsLock();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_7;
          }
          BOOL v9 = [(UIGestureRecognizer *)v4 sb_briefDescription];
          *(_DWORD *)buf = 138543362;
          v32 = v9;
          id v17 = "Preventing lock recognizer (%{public}@) because hardware button coordinator says nope";
          id v18 = v8;
          goto LABEL_40;
        }
        if ((SBLongPressGestureRecognizer *)self->_singlePressGestureRecognizer == v4)
        {
          buttonActions = self->_buttonActions;
          id v30 = 0;
          BOOL v15 = [(SBLockHardwareButtonActions *)buttonActions disallowsSinglePressForReason:&v30];
          id v16 = v30;
          uint64_t v8 = v16;
          if (v15)
          {
            BOOL v9 = SBLogButtonsLock();
            if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_6;
            }
            *(_DWORD *)buf = 138543362;
            v32 = v8;
            id v17 = "Single press recognizer disallowed for reason: %{public}@";
            goto LABEL_39;
          }
        }
        if ((SBLongPressGestureRecognizer *)self->_doublePressGestureRecognizer == v4)
        {
          id v19 = self->_buttonActions;
          id v29 = 0;
          BOOL v20 = [(SBLockHardwareButtonActions *)v19 disallowsDoublePressForReason:&v29];
          v21 = v29;
          uint64_t v8 = v21;
          if (v20)
          {
            BOOL v9 = SBLogButtonsLock();
            if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_6;
            }
            *(_DWORD *)buf = 138543362;
            v32 = v8;
            id v17 = "Double press recognizer disallowed for reason: %{public}@";
            goto LABEL_39;
          }
        }
        if ((SBLongPressGestureRecognizer *)self->_triplePressGestureRecognizer == v4
          || (SBLongPressGestureRecognizer *)self->_quadruplePressGestureRecognizer == v4)
        {
          uint64_t v22 = self->_buttonActions;
          id v28 = 0;
          BOOL v23 = [(SBLockHardwareButtonActions *)v22 disallowsTriplePressForReason:&v28];
          v24 = v28;
          uint64_t v8 = v24;
          if (v23)
          {
            BOOL v9 = SBLogButtonsLock();
            if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_6;
            }
            *(_DWORD *)buf = 138543362;
            v32 = v8;
            id v17 = ">= Triple press recognizer disallowed for reason: %{public}@";
            goto LABEL_39;
          }
        }
        if (self->_longPressGestureRecognizer == v4 || self->_terminalLockLongPressGestureRecognizer == v4)
        {
          objc_super v25 = self->_buttonActions;
          id v27 = 0;
          BOOL v26 = [(SBLockHardwareButtonActions *)v25 disallowsLongPressForReason:&v27];
          uint64_t v8 = v27;
          if (!v26)
          {
            BOOL v12 = 1;
            goto LABEL_8;
          }
          BOOL v9 = SBLogButtonsLock();
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_6;
          }
          *(_DWORD *)buf = 138543362;
          v32 = v8;
          id v17 = "Long press recognizer disallowed for reason: %{public}@";
LABEL_39:
          id v18 = v9;
LABEL_40:
          _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
          goto LABEL_6;
        }
      }
      BOOL v12 = 1;
      goto LABEL_9;
    }
  }
  uint64_t v8 = SBLogButtonsLock();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = [(UIGestureRecognizer *)v4 sb_briefDescription];
    v10 = [v6 startupTransition];
    *(_DWORD *)buf = 138543618;
    v32 = v9;
    __int16 v33 = 2114;
    v34 = v10;
    float v11 = "Preventing lock recognizer (%{public}@) because we're in a startup transition: %{public}@";
LABEL_5:
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, v11, buf, 0x16u);

LABEL_6:
  }
LABEL_7:
  BOOL v12 = 0;
LABEL_8:

LABEL_9:
  return v12;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  v6 = (SBClickGestureRecognizer *)a3;
  int64_t v7 = (SBClickGestureRecognizer *)a4;
  uint64_t v8 = v7;
  if (self->_singlePressGestureRecognizer == v6 && self->_doublePressGestureRecognizer == v7)
  {
    buttonActions = self->_buttonActions;
    uint64_t v15 = 0;
    BOOL v12 = [(SBLockHardwareButtonActions *)buttonActions disallowsDoublePressForReason:&v15];
    BOOL v9 = !v12;
    if (!v12)
    {
      int v13 = SBLogButtonsLock();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = 0;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Requiring double-press failure for single-press", (uint8_t *)&v14, 2u);
      }
    }
  }
  else
  {
    BOOL v9 = self->_triplePressGestureRecognizer == v6
      && self->_quadruplePressGestureRecognizer == v7
      && [MEMORY[0x1E4F97B90] SOSTriggerClickCount] > 3;
  }

  return v9;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  if (self->_singlePressGestureRecognizer == a3) {
    [(SBLockHardwareButtonActions *)self->_buttonActions performSinglePressDidFailActions];
  }
}

- (id)preemptablePressGestureRecognizers
{
  v5[2] = *MEMORY[0x1E4F143B8];
  doublePressGestureRecognizer = self->_doublePressGestureRecognizer;
  v5[0] = self->_singlePressGestureRecognizer;
  v5[1] = doublePressGestureRecognizer;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  return v3;
}

- (void)_updatePressCountForDownEvent
{
  BSContinuousMachTimeNow();
  double v4 = v3 - self->_lastPressDownTime;
  [(SBClickGestureRecognizer *)self->_singlePressGestureRecognizer maximumBetweenClicksDelay];
  if (v4 <= v5)
  {
    unint64_t v6 = self->_currentPressCount + 1;
  }
  else
  {
    self->_currentPressCount = 0;
    unint64_t v6 = 1;
  }
  self->_currentPressCount = v6;
  if (v6 > self->_configuredMaximumPressCount) {
    unint64_t v6 = 1;
  }
  self->_currentPressCount = v6;
  BSContinuousMachTimeNow();
  self->_lastPressDownTime = v7;
}

- (BOOL)_shouldRunActions
{
  hardwareButtonCoordinator = self->_hardwareButtonCoordinator;
  double v3 = [(SBLockHardwareButton *)self hardwareButtonIdentifier];
  LOBYTE(hardwareButtonCoordinator) = [(SBHardwareButtonCoordinator *)hardwareButtonCoordinator buttonShouldStart:v3];

  return (char)hardwareButtonCoordinator;
}

- (void)buttonDown:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = SBLogButtonsLock();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 67109120;
    int v18 = [v4 state];
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Lock button down: state=%d", (uint8_t *)&v17, 8u);
  }

  BOOL v6 = [(SBLockHardwareButton *)self _shouldRunActions];
  uint64_t v7 = [v4 state];
  if ((unint64_t)(v7 - 3) >= 3)
  {
    if (v7 == 1)
    {
      [(SBLockHardwareButton *)self _updatePressCountForDownEvent];
      [(SBLockHardwareButton *)self _reportAggdLoggingForButtonEventIsDownEvent:1];
      BOOL v9 = SBLogButtonsLock();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t currentPressCount = self->_currentPressCount;
        int v17 = 67109120;
        int v18 = currentPressCount;
        _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "press count:%d", (uint8_t *)&v17, 8u);
      }

      if (!self->_buttonActiveAssertion)
      {
        hardwareButtonCoordinator = self->_hardwareButtonCoordinator;
        BOOL v12 = [(SBLockHardwareButton *)self hardwareButtonIdentifier];
        int v13 = [(SBHardwareButtonCoordinator *)hardwareButtonCoordinator assertButtonIsActive:v12 dropletHintIdentifier:2];
        buttonActiveAssertion = self->_buttonActiveAssertion;
        self->_buttonActiveAssertion = v13;
      }
      if (v6)
      {
        unint64_t v15 = self->_currentPressCount;
        if (v15 == 1)
        {
          [(SBLockHardwareButtonActions *)self->_buttonActions performInitialButtonDownActions];
          unint64_t v15 = self->_currentPressCount;
        }
        if (v15 == 2) {
          [(SBLockHardwareButtonActions *)self->_buttonActions performSecondButtonDownActions];
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_homeHardwareButton);
        [WeakRetained cancelLongPress];
      }
    }
  }
  else
  {
    [(BSInvalidatable *)self->_buttonActiveAssertion invalidate];
    uint64_t v8 = self->_buttonActiveAssertion;
    self->_buttonActiveAssertion = 0;

    [(SBLockHardwareButton *)self _reportAggdLoggingForButtonEventIsDownEvent:0];
    if (v6)
    {
      if (self->_currentPressCount == 1) {
        [(SBLockHardwareButtonActions *)self->_buttonActions performInitialButtonUpActions];
      }
      [(SBLockHardwareButtonActions *)self->_buttonActions performButtonUpPreActions];
    }
  }
}

- (void)singlePress:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = SBLogButtonsLock();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = [v4 state];
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Lock button single press: state=%d", (uint8_t *)v8, 8u);
  }

  if ([v4 state] == 3 && -[SBLockHardwareButton _shouldRunActions](self, "_shouldRunActions"))
  {
    BOOL v6 = SBLogButtonsLock();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Lock button single press recognized.", (uint8_t *)v8, 2u);
    }

    if ([(SBLockHardwareButtonActions *)self->_buttonActions performButtonUpPreActions])
    {
      [(SBLockHardwareButtonActions *)self->_buttonActions performSinglePressAction];
    }
    else
    {
      uint64_t v7 = SBLogButtonsLock();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8[0]) = 0;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Lock button single tap action handled with result: single tap pre-actions handled it.", (uint8_t *)v8, 2u);
      }
    }
  }
}

- (void)terminalLockLongPress:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = SBLogButtonsLock();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 state];
    [v4 minimumPressDuration];
    v9[0] = 67109376;
    v9[1] = v6;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "TerminalLock button long press: state=%d, duration: %f", (uint8_t *)v9, 0x12u);
  }

  if ([v4 state] == 1)
  {
    uint64_t v8 = SBLogButtonsLock();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "TerminalLock button long press recognized.", (uint8_t *)v9, 2u);
    }

    [(SBLockHardwareButtonActions *)self->_buttonActions performTerminalLockLongPressActions];
  }
  if ([v4 state] == 3) {
    [(SBLockHardwareButtonActions *)self->_buttonActions performFinalButtonUpActions];
  }
}

- (void)longPress:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = SBLogButtonsLock();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 state];
    [v4 minimumPressDuration];
    v10[0] = 67109376;
    v10[1] = v6;
    __int16 v11 = 2048;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Lock button long press: state=%d, duration: %f", (uint8_t *)v10, 0x12u);
  }

  if ([(SBLockHardwareButton *)self _shouldRunActions])
  {
    if ([v4 state] == 1)
    {
      uint64_t v8 = SBLogButtonsLock();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10[0]) = 0;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Lock button long press recognized.", (uint8_t *)v10, 2u);
      }

      [(SBLockHardwareButtonActions *)self->_buttonActions performLongPressActions];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_homeHardwareButton);
      [WeakRetained cancelLongPress];
    }
    if ([v4 state] == 3) {
      [(SBLockHardwareButtonActions *)self->_buttonActions performFinalButtonUpActions];
    }
  }
}

- (void)doublePress:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = SBLogButtonsLock();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = [v4 state];
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "double press: state:%d", (uint8_t *)v7, 8u);
  }

  if (-[SBLockHardwareButton _shouldRunActions](self, "_shouldRunActions") && [v4 state] == 3)
  {
    int v6 = SBLogButtonsLock();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "double press recognized", (uint8_t *)v7, 2u);
    }

    [(SBLockHardwareButtonActions *)self->_buttonActions performDoublePressActions];
  }
}

- (void)triplePress:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = SBLogButtonsLock();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = [v4 state];
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "triple press: state:%d", (uint8_t *)v7, 8u);
  }

  if (-[SBLockHardwareButton _shouldRunActions](self, "_shouldRunActions") && [v4 state] == 3)
  {
    int v6 = SBLogButtonsLock();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "triple press recognized", (uint8_t *)v7, 2u);
    }

    [(SBLockHardwareButtonActions *)self->_buttonActions performTriplePressActions];
  }
}

- (void)quadruplePress:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = SBLogButtonsLock();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = [v3 state];
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "quadruple press: state:%d", (uint8_t *)v5, 8u);
  }
}

- (void)_cancelLongPressRecognizer:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((unint64_t)[v3 state] <= 2)
  {
    id v4 = SBLogButtonsLock();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      double v5 = [v3 name];
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ canceled", (uint8_t *)&v6, 0xCu);
    }
    [v3 setEnabled:0];
    [v3 setEnabled:1];
  }
}

- (void)cancelLongPress
{
  [(SBLockHardwareButton *)self _cancelLongPressRecognizer:self->_longPressGestureRecognizer];
  [(SBLockHardwareButton *)self _cancelLongPressRecognizer:self->_terminalLockLongPressGestureRecognizer];
  buttonActions = self->_buttonActions;
  [(SBLockHardwareButtonActions *)buttonActions performLongPressCancelledActions];
}

- (void)_reportAggdLoggingForButtonEventIsDownEvent:(BOOL)a3
{
  BOOL v3 = a3;
  [(SBLongPressGestureRecognizer *)self->_longPressGestureRecognizer minimumPressDuration];
  if (v3)
  {
    self->_aggdStartTime = mach_absolute_time();
  }
  else if (self->_aggdStartTime)
  {
    double v6 = v5;
    mach_absolute_time();
    BSAbsoluteTimeFromMachTime();
    double v8 = v7;
    BSAbsoluteTimeFromMachTime();
    if (v8 - v9 > v6) {
      ADPushTimeIntervalForDistributionKeySinceStartTime();
    }
    self->_aggdStartTime = 0;
  }
}

- (void)provider:(id)a3 didUpdateButtonGestureParameters:(id)a4
{
  id v7 = a4;
  if (self->_buttonActions == a3)
  {
    id v8 = v7;
    objc_storeStrong((id *)&self->_buttonGestureParameters, a4);
    [(SBHardwareButtonGestureParametersProviderBase *)self publishUpdatedParameters:self->_buttonGestureParameters];
    [(SBLockHardwareButton *)self _reconfigureButtonGestureRecognizers];
    id v7 = v8;
  }
}

- (id)hardwareButtonGestureParameters
{
  return self->_buttonGestureParameters;
}

- (void)_cancelGestureRecognizer:(id)a3
{
  id v3 = a3;
  if ([v3 isEnabled])
  {
    [v3 setEnabled:0];
    [v3 setEnabled:1];
  }
}

- (void)cancelHardwareButtonPress
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screenshotGestureRecognizer);
  [(SBLockHardwareButton *)self _cancelGestureRecognizer:WeakRetained];

  [(SBLockHardwareButton *)self _cancelGestureRecognizer:self->_singlePressGestureRecognizer];
  [(SBLockHardwareButton *)self _cancelGestureRecognizer:self->_doublePressGestureRecognizer];
  [(SBLockHardwareButton *)self _cancelGestureRecognizer:self->_triplePressGestureRecognizer];
  [(SBLockHardwareButton *)self _cancelGestureRecognizer:self->_quadruplePressGestureRecognizer];
  [(SBLockHardwareButton *)self cancelLongPress];
}

- (id)hardwareButtonIdentifier
{
  return @"Lock";
}

- (SBHardwareButtonCoordinator)hardwareButtonCoordinator
{
  return self->_hardwareButtonCoordinator;
}

- (void)setHardwareButtonCoordinator:(id)a3
{
}

- (SBLockHardwareButtonActions)buttonActions
{
  return self->_buttonActions;
}

- (void)setButtonActions:(id)a3
{
}

- (SBHardwareButtonGestureParameters)buttonGestureParameters
{
  return self->_buttonGestureParameters;
}

- (void)setButtonGestureParameters:(id)a3
{
}

- (SBPressGestureRecognizer)buttonDownGestureRecognizer
{
  return self->_buttonDownGestureRecognizer;
}

- (void)setButtonDownGestureRecognizer:(id)a3
{
}

- (SBClickGestureRecognizer)singlePressGestureRecognizer
{
  return self->_singlePressGestureRecognizer;
}

- (void)setSinglePressGestureRecognizer:(id)a3
{
}

- (SBLongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
}

- (SBClickGestureRecognizer)doublePressGestureRecognizer
{
  return self->_doublePressGestureRecognizer;
}

- (void)setDoublePressGestureRecognizer:(id)a3
{
}

- (SBClickGestureRecognizer)triplePressGestureRecognizer
{
  return self->_triplePressGestureRecognizer;
}

- (void)setTriplePressGestureRecognizer:(id)a3
{
}

- (SBClickGestureRecognizer)quadruplePressGestureRecognizer
{
  return self->_quadruplePressGestureRecognizer;
}

- (void)setQuadruplePressGestureRecognizer:(id)a3
{
}

- (SBLongPressGestureRecognizer)terminalLockLongPressGestureRecognizer
{
  return self->_terminalLockLongPressGestureRecognizer;
}

- (void)setTerminalLockLongPressGestureRecognizer:(id)a3
{
}

- (UIGestureRecognizer)screenshotGestureRecognizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screenshotGestureRecognizer);
  return (UIGestureRecognizer *)WeakRetained;
}

- (void)setScreenshotGestureRecognizer:(id)a3
{
}

- (SBLongPressGestureRecognizer)shutdownGestureRecognizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shutdownGestureRecognizer);
  return (SBLongPressGestureRecognizer *)WeakRetained;
}

- (void)setShutdownGestureRecognizer:(id)a3
{
}

- (SBHomeHardwareButton)homeHardwareButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeHardwareButton);
  return (SBHomeHardwareButton *)WeakRetained;
}

- (void)setHomeHardwareButton:(id)a3
{
}

- (SBVolumeHardwareButton)volumeHardwareButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_volumeHardwareButton);
  return (SBVolumeHardwareButton *)WeakRetained;
}

- (void)setVolumeHardwareButton:(id)a3
{
}

- (BSInvalidatable)buttonActiveAssertion
{
  return self->_buttonActiveAssertion;
}

- (void)setButtonActiveAssertion:(id)a3
{
}

- (int64_t)homeButtonType
{
  return self->_homeButtonType;
}

- (void)setHomeButtonType:(int64_t)a3
{
  self->_homeButtonType = a3;
}

- (unint64_t)configuredMaximumPressCount
{
  return self->_configuredMaximumPressCount;
}

- (void)setConfiguredMaximumPressCount:(unint64_t)a3
{
  self->_configuredMaximumPressCount = a3;
}

- (unint64_t)currentPressCount
{
  return self->_currentPressCount;
}

- (void)setCurrentPressCount:(unint64_t)a3
{
  self->_unint64_t currentPressCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonActiveAssertion, 0);
  objc_destroyWeak((id *)&self->_volumeHardwareButton);
  objc_destroyWeak((id *)&self->_homeHardwareButton);
  objc_destroyWeak((id *)&self->_shutdownGestureRecognizer);
  objc_destroyWeak((id *)&self->_screenshotGestureRecognizer);
  objc_storeStrong((id *)&self->_terminalLockLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_quadruplePressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_triplePressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doublePressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_singlePressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_buttonDownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_buttonGestureParameters, 0);
  objc_storeStrong((id *)&self->_buttonActions, 0);
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, 0);
}

@end