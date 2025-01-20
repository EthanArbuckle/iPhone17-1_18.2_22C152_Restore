@interface MSVWatchdog
- (BOOL)running;
- (BOOL)scheduled;
- (MSVWatchdog)init;
- (NSOperationQueue)operationQueue;
- (NSRunLoop)runLoop;
- (NSString)mode;
- (OS_dispatch_queue)dispatchQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (double)interval;
- (double)timeoutInterval;
- (id)timeoutCallback;
- (void)_cancelTimeout;
- (void)_invokeCallback;
- (void)_scheduleTest;
- (void)_scheduleTimeout;
- (void)resume;
- (void)scheduleInDispatchQueue:(id)a3;
- (void)scheduleInOperationQueue:(id)a3;
- (void)scheduleInRunLoop:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterval:(double)a3;
- (void)setMode:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRunLoop:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setScheduled:(BOOL)a3;
- (void)setTimeoutCallback:(id)a3;
- (void)setTimeoutInterval:(double)a3;
- (void)setTimer:(id)a3;
- (void)suspend;
@end

@implementation MSVWatchdog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_runLoop, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong(&self->_timeoutCallback, 0);
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)running
{
  return self->_running;
}

- (void)setScheduled:(BOOL)a3
{
  self->_scheduled = a3;
}

- (BOOL)scheduled
{
  return self->_scheduled;
}

- (void)setRunLoop:(id)a3
{
}

- (NSRunLoop)runLoop
{
  return self->_runLoop;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setMode:(id)a3
{
}

- (NSString)mode
{
  return self->_mode;
}

- (void)setTimeoutCallback:(id)a3
{
}

- (id)timeoutCallback
{
  return self->_timeoutCallback;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (double)interval
{
  return self->_interval;
}

- (void)scheduleInRunLoop:(id)a3
{
  id v7 = a3;
  if ([(MSVWatchdog *)self running])
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"MSVWatchdog.m" lineNumber:146 description:@"Watchdog is already running"];
  }
  if ([(MSVWatchdog *)self scheduled])
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MSVWatchdog.m" lineNumber:147 description:@"Watchdog has already been scheduled"];
  }
  [(MSVWatchdog *)self setRunLoop:v7];
  [(MSVWatchdog *)self setRunning:1];
  [(MSVWatchdog *)self setScheduled:1];
  [(MSVWatchdog *)self _scheduleTest];
}

- (void)scheduleInDispatchQueue:(id)a3
{
  id v7 = a3;
  if ([(MSVWatchdog *)self running])
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"MSVWatchdog.m" lineNumber:136 description:@"Watchdog is already running"];
  }
  if ([(MSVWatchdog *)self scheduled])
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MSVWatchdog.m" lineNumber:137 description:@"Watchdog has already been scheduled"];
  }
  [(MSVWatchdog *)self setDispatchQueue:v7];
  [(MSVWatchdog *)self setRunning:1];
  [(MSVWatchdog *)self setScheduled:1];
  [(MSVWatchdog *)self _scheduleTest];
}

- (void)scheduleInOperationQueue:(id)a3
{
  id v7 = a3;
  if ([(MSVWatchdog *)self running])
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"MSVWatchdog.m" lineNumber:126 description:@"Watchdog is already running"];
  }
  if ([(MSVWatchdog *)self scheduled])
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MSVWatchdog.m" lineNumber:127 description:@"Watchdog has already been scheduled"];
  }
  [(MSVWatchdog *)self setOperationQueue:v7];
  [(MSVWatchdog *)self setRunning:1];
  [(MSVWatchdog *)self setScheduled:1];
  [(MSVWatchdog *)self _scheduleTest];
}

