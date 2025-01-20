@interface STUIStatusBarDisplayItemPlacementExpandedIndicatorsGroup
+ (id)activityItemDisplayIdentifier;
@end

@implementation STUIStatusBarDisplayItemPlacementExpandedIndicatorsGroup

+ (id)activityItemDisplayIdentifier
{
  return +[STUIStatusBarItem defaultDisplayIdentifier];
}

@end