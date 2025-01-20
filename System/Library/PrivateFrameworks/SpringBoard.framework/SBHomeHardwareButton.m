@interface SBHomeHardwareButton
- (BKSButtonHapticsDefinition)buttonDefinition;
- (BOOL)_acceleratedSinglePressRecognizerShouldBegin;
- (BOOL)_isMenuDoublePressAllowed:(id *)a3;
- (BOOL)_isMenuDoublePressDisabled;
- (BOOL)_longPressGestureRecognizerShouldBegin:(id)a3;
- (BOOL)_processDoubleDownAndDoubleUpSimultaneously;
- (BOOL)emulateHomeButtonEventsIfNeeded:(__IOHIDEvent *)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isButtonDown;
- (BOOL)longPressDidOccur;
- (BOOL)supportsAcceleratedAppDismiss;
- (NSMutableDictionary)emulatedPerSenderDownCount;
- (SBHardwareButtonCoordinator)hardwareButtonCoordinator;
- (SBHardwareButtonGestureParameters)buttonGestureParameters;
- (SBHomeHardwareButton)initWithScreenshotGestureRecognizer:(id)a3 homeButtonType:(int64_t)a4;
- (SBHomeHardwareButton)initWithScreenshotGestureRecognizer:(id)a3 homeButtonType:(int64_t)a4 buttonActions:(id)a5 gestureRecognizerConfiguration:(id)a6;
- (SBHomeHardwareButtonActions)buttonActions;
- (SBHomeHardwareButtonGestureRecognizerConfiguration)gestureRecognizerConfiguration;
- (UIGestureRecognizer)screenshotGestureRecognizer;
- (id)hardwareButtonIdentifier;
- (int64_t)hapticType;
- (int64_t)homeButtonType;
- (int64_t)maximumPressCount;
- (int64_t)maximumTapCount;
- (void)_cancelGestureRecognizer:(id)a3;
- (void)_createGestureRecognizersWithConfiguration:(id)a3;
- (void)_reconfigureGestureRecognizersForNewMaximumPressCount:(int64_t)a3 oldMaximumPressCount:(int64_t)a4;
- (void)_reconfigureGestureRecognizersForNewMaximumTapCount:(int64_t)a3 oldMaximumTapCount:(int64_t)a4;
- (void)_reconfigureHomeButton;
- (void)_setFingerDetectionEnabled:(BOOL)a3;
- (void)_singlePressUp:(id)a3;
- (void)_startObservingReconfigurationTriggers;
- (void)_terminateHomeButtonEventAtCount:(int64_t)a3;
- (void)acceleratedSinglePressUp:(id)a3;
- (void)addHintSuppressionAssertion:(id)a3;
- (void)addLongPressDurationAssertion:(id)a3;
- (void)cancelHardwareButtonPress;
- (void)cancelLongPress;
- (void)configureForwardingToLockButton:(id)a3;
- (void)doublePressDown:(id)a3;
- (void)doublePressUp:(id)a3;
- (void)doubleTapUp:(id)a3;
- (void)initialButtonDown:(id)a3;
- (void)initialButtonUp:(id)a3;
- (void)longPress:(id)a3;
- (void)performAfterMenuButtonUpIsHandledUsingBlock:(id)a3;
- (void)performWhenMenuButtonIsUpUsingBlock:(id)a3;
- (void)provider:(id)a3 didUpdateButtonGestureParameters:(id)a4;
- (void)removeHintSuppressionAssertion:(id)a3;
- (void)removeLongPressDurationAssertion:(id)a3;
- (void)screenshotRecognizerDidRecognize:(id)a3;
- (void)setButtonActions:(id)a3;
- (void)setButtonDefinition:(id)a3;
- (void)setButtonGestureParameters:(id)a3;
- (void)setEmulatedPerSenderDownCount:(id)a3;
- (void)setGestureRecognizerConfiguration:(id)a3;
- (void)setHapticType:(int64_t)a3;
- (void)setHardwareButtonCoordinator:(id)a3;
- (void)setHomeButtonType:(int64_t)a3;
- (void)setLongPressDidOccur:(BOOL)a3;
- (void)setMaximumPressCount:(int64_t)a3;
- (void)setMaximumTapCount:(int64_t)a3;
- (void)setScreenshotGestureRecognizer:(id)a3;
- (void)singlePressUp:(id)a3;
- (void)triplePressUp:(id)a3;
@end

@implementation SBHomeHardwareButton

- (SBHomeHardwareButton)initWithScreenshotGestureRecognizer:(id)a3 homeButtonType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [[SBHomeHardwareButtonActions alloc] initWitHomeButtonType:a4];
  v8 = objc_alloc_init(SBHomeHardwareButtonGestureRecognizerConfiguration);
  v9 = +[SBSystemGestureManager mainDisplayManager];
  [(SBHomeHardwareButtonGestureRecognizerConfiguration *)v8 setSystemGestureManager:v9];

  v10 = [(UIHBClickGestureRecognizer *)[SBHBInitialPressDownGestureRecognizer alloc] initWithTarget:0 action:0];
  [(SBHomeHardwareButtonGestureRecognizerConfiguration *)v8 setInitialButtonDownGestureRecognizer:v10];

  v11 = [(UIHBClickGestureRecognizer *)[SBHBInitialPressUpGestureRecognizer alloc] initWithTarget:0 action:0];
  [(SBHomeHardwareButtonGestureRecognizerConfiguration *)v8 setInitialButtonUpGestureRecognizer:v11];

  v12 = [(UIHBClickGestureRecognizer *)[SBHBSinglePressUpGestureRecognizer alloc] initWithTarget:0 action:0];
  [(SBHomeHardwareButtonGestureRecognizerConfiguration *)v8 setSinglePressUpGestureRecognizer:v12];

  v13 = [(UIHBClickGestureRecognizer *)[SBHBAcceleratedSinglePressUpGestureRecognizer alloc] initWithTarget:0 action:0];
  [(SBHomeHardwareButtonGestureRecognizerConfiguration *)v8 setAcceleratedSinglePressUpGestureRecognizer:v13];

  v14 = [(UIHBLongClickGestureRecognizer *)[SBHBLongPressGestureRecognizer alloc] initWithTarget:0 action:0];
  [(SBHomeHardwareButtonGestureRecognizerConfiguration *)v8 setLongPressGestureRecognizer:v14];

  v15 = [(UIHBClickGestureRecognizer *)[SBHBDoublePressDownGestureRecognizer alloc] initWithTarget:0 action:0];
  [(SBHomeHardwareButtonGestureRecognizerConfiguration *)v8 setDoublePressDownGestureRecognizer:v15];

  v16 = [(UIHBClickGestureRecognizer *)[SBHBDoublePressUpGestureRecognizer alloc] initWithTarget:0 action:0];
  [(SBHomeHardwareButtonGestureRecognizerConfiguration *)v8 setDoublePressUpGestureRecognizer:v16];

  v17 = [(UIHBClickGestureRecognizer *)[SBHBTriplePressUpGestureRecognizer alloc] initWithTarget:0 action:0];
  [(SBHomeHardwareButtonGestureRecognizerConfiguration *)v8 setTriplePressUpGestureRecognizer:v17];

  v18 = [(UIHBClickGestureRecognizer *)[SBHBDoubleTapUpGestureRecognizer alloc] initWithTarget:0 action:0];
  [(SBHomeHardwareButtonGestureRecognizerConfiguration *)v8 setDoubleTapUpGestureRecognizer:v18];

  v19 = [(SBHomeHardwareButton *)self initWithScreenshotGestureRecognizer:v6 homeButtonType:a4 buttonActions:v7 gestureRecognizerConfiguration:v8];
  return v19;
}

