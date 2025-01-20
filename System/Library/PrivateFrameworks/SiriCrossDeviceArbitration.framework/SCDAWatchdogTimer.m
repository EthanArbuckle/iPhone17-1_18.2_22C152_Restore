@interface SCDAWatchdogTimer
- (BOOL)cancelIfNotAlreadyCanceled;
- (BOOL)isStopped;
- (SCDAWatchdogTimer)initWithTimeoutInterval:(double)a3 onQueue:(id)a4 timeoutHandler:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (void)cancel;
- (void)dealloc;
- (void)reset;
- (void)start;
- (void)stop;
@end

@implementation SCDAWatchdogTimer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
}

- (void)reset
{
  [(SCDAWatchdogTimer *)self stop];
  self->_remainingInterval = self->_interval;
  [(SCDAWatchdogTimer *)self start];
}

- (BOOL)cancelIfNotAlreadyCanceled
{
  intptr_t v3 = dispatch_source_testcancel((dispatch_source_t)self->_timerSource);
  if (!v3) {
    [(SCDAWatchdogTimer *)self cancel];
  }
  return v3 == 0;
}

- (void)cancel
{
  p_timerLock = &self->_timerLock;
  os_unfair_lock_lock(&self->_timerLock);
  dispatch_source_cancel((dispatch_source_t)self->_timerSource);
  if (self->_isStopped)
  {
    dispatch_resume((dispatch_object_t)self->_timerSource);
    self->_isStopped = 0;
  }
  os_unfair_lock_unlock(p_timerLock);
}

- (BOOL)isStopped
{
  return self->_isStopped;
}

- (void)stop
{
  p_timerLock = &self->_timerLock;
  os_unfair_lock_lock(&self->_timerLock);
  if (!self->_isStopped)
  {
    dispatch_suspend((dispatch_object_t)self->_timerSource);
    v4 = [MEMORY[0x263F08AB0] processInfo];
    [v4 systemUptime];
    double v6 = v5 - self->_startTime;

    double v7 = self->_interval - v6;
    if (v7 < 0.0) {
      double v7 = 0.0;
    }
    self->_remainingInterval = v7;
    self->_isStopped = 1;
  }
  os_unfair_lock_unlock(p_timerLock);
}

- (void)start
{
  p_timerLock = &self->_timerLock;
  os_unfair_lock_lock(&self->_timerLock);
  if (self->_isStopped)
  {
    timerSource = self->_timerSource;
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(self->_remainingInterval * 1000000000.0));
    dispatch_source_set_timer(timerSource, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_timerSource);
    double v6 = [MEMORY[0x263F08AB0] processInfo];
    [v6 systemUptime];
    self->_startTime = v7;

    self->_isStopped = 0;
  }
  os_unfair_lock_unlock(p_timerLock);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  double interval = self->_interval;
  queue = self->_queue;
  id timeoutHandler = self->_timeoutHandler;
  return (id)[v4 initWithTimeoutInterval:queue onQueue:timeoutHandler timeoutHandler:interval];
}

- (SCDAWatchdogTimer)initWithTimeoutInterval:(double)a3 onQueue:(id)a4 timeoutHandler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SCDAWatchdogTimer;
  v11 = [(SCDAWatchdogTimer *)&v23 init];
  v12 = v11;
  if (v11)
  {
    v11->_double interval = a3;
    v11->_remainingInterval = a3;
    objc_storeStrong((id *)&v11->_queue, a4);
    uint64_t v13 = MEMORY[0x261192180](v10);
    id timeoutHandler = v12->_timeoutHandler;
    v12->_id timeoutHandler = (id)v13;

    dispatch_source_t v15 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v12->_queue);
    timerSource = v12->_timerSource;
    v12->_timerSource = (OS_dispatch_source *)v15;

    v12->_timerLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v12);
    v17 = v12->_timerSource;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __68__SCDAWatchdogTimer_initWithTimeoutInterval_onQueue_timeoutHandler___block_invoke;
    handler[3] = &unk_2654B7B50;
    objc_copyWeak(&v21, &location);
    id v20 = v10;
    dispatch_source_set_event_handler(v17, handler);
    v12->_isStopped = 1;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v12;
}

uint64_t __68__SCDAWatchdogTimer_initWithTimeoutInterval_onQueue_timeoutHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained cancelIfNotAlreadyCanceled];

  intptr_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

- (void)dealloc
{
  timerSource = self->_timerSource;
  if (timerSource && self->_isStopped) {
    dispatch_resume(timerSource);
  }
  v4.receiver = self;
  v4.super_class = (Class)SCDAWatchdogTimer;
  [(SCDAWatchdogTimer *)&v4 dealloc];
}

@end