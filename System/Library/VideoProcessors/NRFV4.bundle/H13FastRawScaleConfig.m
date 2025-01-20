@interface H13FastRawScaleConfig
- (BOOL)shouldMatchGenregs;
- (H13FastRawScaleConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputPixelFormat:(unsigned int)a5;
- (float)pdcInterpX:(float)a3 fromRangeStartingAt:(float)a4 endingAt:(float)a5 toRangeStartingAt:(float)a6 endingAt:(float)a7;
- (id)getBlackLevelShadingCorrectionTextureForInputFrame:(id)a3;
- (id)getShadingFPNCorrectionTextureForInputFrame:(id)a3;
- (int)_createDetectionLutTexsWithArgs:(id)a3 metalCtx:(id)a4;
- (int)_createFlatLUTTexWithData:(const unsigned __int16 *)a3 lutSize:(unint64_t)a4 metalCtx:(id)a5 destArgs:(id)a6;
- (int)_createQuadraStaticDefectTableWithLocations:(id *)a3 defectLocationCount:(unsigned int)a4 metalCtx:(id)a5 destArgs:(id)a6;
- (int)_createStaticDefectTableWithLocations:(id *)a3 defectLocationCount:(unsigned int)a4 metalCtx:(id)a5 destArgs:(id)a6 inputFrame:(id)a7;
- (int)_createXtalkTexWithData:(id)a3 metalCtx:(id)a4 pdcArgs:(id)a5 pdcXtalkConfig:(id *)a6;
- (int)_createXtalkTexWithData:(id)a3 metalCtx:(id)a4 pdcArgs:(id)a5 pdcXtalkConfig:(id *)a6 neighborCount:(unint64_t)a7;
- (int)_fillPDPCorrectionConfig:(id *)a3 gainAdj:(id *)a4 pdpConfig:(id *)a5 gocConfig:(id *)a6;
- (int)_fillProcessFocusPixelsConfigWithPDPConfig:(id *)a3 args:(id)a4 gainAdj:(id *)a5;
- (int)_filterStaticDefectTableWithLocations:(id *)a3 defectLocationCount:(unsigned int)a4 fromDefectLocations:(id *)a5 defectLocationCountToRemove:(unsigned int)a6 outputFilteredDefectLocations:(id *)a7 filteredDefectLocationCount:(unsigned int)a8;
- (int)configureFromMetadataPDCArgs:(id)a3 forInputFrame:(id)a4 forOutputFrame:(id)a5 metalCtx:(id)a6 pdpConfig:(id *)a7 bounds:(id)a8;
- (int)configureFromRegistersPDCArgs:(id)a3 forInputFrame:(id)a4 metalCtx:(id)a5 pdpConfig:(id *)a6;
- (int)configurePDCArgs:(id)a3 forInputFrame:(id)a4 forOutputFrame:(id)a5 bounds:(id)a6 metalCtx:(id)a7 pdpConfig:(id *)a8;
- (int)generateGOCConfigFromInputFrameMetadata:(id)a3 toGocConfig:(id *)a4;
- (int)generatePDPConfigFromInputFrameMetadata:(id)a3 bounds:(id)a4 toPdpConfig:(id *)a5;
- (int)getABLESTConfigForInputFrame:(id)a3 pdpConfig:(id *)a4 ablestConfig:(id *)a5;
- (int)getABLESTEnabledForInputFrame:(id)a3 enabled:(BOOL *)a4;
- (int)getBLCGOCConfigForInputFrame:(id)a3 gocConfig:(id *)a4;
- (int)getBlackLevelEstimationConfigForInputFrame:(id)a3 pdpConfig:(id *)a4 blackLevelEstimationConfig:(id *)a5;
- (int)getBlackLevelEstimationEnabledForInputFrame:(id)a3 enabled:(BOOL *)a4;
- (int)getBlackLevelShadingConfigForInputFrame:(id)a3 blackLevelShadingConfig:(id *)a4;
- (int)getDMAInputConfigForInputFrame:(id)a3 dmaInputConfig:(id *)a4;
- (int)getHOCLConfigForInputFrame:(H13FastRawScaleConfig *)self forInputFrame:(SEL)a2 metalCtx:(id)a3 softISPModuleConfig:(id)a4 lscMetadata:(id)a5 bounds:(id)a6 isQuadra:(id *)a7;
- (int)getPDPConfigForInputFrame:(id)a3 bounds:(id)a4 pdpConfig:(id *)a5;
- (int)getPDPGainsForInputFrame:(id)a3 pdpGainsTex:(id)a4;
- (int)getRFPNConfigForInputFrame:(id)a3 rFPNConfig:(id *)a4;
- (int)getShadingFPNRConfigForInputFrame:(id)a3 shadingFPNRConfig:(id *)a4;
- (int)getSyntheticThumbnailConfigForInputFrame:(id)a3 bounds:(id)a4 syntheticThumbnailConfig:(SyntheticThumbnailConfig *)a5;
- (void)generateNoiseModelsFromBinningFactor:(float)a3 NoiseModel:(id)a4 AnalogGain:(float)a5 DigitalGain:(float)a6 PreGain:(unsigned int)a7 forFocusPixels:(float)a8[33] forDefects:(float)a9[33];
- (void)setShouldMatchGenregs:(BOOL)a3;
@end

@implementation H13FastRawScaleConfig

- (float)pdcInterpX:(float)a3 fromRangeStartingAt:(float)a4 endingAt:(float)a5 toRangeStartingAt:(float)a6 endingAt:(float)a7
{
  float v7 = 0.0;
  if (a4 != a5) {
    float v7 = (float)(a3 - a4) / (float)(a5 - a4);
  }
  float v8 = fminf(v7, 1.0);
  if (v8 < 0.0) {
    float v8 = 0.0;
  }
  return (float)(v8 * a7) + (float)((float)(1.0 - v8) * a6);
}

- (void)generateNoiseModelsFromBinningFactor:(float)a3 NoiseModel:(id)a4 AnalogGain:(float)a5 DigitalGain:(float)a6 PreGain:(unsigned int)a7 forFocusPixels:(float)a8[33] forDefects:(float)a9[33]
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v16 = a4;
  v17 = [v16 objectForKeyedSubscript:@"ReadNoise1x"];
  [v17 floatValue];
  float v19 = v18;

  v20 = [v16 objectForKeyedSubscript:@"ReadNoise8x"];
  [v20 floatValue];
  float v22 = v21;

  v23 = [v16 objectForKeyedSubscript:@"ConversionGain"];
  [v23 floatValue];
  float v25 = v24;

  v41[0] = v19;
  v41[1] = v22;
  if ([(H13FastRawScaleConfig *)self shouldMatchGenregs]) {
    int v26 = 3806;
  }
  else {
    int v26 = 3616;
  }
  PDCGetNoiseStdDev(v41, v26, a3, (uint64_t)&kPDCNoiseModelIn_x33_Regular, (uint64_t)a8, v25, a5 * a6);
  PDCGetNoiseStdDev(v41, 4096, a3, (uint64_t)&kPDCNoiseModelIn_x33_Adaptive, (uint64_t)v40, v25, a5);
  if (a6 > 1.0)
  {
    uint64_t v27 = 0;
    float v28 = v40[0] * v40[0];
    do
    {
      float v29 = v28 + (float)((float)((float)(v40[v27] * v40[v27]) - v28) / a6);
      float v30 = fabsf(sqrtf(v29));
      BOOL v31 = v29 == -INFINITY;
      float v32 = INFINITY;
      if (!v31) {
        float v32 = v30;
      }
      v40[v27++] = v32 * a6;
    }
    while (v27 != 33);
  }
  uint64_t v33 = 0;
  float v34 = (float)a7 * 0.00024414;
  float v35 = v40[0] * v40[0];
  do
  {
    float v36 = v35 + (float)((float)((float)(v40[v33] * v40[v33]) - v35) / v34);
    float v37 = fabsf(sqrtf(v36));
    BOOL v31 = v36 == -INFINITY;
    float v38 = INFINITY;
    if (!v31) {
      float v38 = v37;
    }
    v40[v33++] = v34 * v38;
  }
  while (v33 != 33);
  interp1f((uint64_t)&kPDCNoiseModelIn_x33_Adaptive, 33, (uint64_t)v40, (uint64_t)&kPDCNoiseModelIn_x5_Regular, 5, 0, (uint64_t)v39);
  interp1f((uint64_t)&kPDCNoiseModelIn_x5_Regular, 5, (uint64_t)v39, (uint64_t)&kPDCNoiseModelIn_x33_Regular, 33, 0, (uint64_t)a9);
}

- (int)configureFromRegistersPDCArgs:(id)a3 forInputFrame:(id)a4 metalCtx:(id)a5 pdpConfig:(id *)a6
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  v9 = (float32x2_t *)a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9) {
    goto LABEL_174;
  }
  if (!v10) {
    goto LABEL_174;
  }
  v12 = -[SoftISPInputFrame registers]((uint64_t)v10);

  if (!v12 || !v11) {
    goto LABEL_174;
  }
  *(_OWORD *)v9[14].f32 = 0u;
  *(_OWORD *)v9[16].f32 = 0u;
  *(_OWORD *)v9[10].f32 = 0u;
  *(_OWORD *)v9[12].f32 = 0u;
  *(_OWORD *)v9[8].f32 = 0u;
  *(_OWORD *)v9[4].f32 = 0u;
  *(_OWORD *)v9[6].f32 = 0u;
  *(_OWORD *)v9[38].f32 = 0u;
  *(_OWORD *)v9[40].f32 = 0u;
  *(_OWORD *)v9[34].f32 = 0u;
  *(_OWORD *)v9[36].f32 = 0u;
  *(_OWORD *)v9[30].f32 = 0u;
  *(_OWORD *)v9[32].f32 = 0u;
  *(_OWORD *)v9[26].f32 = 0u;
  *(_OWORD *)v9[28].f32 = 0u;
  *(_OWORD *)v9[22].f32 = 0u;
  *(_OWORD *)v9[24].f32 = 0u;
  *(_OWORD *)v9[18].f32 = 0u;
  *(_OWORD *)v9[20].f32 = 0u;
  *(_OWORD *)v9[88].f32 = 0u;
  *(_OWORD *)v9[90].f32 = 0u;
  *(_OWORD *)v9[84].f32 = 0u;
  *(_OWORD *)v9[86].f32 = 0u;
  *(_OWORD *)v9[80].f32 = 0u;
  *(_OWORD *)v9[82].f32 = 0u;
  *(_OWORD *)v9[76].f32 = 0u;
  *(_OWORD *)v9[78].f32 = 0u;
  *(_OWORD *)v9[72].f32 = 0u;
  *(_OWORD *)v9[74].f32 = 0u;
  *(_OWORD *)v9[68].f32 = 0u;
  *(_OWORD *)v9[70].f32 = 0u;
  *(_OWORD *)v9[64].f32 = 0u;
  *(_OWORD *)v9[66].f32 = 0u;
  *(_OWORD *)v9[60].f32 = 0u;
  *(_OWORD *)v9[62].f32 = 0u;
  *(_OWORD *)v9[56].f32 = 0u;
  *(_OWORD *)v9[58].f32 = 0u;
  *(_OWORD *)v9[52].f32 = 0u;
  *(_OWORD *)v9[54].f32 = 0u;
  *(_OWORD *)v9[48].f32 = 0u;
  *(_OWORD *)v9[50].f32 = 0u;
  *(_OWORD *)v9[44].f32 = 0u;
  *(_OWORD *)v9[46].f32 = 0u;
  *(_OWORD *)v9[42].f32 = 0u;
  bzero(&v9[92], 0x258uLL);
  *(_OWORD *)v9[326].f32 = 0u;
  *(_OWORD *)v9[328].f32 = 0u;
  *(_OWORD *)v9[322].f32 = 0u;
  *(_OWORD *)v9[324].f32 = 0u;
  *(_OWORD *)v9[318].f32 = 0u;
  *(_OWORD *)v9[320].f32 = 0u;
  *(_OWORD *)v9[316].f32 = 0u;
  char v112 = 0;
  int v13 = [(H13FastRawScaleConfig *)self getBLCGOCConfigForInputFrame:v10 gocConfig:&v9[4]];
  if (v13)
  {
    int v93 = v13;
    FigDebugAssert3();
    goto LABEL_152;
  }
  v14 = -[SoftISPInputFrame registers]((uint64_t)v10);
  v15 = [v14 objectForKeyedSubscript:@"RsclProcPDC0"];

  if (!v15)
  {
LABEL_174:
    FigDebugAssert3();
    int v93 = FigSignalErrorAt();
    goto LABEL_152;
  }
  uint64_t v16 = [v15 objectForKeyedSubscript:@"Config"];
  v108 = (void *)v16;
  if (!v16)
  {
    FigDebugAssert3();
    int v93 = FigSignalErrorAt();
    int v94 = 4;
    goto LABEL_150;
  }
  v17 = (void *)v16;
  v110 = [v15 objectForKeyedSubscript:@"Config2"];
  if (!v110)
  {
    FigDebugAssert3();
    int v93 = FigSignalErrorAt();
    int v94 = 4;
    goto LABEL_149;
  }
  v104 = self;
  id v109 = v11;
  float v18 = -[SoftISPInputFrame registers]((uint64_t)v10);
  float v19 = [v18 objectForKeyedSubscript:@"RsclProc0"];

  v106 = v19;
  if (v19)
  {
    v9[330].i32[0] = objc_msgSend(v19, "cmi_intValueForKey:defaultValue:found:", @"QuadraMode", 0, 0);
    __int32 v21 = v9[330].i32[0];
    BOOL v22 = v21 == 1;
  }
  else
  {
    BOOL v22 = 0;
    __int32 v21 = v9[330].i32[0];
  }
  if (v21 && populateQuadraFPGrid((uint64_t)&v9[316], (uint64_t)a6, v20)
    || (v9[18].i8[1] = objc_msgSend(v15, "cmi_intValueForKey:defaultValue:found:", @"FirstPix", 0x7FFFFFFFLL, &v112), !v112)|| (v9[18].i8[2] = objc_msgSend(v17, "cmi_BOOLValueForKey:defaultValue:found:", @"FPCrosstalkEnable", 0, &v112), !v112)|| (v9[18].i8[3] = objc_msgSend(v17, "cmi_BOOLValueForKey:defaultValue:found:", @"FPCorrectionEnable", 0, &v112),
        !v112))
  {
    FigDebugAssert3();
    int v93 = FigSignalErrorAt();
    goto LABEL_157;
  }
  if (v9[18].i8[2])
  {
    id v107 = [MEMORY[0x263EFF990] dataWithLength:5184];
    uint64_t v23 = [v107 mutableBytes];
    uint64_t v24 = 0;
    while (1)
    {
      *(_DWORD *)(v23 + 4 * v24) = objc_msgSend(v15, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"FPXtalkCoeffLUT", v24, 0, &v112);
      if (!v112) {
        break;
      }
      if (++v24 == 1296) {
        goto LABEL_23;
      }
    }
LABEL_156:
    FigDebugAssert3();
    int v93 = FigSignalErrorAt();

LABEL_157:
    int v94 = 4;
    id v11 = v109;
    goto LABEL_148;
  }
  id v107 = 0;
LABEL_23:
  objc_msgSend(v15, "cmi_simdInt2ValueForKey:defaultValue:found:", @"XtalkGridOffset", &v112, COERCE_DOUBLE(0x7FFFFFFFLL));
  v9[19] = v25;
  if (!v112) {
    goto LABEL_156;
  }
  objc_msgSend(v15, "cmi_simdUInt2ValueForXKey:yKey:defaultValue:found:", @"XtalkIntXRecip", @"XtalkIntYRecip", &v112, COERCE_DOUBLE(0xFFFFFFFFLL));
  v9[20] = v26;
  if (!v112) {
    goto LABEL_156;
  }
  v9[21].i8[0] = objc_msgSend(v15, "cmi_intValueForKey:defaultValue:found:", @"XtalkShift", 0x7FFFFFFFLL, &v112);
  if (!v112) {
    goto LABEL_156;
  }
  if (v22)
  {
    objc_msgSend(v15, "cmi_simdInt2ValueForXKey:yKey:defaultValue:found:", @"Max", @"Min", 0, NAN);
    float32x2_t v28 = v27;
    objc_msgSend(v15, "cmi_simdInt2ValueForXKey:yKey:defaultValue:found:", @"Max", @"Min", 0, NAN);
    float32x2_t v30 = v29;
    objc_msgSend(v15, "cmi_simdInt2ValueForXKey:yKey:defaultValue:found:", @"Max", @"Min", 0, COERCE_DOUBLE(512));
    float32x2_t v32 = v31;
    float32x2_t v33 = (float32x2_t)vdup_n_s32(0x3A800000u);
    *(float32x2_t *)v34.f32 = vmul_f32(v28, v33);
    v9[36] = (float32x2_t)_simd_pow_f4((simd_float4)xmmword_263480DE0, v34).u64[0];
    *(float32x2_t *)v35.f32 = vmul_f32(v30, v33);
    v9[37] = (float32x2_t)_simd_pow_f4((simd_float4)xmmword_263480DE0, v35).u64[0];
    float32x2_t v36 = vmul_f32(v32, v33);
  }
  else
  {
    objc_msgSend(v15, "cmi_simdInt2ValueForXKey:yKey:defaultValue:found:", @"Max", @"Min", 0, NAN);
    v9[36] = v37;
    objc_msgSend(v15, "cmi_simdInt2ValueForXKey:yKey:defaultValue:found:", @"Max", @"Min", 0, NAN);
    v9[37] = v38;
    objc_msgSend(v15, "cmi_simdInt2ValueForXKey:yKey:defaultValue:found:", @"Max", @"Min", 0, COERCE_DOUBLE(2047));
  }
  v9[38] = v36;
  uint64_t v39 = 0;
  v9[21].i8[1] = 0;
  do
  {
    v9[21].i8[v39 + 2] = objc_msgSend(v15, "cmi_intValueFromArrayWithKey:forIndex:defaultValue:found:", @"RBRepCoeff", v39, 0, &v112);
    if (!v112) {
      goto LABEL_153;
    }
    if (v9[21].i8[v39 + 2]) {
      v9[21].i8[1] = 1;
    }
    ++v39;
  }
  while (v39 != 5);
  v9[21].i8[7] = objc_msgSend(v17, "cmi_BOOLValueForKey:defaultValue:found:", @"FPCorrFlatDetectEn", 1, &v112);
  if (!v112)
  {
LABEL_153:
    FigDebugAssert3();
    int v93 = FigSignalErrorAt();

    int v94 = 4;
    id v11 = v109;
    goto LABEL_148;
  }
  v9[22].i8[0] = objc_msgSend(v17, "cmi_intValueForKey:defaultValue:found:", @"FPCorrFlatMode", 0x7FFFFFFFLL, &v112);
  if (!v112) {
    goto LABEL_156;
  }
  v9[22].i8[1] = objc_msgSend(v17, "cmi_intValueForKey:defaultValue:found:", @"FPDiagMode", 0x7FFFFFFFLL, &v112);
  if (!v112) {
    goto LABEL_156;
  }
  v9[22].i8[2] = objc_msgSend(v17, "cmi_intValueForKey:defaultValue:found:", @"FPRedMode", 0x7FFFFFFFLL, &v112);
  if (!v112) {
    goto LABEL_156;
  }
  v9[22].i8[3] = objc_msgSend(v17, "cmi_intValueForKey:defaultValue:found:", @"FPBlueMode", 0x7FFFFFFFLL, &v112);
  if (!v112) {
    goto LABEL_156;
  }
  v9[22].i8[4] = objc_msgSend(v17, "cmi_BOOLValueForKey:defaultValue:found:", @"FPUseRed", 0, &v112);
  if (!v112) {
    goto LABEL_156;
  }
  v9[22].i8[5] = objc_msgSend(v17, "cmi_BOOLValueForKey:defaultValue:found:", @"FPUseBlue", 0, &v112);
  if (!v112) {
    goto LABEL_156;
  }
  v9[22].i8[6] = objc_msgSend(v110, "cmi_intValueForKey:defaultValue:found:", @"DiagGradMode", 0x7FFFFFFFLL, &v112);
  if (!v112) {
    goto LABEL_156;
  }
  v40 = [v15 objectForKeyedSubscript:@"FPCWeightFactor"];
  v105 = v40;
  if (!v40) {
    goto LABEL_191;
  }
  v41 = v40;
  v9[23].i16[1] = objc_msgSend(v40, "cmi_intValueForKey:defaultValue:found:", @"Grad", 0x7FFFFFFFLL, &v112);
  if (!v112) {
    goto LABEL_191;
  }
  v9[23].i16[2] = objc_msgSend(v41, "cmi_intValueForKey:defaultValue:found:", @"Grad2", 0x7FFFFFFFLL, &v112);
  if (!v112) {
    goto LABEL_191;
  }
  v9[23].i8[6] = objc_msgSend(v110, "cmi_BOOLValueForKey:defaultValue:found:", @"DirIntEnDP0", 0, &v112);
  if (!v112
    || (v9[23].i8[7] = objc_msgSend(v110, "cmi_BOOLValueForKey:defaultValue:found:", @"DirIntEnDP1", 0, &v112),
        !v112)
    || (v9[24].i8[0] = objc_msgSend(v110, "cmi_BOOLValueForKey:defaultValue:found:", @"DirIntEnFP", 0, &v112),
        !v112)
    || (v9[24].i8[2] = objc_msgSend(v110, "cmi_BOOLValueForKey:defaultValue:found:", @"CorrBoundEnDP0", 0, &v112), !v112)|| (v9[24].i8[3] = objc_msgSend(v110, "cmi_BOOLValueForKey:defaultValue:found:", @"CorrBoundEnDP1", 0, &v112), !v112)|| (v9[24].i8[4] = objc_msgSend(v110, "cmi_BOOLValueForKey:defaultValue:found:", @"CorrBoundEnFP", 0, &v112), !v112)|| (v9[24].i16[3] = objc_msgSend(v15, "cmi_intValueForKey:defaultValue:found:", @"CorrBoundFactor",
                          0x7FFFFFFFLL,
                          &v112),
        !v112)
    || (v9[25].i16[0] = objc_msgSend(v15, "cmi_intValueForKey:defaultValue:found:", @"ZeroBias", 0x7FFFFFFFLL, &v112), !v112))
  {
LABEL_191:
    FigDebugAssert3();
    int v93 = FigSignalErrorAt();
    int v94 = 4;
    id v11 = v109;
    goto LABEL_147;
  }
  if (v9[21].i8[7])
  {
    uint64_t v42 = 0;
    LOWORD(v117) = 0;
    long long v115 = 0u;
    long long v116 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    while (1)
    {
      __int16 v43 = objc_msgSend(v15, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"FPFlatThdLUT", v42, 0, &v112);
      if (!v112) {
        break;
      }
      *((_WORD *)&v113 + v42++) = v43;
      if (v42 == 33)
      {
        int v44 = [(H13FastRawScaleConfig *)v104 _createFlatLUTTexWithData:&v113 lutSize:33 metalCtx:v109 destArgs:v9];
        if (!v44) {
          goto LABEL_58;
        }
        int v93 = v44;
        FigDebugAssert3();
LABEL_159:
        int v94 = 4;
        id v11 = v109;
        goto LABEL_147;
      }
    }
    FigDebugAssert3();
    int v93 = FigSignalErrorAt();
    goto LABEL_159;
  }
LABEL_58:
  v45 = [v15 objectForKeyedSubscript:@"FPCorrectionCoeff"];
  v103 = v45;
  if (!v45 || (v46 = v45, [v45 count] != 4))
  {
    FigDebugAssert3();
    int v93 = FigSignalErrorAt();
    int v94 = 4;
    id v11 = v109;
    goto LABEL_146;
  }
  uint64_t v47 = 0;
  v48 = v9;
  do
  {
    v49 = [v46 objectAtIndexedSubscript:v47];
    v50 = v49;
    if (!v49 || [v49 count] != 25)
    {
      FigDebugAssert3();
      int v93 = FigSignalErrorAt();
      goto LABEL_131;
    }
    for (uint64_t i = 0; i != 25; ++i)
    {
      v52 = [v50 objectAtIndexedSubscript:i];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        FigDebugAssert3();
        int v93 = FigSignalErrorAt();

LABEL_131:
        int v94 = 4;
        id v11 = v109;
        goto LABEL_146;
      }
      v48[42].i16[i] = [v52 intValue];
    }
    ++v47;
    v48 = (float32x2_t *)((char *)v48 + 50);
  }
  while (v47 != 4);
  v53 = [v15 objectForKeyedSubscript:@"DPCCorrectionCoeff"];
  v54 = v53;
  if (!v53 || [v53 count] != 4)
  {
    FigDebugAssert3();
    int v93 = FigSignalErrorAt();
    int v94 = 4;
    id v11 = v109;
    goto LABEL_145;
  }
  uint64_t v55 = 0;
  x = v54;
  while (2)
  {
    v56 = [v54 objectAtIndexedSubscript:v55];
    v57 = v56;
    if (!v56 || [v56 count] != 24)
    {
      FigDebugAssert3();
      int v93 = FigSignalErrorAt();
      goto LABEL_133;
    }
    for (unint64_t j = 0; j != 24; ++j)
    {
      __int32 v59 = v9[330].i32[0];
      v60 = [v57 objectAtIndexedSubscript:j];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        FigDebugAssert3();
        int v93 = FigSignalErrorAt();

        v54 = x;
LABEL_133:

        int v94 = 4;
        id v11 = v109;
        goto LABEL_145;
      }
      if (j > 0xB && v59 == 0) {
        unint64_t v62 = j + 1;
      }
      else {
        unint64_t v62 = j;
      }
      v9[67].i16[25 * v55 + v62] = [v60 intValue];
    }
    ++v55;
    v54 = x;
    if (v55 != 4) {
      continue;
    }
    break;
  }
  uint64_t v63 = 0;
  while (2)
  {
    __int16 v64 = objc_msgSend(v15, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"DynamicThd0LUT", v63, 0, &v112);
    if (!v112) {
      goto LABEL_161;
    }
    __int16 v65 = v64;
    __int16 v66 = objc_msgSend(v15, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"DynamicThd1LUT", v63, 0, &v112);
    if (!v112) {
      goto LABEL_161;
    }
    __int16 v67 = v66;
    unsigned __int16 v68 = objc_msgSend(v15, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"DynamicThd2LUT", v63, 0, &v112);
    if (!v112) {
      goto LABEL_161;
    }
    v69.i16[0] = v65;
    v69.i16[1] = v67;
    v69.i32[1] = v68;
    v9[v63 + 92] = v69;
    __int16 v70 = objc_msgSend(v15, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"DespThd0LUT", v63, 0, &v112);
    if (!v112
      || (__int16 v71 = v70,
          __int16 v72 = objc_msgSend(v15, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"DespThd1LUT", v63, 0, &v112), !v112)|| (v73 = v72, v74 = objc_msgSend(v15, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"DespThd2LUT", v63, 0, &v112), !v112))
    {
LABEL_161:
      FigDebugAssert3();
      int v93 = FigSignalErrorAt();
      goto LABEL_162;
    }
    v75.i16[0] = v71;
    v75.i16[1] = v73;
    v75.i32[1] = v74;
    v9[v63 + 125] = v75;
    v9[158].i16[v63] = objc_msgSend(v15, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"HighlightThdLUT", v63, 0, &v112);
    if (v112)
    {
LABEL_96:
      if (++v63 != 33) {
        continue;
      }
      v80 = [v15 objectForKeyedSubscript:@"GraMax"];
      if (!v80)
      {
LABEL_196:
        FigDebugAssert3();
        int v93 = FigSignalErrorAt();
        int v94 = 4;
        id v11 = v109;
LABEL_143:

        goto LABEL_144;
      }
      for (uint64_t k = 0; k != 4; ++k)
      {
        v9[26].i16[k] = objc_msgSend(v80, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"GraMaxCenter", k, 0, &v112);
        if (!v112) {
          goto LABEL_196;
        }
        v9[27].i16[k] = objc_msgSend(v80, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"GraMaxEdge", k, 0, &v112);
        if (!v112) {
          goto LABEL_196;
        }
        v9[28].i16[k] = objc_msgSend(v80, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"GraMaxCorner", k, 0, &v112);
        if (!v112) {
          goto LABEL_196;
        }
      }
      v82 = [v15 objectForKeyedSubscript:@"PopThd"];
      v83 = v82;
      if (!v82)
      {
        FigDebugAssert3();
        int v93 = FigSignalErrorAt();
        int v94 = 4;
        id v11 = v109;
        goto LABEL_142;
      }
      v9[29].i16[0] = objc_msgSend(v82, "cmi_intValueForKey:defaultValue:found:", @"Thd", 0x7FFFFFFFLL, &v112);
      id v11 = v109;
      if (!v112
        || (v9[29].i16[1] = objc_msgSend(v83, "cmi_intValueForKey:defaultValue:found:", @"Spe", 0x7FFFFFFFLL, &v112), !v112)|| (v9[30].i8[4] = objc_msgSend(v108, "cmi_intValueForKey:defaultValue:found:", @"PopMode", 0x7FFFFFFFLL, &v112), !v112)|| (v9[30].i8[5] = objc_msgSend(v108, "cmi_intValueForKey:defaultValue:found:", @"PavMode", 0x7FFFFFFFLL, &v112),
            !v112))
      {
        FigDebugAssert3();
        int v93 = FigSignalErrorAt();
        int v94 = 4;
        goto LABEL_142;
      }
      v84 = [v15 objectForKeyedSubscript:@"HighlightMaxDef"];
      v101 = v84;
      if (!v84
        || (v85 = v84,
            v9[31].i16[0] = objc_msgSend(v84, "cmi_intValueForKey:defaultValue:found:", @"Center", 0x7FFFFFFFLL, &v112), !v112)|| (v9[31].i16[1] = objc_msgSend(v85, "cmi_intValueForKey:defaultValue:found:", @"Edge", 0x7FFFFFFFLL, &v112), !v112)|| (v9[31].i16[2] = objc_msgSend(v85, "cmi_intValueForKey:defaultValue:found:", @"Corner", 0x7FFFFFFFLL, &v112),
            !v112))
      {
        FigDebugAssert3();
        int v93 = FigSignalErrorAt();
        int v94 = 4;
        goto LABEL_141;
      }
      v100 = v83;
      v86 = [v15 objectForKeyedSubscript:@"HighlightMaxSpe"];
      v87 = v86;
      if (!v86) {
        goto LABEL_200;
      }
      v9[31].i16[3] = objc_msgSend(v86, "cmi_intValueForKey:defaultValue:found:", @"Center", 0x7FFFFFFFLL, &v112);
      if (!v112) {
        goto LABEL_200;
      }
      v9[32].i16[0] = objc_msgSend(v87, "cmi_intValueForKey:defaultValue:found:", @"Edge", 0x7FFFFFFFLL, &v112);
      if (!v112) {
        goto LABEL_200;
      }
      v9[32].i16[1] = objc_msgSend(v87, "cmi_intValueForKey:defaultValue:found:", @"Corner", 0x7FFFFFFFLL, &v112);
      if (!v112) {
        goto LABEL_200;
      }
      v9[32].i8[4] = objc_msgSend(v108, "cmi_BOOLValueForKey:defaultValue:found:", @"DynamicDetect", 0, &v112);
      if (!v112
        || (v9[32].i8[5] = objc_msgSend(v108, "cmi_BOOLValueForKey:defaultValue:found:", @"DynamicCorrect", 0, &v112), !v112)|| (v9[32].i8[6] = objc_msgSend(v108, "cmi_BOOLValueForKey:defaultValue:found:", @"DespeckleDynamicCorrect", 0, &v112), !v112)|| (objc_msgSend(v110, "cmi_BOOLValueForKey:defaultValue:found:", @"PhfCrossChanEn", 0, &v112), !v112)|| (int v88 = objc_msgSend(v108, "cmi_intValueForKey:defaultValue:found:", @"PhfMode", 0, &v112), !v112)|| v88|| (objc_msgSend(v108, "cmi_BOOLValueForKey:defaultValue:found:", @"PhfDirEn", 0, &v112), !v112)|| (v89 = objc_msgSend(v110, "cmi_BOOLValueForKey:defaultValue:found:", @"GradEqualEn", 0, &v112), !v112)|| v89
        || (int v90 = objc_msgSend(v108, "cmi_BOOLValueForKey:defaultValue:found:", @"FPXtalkFlatDetectEn", 0, &v112), !v112)|| v90)
      {
LABEL_200:
        FigDebugAssert3();
        int v93 = FigSignalErrorAt();
LABEL_201:
        int v94 = 4;
        goto LABEL_140;
      }
      if (v9[18].i8[2])
      {
        v91 = v104;
        int v92 = [(H13FastRawScaleConfig *)v104 _createXtalkTexWithData:v107 metalCtx:v109 pdcArgs:v9 pdcXtalkConfig:&v9[228]];
        if (v92)
        {
          int v93 = v92;
          goto LABEL_206;
        }
      }
      else
      {
        v91 = v104;
      }
      float v95 = exp2((double)v9[23].i16[1] * 0.0009765625);
      v9[34].f32[1] = v95 * 0.5;
      float32_t v96 = exp2((double)v9[23].i16[2] * 0.0009765625);
      v9[35].f32[0] = v96;
      if (!v9[18].i8[3]) {
        goto LABEL_138;
      }
      int v117 = 0;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      int v97 = [(H13FastRawScaleConfig *)v91 _fillPDPCorrectionConfig:&v9[223] gainAdj:&v113 pdpConfig:a6 gocConfig:&v9[4]];
      if (v97)
      {
        int v93 = v97;
      }
      else
      {
        int v98 = [(H13FastRawScaleConfig *)v91 _fillProcessFocusPixelsConfigWithPDPConfig:a6 args:v9 gainAdj:&v113];
        if (!v98)
        {
LABEL_138:
          int v93 = [(H13FastRawScaleConfig *)v91 _createDetectionLutTexsWithArgs:v9 metalCtx:v109];
          if (!v93)
          {
            int v94 = 0;
LABEL_140:

            v83 = v100;
LABEL_141:

LABEL_142:
            goto LABEL_143;
          }
          goto LABEL_206;
        }
        int v93 = v98;
      }
LABEL_206:
      FigDebugAssert3();
      goto LABEL_201;
    }
    break;
  }
  v76 = [v15 objectForKeyedSubscript:@"HighlightThdLUT"];
  v77 = v76;
  if (!v76 || [v76 count] != 33)
  {
    FigDebugAssert3();
    int v93 = FigSignalErrorAt();
    goto LABEL_168;
  }
  v78 = [v77 objectAtIndexedSubscript:v63];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v78 count] == 1)
  {
    v79 = [v78 objectAtIndexedSubscript:0];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      FigDebugAssert3();
      int v93 = FigSignalErrorAt();

      goto LABEL_167;
    }
    v9[158].i16[v63] = [v79 unsignedIntValue];
    char v112 = 1;

    if (!v112) {
      goto LABEL_161;
    }
    goto LABEL_96;
  }
  FigDebugAssert3();
  int v93 = FigSignalErrorAt();
LABEL_167:

LABEL_168:
LABEL_162:
  int v94 = 4;
  id v11 = v109;
LABEL_144:
  v54 = x;
LABEL_145:

LABEL_146:
LABEL_147:

LABEL_148:
LABEL_149:

LABEL_150:
  if (!v94) {
    v9[18].i8[0] = 1;
  }
LABEL_152:

  return v93;
}

