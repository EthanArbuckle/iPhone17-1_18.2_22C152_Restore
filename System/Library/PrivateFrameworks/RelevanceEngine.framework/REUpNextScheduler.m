@interface REUpNextScheduler
+ (REUpNextScheduler)schedulerWithQueue:(id)a3 delay:(double)a4 updateBlock:(id)a5;
+ (REUpNextScheduler)schedulerWithQueue:(id)a3 delay:(double)a4 updateCompletionBlock:(id)a5;
+ (REUpNextScheduler)schedulerWithQueue:(id)a3 updateBlock:(id)a4;
- (BOOL)isScheduled;
- (BOOL)performImmediately;
- (OS_dispatch_queue)queue;
- (REUpNextScheduler)initWithQueue:(id)a3 delay:(double)a4 updateBlock:(id)a5 updateCompletionBlock:(id)a6;
- (double)delay;
- (id)updateBlock;
- (id)updateCompletionBlock;
- (void)_queue_performUpdate;
- (void)dealloc;
- (void)schedule;
@end

@implementation REUpNextScheduler

+ (REUpNextScheduler)schedulerWithQueue:(id)a3 delay:(double)a4 updateBlock:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [[REUpNextScheduler alloc] initWithQueue:v8 delay:v7 updateBlock:0 updateCompletionBlock:a4];

  return v9;
}

- (REUpNextScheduler)initWithQueue:(id)a3 delay:(double)a4 updateBlock:(id)a5 updateCompletionBlock:(id)a6
{
  v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)REUpNextScheduler;
  v14 = [(REUpNextScheduler *)&v24 init];
  v15 = v14;
  if (v14)
  {
    v14->_scheduledLock._os_unfair_lock_opaque = 0;
    v14->_updateScheduled = 0;
    dispatch_queue_set_specific(v11, v14, v14, 0);
    objc_storeStrong((id *)&v15->_originalQueue, a3);
    objc_msgSend(NSString, "stringWithFormat:", @"%s.REScheduler", dispatch_queue_get_label(v11));
    id v16 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v17 = dispatch_queue_create_with_target_V2((const char *)[v16 UTF8String], 0, v11);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v17;

    v15->_delay = a4;
    uint64_t v19 = [v12 copy];
    id updateBlock = v15->_updateBlock;
    v15->_id updateBlock = (id)v19;

    uint64_t v21 = [v13 copy];
    id updateCompletionBlock = v15->_updateCompletionBlock;
    v15->_id updateCompletionBlock = (id)v21;
  }
  return v15;
}

- (void)schedule
{
  p_scheduledLock = &self->_scheduledLock;
  os_unfair_lock_lock(&self->_scheduledLock);
  BOOL updateScheduled = self->_updateScheduled;
  self->_BOOL updateScheduled = 1;
  os_unfair_lock_unlock(p_scheduledLock);
  if (!updateScheduled)
  {
    objc_initWeak(&location, self);
    double delay = self->_delay;
    if (delay <= 0.0)
    {
      queue = self->_queue;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __29__REUpNextScheduler_schedule__block_invoke_2;
      v10[3] = &unk_2644BC638;
      id v8 = &v11;
      objc_copyWeak(&v11, &location);
      dispatch_async(queue, v10);
    }
    else
    {
      dispatch_time_t v6 = dispatch_time(0, (uint64_t)(delay * 1000000000.0));
      id v7 = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __29__REUpNextScheduler_schedule__block_invoke;
      block[3] = &unk_2644BC638;
      id v8 = &v13;
      objc_copyWeak(&v13, &location);
      dispatch_after(v6, v7, block);
    }
    objc_destroyWeak(v8);
    objc_destroyWeak(&location);
  }
}

void __29__REUpNextScheduler_schedule__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_performUpdate");
}

- (void)_queue_performUpdate
{
  if ([(REUpNextScheduler *)self isScheduled])
  {
    os_unfair_lock_lock(&self->_scheduledLock);
    self->_BOOL updateScheduled = 0;
    os_unfair_lock_unlock(&self->_scheduledLock);
    id updateCompletionBlock = self->_updateCompletionBlock;
    if (updateCompletionBlock)
    {
      v4 = (void (*)(void))*((void *)updateCompletionBlock + 2);
      v4();
    }
    else
    {
      id updateBlock = self->_updateBlock;
      if (updateBlock)
      {
        dispatch_time_t v6 = (void (*)(void))*((void *)updateBlock + 2);
        v6();
      }
    }
  }
}

- (BOOL)isScheduled
{
  v2 = self;
  p_scheduledLock = &self->_scheduledLock;
  os_unfair_lock_lock(&self->_scheduledLock);
  LOBYTE(v2) = v2->_updateScheduled;
  os_unfair_lock_unlock(p_scheduledLock);
  return (char)v2;
}

+ (REUpNextScheduler)schedulerWithQueue:(id)a3 delay:(double)a4 updateCompletionBlock:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [[REUpNextScheduler alloc] initWithQueue:v8 delay:0 updateBlock:v7 updateCompletionBlock:a4];

  return v9;
}

+ (REUpNextScheduler)schedulerWithQueue:(id)a3 updateBlock:(id)a4
{
  return (REUpNextScheduler *)[a1 schedulerWithQueue:a3 delay:a4 updateBlock:0.0];
}

- (void)dealloc
{
  dispatch_queue_set_specific((dispatch_queue_t)self->_originalQueue, self, 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)REUpNextScheduler;
  [(REUpNextScheduler *)&v3 dealloc];
}

- (BOOL)performImmediately
{
  specific = (REUpNextScheduler *)dispatch_get_specific(self);
  if (specific == self)
  {
    [(REUpNextScheduler *)self _queue_performUpdate];
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__REUpNextScheduler_performImmediately__block_invoke;
    block[3] = &unk_2644BC660;
    void block[4] = self;
    dispatch_async(queue, block);
  }
  return specific == self;
}

uint64_t __39__REUpNextScheduler_performImmediately__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_performUpdate");
}

void __29__REUpNextScheduler_schedule__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_performUpdate");
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (double)delay
{
  return self->_delay;
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (id)updateCompletionBlock
{
  return self->_updateCompletionBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateCompletionBlock, 0);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_originalQueue, 0);
}

@end