- (SBHomeHardwareButton)initWithScreenshotGestureRecognizer:(id)a3 homeButtonType:(int64_t)a4 buttonActions:(id)a5 gestureRecognizerConfiguration:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SBHomeHardwareButton;
  v13 = [(SBHomeHardwareButton *)&v20 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_screenshotGestureRecognizer, v10);
    v14->_homeButtonType = a4;
    [(SBHomeHardwareButton *)v14 _createGestureRecognizersWithConfiguration:v12];
    objc_storeStrong((id *)&v14->_buttonActions, a5);
    [(SBHardwareButtonGestureParametersProviderBase *)v14->_buttonActions addHardwareButtonGestureParametersObserver:v14];
    uint64_t v15 = [(SBHomeHardwareButtonActions *)v14->_buttonActions hardwareButtonGestureParameters];
    buttonGestureParameters = v14->_buttonGestureParameters;
    v14->_buttonGestureParameters = (SBHardwareButtonGestureParameters *)v15;

    if ([v12 shouldConfigureDependencies])
    {
      [(SBHomeHardwareButton *)v14 _reconfigureHomeButton];
      [(SBHomeHardwareButton *)v14 _startObservingReconfigurationTriggers];
    }
    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    hintSuppressionAssertions = v14->_hintSuppressionAssertions;
    v14->_hintSuppressionAssertions = v17;
  }
  return v14;
}

- (void)configureForwardingToLockButton:(id)a3
{
  id v4 = a3;
  id v6 = [(SBHomeHardwareButton *)self buttonActions];
  v5 = [v4 buttonActions];

  [v6 configureForwardingToLockButtonActions:v5];
}

- (void)_setFingerDetectionEnabled:(BOOL)a3
{
  fingerDetectEnabledAssertion = self->_fingerDetectEnabledAssertion;
  if ((((fingerDetectEnabledAssertion == 0) ^ a3) & 1) == 0)
  {
    id v12 = fingerDetectEnabledAssertion;
    if (a3)
    {
      v5 = (void *)MEMORY[0x1E4FA7C68];
      id v6 = fingerDetectEnabledAssertion;
      id v7 = [v5 sharedInstance];
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      id v10 = [(BSInvalidatable *)v7 acquireFingerDetectionWantedAssertionForReason:v9 HIDEventsOnly:1];
      id v11 = self->_fingerDetectEnabledAssertion;
      self->_fingerDetectEnabledAssertion = v10;
    }
    else
    {
      self->_fingerDetectEnabledAssertion = 0;
      id v7 = fingerDetectEnabledAssertion;
    }

    [(BSInvalidatable *)v12 invalidate];
  }
}

- (void)provider:(id)a3 didUpdateButtonGestureParameters:(id)a4
{
  id v7 = a4;
  v8 = (SBHomeHardwareButtonActions *)a3;
  v9 = SBLogButtonsHome();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "reconfiguring due to AX prefs change", v11, 2u);
  }

  buttonActions = self->_buttonActions;
  if (buttonActions == v8) {
    objc_storeStrong((id *)&self->_buttonGestureParameters, a4);
  }
  [(SBHomeHardwareButton *)self _reconfigureHomeButton];
}

- (void)_startObservingReconfigurationTriggers
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v3 = +[SBDefaults localDefaults];
  id v4 = [v3 hardwareDefaults];

  v5 = +[SBDefaults localDefaults];
  uint64_t v21 = [v5 accessibilityDefaults];

  id v6 = +[SBDefaults localDefaults];
  id v7 = [v6 demoDefaults];

  v8 = [NSString stringWithUTF8String:"storeDemoApplicationLockEnabled"];
  v28[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __62__SBHomeHardwareButton__startObservingReconfigurationTriggers__block_invoke;
  v25[3] = &unk_1E6AF4AC0;
  v25[4] = self;
  id v10 = (void *)MEMORY[0x1E4F14428];
  id v11 = (id)[v7 observeDefaults:v9 onQueue:MEMORY[0x1E4F14428] withBlock:v25];

  id v12 = [NSString stringWithUTF8String:"disableHomeButton"];
  v27[0] = v12;
  v13 = [NSString stringWithUTF8String:"disableHomeButtonDoublePress"];
  v27[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __62__SBHomeHardwareButton__startObservingReconfigurationTriggers__block_invoke_124;
  v24[3] = &unk_1E6AF4AC0;
  v24[4] = self;
  id v15 = (id)[v4 observeDefaults:v14 onQueue:v10 withBlock:v24];

  if (+[SBReachabilityManager reachabilitySupported])
  {
    v16 = +[SBReachabilityManager sharedInstance];
    -[SBHomeHardwareButton _setFingerDetectionEnabled:](self, "_setFingerDetectionEnabled:", [v16 reachabilityEnabled]);
  }
  else
  {
    [(SBHomeHardwareButton *)self _setFingerDetectionEnabled:0];
  }
  v17 = objc_msgSend(NSString, "stringWithUTF8String:", "allowReachability", v21);
  v26 = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __62__SBHomeHardwareButton__startObservingReconfigurationTriggers__block_invoke_127;
  v23[3] = &unk_1E6AF4AC0;
  v23[4] = self;
  v19 = (void *)MEMORY[0x1E4F14428];
  id v20 = (id)[v22 observeDefaults:v18 onQueue:MEMORY[0x1E4F14428] withBlock:v23];
}

uint64_t __62__SBHomeHardwareButton__startObservingReconfigurationTriggers__block_invoke(uint64_t a1)
{
  v2 = SBLogButtonsHome();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "reconfiguring due to demo prefs change", v4, 2u);
  }

  return [*(id *)(a1 + 32) _reconfigureHomeButton];
}

uint64_t __62__SBHomeHardwareButton__startObservingReconfigurationTriggers__block_invoke_124(uint64_t a1)
{
  v2 = SBLogButtonsHome();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "reconfiguring due to SB prefs change", v4, 2u);
  }

  return [*(id *)(a1 + 32) _reconfigureHomeButton];
}

uint64_t __62__SBHomeHardwareButton__startObservingReconfigurationTriggers__block_invoke_127(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (+[SBReachabilityManager reachabilitySupported])
  {
    v2 = +[SBReachabilityManager sharedInstance];
    uint64_t v3 = [v2 reachabilityEnabled];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = SBLogButtonsHome();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "allowReachability changed, requesting setFingerDetect:%d", (uint8_t *)v6, 8u);
  }

  [*(id *)(a1 + 32) _setFingerDetectionEnabled:v3];
  return [*(id *)(a1 + 32) _reconfigureHomeButton];
}

- (void)_reconfigureHomeButton
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[SBDefaults localDefaults];
  id v4 = [v3 hardwareDefaults];

  v5 = +[SBDefaults localDefaults];
  id v6 = [v5 demoDefaults];

  int64_t v7 = [(SBHardwareButtonGestureParameters *)self->_buttonGestureParameters maximumPressCount];
  if (([v4 disableHomeButtonDoublePress] & 1) != 0
    || ([v4 disableHomeButton] & 1) != 0
    || [v6 isStoreDemoApplicationLockEnabled])
  {
    int64_t v7 = 1;
  }
  [(SBHardwareButtonGestureParameters *)self->_buttonGestureParameters multiplePressTimeInterval];
  float v9 = v8;
  if (BSFloatIsZero())
  {
    float v9 = 0.35;
  }
  else
  {
    id v10 = SBLogButtonsHome();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v34 = v9;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, "maximumMultiplePressInterval override from AX is:%g", buf, 0xCu);
    }
  }
  if (+[SBReachabilityManager reachabilitySupported])
  {
    id v11 = +[SBReachabilityManager sharedInstance];
    if ([v11 reachabilityEnabled]) {
      int64_t v12 = 2;
    }
    else {
      int64_t v12 = 1;
    }
  }
  else
  {
    int64_t v12 = 1;
  }
  float v13 = v9 + -0.1;
  int64_t maximumTapCount = self->_maximumTapCount;
  self->_int64_t maximumTapCount = v12;
  [(SBHomeHardwareButton *)self _reconfigureGestureRecognizersForNewMaximumTapCount:v12 oldMaximumTapCount:maximumTapCount];
  int64_t maximumPressCount = self->_maximumPressCount;
  self->_int64_t maximumPressCount = v7;
  [(SBHomeHardwareButton *)self _reconfigureGestureRecognizersForNewMaximumPressCount:v7 oldMaximumPressCount:maximumPressCount];
  v16 = [(NSMutableOrderedSet *)self->_longPressDurationAssertions lastObject];
  [v16 duration];
  double v18 = v17;

  if (v18 <= 0.0)
  {
    [(SBHardwareButtonGestureParameters *)self->_buttonGestureParameters longPressTimeInterval];
    double v22 = 0.5;
    if (v21 <= 0.0) {
      goto LABEL_24;
    }
    double v18 = v21;
    v19 = SBLogButtonsHome();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v34 = v18;
      id v20 = "maximumLongPressDuration from plugins is:%g";
      goto LABEL_22;
    }
  }
  else
  {
    v19 = SBLogButtonsHome();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v34 = v18;
      id v20 = "maximumLongPressDuration override from assertion is:%g";
LABEL_22:
      _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_INFO, v20, buf, 0xCu);
    }
  }

  double v22 = v18;
