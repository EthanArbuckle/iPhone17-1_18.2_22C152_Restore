@interface MTScheduledList
+ (id)_dateIntervalFilter:(id)a3;
+ (id)_filterScheduledObjects:(id)a3 withBlock:(id)a4;
+ (id)_nextScheduledObjectInSets:(id)a3;
+ (id)_scheduledObjectComparator;
+ (void)_sort:(id)a3;
+ (void)_sortAndFilter:(id)a3;
+ (void)_sortAndFilter:(id)a3 objectsToScheduleAhead:(id)a4;
- (BOOL)isScheduled:(id)a3;
- (MTScheduledList)init;
- (MTScheduledList)initWithDelegate:(id)a3;
- (MTScheduledListDelegate)delegate;
- (NSArray)scheduledAlerts;
- (NSArray)scheduledAlertsAndNotifications;
- (NSArray)scheduledObjects;
- (NSMutableDictionary)scheduledAlertMap;
- (NSMutableOrderedSet)orderedScheduledAlerts;
- (NSMutableOrderedSet)orderedScheduledEvents;
- (NSMutableOrderedSet)orderedScheduledNotifications;
- (id)_scheduledListForTriggerType:(unint64_t)a3;
- (id)description;
- (id)nextScheduledAlert;
- (id)nextScheduledAlertOrNotification;
- (id)nextScheduledObject;
- (id)nextScheduledObjectWithTriggerType:(unint64_t)a3;
- (id)scheduledObjectsToFireBeforeDate:(id)a3;
- (id)scheduledObjectsToFireInInterval:(id)a3;
- (unint64_t)numberOfScheduledAlerts;
- (unint64_t)numberOfScheduledAlertsAndNotifications;
- (void)_performScheduleChangingBlock:(id)a3 withCompletion:(id)a4;
- (void)_scheduleObject:(id)a3;
- (void)_unschedule:(id)a3;
- (void)_unscheduleObject:(id)a3;
- (void)reset;
- (void)schedule:(id)a3 afterDate:(id)a4 withCompletion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setOrderedScheduledAlerts:(id)a3;
- (void)setOrderedScheduledEvents:(id)a3;
- (void)setOrderedScheduledNotifications:(id)a3;
- (void)setScheduledAlertMap:(id)a3;
- (void)unschedule:(id)a3;
@end

@implementation MTScheduledList

- (id)nextScheduledAlert
{
  return (id)[(NSMutableOrderedSet *)self->_orderedScheduledAlerts firstObject];
}

- (MTScheduledList)init
{
  return [(MTScheduledList *)self initWithDelegate:0];
}

- (MTScheduledList)initWithDelegate:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MTScheduledList;
  v5 = [(MTScheduledList *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = objc_opt_new();
    orderedScheduledAlerts = v6->_orderedScheduledAlerts;
    v6->_orderedScheduledAlerts = (NSMutableOrderedSet *)v7;

    uint64_t v9 = objc_opt_new();
    orderedScheduledNotifications = v6->_orderedScheduledNotifications;
    v6->_orderedScheduledNotifications = (NSMutableOrderedSet *)v9;

    uint64_t v11 = objc_opt_new();
    orderedScheduledEvents = v6->_orderedScheduledEvents;
    v6->_orderedScheduledEvents = (NSMutableOrderedSet *)v11;

    uint64_t v13 = objc_opt_new();
    scheduledAlertMap = v6->_scheduledAlertMap;
    v6->_scheduledAlertMap = (NSMutableDictionary *)v13;
  }
  return v6;
}

- (unint64_t)numberOfScheduledAlerts
{
  return [(NSMutableOrderedSet *)self->_orderedScheduledAlerts count];
}

- (unint64_t)numberOfScheduledAlertsAndNotifications
{
  uint64_t v3 = [(NSMutableOrderedSet *)self->_orderedScheduledAlerts count];
  return [(NSMutableOrderedSet *)self->_orderedScheduledNotifications count] + v3;
}

