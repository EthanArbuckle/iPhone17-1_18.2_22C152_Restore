@interface NSValue(RGBResult)
+ (id)valueWithRGBResult:()RGBResult;
- (double)RGBResultValue;
@end

@implementation NSValue(RGBResult)

- (double)RGBResultValue
{
  memset(v2, 0, sizeof(v2));
  [a1 getValue:v2];
  return *(double *)v2;
}

+ (id)valueWithRGBResult:()RGBResult
{
  *(double *)v7 = a2;
  *(double *)&v7[1] = a3;
  *(double *)&v7[2] = a4;
  *(double *)&v7[3] = a5;
  v5 = [a1 valueWithBytes:v7 objCType:"{?=[4d]}"];
  return v5;
}

@end