@interface _UIStatusBarDisplayItemPlacementExpandedIndicatorsGroup
+ (id)activityItemDisplayIdentifier;
@end

@implementation _UIStatusBarDisplayItemPlacementExpandedIndicatorsGroup

+ (id)activityItemDisplayIdentifier
{
  return +[_UIStatusBarItem defaultDisplayIdentifier];
}

@end