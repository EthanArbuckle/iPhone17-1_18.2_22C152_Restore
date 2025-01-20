@interface SBActivateApplicationTestRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBActivateApplicationTestRecipe

- (id)title
{
  return @"Activate App";
}

- (void)handleVolumeIncrease
{
  v2 = +[SBApplicationController sharedInstance];
  id v3 = [v2 applicationWithBundleIdentifier:@"com.apple.mobilenotes"];

  SBWorkspaceActivateApplication(v3);
}

- (void)handleVolumeDecrease
{
  v2 = +[SBApplicationController sharedInstance];
  id v3 = [v2 applicationWithBundleIdentifier:@"com.apple.mobilenotes"];

  SBWorkspaceActivateApplicationSuspended(v3);
}

@end