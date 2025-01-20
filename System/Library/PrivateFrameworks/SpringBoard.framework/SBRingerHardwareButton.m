@interface SBRingerHardwareButton
+ (SBRingerHardwareButton)new;
- (SBHardwareButtonCoordinator)hardwareButtonCoordinator;
- (SBRingerHardwareButton)init;
- (id)_dateFromMachAbsoluteTimestamp:(uint64_t)a1;
- (id)hardwareButtonIdentifier;
- (uint64_t)_sendRingerButtonDownToSceneOverride;
- (uint64_t)handleRingerButtonEvent:(uint64_t)result;
- (uint64_t)initWithSystemActionControl:(void *)a3 suppressionManager:;
- (void)_configureButtonArbiter;
- (void)_performActionForEvent:(uint64_t)a1 interactionTime:(uint64_t)a2;
- (void)cancelHardwareButtonPress;
- (void)performActionsForButtonDown:(id)a3;
- (void)performActionsForButtonLongPress:(id)a3;
- (void)performActionsForButtonUp:(id)a3;
- (void)setHardwareButtonCoordinator:(id)a3;
- (void)setParameters:(uint64_t)a1;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)systemActionControlDidUpdateActionInteractionConfiguration:(id)a3;
- (void)systemActionSuppressionManager:(id)a3 didUpdateSuppressionStatus:(id)a4;
@end

@implementation SBRingerHardwareButton

- (SBRingerHardwareButton)init
{
  v4 = [NSString stringWithFormat:@"nope"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"SBRingerHardwareButton.m";
    __int16 v17 = 1024;
    int v18 = 109;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (SBRingerHardwareButton *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (SBRingerHardwareButton)new
{
  v4 = [NSString stringWithFormat:@"nope"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    v16 = @"SBRingerHardwareButton.m";
    __int16 v17 = 1024;
    int v18 = 113;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (SBRingerHardwareButton *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (uint64_t)initWithSystemActionControl:(void *)a3 suppressionManager:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    if ((SBUIHasHIDRingerButton() & 1) == 0 && (_os_feature_enabled_impl() & 1) == 0)
    {
      v21 = [NSString stringWithFormat:@"Should not instantiate SBRingerHardwareButton on devices without a ringer button"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBRingerHardwareButton initWithSystemActionControl:suppressionManager:]();
      }
      [v21 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D89E60A0);
    }
    if (!v6)
    {
      v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"systemActionControl != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBRingerHardwareButton initWithSystemActionControl:suppressionManager:]();
      }
      [v20 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D89E6048);
    }
    v22.receiver = (id)a1;
    v22.super_class = (Class)SBRingerHardwareButton;
    v8 = (id *)objc_msgSendSuper2(&v22, sel_init);
    a1 = (uint64_t)v8;
    if (v8)
    {
      objc_storeStrong(v8 + 3, a2);
      -[SBSystemActionControl addObserver:](*(void *)(a1 + 24), (void *)a1);
      objc_storeStrong((id *)(a1 + 32), a3);
      -[SBSystemActionSuppressionManager addObserver:](*(void *)(a1 + 32), (void *)a1);
      int v9 = objc_alloc_init(SBHIDButtonStateArbiter);
      v10 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v9;

      [*(id *)(a1 + 88) setDelegate:a1];
      uint64_t v11 = +[SBRingerHardwareButtonDomain rootSettings];
      v12 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v11;

      __int16 v13 = [*(id *)(a1 + 16) ringerButtonParameters];
      uint64_t v14 = [v13 copy];
      __int16 v15 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v14;

      -[SBRingerHardwareButton _configureButtonArbiter](a1);
      [*(id *)(a1 + 16) addKeyObserver:a1];
      v16 = SBLogButtonsRinger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 8);
        *(_DWORD *)buf = 138543362;
        uint64_t v24 = v17;
        _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "initial parameters: %{public}@", buf, 0xCu);
      }

      id v18 = +[SBSystemActionAnalyticsTracker sharedTracker]();
    }
  }

  return a1;
}

- (void)setParameters:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = [a2 copy];
    v4 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v3;

    -[SBRingerHardwareButton _configureButtonArbiter](a1);
  }
}

