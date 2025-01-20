@interface REDailyRoutinePredictor
- (NSDateInterval)currentRoutineInterval;
- (id)_eveningRoutineIntervalForEvening:(id)a3;
- (id)_init;
- (id)_morningRoutineIntervalForMorning:(id)a3;
- (id)routineIntervalForNextRoutine:(unint64_t)a3;
- (id)routineIntervalForPreviousRoutine:(unint64_t)a3;
- (unint64_t)currentRoutineType;
- (void)_queue_didBeginEveningRoutine;
- (void)_queue_didBeginMorningRoutine;
- (void)_queue_didEndEveningRoutine;
- (void)_queue_didEndMorningRoutine;
- (void)_queue_setupEveningBeginTimerIfNeeded;
- (void)_queue_setupMorningBeginTimerIfNeeded;
- (void)_setOverrideRoutineType:(unint64_t)a3;
- (void)_updateCurrentRoutine;
- (void)dealloc;
- (void)periodOfDayPredictorDidUpdatePredictedIntervals:(id)a3;
@end

@implementation REDailyRoutinePredictor

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)REDailyRoutinePredictor;
  id v2 = [(REObservableSingleton *)&v11 _init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.RelevanceEngine.REDailyRoutinePredictor", v3);
    v5 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v4;

    uint64_t v6 = +[RESingleton sharedInstance];
    v7 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v6;

    [*((id *)v2 + 2) addObserver:v2];
    uint64_t v8 = objc_opt_new();
    v9 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v8;
  }
  return v2;
}

- (void)dealloc
{
  [(REObservableSingleton *)self->_periodOfDayPredictor removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)REDailyRoutinePredictor;
  [(REDailyRoutinePredictor *)&v3 dealloc];
}

- (unint64_t)currentRoutineType
{
  [(NSLock *)self->_routineLock lock];
  overrideRoutineType = self->_overrideRoutineType;
  if (overrideRoutineType) {
    uint64_t currentRoutine = [(NSNumber *)overrideRoutineType unsignedIntegerValue];
  }
  else {
    uint64_t currentRoutine = self->_currentRoutine;
  }
  [(NSLock *)self->_routineLock unlock];
  return currentRoutine;
}

- (NSDateInterval)currentRoutineInterval
{
  [(NSLock *)self->_routineLock lock];
  objc_super v3 = (void *)[(NSDateInterval *)self->_currentRoutineInterval copy];
  [(NSLock *)self->_routineLock unlock];
  return (NSDateInterval *)v3;
}

- (id)routineIntervalForNextRoutine:(unint64_t)a3
{
  if (a3) {
    uint64_t v5 = a3 == 2;
  }
  else {
    uint64_t v5 = 2;
  }
  unint64_t v6 = [(REPeriodOfDayPredictor *)self->_periodOfDayPredictor currentPeriodOfDay];
  periodOfDayPredictor = self->_periodOfDayPredictor;
  if (v6 == v5) {
    [(REPeriodOfDayPredictor *)periodOfDayPredictor intervalForCurrentPeriodOfDay];
  }
  else {
  uint64_t v8 = [(REPeriodOfDayPredictor *)periodOfDayPredictor dateIntervalForNextPeriodOfDay:v5];
  }
  if (!v8) {
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    uint64_t v9 = [(REDailyRoutinePredictor *)self _morningRoutineIntervalForMorning:v8];
    goto LABEL_13;
  }
  if (a3 != 2)
  {
LABEL_11:
    v10 = 0;
    goto LABEL_14;
  }
  uint64_t v9 = [(REDailyRoutinePredictor *)self _eveningRoutineIntervalForEvening:v8];
LABEL_13:
  v10 = (void *)v9;
LABEL_14:

  return v10;
}

