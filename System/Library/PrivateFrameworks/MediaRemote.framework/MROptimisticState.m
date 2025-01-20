@interface MROptimisticState
- (MROptimisticState)initWithInitialState:(id)a3 expectedState:(id)a4 timeout:(double)a5 queue:(id)a6 timeoutHandler:(id)a7;
- (MSVTimer)timer;
- (id)expectedState;
- (id)initialState;
- (void)dealloc;
@end

@implementation MROptimisticState

- (MROptimisticState)initWithInitialState:(id)a3 expectedState:(id)a4 timeout:(double)a5 queue:(id)a6 timeoutHandler:(id)a7
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)MROptimisticState;
  v18 = [(MROptimisticState *)&v28 init];
  if (v18)
  {
    if (!v17)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, v18, @"MROptimisticState.m", 23, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
    }
    objc_storeStrong(&v18->_initialState, a3);
    objc_storeStrong(&v18->_expectedState, a4);
    objc_initWeak(&location, v18);
    v19 = (void *)MEMORY[0x1E4F77A30];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __85__MROptimisticState_initWithInitialState_expectedState_timeout_queue_timeoutHandler___block_invoke;
    v24[3] = &unk_1E57D2918;
    objc_copyWeak(&v26, &location);
    id v25 = v17;
    uint64_t v20 = [v19 timerWithInterval:0 repeats:v16 queue:v24 block:a5];
    timer = v18->_timer;
    v18->_timer = (MSVTimer *)v20;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v18;
}

uint64_t __85__MROptimisticState_initWithInitialState_expectedState_timeout_queue_timeoutHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id WeakRetained = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = v5;
  }

  return MEMORY[0x1F41817F8](WeakRetained, v3);
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [(MROptimisticState *)self timer];
  [v3 invalidate];

  v4 = _MRLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[MROptimisticState]<%p> dealloc", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)MROptimisticState;
  [(MROptimisticState *)&v5 dealloc];
}

- (id)initialState
{
  return self->_initialState;
}

- (id)expectedState
{
  return self->_expectedState;
}

- (MSVTimer)timer
{
  return self->_timer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_expectedState, 0);

  objc_storeStrong(&self->_initialState, 0);
}

@end