- (NSArray)scheduledAlerts
{
  return (NSArray *)[(NSMutableOrderedSet *)self->_orderedScheduledAlerts array];
}

+ (void)_sort:(id)a3
{
  id v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"MTScheduledList.m" lineNumber:54 description:@"Not a mutable ordered collection"];
  }
  id v7 = [(id)objc_opt_class() _scheduledObjectComparator];
  [v5 sortUsingComparator:v7];
}

+ (void)_sortAndFilter:(id)a3
{
}

+ (void)_sortAndFilter:(id)a3 objectsToScheduleAhead:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:a1 file:@"MTScheduledList.m" lineNumber:64 description:@"Not a mutable ordered collection"];
  }
  uint64_t v9 = [(id)objc_opt_class() _scheduledObjectComparator];
  [v7 sortUsingComparator:v9];

  v10 = objc_opt_new();
  uint64_t v11 = objc_opt_new();
  v12 = objc_opt_new();
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __57__MTScheduledList__sortAndFilter_objectsToScheduleAhead___block_invoke;
  v34[3] = &unk_1E5914F48;
  id v13 = v11;
  id v35 = v13;
  id v14 = v12;
  id v36 = v14;
  id v15 = v10;
  id v37 = v15;
  [v7 enumerateObjectsUsingBlock:v34];
  if ([v13 count])
  {
    objc_super v16 = [v13 firstObject];
    v17 = objc_opt_new();
    v18 = [MEMORY[0x1E4F1C9A8] mtGregorianCalendar];
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __57__MTScheduledList__sortAndFilter_objectsToScheduleAhead___block_invoke_2;
    v28 = &unk_1E5914F70;
    id v19 = v16;
    id v29 = v19;
    id v30 = v18;
    id v20 = v17;
    id v31 = v20;
    id v32 = v8;
    id v33 = a1;
    id v21 = v18;
    [v15 enumerateObjectsUsingBlock:&v25];
    v22 = objc_msgSend(v19, "trigger", v25, v26, v27, v28);
    int v23 = [v22 isPastOverrideEvent];

    if (v23) {
      [v20 addObject:v19];
    }
    if ([v20 count]) {
      [v7 removeObjectsInArray:v20];
    }
    if ([v14 count]) {
      [v7 removeObjectsInArray:v14];
    }
  }
}

