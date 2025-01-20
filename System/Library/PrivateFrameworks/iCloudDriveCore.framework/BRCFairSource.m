@interface BRCFairSource
- (BRCFairSource)initWithName:(id)a3 scheduler:(id)a4;
- (OS_dispatch_workloop)workloop;
- (id)description;
- (id)eventHandler;
- (void)_runEventHandler;
- (void)cancel;
- (void)resume;
- (void)setEventHandler:(id)a3;
- (void)setWorkloop:(id)a3;
- (void)signal;
- (void)suspend;
@end

@implementation BRCFairSource

- (BRCFairSource)initWithName:(id)a3 scheduler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRCFairSource;
  v9 = [(BRCFairSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeWeak((id *)&v10->_scheduler, v8);
    [v8 addSource:v10];
    v10->_suspendCount = 1;
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  name = self->_name;
  workloop = self->_workloop;
  if (workloop) {
    label = dispatch_queue_get_label(workloop);
  }
  else {
    label = "(no-queue)";
  }
  return (id)[v3 stringWithFormat:@"<%@:%p %@ on:%s>", v4, self, name, label];
}

- (void)signal
{
  v2 = self;
  objc_sync_enter(v2);
  v2->_signaled = 1;
  int suspendCount = v2->_suspendCount;
  objc_sync_exit(v2);

  if (suspendCount <= 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v2->_scheduler);
    [WeakRetained signalSourceForBitIndex:v2->_schedulerBitIndex];
  }
}

- (void)_runEventHandler
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workloop);
  obj = self;
  objc_sync_enter(obj);
  if (obj->_suspendCount > 0 || obj->_cancelled)
  {
    objc_sync_exit(obj);
  }
  else
  {
    obj->_signaled = 0;
    objc_sync_exit(obj);

    obj = [(BRCFairSource *)obj eventHandler];
    ((void (*)(void))obj->_name)();
  }
}

- (void)cancel
{
  obj = self;
  objc_sync_enter(obj);
  obj->_cancelled = 1;
  objc_sync_exit(obj);
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
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _suspendCount > 0%@", (uint8_t *)&v2, 0xCu);
}

- (OS_dispatch_workloop)workloop
{
  return self->_workloop;
}

- (void)setWorkloop:(id)a3
{
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_destroyWeak((id *)&self->_scheduler);
  objc_storeStrong((id *)&self->_name, 0);
}

@end