@interface PTColorConversion
+ (BOOL2)getChromaSubsampledFromLuma:(id)a3 texChroma:(id)a4;
+ (float32x2_t)getChromaOffsetFromLuma:(void *)a3 texChroma:(uint64_t)a4;
+ (int)getTransferFunction:(id)a3 toLinear:(BOOL)a4;
+ (void)getColorMatrix:(unsigned int)a3@<W4> toRGB:(uint64_t)a4@<X5> fullRange:(void *)a5@<X8> colorYCbCrDepth:;
+ (void)getColorMatrix:(void *)a3 toRGB:(uint64_t)a4;
- (PTColorConversion)initWithMetalContext:(id)a3;
- (int)convertRGB:(id)a3 inRGBA:(id)a4 outRGBA:(id)a5 toLinear:(BOOL)a6 transferFunction:(id)a7;
- (int)convertRGB:(id)a3 inRGBA:(id)a4 outRGBA:(id)a5 toLinear:(BOOL)a6 transferFunction:(id)a7 outRect:;
- (int)convertRGBLinearFromPTTexture:(id)a3 inPTTexture:(id)a4 outRGBA:(id)a5;
- (int)convertRGBLinearToPTTexture:(id)a3 inRGBA:(id)a4 outPTTexture:(id)a5;
- (int)convertRGBLinearToPTTexture:(id)a3 inRGBA:(id)a4 outPTTexture:(id)a5 outRect:;
- (int)convertRGBtoYUV:(id)a3 inRGBA:(id)a4 outLuma:(id)a5 outChroma:(id)a6 toLinear:(BOOL)a7 transferFunction:(id)a8 colorYCbCrMatrix:(id)a9 colorYCbCrFullRange:(BOOL)a10 colorYCbCrDepthOut:(int64_t)a11;
- (int)convertRGBtoYUV:(id)a3 inRGBA:(id)a4 outLuma:(id)a5 outChroma:(id)a6 toLinear:(BOOL)a7 transferFunction:(id)a8 colorYCbCrMatrix:(id)a9 colorYCbCrFullRange:(BOOL)a10 colorYCbCrDepthOut:(int64_t)a11 outRect:;
- (int)convertYUVtoRGB:(id)a3 inLuma:(id)a4 inChroma:(id)a5 outRGBA:(id)a6 toLinear:(BOOL)a7 transferFunction:(id)a8 colorYCbCrMatrix:(id)a9 colorYCbCrFullRange:(BOOL)a10 colorYCbCrDepthIn:(int64_t)a11;
@end

@implementation PTColorConversion

- (PTColorConversion)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PTColorConversion;
  v6 = [(PTColorConversion *)&v50 init];
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metalContext, a3);
    v8 = objc_opt_new();
    int v9 = [p_isa[1] imageblocksSupported];
    v10 = @"NoImageBlocks";
    if (v9) {
      v10 = &stru_1F269F3B0;
    }
    v11 = v10;
    v12 = p_isa + 2;
    int v49 = 0;
    v13 = p_isa + 11;
    v14 = p_isa + 20;
    while (1)
    {
      [v8 reset];
      [v8 setConstantValue:&v49 type:29 withName:@"kColorTransferFunction"];
      v15 = [NSString stringWithFormat:@"convertRGB%@", v11];
      uint64_t v16 = [v5 computePipelineStateFor:v15 withConstants:v8];
      id v17 = v12[v49];
      v12[v49] = (id)v16;

      if (!v12[v49]) {
        break;
      }
      v18 = [NSString stringWithFormat:@"convertRGBToYUV%@", v11];
      uint64_t v19 = [v5 computePipelineStateFor:v18 withConstants:v8];
      id v20 = v13[v49];
      v13[v49] = (id)v19;

      if (!v13[v49])
      {
        v26 = _PTLogSystem();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[PTColorConversion initWithMetalContext:](v26, v34, v35, v36, v37, v38, v39, v40);
        }
        goto LABEL_17;
      }
      v21 = [NSString stringWithFormat:@"convertYUVToRGB%@", v11];
      uint64_t v22 = [v5 computePipelineStateFor:v21 withConstants:v8];
      id v23 = v14[v49];
      v14[v49] = (id)v22;

      int v24 = v49;
      if (!v14[v49])
      {
        v26 = _PTLogSystem();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[PTColorConversion initWithMetalContext:](v26, v41, v42, v43, v44, v45, v46, v47);
        }
        goto LABEL_17;
      }
      ++v49;
      if (v24 > 7)
      {
        v25 = p_isa;
        goto LABEL_18;
      }
    }
    v26 = _PTLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[PTColorConversion initWithMetalContext:](v26, v27, v28, v29, v30, v31, v32, v33);
    }
