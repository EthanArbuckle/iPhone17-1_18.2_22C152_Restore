@interface MRRateLimiter
- (MRRateLimiter)initWithInterval:(double)a3 name:(id)a4 queue:(id)a5 block:(id)a6;
- (NSString)name;
- (double)interval;
- (void)_updateAlreadyOnQueue:(BOOL)a3;
- (void)update;
@end

@implementation MRRateLimiter

- (MRRateLimiter)initWithInterval:(double)a3 name:(id)a4 queue:(id)a5 block:(id)a6
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MRRateLimiter;
  v15 = [(MRRateLimiter *)&v23 init];
  if (v15)
  {
    if (a3 <= 0.0)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, v15, @"MRPersistentTimer.m", 136, @"Invalid parameter not satisfying: %@", @"interval > 0" object file lineNumber description];
    }
    if ([v12 length])
    {
      if (v13) {
        goto LABEL_6;
      }
    }
    else
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, v15, @"MRPersistentTimer.m", 137, @"Invalid parameter not satisfying: %@", @"name.length > 0" object file lineNumber description];

      if (v13)
      {
LABEL_6:
        if (v14)
        {
LABEL_7:
          v15->_interval = a3;
          objc_storeStrong((id *)&v15->_name, a4);
          objc_storeStrong((id *)&v15->_queue, a5);
          v15->_lock._os_unfair_lock_opaque = 0;
          uint64_t v16 = MEMORY[0x1997190F0](v14);
          id block = v15->_block;
          v15->_id block = (id)v16;

          goto LABEL_8;
        }
LABEL_11:
        v22 = [MEMORY[0x1E4F28B00] currentHandler];
        [v22 handleFailureInMethod:a2, v15, @"MRPersistentTimer.m", 139, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

        goto LABEL_7;
      }
    }
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, v15, @"MRPersistentTimer.m", 138, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

    if (v14) {
      goto LABEL_7;
    }
    goto LABEL_11;
  }
LABEL_8:

  return v15;
}

- (void)update
{
}

- (void)_updateAlreadyOnQueue:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x1E4F1C9C8] now];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [v5 timeIntervalSinceDate:self->_lastNotificationDate];
  if (self->_lastNotificationDate && (double v8 = v7, v7 < self->_interval))
  {
    if (!self->_wasUpdatedDuringInterval)
    {
      self->_wasUpdatedDuringInterval = 1;
      objc_initWeak(&location, self);
      dispatch_time_t v9 = dispatch_time(0, (uint64_t)((self->_interval - v8) * 1000000000.0));
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __39__MRRateLimiter__updateAlreadyOnQueue___block_invoke;
      block[3] = &unk_1E57D12D0;
      objc_copyWeak(&v17, &location);
      dispatch_after(v9, queue, block);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v11 = (void (**)(void))[self->_block copy];
    objc_storeStrong((id *)&self->_lastNotificationDate, v5);
    self->_wasUpdatedDuringInterval = 0;
    os_unfair_lock_unlock(&self->_lock);
    if (v11)
    {
      if (v3)
      {
        v11[2](v11);
      }
      else
      {
        id v12 = self->_queue;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __39__MRRateLimiter__updateAlreadyOnQueue___block_invoke_2;
        v14[3] = &unk_1E57D0FC0;
        id v15 = v11;
        id v13 = v11;
        dispatch_async(v12, v14);
      }
    }
  }
}

void __39__MRRateLimiter__updateAlreadyOnQueue___block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 6;
    BOOL v3 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 6);
    LOBYTE(v3[10]._os_unfair_lock_opaque) = 0;
    os_unfair_lock_unlock(v2);
    [(os_unfair_lock_s *)v3 _updateAlreadyOnQueue:1];
    WeakRetained = v3;
  }
}

uint64_t __39__MRRateLimiter__updateAlreadyOnQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (double)interval
{
  return self->_interval;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lastNotificationDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_block, 0);
}

@end