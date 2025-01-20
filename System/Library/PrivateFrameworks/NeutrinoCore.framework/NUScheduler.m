@interface NUScheduler
+ (id)sharedScheduler;
- (BOOL)_coalesceJobs:(id)a3;
- (BOOL)_prepareNewJob:(id)a3 at:(unint64_t)a4;
- (NUScheduler)initWithName:(id)a3;
- (id)_queueForStage:(int64_t)a3;
- (id)debugDescription;
- (void)_enqueueDependentJobsForRenderJob:(id)a3;
- (void)_enqueueJobsForRequests:(id)a3 withGroup:(id)a4;
- (void)_enqueueRenderJob:(id)a3 toStage:(int64_t)a4;
- (void)_observeRenderJob:(id)a3 withGroup:(id)a4;
- (void)_resumeRenderJob:(id)a3;
- (void)_scheduleRateLimitWakeupForContext:(id)a3;
- (void)_wakeupRateLimitJobForContext:(id)a3;
- (void)cancelJobsForRenderContext:(id)a3;
- (void)enqueueJobsForRequests:(id)a3 withGroup:(id)a4;
- (void)submitRequests:(id)a3 withGroup:(id)a4;
@end

@implementation NUScheduler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_rateLimiterQueue, 0);
  objc_storeStrong((id *)&self->_scheduledContextWakeups, 0);
  objc_storeStrong((id *)&self->_completeQueue, 0);
  objc_storeStrong((id *)&self->_renderQueue, 0);
  objc_storeStrong((id *)&self->_prepareQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NUJobQueue *)self->_prepareQueue debugDescription];
  v6 = [(NUJobQueue *)self->_renderQueue debugDescription];
  v7 = [(NUJobQueue *)self->_completeQueue debugDescription];
  v8 = [v3 stringWithFormat:@"<%@:%p> prepare = %@\nrender = %@\ncomplete = %@", v4, self, v5, v6, v7];

  return v8;
}

- (void)cancelJobsForRenderContext:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v7 = NUAssertLogger_16223();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "context != nil");
      *(_DWORD *)buf = 138543362;
      v26 = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v10 = NUAssertLogger_16223();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v26 = v14;
        __int16 v27 = 2114;
        v28 = v18;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v26 = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUScheduler cancelJobsForRenderContext:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUScheduler.m", 229, @"Invalid parameter not satisfying: %s", v19, v20, v21, v22, (uint64_t)"context != nil");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__NUScheduler_cancelJobsForRenderContext___block_invoke;
  block[3] = &unk_1E5D95E68;
  id v24 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

uint64_t __42__NUScheduler_cancelJobsForRenderContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelAllJobs];
}

- (void)_enqueueRenderJob:(id)a3 toStage:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(NUScheduler *)self _queueForStage:a4];
  [v7 addJob:v6];
}

- (void)_resumeRenderJob:(id)a3
{
}

- (void)_enqueueDependentJobsForRenderJob:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v4 = [v16 dependentJobs];
  v5 = dispatch_group_create();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * v9);
        dispatch_group_enter(v5);
        BOOL v11 = [v10 replyGroup];
        [(NUScheduler *)self _observeRenderJob:v10 withGroup:v11];

        v12 = [v10 replyGroup];
        queue = self->_queue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __49__NUScheduler__enqueueDependentJobsForRenderJob___block_invoke;
        block[3] = &unk_1E5D95E68;
        uint64_t v21 = v5;
        dispatch_group_notify(v12, queue, block);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  v14 = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __49__NUScheduler__enqueueDependentJobsForRenderJob___block_invoke_2;
  v18[3] = &unk_1E5D95E18;
  v18[4] = self;
  id v19 = v16;
  id v15 = v16;
  dispatch_group_notify(v5, v14, v18);
  [(NUJobQueue *)self->_prepareQueue addJobs:obj];
}

void __49__NUScheduler__enqueueDependentJobsForRenderJob___block_invoke(uint64_t a1)
{
}

uint64_t __49__NUScheduler__enqueueDependentJobsForRenderJob___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resumeRenderJob:*(void *)(a1 + 40)];
}

