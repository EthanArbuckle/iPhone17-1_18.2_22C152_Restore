@interface SOTimersPublisher
- (NSString)typeName;
- (SOTimersPublisher)init;
- (void)_createNewSnapshotWithCompletion:(id)a3;
- (void)_notifySubscribersOfEvent:(int64_t)a3;
- (void)_startObserving;
- (void)addSubscriber:(id)a3;
- (void)dealloc;
- (void)firingTimerChanged:(id)a3;
- (void)firingTimerDismissed:(id)a3;
- (void)getCurrentSnapshotWithCompletion:(id)a3;
- (void)removeSubscriber:(id)a3;
- (void)stateReset:(id)a3;
- (void)timerFired:(id)a3;
- (void)timersAdded:(id)a3;
- (void)timersRemoved:(id)a3;
- (void)timersUpdated:(id)a3;
@end

@implementation SOTimersPublisher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeName, 0);
  objc_storeStrong((id *)&self->_timerSnapshot, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_timersPublisherDispatchGroup, 0);
  objc_storeStrong((id *)&self->_timersPublisherQueue, 0);
}

- (NSString)typeName
{
  return self->_typeName;
}

- (void)_createNewSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_group_enter((dispatch_group_t)self->_timersPublisherDispatchGroup);
  v5 = [(MTTimerManager *)self->_timerManager timers];
  if (v5)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __54__SOTimersPublisher__createNewSnapshotWithCompletion___block_invoke;
    v11[3] = &unk_264487118;
    v11[4] = self;
    id v6 = v4;
    id v12 = v6;
    id v7 = (id)[v5 addSuccessBlock:v11];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __54__SOTimersPublisher__createNewSnapshotWithCompletion___block_invoke_3;
    v9[3] = &unk_264487140;
    v9[4] = self;
    id v10 = v6;
    id v8 = (id)[v5 addFailureBlock:v9];
  }
}

void __54__SOTimersPublisher__createNewSnapshotWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v33 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v2;
  uint64_t v34 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v34)
  {
    uint64_t v32 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v41 != v32) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v5 = [v4 timerID];
        id v6 = [SOTimer alloc];
        uint64_t v7 = [v4 timerURL];
        uint64_t v8 = [v4 isFiring];
        uint64_t v9 = [v4 title];
        uint64_t v10 = [v4 state];
        [v4 duration];
        double v12 = v11;
        v13 = [v4 siriContext];
        v14 = [v13 objectForKeyedSubscript:@"MTTimerIntentSupportSiriContextTimerTypeKey"];

        uint64_t v35 = v10;
        v36 = (void *)v9;
        if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v15 = (void *)v7;
          uint64_t v16 = [v14 integerValue];
        }
        else
        {
          v15 = (void *)v7;
          uint64_t v16 = 1;
        }

        [v4 remainingTime];
        double v18 = v17;
        v19 = [v4 fireDate];
        v20 = [v4 firedDate];
        v21 = [v4 dismissedDate];
        v22 = [v4 lastModifiedDate];
        v23 = [(SOTimer *)v6 initWithTimerID:v5 timerURL:v15 isFiring:v8 title:v36 state:v35 duration:v16 type:v12 fireTimeInterval:v18 fireDate:v19 firedDate:v20 dismissedDate:v21 lastModifiedDate:v22];

        [v33 setObject:v23 forKey:v5];
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v34);
  }

  v24 = [SOTimersSnapshot alloc];
  v25 = [MEMORY[0x263EFF910] now];
  v26 = [(SOTimersSnapshot *)v24 initWithDate:v25 timersByID:v33];

  uint64_t v27 = *(void *)(a1 + 32);
  v28 = *(NSObject **)(v27 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SOTimersPublisher__createNewSnapshotWithCompletion___block_invoke_2;
  block[3] = &unk_2644870F0;
  block[4] = v27;
  v38 = v26;
  id v39 = *(id *)(a1 + 40);
  v29 = v26;
  dispatch_async(v28, block);
}

void __54__SOTimersPublisher__createNewSnapshotWithCompletion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  dispatch_group_leave(v2);
}

void __54__SOTimersPublisher__createNewSnapshotWithCompletion___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  dispatch_group_leave(v2);
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SOTimersPublisher;
  [(SOTimersPublisher *)&v4 dealloc];
}