- (int)configureFromMetadataPDCArgs:(id)a3 forInputFrame:(id)a4 forOutputFrame:(id)a5 metalCtx:(id)a6 pdpConfig:(id *)a7 bounds:(id)a8
{
  uint64_t v358 = *MEMORY[0x263EF8340];
  v310 = a3;
  id v12 = a4;
  id v293 = a5;
  id v303 = a6;
  id v296 = a8;
  char v337 = 0;
  v306 = v12;
  v307 = -[SoftISPInputFrame metadata]((uint64_t)v12);
  id v336 = 0;
  id v335 = 0;
  if (!v310 || !v12 || !v303 || !v307)
  {
    FigDebugAssert3();
    int v21 = FigSignalErrorAt();
    v58 = 0;
    id v294 = 0;
    v295 = 0;
    v322 = 0;
    v299 = 0;
    v300 = 0;
    v304 = 0;
    v301 = 0;
    v302 = 0;
    goto LABEL_410;
  }
  v310[7] = 0u;
  v310[8] = 0u;
  v310[5] = 0u;
  v310[6] = 0u;
  v310[4] = 0u;
  v310[2] = 0u;
  v310[3] = 0u;
  v310[19] = 0u;
  v310[20] = 0u;
  v310[17] = 0u;
  v310[18] = 0u;
  v310[15] = 0u;
  v310[16] = 0u;
  v310[13] = 0u;
  v310[14] = 0u;
  v310[11] = 0u;
  v310[12] = 0u;
  v310[9] = 0u;
  v310[10] = 0u;
  v310[44] = 0u;
  v310[45] = 0u;
  v310[42] = 0u;
  v310[43] = 0u;
  v310[40] = 0u;
  v310[41] = 0u;
  v310[38] = 0u;
  v310[39] = 0u;
  v310[36] = 0u;
  v310[37] = 0u;
  v310[34] = 0u;
  v310[35] = 0u;
  v310[32] = 0u;
  v310[33] = 0u;
  v310[30] = 0u;
  v310[31] = 0u;
  v310[28] = 0u;
  v310[29] = 0u;
  v310[26] = 0u;
  v310[27] = 0u;
  v310[24] = 0u;
  v310[25] = 0u;
  v310[22] = 0u;
  v310[23] = 0u;
  v310[21] = 0u;
  bzero(v310 + 46, 0x258uLL);
  v310[163] = 0u;
  v310[164] = 0u;
  v310[161] = 0u;
  v310[162] = 0u;
  v310[159] = 0u;
  v310[160] = 0u;
  v310[158] = 0u;
  int v13 = [(SoftISPConfig *)self staticParameters];
  v301 = [v13 tuningParametersForInputFrameMetadata:v307 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v12)];

  if (!v301) {
    FigSignalErrorAt();
  }
  v14 = [v301 objectForKeyedSubscript:@"PDC"];
  v15 = v14;
  if (!v14)
  {
    FigSignalErrorAt();
    v15 = (void *)MEMORY[0x263EFFA78];
  }
  id v16 = v15;

  v295 = v16;
  __int16 v326 = objc_msgSend(v16, "cmi_unsignedIntValueForKey:defaultValue:found:", @"popThdThd", 16, &v337);
  if (!v337) {
    FigSignalErrorAt();
  }
  __int16 v324 = objc_msgSend(v16, "cmi_unsignedIntValueForKey:defaultValue:found:", @"popThdSpe", 32, &v337);
  if (!v337) {
    FigSignalErrorAt();
  }
  int v17 = -[SoftISPInputFrame frameID]((uint64_t)v12);
  int v18 = -[SoftISPInputFrame frameID]((uint64_t)v12);
  int v19 = -[SoftISPInputFrame frameID]((uint64_t)v12);
  __int32 v311 = -[SoftISPInputFrame cfaLayout]((uint64_t)v12);
  *((_DWORD *)v310 + 660) = v311 == 3;
  if (*((_DWORD *)v310 + 660))
  {
    int v21 = populateQuadraFPGrid((uint64_t)(v310 + 158), (uint64_t)a7, *(int32x2_t *)&v20);
    if (v21)
    {
      FigDebugAssert3();
      v58 = 0;
      id v294 = 0;
      v322 = 0;
      v299 = 0;
      v300 = 0;
      v304 = 0;
      v302 = 0;
      goto LABEL_410;
    }
  }
  LODWORD(v20) = 1132462080;
  objc_msgSend(v307, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2C0], &v337, v20);
  if (!v337) {
    goto LABEL_416;
  }
  float v23 = *(float *)&v22;
  LODWORD(v22) = 1132462080;
  objc_msgSend(v307, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F700], &v337, v22);
  if (!v337) {
    goto LABEL_416;
  }
  float v25 = *(float *)&v24;
  LODWORD(v24) = 1132462080;
  objc_msgSend(v307, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F6E8], &v337, v24);
  if (!v337) {
    goto LABEL_416;
  }
  float v27 = *(float *)&v26;
  LODWORD(v26) = 1.0;
  objc_msgSend(v307, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F468], &v337, v26);
  if (!v337) {
    goto LABEL_416;
  }
  float v29 = v28;
  objc_msgSend(v307, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F558], &v337, 0.0);
  if (!v337) {
    goto LABEL_416;
  }
  float v31 = v30;
  objc_msgSend(v307, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2E0], 0, 0.0);
  float v33 = v32;
  objc_msgSend(v307, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2D8], 0, 0.0);
  float v35 = v34;
  objc_msgSend(v307, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2D0], 0, 0.0);
  float v37 = v36 * 0.00024414;
  BOOL v38 = (float)(v33 * 0.00024414) == 0.0;
  if ((float)(v35 * 0.00024414) == 0.0) {
    BOOL v38 = 1;
  }
  if (v37 == 0.0) {
    BOOL v38 = 1;
  }
  if (v38) {
    float v37 = 1.0;
  }
  float v289 = v37;
  float v39 = v38 ? 1.0 : v35 * 0.00024414;
  float v40 = v38 ? 1.0 : v33 * 0.00024414;
  int v316 = objc_msgSend(v307, "cmi_BOOLValueForKey:defaultValue:found:", *MEMORY[0x263F2F4E0], 0, &v337);
  v41 = [(SoftISPConfig *)self staticParameters];
  v304 = [v41 moduleConfigForInputFrameMetadata:v307];

  if (!v304)
  {
LABEL_416:
    FigDebugAssert3();
    int v21 = FigSignalErrorAt();
    v58 = 0;
    id v294 = 0;
    v322 = 0;
    v299 = 0;
    v300 = 0;
    v304 = 0;
LABEL_417:
    v302 = 0;
    goto LABEL_410;
  }
  uint64_t v42 = [v304 objectForKeyedSubscript:@"FocusPixels"];
  v300 = v42;
  if (!v42)
  {
    FigDebugAssert3();
    int v21 = FigSignalErrorAt();
    v58 = 0;
    id v294 = 0;
    v322 = 0;
    v299 = 0;
    v300 = 0;
    goto LABEL_417;
  }
  uint64_t v43 = [v42 count];
  int v44 = [v300 objectForKeyedSubscript:@"Layout"];
  v302 = [v44 objectForKeyedSubscript:@"Type"];

  if (v302) {
    BOOL v45 = 0;
  }
  else {
    BOOL v45 = v43 != 0;
  }
  if (v45)
  {
    FigDebugAssert3();
    int v21 = FigSignalErrorAt();
    v58 = 0;
    id v294 = 0;
    v322 = 0;
    v299 = 0;
    goto LABEL_417;
  }
  v299 = [v304 objectForKeyedSubscript:@"HybridOCL"];
  v46 = @"NonBinning";
  if (v311 == 3) {
    v46 = @"SubPixel";
  }
  uint64_t v47 = v46;
  long long v330 = 0u;
  long long v331 = 0u;
  long long v332 = 0u;
  long long v333 = 0u;
  v48 = [v304 objectForKeyedSubscript:@"Sensor"];
  v49 = [v48 objectForKeyedSubscript:@"NoiseModels"];

  uint64_t v50 = [v49 countByEnumeratingWithState:&v330 objects:v357 count:16];
  if (!v50)
  {
LABEL_48:

LABEL_49:
    FigDebugAssert3();
    int v21 = FigSignalErrorAt();
    v58 = 0;
    id v294 = 0;
LABEL_50:
    v322 = 0;
    goto LABEL_410;
  }
  uint64_t v308 = v17 & 0xFFFF0000;
  uint64_t v319 = v18 & 0xFFFF0000;
  uint64_t v287 = v19 & 0xFFFF0000;
  float v51 = v23 * 0.0039062;
  float v52 = v25 * 0.0039062;
  float v292 = (float)(v51 * (float)(v25 * 0.0039062)) * (float)(v27 * 0.0039062);
  uint64_t v53 = *(void *)v331;
LABEL_42:
  uint64_t v54 = 0;
  while (1)
  {
    if (*(void *)v331 != v53) {
      objc_enumerationMutation(v49);
    }
    uint64_t v55 = *(void **)(*((void *)&v330 + 1) + 8 * v54);
    v56 = [v55 objectForKeyedSubscript:@"Mode"];
    char v57 = [v56 isEqualToString:v47];

    if (v57) {
      break;
    }
    if (v50 == ++v54)
    {
      uint64_t v50 = [v49 countByEnumeratingWithState:&v330 objects:v357 count:16];
      if (!v50) {
        goto LABEL_48;
      }
      goto LABEL_42;
    }
  }
  id v294 = v55;

  if (!v294) {
    goto LABEL_49;
  }
  int v21 = [(H13FastRawScaleConfig *)self getBLCGOCConfigForInputFrame:v306 gocConfig:v310 + 2];
  if (v21)
  {
    FigDebugAssert3();
    v58 = 0;
    v322 = 0;
    goto LABEL_410;
  }
  if (([v302 isEqualToString:@"HHCGG_1X1"] & 1) != 0
    || ([v302 isEqualToString:@"HVCGG_1X1"] & 1) != 0
    || ([v302 isEqualToString:@"VHDGG_1X1"] & 1) != 0
    || ([v302 isEqualToString:@"HVDGG_1X1"] & 1) != 0)
  {
    int v281 = 0;
    uint64_t v284 = 0x100000000;
LABEL_58:
    int v288 = 1;
    goto LABEL_59;
  }
  if (([v302 isEqualToString:@"HVDBB_1X1"] & 1) != 0
    || ([v302 isEqualToString:@"HHYBB_1x1"] & 1) != 0)
  {
    int v281 = 0;
    uint64_t v284 = 1;
    goto LABEL_58;
  }
  if (([v302 isEqualToString:@"HHCGB_2X1"] & 1) != 0
    || ([v302 isEqualToString:@"VHCBG_2X1"] & 1) != 0
    || ([v302 isEqualToString:@"HVCGB_2X1"] & 1) != 0)
  {
    int v288 = 0;
    uint64_t v284 = 0x100000001;
    int v281 = 1;
  }
  else
  {
    if (v43)
    {
LABEL_423:
      FigDebugAssert3();
      int v21 = FigSignalErrorAt();
      v58 = 0;
      goto LABEL_50;
    }
    uint64_t v284 = 0;
    int v281 = 0;
    int v288 = 0;
  }
LABEL_59:
  __int32 v59 = -[SoftISPInputFrame processingOptions]((uint64_t)v306);
  char v60 = objc_msgSend(v59, "cmi_BOOLValueForKey:defaultValue:found:", @"PDC", 1, 0);

  char v61 = -[SoftISPInputFrame firstPixel]((uint64_t)v306);
  BOOL v62 = v299 != 0;
  *((unsigned char *)v310 + 145) = v61;
  if (v43) {
    char v63 = v60;
  }
  else {
    char v63 = 0;
  }
  *((unsigned char *)v310 + 146) = v63;
  *((unsigned char *)v310 + 147) = v63;
  if (v311 != 3) {
    BOOL v62 = 0;
  }
  *((unsigned char *)v310 + 148) = v62;
  *((unsigned char *)v310 + 149) = v299 != 0;
  *((unsigned char *)v310 + 175) = 1;
  *((unsigned char *)v310 + 176) = 1;
  *((unsigned char *)v310 + 178) = 0;
  *((unsigned char *)v310 + 179) = 0;
  *((unsigned char *)v310 + 192) = 1;
  *((unsigned char *)v310 + 194) = 1;
  *((unsigned char *)v310 + 195) = 1;
  *((unsigned char *)v310 + 196) = 1;
  *((_WORD *)v310 + 99) = 0;
  *((unsigned char *)v310 + 168) = 0;
  *((unsigned char *)v310 + 244) = 1;
  *((unsigned char *)v310 + 245) = 1;
  *((_WORD *)v310 + 116) = v326;
  *((_WORD *)v310 + 117) = v324;
  if (v311 == 3)
  {
    unint64_t v65 = _simd_pow_f4((simd_float4)xmmword_263480DE0, (simd_float4)xmmword_263480E10).u64[0];
    uint64_t v64 = 1056964608;
    float v66 = 1.0;
  }
  else
  {
    uint64_t v64 = 1157619712;
    unint64_t v65 = 0xC5FD000000000000;
    float v66 = 0.0;
  }
  uint64_t v67 = 0;
  *((void *)v310 + 36) = v65;
  *((void *)v310 + 37) = v65;
  *((void *)v310 + 38) = v64;
  *((float *)v310 + 78) = v66;
  *((unsigned char *)v310 + 260) = v60;
  *((unsigned char *)v310 + 261) = v60;
  *((unsigned char *)v310 + 262) = v60;
  v355[1] = 0;
  v355[0] = 0;
  int v356 = 0;
  *((unsigned char *)v310 + 169) = 0;
  do
  {
    *((unsigned char *)v310 + v67 + 170) = *((_DWORD *)v355 + v67);
    if (*((unsigned char *)v310 + v67 + 170)) {
      *((unsigned char *)v310 + 169) = 1;
    }
    ++v67;
  }
  while (v67 != 5);
  *((unsigned char *)v310 + 177) = 0;
  *((unsigned char *)v310 + 182) = 0;
  *((unsigned char *)v310 + 180) = v288;
  *((unsigned char *)v310 + 181) = v288;
  if (v311 == 3) {
    __int16 v68 = 3402;
  }
  else {
    __int16 v68 = 2048;
  }
  *((_WORD *)v310 + 93) = v68;
  *((_WORD *)v310 + 94) = (v311 == 3) << 11;
  uint64_t v69 = -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v296);
  int v70 = v69;
  *((_WORD *)v310 + 143) = WORD2(v69);
  int v323 = HIDWORD(v69);
  *((_WORD *)v310 + 142) = v69;
  *((_WORD *)v310 + 100) = -[SoftISPInputFrame pipelineBlackLevel]((uint64_t)v306);
  __int16 v71 = [(SoftISPConfig *)self staticParameters];
  __int16 v72 = -[SoftISPInputFrame metadata]((uint64_t)v306);
  uint32x2_t v73 = (uint32x2_t)[v71 dimensionsForSensorInMetadata:v72];

  unsigned int v74 = -[SoftISPInputFrame quadraBinningFactor]((uint64_t)v306);
  v75.i32[0] = v73.i32[0] / v74;
  v75.i32[1] = v73.i32[1] / v74;
  unsigned int v76 = v73.i32[0] / v74 + 7;
  if (v76 < 0x10) {
    goto LABEL_423;
  }
  if ((v75.i32[1] + 7) < 0x10) {
    goto LABEL_423;
  }
  unsigned int v77 = v76 >> 3;
  int v78 = (v70 << 10) / (int)v77;
  if ((v78 - 8193) < 0xFFFFBFFF) {
    goto LABEL_423;
  }
  unsigned int v79 = (v75.i32[1] + 7) >> 3;
  int v80 = (v323 << 10) / (int)v79;
  if ((v80 - 8193) <= 0xFFFFBFFE) {
    goto LABEL_423;
  }
  *((void *)v310 + 19) = __PAIR64__(v80, v78);
  LODWORD(v81) = 0x4000000 / v77;
  HIDWORD(v81) = 0x4000000 / v79;
  *((void *)v310 + 20) = v81;
  int8x16_t v353 = 0u;
  int8x16_t v354 = 0u;
  int8x16_t v351 = 0u;
  int8x16_t v352 = 0u;
  int8x8_t v312 = v75;
  if (v52 > 1.0)
  {
    char v82 = 0;
    float v83 = fminf(v52, 2.0);
    if (v83 >= 1.0) {
      float v84 = 1.0;
    }
    else {
      float v84 = 2.0 - v83;
    }
    v353.i64[0] = (uint64_t)&kPDCKernelDPLowlightG;
    v353.i64[1] = (uint64_t)&kPDCKernelDPLowlightRB;
    v351.i64[0] = (uint64_t)&kPDCKernelDPExtremeLowlightG;
    v351.i64[1] = (uint64_t)&kPDCKernelDPExtremeLowlightRB;
    __int16 v85 = 1;
    __int16 v86 = 3;
    unsigned int v309 = 2;
    float v282 = 0.0;
    float v283 = 0.6;
    __int16 v87 = 2;
    __int16 v88 = 2;
    goto LABEL_165;
  }
  if (v292 >= 64.0)
  {
    v353.i64[0] = (uint64_t)&kPDCKernelDPLowlightG;
    v353.i64[1] = (uint64_t)&kPDCKernelDPLowlightRB;
    v351.i64[0] = (uint64_t)&kPDCKernelDPExtremeLowlightG;
    v351.i64[1] = (uint64_t)&kPDCKernelDPExtremeLowlightRB;
    float v283 = 0.6;
    if (v311 == 3)
    {
      float v282 = 0.0;
      char v82 = 0;
      __int16 v85 = 3;
      __int16 v86 = 7;
      __int16 v88 = 5;
    }
    else
    {
      float v282 = 0.0;
      if (v292 < 192.0 && v31 >= 5.0)
      {
        char v82 = 0;
        __int16 v86 = 3;
        unsigned int v309 = 2;
        __int16 v87 = 2;
        __int16 v88 = 2;
        float v84 = 0.0;
        __int16 v85 = 3;
        goto LABEL_165;
      }
      char v82 = 1;
      __int16 v85 = 3;
      __int16 v86 = 5;
      __int16 v88 = 4;
    }
    __int16 v87 = 2;
    unsigned int v309 = 2;
    float v84 = 0.0;
    goto LABEL_165;
  }
  if (v292 >= 32.0 && v31 >= 5.0)
  {
    char v82 = 0;
    float v84 = (float)(64.0 - v292) * 0.03125;
    v353.i64[0] = (uint64_t)&kPDCKernelDPLowlightG;
    v353.i64[1] = (uint64_t)&kPDCKernelDPLowlightRB;
    v351.i64[0] = (uint64_t)&kPDCKernelDPExtremeLowlightG;
    v351.i64[1] = (uint64_t)&kPDCKernelDPExtremeLowlightRB;
    __int16 v85 = 1;
    __int16 v86 = 5;
    __int16 v88 = 3;
LABEL_146:
    unsigned int v309 = 2;
    float v282 = 0.0;
    float v283 = 0.6;
    __int16 v87 = 2;
    goto LABEL_165;
  }
  if (v31 < 5.0 && v292 >= 8.0)
  {
    v353.i64[0] = (uint64_t)&kPDCKernelDPLowlightG;
    v353.i64[1] = (uint64_t)&kPDCKernelDPLowlightRB;
    v351.i64[0] = (uint64_t)&kPDCKernelDPExtremeLowlightG;
    v351.i64[1] = (uint64_t)&kPDCKernelDPExtremeLowlightRB;
    __int16 v89 = v311;
    if (v311 == 3)
    {
      char v90 = 0;
      uint64_t v91 = v308;
    }
    else
    {
      uint64_t v91 = v308;
      if (v292 >= 32.0 || (v90 = 0, __int16 v89 = 3, v29 >= 1.0) && v29 < 3.0)
      {
        char v90 = 1;
        __int16 v89 = 4;
      }
    }
    float v84 = v31 / 5.0;
    BOOL v96 = v91 != 151257088;
    BOOL v97 = v29 < 3.0 || v311 == 3;
    if (v29 >= 3.0) {
      __int16 v98 = 7;
    }
    else {
      __int16 v98 = 5;
    }
    if (v29 >= 3.0) {
      __int16 v99 = 8;
    }
    else {
      __int16 v99 = 7;
    }
    if (v311 == 3) {
      BOOL v96 = 1;
    }
    if (v97)
    {
      __int16 v100 = 5;
    }
    else
    {
      __int16 v89 = 5;
      __int16 v100 = 7;
    }
    int v101 = v29 <= 0.066667 || v96;
    if (v101) {
      __int16 v88 = v89;
    }
    else {
      __int16 v88 = v98;
    }
    if (v101) {
      __int16 v86 = v100;
    }
    else {
      __int16 v86 = v99;
    }
    if ((v101 & v97) != 0) {
      char v82 = v90;
    }
    else {
      char v82 = 1;
    }
    __int16 v85 = 1;
    goto LABEL_146;
  }
  __int16 v85 = 0;
  float v92 = fminf(v51, 8.0);
  float v283 = 1.0;
  if (v92 <= 1.0) {
    float v84 = 1.0;
  }
  else {
    float v84 = (float)(8.0 - v92) / 7.0;
  }
  int v93 = v316;
  if (v29 > 0.066667) {
    int v93 = 1;
  }
  BOOL v94 = v31 < 50.0;
  v353.i64[0] = (uint64_t)&kPDCKernelDPDaylightG;
  v353.i64[1] = (uint64_t)&kPDCKernelDPDaylightRB;
  v351.i64[0] = (uint64_t)&kPDCKernelDPLowlightG;
  v351.i64[1] = (uint64_t)&kPDCKernelDPLowlightRB;
  if ((v93 & v94) != 0) {
    __int16 v88 = 4;
  }
  else {
    __int16 v88 = 2;
  }
  if ((v93 & v94) != 0) {
    __int16 v95 = 5;
  }
  else {
    __int16 v95 = 3;
  }
  if (v311 == 3)
  {
    __int16 v87 = 1;
    if (v292 >= 24.0)
    {
      __int16 v85 = 1;
      __int16 v95 = 5;
      __int16 v88 = 3;
      __int16 v87 = 2;
    }
  }
  else
  {
    __int16 v87 = 1;
  }
  char v82 = 0;
  if (v51 < 8.0 || v311 == 3)
  {
    __int16 v86 = v95;
  }
  else
  {
    __int16 v88 = 3;
    __int16 v86 = 5;
  }
  if (v29 <= 0.066667 && v51 < 6.0) {
    int v104 = 1;
  }
  else {
    int v104 = 2;
  }
  unsigned int v309 = v104;
  float v282 = 0.6;
LABEL_165:
  __int16 v105 = v326;
  __int16 v106 = v324;
  if (v319 == 152240128)
  {
    __int16 v88 = v29 <= 0.066667 ? 5 : 7;
    __int16 v86 = v29 <= 0.066667 ? 7 : 8;
    BOOL v107 = v29 <= 0.066667 && v292 < 64.0;
    if (!v107 && v31 <= 20.0) {
      char v82 = 1;
    }
  }
  if (v287 == 158466048 && v311 == 3)
  {
    if (v51 >= 8.0)
    {
      __int16 v106 = 24;
      __int16 v105 = 12;
      __int16 v85 = 3;
    }
    else
    {
      __int16 v106 = 24;
      __int16 v105 = 12;
      if (v51 >= 5.0) {
        __int16 v85 = 1;
      }
    }
  }
  *((void *)v310 + 27) = 0x5000500050005;
  *((void *)v310 + 28) = 0x7000700070007;
  *((int16x4_t *)v310 + 26) = vdup_n_s16(v309);
  *((_WORD *)v310 + 126) = v86;
  *((_WORD *)v310 + 124) = v88;
  *((_WORD *)v310 + 125) = v86;
  *((_WORD *)v310 + 129) = v86;
  *((_WORD *)v310 + 127) = v88;
  *((_WORD *)v310 + 128) = v86;
  *((_WORD *)v310 + 158) = v85;
  *((_WORD *)v310 + 159) = v85;
  *((_WORD *)v310 + 160) = v87;
  *((_WORD *)v310 + 163) = v87;
  *((_WORD *)v310 + 161) = 5;
  *((_WORD *)v310 + 162) = 3;
  *((_WORD *)v310 + 164) = 5;
  *((_WORD *)v310 + 165) = 3;
  *((unsigned char *)v310 + 190) = 0;
  *((unsigned char *)v310 + 191) = 0;
  *((unsigned char *)v310 + 246) = v82;
  *((unsigned char *)v310 + 193) = 0;
  *((_WORD *)v310 + 118) = 16;
  *((_WORD *)v310 + 119) = 16;
  *((_WORD *)v310 + 120) = v105;
  *((_WORD *)v310 + 121) = v106;
  int8x16_t v354 = vextq_s8(v353, v353, 8uLL);
  int8x16_t v352 = vextq_s8(v351, v351, 8uLL);
  if (*((unsigned char *)v310 + 146))
  {
    v322 = [MEMORY[0x263EFF990] data];
    id v109 = [(SoftISPConfig *)self staticParameters];
    v286 = [v109 cameraInfoForInputFrameMetadata:v307];

    v110 = [v286 objectForKeyedSubscript:*MEMORY[0x263F2F740]];
    v280 = v110;
    if (!v110)
    {
      FigDebugAssert3();
      int v275 = FigSignalErrorAt();
LABEL_407:
      int v21 = v275;
LABEL_408:

      goto LABEL_409;
    }
    id v285 = v110;
    v111 = (_DWORD *)[v285 bytes];
    int v114 = *v111;
    if ((*v111 - 1) < 2)
    {
      v112.i32[0] = 3;
      v113.i32[0] = v311;
      int8x8_t v115 = vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32(v113, v112), 0), (int8x8_t)vshr_n_u32(v73, 1uLL), v312);
      if (v114 == 2)
      {
        uint64_t v321 = 0;
        uint64_t v134 = 4;
        if (v311 == 3) {
          uint64_t v134 = 8;
        }
        uint64_t v313 = v134;
        double v135 = (double)v115.u32[0];
        v136 = v111 + 598;
        v315 = v111;
        v137 = (char *)(v111 + 748);
        double v138 = (double)v115.u32[1];
        int v325 = -1;
        int v318 = 1;
        int v327 = -1;
        do
        {
          unint64_t v139 = 0;
          v297 = v137;
          v298 = v136;
          do
          {
            v140 = (unsigned __int8 *)&v315[300 * v321] + 150 * v139;
            int v141 = v140[2324];
            int v142 = v140[2325];
            unint64_t v143 = v140[2325] * (unint64_t)v140[2324];
            if (v143)
            {
              v144 = v140 + 2324;
              if (v327 < 0) {
                int v327 = v140[2326];
              }
              if (v325 < 0) {
                int v325 = v140[2327];
              }
              if (v327 != v140[2326] || v325 != v140[2327] || v143 > 0x51) {
                goto LABEL_441;
              }
              for (uint64_t i = 0; i != v143; ++i)
                *((_DWORD *)&v344 + i) = *((char *)v136 + i);
              int v146 = v318;
              if (v139 > 3) {
                int v146 = 0;
              }
              int v318 = v146;
              if (v311 != 3)
              {
                uint64_t v147 = (uint64_t)&v315[300 * v321] + 150 * v139;
                if (v141 == *(unsigned __int8 *)(v147 + 2924) && v142 == *(unsigned __int8 *)(v147 + 2925))
                {
                  v148 = (int *)&v344;
                  v149 = v137;
                  do
                  {
                    int v150 = *v149++;
                    int v151 = *v148 + v150;
                    if (v151 + 1 >= 0) {
                      int v152 = v151 + 1;
                    }
                    else {
                      int v152 = v151 + 2;
                    }
                    *v148++ = v152 >> 1;
                    --v143;
                  }
                  while (v143);
                  int v318 = 0;
                }
              }
              id v328 = 0;
              resizeFocusPixelMap(v144, (uint64_t)&v344, &v328, 9.0, 9.0, v135, v138);
              id v153 = v328;
              if ([v153 length] != 324)
              {
                FigDebugAssert3();
                int v21 = FigSignalErrorAt();

                goto LABEL_408;
              }
              id v154 = v153;
              uint64_t v155 = [v154 bytes];
              id v156 = [MEMORY[0x263EFF990] dataWithData:v154];
              uint64_t v157 = [v156 bytes];
              for (uint64_t j = 0; j != 324; j += 4)
              {
                int v159 = *(_DWORD *)(v155 + j);
                if (v159 >= 127) {
                  int v159 = 127;
                }
                if (v159 <= -128) {
                  LOBYTE(v159) = 0x80;
                }
                *(_DWORD *)(v157 + j) = 65793 * v159;
              }
              [v322 appendData:v156];
            }
            else
            {
              v160 = [MEMORY[0x263EFF990] dataWithLength:324];
              [v322 appendData:v160];
            }
            ++v139;
            v136 = (_DWORD *)((char *)v136 + 150);
            v137 += 150;
          }
          while (v139 != v313);
          v136 = v298 + 300;
          v137 = v297 + 1200;
          ++v321;
        }
        while (v321 != 4);
        int v133 = v318 & 1;
LABEL_255:
        if ((v327 & 0x80000000) == 0 && (v325 & 0x80000000) == 0)
        {
          int v161 = v287 == 158466048 ? 10 : v325;
          if ((((v311 == 3) ^ v133) & 1) != 0
            || ((v133 & (v311 == 3)) == 0 ? ++v161 : --v161, (v161 & 0x80000000) == 0))
          {
            *((unsigned char *)v310 + 168) = v161;
            int v21 = -[H13FastRawScaleConfig _createXtalkTexWithData:metalCtx:pdcArgs:pdcXtalkConfig:neighborCount:](self, "_createXtalkTexWithData:metalCtx:pdcArgs:pdcXtalkConfig:neighborCount:", v322, v303);
            if (v21)
            {
              FigDebugAssert3();

              goto LABEL_409;
            }

            goto LABEL_267;
          }
        }
        goto LABEL_441;
      }
      if (v114 == 1)
      {
        uint64_t v116 = 0;
        uint64_t v314 = 0;
        v320 = v111 + 261;
        double v117 = (double)v115.u32[0];
        uint64_t v118 = v111 + 278;
        int v325 = -1;
        double v119 = (double)v115.u32[1];
        int v327 = -1;
        do
        {
          uint64_t v120 = 0;
          v317 = v118;
          do
          {
            v121 = (unsigned __int8 *)&v320[132 * v116 + 33 * v120];
            unint64_t v122 = v121[1] * (unint64_t)*v121;
            if (v122)
            {
              if (v327 < 0) {
                int v327 = v121[2];
              }
              if (v325 < 0) {
                int v325 = v121[3];
              }
              if (v327 != v121[2] || v325 != v121[3] || v122 > 0x40)
              {
                FigDebugAssert3();
                int v275 = FigSignalErrorAt();
                goto LABEL_407;
              }
              for (uint64_t k = 0; k != v122; ++k)
                *((_DWORD *)&v344 + k) = *((char *)v118 + k);
              id v329 = 0;
              resizeFocusPixelMap(v121, (uint64_t)&v344, &v329, 9.0, 9.0, v117, v119);
              id v124 = v329;
              if ([v124 length] != 324)
              {
                FigDebugAssert3();
                int v21 = FigSignalErrorAt();

                goto LABEL_408;
              }
              id v125 = v124;
              uint64_t v126 = [v125 bytes];
              id v127 = [MEMORY[0x263EFF990] dataWithData:v125];
              uint64_t v128 = [v127 bytes];
              for (uint64_t m = 0; m != 324; m += 4)
              {
                int v130 = *(_DWORD *)(v126 + m);
                if (v130 >= 127) {
                  int v130 = 127;
                }
                if (v130 <= -128) {
                  LOBYTE(v130) = 0x80;
                }
                *(_DWORD *)(v128 + m) = 65793 * v130;
              }
              [v322 appendData:v127];
            }
            else
            {
              v131 = [MEMORY[0x263EFF990] dataWithLength:324];
              [v322 appendData:v131];
            }
            ++v120;
            v118 += 33;
          }
          while (v120 != 4);
          if (v311 == 3)
          {
            v132 = objc_msgSend(v322, "subdataWithRange:", v314, 1296);
            [v322 appendData:v132];

            v314 += 2592;
          }
          ++v116;
          uint64_t v118 = v317 + 132;
        }
        while (v116 != 4);
        int v133 = 1;
        goto LABEL_255;
      }
    }
LABEL_441:
    FigDebugAssert3();
    int v275 = FigSignalErrorAt();
    goto LABEL_407;
  }
  v322 = 0;
LABEL_267:
  uint64_t v162 = [(SoftISPConfig *)self stageConfigMode];
  v163 = -[SoftISPInputFrame processingOptions]((uint64_t)v306);
  v164 = [(SoftISPConfig *)self staticParameters];
  LOBYTE(v278) = 0;
  int v21 = +[LensShadingCorrectionConfig getLSCMetadata:v306 lscMetadata:v334 bounds:v296 stageConfigMode:v162 processingOptions:v163 metalCtx:v303 staticParameters:v164 forAWB:v278];

  if (v21) {
    goto LABEL_426;
  }
  [v306 storeLSCMetadata:v334];
  if (*((unsigned char *)v310 + 149) || *((unsigned char *)v310 + 148))
  {
    LOBYTE(v277) = v311 == 3;
    int v21 = [(H13FastRawScaleConfig *)self getHOCLConfigForInputFrame:v310 forInputFrame:v306 metalCtx:v303 softISPModuleConfig:v304 lscMetadata:v334 bounds:v296 isQuadra:v277];
    if (v21) {
      goto LABEL_426;
    }
  }
  v165 = [(SoftISPConfig *)self staticParameters];
  v166 = [v165 cameraInfoForInputFrameMetadata:v307];

  v167 = [v166 objectForKeyedSubscript:*MEMORY[0x263F2EEB0]];
  if (!v167) {
    goto LABEL_292;
  }
  v168 = [v307 objectForKeyedSubscript:*MEMORY[0x263F2F430]];
  v169 = v168;
  if (!v168) {
    goto LABEL_437;
  }
  unsigned int v170 = [v168 intValue];
  if (v170 == -1) {
    goto LABEL_437;
  }
  id v171 = v167;
  v172 = (_DWORD *)[v171 bytes];
  if ((unint64_t)[v171 length] <= 0x27) {
    goto LABEL_437;
  }
  if (*v172 != 1)
  {
    int v186 = FigSignalErrorAt();
    if (v186)
    {
      uint64_t v279 = v290;
      LODWORD(v277) = v186;
      FigDebugAssert3();
    }
    goto LABEL_291;
  }
  if (v170 >= 3
    || (v173 = &v172[3 * v170 + 1], v170 != v173[2])
    || (uint64_t v174 = (uint64_t)&v172[3 * v170 + 1], v176 = *(_DWORD *)(v174 + 4), v175 = (unsigned int *)(v174 + 4), !v176)
    || (unint64_t v177 = [v171 length],
        uint64_t v178 = *v173,
        uint64_t v179 = *v175,
        v177 < 4 * (unint64_t)(v179 + v178) + 40))
  {
LABEL_437:
    uint64_t v279 = v290;
    LODWORD(v277) = 0;
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_291:

LABEL_292:
    v187 = objc_msgSend(v166, "objectForKeyedSubscript:", *MEMORY[0x263F2EEA8], v277, v279);
    v169 = v187;
    if (v187)
    {
      v188 = (unsigned __int16 *)[v187 bytes];
      v58 = 0;
      uint64_t v182 = (uint64_t)(v188 + 1);
      uint64_t v179 = *v188;
      goto LABEL_296;
    }
    v58 = 0;
    uint64_t v182 = 0;
    goto LABEL_295;
  }
  unint64_t v180 = [v171 length];
  v181 = v172 + 10;
  uint64_t v182 = (uint64_t)&v172[v178 + 10];
  uint64_t v184 = v172[4];
  uint64_t v183 = v172[5];
  if (v180 < 4 * (unint64_t)(v183 + v184) + 40 || v179 < v183)
  {
    uint64_t v279 = v290;
    LODWORD(v277) = 0;
    FigDebugAssert3();
    FigSignalErrorAt();
    v58 = 0;
    goto LABEL_296;
  }
  if (!v183)
  {
    v58 = 0;
    goto LABEL_296;
  }
  if (v179 <= v183)
  {
    v58 = 0;
LABEL_295:
    uint64_t v179 = 0;
    goto LABEL_296;
  }
  v58 = malloc_type_malloc(4 * (v179 - v183), 0x100004052888210uLL);
  if (!v58)
  {
    FigDebugAssert3();
    int v21 = FigSignalErrorAt();

    v58 = 0;
    goto LABEL_431;
  }
  int v185 = [(H13FastRawScaleConfig *)self _filterStaticDefectTableWithLocations:v182 defectLocationCount:v179 fromDefectLocations:&v181[v184] defectLocationCountToRemove:v183 outputFilteredDefectLocations:v58 filteredDefectLocationCount:(v179 - v183)];
  if (v185)
  {
    uint64_t v279 = v290;
    LODWORD(v277) = v185;
    FigDebugAssert3();
  }
  else
  {
    uint64_t v182 = (uint64_t)v58;
    uint64_t v179 = (v179 - v183);
  }
