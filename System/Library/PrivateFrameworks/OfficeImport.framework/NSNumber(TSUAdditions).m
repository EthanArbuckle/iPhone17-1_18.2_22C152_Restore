@interface NSNumber(TSUAdditions)
+ (uint64_t)numberWithCGFloat:()TSUAdditions;
- (BOOL)isFloatingPointType;
- (BOOL)tsu_isAlmostEqual:()TSUAdditions;
@end

@implementation NSNumber(TSUAdditions)

+ (uint64_t)numberWithCGFloat:()TSUAdditions
{
  return objc_msgSend(NSNumber, "numberWithDouble:");
}

- (BOOL)isFloatingPointType
{
  return (*(unsigned char *)[a1 objCType] & 0xFD) == 100;
}

- (BOOL)tsu_isAlmostEqual:()TSUAdditions
{
  [a1 doubleValue];
  double v5 = v4;
  [a3 doubleValue];
  return vabdd_f64(v5, v6) < 0.01;
}

@end