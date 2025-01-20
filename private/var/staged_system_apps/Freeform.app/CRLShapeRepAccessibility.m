@interface CRLShapeRepAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4;
- (BOOL)crlaxIsIgnored;
- (BOOL)crlaxSupportsPublicCustomRotors;
- (BOOL)isAccessibilityElement;
- (CRLShapeItemAccessibility)crlaxShapeInfo;
- (NSString)crlaxLabel;
- (id)accessibilityHint;
- (id)crlaxKnobLabel;
- (id)crlaxSummaryDescription;
@end

@implementation CRLShapeRepAccessibility

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  v16.receiver = self;
  v16.super_class = (Class)CRLShapeRepAccessibility;
  v3 = [(CRLCanvasRepAccessibility *)&v16 accessibilityHint];
  v4 = [(CRLShapeRepAccessibility *)self crlaxShapeInfo];
  v5 = [v4 crlaxShapeStyleName];

  v6 = [(CRLShapeRepAccessibility *)self crlaxShapeInfo];
  v7 = [v6 crlaxShapeTypeHint];

  v14 = __CRLAccessibilityStringForVariables(1, v7, v8, v9, v10, v11, v12, v13, (uint64_t)v5);

  return v14;
}

- (BOOL)crlaxSupportsPublicCustomRotors
{
  return 1;
}

- (id)crlaxSummaryDescription
{
  v2 = [(CRLShapeRepAccessibility *)self crlaxShapeInfo];
  v3 = [v2 crlaxShapeStyleName];

  return v3;
}

+ (id)crlaxTargetClassName
{
  return @"CRLShapeRep";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (NSString)crlaxLabel
{
  v2 = [(CRLShapeRepAccessibility *)self crlaxTarget];
  id v3 = [v2 shapeInfo];

  v4 = [v3 localizedName];
  v5 = [v3 accessibilityDescription];
  uint64_t v12 = __CRLAccessibilityStringForVariables(1, v4, v6, v7, v8, v9, v10, v11, (uint64_t)v5);

  return (NSString *)v12;
}

- (CRLShapeItemAccessibility)crlaxShapeInfo
{
  char v8 = 0;
  v2 = [(CRLShapeRepAccessibility *)self crlaxTarget];
  id v3 = [v2 shapeInfo];

  v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  uint64_t v6 = (void *)v5;

  return (CRLShapeItemAccessibility *)v6;
}

- (id)crlaxKnobLabel
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"Shape" value:0 table:0];

  return v3;
}

- (BOOL)crlaxIsIgnored
{
  v2 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  unsigned __int8 v3 = [v2 crlaxShapeRepsAreIgnored];

  return v3;
}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  char v8 = +[CRLAccessibility sharedInstance];
  unsigned int v9 = [v8 needsAccessibilityElements];

  if (v9)
  {
    [(CRLCanvasRepAccessibility *)self crlaxNaturalBounds];
    double v14 = x;
    double v15 = y;
    return CGRectContainsPoint(*(CGRect *)&v10, *(CGPoint *)&v14);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CRLShapeRepAccessibility;
    return -[CRLShapeRepAccessibility containsPoint:withPrecision:](&v17, "containsPoint:withPrecision:", v4, x, y);
  }
}

@end