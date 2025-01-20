@interface TIKeyboardActivityController
+ (double)defaultKeyboardIdleTimeoutInterval;
+ (double)keyboardIdleTimeoutInterval;
+ (id)sharedController;
+ (id)singletonInstance;
+ (void)setKeyboardIdleTimeoutInterval:(double)a3;
+ (void)setSharedController:(id)a3;
- (BOOL)atexitHandler;
- (BOOL)canGoEarlyClean;
- (BOOL)isDirty;
- (BOOL)shouldBecomeClean;
- (BOOL)shouldBecomeDirty;
- (NSHashTable)observers;
- (NSTimer)inactivityTimer;
- (OS_os_transaction)isDirtyTransaction;
- (TIKeyboardActivityController)init;
- (TIKeyboardApplicationStateMonitor)appMonitor;
- (id)createMemoryPressureSource;
- (unint64_t)activityState;
- (void)addActivityObserver:(id)a3;
- (void)backgroundActivityAssertionsDidChange;
- (void)dealloc;
- (void)generateMemgraphsIfNeeded;
- (void)handleMemoryStatusPressure:(unint64_t)a3;
- (void)inactivityTimerFired:(id)a3;
- (void)keyboardAssertionsDidChange;
- (void)notifyMemoryPressureLevel:(unint64_t)a3 excessMemoryInBytes:(unint64_t)a4;
- (void)notifyTransitionWithContext:(id)a3;
- (void)releaseInputManagers;
- (void)removeActivityObserver:(id)a3;
- (void)setAppMonitor:(id)a3;
- (void)setInactivityTimer:(id)a3;
- (void)setIsDirty:(BOOL)a3;
- (void)setIsDirtyTransaction:(id)a3;
- (void)setKeyboardCleanIfNecessary;
- (void)setKeyboardDirtyIfNecessaryWithReason:(id)a3;
- (void)touchInactivityTimer;
- (void)updateActivityState;
@end

@implementation TIKeyboardActivityController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appMonitor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_inactivityTimer, 0);
  objc_storeStrong((id *)&self->_isDirtyTransaction, 0);

  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
}

- (void)setAppMonitor:(id)a3
{
}

- (TIKeyboardApplicationStateMonitor)appMonitor
{
  return self->_appMonitor;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setInactivityTimer:(id)a3
{
}

- (NSTimer)inactivityTimer
{
  return self->_inactivityTimer;
}

- (void)setIsDirtyTransaction:(id)a3
{
}

- (OS_os_transaction)isDirtyTransaction
{
  return self->_isDirtyTransaction;
}

- (void)setIsDirty:(BOOL)a3
{
  self->_isDirty = a3;
}

- (BOOL)isDirty
{
  return self->_isDirty;
}

- (BOOL)shouldBecomeClean
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = self->_isDirty && !self->_hadRecentActivity && !self->_hasBackgroundActivity;
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    v4 = TIOSLogFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6 = [NSString stringWithFormat:@"%s result=%d (isDirty=%d, hadRecentActivity=%d, hasBackgroundActivity=%d)", "-[TIKeyboardActivityController shouldBecomeClean]", v3, self->_isDirty, self->_hadRecentActivity, self->_hasBackgroundActivity];
      *(_DWORD *)buf = 138412290;
      v8 = v6;
      _os_log_debug_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  return v3;
}

