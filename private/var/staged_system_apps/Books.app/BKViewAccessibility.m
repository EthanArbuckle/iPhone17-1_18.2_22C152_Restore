@interface BKViewAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (BOOL)_accessibilityServesAsContainingParentForOrdering;
- (CGRect)accessibilityFrame;
@end

@implementation BKViewAccessibility

+ (id)imaxTargetClassName
{
  return @"UIView";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityServesAsContainingParentForOrdering
{
  v3 = [(BKViewAccessibility *)self imaxIdentification];
  if (([v3 isEqualToString:@"ContainerParent"] & 1) != 0
    || ([v3 isEqualToString:@"TableSwitchSegment"] & 1) != 0
    || ([v3 isEqualToString:@"SwitcherToolbar"] & 1) != 0
    || ([v3 isEqualToString:@"SwitchContentView"] & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)BKViewAccessibility;
    BOOL v4 = [(BKViewAccessibility *)&v6 _accessibilityServesAsContainingParentForOrdering];
  }

  return v4;
}

- (CGRect)accessibilityFrame
{
  v33.receiver = self;
  v33.super_class = (Class)BKViewAccessibility;
  [(BKViewAccessibility *)&v33 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(BKViewAccessibility *)self imaxIdentification];
  if (([v11 isEqualToString:@"BookTopLabel"] & 1) != 0
    || [v11 isEqualToString:@"TableSwitchSegment"])
  {
    v12 = [(BKViewAccessibility *)self imaxValueForKey:@"bounds"];
    [v12 rectValue];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;

    v21 = [(BKViewAccessibility *)self imaxValueForKey:@"window"];
    v22 = [v21 windowScene];
    v23 = (char *)[v22 interfaceOrientation];

    if ((unint64_t)(v23 - 1) > 1 || (CGFloat v24 = -20.0, (isPad() & 1) == 0)) {
      CGFloat v24 = -10.0;
    }
    v34.origin.x = v14;
    v34.origin.y = v16;
    v34.size.width = v18;
    v34.size.height = v20;
    CGRect v35 = CGRectInset(v34, 0.0, v24);
    -[BKViewAccessibility imaxFrameFromBounds:](self, "imaxFrameFromBounds:", v35.origin.x, v35.origin.y, v35.size.width, v35.size.height);
    double v4 = v25;
    double v6 = v26;
    double v8 = v27;
    double v10 = v28;
  }
  double v29 = v4;
  double v30 = v6;
  double v31 = v8;
  double v32 = v10;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

@end