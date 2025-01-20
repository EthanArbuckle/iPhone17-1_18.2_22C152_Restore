@interface NSData(NSDataExtras)
+ (id)dataWithCGPoint:()NSDataExtras;
+ (id)dataWithCGRect:()NSDataExtras;
+ (id)dataWithCGSize:()NSDataExtras;
+ (id)dataWithPSN:()NSDataExtras;
+ (id)dataWithRange:()NSDataExtras;
- (double)CGPointValue;
- (double)CGRectValue;
- (double)CGSizeValue;
- (uint64_t)psn;
- (uint64_t)range;
@end

@implementation NSData(NSDataExtras)

+ (id)dataWithRange:()NSDataExtras
{
  v6[0] = a3;
  v6[1] = a4;
  v4 = [a1 dataWithBytes:v6 length:16];
  return v4;
}

- (uint64_t)range
{
  if ([a1 length] == 16) {
    return *(void *)[a1 bytes];
  }
  else {
    return 0;
  }
}

+ (id)dataWithPSN:()NSDataExtras
{
  uint64_t v5 = a3;
  v3 = [a1 dataWithBytes:&v5 length:8];
  return v3;
}

- (uint64_t)psn
{
  if ([a1 length] == 8) {
    return *(void *)[a1 bytes];
  }
  else {
    return 0;
  }
}

+ (id)dataWithCGRect:()NSDataExtras
{
  *(double *)v7 = a2;
  *(double *)&v7[1] = a3;
  *(double *)&v7[2] = a4;
  *(double *)&v7[3] = a5;
  uint64_t v5 = [a1 dataWithBytes:v7 length:32];
  return v5;
}

- (double)CGRectValue
{
  uint64_t v2 = [a1 length];
  double result = 0.0;
  if (v2 == 32) {
    return *(double *)[a1 bytes];
  }
  return result;
}

+ (id)dataWithCGSize:()NSDataExtras
{
  *(double *)uint64_t v5 = a2;
  *(double *)&v5[1] = a3;
  v3 = [a1 dataWithBytes:v5 length:16];
  return v3;
}

- (double)CGSizeValue
{
  uint64_t v2 = [a1 length];
  double result = 0.0;
  if (v2 == 16) {
    return *(double *)[a1 bytes];
  }
  return result;
}

+ (id)dataWithCGPoint:()NSDataExtras
{
  *(double *)uint64_t v5 = a2;
  *(double *)&v5[1] = a3;
  v3 = [a1 dataWithBytes:v5 length:16];
  return v3;
}

- (double)CGPointValue
{
  uint64_t v2 = [a1 length];
  double result = 0.0;
  if (v2 == 16) {
    return *(double *)[a1 bytes];
  }
  return result;
}

@end