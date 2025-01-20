@interface NUScheduledQueue
- (NUScheduledQueue)init;
- (double)timerCoalesce;
- (double)timerLeeway;
- (void)_dispatchItemsThrough:(unint64_t)a3;
- (void)_scheduleTimer:(unint64_t)a3;
- (void)_startTimer;
- (void)_stopTimer;
- (void)_timerFired;
- (void)dealloc;
- (void)dispatchAfter:(double)a3 queue:(id)a4 block:(id)a5;
- (void)dispatchAt:(unint64_t)a3 queue:(id)a4 block:(id)a5;
- (void)setTimerCoalesce:(double)a3;
- (void)setTimerLeeway:(double)a3;
@end

@implementation NUScheduledQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setTimerCoalesce:(double)a3
{
  self->_timerCoalesce = a3;
}

- (double)timerCoalesce
{
  return self->_timerCoalesce;
}

- (void)setTimerLeeway:(double)a3
{
  self->_timerLeeway = a3;
}

- (double)timerLeeway
{
  return self->_timerLeeway;
}

- (void)dispatchAt:(unint64_t)a3 queue:(id)a4 block:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    v14 = NUAssertLogger_27414();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "queue != nil");
      *(_DWORD *)buf = 138543362;
      v50 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v17 = NUAssertLogger_27414();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v18)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        v31 = [v29 callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v50 = v28;
        __int16 v51 = 2114;
        v52 = v32;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUScheduledQueue dispatchAt:queue:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScheduledQueue.m", 152, @"Invalid parameter not satisfying: %s", v33, v34, v35, v36, (uint64_t)"queue != nil");
  }
  v10 = v9;
  if (!v9)
  {
    v21 = NUAssertLogger_27414();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "block != nil");
      *(_DWORD *)buf = 138543362;
      v50 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v24 = NUAssertLogger_27414();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v25)
      {
        v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v38 = (void *)MEMORY[0x1E4F29060];
        id v39 = v37;
        v40 = [v38 callStackSymbols];
        v41 = [v40 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v50 = v37;
        __int16 v51 = 2114;
        v52 = v41;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v50 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUScheduledQueue dispatchAt:queue:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScheduledQueue.m", 153, @"Invalid parameter not satisfying: %s", v42, v43, v44, v45, (uint64_t)"block != nil");
  }
  v11 = [[NUScheduledItem alloc] initWithScheduledTime:a3 queue:v8 block:v9];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__NUScheduledQueue_dispatchAt_queue_block___block_invoke;
  block[3] = &unk_1E5D95C28;
  block[4] = self;
  v47 = v11;
  unint64_t v48 = a3;
  v13 = v11;
  dispatch_sync(queue, block);
}

void __43__NUScheduledQueue_dispatchAt_queue_block___block_invoke(uint64_t a1)
{
  id v3 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v2 = objc_msgSend(v3, "indexOfObject:inSortedRange:options:usingComparator:", *(void *)(a1 + 40), 0, objc_msgSend(v3, "count"), 1024, &__block_literal_global_27429);
  [v3 insertObject:*(void *)(a1 + 40) atIndex:v2];
  if (!v2) {
    [*(id *)(a1 + 32) _scheduleTimer:*(void *)(a1 + 48)];
  }
  if ([v3 count] == 1) {
    [*(id *)(a1 + 32) _startTimer];
  }
}

uint64_t __43__NUScheduledQueue_dispatchAt_queue_block___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)dispatchAfter:(double)a3 queue:(id)a4 block:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(NUScheduledQueue *)self dispatchAt:NUDispatchSeconds(a3) queue:v9 block:v8];
}

- (void)_dispatchItemsThrough:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_items count])
  {
    v5 = [(NSMutableArray *)self->_items firstObject];
    [v5 dispatch];

    unint64_t v6 = [(NSMutableArray *)self->_items count];
    if (v6 < 2)
    {
      uint64_t v8 = 1;
    }
    else
    {
      unint64_t v7 = v6;
      uint64_t v8 = 1;
      while (1)
      {
        id v9 = [(NSMutableArray *)self->_items objectAtIndexedSubscript:v8];
        if ([v9 scheduledTime] > a3) {
          break;
        }
        ++v8;
        [v9 dispatch];

        if (v7 == v8)
        {
          uint64_t v8 = v7;
          goto LABEL_9;
        }
      }
    }
LABEL_9:
    -[NSMutableArray removeObjectsInRange:](self->_items, "removeObjectsInRange:", 0, v8);
  }
  id v10 = [(NSMutableArray *)self->_items firstObject];
  if (v10) {
    -[NUScheduledQueue _scheduleTimer:](self, "_scheduleTimer:", [v10 scheduledTime]);
  }
  else {
    [(NUScheduledQueue *)self _stopTimer];
  }
}

- (void)_timerFired
{
  [(NUScheduledQueue *)self timerCoalesce];
  dispatch_time_t v4 = NUDispatchSeconds(v3);

  [(NUScheduledQueue *)self _dispatchItemsThrough:v4];
}

- (void)_stopTimer
{
}

- (void)_startTimer
{
}

- (void)_scheduleTimer:(unint64_t)a3
{
  timer = self->_timer;
  [(NUScheduledQueue *)self timerLeeway];

  dispatch_source_set_timer(timer, a3, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v5 * 1000000000.0));
}

- (void)dealloc
{
  if (![(NSMutableArray *)self->_items count]) {
    dispatch_resume((dispatch_object_t)self->_timer);
  }
  v3.receiver = self;
  v3.super_class = (Class)NUScheduledQueue;
  [(NUScheduledQueue *)&v3 dealloc];
}

- (NUScheduledQueue)init
{
  v15.receiver = self;
  v15.super_class = (Class)NUScheduledQueue;
  id v2 = [(NUScheduledQueue *)&v15 init];
  *((_OWORD *)v2 + 2) = xmmword_1A9A72EC0;
  objc_super v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("NUScheduledQueue", v3);
  double v5 = (void *)*((void *)v2 + 1);
  *((void *)v2 + 1) = v4;

  dispatch_source_t v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v2 + 1));
  unint64_t v7 = (void *)*((void *)v2 + 2);
  *((void *)v2 + 2) = v6;

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = (void *)*((void *)v2 + 3);
  *((void *)v2 + 3) = v8;

  objc_initWeak(&location, v2);
  id v10 = *((void *)v2 + 2);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __24__NUScheduledQueue_init__block_invoke;
  v12[3] = &unk_1E5D95BE0;
  objc_copyWeak(&v13, &location);
  dispatch_source_set_event_handler(v10, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return (NUScheduledQueue *)v2;
}

void __24__NUScheduledQueue_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _timerFired];
}

@end