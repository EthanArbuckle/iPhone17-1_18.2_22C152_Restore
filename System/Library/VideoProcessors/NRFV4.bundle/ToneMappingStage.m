@interface ToneMappingStage
+ (id)getHighlightCompression_asNSArray:(const ltmCurves *)a3;
+ (int)prewarmShaders:(id)a3;
- (BOOL)enableSTF;
- (BOOL)stfStillApplied;
- (SidecarWriter)sidecarWriter;
- (ToneMappingStage)initWithContext:(id)a3 mtlSuballocatorID:(unsigned int)a4;
- (__n64)getCcmRoi:(uint64_t)a3 chromaTexHeight:(int)a4 ccmLut:(int)a5 gridScaleFactor:(_WORD *)a6;
- (__n64)getLtmRoi:(uint64_t)a3 chromaTexHeight:(int)a4 ltmLut:(int)a5 gridScaleFactor:(_WORD *)a6;
- (float)getExposureBiasFactor:(id)a3 inputIsLinear:(BOOL)a4;
- (id)getSTFLTM_asNSData;
- (int)allocateResourcesForWidth:(unint64_t)a3 height:(unint64_t)a4 srlVersion:(int)a5;
- (int)calculateBlackWhiteContrastCenter:(float)a3 contrastParam:(id)a4 curves:;
- (int)fetchTuningParametersFromPlist:(id)a3 plist:(id)a4 ev0FrameMetadata:(id)a5 toneMap:(id)a6 isLowLight:(BOOL)a7 destinationMTLBuffer:(id)a8;
- (int)fetchTuningParametersMSTMv2FromPlist:(id)a3 ev0FrameMetadata:(id)a4 toneMap:(id)a5 destinationMTLBuffer:(id)a6;
- (int)getSTFStillCorrectionStrength:(BOOL)a3;
- (int)mstmsApplyLumaGain:(id)a3 inputLuma:(id)a4 inputChroma:(id)a5 intermediateChroma:(id)a6 outputChroma:(id)a7 localGainMap:(id)a8 gammaCurve:(id)a9 personMask:(id)a10 chromaGainAdjPower:(float)a11 inputIsLinear:(BOOL)a12 chromaBias:(float)a13 blackPoint:(id)a14 playbackCurve:(id)a15 saturationControl:(float)a16 frameGain:(float)a17 firstPass:(BOOL)a18 hrGainDownRatio:(float)a19;
- (int)performBlackSubtractionWithBlackWhiteParams:(float)a3 maxContrastStrength:(id)a4 inOutTex:(id)a5 curves:;
- (int)performSmallFaceFix:(id)a3 faceLandmarks:(id)a4 faceLandmarkOrientation:(int)a5 tmPlist:(id)a6;
- (int)performToneMapSmoothing:(id)a3 luma:(id)a4 mask:(id)a5 auxMask:(id)a6 skyMask:(id)a7 tmPlist:(id)a8 ev0FrameMetadata:(id)a9 useMaskPyramid:(BOOL)a10 firstPass:(BOOL)a11;
- (int)setupSTFProcessor:(id)a3;
- (uint64_t)performLTM:(__n128)a3 bilateralGrid:(__n128)a4 bilateralGridHomography:(__n128)a5 detailEnhance:(float)a6 darkestFrameMetadata:(__n128)a7 scaleInput:(__n128)a8 colorCorrection:(__n128)a9 outputMode:(uint64_t)a10 chromaGainAdjPower:(void *)a11 inputIsLinear:(void *)a12 chromaBias:(void *)a13 gridScaleFactor:(int)a14 personMask:(uint64_t)a15 highlightCompression:(void *)a16 utmForegroundFactor:(uint64_t)a17 utmBackgroundFactor:(double)a18;
- (uint64_t)runToneMapping:(double)a3 bilateralGrid:(double)a4 bilateralGridHomography:(double)a5 tmPlist:(double)a6 darkestFrameMetadata:(double)a7 ev0FrameMetadata:(double)a8 scaleInput:(double)a9 colorCorrection:(double)a10 hasChromaBias:(uint64_t)a11 quality:(uint64_t)a12 inputIsLinear:(uint64_t)a13 stfAllowed:(uint64_t)a14 isLowLight:(uint64_t)a15;
- (uint64_t)runToneMapping:(double)a3 bilateralGrid:(double)a4 bilateralGridHomography:(float)a5 tmPlist:(double)a6 darkestFrameMetadata:(double)a7 ev0FrameMetadata:(double)a8 scaleInput:(double)a9 colorCorrection:(uint64_t)a10 hasChromaBias:(void *)a11 quality:(void *)a12 gridScaleFactor:(void *)a13 inputIsLinear:(void *)a14 stfAllowed:(void *)a15 isLowLight:(int)a16;
- (unsigned)_srlBoost:(unsigned __int16)a3 boostFactor:(float)a4;
- (unsigned)getSRLStatus;
- (unsigned)stfStillAnalyticsVersion;
- (void)dealloc;
- (void)reset;
- (void)setSidecarWriter:(id)a3;
@end

@implementation ToneMappingStage

- (ToneMappingStage)initWithContext:(id)a3 mtlSuballocatorID:(unsigned int)a4
{
  id v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ToneMappingStage;
  v8 = [(ToneMappingStage *)&v19 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v8->_metal, a3);
  v10 = [[SubjectRelightingStage alloc] initWithMetalContext:v9->_metal];
  subjectRelight = v9->_subjectRelight;
  v9->_subjectRelight = v10;

  if (v9->_subjectRelight)
  {
    v9->_mtlSuballocatorID = a4;
    v12 = +[ToneMappingShared sharedInstance];
    uint64_t v13 = [v12 getShaders:v9->_metal];
    shaders = v9->_shaders;
    v9->_shaders = (ToneMappingShaders *)v13;

    if (v9->_shaders) {
      goto LABEL_4;
    }
  }
  FigDebugAssert3();
  int v18 = FigSignalErrorAt();
  v15 = 0;
  if (!v18) {
LABEL_4:
  }
    v15 = v9;
  v16 = v15;

  return v16;
}

- (BOOL)enableSTF
{
  return self->_stfProcessor != 0;
}

- (BOOL)stfStillApplied
{
  return self->_stfStillApplied;
}

- (unsigned)stfStillAnalyticsVersion
{
  return self->_stfStillAnalyticsVersion;
}

- (int)setupSTFProcessor:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F2EE78] STFStillIBPForVersion:1];
  stfProcessor = self->_stfProcessor;
  self->_stfProcessor = v5;

  if (self->_stfProcessor)
  {
    id v7 = [(FigMetalContext *)self->_metal commandQueue];
    [(STFStillImageBufferProcessor *)self->_stfProcessor setMetalCommandQueue:v7];

    [(STFStillImageBufferProcessor *)self->_stfProcessor setTuningParameters:v4];
    int v8 = [(STFStillImageBufferProcessor *)self->_stfProcessor setup];
    if (v8)
    {
      FigDebugAssert3();
      FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v8 = FigSignalErrorAt();
  }

  return v8;
}

- (int)allocateResourcesForWidth:(unint64_t)a3 height:(unint64_t)a4 srlVersion:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  if ([(ToneMapSmoothingResources *)self->_toneMapSmoothingResources width] != a3
    || [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources height] != a4)
  {
    v9 = [[ToneMapSmoothingResources alloc] initWithMetalContext:self->_metal width:a3 height:a4 mtlSubAllocatorID:self->_mtlSuballocatorID srlVersion:v5];
    toneMapSmoothingResources = self->_toneMapSmoothingResources;
    self->_toneMapSmoothingResources = v9;

    if (!self->_toneMapSmoothingResources) {
      goto LABEL_13;
    }
  }
  stfProcessor = self->_stfProcessor;
  if (stfProcessor)
  {
    [(STFStillImageBufferProcessor *)stfProcessor purgeResources];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_opt_respondsToSelector() & 1) == 0
      || ![(STFStillImageBufferProcessor *)self->_stfProcessor supportsExternalMemoryResource])
    {
LABEL_10:
      int v16 = [(STFStillImageBufferProcessor *)self->_stfProcessor prepareToProcess:0];
      if (v16)
      {
        int v17 = v16;
        FigDebugAssert3();
        return v17;
      }
      goto LABEL_11;
    }
    uint64_t v12 = objc_opt_new();
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      v14 = [(FigMetalContext *)self->_metal allocator];
      v15 = [v14 backendAllocator];
      [v13 setAllocatorBackend:v15];

      [(STFStillImageBufferProcessor *)self->_stfProcessor setExternalMemoryResource:v13];
      goto LABEL_10;
    }
LABEL_13:
    FigDebugAssert3();
    return -12786;
  }
LABEL_11:
  int v17 = 0;
  self->_stfStillCorrectionStrength = 0;
  self->_stfStillApplied = 0;
  self->_stfStillAnalyticsVersion = 0;
  self->_SRLWaitCompleted = 0;
  return v17;
}