LABEL_296:

  if (v182 && v179)
  {
    unsigned int v189 = *((_DWORD *)v310 + 660)
         ? -[H13FastRawScaleConfig _createQuadraStaticDefectTableWithLocations:defectLocationCount:metalCtx:destArgs:](self, "_createQuadraStaticDefectTableWithLocations:defectLocationCount:metalCtx:destArgs:", v182, v179, v303): -[H13FastRawScaleConfig _createStaticDefectTableWithLocations:defectLocationCount:metalCtx:destArgs:inputFrame:](self, "_createStaticDefectTableWithLocations:defectLocationCount:metalCtx:destArgs:inputFrame:", v182, v179, v303);
    int v21 = v189;
    if (v189)
    {
      FigDebugAssert3();
LABEL_431:

      goto LABEL_410;
    }
  }
  free(v58);

  LODWORD(v190) = 1.0;
  *(float *)&double v191 = v51;
  *(float *)&double v192 = v52;
  [(H13FastRawScaleConfig *)self generateNoiseModelsFromBinningFactor:v294 NoiseModel:*((unsigned int *)v310 + 20) AnalogGain:v343 DigitalGain:v342 PreGain:v190 forFocusPixels:v191 forDefects:v192];
  LODWORD(v193) = 1.0;
  LODWORD(v194) = 5.0;
  LODWORD(v195) = 1.0;
  *(float *)&double v196 = v31;
  LODWORD(v197) = 1199570688;
  [(H13FastRawScaleConfig *)self pdcInterpX:v196 fromRangeStartingAt:v193 endingAt:v194 toRangeStartingAt:v197 endingAt:v195];
  if (*((unsigned char *)v310 + 175))
  {
    uint64_t v202 = 0;
    *(_WORD *)v348 = 0;
    long long v346 = 0u;
    long long v347 = 0u;
    long long v344 = 0u;
    long long v345 = 0u;
    do
    {
      float v203 = (float)(floorf(v343[v202] + 0.5) * 2.5) + 0.5;
      if (*(float *)&v198 > v203) {
        float v203 = *(float *)&v198;
      }
      int v204 = (int)v203;
      if ((int)v203 >= 0xFFFF) {
        int v204 = 0xFFFF;
      }
      *((_WORD *)&v344 + v202++) = v204 & ~(unsigned __int16)(v204 >> 31);
    }
    while (v202 != 33);
    int v21 = [(H13FastRawScaleConfig *)self _createFlatLUTTexWithData:&v344 lutSize:33 metalCtx:v303 destArgs:v310];
    if (v21) {
      goto LABEL_436;
    }
  }
  *(float *)v341 = v39;
  *(float *)&v341[1] = v40;
  *(float *)&v341[2] = v289;
  *(float *)&v341[3] = v39;
  v340[0] = (char *)v310 + 536;
  v340[1] = (char *)v310 + 586;
  v340[2] = (char *)v310 + 636;
  v340[3] = (char *)v310 + 686;
  if (v311 == 3)
  {
    uint64_t v205 = 0;
    HIDWORD(v199) = DWORD1(kPDCQuadraCoeffsSame);
    HIDWORD(v200) = unk_263481244;
    v206 = v338;
    HIDWORD(v201) = -989855744;
    do
    {
      unint64_t v207 = 0;
      v208 = (char *)&kPDCQuadraComponentWeights + 16 * v205;
      do
      {
        if (v207 >= 0xC) {
          uint64_t v209 = 12;
        }
        else {
          uint64_t v209 = 8;
        }
        v210 = (float *)&v208[v209];
        if (v207 < 8) {
          v210 = (float *)(v208 + 4);
        }
        if (v207 < 4) {
          v210 = (float *)((char *)&kPDCQuadraComponentWeights + 16 * v205);
        }
        *((float *)v339 + v207) = (float)((float)((float)((float)(v282 * (float)(1.0 - v84)) + (float)(v84 * v283))
                                                * kPDCQuadrCoeffsOther[v207])
                                        * 256.0)
                                * *v210;
        ++v207;
      }
      while (v207 != 16);
      uint64_t v211 = 0;
      long long v344 = v339[0];
      long long v345 = v339[1];
      long long v346 = v339[2];
      long long v347 = v339[3];
      *(_OWORD *)v348 = kPDCQuadraCoeffsSame;
      *(_OWORD *)&v348[12] = *(long long *)((char *)&kPDCQuadraCoeffsSame + 12);
      int v350 = 0;
      int v349 = 0;
      float v212 = *(float *)&v341[v205];
      v338[0] = v40 / v212;
      v338[1] = v39 / v212;
      v338[2] = v289 / v212;
      unint64_t v213 = kPDCQuadraKernelRGB[v205];
      uint64_t v214 = v340[v205];
      do
      {
        float v215 = fminf(roundf(*((float *)&v344 + v211) * v338[v213 & 3]), 2047.0);
        if (v215 < -2048.0) {
          float v215 = -2048.0;
        }
        *(_WORD *)(v214 + 2 * v211++) = (int)v215;
        v213 >>= 2;
      }
      while (v211 != 24);
      ++v205;
    }
    while (v205 != 4);
  }
  else
  {
    uint64_t v216 = 0;
    v217 = (char *)v310 + 200;
    do
    {
      uint64_t v218 = 0;
      float v219 = *(float *)&v341[v216];
      *(float *)&long long v344 = v40 / v219;
      *((float *)&v344 + 1) = v39 / v219;
      uint64_t v220 = v353.i64[v216];
      *((float *)&v344 + 2) = v289 / v219;
      uint64_t v221 = v351.i64[v216];
      unint64_t v222 = kPDCKernelRGB[v216];
      do
      {
        float v223 = fminf(roundf((float)(*((float *)&v344 + (v222 & 3)) * 10.667)* (float)((float)((float)(1.0 - v84) * (float)*(int *)(v221 + 4 * v218))+ (float)(v84 * (float)*(int *)(v220 + 4 * v218)))), 2047.0);
        if (v223 < -2048.0) {
          float v223 = -2048.0;
        }
        v206 = (float *)(int)v223;
        *(_WORD *)&v217[2 * v218++ + 336] = (_WORD)v206;
        v222 >>= 2;
      }
      while (v218 != 25);
      ++v216;
      v217 += 50;
    }
    while (v216 != 4);
  }
  LODWORD(v199) = 10.0;
  LODWORD(v200) = 20.0;
  LODWORD(v201) = 1.0;
  *(float *)&double v198 = v31;
  -[H13FastRawScaleConfig pdcInterpX:fromRangeStartingAt:endingAt:toRangeStartingAt:endingAt:](self, "pdcInterpX:fromRangeStartingAt:endingAt:toRangeStartingAt:endingAt:", v206, v198, v199, v200, 0.0, v201, v277, v279);
  float v225 = v224;
  LODWORD(v226) = 8.0;
  LODWORD(v227) = 16.0;
  LODWORD(v228) = 1.0;
  *(float *)&double v229 = v292;
  [(H13FastRawScaleConfig *)self pdcInterpX:v229 fromRangeStartingAt:v226 endingAt:v227 toRangeStartingAt:v228 endingAt:0.0];
  v231 = v310 + 21;
  v232 = (_OWORD *)((char *)v310 + 386);
  v233 = (_OWORD *)((char *)v310 + 436);
  v234 = (_OWORD *)((char *)v310 + 486);
  if (v311 == 3)
  {
    if (HIDWORD(v284))
    {
      FigDebugAssert3();
      int v21 = FigSignalErrorAt();
      goto LABEL_409;
    }
    long long v235 = 0uLL;
    v310[22] = 0u;
    v310[23] = 0u;
    _OWORD *v231 = 0u;
    _OWORD *v234 = 0u;
    *(_OWORD *)((char *)v310 + 502) = 0u;
    *(_OWORD *)((char *)v310 + 518) = 0u;
    _OWORD *v232 = 0u;
    *(_OWORD *)((char *)v310 + 402) = 0u;
    *(_OWORD *)((char *)v310 + 418) = 0u;
    if (v284)
    {
      long long v235 = *(_OWORD *)((char *)v310 + 636);
      long long v236 = *(_OWORD *)((char *)v310 + 652);
      long long v237 = *(_OWORD *)((char *)v310 + 668);
      *((_WORD *)v310 + 242) = *((_WORD *)v310 + 342);
      *(_OWORD *)((char *)v310 + 452) = v236;
      *(_OWORD *)((char *)v310 + 468) = v237;
    }
    else
    {
      *(_OWORD *)((char *)v310 + 452) = 0uLL;
      *(_OWORD *)((char *)v310 + 468) = 0uLL;
    }
    _OWORD *v233 = v235;
  }
  else
  {
    int v238 = 4096 - llroundf((float)(v225 * v230) * 4096.0);
    float v239 = (float)(v289 * 4096.0) + 0.5;
    int v240 = (int)v239;
    if (v288)
    {
      if (HIDWORD(v284))
      {
        PDCSetKernel((uint64_t)&kPDCKernelIdentity, (_OWORD *)((char *)v310 + 386));
        PDCSetKernel((uint64_t)&kPDCKernelIdentity, v233);
        PDCMakeKernel(0, 0, 1, (int)(float)((float)(v40 * 4096.0) + 0.5), (int)(float)((float)(v39 * 4096.0) + 0.5), v240, (uint64_t)&kPDCKernelFP1x1GToG, v238, v231);
        uint64_t v241 = 0;
        int v242 = 0;
        do
        {
          uint64_t v243 = 0;
          int v244 = v242;
          v245 = (__int16 *)v231;
          uint64_t v246 = (uint64_t)v310 + 2 * v242 + 486;
          do
          {
            __int16 v247 = *v245;
            v245 += 5;
            *(_WORD *)(v246 + 2 * v243++) = v247;
          }
          while (v243 != 5);
          ++v241;
          int v242 = v244 + 5;
          v231 = (_OWORD *)((char *)v231 + 2);
        }
        while (v241 != 5);
      }
      else if (v284)
      {
        PDCSetKernel((uint64_t)&kPDCKernelIdentity, (_OWORD *)((char *)v310 + 386));
        PDCSetKernel((uint64_t)&kPDCKernelIdentity, v231);
        PDCSetKernel((uint64_t)&kPDCKernelIdentity, v234);
        PDCMakeKernel(2u, 2, 0, (int)(float)((float)(v40 * 4096.0) + 0.5), (int)(float)((float)(v39 * 4096.0) + 0.5), v240, (uint64_t)&kPDCKernelFP1x1BToB, v238, v233);
      }
    }
    else if (v281)
    {
      PDCMakeKernel(0, 0, 1, (int)(float)((float)(v40 * 4096.0) + 0.5), (int)(float)((float)(v39 * 4096.0) + 0.5), (int)v239, (uint64_t)&kPDCKernelFP2x1GToG, v238, v310 + 21);
      PDCSetKernel((uint64_t)&kPDCKernelIdentity, v232);
      PDCMakeKernel(2u, 2, 0, (int)(float)((float)(v40 * 4096.0) + 0.5), (int)(float)((float)(v39 * 4096.0) + 0.5), v240, (uint64_t)&kPDCKernelFP2x1BToB, v238, v233);
      uint64_t v248 = 0;
      int v249 = 0;
      do
      {
        uint64_t v250 = 0;
        int v251 = v249;
        v252 = (__int16 *)v231;
        uint64_t v253 = (uint64_t)v310 + 2 * v249 + 486;
        do
        {
          __int16 v254 = *v252;
          v252 += 5;
          *(_WORD *)(v253 + 2 * v250++) = v254;
        }
        while (v250 != 5);
        ++v248;
        int v249 = v251 + 5;
        v231 = (_OWORD *)((char *)v231 + 2);
      }
      while (v248 != 5);
    }
  }
  unint64_t v255 = 0;
  do
  {
    if (v255 >= 3 || v51 < 6.0) {
      float v257 = 0.0;
    }
    else {
      float v257 = 3.0;
    }
    if (v309 == 1) {
      float v257 = 2.0;
    }
    unint64_t v258 = v255 + 1;
    if (v309 == 2 && v255 > 0xF)
    {
LABEL_363:
      *(float *)&int v259 = 2560.0;
LABEL_371:
      float v262 = *(float *)&v259;
      goto LABEL_372;
    }
    if (v309 == 2 && v255 >= 8)
    {
      float v260 = (float)((float)((float)v258 + -9.0) * 0.25) * 0.125;
LABEL_367:
      float v261 = v260 + 0.375;
LABEL_368:
      float v262 = v261 * 4096.0;
      goto LABEL_372;
    }
    if (v51 == 1.0)
    {
      *(float *)&int v259 = 2304.0;
      goto LABEL_371;
    }
    if (v51 <= 4.0 && v255 > 0xE) {
      goto LABEL_363;
    }
    if (v51 <= 4.0 && v255 >= 7)
    {
      float v261 = (float)((float)((float)((float)v258 + -8.0) * 0.125) * 0.125) + 0.5;
      goto LABEL_368;
    }
    float v262 = 1536.0;
    if (v51 <= 4.0 && v255 >= 3)
    {
      float v260 = (float)((float)((float)v258 + -4.0) * 0.125) * 0.25;
      goto LABEL_367;
    }
LABEL_372:
    LOWORD(v263) = 0;
    float v264 = v342[v255];
    int v265 = (int)(float)((float)(v264 * v257) + 0.5);
    float v266 = fminf(v262 + 0.5, 65535.0);
    if (v266 < 0.0) {
      float v266 = 0.0;
    }
    int v267 = (int)v266;
    LOWORD(v268) = v265;
    WORD1(v268) = v267;
    HIDWORD(v268) = (unsigned __int16)(int)(float)((float)(v264 * 4.0) + 0.5);
    *((void *)v310 + v255 + 92) = v268;
    *(float *)&uint64_t v268 = (float)(v264 * 5.0) + 0.5;
    WORD1(v263) = 3584;
    HIDWORD(v263) = (unsigned __int16)(int)*(float *)&v268;
    *((void *)v310 + v255 + 125) = v263;
    *((_WORD *)v310 + v255++ + 632) = (int)fminf(*(float *)&v268, 65535.0);
  }
  while (v258 != 33);
  v271 = v310;
  int v272 = *((_DWORD *)v310 + 660);
  float v273 = exp2((double)*((__int16 *)v310 + 93) * 0.0009765625);
  if (!v272) {
    float v273 = v273 * 0.5;
  }
  *((float *)v310 + 69) = v273;
  float v274 = exp2((double)*((__int16 *)v310 + 94) * 0.0009765625);
  *((float *)v310 + 70) = v274;
  if (!*((unsigned char *)v310 + 147) || *((_DWORD *)v310 + 660))
  {
LABEL_395:
    int v21 = [(H13FastRawScaleConfig *)self _createDetectionLutTexsWithArgs:v271 metalCtx:v303];
    if (!v21)
    {
      v58 = 0;
      *((unsigned char *)v310 + 144) = 1;
      goto LABEL_410;
    }
LABEL_426:
    FigDebugAssert3();
    v58 = 0;
    goto LABEL_410;
  }
  *(_DWORD *)v348 = 0;
  long long v346 = 0u;
  long long v347 = 0u;
  long long v344 = 0u;
  long long v345 = 0u;
  int v21 = [(H13FastRawScaleConfig *)self _fillPDPCorrectionConfig:(char *)v310 + 1784 gainAdj:&v344 pdpConfig:a7 gocConfig:v310 + 2];
  if (!v21)
  {
    int v21 = [(H13FastRawScaleConfig *)self _fillProcessFocusPixelsConfigWithPDPConfig:a7 args:v310 gainAdj:&v344];
    if (!v21)
    {
      v271 = v310;
      goto LABEL_395;
    }
  }
LABEL_436:
  FigDebugAssert3();
LABEL_409:
  v58 = 0;
LABEL_410:
  free(v58);

  return v21;
}

