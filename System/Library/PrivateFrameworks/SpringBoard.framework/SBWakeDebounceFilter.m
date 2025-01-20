@interface SBWakeDebounceFilter
- (BOOL)wakeEventOccurred;
- (NSNumber)_overrideTime;
- (double)_currentTime;
- (double)filterInterval;
- (unint64_t)intervalActivationLimit;
- (void)_reconfigureFilter;
- (void)_setOverrideTime:(id)a3;
- (void)setFilterInterval:(double)a3;
- (void)setIntervalActivationLimit:(unint64_t)a3;
@end

@implementation SBWakeDebounceFilter

- (void)setIntervalActivationLimit:(unint64_t)a3
{
  if (self->_intervalActivationLimit != a3)
  {
    self->_intervalActivationLimit = a3;
    -[SBWakeDebounceFilter _reconfigureFilter]((uint64_t)self);
  }
}

- (void)_reconfigureFilter
{
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 8) count];
    uint64_t v3 = *(void *)(a1 + 24);
    if (v3 != v2)
    {
      uint64_t v4 = v2;
      v5 = (void *)MEMORY[0x1D948C4D0]();
      v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v3];
      if (v4 >= 1)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          v8 = [*(id *)(a1 + 8) objectAtIndexedSubscript:(i + *(void *)(a1 + 16)) % v4];
          [v6 addObject:v8];
        }
      }
      uint64_t v9 = v3 - v4;
      if (v3 > v4)
      {
        v10 = [NSNumber numberWithDouble:0.0];
        do
        {
          [v6 addObject:v10];
          --v9;
        }
        while (v9);
      }
      [*(id *)(a1 + 8) removeAllObjects];
      v11 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v6;

      *(void *)(a1 + 16) = v4;
    }
  }
}

- (BOOL)wakeEventOccurred
{
  if (!self->_intervalActivationLimit) {
    return 1;
  }
  uint64_t v3 = [(NSMutableArray *)self->_wakeEvents count];
  overrideTime = self->_overrideTime;
  if (overrideTime) {
    [(NSNumber *)overrideTime doubleValue];
  }
  else {
    BSContinuousMachTimeNow();
  }
  double v7 = v5;
  v8 = [(NSMutableArray *)self->_wakeEvents objectAtIndexedSubscript:self->_oldestWakeEventIndex % v3];
  [v8 doubleValue];

  uint64_t v9 = [NSNumber numberWithDouble:v7];
  wakeEvents = self->_wakeEvents;
  int64_t oldestWakeEventIndex = self->_oldestWakeEventIndex;
  self->_int64_t oldestWakeEventIndex = oldestWakeEventIndex + 1;
  [(NSMutableArray *)wakeEvents setObject:v9 atIndexedSubscript:oldestWakeEventIndex % v3];

  return BSFloatGreaterThanFloat();
}

- (double)_currentTime
{
  if (!a1) {
    return 0.0;
  }
  v1 = *(void **)(a1 + 32);
  if (v1) {
    [v1 doubleValue];
  }
  else {
    BSContinuousMachTimeNow();
  }
  return result;
}

- (unint64_t)intervalActivationLimit
{
  return self->_intervalActivationLimit;
}

- (NSNumber)_overrideTime
{
  return self->_overrideTime;
}

- (void)_setOverrideTime:(id)a3
{
}

- (double)filterInterval
{
  return self->_filterInterval;
}

- (void)setFilterInterval:(double)a3
{
  self->_filterInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideTime, 0);
  objc_storeStrong((id *)&self->_wakeEvents, 0);
}

@end