- (void)dealloc
{
  [(STFStillImageBufferProcessor *)self->_stfProcessor purgeResources];
  toneMapSmoothingResources = self->_toneMapSmoothingResources;
  self->_toneMapSmoothingResources = 0;

  subjectRelight = self->_subjectRelight;
  self->_subjectRelight = 0;

  v5.receiver = self;
  v5.super_class = (Class)ToneMappingStage;
  [(ToneMappingStage *)&v5 dealloc];
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  id v4 = [[ToneMappingShaders alloc] initWithMetal:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (int)calculateBlackWhiteContrastCenter:(float)a3 contrastParam:(id)a4 curves:
{
  long long v20 = *(_OWORD *)&a3;
  int v19 = v4;
  v6 = a4;
  id v7 = [(FigMetalContext *)self->_metal commandQueue];
  int v8 = [v7 commandBuffer];

  if (v8 && ([v8 computeCommandEncoder], (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = v9;
    [v9 setComputePipelineState:self->_shaders->_calculateBlackWhiteStrengthCenter];
    [v10 setBuffer:v6[7] offset:0 atIndex:0];
    [v10 setBytes:&v20 length:16 atIndex:1];
    [v10 setBytes:&v19 length:4 atIndex:2];
    [v10 setBuffer:v6[8] offset:0 atIndex:3];
    int64x2_t v17 = vdupq_n_s64(1uLL);
    uint64_t v18 = 1;
    int64x2_t v15 = v17;
    uint64_t v16 = 1;
    [v10 dispatchThreadgroups:&v17 threadsPerThreadgroup:&v15];
    [v10 endEncoding];
    if (*MEMORY[0x263F00E10])
    {
      v11 = [v8 commandQueue];
      uint64_t v12 = [v11 commandBuffer];

      [v12 setLabel:@"KTRACE_MTLCMDBUF"];
      [v12 addCompletedHandler:&__block_literal_global_3];
      [v12 commit];
      [v8 addCompletedHandler:&__block_literal_global_133];
    }
    [v8 commit];

    int v13 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v13 = FigSignalErrorAt();
  }

  return v13;
}

uint64_t __75__ToneMappingStage_calculateBlackWhiteContrastCenter_contrastParam_curves___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __75__ToneMappingStage_calculateBlackWhiteContrastCenter_contrastParam_curves___block_invoke_2(uint64_t a1, void *a2)
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

- (int)performBlackSubtractionWithBlackWhiteParams:(float)a3 maxContrastStrength:(id)a4 inOutTex:(id)a5 curves:
{
  int v7 = v5;
  double v20 = *(double *)&a3;
  id v9 = a4;
  v10 = a5;
  LODWORD(v11) = v7;
  [(ToneMappingStage *)self calculateBlackWhiteContrastCenter:v10 contrastParam:v20 curves:v11];
  uint64_t v12 = [(FigMetalContext *)self->_metal commandQueue];
  int v13 = [v12 commandBuffer];

  if (v13 && ([v13 computeCommandEncoder], (v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int64x2_t v15 = v14;
    [v14 setComputePipelineState:self->_shaders->_blackSubtractAndAddingContrast];
    [v15 setTexture:v9 atIndex:0];
    [v15 setBuffer:v10[8] offset:0 atIndex:0];
    [v15 setImageblockWidth:32 height:32];
    v23[0] = [v9 width];
    v23[1] = [v9 height];
    v23[2] = 1;
    int64x2_t v21 = vdupq_n_s64(0x20uLL);
    uint64_t v22 = 1;
    [v15 dispatchThreads:v23 threadsPerThreadgroup:&v21];
    [v15 endEncoding];
    if (*MEMORY[0x263F00E10])
    {
      uint64_t v16 = [v13 commandQueue];
      int64x2_t v17 = [v16 commandBuffer];

      [v17 setLabel:@"KTRACE_MTLCMDBUF"];
      [v17 addCompletedHandler:&__block_literal_global_135];
      [v17 commit];
      [v13 addCompletedHandler:&__block_literal_global_137];
    }
    [v13 commit];

    int v18 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v18 = FigSignalErrorAt();
  }

  return v18;
}

uint64_t __100__ToneMappingStage_performBlackSubtractionWithBlackWhiteParams_maxContrastStrength_inOutTex_curves___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __100__ToneMappingStage_performBlackSubtractionWithBlackWhiteParams_maxContrastStrength_inOutTex_curves___block_invoke_2(uint64_t a1, void *a2)
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

- (int)mstmsApplyLumaGain:(id)a3 inputLuma:(id)a4 inputChroma:(id)a5 intermediateChroma:(id)a6 outputChroma:(id)a7 localGainMap:(id)a8 gammaCurve:(id)a9 personMask:(id)a10 chromaGainAdjPower:(float)a11 inputIsLinear:(BOOL)a12 chromaBias:(float)a13 blackPoint:(id)a14 playbackCurve:(id)a15 saturationControl:(float)a16 frameGain:(float)a17 firstPass:(BOOL)a18 hrGainDownRatio:(float)a19
{
  v61[16] = *MEMORY[0x263EF8340];
  id v48 = a3;
  id v52 = a4;
  id v51 = a5;
  id v50 = a6;
  id v49 = a7;
  id v30 = a8;
  id v31 = a9;
  id v32 = a10;
  float v58 = a11;
  BOOL v57 = a12;
  float v56 = a13;
  id v33 = a14;
  id v34 = a15;
  float v54 = a17;
  float v55 = a16;
  float v53 = a19;
  v35 = [(FigMetalContext *)self->_metal commandQueue];
  v36 = [v35 commandBuffer];

  if (!v36)
  {
    FigDebugAssert3();
    int v45 = FigSignalErrorAt();
    v40 = v48;
    goto LABEL_9;
  }
  v37 = [v36 computeCommandEncoder];
  v38 = v37;
  if (!v37)
  {
    FigDebugAssert3();
    int v45 = FigSignalErrorAt();
    v40 = v48;
LABEL_13:

    goto LABEL_9;
  }
  uint64_t v39 = 136;
  if (a18) {
    uint64_t v39 = 128;
  }
  [v37 setComputePipelineState:*(Class *)((char *)&self->_shaders->super.isa + v39)];
  v40 = v48;
  [v38 setTexture:v48 atIndex:0];
  [v38 setTexture:v52 atIndex:1];
  [v38 setTexture:v51 atIndex:2];
  [v38 setTexture:v49 atIndex:3];
  [v38 setTexture:v30 atIndex:4];
  [v38 setTexture:v31 atIndex:5];
  [v38 setTexture:v50 atIndex:6];
  [v38 setTexture:v32 atIndex:7];
  [v38 setBytes:&v58 length:4 atIndex:0];
  [v38 setBytes:&v57 length:1 atIndex:1];
  [v38 setBytes:&v56 length:4 atIndex:2];
  [v38 setBuffer:v33 offset:0 atIndex:3];
  [v38 setBuffer:v34 offset:0 atIndex:4];
  [v38 setBytes:&v55 length:4 atIndex:5];
  [v38 setBytes:&v54 length:4 atIndex:6];
  if (a19 < 1.0)
  {
    FigDebugAssert3();
    v47 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v45 = -73264;
    goto LABEL_13;
  }
  [v38 setBytes:&v53 length:4 atIndex:7];
  [v38 setImageblockWidth:32 height:32];
  unint64_t v41 = (((unint64_t)[v48 width] >> 1) + 15) >> 4;
  unint64_t v42 = [v48 height];
  v61[0] = v41;
  v61[1] = ((v42 >> 1) + 15) >> 4;
  v61[2] = 1;
  int64x2_t v59 = vdupq_n_s64(0x10uLL);
  uint64_t v60 = 1;
  [v38 dispatchThreadgroups:v61 threadsPerThreadgroup:&v59];
  [v38 endEncoding];

  if (*MEMORY[0x263F00E10])
  {
    v43 = [v36 commandQueue];
    v44 = [v43 commandBuffer];

    [v44 setLabel:@"KTRACE_MTLCMDBUF"];
    [v44 addCompletedHandler:&__block_literal_global_140];
    [v44 commit];
    [v36 addCompletedHandler:&__block_literal_global_142];
  }
  [v36 commit];
  int v45 = 0;
LABEL_9:

  return v45;
}

uint64_t __251__ToneMappingStage_mstmsApplyLumaGain_inputLuma_inputChroma_intermediateChroma_outputChroma_localGainMap_gammaCurve_personMask_chromaGainAdjPower_inputIsLinear_chromaBias_blackPoint_playbackCurve_saturationControl_frameGain_firstPass_hrGainDownRatio___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __251__ToneMappingStage_mstmsApplyLumaGain_inputLuma_inputChroma_intermediateChroma_outputChroma_localGainMap_gammaCurve_personMask_chromaGainAdjPower_inputIsLinear_chromaBias_blackPoint_playbackCurve_saturationControl_frameGain_firstPass_hrGainDownRatio___block_invoke_2(uint64_t a1, void *a2)
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

- (uint64_t)performLTM:(__n128)a3 bilateralGrid:(__n128)a4 bilateralGridHomography:(__n128)a5 detailEnhance:(float)a6 darkestFrameMetadata:(__n128)a7 scaleInput:(__n128)a8 colorCorrection:(__n128)a9 outputMode:(uint64_t)a10 chromaGainAdjPower:(void *)a11 inputIsLinear:(void *)a12 chromaBias:(void *)a13 gridScaleFactor:(int)a14 personMask:(uint64_t)a15 highlightCompression:(void *)a16 utmForegroundFactor:(uint64_t)a17 utmBackgroundFactor:(double)a18
{
  double v27 = a18;
  v28 = a19;
  v70[0] = a2;
  v70[1] = a3;
  v70[2] = a4;
  v69[0] = a7;
  v69[1] = a8;
  v69[2] = a9;
  v29 = a11;
  id v57 = a12;
  __n128 v68 = a5;
  id v30 = a13;
  float v67 = a6;
  char v66 = a15;
  id v56 = a16;
  id v54 = v28;
  BOOL v65 = a14 == 1;
  objc_msgSend((id)a1, "getLtmRoi:chromaTexHeight:ltmLut:gridScaleFactor:", objc_msgSend(v29[2], "width"), objc_msgSend(v29[2], "height"), objc_msgSend(v30, "ltmCurves"), v27);
  long long v64 = v31;
  objc_msgSend((id)a1, "getCcmRoi:chromaTexHeight:ccmLut:gridScaleFactor:", objc_msgSend(v29[2], "width"), objc_msgSend(v29[2], "height"), objc_msgSend(v30, "ltmCurves"), v27);
  long long v63 = v32;
  if (*((unsigned char *)v29[16] + 88)) {
    int v33 = [v30 allowSpatialCCM];
  }
  else {
    int v33 = 0;
  }
  int v62 = *(_DWORD *)([v30 ltmCurves] + 222264);
  [(id)a1 getExposureBiasFactor:v30 inputIsLinear:a15];
  int v61 = v34;
  v35 = [*(id *)(a1 + 8) commandQueue];
  v36 = [v35 commandBuffer];

  v37 = v57;
  if (!v36)
  {
    FigDebugAssert3();
    uint64_t v51 = FigSignalErrorAt();
    goto LABEL_31;
  }
  v38 = [v36 blitCommandEncoder];
  if (!v38)
  {
    FigDebugAssert3();
    uint64_t v51 = FigSignalErrorAt();
    goto LABEL_30;
  }
  objc_msgSend(v38, "fillBuffer:range:value:", *((void *)v29[16] + 7), 0, objc_msgSend(*((id *)v29[16] + 7), "length"), 0);
  [v38 endEncoding];
  uint64_t v39 = [v36 computeCommandEncoder];
  if (v39)
  {
    uint64_t v40 = 32;
    if (!v57) {
      uint64_t v40 = 24;
    }
    id v53 = *(id *)(*(void *)(a1 + 16) + v40);
    objc_msgSend(v39, "setComputePipelineState:");
    [v39 setTexture:v29[2] atIndex:1];
    [v39 setTexture:v29[3] atIndex:3];
    [v39 setTexture:*((void *)v29[16] + 1) atIndex:4];
    [v39 setTexture:*((void *)v29[16] + 2) atIndex:5];
    [v39 setTexture:*((void *)v29[16] + 3) atIndex:6];
    [v39 setTexture:v29[1] atIndex:8];
    if (v33) {
      uint64_t v41 = *((void *)v29[16] + 9);
    }
    else {
      uint64_t v41 = 0;
    }
    [v39 setTexture:v41 atIndex:12];
    [v39 setTexture:v54 atIndex:13];
    if (a14)
    {
      if (a14 != 1)
      {
LABEL_17:
        v44 = &OBJC_IVAR___ToneMappingCurves__ltcBinsBackgroundTex;
        if (v56)
        {
          int v45 = &OBJC_IVAR___ToneMappingCurves__ltcGTCRatioBackgroundTex;
        }
        else
        {
          v44 = &OBJC_IVAR___ToneMappingCurves__ltcBinsTex;
          int v45 = &OBJC_IVAR___ToneMappingCurves__ltcGTCRatioTex;
        }
        if (v56) {
          v46 = &OBJC_IVAR___ToneMappingCurves__ltcGTCFinalBackgroundTex;
        }
        else {
          v46 = &OBJC_IVAR___ToneMappingCurves__ltcGTCFinalTex;
        }
        [v39 setTexture:*(void *)((char *)v29[16] + *v44) atIndex:14];
        [v39 setTexture:*(void *)((char *)v29[16] + *v45) atIndex:15];
        [v39 setTexture:*(void *)((char *)v29[16] + *v46) atIndex:16];
        [v39 setTexture:v56 atIndex:17];
        [v39 setBytes:&v64 length:16 atIndex:1];
        [v39 setBuffer:*((void *)v29[16] + 7) offset:0 atIndex:2];
        [v39 setBytes:&v62 length:4 atIndex:3];
        v37 = v57;
        if (v57)
        {
          [v39 setTexture:*((void *)v57 + 1) atIndex:7];
          [v39 setBuffer:*((void *)v57 + 2) offset:0 atIndex:4];
          [v39 setBytes:&v68 length:16 atIndex:5];
          [v39 setBytes:v70 length:48 atIndex:6];
        }
        [v39 setBytes:&v61 length:4 atIndex:7];
        [v39 setBytes:&v67 length:4 atIndex:8];
        [v39 setBytes:&a17 length:4 atIndex:9];
        [v39 setBytes:&v66 length:1 atIndex:10];
        [v39 setBytes:v69 length:48 atIndex:11];
        [v39 setBytes:(char *)&a17 + 4 length:4 atIndex:12];
        [v39 setBytes:v29 + 17 length:4 atIndex:13];
        [v39 setBytes:&v63 length:16 atIndex:14];
        [v39 setBytes:&v65 length:1 atIndex:15];
        [v39 setBytes:&a20 length:4 atIndex:16];
        [v39 setBytes:(char *)&a20 + 4 length:4 atIndex:17];
        [v39 setBytes:(char *)v29[16] + 144 length:16 atIndex:18];
        [v39 setImageblockWidth:32 height:32];
        if ((unint64_t)[v53 maxTotalThreadsPerThreadgroup] <= 0xFF)
        {
          FigDebugAssert3();
          uint64_t v51 = FigSignalErrorAt();
        }
        else
        {
          uint64_t v47 = [v29[2] width];
          uint64_t v48 = [v29[2] height];
          v60[0] = v47;
          v60[1] = v48;
          v60[2] = 1;
          int64x2_t v58 = vdupq_n_s64(0x10uLL);
          uint64_t v59 = 1;
          [v39 dispatchThreads:v60 threadsPerThreadgroup:&v58];
          [v39 endEncoding];
          if (*MEMORY[0x263F00E10])
          {
            id v49 = [v36 commandQueue];
            id v50 = [v49 commandBuffer];

            [v50 setLabel:@"KTRACE_MTLCMDBUF"];
            [v50 addCompletedHandler:&__block_literal_global_146];
            [v50 commit];
            [v36 addCompletedHandler:&__block_literal_global_148];
          }
          [v36 commit];

          uint64_t v51 = 0;
        }
        goto LABEL_29;
      }
      uint64_t v42 = 11;
      uint64_t v43 = 10;
    }
    else
    {
      uint64_t v42 = 2;
      uint64_t v43 = 9;
    }
    [v39 setTexture:v29[4] atIndex:v43];
    [v39 setTexture:v29[5] atIndex:v42];
    goto LABEL_17;
  }
  FigDebugAssert3();
  uint64_t v51 = FigSignalErrorAt();
LABEL_29:

LABEL_30:
LABEL_31:

  return v51;
}

uint64_t __274__ToneMappingStage_performLTM_bilateralGrid_bilateralGridHomography_detailEnhance_darkestFrameMetadata_scaleInput_colorCorrection_outputMode_chromaGainAdjPower_inputIsLinear_chromaBias_gridScaleFactor_personMask_highlightCompression_utmForegroundFactor_utmBackgroundFactor___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __274__ToneMappingStage_performLTM_bilateralGrid_bilateralGridHomography_detailEnhance_darkestFrameMetadata_scaleInput_colorCorrection_outputMode_chromaGainAdjPower_inputIsLinear_chromaBias_gridScaleFactor_personMask_highlightCompression_utmForegroundFactor_utmBackgroundFactor___block_invoke_2(uint64_t a1, void *a2)
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

- (int)fetchTuningParametersFromPlist:(id)a3 plist:(id)a4 ev0FrameMetadata:(id)a5 toneMap:(id)a6 isLowLight:(BOOL)a7 destinationMTLBuffer:(id)a8
{
  BOOL v9 = a7;
  uint64_t v12 = (id *)a3;
  int v13 = (id *)a4;
  id v14 = a5;
  id v15 = a8;
  BOOL v16 = v13 != 0;
  uint64_t v17 = [v12[1] count];
  if ([v15 length] < (unint64_t)(176 * v17))
  {
    FigDebugAssert3();
    LODWORD(v17) = -12780;
  }
  else
  {
    uint64_t v18 = [v15 contents];
    float v19 = 1.0;
    if (v9)
    {
      [v14 finalCropRectZoomRatio];
      float v21 = fminf(fmaxf((float)(v20 + -2.5) * 0.5, 0.0), 1.0);
      float v19 = 1.0 - (float)((float)(v21 * v21) * (float)((float)(v21 * -2.0) + 3.0));
    }
    uint64_t v22 = (float *)[v14 exposureParams];
    v23 = &OBJC_IVAR___ToneMapSmoothingPlist_maskedLambda;
    float v24 = *v22;
    if (v13)
    {
      v23 = &OBJC_IVAR___MSTMv3Plist_maskedLambda;
      v25 = v13;
    }
    else
    {
      v25 = v12;
    }
    if (v13) {
      v26 = &OBJC_IVAR___MSTMv3Plist_maskedAlpha;
    }
    else {
      v26 = &OBJC_IVAR___ToneMapSmoothingPlist_maskedAlpha;
    }
    float v27 = interpolate_with_gain(*(id *)((char *)v25 + *v23), v24);
    int v62 = *(_DWORD *)((char *)v25 + *v26);
    float v28 = interpolate_with_gain(v12[7], v24);
    int v61 = *((_DWORD *)v12 + 6);
    float v29 = interpolate_with_gain(v12[8], v24);
    int v60 = *((_DWORD *)v12 + 7);
    float v59 = interpolate_with_gain(v12[9], v24);
    float v58 = interpolate_with_gain(v12[4], v24);
    float v57 = interpolate_with_gain(v12[5], v24);
    if (v17)
    {
      id v53 = v15;
      id v54 = v14;
      unint64_t v30 = 0;
      float v55 = v19 * v28;
      float v56 = v19 * v27;
      long long v31 = (float *)(v18 + 172);
      float v32 = v19 * v29;
      do
      {
        uint64_t v33 = [v12[1] objectAtIndexedSubscript:v30];
        if (v13)
        {
          int v34 = [v13[1] objectAtIndexedSubscript:v30];
          id v35 = v34[1];
        }
        else
        {
          id v35 = 0;
        }
        unint64_t v36 = v30 + 1;
        float v37 = powf(0.75, (float)(v30 + 1));
        if (v13)
        {
          int v38 = *((_DWORD *)v13 + 5);
          int v39 = *((_DWORD *)v13 + 6);
          float v40 = powf(0.75, (float)v30);
          uint64_t v41 = v35;
        }
        else
        {
          float v40 = powf(0.75, (float)v30);
          uint64_t v41 = *(void **)(v33 + 8);
          int v39 = 0;
          int v38 = 0;
        }
        float v42 = interpolate_with_gain(v41, v24);
        float v43 = interpolate_with_gain(*(void **)(v33 + 16), v24);
        float v44 = interpolate_with_gain(*(void **)(v33 + 24), v24);
        if (v13)
        {
          int v45 = *((_DWORD *)v13 + 5);
          int v46 = *((_DWORD *)v13 + 6);
        }
        else
        {
          int v45 = 0;
          int v46 = 0;
        }
        *(void *)(v31 - 43) = 0;
        __asm { FMOV            V5.2S, #1.0 }
        *(void *)(v31 - 41) = _D5;
        *(v31 - 39) = v59;
        *(v31 - 38) = v56 * v37;
        *((_DWORD *)v31 - 37) = v62;
        *(v31 - 36) = 1.0;
        *(v31 - 35) = v55 * v37;
        *((_DWORD *)v31 - 34) = v61;
        *(v31 - 33) = 1.0;
        *(v31 - 32) = v32 * v37;
        *((_DWORD *)v31 - 31) = v60;
        *(v31 - 30) = 1.0;
        *(void *)(v31 - 29) = 0;
        *(v31 - 27) = v58;
        *(v31 - 26) = v57;
        *((unsigned char *)v31 - 100) = v16;
        *(_WORD *)((char *)v31 - 99) = 0;
        *((unsigned char *)v31 - 97) = 0;
        *((_DWORD *)v31 - 24) = v38;
        *((_DWORD *)v31 - 23) = v39;
        *(v31 - 22) = 0.0;
        *(void *)(v31 - 21) = 0;
        *(void *)(v31 - 19) = _D5;
        *(v31 - 17) = v59;
        *(v31 - 16) = v56 * v40;
        *((_DWORD *)v31 - 15) = v62;
        *(v31 - 14) = v42;
        *(v31 - 13) = v55 * v40;
        *((_DWORD *)v31 - 12) = v61;
        *(v31 - 11) = v43;
        *(v31 - 10) = v32 * v40;
        *((_DWORD *)v31 - 9) = v60;
        *(v31 - 8) = v44;
        *(void *)(v31 - 7) = 0;
        *(v31 - 5) = v58;
        *(v31 - 4) = v57;
        *((unsigned char *)v31 - 12) = v16;
        *(_WORD *)((char *)v31 - 11) = 0;
        *((unsigned char *)v31 - 9) = 0;
        *((_DWORD *)v31 - 2) = v45;
        *((_DWORD *)v31 - 1) = v46;
        *long long v31 = 0.0;
        v31 += 44;

        ++v30;
      }
      while (v17 != v36);
      LODWORD(v17) = 0;
      id v15 = v53;
      id v14 = v54;
    }
  }

  return v17;
}

- (int)fetchTuningParametersMSTMv2FromPlist:(id)a3 ev0FrameMetadata:(id)a4 toneMap:(id)a5 destinationMTLBuffer:(id)a6
{
  int v7 = a3;
  id v8 = a6;
  if ((unint64_t)[v8 length] <= 0x41F)
  {
    FigDebugAssert3();
    int v29 = -12780;
  }
  else
  {
    uint64_t v9 = [v8 contents];
    uint64_t v10 = 0;
    int v11 = v7[5];
    int v12 = v7[2];
    int v13 = v7[6];
    int v14 = v7[3];
    int v15 = v7[7];
    int v16 = v7[4];
    int v17 = v7[11];
    int v18 = v7[13];
    int v19 = v7[14];
    __asm { FMOV            V18.2S, #1.0 }
    do
    {
      int v25 = v7[8];
      int v26 = v7[9];
      int v27 = v7[10];
      uint64_t v28 = v9 + v10;
      *(void *)uint64_t v28 = 0;
      *(void *)(v28 + 8) = _D18;
      *(_DWORD *)(v28 + 16) = v17;
      *(_DWORD *)(v28 + 20) = v11;
      *(_DWORD *)(v28 + 24) = v12;
      *(_DWORD *)(v28 + 28) = 1065353216;
      *(_DWORD *)(v28 + 32) = v13;
      *(_DWORD *)(v28 + 36) = v14;
      *(_DWORD *)(v28 + 40) = 1065353216;
      *(_DWORD *)(v28 + 44) = v15;
      *(_DWORD *)(v28 + 48) = v16;
      *(_DWORD *)(v28 + 52) = 1065353216;
      *(void *)(v28 + 56) = 0;
      *(_DWORD *)(v28 + 64) = v18;
      *(_DWORD *)(v28 + 68) = v19;
      *(void *)(v28 + 72) = 0;
      *(void *)(v28 + 80) = 0;
      *(void *)(v28 + 88) = 0;
      *(void *)(v28 + 96) = _D18;
      *(_DWORD *)(v28 + 104) = v17;
      *(_DWORD *)(v28 + 108) = v11;
      *(_DWORD *)(v28 + 112) = v12;
      *(_DWORD *)(v28 + 116) = v25;
      *(_DWORD *)(v28 + 120) = v13;
      *(_DWORD *)(v28 + 124) = v14;
      *(_DWORD *)(v28 + 128) = v26;
      *(_DWORD *)(v28 + 132) = v15;
      *(_DWORD *)(v28 + 136) = v16;
      *(_DWORD *)(v28 + 140) = v27;
      *(void *)(v28 + 144) = 0;
      *(_DWORD *)(v28 + 152) = v18;
      *(_DWORD *)(v28 + 156) = v19;
      v10 += 176;
      *(void *)(v28 + 160) = 0;
      *(void *)(v28 + 168) = 0;
    }
    while (v10 != 1056);
    int v29 = 0;
  }

  return v29;
}

- (int)performSmallFaceFix:(id)a3 faceLandmarks:(id)a4 faceLandmarkOrientation:(int)a5 tmPlist:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  int v11 = (id *)a6;
  int v12 = v11;
  if (!v9 || !v10 || !v11)
  {
    FigDebugAssert3();
    int v13 = 0;
LABEL_49:
    v85 = 0;
    v83 = 0;
    int v93 = -12780;
    goto LABEL_46;
  }
  int v13 = (float *)v11[5];
  if (!v13)
  {
    FigDebugAssert3();
    goto LABEL_49;
  }
  unint64_t v14 = [v9 width];
  unint64_t v15 = [v9 height];
  memset(&v133, 0, sizeof(v133));
  getAffineTransformFromExifOrientation(a5, (uint64_t)&v133);
  memset(&v132, 0, sizeof(v132));
  CGAffineTransformMakeTranslation(&t1, -0.5, -0.5);
  CGAffineTransformMakeScale(&t2, 1.0, -1.0);
  CGAffineTransformConcat(&v131, &t1, &t2);
  CGAffineTransformMakeTranslation(&v128, 0.5, 0.5);
  CGAffineTransformConcat(&v132, &v131, &v128);
  CGAffineTransform v126 = v133;
  memset(&v127, 0, sizeof(v127));
  CGAffineTransform v125 = v132;
  CGAffineTransformConcat(&v127, &v126, &v125);
  float v16 = v13[6];
  float v17 = v13[5];
  uint64_t v18 = [v10 count];
  id v19 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources sffDescriptorsBuffer];
  uint64_t v104 = [v19 contents];

  id v20 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources sffNThreadGroupsBuffer];
  uint64_t v103 = [v20 contents];

  if (!v18)
  {
    v85 = 0;
    v83 = 0;
    int v93 = 0;
    goto LABEL_46;
  }
  v98 = v12;
  id v100 = v9;
  int v99 = 0;
  unint64_t v21 = 0;
  uint64_t v22 = 0;
  v23.f32[0] = (float)v14;
  v23.f32[1] = (float)v15;
  float32x2_t v107 = v23;
  float v101 = (float)(v16 / v17) * (float)(v16 / v17);
  int32x2_t v102 = vdup_n_s32(0x7F7FFFFFu);
  do
  {
    if (v21 >= 0x20)
    {
      uint64_t v96 = v97;
      LODWORD(v95) = 0;
      FigDebugAssert3();
      id v30 = 0;
      uint64_t v28 = 0;
      goto LABEL_23;
    }
    float v24 = [v10 objectAtIndexedSubscript:v22];
    v125.a = 0.0;
    *(void *)&v125.b = &v125;
    *(void *)&v125.c = 0x2050000000;
    int v25 = (void *)getVNObservationClass_softClass;
    *(void *)&v125.d = getVNObservationClass_softClass;
    if (!getVNObservationClass_softClass)
    {
      *(void *)&v126.a = MEMORY[0x263EF8330];
      *(void *)&v126.b = 3221225472;
      *(void *)&v126.c = __getVNObservationClass_block_invoke;
      *(void *)&v126.d = &unk_2655C7BC0;
      *(void *)&v126.tCGFloat x = &v125;
      __getVNObservationClass_block_invoke((uint64_t)&v126);
      int v25 = *(void **)(*(void *)&v125.b + 24);
    }
    id v26 = v25;
    _Block_object_dispose(&v125, 8);
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v96 = v97;
      LODWORD(v95) = 0;
      FigDebugAssert3();
      id v30 = 0;
      uint64_t v28 = 0;
      int v99 = -12780;
      goto LABEL_23;
    }
    uint64_t v28 = [v10 objectAtIndexedSubscript:v22];
    int v29 = [v28 landmarks];
    id v30 = [v29 faceContour];

    if (v30)
    {
      unint64_t v31 = [v30 pointCount];
      if (v31 <= 2)
      {
        uint64_t v96 = v97;
        LODWORD(v95) = 0;
      }
      else
      {
        unint64_t v32 = v31;
        [v28 boundingBox];
        CGAffineTransform v126 = v127;
        CGRect v135 = CGRectApplyAffineTransform(v134, &v126);
        CGFloat x = v135.origin.x;
        CGFloat y = v135.origin.y;
        if (fmax(v135.size.width, v135.size.height) > v13[2]) {
          goto LABEL_23;
        }
        CGFloat width = v135.size.width;
        CGFloat height = v135.size.height;
        id v36 = v30;
        float v37 = (double *)[v36 normalizedPoints];
        float64x2_t v38 = vaddq_f64(*(float64x2_t *)&v127.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v127.c, v37[1]), *(float64x2_t *)&v127.a, *v37));
        float64_t v39 = vector2FromCGPoint(v38, v38.f64[1]);
        id v40 = v36;
        uint64_t v41 = [v40 normalizedPoints];
        float64x2_t v42 = vaddq_f64(*(float64x2_t *)&v127.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v127.c, *(double *)(v41 + 16 * v32 - 8)), *(float64x2_t *)&v127.a, *(double *)(v41 + 16 * v32 - 16)));
        float32x2_t v43 = vmul_f32(vadd_f32(*(float32x2_t *)&v39, COERCE_FLOAT32X2_T(vector2FromCGPoint(v42, v42.f64[1]))), (float32x2_t)0x3F0000003F000000);
        v44.f64[0] = width;
        float64_t v45 = vector2FromCGPoint(v44, height);
        v46.f64[0] = x;
        uint64_t v47 = 0;
        float32x2_t v106 = vmul_f32(v107, vmla_f32(COERCE_FLOAT32X2_T(vector2FromCGPoint(v46, y)), *(float32x2_t *)&v45, v43));
        float32x2_t v48 = vneg_f32(v106);
        float32x4_t v118 = 0u;
        float32x2_t v49 = (float32x2_t)0x80000000800000;
        float32x2_t v50 = (float32x2_t)v102;
        float32x4_t v51 = 0uLL;
        v54.columns[1] = 0uLL;
        float32x4_t v52 = 0uLL;
        v54.columns[0].i32[3] = v115;
        v53.i32[3] = v117;
        v54.columns[2].i32[3] = v113;
        do
        {
          float32x4_t v112 = v52;
          float32x4_t v114 = (float32x4_t)v54.columns[1];
          float32x4_t v116 = v51;
          __int32 v110 = v54.columns[0].i32[3];
          __int32 v111 = v54.columns[2].i32[3];
          __int32 v109 = v53.i32[3];
          id v30 = v40;
          uint64_t v55 = [v30 normalizedPoints];
          float64x2_t v56 = vaddq_f64(*(float64x2_t *)&v127.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v127.c, *(double *)(v55 + v47 + 8)), *(float64x2_t *)&v127.a, *(double *)(v55 + v47)));
          float64_t v57 = vector2FromCGPoint(v56, v56.f64[1]);
          v58.f64[0] = width;
          float64_t v59 = vector2FromCGPoint(v58, height);
          v60.f64[0] = x;
          float32x2_t v61 = vmla_f32(v48, vmla_f32(COERCE_FLOAT32X2_T(vector2FromCGPoint(v60, y)), *(float32x2_t *)&v59, *(float32x2_t *)&v57), v107);
          *(float32x2_t *)v62.f32 = vmul_f32(v61, v61);
          *(float32x2_t *)&v62.u32[2] = vmul_lane_f32(v61, v61, 1);
          float32x4_t v53 = vmulq_n_f32(v62, v62.f32[0]);
          v54.columns[0] = (simd_float3)vmulq_lane_f32(v62, *(float32x2_t *)v62.f32, 1);
          v54.columns[2] = (simd_float3)vmulq_n_f32(v62, v62.f32[2]);
          v53.i32[3] = v109;
          v54.columns[0].i32[3] = v110;
          v54.columns[2].i32[3] = v111;
          float32x4_t v51 = vaddq_f32(v116, v53);
          v54.columns[1] = (simd_float3)vaddq_f32(v114, (float32x4_t)v54.columns[0]);
          float32x4_t v52 = vaddq_f32(v112, (float32x4_t)v54.columns[2]);
          float32x4_t v118 = vaddq_f32(v118, v62);
          float32x2_t v50 = vminnm_f32(v50, v61);
          float32x2_t v49 = vmaxnm_f32(v49, v61);
          v47 += 16;
          --v32;
        }
        while (v32);
        __int32 v113 = v111;
        __int32 v115 = v110;
        __int32 v117 = v109;
        v54.columns[0] = (simd_float3)v51;
        v54.columns[2] = (simd_float3)v52;
        simd_float3x3 v63 = __invert_f3(v54);
        v63.columns[0] = (simd_float3)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v63.columns[0], v118.f32[0]), (float32x4_t)v63.columns[1], *(float32x2_t *)v118.f32, 1), (float32x4_t)v63.columns[2], v118, 2);
        if (v63.columns[0].f32[0] <= 0.0)
        {
          uint64_t v96 = v97;
          LODWORD(v95) = 0;
          FigDebugAssert3();
          goto LABEL_23;
        }
        if (v63.columns[0].f32[1] <= 0.0)
        {
          uint64_t v96 = v97;
          LODWORD(v95) = 0;
        }
        else
        {
          v63.columns[2].f32[0] = vmuls_lane_f32(-v63.columns[0].f32[2], (float32x4_t)v63.columns[0], 2)
                                + (float)((float)(v63.columns[0].f32[0] * 4.0) * v63.columns[0].f32[1]);
          __asm { FMOV            V4.2S, #4.0 }
          float32x2_t v69 = vmul_n_f32(vmul_n_f32(vmul_f32((float32x2_t)vrev64_s32(*(int32x2_t *)v63.columns[0].f32), _D4), v101), v63.columns[2].f32[0] * 4.0);
          if (v69.f32[0] <= 0.0)
          {
            uint64_t v96 = v97;
            LODWORD(v95) = 0;
          }
          else if (v69.f32[1] <= 0.0)
          {
            uint64_t v96 = v97;
            LODWORD(v95) = 0;
          }
          else
          {
            float32x2_t v70 = vrsqrte_f32(v69);
            float32x2_t v71 = vmul_f32(v70, vrsqrts_f32(v69, vmul_f32(v70, v70)));
            float32x2_t v72 = vmul_f32(v71, vrsqrts_f32(v69, vmul_f32(v71, v71)));
            float32x2_t v73 = vrecpe_f32(v72);
            float32x2_t v74 = vmul_f32(v73, vrecps_f32(v72, v73));
            v63.columns[2].f32[0] = v63.columns[2].f32[0] + v63.columns[2].f32[0];
            float32x2_t v75 = vdiv_f32(vmul_f32(v74, vrecps_f32(v72, v74)), (float32x2_t)vdup_lane_s32(*(int32x2_t *)v63.columns[2].f32, 0));
            float32x2_t v76 = vrndm_f32(vsub_f32(v106, v75));
            float32x2_t v77 = vsub_f32(v49, v50);
            *(float32x2_t *)v63.columns[2].f32 = vsub_f32(vrndp_f32(vadd_f32(v106, v75)), v76);
            float v78 = v13[3];
            if (v63.columns[2].f32[0] > (float)(v78 * v77.f32[0]))
            {
              uint64_t v96 = v97;
              LODWORD(v95) = 0;
            }
            else
            {
              if (v63.columns[2].f32[1] <= vmuls_lane_f32(v78, v77, 1))
              {
                v79 = (float32x2_t *)(v104 + 48 * v21);
                v79[5].i32[0] = v63.columns[0].i32[2];
                v79[3] = v106;
                v79[4] = *(float32x2_t *)v63.columns[0].f32;
                v79->f32[1] = v13[5];
                v79->f32[0] = v13[6];
                v79[1] = v76;
                v79[2] = *(float32x2_t *)v63.columns[2].f32;
                v79[5].i32[1] = vcvtd_n_u64_f64(v13[4] * 255.0 * 32.0, 5uLL);
                v80 = (uint32x2_t *)(v103 + 12 * v21);
                uint32x2_t *v80 = vshr_n_u32((uint32x2_t)vadd_s32((int32x2_t)vcvt_u32_f32(*(float32x2_t *)v63.columns[2].f32), (int32x2_t)0x1F0000001FLL), 5uLL);
                v80[1].i32[0] = 1;
                ++v21;
                goto LABEL_23;
              }
              uint64_t v96 = v97;
              LODWORD(v95) = 0;
            }
          }
        }
      }
    }
    else
    {
      uint64_t v96 = v97;
      LODWORD(v95) = 0;
    }
    FigDebugAssert3();