- (int)configurePDCArgs:(id)a3 forInputFrame:(id)a4 forOutputFrame:(id)a5 bounds:(id)a6 metalCtx:(id)a7 pdpConfig:(id *)a8
{
  v15 = (char *)a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  double v20 = v19;
  if (!v15 || !v16 || !v19)
  {
    int v57 = FigSignalErrorAt();
    goto LABEL_115;
  }
  *((void *)v15 + 1) = -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v18);
  *((void *)v15 + 2) = v21;
  if ([(SoftISPConfig *)self stageConfigMode] == 3
    || [(SoftISPConfig *)self stageConfigMode] == 4)
  {
    int v22 = [(H13FastRawScaleConfig *)self configureFromRegistersPDCArgs:v15 forInputFrame:v16 metalCtx:v20 pdpConfig:a8];
    if (!v22)
    {
      if ([(SoftISPConfig *)self stageConfigMode] == 4)
      {
        uint64_t v23 = objc_opt_new();
        char v61 = v20;
        id v62 = v18;
        int v24 = [(H13FastRawScaleConfig *)self configureFromMetadataPDCArgs:v23 forInputFrame:v16 forOutputFrame:v17 metalCtx:v20 pdpConfig:a8 bounds:v18];
        if (v24)
        {
          int v57 = v24;
          FigDebugAssert3();
          goto LABEL_112;
        }
        if (*(unsigned __int8 *)(v23 + 32) == v15[32])
        {
          if (!*(unsigned char *)(v23 + 144))
          {
            int v57 = 0;
LABEL_112:

            double v20 = v61;
            id v18 = v62;
            goto LABEL_115;
          }
          if (*(unsigned __int8 *)(v23 + 145) == v15[145]
            && *(unsigned __int8 *)(v23 + 146) == v15[146]
            && *(unsigned __int8 *)(v23 + 147) == v15[147])
          {
            id v63 = v16;
            if (*(_DWORD *)(v23 + 2640) != *((_DWORD *)v15 + 660))
            {
              FigDebugAssert3();
              printf("COMPARE ERROR shadowPDCArgs->quadraMode == pdcArgs->quadraMode   %s=%u   %s=%u   %s\n", "shadowPDCArgs->quadraMode", *(_DWORD *)(v23 + 2640), "pdcArgs->quadraMode", *((_DWORD *)v15 + 660), "-[H13FastRawScaleConfig(PDC) configurePDCArgs:forInputFrame:forOutputFrame:bounds:metalCtx:pdpConfig:]");
            }
            if (*(_DWORD *)(v23 + 2528) != *((_DWORD *)v15 + 632))
            {
              FigDebugAssert3();
              printf("COMPARE ERROR shadowPDCArgs->quadraFPGrid.startX[0] == pdcArgs->quadraFPGrid.startX[0]   %s=%u   %s=%u   %s\n", "shadowPDCArgs->quadraFPGrid.startX[0]", *(_DWORD *)(v23 + 2528), "pdcArgs->quadraFPGrid.startX[0]", *((_DWORD *)v15 + 632), "-[H13FastRawScaleConfig(PDC) configurePDCArgs:forInputFrame:forOutputFrame:bounds:metalCtx:pdpConfig:]");
            }
            if (*(_DWORD *)(v23 + 2544) != *((_DWORD *)v15 + 636))
            {
              FigDebugAssert3();
              printf("COMPARE ERROR shadowPDCArgs->quadraFPGrid.startY == pdcArgs->quadraMode   %s=%u   %s=%u   %s\n", "shadowPDCArgs->quadraFPGrid.startY[0]", *(_DWORD *)(v23 + 2544), "pdcArgs->quadraFPGrid.startY[0]", *((_DWORD *)v15 + 636), "-[H13FastRawScaleConfig(PDC) configurePDCArgs:forInputFrame:forOutputFrame:bounds:metalCtx:pdpConfig:]");
            }
            if (*(_DWORD *)(v23 + 2560) != *((_DWORD *)v15 + 640))
            {
              FigDebugAssert3();
              printf("COMPARE ERROR shadowPDCArgs->quadraFPGrid.intervalX == pdcArgs->quadraMode   %s=%u   %s=%u   %s\n", "shadowPDCArgs->quadraFPGrid.intervalX[0]", *(_DWORD *)(v23 + 2560), "pdcArgs->quadraFPGrid.intervalX[0]", *((_DWORD *)v15 + 640), "-[H13FastRawScaleConfig(PDC) configurePDCArgs:forInputFrame:forOutputFrame:bounds:metalCtx:pdpConfig:]");
            }
            if (*(_DWORD *)(v23 + 2576) != *((_DWORD *)v15 + 644))
            {
              FigDebugAssert3();
              printf("COMPARE ERROR shadowPDCArgs->quadraFPGrid.intervalY == pdcArgs->quadraMode   %s=%u   %s=%u   %s\n", "shadowPDCArgs->quadraFPGrid.intervalY[0]", *(_DWORD *)(v23 + 2576), "pdcArgs->quadraFPGrid.intervalY[0]", *((_DWORD *)v15 + 644), "-[H13FastRawScaleConfig(PDC) configurePDCArgs:forInputFrame:forOutputFrame:bounds:metalCtx:pdpConfig:]");
            }
            int32x2_t v25 = vceq_s32(*(int32x2_t *)(v23 + 152), *(int32x2_t *)(v15 + 152));
            if ((v25.i8[0] & 1) == 0)
            {
              FigDebugAssert3();
              int v57 = FigSignalErrorAt();
LABEL_106:
              id v16 = v63;
              goto LABEL_112;
            }
            if (v25.i8[4])
            {
              int32x2_t v26 = vceq_s32(*(int32x2_t *)(v23 + 160), *(int32x2_t *)(v15 + 160));
              if ((v26.i8[0] & 1) != 0
                && (v26.i8[4] & 1) != 0
                && *(unsigned __int8 *)(v23 + 168) == v15[168])
              {
                int8x8_t v27 = vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)(v23 + 288), *(float32x2_t *)(v15 + 288)));
                if ((v27.i8[0] & 1) == 0 && (v27.i8[4] & 1) == 0)
                {
                  int8x8_t v28 = vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)(v23 + 296), *(float32x2_t *)(v15 + 296)));
                  if ((v28.i8[0] & 1) == 0 && (v28.i8[4] & 1) == 0)
                  {
                    int8x8_t v29 = vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)(v23 + 304), *(float32x2_t *)(v15 + 304)));
                    if ((v29.i8[0] & 1) == 0
                      && (v29.i8[4] & 1) == 0
                      && *(float *)(v23 + 312) == *((float *)v15 + 78)
                      && *(unsigned __int8 *)(v23 + 169) == v15[169])
                    {
                      uint64_t v30 = 0;
                      while (*(unsigned __int8 *)(v23 + 170 + v30) == v15[v30 + 170])
                      {
                        if (++v30 == 5)
                        {
                          if (*(unsigned __int8 *)(v23 + 175) == v15[175]
                            && *(unsigned __int8 *)(v23 + 176) == v15[176]
                            && *(unsigned __int8 *)(v23 + 177) == v15[177]
                            && *(unsigned __int8 *)(v23 + 178) == v15[178]
                            && *(unsigned __int8 *)(v23 + 179) == v15[179]
                            && *(unsigned __int8 *)(v23 + 180) == v15[180]
                            && *(unsigned __int8 *)(v23 + 181) == v15[181]
                            && *(unsigned __int8 *)(v23 + 182) == v15[182]
                            && *(unsigned __int16 *)(v23 + 186) == *((unsigned __int16 *)v15 + 93)
                            && *(unsigned __int16 *)(v23 + 188) == *((unsigned __int16 *)v15 + 94))
                          {
                            if (*(unsigned __int8 *)(v23 + 190) != v15[190])
                            {
                              uint64_t v60 = v8;
                              LODWORD(v59) = 0;
                              FigDebugAssert3();
                            }
                            if (*(unsigned __int8 *)(v23 + 191) != v15[191])
                            {
                              uint64_t v60 = v8;
                              LODWORD(v59) = 0;
                              FigDebugAssert3();
                            }
                            if (*(unsigned __int8 *)(v23 + 192) == v15[192])
                            {
                              if (*(unsigned __int8 *)(v23 + 194) != v15[194])
                              {
                                uint64_t v60 = v8;
                                LODWORD(v59) = 0;
                                FigDebugAssert3();
                              }
                              if (*(unsigned __int8 *)(v23 + 195) != v15[195])
                              {
                                uint64_t v60 = v8;
                                LODWORD(v59) = 0;
                                FigDebugAssert3();
                              }
                              if (*(unsigned __int8 *)(v23 + 196) == v15[196]
                                && *(unsigned __int16 *)(v23 + 198) == *((unsigned __int16 *)v15 + 99)
                                && *(unsigned __int16 *)(v23 + 200) == *((unsigned __int16 *)v15 + 100))
                              {
                                uint64_t v31 = 0;
                                while (1)
                                {
                                  int v32 = *(__int16 *)(v23 + 336 + v31) - *(__int16 *)&v15[v31 + 336];
                                  if (v32 < 0) {
                                    int v32 = *(__int16 *)&v15[v31 + 336] - *(__int16 *)(v23 + 336 + v31);
                                  }
                                  if (v32 >= 2) {
                                    break;
                                  }
                                  v31 += 2;
                                  if (v31 == 400)
                                  {
                                    for (uint64_t i = 0; i != 33; ++i)
                                    {
                                      uint64_t v34 = 0;
                                      uint64_t v35 = v23 + 8 * i;
                                      float v36 = &v15[8 * i];
                                      do
                                      {
                                        uint64_t v74 = *(void *)(v35 + 736);
                                        int v37 = *(unsigned __int16 *)((unint64_t)&v74 & 0xFFFFFFFFFFFFFFF9 | (2 * (v34 & 3)));
                                        uint64_t v73 = *((void *)v36 + 92);
                                        int v38 = v37
                                            - *(unsigned __int16 *)((unint64_t)&v73 & 0xFFFFFFFFFFFFFFF9 | (2 * (v34 & 3)));
                                        if (v38 < 0) {
                                          int v38 = *(unsigned __int16 *)((unint64_t)&v73 & 0xFFFFFFFFFFFFFFF9 | (2 * (v34 & 3)))
                                        }
                                              - v37;
                                        if (v38 >= 2)
                                        {
                                          FigDebugAssert3();
                                          uint64_t v71 = *(void *)(v35 + 736);
                                          uint64_t v72 = *((void *)v36 + 92);
                                          printf("COMPARE ERROR Mismatch between dpcDynamicThd[%zu][%zu] from metadata %d vs %d from registers\n", i, v34, *(unsigned __int16 *)((unint64_t)&v71 & 0xFFFFFFFFFFFFFFF9 | (2 * (v34 & 3))), *(unsigned __int16 *)((unint64_t)&v72 & 0xFFFFFFFFFFFFFFF9 | (2 * (v34 & 3))));
                                        }
                                        ++v34;
                                      }
                                      while (v34 != 4);
                                    }
                                    uint64_t v39 = 0;
                                    uint64_t v40 = *(void *)(v23 + 208);
                                    uint64_t v41 = *((void *)v15 + 26);
                                    while (1)
                                    {
                                      uint64_t v69 = v40;
                                      int v42 = *(unsigned __int16 *)((unint64_t)&v69 & 0xFFFFFFFFFFFFFFF9 | (2 * (v39 & 3)));
                                      uint64_t v70 = v41;
                                      if (v42 != *(unsigned __int16 *)((unint64_t)&v70 & 0xFFFFFFFFFFFFFFF9 | (2 * (v39 & 3)))) {
                                        goto LABEL_116;
                                      }
                                      uint64_t v67 = *(void *)(v23 + 216);
                                      int v43 = *(unsigned __int16 *)((unint64_t)&v67 & 0xFFFFFFFFFFFFFFF9 | (2 * (v39 & 3)));
                                      uint64_t v68 = *((void *)v15 + 27);
                                      if (v43 != *(unsigned __int16 *)((unint64_t)&v68 & 0xFFFFFFFFFFFFFFF9 | (2 * (v39 & 3)))) {
                                        goto LABEL_116;
                                      }
                                      uint64_t v65 = *(void *)(v23 + 224);
                                      int v44 = *(unsigned __int16 *)((unint64_t)&v65 & 0xFFFFFFFFFFFFFFF9 | (2 * (v39 & 3)));
                                      uint64_t v66 = *((void *)v15 + 28);
                                      if (v44 != *(unsigned __int16 *)((unint64_t)&v66 & 0xFFFFFFFFFFFFFFF9 | (2 * (v39 & 3)))) {
                                        goto LABEL_116;
                                      }
                                      if (++v39 == 4)
                                      {
                                        if (*(unsigned __int16 *)(v23 + 232) != *((unsigned __int16 *)v15 + 116)) {
                                          goto LABEL_116;
                                        }
                                        if (*(unsigned __int16 *)(v23 + 234) != *((unsigned __int16 *)v15 + 117))
                                        {
                                          uint64_t v60 = v8;
                                          LODWORD(v59) = 0;
                                          FigDebugAssert3();
                                        }
                                        if (*(unsigned __int8 *)(v23 + 244) != v15[244]
                                          || *(unsigned __int8 *)(v23 + 245) != v15[245]
                                          || *(unsigned __int16 *)(v23 + 248) != *((unsigned __int16 *)v15 + 124)
                                          || *(unsigned __int16 *)(v23 + 250) != *((unsigned __int16 *)v15 + 125)
                                          || *(unsigned __int16 *)(v23 + 252) != *((unsigned __int16 *)v15 + 126)
                                          || *(unsigned __int16 *)(v23 + 254) != *((unsigned __int16 *)v15 + 127)
                                          || *(unsigned __int16 *)(v23 + 256) != *((unsigned __int16 *)v15 + 128)
                                          || *(unsigned __int16 *)(v23 + 258) != *((unsigned __int16 *)v15 + 129)
                                          || *(unsigned __int8 *)(v23 + 260) != v15[260]
                                          || *(unsigned __int8 *)(v23 + 261) != v15[261]
                                          || *(unsigned __int8 *)(v23 + 262) != v15[262])
                                        {
                                          goto LABEL_116;
                                        }
                                        BOOL v45 = [MEMORY[0x263EFF990] dataWithLength:81];
                                        v46 = [MEMORY[0x263EFF990] dataWithLength:81];
                                        id v47 = v45;
                                        uint64_t v48 = [v47 mutableBytes];
                                        id v49 = v46;
                                        uint64_t v50 = [v49 mutableBytes];
                                        uint64_t v51 = 0;
                                        int64x2_t v64 = vdupq_n_s64(9uLL);
                                        while (1)
                                        {
                                          float v52 = objc_msgSend((id)v23, "xtalkLutTex", v59, v60);
                                          uint64_t v75 = 0;
                                          uint64_t v76 = 0;
                                          uint64_t v77 = 0;
                                          int64x2_t v78 = v64;
                                          uint64_t v79 = 1;
                                          [v52 getBytes:v50 bytesPerRow:9 bytesPerImage:0 fromRegion:&v75 mipmapLevel:0 slice:v51];

                                          uint64_t v53 = [v15 xtalkLutTex];
                                          uint64_t v75 = 0;
                                          uint64_t v76 = 0;
                                          uint64_t v77 = 0;
                                          int64x2_t v78 = v64;
                                          uint64_t v79 = 1;
                                          [v53 getBytes:v48 bytesPerRow:9 bytesPerImage:0 fromRegion:&v75 mipmapLevel:0 slice:v51];

                                          uint64_t v54 = 0;
                                          unsigned int v55 = 0;
                                          do
                                          {
                                            if (*(unsigned __int8 *)(v50 + v54) != *(unsigned __int8 *)(v48 + v54)
                                              && v55 < 5)
                                            {
                                              ++v55;
                                            }
                                            ++v54;
                                          }
                                          while (v54 != 81);
                                          if (v55) {
                                            break;
                                          }
                                          if (++v51 == 16)
                                          {
                                            int v57 = 0;
                                            goto LABEL_105;
                                          }
                                        }
                                        FigDebugAssert3();
                                        int v57 = FigSignalErrorAt();
LABEL_105:

                                        goto LABEL_106;
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                          break;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
LABEL_116:
        FigDebugAssert3();
        int v57 = FigSignalErrorAt();
        goto LABEL_112;
      }
LABEL_114:
      int v57 = 0;
      goto LABEL_115;
    }
    int v57 = v22;
    goto LABEL_120;
  }
  if ([(SoftISPConfig *)self stageConfigMode] != 1
    && [(SoftISPConfig *)self stageConfigMode] != 2)
  {
    FigDebugAssert3();
    goto LABEL_114;
  }
  int v57 = [(H13FastRawScaleConfig *)self configureFromMetadataPDCArgs:v15 forInputFrame:v16 forOutputFrame:v17 metalCtx:v20 pdpConfig:a8 bounds:v18];
  if (v57) {
LABEL_120:
  }
    FigDebugAssert3();
LABEL_115:

  return v57;
}

- (int)_createQuadraStaticDefectTableWithLocations:(id *)a3 defectLocationCount:(unsigned int)a4 metalCtx:(id)a5 destArgs:(id)a6
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  id v11 = [MEMORY[0x263EFF9A0] dictionary];
  if (!a4)
  {
    FigDebugAssert3();
    goto LABEL_46;
  }
  if (!v10 || !v9 || !a3) {
    goto LABEL_49;
  }
  id v62 = v9;
  uint64_t v12 = a4;
  p_var1 = &a3->var1;
  id v63 = v10;
  do
  {
    unsigned int v14 = *(p_var1 - 1) - v10[2];
    if (v14 < v10[4])
    {
      unsigned int v15 = *p_var1 - v10[3];
      if (v15 < v10[5])
      {
        id v16 = [NSNumber numberWithUnsignedInt:v14 & 0xFFFE | ((unsigned __int16)(v15 >> 1) << 17)];
        id v17 = [NSNumber numberWithUnsignedInt:(1 << (v14 & 1 | (2 * (v15 & 1))))];
        id v18 = [v11 objectForKey:v16];
        if (v18)
        {
          id v19 = v11;
          double v20 = NSNumber;
          int v21 = [v17 intValue];
          uint64_t v22 = [v18 intValue] + v21;
          id v10 = v63;
          uint64_t v23 = [v20 numberWithInt:v22];
          [v19 setObject:v23 forKey:v16];

          id v11 = v19;
        }
        else
        {
          [v11 setObject:v17 forKey:v16];
        }
      }
    }
    p_var1 += 2;
    --v12;
  }
  while (v12);
  uint64_t v24 = 8 * [v11 count];
  if (v24)
  {
    long long v68 = *((_OWORD *)v10 + 159);
    long long v69 = *((_OWORD *)v10 + 158);
    long long v66 = *((_OWORD *)v10 + 161);
    long long v67 = *((_OWORD *)v10 + 160);
    long long v64 = *((_OWORD *)v10 + 163);
    long long v65 = *((_OWORD *)v10 + 162);
    int32x2_t v25 = [v9 device];
    int32x2_t v26 = (void *)[v25 newBufferWithLength:v24 options:0];

    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = [v27 contents];
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      char v61 = v11;
      id v29 = v11;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v77 objects:v81 count:16];
      if (v30)
      {
        id v60 = v27;
        LODWORD(v24) = 0;
        uint64_t v31 = *(void *)v78;
        uint64_t v32 = v30;
        do
        {
          uint64_t v33 = 0;
          uint64_t v34 = (int)v24;
          uint64_t v70 = v32;
          do
          {
            if (*(void *)v78 != v31) {
              objc_enumerationMutation(v29);
            }
            uint64_t v35 = *(void **)(*((void *)&v77 + 1) + 8 * v33);
            unsigned int v36 = [v35 unsignedIntValue];
            int v37 = [v29 objectForKeyedSubscript:v35];
            int v38 = [v37 unsignedIntValue];

            if ((~v38 & 3) != 0)
            {
              __int16 v43 = 0;
            }
            else
            {
              uint64_t v39 = v28;
              uint64_t v40 = [NSNumber numberWithUnsignedInt:((_WORD)v36 + 4) & 0xFFFE | v36 & 0xFFFE0000];
              uint64_t v41 = [v29 objectForKey:v40];
              int v42 = v41;
              if (v41) {
                __int16 v43 = [v41 unsignedIntValue] & 1;
              }
              else {
                __int16 v43 = 0;
              }
              unsigned __int16 v44 = 0;
              while (1)
              {
                long long v76 = v69;
                int v45 = v36 - *(_DWORD *)((unint64_t)&v76 & 0xFFFFFFFFFFFFFFF3 | (4 * (v44 & 3))) + 4;
                if ((v45 & 0x8000) == 0)
                {
                  long long v75 = v68;
                  int v46 = HIWORD(v36) - *(_DWORD *)((unint64_t)&v75 & 0xFFFFFFFFFFFFFFF3 | (4 * (v44 & 3)));
                  if ((v46 & 0x8000) == 0)
                  {
                    int v47 = (__int16)v45;
                    long long v74 = v67;
                    unsigned int v48 = *(_DWORD *)((unint64_t)&v74 & 0xFFFFFFFFFFFFFFF3 | (4 * (v44 & 3)));
                    unsigned int v49 = (__int16)v45 / v48;
                    if (v47 == v49 * v48)
                    {
                      long long v71 = v66;
                      unsigned int v50 = *(_DWORD *)((unint64_t)&v71 & 0xFFFFFFFFFFFFFFF3 | (4 * (v44 & 3)));
                      unsigned int v51 = (__int16)v46 / v50;
                      unsigned int v52 = (__int16)v46 % v50;
                      long long v72 = v65;
                      unsigned int v53 = *(_DWORD *)((unint64_t)&v72 & 0xFFFFFFFFFFFFFFF3 | (4 * (v44 & 3)));
                      long long v73 = v64;
                      BOOL v54 = v52 || v49 >= v53;
                      if (!v54 && v51 < *(_DWORD *)((unint64_t)&v73 & 0xFFFFFFFFFFFFFFF3 | (4 * (v44 & 3)))) {
                        break;
                      }
                    }
                  }
                }
                unsigned int v56 = v44++;
                if (v56 >= 3) {
                  goto LABEL_38;
                }
              }
              __int16 v43 = 1;
LABEL_38:

              uint64_t v28 = v39;
              uint64_t v32 = v70;
            }
            LODWORD(v57) = v36;
            WORD2(v57) = v38;
            HIWORD(v57) = v43;
            LODWORD(v24) = v34 + 1;
            *(void *)(v28 + 8 * v34) = v57;
            ++v33;
            ++v34;
          }
          while (v33 != v32);
          uint64_t v32 = [v29 countByEnumeratingWithState:&v77 objects:v81 count:16];
        }
        while (v32);
        id v9 = v62;
        id v10 = v63;
        id v27 = v60;
      }
      else
      {
        LODWORD(v24) = 0;
      }

      id v11 = v61;
      goto LABEL_45;
    }
LABEL_49:
    FigDebugAssert3();
    int v58 = FigSignalErrorAt();
    goto LABEL_47;
  }
  id v27 = 0;
LABEL_45:
  [v10 setStaticDefectTable:v27];
  v10[661] = v24;

LABEL_46:
  int v58 = 0;
LABEL_47:

  return v58;
}

- (int)_filterStaticDefectTableWithLocations:(id *)a3 defectLocationCount:(unsigned int)a4 fromDefectLocations:(id *)a5 defectLocationCountToRemove:(unsigned int)a6 outputFilteredDefectLocations:(id *)a7 filteredDefectLocationCount:(unsigned int)a8
{
  if (a4 && a3 && a6 && a5 && a8 && a7)
  {
    unint64_t v8 = 0;
    unint64_t v9 = 0;
    p_var1 = &a3->var1;
    uint64_t v11 = a4;
    do
    {
      if (v9 < a6 && *(p_var1 - 1) == a5[v9].var0 && *p_var1 == a5[v9].var1)
      {
        ++v9;
      }
      else
      {
        if (v8 >= a8) {
          goto LABEL_17;
        }
        a7[v8++] = *($201E9A47BE70A2B12CCA2F48B75AA2F7 *)(p_var1 - 1);
      }
      p_var1 += 2;
      --v11;
    }
    while (v11);
    if (v8 == a8) {
      return 0;
    }
  }
LABEL_17:
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)_createStaticDefectTableWithLocations:(id *)a3 defectLocationCount:(unsigned int)a4 metalCtx:(id)a5 destArgs:(id)a6 inputFrame:(id)a7
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v11 = a5;
  uint64_t v12 = a6;
  id v13 = a7;
  unsigned int v14 = v13;
  __int16 v95 = v11;
  if (!a4)
  {
    FigDebugAssert3();
    int v76 = 0;
LABEL_102:
    int v93 = 0;
    a3 = 0;
    goto LABEL_103;
  }
  if (!v11)
  {
    FigDebugAssert3();
    int v76 = FigSignalErrorAt();
    a3 = 0;
    double v20 = 0;
    free(0);
    goto LABEL_95;
  }
  if (!a3)
  {
    FigDebugAssert3();
    int v76 = FigSignalErrorAt();
    int v93 = 0;
LABEL_103:
    double v20 = 0;
LABEL_105:
    id v11 = 0;
    goto LABEL_94;
  }
  if (!v12)
  {
    FigDebugAssert3();
    int v76 = FigSignalErrorAt();
    goto LABEL_102;
  }
  int v15 = -[SoftISPInputFrame quadraBinningFactor]((uint64_t)v13);
  int v16 = v12[4];
  uint64_t v17 = (int)v12[5];
  size_t v18 = 4 * v17 + 16 * a4;
  id v19 = (char *)malloc_type_malloc(v18, 0xF35278BAuLL);
  double v20 = v19;
  if (!v19)
  {
    FigDebugAssert3();
    int v76 = FigSignalErrorAt();
    int v93 = 0;
    a3 = 0;
    goto LABEL_105;
  }
  uint64_t v94 = (uint64_t)v14;
  uint64_t v91 = a3;
  int v21 = v12;
  uint64_t v22 = a4;
  char v23 = v15 == 2;
  bzero(v19, v18);
  size_t v24 = 0;
  int32x2_t v25 = &v20[4 * v22];
  int32x2_t v26 = &v25[4 * v22];
  id v27 = (int *)&v26[4 * v22];
  char v90 = v21;
  int v28 = v21[2];
  int v29 = v21[3];
  uint64_t v30 = 0;
  p_var1 = &v91->var1;
  char v32 = 1;
  uint64_t v33 = v22;
  do
  {
    int v34 = (*(p_var1 - 1) >> v23) - v28;
    if ((v34 & 0x80000000) == 0)
    {
      int v35 = (*p_var1 >> v23) - v29;
      if ((v35 & 0x80000000) == 0)
      {
        BOOL v36 = v34 < v16 && v35 < (int)v17;
        if (v36)
        {
          unsigned __int16 v37 = WORD2(v30);
          unsigned __int16 v38 = v30;
          LOWORD(v30) = (*(p_var1 - 1) >> v23) - v28;
          WORD2(v30) = (*p_var1 >> v23) - v29;
          uint64_t v39 = &v20[4 * v24];
          *((_WORD *)v39 + 1) = v35;
          *(_WORD *)uint64_t v39 = v34;
          ++v24;
          BOOL v40 = v38 <= (unsigned __int16)v34;
          BOOL v41 = v37 == (unsigned __int16)v35;
          BOOL v42 = v37 < (unsigned __int16)v35;
          if (!v41) {
            BOOL v40 = v42;
          }
          v32 &= v40;
        }
      }
    }
    p_var1 += 2;
    --v33;
  }
  while (v33);
  if ((v32 & 1) == 0) {
    qsort(v20, v24, 4uLL, (int (__cdecl *)(const void *, const void *))compareScanOrder);
  }
  __int16 v43 = &v27[v22];
  if (-[SoftISPInputFrame quadraBinningFactor](v94) == 2)
  {
    unint64_t v44 = 0;
    if (!v24) {
      goto LABEL_47;
    }
    int v45 = v20;
    int32x2_t v46 = (int32x2_t)0xFFFF0000FFFFLL;
    do
    {
      int8x8_t v47 = (int8x8_t)v46;
      v46.i32[0] = *(unsigned __int16 *)v45;
      v46.i32[1] = *((unsigned __int16 *)v45 + 1);
      int32x2_t v48 = vceq_s32(v46, (int32x2_t)vand_s8(v47, (int8x8_t)0xFFFF0000FFFFLL));
      if ((v48.i32[0] & v48.i32[1] & 1) == 0)
      {
        unsigned int v49 = &v25[4 * v44++];
        *((_WORD *)v49 + 1) = v46.i16[2];
        *(_WORD *)unsigned int v49 = v46.i16[0];
      }
      v45 += 4;
      --v24;
    }
    while (v24);
  }
  else
  {
    int32x2_t v25 = v20;
    unint64_t v44 = v24;
  }
  if (v44 >= 2)
  {
    unsigned int v50 = 0;
    int v51 = 0;
    for (uint64_t i = 1; i != v44; ++i)
    {
      if ((int)i - 1 >= 0)
      {
        unsigned int v53 = &v25[4 * v50];
        BOOL v54 = &v20[8 * v22 + 4 * v50];
        unsigned int v55 = &v25[4 * i];
        int v56 = *((unsigned __int16 *)v55 + 1);
        int v57 = *(unsigned __int16 *)v55;
        int v58 = i;
        do
        {
          if (v56 - 3 >= *((unsigned __int16 *)v53 + 1)) {
            break;
          }
          int v59 = *(unsigned __int16 *)v53 - v57;
          if (*((unsigned __int16 *)v53 + 1) - v56 >= 0xFFFFFFFE && v59 >= -2 && v59 <= 2)
          {
            int v62 = *(_DWORD *)v54;
            if (*(_DWORD *)v54 >= *(_DWORD *)&v26[4 * i])
            {
              *(_DWORD *)&v26[4 * i] = v62 + 1;
              if (v62 + 1 > v51) {
                int v51 = v62 + 1;
              }
            }
          }
          --v58;
          v53 -= 4;
          v54 -= 4;
        }
        while (v58 > 0);
      }
      ++v50;
    }
    goto LABEL_48;
  }
LABEL_47:
  int v51 = 0;
LABEL_48:
  unint64_t v63 = 0;
  int v64 = 0;
  long long v96 = 0u;
  long long v97 = 0u;
  int v93 = v20;
  do
  {
    if (v44)
    {
      uint64_t v65 = 0;
      int v66 = 0;
      do
      {
        if (v63 == *(_DWORD *)&v26[4 * v65])
        {
          if (v44 <= v64) {
            goto LABEL_96;
          }
          uint64_t v67 = v64++;
          v27[v67] = v65;
          ++v66;
        }
        ++v65;
      }
      while (v44 != v65);
    }
    else
    {
      int v66 = 0;
    }
    if (v63 > 7) {
      HIDWORD(v97) += v66;
    }
    else {
      *((_DWORD *)&v96 + v63) = v66;
    }
    ++v63;
  }
  while (v63 != v51 + 1);
  if (v44 != v64)
  {
LABEL_96:
    FigDebugAssert3();
    int v76 = FigSignalErrorAt();
    a3 = 0;
    double v20 = 0;
    id v11 = 0;
    goto LABEL_97;
  }
  if (v51 >= 7) {
    int v51 = 7;
  }
  int v92 = v51;
  *__int16 v43 = 0;
  if (v44)
  {
    uint64_t v68 = 0;
    int v69 = 0;
    do
    {
      if (v69 < (int)v17)
      {
        uint64_t v70 = &v25[4 * v68 + 2];
        if (v69 < *(unsigned __int16 *)v70)
        {
          uint64_t v71 = v69 + 1;
          do
          {
            v43[v71] = v68;
            ++v69;
            if (v71 >= v17) {
              break;
            }
            BOOL v36 = v71++ < *(unsigned __int16 *)v70;
          }
          while (v36);
        }
      }
      ++v68;
    }
    while (v68 != v44);
  }
  else
  {
    LODWORD(v68) = 0;
    int v69 = 0;
  }
  if (v69 + 1 < (int)v17)
  {
    long long v72 = &v20[16 * v22 + 4 + 4 * v69];
    int v73 = ~v69 + v17;
    do
    {
      *(_DWORD *)long long v72 = v68;
      v72 += 4;
      --v73;
    }
    while (v73);
  }
  if (!v44)
  {
    double v20 = 0;
    id v11 = 0;
    goto LABEL_82;
  }
  long long v74 = [v95 device];
  id v11 = (id)[v74 newBufferWithLength:4 * v44 options:0];

  if (!v11)
  {
    FigDebugAssert3();
    int v76 = FigSignalErrorAt();
    a3 = 0;
    double v20 = 0;
    goto LABEL_97;
  }
  long long v75 = [v95 device];
  double v20 = (char *)[v75 newBufferWithLength:4 * v44 options:0];

  if (v20)
  {
LABEL_82:
    long long v77 = [v95 device];
    a3 = (const $201E9A47BE70A2B12CCA2F48B75AA2F7 *)[v77 newBufferWithLength:4 * v17 options:0];

    if (a3)
    {
      uint64_t v12 = v90;
      if (v44)
      {
        long long v78 = (_DWORD *)[v11 contents];
        unint64_t v79 = v44;
        do
        {
          int v80 = *(_DWORD *)v25;
          v25 += 4;
          *v78++ = v80;
          --v79;
        }
        while (v79);
        uint64_t v81 = (_DWORD *)[v20 contents];
        unint64_t v82 = v44;
        do
        {
          int v83 = *v27++;
          *v81++ = v83;
          --v82;
        }
        while (v82);
      }
      a3 = (id) a3;
      float v84 = (_DWORD *)[($201E9A47BE70A2B12CCA2F48B75AA2F7 *)(id)a3 contents];
      if (v17)
      {
        do
        {
          int v85 = *v43++;
          *v84++ = v85;
          --v17;
        }
        while (v17);
      }
      [v90 setStaticDefectTable:v11];
      [v90 setStaticDefectProcessIndexList:v20];
      [v90 setStaticDefectPerLineIndexBase:a3];
      uint64_t v86 = 0;
      int v87 = 0;
      v90[661] = v44;
      v90[662] = v92 + 1;
      unsigned int v14 = (void *)v94;
      do
      {
        int v88 = *(_DWORD *)((char *)&v96 + v86 * 4);
        v90[v86 + 663] = v88;
        v87 += v88;
        ++v86;
      }
      while (v86 != 8);
      if (v44 == v87)
      {
        int v76 = 0;
      }
      else
      {
        FigDebugAssert3();
        int v76 = FigSignalErrorAt();
      }
      goto LABEL_94;
    }
    FigDebugAssert3();
    int v76 = FigSignalErrorAt();
    goto LABEL_97;
  }
  FigDebugAssert3();
  int v76 = FigSignalErrorAt();
  a3 = 0;
LABEL_97:
  unsigned int v14 = (void *)v94;
  uint64_t v12 = v90;
LABEL_94:
  free(v93);
LABEL_95:

  return v76;
}

- (int)_createXtalkTexWithData:(id)a3 metalCtx:(id)a4 pdcArgs:(id)a5 pdcXtalkConfig:(id *)a6
{
  return [(H13FastRawScaleConfig *)self _createXtalkTexWithData:a3 metalCtx:a4 pdcArgs:a5 pdcXtalkConfig:a6 neighborCount:4];
}

- (int)_createXtalkTexWithData:(id)a3 metalCtx:(id)a4 pdcArgs:(id)a5 pdcXtalkConfig:(id *)a6 neighborCount:(unint64_t)a7
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = (char *)a5;
  unsigned int v14 = v13;
  if ((a7 == 4 || a7 == 8)
    && v12
    && v11
    && v13
    && ([MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:12 width:9 height:9 mipmapped:0], (int v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v16 = v15;
    [v15 setUsage:17];
    [v16 setStorageMode:0];
    [v16 setTextureType:3];
    [v16 setArrayLength:16 * a7];
    uint64_t v17 = [v12 device];
    size_t v18 = (void *)[v17 newTextureWithDescriptor:v16];

    if (v18)
    {
      id v33 = v12;
      id v34 = v11;
      uint64_t v36 = [v11 bytes];
      unint64_t v37 = a7;
      int v19 = 0;
      int v20 = 0;
      LODWORD(v21) = 0;
      int64x2_t v38 = vdupq_n_s64(9uLL);
      do
      {
        int v35 = v19;
        uint64_t v22 = 0;
        int v23 = 81 * v20;
        do
        {
          uint64_t v24 = 0;
          uint64_t v21 = (int)v21;
          do
          {
            uint64_t v25 = 0;
            int32x2_t v26 = (char *)(v36 + v23 + dword_263480E30[v24]);
            do
            {
              char v27 = *v26;
              v26 += 4;
              v42[v25++] = v27;
            }
            while (v25 != 81);
            memset(v39, 0, sizeof(v39));
            int64x2_t v40 = v38;
            uint64_t v41 = 1;
            [v18 replaceRegion:v39 mipmapLevel:0 slice:v21++ withBytes:v42 bytesPerRow:9 bytesPerImage:0];
            ++v24;
          }
          while (v24 != 4);
          v20 += 4;
          ++v22;
          v23 += 324;
        }
        while (v22 != v37);
        int v19 = v35 + 1;
      }
      while (v35 != 3);
      [v14 setXtalkLutTex:v18];
      float32x2_t v28 = (float32x2_t)vdup_n_s32(0x3DE38E39u);
      float32x2_t v29 = vmul_f32(vadd_f32(vmul_f32(vcvt_f32_s32(*(int32x2_t *)(v14 + 152)), (float32x2_t)vdup_n_s32(0x3A800000u)), (float32x2_t)0x3F0000003F000000), v28);
      *a6 = ($89856F9BF9EC2A295849B39E848314EC)vmul_f32(vmul_f32(vcvt_f32_u32(*(uint32x2_t *)(v14 + 160)), (float32x2_t)vdup_n_s32(0x32800000u)), v28);
      a6[1] = ($89856F9BF9EC2A295849B39E848314EC)v29;
      unsigned __int8 v30 = v14[168];
      a6[2].var0 = 127.0 / (float)(1 << v30);
      a6[2].var1 = v30;

      int v31 = 0;
      id v12 = v33;
      id v11 = v34;
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

  return v31;
}

- (int)_createFlatLUTTexWithData:(const unsigned __int16 *)a3 lutSize:(unint64_t)a4 metalCtx:(id)a5 destArgs:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = v10;
  if (v9 && a3 && v10 && (id v12 = objc_opt_new()) != 0)
  {
    id v13 = v12;
    [v12 setTextureType:0];
    [v13 setPixelFormat:20];
    [v13 setWidth:a4];
    [v13 setUsage:17];
    [v13 setStorageMode:0];
    unsigned int v14 = [v9 device];
    int v15 = (void *)[v14 newTextureWithDescriptor:v13];

    if (v15)
    {
      memset(v19, 0, 24);
      v19[3] = a4;
      int64x2_t v20 = vdupq_n_s64(1uLL);
      [v15 replaceRegion:v19 mipmapLevel:0 withBytes:a3 bytesPerRow:2 * a4];
      [v11 setFlatThdLutTex:v15];
      float v16 = (float)((float)a4 + -1.0) / (float)a4;
      *((float *)v11 + 66) = v16 * 0.87109;
      *((float *)v11 + 67) = (float)(0.5 / (float)a4) + (float)(v16 * -0.0);
      *((_DWORD *)v11 + 68) = 1066594601;

      int v17 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v17 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v17 = FigSignalErrorAt();
  }

  return v17;
}

- (int)_createDetectionLutTexsWithArgs:(id)a3 metalCtx:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  v5 = (char *)a3;
  id v6 = a4;
  if (!v6 || !v5 || (float v7 = objc_opt_new()) == 0)
  {
    FigDebugAssert3();
    int v35 = FigSignalErrorAt();
    goto LABEL_28;
  }
  unint64_t v8 = v7;
  [v7 setTextureType:0];
  [v8 setWidth:33];
  [v8 setUsage:17];
  [v8 setStorageMode:0];
  uint64_t v9 = 0;
  id v10 = (int16x4_t *)(v5 + 736);
  do
  {
    int16x4_t v11 = *v10;
    int16x4_t v12 = v10[33];
    id v13 = &v48[2 * v9];
    v13[1] = v12.i16[0];
    *id v13 = v11.i16[0];
    int16x4_t v14 = vtrn1_s16(v11, v12);
    v47[v9++] = vzip2_s16(vzip1_s16(v11, v12), v14);
    ++v10;
  }
  while (v9 != 33);
  v14.i16[0] = v48[0];
  v14.i16[2] = v48[1];
  char v15 = 1;
  uint64_t v16 = 2;
  int32x2_t v17 = (int32x2_t)vand_s8((int8x8_t)v14, (int8x8_t)0xFFFF0000FFFFLL);
  do
  {
    v18.i32[0] = (unsigned __int16)v48[v16];
    v18.i32[1] = (unsigned __int16)v48[v16 + 1];
    int16x4_t v19 = (int16x4_t)vmvn_s8((int8x8_t)vceq_s32(v18, v17));
    v15 &= (vmaxv_u16((uint16x4_t)vuzp1_s16(v19, v19)) & 0x8000) == 0;
    v16 += 2;
  }
  while (v16 != 66);
  if (v15)
  {
    int8x8_t v37 = (int8x8_t)v14;
    [v5 setDetectionDynDesp0LutTex:0];
    *((float32x2_t *)v5 + 267) = vdiv_f32(vadd_f32((float32x2_t)vorr_s8(vand_s8(v37, (int8x8_t)0xFFFF0000FFFFLL), (int8x8_t)vdup_n_s32(0x4B400000u)), (float32x2_t)vdup_n_s32(0xCB400000)), (float32x2_t)vdup_n_s32(0x475EFF00u));
    v5[2216] = 1;
  }
  else
  {
    [v8 setPixelFormat:60];
    int64x2_t v20 = [v6 device];
    uint64_t v21 = (void *)[v20 newTextureWithDescriptor:v8];

    if (!v21)
    {
LABEL_30:
      FigDebugAssert3();
      int v35 = FigSignalErrorAt();

      goto LABEL_28;
    }
    memset(v44, 0, sizeof(v44));
    long long v45 = xmmword_263480E20;
    uint64_t v46 = 1;
    [v21 replaceRegion:v44 mipmapLevel:0 withBytes:v48 bytesPerRow:132];
    [v5 setDetectionDynDesp0LutTex:v21];
    *((void *)v5 + 267) = 0;
    v5[2216] = 0;
  }
  [v8 setPixelFormat:110];
  uint64_t v22 = [v6 device];
  int v23 = (void *)[v22 newTextureWithDescriptor:v8];

  if (!v23) {
    goto LABEL_30;
  }
  memset(v41, 0, sizeof(v41));
  long long v42 = xmmword_263480E20;
  uint64_t v43 = 1;
  [v23 replaceRegion:v41 mipmapLevel:0 withBytes:v47 bytesPerRow:264];
  [v5 setDetectionDynDesp12LutTex:v23];
  [v8 setPixelFormat:20];
  uint64_t v24 = [v6 device];
  uint64_t v25 = (void *)[v24 newTextureWithDescriptor:v8];

  if (!v25) {
    goto LABEL_30;
  }
  memset(v38, 0, sizeof(v38));
  long long v39 = xmmword_263480E20;
  uint64_t v40 = 1;
  [v25 replaceRegion:v38 mipmapLevel:0 withBytes:v5 + 1264 bytesPerRow:66];
  [v5 setDetectionHighlightLutTex:v25];
  uint64_t v26 = 0;
  *((_DWORD *)v5 + 530) = 1062747632;
  *((_DWORD *)v5 + 531) = 1014513168;
  *((_DWORD *)v5 + 532) = 1066594601;
  *((_WORD *)v5 + 1056) = v5[145];
  v5[2144] = v5[245] != 0;
  v5[2145] = v5[244] != 0;
  v5[2146] = v5[246] != 0;
  *((int16x4_t *)v5 + 269) = vmax_s16(*(int16x4_t *)(v5 + 208), 0);
  *((int16x4_t *)v5 + 270) = vmax_s16(*(int16x4_t *)(v5 + 216), 0);
  int16x4_t v27 = vmax_s16(*(int16x4_t *)(v5 + 224), 0);
  *((int16x4_t *)v5 + 271) = v27;
  v27.i16[0] = *((_WORD *)v5 + 116);
  *(float *)v27.i32 = (float)v27.u32[0] * 0.0625;
  *((_DWORD *)v5 + 547) = v27.i32[0];
  v27.i16[0] = *((_WORD *)v5 + 117);
  *(float *)v27.i32 = (float)v27.u32[0] * 0.0625;
  *((_DWORD *)v5 + 548) = v27.i32[0];
  v27.i16[0] = *((_WORD *)v5 + 118);
  *(float *)v27.i32 = (float)v27.u32[0] * 0.0625;
  *((_DWORD *)v5 + 550) = v27.i32[0];
  v27.i16[0] = *((_WORD *)v5 + 119);
  *(float *)v27.i32 = (float)v27.u32[0] * 0.0625;
  *((_DWORD *)v5 + 551) = v27.i32[0];
  v27.i16[0] = *((_WORD *)v5 + 120);
  *(float *)v27.i32 = (float)v27.u32[0] * 0.0625;
  *((_DWORD *)v5 + 552) = v27.i32[0];
  v27.i16[0] = *((_WORD *)v5 + 121);
  *((float *)v5 + 553) = (float)v27.u32[0] * 0.0625;
  do
  {
    _S0 = (float)*(__int16 *)&v5[v26 + 536] * 0.0039062;
    __asm { FCVT            H0, S0 }
    *(_WORD *)&v5[v26 + 2218] = LOWORD(_S0);
    v26 += 2;
  }
  while (v26 != 200);
  BOOL v33 = *((unsigned __int16 *)v5 + 124) <= 8u
     || *((unsigned __int16 *)v5 + 125) < 9u
     || *((unsigned __int16 *)v5 + 126) < 9u
     || *((unsigned __int16 *)v5 + 127) < 9u
     || *((unsigned __int16 *)v5 + 128) < 9u
     || *((unsigned __int16 *)v5 + 129) <= 8u;
  v5[2217] = v33;
  if (v5[260]) {
    BOOL v34 = v5[261] != 0;
  }
  else {
    BOOL v34 = 0;
  }
  v5[2196] = v34;
  v5[2197] = v5[262];
  *((_WORD *)v5 + 1088) = *((_WORD *)v5 + 124);
  *((_WORD *)v5 + 1089) = *((_WORD *)v5 + 125);
  *((_WORD *)v5 + 1090) = *((_WORD *)v5 + 126);
  *((_WORD *)v5 + 1091) = *((_WORD *)v5 + 127);
  *((_WORD *)v5 + 1092) = *((_WORD *)v5 + 128);
  *((_WORD *)v5 + 1093) = *((_WORD *)v5 + 129);

  int v35 = 0;
LABEL_28:

  return v35;
}

- (int)_fillPDPCorrectionConfig:(id *)a3 gainAdj:(id *)a4 pdpConfig:(id *)a5 gocConfig:(id *)a6
{
  unsigned __int8 v6 = 0;
  int32x2_t v7 = *(int32x2_t *)&a5[6].var0[4].var0;
  uint32x2_t v8 = *(uint32x2_t *)&a5[6].var0[8].var0;
  float32x2_t v9 = (float32x2_t)vdup_n_s32(0x3D70F0F1u);
  a3[1].var0.var3 = 3.9961;
  float32x2_t v10 = vmul_f32(vcvt_f32_u32(v8), (float32x2_t)0x3200000032000000);
  float32x2_t v11 = vmla_f32((float32x2_t)0x3F0000003F000000, v10, vcvt_f32_s32(v7));
  *(float32x2_t *)&a3->var1.var0 = vmul_f32(v10, v9);
  *(float32x2_t *)&a3[1].var0.var1 = vmul_f32(v11, v9);
  v12.i64[0] = 0xC0000000CLL;
  v12.i64[1] = 0xC0000000CLL;
  uint32x4_t v13 = (uint32x4_t)vsubq_s32(v12, *(int32x4_t *)&a6[32].var0);
  v12.i64[0] = 0x100000001;
  v12.i64[1] = 0x100000001;
  float32x4_t v14 = vdivq_f32(vcvtq_f32_s32(*(int32x4_t *)&a6[24].var0), vcvtq_f32_s32((int32x4_t)vshlq_u32((uint32x4_t)v12, v13)));
  float32x4_t v15 = (float32x4_t)vdupq_n_s32(0x475EFF00u);
  float32x4_t v16 = vdivq_f32(vcvtq_f32_s32(*(int32x4_t *)&a6[8].var0), v15);
  __asm { FMOV            V1.4S, #1.0 }
  float32x4_t v22 = vdivq_f32(_Q1, v14);
  v15.f32[0] = (float)*(int *)&a5[5].var6 / 57087.0;
  float32x4_t v23 = vsubq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 0), v16);
  v11.f32[0] = (float)a5[5].var8 / 57087.0;
  float32x4_t v24 = vmulq_f32(v14, vaddq_f32(v16, (float32x4_t)vdupq_lane_s32((int32x2_t)v11, 0)));
  int32x2_t v25 = vceq_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v22.f32, 0), (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v22, (int8x16_t)v22, 4uLL));
  if ((vand_s8((int8x8_t)v25, (int8x8_t)vdup_lane_s32(v25, 1)).u8[0] & 1) != 0
    && (vmovn_s32(vceqq_f32(v22, (float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 3))).u8[0] & 1) != 0)
  {
    unsigned __int8 v6 = 0;
    int32x2_t v26 = vceq_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v23.f32, 0), (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v23, (int8x16_t)v23, 4uLL));
    if ((vand_s8((int8x8_t)v26, (int8x8_t)vdup_lane_s32(v26, 1)).u8[0] & 1) != 0
      && (vmovn_s32(vceqq_f32(v23, (float32x4_t)vdupq_laneq_s32((int32x4_t)v23, 3))).u8[0] & 1) != 0)
    {
      unsigned __int8 v6 = 0;
      int32x2_t v27 = vceq_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v14.f32, 0), (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v14, (int8x16_t)v14, 4uLL));
      if ((vand_s8((int8x8_t)v27, (int8x8_t)vdup_lane_s32(v27, 1)).u8[0] & 1) != 0
        && (vmovn_s32(vceqq_f32(v14, (float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 3))).u8[0] & 1) != 0)
      {
        int32x2_t v28 = vceq_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v24.f32, 0), (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v24, (int8x16_t)v24, 4uLL));
        if (vand_s8((int8x8_t)v28, (int8x8_t)vdup_lane_s32(v28, 1)).u8[0]) {
          unsigned __int8 v6 = vmovn_s32(vceqq_f32(v24, (float32x4_t)vdupq_laneq_s32((int32x4_t)v24, 3))).u8[0];
        }
        else {
          unsigned __int8 v6 = 0;
        }
      }
    }
  }
  uint64_t v29 = 0;
  a4->var0 = v6 & 1;
  p_var3 = &a4->var1[0].var3;
  do
  {
    float32x4_t v33 = v22;
    LODWORD(v31) = *(_DWORD *)((unint64_t)&v33 & 0xFFFFFFFFFFFFFFF3 | (4 * (v29 & 3)));
    float32x4_t v34 = v23;
    DWORD1(v31) = *(_DWORD *)((unint64_t)&v34 & 0xFFFFFFFFFFFFFFF3 | (4 * (v29 & 3)));
    float32x4_t v35 = v14;
    DWORD2(v31) = *(_DWORD *)((unint64_t)&v35 & 0xFFFFFFFFFFFFFFF3 | (4 * (v29 & 3)));
    float32x4_t v36 = v24;
    HIDWORD(v31) = *(_DWORD *)((unint64_t)&v36 & 0xFFFFFFFFFFFFFFF3 | (4 * (v29 & 3)));
    *(_OWORD *)(p_var3 - 3) = v31;
    ++v29;
    p_var3 += 4;
  }
  while (v29 != 4);
  return 0;
}