- (void)_observeRenderJob:(id)a3 withGroup:(id)a4
{
  uint64_t v6 = a4;
  id v7 = a3;
  dispatch_group_enter(v6);
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__NUScheduler__observeRenderJob_withGroup___block_invoke;
  v12[3] = &unk_1E5D94EE0;
  v13 = v6;
  v14 = self;
  uint64_t v9 = v6;
  [v7 addStageObserver:self queue:queue block:v12];
  v10 = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__NUScheduler__observeRenderJob_withGroup___block_invoke_2;
  v11[3] = &unk_1E5D94F08;
  v11[4] = self;
  [v7 addCancelObserver:self queue:v10 block:v11];
}

void __43__NUScheduler__observeRenderJob_withGroup___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3 == 3)
  {
    [*(id *)(a1 + 40) _enqueueDependentJobsForRenderJob:v5];
  }
  else
  {
    if (a3 == 6)
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
      id v5 = v6;
    }
    [*(id *)(a1 + 40) _enqueueRenderJob:v5 toStage:a3];
  }
}

void __43__NUScheduler__observeRenderJob_withGroup___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 _queueForStage:a3];
  [v6 removeJob:v5];
}

- (void)_scheduleRateLimitWakeupForContext:(id)a3
{
  id v4 = a3;
  if (([(NSMutableSet *)self->_scheduledContextWakeups containsObject:v4] & 1) == 0)
  {
    [(NSMutableSet *)self->_scheduledContextWakeups addObject:v4];
    objc_initWeak(&location, self);
    objc_initWeak(&from, v4);
    rateLimiterQueue = self->_rateLimiterQueue;
    uint64_t v6 = [v4 nextRenderTime];
    queue = self->_queue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__NUScheduler__scheduleRateLimitWakeupForContext___block_invoke;
    v8[3] = &unk_1E5D94EB8;
    objc_copyWeak(&v9, &from);
    objc_copyWeak(&v10, &location);
    [(NUScheduledQueue *)rateLimiterQueue dispatchAt:v6 queue:queue block:v8];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __50__NUScheduler__scheduleRateLimitWakeupForContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_loadWeakRetained((id *)(a1 + 40));
    [v2 _wakeupRateLimitJobForContext:WeakRetained];
  }
}

- (void)_wakeupRateLimitJobForContext:(id)a3
{
  id v6 = a3;
  [(NSMutableSet *)self->_scheduledContextWakeups removeObject:v6];
  id v4 = [v6 dequeueRateLimitedJob];
  id v5 = v4;
  if (v4)
  {
    [v4 resume];
    objc_msgSend(v6, "updateNextRenderTimeFromTime:", objc_msgSend(v6, "nextRenderTime"));
    [(NUScheduler *)self _scheduleRateLimitWakeupForContext:v6];
  }
  else
  {
    [v6 setNextRenderTime:0];
  }
}

- (void)_enqueueJobsForRequests:(id)a3 withGroup:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  dispatch_time_t v8 = dispatch_time(0, 0);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = (void *)[*(id *)(*((void *)&v18 + 1) + 8 * v13) newRenderJob];
        [(NUScheduler *)self _observeRenderJob:v14 withGroup:v7];
        [v14 setReplyGroup:v7];
        if ([(NUScheduler *)self _prepareNewJob:v14 at:v8])
        {
          [v17 addObject:v14];
        }
        else
        {
          [v14 pause];
          id v15 = [v14 request];
          id v16 = [v15 renderContext];
          [(NUScheduler *)self _scheduleRateLimitWakeupForContext:v16];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  [(NUJobQueue *)self->_prepareQueue addJobs:v17];
}

- (id)_queueForStage:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      uint64_t v4 = 16;
      goto LABEL_7;
    case 5:
      uint64_t v4 = 32;
LABEL_7:
      id v5 = *(id *)((char *)&self->super.isa + v4);
      return v5;
    case 4:
      uint64_t v4 = 24;
      goto LABEL_7;
  }
  id v5 = 0;
  return v5;
}

