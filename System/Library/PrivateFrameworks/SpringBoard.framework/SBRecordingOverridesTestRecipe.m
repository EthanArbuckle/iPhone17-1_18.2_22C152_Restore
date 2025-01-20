@interface SBRecordingOverridesTestRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBRecordingOverridesTestRecipe

- (id)title
{
  return @"Status Bar Recording Overrides";
}

- (void)handleVolumeIncrease
{
}

- (void)handleVolumeDecrease
{
}

@end