LABEL_17:

    v25 = 0;
LABEL_18:
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

+ (void)getColorMatrix:(unsigned int)a3@<W4> toRGB:(uint64_t)a4@<X5> fullRange:(void *)a5@<X8> colorYCbCrDepth:
{
  CFStringRef v9 = a1;
  v10 = (__CFString *)v9;
  if (!v9)
  {
    v21 = _PTLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[PTColorConversion getColorMatrix:toRGB:fullRange:colorYCbCrDepth:]();
    }

    double v11 = 0.2126;
    double v12 = 0.7152;
    double v13 = 0.0722;
    if (!a4) {
      goto LABEL_35;
    }
    goto LABEL_18;
  }
  if (CFEqual(v9, (CFStringRef)*MEMORY[0x1E4F24C30]))
  {
    double v11 = 0.2627;
    double v12 = 0.678;
    double v13 = 0.0593;
    if (a4) {
      goto LABEL_18;
    }
    goto LABEL_35;
  }
  double v11 = 0.2126;
  double v12 = 0.7152;
  double v13 = 0.0722;
  if (CFEqual(v10, (CFStringRef)*MEMORY[0x1E4F24C48])) {
    goto LABEL_17;
  }
  if (CFEqual(v10, (CFStringRef)*MEMORY[0x1E4F24C40]))
  {
    double v11 = 0.299;
    double v12 = 0.587;
    double v13 = 0.114;
LABEL_17:
    if (a4) {
      goto LABEL_18;
    }
    goto LABEL_35;
  }
  if (CFEqual(v10, (CFStringRef)*MEMORY[0x1E4F24C60]))
  {
    double v11 = 0.212;
    double v12 = 0.701;
    double v13 = 0.087;
    if (a4) {
      goto LABEL_18;
    }
LABEL_35:
    float32x2_t v25 = 0;
    __asm { FMOV            V1.2S, #1.0 }
    goto LABEL_36;
  }
  v14 = _PTLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    +[PTColorConversion getColorMatrix:toRGB:fullRange:colorYCbCrDepth:]((uint64_t)v10, v14, v15, v16, v17, v18, v19, v20);
  }

  if (!a4) {
    goto LABEL_35;
  }
LABEL_18:
  if (a4 == 8)
  {
    _D1 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(a3), 0x1FuLL)), (int8x8_t)vdup_n_s32(0x3F7EFEFFu), (int8x8_t)0x3F60E0E13F5BDBDCLL);
    float v23 = 0.0;
    if (!a3) {
      float v23 = 0.062745;
    }
    int v24 = (const float *)&unk_1D084081C;
    goto LABEL_26;
  }
  if (a4 == 10)
  {
    _D1 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(a3), 0x1FuLL)), (int8x8_t)vdup_n_s32(0x3F7FBFF0u), (int8x8_t)0x3F60380E3F5B36CELL);
    float v23 = 0.0;
    if (!a3) {
      float v23 = 0.062561;
    }
    int v24 = (const float *)&unk_1D0840814;
LABEL_26:
    float32x2_t v25 = vld1_dup_f32(v24);
    v25.f32[0] = v23;
