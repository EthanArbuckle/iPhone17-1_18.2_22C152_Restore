@interface NUJobQueue
- (NUJobQueue)init;
- (NUJobQueue)initWithStage:(int64_t)a3 name:(id)a4;
- (id)debugDescription;
- (id)description;
- (int64_t)stage;
- (void)_addJob:(id)a3;
- (void)_addJobs:(id)a3;
- (void)_decrementGroupLevel;
- (void)_finishedPriorityQueue:(id)a3;
- (void)_incrementGroupLevel;
- (void)_removeJob:(id)a3;
- (void)_startRunningIfNeeded;
- (void)addJob:(id)a3;
- (void)addJobs:(id)a3;
- (void)finishedPriorityQueue:(id)a3;
- (void)removeJob:(id)a3;
@end

@implementation NUJobQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_initiatedQueue, 0);
  objc_storeStrong((id *)&self->_interactiveQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (int64_t)stage
{
  return self->_stage;
}

- (void)_finishedPriorityQueue:(id)a3
{
  v4 = (NUJobPriorityQueue *)a3;
  if (self->_interactiveQueue == v4 && !self->_updateGroupLevel)
  {
    v5 = v4;
    [(NUJobPriorityQueue *)self->_initiatedQueue start];
    v4 = v5;
  }
}

- (void)finishedPriorityQueue:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__NUJobQueue_finishedPriorityQueue___block_invoke;
  v7[3] = &unk_1E5D95E18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __36__NUJobQueue_finishedPriorityQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishedPriorityQueue:*(void *)(a1 + 40)];
}

- (void)_startRunningIfNeeded
{
  if (![(NUJobPriorityQueue *)self->_interactiveQueue start])
  {
    initiatedQueue = self->_initiatedQueue;
    [(NUJobPriorityQueue *)initiatedQueue start];
  }
}

- (void)_decrementGroupLevel
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int64_t updateGroupLevel = self->_updateGroupLevel;
  self->_int64_t updateGroupLevel = updateGroupLevel - 1;
  if (updateGroupLevel <= 0)
  {
    v3 = NUAssertLogger_12764();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = [NSString stringWithFormat:@"Unbalanced transaction begin/commit pairs"];
      *(_DWORD *)v19 = 138543362;
      *(void *)&v19[4] = v4;
      _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v19, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v6 = NUAssertLogger_12764();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v11 = (void *)MEMORY[0x1E4F29060];
        id v12 = v10;
        v13 = [v11 callStackSymbols];
        v14 = [v13 componentsJoinedByString:@"\n"];
        *(_DWORD *)v19 = 138543618;
        *(void *)&v19[4] = v10;
        __int16 v20 = 2114;
        v21 = v14;
        _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v19, 0x16u);
      }
    }
    else if (v7)
    {
      id v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      v9 = [v8 componentsJoinedByString:@"\n"];
      *(_DWORD *)v19 = 138543362;
      *(void *)&v19[4] = v9;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v19, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUJobQueue _decrementGroupLevel]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUJobQueue.m", 136, @"Unbalanced transaction begin/commit pairs", v15, v16, v17, v18, *(uint64_t *)v19);
  }
  if (updateGroupLevel == 1)
  {
    [(NUJobQueue *)self _startRunningIfNeeded];
  }
}

- (void)_incrementGroupLevel
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int64_t updateGroupLevel = self->_updateGroupLevel;
  self->_int64_t updateGroupLevel = updateGroupLevel + 1;
  if (updateGroupLevel <= -2)
  {
    v3 = NUAssertLogger_12764();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = [NSString stringWithFormat:@"Unbalanced transaction begin/commit pairs"];
      *(_DWORD *)v19 = 138543362;
      *(void *)&v19[4] = v4;
      _os_log_error_impl(&dword_1A9892000, v3, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v19, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v6 = NUAssertLogger_12764();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v7)
      {
        v10 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v11 = (void *)MEMORY[0x1E4F29060];
        id v12 = v10;
        v13 = [v11 callStackSymbols];
        v14 = [v13 componentsJoinedByString:@"\n"];
        *(_DWORD *)v19 = 138543618;
        *(void *)&v19[4] = v10;
        __int16 v20 = 2114;
        v21 = v14;
        _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v19, 0x16u);
      }
    }
    else if (v7)
    {
      id v8 = [MEMORY[0x1E4F29060] callStackSymbols];
      v9 = [v8 componentsJoinedByString:@"\n"];
      *(_DWORD *)v19 = 138543362;
      *(void *)&v19[4] = v9;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v19, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUJobQueue _incrementGroupLevel]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUJobQueue.m", 130, @"Unbalanced transaction begin/commit pairs", v15, v16, v17, v18, *(uint64_t *)v19);
  }
}

