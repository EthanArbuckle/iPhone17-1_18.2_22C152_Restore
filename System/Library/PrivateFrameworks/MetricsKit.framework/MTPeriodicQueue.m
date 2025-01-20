@interface MTPeriodicQueue
- (BOOL)isFlushTimerEnabled;
- (MTPeriodicQueue)init;
- (NSMutableArray)mutableObjects;
- (OS_dispatch_queue)flushQueue;
- (OS_dispatch_queue)syncQueue;
- (OS_dispatch_source)timer;
- (double)flushTimeInterval;
- (id)__clearObjects;
- (id)flushHandler;
- (int64_t)maximumBatchSize;
- (void)__beginFlushTimer;
- (void)__endFlushTimer;
- (void)__flushObjects;
- (void)__flushObjects:(id)a3;
- (void)__flushObjects:(id)a3 maximumBatchSize:(int64_t)a4 flushHandler:(id)a5;
- (void)_beginFlushTimer;
- (void)_endFlushTimer;
- (void)appendObject:(id)a3;
- (void)dealloc;
- (void)flushObjects;
- (void)insertObject:(id)a3;
- (void)insertObjects:(id)a3;
- (void)setFlushHandler:(id)a3;
- (void)setFlushQueue:(id)a3;
- (void)setFlushTimeInterval:(double)a3;
- (void)setFlushTimerEnabled:(BOOL)a3;
- (void)setMaximumBatchSize:(int64_t)a3;
- (void)setMutableObjects:(id)a3;
- (void)setSyncQueue:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation MTPeriodicQueue

- (MTPeriodicQueue)init
{
  v12.receiver = self;
  v12.super_class = (Class)MTPeriodicQueue;
  v2 = [(MTPeriodicQueue *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_flushTimerEnabled = 1;
    v2->_flushTimeInterval = 60.0;
    v2->_maximumBatchSize = 1000;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mutableObjects = v3->_mutableObjects;
    v3->_mutableObjects = v4;

    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v7 = dispatch_queue_create(0, v6);
    flushQueue = v3->_flushQueue;
    v3->_flushQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create(0, v6);
    syncQueue = v3->_syncQueue;
    v3->_syncQueue = (OS_dispatch_queue *)v9;

    [(MTPeriodicQueue *)v3 _beginFlushTimer];
  }
  return v3;
}

- (void)dealloc
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)MTPeriodicQueue;
  [(MTPeriodicQueue *)&v5 dealloc];
}

- (void)setFlushTimeInterval:(double)a3
{
  syncQueue = self->_syncQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__MTPeriodicQueue_setFlushTimeInterval___block_invoke;
  v4[3] = &unk_264310E88;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(syncQueue, v4);
}

uint64_t __40__MTPeriodicQueue_setFlushTimeInterval___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  double v2 = *(double *)(result + 40);
  if (*(double *)(v1 + 16) != v2)
  {
    *(double *)(v1 + 16) = v2;
    result = *(void *)(result + 32);
    if (*(unsigned char *)(result + 8)) {
      return objc_msgSend((id)result, "__beginFlushTimer");
    }
  }
  return result;
}

- (void)setFlushTimerEnabled:(BOOL)a3
{
  syncQueue = self->_syncQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__MTPeriodicQueue_setFlushTimerEnabled___block_invoke;
  v4[3] = &unk_264310EB0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(syncQueue, v4);
}

uint64_t __40__MTPeriodicQueue_setFlushTimerEnabled___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 8) != v2)
  {
    *(unsigned char *)(v1 + 8) = v2;
    int v3 = *(unsigned __int8 *)(result + 40);
    v4 = *(void **)(result + 32);
    if (v3) {
      return objc_msgSend(v4, "__beginFlushTimer");
    }
    else {
      return objc_msgSend(v4, "__endFlushTimer");
    }
  }
  return result;
}

- (void)setMaximumBatchSize:(int64_t)a3
{
  syncQueue = self->_syncQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__MTPeriodicQueue_setMaximumBatchSize___block_invoke;
  v4[3] = &unk_264310E88;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(syncQueue, v4);
}

unint64_t __39__MTPeriodicQueue_setMaximumBatchSize___block_invoke(unint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(result + 40);
  if (*(void *)(v1 + 24) != v2)
  {
    unint64_t v3 = result;
    *(void *)(v1 + 24) = v2;
    unint64_t v4 = *(void *)(result + 40);
    result = [*(id *)(*(void *)(result + 32) + 48) count];
    if (v4 <= result)
    {
      BOOL v5 = *(void **)(v3 + 32);
      return objc_msgSend(v5, "__flushObjects");
    }
  }
  return result;
}

- (void)appendObject:(id)a3
{
  id v4 = a3;
  syncQueue = self->_syncQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__MTPeriodicQueue_appendObject___block_invoke;
  v7[3] = &unk_264310378;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(syncQueue, v7);
}

void *__32__MTPeriodicQueue_appendObject___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
  unint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) count];
  result = *(void **)(a1 + 32);
  if (v2 >= result[3])
  {
    return objc_msgSend(result, "__flushObjects");
  }
  return result;
}

- (void)insertObject:(id)a3
{
  id v4 = a3;
  syncQueue = self->_syncQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__MTPeriodicQueue_insertObject___block_invoke;
  v7[3] = &unk_264310378;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(syncQueue, v7);
}