- (void)_scheduleTest
{
  [(MSVWatchdog *)self interval];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  v5 = [(MSVWatchdog *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__MSVWatchdog__scheduleTest__block_invoke;
  block[3] = &unk_1E5ADA860;
  block[4] = self;
  dispatch_after(v4, v5, block);
}

void __28__MSVWatchdog__scheduleTest__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) running])
  {
    [*(id *)(a1 + 32) _scheduleTimeout];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __28__MSVWatchdog__scheduleTest__block_invoke_2;
    v12[3] = &unk_1E5ADA860;
    v12[4] = *(void *)(a1 + 32);
    v2 = (void *)MEMORY[0x1A62426F0](v12);
    double v3 = [*(id *)(a1 + 32) operationQueue];

    if (v3)
    {
      dispatch_time_t v4 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v2];
      v5 = [*(id *)(a1 + 32) operationQueue];
      [v5 addOperation:v4];
    }
    else
    {
      v6 = [*(id *)(a1 + 32) dispatchQueue];

      id v7 = *(void **)(a1 + 32);
      if (v6)
      {
        dispatch_time_t v4 = [v7 dispatchQueue];
        dispatch_async(v4, v2);
      }
      else
      {
        v8 = [v7 runLoop];

        if (!v8)
        {
LABEL_9:

          return;
        }
        v9 = [*(id *)(a1 + 32) runLoop];
        v10 = (__CFRunLoop *)[v9 getCFRunLoop];
        v11 = [*(id *)(a1 + 32) mode];
        CFRunLoopPerformBlock(v10, v11, v2);

        dispatch_time_t v4 = [*(id *)(a1 + 32) runLoop];
        CFRunLoopWakeUp((CFRunLoopRef)[v4 getCFRunLoop]);
      }
    }

    goto LABEL_9;
  }
}

void __28__MSVWatchdog__scheduleTest__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__MSVWatchdog__scheduleTest__block_invoke_3;
  block[3] = &unk_1E5ADA860;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(v2, block);
}

void __28__MSVWatchdog__scheduleTest__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) timer];

  if (v2)
  {
    [*(id *)(a1 + 32) _cancelTimeout];
    double v3 = *(void **)(a1 + 32);
    [v3 _scheduleTest];
  }
}

- (void)_scheduleTimeout
{
  double v3 = [(MSVWatchdog *)self timer];

  if (v3)
  {
    source = [(MSVWatchdog *)self timer];
    [(MSVWatchdog *)self timeoutInterval];
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    dispatch_source_set_timer(source, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

- (void)_invokeCallback
{
  double v3 = [(MSVWatchdog *)self timeoutCallback];

  if (v3)
  {
    double v4 = [(MSVWatchdog *)self timeoutCallback];
    v4[2]();
  }
}

- (void)_cancelTimeout
{
  double v3 = [(MSVWatchdog *)self timer];

  if (v3)
  {
    double v4 = [(MSVWatchdog *)self timer];
    dispatch_source_set_timer(v4, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  }
}

- (void)resume
{
  double v3 = [(MSVWatchdog *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__MSVWatchdog_resume__block_invoke;
  block[3] = &unk_1E5ADA860;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __21__MSVWatchdog_resume__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) scheduled] && (objc_msgSend(*(id *)(a1 + 32), "running") & 1) == 0)
  {
    [*(id *)(a1 + 32) setRunning:1];
    double v4 = *(void **)(a1 + 32);
    return [v4 _scheduleTest];
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) scheduled];
    if ((result & 1) == 0)
    {
      [*(id *)(a1 + 32) setRunning:1];
      double v3 = *(void **)(a1 + 32);
      return [v3 _scheduleTimeout];
    }
  }
  return result;
}

- (void)suspend
{
  double v3 = [(MSVWatchdog *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__MSVWatchdog_suspend__block_invoke;
  block[3] = &unk_1E5ADA860;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __22__MSVWatchdog_suspend__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) running];
  if (result)
  {
    [*(id *)(a1 + 32) _cancelTimeout];
    double v3 = *(void **)(a1 + 32);
    return [v3 setRunning:0];
  }
  return result;
}

- (MSVWatchdog)init
{
  v16.receiver = self;
  v16.super_class = (Class)MSVWatchdog;
  v2 = [(MSVWatchdog *)&v16 init];
  double v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_interval = xmmword_1A312BA70;
    id timeoutCallback = v2->_timeoutCallback;
    v2->_id timeoutCallback = 0;

    objc_storeStrong((id *)&v3->_mode, (id)*MEMORY[0x1E4F1C4B0]);
    dispatch_time_t v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    id v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v3->_queue);
    timer = v3->_timer;
    v3->_timer = (OS_dispatch_source *)v9;

    dispatch_source_set_timer((dispatch_source_t)v3->_timer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    objc_initWeak(&location, v3);
    v11 = v3->_timer;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __19__MSVWatchdog_init__block_invoke;
    v13[3] = &unk_1E5ADA968;
    objc_copyWeak(&v14, &location);
    dispatch_source_set_event_handler(v11, v13);
    dispatch_resume((dispatch_object_t)v3->_timer);
    *(_WORD *)&v3->_scheduled = 0;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __19__MSVWatchdog_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancelTimeout];
  [WeakRetained _invokeCallback];
}

@end