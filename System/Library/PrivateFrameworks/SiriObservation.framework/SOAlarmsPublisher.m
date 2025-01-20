@interface SOAlarmsPublisher
- (NSString)typeName;
- (SOAlarmsPublisher)init;
- (void)_createNewSnapshotWithCompletion:(id)a3;
- (void)_notifySubscribersOfEvent:(int64_t)a3;
- (void)_startObserving;
- (void)addSubscriber:(id)a3;
- (void)alarmFired:(id)a3;
- (void)alarmsAdded:(id)a3;
- (void)alarmsRemoved:(id)a3;
- (void)alarmsUpdated:(id)a3;
- (void)dealloc;
- (void)firingAlarmChanged:(id)a3;
- (void)firingAlarmDismissed:(id)a3;
- (void)getCurrentSnapshotWithCompletion:(id)a3;
- (void)removeSubscriber:(id)a3;
- (void)stateReset:(id)a3;
@end

@implementation SOAlarmsPublisher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeName, 0);
  objc_storeStrong((id *)&self->_dismissedAlarms, 0);
  objc_storeStrong((id *)&self->_alarmsSnapshot, 0);
  objc_storeStrong((id *)&self->_alarmManager, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSString)typeName
{
  return self->_typeName;
}

- (void)_createNewSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_group_enter((dispatch_group_t)self->_group);
  v5 = [(MTAlarmManager *)self->_alarmManager alarmsIncludingSleepAlarm:1];
  if (v5)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __54__SOAlarmsPublisher__createNewSnapshotWithCompletion___block_invoke;
    v11[3] = &unk_264487118;
    v11[4] = self;
    id v6 = v4;
    id v12 = v6;
    id v7 = (id)[v5 addSuccessBlock:v11];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __54__SOAlarmsPublisher__createNewSnapshotWithCompletion___block_invoke_3;
    v9[3] = &unk_264487140;
    v9[4] = self;
    id v10 = v6;
    id v8 = (id)[v5 addFailureBlock:v9];
  }
}

void __54__SOAlarmsPublisher__createNewSnapshotWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v20 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v2;
  uint64_t v24 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v24)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v5 = [v4 alarmID];
        id v6 = [SOAlarm alloc];
        id v7 = [v4 alarmURL];
        id v8 = [v4 title];
        uint64_t v9 = [v4 hour];
        uint64_t v10 = [v4 minute];
        uint64_t v11 = [v4 repeatSchedule];
        char v12 = [v4 isEnabled];
        BYTE1(v18) = [v4 isFiring];
        LOBYTE(v18) = v12;
        v13 = -[SOAlarm initWithAlarmID:alarmURL:title:hour:minute:repeatSchedule:isEnabled:isFiring:](v6, "initWithAlarmID:alarmURL:title:hour:minute:repeatSchedule:isEnabled:isFiring:", v5, v7, v8, v9, v10, v11, v18);

        [v23 setObject:v13 forKey:v5];
        if ([v4 isFiring]) {
          [v20 addObject:v5];
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v24);
  }

  uint64_t v14 = *(void *)(a1 + 32);
  v15 = *(NSObject **)(v14 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SOAlarmsPublisher__createNewSnapshotWithCompletion___block_invoke_2;
  block[3] = &unk_264486B38;
  block[4] = v14;
  id v26 = v20;
  id v27 = v23;
  id v28 = *(id *)(a1 + 40);
  id v16 = v23;
  id v17 = v20;
  dispatch_async(v15, block);
}

void __54__SOAlarmsPublisher__createNewSnapshotWithCompletion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  dispatch_group_leave(v2);
}

void __54__SOAlarmsPublisher__createNewSnapshotWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFF9B0];
  v3 = [*(id *)(*(void *)(a1 + 32) + 40) firingAlarmIDs];
  id v4 = [v2 orderedSetWithOrderedSet:v3];

  [v4 minusOrderedSet:*(void *)(a1 + 40)];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "addObject:", *(void *)(*((void *)&v19 + 1) + 8 * v9++), (void)v19);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [SOAlarmsSnapshot alloc];
  uint64_t v11 = [MEMORY[0x263EFF910] now];
  char v12 = (void *)[*(id *)(a1 + 48) copy];
  v13 = (void *)[*(id *)(a1 + 40) copy];
  uint64_t v14 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) copy];
  v15 = [(SOAlarmsSnapshot *)v10 initWithDate:v11 alarmsByID:v12 firingAlarmIDs:v13 dismissedAlarmIDs:v14];

  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;
  uint64_t v18 = v15;

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 16));
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SOAlarmsPublisher;
  [(SOAlarmsPublisher *)&v4 dealloc];
}

