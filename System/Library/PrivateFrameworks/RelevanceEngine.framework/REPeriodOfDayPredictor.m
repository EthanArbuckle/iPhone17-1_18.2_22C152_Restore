@interface REPeriodOfDayPredictor
+ (double)updateInterval;
- (NSArray)storedPeriods;
- (NSDateInterval)intervalForCurrentPeriodOfDay;
- (id)_defaultDayPeriodsOfDayForDate:(id)a3;
- (id)_init;
- (id)_nextDayPeriodUpdateDate;
- (id)_periodsOfDayForSleepIntervals:(id)a3;
- (id)dateIntervalForNextPeriodOfDay:(unint64_t)a3;
- (id)dateIntervalForNextPeriodOfDay:(unint64_t)a3 afterDate:(id)a4;
- (id)dateIntervalForPreviousPeriodOfDay:(unint64_t)a3;
- (id)dateIntervalForPreviousPeriodOfDay:(unint64_t)a3 beforeDate:(id)a4;
- (unint64_t)currentPeriodOfDay;
- (void)_getAllSleepIntervalsWithCompletion:(id)a3;
- (void)_getHistoricSleepIntervalsWithCompletion:(id)a3;
- (void)_getPredictedSleepIntervalsWithCompletion:(id)a3;
- (void)_handleSignificantTimeChange;
- (void)_queue_updateNextDateUpdateTimer;
- (void)currentPeriodOfDay;
- (void)dealloc;
- (void)update;
@end

@implementation REPeriodOfDayPredictor

+ (double)updateInterval
{
  return 3600.0;
}

- (id)_init
{
  v17.receiver = self;
  v17.super_class = (Class)REPeriodOfDayPredictor;
  v2 = [(REPredictor *)&v17 _init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)v2[9];
    v2[9] = v3;

    v5 = [MEMORY[0x263EFF910] date];
    uint64_t v6 = [v2 _defaultDayPeriodsOfDayForDate:v5];
    v7 = (void *)v2[8];
    v2[8] = v6;

    uint64_t v8 = +[RESingleton sharedInstance];
    v9 = (void *)v2[11];
    v2[11] = v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263F75EA8]) initWithIdentifier:@"com.apple.RelevanceEngine.REPeriodOfDayPredictor"];
    v11 = (void *)v2[12];
    v2[12] = v10;

    v12 = [MEMORY[0x263F08A00] defaultCenter];
    v13 = RESignificantTimeChangeNotification();
    [v12 addObserver:v2 selector:sel__handleSignificantTimeChange name:v13 object:0];

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __31__REPeriodOfDayPredictor__init__block_invoke;
    v15[3] = &unk_2644BC660;
    v16 = v2;
    [v16 onQueue:v15];
  }
  return v2;
}

uint64_t __31__REPeriodOfDayPredictor__init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateNextDateUpdateTimer");
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  v4 = RESignificantTimeChangeNotification();
  [v3 removeObserver:self name:v4 object:0];

  v5.receiver = self;
  v5.super_class = (Class)REPeriodOfDayPredictor;
  [(REPredictor *)&v5 dealloc];
}

- (id)_defaultDayPeriodsOfDayForDate:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263EFF8F0] currentCalendar];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __57__REPeriodOfDayPredictor__defaultDayPeriodsOfDayForDate___block_invoke;
  v26[3] = &unk_2644BD538;
  id v5 = v4;
  id v27 = v5;
  uint64_t v6 = (void (**)(void, void))MEMORY[0x223C31700](v26);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __57__REPeriodOfDayPredictor__defaultDayPeriodsOfDayForDate___block_invoke_2;
  v24[3] = &unk_2644BD538;
  id v7 = v5;
  id v25 = v7;
  uint64_t v8 = (void (**)(void, void))MEMORY[0x223C31700](v24);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __57__REPeriodOfDayPredictor__defaultDayPeriodsOfDayForDate___block_invoke_3;
  v22[3] = &unk_2644BD560;
  id v18 = v7;
  id v23 = v18;
  v9 = (void (**)(void, void, void))MEMORY[0x223C31700](v22);
  v21 = v3;
  uint64_t v10 = ((void (**)(void, id, uint64_t))v9)[2](v9, v3, -3);
  v20 = [MEMORY[0x263EFF980] array];
  for (uint64_t i = -2; i != 4; ++i)
  {
    v12 = v10;
    uint64_t v10 = ((void (**)(void, void *, uint64_t))v9)[2](v9, v21, i);
    v13 = ((void (**)(void, void *))v8)[2](v8, v12);
    v14 = ((void (**)(void, void *))v6)[2](v6, v10);

    v15 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v13 endDate:v14];
    [v20 addObject:v15];
  }
  v16 = [(REPeriodOfDayPredictor *)self _periodsOfDayForSleepIntervals:v20];

  return v16;
}

