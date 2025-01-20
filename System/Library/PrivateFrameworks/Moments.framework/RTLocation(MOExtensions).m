@interface RTLocation(MOExtensions)
+ (double)distanceFromlat1:()MOExtensions lon1:tolat2:lon2:;
+ (id)locationFromDictionary:()MOExtensions;
- (id)dictionary;
- (uint64_t)distanceFromLocation:()MOExtensions;
@end

@implementation RTLocation(MOExtensions)

+ (double)distanceFromlat1:()MOExtensions lon1:tolat2:lon2:
{
  if (a2 < 0.0) {
    a2 = a2 + 360.0;
  }
  if (a4 < 0.0) {
    a4 = a4 + 360.0;
  }
  double v4 = a4 - a2;
  if (v4 <= 180.0)
  {
    if (v4 < -180.0) {
      double v4 = v4 + 360.0;
    }
  }
  else
  {
    double v4 = v4 + -360.0;
  }
  double v5 = (a3 - a1) * 0.0174532925;
  double v6 = v4 * 0.0174532925;
  __double2 v7 = __sincos_stret((a1 + a3) * 0.0174532925 * 0.5);
  double v8 = sqrt(v7.__sinval * -0.00669437999 * v7.__sinval + 1.0);
  return sqrt(v7.__cosval * (6378137.0 / v8) * v6 * (v7.__cosval * (6378137.0 / v8) * v6)+ v5 * (6335439.33 / (v8 * (v8 * v8))) * (v5 * (6335439.33 / (v8 * (v8 * v8)))));
}

- (uint64_t)distanceFromLocation:()MOExtensions
{
  double v4 = (void *)MEMORY[0x1E4F5CE00];
  id v5 = a3;
  [a1 latitude];
  double v7 = v6;
  [a1 longitude];
  double v9 = v8;
  [v5 latitude];
  double v11 = v10;
  [v5 longitude];
  double v13 = v12;

  return [v4 distanceFromlat1:v7 lon1:v9 tolat2:v11 lon2:v13];
}

- (id)dictionary
{
  v2 = objc_opt_new();
  v3 = NSNumber;
  [a1 latitude];
  double v4 = objc_msgSend(v3, "numberWithDouble:");
  [v2 setObject:v4 forKeyedSubscript:@"locationLatitude"];

  id v5 = NSNumber;
  [a1 longitude];
  double v6 = objc_msgSend(v5, "numberWithDouble:");
  [v2 setObject:v6 forKeyedSubscript:@"locationLongitude"];

  double v7 = NSNumber;
  [a1 horizontalUncertainty];
  double v8 = objc_msgSend(v7, "numberWithDouble:");
  [v2 setObject:v8 forKeyedSubscript:@"locationHorizontalUncertainty"];

  double v9 = NSNumber;
  double v10 = [a1 date];
  [v10 timeIntervalSinceReferenceDate];
  double v11 = objc_msgSend(v9, "numberWithDouble:");
  [v2 setObject:v11 forKeyedSubscript:@"locationDate"];

  double v12 = (void *)[v2 copy];
  return v12;
}

+ (id)locationFromDictionary:()MOExtensions
{
  id v3 = a3;
  double v4 = [v3 objectForKeyedSubscript:@"locationLatitude"];
  [v4 doubleValue];
  double v6 = v5;

  double v7 = [v3 objectForKeyedSubscript:@"locationLongitude"];
  [v7 doubleValue];
  double v9 = v8;

  double v10 = [v3 objectForKeyedSubscript:@"locationHorizontalUncertainty"];
  [v10 doubleValue];
  double v12 = v11;

  double v13 = [v3 objectForKeyedSubscript:@"locationDate"];

  [v13 doubleValue];
  double v15 = v14;

  if (v15 <= 0.0)
  {
    v16 = 0;
  }
  else
  {
    v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v15];
  }
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithLatitude:v16 longitude:v6 horizontalUncertainty:v9 date:v12];

  return v17;
}

@end