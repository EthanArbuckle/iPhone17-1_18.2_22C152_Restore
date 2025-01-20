@interface ICSelectorDelayer
- (BOOL)callOnMainThread;
- (BOOL)isScheduledToFire;
- (BOOL)waitToFireUntilRequestsStop;
- (ICSelectorDelayer)initWithTarget:(id)a3 selector:(SEL)a4 delay:(double)a5 maximumDelay:(double)a6 callOnMainThread:(BOOL)a7;
- (ICSelectorDelayer)initWithTarget:(id)a3 selector:(SEL)a4 delay:(double)a5 maximumDelay:(double)a6 waitToFireUntilRequestsStop:(BOOL)a7 callOnMainThread:(BOOL)a8;
- (ICSelectorDelayer)initWithTarget:(id)a3 selector:(SEL)a4 delay:(double)a5 waitToFireUntilRequestsStop:(BOOL)a6 callOnMainThread:(BOOL)a7;
- (NSDate)requestFireDate;
- (OS_dispatch_queue)backgroundQueue;
- (OS_dispatch_queue)requestQueue;
- (SEL)selector;
- (double)delay;
- (double)maximumDelay;
- (id)fireBlock;
- (id)target;
- (void)_cancelFireRequests;
- (void)callTargetSelector;
- (void)cancelPreviousFireRequests;
- (void)dealloc;
- (void)fireImmediately;
- (void)requestFire;
- (void)setBackgroundQueue:(id)a3;
- (void)setCallOnMainThread:(BOOL)a3;
- (void)setDelay:(double)a3;
- (void)setFireBlock:(id)a3;
- (void)setMaximumDelay:(double)a3;
- (void)setRequestFireDate:(id)a3;
- (void)setRequestQueue:(id)a3;
- (void)setSelector:(SEL)a3;
- (void)setTarget:(id)a3;
- (void)setWaitToFireUntilRequestsStop:(BOOL)a3;
@end

@implementation ICSelectorDelayer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fireBlock, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_requestFireDate, 0);
  objc_destroyWeak(&self->_target);
}

void __32__ICSelectorDelayer_requestFire__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained requestQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__ICSelectorDelayer_requestFire__block_invoke_3;
    block[3] = &unk_2640CD3A8;
    id v4 = v2;
    id v6 = v4;
    dispatch_sync(v3, block);

    [v4 callTargetSelector];
  }
}

- (void)callTargetSelector
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = NSStringFromSelector((SEL)[a1 selector]);
  v5 = [a1 target];
  int v6 = 138412546;
  v7 = v4;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_20C263000, a2, OS_LOG_TYPE_ERROR, "Could not get method for selector %@ on target %@", (uint8_t *)&v6, 0x16u);
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (void)_cancelFireRequests
{
  v3 = [(ICSelectorDelayer *)self fireBlock];

  if (v3)
  {
    id v4 = [(ICSelectorDelayer *)self fireBlock];
    dispatch_block_cancel(v4);

    [(ICSelectorDelayer *)self setFireBlock:0];
  }
}

void __38__ICSelectorDelayer_isScheduledToFire__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) fireBlock];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

void __32__ICSelectorDelayer_requestFire__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) requestFireDate];
  if (v2)
  {
    [*(id *)(a1 + 32) setRequestFireDate:v2];
  }
  else
  {
    v3 = [MEMORY[0x263EFF910] now];
    [*(id *)(a1 + 32) setRequestFireDate:v3];
  }
  int v4 = [*(id *)(a1 + 32) waitToFireUntilRequestsStop];
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    [v5 maximumDelay];
    if (v6 == 0.0)
    {
      BOOL v12 = 0;
      BOOL v13 = 1;
    }
    else
    {
      v7 = [MEMORY[0x263EFF910] now];
      __int16 v8 = [*(id *)(a1 + 32) requestFireDate];
      [v7 timeIntervalSinceDate:v8];
      double v10 = v9;
      [*(id *)(a1 + 32) maximumDelay];
      BOOL v12 = v10 > v11;
      BOOL v13 = v10 <= v11;
    }
    v15 = [*(id *)(a1 + 32) fireBlock];

    if (v15)
    {
      [*(id *)(a1 + 32) _cancelFireRequests];
      if (v13) {
        goto LABEL_12;
      }
LABEL_18:
      if (!v12) {
        return;
      }
      goto LABEL_19;
    }
    if (!v13) {
      goto LABEL_18;
    }
  }
  else
  {
    v14 = [v5 fireBlock];

    if (v14) {
      return;
    }
    LOBYTE(v12) = 0;
  }
LABEL_12:
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__ICSelectorDelayer_requestFire__block_invoke_2;
  block[3] = &unk_2640CD4C0;
  objc_copyWeak(&v24, &location);
  dispatch_block_t v16 = dispatch_block_create((dispatch_block_flags_t)0, block);
  [*(id *)(a1 + 32) setFireBlock:v16];

  if ([*(id *)(a1 + 32) callOnMainThread])
  {
    v17 = MEMORY[0x263EF83A0];
    id v18 = MEMORY[0x263EF83A0];
  }
  else
  {
    v17 = [*(id *)(a1 + 32) backgroundQueue];
  }
  [*(id *)(a1 + 32) delay];
  dispatch_time_t v20 = dispatch_time(0, (uint64_t)(v19 * 1000000000.0));
  v21 = [*(id *)(a1 + 32) fireBlock];
  dispatch_after(v20, v17, v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
  if (v12)
  {
LABEL_19:
    if ([*(id *)(a1 + 32) callOnMainThread])
    {
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __32__ICSelectorDelayer_requestFire__block_invoke_4;
      v22[3] = &unk_2640CD3A8;
      v22[4] = *(void *)(a1 + 32);
      dispatch_async(MEMORY[0x263EF83A0], v22);
    }
    else
    {
      [*(id *)(a1 + 32) callTargetSelector];
    }
  }
}

