@interface MTBackgroundAssertion
- (BOOL)isValid;
- (MTBackgroundAssertion)initWithName:(id)a3 flags:(unsigned int)a4 reason:(unsigned int)a5;
- (id)description;
- (id)invalidationHandler;
- (void)_cancelInvalidationTimer;
- (void)_createScheduledTimerWithInterval:(double)a3;
- (void)_invalidate;
- (void)_invalidationTimerFired;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateAfterDelay:(double)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation MTBackgroundAssertion

- (MTBackgroundAssertion)initWithName:(id)a3 flags:(unsigned int)a4 reason:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MTBackgroundAssertion;
  v9 = [(MTBackgroundAssertion *)&v26 init];
  if (v9)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F4E280]) initWithPID:getpid() flags:v6 reason:v5 name:v8];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __51__MTBackgroundAssertion_initWithName_flags_reason___block_invoke;
    v24[3] = &unk_1E5E611F0;
    id v11 = v8;
    id v25 = v11;
    [v10 setInvalidationHandler:v24];
    [v10 acquire];
    char v12 = [v10 valid];
    v13 = _MTLogCategoryBackgroundFetching();
    v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v11;
        v15 = "Acquired assertion for %@";
        v16 = v14;
        os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
LABEL_7:
        _os_log_impl(&dword_1AC9D5000, v16, v17, v15, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v11;
      v15 = "Fail to acquire assertion for %@";
      v16 = v14;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }

    assertion = v9->_assertion;
    v9->_assertion = (BKSProcessAssertion *)v10;
    id v19 = v10;

    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.podcasts.MTBackgroundAssertion", v20);
    serialQueue = v9->_serialQueue;
    v9->_serialQueue = (OS_dispatch_queue *)v21;
  }
  return v9;
}

void __51__MTBackgroundAssertion_initWithName_flags_reason___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = _MTLogCategoryBackgroundFetching();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1AC9D5000, v2, OS_LOG_TYPE_DEFAULT, "Assertion with name %@ was invalidated.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)dealloc
{
  [(MTBackgroundAssertion *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MTBackgroundAssertion;
  [(MTBackgroundAssertion *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@:%p assertion: %@>", v5, self, self->_assertion];

  return v6;
}

- (BOOL)isValid
{
  return [(BKSProcessAssertion *)self->_assertion valid];
}

- (void)invalidate
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__MTBackgroundAssertion_invalidate__block_invoke;
  block[3] = &unk_1E5E611F0;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

uint64_t __35__MTBackgroundAssertion_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)invalidateAfterDelay:(double)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MTBackgroundAssertion_invalidateAfterDelay___block_invoke;
  v4[3] = &unk_1E5E63078;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

uint64_t __46__MTBackgroundAssertion_invalidateAfterDelay___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelInvalidationTimer];
  v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  return [v2 _createScheduledTimerWithInterval:v3];
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void)_invalidate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v3 = _MTLogCategoryBackgroundFetching();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = self;
    _os_log_impl(&dword_1AC9D5000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating %@", (uint8_t *)&v4, 0xCu);
  }

  [(MTBackgroundAssertion *)self _cancelInvalidationTimer];
  [(BKSProcessAssertion *)self->_assertion invalidate];
}

- (void)_invalidationTimerFired
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v3 = _MTLogCategoryBackgroundFetching();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = self;
    _os_log_impl(&dword_1AC9D5000, v3, OS_LOG_TYPE_DEFAULT, "Assertion %@ just timed out, force invalidating.", (uint8_t *)&v4, 0xCu);
  }

  [(MTBackgroundAssertion *)self invalidate];
}

- (void)_cancelInvalidationTimer
{
  [(NSTimer *)self->_invalidationTimer invalidate];
  invalidationTimer = self->_invalidationTimer;
  self->_invalidationTimer = 0;
}

- (void)_createScheduledTimerWithInterval:(double)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _MTLogCategoryBackgroundFetching();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    v10 = self;
    __int16 v11 = 2048;
    double v12 = a3;
    _os_log_impl(&dword_1AC9D5000, v5, OS_LOG_TYPE_DEFAULT, "Assertion %@ timer set %f", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v6 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__invalidationTimerFired selector:0 userInfo:0 repeats:a3];
  invalidationTimer = self->_invalidationTimer;
  self->_invalidationTimer = v6;

  id v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v8 addTimer:self->_invalidationTimer forMode:*MEMORY[0x1E4F1C3A0]];
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end