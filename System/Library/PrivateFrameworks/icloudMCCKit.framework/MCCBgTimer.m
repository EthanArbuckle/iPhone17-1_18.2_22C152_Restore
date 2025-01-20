@interface MCCBgTimer
- (BOOL)isValid;
- (MCCBgTimer)initWithTimeIntervalSinceNow:(double)a3 block:(id)a4;
- (MCCBgTimer)initWithTimeIntervalSinceNow:(double)a3 queue:(id)a4 block:(id)a5;
- (void)cancel;
- (void)start;
@end

@implementation MCCBgTimer

- (MCCBgTimer)initWithTimeIntervalSinceNow:(double)a3 block:(id)a4
{
  return [(MCCBgTimer *)self initWithTimeIntervalSinceNow:0 queue:a4 block:a3];
}

- (MCCBgTimer)initWithTimeIntervalSinceNow:(double)a3 queue:(id)a4 block:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MCCBgTimer;
  v10 = [(MCCBgTimer *)&v22 init];
  v11 = v10;
  if (v10)
  {
    v10->_interval = (unint64_t)(a3 * 1000000000.0);
    if (v8) {
      dispatch_queue_t v12 = (dispatch_queue_t)v8;
    }
    else {
      dispatch_queue_t v12 = dispatch_queue_create("com.apple.mcckit.bgtimer", 0);
    }
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    dispatch_source_t v14 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v11->_queue);
    timer = v11->_timer;
    v11->_timer = (OS_dispatch_source *)v14;

    objc_initWeak(&location, v11);
    v16 = v11->_timer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __55__MCCBgTimer_initWithTimeIntervalSinceNow_queue_block___block_invoke;
    handler[3] = &unk_2655BA8B8;
    id v19 = v9;
    objc_copyWeak(&v20, &location);
    dispatch_source_set_event_handler(v16, handler);
    objc_destroyWeak(&v20);

    objc_destroyWeak(&location);
  }

  return v11;
}

void __55__MCCBgTimer_initWithTimeIntervalSinceNow_queue_block___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v3);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(v3);
    [v5 cancel];
  }
}

- (void)start
{
}

- (void)cancel
{
  os_unfair_lock_lock(&_lock);
  if ([(MCCBgTimer *)self isValid])
  {
    dispatch_source_cancel((dispatch_source_t)self->_timer);
    timer = self->_timer;
    self->_timer = 0;
  }
  os_unfair_lock_unlock(&_lock);
}

- (BOOL)isValid
{
  timer = self->_timer;
  if (timer) {
    LOBYTE(timer) = dispatch_source_testcancel(timer) == 0;
  }
  return (char)timer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end