LABEL_23:

    ++v22;
  }
  while (v22 != v18);
  if (!v21)
  {
    v85 = 0;
    v83 = 0;
    id v9 = v100;
    int v12 = v98;
    goto LABEL_44;
  }
  v81 = self;
  v82 = [(FigMetalContext *)self->_metal commandQueue];
  v83 = [v82 commandBuffer];

  if (!v83)
  {
    FigDebugAssert3();
    v85 = 0;
LABEL_52:
    int v93 = -12786;
    id v9 = v100;
    int v12 = v98;
    goto LABEL_46;
  }
  [v83 setLabel:@"SFF"];
  v84 = [v83 computeCommandEncoder];
  v85 = v84;
  if (!v84)
  {
    FigDebugAssert3();
    goto LABEL_52;
  }
  [v84 setLabel:@"SFF"];
  [v85 setComputePipelineState:self->_shaders->_sffTestFace];
  v86 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources sffDescriptorsBuffer];
  [v85 setBuffer:v86 offset:0 atIndex:0];

  v87 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources sffNThreadGroupsBuffer];
  [v85 setBuffer:v87 offset:0 atIndex:1];

  [v85 setTexture:v100 atIndex:0];
  uint64_t v122 = 1;
  unint64_t v123 = v21;
  int64x2_t v124 = vdupq_n_s64(1uLL);
  int64x2_t v121 = vdupq_n_s64(0x20uLL);
  [v85 dispatchThreadgroups:&v123 threadsPerThreadgroup:&v121];
  [v85 setComputePipelineState:self->_shaders->_sffFillFace];
  uint64_t v88 = 0;
  uint64_t v89 = 0;
  do
  {
    objc_msgSend(v85, "setBufferOffset:atIndex:", v88, 0, v95, v96);
    v90 = [(ToneMapSmoothingResources *)v81->_toneMapSmoothingResources sffNThreadGroupsBuffer];
    int64x2_t v119 = vdupq_n_s64(0x20uLL);
    uint64_t v120 = 1;
    [v85 dispatchThreadgroupsWithIndirectBuffer:v90 indirectBufferOffset:v89 threadsPerThreadgroup:&v119];

    v81 = self;
    v89 += 12;
    v88 += 48;
    --v21;
  }
  while (v21);
  [v85 endEncoding];
  int v12 = v98;
  if (*MEMORY[0x263F00E10])
  {
    v91 = [v83 commandQueue];
    v92 = [v91 commandBuffer];

    [v92 setLabel:@"KTRACE_MTLCMDBUF"];
    [v92 addCompletedHandler:&__block_literal_global_185];
    [v92 commit];
    [v83 addCompletedHandler:&__block_literal_global_187];
  }
  [v83 commit];
  id v9 = v100;
