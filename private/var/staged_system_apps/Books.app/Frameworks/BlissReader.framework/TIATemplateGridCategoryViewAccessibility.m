@interface TIATemplateGridCategoryViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation TIATemplateGridCategoryViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"TIATemplateGridCategoryView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return [(TIATemplateGridCategoryViewAccessibility *)self tsaxValueForKey:@"title"];
}

@end