@interface CLCircularRegion(ThreeBars)
- (double)longitude;
- (id)searchPredicateWithLatitudeKey:()ThreeBars longitudeKey:;
- (void)boundingBox;
@end

@implementation CLCircularRegion(ThreeBars)

- (double)longitude
{
  [a1 center];
  return v1;
}

- (void)boundingBox
{
  [a1 center];
  long double v5 = v4 * 0.0174532925;
  long double v6 = cos(v5 + v5) * -559.82 + 111132.92;
  long double v7 = v6 + cos(v5 * 4.0) * 1.175;
  long double v8 = v7 + cos(v5 * 6.0) * -0.0023;
  double v9 = cos(v5);
  long double v10 = cos(v5 * 3.0) * -93.5 + v9 * 111412.84;
  long double v11 = v10 + cos(v5 * 5.0) * 0.118;
  [a1 radius];
  long double v13 = (v12 + v12) / v8;
  [a1 radius];
  long double v15 = (v14 + v14) / v11;
  [a1 center];
  long double v16 = v13 * 0.5;
  CLLocationDegrees v18 = v17 - v16;
  [a1 center];
  CLLocationDegrees v20 = v19 + v16;
  [a1 center];
  long double v21 = v15 * 0.5;
  CLLocationDegrees v23 = v22 - v15 * 0.5;
  [a1 center];
  CLLocationDegrees v25 = v24 + v21;
  *a2 = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  a2[1] = CLLocationCoordinate2DMake(v20, v25);
  a2[3] = CLLocationCoordinate2DMake(v18, v25);
  *a2 = CLLocationCoordinate2DMake(v20, v23);
  a2[2] = CLLocationCoordinate2DMake(v18, v23);
}

- (id)searchPredicateWithLatitudeKey:()ThreeBars longitudeKey:
{
  id v6 = a4;
  id v7 = a3;
  [a1 boundingBox];
  long double v8 = NSString;
  double v9 = [NSNumber numberWithDouble:0.0];
  long double v10 = [NSNumber numberWithDouble:0.0];
  long double v11 = [NSNumber numberWithDouble:0.0];
  double v12 = [NSNumber numberWithDouble:0.0];
  long double v13 = [v8 stringWithFormat:@"%@ >= %@ && %@ <= %@ && %@ >= %@ && %@ <= %@", v7, v9, v7, v10, v6, v11, v6, v12];

  double v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:v13];

  return v14;
}

@end