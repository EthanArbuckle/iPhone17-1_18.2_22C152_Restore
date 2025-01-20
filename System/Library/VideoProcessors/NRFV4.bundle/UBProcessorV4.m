@interface UBProcessorV4
- (BOOL)_isGainMapSupported;
- (BOOL)_isMetadataConsistentWithFirstFrame;
- (BOOL)_isSemanticStylesSupported;
- (BOOL)doRedFaceFix;
- (BOOL)enableGreenGhostMitigation;
- (BOOL)learnedNREnabled;
- (BOOL)referenceFrameHasEVMinus;
- (BOOL)sanityCheckHomographyForBracketIndex:(int)a3;
- (BOOL)shouldDownsampleRWPPInputWithPixelFormat:(unsigned int)a3 processingType:(unsigned int)a4;
- (BOOL)skipDenoising;
- (BOOL)srlEnabled;
- (BOOL)stfAllowed;
- (CGRect)_downscaleRoiForRegistration:(CGRect)a3;
- (FigMetalAllocatorBackend)allocatorBackend;
- (FigWiredMemory)sharedRegWarpBuffer;
- (IBPSemanticStyleProperties)semanticStyleProperties;
- (MTLCommandQueue)metalCommandQueue;
- (NRFOutput)output;
- (NRFProcessorDelegate)delegate;
- (NRFProgressiveBracketingParameters)progressiveBracketingParameters;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (NSMutableDictionary)defringingTuningByPortType;
- (NSMutableDictionary)tuningParams;
- (NSMutableDictionary)tuningParamsPlist;
- (NSString)description;
- (UBProcessorV4)initWithCommandQueue:(id)a3;
- (__IOSurface)regwarpInputSurface;
- (id)getProcessingTypeKey:(id)a3 metadata:(id)a4 separateHWISP:(BOOL)a5;
- (int)_appendFrames:(opaqueCMSampleBuffer *)a3 cfp:(id)a4;
- (int)_bindRegWarpPPWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5;
- (int)_downsampleImageForRegistration:(__CVBuffer *)a3 outputImage:(__CVBuffer *)a4;
- (int)_multiFrameProcessing;
- (int)_nrfFuseImages;
- (int)_perFrameProcessing:(id)a3 input:(opaqueCMSampleBuffer *)a4 cfp:(id)a5;
- (int)_process;
- (int)_processInferenceImage:(__CVBuffer *)a3 sourceFrameType:(int)a4 sourceFrameIndex:(int)a5 ltcFrameIndex:(int)a6 gtcFrameIndex:(int)a7 originalWidth:(unint64_t)a8 originalHeight:(unint64_t)a9;
- (int)_processSIFRandRefEV0IfPossible:(int)a3;
- (int)_registerImages:(BOOL)a3;
- (int)_setupFusionConfig;
- (int)addFrame:(opaqueCMSampleBuffer *)a3;
- (int)batchCount;
- (int)bindResourcesForProcessingType:(unsigned int)a3 prepareDescriptor:(id)a4;
- (int)cntBracketSampleBuffers;
- (int)determineWorkingBufferRequirementsToProcess:(unsigned int)a3 prepareDescriptor:(id)a4 nrfConfig:(id)a5 denoiseFusePipelineSize:(unint64_t *)a6 rwppSize:(unint64_t *)a7 rwppInputWidth:(unint64_t *)a8 rwppInputHeight:(unint64_t *)a9;
- (int)determineWorkingBufferRequirementsWithPrepareDescriptorByProcessingType:(id)a3 nrfConfig:(id)a4 memoryAllocationInfo:(id *)a5;
- (int)finishProcessing;
- (int)fusionMode;
- (int)getOptions:(id)a3;
- (int)initFrameProperties:(id)a3 cameraInfo:(id)a4 metadata:(id)a5 pixelBuffer:(__CVBuffer *)a6;
- (int)maximumNumberOfReferenceFrameCandidatesToHoldForProcessing;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prepareToProcess:(unsigned int)a3 prepareDescriptor:(id)a4;
- (int)prewarm;
- (int)prewarmWithTuningParameters:(id)a3;
- (int)process;
- (int)processSingleImage;
- (int)progressiveBatchSize;
- (int)purgeResources;
- (int)referenceFrameCandidatesCount;
- (int)referenceFrameIndex;
- (int)requestTuningParametersIfNeeded:(opaqueCMSampleBuffer *)a3 cfp:(id)a4;
- (int)resetInternalState;
- (int)resetState;
- (int)setup;
- (int)setupWithOptions:(id)a3 nrfConfig:(id)a4;
- (int)updateEV0ReferenceFrameIfNecessary;
- (int)verifyIOSurfaceCompression:(__IOSurface *)a3;
- (unint64_t)calculateBackingBufferSizeForDesc:(id)a3 nrfConfig:(id)a4 processingType:(unsigned int)a5 metal:(id)a6;
- (unsigned)processingType;
- (void)_prepareOutputMetadata;
- (void)addToSidecar:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)finishScheduling;
- (void)injectReferenceIfNeeded;
- (void)releaseStoredReference;
- (void)setAllocatorBackend:(id)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setDefringingTuningByPortType:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDoRedFaceFix:(BOOL)a3;
- (void)setEnableGreenGhostMitigation:(BOOL)a3;
- (void)setFusionMode:(int)a3;
- (void)setLearnedNREnabled:(BOOL)a3;
- (void)setLinearOutputMetadata:(id)a3;
- (void)setMaximumNumberOfReferenceFrameCandidatesToHoldForProcessing:(int)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setOutput:(id)a3;
- (void)setProcessingType:(unsigned int)a3;
- (void)setProgressiveBatchSize:(int)a3;
- (void)setProgressiveBracketingParameters:(id)a3;
- (void)setReferenceFrameCandidatesCount:(int)a3;
- (void)setReferenceFrameHasEVMinus:(BOOL)a3;
- (void)setReferenceFrameIndex:(int)a3;
- (void)setRegwarpInputSurface:(__IOSurface *)a3;
- (void)setSemanticStyleProperties:(id)a3;
- (void)setSharedRegWarpBuffer:(id)a3;
- (void)setSkipDenoising:(BOOL)a3;
- (void)setSrlEnabled:(BOOL)a3;
- (void)setStfAllowed:(BOOL)a3;
- (void)setTuningParameters:(id)a3;
- (void)setTuningParams:(id)a3;
- (void)setTuningParamsPlist:(id)a3;
- (void)storeReferenceIfNeeded;
@end

@implementation UBProcessorV4

- (int)resetState
{
  [(FigMetalContext *)self->_metal waitForSchedule];
  [(UBProcessorV4 *)self resetInternalState];
  [(DenoiseFusePipeline *)self->_denoiseFusePipeline releaseAllBindings];
  [(DenoiseFusePipeline *)self->_denoiseFusePipeline setDoGreenGhostMitigation:0];
  [(UBProcessorV4 *)self releaseStoredReference];
  self->_processedSIFRandRefEV0 = 0;
  referenceFrameProperties = self->_referenceFrameProperties;
  self->_referenceFrameProperties = 0;

  self->_inferenceInputGenerated = 0;
  self->_outputGainMapHeadroom = 0.0;
  self->_batchCount = 0;
  self->_referenceFrameIndex = -1;
  [(DenoiseFusePipeline *)self->_denoiseFusePipeline setFusionReferenceFrame:0];
  *(void *)&self->_nInputBrackets = 0;
  self->_enableGreenGhostMitigation = 0;
  *(_WORD *)&self->_referenceFrameHasEVMinus = 1;
  objc_storeWeak((id *)&self->_delegate, 0);
  progressiveBracketingParameters = self->_progressiveBracketingParameters;
  self->_progressiveBracketingParameters = 0;

  *(_WORD *)&self->_learnedNREnabled = 256;
  v5 = [(FigMetalContext *)self->_metal allocator];
  [v5 reset];

  v6 = [(FigMetalContext *)self->_metal allocator];
  [v6 purgeResources:0];

  [(FigMetalContext *)self->_metal setExecutionStatus:0];
  return 0;
}

- (void)setProgressiveBatchSize:(int)a3
{
  if (a3 <= 2) {
    unsigned int v3 = 2;
  }
  else {
    unsigned int v3 = a3;
  }
  if (v3 >= 4) {
    unsigned int v3 = 4;
  }
  self->_progressiveBatchSize = v3;
}

- (int)resetInternalState
{
  [(DenoiseFusePipeline *)self->_denoiseFusePipeline reset];
  self->_aggregateErr = 0;
  ev0SampleBuffer = self->_ev0SampleBuffer;
  if (ev0SampleBuffer)
  {
    CFRelease(ev0SampleBuffer);
    self->_ev0SampleBuffer = 0;
  }
  lscGainsTex = self->_lscGainsTex;
  self->_lscGainsTex = 0;

  if (self->_cntBracketSampleBuffers >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      v6 = &self->super.isa + v5;
      Class v7 = v6[19];
      if (v7)
      {
        CFRelease(v7);
        v6[19] = 0;
      }
      Class v8 = v6[24];
      v6[24] = 0;

      ++v5;
    }
    while (v5 < self->_cntBracketSampleBuffers);
  }
  prebracketedProperties = self->_prebracketedProperties;
  self->_prebracketedProperties = 0;

  self->_requestTuningParams = 1;
  self->_cntBracketSampleBuffers = 0;
  self->_curRegWarpTempIndex = -1;
  self->_preBracketFrameIndex = -1;
  bzero(&self->_fusionConf, 0x540uLL);
  self->_sifrFrameIndex = -1;
  ++self->_batchCount;
  [(DenoiseFusePipeline *)self->_denoiseFusePipeline setSrlEnabled:1];
  return 0;
}

- (void)releaseStoredReference
{
  referenceFrame = self->_referenceFrame;
  if (referenceFrame)
  {
    CFRelease(referenceFrame);
    self->_referenceFrame = 0;
  }
}

- (UBProcessorV4)initWithCommandQueue:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)UBProcessorV4;
  uint64_t v5 = [(UBProcessorV4 *)&v26 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F2EE30]) initWithbundle:v6 andOptionalCommandQueue:v4];
    Class v8 = (void *)*((void *)v5 + 212);
    *((void *)v5 + 212) = v7;

    v9 = (void *)*((void *)v5 + 212);
    if (v9)
    {
      uint64_t v10 = [v9 commandQueue];
      v11 = (void *)*((void *)v5 + 247);
      *((void *)v5 + 247) = v10;

      v5[8] = 0;
      [v5 resetState];
      v5[1736] = 0;
      v5[72] = 0;
      v12 = (void *)*((void *)v5 + 10);
      *((void *)v5 + 10) = 0;

      v5[88] = 0;
      v13 = (void *)*((void *)v5 + 12);
      *((void *)v5 + 12) = 0;

      v5[104] = 0;
      uint64_t v14 = objc_opt_new();
      v15 = (void *)*((void *)v5 + 201);
      *((void *)v5 + 201) = v14;

      id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v17 = (void *)*((void *)v5 + 218);
      *((void *)v5 + 218) = v16;

      *((_DWORD *)v5 + 472) = 0;
      v5[1874] = 0;
      v18 = (void *)*((void *)v5 + 224);
      *(_OWORD *)(v5 + 1784) = 0u;

      [v5 setProgressiveBatchSize:4];
      id v19 = objc_alloc_init(MEMORY[0x263F2EE08]);
      v20 = (void *)*((void *)v5 + 204);
      *((void *)v5 + 204) = v19;

      v21 = [[RegWarpHelper alloc] initWithMetal:*((void *)v5 + 212)];
      v22 = (void *)*((void *)v5 + 203);
      *((void *)v5 + 203) = v21;

      [MEMORY[0x263F2EE70] getDefaults:v5 + 1640];
      v23 = v5;
    }
    else
    {
      v25 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v23 = 0;
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (int)setup
{
  return 0;
}

- (void)setOutput:(id)a3
{
  id v22 = a3;
  objc_storeStrong((id *)&self->_output, a3);
  nrfFusionOutput = self->_nrfFusionOutput;
  self->_nrfFusionOutput = 0;

  outputAsMTLBuffer = self->_outputAsMTLBuffer;
  self->_outputAsMTLBuffer = 0;

  uint64_t v7 = [(FigMetalContext *)self->_metal allocator];
  [v7 purgeResources:0];

  Class v8 = v22;
  if (!v22) {
    goto LABEL_10;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  Class v8 = v22;
  if ((isKindOfClass & 1) == 0) {
    goto LABEL_10;
  }
  p_nrfFusionOutput = &self->_nrfFusionOutput;
  objc_storeStrong((id *)&self->_nrfFusionOutput, a3);
  if (isSingleFrameProcessing(self->_processingType)
    && ![(NRFUBFusionOutput *)*p_nrfFusionOutput pixelBuffer])
  {
LABEL_8:
    uint64_t v18 = [(NRFUBFusionOutput *)*p_nrfFusionOutput pixelBuffer];
    Class v8 = v22;
    if (v18
      || (uint64_t v19 = [(NRFUBFusionOutput *)*p_nrfFusionOutput linearOutputPixelBuffer],
          Class v8 = v22,
          !v19))
    {
LABEL_10:
      v20 = [v8 completionStatus];
      v21 = [v20 metalExecutionStatus];
      [(FigMetalContext *)self->_metal setExecutionStatus:v21];

      goto LABEL_11;
    }
    goto LABEL_16;
  }
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface([(NRFUBFusionOutput *)self->_nrfFusionOutput pixelBuffer]);
  v12 = [(FigMetalContext *)self->_metal device];
  v13 = (MTLBuffer *)[v12 newBufferWithIOSurface:IOSurface];
  uint64_t v14 = self->_outputAsMTLBuffer;
  self->_outputAsMTLBuffer = v13;

  v15 = self->_outputAsMTLBuffer;
  if (v15)
  {
    if ([(UBProcessorV4 *)self verifyIOSurfaceCompression:[(MTLBuffer *)v15 iosurface]])
    {
      FigDebugAssert3();
      goto LABEL_11;
    }
    id v16 = [(FigMetalContext *)self->_metal allocator];
    int v17 = [v16 addExternalMetalBuffer:self->_outputAsMTLBuffer atSubAllocatorID:0];

    if (!v17) {
      goto LABEL_8;
    }
  }
  else
  {
    FigDebugAssert3();
  }
LABEL_16:
  FigSignalErrorAt();
LABEL_11:
}

- (BOOL)shouldDownsampleRWPPInputWithPixelFormat:(unsigned int)a3 processingType:(unsigned int)a4
{
  if (!self->_regWarpM2M && !self->_regWarpHelper || (isSingleFrameProcessing(a4) & 1) != 0) {
    return 0;
  }
  BOOL result = 0;
  if ((int)a3 <= 796419631)
  {
    if ((int)a3 <= 761816623)
    {
      if (a3 == 644376112) {
        return 1;
      }
      int v6 = 645424688;
    }
    else
    {
      if (a3 == 761816624 || a3 == 762865200) {
        return 1;
      }
      int v6 = 795371056;
    }
LABEL_19:
    if (a3 != v6) {
      return result;
    }
    return 1;
  }
  if ((int)a3 > 2019963439)
  {
    if (a3 == 2019963440 || a3 == 2088265264) {
      return 1;
    }
    int v6 = 2087216688;
    goto LABEL_19;
  }
  if (a3 != 796419632 && a3 != 1751527984)
  {
    int v6 = 1885745712;
    goto LABEL_19;
  }
  return 1;
}

- (int)initFrameProperties:(id)a3 cameraInfo:(id)a4 metadata:(id)a5 pixelBuffer:(__CVBuffer *)a6
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a6);
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a6, 0);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a6, 0);
  id v85 = v11;
  id v16 = [v11 objectForKeyedSubscript:*MEMORY[0x263F2EEF8]];
  int v17 = [v16 objectForKeyedSubscript:*MEMORY[0x263F2EF50]];
  v84 = v16;
  uint64_t v18 = [v16 objectForKeyedSubscript:*MEMORY[0x263F2EF38]];
  unint64_t v19 = WidthOfPlane;
  if (v17) {
    unint64_t v19 = [v17 unsignedIntValue];
  }
  v88 = v17;
  unint64_t v20 = HeightOfPlane;
  if (v18) {
    unint64_t v20 = [v18 unsignedIntValue];
  }
  int v89 = 1;
  if (PixelFormatType > 1651926375)
  {
    if (PixelFormatType == 1651926376 || PixelFormatType == 1751527984) {
      goto LABEL_14;
    }
    int v21 = 2087216688;
  }
  else
  {
    if (PixelFormatType == 644376112 || PixelFormatType == 761816624) {
      goto LABEL_14;
    }
    int v21 = 795371056;
  }
  if (PixelFormatType != v21) {
    int v89 = 0;
  }
LABEL_14:
  v87 = v18;
  if (self->_cntBracketSampleBuffers < 1) {
    v86 = 0;
  }
  else {
    v86 = self->_bracketProperties[0];
  }
  id v22 = v10;
  v23 = [v10 meta];

  if (!v23)
  {
    v80 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT);
    v58 = v84;
    v57 = v85;
    id v22 = v10;
    v41 = v86;
    int FrameMetadata = -73251;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_46;
  }
  v24 = [v10 meta];
  int v25 = isSingleFrameProcessing(self->_processingType);
  int FrameMetadata = loadFrameMetadata(v12, v24, WidthOfPlane, HeightOfPlane, v19, v20, v25 ^ 1u, v89 ^ 1u);

  if (FrameMetadata)
  {
    FigDebugAssert3();
    goto LABEL_45;
  }
  uint64_t v27 = [v22 colorSpaceConversionParameters];
  uint64_t v28 = v27;
  uint64_t v29 = 0;
  *(_OWORD *)(v27 + 144) = xmmword_26337FFE0;
  *(_OWORD *)(v27 + 160) = xmmword_26337FFF0;
  *(void *)(v27 + 176) = 0x3F80000000000000;
  long long v93 = *(_OWORD *)byte_263380000;
  long long v94 = *(_OWORD *)&byte_263380000[16];
  simd_float4 v90 = 0u;
  simd_float4 v91 = 0u;
  simd_float4 v92 = 0u;
  long long v95 = *(_OWORD *)&byte_263380000[32];
  do
  {
    *(float32x4_t *)((char *)&v90 + v29) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_263380030, COERCE_FLOAT(*(long long *)((char *)&v93 + v29))), (float32x4_t)xmmword_263380040, *(float32x2_t *)((char *)&v93 + v29), 1), (float32x4_t)xmmword_263380050, *(float32x4_t *)((char *)&v93 + v29), 2);
    v29 += 16;
  }
  while (v29 != 48);
  v97.columns[0] = v90;
  v97.columns[1] = v91;
  v97.columns[2] = v92;
  *(simd_float4 *)(v27 + 48) = v90;
  *(simd_float4 *)(v27 + 64) = v97.columns[1];
  *(simd_float4 *)(v27 + 80) = v97.columns[2];
  v97.columns[3] = (simd_float4)xmmword_263380060;
  simd_float4x4 v98 = __invert_f4(v97);
  *(simd_float4 *)uint64_t v28 = v98.columns[0];
  *(simd_float4 *)(v28 + 16) = v98.columns[1];
  *(simd_float4 *)(v28 + 32) = v98.columns[2];
  *(float *)(v28 + 184) = 1.0 / *(float *)(v28 + 188);
  uint64_t v30 = MEMORY[0x263EF89A0];
  long long v82 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  long long v83 = *MEMORY[0x263EF89A0];
  *(_OWORD *)(v28 + 96) = *MEMORY[0x263EF89A0];
  *(_OWORD *)(v28 + 112) = v82;
  long long v81 = *(_OWORD *)(v30 + 32);
  *(_OWORD *)(v28 + 128) = v81;
  *(_DWORD *)(v28 + 196) = 65792;
  *(void *)(v28 + 188) = 0x3F0000003F800000;
  uint64_t v31 = *MEMORY[0x263F2F6D0];
  uint64_t v32 = [v12 objectForKeyedSubscript:*MEMORY[0x263F2F6D0]];
  if (!v32)
  {
    if (!v89) {
      goto LABEL_33;
    }
LABEL_28:
    [v22 setInputColorSpace:2];
    uint64_t v43 = [v22 colorSpaceConversionParameters];
    *(_OWORD *)(v43 + 144) = xmmword_26337FFE0;
    *(_OWORD *)(v43 + 160) = xmmword_26337FFF0;
    *(void *)(v43 + 176) = 0x3F80000000000000;
    v44 = (_OWORD *)[v22 colorSpaceConversionParameters];
    uint64_t v45 = 0;
    long long v93 = *(_OWORD *)byte_263380000;
    long long v94 = *(_OWORD *)&byte_263380000[16];
    long long v95 = *(_OWORD *)&byte_263380000[32];
    simd_float4 v90 = 0u;
    simd_float4 v91 = 0u;
    simd_float4 v92 = 0u;
    v41 = v86;
    do
    {
      *(float32x4_t *)((char *)&v90 + v45) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_2633802E0, COERCE_FLOAT(*(long long *)((char *)&v93 + v45))), (float32x4_t)xmmword_263380310, *(float32x2_t *)((char *)&v93 + v45), 1), (float32x4_t)xmmword_26337FF50, *(float32x4_t *)((char *)&v93 + v45), 2);
      v45 += 16;
    }
    while (v45 != 48);
    simd_float4 v46 = v91;
    simd_float4 v47 = v92;
    v44[3] = v90;
    v44[4] = v46;
    v44[5] = v47;
    uint64_t v48 = [v22 colorSpaceConversionParameters];
    v99.columns[0] = *(simd_float4 *)(v48 + 48);
    v99.columns[1] = *(simd_float4 *)(v48 + 64);
    v99.columns[2] = *(simd_float4 *)(v48 + 80);
    v99.columns[3] = (simd_float4)xmmword_263380060;
    simd_float4x4 v100 = __invert_f4(v99);
    *(simd_float4 *)uint64_t v48 = v100.columns[0];
    *(simd_float4 *)(v48 + 16) = v100.columns[1];
    *(simd_float4 *)(v48 + 32) = v100.columns[2];
    *(float *)(v48 + 184) = 1.0 / *(float *)(v48 + 188);
    [v22 setToneCurve:0xFFFFFFFFLL];
    uint64_t v49 = [v22 colorSpaceConversionParameters];
    v50 = [v22 meta];
    [v50 colorCorrectionMatrix];
    *(_DWORD *)(v49 + 104) = v51;
    *(_DWORD *)(v49 + 120) = v52;
    *(void *)(v49 + 96) = v53;
    *(void *)(v49 + 112) = v54;
    *(_DWORD *)(v49 + 136) = v55;
    *(void *)(v49 + 128) = v56;

    int FrameMetadata = 0;
    *(_DWORD *)([v22 colorSpaceConversionParameters] + 192) = 0;
