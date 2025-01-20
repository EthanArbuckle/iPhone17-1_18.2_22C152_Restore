@interface MapsAction
- (BOOL)forceEndNavigation;
- (BOOL)isCompatibleWithNavigation;
- (BOOL)isCompatibleWithRestorationTask;
- (BOOL)isTestingAction;
- (BOOL)needsUserLocation;
- (BOOL)shouldResetUI;
- (double)userLocationDesiredAccuracy;
- (int)analyticsLaunchActionType;
- (void)setUserLocationAccuracy:(double)a3;
@end

@implementation MapsAction

- (void)setUserLocationAccuracy:(double)a3
{
  self->_needsUserLocation = 1;
  self->_userLocationDesiredAccuracy = a3;
}

- (BOOL)isCompatibleWithNavigation
{
  return 0;
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 1;
}

- (BOOL)isTestingAction
{
  return 0;
}

- (BOOL)forceEndNavigation
{
  return 0;
}

- (BOOL)shouldResetUI
{
  return 1;
}

- (int)analyticsLaunchActionType
{
  return 0;
}

- (BOOL)needsUserLocation
{
  return self->_needsUserLocation;
}

- (double)userLocationDesiredAccuracy
{
  return self->_userLocationDesiredAccuracy;
}

@end