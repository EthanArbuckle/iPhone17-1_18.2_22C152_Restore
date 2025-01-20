@interface NSValue(SIMD)
+ (id)valueWithSIMDDouble2:()SIMD;
+ (id)valueWithSIMDDouble3:()SIMD;
+ (id)valueWithSIMDDouble3x3:()SIMD;
+ (id)valueWithSIMDDouble4:()SIMD;
+ (id)valueWithSIMDDouble4x4:()SIMD;
+ (id)valueWithSIMDDouble8:()SIMD;
+ (id)valueWithSIMDFloat16:()SIMD;
+ (id)valueWithSIMDFloat2:()SIMD;
+ (id)valueWithSIMDFloat3:()SIMD;
+ (id)valueWithSIMDFloat3x3:()SIMD;
+ (id)valueWithSIMDFloat4:()SIMD;
+ (id)valueWithSIMDFloat4x4:()SIMD;
+ (id)valueWithSIMDFloat8:()SIMD;
+ (id)valueWithSIMDQuatD:()SIMD;
- (__n128)SIMDDouble3Value;
- (__n128)SIMDDouble3x3Value;
- (__n128)SIMDDouble4x4Value;
- (__n128)SIMDDouble8Value;
- (__n128)SIMDFloat16Value;
- (double)SIMDDouble2Value;
- (double)SIMDDouble4Value;
- (double)SIMDFloat2Value;
- (double)SIMDFloat3Value;
- (double)SIMDFloat3x3Value;
- (double)SIMDFloat4Value;
- (double)SIMDFloat4x4Value;
- (double)SIMDFloat8Value;
- (double)SIMDQuatDValue;
- (double)SIMDQuatFValue;
@end

@implementation NSValue(SIMD)

+ (id)valueWithSIMDFloat2:()SIMD
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(double *)v3 = a1;
  v1 = [MEMORY[0x1E4F29238] valueWithBytes:v3 objCType:"[2f]"];

  return v1;
}

+ (id)valueWithSIMDFloat3:()SIMD
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a1.n128_u64[0];
  unsigned __int32 v4 = a1.n128_u32[2];
  v1 = [MEMORY[0x1E4F29238] valueWithBytes:&v3 objCType:"[3f]"];

  return v1;
}

+ (id)valueWithSIMDFloat4:()SIMD
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  __n128 v3 = a1;
  v1 = [MEMORY[0x1E4F29238] valueWithBytes:&v3 objCType:"[4f]"];

  return v1;
}

+ (id)valueWithSIMDFloat8:()SIMD
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  long long v3 = a3[1];
  v6[0] = *a3;
  v6[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F29238] valueWithBytes:v6 objCType:"[8f]"];

  return v4;
}

+ (id)valueWithSIMDFloat16:()SIMD
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  long long v4 = a3[2];
  long long v3 = a3[3];
  long long v5 = a3[1];
  v8[0] = *a3;
  v8[1] = v5;
  v8[2] = v4;
  v8[3] = v3;
  v6 = [MEMORY[0x1E4F29238] valueWithBytes:v8 objCType:"[16f]"];

  return v6;
}

+ (id)valueWithSIMDDouble2:()SIMD
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  __n128 v3 = a1;
  v1 = [MEMORY[0x1E4F29238] valueWithBytes:&v3 objCType:"[2d]"];

  return v1;
}

+ (id)valueWithSIMDDouble3:()SIMD
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *((void *)a3 + 2);
  long long v6 = *a3;
  uint64_t v7 = v3;
  uint64_t v4 = [MEMORY[0x1E4F29238] valueWithBytes:&v6 objCType:"[3d]"];

  return v4;
}

+ (id)valueWithSIMDDouble4:()SIMD
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  long long v3 = a3[1];
  v6[0] = *a3;
  v6[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F29238] valueWithBytes:v6 objCType:"[4d]"];

  return v4;
}

+ (id)valueWithSIMDDouble8:()SIMD
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  long long v4 = a3[2];
  long long v3 = a3[3];
  long long v5 = a3[1];
  v8[0] = *a3;
  v8[1] = v5;
  v8[2] = v4;
  v8[3] = v3;
  long long v6 = [MEMORY[0x1E4F29238] valueWithBytes:v8 objCType:"[8d]"];

  return v6;
}

