@interface CRLCanvasLayoutGeometryAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (CGRect)_crlaxFrame;
- (CGSize)crlaxSize;
- (double)crlaxAngleInDegrees;
- (double)crlaxAngleInRadians;
@end

@implementation CRLCanvasLayoutGeometryAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLCanvasLayoutGeometry";
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

- (double)crlaxAngleInDegrees
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  v2 = [(CRLCanvasLayoutGeometryAccessibility *)self crlaxTarget];
  id v3 = v2;
  if (v2)
  {
    [v2 transform];
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
  }

  v6[0] = v7;
  v6[1] = v8;
  v6[2] = v9;
  double v4 = sub_10007F788(v6);
  sub_100065C2C(-v4);
  return result;
}

- (double)crlaxAngleInRadians
{
  v2 = [(CRLCanvasLayoutGeometryAccessibility *)self crlaxTarget];
  id v3 = v2;
  if (v2) {
    [v2 transform];
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  double v4 = sub_10007F7C8((double *)v8);
  sub_100066410(-v4);
  double v6 = v5;

  return v6;
}

- (CGSize)crlaxSize
{
  [(CRLCanvasLayoutGeometryAccessibility *)self _crlaxFrame];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (CGRect)_crlaxFrame
{
  double v2 = [(CRLCanvasLayoutGeometryAccessibility *)self crlaxTarget];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

@end