uint64_t __57__REPeriodOfDayPredictor__defaultDayPeriodsOfDayForDate___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) dateBySettingHour:7 minute:0 second:0 ofDate:a2 options:0];
}

uint64_t __57__REPeriodOfDayPredictor__defaultDayPeriodsOfDayForDate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) dateBySettingHour:21 minute:0 second:0 ofDate:a2 options:0];
}

id __57__REPeriodOfDayPredictor__defaultDayPeriodsOfDayForDate___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  v4 = [v3 dateByAddingUnit:16 value:a3 toDate:a2 options:0];
  id v5 = [v3 startOfDayForDate:v4];

  return v5;
}

- (void)_handleSignificantTimeChange
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __54__REPeriodOfDayPredictor__handleSignificantTimeChange__block_invoke;
  v2[3] = &unk_2644BC660;
  v2[4] = self;
  [(REPredictor *)self onQueue:v2];
}

uint64_t __54__REPeriodOfDayPredictor__handleSignificantTimeChange__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__REPeriodOfDayPredictor__handleSignificantTimeChange__block_invoke_2;
  v3[3] = &unk_2644BD588;
  v3[4] = v1;
  return [v1 enumerateObservers:v3];
}

void __54__REPeriodOfDayPredictor__handleSignificantTimeChange__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 periodOfDayPredictorDidUpdatePredictedIntervals:*(void *)(a1 + 32)];
  }
}

- (unint64_t)currentPeriodOfDay
{
  [(NSLock *)self->_storedPeriodsLock lock];
  id v3 = (void *)[(NSArray *)self->_storedPeriods copy];
  [(NSLock *)self->_storedPeriodsLock unlock];
  v4 = [MEMORY[0x263EFF910] date];
  uint64_t v5 = REIndexOfDateInPeriodsOfDay(v4, v3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = RELogForDomain(8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[REPeriodOfDayPredictor currentPeriodOfDay]();
    }

    id v7 = [(REPeriodOfDayPredictor *)self _defaultDayPeriodsOfDayForDate:v4];
    uint64_t v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", REIndexOfDateInPeriodsOfDay(v4, v7));
    unint64_t v9 = [v8 periodOfDay];
  }
  else
  {
    id v7 = [v3 objectAtIndexedSubscript:v5];
    unint64_t v9 = [v7 periodOfDay];
  }

  return v9;
}

- (NSDateInterval)intervalForCurrentPeriodOfDay
{
  [(NSLock *)self->_storedPeriodsLock lock];
  id v3 = (void *)[(NSArray *)self->_storedPeriods copy];
  [(NSLock *)self->_storedPeriodsLock unlock];
  v4 = [MEMORY[0x263EFF910] date];
  uint64_t v5 = REIndexOfDateInPeriodsOfDay(v4, v3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = RELogForDomain(8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[REPeriodOfDayPredictor currentPeriodOfDay]();
    }

    id v7 = [(REPeriodOfDayPredictor *)self _defaultDayPeriodsOfDayForDate:v4];
    uint64_t v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", REIndexOfDateInPeriodsOfDay(v4, v7));
    unint64_t v9 = [v8 interval];
  }
  else
  {
    id v7 = [v3 objectAtIndexedSubscript:v5];
    unint64_t v9 = [v7 interval];
  }

  return (NSDateInterval *)v9;
}

- (id)dateIntervalForNextPeriodOfDay:(unint64_t)a3
{
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  uint64_t v6 = [(REPeriodOfDayPredictor *)self dateIntervalForNextPeriodOfDay:a3 afterDate:v5];
  if (!v6)
  {
    id v7 = (void *)MEMORY[0x263EFF940];
    uint64_t v8 = *MEMORY[0x263EFF498];
    if (a3 > 2) {
      unint64_t v9 = 0;
    }
    else {
      unint64_t v9 = off_2644BD6B8[a3];
    }
    uint64_t v10 = [(REPeriodOfDayPredictor *)self _defaultDayPeriodsOfDayForDate:v5];
    [v7 raise:v8, @"Unable to find %@ after date %@ in default dates: %@", v9, v5, v10 format];
  }
  return v6;
}

