@interface UIUserInterfaceStyleArbiter
+ (id)sharedInstance;
- (BOOL)_updateControllersWithOldModeValue:(int64_t)a3 newModeValue:(int64_t)a4;
- (NSString)debugDescription;
- (id)_init;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)nextTransition;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)_proposedStyleForCurrentMode;
- (int64_t)currentStyle;
- (void)_backlightStateUpdated:(int64_t)a3 updateStyle:(BOOL)a4;
- (void)_logArbiterDecisionToBiomeWithNewStyle:(int64_t)a3 reason:(int64_t)a4;
- (void)_logChangeEventWithNewMode:(int64_t)a3 oldMode:(int64_t)a4 newStyle:(int64_t)a5 oldStyle:(int64_t)a6 reason:(int64_t)a7;
- (void)_logPeriodicEvent;
- (void)_setWatchesScreenDim:(BOOL)a3;
- (void)_updateCurrentStyleAndNotify:(BOOL)a3 forReason:(int64_t)a4;
- (void)_updateCurrentStyleForReason:(int64_t)a3;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5;
- (void)toggleCurrentStyle;
- (void)toggleCurrentStyleWithOverrideTiming:(int64_t)a3;
- (void)userInterfaceStyleModeDidChange:(id)a3;
@end

@implementation UIUserInterfaceStyleArbiter

- (int64_t)currentStyle
{
  return self->_currentStyle;
}

+ (id)sharedInstance
{
  if (UIApp)
  {
    uint64_t v5 = 0;
    v6 = &v5;
    uint64_t v7 = 0x2020000000;
    char v8 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__UIUserInterfaceStyleArbiter_sharedInstance__block_invoke;
    block[3] = &unk_1E52D9900;
    block[4] = &v5;
    if (qword_1EB2630F0 != -1) {
      dispatch_once(&qword_1EB2630F0, block);
    }
    if (*((unsigned char *)v6 + 24))
    {
      if (pthread_main_np() == 1) {
        [(id)qword_1EB2630E8 _updateCurrentStyleAndNotify:1 forReason:0];
      }
      else {
        dispatch_sync(MEMORY[0x1E4F14428], &__block_literal_global_49_3);
      }
    }
    id v2 = (id)qword_1EB2630E8;
    _Block_object_dispose(&v5, 8);
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

void __45__UIUserInterfaceStyleArbiter_sharedInstance__block_invoke(uint64_t a1)
{
  if ([(id)UIApp isFrontBoard])
  {
    if ([MEMORY[0x1E4F629E0] currentProcessServicesDefaultShellEndpoint])
    {
      id v2 = [[UIUserInterfaceStyleArbiter alloc] _init];
      v3 = (void *)qword_1EB2630E8;
      qword_1EB2630E8 = (uint64_t)v2;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
  }
}

uint64_t __45__UIUserInterfaceStyleArbiter_sharedInstance__block_invoke_2()
{
  return [(id)qword_1EB2630E8 _updateCurrentStyleAndNotify:1 forReason:0];
}

- (id)_init
{
  v17.receiver = self;
  v17.super_class = (Class)UIUserInterfaceStyleArbiter;
  id v2 = [(UIUserInterfaceStyleArbiter *)&v17 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4FB3498]) initWithDelegate:v2];
    styleMode = v2->_styleMode;
    v2->_styleMode = (UISUserInterfaceStyleMode *)v3;

    v2->_notificationToken = -1;
    notify_register_check("com.apple.UIKit.SystemUIServiceUserInterfaceStyleNotification", &v2->_notificationToken);
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28B38]) initWithIdentifier:@"com.apple.UIKit.UserInterfaceStyleAnalyticsActivity"];
    backgroundActivityScheduler = v2->_backgroundActivityScheduler;
    v2->_backgroundActivityScheduler = (NSBackgroundActivityScheduler *)v5;

    [(NSBackgroundActivityScheduler *)v2->_backgroundActivityScheduler setRepeats:1];
    [(NSBackgroundActivityScheduler *)v2->_backgroundActivityScheduler setInterval:3600.0];
    uint64_t v7 = v2->_backgroundActivityScheduler;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __36__UIUserInterfaceStyleArbiter__init__block_invoke;
    v15[3] = &unk_1E5307CB8;
    char v8 = v2;
    v16 = v8;
    [(NSBackgroundActivityScheduler *)v7 scheduleWithBlock:v15];
    objc_initWeak(&location, v8);
    id v9 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v13, &location);
    uint64_t v10 = BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle();
    stateCaptureToken = v8->_stateCaptureToken;
    v8->_stateCaptureToken = (BSInvalidatable *)v10;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __36__UIUserInterfaceStyleArbiter__init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 88) shouldDefer])
  {
    v3[2](v3, 2);
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __36__UIUserInterfaceStyleArbiter__init__block_invoke_2;
    v4[3] = &unk_1E52DA160;
    id v5 = *(id *)(a1 + 32);
    v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

uint64_t __36__UIUserInterfaceStyleArbiter__init__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _logPeriodicEvent];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