LABEL_44:
  int v93 = v99;
LABEL_46:

  return v93;
}

uint64_t __86__ToneMappingStage_performSmallFaceFix_faceLandmarks_faceLandmarkOrientation_tmPlist___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __86__ToneMappingStage_performSmallFaceFix_faceLandmarks_faceLandmarkOrientation_tmPlist___block_invoke_2(uint64_t a1, void *a2)
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

- (int)performToneMapSmoothing:(id)a3 luma:(id)a4 mask:(id)a5 auxMask:(id)a6 skyMask:(id)a7 tmPlist:(id)a8 ev0FrameMetadata:(id)a9 useMaskPyramid:(BOOL)a10 firstPass:(BOOL)a11
{
  id v17 = a3;
  id v102 = a4;
  id v106 = a5;
  id v105 = a6;
  id v104 = a7;
  uint64_t v18 = a8;
  id v19 = a9;
  if ([(ToneMapSmoothingResources *)self->_toneMapSmoothingResources allocateResourcesForWidth:[(ToneMapSmoothingResources *)self->_toneMapSmoothingResources width] height:[(ToneMapSmoothingResources *)self->_toneMapSmoothingResources height] useMaskPyramid:a10])
  {
    FigDebugAssert3();
    int v97 = FigSignalErrorAt();
LABEL_62:
    v94 = v102;
    goto LABEL_56;
  }
  if (!v17 || !v18 || !v19 || [v17 pixelFormat] != 25)
  {
    FigDebugAssert3();
    int v97 = -12780;
    goto LABEL_62;
  }
  uint64_t v20 = v18[6];
  int v108 = *(_DWORD *)(v20 + 16);
  int v21 = [*(id *)(v20 + 8) count];
  uint64_t v22 = [(FigMetalContext *)self->_metal commandQueue];
  float32x2_t v23 = [v22 commandBuffer];

  if (!v23)
  {
    FigDebugAssert3();
LABEL_61:
    int v97 = -12786;
    goto LABEL_62;
  }
  [v23 setLabel:@"MSTM"];
  float v24 = [v23 computeCommandEncoder];
  if (!v24)
  {
    FigDebugAssert3();

    goto LABEL_61;
  }
  int v25 = v24;
  float32x2_t v107 = v23;
  id v100 = v19;
  float v101 = v18;
  [v24 setLabel:@"MSTM Downsample"];
  if (a10)
  {
    [v25 setComputePipelineState:self->_shaders->_mstmCombineAndDownsampleMask];
    [v25 setImageblockWidth:32 height:32];
    toneMapSmoothingResources = self->_toneMapSmoothingResources;
    if (a11) {
      [(ToneMapSmoothingResources *)toneMapSmoothingResources mstmv2TuningParams];
    }
    else {
    int v27 = [(ToneMapSmoothingResources *)toneMapSmoothingResources mstmTuningParams];
    }
    [v25 setBuffer:v27 offset:0 atIndex:0];

    [v25 setTexture:v106 atIndex:9];
    [v25 setTexture:v105 atIndex:10];
    [v25 setTexture:v104 atIndex:11];
    uint64_t v28 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources masksPyramid];
    int v29 = [v28 objectAtIndexedSubscript:0];
    [v25 setTexture:v29 atIndex:13];

    id v30 = self->_toneMapSmoothingResources;
    if (v30) {
      [(ToneMapSmoothingResources *)v30 computeSizeForLevel:0 xDivisor:1 yDivisor:1];
    }
    else {
      memset(v137, 0, 24);
    }
    int64x2_t v135 = vdupq_n_s64(0x20uLL);
    uint64_t v136 = 1;
    [v25 dispatchThreads:v137 threadsPerThreadgroup:&v135];
    [v25 setComputePipelineState:self->_shaders->_mstmDownsampleMask];
    [v25 setImageblockWidth:32 height:32];
    if (v21 >= 2)
    {
      int64x2_t v109 = vdupq_n_s64(0x20uLL);
      for (uint64_t i = 1; i != v21; ++i)
      {
        unint64_t v32 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources masksPyramid];
        uint64_t v33 = [v32 objectAtIndexedSubscript:i - 1];
        [v25 setTexture:v33 atIndex:12];

        int v34 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources masksPyramid];
        id v35 = [v34 objectAtIndexedSubscript:i];
        [v25 setTexture:v35 atIndex:13];

        id v36 = self->_toneMapSmoothingResources;
        if (v36) {
          [(ToneMapSmoothingResources *)v36 computeSizeForLevel:i xDivisor:1 yDivisor:1];
        }
        else {
          memset(v134, 0, sizeof(v134));
        }
        int64x2_t v132 = v109;
        uint64_t v133 = 1;
        [v25 dispatchThreads:v134 threadsPerThreadgroup:&v132];
      }
    }
  }
  [v25 setComputePipelineState:self->_shaders->_mstmDownsampleInitial];
  [v25 setImageblockWidth:32 height:32];
  [v25 setTexture:v17 atIndex:4];
  float v37 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources referencePyramidOdd];
  float64x2_t v38 = [v37 objectAtIndexedSubscript:0];
  [v25 setTexture:v38 atIndex:0];

  float64_t v39 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources referencePyramidEven];
  id v40 = [v39 objectAtIndexedSubscript:0];
  [v25 setTexture:v40 atIndex:1];

  uint64_t v41 = self->_toneMapSmoothingResources;
  id v103 = v17;
  if (v41) {
    [(ToneMapSmoothingResources *)v41 computeSizeForOddEvenLevel:0 xDivisor:1 yDivisor:2];
  }
  else {
    memset(v131, 0, sizeof(v131));
  }
  long long v129 = xmmword_263380250;
  uint64_t v130 = 1;
  [v25 dispatchThreads:v131 threadsPerThreadgroup:&v129];
  [v25 setComputePipelineState:self->_shaders->_mstmDownsampleSubsequent];
  [v25 setImageblockWidth:32 height:32];
  if (v21 >= 2)
  {
    for (uint64_t j = 1; j != v21; ++j)
    {
      float32x2_t v43 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources referencePyramidOdd];
      float64x2_t v44 = [v43 objectAtIndexedSubscript:j - 1];
      [v25 setTexture:v44 atIndex:5];

      float64_t v45 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources referencePyramidEven];
      float64x2_t v46 = [v45 objectAtIndexedSubscript:j - 1];
      [v25 setTexture:v46 atIndex:6];

      uint64_t v47 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources referencePyramidOdd];
      float32x2_t v48 = [v47 objectAtIndexedSubscript:j];
      [v25 setTexture:v48 atIndex:0];

      float32x2_t v49 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources referencePyramidEven];
      float32x2_t v50 = [v49 objectAtIndexedSubscript:j];
      [v25 setTexture:v50 atIndex:1];

      float32x4_t v51 = self->_toneMapSmoothingResources;
      if (v51) {
        [(ToneMapSmoothingResources *)v51 computeSizeForOddEvenLevel:j xDivisor:1 yDivisor:2];
      }
      else {
        memset(v128, 0, sizeof(v128));
      }
      long long v126 = xmmword_263380250;
      uint64_t v127 = 1;
      [v25 dispatchThreads:v128 threadsPerThreadgroup:&v126];
    }
  }
  [v25 endEncoding];
  long long v124 = 0uLL;
  uint64_t v125 = 0;
  float32x4_t v52 = self->_toneMapSmoothingResources;
  uint64_t v53 = v21 - 1;
  if (v52) {
    [(ToneMapSmoothingResources *)v52 computeSizeForOddEvenLevel:v53 xDivisor:1 yDivisor:1];
  }
  simd_float3x3 v54 = [v107 blitCommandEncoder];
  if (v54)
  {
    int v110 = v21;
    uint64_t v55 = v54;
    [v54 setLabel:@"MSTM Blit"];
    float64x2_t v56 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources referencePyramidOdd];
    float64_t v57 = [v56 objectAtIndexedSubscript:v53];
    memset(v123, 0, sizeof(v123));
    float64x2_t v58 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources outputPyramidOdd];
    float64_t v59 = [v58 objectAtIndexedSubscript:v53];
    long long v120 = v124;
    uint64_t v121 = v125;
    memset(v122, 0, sizeof(v122));
    [v55 copyFromTexture:v57 sourceSlice:0 sourceLevel:0 sourceOrigin:v123 sourceSize:&v120 toTexture:v59 destinationSlice:0 destinationLevel:0 destinationOrigin:v122];

    float64x2_t v60 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources referencePyramidEven];
    float32x2_t v61 = [v60 objectAtIndexedSubscript:v53];
    memset(v119, 0, sizeof(v119));
    float32x4_t v62 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources outputPyramidEven];
    simd_float3x3 v63 = [v62 objectAtIndexedSubscript:v53];
    memset(v118, 0, sizeof(v118));
    long long v64 = v107;
    long long v120 = v124;
    uint64_t v121 = v125;
    [v55 copyFromTexture:v61 sourceSlice:0 sourceLevel:0 sourceOrigin:v119 sourceSize:&v120 toTexture:v63 destinationSlice:0 destinationLevel:0 destinationOrigin:v118];

    int v99 = v55;
    [v55 endEncoding];
    BOOL v65 = [v107 computeCommandEncoder];

    if (v65)
    {
      [v65 setLabel:@"MSTM Solver"];
      [v65 setTexture:v106 atIndex:9];
      [v65 setTexture:v105 atIndex:10];
      [v65 setTexture:v104 atIndex:11];
      char v66 = self->_toneMapSmoothingResources;
      if (a11) {
        [(ToneMapSmoothingResources *)v66 mstmv2TuningParams];
      }
      else {
      float v67 = [(ToneMapSmoothingResources *)v66 mstmTuningParams];
      }
      id v17 = v103;
      [v65 setBuffer:v67 offset:0 atIndex:0];

      if (v110 >= 1)
      {
        uint64_t v68 = v53;
        int64x2_t v111 = vdupq_n_s64(0x10uLL);
        if (!a10) {
          goto LABEL_40;
        }
LABEL_39:
        float32x2_t v69 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources masksPyramid];
        float32x2_t v70 = [v69 objectAtIndexedSubscript:v68];
        [v65 setTexture:v70 atIndex:12];

        while (1)
        {
LABEL_40:
          [v65 setImageblockWidth:32 height:32];
          float32x2_t v71 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources referencePyramidOdd];
          float32x2_t v72 = [v71 objectAtIndexedSubscript:v68];
          [v65 setTexture:v72 atIndex:0];

          float32x2_t v73 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources referencePyramidEven];
          float32x2_t v74 = [v73 objectAtIndexedSubscript:v68];
          [v65 setTexture:v74 atIndex:1];

          float32x2_t v75 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources outputPyramidOdd];
          float32x2_t v76 = [v75 objectAtIndexedSubscript:v68];
          [v65 setTexture:v76 atIndex:2];

          float32x2_t v77 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources outputPyramidEven];
          float v78 = [v77 objectAtIndexedSubscript:v68];
          [v65 setTexture:v78 atIndex:3];

          [v65 setBufferOffset:176 * v68 atIndex:0];
          long long v120 = 0uLL;
          uint64_t v121 = 0;
          v79 = self->_toneMapSmoothingResources;
          if (v79) {
            [(ToneMapSmoothingResources *)v79 computeSizeForOddEvenLevel:v68 xDivisor:2 yDivisor:2];
          }
          int v80 = (2 << v68) * v108;
          if (v80 >= 1)
          {
            do
            {
              [v65 setComputePipelineState:self->_shaders->_mstmDiffusionEven];
              long long v116 = v120;
              uint64_t v117 = v121;
              long long v114 = (__int128)v111;
              uint64_t v115 = 1;
              [v65 dispatchThreads:&v116 threadsPerThreadgroup:&v114];
              [v65 setComputePipelineState:self->_shaders->_mstmDiffusionOdd];
              long long v116 = v120;
              uint64_t v117 = v121;
              long long v114 = (__int128)v111;
              uint64_t v115 = 1;
              [v65 dispatchThreads:&v116 threadsPerThreadgroup:&v114];
              --v80;
            }
            while (v80);
          }
          if (v68 <= 0) {
            break;
          }
          long long v116 = 0uLL;
          uint64_t v117 = 0;
          v81 = self->_toneMapSmoothingResources;
          if (v81) {
            [(ToneMapSmoothingResources *)v81 computeSizeForOddEvenLevel:(v68 - 1) xDivisor:2 yDivisor:2];
          }
          [v65 setComputePipelineState:self->_shaders->_mstmPyramidRemixIntermediate];
          [v65 setImageblockWidth:32 height:32];
          if (a10)
          {
            v82 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources masksPyramid];
            v83 = [v82 objectAtIndexedSubscript:(v68 - 1)];
            [v65 setTexture:v83 atIndex:12];
          }
          v84 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources referencePyramidOdd];
          v85 = [v84 objectAtIndexedSubscript:(v68 - 1)];
          [v65 setTexture:v85 atIndex:5];

          v86 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources referencePyramidEven];
          v87 = [v86 objectAtIndexedSubscript:(v68 - 1)];
          [v65 setTexture:v87 atIndex:6];

          uint64_t v88 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources outputPyramidOdd];
          uint64_t v89 = [v88 objectAtIndexedSubscript:(v68 - 1)];
          [v65 setTexture:v89 atIndex:7];

          v90 = [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources outputPyramidEven];
          v91 = [v90 objectAtIndexedSubscript:(v68 - 1)];
          [v65 setTexture:v91 atIndex:8];

          [v65 setBufferOffset:176 * v68 + 88 atIndex:0];
          long long v114 = v116;
          uint64_t v115 = v117;
          int64x2_t v112 = vdupq_n_s64(0x10uLL);
          uint64_t v113 = 1;
          [v65 dispatchThreads:&v114 threadsPerThreadgroup:&v112];
          --v68;
          if (a10) {
            goto LABEL_39;
          }
        }
        id v17 = v103;
        long long v64 = v107;
      }
      unint64_t v92 = (unint64_t)([v17 width] + 3) >> 2;
      unint64_t v93 = (unint64_t)([v17 height] + 1) >> 1;
      [v65 setComputePipelineState:self->_shaders->_mstmPyramidRemixFinal];
      [v65 setTexture:v17 atIndex:4];
      v94 = v102;
      [v65 setTexture:v102 atIndex:14];
      [v65 setImageblockWidth:32 height:32];
      [v65 setBufferOffset:88 atIndex:0];
      *(void *)&long long v120 = v92;
      *((void *)&v120 + 1) = v93;
      uint64_t v121 = 1;
      long long v116 = xmmword_263380260;
      uint64_t v117 = 1;
      [v65 dispatchThreads:&v120 threadsPerThreadgroup:&v116];
      [v65 endEncoding];
      if (*MEMORY[0x263F00E10])
      {
        uint64_t v95 = [v64 commandQueue];
        uint64_t v96 = [v95 commandBuffer];

        [v96 setLabel:@"KTRACE_MTLCMDBUF"];
        [v96 addCompletedHandler:&__block_literal_global_206];
        [v96 commit];
        [v64 addCompletedHandler:&__block_literal_global_208];
      }
      [v64 commit];
      [(ToneMapSmoothingResources *)self->_toneMapSmoothingResources makeResourcesAliasable];

      int v97 = 0;
      goto LABEL_55;
    }
    FigDebugAssert3();
  }
  else
  {
    FigDebugAssert3();
  }
  int v97 = -12786;
  id v17 = v103;
  v94 = v102;
