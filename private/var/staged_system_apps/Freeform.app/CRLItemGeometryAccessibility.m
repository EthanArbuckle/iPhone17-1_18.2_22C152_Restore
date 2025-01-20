@interface CRLItemGeometryAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (CGPoint)crlaxPosition;
- (int64_t)_crlaxCompareCGFloat:(double)a3 toCGFloat:(double)a4;
- (int64_t)crlaxCompareToInfoGeometry:(id)a3;
@end

@implementation CRLItemGeometryAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLCanvasInfoGeometry";
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

- (CGPoint)crlaxPosition
{
  v2 = [(CRLItemGeometryAccessibility *)self crlaxTarget];
  [v2 position];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (int64_t)crlaxCompareToInfoGeometry:(id)a3
{
  id v4 = a3;
  [(CRLItemGeometryAccessibility *)self crlaxPosition];
  double v6 = v5;
  [v4 crlaxPosition];
  int64_t v7 = -[CRLItemGeometryAccessibility _crlaxCompareCGFloat:toCGFloat:](self, "_crlaxCompareCGFloat:toCGFloat:", v6);
  if (!v7)
  {
    [(CRLItemGeometryAccessibility *)self crlaxPosition];
    double v9 = v8;
    [v4 crlaxPosition];
    int64_t v7 = [(CRLItemGeometryAccessibility *)self _crlaxCompareCGFloat:v9 toCGFloat:v10];
  }

  return v7;
}

- (int64_t)_crlaxCompareCGFloat:(double)a3 toCGFloat:(double)a4
{
  if (a3 < a4) {
    return -1;
  }
  else {
    return a3 != a4;
  }
}

@end