@interface NSArray(SIMD)
+ (id)arrayWithSIMDDouble2:()SIMD;
+ (id)arrayWithSIMDDouble3:()SIMD;
+ (id)arrayWithSIMDDouble3x3:()SIMD;
+ (id)arrayWithSIMDDouble4:()SIMD;
+ (id)arrayWithSIMDDouble4x4:()SIMD;
+ (id)arrayWithSIMDDouble8:()SIMD;
+ (id)arrayWithSIMDFloat16:()SIMD;
+ (id)arrayWithSIMDFloat2:()SIMD;
+ (id)arrayWithSIMDFloat3:()SIMD;
+ (id)arrayWithSIMDFloat3x3:()SIMD;
+ (id)arrayWithSIMDFloat4:()SIMD;
+ (id)arrayWithSIMDFloat4x4:()SIMD;
+ (id)arrayWithSIMDFloat8:()SIMD;
+ (id)arrayWithSIMDQuatD:()SIMD;
- (__n128)SIMDDouble2;
- (__n128)SIMDDouble3;
- (__n128)SIMDFloat2;
- (__n128)SIMDFloat3;
- (__n128)SIMDFloat3x3;
- (__n128)SIMDFloat4;
- (__n128)SIMDFloat4x4;
- (double)SIMDQuatD;
- (void)SIMDDouble3x3;
- (void)SIMDDouble4;
- (void)SIMDDouble4x4;
- (void)SIMDDouble8;
- (void)SIMDFloat16;
- (void)SIMDFloat8;
@end

@implementation NSArray(SIMD)

+ (id)arrayWithSIMDFloat2:()SIMD
{
  int v6 = HIDWORD(a1);
  v7[2] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend(NSNumber, "numberWithFloat:");
  v7[0] = v1;
  HIDWORD(v2) = v6;
  LODWORD(v2) = v6;
  v3 = [NSNumber numberWithFloat:v2];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v4;
}

+ (id)arrayWithSIMDFloat3:()SIMD
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend(NSNumber, "numberWithFloat:");
  v8[0] = v1;
  HIDWORD(v2) = a1.n128_u32[1];
  LODWORD(v2) = a1.n128_u32[1];
  v3 = [NSNumber numberWithFloat:v2];
  v8[1] = v3;
  v4 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v8[2] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  return v5;
}

+ (id)arrayWithSIMDFloat4:()SIMD
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend(NSNumber, "numberWithFloat:");
  v9[0] = v1;
  HIDWORD(v2) = a1.n128_u32[1];
  LODWORD(v2) = a1.n128_u32[1];
  v3 = [NSNumber numberWithFloat:v2];
  v9[1] = v3;
  v4 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v9[2] = v4;
  v5 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));
  v9[3] = v5;
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];

  return v6;
}

+ (id)arrayWithSIMDFloat8:()SIMD
{
  v17[8] = *MEMORY[0x1E4F143B8];
  long long v15 = *a3;
  long long v16 = a3[1];
  v3 = objc_msgSend(NSNumber, "numberWithFloat:");
  v17[0] = v3;
  HIDWORD(v4) = DWORD1(v15);
  LODWORD(v4) = DWORD1(v15);
  v5 = [NSNumber numberWithFloat:v4];
  v17[1] = v5;
  int v6 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v15), DWORD2(v15))));
  v17[2] = v6;
  v7 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v15), HIDWORD(v15))));
  v17[3] = v7;
  v8 = [NSNumber numberWithFloat:*(double *)&v16];
  v17[4] = v8;
  HIDWORD(v9) = DWORD1(v16);
  LODWORD(v9) = DWORD1(v16);
  v10 = [NSNumber numberWithFloat:v9];
  v17[5] = v10;
  v11 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v16), DWORD2(v16))));
  v17[6] = v11;
  v12 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v16), HIDWORD(v16))));
  v17[7] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:8];

  return v13;
}

