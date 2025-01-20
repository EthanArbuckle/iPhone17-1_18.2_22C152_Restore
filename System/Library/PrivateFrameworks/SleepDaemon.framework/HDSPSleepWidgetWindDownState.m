@interface HDSPSleepWidgetWindDownState
- (BOOL)widgetStateHasTimeComponent;
- (id)stateName;
- (int64_t)widgetState;
@end

@implementation HDSPSleepWidgetWindDownState

- (id)stateName
{
  return @"WindDown";
}

- (int64_t)widgetState
{
  return 3;
}

- (BOOL)widgetStateHasTimeComponent
{
  return 0;
}

@end