id __36__UIUserInterfaceStyleArbiter__init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained descriptionWithMultilinePrefix:0];

  return v2;
}

- (void)toggleCurrentStyle
{
}

- (void)toggleCurrentStyleWithOverrideTiming:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    int64_t v14 = a3;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Arbiter toggleCurrentStyleWithOverrideTiming: %ld", (uint8_t *)&v13, 0xCu);
  }

  int64_t currentModeValue = self->_currentModeValue;
  if (currentModeValue > 99)
  {
    if (currentModeValue == 100 || currentModeValue == 102)
    {
      int64_t style = self->_lastOverride.style;
      if (style && style != self->_lastProposedAutomaticStyle)
      {
        uint64_t v10 = *MEMORY[0x1E4FB3540];
        int64_t v12 = *(void *)(MEMORY[0x1E4FB3540] + 8);
        styleMode = self->_styleMode;
      }
      else
      {
        if (self->_currentStyle == 1) {
          uint64_t v10 = 2;
        }
        else {
          uint64_t v10 = 1;
        }
        styleMode = self->_styleMode;
        int64_t v12 = a3;
      }
      -[UISUserInterfaceStyleMode setOverride:](styleMode, "setOverride:", v10, v12);
    }
  }
  else
  {
    if (currentModeValue == 1)
    {
      uint64_t v7 = self->_styleMode;
      uint64_t v8 = 2;
    }
    else
    {
      if (currentModeValue != 2) {
        return;
      }
      uint64_t v7 = self->_styleMode;
      uint64_t v8 = 1;
    }
    [(UISUserInterfaceStyleMode *)v7 setModeValue:v8];
  }
}

- (id)nextTransition
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (UISUserInterfaceStyleModeValueIsAutomatic())
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __45__UIUserInterfaceStyleArbiter_nextTransition__block_invoke;
    aBlock[3] = &unk_1E5307D08;
    aBlock[4] = self;
    uint64_t v3 = _Block_copy(aBlock);
    v4 = v3;
    int64_t style = self->_lastOverride.style;
    if (style && style != self->_lastProposedAutomaticStyle && (unint64_t)(self->_lastOverride.timing - 1) > 1)
    {
      v6 = 0;
    }
    else
    {
      v6 = (*((void (**)(void *))v3 + 2))(v3);
    }
  }
  else
  {
    v6 = 0;
  }
  uint64_t v7 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "Arbiter returning nextTransition: %@", buf, 0xCu);
  }

  return v6;
}

id __45__UIUserInterfaceStyleArbiter_nextTransition__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2 == 100)
  {
    uint64_t v3 = 64;
    goto LABEL_5;
  }
  if (v2 == 102)
  {
    uint64_t v3 = 72;
LABEL_5:
    v4 = [*(id *)(v1 + v3) nextTransition:*(void *)(v1 + 24) == 1];
    goto LABEL_7;
  }
  v4 = 0;
LABEL_7:
  return v4;
}

- (void)userInterfaceStyleModeDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__UIUserInterfaceStyleArbiter_userInterfaceStyleModeDidChange___block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __63__UIUserInterfaceStyleArbiter_userInterfaceStyleModeDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCurrentStyleForReason:1];
}

