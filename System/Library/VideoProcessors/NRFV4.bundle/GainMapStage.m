@interface GainMapStage
+ (int)prewarmShaders:(id)a3;
- (GainMapStage)initWithMetalContext:(id)a3;
- (float)getExposureBiasFactor:(id)a3 inputIsLinear:(BOOL)a4;
- (float)tableLookup:(float *)a3 withNElements:(float)a4 atNormalizedX:(float)a5;
- (id)flexRangeMetadataDictionary:(id *)a3 mppHeadroom:(float)a4 newHeadroom:(float *)a5;
- (int)allocateLTMTable:(id *)a3 globalLTMCurve:(id *)a4 gtcCurve:(id *)a5 highlightCompressionCurve:(id *)a6 hazeCorrection:texturesWithLTMCurves:HDR:;
- (int)computeGainMapWithInput:(id)a3 secondInput:(id)a4 output:(id)a5 properties:(id)a6 mpconfig:(id *)a7;
- (int)extractAndComputeAverageCurve:(float)a3[65] fromCurves:(const ltmCurves *)a4;
- (int)runWithInput:(id)a3 output:(id)a4 minThreshold:(float)a5 maxThreshold:(float)a6 inputIsLinear:(BOOL)a7 inputScaling:(float)a8;
- (int)runWithInput:(id)a3 secondInput:(id)a4 output:(id)a5 SDRLTMTable:(id)a6 HDRLTMTable:(id)a7 SDRGlobalLTMCurve:(id)a8 HDRGlobalLTMCurve:(id)a9 SDRGTCCurve:(id)a10 HDRGTCCurve:(id)a11 highlightCompression:(id)a12 hazeCorrection:(id *)a13 config:;
- (int)runWithInputDownsampled:(id)a3 output:(id)a4 minThreshold:(float)a5 maxThreshold:(float)a6 inputIsLinear:(BOOL)a7 inputScaling:(float)a8;
- (int)setGainMapConfig:(id *)a3 tuning:(id)a4 frameMetadata:(id)a5 width:(unsigned int)a6 height:(unsigned int)a7 isLinear:(BOOL)a8;
- (int32x2_t)getLtmRoiWidth:(uint64_t)a3 height:(unsigned int)a4 ltmLut:(unsigned int)a5 gridScaleFactor:(_WORD *)a6;
- (void)computeAverageCurve:(float)a3[65] withLTM:(const unsigned __int16 *)a4 andGTC:(const unsigned __int16 *)a5;
- (void)computeMeteorPlusGain:(float *)a3 gainMapValue:(float *)a4 forContentHeadroom:(float)a5 hasFaces:(BOOL)a6;
- (void)normalizeLTMTable:(unsigned __int16 *)a3;
- (void)prepareGainMapMetadata:(id)a3 hasFaces:(BOOL)a4;
@end

@implementation GainMapStage

- (GainMapStage)initWithMetalContext:(id)a3
{
  id v5 = a3;
  if (!v5) {
    goto LABEL_7;
  }
  v11.receiver = self;
  v11.super_class = (Class)GainMapStage;
  v6 = [(GainMapStage *)&v11 init];
  self = v6;
  if (!v6)
  {
    FigDebugAssert3();
    goto LABEL_4;
  }
  *(_WORD *)&v6->_isMeteorPlusPlusEnabled = 257;
  v6->_flexRange10Bit = 0;
  v6->_adjustGammaForInterpretation = 1;
  v6->_defaultGamma = 0.8;
  v6->_adjustMinForInterpretation = 1;
  v6->_defaultMin = 0.0;
  objc_storeStrong((id *)&v6->_metalContext, a3);
  v7 = +[GainMapShared sharedInstance];
  v8 = [v7 getShaders:self->_metalContext];
  shaders = self->_shaders;
  self->_shaders = v8;

  if (!self->_shaders)
  {
LABEL_7:
    FigDebugAssert3();
    FigSignalErrorAt();

    self = 0;
  }
LABEL_4:

  return self;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [[GainMapShaders alloc] initWithMetal:v3];
    if (v4)
    {
      int v5 = 0;
    }
    else
    {
      FigDebugAssert3();
      v4 = 0;
      int v5 = -12786;
    }
  }
  else
  {
    FigDebugAssert3();
    int v5 = FigSignalErrorAt();
    v4 = 0;
  }

  return v5;
}

- (int32x2_t)getLtmRoiWidth:(uint64_t)a3 height:(unsigned int)a4 ltmLut:(unsigned int)a5 gridScaleFactor:(_WORD *)a6
{
  uint64_t LTM_tileWidth = getLTM_tileWidth(a6);
  uint64_t LTM_tileHeight = getLTM_tileHeight(a6);
  unsigned int LTM_validWidth = getLTM_validWidth(a6);
  unsigned int LTM_validHeight = getLTM_validHeight(a6);
  v13.i64[0] = LTM_tileWidth;
  v13.i64[1] = LTM_tileHeight;
  int32x2_t v14 = vcvt_n_s32_f32(vrndm_f32(vmul_f32(vmul_n_f32(vcvt_f32_f64(vcvtq_f64_u64(v13)), a1), (float32x2_t)0x3F0000003F000000)), 1uLL);
  *(int32x2_t *)v13.i8 = vsub_s32((int32x2_t)__PAIR64__(a5, a4), vmul_s32(v14, (int32x2_t)__PAIR64__(LTM_validHeight, LTM_validWidth)));
  return vsra_n_s32(vshr_n_s32((int32x2_t)vsra_n_u32(*(uint32x2_t *)v13.i8, *(uint32x2_t *)v13.i8, 0x1FuLL), 1uLL), (int32x2_t)vsra_n_u32((uint32x2_t)v14, (uint32x2_t)v14, 0x1FuLL), 1uLL);
}

- (float)tableLookup:(float *)a3 withNElements:(float)a4 atNormalizedX:(float)a5
{
  float v5 = (float)(a4 + -1.0) * a5;
  int v6 = vcvtms_s32_f32(v5);
  float v7 = (float)(int)floorf(v5);
  float v8 = v5 - v7;
  float v9 = a4 + -2.0;
  int v10 = (int)v9;
  if (v9 < v7)
  {
    float v11 = v8 + (float)(v7 - v9);
  }
  else
  {
    int v10 = v6;
    float v11 = v8;
  }
  float v12 = v8 + v7;
  BOOL v13 = v6 >= 0;
  if (v6 < 0) {
    int v14 = 0;
  }
  else {
    int v14 = v10;
  }
  if (!v13) {
    float v11 = v12;
  }
  return a3[v14] + (float)((float)(a3[v14 + 1] - a3[v14]) * v11);
}

