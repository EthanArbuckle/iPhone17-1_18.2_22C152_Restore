@interface _UIFocusUpdateThrottle
- (_UIFocusUpdateThrottle)initWithUpdateHandler:(id)a3;
- (void)_performScheduledUpdate;
- (void)didCreateProgrammaticFocusUpdateContext:(id)a3;
- (void)reset;
- (void)scheduleProgrammaticFocusUpdate;
- (void)teardown;
@end

@implementation _UIFocusUpdateThrottle

- (_UIFocusUpdateThrottle)initWithUpdateHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_UIFocusUpdateThrottle.m", 39, @"Invalid parameter not satisfying: %@", @"updateHandler" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)_UIFocusUpdateThrottle;
  v6 = [(_UIFocusUpdateThrottle *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_currentTimeout = 0.0166666667;
    v8 = _Block_copy(v5);
    id updateHandler = v7->_updateHandler;
    v7->_id updateHandler = v8;
  }
  return v7;
}

- (void)teardown
{
  p_updateTimer = &self->_updateTimer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateTimer);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_updateTimer);
    [v5 invalidate];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __34___UIFocusUpdateThrottle_teardown__block_invoke;
    v6[3] = &unk_1E52D9F70;
    v6[4] = self;
    [(id)UIApp _performBlockAfterCATransactionCommits:v6];
  }
}

- (void)scheduleProgrammaticFocusUpdate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_updateIsScheduled)
  {
    self->_updateIsScheduled = 1;
    double lastUpdate = self->_lastUpdate;
    double currentTimeout = self->_currentTimeout;
    double Current = CFAbsoluteTimeGetCurrent();
    if (self->_nilUpdateCount && (double v6 = lastUpdate + currentTimeout - Current, v6 >= 0.0166666667))
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", scheduleProgrammaticFocusUpdate___s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v11 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          double v14 = v6;
          _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Delaying focus update for %.2g seconds due to too many failed focus updates.", buf, 0xCu);
        }
      }
      v8 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__performScheduledUpdate selector:0 userInfo:0 repeats:v6];
      p_updateTimer = &self->_updateTimer;
      objc_storeWeak((id *)p_updateTimer, v8);

      id WeakRetained = objc_loadWeakRetained((id *)p_updateTimer);
      [WeakRetained setTolerance:0.0166666667];
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __57___UIFocusUpdateThrottle_scheduleProgrammaticFocusUpdate__block_invoke;
      v12[3] = &unk_1E52D9F70;
      v12[4] = self;
      [(id)UIApp _performBlockAfterCATransactionCommits:v12];
    }
  }
}

- (void)didCreateProgrammaticFocusUpdateContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_double lastUpdate = CFAbsoluteTimeGetCurrent();
  id v5 = [v4 nextFocusedItem];

  if (v5)
  {
    self->_unint64_t nilUpdateCount = 0;
    self->_double currentTimeout = 0.0166666667;
  }
  else
  {
    ++self->_nilUpdateCount;
    double currentTimeout = self->_currentTimeout;
    if (currentTimeout < 1.0)
    {
      self->_double currentTimeout = fmin(currentTimeout * 1.3, 1.0);
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &didCreateProgrammaticFocusUpdateContext____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v8 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          double v9 = self->_currentTimeout;
          unint64_t nilUpdateCount = self->_nilUpdateCount;
          int v11 = 134218240;
          double v12 = v9;
          __int16 v13 = 2048;
          unint64_t v14 = nilUpdateCount;
          _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Encountered a programmatic focus update to a nil environment. Increasing cooldown period for programmatic focus updates to %.2g due to %lu failed focus updates.", (uint8_t *)&v11, 0x16u);
        }
      }
    }
  }
}

- (void)_performScheduledUpdate
{
  if (self->_updateIsScheduled)
  {
    self->_updateIsScheduled = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_updateTimer);
    [WeakRetained invalidate];

    id v4 = (void (*)(void))*((void *)self->_updateHandler + 2);
    v4();
  }
}

- (void)reset
{
  self->_unint64_t nilUpdateCount = 0;
  self->_double currentTimeout = 0.0166666667;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __31___UIFocusUpdateThrottle_reset__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  [(id)UIApp _performBlockAfterCATransactionCommits:v2];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_destroyWeak((id *)&self->_updateTimer);
}

@end