LABEL_31:
    v58 = v84;
    v57 = v85;
    goto LABEL_46;
  }
  v33 = (void *)v32;
  v34 = [v12 objectForKeyedSubscript:*MEMORY[0x263F2F3F0]];
  if (!v34)
  {

    if ((v89 & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_28;
  }
  uint64_t v35 = *MEMORY[0x263F2F388];
  v36 = [v12 objectForKeyedSubscript:*MEMORY[0x263F2F388]];

  if (v89) {
    goto LABEL_28;
  }
  if (v36)
  {
    [v22 setInputColorSpace:2];
    v37 = [v12 objectForKeyedSubscript:v35];
    unsigned __int16 v38 = [v37 intValue];

    v39 = [v12 objectForKeyedSubscript:v31];
    uint64_t v40 = [v39 intValue];

    v41 = v86;
    switch((int)v40)
    {
      case 0:
        uint64_t v42 = [v22 colorSpaceConversionParameters];
        *(_OWORD *)(v42 + 144) = xmmword_26337FFE0;
        *(_OWORD *)(v42 + 160) = xmmword_26337FFF0;
        *(void *)(v42 + 176) = 0x3F80000000000000;
        goto LABEL_50;
      case 1:
        uint64_t v66 = [v22 colorSpaceConversionParameters];
        *(_OWORD *)(v66 + 144) = xmmword_26337FFE0;
        *(_OWORD *)(v66 + 160) = xmmword_2633802D0;
        uint64_t v67 = 0x4000000000000000;
        goto LABEL_49;
      case 2:
        uint64_t v66 = [v22 colorSpaceConversionParameters];
        *(_OWORD *)(v66 + 144) = xmmword_2633800C0;
        *(_OWORD *)(v66 + 160) = xmmword_2633800D0;
        uint64_t v67 = 0x400E38E43DCAC083;
LABEL_49:
        *(void *)(v66 + 176) = v67;
LABEL_50:
        *(float *)&double v68 = colorspace_setDefaultCscMatrix((simd_float4 *)[v22 colorSpaceConversionParameters], v38);
        break;
      case 3:
        uint64_t v69 = [v22 colorSpaceConversionParameters];
        *(_OWORD *)(v69 + 144) = xmmword_263380070;
        *(_OWORD *)(v69 + 160) = xmmword_263380080;
        *(void *)(v69 + 176) = 0x4019999A3D6147AELL;
        *(float *)&double v70 = colorspace_setCustomCscMatrix([v22 colorSpaceConversionParameters]);
        *(unsigned char *)(objc_msgSend(v22, "colorSpaceConversionParameters", v70) + 199) = 1;
        break;
      default:
        goto LABEL_44;
    }
    objc_msgSend(v22, "setToneCurve:", v40, v68);
    if (v86 && (int v71 = [v22 toneCurve], v71 != -[NRFFrameProperties toneCurve](v86, "toneCurve")))
    {
      FigDebugAssert3();
      int FrameMetadata = FigSignalErrorAt();
    }
    else
    {
      uint64_t v72 = [v22 colorSpaceConversionParameters];
      v73 = [v22 meta];
      [v73 colorCorrectionMatrix];
      *(_DWORD *)(v72 + 104) = v74;
      *(_DWORD *)(v72 + 120) = v75;
      *(void *)(v72 + 96) = v76;
      *(void *)(v72 + 112) = v77;
      *(_DWORD *)(v72 + 136) = v78;
      *(void *)(v72 + 128) = v79;

      int FrameMetadata = 0;
    }
    goto LABEL_31;
  }
LABEL_33:
  uint64_t v59 = [v22 colorSpaceConversionParameters];
  uint64_t v60 = v59;
  uint64_t v61 = 0;
  *(_OWORD *)(v59 + 144) = xmmword_26337FFE0;
  *(_OWORD *)(v59 + 160) = xmmword_26337FFF0;
  *(void *)(v59 + 176) = 0x3F80000000000000;
  long long v93 = *(_OWORD *)byte_263380000;
  long long v94 = *(_OWORD *)&byte_263380000[16];
  long long v95 = *(_OWORD *)&byte_263380000[32];
  simd_float4 v90 = 0u;
  simd_float4 v91 = 0u;
  simd_float4 v92 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v90 + v61) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_263380030, COERCE_FLOAT(*(long long *)((char *)&v93 + v61))), (float32x4_t)xmmword_263380040, *(float32x2_t *)((char *)&v93 + v61), 1), (float32x4_t)xmmword_263380050, *(float32x4_t *)((char *)&v93 + v61), 2);
    v61 += 16;
  }
  while (v61 != 48);
  v101.columns[0] = v90;
  v101.columns[1] = v91;
  v101.columns[2] = v92;
  *(simd_float4 *)(v59 + 48) = v90;
  *(simd_float4 *)(v59 + 64) = v101.columns[1];
  *(simd_float4 *)(v59 + 80) = v101.columns[2];
  v101.columns[3] = (simd_float4)xmmword_263380060;
  simd_float4x4 v102 = __invert_f4(v101);
  *(simd_float4 *)uint64_t v60 = v102.columns[0];
  *(simd_float4 *)(v60 + 16) = v102.columns[1];
  *(simd_float4 *)(v60 + 32) = v102.columns[2];
  *(float *)(v60 + 184) = 1.0 / *(float *)(v60 + 188);
  *(_OWORD *)(v60 + 96) = v83;
  *(_OWORD *)(v60 + 112) = v82;
  *(_OWORD *)(v60 + 128) = v81;
  *(_DWORD *)(v60 + 196) = 65792;
  *(void *)(v60 + 188) = 0x3F0000003F800000;
  v62 = [v12 objectForKeyedSubscript:v31];

  if (!v62)
  {
    [v22 setInputColorSpace:0];
    int FrameMetadata = 0;
    *(unsigned char *)([v22 colorSpaceConversionParameters] + 196) = 1;
LABEL_45:
    v58 = v84;
    v57 = v85;
    v41 = v86;
    goto LABEL_46;
  }
  v63 = [v12 objectForKeyedSubscript:v31];
  int v64 = [v63 intValue];

  if (v64 == 2)
  {
LABEL_44:
    FigDebugAssert3();
    int FrameMetadata = FigSignalErrorAt();
    goto LABEL_45;
  }
  v58 = v84;
  v57 = v85;
  v41 = v86;
  if (v64 == 1)
  {
    [v22 setInputColorSpace:1];
    int FrameMetadata = 0;
  }
  else if (v64)
  {
    FigDebugAssert3();
    int FrameMetadata = FigSignalErrorAt();
  }
  else
  {
    [v22 setInputColorSpace:0];
    int FrameMetadata = 0;
    *(unsigned char *)([v22 colorSpaceConversionParameters] + 196) = 1;
  }
LABEL_46:

  return FrameMetadata;
}

- (void)storeReferenceIfNeeded
{
  if (!self->_batchCount)
  {
    uint64_t referenceFrameIndex = self->_referenceFrameIndex;
    id v4 = self->_bracketSampleBuffers[referenceFrameIndex];
    if (v4)
    {
      id v4 = (opaqueCMSampleBuffer *)CFRetain(v4);
      uint64_t referenceFrameIndex = self->_referenceFrameIndex;
    }
    self->_referenceFrame = v4;
    objc_storeStrong((id *)&self->_referenceFrameProperties, self->_bracketProperties[referenceFrameIndex]);
    [(NRFFrameProperties *)self->_referenceFrameProperties setHasValidRegistration:0];
    referenceFrameProperties = self->_referenceFrameProperties;
    [(NRFFrameProperties *)referenceFrameProperties setRegistrationComplete:0];
  }
}

- (void)injectReferenceIfNeeded
{
  if (!self->_cntBracketSampleBuffers && self->_batchCount >= 1)
  {
    unsigned int v3 = (_DWORD *)MEMORY[0x263F00E10];
    if (*MEMORY[0x263F00E10] == 1) {
      kdebug_trace();
    }
    int v4 = [(UBProcessorV4 *)self _appendFrames:self->_referenceFrame cfp:self->_referenceFrameProperties];
    if (!self->_aggregateErr && v4) {
      self->_aggregateErr = -73463;
    }
    [(UBProcessorV4 *)self _perFrameProcessing:self->_nrfPlist input:self->_referenceFrame cfp:self->_referenceFrameProperties];
    if (*v3)
    {
      uint64_t v5 = [(FigMetalContext *)self->_metal commandQueue];
      int v6 = [v5 commandBuffer];

      [v6 setLabel:@"KTRACE_END_MTL"];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __40__UBProcessorV4_injectReferenceIfNeeded__block_invoke;
      v7[3] = &__block_descriptor_56_e28_v16__0___MTLCommandBuffer__8l;
      memset(&v7[4], 0, 24);
      [v6 addCompletedHandler:v7];
      [v6 commit];
    }
  }
}

void __40__UBProcessorV4_injectReferenceIfNeeded__block_invoke(uint64_t a1, void *a2)
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

- (int)process
{
  [(UBProcessorV4 *)self injectReferenceIfNeeded];

  return [(UBProcessorV4 *)self _process];
}

- (int)_process
{
  location[16] = *(id *)MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_cntBracketSampleBuffers <= 0)
  {
    uint64_t v50 = v51;
    LODWORD(v49) = 0;
    FigDebugAssert3();
    uint64_t v19 = FigSignalErrorAt();
    int v6 = 0;
    goto LABEL_32;
  }
  if ((isSingleFrameProcessing(self->_processingType) & 1) != 0
    || (uint64_t referenceFrameIndex = self->_referenceFrameIndex, (referenceFrameIndex & 0x80000000) != 0))
  {
    bracketSampleBuffers = self->_bracketSampleBuffers;
  }
  else
  {
    bracketSampleBuffers = &self->_bracketSampleBuffers[referenceFrameIndex];
  }
  int v6 = *bracketSampleBuffers;
  if (!*bracketSampleBuffers)
  {
    uint64_t v50 = v51;
    LODWORD(v49) = 0;
LABEL_68:
    FigDebugAssert3();
    goto LABEL_29;
  }
  CFRetain(*bracketSampleBuffers);
  if (!self->_referenceFrameProperties)
  {
    if ((isSingleFrameProcessing(self->_processingType) & 1) != 0
      || (uint64_t v7 = self->_referenceFrameIndex, (v7 & 0x80000000) != 0))
    {
      bracketProperties = self->_bracketProperties;
    }
    else
    {
      bracketProperties = &self->_bracketProperties[v7];
    }
    objc_storeStrong((id *)&self->_referenceFrameProperties, *bracketProperties);
  }
  [(UBProcessorV4 *)self StartKTraceEventForProcess:v6];
  nrfFusionOutput = self->_nrfFusionOutput;
  if (!nrfFusionOutput)
  {
    uint64_t v50 = v51;
    LODWORD(v49) = 0;
    goto LABEL_68;
  }
  -[NRFUBFusionOutput setRefFrameTransform:](nrfFusionOutput, "setRefFrameTransform:", *MEMORY[0x263EF89A0], *(double *)(MEMORY[0x263EF89A0] + 16), *(double *)(MEMORY[0x263EF89A0] + 32));
  if ((isSingleFrameProcessing(self->_processingType) & 1) != 0 || self->_aggregateErr) {
    goto LABEL_19;
  }
  if (!self->_processedSIFRandRefEV0) {
    [(FigMetalContext *)self->_metal waitForIdle];
  }
  uint64_t v10 = [(UBProcessorV4 *)self _multiFrameProcessing];
  if (!v10)
  {
LABEL_19:
    [(NRFUBFusionOutput *)self->_nrfFusionOutput setFusionMode:[(DenoiseFusePipeline *)self->_denoiseFusePipeline fusionReferenceFrame]];
    unsigned int v11 = self->_referenceFrameIndex;
    if ((v11 & 0x80000000) == 0)
    {
      id v12 = (_OWORD *)((char *)self + 48 * v11);
      long long v53 = v12[17];
      long long v54 = v12[16];
      long long v52 = v12[18];
      if ([(NRFUBFusionOutput *)self->_nrfFusionOutput fusionMode] == 2)
      {
        uint64_t sifrFrameIndex = self->_sifrFrameIndex;
        if ((sifrFrameIndex & 0x80000000) == 0)
        {
          if ([(NRFFrameProperties *)self->_bracketProperties[sifrFrameIndex] hasValidRegistration])
          {
            uint64_t v14 = [(NRFFrameProperties *)self->_bracketProperties[self->_sifrFrameIndex] regHomography];
            long long v53 = *((_OWORD *)v14 + 1);
            long long v54 = *(_OWORD *)v14;
            long long v52 = *((_OWORD *)v14 + 2);
          }
        }
      }
      if (self->_processingType == 1) {
        -[NRFUBFusionOutput setRefFrameTransform:](self->_nrfFusionOutput, "setRefFrameTransform:", *(double *)&v54, *(double *)&v53, *(double *)&v52);
      }
    }
    if (isSingleFrameProcessing(self->_processingType))
    {
      uint64_t v15 = [(UBProcessorV4 *)self processSingleImage];
      if (v15) {
        goto LABEL_30;
      }
    }
    id v16 = [(FigMetalContext *)self->_metal allocator];
    int v17 = [v16 backendAllocator];
    uint64_t v18 = [v17 usedSize];

    if (!v18)
    {
      uint64_t v19 = 0;
      goto LABEL_32;
    }
LABEL_29:
    uint64_t v15 = FigSignalErrorAt();
LABEL_30:
    uint64_t v19 = v15;
    goto LABEL_32;
  }
  uint64_t v19 = v10;
  uint64_t v50 = v51;
  LODWORD(v49) = v10;
  FigDebugAssert3();
  while (1)
  {
    while (1)
    {
LABEL_32:
      [(UBProcessorV4 *)self _prepareOutputMetadata];
      int aggregateErr = self->_aggregateErr;
      if (aggregateErr == -73464)
      {
        uint64_t v21 = 4294949895;
      }
      else
      {
        uint64_t v21 = v19;
        if (aggregateErr)
        {
          if (aggregateErr == -73459) {
            uint64_t v21 = 4294949894;
          }
          else {
            uint64_t v21 = 4294949896;
          }
        }
      }
      [(UBProcessorV4 *)self resetInternalState];
      id v22 = [MEMORY[0x263F12800] sharedCaptureManager];
      [v22 stopCapture];

      if (self->_nrfConfig->_isAsynchronous) {
        [(UBProcessorV4 *)self finishScheduling];
      }
      else {
        [(UBProcessorV4 *)self finishProcessing];
      }
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        break;
      }
      unsigned int processingType = self->_processingType;
      if (processingType - 5 < 4) {
        goto LABEL_45;
      }
      if (processingType == 1)
      {
        if ([(NRFUBFusionOutput *)self->_nrfFusionOutput linearOutputPixelBuffer])
        {
          uint64_t v28 = [(NRFUBFusionOutput *)self->_nrfFusionOutput linearOutputPixelBuffer];
          uint64_t v29 = [(NRFUBFusionOutput *)self->_nrfFusionOutput linearOutputMetadata];
          [WeakRetained processor:self outputReadyWithFrameType:10 outputPixelBuffer:v28 outputMetadata:v29 error:v21];
        }
        uint64_t v30 = [(NRFUBFusionOutput *)self->_nrfFusionOutput pixelBuffer];
        uint64_t v27 = [(NRFUBFusionOutput *)self->_nrfFusionOutput metadata];
        [WeakRetained processor:self outputReadyWithFrameType:1 outputPixelBuffer:v30 outputMetadata:v27 error:v21];
LABEL_52:

        break;
      }
      uint64_t v19 = 4294894039;
      if (!processingType)
      {
LABEL_45:
        if (![(NRFUBFusionOutput *)self->_nrfFusionOutput pixelBuffer]) {
          break;
        }
        if ([(NRFUBFusionOutput *)self->_nrfFusionOutput linearOutputPixelBuffer])
        {
          v24 = [(NRFUBFusionOutput *)self->_nrfFusionOutput linearOutputPixelBuffer];
          int v25 = [(NRFUBFusionOutput *)self->_nrfFusionOutput linearOutputMetadata];
          [WeakRetained processor:self outputReadyWithFrameType:10 outputPixelBuffer:v24 outputMetadata:v25 error:v21];
        }
        objc_super v26 = [(NRFUBFusionOutput *)self->_nrfFusionOutput pixelBuffer];
        uint64_t v27 = [(NRFUBFusionOutput *)self->_nrfFusionOutput metadata];
        [WeakRetained processor:self outputReadyWithFrameType:0 outputPixelBuffer:v26 outputMetadata:v27 error:v21];
        goto LABEL_52;
      }
    }
    uint64_t v31 = [(UBProcessorV4 *)self output];
    uint64_t v32 = [v31 completionStatus];

    if (!v32) {
      goto LABEL_60;
    }
    v33 = [(UBProcessorV4 *)self output];
    v34 = [v33 completionStatus];
    objc_initWeak(location, v34);

    uint64_t v35 = [(FigMetalContext *)self->_metal commandQueue];
    v36 = [v35 commandBuffer];
    id v37 = objc_loadWeakRetained(location);
    [v37 setCommandBuffer:v36];

    id v38 = objc_loadWeakRetained(location);
    v39 = [v38 commandBuffer];
    LODWORD(v36) = v39 == 0;

    if (!v36)
    {
      id v40 = objc_loadWeakRetained(location);
      v41 = [v40 commandBuffer];
      BOOL v42 = v41 == 0;

      if (!v42) {
        break;
      }
    }
    uint64_t v50 = v51;
    LODWORD(v49) = 0;
    FigDebugAssert3();
    uint64_t v19 = FigSignalErrorAt();
    objc_destroyWeak(location);
  }
  if (objc_opt_respondsToSelector())
  {
    id v43 = objc_loadWeakRetained(location);
    v44 = [v43 commandBuffer];
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __25__UBProcessorV4__process__block_invoke;
    v55[3] = &unk_2655C7D80;
    id v56 = WeakRetained;
    objc_copyWeak(&v57, location);
    [v44 addCompletedHandler:v55];

    objc_destroyWeak(&v57);
  }
  id v45 = objc_loadWeakRetained(location);
  simd_float4 v46 = [v45 commandBuffer];
  [v46 commit];

  objc_destroyWeak(location);
LABEL_60:
  if (v6)
  {
    [(UBProcessorV4 *)self EndKTraceEventForProcess:v6];
    CFRelease(v6);
  }
  if (dword_26B430EE8)
  {
    simd_float4 v47 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v21;
}

void __25__UBProcessorV4__process__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 didFinishProcessingWithCompletionStatus:WeakRetained];
}

- (id)getProcessingTypeKey:(id)a3 metadata:(id)a4 separateHWISP:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = [a4 objectForKeyedSubscript:*MEMORY[0x263F2F1D8]];
  uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F218]];

  unsigned int v11 = [v8 meta];
  int v12 = *(_DWORD *)([v11 exposureParams] + 120);

  v13 = [v8 meta];
  int v14 = [v13 isHWISPFrame];

  id v15 = 0;
  switch(self->_processingType)
  {
    case 0u:
      if (self->_learnedNREnabled)
      {
        id v16 = (id *)&kNRF_SingleImageParametersForQuadraLearnedNR;
        int v17 = (id *)&kNRF_SingleImageParametersForLearnedNR;
      }
      else if ((v5 & v14) == 1)
      {
        id v16 = (id *)&kNRF_SingleImageQuadraHWISPParameters;
        int v17 = (id *)&kNRF_SingleImageHWISPParameters;
      }
      else
      {
        id v16 = (id *)&kNRF_SingleImageQuadraParameters;
        int v17 = (id *)&kNRF_SingleImageParameters;
      }
      BOOL v24 = v12 == 1;
      goto LABEL_28;
    case 1u:
      int v18 = [v8 inputColorSpace];
      if (v12 == 1)
      {
        id v16 = (id *)&kNRF_ToneMappedUBQuadraParameters;
        int v17 = (id *)&kNRF_DefaultUBModeQuadraParameters;
      }
      else
      {
        id v16 = (id *)&kNRF_ToneMappedUBParameters;
        int v17 = (id *)&kNRF_DefaultUBModeParameters;
      }
      BOOL v24 = v18 == 0;
LABEL_28:
      if (!v24) {
        id v16 = v17;
      }
      goto LABEL_30;
    case 5u:
      uint64_t v19 = [(UBProcessorV4 *)self progressiveBracketingParameters];
      int v20 = [v19 mode];
      if (v12 == 1)
      {
        uint64_t v21 = (id *)&kNRF_RawNightModeQuadraParameters_max;
        id v22 = (id *)&kNRF_RawNightModeQuadraParameters;
      }
      else
      {
        uint64_t v21 = (id *)&kNRF_RawNightModeParameters_max;
        id v22 = (id *)&kNRF_RawNightModeParameters;
      }
      if (v20 != 1) {
        uint64_t v21 = v22;
      }
      id v15 = *v21;

      break;
    case 6u:
      if (v12 == 1) {
        id v16 = (id *)&kNRF_SWFRQuadraParameters;
      }
      else {
        id v16 = (id *)&kNRF_SWFRParameters;
      }
      goto LABEL_30;
    case 7u:
      if (v12 == 1)
      {
        id v16 = (id *)&kNRF_SingleImageParametersForStereoPhotoQuadraLearnedNR;
        v23 = (id *)&kNRF_SingleImageParametersForQuadraLearnedNR;
      }
      else
      {
        id v16 = (id *)&kNRF_SingleImageParametersForStereoPhotoLearnedNR;
        v23 = (id *)&kNRF_SingleImageParametersForLearnedNR;
      }
      if (!v10) {
        id v16 = v23;
      }
      goto LABEL_30;
    case 8u:
      id v16 = (id *)&kNRF_PanoramaParameters;
LABEL_30:
      id v15 = *v16;
      break;
    default:
      break;
  }

  return v15;
}

- (int)verifyIOSurfaceCompression:(__IOSurface *)a3
{
  if (IOSurfaceGetCompressionTypeOfPlane() != 4
    || self->_nrfConfig->_compressionLevel >= (int)IOSurfaceGetCompressionFootprintOfPlane())
  {
    return 0;
  }
  FigDebugAssert3();
  return -73243;
}