- (void)submitRequests:(id)a3 withGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__NUScheduler_submitRequests_withGroup___block_invoke;
  block[3] = &unk_1E5D95878;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_group_async(v9, queue, block);
}

uint64_t __40__NUScheduler_submitRequests_withGroup___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enqueueJobsForRequests:*(void *)(a1 + 40) withGroup:*(void *)(a1 + 48)];
}

- (NUScheduler)initWithName:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  v24.receiver = self;
  v24.super_class = (Class)NUScheduler;
  id v5 = [(NUScheduler *)&v24 init];
  id v6 = [NSString stringWithFormat:@"NUScheduler-%@", v4];
  id v7 = (const char *)[v6 cStringUsingEncoding:1];

  name = v5->_name;
  v5->_name = v4;
  id v9 = v4;

  id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v11 = dispatch_queue_create(v7, v10);
  queue = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v11;

  id v13 = [[NUJobQueue alloc] initWithStage:1 name:v9];
  prepareQueue = v5->_prepareQueue;
  v5->_prepareQueue = v13;

  id v15 = [[NUJobQueue alloc] initWithStage:4 name:v9];
  renderQueue = v5->_renderQueue;
  v5->_renderQueue = v15;

  id v17 = [[NUJobQueue alloc] initWithStage:5 name:v9];
  completeQueue = v5->_completeQueue;
  v5->_completeQueue = v17;

  long long v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  scheduledContextWakeups = v5->_scheduledContextWakeups;
  v5->_scheduledContextWakeups = v19;

  long long v21 = objc_alloc_init(NUScheduledQueue);
  rateLimiterQueue = v5->_rateLimiterQueue;
  v5->_rateLimiterQueue = v21;

  return v5;
}

+ (id)sharedScheduler
{
  id v2 = +[NUFactory sharedFactory];
  uint64_t v3 = [v2 scheduler];

  return v3;
}

- (void)enqueueJobsForRequests:(id)a3 withGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__NUScheduler_RenderJobManagement__enqueueJobsForRequests_withGroup___block_invoke;
  block[3] = &unk_1E5D95878;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __69__NUScheduler_RenderJobManagement__enqueueJobsForRequests_withGroup___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enqueueJobsForRequests:*(void *)(a1 + 40) withGroup:*(void *)(a1 + 48)];
}

- (BOOL)_coalesceJobs:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    int v7 = 0;
    for (uint64_t i = 0; i != v5; ++i)
    {
      id v9 = [v3 objectAtIndexedSubscript:i];
      uint64_t v10 = [v9 currentStage];
      uint64_t v11 = v10;
      if ((v7 & 1) != 0
        || (unint64_t v12 = v10 - 3, v13 = [v9 isExecuting], v14 = 1, v12 >= 0xFFFFFFFFFFFFFFFELL)
        && (v13 & 1) == 0)
      {
        int v15 = [v9 cancelCoalescedJob];
        if (v15) {
          int v14 = v7;
        }
        else {
          int v14 = 1;
        }
        if (v15) {
          v6 |= v11 != 2;
        }
      }

      int v7 = v14;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6 & 1;
}

- (BOOL)_prepareNewJob:(id)a3 at:(unint64_t)a4
{
  id v6 = a3;
  int v7 = [v6 request];
  dispatch_time_t v8 = [v7 renderContext];

  [v8 minimumRenderInterval];
  double v10 = v9;
  int v11 = v9 != 0.0;
  if ([v8 shouldCoalesceUpdates])
  {
    unint64_t v12 = [v8 jobs];
    int v13 = [(NUScheduler *)self _coalesceJobs:v12];

    int v11 = (v10 != 0.0) & ~v13;
  }
  [v8 addJob:v6];
  if (v10 == 0.0 || v11 == 0) {
    goto LABEL_10;
  }
  if ([v8 nextRenderTime] <= a4)
  {
    [v8 updateNextRenderTimeFromTime:a4];
LABEL_10:
    BOOL v15 = 1;
    goto LABEL_11;
  }
  [v8 enqueueRateLimitedJob:v6];
  BOOL v15 = 0;
LABEL_11:

  return v15;
}

@end