- (void)computeAverageCurve:(float)a3[65] withLTM:(const unsigned __int16 *)a4 andGTC:(const unsigned __int16 *)a5
{
  float v9 = (char *)malloc_type_calloc(0xC30uLL, 4uLL, 0x100004052888210uLL);
  int v10 = malloc_type_calloc(0x101uLL, 4uLL, 0x100004052888210uLL);
  float v12 = v10;
  int v13 = 0;
  int v14 = v9;
  do
  {
    int v15 = 0;
    v16 = v14;
    v17 = a4;
    do
    {
      for (uint64_t i = 0; i != 65; ++i)
      {
        LOWORD(v11) = v17[i];
        *(float *)&double v11 = (float)LODWORD(v11) / 65535.0;
        *(_DWORD *)&v16[4 * i] = LODWORD(v11);
      }
      ++v15;
      v17 += 65;
      v16 += 260;
    }
    while (v15 != 8);
    ++v13;
    a4 += 520;
    v14 += 2080;
  }
  while (v13 != 6);
  int v19 = 0;
  a3[64] = 0.0;
  HIDWORD(v20) = 0;
  *((_OWORD *)a3 + 14) = 0u;
  *((_OWORD *)a3 + 15) = 0u;
  *((_OWORD *)a3 + 12) = 0u;
  *((_OWORD *)a3 + 13) = 0u;
  *((_OWORD *)a3 + 10) = 0u;
  *((_OWORD *)a3 + 11) = 0u;
  *((_OWORD *)a3 + 8) = 0u;
  *((_OWORD *)a3 + 9) = 0u;
  *((_OWORD *)a3 + 6) = 0u;
  *((_OWORD *)a3 + 7) = 0u;
  *((_OWORD *)a3 + 4) = 0u;
  *((_OWORD *)a3 + 5) = 0u;
  *((_OWORD *)a3 + 2) = 0u;
  *((_OWORD *)a3 + 3) = 0u;
  v21 = v9;
  *(_OWORD *)a3 = 0u;
  *((_OWORD *)a3 + 1) = 0u;
  do
  {
    int v22 = 0;
    v23 = v21;
    do
    {
      for (uint64_t j = 0; j != 65; ++j)
        a3[j] = *(float *)&v23[j * 4] + a3[j];
      ++v22;
      v23 += 260;
    }
    while (v22 != 8);
    ++v19;
    v21 += 2080;
  }
  while (v19 != 6);
  uint64_t v25 = 0;
  float v26 = 1.0 / a3[64];
  do
  {
    a3[v25] = v26 * a3[v25];
    ++v25;
  }
  while (v25 != 65);
  uint64_t v27 = 0;
  LOWORD(v26) = a5[256];
  float v28 = 1.0;
  float v29 = 1.0 / (float)LODWORD(v26);
  do
  {
    LOWORD(v28) = a5[v27];
    float v28 = v29 * (float)LODWORD(v28);
    *((float *)v10 + v27++) = v28;
  }
  while (v27 != 257);
  for (uint64_t k = 0; k != 65; ++k)
  {
    *(float *)&double v11 = a3[k];
    LODWORD(v20) = 1132494848;
    [(GainMapStage *)self tableLookup:v12 withNElements:v20 atNormalizedX:v11];
    a3[k] = *(float *)&v20;
  }
  free(v12);

  free(v9);
}

- (void)normalizeLTMTable:(unsigned __int16 *)a3
{
  v4 = (char *)malloc_type_calloc(0xC30uLL, 4uLL, 0x100004052888210uLL);
  int v6 = 0;
  float v7 = v4;
  float v8 = a3;
  do
  {
    int v9 = 0;
    int v10 = v7;
    double v11 = v8;
    do
    {
      for (uint64_t i = 0; i != 65; ++i)
      {
        LOWORD(v5) = v11[i];
        float v5 = (float)LODWORD(v5) / 65535.0;
        *(float *)&v10[4 * i] = v5;
      }
      ++v9;
      v11 += 65;
      v10 += 260;
    }
    while (v9 != 8);
    ++v6;
    v8 += 520;
    v7 += 2080;
  }
  while (v6 != 6);
  int v13 = 0;
  int v14 = (float *)v4;
  do
  {
    int v15 = 0;
    v16 = v14;
    do
    {
      uint64_t v17 = 0;
      float v18 = 1.0 / v16[64];
      do
      {
        v16[v17] = v18 * v16[v17];
        ++v17;
      }
      while (v17 != 65);
      ++v15;
      v16 += 65;
    }
    while (v15 != 8);
    ++v13;
    v14 += 520;
  }
  while (v13 != 6);
  int v19 = 0;
  double v20 = v4;
  do
  {
    int v21 = 0;
    int v22 = v20;
    v23 = a3;
    do
    {
      for (uint64_t j = 0; j != 65; ++j)
      {
        int v25 = (int)rintf(*(float *)&v22[4 * j] * 65535.0);
        if (v25 >= 0xFFFF) {
          int v25 = 0xFFFF;
        }
        v23[j] = v25 & ~(unsigned __int16)(v25 >> 31);
      }
      ++v21;
      v23 += 65;
      v22 += 260;
    }
    while (v21 != 8);
    ++v19;
    a3 += 520;
    v20 += 2080;
  }
  while (v19 != 6);

  free(v4);
}

- (int)extractAndComputeAverageCurve:(float)a3[65] fromCurves:(const ltmCurves *)a4
{
  uint64_t LTM_ltmCurveEntryCount = getLTM_ltmCurveEntryCount(a4);
  unint64_t LTM_validWidth = getLTM_validWidth(a4);
  unint64_t LTM_validHeight = getLTM_validHeight(a4);
  uint64_t LTM_lutsBytesPerRow = getLTM_lutsBytesPerRow(a4);
  uint64_t LTM_lutsBytesPerColumn = getLTM_lutsBytesPerColumn(a4);
  uint64_t v12 = getLTM_topPadding(a4) * LTM_lutsBytesPerRow;
  uint64_t LTM_leftPadding = getLTM_leftPadding(a4);
  uint64_t LTM_data = getLTM_data(a4, (unint64_t)(v12 + LTM_leftPadding * LTM_lutsBytesPerColumn) >> 1);
  if (LTM_validWidth == 8 && LTM_validHeight == 6 && LTM_ltmCurveEntryCount == 65 && LTM_data && a4->var2.var0 == 257)
  {
    [(GainMapStage *)self computeAverageCurve:a3 withLTM:LTM_data andGTC:a4->var3];
    return 0;
  }
  else
  {
    FigDebugAssert3();
    return -12780;
  }
}

