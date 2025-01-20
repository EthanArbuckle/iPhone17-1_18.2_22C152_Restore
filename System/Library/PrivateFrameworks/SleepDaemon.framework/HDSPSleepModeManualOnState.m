@interface HDSPSleepModeManualOnState
- (id)stateName;
- (unint64_t)defaultChangeReason;
@end

@implementation HDSPSleepModeManualOnState

- (id)stateName
{
  return @"Manual Bedtime";
}

- (unint64_t)defaultChangeReason
{
  return 1;
}

@end