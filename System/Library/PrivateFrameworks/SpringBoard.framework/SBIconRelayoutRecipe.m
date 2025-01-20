@interface SBIconRelayoutRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBIconRelayoutRecipe

- (id)title
{
  return @"Icon Relayout & Reload";
}

- (void)handleVolumeIncrease
{
  id v3 = +[SBIconController sharedInstance];
  v2 = [v3 iconManager];
  [v2 relayout];
}

- (void)handleVolumeDecrease
{
  v2 = +[SBIconController sharedInstance];
  id v3 = [v2 model];
  [v3 reloadIcons];

  id v5 = +[SBIconController sharedInstance];
  v4 = [v5 iconManager];
  [v4 relayout];
}

@end