LABEL_24:
  if (v9 < v13)
  {
    v23 = SBLogButtonsHome();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      double v34 = v9;
      __int16 v35 = 2048;
      double v36 = v9;
      __int16 v37 = 2048;
      double v38 = v9;
      _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_INFO, "multiplePressInterval: minimum > maximum, using maximum(%g): %g > %g", buf, 0x20u);
    }

    float v13 = v9;
  }
  double v24 = 0.2;
  if (v22 < 0.2)
  {
    v25 = SBLogButtonsHome();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      double v34 = v22;
      __int16 v35 = 2048;
      double v36 = v22;
      __int16 v37 = 2048;
      double v38 = v22;
      _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_INFO, "longPressDuration: minimum > maximum, using maximum(%g): %g > %g", buf, 0x20u);
    }

    double v24 = v22;
  }
  [(SBHomeHardwareButtonActions *)self->_buttonActions setCurrentLongPressDuration:v22];
  double v26 = [MEMORY[0x1E4F4F238] definitionForHomeButton];
  [*(id *)&v26 setMaximumPressCount:v7];
  [*(id *)&v26 setMaximumTapCount:v12];
  [*(id *)&v26 setMinimumLongPressTimeInterval:v24];
  [*(id *)&v26 setMaximumLongPressTimeInterval:v22];
  [*(id *)&v26 setMinimumMultiplePressTimeInterval:v13];
  [*(id *)&v26 setMaximumMultiplePressTimeInterval:v9];
  uint64_t v27 = [v4 homeButtonHapticType];
  if ((unint64_t)(v27 - 1) >= 3) {
    uint64_t v28 = 0;
  }
  else {
    uint64_t v28 = v27;
  }
  [*(id *)&v26 setClickHapticAssetType:v28];
  [(SBHomeHardwareButton *)self setButtonDefinition:*(void *)&v26];
  v29 = SBLogButtonsHome();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    double v34 = v26;
    _os_log_impl(&dword_1D85BA000, v29, OS_LOG_TYPE_INFO, "new button definition:%{public}@", buf, 0xCu);
  }

  v30 = [MEMORY[0x1E4F4F230] sharedInstance];
  double v32 = v26;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  [v30 applyDefinitions:v31];
}

- (void)_createGestureRecognizersWithConfiguration:(id)a3
{
  id v18 = a3;
  v5 = [v18 systemGestureManager];
  objc_storeStrong((id *)&self->_gestureRecognizerConfiguration, a3);
  id v6 = [v18 initialButtonDownGestureRecognizer];
  [v6 addTarget:self action:sel_initialButtonDown_];
  [v6 setClickCount:1];
  [v6 setRecognizesOnPressPhaseBegan:1];
  [v6 setDelegate:self];
  [v5 addGestureRecognizer:v6 withType:69];
  int64_t v7 = [v18 initialButtonUpGestureRecognizer];
  [v7 addTarget:self action:sel_initialButtonUp_];
  [v7 setClickCount:1];
  [v7 setRecognizesOnPressPhaseBegan:0];
  [v7 setDelegate:self];
  double v17 = v7;
  [v5 addGestureRecognizer:v7 withType:70];
  double v8 = [v18 singlePressUpGestureRecognizer];
  [v8 addTarget:self action:sel_singlePressUp_];
  [v8 setClickCount:1];
  [v8 setDelegate:self];
  [v5 addGestureRecognizer:v8 withType:71];
  float v9 = [v18 acceleratedSinglePressUpGestureRecognizer];
  [v9 addTarget:self action:sel_acceleratedSinglePressUp_];
  [v9 setClickCount:1];
  [v9 setDelegate:self];
  [v5 addGestureRecognizer:v9 withType:72];
  id v10 = [v18 longPressGestureRecognizer];
  [v10 addTarget:self action:sel_longPress_];
  [v10 setDelegate:self];
  [v5 addGestureRecognizer:v10 withType:73];
  id v11 = [v18 doublePressDownGestureRecognizer];
  [v11 addTarget:self action:sel_doublePressDown_];
  [v11 setClickCount:2];
  [v11 setRecognizesOnPressPhaseBegan:1];
  [v11 setDelegate:self];
  [v5 addGestureRecognizer:v11 withType:74];
  int64_t v12 = [v18 doublePressUpGestureRecognizer];
  [v12 addTarget:self action:sel_doublePressUp_];
  [v12 setClickCount:2];
  [v12 setDelegate:self];
  [v5 addGestureRecognizer:v12 withType:75];
  float v13 = [v18 triplePressUpGestureRecognizer];
  [v13 addTarget:self action:sel_triplePressUp_];
  [v13 setClickCount:3];
  [v13 setDelegate:self];
  v14 = [v18 doubleTapUpGestureRecognizer];
  [v14 addTarget:self action:sel_doubleTapUp_];
  [v14 setClickCount:2];
  [v14 setDelegate:self];
  [v14 setAllowedPressTypes:&unk_1F3347DA8];
  if ([v18 shouldConfigureDependencies])
  {
    if (self->_homeButtonType != 2)
    {
      v16 = v6;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_screenshotGestureRecognizer);
      [v8 requireGestureRecognizerToFail:WeakRetained];
      [v9 requireGestureRecognizerToFail:WeakRetained];
      [WeakRetained requireGestureRecognizerToFail:v10];
      [WeakRetained addTarget:self action:sel_screenshotRecognizerDidRecognize_];

      id v6 = v16;
    }
    [v8 requireGestureRecognizerToFail:v9];
  }
}

- (void)_reconfigureGestureRecognizersForNewMaximumTapCount:(int64_t)a3 oldMaximumTapCount:(int64_t)a4
{
  if (a3 != a4)
  {
    id v8 = [(SBHomeHardwareButton *)self gestureRecognizerConfiguration];
    id v6 = [v8 systemGestureManager];
    int64_t v7 = [v8 doubleTapUpGestureRecognizer];
    if (a3 < 2) {
      [v6 removeGestureRecognizer:v7];
    }
    else {
      [v6 addGestureRecognizer:v7 withType:78];
    }
  }
}

