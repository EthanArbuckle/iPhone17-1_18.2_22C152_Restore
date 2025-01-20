@interface BRCDeadlineSource
- (BOOL)willRunEvenHandler;
- (BRCDeadlineSource)initWithScheduler:(id)a3 name:(id)a4;
- (OS_dispatch_workloop)workloop;
- (id)description;
- (id)eventHandler;
- (void)cancel;
- (void)resume;
- (void)runEventHandler;
- (void)setEventHandler:(id)a3;
- (void)setWorkloop:(id)a3;
- (void)signal;
- (void)signalWithDeadline:(int64_t)a3;
- (void)suspend;
@end

@implementation BRCDeadlineSource

- (BRCDeadlineSource)initWithScheduler:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BRCDeadlineSource;
  v8 = [(BRCDeadlineSource *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_scheduler, v6);
    v10 = [v6 fairScheduler];
    uint64_t v11 = [v10 workloop];
    workloop = v9->_workloop;
    v9->_workloop = (OS_dispatch_workloop *)v11;

    v9->_deadline = 0x7FFFFFFFFFFFFFFFLL;
    v9->_suspendCount = 1;
    objc_storeStrong((id *)&v9->_name, a4);
  }

  return v9;
}

- (id)description
{
  int64_t deadline = self->_deadline;
  brc_current_date_nsec();
  if (brc_is_before_deadline())
  {
    v4 = @"ready";
  }
  else if (deadline == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = @"idle";
  }
  else
  {
    v5 = NSString;
    brc_interval_from_nsec();
    objc_msgSend(v5, "stringWithFormat:", @"ready in %.3fs", v6);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  id v7 = [NSString stringWithFormat:@"<deadline %@: %@>", self->_name, v4];

  return v7;
}

- (void)suspend
{
  obj = self;
  objc_sync_enter(obj);
  ++obj->_suspendCount;
  objc_sync_exit(obj);
}

- (void)resume
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _suspendCount >= 0%@", (uint8_t *)&v2, 0xCu);
}

- (void)cancel
{
  obj = self;
  objc_sync_enter(obj);
  obj->_cancelled = 1;
  objc_sync_exit(obj);
}

- (BOOL)willRunEvenHandler
{
  int v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_suspendCount <= 0 && !v2->_cancelled;
  objc_sync_exit(v2);

  return v3;
}

- (void)runEventHandler
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workloop);
  obj = (void (**)(void))objc_loadWeakRetained((id *)&self->_scheduler);
  objc_sync_enter(obj);
  BOOL v3 = self;
  objc_sync_enter(v3);
  if (v3->_suspendCount > 0 || v3->_cancelled)
  {
    v3->_signaled = 1;
    v3->_int64_t deadline = 0;
    objc_sync_exit(v3);

    objc_sync_exit(obj);
  }
  else
  {
    v3->_signaled = 0;
    v3->_int64_t deadline = 0x7FFFFFFFFFFFFFFFLL;
    objc_sync_exit(v3);

    objc_sync_exit(obj);
    obj = [(BRCDeadlineSource *)v3 eventHandler];
    obj[2]();
  }
}

- (void)signalWithDeadline:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scheduler);
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v6 = WeakRetained;
    objc_sync_enter(v6);
    id v7 = self;
    objc_sync_enter(v7);
    v7->_signaled = 1;
    objc_sync_exit(v7);

    if (v7->_deadline >= a3)
    {
      v7->_int64_t deadline = a3;
      [v6 addSource:v7 deadline:a3];
    }
    objc_sync_exit(v6);

    id WeakRetained = v8;
  }
}

- (void)signal
{
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (OS_dispatch_workloop)workloop
{
  return self->_workloop;
}

- (void)setWorkloop:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_scheduler);
}

@end