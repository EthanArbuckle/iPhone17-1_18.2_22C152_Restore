@interface PLLocationUtils
+ (BOOL)canUseCoordinate:(CLLocationCoordinate2D)a3;
+ (BOOL)horizontalAccuracyIsCoarse:(double)a3;
+ (BOOL)locationIsCoarse:(id)a3;
+ (CLLocationCoordinate2D)defaultLocationCoordinate2D;
+ (PLCartesianCoordinate3D)cartesianCoordinateFromLatitude:(float)a3 longitude:(float)a4;
+ (id)predicateForAssetWithLocation;
+ (id)predicateForMomentWithLocation;
@end

@implementation PLLocationUtils

+ (PLCartesianCoordinate3D)cartesianCoordinateFromLatitude:(float)a3 longitude:(float)a4
{
  float v4 = a3 * 0.017453;
  __float2 v5 = __sincosf_stret(a4 * 0.017453);
  __float2 v6 = __sincosf_stret(v4);
  float v7 = v6.__cosval * v5.__sinval;
  float v8 = v6.__cosval * v5.__cosval;
  float sinval = v6.__sinval;
  result.var2 = v8;
  result.var1 = sinval;
  result.var0 = v7;
  return result;
}

+ (BOOL)horizontalAccuracyIsCoarse:(double)a3
{
  return a3 >= 1000.0;
}

+ (BOOL)locationIsCoarse:(id)a3
{
  [a3 horizontalAccuracy];
  return objc_msgSend(a1, "horizontalAccuracyIsCoarse:");
}

+ (id)predicateForMomentWithLocation
{
  [a1 defaultLocationCoordinate2D];
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"approximateLatitude > %f && approximateLongitude > %f", v2, v3);
}

+ (id)predicateForAssetWithLocation
{
  [a1 defaultLocationCoordinate2D];
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"latitude > %f && longitude > %f", v2, v3);
}

+ (CLLocationCoordinate2D)defaultLocationCoordinate2D
{
  CLLocationCoordinate2D v4 = CLLocationCoordinate2DMake(-180.0, -180.0);
  double longitude = v4.longitude;
  double latitude = v4.latitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

+ (BOOL)canUseCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  BOOL v5 = CLLocationCoordinate2DIsValid(a3);
  if (v5)
  {
    BOOL v6 = latitude != 0.0;
    if (longitude != 0.0) {
      BOOL v6 = 1;
    }
    LOBYTE(v5) = v6 && (longitude != -100.0 || latitude != 40.0);
  }
  return v5;
}

@end