- (void)_reconfigureGestureRecognizersForNewMaximumPressCount:(int64_t)a3 oldMaximumPressCount:(int64_t)a4
{
  if (a3 != a4)
  {
    v5 = [(SBHomeHardwareButton *)self gestureRecognizerConfiguration];
    id v6 = [v5 systemGestureManager];
    int64_t v7 = [v5 singlePressUpGestureRecognizer];
    id v8 = [v5 doublePressDownGestureRecognizer];
    float v9 = [v5 doublePressUpGestureRecognizer];
    id v10 = [v5 triplePressUpGestureRecognizer];
    id v11 = SBLogButtonsHome();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (a3 < 3)
    {
      if (v12) {
        -[SBHomeHardwareButton _reconfigureGestureRecognizersForNewMaximumPressCount:oldMaximumPressCount:].cold.4();
      }

      [v8 removeFailureRequirement:v10];
      [v9 removeFailureRequirement:v10];
      [v6 removeGestureRecognizer:v10];
      if (a3 < 2)
      {
        v14 = SBLogButtonsHome();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[SBHomeHardwareButton _reconfigureGestureRecognizersForNewMaximumPressCount:oldMaximumPressCount:]();
        }

        [v7 removeFailureRequirement:v9];
        [v7 removeFailureRequirement:v8];
        goto LABEL_15;
      }
    }
    else
    {
      if (v12) {
        -[SBHomeHardwareButton _reconfigureGestureRecognizersForNewMaximumPressCount:oldMaximumPressCount:]();
      }

      [v6 addGestureRecognizer:v10 withType:77];
      [v8 requireGestureRecognizerToFail:v10];
      [v9 requireGestureRecognizerToFail:v10];
    }
    float v13 = SBLogButtonsHome();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[SBHomeHardwareButton _reconfigureGestureRecognizersForNewMaximumPressCount:oldMaximumPressCount:]();
    }

    [v7 requireGestureRecognizerToFail:v9];
    [v7 requireGestureRecognizerToFail:v8];
LABEL_15:
  }
}

- (void)performWhenMenuButtonIsUpUsingBlock:(id)a3
{
}

- (void)performAfterMenuButtonUpIsHandledUsingBlock:(id)a3
{
}

- (void)screenshotRecognizerDidRecognize:(id)a3
{
  if ([a3 state] == 3)
  {
    if (self->_longPressDidOccur) {
      [(SBHomeHardwareButton *)self cancelLongPress];
    }
    buttonActions = self->_buttonActions;
    [(SBHomeHardwareButtonActions *)buttonActions performFinalButtonUpActions];
  }
}

- (void)cancelLongPress
{
  uint64_t v3 = SBLogButtonsHome();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Long press cancelled", v6, 2u);
  }

  self->_longPressDidOccur = 0;
  uint64_t v4 = [(SBHomeHardwareButton *)self gestureRecognizerConfiguration];
  v5 = [v4 longPressGestureRecognizer];
  [v5 setEnabled:0];
  [v5 setEnabled:1];
  [(SBHomeHardwareButtonActions *)self->_buttonActions performLongPressCancelledActions];
}

- (void)addHintSuppressionAssertion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    if (objc_opt_respondsToSelector()) {
      [(NSMutableSet *)self->_hintSuppressionAssertions addObject:v5];
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)removeHintSuppressionAssertion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    if (objc_opt_respondsToSelector()) {
      [(NSMutableSet *)self->_hintSuppressionAssertions removeObject:v5];
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)addLongPressDurationAssertion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    longPressDurationAssertions = self->_longPressDurationAssertions;
    if (!longPressDurationAssertions)
    {
      id v6 = (NSMutableOrderedSet *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:1];
      int64_t v7 = self->_longPressDurationAssertions;
      self->_longPressDurationAssertions = v6;

      longPressDurationAssertions = self->_longPressDurationAssertions;
    }
    [(NSMutableOrderedSet *)longPressDurationAssertions addObject:v4];
    id v8 = SBLogButtonsHome();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "reconfiguring due to long press duration assertion addition: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    [(SBHomeHardwareButton *)self _reconfigureHomeButton];
  }
}

- (void)removeLongPressDurationAssertion:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(NSMutableOrderedSet *)self->_longPressDurationAssertions removeObject:v4];
    if (![(NSMutableOrderedSet *)self->_longPressDurationAssertions count])
    {
      longPressDurationAssertions = self->_longPressDurationAssertions;
      self->_longPressDurationAssertions = 0;
    }
    id v6 = SBLogButtonsHome();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v4;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "reconfiguring due to long press duration assertion removal: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    [(SBHomeHardwareButton *)self _reconfigureHomeButton];
  }
}

- (int64_t)hapticType
{
  v2 = +[SBDefaults localDefaults];
  uint64_t v3 = [v2 hardwareDefaults];

  int64_t v4 = [v3 homeButtonHapticType];
  return v4;
}

- (void)setHapticType:(int64_t)a3
{
  id v5 = +[SBDefaults localDefaults];
  id v6 = [v5 hardwareDefaults];

  [v6 setHomeButtonHapticType:a3];
  [(SBHomeHardwareButton *)self _reconfigureHomeButton];
}

- (BOOL)isButtonDown
{
  return [(SBHomeHardwareButtonActions *)self->_buttonActions isButtonDown];
}

- (BOOL)supportsAcceleratedAppDismiss
{
  if (self->_homeButtonType != 1) {
    return 0;
  }
  v2 = [(SBHomeHardwareButton *)self buttonDefinition];
  uint64_t v3 = [v2 maximumPressCount];
  [v2 maximumMultiplePressTimeInterval];
  BOOL v6 = v4 <= 0.349999994 && v3 < 3;

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  v28[6] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBHomeHardwareButton *)self gestureRecognizerConfiguration];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screenshotGestureRecognizer);
  id v10 = WeakRetained;
  BOOL v11 = 1;
  if (WeakRetained != v6 && WeakRetained != v7)
  {
    uint64_t v12 = [v8 initialButtonDownGestureRecognizer];
    float v13 = (void *)v12;
    if ((id)v12 != v6 && (id)v12 != v7)
    {
      uint64_t v14 = [v8 initialButtonUpGestureRecognizer];
      id v15 = (void *)v14;
      if ((id)v14 != v6 && (id)v14 != v7)
      {
        uint64_t v27 = [v8 singlePressUpGestureRecognizer];
        uint64_t v16 = [v8 doublePressDownGestureRecognizer];
        uint64_t v17 = [v8 doublePressUpGestureRecognizer];
        uint64_t v18 = [v8 triplePressUpGestureRecognizer];
        uint64_t v19 = [v8 longPressGestureRecognizer];
        v28[0] = v17;
        v28[1] = v16;
        id v20 = v27;
        unint64_t v21 = 0;
        v28[2] = v20;
        void v28[3] = v18;
        v28[4] = v20;
        v28[5] = v19;
        while (1)
        {
          id v22 = (id)v28[v21];
          if (v22 == v6 && (id)v28[v21 + 1] == v7) {
            break;
          }
          if (v22 == v7 && v28[v21 + 1] == (void)v6) {
            break;
          }
          BOOL v24 = v21 > 3;
          v21 += 2;
          if (v24)
          {
            BOOL v11 = 0;
            goto LABEL_18;
          }
        }
        BOOL v11 = 1;
LABEL_18:
        for (uint64_t i = 5; i != -1; --i)
      }
    }
  }
  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBHomeHardwareButton *)self gestureRecognizerConfiguration];
  id v9 = [v8 doubleTapUpGestureRecognizer];
  id v10 = [v8 initialButtonDownGestureRecognizer];

  BOOL v12 = v9 == v7 && v10 == v6;
  return v12;
}

- (void)cancelHardwareButtonPress
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(SBHomeHardwareButtonGestureRecognizerConfiguration *)self->_gestureRecognizerConfiguration allGestureRecognizers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(SBHomeHardwareButton *)self _cancelGestureRecognizer:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)hardwareButtonIdentifier
{
  return @"Home";
}

