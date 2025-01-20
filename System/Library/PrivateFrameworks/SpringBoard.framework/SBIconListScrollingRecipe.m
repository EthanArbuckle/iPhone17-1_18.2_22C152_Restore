@interface SBIconListScrollingRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBIconListScrollingRecipe

- (id)title
{
  return @"Icon List Scrolling";
}

- (void)handleVolumeIncrease
{
  v2 = +[SBIconController sharedInstance];
  v3 = [v2 iconManager];
  id v4 = [v3 rootFolderController];

  objc_msgSend(v4, "setCurrentPageIndex:animated:", objc_msgSend(v4, "firstIconPageIndex"), 1);
}

- (void)handleVolumeDecrease
{
  v2 = +[SBIconController sharedInstance];
  v3 = [v2 iconManager];
  id v4 = [v3 rootFolderController];

  objc_msgSend(v4, "setCurrentPageIndex:animated:", objc_msgSend(v4, "firstIconPageIndex"), 0);
}

@end