- (BOOL)canGoEarlyClean
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[TIKeyboardAssertionManager sharedAssertionManager];
  char v4 = [v3 hasAssertions];

  if (self->_isDirty && (self->_hasBackgroundActivity ? (char v5 = 1) : (char v5 = v4), (v5 & 1) == 0))
  {
    uint64_t ExcessMemoryInBytes = getExcessMemoryInBytes();
    BOOL v8 = ExcessMemoryInBytes == 0;
    v6 = TIKeyboardActivityOSLogFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [NSString stringWithFormat:@"%s earlycleanbytes=%d (isDirty=%d, hadRecentActivity=%d, hasBackgroundActivity=%d, bytesover=%lu)", "-[TIKeyboardActivityController canGoEarlyClean]", ExcessMemoryInBytes == 0, self->_isDirty, self->_hadRecentActivity, self->_hasBackgroundActivity, ExcessMemoryInBytes];
      *(_DWORD *)buf = 138412290;
      v13 = v11;
      _os_log_impl(&dword_1E3F0E000, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }
  else
  {
    v6 = TIKeyboardActivityOSLogFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [NSString stringWithFormat:@"%s earlyclean=%d (isDirty=%d, hadRecentActivity=%d, hasBackgroundActivity=%d)", "-[TIKeyboardActivityController canGoEarlyClean]", 0, self->_isDirty, self->_hadRecentActivity, self->_hasBackgroundActivity];
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_1E3F0E000, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (void)generateMemgraphsIfNeeded
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  int v3 = [v2 isInternalInstall];

  if (v3)
  {
    uint64_t ExcessMemoryInBytes = getExcessMemoryInBytes();
    if (ExcessMemoryInBytes)
    {
      uint64_t v5 = ExcessMemoryInBytes;
      v6 = TIKeyboardActivityOSLogFacility();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v11 = [NSString stringWithFormat:@"%s kbd is still over the inactive limit: %lu, likely going down from jetsam", "-[TIKeyboardActivityController generateMemgraphsIfNeeded]", v5];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_error_impl(&dword_1E3F0E000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
      }
      v7 = (ipc_space_t *)MEMORY[0x1E4F14960];
      task_read_t v8 = *MEMORY[0x1E4F14960];
      mach_port_t corpse_task_port = 0;
      task_generate_corpse(v8, &corpse_task_port);
      uint64_t v9 = corpse_task_port;
      uint64_t v13 = 0;
      uint64_t v14 = &v13;
      uint64_t v15 = 0x2020000000;
      v10 = getReportMemoryExceptionFromTaskSymbolLoc_ptr;
      v16 = getReportMemoryExceptionFromTaskSymbolLoc_ptr;
      if (!getReportMemoryExceptionFromTaskSymbolLoc_ptr)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v18 = __getReportMemoryExceptionFromTaskSymbolLoc_block_invoke;
        v19 = &unk_1E6E2E248;
        v20 = &v13;
        __getReportMemoryExceptionFromTaskSymbolLoc_block_invoke((uint64_t)&buf);
        v10 = (void *)v14[3];
      }
      _Block_object_dispose(&v13, 8);
      if (!v10)
      {
        dlerror();
        abort_report_np();
      }
      ((void (*)(uint64_t, uint64_t, void, void, void))v10)(v9, 1, 0, 0, 0);
      mach_port_deallocate(*v7, corpse_task_port);
    }
  }
}

- (void)setKeyboardCleanIfNecessary
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([(TIKeyboardActivityController *)self shouldBecomeClean])
  {
LABEL_2:
    int v3 = TIKeyboardActivityOSLogFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      char v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s Keyboard is becoming clean.", "-[TIKeyboardActivityController setKeyboardCleanIfNecessary]");
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
    }
    self->_isDirty = 0;
    [(TIKeyboardActivityController *)self updateActivityState];
    objc_initWeak(&location, self);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__7447;
    v26 = __Block_byref_object_dispose__7448;
    id v27 = [(TIKeyboardActivityController *)self isDirtyTransaction];
    uint64_t v5 = TIKeyboardActivityOSLogFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s Setting a block to release the dirty transaction: %p", "-[TIKeyboardActivityController setKeyboardCleanIfNecessary]", *(void *)(*((void *)&buf + 1) + 40));
      *(_DWORD *)uint64_t v21 = 138412290;
      v22 = v6;
      _os_log_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEFAULT, "%@", v21, 0xCu);
    }
    [(TIKeyboardActivityController *)self setIsDirtyTransaction:0];
    dispatch_time_t v7 = dispatch_time(0, 15000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__TIKeyboardActivityController_setKeyboardCleanIfNecessary__block_invoke;
    block[3] = &unk_1E6E2B118;
    objc_copyWeak(&v19, &location);
    block[4] = &buf;
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v19);
    _Block_object_dispose(&buf, 8);

    objc_destroyWeak(&location);
    return;
  }
  if ([(TIKeyboardActivityController *)self canGoEarlyClean])
  {
    task_read_t v8 = TIKeyboardActivityOSLogFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s Keyboard is going early clean.", "-[TIKeyboardActivityController setKeyboardCleanIfNecessary]");
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1E3F0E000, v8, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
    }
    if (!self->_hadRecentActivity) {
      goto LABEL_2;
    }
    v10 = [(TIKeyboardActivityController *)self inactivityTimer];
    int v11 = [v10 isValid];

    if (v11)
    {
      v12 = [(TIKeyboardActivityController *)self inactivityTimer];
      [v12 invalidate];

      uint64_t v13 = TIKeyboardActivityOSLogFacility();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s Keyboard is going clean in 10 seconds.", "-[TIKeyboardActivityController setKeyboardCleanIfNecessary]");
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v14;
        _os_log_impl(&dword_1E3F0E000, v13, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
      }
      uint64_t v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:10.0];
      v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CB00]) initWithFireDate:v15 interval:self target:sel_inactivityTimerFired_ selector:0 userInfo:0 repeats:0.0];
      v17 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      [v17 addTimer:v16 forMode:*MEMORY[0x1E4F1C3A0]];

      [(TIKeyboardActivityController *)self setInactivityTimer:v16];
    }
    else
    {
      self->_hadRecentActivity = 0;
    }
    [(TIKeyboardActivityController *)self updateActivityState];
  }
  else
  {
    [(TIKeyboardActivityController *)self updateActivityState];
  }
}