- (BOOL)_acceleratedSinglePressRecognizerShouldBegin
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[SBWorkspace mainWorkspace];
  uint64_t v4 = +[SBIconController sharedInstance];
  uint64_t v5 = [v4 iconManager];
  uint64_t v6 = [(id)SBApp windowSceneManager];
  uint64_t v7 = [v6 embeddedDisplayWindowScene];
  long long v8 = [v7 switcherController];

  long long v9 = [(SBHomeHardwareButton *)self buttonDefinition];
  if (![(NSMutableSet *)self->_hintSuppressionAssertions count])
  {
    if ([v5 isEditing])
    {
      long long v10 = SBLogButtonsHome();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_30;
      }
      *(_WORD *)buf = 0;
      BOOL v12 = "Accelerated single press recognizer should not begin because currently editing";
LABEL_28:
      uint64_t v13 = v10;
      uint32_t v14 = 2;
      goto LABEL_29;
    }
    id v15 = [(id)SBApp lockHardwareButton];
    int v16 = [v15 isButtonDown];

    if (v16)
    {
      long long v10 = SBLogButtonsHome();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_30;
      }
      *(_WORD *)buf = 0;
      BOOL v12 = "Accelerated single press recognizer should not begin because the lock button is down";
      goto LABEL_28;
    }
    if ([v9 maximumPressCount] >= 3)
    {
      long long v10 = SBLogButtonsHome();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_30;
      }
      *(_WORD *)buf = 0;
      BOOL v12 = "Accelerated single press recognizer should not begin because triple click is enabled";
      goto LABEL_28;
    }
    [v9 maximumMultiplePressTimeInterval];
    if (v17 > 0.349999994)
    {
      long long v10 = SBLogButtonsHome();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_30;
      }
      *(_WORD *)buf = 0;
      BOOL v12 = "Accelerated single press recognizer should not begin because click speed setting is too slow";
      goto LABEL_28;
    }
    uint64_t v18 = [v3 transientOverlayPresentationManager];
    int v19 = [v18 hasActivePresentation];

    if (v19)
    {
      long long v10 = SBLogButtonsHome();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_30;
      }
      *(_WORD *)buf = 0;
      BOOL v12 = "Accelerated single press recognizer should not begin because a transient overlay is up";
      goto LABEL_28;
    }
    id v20 = +[SBControlCenterController sharedInstance];
    int v21 = [v20 isVisible];

    if (v21)
    {
      long long v10 = SBLogButtonsHome();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_30;
      }
      *(_WORD *)buf = 0;
      BOOL v12 = "Accelerated single press recognizer should not begin because Control Center is up";
      goto LABEL_28;
    }
    id v22 = [(id)SBApp notificationDispatcher];
    v23 = [v22 bannerDestination];
    int v24 = [v23 isPresentingBanner];

    if (v24)
    {
      long long v10 = SBLogButtonsHome();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_30;
      }
      *(_WORD *)buf = 0;
      BOOL v12 = "Accelerated single press recognizer should not begin because a banner is showing";
      goto LABEL_28;
    }
    if ([v8 isMainSwitcherVisible])
    {
      long long v10 = SBLogButtonsHome();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_30;
      }
      *(_WORD *)buf = 0;
      BOOL v12 = "Accelerated single press recognizer should not begin -- in the app switcher";
      goto LABEL_28;
    }
    long long v10 = [(id)SBApp modalAlertPresentationCoordinator];
    if ([v10 isShowingSystemModalAlert])
    {
      uint64_t v27 = SBLogButtonsHome();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v28 = "Accelerated single press recognizer should not begin -- system modal alert";
LABEL_38:
        _os_log_impl(&dword_1D85BA000, v27, OS_LOG_TYPE_INFO, v28, buf, 2u);
        goto LABEL_39;
      }
      goto LABEL_39;
    }
    v29 = +[SBSetupManager sharedInstance];
    int v30 = [v29 isInSetupMode];

    if (v30)
    {
      uint64_t v27 = SBLogButtonsHome();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v28 = "Accelerated single press recognizer should not begin -- in Setup";
        goto LABEL_38;
      }
LABEL_39:
      BOOL v25 = 0;
LABEL_48:

      goto LABEL_31;
    }
    uint64_t v27 = [(id)SBApp menuButtonInterceptApp];
    if (v27)
    {
      v31 = SBLogButtonsHome();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        double v32 = [v27 bundleIdentifier];
        *(_DWORD *)buf = 138543362;
        v55 = v32;
        _os_log_impl(&dword_1D85BA000, v31, OS_LOG_TYPE_INFO, "Accelerated single press recognizer should not begin -- intercept app:%{public}@", buf, 0xCu);
      }
LABEL_46:
      BOOL v25 = 0;
LABEL_47:

      goto LABEL_48;
    }
    v33 = +[SBCoverSheetPresentationManager sharedInstance];
    int v34 = [v33 isVisible];

    if (v34)
    {
      v31 = SBLogButtonsHome();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v31, OS_LOG_TYPE_INFO, "Accelerated single press recognizer should not begin -- coversheet", buf, 2u);
      }
      goto LABEL_46;
    }
    v31 = +[SBReachabilityManager sharedInstance];
    if ([v31 reachabilityModeActive])
    {
      log = SBLogButtonsHome();
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, log, OS_LOG_TYPE_INFO, "Accelerated single press recognizer should not begin -- reachability is open", buf, 2u);
      }
      BOOL v25 = 0;
      goto LABEL_69;
    }
    log = +[SBHardwareButtonService sharedInstance];
    if ([log hasConsumersForHomeButtonPresses])
    {
      v51 = SBLogButtonsHome();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        __int16 v35 = "Accelerated single press recognizer should not begin -- external button consumers exist";
LABEL_56:
        double v36 = v51;
        uint32_t v37 = 2;
LABEL_66:
        _os_log_impl(&dword_1D85BA000, v36, OS_LOG_TYPE_INFO, v35, buf, v37);
        goto LABEL_67;
      }
      goto LABEL_67;
    }
    BOOL v49 = +[SBAssistantController isVisible];
    double v38 = +[SBVoiceControlController sharedInstance];
    int v52 = [v38 isVisible];

    if (v49 || v52)
    {
      v51 = SBLogButtonsHome();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        v41 = @"Voice Control";
        if (v49) {
          v41 = @"Siri";
        }
        *(_DWORD *)buf = 138543362;
        v55 = v41;
        __int16 v35 = "Accelerated single press recognizer should not begin -- %{public}@ is visible";
        double v36 = v51;
        uint32_t v37 = 12;
        goto LABEL_66;
      }
      goto LABEL_67;
    }
    uint64_t v39 = +[SBIconController sharedInstance];
    int v40 = [v39 areAnyIconViewContextMenusShowing];

    if (v40)
    {
      v51 = SBLogButtonsHome();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        __int16 v35 = "Accelerated single press recognizer should not begin -- icon force touch controller peeking or showing";
        goto LABEL_56;
      }
LABEL_67:
      BOOL v25 = 0;
LABEL_68:

LABEL_69:
      goto LABEL_47;
    }
    if ([v5 isPerformingExpandTransition])
    {
      SBLogButtonsHome();
      v51 = BOOL v25 = 1;
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_INFO)) {
        goto LABEL_68;
      }
      *(_WORD *)buf = 0;
      v42 = "Accelerated single press recognizer should begin -- cancelling folder open";
LABEL_76:
      _os_log_impl(&dword_1D85BA000, v51, OS_LOG_TYPE_INFO, v42, buf, 2u);
      goto LABEL_68;
    }
    if ([v8 _shouldAcceleratedHomeButtonPressBegin])
    {
      SBLogButtonsHome();
      v51 = BOOL v25 = 1;
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_INFO)) {
        goto LABEL_68;
      }
      *(_WORD *)buf = 0;
      v42 = "Accelerated single press recognizer should begin -- switcher wants it";
      goto LABEL_76;
    }
    if ([v5 isTransitioning])
    {
      v51 = SBLogButtonsHome();
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_INFO)) {
        goto LABEL_67;
      }
      *(_WORD *)buf = 0;
      __int16 v35 = "Accelerated single press recognizer should not begin -- iconController is already transitioning";
      goto LABEL_56;
    }
    v51 = [v8 layoutStatePrimaryElement];
    v43 = [v51 workspaceEntity];
    int v44 = [v43 isApplicationSceneEntity];

    if (v44)
    {
      v50 = SBLogButtonsHome();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v45 = "Accelerated single press recognizer should not begin -- hasForegroundApplication";
LABEL_88:
        _os_log_impl(&dword_1D85BA000, v50, OS_LOG_TYPE_INFO, v45, buf, 2u);
      }
    }
    else
    {
      v46 = [v4 iconManager];
      int v47 = [v46 hasOpenFolder];

      v50 = SBLogButtonsHome();
      BOOL v48 = os_log_type_enabled(v50, OS_LOG_TYPE_INFO);
      if (v47)
      {
        if (v48)
        {
          *(_WORD *)buf = 0;
          BOOL v25 = 1;
          _os_log_impl(&dword_1D85BA000, v50, OS_LOG_TYPE_INFO, "Accelerated single press recognizer should begin -- hasOpenFolder", buf, 2u);
        }
        else
        {
          BOOL v25 = 1;
        }
        goto LABEL_90;
      }
      if (v48)
      {
        *(_WORD *)buf = 0;
        v45 = "Accelerated single press recognizer should not begin: not in a supported context";
        goto LABEL_88;
      }
    }
    BOOL v25 = 0;
