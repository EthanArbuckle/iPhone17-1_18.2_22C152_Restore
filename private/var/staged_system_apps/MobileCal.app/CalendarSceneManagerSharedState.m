@interface CalendarSceneManagerSharedState
- (ApplicationLastActiveTimeProvider)applicationLastActiveTimeProvider;
- (BOOL)extendedLaunchComplete;
- (void)setApplicationLastActiveTimeProvider:(id)a3;
- (void)setExtendedLaunchComplete:(BOOL)a3;
@end

@implementation CalendarSceneManagerSharedState

- (void)setExtendedLaunchComplete:(BOOL)a3
{
  self->_extendedLaunchComplete = a3;
}

- (void)setApplicationLastActiveTimeProvider:(id)a3
{
}

- (BOOL)extendedLaunchComplete
{
  return self->_extendedLaunchComplete;
}

- (ApplicationLastActiveTimeProvider)applicationLastActiveTimeProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationLastActiveTimeProvider);

  return (ApplicationLastActiveTimeProvider *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end