- (id)dateIntervalForNextPeriodOfDay:(unint64_t)a3 afterDate:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [(NSLock *)self->_storedPeriodsLock lock];
  id v7 = (void *)[(NSArray *)self->_storedPeriods copy];
  [(NSLock *)self->_storedPeriodsLock unlock];
  uint64_t v8 = REIndexOfDateInPeriodsOfDay(v6, v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (unint64_t i = v8 + 1; i < [v7 count]; ++i)
    {
      v12 = [v7 objectAtIndexedSubscript:i];
      if ([v12 periodOfDay] == a3)
      {
        objc_super v17 = [v12 interval];

        goto LABEL_18;
      }
    }
  }
  unint64_t v9 = RELogForDomain(8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if (a3 > 2) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = off_2644BD6B8[a3];
    }
    int v19 = 138412546;
    v20 = v10;
    __int16 v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_21E6E6000, v9, OS_LOG_TYPE_INFO, "Unable to find %@ in current data: %@\nfalling back to default data", (uint8_t *)&v19, 0x16u);
  }

  v13 = [MEMORY[0x263EFF910] date];
  v14 = [(REPeriodOfDayPredictor *)self _defaultDayPeriodsOfDayForDate:v13];

  for (unint64_t j = REIndexOfDateInPeriodsOfDay(v6, v14) + 1; ; ++j)
  {
    if (j >= [v14 count])
    {
      objc_super v17 = 0;
      goto LABEL_17;
    }
    v16 = [v14 objectAtIndexedSubscript:j];
    if ([v16 periodOfDay] == a3) {
      break;
    }
  }
  objc_super v17 = [v16 interval];

LABEL_17:
LABEL_18:

  return v17;
}

- (id)dateIntervalForPreviousPeriodOfDay:(unint64_t)a3
{
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  id v6 = [(REPeriodOfDayPredictor *)self dateIntervalForPreviousPeriodOfDay:a3 beforeDate:v5];
  if (!v6)
  {
    id v7 = (void *)MEMORY[0x263EFF940];
    uint64_t v8 = *MEMORY[0x263EFF498];
    if (a3 > 2) {
      unint64_t v9 = 0;
    }
    else {
      unint64_t v9 = off_2644BD6B8[a3];
    }
    uint64_t v10 = [(REPeriodOfDayPredictor *)self _defaultDayPeriodsOfDayForDate:v5];
    [v7 raise:v8, @"Unable to find %@ before date %@ in default dates: %@", v9, v5, v10 format];
  }
  return v6;
}

- (id)dateIntervalForPreviousPeriodOfDay:(unint64_t)a3 beforeDate:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [(NSLock *)self->_storedPeriodsLock lock];
  id v7 = (void *)[(NSArray *)self->_storedPeriods copy];
  [(NSLock *)self->_storedPeriodsLock unlock];
  uint64_t v8 = REIndexOfDateInPeriodsOfDay(v6, v7);
  if ((unint64_t)(v8 - 0x7FFFFFFFFFFFFFFFLL) < 0x8000000000000002)
  {
LABEL_5:
    v11 = RELogForDomain(8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (a3 > 2) {
        v12 = 0;
      }
      else {
        v12 = off_2644BD6B8[a3];
      }
      int v20 = 138412546;
      __int16 v21 = v12;
      __int16 v22 = 2112;
      uint64_t v23 = v7;
      _os_log_impl(&dword_21E6E6000, v11, OS_LOG_TYPE_INFO, "Unable to find %@ in current data: %@\nfalling back to default data", (uint8_t *)&v20, 0x16u);
    }

    v14 = [MEMORY[0x263EFF910] date];
    v15 = [(REPeriodOfDayPredictor *)self _defaultDayPeriodsOfDayForDate:v14];

    uint64_t v16 = REIndexOfDateInPeriodsOfDay(v6, v15);
    if ((unint64_t)(v16 - 0x7FFFFFFFFFFFFFFFLL) < 0x8000000000000002)
    {
LABEL_15:
      v13 = 0;
    }
    else
    {
      uint64_t v17 = v16 + 1;
      while (1)
      {
        id v18 = [v15 objectAtIndexedSubscript:v17 - 2];
        if ([v18 periodOfDay] == a3) {
          break;
        }

        if ((unint64_t)--v17 < 2) {
          goto LABEL_15;
        }
      }
      v13 = [v18 interval];
    }
  }
  else
  {
    uint64_t v9 = v8 + 1;
    while (1)
    {
      uint64_t v10 = [v7 objectAtIndexedSubscript:v9 - 2];
      if ([v10 periodOfDay] == a3) {
        break;
      }

      if ((unint64_t)--v9 < 2) {
        goto LABEL_5;
      }
    }
    v13 = [v10 interval];
  }
  return v13;
}

