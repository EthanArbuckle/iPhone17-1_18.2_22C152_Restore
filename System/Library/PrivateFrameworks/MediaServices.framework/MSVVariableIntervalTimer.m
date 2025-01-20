@interface MSVVariableIntervalTimer
- (BOOL)isValid;
- (MSVVariableIntervalTimer)initWithIntervals:(id)a3 name:(id)a4 queue:(id)a5 block:(id)a6;
- (NSArray)remainingIntervals;
- (double)currentInterval;
- (double)timeUntilNextInterval;
- (void)_processTimerEventWithQueue:(id)a3 block:(id)a4;
@end

@implementation MSVVariableIntervalTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentIntervalStartDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_intervals, 0);
}

- (BOOL)isValid
{
  v2 = [(MSVVariableIntervalTimer *)self remainingIntervals];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (double)timeUntilNextInterval
{
  v2 = self;
  objc_sync_enter(v2);
  [(MSVVariableIntervalTimer *)v2 currentInterval];
  double v4 = v3;
  [(NSDate *)v2->_currentIntervalStartDate timeIntervalSinceNow];
  double v6 = v4 + v5;
  objc_sync_exit(v2);

  return v6;
}

- (double)currentInterval
{
  v2 = [(MSVVariableIntervalTimer *)self remainingIntervals];
  double v3 = [v2 firstObject];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (NSArray)remainingIntervals
{
  v2 = self;
  objc_sync_enter(v2);
  double v3 = (void *)[(NSMutableArray *)v2->_intervals copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)_processTimerEventWithQueue:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(MSVTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;

  if ([(NSMutableArray *)self->_intervals count])
  {
    v9 = [MEMORY[0x1E4F1C9C8] now];
    currentIntervalStartDate = self->_currentIntervalStartDate;
    self->_currentIntervalStartDate = v9;

    objc_initWeak(&location, self);
    v11 = [MSVTimer alloc];
    v12 = [(NSMutableArray *)self->_intervals firstObject];
    [v12 doubleValue];
    double v14 = v13;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__MSVVariableIntervalTimer__processTimerEventWithQueue_block___block_invoke;
    v17[3] = &unk_1E5AD9950;
    objc_copyWeak(&v20, &location);
    id v19 = v7;
    id v18 = v6;
    v15 = [(MSVTimer *)v11 initWithInterval:0 repeats:v18 queue:v17 block:v14];
    v16 = self->_timer;
    self->_timer = v15;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __62__MSVVariableIntervalTimer__processTimerEventWithQueue_block___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    double v3 = (id *)WeakRetained;
    objc_sync_enter(v3);
    if ([v3[1] count] == 1)
    {
      id v4 = v3[3];
      v3[3] = 0;
    }
    objc_sync_exit(v3);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    double v5 = v3;
    objc_sync_enter(v5);
    [v3[1] removeObjectAtIndex:0];
    [v5 _processTimerEventWithQueue:*(void *)(a1 + 32) block:*(void *)(a1 + 40)];
    objc_sync_exit(v5);

    id WeakRetained = v6;
  }
}

- (MSVVariableIntervalTimer)initWithIntervals:(id)a3 name:(id)a4 queue:(id)a5 block:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (![v10 count])
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"MSVTimer.m", 191, @"Invalid parameter not satisfying: %@", @"intervals.count > 0" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)MSVVariableIntervalTimer;
  double v13 = [(MSVVariableIntervalTimer *)&v18 init];
  if (v13)
  {
    uint64_t v14 = [v10 mutableCopy];
    intervals = v13->_intervals;
    v13->_intervals = (NSMutableArray *)v14;

    [(MSVVariableIntervalTimer *)v13 _processTimerEventWithQueue:v11 block:v12];
  }

  return v13;
}

@end