void *__32__MTPeriodicQueue_insertObject___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) insertObject:*(void *)(a1 + 40) atIndex:0];
  unint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) count];
  result = *(void **)(a1 + 32);
  if (v2 >= result[3])
  {
    return objc_msgSend(result, "__flushObjects");
  }
  return result;
}

- (void)insertObjects:(id)a3
{
  id v4 = a3;
  syncQueue = self->_syncQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__MTPeriodicQueue_insertObjects___block_invoke;
  v7[3] = &unk_264310378;
  id v8 = v4;
  dispatch_queue_t v9 = self;
  id v6 = v4;
  dispatch_sync(syncQueue, v7);
}

void __33__MTPeriodicQueue_insertObjects___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) count];
  objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "insertObjects:atIndexes:", *(void *)(a1 + 32));
  unint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 48) count];
  id v4 = *(void **)(a1 + 40);
  if (v3 >= v4[3]) {
    objc_msgSend(v4, "__flushObjects");
  }
}

- (void)flushObjects
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__MTPeriodicQueue_flushObjects__block_invoke;
  block[3] = &unk_26430FB90;
  block[4] = self;
  dispatch_sync(syncQueue, block);
}

uint64_t __31__MTPeriodicQueue_flushObjects__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__flushObjects");
}

- (void)__flushObjects
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  id v3 = [(MTPeriodicQueue *)self __clearObjects];
  [(MTPeriodicQueue *)self __flushObjects:v3];
}

- (id)__clearObjects
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  id v3 = (void *)[(NSMutableArray *)self->_mutableObjects copy];
  [(NSMutableArray *)self->_mutableObjects removeAllObjects];

  return v3;
}

- (void)__flushObjects:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  int64_t maximumBatchSize = self->_maximumBatchSize;
  id v6 = (void *)MEMORY[0x21D465290](self->_flushHandler);
  flushQueue = self->_flushQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __34__MTPeriodicQueue___flushObjects___block_invoke;
  v10[3] = &unk_264310ED8;
  v10[4] = self;
  id v11 = v4;
  id v12 = v6;
  int64_t v13 = maximumBatchSize;
  id v8 = v6;
  id v9 = v4;
  dispatch_async(flushQueue, v10);
}

uint64_t __34__MTPeriodicQueue___flushObjects___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__flushObjects:maximumBatchSize:flushHandler:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 48));
}

- (void)__flushObjects:(id)a3 maximumBatchSize:(int64_t)a4 flushHandler:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_flushQueue);
  uint64_t v10 = [v8 count];
  if (v9 && v10)
  {
    do
    {
      unint64_t v11 = [v8 count];
      if (v11 >= a4) {
        int64_t v12 = a4;
      }
      else {
        int64_t v12 = v11;
      }
      uint64_t v13 = [v8 count] - v12;
      v14 = objc_msgSend(v8, "subarrayWithRange:", 0, v12);
      objc_msgSend(v8, "subarrayWithRange:", v12, v13);
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      v9[2](v9, v14);
      id v8 = v15;
    }
    while ([v15 count]);
  }
  else
  {
    id v15 = v8;
  }
}

- (void)_beginFlushTimer
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__MTPeriodicQueue__beginFlushTimer__block_invoke;
  block[3] = &unk_26430FB90;
  block[4] = self;
  dispatch_sync(syncQueue, block);
}

uint64_t __35__MTPeriodicQueue__beginFlushTimer__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "__endFlushTimer");
  uint64_t v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "__beginFlushTimer");
}

- (void)__beginFlushTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  objc_initWeak(&location, self);
  id v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_syncQueue);
  timer = self->_timer;
  self->_timer = v3;

  id v5 = self->_timer;
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(self->_flushTimeInterval * 1000000000.0));
  dispatch_source_set_timer(v5, v6, (unint64_t)(self->_flushTimeInterval * 1000000000.0), 0x3B9ACA00uLL);
  dispatch_queue_t v7 = self->_timer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__MTPeriodicQueue___beginFlushTimer__block_invoke;
  v8[3] = &unk_26430F848;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->_timer);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __36__MTPeriodicQueue___beginFlushTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "__flushObjects");
}

- (void)_endFlushTimer
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__MTPeriodicQueue__endFlushTimer__block_invoke;
  block[3] = &unk_26430FB90;
  block[4] = self;
  dispatch_sync(syncQueue, block);
}

uint64_t __33__MTPeriodicQueue__endFlushTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__endFlushTimer");
}

- (void)__endFlushTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_syncQueue);
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    id v4 = self->_timer;
    self->_timer = 0;
  }
}

- (double)flushTimeInterval
{
  return self->_flushTimeInterval;
}

- (BOOL)isFlushTimerEnabled
{
  return self->_flushTimerEnabled;
}

- (int64_t)maximumBatchSize
{
  return self->_maximumBatchSize;
}

- (id)flushHandler
{
  return self->_flushHandler;
}

- (void)setFlushHandler:(id)a3
{
}

- (OS_dispatch_queue)flushQueue
{
  return self->_flushQueue;
}

- (void)setFlushQueue:(id)a3
{
}

- (NSMutableArray)mutableObjects
{
  return self->_mutableObjects;
}

- (void)setMutableObjects:(id)a3
{
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_mutableObjects, 0);
  objc_storeStrong((id *)&self->_flushQueue, 0);

  objc_storeStrong(&self->_flushHandler, 0);
}

@end