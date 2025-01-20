@interface RawNightModeProcessor
+ (id)createMetalTextureWithMetalContext:(id)a3 label:(id)a4 width:(unint64_t)a5 height:(unint64_t)a6 pixelFormat:(unint64_t)a7;
+ (id)createMetalTextureWithMetalContext:(id)a3 label:(id)a4 width:(unint64_t)a5 height:(unint64_t)a6 pixelFormat:(unint64_t)a7 compressionDisabled:(BOOL)a8;
+ (int)populateLSCWBGParamsFromMetadata:(id)a3 cameraInfoByPortType:(id)a4 lscGainMapParameters:(id)a5 params:(id *)a6;
+ (int)populateWBGParamsFromMetadata:(id)a3 params:;
- (BOOL)_isArgyleTripodMax:(id)a3 processingMode:(int)a4;
- (BOOL)_requiresDarkCurrentNoiseModel:(id)a3 processingMode:(int)a4;
- (BOOL)doRedFaceFix;
- (BOOL)enableGreenGhostMitigation;
- (BOOL)referenceFrameHasEVMinus;
- (BOOL)skipDenoising;
- (BOOL)srlEnabled;
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
- (RawNightModeProcessor)initWithCommandQueue:(id)a3;
- (__IOSurface)regwarpInputSurface;
- (id)determineMTLPixelFormatsForCVPixelFormat:(unsigned int)a3;
- (int)_correctLumaTex:(id)a3 chromaTex:(id)a4 withRGBBias:(id)a5 sementicMasks:(id)a6 clippingMapTex:(id)a7 localRGBBiasTex:(id)a8 denoisedLumaBand3Tex:(RawNightModeDenoiseAddBackParams *)a9 addbackParams:(RawNightModeBiasCorrectionParams *)a10 biasCorrectionParams:(id)a11 lscParams:(BOOL)a12 isQuadra:;
- (int)_initRawNightModeDenoiseInference:(BOOL)a3 isBarrington:(BOOL)a4 isArgyleTripodMax:(BOOL)a5;
- (int)_initRawNightModeFusionInference:(BOOL)a3 isBarrington:(BOOL)a4 requiresDarkCurrentNoiseModel:(BOOL)a5;
- (int)_initRawNightModeTripodFusion:(BOOL)a3 requiresDarkCurrentNoiseModel:(BOOL)a4;
- (int)_populateInferenceFusionData:(id)a3 withBatch:(id)a4 first:(unsigned __int8)a5 last:(unsigned __int8)a6;
- (int)addFrame:(id)a3 withReferenceFrame:(id)a4;
- (int)addFrame:(opaqueCMSampleBuffer *)a3;
- (int)addTripodModeFrame:(id)a3 withReferenceFrame:(id)a4;
- (int)allocateResourcesForAccumulator:(id *)a3 width:(unint64_t)a4 height:(unint64_t)a5 label:(id)a6;
- (int)batchCount;
- (int)cntBracketSampleBuffers;
- (int)computeInferenceInputImage:(id)a3 outputLumaTexture:(id)a4 outputChromaTexture:(id)a5;
- (int)computeTuningPlist:(id)a3 fromInputPlist:(id)a4 quadraBinningFactor:(int)a5;
- (int)computeYUVNoiseMap;
- (int)curateFramesAwaitingFusionWithNewFrame:(id)a3;
- (int)determineWorkingBufferRequirementsWithPrepareDescriptorByProcessingType:(id)a3 nrfConfig:(id)a4 memoryAllocationInfo:(id *)a5;
- (int)extractLSCMetadataFromReferenceFrame:(id)a3;
- (int)finishProcessing;
- (int)maximumNumberOfReferenceFrameCandidatesToHoldForProcessing;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prepareToProcess:(unsigned int)a3 prepareDescriptor:(id)a4;
- (int)prewarm;
- (int)prewarmWithTuningParameters:(id)a3;
- (int)process;
- (int)processInitialFrames:(id)a3;
- (int)purgeResources;
- (int)referenceFrameCandidatesCount;
- (int)referenceFrameIndex;
- (int)resetState;
- (int)runAWBOnOutputFrame:(id)a3;
- (int)runDemWarpOnFrame:(id)a3 outputTexture:(id)a4 label:(id)a5;
- (int)runInferenceEngineForBatch:(id)a3 last:(unsigned __int8)a4;
- (int)runLTMOnOutputFrame:(id)a3;
- (int)runTripodFusionForBatch:(id)a3 isLast:(unsigned __int8)a4 referenceFrame:(id)a5;
- (int)sendFrame:(id)a3 toReferenceFrameSelector:(id)a4;
- (int)setup;
- (int)setupWithOptions:(id)a3 nrfConfig:(id)a4;
- (unsigned)processingType;
- (void)_prepareOutputMetadata;
- (void)dealloc;
- (void)finishScheduling;
- (void)overlayRawNightModePlist:(id)a3 ontoDictionary:(id)a4;
- (void)releaseResourcesForAccumulator:(id)a3;
- (void)setAllocatorBackend:(id)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setDefringingTuningByPortType:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDoRedFaceFix:(BOOL)a3;
- (void)setEnableGreenGhostMitigation:(BOOL)a3;
- (void)setMaximumNumberOfReferenceFrameCandidatesToHoldForProcessing:(int)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setOutput:(id)a3;
- (void)setProcessingType:(unsigned int)a3;
- (void)setProgressiveBracketingParameters:(id)a3;
- (void)setReferenceFrameCandidatesCount:(int)a3;
- (void)setReferenceFrameHasEVMinus:(BOOL)a3;
- (void)setReferenceFrameIndex:(int)a3;
- (void)setRegwarpInputSurface:(__IOSurface *)a3;
- (void)setSemanticStyleProperties:(id)a3;
- (void)setSharedRegWarpBuffer:(id)a3;
- (void)setSkipDenoising:(BOOL)a3;
- (void)setSrlEnabled:(BOOL)a3;
- (void)setTuningParameters:(id)a3;
- (void)setTuningParams:(id)a3;
- (void)setTuningParamsPlist:(id)a3;
@end

@implementation RawNightModeProcessor

- (int)resetState
{
  self->_cntBracketSampleBuffers = 0;
  self->_cntProcessedNonRefFrames = 0;
  currentBatch = self->_currentBatch;
  self->_currentBatch = 0;

  self->_isFirstBatch = 1;
  self->_runGreenGhostMitigation = 0;
  currentConfig = self->_currentConfig;
  self->_currentConfig = 0;

  self->_mode = 1;
  self->_sphereOffsetEnabled = 0;
  [(SoftLTM *)self->_softLTMStage reset];
  [(NSMutableArray *)self->_framesAwaitingFusion removeAllObjects];
  [(RawNightModeSemanticMasks *)self->_semanticMasks reset];
  [(CMIRawNightModeRegistrationStage *)self->_registrationStage reset];
  [(RawNightModeGreenGhost *)self->_greenGhost reset];
  [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector reset];
  [(RawNightModeProcessor *)self releaseResourcesForAccumulator:self->_pyramidAccumulator];
  pyramidAccumulator = self->_pyramidAccumulator;
  self->_pyramidAccumulator = 0;

  FigMetalDecRef();
  [(RawNightModeFusionInference *)self->_inferenceFusion waitForResetStateCompletion];
  [(RawNightModeTripodFusion *)self->_tripodFusion waitForResetStateCompletion];
  [(RawNightModeDenoiseInference *)self->_inferenceDenoise waitForResetStateCompletion];
  inferenceFusion = self->_inferenceFusion;
  self->_inferenceFusion = 0;

  inferenceDenoise = self->_inferenceDenoise;
  self->_inferenceDenoise = 0;

  tripodFusion = self->_tripodFusion;
  self->_tripodFusion = 0;

  v9 = [(FigMetalContext *)self->_metal allocator];
  [v9 reset];

  v10 = [(FigMetalContext *)self->_metal allocator];
  [v10 purgeResources:0];

  *(void *)&self->_referenceFrameCandidatesCount = -1;
  return 0;
}

- (void)releaseResourcesForAccumulator:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 bandTextures];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [v3 bandTextures];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      v8 = [v3 bandTextures];
      uint64_t v9 = [v8 count];

      for (; v9; --v9)
      {
        v10 = [v3 bandTextures];
        v12 = [v10 objectAtIndexedSubscript:0];

        FigMetalDecRef();
        v11 = [v3 bandTextures];
        [v11 removeObjectAtIndex:0];
      }
    }
  }
}

- (RawNightModeProcessor)initWithCommandQueue:(id)a3
{
  id v4 = a3;
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  v53.receiver = self;
  v53.super_class = (Class)RawNightModeProcessor;
  v5 = [(RawNightModeProcessor *)&v53 init];
  if (!v5)
  {
    v51 = 0;
    goto LABEL_26;
  }
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = [objc_alloc(MEMORY[0x263F2EE30]) initWithbundle:v6 andOptionalCommandQueue:v4];
  metal = v5->_metal;
  v5->_metal = (FigMetalContext *)v7;

  uint64_t v9 = v5->_metal;
  if (!v9) {
    goto LABEL_27;
  }
  uint64_t v10 = [(FigMetalContext *)v9 commandQueue];
  metalCommandQueue = v5->_metalCommandQueue;
  v5->_metalCommandQueue = (MTLCommandQueue *)v10;

  v5->_allocatorSetupComplete = 0;
  currentBatch = v5->_currentBatch;
  v5->_currentBatch = 0;

  v5->_mode = 1;
  v5->_sphereOffsetEnabled = 0;
  if ([(RawNightModeProcessor *)v5 resetState]) {
    goto LABEL_27;
  }
  v13 = [[CMIRawNightModeRegistrationStage alloc] initWithMetalContext:v5->_metal];
  registrationStage = v5->_registrationStage;
  v5->_registrationStage = v13;

  if (!v5->_registrationStage) {
    goto LABEL_27;
  }
  v15 = [[RawNMReferenceFrameSelector alloc] initWithMetal:v5->_metal];
  referenceFrameSelector = v5->_referenceFrameSelector;
  v5->_referenceFrameSelector = v15;

  if (!v5->_referenceFrameSelector) {
    goto LABEL_27;
  }
  v17 = [[RawNightModeDemWarpStage alloc] initWithMetalContext:v5->_metal];
  demWarp = v5->_demWarp;
  v5->_demWarp = v17;

  if (!v5->_demWarp) {
    goto LABEL_28;
  }
  v19 = [[RawNightModeGreenGhost alloc] initWithMetalContext:v5->_metal];
  greenGhost = v5->_greenGhost;
  v5->_greenGhost = v19;

  if (!v5->_greenGhost) {
    goto LABEL_28;
  }
  v21 = [[RawNightModeSemanticMasks alloc] initWithContext:v5->_metal];
  semanticMasks = v5->_semanticMasks;
  v5->_semanticMasks = v21;

  if (!v5->_semanticMasks) {
    goto LABEL_27;
  }
  v5->_gdcMode = 0;
  uint64_t v23 = [(FigMetalContext *)v5->_metal computePipelineStateFor:@"computeNoiseMaps" constants:0];
  computeNoiseMapsPipelineState = v5->_computeNoiseMapsPipelineState;
  v5->_computeNoiseMapsPipelineState = (MTLComputePipelineState *)v23;

  if (!v5->_computeNoiseMapsPipelineState) {
    goto LABEL_27;
  }
  uint64_t v25 = [(FigMetalContext *)v5->_metal computePipelineStateFor:@"downsampleAndToneMap" constants:0];
  downsampleAndToneMapPipelineState = v5->_downsampleAndToneMapPipelineState;
  v5->_downsampleAndToneMapPipelineState = (MTLComputePipelineState *)v25;

  if (!v5->_downsampleAndToneMapPipelineState) {
    goto LABEL_27;
  }
  uint64_t v27 = [(FigMetalContext *)v5->_metal computePipelineStateFor:@"downsampleBias" constants:0];
  biasDownsamplePipelineState = v5->_biasDownsamplePipelineState;
  v5->_biasDownsamplePipelineState = (MTLComputePipelineState *)v27;

  if (!v5->_biasDownsamplePipelineState) {
    goto LABEL_27;
  }
  uint64_t v29 = [(FigMetalContext *)v5->_metal computePipelineStateFor:@"correctDnrBias" constants:0];
  correctDnrBiasPipelineState = v5->_correctDnrBiasPipelineState;
  v5->_correctDnrBiasPipelineState = (MTLComputePipelineState *)v29;

  if (!v5->_correctDnrBiasPipelineState) {
    goto LABEL_27;
  }
  uint64_t v31 = objc_opt_new();
  sidecarMetadata = v5->_sidecarMetadata;
  v5->_sidecarMetadata = (NSMutableDictionary *)v31;

  uint64_t v33 = objc_opt_new();
  framesAwaitingFusion = v5->_framesAwaitingFusion;
  v5->_framesAwaitingFusion = (NSMutableArray *)v33;

  if (!v5->_framesAwaitingFusion) {
    goto LABEL_27;
  }
  uint64_t v35 = objc_opt_new();
  postNetworkTuningParams = v5->_postNetworkTuningParams;
  v5->_postNetworkTuningParams = (RawNightModePostNetworkTuningParams *)v35;

  if (!v5->_postNetworkTuningParams) {
    goto LABEL_27;
  }
  v37 = [[RawNightModeMultiFrameOutlierPixelCorrection alloc] initWithMetalContext:v5->_metal];
  multiFrameOPC = v5->_multiFrameOPC;
  v5->_multiFrameOPC = v37;

  if (!v5->_multiFrameOPC) {
    goto LABEL_27;
  }
  uint64_t v39 = objc_opt_new();
  multiFrameOPCTuningParams = v5->_multiFrameOPCTuningParams;
  v5->_multiFrameOPCTuningParams = (RawNightModeMultiFrameOutlierPixelCorrectionTuningParams *)v39;

  if (!v5->_multiFrameOPCTuningParams) {
    goto LABEL_27;
  }
  v41 = [[RawNightModePostDemosaic alloc] initWithMetalContext:v5->_metal];
  chromaSuppression = v5->_chromaSuppression;
  v5->_chromaSuppression = v41;

  if (!v5->_chromaSuppression) {
    goto LABEL_27;
  }
  uint64_t v43 = objc_opt_new();
  postDemosaicTuningParams = v5->_postDemosaicTuningParams;
  v5->_postDemosaicTuningParams = (RawNightModePostDemosaicTuningParams *)v43;

  if (!v5->_postDemosaicTuningParams) {
    goto LABEL_27;
  }
  if (!FigGetCFPreferenceNumberWithDefault())
  {
    v45 = [[SoftLTM alloc] initWithCommandQueue:v5->_metalCommandQueue];
    softLTMStage = v5->_softLTMStage;
    v5->_softLTMStage = v45;

    if (!v5->_softLTMStage) {
      goto LABEL_27;
    }
  }
  uint64_t v47 = objc_opt_new();
  constrainedRegistrationTuningParams = v5->_constrainedRegistrationTuningParams;
  v5->_constrainedRegistrationTuningParams = (CMIRawNightModeConstrainedRegistrationTuningParams *)v47;

  if (!v5->_constrainedRegistrationTuningParams
    || (-[CMIRawNightModeRegistrationStage setConstrainedRegistrationParams:](v5->_registrationStage, "setConstrainedRegistrationParams:"), uint64_t v49 = objc_opt_new(), regwarpTuningParams = v5->_regwarpTuningParams, v5->_regwarpTuningParams = (FigRegWarpPPGPUTuningParams *)v49, regwarpTuningParams, !v5->_regwarpTuningParams))
  {
LABEL_27:
    FigDebugAssert3();
LABEL_28:
    FigSignalErrorAt();
    v51 = 0;
    goto LABEL_24;
  }
  -[CMIRawNightModeRegistrationStage setRegwarpTuningParams:](v5->_registrationStage, "setRegwarpTuningParams:");
  v51 = v5;
LABEL_24:

LABEL_26:
  return v51;
}

+ (id)createMetalTextureWithMetalContext:(id)a3 label:(id)a4 width:(unint64_t)a5 height:(unint64_t)a6 pixelFormat:(unint64_t)a7 compressionDisabled:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a3;
  id v14 = a4;
  if (v13
    && a5
    && a6
    && ([v13 allocator],
        v15 = objc_claimAutoreleasedReturnValue(),
        v16 = (void *)[v15 newTextureDescriptor],
        v15,
        v16))
  {
    v17 = [v16 desc];
    [v17 setTextureType:2];

    v18 = [v16 desc];
    [v18 setWidth:a5];

    v19 = [v16 desc];
    [v19 setHeight:a6];

    v20 = [v16 desc];
    [v20 setUsage:7];

    v21 = [v16 desc];
    [v21 setPixelFormat:a7];

    if (v8)
    {
      v22 = [v16 desc];
      [v22 setCompressionMode:2];

      uint64_t v23 = [v16 desc];
      [v23 setCompressionFootprint:0];

      v24 = [v16 desc];
      [v24 setCompressionType:0];
    }
    [v16 setLabel:0];
    uint64_t v25 = [v13 allocator];
    v26 = (void *)[v25 newTextureWithDescriptor:v16];

    if (!v26)
    {
      FigDebugAssert3();
      FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    v26 = 0;
  }

  return v26;
}

+ (id)createMetalTextureWithMetalContext:(id)a3 label:(id)a4 width:(unint64_t)a5 height:(unint64_t)a6 pixelFormat:(unint64_t)a7
{
  return +[RawNightModeProcessor createMetalTextureWithMetalContext:a3 label:a4 width:a5 height:a6 pixelFormat:a7 compressionDisabled:0];
}

+ (int)populateLSCWBGParamsFromMetadata:(id)a3 cameraInfoByPortType:(id)a4 lscGainMapParameters:(id)a5 params:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9 && a6)
  {
    LODWORD(v12) = 1166016512;
    objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2E0], 0, v12);
    *(double *)v26.i64 = v13;
    LODWORD(v13) = 1166016512;
    objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2D8], 0, v13);
    float v25 = v14;
    LODWORD(v15) = 1166016512;
    objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2D0], 0, v15);
    float v24 = v16;
    LODWORD(v17) = 1166016512;
    objc_msgSend(v9, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F4F8], 0, v17);
    *(float *)v19.i32 = v18 * 0.00024414;
    v20.i32[1] = v26.i32[1];
    float32x4_t v21 = v26;
    v21.f32[1] = v25;
    v21.f32[2] = v24;
    *(float *)v20.i32 = fminf(fminf(v26.f32[0], v24), v25);
    *(float32x4_t *)&a6->var0.var0 = vdivq_f32(vdivq_f32(v21, (float32x4_t)vdupq_lane_s32(v20, 0)), (float32x4_t)vdupq_lane_s32(v19, 0));
    int v22 = +[RawNightModeInferenceCommon getLSCParams:&a6[4] fromMetadata:v9 fromCameraInfoByPortType:v10 fromLSCGainMapParameters:v11];
    if (v22) {
      FigDebugAssert3();
    }
  }
  else
  {
    int v22 = FigSignalErrorAt();
  }

  return v22;
}