LABEL_36:
    uint64_t v35 = 0;
    if (a2)
    {
      double v36 = v13 * -2.0 + 2.0;
      *(float *)&unsigned int v37 = -(v36 * v13) / v12;
      *(void *)&long long v38 = __PAIR64__(v37, 1.0);
      HIDWORD(v38) = 0;
      *(float *)&unsigned int v39 = 1.0 / *(float *)_D1.i32;
      LODWORD(v40) = 0;
      *((float *)&v40 + 1) = 1.0 / *(float *)&_D1.i32[1];
      double v41 = v11 * -2.0 + 2.0;
      *(void *)&long long v42 = 0;
      *((void *)&v42 + 1) = HIDWORD(v40);
      v43.i64[0] = COERCE_UNSIGNED_INT(1.0);
      v43.i32[2] = 0;
      v45.i64[0] = 0;
      v44.i32[0] = 0;
      v44.i32[1] = 1.0;
      v44.i32[2] = 0;
      v45.i32[2] = 1.0;
      long long v83 = v39;
      long long v84 = v40;
      long long v85 = v42;
      long long v86 = xmmword_1D081FA20;
      int32x4_t v87 = 0u;
      float32x4_t v88 = 0u;
      double v46 = -(v41 * v11);
      float32x4_t v89 = 0u;
      float32x4_t v90 = 0u;
      do
      {
        v43.f32[3] = -v25.f32[0];
        v45.f32[3] = -v25.f32[1];
        v44.f32[3] = -v25.f32[1];
        *(float32x4_t *)((char *)&v87 + v35) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v43, COERCE_FLOAT(*(long long *)((char *)&v83 + v35))), v44, *(float32x2_t *)((char *)&v83 + v35), 1), v45, *(float32x4_t *)((char *)&v83 + v35), 2), (float32x4_t)xmmword_1D081FA20, *(float32x4_t *)((char *)&v83 + v35), 3);
        v35 += 16;
      }
      while (v35 != 64);
      uint64_t v47 = 0;
      *(float *)&unsigned int v48 = v41;
      double v49 = v46 / v12;
      *(float *)&unsigned int v50 = v36;
      *(void *)&long long v51 = COERCE_UNSIGNED_INT(1.0);
      unint64_t v52 = __PAIR64__(v50, 1.0);
      *((void *)&v51 + 1) = v48;
      float v53 = v49;
      *((float *)&v38 + 2) = v53;
      float32x4_t v54 = (float32x4_t)v87;
      float32x4_t v55 = v88;
      float32x4_t v56 = v89;
      float32x4_t v57 = v90;
      long long v83 = v51;
      long long v84 = v38;
      long long v85 = v52;
      long long v86 = xmmword_1D081FA20;
      int32x4_t v87 = 0u;
      float32x4_t v88 = 0u;
      float32x4_t v89 = 0u;
      float32x4_t v90 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v87 + v47) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v54, COERCE_FLOAT(*(long long *)((char *)&v83 + v47))), v55, *(float32x2_t *)((char *)&v83 + v47), 1), v56, *(float32x4_t *)((char *)&v83 + v47), 2), v57, *(float32x4_t *)((char *)&v83 + v47), 3);
        v47 += 16;
      }
      while (v47 != 64);
    }
    else
    {
      *(float *)&unsigned int v58 = v11;
      *(float *)&unsigned int v59 = v12;
      *(float *)&unsigned int v60 = v13;
      v61.i64[0] = __PAIR64__(v59, v58);
      v61.i64[1] = v60;
      v63.f32[0] = v11 * -0.5 / (1.0 - v13);
      float32_t v62 = v12 * -0.5 / (1.0 - v13);
      v63.f32[1] = v62;
      v66.i32[0] = 0.5;
      v63.i64[1] = COERCE_UNSIGNED_INT(0.5);
      float32_t v64 = v12 * -0.5 / (1.0 - v11);
      *(float *)&unsigned int v65 = v13 * -0.5 / (1.0 - v11);
      v66.f32[1] = v64;
      v66.i64[1] = v65;
      LODWORD(v67) = 0;
      HIDWORD(v67) = _D1.i32[1];
      *(void *)&long long v68 = 0;
      *((void *)&v68 + 1) = _D1.u32[1];
      long long v83 = _D1.u32[0];
      long long v84 = v67;
      long long v85 = v68;
      long long v86 = xmmword_1D081FA20;
      int32x4_t v87 = 0u;
      float32x4_t v88 = 0u;
      float32x4_t v89 = 0u;
      float32x4_t v90 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v87 + v35) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v61, COERCE_FLOAT(*(long long *)((char *)&v83 + v35))), v63, *(float32x2_t *)((char *)&v83 + v35), 1), v66, *(float32x4_t *)((char *)&v83 + v35), 2), (float32x4_t)xmmword_1D081FA20, *(float32x4_t *)((char *)&v83 + v35), 3);
        v35 += 16;
      }
      while (v35 != 64);
      uint64_t v69 = 0;
      long long v70 = xmmword_1D081FA40;
      HIDWORD(v70) = v25.i32[1];
      long long v71 = xmmword_1D081FA00;
      HIDWORD(v71) = v25.i32[0];
      long long v72 = xmmword_1D081FA10;
      HIDWORD(v72) = v25.i32[1];
      float32x4_t v73 = (float32x4_t)v87;
      float32x4_t v74 = v88;
      float32x4_t v75 = v89;
      float32x4_t v76 = v90;
      long long v83 = v71;
      long long v84 = v70;
      long long v85 = v72;
      long long v86 = xmmword_1D081FA20;
      int32x4_t v87 = 0u;
      float32x4_t v88 = 0u;
      float32x4_t v89 = 0u;
      float32x4_t v90 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v87 + v69) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v73, COERCE_FLOAT(*(long long *)((char *)&v83 + v69))), v74, *(float32x2_t *)((char *)&v83 + v69), 1), v75, *(float32x4_t *)((char *)&v83 + v69), 2), v76, *(float32x4_t *)((char *)&v83 + v69), 3);
        v69 += 16;
      }
      while (v69 != 64);
    }
    uint64_t v77 = 0;
    a5[1] = 0;
    a5[2] = 0;
    *a5 = 0;
    do
    {
      uint64_t v78 = 0;
      long long v79 = *((_OWORD *)&v87 + v77);
      do
      {
        long long v82 = v79;
        _S1 = *(_DWORD *)((unint64_t)&v82 & 0xFFFFFFFFFFFFFFF3 | (4 * (v78 & 3)));
        __asm { FCVT            H1, S1 }
        *((_WORD *)a5 + v78++) = _S1;
      }
      while (v78 != 4);
      ++v77;
      ++a5;
    }
    while (v77 != 3);
    goto LABEL_50;
  }
  v26 = _PTLogSystem();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    +[PTColorConversion getColorMatrix:toRGB:fullRange:colorYCbCrDepth:](a4, v26);
  }

  uint64_t v27 = 0;
  int32x4_t v87 = vdupq_n_s32(0x7FC00000u);
  float32x4_t v88 = (float32x4_t)v87;
  float32x4_t v89 = (float32x4_t)v87;
  float32x4_t v90 = (float32x4_t)v87;
  a5[1] = 0;
  a5[2] = 0;
  *a5 = 0;
  do
  {
    uint64_t v28 = 0;
    long long v29 = *((_OWORD *)&v87 + v27);
    do
    {
      long long v81 = v29;
      _S1 = *(_DWORD *)((unint64_t)&v81 & 0xFFFFFFFFFFFFFFF3 | (4 * (v28 & 3)));
      __asm { FCVT            H1, S1 }
      *((_WORD *)a5 + v28++) = _S1;
    }
    while (v28 != 4);
    ++v27;
    ++a5;
  }
  while (v27 != 3);
