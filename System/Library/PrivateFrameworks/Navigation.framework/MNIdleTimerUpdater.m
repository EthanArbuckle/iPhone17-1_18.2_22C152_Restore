@interface MNIdleTimerUpdater
- (BOOL)_shouldEnableIdleTimerForArrivalState:(int64_t)a3;
- (MNIdleTimerUpdaterDelegate)delegate;
- (MNNavigationSessionState)navigationSessionState;
- (void)_updateForLocation:(id)a3;
- (void)_updateShouldEnableIdleTimer:(BOOL)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setNavigationSessionState:(id)a3;
- (void)updateForStartNavigation;
@end

@implementation MNIdleTimerUpdater

- (void)dealloc
{
  [(NSTimer *)self->_notMovingTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MNIdleTimerUpdater;
  [(MNIdleTimerUpdater *)&v3 dealloc];
}

- (void)setNavigationSessionState:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 location];
  int v6 = -[MNIdleTimerUpdater _shouldEnableIdleTimerForArrivalState:](self, "_shouldEnableIdleTimerForArrivalState:", [v4 arrivalState]);
  v7 = [(MNNavigationSessionState *)self->_navigationSessionState location];

  int v8 = [(MNIdleTimerUpdater *)self _shouldEnableIdleTimerForArrivalState:[(MNNavigationSessionState *)self->_navigationSessionState arrivalState]];
  v9 = (MNNavigationSessionState *)[v4 copy];

  navigationSessionState = self->_navigationSessionState;
  self->_navigationSessionState = v9;

  self->_BOOL isArrived = v6;
  if (v6 != v8)
  {
    v11 = MNGetMNIdleTimerUpdaterLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL isArrived = self->_isArrived;
      v15[0] = 67109120;
      v15[1] = isArrived;
      _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEFAULT, "isArrived changed: %d", (uint8_t *)v15, 8u);
    }

    if (!self->_isArrived)
    {
      v13 = MNGetMNIdleTimerUpdaterLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15[0]) = 0;
        _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_DEFAULT, "Left arrival state. Cancelling timers and setting shouldEnableIdleTimer to NO.", (uint8_t *)v15, 2u);
      }

      [(NSTimer *)self->_notMovingTimer invalidate];
      notMovingTimer = self->_notMovingTimer;
      self->_notMovingTimer = 0;

      [(MNIdleTimerUpdater *)self _updateShouldEnableIdleTimer:0];
    }
  }
  if (v5 != v7) {
    [(MNIdleTimerUpdater *)self _updateForLocation:v5];
  }
}

- (void)updateForStartNavigation
{
  *(_WORD *)&self->_isStarted = 1;
  self->_shouldEnableIdleTimer = 0;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 idleTimerUpdater:self shouldEnableIdleTimer:0];
  }
}

- (void)_updateShouldEnableIdleTimer:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_shouldEnableIdleTimer != a3)
  {
    BOOL v3 = a3;
    char v5 = MNGetMNIdleTimerUpdaterLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEFAULT, "Setting shouldEnableIdleTimer to %d.", (uint8_t *)v9, 8u);
    }

    self->_shouldEnableIdleTimer = v3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 idleTimerUpdater:self shouldEnableIdleTimer:v3];
    }
  }
}

- (void)_updateForLocation:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (self->_isStarted && v4 && self->_isArrived)
  {
    [v4 speed];
    notMovingTimer = self->_notMovingTimer;
    if (v7 <= 0.0)
    {
      if (!notMovingTimer)
      {
        GEOConfigGetDouble();
        v11 = v10;
        v12 = MNGetMNIdleTimerUpdaterLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_DEFAULT, "Location stopped in arrival state. Starting timer.", (uint8_t *)buf, 2u);
        }

        objc_initWeak(buf, self);
        v13 = (void *)MEMORY[0x1E4F1CB00];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __41__MNIdleTimerUpdater__updateForLocation___block_invoke;
        v16[3] = &unk_1E60F6558;
        v17[1] = v11;
        objc_copyWeak(v17, buf);
        v14 = [v13 scheduledTimerWithTimeInterval:0 repeats:v16 block:*(double *)&v11];
        v15 = self->_notMovingTimer;
        self->_notMovingTimer = v14;

        objc_destroyWeak(v17);
        objc_destroyWeak(buf);
      }
    }
    else if (notMovingTimer)
    {
      id v8 = MNGetMNIdleTimerUpdaterLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_DEFAULT, "Cancelling notMovingTimer because locations are moving again.", (uint8_t *)buf, 2u);
      }

      [(NSTimer *)self->_notMovingTimer invalidate];
      v9 = self->_notMovingTimer;
      self->_notMovingTimer = 0;
    }
  }
}

void __41__MNIdleTimerUpdater__updateForLocation___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = MNGetMNIdleTimerUpdaterLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v6 = 134217984;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_DEFAULT, "In arrival state and locations stopped for %g seconds. Triggering shouldEnableIdleTimer.", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v5 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[8] = 0;
    [WeakRetained _updateShouldEnableIdleTimer:1];
  }
}

- (BOOL)_shouldEnableIdleTimerForArrivalState:(int64_t)a3
{
  return a3 == 4;
}

- (MNIdleTimerUpdaterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNIdleTimerUpdaterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MNNavigationSessionState)navigationSessionState
{
  return self->_navigationSessionState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationSessionState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notMovingTimer, 0);
}

@end