LABEL_55:
  id v19 = v100;
  uint64_t v18 = v101;
LABEL_56:

  return v97;
}

uint64_t __120__ToneMappingStage_performToneMapSmoothing_luma_mask_auxMask_skyMask_tmPlist_ev0FrameMetadata_useMaskPyramid_firstPass___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __120__ToneMappingStage_performToneMapSmoothing_luma_mask_auxMask_skyMask_tmPlist_ev0FrameMetadata_useMaskPyramid_firstPass___block_invoke_2(uint64_t a1, void *a2)
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

- (uint64_t)runToneMapping:(double)a3 bilateralGrid:(double)a4 bilateralGridHomography:(double)a5 tmPlist:(double)a6 darkestFrameMetadata:(double)a7 ev0FrameMetadata:(double)a8 scaleInput:(double)a9 colorCorrection:(double)a10 hasChromaBias:(uint64_t)a11 quality:(uint64_t)a12 inputIsLinear:(uint64_t)a13 stfAllowed:(uint64_t)a14 isLowLight:(uint64_t)a15
{
  LODWORD(a10) = 1.0;
  if (a17 == 1) {
    *(float *)&a10 = 0.5;
  }
  return objc_msgSend(a1, "runToneMapping:bilateralGrid:bilateralGridHomography:tmPlist:darkestFrameMetadata:ev0FrameMetadata:scaleInput:colorCorrection:hasChromaBias:quality:gridScaleFactor:inputIsLinear:stfAllowed:isLowLight:", a3, a4, a5, a6, a7, a8, a9, COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&a10, 0)));
}

