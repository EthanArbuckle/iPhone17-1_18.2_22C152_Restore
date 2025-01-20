@interface SBFDefaultDateProvider
- (SBFDefaultDateProvider)init;
- (id)date;
- (id)observeMinuteUpdatesWithHandler:(id)a3;
- (void)_minuteTimerFired;
- (void)_scheduleNextMinuteTimer;
- (void)_updateMinuteTimer;
- (void)removeMinuteUpdateHandler:(id)a3;
@end

@implementation SBFDefaultDateProvider

- (SBFDefaultDateProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBFDefaultDateProvider;
  v2 = [(SBFDefaultDateProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v3;
  }
  return v2;
}

- (id)date
{
  return (id)[MEMORY[0x1E4F1C9C8] date];
}

- (id)observeMinuteUpdatesWithHandler:(id)a3
{
  id v4 = a3;
  if (!self->_minuteHandlers)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    minuteHandlers = self->_minuteHandlers;
    self->_minuteHandlers = v5;
  }
  v7 = NSNumber;
  ++self->_nextToken;
  v8 = objc_msgSend(v7, "numberWithUnsignedInteger:");
  v9 = (void *)[v4 copy];
  v10 = (void *)MEMORY[0x18C133210]();
  [(NSMutableDictionary *)self->_minuteHandlers setObject:v10 forKeyedSubscript:v8];

  [(SBFDefaultDateProvider *)self _updateMinuteTimer];
  return v8;
}

- (void)removeMinuteUpdateHandler:(id)a3
{
  [(NSMutableDictionary *)self->_minuteHandlers removeObjectForKey:a3];
  [(SBFDefaultDateProvider *)self _updateMinuteTimer];
}

- (void)_updateMinuteTimer
{
  uint64_t v3 = [(NSMutableDictionary *)self->_minuteHandlers count];
  minuteTimer = self->_minuteTimer;
  if (v3)
  {
    if (!minuteTimer)
    {
      [(SBFDefaultDateProvider *)self _scheduleNextMinuteTimer];
      return;
    }
  }
  else if (!minuteTimer)
  {
    return;
  }
  if (![(NSMutableDictionary *)self->_minuteHandlers count])
  {
    [(NSTimer *)self->_minuteTimer invalidate];
    v5 = self->_minuteTimer;
    self->_minuteTimer = 0;
  }
}

- (void)_scheduleNextMinuteTimer
{
  uint64_t v3 = [(SBFDefaultDateProvider *)self date];
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  [(NSCalendar *)self->_calendar getHour:&v10 minute:&v9 second:&v8 nanosecond:&v7 fromDate:v3];
  double v4 = 60.0 - ((double)v7 / 1000000000.0 + (double)v8);
  [(NSTimer *)self->_minuteTimer invalidate];
  v5 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__minuteTimerFired selector:0 userInfo:0 repeats:v4];
  minuteTimer = self->_minuteTimer;
  self->_minuteTimer = v5;
}

- (void)_minuteTimerFired
{
  uint64_t v3 = [(SBFDefaultDateProvider *)self date];
  minuteHandlers = self->_minuteHandlers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__SBFDefaultDateProvider__minuteTimerFired__block_invoke;
  v6[3] = &unk_1E548CF40;
  id v7 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)minuteHandlers enumerateKeysAndObjectsUsingBlock:v6];
  [(SBFDefaultDateProvider *)self _scheduleNextMinuteTimer];
}

uint64_t __43__SBFDefaultDateProvider__minuteTimerFired__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, void))(a3 + 16))(a3, *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_minuteTimer, 0);
  objc_storeStrong((id *)&self->_minuteHandlers, 0);
}

@end