@interface TSWPassThroughViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)_accessibilityElementsInContainerIncludingContainers:(BOOL)a3;
- (id)_accessibilityElementsInDirection:(BOOL)a3 withCount:(unsigned int)a4 originalElement:(id)a5;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation TSWPassThroughViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPassThroughView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TSWPassThroughViewAccessibility;
  id result = -[TSWPassThroughViewAccessibility _accessibilityHitTest:withEvent:](&v6, "_accessibilityHitTest:withEvent:", a4, a3.x, a3.y);
  if (result == self) {
    return 0;
  }
  return result;
}

- (id)_accessibilityElementsInDirection:(BOOL)a3 withCount:(unsigned int)a4 originalElement:(id)a5
{
  BOOL v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TSWPassThroughViewAccessibility;
  id v9 = -[TSWPassThroughViewAccessibility _accessibilityElementsInDirection:withCount:originalElement:](&v11, "_accessibilityElementsInDirection:withCount:originalElement:");
  if (a5 == self && v7)
  {
    id v9 = [[a5 tsaxValueForKey:@"_accessibleSubviews"] sortedArrayUsingSelector:NSSelectorFromString(@"accessibilityCompareGeometry:")];
    if ((unint64_t)[v9 count] > a4) {
      return [v9 subarrayWithRange:0, a4];
    }
  }
  return v9;
}

- (id)_accessibilityElementsInContainerIncludingContainers:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSWPassThroughViewAccessibility;
  id v6 = -[TSWPassThroughViewAccessibility _accessibilityElementsInContainerIncludingContainers:](&v9, "_accessibilityElementsInContainerIncludingContainers:");
  if (v3
    && (objc_msgSend(-[TSWPassThroughViewAccessibility thaxDocumentViewController](self, "thaxDocumentViewController"), "tsaxBoolValueForKey:", @"inFlowMode") & 1) == 0)
  {
    id v7 = [(TSWPassThroughViewAccessibility *)self tsaxValueForKey:@"superview"];
    NSClassFromString(@"TSDCanvasView");
    if (objc_opt_isKindOfClass()) {
      return [v7 performSelector:a2 withObject:[NSNumber numberWithBool:1]];
    }
  }
  return v6;
}

@end