- (void)_startObserving
{
  if (self->_timerManager)
  {
    id v10 = [MEMORY[0x263F08A00] defaultCenter];
    v3 = getMTTimerManagerTimersAdded();
    [v10 addObserver:self selector:sel_timersAdded_ name:v3 object:self->_timerManager];

    objc_super v4 = getMTTimerManagerTimersUpdated();
    [v10 addObserver:self selector:sel_timersUpdated_ name:v4 object:self->_timerManager];

    v5 = getMTTimerManagerTimersRemoved();
    [v10 addObserver:self selector:sel_timersRemoved_ name:v5 object:self->_timerManager];

    id v6 = getMTTimerManagerTimerFired();
    [v10 addObserver:self selector:sel_timerFired_ name:v6 object:self->_timerManager];

    uint64_t v7 = getMTTimerManagerFiringTimerChanged();
    [v10 addObserver:self selector:sel_firingTimerChanged_ name:v7 object:self->_timerManager];

    uint64_t v8 = getMTTimerManagerFiringTimerDismissed();
    [v10 addObserver:self selector:sel_firingTimerDismissed_ name:v8 object:self->_timerManager];

    uint64_t v9 = getMTTimerManagerStateReset();
    [v10 addObserver:self selector:sel_stateReset_ name:v9 object:self->_timerManager];
  }
}

- (void)_notifySubscribersOfEvent:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__SOTimersPublisher__notifySubscribersOfEvent___block_invoke;
  v3[3] = &unk_2644870C8;
  v3[4] = self;
  v3[5] = a3;
  [(SOTimersPublisher *)self _createNewSnapshotWithCompletion:v3];
}

void __47__SOTimersPublisher__notifySubscribersOfEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (v5 && !a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = *(id *)(*(void *)(a1 + 32) + 24);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "snapshotAvailable:forEvent:", v5, *(void *)(a1 + 40), (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)stateReset:(id)a3
{
}

- (void)firingTimerDismissed:(id)a3
{
}

- (void)firingTimerChanged:(id)a3
{
}

- (void)timerFired:(id)a3
{
}

- (void)timersRemoved:(id)a3
{
}

- (void)timersUpdated:(id)a3
{
}

- (void)timersAdded:(id)a3
{
}

- (void)removeSubscriber:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    timersPublisherQueue = self->_timersPublisherQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__SOTimersPublisher_removeSubscriber___block_invoke;
    v7[3] = &unk_2644870A0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(timersPublisherQueue, v7);
  }
}

uint64_t __38__SOTimersPublisher_removeSubscriber___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

- (void)addSubscriber:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __35__SOTimersPublisher_addSubscriber___block_invoke;
    v6[3] = &unk_264487078;
    v6[4] = self;
    id v7 = v4;
    [(SOTimersPublisher *)self getCurrentSnapshotWithCompletion:v6];
  }
}

void __35__SOTimersPublisher_addSubscriber___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  if (v5) {
    NSLog(&cfstr_Sotimerspublis_0.isa, v5);
  }
  else {
    [*(id *)(a1 + 40) snapshotAvailable:v6 forEvent:0];
  }
}

- (void)getCurrentSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    timersPublisherQueue = self->_timersPublisherQueue;
    timersPublisherDispatchGroup = self->_timersPublisherDispatchGroup;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __54__SOTimersPublisher_getCurrentSnapshotWithCompletion___block_invoke;
    v8[3] = &unk_264487050;
    v8[4] = self;
    id v9 = v4;
    dispatch_group_notify(timersPublisherDispatchGroup, timersPublisherQueue, v8);
  }
}

uint64_t __54__SOTimersPublisher_getCurrentSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = v2[5];
  if (v4) {
    return (*(uint64_t (**)(void, uint64_t, void))(v3 + 16))(*(void *)(a1 + 40), v4, 0);
  }
  else {
    return [v2 _createNewSnapshotWithCompletion:v3];
  }
}

- (SOTimersPublisher)init
{
  v14.receiver = self;
  v14.super_class = (Class)SOTimersPublisher;
  id v2 = [(SOTimersPublisher *)&v14 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("SOTimersPublisher", v3);
    timersPublisherQueue = v2->_timersPublisherQueue;
    v2->_timersPublisherQueue = (OS_dispatch_queue *)v4;

    dispatch_group_t v6 = dispatch_group_create();
    timersPublisherDispatchGroup = v2->_timersPublisherDispatchGroup;
    v2->_timersPublisherDispatchGroup = (OS_dispatch_group *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:5 capacity:0];
    subscribers = v2->_subscribers;
    v2->_subscribers = (NSHashTable *)v8;

    uint64_t v10 = (MTTimerManager *)objc_alloc_init((Class)getMTTimerManagerClass());
    timerManager = v2->_timerManager;
    v2->_timerManager = v10;

    typeName = v2->_typeName;
    v2->_typeName = (NSString *)@"SOTimersPublisher";

    [(SOTimersPublisher *)v2 _startObserving];
  }
  return v2;
}

@end