- (int)requestTuningParametersIfNeeded:(opaqueCMSampleBuffer *)a3 cfp:(id)a4
{
  id v6 = a4;
  if (self->_requestTuningParams)
  {
    int v7 = -73247;
    id v8 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F2EF78], 0);
    v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F2F668]];
    uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
    unsigned int v11 = [(NSMutableDictionary *)self->_tuningParams objectForKeyedSubscript:v9];
    int v12 = [(NSMutableDictionary *)self->_tuningParamsPlist objectForKeyedSubscript:v9];
    v13 = [(NSMutableDictionary *)self->_defringingTuningByPortType objectForKeyedSubscript:v10];
    if (v11) {
      BOOL v14 = v12 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (!v14)
    {
      long long v82 = v12;
      id v15 = v13;
      id v16 = objc_opt_new();
      int v17 = [(FigMetalContext *)self->_metal device];
      [v16 setCaptureObject:v17];

      [v16 setDestination:1];
      int v18 = [MEMORY[0x263F12800] sharedCaptureManager];
      long long v83 = v16;
      [v18 startCaptureWithDescriptor:v16 error:0];

      uint64_t v19 = [(UBProcessorV4 *)self getProcessingTypeKey:v6 metadata:v8 separateHWISP:0];
      uint64_t v20 = [(UBProcessorV4 *)self getProcessingTypeKey:v6 metadata:v8 separateHWISP:1];
      uint64_t v21 = [v11 objectForKeyedSubscript:@"DenoiseAndSharpening"];
      uint64_t v22 = [v21 objectForKeyedSubscript:v20];
      nrfPlist = self->_nrfPlist;
      denoiseAndSharpening = nrfPlist->denoiseAndSharpening;
      nrfPlist->denoiseAndSharpening = (DenoiseAndSharpeningPlist *)v22;

      int v25 = [v11 objectForKeyedSubscript:@"NoiseModel"];
      uint64_t v26 = [v25 objectForKeyedSubscript:v19];
      uint64_t v27 = self->_nrfPlist;
      noiseModel = v27->noiseModel;
      v27->noiseModel = (NoiseModelPlist *)v26;

      uint64_t v29 = [v11 objectForKeyedSubscript:@"Fusion"];
      uint64_t v30 = [v29 objectForKeyedSubscript:v19];
      uint64_t v31 = self->_nrfPlist;
      fusion = v31->fusion;
      v31->fusion = (FusionPlist *)v30;

      v33 = [v11 objectForKeyedSubscript:@"ToneMapping"];
      uint64_t v34 = [v33 objectForKeyedSubscript:v19];
      uint64_t v35 = self->_nrfPlist;
      toneMapping = v35->toneMapping;
      v35->toneMapping = (ToneMappingPlist *)v34;

      id v37 = [v11 objectForKeyedSubscript:@"LearnedNRParameters"];
      uint64_t v38 = [v37 objectForKeyedSubscript:v19];
      v39 = self->_nrfPlist;
      learnedNRTuning = v39->learnedNRTuning;
      v39->learnedNRTuning = (LearnedNRNetworkTuningParams *)v38;

      v41 = [v11 objectForKeyedSubscript:@"QuadraLearnedNRParameters"];
      uint64_t v42 = [v41 objectForKeyedSubscript:v19];
      id v43 = self->_nrfPlist;
      quadraLearnedNRTuning = v43->quadraLearnedNRTuning;
      v43->quadraLearnedNRTuning = (LearnedNRNetworkTuningParams *)v42;

      id v84 = v15;
      objc_storeStrong((id *)&self->_nrfPlist->defringingTuningParameters, v15);
      id v45 = [v11 objectForKeyedSubscript:@"GainMap"];
      uint64_t v46 = [v45 objectForKeyedSubscript:v19];
      simd_float4 v47 = self->_nrfPlist;
      gainMap = v47->gainMap;
      v47->gainMap = (GainMapPlist *)v46;

      uint64_t v49 = [v11 objectForKeyedSubscript:@"SemanticStyles"];
      uint64_t v50 = [v49 objectForKeyedSubscript:@"Default"];
      uint64_t v51 = self->_nrfPlist;
      semanticStyles = v51->semanticStyles;
      v51->semanticStyles = (SemanticStylesPlist *)v50;

      long long v53 = [v11 objectForKeyedSubscript:@"BrightLightGreenGhost"];
      uint64_t v54 = [v53 objectForKeyedSubscript:@"Default"];
      int v55 = self->_nrfPlist;
      greenGhostBrightLightTuning = v55->greenGhostBrightLightTuning;
      v55->greenGhostBrightLightTuning = (GreenGhostBrightLightTuningParams *)v54;

      id v57 = [v11 objectForKeyedSubscript:@"OutputNoiseModel"];
      long long v81 = (void *)v20;
      uint64_t v58 = [v57 objectForKeyedSubscript:v20];
      uint64_t v59 = self->_nrfPlist;
      outputNoiseModel = v59->outputNoiseModel;
      v59->outputNoiseModel = (OutputNoiseModelPlist *)v58;

      uint64_t v61 = [(LSCGainsPlist *)self->_lscGainsPlist getTextureForPortType:v10];
      lscGainsTex = self->_lscGainsTex;
      self->_lscGainsTex = v61;

      v63 = [(GlobalDistortionCorrectionByPortType *)self->_globalDistortionCorrectionByPortType getParamsForPortType:v10];
      globalDistortionCorrectionPlist = self->_globalDistortionCorrectionPlist;
      self->_globalDistortionCorrectionPlist = v63;

      v65 = self->_nrfPlist;
      if (v65->denoiseAndSharpening
        && v65->noiseModel
        && ((isSingleFrameProcessing(self->_processingType) & 1) != 0 || self->_nrfPlist->fusion))
      {
        unsigned int processingType = self->_processingType;
        int greenGhostMitigationType = self->_nrfConfig->_greenGhostMitigationType;
        if ((greenGhostMitigationType & 4) != 0)
        {
          if (processingType == 1)
          {
            uint64_t v69 = self->_nrfPlist->greenGhostBrightLightTuning;
            if (v69)
            {
              [(GreenGhostBrightLightTuningParams *)v69 tuningParams];
              unsigned int v68 = v85 != 0;
            }
            else
            {
              unsigned int v68 = 0;
            }
          }
          else
          {
            unsigned int v68 = 0;
          }
        }
        else
        {
          unsigned int v68 = (processingType == 1) & greenGhostMitigationType;
        }
        if (self->_enableGreenGhostMitigation) {
          uint64_t v70 = v68;
        }
        else {
          uint64_t v70 = 0;
        }
        [(DenoiseFusePipeline *)self->_denoiseFusePipeline setDoGreenGhostMitigation:v70];
        if (dword_26B430EE8)
        {
          int v71 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        uint64_t v72 = objc_msgSend(v11, "objectForKeyedSubscript:", @"MIWBParameters", v79, v80);
        uint64_t v73 = [v72 objectForKeyedSubscript:v19];
        int v74 = self->_nrfPlist;
        miwbPlist = v74->miwbPlist;
        v74->miwbPlist = (MIWBPlist *)v73;

        uint64_t v76 = self->_nrfPlist->miwbPlist;
        if (v76) {
          LOBYTE(v76) = v76->enableMIWB;
        }
        uint64_t v77 = v81;
        int v12 = v82;
        int v7 = 0;
        self->_nrfConfig->_enableMIWB = (char)v76;
        self->_requestTuningParams = 0;
      }
      else
      {
        FigDebugAssert3();
        int v7 = FigSignalErrorAt();
        uint64_t v77 = (void *)v20;
        int v12 = v82;
      }

      v13 = v84;
    }
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (int)addFrame:(opaqueCMSampleBuffer *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  id v6 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F2EF78], 0);
  int v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
  id v8 = [(NSDictionary *)self->_cameraInfoByPortType objectForKeyedSubscript:v7];
  int v9 = [(UBProcessorV4 *)self verifyIOSurfaceCompression:CVPixelBufferGetIOSurface(ImageBuffer)];
  if (v9)
  {
    int v14 = v9;
    FigDebugAssert3();
LABEL_29:
    uint64_t v10 = 0;
    goto LABEL_24;
  }
  if (!a3)
  {
    int v14 = FigSignalErrorAt();
    goto LABEL_29;
  }
  uint64_t v10 = objc_opt_new();
  if (v10)
  {
    if ([(UBProcessorV4 *)self initFrameProperties:v10 cameraInfo:v8 metadata:v6 pixelBuffer:ImageBuffer])
    {
      goto LABEL_9;
    }
    [(UBProcessorV4 *)self injectReferenceIfNeeded];
    CMSampleBufferGetPresentationTimeStamp(&v23, a3);
    [(UBProcessorV4 *)self StartKTraceEventForAddFrame:v10 timestamp:&v23 processingType:self->_processingType];
    if (self->_aggregateErr) {
      goto LABEL_9;
    }
    unsigned int v11 = [v10 meta];
    if ([v11 isLongFrame])
    {
      int v12 = [v10 meta];
      int v13 = [v12 isEVMFrame];

      if (v13)
      {
        FigDebugAssert3();
LABEL_9:
        int v14 = FigSignalErrorAt();
        goto LABEL_24;
      }
    }
    else
    {
    }
    int v15 = [(UBProcessorV4 *)self requestTuningParametersIfNeeded:a3 cfp:v10];
    if (v15)
    {
      int v14 = v15;
      goto LABEL_22;
    }
    id v16 = CMSampleBufferGetImageBuffer(a3);
    if (CVPixelBufferIsPlanar(v16))
    {
      int v17 = [(DenoiseFusePipeline *)self->_denoiseFusePipeline fillPaddedAreaInFrame:v16 cfp:v10];
      if (v17)
      {
        int v14 = v17;
        goto LABEL_22;
      }
    }
    int v18 = [(UBProcessorV4 *)self _appendFrames:a3 cfp:v10];
    int v14 = v18;
    if (!self->_aggregateErr && v18)
    {
      self->_int aggregateErr = -73463;
      goto LABEL_22;
    }
    if (v18) {
      goto LABEL_22;
    }
    ++self->_nInputBrackets;
    int v19 = [(UBProcessorV4 *)self _perFrameProcessing:self->_nrfPlist input:a3 cfp:v10];
    int v14 = v19;
    if (!self->_aggregateErr && v19)
    {
      self->_int aggregateErr = -73463;
LABEL_22:
      FigDebugAssert3();
      goto LABEL_24;
    }
    if (v19) {
      goto LABEL_22;
    }
  }
  else
  {
    FigDebugAssert3();
    int v14 = -12786;
  }
LABEL_24:
  CMSampleBufferGetPresentationTimeStamp(&v22, a3);
  [(UBProcessorV4 *)self EndKTraceEventForAddFrame:v10 timestamp:&v22 processingType:self->_processingType];

  if (dword_26B430EE8)
  {
    uint64_t v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v14;
}

- (int)updateEV0ReferenceFrameIfNecessary
{
  if (self->_batchCount >= 1)
  {
    self->_int referenceFrameIndex = 0;
    return 0;
  }
  if (self->_ev0SampleBuffer) {
    return 0;
  }
  int referenceFrameIndex = self->_referenceFrameIndex;
  if (referenceFrameIndex < 0) {
    return 0;
  }
  int preBracketFrameIndex = self->_preBracketFrameIndex;
  if (preBracketFrameIndex != referenceFrameIndex)
  {
    BOOL v7 = preBracketFrameIndex != -1 && preBracketFrameIndex < referenceFrameIndex;
    int v8 = referenceFrameIndex - v7;
    if (referenceFrameIndex - v7 >= self->_cntBracketSampleBuffers) {
      return 0;
    }
    int v9 = [(NRFFrameProperties *)self->_bracketProperties[v8] meta];
    int v10 = [v9 isEVMFrame];

    if (!v10)
    {
      ev0SampleBuffer = self->_ev0SampleBuffer;
      int v12 = self->_bracketSampleBuffers[v8];
      self->_ev0SampleBuffer = v12;
      if (v12) {
        CFRetain(v12);
      }
      if (ev0SampleBuffer) {
        CFRelease(ev0SampleBuffer);
      }
      self->_int referenceFrameIndex = v8;
      return 0;
    }
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)_appendFrames:(opaqueCMSampleBuffer *)a3 cfp:(id)a4
{
  id v7 = a4;
  int v8 = [v7 meta];
  int v9 = [v8 isPreBracketedFrame];

  if (v9)
  {
    self->_int preBracketFrameIndex = self->_cntBracketSampleBuffers;
    objc_storeStrong((id *)&self->_prebracketedProperties, a4);
LABEL_11:
    int v13 = 0;
    goto LABEL_12;
  }
  int v10 = [v7 meta];
  int v11 = [v10 isEVMFrame];

  int cntBracketSampleBuffers = self->_cntBracketSampleBuffers;
  if (v11) {
    self->_uint64_t sifrFrameIndex = cntBracketSampleBuffers;
  }
  if (cntBracketSampleBuffers <= 3)
  {
    if (a3)
    {
      int v14 = (objc_class *)CFRetain(a3);
      int cntBracketSampleBuffers = self->_cntBracketSampleBuffers;
    }
    else
    {
      int v14 = 0;
    }
    int v15 = &self->super.isa + cntBracketSampleBuffers;
    v15[19] = v14;
    objc_storeStrong((id *)v15 + 24, a4);
    ++self->_cntBracketSampleBuffers;
    if (isSingleFrameProcessing(self->_processingType)) {
      goto LABEL_11;
    }
    int v13 = [(UBProcessorV4 *)self updateEV0ReferenceFrameIfNecessary];
    if (v13) {
      FigDebugAssert3();
    }
  }
  else
  {
    int v13 = -73262;
  }
LABEL_12:

  return v13;
}

- (int)processSingleImage
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned int v3 = self->_bracketSampleBuffers[0];
  if (!v3
    || (CMGetAttachment(v3, (CFStringRef)*MEMORY[0x263F2EF78], 0), (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    unsigned int v65 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v44 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
    int v42 = -73248;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    id v7 = 0;
    BOOL v5 = 0;
LABEL_76:
    int v10 = 0;
    uint64_t v26 = 0;
    goto LABEL_48;
  }
  BOOL v5 = (void *)v4;
  id v6 = self->_bracketProperties[0];
  if (!v6)
  {
    unsigned int v65 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    id v45 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
    int v42 = -73248;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    id v7 = 0;
    goto LABEL_76;
  }
  id v7 = v6;
  unsigned int processingType = self->_processingType;
  if (processingType == 7)
  {
    int v9 = [(DenoiseFusePipeline *)self->_denoiseFusePipeline waitForSFDToFinishWithFrameIndex:0 frameProperties:v6];
    if (v9)
    {
      int v42 = v9;
      unsigned int v65 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v54 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      goto LABEL_76;
    }
  }
  int v10 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
  if ([(VideoDefringingTuningParameters *)self->_nrfPlist->defringingTuningParameters defringingEnabled])
  {
    int v11 = [v10 isEqualToString:*MEMORY[0x263F2EF00]] ^ 1;
    if (processingType == 5) {
      LOBYTE(v11) = 1;
    }
    char v58 = v11;
  }
  else
  {
    char v58 = 0;
  }
  toneMapping = self->_nrfPlist->toneMapping;
  if (toneMapping) {
    BOOL YellowSatFixEnabled = toneMapping->YellowSatFixEnabled;
  }
  else {
    BOOL YellowSatFixEnabled = 0;
  }
  int v14 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2F3F8]];
  int v15 = [v14 intValue];

  uint64_t v59 = v10;
  if (v15 != 1)
  {
    id v16 = self->_nrfPlist->toneMapping;
    if (v16)
    {
      BOOL v17 = !v16->maskedSkyFixEnabled;
      char v18 = !YellowSatFixEnabled;
      if (v17) {
        char v18 = 1;
      }
      if ((v18 & 1) == 0)
      {
        FigDebugAssert3();
        uint64_t v26 = 0;
        int v42 = 0;
        goto LABEL_48;
      }
      char v19 = !v17 || YellowSatFixEnabled;
      if (v17) {
        int v20 = 2;
      }
      else {
        int v20 = 3;
      }
      if (v19)
      {
        int v57 = v20;
        goto LABEL_32;
      }
      goto LABEL_30;
    }
  }
  if (!YellowSatFixEnabled)
  {
LABEL_30:
    int v21 = self->_doRedFaceFix - 1;
    goto LABEL_31;
  }
  int v21 = 2;
LABEL_31:
  int v57 = v21;
LABEL_32:
  CMTime v22 = [(NRFUBFusionOutput *)self->_nrfFusionOutput pixelBuffer];
  CMTime v23 = [(NRFUBFusionOutput *)self->_nrfFusionOutput inferenceInputPixelBuffer];
  uint64_t v24 = [(NRFUBFusionOutput *)self->_nrfFusionOutput gainMapOutputPixelBuffer];
  int v25 = objc_opt_respondsToSelector();
  if (v23)
  {
    if (v25) {
      goto LABEL_34;
    }
  }
  else if ([(NRFUBFusionOutput *)self->_nrfFusionOutput providesInferencesWithoutInferenceInputPixelBuffer] & v25)
  {
LABEL_34:
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __35__UBProcessorV4_processSingleImage__block_invoke;
    v61[3] = &unk_2655C8028;
    id v62 = WeakRetained;
    v63 = self;
    uint64_t v26 = (void *)MEMORY[0x263E64CF0](v61);

    if (!v23) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  uint64_t v26 = 0;
  if (!v23) {
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v27 = [(NRFUBFusionOutput *)self->_nrfFusionOutput inferenceInputPixelBuffer];
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane([(NRFUBFusionOutput *)self->_nrfFusionOutput pixelBuffer], 0);
  int v29 = [(UBProcessorV4 *)self _processInferenceImage:v27 sourceFrameType:0 sourceFrameIndex:0 ltcFrameIndex:0 gtcFrameIndex:0 originalWidth:WidthOfPlane originalHeight:CVPixelBufferGetHeightOfPlane([(NRFUBFusionOutput *)self->_nrfFusionOutput pixelBuffer], 0)];
  if (v29)
  {
    int v42 = v29;
    FigDebugAssert3();
    goto LABEL_47;
  }
LABEL_39:
  if (!v24)
  {
    if (!v22) {
      goto LABEL_46;
    }
LABEL_44:
    v33 = v7;
    uint64_t v34 = v5;
    uint64_t v35 = v26;
    BOOL v36 = processingType == 5;
    denoiseFusePipeline = self->_denoiseFusePipeline;
    uint64_t v38 = [(NRFUBFusionOutput *)self->_nrfFusionOutput pixelBuffer];
    v39 = [(NRFUBFusionOutput *)self->_nrfFusionOutput linearOutputPixelBuffer];
    id v40 = [(NRFUBFusionOutput *)self->_nrfFusionOutput linearOutputMIWBAppliedPixelBuffer];
    v41 = [(NRFUBFusionOutput *)self->_nrfFusionOutput linearOutputMIWBAppliedMetadata];
    LOBYTE(v56) = v36;
    uint64_t v26 = v35;
    BOOL v5 = v34;
    id v7 = v33;
    HIDWORD(v55) = v57;
    LOBYTE(v55) = v58;
    int v42 = -[DenoiseFusePipeline denoiseSingleImage:linearOutput:linearOutputMIWBAppliedPixelBuffer:linearOutputMIWBAppliedMetadata:inputFrameIndex:noiseMap:cfp:nrfPlist:style:inferenceProvider:defringeEnabled:colorCubeFixType:isLowLight:](denoiseFusePipeline, "denoiseSingleImage:linearOutput:linearOutputMIWBAppliedPixelBuffer:linearOutputMIWBAppliedMetadata:inputFrameIndex:noiseMap:cfp:nrfPlist:style:inferenceProvider:defringeEnabled:colorCubeFixType:isLowLight:", v38, v39, v40, v41, 0, 0, v33, self->_nrfPlist, self->_semanticStyleProperties, v26, v55, v56);

    if (v42)
    {
      unsigned int v65 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v46 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v52 = v65;
      if (os_log_type_enabled(v46, type)) {
        unsigned int v53 = v52;
      }
      else {
        unsigned int v53 = v52 & 0xFFFFFFFE;
      }
      if (v53)
      {
        int v66 = 136315394;
        uint64_t v67 = "-[UBProcessorV4 processSingleImage]";
        __int16 v68 = 1024;
        int v69 = v42;
        _os_log_send_and_compose_impl();
      }
      int v10 = v59;
    }
    else
    {
LABEL_46:
      int v42 = [(DenoiseFusePipeline *)self->_denoiseFusePipeline freeInputBandPyramids];
      if (!v42)
      {
LABEL_47:
        int v10 = v59;
        goto LABEL_48;
      }
      unsigned int v65 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v46 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v47 = v65;
      if (os_log_type_enabled(v46, type)) {
        unsigned int v48 = v47;
      }
      else {
        unsigned int v48 = v47 & 0xFFFFFFFE;
      }
      int v10 = v59;
      if (v48)
      {
        int v66 = 136315394;
        uint64_t v67 = "-[UBProcessorV4 processSingleImage]";
        __int16 v68 = 1024;
        int v69 = v42;
        _os_log_send_and_compose_impl();
      }
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_48;
  }
  if (CVPixelBufferGetPixelFormatType([(NRFUBFusionOutput *)self->_nrfFusionOutput gainMapOutputPixelBuffer]) != 1278226488)
  {
    FigDebugAssert3();
    int v42 = -12780;
    goto LABEL_47;
  }
  uint64_t v30 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:[(NRFUBFusionOutput *)self->_nrfFusionOutput gainMapOutputPixelBuffer] pixelFormat:10 usage:7 plane:0];
  if (!v30)
  {
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();
    goto LABEL_47;
  }
  uint64_t v31 = (void *)v30;
  int v32 = [(DenoiseFusePipeline *)self->_denoiseFusePipeline doGainMapOnSingleFrameWithFrameIndex:0 properties:v7 output:v30 outputHeadroom:&self->_outputGainMapHeadroom nrfPlist:self->_nrfPlist];
  if (!v32)
  {
    [(FigMetalContext *)self->_metal waitForSchedule];
    objc_msgSend(WeakRetained, "processor:outputReadyWithFrameType:outputPixelBuffer:outputMetadata:error:", self, 11, -[NRFUBFusionOutput gainMapOutputPixelBuffer](self->_nrfFusionOutput, "gainMapOutputPixelBuffer"), 0, 0);

    goto LABEL_44;
  }
  int v42 = v32;
  unsigned int v65 = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  uint64_t v49 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  unsigned int v50 = v65;
  if (os_log_type_enabled(v49, type)) {
    unsigned int v51 = v50;
  }
  else {
    unsigned int v51 = v50 & 0xFFFFFFFE;
  }
  if (v51)
  {
    int v66 = 136315138;
    uint64_t v67 = "-[UBProcessorV4 processSingleImage]";
    _os_log_send_and_compose_impl();
  }
  int v10 = v59;
  fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_48:
  return v42;
}

uint64_t __35__UBProcessorV4_processSingleImage__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processorGetInferenceResults:*(void *)(a1 + 40)];
}

- (int)_perFrameProcessing:(id)a3 input:(opaqueCMSampleBuffer *)a4 cfp:(id)a5
{
  long long v94 = a3;
  id v8 = a5;
  ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
  uint64_t v11 = PixelFormatType;
  int v12 = 1;
  if ((int)PixelFormatType > 1651926375)
  {
    if (PixelFormatType == 1651926376 || PixelFormatType == 1751527984) {
      goto LABEL_10;
    }
    int v13 = 2087216688;
  }
  else
  {
    if (PixelFormatType == 644376112 || PixelFormatType == 761816624) {
      goto LABEL_10;
    }
    int v13 = 795371056;
  }
  if (PixelFormatType != v13) {
    int v12 = 0;
  }
LABEL_10:
  int v14 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x263F2EF78], 0);
  if (!v14)
  {
    uint64_t v79 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT);