+ (id)arrayWithSIMDFloat16:()SIMD
{
  v28[16] = *MEMORY[0x1E4F143B8];
  long long v26 = a3[2];
  long long v27 = a3[3];
  long long v24 = *a3;
  long long v25 = a3[1];
  v23 = objc_msgSend(NSNumber, "numberWithFloat:");
  v28[0] = v23;
  HIDWORD(v3) = DWORD1(v24);
  LODWORD(v3) = DWORD1(v24);
  v22 = [NSNumber numberWithFloat:v3];
  v28[1] = v22;
  v21 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v24), DWORD2(v24))));
  v28[2] = v21;
  *(void *)&long long v24 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v24), HIDWORD(v24))));
  v28[3] = v24;
  v20 = [NSNumber numberWithFloat:*(double *)&v25];
  v28[4] = v20;
  HIDWORD(v4) = DWORD1(v25);
  LODWORD(v4) = DWORD1(v25);
  v19 = [NSNumber numberWithFloat:v4];
  v28[5] = v19;
  v18 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v25), DWORD2(v25))));
  v28[6] = v18;
  v5 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v25), HIDWORD(v25))));
  v28[7] = v5;
  int v6 = [NSNumber numberWithFloat:*(double *)&v26];
  v28[8] = v6;
  HIDWORD(v7) = DWORD1(v26);
  LODWORD(v7) = DWORD1(v26);
  v8 = [NSNumber numberWithFloat:v7];
  v28[9] = v8;
  double v9 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v26), DWORD2(v26))));
  v28[10] = v9;
  v10 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v26), HIDWORD(v26))));
  v28[11] = v10;
  v11 = [NSNumber numberWithFloat:*(double *)&v27];
  v28[12] = v11;
  HIDWORD(v12) = DWORD1(v27);
  LODWORD(v12) = DWORD1(v27);
  v13 = [NSNumber numberWithFloat:v12];
  v28[13] = v13;
  v14 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v27), DWORD2(v27))));
  v28[14] = v14;
  long long v15 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v27), HIDWORD(v27))));
  v28[15] = v15;
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:16];

  return v16;
}

+ (id)arrayWithSIMDDouble2:()SIMD
{
  double v5 = a1.n128_f64[1];
  v6[2] = *MEMORY[0x1E4F143B8];
  v1 = [NSNumber numberWithDouble:a1.n128_u64[0]];
  v6[0] = v1;
  double v2 = [NSNumber numberWithDouble:v5];
  v6[1] = v2;
  double v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v3;
}

+ (id)arrayWithSIMDDouble3:()SIMD
{
  v10[3] = *MEMORY[0x1E4F143B8];
  long long v9 = *(_OWORD *)a3;
  double v3 = a3[2];
  double v4 = [NSNumber numberWithDouble:*(void *)a3];
  v10[0] = v4;
  double v5 = [NSNumber numberWithDouble:*((double *)&v9 + 1)];
  v10[1] = v5;
  int v6 = [NSNumber numberWithDouble:v3];
  v10[2] = v6;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];

  return v7;
}

+ (id)arrayWithSIMDDouble4:()SIMD
{
  v11[4] = *MEMORY[0x1E4F143B8];
  long long v9 = *a3;
  *(_OWORD *)v10 = a3[1];
  double v3 = [NSNumber numberWithDouble:*(void *)a3];
  v11[0] = v3;
  double v4 = [NSNumber numberWithDouble:*((double *)&v9 + 1)];
  v11[1] = v4;
  double v5 = [NSNumber numberWithDouble:v10[0]];
  v11[2] = v5;
  int v6 = [NSNumber numberWithDouble:v10[1]];
  v11[3] = v6;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];

  return v7;
}

+ (id)arrayWithSIMDDouble8:()SIMD
{
  v17[8] = *MEMORY[0x1E4F143B8];
  long long v15 = a3[2];
  *(_OWORD *)long long v16 = a3[3];
  long long v13 = *a3;
  long long v14 = a3[1];
  double v3 = [NSNumber numberWithDouble:*(void *)a3];
  v17[0] = v3;
  double v4 = [NSNumber numberWithDouble:*((double *)&v13 + 1)];
  v17[1] = v4;
  double v5 = [NSNumber numberWithDouble:*(double *)&v14];
  v17[2] = v5;
  int v6 = [NSNumber numberWithDouble:*((double *)&v14 + 1)];
  v17[3] = v6;
  double v7 = [NSNumber numberWithDouble:*(double *)&v15];
  v17[4] = v7;
  v8 = [NSNumber numberWithDouble:*((double *)&v15 + 1)];
  v17[5] = v8;
  long long v9 = [NSNumber numberWithDouble:v16[0]];
  v17[6] = v9;
  v10 = [NSNumber numberWithDouble:v16[1]];
  v17[7] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:8];

  return v11;
}

