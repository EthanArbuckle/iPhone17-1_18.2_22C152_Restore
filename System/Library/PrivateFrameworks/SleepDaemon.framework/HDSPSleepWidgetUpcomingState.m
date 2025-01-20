@interface HDSPSleepWidgetUpcomingState
- (BOOL)schedulesExpiration;
- (id)stateName;
- (int64_t)widgetState;
@end

@implementation HDSPSleepWidgetUpcomingState

- (id)stateName
{
  return @"Upcoming";
}

- (int64_t)widgetState
{
  return 2;
}

- (BOOL)schedulesExpiration
{
  return 1;
}

@end