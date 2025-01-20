@interface TSDInfoGeometryAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (CGPoint)tsaxPosition;
- (int64_t)_tsaxCompareCGFloat:(double)a3 toCGFloat:(double)a4;
- (int64_t)tsaxCompareToInfoGeometry:(id)a3;
@end

@implementation TSDInfoGeometryAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDInfoGeometry";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (CGPoint)tsaxPosition
{
  [(TSDInfoGeometryAccessibility *)self tsaxCGPointValueForKey:@"position"];
  result.y = v3;
  result.x = v2;
  return result;
}

- (int64_t)tsaxCompareToInfoGeometry:(id)a3
{
  [(TSDInfoGeometryAccessibility *)self tsaxPosition];
  double v6 = v5;
  [a3 tsaxPosition];
  int64_t result = -[TSDInfoGeometryAccessibility _tsaxCompareCGFloat:toCGFloat:](self, "_tsaxCompareCGFloat:toCGFloat:", v6);
  if (!result)
  {
    [(TSDInfoGeometryAccessibility *)self tsaxPosition];
    double v9 = v8;
    [a3 tsaxPosition];
    return [(TSDInfoGeometryAccessibility *)self _tsaxCompareCGFloat:v9 toCGFloat:v10];
  }
  return result;
}

- (int64_t)_tsaxCompareCGFloat:(double)a3 toCGFloat:(double)a4
{
  if (a3 < a4) {
    return -1;
  }
  else {
    return a3 != a4;
  }
}

@end