+ (int)populateWBGParamsFromMetadata:(id)a3 params:
{
  id v4 = v3;
  id v5 = a3;
  uint64_t v7 = v5;
  if (v5)
  {
    LODWORD(v6) = 1166016512;
    objc_msgSend(v5, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2E0], 0, v6);
    *(double *)v21.i64 = v8;
    LODWORD(v8) = 1166016512;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2D8], 0, v8);
    float v20 = v9;
    LODWORD(v10) = 1166016512;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2D0], 0, v10);
    float v19 = v11;
    LODWORD(v12) = 1166016512;
    objc_msgSend(v7, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F4F8], 0, v12);
    int v13 = 0;
    v14.i32[1] = v21.i32[1];
    float32x4_t v15 = v21;
    v15.f32[1] = v20;
    v15.f32[2] = v19;
    *(float *)v14.i32 = fminf(fminf(v21.f32[0], v19), v20);
    *(float *)v17.i32 = v16 * 0.00024414;
    *id v4 = vdivq_f32(vdivq_f32(v15, (float32x4_t)vdupq_lane_s32(v14, 0)), (float32x4_t)vdupq_lane_s32(v17, 0));
  }
  else
  {
    int v13 = FigSignalErrorAt();
  }

  return v13;
}

- (int)determineWorkingBufferRequirementsWithPrepareDescriptorByProcessingType:(id)a3 nrfConfig:(id)a4 memoryAllocationInfo:(id *)a5
{
  double v6 = objc_msgSend(a3, "objectForKeyedSubscript:", &unk_270E98518, a4);
  uint64_t v7 = v6;
  if (v6)
  {
    int v8 = [v6 width];
    int v9 = [v7 height] * v8;
    int v10 = 272;
    if (v9 == 12773376) {
      int v10 = 262;
    }
    a5->var0 = ((v10 * (uint64_t)v9 + 12773375) / 0xC2E800uLL) << 20;
    a5->var2 = (int)[v7 width];
    a5->var3 = (int)[v7 height];
    a5->var4 = [v7 pixelFormat];
  }

  return 0;
}

- (int)prewarmWithTuningParameters:(id)a3
{
  objc_storeStrong((id *)&self->_tuningParameters, a3);

  return [(RawNightModeProcessor *)self prewarm];
}

- (int)prewarm
{
  if (!self->_metalCommandQueue) {
    goto LABEL_21;
  }
  metal = self->_metal;
  if (metal)
  {
    id v4 = [(FigMetalContext *)metal commandQueue];

    id v5 = self->_metal;
    if (!v4)
    {
      [(FigMetalContext *)self->_metal setCommandQueue:self->_metalCommandQueue];
      id v5 = self->_metal;
    }
    goto LABEL_6;
  }
  id v6 = objc_alloc(MEMORY[0x263F2EE30]);
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v8 = (FigMetalContext *)[v6 initWithbundle:v7 andOptionalCommandQueue:self->_metalCommandQueue];
  int v9 = self->_metal;
  self->_metal = v8;

  id v5 = self->_metal;
  if (!v5)
  {
LABEL_21:
    FigDebugAssert3();
    return -1;
  }
LABEL_6:
  int v10 = +[RawNMReferenceFrameSelector prewarmShaders:v5];
  int v11 = +[CMIRawNightModeRegistrationStage prewarmShaders:self->_metal];
  if (v11) {
    int v10 = v11;
  }
  int v12 = +[RawNightModeDemWarpStage prewarmShaders:self->_metal];
  if (v12) {
    int v10 = v12;
  }
  int v13 = +[RawNightModeGreenGhost prewarmShaders:self->_metal];
  if (v13) {
    int v10 = v13;
  }
  int v14 = +[RawNightModeFusionMetalStage prewarmShadersWithCommandQueue:self->_metalCommandQueue];
  if (v14) {
    int v10 = v14;
  }
  int v15 = +[RawNightModeDenoiseMetalStage prewarmShadersWithCommandQueue:self->_metalCommandQueue];
  if (v15) {
    int v10 = v15;
  }
  int v16 = +[RawNightModeTripodFusionMetalStage prewarmShadersWithCommandQueue:self->_metalCommandQueue];
  if (v16) {
    int v10 = v16;
  }
  int result = +[RawNightModeMultiFrameOutlierPixelCorrection prewarmShaders:self->_metal];
  if (!result) {
    return v10;
  }
  return result;
}

- (int)prepareToProcess:(unsigned int)a3
{
  return -28602;
}

- (int)process
{
  uint64_t v191 = *MEMORY[0x263EF8340];
  v161 = self->_output;
  id v176 = 0;
  id v177 = 0;
  id v174 = 0;
  id v175 = 0;
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  long long v178 = 0uLL;
  int v179 = 0;
  if ([(RawNMReferenceFrameSelector *)self->_referenceFrameSelector status] != 2)
  {
    int v3 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector forceSelection];
    if (v3)
    {
      int v13 = v3;
      FigDebugAssert3();
    }
    else
    {
      [(RawNightModeProcessor *)self processInitialFrames:self->_referenceFrameSelector];
      if (self->_currentBatch) {
        goto LABEL_11;
      }
      id v4 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];

      if (!v4) {
        goto LABEL_11;
      }
      id v5 = [RawNightModeBatch alloc];
      id v6 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
      uint64_t v7 = [(RawNightModeBatch *)v5 initWithReferenceFrame:v6 batchSize:3];
      currentBatch = self->_currentBatch;
      self->_currentBatch = v7;

      int v9 = self->_currentBatch;
      if (v9)
      {
        if (dword_26B430EA8)
        {
          unsigned int v173 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          int v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();

          int v9 = self->_currentBatch;
        }
        -[RawNightModeBatch setMetalContext:](v9, "setMetalContext:", self->_metal, v153, v154);
        [(RawNightModeBatch *)self->_currentBatch setAccumulator:self->_pyramidAccumulator];
        goto LABEL_11;
      }
      FigDebugAssert3();
      int v13 = FigSignalErrorAt();
    }
    v160 = 0;
    goto LABEL_115;
  }
LABEL_11:
  v160 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
  if (!v160)
  {
    FigDebugAssert3();
    id WeakRetained = 0;
    v160 = 0;
    v157 = 0;
    v162 = 0;
    int v13 = -28652;
    goto LABEL_78;
  }
  int v11 = self->_currentBatch;
  if (v11)
  {
    if (self->_mode == 3)
    {
      int v12 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
      int v13 = [(RawNightModeProcessor *)self runTripodFusionForBatch:v11 isLast:1 referenceFrame:v12];
    }
    else
    {
      int v13 = [(RawNightModeProcessor *)self runInferenceEngineForBatch:self->_currentBatch last:1];
    }
    if (v13 || (int v13 = [(RawNightModeBatch *)self->_currentBatch releaseMemory]) != 0)
    {
      FigDebugAssert3();
LABEL_115:
      v157 = 0;
      id WeakRetained = 0;
      goto LABEL_116;
    }
  }
  if (dword_26B430EA8)
  {
    unsigned int v173 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v15 = 0;
  if ([(NRFRawNightModeOutputFrame *)self->_outputFrame inferenceInputPixelBuffer]
    && WeakRetained)
  {
    if (objc_opt_respondsToSelector())
    {
      int v16 = [WeakRetained processorGetInferenceResults:self];
      int v15 = v16;
      if (!v16)
      {
        FigDebugAssert3();
        v157 = 0;
        v162 = 0;
        int v13 = -28634;
        goto LABEL_78;
      }
      -[RawNightModeSemanticMasks setSkinMaskPixelBuffer:](self->_semanticMasks, "setSkinMaskPixelBuffer:", [v16 skinMask]);
      -[RawNightModeSemanticMasks setSkyMaskPixelBuffer:](self->_semanticMasks, "setSkyMaskPixelBuffer:", [v15 skyMask]);
      -[RawNightModeSemanticMasks setPersonMaskPixelBuffer:](self->_semanticMasks, "setPersonMaskPixelBuffer:", [v15 highResPersonMask]);
      -[RawNightModeSemanticMasks setHairMaskPixelBuffer:](self->_semanticMasks, "setHairMaskPixelBuffer:", [v15 hairMask]);
    }
    else
    {
      int v15 = 0;
    }
  }
  v157 = v15;
  int v13 = [(RawNightModeFusionInference *)self->_inferenceFusion resetState];
  if (v13
    || (int v13 = [(RawNightModeTripodFusion *)self->_tripodFusion resetState]) != 0
    || self->_runGreenGhostMitigation
    && ((int v13 = [(RawNightModeGreenGhost *)self->_greenGhost mixRefFrameWithAccumulator:self->_pyramidAccumulator]) != 0|| (int v13 = [(RawNightModeGreenGhost *)self->_greenGhost residualCorrectionOfAccumulator:self->_pyramidAccumulator]) != 0))
  {
    FigDebugAssert3();
LABEL_116:
    v162 = 0;
    goto LABEL_78;
  }
  v162 = objc_opt_new();
  if (!v162)
  {
    FigDebugAssert3();
    v162 = 0;
LABEL_120:
    int v13 = -28603;
    goto LABEL_78;
  }
  int32x2_t v17 = objc_opt_new();
  [v162 setInputs:v17];

  float v18 = [v162 inputs];
  LODWORD(v17) = v18 == 0;

  if (v17
    || (float v19 = objc_opt_new(),
        [v162 setOutputs:v19],
        v19,
        [v162 outputs],
        float v20 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v19) = v20 == 0,
        v20,
        v19))
  {
    FigDebugAssert3();
    goto LABEL_120;
  }
  float32x4_t v21 = [(NRFOutput *)v161 metadata];
  BOOL v22 = v21 == 0;

  if (v22) {
    goto LABEL_103;
  }
  uint64_t v23 = [(NRFOutput *)v161 textures];
  float v24 = [v23 objectAtIndexedSubscript:0];
  BOOL v25 = v24 == 0;

  if (v25) {
    goto LABEL_103;
  }
  float32x4_t v26 = [(NRFOutput *)v161 textures];
  uint64_t v27 = [v26 objectAtIndexedSubscript:1];
  BOOL v28 = v27 == 0;

  if (v28) {
    goto LABEL_103;
  }
  int v13 = [(RawNightModeProcessor *)self runAWBOnOutputFrame:v161];
  if (v13 || (int v13 = [(RawNightModeProcessor *)self computeYUVNoiseMap]) != 0)
  {
    FigDebugAssert3();
    goto LABEL_78;
  }
  if (!self->_rawNightModeTuningParameters || !self->_postNetworkTuningParams)
  {
LABEL_103:
    FigDebugAssert3();
    int v13 = -28601;
    goto LABEL_78;
  }
  objc_msgSend(v162, "setRawNightModeTuningParameters:");
  uint64_t v29 = [(NSDictionary *)self->_rawNightModeTuningParameters objectForKeyedSubscript:@"NetworkParameters"];
  v30 = [v29 objectForKeyedSubscript:@"DNR"];
  uint64_t v31 = [v30 objectForKeyedSubscript:@"TilePadding"];
  v32 = -[RawNightModeInputFrame properties]((uint64_t)v160);
  uint64_t v33 = [v32 meta];
  LODWORD(v34) = *(_DWORD *)([v33 exposureParams] + 108);
  uint64_t v35 = +[RawNightModeInferenceCommon getTilePadding:v31 forGain:v34];
  [v162 setTilePadding:v35];

  noiseMapAccumulatorTexture = self->_noiseMapAccumulatorTexture;
  v37 = [v162 inputs];
  [v37 setNoiseMapTexture:noiseMapAccumulatorTexture];

  v38 = [(RawNightModeFusionInferencePyramid *)self->_pyramidAccumulator bandTextures];
  uint64_t v39 = [v38 objectAtIndexedSubscript:0];
  v40 = [v162 inputs];
  [v40 setInputRGBTexture:v39];

  v41 = -[RawNightModeInputFrame lscGainsTex]((uint64_t)v160);
  v42 = [v162 inputs];
  [v42 setLscGainsTexture:v41];

  uint64_t v43 = -[RawNightModeInputFrame lensShadingCorrectionGainMapParameters]((uint64_t)v160);
  v44 = [v162 inputs];
  [v44 setLscGainMapParameters:v43];

  v45 = [(NRFOutput *)v161 metadata];
  v46 = [v162 inputs];
  [v46 setMetadata:v45];

  uint64_t v47 = -[RawNightModeInputFrame firstPix]((uint64_t)v160);
  v48 = [v162 inputs];
  [v48 setFirstPix:v47];

  uint64_t v49 = -[RawNightModeInputFrame properties]((uint64_t)v160);
  v50 = [v49 meta];
  int v51 = *(_DWORD *)([v50 exposureParams] + 108);
  v52 = [v162 inputs];
  LODWORD(v53) = v51;
  [v52 setAeTargetGain:v53];

  BOOL v54 = -[RawNightModeInputFrame cfaLayout]((uint64_t)v160) == 3;
  v55 = [v162 inputs];
  [v55 setIsQuadra:v54];

  semanticMasks = self->_semanticMasks;
  v57 = [v162 inputs];
  [v57 setSemanticMasks:semanticMasks];

  postNetworkTuningParams = self->_postNetworkTuningParams;
  v59 = [v162 inputs];
  [v59 setPostNetworkTuningParams:postNetworkTuningParams];

  cameraInfoByPortType = self->_cameraInfoByPortType;
  v61 = [v162 inputs];
  [v61 setCameraInfoByPortType:cameraInfoByPortType];

  v62 = [(NRFOutput *)v161 textures];
  v63 = [v62 objectAtIndexedSubscript:0];
  v64 = [v162 outputs];
  [v64 setOutputLumaTexture:v63];

  if ([(RawNightModePostDemosaicTuningParams *)self->_postDemosaicTuningParams chromaSuppressionEnabled])
  {
    metal = self->_metal;
    v66 = [(NRFOutput *)v161 textures];
    v67 = [v66 objectAtIndexedSubscript:1];
    uint64_t v68 = [v67 width];
    v69 = [(NRFOutput *)v161 textures];
    v70 = [v69 objectAtIndexedSubscript:1];
    uint64_t v71 = [v70 height];
    v72 = [(NRFOutput *)v161 textures];
    v73 = [v72 objectAtIndexedSubscript:1];
    v74 = +[RawNightModeProcessor createMetalTextureWithMetalContext:label:width:height:pixelFormat:compressionDisabled:](RawNightModeProcessor, "createMetalTextureWithMetalContext:label:width:height:pixelFormat:compressionDisabled:", metal, @"chromaSuppressionTexture", v68, v71, [v73 pixelFormat], 1);
    id v75 = v174;
    id v174 = v74;

    if (!v174)
    {
      FigDebugAssert3();
      int v13 = FigSignalErrorAt();
      goto LABEL_78;
    }
    v76 = [v162 outputs];
    [v76 setOutputChromaTexture:v174];
  }
  else
  {
    v76 = [(NRFOutput *)v161 textures];
    v77 = [v76 objectAtIndexedSubscript:1];
    v78 = [v162 outputs];
    [v78 setOutputChromaTexture:v77];
  }
  v79 = self->_postNetworkTuningParams;
  v80 = -[RawNightModeInputFrame properties]((uint64_t)v160);
  v81 = [v80 meta];
  LODWORD(v82) = *(_DWORD *)([v81 exposureParams] + 108);
  int v13 = [(RawNightModePostNetworkTuningParams *)v79 getBiasCorrectionParams:&v178 gain:v82];

  if (v13)
  {
    FigDebugAssert3();
    goto LABEL_78;
  }
  long long v170 = v178;
  int v171 = v179;
  v83 = [v162 inputs];
  long long v168 = v170;
  int v169 = v171;
  [v83 setBiasCorrectionParams:&v168];

  if ((_BYTE)v178)
  {
    if ([(RawNightModePostNetworkTuningParams *)self->_postNetworkTuningParams enableClippingAddbackModulation])
    {
      v84 = [(RawNightModeFusionInferencePyramid *)self->_pyramidAccumulator bandTextures];
      v85 = [v84 objectAtIndexedSubscript:0];
      unint64_t v86 = [v85 width];

      v87 = [(RawNightModeFusionInferencePyramid *)self->_pyramidAccumulator bandTextures];
      v88 = [v87 objectAtIndexedSubscript:0];
      unint64_t v89 = [v88 height];

      v90 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"clippingMapBand1Tex" width:v86 >> 1 height:v89 >> 1 pixelFormat:25 compressionDisabled:1];
      id v91 = v177;
      id v177 = v90;

      if (!v90)
      {
        FigDebugAssert3();
        goto LABEL_120;
      }
    }
  }
  if ((_BYTE)v178 && BYTE1(v178))
  {
    v92 = [(RawNightModeFusionInferencePyramid *)self->_pyramidAccumulator bandTextures];
    v93 = [v92 objectAtIndexedSubscript:0];
    unint64_t v94 = [v93 width];

    v95 = [(RawNightModeFusionInferencePyramid *)self->_pyramidAccumulator bandTextures];
    v96 = [v95 objectAtIndexedSubscript:0];
    unint64_t v97 = [v96 height];

    v94 >>= 3;
    v97 >>= 3;
    id v98 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"localBiasBand3Tex" width:v94 height:v97 pixelFormat:115 compressionDisabled:1];
    id v99 = v176;
    id v176 = v98;

    id v100 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:@"denoisedLumaBand3Tex" width:v94 height:v97 pixelFormat:25 compressionDisabled:1];
    id v101 = v175;
    id v175 = v100;
  }
  else
  {
    id v100 = v175;
    id v98 = v176;
  }
  id v158 = v177;
  v102 = [v162 outputs];
  [v102 setOutputClippingMapTex:v158];

  v103 = [v162 outputs];
  [v103 setOutputDenoisedBand3LumaTex:v100];

  v104 = [v162 outputs];
  [v104 setOutputLocalDNRBiasTex:v98];

  int v13 = [(RawNightModeDenoiseInference *)self->_inferenceDenoise runInferenceWithInferenceData:v162];
  if (v13)
  {
    FigDebugAssert3();
    goto LABEL_78;
  }
  v166[0] = 0;
  v166[1] = 0;
  int v167 = 0;
  v105 = self->_postNetworkTuningParams;
  v106 = -[RawNightModeInputFrame properties]((uint64_t)v160);
  v107 = [v106 meta];
  LODWORD(v108) = *(_DWORD *)[v107 exposureParams];
  int v13 = [(RawNightModePostNetworkTuningParams *)v105 getAddBackParams:v166 forBand:3 gain:v108];

  if (v13) {
    goto LABEL_118;
  }
  if ((_BYTE)v178)
  {
    memset(v180, 0, sizeof(v180));
    v109 = -[RawNightModeInputFrame metadata]((uint64_t)v160);
    v110 = self->_cameraInfoByPortType;
    v111 = -[RawNightModeInputFrame lensShadingCorrectionGainMapParameters]((uint64_t)v160);
    int v13 = +[RawNightModeInferenceCommon getLSCParams:v180 fromMetadata:v109 fromCameraInfoByPortType:v110 fromLSCGainMapParameters:v111];

    if (v13) {
      goto LABEL_118;
    }
    double v156 = 0.0;
    if (BYTE1(v178)
      || ([v162 outputs],
          v112 = objc_claimAutoreleasedReturnValue(),
          [v112 outputGlobalDnrBias],
          double v156 = v113,
          v112,
          BYTE1(v178)))
    {
      v114 = [v162 outputs];
      v115 = [v114 outputLocalDNRBiasTex];
    }
    else
    {
      v115 = 0;
    }
    v116 = [(NRFOutput *)v161 textures];
    v117 = [v116 objectAtIndexedSubscript:0];
    BOOL v118 = [(RawNightModePostDemosaicTuningParams *)self->_postDemosaicTuningParams chromaSuppressionEnabled];
    BOOL v119 = v118;
    if (v118)
    {
      id v120 = v174;
    }
    else
    {
      v111 = [(NRFOutput *)v161 textures];
      id v120 = [v111 objectAtIndexedSubscript:1];
    }
    v121 = self->_semanticMasks;
    BOOL v122 = -[RawNightModeInputFrame cfaLayout]((uint64_t)v160) == 3;
    long long location = v178;
    int v190 = v179;
    LOBYTE(v155) = v122;
    int v13 = -[RawNightModeProcessor _correctLumaTex:chromaTex:withRGBBias:sementicMasks:clippingMapTex:localRGBBiasTex:denoisedLumaBand3Tex:addbackParams:biasCorrectionParams:lscParams:isQuadra:](self, "_correctLumaTex:chromaTex:withRGBBias:sementicMasks:clippingMapTex:localRGBBiasTex:denoisedLumaBand3Tex:addbackParams:biasCorrectionParams:lscParams:isQuadra:", v117, v120, v121, v158, v115, v100, v156, v166, &location, *(void *)v180, *(unsigned int *)&v180[8], v155);
    if (!v119)
    {
    }
    if (v13)
    {
      FigDebugAssert3();

      goto LABEL_78;
    }
  }
  if (![(RawNightModePostDemosaicTuningParams *)self->_postDemosaicTuningParams chromaSuppressionEnabled])goto LABEL_70; {
  chromaSuppression = self->_chromaSuppression;
  }
  id v124 = v174;
  v125 = [(NRFOutput *)v161 textures];
  v126 = [v125 objectAtIndexedSubscript:0];
  v127 = [(NRFOutput *)v161 textures];
  v128 = [v127 objectAtIndexedSubscript:1];
  v129 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
  v130 = -[RawNightModeInputFrame metadata]((uint64_t)v129);
  int v13 = [(RawNightModePostDemosaic *)chromaSuppression suppressChroma:v124 lumaTexture:v126 outputChromaTexture:v128 inputMetadata:v130 tuningParams:self->_postDemosaicTuningParams];

  if (v13)
  {
LABEL_118:
    FigDebugAssert3();
    goto LABEL_78;
  }
  FigMetalDecRef();
