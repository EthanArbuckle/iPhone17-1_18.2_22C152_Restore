@interface HDSPSleepWidgetDisabledState
- (BOOL)reloadsWidgetOnModelChange;
- (BOOL)reloadsWidgetOnTimeChange;
- (BOOL)widgetStateHasTimeComponent;
- (id)stateName;
- (int64_t)widgetState;
@end

@implementation HDSPSleepWidgetDisabledState

- (id)stateName
{
  return @"Disabled";
}

- (int64_t)widgetState
{
  return 0;
}

- (BOOL)reloadsWidgetOnModelChange
{
  return 0;
}

- (BOOL)reloadsWidgetOnTimeChange
{
  return 0;
}

- (BOOL)widgetStateHasTimeComponent
{
  return 0;
}

@end