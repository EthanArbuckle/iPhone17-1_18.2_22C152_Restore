@interface NSNumber
+ (id)crl_numberWithCGFloat:(double)a3;
- (BOOL)crl_isAlmostEqual:(id)a3;
- (BOOL)crl_isFloatingPointType;
@end

@implementation NSNumber

+ (id)crl_numberWithCGFloat:(double)a3
{
  return +[NSNumber numberWithDouble:a3];
}

- (BOOL)crl_isFloatingPointType
{
  return (*(unsigned char *)[(NSNumber *)self objCType] & 0xFD) == 100;
}

- (BOOL)crl_isAlmostEqual:(id)a3
{
  id v4 = a3;
  [(NSNumber *)self doubleValue];
  double v6 = v5;
  [v4 doubleValue];
  BOOL v8 = vabdd_f64(v6, v7) < 0.01 || v6 == v7;

  return v8;
}

@end