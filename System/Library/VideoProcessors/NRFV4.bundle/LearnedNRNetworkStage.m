@interface LearnedNRNetworkStage
+ (int)prewarmShaders:(id)a3;
- (LearnedNRNetworkStage)initWithContext:(id)a3 cameraInfo:(id)a4 isQuadra:(BOOL)a5 deviceGeneration:(int)a6;
- (LearnedNRNetworkTuningParams)tuningParams;
- (float)_estimateGainFromMetadata:(id)a3 considerHighlightCompression:(BOOL)a4;
- (id)availableImagingNetworksWithExtension:(id)a3;
- (id)getNetworkPath;
- (id)platformIdentifier;
- (int)convertYUV420toRGB:(id)a3 luma:(id)a4 chroma:(id)a5;
- (int)getFinalProcessingStatus;
- (int)processSFDForInputTexture:(id)a3 outLuma:(id)a4 outChroma:(id)a5 renderROI:(id *)a6;
- (int)resetFinalProcessingStatus;
- (int)setupTiledInferenceProcessor;
- (int)updateParametersFromMetadata:(id)a3 bayerPattern:(id)a4 lscGainMapBuffer:(__CVBuffer *)a5 lscGainMapParameters:(id)a6;
- (void)setTuningParams:(id)a3;
@end

@implementation LearnedNRNetworkStage

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[LearnedNRNetworkShaders alloc] initWithMetal:v3];

  if (v4
    && (v5 = [[LearnedNRNetworkPreANEStage alloc] initWithMetal:v3], v5, v5)&& (v6 = [[LearnedNRNetworkPostANEStage alloc] initWithMetal:v3], v6, v6))
  {
    int v7 = 0;
  }
  else
  {
    FigDebugAssert3();
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v7 = -12786;
  }

  return v7;
}

- (LearnedNRNetworkStage)initWithContext:(id)a3 cameraInfo:(id)a4 isQuadra:(BOOL)a5 deviceGeneration:(int)a6
{
  BOOL v7 = a5;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  v28.receiver = self;
  v28.super_class = (Class)LearnedNRNetworkStage;
  v13 = [(LearnedNRNetworkStage *)&v28 init];
  v14 = v13;
  if (!v13) {
    goto LABEL_12;
  }
  v13->_deviceGeneration = a6;
  if (!v11) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v13->_metal, a3);
  if (!v12) {
    goto LABEL_12;
  }
  objc_storeStrong((id *)&v14->_cameraInfoByPortType, a4);
  v15 = [[LearnedNRNetworkShaders alloc] initWithMetal:v11];
  shaders = v14->_shaders;
  v14->_shaders = v15;

  if (!v14->_shaders) {
    goto LABEL_12;
  }
  v17 = [[LearnedNRNetworkPreANEStage alloc] initWithMetal:v11];
  preStage = v14->_preStage;
  v14->_preStage = v17;

  if (!v14->_preStage) {
    goto LABEL_12;
  }
  v19 = [[LearnedNRNetworkPostANEStage alloc] initWithMetal:v11];
  postStage = v14->_postStage;
  v14->_postStage = v19;

  if (!v14->_postStage) {
    goto LABEL_12;
  }
  uint64_t v21 = objc_opt_new();
  shared = v14->_shared;
  v14->_shared = (LearnedNRNetworkShared *)v21;

  v23 = v14->_shared;
  if (v23)
  {
    [(LearnedNRNetworkShared *)v23 setMetal:v14->_metal];
    [(LearnedNRNetworkStageBase *)v14->_preStage setShared:v14->_shared];
    [(LearnedNRNetworkStageBase *)v14->_postStage setShared:v14->_shared];
    [(LearnedNRNetworkShared *)v14->_shared setIsQuadra:v7];
    if ([(LearnedNRNetworkStage *)v14 setupTiledInferenceProcessor]) {
      v24 = 0;
    }
    else {
      v24 = v14;
    }
  }
  else
  {
LABEL_12:
    v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v24 = 0;
  }
  v25 = v24;

  return v25;
}

- (int)processSFDForInputTexture:(id)a3 outLuma:(id)a4 outChroma:(id)a5 renderROI:(id *)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (!v10
    || !v11
    || !v12
    || [v10 pixelFormat] != 25
    || [v11 pixelFormat] != 25
    || [v13 pixelFormat] != 65
    || ![v10 width]
    || ![v10 height]
    || ![v11 width]
    || ![v11 height]
    || (uint64_t v14 = [v13 width], v14 != (unint64_t)objc_msgSend(v11, "width") >> 1)
    || (uint64_t v15 = [v13 height], v15 != (unint64_t)objc_msgSend(v11, "height") >> 1))
  {
    unsigned int v28 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
LABEL_27:
    int v18 = -73356;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_15;
  }
  [(LearnedNRNetworkShared *)self->_shared setInputRawTexture:v10];
  long long v16 = *(_OWORD *)&a6->var0.var2;
  v26[0] = *(_OWORD *)&a6->var0.var0;
  v26[1] = v16;
  v26[2] = *(_OWORD *)&a6->var1.var1;
  [(LearnedNRNetworkShared *)self->_shared setRenderROI:v26];
  [(LearnedNRNetworkPostANEStage *)self->_postStage setOutputLumaTexture:v11];
  [(LearnedNRNetworkPostANEStage *)self->_postStage setOutputChromaTexture:v13];
  tiledInferenceProcessor = self->_tiledInferenceProcessor;
  if (!tiledInferenceProcessor)
  {
    unsigned int v28 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v21 = v28;
    if (os_log_type_enabled(v20, type)) {
      unsigned int v22 = v21;
    }
    else {
      unsigned int v22 = v21 & 0xFFFFFFFE;
    }
    if (v22)
    {
      int v29 = 136315138;
      v30 = "-[LearnedNRNetworkStage processSFDForInputTexture:outLuma:outChroma:renderROI:]";
      LODWORD(v24) = 12;
      v23 = &v29;
      _os_log_send_and_compose_impl();
    }
    goto LABEL_27;
  }
  ++self->_runs;
  [(LearnedNRNetworkShared *)self->_shared getTileCount];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __79__LearnedNRNetworkStage_processSFDForInputTexture_outLuma_outChroma_renderROI___block_invoke;
  v25[3] = &unk_2655C72A8;
  v25[4] = self;
  int v18 = -[CMITiledInferenceProcessor runWithTileCount:withCompletionHandler:](tiledInferenceProcessor, "runWithTileCount:withCompletionHandler:", v25);
