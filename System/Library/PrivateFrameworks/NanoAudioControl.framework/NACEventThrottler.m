@interface NACEventThrottler
- (NACEventThrottler)init;
- (NACEventThrottler)initWithQueue:(id)a3;
- (double)minimumDelay;
- (id)eventBlock;
- (id)value;
- (void)_fire;
- (void)cancel;
- (void)setEventBlock:(id)a3;
- (void)setMinimumDelay:(double)a3;
- (void)setValue:(id)a3;
@end

@implementation NACEventThrottler

- (NACEventThrottler)init
{
  return [(NACEventThrottler *)self initWithQueue:0];
}

- (void)setMinimumDelay:(double)a3
{
  self->_minimumDelay = fmax(a3, 0.0);
}

- (void)setEventBlock:(id)a3
{
  self->_eventBlock = (id)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (NACEventThrottler)initWithQueue:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NACEventThrottler;
  v5 = [(NACEventThrottler *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v5->_minimumDelay = 1.0;
    if (v4)
    {
      v7 = (OS_dispatch_queue *)v4;
      queue = v6->_queue;
      v6->_queue = v7;
    }
    else
    {
      v9 = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
      id v10 = MEMORY[0x263EF83A0];
      queue = v6->_queue;
      v6->_queue = v9;
    }
  }
  return v6;
}

- (void)setValue:(id)a3
{
  id v5 = a3;
  objc_storeStrong(&self->_value, a3);
  if (!self->_timer)
  {
    double v6 = self->_minimumDelay - (CACurrentMediaTime() - self->_lastUpdateTime);
    if (v6 <= 0.0)
    {
      [(NACEventThrottler *)self _fire];
    }
    else
    {
      int64_t v7 = (uint64_t)(v6 * 1000000000.0);
      v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
      timer = self->_timer;
      self->_timer = v8;

      objc_initWeak(&location, self);
      id v10 = self->_timer;
      dispatch_time_t v11 = dispatch_time(0, v7);
      dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)((double)v7 / 20.0));
      objc_super v12 = self->_timer;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __30__NACEventThrottler_setValue___block_invoke;
      v13[3] = &unk_264CFC518;
      objc_copyWeak(&v14, &location);
      dispatch_source_set_event_handler(v12, v13);
      dispatch_resume((dispatch_object_t)self->_timer);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
}

void __30__NACEventThrottler_setValue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fire];
}

- (void)_fire
{
  eventBlock = (void (**)(id, id))self->_eventBlock;
  if (eventBlock) {
    eventBlock[2](eventBlock, self->_value);
  }
  self->_lastUpdateTime = CACurrentMediaTime();

  [(NACEventThrottler *)self cancel];
}

- (void)cancel
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    id v4 = self->_timer;
    self->_timer = 0;
  }
}

- (id)eventBlock
{
  return self->_eventBlock;
}

- (double)minimumDelay
{
  return self->_minimumDelay;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong(&self->_eventBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end