- (uint64_t)handleRingerButtonEvent:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (IOHIDEventGetType() != 3)
    {
      v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"IOHIDEventGetType(event) == kIOHIDEventTypeKeyboard"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBRingerHardwareButton handleRingerButtonEvent:]();
      }
      [v5 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D89E61ECLL);
    }
    if (IOHIDEventGetIntegerValue() != 11)
    {
      id v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"IOHIDEventGetIntegerValue(event, kIOHIDEventFieldKeyboardUsagePage) == kHIDPage_Telephony"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBRingerHardwareButton handleRingerButtonEvent:]();
      }
      [v6 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D89E6250);
    }
    if (IOHIDEventGetIntegerValue() != 45)
    {
      id v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"IOHIDEventGetIntegerValue(event, kIOHIDEventFieldKeyboardUsage) == kHIDUsage_Tfon_RingEnable"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBRingerHardwareButton handleRingerButtonEvent:]();
      }
      [v7 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D89E62B4);
    }
    v4 = *(void **)(v3 + 88);
    return [v4 processEvent:a2];
  }
  return result;
}

- (void)_configureButtonArbiter
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = -[SBSystemActionSuppressionManager suppressionStatus](*(uint64_t **)(a1 + 32));
    uint64_t v3 = -[SBCameraActivationManager workspace]((uint64_t)v2);
    uint64_t v4 = *(void *)(a1 + 8);
    if (v4)
    {
      uint64_t v5 = 8;
      if (v3 == 1) {
        uint64_t v5 = 16;
      }
      double v6 = *(double *)(v4 + v5);
    }
    else
    {
      double v6 = 0.0;
    }

    [*(id *)(a1 + 88) setLongPressTimeout:v6];
    id v7 = SBLogButtonsRinger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      uint64_t v9 = a1;
      __int16 v10 = 2048;
      double v11 = v6;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@) button arbiter longPressTimeout: %f", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_performActionForEvent:(uint64_t)a1 interactionTime:(uint64_t)a2
{
  if (a1)
  {
    v21 = (id *)*(id *)(a1 + 24);
    uint64_t v4 = -[SBSystemActionSuppressionManager suppressionStatus](*(uint64_t **)(a1 + 32));
    int v5 = 0;
    switch(a2)
    {
      case 0:
        double v6 = +[SBSystemActionAnalyticsTracker sharedTracker]();
        BSMonotonicReferencedTimeFromMachTime();
        -[SBSystemActionAnalyticsTracker trackPressDownForLatencyMeasurement:]((uint64_t)v6, v7);

        uint64_t v8 = *(void *)(a1 + 32);
        [*(id *)(a1 + 88) longPressTimeout];
        -[SBSystemActionSuppressionManager systemActionInteractionDidStartWithLongPressTimeout:](v8, v9);
        uint64_t v10 = -[SBSystemActionControl previewSelectedActionFromSource:withSuppressionStatus:](v21, @"SBRingerHardwareButton", v4);
        double v11 = *(void **)(a1 + 64);
        *(void *)(a1 + 64) = v10;
        goto LABEL_7;
      case 1:
        double v11 = -[SBRingerHardwareButton _dateFromMachAbsoluteTimestamp:](a1);
        uint64_t v12 = (void *)-[SBSystemActionInteractionContext initWithPreciseTimestamp:type:suppressionStatus:]((uint64_t)[SBSystemActionInteractionContext alloc], v11, 1, v4);
        uint64_t v13 = -[SBSystemActionControl performSelectedActionFromSource:withContext:]((uint64_t)v21, @"SBRingerHardwareButton", v12);
        uint64_t v14 = *(void **)(a1 + 72);
        *(void *)(a1 + 72) = v13;

        goto LABEL_7;
      case 2:
        goto LABEL_6;
      case 3:
        int v5 = 1;
LABEL_6:
        +[SBSystemActionAnalyticsTracker sharedTracker]();
        __int16 v15 = (double *)objc_claimAutoreleasedReturnValue();
        BOOL v16 = *(void *)(a1 + 72) != 0;
        uint64_t v17 = (void *)-[SBSystemActionControl selectedActionAnalyticsData](*(void *)(a1 + 24));
        __int16 v19 = v18;
        -[SBSystemActionAnalyticsTracker trackPressUpForLatencyMeasurement:cancelled:longPressTriggered:selectedActionIdentifier:](v15, v4, v5, v16, v17);

        [*(id *)(a1 + 64) invalidate];
        v20 = *(void **)(a1 + 64);
        *(void *)(a1 + 64) = 0;

        [*(id *)(a1 + 72) invalidate];
        double v11 = *(void **)(a1 + 72);
        *(void *)(a1 + 72) = 0;
LABEL_7:

        break;
      default:
        break;
    }
  }
}