+ (id)arrayWithSIMDFloat3x3:()SIMD
{
  v20[9] = *MEMORY[0x1E4F143B8];
  double v3 = objc_msgSend(NSNumber, "numberWithFloat:");
  v20[0] = v3;
  double v4 = [NSNumber numberWithFloat:a2.n128_f64[0]];
  v20[1] = v4;
  double v5 = [NSNumber numberWithFloat:a3.n128_f64[0]];
  v20[2] = v5;
  HIDWORD(v6) = a1.n128_u32[1];
  LODWORD(v6) = a1.n128_u32[1];
  double v7 = [NSNumber numberWithFloat:v6];
  v20[3] = v7;
  HIDWORD(v8) = a2.n128_u32[1];
  LODWORD(v8) = a2.n128_u32[1];
  long long v9 = [NSNumber numberWithFloat:v8];
  v20[4] = v9;
  HIDWORD(v10) = a3.n128_u32[1];
  LODWORD(v10) = a3.n128_u32[1];
  v11 = [NSNumber numberWithFloat:v10];
  v20[5] = v11;
  double v12 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v20[6] = v12;
  long long v13 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  v20[7] = v13;
  long long v14 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  v20[8] = v14;
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:9];

  return v15;
}

+ (id)arrayWithSIMDDouble3x3:()SIMD
{
  v15[9] = *MEMORY[0x1E4F143B8];
  double v4 = [NSNumber numberWithDouble:*a3];
  double v5 = objc_msgSend(NSNumber, "numberWithDouble:", a3[4], v4);
  v15[1] = v5;
  double v6 = [NSNumber numberWithDouble:a3[8]];
  v15[2] = v6;
  double v7 = [NSNumber numberWithDouble:a3[1]];
  v15[3] = v7;
  double v8 = [NSNumber numberWithDouble:a3[5]];
  v15[4] = v8;
  long long v9 = [NSNumber numberWithDouble:a3[9]];
  v15[5] = v9;
  double v10 = [NSNumber numberWithDouble:a3[2]];
  v15[6] = v10;
  v11 = [NSNumber numberWithDouble:a3[6]];
  v15[7] = v11;
  double v12 = [NSNumber numberWithDouble:a3[10]];
  v15[8] = v12;
  long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:9];

  return v13;
}

+ (id)arrayWithSIMDFloat4x4:()SIMD
{
  v30[16] = *MEMORY[0x1E4F143B8];
  long long v25 = objc_msgSend(NSNumber, "numberWithFloat:");
  v30[0] = v25;
  long long v24 = [NSNumber numberWithFloat:a2.n128_f64[0]];
  v30[1] = v24;
  v23 = [NSNumber numberWithFloat:a3.n128_f64[0]];
  v30[2] = v23;
  v22 = [NSNumber numberWithFloat:a4.n128_f64[0]];
  v30[3] = v22;
  HIDWORD(v4) = a1.n128_u32[1];
  LODWORD(v4) = a1.n128_u32[1];
  v21 = [NSNumber numberWithFloat:v4];
  v30[4] = v21;
  HIDWORD(v5) = a2.n128_u32[1];
  LODWORD(v5) = a2.n128_u32[1];
  v20 = [NSNumber numberWithFloat:v5];
  v30[5] = v20;
  HIDWORD(v6) = a3.n128_u32[1];
  LODWORD(v6) = a3.n128_u32[1];
  v19 = [NSNumber numberWithFloat:v6];
  v30[6] = v19;
  HIDWORD(v7) = a4.n128_u32[1];
  LODWORD(v7) = a4.n128_u32[1];
  double v8 = [NSNumber numberWithFloat:v7];
  v30[7] = v8;
  long long v9 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v30[8] = v9;
  double v10 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  v30[9] = v10;
  v11 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  v30[10] = v11;
  double v12 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[2])));
  v30[11] = v12;
  long long v13 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));
  v30[12] = v13;
  long long v14 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[3])));
  v30[13] = v14;
  long long v15 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[3])));
  v30[14] = v15;
  long long v16 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[3])));
  v30[15] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:16];

  return v17;
}