LABEL_70:
  [(RawNightModeProcessor *)self runLTMOnOutputFrame:v161];
  [(RawNightModeProcessor *)self _prepareOutputMetadata];
  v131 = [(NRFOutput *)self->_output completionStatus];

  if (v131)
  {
    v132 = [(NRFOutput *)self->_output completionStatus];
    objc_initWeak((id *)&location, v132);

    v133 = [(FigMetalContext *)self->_metal commandQueue];
    uint64_t v134 = [v133 commandBuffer];
    id v135 = objc_loadWeakRetained((id *)&location);
    [v135 setCommandBuffer:v134];

    id v136 = objc_loadWeakRetained((id *)&location);
    v137 = [v136 commandBuffer];
    LOBYTE(v134) = v137 == 0;

    if ((v134 & 1) != 0
      || (id v138 = objc_loadWeakRetained((id *)&location),
          [v138 commandBuffer],
          v139 = objc_claimAutoreleasedReturnValue(),
          BOOL v140 = v139 == 0,
          v139,
          v138,
          v140))
    {
      FigDebugAssert3();
      int v13 = FigSignalErrorAt();
    }
    else
    {
      if (objc_opt_respondsToSelector())
      {
        id v141 = objc_loadWeakRetained((id *)&location);
        v142 = [v141 commandBuffer];
        v163[0] = MEMORY[0x263EF8330];
        v163[1] = 3221225472;
        v163[2] = __32__RawNightModeProcessor_process__block_invoke;
        v163[3] = &unk_2655C7D80;
        id v164 = WeakRetained;
        objc_copyWeak(&v165, (id *)&location);
        [v142 addCompletedHandler:v163];

        objc_destroyWeak(&v165);
      }
      id v143 = objc_loadWeakRetained((id *)&location);
      v144 = [v143 commandBuffer];
      [v144 commit];

      int v13 = 0;
    }
    objc_destroyWeak((id *)&location);
  }
  else
  {
    int v13 = 0;
  }
LABEL_78:
  if (dword_26B430EA8)
  {
    unsigned int v173 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v145 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v146 = v173;
    if (os_log_type_enabled(v145, type)) {
      unsigned int v147 = v146;
    }
    else {
      unsigned int v147 = v146 & 0xFFFFFFFE;
    }
    if (v147)
    {
      uint64_t v148 = [(RawNightModeProcessor *)self description];
      v149 = (void *)v148;
      v150 = "failed";
      unsigned int processingType = self->_processingType;
      *(void *)&v180[4] = "-[RawNightModeProcessor process]";
      __int16 v181 = 2113;
      *(_DWORD *)v180 = 136316163;
      if (!v13) {
        v150 = "succeeded";
      }
      uint64_t v182 = v148;
      __int16 v183 = 1026;
      unsigned int v184 = processingType;
      __int16 v185 = 2081;
      v186 = v150;
      __int16 v187 = 1026;
      int v188 = v13;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  if ([(RawNightModeDenoiseInference *)self->_inferenceDenoise resetState])
  {
    FigDebugAssert3();
    int v13 = -28623;
  }

  return v13;
}

void __32__RawNightModeProcessor_process__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 didFinishProcessingWithCompletionStatus:WeakRetained];
}

- (int)runDemWarpOnFrame:(id)a3 outputTexture:(id)a4 label:(id)a5
{
  id v8 = a3;
  id v30 = a4;
  id v9 = a5;
  if (dword_26B430EA8)
  {
    int v10 = self;
    int v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    self = v10;
  }
  int gdcMode = self->_gdcMode;
  demWarp = self->_demWarp;
  uint64_t v29 = -[RawNightModeInputFrame textures]((uint64_t)v8);
  int v13 = [v29 objectAtIndexedSubscript:0];
  uint64_t v14 = -[RawNightModeInputFrame firstPix]((uint64_t)v8);
  int v15 = -[RawNightModeInputFrame properties]((uint64_t)v8);
  uint64_t v16 = [v15 regHomography];
  int32x2_t v17 = -[RawNightModeInputFrame shiftMap]((uint64_t)v8);
  float v18 = -[RawNightModeInputFrame blendingWeight]((uint64_t)v8);
  if (gdcMode)
  {
    uint64_t v19 = -[RawNightModeInputFrame gdcParams]((uint64_t)v8);
    [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
    v21 = id v20 = v9;
    uint64_t v22 = -[RawNightModeInputFrame gdcParams]((uint64_t)v21);
    uint64_t v23 = v14;
    float v24 = v30;
    int v25 = [(RawNightModeDemWarpStage *)demWarp runDemWarpInputTex:v13 firstPix:v23 outputRGBTex:v30 withHomography:v16 shiftMap:v17 blendingWeight:v18 inputFrameGDCParams:v19 outputFrameGDCParams:v22];

    id v9 = v20;
  }
  else
  {
    uint64_t v26 = v14;
    float v24 = v30;
    int v25 = [(RawNightModeDemWarpStage *)demWarp runDemWarpInputTex:v13 firstPix:v26 outputRGBTex:v30 withHomography:v16 shiftMap:v17 blendingWeight:v18 inputFrameGDCParams:0 outputFrameGDCParams:0];
  }

  return v25;
}

- (int)runLTMOnOutputFrame:(id)a3
{
  id v4 = a3;
  [(SoftLTM *)self->_softLTMStage setupIBPTuningParameters:self->_ibpTuningParameters with:2];
  [(SoftLTM *)self->_softLTMStage setIsDigitalFlash:1];
  softLTMStage = self->_softLTMStage;
  id v6 = [v4 textures];
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];
  id v8 = [v4 textures];
  id v9 = [v8 objectAtIndexedSubscript:1];
  int v10 = [v4 metadata];
  int v11 = [(SoftLTM *)softLTMStage computeLTMFromLuma:v7 chroma:v9 metadata:v10 applyCCM:0];

  if (v11)
  {
    int v12 = (void *)[v11 mutableCopy];
    [v4 setMetadata:v12];
  }
  return 0;
}

- (int)runAWBOnOutputFrame:(id)a3
{
  v153[6] = *MEMORY[0x263EF8340];
  id v5 = a3;
  char v151 = 0;
  id v6 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
  int v7 = -[RawNightModeInputFrame cfaLayout]((uint64_t)v6);

  uint64_t v8 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
  id v9 = (void *)v8;
  v149 = v5;
  if (v7 == 3)
  {
    int v10 = (const void *)-[RawNightModeInputFrame sampleBuffer](v8);
    int v11 = (opaqueCMSampleBuffer *)CMGetAttachment(v10, (CFStringRef)*MEMORY[0x263F2EF60], 0);

    ImageBuffer = CMSampleBufferGetImageBuffer(v11);
    if (!ImageBuffer)
    {
      FigDebugAssert3();
      int v32 = FigSignalErrorAt();
      id v22 = 0;
      double v34 = 0;
      goto LABEL_48;
    }
    uint64_t v13 = objc_opt_new();
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      int v15 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
      uint64_t v16 = -[RawNightModeInputFrame lensShadingCorrectionGainMapParameters]((uint64_t)v15);
      int32x2_t v17 = [v16 objectForKeyedSubscript:*MEMORY[0x263F2F800]];

      if (v17)
      {
        float v18 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
        uint64_t v19 = -[RawNightModeInputFrame lensShadingCorrectionGainMapParameters]((uint64_t)v18);
        id v20 = [v19 objectForKeyedSubscript:*MEMORY[0x263F2F7E0]];

        if (v20)
        {
          [v14 setTextureType:3];
          [v14 setArrayLength:4];
          objc_msgSend(v14, "setWidth:", objc_msgSend(v17, "longValue"));
          objc_msgSend(v14, "setHeight:", objc_msgSend(v20, "longValue"));
          [v14 setUsage:7];
          [v14 setPixelFormat:115];
          [v14 setCompressionMode:2];
          [v14 setCompressionFootprint:0];
          [v14 setCompressionType:0];
          float32x4_t v21 = [(FigMetalContext *)self->_metal device];
          id v22 = (id)[v21 newTextureWithDescriptor:v14];

          if (v22)
          {
            if (!CVPixelBufferLockBaseAddress(ImageBuffer, 0))
            {
              uint64_t v23 = ImageBuffer;
              BaseAddress = (char *)CVPixelBufferGetBaseAddress(ImageBuffer);
              v145 = v17;
              uint64_t v25 = [v17 longValue];
              uint64_t v26 = [v20 longValue];
              pixelBuffer = v23;
              unsigned int BytesPerRow = CVPixelBufferGetBytesPerRow(v23);
              BOOL v28 = v20;
              unsigned int v29 = BytesPerRow;
              id v143 = v28;
              uint64_t v30 = 0;
              uint64_t v31 = [v28 unsignedIntValue] * BytesPerRow;
              do
              {
                memset(v150, 0, 24);
                v150[3] = v25;
                v150[4] = v26;
                v150[5] = 1;
                [v22 replaceRegion:v150 mipmapLevel:0 slice:v30 withBytes:BaseAddress bytesPerRow:v29 bytesPerImage:v31];
                BaseAddress += v31;
                ++v30;
              }
              while (v30 != 4);
              if (CVPixelBufferUnlockBaseAddress(pixelBuffer, 0))
              {
                uint64_t v136 = v3;
                LODWORD(v135) = 0;
                FigDebugAssert3();
                double v34 = 0;
                int v32 = 0;
                char v33 = 0;
              }
              else
              {
                id v22 = v22;
                int v32 = 0;
                char v33 = 1;
                double v34 = (__CVBuffer *)v22;
              }
              id v20 = v143;
              int32x2_t v17 = v145;
              goto LABEL_13;
            }
            uint64_t v136 = v3;
            LODWORD(v135) = 0;
            FigDebugAssert3();
            double v34 = 0;
            int v32 = 0;
LABEL_56:
            char v33 = 0;
LABEL_13:

            if (v33)
            {
              id v5 = v149;
              goto LABEL_16;
            }
            ImageBuffer = 0;
LABEL_33:
            v133 = 0;
            v132 = 0;
            id v5 = v149;
            goto LABEL_34;
          }
          uint64_t v136 = v3;
          LODWORD(v135) = 0;
          FigDebugAssert3();
          int v32 = FigSignalErrorAt();
        }
        else
        {
          uint64_t v136 = v3;
          LODWORD(v135) = 0;
          FigDebugAssert3();
          int v32 = FigSignalErrorAt();
          id v22 = 0;
        }
        double v34 = 0;
        goto LABEL_56;
      }
      FigDebugAssert3();
      int v32 = FigSignalErrorAt();
    }
    else
    {
      FigDebugAssert3();
      int v32 = FigSignalErrorAt();
    }
    ImageBuffer = 0;
    id v22 = 0;
    double v34 = 0;
    goto LABEL_33;
  }
  -[RawNightModeInputFrame lscGainsTex](v8);
  double v34 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();

  id v22 = 0;
  int v32 = 0;