- (NSString)debugDescription
{
  return (NSString *)[(UIUserInterfaceStyleArbiter *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(UIUserInterfaceStyleArbiter *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = _NSStringFromUIUserInterfaceStyle(self->_currentStyle);
  id v5 = (id)[v3 appendObject:v4 withName:@"currentStyle"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(UIUserInterfaceStyleArbiter *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  v6 = [v4 builderWithObject:self];
  [v6 setActiveMultilinePrefix:v5];

  uint64_t v7 = _NSStringFromUIUserInterfaceStyle(self->_currentStyle);
  id v8 = (id)[v6 appendObject:v7 withName:@"currentStyle"];

  id v9 = [v6 activeMultilinePrefix];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__UIUserInterfaceStyleArbiter_descriptionBuilderWithMultilinePrefix___block_invoke;
  v13[3] = &unk_1E52D9F98;
  id v10 = v6;
  id v14 = v10;
  uint64_t v15 = self;
  [v10 appendBodySectionWithName:0 multilinePrefix:v9 block:v13];

  id v11 = v10;
  return v11;
}

id __69__UIUserInterfaceStyleArbiter_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"styleMode"];
  id v3 = (id)[*(id *)(a1 + 32) appendInteger:*(void *)(*(void *)(a1 + 40) + 16) withName:@"currentModeValue"];
  id v4 = (id)[*(id *)(a1 + 32) appendInteger:*(void *)(*(void *)(a1 + 40) + 32) withName:@"lastProposedAutomaticStyle"];
  id v5 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 64) withName:@"sunScheduleController" skipIfNil:1];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 72) withName:@"customScheduleController" skipIfNil:1];
}

- (void)_updateCurrentStyleForReason:(int64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(UIUserInterfaceStyleArbiter *)self _updateCurrentStyleAndNotify:1 forReason:a3];
}

- (void)_updateCurrentStyleAndNotify:(BOOL)a3 forReason:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v7 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v41 = v5;
    *(_WORD *)&v41[4] = 2048;
    *(void *)&v41[6] = a4;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "Arbiter _updateCurrentStyleAndNotify:%d forReason:%ld", buf, 0x12u);
  }

  int64_t v8 = [(UISUserInterfaceStyleMode *)self->_styleMode modeValue];
  int64_t currentModeValue = self->_currentModeValue;
  BOOL v10 = [(UIUserInterfaceStyleArbiter *)self _updateControllersWithOldModeValue:currentModeValue newModeValue:v8];
  self->_int64_t currentModeValue = v8;
  if (a4 != 2)
  {
    if (v8 == 100)
    {
      uint64_t v11 = 64;
    }
    else
    {
      if (v8 != 102) {
        goto LABEL_9;
      }
      uint64_t v11 = 72;
    }
    [*(id *)((char *)&self->super.isa + v11) forceUpdate];
  }
LABEL_9:
  int64_t v12 = [(UIUserInterfaceStyleArbiter *)self _proposedStyleForCurrentMode];
  int v13 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)v41 = v12;
    _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "Arbiter proposed style: %ld", buf, 0xCu);
  }

  if ((UISUserInterfaceStyleModeValueIsAutomatic() & 1) == 0)
  {
    [(UIUserInterfaceStyleArbiter *)self _setWatchesScreenDim:0];
    int v24 = 0;
    self->_int64_t lastProposedAutomaticStyle = 0;
    self->_lastOverride = ($B891F94A0926B9C3D48CD771059595CF)*MEMORY[0x1E4FB3540];
    goto LABEL_58;
  }
  BOOL v39 = v5;
  [(UIUserInterfaceStyleArbiter *)self _setWatchesScreenDim:1];
  int64_t v14 = [(UISUserInterfaceStyleMode *)self->_styleMode override];
  int64_t v16 = v15;
  int64_t v38 = currentModeValue;
  if (v14)
  {
    objc_super v17 = _UIUserInterfaceStyleArbiterLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v41 = v14;
      _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_DEFAULT, "Arbiter considering override style: %ld", buf, 0xCu);
    }

    if ((unint64_t)(v16 - 1) > 1) {
      goto LABEL_28;
    }
    int64_t lastProposedAutomaticStyle = self->_lastProposedAutomaticStyle;
    if (lastProposedAutomaticStyle) {
      BOOL v19 = v12 == lastProposedAutomaticStyle;
    }
    else {
      BOOL v19 = 1;
    }
    int v21 = v19 || v12 == v14;
    v22 = _UIUserInterfaceStyleArbiterLogger();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)v41 = v14;
      *(_WORD *)&v41[8] = 2048;
      *(void *)&v41[10] = v21 ^ 1u;
      _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_DEFAULT, "Last proposed: %ld, so clear override: %ld", buf, 0x16u);
    }

    if (v21)
    {
LABEL_28:
      v23 = _UIUserInterfaceStyleArbiterLogger();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v41 = v14;
        _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_DEFAULT, "Not clearing override, so using override style %ld", buf, 0xCu);
      }

      int v24 = 0;
      int64_t currentStyle = v14;
      goto LABEL_35;
    }
    int v24 = 1;
  }
  else
  {
    int v24 = 0;
  }
  int64_t currentStyle = v12;