- (int)_fillProcessFocusPixelsConfigWithPDPConfig:(id *)a3 args:(id)a4 gainAdj:(id *)a5
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  int32x2_t v7 = (char *)a4;
  float32x2_t v9 = v7;
  uint64_t v10 = 0;
  float32x2_t v11 = v7 + 1336;
  __int16 v12 = BYTE1(a3[5].var5);
  *((_WORD *)v7 + 668) = v12;
  v7[1848] = v7[175];
  v7[1849] = v7[176] != 0;
  uint64_t v13 = *((void *)v7 + 33);
  *((_DWORD *)v7 + 465) = *((_DWORD *)v7 + 68);
  *(void *)(v7 + 1852) = v13;
  v7[1864] = v7[177] != 0;
  v7[1865] = v7[182] != 0;
  v7[1866] = v7[180];
  v7[1867] = v7[181];
  v7[1868] = v7[178] != 0;
  v7[1869] = v7[179] != 0;
  v7[1870] = v7[183];
  v7[1871] = v7[184];
  *((_DWORD *)v7 + 468) = *((_DWORD *)v7 + 69);
  *((_DWORD *)v7 + 469) = *((_DWORD *)v7 + 70);
  v7[1880] = v7[192];
  v7[1881] = v7[196];
  *((_WORD *)v7 + 941) = *((_WORD *)v7 + 99);
  do
  {
    _S0 = (float)*(__int16 *)&v7[v10 + 336] * 0.0039062;
    __asm { FCVT            H0, S0 }
    *(_WORD *)&v7[v10 + 1888] = LOWORD(_S0);
    v10 += 2;
  }
  while (v10 != 200);
  uint64_t v18 = 0;
  int v19 = 0;
  int16x4_t v20 = 0;
  int v21 = v12 & 3;
  char v22 = 1;
  int16x4_t v23 = (int16x4_t)0xFFFF0000FFFFLL;
  int v24 = 255;
  int32x2_t v25 = 0;
  do
  {
    if (a3->var0[v18].var0)
    {
      unsigned int v120 = *(_DWORD *)&a3->var0[v18 + 2].var0;
      v26.i32[0] = (unsigned __int16)v120;
      v26.i32[1] = HIWORD(v120);
      v27.i32[0] = vuzp1_s16(v26, v20).u32[0];
      uint16x4_t v28 = vmin_u16((uint16x4_t)v27.u32[0], (uint16x4_t)vuzp1_s16(v23, v20).u32[0]);
      v27.i16[0] = (__int16)a3->var0[v18 + 6];
      v27.i32[1] = (unsigned __int16)a3->var0[v18 + 7];
      v8.i16[0] = (__int16)a3->var0[v18 + 4];
      v8.i16[2] = (__int16)a3->var0[v18 + 5];
      int16x4_t v23 = (int16x4_t)vmovl_u16(v28).u64[0];
      int16x4_t v20 = (int16x4_t)vmovl_u16(vmax_u16((uint16x4_t)vuzp1_s16((int16x4_t)vadd_s32(vsub_s32(v27, (int32x2_t)v26), v8), v20).u32[0], (uint16x4_t)vuzp1_s16(v20, v20).u32[0])).u64[0];
      int32x2_t v25 = (int32x2_t)vmovl_u16(vmax_u16((uint16x4_t)vuzp1_s16((int16x4_t)v8, v20).u32[0], (uint16x4_t)vuzp1_s16((int16x4_t)v25, v20).u32[0])).u64[0];
      int v29 = v21 ^ (v120 & 1 | (2 * (HIWORD(v120) & 1)));
      if (v29) {
        _ZF = v29 == 3;
      }
      else {
        _ZF = 1;
      }
      int v31 = !_ZF;
      v19 |= v31;
      if (v24 == 255) {
        int v24 = v21 ^ (*(_DWORD *)&a3->var0[v18 + 2].var0 & 1 | (2 * (HIWORD(*(_DWORD *)&a3->var0[v18 + 2].var0) & 1)));
      }
      v22 &= v24 == v29;
    }
    v18 += 10;
  }
  while (v18 != 160);
  uint64_t v32 = 0;
  int v33 = 0;
  v7[2088] = v19 & 1;
  if ((v22 & 1) == 0) {
    int v24 = -1;
  }
  int8x8_t v34 = vand_s8((int8x8_t)v25, (int8x8_t)0xFFFF0000FFFFLL);
  int8x8_t v35 = vand_s8((int8x8_t)v20, (int8x8_t)0xFFFF0000FFFFLL);
  *((_DWORD *)v7 + 523) = v24;
  *((_WORD *)v7 + 672) = v35.i32[0] / (unsigned __int32)v34.i32[0];
  v36.i32[0] = v35.i32[0] / (unsigned __int32)v34.i32[0];
  v36.i32[1] = v35.i32[1] / (unsigned __int32)v34.i32[1];
  *((_WORD *)v7 + 673) = v35.i32[1] / (unsigned __int32)v34.i32[1];
  int32x2_t v37 = (int32x2_t)vand_s8((int8x8_t)v23, (int8x8_t)vdup_n_s32(0xFFFEu));
  *((_WORD *)v7 + 671) = v37.i16[2];
  *((_WORD *)v7 + 670) = v37.i16[0];
  int32x2_t v38 = vmla_s32(v37, v36, v25);
  *((_WORD *)v7 + 675) = v38.i16[2];
  *((_WORD *)v7 + 674) = v38.i16[0];
  *((_WORD *)v7 + 677) = v25.i16[2];
  *((_WORD *)v7 + 676) = v25.i16[0];
  memset(v125, 0, sizeof(v125));
  do
  {
    if (a3->var0[10 * v32].var0 && v25.i16[2])
    {
      unsigned int v39 = 0;
      int v40 = *v11 & 3 ^ (*(_DWORD *)&a3->var0[10 * v32 + 2].var0 & 1 | (2
                                                                     * (HIWORD(*(_DWORD *)&a3->var0[10 * v32 + 2].var0) & 1)));
      v38.i32[0] = *(_DWORD *)&a3->var0[10 * v32 + 2].var0;
      int32x2_t v38 = (int32x2_t)vmovl_u16((uint16x4_t)v38).u64[0];
      uint64_t v41 = (char *)a3 + 20 * v32;
      long long v42 = v41 + 1;
      uint64_t v43 = (unsigned __int16 *)(v41 + 8);
      unint64_t v44 = (unsigned __int16 *)(v41 + 10);
      do
      {
        if (v25.i16[0])
        {
          unsigned int v45 = 0;
          if (v33 <= 16) {
            uint64_t v46 = 16;
          }
          else {
            uint64_t v46 = v33;
          }
          uint64_t v47 = v46 - v33;
          int32x2_t v48 = (char *)&v125[v33] + 4;
          do
          {
            if (!v47) {
              goto LABEL_77;
            }
            int32x2_t v49 = vsub_s32(vadd_s32((int32x2_t)__PAIR64__(v39, v45), v38), v37);
            *((_WORD *)v48 - 1) = v49.i16[2];
            *((_WORD *)v48 - 2) = v49.i16[0];
            char *v48 = *v42 - 1;
            v48[1] = v40;
            *(void *)(v48 + 4) = 0xFFFFFFFF00000004;
            v45 += *v43;
            --v47;
            v48 += 16;
            ++v33;
          }
          while ((unsigned __int16)v45 < v25.u16[0]);
        }
        v39 += *v44;
      }
      while ((unsigned __int16)v39 < v25.u16[2]);
    }
    ++v32;
  }
  while (v32 != 16);
  *((_WORD *)v7 + 681) = v33;
  if (v33 <= 0)
  {
    v7[2089] = 0;
LABEL_80:
    LOBYTE(v51) = 0;
    *(void *)&long long v77 = -1;
    *((void *)&v77 + 1) = -1;
    long long v123 = v77;
    long long v124 = v77;
    long long v121 = v77;
    long long v122 = v77;
LABEL_81:
    if (v33 < 1)
    {
      if ((v51 & 1) == 0)
      {
LABEL_123:
        BOOL v107 = ($C28CD4A45FD07A4F97CC9D5F91F25271 *)(v11 + 448);
        if (a5->var0 | v22 & 1)
        {
          *BOOL v107 = a5->var1[0];
          char v108 = 1;
        }
        else
        {
          char v108 = 0;
          *(void *)&v107->var0 = 0;
          *((void *)v11 + 57) = 0;
        }
        v9[2096] = v108;
        unsigned int v109 = *((unsigned __int16 *)v11 + 9);
        if (v109 > 0x20) {
          goto LABEL_77;
        }
        if (*((_WORD *)v11 + 9))
        {
          int v110 = 0;
          unsigned __int16 v111 = 0;
          int v112 = 0;
          unint64_t v113 = *((unsigned __int16 *)v11 + 13);
          do
          {
            if (*((_WORD *)v11 + 13))
            {
              if (v110 == *((unsigned __int16 *)v11 + 17))
              {
                int v114 = 1;
              }
              else
              {
                int8x8_t v115 = (unsigned __int16 *)(v9 + 1374);
                uint64_t v116 = 1;
                do
                {
                  unint64_t v117 = v116;
                  if (v113 == v116) {
                    break;
                  }
                  int v118 = *v115;
                  v115 += 2;
                  ++v116;
                }
                while (v110 != v118);
                int v114 = v117 < v113;
              }
            }
            else
            {
              int v114 = 0;
            }
            int v112 = v114 | (2 * v112);
            v111 += v114;
            ++v110;
          }
          while (v110 != v109);
          if (v111 > 0x1Fu) {
            goto LABEL_77;
          }
        }
        else
        {
          unsigned __int16 v111 = 0;
          int v112 = 0;
        }
        int v76 = 0;
        *((_DWORD *)v11 + 5) = v112;
        *((_WORD *)v11 + 12) = v111;
        goto LABEL_142;
      }
      unsigned int v80 = 0;
      LOBYTE(v82) = 1;
      int v83 = -1;
      int v81 = -1;
    }
    else
    {
      for (uint64_t i = 0; i != v33; ++i)
        *((_DWORD *)&v121 + i) = i;
      if ((v51 & 1) == 0) {
        goto LABEL_118;
      }
LABEL_85:
      uint64_t v79 = 0;
      unsigned int v80 = 0;
      int v81 = -1;
      int v82 = 1;
      int v83 = -1;
      do
      {
        int v84 = DWORD2(v125[*((int *)&v121 + v79)]);
        if ((v84 - 1) < 2) {
          ++v80;
        }
        int v85 = v79 & 1;
        int v86 = (v81 == v85) & v82;
        if (v81 == -1) {
          int v86 = v82;
        }
        else {
          int v85 = v81;
        }
        int v87 = v79 & 1;
        int v88 = (v83 == v87) & v82;
        if (v83 == -1) {
          int v88 = v82;
        }
        else {
          int v87 = v83;
        }
        if (v84 == 2) {
          int v82 = v88;
        }
        else {
          int v87 = v83;
        }
        if (v84 == 3) {
          int v81 = v85;
        }
        else {
          int v83 = v87;
        }
        if (v84 == 3) {
          int v82 = v86;
        }
        ++v79;
      }
      while (v33 != v79);
    }
    *((_WORD *)v11 + 14) = v80;
    v9[2097] = v82 & 1;
    *((_DWORD *)v9 + 525) = v83 & ~(v83 >> 31);
    *((_DWORD *)v9 + 526) = v81 & ~(v81 >> 31);
    if (v80)
    {
      uint64_t v89 = 0;
      int v90 = 2;
      uint64_t v91 = &v121;
      do
      {
        unint64_t v92 = v89 + 2;
        if ((DWORD2(v125[*((int *)&v121 + v89)]) - 3) <= 0xFFFFFFFD && (uint64_t)v92 < v33)
        {
          uint64_t v94 = 0;
          uint64_t v95 = v89 | 1;
          do
          {
            long long v96 = (char *)v91 + 4 * v94;
            uint64_t v97 = *((int *)v96 + 2);
            if ((DWORD2(v125[v97]) - 1) <= 1)
            {
              int v98 = *((_DWORD *)&v121 + v89);
              int v99 = *((_DWORD *)&v121 + v95);
              *((_DWORD *)&v121 + v89) = v97;
              *((_DWORD *)&v121 + v95) = *((_DWORD *)v96 + 3);
              *((_DWORD *)v96 + 2) = v98;
              *((_DWORD *)v96 + 3) = v99;
            }
            v94 += 2;
          }
          while (v33 > v90 + (int)v94);
        }
        v90 += 2;
        uint64_t v91 = (long long *)((char *)v91 + 8);
        v89 += 2;
      }
      while (v92 < v80);
    }
LABEL_118:
    if (v33 >= 1)
    {
      uint64_t v100 = 0;
      uint64_t v101 = 192;
      while (1)
      {
        uint64_t v102 = *((unsigned int *)&v121 + v100);
        if ((v102 & 0x80000000) != 0 || (int)v102 >= v33) {
          goto LABEL_77;
        }
        v103 = &v125[v102];
        int v104 = &v11[4 * v100];
        *((_DWORD *)v104 + 8) = *(_DWORD *)v103;
        __int16 v105 = &v11[v100];
        v105[96] = *((unsigned char *)v103 + 4);
        uint64_t v106 = *((unsigned __int8 *)v103 + 5);
        v105[112] = v106;
        *((_DWORD *)v104 + 32) = *((_DWORD *)v103 + 2);
        *($C28CD4A45FD07A4F97CC9D5F91F25271 *)&v11[v101] = a5->var1[v106];
        ++v100;
        v101 += 16;
        if (v33 == v100) {
          goto LABEL_123;
        }
      }
    }
    goto LABEL_123;
  }
  uint64_t v50 = 0;
  int v51 = 0;
  do
  {
    uint64_t v52 = 0;
    int v53 = 0;
    unint64_t v54 = (unint64_t)&v125[v50];
    int v55 = *(unsigned __int16 *)v54;
    int v56 = *(unsigned __int16 *)(v54 + 2);
    int v57 = (_DWORD *)(v54 | 8);
    int v58 = (_DWORD *)(v54 | 0xC);
    int v59 = (unsigned __int16 *)v125 + 1;
    do
    {
      if (v50 == v52) {
        goto LABEL_48;
      }
      int v60 = *(v59 - 1);
      int v61 = *v59;
      if (v55 + 1 == v60 && v56 == v61)
      {
        int v64 = 2;
        goto LABEL_47;
      }
      if (v60 + 1 == v55 && v56 == v61)
      {
        int v64 = 1;
        goto LABEL_47;
      }
      if (v55 != v60) {
        goto LABEL_48;
      }
      if (v56 + 1 == v61)
      {
        int v64 = 3;
LABEL_47:
        _DWORD *v57 = v64;
        _DWORD *v58 = v52;
        ++v53;
        goto LABEL_48;
      }
      if (v61 + 1 == v56)
      {
        int v64 = 0;
        goto LABEL_47;
      }
LABEL_48:
      ++v52;
      v59 += 8;
    }
    while (v33 != v52);
    if (v53 >= 2) {
      goto LABEL_77;
    }
    v51 |= v53 == 1;
    ++v50;
  }
  while (v50 != v33);
  v7[2089] = v51 & 1;
  uint64_t v65 = (int *)v125 + 2;
  uint64_t v66 = v33;
  do
  {
    int v67 = *v65;
    v65 += 4;
    if (v67 == 4)
    {
      if (v51) {
        goto LABEL_77;
      }
      goto LABEL_80;
    }
    --v66;
  }
  while (v66);
  *(void *)&long long v68 = -1;
  *((void *)&v68 + 1) = -1;
  long long v123 = v68;
  long long v124 = v68;
  long long v121 = v68;
  long long v122 = v68;
  if ((v19 & v51 & 1) == 0) {
    goto LABEL_81;
  }
  if ((v33 & 1) == 0)
  {
    uint64_t v69 = 0;
    int v70 = 0;
    uint64_t v71 = (unsigned int *)((unint64_t)v125 | 0xC);
    do
    {
      if (*((unsigned char *)v71 - 7)) {
        BOOL v72 = *((unsigned char *)v71 - 7) == 3;
      }
      else {
        BOOL v72 = 1;
      }
      if (!v72)
      {
        if (v70 >= v33) {
          goto LABEL_77;
        }
        uint64_t v73 = v70 + 1;
        *((_DWORD *)&v121 + v70) = v69;
        uint64_t v74 = *v71;
        if ((v74 & 0x80000000) != 0)
        {
          ++v70;
        }
        else
        {
          if ((int)v74 >= v33) {
            goto LABEL_77;
          }
          BOOL v75 = !BYTE5(v125[v74]) || BYTE5(v125[v74]) == 3;
          if (!v75 || (int)v73 >= v33) {
            goto LABEL_77;
          }
          v70 += 2;
          *((_DWORD *)&v121 + v73) = v74;
        }
      }
      v71 += 4;
      ++v69;
    }
    while (v33 != v69);
    if (v70 == v33) {
      goto LABEL_85;
    }
  }
LABEL_77:
  FigDebugAssert3();
  int v76 = FigSignalErrorAt();
LABEL_142:

  return v76;
}

- (int)getSyntheticThumbnailConfigForInputFrame:(id)a3 bounds:(id)a4 syntheticThumbnailConfig:(SyntheticThumbnailConfig *)a5
{
  id v7 = a3;
  int32x2_t v8 = -[SoftISPInputFrame metadata]((uint64_t)v7);
  __int32 v9 = -[SoftISPInputFrame cfaLayout]((uint64_t)v7);
  char v54 = 0;
  if (v7 && a5 && v8)
  {
    __int32 v10 = v9;
    *((_OWORD *)a5 + 2) = 0u;
    *((_OWORD *)a5 + 3) = 0u;
    *(_OWORD *)a5 = 0u;
    *((_OWORD *)a5 + 1) = 0u;
    float32x2_t v11 = [(SoftISPConfig *)self staticParameters];
    __int16 v12 = [v11 tuningParametersForInputFrameMetadata:v8 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v7)];

    if (!v12) {
      FigSignalErrorAt();
    }
    uint64_t v13 = [v12 objectForKeyedSubscript:@"SyntheticThumbnail"];
    float32x4_t v14 = v13;
    if (v13
      && (int v15 = objc_msgSend(v13, "cmi_BOOLValueForKey:defaultValue:found:", @"enabled", 0, 0),
          *((unsigned char *)a5 + 60) = v15,
          v15))
    {
      LODWORD(v16) = 1072064102;
      objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", @"focusPixelRatio", 0, v16);
      *((_DWORD *)a5 + 1) = v17;
      *((_WORD *)a5 + 4) = objc_msgSend(v14, "cmi_unsignedIntValueForKey:defaultValue:found:", @"focusPixelCFAComponent", 3, &v54);
      if (v54)
      {
        v18.i32[0] = 3;
        v19.i32[0] = v10;
        uint32x2_t v52 = (uint32x2_t)vmovl_s16((int16x4_t)vceq_s32(v19, v18)).u64[0];
        __int32 v20 = -[SoftISPInputFrame firstPixel]((uint64_t)v7);
        unsigned __int16 v21 = -[SoftISPInputFrame firstPixel]((uint64_t)v7);
        v22.i32[0] = v20;
        v22.i32[1] = v21 >> 1;
        v23.i32[0] = *((unsigned __int16 *)a5 + 4);
        v23.i32[1] = (unsigned __int32)v23.i32[0] >> 1;
        int32x2_t v24 = vsub_s32((int32x2_t)vand_s8(v23, (int8x8_t)0x100000001), (int32x2_t)vand_s8(v22, (int8x8_t)0x100000001));
        int32x2_t v25 = vsub_s32(v24, (int32x2_t)vand_s8((int8x8_t)vsra_n_u32((uint32x2_t)v24, (uint32x2_t)vand_s8((int8x8_t)v24, (int8x8_t)0xFFFF0000FFFFLL), 0xFuLL), (int8x8_t)vdup_n_s32(0xFFFEu)));
        *((_WORD *)a5 + 29) = v25.i16[2];
        *((_WORD *)a5 + 28) = v25.i16[0];
        *(_WORD *)a5 = -[SoftISPInputFrame firstPixel]((uint64_t)v7);
        *((_WORD *)a5 + 6) = -[SoftISPInputFrame huemapThumbnailDownscalingFactor]((uint64_t)v7);
        __int32 v26 = -[SoftISPInputFrame huemapThumbnailDownscalingFactor]((uint64_t)v7);
        v27.i16[0] = *((_WORD *)a5 + 6);
        v27.i32[1] = v26;
        *((_WORD *)a5 + 7) = v26;
        uint32x2_t v28 = vshl_u32((uint32x2_t)vand_s8(v27, (int8x8_t)0xFFFF0000FFFFLL), v52);
        *((_WORD *)a5 + 9) = v28.i16[2];
        *((_WORD *)a5 + 8) = v28.i16[0];
        uint64_t v50 = -[SoftISPInputFrame metadata]((uint64_t)v7);
        int32x2_t v49 = [v50 objectForKeyedSubscript:@"AWBComboGGain"];
        [v49 floatValue];
        v52.i32[0] = v29;
        unsigned __int8 v30 = -[SoftISPInputFrame metadata]((uint64_t)v7);
        [v30 objectForKeyedSubscript:@"AWBComboRGain"];
        int v31 = v51 = v8;
        [v31 floatValue];
        unsigned int v48 = v32;
        int v33 = -[SoftISPInputFrame metadata]((uint64_t)v7);
        int8x8_t v34 = [v33 objectForKeyedSubscript:@"AWBComboBGain"];
        [v34 floatValue];
        unsigned int v47 = v35;
        int32x2_t v36 = -[SoftISPInputFrame metadata]((uint64_t)v7);
        int32x2_t v37 = [v36 objectForKeyedSubscript:@"AWBComboGGain"];
        [v37 floatValue];
        v38.i64[0] = __PAIR64__(v48, v52.u32[0]);
        v38.i64[1] = __PAIR64__(v39, v47);
        float32x4_t v53 = v38;

        int32x2_t v8 = v51;
        v42.i32[1] = v53.i32[1];
        *(float *)v40.i32 = vminvq_f32(v53);
        float32x4_t v41 = vdivq_f32(v53, (float32x4_t)vdupq_lane_s32(v40, 0));
        *(float *)v42.i32 = vminvq_f32(v41);
        float v43 = v41.f32[1];
        if (v41.f32[0] >= v41.f32[1]) {
          float v44 = v41.f32[1];
        }
        else {
          float v44 = v41.f32[0];
        }
        if (v41.f32[0] > v41.f32[1]) {
          float v43 = v41.f32[0];
        }
        if (v43 >= v41.f32[2]) {
          float v43 = v41.f32[2];
        }
        if (v44 > v43) {
          float v43 = v44;
        }
        if (*((float *)a5 + 1) < v43) {
          float v43 = *((float *)a5 + 1);
        }
        *(float *)v42.i32 = *(float *)v42.i32 * v43;
        *((float32x4_t *)a5 + 2) = vdivq_f32((float32x4_t)vdupq_lane_s32(v42, 0), v41);
        *((_DWORD *)a5 + 13) = 1199570688;
        int v45 = 0;
        *((float *)a5 + 12) = (float)(int)-[SoftISPInputFrame averageSensorBlackLevel]((uint64_t)v7);
      }
      else
      {
        FigDebugAssert3();
        int v45 = FigSignalErrorAt();
      }
    }
    else
    {
      int v45 = 0;
    }
  }
  else
  {
    int v45 = FigSignalErrorAt();
    float32x4_t v14 = 0;
    __int16 v12 = 0;
  }

  return v45;
}

- (int)getRFPNConfigForInputFrame:(id)a3 rFPNConfig:(id *)a4
{
  id v5 = a3;
  unsigned __int8 v6 = v5;
  char v41 = 0;
  if (!v5 || !a4)
  {
    int v39 = FigSignalErrorAt();
    __int32 v10 = 0;
    int32x2_t v8 = 0;
    goto LABEL_25;
  }
  *(_OWORD *)&a4[48].var0 = 0u;
  *(_OWORD *)&a4[64].var0 = 0u;
  *(_OWORD *)&a4[16].var0 = 0u;
  *(_OWORD *)&a4[32].var0 = 0u;
  *(_OWORD *)&a4->var0 = 0u;
  id v7 = -[SoftISPInputFrame metadata]((uint64_t)v5);
  int32x2_t v8 = v7;
  if (!v7)
  {
    FigDebugAssert3();
    int v39 = FigSignalErrorAt();
    __int32 v10 = 0;
    goto LABEL_25;
  }
  __int32 v9 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F670]];
  __int32 v10 = v9;
  BOOL v11 = v9 != 0;
  if (!v9) {
    goto LABEL_23;
  }
  int v12 = objc_msgSend(v9, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F790], 0, &v41);
  if (!v41) {
    goto LABEL_24;
  }
  int v13 = v12;
  int v14 = objc_msgSend(v10, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F788], 0, &v41);
  if (!v41) {
    goto LABEL_24;
  }
  int v15 = v14;
  if (v13 >= 1 && v14 >= 1)
  {
    BOOL v17 = v13 == 2 || v13 == 4;
    if (v17 && (v14 == 2 || v14 == 4))
    {
      int32x2_t v18 = [v10 objectForKeyedSubscript:*MEMORY[0x263F2F780]];
      if (v18)
      {
        int32x2_t v19 = v18;
        uint64_t v20 = (v15 * v13);
        if ([v18 length] != 4 * v20)
        {
          int v39 = FigSignalErrorAt();

          goto LABEL_25;
        }
        id v21 = v19;
        int8x8_t v22 = (__int32 *)[v21 bytes];
        uint64_t v23 = 0;
        int32x2_t v24 = 0;
        do
          *(float *)v24.i32 = *(float *)v24.i32 + (float)v22[v23++];
        while (v20 != v23);
        *(float *)v24.i32 = *(float *)v24.i32 / (float)(int)v20;
        v25.i32[0] = *v22;
        v25.i32[1] = v22[1 % v13];
        v25.i32[2] = v22[2 % v13];
        v25.i32[3] = v22[3 % v13];
        float32x4_t v26 = (float32x4_t)vdupq_lane_s32(v24, 0);
        int v27 = v13 - v13 * 1 / v15 * v15;
        v28.i32[0] = v22[v27];
        v28.i32[1] = v22[v27 + 1 % v13];
        v28.i32[2] = v22[v27 + 2 % v13];
        v28.i32[3] = v22[v27 + 3 % v13];
        int64x2_t v29 = (int64x2_t)vsubq_f32(vcvtq_f32_s32(v25), v26);
        int64x2_t v30 = (int64x2_t)vsubq_f32(vcvtq_f32_s32(v28), v26);
        int v31 = 2 % v15 * v13;
        v32.i32[0] = v22[v31];
        v32.i32[1] = v22[v31 + 1 % v13];
        v32.i32[2] = v22[v31 + 2 % v13];
        v32.i32[3] = v22[v31 + 3 % v13];
        int64x2_t v33 = (int64x2_t)vsubq_f32(vcvtq_f32_s32(v32), v26);
        int v34 = 3 % v15 * v13;
        v35.i32[0] = v22[v34];
        v35.i32[1] = v22[v34 + 1 % v13];
        v35.i32[2] = v22[v34 + 2 % v13];
        v35.i32[3] = v22[v34 + 3 % v13];
        int64x2_t v36 = (int64x2_t)vsubq_f32(vcvtq_f32_s32(v35), v26);
        a4->var0 = v11;
        int64x2_t v37 = vzip2q_s64(v29, v30);
        v29.i64[1] = v30.i64[0];
        *(int64x2_t *)&a4[16].var0 = v29;
        *(int64x2_t *)&a4[32].var0 = v37;
        int64x2_t v38 = vzip2q_s64(v33, v36);
        v33.i64[1] = v36.i64[0];
        *(int64x2_t *)&a4[48].var0 = v33;
        *(int64x2_t *)&a4[64].var0 = v38;

        goto LABEL_23;
      }
    }
LABEL_24:
    int v39 = FigSignalErrorAt();
    goto LABEL_25;
  }
LABEL_23:
  int v39 = 0;
LABEL_25:

  return v39;
}

- (H13FastRawScaleConfig)initWithStaticParameters:(id)a3 prepareDescriptor:(id)a4 outputPixelFormat:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  __int32 v10 = v9;
  if (!v8 || !v9 || !v5) {
    goto LABEL_13;
  }
  v16.receiver = self;
  v16.super_class = (Class)H13FastRawScaleConfig;
  self = [(SoftISPConfig *)&v16 initWithStaticParameters:v8];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_8;
  }
  -[SoftISPConfig setMaximumOutputDimensions:](self, "setMaximumOutputDimensions:", [v10 maximumWidth] | ((unint64_t)objc_msgSend(v10, "maximumHeight") << 32));
  -[SoftISPConfig setInputPixelFormat:](self, "setInputPixelFormat:", [v10 inputPixelFormat]);
  BOOL v11 = determineMTLPixelFormatsForCVPixelFormat([(SoftISPConfig *)self inputPixelFormat]);
  [(SoftISPConfig *)self setInputMTLPixelFormatForPlane:v11];

  int v12 = [(SoftISPConfig *)self inputMTLPixelFormatForPlane];

  if (!v12) {
    goto LABEL_13;
  }
  [(SoftISPConfig *)self setOutputPixelFormat:v5];
  int v13 = determineMTLPixelFormatsForCVPixelFormat([(SoftISPConfig *)self outputPixelFormat]);
  [(SoftISPConfig *)self setOutputMTLPixelFormatForPlane:v13];

  int v14 = [(SoftISPConfig *)self outputMTLPixelFormatForPlane];

  if (!v14)
  {
LABEL_13:
    FigDebugAssert3();

    self = 0;
    goto LABEL_8;
  }
  -[SoftISPConfig setStageConfigMode:](self, "setStageConfigMode:", [v10 stageConfigMode]);
  [(H13FastRawScaleConfig *)self setShouldMatchGenregs:0];
LABEL_8:

  return self;
}

- (BOOL)shouldMatchGenregs
{
  return self->shouldMatchGenregs;
}

- (void)setShouldMatchGenregs:(BOOL)a3
{
  self->shouldMatchGenregs = a3;
}

- (int)getBlackLevelEstimationEnabledForInputFrame:(id)a3 enabled:(BOOL *)a4
{
  id v6 = a3;
  id v7 = v6;
  char v26 = 0;
  if (v6)
  {
    if (!a4)
    {
      int v21 = FigSignalErrorAt();
      goto LABEL_11;
    }
    id v8 = -[SoftISPInputFrame metadata]((uint64_t)v6);
    if (v8)
    {
      id v9 = [(SoftISPConfig *)self staticParameters];
      __int32 v10 = [v9 tuningParametersForInputFrameMetadata:v8 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v7)];

      uint64_t v11 = [v10 valueForKey:@"BlackLevelEstimation"];
      int v12 = (void *)v11;
      int v13 = (void *)MEMORY[0x263EFFA78];
      if (v11) {
        int v13 = (void *)v11;
      }
      id v14 = v13;

      if (objc_msgSend(v14, "cmi_BOOLValueForKey:defaultValue:found:", @"Enabled", 0, 0))
      {
        *(double *)v15.i64 = -[SoftISPInputFrame sensorBlackLevel]((uint64_t)v7);
        int32x4_t v25 = v15;
        unsigned int v16 = -[SoftISPInputFrame uncorrectedSensorBlackLevel]((uint64_t)v7);
        objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", @"MaxOPBErrorRatio", &v26, 0.0);
        if (v26
          && (float v18 = v17,
              int v19 = -[SoftISPInputFrame pipelineHeadRoom]((uint64_t)v7),
              objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", @"MinPerceivableAdjustment", &v26, 0.0), v26))
        {
          int v21 = 0;
          int8x16_t v22 = (int8x16_t)vsubq_s32(v25, vdupq_n_s32(v16));
          *(int32x2_t *)v22.i8 = vadd_s32(*(int32x2_t *)v22.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v22, v22, 8uLL));
          BOOL v23 = (float)((float)(v18
                              * fmaxf((float)vadd_s32(*(int32x2_t *)v22.i8, vdup_lane_s32(*(int32x2_t *)v22.i8, 1)).i32[0]* 0.25, 0.0))/ (float)v19) >= v20;
        }
        else
        {
          int v21 = FigSignalErrorAt();
          BOOL v23 = 1;
        }
      }
      else
      {
        BOOL v23 = 0;
        int v21 = 0;
      }
      goto LABEL_10;
    }
    FigDebugAssert3();
    int v21 = FigSignalErrorAt();
    id v14 = 0;
    __int32 v10 = 0;
  }
  else
  {
    int v21 = FigSignalErrorAt();
    if (!a4) {
      goto LABEL_11;
    }
    id v14 = 0;
    __int32 v10 = 0;
    id v8 = 0;
  }
  BOOL v23 = 0;
LABEL_10:
  *a4 = v23;

LABEL_11:
  return v21;
}

- (int)getBlackLevelEstimationConfigForInputFrame:(id)a3 pdpConfig:(id *)a4 blackLevelEstimationConfig:(id *)a5
{
  id v8 = a3;
  id v9 = v8;
  char v40 = 0;
  if (!v8 || !a4 || !a5) {
    goto LABEL_37;
  }
  uint64_t v10 = -[SoftISPInputFrame metadata]((uint64_t)v8);
  if (!v10)
  {
    FigDebugAssert3();
LABEL_37:
    int v37 = FigSignalErrorAt();
    goto LABEL_31;
  }
  uint64_t v11 = (void *)v10;
  int v12 = [(SoftISPConfig *)self staticParameters];
  int v13 = [v12 tuningParametersForInputFrameMetadata:v11 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v9)];

  uint64_t v14 = [v13 valueForKey:@"BlackLevelEstimation"];
  int32x4_t v15 = (void *)v14;
  unsigned int v16 = (void *)MEMORY[0x263EFFA78];
  if (v14) {
    unsigned int v16 = (void *)v14;
  }
  id v17 = v16;

  if (objc_msgSend(v17, "cmi_BOOLValueForKey:defaultValue:found:", @"Enabled", 0, 0))
  {
    *(double *)v18.i64 = -[SoftISPInputFrame sensorBlackLevel]((uint64_t)v9);
    int32x4_t v39 = v18;
    unsigned int v19 = -[SoftISPInputFrame uncorrectedSensorBlackLevel]((uint64_t)v9);
    objc_msgSend(v17, "cmi_floatValueForKey:defaultValue:found:", @"MaxOPBErrorRatio", &v40, 0.0);
    if (v40)
    {
      int8x16_t v21 = (int8x16_t)vsubq_s32(v39, vdupq_n_s32(v19));
      *(int32x2_t *)v21.i8 = vadd_s32(*(int32x2_t *)v21.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v21, v21, 8uLL));
      *(float *)&a5[3].var0[0].var0 = (float)(v20
                                            * fmaxf((float)vadd_s32(*(int32x2_t *)v21.i8, vdup_lane_s32(*(int32x2_t *)v21.i8, 1)).i32[0]* 0.25, 0.0))/ (float)(int)-[SoftISPInputFrame pipelineHeadRoom]((uint64_t)v9);
      objc_msgSend(v17, "cmi_floatValueForKey:defaultValue:found:", @"InlierDeltaThreshold", &v40, 0.0);
      *(_DWORD *)&a5[3].var0[2].var0 = v22;
      if (v40)
      {
        objc_msgSend(v17, "cmi_floatValueForKey:defaultValue:found:", @"NeighborsDeltaThreshold", &v40, 0.0);
        a5[3].var1 = v23;
        if (v40)
        {
          objc_msgSend(v17, "cmi_floatValueForKey:defaultValue:found:", @"FocusPixelScaling", &v40, 0.0);
          a5[3].var2 = v24;
          if (v40)
          {
            objc_msgSend(v17, "cmi_floatValueForKey:defaultValue:found:", @"MaxInlierValue", &v40, 0.0);
            a5[3].var3 = v25;
            if (v40)
            {
              if (-[SoftISPInputFrame cfaLayout]((uint64_t)v9) == 3)
              {
                unint64_t v26 = 0;
                int16x4_t v27 = 0;
                int32x4_t v28 = a5;
                while (1)
                {
                  float v29 = *(float *)&a4->var0[8].var0;
                  long long v30 = *(_OWORD *)&a4->var0[0].var0;
                  *(_OWORD *)&v28->var0[0].var0 = *(_OWORD *)&a4->var0[0].var0;
                  v28->var3 = v29;
                  if (v26 <= 1)
                  {
                    if (!v28->var0[0].var0) {
                      goto LABEL_32;
                    }
                  }
                  else if (!v28->var0[0].var0)
                  {
                    goto LABEL_20;
                  }
                  LOWORD(v30) = LOWORD(v28->var3);
                  WORD2(v30) = HIWORD(v28->var3);
                  unsigned __int32 v31 = vuzp1_s16(v27, v27).u32[0];
                  int16x4_t v27 = (int16x4_t)vmovl_u16(vmax_u16((uint16x4_t)v31, (uint16x4_t)vuzp1_s16(*(int16x4_t *)&v30, (int16x4_t)v31).u32[0])).u64[0];
LABEL_20:
                  ++v26;
                  int32x4_t v28 = ($67A24B1E1D902BE3A1826A1F63D0E04D *)((char *)v28 + 20);
                  a4 = (const $D74E51C6D02B1099BA11C1EFF89AFCD0 *)((char *)a4 + 80);
                  if (v26 == 4) {
                    goto LABEL_29;
                  }
                }
              }
              unint64_t v32 = 0;
              int16x4_t v27 = 0;
              int64x2_t v33 = a5;
              while (1)
              {
                float v34 = *(float *)&a4->var0[8].var0;
                long long v35 = *(_OWORD *)&a4->var0[0].var0;
                *(_OWORD *)&v33->var0[0].var0 = *(_OWORD *)&a4->var0[0].var0;
                v33->var3 = v34;
                if (v32 <= 1)
                {
                  if (!v33->var0[0].var0)
                  {
LABEL_32:
                    FigDebugAssert3();
                    break;
                  }
                }
                else if (!v33->var0[0].var0)
                {
                  goto LABEL_28;
                }
                LOWORD(v35) = LOWORD(v33->var3);
                WORD2(v35) = HIWORD(v33->var3);
                unsigned __int32 v36 = vuzp1_s16(v27, v27).u32[0];
                int16x4_t v27 = (int16x4_t)vmovl_u16(vmax_u16((uint16x4_t)v36, (uint16x4_t)vuzp1_s16(*(int16x4_t *)&v35, (int16x4_t)v36).u32[0])).u64[0];
LABEL_28:
                ++v32;
                a4 = (const $D74E51C6D02B1099BA11C1EFF89AFCD0 *)((char *)a4 + 20);
                int64x2_t v33 = ($67A24B1E1D902BE3A1826A1F63D0E04D *)((char *)v33 + 20);
                if (v32 == 4)
                {
LABEL_29:
                  HIWORD(a5[2].var5) = v27.i16[2];
                  LOWORD(a5[2].var5) = v27.i16[0];
                  goto LABEL_30;
                }
              }
            }
          }
        }
      }
    }
    int v37 = FigSignalErrorAt();
  }
  else
  {
    *(void *)&a5[3].var2 = 0;
    *(_OWORD *)&a5[2].var1 = 0u;
    *(_OWORD *)&a5[2].var5 = 0u;
    *(_OWORD *)&a5[1].var0[2].var0 = 0u;
    *(_OWORD *)&a5[1].var4 = 0u;
    *(_OWORD *)&a5->var0[0].var0 = 0u;
    *(_OWORD *)&a5->var3 = 0u;
LABEL_30:

    int v37 = 0;
  }
LABEL_31:

  return v37;
}

- (int)getDMAInputConfigForInputFrame:(id)a3 dmaInputConfig:(id *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (!v5 || !a4) {
    goto LABEL_5;
  }
  int v7 = -[SoftISPInputFrame compandingMode]((uint64_t)v5);
  BOOL v8 = 0;
  BOOL v9 = 0;
  switch(v7)
  {
    case 1:
      break;
    case 2:
      BOOL v8 = 1;
      BOOL v9 = 1;
      break;
    case 3:
      BOOL v9 = 0;
      BOOL v8 = 1;
      break;
    default:
      goto LABEL_5;
  }
  a4->var2 = 1;
  a4->var0 = v8;
  a4->var1 = v9;
  *(void *)&a4[4].var0 = 0;
  *(void *)&a4[6].var0 = 0;
  int v11 = -[SoftISPInputFrame inputBitDepth]((uint64_t)v6);
  if (v11 > 0)
  {
    int v10 = 0;
    a4->var3 = v11;
  }
  else
  {
LABEL_5:
    int v10 = FigSignalErrorAt();
  }

  return v10;
}

