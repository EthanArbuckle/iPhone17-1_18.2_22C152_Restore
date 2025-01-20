@interface THGlossaryTermTableViewCellAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)accessibilityLabel;
@end

@implementation THGlossaryTermTableViewCellAccessibility

+ (id)tsaxTargetClassName
{
  return @"THGlossaryTermTableViewCell";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  id v2 = [(THGlossaryTermTableViewCellAccessibility *)self tsaxValueForKey:@"mLabelWithHighlights"];

  return [v2 accessibilityLabel];
}

@end