void __59__TIKeyboardActivityController_setKeyboardCleanIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained generateMemgraphsIfNeeded];
  int v3 = TIKeyboardActivityOSLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = NSString;
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v6 = [WeakRetained isDirtyTransaction];
    dispatch_time_t v7 = [v4 stringWithFormat:@"%s Keyboard is releasing the placeholder transaction %p, current: %p", "-[TIKeyboardActivityController setKeyboardCleanIfNecessary]_block_invoke", v5, v6];
    *(_DWORD *)long long buf = 138412290;
    int v11 = v7;
    _os_log_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

- (BOOL)shouldBecomeDirty
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_isDirty) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = self->_hadRecentActivity || self->_hasBackgroundActivity;
  }
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    char v4 = TIOSLogFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6 = [NSString stringWithFormat:@"%s result=%d (isDirty=%d, hadRecentActivity=%d, hasBackgroundActivity=%d)", "-[TIKeyboardActivityController shouldBecomeDirty]", v3, self->_isDirty, self->_hadRecentActivity, self->_hasBackgroundActivity];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v8 = v6;
      _os_log_debug_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  return v3;
}

- (void)setKeyboardDirtyIfNecessaryWithReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(TIKeyboardActivityController *)self shouldBecomeDirty])
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel)
    {
      uint64_t v5 = TIOSLogFacility();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s Keyboard is becoming dirty.", "-[TIKeyboardActivityController setKeyboardDirtyIfNecessaryWithReason:]");
        *(_DWORD *)long long buf = 138412290;
        v10 = v8;
        _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"%s.%s", "com.apple.TextInput.kbd.isDirty", objc_msgSend(v4, "UTF8String"));
    id v6 = objc_claimAutoreleasedReturnValue();
    [v6 UTF8String];
    dispatch_time_t v7 = (void *)os_transaction_create();
    [(TIKeyboardActivityController *)self setIsDirtyTransaction:v7];

    self->_isDirty = 1;
    [(TIKeyboardActivityController *)self updateActivityState];
  }
  else
  {
    [(TIKeyboardActivityController *)self updateActivityState];
  }
}

- (void)inactivityTimerFired:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel)
  {
    id v4 = TIOSLogFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s Keyboard inactivity timer fired.", "-[TIKeyboardActivityController inactivityTimerFired:]");
      *(_DWORD *)long long buf = 138412290;
      dispatch_time_t v7 = v5;
      _os_log_debug_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  self->_hadRecentActivity = 0;
  [(TIKeyboardActivityController *)self setKeyboardCleanIfNecessary];
}

- (void)touchInactivityTimer
{
  BOOL v3 = [(TIKeyboardActivityController *)self inactivityTimer];
  char v4 = [v3 isValid];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1C9C8];
    +[TIKeyboardActivityController keyboardIdleTimeoutInterval];
    objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB00]) initWithFireDate:v8 interval:self target:sel_inactivityTimerFired_ selector:0 userInfo:0 repeats:0.0];
    dispatch_time_t v7 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v7 addTimer:v6 forMode:*MEMORY[0x1E4F1C3A0]];

    [(TIKeyboardActivityController *)self setInactivityTimer:v6];
  }
}

- (void)backgroundActivityAssertionsDidChange
{
  BOOL v3 = +[TIKeyboardAssertionManager sharedAssertionManager];
  self->_hasBackgroundActivity = [v3 hasBackgroundActivityAssertions];

  if (self->_hasBackgroundActivity)
  {
    [(TIKeyboardActivityController *)self setKeyboardDirtyIfNecessaryWithReason:@"backgroundActivityAssertionsDidChange"];
  }
  else
  {
    [(TIKeyboardActivityController *)self setKeyboardCleanIfNecessary];
  }
}