+ (id)arrayWithSIMDDouble4x4:()SIMD
{
  v22[16] = *MEMORY[0x1E4F143B8];
  v21 = [NSNumber numberWithDouble:*a3];
  v22[0] = v21;
  v20 = [NSNumber numberWithDouble:a3[4]];
  v22[1] = v20;
  v19 = [NSNumber numberWithDouble:a3[8]];
  v22[2] = v19;
  v18 = [NSNumber numberWithDouble:a3[12]];
  v22[3] = v18;
  v17 = [NSNumber numberWithDouble:a3[1]];
  v22[4] = v17;
  long long v16 = [NSNumber numberWithDouble:a3[5]];
  v22[5] = v16;
  long long v15 = [NSNumber numberWithDouble:a3[9]];
  v22[6] = v15;
  double v4 = [NSNumber numberWithDouble:a3[13]];
  v22[7] = v4;
  double v5 = [NSNumber numberWithDouble:a3[2]];
  v22[8] = v5;
  double v6 = [NSNumber numberWithDouble:a3[6]];
  v22[9] = v6;
  double v7 = [NSNumber numberWithDouble:a3[10]];
  v22[10] = v7;
  double v8 = [NSNumber numberWithDouble:a3[14]];
  v22[11] = v8;
  long long v9 = [NSNumber numberWithDouble:a3[3]];
  v22[12] = v9;
  double v10 = [NSNumber numberWithDouble:a3[7]];
  v22[13] = v10;
  v11 = [NSNumber numberWithDouble:a3[11]];
  v22[14] = v11;
  double v12 = [NSNumber numberWithDouble:a3[15]];
  v22[15] = v12;
  long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:16];

  return v13;
}

+ (id)arrayWithSIMDQuatD:()SIMD
{
  long long v3 = a3[1];
  v6[0] = *a3;
  v6[1] = v3;
  double v4 = [a1 arrayWithSIMDDouble4:v6];

  return v4;
}

- (__n128)SIMDFloat2
{
  id v1 = a1;
  double v2 = [v1 objectAtIndexedSubscript:0];
  [v2 floatValue];
  *(void *)&long long v8 = v3;
  double v4 = [v1 objectAtIndexedSubscript:1];

  [v4 floatValue];
  long long v5 = v8;
  DWORD1(v5) = v6;
  long long v9 = v5;

  return (__n128)v9;
}

- (__n128)SIMDFloat3
{
  id v1 = a1;
  double v2 = [v1 objectAtIndexedSubscript:0];
  [v2 floatValue];
  unsigned __int32 v11 = v3;
  double v4 = [v1 objectAtIndexedSubscript:1];
  [v4 floatValue];
  unsigned __int32 v10 = v5;
  int v6 = [v1 objectAtIndexedSubscript:2];

  [v6 floatValue];
  unsigned __int32 v9 = v7;

  result.n128_u32[0] = v11;
  result.n128_u32[1] = v10;
  result.n128_u32[2] = v9;
  return result;
}

- (__n128)SIMDFloat4
{
  id v1 = a1;
  double v2 = [v1 objectAtIndexedSubscript:0];
  [v2 floatValue];
  unsigned int v14 = v3;
  double v4 = [v1 objectAtIndexedSubscript:1];
  [v4 floatValue];
  unsigned int v13 = v5;
  int v6 = [v1 objectAtIndexedSubscript:2];
  [v6 floatValue];
  unsigned int v12 = v7;
  long long v8 = [v1 objectAtIndexedSubscript:3];

  [v8 floatValue];
  *(void *)&long long v9 = __PAIR64__(v13, v14);
  *((void *)&v9 + 1) = __PAIR64__(v10, v12);
  long long v15 = v9;

  return (__n128)v15;
}

