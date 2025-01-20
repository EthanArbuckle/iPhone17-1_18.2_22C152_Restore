@interface NSAffineTransform(NUImaging)
+ (id)nu_transformWithCGAffineTransform:()NUImaging;
- (double)nu_CGAffineTransform;
- (id)description;
@end

@implementation NSAffineTransform(NUImaging)

- (id)description
{
  long long v4 = 0u;
  long long v5 = 0u;
  long long v3 = 0u;
  objc_msgSend(a1, "nu_CGAffineTransform");
  v1 = objc_msgSend(NSString, "stringWithFormat:", @"[%g %g %g %g %g %g]", v3, v4, v5);

  return v1;
}

- (double)nu_CGAffineTransform
{
  [a1 transformStruct];
  *a2 = 0u;
  a2[1] = 0u;
  double result = 0.0;
  a2[2] = 0u;
  return result;
}

+ (id)nu_transformWithCGAffineTransform:()NUImaging
{
  long long v4 = [MEMORY[0x1E4F28AF0] transform];
  long long v5 = a3[1];
  v7[0] = *a3;
  v7[1] = v5;
  v7[2] = a3[2];
  [v4 setTransformStruct:v7];

  return v4;
}

@end