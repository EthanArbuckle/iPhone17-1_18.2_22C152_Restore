@interface SCLActiveDurationAnalyticsSource
- (BOOL)isActiveForState:(id)a3;
- (SCLActiveDurationAnalyticsSource)initWithInitialState:(id)a3;
- (SCLState)currentState;
- (mach_timebase_info)timebase;
- (unint64_t)activeStartTimestamp;
- (unint64_t)secondsSinceContinuousTimestamp:(unint64_t)a3;
- (unint64_t)secondsWithMachTimeInterval:(unint64_t)a3;
- (void)commitAnalyticsEventForTransitionFromState:(id)a3 toState:(id)a4;
- (void)server:(id)a3 didUpdateState:(id)a4 fromState:(id)a5;
- (void)setActiveStartTimestamp:(unint64_t)a3;
- (void)setCurrentState:(id)a3;
@end

@implementation SCLActiveDurationAnalyticsSource

- (SCLActiveDurationAnalyticsSource)initWithInitialState:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SCLActiveDurationAnalyticsSource;
  v5 = [(SCLActiveDurationAnalyticsSource *)&v8 init];
  v6 = v5;
  if (v5)
  {
    mach_timebase_info(&v5->_timebase);
    [(SCLActiveDurationAnalyticsSource *)v6 setCurrentState:v4];
  }

  return v6;
}

- (void)server:(id)a3 didUpdateState:(id)a4 fromState:(id)a5
{
}

- (void)setCurrentState:(id)a3
{
  id v9 = a3;
  id v4 = self->_currentState;
  v5 = (SCLState *)[v9 copy];
  currentState = self->_currentState;
  self->_currentState = v5;

  int v7 = [(SCLActiveDurationAnalyticsSource *)self isActiveForState:v4];
  int v8 = [(SCLActiveDurationAnalyticsSource *)self isActiveForState:v9];
  if (v7 != v8)
  {
    if (v8)
    {
      self->_activeStartTimestamp = mach_continuous_approximate_time();
    }
    else
    {
      [(SCLActiveDurationAnalyticsSource *)self commitAnalyticsEventForTransitionFromState:v4 toState:v9];
      [(SCLActiveDurationAnalyticsSource *)self setActiveStartTimestamp:0];
    }
  }
}

- (BOOL)isActiveForState:(id)a3
{
  return a3 && [a3 activeState] != 0;
}

- (void)commitAnalyticsEventForTransitionFromState:(id)a3 toState:(id)a4
{
  id v5 = a3;
  [(SCLActiveDurationAnalyticsSource *)self secondsSinceContinuousTimestamp:[(SCLActiveDurationAnalyticsSource *)self activeStartTimestamp]];
  id v6 = v5;
  AnalyticsSendEventLazy();
}

id __87__SCLActiveDurationAnalyticsSource_commitAnalyticsEventForTransitionFromState_toState___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  v7[0] = @"scheduleEnabled";
  v2 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isScheduleEnabled"));
  v8[0] = v2;
  v7[1] = @"inSchedule";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isInSchedule"));
  v8[1] = v3;
  v7[2] = @"duration";
  id v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  v8[2] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (unint64_t)secondsSinceContinuousTimestamp:(unint64_t)a3
{
  uint64_t v5 = mach_continuous_approximate_time();
  if (v5 < a3) {
    return 0;
  }
  return [(SCLActiveDurationAnalyticsSource *)self secondsWithMachTimeInterval:v5 - a3];
}

- (unint64_t)secondsWithMachTimeInterval:(unint64_t)a3
{
  return self->_timebase.numer * a3 / self->_timebase.denom / 0x3B9ACA00;
}

- (SCLState)currentState
{
  return self->_currentState;
}

- (unint64_t)activeStartTimestamp
{
  return self->_activeStartTimestamp;
}

- (void)setActiveStartTimestamp:(unint64_t)a3
{
  self->_activeStartTimestamp = a3;
}

- (mach_timebase_info)timebase
{
  return self->_timebase;
}

- (void).cxx_destruct
{
}

@end