- (int)setGainMapConfig:(id *)a3 tuning:(id)a4 frameMetadata:(id)a5 width:(unsigned int)a6 height:(unsigned int)a7 isLinear:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v9 = *(void *)&a7;
  uint64_t v10 = *(void *)&a6;
  uint64_t v71 = *MEMORY[0x263EF8340];
  int v14 = (char *)a4;
  id v15 = a5;
  v16 = [v15 faces];
  uint64_t v17 = [v16 count];
  float v18 = &OBJC_IVAR___GainMapPlist_withFaces;
  if (!v17) {
    float v18 = &OBJC_IVAR___GainMapPlist_withoutFaces;
  }
  int v19 = &v14[*v18];

  double v20 = (float *)[v15 exposureParams];
  a3->var3 = *(float *)([v15 ltmCurves] + 222264);
  a3->var4 = v20[10];
  [v15 colorCorrectionMatrix];
  a3->var12 = v21;
  *(void *)&a3->var10 = v22;
  a3->var16 = v23;
  *(void *)&a3->var14 = v24;
  a3->var20 = v25;
  *(void *)&a3->var18 = v26;
  a3->var0 = v8;
  a3->var1 = 1;
  a3->var2 = 1.0;
  a3->var5 = 0.0;
  __asm { FMOV            V0.2S, #1.0 }
  *(void *)&a3->var26 = _D0;
  *(void *)&a3->var28 = _D0;
  a3->float var30 = *((float *)v19 + 32);
  a3->var31 = 0.5;
  *(void *)&a3->var32 = 0;
  a3[1].var2 = 0.0;
  float v68 = (float)(v9 * v10);
  a3[1].var3 = 1.0 / v68;
  a3[1].var4 = 1.0;
  if ([v15 hasZoomRects])
  {
    [v15 zoomDstRect];
    float v33 = v32;
    double v34 = v33;
    [v15 zoomSrcRect];
    *(float *)&double v34 = v34 / v35;
    uint64_t v36 = [v15 ltmCurves];
    *(float *)&double v37 = *(float *)&v34 * 0.5;
  }
  else
  {
    uint64_t v36 = [v15 ltmCurves];
    LODWORD(v37) = 0.5;
  }
  [(GainMapStage *)self getLtmRoiWidth:v10 height:v9 ltmLut:v36 gridScaleFactor:v37];
  *(_OWORD *)&a3->var22 = v38;
  if (a3->var1)
  {
    float var30 = a3->var30;
    float v40 = v20[5];
    float v41 = v20[7];
    float v42 = log2f(v40 * v41);
    float v43 = log2f(v20[9]);
    float v44 = log2f(16.0 / (float)(v41 * (float)(v40 * v20[13])));
    float v45 = (float)(int)relu_int(vcvts_n_s32_f32(v44, 8uLL), vcvts_n_s32_f32(*(float *)v19, 8uLL), vcvts_n_s32_f32(*((float *)v19 + 1), 8uLL), vcvts_n_s32_f32(*((float *)v19 + 2), 8uLL), vcvts_n_s32_f32(*((float *)v19 + 3), 8uLL))* 0.0039062;
    float v46 = (float)(int)relu_int(vcvts_n_s32_f32(v43, 8uLL), vcvts_n_s32_f32(*((float *)v19 + 4), 8uLL), vcvts_n_s32_f32(*((float *)v19 + 5), 8uLL), vcvts_n_s32_f32(*((float *)v19 + 6), 8uLL), vcvts_n_s32_f32(*((float *)v19 + 7), 8uLL))* 0.0039062;
    int v47 = relu_int(vcvts_n_s32_f32(v42, 8uLL), vcvts_n_s32_f32(*((float *)v19 + 8), 8uLL), vcvts_n_s32_f32(*((float *)v19 + 9), 8uLL), vcvts_n_s32_f32(*((float *)v19 + 10), 8uLL), vcvts_n_s32_f32(*((float *)v19 + 11), 8uLL));
    float v48 = v20[18];
    float v49 = (float)(v45 + v46) + (float)((float)v47 * 0.0039062);
    float v50 = log2f(var30);
    a3->float var30 = fminf(exp2f((float)(v50 + v49) + (float)(v48 * *((float *)v19 + 49))), 8.0);
  }
  int v51 = -[GainMapStage extractAndComputeAverageCurve:fromCurves:](self, "extractAndComputeAverageCurve:fromCurves:", v70, [v15 ltmCurves]);
  if (v51)
  {
    int v65 = v51;
LABEL_22:
    FigDebugAssert3();
    goto LABEL_19;
  }
  int v52 = -[GainMapStage extractAndComputeAverageCurve:fromCurves:](self, "extractAndComputeAverageCurve:fromCurves:", v69, [v15 HDRltmCurves]);
  if (v52)
  {
    int v65 = v52;
    goto LABEL_22;
  }
  int v54 = *((_DWORD *)v19 + 38);
  double v55 = 0.0;
  float v56 = -1000000.0;
  if (v54 <= 64)
  {
    uint64_t v57 = *((int *)v19 + 38);
    do
    {
      float v58 = v69[v57];
      float v59 = (float)((float)(int)v57 * 0.015625) / v58;
      *(float *)&double v55 = *(float *)&v55 + v59;
      if (v59 > v56) {
        float v56 = (float)((float)(int)v57 * 0.015625) / v58;
      }
      ++v57;
    }
    while (v57 != 65);
  }
  if (v56 <= *((float *)v19 + 54)) {
    *(float *)&double v55 = (float)(int)relu_int((int)(float)((float)(*(float *)&v55 / (float)(65 - v54)) * 100.0), (int)(float)(*((float *)v19 + 35) * 100.0), (int)(float)(*((float *)v19 + 33) * 100.0), (int)(float)(*((float *)v19 + 36) * 100.0), (int)(float)(*((float *)v19 + 34) * 100.0))/ 100.0;
  }
  else {
    LODWORD(v55) = *((_DWORD *)v19 + 33);
  }
  a3->var31 = *(float *)&v55;
  LODWORD(v53) = *((_DWORD *)v19 + 37);
  LODWORD(v55) = 1115815936;
  [(GainMapStage *)self tableLookup:v69 withNElements:v55 atNormalizedX:v53];
  float v61 = v60;
  LODWORD(v62) = *((_DWORD *)v19 + 37);
  LODWORD(v63) = 1115815936;
  [(GainMapStage *)self tableLookup:v70 withNElements:v63 atNormalizedX:v62];
  a3[1].var15 = -(float)(v64 - (float)(v61 * a3->var30));
  a3[1].var16 = *((float *)v19 + 39);
  a3[1].var17 = *((float *)v19 + 40);
  a3[1].var18 = *((float *)v19 + 41);
  *(void *)&a3[1].var19 = *((void *)v19 + 21);
  a3[1].var21 = *((_DWORD *)v19 + 44);
  *(_OWORD *)&a3[1].var22 = *(_OWORD *)(v19 + 180);
  *(_OWORD *)&a3[1].var26 = *(_OWORD *)(v19 + 200);
  *(uint32x2_t *)&a3->var32 = vcvt_u32_f32(vrndm_f32(vmul_n_f32(*(float32x2_t *)(v19 + 64), v68)));
  LODWORD(a3[1].var2) = vcvtms_u32_f32(*((float *)v19 + 18) * v68);
  a3[1].var3 = 1.0 / v68;
  a3[1].var4 = *((float *)v19 + 19);
  [(GainMapStage *)self getExposureBiasFactor:v15 inputIsLinear:v8];
  int v65 = 0;
  a3->var2 = v66;
  *(_OWORD *)&a3[1].var7 = *(_OWORD *)(v19 + 108);
  *(void *)&a3[1].var11 = *(void *)(v19 + 100);
  a3[1].var13 = *((float *)v19 + 24);
  a3[1].var14 = *((float *)v19 + 31);
LABEL_19:

  return v65;
}

- (float)getExposureBiasFactor:(id)a3 inputIsLinear:(BOOL)a4
{
  id v5 = a3;
  float v6 = 1.0;
  if (*(unsigned char *)([v5 exposureParams] + 104)
    && *(unsigned char *)([v5 exposureParams] + 97)
    && ([v5 isEVMFrame] & 1) == 0
    && !a4)
  {
    float v6 = exp2f(-*(float *)([v5 exposureParams] + 68));
  }

  return v6;
}