- (uint64_t)runToneMapping:(double)a3 bilateralGrid:(double)a4 bilateralGridHomography:(float)a5 tmPlist:(double)a6 darkestFrameMetadata:(double)a7 ev0FrameMetadata:(double)a8 scaleInput:(double)a9 colorCorrection:(uint64_t)a10 hasChromaBias:(void *)a11 quality:(void *)a12 gridScaleFactor:(void *)a13 inputIsLinear:(void *)a14 stfAllowed:(void *)a15 isLowLight:(int)a16
{
  uint64_t v282 = *MEMORY[0x263EF8340];
  int v27 = a11;
  id v249 = a12;
  uint64_t v28 = a13;
  id v264 = a14;
  id v29 = a15;
  id v30 = v29;
  if (a16) {
    float v31 = 0.5;
  }
  else {
    float v31 = 0.0;
  }
  memset(v281, 0, 400);
  v265 = 0;
  if (*((void *)v27 + 6) && *((void *)v27 + 7) && *((void *)v27 + 15))
  {
    BOOL v32 = 0;
    if (a17 == 1)
    {
      BOOL v250 = 0;
      BOOL v33 = 0;
      BOOL v256 = 0;
      BOOL v34 = 0;
      BOOL v35 = 0;
    }
    else
    {
      BOOL v250 = 0;
      BOOL v33 = 0;
      BOOL v256 = 0;
      BOOL v34 = 0;
      BOOL v35 = 0;
      if (*((void *)v27 + 9))
      {
        BOOL v35 = v28[92] != 0;
        BOOL v34 = *((_DWORD *)v28 + 22) == 3;
        if (v28[93])
        {
          id v36 = [v29 faces];
          BOOL v33 = (unint64_t)[v36 count] < 5;
        }
        else
        {
          BOOL v33 = 0;
        }
        if (v28[95])
        {
          BOOL v194 = a19;
          if (!*(void *)(a1 + 72)) {
            BOOL v194 = 0;
          }
          BOOL v256 = v194;
        }
        else
        {
          BOOL v256 = 0;
        }
        BOOL v250 = v28[96] != 0;
        BOOL v32 = a17 != 2;
      }
    }
  }
  else
  {
    BOOL v32 = 0;
    BOOL v250 = 0;
    BOOL v33 = 0;
    BOOL v256 = 0;
    BOOL v34 = 0;
    BOOL v35 = 0;
  }
  BOOL v229 = v33;
  BOOL v228 = v32;
  BOOL v245 = v35;
  objc_storeStrong((id *)(a1 + 40), *((id *)v27 + 16));
  if ([v264 hasZoomRects])
  {
    [v264 zoomDstRect];
    double v38 = v37;
    [v264 zoomSrcRect];
    float v40 = v38 / v39;
    a9 = COERCE_DOUBLE(vmul_n_f32(*(float32x2_t *)&a9, v40));
  }
  BOOL v246 = v34;
  unsigned int v253 = v35 || v34 || v256;
  *(_DWORD *)(a1 + 100) = *(_DWORD *)([v30 exposureParams] + 112);
  double v42 = *(double *)(v28 + 76);
  float v43 = 0.0;
  float v44 = 0.0;
  if (v250)
  {
    double v262 = *(double *)(v28 + 76);
    float v44 = interpolate_with_gain(*((void **)v28 + 13), *(float *)[v30 exposureParams]);
    float v45 = interpolate_with_gain(*((void **)v28 + 14), *(float *)[v30 exposureParams]);
    double v42 = v262;
    float v43 = v45;
  }
  v263 = v28;
  if (v256)
  {
    if (dword_26B430EE8)
    {
      float64x2_t v46 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    float32x2_t v49 = objc_msgSend(*(id *)(a1 + 8), "commandQueue", v195, v197);
    float32x2_t v50 = [v49 commandBuffer];

    if (!v50)
    {
      FigDebugAssert3();
LABEL_122:
      uint64_t v138 = FigSignalErrorAt();
      goto LABEL_95;
    }
    float32x4_t v51 = [v50 blitCommandEncoder];
    if (!v51) {
      goto LABEL_106;
    }
    objc_msgSend(v51, "fillBuffer:range:value:", *(void *)(*((void *)v27 + 16) + 56), 0, objc_msgSend(*(id *)(*((void *)v27 + 16) + 56), "length"), 0);
    [v51 endEncoding];
    [v50 commit];
    float32x4_t v52 = [*(id *)(a1 + 8) device];
    uint64_t v53 = [v52 newBufferWithLength:399360 options:0];
    simd_float3x3 v54 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = v53;

    if (*(void *)(a1 + 88))
    {
      v233 = v50;
      *(_WORD *)(a1 + 96) = [*((id *)v27 + 1) width];
      *(_WORD *)(a1 + 98) = [*((id *)v27 + 1) height];
      objc_msgSend((id)a1, "getLtmRoi:chromaTexHeight:ltmLut:gridScaleFactor:", objc_msgSend(*((id *)v27 + 2), "width"), objc_msgSend(*((id *)v27 + 2), "height"), objc_msgSend(v264, "ltmCurves"), a9);
      double v224 = v55;
      objc_msgSend((id)a1, "getCcmRoi:chromaTexHeight:ccmLut:gridScaleFactor:", objc_msgSend(*((id *)v27 + 2), "width"), objc_msgSend(*((id *)v27 + 2), "height"), objc_msgSend(v264, "ltmCurves"), a9);
      double v226 = v56;
      [(id)a1 getExposureBiasFactor:v264 inputIsLinear:a18];
      int v58 = v57;
      int v59 = *(_DWORD *)([v264 ltmCurves] + 222264);
      uint64_t v60 = *((void *)v27 + 1);
      float32x2_t v61 = [*(id *)(a1 + 72) stfParams];
      [v61 setInLuma:v60];

      uint64_t v62 = *((void *)v27 + 2);
      simd_float3x3 v63 = [*(id *)(a1 + 72) stfParams];
      [v63 setInChroma:v62];

      uint64_t v64 = *((void *)v27 + 4);
      BOOL v65 = [*(id *)(a1 + 72) stfParams];
      [v65 setOutLuma:v64];

      uint64_t v66 = *((void *)v27 + 5);
      float v67 = [*(id *)(a1 + 72) stfParams];
      [v67 setOutChroma:v66];

      uint64_t v68 = [*(id *)(a1 + 72) stfParams];
      [v68 setInputIsLinear:a18];

      uint64_t v69 = *((void *)v27 + 16);
      if (*(unsigned char *)(v69 + 128)) {
        uint64_t v70 = *(void *)(v69 + 136);
      }
      else {
        uint64_t v70 = 0;
      }
      float32x2_t v71 = [*(id *)(a1 + 72) stfParams];
      [v71 setHighlightCompression:v70];

      long long v236 = *(_OWORD *)(*((void *)v27 + 16) + 144);
      float32x2_t v72 = [*(id *)(a1 + 72) stfParams];
      [v72 setHazeCorrection:*(double *)&v236];

      float32x2_t v73 = [*(id *)(a1 + 72) stfParams];
      LODWORD(v71) = [v73 conformsToProtocol:&unk_270EC12D8];

      if (v71)
      {
        float32x2_t v74 = [*(id *)(a1 + 72) stfParams];
        [v74 setGtcRatioTex:*(void *)(*((void *)v27 + 16) + 16)];
        float32x2_t v75 = &OBJC_IVAR___ToneMappingCurves__ltcGTCFinalTex;
        if (v253) {
          float32x2_t v75 = &OBJC_IVAR___ToneMappingCurves__bypassGTCTex;
        }
        [v74 setGtcFinalTex:*(void *)(*((void *)v27 + 16) + *v75)];
        objc_msgSend(v74, "setColorCorrection:", a6, a7, a8);
        float32x2_t v76 = &OBJC_IVAR___ToneMappingBuffers_skinMask;
        if (!*(_DWORD *)(*((void *)v28 + 4) + 36)) {
          float32x2_t v76 = &OBJC_IVAR___ToneMappingBuffers_skyMask;
        }
        [v74 setSkySkinMask:*(void *)&v27[*v76]];
        [v74 setPersonMask:*((void *)v27 + 7)];
        float32x2_t v77 = &OBJC_IVAR___ToneMappingCurves__unregularizedLTC;
        if (!v250) {
          float32x2_t v77 = &OBJC_IVAR___ToneMappingCurves__unregularizedForegroundLTC;
        }
        [v74 setLtcLutData:*(void *)(*((void *)v27 + 16) + *v77)];
        [v74 setLtcForegroundLutData:*(void *)(*((void *)v27 + 16) + 104)];
        uint64_t v78 = *((void *)v27 + 16);
        if (*(unsigned char *)(v78 + 89)) {
          uint64_t v79 = *(void *)(v78 + 112);
        }
        else {
          uint64_t v79 = 0;
        }
        [v74 setLtcTcrLutData:v79];
        [v74 setLtmRoi:v224];
        if (*(unsigned char *)(*((void *)v27 + 16) + 88) && [v264 allowSpatialCCM]) {
          uint64_t v80 = *(void *)(*((void *)v27 + 16) + 72);
        }
        else {
          uint64_t v80 = 0;
        }
        [v74 setCcmLut:v80];
        [v74 setCcmRoi:v226];
        [v74 setLumaHistogram:*(void *)(*((void *)v27 + 16) + 56)];
        LODWORD(v81) = v58;
        [v74 setExposureBiasFactor:v81];
        *(float *)&double v82 = a5;
        [v74 setScaleInput:v82];
        LODWORD(v83) = *((_DWORD *)v28 + 32);
        [v74 setChromaGainAdjPower:v83];
        *(float *)&double v84 = v31;
        [v74 setChromaBias:v84];
        LODWORD(v85) = *((_DWORD *)v27 + 34);
        [v74 setInputLumaPedestal:v85];
        LODWORD(v86) = v59;
        [v74 setLtmHardGain:v86];
        [v74 setOutputLTCs:*(void *)(a1 + 88)];
        [v74 setCurrentTuning:*((void *)v28 + 15)];
        *(float *)&double v87 = v44;
        [v74 setUtmForegroundFactor:v87];
        *(float *)&double v88 = v43;
        [v74 setUtmBackgroundFactor:v88];
      }
      uint64_t v89 = [*(id *)(a1 + 72) process];
      if (!v89)
      {
        *(unsigned char *)(a1 + 80) = 1;
        v90 = [*(id *)(a1 + 72) stfParams];
        *(_DWORD *)(a1 + 84) = [v90 analyticsVersion];

        uint64_t v91 = *((void *)v27 + 16);
        if (*(unsigned char *)(v91 + 89)) {
          *(unsigned char *)(v91 + 89) = 0;
        }

        goto LABEL_49;
      }
      uint64_t v138 = v89;
      float32x2_t v50 = v233;
    }
    else
    {
LABEL_106:
      FigDebugAssert3();
      uint64_t v138 = FigSignalErrorAt();
    }

    goto LABEL_110;
  }
  uint64_t v47 = *((void *)v27 + 16);
  if (*(unsigned char *)(v47 + 128)) {
    uint64_t v48 = *(void *)(v47 + 136);
  }
  else {
    uint64_t v48 = 0;
  }
  *(float *)&double v41 = a5;
  if (objc_msgSend((id)a1, "performLTM:bilateralGrid:bilateralGridHomography:detailEnhance:darkestFrameMetadata:scaleInput:colorCorrection:outputMode:chromaGainAdjPower:inputIsLinear:chromaBias:gridScaleFactor:personMask:highlightCompression:utmForegroundFactor:utmBackgroundFactor:", v27, v249, v264, v253, a18, *((void *)v27 + 7), a2, a3, a4, v42, v41, a6, a7, a8, __PAIR64__(LODWORD(v31), *((_DWORD *)v28 + 32)),
                       *(void *)&a9,
                       v48,
                       __PAIR64__(LODWORD(v43), LODWORD(v44))))
  {
LABEL_121:
    FigDebugAssert3();
    goto LABEL_122;
  }
  *(unsigned char *)(a1 + 80) = 0;
LABEL_49:
  if (dword_26B430EE8)
  {
    unint64_t v92 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v93 = *((void *)v27 + 4);
  BOOL v94 = v246;
  if (!v93) {
    BOOL v94 = 0;
  }
  if (v94)
  {
    [v30 exposureParams];
    if (dword_26B430EE8)
    {
      uint64_t v95 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    uint64_t v96 = objc_msgSend(v30, "faces", v196, v198);
    uint64_t v97 = [v96 count];

    if (v97)
    {
      unint64_t v98 = 0;
      int v99 = &v281[36];
      do
      {
        id v100 = [v30 faces];
        float v101 = [v100 objectAtIndexedSubscript:v98];
        [v101 rect];
        *(void *)(v99 - 18) = v102;
        *(void *)(v99 - 14) = v103;
        *(void *)(v99 - 10) = v104;
        *(void *)(v99 - 6) = v105;

        id v106 = [v30 faces];
        float32x2_t v107 = [v106 objectAtIndexedSubscript:v98];
        *(v99 - 2) = [v107 confidence];

        int v108 = [v30 faces];
        int64x2_t v109 = [v108 objectAtIndexedSubscript:v98];
        *(v99 - 1) = [v109 roll];

        int v110 = [v30 faces];
        int64x2_t v111 = [v110 objectAtIndexedSubscript:v98];
        *int v99 = [v111 yaw];
        v99 += 20;

        ++v98;
        int64x2_t v112 = [v30 faces];
        unint64_t v113 = [v112 count];
      }
      while (v113 > v98);
    }
    float v261 = v31;
    float v114 = 0.0;
    if (a17 == 3)
    {
      uint64_t v115 = (float *)objc_msgSend(v30, "exposureParams", 0.0);
      float v114 = 0.7;
      if (*v115 <= 15.0) {
        float v114 = 0.5;
      }
    }
    uint64_t v116 = *((void *)v28 + 3);
    int v257 = *(_DWORD *)(v116 + 8);
    int v251 = *(_DWORD *)(v116 + 12);
    int v247 = *(_DWORD *)(v116 + 16);
    int v244 = *(_DWORD *)(v116 + 20);
    int v243 = *(_DWORD *)(v116 + 24);
    int v239 = *(_DWORD *)(v116 + 28);
    int v237 = *(_DWORD *)(v116 + 32);
    int v231 = *(_DWORD *)(v116 + 36);
    int v225 = *(_DWORD *)(v116 + 40);
    char v221 = *(unsigned char *)(v116 + 44);
    int v223 = *(_DWORD *)(v116 + 48);
    int v219 = *(_DWORD *)(v116 + 52);
    int v218 = *(_DWORD *)(v116 + 56);
    int v217 = *(_DWORD *)(v116 + 60);
    int v216 = *(_DWORD *)(v116 + 64);
    int v215 = *(_DWORD *)(v116 + 68);
    float v117 = *(float *)(v116 + 72) - v114;
    float v118 = *(float *)(v116 + 76) - v114;
    char v210 = *(unsigned char *)(v116 + 45);
    float v119 = *(float *)(v116 + 80) - v114;
    uint64_t v241 = *((void *)v27 + 4);
    float v120 = *(float *)(v116 + 84) - v114;
    uint64_t v234 = *((void *)v27 + 1);
    float v121 = *(float *)(v116 + 88) - v114;
    uint64_t v227 = *((void *)v27 + 2);
    uint64_t v222 = *((void *)v27 + 5);
    uint64_t v220 = *((void *)v27 + 6);
    float v122 = *(float *)(v116 + 92) - v114;
    uint64_t v214 = *((void *)v27 + 7);
    v213 = *(void **)(a1 + 32);
    long long v212 = *(_OWORD *)(v27 + 72);
    uint64_t v211 = *(void *)(*((void *)v27 + 16) + 24);
    uint64_t v209 = *((void *)v27 + 11);
    uint64_t v207 = *((void *)v27 + 14);
    uint64_t v208 = *((void *)v27 + 12);
    uint64_t v206 = *((void *)v27 + 13);
    unint64_t v123 = (double *)[v30 ROI];
    unsigned int v124 = *(_DWORD *)([v30 exposureParams] + 72);
    int v125 = *(_DWORD *)([v30 exposureParams] + 112);
    int v126 = [v30 exifOrientation];
    uint64_t v127 = [v30 faces];
    uint64_t v128 = [v127 count];
    long long v129 = [*(id *)(a1 + 24) mstmv2TuningParams];
    uint64_t v130 = [*(id *)(a1 + 24) blackPoint];
    CGAffineTransform v131 = [*(id *)(a1 + 24) playbackCurve];
    double v132 = *v123;
    double v133 = v123[1];
    double v134 = v123[2];
    double v135 = v123[3];
    v266[0] = v257;
    v266[1] = v251;
    v266[2] = v247;
    v266[3] = v244;
    v266[4] = v243;
    v266[5] = v239;
    v266[6] = v237;
    v266[7] = v231;
    v266[8] = v225;
    v267[0] = v221;
    *(_WORD *)&v267[1] = 0;
    v267[3] = 0;
    int v268 = v223;
    int v269 = v219;
    int v270 = v218;
    int v271 = v217;
    int v272 = v216;
    int v273 = v215;
    float v274 = v117;
    float v275 = v118;
    float v276 = v119;
    float v277 = v120;
    float v278 = v121;
    float v279 = v122;
    v280[0] = v210;
    v280[3] = 0;
    *(_WORD *)&v280[1] = 0;
    BYTE1(v205) = a18;
    LOBYTE(v205) = 1;
    LODWORD(v204) = v126;
    LODWORD(v136) = v125;
    float v31 = v261;
    *(float *)&double v137 = v261;
    LODWORD(v123) = objc_msgSend(v213, "runSubjectRelightingVersion:toneMap:luma:chroma:ltmChroma:skinMask:personMask:instanceMask0:instanceMask1:instanceMask2:instanceMask3:gammaCurve:instanceMaskConfidences:skinToneClassification:validROI:expBias:faceExpRatio:exifOrientation:numFacesISPDetected:faceBoundingBoxesFromISP:isChromaGainAdjusted:inputIsLinear:chromaBias:srlV2Plist:mstmParams:mstmSRLParams:blackPoint:playBackCurve:", @"v3", v241, v234, v227, v222, v220, v132, v133, v134, v135, COERCE_DOUBLE(__PAIR64__(DWORD1(v212), v124)), v136, v137, v214,
                      v212,
                      v209,
                      v208,
                      v211,
                      v207,
                      v206,
                      v204,
                      v128,
                      v281,
                      v205,
                      v266,
                      v129,
                      0,
                      v130,
                      v131);

    if (v123)
    {
      FigDebugAssert3();
      uint64_t v138 = FigSignalErrorAt();
      goto LABEL_119;
    }
    uint64_t v93 = *((void *)v27 + 4);
    uint64_t v28 = v263;
  }
  uint64_t v138 = 0;
  if (v253 && v93)
  {
    if (!v229)
    {
LABEL_69:
      if (!v245) {
        goto LABEL_76;
      }
      uint64_t v139 = *((void *)v28 + 6);
      if (v28[97]) {
        uint64_t v140 = *((void *)v28 + 8);
      }
      else {
        uint64_t v140 = 0;
      }
      uint64_t v141 = *((void *)v27 + 4);
      v142 = objc_msgSend(*(id *)(a1 + 24), "mstmTuningParams", v196);
      uint64_t v138 = [(id)a1 fetchTuningParametersFromPlist:v139 plist:v140 ev0FrameMetadata:v30 toneMap:v141 isLowLight:a20 destinationMTLBuffer:v142];

      if (!v138)
      {
        uint64_t v28 = v263;
        uint64_t v143 = *((void *)v263 + 7);
        uint64_t v144 = *((void *)v27 + 4);
        v145 = [*(id *)(a1 + 24) mstmv2TuningParams];
        uint64_t v138 = [(id)a1 fetchTuningParametersMSTMv2FromPlist:v143 ev0FrameMetadata:v30 toneMap:v144 destinationMTLBuffer:v145];

        if (v138)
        {
          FigDebugAssert3();
          goto LABEL_95;
        }
        BYTE1(v198) = 1;
        LOBYTE(v198) = v228;
        if (!objc_msgSend((id)a1, "performToneMapSmoothing:luma:mask:auxMask:skyMask:tmPlist:ev0FrameMetadata:useMaskPyramid:firstPass:", *((void *)v27 + 4), *((void *)v27 + 1), *((void *)v27 + 7), 0, *((void *)v27 + 8), v263, v30, v198))
        {
LABEL_76:
          v146 = objc_msgSend(*(id *)(a1 + 8), "allocator", v196);
          v147 = (void *)[v146 newTextureDescriptor];

          if (!v147) {
            goto LABEL_115;
          }
          v148 = [v147 desc];
          [v148 setUsage:7];

          v149 = [v147 desc];
          [v149 setPixelFormat:65];

          uint64_t v150 = [*((id *)v27 + 5) width];
          v151 = [v147 desc];
          [v151 setWidth:v150];

          uint64_t v152 = [*((id *)v27 + 5) height];
          v153 = [v147 desc];
          [v153 setHeight:v152];

          [v147 setLabel:0];
          v154 = [*(id *)(a1 + 8) allocator];
          v265 = (void *)[v154 newTextureWithDescriptor:v147];

          if (!v265)
          {
LABEL_115:
            FigDebugAssert3();
            goto LABEL_116;
          }
          uint64_t v155 = *((void *)v27 + 16);
          v252 = v147;
          if (*(unsigned char *)(v155 + 161))
          {
            id v156 = [*(id *)(a1 + 24) blackPoint];
            v157 = (_DWORD *)[v156 contents];

            _DWORD *v157 = 0;
            uint64_t v155 = *((void *)v27 + 16);
          }
          uint64_t v158 = *((void *)v27 + 4);
          uint64_t v258 = *((void *)v27 + 1);
          uint64_t v254 = *((void *)v27 + 2);
          uint64_t v159 = *((void *)v27 + 5);
          uint64_t v160 = *(void *)(v155 + 24);
          uint64_t v161 = *((void *)v27 + 7);
          int v162 = *((_DWORD *)v263 + 32);
          v163 = [*(id *)(a1 + 24) blackPoint];
          v164 = [*(id *)(a1 + 24) playbackCurve];
          [*(id *)(a1 + 24) saturationControl];
          int v166 = v165;
          int v172 = *(_DWORD *)[v30 exposureParams];
          if (v263[98]) {
            LODWORD(v171) = *(_DWORD *)([v30 exposureParams] + 48);
          }
          else {
            LODWORD(v171) = 1.0;
          }
          LOBYTE(v202) = 1;
          LOBYTE(v200) = a18;
          LODWORD(v167) = v162;
          LODWORD(v169) = v166;
          LODWORD(v170) = v172;
          *(float *)&double v168 = v31;
          int v173 = objc_msgSend((id)a1, "mstmsApplyLumaGain:inputLuma:inputChroma:intermediateChroma:outputChroma:localGainMap:gammaCurve:personMask:chromaGainAdjPower:inputIsLinear:chromaBias:blackPoint:playbackCurve:saturationControl:frameGain:firstPass:hrGainDownRatio:", v158, v258, v254, v265, v159, 0, v167, v168, v169, v170, v171, v160, v161, v200, v163,
                   v164,
                   v202);

          if (!v173)
          {
            uint64_t v28 = v263;
            if (v245)
            {
              LOWORD(v199) = v228;
              if (objc_msgSend((id)a1, "performToneMapSmoothing:luma:mask:auxMask:skyMask:tmPlist:ev0FrameMetadata:useMaskPyramid:firstPass:", *((void *)v27 + 4), *((void *)v27 + 1), *((void *)v27 + 6), *((void *)v27 + 7), *((void *)v27 + 8), v263, v30, v199))
              {
                FigDebugAssert3();
                goto LABEL_114;
              }
            }
            uint64_t v259 = *((void *)v27 + 4);
            uint64_t v255 = *((void *)v27 + 1);
            uint64_t v248 = *((void *)v27 + 2);
            uint64_t v174 = *((void *)v27 + 5);
            uint64_t v175 = *((void *)v27 + 3);
            uint64_t v176 = *(void *)(*((void *)v27 + 16) + 80);
            uint64_t v177 = *((void *)v27 + 7);
            int v178 = *((_DWORD *)v263 + 32);
            v179 = [*(id *)(a1 + 24) blackPoint];
            v180 = [*(id *)(a1 + 24) playbackCurve];
            [*(id *)(a1 + 24) saturationControl];
            int v182 = v181;
            int v188 = *(_DWORD *)[v30 exposureParams];
            if (v263[98]) {
              LODWORD(v187) = *(_DWORD *)([v30 exposureParams] + 48);
            }
            else {
              LODWORD(v187) = 1.0;
            }
            LOBYTE(v203) = 0;
            LOBYTE(v201) = a18;
            LODWORD(v183) = v178;
            *(float *)&double v184 = v31;
            LODWORD(v185) = v182;
            LODWORD(v186) = v188;
            int v189 = objc_msgSend((id)a1, "mstmsApplyLumaGain:inputLuma:inputChroma:intermediateChroma:outputChroma:localGainMap:gammaCurve:personMask:chromaGainAdjPower:inputIsLinear:chromaBias:blackPoint:playbackCurve:saturationControl:frameGain:firstPass:hrGainDownRatio:", v259, v255, v248, v265, v174, v175, v183, v184, v185, v186, v187, v176, v177, v201, v179,
                     v180,
                     v203);

            if (!v189)
            {
              uint64_t v28 = v263;
              v147 = v252;
              if (!v263[132]
                || (uint64_t v191 = *((void *)v27 + 4)) != 0
                && (LODWORD(v192) = *((_DWORD *)v263 + 34),
                    HIDWORD(v192) = 973279855,
                    LODWORD(v190) = *((_DWORD *)v263 + 36),
                    ![(id)a1 performBlackSubtractionWithBlackWhiteParams:v191 maxContrastStrength:*((void *)v27 + 16) inOutTex:v192 curves:v190]))
              {
                uint64_t v138 = 0;
LABEL_94:

                goto LABEL_95;
              }
              goto LABEL_115;
            }
          }
          FigDebugAssert3();
          uint64_t v28 = v263;
LABEL_114:
          v147 = v252;
LABEL_116:
          uint64_t v138 = FigSignalErrorAt();
          goto LABEL_94;
        }
        goto LABEL_121;
      }
      FigDebugAssert3();
LABEL_119:
      uint64_t v28 = v263;
      goto LABEL_95;
    }
    float32x2_t v50 = filterFacesWithLandmarks(*((void **)v27 + 15));
    if (!objc_msgSend((id)a1, "performSmallFaceFix:faceLandmarks:faceLandmarkOrientation:tmPlist:", *((void *)v27 + 6), v50, objc_msgSend(v30, "exifOrientation"), v28))
    {

      goto LABEL_69;
    }
    FigDebugAssert3();
    uint64_t v138 = FigSignalErrorAt();
LABEL_110:
  }
LABEL_95:
  FigMetalDecRef();

  return v138;
}

- (void)reset
{
  id v3 = [(STFStillImageBufferProcessor *)self->_stfProcessor stfParams];
  [v3 reset];

  [(STFStillImageBufferProcessor *)self->_stfProcessor purgeResources];
  [(SubjectRelightingStage *)self->_subjectRelight reset];
  lastSRLCommandBuffer = self->_lastSRLCommandBuffer;
  self->_lastSRLCommandBuffer = 0;

  self->_lastSRLStatusValue = 0;
  stfOutputLTCs = self->_stfOutputLTCs;
  self->_stfOutputLTCs = 0;

  self->_stfStillCorrectionStrength = 0;
  self->_stfStillApplied = 0;
  self->_stfStillAnalyticsVersion = 0;
  self->_SRLWaitCompleted = 0;
}

- (unsigned)getSRLStatus
{
  if ([(ToneMapSmoothingResources *)self->_toneMapSmoothingResources srlVersion] != 3) {
    return self->_lastSRLStatusValue;
  }
  unsigned int result = [(SubjectRelightingStage *)self->_subjectRelight getSRLStatus];
  self->_lastSRLStatusValue = result;
  return result;
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

- (__n64)getCcmRoi:(uint64_t)a3 chromaTexHeight:(int)a4 ccmLut:(int)a5 gridScaleFactor:(_WORD *)a6
{
  uint64_t LTM_tileWidth = getLTM_tileWidth(a6);
  uint64_t LTM_tileHeight = getLTM_tileHeight(a6);
  unsigned int LTM_validWidth = getLTM_validWidth(a6);
  unsigned int LTM_validHeight = getLTM_validHeight(a6);
  v14.i64[0] = LTM_tileWidth;
  v14.i64[1] = LTM_tileHeight;
  result.n64_u64[0] = (unint64_t)vcvt_n_s32_f32(vrndm_f32(vmul_f32(vmul_f32(vcvt_f32_f64(vcvtq_f64_u64(v14)), a1), (float32x2_t)0x3F0000003F000000)), 1uLL);
  int32x2_t v16 = vmul_s32((int32x2_t)result.n64_u64[0], (int32x2_t)__PAIR64__(LTM_validHeight, LTM_validWidth));
  int v17 = 2 * a5;
  int v18 = 2 * a4 - v16.i32[0];
  if (2 * a4 < v16.i32[0]) {
    ++v18;
  }
  signed __int32 v19 = (v18 >> 1) + (signed __int32)result.n64_u32[0] / 2;
  int v20 = v17 - v16.i32[1];
  if (v17 < v16.i32[1]) {
    ++v20;
  }
  result.n64_u32[0] = v19 / 2;
  result.n64_u32[1] = ((v20 >> 1) + (signed __int32)result.n64_u32[1] / 2) / 2;
  return result;
}

- (__n64)getLtmRoi:(uint64_t)a3 chromaTexHeight:(int)a4 ltmLut:(int)a5 gridScaleFactor:(_WORD *)a6
{
  uint64_t LTM_tileWidth = getLTM_tileWidth(a6);
  uint64_t LTM_tileHeight = getLTM_tileHeight(a6);
  unsigned int LTM_validWidth = getLTM_validWidth(a6);
  unsigned int LTM_validHeight = getLTM_validHeight(a6);
  v14.i64[0] = LTM_tileWidth;
  v14.i64[1] = LTM_tileHeight;
  result.n64_u64[0] = (unint64_t)vcvt_n_s32_f32(vrndm_f32(vmul_f32(vmul_f32(vcvt_f32_f64(vcvtq_f64_u64(v14)), a1), (float32x2_t)0x3F0000003F000000)), 1uLL);
  int32x2_t v16 = vmul_s32((int32x2_t)result.n64_u64[0], (int32x2_t)__PAIR64__(LTM_validHeight, LTM_validWidth));
  int v17 = 2 * a5;
  int v18 = 2 * a4 - v16.i32[0];
  if (2 * a4 < v16.i32[0]) {
    ++v18;
  }
  signed __int32 v19 = (v18 >> 1) + (signed __int32)result.n64_u32[0] / 2;
  int v20 = v17 - v16.i32[1];
  if (v17 < v16.i32[1]) {
    ++v20;
  }
  result.n64_u32[0] = v19 / 2;
  result.n64_u32[1] = ((v20 >> 1) + (signed __int32)result.n64_u32[1] / 2) / 2;
  return result;
}

- (id)getSTFLTM_asNSData
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = [(STFStillImageBufferProcessor *)self->_stfProcessor stfParams];
  id v4 = [v3 lastSTFCommandBuffer];

  if (!v4) {
    goto LABEL_32;
  }
  id v5 = [v3 lastSTFCommandBuffer];
  [v5 waitUntilCompleted];

  toneMappingCurves = self->_toneMappingCurves;
  if (!toneMappingCurves
    || (unregularizedForegroundLTC = toneMappingCurves->_unregularizedForegroundLTC) == 0
    || (id v8 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:399384]) == 0)
  {
    FigDebugAssert3();
    id v4 = 0;
    goto LABEL_33;
  }
  id v4 = v8;
  uint64_t v9 = [v4 mutableBytes];
  if (!v9
    || (uint64_t v10 = v9,
        *(_WORD *)(v9 + 22) = 65,
        *(void *)(v9 + 10) = 0,
        *(void *)uint64_t v9 = 0x2080003000400004,
        *(_WORD *)(v9 + 8) = 130,
        *(_WORD *)(v9 + 18) = self->_lastInputLumaTexWidth >> 6,
        *(_WORD *)(v9 + 20) = self->_lastInputLumaTexHeight / 0x30u,
        ![(MTLBuffer *)self->_stfOutputLTCs contents]))
  {
LABEL_32:
    FigDebugAssert3();
LABEL_33:
    int v38 = FigSignalErrorAt();
    BOOL v35 = 0;
    if (v38) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  uint64_t v11 = 199680;
  int v12 = (unsigned __int16 *)(v10 + 24);
  memcpy((void *)(v10 + 24), (const void *)[(MTLBuffer *)self->_stfOutputLTCs contents], 0x61800uLL);
  int v44 = 0;
  memset(v43, 0, sizeof(v43));
  int v42 = 0;
  memset(v41, 0, sizeof(v41));
  [(SubjectRelightingStage *)self->_subjectRelight curveParameter];
  unint64_t v14 = 0;
  unint64_t v15 = v43;
  uint64_t v16 = 199680;
  do
  {
    int v17 = *v12++;
    *(_DWORD *)&v15[-260 * (v14 / 0x41)] += v17;
    ++v14;
    v15 += 4;
    --v16;
  }
  while (v16);
  unint64_t v18 = self->_toneMappingCurves->_ltmBinsY * self->_toneMappingCurves->_ltmBinsX;
  if (v18)
  {
    unsigned int v19 = 0;
    uint64_t v20 = 65 * v18;
    if (65 * v18 <= 1) {
      uint64_t v20 = 1;
    }
    do
    {
      int v21 = *unregularizedForegroundLTC++;
      v41[v19 % 0x41] += v21;
      ++v19;
      --v20;
    }
    while (v20);
  }
  for (uint64_t i = 0; i != 65; ++i)
  {
    v41[i] = v41[i] / v18;
    unsigned int v23 = *(_DWORD *)&v43[i * 4];
    if (v23 < 0xC00) {
      unsigned int v24 = 1;
    }
    else {
      unsigned int v24 = v23 / 0xC00;
    }
    *(_DWORD *)&v43[i * 4] = v24;
  }
  float v25 = fminf(fmaxf((float)(self->_faceExpRatio + -2.2) * -2.0, 0.0), 1.0);
  float v26 = (float)((float)(v25 * v25) * (float)((float)(v25 * -2.0) + 3.0)) * 0.4;
  if (*(float *)&v13 < 0.5) {
    float v27 = 1.0;
  }
  else {
    float v27 = v26;
  }
  float v28 = (float)((float)(*(float *)&v13 + -0.5) * v27) + 0.5;
  if (dword_26B430EE8)
  {
    id v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v30 = 0;
  unint64_t v31 = 0;
  BOOL v32 = (_WORD *)(v10 + 24);
  do
  {
    unsigned int v33 = *(_DWORD *)((char *)v41 + v30 - 260 * (v31 / 0x41))
        * (unsigned __int16)*v32
        / *(_DWORD *)&v43[v30 - 260 * (v31 / 0x41)];
    if (v33 >= 0xFFFF) {
      uint64_t v34 = 0xFFFFLL;
    }
    else {
      uint64_t v34 = v33;
    }
    *(float *)&double v13 = v28;
    *v32++ = -[ToneMappingStage _srlBoost:boostFactor:](self, "_srlBoost:boostFactor:", v34, v13, v39, v40);
    ++v31;
    v30 += 4;
    --v11;
  }
  while (v11);
LABEL_28:
  BOOL v35 = v4;
LABEL_29:
  id v36 = v35;

  return v36;
}

- (unsigned)_srlBoost:(unsigned __int16)a3 boostFactor:(float)a4
{
  double v4 = round((float)(1.0- (float)((float)((float)(1.0 - a4) * (float)(1.0 - (float)((float)a3 / 65535.0)))/ (float)((float)((float)((float)a3 / 65535.0) * a4)+ (float)((float)(1.0 - a4) * (float)(1.0 - (float)((float)a3 / 65535.0))))))* 65535.0);
  if (v4 <= 0.0)
  {
    LOWORD(v5) = 0;
  }
  else if (v4 >= 65535.0)
  {
    LOWORD(v5) = -1;
  }
  else
  {
    return (int)v4;
  }
  return v5;
}

- (int)getSTFStillCorrectionStrength:(BOOL)a3
{
  if (a3 || self->_SRLWaitCompleted)
  {
    double v4 = [(STFStillImageBufferProcessor *)self->_stfProcessor stfParams];
    int v5 = [v4 lastSTFCommandBuffer];

    if (v5)
    {
      float v6 = [v4 lastSTFCommandBuffer];
      [v6 waitUntilCompleted];

      self->_stfStillCorrectionStrength = [(STFStillImageBufferProcessor *)self->_stfProcessor getCorrectionStrength];
    }
    self->_SRLWaitCompleted = 0;
  }
  return self->_stfStillCorrectionStrength;
}

+ (id)getHighlightCompression_asNSArray:(const ltmCurves *)a3
{
  if (a3->var10)
  {
    double v4 = [MEMORY[0x263EFF980] arrayWithCapacity:257];
    uint64_t v5 = 0;
    var9 = a3->var9;
    do
    {
      int v7 = [NSNumber numberWithUnsignedShort:var9[v5]];
      [v4 setObject:v7 atIndexedSubscript:v5];

      ++v5;
    }
    while (v5 != 257);
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (SidecarWriter)sidecarWriter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);

  return (SidecarWriter *)WeakRetained;
}

- (void)setSidecarWriter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sidecarWriter);
  objc_storeStrong((id *)&self->_stfOutputLTCs, 0);
  objc_storeStrong((id *)&self->_stfProcessor, 0);
  objc_storeStrong((id *)&self->_lastSRLCommandBuffer, 0);
  objc_storeStrong((id *)&self->_toneMappingCurves, 0);
  objc_storeStrong((id *)&self->_subjectRelight, 0);
  objc_storeStrong((id *)&self->_toneMapSmoothingResources, 0);
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end