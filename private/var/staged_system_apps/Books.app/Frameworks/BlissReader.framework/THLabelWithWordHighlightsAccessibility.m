@interface THLabelWithWordHighlightsAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)accessibilityLabel;
@end

@implementation THLabelWithWordHighlightsAccessibility

+ (id)tsaxTargetClassName
{
  return @"THLabelWithWordHighlights";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return [(THLabelWithWordHighlightsAccessibility *)self tsaxValueForKey:@"mText"];
}

@end