LABEL_94:
    int v17 = -73258;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_87;
  }
  if (!self->_nrfFusionOutput)
  {
    FigDebugAssert3();
    uint64_t v79 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT);
    goto LABEL_94;
  }
  int v15 = [v8 meta];
  char v16 = [v15 isPreBracketedFrame];

  if ((v16 & 1) == 0)
  {
    BOOL v18 = [(UBProcessorV4 *)self _isMetadataConsistentWithFirstFrame];
    if (v18) {
      int v17 = 0;
    }
    else {
      int v17 = -73445;
    }
    int aggregateErr = self->_aggregateErr;
    if (!aggregateErr && !v18)
    {
      self->_int aggregateErr = -73445;
      goto LABEL_86;
    }
    if (aggregateErr) {
      goto LABEL_86;
    }
    BOOL v20 = [(UBProcessorV4 *)self shouldDownsampleRWPPInputWithPixelFormat:v11 processingType:self->_processingType];
    BOOL v93 = v20;
    if (!CMGetAttachment(a4, (CFStringRef)*MEMORY[0x263F2EF58], 0))
    {
      int v21 = self->_regWarpM2M ? v12 : 1;
      if ((v21 & v20) == 1)
      {
        int cntBracketSampleBuffers = self->_cntBracketSampleBuffers;
        if (cntBracketSampleBuffers > self->_referenceFrameIndex)
        {
          int v23 = cntBracketSampleBuffers - 1;
          if (self->_curRegWarpTempIndex != cntBracketSampleBuffers - 1)
          {
            regWarpHelper = self->_regWarpHelper;
            regWarpInput = self->_regWarpInput;
            int v25 = [(FigMetalContext *)self->_metal commandBuffer];
            int v17 = [(RegWarpHelper *)regWarpHelper convertInput10BitPixBuf:ImageBuffer downsampledOutput8BitPixBuf:regWarpInput mtlCommandBuffer:v25];

            if (!self->_aggregateErr && v17)
            {
              self->_int aggregateErr = -73464;
              goto LABEL_86;
            }
            if (v17) {
              goto LABEL_86;
            }
            [(FigMetalContext *)self->_metal waitForSchedule];
            self->_curRegWarpTempIndex = v23;
          }
        }
      }
    }
    uint64_t v26 = [(NRFUBFusionOutput *)self->_nrfFusionOutput inferenceInputPixelBuffer];
    if (!isSingleFrameProcessing(self->_processingType))
    {
      int v17 = -73258;
      if (self->_processingType != 1) {
        goto LABEL_87;
      }
      BOOL referenceFrameHasEVMinus = self->_referenceFrameHasEVMinus;
      int v36 = [v8 inputColorSpace];
      int v91 = self->_cntBracketSampleBuffers;
      int referenceFrameIndex = self->_referenceFrameIndex;
      int v37 = [(DenoiseFusePipeline *)self->_denoiseFusePipeline addFrame:ImageBuffer cfp:v8 processingType:self->_processingType createPyramid:1 batchCount:self->_batchCount];
      int v17 = v37;
      int v38 = self->_aggregateErr;
      if (!v38 && v37)
      {
        self->_int aggregateErr = -73462;
        goto LABEL_86;
      }
      if (v38) {
        goto LABEL_86;
      }
      if (!referenceFrameHasEVMinus
        && v26
        && v36
        && v91 - 1 == referenceFrameIndex
        && (unsigned int v65 = [(NRFUBFusionOutput *)self->_nrfFusionOutput inferenceInputPixelBuffer],
            uint64_t v66 = self->_referenceFrameIndex,
            size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane([(NRFUBFusionOutput *)self->_nrfFusionOutput pixelBuffer], 0), (v68 = [(UBProcessorV4 *)self _processInferenceImage:v65 sourceFrameType:0 sourceFrameIndex:v66 ltcFrameIndex:v66 gtcFrameIndex:v66 originalWidth:WidthOfPlane originalHeight:CVPixelBufferGetHeightOfPlane([(NRFUBFusionOutput *)self->_nrfFusionOutput pixelBuffer], 0)]) != 0))
      {
        int v17 = v68;
      }
      else
      {
        if (!*(unsigned char *)(v94[6] + 72)) {
          goto LABEL_40;
        }
        int v69 = [v8 meta];
        int v70 = [v69 isEVMFrame];

        if (!v70) {
          goto LABEL_40;
        }
        int v71 = [(DenoiseFusePipeline *)self->_denoiseFusePipeline baseLayer:ImageBuffer];
        int v17 = v71;
        int v72 = self->_aggregateErr;
        if (v72 || !v71)
        {
          if (v72) {
            goto LABEL_86;
          }
LABEL_40:
          if (self->_regWarpM2M) {
            char v31 = v12;
          }
          else {
            char v31 = 1;
          }
          if ((v31 & 1) == 0 && v93)
          {
            int v32 = self->_cntBracketSampleBuffers;
            if (v32 > self->_referenceFrameIndex)
            {
              int v33 = v32 - 1;
              if (self->_curRegWarpTempIndex != v32 - 1)
              {
                int v34 = [(UBProcessorV4 *)self _downsampleImageForRegistration:ImageBuffer outputImage:self->_regWarpInput];
                int v17 = v34;
                if (!self->_aggregateErr && v34)
                {
                  self->_int aggregateErr = -73464;
                  goto LABEL_86;
                }
                if (v34) {
                  goto LABEL_86;
                }
                self->_curRegWarpTempIndex = v33;
              }
            }
          }
          int v73 = [(UBProcessorV4 *)self _registerImages:0];
          int v17 = v73;
          int v75 = self->_aggregateErr;
          if (v75 || !v73)
          {
            if (!v75)
            {
              LODWORD(v74) = 1.0;
              [(opaqueCMSampleBuffer *)self->_bracketSampleBuffers[self->_cntBracketSampleBuffers + 4] setBlurryFrameWeight:v74];
              int v76 = [(UBProcessorV4 *)self _processSIFRandRefEV0IfPossible:0];
              int v17 = v76;
              int v77 = self->_aggregateErr;
              if (v77 || !v76)
              {
                if (!v77) {
                  goto LABEL_87;
                }
              }
              else
              {
                self->_int aggregateErr = -73461;
              }
            }
          }
          else
          {
            self->_int aggregateErr = -73464;
          }
          goto LABEL_86;
        }
        self->_int aggregateErr = -73446;
      }
LABEL_86:
      FigDebugAssert3();
      goto LABEL_87;
    }
    uint64_t v27 = objc_opt_new();
    uint64_t v28 = (void *)v27;
    unsigned int processingType = self->_processingType;
    if (processingType > 8)
    {
LABEL_39:

      goto LABEL_40;
    }
    if (((1 << processingType) & 0x161) != 0)
    {
      int v30 = -[DenoiseFusePipeline addFrame:cfp:processingType:createPyramid:batchCount:](self->_denoiseFusePipeline, "addFrame:cfp:processingType:createPyramid:batchCount:", ImageBuffer, v8);
      if (!v30) {
        goto LABEL_39;
      }
      int v80 = v30;
      simd_float4 v92 = v28;
      FigDebugAssert3();
      int v17 = v80;
LABEL_102:

      goto LABEL_87;
    }
    if (processingType != 7) {
      goto LABEL_39;
    }
    simd_float4 v92 = (void *)v27;
    v39 = [(FigMetalContext *)self->_metal allocator];
    id v40 = (void *)[v39 newTextureDescriptor];

    int v89 = v40;
    if (v40)
    {
      int v85 = -73258;
      v41 = [v40 desc];
      [v41 setUsage:7];

      int v42 = [v40 desc];
      [v42 setPixelFormat:25];

      size_t v43 = CVPixelBufferGetWidthOfPlane(ImageBuffer, 0);
      v44 = [v40 desc];
      [v44 setWidth:v43];

      size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(ImageBuffer, 0);
      uint64_t v46 = [v40 desc];
      [v46 setHeight:HeightOfPlane];

      [v40 setLabel:0];
      unsigned int v47 = [(FigMetalContext *)self->_metal allocator];
      uint64_t v48 = [v47 newTextureWithDescriptor:v40];
      uint64_t v49 = (void *)v92[2];
      v92[2] = v48;

      if (v92[2])
      {
        unsigned int v50 = [v40 desc];
        [v50 setPixelFormat:65];

        unsigned int v51 = [v40 desc];
        unint64_t v86 = (unint64_t)[v51 width] >> 1;
        [v40 desc];
        v53 = unsigned int v52 = v40;
        [v53 setWidth:v86];

        uint64_t v54 = [v52 desc];
        unint64_t v87 = (unint64_t)[v54 height] >> 1;
        uint64_t v55 = [v52 desc];
        [v55 setHeight:v87];

        [v52 setLabel:0];
        uint64_t v56 = [(FigMetalContext *)self->_metal allocator];
        uint64_t v57 = [v56 newTextureWithDescriptor:v52];
        char v58 = (void *)v92[3];
        v92[3] = v57;

        if (v92[3])
        {
          uint64_t v59 = [v8 meta];
          int v60 = *(_DWORD *)([v59 exposureParams] + 120);

          uint64_t v61 = &OBJC_IVAR___NRFPlist_learnedNRTuning;
          if (v60 == 1) {
            uint64_t v61 = &OBJC_IVAR___NRFPlist_quadraLearnedNRTuning;
          }
          id v62 = *(id *)((char *)&self->_nrfPlist->super.super.isa + *v61);
          uint64_t v28 = v92;
          int v63 = [(DenoiseFusePipeline *)self->_denoiseFusePipeline startSFDWithInputSampleBuffer:a4 inputMetadata:v14 outputImage:v92 tuning:v62];
          if (v63)
          {
            int v82 = v63;
            FigDebugAssert3();

            int v85 = v82;
          }
          else
          {

            LODWORD(v84) = self->_batchCount;
            int v64 = [(DenoiseFusePipeline *)self->_denoiseFusePipeline addFrameWithInputLuma:v92[2] inputChroma:v92[3] inputYCbCr:0 cfp:v8 processingType:self->_processingType createPyramid:0 batchCount:v84];
            if (!v64)
            {

              goto LABEL_39;
            }
            int v83 = v64;
            FigDebugAssert3();
            int v85 = v83;
          }
          goto LABEL_101;
        }
      }
      long long v81 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT);
    }
    else
    {
      int v85 = -73258;
      long long v81 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT);
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_101:
    int v17 = v85;
    goto LABEL_102;
  }
  int v17 = 0;
LABEL_87:

  return v17;
}

- (BOOL)_isMetadataConsistentWithFirstFrame
{
  if (self->_cntBracketSampleBuffers >= 2)
  {
    bracketProperties = self->_bracketProperties;
    unsigned int v3 = self->_bracketProperties[0];
    uint64_t v4 = bracketProperties[*((int *)bracketProperties + 423) - 1];
    int v5 = [(NRFFrameProperties *)v3 contentExtended];
    int v6 = [(NRFFrameProperties *)v4 contentExtended];
    BOOL v7 = [(NRFFrameProperties *)v3 contentExtended];
    if (v5 == v6)
    {
      if (v7)
      {
        [(NRFFrameProperties *)v3 extendedDimensions];
        int32x2_t v22 = v21;
        [(NRFFrameProperties *)v4 extendedDimensions];
        if ((vceq_s32(v22, v23).u8[0] & 1) == 0
          || ([(NRFFrameProperties *)v3 extendedDimensions],
              int32x2_t v25 = v24,
              [(NRFFrameProperties *)v4 extendedDimensions],
              (vceq_s32(v25, v26).i32[1] & 1) == 0))
        {
LABEL_21:
          FigDebugAssert3();
          FigSignalErrorAt();
          goto LABEL_22;
        }
      }
    }
    else
    {
      if (v7) {
        id v8 = v3;
      }
      else {
        id v8 = v4;
      }
      int v9 = v8;
      if ([(NRFFrameProperties *)v3 contentExtended]) {
        int v10 = v4;
      }
      else {
        int v10 = v3;
      }
      uint64_t v11 = v10;
      int v12 = [(NRFFrameProperties *)v11 meta];
      unsigned int v13 = *(double *)([v12 ROI] + 16);
      int v14 = [(NRFFrameProperties *)v11 meta];
      uint64_t v15 = [v14 ROI];
      v16.i32[0] = v13;
      v16.i32[1] = *(double *)(v15 + 24);
      int32x2_t v33 = v16;

      [(NRFFrameProperties *)v9 extendedDimensions];
      unsigned int v32 = v17;
      [(NRFFrameProperties *)v9 extendedDimensions];
      uint32x2_t v19 = (uint32x2_t)vceq_s32((int32x2_t)__PAIR64__(v18, v32), v33);
      if ((vpmin_u32(v19, v19).u32[0] & 0x80000000) == 0)
      {
        FigDebugAssert3();

LABEL_22:
        BOOL v20 = 0;
        goto LABEL_17;
      }
    }
    uint64_t v27 = [(NRFFrameProperties *)v3 meta];
    int v28 = [v27 sensorID];
    int v29 = [(NRFFrameProperties *)v4 meta];
    int v30 = [v29 sensorID];

    if (v28 == v30)
    {
      BOOL v20 = 1;
LABEL_17:

      return v20;
    }
    goto LABEL_21;
  }
  return 1;
}

- (void)finishScheduling
{
}

- (int)finishProcessing
{
  return 0;
}

- (void)dealloc
{
  [(UBProcessorV4 *)self resetState];
  [(UBProcessorV4 *)self purgeResources];
  v3.receiver = self;
  v3.super_class = (Class)UBProcessorV4;
  [(UBProcessorV4 *)&v3 dealloc];
}

- (NSString)description
{
  return (NSString *)@"UBProcessorV4";
}

- (int)prewarmWithTuningParameters:(id)a3
{
  objc_storeStrong((id *)&self->_tuningParameters, a3);

  return [(UBProcessorV4 *)self prewarm];
}

- (int)prewarm
{
  if (!self->_metalCommandQueue)
  {
    int v30 = -73240;
LABEL_47:
    FigDebugAssert3();
    return v30;
  }
  metal = self->_metal;
  if (metal)
  {
    uint64_t v4 = [(FigMetalContext *)metal commandQueue];

    int v5 = self->_metal;
    if (!v4)
    {
      [(FigMetalContext *)self->_metal setCommandQueue:self->_metalCommandQueue];
      int v5 = self->_metal;
    }
    goto LABEL_6;
  }
  id v6 = objc_alloc(MEMORY[0x263F2EE30]);
  BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = (FigMetalContext *)[v6 initWithbundle:v7 andOptionalCommandQueue:self->_metalCommandQueue];
  int v9 = self->_metal;
  self->_metal = v8;

  int v5 = self->_metal;
  if (!v5)
  {
    int v30 = -73240;
    goto LABEL_47;
  }
LABEL_6:
  int v10 = +[DenoiseFusePipeline prewarmShaders:v5];
  int v11 = +[TextureUtils prewarmShaders:self->_metal];
  if (v11) {
    int v10 = v11;
  }
  int v12 = +[RegPyrFusion prewarmShaders:self->_metal];
  if (v12) {
    int v10 = v12;
  }
  int v13 = +[RegDense prewarmShaders:self->_metal];
  if (v13) {
    int v10 = v13;
  }
  int v14 = +[BilateralGrid prewarmShaders:self->_metal];
  if (v14) {
    int v10 = v14;
  }
  int v15 = +[PyramidStage prewarmShaders:self->_metal];
  if (v15) {
    int v10 = v15;
  }
  int v16 = +[DenoiseRemixStage prewarmShaders:self->_metal tuningParameters:self->_tuningParameters plistEntryName:@"NRFParameters"];
  if (v16) {
    int v10 = v16;
  }
  int v17 = +[FusionRemixStage prewarmShaders:self->_metal];
  if (v17) {
    int v10 = v17;
  }
  int v18 = +[ToneMappingStage prewarmShaders:self->_metal];
  if (v18) {
    int v10 = v18;
  }
  int v19 = +[SubjectRelightingStage prewarmShaders:self->_metal];
  if (v19) {
    int v10 = v19;
  }
  int v20 = +[BlinkDetectionStage prewarmShaders:self->_metal];
  if (v20) {
    int v10 = v20;
  }
  if ([(UBProcessorV4 *)self _isGainMapSupported])
  {
    int v21 = +[GainMapStage prewarmShaders:self->_metal];
    if (v21) {
      int v10 = v21;
    }
  }
  if ([(UBProcessorV4 *)self _isSemanticStylesSupported])
  {
    int v22 = +[SemanticStylesStage prewarmShaders:self->_metal];
    if (v22) {
      int v10 = v22;
    }
  }
  int v23 = +[OutliersRemovalStage prewarmShaders:self->_metal];
  if (v23) {
    int v10 = v23;
  }
  int v24 = +[RegWarpHelper prewarmShaders:self->_metal];
  if (v24) {
    int v10 = v24;
  }
  int v25 = +[DefringeStage prewarmShaders:self->_metal tuningParameters:self->_tuningParameters];
  if (v25) {
    int v10 = v25;
  }
  int v26 = +[GreenGhostBrightLightStage prewarmShaders:self->_metal];
  if (v26) {
    int v27 = v26;
  }
  else {
    int v27 = v10;
  }
  int v28 = [(FigMetalContext *)self->_metal commandQueue];
  int v29 = +[LearnedNRMetalStage prewarmShadersWithCommandQueue:v28];

  if (v29) {
    return v29;
  }
  else {
    return v27;
  }
}

- (int)setupWithOptions:(id)a3 nrfConfig:(id)a4
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  p_nrfConfig = &self->_nrfConfig;
  objc_storeStrong((id *)&self->_nrfConfig, a4);
  if (!self->_nrfConfig) {
    goto LABEL_51;
  }
  self->_deviceGeneration = objc_msgSend(v6, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F7B0], 0, 0);
  uint64_t v8 = *MEMORY[0x263F2F1F8];
  int v9 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2F1F8]];
  if (!v9)
  {
    FigDebugAssert3();
    int v63 = FigSignalErrorAt();
LABEL_47:

    goto LABEL_43;
  }
  uint64_t v10 = objc_opt_new();
  nrfPlist = self->_nrfPlist;
  common = nrfPlist->common;
  nrfPlist->common = (CommonPlist *)v10;

  int v13 = self->_nrfPlist->common;
  int v14 = [v9 objectForKeyedSubscript:@"Common"];
  int v15 = [v14 objectForKeyedSubscript:@"NRFParameters"];
  LODWORD(v13) = [(CommonPlist *)v13 readPlist:v15];

  if (v13)
  {
    FigDebugAssert3();
    int v63 = 0;
    goto LABEL_47;
  }

  id v16 = objc_alloc(MEMORY[0x263F2EE10]);
  int v17 = [(FigMetalContext *)self->_metal device];
  int v18 = (void *)[v16 initWithDevice:v17 allocatorType:self->_nrfConfig->_allocatorType];
  [(FigMetalContext *)self->_metal setAllocator:v18];

  int v19 = [(FigMetalContext *)self->_metal allocator];

  if (!v19) {
    goto LABEL_51;
  }
  if (self->_cameraInfoByPortType)
  {
    int v20 = [[LSCGainsPlist alloc] initWithDictionary:self->_cameraInfoByPortType metal:self->_metal];
    lscGainsPlist = self->_lscGainsPlist;
    self->_lscGainsPlist = v20;

    if (!self->_lscGainsPlist)
    {
      FigDebugAssert3();
      int v63 = 0;
      goto LABEL_43;
    }
    int v22 = [[GlobalDistortionCorrectionByPortType alloc] initWithDictionary:self->_cameraInfoByPortType];
    globalDistortionCorrectionByPortType = self->_globalDistortionCorrectionByPortType;
    self->_globalDistortionCorrectionByPortType = v22;

    if (!self->_globalDistortionCorrectionByPortType)
    {
LABEL_51:
      FigDebugAssert3();
      int v63 = FigSignalErrorAt();
      goto LABEL_43;
    }
  }
  uint64_t v66 = v8;
  id v67 = v7;
  int v68 = v6;
  id v73 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v72 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  obuint64_t j = self->_tuningParams;
  uint64_t v74 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v89 objects:v96 count:16];
  if (v74)
  {
    BOOL v24 = 0;
    uint64_t v70 = *(void *)v90;
    int v71 = self;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v90 != v70) {
          objc_enumerationMutation(obj);
        }
        uint64_t v75 = v25;
        int v26 = [(NSMutableDictionary *)self->_tuningParams objectForKeyedSubscript:*(void *)(*((void *)&v89 + 1) + 8 * v25)];
        id v27 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        long long v85 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        int v28 = [v26 objectForKeyedSubscript:@"DenoiseAndSharpening"];
        uint64_t v29 = [v28 countByEnumeratingWithState:&v85 objects:v95 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v86;
          do
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v86 != v31) {
                objc_enumerationMutation(v28);
              }
              uint64_t v33 = *(void *)(*((void *)&v85 + 1) + 8 * i);
              int v34 = [v26 objectForKeyedSubscript:@"DenoiseAndSharpening"];
              uint64_t v35 = [v34 objectForKeyedSubscript:v33];
              [v27 setObject:v35 forKeyedSubscript:v33];
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v85 objects:v95 count:16];
          }
          while (v30);
        }

        [v73 addObject:v27];
        id v36 = objc_alloc_init(MEMORY[0x263EFF9A0]);

        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        int v37 = [v26 objectForKeyedSubscript:@"ToneMapping"];
        uint64_t v38 = [v37 countByEnumeratingWithState:&v81 objects:v94 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v82;
          do
          {
            for (uint64_t j = 0; j != v39; ++j)
            {
              if (*(void *)v82 != v40) {
                objc_enumerationMutation(v37);
              }
              uint64_t v42 = *(void *)(*((void *)&v81 + 1) + 8 * j);
              size_t v43 = [v26 objectForKeyedSubscript:@"ToneMapping"];
              v44 = [v43 objectForKeyedSubscript:v42];

              [v36 setObject:v44 forKeyedSubscript:v42];
              if (v44[95]) {
                (*p_nrfConfig)->_enableSTF = 1;
              }
            }
            uint64_t v39 = [v37 countByEnumeratingWithState:&v81 objects:v94 count:16];
          }
          while (v39);
        }

        [v72 addObject:v36];
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v45 = [v26 objectForKeyedSubscript:@"MIWBParameters"];
        uint64_t v46 = [v45 countByEnumeratingWithState:&v77 objects:v93 count:16];
        if (v46)
        {
          uint64_t v47 = v46;
          uint64_t v48 = *(void *)v78;
          do
          {
            for (uint64_t k = 0; k != v47; ++k)
            {
              if (*(void *)v78 != v48) {
                objc_enumerationMutation(v45);
              }
              uint64_t v50 = *(void *)(*((void *)&v77 + 1) + 8 * k);
              unsigned int v51 = [v26 objectForKeyedSubscript:@"MIWBParameters"];
              unsigned int v52 = [v51 objectForKeyedSubscript:v50];

              if (v52) {
                BOOL v24 = (v52[16] | v24) != 0;
              }
            }
            uint64_t v47 = [v45 countByEnumeratingWithState:&v77 objects:v93 count:16];
          }
          while (v47);
        }

        (*p_nrfConfig)->_enableMIWB = v24;
        uint64_t v25 = v75 + 1;
        self = v71;
      }
      while (v75 + 1 != v74);
      uint64_t v74 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v89 objects:v96 count:16];
    }
    while (v74);
  }

  unsigned int v53 = [DenoiseFusePipeline alloc];
  metal = self->_metal;
  cameraInfoByPortType = self->_cameraInfoByPortType;
  nrfConfig = self->_nrfConfig;
  id v6 = v68;
  uint64_t v57 = [v68 objectForKeyedSubscript:v66];
  LODWORD(v65) = self->_deviceGeneration;
  char v58 = [(DenoiseFusePipeline *)v53 initWithContext:metal cameraInfo:cameraInfoByPortType nrfConfig:nrfConfig dasTuningOptions:v73 toneMappingOptions:v72 tuningParameters:v57 deviceGeneration:v65];
  denoiseFusePipeline = self->_denoiseFusePipeline;
  self->_denoiseFusePipeline = v58;

  if (self->_denoiseFusePipeline)
  {

    [(DenoiseFusePipeline *)self->_denoiseFusePipeline setFusionReferenceFrame:0];
    [(DenoiseFusePipeline *)self->_denoiseFusePipeline setSidecarWriter:self];
    int v60 = self->_denoiseFusePipeline;
    uint64_t v61 = [v68 objectForKeyedSubscript:v66];
    int v62 = [(DenoiseFusePipeline *)v60 setupHazeCorrectionTuningParameters:v61];

    int v63 = 0;
    id v7 = v67;
    if (v62)
    {
      FigDebugAssert3();
      int v63 = v62;
    }
  }
  else
  {
    FigDebugAssert3();

    int v63 = -12780;
    id v7 = v67;
  }