LABEL_15:
  -[LearnedNRNetworkShared setInputRawTexture:](self->_shared, "setInputRawTexture:", 0, v23, v24);
  [(LearnedNRNetworkPostANEStage *)self->_postStage setOutputLumaTexture:0];
  [(LearnedNRNetworkPostANEStage *)self->_postStage setOutputChromaTexture:0];

  return v18;
}

uint64_t __79__LearnedNRNetworkStage_processSFDForInputTexture_outLuma_outChroma_renderROI___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    ++*(void *)(*(void *)(result + 32) + 88);
  }
  ++*(void *)(*(void *)(result + 32) + 80);
  return result;
}

- (int)resetFinalProcessingStatus
{
  self->_runs = 0;
  self->_completions = 0;
  self->_errorCount = 0;
  return 0;
}

- (int)getFinalProcessingStatus
{
  if (!self->_errorCount && self->_completions == self->_runs) {
    return 0;
  }
  v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  int v2 = -73356;
  fig_log_call_emit_and_clean_up_after_send_and_compose();

  return v2;
}

- (int)convertYUV420toRGB:(id)a3 luma:(id)a4 chroma:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  shared = self->_shared;
  if (!shared)
  {
    int v24 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    int v17 = -73356;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_9:

    goto LABEL_5;
  }
  id v12 = [(LearnedNRNetworkShared *)shared metal];
  v13 = [v12 commandQueue];
  uint64_t v14 = [v13 commandBuffer];

  if (!v14)
  {
    FigDebugAssert3();
    int v17 = FigSignalErrorAt();
    goto LABEL_5;
  }
  uint64_t v15 = [v14 computeCommandEncoder];
  if (!v15)
  {
    int v24 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    int v17 = -73356;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_9;
  }
  long long v16 = v15;
  [v15 setLabel:@"convertYUV420toRGB"];
  [v16 setComputePipelineState:self->_shaders->_convertYUV420toRGB];
  [v16 setTexture:v9 atIndex:0];
  [v16 setTexture:v10 atIndex:1];
  [v16 setTexture:v8 atIndex:2];
  v22[0] = [v8 width];
  v22[1] = [v8 height];
  v22[2] = 1;
  int64x2_t v20 = vdupq_n_s64(0x10uLL);
  uint64_t v21 = 1;
  [v16 dispatchThreads:v22 threadsPerThreadgroup:&v20];
  [v16 endEncoding];
  [v14 commit];

  int v17 = 0;
LABEL_5:

  return v17;
}

- (int)setupTiledInferenceProcessor
{
  v23[20] = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  v4 = [(LearnedNRNetworkStage *)self getNetworkPath];
  [v3 setNetworkPath:v4];

  v5 = [v3 networkPath];

  if (!v5) {
    goto LABEL_10;
  }
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&kSFDNetworkInputs count:1];
  [v3 setNetworkInputNames:v6];

  BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&kSFDNetworkOutputs count:1];
  [v3 setNetworkOutputNames:v7];

  id v8 = objc_opt_new();
  if (!v8)
  {
LABEL_10:
    id v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    int v20 = -73356;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_16:

    goto LABEL_9;
  }
  id v9 = v8;
  if (!self->_preStage
    || (-[NSObject setPreInferenceStage:](v8, "setPreInferenceStage:"),
        [v9 setNetworkConfig:v3],
        !self->_postStage)
    || (-[NSObject setPostInferenceStage:](v9, "setPostInferenceStage:"), (uint64_t v10 = objc_opt_new()) == 0))
  {
    id v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    int v20 = -73356;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_15:

    goto LABEL_16;
  }
  id v11 = v10;
  v23[0] = v9;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  [v11 setPipeline:v12];

  [v11 setBufferCount:2];
  id v13 = objc_alloc(MEMORY[0x263F2EDE0]);
  uint64_t v14 = [(LearnedNRNetworkShared *)self->_shared metal];
  uint64_t v15 = [v14 commandQueue];
  long long v16 = (void *)[v13 initWithCommandQueue:v15];

  if (!v16)
  {
    unsigned int v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    int v20 = -73356;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_15;
  }
  int v17 = [v16 loadWithConfig:v11];
  if (v17)
  {
    int v20 = v17;
    FigDebugAssert3();

    goto LABEL_15;
  }
  tiledInferenceProcessor = self->_tiledInferenceProcessor;
  self->_tiledInferenceProcessor = (CMITiledInferenceProcessor *)v16;
  id v19 = v16;

  int v20 = 0;
LABEL_9:

  return v20;
}