- (id)routineIntervalForPreviousRoutine:(unint64_t)a3
{
  if (a3) {
    uint64_t v5 = a3 == 2;
  }
  else {
    uint64_t v5 = 2;
  }
  unint64_t v6 = [(REPeriodOfDayPredictor *)self->_periodOfDayPredictor currentPeriodOfDay];
  periodOfDayPredictor = self->_periodOfDayPredictor;
  if (v6 == v5) {
    [(REPeriodOfDayPredictor *)periodOfDayPredictor intervalForCurrentPeriodOfDay];
  }
  else {
  uint64_t v8 = [(REPeriodOfDayPredictor *)periodOfDayPredictor dateIntervalForPreviousPeriodOfDay:v5];
  }
  if (!v8) {
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    uint64_t v9 = [(REDailyRoutinePredictor *)self _morningRoutineIntervalForMorning:v8];
    goto LABEL_13;
  }
  if (a3 != 2)
  {
LABEL_11:
    v10 = 0;
    goto LABEL_14;
  }
  uint64_t v9 = [(REDailyRoutinePredictor *)self _eveningRoutineIntervalForEvening:v8];
LABEL_13:
  v10 = (void *)v9;
LABEL_14:

  return v10;
}

- (id)_morningRoutineIntervalForMorning:(id)a3
{
  periodOfDayPredictor = self->_periodOfDayPredictor;
  id v4 = a3;
  uint64_t v5 = [v4 endDate];
  unint64_t v6 = [(REPeriodOfDayPredictor *)periodOfDayPredictor dateIntervalForPreviousPeriodOfDay:2 beforeDate:v5];

  [v6 duration];
  double v8 = v7;
  double v9 = v7 * 0.400000006;
  v10 = [v4 startDate];
  objc_super v11 = [v10 dateByAddingTimeInterval:-(v8 * 0.400000006)];

  [v4 duration];
  double v13 = v12;

  double v14 = 4320.0;
  if (v13 <= 4320.0) {
    double v14 = v13;
  }
  v15 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v11 duration:v9 + v14];

  return v15;
}

- (id)_eveningRoutineIntervalForEvening:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  periodOfDayPredictor = self->_periodOfDayPredictor;
  id v4 = a3;
  uint64_t v5 = [v4 startDate];
  unint64_t v6 = [(REPeriodOfDayPredictor *)periodOfDayPredictor dateIntervalForNextPeriodOfDay:2 afterDate:v5];

  [v6 duration];
  double v8 = v7;
  [v4 duration];
  double v10 = fmin(v9, 3600.0);
  objc_super v11 = [v4 endDate];

  double v12 = [v11 dateByAddingTimeInterval:-v10];

  double v13 = RELogForDomain(8);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    v17 = v12;
    _os_log_impl(&dword_21E6E6000, v13, OS_LOG_TYPE_DEFAULT, "eveningStart is: %@", (uint8_t *)&v16, 0xCu);
  }

  double v14 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v12 duration:v8 * 0.400000006 + v10];
  return v14;
}

- (void)periodOfDayPredictorDidUpdatePredictedIntervals:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__REDailyRoutinePredictor_periodOfDayPredictorDidUpdatePredictedIntervals___block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  id v5 = a3;
  dispatch_async(queue, block);
  [(REDailyRoutinePredictor *)self periodOfDayPredictorDidUpdateCurrentPeriodOfDay:v5];

  unint64_t v6 = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__REDailyRoutinePredictor_periodOfDayPredictorDidUpdatePredictedIntervals___block_invoke_3;
  v7[3] = &unk_2644BC660;
  v7[4] = self;
  dispatch_async(v6, v7);
}

uint64_t __75__REDailyRoutinePredictor_periodOfDayPredictorDidUpdatePredictedIntervals___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __75__REDailyRoutinePredictor_periodOfDayPredictorDidUpdatePredictedIntervals___block_invoke_2;
  v3[3] = &unk_2644BDE48;
  v3[4] = v1;
  return [v1 enumerateObservers:v3];
}

void __75__REDailyRoutinePredictor_periodOfDayPredictorDidUpdatePredictedIntervals___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dailyRoutinePredictorDidUpdatedPredictedRoutines:*(void *)(a1 + 32)];
  }
}