- (void)_addJobs:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NUJobQueue *)self _incrementGroupLevel];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NUJobQueue _addJob:](self, "_addJob:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(NUJobQueue *)self _decrementGroupLevel];
}

- (void)removeJob:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __24__NUJobQueue_removeJob___block_invoke;
  v7[3] = &unk_1E5D95E18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __24__NUJobQueue_removeJob___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeJob:*(void *)(a1 + 40)];
}

- (void)_removeJob:(id)a3
{
  interactiveQueue = self->_interactiveQueue;
  id v5 = a3;
  [(NUJobPriorityQueue *)interactiveQueue removeJob:v5];
  [(NUJobPriorityQueue *)self->_initiatedQueue removeJob:v5];
}

- (void)_addJob:(id)a3
{
  id v4 = a3;
  [(NUJobQueue *)self _incrementGroupLevel];
  id v5 = [v4 priority];
  if ([v5 level] == 3)
  {
  }
  else
  {
    id v6 = [v4 priority];
    uint64_t v7 = [v6 level];

    if (v7 != 2)
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_62);
      }
      if (!os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = 16;
        goto LABEL_15;
      }
      id v8 = [v4 request];
      uint64_t v9 = [v8 voucher];
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      v14 = __22__NUJobQueue__addJob___block_invoke_24;
      uint64_t v15 = &unk_1E5D95E18;
      long long v10 = (id *)v16;
      v16[0] = v4;
      v16[1] = self;
      NULogAdoptVoucher(v9, &v12);
      uint64_t v11 = 16;
      goto LABEL_13;
    }
  }
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_62);
  }
  if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [v4 request];
    uint64_t v9 = [v8 voucher];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __22__NUJobQueue__addJob___block_invoke;
    v17[3] = &unk_1E5D95E18;
    long long v10 = (id *)v18;
    v18[0] = v4;
    v18[1] = self;
    NULogAdoptVoucher(v9, v17);
    uint64_t v11 = 24;
LABEL_13:

    goto LABEL_15;
  }
  uint64_t v11 = 24;
LABEL_15:
  objc_msgSend(*(id *)((char *)&self->super.isa + v11), "addJob:", v4, v12, v13, v14, v15);
  [(NUJobQueue *)self _decrementGroupLevel];
}

void __22__NUJobQueue__addJob___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_62);
  }
  v2 = (void *)_NUScheduleLogger;
  if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    id v5 = v2;
    uint64_t v6 = [v3 stage];
    if ((unint64_t)(v6 - 1) > 5) {
      uint64_t v7 = @"None";
    }
    else {
      uint64_t v7 = off_1E5D95620[v6 - 1];
    }
    id v8 = v7;
    uint64_t v9 = [*(id *)(a1 + 32) priority];
    [v9 order];
    int v11 = 134218498;
    uint64_t v12 = v4;
    __int16 v13 = 2114;
    v14 = v8;
    __int16 v15 = 2048;
    uint64_t v16 = v10;
    _os_log_debug_impl(&dword_1A9892000, v5, OS_LOG_TYPE_DEBUG, "job %p stage %{public}@ schedule low, %f", (uint8_t *)&v11, 0x20u);
  }
}

void __22__NUJobQueue__addJob___block_invoke_24(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_62);
  }
  v2 = (void *)_NUScheduleLogger;
  if (os_log_type_enabled((os_log_t)_NUScheduleLogger, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    id v5 = v2;
    uint64_t v6 = [v3 stage];
    if ((unint64_t)(v6 - 1) > 5) {
      uint64_t v7 = @"None";
    }
    else {
      uint64_t v7 = off_1E5D95620[v6 - 1];
    }
    id v8 = v7;
    uint64_t v9 = [*(id *)(a1 + 32) priority];
    [v9 order];
    int v11 = 134218498;
    uint64_t v12 = v4;
    __int16 v13 = 2114;
    v14 = v8;
    __int16 v15 = 2048;
    uint64_t v16 = v10;
    _os_log_debug_impl(&dword_1A9892000, v5, OS_LOG_TYPE_DEBUG, "job %p stage %{public}@ schedule high, %f", (uint8_t *)&v11, 0x20u);
  }
}

- (void)addJobs:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __22__NUJobQueue_addJobs___block_invoke;
  v7[3] = &unk_1E5D95E18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __22__NUJobQueue_addJobs___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addJobs:*(void *)(a1 + 40)];
}