- (void)update
{
}

void __32__REPeriodOfDayPredictor_update__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [MEMORY[0x263EFF980] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obunint64_t j = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v39;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v39 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v38 + 1) + 8 * v7);
        if ([v3 count])
        {
          uint64_t v9 = [v3 lastObject];
          uint64_t v10 = [MEMORY[0x263EFF8F0] currentCalendar];
          v11 = [v9 endDate];
          v12 = [v8 startDate];
          char v13 = [v10 isDate:v11 equalToDate:v12 toUnitGranularity:128];

          int v14 = [v9 intersectsDateInterval:v8];
          if ((v13 & 1) != 0 || v14)
          {
            if (v14)
            {
              v15 = RELogForDomain(8);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v43 = v9;
                __int16 v44 = 2112;
                v45 = v8;
                _os_log_debug_impl(&dword_21E6E6000, v15, OS_LOG_TYPE_DEBUG, "Found overlapping intervals %@ and %@", buf, 0x16u);
              }
            }
            [v3 removeLastObject];
            uint64_t v16 = REDateIntervalUnion(v9, v8);
            [v3 addObject:v16];
          }
          else
          {
            [v3 addObject:v8];
          }
        }
        else
        {
          [v3 addObject:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v5);
  }

  uint64_t v17 = [MEMORY[0x263EFF910] date];
  id v18 = RELogForDomain(8);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    __32__REPeriodOfDayPredictor_update__block_invoke_cold_2();
  }

  int v19 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_83];
  [v3 filterUsingPredicate:v19];

  int v20 = [*(id *)(a1 + 32) _periodsOfDayForSleepIntervals:v3];
  if (![v20 count])
  {
    uint64_t v21 = [*(id *)(a1 + 32) _defaultDayPeriodsOfDayForDate:v17];

    int v20 = (void *)v21;
  }
  __int16 v22 = RELogForDomain(8);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    __32__REPeriodOfDayPredictor_update__block_invoke_cold_1();
  }

  uint64_t v23 = [*(id *)(a1 + 32) currentPeriodOfDay];
  [*(id *)(*(void *)(a1 + 32) + 72) lock];
  char v24 = [*(id *)(*(void *)(a1 + 32) + 64) isEqualToArray:v20];
  uint64_t v25 = *(void *)(a1 + 32);
  v26 = *(void **)(v25 + 64);
  *(void *)(v25 + 64) = v20;
  id v27 = v20;

  [*(id *)(*(void *)(a1 + 32) + 72) unlock];
  uint64_t v28 = [*(id *)(a1 + 32) currentPeriodOfDay];
  BOOL v29 = v23 == v28;
  BOOL v30 = v23 != v28;
  v31 = *(void **)(a1 + 32);
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __32__REPeriodOfDayPredictor_update__block_invoke_84;
  v35[3] = &unk_2644BD5D0;
  if (v29) {
    char v32 = v24;
  }
  else {
    char v32 = 1;
  }
  v35[4] = v31;
  char v36 = v32;
  BOOL v37 = v30;
  [v31 onQueue:v35];
}

BOOL __32__REPeriodOfDayPredictor_update__block_invoke_80(uint64_t a1, void *a2)
{
  [a2 duration];
  return v2 >= 10000.0;
}

uint64_t __32__REPeriodOfDayPredictor_update__block_invoke_84(uint64_t a1)
{
  [*(id *)(a1 + 32) finishFetchingData];
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) updateObservers];
  }
  double v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__REPeriodOfDayPredictor_update__block_invoke_2;
  v6[3] = &unk_2644BD588;
  v6[4] = v2;
  [v2 enumerateObservers:v6];
  if (*(unsigned char *)(a1 + 41))
  {
    id v3 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __32__REPeriodOfDayPredictor_update__block_invoke_3;
    v5[3] = &unk_2644BD588;
    v5[4] = v3;
    [v3 enumerateObservers:v5];
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateNextDateUpdateTimer");
}

void __32__REPeriodOfDayPredictor_update__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 periodOfDayPredictorDidUpdatePredictedIntervals:*(void *)(a1 + 32)];
  }
}

void __32__REPeriodOfDayPredictor_update__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 periodOfDayPredictorDidUpdateCurrentPeriodOfDay:*(void *)(a1 + 32)];
  }
}

- (void)_getAllSleepIntervalsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __62__REPeriodOfDayPredictor__getAllSleepIntervalsWithCompletion___block_invoke;
    v6[3] = &unk_2644BD620;
    v6[4] = self;
    id v7 = v4;
    [(REPeriodOfDayPredictor *)self _getHistoricSleepIntervalsWithCompletion:v6];
  }
}