+ (id)valueWithSIMDFloat3x3:()SIMD
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int32x2_t v3 = vzip2_s32(*(int32x2_t *)a2.i8, (int32x2_t)a3.n128_u64[0]);
  unsigned __int32 v7 = a3.n128_u32[2];
  a3.n128_u32[1] = a1.u32[1];
  v6[0] = vzip1_s32(*(int32x2_t *)a1.i8, *(int32x2_t *)a2.i8);
  v6[1] = a3.n128_u64[0];
  _OWORD v6[2] = v3;
  v6[3] = vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(a1, a1, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(a2, a2, 8uLL));
  long long v4 = [MEMORY[0x1E4F29238] valueWithBytes:v6 objCType:"[9f]"];

  return v4;
}

+ (id)valueWithSIMDDouble3x3:()SIMD
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int64x2_t v3 = a3[1];
  int64x2_t v5 = a3[2];
  int64x2_t v4 = a3[3];
  int64x2_t v6 = a3[4];
  int64x2_t v7 = vzip1q_s64(*a3, v5);
  int64x2_t v8 = vzip2q_s64(v5, v6);
  v6.i64[1] = a3->i64[1];
  v11[0] = v7;
  v11[1] = v6;
  v11[2] = v8;
  v11[3] = vzip1q_s64(v3, v4);
  uint64_t v12 = a3[5].i64[0];
  uint64_t v9 = [MEMORY[0x1E4F29238] valueWithBytes:v11 objCType:"[9d]"];

  return v9;
}

+ (id)valueWithSIMDFloat4x4:()SIMD
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int32x2_t v11 = vzip1_s32(*(int32x2_t *)a1.i8, *(int32x2_t *)a2.i8);
  int8x8_t v4 = (int8x8_t)vextq_s8(a1, a1, 8uLL).u64[0];
  int8x8_t v5 = vext_s8(*(int8x8_t *)a4.i8, v4, 4uLL);
  LODWORD(v6) = vextq_s8(a4, a4, 8uLL).u32[0];
  unsigned __int32 v19 = a4.u32[3];
  a4.i32[1] = a1.i32[1];
  unint64_t v13 = a4.i64[0];
  int32x2_t v14 = vzip2_s32(*(int32x2_t *)a2.i8, *(int32x2_t *)a3.i8);
  unsigned __int32 v12 = a3.i32[0];
  int8x8_t v15 = v5;
  int32x2_t v7 = (int32x2_t)vextq_s8(a3, a3, 8uLL).u64[0];
  int32x2_t v8 = (int32x2_t)vextq_s8(a2, a2, 8uLL).u64[0];
  HIDWORD(v6) = v4.i32[1];
  int32x2_t v16 = vzip1_s32(v8, v7);
  uint64_t v17 = v6;
  int32x2_t v18 = vzip2_s32(v8, v7);
  uint64_t v9 = [MEMORY[0x1E4F29238] valueWithBytes:&v11 objCType:"[16f]"];

  return v9;
}

+ (id)valueWithSIMDDouble4x4:()SIMD
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int64x2_t v4 = *(int64x2_t *)a3;
  int64x2_t v3 = *(int64x2_t *)(a3 + 16);
  int64x2_t v6 = *(int64x2_t *)(a3 + 32);
  int64x2_t v5 = *(int64x2_t *)(a3 + 48);
  int64x2_t v8 = *(int64x2_t *)(a3 + 64);
  int64x2_t v7 = *(int64x2_t *)(a3 + 80);
  int8x16_t v10 = *(int8x16_t *)(a3 + 96);
  int64x2_t v9 = *(int64x2_t *)(a3 + 112);
  int64x2_t v14 = vzip1q_s64(*(int64x2_t *)a3, v6);
  uint64_t v15 = v8.i64[0];
  int8x16_t v11 = vextq_s8(v10, (int8x16_t)v3, 8uLL);
  v10.i64[1] = v4.i64[1];
  int8x16_t v16 = v10;
  int64x2_t v17 = vzip2q_s64(v6, v8);
  int8x16_t v18 = v11;
  int64x2_t v19 = vzip1q_s64(v5, v7);
  uint64_t v20 = v9.i64[0];
  int64x2_t v21 = vzip2q_s64(v3, v5);
  int64x2_t v22 = vzip2q_s64(v7, v9);
  unsigned __int32 v12 = [MEMORY[0x1E4F29238] valueWithBytes:&v14 objCType:"[16d]"];

  return v12;
}

+ (id)valueWithSIMDQuatD:()SIMD
{
  long long v3 = a3[1];
  v6[0] = *a3;
  v6[1] = v3;
  int64x2_t v4 = [a1 valueWithSIMDDouble4:v6];

  return v4;
}

- (double)SIMDFloat2Value
{
  v2[1] = *MEMORY[0x1E4F143B8];
  [a1 getValue:v2 size:8];
  return *(double *)v2;
}

