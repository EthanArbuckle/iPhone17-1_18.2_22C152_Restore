@interface NSValue(NSValueUIGeometryExtensions)
+ (id)valueWithCGPoint:()NSValueUIGeometryExtensions;
+ (id)valueWithCGRect:()NSValueUIGeometryExtensions;
+ (id)valueWithCGSize:()NSValueUIGeometryExtensions;
+ (id)valueWithCGVector:()NSValueUIGeometryExtensions;
+ (id)valueWithDirectionalEdgeInsets:()NSValueUIGeometryExtensions;
+ (id)valueWithUIEdgeInsets:()NSValueUIGeometryExtensions;
+ (id)valueWithUIOffset:()NSValueUIGeometryExtensions;
+ (uint64_t)valueWithCGAffineTransform:()NSValueUIGeometryExtensions;
+ (uint64_t)valueWithNSDirectionalEdgeInsets:()NSValueUIGeometryExtensions;
- (double)CGAffineTransformValue;
- (double)CGPointValue;
- (double)CGRectValue;
- (double)CGSizeValue;
- (double)CGVectorValue;
- (double)UIEdgeInsetsValue;
- (double)UIOffsetValue;
- (double)directionalEdgeInsetsValue;
@end

@implementation NSValue(NSValueUIGeometryExtensions)

+ (id)valueWithCGRect:()NSValueUIGeometryExtensions
{
  *(double *)v6 = a1;
  *(double *)&v6[1] = a2;
  *(double *)&v6[2] = a3;
  *(double *)&v6[3] = a4;
  v4 = [MEMORY[0x1E4F29238] valueWithBytes:v6 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  return v4;
}

+ (id)valueWithCGPoint:()NSValueUIGeometryExtensions
{
  *(double *)v4 = a1;
  *(double *)&v4[1] = a2;
  v2 = [MEMORY[0x1E4F29238] valueWithBytes:v4 objCType:"{CGPoint=dd}"];
  return v2;
}

- (double)CGPointValue
{
  v2[0] = 0;
  v2[1] = 0;
  _getNSValueBytes(a1, v2, 0x10uLL, (uint64_t)"CGPoint");
  return *(double *)v2;
}

- (double)CGRectValue
{
  memset(v2, 0, sizeof(v2));
  _getNSValueBytes(a1, v2, 0x20uLL, (uint64_t)"CGRect");
  return *(double *)v2;
}

- (double)CGSizeValue
{
  v2[0] = 0;
  v2[1] = 0;
  _getNSValueBytes(a1, v2, 0x10uLL, (uint64_t)"CGSize");
  return *(double *)v2;
}

- (double)UIEdgeInsetsValue
{
  memset(v2, 0, sizeof(v2));
  _getNSValueBytes(a1, v2, 0x20uLL, (uint64_t)"UIEdgeInsets");
  return *(double *)v2;
}

+ (id)valueWithCGSize:()NSValueUIGeometryExtensions
{
  *(double *)v4 = a1;
  *(double *)&v4[1] = a2;
  v2 = [MEMORY[0x1E4F29238] valueWithBytes:v4 objCType:"{CGSize=dd}"];
  return v2;
}

- (double)directionalEdgeInsetsValue
{
  memset(v2, 0, sizeof(v2));
  _getNSValueBytes(a1, v2, 0x20uLL, (uint64_t)"NSDirectionalEdgeInsets");
  return *(double *)v2;
}

- (double)UIOffsetValue
{
  v2[0] = 0;
  v2[1] = 0;
  _getNSValueBytes(a1, v2, 0x10uLL, (uint64_t)"UIOffset");
  return *(double *)v2;
}

+ (id)valueWithUIEdgeInsets:()NSValueUIGeometryExtensions
{
  *(double *)v6 = a1;
  *(double *)&v6[1] = a2;
  *(double *)&v6[2] = a3;
  *(double *)&v6[3] = a4;
  v4 = [MEMORY[0x1E4F29238] valueWithBytes:v6 objCType:"{UIEdgeInsets=dddd}"];
  return v4;
}

+ (id)valueWithDirectionalEdgeInsets:()NSValueUIGeometryExtensions
{
  *(double *)v6 = a1;
  *(double *)&v6[1] = a2;
  *(double *)&v6[2] = a3;
  *(double *)&v6[3] = a4;
  v4 = [MEMORY[0x1E4F29238] valueWithBytes:v6 objCType:"{NSDirectionalEdgeInsets=dddd}"];
  return v4;
}

- (double)CGAffineTransformValue
{
  long long v6 = 0u;
  long long v7 = 0u;
  long long v5 = 0u;
  _getNSValueBytes(a1, &v5, 0x30uLL, (uint64_t)"CGAffineTransform");
  long long v3 = v6;
  *a2 = v5;
  a2[1] = v3;
  double result = *(double *)&v7;
  a2[2] = v7;
  return result;
}

+ (uint64_t)valueWithCGAffineTransform:()NSValueUIGeometryExtensions
{
  return [MEMORY[0x1E4F29238] valueWithBytes:a3 objCType:"{CGAffineTransform=dddddd}"];
}

+ (id)valueWithCGVector:()NSValueUIGeometryExtensions
{
  *(double *)v4 = a1;
  *(double *)&v4[1] = a2;
  v2 = [MEMORY[0x1E4F29238] valueWithBytes:v4 objCType:"{CGVector=dd}"];
  return v2;
}

+ (uint64_t)valueWithNSDirectionalEdgeInsets:()NSValueUIGeometryExtensions
{
  return objc_msgSend(MEMORY[0x1E4F29238], "valueWithDirectionalEdgeInsets:");
}

+ (id)valueWithUIOffset:()NSValueUIGeometryExtensions
{
  *(double *)v4 = a1;
  *(double *)&v4[1] = a2;
  v2 = [MEMORY[0x1E4F29238] valueWithBytes:v4 objCType:"{UIOffset=dd}"];
  return v2;
}

- (double)CGVectorValue
{
  v2[0] = 0;
  v2[1] = 0;
  _getNSValueBytes(a1, v2, 0x10uLL, (uint64_t)"CGVector");
  return *(double *)v2;
}

@end