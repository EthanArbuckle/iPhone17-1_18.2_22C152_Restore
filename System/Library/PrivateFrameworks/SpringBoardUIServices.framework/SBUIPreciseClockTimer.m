@interface SBUIPreciseClockTimer
+ (id)now;
+ (id)sharedInstance;
- (SBUIPreciseClockTimer)init;
- (id)date;
- (id)startMinuteUpdatesWithHandler:(id)a3;
- (void)_handleTimePassed;
- (void)_updateDisplayLink;
- (void)_updateDisplayLinkFrameIntervalForSecondsPastMinute:(double)a3;
- (void)dealloc;
- (void)stopMinuteUpdatesForToken:(id)a3;
@end

@implementation SBUIPreciseClockTimer

- (void)_handleTimePassed
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = +[SBUIPreciseClockTimer now];
  long long v16 = 0uLL;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  [(NSCalendar *)self->_calendar getHour:(char *)&v16 + 8 minute:&v16 second:&v15 nanosecond:&v14 fromDate:v3];
  if (v16 != __PAIR128__(self->_lastHour, self->_lastMinute))
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v4 = [(NSMutableDictionary *)self->_minuteUpdateHandlers allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v17 count:16];
      }
      while (v6);
    }

    int64_t v9 = v16;
    self->_lastHour = *((void *)&v16 + 1);
    self->_lastMinute = v9;
  }
  [(SBUIPreciseClockTimer *)self _updateDisplayLinkFrameIntervalForSecondsPastMinute:(double)v14 / 1000000000.0 + (double)v15];
}

- (void)_updateDisplayLinkFrameIntervalForSecondsPastMinute:(double)a3
{
  if (a3 <= 59.8666667)
  {
    float v4 = 15.0;
    float v5 = 15.0;
  }
  else
  {
    float v4 = 60.0;
    float v5 = 60.0;
  }
  CAFrameRateRange v14 = CAFrameRateRangeMake(v4, 120.0, v5);
  float minimum = v14.minimum;
  float maximum = v14.maximum;
  float preferred = v14.preferred;
  [(CADisplayLink *)self->_displayLink preferredFrameRateRange];
  v16.float minimum = minimum;
  v16.float maximum = maximum;
  v16.float preferred = preferred;
  if (!CAFrameRateRangeIsEqualToRange(v15, v16))
  {
    displayLink = self->_displayLink;
    *(float *)&double v9 = minimum;
    *(float *)&double v10 = maximum;
    *(float *)&double v11 = preferred;
    -[CADisplayLink setPreferredFrameRateRange:](displayLink, "setPreferredFrameRateRange:", v9, v10, v11);
  }
}

+ (id)now
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  v3 = [v2 dateByAddingTimeInterval:0.05];

  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

uint64_t __39__SBUIPreciseClockTimer_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBUIPreciseClockTimer);
  uint64_t v1 = sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (SBUIPreciseClockTimer)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBUIPreciseClockTimer;
  v2 = [(SBUIPreciseClockTimer *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    float v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    uint64_t v5 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
    uint64_t v6 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v5;

    *(int64x2_t *)(v2 + 40) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  }
  return (SBUIPreciseClockTimer *)v2;
}

- (void)dealloc
{
  [(CADisplayLink *)self->_displayLink invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBUIPreciseClockTimer;
  [(SBUIPreciseClockTimer *)&v3 dealloc];
}

- (id)startMinuteUpdatesWithHandler:(id)a3
{
  float v4 = NSNumber;
  unint64_t nextToken = self->_nextToken;
  id v6 = a3;
  uint64_t v7 = [v4 numberWithUnsignedInteger:nextToken];
  minuteUpdateHandlers = self->_minuteUpdateHandlers;
  ++self->_nextToken;
  double v9 = (void *)[v6 copy];

  [(NSMutableDictionary *)minuteUpdateHandlers setObject:v9 forKey:v7];
  [(SBUIPreciseClockTimer *)self _updateDisplayLink];
  return v7;
}

- (void)stopMinuteUpdatesForToken:(id)a3
{
  [(NSMutableDictionary *)self->_minuteUpdateHandlers removeObjectForKey:a3];
  [(SBUIPreciseClockTimer *)self _updateDisplayLink];
}

- (id)date
{
  v2 = objc_opt_class();
  return (id)[v2 now];
}

- (void)_updateDisplayLink
{
  uint64_t v3 = [(NSMutableDictionary *)self->_minuteUpdateHandlers count];
  displayLink = self->_displayLink;
  if (v3)
  {
    if (!displayLink)
    {
      uint64_t v5 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__onDisplayLink_];
      id v6 = self->_displayLink;
      self->_displayLink = v5;

      uint64_t v7 = self->_displayLink;
      objc_super v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [(CADisplayLink *)v7 addToRunLoop:v8 forMode:*MEMORY[0x1E4F1C4B0]];

      double v9 = self->_displayLink;
      [(CADisplayLink *)v9 setPreferredFramesPerSecond:60];
    }
  }
  else if (displayLink)
  {
    [(CADisplayLink *)displayLink invalidate];
    double v10 = self->_displayLink;
    self->_displayLink = 0;

    *(int64x2_t *)&self->_lastHour = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_minuteUpdateHandlers, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end