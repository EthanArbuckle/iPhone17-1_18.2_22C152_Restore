@interface STUIStatusBarDataAggregatorUpdateDelayToken
- (BOOL)isInvalidated;
- (NSSet)delayedKeys;
- (NSTimer)timeoutTimer;
- (STUIStatusBarDataAggregatorUpdateDelayToken)initWithEntryKeys:(id)a3 timeout:(double)a4 timeoutBlock:(id)a5;
- (id)timeoutBlock;
- (void)dealloc;
- (void)invalidate;
@end

@implementation STUIStatusBarDataAggregatorUpdateDelayToken

- (void)invalidate
{
  self->_invalidated = 1;
  [(NSTimer *)self->_timeoutTimer invalidate];
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = 0;

  id timeoutBlock = self->_timeoutBlock;
  self->_id timeoutBlock = 0;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (NSSet)delayedKeys
{
  return self->_delayedKeys;
}

- (STUIStatusBarDataAggregatorUpdateDelayToken)initWithEntryKeys:(id)a3 timeout:(double)a4 timeoutBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)STUIStatusBarDataAggregatorUpdateDelayToken;
  v10 = [(STUIStatusBarDataAggregatorUpdateDelayToken *)&v22 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    delayedKeys = v10->_delayedKeys;
    v10->_delayedKeys = (NSSet *)v11;

    uint64_t v13 = [v9 copy];
    id timeoutBlock = v10->_timeoutBlock;
    v10->_id timeoutBlock = (id)v13;

    objc_initWeak(&location, v10);
    v15 = (void *)MEMORY[0x1E4F1CB00];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __86__STUIStatusBarDataAggregatorUpdateDelayToken_initWithEntryKeys_timeout_timeoutBlock___block_invoke;
    v19[3] = &unk_1E6AA3A18;
    objc_copyWeak(&v20, &location);
    uint64_t v16 = [v15 scheduledTimerWithTimeInterval:0 repeats:v19 block:a4];
    timeoutTimer = v10->_timeoutTimer;
    v10->_timeoutTimer = (NSTimer *)v16;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutBlock, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_delayedKeys, 0);
}

- (void)dealloc
{
  id timeoutBlock = (void (**)(id, STUIStatusBarDataAggregatorUpdateDelayToken *))self->_timeoutBlock;
  if (timeoutBlock)
  {
    timeoutBlock[2](timeoutBlock, self);
    [(NSTimer *)self->_timeoutTimer invalidate];
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = 0;

    id v5 = self->_timeoutBlock;
    self->_id timeoutBlock = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarDataAggregatorUpdateDelayToken;
  [(STUIStatusBarDataAggregatorUpdateDelayToken *)&v6 dealloc];
}

void __86__STUIStatusBarDataAggregatorUpdateDelayToken_initWithEntryKeys_timeout_timeoutBlock___block_invoke(uint64_t a1)
{
  WeakRetained = (const void **)objc_loadWeakRetained((id *)(a1 + 32));
  v1 = _Block_copy(WeakRetained[4]);
  v2 = v1;
  if (v1) {
    (*((void (**)(void *, const void **))v1 + 2))(v1, WeakRetained);
  }
}

- (NSTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (id)timeoutBlock
{
  return self->_timeoutBlock;
}

@end