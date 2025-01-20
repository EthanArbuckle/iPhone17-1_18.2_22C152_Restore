@interface MTGCDTimer
- (void)cancelTimer;
- (void)dealloc;
- (void)startTimer:(double)a3 block:(id)a4;
@end

@implementation MTGCDTimer

- (void)dealloc
{
  [(MTGCDTimer *)self cancelTimer];
  v3.receiver = self;
  v3.super_class = (Class)MTGCDTimer;
  [(MTGCDTimer *)&v3 dealloc];
}

- (void)startTimer:(double)a3 block:(id)a4
{
  id v6 = a4;
  if (self->_timer) {
    [(MTGCDTimer *)self cancelTimer];
  }
  v7 = dispatch_get_global_queue(33, 0);
  v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v7);
  timer = self->_timer;
  self->_timer = v8;

  v10 = self->_timer;
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
  v12 = self->_timer;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __31__MTGCDTimer_startTimer_block___block_invoke;
  v20 = &unk_1E59171A0;
  v21 = self;
  id v22 = v6;
  id v13 = v6;
  dispatch_source_set_event_handler(v12, &v17);
  v14 = [MTPowerAssertion alloc];
  v15 = [(MTPowerAssertion *)v14 initWithName:@"com.apple.MTGCDTimer", 20.0, v17, v18, v19, v20, v21 assertionTimeout];
  powerAssertion = self->_powerAssertion;
  self->_powerAssertion = v15;

  [(MTPowerAssertion *)self->_powerAssertion takeAssertion];
  dispatch_resume((dispatch_object_t)self->_timer);
}

uint64_t __31__MTGCDTimer_startTimer_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 cancelTimer];
}

- (void)cancelTimer
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

    [(MTPowerAssertion *)self->_powerAssertion releaseAssertion];
    powerAssertion = self->_powerAssertion;
    self->_powerAssertion = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end