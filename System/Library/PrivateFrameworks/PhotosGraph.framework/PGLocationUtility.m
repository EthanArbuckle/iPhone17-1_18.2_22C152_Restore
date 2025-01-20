@interface PGLocationUtility
+ (BOOL)coordinate:(CLLocationCoordinate2D)a3 isCloseToCoordinate:(CLLocationCoordinate2D)a4 threshold:(double)a5;
@end

@implementation PGLocationUtility

+ (BOOL)coordinate:(CLLocationCoordinate2D)a3 isCloseToCoordinate:(CLLocationCoordinate2D)a4 threshold:(double)a5
{
  CLLocationCoordinate2DGetDistanceFrom();
  return v6 <= a5;
}

@end