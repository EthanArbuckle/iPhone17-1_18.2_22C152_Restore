@interface UIStatusBarNavigationItemView
- (id)_appBundleIdentifier;
- (int64_t)buttonType;
@end

@implementation UIStatusBarNavigationItemView

- (id)_appBundleIdentifier
{
  return @"com.apple.Maps";
}

- (int64_t)buttonType
{
  return 3;
}

@end