@interface H13FastPostDemosaicProcConfigMetal
+ (int)getChromaSuppressionConfigInputFrameMetadata:(id)a3 tuningControls:(id *)a4 chromaSuppressionConfig:(ChromaSupressionStruct *)a5;
@end

@implementation H13FastPostDemosaicProcConfigMetal

+ (int)getChromaSuppressionConfigInputFrameMetadata:(id)a3 tuningControls:(id *)a4 chromaSuppressionConfig:(ChromaSupressionStruct *)a5
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7) {
    goto LABEL_34;
  }
  if (!a4 || !a5)
  {
    FigDebugAssert3();
LABEL_34:
    int v74 = FigSignalErrorAt();
    goto LABEL_32;
  }
  bzero(a5, 0x840uLL);
  for (uint64_t i = 0; i != 35; ++i)
    a5->var0[i] = (float)word_263481AF0[dword_263481B08[i]] / 90.0;
  uint64_t v9 = 0;
  if (LOBYTE(a4->var24[2])) {
    v10 = (__int16 *)&unk_263481BA6;
  }
  else {
    v10 = (__int16 *)&unk_263481B94;
  }
  do
  {
    a5->var1[v9] = (float)v10[dword_263481BB8[v9]] * 0.03125;
    ++v9;
  }
  while (v9 != 25);
  *(void *)&a5->var2 = *(void *)a4->var24;
  *(void *)&a5->var4 = *(void *)&a4->var24[3];
  float32x2_t v11 = vmul_f32(*(float32x2_t *)&a4->var24[5], (float32x2_t)vdup_n_s32(0x420C0000u));
  *(float32x2_t *)a5->var6 = v11;
  float v12 = a4->var24[7];
  v11.i32[0] = LODWORD(a4->var25);
  int32x2_t v76 = (int32x2_t)v11;
  float var26 = a4->var26;
  float var27 = a4->var27;
  float v15 = log2f(fmaxf(v12, var26));
  *(float *)v16.i32 = ldexpf(1.0, vcvtps_s32_f32(v15));
  uint64_t v17 = 0;
  a5->var12 = *(float *)v16.i32 * 1.0;
  *(float *)v18.i32 = var26 - v12;
  *(float *)v19.i32 = var27 - *(float *)v76.i32;
  *(float *)v20.i32 = -v12;
  float32x2_t v21 = (float32x2_t)vdup_lane_s32(v16, 0);
  float32x2_t v22 = (float32x2_t)vdup_lane_s32(v20, 0);
  float32x2_t v23 = (float32x2_t)vdup_lane_s32(v19, 0);
  float32x2_t v24 = (float32x2_t)vdup_lane_s32(v76, 0);
  float32x2_t v25 = (float32x2_t)vdup_lane_s32(v18, 0);
  int64x2_t v26 = (int64x2_t)xmmword_263380330;
  int64x2_t v27 = vdupq_n_s64(2uLL);
  uint64x2_t v28 = (uint64x2_t)vdupq_n_s64(0x81uLL);
  __asm { FMOV            V9.2S, #1.0 }
  do
  {
    v34.i32[0] = v17;
    v34.i32[1] = v17 + 1;
    float32x2_t v35 = vrnda_f32(vmul_f32(vmla_f32(v24, v23, vminnm_f32(vmaxnm_f32(vdiv_f32(vmla_f32(v22, vmul_f32(vcvt_f32_u32(v34), (float32x2_t)0x3C0000003C000000), v21), v25), 0), _D9)), (float32x2_t)0x4300000043000000));
    if (vmovn_s64((int64x2_t)vcgtq_u64(v28, (uint64x2_t)v26)).u8[0]) {
      LODWORD(a5->var6[v17 + 2]) = v35.i32[0];
    }
    if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x81uLL), *(uint64x2_t *)&v26)).i32[1]) {
      LODWORD(a5->var6[v17 + 3]) = v35.i32[1];
    }
    v17 += 2;
    int64x2_t v26 = vaddq_s64(v26, v27);
  }
  while (v17 != 130);
  long long v36 = *(_OWORD *)&a4[1].var4;
  v82[0] = *(_OWORD *)&a4->var28;
  v82[1] = v36;
  int v83 = v82[0];
  int v81 = 0x10000;
  v80[0] = xmmword_263481C1C;
  v80[1] = unk_263481C2C;
  int v79 = 0x10000;
  v78[4] = xmmword_263481C80;
  v78[5] = unk_263481C90;
  v78[6] = xmmword_263481CA0;
  v78[7] = unk_263481CB0;
  v78[0] = xmmword_263481C40;
  v78[1] = unk_263481C50;
  v78[2] = xmmword_263481C60;
  v78[3] = unk_263481C70;
  int v37 = interp1f((uint64_t)v80, 9, (uint64_t)v82, (uint64_t)v78, 33, 0, (uint64_t)&a5->var7[2]);
  if (v37)
  {
    int v74 = v37;
    FigDebugAssert3();
  }
  else
  {
    uint64_t v38 = 0;
    v39.i32[1] = 1140850688;
    do
    {
      a5->var7[v38 + 2] = roundf(a5->var7[v38 + 2] * 512.0);
      ++v38;
    }
    while (v38 != 33);
    float v40 = a4[1].var9[1];
    float v41 = a4[1].var9[2];
    v39.i32[0] = LODWORD(a4[1].var9[3]);
    int32x2_t v77 = v39;
    float v42 = a4[1].var9[4];
    float v43 = log2f(fmaxf(v40, v41));
    *(float *)v44.i32 = ldexpf(1.0, vcvtps_s32_f32(v43));
    uint64_t v45 = 0;
    *(float *)&a5->var13.var0.var0[2] = *(float *)v44.i32 * 1.0;
    *(float *)v46.i32 = v41 - v40;
    *(float *)v47.i32 = v42 - *(float *)v77.i32;
    *(float *)v48.i32 = -v40;
    float32x2_t v49 = (float32x2_t)vdup_lane_s32(v44, 0);
    float32x2_t v50 = (float32x2_t)vdup_lane_s32(v48, 0);
    float32x2_t v51 = (float32x2_t)vdup_lane_s32(v47, 0);
    float32x2_t v52 = (float32x2_t)vdup_lane_s32(v77, 0);
    float32x2_t v53 = (float32x2_t)vdup_lane_s32(v46, 0);
    int64x2_t v54 = (int64x2_t)xmmword_263380330;
    int64x2_t v55 = vdupq_n_s64(2uLL);
    uint64x2_t v56 = (uint64x2_t)vdupq_n_s64(0x81uLL);
    do
    {
      v57.i32[0] = v45;
      v57.i32[1] = v45 + 1;
      float32x2_t v58 = vrnda_f32(vmul_f32(vmla_f32(v52, v51, vminnm_f32(vmaxnm_f32(vdiv_f32(vmla_f32(v50, vmul_f32(vcvt_f32_u32(v57), (float32x2_t)0x3C0000003C000000), v49), v53), 0), _D9)), (float32x2_t)0x4400000044000000));
      if (vmovn_s64((int64x2_t)vcgtq_u64(v56, (uint64x2_t)v54)).u8[0]) {
        LODWORD(a5->var9[v45 + 2]) = v58.i32[0];
      }
      if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x81uLL), *(uint64x2_t *)&v54)).i32[1]) {
        LODWORD(a5->var9[v45 + 3]) = v58.i32[1];
      }
      v45 += 2;
      int64x2_t v54 = vaddq_s64(v54, v55);
    }
    while (v45 != 130);
    float v59 = a4[1].var9[5];
    float v60 = a4[1].var9[6];
    float v61 = log2f(v60);
    *(float *)v62.i32 = ldexpf(1.0, vcvtps_s32_f32(v61));
    uint64_t v63 = 0;
    *(float *)a5->var13.var0.var0 = *(float *)v62.i32 * 1.0;
    *(float *)v64.i32 = v60 - v59;
    *(float *)v65.i32 = -v59;
    float32x2_t v66 = (float32x2_t)vdup_lane_s32(v62, 0);
    float32x2_t v67 = (float32x2_t)vdup_lane_s32(v65, 0);
    float32x2_t v68 = (float32x2_t)vdup_lane_s32(v64, 0);
    int64x2_t v69 = (int64x2_t)xmmword_263380330;
    int64x2_t v70 = vdupq_n_s64(2uLL);
    uint64x2_t v71 = (uint64x2_t)vdupq_n_s64(0x81uLL);
    do
    {
      v72.i32[0] = v63;
      v72.i32[1] = v63 + 1;
      float32x2_t v73 = vrnda_f32(vmul_f32(vsub_f32(_D9, vminnm_f32(vmaxnm_f32(vdiv_f32(vmla_f32(v67, vmul_f32(vcvt_f32_u32(v72), (float32x2_t)0x3C0000003C000000), v66), v68), 0), _D9)), (float32x2_t)0x4400000044000000));
      if (vmovn_s64((int64x2_t)vcgtq_u64(v71, (uint64x2_t)v69)).u8[0]) {
        LODWORD(a5->var8[v63 + 2]) = v73.i32[0];
      }
      if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0x81uLL), *(uint64x2_t *)&v69)).i32[1]) {
        LODWORD(a5->var8[v63 + 3]) = v73.i32[1];
      }
      v63 += 2;
      int64x2_t v69 = vaddq_s64(v69, v70);
    }
    while (v63 != 130);
    int v74 = 0;
    *(_OWORD *)&a5[1].var0[12] = xmmword_263481D10;
    *(_OWORD *)&a5[1].var0[16] = unk_263481D20;
    *(_OWORD *)&a5[1].var0[20] = xmmword_263481D30;
    *(_OWORD *)&a5[1].var0[24] = unk_263481D40;
    *(_OWORD *)&a5->var13.var1.var0[1] = xmmword_263481CD0;
    *(_OWORD *)a5[1].var0 = unk_263481CE0;
    *(_OWORD *)&a5[1].var0[4] = xmmword_263481CF0;
    *(_OWORD *)&a5[1].var0[8] = unk_263481D00;
  }
LABEL_32:

  return v74;
}

@end