- (int)generatePDPConfigFromInputFrameMetadata:(id)a3 bounds:(id)a4 toPdpConfig:(id *)a5
{
  v123[31] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  char v121 = 0;
  int v10 = -[SoftISPInputFrame metadata]((uint64_t)v8);
  int v11 = [(SoftISPConfig *)self staticParameters];
  int v12 = [v11 moduleConfigForInputFrameMetadata:v10];

  if (!v10)
  {
    FigDebugAssert3();
    int v96 = -73660;
    goto LABEL_71;
  }
  char v108 = v12;
  if (!v12)
  {
    FigDebugAssert3();
    int v96 = -73591;
    int v12 = 0;
    goto LABEL_71;
  }
  int v13 = [(SoftISPConfig *)self staticParameters];
  uint64_t v14 = [v13 tuningParametersForInputFrameMetadata:v10 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v8)];

  if (!v14) {
    FigSignalErrorAt();
  }
  uint64_t v106 = v14;
  int32x4_t v15 = [v14 objectForKeyedSubscript:@"PDP"];
  unsigned int v16 = v15;
  if (!v15)
  {
    FigSignalErrorAt();
    unsigned int v16 = (void *)MEMORY[0x263EFFA78];
  }
  id v17 = v16;

  __int16 v105 = v17;
  int v18 = objc_msgSend(v17, "cmi_intValueForKey:defaultValue:found:", @"gainBypassThreshold", 65534, &v121);
  if (!v121) {
    FigSignalErrorAt();
  }
  int v12 = v108;
  unsigned int v19 = [v108 objectForKeyedSubscript:@"FocusPixels"];
  if (!v19)
  {
    FigDebugAssert3();
    int v96 = FigSignalErrorAt();
LABEL_76:

    goto LABEL_71;
  }
  int v104 = v19;
  float v20 = [v19 objectForKeyedSubscript:@"Layout"];
  int8x16_t v21 = [v20 objectForKeyedSubscript:@"Patterns"];
  if ((unint64_t)[v21 count] >= 0x11)
  {
    FigDebugAssert3();
    int v96 = FigSignalErrorAt();

    goto LABEL_76;
  }
  *(void *)&a5[6].var0[8].var0 = 0;
  *(_OWORD *)&a5[5].var5 = 0u;
  *(_OWORD *)&a5[6].var0[0].var0 = 0u;
  *(_OWORD *)&a5[5].var0[4].var0 = 0u;
  *(_OWORD *)&a5[5].var0[12].var0 = 0u;
  *(_OWORD *)&a5[4].var1 = 0u;
  *(_OWORD *)&a5[4].var8 = 0u;
  *(_OWORD *)&a5[4].var0[0].var0 = 0u;
  *(_OWORD *)&a5[4].var0[8].var0 = 0u;
  *(_OWORD *)&a5[3].var0[12].var0 = 0u;
  *(_OWORD *)&a5[3].var5 = 0u;
  *(_OWORD *)&a5[2].var8 = 0u;
  *(_OWORD *)&a5[3].var0[4].var0 = 0u;
  *(_OWORD *)&a5[2].var0[8].var0 = 0u;
  *(_OWORD *)&a5[2].var1 = 0u;
  *(_OWORD *)&a5[1].var5 = 0u;
  *(_OWORD *)&a5[2].var0[0].var0 = 0u;
  *(_OWORD *)&a5[1].var0[4].var0 = 0u;
  *(_OWORD *)&a5[1].var0[12].var0 = 0u;
  *(_OWORD *)&a5->var1 = 0u;
  *(_OWORD *)&a5->var8 = 0u;
  *(_OWORD *)&a5->var0[0].var0 = 0u;
  *(_OWORD *)&a5->var0[8].var0 = 0u;
  int v22 = [(SoftISPConfig *)self staticParameters];
  uint64_t v101 = v10;
  int32x2_t v23 = (int32x2_t)[v22 dimensionsForSensorInBayerPixelsInMetadata:v10];

  LOBYTE(a5[5].var5) = v20 != 0;
  int v24 = -[SoftISPInputFrame cfaLayout]((uint64_t)v8);
  uint64_t v103 = (uint64_t)v8;
  BYTE1(a5[5].var5) = -[SoftISPInputFrame firstPixel]((uint64_t)v8);
  *(_DWORD *)&a5[5].var9 = -65536;
  *(_DWORD *)&a5[6].var0[0].var0 = v18;
  BYTE2(a5[5].var5) = 1;
  *(_DWORD *)&a5[6].var0[2].var0 = 0;
  id v102 = v9;
  uint64_t v25 = -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v9);
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  if (v24 == 3) {
    signed int v29 = 2;
  }
  else {
    signed int v29 = 1;
  }
  int v30 = (int)v25 / v29;
  int v31 = SHIDWORD(v25) / v29;
  v32.i32[0] = (int)v25 / v29;
  v32.i32[1] = SHIDWORD(v25) / v29;
  int32x2_t v33 = (int32x2_t)vshr_n_u32((uint32x2_t)vadd_s32(v23, (int32x2_t)0xF0000000FLL), 4uLL);
  int32x2_t v34 = vshl_n_s32(v32, 0xBuLL);
  int v35 = v34.i32[1] / v33.i32[1];
  __int32 v36 = v34.i32[0];
  int32x2_t v37 = vmul_s32(vdup_n_s32(v29), v33);
  int v38 = v36 / v33.i32[0];
  BOOL v39 = v24 != 3 && v20 != 0;
  LOBYTE(a5[5].var5) = v39;
  v37.i32[0] = 0x8000000u / v37.i32[0];
  v37.i32[1] = 0x8000000u / v37.i32[1];
  *(void *)&a5[6].var0[4].var0 = __PAIR64__(v35, v38);
  *(int32x2_t *)&a5[6].var0[8].var0 = v37;
  int8x8_t v115 = v21;
  if ([v21 count])
  {
    int v107 = 0;
    unint64_t v40 = 0;
    v41.i32[0] = v28 >> (v24 == 3);
    v41.i32[1] = HIDWORD(v28) >> (v24 == 3);
    int32x2_t v111 = (int32x2_t)__PAIR64__(v31, v30);
    int8x8_t v42 = (int8x8_t)vadd_s32(v41, (int32x2_t)__PAIR64__(v31, v30));
    unsigned int v109 = (unsigned __int16)v31;
    unsigned int v110 = (unsigned __int16)v30;
    float v43 = v123;
    int32x2_t v44 = (int32x2_t)vand_s8(v42, (int8x8_t)0xFFFF0000FFFFLL);
    int v112 = a5;
    unint64_t v113 = v20;
    while (1)
    {
      int v45 = objc_msgSend(v21, "objectAtIndexedSubscript:", v40, v98, v99);
      uint64_t v46 = [v45 objectForKeyedSubscript:@"PixelType"];
      unint64_t v117 = [v45 objectForKeyedSubscript:@"X"];
      uint64_t v116 = [v45 objectForKeyedSubscript:@"Y"];
      if (!v45)
      {
        uint64_t v99 = v100;
        LODWORD(v98) = 0;
LABEL_43:
        FigDebugAssert3();
        int v107 = FigSignalErrorAt();
        char v74 = 0;
        goto LABEL_36;
      }
      if (!v46)
      {
        uint64_t v99 = v100;
        LODWORD(v98) = 0;
        goto LABEL_43;
      }
      if (!v117)
      {
        uint64_t v99 = v100;
        LODWORD(v98) = 0;
        goto LABEL_43;
      }
      if (!v116)
      {
        uint64_t v99 = v100;
        LODWORD(v98) = 0;
        goto LABEL_43;
      }
      a5->var0[0].var0 = 1;
      a5->var0[0].var1 = mapStringToPixelType(v46);
      int v47 = objc_msgSend(v117, "cmi_unsignedIntValueForKey:defaultValue:found:", @"Start", 0, &v121);
      if (!v121)
      {
        uint64_t v99 = v100;
        LODWORD(v98) = 0;
        FigDebugAssert3();
        int v107 = FigSignalErrorAt();
        char v74 = 0;
LABEL_46:
        int8x16_t v21 = v115;
        goto LABEL_36;
      }
      int v48 = v47;
      __int16 v49 = objc_msgSend(v116, "cmi_unsignedIntValueForKey:defaultValue:found:", @"Start", 0, &v121);
      if (!v121)
      {
        uint64_t v99 = v100;
        LODWORD(v98) = 0;
        FigDebugAssert3();
        int v107 = FigSignalErrorAt();
        char v74 = 0;
        float v20 = v113;
        goto LABEL_46;
      }
      __int16 v50 = v49;
      int v114 = v46;
      unsigned int v51 = objc_msgSend(v117, "cmi_unsignedIntValueForKey:defaultValue:found:", @"Step", 0, &v121);
      if (!v121) {
        break;
      }
      unsigned int v52 = v51;
      unsigned int v53 = objc_msgSend(v116, "cmi_unsignedIntValueForKey:defaultValue:found:", @"Step", 0, &v121);
      if (!v121)
      {
        uint64_t v99 = v100;
        LODWORD(v98) = 0;
        goto LABEL_49;
      }
      unsigned int v54 = v53;
      __int16 v55 = objc_msgSend(v117, "cmi_unsignedIntValueForKey:defaultValue:found:", @"Count", 0, &v121);
      if (!v121)
      {
        uint64_t v99 = v100;
        LODWORD(v98) = 0;
        FigDebugAssert3();
        int v107 = FigSignalErrorAt();
        char v74 = 0;
        a5 = v112;
        float v20 = v113;
        int8x16_t v21 = v115;
        goto LABEL_53;
      }
      __int16 v56 = v55;
      __int16 v57 = objc_msgSend(v116, "cmi_unsignedIntValueForKey:defaultValue:found:", @"Count", 0, &v121);
      if (!v121)
      {
        uint64_t v99 = v100;
        LODWORD(v98) = 0;
        FigDebugAssert3();
        int v107 = FigSignalErrorAt();
        char v74 = 0;
        a5 = v112;
LABEL_52:
        float v20 = v113;
        int8x16_t v21 = v115;
LABEL_53:
        uint64_t v46 = v114;
        goto LABEL_36;
      }
      if ((v26 & 0x8000000080000000) != 0)
      {
        int v72 = 0;
        unint64_t v73 = 0;
      }
      else
      {
        HIWORD(v120) = v54;
        LOWORD(v120) = v52;
        int8x8_t v59 = vand_s8((int8x8_t)__PAIR64__(v54, v52), (int8x8_t)0xFFFF0000FFFFLL);
        v60.i16[0] = v48;
        v60.i16[1] = v50;
        v60.i16[2] = v48;
        v60.i16[3] = v50;
        v62.i32[0] = (unsigned __int16)v48;
        uint32x2_t v61 = vshl_u32(v60, (uint32x2_t)0xFFFFFFF0FFFF0001);
        v62.i32[1] = v61.i32[1];
        unsigned int v63 = v110 - (unsigned __int16)v48;
        v58.i16[0] = v56;
        v58.i16[1] = v57;
        uint32x2_t v64 = (uint32x2_t)vdup_lane_s32(v58, 0);
        if (v110 < (unsigned __int16)v48) {
          unsigned int v63 = 0;
        }
        v58.i16[1] = 0;
        v58.i32[1] = vshl_u32(v64, (uint32x2_t)0xFFFFFFF0FFFF0001).i32[1];
        int32x2_t v65 = (int32x2_t)vand_s8((int8x8_t)__PAIR64__(v54, v120), (int8x8_t)0xFFFF0000FFFFLL);
        int32x2_t v66 = vmla_s32(vneg_s32((int32x2_t)vmvn_s8(v62)), vadd_s32(v58, (int32x2_t)-1), v65);
        __int32 v67 = v48 + (int)(v63 + v65.i32[0] - 1) / v65.i32[0] * v65.i32[0];
        unsigned __int32 v68 = v109 - v61.i32[1];
        if (v109 < v61.i32[1]) {
          unsigned __int32 v68 = 0;
        }
        v65.i32[0] = v67;
        v65.i32[1] = v61.i32[1] + (int)(v68 + v65.i32[1] - 1) / v65.i32[1] * v65.i32[1];
        int32x2_t v69 = (int32x2_t)vbsl_s8((int8x8_t)vcgt_s32(v44, v66), (int8x8_t)v66, v42);
        int32x2_t v70 = vsub_s32(v65, v111);
        HIWORD(v118) = v70.i16[2];
        LOWORD(v118) = v70.i16[0];
        int8x8_t v71 = vand_s8((int8x8_t)vadd_s32(vadd_s32(v69, (int32x2_t)__PAIR64__(v54, v52)), (int32x2_t)vmvn_s8((int8x8_t)v65)), (int8x8_t)0xFFFF0000FFFFLL);
        HIWORD(v119) = v71.i32[1] / (unsigned __int32)v59.i32[1];
        LOWORD(v119) = v71.i32[0] / (unsigned __int32)v59.i32[0];
        int v72 = v118;
        unint64_t v73 = v119 | ((unint64_t)v120 << 32);
      }
      a5 = v112;
      float v20 = v113;
      int8x16_t v21 = v115;
      char v74 = 1;
      *((_DWORD *)v43 - 2) = 1;
      *((_DWORD *)v43 - 1) = v72;
      *float v43 = v73;
      uint64_t v46 = v114;
      *((unsigned char *)v43 - 7) = mapStringToPixelType(v114);
LABEL_36:

      if ((v74 & 1) == 0)
      {

        id v8 = (id)v103;
        goto LABEL_70;
      }
      ++v40;
      v43 += 2;
      if (v40 >= [v21 count]) {
        goto LABEL_56;
      }
    }
    uint64_t v99 = v100;
    LODWORD(v98) = 0;
LABEL_49:
    FigDebugAssert3();
    int v107 = FigSignalErrorAt();
    char v74 = 0;
    goto LABEL_52;
  }
  int v107 = 0;
LABEL_56:
  qsort(__base, objc_msgSend(v21, "count", v98, v99), 0x10uLL, (int (__cdecl *)(const void *, const void *))PatternCompareYX);
  if (![v21 count])
  {
    uint64_t v93 = 0;
LABEL_67:
    uint64_t v94 = 20 * v93;
    do
    {
      uint64_t v95 = (char *)a5 + v94;
      *(_WORD *)uint64_t v95 = 256;
      *(void *)(v95 + 12) = 0;
      *(void *)(v95 + 4) = 0;
      v94 += 20;
    }
    while (v94 != 320);
    goto LABEL_69;
  }
  unint64_t v78 = 0;
  uint64_t v79 = 0;
  int32x2_t v80 = vdup_n_s32(v29);
  do
  {
    unsigned int v81 = 0;
    int v82 = &__base[16 * v78];
    v75.i16[0] = *((_WORD *)v82 + 2);
    v75.i16[2] = *((_WORD *)v82 + 3);
    v76.i16[0] = *((_WORD *)v82 + 6);
    v76.i16[2] = *((_WORD *)v82 + 7);
    int32x2_t v83 = vmul_s32(v75, v80);
    int32x2_t v84 = vmul_s32(v76, v80);
    v77.i16[0] = *((_WORD *)v82 + 4);
    v77.i16[2] = *((_WORD *)v82 + 5);
    char v85 = *v82;
    unsigned __int8 v86 = v82[1];
    int32x2_t v87 = vmul_s32(vadd_s32(v77, (int32x2_t)0xFFFF0000FFFFLL), v84);
    do
    {
      uint64_t v88 = 0;
      uint64_t v89 = v79;
      int v90 = &a5->var0[10 * v79 + 4];
      do
      {
        int32x2_t v91 = vadd_s32((int32x2_t)__PAIR64__(v81, v88), v83);
        int32x2_t v92 = vadd_s32(v91, v87);
        v90[-1] = *($F9EF8680D2F257A31A70FACC2CDCD028 *)&v91.u8[4];
        v90[-2] = *($F9EF8680D2F257A31A70FACC2CDCD028 *)v91.i8;
        v90[-4].var0 = v85;
        v90[1] = *($F9EF8680D2F257A31A70FACC2CDCD028 *)&v84.u8[4];
        *int v90 = *($F9EF8680D2F257A31A70FACC2CDCD028 *)v84.i8;
        v90[-4].var1 = v86;
        v90[3] = *($F9EF8680D2F257A31A70FACC2CDCD028 *)&v92.u8[4];
        v90[2] = *($F9EF8680D2F257A31A70FACC2CDCD028 *)v92.i8;
        v90[5] = *($F9EF8680D2F257A31A70FACC2CDCD028 *)&v77.u8[4];
        v90[4] = *($F9EF8680D2F257A31A70FACC2CDCD028 *)v77.i8;
        ++v88;
        v90 += 10;
      }
      while (v29 != v88);
      ++v81;
      v79 += v88;
    }
    while (v81 != v29);
    ++v78;
  }
  while (v78 < [v115 count]);
  uint64_t v93 = v89 + v88;
  int8x16_t v21 = v115;
  if ((unint64_t)(v89 + v88) <= 0xF) {
    goto LABEL_67;
  }
LABEL_69:
  id v8 = (id)v103;
  *(_DWORD *)&a5[5].var6 = -(int)-[SoftISPInputFrame uncorrectedSensorBlackLevel](v103);
  a5[5].var8 = -[SoftISPInputFrame uncorrectedSensorBlackLevel](v103);

LABEL_70:
  int v10 = v101;
  id v9 = v102;
  int v12 = v108;
  int v96 = v107;
LABEL_71:

  return v96;
}

