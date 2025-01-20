@interface TSCALayerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
@end

@implementation TSCALayerAccessibility

- (id)accessibilityLabel
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)TSCALayerAccessibility;
    return [(TSCALayerAccessibility *)&v5 accessibilityLabel];
  }
  id v3 = [(TSCALayerAccessibility *)self string];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return v3;
  }

  return [v3 string];
}

- (CGRect)accessibilityFrame
{
  id v3 = [(TSCALayerAccessibility *)self tsaxAncestorOfType:NSClassFromString(@"TSDCanvasView")];
  if (v3)
  {
    v4 = v3;
    [(TSCALayerAccessibility *)self bounds];
    -[TSCALayerAccessibility convertRect:toLayer:](self, "convertRect:toLayer:", [v4 layer], v5, v6, v7, v8);
    [v4 tsaxFrameFromBounds:];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TSCALayerAccessibility;
    [(TSCALayerAccessibility *)&v13 accessibilityFrame];
  }
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

+ (id)tsaxTargetClassName
{
  return @"CALayer";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end