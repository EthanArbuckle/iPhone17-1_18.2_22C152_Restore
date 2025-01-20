@interface NSValue(PC_SIMD)
+ (uint64_t)PCValueWithSIMDFloat3:()PC_SIMD;
+ (uint64_t)PCValueWithSIMDFloat3x3:()PC_SIMD;
+ (uint64_t)PCValueWithSIMDFloat4x4:()PC_SIMD;
- (double)PCSIMDFloat3Value;
- (double)PCSIMDFloat4x4Value;
@end

@implementation NSValue(PC_SIMD)

- (double)PCSIMDFloat3Value
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  [a1 getValue:v2 size:12];
  return v2[0];
}

+ (uint64_t)PCValueWithSIMDFloat3x3:()PC_SIMD
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int32x2_t v3 = vzip2_s32(*(int32x2_t *)a2.i8, (int32x2_t)a3.n128_u64[0]);
  unsigned __int32 v6 = a3.n128_u32[2];
  a3.n128_u32[1] = a1.u32[1];
  v5[0] = vzip1_s32(*(int32x2_t *)a1.i8, *(int32x2_t *)a2.i8);
  v5[1] = a3.n128_u64[0];
  v5[2] = v3;
  v5[3] = vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(a1, a1, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(a2, a2, 8uLL));
  return [MEMORY[0x1E4F29238] valueWithBytes:v5 objCType:"[9f]"];
}

+ (uint64_t)PCValueWithSIMDFloat3:()PC_SIMD
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = a1.n128_u64[0];
  unsigned __int32 v3 = a1.n128_u32[2];
  return [MEMORY[0x1E4F29238] valueWithBytes:&v2 objCType:"[3f]"];
}

+ (uint64_t)PCValueWithSIMDFloat4x4:()PC_SIMD
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int32x2_t v10 = vzip1_s32(*(int32x2_t *)a1.i8, *(int32x2_t *)a2.i8);
  int8x8_t v4 = (int8x8_t)vextq_s8(a1, a1, 8uLL).u64[0];
  int8x8_t v5 = vext_s8(*(int8x8_t *)a4.i8, v4, 4uLL);
  LODWORD(v6) = vextq_s8(a4, a4, 8uLL).u32[0];
  unsigned __int32 v18 = a4.u32[3];
  a4.i32[1] = a1.i32[1];
  unint64_t v12 = a4.i64[0];
  int32x2_t v13 = vzip2_s32(*(int32x2_t *)a2.i8, *(int32x2_t *)a3.i8);
  unsigned __int32 v11 = a3.i32[0];
  int8x8_t v14 = v5;
  int32x2_t v7 = (int32x2_t)vextq_s8(a3, a3, 8uLL).u64[0];
  int32x2_t v8 = (int32x2_t)vextq_s8(a2, a2, 8uLL).u64[0];
  HIDWORD(v6) = v4.i32[1];
  int32x2_t v15 = vzip1_s32(v8, v7);
  uint64_t v16 = v6;
  int32x2_t v17 = vzip2_s32(v8, v7);
  return [MEMORY[0x1E4F29238] valueWithBytes:&v10 objCType:"[16f]"];
}

- (double)PCSIMDFloat4x4Value
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 getValue:&v2 size:64];
  return COERCE_DOUBLE(__PAIR64__(v3, v2));
}

@end