LABEL_35:
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v26 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    for (int i = _UIInternalPreference_SettingsUserInterfaceStyleSuppressChange;
          v26 != i;
          int i = _UIInternalPreference_SettingsUserInterfaceStyleSuppressChange)
    {
      if (v26 < i)
      {
        if (byte_1E8FD54AC) {
          break;
        }
        goto LABEL_54;
      }
      _UIInternalPreferenceSync(v26, &_UIInternalPreference_SettingsUserInterfaceStyleSuppressChange, @"SettingsUserInterfaceStyleSuppressChange", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    }
  }
  char v28 = a4 == 6 || self->_isDim || v10;
  if ((v28 & 1) != 0 || !UISUserInterfaceStyleModeOverridesEqual())
  {
LABEL_54:
    v33 = _UIUserInterfaceStyleArbiterLogger();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)v41 = currentStyle;
      _os_log_impl(&dword_1853B0000, v33, OS_LOG_TYPE_DEFAULT, "Arbiter taking proposed style: %ld", buf, 0xCu);
    }
  }
  else
  {
    v29 = _UIUserInterfaceStyleArbiterLogger();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      BOOL isDim = self->_isDim;
      int v31 = UISUserInterfaceStyleModeOverridesEqual();
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v41 = isDim;
      *(_WORD *)&v41[4] = 2048;
      *(void *)&v41[6] = a4;
      *(_WORD *)&v41[14] = 1024;
      *(_DWORD *)&v41[16] = 0;
      LOWORD(v42[0]) = 1024;
      *(_DWORD *)((char *)v42 + 2) = v31;
      _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_DEFAULT, "Arbiter ignoring proposed style: isDim: %d, reason: %ld, significantModeChange: %d, overrides equal: %d", buf, 0x1Eu);
    }

    int64_t currentStyle = self->_currentStyle;
  }
  int64_t currentModeValue = v38;
  self->_int64_t lastProposedAutomaticStyle = v12;
  self->_lastOverride.int64_t style = v14;
  int64_t v12 = currentStyle;
  self->_lastOverride.timing = v16;
  BOOL v5 = v39;
