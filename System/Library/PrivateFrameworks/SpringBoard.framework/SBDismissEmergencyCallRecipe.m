@interface SBDismissEmergencyCallRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBDismissEmergencyCallRecipe

- (id)title
{
  return @"Dismiss Emergency Call";
}

- (void)handleVolumeIncrease
{
  id v5 = +[SBLockScreenManager sharedInstance];
  v2 = [v5 lockScreenEnvironment];
  v3 = [v2 callController];
  v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"blah" code:0 userInfo:0];
  [v3 emergencyDialerExitedWithError:v4];
}

- (void)handleVolumeDecrease
{
  id v4 = +[SBLockScreenManager sharedInstance];
  v2 = [v4 lockScreenEnvironment];
  v3 = [v2 callController];
  [v3 exitEmergencyDialerAnimated:1];
}

@end