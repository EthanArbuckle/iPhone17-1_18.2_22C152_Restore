@interface SBMainSwitcherTestRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBMainSwitcherTestRecipe

- (id)title
{
  return @"Main Switcher";
}

- (void)handleVolumeIncrease
{
  v2 = [(id)SBApp windowSceneManager];
  id v4 = [v2 embeddedDisplayWindowScene];

  v3 = [v4 switcherController];
  [v3 activateMainSwitcherWithSource:0 animated:1];
}

- (void)handleVolumeDecrease
{
  v2 = [(id)SBApp windowSceneManager];
  id v4 = [v2 embeddedDisplayWindowScene];

  v3 = [v4 switcherController];
  [v3 dismissMainSwitcherWithSource:0 animated:1];
}

@end