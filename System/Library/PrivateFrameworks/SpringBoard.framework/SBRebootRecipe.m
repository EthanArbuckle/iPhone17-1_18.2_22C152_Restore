@interface SBRebootRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBRebootRecipe

- (id)title
{
  return @"Reboot";
}

- (void)handleVolumeIncrease
{
  v3 = [[SBRebootContext alloc] initWithReason:@"TestRecipe"];
  [(SBRebootContext *)v3 setDark:1];
  v2 = [(id)SBApp restartManager];
  [v2 rebootWithContext:v3];
}

- (void)handleVolumeDecrease
{
  id v2 = [(id)SBApp restartManager];
  [v2 rebootForReason:@"TestRecipe"];
}

@end