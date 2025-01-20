@interface SDDirtyIdleTimer
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)idleTimer;
- (OS_os_transaction)transaction;
- (SDDirtyIdleTimer)initWithQueue:(id)a3 timeoutBlock:(id)a4;
- (id)block;
- (id)description;
- (unint64_t)dirtyTimeout;
- (unint64_t)idleStartTime;
- (unint64_t)idleTimeout;
- (unsigned)dirtyCount;
- (unsigned)resetCount;
- (void)_stop;
- (void)cancel;
- (void)dirty;
- (void)setBlock:(id)a3;
- (void)setDirtyCount:(unsigned int)a3;
- (void)setDirtyTimeout:(unint64_t)a3;
- (void)setIdleStartTime:(unint64_t)a3;
- (void)setIdleTimeout:(unint64_t)a3;
- (void)setIdleTimer:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResetCount:(unsigned int)a3;
- (void)setTransaction:(id)a3;
@end

@implementation SDDirtyIdleTimer

- (SDDirtyIdleTimer)initWithQueue:(id)a3 timeoutBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SDDirtyIdleTimer;
  v9 = [(SDDirtyIdleTimer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    uint64_t v11 = MEMORY[0x223C48320](v8);
    id block = v10->_block;
    v10->_id block = (id)v11;

    *(_OWORD *)&v10->_idleTimeout = xmmword_21F26B140;
  }

  return v10;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<%@:%p dc:%u rc:%d st:%llu ito:%llu dto:%lld", objc_opt_class(), self, self->_dirtyCount, self->_resetCount, self->_idleStartTime, self->_idleTimeout, self->_dirtyTimeout];
  return v2;
}

- (void)_stop
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21F1CE000, a2, OS_LOG_TYPE_DEBUG, "%@ stopped", (uint8_t *)&v2, 0xCu);
}

- (void)dirty
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__SDDirtyIdleTimer_dirty__block_invoke;
  block[3] = &unk_2645063F8;
  block[4] = self;
  uint64_t v3 = queue;
  qos_class_t v4 = qos_class_self();
  if (v4 < 0x1A) {
    dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  }
  else {
    dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v4, 0, block);
  }
  v6 = v5;
  dispatch_async(v3, v5);
}

void __25__SDDirtyIdleTimer_dirty__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v1 = (uint64_t *)(a1 + 32);
  ++*(_DWORD *)(*(void *)(a1 + 32) + 12);
  if (*(void *)(*(void *)(a1 + 32) + 48))
  {
    if (dispatch_time(0, 0) - *(void *)(*v1 + 56) >= *(void *)(*v1 + 24))
    {
      objc_super v14 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __25__SDDirtyIdleTimer_dirty__block_invoke_cold_1(v1, v14);
      }
    }
    else
    {
      ++*(_DWORD *)(*v1 + 8);
      int v2 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        uint64_t v3 = *v1;
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v3;
        _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_INFO, "%@ reset", buf, 0xCu);
      }

      qos_class_t v4 = *(NSObject **)(*v1 + 48);
      dispatch_time_t v5 = dispatch_time(0, *(void *)(*v1 + 16));
      dispatch_source_set_timer(v4, v5, *(void *)(*v1 + 16), *(void *)(*v1 + 16));
    }
  }
  else
  {
    v6 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *v1;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v7;
      _os_log_impl(&dword_21F1CE000, v6, OS_LOG_TYPE_INFO, "%@ start", buf, 0xCu);
    }

    uint64_t v8 = os_transaction_create();
    v9 = *(void **)(*v1 + 64);
    *(void *)(*v1 + 64) = v8;

    dispatch_source_t v10 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(*v1 + 32));
    uint64_t v11 = *(void **)(*v1 + 48);
    *(void *)(*v1 + 48) = v10;

    *(void *)buf = 0;
    objc_initWeak((id *)buf, (id)*v1);
    uint64_t v12 = *v1;
    v13 = *(NSObject **)(*v1 + 48);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __25__SDDirtyIdleTimer_dirty__block_invoke_2;
    v15[3] = &unk_2645091C8;
    v15[4] = v12;
    objc_copyWeak(&v16, (id *)buf);
    dispatch_source_set_event_handler(v13, v15);
    *(void *)(*v1 + 56) = dispatch_time(0, *(void *)(*v1 + 16));
    dispatch_source_set_timer(*(dispatch_source_t *)(*v1 + 48), *(void *)(*v1 + 56), *(void *)(*v1 + 16), *(void *)(*v1 + 16));
    dispatch_resume(*(dispatch_object_t *)(*v1 + 48));
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

void __25__SDDirtyIdleTimer_dirty__block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v3;
    __int16 v9 = 2048;
    dispatch_time_t v10 = dispatch_time(0, 0);
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_INFO, "%@ %llu complete", (uint8_t *)&v7, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_time_t v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = [WeakRetained block];
    v6[2]();

    [v5 _stop];
  }
}

- (void)cancel
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__SDDirtyIdleTimer_cancel__block_invoke;
  block[3] = &unk_2645063F8;
  block[4] = self;
  uint64_t v3 = queue;
  qos_class_t v4 = qos_class_self();
  if (v4 < 0x1A) {
    dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  }
  else {
    dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v4, 0, block);
  }
  v6 = v5;
  dispatch_async(v3, v5);
}

uint64_t __26__SDDirtyIdleTimer_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stop];
}

- (unint64_t)idleTimeout
{
  return self->_idleTimeout;
}

- (void)setIdleTimeout:(unint64_t)a3
{
  self->_idleTimeout = a3;
}

- (unint64_t)dirtyTimeout
{
  return self->_dirtyTimeout;
}

- (void)setDirtyTimeout:(unint64_t)a3
{
  self->_dirtyTimeout = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (OS_dispatch_source)idleTimer
{
  return self->_idleTimer;
}

- (void)setIdleTimer:(id)a3
{
}

- (unint64_t)idleStartTime
{
  return self->_idleStartTime;
}

- (void)setIdleStartTime:(unint64_t)a3
{
  self->_idleStartTime = a3;
}

- (unsigned)resetCount
{
  return self->_resetCount;
}

- (void)setResetCount:(unsigned int)a3
{
  self->_resetCount = a3;
}

- (unsigned)dirtyCount
{
  return self->_dirtyCount;
}

- (void)setDirtyCount:(unsigned int)a3
{
  self->_dirtyCount = a3;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __25__SDDirtyIdleTimer_dirty__block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21F1CE000, a2, OS_LOG_TYPE_DEBUG, "%@ dirty", (uint8_t *)&v3, 0xCu);
}

@end