LABEL_16:
  if (!self->_awbProcessor)
  {
    FigDebugAssert3();
    int v32 = FigSignalErrorAt();
    ImageBuffer = 0;
LABEL_48:
    v133 = 0;
    v132 = 0;
    goto LABEL_34;
  }
  uint64_t v35 = [v5 metadata];
  uint64_t v36 = *MEMORY[0x263F2F5C8];
  uint64_t v37 = [v35 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];

  v38 = [(NSDictionary *)self->_ibpTuningParameters objectForKeyedSubscript:@"DefaultSensorIDs"];
  uint64_t v39 = [v38 objectForKeyedSubscript:v37];

  unsigned int v146 = (void *)v37;
  v40 = [(NSDictionary *)self->_ibpTuningParameters objectForKeyedSubscript:v37];
  v144 = (void *)v39;
  v41 = [v40 objectForKeyedSubscript:v39];
  v42 = [v41 objectForKeyedSubscript:@"ModuleConfig"];
  moduleConfig = self->_moduleConfig;
  self->_moduleConfig = v42;

  if (!self->_moduleConfig)
  {
    FigDebugAssert3();
    int v32 = FigSignalErrorAt();
    ImageBuffer = 0;
    goto LABEL_31;
  }
  CVPixelBufferRef pixelBuffera = v34;
  v44 = [(RawNightModeFusionInferencePyramid *)self->_pyramidAccumulator bandTextures];
  v45 = [v44 objectAtIndexedSubscript:0];
  v46 = [(AWBProcessor *)self->_awbProcessor awbParams];
  [v46 setImageTex:v45];

  uint64_t v47 = [(AWBProcessor *)self->_awbProcessor awbParams];
  [v47 setClippedTex:0];

  v48 = [v5 metadata];
  uint64_t v49 = [(AWBProcessor *)self->_awbProcessor awbParams];
  [v49 setMetadata:v48];

  cameraInfoByPortType = self->_cameraInfoByPortType;
  int v51 = [v5 metadata];
  v52 = [v51 objectForKeyedSubscript:v36];
  double v53 = [(NSDictionary *)cameraInfoByPortType objectForKeyedSubscript:v52];
  BOOL v54 = [(AWBProcessor *)self->_awbProcessor awbParams];
  [v54 setCameraInfo:v53];

  v55 = NSNumber;
  v56 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
  v57 = [v55 numberWithUnsignedInt:-[RawNightModeInputFrame cfaLayout]((uint64_t)v56)];
  v58 = [(AWBProcessor *)self->_awbProcessor awbParams];
  [v58 setCfaLayout:v57];

  v59 = [(AWBProcessor *)self->_awbProcessor awbParams];
  [v59 setDigitalFlash:&unk_270E98530];

  v60 = [v5 metadata];
  v61 = (void *)[v60 mutableCopy];
  v62 = [(AWBProcessor *)self->_awbProcessor awbParams];
  [v62 setOutputMetadata:v61];

  v63 = self->_moduleConfig;
  v64 = [(AWBProcessor *)self->_awbProcessor awbParams];
  [v64 setModuleConfig:v63];

  v65 = NSNumber;
  v66 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
  v67 = [v65 numberWithUnsignedInt:-[RawNightModeInputFrame firstPix]((uint64_t)v66)];
  uint64_t v68 = [(AWBProcessor *)self->_awbProcessor awbParams];
  [v68 setFirstPixel:v67];

  v69 = [(AWBProcessor *)self->_awbProcessor awbParams];
  [v69 setSkipDemosaic:MEMORY[0x263EFFA88]];

  v70 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
  -[RawNightModeInputFrame lensShadingCorrectionGainMapParameters]((uint64_t)v70);
  ImageBuffer = (__CVBuffer *)objc_claimAutoreleasedReturnValue();

  if (!ImageBuffer
    || (int v71 = [(__CVBuffer *)ImageBuffer cmi_BOOLValueForKey:*MEMORY[0x263F2F808] defaultValue:0 found:&v151], !v151)|| (LODWORD(v72) = 1.0, v71)&& ([(__CVBuffer *)ImageBuffer cmi_floatValueForKey:*MEMORY[0x263F2F7E8] defaultValue:&v151 found:v72], !v151))
  {
    FigDebugAssert3();
    int v32 = FigSignalErrorAt();
    goto LABEL_30;
  }
  id v142 = v22;
  v73 = objc_msgSend(NSNumber, "numberWithFloat:", v72, v135, v136);
  v74 = [(AWBProcessor *)self->_awbProcessor awbParams];
  [v74 setLscMaxGain:v73];

  id v75 = [v5 metadata];
  unsigned int v76 = objc_msgSend(v75, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F5E0], 1, 0);

  if (!v76) {
    goto LABEL_42;
  }
  v77 = [v5 metadata];
  double v78 = *MEMORY[0x263F001A0];
  double v79 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v80 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v81 = *(double *)(MEMORY[0x263F001A0] + 24);
  objc_msgSend(v77, "cmi_cgRectForKey:defaultValue:found:", *MEMORY[0x263F2F660], &v151, *MEMORY[0x263F001A0], v79, v80, v81);
  double v83 = v82;
  double v85 = v84;
  double v87 = v86;
  double v89 = v88;

  if (!v151) {
    goto LABEL_42;
  }
  double v140 = v83;
  double v141 = v85;
  v90 = [v5 metadata];
  objc_msgSend(v90, "cmi_cgRectForKey:defaultValue:found:", *MEMORY[0x263F2F680], &v151, v78, v79, v80, v81);
  double v92 = v91;
  double v94 = v93;
  double v138 = v95;
  double v139 = v96;

  if (v151)
  {
    unint64_t v97 = [v5 metadata];
    objc_msgSend(v97, "cmi_cgRectForKey:defaultValue:found:", *MEMORY[0x263F2F6E0], &v151, v78, v79, v80, v81);
    double v99 = v98;
    double v101 = v100;
    double v103 = v102;
    double v105 = v104;

    if (v151)
    {
      v137 = ImageBuffer;
      v152[0] = @"X";
      v106 = [NSNumber numberWithDouble:v99];
      v153[0] = v106;
      v152[1] = @"Y";
      v107 = [NSNumber numberWithDouble:v101];
      v153[1] = v107;
      v152[2] = @"Width";
      double v108 = [NSNumber numberWithDouble:v103];
      v153[2] = v108;
      v152[3] = @"Height";
      v109 = [NSNumber numberWithDouble:v105];
      v153[3] = v109;
      v152[4] = @"FullWidth";
      v110 = [NSNumber numberWithDouble:v87 / (double)v76];
      v153[4] = v110;
      v152[5] = @"FullHeight";
      v111 = [NSNumber numberWithDouble:v89 / (double)v76];
      v153[5] = v111;
      v112 = [NSDictionary dictionaryWithObjects:v153 forKeys:v152 count:6];
      double v113 = [(AWBProcessor *)self->_awbProcessor awbParams];
      [v113 setValidRectInBufferCoords:v112];

      v154.origin.x = v92 + (double)((int)v140 / v76);
      v154.origin.y = v94 + (double)((int)v141 / v76);
      v154.size.width = (double)(int)v138;
      v154.size.height = (double)(int)v139;
      CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v154);
      v115 = [(AWBProcessor *)self->_awbProcessor awbParams];
      [v115 setValidRectInSensorReadoutCoords:DictionaryRepresentation];

      double v34 = pixelBuffera;
      if (!pixelBuffera)
      {
        FigDebugAssert3();
        int v32 = FigSignalErrorAt();
        id v5 = v149;
        id v22 = v142;
        v133 = v144;
        v132 = v146;
        ImageBuffer = v137;
        goto LABEL_34;
      }
      v116 = [(AWBProcessor *)self->_awbProcessor awbParams];
      [v116 setLscGainsTex:pixelBuffera];

      v117 = [(AWBProcessor *)self->_awbProcessor awbParams];
      [v117 setFaceAssistedBehaviorMode:&unk_270E98548];

      BOOL v118 = [(RawNightModeSemanticMasks *)self->_semanticMasks skinMaskTexture];
      BOOL v119 = [(AWBProcessor *)self->_awbProcessor awbParams];
      [v119 setSkinMask:v118];

      id v120 = [(RawNightModeSemanticMasks *)self->_semanticMasks skyMaskTexture];
      v121 = [(AWBProcessor *)self->_awbProcessor awbParams];
      [v121 setSkyMask:v120];

      int v122 = [(AWBProcessor *)self->_awbProcessor prepareToProcess:1];
      id v22 = v142;
      ImageBuffer = v137;
      if (v122)
      {
        int v32 = v122;
        FigDebugAssert3();
        id v5 = v149;
      }
      else
      {
        int v32 = [(AWBProcessor *)self->_awbProcessor process];
        id v5 = v149;
        if (v32)
        {
          FigDebugAssert3();
        }
        else
        {
          v123 = [(AWBProcessor *)self->_awbProcessor awbParams];
          [v123 setImageTex:0];

          id v124 = [(AWBProcessor *)self->_awbProcessor awbParams];
          [v124 setClippedTex:0];

          v125 = [(AWBProcessor *)self->_awbProcessor awbParams];
          [v125 setLscGainsTex:0];

          v126 = [(AWBProcessor *)self->_awbProcessor awbParams];
          [v126 setSkinMask:0];

          v127 = [(AWBProcessor *)self->_awbProcessor awbParams];
          [v127 setSkyMask:0];

          v128 = [(AWBProcessor *)self->_awbProcessor awbParams];
          v129 = [v128 outputMetadata];
          [v149 setMetadata:v129];

          v130 = [(AWBProcessor *)self->_awbProcessor awbParams];
          [v130 setMetadata:0];

          v131 = [(AWBProcessor *)self->_awbProcessor awbParams];
          [v131 setOutputMetadata:0];
        }
      }
      goto LABEL_30;
    }
LABEL_42:
    FigSignalErrorAt();
    goto LABEL_43;
  }
  FigDebugAssert3();
  int v32 = FigSignalErrorAt();
LABEL_43:
  id v22 = v142;
LABEL_30:
  double v34 = pixelBuffera;
LABEL_31:
  v133 = v144;
  v132 = v146;
LABEL_34:

  return v32;
}

- (int)finishProcessing
{
  return 0;
}

- (int)purgeResources
{
  [(RawNightModeProcessor *)self resetState];
  uint64_t v3 = [(FigMetalContext *)self->_metal allocator];
  [v3 purgeResources];

  self->_allocatorSetupComplete = 0;
  return 0;
}

- (int)setup
{
  return 0;
}

- (int)allocateResourcesForAccumulator:(id *)a3 width:(unint64_t)a4 height:(unint64_t)a5 label:(id)a6
{
  id v29 = a6;
  int v10 = [(FigMetalContext *)self->_metal commandQueue];
  int v11 = [v10 commandBuffer];

  uint64_t v12 = [v11 blitCommandEncoder];
  uint64_t v13 = (void *)v12;
  if (!v11) {
    goto LABEL_19;
  }
  if (!v12)
  {
    FigDebugAssert3();
    int v25 = -28675;
    goto LABEL_13;
  }
  if (!a3 || !v29 || (uint64_t v14 = objc_opt_new()) == 0)
  {
LABEL_19:
    FigDebugAssert3();
    int v25 = FigSignalErrorAt();
    goto LABEL_13;
  }
  int v15 = (void *)v14;
  uint64_t v27 = a3;
  BOOL v28 = v11;
  unint64_t v16 = 0;
  int mode = self->_mode;
  while (1)
  {
    uint64_t v18 = [NSString stringWithFormat:@"%@.band%d", v29, v16];
    if (!v18)
    {
      FigDebugAssert3();
      int v25 = FigSignalErrorAt();
      goto LABEL_16;
    }
    uint64_t v19 = (void *)v18;
    uint64_t v20 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:v18 width:a4 height:a5 pixelFormat:115];
    if (!v20) {
      break;
    }
    float32x4_t v21 = (void *)v20;
    [v13 invalidateCompressedTexture:v20];
    id v22 = [v15 bandTextures];
    [v22 setObject:v21 atIndexedSubscript:v16];

    if (mode != 3)
    {
      a4 >>= 1;
      a5 >>= 1;
      if (v16++ < 3) {
        continue;
      }
    }
    [v13 endEncoding];
    int v11 = v28;
    [v28 commit];
    id v24 = v15;
    *uint64_t v27 = v24;

    int v25 = 0;
    goto LABEL_13;
  }
  FigDebugAssert3();
  int v25 = FigSignalErrorAt();

LABEL_16:
  int v11 = v28;
LABEL_13:

  return v25;
}

- (int)extractLSCMetadataFromReferenceFrame:(id)a3
{
  id v4 = a3;
  id v5 = (const void *)-[RawNightModeInputFrame sampleBuffer]((uint64_t)v4);
  id v6 = (void *)CMGetAttachment(v5, (CFStringRef)*MEMORY[0x263F2EF60], 0);
  int v7 = (void *)CMGetAttachment(v6, (CFStringRef)*MEMORY[0x263F2EF68], 0);
  -[RawNightModeInputFrame setLensShadingCorrectionGainMapParameters:]((uint64_t)v4, v7);
  uint64_t v8 = -[RawNightModeInputFrame lensShadingCorrectionGainMapParameters]((uint64_t)v4);

  if (!v8) {
    goto LABEL_6;
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v6);
  if (!ImageBuffer) {
    goto LABEL_6;
  }
  int v10 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:ImageBuffer pixelFormat:115 usage:23 plane:0];
  -[RawNightModeInputFrame setLscGainsTex:]((uint64_t)v4, v10);

  int v11 = -[RawNightModeInputFrame lscGainsTex]((uint64_t)v4);

  if (v11)
  {
    int v12 = 0;
  }
  else
  {
LABEL_6:
    FigDebugAssert3();
    int v12 = FigSignalErrorAt();
  }

  return v12;
}

- (int)addFrame:(id)a3 withReferenceFrame:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v38 = 0;
  uint64_t v39 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  unsigned int v8 = [(RawNightModeConfig *)self->_currentConfig maximumInputDimensions];
  $F61E096109CF133FD2477F48C7D0CEE7 v9 = [(RawNightModeConfig *)self->_currentConfig maximumInputDimensions];
  if (dword_26B430EA8)
  {
    int v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!v7 || v6 == v7 || !-[RawNightModeInputFrame pixelBuffer]((uint64_t)v6) || self->_mode == 3) {
    goto LABEL_32;
  }
  currentBatch = self->_currentBatch;
  if (!currentBatch)
  {
    int v12 = [[RawNightModeBatch alloc] initWithReferenceFrame:v7 batchSize:3];
    uint64_t v13 = self->_currentBatch;
    self->_currentBatch = v12;

    uint64_t v14 = self->_currentBatch;
    if (!v14) {
      goto LABEL_32;
    }
    if (dword_26B430EA8)
    {
      int v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      uint64_t v14 = self->_currentBatch;
    }
    -[RawNightModeBatch setMetalContext:](v14, "setMetalContext:", self->_metal, v30, v32);
    [(RawNightModeBatch *)self->_currentBatch setAccumulator:self->_pyramidAccumulator];
    currentBatch = self->_currentBatch;
  }
  if (![(RawNightModeBatch *)currentBatch ready]) {
    goto LABEL_19;
  }
  int v16 = [(RawNightModeProcessor *)self runInferenceEngineForBatch:self->_currentBatch last:0];
  if (v16 || (int v16 = [(RawNightModeBatch *)self->_currentBatch releaseMemory]) != 0)
  {
    FigDebugAssert3();
    float32x4_t v21 = 0;
    id v22 = 0;
    goto LABEL_35;
  }
  int32x2_t v17 = [[RawNightModeBatch alloc] initWithReferenceFrame:v7 batchSize:3];
  uint64_t v18 = self->_currentBatch;
  self->_currentBatch = v17;

  uint64_t v19 = self->_currentBatch;
  if (!v19)
  {
LABEL_32:
    FigDebugAssert3();
    int v16 = FigSignalErrorAt();
    id v22 = 0;
    float32x4_t v21 = 0;
    goto LABEL_34;
  }
  if (dword_26B430EA8)
  {
    uint64_t v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v19 = self->_currentBatch;
  }
  -[RawNightModeBatch setMetalContext:](v19, "setMetalContext:", self->_metal, v31, v32);
  [(RawNightModeBatch *)self->_currentBatch setAccumulator:self->_pyramidAccumulator];
LABEL_19:
  float32x4_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"shiftMap%d", -[RawNightModeBatch count](self->_currentBatch, "count"));
  id v22 = objc_msgSend(NSString, "stringWithFormat:", @"blendingWeight%d", -[RawNightModeBatch count](self->_currentBatch, "count"));
  DWORD2(v34) = 2;
  +[RegDense getRegDenseMapPropertiesWithImageWidth:[(RawNightModeConfig *)self->_currentConfig maximumInputDimensions] imageHeight:(unint64_t)[(RawNightModeConfig *)self->_currentConfig maximumInputDimensions] >> 32 regDenseParams:&v33];
  uint64_t v23 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:v21 width:0 height:0 pixelFormat:0];
  id v24 = v39;
  uint64_t v39 = v23;

  if (!v39
    || (+[RawNightModeProcessor createMetalTextureWithMetalContext:label:width:height:pixelFormat:](RawNightModeProcessor, "createMetalTextureWithMetalContext:label:width:height:pixelFormat:", self->_metal, v22, 0, 0, 0), int v25 = objc_claimAutoreleasedReturnValue(), v26 = v38, v38 = v25, v26, !v38)|| [v38 width] != v8 >> 3|| objc_msgSend(v38, "height") != *(void *)&v9 >> 35)
  {
    FigDebugAssert3();
    int v16 = FigSignalErrorAt();
LABEL_34:
    if (v16) {
      goto LABEL_35;
    }
    goto LABEL_30;
  }
  int v16 = [(CMIRawNightModeRegistrationStage *)self->_registrationStage processNonReference:v6 reference:v7 shiftMap:v39 blendingWeight:v38];
  if (v16) {
    goto LABEL_28;
  }
  -[RawNightModeInputFrame setShiftMap:]((uint64_t)v6, v39);
  -[RawNightModeInputFrame setBlendingWeight:]((uint64_t)v6, v38);
  if (self->_runGreenGhostMitigation)
  {
    int v16 = [(RawNightModeGreenGhost *)self->_greenGhost processNonReferenceFrame:v6 forBatch:self->_currentBatch];
    if (v16) {
      goto LABEL_28;
    }
  }
  uint64_t v27 = -[RawNightModeInputFrame properties]((uint64_t)v6);
  int v28 = [v27 hasValidRegistration];

  if (v28)
  {
    ++self->_cntProcessedNonRefFrames;
    int v16 = [(RawNightModeBatch *)self->_currentBatch addFrame:v6];
    if (v16)
    {
LABEL_28:
      FigDebugAssert3();
LABEL_35:
      FigMetalDecRef();
      FigMetalDecRef();
    }
  }
  else
  {
    FigMetalDecRef();
    FigMetalDecRef();
    int v16 = 0;
  }
LABEL_30:

  return v16;
}

- (int)addTripodModeFrame:(id)a3 withReferenceFrame:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v35 = 0;
  long long v36 = 0;
  unsigned int v8 = [(RawNightModeConfig *)self->_currentConfig maximumInputDimensions];
  $F61E096109CF133FD2477F48C7D0CEE7 v9 = [(RawNightModeConfig *)self->_currentConfig maximumInputDimensions];
  if (dword_26B430EA8)
  {
    int v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!-[RawNightModeInputFrame pixelBuffer]((uint64_t)v6)) {
    goto LABEL_39;
  }
  currentBatch = self->_currentBatch;
  if (currentBatch) {
    goto LABEL_8;
  }
  int v12 = [[RawNightModeTripodBatch alloc] initWithBatchSize:4 metalContext:self->_metal accumulator:self->_pyramidAccumulator];
  uint64_t v13 = self->_currentBatch;
  self->_currentBatch = &v12->super;

  currentBatch = self->_currentBatch;
  if (!currentBatch)
  {
LABEL_39:
    FigDebugAssert3();
    int v17 = FigSignalErrorAt();
    goto LABEL_40;
  }
  if (dword_26B430EA8)
  {
    uint64_t v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    currentBatch = self->_currentBatch;
  }
LABEL_8:
  if (![(RawNightModeBatch *)currentBatch ready]) {
    goto LABEL_15;
  }
  int v15 = self->_currentBatch;
  int v16 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
  int v17 = [(RawNightModeProcessor *)self runTripodFusionForBatch:v15 isLast:0 referenceFrame:v16];

  if (v17) {
    goto LABEL_36;
  }
  int v18 = [(RawNightModeBatch *)self->_currentBatch releaseMemory];
  if (v18)
  {
    int v17 = v18;
LABEL_36:
    FigDebugAssert3();
LABEL_38:

LABEL_40:
    uint64_t v23 = 0;
    id v22 = 0;
LABEL_24:
    if (!v17) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  uint64_t v19 = [[RawNightModeTripodBatch alloc] initWithBatchSize:4 metalContext:self->_metal accumulator:self->_pyramidAccumulator];
  uint64_t v20 = self->_currentBatch;
  self->_currentBatch = &v19->super;

  if (!self->_currentBatch)
  {
    FigDebugAssert3();
    int v17 = FigSignalErrorAt();
    goto LABEL_38;
  }
  if (dword_26B430EA8)
  {
    float32x4_t v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_15:
  if (v6 == v7)
  {
    uint64_t v23 = 0;
    id v22 = 0;
    goto LABEL_21;
  }
  id v22 = objc_msgSend(NSString, "stringWithFormat:", @"shiftMap%d", -[RawNightModeBatch count](self->_currentBatch, "count"));
  uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"blendingWeight%d", -[RawNightModeBatch count](self->_currentBatch, "count"));
  uint64_t v24 = v8 >> 3;
  uint64_t v25 = *(void *)&v9 >> 35;
  long long v36 = +[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:v22 width:v24 height:v25 pixelFormat:65];

  if (!v36
    || (+[RawNightModeProcessor createMetalTextureWithMetalContext:self->_metal label:v23 width:v24 height:v25 pixelFormat:10], long long v35 = objc_claimAutoreleasedReturnValue(), 0, !v35))
  {
    FigDebugAssert3();
    int v17 = FigSignalErrorAt();
    goto LABEL_24;
  }
  int v26 = -[CMIRawNightModeRegistrationStage processNonReference:reference:shiftMap:blendingWeight:](self->_registrationStage, "processNonReference:reference:shiftMap:blendingWeight:", v6, v7, v36);
  if (v26)
  {
    int v17 = v26;
    goto LABEL_33;
  }
  -[RawNightModeInputFrame setShiftMap:]((uint64_t)v6, v36);
  -[RawNightModeInputFrame setBlendingWeight:]((uint64_t)v6, v35);
LABEL_21:
  int v27 = -[RawNightModeGreenGhost processNonReferenceFrame:forBatch:](self->_greenGhost, "processNonReferenceFrame:forBatch:", v6, self->_currentBatch, v32, v34);
  if (v27)
  {
    int v17 = v27;
LABEL_33:
    FigDebugAssert3();
    goto LABEL_27;
  }
  int v28 = -[RawNightModeInputFrame properties]((uint64_t)v6);
  int v29 = [v28 hasValidRegistration];

  if (v29)
  {
    int v17 = [(RawNightModeBatch *)self->_currentBatch addFrame:v6];
    ++self->_cntProcessedNonRefFrames;
    goto LABEL_24;
  }
  int v17 = 0;
LABEL_27:
  FigMetalDecRef();
  FigMetalDecRef();
LABEL_28:

  return v17;
}