LABEL_43:

  return v63;
}

- (int)getOptions:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  int v4 = -73252;
  id v5 = a3;
  if (v5 && self->_tuningParams && self->_tuningParamsPlist)
  {
    uint64_t v6 = objc_opt_new();
    nrfPlist = self->_nrfPlist;
    common = nrfPlist->common;
    nrfPlist->common = (CommonPlist *)v6;

    int v9 = self->_nrfPlist->common;
    uint64_t v10 = [v5 objectForKeyedSubscript:@"Common"];
    int v11 = objc_msgSend(v10, "objectForKeyedSubscript:");
    LODWORD(v9) = [(CommonPlist *)v9 readPlist:v11];

    if (v9)
    {
      FigDebugAssert3();
    }
    else
    {
      int v12 = [v5 objectForKeyedSubscript:@"DefaultSensorIDs"];
      if (v12)
      {
        int v13 = v12;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v29 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v29)
        {
          uint64_t v28 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v29; ++i)
            {
              if (*(void *)v34 != v28) {
                objc_enumerationMutation(v13);
              }
              uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              id v16 = [v5 objectForKeyedSubscript:v15];
              uint64_t v31 = v15;
              int v17 = [v13 objectForKeyedSubscript:v15];
              int v18 = [v16 allKeys];
              if (([v18 containsObject:v17] & 1) == 0)
              {
                uint64_t v19 = [v18 firstObject];

                int v17 = (void *)v19;
              }
              int v20 = [v16 objectForKeyedSubscript:v17];
              unsigned int v32 = [v20 objectForKeyedSubscript:@"NRFParameters"];
              int v21 = [v32 objectForKeyedSubscript:@"NRFParameters"];
              if (v21) {
                getNRFTuningForSensor(v17, v21, self->_tuningParams, self->_tuningParamsPlist, self->_nrfConfig->_isDepthEnabled);
              }
              int v22 = [v20 objectForKeyedSubscript:@"ChromaticDefringing"];
              if (v22)
              {
                uint64_t v30 = v18;
                int v23 = v16;
                BOOL v24 = v13;
                id v25 = v5;
                int v26 = [[VideoDefringingTuningParameters alloc] initWithTuningParameters:v22];
                [(VideoDefringingTuningParameters *)v26 selectParametersForTuningMode:0];
                [(NSMutableDictionary *)self->_defringingTuningByPortType setObject:v26 forKeyedSubscript:v31];

                id v5 = v25;
                int v13 = v24;
                id v16 = v23;
                int v18 = v30;
              }
            }
            uint64_t v29 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
          }
          while (v29);
        }

        int v4 = 0;
      }
    }
  }

  return v4;
}

- (unint64_t)calculateBackingBufferSizeForDesc:(id)a3 nrfConfig:(id)a4 processingType:(unsigned int)a5 metal:(id)a6
{
  id v9 = a3;
  uint64_t v10 = a4;
  int v11 = *((unsigned __int8 *)v10 + 61);
  int v12 = v10[5];
  int v13 = v10[7];
  float v14 = (float)(int)[v9 width];
  if ((float)(v14 / (float)(int)[v9 height]) <= 1.5) {
    float v15 = 1.0;
  }
  else {
    float v15 = 0.85;
  }
  if (v10[5] == 1 && (v10[7] & 0x80000000) == 0) {
    goto LABEL_33;
  }
  if (v11)
  {
    [v9 pixelFormat];
    OSType v16 = FigCaptureUncompressedPixelFormatForPixelFormat();
    uint64_t PixelSizeInBytes = GetPixelSizeInBytes(v16, 0);
    if (PixelSizeInBytes)
    {
      unint64_t v18 = PixelSizeInBytes;
      BOOL v19 = *((unsigned char *)v10 + 102) != 0;
      if (a5)
      {
        if (a5 != 7 && a5 != 5)
        {
          BOOL v19 = 0;
          if (*((unsigned char *)v10 + 102)) {
            goto LABEL_23;
          }
LABEL_22:
          float v21 = 1.0;
          if (self->_processingType != 7)
          {
LABEL_24:
            float v22 = 100.0;
            if (v19) {
              float v22 = 130.0;
            }
            unint64_t v20 = (unint64_t)(float)((float)((float)(v15 * v22) * v21) * (float)v18);
            if (!v20)
            {
              FigDebugAssert3();
              FigSignalErrorAt();
            }
            goto LABEL_28;
          }
LABEL_23:
          float v21 = (float)(int)[v9 width] / 4224.0;
          goto LABEL_24;
        }
        BOOL v19 = 1;
      }
      if (*((unsigned char *)v10 + 102)) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
LABEL_33:
    FigDebugAssert3();
    FigSignalErrorAt();
    unint64_t v20 = 0;
    goto LABEL_28;
  }
  if (v12 == 2) {
    unint64_t v20 = 183;
  }
  else {
    unint64_t v20 = 173;
  }
  if (([v9 allowModifyingInputBuffers] & 1) == 0)
  {
    if (*((unsigned char *)v10 + 76)) {
      unint64_t v20 = 450;
    }
    else {
      unint64_t v20 = 250;
    }
  }
LABEL_28:
  float v23 = 0.78;
  if (v13 <= 0) {
    float v23 = 1.0;
  }
  if (!v13) {
    float v23 = 1.03;
  }
  unint64_t v24 = vcvts_n_u32_f32(v23 * (float)v20, 0x14uLL);

  return v24;
}

- (int)determineWorkingBufferRequirementsToProcess:(unsigned int)a3 prepareDescriptor:(id)a4 nrfConfig:(id)a5 denoiseFusePipelineSize:(unint64_t *)a6 rwppSize:(unint64_t *)a7 rwppInputWidth:(unint64_t *)a8 rwppInputHeight:(unint64_t *)a9
{
  uint64_t v13 = *(void *)&a3;
  id v15 = a4;
  OSType v16 = a5;
  int v17 = v16;
  if (!v15 || !v16)
  {
    FigDebugAssert3();
LABEL_27:
    int v31 = FigSignalErrorAt();
    goto LABEL_24;
  }
  long long v33 = a8;
  int v18 = [v15 width];
  int v19 = [v15 height];
  BOOL v20 = -[UBProcessorV4 shouldDownsampleRWPPInputWithPixelFormat:processingType:](self, "shouldDownsampleRWPPInputWithPixelFormat:processingType:", [v15 pixelFormat], v13);
  if (v20) {
    uint64_t v21 = 875704422;
  }
  else {
    uint64_t v21 = [v15 pixelFormat];
  }
  if ((isSingleFrameProcessing(v13) & 1) != 0 || v17[9] != 2)
  {
    unint64_t v27 = 0;
    unint64_t v28 = 0;
    unint64_t v29 = 0;
  }
  else
  {
    int v22 = v19 + 15;
    uint64_t v23 = (v18 + 15) & 0xFFFFFFF0;
    signed int v24 = v22 & 0xFFFFFFF0;
    long long v25 = *(_OWORD *)&self->_registrationPipelineRWPPConfig.ransacMinMatchingScoreAccepted;
    v34[1] = *(_OWORD *)&self->_registrationPipelineRWPPConfig.nccPatchRadius;
    long long v35 = v25;
    v34[0] = *(_OWORD *)&self->_registrationPipelineRWPPConfig.numThreads;
    BYTE12(v35) = v20;
    unsigned int v26 = [MEMORY[0x263F2EE70] computeExternalMemoryBlockSize:v34 imageWidth:v23 imageHeight:v22 & 0xFFFFFFF0 imageFormat:v21];
    unint64_t v27 = (*MEMORY[0x263EF8AF8] + v26 - 1) & -*MEMORY[0x263EF8AF8];
    if (v20) {
      unint64_t v28 = (unint64_t)(int)v23 >> 1;
    }
    else {
      unint64_t v28 = 0;
    }
    if (v20) {
      unint64_t v29 = (unint64_t)v24 >> 1;
    }
    else {
      unint64_t v29 = 0;
    }
  }
  unint64_t v30 = [(UBProcessorV4 *)self calculateBackingBufferSizeForDesc:v15 nrfConfig:v17 processingType:v13 metal:self->_metal];
  if (!v30)
  {
    FigDebugAssert3();
    goto LABEL_27;
  }
  if (a6) {
    *a6 = (v30 + *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8];
  }
  if (a7) {
    *a7 = v27;
  }
  if (v33) {
    unint64_t *v33 = v28;
  }
  int v31 = 0;
  if (a9) {
    *a9 = v29;
  }
LABEL_24:

  return v31;
}

- (int)determineWorkingBufferRequirementsWithPrepareDescriptorByProcessingType:(id)a3 nrfConfig:(id)a4 memoryAllocationInfo:(id *)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v27 = a4;
  if (v27 && a5)
  {
    uint64_t v23 = a5;
    id v24 = v7;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    obuint64_t j = v7;
    uint64_t v28 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v28)
    {
      unint64_t v8 = 0;
      unint64_t v9 = 0;
      unint64_t v10 = 0;
      unint64_t v11 = 0;
      unint64_t v12 = 0;
      unsigned int v13 = 0;
      unint64_t v14 = 0;
      uint64_t v25 = *(void *)v35;
      while (1)
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(obj);
          }
          OSType v16 = *(void **)(*((void *)&v34 + 1) + 8 * v15);
          unint64_t v32 = 0;
          unint64_t v33 = 0;
          unint64_t v30 = 0;
          unint64_t v31 = 0;
          uint64_t v17 = [v16 intValue];
          int v18 = [obj objectForKeyedSubscript:v16];
          objc_msgSend(v18, "setWidth:", (objc_msgSend(v18, "width") + 15) & 0xFFFFFFF0);
          objc_msgSend(v18, "setHeight:", (objc_msgSend(v18, "height") + 15) & 0xFFFFFFF0);
          int v19 = [(UBProcessorV4 *)self determineWorkingBufferRequirementsToProcess:v17 prepareDescriptor:v18 nrfConfig:v27 denoiseFusePipelineSize:&v33 rwppSize:&v32 rwppInputWidth:&v31 rwppInputHeight:&v30];
          if (v19)
          {
            int v21 = v19;
            FigDebugAssert3();
LABEL_36:

            goto LABEL_37;
          }
          if (!v33)
          {
            FigDebugAssert3();
            int v21 = -4;
            goto LABEL_36;
          }
          if (v14 <= v33) {
            unint64_t v14 = v33;
          }
          if (v8 <= v32) {
            unint64_t v8 = v32;
          }
          if (v9 <= v31) {
            unint64_t v9 = v31;
          }
          if (v10 <= v30) {
            unint64_t v10 = v30;
          }
          if (v13)
          {
            if (v11) {
              goto LABEL_20;
            }
          }
          else
          {
            unsigned int v13 = [v18 pixelFormat];
            if (v11)
            {
LABEL_20:
              if (!v12) {
                goto LABEL_28;
              }
              goto LABEL_21;
            }
          }
          unint64_t v11 = (int)[v18 width];
          if (!v12) {
LABEL_28:
          }
            unint64_t v12 = (int)[v18 height];
LABEL_21:
          if (v13 != [v18 pixelFormat]
            || v11 != (int)[v18 width]
            || v12 != (int)[v18 height])
          {
            FigDebugAssert3();
            int v21 = FigSignalErrorAt();
            goto LABEL_36;
          }

          ++v15;
        }
        while (v28 != v15);
        uint64_t v20 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
        uint64_t v28 = v20;
        if (!v20) {
          goto LABEL_32;
        }
      }
    }
    unint64_t v8 = 0;
    unint64_t v9 = 0;
    unint64_t v10 = 0;
    unint64_t v11 = 0;
    unint64_t v12 = 0;
    unsigned int v13 = 0;
    unint64_t v14 = 0;
LABEL_32:

    int v21 = 0;
    v23->var0 = v14;
    v23->var1 = v8;
    v23->var2 = v11;
    v23->var3 = v12;
    v23->var4 = v13;
    v23->var5 = v9;
    v23->var6 = v10;
LABEL_37:
    id v7 = v24;
  }
  else
  {
    FigDebugAssert3();
    int v21 = FigSignalErrorAt();
  }

  return v21;
}

- (int)bindResourcesForProcessingType:(unsigned int)a3 prepareDescriptor:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  objc_msgSend(v7, "setWidth:", objc_msgSend(v6, "width"));
  objc_msgSend(v7, "setHeight:", objc_msgSend(v6, "height"));
  objc_msgSend(v7, "setPixelFormat:", objc_msgSend(v6, "pixelFormat"));
  [v7 setProcessingType:v4];
  char v12 = 0;
  if ([(DenoiseFusePipeline *)self->_denoiseFusePipeline allocateResourcesIfNeededForDesc:v7 didAllocate:&v12])
  {
    FigDebugAssert3();
    int v10 = FigSignalErrorAt();
  }
  else if ((isSingleFrameProcessing(v4) & 1) != 0 {
         || self->_nrfConfig->_regMethod != 2
  }
         || (BOOL v8 = -[UBProcessorV4 shouldDownsampleRWPPInputWithPixelFormat:processingType:](self, "shouldDownsampleRWPPInputWithPixelFormat:processingType:", [v6 pixelFormat], v4), !v12)&& self->_regwarpHasBeenSetup&& self->_registrationPipelineRWPPConfig.skipInitialDownsample == v8)
  {
    int v10 = 0;
  }
  else
  {
    [(RegWarpPP *)self->_registrationPipelineRWPP releaseResources];
    registrationPipelineRWPP = self->_registrationPipelineRWPP;
    self->_registrationPipelineRWPP = 0;

    int v10 = -[UBProcessorV4 _bindRegWarpPPWithWidth:height:pixelFormat:](self, "_bindRegWarpPPWithWidth:height:pixelFormat:", (int)[v6 width], (int)objc_msgSend(v6, "height"), objc_msgSend(v6, "pixelFormat"));
    if (v10)
    {
      FigDebugAssert3();
      FigSignalErrorAt();
    }
    else
    {
      self->_regwarpHasBeenSetup = 1;
    }
  }

  return v10;
}

- (int)prepareToProcess:(unsigned int)a3 prepareDescriptor:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = v6;
  if (v4 == 2)
  {
    int v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v14 = -12782;
    goto LABEL_16;
  }
  self->_unsigned int processingType = v4;
  objc_msgSend(v6, "setWidth:", (objc_msgSend(v6, "width") + 15) & 0xFFFFFFF0);
  objc_msgSend(v7, "setHeight:", (objc_msgSend(v7, "height") + 15) & 0xFFFFFFF0);
  if (!self->_allocatorSetupComplete
    || (allocatorBackend = self->_allocatorBackend,
        [(FigMetalContext *)self->_metal allocator],
        unint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [v9 backendAllocator],
        int v10 = (FigMetalAllocatorBackend *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        allocatorBackend != v10))
  {
    unint64_t v11 = objc_opt_new();
    char v12 = v11;
    if (v11)
    {
      [v11 setCompressionLevel:self->_nrfConfig->_compressionLevel];
      [v12 setLabel:@"FigMetalAllocator_UBProcessor"];
      objc_msgSend(v12, "setMemSize:", -[FigMetalAllocatorBackend memSize](self->_allocatorBackend, "memSize"));
      [v12 setAllowFallback:1];
      unsigned int v13 = [(FigMetalContext *)self->_metal allocator];
      int v14 = [v13 setupWithDescriptor:v12 allocatorBackend:self->_allocatorBackend];

      if (!v14)
      {
        self->_allocatorSetupComplete = 1;

        goto LABEL_7;
      }
      FigDebugAssert3();
      uint64_t v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      FigDebugAssert3();
      int v14 = FigSignalErrorAt();
    }

    goto LABEL_16;
  }
LABEL_7:
  -[DenoiseFusePipeline setAllowModifyingInputBuffers:](self->_denoiseFusePipeline, "setAllowModifyingInputBuffers:", [v7 allowModifyingInputBuffers]);
  [(DenoiseFusePipeline *)self->_denoiseFusePipeline setStfAllowed:self->_stfAllowed];
  nrfConfig = self->_nrfConfig;
  int defaultDoRedFaceFix = nrfConfig->_defaultDoRedFaceFix;
  if ((defaultDoRedFaceFix & 0x80000000) == 0) {
    self->_doRedFaceFix = defaultDoRedFaceFix != 0;
  }
  BOOL learnedNREnabled = self->_learnedNREnabled;
  if (v4) {
    BOOL learnedNREnabled = v4 == 7 || v4 == 5;
  }
  nrfConfig->_localGainMapEnabled = learnedNREnabled;
  [(DenoiseFusePipeline *)self->_denoiseFusePipeline reset];
  [(DenoiseFusePipeline *)self->_denoiseFusePipeline setFusionMode:isSingleFrameProcessing(self->_processingType) ^ 1];
  int v14 = [(UBProcessorV4 *)self bindResourcesForProcessingType:v4 prepareDescriptor:v7];
  if (v14) {
    FigSignalErrorAt();
  }
LABEL_16:

  return v14;
}

- (int)prepareToProcess:(unsigned int)a3
{
  return -73249;
}

- (int)fusionMode
{
  int v2 = [(DenoiseFusePipeline *)self->_denoiseFusePipeline fusionReferenceFrame];
  if (v2 == 1) {
    return 1;
  }
  else {
    return 2 * (v2 == 2);
  }
}

- (void)setFusionMode:(int)a3
{
  if (a3 == 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2 * (a3 == 2);
  }
  [(DenoiseFusePipeline *)self->_denoiseFusePipeline setFusionReferenceFrame:v3];
}

- (int)referenceFrameIndex
{
  return self->_referenceFrameIndex;
}

- (void)setReferenceFrameIndex:(int)a3
{
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  self->_int referenceFrameIndex = a3;
  int v5 = [(UBProcessorV4 *)self _registerImages:0];
  int aggregateErr = self->_aggregateErr;
  if (aggregateErr) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if (!v7)
  {
    self->_int aggregateErr = -73464;
LABEL_12:
    FigDebugAssert3();
    return;
  }
  if (aggregateErr) {
    goto LABEL_12;
  }
  int v8 = [(UBProcessorV4 *)self _processSIFRandRefEV0IfPossible:0];
  int v9 = self->_aggregateErr;
  if (!v9 && v8)
  {
    self->_int aggregateErr = -73461;
    goto LABEL_12;
  }
  if (v9) {
    goto LABEL_12;
  }
}

- (int)purgeResources
{
  [(DenoiseFusePipeline *)self->_denoiseFusePipeline releaseResources];
  CVPixelBufferRelease(self->_regWarpInput);
  self->_regWarpInput = 0;
  nrfConfig = self->_nrfConfig;
  if (nrfConfig && nrfConfig->_regMethod == 2)
  {
    [(RegWarpPP *)self->_registrationPipelineRWPP releaseResources];
    self->_regwarpHasBeenSetup = 0;
  }
  sharedMetalBuffer = self->_sharedMetalBuffer;
  self->_sharedMetalBuffer = 0;

  self->_usingExternalSharedMetalBuffer = 0;
  sharedRegWarpBuffer = self->_sharedRegWarpBuffer;
  self->_sharedRegWarpBuffer = 0;

  self->_usingExternalSharedRegWarpBuffer = 0;
  id v6 = [(FigMetalContext *)self->_metal allocator];
  [v6 purgeResources];

  self->_allocatorSetupComplete = 0;
  return 0;
}

- (void)addToSidecar:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(NSMutableDictionary *)self->_sidecar objectForKeyedSubscript:v6],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    int v8 = [(NSMutableDictionary *)self->_sidecar objectForKeyedSubscript:v6];
    [v8 addEntriesFromDictionary:v9];
  }
  else
  {
    [(NSMutableDictionary *)self->_sidecar setObject:v9 forKeyedSubscript:v6];
  }
}