- (void)keyboardAssertionsDidChange
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[TIKeyboardAssertionManager sharedAssertionManager];
  int v4 = [v3 hasAssertions];

  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (v4)
  {
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      uint64_t v5 = TIOSLogFacility();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s Invalidating inactivity timer", "-[TIKeyboardActivityController keyboardAssertionsDidChange]");
        *(_DWORD *)long long buf = 138412290;
        uint64_t v11 = v8;
        _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    id v6 = [(TIKeyboardActivityController *)self inactivityTimer];
    [v6 invalidate];

    self->_hadRecentActivity = 1;
    [(TIKeyboardActivityController *)self setKeyboardDirtyIfNecessaryWithReason:@"keyboardAssertionsDidChange"];
  }
  else
  {
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      dispatch_time_t v7 = TIOSLogFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s Setting inactivity timer", "-[TIKeyboardActivityController keyboardAssertionsDidChange]");
        *(_DWORD *)long long buf = 138412290;
        uint64_t v11 = v9;
        _os_log_debug_impl(&dword_1E3F0E000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    [(TIKeyboardActivityController *)self touchInactivityTimer];
    [(TIKeyboardActivityController *)self updateActivityState];
    [(TIKeyboardActivityController *)self setKeyboardCleanIfNecessary];
  }
}

- (BOOL)atexitHandler
{
  return [(TIKeyboardApplicationStateMonitor *)self->_appMonitor flushPendingChangesToDisk];
}

- (void)releaseInputManagers
{
  uint64_t ExcessMemoryInBytes = getExcessMemoryInBytes();

  [(TIKeyboardActivityController *)self notifyMemoryPressureLevel:3 excessMemoryInBytes:ExcessMemoryInBytes];
}

- (void)updateActivityState
{
  unint64_t activityState = self->_activityState;
  id v6 = +[TIKeyboardAssertionManager sharedAssertionManager];
  if ([v6 hasAssertions])
  {
    unint64_t v4 = 1;
  }
  else if (self->_hadRecentActivity)
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 3;
  }
  self->_unint64_t activityState = v4;
  if (activityState != v4)
  {
    self->_inactiveMemoryPressureCount = 0;
    uint64_t v5 = +[TIKeyboardActivityContext contextFromState:toState:](TIKeyboardActivityContext, "contextFromState:toState:", activityState);
    [v5 setExcessMemoryInBytes:getExcessMemoryInBytes()];
    [(TIKeyboardActivityController *)self notifyTransitionWithContext:v5];
  }
}

- (unint64_t)activityState
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__TIKeyboardActivityController_activityState__block_invoke;
  aBlock[3] = &unk_1E6E2E130;
  aBlock[4] = self;
  aBlock[5] = &v7;
  v2 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v2[2](v2);
  }
  else
  {
    uint64_t v5 = v2;
    TIDispatchSync();
  }
  unint64_t v3 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __45__TIKeyboardActivityController_activityState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 16);
  return result;
}