LABEL_58:
  int64_t v34 = self->_currentStyle;
  if (v12 == v34)
  {
    [(UIUserInterfaceStyleArbiter *)self _logArbiterDecisionToBiomeWithNewStyle:v12 reason:a4];
    if (v8 == currentModeValue)
    {
      if (!v24) {
        return;
      }
      goto LABEL_68;
    }
  }
  else
  {
    self->_int64_t currentStyle = v12;
    v35 = _UIUserInterfaceStyleArbiterLogger();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(void *)v41 = v34;
      *(_WORD *)&v41[8] = 2048;
      *(void *)&v41[10] = v12;
      *(_WORD *)&v41[18] = 1024;
      v42[0] = v5;
      _os_log_impl(&dword_1853B0000, v35, OS_LOG_TYPE_DEFAULT, "Arbiter changing style from %ld to %ld, notifying: %d", buf, 0x1Cu);
    }

    notify_set_state(self->_notificationToken, self->_currentStyle);
    if (v5)
    {
      notify_post("com.apple.UIKit.SystemUIServiceUserInterfaceStyleNotification");
      v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v36 postNotificationName:@"UIUserInterfaceStyleArbiterStyleChangedNotification" object:self];
    }
    -[UIUserInterfaceStyleArbiter _logArbiterDecisionToBiomeWithNewStyle:reason:](self, "_logArbiterDecisionToBiomeWithNewStyle:reason:", v12, a4, v38);
  }
  -[UIUserInterfaceStyleArbiter _logChangeEventWithNewMode:oldMode:newStyle:oldStyle:reason:](self, "_logChangeEventWithNewMode:oldMode:newStyle:oldStyle:reason:", v8, currentModeValue, v12, v34, a4, v38);
  if (!v24) {
    return;
  }
LABEL_68:
  v37 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1853B0000, v37, OS_LOG_TYPE_DEFAULT, "Arbiter clearing override", buf, 2u);
  }

  -[UISUserInterfaceStyleMode setOverride:](self->_styleMode, "setOverride:", *MEMORY[0x1E4FB3540], *(void *)(MEMORY[0x1E4FB3540] + 8));
}

- (BOOL)_updateControllersWithOldModeValue:(int64_t)a3 newModeValue:(int64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a3 == a4)
  {
    if (a3 != 102)
    {
LABEL_34:
      int v19 = 0;
      goto LABEL_35;
    }
  }
  else
  {
    if (a4 == 100)
    {
      if (!self->_sunScheduleController)
      {
        uint64_t v7 = _UIUserInterfaceStyleArbiterLogger();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "Arbiter creating SunScheduleController", (uint8_t *)&buf, 2u);
        }

        int64_t v8 = objc_alloc_init(_UISunScheduleController);
        sunScheduleController = self->_sunScheduleController;
        self->_sunScheduleController = v8;
      }
      BOOL v10 = _UIUserInterfaceStyleArbiterLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "Arbiter starting observing SunScheduleController", (uint8_t *)&buf, 2u);
      }

      objc_initWeak((id *)&buf, self);
      uint64_t v11 = self->_sunScheduleController;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __79__UIUserInterfaceStyleArbiter__updateControllersWithOldModeValue_newModeValue___block_invoke;
      v28[3] = &unk_1E5307D30;
      objc_copyWeak(&v29, (id *)&buf);
      [(_UISunScheduleController *)v11 addObserver:self changeHandler:v28];
      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)&buf);
      goto LABEL_30;
    }
    if (a3 == 100)
    {
      objc_super v17 = _UIUserInterfaceStyleArbiterLogger();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_DEFAULT, "Arbiter ending observing SunScheduleController", (uint8_t *)&buf, 2u);
      }

      [(_UISunScheduleController *)self->_sunScheduleController removeObserver:self];
      if (a4 != 102) {
        goto LABEL_34;
      }
    }
    else if (a4 != 102)
    {
LABEL_30:
      if (a3 == 102)
      {
        v22 = _UIUserInterfaceStyleArbiterLogger();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_DEFAULT, "Arbiter ending observing CustomScheduleController", (uint8_t *)&buf, 2u);
        }

        [(_UICustomScheduleController *)self->_customScheduleController removeObserver:self];
      }
      goto LABEL_34;
    }
  }
  if (!self->_customScheduleController)
  {
    int64_t v12 = _UIUserInterfaceStyleArbiterLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "Arbiter creating CustomScheduleController", (uint8_t *)&buf, 2u);
    }

    int v13 = objc_alloc_init(_UICustomScheduleController);
    customScheduleController = self->_customScheduleController;
    self->_customScheduleController = v13;
  }
  long long buf = 0u;
  long long v31 = 0u;
  styleMode = self->_styleMode;
  if (styleMode) {
    [(UISUserInterfaceStyleMode *)styleMode customSchedule];
  }
  int64_t v16 = self->_customScheduleController;
  if (v16) {
    [(_UICustomScheduleController *)v16 schedule];
  }
  else {
    memset(&v27[4], 0, 32);
  }
  v27[2] = buf;
  v27[3] = v31;
  int v18 = UISUserInterfaceStyleModeSchedulesEqual();
  v27[0] = buf;
  v27[1] = v31;
  [(_UICustomScheduleController *)self->_customScheduleController setSchedule:v27];
  int v19 = v18 ^ 1;
  if (a3 != a4)
  {
    v20 = _UIUserInterfaceStyleArbiterLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_DEFAULT, "Arbiter starting observing CustomScheduleController", (uint8_t *)&buf, 2u);
    }

    objc_initWeak((id *)&buf, self);
    int v21 = self->_customScheduleController;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __79__UIUserInterfaceStyleArbiter__updateControllersWithOldModeValue_newModeValue___block_invoke_82;
    v25[3] = &unk_1E5307D58;
    objc_copyWeak(&v26, (id *)&buf);
    [(_UICustomScheduleController *)v21 addObserver:self changeHandler:v25];
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)&buf);
  }
