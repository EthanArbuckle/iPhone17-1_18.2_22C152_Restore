@interface TSUIInputSetHostViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)accessibilityElementsHidden;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation TSUIInputSetHostViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"UIInputSetHostView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  if (sub_26E41C()) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUIInputSetHostViewAccessibility;
  return [(TSUIInputSetHostViewAccessibility *)&v4 accessibilityElementsHidden];
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  if (sub_26E41C()) {
    return 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)TSUIInputSetHostViewAccessibility;
  return -[TSUIInputSetHostViewAccessibility _accessibilityHitTest:withEvent:](&v9, "_accessibilityHitTest:withEvent:", a4, x, y);
}

@end