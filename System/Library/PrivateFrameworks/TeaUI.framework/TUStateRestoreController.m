@interface TUStateRestoreController
- (BOOL)isStateRestorationAllowed;
- (BOOL)isStateRestorationFeatureEnabled;
- (TUStateRestoreController)init;
- (TUStateRestoreController)initWithTimeWindow:(double)a3 isRunningPPT:(BOOL)a4;
- (TUStateRestoreController)initWithTimeWindow:(double)a3 isStateRestorationEnabled:(BOOL)a4;
- (void)navigationDidHappen;
- (void)sceneDidEnterBackground;
@end

@implementation TUStateRestoreController

- (BOOL)isStateRestorationFeatureEnabled
{
  return StateRestoreController.isStateRestorationFeatureEnabled.getter() & 1;
}

- (BOOL)isStateRestorationAllowed
{
  v2 = self;
  char v3 = StateRestoreController.isStateRestorationAllowed.getter();

  return v3 & 1;
}

- (TUStateRestoreController)initWithTimeWindow:(double)a3 isStateRestorationEnabled:(BOOL)a4
{
  return (TUStateRestoreController *)StateRestoreController.init(timeWindow:isStateRestorationEnabled:)(a4, a3);
}

- (TUStateRestoreController)initWithTimeWindow:(double)a3 isRunningPPT:(BOOL)a4
{
  return (TUStateRestoreController *)StateRestoreController.init(timeWindow:isRunningPPT:)(a4, a3);
}

- (void)sceneDidEnterBackground
{
  v2 = self;
  StateRestoreController.sceneDidEnterBackground()();
}

- (void)navigationDidHappen
{
}

- (TUStateRestoreController)init
{
}

- (void).cxx_destruct
{
}

@end