LABEL_50:
}

+ (void)getColorMatrix:(void *)a3 toRGB:(uint64_t)a4
{
  id v5 = a3;
  id v8 = [v5 YCbCrMatrix];
  uint64_t v6 = [v5 YCbCrFullRange];
  uint64_t v7 = [v5 YCbCrColorDepth];

  +[PTColorConversion getColorMatrix:v8 toRGB:a4 fullRange:v6 colorYCbCrDepth:v7];
}

+ (int)getTransferFunction:(id)a3 toLinear:(BOOL)a4
{
  BOOL v4 = a4;
  CFStringRef v5 = (const __CFString *)a3;
  uint64_t v6 = (__CFString *)v5;
  if (!v5)
  {
    uint64_t v7 = _PTLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[PTColorConversion getTransferFunction:toLinear:]();
    }
    goto LABEL_11;
  }
  if (CFStringCompare(v5, (CFStringRef)*MEMORY[0x1E4F24BD8], 0))
  {
    if (CFEqual(v6, (CFStringRef)*MEMORY[0x1E4F24BE0]))
    {
LABEL_12:
      BOOL v8 = !v4;
      int v9 = 1;
      goto LABEL_17;
    }
    if (CFStringCompare(v6, (CFStringRef)*MEMORY[0x1E4F24B80], 0))
    {
      if (CFEqual(v6, (CFStringRef)*MEMORY[0x1E4F24BE8]))
      {
        int v10 = 0;
        goto LABEL_20;
      }
      if (CFStringCompare(v6, @"PTImageBufferTransferFunction_Linear_1_6", 0))
      {
        uint64_t v7 = _PTLogSystem();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          +[PTColorConversion getTransferFunction:toLinear:]();
        }
LABEL_11:

        goto LABEL_12;
      }
      BOOL v8 = !v4;
      int v9 = 7;
    }
    else
    {
      BOOL v8 = !v4;
      int v9 = 5;
    }
  }
  else
  {
    BOOL v8 = !v4;
    int v9 = 3;
  }