void __62__REPeriodOfDayPredictor__getAllSleepIntervalsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__REPeriodOfDayPredictor__getAllSleepIntervalsWithCompletion___block_invoke_2;
  v6[3] = &unk_2644BD620;
  id v7 = v3;
  id v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 _getPredictedSleepIntervalsWithCompletion:v6];
}

void __62__REPeriodOfDayPredictor__getAllSleepIntervalsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) arrayByAddingObjectsFromArray:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_periodsOfDayForSleepIntervals:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __57__REPeriodOfDayPredictor__periodsOfDayForSleepIntervals___block_invoke;
  v12 = &unk_2644BD648;
  id v13 = v4;
  id v14 = v3;
  id v5 = v3;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:&v9];
  id v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);

  return v7;
}

void __57__REPeriodOfDayPredictor__periodsOfDayForSleepIntervals___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = [[_REPeriodOfDay alloc] initWithInterval:v5 periodOfDay:2];
  [v6 addObject:v7];

  unint64_t v8 = a3 + 1;
  if (v8 < [*(id *)(a1 + 40) count])
  {
    uint64_t v9 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v8];
    uint64_t v10 = [v5 endDate];
    v11 = [v9 startDate];
    if ([v10 compare:v11] == -1)
    {
      id v13 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v10 endDate:v11];
      id v14 = REDateIntervalMidpoint(v13);

      v15 = [_REPeriodOfDay alloc];
      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v10 endDate:v14];
      uint64_t v17 = [(_REPeriodOfDay *)v15 initWithInterval:v16 periodOfDay:0];

      id v18 = [_REPeriodOfDay alloc];
      int v19 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v14 endDate:v11];
      int v20 = [(_REPeriodOfDay *)v18 initWithInterval:v19 periodOfDay:1];

      [*(id *)(a1 + 32) addObject:v17];
      [*(id *)(a1 + 32) addObject:v20];
    }
    else
    {
      v12 = RELogForDomain(8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __57__REPeriodOfDayPredictor__periodsOfDayForSleepIntervals___block_invoke_cold_1();
      }
    }
  }
}

- (void)_getPredictedSleepIntervalsWithCompletion:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    [(REPredictor *)self beginFetchingData];
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __68__REPeriodOfDayPredictor__getPredictedSleepIntervalsWithCompletion___block_invoke;
    v56[3] = &unk_2644BD620;
    v56[4] = self;
    id v5 = v4;
    id v57 = v5;
    id v6 = (void (**)(void, void))MEMORY[0x223C31700](v56);
    id v7 = [MEMORY[0x263EFF980] array];
    unint64_t v8 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v9 = [MEMORY[0x263EFF910] date];
    sleepStore = self->_sleepStore;
    id v55 = 0;
    v49 = [(HKSPSleepStore *)sleepStore currentSleepScheduleWithError:&v55];
    id v11 = v55;
    if (v11)
    {
      v12 = RELogForDomain(8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v59 = v11;
        _os_log_impl(&dword_21E6E6000, v12, OS_LOG_TYPE_DEFAULT, "Unable to get the current sleep schedule: %@", buf, 0xCu);
      }
    }
    v48 = v11;
    if (v49)
    {
      v43 = (void (**)(id, void *))v5;
      __int16 v44 = self;
      uint64_t v47 = v6;
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __68__REPeriodOfDayPredictor__getPredictedSleepIntervalsWithCompletion___block_invoke_89;
      v53[3] = &unk_2644BD560;
      v46 = v8;
      id v54 = v8;
      id v13 = (void (**)(void, void, void))MEMORY[0x223C31700](v53);
      v45 = v9;
      id v14 = v9;
      uint64_t v15 = 1;
      uint64_t v16 = v14;
      do
      {
        uint64_t v17 = v16;
        uint64_t v16 = ((void (**)(void, id, uint64_t))v13)[2](v13, v14, v15);
        id v18 = +[RESleepScheduleEntry sleepEntryForDatesWithCurrent:v17 next:v16 schedule:v49];
        int v19 = [v18 bedtime];
        int v20 = [v18 wakeupTime];

        if (v19) {
          BOOL v21 = v20 == 0;
        }
        else {
          BOOL v21 = 1;
        }
        if (!v21)
        {
          __int16 v22 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v19 endDate:v20];
          [v7 addObject:v22];
        }
        ++v15;
      }
      while (v15 != 4);
      if ([v7 count])
      {
        [(REPredictor *)v44 finishFetchingData];
        v43[2](v43, v7);

        id v23 = v54;
        id v6 = v47;
        uint64_t v9 = v45;
        unint64_t v8 = v46;
LABEL_27:

        goto LABEL_28;
      }

      id v6 = v47;
      uint64_t v9 = v45;
      unint64_t v8 = v46;
      self = v44;
    }
    id v23 = [(REDuetKnowledgeStore *)self->_knowledgeStore sleepInterval];
    char v24 = RELogForDomain(8);
    uint64_t v25 = v24;
    if (v23)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v59 = v23;
        _os_log_impl(&dword_21E6E6000, v25, OS_LOG_TYPE_DEFAULT, "Received expected in bed period: %@", buf, 0xCu);
      }

      v26 = [v23 startDate];
      id v27 = [v8 components:224 fromDate:v26];

      uint64_t v28 = [MEMORY[0x263EFF910] date];
      BOOL v29 = objc_msgSend(v8, "nextDateAfterDate:matchingHour:minute:second:options:", v28, objc_msgSend(v27, "hour"), objc_msgSend(v27, "minute"), objc_msgSend(v27, "second"), 1024);

      id v30 = objc_alloc(MEMORY[0x263F08798]);
      [v23 duration];
      if (v31 < 0.0) {
        double v31 = 0.0;
      }
      char v32 = (void *)[v30 initWithStartDate:v29 duration:v31];
      [v7 addObject:v32];
      v33 = (void *)[v7 copy];
      ((void (**)(void, void *))v6)[2](v6, v33);
    }
    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[REPeriodOfDayPredictor _getPredictedSleepIntervalsWithCompletion:](v25, v34, v35, v36, v37, v38, v39, v40);
      }

      id v27 = [(REDuetKnowledgeStore *)self->_knowledgeStore queryForPredictedChargingEventsWithMinimumDuration:60.0];
      knowledgeStore = self->_knowledgeStore;
      v42 = [(REPredictor *)self queue];
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __68__REPeriodOfDayPredictor__getPredictedSleepIntervalsWithCompletion___block_invoke_91;
      v50[3] = &unk_2644BD698;
      id v51 = v7;
      v52 = v6;
      [(REDuetKnowledgeStore *)knowledgeStore executeQuery:v27 responseQueue:v42 completion:v50];

      BOOL v29 = v51;
    }

    goto LABEL_27;
  }
