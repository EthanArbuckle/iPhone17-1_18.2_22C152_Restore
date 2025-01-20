@interface OITSUDelayTimer
- (BOOL)_isCancelled;
- (BOOL)automaticallyCancelPendingBlockUponSchedulingNewBlock;
- (OITSUDelayTimer)init;
- (OITSUDelayTimer)initWithTargetSerialQueue:(id)a3;
- (OS_dispatch_queue)_dispatchQueue;
- (OS_dispatch_source)_dispatchTimer;
- (void)_reallyCancel;
- (void)_setCancelled:(BOOL)a3;
- (void)_setDispatchQueue:(id)a3;
- (void)_setDispatchTimer:(id)a3;
- (void)afterDelay:(double)a3 processBlock:(id)a4;
- (void)cancel;
- (void)dealloc;
- (void)setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:(BOOL)a3;
@end

@implementation OITSUDelayTimer

- (OITSUDelayTimer)init
{
  return [(OITSUDelayTimer *)self initWithTargetSerialQueue:0];
}

- (OITSUDelayTimer)initWithTargetSerialQueue:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)OITSUDelayTimer;
  v4 = [(OITSUDelayTimer *)&v12 init];
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      [(OITSUDelayTimer *)v4 _setDispatchQueue:a3];
    }
    else
    {
      id v6 = [NSString alloc];
      uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier");
      v8 = (objc_class *)objc_opt_class();
      v9 = (void *)[v6 initWithFormat:@"%@.%@.TimerQueue", v7, NSStringFromClass(v8)];
      v10 = dispatch_queue_create((const char *)[v9 UTF8String], 0);

      [(OITSUDelayTimer *)v5 _setDispatchQueue:v10];
      if (v10) {
        dispatch_release(v10);
      }
    }
  }
  return v5;
}

- (void)dealloc
{
  [(OITSUDelayTimer *)self _reallyCancel];
  [(OITSUDelayTimer *)self _setDispatchQueue:0];
  v3.receiver = self;
  v3.super_class = (Class)OITSUDelayTimer;
  [(OITSUDelayTimer *)&v3 dealloc];
}

- (void)afterDelay:(double)a3 processBlock:(id)a4
{
  [(OITSUDelayTimer *)self _setCancelled:0];
  uint64_t v7 = [(OITSUDelayTimer *)self _dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__OITSUDelayTimer_afterDelay_processBlock___block_invoke;
  block[3] = &unk_264D61190;
  *(double *)&block[6] = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async((dispatch_queue_t)v7, block);
}

void __43__OITSUDelayTimer_afterDelay_processBlock___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _isCancelled];
  if ([*(id *)(a1 + 32) _dispatchTimer])
  {
    int v3 = [*(id *)(a1 + 32) automaticallyCancelPendingBlockUponSchedulingNewBlock];
    v4 = *(void **)(a1 + 32);
    if (!v3)
    {
      NSLog((NSString *)@"[warning]: %@: Ignoring block scheduled for execution %.2f seconds from now.", v4, *(void *)(a1 + 48));
      return;
    }
    [v4 _reallyCancel];
  }
  if ((v2 & 1) == 0)
  {
    v5 = [*(id *)(a1 + 32) _dispatchQueue];
    id v6 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v5);
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __43__OITSUDelayTimer_afterDelay_processBlock___block_invoke_2;
    handler[3] = &unk_264D61168;
    long long v9 = *(_OWORD *)(a1 + 32);
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v6);
    [*(id *)(a1 + 32) _setDispatchTimer:v6];
    dispatch_release(v6);
  }
}

uint64_t __43__OITSUDelayTimer_afterDelay_processBlock___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  char v2 = *(void **)(a1 + 32);
  return [v2 _reallyCancel];
}

- (void)_reallyCancel
{
  int v3 = [(OITSUDelayTimer *)self _dispatchTimer];
  if (v3)
  {
    dispatch_source_cancel((dispatch_source_t)v3);
    [(OITSUDelayTimer *)self _setDispatchTimer:0];
  }
}

- (void)cancel
{
  [(OITSUDelayTimer *)self _setCancelled:1];
  int v3 = [(OITSUDelayTimer *)self _dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__OITSUDelayTimer_cancel__block_invoke;
  block[3] = &unk_264D60B18;
  block[4] = self;
  dispatch_async((dispatch_queue_t)v3, block);
}

uint64_t __25__OITSUDelayTimer_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reallyCancel];
}

- (BOOL)automaticallyCancelPendingBlockUponSchedulingNewBlock
{
  return self->_automaticallyCancelPendingBlockUponSchedulingNewBlock;
}

- (void)setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:(BOOL)a3
{
  self->_automaticallyCancelPendingBlockUponSchedulingNewBlock = a3;
}

- (OS_dispatch_queue)_dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)_setDispatchQueue:(id)a3
{
}

- (OS_dispatch_source)_dispatchTimer
{
  return self->_dispatchTimer;
}

- (void)_setDispatchTimer:(id)a3
{
}

- (BOOL)_isCancelled
{
  return self->_cancelled;
}

- (void)_setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

@end