void __57__MTScheduledList__sortAndFilter_objectsToScheduleAhead___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v4 = [v15 trigger];
  uint64_t v5 = [v4 triggerType];
  v6 = v15;
  if (v5 != 4)
  {
    v2 = [v15 trigger];
    if ([v2 triggerType] != 5)
    {

LABEL_14:
      uint64_t v9 = v15;
      goto LABEL_15;
    }
    v6 = v15;
  }
  id v7 = [v6 scheduleable];
  int v8 = [v7 isSleepItem];

  if (v5 != 4)
  {

    uint64_t v9 = v15;
    if ((v8 & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_8;
  }

  uint64_t v9 = v15;
  if (v8)
  {
LABEL_8:
    v10 = [v9 scheduleable];
    int v11 = [v10 isSingleTime];

    if (v11)
    {
      [*(id *)(a1 + 32) addObject:v15];
      v12 = [v15 scheduleable];
      char v13 = [v12 isItemEnabled];

      uint64_t v9 = v15;
      if (v13) {
        goto LABEL_15;
      }
      id v14 = *(void **)(a1 + 40);
    }
    else
    {
      id v14 = *(void **)(a1 + 48);
    }
    [v14 addObject:v15];
    goto LABEL_14;
  }
LABEL_15:
}

void __57__MTScheduledList__sortAndFilter_objectsToScheduleAhead___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) scheduleable];
  int v5 = [v4 overridesScheduledObject:v3 calendar:*(void *)(a1 + 40)];

  if (v5)
  {
    [*(id *)(a1 + 48) addObject:v3];
    v6 = [v3 scheduleable];
    id v7 = [v3 trigger];
    int v8 = [v7 triggerDate];
    uint64_t v9 = [v6 upcomingTriggersAfterDate:v8];

    if ([v9 count])
    {
      v10 = *(void **)(a1 + 56);
      int v11 = [v3 scheduleable];
      v12 = [v9 firstObject];
      uint64_t v13 = +[MTScheduledObject scheduledObjectForScheduleable:v11 trigger:v12];
      [v10 addObject:v13];

      id v14 = [v3 scheduleable];
      LOBYTE(v13) = objc_opt_respondsToSelector();

      if (v13)
      {
        id v15 = *(void **)(a1 + 40);
        objc_super v16 = [v3 trigger];
        v17 = [v16 triggerDate];
        v18 = [v15 startOfDayForDate:v17];

        id v19 = [*(id *)(a1 + 40) dateByAddingUnit:16 value:1 toDate:v18 options:0];
        id v20 = [*(id *)(a1 + 40) dateByAddingUnit:128 value:-1 toDate:v19 options:0];
        id v21 = [v3 scheduleable];
        [v21 scheduleOverridenForDate:v20];
      }
    }
  }
  else
  {
    uint64_t v9 = MTLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = *(void *)(a1 + 64);
      int v23 = [*(id *)(a1 + 32) debugDescription];
      v24 = [v3 debugDescription];
      int v25 = 138543874;
      uint64_t v26 = v22;
      __int16 v27 = 2114;
      v28 = v23;
      __int16 v29 = 2114;
      id v30 = v24;
      _os_log_debug_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ event %{public}@ failed to override event %{public}@ keeping original wake event schedule", (uint8_t *)&v25, 0x20u);
    }
  }
}

+ (id)_scheduledObjectComparator
{
  return &__block_literal_global_3;
}

uint64_t __45__MTScheduledList__scheduledObjectComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 trigger];
  id v7 = [v6 triggerDate];
  int v8 = [v5 trigger];
  uint64_t v9 = [v8 triggerDate];
  int v10 = [v7 isEqualToDate:v9];

  if (v10)
  {
    int v11 = [v5 trigger];
    uint64_t v12 = [v11 triggerType];
    uint64_t v13 = [v4 trigger];
    uint64_t v14 = v12 - [v13 triggerType];
  }
  else
  {
    int v11 = [v4 trigger];
    uint64_t v13 = [v11 triggerDate];
    id v15 = [v5 trigger];
    objc_super v16 = [v15 triggerDate];
    uint64_t v14 = [v13 compare:v16];
  }
  return v14;
}

- (NSArray)scheduledAlertsAndNotifications
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(NSMutableOrderedSet *)self->_orderedScheduledAlerts array];
  id v5 = [v3 arrayWithArray:v4];

  v6 = [(NSMutableOrderedSet *)self->_orderedScheduledNotifications array];
  [v5 addObjectsFromArray:v6];

  [(id)objc_opt_class() _sortAndFilter:v5];
  return (NSArray *)v5;
}

- (NSArray)scheduledObjects
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(MTScheduledList *)self scheduledAlertsAndNotifications];
  id v5 = [v3 arrayWithArray:v4];

  v6 = [(NSMutableOrderedSet *)self->_orderedScheduledEvents array];
  [v5 addObjectsFromArray:v6];

  [(id)objc_opt_class() _sortAndFilter:v5];
  return (NSArray *)v5;
}

- (id)scheduledObjectsToFireBeforeDate:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  v6 = [(MTScheduledList *)self scheduledObjects];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__MTScheduledList_scheduledObjectsToFireBeforeDate___block_invoke;
  v10[3] = &unk_1E5914FB8;
  id v11 = v4;
  id v7 = v4;
  int v8 = [v5 _filterScheduledObjects:v6 withBlock:v10];

  return v8;
}