- (double)SIMDFloat3Value
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  [a1 getValue:v2 size:12];
  return v2[0];
}

- (double)SIMDFloat4Value
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  [a1 getValue:v2 size:16];
  return v2[0];
}

- (double)SIMDFloat8Value
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 getValue:v5 size:32];
  double result = *(double *)v5;
  long long v4 = v5[1];
  *a2 = v5[0];
  a2[1] = v4;
  return result;
}

- (__n128)SIMDFloat16Value
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [a1 getValue:v6 size:64];
  __n128 result = (__n128)v6[0];
  long long v4 = v6[1];
  long long v5 = v6[3];
  *(_OWORD *)(a2 + 32) = v6[2];
  *(_OWORD *)(a2 + 48) = v5;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v4;
  return result;
}

- (double)SIMDDouble2Value
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  [a1 getValue:v2 size:16];
  return v2[0];
}

- (__n128)SIMDDouble3Value
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [a1 getValue:&v5 size:24];
  __n128 result = v5;
  v4.n128_u64[0] = v6;
  *a2 = v5;
  a2[1] = v4;
  return result;
}

- (double)SIMDDouble4Value
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 getValue:v5 size:32];
  double result = *(double *)v5;
  long long v4 = v5[1];
  *a2 = v5[0];
  a2[1] = v4;
  return result;
}

- (__n128)SIMDDouble8Value
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [a1 getValue:v6 size:64];
  __n128 result = (__n128)v6[0];
  long long v4 = v6[1];
  long long v5 = v6[3];
  *(_OWORD *)(a2 + 32) = v6[2];
  *(_OWORD *)(a2 + 48) = v5;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v4;
  return result;
}

- (double)SIMDFloat3x3Value
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  [a1 getValue:v2 size:36];
  return COERCE_DOUBLE(__PAIR64__(v2[3], v2[0]));
}

- (__n128)SIMDDouble3x3Value
{
  v9[9] = *MEMORY[0x1E4F143B8];
  [a1 getValue:v9 size:72];
  result.n128_u64[0] = v9[0];
  *(void *)&long long v3 = v9[1];
  *(void *)&long long v4 = v9[2];
  *(void *)&long long v5 = v9[6];
  *(void *)&long long v6 = v9[7];
  result.n128_u64[1] = v9[3];
  *((void *)&v3 + 1) = v9[4];
  *(void *)&long long v8 = v9[8];
  *((void *)&v4 + 1) = v9[5];
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  *(_OWORD *)(a2 + 32) = v3;
  *(_OWORD *)(a2 + 48) = v6;
  *(_OWORD *)(a2 + 64) = v4;
  *(_OWORD *)(a2 + 80) = v8;
  return result;
}

- (double)SIMDFloat4x4Value
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 getValue:&v2 size:64];
  return COERCE_DOUBLE(__PAIR64__(v3, v2));
}

- (__n128)SIMDDouble4x4Value
{
  v11[16] = *MEMORY[0x1E4F143B8];
  [a1 getValue:v11 size:128];
  result.n128_u64[0] = v11[0];
  *(void *)&long long v3 = v11[1];
  *(void *)&long long v4 = v11[2];
  *(void *)&long long v5 = v11[3];
  *(void *)&long long v6 = v11[8];
  *(void *)&long long v7 = v11[9];
  *(void *)&long long v8 = v11[10];
  *(void *)&long long v9 = v11[11];
  result.n128_u64[1] = v11[4];
  *((void *)&v6 + 1) = v11[12];
  *((void *)&v3 + 1) = v11[5];
  *((void *)&v7 + 1) = v11[13];
  *((void *)&v4 + 1) = v11[6];
  *((void *)&v8 + 1) = v11[14];
  *((void *)&v5 + 1) = v11[7];
  *((void *)&v9 + 1) = v11[15];
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v6;
  *(_OWORD *)(a2 + 32) = v3;
  *(_OWORD *)(a2 + 48) = v7;
  *(_OWORD *)(a2 + 64) = v4;
  *(_OWORD *)(a2 + 80) = v8;
  *(_OWORD *)(a2 + 96) = v5;
  *(_OWORD *)(a2 + 112) = v9;
  return result;
}

- (double)SIMDQuatFValue
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  [a1 getValue:v2 size:16];
  return v2[0];
}

- (double)SIMDQuatDValue
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 getValue:v5 size:32];
  double result = *(double *)v5;
  long long v4 = v5[1];
  *a2 = v5[0];
  a2[1] = v4;
  return result;
}

@end