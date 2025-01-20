@interface SBTapToWakeController
+ (BOOL)isTapToWakeSupported;
- (BOOL)_gesturesEnabled;
- (BOOL)_isHitTestSuppressionEnabled;
- (BOOL)digitizerModeRequiresHitTestSuppression;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isDigitizerInTapToWakeMode;
- (BOOL)shouldTapToWake;
- (NSHashTable)_recycledInactiveTouchShieldWindows;
- (SBFTapToWakeGestureRecognizer)pencilToWakeGestureRecognizer;
- (SBFTapToWakeGestureRecognizer)tapToWakeGestureRecognizer;
- (SBIdleTimerDefaults)idleTimerDefaults;
- (SBInactiveTouchShieldWindow)_inactiveTouchShieldWindow;
- (SBTapToWakeController)init;
- (SBTapToWakeDelegate)delegate;
- (void)_evaluateEnablement;
- (void)_setGesturesEnabled:(BOOL)a3;
- (void)_setHitTestSuppressionEnabled:(BOOL)a3;
- (void)pencilToWakeDidRecognize:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDigitizerInTapToWakeMode:(BOOL)a3;
- (void)setDigitizerModeRequiresHitTestSuppression:(BOOL)a3;
- (void)setIdleTimerDefaults:(id)a3;
- (void)setPencilToWakeGestureRecognizer:(id)a3;
- (void)setTapToWakeGestureRecognizer:(id)a3;
- (void)tapToWakeDidRecognize:(id)a3;
@end

@implementation SBTapToWakeController

- (SBTapToWakeController)init
{
  v17.receiver = self;
  v17.super_class = (Class)SBTapToWakeController;
  v2 = [(SBTapToWakeController *)&v17 init];
  if (v2)
  {
    v3 = (SBFTapToWakeGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FA6008]);
    tapToWakeGestureRecognizer = v2->_tapToWakeGestureRecognizer;
    v2->_tapToWakeGestureRecognizer = v3;

    [(SBFTapToWakeGestureRecognizer *)v2->_tapToWakeGestureRecognizer setName:@"tapToWake"];
    [(SBFTapToWakeGestureRecognizer *)v2->_tapToWakeGestureRecognizer setAllowedTouchTypes:&unk_1F33478E0];
    [(SBFTapToWakeGestureRecognizer *)v2->_tapToWakeGestureRecognizer setDelegate:v2];
    [(SBFTapToWakeGestureRecognizer *)v2->_tapToWakeGestureRecognizer addTarget:v2 action:sel_tapToWakeDidRecognize_];
    v5 = (SBFTapToWakeGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FA6008]);
    pencilToWakeGestureRecognizer = v2->_pencilToWakeGestureRecognizer;
    v2->_pencilToWakeGestureRecognizer = v5;

    [(SBFTapToWakeGestureRecognizer *)v2->_pencilToWakeGestureRecognizer setName:@"pencilToWake"];
    [(SBFTapToWakeGestureRecognizer *)v2->_pencilToWakeGestureRecognizer setAllowedTouchTypes:&unk_1F33478F8];
    [(SBFTapToWakeGestureRecognizer *)v2->_pencilToWakeGestureRecognizer setDelegate:v2];
    [(SBFTapToWakeGestureRecognizer *)v2->_pencilToWakeGestureRecognizer addTarget:v2 action:sel_pencilToWakeDidRecognize_];
    v2->_digitizerInTapToWakeMode = 0;
    *(_WORD *)&v2->_gesturesEnabled = 0;
    v7 = +[SBDefaults localDefaults];
    uint64_t v8 = [v7 idleTimerDefaults];
    idleTimerDefaults = v2->_idleTimerDefaults;
    v2->_idleTimerDefaults = (SBIdleTimerDefaults *)v8;

    v10 = v2->_idleTimerDefaults;
    v11 = [NSString stringWithUTF8String:"supportTapToWake"];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __29__SBTapToWakeController_init__block_invoke;
    v15[3] = &unk_1E6AF4AC0;
    v12 = v2;
    v16 = v12;
    id v13 = (id)[(SBIdleTimerDefaults *)v10 observeDefault:v11 onQueue:MEMORY[0x1E4F14428] withBlock:v15];

    [(SBTapToWakeController *)v12 _evaluateEnablement];
  }
  return v2;
}

uint64_t __29__SBTapToWakeController_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _evaluateEnablement];
}

+ (BOOL)isTapToWakeSupported
{
  if (isTapToWakeSupported_onceToken != -1) {
    dispatch_once(&isTapToWakeSupported_onceToken, &__block_literal_global_34);
  }
  return isTapToWakeSupported_supportsTTW;
}

