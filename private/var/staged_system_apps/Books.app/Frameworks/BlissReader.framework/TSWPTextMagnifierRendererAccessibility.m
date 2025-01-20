@interface TSWPTextMagnifierRendererAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)_accessibilitySubviews;
@end

@implementation TSWPTextMagnifierRendererAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPTextMagnifierRenderer";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilitySubviews
{
  return 0;
}

@end