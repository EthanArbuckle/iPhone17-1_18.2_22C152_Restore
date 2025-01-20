@interface SBDisplayLinkController
- (BOOL)observesBlankingChanges;
- (SBDisplayLinkController)initWithCADisplay:(id)a3 backlight:(id)a4;
- (id)maintainDisplayLinkWhenBacklightIsOffForReason:(id)a3;
- (void)_reevaluateForcingFixedRateLinks;
- (void)backlight:(id)a3 didBlankToDisplayMode:(int64_t)a4 fromDisplayMode:(int64_t)a5 activeEvents:(id)a6 abortedEvents:(id)a7;
- (void)backlight:(id)a3 willUnblankToDisplayMode:(int64_t)a4 fromDisplayMode:(int64_t)a5 forEvents:(id)a6 abortedEvents:(id)a7;
- (void)invalidate;
@end

@implementation SBDisplayLinkController

- (SBDisplayLinkController)initWithCADisplay:(id)a3 backlight:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  if (!v9)
  {
    v17 = NSString;
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    v20 = [v17 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"display", v19];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBDisplayLinkController initWithCADisplay:backlight:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8974100);
  }
  v10 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = NSString;
    v22 = (objc_class *)[v10 classForCoder];
    if (!v22) {
      v22 = (objc_class *)objc_opt_class();
    }
    v23 = NSStringFromClass(v22);
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    v26 = [v21 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"display", v23, v25];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBDisplayLinkController initWithCADisplay:backlight:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D89741A8);
  }

  if (!v8)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"backlight"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBDisplayLinkController initWithCADisplay:backlight:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D897420CLL);
  }
  v28.receiver = self;
  v28.super_class = (Class)SBDisplayLinkController;
  v11 = [(SBDisplayLinkController *)&v28 init];
  v12 = v11;
  if (v11)
  {
    p_display = (id *)&v11->_display;
    objc_storeStrong((id *)&v11->_display, a3);
    objc_storeStrong((id *)&v12->_backlight, a4);
    if ([(CADisplay *)v12->_display isForceFixedRateLinksEnabled])
    {
      v14 = SBLogBacklight();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = [*p_display displayId];
        *(_DWORD *)buf = 67109120;
        int v30 = v15;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "displayLinkController-%i: resetting forceFixedRateLinksEnabled at bootstrap", buf, 8u);
      }

      [*p_display setForceFixedRateLinksEnabled:0];
    }
  }

  return v12;
}

- (id)maintainDisplayLinkWhenBacklightIsOffForReason:(id)a3
{
  *(void *)&v25[7] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BSDispatchQueueAssertMain();
  if (self->_invalidated)
  {
    v17 = objc_msgSend(NSString, "stringWithFormat:", @"displayLinkController-%i: cannot adjust _maintainDisplayLinkWhenBacklightIsOffCount after invalidation", -[CADisplay displayId](self->_display, "displayId"));
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBDisplayLinkController maintainDisplayLinkWhenBacklightIsOffForReason:]();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8974504);
  }
  if (self->_maintainDisplayLinkWhenBacklightIsOffCount == 255)
  {
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"displayLinkController-%i: preventing _maintainDisplayLinkWhenBacklightIsOffCount overflow", -[CADisplay displayId](self->_display, "displayId"));
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBDisplayLinkController maintainDisplayLinkWhenBacklightIsOffForReason:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D897456CLL);
  }
  v6 = SBLogBacklight();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(CADisplay *)self->_display displayId];
    *(_DWORD *)buf = 67109378;
    int v23 = v7;
    __int16 v24 = 2112;
    *(void *)v25 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "displayLinkController-%i: taking maintainDisplayLinkWhenBacklightIsOff assertion for %@", buf, 0x12u);
  }

  ++self->_maintainDisplayLinkWhenBacklightIsOffCount;
  if (!self->_observerRegistered)
  {
    self->_observerRegistered = 1;
    [(BLSHBacklightHostObservable *)self->_backlight addObserver:self];
    [(BLSHBacklightHostObservable *)self->_backlight backlightDisplayMode];
    self->_BOOL displayLinkWouldBeOff = IsBlankedForBLSBacklightDisplayMode();
    id v8 = SBLogBacklight();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [(CADisplay *)self->_display displayId];
      BOOL displayLinkWouldBeOff = self->_displayLinkWouldBeOff;
      v11 = NSStringFromBLSBacklightDisplayMode();
      *(_DWORD *)buf = 67109634;
      int v23 = v9;
      __int16 v24 = 1024;
      *(_DWORD *)v25 = displayLinkWouldBeOff;
      v25[2] = 2112;
      *(void *)&v25[3] = v11;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "displayLinkController-%i: _displayLinkWouldBeOff initialized to %{BOOL}i for %@", buf, 0x18u);
    }
  }
  [(SBDisplayLinkController *)self _reevaluateForcingFixedRateLinks];
  id v12 = objc_alloc(MEMORY[0x1E4F4F838]);
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"displayLinkController-%i:maintainDisplayLinkWhenBacklightIsOff", -[CADisplay displayId](self->_display, "displayId"));
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__SBDisplayLinkController_maintainDisplayLinkWhenBacklightIsOffForReason___block_invoke;
  v19[3] = &unk_1E6AFFB08;
  id v20 = v5;
  SEL v21 = a2;
  v19[4] = self;
  id v14 = v5;
  int v15 = (void *)[v12 initWithIdentifier:v13 forReason:v14 invalidationBlock:v19];

  return v15;
}

