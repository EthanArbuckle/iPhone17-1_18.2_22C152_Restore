@interface NSValue(OZAdditions)
+ (uint64_t)oz_valueWithCGSize:()OZAdditions;
+ (uint64_t)oz_valueWithSIMDDouble2:()OZAdditions;
+ (uint64_t)oz_valueWithSIMDDouble3:()OZAdditions;
+ (uint64_t)oz_valueWithSIMDDouble3x3:()OZAdditions;
+ (uint64_t)oz_valueWithSIMDDouble4x4:()OZAdditions;
+ (uint64_t)oz_valueWithSIMDFloat2:()OZAdditions;
+ (uint64_t)oz_valueWithSIMDFloat3:()OZAdditions;
+ (uint64_t)oz_valueWithSIMDFloat3x3:()OZAdditions;
+ (uint64_t)oz_valueWithSIMDFloat4x4:()OZAdditions;
- (__n128)oz_SIMDDouble3Value;
- (__n128)oz_SIMDDouble3x3Value;
- (__n128)oz_SIMDDouble4x4Value;
- (__n64)oz_SIMDFloat3x3Value;
- (double)oz_CGSizeValue;
- (double)oz_SIMDDouble2Value;
- (double)oz_SIMDFloat2Value;
- (double)oz_SIMDFloat3Value;
- (double)oz_SIMDFloat4x4Value;
@end

@implementation NSValue(OZAdditions)

- (double)oz_CGSizeValue
{
  v2[2] = *MEMORY[0x1E4F143B8];
  [a1 getValue:v2 size:16];
  return *(double *)v2;
}

+ (uint64_t)oz_valueWithCGSize:()OZAdditions
{
  v3[2] = *MEMORY[0x1E4F143B8];
  *(double *)v3 = a1;
  *(double *)&v3[1] = a2;
  return [MEMORY[0x1E4F29238] valueWithBytes:v3 objCType:"[2d]"];
}

- (double)oz_SIMDFloat2Value
{
  v2[1] = *MEMORY[0x1E4F143B8];
  [a1 getValue:v2 size:8];
  return *(double *)v2;
}

- (double)oz_SIMDDouble2Value
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  [a1 getValue:v2 size:16];
  return v2[0];
}

+ (uint64_t)oz_valueWithSIMDFloat2:()OZAdditions
{
  v2[1] = *MEMORY[0x1E4F143B8];
  *(double *)v2 = a1;
  return [MEMORY[0x1E4F29238] valueWithBytes:v2 objCType:"[2f]"];
}

+ (uint64_t)oz_valueWithSIMDDouble2:()OZAdditions
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  __n128 v2 = a1;
  return [MEMORY[0x1E4F29238] valueWithBytes:&v2 objCType:"[2d]"];
}

- (double)oz_SIMDFloat3Value
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  [a1 getValue:v2 size:12];
  return v2[0];
}

- (__n128)oz_SIMDDouble3Value
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [a1 getValue:&v5 size:24];
  __n128 result = v5;
  v4.n128_u64[0] = v6;
  *a2 = v5;
  a2[1] = v4;
  return result;
}

+ (uint64_t)oz_valueWithSIMDFloat3:()OZAdditions
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = a1.n128_u64[0];
  unsigned __int32 v3 = a1.n128_u32[2];
  return [MEMORY[0x1E4F29238] valueWithBytes:&v2 objCType:"[3f]"];
}

+ (uint64_t)oz_valueWithSIMDDouble3:()OZAdditions
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *((void *)a3 + 2);
  long long v5 = *a3;
  uint64_t v6 = v3;
  return [MEMORY[0x1E4F29238] valueWithBytes:&v5 objCType:"[3d]"];
}

- (__n64)oz_SIMDFloat3x3Value
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  [a1 getValue:v2 size:36];
  result.n64_u32[0] = v2[0];
  result.n64_u32[1] = *(_DWORD *)((unint64_t)v2 | 0xC);
  return result;
}