- (int)getPDPConfigForInputFrame:(id)a3 bounds:(id)a4 pdpConfig:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8 || !a5)
  {
LABEL_71:
    int v51 = FigSignalErrorAt();
    goto LABEL_56;
  }
  if ([(SoftISPConfig *)self stageConfigMode] == 3
    || [(SoftISPConfig *)self stageConfigMode] == 4)
  {
    -[SoftISPInputFrame registers]((uint64_t)v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    int v11 = v10;
    LOBYTE(v59[0]) = 0;
    if (v10)
    {
      int v12 = [v10 objectForKeyedSubscript:@"RsclProcPDP0"];
      if (v12)
      {
        int v13 = v12;
        uint64_t v14 = [v12 objectForKeyedSubscript:@"Config"];
        if (v14)
        {
          int32x4_t v15 = (void *)v14;
          uint64_t v16 = [v13 objectForKeyedSubscript:@"GridConfig"];
          if (v16)
          {
            id v17 = (void *)v16;
            int32x2_t v58 = [v13 objectForKeyedSubscript:@"GridStart"];
            if (v58)
            {
              __int16 v57 = [v13 objectForKeyedSubscript:@"GridNumPix"];
              if (v57)
              {
                uint64_t v18 = [v13 objectForKeyedSubscript:@"InterpGain"];
                if (v18)
                {
                  unsigned int v19 = (void *)v18;
                  LOBYTE(a5[5].var5) = objc_msgSend(v15, "cmi_BOOLValueForKey:defaultValue:found:", @"Bypass", 1, v59) ^ 1;
                  if (LOBYTE(v59[0]))
                  {
                    BYTE1(a5[5].var5) = objc_msgSend(v13, "cmi_intValueForKey:defaultValue:found:", @"FirstPix", 0x7FFFFFFFLL, v59);
                    if (LOBYTE(v59[0]))
                    {
                      BYTE2(a5[5].var5) = objc_msgSend(v15, "cmi_intValueForKey:defaultValue:found:", @"NonGreenMode", 0x7FFFFFFFLL, v59);
                      if (LOBYTE(v59[0]))
                      {
                        *(_DWORD *)&a5[5].var6 = objc_msgSend(v13, "cmi_intValueForKey:defaultValue:found:", @"PDPOffsetIn", 0x7FFFFFFFLL, v59);
                        if (LOBYTE(v59[0]))
                        {
                          a5[5].var8 = objc_msgSend(v13, "cmi_intValueForKey:defaultValue:found:", @"PDPOffsetOut", 0x7FFFFFFFLL, v59);
                          if (LOBYTE(v59[0]))
                          {
                            a5[5].var9 = objc_msgSend(v13, "cmi_intValueForKey:defaultValue:found:", @"PDPClipMin", 0x7FFFFFFFLL, v59);
                            if (LOBYTE(v59[0]))
                            {
                              a5[5].var10 = objc_msgSend(v13, "cmi_intValueForKey:defaultValue:found:", @"PDPClipMax", 0x7FFFFFFFLL, v59);
                              if (LOBYTE(v59[0]))
                              {
                                *(_DWORD *)&a5[6].var0[0].var0 = objc_msgSend(v13, "cmi_intValueForKey:defaultValue:found:", @"GainBypassThd", 0x7FFFFFFFLL, v59);
                                if (LOBYTE(v59[0]))
                                {
                                  a5[6].var0[2] = ($F9EF8680D2F257A31A70FACC2CDCD028)objc_msgSend(v19, "cmi_intValueForKey:defaultValue:found:", @"Red", 0x7FFFFFFFLL, v59);
                                  if (LOBYTE(v59[0]))
                                  {
                                    a5[6].var0[3] = ($F9EF8680D2F257A31A70FACC2CDCD028)objc_msgSend(v19, "cmi_intValueForKey:defaultValue:found:", @"Blue", 0x7FFFFFFFLL, v59);
                                    if (LOBYTE(v59[0]))
                                    {
                                      objc_msgSend(v13, "cmi_simdInt2ValueForKey:defaultValue:found:", @"GainGridOffset", v59, COERCE_DOUBLE(0x7FFFFFFFLL));
                                      *(void *)&a5[6].var0[4].var0 = v20;
                                      if (LOBYTE(v59[0]))
                                      {
                                        objc_msgSend(v13, "cmi_simdUInt2ValueForXKey:yKey:defaultValue:found:", @"GainIntXRecip", @"GainIntYRecip", v59, COERCE_DOUBLE(0xFFFFFFFFLL));
                                        *(void *)&a5[6].var0[8].var0 = v21;
                                        if (LOBYTE(v59[0]))
                                        {
                                          id v56 = v9;
                                          uint64_t v22 = 0;
                                          int32x2_t v23 = &a5->var0[4];
                                          while (1)
                                          {
                                            v23[-4].var0 = objc_msgSend(v17, "cmi_BOOLValueFromArrayWithKey:forIndex:defaultValue:found:", @"GridEn", v22, 0, v59);
                                            if (!LOBYTE(v59[0]))
                                            {
                                              uint64_t v54 = v55;
                                              LODWORD(v53) = 0;
                                              goto LABEL_67;
                                            }
                                            v23[-4].var1 = objc_msgSend(v17, "cmi_unsignedIntValueFromArrayWithKey:forIndex:defaultValue:found:", @"Type", v22, 0, v59)+ 1;
                                            if (!LOBYTE(v59[0]))
                                            {
                                              uint64_t v54 = v55;
                                              LODWORD(v53) = 0;
                                              goto LABEL_67;
                                            }
                                            objc_msgSend(v58, "cmi_simdUInt2ValueFromArraysWithXKey:yKey:forIndex:defaultValue:found:", @"X", @"Y", v22, v59, 0.0);
                                            v23[-1] = v24;
                                            v23[-2] = v25;
                                            if (!LOBYTE(v59[0]))
                                            {
                                              uint64_t v54 = v55;
                                              LODWORD(v53) = 0;
                                              goto LABEL_67;
                                            }
                                            objc_msgSend(v17, "cmi_simdUInt2ValueFromArraysWithXKey:yKey:forIndex:defaultValue:found:", @"GridIntervalX", @"GridIntervalY", v22, v59, 0.0);
                                            v23[1] = v26;
                                            $F9EF8680D2F257A31A70FACC2CDCD028 *v23 = v27;
                                            if (!LOBYTE(v59[0]))
                                            {
                                              uint64_t v54 = v55;
                                              LODWORD(v53) = 0;
                                              goto LABEL_67;
                                            }
                                            objc_msgSend(v57, "cmi_simdUInt2ValueFromArraysWithXKey:yKey:forIndex:defaultValue:found:", @"X", @"Y", v22, v59, 0.0);
                                            v23[5] = v29;
                                            v23[4] = v28;
                                            if (!LOBYTE(v59[0])) {
                                              break;
                                            }
                                            *($F9EF8680D2F257A31A70FACC2CDCD028 *)v30.i8 = v23[-2];
                                            *($F9EF8680D2F257A31A70FACC2CDCD028 *)&v30.u8[4] = v23[-1];
                                            *($F9EF8680D2F257A31A70FACC2CDCD028 *)v31.i8 = *v23;
                                            *($F9EF8680D2F257A31A70FACC2CDCD028 *)&v31.u8[4] = v23[1];
                                            LOWORD(v32) = v28;
                                            HIWORD(v32) = v29;
                                            uint16x4_t v33 = vmax_u16((uint16x4_t)v32, (uint16x4_t)1);
                                            v34.i64[0] = -1;
                                            v34.i64[1] = -1;
                                            int32x2_t v35 = vmla_s32(v30, (int32x2_t)*(_OWORD *)&vaddw_u16(v34, v33), v31);
                                            v23[3] = *($F9EF8680D2F257A31A70FACC2CDCD028 *)&v35.u8[4];
                                            v23[2] = *($F9EF8680D2F257A31A70FACC2CDCD028 *)v35.i8;
                                            ++v22;
                                            v23 += 10;
                                            if (v22 == 16)
                                            {

                                              id v9 = v56;
                                              goto LABEL_32;
                                            }
                                          }
                                          uint64_t v54 = v55;
                                          LODWORD(v53) = 0;
LABEL_67:
                                          FigDebugAssert3();
                                          int v51 = FigSignalErrorAt();

                                          id v9 = v56;
LABEL_68:

                                          if (v51) {
                                            goto LABEL_101;
                                          }
LABEL_32:
                                          if ([(SoftISPConfig *)self stageConfigMode] == 4)
                                          {
                                            int32x2_t v62 = 0;
                                            long long v60 = 0u;
                                            long long v61 = 0u;
                                            memset(v59, 0, sizeof(v59));
                                            int v36 = [(H13FastRawScaleConfig *)self generatePDPConfigFromInputFrameMetadata:v8 bounds:v9 toPdpConfig:v59];
                                            if (!v36)
                                            {
                                              if (v60 == LOBYTE(a5[5].var5)
                                                && __PAIR64__(BYTE2(v60), BYTE1(v60)) == __PAIR64__(BYTE2(a5[5].var5), BYTE1(a5[5].var5))&& *(void *)((char *)&v60 + 4) == *(void *)&a5[5].var6&& __PAIR64__(HIWORD(v60), WORD6(v60)) == __PAIR64__(a5[5].var10, a5[5].var9)&& v61 == *(_DWORD *)&a5[6].var0[0].var0&& __PAIR64__(WORD3(v61), WORD2(v61)) == __PAIR64__(*(_WORD *)&a5[6].var0[3], *(_WORD *)&a5[6].var0[2]))
                                              {
                                                int32x2_t v37 = vceq_s32(*(int32x2_t *)((char *)&v61 + 8), *(int32x2_t *)&a5[6].var0[4].var0);
                                                if (v37.i8[0] & 1) != 0 && (v37.i8[4])
                                                {
                                                  int32x2_t v38 = vceq_s32(v62, *(int32x2_t *)&a5[6].var0[8].var0);
                                                  if (v38.i8[0] & 1) != 0 && (v38.i8[4])
                                                  {
                                                    unint64_t v39 = 0;
                                                    while (*((unsigned __int8 *)v59 + v39) == a5->var0[v39 / 2].var0)
                                                    {
                                                      if (*((unsigned char *)v59 + v39))
                                                      {
                                                        unint64_t v40 = (char *)v59 + v39;
                                                        int32x2_t v41 = (char *)a5 + v39;
                                                        if (*((unsigned __int8 *)v59 + v39 + 1) != a5->var0[v39 / 2].var1) {
                                                          break;
                                                        }
                                                        v42.i32[0] = *((unsigned __int16 *)v40 + 2);
                                                        v42.i32[1] = *((unsigned __int16 *)v40 + 3);
                                                        v43.i32[0] = *((unsigned __int16 *)v41 + 2);
                                                        v43.i32[1] = *((unsigned __int16 *)v41 + 3);
                                                        int32x2_t v44 = vceq_s32(v42, v43);
                                                        if ((v44.i8[0] & 1) == 0) {
                                                          break;
                                                        }
                                                        if ((v44.i8[4] & 1) == 0) {
                                                          break;
                                                        }
                                                        v45.i32[0] = *(unsigned __int16 *)((char *)v59 + v39 + 8);
                                                        v45.i32[1] = *(unsigned __int16 *)((char *)v59 + v39 + 10);
                                                        v46.i32[0] = (unsigned __int16)a5->var0[v39 / 2 + 4];
                                                        v46.i32[1] = (unsigned __int16)a5->var0[v39 / 2 + 5];
                                                        int32x2_t v47 = vceq_s32(v45, v46);
                                                        if ((v47.i8[0] & 1) == 0) {
                                                          break;
                                                        }
                                                        if ((v47.i8[4] & 1) == 0) {
                                                          break;
                                                        }
                                                        v48.i32[0] = *(unsigned __int16 *)((char *)v59 + v39 + 12);
                                                        v48.i32[1] = *(unsigned __int16 *)((char *)v59 + v39 + 14);
                                                        v49.i32[0] = (unsigned __int16)a5->var0[v39 / 2 + 6];
                                                        v49.i32[1] = (unsigned __int16)a5->var0[v39 / 2 + 7];
                                                        int32x2_t v50 = vceq_s32(v48, v49);
                                                        if ((v50.i8[0] & 1) == 0 || (v50.i8[4] & 1) == 0) {
                                                          break;
                                                        }
                                                      }
                                                      v39 += 20;
                                                      if (v39 == 320) {
                                                        goto LABEL_55;
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                              FigDebugAssert3();
                                              goto LABEL_71;
                                            }
                                            int v51 = v36;
LABEL_101:
                                            FigDebugAssert3();
                                            goto LABEL_56;
                                          }
                                          goto LABEL_55;
                                        }
                                        uint64_t v54 = v55;
                                        LODWORD(v53) = 0;
                                      }
                                      else
                                      {
                                        uint64_t v54 = v55;
                                        LODWORD(v53) = 0;
                                      }
                                    }
                                    else
                                    {
                                      uint64_t v54 = v55;
                                      LODWORD(v53) = 0;
                                    }
                                  }
                                  else
                                  {
                                    uint64_t v54 = v55;
                                    LODWORD(v53) = 0;
                                  }
                                }
                                else
                                {
                                  uint64_t v54 = v55;
                                  LODWORD(v53) = 0;
                                }
                              }
                              else
                              {
                                uint64_t v54 = v55;
                                LODWORD(v53) = 0;
                              }
                            }
                            else
                            {
                              uint64_t v54 = v55;
                              LODWORD(v53) = 0;
                            }
                          }
                          else
                          {
                            uint64_t v54 = v55;
                            LODWORD(v53) = 0;
                          }
                        }
                        else
                        {
                          uint64_t v54 = v55;
                          LODWORD(v53) = 0;
                        }
                      }
                      else
                      {
                        uint64_t v54 = v55;
                        LODWORD(v53) = 0;
                      }
                    }
                    else
                    {
                      uint64_t v54 = v55;
                      LODWORD(v53) = 0;
                    }
                  }
                  else
                  {
                    uint64_t v54 = v55;
                    LODWORD(v53) = 0;
                  }
                  FigDebugAssert3();
                  int v51 = FigSignalErrorAt();
                }
                else
                {
                  uint64_t v54 = v55;
                  LODWORD(v53) = 0;
                  FigDebugAssert3();
                  int v51 = FigSignalErrorAt();
                }
              }
              else
              {
                uint64_t v54 = v55;
                LODWORD(v53) = 0;
                FigDebugAssert3();
                int v51 = FigSignalErrorAt();
              }
            }
            else
            {
              uint64_t v54 = v55;
              LODWORD(v53) = 0;
              FigDebugAssert3();
              int v51 = FigSignalErrorAt();
            }
          }
          else
          {
            uint64_t v54 = v55;
            LODWORD(v53) = 0;
            FigDebugAssert3();
            int v51 = FigSignalErrorAt();
          }
        }
        else
        {
          uint64_t v54 = v55;
          LODWORD(v53) = 0;
          FigDebugAssert3();
          int v51 = FigSignalErrorAt();
        }

        goto LABEL_68;
      }
      uint64_t v54 = v55;
      LODWORD(v53) = 0;
    }
    else
    {
      uint64_t v54 = v55;
      LODWORD(v53) = 0;
    }
    FigDebugAssert3();
    int v51 = FigSignalErrorAt();
    goto LABEL_68;
  }
  if ([(SoftISPConfig *)self stageConfigMode] != 1
    && [(SoftISPConfig *)self stageConfigMode] != 2)
  {
    FigDebugAssert3();
LABEL_55:
    int v51 = 0;
    goto LABEL_56;
  }
  int v51 = [(H13FastRawScaleConfig *)self generatePDPConfigFromInputFrameMetadata:v8 bounds:v9 toPdpConfig:a5];
  if (v51) {
    goto LABEL_101;
  }
LABEL_56:

  return v51;
}

- (int)getPDPGainsForInputFrame:(id)a3 pdpGainsTex:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SoftISPConfig *)self stageConfigMode] != 3
    && [(SoftISPConfig *)self stageConfigMode] != 4
    && [(SoftISPConfig *)self stageConfigMode] != 2)
  {
    id v19 = 0;
    goto LABEL_14;
  }
  -[SoftISPInputFrame registers]((uint64_t)v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v8;
  if (!v8)
  {
    uint64_t v50 = v51;
    LODWORD(v49) = 0;
LABEL_53:
    FigDebugAssert3();
    LODWORD(v15) = FigSignalErrorAt();
LABEL_60:
    id v18 = 0;
    goto LABEL_13;
  }
  id v10 = [v8 objectForKeyedSubscript:@"RsclProcPDP0"];
  if (!v10)
  {
    uint64_t v50 = v51;
    LODWORD(v49) = 0;
    goto LABEL_53;
  }
  int v11 = v10;
  int v12 = [v10 objectForKeyedSubscript:@"GainLUT"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v50 = v51;
    LODWORD(v49) = 0;
LABEL_57:
    FigDebugAssert3();
    LODWORD(v15) = FigSignalErrorAt();
LABEL_59:

    goto LABEL_60;
  }
  if ([v12 count] != 1156)
  {
    uint64_t v50 = v51;
    LODWORD(v49) = 0;
    goto LABEL_57;
  }
  int v13 = [MEMORY[0x263EFF990] dataWithLength:4624];
  if (!v13)
  {
    uint64_t v50 = v51;
    LODWORD(v49) = 0;
    goto LABEL_57;
  }
  id v14 = v13;
  uint64_t v15 = [v14 mutableBytes];
  if (!v15)
  {
    uint64_t v50 = v51;
    LODWORD(v49) = 0;
    FigDebugAssert3();
    FigSignalErrorAt();

    goto LABEL_59;
  }
  for (uint64_t i = 0; i != 1156; ++i)
  {
    id v17 = [v12 objectAtIndexedSubscript:i];
    *(_DWORD *)(v15 + 4 * i) = [v17 unsignedIntValue];
  }
  swapSlice01RB(v15, v15 + 1156);
  id v18 = [MEMORY[0x263EFF8F8] dataWithData:v14];

  LODWORD(v15) = 0;
LABEL_13:

  id v19 = v18;
  if (v15)
  {
    FigDebugAssert3();
    goto LABEL_64;
  }
LABEL_14:
  if ([(SoftISPConfig *)self stageConfigMode] != 1
    && [(SoftISPConfig *)self stageConfigMode] != 4
    && [(SoftISPConfig *)self stageConfigMode] != 2)
  {
    id v29 = 0;
    if (!v6) {
      goto LABEL_50;
    }
    goto LABEL_21;
  }
  uint64_t v20 = [(SoftISPConfig *)self staticParameters];
  uint64_t v21 = -[SoftISPInputFrame metadata]((uint64_t)v6);
  uint64_t v22 = [v20 moduleConfigForInputFrameMetadata:v21];

  if (!v22
    || ([v22 objectForKey:@"FocusPixels"],
        int32x2_t v23 = objc_claimAutoreleasedReturnValue(),
        v23,
        !v23))
  {
    LODWORD(v15) = FigSignalErrorAt();

LABEL_64:
    id v43 = 0;
    goto LABEL_45;
  }
  $F9EF8680D2F257A31A70FACC2CDCD028 v24 = [v22 objectForKeyedSubscript:@"FocusPixels"];
  $F9EF8680D2F257A31A70FACC2CDCD028 v25 = [v24 objectForKeyedSubscript:@"LensModel"];

  $F9EF8680D2F257A31A70FACC2CDCD028 v26 = [(SoftISPConfig *)self staticParameters];
  $F9EF8680D2F257A31A70FACC2CDCD028 v27 = -[SoftISPInputFrame metadata]((uint64_t)v6);
  $F9EF8680D2F257A31A70FACC2CDCD028 v28 = [v26 cameraInfoForInputFrameMetadata:v27];

  v65[0] = 0;
  LODWORD(v15) = generatePDPGainsFromInputFrameMetadata(v6, v28, v25, v65);
  id v29 = v65[0];
  if (v15)
  {
    FigDebugAssert3();

    goto LABEL_63;
  }

  if (!v6)
  {
LABEL_50:
    LODWORD(v15) = FigSignalErrorAt();
LABEL_63:

    goto LABEL_64;
  }
LABEL_21:
  if (!v7) {
    goto LABEL_50;
  }
  if ([(SoftISPConfig *)self stageConfigMode] != 4
    && [(SoftISPConfig *)self stageConfigMode] != 2)
  {
    goto LABEL_41;
  }
  id v30 = v19;
  uint64_t v31 = [v30 bytes];
  id v32 = v29;
  uint64_t v33 = [v32 bytes];
  if (!v31 || !v33) {
    goto LABEL_65;
  }
  uint64_t v34 = 0;
  int v35 = 0;
  int v36 = 0;
  do
  {
    for (uint64_t j = 0; j != 1156; j += 4)
    {
      unsigned int v38 = *(_DWORD *)(v31 + j);
      unsigned int v39 = *(_DWORD *)(v33 + j);
      if (((v39 ^ v38) & 0xFFFFF) != 0)
      {
        ++v35;
        int v40 = (*(_DWORD *)(v31 + j) & 0x3FF) - (*(_DWORD *)(v33 + j) & 0x3FF);
        if (v40 < 0) {
          int v40 = (*(_DWORD *)(v33 + j) & 0x3FF) - (*(_DWORD *)(v31 + j) & 0x3FF);
        }
        if (v40 > v36) {
          int v36 = v40;
        }
        int v41 = ((v38 >> 10) & 0x3FF) - ((v39 >> 10) & 0x3FF);
        if (v41 < 0) {
          int v41 = -v41;
        }
        if (v41 > v36) {
          int v36 = v41;
        }
      }
    }
    ++v34;
    v33 += 1156;
    v31 += 1156;
  }
  while (v34 != 4);
  if (v36 > 100 || v35 >= 1201)
  {
LABEL_65:
    FigDebugAssert3();
    LODWORD(v15) = FigSignalErrorAt();

    id v43 = 0;
    id v19 = v30;
  }
  else
  {
LABEL_41:
    id v19 = v19;
    if ([(SoftISPConfig *)self stageConfigMode] == 1
      || (id v42 = v19, [(SoftISPConfig *)self stageConfigMode] == 2))
    {
      id v42 = v29;
    }
    id v43 = v42;
    uint64_t v44 = [v43 bytes];
    uint64_t v45 = v44 + 1156;
    uint64_t v46 = v44 + 2312;
    uint64_t v47 = v44 + 3468;
    memset(v62, 0, sizeof(v62));
    int64x2_t v52 = vdupq_n_s64(0x11uLL);
    int64x2_t v63 = v52;
    uint64_t v64 = 1;
    [v7 replaceRegion:v62 mipmapLevel:0 slice:0 withBytes:v44 bytesPerRow:68 bytesPerImage:0];
    memset(v59, 0, sizeof(v59));
    int64x2_t v60 = v52;
    uint64_t v61 = 1;
    [v7 replaceRegion:v59 mipmapLevel:0 slice:1 withBytes:v45 bytesPerRow:68 bytesPerImage:0];
    memset(v56, 0, sizeof(v56));
    int64x2_t v57 = v52;
    uint64_t v58 = 1;
    [v7 replaceRegion:v56 mipmapLevel:0 slice:2 withBytes:v46 bytesPerRow:68 bytesPerImage:0];
    memset(v53, 0, sizeof(v53));
    int64x2_t v54 = v52;
    uint64_t v55 = 1;
    [v7 replaceRegion:v53 mipmapLevel:0 slice:3 withBytes:v47 bytesPerRow:68 bytesPerImage:0];

    LODWORD(v15) = 0;
  }
LABEL_45:

  return v15;
}

- (int)getHOCLConfigForInputFrame:(H13FastRawScaleConfig *)self forInputFrame:(SEL)a2 metalCtx:(id)a3 softISPModuleConfig:(id)a4 lscMetadata:(id)a5 bounds:(id)a6 isQuadra:(id *)a7
{
  id v10 = v7;
  uint64_t v336 = *MEMORY[0x263EF8340];
  uint64_t v15 = (unsigned __int8 *)a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = v10;
  char v329 = 0;
  -[SoftISPInputFrame metadata]((uint64_t)v16);
  uint64_t v20 = (char *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = [v18 objectForKeyedSubscript:@"HybridOCL"];
  uint64_t v22 = [v21 objectForKeyedSubscript:@"staticXtalk"];
  uint64_t v23 = -[SoftISPBounds processingRegionWithinSensorInReadoutPixels]((uint64_t)v19);
  unsigned __int8 v328 = 0;
  __int16 v327 = 0;
  float v289 = v21;
  uint64_t v290 = v19;
  v299 = v20;
  if (!v15 || !v16 || !v17) {
    goto LABEL_175;
  }
  if (!v20)
  {
    FigDebugAssert3();
    int v274 = FigSignalErrorAt();
    int32x2_t v37 = 0;
    float v273 = 0;
    v298 = 0;
    goto LABEL_170;
  }
  if (!a7)
  {
LABEL_175:
    FigDebugAssert3();
    int v274 = FigSignalErrorAt();
    int32x2_t v37 = 0;
    float v273 = 0;
    v298 = 0;
    goto LABEL_188;
  }
  int32x2_t v287 = (int32x2_t)v23;
  v291 = self;
  $F9EF8680D2F257A31A70FACC2CDCD028 v24 = [(SoftISPConfig *)self staticParameters];
  uint64_t v25 = [v24 tuningParametersForInputFrameMetadata:v20 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v16)];

  v298 = (void *)v25;
  if (!v25) {
    FigSignalErrorAt();
  }
  BOOL v288 = v22 != 0;
  unsigned int v297 = v15[145];
  float v292 = v15;
  id v293 = v16;
  v300 = v17;
  v301 = v22;
  id v294 = v18;
  if (v22 || v15[148])
  {
    uint64_t v26 = *((unsigned __int16 *)a7 + 6);
    uint64_t v27 = *((unsigned __int16 *)a7 + 7);
    int v28 = *((unsigned __int8 *)a7 + 36);
    char v29 = 3;
    if (!*((unsigned char *)a7 + 36)) {
      char v29 = 1;
    }
    id v30 = malloc_type_malloc(4 * *((unsigned __int16 *)a7 + 7) * (unint64_t)(v26 << v29), 0x15415729uLL);
    if (!v30)
    {
      FigDebugAssert3();
      int v274 = FigSignalErrorAt();
      int32x2_t v37 = 0;
      float v273 = 0;
      uint64_t v20 = 0;
      goto LABEL_178;
    }
    unint64_t v31 = 0;
    int v32 = 8 * v26;
    v295 = v30;
    uint64_t v33 = (char *)v30;
    do
    {
      uint64_t v34 = (void *)*((void *)a7 + 17);
      memset(v333, 0, 24);
      v333[3] = v26;
      v333[4] = v27;
      v333[5] = 1;
      [v34 getBytes:v33 bytesPerRow:(8 * v26) bytesPerImage:(v32 * v27) fromRegion:v333 mipmapLevel:0 slice:v31];
      if (!v28) {
        break;
      }
      v33 += (v32 * v27);
    }
    while (v31++ < 3);
    uint64_t v22 = v301;
    if (!v301)
    {
      int32x2_t v67 = 0;
      float v68 = 0.0;
      int v41 = 0;
      float v69 = 0.0;
      __int32 v70 = 0;
LABEL_93:
      int32x2_t v37 = v295;
      goto LABEL_94;
    }
    int v36 = objc_msgSend(v301, "cmi_BOOLValueForKey:defaultValue:found:", @"useModulatedXtalk", 0, &v329);
    int32x2_t v37 = v295;
    if (!v329)
    {
      FigDebugAssert3();
      int v274 = FigSignalErrorAt();
      float v273 = 0;
      uint64_t v20 = 0;
      goto LABEL_169;
    }
    int v286 = v36;
    int v38 = objc_msgSend(v301, "cmi_BOOLValueForKey:defaultValue:found:", @"constrainedToLSC", 0, &v329);
    id v18 = v294;
    if (v329
      && (int v284 = v38,
          LODWORD(v39) = 1041865114,
          objc_msgSend(v301, "cmi_floatValueForKey:defaultValue:found:", @"maxCoeff", &v329, v39),
          v329)
      && (int v41 = v40,
          unsigned int v42 = objc_msgSend(v301, "cmi_BOOLValueForKey:defaultValue:found:", @"bypassThd", 1, &v329),
          v329))
    {
      unsigned int v43 = v42;
      unsigned int v316 = objc_msgSend(v301, "cmi_BOOLValueForKey:defaultValue:found:", @"centerCropOffsetX", 0, &v329);
      unsigned int v313 = objc_msgSend(v301, "cmi_BOOLValueForKey:defaultValue:found:", @"centerCropOffsetY", 0, &v329);
      float32x2_t v44 = *(float32x2_t *)((char *)a7 + 24);
      if (v337) {
        int v45 = -1;
      }
      else {
        int v45 = 0;
      }
      unsigned int v282 = v45;
      LOWORD(v8) = *((_WORD *)a7 + 2);
      LOWORD(v9) = *((_WORD *)a7 + 3);
      if (v286) {
        uint64_t v46 = @"staticXtalkModulatedData";
      }
      else {
        uint64_t v46 = @"staticXtalkData";
      }
      uint64_t v47 = [v301 objectForKeyedSubscript:v46];
      int32x2_t v48 = v47;
      if (v47
        && ((v281 = v43, v49 = v47, uint64_t v50 = (unsigned __int16 *)[v49 bytes], !v286)
          ? (int v51 = 2)
          : (int v51 = 4),
            uint64_t v307 = v50[4],
            v50[4] == v51))
      {
        float v283 = v49;
        uint64_t v52 = v50[2];
        uint64_t v311 = *((unsigned __int16 *)a7 + 7);
        if (v52 >= v311)
        {
          uint64_t v53 = *((unsigned __int16 *)a7 + 6);
          uint64_t v54 = *v50;
          if (v54 >= v53)
          {
            uint64_t v55 = v50;
            id v56 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:115 width:*((unsigned __int16 *)a7 + 6) height:v311 mipmapped:0];
            if (v56)
            {
              int64x2_t v57 = v56;
              [v56 setUsage:17];
              [v57 setStorageMode:0];
              [v57 setTextureType:2];
              uint64_t v58 = [v17 device];
              int8x8_t v59 = v57;
              int64x2_t v60 = v58;
              uint64_t v279 = v59;
              uint64_t v61 = objc_msgSend(v58, "newTextureWithDescriptor:");

              v280 = v61;
              if (v61)
              {
                int32x2_t v62 = (char *)malloc_type_malloc(4 * (v53 * v311) * (unint64_t)v307, 0xACB9822DuLL);
                if (v62)
                {
                  v304 = v62;
                  v63.f32[0] = (float)v316;
                  v63.f32[1] = (float)v313;
                  float32x2_t v317 = v63;
                  uint64_t v64 = [v294 objectForKeyedSubscript:@"LensShading"];
                  if (v64)
                  {
                    int32x2_t v65 = [v294 objectForKeyedSubscript:@"LensShading"];
                    int32x2_t v66 = [v65 objectForKeyedSubscript:@"OISAdaptation"];
                  }
                  else
                  {
                    int32x2_t v66 = 0;
                  }

                  uint64_t v278 = v66;
                  if (!objc_msgSend(v66, "cmi_unsignedIntValueForKey:defaultValue:found:", @"OISAdaptationMethod", 0, &v329))
                  {
                    int8x8_t v71 = [(SoftISPConfig *)v291 staticParameters];
                    int v72 = [v71 cameraInfoForInputFrameMetadata:v299];

                    unint64_t v73 = [v72 objectForKeyedSubscript:*MEMORY[0x263F2EEC0]];
                    char v74 = v73;
                    if (v73)
                    {
                      uint64_t v75 = [v73 bytes];
                      if (*(_DWORD *)v75 == 2 && (*(unsigned char *)(v75 + 4) & 1) != 0) {
                        float32x2_t v317 = *(float32x2_t *)((char *)a7 + 128);
                      }
                    }
                  }
                  unsigned __int16 v285 = v311 * v53;
                  if (v307)
                  {
                    uint64_t v76 = 0;
                    int32x2_t v77 = v304;
                    do
                    {
                      if (v311)
                      {
                        uint64_t v78 = 0;
                        uint64_t v79 = v77;
                        do
                        {
                          float32x2_t v80 = v317;
                          if (v53)
                          {
                            for (uint64_t i = 0; i != v53; ++i)
                            {
                              v82.f32[0] = (float)(int)i;
                              v82.f32[1] = (float)(int)v78;
                              float32x2_t v83 = vadd_f32(v80, v82);
                              float v84 = sample((uint64_t)&v55[2 * (v52 * v54 * v76) + 6], v54, v52, v83.f32[0], v83.f32[1]);
                              float32x2_t v80 = v317;
                              *(float *)&v79[4 * i] = v84;
                            }
                          }
                          ++v78;
                          v79 += 4 * v53;
                        }
                        while (v78 != v311);
                      }
                      ++v76;
                      v77 += 4 * v285;
                    }
                    while (v76 != v307);
                  }
                  char v85 = (char *)malloc_type_malloc((8 * v53) * (unint64_t)v311, 0x909BBB86uLL);
                  uint64_t v20 = v85;
                  if (!v85)
                  {
                    FigDebugAssert3();
                    int v274 = FigSignalErrorAt();

                    uint64_t v15 = v292;
                    id v16 = v293;
                    id v17 = v300;
                    uint64_t v22 = v301;
                    id v18 = v294;
                    int32x2_t v37 = v295;
                    float v273 = v304;
                    goto LABEL_170;
                  }
                  float32x2_t v86 = (float32x2_t)vbsl_s8((int8x8_t)vdup_n_s32(v282), (int8x8_t)vmul_f32(v44, (float32x2_t)0x3F0000003F000000), (int8x8_t)v44);
                  int v87 = (unsigned __int16)(v311 * v53);
                  uint64_t v15 = v292;
                  id v16 = v293;
                  id v17 = v300;
                  if ((_WORD)v311 * (_WORD)v53)
                  {
                    uint64_t v88 = 0;
                    do
                    {
                      _S1 = *(_DWORD *)&v304[v88];
                      __asm { FCVT            H1, S1 }
                      uint64_t v93 = &v85[2 * v88];
                      *(_WORD *)uint64_t v93 = _S1;
                      _S1 = *(_DWORD *)&v304[4 * v285 + v88];
                      __asm { FCVT            H1, S1 }
                      *((_WORD *)v93 + 1) = _S1;
                      v88 += 4;
                    }
                    while (4 * (unsigned __int16)(v311 * v53) != v88);
                  }
                  float v95 = (float)v8;
                  float v314 = vmuls_lane_f32((float)v9, v86, 1);
                  int32x2_t v318 = (int32x2_t)v86;
                  objc_msgSend(v299, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2E0], 0, 0.0);
                  float v97 = v96 * 0.00024414;
                  objc_msgSend(v299, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2D8], 0, 0.0);
                  float v99 = v98 * 0.00024414;
                  objc_msgSend(v299, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2D0], 0, 0.0);
                  float v101 = v100 * 0.00024414;
                  BOOL v102 = v97 == 0.0;
                  if (v99 == 0.0) {
                    BOOL v102 = 1;
                  }
                  if (v101 == 0.0) {
                    BOOL v102 = 1;
                  }
                  if (v102) {
                    float v103 = 1.0;
                  }
                  else {
                    float v103 = v97;
                  }
                  if (v102) {
                    float v104 = 1.0;
                  }
                  else {
                    float v104 = v99;
                  }
                  if (v102) {
                    float v105 = 1.0;
                  }
                  else {
                    float v105 = v101;
                  }
                  uint64_t v22 = v301;
                  if (v285)
                  {
                    uint64_t v106 = 0;
                    float v107 = v104 / v103;
                    uint64_t v108 = 4;
                    if (!v337) {
                      uint64_t v108 = 1;
                    }
                    uint64_t v109 = 8 * v285;
                    __asm { FMOV            V2.2D, #1.0 }
                    int32x2_t v111 = v295;
                    float v112 = v104 / v105;
                    do
                    {
                      uint64_t v113 = 4 * v106;
                      _H4 = 0;
                      uint64_t v115 = v108;
                      uint64_t v116 = v111;
                      _H6 = 0;
                      do
                      {
                        _H5 = *v116;
                        __asm
                        {
                          FCVT            D5, H5
                          FCVT            D6, H6
                        }
                        _D5 = 1.0 / _D5 + _D6;
                        __asm { FCVT            H6, D5 }
                        LOWORD(_D5) = v116[3];
                        __asm
                        {
                          FCVT            D5, H5
                          FCVT            D4, H4
                        }
                        _D4 = 1.0 / _D5 + _D4;
                        __asm { FCVT            H4, D4 }
                        uint64_t v116 = (__int16 *)((char *)v116 + v109);
                        --v115;
                      }
                      while (v115);
                      __asm { FCVT            S5, H4 }
                      _S7 = 0.0;
                      __asm { FCMP            H4, #0 }
                      if (!_ZF)
                      {
                        __asm { FCVT            S6, H6 }
                        _S7 = (float)(_S6 - _S5) / _S5;
                      }
                      __asm { FCVT            H6, S7 }
                      if (v286)
                      {
                        float v130 = *(float *)&v304[4 * v106 + 4 * (3 * v87)];
                        __asm { FCVT            S17, H6 }
                        _H18 = *(_WORD *)&v20[8 * v106];
                        __asm { FCVT            S18, H18 }
                        _S7 = _S18 + (float)(*(float *)&v304[4 * v106 + 4 * (2 * v87)] * _S17);
                        __asm { FCVT            H7, S7 }
                        *(_WORD *)&v20[8 * v106] = LOWORD(_S7);
                        uint64_t v135 = (8 * v106) | 2;
                        LOWORD(_S7) = *(_WORD *)&v20[v135];
                        __asm { FCVT            S7, H7 }
                        _S7 = _S7 + (float)(v130 * _S17);
                        __asm { FCVT            H7, S7 }
                        *(_WORD *)&v20[v135] = LOWORD(_S7);
                      }
                      *(_WORD *)&v20[2 * (v113 | 2)] = _H6;
                      if (v284)
                      {
                        _S7 = 0;
                        uint64_t v139 = v108;
                        uint64_t v140 = 2;
                        do
                        {
                          _H16 = HIWORD(_S7);
                          __asm
                          {
                            FCVT            D16, H16
                            FCVT            D7, H7
                          }
                          _Q7.f64[1] = _D16;
                          LODWORD(_D16) = *(_DWORD *)((char *)v111 + v140);
                          _H17 = WORD1(_D16);
                          __asm
                          {
                            FCVT            D17, H17
                            FCVT            D16, H16
                          }
                          _Q16.f64[1] = _D17;
                          _Q7 = vaddq_f64(vdivq_f64(_Q2, _Q16), _Q7);
                          _Q16.f64[0] = _Q7.f64[1];
                          __asm
                          {
                            FCVT            H16, D16
                            FCVT            H7, D7
                          }
                          HIWORD(_S7) = LOWORD(_Q16.f64[0]);
                          v140 += v109;
                          --v139;
                        }
                        while (v139);
                        __asm { FCVT            S16, H7 }
                        _S16 = v107 * _S16;
                        __asm { FCVT            H16, S16 }
                        _H7 = HIWORD(_S7);
                        __asm { FCVT            S7, H7 }
                        _S7 = v112 * _S7;
                        _H17 = *(_WORD *)&v20[8 * v106];
                        __asm
                        {
                          FCVT            H7, S7
                          FCVT            S17, H17
                          FCVT            S16, H16
                        }
                        _H18 = *(_WORD *)&v20[2 * (v113 | 1)];
                        __asm
                        {
                          FCVT            S18, H18
                          FCVT            S7, H7
                          FCVT            S6, H6
                        }
                        _S5 = (float)((float)((float)(_S7 * _S18) + (float)(_S17 * _S16)) / _S5) - _S6;
                        __asm
                        {
                          FCVT            H5, S5
                          FCVT            S5, H5
                          FCMP            H4, #0
                        }
                        if (_ZF) {
                          float v163 = 0.0;
                        }
                        else {
                          float v163 = _S5;
                        }
                        _S4 = v163 + _S6;
                        __asm { FCVT            H6, S4 }
                      }
                      __asm { FCVT            D4, H6 }
                      _D4 = sqrt(_D4 + 1.0);
                      __asm { FCVT            H4, D4 }
                      *(_WORD *)&v20[2 * (v113 | 2)] = LOWORD(_D4);
                      ++v106;
                      v111 += 4;
                    }
                    while (v106 != v285);
                  }
                  float v68 = (float)v281;
                  float v69 = v95 * *(float *)v318.i32;
                  __int32 v70 = v318.i32[1];
                  memset(v326, 0, 24);
                  v326[3] = v53;
                  v326[4] = v311;
                  v326[5] = 1;
                  [v280 replaceRegion:v326 mipmapLevel:0 withBytes:v20 bytesPerRow:8 * v53];
                  free(v20);
                  free(v304);
                  [v292 setHoclStaticXtalkLutTex:v280];

                  int32x2_t v67 = vdup_lane_s32(v318, 0);
                  *(float *)v67.i32 = v314;
                  goto LABEL_93;
                }
              }
              FigDebugAssert3();
              int v274 = FigSignalErrorAt();

              float v273 = 0;
              uint64_t v20 = 0;
              int32x2_t v37 = v295;
              id v17 = v300;
            }
            else
            {
              FigDebugAssert3();
              int v274 = FigSignalErrorAt();

              float v273 = 0;
              uint64_t v20 = 0;
              int32x2_t v37 = v295;
            }
            uint64_t v15 = v292;
            goto LABEL_170;
          }
        }
        FigDebugAssert3();
        int32x2_t v37 = v295;
      }
      else
      {
        FigDebugAssert3();
      }
      int v274 = FigSignalErrorAt();
    }
    else
    {
      FigDebugAssert3();
      int v274 = FigSignalErrorAt();
    }
    float v273 = 0;
LABEL_188:
    uint64_t v20 = 0;
    goto LABEL_170;
  }
  int32x2_t v37 = 0;
  int32x2_t v67 = 0;
  float v68 = 0.0;
  int v41 = 0;
  float v69 = 0.0;
  __int32 v70 = 0;
LABEL_94:
  if (v15[148])
  {
    int32x2_t v315 = v67;
    char v335 = 0;
    memset(v334, 0, sizeof(v334));
    v167 = [v298 objectForKeyedSubscript:@"HOCLXtalkCorrection"];
    if (!v167 && dword_26B430E70)
    {
      v330[0] = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v168 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v169 = v330[0];
      if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v170 = v169;
      }
      else {
        unsigned int v170 = v169 & 0xFFFFFFFE;
      }
      if (v170)
      {
        int v331 = 136315138;
        long long v332 = "-[H13FastRawScaleConfig(HOCL) getHOCLConfigForInputFrame:forInputFrame:metalCtx:softISPModuleConfig:lscMe"
               "tadata:bounds:isQuadra:]";
        LODWORD(v277) = 12;
        v276 = &v331;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      id v16 = v293;
    }
    int v185 = (void *)MEMORY[0x263EFFA78];
    if (v167) {
      int v185 = v167;
    }
    uint64_t v20 = v185;

    LODWORD(v186) = 0.20312;
    objc_msgSend(v20, "cmi_floatValueForKey:defaultValue:found:", @"strengthFromRed", &v329, v186);
    float v188 = *(float *)&v187;
    if (!v329) {
      FigSignalErrorAt();
    }
    LODWORD(v187) = 0.20312;
    objc_msgSend(v20, "cmi_floatValueForKey:defaultValue:found:", @"strengthFromBlue", &v329, v187, v276, v277);
    float v182 = *(float *)&v189;
    if (!v329) {
      FigSignalErrorAt();
    }
    LODWORD(v189) = 1031798784;
    objc_msgSend(v20, "cmi_floatValueForKey:defaultValue:found:", @"bound", &v329, v189);
    int v191 = v190;
    if (!v329) {
      FigSignalErrorAt();
    }
    unsigned __int8 v312 = objc_msgSend(v20, "cmi_BOOLValueForKey:defaultValue:found:", @"attenuationEnabled", 1, &v329);
    if (!v329) {
      FigSignalErrorAt();
    }
    unsigned __int8 v306 = objc_msgSend(v20, "cmi_BOOLValueForKey:defaultValue:found:", @"clampEnabled", 1, &v329);
    if (!v329) {
      FigSignalErrorAt();
    }
    unsigned __int16 v192 = objc_msgSend(v20, "cmi_unsignedIntValueForKey:defaultValue:found:", @"clampMode", 2, &v329);
    if (!v329) {
      FigSignalErrorAt();
    }
    LODWORD(v193) = 0.5;
    objc_msgSend(v20, "cmi_floatValueForKey:defaultValue:found:", @"clampScaling", &v329, v193);
    int v305 = LODWORD(v194);
    if (!v329) {
      FigSignalErrorAt();
    }
    LODWORD(v194) = 1.0;
    objc_msgSend(v20, "cmi_floatValueForKey:defaultValue:found:", @"bypassThreshold", &v329, v194);
    float v308 = v195;
    if (!v329) {
      FigSignalErrorAt();
    }
    double v196 = [(SoftISPConfig *)v291 staticParameters];
    double v197 = -[SoftISPInputFrame metadata]((uint64_t)v16);
    uint32x2_t v319 = (uint32x2_t)[v196 dimensionsForSensorInMetadata:v197];

    unsigned int v198 = -[SoftISPInputFrame quadraBinningFactor]((uint64_t)v16);
    if (v337)
    {
      uint32x2_t v199 = vshr_n_u32(v319, 1uLL);
    }
    else
    {
      v199.i32[0] = v319.i32[0] / v198;
      v199.i32[1] = v319.i32[1] / v198;
    }
    int32x2_t v320 = (int32x2_t)v199;
    if (v297 >= 2) {
      float v200 = v188;
    }
    else {
      float v200 = v182;
    }
    if (v297 >= 2) {
      float v201 = v182;
    }
    else {
      float v201 = v188;
    }
    float v302 = v201;
    float v303 = v200;
    uint64_t v202 = *((unsigned __int16 *)a7 + 6);
    uint64_t v203 = *((unsigned __int16 *)a7 + 7);
    int v204 = malloc_type_malloc(2 * v202 * v203, 0x8E238364uLL);
    if (v204)
    {
      uint64_t v205 = v204;
      int v310 = v192;
      __asm { FMOV            V2.2S, #1.0 }
      float32x2_t v184 = vdiv_f32(_D2, vcvt_f32_u32((uint32x2_t)(*(void *)&vadd_s32(v320, vadd_s32(v320, (int32x2_t)0x700000007)) & 0xFFFFFFF8FFFFFFF8)));
      float32x2_t v207 = vcvt_f32_s32(v287);
      uint64_t v208 = 2 * v202;
      if (v203)
      {
        int v209 = 0;
        uint64_t v210 = 0;
        int v211 = 4 * v202 * v203;
        int v212 = 12 * v202 * v203;
        int v213 = 8 * v202 * v203;
        uint64_t v214 = 4 * v202;
        float v215 = v204;
        do
        {
          if (v202)
          {
            uint64_t v216 = 0;
            v217 = v215;
            do
            {
              _H3 = v37[(v211 + v216)];
              __asm { FCVT            S3, H3 }
              _H4 = v37[(v212 + v216)];
              __asm { FCVT            S4, H4 }
              float v222 = _S3 + _S4;
              LOWORD(_S4) = v37[(v211 + v216 + 3)];
              __asm { FCVT            S4, H4 }
              float v224 = v222 + _S4;
              LOWORD(_S4) = v37[(v212 + v216 + 3)];
              __asm { FCVT            S4, H4 }
              float v226 = v224 + _S4;
              double v227 = 0.0;
              if (v226 != 0.0)
              {
                _H4 = v37[(v209 + v216)];
                _H5 = v37[(v213 + v216)];
                __asm
                {
                  FCVT            S4, H4
                  FCVT            S5, H5
                }
                _H6 = v37[(v209 + v216 + 3)];
                float v233 = _S4 + _S5;
                __asm { FCVT            S5, H6 }
                float v235 = v233 + _S5;
                LOWORD(_S5) = v37[(v213 + v216 + 3)];
                __asm { FCVT            S5, H5 }
                double v227 = ((float)((float)(v235 + _S5) / v226) + -1.0) * 0.5;
              }
              _S3 = v227;
              __asm { FCVT            H3, S3 }
              *v217++ = LOWORD(_S3);
              v216 += 4;
            }
            while (v214 != v216);
          }
          ++v210;
          v213 += v214;
          v209 += v214;
          v212 += v214;
          v211 += v214;
          float v215 = (_WORD *)((char *)v215 + v208);
        }
        while (v210 != v203);
      }
      id v296 = (void *)vmul_f32(v184, v207);
      int v238 = malloc_type_malloc(2 * v203, 0x1000040BDFB0063uLL);
      uint64_t v239 = 0;
      double v240 = (float)((float)(v202 - 1) / 9.0);
      uint64x2_t v241 = (uint64x2_t)vdupq_n_s64(9uLL);
      int64x2_t v242 = (int64x2_t)xmmword_263380330;
      int64x2_t v243 = vdupq_n_s64(2uLL);
      do
      {
        if (vmovn_s64((int64x2_t)vcgtq_u64(v241, (uint64x2_t)v242)).u8[0])
        {
          float v244 = ((double)(int)(v239 * 2) + 0.5) * v240;
          *(float *)&v333[v239] = v244;
        }
        if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(9uLL), *(uint64x2_t *)&v242)).i32[1])
        {
          float v245 = ((double)((int)(v239 * 2) + 1) + 0.5) * v240;
          *((float *)&v333[v239] + 1) = v245;
        }
        ++v239;
        int64x2_t v242 = vaddq_s64(v242, v243);
      }
      while (v239 != 5);
      uint64_t v246 = 0;
      double v247 = (float)((float)(v203 - 1) / 9.0);
      uint64x2_t v248 = (uint64x2_t)vdupq_n_s64(9uLL);
      int64x2_t v249 = (int64x2_t)xmmword_263380330;
      int64x2_t v250 = vdupq_n_s64(2uLL);
      do
      {
        if (vmovn_s64((int64x2_t)vcgtq_u64(v248, (uint64x2_t)v249)).u8[0])
        {
          float v251 = ((double)(int)v246 + 0.5) * v247;
          *((float *)&v331 + v246) = v251;
        }
        if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(9uLL), *(uint64x2_t *)&v249)).i32[1])
        {
          float v252 = ((double)((int)v246 + 1) + 0.5) * v247;
          *((float *)&v331 + v246 + 1) = v252;
        }
        v246 += 2;
        int64x2_t v249 = vaddq_s64(v249, v250);
      }
      while (v246 != 10);
      float v181 = v188;
      int v176 = v191;
      uint64_t v321 = v20;
      uint64_t v253 = v37;
      if (v203)
      {
        uint64_t v254 = v203;
        uint64_t v255 = (uint64_t)v205;
        do
        {
          interp1h(v255, (float *)v333, 1, v37, 1, 9, v202);
          v37 += 9;
          v255 += v208;
          --v254;
        }
        while (v254);
      }
      uint64_t v256 = 0;
      float v257 = v334;
      unint64_t v258 = v253;
      id v16 = v293;
      do
      {
        uint64_t v259 = v203;
        float v260 = v238;
        float v261 = v258;
        if (v203)
        {
          do
          {
            __int16 v262 = *v261;
            v261 += 9;
            *v260++ = v262;
            --v259;
          }
          while (v259);
        }
        interp1h((uint64_t)v238, (float *)&v331, 1, v330, 1, 9, v203);
        uint64_t v263 = 0;
        float v264 = v257;
        do
        {
          _H0 = *(_WORD *)((char *)v330 + v263);
          __asm { FCVT            D0, H0 }
          double v267 = round(_D0 * 1024.0);
          double v268 = 127.0;
          if (v267 <= 127.0)
          {
            double v268 = -128.0;
            if (v267 >= -128.0) {
              double v268 = v267;
            }
          }
          *float v264 = (int)v268;
          v264 += 9;
          v263 += 2;
        }
        while (v263 != 18);
        ++v256;
        ++v258;
        float v257 = (_OWORD *)((char *)v257 + 1);
      }
      while (v256 != 9);
      free(v238);
      free(v205);
      v269 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:12 width:9 height:9 mipmapped:0];
      if (v269)
      {
        v270 = v269;
        [v269 setUsage:17];
        [v270 setStorageMode:0];
        id v17 = v300;
        v271 = [v300 device];
        int v272 = (void *)[v271 newTextureWithDescriptor:v270];

        uint64_t v15 = v292;
        uint64_t v22 = v301;
        int32x2_t v37 = v253;
        if (v272)
        {
          memset(v322, 0, sizeof(v322));
          int64x2_t v323 = vdupq_n_s64(9uLL);
          char v173 = 1;
          uint64_t v324 = 1;
          [v272 replaceRegion:v322 mipmapLevel:0 withBytes:v334 bytesPerRow:9];
          [v292 setHoclXtalkLutTex:v272];

          uint64_t v175 = 0x3F80000043FFFF00;
          float v180 = 16.0;
          uint64_t v20 = v321;
          int32x2_t v67 = v315;
          unsigned __int8 v172 = v312;
          float v68 = v308;
          unsigned __int8 v174 = v306;
          int v179 = v305;
          float v178 = v302;
          float v177 = v303;
          int v171 = v310;
          uint64_t v183 = v296;
          goto LABEL_168;
        }
        FigDebugAssert3();
        int v274 = FigSignalErrorAt();

        float v273 = 0;
        id v18 = v294;
      }
      else
      {
        FigDebugAssert3();
        int v274 = FigSignalErrorAt();
        float v273 = 0;
        uint64_t v15 = v292;
        id v17 = v300;
        uint64_t v22 = v301;
        id v18 = v294;
        int32x2_t v37 = v253;
      }
      uint64_t v20 = v321;
      goto LABEL_170;
    }
    FigDebugAssert3();
    int v274 = FigSignalErrorAt();
    float v273 = 0;
    id v18 = v294;
LABEL_178:
    uint64_t v22 = v301;
    goto LABEL_170;
  }
  int v171 = 0;
  unsigned __int8 v172 = 0;
  char v173 = 0;
  unsigned __int8 v174 = 0;
  uint64_t v20 = 0;
  uint64_t v175 = 0;
  int v176 = 0;
  float v177 = 0.0;
  float v178 = 0.0;
  int v179 = 0;
  float v180 = 0.0;
  float v181 = 0.0;
  float v182 = 0.0;
  uint64_t v183 = 0;
  float32x2_t v184 = 0;
LABEL_168:
  *((_WORD *)v15 + 1210) = v297;
  v15[2422] = v174;
  v15[2423] = v173;
  v15[2424] = v173;
  v15[2425] = v172;
  *((_WORD *)v15 + 1213) = 0;
  *((_DWORD *)v15 + 607) = v171;
  *((float *)v15 + 608) = v182;
  *((float *)v15 + 609) = v181;
  *((_DWORD *)v15 + 610) = 0;
  *(void *)(v15 + 2444) = v175;
  *((float *)v15 + 613) = v180;
  *((_DWORD *)v15 + 614) = v179;
  *((_DWORD *)v15 + 615) = v176;
  *((float *)v15 + 616) = v68;
  *((float *)v15 + 617) = v177;
  *((float *)v15 + 618) = v178;
  *(void *)(v15 + 2476) = v183;
  *(float32x2_t *)(v15 + 2484) = v184;
  v15[2492] = v288;
  *(_WORD *)(v15 + 2493) = v327;
  v15[2495] = v328;
  *((_DWORD *)v15 + 624) = v41;
  *((float *)v15 + 625) = v69;
  *((int32x2_t *)v15 + 313) = v67;
  *((_DWORD *)v15 + 628) = v70;
  free(v37);
  int32x2_t v37 = 0;
  float v273 = 0;
  int v274 = 0;
LABEL_169:
  id v18 = v294;
LABEL_170:
  free(v37);
  free(v273);

  return v274;
}

- (int)getABLESTEnabledForInputFrame:(id)a3 enabled:(BOOL *)a4
{
  id v6 = a3;
  id v7 = v6;
  char v32 = 0;
  if (!v6)
  {
    int v27 = FigSignalErrorAt();
    if (!a4) {
      goto LABEL_14;
    }
    id v17 = 0;
    int v13 = 0;
    unsigned int v9 = 0;
    goto LABEL_22;
  }
  if (!a4)
  {
    int v27 = FigSignalErrorAt();
    goto LABEL_14;
  }
  unsigned int v8 = -[SoftISPInputFrame metadata]((uint64_t)v6);
  unsigned int v9 = v8;
  if (!v8)
  {
    FigDebugAssert3();
    goto LABEL_21;
  }
  objc_msgSend(v8, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F468], &v32, 0.0);
  if (!v32)
  {
LABEL_21:
    int v27 = FigSignalErrorAt();
    id v17 = 0;
    int v13 = 0;
LABEL_22:
    BOOL v29 = 0;
    goto LABEL_13;
  }
  float v11 = v10;
  int v12 = [(SoftISPConfig *)self staticParameters];
  int v13 = [v12 tuningParametersForInputFrameMetadata:v9 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v7)];

  uint64_t v14 = [v13 valueForKey:@"ABLEST"];
  uint64_t v15 = (void *)v14;
  id v16 = (void *)MEMORY[0x263EFFA78];
  if (v14) {
    id v16 = (void *)v14;
  }
  id v17 = v16;

  if (!objc_msgSend(v17, "cmi_BOOLValueForKey:defaultValue:found:", @"Enabled", 0, 0)) {
    goto LABEL_16;
  }
  LODWORD(v18) = 1066192077;
  objc_msgSend(v17, "cmi_floatValueForKey:defaultValue:found:", @"MinExposureTime", &v32, v18);
  if (!v32)
  {
LABEL_15:
    int v27 = FigSignalErrorAt();
    BOOL v29 = 1;
    goto LABEL_13;
  }
  if (v11 < v19)
  {
LABEL_16:
    BOOL v29 = 0;
    int v27 = 0;
    goto LABEL_13;
  }
  *(double *)v20.i64 = -[SoftISPInputFrame sensorBlackLevel]((uint64_t)v7);
  int32x4_t v31 = v20;
  unsigned int v21 = -[SoftISPInputFrame uncorrectedSensorBlackLevel]((uint64_t)v7);
  LODWORD(v22) = 5.0;
  objc_msgSend(v17, "cmi_floatValueForKey:defaultValue:found:", @"MaxOPBErrorRatio", &v32, v22);
  if (!v32) {
    goto LABEL_15;
  }
  float v24 = v23;
  int v25 = -[SoftISPInputFrame pipelineHeadRoom]((uint64_t)v7);
  objc_msgSend(v17, "cmi_floatValueForKey:defaultValue:found:", @"MinPerceivableAdjustment", &v32, 0.0);
  if (!v32) {
    goto LABEL_15;
  }
  int v27 = 0;
  int8x16_t v28 = (int8x16_t)vsubq_s32(v31, vdupq_n_s32(v21));
  *(int32x2_t *)v28.i8 = vadd_s32(*(int32x2_t *)v28.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v28, v28, 8uLL));
  BOOL v29 = (float)((float)(v24
                      * fmaxf((float)vadd_s32(*(int32x2_t *)v28.i8, vdup_lane_s32(*(int32x2_t *)v28.i8, 1)).i32[0] * 0.25, 0.0))/ (float)v25) >= v26;
LABEL_13:
  *a4 = v29;

LABEL_14:
  return v27;
}

