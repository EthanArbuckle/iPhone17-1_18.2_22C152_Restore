@interface NSValue(UISize3D)
+ (id)valueWithUISize3D:()UISize3D;
- (double)UISize3DValue;
@end

@implementation NSValue(UISize3D)

+ (id)valueWithUISize3D:()UISize3D
{
  *(double *)v6 = a2;
  *(double *)&v6[1] = a3;
  *(double *)&v6[2] = a4;
  v4 = [a1 valueWithBytes:v6 objCType:"{?=ddd}"];
  return v4;
}

- (double)UISize3DValue
{
  memset(v2, 0, sizeof(v2));
  [a1 getValue:v2 size:24];
  return *(double *)v2;
}

@end