void __45__SBTapToWakeController_isTapToWakeSupported__block_invoke()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  isTapToWakeSupported_supportsTTW = MGGetBoolAnswer();
  v0 = SBLogBacklight();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1[0] = 67109120;
    v1[1] = isTapToWakeSupported_supportsTTW;
    _os_log_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_INFO, "TTW supported:%{BOOL}u", (uint8_t *)v1, 8u);
  }
}

- (BOOL)shouldTapToWake
{
  return [(SBIdleTimerDefaults *)self->_idleTimerDefaults supportTapToWake];
}

- (void)setDigitizerInTapToWakeMode:(BOOL)a3
{
  if (self->_digitizerInTapToWakeMode != a3)
  {
    self->_digitizerInTapToWakeMode = a3;
    [(SBTapToWakeController *)self _evaluateEnablement];
  }
}

- (void)setDigitizerModeRequiresHitTestSuppression:(BOOL)a3
{
  if (self->_digitizerModeRequiresHitTestSuppression != a3)
  {
    self->_digitizerModeRequiresHitTestSuppression = a3;
    [(SBTapToWakeController *)self _evaluateEnablement];
  }
}

- (void)_setGesturesEnabled:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_gesturesEnabled != a3)
  {
    BOOL v3 = a3;
    self->_gesturesEnabled = a3;
    v5 = +[SBSystemGestureManager mainDisplayManager];
    v6 = v5;
    tapToWakeGestureRecognizer = self->_tapToWakeGestureRecognizer;
    if (v3)
    {
      [v5 addGestureRecognizer:tapToWakeGestureRecognizer withType:66];

      uint64_t v8 = +[SBSystemGestureManager mainDisplayManager];
      [v8 addGestureRecognizer:self->_pencilToWakeGestureRecognizer withType:67];
    }
    else
    {
      [v5 removeGestureRecognizer:tapToWakeGestureRecognizer];

      uint64_t v8 = +[SBSystemGestureManager mainDisplayManager];
      [v8 removeGestureRecognizer:self->_pencilToWakeGestureRecognizer];
    }

    v9 = SBLogBacklight();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_gesturesEnabled) {
        v10 = "enabled";
      }
      else {
        v10 = "disabled";
      }
      int v11 = 136446210;
      v12 = v10;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "TTW: gestures now %{public}s", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_evaluateEnablement
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (([(id)objc_opt_class() isTapToWakeSupported] & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SBTapToWakeController.m" lineNumber:119 description:@"don't instantiate this class if it's not supported"];
  }
  BOOL digitizerInTapToWakeMode = self->_digitizerInTapToWakeMode;
  BOOL v5 = [(SBTapToWakeController *)self shouldTapToWake];
  v6 = SBLogBacklight();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = digitizerInTapToWakeMode;
    __int16 v10 = 1024;
    BOOL v11 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "TTW: enable state change digitizerTTW:%{BOOL}u default:%{BOOL}u", (uint8_t *)v9, 0xEu);
  }

  BOOL v7 = digitizerInTapToWakeMode && v5;
  [(SBTapToWakeController *)self _setGesturesEnabled:v7];
  [(SBTapToWakeController *)self _setHitTestSuppressionEnabled:self->_digitizerModeRequiresHitTestSuppression];
}

- (void)tapToWakeDidRecognize:(id)a3
{
  id v4 = a3;
  BOOL v5 = SBLogBacklight();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "tapToWakeDidRecognize:", buf, 2u);
  }

  v6 = SBLogBacklight();
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, v4);

  uint64_t v8 = SBLogBacklight();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "tapToWakeDidRecognize", (const char *)&unk_1D8FE2CAB, v14, 2u);
  }

  __int16 v10 = [(SBTapToWakeController *)self delegate];
  [v10 tapToWakeControllerDidRecognizeWakeGesture:self];

  BOOL v11 = SBLogBacklight();
  uint64_t v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v12, OS_SIGNPOST_INTERVAL_END, v7, "tapToWakeDidRecognize", (const char *)&unk_1D8FE2CAB, v13, 2u);
  }
}

