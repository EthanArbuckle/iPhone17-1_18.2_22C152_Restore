@interface SBSwitcherCardUpdateTestRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBSwitcherCardUpdateTestRecipe

- (id)title
{
  return @"Add/Remove Switcher Cards";
}

- (void)handleVolumeIncrease
{
  id v2 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  [v2 _insertCardForDisplayIdentifier:@"com.apple.mobilesafari" atIndex:1];
}

- (void)handleVolumeDecrease
{
  id v2 = +[SBMainSwitcherControllerCoordinator sharedInstance];
  [v2 _removeCardForDisplayIdentifier:@"com.apple.mobilesafari"];
}

@end