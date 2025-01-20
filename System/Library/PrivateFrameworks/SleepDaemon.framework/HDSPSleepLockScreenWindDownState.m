@interface HDSPSleepLockScreenWindDownState
- (id)stateName;
- (int64_t)sleepLockScreenState;
@end

@implementation HDSPSleepLockScreenWindDownState

- (id)stateName
{
  return @"WindDown";
}

- (int64_t)sleepLockScreenState
{
  return 1;
}

@end