LABEL_17:
  if (v8) {
    int v10 = v9 + 1;
  }
  else {
    int v10 = v9;
  }
LABEL_20:

  return v10;
}

+ (BOOL2)getChromaSubsampledFromLuma:(id)a3 texChroma:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = [v6 width];
  __int16 v8 = v7 / [v5 width] == 2;
  unint64_t v9 = [v6 height];

  unint64_t v10 = [v5 height];
  return (BOOL2)(v8 | ((v9 / v10 == 2) << 8));
}

+ (float32x2_t)getChromaOffsetFromLuma:(void *)a3 texChroma:(uint64_t)a4
{
  id v5 = a3;
  LODWORD(a4) = +[PTColorConversion getChromaSubsampledFromLuma:v5 texChroma:a4];
  uint64_t v6 = [v5 width];
  uint64_t v7 = [v5 height];

  int32x2_t v8 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)vdup_n_s32(a4), (int8x8_t)0x10000000001));
  v9.i64[0] = v8.i32[0];
  v9.i64[1] = v8.i32[1];
  __asm { FMOV            V1.2D, #0.5 }
  float64x2_t v15 = (float64x2_t)vbicq_s8(_Q1, v9);
  _Q1.i64[0] = v6;
  _Q1.i64[1] = v7;
  return vcvt_f32_f64(vdivq_f64(v15, vcvtq_f64_u64((uint64x2_t)_Q1)));
}

- (int)convertRGB:(id)a3 inRGBA:(id)a4 outRGBA:(id)a5 toLinear:(BOOL)a6 transferFunction:(id)a7 outRect:
{
  long long v32 = v7;
  BOOL v9 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if ([(PTMetalContext *)self->_metalContext imageblocksSupported]
    || !vorr_s8((int8x8_t)vdup_lane_s16(*(int16x4_t *)&v32, 1), *(int8x8_t *)&v32).u16[0])
  {
    int v19 = +[PTColorConversion getTransferFunction:toLinear:](PTColorConversion, "getTransferFunction:toLinear:", v16, v9, v32);
    uint64_t v20 = [PTImageblockConfig alloc];
    v21 = +[PTTexture createRGBA:v15];
    uint64_t v17 = [(PTImageblockConfig *)v20 initWithPTTexture:v21 outRect:v33];

    uint64_t v36 = [v17 outOffset];
    uint64_t v22 = [v13 computeCommandEncoder];
    if (!v22)
    {
      float v23 = _PTLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v23, v24, v25, v26, v27, v28, v29, v30);
      }
    }
    [v22 setComputePipelineState:self->_convertRGB[v19]];
    if ([(PTMetalContext *)self->_metalContext imageblocksSupported]) {
      objc_msgSend(v22, "setImageblockWidth:height:", -[NSObject imageblockSize](v17, "imageblockSize"), -[NSObject imageblockSize](v17, "imageblockSize"));
    }
    [v22 setTexture:v14 atIndex:0];
    [v22 setTexture:v15 atIndex:1];
    [v22 setBytes:&v36 length:8 atIndex:0];
    if (v17)
    {
      [v17 threads];
      [v17 threadsPerGroup];
    }
    else
    {
      memset(v35, 0, sizeof(v35));
      memset(v34, 0, sizeof(v34));
    }
    [v22 dispatchThreads:v35 threadsPerThreadgroup:v34];
    [v22 endEncoding];

    int v18 = 0;
  }
  else
  {
    uint64_t v17 = _PTLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[PTColorConversion convertRGB:inRGBA:outRGBA:toLinear:transferFunction:outRect:]();
    }
    int v18 = -1;
  }

  return v18;
}

