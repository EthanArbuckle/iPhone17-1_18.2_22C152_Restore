@interface PXUndoActionsInvalidator
- (BOOL)applicationIsActive;
- (BOOL)isObservingApplicationState;
- (BOOL)timerDidClearUndoStack;
- (NSTimer)undoClearingTimer;
- (NSUndoManager)undoManager;
- (PXContentPrivacyController)privacyController;
- (PXUndoActionsInvalidator)initWithUndoManager:(id)a3 privacyController:(id)a4;
- (void)beginObservingSystemEventsForAutomaticInvalidation;
- (void)clearUndoClearingTimer;
- (void)clearUndoStack;
- (void)dealloc;
- (void)invalidateUndoTimerIfNeeded;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setApplicationIsActive:(BOOL)a3;
- (void)setObservingApplicationState:(BOOL)a3;
- (void)setPrivacyController:(id)a3;
- (void)setTimerDidClearUndoStack:(BOOL)a3;
- (void)setUndoClearingTimer:(id)a3;
- (void)setUndoManager:(id)a3;
- (void)startUndoClearingTimer;
- (void)stopObservingSystemEventsForAutomaticInvalidation;
- (void)undoClearingTimerFired;
@end

@implementation PXUndoActionsInvalidator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoClearingTimer, 0);
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
}

- (void)setTimerDidClearUndoStack:(BOOL)a3
{
  self->_timerDidClearUndoStack = a3;
}

- (BOOL)timerDidClearUndoStack
{
  return self->_timerDidClearUndoStack;
}

- (void)setUndoClearingTimer:(id)a3
{
}

- (NSTimer)undoClearingTimer
{
  return self->_undoClearingTimer;
}

- (void)setApplicationIsActive:(BOOL)a3
{
  self->_applicationIsActive = a3;
}

- (BOOL)applicationIsActive
{
  return self->_applicationIsActive;
}

- (void)setObservingApplicationState:(BOOL)a3
{
  self->_observingApplicationState = a3;
}

- (BOOL)isObservingApplicationState
{
  return self->_observingApplicationState;
}

- (void)setPrivacyController:(id)a3
{
}

- (PXContentPrivacyController)privacyController
{
  return self->_privacyController;
}

- (void)setUndoManager:(id)a3
{
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)ApplicationStateObservationContext == a5) {
    px_dispatch_on_main_queue();
  }
}

void __57__PXUndoActionsInvalidator_observable_didChange_context___block_invoke(uint64_t a1)
{
  *(void *)&v14[5] = *MEMORY[0x1E4F143B8];
  v2 = +[PXApplicationState sharedState];
  unint64_t v3 = [v2 visibilityState];

  v4 = PLUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = PXApplicationVisibilityStateDescription(v3);
    *(_DWORD *)buf = 138412290;
    *(void *)v14 = v5;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "[UndoActionsInvalidator] Application visibility state is: %@", buf, 0xCu);
  }
  char v6 = (v3 == 1) ^ [*(id *)(a1 + 32) applicationIsActive];
  v7 = PLUIGetLog();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [*(id *)(a1 + 32) applicationIsActive];
      *(_DWORD *)buf = 67109376;
      v14[0] = v9;
      LOWORD(v14[1]) = 1024;
      *(_DWORD *)((char *)&v14[1] + 2) = v3 == 1;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "[UndoActionsInvalidator] Application changed from being active/visible: %{BOOL}d to %{BOOL}d", buf, 0xEu);
    }

    [*(id *)(a1 + 32) setApplicationIsActive:v3 == 1];
    v10 = *(void **)(a1 + 32);
    if (v3 == 1)
    {
      if ([v10 isObservingApplicationState])
      {
        dispatch_time_t v11 = dispatch_time(0, 500000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __57__PXUndoActionsInvalidator_observable_didChange_context___block_invoke_196;
        block[3] = &unk_1E5DD36F8;
        block[4] = *(void *)(a1 + 32);
        dispatch_after(v11, MEMORY[0x1E4F14428], block);
      }
    }
    else
    {
      [v10 startUndoClearingTimer];
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      v14[0] = v3 == 1;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "[UndoActionsInvalidator] Skipping visibilityState update because whether the application is active/visible (%{BOOL}d) has not changed.", buf, 8u);
    }
  }
}

void __57__PXUndoActionsInvalidator_observable_didChange_context___block_invoke_196(uint64_t a1)
{
  v2 = +[PXApplicationState sharedState];
  uint64_t v3 = [v2 visibilityState];

  if (v3 == 1)
  {
    v4 = *(void **)(a1 + 32);
    [v4 invalidateUndoTimerIfNeeded];
  }
}

