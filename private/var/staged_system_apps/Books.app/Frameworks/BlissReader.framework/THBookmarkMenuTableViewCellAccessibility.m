@interface THBookmarkMenuTableViewCellAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation THBookmarkMenuTableViewCellAccessibility

+ (id)tsaxTargetClassName
{
  return @"THBookmarkMenuTableViewCell";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [self tsaxValueForKey:@"pageNumberLabel" tsaxValueForKey:@"text"];
  if ([(NSString *)v3 length]) {
    v3 = +[NSString stringWithFormat:TSAccessibilityLocalizedString(@"page.number %@"), v3];
  }
  id v4 = [self tsaxValueForKey:@"bookmarkTitleLabel" tsaxValueForKey:@"text"];
  return __TSAccessibilityStringForVariables(1, v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)THBookmarkMenuTableViewCellAccessibility;
  return UIAccessibilityTraitStartsMediaSession | [(THBookmarkMenuTableViewCellAccessibility *)&v3 accessibilityTraits];
}

@end