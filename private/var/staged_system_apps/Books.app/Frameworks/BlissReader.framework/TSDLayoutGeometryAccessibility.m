@interface TSDLayoutGeometryAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (CGRect)_tsaxFrame;
- (CGSize)tsaxSize;
- (double)tsaxAngle;
@end

@implementation TSDLayoutGeometryAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDLayoutGeometry";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (double)tsaxAngle
{
  if (self) {
    [(TSDLayoutGeometryAccessibility *)self tsaxCGAffineTransformValueForKey:@"transform"];
  }
  TSDTransformAngle();
  TSDNormalizeAngleInDegrees();
  return result;
}

- (CGSize)tsaxSize
{
  [(TSDLayoutGeometryAccessibility *)self _tsaxFrame];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (CGRect)_tsaxFrame
{
  [(TSDLayoutGeometryAccessibility *)self tsaxCGRectValueForKey:@"frame"];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

@end