- (int)updateParametersFromMetadata:(id)a3 bayerPattern:(id)a4 lscGainMapBuffer:(__CVBuffer *)a5 lscGainMapParameters:(id)a6
{
  uint64_t v135 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v123 = a6;
  v125 = v9;
  if (!v9 || !v10)
  {
    unsigned int v128 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v97 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT);
    int v96 = -73356;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_77:
    v77 = 0;
    v75 = 0;
    v39 = 0;
    v27 = 0;
LABEL_80:
    v65 = v123;
    goto LABEL_81;
  }
  uint64_t v11 = *MEMORY[0x263F2F5E0];
  int v12 = objc_msgSend(v9, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F5E0], 0, 0);
  BOOL v13 = v12 == 1;
  if (v13 != [(LearnedNRNetworkShared *)self->_shared isQuadra])
  {
    [(LearnedNRNetworkShared *)self->_shared setIsQuadra:v12 == 1];
    int v14 = [(LearnedNRNetworkStage *)self setupTiledInferenceProcessor];
    if (v14)
    {
      int v96 = v14;
      goto LABEL_77;
    }
  }
  uint64_t v121 = v11;
  uint64_t v15 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F2E0]];
  long long v16 = v15;
  if (v15) {
    int v17 = [v15 shortValue];
  }
  else {
    int v17 = 4096;
  }
  v124 = v10;
  int v18 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F2D8]];

  if (v18) {
    int v19 = [v18 shortValue];
  }
  else {
    int v19 = 4096;
  }
  int v20 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F2D0]];

  if (v20) {
    int v21 = [v20 shortValue];
  }
  else {
    int v21 = 4096;
  }
  unsigned int v22 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F4F8]];

  if (v22) {
    int v23 = [v22 shortValue];
  }
  else {
    int v23 = 4096;
  }
  int v24 = [v125 objectForKeyedSubscript:*MEMORY[0x263F2F388]];

  if (v24) {
    unsigned __int16 v119 = [v24 intValue];
  }
  else {
    unsigned __int16 v119 = 0;
  }
  uint64_t v25 = [v125 objectForKeyedSubscript:*MEMORY[0x263F2F638]];

  if (v25) {
    int v26 = [v25 BOOLValue];
  }
  else {
    int v26 = 0;
  }
  v27 = [v125 objectForKeyedSubscript:*MEMORY[0x263F2F630]];

  if (v27
    || ([v125 objectForKeyedSubscript:*MEMORY[0x263F2F460]],
        (v27 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v27 floatValue];
    float v29 = v28;
  }
  else
  {
    float v29 = 1.0;
  }
  [(LearnedNRNetworkStage *)self _estimateGainFromMetadata:v125 considerHighlightCompression:self->_tuningParams->considerHighlightCompression];
  float v31 = v30;
  if (v26) {
    float v31 = exp2f(-v29) * v30;
  }
  v32 = [(LearnedNRNetworkShared *)self->_shared framePropertiesAddress];
  *(float *)v33.i32 = (float)v23 * 0.00024414;
  __asm { FMOV            V3.4S, #1.0 }
  _Q3.f32[0] = (float)v17 / (float)v19;
  _Q3.f32[2] = (float)v21 / (float)v19;
  *(float32x4_t *)&v32->var0.transferFunctionFwd.linearScale = vdivq_f32(_Q3, (float32x4_t)vdupq_lane_s32(v33, 0));
  v39 = [v125 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
  id v10 = v124;
  int v40 = [v124 intValue];
  if (v12 == 1)
  {
    int v41 = 5;
    if (v40 != 5 && v40 != 8) {
      goto LABEL_79;
    }
  }
  else
  {
    int v41 = 3;
    if (v40 && v40 != 3) {
      goto LABEL_79;
    }
  }
  BYTE2(v32[2].var5) = v40 == v41;
  uint64_t v42 = *MEMORY[0x263F2F608];
  id v43 = v125;
  v44 = [v43 objectForKeyedSubscript:v42];
  [v44 floatValue];
  float v46 = v45 * 0.000015259;

  v47 = [v43 objectForKeyedSubscript:*MEMORY[0x263F2F610]];
  [v47 floatValue];
  float v49 = v48 * 0.000015259;

  v50 = [v43 objectForKeyedSubscript:*MEMORY[0x263F2F408]];
  [v50 floatValue];
  float v52 = v51 * 0.000015259;

  v53 = [v43 objectForKeyedSubscript:*MEMORY[0x263F2F2C0]];

  float v54 = (float)(int)[v53 intValue] * 0.0039062;
  float v55 = sqrtf((float)((float)(v46 * v46) - (float)(v49 * v49)) / 0.98438);
  float v56 = sqrtf((float)(v46 * v46) - (float)(v55 * v55));
  float v57 = v52 * v54;
  float v58 = (float)(v52 * v54)
      * (float)((float)(v52 * v54) * (float)((float)((float)(v55 / v54) * (float)(v55 / v54)) + (float)(v56 * v56)));
  v59.f32[0] = v58;
  v59.f32[1] = v52 * v54;
  uint32x2_t v60 = (uint32x2_t)vcgt_f32(v59, (float32x2_t)vdup_n_s32(0x358637BDu));
  if ((vpmin_u32(v60, v60).u32[0] & 0x80000000) == 0)
  {
    FigDebugAssert3();
    unsigned int v128 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v98 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT);
LABEL_100:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v77 = 0;
    v75 = 0;
    goto LABEL_119;
  }
  if (!self->_tuningParams)
  {
LABEL_79:
    unsigned int v128 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v99 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT);
    int v96 = -73356;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v77 = 0;
    v75 = 0;
    goto LABEL_80;
  }
  LOBYTE(v32[2].var5) = v13;
  *(void *)&v32[2].var3 = 0x3D80000041800000;
  v32[2].var0.transferFunctionInv.nonLinearBias = sqrtf(v58) / v57;
  v32[2].var0.transferFunctionInv.nonLinearPower = v57;
  v32[2].var0.finalScaleFwd = interpolate_with_gain(self->_tuningParams->readNoiseModulationTuning, v31)
                            * v32[2].var0.transferFunctionInv.nonLinearBias;
  v32[2].var0.finalScale = interpolate_with_gain(self->_tuningParams->shotNoiseModulationTuning, v31)
                         * v32[2].var0.transferFunctionInv.nonLinearPower;
  v32[2].var0.chromaBias = interpolate_with_gain(self->_tuningParams->lumaAddBackTuning, v31);
  *(float *)&v32[2].var0.outputToLinearYCbCr = interpolate_with_gain(self->_tuningParams->lumaAddBackBand0Tuning, v31);
  float v61 = interpolate_with_gain(self->_tuningParams->lumaAddBackClipToSNRTuning, v31);
  uint64_t v62 = 0;
  v32[2].var1 = v61;
  *(_OWORD *)&v32[1].var0.outputToLinearYCbCr = xmmword_26337FFE0;
  *(_OWORD *)&v32[1].var4 = xmmword_26337FFF0;
  *(void *)&v32[1].var8 = 0x3F80000000000000;
  long long v132 = xmmword_263380000;
  long long v133 = xmmword_263380010;
  simd_float4 v129 = 0u;
  simd_float4 v130 = 0u;
  simd_float4 v131 = 0u;
  long long v134 = xmmword_263380020;
  do
  {
    *(float32x4_t *)((char *)&v129 + v62) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_263380030, COERCE_FLOAT(*(long long *)((char *)&v132 + v62))), (float32x4_t)xmmword_263380040, *(float32x2_t *)((char *)&v132 + v62), 1), (float32x4_t)xmmword_263380050, *(float32x4_t *)((char *)&v132 + v62), 2);
    v62 += 16;
  }
  while (v62 != 48);
  v136.columns[0] = v129;
  v136.columns[1] = v130;
  v136.columns[2] = v131;
  *(simd_float4 *)&v32->var3 = v129;
  *(simd_float4 *)&v32->var7 = v136.columns[1];
  *(simd_float4 *)&v32->var11 = v136.columns[2];
  v136.columns[3] = (simd_float4)xmmword_263380060;
  simd_float4x4 v137 = __invert_f4(v136);
  *(simd_float4 *)&v32->var0.transferFunctionFwd.nonLinearPower = v137.columns[0];
  *(simd_float4 *)&v32->var0.transferFunctionInv.nonLinearBias = v137.columns[1];
  *(simd_float4 *)&v32->var0.chromaBias = v137.columns[2];
  v32[1].var10 = 1.0 / v32[1].var11;
  uint64_t v63 = MEMORY[0x263EF89A0];
  v137.columns[1] = *(simd_float4 *)(MEMORY[0x263EF89A0] + 16);
  *(_OWORD *)&v32[1].var0.transferFunctionFwd.linearThreshold = *MEMORY[0x263EF89A0];
  *(simd_float4 *)&v32[1].var0.transferFunctionInv.linearScale = v137.columns[1];
  *(_OWORD *)&v32[1].var0.transferFunctionInv.nonLinearPower = *(_OWORD *)(v63 + 32);
  *(void *)&v32[1].var11 = 0x3F0000003F800000;
  *(_DWORD *)&v32[1].var13 = 0x10000;
  v64 = [v43 objectForKeyedSubscript:*MEMORY[0x263F2F6D0]];

  v65 = v123;
  if (v64)
  {
    int v66 = [v64 intValue];
    if (v66 == 3)
    {
      *(_OWORD *)&v32[1].var0.outputToLinearYCbCr = xmmword_263380070;
      *(_OWORD *)&v32[1].var4 = xmmword_263380080;
      *(void *)&v32[1].var8 = 0x4019999A3D6147AELL;
      *(_OWORD *)&v32->var3 = xmmword_263380090;
      *(_OWORD *)&v32->var7 = xmmword_2633800A0;
      *(_OWORD *)&v32->var11 = xmmword_2633800B0;
      v32[1].var11 = 0.99112;
      simd_float4x4 v138 = __invert_f4(*(simd_float4x4 *)_PromotedConst);
      *(simd_float4 *)&v32->var0.transferFunctionFwd.nonLinearPower = v138.columns[0];
      *(simd_float4 *)&v32->var0.transferFunctionInv.nonLinearBias = v138.columns[1];
      *(simd_float4 *)&v32->var0.chromaBias = v138.columns[2];
      *(&v32[1].var15 + 1) = 1;
    }
    else
    {
      if (v66 == 2)
      {
        uint64_t v70 = 0;
        *(_OWORD *)&v32[1].var0.outputToLinearYCbCr = xmmword_2633800C0;
        *(_OWORD *)&v32[1].var4 = xmmword_2633800D0;
        *(void *)&v32[1].var8 = 0x400E38E43DCAC083;
        float v71 = (float)v119 / 65535.0;
        v72.i32[1] = 0;
        v72.i32[2] = 0;
        v72.f32[0] = 1.0 / (float)(1.0 - v71);
        long long v132 = xmmword_263380000;
        long long v133 = xmmword_263380010;
        long long v134 = xmmword_263380020;
        simd_float4 v129 = 0u;
        simd_float4 v130 = 0u;
        simd_float4 v131 = 0u;
        do
        {
          v72.f32[3] = -(float)(v71 * v72.f32[0]);
          *(float32x4_t *)((char *)&v129 + v70) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v72, COERCE_FLOAT(*(long long *)((char *)&v132 + v70))), (float32x4_t)xmmword_263380040, *(float32x2_t *)((char *)&v132 + v70), 1), (float32x4_t)xmmword_263380050, *(float32x4_t *)((char *)&v132 + v70), 2);
          v70 += 16;
        }
        while (v70 != 48);
      }
      else
      {
        if (v66) {
          goto LABEL_51;
        }
        uint64_t v67 = 0;
        *(_OWORD *)&v32[1].var0.outputToLinearYCbCr = xmmword_26337FFE0;
        *(_OWORD *)&v32[1].var4 = xmmword_26337FFF0;
        *(void *)&v32[1].var8 = 0x3F80000000000000;
        float v68 = (float)v119 / 65535.0;
        v69.i32[1] = 0;
        v69.i32[2] = 0;
        v69.f32[0] = 1.0 / (float)(1.0 - v68);
        long long v132 = xmmword_263380000;
        long long v133 = xmmword_263380010;
        long long v134 = xmmword_263380020;
        simd_float4 v129 = 0u;
        simd_float4 v130 = 0u;
        simd_float4 v131 = 0u;
        do
        {
          v69.f32[3] = -(float)(v68 * v69.f32[0]);
          *(float32x4_t *)((char *)&v129 + v67) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v69, COERCE_FLOAT(*(long long *)((char *)&v132 + v67))), (float32x4_t)xmmword_263380040, *(float32x2_t *)((char *)&v132 + v67), 1), (float32x4_t)xmmword_263380050, *(float32x4_t *)((char *)&v132 + v67), 2);
          v67 += 16;
        }
        while (v67 != 48);
      }
      v139.columns[0] = v129;
      v139.columns[1] = v130;
      v139.columns[2] = v131;
      *(simd_float4 *)&v32->var3 = v129;
      *(simd_float4 *)&v32->var7 = v139.columns[1];
      *(simd_float4 *)&v32->var11 = v139.columns[2];
      v139.columns[3] = (simd_float4)xmmword_263380060;
      simd_float4x4 v140 = __invert_f4(v139);
      *(simd_float4 *)&v32->var0.transferFunctionFwd.nonLinearPower = v140.columns[0];
      *(simd_float4 *)&v32->var0.transferFunctionInv.nonLinearBias = v140.columns[1];
      *(simd_float4 *)&v32->var0.chromaBias = v140.columns[2];
    }
  }
