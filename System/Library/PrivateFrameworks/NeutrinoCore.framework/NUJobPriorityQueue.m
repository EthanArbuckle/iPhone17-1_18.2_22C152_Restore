@interface NUJobPriorityQueue
- (BOOL)_removeJob:(id)a3;
- (BOOL)_runNextJob;
- (BOOL)removeJob:(id)a3;
- (BOOL)start;
- (NSString)name;
- (NUJobPriorityQueue)init;
- (NUJobPriorityQueue)initWithName:(id)a3 owner:(id)a4 qos:(unsigned int)a5;
- (id)_popJob;
- (id)description;
- (id)popJob;
- (int64_t)count;
- (void)_addJob:(id)a3;
- (void)_run;
- (void)_sort;
- (void)_sortIfNeeded;
- (void)_startRunning;
- (void)addJob:(id)a3;
@end

@implementation NUJobPriorityQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_currentlyExecutingJobName, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_runQueue, 0);
  objc_destroyWeak((id *)&self->_owner);

  objc_storeStrong((id *)&self->_jobs, 0);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)_runNextJob
{
  v3 = (void *)MEMORY[0x1AD0FAA90](self, a2);
  v4 = [(NUJobPriorityQueue *)self popJob];
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
    if (WeakRetained)
    {
      v6 = NSString;
      v7 = [v4 request];
      v8 = [v7 name];
      v9 = [v6 stringWithFormat:@"%@-j%llu", v8, objc_msgSend(v4, "jobNumber")];
      currentlyExecutingJobName = self->_currentlyExecutingJobName;
      self->_currentlyExecutingJobName = v9;

      dispatch_queue_set_specific((dispatch_queue_t)self->_runQueue, (const void *)NUCurrentlyExecutingJobNameKey, self->_currentlyExecutingJobName, 0);
      objc_msgSend(v4, "run:", objc_msgSend(WeakRetained, "stage"));
      v11 = self->_currentlyExecutingJobName;
      self->_currentlyExecutingJobName = 0;

      dispatch_queue_set_specific((dispatch_queue_t)self->_runQueue, (const void *)NUCurrentlyExecutingJobNameKey, 0, 0);
    }
  }
  return v4 != 0;
}

- (void)_run
{
  while ([(NUJobPriorityQueue *)self _runNextJob])
    ;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__NUJobPriorityQueue__run__block_invoke;
  block[3] = &unk_1E5D95E68;
  block[4] = self;
  dispatch_sync(stateQueue, block);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  [WeakRetained finishedPriorityQueue:self];
}

uint64_t __26__NUJobPriorityQueue__run__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 56) = 0;
  return result;
}

- (void)_startRunning
{
  runQueue = self->_runQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__NUJobPriorityQueue__startRunning__block_invoke;
  block[3] = &unk_1E5D95E68;
  block[4] = self;
  dispatch_async(runQueue, block);
}

uint64_t __35__NUJobPriorityQueue__startRunning__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _run];
}

- (BOOL)start
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__NUJobPriorityQueue_start__block_invoke;
  block[3] = &unk_1E5D95580;
  block[4] = self;
  void block[5] = &v11;
  block[6] = &v7;
  dispatch_sync(stateQueue, block);
  if (*((unsigned char *)v8 + 24)) {
    [(NUJobPriorityQueue *)self _startRunning];
  }
  if (*((unsigned char *)v12 + 24)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = *((unsigned char *)v8 + 24) != 0;
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

uint64_t __27__NUJobPriorityQueue_start__block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(a1[4] + 56);
  uint64_t result = [*(id *)(a1[4] + 8) count];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result != 0;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    *(unsigned char *)(a1[4] + 56) = 1;
  }
  return result;
}

- (void)_sort
{
}

uint64_t __27__NUJobPriorityQueue__sort__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 priority];
  uint64_t v7 = [v5 priority];
  uint64_t v8 = [v6 compare:v7];

  if (!v8)
  {
    unint64_t v9 = [v4 jobNumber];
    if (v9 < [v5 jobNumber]) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = -1;
    }
  }

  return v8;
}