- (int)convertRGB:(id)a3 inRGBA:(id)a4 outRGBA:(id)a5 toLinear:(BOOL)a6 transferFunction:(id)a7
{
  uint64_t v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  __int16 v16 = [v13 width];
  __int16 v17 = [v13 height];
  LODWORD(v18) = 0;
  WORD2(v18) = v16;
  HIWORD(v18) = v17;
  LODWORD(v7) = [(PTColorConversion *)self convertRGB:v15 inRGBA:v14 outRGBA:v13 toLinear:v7 transferFunction:v12 outRect:v18];

  return v7;
}

- (int)convertRGBtoYUV:(id)a3 inRGBA:(id)a4 outLuma:(id)a5 outChroma:(id)a6 toLinear:(BOOL)a7 transferFunction:(id)a8 colorYCbCrMatrix:(id)a9 colorYCbCrFullRange:(BOOL)a10 colorYCbCrDepthOut:(int64_t)a11
{
  BOOL v29 = a7;
  id v17 = a9;
  id v18 = a8;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  __int16 v23 = [v20 width];
  __int16 v24 = [v20 height];
  LODWORD(v25) = 0;
  WORD2(v25) = v23;
  HIWORD(v25) = v24;
  LOBYTE(v28) = a10;
  int v26 = [(PTColorConversion *)self convertRGBtoYUV:v22 inRGBA:v21 outLuma:v20 outChroma:v19 toLinear:v29 transferFunction:v18 colorYCbCrMatrix:v25 colorYCbCrFullRange:v17 colorYCbCrDepthOut:v28 outRect:a11];

  return v26;
}

- (int)convertRGBtoYUV:(id)a3 inRGBA:(id)a4 outLuma:(id)a5 outChroma:(id)a6 toLinear:(BOOL)a7 transferFunction:(id)a8 colorYCbCrMatrix:(id)a9 colorYCbCrFullRange:(BOOL)a10 colorYCbCrDepthOut:(int64_t)a11 outRect:
{
  int16x4_t v47 = v11;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a8;
  id v22 = a9;
  BOOL v23 = [(PTMetalContext *)self->_metalContext imageblocksSupported];
  unsigned __int16 v24 = vorr_s8((int8x8_t)vdup_lane_s16(v47, 1), (int8x8_t)v47).u16[0];
  if (!v23)
  {
    if (v24)
    {
      double v25 = _PTLogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[PTColorConversion convertRGB:inRGBA:outRGBA:toLinear:transferFunction:outRect:]();
      }
LABEL_19:

      int v42 = -1;
      goto LABEL_22;
    }
    LOBYTE(v24) = 0;
  }
  if (v24 & 1 | v47.i8[4] & 1 | v47.i8[6] & 1)
  {
    double v25 = _PTLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[PTColorConversion convertRGBtoYUV:inRGBA:outLuma:outChroma:toLinear:transferFunction:colorYCbCrMatrix:colorYCbCrFullRange:colorYCbCrDepthOut:outRect:]();
    }
    goto LABEL_19;
  }
  id v44 = v18;
  id v26 = v17;
  id v46 = v21;
  int v27 = +[PTColorConversion getTransferFunction:toLinear:](PTColorConversion, "getTransferFunction:toLinear:");
  __int16 v52 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  id v45 = v22;
  +[PTColorConversion getColorMatrix:v22 toRGB:0 fullRange:a10 colorYCbCrDepth:a11];
  uint64_t v51 = (unsigned __int16)+[PTColorConversion getChromaSubsampledFromLuma:v19 texChroma:v20];
  uint64_t v28 = [PTImageblockConfig alloc];
  BOOL v29 = +[PTTexture createYUV420:v19 chroma:v20];
  uint64_t v30 = [(PTImageblockConfig *)v28 initWithPTTexture:v29 outRect:*(double *)&v47];

  uint64_t v50 = (uint64_t)[(PTImageblockConfig *)v30 outOffset];
  uint64_t v31 = v26;
  long long v32 = v26;
  id v18 = v44;
  double v33 = [v32 computeCommandEncoder];
  if (!v33)
  {
    uint64_t v34 = _PTLogSystem();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v34, v35, v36, v37, v38, v39, v40, v41);
    }
  }
  [v33 setComputePipelineState:self->_convertRGBToYUV[v27]];
  if ([(PTMetalContext *)self->_metalContext imageblocksSupported]) {
    objc_msgSend(v33, "setImageblockWidth:height:", -[PTImageblockConfig imageblockSize](v30, "imageblockSize"), -[PTImageblockConfig imageblockSize](v30, "imageblockSize"));
  }
  [v33 setTexture:v44 atIndex:0];
  [v33 setTexture:v19 atIndex:1];
  [v33 setTexture:v20 atIndex:2];
  [v33 setBytes:(char *)&v51 + 2 length:24 atIndex:0];
  [v33 setBytes:&v51 length:2 atIndex:1];
  id v21 = v46;
  if ([(PTMetalContext *)self->_metalContext imageblocksSupported]) {
    [v33 setBytes:&v50 length:8 atIndex:2];
  }
  if (v30)
  {
    [(PTImageblockConfig *)v30 threads];
    [(PTImageblockConfig *)v30 threadsPerGroup];
  }
  else
  {
    memset(v49, 0, sizeof(v49));
    memset(v48, 0, sizeof(v48));
  }
  [v33 dispatchThreads:v49 threadsPerThreadgroup:v48];
  [v33 endEncoding];

  int v42 = 0;
  id v17 = v31;
  id v22 = v45;
