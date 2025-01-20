@interface MNSequence
- (MNSequence)initWithQueue:(id)a3;
- (void)_endSequence;
- (void)_finalizeSequenceWithPreviousStepResult:(id)a3;
- (void)_runNextStepWithPreviousStepResult:(id)a3;
- (void)addStep:(id)a3;
- (void)dealloc;
- (void)setSequenceFinalizeHandler:(id)a3;
- (void)start;
@end

@implementation MNSequence

- (MNSequence)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MNSequence;
  v6 = [(MNSequence *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = geo_isolater_create();
    stepsIsolater = v7->_stepsIsolater;
    v7->_stepsIsolater = (geo_isolater *)v8;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_isStarted)
  {
    v3 = MNGetMNSequenceLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v7 = self;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_ERROR, "%p MNSequence was deallocated without ever being started. Did you forget to call start?", buf, 0xCu);
    }

    v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v7 = (MNSequence *)"-[MNSequence dealloc]";
      __int16 v8 = 2080;
      v9 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/MNSequence.m";
      __int16 v10 = 1024;
      int v11 = 44;
      __int16 v12 = 2080;
      v13 = "NO";
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)MNSequence;
  [(MNSequence *)&v5 dealloc];
}

- (void)addStep:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = v4;
  if (self->_isStarted)
  {
    v6 = [NSString stringWithFormat:@"Cannot add steps to MNSequence after it has already started."];
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v13 = 136316162;
      *(void *)&v13[4] = "-[MNSequence addStep:]";
      __int16 v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/MNSequence.m";
      __int16 v16 = 1024;
      int v17 = 51;
      __int16 v18 = 2080;
      v19 = "NO";
      __int16 v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", v13, 0x30u);
    }
  }
  else if (v4)
  {
    *(void *)v13 = self->_stepsIsolater;
    _geo_isolate_lock();
    steps = self->_steps;
    if (!steps)
    {
      objc_msgSend(MEMORY[0x1E4F1CA48], "array", *(void *)v13);
      v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      __int16 v10 = self->_steps;
      self->_steps = v9;

      steps = self->_steps;
    }
    int v11 = objc_msgSend(v5, "copy", *(void *)v13);
    __int16 v12 = (void *)MEMORY[0x1BA99B3A0]();
    [(NSMutableArray *)steps addObject:v12];

    _geo_isolate_unlock();
  }
}

- (void)setSequenceFinalizeHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_isStarted)
  {
    objc_super v5 = [NSString stringWithFormat:@"Cannot modify MNSequence after it has already started."];
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v9 = 136316162;
      *(void *)&v9[4] = "-[MNSequence setSequenceFinalizeHandler:]";
      __int16 v10 = 2080;
      int v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/MNSequence.m";
      __int16 v12 = 1024;
      int v13 = 67;
      __int16 v14 = 2080;
      v15 = "NO";
      __int16 v16 = 2112;
      int v17 = v5;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", v9, 0x30u);
    }
  }
  else
  {
    *(void *)v9 = self->_stepsIsolater;
    _geo_isolate_lock();
    v7 = (void *)MEMORY[0x1BA99B3A0](v4);
    id finalizeHandler = self->_finalizeHandler;
    self->_id finalizeHandler = v7;

    _geo_isolate_unlock();
  }
}

- (void)start
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_isStarted)
  {
    v2 = [NSString stringWithFormat:@"MNSequence has already been started."];
    v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136316162;
      __int16 v10 = (MNSequence *)"-[MNSequence start]";
      __int16 v11 = 2080;
      __int16 v12 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/MNSequence.m";
      __int16 v13 = 1024;
      int v14 = 78;
      __int16 v15 = 2080;
      __int16 v16 = "NO";
      __int16 v17 = 2112;
      uint64_t v18 = v2;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", (uint8_t *)&v9, 0x30u);
    }
  }
  else
  {
    objc_super v5 = (OS_os_activity *)_os_activity_create(&dword_1B542B000, "MNSequence start", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    activity = self->_activity;
    self->_activity = v5;

    os_activity_scope_enter((os_activity_t)self->_activity, &self->_activityScopeState);
    v7 = MNGetMNSequenceLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [(NSMutableArray *)self->_steps count];
      int v9 = 134218240;
      __int16 v10 = self;
      __int16 v11 = 1024;
      LODWORD(v12) = v8;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEFAULT, "%p Starting sequence with %d steps.", (uint8_t *)&v9, 0x12u);
    }

    self->_isStarted = 1;
    [(MNSequence *)self _runNextStepWithPreviousStepResult:0];
  }
}

- (void)_runNextStepWithPreviousStepResult:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__2;
  v31 = __Block_byref_object_dispose__2;
  id v32 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __49__MNSequence__runNextStepWithPreviousStepResult___block_invoke;
  uint64_t v19 = &unk_1E60F6868;
  __int16 v20 = self;
  v21 = &v27;
  uint64_t v22 = &v23;
  geo_isolate_sync();
  if (v28[5])
  {
    objc_super v5 = _os_activity_create(&dword_1B542B000, "MNSequence step", (os_activity_t)self->_activity, OS_ACTIVITY_FLAG_DEFAULT);
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3010000000;
    v15.opaque[0] = 0;
    v15.opaque[1] = 0;
    v14[3] = &unk_1B5572251;
    os_activity_scope_enter(v5, &v15);
    v6 = MNGetMNSequenceLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = v24[3];
      *(_DWORD *)buf = 134218240;
      v34 = self;
      __int16 v35 = 1024;
      int v36 = v7;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "%p Starting step %d.", buf, 0x12u);
    }

    queue = self->_queue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__MNSequence__runNextStepWithPreviousStepResult___block_invoke_20;
    v9[3] = &unk_1E60F6A50;
    v9[4] = self;
    __int16 v11 = &v23;
    __int16 v12 = &v27;
    id v10 = v4;
    __int16 v13 = v14;
    dispatch_async(queue, v9);

    _Block_object_dispose(v14, 8);
  }
  else
  {
    [(MNSequence *)self _finalizeSequenceWithPreviousStepResult:v4];
  }
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
}

