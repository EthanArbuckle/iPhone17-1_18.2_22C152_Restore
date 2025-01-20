@interface HDSPSleepModeAutomatedOnState
- (id)stateName;
- (unint64_t)defaultChangeReason;
@end

@implementation HDSPSleepModeAutomatedOnState

- (id)stateName
{
  return @"Automated On";
}

- (unint64_t)defaultChangeReason
{
  return 7;
}

@end