BOOL __52__MTScheduledList_scheduledObjectsToFireBeforeDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 trigger];
  id v4 = [v3 triggerDate];
  id v5 = v4;
  BOOL v6 = v4 && ([v4 mtIsBeforeOrSameAsDate:*(void *)(a1 + 32)] & 1) != 0;

  return v6;
}

- (id)scheduledObjectsToFireInInterval:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  BOOL v6 = [(MTScheduledList *)self scheduledObjects];
  id v7 = [(id)objc_opt_class() _dateIntervalFilter:v4];

  int v8 = [v5 _filterScheduledObjects:v6 withBlock:v7];

  return v8;
}

+ (id)_dateIntervalFilter:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__MTScheduledList__dateIntervalFilter___block_invoke;
  v7[3] = &unk_1E5914FB8;
  id v8 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x19F3A0FB0](v7);

  return v5;
}

BOOL __39__MTScheduledList__dateIntervalFilter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 trigger];
  id v4 = [v3 triggerDate];
  BOOL v5 = v4 && ([*(id *)(a1 + 32) containsDate:v4] & 1) != 0;

  return v5;
}

+ (id)_filterScheduledObjects:(id)a3 withBlock:(id)a4
{
  return (id)objc_msgSend(a3, "na_filter:", a4);
}

- (id)nextScheduledAlertOrNotification
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_class();
  orderedScheduledAlerts = self->_orderedScheduledAlerts;
  v8[0] = self->_orderedScheduledNotifications;
  v8[1] = orderedScheduledAlerts;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  BOOL v6 = [v3 _nextScheduledObjectInSets:v5];

  return v6;
}

- (id)nextScheduledObject
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_class();
  orderedScheduledNotifications = self->_orderedScheduledNotifications;
  orderedScheduledAlerts = self->_orderedScheduledAlerts;
  v9[0] = self->_orderedScheduledEvents;
  v9[1] = orderedScheduledNotifications;
  v9[2] = orderedScheduledAlerts;
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  id v7 = [v3 _nextScheduledObjectInSets:v6];

  return v7;
}

+ (id)_nextScheduledObjectInSets:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    BOOL v5 = 0;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = [*(id *)(*((void *)&v18 + 1) + 8 * i) firstObject];
        uint64_t v9 = v8;
        if (!v5) {
          goto LABEL_8;
        }
        int v10 = [v8 trigger];
        id v11 = [v10 triggerDate];
        uint64_t v12 = [v5 trigger];
        uint64_t v13 = [v12 triggerDate];
        int v14 = [v11 mtIsBeforeDate:v13];

        if (v14)
        {
LABEL_8:
          id v15 = v9;

          BOOL v5 = v15;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)nextScheduledObjectWithTriggerType:(unint64_t)a3
{
  uint64_t v4 = -[MTScheduledList _scheduledListForTriggerType:](self, "_scheduledListForTriggerType:");
  BOOL v5 = [v4 array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__MTScheduledList_nextScheduledObjectWithTriggerType___block_invoke;
  void v8[3] = &__block_descriptor_40_e27_B16__0__MTScheduledObject_8l;
  v8[4] = a3;
  uint64_t v6 = objc_msgSend(v5, "na_firstObjectPassingTest:", v8);

  return v6;
}

BOOL __54__MTScheduledList_nextScheduledObjectWithTriggerType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 trigger];
  BOOL v4 = [v3 triggerType] == *(void *)(a1 + 32);

  return v4;
}

- (id)_scheduledListForTriggerType:(unint64_t)a3
{
  unint64_t v4 = +[MTScheduledObject scheduledTypeForTriggerType:a3];
  if (v4 > 2) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = (&self->_orderedScheduledAlerts)[v4];
  }
  return v5;
}