- (id)_dateFromMachAbsoluteTimestamp:(uint64_t)a1
{
  if (a1)
  {
    v1 = [MEMORY[0x1E4F1C9C8] date];
    mach_absolute_time();
    BSTimeDifferenceFromMachTimeToMachTime();
    v2 = objc_msgSend(v1, "dateByAddingTimeInterval:");
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (uint64_t)_sendRingerButtonDownToSceneOverride
{
  uint64_t v1 = a1;
  if (a1)
  {
    v2 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
    uint64_t v3 = [v2 physicalButtonSceneOverrideManager];
    uint64_t v4 = -[SBPhysicalButtonSceneOverrideManager sendRingerButtonDown](v3);
    int v5 = *(void **)(v1 + 48);
    *(void *)(v1 + 48) = v4;

    uint64_t v1 = *(void *)(v1 + 48) != 0;
  }
  return v1;
}

- (void)performActionsForButtonDown:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_buttonActiveAssertion)
  {
    hardwareButtonCoordinator = self->_hardwareButtonCoordinator;
    double v6 = [(SBRingerHardwareButton *)self hardwareButtonIdentifier];
    double v7 = [(SBHardwareButtonCoordinator *)hardwareButtonCoordinator assertButtonIsActive:v6 dropletHintIdentifier:8];
    buttonActiveAssertion = self->_buttonActiveAssertion;
    self->_buttonActiveAssertion = v7;

    BOOL v9 = [(SBHardwareButtonCoordinator *)self->_hardwareButtonCoordinator buttonShouldStart:@"Ringer"];
    self->_inhibitActions = !v9;
    if (v9)
    {
      int v10 = -[SBRingerHardwareButton _sendRingerButtonDownToSceneOverride]((uint64_t)self);
      double v11 = SBLogButtonsRinger();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v12)
        {
          int v13 = [(SBHIDButtonStateArbiter *)self->_buttonArbiter pressSequence];
          int v16 = 67109120;
          int v17 = v13;
          _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "button down (sq%d): sent to scene override", (uint8_t *)&v16, 8u);
        }
      }
      else
      {
        if (v12)
        {
          int v14 = [(SBHIDButtonStateArbiter *)self->_buttonArbiter pressSequence];
          int v16 = 67109120;
          int v17 = v14;
          _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "button down (sq%d): performing action", (uint8_t *)&v16, 8u);
        }

        [v4 downTime];
        -[SBRingerHardwareButton _performActionForEvent:interactionTime:]((uint64_t)self, 0);
      }
      __int16 v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v15 postNotificationName:*MEMORY[0x1E4FA7A98] object:0];
    }
  }
}

- (void)performActionsForButtonLongPress:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_inhibitActions)
  {
    overrideButtonUpHandler = self->_overrideButtonUpHandler;
    double v6 = SBLogButtonsRinger();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (overrideButtonUpHandler)
    {
      if (v7)
      {
        int v8 = [(SBHIDButtonStateArbiter *)self->_buttonArbiter pressSequence];
        int v10 = 67109120;
        int v11 = v8;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "long press (sq%d): skipping due to override handler", (uint8_t *)&v10, 8u);
      }
    }
    else
    {
      if (v7)
      {
        int v9 = [(SBHIDButtonStateArbiter *)self->_buttonArbiter pressSequence];
        int v10 = 67109120;
        int v11 = v9;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "long press (sq%d): performing action", (uint8_t *)&v10, 8u);
      }

      [v4 downTime];
      -[SBRingerHardwareButton _performActionForEvent:interactionTime:]((uint64_t)self, 1);
    }
  }
}