LABEL_51:
  __asm { FMOV            V8.2S, #1.0 }
  *(float32x2_t *)&v32[1].var10 = _D8;
  v32[1].var15 = 0;
  v74 = [(NSDictionary *)self->_cameraInfoByPortType objectForKeyedSubscript:v39];
  if (!v74)
  {
    v27 = v64;
    FigDebugAssert3();
    unsigned int v128 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v98 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT);
    goto LABEL_100;
  }
  v75 = v74;
  v76 = [v74 objectForKeyedSubscript:*MEMORY[0x263F2F758]];
  if (!v76)
  {
    v27 = v64;
    FigDebugAssert3();
    unsigned int v128 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v101 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v77 = 0;
LABEL_119:
    int v96 = -12780;
    goto LABEL_80;
  }
  v77 = v76;
  char v126 = 0;
  unsigned int v78 = objc_msgSend(v76, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2EF50], 0, &v126);
  if (!v126)
  {
    v27 = v64;
    FigDebugAssert3();
    unsigned int v128 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v102 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v103 = v128;
    if (os_log_type_enabled(v102, type)) {
      unsigned int v104 = v103;
    }
    else {
      unsigned int v104 = v103 & 0xFFFFFFFE;
    }
    if (v104)
    {
      LODWORD(v132) = 136315138;
      *(void *)((char *)&v132 + 4) = "-[LearnedNRNetworkStage updateParametersFromMetadata:bayerPattern:lscGainMapBuffe"
                                       "r:lscGainMapParameters:]";
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_119;
  }
  unsigned int v79 = v78;
  v118 = v64;
  v120 = v75;
  v80 = v39;
  unsigned int v81 = objc_msgSend(v77, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2EF38], 0, &v126);
  if (!v126)
  {
    FigDebugAssert3();
    unsigned int v128 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v105 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v106 = v128;
    if (os_log_type_enabled(v105, type)) {
      unsigned int v107 = v106;
    }
    else {
      unsigned int v107 = v106 & 0xFFFFFFFE;
    }
    if (v107)
    {
      LODWORD(v132) = 136315138;
      *(void *)((char *)&v132 + 4) = "-[LearnedNRNetworkStage updateParametersFromMetadata:bayerPattern:lscGainMapBuffe"
                                       "r:lscGainMapParameters:]";
      _os_log_send_and_compose_impl();
    }
    v75 = v120;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v96 = -12780;
    v27 = v64;
    goto LABEL_80;
  }
  unsigned int v82 = v81;
  int v83 = objc_msgSend(v43, "cmi_unsignedIntValueForKey:defaultValue:found:", v121, 1, &v126);
  int v84 = v83;
  if (!LOBYTE(v32[2].var5) || v126 && v83 == 1)
  {
    int CGRectIfPresent = FigCFDictionaryGetCGRectIfPresent();
    char v86 = FigCFDictionaryGetCGRectIfPresent();
    int32x2_t v87 = 0;
    if (CGRectIfPresent && (v86 & 1) != 0)
    {
      id v10 = v124;
      if ((_WORD)v79 && (_WORD)v82)
      {
        *(float *)v87.i32 = (float)v84;
        _D8 = vdiv_f32((float32x2_t)vdup_lane_s32(v87, 0), vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)__PAIR64__(v82, v79), (int8x8_t)0xFFFF0000FFFFLL)));
        int32x2_t v87 = (int32x2_t)vmul_f32(_D8, vcvt_f32_f64(vaddq_f64(vdivq_f64((float64x2_t)0, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v84), 0)), (float64x2_t)0)));
      }
    }
    else
    {
      id v10 = v124;
    }
    *(float32x2_t *)&v32[2].var0.transferFunctionFwd.nonLinearScale = _D8;
    *(int32x2_t *)&v32[2].var0.transferFunctionFwd.nonLinearPower = v87;
    v32[2].var0.transferFunctionInv.nonLinearScale = 1.0;
    v27 = [v43 objectForKeyedSubscript:*MEMORY[0x263F2F538]];

    if (v27)
    {
      [v27 floatValue];
      v32[2].var0.transferFunctionInv.nonLinearScale = v88;
    }
    v39 = v80;
    if (a5 && v123)
    {
      v75 = v120;
      if (CVPixelBufferGetPixelFormatType(a5) != 1380411457)
      {
        unsigned int v128 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v108 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v114 = v128;
        if (os_log_type_enabled(v108, type)) {
          unsigned int v115 = v114;
        }
        else {
          unsigned int v115 = v114 & 0xFFFFFFFE;
        }
        if (!v115) {
          goto LABEL_117;
        }
        LODWORD(v132) = 136315138;
        *(void *)((char *)&v132 + 4) = "-[LearnedNRNetworkStage updateParametersFromMetadata:bayerPattern:lscGainMapBuf"
                                         "fer:lscGainMapParameters:]";
        goto LABEL_116;
      }
      v89 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a5 pixelFormat:115 usage:1 plane:0];
      [(LearnedNRNetworkShared *)self->_shared setInputLSCGainsTexture:v89];

      v90 = [v123 objectForKeyedSubscript:*MEMORY[0x263F2F7E8]];
      v91 = v90;
      if (v90)
      {
        [(LSCGainsPlist *)v90 floatValue];
LABEL_74:
        v32[2].var0.transferFunctionInv.linearThreshold = v92;

        v95 = [(LearnedNRNetworkShared *)self->_shared inputLSCGainsTexture];

        if (v95)
        {
          int v96 = 0;
          goto LABEL_81;
        }
        unsigned int v128 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v108 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v109 = v128;
        if (os_log_type_enabled(v108, type)) {
          unsigned int v110 = v109;
        }
        else {
          unsigned int v110 = v109 & 0xFFFFFFFE;
        }
        if (!v110)
        {
LABEL_117:
          int v96 = -73356;
          fig_log_call_emit_and_clean_up_after_send_and_compose();

          goto LABEL_80;
        }
        LODWORD(v132) = 136315138;
        *(void *)((char *)&v132 + 4) = "-[LearnedNRNetworkStage updateParametersFromMetadata:bayerPattern:lscGainMapBuf"
                                         "fer:lscGainMapParameters:]";
LABEL_116:
        _os_log_send_and_compose_impl();
        goto LABEL_117;
      }
    }
    else
    {
      v93 = [[LSCGainsPlist alloc] initWithDictionary:self->_cameraInfoByPortType metal:self->_metal];
      v75 = v120;
      if (!v93)
      {
        unsigned int v128 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v108 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v116 = v128;
        if (os_log_type_enabled(v108, type)) {
          unsigned int v117 = v116;
        }
        else {
          unsigned int v117 = v116 & 0xFFFFFFFE;
        }
        if (!v117) {
          goto LABEL_117;
        }
        LODWORD(v132) = 136315138;
        *(void *)((char *)&v132 + 4) = "-[LearnedNRNetworkStage updateParametersFromMetadata:bayerPattern:lscGainMapBuf"
                                         "fer:lscGainMapParameters:]";
        goto LABEL_116;
      }
      v91 = v93;
      v94 = [(LSCGainsPlist *)v93 getTextureForPortType:v39];
      [(LearnedNRNetworkShared *)self->_shared setInputLSCGainsTexture:v94];
    }
    float v92 = 1.0;
    goto LABEL_74;
  }
  FigDebugAssert3();
  unsigned int v128 = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  v111 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  unsigned int v112 = v128;
  if (os_log_type_enabled(v111, type)) {
    unsigned int v113 = v112;
  }
  else {
    unsigned int v113 = v112 & 0xFFFFFFFE;
  }
  if (v113)
  {
    LODWORD(v132) = 136315138;
    *(void *)((char *)&v132 + 4) = "-[LearnedNRNetworkStage updateParametersFromMetadata:bayerPattern:lscGainMapBuffer:"
                                     "lscGainMapParameters:]";
    _os_log_send_and_compose_impl();
  }
  v39 = v80;
  fig_log_call_emit_and_clean_up_after_send_and_compose();

  int v96 = -12780;
  v27 = v118;
  v65 = v123;
  v75 = v120;