LABEL_90:

    goto LABEL_68;
  }
  long long v10 = SBLogButtonsHome();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    hintSuppressionAssertions = self->_hintSuppressionAssertions;
    *(_DWORD *)buf = 138543362;
    v55 = hintSuppressionAssertions;
    BOOL v12 = "Accelerated single press recognizer should not begin -- 'hint' suppression assertions: %{public}@";
    uint64_t v13 = v10;
    uint32_t v14 = 12;
LABEL_29:
    _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_INFO, v12, buf, v14);
  }
LABEL_30:
  BOOL v25 = 0;
LABEL_31:

  return v25;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  hardwareButtonCoordinator = self->_hardwareButtonCoordinator;
  uint64_t v6 = [(SBHomeHardwareButton *)self hardwareButtonIdentifier];
  LOBYTE(hardwareButtonCoordinator) = [(SBHardwareButtonCoordinator *)hardwareButtonCoordinator buttonShouldStart:v6];

  if (hardwareButtonCoordinator)
  {
    uint64_t v7 = +[SBDefaults localDefaults];
    long long v8 = [v7 hardwareDefaults];
    int v9 = [v8 disableHomeButton];

    if (v9)
    {
      long long v10 = SBLogButtonsHome();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        long long v11 = "Preventing all home recognizers because user default disables home button";
LABEL_10:
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, v11, buf, 2u);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
    BOOL v12 = +[SBDefaults localDefaults];
    uint64_t v13 = [v12 demoDefaults];
    int v14 = [v13 isStoreDemoApplicationLockEnabled];

    if (v14)
    {
      long long v10 = SBLogButtonsHome();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        long long v11 = "Preventing all home recognizers because app store demo lock enabled";
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    double v17 = [(id)SBApp restartManager];
    long long v10 = v17;
    if (v17
      && ([v17 startupTransition],
          uint64_t v18 = objc_claimAutoreleasedReturnValue(),
          v18,
          !v18))
    {
      if (![v10 isPendingExit])
      {
        int v19 = [(SBHomeHardwareButton *)self gestureRecognizerConfiguration];
        id v22 = [v19 acceleratedSinglePressUpGestureRecognizer];
        if (v22 == v4)
        {
          BOOL v15 = [(SBHomeHardwareButton *)self _acceleratedSinglePressRecognizerShouldBegin];
        }
        else
        {
          id v23 = [v19 doublePressDownGestureRecognizer];
          uint64_t v24 = [v19 doublePressUpGestureRecognizer];
          BOOL v25 = (void *)v24;
          if (v23 == v4 || (id)v24 == v4)
          {
            id v28 = 0;
            BOOL v15 = [(SBHomeHardwareButton *)self _isMenuDoublePressAllowed:&v28];
            id v26 = v28;
            if (!v15)
            {
              uint64_t v27 = SBLogButtonsHome();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543362;
                id v30 = v26;
                _os_log_impl(&dword_1D85BA000, v27, OS_LOG_TYPE_INFO, "Preventing double press recognizer for reason: %{public}@", buf, 0xCu);
              }
            }
          }
          else
          {
            id v26 = [v19 longPressGestureRecognizer];
            BOOL v15 = v26 != v4
               || [(SBHomeHardwareButton *)self _longPressGestureRecognizerShouldBegin:v4];
          }
        }
        goto LABEL_19;
      }
      int v19 = SBLogButtonsHome();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = [v10 pendingRestartTransitionRequest];
        *(_DWORD *)buf = 138543362;
        id v30 = v20;
        int v21 = "Preventing all home recognizers because we have a pending restart transition: %{public}@";
        goto LABEL_17;
      }
    }
    else
    {
      int v19 = SBLogButtonsHome();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = [v10 startupTransition];
        *(_DWORD *)buf = 138543362;
        id v30 = v20;
        int v21 = "Preventing all home recognizers because we're in a startup transition: %{public}@";
LABEL_17:
        _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_INFO, v21, buf, 0xCu);
      }
    }
    BOOL v15 = 0;
LABEL_19:

    goto LABEL_12;
  }
  long long v10 = SBLogButtonsHome();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    long long v11 = "Preventing all home recognizers because hardware button coordinator says nope";
    goto LABEL_10;
  }
LABEL_11:
  BOOL v15 = 0;
LABEL_12:

  return v15;
}

- (BOOL)_longPressGestureRecognizerShouldBegin:(id)a3
{
  uint64_t v3 = objc_msgSend((id)SBApp, "lockOutController", a3);
  int v4 = [v3 isBlocked];

  if (v4)
  {
    uint64_t v5 = SBLogButtonsHome();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = 0;
      uint64_t v6 = "Preventing long press recognizer because deviceIsBlocked";
      uint64_t v7 = (uint8_t *)&v18;
LABEL_7:
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  long long v8 = +[SBSetupManager sharedInstance];
  int v9 = [v8 isInSetupMode];

  if (v9)
  {
    uint64_t v5 = SBLogButtonsHome();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v6 = "Preventing long press recognizer because isInSetupMode";
      uint64_t v7 = buf;
      goto LABEL_7;
    }
LABEL_12:
    char v11 = 0;
    goto LABEL_13;
  }
  uint64_t v5 = +[SBSyncController sharedInstance];
  if ([v5 isRestoring])
  {
    long long v10 = SBLogButtonsHome();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v16 = 0;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, "Preventing long press recognizer because SBSyncController isRestoring", v16, 2u);
    }

    goto LABEL_12;
  }
  int v13 = [v5 isResetting];
  if (v13)
  {
    int v14 = SBLogButtonsHome();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v15 = 0;
      _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_INFO, "Preventing long press recognizer because SBSyncController isResetting", v15, 2u);
    }
  }
  char v11 = v13 ^ 1;
LABEL_13:

  return v11;
}

- (void)_terminateHomeButtonEventAtCount:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = SBLogButtonsHome();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "EMU terminate with count:%d", (uint8_t *)v10, 8u);
  }

  switch(a3)
  {
    case 3:
      buttonActions = self->_buttonActions;
      p_buttonActions = &self->_buttonActions;
      [(SBHomeHardwareButtonActions *)buttonActions performTriplePressUpActions];
      break;
    case 2:
      int v9 = self->_buttonActions;
      p_buttonActions = &self->_buttonActions;
      [(SBHomeHardwareButtonActions *)v9 performDoublePressDownActions];
      break;
    case 1:
      uint64_t v7 = self->_buttonActions;
      p_buttonActions = &self->_buttonActions;
      [(SBHomeHardwareButtonActions *)v7 performSinglePressUpActions];
      break;
    default:
      return;
  }
  [(SBHomeHardwareButtonActions *)*p_buttonActions performFinalButtonUpActions];
}

