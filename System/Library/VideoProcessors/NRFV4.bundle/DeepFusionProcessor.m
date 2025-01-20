@interface DeepFusionProcessor
+ (BOOL)getAggressiveMemoryOptimizationWithOutputWidth:(unint64_t)a3 withOutputHeight:(unint64_t)a4 withCompressionLevel:(int)a5;
+ (void)resetInferenceResultsBindings:(InferenceResultsBindings *)a3;
- ($0B57B161DD08FFA902CA30037FAFD2DD)getRefGDCParams;
- (BOOL)getKeepReferenceEV0RGBWithOutputWidth:(unint64_t)a3 withOutputHeight:(unint64_t)a4;
- (BOOL)supportsExternalMemoryResource;
- (CMIExternalMemoryResource)externalMemoryResource;
- (DeepFusionProcessor)init;
- (DeepFusionProcessor)initWithContext:(id)a3;
- (IBPDeepFusionOutput)output;
- (IBPDeepFusionProcessorDelegate)delegate;
- (IBPSemanticStyleProperties)semanticStyleProperties;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (NSString)description;
- (float)getExposureBiasFactor:(id)a3 inputIsLinear:(BOOL)a4;
- (id)_frameDescription:(id)a3;
- (id)_getAttachedSyntheticReferenceMetadata;
- (id)createDraftDemosaicTextureForFrame:(id)a3 outputROI:(CGRect *)a4;
- (id)externalMemoryDescriptorForConfiguration:(id)a3;
- (id)getTuningModeForCurrentProcessingMode;
- (int)_allocateAndUnpackSyntheticReferenceFrame:(id)a3;
- (int)_allocateRegWarpPPWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5;
- (int)_commonInitWithContext:(id)a3;
- (int)_correctInputROI:(CGRect *)a3 withOutputSize:;
- (int)_demosaicAndProcessFrame:(id)a3 toTexture:(id)a4 withWarpFrame:(BOOL)a5;
- (int)_demosaicAndProcessFrame:(id)a3 withWarpFrame:(BOOL)a4;
- (int)_ensureSyntheticReferenceIsUnpacked:(id)a3;
- (int)_finalizeQuadraSfdStep1:(id)a3;
- (int)_finalizeQuadraSfdStep2WithInput:(id)a3;
- (int)_getGyroMotionScoreFromMetadata:(id)a3 gyroScore:(float *)a4;
- (int)_initiateQuadraEVZeroBackgroundProcessing;
- (int)_parseSyntheticReferenceMetadata:(id)a3;
- (int)_preprocessSyntheticReferenceFrame;
- (int)_processInferenceImage:(__CVBuffer *)a3 inferenceFrameType:(int)a4 sourceFrameLumaChromaImage:(id)a5 sourceFrameProperties:(id)a6 ltcFrameProperties:(id)a7 gtcFrameProperties:(id)a8 originalWidth:(unint64_t)a9 originalHeight:(unint64_t)a10;
- (int)_processInputFrame:(id)a3;
- (int)_processSyntheticReferenceMetadataFromReferenceEV0;
- (int)_registerImages:(BOOL)a3;
- (int)_setupPostConfig:(id)a3 isForEnhancedRes:(BOOL)a4;
- (int)addBuffer:(__CVBuffer *)a3 metadata:(id)a4 type:(int)a5;
- (int)addBuffer:(__CVBuffer *)a3 metadata:(id)a4 type:(int)a5 lscGainMap:(__CVBuffer *)a6 lscGainMapParameters:(id)a7;
- (int)addInferenceResults:(id)a3 inferenceInputType:(int)a4;
- (int)addInputFrameAsExternalAllocator:(id)a3 withSubAllocatorId:(int)a4;
- (int)addInputResource:(id)a3 type:(int)a4;
- (int)applyOverrides;
- (int)applySemanticStylesWithOutputBuffer:(__CVBuffer *)a3 inputBuffer:(__CVBuffer *)a4 inputMetadata:(id)a5;
- (int)bindInferenceResults:(id)a3 toBindings:(InferenceResultsBindings *)a4;
- (int)brightnessMatchIntoOutputQuadra:(id)a3 inputQuadra:(id)a4;
- (int)computeAMBNRDenoiseBoostMap:(id)a3 syntheticLongOutput:(id)a4 ev0ExposureParams:(exposureParameters *)a5 longExposureParams:(exposureParameters *)a6 dfNoiseTuningPlist:(id)a7;
- (int)finalizeFrameStateForProcess;
- (int)finalizeOutput:(id)a3 syntheticLongOutput:(id)a4 output:(id)a5;
- (int)finishProcessing;
- (int)generateSyntheticLongToOutput:(id)a3;
- (int)generateSyntheticReference:(id)a3;
- (int)generateSyntheticReferenceWithSIFR:(id)a3;
- (int)getRawDFFrameTypeForInputFrame:(id)a3;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prepareToProcess:(unsigned int)a3 prepareDescriptor:(id)a4;
- (int)prepareTuning:(id)a3;
- (int)prewarm;
- (int)prewarmWithTuningParameters:(id)a3;
- (int)process;
- (int)processFrameForRegistration:(id)a3 isReference:(BOOL)a4;
- (int)processingMode;
- (int)purgeResources;
- (int)resetState;
- (int)runNetworkFusionWithInputSyntheticLong:(id)a3 inputSytheticReference:(id)a4 output:(id)a5;
- (int)setup;
- (int)setupWithOptions:(id)a3;
- (int)warpSyntheticLongIfNecessary:(id)a3 toSyntheticReference:(id)a4;
- (unint64_t)getBackgroundMetalHeapSizeWithOutputWidth:(unint64_t)a3 withOutputHeight:(unint64_t)a4;
- (unint64_t)getMetalHeapSizeWithOutputWidth:(unint64_t)a3 withOutputHeight:(unint64_t)a4 withCompressionLevel:(int)a5 cmiResourceEnabled:(BOOL)a6 withAggressiveMemoryOptimizations:(BOOL)a7;
- (void)addToSidecar:(id)a3 forKey:(id)a4;
- (void)clearDraftDemosaicCache;
- (void)dealloc;
- (void)reportFusionReferenceFrame:(int)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExternalMemoryResource:(id)a3;
- (void)setFusionMode:(int)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setOutput:(id)a3;
- (void)setProcessingMode:(int)a3;
- (void)setSemanticStyleProperties:(id)a3;
- (void)setTuningParameters:(id)a3;
@end

@implementation DeepFusionProcessor

- (int)_commonInitWithContext:(id)a3
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v5 = a3;
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  objc_storeStrong((id *)&self->_metal, a3);
  if (!self->_metal)
  {
    FigDebugAssert3();
    int v95 = FigSignalErrorAt();
    goto LABEL_42;
  }
  v6 = (NRFFrameMetadata *)objc_opt_new();
  sifrMetadata = self->_sifrMetadata;
  self->_sifrMetadata = v6;

  v8 = (NSDictionary *)objc_opt_new();
  nrfInfoDict = self->_nrfInfoDict;
  self->_nrfInfoDict = v8;

  v10 = [(FigMetalContext *)self->_metal device];
  v11 = (void *)[v10 newCommandQueue];

  v12 = (FigMetalContext *)[objc_alloc(MEMORY[0x263F2EE30]) initWithFigMetalContext:self->_metal andOptionalCommandQueue:v11];
  backgroundMetal = self->_backgroundMetal;
  self->_backgroundMetal = v12;

  v14 = self->_backgroundMetal;
  if (!v14) {
    goto LABEL_73;
  }
  [(FigMetalContext *)v14 setAllocator:0];
  self->_networkVersion = +[DeepFusionCommon networkVersion];
  self->_keepReferenceEv0RGB = 0;
  +[DeepFusionProcessor resetInferenceResultsBindings:&self->_inferenceResultsBindings.skyMask];
  +[DeepFusionProcessor resetInferenceResultsBindings:&self->_sfdInferenceResultsBindings.skyMask];
  self->_calculateLTM = 1;
  LOBYTE(self->_quadraMotionScore) = 0;
  self->_fusionMode = 0;
  self->_allocatorForceSize = 0;
  self->_backgroundAllocatorForceSize = 0;
  *(_WORD *)&self->_allocatorWireMemory = 0;
  *(void *)&self->_compressionLevel = 0x200000002;
  if (!BYTE1(self->_quadraMotionScore))
  {
    v15 = [(FigMetalContext *)self->_metal allocator];

    if (v15) {
      goto LABEL_72;
    }
    id v16 = objc_alloc(MEMORY[0x263F2EE10]);
    v17 = [(FigMetalContext *)self->_metal device];
    v18 = (void *)[v16 initWithDevice:v17 allocatorType:self->_allocatorType];
    [(FigMetalContext *)self->_metal setAllocator:v18];

    v19 = [(FigMetalContext *)self->_metal allocator];

    if (!v19) {
      goto LABEL_71;
    }
    v20 = [(FigMetalContext *)self->_backgroundMetal allocator];

    if (v20) {
      goto LABEL_72;
    }
    id v21 = objc_alloc(MEMORY[0x263F2EE10]);
    v22 = [(FigMetalContext *)self->_backgroundMetal device];
    v23 = (void *)[v21 initWithDevice:v22 allocatorType:self->_allocatorType];
    [(FigMetalContext *)self->_backgroundMetal setAllocator:v23];

    v24 = [(FigMetalContext *)self->_backgroundMetal allocator];

    if (!v24) {
      goto LABEL_71;
    }
  }
  self->_allocatorSetupComplete = 0;
  v25 = [[DeepFusionProcessorShaders alloc] initWithMetal:self->_metal];
  semanticStylesStage = self->_semanticStylesStage;
  self->_semanticStylesStage = (SemanticStylesStage *)v25;

  if (!self->_semanticStylesStage)
  {
LABEL_73:
    v97 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT);
    goto LABEL_74;
  }
  v27 = [[SemanticStylesStage alloc] initWithMetalContext:self->_metal];
  v28 = *(void **)&self->_enableSTF;
  *(void *)&self->_enableSTF = v27;

  if (!*(void *)&self->_enableSTF) {
    goto LABEL_71;
  }
  v29 = [[TextureUtils alloc] initWithMetalContext:self->_metal];
  regDense = self->_regDense;
  self->_regDense = (RegDense *)v29;

  if (!self->_regDense
    || (v31 = [[RegDense alloc] initWithMetalContext:self->_metal bicubicWarping:1 useMirroredRepeat:1], rawDFNetworkStage = self->_rawDFNetworkStage, self->_rawDFNetworkStage = (RawDFNetworkStage *)v31, rawDFNetworkStage, !self->_rawDFNetworkStage))
  {
LABEL_71:
    FigDebugAssert3();
LABEL_72:
    int v95 = FigSignalErrorAt();
LABEL_76:

    goto LABEL_42;
  }
  v33 = [[RawDFCommon alloc] initWithMetalContext:self->_metal];
  demosaicStage = self->_demosaicStage;
  self->_demosaicStage = (CMIDemosaicStage *)v33;

  if (!self->_demosaicStage) {
    goto LABEL_73;
  }
  v35 = [[RawDFDeferredFrames alloc] initWithMetalContext:self->_metal];
  inputFrames = self->_inputFrames;
  self->_inputFrames = v35;

  if (!self->_inputFrames) {
    goto LABEL_73;
  }
  v37 = [[CMIPost alloc] initWithMetalContext:self->_metal];
  rawDFCommon = self->_rawDFCommon;
  self->_rawDFCommon = (RawDFCommon *)v37;

  if (!self->_rawDFCommon) {
    goto LABEL_73;
  }
  self->_originalWidth = 0x200000002;
  v39 = [[ColorConvertStage alloc] initWithMetalContext:v5];
  motionDetection = self->_motionDetection;
  self->_motionDetection = (MotionDetection *)v39;

  if (!self->_motionDetection) {
    goto LABEL_73;
  }
  v41 = [[CMIDraftDemosaicStage alloc] initWithMetalContext:self->_metal];
  regwarpGPU = self->_regwarpGPU;
  self->_regwarpGPU = (FigRegWarpPPGPU *)v41;

  if (!self->_regwarpGPU) {
    goto LABEL_73;
  }
  v43 = [[CMIDemosaicStage alloc] initWithMetalContext:self->_metal demosaicerType:0];
  draftDemosaicStage = self->_draftDemosaicStage;
  self->_draftDemosaicStage = (CMIDraftDemosaicStage *)v43;

  if (!self->_draftDemosaicStage) {
    goto LABEL_73;
  }
  v45 = [[RawDFPowerBlurStage alloc] initWithMetalContext:self->_metal];
  rawDFLumaSharpenStage = self->_rawDFLumaSharpenStage;
  self->_rawDFLumaSharpenStage = (RawDFLumaSharpenStage *)v45;

  if (!self->_rawDFLumaSharpenStage) {
    goto LABEL_73;
  }
  v47 = [[RawDFLumaSharpenStage alloc] initWithMetalContext:self->_metal];
  rawDFZoomStage = self->_rawDFZoomStage;
  self->_rawDFZoomStage = (RawDFZoomStage *)v47;

  if (!self->_rawDFZoomStage) {
    goto LABEL_73;
  }
  v49 = [[RawDFZoomStage alloc] initWithMetalContext:self->_metal];
  rawDFSyntheticLongStage = self->_rawDFSyntheticLongStage;
  self->_rawDFSyntheticLongStage = (RawDFSyntheticLongStage *)v49;

  if (!self->_rawDFSyntheticLongStage) {
    goto LABEL_73;
  }
  v51 = [[RawDFSyntheticLongStage alloc] initWithMetalContext:self->_metal];
  warpStage = self->_warpStage;
  self->_warpStage = (CMIWarpStage *)v51;

  if (!self->_warpStage) {
    goto LABEL_73;
  }
  v53 = [[RawDFInferenceGen alloc] initWithMetalContext:self->_metal];
  gainMapStage = self->_gainMapStage;
  self->_gainMapStage = (GainMapStage *)v53;

  if (!self->_gainMapStage) {
    goto LABEL_73;
  }
  v55 = [[MotionDetection alloc] initWithMetalContext:self->_metal];
  grayGhostDetection = self->_grayGhostDetection;
  self->_grayGhostDetection = (GrayGhostDetection *)v55;

  if (!self->_grayGhostDetection) {
    goto LABEL_73;
  }
  v57 = [[GrayGhostDetection alloc] initWithMetalContext:self->_metal];
  flickerDetection = self->_flickerDetection;
  self->_flickerDetection = (RawDFFlickerDetectorStage *)v57;

  if (!self->_flickerDetection) {
    goto LABEL_73;
  }
  v59 = [[RawDFFlickerDetectorStage alloc] initWithMetalContext:self->_metal];
  rawDFDownsampleStage = self->_rawDFDownsampleStage;
  self->_rawDFDownsampleStage = (RawDFDownsampleStage *)v59;

  if (!self->_rawDFDownsampleStage) {
    goto LABEL_73;
  }
  v61 = [[RawDFDownsampleStage alloc] initWithMetalContext:self->_metal];
  rawDFColorMatchStage = self->_rawDFColorMatchStage;
  self->_rawDFColorMatchStage = (RawDFColorMatchStage *)v61;

  if (!self->_rawDFColorMatchStage) {
    goto LABEL_73;
  }
  v63 = [[RawDFColorMatchStage alloc] initWithMetalContext:self->_metal];
  rawDFSyntheticReferenceStage = self->_rawDFSyntheticReferenceStage;
  self->_rawDFSyntheticReferenceStage = (RawDFSyntheticReferenceStage *)v63;

  if (!self->_rawDFSyntheticReferenceStage) {
    goto LABEL_73;
  }
  v65 = [[RawDFSyntheticReferenceStage alloc] initWithMetalContext:self->_metal];
  rawDFSyntheticReferenceUnpackStage = self->_rawDFSyntheticReferenceUnpackStage;
  self->_rawDFSyntheticReferenceUnpackStage = (RawDFSyntheticReferenceUnpackStage *)v65;

  if (!self->_rawDFSyntheticReferenceUnpackStage) {
    goto LABEL_73;
  }
  v67 = [[RawDFSyntheticReferenceUnpackStage alloc] initWithMetalContext:self->_metal];
  v68 = *(void **)&self->_useRegwarpCPU;
  *(void *)&self->_useRegwarpCPU = v67;

  if (!*(void *)&self->_useRegwarpCPU) {
    goto LABEL_73;
  }
  v69 = [[GainMapStage alloc] initWithMetalContext:self->_metal];
  rawDFPostDemosaicStage = self->_rawDFPostDemosaicStage;
  self->_rawDFPostDemosaicStage = (RawDFPostDemosaicStage *)v69;

  if (!self->_rawDFPostDemosaicStage) {
    goto LABEL_73;
  }
  v71 = [[RawDFPostDemosaicStage alloc] initWithMetalContext:self->_metal];
  softLTMStage = self->_softLTMStage;
  self->_softLTMStage = (SoftLTM *)v71;

  if (!self->_softLTMStage) {
    goto LABEL_73;
  }
  if (!BYTE1(self->_quadraMotionScore))
  {
    v73 = [SoftLTM alloc];
    v74 = [(FigMetalContext *)self->_metal commandQueue];
    v75 = [(SoftLTM *)v73 initWithCommandQueue:v74];
    colorConvertStage = self->_colorConvertStage;
    self->_colorConvertStage = v75;

    v77 = self->_colorConvertStage;
    if (!v77) {
      goto LABEL_73;
    }
    self->_deviceGeneration = [(ColorConvertStage *)v77 rawDFSoftLTMMode];
    id v78 = objc_alloc(MEMORY[0x263F2EE00]);
    v79 = [(FigMetalContext *)self->_metal commandQueue];
    v80 = [(FigMetalContext *)self->_metal allocator];
    v81 = (RawDFInferenceGen *)[v78 initWithOptionalCommandQueue:v79 allocator:v80];
    rawDFInferenceGen = self->_rawDFInferenceGen;
    self->_rawDFInferenceGen = v81;

    if (!self->_rawDFInferenceGen) {
      goto LABEL_73;
    }
  }
  if (LOBYTE(self->_quadraMotionScore))
  {
    [MEMORY[0x263F2EE70] getDefaults:&self->_registrationPipelineRWPPConfig];
    *(_WORD *)&self->_registrationPipelineRWPPConfig.skipInitialDownsample = 257;
  }
  else if (!BYTE1(self->_quadraMotionScore))
  {
    long long v99 = 0u;
    memset(v98, 0, sizeof(v98));
    [MEMORY[0x263F2EE70] getDefaults:v98];
    WORD6(v99) = 257;
    id v83 = objc_alloc(MEMORY[0x263F2EE50]);
    v84 = [(FigMetalContext *)self->_metal commandQueue];
    v85 = (RawDFPowerBlurStage *)[v83 initWithOptionalCommandQueue:v84 config:v98];
    rawDFPowerBlurStage = self->_rawDFPowerBlurStage;
    self->_rawDFPowerBlurStage = v85;

    if (!self->_rawDFPowerBlurStage)
    {
      v97 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT);
      int v95 = -73419;
      goto LABEL_75;
    }
  }
  v87 = (NSMutableArray *)objc_opt_new();
  framesPendingToBeRegistered = self->_framesPendingToBeRegistered;
  self->_framesPendingToBeRegistered = v87;

  if (!self->_framesPendingToBeRegistered
    || (v89 = (NRFProcessorInferenceResults *)objc_opt_new(),
        inferenceResults = self->_inferenceResults,
        self->_inferenceResults = v89,
        inferenceResults,
        !self->_inferenceResults))
  {
    v97 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT);
LABEL_74:
    int v95 = -73419;
LABEL_75:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_76;
  }
  uint64_t v91 = MEMORY[0x263EF89A0];
  long long v92 = *MEMORY[0x263EF89A0];
  long long v93 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  *(_OWORD *)self->_anon_120 = *MEMORY[0x263EF89A0];
  *(_OWORD *)&self->_anon_120[16] = v93;
  long long v94 = *(_OWORD *)(v91 + 32);
  *(_OWORD *)&self->_anon_120[32] = v94;
  *(_OWORD *)self->_anon_150 = v92;
  *(_OWORD *)&self->_anon_150[16] = v93;
  *(_OWORD *)&self->_anon_150[32] = v94;
  *(_DWORD *)&self->_isMeteorPlusPlusEnabled = -1082130432;
  LOBYTE(self->_darkestFrameMetadata) = 0;

  int v95 = 0;
LABEL_42:

  return v95;
}

+ (void)resetInferenceResultsBindings:(InferenceResultsBindings *)a3
{
  if (a3)
  {
    skinMask = a3->skinMask;
    a3->skinMask = 0;

    skyMask = a3->skyMask;
    a3->skyMask = 0;

    personMask = a3->personMask;
    a3->personMask = 0;

    instanceMasks = a3->instanceMasks;
    a3->instanceMasks = 0;
  }
}

- (int)prepareTuning:(id)a3
{
  uint64_t v319 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v271 = (id)objc_opt_new();
  id v5 = objc_msgSend(v4, "cmi_dictionary");

  v6 = (NSMutableDictionary *)objc_opt_new();
  tuningParams = self->_tuningParams;
  self->_tuningParams = v6;

  v265 = v5;
  if (self->_tuningParams)
  {
    v8 = [v5 objectForKeyedSubscript:@"DefaultSensorIDs"];
    if (v8)
    {
      long long v305 = 0u;
      long long v306 = 0u;
      long long v303 = 0u;
      long long v304 = 0u;
      obj = v8;
      uint64_t v251 = [obj countByEnumeratingWithState:&v303 objects:v318 count:16];
      if (!v251)
      {
        LODWORD(p_super) = 0;
        goto LABEL_409;
      }
      LODWORD(p_super) = 0;
      v261 = self;
      uint64_t v250 = *(void *)v304;
      while (1)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v304 != v250) {
            objc_enumerationMutation(obj);
          }
          uint64_t v255 = v10;
          v11 = *(void **)(*((void *)&v303 + 1) + 8 * v10);
          v12 = -[NSObject objectForKeyedSubscript:](obj, "objectForKeyedSubscript:", v11, v248, v249);
          v13 = NSNumber;
          id v14 = v12;
          v262 = objc_msgSend(v13, "numberWithUnsignedLongLong:", strtoull((const char *)objc_msgSend(v14, "UTF8String"), 0, 16));
          v267 = v11;
          v257 = [v265 objectForKeyedSubscript:v11];
          v266 = v14;
          v256 = [v257 objectForKeyedSubscript:v14];
          v260 = [v256 objectForKeyedSubscript:@"DeepFusionParameters"];
          if (!v260
            || (long long v301 = 0u,
                long long v302 = 0u,
                long long v299 = 0u,
                long long v300 = 0u,
                (uint64_t v252 = [&unk_270E97E88 countByEnumeratingWithState:&v299 objects:v317 count:16]) == 0))
          {
            int v237 = 1;
            goto LABEL_388;
          }
          uint64_t v254 = *(void *)v300;
LABEL_11:
          uint64_t v15 = 0;
LABEL_12:
          if (*(void *)v300 != v254)
          {
            uint64_t v16 = v15;
            objc_enumerationMutation(&unk_270E97E88);
            uint64_t v15 = v16;
          }
          uint64_t v258 = v15;
          v17 = *(void **)(*((void *)&v299 + 1) + 8 * v15);
          context = (void *)MEMORY[0x263E64AA0]();
          if (!isCompatibleSensorPortAndRawDFTuningType(v267, v17)) {
            goto LABEL_382;
          }
          v18 = loadCombinedTuningWithDict(v260, v17, @"Final");
          if (v18)
          {
            long long v297 = 0u;
            long long v298 = 0u;
            long long v295 = 0u;
            long long v296 = 0u;
            v272 = v18;
            uint64_t v264 = [v272 countByEnumeratingWithState:&v295 objects:v316 count:16];
            if (!v264) {
              goto LABEL_381;
            }
            uint64_t v263 = *(void *)v296;
            v277 = v17;
LABEL_18:
            uint64_t v19 = 0;
            while (1)
            {
              if (*(void *)v296 != v263) {
                objc_enumerationMutation(v272);
              }
              uint64_t v20 = *(void *)(*((void *)&v295 + 1) + 8 * v19);
              uint64_t v21 = -[NSObject objectForKeyedSubscript:](v272, "objectForKeyedSubscript:", v20, v248);
              if (!v21)
              {
                uint64_t v238 = v20;
                unsigned int v308 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v239 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v240 = v308;
                if (os_log_type_enabled(v239, type)) {
                  unsigned int v241 = v240;
                }
                else {
                  unsigned int v241 = v240 & 0xFFFFFFFE;
                }
                self = v261;
                if (v241)
                {
                  int v312 = 136315394;
                  v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                  __int16 v314 = 2112;
                  uint64_t v315 = v238;
                  LODWORD(v249) = 22;
                  v248 = &v312;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();

                p_super = v272;
                goto LABEL_397;
              }
              v22 = (void *)v21;
              uint64_t v283 = objc_opt_new();
              uint64_t v274 = v19;
              if (!v283)
              {
                unsigned int v308 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                p_super = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v150 = v308;
                if (os_log_type_enabled(p_super, type)) {
                  unsigned int v151 = v150;
                }
                else {
                  unsigned int v151 = v150 & 0xFFFFFFFE;
                }
                if (v151)
                {
                  int v312 = 136315138;
                  v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                  LODWORD(v249) = 12;
                  v248 = &v312;
                  goto LABEL_164;
                }
LABEL_254:
                fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_356:

                int v115 = 6;
                LODWORD(p_super) = -73278;
                goto LABEL_138;
              }
              v23 = [v22 objectForKeyedSubscript:@"ToneMapping"];
              v24 = [v23 objectForKeyedSubscript:@"DefaultParameters"];

              if (!v24)
              {
                unsigned int v308 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                p_super = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v152 = v308;
                if (os_log_type_enabled(p_super, type)) {
                  unsigned int v153 = v152;
                }
                else {
                  unsigned int v153 = v152 & 0xFFFFFFFE;
                }
                if (v153)
                {
                  int v312 = 136315138;
                  v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                  LODWORD(v249) = 12;
                  v248 = &v312;
LABEL_164:
                  _os_log_send_and_compose_impl();
                }
                goto LABEL_254;
              }
              v25 = objc_opt_new();
              int v26 = [v25 readPlist:v24];
              v278 = v22;
              if (v26)
              {
                LODWORD(p_super) = v26;
                uint64_t v249 = v273;
                LODWORD(v248) = v26;
                FigDebugAssert3();
                unsigned int v308 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v154 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v155 = v308;
                if (os_log_type_enabled(v154, type)) {
                  unsigned int v156 = v155;
                }
                else {
                  unsigned int v156 = v155 & 0xFFFFFFFE;
                }
                if (v156)
                {
                  int v312 = 136315138;
                  v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                  LODWORD(v249) = 12;
                  v248 = &v312;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();

                int v115 = 6;
                v22 = v278;
                goto LABEL_138;
              }
              uint64_t v270 = v20;
              v27 = *(void **)(v283 + 16);
              *(void *)(v283 + 16) = v25;

              v28 = objc_opt_new();
              v29 = [v22 objectForKeyedSubscript:@"SemanticStyles"];
              v30 = [v29 objectForKeyedSubscript:@"DefaultParameters"];

              if (!v30)
              {
                unsigned int v308 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                p_super = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v157 = v308;
                if (os_log_type_enabled(p_super, type)) {
                  unsigned int v158 = v157;
                }
                else {
                  unsigned int v158 = v157 & 0xFFFFFFFE;
                }
                if (v158)
                {
                  int v312 = 136315138;
                  v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                  LODWORD(v249) = 12;
                  v248 = &v312;
                  goto LABEL_289;
                }
LABEL_290:
                fig_log_call_emit_and_clean_up_after_send_and_compose();

                LODWORD(p_super) = -73278;
LABEL_298:

LABEL_362:
LABEL_373:
                int v115 = 6;
                goto LABEL_138;
              }
              int v31 = [v28 readPlist:v30];
              if (v31)
              {
                LODWORD(p_super) = v31;
                uint64_t v249 = v273;
                LODWORD(v248) = v31;
                FigDebugAssert3();
                unsigned int v308 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v159 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v160 = v308;
                if (os_log_type_enabled(v159, type)) {
                  unsigned int v161 = v160;
                }
                else {
                  unsigned int v161 = v160 & 0xFFFFFFFE;
                }
                if (v161)
                {
                  int v312 = 136315138;
                  v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                  LODWORD(v249) = 12;
                  v248 = &v312;
                  goto LABEL_296;
                }
LABEL_297:
                fig_log_call_emit_and_clean_up_after_send_and_compose();

                v22 = v278;
                goto LABEL_298;
              }
              v32 = *(void **)(v283 + 24);
              *(void *)(v283 + 24) = v28;

              v33 = [v22 objectForKeyedSubscript:@"BrightLightGreenGhost"];
              v34 = [v33 objectForKeyedSubscript:@"DefaultParameters"];

              if (v34)
              {
                v35 = objc_opt_new();
                int v36 = [v35 readPlist:v34];
                if (v36)
                {
                  LODWORD(p_super) = v36;
                  uint64_t v249 = v273;
                  LODWORD(v248) = v36;
                  FigDebugAssert3();
                  unsigned int v308 = 0;
                  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                  v194 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  unsigned int v195 = v308;
                  if (os_log_type_enabled(v194, type)) {
                    unsigned int v196 = v195;
                  }
                  else {
                    unsigned int v196 = v195 & 0xFFFFFFFE;
                  }
                  if (v196)
                  {
                    int v312 = 136315138;
                    v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                    LODWORD(v249) = 12;
                    v248 = &v312;
                    goto LABEL_272;
                  }
                  goto LABEL_273;
                }
                v37 = *(void **)(v283 + 80);
                *(void *)(v283 + 80) = v35;
              }
              v28 = objc_opt_new();
              v30 = [v22 objectForKeyedSubscript:@"PowerBlur"];

              if (!v30)
              {
                unsigned int v308 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                p_super = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v162 = v308;
                if (os_log_type_enabled(p_super, type)) {
                  unsigned int v163 = v162;
                }
                else {
                  unsigned int v163 = v162 & 0xFFFFFFFE;
                }
                if (!v163) {
                  goto LABEL_290;
                }
                int v312 = 136315138;
                v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                LODWORD(v249) = 12;
                v248 = &v312;
LABEL_289:
                _os_log_send_and_compose_impl();
                goto LABEL_290;
              }
              int v38 = [v28 readPlist:v30];
              if (v38)
              {
                LODWORD(p_super) = v38;
                uint64_t v249 = v273;
                LODWORD(v248) = v38;
                FigDebugAssert3();
                unsigned int v308 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v159 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v164 = v308;
                if (os_log_type_enabled(v159, type)) {
                  unsigned int v165 = v164;
                }
                else {
                  unsigned int v165 = v164 & 0xFFFFFFFE;
                }
                if (!v165) {
                  goto LABEL_297;
                }
                int v312 = 136315138;
                v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                LODWORD(v249) = 12;
                v248 = &v312;
LABEL_296:
                _os_log_send_and_compose_impl();
                goto LABEL_297;
              }
              v39 = *(void **)(v283 + 96);
              *(void *)(v283 + 96) = v28;

              v40 = objc_opt_new();
              v41 = [v22 objectForKeyedSubscript:@"YSH"];

              if (!v41)
              {
                unsigned int v308 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                p_super = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v166 = v308;
                if (os_log_type_enabled(p_super, type)) {
                  unsigned int v167 = v166;
                }
                else {
                  unsigned int v167 = v166 & 0xFFFFFFFE;
                }
                if (v167)
                {
                  int v312 = 136315138;
                  v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                  LODWORD(v249) = 12;
                  v248 = &v312;
                  goto LABEL_246;
                }
LABEL_247:
                fig_log_call_emit_and_clean_up_after_send_and_compose();

                LODWORD(p_super) = -73278;
LABEL_256:

LABEL_369:
                goto LABEL_373;
              }
              int v42 = [v40 readPlist:v41];
              if (v42)
              {
                LODWORD(p_super) = v42;
                uint64_t v249 = v273;
                LODWORD(v248) = v42;
                FigDebugAssert3();
                unsigned int v308 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v168 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v169 = v308;
                if (os_log_type_enabled(v168, type)) {
                  unsigned int v170 = v169;
                }
                else {
                  unsigned int v170 = v169 & 0xFFFFFFFE;
                }
                if (v170)
                {
                  int v312 = 136315138;
                  v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                  LODWORD(v249) = 12;
                  v248 = &v312;
                  goto LABEL_253;
                }
LABEL_255:
                fig_log_call_emit_and_clean_up_after_send_and_compose();

                v22 = v278;
                goto LABEL_256;
              }
              v43 = *(void **)(v283 + 104);
              *(void *)(v283 + 104) = v40;

              v44 = [v22 objectForKeyedSubscript:@"GainMap"];
              p_super = [v44 objectForKeyedSubscript:@"Default"];

              v45 = [[GainMapPlist alloc] initWithParams:p_super];
              v46 = *(void **)(v283 + 128);
              *(void *)(v283 + 128) = v45;

              if (!*(void *)(v283 + 128))
              {
                unsigned int v308 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v171 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v172 = v308;
                if (os_log_type_enabled(v171, type)) {
                  unsigned int v173 = v172;
                }
                else {
                  unsigned int v173 = v172 & 0xFFFFFFFE;
                }
                if (v173)
                {
                  int v312 = 136315138;
                  v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                  LODWORD(v249) = 12;
                  v248 = &v312;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();

                goto LABEL_356;
              }
              v47 = objc_opt_new();
              v48 = [v22 objectForKeyedSubscript:@"NoiseModel"];
              v41 = [v48 objectForKeyedSubscript:@"DefaultParameters"];

              if (!v41)
              {
                unsigned int v308 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                p_super = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v174 = v308;
                if (os_log_type_enabled(p_super, type)) {
                  unsigned int v175 = v174;
                }
                else {
                  unsigned int v175 = v174 & 0xFFFFFFFE;
                }
                if (v175)
                {
                  int v312 = 136315138;
                  v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                  LODWORD(v249) = 12;
                  v248 = &v312;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();

                LODWORD(p_super) = -73278;
                goto LABEL_368;
              }
              int v49 = [v47 readPlist:v41];
              if (v49)
              {
                LODWORD(p_super) = v49;
                uint64_t v249 = v273;
                LODWORD(v248) = v49;
                FigDebugAssert3();
                unsigned int v308 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v176 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v177 = v308;
                if (os_log_type_enabled(v176, type)) {
                  unsigned int v178 = v177;
                }
                else {
                  unsigned int v178 = v177 & 0xFFFFFFFE;
                }
                if (v178)
                {
                  int v312 = 136315138;
                  v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                  LODWORD(v249) = 12;
                  v248 = &v312;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();

                v22 = v278;
LABEL_368:

                goto LABEL_369;
              }
              v50 = *(void **)(v283 + 48);
              *(void *)(v283 + 48) = v47;

              v51 = objc_opt_new();
              v52 = [v22 objectForKeyedSubscript:@"DenoiseAndSharpening"];
              v30 = [v52 objectForKeyedSubscript:@"DefaultParameters"];

              if (!v30)
              {
                unsigned int v308 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                p_super = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v179 = v308;
                if (os_log_type_enabled(p_super, type)) {
                  unsigned int v180 = v179;
                }
                else {
                  unsigned int v180 = v179 & 0xFFFFFFFE;
                }
                if (v180)
                {
                  int v312 = 136315138;
                  v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                  LODWORD(v249) = 12;
                  v248 = &v312;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();

                LODWORD(p_super) = -73278;
                goto LABEL_361;
              }
              int v53 = [v51 readPlist:v30];
              if (v53)
              {
                LODWORD(p_super) = v53;
                uint64_t v249 = v273;
                LODWORD(v248) = v53;
                FigDebugAssert3();
                unsigned int v308 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v181 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v182 = v308;
                if (os_log_type_enabled(v181, type)) {
                  unsigned int v183 = v182;
                }
                else {
                  unsigned int v183 = v182 & 0xFFFFFFFE;
                }
                if (v183)
                {
                  int v312 = 136315138;
                  v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                  LODWORD(v249) = 12;
                  v248 = &v312;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();

                v22 = v278;
LABEL_361:

                goto LABEL_362;
              }
              v54 = *(void **)(v283 + 56);
              *(void *)(v283 + 56) = v51;
              id v55 = v51;

              [v271 addObject:v55];
              v40 = objc_opt_new();
              v56 = [v22 objectForKeyedSubscript:@"SyntheticReference"];
              v41 = [v56 objectForKeyedSubscript:@"Default"];

              if (!v41)
              {
                unsigned int v308 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                p_super = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v184 = v308;
                if (os_log_type_enabled(p_super, type)) {
                  unsigned int v185 = v184;
                }
                else {
                  unsigned int v185 = v184 & 0xFFFFFFFE;
                }
                if (!v185) {
                  goto LABEL_247;
                }
                int v312 = 136315138;
                v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                LODWORD(v249) = 12;
                v248 = &v312;
LABEL_246:
                _os_log_send_and_compose_impl();
                goto LABEL_247;
              }
              int v57 = [v40 readPlist:v41];
              if (v57)
              {
                uint64_t v249 = v273;
                LODWORD(v248) = v57;
                FigDebugAssert3();
                LODWORD(p_super) = FigSignalErrorAt();
                goto LABEL_256;
              }
              v58 = *(void **)(v283 + 40);
              *(void *)(v283 + 40) = v40;

              v34 = [v22 objectForKeyedSubscript:@"QuadraLearnedNRParameters"];

              if (v34)
              {
                v35 = objc_opt_new();
                int v59 = [v35 readPlist:v34];
                if (v59)
                {
                  LODWORD(p_super) = v59;
                  uint64_t v249 = v273;
                  LODWORD(v248) = v59;
                  FigDebugAssert3();
                  unsigned int v308 = 0;
                  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                  v194 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  unsigned int v197 = v308;
                  if (os_log_type_enabled(v194, type)) {
                    unsigned int v198 = v197;
                  }
                  else {
                    unsigned int v198 = v197 & 0xFFFFFFFE;
                  }
                  if (v198)
                  {
                    int v312 = 136315138;
                    v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                    LODWORD(v249) = 12;
                    v248 = &v312;
                    goto LABEL_272;
                  }
LABEL_273:
                  v22 = v278;
                  fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_372:
                  goto LABEL_373;
                }
                v60 = *(void **)(v283 + 144);
                *(void *)(v283 + 144) = v35;
              }
              v28 = objc_opt_new();
              v30 = [v22 objectForKeyedSubscript:@"DeferredProcessing"];

              if (!v30)
              {
                unsigned int v308 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                p_super = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v186 = v308;
                if (os_log_type_enabled(p_super, type)) {
                  unsigned int v187 = v186;
                }
                else {
                  unsigned int v187 = v186 & 0xFFFFFFFE;
                }
                if (!v187) {
                  goto LABEL_290;
                }
                int v312 = 136315138;
                v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                LODWORD(v249) = 12;
                v248 = &v312;
                goto LABEL_289;
              }
              int v61 = [v28 readPlist:v30];
              if (v61)
              {
                LODWORD(p_super) = v61;
                uint64_t v249 = v273;
                LODWORD(v248) = v61;
                FigDebugAssert3();
                unsigned int v308 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v159 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v188 = v308;
                if (os_log_type_enabled(v159, type)) {
                  unsigned int v189 = v188;
                }
                else {
                  unsigned int v189 = v188 & 0xFFFFFFFE;
                }
                if (!v189) {
                  goto LABEL_297;
                }
                int v312 = 136315138;
                v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                LODWORD(v249) = 12;
                v248 = &v312;
                goto LABEL_296;
              }
              v62 = *(void **)(v283 + 64);
              *(void *)(v283 + 64) = v28;

              v40 = objc_opt_new();
              v41 = [v22 objectForKeyedSubscript:@"RawDFNetworkStage"];

              if (!v41)
              {
                unsigned int v308 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                p_super = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v190 = v308;
                if (os_log_type_enabled(p_super, type)) {
                  unsigned int v191 = v190;
                }
                else {
                  unsigned int v191 = v190 & 0xFFFFFFFE;
                }
                if (!v191) {
                  goto LABEL_247;
                }
                int v312 = 136315138;
                v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                LODWORD(v249) = 12;
                v248 = &v312;
                goto LABEL_246;
              }
              int v63 = [v40 readPlist:v41];
              if (v63)
              {
                LODWORD(p_super) = v63;
                uint64_t v249 = v273;
                LODWORD(v248) = v63;
                FigDebugAssert3();
                unsigned int v308 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v168 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v192 = v308;
                if (os_log_type_enabled(v168, type)) {
                  unsigned int v193 = v192;
                }
                else {
                  unsigned int v193 = v192 & 0xFFFFFFFE;
                }
                if (v193)
                {
                  int v312 = 136315138;
                  v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                  LODWORD(v249) = 12;
                  v248 = &v312;
LABEL_253:
                  _os_log_send_and_compose_impl();
                }
                goto LABEL_255;
              }
              v64 = *(void **)(v283 + 88);
              *(void *)(v283 + 88) = v40;

              v65 = [v22 objectForKeyedSubscript:@"QuadraToneMapping"];
              v34 = [v65 objectForKeyedSubscript:@"DefaultParameters"];

              if (v34)
              {
                v35 = objc_opt_new();
                int v66 = [v35 readPlist:v34];
                if (v66)
                {
                  LODWORD(p_super) = v66;
                  uint64_t v249 = v273;
                  LODWORD(v248) = v66;
                  FigDebugAssert3();
                  unsigned int v308 = 0;
                  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                  v194 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  unsigned int v199 = v308;
                  if (os_log_type_enabled(v194, type)) {
                    unsigned int v200 = v199;
                  }
                  else {
                    unsigned int v200 = v199 & 0xFFFFFFFE;
                  }
                  if (v200)
                  {
                    int v312 = 136315138;
                    v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                    LODWORD(v249) = 12;
                    v248 = &v312;
LABEL_272:
                    _os_log_send_and_compose_impl();
                  }
                  goto LABEL_273;
                }
                v67 = *(void **)(v283 + 152);
                *(void *)(v283 + 152) = v35;
              }
              v68 = [v22 objectForKeyedSubscript:@"QuadraDenoiseAndSharpening"];
              v30 = [v68 objectForKeyedSubscript:@"DefaultParameters"];

              if (v30)
              {
                v28 = objc_opt_new();
                int v69 = [v28 readPlist:v30];
                if (v69)
                {
                  LODWORD(p_super) = v69;
                  uint64_t v249 = v273;
                  LODWORD(v248) = v69;
                  FigDebugAssert3();
                  unsigned int v308 = 0;
                  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                  v201 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  unsigned int v202 = v308;
                  if (os_log_type_enabled(v201, type)) {
                    unsigned int v203 = v202;
                  }
                  else {
                    unsigned int v203 = v202 & 0xFFFFFFFE;
                  }
                  if (v203)
                  {
                    int v312 = 136315138;
                    v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                    LODWORD(v249) = 12;
                    v248 = &v312;
                    _os_log_send_and_compose_impl();
                  }
                  v22 = v278;
                  fig_log_call_emit_and_clean_up_after_send_and_compose();

                  goto LABEL_298;
                }
                v70 = *(void **)(v283 + 168);
                *(void *)(v283 + 168) = v28;
                id v71 = v28;

                [v271 addObject:v71];
              }
              v72 = [v22 objectForKeyedSubscript:@"QuadraNoiseModel"];
              v41 = [v72 objectForKeyedSubscript:@"DefaultParameters"];

              if (v41)
              {
                v47 = objc_opt_new();
                int v73 = [v47 readPlist:v41];
                if (v73)
                {
                  LODWORD(p_super) = v73;
                  uint64_t v249 = v273;
                  LODWORD(v248) = v73;
                  FigDebugAssert3();
                  unsigned int v308 = 0;
                  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                  v204 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  unsigned int v205 = v308;
                  if (os_log_type_enabled(v204, type)) {
                    unsigned int v206 = v205;
                  }
                  else {
                    unsigned int v206 = v205 & 0xFFFFFFFE;
                  }
                  if (v206)
                  {
                    int v312 = 136315138;
                    v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                    LODWORD(v249) = 12;
                    v248 = &v312;
                    _os_log_send_and_compose_impl();
                  }
                  v22 = v278;
                  fig_log_call_emit_and_clean_up_after_send_and_compose();

                  goto LABEL_368;
                }
                v74 = *(void **)(v283 + 160);
                *(void *)(v283 + 160) = v47;
              }
              v30 = [v22 objectForKeyedSubscript:@"MIWBParameters"];

              if (v30)
              {
                v75 = objc_opt_new();
                v28 = v75;
                if (!v75)
                {
                  unsigned int v308 = 0;
                  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                  p_super = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  unsigned int v207 = v308;
                  if (os_log_type_enabled(p_super, type)) {
                    unsigned int v208 = v207;
                  }
                  else {
                    unsigned int v208 = v207 & 0xFFFFFFFE;
                  }
                  if (!v208) {
                    goto LABEL_290;
                  }
                  int v312 = 136315138;
                  v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                  LODWORD(v249) = 12;
                  v248 = &v312;
                  goto LABEL_289;
                }
                int v76 = [v75 readPlist:v30];
                if (v76)
                {
                  LODWORD(p_super) = v76;
                  uint64_t v249 = v273;
                  LODWORD(v248) = v76;
                  FigDebugAssert3();
                  unsigned int v308 = 0;
                  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                  v159 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  unsigned int v209 = v308;
                  if (os_log_type_enabled(v159, type)) {
                    unsigned int v210 = v209;
                  }
                  else {
                    unsigned int v210 = v209 & 0xFFFFFFFE;
                  }
                  if (!v210) {
                    goto LABEL_297;
                  }
                  int v312 = 136315138;
                  v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                  LODWORD(v249) = 12;
                  v248 = &v312;
                  goto LABEL_296;
                }
                v77 = *(void **)(v283 + 176);
                *(void *)(v283 + 176) = v28;
              }
              id v78 = [v22 objectForKeyedSubscript:@"OutputNoiseModel"];

              if (v78)
              {
                v35 = objc_opt_new();
                uint64_t v79 = [v22 objectForKeyedSubscript:@"OutputNoiseModel"];

                if (!v79)
                {
                  v34 = 0;
                  unsigned int v308 = 0;
                  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                  p_super = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  unsigned int v211 = v308;
                  if (os_log_type_enabled(p_super, type)) {
                    unsigned int v212 = v211;
                  }
                  else {
                    unsigned int v212 = v211 & 0xFFFFFFFE;
                  }
                  if (v212)
                  {
                    int v312 = 136315138;
                    v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                    LODWORD(v249) = 12;
                    v248 = &v312;
                    _os_log_send_and_compose_impl();
                  }
                  fig_log_call_emit_and_clean_up_after_send_and_compose();

                  LODWORD(p_super) = -73278;
                  goto LABEL_372;
                }
                int v80 = [v35 readPlist:v79];
                if (v80)
                {
                  LODWORD(p_super) = v80;
                  uint64_t v249 = v273;
                  LODWORD(v248) = v80;
                  FigDebugAssert3();
                  unsigned int v308 = 0;
                  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                  v213 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  unsigned int v214 = v308;
                  if (os_log_type_enabled(v213, type)) {
                    unsigned int v215 = v214;
                  }
                  else {
                    unsigned int v215 = v214 & 0xFFFFFFFE;
                  }
                  if (v215)
                  {
                    int v312 = 136315138;
                    v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                    LODWORD(v249) = 12;
                    v248 = &v312;
                    _os_log_send_and_compose_impl();
                  }
                  fig_log_call_emit_and_clean_up_after_send_and_compose();

                  v34 = (void *)v79;
                  goto LABEL_372;
                }
                v81 = *(void **)(v283 + 184);
                *(void *)(v283 + 184) = v35;
              }
              else
              {
                uint64_t v79 = 0;
              }
              v82 = [v265 objectForKeyedSubscript:v267];
              id v83 = [v82 objectForKeyedSubscript:v266];
              uint64_t v84 = [v83 objectForKeyedSubscript:@"ChromaticDefringing"];

              v276 = (void *)v84;
              if (v84)
              {
                v85 = [[VideoDefringingTuningParameters alloc] initWithTuningParameters:v84];
                p_super = &v85->super;
                if (!v85)
                {
                  uint64_t v249 = v273;
                  LODWORD(v248) = 0;
                  FigDebugAssert3();
                  v87 = 0;
LABEL_311:
                  v121 = (void *)v79;
                  int v115 = 6;
                  goto LABEL_137;
                }
                int v86 = [(VideoDefringingTuningParameters *)v85 selectParametersForTuningMode:0];
                v87 = p_super;
                if (v86)
                {
                  LODWORD(p_super) = v86;
                  uint64_t v249 = v273;
                  LODWORD(v248) = v86;
                  FigDebugAssert3();
                  goto LABEL_311;
                }
                v88 = *(void **)(v283 + 72);
                *(void *)(v283 + 72) = p_super;
              }
              v275 = (void *)v79;
              p_super = [v22 objectForKeyedSubscript:@"SyntheticLong"];
              v269 = p_super;
              if (!p_super)
              {
LABEL_119:
                v121 = objc_msgSend(v22, "objectForKeyedSubscript:", @"QDEM", v248);

                if (!v121) {
                  goto LABEL_123;
                }
                v122 = objc_opt_new();
                v123 = v122;
                if (v122)
                {
                  int v124 = [v122 readPlist:v121];
                  LODWORD(p_super) = v124;
                  if (!v124)
                  {
                    v125 = *(void **)(v283 + 112);
                    *(void *)(v283 + 112) = v123;

LABEL_123:
                    v126 = [v22 objectForKeyedSubscript:@"Demosaic"];

                    v127 = v126;
                    if (v126)
                    {
                      v128 = objc_opt_new();
                      v129 = v128;
                      if (!v128)
                      {
                        unsigned int v308 = 0;
                        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                        p_super = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                        unsigned int v227 = v308;
                        if (os_log_type_enabled(p_super, type)) {
                          unsigned int v228 = v227;
                        }
                        else {
                          unsigned int v228 = v227 & 0xFFFFFFFE;
                        }
                        if (v228)
                        {
                          int v312 = 136315138;
                          v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                          LODWORD(v249) = 12;
                          v248 = &v312;
                          _os_log_send_and_compose_impl();
                        }
                        fig_log_call_emit_and_clean_up_after_send_and_compose();

                        LODWORD(p_super) = -73278;
                        goto LABEL_379;
                      }
                      int v130 = [v128 readPlist:v126];
                      LODWORD(p_super) = v130;
                      if (v130)
                      {
                        uint64_t v249 = v273;
                        LODWORD(v248) = v130;
                        FigDebugAssert3();
                        unsigned int v308 = 0;
                        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                        v229 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                        unsigned int v230 = v308;
                        if (os_log_type_enabled(v229, type)) {
                          unsigned int v231 = v230;
                        }
                        else {
                          unsigned int v231 = v230 & 0xFFFFFFFE;
                        }
                        if (v231)
                        {
                          int v312 = 136315138;
                          v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                          LODWORD(v249) = 12;
                          v248 = &v312;
                          _os_log_send_and_compose_impl();
                        }
                        fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_379:
                        int v115 = 6;
                        v87 = v269;
                        v121 = v127;
                        goto LABEL_137;
                      }
                      v131 = *(void **)(v283 + 120);
                      *(void *)(v283 + 120) = v129;
                    }
                    v121 = [v22 objectForKeyedSubscript:@"PostDemosaic"];

                    if (v121)
                    {
                      v132 = objc_opt_new();
                      v123 = v132;
                      if (v132)
                      {
                        int v133 = [v132 readPlist:v121];
                        LODWORD(p_super) = v133;
                        if (!v133)
                        {
                          v134 = *(void **)(v283 + 136);
                          *(void *)(v283 + 136) = v123;

                          goto LABEL_131;
                        }
                        uint64_t v249 = v273;
                        LODWORD(v248) = v133;
                        FigDebugAssert3();
                        unsigned int v308 = 0;
                        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                        v224 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                        unsigned int v234 = v308;
                        if (os_log_type_enabled(v224, type)) {
                          unsigned int v235 = v234;
                        }
                        else {
                          unsigned int v235 = v234 & 0xFFFFFFFE;
                        }
                        if (v235)
                        {
                          int v312 = 136315138;
                          v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                          LODWORD(v249) = 12;
                          v248 = &v312;
LABEL_353:
                          _os_log_send_and_compose_impl();
                        }
                        goto LABEL_364;
                      }
                      unsigned int v308 = 0;
                      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                      p_super = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                      unsigned int v232 = v308;
                      if (os_log_type_enabled(p_super, type)) {
                        unsigned int v233 = v232;
                      }
                      else {
                        unsigned int v233 = v232 & 0xFFFFFFFE;
                      }
                      if (v233)
                      {
                        int v312 = 136315138;
                        v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                        LODWORD(v249) = 12;
                        v248 = &v312;
LABEL_347:
                        _os_log_send_and_compose_impl();
                      }
                      goto LABEL_363;
                    }
LABEL_131:
                    v135 = [(NSMutableDictionary *)v261->_tuningParams objectForKeyedSubscript:v262];

                    if (!v135)
                    {
                      v136 = objc_opt_new();
                      [(NSMutableDictionary *)v261->_tuningParams setObject:v136 forKeyedSubscript:v262];
                    }
                    v137 = [(NSMutableDictionary *)v261->_tuningParams objectForKeyedSubscript:v262];
                    v138 = [v137 objectForKeyedSubscript:v17];

                    if (!v138)
                    {
                      v139 = objc_opt_new();
                      v140 = [(NSMutableDictionary *)v261->_tuningParams objectForKeyedSubscript:v262];
                      [v140 setObject:v139 forKeyedSubscript:v17];
                    }
                    v141 = [(NSMutableDictionary *)v261->_tuningParams objectForKeyedSubscript:v262];
                    v142 = [v141 objectForKeyedSubscript:v17];
                    [v142 setObject:v283 forKeyedSubscript:v270];

                    int v115 = 0;
                    v22 = v278;
LABEL_136:
                    v87 = v269;
                    goto LABEL_137;
                  }
                  uint64_t v249 = v273;
                  LODWORD(v248) = v124;
                  FigDebugAssert3();
                  unsigned int v308 = 0;
                  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                  v224 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  unsigned int v225 = v308;
                  if (os_log_type_enabled(v224, type)) {
                    unsigned int v226 = v225;
                  }
                  else {
                    unsigned int v226 = v225 & 0xFFFFFFFE;
                  }
                  if (v226)
                  {
                    int v312 = 136315138;
                    v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                    LODWORD(v249) = 12;
                    v248 = &v312;
                    goto LABEL_353;
                  }
LABEL_364:
                  fig_log_call_emit_and_clean_up_after_send_and_compose();

                  v22 = v278;
                }
                else
                {
                  unsigned int v308 = 0;
                  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                  p_super = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  unsigned int v222 = v308;
                  if (os_log_type_enabled(p_super, type)) {
                    unsigned int v223 = v222;
                  }
                  else {
                    unsigned int v223 = v222 & 0xFFFFFFFE;
                  }
                  if (v223)
                  {
                    int v312 = 136315138;
                    v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                    LODWORD(v249) = 12;
                    v248 = &v312;
                    goto LABEL_347;
                  }
LABEL_363:
                  fig_log_call_emit_and_clean_up_after_send_and_compose();

                  LODWORD(p_super) = -73278;
                }

                int v115 = 6;
                goto LABEL_136;
              }
              v89 = (id *)objc_opt_new();
              if (!v89) {
                break;
              }
              v90 = v89;
              objc_storeStrong((id *)(v283 + 32), v89);
              uint64_t v91 = objc_opt_new();
              if (!v91)
              {
                v87 = p_super;
                unsigned int v308 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v219 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v220 = v308;
                if (os_log_type_enabled(v219, type)) {
                  unsigned int v221 = v220;
                }
                else {
                  unsigned int v221 = v220 & 0xFFFFFFFE;
                }
                if (v221)
                {
                  int v312 = 136315138;
                  v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                  LODWORD(v249) = 12;
                  v248 = &v312;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_376:
                int v115 = 6;
                LODWORD(p_super) = -73278;
                goto LABEL_118;
              }
              long long v92 = v91;
              v268 = v90;
              objc_storeStrong(v90 + 1, v91);
              long long v293 = 0u;
              long long v294 = 0u;
              long long v291 = 0u;
              long long v292 = 0u;
              v87 = p_super;
              uint64_t v282 = [v87 countByEnumeratingWithState:&v291 objects:v311 count:16];
              if (v282)
              {
                LODWORD(p_super) = 0;
                v280 = v92;
                uint64_t v281 = *(void *)v292;
                v279 = v87;
LABEL_75:
                uint64_t v93 = 0;
                while (1)
                {
                  if (*(void *)v292 != v281) {
                    objc_enumerationMutation(v87);
                  }
                  uint64_t v94 = *(void *)(*((void *)&v291 + 1) + 8 * v93);
                  uint64_t v95 = objc_opt_new();
                  if (!v95) {
                    break;
                  }
                  uint64_t v96 = v95;
                  [v92 setObject:v95 forKeyedSubscript:v94];
                  v97 = [v87 objectForKeyedSubscript:v94];
                  if (!v97)
                  {
                    v146 = (void *)v96;
                    unsigned int v308 = 0;
                    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                    v147 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    unsigned int v148 = v308;
                    if (os_log_type_enabled(v147, type)) {
                      unsigned int v149 = v148;
                    }
                    else {
                      unsigned int v149 = v148 & 0xFFFFFFFE;
                    }
                    if (v149)
                    {
                      int v312 = 136315394;
                      v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                      __int16 v314 = 2112;
                      uint64_t v315 = v94;
                      LODWORD(v249) = 22;
                      v248 = &v312;
                      _os_log_send_and_compose_impl();
                    }
                    fig_log_call_emit_and_clean_up_after_send_and_compose();

                    goto LABEL_153;
                  }
                  v98 = v97;
                  uint64_t v284 = v93;
                  long long v99 = [v97 objectForKeyedSubscript:@"StaticGyroMotionThreshold"];
                  [v99 floatValue];
                  *(_DWORD *)(v96 + 16) = v100;

                  v101 = [v98 objectForKeyedSubscript:@"StaticSceneMotionThreshold"];
                  [v101 floatValue];
                  *(_DWORD *)(v96 + 20) = v102;

                  v103 = [GainValueArray alloc];
                  v104 = [v98 objectForKeyedSubscript:@"SyntheticLongPedestal"];
                  v105 = [(GainValueArray *)v103 initWithArray:v104];

                  v286 = (void *)v96;
                  if ([(GainValueArray *)v105 isValid])
                  {
                    v285 = v105;
                    objc_storeStrong((id *)(v96 + 24), v105);
                    v106 = objc_opt_new();
                    if (v106)
                    {
                      objc_storeStrong((id *)(v96 + 8), v106);
                      long long v289 = 0u;
                      long long v290 = 0u;
                      long long v287 = 0u;
                      long long v288 = 0u;
                      v309[0] = @"StaticParameters";
                      v309[1] = @"DefaultParameters";
                      v107 = [MEMORY[0x263EFF8C0] arrayWithObjects:v309 count:2];
                      uint64_t v108 = [v107 countByEnumeratingWithState:&v287 objects:v310 count:16];
                      if (v108)
                      {
                        uint64_t v109 = v108;
                        uint64_t v110 = *(void *)v288;
LABEL_84:
                        uint64_t v111 = 0;
                        while (1)
                        {
                          if (*(void *)v288 != v110) {
                            objc_enumerationMutation(v107);
                          }
                          uint64_t v112 = *(void *)(*((void *)&v287 + 1) + 8 * v111);
                          v113 = objc_opt_new();
                          if (!v113) {
                            break;
                          }
                          v114 = [v98 objectForKeyedSubscript:v112];
                          LODWORD(p_super) = [v113 readPlist:v114];

                          if (p_super)
                          {
                            uint64_t v249 = v273;
                            LODWORD(v248) = p_super;
                            FigDebugAssert3();
                            v17 = v277;
                            v22 = v278;
                            long long v92 = v280;
LABEL_101:

                            int v115 = 6;
                            goto LABEL_102;
                          }
                          [v106 setObject:v113 forKeyedSubscript:v112];

                          if (v109 == ++v111)
                          {
                            uint64_t v109 = [v107 countByEnumeratingWithState:&v287 objects:v310 count:16];
                            if (v109) {
                              goto LABEL_84;
                            }
                            int v115 = 0;
                            LODWORD(p_super) = 0;
                            v17 = v277;
                            v22 = v278;
                            goto LABEL_93;
                          }
                        }
                        unsigned int v308 = 0;
                        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                        p_super = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                        unsigned int v116 = v308;
                        if (os_log_type_enabled(p_super, type)) {
                          unsigned int v117 = v116;
                        }
                        else {
                          unsigned int v117 = v116 & 0xFFFFFFFE;
                        }
                        if (v117)
                        {
                          int v312 = 136315138;
                          v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                          LODWORD(v249) = 12;
                          v248 = &v312;
                          _os_log_send_and_compose_impl();
                        }
                        v17 = v277;
                        v22 = v278;
                        long long v92 = v280;
                        fig_log_call_emit_and_clean_up_after_send_and_compose();

                        LODWORD(p_super) = -73278;
                        goto LABEL_101;
                      }
                      int v115 = 0;
LABEL_93:
                      long long v92 = v280;
LABEL_102:

                      v87 = v279;
                    }
                    else
                    {
                      unsigned int v308 = 0;
                      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                      p_super = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                      unsigned int v118 = v308;
                      if (os_log_type_enabled(p_super, type)) {
                        unsigned int v119 = v118;
                      }
                      else {
                        unsigned int v119 = v118 & 0xFFFFFFFE;
                      }
                      if (v119)
                      {
                        int v312 = 136315138;
                        v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                        LODWORD(v249) = 12;
                        v248 = &v312;
                        _os_log_send_and_compose_impl();
                      }
                      fig_log_call_emit_and_clean_up_after_send_and_compose();

                      int v115 = 6;
                      LODWORD(p_super) = -73278;
                    }

                    v105 = v285;
                  }
                  else
                  {
                    uint64_t v249 = v273;
                    LODWORD(v248) = 0;
                    FigDebugAssert3();
                    int v115 = 6;
                    LODWORD(p_super) = -73278;
                  }

                  if (v115) {
                    goto LABEL_117;
                  }
                  uint64_t v93 = v284 + 1;
                  if (v284 + 1 == v282)
                  {
                    uint64_t v120 = [v87 countByEnumeratingWithState:&v291 objects:v311 count:16];
                    uint64_t v282 = v120;
                    if (!v120)
                    {
                      int v115 = 0;
                      goto LABEL_117;
                    }
                    goto LABEL_75;
                  }
                }
                unsigned int v308 = 0;
                os_log_type_t type = OS_LOG_TYPE_DEFAULT;
                v143 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v144 = v308;
                if (os_log_type_enabled(v143, type)) {
                  unsigned int v145 = v144;
                }
                else {
                  unsigned int v145 = v144 & 0xFFFFFFFE;
                }
                if (v145)
                {
                  int v312 = 136315138;
                  v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
                  LODWORD(v249) = 12;
                  v248 = &v312;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_153:
                int v115 = 6;
                LODWORD(p_super) = -73278;
              }
              else
              {
                int v115 = 0;
                LODWORD(p_super) = 0;
              }
LABEL_117:

              if (!v115) {
                goto LABEL_119;
              }
LABEL_118:
              v121 = v275;
LABEL_137:

LABEL_138:
              if (v115)
              {

                self = v261;
                goto LABEL_387;
              }
              uint64_t v19 = v274 + 1;
              if (v274 + 1 == v264)
              {
                uint64_t v236 = [v272 countByEnumeratingWithState:&v295 objects:v316 count:16];
                uint64_t v264 = v236;
                if (v236) {
                  goto LABEL_18;
                }
LABEL_381:

                self = v261;
LABEL_382:
                uint64_t v15 = v258 + 1;
                if (v258 + 1 == v252)
                {
                  int v237 = 1;
                  uint64_t v252 = [&unk_270E97E88 countByEnumeratingWithState:&v299 objects:v317 count:16];
                  if (!v252) {
                    goto LABEL_388;
                  }
                  goto LABEL_11;
                }
                goto LABEL_12;
              }
            }
            v87 = p_super;
            unsigned int v308 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            v216 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v217 = v308;
            if (os_log_type_enabled(v216, type)) {
              unsigned int v218 = v217;
            }
            else {
              unsigned int v218 = v217 & 0xFFFFFFFE;
            }
            if (v218)
            {
              int v312 = 136315138;
              v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
              LODWORD(v249) = 12;
              v248 = &v312;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            goto LABEL_376;
          }
          unsigned int v308 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          p_super = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v242 = v308;
          if (os_log_type_enabled(p_super, type)) {
            unsigned int v243 = v242;
          }
          else {
            unsigned int v243 = v242 & 0xFFFFFFFE;
          }
          if (v243)
          {
            int v312 = 136315138;
            v313 = "-[DeepFusionProcessor(Tuning) prepareTuning:]";
            LODWORD(v249) = 12;
            v248 = &v312;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_397:

          LODWORD(p_super) = -73278;
LABEL_387:
          int v237 = 0;
LABEL_388:

          if (!v237)
          {
            v245 = obj;

            goto LABEL_407;
          }
          uint64_t v10 = v255 + 1;
        }
        while (v255 + 1 != v251);
        uint64_t v244 = [obj countByEnumeratingWithState:&v303 objects:v318 count:16];
        uint64_t v251 = v244;
        if (!v244)
        {
LABEL_409:

          v246 = v271;
          objc_storeStrong((id *)&self->_dasTuningOptions, v271);

          goto LABEL_410;
        }
      }
    }
  }
  FigDebugAssert3();
  unsigned int v308 = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  v245 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v245, OS_LOG_TYPE_DEFAULT);
  LODWORD(p_super) = -73278;
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_407:

  v246 = v271;
LABEL_410:

  return (int)p_super;
}

- (int)setupWithOptions:(id)a3
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v4 = a3;
  FigCaptureGetModelSpecificName();
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  deviceModelName = self->_deviceModelName;
  self->_deviceModelName = v5;

  *((_DWORD *)&self->_calculateLTM + 1) = objc_msgSend(v4, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F7B0], 0, 0);
  v7 = [v4 objectForKeyedSubscript:@"TuningParameters"];
  int v8 = [(DeepFusionProcessor *)self prepareTuning:v7];

  if (v8 || [(DeepFusionProcessor *)self applyOverrides]) {
    goto LABEL_42;
  }
  v9 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2F1E8]];
  output = self->_output;
  self->_output = v9;

  if (!self->_output
    || (inputFrames = self->_inputFrames) == 0
    || (-[RawDFDeferredFrames setCameraInfoByPortType:](inputFrames, "setCameraInfoByPortType:"),
        v12 = [[LSCGainsPlist alloc] initWithDictionary:self->_output metal:self->_metal], lscGainsTex = self->_lscGainsTex, self->_lscGainsTex = (MTLTexture *)v12, lscGainsTex, !self->_lscGainsTex))
  {
    unsigned int v74 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
    int v31 = -73387;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_43:
    goto LABEL_39;
  }
  v64 = [MEMORY[0x263EFF9A0] dictionary];
  if (!v64)
  {
LABEL_42:
    FigDebugAssert3();
    int v31 = FigSignalErrorAt();
    goto LABEL_43;
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v14 = self->_tuningParams;
  uint64_t v62 = [(NSMutableDictionary *)v14 countByEnumeratingWithState:&v69 objects:v78 count:16];
  if (!v62)
  {

    BOOL v15 = 0;
    LOBYTE(self->_textureUtils) = 0;
    goto LABEL_29;
  }
  id v58 = v4;
  obj = v14;
  BOOL v15 = 0;
  uint64_t v16 = 0;
  BOOL v17 = 0;
  uint64_t v60 = *(void *)v70;
  int v61 = self;
  do
  {
    uint64_t v18 = 0;
    do
    {
      if (*(void *)v70 != v60) {
        objc_enumerationMutation(obj);
      }
      uint64_t v63 = v18;
      uint64_t v19 = [(NSMutableDictionary *)self->_tuningParams objectForKeyedSubscript:*(void *)(*((void *)&v69 + 1) + 8 * v18)];
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v65 objects:v77 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v66;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v66 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = [v19 objectForKeyedSubscript:*(void *)(*((void *)&v65 + 1) + 8 * i)];
            v25 = [v24 objectForKeyedSubscript:@"Default"];

            uint64_t v26 = v25[2];
            BOOL v17 = (*(unsigned __int8 *)(v26 + 95) | v17) != 0;
            uint64_t v27 = v25[22];
            if (v27) {
              BOOL v15 = (*(unsigned __int8 *)(v27 + 16) | v15) != 0;
            }
            if (*(void *)(v26 + 120))
            {
              v75 = @"DeepFusionParameters";
              uint64_t v76 = *(void *)(v25[2] + 120);
              v28 = [NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
              v29 = [NSNumber numberWithInt:v16];
              [v64 setObject:v28 forKey:v29];

              uint64_t v16 = (v16 + 1);
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v65 objects:v77 count:16];
        }
        while (v21);
      }

      uint64_t v18 = v63 + 1;
      self = v61;
    }
    while (v63 + 1 != v62);
    uint64_t v62 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v69 objects:v78 count:16];
  }
  while (v62);

  LOBYTE(v61->_textureUtils) = v17;
  id v4 = v58;
  if (!v17 || (int v30 = [(RawDFCommon *)v61->_rawDFCommon setupSTFProcessor:v64]) == 0)
  {
LABEL_29:
    [(CMIDraftDemosaicStage *)self->_draftDemosaicStage setCameraInfoByPortType:self->_output];
    BYTE2(self->_quadraMotionScore) = 1;
    [(RawDFPowerBlurStage *)self->_rawDFPowerBlurStage setApplyGDC:1];
    v32 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2F7C8]];
    int v33 = [v32 BOOLValue];

    v34 = [[RawDFNetworkStage alloc] initWithMetal:self->_metal isV2:*((_DWORD *)&self->_calculateLTM + 1) > 199];
    concurrentProcessing = self->_concurrentProcessing;
    self->_concurrentProcessing = (NRFConcurrentProcessing *)v34;

    if (self->_concurrentProcessing)
    {
      if (!v33)
      {
LABEL_34:
        if (v15
          && (rawDFCommon = self->_rawDFCommon,
              [v4 objectForKeyedSubscript:@"TuningParameters"],
              v43 = objc_claimAutoreleasedReturnValue(),
              int v31 = [(RawDFCommon *)rawDFCommon setupMIWB:v43],
              v43,
              v31))
        {
          FigDebugAssert3();
        }
        else
        {
          colorConvertStage = self->_colorConvertStage;
          v45 = [v4 objectForKeyedSubscript:@"TuningParameters"];
          int v46 = [(ColorConvertStage *)colorConvertStage setupIBPTuningParameters:v45 with:0];

          if (v46)
          {
            FigDebugAssert3();
            int v31 = v46;
          }
          else
          {
            int v31 = 0;
          }
        }
        goto LABEL_38;
      }
      int v36 = [[NRFConcurrentProcessing alloc] initWithContext:self->_metal backgroundContext:self->_backgroundMetal doConcurrent:1];
      backgroundLearnedNR = self->_backgroundLearnedNR;
      self->_backgroundLearnedNR = (NRFBackgroundLearnedNR *)v36;

      if (self->_backgroundLearnedNR)
      {
        int v38 = [[NRFBackgroundLearnedNR alloc] initWithContext:self->_backgroundMetal cameraInfo:self->_output isQuadra:1 deviceGeneration:*((unsigned int *)&self->_calculateLTM + 1)];
        v39 = *(void **)&self->_dfFrameMetadata.hasEVM;
        *(void *)&self->_dfFrameMetadata.hasEVM = v38;

        if (*(void *)&self->_dfFrameMetadata.hasEVM)
        {
          v40 = [[RawDFLanczos alloc] initWithMetalContext:self->_metal];
          imageLanczosScaler = self->_imageLanczosScaler;
          self->_imageLanczosScaler = v40;

          if (self->_imageLanczosScaler) {
            goto LABEL_34;
          }
          unsigned int v74 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          int v49 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v56 = v74;
          if (os_log_type_enabled(v49, type)) {
            unsigned int v57 = v56;
          }
          else {
            unsigned int v57 = v56 & 0xFFFFFFFE;
          }
          if (!v57)
          {
LABEL_66:
            int v31 = -73387;
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            goto LABEL_38;
          }
          int v79 = 136315138;
          int v80 = "-[DeepFusionProcessor setupWithOptions:]";
        }
        else
        {
          unsigned int v74 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          int v49 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v54 = v74;
          if (os_log_type_enabled(v49, type)) {
            unsigned int v55 = v54;
          }
          else {
            unsigned int v55 = v54 & 0xFFFFFFFE;
          }
          if (!v55) {
            goto LABEL_66;
          }
          int v79 = 136315138;
          int v80 = "-[DeepFusionProcessor setupWithOptions:]";
        }
      }
      else
      {
        unsigned int v74 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        int v49 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v52 = v74;
        if (os_log_type_enabled(v49, type)) {
          unsigned int v53 = v52;
        }
        else {
          unsigned int v53 = v52 & 0xFFFFFFFE;
        }
        if (!v53) {
          goto LABEL_66;
        }
        int v79 = 136315138;
        int v80 = "-[DeepFusionProcessor setupWithOptions:]";
      }
    }
    else
    {
      unsigned int v74 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      int v49 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v50 = v74;
      if (os_log_type_enabled(v49, type)) {
        unsigned int v51 = v50;
      }
      else {
        unsigned int v51 = v50 & 0xFFFFFFFE;
      }
      if (!v51) {
        goto LABEL_66;
      }
      int v79 = 136315138;
      int v80 = "-[DeepFusionProcessor setupWithOptions:]";
    }
    _os_log_send_and_compose_impl();
    goto LABEL_66;
  }
  int v31 = v30;
LABEL_38:

LABEL_39:
  return v31;
}

- (DeepFusionProcessor)initWithContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DeepFusionProcessor;
  id v5 = [(DeepFusionProcessor *)&v9 init];
  v6 = v5;
  if (!v5)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_7:
    v7 = 0;
    goto LABEL_4;
  }
  if ([(DeepFusionProcessor *)v5 _commonInitWithContext:v4])
  {
    FigDebugAssert3();
    goto LABEL_7;
  }
  v7 = v6;
LABEL_4:

  return v7;
}

- (void)dealloc
{
  if (!+[NRFMonitorStatus isActive])
  {
    NRFSingletonsReleaseAll();
    flushIOUnifiedAddressTranslatorWithDummyBuffer();
  }
  v3.receiver = self;
  v3.super_class = (Class)DeepFusionProcessor;
  [(DeepFusionProcessor *)&v3 dealloc];
}

- (int)bindInferenceResults:(id)a3 toBindings:(InferenceResultsBindings *)a4
{
  id v6 = a3;
  if ([v6 skinMask])
  {
    -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", [v6 skinMask], 10, 7, 0);
    v7 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    skinMask = a4->skinMask;
    a4->skinMask = v7;

    if (!a4->skinMask) {
      goto LABEL_23;
    }
  }
  if ([v6 highResPersonMask] || objc_msgSend(v6, "personMask"))
  {
    metal = self->_metal;
    uint64_t v10 = [v6 highResPersonMask];
    if (!v10) {
      uint64_t v10 = [v6 personMask];
    }
    uint64_t v11 = [v6 highResPersonMask] ? 10 : 25;
    v12 = [(FigMetalContext *)metal bindPixelBufferToMTL2DTexture:v10 pixelFormat:v11 usage:7 plane:0];
    personMask = a4->personMask;
    a4->personMask = v12;

    if (!a4->personMask) {
      goto LABEL_23;
    }
  }
  if ([v6 skyMask])
  {
    -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", [v6 skyMask], 10, 7, 0);
    id v14 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    skyMask = a4->skyMask;
    a4->skyMask = v14;

    if (!a4->skyMask)
    {
LABEL_23:
      v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
      int v26 = -73401;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      goto LABEL_21;
    }
  }
  uint64_t v16 = objc_opt_new();
  BOOL v17 = [v6 lowResPersonInstanceMasks];
  uint64_t v18 = [v17 count];

  if (!v18)
  {
LABEL_19:
    objc_storeStrong((id *)&a4->instanceMasks, v16);
    int v26 = 0;
    goto LABEL_20;
  }
  unint64_t v19 = 0;
  while (1)
  {
    uint64_t v20 = [v6 lowResPersonInstanceMasks];
    uint64_t v21 = [v20 objectAtIndexedSubscript:v19];

    if (v21) {
      break;
    }
LABEL_18:
    ++v19;
    v24 = [v6 lowResPersonInstanceMasks];
    unint64_t v25 = [v24 count];

    if (v25 <= v19) {
      goto LABEL_19;
    }
  }
  uint64_t v22 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:v21 pixelFormat:25 usage:1 plane:0];
  if (v22)
  {
    v23 = (void *)v22;
    [v16 addObject:v22];

    goto LABEL_18;
  }
  v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
  int v26 = -73401;
  fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_20:
LABEL_21:

  return v26;
}

- (int)prewarm
{
  return 0;
}

- (int)setup
{
  return 0;
}

- (DeepFusionProcessor)init
{
  v7.receiver = self;
  v7.super_class = (Class)DeepFusionProcessor;
  v2 = [(DeepFusionProcessor *)&v7 init];
  if (v2)
  {
    objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = (void *)[objc_alloc(MEMORY[0x263F2EE30]) initWithbundle:v3 andOptionalCommandQueue:0];
    BYTE1(v2->_quadraMotionScore) = 1;
    if ([(DeepFusionProcessor *)v2 _commonInitWithContext:v4])
    {
      FigDebugAssert3();
      id v5 = 0;
    }
    else
    {
      id v5 = v2;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)addToSidecar:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(LSCGainsPlist *)self->_lscGainsPlist objectForKeyedSubscript:v6],
        objc_super v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    int v8 = [(LSCGainsPlist *)self->_lscGainsPlist objectForKeyedSubscript:v6];
    [v8 addEntriesFromDictionary:v9];
  }
  else
  {
    [(LSCGainsPlist *)self->_lscGainsPlist setObject:v9 forKeyedSubscript:v6];
  }
}

- (int)prewarmWithTuningParameters:(id)a3
{
  id v4 = a3;
  int v5 = +[ToneMappingStage prewarmShaders:self->_metal];
  if (v5)
  {
    int v17 = v5;
    goto LABEL_27;
  }
  int v6 = +[SubjectRelightingStage prewarmShaders:self->_metal];
  if (v6)
  {
    int v17 = v6;
    goto LABEL_27;
  }
  int v7 = +[SemanticStylesStage prewarmShaders:self->_metal];
  if (v7)
  {
    int v17 = v7;
    goto LABEL_27;
  }
  int v8 = +[RegDense prewarmShaders:self->_metal];
  if (v8)
  {
    int v17 = v8;
    goto LABEL_27;
  }
  int v9 = +[RawDFLumaSharpenStage prewarmShaders:self->_metal];
  if (v9)
  {
    int v17 = v9;
    goto LABEL_27;
  }
  int v10 = +[RawDFZoomStage prewarmShaders:self->_metal];
  if (v10)
  {
    int v17 = v10;
    goto LABEL_27;
  }
  int v11 = +[RawDFFlickerDetectorStage prewarmShaders:self->_metal];
  if (v11)
  {
    int v17 = v11;
    goto LABEL_27;
  }
  int v12 = +[LearnedNRNetworkStage prewarmShaders:self->_metal];
  if (v12)
  {
    int v17 = v12;
    goto LABEL_27;
  }
  int v13 = +[RawDFNetworkStage prewarmShaders:self->_metal];
  if (v13)
  {
    int v17 = v13;
    goto LABEL_27;
  }
  int v14 = +[RawDFCommon prewarmShaders:self->_metal];
  if (v14)
  {
    int v17 = v14;
    goto LABEL_27;
  }
  int v15 = +[PyramidStage prewarmShaders:self->_metal];
  if (v15)
  {
    int v17 = v15;
    goto LABEL_27;
  }
  int v16 = +[DenoiseRemixStage prewarmShaders:self->_metal tuningParameters:v4 plistEntryName:@"DeepFusionParameters"];
  if (v16)
  {
    int v17 = v16;
    goto LABEL_27;
  }
  int v17 = +[RawDFPostDemosaicStage prewarmShaders:self->_metal];
  if (v17) {
LABEL_27:
  }
    FigDebugAssert3();

  return v17;
}

- (int)applyOverrides
{
  return 0;
}

- (int)_parseSyntheticReferenceMetadata:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (!v4
    || ([v4 objectForKeyedSubscript:@"HasEVM"],
        (int v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    int v10 = -73412;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_19;
  }
  int v7 = v6;
  self->_hasEVM = [v6 BOOLValue];
  +[RawDFColorMatchStage resetColorAdjustment:&self->_anon_198[4]];
  if (self->_hasEVM)
  {
    int v8 = [v5 objectForKeyedSubscript:@"DetectorsOutput"];

    if (!v8)
    {
      v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
      int v10 = -73412;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      goto LABEL_19;
    }
    int v9 = [v5 objectForKeyedSubscript:@"DetectorsOutput"];
    int v10 = +[RawDFDetectors unpackDetectorsOutput:&self->_detectors.motionDetectionScore fromDictionary:v9];

    if (v10)
    {
      FigDebugAssert3();
      goto LABEL_19;
    }
    self->_dsrMode = LODWORD(self->_detectors.motionDetectionScore) == 1;
  }
  else
  {
    +[RawDFDetectors resetDetectorsOutput:&self->_detectors.motionDetectionScore];
    self->_dsrMode = 0;
  }
  uint64_t v11 = MEMORY[0x263EF89A0];
  long long v12 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  *(_OWORD *)self->_anon_120 = *MEMORY[0x263EF89A0];
  *(_OWORD *)&self->_anon_120[16] = v12;
  *(_OWORD *)&self->_anon_120[32] = *(_OWORD *)(v11 + 32);
  if (self->_hasEVM)
  {
    int v13 = [v5 objectForKeyedSubscript:@"EVMHomographyOriginalBeforeZoomUpdate"];
    unpackHomographyFromNSArray();
    *(_DWORD *)&self->_anon_150[8] = v14;
    *(_DWORD *)&self->_anon_150[24] = v15;
    *(void *)self->_anon_150 = v16;
    *(void *)&self->_anon_150[16] = v17;
    *(_DWORD *)&self->_anon_150[40] = v18;
    *(void *)&self->_anon_150[32] = v19;
    if (v13)
    {
      if (!self->_dsrMode) {
        goto LABEL_12;
      }
      uint64_t v20 = [v5 objectForKeyedSubscript:@"EVMHomographyAfterZoomUpdate"];

      unpackHomographyFromNSArray();
      *(_DWORD *)&self->_anon_120[8] = v21;
      *(void *)self->_anon_120 = v22;
      *(_DWORD *)&self->_anon_120[24] = v23;
      *(void *)&self->_anon_120[16] = v24;
      *(_DWORD *)&self->_anon_120[40] = v25;
      int v13 = (void *)v20;
      *(void *)&self->_anon_120[32] = v26;
      if (v20)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v10 = -73412;
LABEL_19:

    goto LABEL_14;
  }
LABEL_13:
  self->_runDetectors = 0;

  int v10 = 0;
LABEL_14:

  return v10;
}

- (int)_preprocessSyntheticReferenceFrame
{
  objc_super v3 = [(RawDFDeferredFrames *)self->_inputFrames syntheticReferenceFrame];
  id v4 = v3;
  if (!v3) {
    goto LABEL_15;
  }
  int v5 = [v3 metadata];

  if (!v5) {
    goto LABEL_15;
  }
  int v6 = [v4 metadata];
  int FrameMetadata = [(DeepFusionProcessor *)self _parseSyntheticReferenceMetadata:v6];

  if (FrameMetadata)
  {
    FigDebugAssert3();
    goto LABEL_11;
  }
  if (!self->_hasEVM)
  {
    sifrMetadata = self->_sifrMetadata;
    self->_sifrMetadata = 0;

    int FrameMetadata = 0;
    goto LABEL_11;
  }
  int v8 = [v4 metadata];
  int v9 = [v8 objectForKeyedSubscript:@"SifrMetadata"];

  if (!v9)
  {
LABEL_15:
    int v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    int FrameMetadata = -73411;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_9;
  }
  int v10 = self->_sifrMetadata;
  if (!v10)
  {
    uint64_t v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    int FrameMetadata = -73411;
LABEL_18:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_9;
  }
  uint64_t v11 = [v4 baseTex];
  unint64_t v12 = [v11 width];
  int v13 = [v4 baseTex];
  int FrameMetadata = loadFrameMetadata(v9, v10, v12, [v13 height], objc_msgSend(v4, "sensorWidth"), objc_msgSend(v4, "sensorHeight"), 1, 0);

  if (FrameMetadata)
  {
    uint64_t v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    goto LABEL_18;
  }
  int FrameMetadata = [v4 getGDCParametersWithCameraInfoByPortType:self->_output withMetadata:v9];
LABEL_9:

LABEL_11:
  return FrameMetadata;
}

- (id)_getAttachedSyntheticReferenceMetadata
{
  v2 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  objc_super v3 = [v2 metadata];
  id v4 = [v3 objectForKeyedSubscript:@"SyntheticReference"];

  return v4;
}

- (int)_getGyroMotionScoreFromMetadata:(id)a3 gyroScore:(float *)a4
{
  v15[20] = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = v5;
  if (v5
    && a4
    && (*a4 = 0.0,
        [v5 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]],
        (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v8 = v7;
    int v9 = portIndexFromPortType();
    if (v9)
    {
      int v12 = v9;
      FigDebugAssert3();
      uint64_t v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      int v10 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2F5D0]];
      [v10 floatValue];

      v15[0] = v6;
      uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
      int v12 = FigMotionComputeBlurScores();
      if (v12)
      {
        FigDebugAssert3();
        int v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
  }
  else
  {
    int v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    int v12 = -73414;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  return v12;
}

- (int)_processSyntheticReferenceMetadataFromReferenceEV0
{
  objc_super v3 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  id v4 = v3;
  if (v3 && ([v3 metadata], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    int v6 = [(DeepFusionProcessor *)self _getAttachedSyntheticReferenceMetadata];
    int v7 = [(DeepFusionProcessor *)self _parseSyntheticReferenceMetadata:v6];

    if (v7) {
      FigDebugAssert3();
    }
    else {
      LOBYTE(self->_darkestFrameMetadata) = 1;
    }
  }
  else
  {
    int v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    int v7 = -73408;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v7;
}

- (int)_allocateAndUnpackSyntheticReferenceFrame:(id)a3
{
  id v4 = a3;
  id v5 = [(RawDFDeferredFrames *)self->_inputFrames syntheticReferenceFrame];
  int v6 = v5;
  if (!v5 || !*(void *)&self->_useRegwarpCPU)
  {
    int v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    int v11 = -73421;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_14:

    goto LABEL_8;
  }
  int v7 = [v5 allocateRGB];
  if (v7)
  {
    int v11 = v7;
    goto LABEL_12;
  }
  int v8 = *(void **)&self->_useRegwarpCPU;
  int v9 = [v6 baseTex];
  int v10 = [v6 rgbTex];
  int v11 = [v8 unpackSyntheticReference:v9 toOutputTex:v10];

  if (v11)
  {
LABEL_12:
    FigDebugAssert3();
    goto LABEL_8;
  }
  int v12 = [v6 rgbTex];
  FigMetalIncRef();
  [v4 setOutputSyntheticReference:v12];
  [v6 releaseRgbTex];
  int v13 = [(RawDFDeferredFrames *)self->_inputFrames syntheticReferenceFusionMap];

  if (!v13
    || ([(RawDFDeferredFrames *)self->_inputFrames syntheticReferenceFusionMap],
        int v14 = objc_claimAutoreleasedReturnValue(),
        [v14 baseTex],
        int v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        !v15))
  {
    uint64_t v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    int v11 = -73421;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_14;
  }
  uint64_t v16 = [(RawDFDeferredFrames *)self->_inputFrames syntheticReferenceFusionMap];
  uint64_t v17 = [v16 baseTex];
  [v4 setFusionMap:v17];

  int v11 = 0;
LABEL_8:

  return v11;
}

- (int)_ensureSyntheticReferenceIsUnpacked:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    int v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v7 = -73417;
    goto LABEL_8;
  }
  int v6 = [v4 outputSyntheticReference];

  if (!v6)
  {
    int v8 = [(RawDFDeferredFrames *)self->_inputFrames syntheticReferenceFrame];

    if (v8)
    {
      int v7 = [(DeepFusionProcessor *)self _allocateAndUnpackSyntheticReferenceFrame:v5];
      if (!v7) {
        goto LABEL_8;
      }
    }
    else
    {
      int v7 = [(DeepFusionProcessor *)self generateSyntheticReference:v5];
      if (!v7) {
        goto LABEL_8;
      }
    }
    FigDebugAssert3();
    goto LABEL_8;
  }
  int v7 = 0;
LABEL_8:

  return v7;
}

- (int)_processInferenceImage:(__CVBuffer *)a3 inferenceFrameType:(int)a4 sourceFrameLumaChromaImage:(id)a5 sourceFrameProperties:(id)a6 ltcFrameProperties:(id)a7 gtcFrameProperties:(id)a8 originalWidth:(unint64_t)a9 originalHeight:(unint64_t)a10
{
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = v19;
  if (a3 && v16 && v17 && v18 && v19)
  {
    unsigned int v27 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tuningParameters);
    id v28 = v16;
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      uint64_t v22 = [[LumaChromaImage alloc] initWithContext:self->_metal pixelBuffer:a3 lumaAlignmentFactor:1 chromaAlignmentFactor:1];
      if (v22)
      {
        int v23 = objc_opt_new();
        int v24 = [(GainMapStage *)self->_gainMapStage processInferenceImage:a3 inferenceMetadata:v23 sourceFrameLumaChromaImage:v28 sourceFrameProperties:v17 ltcFrameProperties:v18 gtcFrameProperties:v20 originalWidth:a9 originalHeight:a10 post:self->_rawDFCommon];
        if (!v24) {
          [WeakRetained processor:self outputReadyWithBufferType:v27 outputPixelBuffer:a3 outputMetadata:v23 error:0];
        }
      }
      else
      {
        FigDebugAssert3();
        int v23 = 0;
        int v24 = -12786;
      }
    }
    else
    {
      FigDebugAssert3();
      uint64_t v22 = 0;
      int v23 = 0;
      int v24 = -12784;
    }

    id v16 = v28;
  }
  else
  {
    uint64_t v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    int v24 = -73410;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v24;
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

- (int)generateSyntheticReference:(id)a3
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (self->_hasEVM)
  {
    int v6 = [(DeepFusionProcessor *)self generateSyntheticReferenceWithSIFR:v5];
    goto LABEL_13;
  }
  int v7 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  int v8 = [v7 rgbTex];

  if (!v8)
  {
    int v9 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
    int v6 = [(DeepFusionProcessor *)self _demosaicAndProcessFrame:v9 withWarpFrame:0];

    if (v6)
    {
      uint64_t v98 = v3;
      LODWORD(v96) = v6;
      FigDebugAssert3();
LABEL_85:
      int v33 = 0;
      int v30 = 0;
      goto LABEL_61;
    }
  }
  if (LOBYTE(self->_ltmMetadata))
  {
    colorConvertStage = self->_colorConvertStage;
    int v11 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
    uint64_t v12 = [(ColorConvertStage *)colorConvertStage calculateLTMOnEV0Frame:v11 evmFrame:0];
    int v13 = *(void **)&self->_processingMode;
    *(void *)&self->_processingMode = v12;

    if (!*(void *)&self->_processingMode)
    {
      int v33 = 0;
      int v30 = 0;
      int v6 = 0;
      goto LABEL_61;
    }
  }
  int v14 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  int v15 = [v14 pyramid];

  if (!v15)
  {
    long long v92 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT);
    int v6 = -73393;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    id v16 = 0;
    goto LABEL_84;
  }
  id v16 = objc_opt_new();
  id v17 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  id v18 = [v17 rgbTex];
  objc_msgSend(v16, "setWidth:", objc_msgSend(v18, "width"));

  id v19 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  uint64_t v20 = [v19 rgbTex];
  objc_msgSend(v16, "setHeight:", objc_msgSend(v20, "height"));

  [v16 setType:0];
  [v16 setLevelCount:2];
  int v21 = [v15 configureWithDescriptor:v16];
  if (v21) {
    goto LABEL_75;
  }
  uint64_t v22 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  int v23 = [v22 rgbTex];
  int v6 = [v15 setTexture:v23 atLevel:0];

  if (v6)
  {
LABEL_84:

    goto LABEL_85;
  }
  int v21 = [v15 allocateWithLabel:0];
  if (v21)
  {
LABEL_75:
    int v6 = v21;
    goto LABEL_84;
  }
  int v6 = [v15 generate];
  if (v6) {
    goto LABEL_84;
  }

  int v24 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  int v25 = [v24 rgbTex];

  FigMetalIncRef();
  [v5 setOutputSyntheticReference:v25];
  uint64_t v26 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  [v26 releaseRgbTex];

  [v5 setFusionMap:0];
LABEL_13:
  if (self->_inferenceResultsBindings.skinMask) {
    BOOL v27 = 0;
  }
  else {
    BOOL v27 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties inferenceInputPixelBuffer] != 0;
  }
  uint64_t v28 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties gainMapOutputPixelBuffer];
  inputFrames = self->_inputFrames;
  if (self->_dsrMode) {
    [(RawDFDeferredFrames *)inputFrames sifrFrame];
  }
  else {
  int v30 = [(RawDFDeferredFrames *)inputFrames referenceEv0Frame];
  }
  int v31 = self->_inputFrames;
  if (self->_hasEVM) {
    [(RawDFDeferredFrames *)v31 sifrFrame];
  }
  else {
  uint64_t v32 = [(RawDFDeferredFrames *)v31 referenceEv0Frame];
  }
  int v33 = (void *)v32;
  if (!v30)
  {
    v88 = (void *)v32;
    v89 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT);
    int v6 = -73393;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v30 = 0;
    int v33 = v88;
    goto LABEL_61;
  }
  if (!v32)
  {
    v90 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT);
    int v6 = -73393;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v33 = 0;
    goto LABEL_61;
  }
  if (v28) {
    int v34 = 1;
  }
  else {
    int v34 = v27;
  }
  if (v34 == 1)
  {
    uint64_t v35 = [v5 outputSyntheticReference];
    v104 = (void *)v35;
    if (!v35)
    {
      uint64_t v91 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT);
      int v6 = -73393;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      unsigned int v57 = 0;
      int v46 = 0;
      goto LABEL_50;
    }
    uint64_t v36 = v35;
    v107 = objc_opt_new();
    uint64_t v37 = objc_opt_new();
    if (v27)
    {
      unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane((CVPixelBufferRef)[(IBPSemanticStyleProperties *)self->_semanticStyleProperties inferenceInputPixelBuffer], 0);
      unint64_t v39 = __PAIR64__(CVPixelBufferGetHeightOfPlane((CVPixelBufferRef)[(IBPSemanticStyleProperties *)self->_semanticStyleProperties inferenceInputPixelBuffer], 0), WidthOfPlane);
    }
    else
    {
      unint64_t v39 = 0;
    }
    double v102 = *(double *)&v39;
    v105 = v5;
    v106 = (void *)v37;
    if (v28 && !self->_calculateLTM)
    {
      unsigned int v41 = CVPixelBufferGetWidthOfPlane((CVPixelBufferRef)[(IBPSemanticStyleProperties *)self->_semanticStyleProperties gainMapOutputPixelBuffer], 0);
      unint64_t v40 = __PAIR64__(CVPixelBufferGetHeightOfPlane((CVPixelBufferRef)[(IBPSemanticStyleProperties *)self->_semanticStyleProperties gainMapOutputPixelBuffer], 0), v41);
    }
    else
    {
      unint64_t v40 = 0;
    }
    double v100 = *(double *)&v40;
    demosaicStage = self->_demosaicStage;
    v43 = [v30 rgbTex];
    v44 = [v30 metadata];
    v45 = demosaicStage;
    int v46 = v107;
    int v6 = [(CMIDemosaicStage *)v45 createSourceTexturesForInference:v107 band0InferenceSourceTexture:v36 outputInferenceSize:v106 gainMap:v43 band0GainMapSourceTexture:v44 outputGainMapSize:self->_draftDemosaicStage sourceMetadata:v102 demosaicStage:v100 downSampleStage:self->_rawDFColorMatchStage];

    if (v6)
    {
      unsigned int v57 = v106;
      goto LABEL_49;
    }
    v47 = (_DWORD *)MEMORY[0x263F00E10];
    if (v27)
    {
      if (*MEMORY[0x263F00E10] == 1) {
        kdebug_trace();
      }
      uint64_t v103 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties inferenceInputPixelBuffer];
      uint64_t v48 = [v33 properties];
      long long v99 = v33;
      int v49 = [v33 properties];
      unsigned int v50 = [v30 properties];
      unsigned int v51 = [v30 pyramid];
      unsigned int v52 = [v51 getTextureAtLevel:0];
      uint64_t v53 = [v52 width];
      v101 = v30;
      unsigned int v54 = [v30 pyramid];
      unsigned int v55 = [v54 getTextureAtLevel:0];
      uint64_t v97 = v53;
      unsigned int v56 = (void *)v48;
      int v6 = -[DeepFusionProcessor _processInferenceImage:inferenceFrameType:sourceFrameLumaChromaImage:sourceFrameProperties:ltcFrameProperties:gtcFrameProperties:originalWidth:originalHeight:](self, "_processInferenceImage:inferenceFrameType:sourceFrameLumaChromaImage:sourceFrameProperties:ltcFrameProperties:gtcFrameProperties:originalWidth:originalHeight:", v103, 10, v107, v48, v49, v50, v97, [v55 height]);

      if (v6)
      {
        id v5 = v105;
        unsigned int v57 = v106;
        int v33 = v99;
        int v30 = v101;
        int v46 = v107;
        goto LABEL_50;
      }
      v47 = (_DWORD *)MEMORY[0x263F00E10];
      unsigned int v57 = v106;
      if (*MEMORY[0x263F00E10] == 1) {
        kdebug_trace();
      }
      int v33 = v99;
      int v30 = v101;
      int v46 = v107;
      if (v107)
      {
        FigMetalDecRef();
        FigMetalDecRef();

        int v46 = 0;
      }
      if (!v28)
      {
LABEL_46:
        if (!v57)
        {
LABEL_48:
          int v6 = 0;
LABEL_49:
          id v5 = v105;
LABEL_50:

          goto LABEL_61;
        }
LABEL_47:
        FigMetalDecRef();
        FigMetalDecRef();

        unsigned int v57 = 0;
        goto LABEL_48;
      }
    }
    else
    {
      unsigned int v57 = v106;
      if (!v28) {
        goto LABEL_46;
      }
    }
    id v58 = v33;
    if (*v47 == 1) {
      kdebug_trace();
    }
    uint64_t v108 = v46;
    if (self->_dfPlist->gainMap
      && ([v105 outputSyntheticReference],
          int v59 = objc_claimAutoreleasedReturnValue(),
          v59,
          v59)
      && CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[(IBPSemanticStyleProperties *)self->_semanticStyleProperties gainMapOutputPixelBuffer]) == 1278226488&& ([(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:[(IBPSemanticStyleProperties *)self->_semanticStyleProperties gainMapOutputPixelBuffer] pixelFormat:10 usage:6 plane:0], (uint64_t v60 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int v61 = (void *)v60;
      if (self->_calculateLTM)
      {
        memset(v109, 0, sizeof(v109));
        rawDFPostDemosaicStage = self->_rawDFPostDemosaicStage;
        gainMap = self->_dfPlist->gainMap;
        v64 = [v33 properties];
        long long v65 = [v64 meta];
        -[RawDFPostDemosaicStage setGainMapConfig:tuning:frameMetadata:width:height:isLinear:](rawDFPostDemosaicStage, "setGainMapConfig:tuning:frameMetadata:width:height:isLinear:", v109, gainMap, v65, [v61 width], objc_msgSend(v61, "height"), 1);

        int v33 = v58;
        long long v66 = self->_rawDFPostDemosaicStage;
        long long v67 = [v58 properties];
        int v6 = [(RawDFPostDemosaicStage *)v66 computeGainMapWithInput:v104 secondInput:0 output:v61 properties:v67 mpconfig:v109];

        if (v6)
        {

          id v5 = v105;
          goto LABEL_61;
        }
        float v80 = 1.0;
        unsigned int v57 = v106;
        int v46 = v108;
LABEL_69:
        *(float *)&self->_rawDFSoftLTMMode = v80 * 4.0;
        if (*v47 == 1) {
          kdebug_trace();
        }

        if (!v57) {
          goto LABEL_48;
        }
        goto LABEL_47;
      }
      uint64_t v76 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];

      float v80 = 1.0;
      if (v30 == v76)
      {
        float estGainScaling = self->_dfPlist->gainMap->estGainScaling;
        v82 = [v30 properties];
        id v83 = [v82 meta];
        float v84 = fmaxf(estGainScaling * estimateLTMSoftGainFromFrameProperties(v83, 0), 1.0);

        float v80 = v84 * 0.25;
      }
      if (v57 && (v85 = v57[2], int v46 = v108, v85))
      {
        int v86 = self->_dfPlist->gainMap;
        *(float *)&double v77 = v86->minThreshold;
        *(float *)&double v78 = v86->maxThreshold;
        *(float *)&double v79 = v80;
        int v87 = [(RawDFPostDemosaicStage *)self->_rawDFPostDemosaicStage runWithInput:v85 output:v61 minThreshold:1 maxThreshold:v77 inputIsLinear:v78 inputScaling:v79];
        if (!v87) {
          goto LABEL_69;
        }
        int v6 = v87;
        id v5 = v105;
      }
      else
      {
        uint64_t v94 = v30;
        id v5 = v105;
        uint64_t v95 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT);
        int v6 = -73393;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        int v30 = v94;
        unsigned int v57 = v106;
        int v46 = v108;
      }
    }
    else
    {
      uint64_t v93 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT);
      id v5 = v105;
      int v6 = -73393;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      int v61 = 0;
      int v46 = v108;
    }

    goto LABEL_50;
  }
LABEL_61:
  long long v68 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  long long v69 = [v68 pyramid];
  [v69 releaseAll];

  long long v70 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  [v70 releaseRgbTex];

  long long v71 = [(RawDFDeferredFrames *)self->_inputFrames sifrFrame];
  long long v72 = [v71 pyramid];
  [v72 releaseAll];

  int v73 = [(RawDFDeferredFrames *)self->_inputFrames sifrFrame];
  [v73 releaseRgbTex];

  unsigned int v74 = [(RawDFDeferredFrames *)self->_inputFrames sifrFrame];
  [v74 releaseBaseTex];

  return v6;
}

- (void)setFusionMode:(int)a3
{
  self->_fusionMode = a3;
}

- (void)reportFusionReferenceFrame:(int)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tuningParameters);
  if (a3 == 1) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  [(IBPSemanticStyleProperties *)self->_semanticStyleProperties setFusionMode:v5];
  if (objc_opt_respondsToSelector()) {
    [WeakRetained processor:self didSelectFusionMode:v5];
  }
}

- (int)generateSyntheticReferenceWithSIFR:(id)a3
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  int v6 = [(RawDFDeferredFrames *)self->_inputFrames sifrFrame];
  int v7 = v6;
  if (!v4
    || !v5
    || !v6
    || !*(void *)&self->_applyColorCubeFixOverride
    || ([v6 properties],
        int v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 hasValidRegistration],
        v8,
        (v9 & 1) == 0))
  {
    int v121 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v98 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT);
    int v67 = -73392;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_80:
    v75 = 0;
    int v38 = 0;
    unsigned int v118 = 0;
LABEL_81:
    uint64_t v37 = 0;
    goto LABEL_76;
  }
  if (!self->_runDetectors) {
    goto LABEL_25;
  }
  int v10 = [v5 rgbTex];

  if (!v10)
  {
    int v11 = [(DeepFusionProcessor *)self _demosaicAndProcessFrame:v5 withWarpFrame:0];
    if (v11)
    {
      int v67 = v11;
      goto LABEL_98;
    }
    [v5 releaseBaseTex];
  }
  int v12 = [(DeepFusionProcessor *)self _demosaicAndProcessFrame:v7 withWarpFrame:0];
  if (v12)
  {
    int v67 = v12;
LABEL_98:
    FigDebugAssert3();
    goto LABEL_80;
  }
  [v7 releaseBaseTex];
  int fusionMode = self->_fusionMode;
  if (fusionMode == 2) {
    int v14 = 1;
  }
  else {
    int v14 = -1;
  }
  if (fusionMode == 1) {
    int v15 = 0;
  }
  else {
    int v15 = v14;
  }
  LODWORD(v122) = v15;
  if (v15 == -1) {
    id v16 = 0;
  }
  else {
    id v16 = &v122;
  }
  int v17 = +[RawDFDetectors runDetectorsToOutput:&self->_detectors.motionDetectionScore withRequestedSyntheticReferenceMode:v16 withEv0:v5 withEvm:v7 withSRTuning:self->_dfPlist->syntheticReference withDownSampleStage:self->_rawDFColorMatchStage withColorMatchStage:self->_rawDFSyntheticReferenceStage withMotionDetection:self->_grayGhostDetection withgrayGhostDetection:self->_flickerDetection withFlickerDetection:self->_rawDFDownsampleStage];
  if (v17)
  {
    int v67 = v17;
    goto LABEL_80;
  }
  uint64_t motionDetectionScore_low = LODWORD(self->_detectors.motionDetectionScore);
  anon_120 = self->_anon_120;
  if (motionDetectionScore_low == 1)
  {
    uint64_t v20 = [v7 properties];
    int v21 = (_OWORD *)[v20 regHomography];
    long long v23 = v21[1];
    long long v22 = v21[2];
    *(_OWORD *)anon_120 = *v21;
    *(_OWORD *)&self->_anon_120[16] = v23;
    *(_OWORD *)&self->_anon_120[32] = v22;

    uint64_t motionDetectionScore_low = LODWORD(self->_detectors.motionDetectionScore);
    BOOL v24 = 1;
  }
  else
  {
    BOOL v24 = 0;
    uint64_t v25 = MEMORY[0x263EF89A0];
    long long v26 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
    *(_OWORD *)anon_120 = *MEMORY[0x263EF89A0];
    *(_OWORD *)&self->_anon_120[16] = v26;
    *(_OWORD *)&self->_anon_120[32] = *(_OWORD *)(v25 + 32);
  }
  self->_dsrMode = v24;
  [(DeepFusionProcessor *)self reportFusionReferenceFrame:motionDetectionScore_low];
LABEL_25:
  if (LOBYTE(self->_ltmMetadata))
  {
    colorConvertStage = self->_colorConvertStage;
    uint64_t v28 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
    uint64_t v29 = [(ColorConvertStage *)colorConvertStage calculateLTMOnEV0Frame:v28 evmFrame:0];
    int v30 = *(void **)&self->_processingMode;
    *(void *)&self->_processingMode = v29;

    if (!*(void *)&self->_processingMode)
    {
      v75 = 0;
      int v38 = 0;
      unsigned int v118 = 0;
      uint64_t v37 = 0;
      int v67 = 0;
      goto LABEL_76;
    }
  }
  float motionDetectionScore = self->_detectors.motionDetectionScore;
  unint64_t v31 = [v5 width];
  uint64_t v32 = [v5 height];
  uint64_t v33 = v32;
  if (dword_26B430EE8)
  {
    id v34 = v4;
    uint64_t v35 = v32;
    int v121 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v36 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v33 = v35;
    id v4 = v34;
  }
  uint64_t v37 = objc_msgSend(v5, "pyramid", v103, v104);
  unsigned int v118 = [v7 pyramid];
  if (!v37)
  {
    int v121 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    long long v99 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT);
    int v67 = -73392;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v75 = 0;
    int v38 = 0;
    goto LABEL_81;
  }
  if (!v118)
  {
    int v121 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    double v100 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT);
    int v67 = -73392;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v75 = 0;
    int v38 = 0;
    unsigned int v118 = 0;
    goto LABEL_76;
  }
  int v38 = objc_opt_new();
  [v38 setWidth:v31];
  [v38 setHeight:v33];
  [v38 setType:0];
  int v115 = v38;
  unsigned int v116 = v37;
  unint64_t v114 = v33;
  if (motionDetectionScore != 0.0)
  {
    [v38 setLevelCount:4];
    int v39 = [v37 configureWithDescriptor:v38];
    if (v39) {
      goto LABEL_78;
    }
    int v39 = [v118 configureWithDescriptor:v38];
    if (v39) {
      goto LABEL_78;
    }
    if (self->_runDetectors)
    {
      id v105 = v4;
      unint64_t v40 = [v7 rgbTex];
      [v118 setTexture:v40 atLevel:0];

      [v7 releaseRgbTex];
      unsigned int v41 = [v7 properties];
      int v42 = (simd_float3x3 *)[v41 regHomography];
      v43 = [v5 properties];
      v44 = (float32x4_t *)[v43 regHomography];
      float32x4_t v109 = v44[1];
      float32x4_t v111 = *v44;
      float32x4_t v107 = v44[2];
      simd_float3x3 v127 = __invert_f3(*v42);
      uint64_t v45 = 0;
      v127.columns[0].i32[3] = 0;
      v127.columns[1].i32[3] = 0;
      v127.columns[2].i32[3] = 0;
      simd_float3x3 v125 = v127;
      long long v122 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      do
      {
        *(long long *)((char *)&v122 + v45 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v111, COERCE_FLOAT(*(_OWORD *)&v125.columns[v45])), v109, *(float32x2_t *)v125.columns[v45].f32, 1), v107, (float32x4_t)v125.columns[v45], 2);
        ++v45;
      }
      while (v45 != 3);
      double v110 = *(double *)&v123;
      double v112 = *(double *)&v122;
      double v108 = *(double *)&v124;

      int v46 = [v37 allocateLevel:0 withLabel:0];
      if (v46)
      {
        int v67 = v46;
        v75 = 0;
LABEL_102:
        id v4 = v105;
        goto LABEL_76;
      }
      v47 = v38;
      rawDFInferenceGen = self->_rawDFInferenceGen;
      int v49 = [v5 rgbTex];
      uint64_t v50 = [v37 getTextureAtLevel:0];
      unsigned int v51 = v5;
      unsigned int v52 = (void *)v50;
      if (BYTE2(self->_quadraMotionScore))
      {
        uint64_t v53 = v51;
        uint64_t v54 = [v51 gdcParameters];
        if (BYTE2(self->_quadraMotionScore))
        {
          uint64_t v55 = [v7 gdcParameters];
LABEL_52:
          int v67 = -[RawDFInferenceGen runWarpUsingTransform:inputTex:outputTex:inputFrameGDCParams:outputFrameGDCParams:](rawDFInferenceGen, "runWarpUsingTransform:inputTex:outputTex:inputFrameGDCParams:outputFrameGDCParams:", v49, v52, v54, v55, v112, v110, v108);

          if (!v67)
          {
            uint64_t v5 = v53;
            [v53 releaseRgbTex];
            int v38 = v47;
            id v4 = v105;
LABEL_60:
            if (motionDetectionScore != 0.0)
            {
              rawDFSyntheticReferenceStage = self->_rawDFSyntheticReferenceStage;
              int v73 = [v118 getTextureAtLevel:0];
              [(RawDFSyntheticReferenceStage *)rawDFSyntheticReferenceStage applyColorAdjustmentInplaceWithTexture:v73 withColorAdjustment:&self->_anon_198[4]];
            }
            goto LABEL_66;
          }
          v75 = 0;
          uint64_t v5 = v53;
          goto LABEL_101;
        }
      }
      else
      {
        uint64_t v53 = v51;
        uint64_t v54 = 0;
      }
      uint64_t v55 = 0;
      goto LABEL_52;
    }
    goto LABEL_48;
  }
  [v38 setLevelCount:2];
  int v39 = [v37 configureWithDescriptor:v38];
  if (v39) {
    goto LABEL_78;
  }
  [v38 setLevelCount:1];
  int v39 = [v118 configureWithDescriptor:v38];
  if (v39) {
    goto LABEL_78;
  }
  if (!self->_runDetectors)
  {
LABEL_48:
    long long v65 = [v5 rgbTex];

    if (v65)
    {
      long long v66 = [v5 rgbTex];
      [v37 setTexture:v66 atLevel:0];

      [v5 releaseRgbTex];
    }
    else
    {
      int v39 = [v37 allocateLevel:0 withLabel:0];
      if (v39) {
        goto LABEL_78;
      }
      id v105 = v4;
      v47 = v38;
      long long v68 = [v5 pyramid];
      [v68 getTextureAtLevel:0];
      v70 = long long v69 = v5;
      int v67 = [(DeepFusionProcessor *)self _demosaicAndProcessFrame:v69 toTexture:v70 withWarpFrame:LODWORD(motionDetectionScore) != 0];

      if (v67)
      {
        FigDebugAssert3();
        v75 = 0;
        uint64_t v5 = v69;
        uint64_t v37 = v116;
LABEL_101:
        int v38 = v47;
        goto LABEL_102;
      }
      [v69 releaseBaseTex];
      uint64_t v5 = v69;
      uint64_t v37 = v116;
      int v38 = v47;
      id v4 = v105;
    }
    int v39 = [v118 allocateLevel:0 withLabel:0];
    if (!v39)
    {
      long long v71 = [v118 getTextureAtLevel:0];
      int v67 = [(DeepFusionProcessor *)self _demosaicAndProcessFrame:v7 toTexture:v71 withWarpFrame:LODWORD(motionDetectionScore) == 0];

      if (v67)
      {
        FigDebugAssert3();
        v75 = 0;
        goto LABEL_96;
      }
      [v7 releaseBaseTex];
      uint64_t v37 = v116;
      goto LABEL_60;
    }
LABEL_78:
    int v67 = v39;
LABEL_95:
    v75 = 0;
    goto LABEL_76;
  }
  unsigned int v56 = [v5 rgbTex];
  [v37 setTexture:v56 atLevel:0];

  [v5 releaseRgbTex];
  int v39 = [v118 allocateLevel:0 withLabel:0];
  if (v39) {
    goto LABEL_78;
  }
  unsigned int v57 = v5;
  id v106 = v4;
  id v58 = self->_rawDFInferenceGen;
  int v59 = [v7 properties];
  uint64_t v60 = (double *)[v59 regHomography];
  int v61 = [v7 rgbTex];
  uint64_t v62 = [v118 getTextureAtLevel:0];
  if (!BYTE2(self->_quadraMotionScore))
  {
    uint64_t v63 = 0;
    goto LABEL_63;
  }
  uint64_t v63 = [v7 gdcParameters];
  if (!BYTE2(self->_quadraMotionScore))
  {
LABEL_63:
    uint64_t v64 = 0;
    goto LABEL_64;
  }
  uint64_t v64 = [v57 gdcParameters];
LABEL_64:
  int v67 = -[RawDFInferenceGen runWarpUsingTransform:inputTex:outputTex:inputFrameGDCParams:outputFrameGDCParams:](v58, "runWarpUsingTransform:inputTex:outputTex:inputFrameGDCParams:outputFrameGDCParams:", v61, v62, v63, v64, *v60, v60[2], v60[4]);

  if (v67)
  {
    v75 = 0;
    id v4 = v106;
    uint64_t v5 = v57;
    goto LABEL_88;
  }
  [v7 releaseRgbTex];
  id v4 = v106;
  uint64_t v5 = v57;
  int v38 = v115;
  uint64_t v37 = v116;
LABEL_66:
  unsigned int v74 = [(FigMetalContext *)self->_metal allocator];
  v75 = (void *)[v74 newTextureDescriptor];

  if (!v75)
  {
    int v121 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v101 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT);
    int v67 = -73392;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_95;
  }
  v113 = v7;
  uint64_t v76 = [v75 desc];
  [v76 setWidth:v31];

  double v77 = [v75 desc];
  [v77 setHeight:v114];

  double v78 = [v75 desc];
  [v78 setPixelFormat:115];

  double v79 = [v75 desc];
  [v79 setUsage:7];

  [v75 setLabel:0];
  float v80 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v81 = (void *)[v80 newTextureWithDescriptor:v75];
  [v4 setOutputSyntheticReference:v81];

  v82 = [v4 outputSyntheticReference];

  if (!v82) {
    goto LABEL_85;
  }
  id v83 = [v75 desc];
  [v83 setWidth:v31 >> 1];

  float v84 = [v75 desc];
  [v84 setHeight:v114 >> 1];

  uint64_t v85 = [v75 desc];
  [v85 setPixelFormat:10];

  int v86 = [v75 desc];
  [v86 setUsage:7];

  [v75 setLabel:0];
  int v87 = [(FigMetalContext *)self->_metal allocator];
  v88 = (void *)[v87 newTextureWithDescriptor:v75];
  [v4 setFusionMap:v88];

  v89 = [v4 fusionMap];

  if (!v89)
  {
LABEL_85:
    int v121 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    double v102 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT);
    int v67 = -73392;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_96:
    uint64_t v37 = v116;
    goto LABEL_76;
  }
  int v90 = [v37 allocateWithLabel:0];
  if (v90
    || (int v90 = [v118 allocateWithLabel:0]) != 0
    || (int v90 = [v37 generate]) != 0
    || (int v90 = [v118 generate]) != 0)
  {
    int v67 = v90;
    goto LABEL_76;
  }
  memset(v119, 0, sizeof(v119));
  uint64_t v91 = [v7 properties];
  long long v92 = v5;
  uint64_t v93 = [v5 properties];
  int v67 = +[RawDFSyntheticReferenceStage fillFrameProperties:v119 withEvmProperties:v91 withEv0Properties:v93];

  if (v67)
  {
    uint64_t v5 = v92;
    int v7 = v113;
LABEL_88:
    uint64_t v37 = v116;
    goto LABEL_75;
  }
  rawDFSyntheticReferenceUnpackStage = self->_rawDFSyntheticReferenceUnpackStage;
  uint64_t v95 = [v4 outputSyntheticReference];
  uint64_t v96 = [v4 fusionMap];
  int v67 = [(RawDFSyntheticReferenceUnpackStage *)rawDFSyntheticReferenceUnpackStage genereteSyntheticReference:v95 noiseDivisorOutputTex:v96 mode:LODWORD(motionDetectionScore) lscGainsTex:*(void *)&self->_applyColorCubeFixOverride evmPyramid:v118 ev0Pyramid:v116 frameProperties:v119 tuning:self->_dfPlist->syntheticReference];

  uint64_t v37 = v116;
  uint64_t v5 = v92;
  int v7 = v113;
LABEL_75:
  int v38 = v115;
LABEL_76:

  return v67;
}

- (int)addInputFrameAsExternalAllocator:(id)a3 withSubAllocatorId:(int)a4
{
  id v5 = a3;
  if (![v5 pixelBuffer])
  {
    int v11 = [v5 baseTex];
    IOSurfaceRef IOSurface = (IOSurfaceRef)[v11 iosurface];

    if (IOSurface) {
      goto LABEL_3;
    }
LABEL_8:
    int v10 = 0;
    goto LABEL_9;
  }
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)[v5 pixelBuffer]);
  if (!IOSurface) {
    goto LABEL_8;
  }
LABEL_3:
  int v7 = [(FigMetalContext *)self->_metal device];
  int v8 = (void *)[v7 newBufferWithIOSurface:IOSurface];

  if (v8)
  {
    char v9 = [(FigMetalContext *)self->_metal allocator];
    int v10 = objc_msgSend(v9, "addExternalMetalBuffer:atSubAllocatorID:", v8, objc_msgSend(v5, "uniqueFrameId") + 1);

    if (v10)
    {
      int v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    else
    {
      [v5 releaseBaseTex];
    }
  }
  else
  {
    int v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v10 = -73404;
  }

LABEL_9:
  return v10;
}

- (int)addInputResource:(id)a3 type:(int)a4
{
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)&a4;
  v56[24] = *MEMORY[0x263EF8340];
  char v54 = 0;
  id v8 = a3;
  inputFrames = self->_inputFrames;
  int v10 = [v8 metadata];
  int v11 = [(RawDFDeferredFrames *)inputFrames addFrame:0 inputCMITexture:v8 metadata:v10 frameType:v6 uniqueFrameId:self->_addFrameCount processFrame:&v54];

  if (!v11) {
    goto LABEL_35;
  }
  int v12 = [v11 properties];
  [(DeepFusionProcessor *)self StartKTraceEventForAddFrame:v12];

  if (self->_dfPlist) {
    goto LABEL_14;
  }
  int v13 = [(DeepFusionProcessor *)self getTuningModeForCurrentProcessingMode];
  tuningMode = self->_tuningMode;
  self->_tuningMode = v13;

  if (!self->_tuningMode) {
    goto LABEL_35;
  }
  int v15 = [v11 metadata];
  id v16 = [v15 objectForKeyedSubscript:*MEMORY[0x263F2F668]];
  sensorID = self->_sensorID;
  self->_sensorID = v16;

  if (!self->_sensorID)
  {
LABEL_35:
    v47 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
    int v38 = -73403;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_34;
  }
  id v52 = v8;
  id v18 = -[NSMutableDictionary objectForKeyedSubscript:](self->_tuningParams, "objectForKeyedSubscript:");
  id v19 = [v18 objectForKeyedSubscript:self->_tuningMode];
  uint64_t v20 = [v19 objectForKeyedSubscript:@"Default"];

  int v21 = [(NSMutableDictionary *)self->_tuningParams objectForKeyedSubscript:self->_sensorID];
  long long v22 = [v21 objectForKeyedSubscript:self->_tuningMode];
  uint64_t v53 = [v22 objectForKeyedSubscript:@"Zoom"];

  long long v23 = [v11 properties];
  BOOL v24 = [v23 meta];
  float v25 = 1.0;
  if ([v24 hasZoomRects])
  {
    long long v26 = [v11 properties];
    [v26 meta];
    BOOL v27 = v51 = v20;
    [v27 zoomDstRect];
    double v29 = v28;
    int v30 = [v11 properties];
    unint64_t v31 = [v30 meta];
    [v31 zoomSrcRect];
    float v25 = v29 / v32;

    uint64_t v20 = v51;
  }

  if (v25 <= 1.0) {
    uint64_t v33 = v20;
  }
  else {
    uint64_t v33 = v53;
  }
  objc_storeStrong((id *)&self->_dfPlist, v33);
  if (!self->_dfPlist)
  {
    uint64_t v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
    id v8 = v52;
    int v38 = -73403;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_34;
  }
  v56[0] = v20[17];
  v56[1] = v53[17];
  id v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:2];
  [(SoftLTM *)self->_softLTMStage setTuningParams:v34];
  [(SoftLTM *)self->_softLTMStage setTuningParams:v34];

  v55[0] = v20[11];
  v55[1] = v53[11];
  uint64_t v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
  [(NRFConcurrentProcessing *)self->_concurrentProcessing setTuningParams:v35];

  [(CMIDraftDemosaicStage *)self->_draftDemosaicStage setQdemTuningParams:self->_dfPlist->qdemTuning];
  [(CMIDraftDemosaicStage *)self->_draftDemosaicStage setZimmerDEMTuningParams:self->_dfPlist->zimmerDEMTuning];
  [(GainMapStage *)self->_gainMapStage setToneMappingPlist:self->_dfPlist->toneMapping];
  miwbPlist = self->_dfPlist->miwbPlist;
  id v8 = v52;
  if (miwbPlist) {
    LOBYTE(miwbPlist) = miwbPlist->enableMIWB;
  }
  uint64_t v5 = v4;
  BYTE1(self->_textureUtils) = (_BYTE)miwbPlist;

LABEL_14:
  [v8 releaseAll];
  switch(v6)
  {
    case 9:
      if (LODWORD(self->_delegate) == 2)
      {
        int v39 = (_DWORD *)MEMORY[0x263F00E10];
        if (*MEMORY[0x263F00E10] == 1) {
          kdebug_trace();
        }
        int v40 = [(DeepFusionProcessor *)self _initiateQuadraEVZeroBackgroundProcessing];
        if (v40)
        {
          int v38 = v40;
          uint64_t v50 = v5;
          LODWORD(v49) = v40;
          goto LABEL_32;
        }
        if (*v39 == 1) {
          kdebug_trace();
        }
      }
      break;
    case 5:
      uint64_t v41 = [(DeepFusionProcessor *)self _getAttachedSyntheticReferenceMetadata];
      int v42 = (void *)v41;
      if (!LOBYTE(self->_darkestFrameMetadata))
      {
        if (v41)
        {
          int v43 = [(DeepFusionProcessor *)self _processSyntheticReferenceMetadataFromReferenceEV0];
          if (v43)
          {
            int v38 = v43;
            uint64_t v50 = v5;
            LODWORD(v49) = v43;
            FigDebugAssert3();

            goto LABEL_34;
          }
        }
      }

      break;
    case 0:
      int v37 = [(DeepFusionProcessor *)self _preprocessSyntheticReferenceFrame];
      if (v37)
      {
        int v38 = v37;
        uint64_t v50 = v5;
        LODWORD(v49) = v37;
LABEL_32:
        FigDebugAssert3();
        goto LABEL_34;
      }
      break;
  }
  if (!v54)
  {
    int v38 = 0;
    goto LABEL_34;
  }
  int v44 = [(DeepFusionProcessor *)self _processInputFrame:v11];
  int v38 = v44;
  if (v44)
  {
    uint64_t v50 = v5;
    LODWORD(v49) = v44;
    goto LABEL_32;
  }
LABEL_34:
  ++self->_addFrameCount;
  uint64_t v45 = objc_msgSend(v11, "properties", v49, v50);
  [(DeepFusionProcessor *)self EndKTraceEventForAddFrame:v45];

  return v38;
}

- (int)addBuffer:(__CVBuffer *)a3 metadata:(id)a4 type:(int)a5 lscGainMap:(__CVBuffer *)a6 lscGainMapParameters:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a4;
  id v13 = a7;
  if (v9 == 8) {
    self->_hasLongFrame = 1;
  }
  uint64_t v14 = *MEMORY[0x263F04238];
  int v15 = (void *)CVBufferCopyAttachment(a3, (CFStringRef)*MEMORY[0x263F04238], 0);
  id v16 = objc_opt_new();
  int v17 = v16;
  if (a6 && v13)
  {
    [v16 setObject:a6 forKeyedSubscript:*MEMORY[0x263F2EF60]];
    [v17 setObject:v13 forKeyedSubscript:*MEMORY[0x263F2EF68]];
  }
  [v17 setObject:v15 forKeyedSubscript:v14];
  id v18 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:a3 pixelFormat:25 usage:1 plane:0 widthAlignmentFactor:16 heightAlignmentFactor:16];
  if (v18)
  {
    uint64_t v19 = *MEMORY[0x263F2EF58];
    CFTypeRef v20 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F2EF58], 0);
    if (v20) {
      [v17 setObject:v20 forKeyedSubscript:v19];
    }
    int v21 = objc_opt_new();
    [v21 setMetadata:v12];
    [v21 setMatchingPixelBufferFormat:CVPixelBufferGetPixelFormatType(a3)];
    [v21 setAttachments:v17];
    long long v22 = (void *)[objc_alloc(MEMORY[0x263F2EDA8]) initWithTexture:v18 descriptor:v21];
    int v23 = [(DeepFusionProcessor *)self addInputResource:v22 type:v9];
  }
  else
  {
    float v25 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v23 = -73405;
  }

  return v23;
}

- (int)addBuffer:(__CVBuffer *)a3 metadata:(id)a4 type:(int)a5
{
  return [(DeepFusionProcessor *)self addBuffer:a3 metadata:a4 type:*(void *)&a5 lscGainMap:0 lscGainMapParameters:0];
}

- (int)_processInputFrame:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NRFProcessorInferenceResults *)self->_inferenceResults addObject:v4];
    int v5 = [(DeepFusionProcessor *)self _registerImages:0];
    int v6 = 0;
    if (v5)
    {
      int v9 = v5;
      FigDebugAssert3();
      int v6 = v9;
    }
  }
  else
  {
    id v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v6 = -73409;
  }

  return v6;
}

- (id)_frameDescription:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  __int16 v18 = 0;
  uint64_t v7 = [v4 metadata];
  unsigned int v5 = objc_msgSend((id)v7, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F6C0], 0xFFFFFFFFLL, (char *)&v18 + 1);

  int v6 = [v4 metadata];
  LODWORD(v7) = objc_msgSend(v6, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F3C8], 0xFFFFFFFFLL, &v18);

  if ((HIBYTE(v18) == 0) != ((_BYTE)v18 == 0))
  {
    if (HIBYTE(v18)) {
      id v8 = @"TimeMachine";
    }
    else {
      id v8 = @"Bracketed";
    }
    if (HIBYTE(v18)) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = v7;
    }
  }
  else
  {
    int v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    id v8 = 0;
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  id v10 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];

  if (v10 == v4)
  {
    [NSString stringWithFormat:@"RefEV0_%@Index_%d", v8, v7];
  }
  else
  {
    id v11 = [(RawDFDeferredFrames *)self->_inputFrames sifrFrame];

    if (v11 == v4)
    {
      [NSString stringWithFormat:@"EVM_%@Index_%d", v8, v7];
    }
    else
    {
      id v12 = [(RawDFDeferredFrames *)self->_inputFrames longFrame];

      if (v12 == v4)
      {
        [NSString stringWithFormat:@"Long_%@Index_%d", v8, v7];
      }
      else
      {
        id v13 = [(RawDFDeferredFrames *)self->_inputFrames quadraFrame];

        if (v13 == v4) {
          [NSString stringWithFormat:@"Quadra_%@Index_%d", v8, v7];
        }
        else {
          [NSString stringWithFormat:@"EV0_%@Index_%d", v8, v7];
        }
      }
    }
  uint64_t v14 = };

  return v14;
}

- (id)createDraftDemosaicTextureForFrame:(id)a3 outputROI:(CGRect *)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v57 = 0;
  uint64_t v7 = [v6 baseTex];

  if (!v7)
  {
    int v56 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v49 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
LABEL_24:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_25;
  }
  +[RawDFCommon getRegwarpSurfaceDimensionsForInputWidth:LODWORD(self->_originalHeight) height:LODWORD(self->_draftDemosaicCache)];
  unsigned __int16 v9 = v8;
  unsigned __int16 v11 = v10;
  if (v10) {
    BOOL v12 = v8 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    FigDebugAssert3();
    int v56 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v49 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
    goto LABEL_24;
  }
  id v13 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v14 = (void *)[v13 newTextureDescriptor];

  if (!v14) {
    goto LABEL_22;
  }
  int v15 = [v14 desc];
  [v15 setTextureType:2];

  uint64_t v16 = v11;
  uint64_t v17 = [v14 desc];
  [v17 setWidth:v16];

  __int16 v18 = [v14 desc];
  [v18 setHeight:v9];

  uint64_t v19 = [v14 desc];
  [v19 setUsage:7];

  CFTypeRef v20 = [v14 desc];
  [v20 setPixelFormat:25];

  [v14 setLabel:0];
  int v21 = [(FigMetalContext *)self->_metal allocator];
  long long v22 = (void *)[v21 newTextureWithDescriptor:v14];
  id v57 = v22;

  if (!v22)
  {
LABEL_22:
    int v56 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v50 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_25:
    BOOL v24 = 0;
LABEL_26:
    FigMetalDecRef();
    int v46 = 0;
    goto LABEL_17;
  }
  if (LOBYTE(self->_quadraMotionScore))
  {
    id v23 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:self->_regWarpInput pixelFormat:10 usage:7 plane:0];
  }
  else
  {
    id v23 = v22;
  }
  BOOL v24 = v23;

  float v25 = [v6 properties];
  long long v26 = [v25 meta];
  uint64_t v27 = [v26 ROI];
  int32x2_t v28 = vmovn_s64(vcvtq_s64_f64(*(float64x2_t *)v27));
  HIWORD(v52) = v28.i16[2];
  LOWORD(v52) = v28.i16[0];
  float64x2_t v51 = *(float64x2_t *)(v27 + 16);

  int32x2_t v29 = vmovn_s64(vcvtq_s64_f64(v51));
  HIWORD(v53) = v29.i16[2];
  LOWORD(v53) = v29.i16[0];
  uint64_t v54 = 0;
  LODWORD(v26) = [v6 pixelBufferFormat];
  int v30 = [v6 bayerPattern];
  unint64_t v31 = [v6 metadata];
  uint64_t v32 = determineCFALayoutWithBayerPattern((int)v26, v30, v31);

  uint64_t v33 = [v6 properties];
  id v34 = [v33 meta];
  int v35 = *(_DWORD *)([v34 exposureParams] + 48);

  regwarpGPU = self->_regwarpGPU;
  int v37 = [v6 baseTex];
  LODWORD(v38) = v35;
  int v39 = [(FigRegWarpPPGPU *)regwarpGPU runWithInputTex:v37 outputTex:v24 cfaLayout:v32 gain:v52 inputCropOrigin:v53 inputCropSize:(char *)&v54 + 4 outputCropOrigin:v38 outputCropSize:&v54];

  if (v39) {
    goto LABEL_26;
  }
  if (LOBYTE(self->_quadraMotionScore))
  {
    [(RegDense *)self->_regDense copyTexture:v24 outTex:v22];
    [(FigMetalContext *)self->_metal waitForSchedule];
  }
  framesPendingToBeRegistered = self->_framesPendingToBeRegistered;
  uint64_t v41 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "uniqueFrameId"));
  [(NSMutableArray *)framesPendingToBeRegistered setObject:v22 forKeyedSubscript:v41];

  if (a4)
  {
    LOWORD(v43) = HIWORD(v54);
    LOWORD(v42) = WORD2(v54);
    LOWORD(v45) = WORD1(v54);
    LOWORD(v44) = v54;
    a4->origin.x = (double)v42;
    a4->origin.y = (double)v43;
    a4->size.width = (double)v44;
    a4->size.height = (double)v45;
  }
  int v46 = v24;
LABEL_17:
  id v47 = v46;

  return v47;
}

- (int)processFrameForRegistration:(id)a3 isReference:(BOOL)a4
{
  BOOL v5 = a4;
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v7 = a3;
  memset(v51, 0, sizeof(v51));
  unsigned __int16 v8 = [v7 baseTex];

  if (!v8)
  {
    unsigned int v52 = 0;
    unsigned __int16 v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
LABEL_34:
    int v26 = -73389;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_52:

    goto LABEL_28;
  }
  uint64_t v9 = [(DeepFusionProcessor *)self createDraftDemosaicTextureForFrame:v7 outputROI:v51];
  if (!v9)
  {
    unsigned int v52 = 0;
    unsigned __int16 v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v39 = v52;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      v39 &= ~1u;
    }
    if (v39)
    {
      int v40 = [v7 uniqueFrameId];
      LODWORD(v53[0]) = 136315394;
      *(void *)((char *)v53 + 4) = "-[DeepFusionProcessor processFrameForRegistration:isReference:]";
      WORD6(v53[0]) = 1024;
      *(_DWORD *)((char *)v53 + 14) = v40;
      _os_log_send_and_compose_impl();
    }
    goto LABEL_34;
  }
  unsigned __int16 v10 = v9;
  int v50 = 0;
  if (BYTE2(self->_quadraMotionScore) && ![v7 gdcParameters])
  {
    unsigned int v52 = 0;
    unsigned __int16 v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v41 = v52;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v42 = v41;
    }
    else {
      unsigned int v42 = v41 & 0xFFFFFFFE;
    }
    if (v42)
    {
      LODWORD(v53[0]) = 136315138;
      *(void *)((char *)v53 + 4) = "-[DeepFusionProcessor processFrameForRegistration:isReference:]";
      _os_log_send_and_compose_impl();
    }
    int v26 = -73389;
    goto LABEL_51;
  }
  if (v5)
  {
    if (LOBYTE(self->_quadraMotionScore))
    {
      if (-[RegWarpPP processReference:gdcParams:regionOfInterest:numKeypoints:](self->_registrationPipelineRWPP, "processReference:gdcParams:regionOfInterest:numKeypoints:", self->_regWarpInput, [v7 gdcParameters], v51, &v50))
      {
        FigDebugAssert3();
        unsigned int v52 = 0;
        unsigned __int16 v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v12 = v52;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v13 = v12;
        }
        else {
          unsigned int v13 = v12 & 0xFFFFFFFE;
        }
        if (v13)
        {
          LODWORD(v53[0]) = 136315138;
          *(void *)((char *)v53 + 4) = "-[DeepFusionProcessor processFrameForRegistration:isReference:]";
          _os_log_send_and_compose_impl();
        }
        int v26 = -73389;
LABEL_51:
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        goto LABEL_52;
      }
    }
    else
    {
      int v17 = -[RawDFPowerBlurStage processReferenceTexture:gdcParams:regionOfInterest:numKeypoints:](self->_rawDFPowerBlurStage, "processReferenceTexture:gdcParams:regionOfInterest:numKeypoints:", v10, [v7 gdcParameters], v51, &v50);
      if (v17)
      {
        int v26 = v17;
        unsigned int v52 = 0;
        unsigned __int16 v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v43 = v52;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v44 = v43;
        }
        else {
          unsigned int v44 = v43 & 0xFFFFFFFE;
        }
        if (v44)
        {
          LODWORD(v53[0]) = 136315394;
          *(void *)((char *)v53 + 4) = "-[DeepFusionProcessor processFrameForRegistration:isReference:]";
          WORD6(v53[0]) = 1024;
          *(_DWORD *)((char *)v53 + 14) = v50;
          _os_log_send_and_compose_impl();
        }
        goto LABEL_51;
      }
    }
    __int16 v18 = [v7 properties];
    uint64_t v19 = (_OWORD *)[v18 regHomography];
    uint64_t v20 = MEMORY[0x263EF89A0];
    long long v21 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
    _OWORD *v19 = *MEMORY[0x263EF89A0];
    v19[1] = v21;
    v19[2] = *(_OWORD *)(v20 + 32);

    long long v22 = [v7 properties];
    [v22 setRegistrationComplete:1];

    id v23 = [v7 properties];
    [v23 setHasValidRegistration:1];
    goto LABEL_18;
  }
  int v54 = 0;
  memset(v53, 0, sizeof(v53));
  if (LOBYTE(self->_quadraMotionScore))
  {
    registrationPipelineRWPP = self->_registrationPipelineRWPP;
    regWarpInput = self->_regWarpInput;
    if (BYTE2(self->_quadraMotionScore)) {
      uint64_t v16 = [v7 gdcParameters];
    }
    else {
      uint64_t v16 = 0;
    }
    if ([(RegWarpPP *)registrationPipelineRWPP processNonReference:regWarpInput gdcParams:v16 outputTransform:v53])
    {
      int v26 = -73389;
LABEL_49:
      FigDebugAssert3();
      goto LABEL_52;
    }
  }
  else
  {
    rawDFPowerBlurStage = self->_rawDFPowerBlurStage;
    if (BYTE2(self->_quadraMotionScore)) {
      uint64_t v25 = [v7 gdcParameters];
    }
    else {
      uint64_t v25 = 0;
    }
    int v27 = [(RawDFPowerBlurStage *)rawDFPowerBlurStage processNonReferenceTexture:v10 gdcParams:v25 outputTransform:v53];
    if (v27)
    {
      int v26 = v27;
      goto LABEL_49;
    }
  }
  long long v47 = v53[0];
  int32x2_t v28 = [v7 properties];
  *(_OWORD *)[v28 regHomography] = v47;

  long long v48 = *(_OWORD *)((char *)v53 + 12);
  int32x2_t v29 = [v7 properties];
  *(_OWORD *)([v29 regHomography] + 16) = v48;

  *(void *)&long long v30 = *((void *)&v53[1] + 1);
  DWORD2(v30) = v54;
  long long v49 = v30;
  unint64_t v31 = [v7 properties];
  *(_OWORD *)([v31 regHomography] + 32) = v49;

  uint64_t v32 = [v7 properties];
  [v32 setRegistrationComplete:1];

  uint64_t v33 = [v7 properties];
  uint64_t v34 = sanityCheckHomography((float32x4_t *)[v33 regHomography]);
  int v35 = [v7 properties];
  [v35 setHasValidRegistration:v34];

  uint64_t v36 = [v7 properties];
  LOBYTE(v34) = [v36 hasValidRegistration];

  if (v34) {
    goto LABEL_27;
  }
  uint64_t v46 = v4;
  LODWORD(v45) = 0;
  FigDebugAssert3();
  if (!dword_26B430EE8) {
    goto LABEL_27;
  }
  id v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_18:

LABEL_27:
  int v37 = objc_msgSend(v7, "properties", v45, v46);
  -[DeepFusionProcessor printHomography:](self, "printHomography:", [v37 regHomography]);

  int v26 = 0;
LABEL_28:

  return v26;
}

- (int)_registerImages:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  id v7 = v6;
  if (!v6)
  {
    int v41 = 0;
    goto LABEL_40;
  }
  unsigned __int16 v8 = [v6 properties];
  char v9 = [v8 registrationComplete];

  unsigned __int16 v10 = (_DWORD *)MEMORY[0x263F00E10];
  if (v9)
  {
LABEL_8:
    BOOL v47 = v4;
    unsigned int v12 = v7;
    unsigned int v13 = [v7 properties];
    int v46 = [v13 registrationComplete];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v14 = self->_inferenceResults;
    uint64_t v15 = [(NRFProcessorInferenceResults *)v14 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v49;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v49 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v48 + 1) + 8 * v18);
          uint64_t v20 = [v19 properties];
          char v21 = [v20 registrationComplete];

          if ((v21 & 1) == 0)
          {
            long long v22 = [v19 properties];
            id v23 = [v22 meta];
            if ([v23 isEVMFrame])
            {
              int darkestFrameMetadata_low = LOBYTE(self->_darkestFrameMetadata);

              if (darkestFrameMetadata_low)
              {
                BOOL hasEVM = self->_hasEVM;
                int v26 = [v19 properties];
                int v27 = v26;
                if (hasEVM)
                {
                  int32x2_t v28 = (_OWORD *)[v26 regHomography];
                  long long v30 = *(_OWORD *)&self->_anon_150[16];
                  long long v29 = *(_OWORD *)&self->_anon_150[32];
                  _OWORD *v28 = *(_OWORD *)self->_anon_150;
                  v28[1] = v30;
                  v28[2] = v29;

                  unint64_t v31 = [v19 properties];
                  [v31 setRegistrationComplete:1];

                  uint64_t v32 = [v19 properties];
                  BOOL v33 = sanityCheckHomography((float32x4_t *)[(id)v32 regHomography]);
                  uint64_t v34 = [v19 properties];
                  [v34 setHasValidRegistration:v33];

                  int v35 = [v19 properties];
                  LOBYTE(v32) = [v35 hasValidRegistration];

                  if ((v32 & 1) == 0)
                  {
                    uint64_t v45 = v3;
                    LODWORD(v44) = 0;
                    FigDebugAssert3();
                    if (dword_26B430EE8)
                    {
                      unsigned int v39 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                      os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
                      fig_log_call_emit_and_clean_up_after_send_and_compose();
                    }
                  }
                  uint64_t v36 = objc_msgSend(v19, "properties", v44, v45);
                  -[DeepFusionProcessor printHomography:](self, "printHomography:", [v36 regHomography]);
                }
                else
                {
                  [v26 setRegistrationComplete:1];

                  uint64_t v36 = [v19 properties];
                  [v36 setHasValidRegistration:0];
                }

                goto LABEL_27;
              }
            }
            else
            {
            }
            int v37 = (_DWORD *)MEMORY[0x263F00E10];
            if (*MEMORY[0x263F00E10] == 1)
            {
              [v12 uniqueFrameId];
              [v19 uniqueFrameId];
              kdebug_trace();
            }
            int v38 = [(DeepFusionProcessor *)self processFrameForRegistration:v19 isReference:0];
            if (v38)
            {
              int v41 = v38;

              goto LABEL_35;
            }
            if (*v37 == 1)
            {
              [v12 uniqueFrameId];
              [v19 uniqueFrameId];
              kdebug_trace();
            }
          }
LABEL_27:
          ++v18;
        }
        while (v16 != v18);
        uint64_t v40 = [(NRFProcessorInferenceResults *)v14 countByEnumeratingWithState:&v48 objects:v52 count:16];
        uint64_t v16 = v40;
      }
      while (v40);
    }

    if (v46) {
      [(NRFProcessorInferenceResults *)self->_inferenceResults removeAllObjects];
    }
    int v41 = 0;
LABEL_35:
    id v7 = v12;
    if (!v47) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  if (*MEMORY[0x263F00E10] == 1)
  {
    [v7 uniqueFrameId];
    kdebug_trace();
  }
  int v11 = [(DeepFusionProcessor *)self processFrameForRegistration:v7 isReference:1];
  if (!v11)
  {
    if (*v10 == 1)
    {
      [v7 uniqueFrameId];
      kdebug_trace();
    }
    goto LABEL_8;
  }
  int v41 = v11;
  if (v4) {
LABEL_36:
  }
    [(RawDFPowerBlurStage *)self->_rawDFPowerBlurStage releaseResources];
LABEL_37:
  if (dword_26B430EE8)
  {
    unsigned int v42 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_40:

  return v41;
}

- (int)getRawDFFrameTypeForInputFrame:(id)a3
{
  id v4 = a3;
  id v5 = [(RawDFDeferredFrames *)self->_inputFrames quadraFrame];

  if (v5 == v4)
  {
    int v9 = 3;
  }
  else
  {
    id v6 = [v4 properties];
    id v7 = [v6 meta];
    char v8 = [v7 isEVMFrame];

    if (v8)
    {
      int v9 = 1;
    }
    else
    {
      unsigned __int16 v10 = [v4 properties];
      int v11 = [v10 meta];
      int v12 = [v11 isLongFrame];

      if (v12) {
        int v9 = 2;
      }
      else {
        int v9 = 0;
      }
    }
  }

  return v9;
}

- (int)_demosaicAndProcessFrame:(id)a3 toTexture:(id)a4 withWarpFrame:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v130 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  unsigned int v101 = [(DeepFusionProcessor *)self getRawDFFrameTypeForInputFrame:v8];
  if (-[RawDFPowerBlurTuningParams isEnabledForFrameType:](self->_dfPlist->powerBlurTuning, "isEnabledForFrameType:")) {
    int v99 = isRawDFPowerBlurEnabled();
  }
  else {
    int v99 = 0;
  }
  BOOL v10 = [(RawDFLumaSharpenTuningParams *)self->_dfPlist->lumaSharpenTuning isEnabled];
  id v108 = 0;
  id v109 = 0;
  if (!v8
    || (BOOL v11 = v10,
        [v8 baseTex],
        int v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        !v12))
  {
    unsigned int v107 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v81 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT);
LABEL_80:
    int v63 = -73418;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v55 = 0;
    id v50 = 0;
    uint64_t v98 = 0;
    int v38 = 0;
    goto LABEL_69;
  }
  if (!v9)
  {
    unsigned int v13 = [v8 rgbTex];

    if (!v13)
    {
      int v14 = [v8 allocateRGB];
      if (v14)
      {
        int v63 = v14;
        FigDebugAssert3();
        goto LABEL_98;
      }
    }
    id v9 = [v8 rgbTex];
  }
  id v109 = [v8 rgbTex];
  if (v109) {
    FigMetalIncRef();
  }
  if (!v9)
  {
    unsigned int v107 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v82 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT);
    int v63 = -73418;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_98:
    uint64_t v55 = 0;
    id v50 = 0;
    uint64_t v98 = 0;
    int v38 = 0;
    id v9 = 0;
    goto LABEL_69;
  }
  id v103 = v9;
  uint64_t v15 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  uint64_t v16 = [v15 properties];
  uint64_t v17 = [v16 meta];
  float v18 = 1.0;
  BOOL v95 = v5;
  if ([v17 hasZoomRects])
  {
    uint64_t v93 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
    uint64_t v19 = [v93 properties];
    uint64_t v20 = [v19 meta];
    [v20 zoomDstRect];
    double v22 = v21;
    [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
    id v23 = v97 = v11;
    [v23 properties];
    uint64_t v25 = v24 = v8;
    int v26 = [v25 meta];
    [v26 zoomSrcRect];
    float v18 = v22 / v27;

    id v8 = v24;
    BOOL v11 = v97;

    BOOL v5 = v95;
  }

  unsigned __int8 v105 = 0;
  unsigned __int8 v104 = 0;
  int v28 = [(RawDFSyntheticLongStage *)self->_rawDFSyntheticLongStage shouldProcessFrame:v8 shouldZoom:&v105 shouldMirror:&v104];
  if (v28)
  {
    int v63 = v28;
    FigDebugAssert3();
    uint64_t v55 = 0;
    id v50 = 0;
    uint64_t v98 = 0;
    int v38 = 0;
LABEL_102:
    id v9 = v103;
    goto LABEL_69;
  }
  *(float *)&double v29 = v18;
  int v30 = [(SoftLTM *)self->_softLTMStage supportsInPlacePostDemosaicOperation:v101 zoom:v29];
  if (v30) {
    int v31 = 1;
  }
  else {
    int v31 = 2;
  }
  int v32 = v99 + v5 + v31 + v104 + v105 + v11;
  id v9 = v103;
  if (dword_26B430EE8)
  {
    int v33 = v30;
    unsigned int v107 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v35 = v107;
    if (os_log_type_enabled(v34, type)) {
      unsigned int v36 = v35;
    }
    else {
      unsigned int v36 = v35 & 0xFFFFFFFE;
    }
    if (v36)
    {
      int v110 = 136317442;
      float32x4_t v111 = "-[DeepFusionProcessor _demosaicAndProcessFrame:toTexture:withWarpFrame:]";
      __int16 v112 = 1024;
      unsigned int v113 = v101;
      __int16 v114 = 1024;
      int v115 = v99;
      __int16 v116 = 1024;
      int v117 = v11;
      __int16 v118 = 1024;
      int v119 = v105;
      __int16 v120 = 1024;
      int v121 = v104;
      __int16 v122 = 1024;
      BOOL v123 = v5;
      __int16 v124 = 1024;
      int v125 = v33;
      __int16 v126 = 2048;
      double v127 = v18;
      __int16 v128 = 1024;
      int v129 = v32;
      LODWORD(v91) = 70;
      int v90 = &v110;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    id v9 = v103;
  }
  int v37 = [(FigMetalContext *)self->_metal allocator];
  int v38 = (void *)[v37 newTextureDescriptor];

  if (!v38)
  {
    unsigned int v107 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v81 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v83 = v107;
    if (os_log_type_enabled(v81, type)) {
      unsigned int v84 = v83;
    }
    else {
      unsigned int v84 = v83 & 0xFFFFFFFE;
    }
    if (v84)
    {
      int v110 = 136315138;
      float32x4_t v111 = "-[DeepFusionProcessor _demosaicAndProcessFrame:toTexture:withWarpFrame:]";
      _os_log_send_and_compose_impl();
    }
    goto LABEL_80;
  }
  uint64_t v39 = [v9 width];
  uint64_t v40 = [v38 desc];
  [v40 setWidth:v39];

  uint64_t v41 = [v9 height];
  unsigned int v42 = [v38 desc];
  [v42 setHeight:v41];

  unsigned int v43 = [v38 desc];
  [v43 setUsage:7];

  uint64_t v44 = [v9 pixelFormat];
  uint64_t v45 = [v38 desc];
  [v45 setPixelFormat:v44];

  [v38 setLabel:0];
  int v46 = [(FigMetalContext *)self->_metal allocator];
  BOOL v47 = (void *)[v46 newTextureWithDescriptor:v38];
  id v108 = v47;

  if (!v47)
  {
    unsigned int v107 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v85 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v86 = v107;
    if (os_log_type_enabled(v85, type)) {
      unsigned int v87 = v86;
    }
    else {
      unsigned int v87 = v86 & 0xFFFFFFFE;
    }
    if (v87)
    {
      int v110 = 136315138;
      float32x4_t v111 = "-[DeepFusionProcessor _demosaicAndProcessFrame:toTexture:withWarpFrame:]";
      _os_log_send_and_compose_impl();
    }
    int v63 = -73418;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v55 = 0;
    id v50 = 0;
    uint64_t v98 = 0;
    goto LABEL_102;
  }
  uint64_t v98 = +[RawDFCommon getLSCGainsWithFrame:v8 lscGainsPlist:self->_lscGainsTex];
  id v9 = v9;
  id v48 = v47;
  int v92 = v32;
  if (v32) {
    id v49 = v9;
  }
  else {
    id v49 = v48;
  }
  if (v32) {
    id v50 = v48;
  }
  else {
    id v50 = v9;
  }
  int v51 = [v8 checkAndSetRgbTex:v49];
  if (v51)
  {
    int v63 = v51;
LABEL_88:
    FigDebugAssert3();
    uint64_t v55 = v49;
    goto LABEL_69;
  }
  int v52 = [v8 demosaicWithStage:self->_draftDemosaicStage];
  if (v52)
  {
    int v63 = v52;
    goto LABEL_88;
  }
  id v53 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];

  if (v53 != v8)
  {
    int v54 = -[DeepFusionProcessor addInputFrameAsExternalAllocator:withSubAllocatorId:](self, "addInputFrameAsExternalAllocator:withSubAllocatorId:", v8, [v8 uniqueFrameId]);
    if (v54) {
      goto LABEL_70;
    }
  }
  id v103 = v9;
  if (v104)
  {
    int v54 = [(RawDFSyntheticLongStage *)self->_rawDFSyntheticLongStage processFrame:v8 inputTex:v49 outputTex:v50 doZoom:0];
    if (!v54)
    {
      uint64_t v55 = v49;
      goto LABEL_42;
    }
LABEL_70:
    int v63 = v54;
    uint64_t v55 = v50;
    id v50 = v49;
    goto LABEL_69;
  }
  uint64_t v55 = v50;
  id v50 = v49;
LABEL_42:
  int v56 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v56 addObject:v50];
  [v56 addObject:v55];
  __int16 v57 = [v8 width];
  __int16 v58 = [v8 height];
  LODWORD(v59) = 0;
  WORD2(v59) = v57;
  HIWORD(v59) = v58;
  double v94 = v59;
  softLTMStage = self->_softLTMStage;
  int v61 = [v8 metadata];
  *(float *)&double v62 = v18;
  int v63 = [(SoftLTM *)softLTMStage runPostDemosaicWithTextureArray:v56 inputROI:v61 inputMetadata:v101 zoomRatio:v94 outputROI:v62 frameType:v94];

  if (v63)
  {
    FigDebugAssert3();
LABEL_101:

    goto LABEL_102;
  }
  uint64_t v64 = [v56 objectAtIndexedSubscript:0];

  uint64_t v55 = [v56 objectAtIndexedSubscript:1];

  if (!v99)
  {
    long long v66 = v55;
    id v50 = (id)v64;
    if (!v11) {
      goto LABEL_46;
    }
    goto LABEL_48;
  }
  [(RawDFLumaSharpenStage *)self->_rawDFLumaSharpenStage setTuningParams:self->_dfPlist->powerBlurTuning];
  int v65 = [(RawDFLumaSharpenStage *)self->_rawDFLumaSharpenStage runWithInputFrame:v8 frameType:v101 inputTex:v64 lscGainsTex:v98 outputTex:v55];
  if (v65)
  {
    int v63 = v65;
    id v50 = (id)v64;
    goto LABEL_102;
  }
  long long v66 = (void *)v64;
  id v50 = v55;
  if (!v11)
  {
LABEL_46:
    uint64_t v55 = v66;
    goto LABEL_50;
  }
LABEL_48:
  [(RawDFZoomStage *)self->_rawDFZoomStage setTuningParams:self->_dfPlist->lumaSharpenTuning];
  rawDFZoomStage = self->_rawDFZoomStage;
  long long v68 = [v8 properties];
  int v63 = [(RawDFZoomStage *)rawDFZoomStage runWithFrameProperties:v68 frameType:v101 inputTex:v50 outputTex:v66];

  if (v63)
  {
LABEL_97:
    uint64_t v55 = v66;
    goto LABEL_102;
  }
  uint64_t v55 = v50;
  id v50 = v66;
LABEL_50:
  id v9 = v103;
  if (v105)
  {
    int v69 = [(RawDFSyntheticLongStage *)self->_rawDFSyntheticLongStage processFrame:v8 inputTex:v50 outputTex:v55];
    if (v69)
    {
      int v63 = v69;
      goto LABEL_69;
    }
    long long v66 = v50;
    id v50 = v55;
  }
  else
  {
    long long v66 = v55;
  }
  if (!v95)
  {
    uint64_t v55 = v66;
    goto LABEL_63;
  }
  long long v70 = [(DeepFusionProcessor *)self getRefGDCParams];
  long long v71 = [v8 properties];
  long long v72 = (float32x4_t *)[v71 regHomography];
  double RelativeHomography = getRelativeHomography(*(simd_float3x3 *)self->_anon_120, *v72, v72[1], v72[2]);
  double v100 = v74;
  double v102 = RelativeHomography;
  double v96 = v75;

  rawDFInferenceGen = self->_rawDFInferenceGen;
  if (BYTE2(self->_quadraMotionScore))
  {
    uint64_t v77 = [v8 gdcParameters];
    if (BYTE2(self->_quadraMotionScore)) {
      double v78 = v70;
    }
    else {
      double v78 = 0;
    }
  }
  else
  {
    double v78 = 0;
    uint64_t v77 = 0;
  }
  int v79 = -[RawDFInferenceGen runWarpUsingTransform:inputTex:outputTex:inputFrameGDCParams:outputFrameGDCParams:](rawDFInferenceGen, "runWarpUsingTransform:inputTex:outputTex:inputFrameGDCParams:outputFrameGDCParams:", v50, v66, v77, v78, v102, v100, v96);
  if (v79)
  {
    int v63 = v79;
    goto LABEL_97;
  }
  uint64_t v55 = v50;
  id v50 = v66;
  id v9 = v103;
LABEL_63:
  if (v50 != v9)
  {
    int v63 = -73418;
    unsigned int v107 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int v56 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v88 = v107;
    if (!os_log_type_enabled(v56, type)) {
      v88 &= ~1u;
    }
    if (v88)
    {
      unsigned int v89 = [v8 uniqueFrameId];
      int v110 = 136315906;
      float32x4_t v111 = "-[DeepFusionProcessor _demosaicAndProcessFrame:toTexture:withWarpFrame:]";
      __int16 v112 = 1024;
      unsigned int v113 = v89;
      __int16 v114 = 1024;
      int v115 = v92;
      __int16 v116 = 1024;
      int v117 = -73418;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_101;
  }
  if (v109)
  {
    int v63 = objc_msgSend(v8, "checkAndSetRgbTex:");
    if (!v63) {
      FigMetalDecRef();
    }
  }
  else
  {
    [v8 releaseRgbTex];
    int v63 = 0;
  }
  id v50 = v9;
LABEL_69:
  FigMetalDecRef();

  return v63;
}

- (int)_demosaicAndProcessFrame:(id)a3 withWarpFrame:(BOOL)a4
{
  return [(DeepFusionProcessor *)self _demosaicAndProcessFrame:a3 toTexture:0 withWarpFrame:a4];
}

- (int)generateSyntheticLongToOutput:(id)a3
{
  uint64_t v358 = *MEMORY[0x263EF8340];
  id v290 = a3;
  id v343 = 0;
  id v342 = 0;
  if (self->_hasLongFrame)
  {
    id v4 = [(RawDFDeferredFrames *)self->_inputFrames longFrame];

    if (!v4) {
      goto LABEL_203;
    }
  }
  BOOL v5 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];

  if (!v5) {
    goto LABEL_203;
  }
  id v6 = [(RawDFDeferredFrames *)self->_inputFrames nonReferenceEv0Frames];
  uint64_t v7 = [v6 count];

  if (!v7) {
    goto LABEL_203;
  }
  id v8 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  uint64_t v9 = [v8 width];

  BOOL v10 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  uint64_t v11 = [v10 height];

  int v12 = objc_opt_new();
  if (!v12)
  {
LABEL_203:
    int v349 = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v219 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v219, OS_LOG_TYPE_DEFAULT);
    int v33 = -73394;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v38 = 0;
    long long v292 = 0;
    long long v293 = 0;
    v277 = 0;
    uint64_t v281 = 0;
    obuint64_t j = 0;
    v286 = 0;
    long long v288 = 0;
    v275 = 0;
    v276 = 0;
    unsigned int v13 = 0;
LABEL_204:
    int v99 = 0;
    unsigned int v35 = 0;
    id v17 = 0;
    goto LABEL_205;
  }
  unsigned int v13 = v12;
  [v12 setWidth:v9];
  [v13 setHeight:v11];
  [v13 setLevelCount:4];
  [v13 setType:0];
  int v14 = objc_opt_new();
  if (!v14)
  {
    int v349 = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v224 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v224, OS_LOG_TYPE_DEFAULT);
    int v33 = -73394;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v38 = 0;
    long long v292 = 0;
    long long v293 = 0;
LABEL_226:
    v277 = 0;
    uint64_t v281 = 0;
    obuint64_t j = 0;
    v286 = 0;
    long long v288 = 0;
    v275 = 0;
    v276 = 0;
    goto LABEL_204;
  }
  uint64_t v15 = v14;
  objc_msgSend(v14, "setWidth:", objc_msgSend(v13, "width"));
  objc_msgSend(v15, "setHeight:", objc_msgSend(v13, "height"));
  objc_msgSend(v15, "setLevelCount:", objc_msgSend(v13, "levelCount"));
  long long v293 = v15;
  [v15 setType:1];
  uint64_t v16 = [MEMORY[0x263EFF980] array];
  if (!v16)
  {
    int v349 = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    unsigned int v225 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v225, OS_LOG_TYPE_DEFAULT);
    int v33 = -73394;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v38 = 0;
    long long v292 = 0;
    goto LABEL_226;
  }
  id v17 = (id)v16;
  unint64_t v280 = v11;
  unint64_t v287 = v9;
  float v18 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  [v17 addObject:v18];

  long long v340 = 0u;
  long long v341 = 0u;
  long long v338 = 0u;
  long long v339 = 0u;
  uint64_t v19 = [(RawDFDeferredFrames *)self->_inputFrames nonReferenceEv0Frames];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v338 objects:v357 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v339;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v339 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = *(void **)(*((void *)&v338 + 1) + 8 * i);
        uint64_t v25 = [v24 properties];
        int v26 = [v25 hasValidRegistration];

        if (v26)
        {
          [v17 addObject:v24];
        }
        else
        {
          int v27 = -[DeepFusionProcessor addInputFrameAsExternalAllocator:withSubAllocatorId:](self, "addInputFrameAsExternalAllocator:withSubAllocatorId:", v24, [v24 uniqueFrameId]);
          if (v27)
          {
            int v33 = v27;
LABEL_110:

LABEL_97:
            int v38 = 0;
            long long v292 = 0;
            v277 = 0;
            uint64_t v281 = 0;
            obuint64_t j = 0;
            v286 = 0;
            long long v288 = 0;
            v275 = 0;
            v276 = 0;
            int v99 = 0;
            unsigned int v35 = 0;
LABEL_205:
            double v100 = 0;
            unsigned int v101 = 0;
            goto LABEL_206;
          }
        }
        if ((unint64_t)[v17 count] > 2) {
          goto LABEL_19;
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v338 objects:v357 count:16];
    }
    while (v21);
  }
LABEL_19:

  long long v336 = 0u;
  long long v337 = 0u;
  long long v334 = 0u;
  long long v335 = 0u;
  id v17 = v17;
  uint64_t v28 = [v17 countByEnumeratingWithState:&v334 objects:v356 count:16];
  if (!v28) {
    goto LABEL_27;
  }
  uint64_t v29 = v28;
  uint64_t v30 = *(void *)v335;
  do
  {
    for (uint64_t j = 0; j != v29; ++j)
    {
      if (*(void *)v335 != v30) {
        objc_enumerationMutation(v17);
      }
      int v32 = [*(id *)(*((void *)&v334 + 1) + 8 * j) pyramid];
      int v33 = [v32 configureWithDescriptor:v13];

      if (v33)
      {

        goto LABEL_97;
      }
    }
    uint64_t v29 = [v17 countByEnumeratingWithState:&v334 objects:v356 count:16];
  }
  while (v29);
LABEL_27:

  uint64_t v34 = [[CMIImagePyramid alloc] initWithMetalContext:self->_metal];
  if (!v34)
  {
    int v349 = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    uint64_t v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v226 = v349;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v227 = v226;
    }
    else {
      unsigned int v227 = v226 & 0xFFFFFFFE;
    }
    if (v227)
    {
      LODWORD(v344[0]) = 136315138;
      *(void *)((char *)v344 + 4) = "-[DeepFusionProcessor generateSyntheticLongToOutput:]";
      _os_log_send_and_compose_impl();
    }
    int v33 = -73394;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_110;
  }
  unsigned int v35 = v34;
  int v36 = [(CMIImagePyramid *)v34 configureWithDescriptor:v293];
  if (v36)
  {
    int v33 = v36;
LABEL_229:
    int v38 = 0;
LABEL_231:
    long long v292 = 0;
    v277 = 0;
    uint64_t v281 = 0;
    obuint64_t j = 0;
    v286 = 0;
    long long v288 = 0;
    v275 = 0;
    v276 = 0;
    int v99 = 0;
    goto LABEL_205;
  }
  int v37 = [(FigMetalContext *)self->_metal allocator];
  int v38 = (void *)[v37 newTextureDescriptor];

  if (!v38)
  {
    int v349 = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    unsigned int v228 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v229 = v349;
    if (os_log_type_enabled(v228, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v230 = v229;
    }
    else {
      unsigned int v230 = v229 & 0xFFFFFFFE;
    }
    if (v230)
    {
      LODWORD(v344[0]) = 136315138;
      *(void *)((char *)v344 + 4) = "-[DeepFusionProcessor generateSyntheticLongToOutput:]";
      _os_log_send_and_compose_impl();
    }
    int v33 = -73394;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_229;
  }
  uint64_t v39 = [v38 desc];
  [v39 setWidth:v287];

  uint64_t v40 = [v38 desc];
  [v40 setHeight:v280];

  uint64_t v41 = [v38 desc];
  [v41 setUsage:7];

  unsigned int v42 = [v38 desc];
  [v42 setPixelFormat:115];

  [v38 setLabel:0];
  unsigned int v43 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v44 = (void *)[v43 newTextureWithDescriptor:v38];
  id v45 = v342;
  id v342 = v44;

  if (!v342)
  {
    int v349 = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    unsigned int v231 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v232 = v349;
    if (os_log_type_enabled(v231, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v233 = v232;
    }
    else {
      unsigned int v233 = v232 & 0xFFFFFFFE;
    }
    if (v233)
    {
      LODWORD(v344[0]) = 136315138;
      *(void *)((char *)v344 + 4) = "-[DeepFusionProcessor generateSyntheticLongToOutput:]";
      _os_log_send_and_compose_impl();
    }
    int v33 = -73394;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_231;
  }
  uint64_t v273 = v35;
  uint64_t v274 = v38;
  int v46 = [(CMIImagePyramid *)v35 allocateWithLabel:0];
  if (v46) {
    goto LABEL_209;
  }
  long long v332 = 0u;
  long long v333 = 0u;
  long long v330 = 0u;
  long long v331 = 0u;
  id v17 = v17;
  uint64_t v47 = [v17 countByEnumeratingWithState:&v330 objects:v355 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v331;
    do
    {
      for (uint64_t k = 0; k != v48; ++k)
      {
        if (*(void *)v331 != v49) {
          objc_enumerationMutation(v17);
        }
        int v51 = *(void **)(*((void *)&v330 + 1) + 8 * k);
        int v52 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];

        if (v51 == v52 || !self->_aggressiveMemoryOptimizations) {
          uint64_t v54 = 0xFFFFFFFFLL;
        }
        else {
          uint64_t v54 = 3;
        }
        uint64_t v55 = [v51 pyramid];
        int v33 = [v55 allocateLevel:0 withCompressionLevel:v54 withLabel:0];

        if (v33) {
          goto LABEL_106;
        }
      }
      uint64_t v48 = [v17 countByEnumeratingWithState:&v330 objects:v355 count:16];
    }
    while (v48);
  }

  FigMetalDecRef();
  long long v328 = 0u;
  long long v329 = 0u;
  long long v326 = 0u;
  long long v327 = 0u;
  id v17 = v17;
  uint64_t v56 = [v17 countByEnumeratingWithState:&v326 objects:v354 count:16];
  if (!v56) {
    goto LABEL_62;
  }
  uint64_t v57 = v56;
  uint64_t v58 = *(void *)v327;
  while (2)
  {
    uint64_t v59 = 0;
    while (2)
    {
      if (*(void *)v327 != v58) {
        objc_enumerationMutation(v17);
      }
      uint64_t v60 = *(void **)(*((void *)&v326 + 1) + 8 * v59);
      int v61 = [v60 rgbTex];

      if (v61)
      {
        int v349 = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        double v102 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v103 = v349;
        if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v104 = v103;
        }
        else {
          unsigned int v104 = v103 & 0xFFFFFFFE;
        }
        if (v104)
        {
          LODWORD(v344[0]) = 136315138;
          *(void *)((char *)v344 + 4) = "-[DeepFusionProcessor generateSyntheticLongToOutput:]";
          _os_log_send_and_compose_impl();
        }
        int v33 = -73394;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        goto LABEL_106;
      }
      double v62 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];

      BOOL v63 = v60 != v62 || self->_dsrMode;
      uint64_t v64 = [v60 pyramid];
      int v65 = [v64 getTextureAtLevel:0];
      int v33 = [(DeepFusionProcessor *)self _demosaicAndProcessFrame:v60 toTexture:v65 withWarpFrame:v63];

      if (v33)
      {
        FigDebugAssert3();
        goto LABEL_106;
      }
      long long v66 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
      if (v60 != v66)
      {

        goto LABEL_59;
      }
      BOOL keepReferenceEv0RGB = self->_keepReferenceEv0RGB;

      if (keepReferenceEv0RGB) {
LABEL_59:
      }
        [v60 releaseBaseTex];
      if (v57 != ++v59) {
        continue;
      }
      break;
    }
    uint64_t v57 = [v17 countByEnumeratingWithState:&v326 objects:v354 count:16];
    if (v57) {
      continue;
    }
    break;
  }
LABEL_62:

  long long v68 = [(FigMetalContext *)self->_metal allocator];
  int v69 = (void *)[v68 newTextureWithDescriptor:v274];
  id v70 = v342;
  id v342 = v69;

  if (!v342)
  {
    int v349 = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    unsigned int v234 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v235 = v349;
    if (os_log_type_enabled(v234, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v236 = v235;
    }
    else {
      unsigned int v236 = v235 & 0xFFFFFFFE;
    }
    if (!v236) {
      goto LABEL_251;
    }
    LODWORD(v344[0]) = 136315138;
    *(void *)((char *)v344 + 4) = "-[DeepFusionProcessor generateSyntheticLongToOutput:]";
    goto LABEL_237;
  }
  long long v324 = 0u;
  long long v325 = 0u;
  long long v322 = 0u;
  long long v323 = 0u;
  id v17 = v17;
  uint64_t v71 = [v17 countByEnumeratingWithState:&v322 objects:v353 count:16];
  if (!v71)
  {
LABEL_71:

    int v46 = [(CMIImagePyramid *)v273 releaseTextureAtLevel:0];
    if (!v46)
    {
      for (uint64_t m = 2; m != 4; ++m)
      {
        long long v320 = 0u;
        long long v321 = 0u;
        long long v318 = 0u;
        long long v319 = 0u;
        id v77 = v17;
        uint64_t v78 = [v77 countByEnumeratingWithState:&v318 objects:v352 count:16];
        if (v78)
        {
          uint64_t v79 = v78;
          uint64_t v80 = *(void *)v319;
          while (2)
          {
            for (uint64_t n = 0; n != v79; ++n)
            {
              if (*(void *)v319 != v80) {
                objc_enumerationMutation(v77);
              }
              v82 = [*(id *)(*((void *)&v318 + 1) + 8 * n) pyramid];
              int v33 = [v82 allocateLevel:m withLabel:0];

              if (v33)
              {

                long long v292 = 0;
                v277 = 0;
                uint64_t v281 = 0;
                obuint64_t j = 0;
                v286 = 0;
                long long v288 = 0;
                v275 = 0;
                v276 = 0;
                double v100 = 0;
                unsigned int v101 = 0;
                id v17 = v77;
                int v99 = 0;
                goto LABEL_108;
              }
            }
            uint64_t v79 = [v77 countByEnumeratingWithState:&v318 objects:v352 count:16];
            if (v79) {
              continue;
            }
            break;
          }
        }
      }
      long long v316 = 0u;
      long long v317 = 0u;
      long long v314 = 0u;
      long long v315 = 0u;
      id v17 = v77;
      uint64_t v83 = [v17 countByEnumeratingWithState:&v314 objects:v351 count:16];
      if (v83)
      {
        uint64_t v84 = v83;
        uint64_t v85 = *(void *)v315;
LABEL_84:
        uint64_t v86 = 0;
        while (1)
        {
          if (*(void *)v315 != v85) {
            objc_enumerationMutation(v17);
          }
          unsigned int v87 = [*(id *)(*((void *)&v314 + 1) + 8 * v86) pyramid];
          int v33 = [v87 generate];

          if (v33) {
            goto LABEL_106;
          }
          if (v84 == ++v86)
          {
            uint64_t v84 = [v17 countByEnumeratingWithState:&v314 objects:v351 count:16];
            if (v84) {
              goto LABEL_84;
            }
            break;
          }
        }
      }

      FigMetalDecRef();
      *(void *)&long long v345 = 0;
      memset(v344, 0, sizeof(v344));
      +[RawDFDetectors resetDetectorsOutput:v344];
      unsigned int v88 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
      uint64_t v89 = [v17 lastObject];
      long long v291 = v88;
      if ((void *)v89 != v88)
      {
        id v90 = (id)v89;
        uint64_t v91 = [v88 properties];

        if (v91
          && ([v90 properties], int v92 = objc_claimAutoreleasedReturnValue(), v92, v92))
        {
          uint64_t v93 = [v88 properties];
          double v94 = [v93 meta];
          int v95 = *(unsigned __int8 *)([v94 exposureParams] + 98);

          double v96 = [v90 properties];
          BOOL v97 = [v96 meta];
          int v98 = *(unsigned __int8 *)([v97 exposureParams] + 98);

          int v285 = v95;
          if (v98 == v95)
          {
            unsigned int v88 = v291;
          }
          else
          {
            long long v311 = 0u;
            long long v312 = 0u;
            long long v309 = 0u;
            long long v310 = 0u;
            id obja = v17;
            uint64_t v107 = [obja countByEnumeratingWithState:&v309 objects:v348 count:16];
            if (v107)
            {
              uint64_t v108 = v107;
              v278 = v90;
              uint64_t v109 = *(void *)v310;
              unsigned int v88 = v291;
              while (2)
              {
                for (iuint64_t i = 0; ii != v108; ++ii)
                {
                  if (*(void *)v310 != v109) {
                    objc_enumerationMutation(obja);
                  }
                  float32x4_t v111 = *(void **)(*((void *)&v309 + 1) + 8 * ii);
                  __int16 v112 = [v111 properties];

                  if (!v112)
                  {
                    *(float *)os_log_type_t type = 0.0;
                    v298[0] = OS_LOG_TYPE_DEFAULT;
                    int v237 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    unsigned int v238 = *(_DWORD *)type;
                    if (os_log_type_enabled(v237, OS_LOG_TYPE_DEFAULT)) {
                      unsigned int v239 = v238;
                    }
                    else {
                      unsigned int v239 = v238 & 0xFFFFFFFE;
                    }
                    if (v239)
                    {
                      int v349 = 136315138;
                      v350 = "-[DeepFusionProcessor generateSyntheticLongToOutput:]";
                      _os_log_send_and_compose_impl();
                    }
                    int v33 = -73394;
                    fig_log_call_emit_and_clean_up_after_send_and_compose();

                    goto LABEL_244;
                  }
                  if (v111 != v88)
                  {
                    unsigned int v113 = [v111 properties];
                    __int16 v114 = [v113 meta];
                    int v115 = *(unsigned __int8 *)([v114 exposureParams] + 98);

                    unsigned int v88 = v291;
                    if (v115 == v285)
                    {
                      id v90 = v111;

                      goto LABEL_126;
                    }
                  }
                }
                uint64_t v108 = [obja countByEnumeratingWithState:&v309 objects:v348 count:16];
                if (v108) {
                  continue;
                }
                break;
              }
              id v90 = v278;
            }
            else
            {
              unsigned int v88 = v291;
            }
LABEL_126:
          }
          int v116 = +[RawDFDetectors runMotionToOutput:v344 withRefFrame:v88 withOtherFrame:v90 withPyramidBand:1 withTuningParams:&self->_dfPlist->syntheticReference->motionDetectionTuningParams withMotionDetection:self->_grayGhostDetection];
          if (!v116)
          {
            float v105 = *((float *)v344 + 1);
LABEL_130:

            uint64_t v117 = [MEMORY[0x263EFF980] array];
            if (v117)
            {
              __int16 v118 = (void *)v117;
              long long v307 = 0u;
              long long v308 = 0u;
              long long v305 = 0u;
              long long v306 = 0u;
              int v119 = [(RawDFDeferredFrames *)self->_inputFrames nonReferenceEv0Frames];
              uint64_t v120 = [v119 countByEnumeratingWithState:&v305 objects:v347 count:16];
              id v271 = v118;
              if (v120)
              {
                uint64_t v121 = v120;
                uint64_t v122 = *(void *)v306;
LABEL_133:
                uint64_t v123 = 0;
                while (1)
                {
                  if (*(void *)v306 != v122) {
                    objc_enumerationMutation(v119);
                  }
                  __int16 v124 = *(void **)(*((void *)&v305 + 1) + 8 * v123);
                  int v125 = objc_msgSend(v124, "properties", v267, v268);
                  int v126 = [v125 hasValidRegistration];

                  __int16 v118 = v271;
                  if (v126)
                  {
                    double v127 = [v124 pyramid];
                    [v271 addObject:v127];
                  }
                  if ((unint64_t)[v271 count] > 1) {
                    break;
                  }
                  if (v121 == ++v123)
                  {
                    uint64_t v121 = [v119 countByEnumeratingWithState:&v305 objects:v347 count:16];
                    if (v121) {
                      goto LABEL_133;
                    }
                    break;
                  }
                }
              }

              if (![v118 count])
              {
                if (dword_26B430EE8)
                {
                  int v349 = 0;
                  type[0] = OS_LOG_TYPE_DEFAULT;
                  __int16 v128 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  unsigned int v129 = v349;
                  uint64_t v130 = v128;
                  if (os_log_type_enabled(v130, type[0])) {
                    unsigned int v131 = v129;
                  }
                  else {
                    unsigned int v131 = v129 & 0xFFFFFFFE;
                  }
                  if (v131)
                  {
                    LODWORD(v344[0]) = 136315138;
                    *(void *)((char *)v344 + 4) = "-[DeepFusionProcessor generateSyntheticLongToOutput:]";
                    LODWORD(v268) = 12;
                    v267 = v344;
                    _os_log_send_and_compose_impl();
                  }

                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                  __int16 v118 = v271;
                }
                v132 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
                int v133 = [v132 pyramid];
                [v118 addObject:v133];
              }
              uint64_t v134 = objc_msgSend(v118, "count", v267) + 1;
              memset(v304, 0, sizeof(v304));
              v135 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
              v136 = [v135 properties];
              inputFrames = self->_inputFrames;
              if (self->_hasLongFrame) {
                [(RawDFDeferredFrames *)inputFrames longFrame];
              }
              else {
              v138 = [(RawDFDeferredFrames *)inputFrames referenceEv0Frame];
              }
              v139 = [v138 properties];
              int v33 = +[RawDFSyntheticLongStage fillFrameProperties:v304 withEv0Properties:v136 withLongProperties:v139 ev0Count:v134];

              if (v33)
              {
                FigDebugAssert3();
              }
              else
              {
                int v269 = v134;
                uint64_t v140 = [(SyntheticLongConfigPlist *)self->_dfPlist->syntheticLong getConfigForFusionType:@"EV0s"];
                if (v140)
                {
                  v141 = (void *)v140;
                  v142 = @"StaticParameters";
                  if (v105 > *(float *)(v140 + 20)) {
                    v142 = @"DefaultParameters";
                  }
                  long long v292 = v142;
                  uint64_t v143 = objc_msgSend(v141, "getConfigForSceneMode:");
                  v286 = v141;
                  if (v143)
                  {
                    unsigned int v144 = (void *)v143;
                    unsigned int v145 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
                    uint64_t v146 = [v145 pyramid];

                    obuint64_t j = v144;
                    if (v146)
                    {
                      warpStage = self->_warpStage;
                      uint64_t v148 = *(void *)&self->_applyColorCubeFixOverride;
                      id v149 = v343;
                      id v303 = v343;
                      uint64_t v270 = (void *)v146;
                      int v33 = [(CMIWarpStage *)warpStage fuseRefEv0Pyramid:v146 withEv0Pyramids:v271 frameProperties:v304 slPlist:v144 lscGainsTex:v148 outputSyntheticEv0:&v303 outputWeightsPyramid:v273];
                      id v279 = v303;
                      id v343 = v279;

                      if (v33)
                      {
                        FigDebugAssert3();
                        v277 = 0;
                        uint64_t v281 = 0;
                        long long v288 = 0;
                        v275 = 0;
                        v276 = 0;
                        int v99 = 0;
                        unsigned int v35 = v273;
                        int v38 = v274;
                        double v100 = (void *)v146;
                        unsigned int v101 = v271;
                        goto LABEL_206;
                      }
                      if (self->_keepReferenceEv0RGB)
                      {
                        unsigned int v150 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
                        unsigned int v151 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
                        unsigned int v152 = [v151 pyramid];
                        unsigned int v153 = [v152 getTextureAtLevel:0];
                        [v150 checkAndSetRgbTex:v153];
                      }
                      long long v301 = 0u;
                      long long v302 = 0u;
                      long long v299 = 0u;
                      long long v300 = 0u;
                      id v154 = v17;
                      uint64_t v155 = [v154 countByEnumeratingWithState:&v299 objects:v346 count:16];
                      if (v155)
                      {
                        uint64_t v156 = v155;
                        uint64_t v157 = *(void *)v300;
                        do
                        {
                          for (juint64_t j = 0; jj != v156; ++jj)
                          {
                            if (*(void *)v300 != v157) {
                              objc_enumerationMutation(v154);
                            }
                            v159 = [*(id *)(*((void *)&v299 + 1) + 8 * jj) pyramid];
                            [v159 releaseAll];
                          }
                          uint64_t v156 = [v154 countByEnumeratingWithState:&v299 objects:v346 count:16];
                        }
                        while (v156);
                      }

                      if (self->_hasLongFrame)
                      {
                        unsigned int v160 = [(RawDFDeferredFrames *)self->_inputFrames longFrame];
                        unsigned int v161 = [[CMIImagePyramid alloc] initWithMetalContext:self->_metal];
                        v272 = v161;
                        if (v161)
                        {
                          unsigned int v162 = v161;
                          int v163 = [(CMIImagePyramid *)v161 configureWithDescriptor:v13];
                          if (v163
                            || (int v163 = [(CMIImagePyramid *)v162 setTexture:v279 atLevel:0]) != 0
                            || (int v163 = [(CMIImagePyramid *)v162 allocateWithLabel:0]) != 0
                            || (int v163 = [(CMIImagePyramid *)v162 generate]) != 0)
                          {
                            int v33 = v163;
                            goto LABEL_309;
                          }
                          unsigned int v164 = [v160 pyramid];
                          int v33 = [v164 configureWithDescriptor:v13];

                          if (v33) {
                            goto LABEL_309;
                          }
                          unsigned int v165 = [v160 pyramid];
                          int v33 = [v165 allocateLevel:0 withLabel:0];

                          if (v33) {
                            goto LABEL_309;
                          }
                          int v166 = [(DeepFusionProcessor *)self _demosaicAndProcessFrame:v160 withWarpFrame:0];
                          if (v166)
                          {
                            int v33 = v166;
                            FigDebugAssert3();
                            goto LABEL_309;
                          }
                          [v160 releaseBaseTex];
                          unsigned int v167 = [v160 pyramid];
                          v168 = [v167 getTextureAtLevel:0];

                          if (v168)
                          {
                            long long v289 = v168;
                            long long v345 = 0u;
                            memset(v344, 0, sizeof(v344));
                            unsigned int v169 = [v160 properties];
                            unsigned int v170 = (float32x4_t *)[v169 regHomography];
                            double RelativeHomography = getRelativeHomography(*(simd_float3x3 *)self->_anon_120, *v170, v170[1], v170[2]);
                            DWORD2(v344[0]) = v172;
                            DWORD2(v344[1]) = v173;
                            *(double *)v344 = RelativeHomography;
                            *(void *)&v344[1] = v174;
                            DWORD2(v345) = v175;
                            *(void *)&long long v345 = v176;

                            int v177 = -[RawDFNetworkStage prepareWithImageWidth:imageHeight:](self->_rawDFNetworkStage, "prepareWithImageWidth:imageHeight:", [v279 width], objc_msgSend(v279, "height"));
                            unsigned int v178 = v160;
                            if (v177)
                            {
                              int v33 = v177;
                              FigDebugAssert3();
                            }
                            else
                            {
                              uint64_t v282 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
                              unsigned int v179 = [v282 properties];
                              unsigned int v180 = [v179 meta];
                              uint64_t v181 = [v180 exposureParams];
                              unsigned int v182 = [v178 properties];
                              unsigned int v183 = [v182 meta];
                              uint64_t v184 = [v183 exposureParams];
                              unsigned int v185 = [v178 properties];
                              float RelativeBrightnessForProperties = getRelativeBrightnessForProperties(v181, v184, v185);

                              rawDFNetworkStage = self->_rawDFNetworkStage;
                              unsigned int v188 = [v178 rgbTex];
                              *(float *)&double v189 = RelativeBrightnessForProperties;
                              int v33 = [(RawDFNetworkStage *)rawDFNetworkStage runWithReferenceTex:v279 nonReferenceTex:v188 warpedTex:v289 relativeBrightness:v344 homography:0 alwaysDense:v189];

                              unsigned int v160 = v178;
                              if (v33)
                              {
                                FigDebugAssert3();
                              }
                              else
                              {
                                [(RawDFNetworkStage *)self->_rawDFNetworkStage reset];
                                [v178 releaseRgbTex];

                                unsigned int v190 = [v178 pyramid];
                                [v190 allocateWithLabel:0];

                                unsigned int v191 = [v178 pyramid];
                                int v33 = [v191 generate];

                                if (!v33)
                                {
                                  uint64_t v192 = [(SyntheticLongConfigPlist *)self->_dfPlist->syntheticLong getConfigForFusionType:@"EV0s_LONG"];
                                  if (v192)
                                  {
                                    unsigned int v193 = (float *)v192;
                                    *(float *)os_log_type_t type = 0.0;
                                    v194 = [v178 metadata];
                                    int v195 = [(DeepFusionProcessor *)self _getGyroMotionScoreFromMetadata:v194 gyroScore:type];

                                    if (v195)
                                    {
                                      *(_DWORD *)long long v298 = 0;
                                      os_log_type_t v297 = OS_LOG_TYPE_DEFAULT;
                                      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                                      unsigned int v196 = (id)objc_claimAutoreleasedReturnValue();
                                      os_log_type_enabled(v196, OS_LOG_TYPE_DEFAULT);

                                      fig_log_call_emit_and_clean_up_after_send_and_compose();
                                      BOOL v205 = 0;
                                    }
                                    else
                                    {
                                      BOOL v205 = *(float *)type > v193[4];
                                    }
                                    if (!self->_hasEVM || v205)
                                    {
                                      unsigned int v208 = v292;
                                      if (!v205)
                                      {
LABEL_194:
                                        unsigned int v209 = @"StaticParameters";
LABEL_198:

                                        long long v292 = v209;
                                        uint64_t v210 = [v193 getConfigForSceneMode:v209];
                                        v277 = (void *)v210;
                                        uint64_t v281 = v193;
                                        if (v210)
                                        {
                                          uint64_t v211 = v210;
                                          unsigned int v212 = self->_warpStage;
                                          v213 = [v178 pyramid];
                                          uint64_t v214 = *(void *)&self->_applyColorCubeFixOverride;
                                          id v295 = 0;
                                          id v296 = 0;
                                          id v294 = 0;
                                          int v33 = [(CMIWarpStage *)v212 fuseRefSyntheticEv0Pyramid:v272 withLongPyramid:v213 syntheticEv0WeightsPyramid:v273 frameProperties:v304 slPlist:v211 lscGainsTex:v214 outputSyntheticLong:&v296 outputNoiseDivisorSyntheticEv0:&v295 outputNoiseDivisorSyntheticLong:&v294];
                                          id v215 = v296;
                                          id v216 = v295;
                                          id v217 = v294;

                                          v275 = v215;
                                          v276 = v216;
                                          if (v33)
                                          {
                                            id v218 = v217;
                                            FigDebugAssert3();
                                          }
                                          else
                                          {
                                            [v290 setOutputSyntheticLong:v215];
                                            [v290 setNoiseDivisorSyntheticEV0:v216];
                                            id v218 = v217;
                                            [v290 setNoiseDivisorSyntheticLong:v217];
                                            [v290 setEv0Count:v269];
                                            int v33 = 0;
                                          }
                                        }
                                        else
                                        {
                                          *(_DWORD *)long long v298 = 0;
                                          os_log_type_t v297 = OS_LOG_TYPE_DEFAULT;
                                          fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                                          v260 = (id)objc_claimAutoreleasedReturnValue();
                                          os_log_type_enabled(v260, OS_LOG_TYPE_DEFAULT);
                                          int v33 = -73394;

                                          fig_log_call_emit_and_clean_up_after_send_and_compose();
                                          id v218 = 0;
                                          v275 = 0;
                                          v276 = 0;
                                        }
                                        int v99 = v272;
                                        long long v288 = v218;

                                        goto LABEL_202;
                                      }
                                    }
                                    else
                                    {
                                      unsigned int v206 = [(RawDFDeferredFrames *)self->_inputFrames sifrFrame];
                                      BOOL v207 = +[RawDFDetectors srShouldUseMotionScoreBasedOnEvm:v206 andSRTuning:self->_dfPlist->syntheticReference];

                                      if (!v207)
                                      {
                                        unsigned int v209 = @"StaticParameters";
                                        unsigned int v208 = v292;
                                        goto LABEL_198;
                                      }
                                      unsigned int v208 = v292;
                                      if (self->_detectors.grayGhostDetectionScore <= v193[5]) {
                                        goto LABEL_194;
                                      }
                                    }
                                    unsigned int v209 = @"DefaultParameters";
                                    goto LABEL_198;
                                  }
                                  *(float *)os_log_type_t type = 0.0;
                                  v298[0] = OS_LOG_TYPE_DEFAULT;
                                  v257 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                                  unsigned int v258 = *(_DWORD *)type;
                                  if (os_log_type_enabled(v257, OS_LOG_TYPE_DEFAULT)) {
                                    unsigned int v259 = v258;
                                  }
                                  else {
                                    unsigned int v259 = v258 & 0xFFFFFFFE;
                                  }
                                  if (v259)
                                  {
                                    int v349 = 136315138;
                                    v350 = "-[DeepFusionProcessor generateSyntheticLongToOutput:]";
                                    _os_log_send_and_compose_impl();
                                  }
                                  int v33 = -73394;
                                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                                }
                              }
                            }
LABEL_309:

                            v277 = 0;
                            uint64_t v281 = 0;
                            long long v288 = 0;
                            v275 = 0;
                            v276 = 0;
                            id v17 = 0;
                            unsigned int v101 = 0;
                            unsigned int v35 = v273;
                            int v38 = v274;
                            double v100 = v270;
                            int v99 = v272;
                            goto LABEL_206;
                          }
                          int v349 = 0;
                          type[0] = OS_LOG_TYPE_DEFAULT;
                          uint64_t v252 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                          int v255 = v349;
                          if (!os_log_type_enabled(v252, type[0])) {
                            v255 &= ~1u;
                          }
                          if (v255)
                          {
                            int v256 = [v160 uniqueFrameId];
                            LODWORD(v344[0]) = 136315394;
                            *(void *)((char *)v344 + 4) = "-[DeepFusionProcessor generateSyntheticLongToOutput:]";
                            WORD6(v344[0]) = 1024;
                            *(_DWORD *)((char *)v344 + 14) = v256;
                            _os_log_send_and_compose_impl();
                          }
                          int v33 = -73394;
                        }
                        else
                        {
                          int v349 = 0;
                          type[0] = OS_LOG_TYPE_DEFAULT;
                          uint64_t v252 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                          unsigned int v253 = v349;
                          if (os_log_type_enabled(v252, type[0])) {
                            unsigned int v254 = v253;
                          }
                          else {
                            unsigned int v254 = v253 & 0xFFFFFFFE;
                          }
                          if (v254)
                          {
                            LODWORD(v344[0]) = 136315138;
                            *(void *)((char *)v344 + 4) = "-[DeepFusionProcessor generateSyntheticLongToOutput:]";
                            _os_log_send_and_compose_impl();
                          }
                          int v33 = -73394;
                        }
                        fig_log_call_emit_and_clean_up_after_send_and_compose();

                        goto LABEL_309;
                      }
                      unsigned int v197 = objc_opt_new();
                      [v197 setLabel:0];
                      unsigned int v198 = [v197 desc];
                      [v198 setWidth:v287 >> 1];

                      unsigned int v199 = [v197 desc];
                      [v199 setHeight:v280 >> 1];

                      unsigned int v200 = [(FigMetalContext *)self->_metal allocator];
                      v201 = (void *)[v200 newTextureWithDescriptor:v197];

                      long long v288 = v201;
                      if (v201)
                      {
                        int v202 = [(RegDense *)self->_regDense clearTexture:v201];
                        if (!v202)
                        {
                          [v290 setOutputSyntheticLong:v279];
                          FigMetalIncRef();
                          unsigned int v203 = [(CMIImagePyramid *)v273 getTextureAtLevel:0];
                          [v290 setNoiseDivisorSyntheticEV0:v203];

                          v204 = [v290 noiseDivisorSyntheticEV0];
                          FigMetalIncRef();

                          [v290 setNoiseDivisorSyntheticLong:v201];
                          [v290 setEv0Count:v269];
                          int v33 = 0;
LABEL_188:

                          v277 = 0;
                          uint64_t v281 = 0;
                          v275 = 0;
                          v276 = 0;
                          int v99 = 0;
LABEL_202:
                          id v17 = 0;
                          unsigned int v101 = 0;
                          unsigned int v35 = v273;
                          int v38 = v274;
                          double v100 = v270;
                          goto LABEL_206;
                        }
                        int v33 = v202;
                        int v349 = 0;
                        type[0] = OS_LOG_TYPE_DEFAULT;
                        v261 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                        int v264 = v349;
                        if (!os_log_type_enabled(v261, type[0])) {
                          v264 &= ~1u;
                        }
                        if (v264)
                        {
                          id v265 = [v201 label];
                          uint64_t v266 = [v265 UTF8String];
                          LODWORD(v344[0]) = 136315650;
                          *(void *)((char *)v344 + 4) = "-[DeepFusionProcessor generateSyntheticLongToOutput:]";
                          WORD6(v344[0]) = 2080;
                          *(void *)((char *)v344 + 14) = v266;
                          WORD3(v344[1]) = 1024;
                          DWORD2(v344[1]) = v33;
                          _os_log_send_and_compose_impl();
                        }
                      }
                      else
                      {
                        int v349 = 0;
                        type[0] = OS_LOG_TYPE_DEFAULT;
                        v261 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                        int v262 = v349;
                        if (!os_log_type_enabled(v261, type[0])) {
                          v262 &= ~1u;
                        }
                        if (v262)
                        {
                          uint64_t v263 = [v197 label];
                          LODWORD(v344[0]) = 136315394;
                          *(void *)((char *)v344 + 4) = "-[DeepFusionProcessor generateSyntheticLongToOutput:]";
                          WORD6(v344[0]) = 2112;
                          *(void *)((char *)v344 + 14) = v263;
                          _os_log_send_and_compose_impl();
                        }
                        int v33 = -73394;
                      }
                      fig_log_call_emit_and_clean_up_after_send_and_compose();

                      goto LABEL_188;
                    }
                    int v349 = 0;
                    type[0] = OS_LOG_TYPE_DEFAULT;
                    v248 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    unsigned int v249 = v349;
                    if (os_log_type_enabled(v248, type[0])) {
                      unsigned int v250 = v249;
                    }
                    else {
                      unsigned int v250 = v249 & 0xFFFFFFFE;
                    }
                    if (v250)
                    {
                      LODWORD(v344[0]) = 136315138;
                      *(void *)((char *)v344 + 4) = "-[DeepFusionProcessor generateSyntheticLongToOutput:]";
                      _os_log_send_and_compose_impl();
                    }
                    int v33 = -73394;
                    fig_log_call_emit_and_clean_up_after_send_and_compose();

                    v277 = 0;
                    uint64_t v281 = 0;
                  }
                  else
                  {
                    int v349 = 0;
                    type[0] = OS_LOG_TYPE_DEFAULT;
                    v245 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    unsigned int v246 = v349;
                    if (os_log_type_enabled(v245, type[0])) {
                      unsigned int v247 = v246;
                    }
                    else {
                      unsigned int v247 = v246 & 0xFFFFFFFE;
                    }
                    if (v247)
                    {
                      LODWORD(v344[0]) = 136315138;
                      *(void *)((char *)v344 + 4) = "-[DeepFusionProcessor generateSyntheticLongToOutput:]";
                      _os_log_send_and_compose_impl();
                    }
                    int v33 = -73394;
                    fig_log_call_emit_and_clean_up_after_send_and_compose();

                    v277 = 0;
                    uint64_t v281 = 0;
                    obuint64_t j = 0;
                  }
                  long long v288 = 0;
                  v275 = 0;
                  v276 = 0;
                  double v100 = 0;
                  unsigned int v35 = v273;
                  int v38 = v274;
                  int v99 = 0;
LABEL_304:
                  unsigned int v101 = v271;
                  goto LABEL_206;
                }
                int v349 = 0;
                type[0] = OS_LOG_TYPE_DEFAULT;
                unsigned int v242 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v243 = v349;
                if (os_log_type_enabled(v242, type[0])) {
                  unsigned int v244 = v243;
                }
                else {
                  unsigned int v244 = v243 & 0xFFFFFFFE;
                }
                if (v244)
                {
                  LODWORD(v344[0]) = 136315138;
                  *(void *)((char *)v344 + 4) = "-[DeepFusionProcessor generateSyntheticLongToOutput:]";
                  _os_log_send_and_compose_impl();
                }
                int v33 = -73394;
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              long long v292 = 0;
              v277 = 0;
              uint64_t v281 = 0;
              obuint64_t j = 0;
              v286 = 0;
              long long v288 = 0;
              v275 = 0;
              v276 = 0;
              int v99 = 0;
              double v100 = 0;
              unsigned int v35 = v273;
              int v38 = v274;
              goto LABEL_304;
            }
            int v349 = 0;
            type[0] = OS_LOG_TYPE_DEFAULT;
            unsigned int v234 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v240 = v349;
            if (os_log_type_enabled(v234, type[0])) {
              unsigned int v241 = v240;
            }
            else {
              unsigned int v241 = v240 & 0xFFFFFFFE;
            }
            if (!v241)
            {
LABEL_251:
              int v33 = -73394;
              fig_log_call_emit_and_clean_up_after_send_and_compose();

              goto LABEL_107;
            }
            LODWORD(v344[0]) = 136315138;
            *(void *)((char *)v344 + 4) = "-[DeepFusionProcessor generateSyntheticLongToOutput:]";
LABEL_237:
            _os_log_send_and_compose_impl();
            goto LABEL_251;
          }
          int v33 = v116;
        }
        else
        {
          *(float *)os_log_type_t type = 0.0;
          v298[0] = OS_LOG_TYPE_DEFAULT;
          uint64_t v251 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v251, OS_LOG_TYPE_DEFAULT);
          int v33 = -73394;
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
LABEL_244:

        goto LABEL_107;
      }
      float v105 = 0.0;
      if (dword_26B430EE8)
      {
        *(float *)os_log_type_t type = 0.0;
        v298[0] = OS_LOG_TYPE_DEFAULT;
        id v106 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      id v90 = v88;
      goto LABEL_130;
    }
LABEL_209:
    int v33 = v46;
    goto LABEL_107;
  }
  uint64_t v72 = v71;
  uint64_t v73 = *(void *)v323;
LABEL_65:
  uint64_t v74 = 0;
  while (1)
  {
    if (*(void *)v323 != v73) {
      objc_enumerationMutation(v17);
    }
    double v75 = [*(id *)(*((void *)&v322 + 1) + 8 * v74) pyramid];
    int v33 = [v75 allocateLevel:1 withLabel:0];

    if (v33) {
      break;
    }
    if (v72 == ++v74)
    {
      uint64_t v72 = [v17 countByEnumeratingWithState:&v322 objects:v353 count:16];
      if (v72) {
        goto LABEL_65;
      }
      goto LABEL_71;
    }
  }
LABEL_106:

LABEL_107:
  long long v292 = 0;
  v277 = 0;
  uint64_t v281 = 0;
  obuint64_t j = 0;
  v286 = 0;
  long long v288 = 0;
  v275 = 0;
  v276 = 0;
  int v99 = 0;
  double v100 = 0;
  unsigned int v101 = 0;
LABEL_108:
  unsigned int v35 = v273;
  int v38 = v274;
LABEL_206:
  FigMetalDecRef();
  [(CMIImagePyramid *)v99 releaseAll];
  [(CMIImagePyramid *)v35 releaseAll];
  unsigned int v220 = [(RawDFDeferredFrames *)self->_inputFrames longFrame];
  [v220 pyramid];
  v222 = unsigned int v221 = v99;
  [v222 releaseAll];

  return v33;
}

- (int)warpSyntheticLongIfNecessary:(id)a3 toSyntheticReference:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 outputSyntheticLong];

  if (v8)
  {
    if (!self->_dsrMode
      || self->_detectors.grayGhostDetectionScore <= self->_dfPlist->deferredProcessing->denseRegistrationMotionScoreThreshold)
    {
      int v30 = 0;
      goto LABEL_12;
    }
    uint64_t v9 = [(NSDictionary *)self->_nrfInfoDict exposureParams];
    BOOL v10 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
    uint64_t v11 = [v10 properties];
    int v12 = [v11 meta];
    float RelativeBrightness = getRelativeBrightness(v9, [v12 exposureParams], 2);

    int v14 = [(FigMetalContext *)self->_metal allocator];
    uint64_t v15 = [v14 newTextureDescriptor];

    if (v15)
    {
      uint64_t v16 = [v15 desc];
      [v16 setUsage:7];

      id v17 = [v15 desc];
      [v17 setPixelFormat:115];

      float v18 = [v6 outputSyntheticLong];
      uint64_t v19 = [v18 width];
      uint64_t v20 = [v15 desc];
      [v20 setWidth:v19];

      uint64_t v21 = [v6 outputSyntheticLong];
      uint64_t v22 = [v21 height];
      id v23 = [v15 desc];
      [v23 setHeight:v22];

      [v15 setLabel:0];
      id v24 = [(FigMetalContext *)self->_metal allocator];
      uint64_t v25 = (void *)[v24 newTextureWithDescriptor:v15];

      rawDFNetworkStage = self->_rawDFNetworkStage;
      int v27 = [v6 outputSyntheticLong];
      uint64_t v28 = [v27 width];
      uint64_t v29 = [v6 outputSyntheticLong];
      int v30 = -[RawDFNetworkStage prepareWithImageWidth:imageHeight:](rawDFNetworkStage, "prepareWithImageWidth:imageHeight:", v28, [v29 height]);

      if (v30)
      {
        FigDebugAssert3();
      }
      else
      {
        int v31 = self->_rawDFNetworkStage;
        int v32 = [v7 outputSyntheticReference];
        int v33 = [v6 outputSyntheticLong];
        *(float *)&double v34 = RelativeBrightness;
        int v30 = [(RawDFNetworkStage *)v31 runWithReferenceTex:v32 nonReferenceTex:v33 warpedTex:v25 relativeBrightness:MEMORY[0x263EF89A0] homography:1 alwaysDense:v34];

        if (!v30)
        {
          uint64_t v59 = [v6 outputSyntheticLong];
          FigMetalDecRef();
          [v6 setOutputSyntheticLong:v25];

          unsigned int v35 = [v15 desc];
          [v35 setPixelFormat:25];

          int v36 = [v6 noiseDivisorSyntheticEV0];
          uint64_t v37 = [v36 width];
          int v38 = [v15 desc];
          [v38 setWidth:v37];

          uint64_t v39 = [v6 noiseDivisorSyntheticEV0];
          uint64_t v40 = [v39 height];
          uint64_t v41 = [v15 desc];
          [v41 setHeight:v40];

          [v15 setLabel:0];
          unsigned int v42 = [(FigMetalContext *)self->_metal allocator];
          unsigned int v43 = (void *)[v42 newTextureWithDescriptor:v15];

          uint64_t v44 = self->_rawDFNetworkStage;
          id v45 = [v6 noiseDivisorSyntheticEV0];
          int v30 = [(RawDFNetworkStage *)v44 warpAdditionalImage:v45 warpedImage:v43 homography:MEMORY[0x263EF89A0] hybridReg:0 alwaysDense:1];

          if (v30) {
            goto LABEL_16;
          }
          uint64_t v60 = [v6 noiseDivisorSyntheticEV0];
          FigMetalDecRef();
          [v6 setNoiseDivisorSyntheticEV0:v43];

          int v46 = [v15 desc];
          [v46 setPixelFormat:25];

          uint64_t v47 = [v6 noiseDivisorSyntheticLong];
          uint64_t v48 = [v47 width];
          uint64_t v49 = [v15 desc];
          [v49 setWidth:v48];

          id v50 = [v6 noiseDivisorSyntheticLong];
          uint64_t v51 = [v50 height];
          int v52 = [v15 desc];
          [v52 setHeight:v51];

          [v15 setLabel:0];
          id v53 = [(FigMetalContext *)self->_metal allocator];
          unsigned int v43 = (void *)[v53 newTextureWithDescriptor:v15];

          uint64_t v54 = self->_rawDFNetworkStage;
          uint64_t v55 = [v6 noiseDivisorSyntheticLong];
          int v30 = [(RawDFNetworkStage *)v54 warpAdditionalImage:v55 warpedImage:v43 homography:MEMORY[0x263EF89A0] hybridReg:0 alwaysDense:1];

          if (v30)
          {
LABEL_16:
            uint64_t v58 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            goto LABEL_12;
          }
          int v61 = [v6 noiseDivisorSyntheticLong];
          FigMetalDecRef();
          [v6 setNoiseDivisorSyntheticLong:v43];

          [(RawDFNetworkStage *)self->_rawDFNetworkStage reset];
          goto LABEL_10;
        }
        uint64_t v57 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      goto LABEL_12;
    }
  }
  uint64_t v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  int v30 = -73386;
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_10:

LABEL_12:
  return v30;
}

- (int)brightnessMatchIntoOutputQuadra:(id)a3 inputQuadra:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6 || !v7)
  {
    int v26 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    BOOL v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    int v18 = -73400;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_14:

    goto LABEL_7;
  }
  uint64_t v9 = [(FigMetalContext *)self->_metal commandQueue];
  BOOL v10 = [v9 commandBuffer];

  if (!v10)
  {
    FigDebugAssert3();
    int v18 = FigSignalErrorAt();
    goto LABEL_7;
  }
  uint64_t v11 = [v10 computeCommandEncoder];
  if (!v11)
  {
    int v26 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    int v18 = -73400;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_13:

    goto LABEL_14;
  }
  int v12 = v11;
  if (!self->_semanticStylesStage->_shaders)
  {
    int v26 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    int v18 = -73400;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_13;
  }
  -[NSObject setComputePipelineState:](v11, "setComputePipelineState:");
  [v12 setTexture:v8 atIndex:0];
  [v12 setTexture:v6 atIndex:1];
  uint64_t v13 = [(NSDictionary *)self->_nrfInfoDict exposureParams];
  int v14 = [(RawDFDeferredFrames *)self->_inputFrames quadraFrame];
  uint64_t v15 = [v14 properties];
  uint64_t v16 = [v15 meta];
  float RelativeBrightness = getRelativeBrightness(v13, [v16 exposureParams], 2);

  float v24 = RelativeBrightness;
  [v12 setBytes:&v24 length:4 atIndex:0];
  [v12 setImageblockWidth:32 height:32];
  v23[0] = [v6 width];
  v23[1] = [v6 height];
  v23[2] = 1;
  int64x2_t v21 = vdupq_n_s64(0x20uLL);
  uint64_t v22 = 1;
  [v12 dispatchThreads:v23 threadsPerThreadgroup:&v21];
  [v12 endEncoding];
  [v10 commit];

  int v18 = 0;
LABEL_7:

  return v18;
}

- (int)runNetworkFusionWithInputSyntheticLong:(id)a3 inputSytheticReference:(id)a4 output:(id)a5
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = [v9 outputSyntheticLong];

  if (!v12
    || ([(FigMetalContext *)self->_metal allocator],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = (void *)[v13 newTextureDescriptor],
        v13,
        !v14))
  {
    uint64_t v47 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
    int v40 = -73388;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v55 = 0;
    uint64_t v56 = 0;
    int v14 = 0;
    goto LABEL_11;
  }
  id v54 = v11;
  uint64_t v15 = [v14 desc];
  [v15 setUsage:7];

  uint64_t v16 = [v9 outputSyntheticLong];
  unint64_t v17 = [v16 width];

  int v18 = [v9 outputSyntheticLong];
  unint64_t v19 = [v18 height];

  uint64_t v20 = [v14 desc];
  [v20 setPixelFormat:25];

  int64x2_t v21 = [v14 desc];
  [v21 setWidth:v17];

  uint64_t v22 = [v14 desc];
  [v22 setHeight:v19];

  [v14 setLabel:0];
  id v23 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v24 = [v23 newTextureWithDescriptor:v14];

  uint64_t v56 = (void *)v24;
  if (!v24)
  {
    uint64_t v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
    id v11 = v54;
    int v40 = -73388;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v55 = 0;
    uint64_t v56 = 0;
    goto LABEL_11;
  }
  uint64_t v25 = [v14 desc];
  [v25 setPixelFormat:65];

  int v26 = [v14 desc];
  [v26 setWidth:v17 >> 1];

  uint64_t v27 = [v14 desc];
  [v27 setHeight:v19 >> 1];

  [v14 setLabel:0];
  uint64_t v28 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v29 = [v28 newTextureWithDescriptor:v14];

  uint64_t v55 = (void *)v29;
  if (v29)
  {
    if (*(void *)&self->_applyColorCubeFixOverride)
    {
      int v30 = [(NRFConcurrentProcessing *)self->_concurrentProcessing tuningParams];

      if (v30)
      {
        concurrentProcessing = self->_concurrentProcessing;
        int v32 = [v9 outputSyntheticLong];
        [v10 outputSyntheticReference];
        v34 = int v33 = v10;
        unsigned int v35 = [v9 noiseDivisorSyntheticEV0];
        id v36 = v9;
        uint64_t v37 = [v9 noiseDivisorSyntheticLong];
        int v38 = v33;
        uint64_t v39 = [v33 fusionMap];
        int v40 = [(NRFConcurrentProcessing *)concurrentProcessing runWithSyntheticLong:v32 syntheticReference:v34 syntheticEV0FusionMap:v35 syntheticLongFusionMap:v37 syntheticReferenceFusionMap:v39 lscGains:*(void *)&self->_applyColorCubeFixOverride skyMask:self->_inferenceResultsBindings.personMask skinMask:self->_inferenceResultsBindings.skyMask frameMeta:&self->_dfFrameMetadata.motionDetectionScore outputLumaTexture:v56 outputChromaTexture:v55];

        if (v40)
        {
          uint64_t v53 = v5;
          LODWORD(v52) = v40;
          FigDebugAssert3();
        }
        id v10 = v38;
        id v9 = v36;
        goto LABEL_10;
      }
      id v50 = v10;
      uint64_t v51 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);
    }
    else
    {
      id v50 = v10;
      uint64_t v53 = v5;
      LODWORD(v52) = 0;
      FigDebugAssert3();
      uint64_t v51 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);
    }
    id v11 = v54;
    int v40 = -73388;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    id v10 = v50;
    goto LABEL_11;
  }
  uint64_t v49 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
  int v40 = -73388;
  fig_log_call_emit_and_clean_up_after_send_and_compose();

  uint64_t v55 = 0;
LABEL_10:
  id v11 = v54;
LABEL_11:
  objc_msgSend(v11, "setOutputY:", v56, v52, v53);
  [v11 setOutputUV:v55];

  uint64_t v41 = [(RawDFDeferredFrames *)self->_inputFrames syntheticReferenceFrame];
  [v41 releaseRgbTex];

  id v57 = [v10 outputSyntheticReference];
  FigMetalDecRef();
  [v10 setOutputSyntheticReference:0];
  unsigned int v42 = [v10 fusionMap];
  id v43 = v57;
  id v57 = v42;

  FigMetalDecRef();
  [v10 setFusionMap:0];
  uint64_t v44 = [v9 outputSyntheticLong];
  id v45 = v57;
  id v57 = v44;

  FigMetalDecRef();
  [v9 setOutputSyntheticLong:0];

  return v40;
}

- (int)computeAMBNRDenoiseBoostMap:(id)a3 syntheticLongOutput:(id)a4 ev0ExposureParams:(exposureParameters *)a5 longExposureParams:(exposureParameters *)a6 dfNoiseTuningPlist:(id)a7
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  int v14 = a7;
  if (!v12
    || !v13
    || ([v13 noiseDivisorSyntheticEV0],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        !v15)
    || ([v13 noiseDivisorSyntheticLong],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        !v16)
    || !v14)
  {
    int v34 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    int v23 = -73399;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_16:

    goto LABEL_10;
  }
  int v32 = [v13 ev0Count];
  float v31 = interpolate_with_gain(*(void **)(v14[2] + 16), a5->gain);
  float v30 = interpolate_with_gain(*(void **)(v14[2] + 24), a5->gain);
  float v29 = a6->exposure_time / a5->exposure_time;
  unint64_t v17 = [(FigMetalContext *)self->_metal commandQueue];
  int v18 = [v17 commandBuffer];

  if (!v18)
  {
    FigDebugAssert3();
    int v23 = FigSignalErrorAt();
    goto LABEL_10;
  }
  unint64_t v19 = [v18 computeCommandEncoder];
  if (!v19)
  {
    int v34 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    int v23 = -73399;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v20 = v19;
  if (!self->_semanticStylesStage->_metalContext)
  {
    int v34 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v25 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    int v23 = -73399;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_15;
  }
  -[NSObject setComputePipelineState:](v19, "setComputePipelineState:");
  int64x2_t v21 = [v13 noiseDivisorSyntheticEV0];
  [v20 setTexture:v21 atIndex:0];

  uint64_t v22 = [v13 noiseDivisorSyntheticLong];
  [v20 setTexture:v22 atIndex:1];

  [v20 setTexture:v12 atIndex:2];
  [v20 setBytes:&v32 length:4 atIndex:0];
  [v20 setBytes:&v29 length:4 atIndex:1];
  [v20 setBytes:&v31 length:4 atIndex:2];
  [v20 setBytes:&v30 length:4 atIndex:3];
  v28[0] = [v12 width];
  v28[1] = [v12 height];
  v28[2] = 1;
  int64x2_t v26 = vdupq_n_s64(0x20uLL);
  uint64_t v27 = 1;
  [v20 dispatchThreads:v28 threadsPerThreadgroup:&v26];
  [v20 endEncoding];
  [v18 commit];

  int v23 = 0;
LABEL_10:

  return v23;
}

- (int)addInferenceResults:(id)a3 inferenceInputType:(int)a4
{
  id v7 = a3;
  uint64_t v8 = 544;
  if (a4 == 11)
  {
    uint64_t v8 = 584;
    uint64_t v9 = 592;
  }
  else
  {
    uint64_t v9 = 552;
  }
  id v10 = (Class *)((char *)&self->super.isa + v8);
  objc_storeStrong((id *)((char *)&self->super.isa + v8), a3);
  LODWORD(v10) = [(DeepFusionProcessor *)self bindInferenceResults:*v10 toBindings:(char *)self + v9];

  return (int)v10;
}

- (int)finishProcessing
{
  [(FigMetalContext *)self->_metal waitForIdle];
  int v3 = [(NRFConcurrentProcessing *)self->_concurrentProcessing getFinalProcessingStatus];
  if (v3)
  {
    int v4 = v3;
  }
  else
  {
    int v4 = [*(id *)&self->_dfFrameMetadata.hasEVM getFinalProcessingStatus];
    if (!v4) {
      goto LABEL_3;
    }
  }
  FigDebugAssert3();
LABEL_3:
  if (dword_26B430EE8)
  {
    uint64_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v4;
}

- (BOOL)supportsExternalMemoryResource
{
  return 1;
}

- (id)externalMemoryDescriptorForConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  if (v5)
  {
    objc_msgSend(v5, "setMemSize:", -[DeepFusionProcessor getMetalHeapSizeWithOutputWidth:withOutputHeight:withCompressionLevel:cmiResourceEnabled:withAggressiveMemoryOptimizations:](self, "getMetalHeapSizeWithOutputWidth:withOutputHeight:withCompressionLevel:cmiResourceEnabled:withAggressiveMemoryOptimizations:", (int)objc_msgSend(v4, "maxOutputDimensions"), objc_msgSend(v4, "maxOutputDimensions") >> 32, self->_compressionLevel, objc_msgSend(v4, "cmiResourceEnabled"), +[DeepFusionProcessor getAggressiveMemoryOptimizationWithOutputWidth:withOutputHeight:withCompressionLevel:](DeepFusionProcessor, "getAggressiveMemoryOptimizationWithOutputWidth:withOutputHeight:withCompressionLevel:", (int)objc_msgSend(v4, "maxOutputDimensions"), objc_msgSend(v4, "maxOutputDimensions") >> 32, self->_compressionLevel)));
    [v5 setAllocatorType:2];
  }
  else
  {
    FigDebugAssert3();
  }

  return v5;
}

- (int)prepareToProcess:(unsigned int)a3
{
  return -73391;
}

+ (BOOL)getAggressiveMemoryOptimizationWithOutputWidth:(unint64_t)a3 withOutputHeight:(unint64_t)a4 withCompressionLevel:(int)a5
{
  return a4 * a3 > 0x2625A00 && a5 > 0;
}

- (unint64_t)getMetalHeapSizeWithOutputWidth:(unint64_t)a3 withOutputHeight:(unint64_t)a4 withCompressionLevel:(int)a5 cmiResourceEnabled:(BOOL)a6 withAggressiveMemoryOptimizations:(BOOL)a7
{
  unint64_t result = self->_allocatorForceSize;
  if (!result)
  {
    BOOL v8 = a7;
    BOOL v9 = a6;
    float CompressionRatio = getCompressionRatio(a5);
    unint64_t v13 = a4 * a3;
    if (v9) {
      unsigned int v14 = 575;
    }
    else {
      unsigned int v14 = 470;
    }
    if (v13 >= 0xC2E801)
    {
      if (v13 >= 0x1878801)
      {
        unint64_t v15 = vcvtps_u32_f32((float)((float)((float)a3 * (float)a4) / 12773000.0) * (float)v14);
        if (v8) {
          v15 -= 100;
        }
      }
      else
      {
        unint64_t v15 = 875;
      }
    }
    else
    {
      unint64_t v15 = v14 + 65;
    }
    return (unint64_t)(float)(CompressionRatio * (float)v15) << 20;
  }
  return result;
}

- (unint64_t)getBackgroundMetalHeapSizeWithOutputWidth:(unint64_t)a3 withOutputHeight:(unint64_t)a4
{
  uint64_t v4 = 167772160;
  if (a4 * a3 >= 0x1878801) {
    uint64_t v4 = 0x100000;
  }
  if (a4 * a3 >= 0xC2E801) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = 0x100000;
  }
  if (self->_backgroundAllocatorForceSize) {
    return self->_backgroundAllocatorForceSize;
  }
  else {
    return v5;
  }
}

- (int)_allocateRegWarpPPWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5
{
  if (a3 && a4 && a5)
  {
    sharedRegWarpBuffer = self->_sharedRegWarpBuffer;
    if (sharedRegWarpBuffer)
    {
      if (!self->_registrationPipelineRWPP)
      {
        BOOL v9 = (RegWarpPP *)[objc_alloc(MEMORY[0x263F2EE70]) initWithConfig:&self->_registrationPipelineRWPPConfig];
        registrationPipelineRWPP = self->_registrationPipelineRWPP;
        self->_registrationPipelineRWPP = v9;

        if (!self->_registrationPipelineRWPP)
        {
          unint64_t v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();

          return -73420;
        }
        sharedRegWarpBuffer = self->_sharedRegWarpBuffer;
      }
      uint64_t v11 = [(FigWiredMemory *)sharedRegWarpBuffer bytes];
      [(RegWarpPP *)self->_registrationPipelineRWPP setApplyGDC:BYTE2(self->_quadraMotionScore)];
      int v12 = [(RegWarpPP *)self->_registrationPipelineRWPP allocateResources:a3 imageHeight:a4 imageFormat:875704422 externalMemory:v11 externalMemorySize:[(FigWiredMemory *)self->_sharedRegWarpBuffer length]];
      if (v12)
      {
        uint64_t v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else
    {
      FigDebugAssert3();
      unint64_t v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      return -3;
    }
  }
  else
  {
    FigDebugAssert3();
    unsigned int v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return -1;
  }
  return v12;
}

- (BOOL)getKeepReferenceEV0RGBWithOutputWidth:(unint64_t)a3 withOutputHeight:(unint64_t)a4
{
  return a4 * a3 < 0xC2E801;
}

- (int)prepareToProcess:(unsigned int)a3 prepareDescriptor:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v5 = a4;
  self->_originalHeight = (int)[v5 width];
  self->_draftDemosaicCache = (NSMutableDictionary *)(int)[v5 height];
  +[RawDFCommon getRegwarpResourceSetupDimensionsForInputWidth:height:](RawDFCommon, "getRegwarpResourceSetupDimensionsForInputWidth:height:", LODWORD(self->_originalHeight));
  unsigned __int16 v7 = v6;
  unsigned __int16 v9 = v8;
  if (v8) {
    BOOL v10 = v6 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 || (int v11 = [v5 width], v12 = objc_msgSend(v5, "height"), !v11) || !v12)
  {
    FigDebugAssert3();
    uint64_t v52 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
    int v30 = -73391;
    goto LABEL_65;
  }
  uint64_t v13 = v12;
  uint64_t v14 = v11;
  self->_aggressiveMemoryOptimizations = +[DeepFusionProcessor getAggressiveMemoryOptimizationWithOutputWidth:v11 withOutputHeight:v12 withCompressionLevel:self->_compressionLevel];
  self->_BOOL keepReferenceEv0RGB = [(DeepFusionProcessor *)self getKeepReferenceEV0RGBWithOutputWidth:v11 withOutputHeight:v13];
  unint64_t v15 = -[DeepFusionProcessor getMetalHeapSizeWithOutputWidth:withOutputHeight:withCompressionLevel:cmiResourceEnabled:withAggressiveMemoryOptimizations:](self, "getMetalHeapSizeWithOutputWidth:withOutputHeight:withCompressionLevel:cmiResourceEnabled:withAggressiveMemoryOptimizations:", v11, v13, self->_compressionLevel, [v5 cmiResourceEnabled], self->_aggressiveMemoryOptimizations);
  unint64_t v16 = [(DeepFusionProcessor *)self getBackgroundMetalHeapSizeWithOutputWidth:v14 withOutputHeight:v13];
  externalMemoryResource = self->_externalMemoryResource;
  if (externalMemoryResource)
  {
    int v18 = [(CMIExternalMemoryResource *)externalMemoryResource allocatorBackend];
    unint64_t v19 = [(FigMetalContext *)self->_metal allocator];
    uint64_t v20 = [v19 backendAllocator];
    BOOL v21 = v18 != v20;
  }
  else
  {
    BOOL v21 = 0;
  }
  if (self->_allocatorSetupComplete)
  {
    uint64_t v22 = [(FigMetalContext *)self->_metal allocator];
    if (v15 > [v22 memSize]) {
      BOOL v21 = 1;
    }

    if (v21)
    {
      int v23 = [(FigMetalContext *)self->_metal allocator];
      [v23 purgeResources];

      uint64_t v24 = [(FigMetalContext *)self->_backgroundMetal allocator];
      [v24 purgeResources];

      self->_allocatorSetupComplete = 0;
    }
    else if (self->_allocatorSetupComplete)
    {
      goto LABEL_36;
    }
  }
  if (self->_allocatorType == 1 && (self->_compressionLevel & 0x80000000) == 0)
  {
    FigDebugAssert3();
    goto LABEL_63;
  }
  uint64_t v25 = objc_opt_new();
  int64x2_t v26 = v25;
  if (!v25)
  {
LABEL_50:
    FigDebugAssert3();
    int v30 = FigSignalErrorAt();
    goto LABEL_61;
  }
  [v25 setMemSize:v15];
  [v26 setWireMemory:self->_allocatorWireMemory];
  [v26 setCompressionLevel:self->_compressionLevel];
  [v26 setAutoUseSubAllocators:1];
  [v26 setLabel:@"FigMetalAllocator_DeepFusion"];
  if (self->_externalMemoryResource
    && [(DeepFusionProcessor *)self supportsExternalMemoryResource])
  {
    uint64_t v27 = [(CMIExternalMemoryResource *)self->_externalMemoryResource allocatorBackend];
    uint64_t v28 = v27;
    if (v27)
    {
      if ([v27 memSize] < v15)
      {
        int v30 = 0;
      }
      else
      {
        objc_msgSend(v26, "setMemSize:", objc_msgSend(v28, "memSize"));
        float v29 = [(FigMetalContext *)self->_metal allocator];
        int v30 = [v29 setupWithDescriptor:v26 allocatorBackend:v28];

        if (!v30)
        {

          goto LABEL_26;
        }
        FigDebugAssert3();
        FigSignalErrorAt();
      }
    }
    else
    {
      int v30 = FigSignalErrorAt();
    }

    goto LABEL_61;
  }
  float v31 = [(FigMetalContext *)self->_metal allocator];
  int v30 = [v31 setupWithDescriptor:v26];

  if (v30) {
    goto LABEL_51;
  }
LABEL_26:

  int v32 = objc_opt_new();
  int64x2_t v26 = v32;
  if (!v32)
  {
    uint64_t v53 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
    int v30 = -73391;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_61:
    goto LABEL_43;
  }
  [v32 setMemSize:v16];
  [v26 setWireMemory:self->_allocatorWireMemory];
  [v26 setLabel:@"RawDFBackground"];
  int v33 = [(FigMetalContext *)self->_backgroundMetal allocator];
  int v30 = [v33 setupWithDescriptor:v26];

  if (v30)
  {
LABEL_51:
    FigDebugAssert3();
LABEL_52:
    FigSignalErrorAt();
    goto LABEL_61;
  }

  if (LOBYTE(self->_quadraMotionScore))
  {
    long long v34 = *(_OWORD *)&self->_registrationPipelineRWPPConfig.nccPatchRadius;
    v54[0] = *(_OWORD *)&self->_registrationPipelineRWPPConfig.numThreads;
    v54[1] = v34;
    v54[2] = *(_OWORD *)&self->_registrationPipelineRWPPConfig.ransacMinMatchingScoreAccepted;
    unsigned int v35 = [MEMORY[0x263F2EE70] computeExternalMemoryBlockSize:v54 imageWidth:v9 imageHeight:v7 imageFormat:875704422];
    unint64_t v36 = (*MEMORY[0x263EF8AF8] + v35 - 1) & -*MEMORY[0x263EF8AF8];
    if (v36 <= [(FigWiredMemory *)self->_sharedRegWarpBuffer length]) {
      goto LABEL_34;
    }
    [(RegWarpPP *)self->_registrationPipelineRWPP releaseResources];
    sharedRegWarpBuffer = self->_sharedRegWarpBuffer;
    self->_sharedRegWarpBuffer = 0;

    int v38 = (FigWiredMemory *)[objc_alloc(MEMORY[0x263F2BFF0]) initWithLength:v36];
    uint64_t v39 = self->_sharedRegWarpBuffer;
    self->_sharedRegWarpBuffer = v38;

    if (self->_sharedRegWarpBuffer)
    {
      +[RawDFCommon getRegwarpSurfaceDimensionsForInputWidth:LODWORD(self->_originalHeight) height:LODWORD(self->_draftDemosaicCache)];
      if (v41)
      {
        if (v40)
        {
          CVPixelBufferRelease(self->_regWarpInput);
          PixelBufferWithWiringAssertiouint64_t n = (__CVBuffer *)CreatePixelBufferWithWiringAssertion();
          self->_regWarpInput = PixelBufferWithWiringAssertion;
          if (PixelBufferWithWiringAssertion)
          {
LABEL_34:
            [(RegWarpPP *)self->_registrationPipelineRWPP releaseResources];
            registrationPipelineRWPP = self->_registrationPipelineRWPP;
            self->_registrationPipelineRWPP = 0;

            int v44 = [(DeepFusionProcessor *)self _allocateRegWarpPPWithWidth:v9 height:v7 pixelFormat:1278226536];
            if (v44)
            {
              int v30 = v44;
LABEL_56:
              FigDebugAssert3();
              goto LABEL_43;
            }
            goto LABEL_35;
          }
        }
      }
      FigDebugAssert3();
      uint64_t v52 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
      int v30 = -73391;
LABEL_65:
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      goto LABEL_43;
    }
    FigDebugAssert3();
LABEL_63:
    int v30 = FigSignalErrorAt();
    goto LABEL_43;
  }
LABEL_35:
  self->_allocatorSetupComplete = 1;
LABEL_36:
  if ([(IBPSemanticStyleProperties *)self->_semanticStyleProperties buffer])
  {
    id v45 = [(FigMetalContext *)self->_metal device];
    int64x2_t v26 = objc_msgSend(v45, "newBufferWithIOSurface:", CVPixelBufferGetIOSurface((CVPixelBufferRef)-[IBPSemanticStyleProperties buffer](self->_semanticStyleProperties, "buffer")));

    if (v26)
    {
      int v46 = [(FigMetalContext *)self->_metal allocator];
      int v30 = [v46 addExternalMetalBuffer:v26 atSubAllocatorID:0];

      if (!v30)
      {

        goto LABEL_40;
      }
      goto LABEL_52;
    }
    goto LABEL_50;
  }
LABEL_40:
  if (!LOBYTE(self->_quadraMotionScore))
  {
    uint64_t v47 = [(FigMetalContext *)self->_metal allocator];
    [(RawDFPowerBlurStage *)self->_rawDFPowerBlurStage setAllocator:v47];

    int v48 = [(RawDFPowerBlurStage *)self->_rawDFPowerBlurStage allocateResources:v9 imageHeight:v7 imageFormat:1278226536 externalMemory:0 externalMemorySize:0];
    if (v48)
    {
      int v30 = v48;
      goto LABEL_56;
    }
  }
  colorConvertStage = self->_colorConvertStage;
  id v50 = [(FigMetalContext *)self->_metal allocator];
  int v30 = [(ColorConvertStage *)colorConvertStage prepareToProcess:v50];

  if (v30) {
    goto LABEL_56;
  }
LABEL_43:

  return v30;
}

- (int)_setupPostConfig:(id)a3 isForEnhancedRes:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4) {
    uint64_t v7 = 592;
  }
  else {
    uint64_t v7 = 552;
  }
  uint64_t v8 = 544;
  if (v4) {
    uint64_t v8 = 584;
  }
  id v9 = *(id *)((char *)&self->super.isa + v8);
  BOOL v10 = (Class *)((char *)&self->super.isa + v7);
  [v6 setSkinMask:*v10];
  [v6 setSkyMask:v10[1]];
  [v6 setPersonMask:v10[2]];
  [v6 setInstanceMasks:v10[3]];
  int v11 = [v9 faceLandmarks];
  [v6 setFaceLandmarks:v11];

  int v12 = [v9 skinToneClassificationsForFaces];
  [v6 setSkinToneClassificationsForFaces:v12];

  uint64_t v13 = [v9 lowResPersonInstanceConfidences];
  [v6 setLowResPersonInstanceConfidences:v13];

  uint64_t v14 = [v9 smartCameraSceneType];
  [v6 setSmartCameraSceneType:v14];

  [v6 setSemanticStyleProperties:self[1].super.isa];
  BOOL v33 = v4;
  if (v4)
  {
    unint64_t v15 = [(RawDFDeferredFrames *)self->_inputFrames quadraFrame];
    unint64_t v16 = [v15 properties];
    unint64_t v17 = [v16 meta];
    [v6 setDarkestFrameMetadata:v17];

    int v18 = [(RawDFDeferredFrames *)self->_inputFrames quadraFrame];
    uint64_t v19 = 0;
    uint64_t v20 = &OBJC_IVAR___DFPlist_quadraNoiseModel;
    BOOL v21 = &OBJC_IVAR___DFPlist_quadraDenoiseAndSharpening;
    uint64_t v22 = &OBJC_IVAR___DFPlist_quadraToneMapping;
  }
  else
  {
    [v6 setDarkestFrameMetadata:self->_nrfInfoDict];
    int v18 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
    uint64_t v19 = 2;
    uint64_t v20 = &OBJC_IVAR___DFPlist_noiseModel;
    BOOL v21 = &OBJC_IVAR___DFPlist_denoiseAndSharpening;
    uint64_t v22 = &OBJC_IVAR___DFPlist_toneMapping;
  }
  int v23 = [v18 properties];
  uint64_t v24 = [v23 meta];
  [v6 setEv0FrameMetadata:v24];

  [v6 setToneMappingPlist:*(Class *)((char *)&self->_dfPlist->super.super.isa + *v22)];
  [v6 setDenoiseAndSharpeningPlist:*(Class *)((char *)&self->_dfPlist->super.super.isa + *v21)];
  [v6 setNoiseModelPlist:*(Class *)((char *)&self->_dfPlist->super.super.isa + *v20)];
  [v6 setSemanticStylesPlist:self->_dfPlist->semanticStyles];
  [v6 setDefringingTuningParameters:self->_dfPlist->defringingTuningParameters];
  [v6 setGreenGhostBrightLightTuning:self->_dfPlist->greenGhostBrightLightTuning];
  [v6 setTmQuality:v19];
  if (v33)
  {
    [v6 setAllowColorCube:0];
    [v6 setAllowSemanticStyles:0];
    [v6 setAllowGreenGhostMitigation:0];
  }
  else
  {
    [v6 setAmbnrUpsampleOffsetEnabled:0];
  }
  int v25 = -73406;
  [v6 setAmbnrInputPyramidGenerationEnabled:0];
  srlVersiouint64_t n = self->_dfPlist->toneMapping->srlVersion;
  uint64_t v27 = [v6 toneMappingPlist];
  int v28 = v27[22];

  if (srlVersion == v28)
  {
    maskedSkyCubeVersiouint64_t n = self->_dfPlist->toneMapping->maskedSkyCubeVersion;
    int v30 = [v6 toneMappingPlist];
    int v31 = v30[41];

    if (maskedSkyCubeVersion == v31) {
      int v25 = 0;
    }
  }

  return v25;
}

- (int)finalizeOutput:(id)a3 syntheticLongOutput:(id)a4 output:(id)a5
{
  uint64_t v260 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = a5;
  id v255 = 0;
  int v11 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v12 = [v11 usedSize:0];

  unsigned int v239 = v8;
  if (v12)
  {
    unsigned int v254 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    unsigned int v223 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v223, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v248 = 0;
    unsigned int v249 = 0;
    unint64_t v16 = 0;
    int v44 = 0;
    int v45 = 0;

    goto LABEL_99;
  }
  uint64_t v13 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v14 = [v13 newTextureDescriptor];

  v248 = (void *)v14;
  if (!v14)
  {
    unsigned int v254 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v224 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v224, OS_LOG_TYPE_DEFAULT);
    int v45 = -73395;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    unsigned int v240 = 0;
    v248 = 0;
    unsigned int v249 = 0;
LABEL_119:
    unint64_t v16 = 0;
    goto LABEL_120;
  }
  uint64_t v15 = [v8 outputY];
  if (!v15)
  {
    unsigned int v254 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    unsigned int v225 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v225, OS_LOG_TYPE_DEFAULT);
    int v45 = -73395;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    unsigned int v240 = 0;
    unsigned int v249 = 0;
    goto LABEL_119;
  }
  unint64_t v16 = (void *)v15;
  unsigned int v249 = [v8 outputUV];
  if (!v249)
  {
    unsigned int v254 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    unsigned int v226 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v226, OS_LOG_TYPE_DEFAULT);
    int v45 = -73395;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    unsigned int v240 = 0;
    unsigned int v249 = 0;
LABEL_120:
    int v44 = 0;
    goto LABEL_98;
  }
  unint64_t v17 = [[CMIPostConfig alloc] initWithMetalContext:self->_metal];
  if (!v17)
  {
    unsigned int v254 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    unsigned int v227 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v227, OS_LOG_TYPE_DEFAULT);
    int v45 = -73395;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    unsigned int v240 = 0;
    goto LABEL_120;
  }
  int v18 = v17;
  [(CMIPostConfig *)v17 setEnableSTF:LOBYTE(self->_textureUtils)];
  unsigned int v250 = v18;
  if (self->_dfPlist->toneMapping->enableTCR
    && [(MTLTexture *)self->_inferenceResultsBindings.skinMask skyMask])
  {
    unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane((CVPixelBufferRef)[(IBPSemanticStyleProperties *)self->_semanticStyleProperties buffer], 0);
    double v246 = COERCE_DOUBLE(__PAIR64__(CVPixelBufferGetHeightOfPlane((CVPixelBufferRef)[(IBPSemanticStyleProperties *)self->_semanticStyleProperties buffer], 0), WidthOfPlane));
    skinMasuint64_t k = self->_inferenceResultsBindings.skinMask;
    uint64_t v21 = self->_dfPlist->toneMapping->tcr->maskType
        ? [(MTLTexture *)skinMask skinMask]
        : [(MTLTexture *)skinMask skyMask];
    int v22 = [(CMIPostConfig *)v18 regularizeLocalToneCurves:[(NSDictionary *)self->_nrfInfoDict ltmCurvesForBackground] mask:v21 tcrParams:self->_dfPlist->toneMapping->tcr imageDims:v246];
    if (v22)
    {
      int v229 = v22;
      unsigned int v254 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      unsigned int v234 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v234, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      unsigned int v240 = 0;
LABEL_124:
      int v44 = v250;
      goto LABEL_125;
    }
  }
  unsigned int v247 = v9;
  int v23 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  uint64_t v24 = [(RawDFDeferredFrames *)self->_inputFrames sifrFrame];
  inputFrames = self->_inputFrames;
  if (v24) {
    [(RawDFDeferredFrames *)inputFrames sifrFrame];
  }
  else {
  int64x2_t v26 = [(RawDFDeferredFrames *)inputFrames referenceEv0Frame];
  }

  colorConvertStage = self->_colorConvertStage;
  int v28 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  float v29 = [v28 metadata];
  int v30 = [(ColorConvertStage *)colorConvertStage isHazeCorrectionEnabled:v29];

  deviceGeneratiouint64_t n = self->_deviceGeneration;
  unsigned int v240 = v26;
  unsigned int v241 = v10;
  unsigned int v243 = v16;
  if (deviceGeneration != 2)
  {
    if (deviceGeneration == 1)
    {
      if (!v30) {
        goto LABEL_34;
      }
    }
    else if (deviceGeneration || (v30 & 1) == 0)
    {
      goto LABEL_34;
    }
    int v46 = self->_colorConvertStage;
    uint64_t v47 = [v26 metadata];
    int v48 = [(ColorConvertStage *)v46 computeLTMFromLuma:v16 chroma:v249 metadata:v47 applyCCM:[(CMIPostConfig *)v18 tmApplyColorCorrectionMatrix]];

    if (v48)
    {
      uint64_t v49 = *MEMORY[0x263F2F0C0];
      id v50 = [v48 objectForKeyedSubscript:*MEMORY[0x263F2F0C0]];
      if (v50)
      {
        uint64_t v51 = [(RawDFDeferredFrames *)self->_inputFrames sifrFrame];

        if (v51)
        {
          uint64_t v52 = [(RawDFDeferredFrames *)self->_inputFrames sifrFrame];
          uint64_t v53 = [v52 properties];
          id v54 = [v53 meta];
          +[SoftLTM updateFrameProperties:v54 withHazeCorrection:v50];
        }
        uint64_t v55 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];

        if (v55)
        {
          uint64_t v56 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
          id v57 = [v56 properties];
          uint64_t v58 = [v57 meta];
          +[SoftLTM updateFrameProperties:v58 withHazeCorrection:v50];
        }
        uint64_t v59 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:*(void *)&self->_processingMode];
        uint64_t v60 = *(void **)&self->_processingMode;
        *(void *)&self->_processingMode = v59;

        [*(id *)&self->_processingMode setValue:v50 forKey:v49];
      }

      BOOL v10 = v241;
LABEL_34:
      if (*v23 == 1) {
        kdebug_trace();
      }
      if ([(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputPixelBuffer])
      {
        int v61 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputMetadata];

        id v9 = v247;
        if (!v61) {
          goto LABEL_105;
        }
        uint64_t v62 = *MEMORY[0x263F04038];
        BOOL v63 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputMetadata];
        [v63 setObject:v62 forKeyedSubscript:*MEMORY[0x263F04020]];

        uint64_t v64 = *MEMORY[0x263F03FE8];
        int v65 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputMetadata];
        [v65 setObject:v64 forKeyedSubscript:*MEMORY[0x263F03FC0]];

        uint64_t v66 = [(NSDictionary *)self->_nrfInfoDict exposureParams];
        int v67 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
        long long v68 = [v67 properties];
        int v69 = [v68 meta];
        float RelativeBrightness = getRelativeBrightness(v66, [v69 exposureParams], 2);

        int v71 = *(_DWORD *)([(NSDictionary *)self->_nrfInfoDict exposureParams] + 36);
        int v72 = *(_DWORD *)([(NSDictionary *)self->_nrfInfoDict exposureParams] + 24);
        if (!self->_dfPlist->toneMapping->enableSTF)
        {
          uint64_t v73 = getLTM_asNSData((unsigned __int16 *)[(NSDictionary *)self->_nrfInfoDict ltmCurves]);
          uint64_t v74 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputMetadata];
          [v74 setObject:v73 forKeyedSubscript:*MEMORY[0x263F2F530]];
        }
        double v75 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
        uint64_t v76 = [v75 properties];
        id v77 = [v76 meta];
        uint64_t v78 = getLUT_asNSData((unsigned __int16 *)([v77 ltmCurves] + 221232));
        uint64_t v79 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputMetadata];
        [v79 setObject:v78 forKeyedSubscript:*MEMORY[0x263F2F4D8]];

        uint64_t v80 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
        uint64_t v81 = [v80 properties];
        v82 = [v81 meta];
        uint64_t v83 = getLUT_asNSData((unsigned __int16 *)([v82 ltmCurves] + 221748));
        uint64_t v84 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputMetadata];
        [v84 setObject:v83 forKeyedSubscript:*MEMORY[0x263F2F4E8]];

        LODWORD(v85) = v71;
        uint64_t v86 = [NSNumber numberWithFloat:v85];
        unsigned int v87 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputMetadata];
        [v87 setObject:v86 forKeyedSubscript:*MEMORY[0x263F2F0F8]];

        *(float *)&double v88 = RelativeBrightness;
        uint64_t v89 = [NSNumber numberWithFloat:v88];
        id v90 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputMetadata];
        [v90 setObject:v89 forKeyedSubscript:*MEMORY[0x263F2F0F0]];

        LODWORD(v91) = v72;
        int v92 = [NSNumber numberWithFloat:v91];
        uint64_t v93 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputMetadata];
        [v93 setObject:v92 forKeyedSubscript:*MEMORY[0x263F2F0D8]];

        double v94 = +[ToneMappingStage getHighlightCompression_asNSArray:[(NSDictionary *)self->_nrfInfoDict ltmCurves]];
        int v95 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputMetadata];
        [v95 setObject:v94 forKeyedSubscript:*MEMORY[0x263F2F080]];

        motionDetectiouint64_t n = self->_motionDetection;
        BOOL v97 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
        int v98 = [v97 properties];
        int v99 = [v98 meta];
        long long v244 = *(_OWORD *)([v99 ltmCurves] + 223056);
        uint64_t v100 = [(NSDictionary *)self->_nrfInfoDict exposureParams];
        uint64_t v101 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputPixelBuffer];
        int v102 = -[MotionDetection extractLinearBufferWithLumaInput:chromaInput:lumaAlignmentFactor:chromaAlignmentFactor:inputIsLinear:removeChromaBias:lumaPedestal:hazeCorrection:exposureParams:ccm:output:](motionDetection, "extractLinearBufferWithLumaInput:chromaInput:lumaAlignmentFactor:chromaAlignmentFactor:inputIsLinear:removeChromaBias:lumaPedestal:hazeCorrection:exposureParams:ccm:output:", v16, v249, 1, 1, 1, 0, 0.0, *(double *)&v244, *MEMORY[0x263EF89A0], *(double *)(MEMORY[0x263EF89A0] + 16), *(double *)(MEMORY[0x263EF89A0] + 32), v100, v101);

        if (v102)
        {
          int v229 = v102;
          unsigned int v254 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          unsigned int v230 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v230, OS_LOG_TYPE_DEFAULT);
          int v44 = v250;
          fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_125:
          int v45 = v229;
          goto LABEL_98;
        }
        id v103 = v255;
      }
      else
      {
        id v103 = 0;
        id v9 = v247;
      }
      unsigned int v104 = [v248 desc];
      [v104 setUsage:7];

      float v105 = [v248 desc];
      [v105 setPixelFormat:10];

      unint64_t v106 = (unint64_t)[v16 width] >> 1;
      uint64_t v107 = [v248 desc];
      [v107 setWidth:v106];

      unint64_t v108 = (unint64_t)[v16 height] >> 1;
      uint64_t v109 = [v248 desc];
      [v109 setHeight:v108];

      [v248 setLabel:0];
      int v110 = [(FigMetalContext *)self->_metal allocator];
      id v255 = (id)[v110 newTextureWithDescriptor:v248];

      if (v255)
      {
        float32x4_t v111 = [(DeepFusionDeferredProcessingPlist *)self->_dfPlist->deferredProcessing noiseTuningForModel:0];
        int v237 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
        __int16 v112 = [v237 properties];
        unsigned int v113 = [v112 meta];
        uint64_t v114 = [v113 exposureParams];
        int v115 = [(RawDFDeferredFrames *)self->_inputFrames longFrame];
        int v116 = self->_inputFrames;
        if (v115) {
          [(RawDFDeferredFrames *)v116 longFrame];
        }
        else {
        uint64_t v117 = [(RawDFDeferredFrames *)v116 referenceEv0Frame];
        }
        __int16 v118 = [v117 properties];
        int v119 = [v118 meta];
        int v45 = -[DeepFusionProcessor computeAMBNRDenoiseBoostMap:syntheticLongOutput:ev0ExposureParams:longExposureParams:dfNoiseTuningPlist:](self, "computeAMBNRDenoiseBoostMap:syntheticLongOutput:ev0ExposureParams:longExposureParams:dfNoiseTuningPlist:", v255, v247, v114, [v119 exposureParams], v111);

        if (!v45)
        {
          id v259 = [v247 noiseDivisorSyntheticEV0];
          FigMetalDecRef();
          [v247 setNoiseDivisorSyntheticEV0:0];
          *(void *)int v256 = [v247 noiseDivisorSyntheticLong];
          FigMetalDecRef();
          [v247 setNoiseDivisorSyntheticLong:0];

          uint64_t v120 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
          uint64_t v121 = [v120 properties];
          uint64_t v122 = [v121 meta];
          id v9 = v247;
          if (*(unsigned char *)([v122 ltmCurves] + 223072))
          {
            uint64_t v123 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
            __int16 v124 = [v123 properties];
            int v125 = [v124 meta];
            int8x16_t v238 = *(int8x16_t *)([v125 ltmCurves] + 223056);
          }
          else
          {
            int8x16_t v238 = 0u;
          }
          BOOL v10 = v241;

          int v44 = v250;
          unint64_t v16 = v243;
          [(CMIPostConfig *)v250 setInputLuma:v243];
          [(CMIPostConfig *)v250 setInputChroma:v249];
          [(CMIPostConfig *)v250 setInputDenoiseLocalGainMap:v255];
          [(CMIPostConfig *)v250 setOutputLuma:v241[2]];
          [(CMIPostConfig *)v250 setOutputChroma:v241[3]];
          [(CMIPostConfig *)v250 setRequestLinearMIWBAppliedOutput:[(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputMIWBAppliedPixelBuffer] != 0];
          int v126 = [(DeepFusionProcessor *)self _setupPostConfig:v250 isForEnhancedRes:0];
          if (v126)
          {
            int v45 = v126;
            goto LABEL_118;
          }
          [(CMIPostConfig *)v250 setEnableMIWB:BYTE1(self->_textureUtils)];
          if ([(CMIPostConfig *)v250 enableMIWB])
          {
            double v127 = self->_colorConvertStage;
            __int16 v128 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
            unsigned int v129 = [v128 metadata];
            [(CMIPostConfig *)v250 setHazeAppliedInMIWB:[(ColorConvertStage *)v127 isHazeCorrectionEnabled:v129]];
          }
          else
          {
            [(CMIPostConfig *)v250 setHazeAppliedInMIWB:0];
          }
          int v130 = [(RawDFCommon *)self->_rawDFCommon runPostWithConfig:v250];
          if (v130)
          {
            int v45 = v130;
            goto LABEL_98;
          }
          if (![(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputMIWBAppliedPixelBuffer])
          {
LABEL_71:
            id v259 = [(CMIPostConfig *)v44 miwbOutputLumaTexture];
            *(void *)int v256 = [(CMIPostConfig *)v44 miwbOutputChromaTexture];
            FigMetalDecRef();
            FigMetalDecRef();

            FigMetalDecRef();
            [(FigMetalContext *)self->_metal waitForSchedule];
            unsigned int v251 = 0;
            updateGreenGhostMitigationMakerNoteFromSidecarDict(1, (int *)&v251, self->_lscGainsPlist);
            unsigned int v178 = [NSNumber numberWithUnsignedInt:v251];
            unsigned int v179 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties metadata];
            [v179 setObject:v178 forKeyedSubscript:*MEMORY[0x263F2F0B8]];

            if ([(IBPSemanticStyleProperties *)self->_semanticStyleProperties gainMapOutputPixelBuffer])
            {
              LODWORD(v180) = self->_rawDFSoftLTMMode;
              uint64_t v181 = [NSNumber numberWithFloat:v180];
              unsigned int v182 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties metadata];
              [v182 setObject:v181 forKeyedSubscript:*MEMORY[0x263F2F068]];
            }
            nrfInputBracketCount = self->_nrfInputBracketCount;
            if (nrfInputBracketCount)
            {
              uint64_t v184 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties metadata];
              [v184 setObject:nrfInputBracketCount forKeyedSubscript:*MEMORY[0x263F2F130]];
            }
            nrfRegisteredBracketCount = self->_nrfRegisteredBracketCount;
            if (nrfRegisteredBracketCount)
            {
              unsigned int v186 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties metadata];
              [v186 setObject:nrfRegisteredBracketCount forKeyedSubscript:*MEMORY[0x263F2F118]];
            }
            sidecar = self->_sidecar;
            if (sidecar)
            {
              unsigned int v188 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties metadata];
              [v188 setObject:sidecar forKeyedSubscript:*MEMORY[0x263F2F120]];
            }
            uint64_t v189 = [(RawDFCommon *)self->_rawDFCommon getSRLStatus];
            unsigned int v190 = [NSNumber numberWithUnsignedInt:v189];
            unsigned int v191 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties metadata];
            [v191 setObject:v190 forKeyedSubscript:*MEMORY[0x263F2F128]];

            uint64_t v192 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties gainMapOutputMetadata];
            if (!v192 || (BOOL calculateLTM = self->_calculateLTM, v192, !calculateLTM))
            {
LABEL_83:
              semanticStyleProperties = self->_semanticStyleProperties;
              if (self->_dfPlist->toneMapping->enableSTF)
              {
                if ([(IBPSemanticStyleProperties *)semanticStyleProperties linearOutputPixelBuffer])
                {
                  int v202 = [(RawDFCommon *)self->_rawDFCommon getSTFLTM_asNSData];
                  unsigned int v203 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputMetadata];
                  [v203 setObject:v202 forKeyedSubscript:*MEMORY[0x263F2F530]];
                }
                v204 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties metadata];
                [v204 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F2F190]];

                BOOL v205 = objc_msgSend(NSNumber, "numberWithBool:", -[RawDFCommon stfStillApplied](self->_rawDFCommon, "stfStillApplied"));
                unsigned int v206 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties metadata];
                [v206 setObject:v205 forKeyedSubscript:*MEMORY[0x263F2F180]];

                if (![(RawDFCommon *)self->_rawDFCommon stfStillApplied]) {
                  goto LABEL_90;
                }
                BOOL v207 = objc_msgSend(NSNumber, "numberWithInt:", -[RawDFCommon getSTFStillCorrectionStrength:](self->_rawDFCommon, "getSTFStillCorrectionStrength:", 1));
                unsigned int v208 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties metadata];
                [v208 setObject:v207 forKeyedSubscript:*MEMORY[0x263F2F188]];

                unsigned int v209 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[RawDFCommon stfStillAnalyticsVersion](self->_rawDFCommon, "stfStillAnalyticsVersion"));
                uint64_t v210 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties metadata];
                [v210 setObject:v209 forKeyedSubscript:*MEMORY[0x263F2F178]];
              }
              else
              {
                unsigned int v209 = [(IBPSemanticStyleProperties *)semanticStyleProperties metadata];
                [v209 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F2F190]];
              }

LABEL_90:
              uint64_t v211 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
              unsigned int v212 = [v211 properties];
              v213 = [v212 meta];
              int v214 = [v213 zoomApplied];

              if (v214)
              {
                id v215 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties metadata];
                id v216 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
                +[RawDFZoomStage setOutputMetadata:v215 withFrame:v216];
              }
              if (self->_dfPlist->outputNoiseModel)
              {
                id v217 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
                id v218 = [v217 properties];
                v219 = [v218 meta];
                unsigned int v220 = +[OutputNoiseModel generateNoiseModelFromReferenceFrameMetadata:v219 nFusedFrames:self->_addFrameCount tuningPlist:self->_dfPlist->outputNoiseModel];

                if (v220)
                {
                  unsigned int v221 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties metadata];
                  [v221 setObject:v220 forKeyedSubscript:*MEMORY[0x263F2F138]];
                }
              }
              int v45 = 0;
              goto LABEL_97;
            }
            v194 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];

            if (v194)
            {
              rawDFPostDemosaicStage = self->_rawDFPostDemosaicStage;
              unsigned int v196 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties gainMapOutputMetadata];
              unsigned int v197 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
              unsigned int v198 = [v197 properties];
              unsigned int v199 = [v198 meta];
              unsigned int v200 = [v199 faces];
              -[RawDFPostDemosaicStage prepareGainMapMetadata:hasFaces:](rawDFPostDemosaicStage, "prepareGainMapMetadata:hasFaces:", v196, [v200 count] != 0);

              unint64_t v16 = v243;
              goto LABEL_83;
            }
            int v45 = -73395;
LABEL_118:
            FigDebugAssert3();
            goto LABEL_98;
          }
          BOOL v131 = [(CMIPostConfig *)v250 enableMIWB];
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          nrfInfoDict = self->_nrfInfoDict;
          int v133 = [(CMIPostConfig *)v250 miwbOutputLumaTexture];
          uint64_t v134 = [v133 width];
          v135 = [(CMIPostConfig *)v250 miwbOutputLumaTexture];
          double v136 = minimumDenormalizedRectToProcess(nrfInfoDict, v134, [v135 height], (BOOL *)&type);
          double v138 = v137;
          double v140 = v139;
          double v142 = v141;

          uint64_t v143 = self->_motionDetection;
          unsigned int v144 = [(CMIPostConfig *)v250 miwbOutputLumaTexture];
          unsigned int v145 = [(CMIPostConfig *)v250 miwbOutputChromaTexture];
          if ([(CMIPostConfig *)v250 tmApplyColorCorrectionMatrix])
          {
            [(NSDictionary *)self->_nrfInfoDict colorCorrectionMatrix];
            *(void *)&long long v245 = v146;
            *(void *)&long long v242 = v147;
            *(void *)&long long v236 = v148;
          }
          else
          {
            long long v245 = *MEMORY[0x263EF89A0];
            long long v242 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
            long long v236 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
          }
          uint64_t v149 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputMIWBAppliedPixelBuffer];
          if (v131) {
            unsigned int v150 = -1;
          }
          else {
            unsigned int v150 = 0;
          }
          int v151 = -[MotionDetection extractAndDownsampleLinearWithLumaInput:chromaInput:denormalizedZoomRect:inputIsLinear:removeChromaBias:hazeCorrection:colorCorrectionMatrix:output:](v143, "extractAndDownsampleLinearWithLumaInput:chromaInput:denormalizedZoomRect:inputIsLinear:removeChromaBias:hazeCorrection:colorCorrectionMatrix:output:", v144, v145, 1, 0, v149, v136, v138, v140, v142, *(double *)vbicq_s8(v238, (int8x16_t)vdupq_n_s32(v150)).i64, *(double *)&v245, *(double *)&v242, *(double *)&v236);

          if (!v151)
          {
            unsigned int v152 = [(NSDictionary *)self->_nrfInfoDict zoomRelatedMetadata];
            unsigned int v153 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputMIWBAppliedMetadata];
            FigCaptureMetadataUtilitiesCopyZoomRelatedMetadata();

            id v154 = [(CMIPostConfig *)v250 miwbOutputLumaTexture];
            [v154 width];
            uint64_t v155 = [(CMIPostConfig *)v250 miwbOutputLumaTexture];
            [v155 height];

            CVPixelBufferGetWidth((CVPixelBufferRef)[(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputMIWBAppliedPixelBuffer]);
            CVPixelBufferGetHeight((CVPixelBufferRef)[(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputMIWBAppliedPixelBuffer]);
            uint64_t v156 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputMIWBAppliedMetadata];
            FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop();

            if (type)
            {
              uint64_t v157 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputMIWBAppliedMetadata];
              FigCaptureMetadataUtilitiesPreventFurtherCropping();
            }
            unsigned int v158 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputMIWBAppliedMetadata];

            if (v158)
            {
              v159 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties linearOutputMIWBAppliedMetadata];
              uint64_t v160 = *(void *)&self->_processingMode;
              if (v160) {
                +[SoftLTM copyLTMMetadata:v160 to:v159];
              }
              int v161 = *(_DWORD *)([(NSDictionary *)self->_nrfInfoDict exposureParams] + 24);
              int v162 = *(_DWORD *)([(NSDictionary *)self->_nrfInfoDict exposureParams] + 36);
              uint64_t v163 = [(NSDictionary *)self->_nrfInfoDict exposureParams];
              unsigned int v164 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
              unsigned int v165 = [v164 properties];
              int v166 = [v165 meta];
              float v167 = getRelativeBrightness(v163, [v166 exposureParams], 2);

              LODWORD(v168) = v161;
              unsigned int v169 = [NSNumber numberWithFloat:v168];
              [v159 setObject:v169 forKeyedSubscript:*MEMORY[0x263F2F0D8]];

              LODWORD(v170) = v162;
              v171 = [NSNumber numberWithFloat:v170];
              [v159 setObject:v171 forKeyedSubscript:*MEMORY[0x263F2F0F8]];

              *(float *)&double v172 = v167;
              int v173 = [NSNumber numberWithFloat:v172];
              [v159 setObject:v173 forKeyedSubscript:*MEMORY[0x263F2F0F0]];

              uint64_t v174 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
              int v175 = [v174 metadata];
              uint64_t v176 = *MEMORY[0x263F2F4F8];
              int v177 = [v175 objectForKeyedSubscript:*MEMORY[0x263F2F4F8]];
              [v159 setObject:v177 forKeyedSubscript:v176];
            }
            int v44 = v250;
            goto LABEL_71;
          }
          int v229 = v151;
          unsigned int v254 = 0;
          os_log_type_t v252 = OS_LOG_TYPE_DEFAULT;
          unsigned int v231 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v232 = v254;
          if (os_log_type_enabled(v231, OS_LOG_TYPE_DEFAULT)) {
            unsigned int v233 = v232;
          }
          else {
            unsigned int v233 = v232 & 0xFFFFFFFE;
          }
          if (v233)
          {
            *(_DWORD *)int v256 = 136315394;
            *(void *)&v256[4] = "-[DeepFusionProcessor finalizeOutput:syntheticLongOutput:output:]";
            __int16 v257 = 1024;
            int v258 = v229;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();

          goto LABEL_124;
        }
        FigDebugAssert3();

        id v9 = v247;
        BOOL v10 = v241;
        unint64_t v16 = v243;
LABEL_97:
        int v44 = v250;
        goto LABEL_98;
      }
LABEL_105:
      unsigned int v254 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      unsigned int v228 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v228, OS_LOG_TYPE_DEFAULT);
      int v44 = v250;
      int v45 = -73395;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      goto LABEL_98;
    }
LABEL_121:
    FigDebugAssert3();
    unsigned int v254 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    unsigned int v235 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v235, OS_LOG_TYPE_DEFAULT);
    id v9 = v247;
    int v45 = -73395;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_97;
  }
  int v32 = self->_colorConvertStage;
  BOOL v33 = [v26 metadata];
  uint64_t v34 = [(ColorConvertStage *)v32 computeLTMFromLuma:v16 chroma:v249 metadata:v33 applyCCM:[(CMIPostConfig *)v18 tmApplyColorCorrectionMatrix]];
  unsigned int v35 = *(void **)&self->_processingMode;
  *(void *)&self->_processingMode = v34;

  uint64_t v36 = *(void *)&self->_processingMode;
  if (!v36) {
    goto LABEL_121;
  }
  uint64_t v37 = self->_colorConvertStage;
  int v38 = [v26 properties];
  uint64_t v39 = [v38 meta];
  __int16 v40 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  __int16 v41 = [v40 properties];
  unsigned int v42 = [v41 meta];
  int v43 = [(ColorConvertStage *)v37 processLTMMetadata:v36 toDarkestFrame:v39 toEV0Frame:v42];

  BOOL v10 = v241;
  unint64_t v16 = v243;

  int v44 = v250;
  if (!v43) {
    goto LABEL_34;
  }
  int v45 = v43;
  FigDebugAssert3();
  id v9 = v247;
LABEL_98:

LABEL_99:
  return v45;
}

- ($0B57B161DD08FFA902CA30037FAFD2DD)getRefGDCParams
{
  int v3 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  BOOL v4 = ($0B57B161DD08FFA902CA30037FAFD2DD *)[v3 gdcParameters];

  if (self->_dsrMode)
  {
    id v5 = [(RawDFDeferredFrames *)self->_inputFrames syntheticReferenceFrame];

    inputFrames = self->_inputFrames;
    if (v5) {
      [(RawDFDeferredFrames *)inputFrames syntheticReferenceFrame];
    }
    else {
    uint64_t v7 = [(RawDFDeferredFrames *)inputFrames sifrFrame];
    }
    BOOL v4 = ($0B57B161DD08FFA902CA30037FAFD2DD *)[v7 gdcParameters];
  }
  return v4;
}

- (int)finalizeFrameStateForProcess
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  int v3 = [(RawDFDeferredFrames *)self->_inputFrames longFrame];
  if (v3)
  {
    BOOL v4 = [(RawDFDeferredFrames *)self->_inputFrames longFrame];
    id v5 = [v4 properties];
    self->_hasLongFrame = [v5 hasValidRegistration];
  }
  else
  {
    self->_hasLongFrame = 0;
  }

  if (dword_26B430EE8)
  {
    id v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v7 = [(RawDFDeferredFrames *)self->_inputFrames syntheticReferenceFrame];

  if (v7)
  {
    id v8 = [(RawDFDeferredFrames *)self->_inputFrames syntheticReferenceFusionMap];

    if (!v8
      || ([(RawDFDeferredFrames *)self->_inputFrames sifrFrame],
          id v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          v9))
    {
LABEL_32:
      uint64_t v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      int v21 = -73396;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      return v21;
    }
  }
  else
  {
    if (!LOBYTE(self->_darkestFrameMetadata))
    {
      unint64_t v16 = [(DeepFusionProcessor *)self _getAttachedSyntheticReferenceMetadata];

      inputFrames = self->_inputFrames;
      if (v16)
      {
        int v18 = [(RawDFDeferredFrames *)inputFrames syntheticReferenceFrame];

        if (v18) {
          goto LABEL_32;
        }
        int v19 = [(DeepFusionProcessor *)self _processSyntheticReferenceMetadataFromReferenceEV0];
        if (v19)
        {
          int v21 = v19;
          FigDebugAssert3();
          return v21;
        }
        if (self->_hasEVM)
        {
          uint64_t v20 = [(RawDFDeferredFrames *)self->_inputFrames sifrFrame];

          if (!v20) {
            goto LABEL_32;
          }
        }
      }
      else
      {
        int v23 = [(RawDFDeferredFrames *)inputFrames sifrFrame];
        if (v23)
        {
          uint64_t v24 = [(RawDFDeferredFrames *)self->_inputFrames sifrFrame];
          int v25 = [v24 properties];
          self->_BOOL hasEVM = [v25 hasValidRegistration];
        }
        else
        {
          self->_BOOL hasEVM = 0;
        }

        self->_runDetectors = self->_hasEVM;
        +[RawDFDetectors resetDetectorsOutput:&self->_detectors.motionDetectionScore];
      }
    }
    BOOL v10 = [(RawDFDeferredFrames *)self->_inputFrames sifrFrame];

    if (v10)
    {
      int v11 = [(RawDFDeferredFrames *)self->_inputFrames sifrFrame];
      uint64_t v12 = [v11 properties];

      if (!v12)
      {
        int64x2_t v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
        int v21 = -73396;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        return v21;
      }
      uint64_t v13 = [v11 properties];
      uint64_t v14 = [v13 meta];
      sifrMetadata = self->_sifrMetadata;
      self->_sifrMetadata = v14;
    }
    else
    {
      int v11 = self->_sifrMetadata;
      self->_sifrMetadata = 0;
    }
  }
  if (!self->_runDetectors) {
    [(DeepFusionProcessor *)self reportFusionReferenceFrame:LODWORD(self->_detectors.motionDetectionScore)];
  }
  return 0;
}

- (int)_correctInputROI:(CGRect *)a3 withOutputSize:
{
  int32x2_t v4 = vmovn_s64(vcvtq_s64_f64((float64x2_t)a3->size));
  if (*(void *)&v4 == __PAIR64__(HIWORD(v3), (unsigned __int16)v3)) {
    return 0;
  }
  HIWORD(v8) = v4.i16[2];
  LOWORD(v8) = v4.i16[0];
  int v5 = scaleROI(&a3->origin.x, v8, v3);
  if (v5)
  {
    FigDebugAssert3();
    uint64_t v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v5;
}

- (id)getTuningModeForCurrentProcessingMode
{
  int delegate = (int)self->_delegate;
  switch(delegate)
  {
    case 3:
      unsigned int v3 = &RawDFTuningModeQsub;
      goto LABEL_7;
    case 2:
      unsigned int v3 = &RawDFTuningModeEnhancedRes;
      goto LABEL_7;
    case 1:
      unsigned int v3 = &RawDFTuningModeBayer;
LABEL_7:
      int32x2_t v4 = *v3;
      goto LABEL_9;
  }
  int v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();

  int32x2_t v4 = 0;
LABEL_9:

  return v4;
}

- (void)clearDraftDemosaicCache
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v3 = self->_framesPendingToBeRegistered;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned int v8 = [(NSMutableArray *)self->_framesPendingToBeRegistered objectForKeyedSubscript:*(void *)(*((void *)&v9 + 1) + 8 * v7)];
        FigMetalDecRef();

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_framesPendingToBeRegistered removeAllObjects];
}

- (int)applySemanticStylesWithOutputBuffer:(__CVBuffer *)a3 inputBuffer:(__CVBuffer *)a4 inputMetadata:(id)a5
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v8 = a5;
  p_Class isa = [(DeepFusionProcessor *)self getTuningModeForCurrentProcessingMode];
  if (!p_isa
    || ([v8 objectForKeyedSubscript:*MEMORY[0x263F2F668]],
        (uint64_t v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    unsigned int v84 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    int v54 = -73402;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_64:

    goto LABEL_32;
  }
  long long v11 = (void *)v10;
  long long v12 = [(NSMutableDictionary *)self->_tuningParams objectForKeyedSubscript:v10];
  uint64_t v13 = [v12 objectForKeyedSubscript:p_isa];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"Default"];

  if (!v14)
  {
    unsigned int v84 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v56 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
    int v54 = -73402;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_32;
  }

  if (!self[1].super.isa || !v14[3].isa || !a3 || !a4 || !v8)
  {
    unsigned int v84 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    id v57 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
LABEL_50:
    int v54 = -73402;
LABEL_51:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    p_Class isa = &v14->isa;
    goto LABEL_32;
  }
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a4, 0);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a4, 0);
  float64x2_t v81 = 0u;
  float64x2_t v82 = 0u;
  int ROIMetadata = getROIMetadata((uint64_t)v8, v81.f64, WidthOfPlane, HeightOfPlane);
  if (ROIMetadata)
  {
    int v54 = ROIMetadata;
    unsigned int v84 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    id v57 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v58 = v84;
    if (os_log_type_enabled(v57, type)) {
      unsigned int v59 = v58;
    }
    else {
      unsigned int v59 = v58 & 0xFFFFFFFE;
    }
    if (v59)
    {
      int v85 = 136315394;
      uint64_t v86 = "-[DeepFusionProcessor applySemanticStylesWithOutputBuffer:inputBuffer:inputMetadata:]";
      __int16 v87 = 1024;
      *(_DWORD *)double v88 = v54;
      _os_log_send_and_compose_impl();
    }
    goto LABEL_51;
  }
  int v18 = [v8 objectForKeyedSubscript:*MEMORY[0x263F2F558]];
  [v18 floatValue];
  int v20 = v19;

  int v21 = [[LumaChromaImage alloc] initWithContext:self->_metal pixelBuffer:a4 lumaAlignmentFactor:1 chromaAlignmentFactor:1];
  if (!v21)
  {
    unsigned int v84 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    id v57 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v60 = v84;
    if (os_log_type_enabled(v57, type)) {
      unsigned int v61 = v60;
    }
    else {
      unsigned int v61 = v60 & 0xFFFFFFFE;
    }
    if (v61)
    {
      int v85 = 136315138;
      uint64_t v86 = "-[DeepFusionProcessor applySemanticStylesWithOutputBuffer:inputBuffer:inputMetadata:]";
      _os_log_send_and_compose_impl();
    }
    goto LABEL_50;
  }
  p_Class isa = &v21->super.isa;
  int v22 = [[LumaChromaImage alloc] initWithContext:self->_metal pixelBuffer:a3 lumaAlignmentFactor:1 chromaAlignmentFactor:1];
  if (!v22)
  {
    unsigned int v84 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v62 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v63 = v84;
    if (os_log_type_enabled(v62, type)) {
      unsigned int v64 = v63;
    }
    else {
      unsigned int v64 = v63 & 0xFFFFFFFE;
    }
    if (v64)
    {
      int v85 = 136315138;
      uint64_t v86 = "-[DeepFusionProcessor applySemanticStylesWithOutputBuffer:inputBuffer:inputMetadata:]";
      _os_log_send_and_compose_impl();
    }
    int v54 = -73402;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_64;
  }
  int v23 = v22;
  if (!self->_inferenceResultsBindings.instanceMasks
    || !self->_inferenceResultsBindings.skyMask
    || !self->_inferenceResultsBindings.personMask)
  {
    unsigned int v84 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    BOOL v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v34 = v84;
    if (!os_log_type_enabled(v33, type)) {
      v34 &= ~1u;
    }
    if (v34)
    {
      uint64_t v79 = v14;
      BOOL v77 = [(MTLTexture *)self->_inferenceResultsBindings.skinMask personMask] != 0;
      unsigned int v35 = v23;
      id v36 = v8;
      BOOL v37 = [(MTLTexture *)self->_inferenceResultsBindings.skinMask skinMask] != 0;
      int v38 = p_isa;
      BOOL v39 = [(MTLTexture *)self->_inferenceResultsBindings.skinMask skyMask] != 0;
      __int16 v40 = [(MTLTexture *)self->_inferenceResultsBindings.skinMask smartCameraSceneType];
      int v85 = 136316163;
      uint64_t v86 = "-[DeepFusionProcessor applySemanticStylesWithOutputBuffer:inputBuffer:inputMetadata:]";
      __int16 v87 = 1026;
      *(_DWORD *)double v88 = v77;
      *(_WORD *)&v88[4] = 1026;
      *(_DWORD *)&v88[6] = v37;
      id v8 = v36;
      int v23 = v35;
      uint64_t v14 = v79;
      LOWORD(v89) = 1026;
      *(_DWORD *)((char *)&v89 + 2) = v39;
      p_Class isa = v38;
      HIWORD(v89) = 2113;
      *(void *)id v90 = v40;
      LODWORD(v75) = 40;
      uint64_t v74 = &v85;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    double v41 = 0.0;
    __asm { FMOV            V0.2S, #1.0 }
    double v80 = _D0;
    goto LABEL_30;
  }
  if (!v81.f64[0])
  {
    double v78 = v81.f64[1];
    int32x2_t v24 = vmovn_s64((int64x2_t)vcvtq_u64_f64(vaddq_f64(v81, v82)));
    float64x2_t v25 = *(float64x2_t *)(MEMORY[0x263F001A0] + 16);
    float64x2_t v97 = *(float64x2_t *)MEMORY[0x263F001A0];
    float64x2_t v98 = v25;
    if (FigCFDictionaryGetCGRectIfPresent())
    {
      __asm { FMOV            V2.2D, #2.0 }
      *(float32x2_t *)v31.f32 = vcvt_f32_u32((uint32x2_t)vmovn_s64((int64x2_t)vcvtq_u64_f64(vmlaq_f64(v98, _Q2, v97))));
      v31.i64[1] = v31.i64[0];
      float32x4_t v32 = vdivq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v97), v98), v31);
    }
    else
    {
      float32x4_t v32 = (float32x4_t)xmmword_2634805A0;
    }
    int32x2_t v43 = vceq_s32((int32x2_t)__PAIR64__(HeightOfPlane, WidthOfPlane), v24);
    if ((v43.i8[0] & 1) != 0
      && !v78
      && (v43.i8[4] & 1) != 0
      && (vminvq_u32((uint32x4_t)vceqq_f32(v32, (float32x4_t)xmmword_2634805A0)) & 0x80000000) != 0)
    {
      double v41 = 0.0;
      __asm { FMOV            V4.2S, #1.0 }
    }
    else
    {
      v44.i64[0] = WidthOfPlane;
      v44.i64[1] = HeightOfPlane;
      int32x2_t v45 = vsub_s32((int32x2_t)__PAIR64__(HeightOfPlane, WidthOfPlane), v24);
      _D4 = (float32x2_t)vextq_s8((int8x16_t)v32, (int8x16_t)v32, 8uLL).u64[0];
      v47.i64[0] = v45.u32[0];
      v47.i64[1] = v45.u32[1];
      __asm { FMOV            V3.2D, #0.5 }
      double v41 = COERCE_DOUBLE(vneg_f32(vcvt_f32_f64(vaddq_f64(vdivq_f64(vmulq_f64(vcvtq_f64_u64(v47), _Q3), vcvtq_f64_u64(v44)), vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v32.f32, _D4))))));
    }
    double v80 = *(double *)&_D4;
LABEL_30:
    uint64_t v49 = *(void **)&self->_enableSTF;
    Class isa = self[1].super.isa;
    Class v51 = v14[3].isa;
    uint64_t v52 = [(MTLTexture *)self->_inferenceResultsBindings.skinMask smartCameraSceneType];
    LOBYTE(v76) = 0;
    LODWORD(v53) = v20;
    int v54 = [v49 runWithStyle:isa tuningParams:v51 refFrameLuxLevel:v52 sceneType:p_isa[2] lumaTex:p_isa[3] chromaTex:v23->lumaTex outLumaTex:v53 outChromaTex:v80 gainMapTex:v41 outputGainMapTex:v23->chromaTex maskScale:0 maskTranslation:0 personMaskTex:self->_inferenceResultsBindings.instanceMasks skinMaskTex:self->_inferenceResultsBindings.skyMask skyMaskTex:self->_inferenceResultsBindings.personMask isLowLight:v76];

    if (v54)
    {
      int v65 = p_isa;
      uint64_t v66 = v14;
      unsigned int v84 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      int v67 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v68 = v84;
      if (os_log_type_enabled(v67, type)) {
        unsigned int v69 = v68;
      }
      else {
        unsigned int v69 = v68 & 0xFFFFFFFE;
      }
      if (v69)
      {
        int v85 = 136315138;
        uint64_t v86 = "-[DeepFusionProcessor applySemanticStylesWithOutputBuffer:inputBuffer:inputMetadata:]";
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      p_Class isa = v65;
    }
    else
    {
      [(FigMetalContext *)self->_metal waitForSchedule];
    }
    goto LABEL_32;
  }
  id v70 = v22;
  unsigned int v84 = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  int v71 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  unsigned int v72 = v84;
  if (os_log_type_enabled(v71, type)) {
    unsigned int v73 = v72;
  }
  else {
    unsigned int v73 = v72 & 0xFFFFFFFE;
  }
  if (v73)
  {
    int v85 = 136316674;
    uint64_t v86 = "-[DeepFusionProcessor applySemanticStylesWithOutputBuffer:inputBuffer:inputMetadata:]";
    __int16 v87 = 2048;
    *(float64_t *)double v88 = v81.f64[0];
    *(_WORD *)&v88[8] = 2048;
    float64_t v89 = v81.f64[1];
    *(_WORD *)id v90 = 2048;
    *(float64_t *)&v90[2] = v82.f64[0];
    __int16 v91 = 2048;
    float64_t v92 = v82.f64[1];
    __int16 v93 = 2048;
    size_t v94 = WidthOfPlane;
    __int16 v95 = 2048;
    size_t v96 = HeightOfPlane;
    _os_log_send_and_compose_impl();
  }
  int v54 = -73402;
  fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_32:
  return v54;
}

- (int)_initiateQuadraEVZeroBackgroundProcessing
{
  dfPlist = self->_dfPlist;
  if (!dfPlist) {
    goto LABEL_13;
  }
  if (!dfPlist->quadraLearnedNRTuning) {
    goto LABEL_13;
  }
  if (LODWORD(self->_delegate) != 2) {
    goto LABEL_13;
  }
  if (![(IBPSemanticStyleProperties *)self->_semanticStyleProperties quadraForEnhancedResOutputPixelBuffer])goto LABEL_13; {
  uint64_t v4 = [(RawDFDeferredFrames *)self->_inputFrames quadraFrame];
  }

  if (!v4) {
    goto LABEL_13;
  }
  uint64_t v5 = [(RawDFDeferredFrames *)self->_inputFrames quadraFrame];
  uint64_t v6 = [v5 baseTex];

  if (!v6
    || ([(RawDFDeferredFrames *)self->_inputFrames quadraFrame],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v7 rgbTex],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
LABEL_13:
    int v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    int v10 = -73413;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return v10;
  }
  long long v9 = [(RawDFDeferredFrames *)self->_inputFrames quadraFrame];
  int v10 = [v9 allocateRGB];

  if (v10)
  {
    FigDebugAssert3();
    return v10;
  }
  int32x2_t v24 = *(void **)&self->_dfFrameMetadata.hasEVM;
  uint64_t v27 = [(RawDFDeferredFrames *)self->_inputFrames quadraFrame];
  long long v11 = [v27 baseTex];
  int64x2_t v26 = [(RawDFDeferredFrames *)self->_inputFrames quadraFrame];
  long long v12 = [v26 rgbTex];
  float64x2_t v25 = [(RawDFDeferredFrames *)self->_inputFrames quadraFrame];
  uint64_t v13 = [v25 metadata];
  uint64_t v14 = [(RawDFDeferredFrames *)self->_inputFrames quadraFrame];
  uint64_t v15 = [v14 bayerPattern];
  unint64_t v16 = [(RawDFDeferredFrames *)self->_inputFrames quadraFrame];
  uint64_t v17 = [v16 lscGainMapBuffer];
  int v18 = [(RawDFDeferredFrames *)self->_inputFrames quadraFrame];
  int v19 = [v18 lscGainMapParameters];
  LODWORD(v17) = [v24 setupLearnedNRTaskWithInpuFrameBaseTex:v11 outRgbTex:v12 metadata:v13 bayerPattern:v15 lscGainMapBuffer:v17 lscGainMapParameters:v19 tuning:self->_dfPlist->quadraLearnedNRTuning];

  int v10 = v17;
  if (v17) {
    return v10;
  }
  backgroundLearnedNR = self->_backgroundLearnedNR;
  uint64_t v21 = *(void *)&self->_dfFrameMetadata.hasEVM;

  return [(NRFBackgroundLearnedNR *)backgroundLearnedNR startBackgroundTask:v21];
}

- (int)_finalizeQuadraSfdStep1:(id)a3
{
  uint64_t v132 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  id v129 = 0;
  long long v6 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
  long long v127 = *MEMORY[0x263F001A0];
  *(_OWORD *)__int16 v128 = v6;
  sfdOutputImage = self->_sfdOutputImage;
  if (!sfdOutputImage
    || !v4
    || LODWORD(self->_delegate) != 2
    || !self->_nrfInfoDict
    || (unsigned int v8 = [(MTLTexture *)sfdOutputImage->lumaTex width],
        unsigned int v9 = [(MTLTexture *)self->_sfdOutputImage->lumaTex height],
        (uint64_t v122 = v8) == 0)
    || (__int16 v10 = v9, (v121 = v9) == 0)
    || ([(RawDFDeferredFrames *)self->_inputFrames quadraFrame],
        (uint64_t v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    float v105 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT);
    int v73 = -73416;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v14 = 0;
    long long v12 = 0;
    goto LABEL_49;
  }
  long long v12 = (void *)v11;
  uint64_t v13 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v14 = (void *)[v13 newTextureDescriptor];

  if (!v14)
  {
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    unint64_t v106 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT);
    int v73 = -73416;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v14 = 0;
    goto LABEL_49;
  }
  __int16 v117 = v10;
  uint64_t v15 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  int v16 = [(NRFBackgroundLearnedNR *)self->_backgroundLearnedNR waitForBackgroundTaskToComplete:*(void *)&self->_dfFrameMetadata.hasEVM];
  if (v16)
  {
    int v73 = v16;
    goto LABEL_49;
  }
  if (*v15 == 1)
  {
    kdebug_trace();
    if (*v15 == 1) {
      kdebug_trace();
    }
  }
  uint64_t v17 = [v12 baseTex];

  if (!v17 || ([v12 rgbTex], int v18 = objc_claimAutoreleasedReturnValue(), v18, !v18))
  {
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v107 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT);
    int v73 = -73416;
LABEL_66:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_49;
  }
  __int16 v115 = v8;
  [v12 releaseBaseTex];
  int v19 = [v14 desc];
  [v19 setWidth:v8];

  int v20 = [v14 desc];
  [v20 setHeight:v121];

  uint64_t v21 = [v14 desc];
  [v21 setUsage:7];

  int v22 = [v14 desc];
  [v22 setPixelFormat:115];

  [v14 setLabel:0];
  int v23 = [(FigMetalContext *)self->_metal allocator];
  id v129 = (id)[v23 newTextureWithDescriptor:v14];

  id v123 = v129;
  if (!v129)
  {
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    unint64_t v108 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT);
    int v73 = -73416;
LABEL_63:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_49;
  }
  int v116 = v14;
  int32x2_t v24 = [v12 metadata];
  int CGRectIfPresent = FigCFDictionaryGetCGRectIfPresent();

  int v119 = v5;
  uint64_t v120 = v12;
  if (CGRectIfPresent)
  {
    uint64_t v26 = [v129 width];
    uint64_t v27 = [v129 height];
    unint64_t v28 = [v129 width];
    unint64_t v29 = [v129 height];
    unint64_t v30 = [v129 width];
    unint64_t v31 = [v129 height];
    float32x4_t v32 = [(FigMetalContext *)self->_metal commandQueue];
    BOOL v33 = [v32 commandBuffer];

    if (v33)
    {
      uint64_t v34 = [v33 blitCommandEncoder];
      if (v34)
      {
        unsigned int v35 = (void *)v34;
        unint64_t v36 = (unint64_t)*(double *)&v127 + (((unint64_t)v128[0] - v26) >> 1);
        v37.f32[0] = (float)v30;
        v37.f32[1] = (float)v31;
        v38.f32[0] = (float)v28;
        v38.f32[1] = (float)v29;
        _D8 = COERCE_DOUBLE(vdiv_f32(v37, v38));
        long long v12 = v120;
        __int16 v40 = [v120 rgbTex];
        memset(v125, 0, sizeof(v125));
        v130[0].columns[0].i64[0] = v36;
        v130[0].columns[0].i64[1] = (unint64_t)*((double *)&v127 + 1) + (((unint64_t)v128[1] - v27) >> 1);
        v130[0].columns[1].i64[0] = 0;
        v131.columns[0].i64[0] = v28;
        v131.columns[0].i64[1] = v29;
        v131.columns[1].i64[0] = 1;
        [v35 copyFromTexture:v40 sourceSlice:0 sourceLevel:0 sourceOrigin:v130 sourceSize:&v131 toTexture:v129 destinationSlice:0 destinationLevel:0 destinationOrigin:v125];

        [v35 endEncoding];
        [v33 commit];
        int WidthOfPlane = CVPixelBufferGetWidthOfPlane((CVPixelBufferRef)[(IBPSemanticStyleProperties *)self->_semanticStyleProperties quadraForEnhancedResOutputPixelBuffer], 0);
        LODWORD(v40) = CVPixelBufferGetHeightOfPlane((CVPixelBufferRef)[(IBPSemanticStyleProperties *)self->_semanticStyleProperties quadraForEnhancedResOutputPixelBuffer], 0);
        float v113 = (float)(unint64_t)[v120 width] / (float)WidthOfPlane;
        float v109 = (float)(unint64_t)[v120 height] / (float)(int)v40;
        unsigned int v42 = [v120 properties];
        int32x2_t v43 = (float32x4_t *)[v42 regHomography];
        uint64_t v44 = 0;
        float32x4_t v45 = *v43;
        float32x4_t v46 = v43[1];
        float32x4_t v47 = v43[2];
        LODWORD(v48) = 0;
        *((float *)&v48 + 1) = v109;
        v131.columns[0] = (simd_float3)LODWORD(v113);
        v131.columns[1] = (simd_float3)v48;
        v131.columns[2] = (simd_float3)xmmword_26337FF50;
        memset(v130, 0, 48);
        do
        {
          v130[0].columns[v44] = (simd_float3)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v45, COERCE_FLOAT(*(_OWORD *)&v131.columns[v44])), v46, *(float32x2_t *)v131.columns[v44].f32, 1), v47, (float32x4_t)v131.columns[v44], 2);
          ++v44;
        }
        while (v44 != 3);
        uint64_t v49 = 0;
        v50.i32[0] = 0;
        v50.i64[1] = 0;
        simd_float3x3 v131 = v130[0];
        memset(v130, 0, 48);
        uint64_t v5 = v119;
        do
        {
          v50.f32[1] = 1.0 / v109;
          v130[0].columns[v49] = (simd_float3)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)COERCE_UNSIGNED_INT(1.0 / v113), COERCE_FLOAT(*(_OWORD *)&v131.columns[v49])), v50, *(float32x2_t *)v131.columns[v49].f32, 1), (float32x4_t)xmmword_26337FF50, (float32x4_t)v131.columns[v49], 2);
          ++v49;
        }
        while (v49 != 3);
        simd_float3x3 v110 = v130[0];

        Class v51 = [v120 properties];
        uint64_t v52 = [v51 regHomography];
        *(_DWORD *)(v52 + 8) = v110.columns[0].i32[2];
        *(void *)uint64_t v52 = v110.columns[0].i64[0];
        *(_DWORD *)(v52 + 12) = 0;
        *(void *)(v52 + 16) = v110.columns[1].i64[0];
        *(_DWORD *)(v52 + 24) = v110.columns[1].i32[2];
        *(_DWORD *)(v52 + 28) = 0;
        *(void *)(v52 + 32) = v110.columns[2].i64[0];
        *(_DWORD *)(v52 + 40) = v110.columns[2].i32[2];
        *(_DWORD *)(v52 + 44) = 0;

        goto LABEL_28;
      }
      FigDebugAssert3();
      int v73 = FigSignalErrorAt();
    }
    else
    {
      FigDebugAssert3();
      int v73 = FigSignalErrorAt();
    }
    uint64_t v5 = v119;
    long long v12 = v120;
    goto LABEL_65;
  }
  double v53 = [(FigMetalContext *)self->_metal commandQueue];
  BOOL v33 = [v53 commandBuffer];

  if (!v33)
  {
    FigDebugAssert3();
    int v73 = FigSignalErrorAt();
    goto LABEL_65;
  }
  imageLanczosScaler = self->_imageLanczosScaler;
  uint64_t v55 = [v12 rgbTex];
  [(RawDFLanczos *)imageLanczosScaler encodeToCommandBuffer:v33 input:v55 output:v129];

  [v33 commit];
  __asm { FMOV            V8.2S, #1.0 }
LABEL_28:
  unsigned int v60 = (_DWORD *)MEMORY[0x263F00E10];

  [v5 setLtmGridScaling:_D8];
  uint64_t v61 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties quadraForEnhancedResOutputMetadata];
  if (v61)
  {
    uint64_t v62 = (void *)v61;
    unsigned int v63 = [v12 properties];
    int v64 = [v63 hasValidRegistration];

    if (v64)
    {
      int v65 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties quadraForEnhancedResOutputMetadata];
      uint64_t v66 = [v12 properties];
      int v67 = (float32x4_t *)[v66 regHomography];
      float32x4_t v112 = v67[1];
      float32x4_t v114 = *v67;
      float32x4_t v111 = v67[2];
      simd_float3x3 v133 = __invert_f3(*(simd_float3x3 *)self->_anon_120);
      uint64_t v68 = 0;
      v133.columns[0].i32[3] = 0;
      v133.columns[1].i32[3] = 0;
      v133.columns[2].i32[3] = 0;
      simd_float3x3 v131 = v133;
      memset(v130, 0, 48);
      do
      {
        v130[0].columns[v68] = (simd_float3)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v114, COERCE_FLOAT(*(_OWORD *)&v131.columns[v68])), v112, *(float32x2_t *)v131.columns[v68].f32, 1), v111, (float32x4_t)v131.columns[v68], 2);
        ++v68;
      }
      while (v68 != 3);

      unsigned int v69 = packHomographyToNSArray();
      [v65 setObject:v69 forKeyedSubscript:*MEMORY[0x263F2F210]];
    }
  }
  [v12 releaseRgbTex];
  id v70 = [(RawDFDeferredFrames *)self->_inputFrames quadraFrame];
  int v71 = [v70 properties];
  unsigned int v72 = [v71 meta];
  HIWORD(v124) = v117;
  LOWORD(v124) = v115;
  int v73 = -[DeepFusionProcessor _correctInputROI:withOutputSize:](self, "_correctInputROI:withOutputSize:", [v72 ROI], v124);

  if (v73)
  {
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v107 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v107, type);
    uint64_t v14 = v116;
    goto LABEL_66;
  }
  if (*v60 == 1) {
    kdebug_trace();
  }
  if ([(IBPSemanticStyleProperties *)self->_semanticStyleProperties quadraForEnhancedResInferenceInputPixelBuffer])
  {
    if (*v60 == 1) {
      kdebug_trace();
    }
    uint64_t v74 = objc_opt_new();
    unsigned int v75 = CVPixelBufferGetWidthOfPlane((CVPixelBufferRef)[(IBPSemanticStyleProperties *)self->_semanticStyleProperties quadraForEnhancedResInferenceInputPixelBuffer], 0);
    double v118 = COERCE_DOUBLE(__PAIR64__(CVPixelBufferGetHeightOfPlane((CVPixelBufferRef)[(IBPSemanticStyleProperties *)self->_semanticStyleProperties quadraForEnhancedResInferenceInputPixelBuffer], 0), v75));
    demosaicStage = self->_demosaicStage;
    BOOL v77 = [(RawDFDeferredFrames *)self->_inputFrames quadraFrame];
    double v78 = [v77 metadata];
    int v73 = [(CMIDemosaicStage *)demosaicStage createSourceTexturesForInference:v74 band0InferenceSourceTexture:v123 outputInferenceSize:0 gainMap:0 band0GainMapSourceTexture:v78 outputGainMapSize:self->_draftDemosaicStage sourceMetadata:v118 demosaicStage:0.0 downSampleStage:self->_rawDFColorMatchStage];

    if (!v73)
    {
      uint64_t v79 = [(IBPSemanticStyleProperties *)self->_semanticStyleProperties quadraForEnhancedResInferenceInputPixelBuffer];
      double v80 = [(RawDFDeferredFrames *)self->_inputFrames quadraFrame];
      float64x2_t v81 = [v80 properties];
      float64x2_t v82 = [(RawDFDeferredFrames *)self->_inputFrames quadraFrame];
      uint64_t v83 = [v82 properties];
      unsigned int v84 = [(RawDFDeferredFrames *)self->_inputFrames quadraFrame];
      int v85 = [v84 properties];
      int v73 = [(DeepFusionProcessor *)self _processInferenceImage:v79 inferenceFrameType:11 sourceFrameLumaChromaImage:v74 sourceFrameProperties:v81 ltcFrameProperties:v83 gtcFrameProperties:v85 originalWidth:v122 originalHeight:v121];

      if (!v73)
      {
        uint64_t v5 = v119;
        long long v12 = v120;
        if (*MEMORY[0x263F00E10] == 1) {
          kdebug_trace();
        }
        if (v74)
        {
          FigMetalDecRef();
          FigMetalDecRef();
        }
        goto LABEL_45;
      }
      uint64_t v5 = v119;
    }
    long long v12 = v120;

LABEL_65:
    uint64_t v14 = v116;
    goto LABEL_49;
  }
LABEL_45:
  uint64_t v14 = v116;
  uint64_t v86 = [v116 desc];
  [v86 setWidth:v122];

  __int16 v87 = [v116 desc];
  [v87 setHeight:v121];

  double v88 = [v116 desc];
  [v88 setUsage:7];

  float64_t v89 = [v116 desc];
  [v89 setPixelFormat:25];

  [v116 setLabel:0];
  id v90 = [(FigMetalContext *)self->_metal allocator];
  __int16 v91 = (void *)[v90 newTextureWithDescriptor:v116];
  [v5 setOutputY:v91];

  float64_t v92 = [v5 outputY];

  if (!v92) {
    goto LABEL_57;
  }
  __int16 v93 = [v116 desc];
  objc_msgSend(v93, "setWidth:", (unint64_t)objc_msgSend(v93, "width") >> 1);

  size_t v94 = [v116 desc];
  objc_msgSend(v94, "setHeight:", (unint64_t)objc_msgSend(v94, "height") >> 1);

  __int16 v95 = [v116 desc];
  [v95 setPixelFormat:65];

  [v116 setLabel:0];
  size_t v96 = [(FigMetalContext *)self->_metal allocator];
  float64x2_t v97 = (void *)[v96 newTextureWithDescriptor:v116];
  [v5 setOutputUV:v97];

  float64x2_t v98 = [v5 outputUV];

  if (!v98)
  {
LABEL_57:
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    unint64_t v108 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v108, type);
    int v73 = -73416;
    goto LABEL_63;
  }
  draftDemosaicStage = self->_draftDemosaicStage;
  uint64_t v100 = [(RawDFDeferredFrames *)self->_inputFrames quadraFrame];
  uint64_t v101 = [v100 metadata];
  int v102 = [v5 outputY];
  id v103 = [v5 outputUV];
  int v73 = [(CMIDraftDemosaicStage *)draftDemosaicStage convertRGBToYUV:v123 inputMetadata:v101 outputTexY:v102 outputTexUV:v103];

  if (v73) {
    FigDebugAssert3();
  }
LABEL_49:
  FigMetalDecRef();

  return v73;
}

- (int)_finalizeQuadraSfdStep2WithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 outputY];

  if (!v5) {
    goto LABEL_19;
  }
  long long v6 = [v4 outputUV];

  if (!v6
    || ![(IBPSemanticStyleProperties *)self->_semanticStyleProperties quadraForEnhancedResOutputPixelBuffer]|| LODWORD(self->_delegate) != 2)
  {
    goto LABEL_19;
  }
  uint64_t v7 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tuningParameters);
  unsigned int v9 = [WeakRetained processorGetInferenceResults:self inferenceInputBufferType:11];
  skinMasuint64_t k = self->_sfdInferenceResultsBindings.skinMask;
  self->_sfdInferenceResultsBindings.skinMasuint64_t k = v9;

  uint64_t v11 = self->_sfdInferenceResultsBindings.skinMask;
  if (!v11)
  {
LABEL_19:
    p_super = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
    int v19 = -73415;
LABEL_20:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_26:

    goto LABEL_18;
  }
  int v12 = [(DeepFusionProcessor *)self bindInferenceResults:v11 toBindings:&self->_sfdInferenceResultsBindings.skyMask];
  if (v12)
  {
    int v19 = v12;
    p_super = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
    goto LABEL_20;
  }
  if (*v7 == 1)
  {
    kdebug_trace();
    if (*v7 == 1) {
      kdebug_trace();
    }
  }
  uint64_t v13 = [[CMIPostConfig alloc] initWithMetalContext:self->_metal];
  p_super = &v13->super;
  if (!v13)
  {
    uint64_t v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    int v19 = -73415;
LABEL_25:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_26;
  }
  [(CMIPostConfig *)v13 setEnableSTF:LOBYTE(self->_textureUtils)];
  [p_super setEnableMIWB:BYTE1(self->_textureUtils)];
  uint64_t v15 = [v4 outputY];
  [p_super setInputLuma:v15];

  int v16 = [v4 outputUV];
  [p_super setInputChroma:v16];

  [p_super setOutputLuma:self->_sfdOutputImage->lumaTex];
  [p_super setOutputChroma:self->_sfdOutputImage->chromaTex];
  [v4 ltmGridScaling];
  -[NSObject setLtmGridScaling:](p_super, "setLtmGridScaling:");
  int v17 = [(DeepFusionProcessor *)self _setupPostConfig:p_super isForEnhancedRes:1];
  if (v17)
  {
    int v19 = v17;
    FigDebugAssert3();
    goto LABEL_26;
  }
  int v18 = [(RawDFCommon *)self->_rawDFCommon runPostWithConfig:p_super];
  if (v18)
  {
    int v19 = v18;
    uint64_t v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    goto LABEL_25;
  }

  if (*v7 == 1) {
    kdebug_trace();
  }
  int v19 = 0;
LABEL_18:

  return v19;
}

- (int)process
{
  LOBYTE(self->_ltmMetadata) = 0;
  if (!self->_dfPlist) {
    goto LABEL_75;
  }
  uint64_t v4 = v2;
  uint64_t v5 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];

  if (!v5) {
    goto LABEL_75;
  }
  long long v6 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  uint64_t v7 = [v6 properties];

  if (!v7
    || ([(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame],
        unsigned int v8 = objc_claimAutoreleasedReturnValue(),
        [v8 metadata],
        unsigned int v9 = objc_claimAutoreleasedReturnValue(),
        [(DeepFusionProcessor *)self StartKTraceEventForProcess:v9],
        v9,
        v8,
        !self->_semanticStyleProperties))
  {
LABEL_75:
    int v119 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT);
    int v37 = -73390;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_96:
    uint64_t v132 = 0;
    unint64_t v108 = 0;
    __int16 v93 = 0;
    __int16 v91 = 0;
    goto LABEL_97;
  }
  int delegate = (int)self->_delegate;
  uint64_t v11 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  int v12 = [v11 properties];
  uint64_t v13 = [v12 meta];
  int v14 = *(_DWORD *)([v13 exposureParams] + 120);

  if (delegate == 2)
  {
    if (LODWORD(self->_delegate) != 2
      || ([(RawDFDeferredFrames *)self->_inputFrames quadraFrame],
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          !v15))
    {
      uint64_t v120 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT);
      int v37 = -73390;
LABEL_95:
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      goto LABEL_96;
    }
  }
  if (v14 == 1 && LODWORD(self->_delegate) != 3) {
    goto LABEL_102;
  }
  int v16 = [(DeepFusionProcessor *)self finalizeFrameStateForProcess];
  if (v16)
  {
    int v37 = v16;
    uint64_t v130 = v2;
    LODWORD(v129) = v16;
LABEL_106:
    FigDebugAssert3();
    goto LABEL_96;
  }
  colorConvertStage = self->_colorConvertStage;
  int v18 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  int v19 = [v18 metadata];
  int v20 = [(ColorConvertStage *)colorConvertStage isHazeCorrectionEnabled:v19];

  deviceGeneratiouint64_t n = self->_deviceGeneration;
  if (deviceGeneration == 1 || !deviceGeneration && v20)
  {
    int v22 = [(RawDFDeferredFrames *)self->_inputFrames syntheticReferenceFrame];
    int v23 = [v22 metadata];
    uint64_t v24 = [v23 objectForKeyedSubscript:@"ltmMetadata"];
    float64x2_t v25 = *(void **)&self->_processingMode;
    *(void *)&self->_processingMode = v24;

    uint64_t v26 = *(void *)&self->_processingMode;
    if (v26) {
      goto LABEL_16;
    }
    uint64_t v27 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
    unint64_t v28 = [v27 metadata];
    unint64_t v29 = [v28 objectForKeyedSubscript:@"SyntheticReference"];
    uint64_t v30 = [v29 objectForKeyedSubscript:@"ltmMetadata"];
    unint64_t v31 = *(void **)&self->_processingMode;
    *(void *)&self->_processingMode = v30;

    uint64_t v26 = *(void *)&self->_processingMode;
    if (v26)
    {
LABEL_16:
      float32x4_t v32 = self->_colorConvertStage;
      if (self->_hasEVM) {
        sifrMetadata = self->_sifrMetadata;
      }
      else {
        sifrMetadata = 0;
      }
      uint64_t v34 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
      unsigned int v35 = [v34 properties];
      unint64_t v36 = [v35 meta];
      int v37 = [(ColorConvertStage *)v32 processLTMMetadata:v26 toDarkestFrame:sifrMetadata toEV0Frame:v36];

      if (v37)
      {
        uint64_t v130 = v2;
        LODWORD(v129) = v37;
        goto LABEL_106;
      }
    }
    else if (v20)
    {
      LOBYTE(self->_ltmMetadata) = 1;
    }
  }
  if (self->_hasEVM)
  {
    float32x2_t v38 = self->_sifrMetadata;
    nrfInfoDict = self->_nrfInfoDict;
    self->_nrfInfoDict = (NSDictionary *)v38;
  }
  else
  {
    nrfInfoDict = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
    __int16 v40 = [nrfInfoDict properties];
    double v41 = [v40 meta];
    unsigned int v42 = self->_nrfInfoDict;
    self->_nrfInfoDict = v41;
  }
  int32x2_t v43 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  uint64_t v44 = [v43 properties];
  float32x4_t v45 = [v44 meta];
  float v46 = 1.0;
  if ([v45 hasZoomRects])
  {
    simd_float3x3 v131 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
    float32x4_t v47 = [v131 properties];
    unint64_t v48 = [v47 meta];
    [v48 zoomDstRect];
    double v50 = v49;
    Class v51 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
    uint64_t v52 = [v51 properties];
    double v53 = [v52 meta];
    [v53 zoomSrcRect];
    float v46 = v50 / v54;

    uint64_t v4 = v2;
  }

  LOBYTE(self->_dfFrameMetadata.motionDetectionScore) = self->_hasEVM;
  BYTE1(self->_dfFrameMetadata.motionDetectionScore) = !self->_dsrMode;
  *(&self->_dfFrameMetadata.motionDetectionScore + 1) = v46;
  uint64_t v55 = (long long *)[(NSDictionary *)self->_nrfInfoDict exposureParams];
  long long v56 = v55[3];
  long long v58 = *v55;
  long long v57 = v55[1];
  *(_OWORD *)&self->_dfFrameMetadata.refExposure.ADRC_exp_gaiuint64_t n = v55[2];
  *(_OWORD *)&self->_dfFrameMetadata.refExposure.average_focus_score = v56;
  *(_OWORD *)&self->_dfFrameMetadata.refExposure.blue_gaiuint64_t n = v58;
  *(_OWORD *)&self->_dfFrameMetadata.refExposure.isp_digital_gaiuint64_t n = v57;
  long long v59 = v55[7];
  long long v61 = v55[4];
  long long v60 = v55[5];
  *(_OWORD *)&self->_dfFrameMetadata.refExposure.ltm_locked = v55[6];
  *(_OWORD *)&self->_dfFrameMetadata.refExposure.quadraBinningFactor = v59;
  *(_OWORD *)&self->_dfFrameMetadata.refExposure.rem_exposure_bias = v61;
  *(_OWORD *)&self->_dfFrameMetadata.refExposure.sensor_black_level = v60;
  uint64_t v62 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  unsigned int v63 = [v62 properties];
  int v64 = [v63 meta];
  int v65 = (long long *)[v64 exposureParams];
  long long v66 = v65[3];
  long long v68 = *v65;
  long long v67 = v65[1];
  *(_OWORD *)&self->_dfFrameMetadata.syntheticLongExposure.ADRC_exp_gaiuint64_t n = v65[2];
  *(_OWORD *)&self->_dfFrameMetadata.syntheticLongExposure.average_focus_score = v66;
  *(_OWORD *)&self->_dfFrameMetadata.syntheticLongExposure.blue_gaiuint64_t n = v68;
  *(_OWORD *)&self->_dfFrameMetadata.syntheticLongExposure.isp_digital_gaiuint64_t n = v67;
  long long v69 = v65[7];
  long long v71 = v65[4];
  long long v70 = v65[5];
  *(_OWORD *)&self->_dfFrameMetadata.syntheticLongExposure.ltm_locked = v65[6];
  *(_OWORD *)&self->_dfFrameMetadata.syntheticLongExposure.quadraBinningFactor = v69;
  *(_OWORD *)&self->_dfFrameMetadata.syntheticLongExposure.rem_exposure_bias = v71;
  *(_OWORD *)&self->_dfFrameMetadata.syntheticLongExposure.sensor_black_level = v70;

  unsigned int v72 = [(RawDFDeferredFrames *)self->_inputFrames longFrame];
  inputFrames = self->_inputFrames;
  if (v72) {
    [(RawDFDeferredFrames *)inputFrames longFrame];
  }
  else {
  uint64_t v74 = [(RawDFDeferredFrames *)inputFrames referenceEv0Frame];
  }
  unsigned int v75 = [v74 properties];
  uint64_t v76 = [v75 meta];
  BOOL v77 = (long long *)[v76 exposureParams];
  long long v78 = v77[3];
  long long v80 = *v77;
  long long v79 = v77[1];
  *(_OWORD *)&self->_dfFrameMetadata.longExposure.ADRC_exp_gaiuint64_t n = v77[2];
  *(_OWORD *)&self->_dfFrameMetadata.longExposure.average_focus_score = v78;
  *(_OWORD *)&self->_dfFrameMetadata.longExposure.blue_gaiuint64_t n = v80;
  *(_OWORD *)&self->_dfFrameMetadata.longExposure.isp_digital_gaiuint64_t n = v79;
  long long v81 = v77[7];
  long long v83 = v77[4];
  long long v82 = v77[5];
  *(_OWORD *)&self->_dfFrameMetadata.longExposure.ltm_locked = v77[6];
  *(_OWORD *)&self->_dfFrameMetadata.longExposure.quadraBinningFactor = v81;
  *(_OWORD *)&self->_dfFrameMetadata.longExposure.rem_exposure_bias = v83;
  *(_OWORD *)&self->_dfFrameMetadata.longExposure.sensor_black_level = v82;

  LODWORD(self->_post) = *((_DWORD *)&self->_calculateLTM + 1);
  [(CMIDraftDemosaicStage *)self->_draftDemosaicStage setCameraInfoByPortType:self->_output];
  unsigned int v84 = [[LumaChromaImage alloc] initWithContext:self->_metal pixelBuffer:[(IBPSemanticStyleProperties *)self->_semanticStyleProperties buffer] lumaAlignmentFactor:16 chromaAlignmentFactor:8];
  outputImage = self->_outputImage;
  self->_outputImage = v84;

  if (!self->_outputImage) {
    goto LABEL_102;
  }
  int v86 = [(DeepFusionProcessor *)self _registerImages:1];
  if (v86)
  {
    int v37 = v86;
    uint64_t v130 = v4;
    LODWORD(v129) = v86;
    goto LABEL_106;
  }
  __int16 v87 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  uint64_t v88 = +[RawDFCommon getLSCGainsWithFrame:v87 lscGainsPlist:self->_lscGainsTex];
  float64_t v89 = *(void **)&self->_applyColorCubeFixOverride;
  *(void *)&self->_applyColorCubeFixOverride = v88;

  if (!*(void *)&self->_applyColorCubeFixOverride)
  {
    uint64_t v130 = v4;
    LODWORD(v129) = 0;
    FigDebugAssert3();
    uint64_t v120 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT);
LABEL_103:
    int v37 = -73390;
    goto LABEL_95;
  }
  uint64_t v90 = objc_opt_new();
  if (!v90)
  {
LABEL_102:
    uint64_t v120 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT);
    goto LABEL_103;
  }
  __int16 v91 = (void *)v90;
  [(DeepFusionProcessor *)self clearDraftDemosaicCache];
  uint64_t v92 = objc_opt_new();
  if (!v92)
  {
    uint64_t v121 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT);
    int v37 = -73390;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v132 = 0;
    unint64_t v108 = 0;
    __int16 v93 = 0;
    goto LABEL_97;
  }
  __int16 v93 = (void *)v92;
  size_t v94 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  int v95 = [(DeepFusionProcessor *)self generateSyntheticLongToOutput:v93];
  if (v95)
  {
    int v37 = v95;
    uint64_t v130 = v4;
    LODWORD(v129) = v95;
LABEL_84:
    FigDebugAssert3();
LABEL_104:
    uint64_t v132 = 0;
    goto LABEL_108;
  }
  if (*v94 == 1) {
    kdebug_trace();
  }
  *(void *)&self->_dfFrameMetadata.refExposure.gaiuint64_t n = [v93 ev0Count];
  if (*v94 == 1) {
    kdebug_trace();
  }
  int v96 = [(DeepFusionProcessor *)self _ensureSyntheticReferenceIsUnpacked:v91];
  if (v96)
  {
    int v37 = v96;
    uint64_t v130 = v4;
    LODWORD(v129) = v96;
    goto LABEL_84;
  }
  float64x2_t v97 = [(RawDFDeferredFrames *)self->_inputFrames syntheticReferenceFrame];
  [v97 releaseBaseTex];

  float64x2_t v98 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  [v98 releaseBaseTex];

  *(float *)&self->_dfFrameMetadata.ev0Count = self->_detectors.grayGhostDetectionScore;
  if (*v94 == 1) {
    kdebug_trace();
  }
  if ([(IBPSemanticStyleProperties *)self->_semanticStyleProperties quadraForEnhancedResOutputPixelBuffer])
  {
    uint64_t v99 = [[LumaChromaImage alloc] initWithContext:self->_metal pixelBuffer:[(IBPSemanticStyleProperties *)self->_semanticStyleProperties quadraForEnhancedResOutputPixelBuffer] lumaAlignmentFactor:16 chromaAlignmentFactor:8];
    sfdOutputImage = self->_sfdOutputImage;
    self->_sfdOutputImage = v99;

    if (!self->_sfdOutputImage)
    {
LABEL_90:
      id v123 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT);
      int v37 = -73390;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      goto LABEL_104;
    }
    uint64_t v101 = objc_opt_new();
    int v102 = [(DeepFusionProcessor *)self _finalizeQuadraSfdStep1:v101];
    if (v102)
    {
      int v37 = v102;
      uint64_t v132 = (void *)v101;
      uint64_t v130 = v4;
      LODWORD(v129) = v102;
LABEL_93:
      FigDebugAssert3();
LABEL_108:
      unint64_t v108 = 0;
      goto LABEL_97;
    }
  }
  else
  {
    uint64_t v101 = 0;
  }
  int v103 = [(DeepFusionProcessor *)self warpSyntheticLongIfNecessary:v93 toSyntheticReference:v91];
  uint64_t v132 = (void *)v101;
  if (v103)
  {
    int v37 = v103;
    uint64_t v130 = v4;
    LODWORD(v129) = v103;
    goto LABEL_93;
  }
  if (self->_sfdOutputImage)
  {
    if (v101)
    {
      int v104 = [(DeepFusionProcessor *)self _finalizeQuadraSfdStep2WithInput:v101];
      if (v104)
      {
        int v37 = v104;
        uint64_t v130 = v4;
        LODWORD(v129) = v104;
        goto LABEL_93;
      }
      goto LABEL_53;
    }
    goto LABEL_90;
  }
LABEL_53:
  float v105 = [(FigMetalContext *)self->_metal allocator];
  [v105 setForceDisableCompression:1];

  unint64_t v106 = [(FigMetalContext *)self->_metal allocator];
  [v106 purgeResources:0];

  if (!self->_inferenceResultsBindings.skinMask
    && [(IBPSemanticStyleProperties *)self->_semanticStyleProperties inferenceInputPixelBuffer])
  {
    if (*v94 == 1) {
      kdebug_trace();
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tuningParameters);
    int v116 = [WeakRetained processorGetInferenceResults:self inferenceInputBufferType:10];
    skinMasuint64_t k = self->_inferenceResultsBindings.skinMask;
    self->_inferenceResultsBindings.skinMasuint64_t k = v116;

    int v118 = [(DeepFusionProcessor *)self bindInferenceResults:self->_inferenceResultsBindings.skinMask toBindings:&self->_inferenceResultsBindings.skyMask];
    if (v118)
    {
      int v37 = v118;
      uint64_t v122 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT);
      goto LABEL_107;
    }
    if (*v94 == 1) {
      kdebug_trace();
    }
  }
  uint64_t v107 = objc_opt_new();
  if (!v107)
  {
    uint64_t v122 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT);
    int v37 = -73390;
LABEL_107:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_108;
  }
  unint64_t v108 = (void *)v107;
  if (*v94 == 1) {
    kdebug_trace();
  }
  int v109 = [(DeepFusionProcessor *)self runNetworkFusionWithInputSyntheticLong:v93 inputSytheticReference:v91 output:v108];
  if (v109)
  {
    int v37 = v109;
    uint64_t v130 = v4;
    LODWORD(v129) = v109;
LABEL_89:
    FigDebugAssert3();
    goto LABEL_97;
  }
  if (*v94 == 1)
  {
    kdebug_trace();
    if (*v94 == 1) {
      kdebug_trace();
    }
  }
  int v110 = [(DeepFusionProcessor *)self finalizeOutput:v108 syntheticLongOutput:v93 output:self->_outputImage];
  if (v110)
  {
    int v37 = v110;
    uint64_t v130 = v4;
    LODWORD(v129) = v110;
    goto LABEL_89;
  }
  if (*v94 == 1) {
    kdebug_trace();
  }
  [(RawDFDeferredFrames *)self->_inputFrames releaseRgbTextures];
  [(RawDFPowerBlurStage *)self->_rawDFPowerBlurStage releaseResources];
  float32x4_t v111 = [(FigMetalContext *)self->_metal allocator];
  float32x4_t v112 = [v111 backendAllocator];
  uint64_t v113 = [v112 usedSize];

  if (v113)
  {
    float32x4_t v114 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT);
    int v37 = -73390;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    int v37 = 0;
  }
LABEL_97:
  if (dword_26B430EE8)
  {
    unsigned int v124 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v37) {
    [(FigMetalContext *)self->_metal waitForIdle];
  }
  int v125 = [(FigMetalContext *)self->_metal allocator];
  [v125 setForceDisableCompression:0];

  int v126 = [(RawDFDeferredFrames *)self->_inputFrames referenceEv0Frame];
  long long v127 = [v126 metadata];
  [(DeepFusionProcessor *)self EndKTraceEventForProcess:v127];

  return v37;
}

- (NSString)description
{
  return (NSString *)@"DeepFusionProcessor";
}

- (int)purgeResources
{
  [(DeepFusionProcessor *)self resetState];
  lscGainsTex = self->_lscGainsTex;
  self->_lscGainsTex = 0;

  CVPixelBufferRelease(self->_regWarpInput);
  sharedRegWarpBuffer = self->_sharedRegWarpBuffer;
  self->_sharedRegWarpBuffer = 0;
  self->_regWarpInput = 0;

  self->_allocatorSetupComplete = 0;
  uint64_t v5 = [(FigMetalContext *)self->_metal allocator];
  [v5 purgeAllSubAllocatorsResources];

  long long v6 = [(FigMetalContext *)self->_metal allocator];
  [v6 purgeResources];

  uint64_t v7 = [(FigMetalContext *)self->_backgroundMetal allocator];
  [v7 purgeResources];

  return 0;
}

- (int)resetState
{
  sensorID = self->_sensorID;
  self->_sensorID = 0;

  tuningMode = self->_tuningMode;
  self->_tuningMode = 0;

  dfPlist = self->_dfPlist;
  self->_dfPlist = 0;

  self->_int fusionMode = 0;
  self->_hasLongFrame = 0;
  [(NRFProcessorInferenceResults *)self->_inferenceResults removeAllObjects];
  [(RawDFDeferredFrames *)self->_inputFrames releaseAll];
  [(DeepFusionProcessor *)self clearDraftDemosaicCache];
  LOBYTE(self->_darkestFrameMetadata) = 0;
  self->_BOOL hasEVM = 0;
  self->_runDetectors = 0;
  sifrMetadata = self->_sifrMetadata;
  self->_sifrMetadata = 0;

  +[RawDFDetectors resetDetectorsOutput:&self->_detectors.motionDetectionScore];
  self->_dsrMode = 0;
  nrfInfoDict = self->_nrfInfoDict;
  self->_nrfInfoDict = 0;

  uint64_t v8 = MEMORY[0x263EF89A0];
  long long v9 = *MEMORY[0x263EF89A0];
  long long v10 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  *(_OWORD *)self->_anon_120 = *MEMORY[0x263EF89A0];
  *(_OWORD *)&self->_anon_120[16] = v10;
  long long v11 = *(_OWORD *)(v8 + 32);
  *(_OWORD *)&self->_anon_120[32] = v11;
  *(_OWORD *)self->_anon_150 = v9;
  *(_OWORD *)&self->_anon_150[16] = v10;
  *(_OWORD *)&self->_anon_150[32] = v11;
  nrfStatus = self->_nrfStatus;
  self->_nrfStatus = 0;

  nrfInputBracketCount = self->_nrfInputBracketCount;
  self->_nrfInputBracketCount = 0;

  nrfRegisteredBracketCount = self->_nrfRegisteredBracketCount;
  self->_nrfRegisteredBracketCount = 0;

  sidecar = self->_sidecar;
  self->_sidecar = 0;

  [(RawDFCommon *)self->_rawDFCommon reset];
  lscGainsPlist = self->_lscGainsPlist;
  self->_lscGainsPlist = 0;

  int v17 = *(void **)&self->_applyColorCubeFixOverride;
  *(void *)&self->_applyColorCubeFixOverride = 0;

  self->_addFrameCount = 0;
  *(void *)&self->_rawDFSoftLTMMode = 0xBF80000000000000;
  [(ColorConvertStage *)self->_colorConvertStage reset];
  [(RawDFPowerBlurStage *)self->_rawDFPowerBlurStage releaseResources];
  int v18 = [(FigMetalContext *)self->_metal allocator];
  [v18 reset];

  int v19 = [(FigMetalContext *)self->_metal allocator];
  [v19 purgeAllSubAllocatorsResources];

  int v20 = [(FigMetalContext *)self->_metal allocator];
  [v20 setForceDisableCompression:0];

  LODWORD(self->_delegate) = 1;
  *(_WORD *)&self->_aggressiveMemoryOptimizations = 0;
  skinMasuint64_t k = self->_inferenceResultsBindings.skinMask;
  self->_inferenceResultsBindings.skinMasuint64_t k = 0;

  int v22 = self->_sfdInferenceResultsBindings.skinMask;
  self->_sfdInferenceResultsBindings.skinMasuint64_t k = 0;

  +[DeepFusionProcessor resetInferenceResultsBindings:&self->_inferenceResultsBindings.skyMask];
  +[DeepFusionProcessor resetInferenceResultsBindings:&self->_sfdInferenceResultsBindings.skyMask];
  outputImage = self->_outputImage;
  self->_outputImage = 0;

  sfdOutputImage = self->_sfdOutputImage;
  self->_sfdOutputImage = 0;

  [(NRFConcurrentProcessing *)self->_concurrentProcessing resetFinalProcessingStatus];
  [*(id *)&self->_dfFrameMetadata.hasEVM resetFinalProcessingStatus];
  return 0;
}

- (IBPDeepFusionProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tuningParameters);

  return (IBPDeepFusionProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CMIExternalMemoryResource)externalMemoryResource
{
  return self->_externalMemoryResource;
}

- (void)setExternalMemoryResource:(id)a3
{
}

- (NSDictionary)tuningParameters
{
  return (NSDictionary *)self->_metalCommandQueue;
}

- (void)setTuningParameters:(id)a3
{
}

- (MTLCommandQueue)metalCommandQueue
{
  return (MTLCommandQueue *)self->_cameraInfoByPortType;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (NSDictionary)cameraInfoByPortType
{
  return (NSDictionary *)self->_output;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (IBPDeepFusionOutput)output
{
  return self->_semanticStyleProperties;
}

- (void)setOutput:(id)a3
{
}

- (IBPSemanticStyleProperties)semanticStyleProperties
{
  return self[1].super.isa;
}

- (void)setSemanticStyleProperties:(id)a3
{
}

- (int)processingMode
{
  return (int)self->_delegate;
}

- (void)setProcessingMode:(int)a3
{
  LODWORD(self->_delegate) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self[1].super.isa, 0);
  objc_storeStrong((id *)&self->_semanticStyleProperties, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_destroyWeak((id *)&self->_tuningParameters);
  objc_storeStrong((id *)&self->_processingMode, 0);
  objc_storeStrong((id *)&self->_useRegwarpCPU, 0);
  objc_storeStrong((id *)&self->_rawDFSyntheticReferenceUnpackStage, 0);
  objc_storeStrong((id *)&self->_rawDFSyntheticReferenceStage, 0);
  objc_storeStrong((id *)&self->_rawDFColorMatchStage, 0);
  objc_storeStrong((id *)&self->_rawDFDownsampleStage, 0);
  objc_storeStrong((id *)&self->_flickerDetection, 0);
  objc_storeStrong((id *)&self->_grayGhostDetection, 0);
  objc_storeStrong((id *)&self->_motionDetection, 0);
  objc_storeStrong((id *)&self->_colorConvertStage, 0);
  objc_storeStrong((id *)&self->_softLTMStage, 0);
  objc_storeStrong((id *)&self->_rawDFPostDemosaicStage, 0);
  objc_storeStrong((id *)&self->_gainMapStage, 0);
  objc_storeStrong((id *)&self->_rawDFInferenceGen, 0);
  objc_storeStrong((id *)&self->_warpStage, 0);
  objc_storeStrong((id *)&self->_rawDFSyntheticLongStage, 0);
  objc_storeStrong((id *)&self->_rawDFZoomStage, 0);
  objc_storeStrong((id *)&self->_rawDFLumaSharpenStage, 0);
  objc_storeStrong((id *)&self->_rawDFPowerBlurStage, 0);
  objc_storeStrong((id *)&self->_regwarpGPU, 0);
  objc_storeStrong((id *)&self->_draftDemosaicStage, 0);
  objc_storeStrong((id *)&self->_demosaicStage, 0);
  objc_storeStrong((id *)&self->_rawDFCommon, 0);
  objc_storeStrong((id *)&self->_dfFrameMetadata, 0);
  objc_storeStrong((id *)&self->_backgroundLearnedNR, 0);
  objc_storeStrong((id *)&self->_concurrentProcessing, 0);
  objc_storeStrong((id *)&self->_rawDFNetworkStage, 0);
  objc_storeStrong((id *)&self->_regDense, 0);
  objc_storeStrong((id *)&self->_enableSTF, 0);
  objc_storeStrong((id *)&self->_semanticStylesStage, 0);
  __destructor_8_s0_s8_s16_s24((uint64_t)&self->_sfdInferenceResultsBindings.skyMask);
  objc_storeStrong((id *)&self->_sfdInferenceResultsBindings.skinMask, 0);
  __destructor_8_s0_s8_s16_s24((uint64_t)&self->_inferenceResultsBindings.skyMask);
  objc_storeStrong((id *)&self->_inferenceResultsBindings.skinMask, 0);
  objc_storeStrong((id *)&self->_inferenceResults, 0);
  objc_storeStrong((id *)&self->_framesPendingToBeRegistered, 0);
  objc_storeStrong((id *)&self->_applyColorCubeFixOverride, 0);
  objc_storeStrong((id *)&self->_lscGainsTex, 0);
  objc_storeStrong((id *)&self->_lscGainsPlist, 0);
  objc_storeStrong((id *)&self->_sidecar, 0);
  objc_storeStrong((id *)&self->_nrfRegisteredBracketCount, 0);
  objc_storeStrong((id *)&self->_nrfInputBracketCount, 0);
  objc_storeStrong((id *)&self->_nrfStatus, 0);
  objc_storeStrong((id *)&self->_nrfInfoDict, 0);
  objc_storeStrong((id *)&self->_sifrMetadata, 0);
  objc_storeStrong((id *)&self->_dfPlist, 0);
  objc_storeStrong((id *)&self->_tuningMode, 0);
  objc_storeStrong((id *)&self->_sensorID, 0);
  objc_storeStrong((id *)&self->_backgroundMetal, 0);
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_sfdOutputImage, 0);
  objc_storeStrong((id *)&self->_outputImage, 0);
  objc_storeStrong((id *)&self->_inputFrames, 0);
  objc_storeStrong((id *)&self->_imageLanczosScaler, 0);
  objc_storeStrong((id *)&self->_registrationPipelineRWPP, 0);
  objc_storeStrong((id *)&self->_sharedRegWarpBuffer, 0);
  objc_storeStrong((id *)&self->_externalMemoryResource, 0);
  objc_storeStrong((id *)&self->_deviceModelName, 0);
  objc_storeStrong((id *)&self->_dasTuningOptions, 0);
  objc_storeStrong((id *)&self->_tuningParamsPlist, 0);

  objc_storeStrong((id *)&self->_tuningParams, 0);
}

@end