LABEL_28:
}

void __68__REPeriodOfDayPredictor__getPredictedSleepIntervalsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = REUpNextDuplicateIntervalsByAddingUnit(a2, 16, 1uLL, 3);
  id v4 = RELogForDomain(8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_21E6E6000, v4, OS_LOG_TYPE_INFO, "Updated predicted sleep events: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) finishFetchingData];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __68__REPeriodOfDayPredictor__getPredictedSleepIntervalsWithCompletion___block_invoke_89(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [v3 dateByAddingUnit:16 value:a3 toDate:a2 options:0];
  int v5 = [v3 startOfDayForDate:v4];

  return v5;
}

void __68__REPeriodOfDayPredictor__getPredictedSleepIntervalsWithCompletion___block_invoke_91(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = RELogForDomain(8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __68__REPeriodOfDayPredictor__getPredictedSleepIntervalsWithCompletion___block_invoke_91_cold_1();
  }

  if (v3)
  {
    int v5 = [v3 transitionDates];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __68__REPeriodOfDayPredictor__getPredictedSleepIntervalsWithCompletion___block_invoke_92;
    v9[3] = &unk_2644BD670;
    id v10 = v5;
    id v11 = v3;
    id v12 = *(id *)(a1 + 32);
    id v6 = v5;
    [v6 enumerateObjectsUsingBlock:v9];
  }
  uint64_t v7 = *(void *)(a1 + 40);
  unint64_t v8 = (void *)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

void __68__REPeriodOfDayPredictor__getPredictedSleepIntervalsWithCompletion___block_invoke_92(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = a3 - 1;
    id v6 = a2;
    id v12 = [v4 objectAtIndex:v5];
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v12 endDate:v6];

    unint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = REDateIntervalMidpoint(v7);
    id v10 = [v8 valueForDate:v9];

    if (v10)
    {
      [v10 floatValue];
      if (v11 > 0.78) {
        [*(id *)(a1 + 48) addObject:v7];
      }
    }
  }
}