uint64_t __45__TIKeyboardActivityController_activityState__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleMemoryStatusPressure:(unint64_t)a3
{
  char v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[TIKeyboardActivityController sharedController];
  if ([v5 activityState] != 3)
  {
    uint64_t v13 = TIKeyboardActivityOSLogFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [NSString stringWithFormat:@"%s Keyboard is not in hibernating state, ignoring", "-[TIKeyboardActivityController handleMemoryStatusPressure:]"];
      *(_DWORD *)long long buf = 138412290;
      v16 = v14;
LABEL_13:
      _os_log_impl(&dword_1E3F0E000, v13, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
LABEL_14:

    goto LABEL_15;
  }
  if ((v3 & 6) == 0) {
    goto LABEL_15;
  }
  ++self->_inactiveMemoryPressureCount;
  id v6 = TIKeyboardActivityOSLogFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s Received inactive memory pressure warning (count=%ld)", "-[TIKeyboardActivityController handleMemoryStatusPressure:]", self->_inactiveMemoryPressureCount);
    *(_DWORD *)long long buf = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1E3F0E000, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  unint64_t v8 = self->_inactiveMemoryPressureCount - 1;
  if (v8 >= 3)
  {
    uint64_t v13 = TIKeyboardActivityOSLogFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s Too many inactive memory pressure warnings -- Ignoring", "-[TIKeyboardActivityController handleMemoryStatusPressure:]");
      *(_DWORD *)long long buf = 138412290;
      v16 = v14;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  uint64_t v9 = qword_1E41559B8[v8];
  uint64_t ExcessMemoryInBytes = getExcessMemoryInBytes();
  uint64_t v11 = TIKeyboardActivityOSLogFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s Notifying memory pressure level %lu", "-[TIKeyboardActivityController handleMemoryStatusPressure:]", v9);
    *(_DWORD *)long long buf = 138412290;
    v16 = v12;
    _os_log_impl(&dword_1E3F0E000, v11, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  [(TIKeyboardActivityController *)self notifyMemoryPressureLevel:v9 excessMemoryInBytes:ExcessMemoryInBytes];
LABEL_15:
}

- (id)createMemoryPressureSource
{
  dispatch_source_t v2 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 6uLL, MEMORY[0x1E4F14428]);
  dispatch_source_t v3 = v2;
  if (v2)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __58__TIKeyboardActivityController_createMemoryPressureSource__block_invoke;
    handler[3] = &unk_1E6E2DE00;
    unint64_t v4 = v2;
    uint64_t v7 = v4;
    dispatch_source_set_event_handler(v4, handler);
    dispatch_resume(v4);
  }

  return v3;
}

void __58__TIKeyboardActivityController_createMemoryPressureSource__block_invoke(uint64_t a1)
{
  uintptr_t data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  id v2 = +[TIKeyboardActivityController sharedController];
  [v2 handleMemoryStatusPressure:data];
}

- (void)notifyMemoryPressureLevel:(unint64_t)a3 excessMemoryInBytes:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = TIKeyboardActivityOSLogFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s Notifying observers of memory pressure level %u (above the limit by %u bytes)", "-[TIKeyboardActivityController notifyMemoryPressureLevel:excessMemoryInBytes:]", a3, a4);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1E3F0E000, v7, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__7447;
  v25 = __Block_byref_object_dispose__7448;
  id v26 = (id)os_transaction_create();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [(TIKeyboardActivityController *)self observers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          [v14 handleMemoryPressureLevel:a3 excessMemoryInBytes:a4];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  dispatch_time_t v15 = dispatch_time(0, 10000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__TIKeyboardActivityController_notifyMemoryPressureLevel_excessMemoryInBytes___block_invoke;
  block[3] = &unk_1E6E2E248;
  block[4] = &buf;
  dispatch_after(v15, MEMORY[0x1E4F14428], block);
  _Block_object_dispose(&buf, 8);
}

void __78__TIKeyboardActivityController_notifyMemoryPressureLevel_excessMemoryInBytes___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)notifyTransitionWithContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = TIKeyboardActivityOSLogFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s Notifying observers of activity state transition from %u to %u", "-[TIKeyboardActivityController notifyTransitionWithContext:]", objc_msgSend(v4, "fromState"), objc_msgSend(v4, "toState"));
    *(_DWORD *)long long buf = 138412290;
    long long v18 = v6;
    _os_log_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = [(TIKeyboardActivityController *)self observers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) keyboardActivityDidTransition:v4];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)removeActivityObserver:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    uint64_t v5 = TIOSLogFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = NSString;
      uint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      uint64_t v11 = [v8 stringWithFormat:@"%s Removing observer <%@: %p>", "-[TIKeyboardActivityController removeActivityObserver:]", v4, v10];
      *(_DWORD *)long long buf = 138412290;
      long long v15 = v11;
      _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__TIKeyboardActivityController_removeActivityObserver___block_invoke;
  aBlock[3] = &unk_1E6E2E220;
  aBlock[4] = self;
  id v6 = v4;
  id v13 = v6;
  uint64_t v7 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v7[2](v7);
  }
  else {
    TIDispatchSync();
  }
}

void __55__TIKeyboardActivityController_removeActivityObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)addActivityObserver:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    uint64_t v5 = TIOSLogFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = NSString;
      uint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      uint64_t v11 = [v8 stringWithFormat:@"%s Adding observer <%@: %p>", "-[TIKeyboardActivityController addActivityObserver:]", v4, v10];
      *(_DWORD *)long long buf = 138412290;
      long long v15 = v11;
      _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__TIKeyboardActivityController_addActivityObserver___block_invoke;
  aBlock[3] = &unk_1E6E2E220;
  aBlock[4] = self;
  id v6 = v4;
  id v13 = v6;
  uint64_t v7 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v7[2](v7);
  }
  else {
    TIDispatchSync();
  }
}

