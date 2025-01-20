@interface NSValue(PUDisplayVelocity)
+ (id)pu_valueWithDisplayVelocity:()PUDisplayVelocity;
- (double)pu_displayVelocityValue;
@end

@implementation NSValue(PUDisplayVelocity)

- (double)pu_displayVelocityValue
{
  memset(v4, 0, sizeof(v4));
  id v1 = a1;
  int v2 = strcmp((const char *)[v1 objCType], "{PUDisplayVelocity=dddd}");
  double result = 0.0;
  if (!v2)
  {
    objc_msgSend(v1, "getValue:", v4, 0.0, 0.0, 0.0, 0.0);
    return *(double *)v4;
  }
  return result;
}

+ (id)pu_valueWithDisplayVelocity:()PUDisplayVelocity
{
  *(double *)v6 = a1;
  *(double *)&v6[1] = a2;
  *(double *)&v6[2] = a3;
  *(double *)&v6[3] = a4;
  v4 = [MEMORY[0x1E4F29238] valueWithBytes:v6 objCType:"{PUDisplayVelocity=dddd}"];
  return v4;
}

@end