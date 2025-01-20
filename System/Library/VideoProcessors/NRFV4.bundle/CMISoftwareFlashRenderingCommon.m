@interface CMISoftwareFlashRenderingCommon
+ (int)calculateEIT:(id)a3 result:(float *)a4;
+ (int)calculateSensorNoiseTable:(id)a3 noiseTable:(float *)a4;
+ (int)getCCT:(id)a3 outputCCT:(float *)a4;
+ (int)getColorCorrectionMatrix:(id)a3 outputMatrix:(id *)a4 useSoftISPMetadata:(BOOL)a5;
+ (int)getInverseColorCorrectionMatrix:(id)a3 outputMatrix:(id *)a4 useSoftISPMetadata:(BOOL)a5;
+ (int)getLensShadingCorrectionMaxGain:(id)a3 outputMaxGain:(float *)a4;
+ (int)getStrobeWhiteBalanceGains:(id)a3 metadata:(id)a4 outputVector:;
+ (int)getWhiteBalanceGains:(id)a3 outputVector:;
@end

@implementation CMISoftwareFlashRenderingCommon

+ (int)calculateSensorNoiseTable:(id)a3 noiseTable:(float *)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4)
  {
    char v30 = 0;
    objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F608], &v30, 0.0);
    if (!v30) {
      goto LABEL_12;
    }
    float v8 = v7;
    objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F610], &v30, 0.0);
    if (!v30) {
      goto LABEL_12;
    }
    float v10 = v9;
    objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F700], &v30, 0.0);
    if (v30
      && (float v12 = v11, objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2C0], &v30, 0.0), v30)
      && (float v14 = v13, objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F408], &v30, 0.0), v30))
    {
      uint64_t v18 = 0;
      int32x4_t v19 = (int32x4_t)xmmword_263380160;
      float32x4_t v20 = (float32x4_t)vdupq_n_s32(0x447FC000u);
      *(float *)v16.i32 = (float)(v12 * v14) * 0.000015259;
      *(float *)v17.i32 = (float)(v8 * 0.000015259) * (float)(v8 * 0.000015259);
      float v21 = sqrtf((float)(*(float *)v17.i32 - (float)((float)(v10 * 0.000015259) * (float)(v10 * 0.000015259))) / 0.98438);
      *(float *)v17.i32 = sqrtf(*(float *)v17.i32 - (float)(v21 * v21));
      float v22 = sqrtf((float)((float)(v21 / *(float *)v16.i32) * (float)(v21 / *(float *)v16.i32))+ (float)(*(float *)v17.i32 * *(float *)v17.i32));
      *(float *)v17.i32 = (float)(*(float *)v16.i32 * v22) * (float)(*(float *)v16.i32 * v22);
      float32x4_t v23 = (float32x4_t)vdupq_lane_s32(v16, 0);
      *(float *)v15.i32 = *(float *)v15.i32 * 0.000015259;
      float32x4_t v24 = (float32x4_t)vdupq_lane_s32(v15, 0);
      float32x4_t v25 = (float32x4_t)vdupq_lane_s32(v17, 0);
      v26.i64[0] = 0x400000004;
      v26.i64[1] = 0x400000004;
      do
      {
        float32x4_t v27 = vmulq_n_f32(vsqrtq_f32(vdivq_f32(vdivq_f32(vcvtq_f32_s32(v19), v23), v24)), *(float *)v16.i32);
        *(float32x4_t *)&a4[v18] = vdivq_f32(vmulq_n_f32(vsqrtq_f32(vmlaq_f32(v25, v27, v27)), *(float *)v15.i32), v20);
        int32x4_t v19 = vaddq_s32(v19, v26);
        v18 += 4;
      }
      while (v18 != 1024);
      int v28 = 0;
    }
    else
    {
LABEL_12:
      FigDebugAssert3();
      int v28 = 2;
    }
  }
  else
  {
    FigDebugAssert3();
    int v28 = 8;
  }

  return v28;
}

+ (int)getCCT:(id)a3 outputCCT:(float *)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4)
  {
    char v10 = 0;
    int v7 = objc_msgSend(v5, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F3D8], 0, &v10);
    if (v10)
    {
      int v8 = 0;
      *a4 = (float)v7;
    }
    else
    {
      FigDebugAssert3();
      int v8 = 2;
    }
  }
  else
  {
    FigDebugAssert3();
    int v8 = 0;
  }

  return v8;
}

