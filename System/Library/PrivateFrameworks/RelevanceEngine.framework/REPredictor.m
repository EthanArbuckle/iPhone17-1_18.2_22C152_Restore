@interface REPredictor
+ (double)updateInterval;
+ (id)availablePredictors;
+ (id)supportedFeatures;
+ (id)systemPredictorsSupportingFeatureSet:(id)a3 relevanceEngine:(id)a4;
- (BOOL)_isRunning;
- (NSCountedSet)outstandingActivities;
- (id)_init;
- (id)engines;
- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6;
- (id)queue;
- (int64_t)beginUpdatesCount;
- (void)_performUpdate;
- (void)_setIsRunning:(BOOL)a3;
- (void)_setRunning:(BOOL)a3;
- (void)addRelevanceEngine:(id)a3;
- (void)beginActivity:(id)a3;
- (void)beginFetchingData;
- (void)beginUpdates;
- (void)dealloc;
- (void)endUpdates;
- (void)enumerateInflectionFeatureValues:(id)a3;
- (void)finishActivity:(id)a3;
- (void)finishFetchingData;
- (void)invalidate;
- (void)onQueue:(id)a3;
- (void)onQueueSync:(id)a3;
- (void)removeRelevanceEngine:(id)a3;
- (void)setBeginUpdatesCount:(int64_t)a3;
- (void)updateObservers;
@end

@implementation REPredictor

+ (id)systemPredictorsSupportingFeatureSet:(id)a3 relevanceEngine:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v20 = a4;
  v7 = objc_alloc_init(REMutableFeatureSet);
  v8 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v9 = [a1 availablePredictors];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v15 = [v14 supportedFeatures];
        v16 = (void *)[v15 mutableCopy];

        [v16 intersetFeatureSet:v6];
        if ([v16 count])
        {
          [(REMutableFeatureSet *)v7 unionFeatureSet:v16];
          v17 = [v14 sharedInstance];
          [v8 addObject:v17];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  v18 = [[REPredictorManager alloc] initWithPredictors:v8 featureSet:v7 relevanceEngine:v20];
  return v18;
}

void __34__REPredictor_availablePredictors__block_invoke()
{
  v2[10] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:10];
  v1 = (void *)availablePredictors_PredictorClasses;
  availablePredictors_PredictorClasses = v0;
}

+ (id)availablePredictors
{
  if (availablePredictors_onceToken != -1) {
    dispatch_once(&availablePredictors_onceToken, &__block_literal_global_31);
  }
  v2 = (void *)availablePredictors_PredictorClasses;
  return v2;
}

- (id)_init
{
  v32.receiver = self;
  v32.super_class = (Class)REPredictor;
  v2 = [(REObservableSingleton *)&v32 _init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    if (_init_onceToken != -1) {
      dispatch_once(&_init_onceToken, &__block_literal_global_15);
    }
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);

    id v7 = [NSString stringWithFormat:@"com.apple.RelevanceEngine.%@", v4];
    v8 = (const char *)[v7 UTF8String];
    v9 = [(id)_init_QueuePool nextAvailableQueue];
    dispatch_queue_t v10 = dispatch_queue_create_with_target_V2(v8, v6, v9);
    uint64_t v11 = (void *)v2[2];
    v2[2] = v10;

    uint64_t v12 = objc_opt_new();
    v13 = (void *)v2[3];
    v2[3] = v12;

    *((_DWORD *)v2 + 12) = 0;
    uint64_t v14 = [MEMORY[0x263F08760] set];
    v15 = (void *)v2[5];
    v2[5] = v14;

    objc_initWeak(&location, v2);
    v16 = +[RESingleton sharedInstance];
    [(id)objc_opt_class() updateInterval];
    double v18 = v17;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __20__REPredictor__init__block_invoke_2;
    v29[3] = &unk_2644BC638;
    objc_copyWeak(&v30, &location);
    [v16 scheduleEventWithIdentifier:v4 updateFrequency:v29 completion:v18];

    uint64_t v19 = v2[2];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __20__REPredictor__init__block_invoke_3;
    v27[3] = &unk_2644BC638;
    objc_copyWeak(&v28, &location);
    uint64_t v20 = +[REUpNextScheduler schedulerWithQueue:v19 delay:v27 updateBlock:0.1];
    long long v21 = (void *)v2[4];
    v2[4] = v20;

    [v2 beginFetchingData];
    dispatch_time_t v22 = dispatch_time(0, 500000000);
    long long v23 = v2[2];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __20__REPredictor__init__block_invoke_4;
    block[3] = &unk_2644BC638;
    objc_copyWeak(&v26, &location);
    dispatch_after(v22, v23, block);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return v2;
}

uint64_t __20__REPredictor__init__block_invoke()
{
  uint64_t v0 = [[REDispatchQueuePool alloc] initWithQueueCount:2 prefix:@"com.apple.RelevanceEngine.Predictor"];
  uint64_t v1 = _init_QueuePool;
  _init_QueuePool = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void __20__REPredictor__init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void __20__REPredictor__init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performUpdate];
}

void __20__REPredictor__init__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performUpdate];
  [WeakRetained finishFetchingData];
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[RESingleton sharedInstance];
  [v5 unscheduleEventWithIdentifier:v4];

  v6.receiver = self;
  v6.super_class = (Class)REPredictor;
  [(REPredictor *)&v6 dealloc];
}

- (id)queue
{
  return self->_queue;
}

