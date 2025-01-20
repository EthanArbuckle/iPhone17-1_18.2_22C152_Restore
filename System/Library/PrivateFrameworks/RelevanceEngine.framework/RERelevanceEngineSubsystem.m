@interface RERelevanceEngineSubsystem
- (BOOL)isRunning;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (RERelevanceEngine)relevanceEngine;
- (RERelevanceEngineSubsystem)initWithRelevanceEngine:(id)a3;
- (void)activityTracker:(id)a3 didBeginActivity:(id)a4;
- (void)activityTracker:(id)a3 didEndActivity:(id)a4;
- (void)beginActivity:(id)a3 forObject:(id)a4;
- (void)dealloc;
- (void)endActivity:(id)a3 forObject:(id)a4;
- (void)setRunning:(BOOL)a3;
- (void)trackObject:(id)a3;
- (void)withdrawObject:(id)a3;
@end

@implementation RERelevanceEngineSubsystem

- (void)endActivity:(id)a3 forObject:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  [(REActivityTracker *)self->_activityTracker endActivity:v8 forObject:v7];

  os_unfair_lock_unlock(p_lock);
}

- (void)beginActivity:(id)a3 forObject:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (![(REActivityTracker *)self->_activityTracker trackingObject:v6]) {
    [(REActivityTracker *)self->_activityTracker trackObject:v6];
  }
  [(REActivityTracker *)self->_activityTracker beginActivity:v7 forObject:v6];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)activityTracker:(id)a3 didEndActivity:(id)a4
{
  p_relevanceEngine = &self->_relevanceEngine;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_relevanceEngine);
  [WeakRetained endActivity:v6 forObject:self];
}

- (void)activityTracker:(id)a3 didBeginActivity:(id)a4
{
  p_relevanceEngine = &self->_relevanceEngine;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_relevanceEngine);
  [WeakRetained beginActivity:v6 forObject:self];
}

- (RERelevanceEngineSubsystem)initWithRelevanceEngine:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RERelevanceEngineSubsystem;
  v5 = [(RERelevanceEngineSubsystem *)&v12 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_relevanceEngine, v4);
    uint64_t v7 = [v4 subsystemQueue];
    relevanceEngineQueue = v6->_relevanceEngineQueue;
    v6->_relevanceEngineQueue = (OS_dispatch_queue *)v7;

    v6->_running = 0;
    v6->_lock._os_unfair_lock_opaque = 0;
    v9 = [[REActivityTracker alloc] initWithDelegate:v6];
    activityTracker = v6->_activityTracker;
    v6->_activityTracker = v9;

    [v4 _addSubsystem:v6];
  }

  return v6;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (OS_dispatch_queue)queue
{
  return self->_relevanceEngineQueue;
}

- (RERelevanceEngine)relevanceEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
  return (RERelevanceEngine *)WeakRetained;
}

- (void)trackObject:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(REActivityTracker *)self->_activityTracker trackObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_relevanceEngine);
  [WeakRetained _removeSubsystem:self];

  relevanceEngineQueue = self->_relevanceEngineQueue;
  self->_relevanceEngineQueue = 0;

  v5.receiver = self;
  v5.super_class = (Class)RERelevanceEngineSubsystem;
  [(RERelevanceEngineSubsystem *)&v5 dealloc];
}

- (NSString)name
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (void)withdrawObject:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = 0;
  do
  {
    id v6 = [(REActivityTracker *)self->_activityTracker outstandingActivitiesForObject:v4];

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = v6;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v5);
          }
          [(REActivityTracker *)self->_activityTracker endActivity:*(void *)(*((void *)&v11 + 1) + 8 * v10++) forObject:v4];
        }
        while (v8 != v10);
        uint64_t v8 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
  while ([v5 count]);
  [(REActivityTracker *)self->_activityTracker withdrawObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_relevanceEngine);
  objc_storeStrong((id *)&self->_activityTracker, 0);
  objc_storeStrong((id *)&self->_relevanceEngineQueue, 0);
}

@end