uint64_t __75__REDailyRoutinePredictor_periodOfDayPredictorDidUpdatePredictedIntervals___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_setupMorningBeginTimerIfNeeded");
  id v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "_queue_setupEveningBeginTimerIfNeeded");
}

- (void)_updateCurrentRoutine
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF910] date];
  unint64_t v4 = [(REPeriodOfDayPredictor *)self->_periodOfDayPredictor currentPeriodOfDay];
  v27 = [(REPeriodOfDayPredictor *)self->_periodOfDayPredictor intervalForCurrentPeriodOfDay];
  [(NSLock *)self->_routineLock lock];
  unint64_t currentRoutine = self->_currentRoutine;
  unint64_t v6 = RELogForDomain(8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v23 = self->_currentRoutine;
    if (v23 > 2) {
      v26 = 0;
    }
    else {
      v26 = off_2644BDE90[v23];
    }
    currentRoutineInterval = self->_currentRoutineInterval;
    REStringForPeriodOfDay(v4);
    *(_DWORD *)buf = 138412802;
    v30 = v26;
    __int16 v31 = 2112;
    v32 = currentRoutineInterval;
    v34 = __int16 v33 = 2112;
    v25 = (void *)v34;
    _os_log_debug_impl(&dword_21E6E6000, v6, OS_LOG_TYPE_DEBUG, "Current routine (%@, %@) updating based on period of day: %@", buf, 0x20u);
  }
  self->_unint64_t currentRoutine = 0;
  p_currentRoutineInterval = &self->_currentRoutineInterval;
  double v8 = self->_currentRoutineInterval;
  self->_currentRoutineInterval = 0;

  if (v4)
  {
    if (v4 != 1)
    {
      if (v4 != 2) {
        goto LABEL_16;
      }
      unint64_t v9 = 1;
      double v10 = [(REPeriodOfDayPredictor *)self->_periodOfDayPredictor dateIntervalForPreviousPeriodOfDay:1];
      objc_super v11 = [(REDailyRoutinePredictor *)self _eveningRoutineIntervalForEvening:v10];

      double v12 = [(REPeriodOfDayPredictor *)self->_periodOfDayPredictor dateIntervalForNextPeriodOfDay:0];
      double v13 = [(REDailyRoutinePredictor *)self _morningRoutineIntervalForMorning:v12];

      BOOL v14 = [(NSDateInterval *)v13 containsDate:v3];
      v15 = v13;
      if (!v14)
      {
        if (![(NSDateInterval *)v11 containsDate:v3])
        {
LABEL_14:

          goto LABEL_15;
        }
        unint64_t v9 = 2;
        v15 = v11;
      }
      self->_unint64_t currentRoutine = v9;
      objc_storeStrong((id *)p_currentRoutineInterval, v15);
      goto LABEL_14;
    }
    objc_super v11 = [(REDailyRoutinePredictor *)self _eveningRoutineIntervalForEvening:v27];
    if ([(NSDateInterval *)v11 containsDate:v3])
    {
      unint64_t v16 = 2;
      goto LABEL_13;
    }
  }
  else
  {
    objc_super v11 = [(REDailyRoutinePredictor *)self _morningRoutineIntervalForMorning:v27];
    if ([(NSDateInterval *)v11 containsDate:v3])
    {
      unint64_t v16 = 1;
LABEL_13:
      self->_unint64_t currentRoutine = v16;
      objc_super v11 = v11;
      double v13 = *p_currentRoutineInterval;
      *p_currentRoutineInterval = v11;
      goto LABEL_14;
    }
  }
LABEL_15:

LABEL_16:
  v17 = RELogForDomain(8);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    unint64_t v18 = self->_currentRoutine;
    if (v18 > 2) {
      v19 = 0;
    }
    else {
      v19 = off_2644BDE90[v18];
    }
    v20 = *p_currentRoutineInterval;
    *(_DWORD *)buf = 138412546;
    v30 = v19;
    __int16 v31 = 2112;
    v32 = v20;
    _os_log_impl(&dword_21E6E6000, v17, OS_LOG_TYPE_INFO, "Updated routine to %@, %@", buf, 0x16u);
  }

  unint64_t v21 = self->_currentRoutine;
  [(NSLock *)self->_routineLock unlock];
  if (currentRoutine != v21)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__REDailyRoutinePredictor__updateCurrentRoutine__block_invoke;
    block[3] = &unk_2644BDE70;
    block[4] = self;
    void block[5] = currentRoutine;
    block[6] = v21;
    dispatch_async(queue, block);
  }
}

uint64_t __48__REDailyRoutinePredictor__updateCurrentRoutine__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_didEndEveningRoutine");
  }
  else if (v2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_didEndMorningRoutine");
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_setupMorningBeginTimerIfNeeded");
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_setupEveningBeginTimerIfNeeded");
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4 == 2)
  {
    unint64_t v6 = *(void **)(a1 + 32);
    return objc_msgSend(v6, "_queue_didBeginEveningRoutine");
  }
  else if (v4 == 1)
  {
    id v5 = *(void **)(a1 + 32);
    return objc_msgSend(v5, "_queue_didBeginMorningRoutine");
  }
  return result;
}

- (void)_queue_didBeginMorningRoutine
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_21E6E6000, v0, v1, "Began morning routine", v2, v3, v4, v5, v6);
}

void __56__REDailyRoutinePredictor__queue_didBeginMorningRoutine__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dailyRoutinePredictorDidBeginMorningRoutine:*(void *)(a1 + 32)];
  }
}

void __56__REDailyRoutinePredictor__queue_didBeginMorningRoutine__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateCurrentRoutine];
    objc_msgSend(v2, "_queue_didEndMorningRoutine");
    id WeakRetained = v2;
  }
}

- (void)_queue_didEndMorningRoutine
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_21E6E6000, v0, v1, "Finished morning routine", v2, v3, v4, v5, v6);
}

void __54__REDailyRoutinePredictor__queue_didEndMorningRoutine__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dailyRoutinePredictorDidEndMorningRoutine:*(void *)(a1 + 32)];
  }
}

- (void)_queue_didBeginEveningRoutine
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_21E6E6000, v0, v1, "Began evening routine", v2, v3, v4, v5, v6);
}

void __56__REDailyRoutinePredictor__queue_didBeginEveningRoutine__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dailyRoutinePredictorDidBeginEveningRoutine:*(void *)(a1 + 32)];
  }
}

void __56__REDailyRoutinePredictor__queue_didBeginEveningRoutine__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateCurrentRoutine];
    objc_msgSend(v2, "_queue_didEndEveningRoutine");
    id WeakRetained = v2;
  }
}

- (void)_queue_didEndEveningRoutine
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_0(&dword_21E6E6000, v0, v1, "Finished evening routine", v2, v3, v4, v5, v6);
}

void __54__REDailyRoutinePredictor__queue_didEndEveningRoutine__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 dailyRoutinePredictorDidEndEveningRoutine:*(void *)(a1 + 32)];
  }
}

