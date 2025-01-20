@interface NSMeasurement(VGExtras)
- (BOOL)isEqualToMeasurement:()VGExtras;
- (BOOL)isGreaterThanMeasurement:()VGExtras;
- (BOOL)isLessThanMeasurement:()VGExtras;
- (uint64_t)compare:()VGExtras;
- (uint64_t)isGreaterThanOrEqualToMeasurement:()VGExtras;
- (uint64_t)isLessThanOrEqualToMeasurement:()VGExtras;
@end

@implementation NSMeasurement(VGExtras)

- (BOOL)isGreaterThanMeasurement:()VGExtras
{
  return objc_msgSend(a1, "compare:") == 1;
}

- (BOOL)isLessThanMeasurement:()VGExtras
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (BOOL)isEqualToMeasurement:()VGExtras
{
  return objc_msgSend(a1, "compare:") == 0;
}

- (uint64_t)isGreaterThanOrEqualToMeasurement:()VGExtras
{
  return objc_msgSend(a1, "isLessThanMeasurement:") ^ 1;
}

- (uint64_t)isLessThanOrEqualToMeasurement:()VGExtras
{
  return objc_msgSend(a1, "isGreaterThanMeasurement:") ^ 1;
}

- (uint64_t)compare:()VGExtras
{
  id v4 = a3;
  v5 = [v4 unit];
  v6 = [a1 measurementByConvertingToUnit:v5];
  [v6 doubleValue];
  double v8 = v7;

  [v4 doubleValue];
  double v10 = v9;

  v11 = [NSNumber numberWithDouble:v8];
  v12 = [NSNumber numberWithDouble:v10];
  uint64_t v13 = [v11 compare:v12];

  return v13;
}

@end