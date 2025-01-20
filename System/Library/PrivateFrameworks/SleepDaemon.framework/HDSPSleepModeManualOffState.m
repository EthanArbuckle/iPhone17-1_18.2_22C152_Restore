@interface HDSPSleepModeManualOffState
- (id)stateName;
- (unint64_t)defaultChangeReason;
@end

@implementation HDSPSleepModeManualOffState

- (unint64_t)defaultChangeReason
{
  return 1;
}

- (id)stateName
{
  return @"Manual Off";
}

@end