- (int)processInitialFrames:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "processor:didSelectProgressiveFusionReferenceFrameIndex:", self, objc_msgSend(v4, "referenceFrameIndex"));
  }
  unsigned int v8 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
  int v9 = [(RawNightModeProcessor *)self extractLSCMetadataFromReferenceFrame:v8];

  if (v9
    || (registrationStage = self->_registrationStage,
        [v4 referenceFrame],
        int v11 = objc_claimAutoreleasedReturnValue(),
        int v9 = [(CMIRawNightModeRegistrationStage *)registrationStage processReference:v11],
        v11,
        v9))
  {
    FigDebugAssert3();
    int v12 = 0;
LABEL_32:
    int v16 = 0;
    goto LABEL_26;
  }
  int v12 = self->_output;
  uint64_t v13 = [v4 referenceFrame];
  uint64_t v14 = -[RawNightModeInputFrame metadata]((uint64_t)v13);
  [(NRFOutput *)v12 setMetadata:v14];

  rawNightModeTuningParameters = self->_rawNightModeTuningParameters;
  if (!rawNightModeTuningParameters)
  {
    FigDebugAssert3();
    int v9 = FigSignalErrorAt();
    goto LABEL_32;
  }
  int v16 = [(NSDictionary *)rawNightModeTuningParameters objectForKeyedSubscript:@"LowLightGreenGhost"];

  if (!v16
    || (int v16 = objc_opt_new(),
        -[NSDictionary objectForKeyedSubscript:](self->_rawNightModeTuningParameters, "objectForKeyedSubscript:", @"LowLightGreenGhost"), int v17 = objc_claimAutoreleasedReturnValue(), v18 = [v16 readPlist:v17], v17, v18))
  {
    FigDebugAssert3();
    int v9 = FigSignalErrorAt();
    goto LABEL_26;
  }
  if (self->_enableGreenGhostMitigation)
  {
    if (v16)
    {
      [v16 tuningParams];
      BOOL v19 = v30 != 0;
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }
  self->_runGreenGhostMitigation = v19;
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithBool:");
  float32x4_t v21 = [(RawNightModeGreenGhost *)self->_greenGhost sidecarMetadata];
  [v21 setObject:v20 forKeyedSubscript:@"Enabled"];

  if (self->_runGreenGhostMitigation)
  {
    [(RawNightModeGreenGhost *)self->_greenGhost setTuning:v16];
    [(RawNightModeGreenGhost *)self->_greenGhost setCameraInfoByPortType:self->_cameraInfoByPortType];
    greenGhost = self->_greenGhost;
    uint64_t v23 = [v4 referenceFrame];
    int v9 = [(RawNightModeGreenGhost *)greenGhost processReferenceFrame:v23 gdcMode:self->_gdcMode];

    if (v9)
    {
      FigDebugAssert3();
      goto LABEL_26;
    }
  }
  while (1)
  {
    if (![(NSMutableArray *)self->_framesAwaitingFusion count])
    {
      int v9 = 0;
      goto LABEL_26;
    }
    uint64_t v24 = [(NSMutableArray *)self->_framesAwaitingFusion objectAtIndexedSubscript:0];
    [(NSMutableArray *)self->_framesAwaitingFusion removeObjectAtIndex:0];
    int mode = self->_mode;
    int v26 = [v4 referenceFrame];

    if (mode == 3) {
      break;
    }
    if (v24 != v26)
    {
      int v28 = [v4 referenceFrame];
      int v9 = [(RawNightModeProcessor *)self addFrame:v24 withReferenceFrame:v28];

      if (v9) {
        goto LABEL_28;
      }
    }
LABEL_23:
  }
  if (v24 != v26 || [(NSMutableArray *)self->_framesAwaitingFusion count])
  {
    FigDebugAssert3();
    int v9 = FigSignalErrorAt();
    goto LABEL_29;
  }
  int v27 = [v4 referenceFrame];
  int v9 = [(RawNightModeProcessor *)self addTripodModeFrame:v24 withReferenceFrame:v27];

  if (!v9) {
    goto LABEL_23;
  }
LABEL_28:
  FigDebugAssert3();
LABEL_29:

LABEL_26:
  return v9;
}

- (int)curateFramesAwaitingFusionWithNewFrame:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableArray *)self->_framesAwaitingFusion count];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    while (1)
    {
      unsigned int v8 = [(NSMutableArray *)self->_framesAwaitingFusion objectAtIndexedSubscript:v7];
      id v9 = +[RawNMReferenceFrameSelector compareFramesA:v4 frameB:v8 usingTuningParams:self->_rawNightModeTuningParameters];

      if (v9 == v4) {
        break;
      }

      if (v6 == ++v7) {
        goto LABEL_5;
      }
    }
    [(NSMutableArray *)self->_framesAwaitingFusion insertObject:v4 atIndex:v7];
  }
  else
  {
LABEL_5:
    [(NSMutableArray *)self->_framesAwaitingFusion addObject:v4];
  }
  while ([(NSMutableArray *)self->_framesAwaitingFusion count] > (unint64_t)self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing)
    [(NSMutableArray *)self->_framesAwaitingFusion removeObjectAtIndex:[(NSMutableArray *)self->_framesAwaitingFusion count] - 1];

  return 0;
}

- (int)sendFrame:(id)a3 toReferenceFrameSelector:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = v7;
  if (!v6 || !v7)
  {
    FigDebugAssert3();
    int v11 = FigSignalErrorAt();
    goto LABEL_10;
  }
  int v9 = [v7 addFrame:v6 forMode:self->_mode usingTuningParams:self->_rawNightModeTuningParameters];
  if (v9)
  {
    int v11 = v9;
LABEL_13:
    FigDebugAssert3();
    goto LABEL_10;
  }
  int v10 = [v8 status];
  if (v10 == 1)
  {
    [(RawNightModeProcessor *)self curateFramesAwaitingFusionWithNewFrame:v6];
    goto LABEL_9;
  }
  if (v10 != 2)
  {
LABEL_9:
    int v11 = 0;
    goto LABEL_10;
  }
  [(NSMutableArray *)self->_framesAwaitingFusion addObject:v6];
  int v11 = [(RawNightModeProcessor *)self processInitialFrames:v8];
  if (v11) {
    goto LABEL_13;
  }
LABEL_10:

  return v11;
}

- (int)addFrame:(opaqueCMSampleBuffer *)a3
{
  uint64_t v3 = (RawNightModeInputFrame *)a3;
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (!a3
    || (uint64_t v3 = [[RawNightModeInputFrame alloc] initWithSampleBuffer:a3 cameraInfoByPortType:self->_cameraInfoByPortType]) == 0)
  {
    FigDebugAssert3();
    goto LABEL_43;
  }
  if (dword_26B430EA8)
  {
    uint64_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  if (self->_isFirstBatch && !self->_cntBracketSampleBuffers)
  {
    id v6 = [(NSDictionary *)self->_ibpTuningParameters cmi_dictionary];
    ibpTuningParameters = self->_ibpTuningParameters;
    self->_ibpTuningParameters = v6;

    if (!self->_ibpTuningParameters)
    {
      FigDebugAssert3();
      unsigned int v8 = 0;
      int v11 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      goto LABEL_53;
    }
    unsigned int v8 = -[RawNightModeInputFrame metadata]((uint64_t)v3);

    if (v8
      && (-[RawNightModeInputFrame metadata]((uint64_t)v3),
          int v9 = objc_claimAutoreleasedReturnValue(),
          [v9 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]],
          unsigned int v8 = objc_claimAutoreleasedReturnValue(),
          v9,
          v8))
    {
      int v10 = [(NSDictionary *)self->_ibpTuningParameters objectForKeyedSubscript:@"DefaultSensorIDs"];
      int v11 = [v10 objectForKeyedSubscript:v8];

      if (v11)
      {
        int v12 = [(NSDictionary *)self->_ibpTuningParameters objectForKeyedSubscript:v8];
        uint64_t v13 = [v12 objectForKeyedSubscript:v11];

        if (v13)
        {
          uint64_t v14 = [v13 objectForKeyedSubscript:@"RawNightmodeParameters"];
          if (v14)
          {
            int v15 = -[RawNightModeInputFrame metadata]((uint64_t)v3);
            uint64_t v16 = objc_msgSend(v15, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F5E0], 0, 0);

            int v17 = objc_opt_new();
            int v18 = [(RawNightModeProcessor *)self computeTuningPlist:v17 fromInputPlist:v14 quadraBinningFactor:v16];
            if (v18)
            {
              int v30 = v18;
            }
            else
            {
              uint64_t referenceFrameCandidatesCount = self->_referenceFrameCandidatesCount;
              if (referenceFrameCandidatesCount == -1)
              {
                uint64_t v20 = [v17 objectForKeyedSubscript:@"ReferenceFrameSelection"];
                float32x4_t v21 = [v20 objectForKeyedSubscript:@"ReferenceFrameCandidatesCount"];
                self->_uint64_t referenceFrameCandidatesCount = [v21 intValue];

                uint64_t referenceFrameCandidatesCount = self->_referenceFrameCandidatesCount;
              }
              -[RawNMReferenceFrameSelector setReferenceFrameCandidatesCount:](self->_referenceFrameSelector, "setReferenceFrameCandidatesCount:", referenceFrameCandidatesCount, v38, v39);
              if (self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing == -1)
              {
                id v22 = [v17 objectForKeyedSubscript:@"ReferenceFrameSelection"];
                uint64_t v23 = [v22 objectForKeyedSubscript:@"MaximumNumberOfReferenceFrameCandidatesToHoldForProcessing"];
                self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing = [v23 intValue];
              }
              objc_storeStrong((id *)&self->_rawNightModeTuningParameters, v17);
              int v24 = [(RawNightModePostNetworkTuningParams *)self->_postNetworkTuningParams readPlist:self->_rawNightModeTuningParameters];
              if (v24)
              {
                int v30 = v24;
              }
              else
              {
                int v25 = [(RawNightModeMultiFrameOutlierPixelCorrectionTuningParams *)self->_multiFrameOPCTuningParams readPlist:self->_rawNightModeTuningParameters];
                if (v25)
                {
                  int v30 = v25;
                }
                else
                {
                  int v26 = [(CMIRawNightModeConstrainedRegistrationTuningParams *)self->_constrainedRegistrationTuningParams readPlist:self->_rawNightModeTuningParameters];
                  if (v26)
                  {
                    int v30 = v26;
                  }
                  else
                  {
                    regwarpTuningParams = self->_regwarpTuningParams;
                    int v28 = [(NSDictionary *)self->_rawNightModeTuningParameters objectForKeyedSubscript:@"Registration"];
                    int v29 = [v28 objectForKeyedSubscript:@"RegWarp"];
                    int v30 = [(FigRegWarpPPGPUTuningParams *)regwarpTuningParams readPlist:v29];

                    if (!v30)
                    {
                      int v30 = [(RawNightModePostDemosaicTuningParams *)self->_postDemosaicTuningParams readPlist:self->_rawNightModeTuningParameters];
                      if (!v30)
                      {
                        int v31 = 1;
                        goto LABEL_26;
                      }
                    }
                  }
                }
              }
            }
            FigDebugAssert3();
            int v31 = 0;
LABEL_26:

            if (!v31) {
              goto LABEL_41;
            }
            goto LABEL_27;
          }
          FigDebugAssert3();
LABEL_53:
          int v17 = 0;
          int v31 = 0;
          int v30 = -28601;
          goto LABEL_26;
        }
        FigDebugAssert3();
LABEL_51:
        uint64_t v14 = 0;
        int v17 = 0;
        int v31 = 0;
        int v30 = -28668;
        goto LABEL_26;
      }
      FigDebugAssert3();
    }
    else
    {
      FigDebugAssert3();
      int v11 = 0;
    }
    uint64_t v13 = 0;
    goto LABEL_51;
  }
LABEL_27:
  if (-[RawNightModeInputFrame bindTexturesWithConfig:metalContext:]((uint64_t)v3, self->_currentConfig, self->_metal))
  {
LABEL_43:
    int v30 = FigSignalErrorAt();
    goto LABEL_41;
  }
  int v32 = [(RawNightModeInputFrame *)v3 updateGDCParameters];
  if (v32)
  {
    int v30 = v32;
LABEL_45:
    FigDebugAssert3();
    goto LABEL_41;
  }
  int v33 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector status];
  if (v33)
  {
    if (v33 == 2)
    {
      int mode = self->_mode;
      long long v35 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
      if (mode == 3) {
        int v36 = [(RawNightModeProcessor *)self addTripodModeFrame:v3 withReferenceFrame:v35];
      }
      else {
        int v36 = [(RawNightModeProcessor *)self addFrame:v3 withReferenceFrame:v35];
      }
      int v30 = v36;

      if (v30) {
        goto LABEL_45;
      }
    }
    else if (v33 == 1)
    {
      int v30 = [(RawNightModeProcessor *)self sendFrame:v3 toReferenceFrameSelector:self->_referenceFrameSelector];
      if (v30) {
        goto LABEL_45;
      }
    }
    else
    {
      int v30 = 0;
    }
  }
  else
  {
    int v30 = -28658;
  }
  ++self->_cntBracketSampleBuffers;
LABEL_41:

  return v30;
}

- (void)finishScheduling
{
}

- (id)determineMTLPixelFormatsForCVPixelFormat:(unsigned int)a3
{
  if (a3 == 1647719528) {
    return &unk_270E97BA0;
  }
  else {
    return 0;
  }
}

- (int)prepareToProcess:(unsigned int)a3 prepareDescriptor:(id)a4
{
  v60[23] = *(id *)MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = self->_output;
  if (!v6 || a3 != 4 || !self->_output) {
    goto LABEL_49;
  }
  progressiveBracketingParameters = self->_progressiveBracketingParameters;
  if (progressiveBracketingParameters
    && ([(NRFProgressiveBracketingParameters *)progressiveBracketingParameters statistics],
        int v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 stationary],
        v9,
        progressiveBracketingParameters = self->_progressiveBracketingParameters,
        v10))
  {
    int v11 = [(NRFProgressiveBracketingParameters *)progressiveBracketingParameters mode] == 1 ? 3 : 1;
    self->_int mode = v11;
    self->_sphereOffsetEnabled = [(NRFProgressiveBracketingParameters *)self->_progressiveBracketingParameters sphereOffsetEnabled];
  }
  else
  {
    int v12 = [(NRFProgressiveBracketingParameters *)progressiveBracketingParameters mode] == 1 ? 2 : 1;
    self->_int mode = v12;
  }
  uint64_t v13 = objc_alloc_init(RawNightModeConfig);
  currentConfig = self->_currentConfig;
  self->_currentConfig = v13;

  if (!self->_currentConfig) {
    goto LABEL_49;
  }
  -[RawNightModeConfig setMaximumInputDimensions:](self->_currentConfig, "setMaximumInputDimensions:", [v6 width] | (unint64_t)(objc_msgSend(v6, "height") << 32));
  -[RawNightModeConfig setInputPixelFormat:](self->_currentConfig, "setInputPixelFormat:", [v6 pixelFormat]);
  int v15 = -[RawNightModeProcessor determineMTLPixelFormatsForCVPixelFormat:](self, "determineMTLPixelFormatsForCVPixelFormat:", [v6 pixelFormat]);
  [(RawNightModeConfig *)self->_currentConfig setInputMTLPixelFormatForPlane:v15];

  uint64_t v16 = [(RawNightModeConfig *)self->_currentConfig inputMTLPixelFormatForPlane];

  if (!v16) {
    goto LABEL_49;
  }
  -[RawNightModeConfig setMaximumOutputDimensions:](self->_currentConfig, "setMaximumOutputDimensions:", [v6 width] | (unint64_t)(objc_msgSend(v6, "height") << 32));
  [(RawNightModeConfig *)self->_currentConfig setOutputPixelFormat:CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[(NRFOutput *)v7 pixelBuffer])];
  int v17 = -[RawNightModeProcessor determineMTLPixelFormatsForCVPixelFormat:](self, "determineMTLPixelFormatsForCVPixelFormat:", [v6 pixelFormat]);
  [(RawNightModeConfig *)self->_currentConfig setOutputMTLPixelFormatForPlane:v17];

  int v18 = [(RawNightModeConfig *)self->_currentConfig outputMTLPixelFormatForPlane];

  if (!v18)
  {
LABEL_49:
    FigDebugAssert3();
    int v25 = FigSignalErrorAt();
LABEL_62:
    int v32 = 0;
    goto LABEL_48;
  }
  if (!self->_allocatorSetupComplete
    || (allocatorBackend = self->_allocatorBackend,
        [(FigMetalContext *)self->_metal allocator],
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        [v20 backendAllocator],
        float32x4_t v21 = (FigMetalAllocatorBackend *)objc_claimAutoreleasedReturnValue(),
        v21,
        v20,
        allocatorBackend != v21))
  {
    id v22 = objc_opt_new();
    uint64_t v23 = v22;
    if (v22)
    {
      [v22 setLabel:@"FigMetalAllocator_RawNightMode"];
      objc_msgSend(v23, "setMemSize:", -[FigMetalAllocatorBackend memSize](self->_allocatorBackend, "memSize"));
      [v23 setCompressionLevel:self->_nrfConfig->_compressionLevel];
      int v24 = [(FigMetalContext *)self->_metal allocator];
      int v25 = [v24 setupWithDescriptor:v23 allocatorBackend:self->_allocatorBackend];

      if (!v25)
      {
        self->_allocatorSetupComplete = 1;

        goto LABEL_22;
      }
      FigDebugAssert3();
      FigSignalErrorAt();
    }
    else
    {
      FigDebugAssert3();
      int v25 = FigSignalErrorAt();
    }

    goto LABEL_62;
  }