LABEL_35:
  v23 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109376;
    DWORD1(buf) = a3 != a4;
    WORD4(buf) = 1024;
    *(_DWORD *)((char *)&buf + 10) = v19;
    _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_DEFAULT, "Arbiter _updateControllers got modeChanged:%d customScheduleChanged:%d", (uint8_t *)&buf, 0xEu);
  }

  return (a3 != a4) | v19;
}

void __79__UIUserInterfaceStyleArbiter__updateControllersWithOldModeValue_newModeValue___block_invoke(uint64_t a1)
{
  id v2 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "Arbiter SunScheduleController changed", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__UIUserInterfaceStyleArbiter__updateControllersWithOldModeValue_newModeValue___block_invoke_79;
  block[3] = &unk_1E52DC308;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v4);
}

void __79__UIUserInterfaceStyleArbiter__updateControllersWithOldModeValue_newModeValue___block_invoke_79(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateCurrentStyleForReason:2];
}

void __79__UIUserInterfaceStyleArbiter__updateControllersWithOldModeValue_newModeValue___block_invoke_82(uint64_t a1)
{
  id v2 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "Arbiter CustomScheduleController changed", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__UIUserInterfaceStyleArbiter__updateControllersWithOldModeValue_newModeValue___block_invoke_83;
  block[3] = &unk_1E52DC308;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v4);
}

void __79__UIUserInterfaceStyleArbiter__updateControllersWithOldModeValue_newModeValue___block_invoke_83(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateCurrentStyleForReason:2];
}

- (int64_t)_proposedStyleForCurrentMode
{
  int64_t currentModeValue = self->_currentModeValue;
  switch(currentModeValue)
  {
    case 102:
      customScheduleController = self->_customScheduleController;
      break;
    case 100:
      customScheduleController = self->_sunScheduleController;
      break;
    case 2:
      return 2;
    default:
      return 1;
  }
  if ([customScheduleController isInScheduleTime]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)_logArbiterDecisionToBiomeWithNewStyle:(int64_t)a3 reason:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    int v4 = 1;
  }
  else {
    int v4 = 2 * (a3 == 2);
  }
  if (a4 == 2) {
    int v5 = 3;
  }
  else {
    int v5 = a4 == 1;
  }
  v6 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109376;
    int v12 = v4;
    __int16 v13 = 1024;
    int v14 = v5;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "Arbiter asked to write decision to Biome with appearance state: %d, change reason: %d", buf, 0xEu);
  }

  uint64_t v7 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__UIUserInterfaceStyleArbiter__logArbiterDecisionToBiomeWithNewStyle_reason___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  int v9 = v4;
  int v10 = v5;
  dispatch_async(v7, block);
}