- (void)clearUndoStack
{
  uint64_t v3 = PLUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "[UndoActionsInvalidator] Clearing undo stack", v5, 2u);
  }

  v4 = [(PXUndoActionsInvalidator *)self undoManager];
  [v4 removeAllActions];
}

- (void)invalidateUndoTimerIfNeeded
{
  if (![(PXUndoActionsInvalidator *)self timerDidClearUndoStack])
  {
    uint64_t v3 = PLUIGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "[UndoActionsInvalidator] Timer not fired yet, clearing timer.", v4, 2u);
    }

    [(PXUndoActionsInvalidator *)self clearUndoClearingTimer];
  }
}

- (void)undoClearingTimerFired
{
  uint64_t v3 = PLUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "[UndoActionsInvalidator] Undo clearing timer did fire.", v10, 2u);
  }

  v4 = [(PXUndoActionsInvalidator *)self privacyController];

  if (v4)
  {
    v5 = [(PXUndoActionsInvalidator *)self privacyController];
    char v6 = [v5 isContentPrivacyEnabled];

    char v7 = v6 ^ 1;
  }
  else
  {
    char v7 = 0;
  }
  v8 = +[PXApplicationSettings sharedInstance];
  int v9 = [v8 shouldClearUndoStackAutomatically];

  if ((v7 & 1) == 0 && v9)
  {
    [(PXUndoActionsInvalidator *)self setTimerDidClearUndoStack:1];
    [(PXUndoActionsInvalidator *)self clearUndoStack];
  }
  [(PXUndoActionsInvalidator *)self clearUndoClearingTimer];
}

- (void)startUndoClearingTimer
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "[UndoActionsInvalidator] Starting undo timer", (uint8_t *)&v12, 2u);
  }

  v4 = [(PXUndoActionsInvalidator *)self undoClearingTimer];
  int v5 = [v4 isValid];

  if (v5) {
    [(PXUndoActionsInvalidator *)self clearUndoClearingTimer];
  }
  [(PXUndoActionsInvalidator *)self setTimerDidClearUndoStack:0];
  char v6 = +[PXApplicationSettings sharedInstance];
  [v6 backgroundThresholdDurationForUndoActionsInvalidation];
  double v8 = v7;

  int v9 = PLUIGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    double v13 = v8;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEBUG, "[UndoActionsInvalidator] Max backgrounding threshold set for %.0f seconds", (uint8_t *)&v12, 0xCu);
  }

  v10 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_undoClearingTimerFired selector:0 userInfo:0 repeats:v8];
  [(PXUndoActionsInvalidator *)self setUndoClearingTimer:v10];

  dispatch_time_t v11 = [(PXUndoActionsInvalidator *)self undoClearingTimer];
  [v11 setTolerance:0.0];
}

- (void)clearUndoClearingTimer
{
  uint64_t v3 = [(PXUndoActionsInvalidator *)self undoClearingTimer];
  [v3 invalidate];

  [(PXUndoActionsInvalidator *)self setUndoClearingTimer:0];
}

- (void)stopObservingSystemEventsForAutomaticInvalidation
{
  if ([(PXUndoActionsInvalidator *)self isObservingApplicationState])
  {
    uint64_t v3 = +[PXApplicationState sharedState];
    [v3 unregisterChangeObserver:self context:ApplicationStateObservationContext];

    [(PXUndoActionsInvalidator *)self setObservingApplicationState:0];
  }
}

- (void)beginObservingSystemEventsForAutomaticInvalidation
{
  if (![(PXUndoActionsInvalidator *)self isObservingApplicationState])
  {
    uint64_t v3 = +[PXApplicationState sharedState];
    [v3 registerChangeObserver:self context:ApplicationStateObservationContext];

    v4 = +[PXApplicationState sharedState];
    -[PXUndoActionsInvalidator setApplicationIsActive:](self, "setApplicationIsActive:", [v4 visibilityState] == 1);

    [(PXUndoActionsInvalidator *)self setObservingApplicationState:1];
  }
}

- (void)dealloc
{
  [(PXUndoActionsInvalidator *)self stopObservingSystemEventsForAutomaticInvalidation];
  v3.receiver = self;
  v3.super_class = (Class)PXUndoActionsInvalidator;
  [(PXUndoActionsInvalidator *)&v3 dealloc];
}

- (PXUndoActionsInvalidator)initWithUndoManager:(id)a3 privacyController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXUndoActionsInvalidator;
  int v9 = [(PXUndoActionsInvalidator *)&v13 init];
  if (v9)
  {
    v10 = PLUIGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v12 = 0;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "[UndoActionsInvalidator] Initializing", v12, 2u);
    }

    objc_storeStrong((id *)&v9->_undoManager, a3);
    objc_storeStrong((id *)&v9->_privacyController, a4);
  }

  return v9;
}

@end