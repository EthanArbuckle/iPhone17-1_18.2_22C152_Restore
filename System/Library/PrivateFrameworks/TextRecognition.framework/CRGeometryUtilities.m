@interface CRGeometryUtilities
+ (BOOL)checkIntersectionForLineThroughPoint:(CGPoint)a3 andPoint:(CGPoint)a4 andSegmentStartingAt:(CGPoint)a5 andEndingAt:(CGPoint)a6 intersectAt:(CGPoint *)a7;
- (CRGeometryUtilities)init;
@end

@implementation CRGeometryUtilities

+ (BOOL)checkIntersectionForLineThroughPoint:(CGPoint)a3 andPoint:(CGPoint)a4 andSegmentStartingAt:(CGPoint)a5 andEndingAt:(CGPoint)a6 intersectAt:(CGPoint *)a7
{
  return sub_1DD7365C0(&a7->x, a3.x, a3.y, a4.x, a4.y, a5.x, a5.y, a6.x, a6.y);
}

- (CRGeometryUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)CRGeometryUtilities;
  return [(CRGeometryUtilities *)&v3 init];
}

@end