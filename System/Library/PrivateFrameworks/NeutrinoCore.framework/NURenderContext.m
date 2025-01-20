@interface NURenderContext
- (BOOL)shouldCoalesceUpdates;
- (NSArray)jobs;
- (NURenderContext)init;
- (NURenderContext)initWithPurpose:(int64_t)a3;
- (NURenderNode)lastPrepareNode;
- (NURenderNode)lastRenderNode;
- (double)minimumRenderInterval;
- (id)_dequeueRateLimitedJob;
- (id)debugDescription;
- (id)dequeueRateLimitedJob;
- (int64_t)jobCount;
- (int64_t)purpose;
- (unint64_t)nextRenderTime;
- (void)_cancelAllJobs;
- (void)_enqueueRateLimitedJob:(id)a3;
- (void)_removeJob:(id)a3;
- (void)addJob:(id)a3;
- (void)cancelAllJobs;
- (void)cancelAllRequests;
- (void)enqueueRateLimitedJob:(id)a3;
- (void)removeJob:(id)a3;
- (void)setLastPrepareNode:(id)a3;
- (void)setLastRenderNode:(id)a3;
- (void)setMinimumRenderInterval:(double)a3;
- (void)setNextRenderTime:(unint64_t)a3;
- (void)setShouldCoalesceUpdates:(BOOL)a3;
- (void)updateNextRenderTimeFromTime:(unint64_t)a3;
@end

@implementation NURenderContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRenderNode, 0);
  objc_storeStrong((id *)&self->_lastPrepareNode, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_rateLimitedJobs, 0);

  objc_storeStrong((id *)&self->_jobs, 0);
}

- (void)setNextRenderTime:(unint64_t)a3
{
  self->_nextRenderTime = a3;
}

- (unint64_t)nextRenderTime
{
  return self->_nextRenderTime;
}

- (void)setLastRenderNode:(id)a3
{
}

- (NURenderNode)lastRenderNode
{
  return (NURenderNode *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastPrepareNode:(id)a3
{
}

- (NURenderNode)lastPrepareNode
{
  return (NURenderNode *)objc_getProperty(self, a2, 56, 1);
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (void)setShouldCoalesceUpdates:(BOOL)a3
{
  self->_shouldCoalesceUpdates = a3;
}

- (BOOL)shouldCoalesceUpdates
{
  return self->_shouldCoalesceUpdates;
}

- (void)setMinimumRenderInterval:(double)a3
{
  self->_minimumRenderInterval = a3;
}

- (double)minimumRenderInterval
{
  return self->_minimumRenderInterval;
}

- (id)debugDescription
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(NURenderContext *)self shouldCoalesceUpdates];
  [(NURenderContext *)self minimumRenderInterval];
  v7 = [v3 stringWithFormat:@"<%@:%p> coalescing=%d minimumRenderInterval=%0.3f rateLimitJobs=%lu\n", v4, self, v5, v6, -[NSMutableArray count](self->_rateLimitedJobs, "count")];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v8 = [(NURenderContext *)self jobs];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        [v7 appendFormat:@"\t%@\n", *(void *)(*((void *)&v14 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)updateNextRenderTimeFromTime:(unint64_t)a3
{
  [(NURenderContext *)self minimumRenderInterval];
  dispatch_time_t v6 = dispatch_time(a3, (uint64_t)(v5 * 1000000000.0));

  [(NURenderContext *)self setNextRenderTime:v6];
}

- (id)_dequeueRateLimitedJob
{
  v3 = [(NSMutableArray *)self->_rateLimitedJobs firstObject];
  if (v3) {
    [(NSMutableArray *)self->_rateLimitedJobs removeObjectAtIndex:0];
  }

  return v3;
}

- (id)dequeueRateLimitedJob
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__9170;
  uint64_t v10 = __Block_byref_object_dispose__9171;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__NURenderContext_dequeueRateLimitedJob__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __40__NURenderContext_dequeueRateLimitedJob__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _dequeueRateLimitedJob];

  return MEMORY[0x1F41817F8]();
}

- (void)_enqueueRateLimitedJob:(id)a3
{
  id v4 = a3;
  rateLimitedJobs = self->_rateLimitedJobs;
  id v8 = v4;
  if (!rateLimitedJobs)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_rateLimitedJobs;
    self->_rateLimitedJobs = v6;

    id v4 = v8;
    rateLimitedJobs = self->_rateLimitedJobs;
  }
  [(NSMutableArray *)rateLimitedJobs addObject:v4];
}

- (void)enqueueRateLimitedJob:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__NURenderContext_enqueueRateLimitedJob___block_invoke;
  v7[3] = &unk_1E5D95E18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __41__NURenderContext_enqueueRateLimitedJob___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enqueueRateLimitedJob:*(void *)(a1 + 40)];
}