+ (int)getWhiteBalanceGains:(id)a3 outputVector:
{
  v4 = v3;
  id v5 = a3;
  v6 = v5;
  if (v4)
  {
    char v19 = 0;
    objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2E0], &v19, 0.0);
    if (v19
      && (float v8 = v7, objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2D8], &v19, 0.0), v19)
      && (float v10 = v9, objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2D0], &v19, 0.0), v19))
    {
      int v12 = 0;
      __asm { FMOV            V2.4S, #1.0 }
      *(float *)&_Q2 = v8 / v10;
      *((float *)&_Q2 + 2) = v11 / v10;
      _OWORD *v4 = _Q2;
    }
    else
    {
      FigDebugAssert3();
      int v12 = 2;
    }
  }
  else
  {
    FigDebugAssert3();
    int v12 = 8;
  }

  return v12;
}

+ (int)getStrobeWhiteBalanceGains:(id)a3 metadata:(id)a4 outputVector:
{
  id v5 = v4;
  id v7 = a3;
  id v8 = a4;
  float v9 = v8;
  if (!v5)
  {
    FigDebugAssert3();
    float v10 = 0;
    int v12 = 0;
    id v14 = 0;
    int v17 = 8;
    goto LABEL_13;
  }
  float v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
  if (!v10)
  {
    FigDebugAssert3();
    int v12 = 0;
    id v14 = 0;
    int v17 = 2;
    goto LABEL_13;
  }
  float v11 = [v7 objectForKeyedSubscript:v10];
  int v12 = v11;
  if (!v11
    || ([v11 objectForKeyedSubscript:*MEMORY[0x263F2F738]],
        (float v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    id v14 = 0;
    goto LABEL_12;
  }
  id v14 = v13;
  uint64_t v15 = [v14 bytes];
  if (!v15)
  {
    FigDebugAssert3();
    goto LABEL_12;
  }
  if ((*(_DWORD *)v15 - 1) > 1)
  {
LABEL_12:
    int v17 = 3;
    goto LABEL_13;
  }
  int v17 = 0;
  __asm { FMOV            V1.2S, #1.0 }
  *(float32x2_t *)v16.i8 = vdiv_f32(_D1, *(float32x2_t *)(v15 + 4));
  int32x4_t v23 = vzip1q_s32(v16, v16);
  v23.i32[1] = 1.0;
  *id v5 = v23;
LABEL_13:

  return v17;
}

+ (int)getColorCorrectionMatrix:(id)a3 outputMatrix:(id *)a4 useSoftISPMetadata:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = v7;
  if (!a4)
  {
    FigDebugAssert3();
    goto LABEL_9;
  }
  if (!v5)
  {
    v35 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F3F0]];
    if (v35)
    {
      id v10 = v35;
      v36 = (_DWORD *)[v10 bytes];
      if (v36)
      {
        LODWORD(v37) = *v36;
        LODWORD(v38) = v36[1];
        DWORD1(v37) = v36[3];
        DWORD2(v37) = v36[6];
        DWORD1(v38) = v36[4];
        DWORD2(v38) = v36[7];
        LODWORD(v39) = v36[2];
        DWORD1(v39) = v36[5];
        DWORD2(v39) = v36[8];
        *(_OWORD *)a4 = v37;
        *((_OWORD *)a4 + 1) = v38;
        *((_OWORD *)a4 + 2) = v39;
        goto LABEL_8;
      }
      FigDebugAssert3();

LABEL_13:
      LODWORD(a4) = 2;
      goto LABEL_9;
    }
LABEL_11:
    FigDebugAssert3();
    goto LABEL_13;
  }
  float v9 = [v7 valueForKeyPath:@"SoftISP.WhiteBalance.CCM"];
  if (!v9) {
    goto LABEL_11;
  }
  id v10 = v9;
  v43 = [v9 objectAtIndex:0];
  [v43 floatValue];
  unsigned int v48 = v11;
  int v12 = [v10 objectAtIndex:3];
  [v12 floatValue];
  v44 = v8;
  float32x2_t v13 = (float32x2_t)vdup_n_s32(0x39800000u);
  *(float32x2_t *)&long long v15 = vmul_f32((float32x2_t)__PAIR64__(v14, v48), v13);
  long long v49 = v15;
  int32x4_t v16 = [v10 objectAtIndex:6];
  [v16 floatValue];
  long long v17 = v49;
  *((float *)&v17 + 2) = v18 * 0.00024414;
  long long v50 = v17;
  char v19 = [v10 objectAtIndex:1];
  [v19 floatValue];
  unsigned int v45 = v20;
  float v21 = [v10 objectAtIndex:4];
  [v21 floatValue];
  *(float32x2_t *)&long long v23 = vmul_f32((float32x2_t)__PAIR64__(v22, v45), v13);
  long long v46 = v23;
  float32x4_t v24 = [v10 objectAtIndex:7];
  [v24 floatValue];
  long long v25 = v46;
  *((float *)&v25 + 2) = v26 * 0.00024414;
  long long v47 = v25;
  float32x4_t v27 = [v10 objectAtIndex:2];
  [v27 floatValue];
  unsigned int v41 = v28;
  v29 = [v10 objectAtIndex:5];
  [v29 floatValue];
  *(float32x2_t *)&long long v31 = vmul_f32((float32x2_t)__PAIR64__(v30, v41), v13);
  long long v42 = v31;
  v32 = [v10 objectAtIndex:8];
  [v32 floatValue];
  long long v33 = v42;
  *((float *)&v33 + 2) = v34 * 0.00024414;
  *(_OWORD *)a4 = v50;
  *((_OWORD *)a4 + 1) = v47;
  *((_OWORD *)a4 + 2) = v33;

  id v8 = v44;
LABEL_8:

  LODWORD(a4) = 0;
LABEL_9:

  return (int)a4;
}