- (void)reset
{
  [(NSMutableOrderedSet *)self->_orderedScheduledAlerts removeAllObjects];
  [(NSMutableOrderedSet *)self->_orderedScheduledNotifications removeAllObjects];
  [(NSMutableOrderedSet *)self->_orderedScheduledEvents removeAllObjects];
  scheduledAlertMap = self->_scheduledAlertMap;
  [(NSMutableDictionary *)scheduledAlertMap removeAllObjects];
}

- (void)unschedule:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__MTScheduledList_unschedule___block_invoke;
  v6[3] = &unk_1E5915000;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(MTScheduledList *)self _performScheduleChangingBlock:v6 withCompletion:0];
}

void __30__MTScheduledList_unschedule___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
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
        objc_msgSend(*(id *)(a1 + 40), "_unschedule:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_unschedule:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  scheduledAlertMap = self->_scheduledAlertMap;
  uint64_t v5 = [a3 identifier];
  uint64_t v6 = [(NSMutableDictionary *)scheduledAlertMap objectForKeyedSubscript:v5];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v7 = objc_msgSend(v6, "allValues", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(MTScheduledList *)self _unscheduleObject:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)schedule:(id)a3 afterDate:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__MTScheduledList_schedule_afterDate_withCompletion___block_invoke;
  v12[3] = &unk_1E5915078;
  id v13 = v8;
  long long v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(MTScheduledList *)self _performScheduleChangingBlock:v12 withCompletion:a5];
}

void __53__MTScheduledList_schedule_afterDate_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [*(id *)(a1 + 40) _unschedule:v7];
        if ([v7 shouldBeScheduled])
        {
          id v8 = [v7 upcomingTriggersAfterDate:*(void *)(a1 + 48)];
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __53__MTScheduledList_schedule_afterDate_withCompletion___block_invoke_2;
          v11[3] = &unk_1E5915028;
          v11[4] = v7;
          id v9 = objc_msgSend(v8, "na_map:", v11);
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __53__MTScheduledList_schedule_afterDate_withCompletion___block_invoke_3;
          v10[3] = &unk_1E5915050;
          void v10[4] = *(void *)(a1 + 40);
          objc_msgSend(v9, "na_each:", v10);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

id __53__MTScheduledList_schedule_afterDate_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[MTScheduledObject scheduledObjectForScheduleable:*(void *)(a1 + 32) trigger:a2];
}

uint64_t __53__MTScheduledList_schedule_afterDate_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _scheduleObject:a2];
}

- (void)_scheduleObject:(id)a3
{
  id v16 = a3;
  uint64_t v4 = [v16 trigger];
  uint64_t v5 = -[MTScheduledList _scheduledListForTriggerType:](self, "_scheduledListForTriggerType:", [v4 triggerType]);

  [v5 addObject:v16];
  scheduledAlertMap = self->_scheduledAlertMap;
  long long v7 = [v16 scheduleable];
  id v8 = [v7 identifier];
  id v9 = [(NSMutableDictionary *)scheduledAlertMap objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v9 = objc_opt_new();
    id v10 = self->_scheduledAlertMap;
    id v11 = [v16 scheduleable];
    long long v12 = [v11 identifier];
    [(NSMutableDictionary *)v10 setObject:v9 forKeyedSubscript:v12];
  }
  long long v13 = (void *)MEMORY[0x1E4F28ED0];
  long long v14 = [v16 trigger];
  long long v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "triggerType"));
  [v9 setObject:v16 forKeyedSubscript:v15];
}

- (void)_performScheduleChangingBlock:(id)a3 withCompletion:(id)a4
{
  uint64_t v6 = (void (**)(void))a4;
  long long v7 = (void (**)(void))a3;
  id v8 = [(MTScheduledList *)self nextScheduledAlertOrNotification];
  v7[2](v7);

  id v9 = objc_opt_new();
  [(id)objc_opt_class() _sortAndFilter:self->_orderedScheduledAlerts objectsToScheduleAhead:v9];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__MTScheduledList__performScheduleChangingBlock_withCompletion___block_invoke;
  v12[3] = &unk_1E5915050;
  void v12[4] = self;
  objc_msgSend(v9, "na_each:", v12);
  [(id)objc_opt_class() _sort:self->_orderedScheduledNotifications];
  [(id)objc_opt_class() _sort:self->_orderedScheduledEvents];
  id v10 = [(MTScheduledList *)self nextScheduledAlertOrNotification];
  if (v8 == v10 || ([v8 isEqual:v10] & 1) != 0)
  {
    if (v6) {
      v6[2](v6);
    }
  }
  else
  {
    id v11 = [(MTScheduledList *)self delegate];
    [v11 scheduledListDidChange:self withCompletion:v6];
  }
}

