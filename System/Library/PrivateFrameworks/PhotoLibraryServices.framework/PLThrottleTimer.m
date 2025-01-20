@interface PLThrottleTimer
- (PLThrottleTimer)initWithTarget:(id)a3 action:(SEL)a4 invocationQueue:(id)a5 timeout:(double)a6 maxTimeout:(double)a7;
- (SEL)action;
- (double)maxTimeout;
- (double)timeout;
- (id)target;
- (void)_inqFireWithTimeout:(BOOL)a3 timeoutId:(unint64_t)a4 maxTimeout:(BOOL)a5 maxTimeoutId:(unint64_t)a6;
- (void)_inqScheduleTimeout:(BOOL)a3 maxTimeout:(BOOL)a4;
- (void)invalidate;
- (void)ping;
- (void)setPaused:(BOOL)a3;
@end

@implementation PLThrottleTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak(&self->_target);
}

- (double)maxTimeout
{
  return self->_maxTimeout;
}

- (double)timeout
{
  return self->_timeout;
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)invalidate
{
}

uint64_t __29__PLThrottleTimer_invalidate__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 50) = 1;
  return result;
}

- (void)setPaused:(BOOL)a3
{
}

uint64_t __29__PLThrottleTimer_setPaused___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 49) != v2)
  {
    *(unsigned char *)(v1 + 49) = v2;
    result = *(void *)(result + 32);
    if (!*(unsigned char *)(result + 49) && !*(unsigned char *)(result + 50))
    {
      if (*(unsigned char *)(result + 48)) {
        return [(id)result _inqScheduleTimeout:1 maxTimeout:1];
      }
    }
  }
  return result;
}

- (void)ping
{
}

unsigned char *__23__PLThrottleTimer_ping__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(v1 + 48);
  *(unsigned char *)(v1 + 48) = 1;
  result = *(unsigned char **)(a1 + 32);
  if (!result[49] && !result[50]) {
    return (unsigned char *)[result _inqScheduleTimeout:1 maxTimeout:v2 == 0];
  }
  return result;
}

- (void)_inqScheduleTimeout:(BOOL)a3 maxTimeout:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    ++self->_timeoutId;
    dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
    pl_dispatch_after();
  }
  if (v4)
  {
    ++self->_maxTimeoutId;
    dispatch_time(0, (uint64_t)(self->_maxTimeout * 1000000000.0));
    pl_dispatch_after();
  }
}

uint64_t __50__PLThrottleTimer__inqScheduleTimeout_maxTimeout___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _inqFireWithTimeout:1 timeoutId:*(void *)(a1 + 40) maxTimeout:0 maxTimeoutId:*(void *)(a1 + 48)];
}

uint64_t __50__PLThrottleTimer__inqScheduleTimeout_maxTimeout___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _inqFireWithTimeout:0 timeoutId:*(void *)(a1 + 40) maxTimeout:1 maxTimeoutId:*(void *)(a1 + 48)];
}

- (void)_inqFireWithTimeout:(BOOL)a3 timeoutId:(unint64_t)a4 maxTimeout:(BOOL)a5 maxTimeoutId:(unint64_t)a6
{
  if (!self->_isPaused && !self->_isInvalid)
  {
    if (a3 && self->_timeoutId == a4)
    {
      BOOL isPingedSinceLastFire = self->_isPingedSinceLastFire;
      if (!a5) {
        goto LABEL_10;
      }
    }
    else
    {
      BOOL isPingedSinceLastFire = 0;
      if (!a5) {
        goto LABEL_10;
      }
    }
    if (self->_maxTimeoutId == a6)
    {
      BOOL v7 = self->_isPingedSinceLastFire;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
LABEL_11:
    if (isPingedSinceLastFire || v7)
    {
      self->_BOOL isPingedSinceLastFire = 0;
      pl_dispatch_async();
    }
  }
}

void __73__PLThrottleTimer__inqFireWithTimeout_timeoutId_maxTimeout_maxTimeoutId___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 56) ? *(void *)(*(void *)(a1 + 32) + 56) : 0;
    id v6 = WeakRetained;
    BOOL v4 = (void (*)(id, uint64_t))[WeakRetained methodForSelector:v3];
    id WeakRetained = v6;
    if (v4)
    {
      if (*(void *)(*(void *)(a1 + 32) + 56)) {
        uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 56);
      }
      else {
        uint64_t v5 = 0;
      }
      v4(v6, v5);
      id WeakRetained = v6;
    }
  }
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (PLThrottleTimer)initWithTarget:(id)a3 action:(SEL)a4 invocationQueue:(id)a5 timeout:(double)a6 maxTimeout:(double)a7
{
  id v12 = a3;
  id v13 = a5;
  v22.receiver = self;
  v22.super_class = (Class)PLThrottleTimer;
  v14 = [(PLThrottleTimer *)&v22 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak(&v14->_target, v12);
    if (a4) {
      SEL v16 = a4;
    }
    else {
      SEL v16 = 0;
    }
    v15->_action = v16;
    double v17 = fmax(a6, 0.01);
    if (v17 >= a7) {
      double v18 = v17;
    }
    else {
      double v18 = a7;
    }
    v15->_timeout = v17;
    v15->_maxTimeout = v18;
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.photos.throttle_timer", 0);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v15->_invocationQueue, a5);
  }

  return v15;
}

@end