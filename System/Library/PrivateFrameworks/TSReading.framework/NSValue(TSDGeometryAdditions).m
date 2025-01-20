@interface NSValue(TSDGeometryAdditions)
+ (uint64_t)valueWithTSDEdgeInsets:()TSDGeometryAdditions;
- (double)TSDEdgeInsetsValue;
@end

@implementation NSValue(TSDGeometryAdditions)

+ (uint64_t)valueWithTSDEdgeInsets:()TSDGeometryAdditions
{
  *(double *)v6 = a2;
  *(double *)&v6[1] = a3;
  *(double *)&v6[2] = a4;
  *(double *)&v6[3] = a5;
  return [a1 valueWithBytes:v6 objCType:"{UIEdgeInsets=dddd}"];
}

- (double)TSDEdgeInsetsValue
{
  memset(v4, 0, sizeof(v4));
  int v2 = strncmp((const char *)[a1 objCType], "{UIEdgeInsets=dddd}", 0x13uLL);
  double result = 0.0;
  if (!v2)
  {
    objc_msgSend(a1, "getValue:", v4, 0.0, 0.0, 0.0, 0.0);
    return *(double *)v4;
  }
  return result;
}

@end