- (int)getABLESTConfigForInputFrame:(id)a3 pdpConfig:(id *)a4 ablestConfig:(id *)a5
{
  id v8 = a3;
  unsigned int v9 = v8;
  char v60 = 0;
  if (!v8 || !a4 || !a5) {
    goto LABEL_59;
  }
  float v10 = -[SoftISPInputFrame metadata]((uint64_t)v8);
  if (!v10)
  {
    FigDebugAssert3();
LABEL_59:
    int v57 = FigSignalErrorAt();
    goto LABEL_51;
  }
  float v11 = v10;
  objc_msgSend(v10, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F468], &v60, 0.0);
  double v59 = v12;
  if (!v60)
  {
LABEL_61:
    int v57 = FigSignalErrorAt();
    goto LABEL_55;
  }
  int v13 = [(SoftISPConfig *)self staticParameters];
  uint64_t v14 = -[SoftISPInputFrame metadata]((uint64_t)v9);
  uint64_t v15 = [v13 dimensionsForSensorInBayerPixelsInMetadata:v14];

  if (!v15 || !HIDWORD(v15))
  {
    FigDebugAssert3();
    goto LABEL_61;
  }
  id v16 = [(SoftISPConfig *)self staticParameters];
  id v17 = [v16 tuningParametersForInputFrameMetadata:v11 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v9)];

  uint64_t v18 = [v17 valueForKey:@"ABLEST"];
  float v19 = (void *)v18;
  int32x4_t v20 = (void *)MEMORY[0x263EFFA78];
  if (v18) {
    int32x4_t v20 = (void *)v18;
  }
  id v21 = v20;

  if (objc_msgSend(v21, "cmi_BOOLValueForKey:defaultValue:found:", @"Enabled", 0, 0))
  {
    LODWORD(v22) = 1066192077;
    objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", @"MinExposureTime", &v60, v22);
    if (!v60)
    {
LABEL_54:
      int v57 = FigSignalErrorAt();

LABEL_55:
      goto LABEL_51;
    }
    if (*(float *)&v59 >= *(float *)&v23)
    {
      LODWORD(v23) = 5.0;
      objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", @"MaxOPBErrorRatio", &v60, v23, v59);
      if (v60)
      {
        float v25 = *(float *)&v24;
        LODWORD(v24) = 1020054733;
        objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", @"InlierDeltaThreshold", &v60, v24);
        a5->var21 = *(float *)&v26;
        if (v60)
        {
          LODWORD(v26) = 1020054733;
          objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", @"NeighborsDeltaThreshold", &v60, v26);
          a5->var22 = *(float *)&v27;
          if (v60)
          {
            LODWORD(v27) = 1072483533;
            objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", @"FocusPixelScaling", &v60, v27);
            *(_DWORD *)&a5[1].var0[0].var0 = LODWORD(v28);
            if (v60)
            {
              LODWORD(v28) = 1028443341;
              objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", @"MaxInlierValue", &v60, v28);
              *(_DWORD *)&a5[1].var0[2].var0 = v29;
              if (v60)
              {
                LODWORD(a5[1].var4) = objc_msgSend(v21, "cmi_unsignedIntValueForKey:defaultValue:found:", @"Subsampling", 32, &v60);
                if (v60)
                {
                  LODWORD(v30) = 1008981770;
                  objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", @"FilteringOutlierThreshold", &v60, v30);
                  a5[1].var1 = *(float *)&v31;
                  if (v60)
                  {
                    LODWORD(v31) = 1017370378;
                    objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", @"SmoothingHSigma", &v60, v31);
                    a5[1].var2 = *(float *)&v32;
                    if (v60)
                    {
                      LODWORD(v32) = 1025758986;
                      objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", @"SmoothingVSigma", &v60, v32);
                      a5[1].var3 = *(float *)&v33;
                      if (v60)
                      {
                        LODWORD(v33) = 1.0;
                        objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", @"HorizontalCorrectionWeight", &v60, v33);
                        a5[1].var8 = *(float *)&v34;
                        if (v60)
                        {
                          LODWORD(v34) = 1.0;
                          objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", @"VerticalCorrectionWeight", &v60, v34);
                          a5[1].var9 = LODWORD(v35);
                          if (v60)
                          {
                            LODWORD(v35) = 1.0;
                            objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", @"GlobalCorrectionWeight", &v60, v35);
                            a5[1].var10 = LODWORD(v36);
                            if (v60)
                            {
                              LODWORD(v36) = 942130604;
                              objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", @"HorizontalMax", &v60, v36);
                              a5[1].var11 = LODWORD(v37);
                              if (v60)
                              {
                                LODWORD(v37) = 942130604;
                                objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", @"VerticalMax", &v60, v37);
                                a5[1].var12 = LODWORD(v38);
                                if (v60)
                                {
                                  LODWORD(v38) = 961656599;
                                  objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", @"GlobalMax", &v60, v38);
                                  a5[1].var13 = v39;
                                  if (v60)
                                  {
                                    objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", @"PostCorrectionOffsetR", &v60, 0.0);
                                    a5[1].var14 = v40;
                                    if (v60)
                                    {
                                      objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", @"PostCorrectionOffsetGr", &v60, 0.0);
                                      a5[1].var15 = v41;
                                      if (v60)
                                      {
                                        objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", @"PostCorrectionOffsetGb", &v60, 0.0);
                                        a5[1].var16 = v42;
                                        if (v60)
                                        {
                                          objc_msgSend(v21, "cmi_floatValueForKey:defaultValue:found:", @"PostCorrectionOffsetB", &v60, 0.0);
                                          a5[1].var17 = v43;
                                          if (v60)
                                          {
                                            *(float32x2_t *)&a5[1].var15 = vmul_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)&v59, 0), *(float32x2_t *)&a5[1].var15);
                                            a5[1].var17 = *(float *)&v59 * v43;
                                            *(float32x4_t *)&a5[1].var11 = vmulq_n_f32(*(float32x4_t *)&a5[1].var11, *(float *)&v59);
                                            *(double *)v44.i64 = -[SoftISPInputFrame sensorBlackLevel]((uint64_t)v9);
                                            int8x16_t v45 = (int8x16_t)vsubq_s32(v44, vdupq_n_s32(-[SoftISPInputFrame uncorrectedSensorBlackLevel]((uint64_t)v9)));
                                            *(int32x2_t *)v45.i8 = vadd_s32(*(int32x2_t *)v45.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v45, v45, 8uLL));
                                            a5->var20 = (float)(v25
                                                              * fmaxf((float)vadd_s32(*(int32x2_t *)v45.i8, vdup_lane_s32(*(int32x2_t *)v45.i8, 1)).i32[0]* 0.25, 0.0))/ (float)(int)-[SoftISPInputFrame pipelineHeadRoom]((uint64_t)v9);
                                            *(void *)&a5[1].var5 = v15;
                                            LODWORD(a5[1].var7) = -[SoftISPInputFrame firstPixel]((uint64_t)v9) == 1;
                                            if (-[SoftISPInputFrame cfaLayout]((uint64_t)v9) == 3)
                                            {
                                              unint64_t v46 = 0;
                                              int16x4_t v47 = 0;
                                              int32x2_t v48 = a5;
                                              while (1)
                                              {
                                                float v49 = *(float *)&a4->var0[8].var0;
                                                long long v50 = *(_OWORD *)&a4->var0[0].var0;
                                                *(_OWORD *)&v48->var0[0].var0 = *(_OWORD *)&a4->var0[0].var0;
                                                v48->var3 = v49;
                                                if (v46 <= 1)
                                                {
                                                  if (!v48->var0[0].var0) {
                                                    goto LABEL_53;
                                                  }
                                                }
                                                else if (!v48->var0[0].var0)
                                                {
                                                  goto LABEL_39;
                                                }
                                                LOWORD(v50) = LOWORD(v48->var3);
                                                WORD2(v50) = HIWORD(v48->var3);
                                                unsigned __int32 v51 = vuzp1_s16(v47, v47).u32[0];
                                                int16x4_t v47 = (int16x4_t)vmovl_u16(vmax_u16((uint16x4_t)v51, (uint16x4_t)vuzp1_s16(*(int16x4_t *)&v50, (int16x4_t)v51).u32[0])).u64[0];
LABEL_39:
                                                ++v46;
                                                int32x2_t v48 = ($1EB6A15CB4CA3F8D48EC7328309D66A1 *)((char *)v48 + 20);
                                                a4 = (const $D74E51C6D02B1099BA11C1EFF89AFCD0 *)((char *)a4 + 80);
                                                if (v46 == 4) {
                                                  goto LABEL_49;
                                                }
                                              }
                                            }
                                            unint64_t v52 = 0;
                                            int16x4_t v47 = 0;
                                            uint64_t v53 = a5;
                                            while (1)
                                            {
                                              float v54 = *(float *)&a4->var0[8].var0;
                                              long long v55 = *(_OWORD *)&a4->var0[0].var0;
                                              *(_OWORD *)&v53->var0[0].var0 = *(_OWORD *)&a4->var0[0].var0;
                                              v53->var3 = v54;
                                              if (v52 <= 1)
                                              {
                                                if (!v53->var0[0].var0)
                                                {
LABEL_53:
                                                  FigDebugAssert3();
                                                  goto LABEL_54;
                                                }
                                              }
                                              else if (!v53->var0[0].var0)
                                              {
                                                goto LABEL_48;
                                              }
                                              LOWORD(v55) = LOWORD(v53->var3);
                                              WORD2(v55) = HIWORD(v53->var3);
                                              unsigned __int32 v56 = vuzp1_s16(v47, v47).u32[0];
                                              int16x4_t v47 = (int16x4_t)vmovl_u16(vmax_u16((uint16x4_t)v56, (uint16x4_t)vuzp1_s16(*(int16x4_t *)&v55, (int16x4_t)v56).u32[0])).u64[0];
LABEL_48:
                                              ++v52;
                                              a4 = (const $D74E51C6D02B1099BA11C1EFF89AFCD0 *)((char *)a4 + 20);
                                              uint64_t v53 = ($1EB6A15CB4CA3F8D48EC7328309D66A1 *)((char *)v53 + 20);
                                              if (v52 == 4)
                                              {
LABEL_49:
                                                HIWORD(a5->var19) = v47.i16[2];
                                                LOWORD(a5->var19) = v47.i16[0];
                                                goto LABEL_50;
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      goto LABEL_54;
    }
  }
  *(_OWORD *)&a5[1].var14 = 0u;
  *(_OWORD *)&a5[1].var7 = 0u;
  *(_OWORD *)&a5[1].var11 = 0u;
  *(_OWORD *)&a5[1].var0[0].var0 = 0u;
  *(_OWORD *)&a5[1].var3 = 0u;
  *(_OWORD *)&a5->var15 = 0u;
  *(_OWORD *)&a5->var19 = 0u;
  *(_OWORD *)&a5->var7 = 0u;
  *(_OWORD *)&a5->var11 = 0u;
  *(_OWORD *)&a5->var0[0].var0 = 0u;
  *(_OWORD *)&a5->var3 = 0u;
LABEL_50:

  int v57 = 0;
LABEL_51:

  return v57;
}

- (int)generateGOCConfigFromInputFrameMetadata:(id)a3 toGocConfig:(id *)a4
{
  id v5 = a3;
  id v6 = -[SoftISPInputFrame metadata]((uint64_t)v5);
  if (!v6)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    int v13 = 0;
    goto LABEL_18;
  }
  int v7 = -[SoftISPInputFrame compandingMode]((uint64_t)v5);
  if (v7 == 3 || v7 == 2)
  {
    *(double *)v9.i64 = -[SoftISPInputFrame sensorBlackLevel]((uint64_t)v5);
    int v8 = 65055 - vmaxvq_s32(v9);
  }
  else
  {
    if (v7 != 1)
    {
      int v13 = FigSignalErrorAt();
      goto LABEL_18;
    }
    int v8 = -[SoftISPInputFrame sensorHeadRoom]((uint64_t)v5);
  }
  *(double *)v10.i64 = -[SoftISPInputFrame sensorBlackLevel]((uint64_t)v5);
  int32x4_t v19 = v10;
  int v11 = -[SoftISPInputFrame firstPixel]((uint64_t)v5);
  int32x4_t v12 = 0uLL;
  switch(v11)
  {
    case 0:
      int32x4_t v12 = v19;
      break;
    case 1:
      int32x4_t v12 = vrev64q_s32(v19);
      break;
    case 2:
      int8x16_t v14 = (int8x16_t)v19;
      goto LABEL_13;
    case 3:
      int8x16_t v14 = (int8x16_t)vrev64q_s32(v19);
LABEL_13:
      int32x4_t v12 = (int32x4_t)vextq_s8(v14, v14, 8uLL);
      break;
    default:
      break;
  }
  int32x4_t v20 = v12;
  a4->var1 = -[SoftISPInputFrame firstPixel]((uint64_t)v5);
  *(_OWORD *)&a4[32].var0 = 0u;
  unsigned int v15 = -[SoftISPInputFrame pipelineHeadRoom]((uint64_t)v5) << 12;
  if (v8 >= 0) {
    int v16 = v8;
  }
  else {
    int v16 = v8 + 1;
  }
  int32x4_t v17 = vnegq_s32(v20);
  *(int8x16_t *)&a4[8].var0 = vextq_s8((int8x16_t)v17, (int8x16_t)vrev64q_s32(v17), 8uLL);
  *(_OWORD *)&a4[16].var0 = 0u;
  *(int32x4_t *)&a4[24].var0 = vdupq_n_s32((int)(v15 + (v16 >> 1)) / v8);
  *(int32x4_t *)&a4[40].var0 = vdupq_n_s32(-(int)-[SoftISPInputFrame pipelineFootRoom]((uint64_t)v5));
  int v13 = 0;
  *(int32x4_t *)&a4[48].var0 = vdupq_n_s32(-[SoftISPInputFrame pipelineHeadRoom]((uint64_t)v5));
  a4->var0 = 1;
LABEL_18:

  return v13;
}

- (int)getBLCGOCConfigForInputFrame:(id)a3 gocConfig:(id *)a4
{
  id v7 = a3;
  if ([(SoftISPConfig *)self stageConfigMode] == 3
    || [(SoftISPConfig *)self stageConfigMode] == 4)
  {
    -[SoftISPInputFrame registers]((uint64_t)v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    int32x4_t v9 = v8;
    LOBYTE(v28) = 0;
    if (v8)
    {
      int32x4_t v10 = [v8 objectForKeyedSubscript:@"RsclProcBLC0"];
      if (v10)
      {
        int v11 = v10;
        a4->var1 = objc_msgSend(v10, "cmi_intValueForKey:defaultValue:found:", @"FirstPix", 0x7FFFFFFFLL, &v28);
        if ((_BYTE)v28)
        {
          int32x4_t v12 = [v11 objectForKeyedSubscript:@"Gain"];
          if (v12)
          {
            int v13 = v12;
            objc_msgSend(v12, "cmi_simdInt4ValueForKey:defaultValue:found:", @"Gain", &v28);
            *(_OWORD *)&a4[24].var0 = v14;
            if ((_BYTE)v28)
            {
              objc_msgSend(v13, "cmi_simdInt4ValueForKey:defaultValue:found:", @"GainShift", &v28, COERCE_DOUBLE(0x7FFFFFFFLL));
              *(_OWORD *)&a4[32].var0 = v15;
              if ((_BYTE)v28)
              {
                objc_msgSend(v11, "cmi_simdInt4ValueForKey:defaultValue:found:", @"Min", &v28, COERCE_DOUBLE(0x7FFFFFFFLL));
                *(_OWORD *)&a4[40].var0 = v16;
                if ((_BYTE)v28)
                {
                  objc_msgSend(v11, "cmi_simdInt4ValueForKey:defaultValue:found:", @"Max", &v28, COERCE_DOUBLE(0x7FFFFFFFLL));
                  *(_OWORD *)&a4[48].var0 = v17;
                  if ((_BYTE)v28)
                  {
                    objc_msgSend(v11, "cmi_simdInt4ValueForKey:defaultValue:found:", @"Offset1", &v28, COERCE_DOUBLE(0x7FFFFFFFLL));
                    *(_OWORD *)&a4[8].var0 = v18;
                    if ((_BYTE)v28)
                    {
                      objc_msgSend(v11, "cmi_simdInt4ValueForKey:defaultValue:found:", @"Offset2", &v28, COERCE_DOUBLE(0x7FFFFFFFLL));
                      *(_OWORD *)&a4[16].var0 = v19;
                      if ((_BYTE)v28)
                      {
                        a4->var0 = 1;

                        goto LABEL_14;
                      }
                      uint64_t v27 = v4;
                      LODWORD(v26) = 0;
                    }
                    else
                    {
                      uint64_t v27 = v4;
                      LODWORD(v26) = 0;
                    }
                  }
                  else
                  {
                    uint64_t v27 = v4;
                    LODWORD(v26) = 0;
                  }
                }
                else
                {
                  uint64_t v27 = v4;
                  LODWORD(v26) = 0;
                }
              }
              else
              {
                uint64_t v27 = v4;
                LODWORD(v26) = 0;
              }
            }
            else
            {
              uint64_t v27 = v4;
              LODWORD(v26) = 0;
            }
            FigDebugAssert3();
            int v24 = FigSignalErrorAt();

            goto LABEL_45;
          }
          uint64_t v27 = v4;
          LODWORD(v26) = 0;
        }
        else
        {
          uint64_t v27 = v4;
          LODWORD(v26) = 0;
        }
        FigDebugAssert3();
        int v24 = FigSignalErrorAt();
LABEL_45:

LABEL_46:
        if (v24) {
          goto LABEL_49;
        }
LABEL_14:
        if ([(SoftISPConfig *)self stageConfigMode] == 4)
        {
          long long v33 = 0u;
          int32x4_t v34 = 0u;
          int32x4_t v31 = 0u;
          int32x4_t v32 = 0u;
          int32x4_t v29 = 0u;
          int32x4_t v30 = 0u;
          long long v28 = 0u;
          int v20 = [(H13FastRawScaleConfig *)self generateGOCConfigFromInputFrameMetadata:v7 toGocConfig:&v28];
          if (!v20)
          {
            if (v28 != a4->var0
              || (_BYTE)v28
              && (BYTE1(v28) != a4->var1
               || (vminvq_u32((uint32x4_t)vcgeq_s32(vdupq_n_s32((int)(65055 * *(_OWORD *)&a4[24].var0 + 65007) / 65008), vabsq_s32(vsubq_s32(v31, *(int32x4_t *)&a4[24].var0)))) & 0x80000000) == 0|| (v21.i64[0] = 0x100000001, v21.i64[1] = 0x100000001, (vminvq_u32((uint32x4_t)vcgtq_s32(v21, vabsq_s32(vsubq_s32(v32, *(int32x4_t *)&a4[32].var0)))) & 0x80000000) == 0)|| (vminvq_u32((uint32x4_t)vcgtq_s32(v21, vabsq_s32(vsubq_s32(v34, *(int32x4_t *)&a4[48].var0)))) & 0x80000000) == 0|| (v22.i64[0] = 0x200000002, v22.i64[1] = 0x200000002, (vminvq_u32((uint32x4_t)vcgtq_s32(v22, vabsq_s32(vsubq_s32(v29, *(int32x4_t *)&a4[8].var0)))) & 0x80000000) == 0)|| (v23.i64[0] = 0x100000001, v23.i64[1] = 0x100000001, (vminvq_u32((uint32x4_t)vcgtq_s32(v23, vabsq_s32(vsubq_s32(v30, *(int32x4_t *)&a4[16].var0)))) & 0x80000000) == 0)))
            {
              FigDebugAssert3();
              int v24 = FigSignalErrorAt();
              goto LABEL_31;
            }
            goto LABEL_30;
          }
          int v24 = v20;
LABEL_49:
          FigDebugAssert3();
          goto LABEL_31;
        }
LABEL_30:
        int v24 = 0;
        goto LABEL_31;
      }
      uint64_t v27 = v4;
      LODWORD(v26) = 0;
    }
    else
    {
      uint64_t v27 = v4;
      LODWORD(v26) = 0;
    }
    FigDebugAssert3();
    int v24 = FigSignalErrorAt();
    goto LABEL_46;
  }
  if ([(SoftISPConfig *)self stageConfigMode] != 1
    && [(SoftISPConfig *)self stageConfigMode] != 2)
  {
    FigDebugAssert3();
    goto LABEL_30;
  }
  int v24 = [(H13FastRawScaleConfig *)self generateGOCConfigFromInputFrameMetadata:v7 toGocConfig:a4];
  if (v24) {
    goto LABEL_49;
  }
LABEL_31:

  return v24;
}

- (int)getShadingFPNRConfigForInputFrame:(id)a3 shadingFPNRConfig:(id *)a4
{
  id v6 = (id *)a3;
  id v7 = v6;
  v117[0] = 0;
  if (!v6 || !a4)
  {
    int v101 = FigSignalErrorAt();
    id v116 = 0;
    int v11 = 0;
    int32x4_t v31 = 0;
    int32x4_t v30 = 0;
    int32x4_t v9 = 0;
    goto LABEL_73;
  }
  unsigned int v8 = -[SoftISPInputFrame softQuadraBinningFactor]((uint64_t)v6);
  int32x4_t v9 = -[SoftISPInputFrame metadata]((uint64_t)v7);
  if (!v9)
  {
    FigDebugAssert3();
    int v101 = FigSignalErrorAt();
    id v116 = 0;
    int v11 = 0;
LABEL_78:
    int32x4_t v31 = 0;
    int32x4_t v30 = 0;
    goto LABEL_73;
  }
  int32x4_t v10 = [(SoftISPConfig *)self staticParameters];
  int v11 = [v10 tuningParametersForInputFrameMetadata:v9 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v7)];

  uint64_t v12 = [v11 valueForKey:@"BFPN"];
  int v13 = (void *)v12;
  long long v14 = (void *)MEMORY[0x263EFFA78];
  if (v12) {
    long long v14 = (void *)v12;
  }
  id v116 = v14;

  LODWORD(v15) = 1.0;
  objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F468], v117, v15);
  if (!v117[0]) {
    goto LABEL_77;
  }
  float v17 = *(float *)&v16;
  LODWORD(v16) = 1132462080;
  objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2C0], v117, v16);
  if (!v117[0]) {
    goto LABEL_77;
  }
  float v19 = *(float *)&v18;
  LODWORD(v18) = 1132462080;
  objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F6E8], v117, v18);
  if (!v117[0]
    || (float v21 = *(float *)&v20,
        LODWORD(v20) = 1109393408,
        objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F688], v117, v20),
        !v117[0])
    || (float v23 = v22,
        objc_msgSend(v9, "cmi_simdFloat4ValueForKey:defaultValue:found:", *MEMORY[0x263F2F658], v117, 0.0),
        !v117[0]))
  {
LABEL_77:
    FigDebugAssert3();
    int v101 = FigSignalErrorAt();
    goto LABEL_78;
  }
  float32x4_t v110 = v24;
  unsigned int v25 = v8;
  uint64_t v26 = v11;
  uint64_t v27 = [(SoftISPConfig *)self staticParameters];
  long long v28 = -[RawNightModeInputFrame textures]((uint64_t)v27);
  int32x4_t v29 = -[SoftISPInputFrame portType](v7);
  int32x4_t v30 = [v28 objectForKeyedSubscript:v29];

  if (-[SoftISPInputFrame cfaLayout]((uint64_t)v7) == 3) {
    [v30 quadraShadingFPNCorrection];
  }
  else {
  int32x4_t v31 = [v30 shadingFPNCorrection];
  }
  int v32 = objc_msgSend(v116, "cmi_BOOLValueForKey:defaultValue:found:", @"CanUseBayerCorrectionForQuadra", 0, 0);
  if (v31) {
    int v33 = 0;
  }
  else {
    int v33 = v32;
  }
  if (v33 == 1)
  {
    int32x4_t v34 = [v30 shadingFPNCorrection];

    if (!v34)
    {
      int32x4_t v31 = 0;
      int v101 = 0;
      int v11 = v26;
LABEL_73:
      a4->var0 = 0;
      *(_OWORD *)&a4->var1 = 0u;
      *(_OWORD *)&a4->var5 = 0u;
      *(_OWORD *)&a4->var9 = 0u;
      *(_OWORD *)&a4[1].var2 = 0u;
      goto LABEL_71;
    }
    int32x4_t v31 = [v30 shadingFPNCorrection];
  }
  int v11 = v26;
  if (!v31) {
    goto LABEL_74;
  }
  [v31 referenceExposureTime];
  float v36 = v35;
  [v31 referenceAnalogGain];
  float v115 = v36 * v37;
  if ((float)(v36 * v37) == 0.0)
  {
    FigDebugAssert3();
    int v101 = FigSignalErrorAt();
    goto LABEL_73;
  }
  float v113 = v19 * 0.0039062;
  [v31 fpnTemperatureGrowthFactor];
  float v39 = v38;
  [v31 shadingTemperatureGrowthFactor];
  float v41 = v40;
  [v31 dcOffsetTemperatureGrowthFactor];
  float v43 = v42;
  [v31 opbTemperatureGrowthFactor];
  float v45 = v44;
  int v46 = objc_msgSend(v9, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F590], 0, 0);
  int v47 = objc_msgSend(v9, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F598], 0, 0);
  __asm { FMOV            V0.2S, #0.25 }
  float32x2_t v111 = _D0;
  float v106 = v45;
  if (v46 >= 6)
  {
    if (v47 >= 3) {
      float v60 = v43;
    }
    else {
      float v60 = v45;
    }
    if (v47 >= 3) {
      float v61 = v41;
    }
    else {
      float v61 = v45;
    }
    if (v47 >= 3) {
      float v62 = v39;
    }
    else {
      float v62 = v45;
    }
    if (v46 == 6) {
      float v45 = v60;
    }
    else {
      float v45 = v43;
    }
    if (v46 == 6) {
      float v59 = v61;
    }
    else {
      float v59 = v41;
    }
    if (v46 == 6) {
      float v39 = v62;
    }
  }
  else
  {
    if (v46 != 5)
    {
      [v31 blackLevelResidualReference];
      int32x2_t v108 = (int32x2_t)vadd_f32(*(float32x2_t *)v53.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v53, v53, 8uLL));
      [v31 referenceTemperature];
      float v55 = expf(v45 * (float)(40.0 - v54));
      v56.i32[0] = 1117782016;
      v56.i32[0] = vdiv_f32(v56, (float32x2_t)__PAIR64__(v108.u32[1], LODWORD(v115))).u32[0];
      v56.i32[1] = vadd_f32((float32x2_t)vdup_lane_s32(v108, 0), *(float32x2_t *)&v108).i32[1];
      float32x2_t v57 = vmul_f32(v56, (float32x2_t)__PAIR64__(v111.u32[1], LODWORD(v55)));
      _NF = vmul_lane_f32(v57, v57, 1).f32[0] < 320.0;
      float v58 = 1.0;
      if (_NF) {
        float v58 = 0.5;
      }
      float v115 = v115 * v58;
    }
    float v39 = v45;
    float v59 = v45;
  }
  float v109 = v21 * 0.0039062;
  float v63 = v17 * v113;
  float v64 = (float)(v17 * v113) / v115;
  [v31 referenceTemperature];
  float v66 = expf(v39 * (float)(v23 - v65));
  [v31 referenceTemperature];
  float v68 = expf(v59 * (float)(v23 - v67));
  [v31 referenceTemperature];
  float v70 = expf(v45 * (float)(v23 - v69));
  [v31 blackLevelResidualReference];
  float32x4_t v107 = v71;
  [v31 blackLevelResidualZero];
  float32x4_t v105 = v72;
  [v31 blackLevelResidualZero];
  float32x4_t v104 = v73;
  if ((int)[v31 modelVersionMajor] >= 3 && v106 > 0.0)
  {
    int8x16_t v74 = (int8x16_t)vsubq_f32(v107, v105);
    *(float32x2_t *)v74.i8 = vadd_f32(*(float32x2_t *)v74.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v74, v74, 8uLL));
    int8x16_t v75 = (int8x16_t)vsubq_f32(v110, v104);
    *(float32x2_t *)v75.i8 = vadd_f32(*(float32x2_t *)v75.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v75, v75, 8uLL));
    float32x2_t v76 = vmul_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v75.i8, *(int32x2_t *)v74.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v75.i8, *(int32x2_t *)v74.i8)), v111);
    int32x2_t v77 = vcgt_f32(v76, (float32x2_t)vdup_n_s32(0x42480000u));
    if ((v77.i8[4] & 1) != 0 && (v77.i8[0] & 1) != 0 && v63 > 0.0)
    {
      float v78 = (float)(v76.f32[0] / v63) / (float)(v76.f32[1] / v115);
      float v66 = powf(v78, v39 / v106);
      float v68 = powf(v78, v59 / v106);
      float v70 = powf(v78, v45 / v106);
    }
  }
  float v79 = v64 * v66;
  float v80 = v64 * v68;
  float v81 = v64 * v70;
  float v82 = v113 * v109;
  float v83 = v33 ? 0.0 : 1.0;
  float GainBasedTuning = getGainBasedTuning(v116, @"FPNScaling", v113 * v109, v83);
  float v85 = getGainBasedTuning(v116, @"ShadingScaling", v82, 1.0);
  float v86 = getGainBasedTuning(v116, @"DCOffsetScaling", v82, 1.0);
  float v87 = getGainBasedTuning(v116, @"DCZeroOffsetScaling", v82, 1.0);
  float v88 = v25 <= 1 ? GainBasedTuning : 0.0;
  *(float *)&int v89 = v79 * v88;
  float v90 = v80 * v85;
  if ((float)(v79 * v88) < 0.001 && v90 < 0.001 && (float)(v81 * v86) < 0.001)
  {
LABEL_74:
    int v101 = 0;
    goto LABEL_73;
  }
  float v114 = v86 * v87;
  if ((int)[v31 modelVersionMajor] >= 5)
  {
    if ([v31 modelVersionMajor] == 5)
    {
      int v93 = [v31 modelVersionMinor];
      a4->var0 = 1;
      if (v93 < 1) {
        goto LABEL_62;
      }
    }
    else
    {
      a4->var0 = 1;
    }
    [v31 calibrationSpatialStdDev];
    goto LABEL_68;
  }
  a4->var0 = 1;
LABEL_62:
  [v31 calibrationSpatialStdDev];
  float v92 = v91 / 6.5;
LABEL_68:
  a4->var1 = v92;
  [v31 calibrationTemporalStdDev];
  a4->var2 = v94;
  a4->var3 = [v31 nDarkFramesUsedInCalibration];
  v95.i32[0] = 1.0;
  if (v33) {
    *(float *)v95.i32 = 0.5;
  }
  *(int32x2_t *)&a4->var8 = vdup_lane_s32(v95, 0);
  a4[1].var3 = v89;
  [v31 fpnMinValue];
  a4[1].var4 = *(float *)&v89 * v96;
  [v31 fpnMaxValue];
  a4[1].var5 = *(float *)&v89 * v97;
  *(float *)&a4[1].var0 = v90;
  [v31 shadingMinValue];
  a4[1].var1 = v90 * v98;
  [v31 shadingMaxValue];
  a4[1].var2 = v90 * v99;
  [v31 dcOffsetZero];
  float32x4_t v112 = v100;
  [v31 dcOffsetReference];
  int v101 = 0;
  *(float32x4_t *)&a4->var4 = vmlaq_n_f32(vmulq_n_f32(v102, v81 * v86), v112, v114);
LABEL_71:

  return v101;
}

- (id)getShadingFPNCorrectionTextureForInputFrame:(id)a3
{
  uint64_t v4 = (id *)a3;
  id v5 = v4;
  if (!v4)
  {
    FigSignalErrorAt();
    float v21 = 0;
    id v6 = 0;
LABEL_19:
    unsigned int v8 = 0;
    id v12 = 0;
    float v17 = 0;
    double v18 = 0;
    goto LABEL_16;
  }
  id v6 = -[SoftISPInputFrame metadata]((uint64_t)v4);
  if (!v6)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    float v21 = 0;
    goto LABEL_19;
  }
  id v7 = [(SoftISPConfig *)self staticParameters];
  unsigned int v8 = [v7 tuningParametersForInputFrameMetadata:v6 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v5)];

  uint64_t v9 = [v8 valueForKey:@"BFPN"];
  int32x4_t v10 = (void *)v9;
  int v11 = (void *)MEMORY[0x263EFFA78];
  if (v9) {
    int v11 = (void *)v9;
  }
  id v12 = v11;

  int v13 = objc_msgSend(v12, "cmi_BOOLValueForKey:defaultValue:found:", @"CanUseBayerCorrectionForQuadra", 0, 0);
  long long v14 = [(SoftISPConfig *)self staticParameters];
  double v15 = -[RawNightModeInputFrame textures]((uint64_t)v14);
  double v16 = -[SoftISPInputFrame portType](v5);
  float v17 = [v15 objectForKeyedSubscript:v16];

  if (-[SoftISPInputFrame cfaLayout]((uint64_t)v5) == 3) {
    [v17 quadraShadingFPNCorrection];
  }
  else {
  double v18 = [v17 shadingFPNCorrection];
  }
  if (v18) {
    int v19 = 0;
  }
  else {
    int v19 = v13;
  }
  if (v19 == 1)
  {
    double v20 = [v17 shadingFPNCorrection];

    if (v20)
    {
      double v18 = [v17 shadingFPNCorrection];
    }
    else
    {
      double v18 = 0;
    }
  }
  float v21 = [v18 correctionImage];
LABEL_16:
  id v22 = v21;

  return v22;
}

- (int)getBlackLevelShadingConfigForInputFrame:(id)a3 blackLevelShadingConfig:(id *)a4
{
  id v6 = (id *)a3;
  id v7 = v6;
  char v37 = 0;
  if (v6 && a4)
  {
    *a4 = 0u;
    a4[1] = 0u;
    unsigned int v8 = -[SoftISPInputFrame softQuadraBinningFactor]((uint64_t)v6);
    uint64_t v9 = -[SoftISPInputFrame metadata]((uint64_t)v7);
    if (v9)
    {
      int32x4_t v10 = [(SoftISPConfig *)self staticParameters];
      int v11 = -[RawNightModeInputFrame textures]((uint64_t)v10);
      id v12 = -[SoftISPInputFrame portType](v7);
      int v13 = [v11 objectForKeyedSubscript:v12];

      long long v14 = [v13 blacklevelShadingCorrection];
      double v15 = v14;
      if (v14)
      {
        double v16 = getBlackLevelShadingThumbnail(v14, v7);
        if (v16) {
          BOOL v17 = v8 >= 2;
        }
        else {
          BOOL v17 = 1;
        }
        int v18 = !v17;
        if (v18 == 1)
        {
          int v19 = [(SoftISPConfig *)self staticParameters];
          double v20 = [v19 tuningParametersForInputFrameMetadata:v9 tuningType:-[SoftISPInputFrame tuningType]((uint64_t)v7)];

          uint64_t v21 = [v20 valueForKey:@"BlackLevelShading"];
          id v22 = (void *)v21;
          float v23 = (void *)MEMORY[0x263EFFA78];
          if (v21) {
            float v23 = (void *)v21;
          }
          id v24 = v23;

          LODWORD(v25) = 1109393408;
          objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F688], &v37, v25);
          if (!v37)
          {
            FigDebugAssert3();
            int v33 = FigSignalErrorAt();

            goto LABEL_17;
          }
          float v27 = v26;
          float GainBasedTuning = getGainBasedTuning(v24, @"ShadingScalingFactor", v26, 1.0);
          float v36 = getGainBasedTuning(v24, @"ShadingBiasScalingFactor", v27, 1.0);
          *(float *)v29.i32 = getGainBasedTuning(v24, @"ShadingBiasOffset", v27, 0.0);
          int32x2_t v35 = v29;
          a4->var0 = 1;
          a4->var1 = GainBasedTuning;
          [v16 minValue];
          a4->var2 = GainBasedTuning * v30;
          [v16 maxValue];
          a4->var3 = GainBasedTuning * v31;
          [v16 biasValues];
          a4[1] = ($27E7E9F8CD774BF16CD09FB598EF9C01)vmulq_n_f32(vaddq_f32((float32x4_t)vdupq_lane_s32(v35, 0), v32), v36);
        }
        int v33 = 0;
      }
      else
      {
        double v16 = 0;
        int v33 = 0;
      }
    }
    else
    {
      FigDebugAssert3();
      int v33 = FigSignalErrorAt();
      int v13 = 0;
      double v15 = 0;
      double v16 = 0;
    }
  }
  else
  {
    int v33 = FigSignalErrorAt();
    int v13 = 0;
    double v15 = 0;
    double v16 = 0;
    uint64_t v9 = 0;
  }
LABEL_17:

  return v33;
}

- (id)getBlackLevelShadingCorrectionTextureForInputFrame:(id)a3
{
  uint64_t v4 = (id *)a3;
  id v5 = v4;
  if (!v4)
  {
    FigSignalErrorAt();
    int v13 = 0;
    id v6 = 0;
LABEL_7:
    int32x4_t v10 = 0;
    int v11 = 0;
    id v12 = 0;
    goto LABEL_4;
  }
  id v6 = -[SoftISPInputFrame metadata]((uint64_t)v4);
  if (!v6)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    int v13 = 0;
    goto LABEL_7;
  }
  id v7 = [(SoftISPConfig *)self staticParameters];
  unsigned int v8 = -[RawNightModeInputFrame textures]((uint64_t)v7);
  uint64_t v9 = -[SoftISPInputFrame portType](v5);
  int32x4_t v10 = [v8 objectForKeyedSubscript:v9];

  int v11 = [v10 blacklevelShadingCorrection];
  id v12 = getBlackLevelShadingThumbnail(v11, v5);
  int v13 = [v12 thumbnailTex];
LABEL_4:
  id v14 = v13;

  return v14;
}

@end