LABEL_81:

  return v96;
}

- (float)_estimateGainFromMetadata:(id)a3 considerHighlightCompression:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = [(LearnedNRNetworkShared *)self->_shared isQuadra];
  LODWORD(v8) = 1.0;
  objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2C0], 0, v8);
  float v10 = v9 * 0.0039062;
  LODWORD(v11) = 1.0;
  objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F700], 0, v11);
  float v13 = v12 * 0.0039062;
  LODWORD(v14) = 1.0;
  objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F6E8], 0, v14);
  float v16 = v15 * 0.0039062;
  LODWORD(v17) = 1166016512;
  objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F4F8], 0, v17);
  float v19 = v10 * v13;
  float v20 = v19 * v16;
  if (!v7) {
    goto LABEL_61;
  }
  float v21 = v18;
  unsigned int v22 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2F550]];
  if (!v22)
  {
    FigDebugAssert3();
    int v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_75:

    goto LABEL_61;
  }
  int v23 = v22;
  uint64_t v24 = [v23 bytes];
  if (!v24
    || (uint64_t v25 = (unsigned __int16 *)v24, *(_DWORD *)v24 != 1)
    || (unint64_t v26 = *(unsigned __int16 *)(v24 + 20), v26 >= 0x21)
    || (unint64_t v27 = *(unsigned __int16 *)(v24 + 22), v27 >= 0x21)
    || *(_WORD *)(v24 + 24) != 68
    || 136 * (v26 * v27) + 32 != *(_DWORD *)(v24 + 4)
    || ([v6 objectForKeyedSubscript:*MEMORY[0x263F2F380]],
        (float v28 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v92 = v6;
    FigDebugAssert3();
    float v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_70:

    id v6 = v92;
    goto LABEL_61;
  }
  float v29 = v28;
  if ([v28 count] != 65
    || ([v6 objectForKeyedSubscript:*MEMORY[0x263F2F4D8]],
        (float v30 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v92 = v6;
    FigDebugAssert3();
    v93 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_70;
  }
  id v31 = v30;
  if ([v30 length] != 516
    || (v100 = self, id v31 = v31, (v32 = (_WORD *)[v31 bytes]) == 0)
    || (v34 = v32, *v32 != 257))
  {
    id v94 = v6;
    FigDebugAssert3();
    v95 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT);
LABEL_72:
    id v6 = v94;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_75;
  }
  long long v102 = 0u;
  LODWORD(v33) = 964689920;
  memset(v101, 0, sizeof(v101));
  uint64_t v35 = v25[11];
  if (v25[11])
  {
    int v36 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = v25[10];
    int v39 = v38 * v25[12];
    uint64_t v40 = 2 * v25[12];
    do
    {
      if (v38)
      {
        uint64_t v41 = 0;
        uint64_t v42 = (uint64_t)&v25[v36 + 18];
        do
        {
          uint64_t v43 = 0;
          v44 = (uint32x4_t *)v101;
          do
          {
            uint16x8_t v45 = *(uint16x8_t *)(v42 + v43);
            uint32x4_t v46 = vaddw_u16(*v44, *(uint16x4_t *)v45.i8);
            uint32x4_t v47 = vaddw_high_u16(v44[1], v45);
            uint32x4_t *v44 = v46;
            v44[1] = v47;
            v44 += 2;
            v43 += 16;
          }
          while (v43 != 128);
          ++v41;
          v42 += v40;
        }
        while (v41 != v38);
      }
      ++v37;
      v36 += v39;
    }
    while (v37 != v35);
  }
  uint64_t v48 = 0;
  int v49 = 0;
  float v50 = v21 * 0.00024414;
  do
  {
    v49 += *(_DWORD *)((char *)v101 + v48);
    *(_DWORD *)((char *)v101 + v48) = v49;
    v48 += 4;
  }
  while (v48 != 256);
  uint64_t v51 = 0;
  unsigned int v52 = (HIDWORD(v102) + 1) >> 1;
  while (*((_DWORD *)v101 + v51) < v52)
  {
    if (++v51 == 64) {
      goto LABEL_33;
    }
  }
  v53 = v29;
  if (v51 || LODWORD(v101[0]) < v52)
  {
    if (!v51)
    {
      FigDebugAssert3();
      v98 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      goto LABEL_74;
    }
LABEL_33:
    float v55 = (float)*((unsigned int *)v101 + (v51 - 1));
    float v56 = (float)*((unsigned int *)v101 + v51);
    if (v56 <= v55 || (float v57 = (float)v52, (float)v52 < v55) || v57 > v56)
    {
      id v94 = v6;
      FigDebugAssert3();
      v95 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT);
      goto LABEL_72;
    }
    v53 = v29;
    *(float *)&double v33 = (float)((float)v51 + -0.5) + (float)((float)(v57 - v55) / (float)(v56 - v55));
    float v54 = *(float *)&v33 * 0.015625;
  }
  else
  {
    float v54 = 0.0078125;
  }
  float v58 = objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x263F2F080], v33);
  float32x2_t v59 = v58;
  float v60 = v54;
  if (v4)
  {
    float v60 = v54;
    if (v58)
    {
      if ([v58 count] != 257)
      {
        FigDebugAssert3();
        v99 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        goto LABEL_61;
      }
      objc_msgSend(v59, "cmi_floatValueForIndex:", 0);
      float v62 = v61;
      objc_msgSend(v59, "cmi_floatValueForIndex:", 1);
      float v64 = v63 / 65535.0;
      if (v54 <= v64)
      {
        float v68 = 1.0;
        float v66 = v62 / 65535.0;
LABEL_46:
        float v69 = 0.5;
        if (v64 > v66) {
          float v69 = (float)(v54 - v66) / (float)(v64 - v66);
        }
        float v60 = (float)((float)(v69 + v68) + -1.0) * 0.0039062;
      }
      else
      {
        uint64_t v65 = 2;
        while (v65 != 257)
        {
          float v66 = v64;
          objc_msgSend(v59, "cmi_floatValueForIndex:", v65);
          float v64 = v67 / 65535.0;
          ++v65;
          if (v54 <= v64)
          {
            float v68 = (float)(v65 - 1);
            goto LABEL_46;
          }
        }
        float v60 = v54;
      }
    }
  }
  if (v54 < 0.0 || v54 > 1.0)
  {
    FigDebugAssert3();
    int v96 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_74:
    goto LABEL_75;
  }
  float v71 = v31;
  float32x4_t v72 = v23;
  float v73 = fminf(floorf(v54 * 64.0), 63.0);
  float v74 = (float)(v54 * 64.0) - v73;
  int v75 = (int)v73;
  v76 = [v53 objectAtIndexedSubscript:(int)v73];
  [v76 floatValue];
  float v78 = v77 / 65535.0;

  unsigned int v79 = [v53 objectAtIndexedSubscript:v75 + 1];
  [v79 floatValue];
  float v81 = v80 / 65535.0;

  float v83 = v78 + (float)(v74 * (float)(v81 - v78));
  if (v83 < 0.0 || v83 > 1.0)
  {
    FigDebugAssert3();
    v97 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    HIWORD(v85) = 17279;
    *(float *)&unsigned int v86 = fminf(floorf(v83 * 256.0), 255.0);
    float v87 = (float)(v83 * 256.0) - *(float *)&v86;
    float v88 = &v34[*(float *)&v86];
    LOWORD(v86) = v88[1];
    LOWORD(v85) = v34[257];
    LOWORD(v82) = v88[2];
    float v89 = v19
        * (float)((float)((float)((float)v86 / (float)v85)
                        + (float)(v87 * (float)((float)((float)v82 / (float)v85) - (float)((float)v86 / (float)v85))))
                / v60);
    float v90 = 1.0;
    if (v100->_deviceGeneration > 199) {
      float v90 = v50;
    }
    float v20 = v89 / v90;
  }