- (void)_getHistoricSleepIntervalsWithCompletion:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    id v6 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v47 = [MEMORY[0x263EFF910] date];
    sleepStore = self->_sleepStore;
    id v53 = 0;
    v46 = [(HKSPSleepStore *)sleepStore currentSleepScheduleWithError:&v53];
    id v8 = v53;
    if (v8)
    {
      uint64_t v9 = RELogForDomain(8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v56 = v8;
        _os_log_impl(&dword_21E6E6000, v9, OS_LOG_TYPE_DEFAULT, "Unable to get the current sleep schedule: %@", buf, 0xCu);
      }
    }
    if (v46)
    {
      __int16 v44 = self;
      v51[0] = MEMORY[0x263EF8330];
      v51[1] = 3221225472;
      v51[2] = __67__REPeriodOfDayPredictor__getHistoricSleepIntervalsWithCompletion___block_invoke;
      v51[3] = &unk_2644BD560;
      v45 = v6;
      id v52 = v6;
      id v10 = (void (**)(void, void, void))MEMORY[0x223C31700](v51);
      uint64_t v11 = -3;
      id v12 = ((void (**)(void, void *, uint64_t))v10)[2](v10, v47, -3);
      do
      {
        id v13 = v12;
        id v12 = ((void (**)(void, void *, uint64_t))v10)[2](v10, v47, ++v11);
        id v14 = +[RESleepScheduleEntry sleepEntryForDatesWithCurrent:v13 next:v12 schedule:v46];
        uint64_t v15 = [v14 bedtime];
        uint64_t v16 = [v14 wakeupTime];

        if (v15) {
          BOOL v17 = v16 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (!v17)
        {
          id v18 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v15 endDate:v16];
          [v5 addObject:v18];
        }
      }
      while (v11);
      if ([v5 count])
      {
        int v19 = (void *)[v5 copy];
        v4[2](v4, v19);

        id v20 = v52;
        id v6 = v45;
LABEL_31:

        goto LABEL_32;
      }

      id v6 = v45;
      self = v44;
    }
    id v20 = [(REDuetKnowledgeStore *)self->_knowledgeStore sleepInterval];
    BOOL v21 = RELogForDomain(8);
    __int16 v22 = v21;
    if (v20)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v56 = v20;
        _os_log_impl(&dword_21E6E6000, v22, OS_LOG_TYPE_DEFAULT, "Received expected in bed period (using for historic calculation): %@", buf, 0xCu);
      }

      char v23 = [v20 containsDate:v47];
      char v24 = [v20 startDate];
      if ((v23 & 1) == 0)
      {
        uint64_t v25 = [v6 components:224 fromDate:v24];

        v26 = [MEMORY[0x263EFF910] date];
        id v27 = [v6 dateByAddingUnit:16 value:-1 toDate:v26 options:0];

        char v24 = objc_msgSend(v6, "nextDateAfterDate:matchingHour:minute:second:options:", v27, objc_msgSend(v25, "hour"), objc_msgSend(v25, "minute"), objc_msgSend(v25, "second"), 1024);
      }
      id v28 = objc_alloc(MEMORY[0x263F08798]);
      [v20 duration];
      if (v29 < 0.0) {
        double v29 = 0.0;
      }
      id v30 = (void *)[v28 initWithStartDate:v24 duration:v29];
      id v54 = v30;
      double v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
      char v32 = REUpNextDuplicateIntervalsByAddingUnit(v31, 16, 0xFFFFFFFFFFFFFFFFLL, 3);
      [v5 addObjectsFromArray:v32];

      v33 = RELogForDomain(8);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        -[REPeriodOfDayPredictor _getHistoricSleepIntervalsWithCompletion:]();
      }

      uint64_t v34 = (void *)[v5 copy];
      v4[2](v4, v34);
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[REPeriodOfDayPredictor _getHistoricSleepIntervalsWithCompletion:](v22, v35, v36, v37, v38, v39, v40, v41);
      }

      char v24 = [(REDuetKnowledgeStore *)self->_knowledgeStore queryForHistoricChargingEventsWithMinimumDuration:3 inThePastDays:60.0];
      knowledgeStore = self->_knowledgeStore;
      v43 = [(REPredictor *)self queue];
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __67__REPeriodOfDayPredictor__getHistoricSleepIntervalsWithCompletion___block_invoke_96;
      v48[3] = &unk_2644BD698;
      id v49 = v5;
      v50 = v4;
      [(REDuetKnowledgeStore *)knowledgeStore executeQuery:v24 responseQueue:v43 completion:v48];

      id v30 = v49;
    }

    goto LABEL_31;
  }
LABEL_32:
}

id __67__REPeriodOfDayPredictor__getHistoricSleepIntervalsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [v3 dateByAddingUnit:16 value:a3 toDate:a2 options:0];
  uint64_t v5 = [v3 startOfDayForDate:v4];

  return v5;
}