LABEL_22:
  if (self->_mode == 3)
  {
    if (self->_sphereOffsetEnabled) {
      uint64_t v26 = 4;
    }
    else {
      uint64_t v26 = 3;
    }
  }
  else
  {
    uint64_t v26 = 2;
  }
  int v27 = -[CMIRawNightModeRegistrationStage prepareWithImageWidth:imageHeight:registrationType:gdcMode:cameraInfoByPortType:](self->_registrationStage, "prepareWithImageWidth:imageHeight:registrationType:gdcMode:cameraInfoByPortType:", (int)[v6 width], (int)objc_msgSend(v6, "height"), v26, self->_gdcMode, self->_cameraInfoByPortType);
  if (v27)
  {
    int v25 = v27;
LABEL_52:
    FigDebugAssert3();
    goto LABEL_62;
  }
  int v28 = [(NRFOutput *)v7 bindTexturesForConfig:self->_currentConfig metalContext:self->_metal];
  if (v28)
  {
    int v25 = v28;
    goto LABEL_52;
  }
  v60[0] = 0;
  int v29 = [(RawNightModeProcessor *)self allocateResourcesForAccumulator:v60 width:[(RawNightModeConfig *)self->_currentConfig maximumOutputDimensions] height:(unint64_t)[(RawNightModeConfig *)self->_currentConfig maximumOutputDimensions] >> 32 label:@"accumulator0"];
  id v30 = v60[0];
  id v31 = v60[0];
  int v32 = v31;
  if (v29) {
    goto LABEL_63;
  }
  id v59 = v31;
  objc_storeStrong((id *)&self->_pyramidAccumulator, v30);
  metal = self->_metal;
  uint64_t v34 = [(NRFOutput *)v7 textures];
  long long v35 = [v34 objectAtIndexedSubscript:0];
  uint64_t v36 = [v35 width];
  uint64_t v37 = v7;
  uint64_t v38 = v36;
  uint64_t v39 = v37;
  uint64_t v40 = [(NRFOutput *)v37 textures];
  v41 = [v40 objectAtIndexedSubscript:0];
  +[RawNightModeProcessor createMetalTextureWithMetalContext:label:width:height:pixelFormat:](RawNightModeProcessor, "createMetalTextureWithMetalContext:label:width:height:pixelFormat:", metal, @"noiseMapAccumulator", v38, [v41 height], 25);
  v42 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  noiseMapAccumulatorTexture = self->_noiseMapAccumulatorTexture;
  self->_noiseMapAccumulatorTexture = v42;

  if (!self->_noiseMapAccumulatorTexture)
  {
    FigDebugAssert3();
    int v25 = FigSignalErrorAt();
    int v32 = v59;
    id v7 = v39;
    goto LABEL_48;
  }
  BOOL v44 = ([v6 isQuadra] & 1) != 0
     || (unint64_t)(FigGetCFPreferenceBooleanWithDefault() != 0);
  id v7 = v39;
  v45 = [v6 sensorID];
  [v45 isEqualToString:@"0x0904"];
  int CFPreferenceBooleanWithDefault = FigGetCFPreferenceBooleanWithDefault();

  BOOL v47 = [(RawNightModeProcessor *)self _requiresDarkCurrentNoiseModel:v6 processingMode:self->_mode];
  BOOL v48 = [(RawNightModeProcessor *)self _isArgyleTripodMax:v6 processingMode:self->_mode];
  if (self->_mode == 3)
  {
    if ([(RawNightModeProcessor *)self _initRawNightModeTripodFusion:v44 requiresDarkCurrentNoiseModel:v47])
    {
      goto LABEL_64;
    }
  }
  else if ([(RawNightModeProcessor *)self _initRawNightModeFusionInference:v44 isBarrington:CFPreferenceBooleanWithDefault != 0 requiresDarkCurrentNoiseModel:v47])
  {
LABEL_64:
    FigDebugAssert3();
    int v25 = FigSignalErrorAt();
    int v32 = v59;
    goto LABEL_48;
  }
  if ([(RawNightModeProcessor *)self _initRawNightModeDenoiseInference:v44 isBarrington:CFPreferenceBooleanWithDefault != 0 isArgyleTripodMax:v48])
  {
    goto LABEL_64;
  }
  uint64_t v49 = (AWBProcessor *)objc_opt_new();
  awbProcessor = self->_awbProcessor;
  self->_awbProcessor = v49;

  int v51 = self->_awbProcessor;
  int v32 = v59;
  if (!v51) {
    goto LABEL_63;
  }
  [(AWBProcessor *)v51 setMetalCommandQueue:self->_metalCommandQueue];
  [(AWBProcessor *)self->_awbProcessor setTuningParameters:0];
  if (self->_allocatorBackend)
  {
    id v52 = objc_alloc_init(MEMORY[0x263F2ED88]);
    if (v52)
    {
      double v53 = v52;
      [v52 setAllocatorBackend:self->_allocatorBackend];
      [(AWBProcessor *)self->_awbProcessor setExternalMemoryResource:v53];

      goto LABEL_43;
    }
LABEL_63:
    FigDebugAssert3();
    int v25 = FigSignalErrorAt();
    goto LABEL_48;
  }
LABEL_43:
  if ([(AWBProcessor *)self->_awbProcessor setup]) {
    goto LABEL_63;
  }
  softLTMStage = self->_softLTMStage;
  v55 = [(FigMetalContext *)self->_metal allocator];
  int v56 = [(SoftLTM *)softLTMStage prepareToProcess:v55];

  if (v56) {
    goto LABEL_63;
  }
  if (dword_26B430EA8)
  {
    v57 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int v25 = 0;
LABEL_48:

  return v25;
}

- (int)setupWithOptions:(id)a3 nrfConfig:(id)a4
{
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F2F1E8];
  id v9 = a3;
  int v10 = [v9 objectForKeyedSubscript:v8];
  cameraInfoByPortType = self->_cameraInfoByPortType;
  self->_cameraInfoByPortType = v10;

  int v12 = [v9 objectForKeyedSubscript:*MEMORY[0x263F2F1F8]];

  ibpTuningParameters = self->_ibpTuningParameters;
  self->_ibpTuningParameters = v12;

  if (self->_ibpTuningParameters)
  {
    objc_storeStrong((id *)&self->_nrfConfig, a4);
    id v14 = objc_alloc(MEMORY[0x263F2EE10]);
    int v15 = [(FigMetalContext *)self->_metal device];
    uint64_t v16 = (void *)[v14 initWithDevice:v15 allocatorType:self->_nrfConfig->_allocatorType];
    [(FigMetalContext *)self->_metal setAllocator:v16];

    int v17 = [(FigMetalContext *)self->_metal allocator];

    if (v17)
    {
      int v18 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v18 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v18 = -28601;
  }

  return v18;
}

- (void)dealloc
{
  [(RawNightModeProcessor *)self resetState];
  [(RawNightModeProcessor *)self purgeResources];
  v3.receiver = self;
  v3.super_class = (Class)RawNightModeProcessor;
  [(RawNightModeProcessor *)&v3 dealloc];
}

- (NSString)description
{
  return (NSString *)@"NRF-RawNightModeProcessor";
}

- (void)setOutput:(id)a3
{
  id v14 = a3;
  objc_storeStrong((id *)&self->_output, a3);
  uint64_t v5 = [(FigMetalContext *)self->_metal allocator];
  [v5 purgeResources:0];

  if (!v14)
  {
    outputFrame = self->_outputFrame;
    self->_outputFrame = 0;

    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  objc_storeStrong((id *)&self->_outputFrame, a3);
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface([(NRFRawNightModeOutputFrame *)self->_outputFrame pixelBuffer]);
  id v7 = [(FigMetalContext *)self->_metal device];
  uint64_t v8 = (void *)[v7 newBufferWithIOSurface:IOSurface];

  if (v8)
  {
    id v9 = [(FigMetalContext *)self->_metal allocator];
    int v10 = [v9 addExternalMetalBuffer:v8 atSubAllocatorID:0];

    if (v10)
    {
      FigSignalErrorAt();
LABEL_9:

      goto LABEL_10;
    }
LABEL_8:
    int v12 = [v14 completionStatus];
    uint64_t v13 = [v12 metalExecutionStatus];
    [(FigMetalContext *)self->_metal setExecutionStatus:v13];

    goto LABEL_9;
  }
  FigDebugAssert3();
  FigSignalErrorAt();
LABEL_10:
}

- (int)runInferenceEngineForBatch:(id)a3 last:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v6 || (uint64_t v7 = objc_opt_new()) == 0)
  {
    FigDebugAssert3();
    int v14 = FigSignalErrorAt();
    goto LABEL_19;
  }
  uint64_t v8 = (void *)v7;
  if ([(RawNightModeMultiFrameOutlierPixelCorrectionTuningParams *)self->_multiFrameOPCTuningParams enabled])
  {
    if (self->_sphereOffsetEnabled)
    {
      id v9 = [v6 nonReferenceFrames];
      uint64_t v10 = [v9 count];

      if (v10)
      {
        [(RawNightModeMultiFrameOutlierPixelCorrection *)self->_multiFrameOPC setTuningParams:self->_multiFrameOPCTuningParams];
        multiFrameOPC = self->_multiFrameOPC;
        int v12 = [v6 referenceFrame];
        uint64_t v13 = [v6 nonReferenceFrames];
        int v14 = [(RawNightModeMultiFrameOutlierPixelCorrection *)multiFrameOPC processReferenceFrame:v12 nonRefFrames:v13 correctRefFrame:self->_isFirstBatch != 0];

        if (v14)
        {
LABEL_22:
          FigDebugAssert3();
          goto LABEL_23;
        }
      }
    }
  }
  if ([(RawNightModeProcessor *)self _populateInferenceFusionData:v8 withBatch:v6 first:self->_isFirstBatch last:v4])
  {
    goto LABEL_21;
  }
  if (dword_26B430EA8)
  {
    int v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (-[RawNightModeFusionInference runInferenceWithInferenceData:](self->_inferenceFusion, "runInferenceWithInferenceData:", v8, v27, v28))
  {
LABEL_21:
    FigDebugAssert3();
    int v14 = FigSignalErrorAt();
LABEL_23:

    goto LABEL_19;
  }
  [(FigMetalContext *)self->_metal waitForIdle];
  if (self->_isFirstBatch
    && [(NRFRawNightModeOutputFrame *)self->_outputFrame inferenceInputPixelBuffer])
  {
    uint64_t v16 = [(RawNightModeFusionInferencePyramid *)self->_pyramidAccumulator bandTextures];
    int v17 = [v16 objectAtIndexedSubscript:0];
    int v18 = [(NRFRawNightModeOutputFrame *)self->_outputFrame inferenceTextures];
    BOOL v19 = [v18 objectAtIndexedSubscript:0];
    uint64_t v20 = [(NRFRawNightModeOutputFrame *)self->_outputFrame inferenceTextures];
    float32x4_t v21 = [v20 objectAtIndexedSubscript:1];
    int v14 = [(RawNightModeProcessor *)self computeInferenceInputImage:v17 outputLumaTexture:v19 outputChromaTexture:v21];

    if (!v14)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
      {
        uint64_t v23 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
        int v24 = -[RawNightModeInputFrame metadata]((uint64_t)v23);
        int v25 = (void *)[v24 mutableCopy];

        [(FigMetalContext *)self->_metal waitForSchedule];
        objc_msgSend(WeakRetained, "processor:outputReadyWithFrameType:outputPixelBuffer:outputMetadata:error:", self, 9, -[NRFRawNightModeOutputFrame inferenceInputPixelBuffer](self->_outputFrame, "inferenceInputPixelBuffer"), v25, 0);
      }
      goto LABEL_18;
    }
    goto LABEL_22;
  }
LABEL_18:
  self->_isFirstBatch = 0;

  int v14 = 0;
LABEL_19:

  return v14;
}

- (int)runTripodFusionForBatch:(id)a3 isLast:(unsigned __int8)a4 referenceFrame:(id)a5
{
  int v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (!v8 || [v8 prepareForProcessingIsFirst:self->_isFirstBatch != 0 last:v6 != 0]) {
    goto LABEL_27;
  }
  if ([(RawNightModeMultiFrameOutlierPixelCorrectionTuningParams *)self->_multiFrameOPCTuningParams enabled])
  {
    if (self->_sphereOffsetEnabled)
    {
      uint64_t v10 = [v8 nonReferenceFrames];
      uint64_t v11 = [v10 count];

      if (v11)
      {
        [(RawNightModeMultiFrameOutlierPixelCorrection *)self->_multiFrameOPC setTuningParams:self->_multiFrameOPCTuningParams];
        if (v6
          && !self->_isFirstBatch
          && ([v8 nonReferenceFrames],
              int v12 = objc_claimAutoreleasedReturnValue(),
              uint64_t v13 = [v12 count],
              v12,
              v13 == 1))
        {
          if (!v9) {
            goto LABEL_27;
          }
          int v14 = objc_opt_new();
          [v14 addObject:v9];
          int v15 = [v8 nonReferenceFrames];
          [v14 addObjectsFromArray:v15];

          multiFrameOPC = self->_multiFrameOPC;
          int v17 = v14;
          uint64_t v18 = 0;
        }
        else
        {
          BOOL v19 = self->_multiFrameOPC;
          int v14 = [v8 nonReferenceFrames];
          multiFrameOPC = v19;
          int v17 = v14;
          uint64_t v18 = 1;
        }
        int v20 = [(RawNightModeMultiFrameOutlierPixelCorrection *)multiFrameOPC processFrames:v17 correctFirstFrame:v18];

        if (v20) {
          goto LABEL_28;
        }
      }
    }
  }
  if (!self->_rawNightModeTuningParameters)
  {
    FigDebugAssert3();
    int v20 = -28601;
    goto LABEL_23;
  }
  -[RawNightModeTripodFusion setTuningParameters:](self->_tripodFusion, "setTuningParameters:");
  tripodFusion = self->_tripodFusion;
  noiseMapAccumulatorTexture = self->_noiseMapAccumulatorTexture;
  uint64_t v23 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
  int v24 = -[RawNightModeInputFrame lscGainsTex]((uint64_t)v23);
  int v25 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
  uint64_t v26 = -[RawNightModeInputFrame lensShadingCorrectionGainMapParameters]((uint64_t)v25);
  LODWORD(tripodFusion) = [(RawNightModeTripodFusion *)tripodFusion runTIPWithBatch:v8 noiseMapTexture:noiseMapAccumulatorTexture lscTexture:v24 lscMetadata:v26 cameraInfoByPortType:self->_cameraInfoByPortType];

  if (tripodFusion)
  {
LABEL_27:
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
    goto LABEL_23;
  }
  if (self->_isFirstBatch
    && [(NRFRawNightModeOutputFrame *)self->_outputFrame inferenceInputPixelBuffer])
  {
    uint64_t v27 = [(RawNightModeFusionInferencePyramid *)self->_pyramidAccumulator bandTextures];
    uint64_t v28 = [v27 objectAtIndexedSubscript:0];
    uint64_t v29 = [(NRFRawNightModeOutputFrame *)self->_outputFrame inferenceTextures];
    id v30 = [v29 objectAtIndexedSubscript:0];
    id v31 = [(NRFRawNightModeOutputFrame *)self->_outputFrame inferenceTextures];
    int v32 = [v31 objectAtIndexedSubscript:1];
    int v20 = [(RawNightModeProcessor *)self computeInferenceInputImage:v28 outputLumaTexture:v30 outputChromaTexture:v32];

    if (!v20)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
      {
        uint64_t v34 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
        long long v35 = -[RawNightModeInputFrame metadata]((uint64_t)v34);
        uint64_t v36 = (void *)[v35 mutableCopy];

        [(FigMetalContext *)self->_metal waitForSchedule];
        objc_msgSend(WeakRetained, "processor:outputReadyWithFrameType:outputPixelBuffer:outputMetadata:error:", self, 9, -[NRFRawNightModeOutputFrame inferenceInputPixelBuffer](self->_outputFrame, "inferenceInputPixelBuffer"), v36, 0);
      }
      goto LABEL_22;
    }
LABEL_28:
    FigDebugAssert3();
    goto LABEL_23;
  }
LABEL_22:
  int v20 = 0;
  self->_isFirstBatch = 0;
LABEL_23:

  return v20;
}

