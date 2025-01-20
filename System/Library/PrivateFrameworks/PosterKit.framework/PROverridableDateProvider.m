@interface PROverridableDateProvider
- (NSDate)date;
- (NSDate)overrideDate;
- (PROverridableDateProvider)init;
- (void)_minuteTimerFired;
- (void)_notifyObserversDidUpdateDate:(id)a3;
- (void)_scheduleNextMinuteTimer;
- (void)_updateMinuteTimer;
- (void)addMinuteUpdateObserver:(id)a3;
- (void)removeMinuteUpdateObserver:(id)a3;
- (void)setOverrideDate:(id)a3;
@end

@implementation PROverridableDateProvider

- (PROverridableDateProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)PROverridableDateProvider;
  v2 = [(PROverridableDateProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v3;
  }
  return v2;
}

- (void)setOverrideDate:(id)a3
{
  id v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSDate *)[v7 copy];
    overrideDate = self->_overrideDate;
    self->_overrideDate = v4;

    [(PROverridableDateProvider *)self _updateMinuteTimer];
    objc_super v6 = [(PROverridableDateProvider *)self date];
    [(PROverridableDateProvider *)self _notifyObserversDidUpdateDate:v6];
  }
}

- (NSDate)date
{
  v2 = self->_overrideDate;
  if (!v2)
  {
    v2 = [MEMORY[0x1E4F1C9C8] date];
  }
  return v2;
}

- (void)addMinuteUpdateObserver:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    minuteObservers = self->_minuteObservers;
    id v9 = v5;
    if (!minuteObservers)
    {
      id v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      v8 = self->_minuteObservers;
      self->_minuteObservers = v7;

      minuteObservers = self->_minuteObservers;
    }
    [(NSHashTable *)minuteObservers addObject:v9];
    id v4 = (id)[(PROverridableDateProvider *)self _updateMinuteTimer];
    id v5 = v9;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)removeMinuteUpdateObserver:(id)a3
{
  if (a3)
  {
    -[NSHashTable removeObject:](self->_minuteObservers, "removeObject:");
    [(PROverridableDateProvider *)self _updateMinuteTimer];
  }
}

- (void)_updateMinuteTimer
{
  if ([(NSHashTable *)self->_minuteObservers count])
  {
    minuteTimer = self->_minuteTimer;
    BOOL v4 = self->_overrideDate == 0;
    if (*(_OWORD *)&self->_minuteTimer == 0)
    {
      [(PROverridableDateProvider *)self _scheduleNextMinuteTimer];
      return;
    }
    p_minuteTimer = &self->_minuteTimer;
    if (!minuteTimer) {
      return;
    }
  }
  else
  {
    BOOL v4 = 0;
    objc_super v6 = self->_minuteTimer;
    p_minuteTimer = &self->_minuteTimer;
    minuteTimer = v6;
    if (!v6) {
      return;
    }
  }
  if (!v4)
  {
    [(NSTimer *)minuteTimer invalidate];
    id v7 = *p_minuteTimer;
    *p_minuteTimer = 0;
  }
}

- (void)_scheduleNextMinuteTimer
{
  uint64_t v3 = [(PROverridableDateProvider *)self date];
  uint64_t v18 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v15 = 0;
  [(NSCalendar *)self->_calendar getHour:&v18 minute:&v17 second:&v16 nanosecond:&v15 fromDate:v3];
  double v4 = 60.0 - ((double)v15 / 1000000000.0 + (double)v16);
  [(NSTimer *)self->_minuteTimer invalidate];
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4F1CB00];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __53__PROverridableDateProvider__scheduleNextMinuteTimer__block_invoke;
  v12 = &unk_1E54DB788;
  objc_copyWeak(&v13, &location);
  objc_super v6 = [v5 timerWithTimeInterval:0 repeats:&v9 block:v4];
  minuteTimer = self->_minuteTimer;
  self->_minuteTimer = v6;

  v8 = objc_msgSend(MEMORY[0x1E4F1CAC0], "currentRunLoop", v9, v10, v11, v12);
  [v8 addTimer:self->_minuteTimer forMode:*MEMORY[0x1E4F1C4B0]];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __53__PROverridableDateProvider__scheduleNextMinuteTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _minuteTimerFired];
    id WeakRetained = v2;
  }
}

- (void)_minuteTimerFired
{
  uint64_t v3 = [(PROverridableDateProvider *)self date];
  [v3 timeIntervalSince1970];
  id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:ceil(v4)];

  [(PROverridableDateProvider *)self _notifyObserversDidUpdateDate:v6];
  [(NSTimer *)self->_minuteTimer invalidate];
  minuteTimer = self->_minuteTimer;
  self->_minuteTimer = 0;

  [(PROverridableDateProvider *)self _updateMinuteTimer];
}

- (void)_notifyObserversDidUpdateDate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(NSHashTable *)self->_minuteObservers allObjects];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) dateProvider:self didUpdateDate:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_minuteTimer, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_minuteObservers, 0);
}

@end