- (BOOL)_isGainMapSupported
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  [(NSDictionary *)self->_tuningParameters objectForKeyedSubscript:@"DefaultSensorIDs"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v15 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        BOOL v7 = [v2 objectForKeyedSubscript:v6];
        int v8 = [(NSDictionary *)self->_tuningParameters objectForKeyedSubscript:v6];
        id v9 = [v8 objectForKeyedSubscript:v7];
        int v10 = [v9 objectForKeyedSubscript:@"NRFParameters"];
        unint64_t v11 = [v10 objectForKeyedSubscript:@"NRFParameters"];
        char v12 = [v11 objectForKeyedSubscript:@"GainMap"];

        if (v12)
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)_isSemanticStylesSupported
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  [(NSDictionary *)self->_tuningParameters objectForKeyedSubscript:@"DefaultSensorIDs"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v15 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        BOOL v7 = [v2 objectForKeyedSubscript:v6];
        int v8 = [(NSDictionary *)self->_tuningParameters objectForKeyedSubscript:v6];
        id v9 = [v8 objectForKeyedSubscript:v7];
        int v10 = [v9 objectForKeyedSubscript:@"NRFParameters"];
        unint64_t v11 = [v10 objectForKeyedSubscript:@"NRFParameters"];
        char v12 = [v11 objectForKeyedSubscript:@"SemanticStyles"];

        if (v12)
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (void)setLinearOutputMetadata:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = *(int *)&self->_anon_240[980];
    uint64_t v6 = *(int *)&self->_anon_240[988];
    bracketProperties = self->_bracketProperties;
    id v31 = v4;
    int v8 = [(NRFFrameProperties *)self->_bracketProperties[v5] meta];
    uint64_t v9 = [v8 exposureParams];
    int v10 = [(NRFFrameProperties *)self->_bracketProperties[v6] meta];
    float RelativeBrightness = getRelativeBrightness(v9, [v10 exposureParams], 2);

    char v12 = [(NRFFrameProperties *)self->_bracketProperties[v5] meta];
    int v13 = *(_DWORD *)([v12 exposureParams] + 36);

    int v14 = [(NRFFrameProperties *)self->_bracketProperties[v5] meta];
    int v15 = *(_DWORD *)([v14 exposureParams] + 24);

    [v31 setObject:*MEMORY[0x263F04038] forKeyedSubscript:*MEMORY[0x263F04020]];
    [v31 setObject:*MEMORY[0x263F03FE8] forKeyedSubscript:*MEMORY[0x263F03FC0]];
    toneMapping = self->_nrfPlist->toneMapping;
    if (toneMapping
      && toneMapping->enableSTF
      && [(DenoiseFusePipeline *)self->_denoiseFusePipeline getSTFStillApplied])
    {
      long long v17 = [(DenoiseFusePipeline *)self->_denoiseFusePipeline getSTFLTM_asNSData];
      [v31 setObject:v17 forKeyedSubscript:*MEMORY[0x263F2F530]];
    }
    else
    {
      long long v17 = [(NRFFrameProperties *)bracketProperties[v5] meta];
      long long v18 = getLTM_asNSData((unsigned __int16 *)[v17 ltmCurves]);
      [v31 setObject:v18 forKeyedSubscript:*MEMORY[0x263F2F530]];
    }
    long long v19 = [(NRFFrameProperties *)bracketProperties[v6] meta];
    long long v20 = getLUT_asNSData((unsigned __int16 *)([v19 ltmCurves] + 221232));
    [v31 setObject:v20 forKeyedSubscript:*MEMORY[0x263F2F4D8]];

    int v21 = [(NRFFrameProperties *)bracketProperties[v6] meta];
    uint64_t v22 = getLUT_asNSData((unsigned __int16 *)([v21 ltmCurves] + 221748));
    [v31 setObject:v22 forKeyedSubscript:*MEMORY[0x263F2F4E8]];

    LODWORD(v23) = v13;
    id v24 = [NSNumber numberWithFloat:v23];
    [v31 setObject:v24 forKeyedSubscript:*MEMORY[0x263F2F0F8]];

    *(float *)&double v25 = RelativeBrightness;
    unsigned int v26 = [NSNumber numberWithFloat:v25];
    [v31 setObject:v26 forKeyedSubscript:*MEMORY[0x263F2F0F0]];

    LODWORD(v27) = v15;
    uint64_t v28 = [NSNumber numberWithFloat:v27];
    [v31 setObject:v28 forKeyedSubscript:*MEMORY[0x263F2F0D8]];

    unint64_t v29 = [(NRFFrameProperties *)bracketProperties[v5] meta];
    unint64_t v30 = +[ToneMappingStage getHighlightCompression_asNSArray:](ToneMappingStage, "getHighlightCompression_asNSArray:", [v29 ltmCurves]);
    [v31 setObject:v30 forKeyedSubscript:*MEMORY[0x263F2F080]];

    id v4 = v31;
  }
}

- (void)_prepareOutputMetadata
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (dword_26B430EE8)
  {
    uint64_t v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int aggregateErr = self->_aggregateErr;
  unsigned int processingType = self->_processingType;
  uint64_t v6 = [(DenoiseFusePipeline *)self->_denoiseFusePipeline getSRLStatus];
  v45[0] = 0;
  updateGreenGhostMitigationMakerNoteFromSidecarDict(self->_processingType == 1, (int *)v45, self->_sidecar);
  if (self->_nrfFusionOutput)
  {
    int v7 = processingType << 12;
    if (processingType > 0xF) {
      int v7 = 61440;
    }
    if (aggregateErr >= 255) {
      int v8 = 255;
    }
    else {
      int v8 = aggregateErr;
    }
    uint64_t v9 = [NSNumber numberWithUnsignedInt:v7 | v8];
    int v10 = [(NRFUBFusionOutput *)self->_nrfFusionOutput metadata];
    [v10 setObject:v9 forKeyedSubscript:*MEMORY[0x263F2F130]];

    unint64_t v11 = [NSNumber numberWithUnsignedInt:v6];
    char v12 = [(NRFUBFusionOutput *)self->_nrfFusionOutput metadata];
    [v12 setObject:v11 forKeyedSubscript:*MEMORY[0x263F2F128]];

    *(float *)&double v13 = self->_outputGainMapHeadroom;
    int v14 = [NSNumber numberWithFloat:v13];
    int v15 = [(NRFUBFusionOutput *)self->_nrfFusionOutput metadata];
    [v15 setObject:v14 forKeyedSubscript:*MEMORY[0x263F2F068]];

    if (self->_processingType != 5)
    {
      OSType v16 = [NSNumber numberWithInt:self->_nInputBrackets];
      long long v17 = [(NRFUBFusionOutput *)self->_nrfFusionOutput metadata];
      [v17 setObject:v16 forKeyedSubscript:*MEMORY[0x263F2F118]];

      long long v18 = [NSNumber numberWithInt:self->_nRegisteredFrames];
      long long v19 = [(NRFUBFusionOutput *)self->_nrfFusionOutput metadata];
      [v19 setObject:v18 forKeyedSubscript:*MEMORY[0x263F2F120]];

      long long v20 = [NSNumber numberWithUnsignedInt:v45[0]];
      int v21 = [(NRFUBFusionOutput *)self->_nrfFusionOutput metadata];
      [v21 setObject:v20 forKeyedSubscript:*MEMORY[0x263F2F0B8]];
    }
    uint64_t v22 = [(NRFUBFusionOutput *)self->_nrfFusionOutput linearOutputMetadata];
    [(UBProcessorV4 *)self setLinearOutputMetadata:v22];

    toneMapping = self->_nrfPlist->toneMapping;
    if (toneMapping && toneMapping->enableSTF)
    {
      id v24 = [(NRFUBFusionOutput *)self->_nrfFusionOutput metadata];
      [v24 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F2F190]];

      double v25 = objc_msgSend(NSNumber, "numberWithBool:", -[DenoiseFusePipeline getSTFStillApplied](self->_denoiseFusePipeline, "getSTFStillApplied"));
      unsigned int v26 = [(NRFUBFusionOutput *)self->_nrfFusionOutput metadata];
      [v26 setObject:v25 forKeyedSubscript:*MEMORY[0x263F2F180]];

      if (![(DenoiseFusePipeline *)self->_denoiseFusePipeline getSTFStillApplied]) {
        goto LABEL_17;
      }
      double v27 = NSNumber;
      denoiseFusePipeline = self->_denoiseFusePipeline;
      unint64_t v29 = [(NRFUBFusionOutput *)self->_nrfFusionOutput linearOutputMetadata];
      unint64_t v30 = objc_msgSend(v27, "numberWithInt:", -[DenoiseFusePipeline getSTFStillCorrectionStrength:](denoiseFusePipeline, "getSTFStillCorrectionStrength:", v29 != 0));
      id v31 = [(NRFUBFusionOutput *)self->_nrfFusionOutput metadata];
      [v31 setObject:v30 forKeyedSubscript:*MEMORY[0x263F2F188]];

      unint64_t v32 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DenoiseFusePipeline getSTFStillAnalyticsVersion](self->_denoiseFusePipeline, "getSTFStillAnalyticsVersion"));
      unint64_t v33 = [(NRFUBFusionOutput *)self->_nrfFusionOutput metadata];
      [v33 setObject:v32 forKeyedSubscript:*MEMORY[0x263F2F178]];
    }
    else
    {
      unint64_t v32 = [(NRFUBFusionOutput *)self->_nrfFusionOutput metadata];
      [v32 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F2F190]];
    }

LABEL_17:
    if (self->_nrfPlist->outputNoiseModel)
    {
      long long v34 = [(NRFFrameProperties *)self->_referenceFrameProperties meta];
      long long v35 = +[OutputNoiseModel generateNoiseModelFromReferenceFrameMetadata:v34 nFusedFrames:self->_nInputBrackets tuningPlist:self->_nrfPlist->outputNoiseModel];

      if (v35)
      {
        long long v36 = [(NRFUBFusionOutput *)self->_nrfFusionOutput metadata];
        [v36 setObject:v35 forKeyedSubscript:*MEMORY[0x263F2F138]];
      }
    }
  }
  long long v37 = [(NRFUBFusionOutput *)self->_nrfFusionOutput gainMapOutputMetadata];
  if (v37)
  {
    BOOL isMeteorPlusPlusEnabled = self->_nrfConfig->_isMeteorPlusPlusEnabled;

    if (isMeteorPlusPlusEnabled)
    {
      uint64_t v39 = self->_denoiseFusePipeline;
      uint64_t v40 = [(NRFUBFusionOutput *)self->_nrfFusionOutput gainMapOutputMetadata];
      v41 = [(NRFFrameProperties *)self->_referenceFrameProperties meta];
      uint64_t v42 = [v41 faces];
      -[DenoiseFusePipeline prepareGainMapMetadata:hasFaces:](v39, "prepareGainMapMetadata:hasFaces:", v40, [v42 count] != 0);
    }
  }
}

- (int)_multiFrameProcessing
{
  int v3 = [(UBProcessorV4 *)self updateEV0ReferenceFrameIfNecessary];
  int v4 = v3;
  int aggregateErr = self->_aggregateErr;
  if (aggregateErr) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v3 == 0;
  }
  if (!v6) {
    goto LABEL_13;
  }
  if (aggregateErr) {
    return v4;
  }
  int v7 = [(UBProcessorV4 *)self _registerImages:1];
  int v4 = v7;
  int v8 = self->_aggregateErr;
  if (!v8 && v7)
  {
    int v9 = -73464;
LABEL_14:
    self->_int aggregateErr = v9;
    return v4;
  }
  if (v8) {
    return v4;
  }
  int v10 = [(UBProcessorV4 *)self _processSIFRandRefEV0IfPossible:1];
  int v4 = v10;
  int v11 = self->_aggregateErr;
  if (!v11)
  {
    if (v10)
    {
LABEL_13:
      int v9 = -73461;
      goto LABEL_14;
    }
  }
  if (v11) {
    return v4;
  }
  if (self->_nrfPlist->fusion)
  {
    int v13 = [(UBProcessorV4 *)self _setupFusionConfig];
    int v4 = v13;
    int v14 = self->_aggregateErr;
    if (v14 || !v13)
    {
      if (!v14)
      {
        [(UBProcessorV4 *)self storeReferenceIfNeeded];
        unsigned int processingType = self->_processingType;
        if (processingType - 5 < 4 || !processingType) {
          return v4;
        }
        if (processingType == 1)
        {
          int v16 = [(UBProcessorV4 *)self _nrfFuseImages];
          int v4 = v16;
          if (self->_aggregateErr || !v16) {
            return v4;
          }
          int v9 = -73459;
        }
        else
        {
          int v4 = -73260;
          if (self->_aggregateErr) {
            return v4;
          }
          int v9 = -73459;
        }
        goto LABEL_14;
      }
    }
    else
    {
      self->_int aggregateErr = -73450;
    }
    FigDebugAssert3();
    return v4;
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)_bindRegWarpPPWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5
{
  if (!a3 || !a4 || (LODWORD(v6) = a5) == 0)
  {
    FigDebugAssert3();
    return -1;
  }
  if (!self->_sharedRegWarpBuffer)
  {
    FigDebugAssert3();
    return -3;
  }
  BOOL v9 = [(UBProcessorV4 *)self shouldDownsampleRWPPInputWithPixelFormat:*(void *)&a5 processingType:self->_processingType];
  if (v9) {
    uint64_t v6 = 875704422;
  }
  else {
    uint64_t v6 = v6;
  }
  if (self->_registrationPipelineRWPP
    || (self->_registrationPipelineRWPPConfig.skipInitialDownsample = v9,
        int v10 = (RegWarpPP *)[objc_alloc(MEMORY[0x263F2EE70]) initWithConfig:&self->_registrationPipelineRWPPConfig], registrationPipelineRWPP = self->_registrationPipelineRWPP, self->_registrationPipelineRWPP = v10, registrationPipelineRWPP, self->_registrationPipelineRWPP))
  {
    int v12 = [(RegWarpPP *)self->_registrationPipelineRWPP allocateResources:a3 imageHeight:a4 imageFormat:v6 externalMemory:[(FigWiredMemory *)self->_sharedRegWarpBuffer bytes] externalMemorySize:[(FigWiredMemory *)self->_sharedRegWarpBuffer length]];
    int v13 = v12;
    if (self->_aggregateErr || !v12)
    {
      if (!v12) {
        return v13;
      }
    }
    else
    {
      self->_int aggregateErr = -73449;
    }
    FigDebugAssert3();
    return v13;
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)_nrfFuseImages
{
  location[16] = *(id *)MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v4 = [(NRFUBFusionOutput *)self->_nrfFusionOutput inferenceInputPixelBuffer];
  int v60 = WeakRetained;
  char v5 = objc_opt_respondsToSelector();
  if (!v4
    && ![(NRFUBFusionOutput *)self->_nrfFusionOutput providesInferencesWithoutInferenceInputPixelBuffer])
  {
    uint64_t v57 = 0;
    char v55 = 0;
    if (self->_nrfPlist->fusion) {
      goto LABEL_12;
    }
LABEL_61:
    FigDebugAssert3();
    int v66 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v49 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v56 = 0;
    uint64_t v47 = 0;
    long long v35 = 0;
    int v12 = -73259;
    goto LABEL_58;
  }
  char v55 = v5;
  if (v5)
  {
    uint64_t v6 = v67;
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = __31__UBProcessorV4__nrfFuseImages__block_invoke;
    v67[3] = &unk_2655C8028;
    uint64_t v54 = (id *)v68;
    v68[0] = v60;
    v68[1] = self;
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v57 = (void *)MEMORY[0x263E64CF0](v6);
  if (!self->_nrfPlist->fusion) {
    goto LABEL_61;
  }
  if (!v4) {
    goto LABEL_12;
  }
  if (self->_anon_240[1000])
  {
    FigDebugAssert3();
    int v50 = FigSignalErrorAt();
    goto LABEL_71;
  }
  int v7 = [(NRFUBFusionOutput *)self->_nrfFusionOutput inferenceInputPixelBuffer];
  uint64_t v8 = *(unsigned int *)&self->_anon_240[996];
  uint64_t v9 = *(unsigned int *)&self->_anon_240[980];
  uint64_t v10 = *(unsigned int *)&self->_anon_240[988];
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane([(NRFUBFusionOutput *)self->_nrfFusionOutput pixelBuffer], 0);
  int v12 = [(UBProcessorV4 *)self _processInferenceImage:v7 sourceFrameType:0 sourceFrameIndex:v8 ltcFrameIndex:v9 gtcFrameIndex:v10 originalWidth:WidthOfPlane originalHeight:CVPixelBufferGetHeightOfPlane([(NRFUBFusionOutput *)self->_nrfFusionOutput pixelBuffer], 0)];
  if (!v12)
  {
LABEL_12:
    bracketSampleBuffers = self->_bracketSampleBuffers;
    int v14 = self->_bracketSampleBuffers[*(int *)&self->_anon_240[988]];
    if (v14)
    {
      CFStringRef v15 = (const __CFString *)*MEMORY[0x263F2EF78];
      uint64_t v58 = CMGetAttachment(v14, (CFStringRef)*MEMORY[0x263F2EF78], 0);
      if (v58)
      {
        p_fusionConf = &self->_fusionConf;
        if (!-[DenoiseFusePipeline isHazeCorrectionEnabled:](self->_denoiseFusePipeline, "isHazeCorrectionEnabled:")
          || (uint64_t v16 = *(int *)&self->_anon_240[984], v16 == -1))
        {
          uint64_t v56 = 0;
        }
        else
        {
          long long v17 = bracketSampleBuffers[v16];
          if (!v17 || (CMGetAttachment(v17, v15, 0), (uint64_t v56 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            int v12 = FigSignalErrorAt();
            uint64_t v56 = 0;
            goto LABEL_74;
          }
          if ([(DenoiseFusePipeline *)self->_denoiseFusePipeline doHazeEstimation:p_fusionConf properties:self->_bracketProperties darkFrameMetadata:v56 ev0FrameMetadata:v58 applyCCM:1])
          {
            FigDebugAssert3();
            int v18 = FigSignalErrorAt();
LABEL_68:
            int v12 = v18;
            goto LABEL_74;
          }
        }
        bracketProperties = self->_bracketProperties;
        LOBYTE(v51) = 0;
        int v12 = -[DenoiseFusePipeline fuseFramesWithConfig:properties:nrfPlist:batchN:isLastBatch:usePatchBasedFusion:isLowLight:](self->_denoiseFusePipeline, "fuseFramesWithConfig:properties:nrfPlist:batchN:isLastBatch:usePatchBasedFusion:isLowLight:", p_fusionConf, self->_bracketProperties, v51);
        if (v12)
        {
          FigDebugAssert3();
LABEL_74:
          long long v35 = 0;
          goto LABEL_57;
        }
        int v20 = objc_opt_respondsToSelector();
        int v21 = objc_opt_respondsToSelector();
        char v22 = v21;
        if ((v20 | v21))
        {
          double v23 = [MEMORY[0x263EFF980] array];
          if (self->_cntBracketSampleBuffers >= 1)
          {
            uint64_t v24 = 19;
            do
            {
              ImageBuffer = CMSampleBufferGetImageBuffer(*(&self->super.isa + v24));
              IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
              uint64_t ID = IOSurfaceGetID(IOSurface);
              uint64_t v28 = [NSNumber numberWithUnsignedInt:ID];
              [v23 addObject:v28];

              if (v20) {
                [v60 processor:self didEnqueueProcessingForSurfaceID:ID];
              }
              uint64_t v29 = v24 - 18;
              ++v24;
            }
            while (v29 < self->_cntBracketSampleBuffers);
          }
          if (v22)
          {
            unint64_t v30 = [(FigMetalContext *)self->_metal commandQueue];
            id v31 = [v30 commandBuffer];

            [v31 setLabel:@"fusionCompletionBuffer"];
            objc_initWeak(location, self);
            v61[0] = MEMORY[0x263EF8330];
            v61[1] = 3221225472;
            v61[2] = __31__UBProcessorV4__nrfFuseImages__block_invoke_210;
            v61[3] = &unk_2655C8050;
            objc_copyWeak(&v64, location);
            id v62 = v23;
            id v63 = v60;
            [v31 addCompletedHandler:v61];
            [v31 commit];

            objc_destroyWeak(&v64);
            objc_destroyWeak(location);
          }
        }
        int cntBracketSampleBuffers = self->_cntBracketSampleBuffers;
        if (cntBracketSampleBuffers >= 1)
        {
          for (uint64_t i = 0; i < cntBracketSampleBuffers; ++i)
          {
            long long v34 = bracketSampleBuffers[i];
            if (v34)
            {
              CFRelease(v34);
              bracketSampleBuffers[i] = 0;
              int cntBracketSampleBuffers = self->_cntBracketSampleBuffers;
            }
          }
        }
        [(DenoiseFusePipeline *)self->_denoiseFusePipeline releaseInputBindings];
        if ([(NRFUBFusionOutput *)self->_nrfFusionOutput gainMapOutputPixelBuffer])
        {
          if (CVPixelBufferGetPixelFormatType([(NRFUBFusionOutput *)self->_nrfFusionOutput gainMapOutputPixelBuffer]) != 1278226488)
          {
            FigDebugAssert3();
            long long v35 = 0;
            int v12 = -12780;
LABEL_57:
            uint64_t v47 = (void *)v58;
            goto LABEL_58;
          }
          long long v35 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:[(NRFUBFusionOutput *)self->_nrfFusionOutput gainMapOutputPixelBuffer] pixelFormat:10 usage:7 plane:0];
          if (!v35)
          {
            FigDebugAssert3();
            int v18 = FigSignalErrorAt();
            goto LABEL_68;
          }
          LODWORD(v52) = self->_processingType;
          if ([(DenoiseFusePipeline *)self->_denoiseFusePipeline doGainMap:p_fusionConf properties:self->_bracketProperties output:v35 outputHeadroom:&self->_outputGainMapHeadroom nrfPlist:self->_nrfPlist useFusedFrame:1 processingType:v52])
          {
LABEL_69:
            FigDebugAssert3();
            int v12 = FigSignalErrorAt();
            goto LABEL_57;
          }
          [(FigMetalContext *)self->_metal waitForSchedule];
          objc_msgSend(v60, "processor:outputReadyWithFrameType:outputPixelBuffer:outputMetadata:error:", self, 11, -[NRFUBFusionOutput gainMapOutputPixelBuffer](self->_nrfFusionOutput, "gainMapOutputPixelBuffer"), 0, 0);
        }
        else
        {
          long long v35 = 0;
        }
        if ([(NRFUBFusionOutput *)self->_nrfFusionOutput linearOutputPixelBuffer])
        {
          int v12 = [(DenoiseFusePipeline *)self->_denoiseFusePipeline extractLinearBufferWithConfig:p_fusionConf referenceFrameProperties:bracketProperties[*(int *)&self->_anon_240[980]] output:[(NRFUBFusionOutput *)self->_nrfFusionOutput linearOutputPixelBuffer]];
          if (v12) {
            goto LABEL_57;
          }
        }
        [(DenoiseFusePipeline *)self->_denoiseFusePipeline resetFusion:self->_processingType];
        nrfPlist = self->_nrfPlist;
        toneMapping = nrfPlist->toneMapping;
        if (toneMapping)
        {
          BOOL YellowSatFixEnabled = toneMapping->YellowSatFixEnabled;
          BOOL maskedSkyFixEnabled = toneMapping->maskedSkyFixEnabled;
          if (!YellowSatFixEnabled || !maskedSkyFixEnabled)
          {
            if (maskedSkyFixEnabled) {
              int v41 = 3;
            }
            else {
              int v41 = 2;
            }
            if (!maskedSkyFixEnabled && !YellowSatFixEnabled) {
              int v41 = self->_doRedFaceFix - 1;
            }
            denoiseFusePipeline = self->_denoiseFusePipeline;
            semanticStyleProperties = self->_semanticStyleProperties;
            uint64_t v44 = [(NRFUBFusionOutput *)self->_nrfFusionOutput linearOutputMIWBAppliedPixelBuffer];
            p_nrfFusionOutput = &self->_nrfFusionOutput;
            uint64_t v46 = [(NRFUBFusionOutput *)self->_nrfFusionOutput linearOutputMIWBAppliedMetadata];
            BYTE4(v53) = 0;
            LODWORD(v53) = v41;
            int v12 = -[DenoiseFusePipeline toneMapAndDenoiseFusedFramesWithConfig:properties:nrfPlist:style:linearOutputMIWBAppliedPixelBuffer:linearOutputMIWBAppliedMetadata:output:inferenceProvider:colorCubeFixType:isLowLight:gainMap:](denoiseFusePipeline, "toneMapAndDenoiseFusedFramesWithConfig:properties:nrfPlist:style:linearOutputMIWBAppliedPixelBuffer:linearOutputMIWBAppliedMetadata:output:inferenceProvider:colorCubeFixType:isLowLight:gainMap:", p_fusionConf, bracketProperties, nrfPlist, semanticStyleProperties, v44, v46, [(NRFUBFusionOutput *)*p_nrfFusionOutput pixelBuffer], v57, v53, v35);

            if (v12) {
              FigDebugAssert3();
            }
          }
          else
          {
            FigDebugAssert3();
            int v12 = 0;
          }
          goto LABEL_57;
        }
        goto LABEL_69;
      }
    }
    int v50 = FigSignalErrorAt();
LABEL_71:
    int v12 = v50;
    goto LABEL_72;
  }
  FigDebugAssert3();
LABEL_72:
  uint64_t v56 = 0;
  uint64_t v47 = 0;
  long long v35 = 0;
LABEL_58:

  if (v55) {
  return v12;
  }
}

uint64_t __31__UBProcessorV4__nrfFuseImages__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processorGetInferenceResults:*(void *)(a1 + 40)];
}

void __31__UBProcessorV4__nrfFuseImages__block_invoke_210(id *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = a1[4];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(a1[5], "processor:didCompleteProcessingForSurfaceID:", WeakRetained, objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "unsignedIntValue", (void)v8));
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (int)_processInferenceImage:(__CVBuffer *)a3 sourceFrameType:(int)a4 sourceFrameIndex:(int)a5 ltcFrameIndex:(int)a6 gtcFrameIndex:(int)a7 originalWidth:(unint64_t)a8 originalHeight:(unint64_t)a9
{
  v38[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (self->_inferenceInputGenerated) {
      return 0;
    }
    uint64_t v12 = *(void *)&a7;
    uint64_t v13 = *(void *)&a6;
    uint64_t v14 = *(void *)&a5;
    uint64_t v15 = *(void *)&a4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      long long v34 = [[LumaChromaImage alloc] initWithContext:self->_metal pixelBuffer:a3 lumaAlignmentFactor:1 chromaAlignmentFactor:1];
      if (v34)
      {
        unint64_t v33 = WeakRetained;
        if ([(NRFFrameProperties *)self->_bracketProperties[(int)v13] inputColorSpace])
        {
          int v18 = [(DenoiseFusePipeline *)self->_denoiseFusePipeline toneMapBandFrame:v34 properties:self->_bracketProperties sourceFrameType:v15 sourceFrameIndex:v14 ltcFrameIndex:v13 gtcFrameIndex:v12 nrfPlist:self->_nrfPlist];
          if (v18)
          {
            int v10 = v18;
LABEL_25:
            FigDebugAssert3();
            goto LABEL_26;
          }
        }
        else
        {
          if (v15)
          {
            FigDebugAssert3();
            int v10 = FigSignalErrorAt();
LABEL_26:

            goto LABEL_16;
          }
          int v19 = [(DenoiseFusePipeline *)self->_denoiseFusePipeline downsampleUpperBandFrame:v34 sourceFrameIndex:v14];
          if (v19)
          {
            int v10 = v19;
            goto LABEL_25;
          }
        }
        int v20 = [(NRFFrameProperties *)self->_bracketProperties[(int)v14] meta];
        int v21 = (CGRect *)[v20 ROI];
        size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
        size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
        if (WidthOfPlane != a8 || (uint64_t v24 = 0, HeightOfPlane != a9))
        {
          memset(&v36, 0, sizeof(v36));
          CGAffineTransformMakeScale(&v36, (double)WidthOfPlane / (double)a8, (double)HeightOfPlane / (double)a9);
          CGRect v40 = *v21;
          CGAffineTransform v35 = v36;
          CGRect v41 = CGRectApplyAffineTransform(v40, &v35);
          CGFloat x = v41.origin.x;
          CGFloat y = v41.origin.y;
          CGFloat width = v41.size.width;
          CGFloat height = v41.size.height;
          id v29 = objc_alloc(MEMORY[0x263EFF9A0]);
          uint64_t v37 = *MEMORY[0x263F2F6E0];
          v42.origin.CGFloat x = x;
          v42.origin.CGFloat y = y;
          v42.size.CGFloat width = width;
          v42.size.CGFloat height = height;
          CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v42);
          v38[0] = DictionaryRepresentation;
          id v31 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
          uint64_t v24 = (void *)[v29 initWithDictionary:v31];
        }
        [(FigMetalContext *)self->_metal waitForSchedule];
        [v33 processor:self outputReadyWithFrameType:9 outputPixelBuffer:a3 outputMetadata:v24 error:0];
        self->_inferenceInputGenerated = 1;

        id WeakRetained = v33;
        int v10 = 0;
        goto LABEL_16;
      }
      FigDebugAssert3();
      int v10 = -12786;
    }
    else
    {
      FigDebugAssert3();
      int v10 = -12784;
    }
LABEL_16:

    return v10;
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)_setupFusionConfig
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  if (!self->_nrfPlist->fusion) {
    goto LABEL_84;
  }
  if (self->_cntBracketSampleBuffers >= 1)
  {
    uint64_t v3 = 0;
    bracketProperties = self->_bracketProperties;
    bracketSampleBuffers = self->_bracketSampleBuffers;
    do
    {
      uint64_t v6 = (id *)&bracketProperties[(int)v3];
      if ([*v6 hasValidRegistration])
      {
        uint64_t v3 = (v3 + 1);
        LODWORD(v7) = self->_cntBracketSampleBuffers;
      }
      else
      {
        long long v8 = [*v6 meta];
        int v9 = [v8 isEVMFrame];

        if (v9 || v3 == self->_referenceFrameIndex) {
          goto LABEL_83;
        }
        int v10 = bracketSampleBuffers[(int)v3];
        if (v10)
        {
          CFRelease(v10);
          bracketSampleBuffers[(int)v3] = 0;
        }
        uint64_t v7 = self->_cntBracketSampleBuffers - 1;
        if ((int)v3 < (int)v7)
        {
          objc_storeStrong((id *)&bracketProperties[(int)v3], bracketProperties[v7]);
          uint64_t v11 = self->_cntBracketSampleBuffers - 1;
          bracketSampleBuffers[(int)v3] = bracketSampleBuffers[v11];
          bracketSampleBuffers[v11] = 0;
          -[DenoiseFusePipeline swapInputFrame:withFrame:](self->_denoiseFusePipeline, "swapInputFrame:withFrame:", v3);
          LODWORD(v7) = self->_cntBracketSampleBuffers - 1;
          if (self->_referenceFrameIndex == v7) {
            self->_int referenceFrameIndex = v3;
          }
        }
        self->_uint64_t cntBracketSampleBuffers = v7;
      }
    }
    while ((int)v3 < (int)v7);
  }
  uint64_t v13 = self->_bracketProperties;
  uint64_t v12 = self->_bracketProperties[0];
  *(_DWORD *)&self->_anon_240[992] = -1;
  *(void *)&self->_anon_240[984] = -1;
  int v14 = [(NRFFrameProperties *)v12 inputColorSpace];
  self->_anon_240[1000] = v14 == 0;
  self->_anon_240[1001] = v14 == 1;
  self->_anon_240[1002] = v14 == 2;
  uint64_t v15 = [(NRFProgressiveBracketingParameters *)self->_progressiveBracketingParameters statistics];
  if ([v15 stationary]) {
    BOOL enableStationaryFusion = self->_nrfPlist->fusion->enableStationaryFusion;
  }
  else {
    BOOL enableStationaryFusion = 0;
  }
  p_fusionConf = &self->_fusionConf;
  self->_anon_240[1009] = enableStationaryFusion;

  self->_anon_240[1010] = self->_nrfPlist->fusion->hybridRegistrationMode == 2;
  self->_anon_240[1008] = 0;
  p_nonLinearScale = &self->_fusionConf.colorSpaceConversionParameters[4].transferFunctionInv.nonLinearScale;
  bzero(&self->_fusionConf.colorSpaceConversionParameters[4].transferFunctionInv.nonLinearScale, 0x410uLL);
  if (self->_cntBracketSampleBuffers >= 1)
  {
    uint64_t v18 = 0;
    while (v14 == [(NRFFrameProperties *)v13[v18] inputColorSpace])
    {
      int v19 = [(NRFFrameProperties *)v13[v18] colorSpaceConversionParameters];
      *(_OWORD *)p_nonLinearScale = *(_OWORD *)&v19->transferFunctionFwd.linearScale;
      long long v20 = *(_OWORD *)&v19[1].transferFunctionFwd.nonLinearScale;
      long long v22 = *(_OWORD *)&v19->transferFunctionFwd.nonLinearPower;
      long long v21 = *(_OWORD *)&v19->transferFunctionInv.nonLinearBias;
      *((_OWORD *)p_nonLinearScale + 3) = *(_OWORD *)&v19->chromaBias;
      *((_OWORD *)p_nonLinearScale + 4) = v20;
      *((_OWORD *)p_nonLinearScale + 1) = v22;
      *((_OWORD *)p_nonLinearScale + 2) = v21;
      long long v23 = *(_OWORD *)&v19[2].transferFunctionFwd.nonLinearPower;
      long long v25 = *(_OWORD *)&v19[1].transferFunctionInv.linearThreshold;
      long long v24 = *(_OWORD *)&v19[1].finalScaleFwd;
      *((_OWORD *)p_nonLinearScale + 7) = *(_OWORD *)&v19[2].transferFunctionFwd.linearScale;
      *((_OWORD *)p_nonLinearScale + 8) = v23;
      *((_OWORD *)p_nonLinearScale + 5) = v25;
      *((_OWORD *)p_nonLinearScale + 6) = v24;
      long long v26 = *(_OWORD *)&v19[3].transferFunctionInv.linearThreshold;
      long long v28 = *(_OWORD *)&v19[2].transferFunctionInv.nonLinearBias;
      long long v27 = *(_OWORD *)&v19[2].chromaBias;
      *((_OWORD *)p_nonLinearScale + 11) = *(_OWORD *)&v19[3].transferFunctionFwd.nonLinearScale;
      *((_OWORD *)p_nonLinearScale + 12) = v26;
      *((_OWORD *)p_nonLinearScale + 9) = v28;
      *((_OWORD *)p_nonLinearScale + 10) = v27;
      ++v18;
      uint64_t cntBracketSampleBuffers = self->_cntBracketSampleBuffers;
      p_nonLinearScale += 52;
      if (v18 >= cntBracketSampleBuffers)
      {
        if ((int)cntBracketSampleBuffers < 1) {
          goto LABEL_35;
        }
        uint64_t v30 = 0;
        id v31 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)MEMORY[0x263EF89A0];
        unint64_t v32 = &self->_fusionConf;
        while (1)
        {
          unint64_t v33 = [(NRFFrameProperties *)v13[v30] meta];
          int v34 = [v33 isEVMFrame];

          CGAffineTransform v35 = [(NRFFrameProperties *)v13[v30] meta];
          int v36 = [v35 isLongFrame];

          if (v30 == self->_referenceFrameIndex)
          {
            *(_DWORD *)&self->_anon_240[988] = v30;
          }
          else if (v34)
          {
            *(_DWORD *)&self->_anon_240[984] = v30;
          }
          else if (v36)
          {
            *(_DWORD *)&self->_anon_240[992] = v30;
          }
          BOOL v37 = [(NRFFrameProperties *)v13[v30] hasValidRegistration];
          uint64_t v38 = v31;
          if (v37) {
            uint64_t v38 = [(NRFFrameProperties *)v13[v30] regHomography];
          }
          long long v39 = *(_OWORD *)v38;
          long long v40 = *((_OWORD *)v38 + 2);
          *(_OWORD *)&v32->colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias = *((_OWORD *)v38 + 1);
          *(_OWORD *)&v32->colorSpaceConversionParameters[0].transferFunctionInv.nonLinearScale = v40;
          *(_OWORD *)&v32->preWarpEnabled = v39;
          fusion = self->_nrfPlist->fusion;
          if (!fusion) {
            break;
          }
          LOBYTE(self->_fusionConf.colorSpaceConversionParameters[4].transferFunctionFwd.nonLinearBias) = fusion->preWarpInputs;
          int v42 = [(NRFFrameProperties *)self->_bracketProperties[0] inputColorSpace];
          if (v42 != [(NRFFrameProperties *)v13[v30] inputColorSpace]) {
            goto LABEL_83;
          }
          ++v30;
          unint64_t v32 = (FusionConfiguration *)((char *)v32 + 48);
          if (v30 >= self->_cntBracketSampleBuffers) {
            goto LABEL_35;
          }
        }
        FigDebugAssert3();
        goto LABEL_84;
      }
    }
    goto LABEL_83;
  }
