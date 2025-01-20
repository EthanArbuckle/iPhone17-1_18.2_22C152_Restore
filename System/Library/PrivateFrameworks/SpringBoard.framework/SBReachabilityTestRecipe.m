@interface SBReachabilityTestRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBReachabilityTestRecipe

- (id)title
{
  return @"Reachability Test";
}

- (void)handleVolumeIncrease
{
  id v2 = +[SBReachabilityManager sharedInstance];
  [v2 deactivateReachability];
}

- (void)handleVolumeDecrease
{
  id v2 = +[SBReachabilityManager sharedInstance];
  [v2 toggleReachability];
}

@end