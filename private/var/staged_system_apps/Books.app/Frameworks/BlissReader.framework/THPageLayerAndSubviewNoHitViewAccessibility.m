@interface THPageLayerAndSubviewNoHitViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySubviews;
- (id)accessibilityElements;
@end

@implementation THPageLayerAndSubviewNoHitViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"THPageLayerAndSubviewNoHitView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  return 0;
}

- (id)_accessibilitySubviews
{
  return 0;
}

@end