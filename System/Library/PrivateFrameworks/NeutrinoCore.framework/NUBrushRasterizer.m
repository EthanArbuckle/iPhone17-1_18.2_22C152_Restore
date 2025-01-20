@interface NUBrushRasterizer
+ (int64_t)_rasterizeBrushStroke:(id)a3 toROI:(id *)a4 maskPtr:(char *)a5 maskPtrRowBytes:(int64_t)a6 close:(BOOL)a7 startIndex:(int64_t)a8 pressureMode:(int64_t)a9;
+ (int64_t)rasterizeBrushStroke:(id)a3 atPoint:(id)a4 toBuffer:(id)a5 close:(BOOL)a6 startIndex:(int64_t)a7;
+ (void)rasterizeBrushStroke:(id)a3 atPoint:(id)a4 toBuffer:(id)a5;
@end

@implementation NUBrushRasterizer

+ (void)rasterizeBrushStroke:(id)a3 atPoint:(id)a4 toBuffer:(id)a5
{
}

+ (int64_t)rasterizeBrushStroke:(id)a3 atPoint:(id)a4 toBuffer:(id)a5 close:(BOOL)a6 startIndex:(int64_t)a7
{
  BOOL v8 = a6;
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v13 = a3;
  id v14 = a5;
  uint64_t v15 = [v14 size];
  [v14 size];
  v19[0] = var0;
  v19[1] = var1;
  v19[2] = v15;
  v19[3] = v16;
  int64_t v17 = objc_msgSend(a1, "_rasterizeBrushStroke:toROI:maskPtr:maskPtrRowBytes:close:startIndex:pressureMode:", v13, v19, objc_msgSend(v14, "mutableBytes"), objc_msgSend(v14, "rowBytes"), v8, a7, objc_msgSend(v13, "pressureMode"));

  return v17;
}

+ (int64_t)_rasterizeBrushStroke:(id)a3 toROI:(id *)a4 maskPtr:(char *)a5 maskPtrRowBytes:(int64_t)a6 close:(BOOL)a7 startIndex:(int64_t)a8 pressureMode:(int64_t)a9
{
  BOOL v10 = a7;
  id v13 = a3;
  uint64_t v14 = [v13 pointCount];
  if (!v14)
  {
    int64_t v60 = 0;
    goto LABEL_48;
  }
  id v15 = [v13 points];
  uint64_t v16 = (float *)[v15 bytes];
  [v13 radius];
  float v69 = v17;
  v62 = v15;
  [v13 softness];
  float v19 = v18;
  v63 = &v16[3 * v14];
  float v20 = floorf(v69 + 0.5);
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v71 = __103__NUBrushRasterizer__rasterizeBrushStroke_toROI_maskPtr_maskPtrRowBytes_close_startIndex_pressureMode___block_invoke;
  v72 = &__block_descriptor_84_e27_v16__0r__BrushStamp_fffff_8l;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a4->var1;
  if (a8 >= 0) {
    int64_t v22 = a8 + 1;
  }
  else {
    int64_t v22 = 0;
  }
  $0AC6E346AE4835514AAA8AC86D8F4844 var0 = a4->var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 v74 = var1;
  int64_t v75 = a6;
  v76 = a5;
  float v77 = v20;
  v23 = v70;
  float v24 = v20;
  float v25 = 0.5;
  id v65 = v23;
  int64_t v26 = 0;
  uint64_t v27 = (uint64_t)&v16[3 * v14 - 3];
  float v28 = v16[1];
  float v29 = v16[2];
  float v30 = *v16;
  float v64 = v19;
  float v66 = (float)(v19 * 0.8) + 0.2;
  int v31 = !v10;
  float v32 = 1.0;
  v33 = v16;
  do
  {
    float v34 = *v33;
    float v35 = v33[1];
    float v36 = v33[2];
    if (v33 == v16)
    {
      unint64_t v39 = 1;
    }
    else
    {
      unint64_t v37 = (unint64_t)vabds_f32(v30, v34);
      float v38 = vabds_f32(v28, v35);
      if (v37 <= (unint64_t)v38) {
        unint64_t v39 = (unint64_t)v38;
      }
      else {
        unint64_t v39 = v37;
      }
      if (v39 <= 1) {
        uint64_t v40 = 1;
      }
      else {
        uint64_t v40 = v39;
      }
      if (v33 == (float *)v27)
      {
        unint64_t v39 = v40;
      }
      else if (!v39)
      {
        int64_t v41 = v26;
        float v42 = v30;
        float v43 = v28;
        goto LABEL_45;
      }
    }
    unint64_t v44 = 0;
    float v45 = (float)v39;
    float v46 = -(float)(v29 - v36);
    float v68 = v33[1];
    do
    {
      float v47 = (float)((float)v44 + v32) / v45;
      float v48 = v29 + (float)(v46 * v47);
      if (v33 == v16) {
        float v48 = v36;
      }
      float v49 = floorf(v25 + (float)(v69 * v48));
      if (a9 == 1) {
        float v50 = v49;
      }
      else {
        float v50 = v24;
      }
      float v51 = v30 - (float)((float)(v30 - v34) * v47);
      if (v33 == v16) {
        float v51 = v34;
      }
      float v52 = v28 - (float)((float)(v28 - v35) * v47);
      if (v33 == v16) {
        float v52 = v35;
      }
      float v42 = floorf(v51 + v25);
      float v43 = floorf(v52 + v25);
      if (v33 == v16
        || (v39 - 1 != v44 ? (int v53 = 1) : (int v53 = v31),
            v33 == (float *)v27 && !v53
         || (float v54 = fmaxf(v66 * (float)(v50 * 0.25), v32),
             (float)((float)((float)(v43 - v28) * (float)(v43 - v28)) + (float)((float)(v42 - v30) * (float)(v42 - v30))) >= (float)(v54 * v54))))
      {
        int64_t v41 = v26 + 1;
        if (a9 == 2) {
          float v55 = v48;
        }
        else {
          float v55 = v32;
        }
        if (v26 >= v22)
        {
          float v56 = v24;
          *(void *)&long long v57 = (uint64_t)(float)(v42 - v50);
          *((void *)&v57 + 1) = (uint64_t)(float)(v43 - v50);
          $0AC6E346AE4835514AAA8AC86D8F4844 v58 = a4->var0;
          $0AC6E346AE4835514AAA8AC86D8F4844 v59 = a4->var1;
          long long v82 = v57;
          int64x2_t v83 = vdupq_n_s64((uint64_t)(float)((float)(v50 + v50) + v32));
          v81[0] = v58;
          v81[1] = v59;
          NU::RectT<long>::Intersection((uint64_t)v78, (uint64_t *)&v82, (uint64_t *)v81);
          if (v79 && v80)
          {
            *(void *)&long long v82 = __PAIR64__(LODWORD(v43), LODWORD(v42));
            *((void *)&v82 + 1) = __PAIR64__(LODWORD(v64), LODWORD(v50));
            *(float *)v83.i32 = v55;
            v71((uint64_t)v65, (float32x2_t *)&v82);
          }
          float v25 = 0.5;
          float v24 = v56;
          float v32 = 1.0;
          float v35 = v68;
          float v46 = -(float)(v29 - v36);
          float v45 = (float)v39;
        }
      }
      else
      {
        int64_t v41 = v26;
        float v42 = v30;
        float v43 = v28;
      }
      ++v44;
      int64_t v26 = v41;
      float v28 = v43;
      float v30 = v42;
    }
    while (v39 != v44);
LABEL_45:
    v33 += 3;
    int64_t v26 = v41;
    float v29 = v36;
    float v28 = v43;
    float v30 = v42;
  }
  while (v33 != v63);

  int64_t v60 = v41 - 1;
LABEL_48:

  return v60;
}

