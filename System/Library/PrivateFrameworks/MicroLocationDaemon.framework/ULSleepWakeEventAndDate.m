@interface ULSleepWakeEventAndDate
- (ULSleepWakeEventAndDate)initWithSleepWakeEvent:(uint64_t)a3 andDate:(uint64_t)a4;
- (double)time;
- (id).cxx_construct;
- (int)sleepWakeState;
- (uint64_t)setTime:(uint64_t)result;
- (void)setSleepWakeState:(int)a3;
@end

@implementation ULSleepWakeEventAndDate

- (ULSleepWakeEventAndDate)initWithSleepWakeEvent:(uint64_t)a3 andDate:(uint64_t)a4
{
  v9.receiver = a1;
  v9.super_class = (Class)ULSleepWakeEventAndDate;
  v6 = [(ULSleepWakeEventAndDate *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(ULSleepWakeEventAndDate *)v6 setSleepWakeState:a4];
    [(ULSleepWakeEventAndDate *)v7 setTime:a2];
  }
  return v7;
}

- (int)sleepWakeState
{
  return self->_sleepWakeState;
}

- (void)setSleepWakeState:(int)a3
{
  self->_sleepWakeState = a3;
}

- (double)time
{
  return *(double *)(a1 + 16);
}

- (uint64_t)setTime:(uint64_t)result
{
  *(double *)(result + 16) = a2;
  return result;
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end