uint64_t __64__MTScheduledList__performScheduleChangingBlock_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _scheduleObject:a2];
}

- (BOOL)isScheduled:(id)a3
{
  id v4 = a3;
  scheduledAlertMap = self->_scheduledAlertMap;
  uint64_t v6 = [v4 scheduleable];
  long long v7 = [v6 identifier];
  id v8 = [(NSMutableDictionary *)scheduledAlertMap objectForKeyedSubscript:v7];
  id v9 = (void *)MEMORY[0x1E4F28ED0];
  id v10 = [v4 trigger];
  id v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "triggerType"));
  long long v12 = [v8 objectForKeyedSubscript:v11];

  if (v12)
  {
    long long v13 = [v4 trigger];
    long long v14 = [v13 triggerDate];

    long long v15 = [v12 trigger];
    id v16 = [v15 triggerDate];

    BOOL v17 = [v14 compare:v16] != -1;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)_unscheduleObject:(id)a3
{
  id v16 = a3;
  id v4 = [v16 trigger];
  uint64_t v5 = -[MTScheduledList _scheduledListForTriggerType:](self, "_scheduledListForTriggerType:", [v4 triggerType]);

  [v5 removeObject:v16];
  scheduledAlertMap = self->_scheduledAlertMap;
  long long v7 = [v16 scheduleable];
  id v8 = [v7 identifier];
  id v9 = [(NSMutableDictionary *)scheduledAlertMap objectForKeyedSubscript:v8];

  id v10 = (void *)MEMORY[0x1E4F28ED0];
  id v11 = [v16 trigger];
  long long v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "triggerType"));
  [v9 removeObjectForKey:v12];

  if (![v9 count])
  {
    long long v13 = self->_scheduledAlertMap;
    long long v14 = [v16 scheduleable];
    long long v15 = [v14 identifier];
    [(NSMutableDictionary *)v13 removeObjectForKey:v15];
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(MTScheduledList *)self orderedScheduledAlerts];
  uint64_t v5 = [(MTScheduledList *)self orderedScheduledNotifications];
  uint64_t v6 = [(MTScheduledList *)self orderedScheduledEvents];
  long long v7 = [v3 stringWithFormat:@"Alerts: %@, Notifications: %@, Events: %@", v4, v5, v6];

  return v7;
}

- (MTScheduledListDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MTScheduledListDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableOrderedSet)orderedScheduledAlerts
{
  return self->_orderedScheduledAlerts;
}

- (void)setOrderedScheduledAlerts:(id)a3
{
}

- (NSMutableOrderedSet)orderedScheduledNotifications
{
  return self->_orderedScheduledNotifications;
}

- (void)setOrderedScheduledNotifications:(id)a3
{
}

- (NSMutableOrderedSet)orderedScheduledEvents
{
  return self->_orderedScheduledEvents;
}

- (void)setOrderedScheduledEvents:(id)a3
{
}

- (NSMutableDictionary)scheduledAlertMap
{
  return self->_scheduledAlertMap;
}

- (void)setScheduledAlertMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledAlertMap, 0);
  objc_storeStrong((id *)&self->_orderedScheduledEvents, 0);
  objc_storeStrong((id *)&self->_orderedScheduledNotifications, 0);
  objc_storeStrong((id *)&self->_orderedScheduledAlerts, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end