@interface NSNumber
+ (NSNumber)numberWithCGFloat:(double)a3;
- (BOOL)isFloatingPointType;
- (BOOL)tsu_isAlmostEqual:(id)a3;
@end

@implementation NSNumber

+ (NSNumber)numberWithCGFloat:(double)a3
{
  return +[NSNumber numberWithDouble:a3];
}

- (BOOL)isFloatingPointType
{
  return (*(unsigned char *)[(NSNumber *)self objCType] & 0xFD) == 100;
}

- (BOOL)tsu_isAlmostEqual:(id)a3
{
  [(NSNumber *)self doubleValue];
  double v5 = v4;
  [a3 doubleValue];
  return vabdd_f64(v5, v6) < 0.01 || v5 == v6;
}

@end