void __49__MNSequence__runNextStepWithPreviousStepResult___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) firstObject];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(a1[4] + 48);
  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    [*(id *)(a1[4] + 16) removeObjectAtIndex:0];
    ++*(void *)(a1[4] + 48);
  }
}

uint64_t __49__MNSequence__runNextStepWithPreviousStepResult___block_invoke_20(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MNGetMNSequenceLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = *(void *)(*(void *)(a1[6] + 8) + 24);
    *(_DWORD *)buf = 134218240;
    uint64_t v16 = v3;
    __int16 v17 = 1024;
    int v18 = v4;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_INFO, "%p Running step %d.", buf, 0x12u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1[7] + 8) + 40);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __49__MNSequence__runNextStepWithPreviousStepResult___block_invoke_21;
  __int16 v11 = &unk_1E60F6A28;
  uint64_t v6 = a1[6];
  uint64_t v12 = a1[4];
  uint64_t v13 = v6;
  uint64_t v14 = a1[8];
  return (*(uint64_t (**)(void))(v5 + 16))();
}

void __49__MNSequence__runNextStepWithPreviousStepResult___block_invoke_21(void *a1, void *a2, int a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = MNGetMNSequenceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = *(void *)(*(void *)(a1[5] + 8) + 24);
    int v10 = 134218496;
    uint64_t v11 = v7;
    __int16 v12 = 1024;
    int v13 = v8;
    __int16 v14 = 1024;
    int v15 = a3;
    _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "%p Finished step %d. shouldContinue: %d", (uint8_t *)&v10, 0x18u);
  }

  os_activity_scope_leave((os_activity_scope_state_t)(*(void *)(a1[6] + 8) + 32));
  uint64_t v9 = (void *)a1[4];
  if (a3) {
    [v9 _runNextStepWithPreviousStepResult:v5];
  }
  else {
    [v9 _finalizeSequenceWithPreviousStepResult:v5];
  }
}

- (void)_finalizeSequenceWithPreviousStepResult:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id finalizeHandler = self->_finalizeHandler;
  uint64_t v6 = MNGetMNSequenceLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (finalizeHandler)
  {
    if (v7)
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "%p Sequence steps finished. Calling finalizeHandler.", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__2;
    uint64_t v25 = __Block_byref_object_dispose__2;
    id v26 = 0;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    int v18 = __54__MNSequence__finalizeSequenceWithPreviousStepResult___block_invoke;
    uint64_t v19 = &unk_1E60F6A78;
    __int16 v20 = self;
    p_long long buf = &buf;
    geo_isolate_sync();
    uint64_t v8 = _os_activity_create(&dword_1B542B000, "MNSequence finalize", (os_activity_t)self->_activity, OS_ACTIVITY_FLAG_DEFAULT);
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3010000000;
    v15.opaque[0] = 0;
    v15.opaque[1] = 0;
    v14[3] = &unk_1B5572251;
    os_activity_scope_enter(v8, &v15);
    queue = self->_queue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__MNSequence__finalizeSequenceWithPreviousStepResult___block_invoke_2;
    v10[3] = &unk_1E60F6AA0;
    v10[4] = self;
    __int16 v12 = &buf;
    id v11 = v4;
    int v13 = v14;
    dispatch_async(queue, v10);

    _Block_object_dispose(v14, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (v7)
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_DEFAULT, "%p Sequence steps finished with no finalizeHandler.", (uint8_t *)&buf, 0xCu);
    }

    [(MNSequence *)self _endSequence];
  }
}

uint64_t __54__MNSequence__finalizeSequenceWithPreviousStepResult___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = MEMORY[0x1BA99B3A0](*(void *)(*(void *)(a1 + 32)
                                                                                              + 24));
  return MEMORY[0x1F41817F8]();
}

uint64_t __54__MNSequence__finalizeSequenceWithPreviousStepResult___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MNGetMNSequenceLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 134217984;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1B542B000, v2, OS_LOG_TYPE_INFO, "%p Running finalizeHandler.", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
  id v4 = MNGetMNSequenceLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 134217984;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_INFO, "%p Finished finalizeHandler.", (uint8_t *)&v7, 0xCu);
  }

  os_activity_scope_leave((os_activity_scope_state_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
  return [*(id *)(a1 + 32) _endSequence];
}

- (void)_endSequence
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MNGetMNSequenceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    uint64_t v5 = self;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEFAULT, "%p Sequence ended.", (uint8_t *)&v4, 0xCu);
  }

  os_activity_scope_leave(&self->_activityScopeState);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_stepsIsolater, 0);
  objc_storeStrong(&self->_finalizeHandler, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end