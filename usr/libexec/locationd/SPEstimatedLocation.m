@interface SPEstimatedLocation
- (BOOL)isEqualToEstimatedLocation:(id)a3;
@end

@implementation SPEstimatedLocation

- (BOOL)isEqualToEstimatedLocation:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  [(SPEstimatedLocation *)self latitude];
  double v6 = v5;
  [a3 latitude];
  double v8 = v6 - v7;
  if (v8 < 0.0) {
    double v8 = -v8;
  }
  if (v8 >= 2.22044605e-16) {
    return 0;
  }
  [(SPEstimatedLocation *)self longitude];
  double v10 = v9;
  [a3 longitude];
  double v12 = v10 - v11;
  if (v12 < 0.0) {
    double v12 = -v12;
  }
  if (v12 >= 2.22044605e-16) {
    return 0;
  }
  [(SPEstimatedLocation *)self altitude];
  double v14 = v13;
  [a3 altitude];
  double v16 = v14 - v15;
  if (v16 < 0.0) {
    double v16 = -v16;
  }
  return v16 < 2.22044605e-16;
}

@end