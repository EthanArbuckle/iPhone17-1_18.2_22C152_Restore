@interface HDSPSleepModeWindDownState
- (id)stateName;
- (int64_t)sleepMode;
@end

@implementation HDSPSleepModeWindDownState

- (id)stateName
{
  return @"Wind Down";
}

- (int64_t)sleepMode
{
  return 1;
}

@end