@interface QLGracePeriodTimer
- (QLGracePeriodTimer)initWithAction:(id)a3 callbackQueue:(id)a4 delay:(double)a5;
- (id)action;
- (void)_createTimer;
- (void)_suppress;
- (void)arm;
- (void)setAction:(id)a3;
- (void)suppress;
@end

@implementation QLGracePeriodTimer

- (QLGracePeriodTimer)initWithAction:(id)a3 callbackQueue:(id)a4 delay:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)QLGracePeriodTimer;
  v10 = [(QLGracePeriodTimer *)&v14 init];
  if (v10)
  {
    uint64_t v11 = MEMORY[0x21D45D660](v8);
    id action = v10->_action;
    v10->_id action = (id)v11;

    objc_storeStrong((id *)&v10->_callbackQueue, a4);
    v10->_delay = a5;
  }

  return v10;
}

- (void)_createTimer
{
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_callbackQueue);
  timer = self->_timer;
  self->_timer = v3;

  double delay = self->_delay;
  uint64_t v6 = (uint64_t)(delay / 10.0 * 1000000000.0);
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(delay * 1000000000.0));
  dispatch_source_set_timer((dispatch_source_t)self->_timer, v7, 0xFFFFFFFFFFFFFFFFLL, v6);
  objc_initWeak(&location, self);
  id v8 = self->_timer;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __34__QLGracePeriodTimer__createTimer__block_invoke;
  v9[3] = &unk_2642F24C0;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __34__QLGracePeriodTimer__createTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v2 = [WeakRetained action];
    v3 = (void *)v2;
    if (v2) {
      (*(void (**)(uint64_t))(v2 + 16))(v2);
    }
    [v4 _suppress];

    id WeakRetained = v4;
  }
}

- (void)_suppress
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    id v4 = self->_timer;
    self->_timer = 0;
  }
}

- (void)arm
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  [(QLGracePeriodTimer *)self _suppress];
  [(QLGracePeriodTimer *)self _createTimer];
  timer = self->_timer;
  dispatch_resume(timer);
}

- (void)suppress
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  [(QLGracePeriodTimer *)self _suppress];
}

- (id)action
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_action, 0);
}

@end