void __77__UIUserInterfaceStyleArbiter__logArbiterDecisionToBiomeWithNewStyle_reason___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 32);
    int v4 = *(_DWORD *)(a1 + 36);
    *(_DWORD *)long long buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v3;
    LOWORD(v22) = 1024;
    *(_DWORD *)((char *)&v22 + 2) = v4;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "Arbiter writing decision to Biome with appearance state: %d, change reason: %d", buf, 0xEu);
  }

  v20 = 0;
  if (!qword_1EB2630F8)
  {
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __BiomeStreamsLibraryCore_block_invoke;
    int v24 = &__block_descriptor_40_e5_v8__0l;
    v25 = &v20;
    long long v26 = xmmword_1E5307DA0;
    uint64_t v27 = 0;
    qword_1EB2630F8 = _sl_dlopen();
  }
  if (!qword_1EB2630F8)
  {
    int64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v17 = [NSString stringWithUTF8String:"void *BiomeStreamsLibrary(void)"];
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"UIUserInterfaceStyleArbiter.m", 32, @"%s", v20);

    goto LABEL_16;
  }
  if (v20) {
    free(v20);
  }
  *(void *)&long long v26 = 0;
  *((void *)&v26 + 1) = &v26;
  uint64_t v27 = 0x2050000000;
  int v5 = (void *)qword_1EB263100;
  char v28 = (void *)qword_1EB263100;
  if (!qword_1EB263100)
  {
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __getBMDisplayAppearanceClass_block_invoke;
    int v24 = &unk_1E52D9900;
    v25 = (void **)&v26;
    __getBMDisplayAppearanceClass_block_invoke((uint64_t)buf);
    int v5 = *(void **)(*((void *)&v26 + 1) + 24);
  }
  v6 = v5;
  _Block_object_dispose(&v26, 8);
  uint64_t v7 = (void *)[[v6 alloc] initWithState:*(unsigned int *)(a1 + 32) reason:*(unsigned int *)(a1 + 36)];
  *(void *)&long long v26 = 0;
  *((void *)&v26 + 1) = &v26;
  uint64_t v27 = 0x2020000000;
  int64_t v8 = (void (*)(void))off_1EB263108;
  char v28 = off_1EB263108;
  if (!off_1EB263108)
  {
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __getBiomeLibrarySymbolLoc_block_invoke;
    int v24 = &unk_1E52D9900;
    v25 = (void **)&v26;
    int v9 = BiomeLibraryLibrary();
    int v10 = dlsym(v9, "BiomeLibrary");
    *((void *)v25[1] + 3) = v10;
    off_1EB263108 = (_UNKNOWN *)*((void *)v25[1] + 3);
    int64_t v8 = *(void (**)(void))(*((void *)&v26 + 1) + 24);
  }
  _Block_object_dispose(&v26, 8);
  if (!v8)
  {
    int v18 = [MEMORY[0x1E4F28B00] currentHandler];
    int v19 = [NSString stringWithUTF8String:"id<BMRootLibrary> _UIBiomeLibrary(void)"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"UIUserInterfaceStyleArbiter.m", 35, @"%s", dlerror());

LABEL_16:
    __break(1u);
  }
  uint64_t v11 = v8();
  int v12 = [v11 Device];
  __int16 v13 = [v12 Display];
  int v14 = [v13 Appearance];
  uint64_t v15 = [v14 source];
  [v15 sendEvent:v7];
}

- (void)_logChangeEventWithNewMode:(int64_t)a3 oldMode:(int64_t)a4 newStyle:(int64_t)a5 oldStyle:(int64_t)a6 reason:(int64_t)a7
{
  v17[3] = *MEMORY[0x1E4F143B8];
  AnalyticsSendEventLazy();
  v16[0] = @"Mode";
  int v10 = [NSNumber numberWithInteger:a3];
  v17[0] = v10;
  v16[1] = @"Value";
  uint64_t v11 = [NSNumber numberWithInteger:a5];
  v17[1] = v11;
  v16[2] = @"Timestamp";
  int v12 = [MEMORY[0x1E4F1C9C8] date];
  v17[2] = v12;
  __int16 v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

  PLLogRegisteredEvent();
  int v14 = [MEMORY[0x1E4F1C9C8] date];
  lastUpdateDate = self->_lastUpdateDate;
  self->_lastUpdateDate = v14;
}