void __74__SBDisplayLinkController_maintainDisplayLinkWhenBacklightIsOffForReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BSDispatchQueueAssertMain();
  uint64_t v5 = a1 + 32;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v4 + 24))
  {
    v10 = objc_msgSend(NSString, "stringWithFormat:", @"displayLinkController-%i: preventing _maintainDisplayLinkWhenBacklightIsOffCount underflow", objc_msgSend(*(id *)(v4 + 8), "displayId"));
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __74__SBDisplayLinkController_maintainDisplayLinkWhenBacklightIsOffForReason___block_invoke_cold_1();
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D89746F8);
  }
  v6 = SBLogBacklight();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [*(id *)(*(void *)(a1 + 32) + 8) displayId];
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 67109378;
    int v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "displayLinkController-%i: releasing maintainDisplayLinkWhenBacklightIsOff assertion for %@", buf, 0x12u);
  }

  --*(unsigned char *)(*(void *)v5 + 24);
  int v9 = *(unsigned char **)v5;
  if (*(unsigned char *)(*(void *)v5 + 25) && !v9[24])
  {
    v9[25] = 0;
    objc_msgSend(*(id *)(*(void *)v5 + 16), "removeObserver:");
    int v9 = *(unsigned char **)v5;
  }
  [v9 _reevaluateForcingFixedRateLinks];
}

- (void)invalidate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    if (self->_observerRegistered)
    {
      self->_observerRegistered = 0;
      [(BLSHBacklightHostObservable *)self->_backlight removeObserver:self];
    }
    if (self->_displayLinkForcedToFixedRate)
    {
      id v3 = SBLogBacklight();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = [(CADisplay *)self->_display displayId];
        v5[0] = 67109120;
        v5[1] = v4;
        _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "displayLinkController-%i: resetting forceFixedRateLinksEnabled", (uint8_t *)v5, 8u);
      }

      [(CADisplay *)self->_display setForceFixedRateLinksEnabled:0];
    }
  }
}

- (void)_reevaluateForcingFixedRateLinks
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidated)
  {
    BOOL v3 = self->_displayLinkWouldBeOff && (unint64_t)(self->_maintainDisplayLinkWhenBacklightIsOffCount != 0);
    if (self->_displayLinkForcedToFixedRate != v3)
    {
      int v4 = SBLogBacklight();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = [(CADisplay *)self->_display displayId];
        v6[0] = 67109376;
        v6[1] = v5;
        __int16 v7 = 1024;
        BOOL v8 = v3;
        _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "displayLinkController-%i: setting forceFixedRateLinksEnabled to %{BOOL}i", (uint8_t *)v6, 0xEu);
      }

      self->_displayLinkForcedToFixedRate = v3;
      [(CADisplay *)self->_display setForceFixedRateLinksEnabled:v3];
    }
  }
}

- (void)backlight:(id)a3 willUnblankToDisplayMode:(int64_t)a4 fromDisplayMode:(int64_t)a5 forEvents:(id)a6 abortedEvents:(id)a7
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  BOOL v8 = SBLogBacklight();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(CADisplay *)self->_display displayId];
    v10[0] = 67109120;
    v10[1] = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "displayLinkController-%i: display is unblanking - updating _displayLinkWouldBeOff to false", (uint8_t *)v10, 8u);
  }

  self->_BOOL displayLinkWouldBeOff = 0;
  [(SBDisplayLinkController *)self _reevaluateForcingFixedRateLinks];
}

- (void)backlight:(id)a3 didBlankToDisplayMode:(int64_t)a4 fromDisplayMode:(int64_t)a5 activeEvents:(id)a6 abortedEvents:(id)a7
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BSDispatchQueueAssertMain();
  BOOL v8 = SBLogBacklight();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(CADisplay *)self->_display displayId];
    v10[0] = 67109120;
    v10[1] = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "displayLinkController-%i: display is blanking - updating _displayLinkWouldBeOff to true", (uint8_t *)v10, 8u);
  }

  self->_BOOL displayLinkWouldBeOff = 1;
  [(SBDisplayLinkController *)self _reevaluateForcingFixedRateLinks];
}

- (BOOL)observesBlankingChanges
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backlight, 0);
  objc_storeStrong((id *)&self->_display, 0);
}

- (void)initWithCADisplay:backlight:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithCADisplay:backlight:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)maintainDisplayLinkWhenBacklightIsOffForReason:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)maintainDisplayLinkWhenBacklightIsOffForReason:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  BOOL v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __74__SBDisplayLinkController_maintainDisplayLinkWhenBacklightIsOffForReason___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  SEL v1 = NSStringFromSelector(*(SEL *)(v0 + 48));
  v2 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);
}

@end