- (void)_sortIfNeeded
{
  if (self->_needSort)
  {
    [(NUJobPriorityQueue *)self _sort];
    self->_needSort = 0;
  }
}

- (int64_t)count
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__NUJobPriorityQueue_count__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __27__NUJobPriorityQueue_count__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_popJob
{
  [(NUJobPriorityQueue *)self _sortIfNeeded];
  int64_t v3 = [(NSMutableArray *)self->_jobs lastObject];
  [(NSMutableArray *)self->_jobs removeLastObject];

  return v3;
}

- (id)popJob
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1740;
  char v10 = __Block_byref_object_dispose__1741;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__NUJobPriorityQueue_popJob__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __28__NUJobPriorityQueue_popJob__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _popJob];

  return MEMORY[0x1F41817F8]();
}

- (BOOL)_removeJob:(id)a3
{
  id v4 = a3;
  int v5 = [(NSMutableArray *)self->_jobs containsObject:v4];
  if (v5) {
    [(NSMutableArray *)self->_jobs removeObject:v4];
  }

  return v5;
}

- (BOOL)removeJob:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__NUJobPriorityQueue_removeJob___block_invoke;
  block[3] = &unk_1E5D959D8;
  id v9 = v4;
  char v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(stateQueue, block);
  LOBYTE(stateQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)stateQueue;
}

uint64_t __32__NUJobPriorityQueue_removeJob___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _removeJob:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_addJob:(id)a3
{
  self->_needSort = 1;
}

- (void)addJob:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__NUJobPriorityQueue_addJob___block_invoke;
  v7[3] = &unk_1E5D95E18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

uint64_t __29__NUJobPriorityQueue_addJob___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addJob:*(void *)(a1 + 40)];
}

- (id)description
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__1740;
  char v10 = __Block_byref_object_dispose__1741;
  id v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__NUJobPriorityQueue_description__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __33__NUJobPriorityQueue_description__block_invoke(uint64_t a1)
{
  v2 = NSString;
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 56)) {
    int v5 = @"YES";
  }
  else {
    int v5 = @"NO";
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [v2 stringWithFormat:@"<%@:%p> running = %@, jobCount = %ld", v3, v4, v5, objc_msgSend(*(id *)(v4 + 8), "count")];

  return MEMORY[0x1F41817F8]();
}

- (NUJobPriorityQueue)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_70);
  }
  uint64_t v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = NSString;
    int v5 = v3;
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(a2);
    id v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_70);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_70);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    id v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v12 = (void *)MEMORY[0x1E4F29060];
    uint64_t v13 = v11;
    char v14 = [v12 callStackSymbols];
    v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  uint64_t v13 = v16;
  v20 = [v18 callStackSymbols];
  v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUJobPriorityQueue init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUJobPriorityQueue.m", 43, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

- (NUJobPriorityQueue)initWithName:(id)a3 owner:(id)a4 qos:(unsigned int)a5
{
  id v9 = a3;
  id v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)NUJobPriorityQueue;
  id v11 = [(NUJobPriorityQueue *)&v27 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:256];
    jobs = v12->_jobs;
    v12->_jobs = (NSMutableArray *)v13;

    objc_storeWeak((id *)&v12->_owner, v10);
    v15 = [NSString stringWithFormat:@"NUJobQueue.%@.run", v9];
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = dispatch_queue_attr_make_with_qos_class(v16, (dispatch_qos_class_t)a5, 0);

    id v18 = v15;
    dispatch_queue_t v19 = dispatch_queue_create((const char *)[v18 UTF8String], v17);
    runQueue = v12->_runQueue;
    v12->_runQueue = (OS_dispatch_queue *)v19;

    id v21 = [NSString stringWithFormat:@"NUJobQueue.%@.state", v9];
    v22 = (const char *)[v21 UTF8String];
    uint64_t v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v24 = dispatch_queue_create(v22, v23);
    stateQueue = v12->_stateQueue;
    v12->_stateQueue = (OS_dispatch_queue *)v24;
  }
  return v12;
}

@end