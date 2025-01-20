@interface UIKeyboardScheduledTask
- (BOOL)isValid;
- (BOOL)repeats;
- (NSTimer)timer;
- (UIKeyboardScheduledTask)initWithTaskQueue:(id)a3 timeInterval:(double)a4 repeats:(BOOL)a5 task:(id)a6 breadcrumb:(id)a7;
- (UIKeyboardTaskQueue)taskQueue;
- (_UIActionWhenIdle)deferredAction;
- (double)timeInterval;
- (id)breadcrumb;
- (id)enqueuedTask;
- (id)task;
- (void)dealloc;
- (void)handleDeferredTimerFiredEvent;
- (void)invalidate;
- (void)resetTimer;
- (void)setBreadcrumb:(id)a3;
- (void)setDeferredAction:(id)a3;
- (void)setEnqueuedTask:(id)a3;
- (void)setTimer:(id)a3;
- (void)timerFired:(id)a3;
@end

@implementation UIKeyboardScheduledTask

- (void)dealloc
{
  [(_UIActionWhenIdle *)self->_deferredAction invalidate];
  [(NSTimer *)self->_timer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardScheduledTask;
  [(UIKeyboardScheduledTask *)&v3 dealloc];
}

- (UIKeyboardScheduledTask)initWithTaskQueue:(id)a3 timeInterval:(double)a4 repeats:(BOOL)a5 task:(id)a6 breadcrumb:(id)a7
{
  BOOL v9 = a5;
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)UIKeyboardScheduledTask;
  v16 = [(UIKeyboardScheduledTask *)&v24 init];
  v17 = v16;
  if (v16)
  {
    v16->_timeInterval = a4;
    uint64_t v18 = [v14 copy];
    id task = v17->_task;
    v17->_id task = (id)v18;

    objc_storeStrong((id *)&v17->_taskQueue, a3);
    uint64_t v20 = [v15 copy];
    id breadcrumb = v17->_breadcrumb;
    v17->_id breadcrumb = (id)v20;

    v22 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:v17 target:sel_timerFired_ selector:0 userInfo:v9 repeats:a4];
    [(UIKeyboardScheduledTask *)v17 setTimer:v22];
  }
  return v17;
}

- (BOOL)repeats
{
  v2 = [(UIKeyboardScheduledTask *)self timer];
  [v2 timeInterval];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (void)timerFired:(id)a3
{
  id v5 = [(UIKeyboardScheduledTask *)self deferredAction];
  if (([v5 isValid] & 1) == 0)
  {
    BOOL v4 = [(UIKeyboardScheduledTask *)self enqueuedTask];

    if (v4) {
      return;
    }
    id v5 = +[_UIActionWhenIdle actionWhenIdleWithTarget:self selector:sel_handleDeferredTimerFiredEvent object:0];
    -[UIKeyboardScheduledTask setDeferredAction:](self, "setDeferredAction:");
  }
}

- (void)handleDeferredTimerFiredEvent
{
  objc_initWeak(&location, self);
  uint64_t v8 = 0;
  BOOL v9 = (id *)&v8;
  uint64_t v10 = 0x3042000000;
  v11 = __Block_byref_object_copy__135;
  v12 = __Block_byref_object_dispose__135;
  id v13 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__UIKeyboardScheduledTask_handleDeferredTimerFiredEvent__block_invoke;
  aBlock[3] = &unk_1E52FD098;
  objc_copyWeak(&v7, &location);
  aBlock[4] = &v8;
  double v3 = _Block_copy(aBlock);
  objc_storeWeak(v9 + 5, v3);
  [(UIKeyboardScheduledTask *)self setEnqueuedTask:v3];
  BOOL v4 = [(UIKeyboardScheduledTask *)self taskQueue];
  id v5 = [(UIKeyboardScheduledTask *)self breadcrumb];
  [v4 addTask:v3 breadcrumb:v5];

  objc_destroyWeak(&v7);
  _Block_object_dispose(&v8, 8);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __56__UIKeyboardScheduledTask_handleDeferredTimerFiredEvent__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  if (WeakRetained
    && ([WeakRetained enqueuedTask],
        id v5 = (id)objc_claimAutoreleasedReturnValue(),
        v5,
        v4 == v5)
    && ([WeakRetained task],
        v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(),
        [WeakRetained setEnqueuedTask:0],
        v6))
  {
    ((void (**)(void, id))v6)[2](v6, v7);
  }
  else
  {
    [v7 returnExecutionToParent];
  }
}

- (BOOL)isValid
{
  double v3 = [(UIKeyboardScheduledTask *)self timer];
  if ([v3 isValid])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(UIKeyboardScheduledTask *)self deferredAction];
    if ([v5 isValid])
    {
      BOOL v4 = 1;
    }
    else
    {
      v6 = [(UIKeyboardScheduledTask *)self enqueuedTask];
      BOOL v4 = v6 != 0;
    }
  }

  return v4;
}

- (void)invalidate
{
  BOOL v4 = self;
  v2 = [(UIKeyboardScheduledTask *)v4 timer];
  [v2 invalidate];

  [(UIKeyboardScheduledTask *)v4 setTimer:0];
  double v3 = [(UIKeyboardScheduledTask *)v4 deferredAction];
  [v3 invalidate];

  [(UIKeyboardScheduledTask *)v4 setDeferredAction:0];
  [(UIKeyboardScheduledTask *)v4 setEnqueuedTask:0];
}

- (void)resetTimer
{
  if (pthread_main_np() != 1)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIKeyboardTaskQueue.m", 854, @"%s may only be called from the main thread.", "-[UIKeyboardScheduledTask resetTimer]");
  }
  if ([(UIKeyboardScheduledTask *)self isValid])
  {
    BOOL v4 = [(UIKeyboardScheduledTask *)self timer];
    int v5 = [v4 isValid];

    if (v5)
    {
      v6 = [(UIKeyboardScheduledTask *)self timer];
      id v7 = (void *)MEMORY[0x1E4F1C9C8];
      [(UIKeyboardScheduledTask *)self timeInterval];
      uint64_t v8 = objc_msgSend(v7, "dateWithTimeIntervalSinceNow:");
      [v6 setFireDate:v8];
    }
    else
    {
      BOOL v9 = (void *)MEMORY[0x1E4F1CB00];
      [(UIKeyboardScheduledTask *)self timeInterval];
      v6 = objc_msgSend(v9, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_timerFired_, 0, -[UIKeyboardScheduledTask repeats](self, "repeats"), v10);
      [(UIKeyboardScheduledTask *)self setTimer:v6];
    }

    v11 = [(UIKeyboardScheduledTask *)self deferredAction];
    [v11 invalidate];

    [(UIKeyboardScheduledTask *)self setDeferredAction:0];
    [(UIKeyboardScheduledTask *)self setEnqueuedTask:0];
  }
}

- (id)task
{
  return self->_task;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (UIKeyboardTaskQueue)taskQueue
{
  return self->_taskQueue;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (_UIActionWhenIdle)deferredAction
{
  return self->_deferredAction;
}

- (void)setDeferredAction:(id)a3
{
}

- (id)enqueuedTask
{
  return self->_enqueuedTask;
}

- (void)setEnqueuedTask:(id)a3
{
}

- (id)breadcrumb
{
  return self->_breadcrumb;
}

- (void)setBreadcrumb:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_breadcrumb, 0);
  objc_storeStrong(&self->_enqueuedTask, 0);
  objc_storeStrong((id *)&self->_deferredAction, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong(&self->_task, 0);
}

@end