LABEL_35:
  if ((*(_DWORD *)&self->_anon_240[988] & 0x80000000) == 0)
  {
    if ((*(_DWORD *)&self->_anon_240[984] & 0x80000000) != 0) {
      [(DenoiseFusePipeline *)self->_denoiseFusePipeline setFusionReferenceFrame:1];
    }
    *(_DWORD *)&self->_anon_240[1004] = [(DenoiseFusePipeline *)self->_denoiseFusePipeline fusionReferenceFrame];
    int v43 = [(DenoiseFusePipeline *)self->_denoiseFusePipeline fusionReferenceFrame];
    uint64_t v44 = 1564;
    if (v43 == 2) {
      uint64_t v44 = 1560;
    }
    *(_DWORD *)&self->_anon_240[996] = *(_DWORD *)((char *)&self->super.isa + v44);
    int v45 = [(DenoiseFusePipeline *)self->_denoiseFusePipeline fusionReferenceFrame];
    int v46 = *(_DWORD *)&self->_anon_240[984];
    BOOL v48 = v45 == 1 && v46 >= 0;
    self->_anon_240[1003] = v48;
    if (v46 < 0 && dword_26B430EE8)
    {
      uint64_t v49 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      int v46 = *(_DWORD *)&self->_anon_240[984];
    }
    *(_DWORD *)&self->_anon_240[976] = self->_cntBracketSampleBuffers;
    if (v46 < 0)
    {
      LOBYTE(v53) = 0;
      int v52 = *(_DWORD *)&self->_anon_240[988];
      if ((v52 & 0x80000000) == 0)
      {
LABEL_53:
        char v54 = v53;
        char v55 = [(NRFFrameProperties *)v13[v52] meta];
        int v53 = [v55 metadataHasLtmCurves];

        if ((v54 & 1) == 0)
        {
          if (v53)
          {
            LOBYTE(v53) = 0;
            int v56 = *(_DWORD *)&self->_anon_240[988];
            char v57 = 1;
          }
          else
          {
            char v57 = 0;
            int v56 = -1;
          }
          goto LABEL_60;
        }
        goto LABEL_57;
      }
    }
    else
    {
      int v50 = [(NRFFrameProperties *)v13[v46] meta];
      int v51 = [v50 metadataHasLtmCurves];

      int v52 = *(_DWORD *)&self->_anon_240[988];
      if ((v52 & 0x80000000) == 0)
      {
        LOBYTE(v53) = v51;
        goto LABEL_53;
      }
      LOBYTE(v53) = 0;
      if (v51)
      {
LABEL_57:
        char v57 = v53;
        int v56 = *(_DWORD *)&self->_anon_240[984];
        LOBYTE(v53) = 1;
        goto LABEL_60;
      }
    }
    int v56 = -1;
    char v57 = 0;
LABEL_60:
    *(_DWORD *)&self->_anon_240[980] = v56;
    if (self->_anon_240[1000] && v56 < 0)
    {
      int v56 = *(_DWORD *)&self->_anon_240[984];
      if (v56 < 0) {
        int v56 = *(_DWORD *)&self->_anon_240[988];
      }
      *(_DWORD *)&self->_anon_240[980] = v56;
    }
    if (((v53 & 1) != 0 || (*(_DWORD *)&self->_anon_240[984] & 0x80000000) != 0)
      && (v56 & 0x80000000) == 0
      && (v57 & 1) != 0)
    {
      if (self->_processingType == 1 && *(_DWORD *)&self->_anon_240[1004] == 2)
      {
        simd_float3x3 v59 = __invert_f3(*((simd_float3x3 *)&p_fusionConf->preWarpEnabled + *(int *)&self->_anon_240[984]));
        uint64_t v58 = 0;
        v59.columns[0].i32[3] = 0;
        v59.columns[1].i32[3] = 0;
        v59.columns[2].i32[3] = 0;
        int v60 = (_OWORD *)MEMORY[0x263EF89A0];
        do
        {
          if (v58 == *(_DWORD *)&self->_anon_240[984] || v58 == *(_DWORD *)&self->_anon_240[988])
          {
            uint64_t v61 = &p_fusionConf->preWarpEnabled + 48 * v58;
            long long v62 = v60[1];
            *(_OWORD *)uint64_t v61 = *v60;
            *((_OWORD *)v61 + 1) = v62;
            *((_OWORD *)v61 + 2) = v60[2];
          }
          else
          {
            uint64_t v63 = 0;
            id v64 = (float32x4_t *)((char *)p_fusionConf + 48 * v58);
            float32x4_t v65 = *v64;
            float32x4_t v66 = v64[1];
            float32x4_t v67 = v64[2];
            simd_float3x3 v78 = v59;
            long long v75 = 0uLL;
            long long v76 = 0uLL;
            long long v77 = 0uLL;
            do
            {
              *(long long *)((char *)&v75 + v63 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v65, COERCE_FLOAT(*(_OWORD *)&v78.columns[v63])), v66, *(float32x2_t *)v78.columns[v63].f32, 1), v67, (float32x4_t)v78.columns[v63], 2);
              ++v63;
            }
            while (v63 != 3);
            uint64_t v68 = v75;
            long long v69 = v76;
            long long v70 = v77;
            v64->i32[2] = DWORD2(v75);
            v64[1].i32[2] = DWORD2(v69);
            v64->i64[0] = v68;
            v64[1].i64[0] = v69;
            v64[2].i32[2] = DWORD2(v70);
            v64[2].i64[0] = v70;
          }
          ++v58;
        }
        while (v58 != 4);
      }
      return 0;
    }
    else
    {
      FigDebugAssert3();
      return FigSignalErrorAt();
    }
  }
LABEL_83:
  FigDebugAssert3();
LABEL_84:

  return FigSignalErrorAt();
}

- (int)_downsampleImageForRegistration:(__CVBuffer *)a3 outputImage:(__CVBuffer *)a4
{
  uint64_t v7 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  if (a3 && a4)
  {
    size_t Width = CVPixelBufferGetWidth(a3);
    size_t Height = CVPixelBufferGetHeight(a3);
    if (CVPixelBufferGetPixelFormatType(a3) == 1751527984)
    {
      int v10 = FigSignalErrorAt();
    }
    else
    {
      int v10 = -[FigM2MController transform:srcRect:dst:dstRect:rotate:sync_m2m:](self->_regWarpM2M, "transform:srcRect:dst:dstRect:rotate:sync_m2m:", a3, a4, 1, 1, 0.0, 0.0, (double)Width, (double)Height, 0.0, 0.0, (double)(Width >> 1), (double)(Height >> 1));
      if (v10) {
        FigDebugAssert3();
      }
    }
  }
  else
  {
    FigDebugAssert3();
    int v10 = -12780;
  }
  if (*v7 == 1) {
    kdebug_trace();
  }
  return v10;
}

- (CGRect)_downscaleRoiForRegistration:(CGRect)a3
{
  unsigned int v3 = llround(a3.origin.x);
  unsigned int v4 = llround(a3.origin.y);
  int v5 = v3 & 1;
  BOOL v6 = __OFADD__(v5, v3);
  int v7 = v5 + v3;
  int v8 = vcvtmd_s64_f64(a3.size.width) - v5;
  int v9 = v4 & 1;
  int v10 = v9 + v4;
  int v11 = vcvtmd_s64_f64(a3.size.height) - v9;
  if (v7 < 0 != v6) {
    ++v7;
  }
  double v12 = (double)(v7 >> 1);
  if (v10 >= 0) {
    int v13 = v10;
  }
  else {
    int v13 = v10 + 1;
  }
  double v14 = (double)(v13 >> 1);
  double v15 = (double)(v8 >> 1);
  double v16 = (double)(v11 >> 1);
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v12;
  return result;
}