void __67__REPeriodOfDayPredictor__getHistoricSleepIntervalsWithCompletion___block_invoke_96(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = RELogForDomain(8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __67__REPeriodOfDayPredictor__getHistoricSleepIntervalsWithCompletion___block_invoke_96_cold_1();
  }

  if (v3)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          objc_msgSend(v10, "confidence", (void)v16);
          if (v11 > 0.779999971)
          {
            id v12 = *(void **)(a1 + 32);
            id v13 = [v10 interval];
            [v12 addObject:v13];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
  }
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = objc_msgSend(*(id *)(a1 + 32), "copy", (void)v16);
  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
}

- (void)_queue_updateNextDateUpdateTimer
{
  periodOfDayUpdateTimer = self->_periodOfDayUpdateTimer;
  if (periodOfDayUpdateTimer) {
    [(REUpNextTimer *)periodOfDayUpdateTimer invalidate];
  }
  id v4 = [(REPeriodOfDayPredictor *)self _nextDayPeriodUpdateDate];
  objc_initWeak(&location, self);
  id v5 = [(REPredictor *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__REPeriodOfDayPredictor__queue_updateNextDateUpdateTimer__block_invoke;
  v8[3] = &unk_2644BC700;
  objc_copyWeak(&v9, &location);
  uint64_t v6 = +[REUpNextTimer timerWithFireDate:v4 queue:v5 block:v8];
  uint64_t v7 = self->_periodOfDayUpdateTimer;
  self->_periodOfDayUpdateTimer = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__REPeriodOfDayPredictor__queue_updateNextDateUpdateTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = WeakRetained;
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __58__REPeriodOfDayPredictor__queue_updateNextDateUpdateTimer__block_invoke_2;
    v4[3] = &unk_2644BD588;
    v4[4] = WeakRetained;
    [WeakRetained enumerateObservers:v4];
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __58__REPeriodOfDayPredictor__queue_updateNextDateUpdateTimer__block_invoke_3;
    v3[3] = &unk_2644BC660;
    v3[4] = v2;
    [v2 onQueue:v3];
  }
}

void __58__REPeriodOfDayPredictor__queue_updateNextDateUpdateTimer__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 periodOfDayPredictorDidUpdateCurrentPeriodOfDay:*(void *)(a1 + 32)];
  }
}

uint64_t __58__REPeriodOfDayPredictor__queue_updateNextDateUpdateTimer__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateNextDateUpdateTimer");
}

- (id)_nextDayPeriodUpdateDate
{
  double v2 = [(REPeriodOfDayPredictor *)self intervalForCurrentPeriodOfDay];
  id v3 = [v2 endDate];
  id v4 = [v3 dateByAddingTimeInterval:60.0];

  return v4;
}

- (NSArray)storedPeriods
{
  return self->_storedPeriods;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepStore, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_periodOfDayUpdateTimer, 0);
  objc_storeStrong((id *)&self->_storedPeriodsLock, 0);
  objc_storeStrong((id *)&self->_storedPeriods, 0);
}

- (void)currentPeriodOfDay
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_21E6E6000, v0, OS_LOG_TYPE_ERROR, "Unable to find now in current data: %@\nfalling back to default data", v1, 0xCu);
}

void __32__REPeriodOfDayPredictor_update__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_21E6E6000, v0, v1, "Determined periods of day: %@", v2, v3, v4, v5, v6);
}

void __32__REPeriodOfDayPredictor_update__block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_21E6E6000, v0, OS_LOG_TYPE_DEBUG, "Determined sleep intervals: %@\nFor date: %@", v1, 0x16u);
}

void __57__REPeriodOfDayPredictor__periodsOfDayForSleepIntervals___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_21E6E6000, v0, OS_LOG_TYPE_ERROR, "Trying to create invalid interval from %@ to %@", v1, 0x16u);
}

- (void)_getPredictedSleepIntervalsWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __68__REPeriodOfDayPredictor__getPredictedSleepIntervalsWithCompletion___block_invoke_91_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_21E6E6000, v0, v1, "Received predicted sleep events: %@", v2, v3, v4, v5, v6);
}

- (void)_getHistoricSleepIntervalsWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_getHistoricSleepIntervalsWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_21E6E6000, v0, v1, "Updated historic sleep events: %@", v2, v3, v4, v5, v6);
}

void __67__REPeriodOfDayPredictor__getHistoricSleepIntervalsWithCompletion___block_invoke_96_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_21E6E6000, v0, v1, "Received historic sleep events: %@", v2, v3, v4, v5, v6);
}

@end