- (int)_initRawNightModeFusionInference:(BOOL)a3 isBarrington:(BOOL)a4 requiresDarkCurrentNoiseModel:(BOOL)a5
{
  int v6 = [[RawNightModeFusionInference alloc] initWithMetalContext:self->_metal isQuadra:a3 isBarrington:a4 requiresDarkCurrentNoiseModel:a5];
  inferenceFusion = self->_inferenceFusion;
  self->_inferenceFusion = v6;

  if (self->_inferenceFusion) {
    return 0;
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)_initRawNightModeTripodFusion:(BOOL)a3 requiresDarkCurrentNoiseModel:(BOOL)a4
{
  uint64_t v5 = [[RawNightModeTripodFusion alloc] initWithMetalContext:self->_metal isQuadra:a3 requiresDarkCurrentNoiseModel:a4];
  tripodFusion = self->_tripodFusion;
  self->_tripodFusion = v5;

  if (self->_tripodFusion) {
    return 0;
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)_initRawNightModeDenoiseInference:(BOOL)a3 isBarrington:(BOOL)a4 isArgyleTripodMax:(BOOL)a5
{
  int v6 = [[RawNightModeDenoiseInference alloc] initWithMetalContext:self->_metal isQuadra:a3 isBarrington:a4 isArgyleTripodMax:a5];
  inferenceDenoise = self->_inferenceDenoise;
  self->_inferenceDenoise = v6;

  if (self->_inferenceDenoise) {
    return 0;
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)_populateInferenceFusionData:(id)a3 withBatch:(id)a4 first:(unsigned __int8)a5 last:(unsigned __int8)a6
{
  int v6 = a6;
  int v7 = a5;
  id v10 = a3;
  id v11 = a4;
  int v12 = v11;
  if (v11 && v10)
  {
    int v13 = [v11 populateInferenceInputs:v10 first:v7 != 0 last:v6 != 0];
    if (v13)
    {
      int v32 = v13;
      FigDebugAssert3();
    }
    else if (self->_rawNightModeTuningParameters)
    {
      objc_msgSend(v10, "setRawNightModeTuningParameters:");
      int v14 = [(NSDictionary *)self->_rawNightModeTuningParameters objectForKeyedSubscript:@"NetworkParameters"];
      int v15 = [v14 objectForKeyedSubscript:@"Fusion"];
      uint64_t v16 = [v15 objectForKeyedSubscript:@"TilePadding"];
      int v17 = [v12 referenceFrame];
      uint64_t v18 = -[RawNightModeInputFrame properties]((uint64_t)v17);
      BOOL v19 = [v18 meta];
      LODWORD(v20) = *(_DWORD *)([v19 exposureParams] + 108);
      float32x4_t v21 = +[RawNightModeInferenceCommon getTilePadding:v16 forGain:v20];
      [v10 setTilePadding:v21];

      [v10 setCameraInfoByPortType:self->_cameraInfoByPortType];
      for (uint64_t i = 0; i != 4; ++i)
      {
        uint64_t v23 = [v10 pyramid];
        int v24 = [v23 bandTextures];
        int v25 = [(RawNightModeFusionInferencePyramid *)self->_pyramidAccumulator bandTextures];
        uint64_t v26 = [v25 objectAtIndexedSubscript:i];
        [v24 addObject:v26];
      }
      [v10 setNoiseMapTexture:self->_noiseMapAccumulatorTexture];
      if (self->_runGreenGhostMitigation)
      {
        uint64_t v27 = [(RawNightModeGreenGhost *)self->_greenGhost ggMaxFusionWeights];
        [v10 setGgMaxFusionWeights:v27];
      }
      else
      {
        [v10 setGgMaxFusionWeights:0];
      }
      uint64_t v28 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
      uint64_t v29 = -[RawNightModeInputFrame lscGainsTex]((uint64_t)v28);
      [v10 setLscGainsTexture:v29];

      id v30 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
      id v31 = -[RawNightModeInputFrame lensShadingCorrectionGainMapParameters]((uint64_t)v30);
      [v10 setLscGainMapParameters:v31];

      int v32 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v32 = -28601;
    }
  }
  else
  {
    FigDebugAssert3();
    int v32 = FigSignalErrorAt();
  }

  return v32;
}

- (int)computeInferenceInputImage:(id)a3 outputLumaTexture:(id)a4 outputChromaTexture:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  *(void *)((char *)v107 + 4) = 0;
  LODWORD(v107[0]) = 0;
  uint64_t v11 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
  int v12 = (void *)v11;
  if (!v11)
  {
    FigDebugAssert3();
    int v84 = FigSignalErrorAt();
    goto LABEL_17;
  }
  int v13 = -[RawNightModeInputFrame metadata](v11);
  if (!v13)
  {
    FigDebugAssert3();
    int v84 = -28623;
    goto LABEL_17;
  }
  int v14 = v13;
  char v106 = 0;
  objc_msgSend(v13, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F308], &v106, 0.0);
  if (!v106
    || (float v16 = v15, objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F300], &v106, 0.0),
                   !v106)
    || (float v18 = v17, objc_msgSend(v14, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2C8], &v106, 0.0),
                   !v106))
  {
    FigDebugAssert3();

    int v84 = -28668;
    goto LABEL_17;
  }
  __asm { FMOV            V2.4S, #1.0 }
  *(float *)&_Q2 = v16 / v18;
  *(float *)&v107[1] = v19 / v18;
  v107[0] = _Q2;
  uint64_t v25 = [v14 objectForKeyedSubscript:*MEMORY[0x263F2F530]];
  if (!v25)
  {
    FigDebugAssert3();
    int v84 = FigSignalErrorAt();
LABEL_25:

    goto LABEL_17;
  }
  uint64_t v26 = (void *)v25;
  uint64_t v27 = [v14 objectForKeyedSubscript:*MEMORY[0x263F2F4D8]];
  if (!v27)
  {
    FigDebugAssert3();
    int v84 = FigSignalErrorAt();
LABEL_24:

    goto LABEL_25;
  }
  uint64_t v28 = (void *)v27;
  uint64_t v29 = [v14 objectForKeyedSubscript:*MEMORY[0x263F2F4E8]];
  if (!v29)
  {
    FigDebugAssert3();
    int v84 = FigSignalErrorAt();

    goto LABEL_24;
  }
  double v89 = v14;
  v90 = v12;
  id v94 = v9;
  id v95 = v8;
  id v96 = (id)v29;
  id v88 = v26;
  id v30 = (_WORD *)[v88 bytes];
  uint64_t LTM_ltmCurveEntryCount = getLTM_ltmCurveEntryCount(v30);
  unint64_t LTM_tileWidth = getLTM_tileWidth(v30);
  unsigned int v32 = LTM_tileWidth;
  unint64_t v33 = LTM_tileWidth >> 1;
  unint64_t LTM_tileHeight = getLTM_tileHeight(v30);
  unsigned int v35 = LTM_tileHeight;
  double v93 = self;
  unint64_t v36 = LTM_tileHeight >> 1;
  unint64_t LTM_validWidth = getLTM_validWidth(v30);
  unint64_t LTM_validHeight = getLTM_validHeight(v30);
  LTM_lutsunsigned int BytesPerRow = getLTM_lutsBytesPerRow(v30);
  double v92 = v28;
  uint64_t LTM_lutsBytesPerColumn = getLTM_lutsBytesPerColumn(v30);
  uint64_t v41 = getLTM_topPadding(v30) * LTM_lutsBytesPerRow;
  uint64_t LTM_leftPadding = getLTM_leftPadding(v30);
  uint64_t LTM_data = getLTM_data(v30, v41 + LTM_leftPadding * LTM_lutsBytesPerColumn);
  unint64_t v43 = LTM_validWidth;
  unsigned int v44 = ((2 * [v10 width] - LTM_validWidth * v33) >> 1) + (v32 >> 2);
  double v91 = v10;
  int v45 = [v10 height];
  LOWORD(v46) = v44;
  WORD1(v46) = ((2 * v45 - LTM_validHeight * v36) >> 1) + (v35 >> 2);
  WORD2(v46) = (LTM_validWidth * v33 - v33) >> 1;
  HIWORD(v46) = (LTM_validHeight * v36 - v36) >> 1;
  uint64_t v105 = v46;
  id v47 = v92;
  BOOL v48 = (unsigned __int16 *)[v47 bytes];
  id v97 = v96;
  uint64_t v49 = (unsigned __int16 *)[v97 bytes];
  v50 = [(FigMetalContext *)v93->_metal allocator];
  int v51 = (void *)[v50 newTextureDescriptor];

  if (!v51)
  {
    FigDebugAssert3();

LABEL_31:
    int v84 = -28603;
    id v9 = v94;
    id v8 = v95;
LABEL_35:
    id v10 = v91;
    goto LABEL_16;
  }
  id v52 = [v51 desc];
  [v52 setTextureType:7];

  double v53 = [v51 desc];
  [v53 setPixelFormat:20];

  BOOL v54 = [v51 desc];
  [v54 setCompressionFootprint:0];

  v55 = [v51 desc];
  [v55 setCompressionType:0];

  int v56 = [v51 desc];
  [v56 setWidth:LTM_ltmCurveEntryCount];

  v57 = [v51 desc];
  [v57 setHeight:v43];

  v58 = [v51 desc];
  [v58 setDepth:LTM_validHeight];

  id v59 = [v51 desc];
  [v59 setUsage:1];

  [v51 setLabel:@"RawNightModeLocalToneCurves"];
  v60 = [(FigMetalContext *)v93->_metal device];
  v61 = [v51 desc];
  v62 = (void *)[v60 newTextureWithDescriptor:v61];

  if (!v62)
  {
    FigDebugAssert3();
LABEL_30:

    goto LABEL_31;
  }
  memset(v104, 0, 24);
  v104[3] = LTM_ltmCurveEntryCount;
  v104[4] = v43;
  v104[5] = LTM_validHeight;
  [v62 replaceRegion:v104 mipmapLevel:0 slice:0 withBytes:LTM_data bytesPerRow:2 * LTM_ltmCurveEntryCount bytesPerImage:2 * LTM_ltmCurveEntryCount * v43];
  v63 = [v51 desc];
  [v63 setTextureType:0];

  uint64_t v64 = *v48;
  v65 = [v51 desc];
  [v65 setWidth:v64];

  v66 = [v51 desc];
  [v66 setHeight:1];

  v67 = [v51 desc];
  [v67 setDepth:1];

  [v51 setLabel:@"RawNightModeLumaGlobalToneCurve"];
  uint64_t v68 = [(FigMetalContext *)v93->_metal device];
  v69 = [v51 desc];
  v70 = (void *)[v68 newTextureWithDescriptor:v69];

  if (!v70)
  {
    FigDebugAssert3();

    goto LABEL_30;
  }
  unsigned int v71 = *v48;
  memset(v102, 0, 24);
  v102[3] = v71;
  int64x2_t v103 = vdupq_n_s64(1uLL);
  objc_msgSend(v70, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v102, 0, v48 + 1, objc_msgSend(v47, "length"));
  uint64_t v72 = *v49;
  v73 = [v51 desc];
  [v73 setWidth:v72];

  [v51 setLabel:@"RawNightModeRGBGlobalToneCurve"];
  v74 = [(FigMetalContext *)v93->_metal device];
  id v75 = [v51 desc];
  unsigned int v76 = (void *)[v74 newTextureWithDescriptor:v75];

  if (!v76)
  {
    FigDebugAssert3();

    goto LABEL_30;
  }
  unsigned int v77 = *v49;
  memset(v100, 0, 24);
  v100[3] = v77;
  int64x2_t v101 = vdupq_n_s64(1uLL);
  objc_msgSend(v76, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v100, 0, v49 + 1, objc_msgSend(v97, "length"));
  double v78 = [(FigMetalContext *)v93->_metal commandBuffer];
  id v9 = v94;
  if (!v78)
  {
    FigDebugAssert3();
    int v84 = FigSignalErrorAt();

LABEL_34:
    id v8 = v95;
    goto LABEL_35;
  }
  double v79 = v78;
  double v80 = [v78 computeCommandEncoder];
  if (!v80)
  {
    FigDebugAssert3();

    int v84 = -28603;
    goto LABEL_34;
  }
  double v81 = v80;
  [v80 setComputePipelineState:v93->_downsampleAndToneMapPipelineState];
  [v81 setTexture:v95 atIndex:0];
  [v81 setTexture:v94 atIndex:1];
  [v81 setTexture:v91 atIndex:2];
  [v81 setTexture:v62 atIndex:3];
  [v81 setTexture:v70 atIndex:4];
  [v81 setTexture:v76 atIndex:5];
  [v81 setBytes:v107 length:16 atIndex:0];
  [v81 setBytes:&v105 length:8 atIndex:1];
  unint64_t v82 = [(MTLComputePipelineState *)v93->_downsampleAndToneMapPipelineState threadExecutionWidth];
  unint64_t v83 = [(MTLComputePipelineState *)v93->_downsampleAndToneMapPipelineState maxTotalThreadsPerThreadgroup]/ v82;
  v99[0] = [v91 width];
  v99[1] = [v91 height];
  v99[2] = 1;
  v98[0] = v82;
  v98[1] = v83;
  id v9 = v94;
  v98[2] = 1;
  [v81 dispatchThreads:v99 threadsPerThreadgroup:v98];
  [v81 endEncoding];
  [(FigMetalContext *)v93->_metal commit];

  id v8 = v95;
  id v10 = v91;

  int v84 = 0;
LABEL_16:
  int v12 = v90;
LABEL_17:

  return v84;
}