- (BOOL)sanityCheckHomographyForBracketIndex:(int)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [&unk_270E97C60 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    bracketProperties = self->_bracketProperties;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(&unk_270E97C60);
        }
        int v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        int v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", 0, v19, v20);
        [v11 floatValue];
        *(void *)&long long v21 = v12;
        int v13 = [v10 objectAtIndexedSubscript:1];
        [v13 floatValue];
        long long v14 = v21;
        DWORD1(v14) = v15;
        long long v19 = v15;
        long long v20 = v14;

        double v16 = [(NRFFrameProperties *)bracketProperties[a3] regHomography];
        int32x4_t v17 = (int32x4_t)vaddq_f32(v16[2], vmlaq_n_f32(vmulq_n_f32(*v16, *(float *)&v21), v16[1], *(float *)&v19));
        *(float32x2_t *)v17.i8 = vsub_f32(*(float32x2_t *)&v20, vdiv_f32(*(float32x2_t *)v17.i8, (float32x2_t)vdup_laneq_s32(v17, 2)));
        if (sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)v17.i8, *(float32x2_t *)v17.i8))) > 1.0) {
          return 0;
        }
      }
      uint64_t v6 = [&unk_270E97C60 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (int)_registerImages:(BOOL)a3
{
  BOOL v90 = a3;
  uint64_t v99 = *MEMORY[0x263EF8340];
  unsigned int v4 = [(NRFProgressiveBracketingParameters *)self->_progressiveBracketingParameters statistics];
  if ([v4 stationary] && (fusion = self->_nrfPlist->fusion) != 0)
  {
    BOOL enableStationaryFusion = fusion->enableStationaryFusion;

    if (enableStationaryFusion) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  if (self->_nrfConfig->_regMethod != 2)
  {
LABEL_17:
    if (self->_cntBracketSampleBuffers >= 1)
    {
      uint64_t v24 = 0;
      bracketProperties = self->_bracketProperties;
      long long v26 = (_OWORD *)MEMORY[0x263EF89A0];
      do
      {
        if (![(NRFFrameProperties *)bracketProperties[v24] registrationComplete])
        {
          uint64_t v27 = [(NRFFrameProperties *)bracketProperties[v24] regHomography];
          long long v28 = v26[1];
          *(_OWORD *)uint64_t v27 = *v26;
          *((_OWORD *)v27 + 1) = v28;
          *((_OWORD *)v27 + 2) = v26[2];
          [(NRFFrameProperties *)bracketProperties[v24] setRegistrationComplete:1];
          [(NRFFrameProperties *)bracketProperties[v24] setHasValidRegistration:1];
        }
        ++v24;
      }
      while (v24 < self->_cntBracketSampleBuffers);
    }
    goto LABEL_22;
  }
  uint64_t referenceFrameIndex = self->_referenceFrameIndex;
  if ((referenceFrameIndex & 0x80000000) != 0 || self->_cntBracketSampleBuffers <= (int)referenceFrameIndex) {
    goto LABEL_22;
  }
  int v8 = self->_bracketProperties;
  BOOL v9 = [(NRFFrameProperties *)self->_bracketProperties[referenceFrameIndex] registrationComplete];
  int v10 = (CFStringRef *)MEMORY[0x263F2EF58];
  int v11 = (_DWORD *)MEMORY[0x263F00E10];
  if (v9) {
    goto LABEL_64;
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  uint64_t v12 = [(NRFFrameProperties *)v8[self->_referenceFrameIndex] regHomography];
  uint64_t v13 = MEMORY[0x263EF89A0];
  long long v14 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  *(_OWORD *)uint64_t v12 = *MEMORY[0x263EF89A0];
  *((_OWORD *)v12 + 1) = v14;
  *((_OWORD *)v12 + 2) = *(_OWORD *)(v13 + 32);
  [(NRFFrameProperties *)v8[self->_referenceFrameIndex] setRegistrationComplete:1];
  [(NRFFrameProperties *)v8[self->_referenceFrameIndex] setHasValidRegistration:1];
  ImageBuffer = CMSampleBufferGetImageBuffer(self->_bracketSampleBuffers[self->_referenceFrameIndex]);
  if (!ImageBuffer)
  {
LABEL_39:
    FigDebugAssert3();
    int v32 = FigSignalErrorAt();
    goto LABEL_30;
  }
  double v16 = ImageBuffer;
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
  uint64_t v18 = [(NRFFrameProperties *)v8[self->_referenceFrameIndex] meta];
  uint64_t v19 = [v18 ROI];
  long long v20 = *(_OWORD *)(v19 + 16);
  float32x4_t v94 = *(float32x4_t *)v19;
  long long v95 = v20;

  *(_DWORD *)uint64_t v97 = 0;
  BOOL v21 = [(UBProcessorV4 *)self shouldDownsampleRWPPInputWithPixelFormat:PixelFormatType processingType:self->_processingType];
  char v22 = 1;
  if ((int)PixelFormatType > 1651926375)
  {
    if (PixelFormatType == 1651926376 || PixelFormatType == 1751527984) {
      goto LABEL_45;
    }
    int v23 = 2087216688;
  }
  else
  {
    if (PixelFormatType == 644376112 || PixelFormatType == 761816624) {
      goto LABEL_45;
    }
    int v23 = 795371056;
  }
  if (PixelFormatType != v23) {
    char v22 = 0;
  }
LABEL_45:
  uint64_t v38 = (__CVBuffer *)CMGetAttachment(self->_bracketSampleBuffers[self->_referenceFrameIndex], *v10, 0);
  if (v38)
  {
    regWarpInput = v38;
    OSType v40 = CVPixelBufferGetPixelFormatType(v38);
    if (v40 != CVPixelBufferGetPixelFormatType(self->_regWarpInput))
    {
LABEL_47:
      int v32 = -73256;
      goto LABEL_30;
    }
    goto LABEL_60;
  }
  if (v21)
  {
    if (self->_curRegWarpTempIndex == self->_referenceFrameIndex)
    {
LABEL_59:
      regWarpInput = self->_regWarpInput;
LABEL_60:
      -[UBProcessorV4 _downscaleRoiForRegistration:](self, "_downscaleRoiForRegistration:", *(_OWORD *)&v94, v95);
      v94.i64[0] = v46;
      v94.i64[1] = v47;
      *(void *)&long long v95 = v48;
      *((void *)&v95 + 1) = v49;
      goto LABEL_61;
    }
    if (self->_regWarpM2M) {
      char v41 = v22;
    }
    else {
      char v41 = 1;
    }
    if (v41)
    {
      regWarpHelper = self->_regWarpHelper;
      int v43 = self->_regWarpInput;
      uint64_t v44 = [(FigMetalContext *)self->_metal commandBuffer];
      int v32 = [(RegWarpHelper *)regWarpHelper convertInput10BitPixBuf:v16 downsampledOutput8BitPixBuf:v43 mtlCommandBuffer:v44];

      if (!v32)
      {
        [(FigMetalContext *)self->_metal waitForSchedule];
LABEL_58:
        self->_curRegWarpTempIndeCGFloat x = self->_referenceFrameIndex;
        goto LABEL_59;
      }
    }
    else
    {
      int v45 = [(UBProcessorV4 *)self _downsampleImageForRegistration:v16 outputImage:self->_regWarpInput];
      if (!v45) {
        goto LABEL_58;
      }
      int v32 = v45;
    }
LABEL_116:
    FigDebugAssert3();
    goto LABEL_30;
  }
  regWarpInput = v16;
LABEL_61:
  if (![(RegWarpPP *)self->_registrationPipelineRWPP processReference:regWarpInput regionOfInterest:&v94 numKeypoints:v97 mapping:0])
  {
    if (*v11 == 1) {
      kdebug_trace();
    }
LABEL_64:
    if (self->_cntBracketSampleBuffers >= 1)
    {
      uint64_t v50 = 0;
      CFStringRef v51 = *v10;
      do
      {
        int v52 = (id *)(&self->super.isa + v50);
        if (([v52[24] registrationComplete] & 1) == 0)
        {
          if (*v11 == 1) {
            kdebug_trace();
          }
          [v52[24] setRegistrationComplete:1];
          int v53 = &self->super.isa + v50;
          char v54 = CMSampleBufferGetImageBuffer(v53[19]);
          if (!v54) {
            goto LABEL_39;
          }
          char v55 = v54;
          int v56 = v11;
          uint64_t v57 = CVPixelBufferGetPixelFormatType(v54);
          BOOL v58 = [(UBProcessorV4 *)self shouldDownsampleRWPPInputWithPixelFormat:v57 processingType:self->_processingType];
          char v59 = 1;
          if ((int)v57 > 1651926375)
          {
            BOOL v60 = v57 == 1651926376 || v57 == 1751527984;
            int v61 = 2087216688;
          }
          else
          {
            BOOL v60 = v57 == 644376112 || v57 == 761816624;
            int v61 = 795371056;
          }
          if (!v60 && v57 != v61) {
            char v59 = 0;
          }
          uint64_t v63 = (__CVBuffer *)CMGetAttachment(v53[19], v51, 0);
          if (v63)
          {
            id v64 = v63;
            OSType v65 = CVPixelBufferGetPixelFormatType(v63);
            if (v65 != CVPixelBufferGetPixelFormatType(self->_regWarpInput)) {
              goto LABEL_47;
            }
          }
          else
          {
            id v64 = v55;
            if (v58)
            {
              if (v50 != self->_curRegWarpTempIndex)
              {
                if (self->_regWarpM2M) {
                  char v66 = v59;
                }
                else {
                  char v66 = 1;
                }
                if (v66)
                {
                  float32x4_t v67 = self->_regWarpHelper;
                  uint64_t v68 = self->_regWarpInput;
                  long long v69 = [(FigMetalContext *)self->_metal commandBuffer];
                  int v32 = [(RegWarpHelper *)v67 convertInput10BitPixBuf:v55 downsampledOutput8BitPixBuf:v68 mtlCommandBuffer:v69];

                  if (v32) {
                    goto LABEL_116;
                  }
                  [(FigMetalContext *)self->_metal waitForSchedule];
                }
                else
                {
                  int v70 = [(UBProcessorV4 *)self _downsampleImageForRegistration:v55 outputImage:self->_regWarpInput];
                  if (v70)
                  {
                    int v32 = v70;
                    goto LABEL_116;
                  }
                }
                self->_curRegWarpTempIndeCGFloat x = v50;
              }
              id v64 = self->_regWarpInput;
            }
          }
          __int32 v92 = 0;
          memset(type, 0, sizeof(type));
          int v71 = [(RegWarpPP *)self->_registrationPipelineRWPP processNonReference:v64 seedTransform:0 outputTransform:type mapping:0];
          if ([v52[24] contentExtended])
          {
            unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(v55, 0);
            unsigned int HeightOfPlane = CVPixelBufferGetHeightOfPlane(v55, 0);
            [v52[24] extendedDimensions];
            unsigned int v87 = v74;
            [v52[24] extendedDimensions];
            float32x4_t v94 = *(float32x4_t *)type;
            long long v95 = *(_OWORD *)&type[12];
            *(void *)&long long v75 = *(void *)&type[24];
            *((void *)&v75 + 1) = __PAIR64__(*(unsigned int *)&type[12], v92);
            long long v96 = v75;
            LODWORD(v77) = 0;
            *((float *)&v77 + 1) = (float)HeightOfPlane / (float)v76;
            *(_OWORD *)uint64_t v97 = COERCE_UNSIGNED_INT((float)WidthOfPlane / (float)v87);
            *(_OWORD *)&v97[16] = v77;
            long long v98 = xmmword_26337FF50;
            LODWORD(v75) = 0;
            *((float *)&v75 + 1) = (float)v76 / (float)HeightOfPlane;
            v93[0] = COERCE_UNSIGNED_INT((float)v87 / (float)WidthOfPlane);
            v93[1] = (unint64_t)v75;
            v93[2] = xmmword_26337FF50;
            *(double *)&long long v78 = Mul3x3by3x3by3x3((uint64_t)v93, &v94, (float32x4_t *)v97);
            HIDWORD(v78) = v79.i32[0];
            *(_OWORD *)os_log_type_t type = v78;
            *(int8x16_t *)&type[16] = vextq_s8(vextq_s8(v79, v79, 0xCuLL), v80, 8uLL);
            __int32 v92 = v80.i32[2];
          }
          int v11 = v56;
          if (v71)
          {
            [v52[24] setHasValidRegistration:0];
            long long v81 = (_OWORD *)[v52[24] regHomography];
            uint64_t v82 = MEMORY[0x263EF89A0];
            long long v83 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
            *long long v81 = *MEMORY[0x263EF89A0];
            v81[1] = v83;
            v81[2] = *(_OWORD *)(v82 + 32);
          }
          else
          {
            long long v88 = *(_OWORD *)type;
            *(_OWORD *)[v52[24] regHomography] = v88;
            *(_OWORD *)long long v89 = *(_OWORD *)&type[12];
            *(_OWORD *)([v52[24] regHomography] + 16) = *(_OWORD *)v89;
            *(void *)&long long v84 = *(void *)&type[24];
            *((void *)&v84 + 1) = __PAIR64__(v89[3], v92);
            *(_OWORD *)([v52[24] regHomography] + 32) = v84;
            objc_msgSend(v52[24], "setHasValidRegistration:", -[UBProcessorV4 sanityCheckHomographyForBracketIndex:](self, "sanityCheckHomographyForBracketIndex:", v50));
            if ([v52[24] hasValidRegistration]) {
              ++self->_nRegisteredFrames;
            }
          }
          if (([v52[24] hasValidRegistration] & 1) == 0)
          {
            long long v85 = [v52[24] meta];
            char v86 = [v85 isEVMFrame];

            if (v86) {
              goto LABEL_39;
            }
          }
          if (*v56 == 1) {
            kdebug_trace();
          }
        }
        ++v50;
      }
      while (v50 < self->_cntBracketSampleBuffers);
    }
LABEL_22:
    if (!v90) {
      goto LABEL_29;
    }
    int cntBracketSampleBuffers = self->_cntBracketSampleBuffers;
    if (cntBracketSampleBuffers >= 1)
    {
      uint64_t v30 = 0;
      int v31 = 0;
      do
      {
        if (v30 != self->_referenceFrameIndex)
        {
          v31 += [(NRFFrameProperties *)self->_bracketProperties[v30] hasValidRegistration];
          int cntBracketSampleBuffers = self->_cntBracketSampleBuffers;
        }
        ++v30;
      }
      while (v30 < cntBracketSampleBuffers);
      if (v31 >= 1)
      {
LABEL_29:
        int v32 = 0;
        goto LABEL_30;
      }
    }
    goto LABEL_39;
  }
  FigDebugAssert3();
  int v32 = -17401;
LABEL_30:
  if (dword_26B430EE8)
  {
    LODWORD(v93[0]) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    unint64_t v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    int v34 = v93[0];
    if (!os_log_type_enabled(v33, type[0])) {
      v34 &= ~1u;
    }
    if (v34)
    {
      CGAffineTransform v35 = [(UBProcessorV4 *)self description];
      int v36 = "failed";
      *(_DWORD *)uint64_t v97 = 136315907;
      *(void *)&v97[4] = "-[UBProcessorV4 _registerImages:]";
      *(_WORD *)&v97[12] = 2113;
      *(void *)&v97[14] = v35;
      if (!v32) {
        int v36 = "succeeded";
      }
      *(_WORD *)&v97[22] = 2081;
      *(void *)&v97[24] = v36;
      LOWORD(v98) = 1026;
      *(_DWORD *)((char *)&v98 + 2) = v32 == 0;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v32;
}

- (int)_processSIFRandRefEV0IfPossible:(int)a3
{
  if (self->_processedSIFRandRefEV0) {
    return 0;
  }
  int referenceFrameIndex = self->_referenceFrameIndex;
  if (referenceFrameIndex < 0
    || referenceFrameIndex >= self->_cntBracketSampleBuffers
    || (uint64_t sifrFrameIndex = self->_sifrFrameIndex, (sifrFrameIndex & 0x80000000) != 0))
  {
    if (a3 == 1 && self->_referenceFrameHasEVMinus)
    {
      nrfFusionOutput = self->_nrfFusionOutput;
      uint64_t v21 = 1;
      goto LABEL_25;
    }
    return 0;
  }
  bracketProperties = self->_bracketProperties;
  if (![(NRFFrameProperties *)self->_bracketProperties[sifrFrameIndex] registrationComplete]|| ![(NRFFrameProperties *)bracketProperties[self->_referenceFrameIndex] registrationComplete])
  {
    goto LABEL_28;
  }
  self->_processedSIFRandRefEV0 = 1;
  if (self->_processingType != 1) {
    return 0;
  }
  if (![(DenoiseFusePipeline *)self->_denoiseFusePipeline selectNRFFusionReferenceFrame:self->_sifrFrameIndex ev0FrameIndex:self->_referenceFrameIndex evmProperties:bracketProperties[self->_sifrFrameIndex] ev0Properties:bracketProperties[self->_referenceFrameIndex] nrfPlist:self->_nrfPlist])
  {
    int v8 = [(NRFFrameProperties *)bracketProperties[self->_sifrFrameIndex] meta];
    int v9 = [v8 metadataHasLtmCurves];

    int v10 = [(NRFFrameProperties *)bracketProperties[self->_referenceFrameIndex] meta];
    int v11 = [v10 metadataHasLtmCurves];

    if ((v9 & 1) != 0 || v11)
    {
      int v12 = [(DenoiseFusePipeline *)self->_denoiseFusePipeline fusionReferenceFrame];
      uint64_t v13 = 1864;
      if (v12 == 2) {
        uint64_t v14 = 144;
      }
      else {
        uint64_t v14 = 1864;
      }
      uint64_t v15 = *(int *)((char *)&self->super.isa + v14);
      if (v9) {
        uint64_t v13 = 144;
      }
      uint64_t v16 = *(unsigned int *)((char *)&self->super.isa + v13);
      int v17 = [(NRFFrameProperties *)bracketProperties[v15] inputColorSpace];
      if ([(NRFUBFusionOutput *)self->_nrfFusionOutput inferenceInputPixelBuffer] && v17)
      {
        uint64_t v18 = [(NRFUBFusionOutput *)self->_nrfFusionOutput inferenceInputPixelBuffer];
        uint64_t v19 = self->_referenceFrameIndex;
        size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane([(NRFUBFusionOutput *)self->_nrfFusionOutput pixelBuffer], 0);
        [(UBProcessorV4 *)self _processInferenceImage:v18 sourceFrameType:0 sourceFrameIndex:v15 ltcFrameIndex:v16 gtcFrameIndex:v19 originalWidth:WidthOfPlane originalHeight:CVPixelBufferGetHeightOfPlane([(NRFUBFusionOutput *)self->_nrfFusionOutput pixelBuffer], 0)];
      }
    }
    if (![(DenoiseFusePipeline *)self->_denoiseFusePipeline nrfFusionDenseRegister:self->_sifrFrameIndex ev0FrameIndex:self->_referenceFrameIndex evmProperties:bracketProperties[self->_sifrFrameIndex] ev0Properties:bracketProperties[self->_referenceFrameIndex]])
    {
      uint64_t v21 = [(DenoiseFusePipeline *)self->_denoiseFusePipeline fusionReferenceFrame];
      nrfFusionOutput = self->_nrfFusionOutput;
LABEL_25:
      [(NRFUBFusionOutput *)nrfFusionOutput setFusionMode:v21];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(WeakRetained, "processor:didSelectFusionMode:", self, -[NRFUBFusionOutput fusionMode](self->_nrfFusionOutput, "fusionMode"));
      }

      return 0;
    }
  }
LABEL_28:
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (FigWiredMemory)sharedRegWarpBuffer
{
  return self->_sharedRegWarpBuffer;
}

- (void)setRegwarpInputSurface:(__IOSurface *)a3
{
  if (CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x263EFFB08], a3, 0, &self->_regWarpInput))
  {
    unsigned int v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (__IOSurface)regwarpInputSurface
{
  return self->_regwarpInputSurface;
}

- (void)setSharedRegWarpBuffer:(id)a3
{
  uint64_t v5 = (FigWiredMemory *)a3;
  if (self->_sharedRegWarpBuffer != v5)
  {
    uint64_t v6 = v5;
    [(RegWarpPP *)self->_registrationPipelineRWPP releaseResources];
    objc_storeStrong((id *)&self->_sharedRegWarpBuffer, a3);
    uint64_t v5 = v6;
    self->_regwarpHasBeenSetup = 0;
  }
}

- (BOOL)srlEnabled
{
  return [(DenoiseFusePipeline *)self->_denoiseFusePipeline srlEnabled];
}

- (void)setSrlEnabled:(BOOL)a3
{
}

- (BOOL)skipDenoising
{
  return [(DenoiseFusePipeline *)self->_denoiseFusePipeline skipDenoising];
}

- (void)setSkipDenoising:(BOOL)a3
{
}

- (NRFOutput)output
{
  return self->_output;
}

- (BOOL)referenceFrameHasEVMinus
{
  return self->_referenceFrameHasEVMinus;
}

- (void)setReferenceFrameHasEVMinus:(BOOL)a3
{
  self->_BOOL referenceFrameHasEVMinus = a3;
}

- (NRFProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NRFProcessorDelegate *)WeakRetained;
}

- (BOOL)doRedFaceFix
{
  return self->_doRedFaceFix;
}

- (void)setDoRedFaceFix:(BOOL)a3
{
  self->_doRedFaceFiCGFloat x = a3;
}

- (BOOL)enableGreenGhostMitigation
{
  return self->_enableGreenGhostMitigation;
}

- (void)setEnableGreenGhostMitigation:(BOOL)a3
{
  self->_enableGreenGhostMitigation = a3;
}

- (NRFProgressiveBracketingParameters)progressiveBracketingParameters
{
  return self->_progressiveBracketingParameters;
}

- (void)setProgressiveBracketingParameters:(id)a3
{
}

- (int)progressiveBatchSize
{
  return self->_progressiveBatchSize;
}

- (int)cntBracketSampleBuffers
{
  return self->_cntBracketSampleBuffers;
}

- (int)batchCount
{
  return self->_batchCount;
}

- (NSMutableDictionary)tuningParams
{
  return self->_tuningParams;
}

- (void)setTuningParams:(id)a3
{
}

- (NSMutableDictionary)tuningParamsPlist
{
  return self->_tuningParamsPlist;
}

- (void)setTuningParamsPlist:(id)a3
{
}

- (NSMutableDictionary)defringingTuningByPortType
{
  return self->_defringingTuningByPortType;
}

- (void)setDefringingTuningByPortType:(id)a3
{
}

- (IBPSemanticStyleProperties)semanticStyleProperties
{
  return self->_semanticStyleProperties;
}

- (void)setSemanticStyleProperties:(id)a3
{
}

- (BOOL)learnedNREnabled
{
  return self->_learnedNREnabled;
}

- (void)setLearnedNREnabled:(BOOL)a3
{
  self->_BOOL learnedNREnabled = a3;
}

- (BOOL)stfAllowed
{
  return self->_stfAllowed;
}

- (void)setStfAllowed:(BOOL)a3
{
  self->_stfAllowed = a3;
}

- (FigMetalAllocatorBackend)allocatorBackend
{
  return self->_allocatorBackend;
}

- (void)setAllocatorBackend:(id)a3
{
}

- (int)referenceFrameCandidatesCount
{
  return self->_referenceFrameCandidatesCount;
}

- (void)setReferenceFrameCandidatesCount:(int)a3
{
  self->_referenceFrameCandidatesCount = a3;
}

- (int)maximumNumberOfReferenceFrameCandidatesToHoldForProcessing
{
  return self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing;
}

- (void)setMaximumNumberOfReferenceFrameCandidatesToHoldForProcessing:(int)a3
{
  self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing = a3;
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (unsigned)processingType
{
  return self->_processingType;
}

- (void)setProcessingType:(unsigned int)a3
{
  self->_unsigned int processingType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_allocatorBackend, 0);
  objc_storeStrong((id *)&self->_semanticStyleProperties, 0);
  objc_storeStrong((id *)&self->_defringingTuningByPortType, 0);
  objc_storeStrong((id *)&self->_tuningParamsPlist, 0);
  objc_storeStrong((id *)&self->_tuningParams, 0);
  objc_storeStrong((id *)&self->_progressiveBracketingParameters, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_outputAsMTLBuffer, 0);
  objc_storeStrong((id *)&self->_referenceFrameProperties, 0);
  objc_storeStrong((id *)&self->_lscGainsTex, 0);
  objc_storeStrong((id *)&self->_nrfFusionOutput, 0);
  objc_storeStrong((id *)&self->_nrfConfig, 0);
  objc_storeStrong((id *)&self->_sidecar, 0);
  objc_storeStrong((id *)&self->_globalDistortionCorrectionPlist, 0);
  objc_storeStrong((id *)&self->_globalDistortionCorrectionByPortType, 0);
  objc_storeStrong((id *)&self->_lscGainsPlist, 0);
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_registrationPipelineRWPP, 0);
  objc_storeStrong((id *)&self->_regWarpM2M, 0);
  objc_storeStrong((id *)&self->_regWarpHelper, 0);
  objc_storeStrong((id *)&self->_nrfPlist, 0);
  for (uint64_t i = 0; i != -5; --i)
    objc_storeStrong((id *)&self->_bracketProperties[i + 4], 0);
  objc_storeStrong((id *)&self->_prebracketedProperties, 0);
  objc_storeStrong((id *)&self->_denoiseFusePipeline, 0);
  objc_storeStrong((id *)&self->_sharedRegWarpBuffer, 0);

  objc_storeStrong((id *)&self->_sharedMetalBuffer, 0);
}

@end