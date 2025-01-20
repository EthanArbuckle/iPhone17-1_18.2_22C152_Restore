@interface NPKLeakyBucket
+ (id)throttleWithEventsTimeInterval:(double)a3 description:(id)a4;
- (BOOL)addEvent:(id)a3;
- (NPKLeakyBucket)initWithEventsTimeInterval:(double)a3 maxBucketSize:(unint64_t)a4 description:(id)a5;
- (double)eventsTimeInterval;
- (unint64_t)maxBucketSize;
- (void)_insideLock_scheduleNextEventLeakFromReferenceDate:(id)a3;
- (void)dealloc;
- (void)flush;
@end

@implementation NPKLeakyBucket

- (NPKLeakyBucket)initWithEventsTimeInterval:(double)a3 maxBucketSize:(unint64_t)a4 description:(id)a5
{
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NPKLeakyBucket;
  v9 = [(NPKLeakyBucket *)&v15 init];
  if (v9)
  {
    if (a3 <= 0.0) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Leak time interval must be bigger than 0.0"];
    }
    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_eventsTimeInterval = a3;
    v9->_maxBucketSize = a4;
    uint64_t v10 = [v8 copy];
    description = v9->_description;
    v9->_description = (NSString *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    events = v9->_events;
    v9->_events = v12;
  }
  return v9;
}

+ (id)throttleWithEventsTimeInterval:(double)a3 description:(id)a4
{
  id v5 = a4;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEventsTimeInterval:0 maxBucketSize:v5 description:a3];

  return v6;
}

- (void)dealloc
{
  [(NSTimer *)self->_eventTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)NPKLeakyBucket;
  [(NPKLeakyBucket *)&v3 dealloc];
}

- (BOOL)addEvent:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  p_lock = &self->_lock;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  uint64_t v10 = __27__NPKLeakyBucket_addEvent___block_invoke;
  v11 = &unk_2644D5028;
  v12 = self;
  id v6 = v4;
  id v13 = v6;
  v14 = &v15;
  v7 = v9;
  os_unfair_lock_lock(p_lock);
  v10((uint64_t)v7);

  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)p_lock;
}

void __27__NPKLeakyBucket_addEvent___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) count];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2
    || (uint64_t v10 = *(void **)(v3 + 24)) != 0
    && ([v10 timeIntervalSinceNow], uint64_t v3 = *(void *)(a1 + 32), *(double *)(v3 + 48) >= -v11))
  {
    if ((unint64_t)[*(id *)(v3 + 8) count] >= *(void *)(*(void *)(a1 + 32) + 56))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      v19 = pk_General_log();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

      if (v20)
      {
        v21 = pk_General_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = *(void *)(a1 + 32);
          uint64_t v23 = *(void *)(v22 + 56);
          uint64_t v24 = *(void *)(v22 + 16);
          int v25 = 134218242;
          uint64_t v26 = v23;
          __int16 v27 = 2112;
          uint64_t v28 = v24;
          _os_log_impl(&dword_21E92F000, v21, OS_LOG_TYPE_DEFAULT, "Notice: Reach size limit of:%lu, dropping income event, bucket:%@", (uint8_t *)&v25, 0x16u);
        }
      }
    }
    else
    {
      id v4 = pk_General_log();
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

      if (v5)
      {
        id v6 = pk_General_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 16);
          int v25 = 138412290;
          uint64_t v26 = v7;
          _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Added event to bucket: %@", (uint8_t *)&v25, 0xCu);
        }
      }
      id v8 = *(void **)(*(void *)(a1 + 32) + 8);
      v9 = (void *)MEMORY[0x223C37380](*(void *)(a1 + 40));
      [v8 addObject:v9];

      if ([*(id *)(*(void *)(a1 + 32) + 8) count] == 1) {
        objc_msgSend(*(id *)(a1 + 32), "_insideLock_scheduleNextEventLeakFromReferenceDate:", *(void *)(*(void *)(a1 + 32) + 24));
      }
    }
  }
  else
  {
    v12 = pk_General_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      v14 = pk_General_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 16);
        int v25 = 138412290;
        uint64_t v26 = v15;
        _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Leaking event immediately bucket: %@", (uint8_t *)&v25, 0xCu);
      }
    }
    uint64_t v16 = [MEMORY[0x263EFF910] now];
    uint64_t v17 = *(void *)(a1 + 32);
    char v18 = *(void **)(v17 + 24);
    *(void *)(v17 + 24) = v16;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)flush
{
  p_lock = &self->_lock;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __23__NPKLeakyBucket_flush__block_invoke;
  v3[3] = &unk_2644D2910;
  v3[4] = self;
  os_unfair_lock_lock(&self->_lock);
  __23__NPKLeakyBucket_flush__block_invoke((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __23__NPKLeakyBucket_flush__block_invoke(uint64_t result)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(result + 32) + 24))
  {
    uint64_t v1 = result;
    uint64_t v2 = pk_General_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      id v4 = pk_General_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(*(void *)(v1 + 32) + 16);
        int v10 = 138412290;
        uint64_t v11 = v5;
        _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Flush bucket:%@", (uint8_t *)&v10, 0xCu);
      }
    }
    uint64_t v6 = *(void *)(v1 + 32);
    uint64_t v7 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = 0;

    [*(id *)(*(void *)(v1 + 32) + 32) invalidate];
    uint64_t v8 = *(void *)(v1 + 32);
    v9 = *(void **)(v8 + 32);
    *(void *)(v8 + 32) = 0;

    return [*(id *)(*(void *)(v1 + 32) + 8) removeAllObjects];
  }
  return result;
}

