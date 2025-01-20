@interface NSValue(NSValueNUGeometryExtensions)
+ (id)nu_valueWithCGPoint:()NSValueNUGeometryExtensions;
+ (id)nu_valueWithCGRect:()NSValueNUGeometryExtensions;
+ (id)nu_valueWithPixelPoint:()NSValueNUGeometryExtensions;
+ (uint64_t)nu_valueWithPixelRect:()NSValueNUGeometryExtensions;
- (double)nu_CGPoint;
- (double)nu_CGRect;
- (uint64_t)nu_pixelPoint;
- (uint64_t)nu_pixelRect;
@end

@implementation NSValue(NSValueNUGeometryExtensions)

- (double)nu_CGPoint
{
  v2[0] = 0;
  v2[1] = 0;
  [a1 getValue:v2 size:16];
  return *(double *)v2;
}

- (double)nu_CGRect
{
  memset(v2, 0, sizeof(v2));
  [a1 getValue:v2 size:32];
  return *(double *)v2;
}

- (uint64_t)nu_pixelPoint
{
  v2[0] = 0;
  v2[1] = 0;
  [a1 getValue:v2 size:16];
  return v2[0];
}

- (uint64_t)nu_pixelRect
{
  *x8_0 = 0u;
  x8_0[1] = 0u;
  return [a1 getValue:x8_0 size:32];
}

+ (id)nu_valueWithCGPoint:()NSValueNUGeometryExtensions
{
  *(double *)v4 = a1;
  *(double *)&v4[1] = a2;
  v2 = [MEMORY[0x1E4F29238] valueWithBytes:v4 objCType:"{CGPoint=dd}"];

  return v2;
}

+ (id)nu_valueWithPixelPoint:()NSValueNUGeometryExtensions
{
  v6[0] = a3;
  v6[1] = a4;
  v4 = [MEMORY[0x1E4F29238] valueWithBytes:v6 objCType:"{?=qq}"];

  return v4;
}

+ (id)nu_valueWithCGRect:()NSValueNUGeometryExtensions
{
  *(double *)v6 = a1;
  *(double *)&v6[1] = a2;
  *(double *)&void v6[2] = a3;
  *(double *)&v6[3] = a4;
  v4 = [MEMORY[0x1E4F29238] valueWithBytes:v6 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];

  return v4;
}

+ (uint64_t)nu_valueWithPixelRect:()NSValueNUGeometryExtensions
{
  return [MEMORY[0x1E4F29238] valueWithBytes:a3 objCType:"{?={?=qq}{?=qq}}"];
}

@end