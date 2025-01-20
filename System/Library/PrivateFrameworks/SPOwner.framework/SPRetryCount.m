@interface SPRetryCount
- (OS_dispatch_queue)serialQueue;
- (SPRetryCount)init;
- (double)_decayedWaitIntervalForRetryCount:(unint64_t)a3;
- (double)decayWaitInterval;
- (unint64_t)retryCount;
- (void)increment;
- (void)reset;
- (void)setDecayWaitInterval:(double)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation SPRetryCount

- (void).cxx_destruct
{
}

- (SPRetryCount)init
{
  v7.receiver = self;
  v7.super_class = (Class)SPRetryCount;
  v2 = [(SPRetryCount *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_retryCount = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.SPOwner.retryCountQueue", 0);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (double)decayWaitInterval
{
  uint64_t v7 = 0;
  v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(SPRetryCount *)self serialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__SPRetryCount_decayWaitInterval__block_invoke;
  v6[3] = &unk_1E601BA08;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __33__SPRetryCount_decayWaitInterval__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_decayedWaitIntervalForRetryCount:", objc_msgSend(*(id *)(a1 + 32), "retryCount"));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)increment
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SPRetryCount *)self serialQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __25__SPRetryCount_increment__block_invoke;
  v4[3] = &unk_1E601BA30;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __25__SPRetryCount_increment__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setRetryCount:", objc_msgSend(WeakRetained, "retryCount") + 1);
    id WeakRetained = v2;
  }
}

- (void)reset
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(SPRetryCount *)self serialQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __21__SPRetryCount_reset__block_invoke;
  v4[3] = &unk_1E601BA30;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __21__SPRetryCount_reset__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setRetryCount:0];
    id WeakRetained = v2;
  }
}

- (double)_decayedWaitIntervalForRetryCount:(unint64_t)a3
{
  double result = exp2((double)a3);
  if (result > 60.0) {
    return 60.0;
  }
  return result;
}

- (void)setDecayWaitInterval:(double)a3
{
  self->_decayWaitInterval = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

@end