- (void)SIMDFloat8
{
  id v3 = a1;
  v28 = [v3 objectAtIndexedSubscript:0];
  [v28 floatValue];
  unsigned int v27 = v4;
  unsigned int v5 = [v3 objectAtIndexedSubscript:1];
  [v5 floatValue];
  unsigned int v26 = v6;
  unsigned int v7 = [v3 objectAtIndexedSubscript:2];
  [v7 floatValue];
  unsigned int v25 = v8;
  long long v9 = [v3 objectAtIndexedSubscript:3];
  [v9 floatValue];
  unsigned int v24 = v10;
  unsigned __int32 v11 = [v3 objectAtIndexedSubscript:4];
  [v11 floatValue];
  unsigned int v23 = v12;
  unsigned int v13 = [v3 objectAtIndexedSubscript:5];
  [v13 floatValue];
  unsigned int v22 = v14;
  long long v15 = [v3 objectAtIndexedSubscript:6];
  [v15 floatValue];
  unsigned int v21 = v16;
  v17 = [v3 objectAtIndexedSubscript:7];

  [v17 floatValue];
  *(void *)&long long v18 = __PAIR64__(v22, v23);
  *((void *)&v18 + 1) = __PAIR64__(v19, v21);
  *(void *)&long long v20 = __PAIR64__(v26, v27);
  *((void *)&v20 + 1) = __PAIR64__(v24, v25);
  *a2 = v20;
  a2[1] = v18;
}

- (void)SIMDFloat16
{
  id v3 = a1;
  v54 = [v3 objectAtIndexedSubscript:0];
  [v54 floatValue];
  unsigned int v48 = v4;
  v53 = [v3 objectAtIndexedSubscript:1];
  [v53 floatValue];
  unsigned int v46 = v5;
  v52 = [v3 objectAtIndexedSubscript:2];
  [v52 floatValue];
  unsigned int v45 = v6;
  v51 = [v3 objectAtIndexedSubscript:3];
  [v51 floatValue];
  unsigned int v43 = v7;
  v50 = [v3 objectAtIndexedSubscript:4];
  [v50 floatValue];
  unsigned int v42 = v8;
  v49 = [v3 objectAtIndexedSubscript:5];
  [v49 floatValue];
  unsigned int v41 = v9;
  v47 = [v3 objectAtIndexedSubscript:6];
  [v47 floatValue];
  unsigned int v40 = v10;
  v44 = [v3 objectAtIndexedSubscript:7];
  [v44 floatValue];
  unsigned int v39 = v11;
  unsigned int v12 = [v3 objectAtIndexedSubscript:8];
  [v12 floatValue];
  unsigned int v38 = v13;
  unsigned int v14 = [v3 objectAtIndexedSubscript:9];
  [v14 floatValue];
  unsigned int v37 = v15;
  unsigned int v16 = [v3 objectAtIndexedSubscript:10];
  [v16 floatValue];
  unsigned int v36 = v17;
  long long v18 = [v3 objectAtIndexedSubscript:11];
  [v18 floatValue];
  unsigned int v35 = v19;
  long long v20 = [v3 objectAtIndexedSubscript:12];
  [v20 floatValue];
  unsigned int v34 = v21;
  unsigned int v22 = [v3 objectAtIndexedSubscript:13];
  [v22 floatValue];
  unsigned int v33 = v23;
  unsigned int v24 = [v3 objectAtIndexedSubscript:14];
  [v24 floatValue];
  unsigned int v32 = v25;
  unsigned int v26 = [v3 objectAtIndexedSubscript:15];

  [v26 floatValue];
  *(void *)&long long v27 = __PAIR64__(v33, v34);
  *((void *)&v27 + 1) = __PAIR64__(v28, v32);
  long long v29 = v27;
  *(void *)&long long v30 = __PAIR64__(v46, v48);
  *((void *)&v30 + 1) = __PAIR64__(v43, v45);
  *(void *)&long long v27 = __PAIR64__(v41, v42);
  *((void *)&v27 + 1) = __PAIR64__(v39, v40);
  *(void *)&long long v31 = __PAIR64__(v37, v38);
  *((void *)&v31 + 1) = __PAIR64__(v35, v36);
  *a2 = v30;
  a2[1] = v27;
  a2[2] = v31;
  a2[3] = v29;
}

