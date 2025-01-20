@interface SBAdvanceDateOverrideTestRecipe
- (id)title;
- (void)advanceOverrideDateByAmount:(int64_t)a3;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBAdvanceDateOverrideTestRecipe

- (id)title
{
  return @"Advance Date Override";
}

- (void)advanceOverrideDateByAmount:(int64_t)a3
{
  id v7 = [MEMORY[0x1E4FA5EE8] sharedInstance];
  v4 = [v7 overrideDate];
  if (!v4)
  {
    v4 = [MEMORY[0x1E4F1C9C8] date];
  }
  v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v6 = [v5 dateByAddingUnit:16 value:a3 toDate:v4 options:0];

  [v7 setOverrideDate:v6];
}

- (void)handleVolumeIncrease
{
}

- (void)handleVolumeDecrease
{
  id v2 = [MEMORY[0x1E4FA5EE8] sharedInstance];
  [v2 setOverrideDate:0];
}

@end