- (void)_queue_setupMorningBeginTimerIfNeeded
{
  [(REUpNextTimer *)self->_endMorningRoutineTimer invalidate];
  endMorningRoutineTimer = self->_endMorningRoutineTimer;
  self->_endMorningRoutineTimer = 0;

  if ([(REPeriodOfDayPredictor *)self->_periodOfDayPredictor currentPeriodOfDay] == 2
    && ![(REDailyRoutinePredictor *)self currentRoutineType])
  {
    uint64_t v4 = [(REPeriodOfDayPredictor *)self->_periodOfDayPredictor intervalForCurrentPeriodOfDay];
    uint64_t v5 = [(REDailyRoutinePredictor *)self _morningRoutineIntervalForMorning:v4];
    objc_initWeak(&location, self);
    uint8_t v6 = [v5 startDate];
    double v7 = [v6 dateByAddingTimeInterval:2.0];
    queue = self->_queue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __64__REDailyRoutinePredictor__queue_setupMorningBeginTimerIfNeeded__block_invoke;
    v11[3] = &unk_2644BC700;
    objc_copyWeak(&v12, &location);
    unint64_t v9 = +[REUpNextTimer timerWithFireDate:v7 queue:queue block:v11];
    beginEveningRoutineTimer = self->_beginEveningRoutineTimer;
    self->_beginEveningRoutineTimer = v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __64__REDailyRoutinePredictor__queue_setupMorningBeginTimerIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateCurrentRoutine];
    objc_msgSend(v2, "_queue_didBeginMorningRoutine");
    id WeakRetained = v2;
  }
}

- (void)_queue_setupEveningBeginTimerIfNeeded
{
  [(REUpNextTimer *)self->_beginEveningRoutineTimer invalidate];
  beginEveningRoutineTimer = self->_beginEveningRoutineTimer;
  self->_beginEveningRoutineTimer = 0;

  [(REUpNextTimer *)self->_endEveningRoutineTimer invalidate];
  endEveningRoutineTimer = self->_endEveningRoutineTimer;
  self->_endEveningRoutineTimer = 0;

  if ([(REPeriodOfDayPredictor *)self->_periodOfDayPredictor currentPeriodOfDay] == 1
    && ![(REDailyRoutinePredictor *)self currentRoutineType])
  {
    uint64_t v5 = [(REPeriodOfDayPredictor *)self->_periodOfDayPredictor intervalForCurrentPeriodOfDay];
    uint8_t v6 = [(REDailyRoutinePredictor *)self _eveningRoutineIntervalForEvening:v5];
    objc_initWeak(&location, self);
    double v7 = [v6 startDate];
    double v8 = [v7 dateByAddingTimeInterval:2.0];
    queue = self->_queue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __64__REDailyRoutinePredictor__queue_setupEveningBeginTimerIfNeeded__block_invoke;
    v12[3] = &unk_2644BC700;
    objc_copyWeak(&v13, &location);
    double v10 = +[REUpNextTimer timerWithFireDate:v8 queue:queue block:v12];
    objc_super v11 = self->_beginEveningRoutineTimer;
    self->_beginEveningRoutineTimer = v10;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __64__REDailyRoutinePredictor__queue_setupEveningBeginTimerIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateCurrentRoutine];
    objc_msgSend(v2, "_queue_didBeginEveningRoutine");
    id WeakRetained = v2;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideRoutineType, 0);
  objc_storeStrong((id *)&self->_routineLock, 0);
  objc_storeStrong((id *)&self->_currentRoutineInterval, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_endEveningRoutineTimer, 0);
  objc_storeStrong((id *)&self->_beginEveningRoutineTimer, 0);
  objc_storeStrong((id *)&self->_endMorningRoutineTimer, 0);
  objc_storeStrong((id *)&self->_periodOfDayPredictor, 0);
}

- (void)_setOverrideRoutineType:(unint64_t)a3
{
  if (a3)
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    uint64_t v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = 0;
  }
  [(NSLock *)self->_routineLock lock];
  overrideRoutineType = self->_overrideRoutineType;
  self->_overrideRoutineType = v4;
  uint8_t v6 = v4;

  [(NSLock *)self->_routineLock unlock];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__REDailyRoutinePredictor_RETrainingSimulation___setOverrideRoutineType___block_invoke;
  v7[3] = &unk_2644BDE48;
  v7[4] = self;
  [(REObservableSingleton *)self enumerateObservers:v7];
}

uint64_t __73__REDailyRoutinePredictor_RETrainingSimulation___setOverrideRoutineType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 dailyRoutinePredictorDidUpdatedPredictedRoutines:*(void *)(a1 + 32)];
}

@end