- (__n128)SIMDDouble2
{
  id v1 = a1;
  double v2 = [v1 objectAtIndexedSubscript:0];
  [v2 doubleValue];
  uint64_t v8 = v3;
  unsigned int v4 = [v1 objectAtIndexedSubscript:1];

  [v4 doubleValue];
  *(void *)&long long v5 = v8;
  *((void *)&v5 + 1) = v6;
  long long v9 = v5;

  return (__n128)v9;
}

- (__n128)SIMDDouble3
{
  id v3 = a1;
  unsigned int v4 = [v3 objectAtIndexedSubscript:0];
  [v4 doubleValue];
  unint64_t v13 = v5;
  uint64_t v6 = [v3 objectAtIndexedSubscript:1];
  [v6 doubleValue];
  unint64_t v12 = v7;
  uint64_t v8 = [v3 objectAtIndexedSubscript:2];

  [v8 doubleValue];
  __n128 v11 = v9;
  v9.n128_u64[0] = v13;
  v9.n128_u64[1] = v12;
  __n128 v14 = v9;

  __n128 result = v14;
  *a2 = v14;
  a2[1] = v11;
  return result;
}

- (void)SIMDDouble4
{
  id v3 = a1;
  id v16 = [v3 objectAtIndexedSubscript:0];
  [v16 doubleValue];
  uint64_t v15 = v4;
  unint64_t v5 = [v3 objectAtIndexedSubscript:1];
  [v5 doubleValue];
  uint64_t v14 = v6;
  unint64_t v7 = [v3 objectAtIndexedSubscript:2];
  [v7 doubleValue];
  uint64_t v13 = v8;
  __n128 v9 = [v3 objectAtIndexedSubscript:3];

  [v9 doubleValue];
  *(void *)&long long v10 = v13;
  *((void *)&v10 + 1) = v11;
  *(void *)&long long v12 = v15;
  *((void *)&v12 + 1) = v14;
  *a2 = v12;
  a2[1] = v10;
}

- (void)SIMDDouble8
{
  id v3 = a1;
  long long v30 = [v3 objectAtIndexedSubscript:0];
  [v30 doubleValue];
  uint64_t v29 = v4;
  unint64_t v5 = [v3 objectAtIndexedSubscript:1];
  [v5 doubleValue];
  uint64_t v28 = v6;
  unint64_t v7 = [v3 objectAtIndexedSubscript:2];
  [v7 doubleValue];
  uint64_t v27 = v8;
  __n128 v9 = [v3 objectAtIndexedSubscript:3];
  [v9 doubleValue];
  uint64_t v26 = v10;
  uint64_t v11 = [v3 objectAtIndexedSubscript:4];
  [v11 doubleValue];
  uint64_t v25 = v12;
  uint64_t v13 = [v3 objectAtIndexedSubscript:5];
  [v13 doubleValue];
  uint64_t v24 = v14;
  uint64_t v15 = [v3 objectAtIndexedSubscript:6];
  [v15 doubleValue];
  uint64_t v23 = v16;
  unsigned int v17 = [v3 objectAtIndexedSubscript:7];

  [v17 doubleValue];
  *(void *)&long long v18 = v23;
  *((void *)&v18 + 1) = v19;
  *(void *)&long long v20 = v29;
  *((void *)&v20 + 1) = v28;
  *(void *)&long long v21 = v27;
  *((void *)&v21 + 1) = v26;
  *(void *)&long long v22 = v25;
  *((void *)&v22 + 1) = v24;
  *a2 = v20;
  a2[1] = v21;
  a2[2] = v22;
  a2[3] = v18;
}

