@interface PTPrecomputeRandom
+ (PTUnitDisk)computeUnitDiskPoints:numberOfPatternCircles:;
+ (id)computeGaussian:(id)a3 sideLength:(int)a4;
+ (id)computeRandomUChars:(id)a3 rayCount:(int)a4;
@end

@implementation PTPrecomputeRandom

+ (id)computeGaussian:(id)a3 sideLength:(int)a4
{
  id v5 = a3;
  LODWORD(v6) = a4 * a4;
  id v7 = [MEMORY[0x1E4F1CA58] dataWithLength:(2 * a4 * a4)];
  uint64_t v8 = [v7 bytes];
  v9 = [[PTRandom alloc] initWithSeed:2354123123];
  if (a4)
  {
    if (v6 <= 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v6;
    }
    v10 = (_WORD *)v8;
    do
    {
      [(PTRandom *)v9 nextGauss];
      __asm { FCVT            H0, D0 }
      *v10++ = _D0;
      --v6;
    }
    while (v6);
  }
  v16 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:25 width:a4 height:a4 mipmapped:0];
  [v16 setUsage:1];
  v17 = [v5 device];
  v18 = (void *)[v17 newTextureWithDescriptor:v16];

  memset(v20, 0, 24);
  v20[3] = a4;
  v20[4] = a4;
  v20[5] = 1;
  [v18 replaceRegion:v20 mipmapLevel:0 withBytes:v8 bytesPerRow:2 * a4];

  return v18;
}

+ (id)computeRandomUChars:(id)a3 rayCount:(int)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = 0;
  int32x4_t v7 = (int32x4_t)xmmword_1D0840560;
  int32x4_t v8 = (int32x4_t)xmmword_1D0840570;
  int32x4_t v9 = (int32x4_t)xmmword_1D0840580;
  int32x4_t v10 = (int32x4_t)xmmword_1D0840590;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  int32x4_t v11 = vdupq_n_s32(a4);
  long long v26 = 0u;
  long long v27 = 0u;
  v12.i64[0] = 0x1000000010;
  v12.i64[1] = 0x1000000010;
  do
  {
    int32x4_t v13 = vmulq_s32(v10, v11);
    int32x4_t v14 = vmulq_s32(v9, v11);
    int32x4_t v15 = vmulq_s32(v8, v11);
    int32x4_t v16 = vmulq_s32(v7, v11);
    *(uint16x4_t *)v13.i8 = vshr_n_u16((uint16x4_t)vmovn_s32((int32x4_t)vsraq_n_u32((uint32x4_t)v13, (uint32x4_t)vcltzq_s32(v13), 0x19uLL)), 7uLL);
    v13.u64[1] = (unint64_t)vshr_n_u16((uint16x4_t)vmovn_s32((int32x4_t)vsraq_n_u32((uint32x4_t)v14, (uint32x4_t)vcltzq_s32(v14), 0x19uLL)), 7uLL);
    *(uint16x4_t *)v14.i8 = vshr_n_u16((uint16x4_t)vmovn_s32((int32x4_t)vsraq_n_u32((uint32x4_t)v15, (uint32x4_t)vcltzq_s32(v15), 0x19uLL)), 7uLL);
    v14.u64[1] = (unint64_t)vshr_n_u16((uint16x4_t)vmovn_s32((int32x4_t)vsraq_n_u32((uint32x4_t)v16, (uint32x4_t)vcltzq_s32(v16), 0x19uLL)), 7uLL);
    *(long long *)((char *)&v26 + v6) = (__int128)vuzp1q_s8((int8x16_t)v13, (int8x16_t)v14);
    v6 += 16;
    int32x4_t v10 = vaddq_s32(v10, v12);
    int32x4_t v9 = vaddq_s32(v9, v12);
    int32x4_t v8 = vaddq_s32(v8, v12);
    int32x4_t v7 = vaddq_s32(v7, v12);
  }
  while (v6 != 128);
  v17 = [PTRandom alloc];
  v18 = -[PTRandom initWithSeed:](v17, "initWithSeed:", 0x7FFFFFFFLL, v26, v27, v28, v29, v30, v31, v32, v33);
  unint64_t v19 = 127;
  do
  {
    signed int v20 = [(PTRandom *)v18 nextUint:v19];
    char v21 = *((unsigned char *)&v26 + v19);
    *((unsigned char *)&v26 + v19) = *((unsigned char *)&v26 + v20);
    *((unsigned char *)&v26 + v20) = v21;
  }
  while (v19-- > 1);
  v23 = [v5 device];
  v24 = (void *)[v23 newBufferWithBytes:&v26 length:128 options:0];

  return v24;
}

+ (PTUnitDisk)computeUnitDiskPoints:numberOfPatternCircles:
{
  int v2 = v1;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = v0;
  v26[0] = 0;
  if (v2 < 1)
  {
    int v6 = 1;
  }
  else
  {
    float v5 = 0.0;
    int v6 = 1;
    double v7 = 1.0;
    int v8 = 1;
    do
    {
      _D0 = round(3.14159265 / asin(v7 / ((float)v8 + (float)v8)));
      float v9 = _D0;
      if (v9 > 0.0)
      {
        int v10 = 0;
        if (v8) {
          double v11 = -1.0;
        }
        else {
          double v11 = v7;
        }
        double v12 = v5;
        int32x4_t v13 = (_WORD *)&v26[v6] + 1;
        float v14 = (float)v8 / (float)v2;
        do
        {
          float v5 = v12 + (double)v10 * 6.28318531 / v9 * v11;
          __float2 v15 = __sincosf_stret(v5);
          _S1 = v14 * v15.__cosval;
          __asm { FCVT            H1, S1 }
          *(v13 - 1) = LOWORD(_S1);
          *(float *)&_D0 = v14 * v15.__sinval;
          __asm { FCVT            H0, S0 }
          *int32x4_t v13 = LOWORD(_D0);
          *(float *)&_D0 = (float)++v10;
          v13 += 2;
        }
        while ((float)v10 < v9);
        v6 += v10;
        double v7 = 1.0;
      }
    }
    while (v8++ != v2);
  }
  char v21 = objc_msgSend(v3, "device", _D0);
  uint64_t v22 = [v21 newBufferWithBytes:v26 length:4 * v6 options:0];

  _D0 = 0.5 / (double)v2;
  __asm { FCVT            H0, D0 }
  unint64_t v24 = v6 | ((unint64_t)LODWORD(_D0) << 32);
  v25 = (MTLBuffer *)v22;
  result.rayCount = v24;
  result.xy = v25;
  return result;
}

@end