@interface HDSPSleepModeBedtimeState
- (id)stateName;
- (int64_t)sleepMode;
@end

@implementation HDSPSleepModeBedtimeState

- (id)stateName
{
  return @"Bedtime";
}

- (int64_t)sleepMode
{
  return 2;
}

@end