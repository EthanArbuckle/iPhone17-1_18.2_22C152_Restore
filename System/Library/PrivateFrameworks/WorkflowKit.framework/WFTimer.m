@interface WFTimer
- (BOOL)shouldHaveTimeout;
- (OS_dispatch_queue)timerQueue;
- (OS_dispatch_source)timeoutTimer;
- (WFTimer)initWithHandler:(id)a3 duration:(double)a4;
- (WFTimerHandler)handler;
- (double)duration;
- (void)cancel;
- (void)restart;
- (void)setTimeoutTimer:(id)a3;
- (void)setTimerQueue:(id)a3;
- (void)start;
@end

@implementation WFTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_destroyWeak((id *)&self->_handler);
}

- (void)setTimerQueue:(id)a3
{
}

- (OS_dispatch_queue)timerQueue
{
  return self->_timerQueue;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (double)duration
{
  return self->_duration;
}

- (WFTimerHandler)handler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  return (WFTimerHandler *)WeakRetained;
}

- (BOOL)shouldHaveTimeout
{
  v3 = [(WFTimer *)self handler];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  v5 = [(WFTimer *)self handler];
  char v6 = [v5 timerShouldStart:self];

  return v6;
}

- (void)cancel
{
  v3 = [(WFTimer *)self timeoutTimer];

  if (v3)
  {
    char v4 = [(WFTimer *)self timeoutTimer];
    dispatch_source_cancel(v4);

    [(WFTimer *)self setTimeoutTimer:0];
  }
}

- (void)restart
{
  [(WFTimer *)self cancel];
  [(WFTimer *)self start];
}

- (void)start
{
  if ([(WFTimer *)self shouldHaveTimeout])
  {
    objc_initWeak(&location, self);
    v3 = [(WFTimer *)self timerQueue];
    dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v3);
    [(WFTimer *)self setTimeoutTimer:v4];

    [(WFTimer *)self duration];
    double v6 = v5;
    v7 = [(WFTimer *)self timeoutTimer];
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    dispatch_source_set_timer(v7, v8, (uint64_t)(v6 * 1000000000.0), 0x3B9ACA00uLL);

    v9 = [(WFTimer *)self timeoutTimer];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __16__WFTimer_start__block_invoke;
    v14 = &unk_1E6555640;
    objc_copyWeak(&v15, &location);
    dispatch_source_set_event_handler(v9, &v11);

    v10 = [(WFTimer *)self timeoutTimer];
    dispatch_activate(v10);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __16__WFTimer_start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained handler];
  [v1 timerDidFire:WeakRetained];
}

- (WFTimer)initWithHandler:(id)a3 duration:(double)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFTimer.m", 25, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)WFTimer;
  dispatch_time_t v8 = [(WFTimer *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_handler, v7);
    v9->_duration = a4;
    v10 = dispatch_get_global_queue(21, 0);
    dispatch_queue_t v11 = dispatch_queue_create_with_target_V2("com.apple.WorkflowKit.WFTimer", 0, v10);
    timerQueue = v9->_timerQueue;
    v9->_timerQueue = (OS_dispatch_queue *)v11;

    v13 = v9;
  }

  return v9;
}

@end