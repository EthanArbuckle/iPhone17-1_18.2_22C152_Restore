@interface THToolbarAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_accessibilityAlwaysOrderedFirst;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
@end

@implementation THToolbarAccessibility

+ (id)tsaxTargetClassName
{
  return @"THToolbar";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return THAccessibilityLocalizedString(@"toolbar");
}

- (BOOL)_accessibilityAlwaysOrderedFirst
{
  return 1;
}

@end