- (void)addJob:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __21__NUJobQueue_addJob___block_invoke;
  v7[3] = &unk_1E5D95E18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __21__NUJobQueue_addJob___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addJob:*(void *)(a1 + 40)];
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  name = self->_name;
  unint64_t v6 = self->_stage - 1;
  if (v6 > 5) {
    uint64_t v7 = @"None";
  }
  else {
    uint64_t v7 = off_1E5D95620[v6];
  }
  id v8 = v7;
  uint64_t v9 = [v3 stringWithFormat:@"<%@:%p> name: %@, stage %@, interactive queue: %@, initiated queue: %@", v4, self, name, v8, self->_interactiveQueue, self->_initiatedQueue];

  return v9;
}

- (id)description
{
  unint64_t v3 = self->_stage - 1;
  if (v3 > 5) {
    uint64_t v4 = @"None";
  }
  else {
    uint64_t v4 = off_1E5D95620[v3];
  }
  id v5 = v4;
  int64_t v6 = [(NUJobPriorityQueue *)self->_interactiveQueue count];
  int64_t v7 = [(NUJobPriorityQueue *)self->_initiatedQueue count];
  id v8 = [NSString stringWithFormat:@"<%@: %p> - name: %@ stage: %@ interactive: %ld jobs, initiated: %ld jobs", objc_opt_class(), self, self->_name, v5, v6, v7];

  return v8;
}

- (NUJobQueue)init
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_12777);
  }
  v2 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    unint64_t v3 = NSString;
    uint64_t v4 = v2;
    id v5 = (objc_class *)objc_opt_class();
    int64_t v6 = NSStringFromClass(v5);
    int64_t v7 = [v3 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v6];
    *(_DWORD *)buf = 138543362;
    v27 = v7;
    _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v8 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v8 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_12777);
      }
      goto LABEL_8;
    }
    if (v8 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_12777);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    uint64_t v9 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F29060];
    int v11 = v9;
    uint64_t v12 = [v10 callStackSymbols];
    __int16 v13 = [v12 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v27 = v13;
    _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v14 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  uint64_t v16 = (void *)MEMORY[0x1E4F29060];
  id v17 = specific;
  int v11 = v14;
  uint64_t v18 = [v16 callStackSymbols];
  v19 = [v18 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v27 = specific;
  __int16 v28 = 2114;
  v29 = v19;
  _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  __int16 v20 = (objc_class *)objc_opt_class();
  uint64_t v21 = NSStringFromClass(v20);
  _NUAssertFailHandler((uint64_t)"-[NUJobQueue init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUJobQueue.m", 49, @"This is an abstract method! Subclass '%@' should provide concrete implementation", v22, v23, v24, v25, v21);
}

- (NUJobQueue)initWithStage:(int64_t)a3 name:(id)a4
{
  int64_t v6 = (NSString *)a4;
  v29.receiver = self;
  v29.super_class = (Class)NUJobQueue;
  int64_t v7 = [(NUJobQueue *)&v29 init];
  name = v7->_name;
  v7->_name = v6;
  uint64_t v9 = v6;

  id v10 = [NSString stringWithFormat:@"NUJobQueue-%@", v9];
  int v11 = (const char *)[v10 cStringUsingEncoding:1];

  uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v13 = dispatch_queue_create(v11, v12);
  queue = v7->_queue;
  v7->_queue = (OS_dispatch_queue *)v13;

  __int16 v15 = NSString;
  unint64_t v16 = a3 - 1;
  if ((unint64_t)(a3 - 1) > 5) {
    id v17 = @"None";
  }
  else {
    id v17 = off_1E5D95620[v16];
  }
  uint64_t v18 = v17;
  v19 = [v15 stringWithFormat:@"Interactive_%@", v18];

  __int16 v20 = [[NUJobPriorityQueue alloc] initWithName:v19 owner:v7 qos:33];
  interactiveQueue = v7->_interactiveQueue;
  v7->_interactiveQueue = v20;

  uint64_t v22 = NSString;
  if (v16 > 5) {
    uint64_t v23 = @"None";
  }
  else {
    uint64_t v23 = off_1E5D95620[v16];
  }
  uint64_t v24 = v23;
  uint64_t v25 = [v22 stringWithFormat:@"Initiated_%@", v24];

  v26 = [[NUJobPriorityQueue alloc] initWithName:v25 owner:v7 qos:25];
  initiatedQueue = v7->_initiatedQueue;
  v7->_initiatedQueue = v26;

  v7->_stage = a3;
  return v7;
}

@end