- (id)fireBlock
{
  return self->_fireBlock;
}

- (void)setRequestFireDate:(id)a3
{
}

- (NSDate)requestFireDate
{
  return self->_requestFireDate;
}

- (BOOL)waitToFireUntilRequestsStop
{
  return self->_waitToFireUntilRequestsStop;
}

- (void)setFireBlock:(id)a3
{
}

- (double)maximumDelay
{
  return self->_maximumDelay;
}

- (double)delay
{
  return self->_delay;
}

- (BOOL)callOnMainThread
{
  return self->_callOnMainThread;
}

- (OS_dispatch_queue)backgroundQueue
{
  backgroundQueue = self->_backgroundQueue;
  if (backgroundQueue)
  {
    v3 = backgroundQueue;
  }
  else
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    double v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_DEFAULT, 0);

    v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.notes.selector-delayer-background", v6);
    __int16 v8 = self->_backgroundQueue;
    self->_backgroundQueue = v7;

    v3 = self->_backgroundQueue;
  }
  return v3;
}

- (void)dealloc
{
  v3 = [(ICSelectorDelayer *)self requestQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__ICSelectorDelayer_dealloc__block_invoke;
  block[3] = &unk_2640CD3A8;
  void block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)ICSelectorDelayer;
  [(ICSelectorDelayer *)&v4 dealloc];
}

- (BOOL)isScheduledToFire
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(ICSelectorDelayer *)self requestQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__ICSelectorDelayer_isScheduledToFire__block_invoke;
  v5[3] = &unk_2640CD2F8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)requestFire
{
  v3 = [(ICSelectorDelayer *)self requestQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__ICSelectorDelayer_requestFire__block_invoke;
  block[3] = &unk_2640CD3A8;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (ICSelectorDelayer)initWithTarget:(id)a3 selector:(SEL)a4 delay:(double)a5 maximumDelay:(double)a6 waitToFireUntilRequestsStop:(BOOL)a7 callOnMainThread:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v14 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICSelectorDelayer;
  v15 = [(ICSelectorDelayer *)&v20 init];
  dispatch_block_t v16 = v15;
  if (v15)
  {
    [(ICSelectorDelayer *)v15 setTarget:v14];
    [(ICSelectorDelayer *)v16 setSelector:a4];
    [(ICSelectorDelayer *)v16 setDelay:a5];
    [(ICSelectorDelayer *)v16 setMaximumDelay:a6];
    [(ICSelectorDelayer *)v16 setWaitToFireUntilRequestsStop:v9];
    [(ICSelectorDelayer *)v16 setCallOnMainThread:v8];
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.notes.coalescer.requests", v17);
    [(ICSelectorDelayer *)v16 setRequestQueue:v18];
  }
  return v16;
}

- (void)setMaximumDelay:(double)a3
{
  self->_maximumDelay = a3;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (void)setWaitToFireUntilRequestsStop:(BOOL)a3
{
  self->_waitToFireUntilRequestsStop = a3;
}

- (void)setTarget:(id)a3
{
}

- (void)setSelector:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_selector = v3;
}

- (void)setRequestQueue:(id)a3
{
}

- (void)setCallOnMainThread:(BOOL)a3
{
  self->_callOnMainThread = a3;
}

uint64_t __28__ICSelectorDelayer_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelFireRequests];
}

- (ICSelectorDelayer)initWithTarget:(id)a3 selector:(SEL)a4 delay:(double)a5 waitToFireUntilRequestsStop:(BOOL)a6 callOnMainThread:(BOOL)a7
{
  return [(ICSelectorDelayer *)self initWithTarget:a3 selector:a4 delay:a6 maximumDelay:a7 waitToFireUntilRequestsStop:a5 callOnMainThread:0.0];
}

uint64_t __32__ICSelectorDelayer_requestFire__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFireBlock:0];
}

- (ICSelectorDelayer)initWithTarget:(id)a3 selector:(SEL)a4 delay:(double)a5 maximumDelay:(double)a6 callOnMainThread:(BOOL)a7
{
  return [(ICSelectorDelayer *)self initWithTarget:a3 selector:a4 delay:1 maximumDelay:a7 waitToFireUntilRequestsStop:a5 callOnMainThread:a6];
}

uint64_t __47__ICSelectorDelayer_cancelPreviousFireRequests__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelFireRequests];
}

- (void)cancelPreviousFireRequests
{
  v3 = [(ICSelectorDelayer *)self requestQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__ICSelectorDelayer_cancelPreviousFireRequests__block_invoke;
  block[3] = &unk_2640CD3A8;
  void block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __32__ICSelectorDelayer_requestFire__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) callTargetSelector];
}

- (void)fireImmediately
{
  v3 = [(ICSelectorDelayer *)self requestQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__ICSelectorDelayer_fireImmediately__block_invoke;
  block[3] = &unk_2640CD3A8;
  void block[4] = self;
  dispatch_sync(v3, block);

  if ([(ICSelectorDelayer *)self callOnMainThread]
    && ([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __36__ICSelectorDelayer_fireImmediately__block_invoke_2;
    v4[3] = &unk_2640CD3A8;
    v4[4] = self;
    dispatch_sync(MEMORY[0x263EF83A0], v4);
  }
  else
  {
    [(ICSelectorDelayer *)self callTargetSelector];
  }
}

uint64_t __36__ICSelectorDelayer_fireImmediately__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelFireRequests];
}

uint64_t __36__ICSelectorDelayer_fireImmediately__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) callTargetSelector];
}

- (void)setBackgroundQueue:(id)a3
{
}

@end