@interface SUSUIFakeSUAutoInstallForecast
- (double)_now;
- (id)firstUnlock;
- (id)suEndDate;
- (id)suStartDate;
- (id)unlockEndDate;
- (id)unlockStartDate;
- (int64_t)scheduleType;
@end

@implementation SUSUIFakeSUAutoInstallForecast

- (int64_t)scheduleType
{
  return 1;
}

- (id)unlockStartDate
{
  v4 = (void *)MEMORY[0x263EFF910];
  [(SUSUIFakeSUAutoInstallForecast *)self _now];
  return (id)[v4 dateWithTimeIntervalSinceReferenceDate:v2 + 18000.0];
}

- (id)unlockEndDate
{
  v4 = (void *)MEMORY[0x263EFF910];
  [(SUSUIFakeSUAutoInstallForecast *)self _now];
  return (id)[v4 dateWithTimeIntervalSinceReferenceDate:v2 + 28800.0];
}

- (id)suStartDate
{
  v4 = (void *)MEMORY[0x263EFF910];
  [(SUSUIFakeSUAutoInstallForecast *)self _now];
  return (id)[v4 dateWithTimeIntervalSinceReferenceDate:v2 + 43200.0];
}

- (id)suEndDate
{
  v4 = (void *)MEMORY[0x263EFF910];
  [(SUSUIFakeSUAutoInstallForecast *)self _now];
  return (id)[v4 dateWithTimeIntervalSinceReferenceDate:v2 + 57600.0];
}

- (id)firstUnlock
{
  v4 = (void *)MEMORY[0x263EFF910];
  [(SUSUIFakeSUAutoInstallForecast *)self _now];
  return (id)[v4 dateWithTimeIntervalSinceReferenceDate:v2 + 10800.0];
}

- (double)_now
{
  if (self->_now == 0.0)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    self->_now = v2;
  }
  return self->_now;
}

@end