- (void)pencilToWakeDidRecognize:(id)a3
{
  id v4 = a3;
  BOOL v5 = SBLogBacklight();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "pencilToWakeDidRecognize:", buf, 2u);
  }

  v6 = SBLogBacklight();
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, v4);

  uint64_t v8 = SBLogBacklight();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "pencilToWakeDidRecognize", (const char *)&unk_1D8FE2CAB, v14, 2u);
  }

  __int16 v10 = [(SBTapToWakeController *)self delegate];
  [v10 tapToWakeControllerDidRecognizePencilWakeGesture:self];

  BOOL v11 = SBLogBacklight();
  uint64_t v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v12, OS_SIGNPOST_INTERVAL_END, v7, "pencilToWakeDidRecognize", (const char *)&unk_1D8FE2CAB, v13, 2u);
  }
}

- (SBInactiveTouchShieldWindow)_inactiveTouchShieldWindow
{
  inactiveTouchShieldWindow = self->_inactiveTouchShieldWindow;
  if (!inactiveTouchShieldWindow)
  {
    uint64_t v4 = [(NSHashTable *)self->_recycledInactiveTouchShieldWindows anyObject];
    if (v4)
    {
      BOOL v5 = (SBInactiveTouchShieldWindow *)v4;
      [(NSHashTable *)self->_recycledInactiveTouchShieldWindows removeObject:v4];
    }
    else
    {
      v6 = [SBInactiveTouchShieldWindow alloc];
      os_signpost_id_t v7 = [MEMORY[0x1E4F42D90] mainScreen];
      BOOL v5 = [(_UIRootWindow *)v6 initWithScreen:v7];
    }
    [(_UIRootWindow *)v5 setHidden:1];
    [(SBInactiveTouchShieldWindow *)v5 setWindowLevel:3.40282347e38];
    uint64_t v8 = self->_inactiveTouchShieldWindow;
    self->_inactiveTouchShieldWindow = v5;

    inactiveTouchShieldWindow = self->_inactiveTouchShieldWindow;
  }
  return inactiveTouchShieldWindow;
}

- (void)_setHitTestSuppressionEnabled:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_hitTestSuppressionEnabled != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = SBLogBacklight();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109120;
      v12[1] = v3;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "TTW: hit-testing suppression enabled:%{BOOL}u", (uint8_t *)v12, 8u);
    }

    self->_hitTestSuppressionEnabled = v3;
    if (v3)
    {
      v6 = [(SBTapToWakeController *)self _inactiveTouchShieldWindow];
    }
    else
    {
      v6 = self->_inactiveTouchShieldWindow;
    }
    os_signpost_id_t v7 = v6;
    [(_UIRootWindow *)v6 setHidden:!v3];
    if (v7 && !v3)
    {
      recycledInactiveTouchShieldWindows = self->_recycledInactiveTouchShieldWindows;
      if (!recycledInactiveTouchShieldWindows)
      {
        v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        __int16 v10 = self->_recycledInactiveTouchShieldWindows;
        self->_recycledInactiveTouchShieldWindows = v9;

        recycledInactiveTouchShieldWindows = self->_recycledInactiveTouchShieldWindows;
      }
      [(NSHashTable *)recycledInactiveTouchShieldWindows addObject:v7];
      inactiveTouchShieldWindow = self->_inactiveTouchShieldWindow;
      self->_inactiveTouchShieldWindow = 0;
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (SBTapToWakeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBTapToWakeDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isDigitizerInTapToWakeMode
{
  return self->_digitizerInTapToWakeMode;
}

- (BOOL)digitizerModeRequiresHitTestSuppression
{
  return self->_digitizerModeRequiresHitTestSuppression;
}

- (SBFTapToWakeGestureRecognizer)tapToWakeGestureRecognizer
{
  return self->_tapToWakeGestureRecognizer;
}

- (void)setTapToWakeGestureRecognizer:(id)a3
{
}

- (SBFTapToWakeGestureRecognizer)pencilToWakeGestureRecognizer
{
  return self->_pencilToWakeGestureRecognizer;
}

- (void)setPencilToWakeGestureRecognizer:(id)a3
{
}

- (SBIdleTimerDefaults)idleTimerDefaults
{
  return self->_idleTimerDefaults;
}

- (void)setIdleTimerDefaults:(id)a3
{
}

- (BOOL)_gesturesEnabled
{
  return self->_gesturesEnabled;
}

- (BOOL)_isHitTestSuppressionEnabled
{
  return self->_hitTestSuppressionEnabled;
}

- (NSHashTable)_recycledInactiveTouchShieldWindows
{
  return self->_recycledInactiveTouchShieldWindows;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recycledInactiveTouchShieldWindows, 0);
  objc_storeStrong((id *)&self->_idleTimerDefaults, 0);
  objc_storeStrong((id *)&self->_pencilToWakeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapToWakeGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inactiveTouchShieldWindow, 0);
}

@end