- (BOOL)emulateHomeButtonEventsIfNeeded:(__IOHIDEvent *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t SenderID = IOHIDEventGetSenderID();
  if (IOHIDEventGetIntegerValue())
  {
    if ((IOHIDEventGetPhase() & 1) == 0 && IOHIDEventGetIntegerValue() <= 1 && !IOHIDEventGetIntegerValue())
    {
      uint64_t v5 = SBLogButtonsHome();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = [(BKSButtonHapticsDefinition *)self->_buttonDefinition maximumPressCount];
        *(_DWORD *)buf = 134218240;
        *(void *)uint64_t v39 = SenderID;
        *(_WORD *)&v39[8] = 1024;
        *(_DWORD *)&v39[10] = v6;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SenderID:%llX appears to be synthesizing home button events without press count/terminal support; SpringBoard "
          "is providing emulation for max count:%d",
          buf,
          0x12u);
      }

      emulatedPerSenderDownCount = self->_emulatedPerSenderDownCount;
      if (!emulatedPerSenderDownCount)
      {
        long long v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        int v9 = self->_emulatedPerSenderDownCount;
        self->_emulatedPerSenderDownCount = v8;

        emulatedPerSenderDownCount = self->_emulatedPerSenderDownCount;
      }
      long long v10 = [NSNumber numberWithUnsignedLongLong:SenderID];
      uint64_t v11 = [(NSMutableDictionary *)emulatedPerSenderDownCount objectForKey:v10];
      uint64_t v12 = [v11 integerValue];

      if (v12 < [(BKSButtonHapticsDefinition *)self->_buttonDefinition maximumPressCount]) {
        uint64_t v13 = v12 + 1;
      }
      else {
        uint64_t v13 = 1;
      }
      uint64_t v14 = ++emulateHomeButtonEventsIfNeeded__sTerminalGeneration;
      emulateHomeButtonEventsIfNeeded__sLastuint64_t SenderID = SenderID;
      [(BKSButtonHapticsDefinition *)self->_buttonDefinition maximumMultiplePressTimeInterval];
      dispatch_time_t v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __56__SBHomeHardwareButton_emulateHomeButtonEventsIfNeeded___block_invoke;
      v37[3] = &unk_1E6B012E0;
      v37[4] = self;
      v37[5] = v14;
      v37[6] = SenderID;
      v37[7] = v13;
      dispatch_after(v16, MEMORY[0x1E4F14428], v37);
      double v17 = self->_emulatedPerSenderDownCount;
      __int16 v18 = [NSNumber numberWithInteger:v13];
      int v19 = [NSNumber numberWithUnsignedLongLong:SenderID];
      [(NSMutableDictionary *)v17 setObject:v18 forKey:v19];

      id v20 = SBLogButtonsHome();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)uint64_t v39 = v13;
        *(_WORD *)&v39[4] = 2048;
        *(void *)&v39[6] = SenderID;
        _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "EMU down count:%d senderID:%llX", buf, 0x12u);
      }

      if (v13 == 3 || v13 == 2) {
        goto LABEL_18;
      }
      if (v13 == 1)
      {
        [(SBHomeHardwareButtonActions *)self->_buttonActions performInitialButtonDownActions];
LABEL_18:
        char v21 = 1;
        goto LABEL_36;
      }
    }
    goto LABEL_29;
  }
  id v22 = self->_emulatedPerSenderDownCount;
  if (!v22)
  {
LABEL_29:
    char v21 = 0;
    goto LABEL_36;
  }
  id v23 = [NSNumber numberWithUnsignedLongLong:SenderID];
  uint64_t v24 = [(NSMutableDictionary *)v22 objectForKey:v23];

  if (v24)
  {
    uint64_t v25 = [v24 integerValue];
    uint64_t v26 = v25;
    if ((unint64_t)(v25 - 2) < 2)
    {
LABEL_25:
      if (v26 == [(BKSButtonHapticsDefinition *)self->_buttonDefinition maximumPressCount])
      {
        ++emulateHomeButtonEventsIfNeeded__sTerminalGeneration;
        [(SBHomeHardwareButton *)self _terminateHomeButtonEventAtCount:v26];
        uint64_t v27 = self->_emulatedPerSenderDownCount;
        id v28 = [NSNumber numberWithUnsignedLongLong:SenderID];
        [(NSMutableDictionary *)v27 removeObjectForKey:v28];
      }
      v29 = SBLogButtonsHome();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)uint64_t v39 = v26;
      *(_WORD *)&v39[4] = 2048;
      *(void *)&v39[6] = SenderID;
      id v30 = "EMU eat up count:%d senderID:%llX";
      uint64_t v31 = v29;
      uint32_t v32 = 18;
      goto LABEL_33;
    }
    if (!v25)
    {
      v33 = self->_emulatedPerSenderDownCount;
      int v34 = [NSNumber numberWithUnsignedLongLong:SenderID];
      [(NSMutableDictionary *)v33 removeObjectForKey:v34];

      v29 = SBLogButtonsHome();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
LABEL_34:

        char v21 = 1;
        goto LABEL_35;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)uint64_t v39 = SenderID;
      id v30 = "EMU eat up after long press for senderID:%llX";
      uint64_t v31 = v29;
      uint32_t v32 = 12;
LABEL_33:
      _os_log_impl(&dword_1D85BA000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
      goto LABEL_34;
    }
    if (v25 == 1)
    {
      [(SBHomeHardwareButtonActions *)self->_buttonActions performInitialButtonUpActions];
      [(SBHomeHardwareButtonActions *)self->_buttonActions performLongPressCancelledActions];
      goto LABEL_25;
    }
  }
  char v21 = 0;
LABEL_35:

LABEL_36:
  __int16 v35 = SBLogButtonsHome();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
    -[SBHomeHardwareButton emulateHomeButtonEventsIfNeeded:](v21, v35);
  }

  return v21;
}

void __56__SBHomeHardwareButton_emulateHomeButtonEventsIfNeeded___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40) == emulateHomeButtonEventsIfNeeded__sTerminalGeneration
    || emulateHomeButtonEventsIfNeeded__sLastSenderID != *(void *)(a1 + 48))
  {
    [*(id *)(a1 + 32) _terminateHomeButtonEventAtCount:*(void *)(a1 + 56)];
    v2 = *(void **)(*(void *)(a1 + 32) + 104);
    uint64_t v3 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
    [v2 setObject:&unk_1F334A0B8 forKey:v3];

    ++emulateHomeButtonEventsIfNeeded__sTerminalGeneration;
  }
}

- (void)initialButtonDown:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogButtonsHome();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = SBSystemGestureRecognizerStateDescription([v4 state]);
    int v7 = 138543362;
    long long v8 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Initial button down (state:%{public}@)", (uint8_t *)&v7, 0xCu);
  }
  if ([v4 state] == 3)
  {
    self->_longPressDidOccur = 0;
    [(SBHomeHardwareButtonActions *)self->_buttonActions performInitialButtonDownActions];
  }
}

- (void)initialButtonUp:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogButtonsHome();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = SBSystemGestureRecognizerStateDescription([v4 state]);
    int v7 = 138543362;
    long long v8 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Initial button up (state:%{public}@)", (uint8_t *)&v7, 0xCu);
  }
  if ([v4 state] == 3)
  {
    [(SBHomeHardwareButtonActions *)self->_buttonActions performInitialButtonUpActions];
    if (!self->_longPressDidOccur) {
      [(SBHomeHardwareButtonActions *)self->_buttonActions performLongPressCancelledActions];
    }
  }
}

- (void)_singlePressUp:(id)a3
{
  if ([a3 state] == 3)
  {
    id v4 = [(id)SBApp lockHardwareButton];
    [v4 cancelLongPress];

    if (self->_longPressDidOccur)
    {
      uint64_t v5 = SBLogButtonsHome();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v6 = 0;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Single press -- skipping single press actions due to long press", v6, 2u);
      }
    }
    else
    {
      [(SBHomeHardwareButtonActions *)self->_buttonActions performSinglePressUpActions];
    }
    [(SBHomeHardwareButtonActions *)self->_buttonActions performFinalButtonUpActions];
  }
}

