@interface RBPLEventQueue
- (RBPLEventQueue)init;
- (id)dequeueEvent;
- (void)enqueueEvent:(id)a3;
- (void)scheduleWork;
@end

@implementation RBPLEventQueue

- (void)enqueueEvent:(id)a3
{
  if (MEMORY[0x263F5F608])
  {
    p_lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    [(NSMutableArray *)self->_eventQueue addObject:v5];

    if (!self->_scheduled)
    {
      self->_scheduled = 1;
      [(RBPLEventQueue *)self scheduleWork];
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)scheduleWork
{
  if (MEMORY[0x263F5F608]) {
    RBSDispatchAsyncWithQoS();
  }
}

- (id)dequeueEvent
{
  if (MEMORY[0x263F5F608])
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if ([(NSMutableArray *)self->_eventQueue count])
    {
      v4 = [(NSMutableArray *)self->_eventQueue firstObject];
      [(NSMutableArray *)self->_eventQueue removeObjectAtIndex:0];
    }
    else
    {
      v4 = 0;
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

void __30__RBPLEventQueue_scheduleWork__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = [*(id *)(a1 + 32) dequeueEvent];
  if (v2)
  {
    v3 = (void *)v2;
    do
    {
      uint64_t v4 = [v3 event];
      id v5 = [v3 identity];
      uint64_t v6 = [v3 assertionCount];
      uint64_t v7 = [v3 pid];
      v8 = [v5 hostIdentifier];
      v9 = objc_opt_new();
      v10 = [NSNumber numberWithUnsignedInteger:v4];
      [v9 setObject:v10 forKeyedSubscript:@"EventType"];

      if (v7 == -1)
      {
        [v9 setObject:0 forKeyedSubscript:@"PID"];
        if (!v8)
        {
LABEL_7:
          [v9 setObject:0 forKeyedSubscript:@"HostPID"];
          goto LABEL_8;
        }
      }
      else
      {
        v11 = [NSNumber numberWithInt:v7];
        [v9 setObject:v11 forKeyedSubscript:@"PID"];

        if (!v8) {
          goto LABEL_7;
        }
      }
      v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "pid"));
      [v9 setObject:v12 forKeyedSubscript:@"HostPID"];

LABEL_8:
      v13 = [v5 embeddedApplicationIdentifier];
      [v9 setObject:v13 forKeyedSubscript:@"BundleID"];

      if ((v6 & 0x80000000) != 0)
      {
        [v9 setObject:0 forKeyedSubscript:@"AssertionCount"];
      }
      else
      {
        v14 = [NSNumber numberWithInt:v6];
        [v9 setObject:v14 forKeyedSubscript:@"AssertionCount"];
      }
      if (MEMORY[0x263F5F608]) {
        PLLogRegisteredEvent();
      }

      uint64_t v15 = [*(id *)(a1 + 32) dequeueEvent];

      v3 = (void *)v15;
    }
    while (v15);
  }
}

- (RBPLEventQueue)init
{
  v8.receiver = self;
  v8.super_class = (Class)RBPLEventQueue;
  uint64_t v2 = [(RBPLEventQueue *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v5 = [MEMORY[0x263F64650] createBackgroundQueue:@"RBPowerlogEvent"];
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v2->_scheduled = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
}

@end