- (void)cancelAllRequests
{
  id v3 = +[NUScheduler sharedScheduler];
  [v3 cancelJobsForRenderContext:self];
}

- (void)cancelAllJobs
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__NURenderContext_cancelAllJobs__block_invoke;
  block[3] = &unk_1E5D95E68;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __32__NURenderContext_cancelAllJobs__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelAllJobs];
}

- (void)_cancelAllJobs
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_jobs;
  uint64_t v3 = [(NSPointerArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "cancel", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSPointerArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)addJob:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__NURenderContext_addJob___block_invoke;
  block[3] = &unk_1E5D95E18;
  block[4] = self;
  id v6 = v4;
  id v12 = v6;
  dispatch_sync(queue, block);
  objc_initWeak(&location, self);
  long long v7 = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __26__NURenderContext_addJob___block_invoke_2;
  v8[3] = &unk_1E5D94608;
  objc_copyWeak(&v9, &location);
  [v6 addStageObserver:self queue:v7 block:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __26__NURenderContext_addJob___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) compact];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);

  return [v3 addPointer:v2];
}

void __26__NURenderContext_addJob___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3 == 6)
  {
    id v4 = (id *)(a1 + 32);
    id v5 = a2;
    id WeakRetained = objc_loadWeakRetained(v4);
    [WeakRetained _jobFinished:v5];
  }
}

- (void)removeJob:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__NURenderContext_removeJob___block_invoke;
  v7[3] = &unk_1E5D95E18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __29__NURenderContext_removeJob___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeJob:*(void *)(a1 + 40)];
}

- (void)_removeJob:(id)a3
{
  id v5 = a3;
  if ([(NSPointerArray *)self->_jobs count])
  {
    uint64_t v4 = 0;
    while ([(NSPointerArray *)self->_jobs pointerAtIndex:v4] != v5)
    {
      if (++v4 >= [(NSPointerArray *)self->_jobs count]) {
        goto LABEL_7;
      }
    }
    [(NSPointerArray *)self->_jobs removePointerAtIndex:v4];
  }
LABEL_7:
  [(NSMutableArray *)self->_rateLimitedJobs removeObject:v5];
  [v5 removeObserver:self];
}

- (int64_t)jobCount
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__NURenderContext_jobCount__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __27__NURenderContext_jobCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSArray)jobs
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__9170;
  long long v10 = __Block_byref_object_dispose__9171;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __23__NURenderContext_jobs__block_invoke;
  v5[3] = &unk_1E5D95E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __23__NURenderContext_jobs__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) allObjects];

  return MEMORY[0x1F41817F8]();
}

- (NURenderContext)initWithPurpose:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NURenderContext;
  uint64_t v4 = [(NURenderContext *)&v10 init];
  uint64_t v5 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
  jobs = v4->_jobs;
  v4->_jobs = (NSPointerArray *)v5;

  dispatch_queue_t v7 = dispatch_queue_create("NURenderContextNotification", 0);
  queue = v4->_queue;
  v4->_queue = (OS_dispatch_queue *)v7;

  v4->_purpose = a3;
  return v4;
}

- (NURenderContext)init
{
  return [(NURenderContext *)self initWithPurpose:0];
}

@end