- (void)acceleratedSinglePressUp:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogButtonsHome();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = SBSystemGestureRecognizerStateDescription([v4 state]);
    int v7 = 138543362;
    long long v8 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Accelerated single press up (state:%{public}@)", (uint8_t *)&v7, 0xCu);
  }
  [(SBHomeHardwareButton *)self _singlePressUp:v4];
}

- (void)singlePressUp:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogButtonsHome();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = SBSystemGestureRecognizerStateDescription([v4 state]);
    int v7 = 138543362;
    long long v8 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Normal single press up (state:%{public}@)", (uint8_t *)&v7, 0xCu);
  }
  [(SBHomeHardwareButton *)self _singlePressUp:v4];
}

- (void)longPress:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogButtonsHome();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = SBSystemGestureRecognizerStateDescription([v4 state]);
    int v9 = 138543362;
    long long v10 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Long press (state:%{public}@)", (uint8_t *)&v9, 0xCu);
  }
  if ([v4 state] == 3)
  {
    self->_longPressDidOccur = 1;
    int v7 = [(SBHomeHardwareButton *)self gestureRecognizerConfiguration];
    long long v8 = [v7 acceleratedSinglePressUpGestureRecognizer];
    [(SBHomeHardwareButton *)self _cancelGestureRecognizer:v8];

    [(SBHomeHardwareButtonActions *)self->_buttonActions performLongPressActions];
  }
}

- (BOOL)_processDoubleDownAndDoubleUpSimultaneously
{
  return self->_maximumPressCount > 2;
}

- (void)doublePressDown:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogButtonsHome();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = SBSystemGestureRecognizerStateDescription([v4 state]);
    int v7 = 138543362;
    long long v8 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Double press down (state:%{public}@)", (uint8_t *)&v7, 0xCu);
  }
  if ([v4 state] == 3)
  {
    [(SBHomeHardwareButtonActions *)self->_buttonActions performDoublePressDownActions];
    if ([(SBHomeHardwareButton *)self _processDoubleDownAndDoubleUpSimultaneously])
    {
      [(SBHomeHardwareButtonActions *)self->_buttonActions performFinalButtonUpActions];
    }
  }
}

- (void)doublePressUp:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogButtonsHome();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = SBSystemGestureRecognizerStateDescription([v4 state]);
    int v7 = 138543362;
    long long v8 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Double press up (state:%{public}@)", (uint8_t *)&v7, 0xCu);
  }
  if ([v4 state] == 3
    && ![(SBHomeHardwareButton *)self _processDoubleDownAndDoubleUpSimultaneously])
  {
    [(SBHomeHardwareButtonActions *)self->_buttonActions performFinalButtonUpActions];
  }
}

- (void)triplePressUp:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogButtonsHome();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = SBSystemGestureRecognizerStateDescription([v4 state]);
    int v7 = 138543362;
    long long v8 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Triple press up (state:%{public}@)", (uint8_t *)&v7, 0xCu);
  }
  if ([v4 state] == 3)
  {
    [(SBHomeHardwareButtonActions *)self->_buttonActions performTriplePressUpActions];
    [(SBHomeHardwareButtonActions *)self->_buttonActions performFinalButtonUpActions];
  }
}

- (void)doubleTapUp:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogButtonsHome();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = SBSystemGestureRecognizerStateDescription([v4 state]);
    int v7 = 138543362;
    long long v8 = v6;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "Double tap up (state:%{public}@)", (uint8_t *)&v7, 0xCu);
  }
  if ([v4 state] == 3) {
    [(SBHomeHardwareButtonActions *)self->_buttonActions performDoubleTapUpActions];
  }
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

- (BOOL)_isMenuDoublePressDisabled
{
  v2 = +[SBDefaults localDefaults];
  id v3 = [v2 hardwareDefaults];
  char v4 = [v3 disableHomeButtonDoublePress];

  return v4;
}

- (BOOL)_isMenuDoublePressAllowed:(id *)a3
{
  uint64_t v5 = [(id)SBApp lockOutController];
  int v6 = +[SBSyncController sharedInstance];
  if ([v6 isInUse])
  {
    BOOL v7 = 0;
    long long v8 = @"syncing data";
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if ([v5 isBlocked])
  {
    BOOL v7 = 0;
    long long v8 = @"blocked";
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v9 = [(id)SBApp remoteTransientOverlaySessionManager];
  char v10 = [v9 hasSessionWithPendingButtonEvents:1 options:0];

  if (v10)
  {
    BOOL v7 = 0;
    long long v8 = @"has session with pending lock event";
    if (!a3) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  BOOL v11 = [(SBHomeHardwareButton *)self _isMenuDoublePressDisabled];
  BOOL v7 = !v11;
  long long v8 = @"disabled by user default";
  if (!v11) {
    long long v8 = 0;
  }
  if (a3) {
LABEL_13:
  }
    *a3 = v8;
LABEL_14:

  return v7;
}

- (SBHardwareButtonCoordinator)hardwareButtonCoordinator
{
  return self->_hardwareButtonCoordinator;
}

- (void)setHardwareButtonCoordinator:(id)a3
{
}

- (SBHomeHardwareButtonActions)buttonActions
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

- (SBHomeHardwareButtonGestureRecognizerConfiguration)gestureRecognizerConfiguration
{
  return self->_gestureRecognizerConfiguration;
}

- (void)setGestureRecognizerConfiguration:(id)a3
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

- (int64_t)homeButtonType
{
  return self->_homeButtonType;
}

- (void)setHomeButtonType:(int64_t)a3
{
  self->_homeButtonType = a3;
}

- (int64_t)maximumPressCount
{
  return self->_maximumPressCount;
}

- (void)setMaximumPressCount:(int64_t)a3
{
  self->_int64_t maximumPressCount = a3;
}

- (int64_t)maximumTapCount
{
  return self->_maximumTapCount;
}

- (void)setMaximumTapCount:(int64_t)a3
{
  self->_int64_t maximumTapCount = a3;
}

- (BOOL)longPressDidOccur
{
  return self->_longPressDidOccur;
}

- (void)setLongPressDidOccur:(BOOL)a3
{
  self->_longPressDidOccur = a3;
}

- (NSMutableDictionary)emulatedPerSenderDownCount
{
  return self->_emulatedPerSenderDownCount;
}

- (void)setEmulatedPerSenderDownCount:(id)a3
{
}

- (BKSButtonHapticsDefinition)buttonDefinition
{
  return self->_buttonDefinition;
}

- (void)setButtonDefinition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonDefinition, 0);
  objc_storeStrong((id *)&self->_emulatedPerSenderDownCount, 0);
  objc_destroyWeak((id *)&self->_screenshotGestureRecognizer);
  objc_storeStrong((id *)&self->_gestureRecognizerConfiguration, 0);
  objc_storeStrong((id *)&self->_buttonGestureParameters, 0);
  objc_storeStrong((id *)&self->_buttonActions, 0);
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, 0);
  objc_storeStrong((id *)&self->_longPressDurationAssertions, 0);
  objc_storeStrong((id *)&self->_hintSuppressionAssertions, 0);
  objc_storeStrong((id *)&self->_fingerDetectEnabledAssertion, 0);
}

- (void)_reconfigureGestureRecognizersForNewMaximumPressCount:oldMaximumPressCount:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "GR config: single press requires double to fail", v2, v3, v4, v5, v6);
}

- (void)_reconfigureGestureRecognizersForNewMaximumPressCount:oldMaximumPressCount:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "GR config: double press requires triple to fail", v2, v3, v4, v5, v6);
}

- (void)_reconfigureGestureRecognizersForNewMaximumPressCount:oldMaximumPressCount:.cold.3()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "GR config: single press DOES NOT require double to fail", v2, v3, v4, v5, v6);
}

- (void)_reconfigureGestureRecognizersForNewMaximumPressCount:oldMaximumPressCount:.cold.4()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "GR config: double press DOES NOT require triple to fail", v2, v3, v4, v5, v6);
}

- (void)emulateHomeButtonEventsIfNeeded:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "EMU handled:%d", (uint8_t *)v2, 8u);
}

@end