id __91__UIUserInterfaceStyleArbiter__logChangeEventWithNewMode_oldMode_newStyle_oldStyle_reason___block_invoke(void *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v3 = [NSNumber numberWithInteger:a1[5]];
  [v2 setObject:v3 forKeyedSubscript:@"currentMode"];

  int v4 = [NSNumber numberWithInteger:a1[6]];
  [v2 setObject:v4 forKeyedSubscript:@"previousMode"];

  int v5 = [NSNumber numberWithInteger:a1[7]];
  [v2 setObject:v5 forKeyedSubscript:@"currentValue"];

  v6 = [NSNumber numberWithInteger:a1[8]];
  [v2 setObject:v6 forKeyedSubscript:@"previousValue"];

  uint64_t v7 = [NSNumber numberWithInteger:a1[9]];
  [v2 setObject:v7 forKeyedSubscript:@"reason"];

  int64_t v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int v9 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v10 = [v8 component:32 fromDate:v9];

  uint64_t v11 = [NSNumber numberWithInteger:v10];
  [v2 setObject:v11 forKeyedSubscript:@"currentHour"];

  int v12 = *(void **)(a1[4] + 80);
  if (v12)
  {
    [v12 timeIntervalSinceNow];
    int v14 = [NSNumber numberWithInteger:vcvtmd_s64_f64(v13 / -60.0)];
    [v2 setObject:v14 forKeyedSubscript:@"length"];
  }
  return v2;
}

- (void)_logPeriodicEvent
{
}

id __48__UIUserInterfaceStyleArbiter__logPeriodicEvent__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v3 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1 + 32) + 16)];
  [v2 setObject:v3 forKeyedSubscript:@"currentMode"];

  int v4 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1 + 32) + 24)];
  [v2 setObject:v4 forKeyedSubscript:@"currentValue"];

  int v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v6 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v7 = [v5 component:32 fromDate:v6];

  int64_t v8 = [NSNumber numberWithInteger:v7];
  [v2 setObject:v8 forKeyedSubscript:@"currentHour"];

  return v2;
}

- (void)_setWatchesScreenDim:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Arbiter setWatchesScreenDim: %d", (uint8_t *)v8, 8u);
  }

  if (v3)
  {
    if (!self->_isObservingBacklightState && !self->_isAddingBacklightStateObserver)
    {
      v6 = [MEMORY[0x1E4F4F4D0] sharedBacklight];
      self->_isAddingBacklightStateObserver = 1;
      [v6 addObserver:self];
      *(_WORD *)&self->_isAddingBacklightStateObserver = 256;
      -[UIUserInterfaceStyleArbiter _backlightStateUpdated:updateStyle:](self, "_backlightStateUpdated:updateStyle:", [v6 backlightState], 0);
    }
  }
  else
  {
    if (self->_isObservingBacklightState)
    {
      uint64_t v7 = [MEMORY[0x1E4F4F4D0] sharedBacklight];
      [v7 removeObserver:self];

      self->_isObservingBacklightState = 0;
    }
    self->_BOOL isDim = 0;
  }
}

- (void)_backlightStateUpdated:(int64_t)a3 updateStyle:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = _UIUserInterfaceStyleArbiterLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    int64_t v13 = a3;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "Arbiter backlight state updated: %ld", (uint8_t *)&v12, 0xCu);
  }

  BOOL v8 = a3 != 2;
  if (self->_isDim != v8)
  {
    self->_BOOL isDim = v8;
    uint64_t v9 = _UIUserInterfaceStyleArbiterLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL isDim = self->_isDim;
      int v12 = 67109120;
      LODWORD(v13) = isDim;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "Arbiter backlight state is now dim: %d", (uint8_t *)&v12, 8u);
    }

    if (v4)
    {
      if (a3 == 2) {
        uint64_t v11 = 6;
      }
      else {
        uint64_t v11 = 5;
      }
      [(UIUserInterfaceStyleArbiter *)self _updateCurrentStyleForReason:v11];
    }
  }
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
  objc_storeStrong((id *)&self->_backgroundActivityScheduler, 0);
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_customScheduleController, 0);
  objc_storeStrong((id *)&self->_sunScheduleController, 0);
  objc_storeStrong((id *)&self->_styleMode, 0);
}

@end