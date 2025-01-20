@interface Timer
- (void)cancel;
- (void)dealloc;
- (void)resetWithTimeInterval:(double)a3 block:(id)a4;
@end

@implementation Timer

- (void)resetWithTimeInterval:(double)a3 block:(id)a4
{
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  [(Timer *)v7 cancel];
  if (v6)
  {
    objc_initWeak(&location, v7);
    v8 = dispatch_get_global_queue(21, 0);
    dispatch_source_t v9 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v8);
    timer = v7->_timer;
    v7->_timer = (OS_dispatch_source *)v9;

    v11 = v7->_timer;
    dispatch_time_t v12 = dispatch_walltime(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v13 = v7->_timer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3254779904;
    handler[2] = __37__Timer_resetWithTimeInterval_block___block_invoke;
    handler[3] = &__block_descriptor_48_e8_32bs40w_e5_v8__0l;
    objc_copyWeak(&v16, &location);
    id v15 = v6;
    dispatch_source_set_event_handler(v13, handler);
    dispatch_activate((dispatch_object_t)v7->_timer);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v7);
}

void __37__Timer_resetWithTimeInterval_block___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained cancel];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)cancel
{
  v2 = self;
  objc_sync_enter(v2);
  timer = v2->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = v2->_timer;
    v2->_timer = 0;
  }
  objc_sync_exit(v2);
}

- (void)dealloc
{
  [(Timer *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)Timer;
  [(Timer *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end