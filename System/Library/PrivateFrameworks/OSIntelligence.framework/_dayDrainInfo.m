@interface _dayDrainInfo
- (_dayDrainInfo)init;
- (int64_t)drainSoFar;
- (int64_t)lastBatterySoC;
- (void)setDrainSoFar:(int64_t)a3;
- (void)setLastBatterySoC:(int64_t)a3;
@end

@implementation _dayDrainInfo

- (_dayDrainInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)_dayDrainInfo;
  result = [(_dayDrainInfo *)&v3 init];
  if (result)
  {
    result->_drainSoFar = 0;
    result->_lastBatterySoC = 0;
  }
  return result;
}

- (int64_t)drainSoFar
{
  return self->_drainSoFar;
}

- (void)setDrainSoFar:(int64_t)a3
{
  self->_drainSoFar = a3;
}

- (int64_t)lastBatterySoC
{
  return self->_lastBatterySoC;
}

- (void)setLastBatterySoC:(int64_t)a3
{
  self->_lastBatterySoC = a3;
}

@end