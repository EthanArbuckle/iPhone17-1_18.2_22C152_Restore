@interface CRLCALayerAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxTargetClassName;
- (CGRect)accessibilityFrame;
- (id)accessibilityLabel;
- (id)description;
@end

@implementation CRLCALayerAccessibility

+ (id)crlaxTargetClassName
{
  return @"CALayer";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)CRLCALayerAccessibility;
  v2 = [(CRLCALayerAccessibility *)&v4 description];

  return v2;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [(CRLCALayerAccessibility *)self string];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v3 string];
    }
    else
    {
      id v4 = v3;
    }
    v5 = v4;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLCALayerAccessibility;
    v5 = [(CRLCALayerAccessibility *)&v7 accessibilityLabel];
  }

  return v5;
}

- (CGRect)accessibilityFrame
{
  v3 = [(CRLCALayerAccessibility *)self crlaxAncestorOfType:NSClassFromString(@"CRLCanvasView")];
  if (v3)
  {
    id v4 = self;
    [(CRLCALayerAccessibility *)v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [v3 layer];
    -[CRLCALayerAccessibility convertRect:toLayer:](v4, "convertRect:toLayer:", v13, v6, v8, v10, v12);
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    [v3 crlaxFrameFromBounds:v15, v17, v19, v21];
  }
  else
  {
    v34.receiver = self;
    v34.super_class = (Class)CRLCALayerAccessibility;
    [(CRLCALayerAccessibility *)&v34 accessibilityFrame];
  }
  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  double v29 = v25;

  double v30 = v26;
  double v31 = v27;
  double v32 = v28;
  double v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

@end