LABEL_61:

  return v20;
}

- (id)getNetworkPath
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v3 = (void *)CFPreferencesCopyAppValue(@"learnednr_network_override", @"com.apple.coremedia");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_2;
  }
  v5 = [(LearnedNRNetworkStage *)self platformIdentifier];
  if (v5 && (uint64_t ModelSpecificName = FigCaptureGetModelSpecificName()) != 0)
  {
    BOOL v7 = (void *)ModelSpecificName;
    double v8 = [NSString stringWithFormat:@"^.+(\\.|_)(%@|%@)(\\.|_).+$", v5, ModelSpecificName];
    if (FigCapturePlatformGetVariant() == 3)
    {
      id v9 = [NSString stringWithFormat:@"^.+(\\.|_)(%@G|%@)(\\.|_).+$", v5, v7];
    }
    else
    {
      id v9 = v8;
    }
    id v10 = v9;
    uint64_t v48 = v8;
    uint64_t v11 = [objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:v8 options:1 error:0];
    uint32x4_t v47 = v10;
    uint64_t v12 = [objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:v10 options:1 error:0];
    float v13 = (void *)v12;
    uint64_t v51 = (void *)v11;
    if (!v11 || !v12)
    {
      uint64_t v14 = v12;
      unsigned int v57 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      float v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      float v13 = (void *)v14;
    }
    float v50 = v5;
    BOOL v16 = [(LearnedNRNetworkShared *)self->_shared isQuadra];
    double v17 = @"learnednoisereduction-v3";
    if (v16) {
      double v17 = @"learnednoisereduction-quadra-v2";
    }
    float v18 = v17;
    BOOL v19 = [(LearnedNRNetworkShared *)self->_shared isQuadra];
    float v20 = @".net";
    if (v19) {
      float v20 = @".bundle";
    }
    float v21 = v20;
    unsigned int v22 = [(LearnedNRNetworkStage *)self availableImagingNetworksWithExtension:v21];
    int v23 = [(__CFString *)v21 isEqualToString:@".bundle"];
    uint64_t v24 = v51;
    int v49 = v13;
    if (v23) {
      uint64_t v24 = v13;
    }
    id v25 = v24;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v26 = v22;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v53;
LABEL_19:
      uint64_t v30 = 0;
      while (1)
      {
        if (*(void *)v53 != v29) {
          objc_enumerationMutation(v26);
        }
        id v31 = *(void **)(*((void *)&v52 + 1) + 8 * v30);
        if ([v31 hasPrefix:v18])
        {
          if (objc_msgSend(v25, "numberOfMatchesInString:options:range:", v31, 0, 0, objc_msgSend(v31, "length"))) {
            break;
          }
        }
        if (v28 == ++v30)
        {
          uint64_t v28 = [v26 countByEnumeratingWithState:&v52 objects:v58 count:16];
          if (v28) {
            goto LABEL_19;
          }
          goto LABEL_26;
        }
      }
      id v35 = v31;

      if (!v35) {
        goto LABEL_27;
      }
      int v36 = NSString;
      id v37 = v35;
      uint64_t v38 = objc_msgSend(v36, "stringWithFormat:", @"%s/%s", "/System/Library/ImagingNetworks", objc_msgSend(v37, "UTF8String"));

      int v39 = 0;
      id v3 = (void *)v38;
      uint64_t v41 = v47;
      uint64_t v40 = v48;
    }
    else
    {
LABEL_26:

LABEL_27:
      unsigned int v57 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v33 = v57;
      if (os_log_type_enabled(v32, type)) {
        unsigned int v34 = v33;
      }
      else {
        unsigned int v34 = v33 & 0xFFFFFFFE;
      }
      if (v34)
      {
        int v59 = 136315138;
        float v60 = "-[LearnedNRNetworkStage getNetworkPath]";
        _os_log_send_and_compose_impl();
      }
      uint64_t v41 = v47;
      uint64_t v40 = v48;
      int v39 = -73356;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v5 = v50;
  }
  else
  {
    unsigned int v57 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v44 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
    int v39 = -73356;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!v39) {
LABEL_2:
  }
    BOOL v4 = v3;
  else {
    BOOL v4 = 0;
  }
  id v42 = v4;

  return v42;
}

- (id)platformIdentifier
{
  int v2 = (void *)FigCapturePlatformIdentifierString();

  return v2;
}

- (id)availableImagingNetworksWithExtension:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  v5 = [MEMORY[0x263F08850] defaultManager];
  id v19 = 0;
  id v6 = [v5 contentsOfDirectoryAtPath:@"/System/Library/ImagingNetworks" error:&v19];
  id v7 = v19;

  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          float v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v13, "hasSuffix:", v3, (void)v15)) {
            [v4 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }
  }
  if (!objc_msgSend(v4, "count", (void)v15))
  {

    BOOL v4 = 0;
  }

  return v4;
}

- (LearnedNRNetworkTuningParams)tuningParams
{
  return self->_tuningParams;
}

- (void)setTuningParams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuningParams, 0);
  objc_storeStrong((id *)&self->_tiledInferenceProcessor, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_postStage, 0);
  objc_storeStrong((id *)&self->_preStage, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_shared, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end