void __103__NUBrushRasterizer__rasterizeBrushStroke_toROI_maskPtr_maskPtrRowBytes_close_startIndex_pressureMode___block_invoke(uint64_t a1, float32x2_t *a2)
{
  int64_t v4 = (uint64_t)rintf(floorf(a2[1].f32[0] + 0.5));
  unint64_t v5 = (2 * v4) | 1;
  int64x2_t v6 = vsubq_s64(vcvtq_s64_f64(vcvtq_f64_f32(*a2)), vdupq_n_s64(v4));
  long long v7 = *(_OWORD *)(a1 + 48);
  long long block = *(_OWORD *)(a1 + 32);
  long long v52 = v7;
  int64x2_t v40 = v6;
  int64x2_t v56 = v6;
  int64x2_t v57 = vdupq_n_s64(v5);
  NU::RectT<long>::Intersection((uint64_t)&v60, (uint64_t *)&block, v56.i64);
  long long v8 = v61;
  uint64_t v10 = *((void *)&v61 + 1);
  uint64_t v9 = v61;
  if (v4 >= 1 && (void)v61 != 0 && *((void *)&v61 + 1) != 0)
  {
    long long v13 = v60;
    uint64_t v14 = *(void *)(a1 + 64);
    uint64_t v15 = *((void *)&v60 + 1);
    uint64_t v16 = v60;
    uint64_t v17 = *(void *)(a1 + 72)
        + v60
        + (*(void *)(a1 + 56) + *(void *)(a1 + 40) - (*((void *)&v61 + 1) + *((void *)&v60 + 1))) * v14
        - *(void *)(a1 + 32);
    *(void *)&long long v60 = 0;
    *((void *)&v60 + 1) = &v60;
    *(void *)&long long v61 = 0x2020000000;
    BYTE8(v61) = 0;
    float v18 = a2[1].f32[0];
    if (v18 == *(float *)(a1 + 80))
    {
      long long v38 = v13;
      long long v39 = v8;
      __int32 v19 = a2[1].i32[1];
      v56.i64[0] = 0;
      v56.i64[1] = (uint64_t)&v56;
      v57.i64[0] = 0x3032000000;
      v57.i64[1] = (uint64_t)__Block_byref_object_copy__1500;
      $0AC6E346AE4835514AAA8AC86D8F4844 v58 = __Block_byref_object_dispose__1501;
      id v59 = 0;
      *(void *)&long long block = MEMORY[0x1E4F143A8];
      *((void *)&block + 1) = 3221225472;
      *(void *)&long long v52 = ___ZN12_GLOBAL__N_114getCachedBrushElf_block_invoke_10;
      *((void *)&v52 + 1) = &unk_1E5D93EF0;
      __int32 v55 = v19;
      int v53 = &v56;
      uint64_t v54 = (2 * v4) | 1;
      id v20 = *(id *)(v56.i64[1] + 40);
      _Block_object_dispose(&v56, 8);

      v50[0] = 0;
      v50[1] = 0;
      v50[2] = [v20 size];
      v50[3] = v21;
      int64_t v22 = +[NURegion regionWithRect:v50];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __103__NUBrushRasterizer__rasterizeBrushStroke_toROI_maskPtr_maskPtrRowBytes_close_startIndex_pressureMode___block_invoke_2;
      v41[3] = &unk_1E5D93E88;
      int64x2_t v42 = v40;
      unint64_t v43 = v5;
      unint64_t v44 = v5;
      long long v45 = v38;
      long long v46 = v39;
      uint64_t v23 = *(void *)(a1 + 64);
      uint64_t v47 = v17;
      uint64_t v48 = v23;
      float v49 = a2;
      v41[4] = &v60;
      [v20 readBufferRegion:v22 withBlock:v41];

      if (*(unsigned char *)(*((void *)&v60 + 1) + 24)) {
        goto LABEL_28;
      }
      float v18 = a2[1].f32[0];
      uint64_t v14 = *(void *)(a1 + 64);
    }
    if (v18 > 1.0)
    {
      float v24 = a2->f32[0] + 0.5;
      float v25 = a2->f32[1] + 0.5;
      float v27 = a2[1].f32[1];
      float v26 = a2[2].f32[0];
      if ((float)(2.0 / (float)(v18 + v18)) > v27) {
        float v27 = 2.0 / (float)(v18 + v18);
      }
      float v28 = v18 * (float)(1.0 - v27);
      float v29 = (float)v15 + 0.5;
      do
      {
        uint64_t v30 = 0;
        float v31 = (float)v16 + 0.5;
        do
        {
          float v32 = sqrtf((float)((float)(v29 - v25) * (float)(v29 - v25)) + (float)((float)(v31 - v24) * (float)(v31 - v24)));
          if (v32 <= v18)
          {
            float v33 = 1.0;
            if (v32 <= v28
              || (float v34 = (float)(v32 - v28) / (float)(v18 - v28),
                  float v32 = v34 * (float)((float)(v34 * -2.0) + 3.0),
                  float v33 = 1.0 - (float)(v34 * v32),
                  v33 > 0.0))
            {
              LOBYTE(v32) = *(unsigned char *)(v17 + v30);
              float v35 = (float)LODWORD(v32) / 255.0;
              float v36 = 1.0 - (float)((float)(1.0 - v33) * (float)(1.0 - v35));
              float v37 = v35 + (float)(v33 * (float)(v26 - v35));
              if (v35 >= v26) {
                float v37 = v35;
              }
              if (v26 == 1.0) {
                float v37 = v36;
              }
              *(unsigned char *)(v17 + v30) = (int)(float)(v37 * 255.0);
            }
          }
          float v31 = v31 + 1.0;
          ++v30;
        }
        while (v9 != v30);
        v17 += v14;
        float v29 = v29 + 1.0;
        --v10;
      }
      while (v10);
    }
LABEL_28:
    _Block_object_dispose(&v60, 8);
  }
}

void __103__NUBrushRasterizer__rasterizeBrushStroke_toROI_maskPtr_maskPtrRowBytes_close_startIndex_pressureMode___block_invoke_2(void *a1, void *a2)
{
  id v14 = a2;
  v3 = [v14 buffer];
  uint64_t v4 = [v3 rowBytes];
  uint64_t v5 = [v3 bytes];
  uint64_t v6 = a1[12];
  if (v6)
  {
    signed int v7 = vcvts_n_s32_f32(*(float *)(a1[15] + 16), 8uLL);
    uint64_t v8 = a1[11];
    uint64_t v10 = a1[13];
    uint64_t v9 = a1[14];
    uint64_t v11 = v5 + a1[9] + (a1[8] + a1[6] - (v6 + a1[10])) * v4 - a1[5];
    do
    {
      if (v8)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          int v13 = *(unsigned __int8 *)(v10 + i);
          if (v7 > v13) {
            *(unsigned char *)(v10 + i) = v13 + ((unsigned __int16)((v7 - v13) * *(unsigned __int8 *)(v11 + i)) >> 8);
          }
        }
      }
      v11 += v4;
      v10 += v9;
      --v6;
    }
    while (v6);
  }
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
}

@end