- (int)computeYUVNoiseMap
{
  objc_super v3 = self->_output;
  v51[0] = 0;
  v51[1] = 0;
  int v52 = 0;
  int v50 = 0;
  memset(v49, 0, sizeof(v49));
  int v48 = 0;
  uint64_t v47 = 0;
  uint64_t v4 = [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrame];
  uint64_t v5 = (void *)v4;
  if (!v4
    || (BOOL v46 = -[RawNightModeInputFrame cfaLayout](v4) == 3,
        int v50 = -[RawNightModeInputFrame firstPix]((uint64_t)v5),
        (unint64_t v43 = self->_noiseMapAccumulatorTexture) == 0))
  {
    FigDebugAssert3();
    int v16 = FigSignalErrorAt();
    goto LABEL_12;
  }
  uint64_t v6 = -[RawNightModeInputFrame lscGainsTex]((uint64_t)v5);
  if (!v6)
  {
    FigDebugAssert3();
    int v16 = FigSignalErrorAt();
LABEL_20:

    goto LABEL_12;
  }
  int v7 = (void *)v6;
  id v8 = -[RawNightModeInputFrame metadata]((uint64_t)v5);

  if (!v8
    || ([(NRFOutput *)v3 metadata], id v9 = objc_claimAutoreleasedReturnValue(), v9, !v9)
    || (-[RawNightModeInputFrame lensShadingCorrectionGainMapParameters]((uint64_t)v5),
        (uint64_t v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    int v16 = FigSignalErrorAt();
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v11 = (void *)v10;
  int v12 = (void *)MEMORY[0x263F2EDA0];
  int v13 = -[RawNightModeInputFrame metadata]((uint64_t)v5);
  int v14 = [(NSDictionary *)self->_rawNightModeTuningParameters objectForKeyedSubscript:@"DarkCurrentNoiseModelFPNR"];
  [v12 calculateNoiseModel:v13 darkCurrentNoiseTuningParams:v14];

  float v15 = -[RawNightModeInputFrame metadata]((uint64_t)v5);
  int v16 = +[RawNightModeProcessor populateLSCWBGParamsFromMetadata:v15 cameraInfoByPortType:self->_cameraInfoByPortType lscGainMapParameters:v11 params:v49];

  if (v16
    || (float v17 = self,
        [(NRFOutput *)v3 metadata],
        float v18 = objc_claimAutoreleasedReturnValue(),
        int v16 = +[RawNightModeProcessor populateWBGParamsFromMetadata:v18 params:&v47], v18, v16))
  {
    FigDebugAssert3();
LABEL_18:

    goto LABEL_19;
  }
  float v19 = [(FigMetalContext *)self->_metal commandBuffer];
  if (!v19)
  {
    FigDebugAssert3();
    int v16 = FigSignalErrorAt();
    goto LABEL_18;
  }
  double v20 = v19;
  float32x4_t v21 = [v19 computeCommandEncoder];
  if (v21)
  {
    id v22 = v21;
    [v21 setComputePipelineState:v17->_computeNoiseMapsPipelineState];
    [v22 setTexture:v43 atIndex:0];
    uint64_t v23 = -[RawNightModeInputFrame textures]((uint64_t)v5);
    [v23 objectAtIndexedSubscript:0];
    uint64_t v25 = v24 = v17;
    [v22 setTexture:v25 atIndex:1];

    [v22 setTexture:v7 atIndex:2];
    uint64_t v26 = [(NRFOutput *)v3 noiseMapTextures];
    uint64_t v27 = [v26 objectAtIndexedSubscript:0];
    [v22 setTexture:v27 atIndex:3];

    uint64_t v28 = [(NRFOutput *)v3 noiseMapTextures];
    uint64_t v29 = [v28 objectAtIndexedSubscript:1];
    [v22 setTexture:v29 atIndex:4];

    [v22 setBytes:&v50 length:4 atIndex:0];
    [v22 setBytes:v51 length:20 atIndex:1];
    [v22 setBytes:&v46 length:1 atIndex:2];
    [v22 setBytes:v49 length:32 atIndex:3];
    [v22 setBytes:&v47 length:16 atIndex:4];
    v42 = v24;
    unint64_t v30 = [(MTLComputePipelineState *)v24->_computeNoiseMapsPipelineState threadExecutionWidth];
    unint64_t v31 = [(MTLComputePipelineState *)v24->_computeNoiseMapsPipelineState maxTotalThreadsPerThreadgroup]/ v30;
    unsigned int v32 = [(NRFOutput *)v3 noiseMapTextures];
    [v32 objectAtIndexedSubscript:1];
    uint64_t v41 = v7;
    v34 = unint64_t v33 = v5;
    uint64_t v35 = [v34 width];
    [(NRFOutput *)v3 noiseMapTextures];
    v36 = uint64_t v39 = v11;
    [v36 objectAtIndexedSubscript:1];
    uint64_t v37 = v40 = v20;
    v45[0] = v35;
    v45[1] = [v37 height];
    v45[2] = 1;
    v44[0] = v30;
    v44[1] = v31;
    v44[2] = 1;
    [v22 dispatchThreads:v45 threadsPerThreadgroup:v44];

    uint64_t v5 = v33;
    [v22 endEncoding];
    [(FigMetalContext *)v42->_metal commit];

    int v16 = 0;
  }
  else
  {
    FigDebugAssert3();

    int v16 = -28603;
  }
LABEL_12:

  return v16;
}

- (int)_correctLumaTex:(id)a3 chromaTex:(id)a4 withRGBBias:(id)a5 sementicMasks:(id)a6 clippingMapTex:(id)a7 localRGBBiasTex:(id)a8 denoisedLumaBand3Tex:(RawNightModeDenoiseAddBackParams *)a9 addbackParams:(RawNightModeBiasCorrectionParams *)a10 biasCorrectionParams:(id)a11 lscParams:(BOOL)a12 isQuadra:
{
  long long v73 = *(_OWORD *)&a11.var0;
  uint64_t v93 = *MEMORY[0x263EF8340];
  BOOL v89 = a12;
  int v90 = v94;
  id v18 = a3;
  id v19 = a4;
  long long v88 = v73;
  id v20 = a5;
  id v21 = a6;
  id v74 = a7;
  id v72 = a8;
  char v87 = v95;
  if (dword_26B430EA8)
  {
    LODWORD(v85) = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    id v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  id v92 = 0;
  id v91 = 0;
  id v85 = 0;
  uint64_t v23 = [(FigMetalContext *)self->_metal commandQueue];
  int v24 = [v23 commandBuffer];

  if (!v24) {
    goto LABEL_24;
  }
  BOOL enableLocalBiasCorrectionGuidedFilter = a10->enableLocalBiasCorrectionGuidedFilter;
  id v69 = v21;
  v70 = v19;
  uint64_t v68 = v20;
  if (v74)
  {
    id v25 = objc_alloc(MEMORY[0x263F2ED90]);
    metalCommandQueue = self->_metalCommandQueue;
    uint64_t v27 = [(FigMetalContext *)self->_metal allocator];
    uint64_t v28 = [v25 initWithOptionalCommandQueue:metalCommandQueue allocator:v27];

    v67 = (void *)v28;
    if (v28)
    {
      id v66 = v18;
      uint64_t v29 = [(FigMetalContext *)self->_metal allocator];
      unint64_t v30 = (void *)[v29 newTextureDescriptor];

      unint64_t v31 = [v30 desc];
      [v31 setPixelFormat:115];

      unsigned int v32 = [v30 desc];
      [v32 setCompressionMode:2];

      unint64_t v33 = [v30 desc];
      [v33 setCompressionFootprint:0];

      unint64_t v34 = (unint64_t)[v74 width] >> 1;
      uint64_t v35 = [v30 desc];
      [v35 setWidth:v34];

      unint64_t v36 = (unint64_t)[v74 height] >> 1;
      uint64_t v37 = [v30 desc];
      [v37 setHeight:v36];

      [v30 setLabel:0];
      uint64_t v38 = [(FigMetalContext *)self->_metal allocator];
      uint64_t v39 = (void *)[v38 newTextureWithDescriptor:v30];
      id v92 = v39;

      if (!v39) {
        goto LABEL_25;
      }
      uint64_t v40 = [v72 pixelFormat];
      uint64_t v41 = [v30 desc];
      [v41 setPixelFormat:v40];

      [v30 setLabel:0];
      v42 = [(FigMetalContext *)self->_metal allocator];
      unint64_t v43 = (void *)[v42 newTextureWithDescriptor:v30];
      id v91 = v43;

      if (!v43)
      {
LABEL_25:
        FigDebugAssert3();
        int v52 = FigSignalErrorAt();
        goto LABEL_28;
      }
      unsigned int v44 = [v24 computeCommandEncoder];
      if (!v44)
      {
        FigDebugAssert3();
        int v52 = -28603;
        goto LABEL_28;
      }
      int v45 = v44;
      BOOL v46 = v24;
      [v44 setComputePipelineState:self->_biasDownsamplePipelineState];
      [v45 setImageblockWidth:16 height:16];
      [v45 setTexture:v74 atIndex:0];
      [v45 setTexture:v39 atIndex:1];
      v84[0] = [v39 width];
      v84[1] = [v39 height];
      v84[2] = 1;
      int64x2_t v65 = vdupq_n_s64(0x10uLL);
      int64x2_t v82 = v65;
      uint64_t v83 = 1;
      [v45 dispatchThreads:v84 threadsPerThreadgroup:&v82];
      [v45 setTexture:v72 atIndex:0];
      [v45 setTexture:v43 atIndex:1];
      v81[0] = [v43 width];
      v81[1] = [v43 height];
      v81[2] = 1;
      int64x2_t v79 = v65;
      uint64_t v80 = 1;
      [v45 dispatchThreads:v81 threadsPerThreadgroup:&v79];
      [v45 endEncoding];
      if (enableLocalBiasCorrectionGuidedFilter)
      {
        uint64_t v47 = [v30 desc];
        [v47 setPixelFormat:115];

        [v30 setLabel:0];
        int v48 = [(FigMetalContext *)self->_metal allocator];
        uint64_t v49 = (void *)[v48 newTextureWithDescriptor:v30];
        id v85 = v49;

        if (!v49)
        {
          FigDebugAssert3();
          int v52 = FigSignalErrorAt();

          id v21 = v69;
          id v19 = v70;
          int v24 = v46;
          id v20 = v68;
          goto LABEL_28;
        }
        *(float *)&double v50 = a10->guidedFilterIntensitySigma;
        int v51 = v67;
        int v24 = v46;
        if ([v67 encodeToCommandBuffer:v46 inputTexture:v39 guideTexture:v43 outputTexture:v49 kernelRadius:a10->guidedFilterSpatialSigma epsilon:v50])
        {
          FigDebugAssert3();

          int v52 = -28695;
          id v21 = v69;
          id v19 = v70;
          id v20 = v68;
LABEL_28:

          id v18 = v66;
          goto LABEL_21;
        }
      }
      else
      {
        uint64_t v49 = 0;
        int v51 = v67;
      }

      id v18 = v66;
      goto LABEL_16;
    }
LABEL_24:
    FigDebugAssert3();
    int v52 = FigSignalErrorAt();
    goto LABEL_21;
  }
  uint64_t v39 = 0;
  uint64_t v49 = 0;
LABEL_16:
  double v53 = [v24 computeCommandEncoder];
  if (v53)
  {
    BOOL v54 = v53;
    [v53 setComputePipelineState:self->_correctDnrBiasPipelineState];
    [v54 setTexture:v18 atIndex:0];
    id v55 = v18;
    id v19 = v70;
    [v54 setTexture:v70 atIndex:1];
    id v20 = v68;
    [v68 skyMaskTexture];
    v57 = int v56 = v24;
    [v54 setTexture:v57 atIndex:2];

    v58 = [v68 personMaskTexture];
    [v54 setTexture:v58 atIndex:3];

    id v59 = [v68 skinMaskTexture];
    [v54 setTexture:v59 atIndex:4];

    v60 = [v68 hairMaskTexture];
    [v54 setTexture:v60 atIndex:5];

    [v54 setTexture:v69 atIndex:6];
    if (enableLocalBiasCorrectionGuidedFilter) {
      v61 = v49;
    }
    else {
      v61 = v39;
    }
    id v21 = v69;
    int v24 = v56;
    [v54 setTexture:v61 atIndex:7];
    [v54 setBytes:&v88 length:16 atIndex:0];
    [v54 setBytes:a9 length:20 atIndex:1];
    [v54 setBytes:&a10->dnrBiasCorrectionStrength length:4 atIndex:2];
    BOOL v78 = [(RawNightModePostNetworkTuningParams *)self->_postNetworkTuningParams enableLSCAddbackModulation];
    [v54 setBytes:&v78 length:1 atIndex:3];
    [v54 setBytes:&v89 length:12 atIndex:4];
    [v54 setBytes:&v87 length:1 atIndex:5];
    [v54 setImageblockWidth:16 height:16];
    v77[0] = [v70 width];
    v77[1] = [v70 height];
    v77[2] = 1;
    int64x2_t v75 = vdupq_n_s64(8uLL);
    uint64_t v76 = 1;
    id v18 = v55;
    [v54 dispatchThreads:v77 threadsPerThreadgroup:&v75];
    [v54 endEncoding];
    [v24 commit];

    int v52 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v52 = -28603;
    id v21 = v69;
    id v19 = v70;
    id v20 = v68;
  }
LABEL_21:
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  return v52;
}

- (int)computeTuningPlist:(id)a3 fromInputPlist:(id)a4 quadraBinningFactor:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = [(NRFProgressiveBracketingParameters *)self->_progressiveBracketingParameters mode];
  if (v8)
  {
    if (v10 == 1)
    {
      uint64_t v11 = [(NRFProgressiveBracketingParameters *)self->_progressiveBracketingParameters statistics];
      int v12 = [v11 stationary];

      if (v12) {
        int v13 = @"MaxTripod";
      }
      else {
        int v13 = @"Max";
      }
    }
    else
    {
      int v13 = @"Common";
    }
    int v14 = [v9 objectForKeyedSubscript:@"Common"];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"PostDemosaic"];
    int v16 = (void *)v15;
    uint64_t v17 = MEMORY[0x263EFFA78];
    if (v15) {
      uint64_t v18 = v15;
    }
    else {
      uint64_t v18 = MEMORY[0x263EFFA78];
    }
    [v8 setObject:v18 forKeyedSubscript:@"PostDemosaic"];

    id v19 = [v9 objectForKeyedSubscript:@"Common"];
    uint64_t v20 = [v19 objectForKeyedSubscript:@"DarkCurrentNoiseModelFPNR"];
    id v21 = (void *)v20;
    if (v20) {
      uint64_t v22 = v20;
    }
    else {
      uint64_t v22 = v17;
    }
    [v8 setObject:v22 forKeyedSubscript:@"DarkCurrentNoiseModelFPNR"];

    uint64_t v23 = [v9 objectForKeyedSubscript:@"Common"];
    uint64_t v24 = [v23 objectForKeyedSubscript:@"NetworkParameters"];
    id v25 = (void *)v24;
    if (v24) {
      uint64_t v26 = v24;
    }
    else {
      uint64_t v26 = v17;
    }
    [v8 setObject:v26 forKeyedSubscript:@"NetworkParameters"];

    uint64_t v27 = [v9 objectForKeyedSubscript:@"Common"];
    uint64_t v28 = [v27 objectForKeyedSubscript:@"Registration"];
    uint64_t v29 = (void *)v28;
    if (v28) {
      uint64_t v30 = v28;
    }
    else {
      uint64_t v30 = v17;
    }
    [v8 setObject:v30 forKeyedSubscript:@"Registration"];

    unint64_t v31 = [v9 objectForKeyedSubscript:@"Common"];
    uint64_t v32 = [v31 objectForKeyedSubscript:@"ReferenceFrameSelection"];
    unint64_t v33 = (void *)v32;
    if (v32) {
      uint64_t v34 = v32;
    }
    else {
      uint64_t v34 = v17;
    }
    [v8 setObject:v34 forKeyedSubscript:@"ReferenceFrameSelection"];

    uint64_t v35 = [v9 objectForKeyedSubscript:@"Common"];
    uint64_t v36 = [v35 objectForKeyedSubscript:@"LowLightGreenGhost"];
    uint64_t v37 = (void *)v36;
    if (v36) {
      uint64_t v38 = v36;
    }
    else {
      uint64_t v38 = v17;
    }
    [v8 setObject:v38 forKeyedSubscript:@"LowLightGreenGhost"];

    if (a5 == 1) {
      uint64_t v39 = @"Quadra";
    }
    else {
      uint64_t v39 = @"Bayer";
    }
    uint64_t v40 = [v9 objectForKeyedSubscript:v39];
    if (v40)
    {
      uint64_t v41 = v40;
      v42 = [v40 objectForKeyedSubscript:@"Common"];
      if (v42) {
        [(RawNightModeProcessor *)self overlayRawNightModePlist:v42 ontoDictionary:v8];
      }
      unint64_t v43 = [v41 objectForKeyedSubscript:v13];
      if (v43) {
        [(RawNightModeProcessor *)self overlayRawNightModePlist:v43 ontoDictionary:v8];
      }
    }
  }
  else
  {
    FigDebugAssert3();
  }

  return 0;
}

- (void)overlayRawNightModePlist:(id)a3 ontoDictionary:(id)a4
{
  id v24 = a3;
  id v5 = a4;
  uint64_t v6 = [v24 objectForKeyedSubscript:@"PostDemosaic"];
  if (v6)
  {
    int v7 = [v5 objectForKeyedSubscript:@"PostDemosaic"];
    id v8 = objc_msgSend(v6, "cmi_dictionaryMergedWithDefaultDict:", v7);
    [v5 setObject:v8 forKeyedSubscript:@"PostDemosaic"];
  }
  id v9 = [v24 objectForKeyedSubscript:@"DarkCurrentNoiseModelFPNR"];
  if (v9)
  {
    int v10 = [v5 objectForKeyedSubscript:@"DarkCurrentNoiseModelFPNR"];
    uint64_t v11 = objc_msgSend(v9, "cmi_dictionaryMergedWithDefaultDict:", v10);
    [v5 setObject:v11 forKeyedSubscript:@"DarkCurrentNoiseModelFPNR"];
  }
  int v12 = [v24 objectForKeyedSubscript:@"NetworkParameters"];
  if (v12)
  {
    int v13 = [v5 objectForKeyedSubscript:@"NetworkParameters"];
    int v14 = objc_msgSend(v12, "cmi_dictionaryMergedWithDefaultDict:", v13);
    [v5 setObject:v14 forKeyedSubscript:@"NetworkParameters"];
  }
  uint64_t v15 = [v24 objectForKeyedSubscript:@"Registration"];
  if (v15)
  {
    int v16 = [v5 objectForKeyedSubscript:@"Registration"];
    uint64_t v17 = objc_msgSend(v15, "cmi_dictionaryMergedWithDefaultDict:", v16);
    [v5 setObject:v17 forKeyedSubscript:@"Registration"];
  }
  uint64_t v18 = [v24 objectForKeyedSubscript:@"ReferenceFrameSelection"];
  if (v18)
  {
    id v19 = [v5 objectForKeyedSubscript:@"ReferenceFrameSelection"];
    uint64_t v20 = objc_msgSend(v18, "cmi_dictionaryMergedWithDefaultDict:", v19);
    [v5 setObject:v20 forKeyedSubscript:@"ReferenceFrameSelection"];
  }
  id v21 = [v24 objectForKeyedSubscript:@"LowLightGreenGhost"];
  if (v21)
  {
    uint64_t v22 = [v5 objectForKeyedSubscript:@"LowLightGreenGhost"];
    uint64_t v23 = objc_msgSend(v21, "cmi_dictionaryMergedWithDefaultDict:", v22);
    [v5 setObject:v23 forKeyedSubscript:@"LowLightGreenGhost"];
  }
}

- (void)_prepareOutputMetadata
{
  objc_super v3 = [NSNumber numberWithInt:self->_cntBracketSampleBuffers];
  uint64_t v4 = [(NRFRawNightModeOutputFrame *)self->_outputFrame metadata];
  [v4 setObject:v3 forKeyedSubscript:*MEMORY[0x263F2F118]];

  id v6 = [NSNumber numberWithInt:self->_cntProcessedNonRefFrames];
  id v5 = [(NRFRawNightModeOutputFrame *)self->_outputFrame metadata];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F2F120]];
}

- (int)referenceFrameIndex
{
  return [(RawNMReferenceFrameSelector *)self->_referenceFrameSelector referenceFrameIndex];
}

- (void)setReferenceFrameIndex:(int)a3
{
}

- (BOOL)_isArgyleTripodMax:(id)a3 processingMode:(int)a4
{
  id v5 = [a3 sensorID];
  char v6 = [&unk_270E97BB8 containsObject:v5];
  if (a4 == 3) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_requiresDarkCurrentNoiseModel:(id)a3 processingMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  BOOL v7 = [v6 sensorID];
  if (([v7 isEqualToString:@"0x0904"] & 1) == 0
    && [(RawNightModeProcessor *)self _isArgyleTripodMax:v6 processingMode:v4])
  {
    [v6 isQuadra];
  }

  BOOL v8 = FigGetCFPreferenceBooleanWithDefault() != 0;
  return v8;
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

- (int)cntBracketSampleBuffers
{
  return self->_cntBracketSampleBuffers;
}

- (BOOL)doRedFaceFix
{
  return self->_doRedFaceFix;
}

- (void)setDoRedFaceFix:(BOOL)a3
{
  self->_doRedFaceFix = a3;
}

- (BOOL)enableGreenGhostMitigation
{
  return self->_enableGreenGhostMitigation;
}

- (void)setEnableGreenGhostMitigation:(BOOL)a3
{
  self->_enableGreenGhostMitigation = a3;
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
  self->_referenceFrameHasEVMinus = a3;
}

- (int)referenceFrameCandidatesCount
{
  return self->_referenceFrameCandidatesCount;
}

- (void)setReferenceFrameCandidatesCount:(int)a3
{
  self->_uint64_t referenceFrameCandidatesCount = a3;
}

- (int)maximumNumberOfReferenceFrameCandidatesToHoldForProcessing
{
  return self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing;
}

- (void)setMaximumNumberOfReferenceFrameCandidatesToHoldForProcessing:(int)a3
{
  self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing = a3;
}

- (BOOL)srlEnabled
{
  return self->_srlEnabled;
}

- (void)setSrlEnabled:(BOOL)a3
{
  self->_srlEnabled = a3;
}

- (BOOL)skipDenoising
{
  return self->_skipDenoising;
}

- (void)setSkipDenoising:(BOOL)a3
{
  self->_skipDenoising = a3;
}

- (NRFProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NRFProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int)batchCount
{
  return self->_batchCount;
}

- (NRFProgressiveBracketingParameters)progressiveBracketingParameters
{
  return self->_progressiveBracketingParameters;
}

- (void)setProgressiveBracketingParameters:(id)a3
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

- (__IOSurface)regwarpInputSurface
{
  return self->_regwarpInputSurface;
}

- (void)setRegwarpInputSurface:(__IOSurface *)a3
{
  self->_regwarpInputSurface = a3;
}

- (FigWiredMemory)sharedRegWarpBuffer
{
  return self->_sharedRegWarpBuffer;
}

- (void)setSharedRegWarpBuffer:(id)a3
{
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

- (FigMetalAllocatorBackend)allocatorBackend
{
  return self->_allocatorBackend;
}

- (void)setAllocatorBackend:(id)a3
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
  objc_storeStrong((id *)&self->_allocatorBackend, 0);
  objc_storeStrong((id *)&self->_tuningParamsPlist, 0);
  objc_storeStrong((id *)&self->_tuningParams, 0);
  objc_storeStrong((id *)&self->_sharedRegWarpBuffer, 0);
  objc_storeStrong((id *)&self->_semanticStyleProperties, 0);
  objc_storeStrong((id *)&self->_defringingTuningByPortType, 0);
  objc_storeStrong((id *)&self->_progressiveBracketingParameters, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_postNetworkTuningParams, 0);
  objc_storeStrong((id *)&self->_sidecarMetadata, 0);
  objc_storeStrong((id *)&self->_moduleConfig, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_correctDnrBiasPipelineState, 0);
  objc_storeStrong((id *)&self->_biasDownsamplePipelineState, 0);
  objc_storeStrong((id *)&self->_downsampleAndToneMapPipelineState, 0);
  objc_storeStrong((id *)&self->_computeNoiseMapsPipelineState, 0);
  objc_storeStrong((id *)&self->_rawNightModeTuningParameters, 0);
  objc_storeStrong((id *)&self->_ibpTuningParameters, 0);
  objc_storeStrong((id *)&self->_noiseMapAccumulatorTexture, 0);
  objc_storeStrong((id *)&self->_regwarpTuningParams, 0);
  objc_storeStrong((id *)&self->_constrainedRegistrationTuningParams, 0);
  objc_storeStrong((id *)&self->_softLTMStage, 0);
  objc_storeStrong((id *)&self->_awbProcessor, 0);
  objc_storeStrong((id *)&self->_postDemosaicTuningParams, 0);
  objc_storeStrong((id *)&self->_chromaSuppression, 0);
  objc_storeStrong((id *)&self->_multiFrameOPCTuningParams, 0);
  objc_storeStrong((id *)&self->_multiFrameOPC, 0);
  objc_storeStrong((id *)&self->_tripodFusion, 0);
  objc_storeStrong((id *)&self->_inferenceDenoise, 0);
  objc_storeStrong((id *)&self->_inferenceFusion, 0);
  objc_storeStrong((id *)&self->_semanticMasks, 0);
  objc_storeStrong((id *)&self->_currentBatch, 0);
  objc_storeStrong((id *)&self->_pyramidAccumulator, 0);
  objc_storeStrong((id *)&self->_outputFrame, 0);
  objc_storeStrong((id *)&self->_registrationStage, 0);
  objc_storeStrong((id *)&self->_currentConfig, 0);
  objc_storeStrong((id *)&self->_nrfConfig, 0);
  objc_storeStrong((id *)&self->_greenGhost, 0);
  objc_storeStrong((id *)&self->_demWarp, 0);
  objc_storeStrong((id *)&self->_framesAwaitingFusion, 0);
  objc_storeStrong((id *)&self->_referenceFrameSelector, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end