- (__n128)oz_SIMDDouble3x3Value
{
  v9[9] = *MEMORY[0x1E4F143B8];
  [a1 getValue:v9 size:72];
  result.n128_u64[0] = v9[0];
  *(void *)&long long v3 = v9[1];
  result.n128_u64[1] = v9[3];
  *((void *)&v3 + 1) = v9[4];
  *(void *)&long long v5 = v9[6];
  *(void *)&long long v6 = v9[7];
  *(void *)&long long v7 = v9[2];
  *(void *)&long long v8 = v9[8];
  *((void *)&v7 + 1) = v9[5];
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  *(_OWORD *)(a2 + 32) = v3;
  *(_OWORD *)(a2 + 48) = v6;
  *(_OWORD *)(a2 + 64) = v7;
  *(_OWORD *)(a2 + 80) = v8;
  return result;
}

+ (uint64_t)oz_valueWithSIMDFloat3x3:()OZAdditions
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

+ (uint64_t)oz_valueWithSIMDDouble3x3:()OZAdditions
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int64x2_t v3 = a3[1];
  int64x2_t v4 = a3[2];
  int64x2_t v5 = a3[3];
  int64x2_t v6 = vzip1q_s64(*a3, v4);
  int64x2_t v7 = a3[4];
  int64x2_t v8 = vzip2q_s64(v4, v7);
  v7.i64[1] = a3->i64[1];
  v10[0] = v6;
  v10[1] = v7;
  v10[2] = v8;
  v10[3] = vzip1q_s64(v3, v5);
  uint64_t v11 = a3[5].i64[0];
  return [MEMORY[0x1E4F29238] valueWithBytes:v10 objCType:"[9d]"];
}

- (double)oz_SIMDFloat4x4Value
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 getValue:&v2 size:64];
  return COERCE_DOUBLE(__PAIR64__(v3, v2));
}

- (__n128)oz_SIMDDouble4x4Value
{
  v11[16] = *MEMORY[0x1E4F143B8];
  [a1 getValue:v11 size:128];
  result.n128_u64[0] = v11[0];
  *(void *)&long long v3 = v11[1];
  result.n128_u64[1] = v11[4];
  *(void *)&long long v5 = v11[8];
  *(void *)&long long v6 = v11[9];
  *((void *)&v5 + 1) = v11[12];
  *((void *)&v3 + 1) = v11[5];
  *((void *)&v6 + 1) = v11[13];
  *(void *)&long long v7 = v11[2];
  *(void *)&long long v8 = v11[3];
  *((void *)&v7 + 1) = v11[6];
  *(void *)&long long v9 = v11[10];
  *(void *)&long long v10 = v11[11];
  *((void *)&v9 + 1) = v11[14];
  *((void *)&v8 + 1) = v11[7];
  *((void *)&v10 + 1) = v11[15];
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  *(_OWORD *)(a2 + 32) = v3;
  *(_OWORD *)(a2 + 48) = v6;
  *(_OWORD *)(a2 + 64) = v7;
  *(_OWORD *)(a2 + 80) = v9;
  *(_OWORD *)(a2 + 96) = v8;
  *(_OWORD *)(a2 + 112) = v10;
  return result;
}

+ (uint64_t)oz_valueWithSIMDFloat4x4:()OZAdditions
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

+ (uint64_t)oz_valueWithSIMDDouble4x4:()OZAdditions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int8x16_t v4 = *(int8x16_t *)a3;
  int8x16_t v3 = *((int8x16_t *)a3 + 1);
  uint64_t v13 = *(void *)a3;
  int64x2_t v6 = *((int64x2_t *)a3 + 2);
  int64x2_t v5 = *((int64x2_t *)a3 + 3);
  int64x2_t v7 = *((int64x2_t *)a3 + 4);
  int64x2_t v8 = *((int64x2_t *)a3 + 5);
  int64x2_t v14 = vzip1q_s64(v6, v7);
  int8x16_t v10 = *((int8x16_t *)a3 + 6);
  int64x2_t v9 = *((int64x2_t *)a3 + 7);
  int8x16_t v11 = vextq_s8(v10, v3, 8uLL);
  v10.i64[1] = v4.i64[1];
  int8x16_t v15 = v10;
  int64x2_t v16 = vzip2q_s64(v6, v7);
  int8x16_t v17 = v11;
  int64x2_t v18 = vzip1q_s64(v5, v8);
  uint64_t v19 = v9.i64[0];
  int64x2_t v20 = vzip2q_s64((int64x2_t)v3, v5);
  int64x2_t v21 = vzip2q_s64(v8, v9);
  return [MEMORY[0x1E4F29238] valueWithBytes:&v13 objCType:"[16d]"];
}

@end