LABEL_22:

  return v42;
}

- (int)convertYUVtoRGB:(id)a3 inLuma:(id)a4 inChroma:(id)a5 outRGBA:(id)a6 toLinear:(BOOL)a7 transferFunction:(id)a8 colorYCbCrMatrix:(id)a9 colorYCbCrFullRange:(BOOL)a10 colorYCbCrDepthIn:(int64_t)a11
{
  BOOL v12 = a7;
  id v34 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  id v20 = a3;
  int v21 = +[PTColorConversion getTransferFunction:a8 toLinear:v12];
  __int16 v39 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  +[PTColorConversion getColorMatrix:v19 toRGB:1 fullRange:a10 colorYCbCrDepth:a11];

  id v22 = v34;
  uint64_t v38 = (unsigned __int16)+[PTColorConversion getChromaSubsampledFromLuma:v34 texChroma:v17];
  BOOL v23 = [[PTImageblockConfig alloc] initWithTexture:v18];
  uint64_t v37 = (uint64_t)[(PTImageblockConfig *)v23 outOffset];
  unsigned __int16 v24 = [v20 computeCommandEncoder];

  if (!v24)
  {
    double v25 = _PTLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v25, v26, v27, v28, v29, v30, v31, v32);
    }
  }
  objc_msgSend(v24, "setComputePipelineState:", self->_convertYUVToRGB[v21], v34);
  if ([(PTMetalContext *)self->_metalContext imageblocksSupported]) {
    objc_msgSend(v24, "setImageblockWidth:height:", -[PTImageblockConfig imageblockSize](v23, "imageblockSize"), -[PTImageblockConfig imageblockSize](v23, "imageblockSize"));
  }
  [v24 setTexture:v22 atIndex:0];
  [v24 setTexture:v17 atIndex:1];
  [v24 setTexture:v18 atIndex:2];
  [v24 setBytes:(char *)&v38 + 2 length:24 atIndex:0];
  [v24 setBytes:&v38 length:2 atIndex:1];
  if ([(PTMetalContext *)self->_metalContext imageblocksSupported]) {
    [v24 setBytes:&v37 length:8 atIndex:2];
  }
  if (v23)
  {
    [(PTImageblockConfig *)v23 threads];
    [(PTImageblockConfig *)v23 threadsPerGroup];
  }
  else
  {
    memset(v36, 0, sizeof(v36));
    memset(v35, 0, sizeof(v35));
  }
  [v24 dispatchThreads:v36 threadsPerThreadgroup:v35];
  [v24 endEncoding];

  return 0;
}

