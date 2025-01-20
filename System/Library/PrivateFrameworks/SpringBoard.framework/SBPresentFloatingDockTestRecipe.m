@interface SBPresentFloatingDockTestRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBPresentFloatingDockTestRecipe

- (id)title
{
  return @"Present Floating Dock";
}

- (void)handleVolumeIncrease
{
  id v4 = [(id)SBApp windowSceneManager];
  v2 = [v4 activeDisplayWindowScene];
  v3 = [v2 floatingDockController];
  [v3 presentFloatingDockIfDismissedAnimated:1 completionHandler:0];
}

- (void)handleVolumeDecrease
{
  id v4 = [(id)SBApp windowSceneManager];
  v2 = [v4 activeDisplayWindowScene];
  v3 = [v2 floatingDockController];
  [v3 dismissFloatingDockIfPresentedAnimated:1 completionHandler:0];
}

@end