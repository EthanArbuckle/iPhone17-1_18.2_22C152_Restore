@interface TSUICollectionViewCellAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (CGRect)accessibilityFrame;
@end

@implementation TSUICollectionViewCellAccessibility

+ (id)tsaxTargetClassName
{
  return @"UICollectionViewCell";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (CGRect)accessibilityFrame
{
  id v3 = [(TSUICollectionViewCellAccessibility *)self accessibilityContainer];
  v20.receiver = self;
  v20.super_class = (Class)TSUICollectionViewCellAccessibility;
  [(TSUICollectionViewCellAccessibility *)&v20 accessibilityFrame];
  CGFloat x = v4;
  CGFloat y = v6;
  CGFloat width = v8;
  CGFloat height = v10;
  NSClassFromString(@"UICollectionViewCellAccessibilityElement");
  if (objc_opt_isKindOfClass()) {
    id v3 = [v3 accessibilityContainer];
  }
  if (v3)
  {
    [v3 accessibilityFrame];
    v24.origin.CGFloat x = v12;
    v24.origin.CGFloat y = v13;
    v24.size.CGFloat width = v14;
    v24.size.CGFloat height = v15;
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGRect v22 = CGRectIntersection(v21, v24);
    CGFloat x = v22.origin.x;
    CGFloat y = v22.origin.y;
    CGFloat width = v22.size.width;
    CGFloat height = v22.size.height;
  }
  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

@end