- (int)convertRGBLinearFromPTTexture:(id)a3 inPTTexture:(id)a4 outRGBA:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if ([v9 isRGB])
  {
    int16x4_t v11 = [v9 texRGBA];
    BOOL v12 = [v9 transferFunction];

    int v13 = [(PTColorConversion *)self convertRGB:v10 inRGBA:v11 outRGBA:v8 toLinear:1 transferFunction:v12];
  }
  else
  {
    int16x4_t v11 = [v9 texLuma];
    BOOL v12 = [v9 texChroma];
    uint64_t v14 = [v9 transferFunction];
    uint64_t v15 = [v9 YCbCrMatrix];
    char v16 = [v9 YCbCrFullRange];
    uint64_t v17 = [v9 YCbCrColorDepth];

    LOBYTE(v19) = v16;
    int v13 = [(PTColorConversion *)self convertYUVtoRGB:v10 inLuma:v11 inChroma:v12 outRGBA:v8 toLinear:1 transferFunction:v14 colorYCbCrMatrix:v15 colorYCbCrFullRange:v19 colorYCbCrDepthIn:v17];

    id v8 = (id)v15;
    id v10 = (id)v14;
  }

  return v13;
}

- (int)convertRGBLinearToPTTexture:(id)a3 inRGBA:(id)a4 outPTTexture:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  __int16 v11 = [v8 width];
  __int16 v12 = [v8 height];
  LODWORD(v13) = 0;
  WORD2(v13) = v11;
  HIWORD(v13) = v12;
  LODWORD(self) = [(PTColorConversion *)self convertRGBLinearToPTTexture:v10 inRGBA:v9 outPTTexture:v8 outRect:v13];

  return (int)self;
}

- (int)convertRGBLinearToPTTexture:(id)a3 inRGBA:(id)a4 outPTTexture:(id)a5 outRect:
{
  double v6 = v5;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  if ([v10 isRGB])
  {
    double v13 = [v10 texRGBA];
    uint64_t v14 = [v10 transferFunction];

    int v15 = [(PTColorConversion *)self convertRGB:v12 inRGBA:v11 outRGBA:v13 toLinear:0 transferFunction:v14 outRect:v6];
  }
  else
  {
    double v13 = [v10 texLuma];
    uint64_t v14 = [v10 texChroma];
    uint64_t v16 = [v10 transferFunction];
    uint64_t v17 = [v10 YCbCrMatrix];
    char v18 = [v10 YCbCrFullRange];
    uint64_t v19 = [v10 YCbCrColorDepth];

    LOBYTE(v21) = v18;
    int v15 = [(PTColorConversion *)self convertRGBtoYUV:v12 inRGBA:v11 outLuma:v13 outChroma:v14 toLinear:0 transferFunction:v16 colorYCbCrMatrix:v6 colorYCbCrFullRange:v17 colorYCbCrDepthOut:v21 outRect:v19];

    id v11 = (id)v17;
    id v12 = (id)v16;
  }

  return v15;
}

- (void).cxx_destruct
{
  uint64_t v3 = 0;
  BOOL v4 = &self->_convertYUVToRGB[8];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -9);
  for (uint64_t i = 152; i != 80; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i != 8);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)getColorMatrix:(int)a1 toRGB:(NSObject *)a2 fullRange:colorYCbCrDepth:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "Unsupported bit depth: %d", (uint8_t *)v2, 8u);
}

+ (void)getColorMatrix:toRGB:fullRange:colorYCbCrDepth:.cold.2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "YCbCrMatrix is nil", v2, v3, v4, v5, v6);
}

+ (void)getColorMatrix:(uint64_t)a3 toRGB:(uint64_t)a4 fullRange:(uint64_t)a5 colorYCbCrDepth:(uint64_t)a6 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)getTransferFunction:toLinear:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "TransferFunction is nil", v2, v3, v4, v5, v6);
}

+ (void)getTransferFunction:toLinear:.cold.2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "PTRenderPipeline only supports transferFunctions: kCVImageBufferTransferFunction_ITU_R_709_2, kCVImageBufferTransferFunction_ITU_R_2100_HLG, kCVImageBufferTransferFunction_Linear", v2, v3, v4, v5, v6);
}

- (void)convertRGB:inRGBA:outRGBA:toLinear:transferFunction:outRect:.cold.2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "outRect.origin requires imageblock support", v2, v3, v4, v5, v6);
}

- (void)convertRGBtoYUV:inRGBA:outLuma:outChroma:toLinear:transferFunction:colorYCbCrMatrix:colorYCbCrFullRange:colorYCbCrDepthOut:outRect:.cold.2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "outRect does not align with 420", v2, v3, v4, v5, v6);
}

@end