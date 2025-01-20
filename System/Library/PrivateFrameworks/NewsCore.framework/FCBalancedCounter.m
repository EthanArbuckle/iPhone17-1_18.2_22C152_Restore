@interface FCBalancedCounter
- (FCBalancedCounter)init;
- (OS_dispatch_group)dispatchGroup;
- (int64_t)count;
- (os_unfair_lock_s)lock;
- (void)_bumpCounterPositively:(BOOL)a3;
- (void)decrement;
- (void)increment;
- (void)notifyWhenCountReachesZeroOnQueue:(id)a3 usingBlock:(id)a4;
- (void)setCount:(int64_t)a3;
- (void)setDispatchGroup:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
@end

@implementation FCBalancedCounter

- (FCBalancedCounter)init
{
  v7.receiver = self;
  v7.super_class = (Class)FCBalancedCounter;
  v2 = [(FCBalancedCounter *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    dispatch_group_t v4 = dispatch_group_create();
    dispatchGroup = v3->_dispatchGroup;
    v3->_dispatchGroup = (OS_dispatch_group *)v4;
  }
  return v3;
}

- (void)increment
{
}

- (void)decrement
{
}

- (void)notifyWhenCountReachesZeroOnQueue:(id)a3 usingBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "queue");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCBalancedCounter notifyWhenCountReachesZeroOnQueue:usingBlock:]";
    __int16 v12 = 2080;
    v13 = "FCBalancedCounter.m";
    __int16 v14 = 1024;
    int v15 = 47;
    __int16 v16 = 2114;
    v17 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "block");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCBalancedCounter notifyWhenCountReachesZeroOnQueue:usingBlock:]";
    __int16 v12 = 2080;
    v13 = "FCBalancedCounter.m";
    __int16 v14 = 1024;
    int v15 = 48;
    __int16 v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  dispatch_group_notify((dispatch_group_t)self->_dispatchGroup, v6, v7);
}

- (void)_bumpCounterPositively:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t count = self->_count;
  int64_t v7 = count - 1;
  if (v3) {
    int64_t v7 = count + 1;
  }
  self->_int64_t count = v7;
  if (count)
  {
    if (!v7) {
      dispatch_group_leave((dispatch_group_t)self->_dispatchGroup);
    }
  }
  else
  {
    dispatch_group_enter((dispatch_group_t)self->_dispatchGroup);
  }
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_int64_t count = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (OS_dispatch_group)dispatchGroup
{
  return self->_dispatchGroup;
}

- (void)setDispatchGroup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end