- (void)_startObserving
{
  if (self->_alarmManager)
  {
    id v10 = [MEMORY[0x263F08A00] defaultCenter];
    v3 = getMTAlarmManagerAlarmsAdded_127();
    [v10 addObserver:self selector:sel_alarmsAdded_ name:v3 object:self->_alarmManager];

    objc_super v4 = getMTAlarmManagerAlarmsUpdated_128();
    [v10 addObserver:self selector:sel_alarmsUpdated_ name:v4 object:self->_alarmManager];

    id v5 = getMTAlarmManagerAlarmsRemoved_129();
    [v10 addObserver:self selector:sel_alarmsRemoved_ name:v5 object:self->_alarmManager];

    uint64_t v6 = getMTAlarmManagerAlarmFired_130();
    [v10 addObserver:self selector:sel_alarmFired_ name:v6 object:self->_alarmManager];

    uint64_t v7 = getMTAlarmManagerFiringAlarmChanged_131();
    [v10 addObserver:self selector:sel_firingAlarmChanged_ name:v7 object:self->_alarmManager];

    uint64_t v8 = getMTAlarmManagerFiringAlarmDismissed_132();
    [v10 addObserver:self selector:sel_firingAlarmDismissed_ name:v8 object:self->_alarmManager];

    uint64_t v9 = getMTAlarmManagerStateReset_133();
    [v10 addObserver:self selector:sel_stateReset_ name:v9 object:self->_alarmManager];
  }
}

- (void)_notifySubscribersOfEvent:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__SOAlarmsPublisher__notifySubscribersOfEvent___block_invoke;
  v3[3] = &unk_264486B10;
  v3[4] = self;
  v3[5] = a3;
  [(SOAlarmsPublisher *)self _createNewSnapshotWithCompletion:v3];
}

void __47__SOAlarmsPublisher__notifySubscribersOfEvent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && !v6)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = *(id *)(*(void *)(a1 + 32) + 24);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "snapshotAvailable:forEvent:", v5, *(void *)(a1 + 40), (void)v13);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
  if (*(void *)(a1 + 40) == 5) {
    [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  }
}

- (void)stateReset:(id)a3
{
}

- (void)firingAlarmDismissed:(id)a3
{
}

- (void)firingAlarmChanged:(id)a3
{
}

- (void)alarmFired:(id)a3
{
}

- (void)alarmsRemoved:(id)a3
{
}

- (void)alarmsUpdated:(id)a3
{
}

- (void)alarmsAdded:(id)a3
{
}

- (void)removeSubscriber:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__SOAlarmsPublisher_removeSubscriber___block_invoke;
    v7[3] = &unk_2644870A0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __38__SOAlarmsPublisher_removeSubscriber___block_invoke(uint64_t a1)
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
    v6[2] = __35__SOAlarmsPublisher_addSubscriber___block_invoke;
    v6[3] = &unk_264486AE8;
    v6[4] = self;
    id v7 = v4;
    [(SOAlarmsPublisher *)self getCurrentSnapshotWithCompletion:v6];
  }
}

void __35__SOAlarmsPublisher_addSubscriber___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
  if (v5) {
    NSLog(&cfstr_Soalarmspublis.isa, v5);
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
    queue = self->_queue;
    group = self->_group;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __54__SOAlarmsPublisher_getCurrentSnapshotWithCompletion___block_invoke;
    v8[3] = &unk_264487050;
    v8[4] = self;
    id v9 = v4;
    dispatch_group_notify(group, queue, v8);
  }
}

uint64_t __54__SOAlarmsPublisher_getCurrentSnapshotWithCompletion___block_invoke(uint64_t a1)
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

- (SOAlarmsPublisher)init
{
  v16.receiver = self;
  v16.super_class = (Class)SOAlarmsPublisher;
  id v2 = [(SOAlarmsPublisher *)&v16 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("SOAlarmPublisher", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    dispatch_group_t v6 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:5 capacity:0];
    subscribers = v2->_subscribers;
    v2->_subscribers = (NSHashTable *)v8;

    uint64_t v10 = (MTAlarmManager *)objc_alloc_init((Class)getMTAlarmManagerClass_207());
    alarmManager = v2->_alarmManager;
    v2->_alarmManager = v10;

    typeName = v2->_typeName;
    v2->_typeName = (NSString *)@"SOAlarmPublisher";

    long long v13 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9B0]);
    dismissedAlarms = v2->_dismissedAlarms;
    v2->_dismissedAlarms = v13;

    [(SOAlarmsPublisher *)v2 _startObserving];
  }
  return v2;
}

@end