@interface SBDeviceApplicationInputUIViewProvider
- (id)acquireSystemUIScenePresentingAssertion;
- (int64_t)priority;
@end

@implementation SBDeviceApplicationInputUIViewProvider

- (int64_t)priority
{
  return 3;
}

- (id)acquireSystemUIScenePresentingAssertion
{
  v3 = [(id)SBApp systemUIScenesCoordinator];
  v4 = [v3 inputUISceneController];
  v5 = [v4 addPresenter:self];

  return v5;
}

@end