@interface NSString(OZAdditions)
+ (uint64_t)oz_stringWithMatrixFloat3x3:()OZAdditions precision:;
+ (uint64_t)oz_stringWithMatrixFloat4x4:()OZAdditions precision:;
@end

@implementation NSString(OZAdditions)

+ (uint64_t)oz_stringWithMatrixFloat4x4:()OZAdditions precision:
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%.*f, %.*f, %.*f, %.*f\n%.*f, %.*f, %.*f, %.*f\n%.*f, %.*f, %.*f, %.*f\n%.*f, %.*f, %.*f, %.*f", a7, a1.n128_f32[0], a7, a1.n128_f32[1], a7, a1.n128_f32[2], a7, a1.n128_f32[3], a7, a2.n128_f32[0], a7, a2.n128_f32[1], a7, a2.n128_f32[2], a7, a2.n128_f32[3],
           a7,
           a3.n128_f32[0],
           a7,
           a3.n128_f32[1],
           a7,
           a3.n128_f32[2],
           a7,
           a3.n128_f32[3],
           a7,
           a4.n128_f32[0],
           a7,
           a4.n128_f32[1],
           a7,
           a4.n128_f32[2],
           a7,
           a4.n128_f32[3]);
}

+ (uint64_t)oz_stringWithMatrixFloat3x3:()OZAdditions precision:
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%.*f, %.*f, %.*f\n%.*f, %.*f, %.*f\n%.*f, %.*f, %.*f", a6, a1.n128_f32[0], a6, a1.n128_f32[1], a6, a1.n128_f32[2], a6, a2.n128_f32[0], a6, a2.n128_f32[1], a6, a2.n128_f32[2], a6, a3.n128_f32[0], a6, a3.n128_f32[1],
           a6,
           a3.n128_f32[2]);
}

@end