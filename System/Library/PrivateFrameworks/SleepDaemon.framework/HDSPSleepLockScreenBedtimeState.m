@interface HDSPSleepLockScreenBedtimeState
- (id)stateName;
- (int64_t)sleepLockScreenState;
@end

@implementation HDSPSleepLockScreenBedtimeState

- (id)stateName
{
  return @"Bedtime";
}

- (int64_t)sleepLockScreenState
{
  return 2;
}

@end