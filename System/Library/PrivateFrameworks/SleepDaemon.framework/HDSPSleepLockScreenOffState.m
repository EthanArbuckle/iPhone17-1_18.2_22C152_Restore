@interface HDSPSleepLockScreenOffState
- (id)stateName;
- (int64_t)sleepLockScreenState;
@end

@implementation HDSPSleepLockScreenOffState

- (id)stateName
{
  return @"Off";
}

- (int64_t)sleepLockScreenState
{
  return 0;
}

@end