- (void)_insideLock_scheduleNextEventLeakFromReferenceDate:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = self->_eventTimer == 0;
  uint64_t v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    if (v7)
    {
      int v10 = pk_General_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [(NSMutableArray *)self->_events count];
        description = self->_description;
        *(_DWORD *)buf = 134218242;
        uint64_t v22 = v11;
        __int16 v23 = 2112;
        uint64_t v24 = description;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Scheduling event, pending events:%lu at bucket: %@", buf, 0x16u);
      }
    }
    objc_initWeak((id *)buf, self);
    BOOL v13 = [v4 dateByAddingTimeInterval:self->_eventsTimeInterval];
    [v13 timeIntervalSinceNow];
    double v15 = v14;
    uint64_t v16 = (void *)MEMORY[0x263EFFA20];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __69__NPKLeakyBucket__insideLock_scheduleNextEventLeakFromReferenceDate___block_invoke;
    v19[3] = &unk_2644D6878;
    objc_copyWeak(&v20, (id *)buf);
    v19[4] = self;
    uint64_t v17 = [v16 scheduledTimerWithTimeInterval:0 repeats:v19 block:v15];
    eventTimer = self->_eventTimer;
    self->_eventTimer = v17;

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else if (v7)
  {
    uint64_t v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_description;
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = (uint64_t)v9;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Warning: events timer exist, we will not schedule a new one at bucket:%@", buf, 0xCu);
    }
  }
}

void __69__NPKLeakyBucket__insideLock_scheduleNextEventLeakFromReferenceDate___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = *(void **)&WeakRetained[8]._os_unfair_lock_opaque;
    *(void *)&WeakRetained[8]._os_unfair_lock_opaque = 0;

    BOOL v5 = pk_General_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      BOOL v7 = pk_General_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 8) count];
        uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 16);
        *(_DWORD *)buf = 134218242;
        uint64_t v12 = v8;
        __int16 v13 = 2112;
        uint64_t v14 = v9;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Scheduled eventfire, pending events:%lu at bucket: %@", buf, 0x16u);
      }
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __69__NPKLeakyBucket__insideLock_scheduleNextEventLeakFromReferenceDate___block_invoke_7;
    v10[3] = &unk_2644D2910;
    v10[4] = v3;
    os_unfair_lock_lock(v3 + 10);
    __69__NPKLeakyBucket__insideLock_scheduleNextEventLeakFromReferenceDate___block_invoke_7((uint64_t)v10);
    os_unfair_lock_unlock(v3 + 10);
  }
}

void __69__NPKLeakyBucket__insideLock_scheduleNextEventLeakFromReferenceDate___block_invoke_7(uint64_t a1)
{
  BOOL v5 = [*(id *)(*(void *)(a1 + 32) + 8) firstObject];
  if (v5)
  {
    uint64_t v2 = [MEMORY[0x263EFF910] now];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = v2;

    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectAtIndex:0];
    v5[2]();
  }
  if ([*(id *)(*(void *)(a1 + 32) + 8) count]) {
    objc_msgSend(*(id *)(a1 + 32), "_insideLock_scheduleNextEventLeakFromReferenceDate:", *(void *)(*(void *)(a1 + 32) + 24));
  }
}

- (double)eventsTimeInterval
{
  return self->_eventsTimeInterval;
}

- (unint64_t)maxBucketSize
{
  return self->_maxBucketSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTimer, 0);
  objc_storeStrong((id *)&self->_lastLeakedEventDate, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end