void __52__TIKeyboardActivityController_addActivityObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  [(NSTimer *)self->_inactivityTimer invalidate];
  dispatch_source_t v3 = +[TIKeyboardAssertionManager sharedAssertionManager];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardActivityController;
  [(TIKeyboardActivityController *)&v4 dealloc];
}

- (TIKeyboardActivityController)init
{
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardActivityController;
  id v2 = [(TIKeyboardActivityController *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    uint64_t v5 = [(TIKeyboardActivityController *)v2 createMemoryPressureSource];
    memoryPressureSource = v2->_memoryPressureSource;
    v2->_memoryPressureSource = (OS_dispatch_source *)v5;

    v2->_unint64_t activityState = 0;
    uint64_t v7 = +[TIKeyboardAssertionManager sharedAssertionManager];
    [v7 setDelegate:v2];
    isDirtyTransaction = v2->_isDirtyTransaction;
    v2->_isDirtyTransaction = 0;

    [(TIKeyboardActivityController *)v2 updateActivityState];
  }
  return v2;
}

+ (double)defaultKeyboardIdleTimeoutInterval
{
  if (defaultKeyboardIdleTimeoutInterval_onceToken != -1) {
    dispatch_once(&defaultKeyboardIdleTimeoutInterval_onceToken, &__block_literal_global_61);
  }
  return *(double *)&defaultKeyboardIdleTimeoutInterval_defaultIdleTimeout;
}

void __66__TIKeyboardActivityController_defaultKeyboardIdleTimeoutInterval__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  defaultKeyboardIdleTimeoutInterval_defaultIdleTimeout = 0x4064A00000000000;
  if (TI_IS_INTERNAL_INSTALL::once_token != -1) {
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3708);
  }
  if (TI_IS_INTERNAL_INSTALL::is_internal_install)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"idleTimeout", @"com.apple.keyboard", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      CFIndex v1 = AppIntegerValue;
      if ((AppIntegerValue & 0x8000000000000000) == 0)
      {
        *(double *)&defaultKeyboardIdleTimeoutInterval_defaultIdleTimeout = (double)AppIntegerValue;
        if (TICanLogMessageAtLevel_onceToken != -1) {
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
        }
        if (TICanLogMessageAtLevel_logLevel >= 2)
        {
          id v2 = TIOSLogFacility();
          if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s Setting keyboard idle timeout to %ld seconds", "+[TIKeyboardActivityController defaultKeyboardIdleTimeoutInterval]_block_invoke", v1);
            *(_DWORD *)long long buf = 138412290;
            id v6 = v3;
            _os_log_debug_impl(&dword_1E3F0E000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
    }
  }
}

+ (double)keyboardIdleTimeoutInterval
{
  if (__hasTestingIdleTimeout) {
    return *(double *)&__testingIdleTimeout;
  }
  +[TIKeyboardActivityController defaultKeyboardIdleTimeoutInterval];
  return result;
}

+ (id)singletonInstance
{
  if (singletonInstance_onceToken_7546 != -1) {
    dispatch_once(&singletonInstance_onceToken_7546, &__block_literal_global_7547);
  }
  id v2 = (void *)singletonInstance_singletonInstance_7548;

  return v2;
}

uint64_t __49__TIKeyboardActivityController_singletonInstance__block_invoke()
{
  v0 = objc_alloc_init(TIKeyboardActivityController);
  CFIndex v1 = (void *)singletonInstance_singletonInstance_7548;
  singletonInstance_singletonInstance_7548 = (uint64_t)v0;

  return atexit_b(&__block_literal_global_24);
}

void __49__TIKeyboardActivityController_singletonInstance__block_invoke_2()
{
  id v0 = +[TIKeyboardActivityController sharedController];
  [v0 atexitHandler];
}

+ (id)sharedController
{
  if (__testingInstance_7550)
  {
    id v2 = (id)__testingInstance_7550;
  }
  else
  {
    id v2 = +[TIKeyboardActivityController singletonInstance];
  }

  return v2;
}

+ (void)setKeyboardIdleTimeoutInterval:(double)a3
{
  __testingIdleTimeout = *(void *)&a3;
  __hasTestingIdleTimeout = 1;
}

+ (void)setSharedController:(id)a3
{
  id v4 = a3;
  if ((id)__testingInstance_7550 != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)&__testingInstance_7550, a3);
    id v4 = v5;
  }
}

@end