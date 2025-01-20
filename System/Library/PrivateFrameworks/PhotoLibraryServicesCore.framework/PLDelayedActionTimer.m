@interface PLDelayedActionTimer
- (BOOL)isRunning;
- (OS_dispatch_queue)targetQueue;
- (PLDelayedActionTimer)initWithTargetQueue:(id)a3;
- (double)timeRemaining;
- (id)description;
- (void)afterDelay:(double)a3 performBlock:(id)a4;
- (void)cancel;
- (void)dealloc;
@end

@implementation PLDelayedActionTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
}

- (double)timeRemaining
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_timerQueue);
  if (!self->_timer) {
    return 0.0;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return self->_end - v3;
}

- (BOOL)isRunning
{
  return self->_timer != 0;
}

- (OS_dispatch_queue)targetQueue
{
  return self->_timerQueue;
}

- (void)cancel
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_timerQueue);
  timer = self->_timer;
  if (timer)
  {
    self->_timer = 0;
    dispatch_source_t source = timer;

    dispatch_source_cancel(source);
  }
  else
  {
    v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_DEFAULT, "ignoring request to cancel inactive timer", buf, 2u);
    }
  }
}

- (void)afterDelay:(double)a3 performBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_timerQueue);
  if (self->_timer)
  {
    v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      timer = self->_timer;
      *(_DWORD *)buf = 134217984;
      v22 = timer;
      _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_DEFAULT, "ignoring request to start timer while timer is active 0x%p", buf, 0xCu);
    }
  }
  else
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    self->_start = v9;
    self->_delay = a3;
    self->_end = v9 + a3;
    v10 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_timerQueue);
    v11 = self->_timer;
    self->_timer = (OS_dispatch_source *)v10;

    v12 = self->_timer;
    dispatch_time_t v13 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak((id *)buf, self);
    v14 = self->_timer;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __48__PLDelayedActionTimer_afterDelay_performBlock___block_invoke;
    v16[3] = &unk_1E589F138;
    v17 = v10;
    v18 = self;
    v15 = v10;
    objc_copyWeak(&v20, (id *)buf);
    id v19 = v6;
    dispatch_source_set_event_handler(v14, v16);
    dispatch_resume((dispatch_object_t)self->_timer);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
}

uint64_t __48__PLDelayedActionTimer_afterDelay_performBlock___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32) == *(void *)(*(void *)(result + 40) + 16))
  {
    uint64_t v1 = result;
    id WeakRetained = objc_loadWeakRetained((id *)(result + 56));
    [WeakRetained cancel];

    double v3 = *(uint64_t (**)(void))(*(void *)(v1 + 48) + 16);
    return v3();
  }
  return result;
}

- (id)description
{
  timer = self->_timer;
  if (timer)
  {
    v4 = (void *)MEMORY[0x1E4F1C9C8];
    v5 = timer;
    [v4 timeIntervalSinceReferenceDate];
    double v7 = self->_start - v6;
    double v8 = self->_end - v6;
    v13.receiver = self;
    v13.super_class = (Class)PLDelayedActionTimer;
    double v9 = [(PLDelayedActionTimer *)&v13 description];
    v10 = objc_msgSend(v9, "stringByAppendingFormat:", @"(0x%p s:%3.3f e:%3.3f)", v5, *(void *)&v7, *(void *)&v8);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLDelayedActionTimer;
    double v9 = [(PLDelayedActionTimer *)&v12 description];
    v10 = [v9 stringByAppendingFormat:@"(not running)"];
  }

  return v10;
}

- (void)dealloc
{
  double v3 = self->_timer;
  timer = self->_timer;
  self->_timer = 0;

  if (v3) {
    dispatch_source_cancel((dispatch_source_t)v3);
  }

  v5.receiver = self;
  v5.super_class = (Class)PLDelayedActionTimer;
  [(PLDelayedActionTimer *)&v5 dealloc];
}

- (PLDelayedActionTimer)initWithTargetQueue:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PLDelayedActionTimer.m", 23, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PLDelayedActionTimer;
  double v7 = [(PLDelayedActionTimer *)&v11 init];
  double v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_timerQueue, a3);
  }

  return v8;
}

@end