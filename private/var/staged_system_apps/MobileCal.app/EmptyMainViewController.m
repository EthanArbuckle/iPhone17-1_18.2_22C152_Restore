@interface EmptyMainViewController
- (BOOL)allowsOverriddenRightNavigationBarItems;
- (BOOL)allowsOverriddenToolbarItems;
- (int64_t)intendedSizeClass;
@end

@implementation EmptyMainViewController

- (BOOL)allowsOverriddenToolbarItems
{
  return 0;
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 0;
}

- (int64_t)intendedSizeClass
{
  return 0;
}

@end