@interface SBLogWindowTestRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
- (void)windowSceneDidUpdate:(id)a3;
@end

@implementation SBLogWindowTestRecipe

- (id)title
{
  return @"Log Window";
}

- (void)handleVolumeIncrease
{
  id v2 = +[SBLogWindowController sharedInstance];
  [v2 show];
}

- (void)handleVolumeDecrease
{
  id v2 = +[SBLogWindowController sharedInstance];
  [v2 hide];
}

- (void)windowSceneDidUpdate:(id)a3
{
}

@end