- (__n128)SIMDFloat3x3
{
  id v1 = a1;
  double v2 = [v1 objectAtIndexedSubscript:0];
  [v2 floatValue];
  unsigned __int32 v17 = v3;
  uint64_t v4 = [v1 objectAtIndexedSubscript:1];
  [v4 floatValue];
  unint64_t v5 = [v1 objectAtIndexedSubscript:2];
  [v5 floatValue];
  uint64_t v6 = [v1 objectAtIndexedSubscript:3];
  [v6 floatValue];
  unsigned __int32 v16 = v7;
  uint64_t v8 = [v1 objectAtIndexedSubscript:4];
  [v8 floatValue];
  __n128 v9 = [v1 objectAtIndexedSubscript:5];
  [v9 floatValue];
  uint64_t v10 = [v1 objectAtIndexedSubscript:6];
  [v10 floatValue];
  unsigned __int32 v15 = v11;
  uint64_t v12 = [v1 objectAtIndexedSubscript:7];
  [v12 floatValue];
  uint64_t v13 = [v1 objectAtIndexedSubscript:8];

  [v13 floatValue];
  result.n128_u32[0] = v17;
  result.n128_u32[1] = v16;
  result.n128_u32[2] = v15;
  return result;
}

- (void)SIMDDouble3x3
{
  id v3 = a1;
  unsigned int v32 = [v3 objectAtIndexedSubscript:0];
  [v32 doubleValue];
  uint64_t v31 = v4;
  unint64_t v5 = [v3 objectAtIndexedSubscript:1];
  [v5 doubleValue];
  uint64_t v30 = v6;
  unsigned __int32 v7 = [v3 objectAtIndexedSubscript:2];
  [v7 doubleValue];
  uint64_t v29 = v8;
  __n128 v9 = [v3 objectAtIndexedSubscript:3];
  [v9 doubleValue];
  uint64_t v28 = v10;
  unsigned __int32 v11 = [v3 objectAtIndexedSubscript:4];
  [v11 doubleValue];
  uint64_t v27 = v12;
  uint64_t v13 = [v3 objectAtIndexedSubscript:5];
  [v13 doubleValue];
  uint64_t v26 = v14;
  unsigned __int32 v15 = [v3 objectAtIndexedSubscript:6];
  [v15 doubleValue];
  long long v25 = v16;
  unsigned __int32 v17 = [v3 objectAtIndexedSubscript:7];
  [v17 doubleValue];
  long long v24 = v18;
  uint64_t v19 = [v3 objectAtIndexedSubscript:8];

  [v19 doubleValue];
  *(void *)&long long v20 = v31;
  *((void *)&v20 + 1) = v28;
  *(void *)&long long v21 = v30;
  *((void *)&v21 + 1) = v27;
  *(void *)&long long v22 = v29;
  *((void *)&v22 + 1) = v26;
  *a2 = v20;
  a2[1] = v25;
  a2[2] = v21;
  a2[3] = v24;
  a2[4] = v22;
  a2[5] = v23;
}

- (__n128)SIMDFloat4x4
{
  id v1 = a1;
  uint64_t v26 = [v1 objectAtIndexedSubscript:0];
  [v26 floatValue];
  unsigned int v27 = v2;
  long long v25 = [v1 objectAtIndexedSubscript:1];
  [v25 floatValue];
  long long v24 = [v1 objectAtIndexedSubscript:2];
  [v24 floatValue];
  long long v23 = [v1 objectAtIndexedSubscript:3];
  [v23 floatValue];
  long long v22 = [v1 objectAtIndexedSubscript:4];
  [v22 floatValue];
  unsigned int v19 = v3;
  long long v21 = [v1 objectAtIndexedSubscript:5];
  [v21 floatValue];
  long long v20 = [v1 objectAtIndexedSubscript:6];
  [v20 floatValue];
  uint64_t v4 = [v1 objectAtIndexedSubscript:7];
  [v4 floatValue];
  unint64_t v5 = [v1 objectAtIndexedSubscript:8];
  [v5 floatValue];
  unsigned int v18 = v6;
  unsigned __int32 v7 = [v1 objectAtIndexedSubscript:9];
  [v7 floatValue];
  uint64_t v8 = [v1 objectAtIndexedSubscript:10];
  [v8 floatValue];
  __n128 v9 = [v1 objectAtIndexedSubscript:11];
  [v9 floatValue];
  uint64_t v10 = [v1 objectAtIndexedSubscript:12];
  [v10 floatValue];
  unsigned int v17 = v11;
  uint64_t v12 = [v1 objectAtIndexedSubscript:13];
  [v12 floatValue];
  uint64_t v13 = [v1 objectAtIndexedSubscript:14];
  [v13 floatValue];
  uint64_t v14 = [v1 objectAtIndexedSubscript:15];

  [v14 floatValue];
  *(void *)&long long v15 = __PAIR64__(v19, v27);
  *((void *)&v15 + 1) = __PAIR64__(v17, v18);
  long long v28 = v15;

  return (__n128)v28;
}