- (int)runWithInput:(id)a3 secondInput:(id)a4 output:(id)a5 SDRLTMTable:(id)a6 HDRLTMTable:(id)a7 SDRGlobalLTMCurve:(id)a8 HDRGlobalLTMCurve:(id)a9 SDRGTCCurve:(id)a10 HDRGTCCurve:(id)a11 highlightCompression:(id)a12 hazeCorrection:(id *)a13 config:
{
  long long v128 = v13;
  uint64_t v155 = *MEMORY[0x263EF8340];
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v126 = a6;
  id v125 = a7;
  id v124 = a8;
  id v123 = a9;
  id v23 = a12;
  long long v150 = v128;
  uint64_t v24 = [(FigMetalContext *)self->_metalContext allocator];
  float v25 = (void *)[v24 newTextureDescriptor];

  uint64_t v26 = [(FigMetalContext *)self->_metalContext allocator];
  uint64_t v27 = (void *)[v26 newBufferDescriptor];

  id v148 = 0;
  id v149 = 0;
  id v147 = 0;
  id v28 = v20;
  float v29 = v28;
  if (v21)
  {
    id v30 = v21;
    v129 = 0;
    v120 = v29;
  }
  else
  {
    v120 = 0;
    v129 = v28;
  }
  self->_uint64_t gainMapWidth = [v22 width];
  self->_uint64_t gainMapHeight = [v22 height];
  self->_gainMapBaselineOffsetConstant = a13[1].var15;
  self->_gainMapAlternateOffsetConstant = a13[1].var15;
  if (!v25) {
    goto LABEL_56;
  }
  v31 = [v25 desc];
  [v31 setTextureType:2];

  uint64_t gainMapWidth = self->_gainMapWidth;
  float v33 = [v25 desc];
  [v33 setWidth:gainMapWidth];

  uint64_t gainMapHeight = self->_gainMapHeight;
  double v35 = [v25 desc];
  [v35 setHeight:gainMapHeight];

  uint64_t v36 = [v25 desc];
  [v36 setDepth:1];

  double v37 = [v25 desc];
  [v37 setPixelFormat:25];

  long long v38 = [v25 desc];
  [v38 setUsage:3];

  v39 = [v25 desc];
  [v39 setCompressionMode:2];

  float v40 = [v25 desc];
  [v40 setCompressionFootprint:0];

  [v25 setLabel:0];
  float v41 = [(FigMetalContext *)self->_metalContext allocator];
  float v42 = (void *)[v41 newTextureWithDescriptor:v25];
  id v149 = v42;

  if (!v42) {
    goto LABEL_56;
  }
  if (self->_isFlexRange)
  {
    float v43 = [v25 desc];
    [v43 setTextureType:2];

    uint64_t v44 = self->_gainMapWidth;
    float v45 = [v25 desc];
    [v45 setWidth:v44];

    uint64_t v46 = self->_gainMapHeight;
    int v47 = [v25 desc];
    [v47 setHeight:v46];

    float v48 = [v25 desc];
    [v48 setDepth:1];

    float v49 = [v25 desc];
    [v49 setPixelFormat:25];

    float v50 = [v25 desc];
    [v50 setUsage:3];

    int v51 = [v25 desc];
    [v51 setCompressionMode:2];

    int v52 = [v25 desc];
    [v52 setCompressionFootprint:0];

    [v25 setLabel:0];
    double v53 = [(FigMetalContext *)self->_metalContext allocator];
    id v148 = (id)[v53 newTextureWithDescriptor:v25];

    id v115 = v148;
    if (!v148 || !v27) {
      goto LABEL_56;
    }
  }
  else
  {
    id v115 = 0;
    if (!v27)
    {
LABEL_56:
      FigDebugAssert3();
      int v107 = FigSignalErrorAt();
      goto LABEL_39;
    }
  }
  [v27 setLength:1024];
  [v27 setLabel:0];
  int v54 = [(FigMetalContext *)self->_metalContext allocator];
  double v55 = (void *)[v54 newBufferWithDescriptor:v27];
  id v147 = v55;

  if (!v55) {
    goto LABEL_56;
  }
  v122 = v27;
  float v56 = [(FigMetalContext *)self->_metalContext device];
  uint64_t v57 = (MTLBuffer *)[v56 newBufferWithLength:20 options:0];
  extractBuffer = self->_extractBuffer;
  self->_extractBuffer = v57;

  if (!self->_extractBuffer)
  {
    unsigned int v146 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v109 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT);
LABEL_55:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v107 = -73366;
    goto LABEL_39;
  }
  uint64_t v142 = 0;
  int v143 = 0;
  int v141 = 1061997773;
  unint64_t v140 = 0xC2C8000042C80000;
  LOBYTE(v142) = self->_adjustGammaForInterpretation;
  float defaultGamma = self->_defaultGamma;
  *((float *)&v142 + 1) = defaultGamma;
  LOBYTE(v143) = self->_adjustMinForInterpretation;
  float defaultMin = self->_defaultMin;
  float v144 = defaultMin;
  float v61 = [(FigMetalContext *)self->_metalContext device];
  double v62 = (MTLBuffer *)[v61 newBufferWithBytes:&v140 length:28 options:0];
  gainMapMetadataBuffer = self->_gainMapMetadataBuffer;
  self->_gainMapMetadataBuffer = v62;

  if (!self->_gainMapMetadataBuffer)
  {
    unsigned int v146 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v109 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v110 = v146;
    if (os_log_type_enabled(v109, type)) {
      unsigned int v111 = v110;
    }
    else {
      unsigned int v111 = v110 & 0xFFFFFFFE;
    }
    if (v111)
    {
      v151.i32[0] = 136315138;
      *(uint64_t *)((char *)v151.i64 + 4) = (uint64_t)"-[GainMapStage runWithInput:secondInput:output:SDRLTMTable:HDRLTMTab"
                                                    "le:SDRGlobalLTMCurve:HDRGlobalLTMCurve:SDRGTCCurve:HDRGTCCurve:highl"
                                                    "ightCompression:hazeCorrection:config:]";
      _os_log_send_and_compose_impl();
    }
    goto LABEL_55;
  }
  shaders = self->_shaders;
  if (!shaders) {
    goto LABEL_56;
  }
  uint64_t v65 = 32;
  if (!v129) {
    uint64_t v65 = 24;
  }
  id v127 = *(id *)((char *)&shaders->super.isa + v65);
  if (!v127) {
    goto LABEL_56;
  }
  float v66 = self->_shaders;
  if (!v66->_MPPHistogram
    || !v66->_MPPHistExtract
    || !v66->_MPPGainMapAdjust
    || !v66->_MPPGainMapAdjustFlexRange
    || !v66->_MPPLogGainMapMinMax)
  {
    goto LABEL_51;
  }
  uint64_t v67 = 80;
  if (!self->_flexRange10Bit) {
    uint64_t v67 = 88;
  }
  id v121 = *(id *)((char *)&v66->super.isa + v67);
  if (!v121)
  {
LABEL_51:
    FigDebugAssert3();
    int v107 = FigSignalErrorAt();
LABEL_53:

    goto LABEL_39;
  }
  float v68 = [(FigMetalContext *)self->_metalContext commandQueue];
  v69 = [v68 commandBuffer];
  currentCommandBuffer = self->_currentCommandBuffer;
  self->_currentCommandBuffer = v69;

  uint64_t v71 = self->_currentCommandBuffer;
  if (!v71
    || ([(MTLCommandBuffer *)v71 blitCommandEncoder],
        (v72 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    int v107 = FigSignalErrorAt();

    goto LABEL_53;
  }
  v73 = v72;
  v119 = v29;
  objc_msgSend(v72, "fillBuffer:range:value:", v55, 0, objc_msgSend(v55, "length"), 0);
  objc_msgSend(v73, "fillBuffer:range:value:", self->_extractBuffer, 0, -[MTLBuffer length](self->_extractBuffer, "length"), 0);
  [v73 endEncoding];
  v74 = [(MTLCommandBuffer *)self->_currentCommandBuffer computeCommandEncoder];
  if (v74)
  {
    v75 = v74;
    v116 = v73;
    [v74 setComputePipelineState:v127];
    v76 = self->_currentCommandBuffer;
    v117 = v22;
    id v118 = v21;
    if (v129)
    {
      [(MTLCommandBuffer *)v76 setLabel:@"MPPGainMapRGB"];
      [v75 setTexture:v129 atIndex:0];
      [v75 setTexture:v42 atIndex:1];
      [v75 setTexture:v126 atIndex:2];
      [v75 setTexture:v125 atIndex:3];
      [v75 setTexture:v124 atIndex:4];
      [v75 setTexture:v123 atIndex:5];
      [v75 setTexture:v23 atIndex:6];
      float v77 = (float)(unint64_t)[v129 width];
      float v112 = v77 / (float)(unint64_t)[v42 width];
      float v78 = (float)(unint64_t)[v129 height];
      float v79 = v78 / (float)(unint64_t)[v42 height];
      *(float *)&uint64_t v80 = v112;
      *((float *)&v80 + 1) = v79;
      v81 = a13;
      *(void *)&a13->var26 = v80;
    }
    else
    {
      [(MTLCommandBuffer *)v76 setLabel:@"MPPGainMap420"];
      [v75 setTexture:v120 atIndex:0];
      [v75 setTexture:v21 atIndex:1];
      [v75 setTexture:v42 atIndex:2];
      [v75 setTexture:v126 atIndex:3];
      [v75 setTexture:v125 atIndex:4];
      [v75 setTexture:v124 atIndex:5];
      [v75 setTexture:v123 atIndex:6];
      [v75 setTexture:v23 atIndex:7];
      float v82 = (float)(unint64_t)[v120 width];
      float v113 = v82 / (float)(unint64_t)[v42 width];
      float v83 = (float)(unint64_t)[v120 height];
      unint64_t v84 = [v42 height];
      *(float *)&uint64_t v85 = v113;
      *((float *)&v85 + 1) = v83 / (float)v84;
      v81 = a13;
      *(void *)&a13->var26 = v85;
      float v86 = (float)(unint64_t)[v21 width];
      float v114 = v86 / (float)(unint64_t)[v42 width];
      float v87 = (float)(unint64_t)[v21 height];
      float v88 = v87 / (float)(unint64_t)[v42 height];
      *(float *)&uint64_t v89 = v114;
      *((float *)&v89 + 1) = v88;
      *(void *)&a13->var28 = v89;
    }
    [v75 setBytes:v81 length:240 atIndex:0];
    [v75 setBytes:&v150 length:16 atIndex:1];
    unint64_t v90 = [v127 threadExecutionWidth];
    unint64_t v91 = [v127 maxTotalThreadsPerThreadgroup] / v90;
    v139[0] = [v42 width];
    v139[1] = [v42 height];
    v139[2] = 1;
    v138[0] = v90;
    v138[1] = v91;
    v138[2] = 1;
    [v75 dispatchThreads:v139 threadsPerThreadgroup:v138];
    unint64_t v92 = (((unint64_t)[v42 width] >> 1) + 15) >> 4;
    unint64_t v93 = (((unint64_t)[v42 height] >> 1) + 15) >> 4;
    [v75 setComputePipelineState:self->_shaders->_MPPHistogram];
    [v75 setTexture:v42 atIndex:0];
    [v75 setBuffer:v55 offset:0 atIndex:0];
    v153.i64[0] = v92;
    v153.i64[1] = v93;
    uint64_t v154 = 1;
    int64x2_t v151 = vdupq_n_s64(0x10uLL);
    uint64_t v152 = 1;
    [v75 dispatchThreadgroups:&v153 threadsPerThreadgroup:&v151];
    [v75 setComputePipelineState:self->_shaders->_MPPHistExtract];
    [v75 setBuffer:v55 offset:0 atIndex:0];
    [v75 setBytes:a13 length:240 atIndex:1];
    [v75 setBuffer:self->_extractBuffer offset:0 atIndex:2];
    int64x2_t v153 = vdupq_n_s64(1uLL);
    uint64_t v154 = 1;
    int64x2_t v151 = v153;
    uint64_t v152 = 1;
    [v75 dispatchThreadgroups:&v153 threadsPerThreadgroup:&v151];
    v94 = self->_currentCommandBuffer;
    if (self->_isFlexRange)
    {
      [(MTLCommandBuffer *)v94 setLabel:@"MPPGainMapAdjustFlexRange"];
      [v75 setComputePipelineState:self->_shaders->_MPPGainMapAdjustFlexRange];
      [v75 setTexture:v42 atIndex:0];
      [v75 setTexture:v115 atIndex:1];
      [v75 setBytes:a13 length:240 atIndex:0];
      [v75 setBuffer:self->_extractBuffer offset:0 atIndex:1];
      unint64_t v95 = [(MTLComputePipelineState *)self->_shaders->_MPPGainMapAdjustFlexRange threadExecutionWidth];
      unint64_t v96 = [(MTLComputePipelineState *)self->_shaders->_MPPGainMapAdjustFlexRange maxTotalThreadsPerThreadgroup]/ v95;
      v137[0] = [v115 width];
      v137[1] = [v115 height];
      v137[2] = 1;
      v136[0] = v95;
      v136[1] = v96;
      v136[2] = 1;
      [v75 dispatchThreads:v137 threadsPerThreadgroup:v136];
      [v75 setComputePipelineState:self->_shaders->_MPPLogGainMapMinMax];
      [v75 setTexture:v115 atIndex:0];
      [v75 setBuffer:self->_gainMapMetadataBuffer offset:0 atIndex:0];
      unint64_t v97 = [(MTLComputePipelineState *)self->_shaders->_MPPLogGainMapMinMax threadExecutionWidth];
      unint64_t v98 = [(MTLComputePipelineState *)self->_shaders->_MPPLogGainMapMinMax maxTotalThreadsPerThreadgroup]/ v97;
      v135[0] = (unint64_t)([v115 width] + 1) >> 1;
      v135[1] = (unint64_t)([v115 height] + 1) >> 1;
      v135[2] = 1;
      v134[0] = v97;
      v134[1] = v98;
      v134[2] = 1;
      [v75 dispatchThreads:v135 threadsPerThreadgroup:v134];
      [v75 setComputePipelineState:v121];
      [v75 setTexture:v115 atIndex:0];
      id v22 = v117;
      [v75 setTexture:v117 atIndex:1];
      [v75 setBuffer:self->_gainMapMetadataBuffer offset:0 atIndex:0];
      [v75 setBuffer:self->_extractBuffer offset:0 atIndex:1];
      unint64_t v99 = [v121 threadExecutionWidth];
      unint64_t v100 = [v121 maxTotalThreadsPerThreadgroup] / v99;
      v133[0] = [v117 width];
      v133[1] = [v117 height];
      v133[2] = 1;
      v132[0] = v99;
      v132[1] = v100;
      v132[2] = 1;
      v101 = v133;
      v102 = v132;
    }
    else
    {
      [(MTLCommandBuffer *)v94 setLabel:@"MPPGainMapAdjust"];
      [v75 setComputePipelineState:self->_shaders->_MPPGainMapAdjust];
      [v75 setTexture:v42 atIndex:0];
      id v22 = v117;
      [v75 setTexture:v117 atIndex:1];
      [v75 setBytes:a13 length:240 atIndex:0];
      [v75 setBuffer:self->_extractBuffer offset:0 atIndex:1];
      unint64_t v103 = [(MTLComputePipelineState *)self->_shaders->_MPPGainMapAdjust threadExecutionWidth];
      unint64_t v104 = [(MTLComputePipelineState *)self->_shaders->_MPPGainMapAdjust maxTotalThreadsPerThreadgroup]/ v103;
      v131[0] = [v117 width];
      v131[1] = [v117 height];
      v131[2] = 1;
      v130[0] = v103;
      v130[1] = v104;
      v130[2] = 1;
      v101 = v131;
      v102 = v130;
    }
    [v75 dispatchThreads:v101 threadsPerThreadgroup:v102];
    [v75 endEncoding];
    id v21 = v118;
    uint64_t v27 = v122;
    if (*MEMORY[0x263F00E10])
    {
      v105 = [(MTLCommandBuffer *)self->_currentCommandBuffer commandQueue];
      v106 = [v105 commandBuffer];

      [v106 setLabel:@"KTRACE_MTLCMDBUF"];
      [v106 addCompletedHandler:&__block_literal_global_16];
      [v106 commit];
      [(MTLCommandBuffer *)self->_currentCommandBuffer addCompletedHandler:&__block_literal_global_116];
    }
    [(MTLCommandBuffer *)self->_currentCommandBuffer commit];
    FigMetalDecRef();
    FigMetalDecRef();
    FigMetalDecRef();

    int v107 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v107 = FigSignalErrorAt();
  }
  float v29 = v119;
LABEL_39:

  return v107;
}

uint64_t __175__GainMapStage_runWithInput_secondInput_output_SDRLTMTable_HDRLTMTable_SDRGlobalLTMCurve_HDRGlobalLTMCurve_SDRGTCCurve_HDRGTCCurve_highlightCompression_hazeCorrection_config___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __175__GainMapStage_runWithInput_secondInput_output_SDRLTMTable_HDRLTMTable_SDRGlobalLTMCurve_HDRGlobalLTMCurve_SDRGTCCurve_HDRGTCCurve_highlightCompression_hazeCorrection_config___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

- (int)allocateLTMTable:(id *)a3 globalLTMCurve:(id *)a4 gtcCurve:(id *)a5 highlightCompressionCurve:(id *)a6 hazeCorrection:texturesWithLTMCurves:HDR:
{
  uint64_t v8 = v7;
  float v42 = v6;
  int v14 = objc_opt_new();
  id v15 = v14;
  if (!v14)
  {
    FigDebugAssert3();
    int v25 = FigSignalErrorAt();
    id v21 = 0;
    id v24 = 0;
    id v22 = 0;
    id v17 = 0;
    goto LABEL_33;
  }
  [v14 setTextureType:7];
  [v15 setPixelFormat:20];
  [v15 setWidth:65];
  [v15 setHeight:getLTM_validWidth((_WORD *)v8)];
  [v15 setDepth:getLTM_validHeight((_WORD *)v8)];
  [v15 setUsage:3];
  v16 = [(FigMetalContext *)self->_metalContext device];
  id v17 = (id)[v16 newTextureWithDescriptor:v15];

  if (!v17) {
    goto LABEL_36;
  }
  uint64_t v46 = a6;
  float v41 = a5;
  [v15 setTextureType:0];
  [v15 setPixelFormat:20];
  [v15 setWidth:257];
  [v15 setHeight:1];
  [v15 setDepth:1];
  [v15 setUsage:3];
  float v18 = [(FigMetalContext *)self->_metalContext device];
  uint64_t v19 = [v18 newTextureWithDescriptor:v15];

  if (!v19)
  {
LABEL_36:
    FigDebugAssert3();
    int v25 = FigSignalErrorAt();
    id v21 = 0;
    id v24 = 0;
    id v22 = 0;
    goto LABEL_33;
  }
  v39 = a3;
  float v40 = a4;
  [v15 setTextureType:0];
  [v15 setPixelFormat:20];
  [v15 setWidth:257];
  [v15 setHeight:1];
  [v15 setDepth:1];
  [v15 setUsage:3];
  float v45 = self;
  id v20 = [(FigMetalContext *)self->_metalContext device];
  id v21 = (id)[v20 newTextureWithDescriptor:v15];

  if (!v21)
  {
    FigDebugAssert3();
    int v25 = FigSignalErrorAt();
    id v24 = 0;
    id v22 = (id)v19;
    goto LABEL_33;
  }
  uint64_t v44 = v17;
  id v22 = (id)v19;
  if (v46)
  {
    [v15 setTextureType:0];
    [v15 setPixelFormat:20];
    [v15 setWidth:257];
    [v15 setHeight:1];
    [v15 setDepth:1];
    [v15 setUsage:3];
    id v23 = [(FigMetalContext *)v45->_metalContext device];
    id v24 = (id)[v23 newTextureWithDescriptor:v15];

    if (!v24)
    {
      FigDebugAssert3();
      int v25 = FigSignalErrorAt();
      goto LABEL_33;
    }
  }
  else
  {
    id v24 = 0;
  }
  float v43 = v24;
  uint64_t LTM_ltmCurveEntryCount = getLTM_ltmCurveEntryCount((_WORD *)v8);
  unint64_t LTM_validWidth = getLTM_validWidth((_WORD *)v8);
  unint64_t LTM_validHeight = getLTM_validHeight((_WORD *)v8);
  uint64_t LTM_lutsBytesPerRow = getLTM_lutsBytesPerRow((_WORD *)v8);
  uint64_t LTM_lutsBytesPerColumn = getLTM_lutsBytesPerColumn((_WORD *)v8);
  uint64_t v31 = getLTM_topPadding((_WORD *)v8) * LTM_lutsBytesPerRow;
  uint64_t LTM_leftPadding = getLTM_leftPadding((_WORD *)v8);
  uint64_t LTM_data = getLTM_data((_WORD *)v8, (unint64_t)(v31 + LTM_leftPadding * LTM_lutsBytesPerColumn) >> 1);
  double v34 = (const void *)LTM_data;
  if ((LTM_validWidth != 8 || LTM_validHeight != 6) && (LTM_validWidth != 16 || LTM_validHeight != 12)
    || LTM_ltmCurveEntryCount != 65
    || !LTM_data)
  {
    FigDebugAssert3();
    int v25 = -12780;
    id v24 = v43;
    id v17 = v44;
    goto LABEL_33;
  }
  long long v38 = v21;
  if (v52)
  {
    double v35 = malloc_type_malloc(2 * 65 * LTM_validWidth * LTM_validHeight, 0xDF5ACBCBuLL);
    if (!v35)
    {
      FigDebugAssert3();
      int v25 = -12780;
      id v24 = v43;
      id v17 = v44;
      goto LABEL_42;
    }
    uint64_t v36 = v35;
    memmove(v35, v34, 2 * 65 * LTM_validWidth * LTM_validHeight);
    [(GainMapStage *)v45 normalizeLTMTable:v36];
    double v34 = v36;
  }
  else
  {
    uint64_t v36 = 0;
  }
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  *(void *)&long long v50 = 65;
  *((void *)&v50 + 1) = LTM_validWidth;
  uint64_t v51 = LTM_validHeight;
  id v17 = v44;
  [v44 replaceRegion:&v47 mipmapLevel:0 slice:0 withBytes:v34 bytesPerRow:LTM_lutsBytesPerColumn bytesPerImage:LTM_lutsBytesPerRow];
  if (v52) {
    free(v36);
  }
  id v24 = v43;
  if (*(_WORD *)(v8 + 221232) != 257)
  {
    FigDebugAssert3();
    int v25 = -12780;
LABEL_42:
    id v21 = v38;
    goto LABEL_33;
  }
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  long long v50 = xmmword_263480550;
  uint64_t v51 = 1;
  [v22 replaceRegion:&v47 mipmapLevel:0 slice:0 withBytes:v8 + 221234 bytesPerRow:0 bytesPerImage:0];
  id v21 = v38;
  if (*(_WORD *)(v8 + 221748) == 257)
  {
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    long long v50 = xmmword_263480550;
    uint64_t v51 = 1;
    [v38 replaceRegion:&v47 mipmapLevel:0 slice:0 withBytes:v8 + 221750 bytesPerRow:0 bytesPerImage:0];
    if (v46)
    {
      if (*(unsigned char *)(v8 + 223044))
      {
        uint64_t v47 = 0;
        uint64_t v48 = 0;
        uint64_t v49 = 0;
        long long v50 = xmmword_263480550;
        uint64_t v51 = 1;
        [v43 replaceRegion:&v47 mipmapLevel:0 slice:0 withBytes:v8 + 222530 bytesPerRow:0 bytesPerImage:0];
      }
      else
      {

        id v24 = 0;
      }
    }
    if (v42 && *(unsigned char *)(v8 + 223072)) {
      *float v42 = *(_OWORD *)(v8 + 223056);
    }
    id v17 = v44;
    id *v39 = v17;
    id v22 = v22;
    *float v40 = v22;
    id v21 = v38;
    *float v41 = v21;
    if (v46)
    {
      id v24 = v24;
      int v25 = 0;
      *uint64_t v46 = v24;
    }
    else
    {
      int v25 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    int v25 = -12780;
  }
LABEL_33:

  return v25;
}

- (int)computeGainMapWithInput:(id)a3 secondInput:(id)a4 output:(id)a5 properties:(id)a6 mpconfig:(id *)a7
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  long long v55 = 0uLL;
  unsigned int v16 = [v14 width];
  float v45 = v14;
  unsigned int v17 = [v14 height];
  id v18 = v12;
  uint64_t v19 = v18;
  uint64_t v44 = v15;
  if (v13)
  {
    id v20 = v13;
    if (v19)
    {
      float v42 = 0;
      float v43 = v19;
      goto LABEL_8;
    }
    goto LABEL_25;
  }
  if (!v18)
  {
LABEL_25:
    FigDebugAssert3();
    float v42 = 0;
    float v43 = 0;
    goto LABEL_26;
  }
  if ([v18 width] <= (unint64_t)v16 || objc_msgSend(v19, "height") <= (unint64_t)v17)
  {
    FigDebugAssert3();
    float v42 = v19;
    float v43 = 0;
LABEL_26:
    id v25 = 0;
    id v26 = 0;
    id v27 = 0;
    id v32 = 0;
    id v33 = 0;
    id v34 = 0;
    id v28 = 0;
    int v24 = -12780;
    goto LABEL_21;
  }
  float v42 = v19;
  float v43 = 0;
LABEL_8:
  id v21 = [v15 meta];
  int v22 = [v21 metadataHasLtmCurves];

  if (!v22)
  {
    id v41 = v13;
    id v28 = 0;
    id v27 = 0;
    id v26 = 0;
    id v25 = 0;
LABEL_16:
    int v50 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    double v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    id v32 = 0;
    id v33 = 0;
    id v34 = 0;
    int v24 = -73366;
    goto LABEL_20;
  }
  v39 = a7;
  id v53 = 0;
  id v54 = 0;
  id v51 = 0;
  id v52 = 0;
  id v23 = [v15 meta];
  LOBYTE(v37) = 0;
  float v40 = self;
  int v24 = -[GainMapStage allocateLTMTable:globalLTMCurve:gtcCurve:highlightCompressionCurve:hazeCorrection:texturesWithLTMCurves:HDR:](self, "allocateLTMTable:globalLTMCurve:gtcCurve:highlightCompressionCurve:hazeCorrection:texturesWithLTMCurves:HDR:", &v54, &v53, &v52, &v51, &v55, [v23 ltmCurves], v37);
  id v25 = v54;
  id v26 = v53;
  id v27 = v52;
  id v28 = v51;

  if (v24)
  {
    id v32 = 0;
    id v33 = 0;
    id v34 = 0;
    goto LABEL_21;
  }
  if (!v25 || !v26)
  {
    id v41 = v13;
    goto LABEL_16;
  }
  float v29 = [v15 meta];
  int v30 = [v29 metadataHasHDRLtmCurves];

  if (v30)
  {
    id v41 = v13;
    id v47 = 0;
    id v48 = 0;
    id v46 = 0;
    uint64_t v31 = [v15 meta];
    LOBYTE(v38) = 1;
    int v24 = -[GainMapStage allocateLTMTable:globalLTMCurve:gtcCurve:highlightCompressionCurve:hazeCorrection:texturesWithLTMCurves:HDR:](v40, "allocateLTMTable:globalLTMCurve:gtcCurve:highlightCompressionCurve:hazeCorrection:texturesWithLTMCurves:HDR:", &v48, &v47, &v46, 0, 0, [v31 HDRltmCurves], v38);
    id v32 = v48;
    id v33 = v47;
    id v34 = v46;

    if (!v24)
    {
      id v13 = v41;
      goto LABEL_18;
    }
LABEL_20:
    id v13 = v41;
    goto LABEL_21;
  }
  id v32 = v25;
  id v33 = v26;
  id v34 = v27;
LABEL_18:
  int v24 = [(GainMapStage *)v40 runWithInput:v19 secondInput:v13 output:v45 SDRLTMTable:v25 HDRLTMTable:v32 SDRGlobalLTMCurve:v26 HDRGlobalLTMCurve:*(double *)&v55 SDRGTCCurve:v33 HDRGTCCurve:v27 highlightCompression:v27 hazeCorrection:v28 config:v39];
  if (!v24)
  {

    id v25 = 0;
    id v26 = 0;
    id v27 = 0;
    id v32 = 0;
    id v33 = 0;
    id v34 = 0;
    id v28 = 0;
  }
LABEL_21:

  return v24;
}

- (void)computeMeteorPlusGain:(float *)a3 gainMapValue:(float *)a4 forContentHeadroom:(float)a5 hasFaces:(BOOL)a6
{
  BOOL v6 = a6;
  float v7 = a5;
  if (a5 <= 0.0)
  {
    uint64_t v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    float v7 = 3.0;
  }
  if (a3)
  {
    float v11 = 1.01;
    if (v6) {
      float v11 = 0.99;
    }
    *a3 = v11;
  }
  else
  {
    id v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  float v13 = log2f(v7);
  if (a4)
  {
    if (v6)
    {
      float v14 = (float)(v13 * -0.05) + 0.09;
      float v15 = (float)(v13 * -9.9) + 15.851;
      float v16 = 1.6;
    }
    else
    {
      float v14 = (float)(v13 * -0.014286) + 0.042857;
      float v15 = (float)(v13 * -3.3) + 7.6;
      float v16 = 2.3;
    }
    if (v13 < v16) {
      float v18 = v15;
    }
    else {
      float v18 = v14;
    }
    *a4 = v18;
  }
  else
  {
    unsigned int v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (id)flexRangeMetadataDictionary:(id *)a3 mppHeadroom:(float)a4 newHeadroom:(float *)a5
{
  v32[12] = *MEMORY[0x263EF8340];
  float v9 = exp2f(a3->var1.var1);
  float v10 = fmaxf((float)(v9 * 5.5) / a4, 1.0);
  if (vabds_f32(a4, v9) >= 0.5) {
    float v9 = v10;
  }
  *a5 = v9;
  float v11 = log2f(v9);
  uint64_t v12 = *MEMORY[0x263F2F050];
  v31[0] = *MEMORY[0x263F2F060];
  v31[1] = v12;
  v32[0] = @"1.0";
  v32[1] = &unk_270E987A0;
  v31[2] = *MEMORY[0x263F2F028];
  float v13 = [NSNumber numberWithInt:self->_gainMapWidth];
  v32[2] = v13;
  v31[3] = *MEMORY[0x263F2F020];
  float v14 = [NSNumber numberWithInt:self->_gainMapHeight];
  v32[3] = v14;
  v31[4] = *MEMORY[0x263F2F058];
  if (self->_flexRange10Bit) {
    uint64_t v15 = 10;
  }
  else {
    uint64_t v15 = 8;
  }
  float v16 = [NSNumber numberWithInt:v15];
  v32[4] = v16;
  v31[5] = *MEMORY[0x263F2F048];
  LODWORD(v17) = a3->var0.var0;
  float v18 = [NSNumber numberWithFloat:v17];
  v32[5] = v18;
  v31[6] = *MEMORY[0x263F2F038];
  *(float *)&double v19 = v11;
  id v20 = [NSNumber numberWithFloat:v19];
  v32[6] = v20;
  v31[7] = *MEMORY[0x263F2F030];
  *(float *)&double v21 = a3->var2;
  int v22 = [NSNumber numberWithFloat:v21];
  uint64_t v23 = *MEMORY[0x263F2F018];
  v32[7] = v22;
  v32[8] = &unk_270E992E8;
  uint64_t v24 = *MEMORY[0x263F2F008];
  v31[8] = v23;
  v31[9] = v24;
  uint64_t v25 = *MEMORY[0x263F2F010];
  v32[9] = &unk_270E992E8;
  v32[10] = &unk_270E97998;
  uint64_t v26 = *MEMORY[0x263F2F000];
  v31[10] = v25;
  v31[11] = v26;
  *(float *)&double v27 = v11;
  id v28 = [NSNumber numberWithFloat:v27];
  v32[11] = v28;
  float v29 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:12];

  return v29;
}

- (void)prepareGainMapMetadata:(id)a3 hasFaces:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v35 = 0;
  memset(v34, 0, 28);
  if (self->_isMeteorPlusPlusEnabled)
  {
    [(MTLCommandBuffer *)self->_currentCommandBuffer waitUntilCompleted];
    currentCommandBuffer = self->_currentCommandBuffer;
    self->_currentCommandBuffer = 0;

    uint64_t v8 = [(MTLBuffer *)self->_extractBuffer contents];
    if (v8) {
      float meteorPlusHeadroom = *(float *)(v8 + 12);
    }
    else {
      float meteorPlusHeadroom = 4.0;
    }
    if (self->_isFlexRange)
    {
      float v10 = (_OWORD *)[(MTLBuffer *)self->_gainMapMetadataBuffer contents];
      if (v10)
      {
        v34[0] = *v10;
        *(_OWORD *)((char *)v34 + 12) = *(_OWORD *)((char *)v10 + 12);
      }
      else
      {
        float v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
  }
  else
  {
    float meteorPlusHeadroom = self->_meteorPlusHeadroom;
  }
  if (self->_isMeteorPlusPlusEnabled) {
    uint64_t v12 = 0x20000;
  }
  else {
    uint64_t v12 = 0x10000;
  }
  float v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v12, v32, v33);
  [v6 setObject:v13 forKeyedSubscript:*MEMORY[0x263F2F070]];

  *(float *)&double v14 = meteorPlusHeadroom;
  uint64_t v15 = [NSNumber numberWithFloat:v14];
  uint64_t v16 = *MEMORY[0x263F2F068];
  [v6 setObject:v15 forKeyedSubscript:*MEMORY[0x263F2F068]];

  *(float *)&double v17 = meteorPlusHeadroom;
  [(GainMapStage *)self computeMeteorPlusGain:(char *)&v35 + 4 gainMapValue:&v35 forContentHeadroom:v4 hasFaces:v17];
  LODWORD(v18) = HIDWORD(v35);
  double v19 = [NSNumber numberWithFloat:v18];
  uint64_t v20 = *MEMORY[0x263F2F108];
  [v6 setObject:v19 forKeyedSubscript:*MEMORY[0x263F2F108]];

  LODWORD(v21) = v35;
  int v22 = [NSNumber numberWithFloat:v21];
  uint64_t v23 = *MEMORY[0x263F2F100];
  [v6 setObject:v22 forKeyedSubscript:*MEMORY[0x263F2F100]];

  if (self->_isFlexRange)
  {
    int v36 = 0;
    v37[0] = v34[0];
    *(_OWORD *)((char *)v37 + 12) = *(_OWORD *)((char *)v34 + 12);
    uint64_t v24 = [(GainMapStage *)self flexRangeMetadataDictionary:v37 mppHeadroom:&v36 newHeadroom:COERCE_DOUBLE(__PAIR64__(v34[1], LODWORD(meteorPlusHeadroom)))];
    [v6 setObject:v24 forKeyedSubscript:*MEMORY[0x263F2F040]];
    LODWORD(v25) = v36;
    [(GainMapStage *)self computeMeteorPlusGain:(char *)&v35 + 4 gainMapValue:&v35 forContentHeadroom:v4 hasFaces:v25];
    LODWORD(v26) = HIDWORD(v35);
    double v27 = [NSNumber numberWithFloat:v26];
    [v6 setObject:v27 forKeyedSubscript:v20];

    LODWORD(v28) = v35;
    float v29 = [NSNumber numberWithFloat:v28];
    [v6 setObject:v29 forKeyedSubscript:v23];

    LODWORD(v30) = v36;
    uint64_t v31 = [NSNumber numberWithFloat:v30];
    [v6 setObject:v31 forKeyedSubscript:v16];
  }
}

- (int)runWithInput:(id)a3 output:(id)a4 minThreshold:(float)a5 maxThreshold:(float)a6 inputIsLinear:(BOOL)a7 inputScaling:(float)a8
{
  id v12 = a3;
  id v13 = a4;
  double v14 = v13;
  unint64_t v37 = 0;
  uint64_t v38 = 0;
  self->_float meteorPlusHeadroom = a8 * 4.0;
  if (v12
    && v13
    && (unint64_t v15 = [v12 width], v15 >= objc_msgSend(v14, "width"))
    && (unint64_t v16 = [v12 height], v16 >= objc_msgSend(v14, "height"))
    && (unsigned int v17 = [v12 width],
        uint64_t v18 = v17 / [v14 width],
        unsigned int v19 = [v12 height],
        v18 == v19 / [v14 height])
    && (unint64_t v20 = [v14 width] * v18 + 15, (objc_msgSend(v12, "width") + 15) >> 4 == v20 >> 4)
    && (unint64_t v21 = [v14 height] * v18 + 15, (objc_msgSend(v12, "height") + 15) >> 4 == v21 >> 4))
  {
    shaders = self->_shaders;
    if (shaders
      && shaders->_gainMapFilter
      && ([(FigMetalContext *)self->_metalContext commandQueue],
          uint64_t v23 = objc_claimAutoreleasedReturnValue(),
          [v23 commandBuffer],
          uint64_t v24 = objc_claimAutoreleasedReturnValue(),
          v23,
          v24))
    {
      double v25 = [v24 computeCommandEncoder];
      if (v25)
      {
        double v26 = v25;
        unint64_t v37 = __PAIR64__(LODWORD(a6), LODWORD(a5));
        LOBYTE(v38) = a7;
        *((float *)&v38 + 1) = a8;
        [v25 setComputePipelineState:self->_shaders->_gainMapFilter];
        [v26 setTexture:v12 atIndex:0];
        [v26 setTexture:v14 atIndex:1];
        [v26 setBytes:&v37 length:16 atIndex:0];
        unint64_t v27 = [(MTLComputePipelineState *)self->_shaders->_gainMapFilter threadExecutionWidth];
        unint64_t v28 = [(MTLComputePipelineState *)self->_shaders->_gainMapFilter maxTotalThreadsPerThreadgroup]/ v27;
        v36[0] = (unint64_t)[v14 width] >> 1;
        v36[1] = (unint64_t)[v14 height] >> 1;
        v36[2] = 1;
        v35[0] = v27;
        v35[1] = v28;
        v35[2] = 1;
        [v26 dispatchThreads:v36 threadsPerThreadgroup:v35];
        [v26 endEncoding];
        if (*MEMORY[0x263F00E10])
        {
          float v29 = [v24 commandQueue];
          double v30 = [v29 commandBuffer];

          [v30 setLabel:@"KTRACE_MTLCMDBUF"];
          [v30 addCompletedHandler:&__block_literal_global_161];
          [v30 commit];
          [v24 addCompletedHandler:&__block_literal_global_163];
        }
        [v24 commit];

        int v31 = 0;
      }
      else
      {
        FigDebugAssert3();
        int v31 = FigSignalErrorAt();
      }
    }
    else
    {
      FigDebugAssert3();
      int v31 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v31 = -12780;
  }

  return v31;
}

uint64_t __89__GainMapStage_runWithInput_output_minThreshold_maxThreshold_inputIsLinear_inputScaling___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __89__GainMapStage_runWithInput_output_minThreshold_maxThreshold_inputIsLinear_inputScaling___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

- (int)runWithInputDownsampled:(id)a3 output:(id)a4 minThreshold:(float)a5 maxThreshold:(float)a6 inputIsLinear:(BOOL)a7 inputScaling:(float)a8
{
  id v12 = a3;
  id v13 = a4;
  double v14 = v13;
  unint64_t v37 = 0;
  uint64_t v38 = 0;
  self->_float meteorPlusHeadroom = a8 * 4.0;
  if (v12
    && v13
    && (unint64_t v15 = [v12 width], v15 >= objc_msgSend(v14, "width"))
    && (unint64_t v16 = [v12 height], v16 >= objc_msgSend(v14, "height"))
    && (unsigned int v17 = [v12 width],
        uint64_t v18 = v17 / [v14 width],
        unsigned int v19 = [v12 height],
        v18 == v19 / [v14 height])
    && (unint64_t v20 = [v14 width] * v18 + 15, (objc_msgSend(v12, "width") + 15) >> 4 == v20 >> 4)
    && (unint64_t v21 = [v14 height] * v18 + 15, (objc_msgSend(v12, "height") + 15) >> 4 == v21 >> 4))
  {
    shaders = self->_shaders;
    if (shaders
      && shaders->_gainMapDownsampledFilter
      && ([(FigMetalContext *)self->_metalContext commandQueue],
          uint64_t v23 = objc_claimAutoreleasedReturnValue(),
          [v23 commandBuffer],
          uint64_t v24 = objc_claimAutoreleasedReturnValue(),
          v23,
          v24))
    {
      double v25 = [v24 computeCommandEncoder];
      if (v25)
      {
        double v26 = v25;
        unint64_t v37 = __PAIR64__(LODWORD(a6), LODWORD(a5));
        LOBYTE(v38) = a7;
        *((float *)&v38 + 1) = a8;
        [v25 setComputePipelineState:self->_shaders->_gainMapDownsampledFilter];
        [v26 setTexture:v12 atIndex:0];
        [v26 setTexture:v14 atIndex:1];
        [v26 setBytes:&v37 length:16 atIndex:0];
        unint64_t v27 = [(MTLComputePipelineState *)self->_shaders->_gainMapDownsampledFilter threadExecutionWidth];
        unint64_t v28 = [(MTLComputePipelineState *)self->_shaders->_gainMapDownsampledFilter maxTotalThreadsPerThreadgroup]/ v27;
        v36[0] = [v14 width];
        v36[1] = [v14 height];
        v36[2] = 1;
        v35[0] = v27;
        v35[1] = v28;
        v35[2] = 1;
        [v26 dispatchThreads:v36 threadsPerThreadgroup:v35];
        [v26 endEncoding];
        if (*MEMORY[0x263F00E10])
        {
          float v29 = [v24 commandQueue];
          double v30 = [v29 commandBuffer];

          [v30 setLabel:@"KTRACE_MTLCMDBUF"];
          [v30 addCompletedHandler:&__block_literal_global_166];
          [v30 commit];
          [v24 addCompletedHandler:&__block_literal_global_168];
        }
        [v24 commit];

        int v31 = 0;
      }
      else
      {
        FigDebugAssert3();
        int v31 = FigSignalErrorAt();
      }
    }
    else
    {
      FigDebugAssert3();
      int v31 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v31 = -12780;
  }

  return v31;
}

uint64_t __100__GainMapStage_runWithInputDownsampled_output_minThreshold_maxThreshold_inputIsLinear_inputScaling___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __100__GainMapStage_runWithInputDownsampled_output_minThreshold_maxThreshold_inputIsLinear_inputScaling___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gainMapMetadataBuffer, 0);
  objc_storeStrong((id *)&self->_extractBuffer, 0);
  objc_storeStrong((id *)&self->_currentCommandBuffer, 0);
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end