+ (int)getInverseColorCorrectionMatrix:(id)a3 outputMatrix:(id *)a4 useSoftISPMetadata:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  int8x16_t v15 = 0u;
  int8x16_t v16 = 0u;
  float32x4_t v14 = 0u;
  if (v8 && a4)
  {
    int v9 = [a1 getColorCorrectionMatrix:v8 outputMatrix:&v14 useSoftISPMetadata:v5];
    if (v9)
    {
      int v12 = v9;
      FigDebugAssert3();
    }
    else
    {
      v10.columns[0] = (simd_float3)v14;
      v10.columns[1] = (simd_float3)v15;
      v10.columns[2] = (simd_float3)v16;
      float32x4_t v11 = vmulq_f32(v14, vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v10.columns[2], (int8x16_t)v10.columns[2], 0xCuLL), v16, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v10.columns[1], (int32x4_t)v10.columns[1]), v15, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v10.columns[2], (int32x4_t)v10.columns[2]), v16, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v10.columns[1], (int8x16_t)v10.columns[1], 0xCuLL), v15, 8uLL)));
      if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2), vaddq_f32(v11, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.f32, 1))).f32[0] <= 0.00000011921)
      {
        FigDebugAssert3();
        int v12 = 2;
      }
      else
      {
        simd_float3x3 v17 = __invert_f3(v10);
        int v12 = 0;
        *((_DWORD *)a4 + 2) = v17.columns[0].i32[2];
        *((_DWORD *)a4 + 6) = v17.columns[1].i32[2];
        *((_DWORD *)a4 + 10) = v17.columns[2].i32[2];
        *(void *)a4 = v17.columns[0].i64[0];
        *((_DWORD *)a4 + 3) = 0;
        *((void *)a4 + 2) = v17.columns[1].i64[0];
        *((_DWORD *)a4 + 7) = 0;
        *((void *)a4 + 4) = v17.columns[2].i64[0];
        *((_DWORD *)a4 + 11) = 0;
      }
    }
  }
  else
  {
    FigDebugAssert3();
    int v12 = 0;
  }

  return v12;
}

+ (int)calculateEIT:(id)a3 result:(float *)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5 && a4)
  {
    char v13 = 0;
    int v7 = objc_msgSend(v5, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F2C0], 0, &v13);
    if (v13
      && (int v8 = v7, objc_msgSend(v6, "cmi_doubleValueForKey:defaultValue:found:", *MEMORY[0x263F2F468], &v13, 0.0), v13))
    {
      int v10 = 0;
      float v11 = v9
          * (float)((float)v8 * 0.0039062)
          / (float)((float)(int)objc_msgSend(v6, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F4F8], 4096, 0)* 0.00024414);
      *a4 = v11;
    }
    else
    {
      FigDebugAssert3();
      int v10 = 2;
    }
  }
  else
  {
    FigDebugAssert3();
    int v10 = 0;
  }

  return v10;
}

+ (int)getLensShadingCorrectionMaxGain:(id)a3 outputMaxGain:(float *)a4
{
  id v5 = a3;
  int v7 = v5;
  if (a4)
  {
    char v11 = 0;
    LODWORD(v6) = 1.0;
    objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F7E8], &v11, v6);
    if (v11)
    {
      int v9 = 0;
      *(_DWORD *)a4 = v8;
    }
    else
    {
      FigDebugAssert3();
      int v9 = 2;
    }
  }
  else
  {
    FigDebugAssert3();
    int v9 = 8;
  }

  return v9;
}

@end