- (void)performActionsForButtonUp:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(BSInvalidatable *)self->_buttonActiveAssertion invalidate];
  buttonActiveAssertion = self->_buttonActiveAssertion;
  self->_buttonActiveAssertion = 0;

  if (!self->_inhibitActions)
  {
    overrideButtonUpHandler = self->_overrideButtonUpHandler;
    BOOL v7 = SBLogButtonsRinger();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (overrideButtonUpHandler)
    {
      if (v8)
      {
        int v9 = [(SBHIDButtonStateArbiter *)self->_buttonArbiter pressSequence];
        int v12 = 67109120;
        int v13 = v9;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "button up (sq%d): invoking override", (uint8_t *)&v12, 8u);
      }

      [(SBPhysicalButtonCompletionHandling *)self->_overrideButtonUpHandler completeWithResult:0];
      int v10 = self->_overrideButtonUpHandler;
      self->_overrideButtonUpHandler = 0;
    }
    else
    {
      if (v8)
      {
        int v11 = [(SBHIDButtonStateArbiter *)self->_buttonArbiter pressSequence];
        int v12 = 67109120;
        int v13 = v11;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "button up (sq%d): performing action", (uint8_t *)&v12, 8u);
      }

      [v4 downTime];
      -[SBRingerHardwareButton _performActionForEvent:interactionTime:]((uint64_t)self, 2);
    }
  }
}

- (void)systemActionControlDidUpdateActionInteractionConfiguration:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogButtonsRinger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    double v6 = self;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) configuring button arbiter for system action interaction update", (uint8_t *)&v5, 0xCu);
  }

  -[SBRingerHardwareButton _configureButtonArbiter]((uint64_t)self);
}

- (void)systemActionSuppressionManager:(id)a3 didUpdateSuppressionStatus:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  double v6 = SBLogButtonsRinger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    int v9 = self;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) configuring button arbiter for system action suppression update", (uint8_t *)&v8, 0xCu);
  }

  -[SBRingerHardwareButton _configureButtonArbiter]((uint64_t)self);
  uint64_t v7 = +[SBSystemActionAnalyticsTracker sharedTracker]();
  -[SBSystemActionAnalyticsTracker trackSuppressionStatusUpdate:]((uint64_t)v7, v5);
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_settings == a3)
  {
    id v5 = [a3 ringerButtonParameters];
    -[SBRingerHardwareButton setParameters:]((uint64_t)self, v5);

    double v6 = SBLogButtonsRinger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      parameters = self->_parameters;
      int v8 = 138543362;
      int v9 = parameters;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "(key) update button parameters from prototype settings: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)cancelHardwareButtonPress
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  self->_inhibitActions = 1;
  overrideButtonUpHandler = self->_overrideButtonUpHandler;
  id v4 = SBLogButtonsRinger();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (overrideButtonUpHandler)
  {
    if (v5)
    {
      int v6 = [(SBHIDButtonStateArbiter *)self->_buttonArbiter pressSequence];
      int v9 = 67109120;
      int v10 = v6;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "button cancelled (sq%d): invoking override", (uint8_t *)&v9, 8u);
    }

    [(SBPhysicalButtonCompletionHandling *)self->_overrideButtonUpHandler completeWithResult:1];
    uint64_t v7 = self->_overrideButtonUpHandler;
    self->_overrideButtonUpHandler = 0;
  }
  else
  {
    if (v5)
    {
      int v8 = [(SBHIDButtonStateArbiter *)self->_buttonArbiter pressSequence];
      int v9 = 67109120;
      int v10 = v8;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "button cancelled (sq%d): performing action", (uint8_t *)&v9, 8u);
    }

    [(SBHIDButtonStateArbiter *)self->_buttonArbiter downTime];
    -[SBRingerHardwareButton _performActionForEvent:interactionTime:]((uint64_t)self, 3);
  }
}

- (id)hardwareButtonIdentifier
{
  return @"Ringer";
}

- (SBHardwareButtonCoordinator)hardwareButtonCoordinator
{
  return self->_hardwareButtonCoordinator;
}

- (void)setHardwareButtonCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonArbiter, 0);
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, 0);
  objc_storeStrong((id *)&self->_systemActionPerformedInteractionAssertion, 0);
  objc_storeStrong((id *)&self->_systemActionPreviewingAssertion, 0);
  objc_storeStrong((id *)&self->_buttonActiveAssertion, 0);
  objc_storeStrong((id *)&self->_overrideButtonUpHandler, 0);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
  objc_storeStrong((id *)&self->_systemActionControl, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

- (void)initWithSystemActionControl:suppressionManager:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithSystemActionControl:suppressionManager:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)handleRingerButtonEvent:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)handleRingerButtonEvent:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)handleRingerButtonEvent:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end