- (void)onQueue:(id)a3
{
  if (a3) {
    dispatch_async((dispatch_queue_t)self->_queue, a3);
  }
}

- (void)onQueueSync:(id)a3
{
  if (a3) {
    dispatch_sync((dispatch_queue_t)self->_queue, a3);
  }
}

- (void)updateObservers
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __30__REPredictor_updateObservers__block_invoke;
  v2[3] = &unk_2644BC9C0;
  v2[4] = self;
  [(REObservableSingleton *)self enumerateObservers:v2];
}

void __30__REPredictor_updateObservers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 predictorDidUpdate:*(void *)(a1 + 32)];
  }
}

- (void)beginUpdates
{
  p_predictorLock = &self->_predictorLock;
  os_unfair_lock_lock(&self->_predictorLock);
  int64_t v4 = [(REPredictor *)self beginUpdatesCount];
  [(REPredictor *)self setBeginUpdatesCount:v4 + 1];
  os_unfair_lock_unlock(p_predictorLock);
  if ((v4 & 0x8000000000000000) == 0)
  {
    [(REPredictor *)self _setRunning:1];
  }
}

- (void)endUpdates
{
  p_predictorLock = &self->_predictorLock;
  os_unfair_lock_lock(&self->_predictorLock);
  uint64_t v4 = [(REPredictor *)self beginUpdatesCount];
  [(REPredictor *)self setBeginUpdatesCount:v4 - 1];
  os_unfair_lock_unlock(p_predictorLock);
  if (v4 <= 1)
  {
    [(REPredictor *)self _setRunning:0];
  }
}

- (void)_setRunning:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(REPredictor *)self _isRunning] != a3)
  {
    [(REPredictor *)self _setIsRunning:v3];
    queue = self->_queue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __27__REPredictor__setRunning___block_invoke;
    v6[3] = &unk_2644BCFC8;
    BOOL v7 = v3;
    v6[4] = self;
    dispatch_async(queue, v6);
  }
}

uint64_t __27__REPredictor__setRunning___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (v1) {
    return [v2 resume];
  }
  else {
    return [v2 pause];
  }
}

- (void)addRelevanceEngine:(id)a3
{
}

- (void)removeRelevanceEngine:(id)a3
{
}

- (id)engines
{
  return [(REObserverStore *)self->_engines allObservers];
}

- (void)enumerateInflectionFeatureValues:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = [(REPredictor *)self engines];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          dispatch_queue_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v11 = [v10 inflectionFeatureValues];
          v13[0] = MEMORY[0x263EF8330];
          v13[1] = 3221225472;
          v13[2] = __48__REPredictor_enumerateInflectionFeatureValues___block_invoke;
          v13[3] = &unk_2644BED30;
          id v12 = v4;
          v13[4] = v10;
          id v14 = v12;
          [v11 enumerateKeysAndObjectsUsingBlock:v13];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
  }
}

void __48__REPredictor_enumerateInflectionFeatureValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v14 + 1) + 8 * v10);
        id v12 = [MEMORY[0x263EFF9D0] null];
        int v13 = [v12 isEqual:v11];

        if (v13)
        {

          id v11 = 0;
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)beginFetchingData
{
}

- (void)finishFetchingData
{
}

+ (double)updateInterval
{
  return 86400.0;
}

+ (id)supportedFeatures
{
  v2 = objc_opt_new();
  return v2;
}

- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6
{
  return 0;
}

- (void)invalidate
{
}

- (void)_performUpdate
{
  [(REPredictor *)self beginFetchingData];
  [(REPredictor *)self update];
  [(REPredictor *)self finishFetchingData];
}

- (BOOL)_isRunning
{
  return self->__isRunning;
}

- (void)_setIsRunning:(BOOL)a3
{
  self->__isRunning = a3;
}

- (int64_t)beginUpdatesCount
{
  return self->_beginUpdatesCount;
}

- (void)setBeginUpdatesCount:(int64_t)a3
{
  self->_beginUpdatesCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_refreshScheduler, 0);
  objc_storeStrong((id *)&self->_engines, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)beginActivity:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_predictorLock);
  [(NSCountedSet *)self->_activities addObject:v4];
  os_unfair_lock_unlock(&self->_predictorLock);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__REPredictor_REActivityTracking__beginActivity___block_invoke;
  v6[3] = &unk_2644BED58;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(REObservableSingleton *)self enumerateObservers:v6];
}

void __49__REPredictor_REActivityTracking__beginActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 predictor:*(void *)(a1 + 32) didBeginActivity:*(void *)(a1 + 40)];
  }
}

- (void)finishActivity:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_predictorLock);
  [(NSCountedSet *)self->_activities removeObject:v4];
  os_unfair_lock_unlock(&self->_predictorLock);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__REPredictor_REActivityTracking__finishActivity___block_invoke;
  v6[3] = &unk_2644BED58;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(REObservableSingleton *)self enumerateObservers:v6];
}

void __50__REPredictor_REActivityTracking__finishActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 predictor:*(void *)(a1 + 32) didFinishActivity:*(void *)(a1 + 40)];
  }
}

- (NSCountedSet)outstandingActivities
{
  p_predictorLock = &self->_predictorLock;
  os_unfair_lock_lock(&self->_predictorLock);
  id v4 = (void *)[(NSCountedSet *)self->_activities copy];
  os_unfair_lock_unlock(p_predictorLock);
  return (NSCountedSet *)v4;
}

@end