- (void)SIMDDouble4x4
{
  id v3 = a1;
  v58 = [v3 objectAtIndexedSubscript:0];
  [v58 doubleValue];
  uint64_t v52 = v4;
  v57 = [v3 objectAtIndexedSubscript:1];
  [v57 doubleValue];
  uint64_t v50 = v5;
  v56 = [v3 objectAtIndexedSubscript:2];
  [v56 doubleValue];
  uint64_t v49 = v6;
  v55 = [v3 objectAtIndexedSubscript:3];
  [v55 doubleValue];
  uint64_t v48 = v7;
  v54 = [v3 objectAtIndexedSubscript:4];
  [v54 doubleValue];
  uint64_t v46 = v8;
  v53 = [v3 objectAtIndexedSubscript:5];
  [v53 doubleValue];
  uint64_t v45 = v9;
  v51 = [v3 objectAtIndexedSubscript:6];
  [v51 doubleValue];
  uint64_t v44 = v10;
  v47 = [v3 objectAtIndexedSubscript:7];
  [v47 doubleValue];
  uint64_t v43 = v11;
  uint64_t v12 = [v3 objectAtIndexedSubscript:8];
  [v12 doubleValue];
  uint64_t v42 = v13;
  uint64_t v14 = [v3 objectAtIndexedSubscript:9];
  [v14 doubleValue];
  uint64_t v41 = v15;
  long long v16 = [v3 objectAtIndexedSubscript:10];
  [v16 doubleValue];
  uint64_t v40 = v17;
  unsigned int v18 = [v3 objectAtIndexedSubscript:11];
  [v18 doubleValue];
  uint64_t v39 = v19;
  long long v20 = [v3 objectAtIndexedSubscript:12];
  [v20 doubleValue];
  uint64_t v38 = v21;
  long long v22 = [v3 objectAtIndexedSubscript:13];
  [v22 doubleValue];
  uint64_t v37 = v23;
  long long v24 = [v3 objectAtIndexedSubscript:14];
  [v24 doubleValue];
  uint64_t v36 = v25;
  uint64_t v26 = [v3 objectAtIndexedSubscript:15];

  [v26 doubleValue];
  *(void *)&long long v27 = v52;
  *((void *)&v27 + 1) = v46;
  *(void *)&long long v29 = v41;
  *(void *)&long long v28 = v42;
  *(void *)&long long v30 = v39;
  *((void *)&v28 + 1) = v38;
  *(void *)&long long v31 = v50;
  *((void *)&v31 + 1) = v45;
  *((void *)&v29 + 1) = v37;
  *(void *)&long long v32 = v49;
  *((void *)&v32 + 1) = v44;
  *(void *)&long long v33 = v40;
  *((void *)&v33 + 1) = v36;
  *((void *)&v30 + 1) = v34;
  *(void *)&long long v35 = v48;
  *((void *)&v35 + 1) = v43;
  *a2 = v27;
  a2[1] = v28;
  a2[2] = v31;
  a2[3] = v29;
  a2[4] = v32;
  a2[5] = v33;
  a2[6] = v35;
  a2[7] = v30;
}

- (double)SIMDQuatD
{
  [a1 SIMDDouble4];
  double result = *(double *)&v4;
  *a2 = v4;
  a2[1] = v5;
  return result;
}

@end