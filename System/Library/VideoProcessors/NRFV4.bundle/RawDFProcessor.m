@interface RawDFProcessor
- (BOOL)_isGainMapSupported;
- (BOOL)_isSemanticStylesSupported;
- (BOOL)doRedFaceFix;
- (BOOL)enableGreenGhostMitigation;
- (BOOL)referenceFrameHasEVMinus;
- (BOOL)skipDenoising;
- (BOOL)srlEnabled;
- (BOOL)supportsInputPixelFormat:(unsigned int)a3;
- (CGRect)_downscaleRoiForRegistration:(CGRect)a3;
- (FigMetalAllocatorBackend)allocatorBackend;
- (FigWiredMemory)sharedRegWarpBuffer;
- (IBPSemanticStyleProperties)semanticStyleProperties;
- (MTLCommandQueue)metalCommandQueue;
- (NRFOutput)output;
- (NRFProcessorDelegate)delegate;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (NSMutableDictionary)defringingTuningByPortType;
- (NSMutableDictionary)tuningParams;
- (NSMutableDictionary)tuningParamsPlist;
- (NSString)description;
- (RawDFProcessor)initWithCommandQueue:(id)a3;
- (__IOSurface)regwarpInputSurface;
- (id)getTuningModeForCurrentProcessingMode;
- (int)_allocateRegWarpPPWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5;
- (int)_doDeepFusionSytheticRefererenceAndProxy;
- (int)_generateSyntheticRefererence:(id *)a3 outputNoiseDivisor:(id)a4 withDetectorsOutput:(id *)a5;
- (int)_multiFrameProcessing:(BOOL)a3;
- (int)_populateDeepFusionMetadata:(id)a3 hasEVM:(BOOL)a4;
- (int)_preprocessFrame:(id)a3;
- (int)_preprocessReferenceFrames:(BOOL)a3;
- (int)_processInferenceImage:(__CVBuffer *)a3 sourceFrameLumaChromaImage:(id)a4 sourceFrameProperties:(id)a5 ltcFrameProperties:(id)a6 gtcFrameProperties:(id)a7 originalWidth:(unint64_t)a8 originalHeight:(unint64_t)a9;
- (int)_processInputFrame:(id)a3;
- (int)_processSIFRandRefEV0IfPossible:(int)a3;
- (int)_registerImages:(BOOL)a3;
- (int)_setupFusionConfig;
- (int)_verifyConsistentMetadataWithFrame:(id)a3;
- (int)addFrame:(opaqueCMSampleBuffer *)a3;
- (int)addInputResource:(id)a3;
- (int)batchCount;
- (int)bindResourcesForProcessingType:(unsigned int)a3 prepareDescriptor:(id)a4;
- (int)cntBracketSampleBuffers;
- (int)deepFusionProcessingMode;
- (int)determineWorkingBufferRequirementsToProcess:(unsigned int)a3 prepareDescriptor:(id)a4 nrfConfig:(id)a5 denoiseFusePipelineSize:(unint64_t *)a6 rwppSize:(unint64_t *)a7 rwppInputWidth:(unint64_t *)a8 rwppInputHeight:(unint64_t *)a9;
- (int)determineWorkingBufferRequirementsWithPrepareDescriptorByProcessingType:(id)a3 nrfConfig:(id)a4 memoryAllocationInfo:(id *)a5;
- (int)finishProcessing;
- (int)getRawDFFrameTypeForInputFrame:(id)a3;
- (int)maximumNumberOfReferenceFrameCandidatesToHoldForProcessing;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prepareToProcess:(unsigned int)a3 prepareDescriptor:(id)a4;
- (int)prepareTuning:(id)a3;
- (int)prewarm;
- (int)prewarmWithTuningParameters:(id)a3;
- (int)process;
- (int)purgeResources;
- (int)referenceFrameCandidatesCount;
- (int)referenceFrameIndex;
- (int)resetInternalState;
- (int)resetState;
- (int)setup;
- (int)setupWithOptions:(id)a3 nrfConfig:(id)a4;
- (unint64_t)calculateBackingBufferSizeForDesc:(id)a3 nrfConfig:(id)a4 metal:(id)a5;
- (unsigned)processingType;
- (void)_prepareOutputMetadata:(int)a3;
- (void)addToSidecar:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)finishScheduling;
- (void)reportFusionReferenceFrame:(int)a3;
- (void)setAllocatorBackend:(id)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setDeepFusionProcessingMode:(int)a3;
- (void)setDefringingTuningByPortType:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDoRedFaceFix:(BOOL)a3;
- (void)setEnableGreenGhostMitigation:(BOOL)a3;
- (void)setFusionMode:(int)a3;
- (void)setLinearOutputMetadata:(id)a3;
- (void)setMaximumNumberOfReferenceFrameCandidatesToHoldForProcessing:(int)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setOutput:(id)a3;
- (void)setProcessingType:(unsigned int)a3;
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

@implementation RawDFProcessor

- (int)cntBracketSampleBuffers
{
  v2 = [(RawDFCommon *)self->_rawDFCommon frames];
  int v3 = [v2 count];

  return v3;
}

- (int)setup
{
  return 0;
}

- (BOOL)supportsInputPixelFormat:(unsigned int)a3
{
  int v3 = CVPixelFormatDescriptionGetDescriptionWithPixelFormatType();
  v4 = v3;
  if (v3
    && ([v3 objectForKeyedSubscript:*MEMORY[0x263F042C8]],
        v5 = objc_claimAutoreleasedReturnValue(),
        unint64_t v6 = [v5 count],
        v5,
        v6 < 2))
  {
    BOOL v7 = 1;
  }
  else
  {
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    BOOL v7 = 0;
  }

  return v7;
}

- (int)process
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_semanticStyleProperties);
  v4 = [(RawDFCommon *)self->_rawDFCommon frames];
  uint64_t v5 = [v4 count];

  p_cache = &OBJC_METACLASS___H13FastPostDemosaicProcShaders.cache;
  if (v5
    && (self->_cntBracketSampleBuffers & 0x80000000) == 0
    && ([(RawDFCommon *)self->_rawDFCommon referenceFrame],
        (BOOL v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = v7;
    v9 = [v7 metadata];
    [(RawDFProcessor *)self StartKTraceEventForProcess:v9];

    v10 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
    if (dword_26B430EE8)
    {
      v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[NRFDeepFusionOutput setRefFrameTransform:](self->_deepFusionOutput, "setRefFrameTransform:", *MEMORY[0x263EF89A0], *(double *)(MEMORY[0x263EF89A0] + 16), *(double *)(MEMORY[0x263EF89A0] + 32), v59, v60);
    if (!self->_processedSIFRandRefEV0) {
      [(FigMetalContext *)self->_metal waitForIdle];
    }
    uint64_t v12 = [(RawDFProcessor *)self _multiFrameProcessing:1];
    if (v12)
    {
      uint64_t v21 = v12;
      uint64_t v61 = v2;
      LODWORD(v59) = v12;
      FigDebugAssert3();
    }
    else
    {
      unsigned int cntBracketSampleBuffers = self->_cntBracketSampleBuffers;
      if ((cntBracketSampleBuffers & 0x80000000) == 0)
      {
        v14 = (_OWORD *)((char *)self + 48 * cntBracketSampleBuffers);
        long long v63 = v14[11];
        long long v64 = v14[10];
        long long v62 = v14[12];
        if ([(NRFDeepFusionOutput *)self->_deepFusionOutput refFrameTransformIsValid])
        {
          if (v10)
          {
            v15 = [v10 properties];
            int v16 = [v15 hasValidRegistration];

            if (v16)
            {
              v17 = [v10 properties];
              v18 = (long long *)[v17 regHomography];
              long long v63 = v18[1];
              long long v64 = *v18;
              long long v62 = v18[2];
            }
          }
        }
        if (LODWORD(self->_output) == 3) {
          -[NRFDeepFusionOutput setRefFrameTransform:](self->_deepFusionOutput, "setRefFrameTransform:", *(double *)&v64, *(double *)&v63, *(double *)&v62);
        }
      }
      [(RawDFCommon *)self->_rawDFCommon releaseRgbTextures];
      v19 = [(FigMetalContext *)self->_metal allocator];
      uint64_t v20 = [v19 usedSizeAll];

      if (v20) {
        uint64_t v21 = FigSignalErrorAt();
      }
      else {
        uint64_t v21 = 0;
      }
    }
  }
  else
  {
    uint64_t v61 = v2;
    LODWORD(v59) = 0;
    FigDebugAssert3();
    v58 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
    uint64_t v21 = 4294894005;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v10 = 0;
    v8 = 0;
  }
  -[RawDFProcessor _prepareOutputMetadata:](self, "_prepareOutputMetadata:", v21, v59, v61);
  v22 = [MEMORY[0x263F12800] sharedCaptureManager];
  [v22 stopCapture];

  if (self->_nrfConfig->_isAsynchronous) {
    [(RawDFProcessor *)self finishScheduling];
  }
  else {
    [(RawDFProcessor *)self finishProcessing];
  }
  if (objc_opt_respondsToSelector())
  {
    [(FigMetalContext *)self->_metal waitForSchedule];
    if (![(NRFDeepFusionOutput *)self->_deepFusionOutput proxyPixelBuffer])
    {
LABEL_51:
      if (LODWORD(self->_output) == 3)
      {
        if ([(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferencePixelBuffer]|| ([(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferenceMetadata], v52 = objc_claimAutoreleasedReturnValue(), v52, v52))
        {
          v53 = [(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferencePixelBuffer];
          v54 = [(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferenceMetadata];
          [WeakRetained processor:self outputReadyWithFrameType:3 outputPixelBuffer:v53 outputMetadata:v54 error:v21];
        }
        if ([(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferenceFusionMapPixelBuffer])
        {
          objc_msgSend(WeakRetained, "processor:outputReadyWithFrameType:outputPixelBuffer:outputMetadata:error:", self, 4, -[NRFDeepFusionOutput syntheticReferenceFusionMapPixelBuffer](self->_deepFusionOutput, "syntheticReferenceFusionMapPixelBuffer"), 0, v21);
        }
      }
      goto LABEL_57;
    }
    if (*MEMORY[0x263F00E10] == 1) {
      kdebug_trace();
    }
    if ([(NRFDeepFusionOutput *)self->_deepFusionOutput linearOutputPixelBuffer])
    {
      v23 = [(NRFDeepFusionOutput *)self->_deepFusionOutput linearOutputMetadata];
      [(RawDFProcessor *)self setLinearOutputMetadata:v23];

      v24 = [(NRFDeepFusionOutput *)self->_deepFusionOutput linearOutputPixelBuffer];
      v25 = [(NRFDeepFusionOutput *)self->_deepFusionOutput linearOutputMetadata];
      [WeakRetained processor:self outputReadyWithFrameType:10 outputPixelBuffer:v24 outputMetadata:v25 error:v21];
    }
    BOOL enableSTF = self->_nrfPlist->toneMapping->enableSTF;
    v27 = [(NRFDeepFusionOutput *)self->_deepFusionOutput proxyMetadata];
    v28 = v27;
    uint64_t v29 = *MEMORY[0x263F2F190];
    if (enableSTF)
    {
      [v27 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v29];

      v30 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)&self->_rawDFSoftLTMMode, "stfStillApplied"));
      v31 = [(NRFDeepFusionOutput *)self->_deepFusionOutput proxyMetadata];
      [v31 setObject:v30 forKeyedSubscript:*MEMORY[0x263F2F180]];

      if (![*(id *)&self->_rawDFSoftLTMMode stfStillApplied]) {
        goto LABEL_33;
      }
      v32 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)&self->_rawDFSoftLTMMode, "getSTFStillCorrectionStrength:", 0));
      v33 = [(NRFDeepFusionOutput *)self->_deepFusionOutput proxyMetadata];
      [v33 setObject:v32 forKeyedSubscript:*MEMORY[0x263F2F188]];

      v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)&self->_rawDFSoftLTMMode, "stfStillAnalyticsVersion"));
      v34 = [(NRFDeepFusionOutput *)self->_deepFusionOutput proxyMetadata];
      [v34 setObject:v28 forKeyedSubscript:*MEMORY[0x263F2F178]];
    }
    else
    {
      [v27 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v29];
    }

LABEL_33:
    if ([(NRFDeepFusionOutput *)self->_deepFusionOutput fusionMode] == 1
      || [(NRFDeepFusionOutput *)self->_deepFusionOutput fusionMode] == 2)
    {
      int v35 = [(NRFDeepFusionOutput *)self->_deepFusionOutput fusionMode];
      rawDFCommon = self->_rawDFCommon;
      if (v35 == 1) {
        [(RawDFCommon *)rawDFCommon referenceFrame];
      }
      else {
      v37 = [(RawDFCommon *)rawDFCommon sifrFrame];
      }
      v38 = [v37 properties];
      v39 = [v38 meta];
      int v40 = [v39 zoomApplied];

      if (v40)
      {
        v41 = [(NRFDeepFusionOutput *)self->_deepFusionOutput proxyMetadata];
        +[RawDFZoomStage setOutputMetadata:v41 withFrame:v37];
      }
      p_cache = &OBJC_METACLASS___H13FastPostDemosaicProcShaders.cache;
    }
    else if (v21)
    {
      uint64_t v21 = v21;
    }
    else
    {
      uint64_t v21 = 4294894005;
    }
    v42 = [(NRFDeepFusionOutput *)self->_deepFusionOutput gainMapOutputMetadata];

    if (v42)
    {
      v43 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];

      if (v43)
      {
        rawDFPowerBlurStage = self->_rawDFPowerBlurStage;
        v44 = [(NRFDeepFusionOutput *)self->_deepFusionOutput gainMapOutputMetadata];
        v45 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
        v46 = [v45 properties];
        [v46 meta];
        v48 = v47 = v10;
        v49 = [v48 faces];
        -[RawDFPowerBlurStage prepareGainMapMetadata:hasFaces:](rawDFPowerBlurStage, "prepareGainMapMetadata:hasFaces:", v44, [v49 count] != 0);

        v10 = v47;
        p_cache = (void **)(&OBJC_METACLASS___H13FastPostDemosaicProcShaders + 16);
      }
      else if (v21)
      {
        uint64_t v21 = v21;
      }
      else
      {
        uint64_t v21 = 4294894005;
      }
    }
    v50 = [(NRFDeepFusionOutput *)self->_deepFusionOutput proxyPixelBuffer];
    v51 = [(NRFDeepFusionOutput *)self->_deepFusionOutput proxyMetadata];
    [WeakRetained processor:self outputReadyWithFrameType:2 outputPixelBuffer:v50 outputMetadata:v51 error:v21];

    goto LABEL_51;
  }
LABEL_57:
  [(RawDFProcessor *)self resetInternalState];
  v55 = [v8 metadata];
  [(RawDFProcessor *)self EndKTraceEventForProcess:v55];

  if (*((_DWORD *)p_cache + 954))
  {
    v56 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v21;
}

- (id)getTuningModeForCurrentProcessingMode
{
  int maximumNumberOfReferenceFrameCandidatesToHoldForProcessing = self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing;
  if ((maximumNumberOfReferenceFrameCandidatesToHoldForProcessing - 3) < 2)
  {
    int v3 = &RawDFTuningModeQsub;
    goto LABEL_7;
  }
  if (maximumNumberOfReferenceFrameCandidatesToHoldForProcessing == 2)
  {
    int v3 = &RawDFTuningModeEnhancedRes;
    goto LABEL_7;
  }
  if (maximumNumberOfReferenceFrameCandidatesToHoldForProcessing == 1)
  {
    int v3 = &RawDFTuningModeBayer;
LABEL_7:
    v4 = *v3;
    goto LABEL_8;
  }
  unint64_t v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();

  v4 = 0;
LABEL_8:

  return v4;
}

- (int)addInputResource:(id)a3
{
  v96[17] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 metadata];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2F668]];
  BOOL v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
  v81 = (void *)v6;
  v8 = [(NSMutableDictionary *)self->_tuningParams objectForKeyedSubscript:v6];
  v79 = [(NSDictionary *)self->_tuningParameters objectForKeyedSubscript:v7];
  v80 = v5;
  if (v4)
  {
    v9 = [RawDFInputFrame alloc];
    metal = self->_metal;
    v78 = v7;
    v11 = [(FigMetalAllocatorBackend *)self->_allocatorBackend objectForKeyedSubscript:v7];
    uint64_t v12 = [(RawDFInputFrame *)v9 initWithMetalContext:metal cameraInfo:v11 inputFrame:v4 metadata:v5 uniqueFrameId:LODWORD(self->_inputFrames)];

    if (!v12)
    {
      unsigned int v85 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v61 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
      int v15 = -73297;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      goto LABEL_33;
    }
    [v4 releaseAll];
    [(RawDFInputFrame *)v12 setStrideAlignment:16];
    [(RawDFInputFrame *)v12 setHeightAlignment:16];
    int v13 = [(RawDFInputFrame *)v12 prepareInputFrame];
    if (v13)
    {
      uint64_t v69 = v77;
      LODWORD(v68) = v13;
      FigDebugAssert3();
      int v15 = 0;
      goto LABEL_33;
    }
    int v14 = [(RawDFInputFrame *)v12 getGDCParametersWithCameraInfoByPortType:self->_allocatorBackend];
    if (v14)
    {
      int v15 = v14;
      goto LABEL_33;
    }
    int v15 = -73297;
    if (!v8)
    {
LABEL_33:
      v53 = [(RawDFInputFrame *)v12 properties];
      [v4 presentationTimeStamp];

      BOOL v7 = v78;
      goto LABEL_34;
    }
    int v16 = [(RawDFInputFrame *)v12 properties];
    [v4 presentationTimeStamp];
    [(RawDFProcessor *)self StartKTraceEventForAddFrame:v16 timestamp:v83];

    v17 = [(RawDFInputFrame *)v12 properties];
    v18 = [v17 meta];
    if ([v18 isLongFrame])
    {
      v19 = [(RawDFInputFrame *)v12 properties];
      [v19 meta];
      v21 = id v20 = v4;
      int v22 = [v21 isEVMFrame];

      id v4 = v20;
      if (v22)
      {
        v23 = v8;
        uint64_t v69 = v77;
        LODWORD(v68) = 0;
        FigDebugAssert3();
        unsigned int v85 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v25 = v85;
        if (os_log_type_enabled(v24, type)) {
          unsigned int v26 = v25;
        }
        else {
          unsigned int v26 = v25 & 0xFFFFFFFE;
        }
        if (v26)
        {
          int v86 = 136315138;
          v87 = "-[RawDFProcessor addInputResource:]";
          LODWORD(v69) = 12;
          v68 = &v86;
          _os_log_send_and_compose_impl();
        }
        v8 = v23;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        goto LABEL_33;
      }
    }
    else
    {
    }
    if (!self->_requestTuningParams)
    {
LABEL_29:
      int v51 = [(RawDFCommon *)self->_rawDFCommon addFrame:v12];
      if (v51)
      {
        int v15 = v51;
        uint64_t v69 = v77;
        LODWORD(v68) = v51;
        goto LABEL_49;
      }
      int v52 = [(RawDFProcessor *)self _processInputFrame:v12];
      int v15 = v52;
      if (v52)
      {
        uint64_t v69 = v77;
        LODWORD(v68) = v52;
LABEL_49:
        FigDebugAssert3();
        goto LABEL_33;
      }
      goto LABEL_33;
    }
    v75 = v8;
    v27 = objc_opt_new();
    v28 = [(FigMetalContext *)self->_metal device];
    [v27 setCaptureObject:v28];

    [v27 setDestination:1];
    uint64_t v29 = [MEMORY[0x263F12800] sharedCaptureManager];
    [v29 startCaptureWithDescriptor:v27 error:0];

    v76 = [(RawDFProcessor *)self getTuningModeForCurrentProcessingMode];
    if (v76)
    {
      id v74 = v4;
      v30 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
      v31 = [v30 properties];
      v32 = [v31 meta];
      v33 = @"Default";
      if ([v32 hasZoomRects])
      {
        v72 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
        v71 = [v72 properties];
        v70 = [v71 meta];
        [v70 zoomDstRect];
        double v35 = v34;
        [(RawDFCommon *)self->_rawDFCommon referenceFrame];
        v36 = v73 = v30;
        [v36 properties];
        v38 = v37 = v27;
        v39 = [v38 meta];
        [v39 zoomSrcRect];
        *(float *)&double v35 = v35 / v40;

        v27 = v37;
        v30 = v73;

        if (*(float *)&v35 > 1.0) {
          v33 = @"Zoom";
        }
      }

      tuningParams = self->_tuningParams;
      v42 = v33;
      v43 = [(NSMutableDictionary *)tuningParams objectForKeyedSubscript:v81];
      v44 = [v43 objectForKeyedSubscript:v76];
      v45 = [v44 objectForKeyedSubscript:v42];

      nrfPlist = self->_nrfPlist;
      self->_nrfPlist = v45;

      v47 = self->_nrfPlist;
      if (v47)
      {
        [(RawDFPostDemosaicStage *)self->_rawDFPostDemosaicStage setToneMappingPlist:v47->toneMapping];
        [(CMIDraftDemosaicStage *)self->_draftDemosaicStage setQdemTuningParams:self->_nrfPlist->qdemTuning];
        [(CMIDraftDemosaicStage *)self->_draftDemosaicStage setZimmerDEMTuningParams:self->_nrfPlist->zimmerDEMTuning];
        v96[0] = self->_nrfPlist->postDemosaicTuning;
        v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v96 count:1];
        [(SoftLTM *)self->_softLTMStage setTuningParams:v48];

        miwbPlist = self->_nrfPlist->miwbPlist;
        id v4 = v74;
        if (miwbPlist) {
          LOBYTE(miwbPlist) = miwbPlist->enableMIWB;
        }
        self->_nrfConfig->_enableMIWB = (char)miwbPlist;

        v50 = self->_nrfPlist;
        if (v50->proxyAssetEV0RefDenoising)
        {
          if (v50->proxyAssetEVMRefDenoising)
          {
            if (v50->noiseModel)
            {
              if (v50->toneMapping)
              {
                v8 = v75;
                if (LODWORD(self->_output) != 3 || v50->syntheticReference)
                {
                  self->_requestTuningParams = 0;

                  goto LABEL_29;
                }
                uint64_t v69 = v77;
                LODWORD(v68) = 0;
                FigDebugAssert3();
                int v15 = FigSignalErrorAt();
LABEL_67:

                goto LABEL_33;
              }
              uint64_t v69 = v77;
              LODWORD(v68) = 0;
            }
            else
            {
              uint64_t v69 = v77;
              LODWORD(v68) = 0;
            }
          }
          else
          {
            uint64_t v69 = v77;
            LODWORD(v68) = 0;
          }
        }
        else
        {
          uint64_t v69 = v77;
          LODWORD(v68) = 0;
        }
        FigDebugAssert3();
        int v15 = FigSignalErrorAt();
        v8 = v75;
        goto LABEL_67;
      }
      unsigned int v85 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      long long v62 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v66 = v85;
      if (os_log_type_enabled(v62, type)) {
        unsigned int v67 = v66;
      }
      else {
        unsigned int v67 = v66 & 0xFFFFFFFE;
      }
      id v4 = v74;
      if (!v67)
      {
LABEL_66:
        v8 = v75;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        goto LABEL_67;
      }
      int v86 = 136315138;
      v87 = "-[RawDFProcessor addInputResource:]";
      LODWORD(v69) = 12;
      v68 = &v86;
    }
    else
    {
      unsigned int v85 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      long long v62 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v63 = v85;
      if (os_log_type_enabled(v62, type)) {
        unsigned int v64 = v63;
      }
      else {
        unsigned int v64 = v63 & 0xFFFFFFFE;
      }
      if (!v64) {
        goto LABEL_66;
      }
      int maximumNumberOfReferenceFrameCandidatesToHoldForProcessing = self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing;
      int v86 = 136315394;
      v87 = "-[RawDFProcessor addInputResource:]";
      __int16 v88 = 1024;
      LODWORD(v89) = maximumNumberOfReferenceFrameCandidatesToHoldForProcessing;
      LODWORD(v69) = 18;
      v68 = &v86;
    }
    _os_log_send_and_compose_impl();
    goto LABEL_66;
  }
  int v15 = FigSignalErrorAt();
  v53 = [0 properties];
  memset(v82, 0, sizeof(v82));
LABEL_34:
  [(RawDFProcessor *)self EndKTraceEventForAddFrame:v53 timestamp:v82];

  if (dword_26B430EE8)
  {
    unsigned int v85 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v54 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v55 = v85;
    if (os_log_type_enabled(v54, type)) {
      unsigned int v56 = v55;
    }
    else {
      unsigned int v56 = v55 & 0xFFFFFFFE;
    }
    if (v56)
    {
      v57 = [(RawDFProcessor *)self description];
      int inputFrames = (int)self->_inputFrames;
      int v86 = 136316163;
      v87 = "-[RawDFProcessor addInputResource:]";
      uint64_t v59 = "failed";
      __int16 v88 = 2113;
      v89 = v57;
      if (!v15) {
        uint64_t v59 = "succeeded";
      }
      __int16 v90 = 1026;
      int v91 = inputFrames;
      __int16 v92 = 2081;
      v93 = v59;
      __int16 v94 = 1026;
      BOOL v95 = v15 == 0;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  ++LODWORD(self->_inputFrames);

  return v15;
}

- (int)addFrame:(opaqueCMSampleBuffer *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v6 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F2EF78], 0);
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer)
  {
    int v30 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    int v19 = -73298;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v9 = 0;
LABEL_11:
    int v13 = 0;
    int v16 = 0;
    v17 = 0;
    goto LABEL_12;
  }
  v8 = ImageBuffer;
  v9 = objc_opt_new();
  uint64_t v10 = *MEMORY[0x263F04238];
  v11 = (void *)CVBufferCopyAttachment(v8, (CFStringRef)*MEMORY[0x263F04238], 0);
  [v9 setObject:v11 forKeyedSubscript:v10];

  uint64_t v12 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:v8 pixelFormat:25 usage:1 plane:0 widthAlignmentFactor:16 heightAlignmentFactor:16];
  if (!v12)
  {
    int v30 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    int v19 = -73298;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_11;
  }
  int v13 = (void *)v12;
  uint64_t v14 = *MEMORY[0x263F2EF58];
  CFTypeRef v15 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F2EF58], 0);
  if (self->_useSoftISPProvidedDraftDemosaicBuffers && v15) {
    [v9 setObject:v15 forKeyedSubscript:v14];
  }
  int v16 = objc_opt_new();
  [v16 setMetadata:v6];
  [v16 setMatchingPixelBufferFormat:CVPixelBufferGetPixelFormatType(v8)];
  CMSampleBufferGetPresentationTimeStamp(&v28, a3);
  CMTime v27 = v28;
  [v16 setPresentationTimeStamp:&v27];
  [v16 setAttachments:v9];
  v17 = (void *)[objc_alloc(MEMORY[0x263F2EDA8]) initWithTexture:v13 descriptor:v16];
  int v18 = [(RawDFProcessor *)self addInputResource:v17];
  int v19 = v18;
  if (v18)
  {
    uint64_t v26 = v3;
    LODWORD(v25) = v18;
    FigDebugAssert3();
LABEL_12:
    v23 = [(FigMetalContext *)self->_metal allocator];
    [v23 reset];

    v24 = [(FigMetalContext *)self->_metal allocator];
    [v24 purgeResources:0];
  }
  return v19;
}

- (int)_processInputFrame:(id)a3
{
  id v4 = a3;
  if (v4 && self->_deepFusionOutput)
  {
    int v5 = [(RawDFProcessor *)self _verifyConsistentMetadataWithFrame:v4];
    if (v5)
    {
      FigDebugAssert3();
    }
    else
    {
      int v6 = [(RawDFProcessor *)self _registerImages:0];
      if (v6)
      {
        int v9 = v6;
        FigDebugAssert3();
        int v5 = v9;
      }
    }
  }
  else
  {
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    int v5 = -73302;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v5;
}

- (int)_verifyConsistentMetadataWithFrame:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(RawDFCommon *)self->_rawDFCommon frames];
  unint64_t v6 = [v5 count];

  if (v6 < 2)
  {
    int v18 = 0;
  }
  else
  {
    id v22 = v4;
    BOOL v7 = [v4 properties];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v8 = [(RawDFCommon *)self->_rawDFCommon frames];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = [*(id *)(*((void *)&v23 + 1) + 8 * i) properties];
          uint64_t v14 = [v13 meta];
          int v15 = [v14 sensorID];
          int v16 = [v7 meta];
          int v17 = [v16 sensorID];

          if (v15 != v17)
          {
            FigDebugAssert3();
            id v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            uint64_t v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
            id v4 = v22;
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            int v18 = -73299;
            goto LABEL_12;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    int v18 = 0;
    id v4 = v22;
  }
LABEL_12:

  return v18;
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
  [(RawDFProcessor *)self resetState];
  [(RawDFProcessor *)self purgeResources];
  v3.receiver = self;
  v3.super_class = (Class)RawDFProcessor;
  [(RawDFProcessor *)&v3 dealloc];
}

- (NSString)description
{
  return (NSString *)@"RawDFProcessor";
}

- (RawDFProcessor)initWithCommandQueue:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)RawDFProcessor;
  int v5 = [(RawDFProcessor *)&v69 init];
  if (!v5)
  {
    unsigned int v66 = 0;
    goto LABEL_29;
  }
  BYTE5(v5->_lastWidth) = FigGetCFPreferenceNumberWithDefault() != 0;
  unint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v7 = [objc_alloc(MEMORY[0x263F2EE30]) initWithbundle:v6 andOptionalCommandQueue:v4];
  metal = v5->_metal;
  v5->_metal = (FigMetalContext *)v7;

  uint64_t v9 = v5->_metal;
  if (!v9) {
    goto LABEL_32;
  }
  uint64_t v10 = [(FigMetalContext *)v9 commandQueue];
  cameraInfoByPortType = v5->_cameraInfoByPortType;
  v5->_cameraInfoByPortType = (NSDictionary *)v10;

  v5->_allocatorSetupComplete = 0;
  v5->_useSyntheticReferenceForInferences = 1;
  v5->_useSoftISPProvidedDraftDemosaicBuffers = FigGetCFPreferenceNumberWithDefault() != 0;
  v5->_detectorsUseDraftDemosaic = 1;
  [(RawDFProcessor *)v5 resetState];
  v5->_saveInputFramesToDisk = 0;
  v5->_regwarpHasBeenSetup = 0;
  sharedMetalBuffer = v5->_sharedMetalBuffer;
  v5->_sharedMetalBuffer = 0;

  sharedRegWarpBuffer = v5->_sharedRegWarpBuffer;
  v5->_sharedRegWarpBuffer = 0;

  uint64_t v14 = objc_opt_new();
  nrfPlist = v5->_nrfPlist;
  v5->_nrfPlist = (NRFPlist *)v14;

  int v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  sidecar = v5->_sidecar;
  v5->_sidecar = v16;

  BYTE2(v5->_batchCount) = 0;
  v5->_compressionLevel = 2;
  [MEMORY[0x263F2EE70] getDefaults:&v5->_registrationPipelineRWPPConfig];
  v5->_registrationPipelineRWPPConfig.skipInitialDownsample = 1;
  int v18 = [[RawDFFrames alloc] initWithMetalContext:v5->_metal];
  rawDFCommon = v5->_rawDFCommon;
  v5->_rawDFCommon = (RawDFCommon *)v18;

  if (!v5->_rawDFCommon)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_33:
    unsigned int v66 = 0;
    goto LABEL_27;
  }
  LODWORD(v5->_inputFrames) = 0;
  v5->_int maximumNumberOfReferenceFrameCandidatesToHoldForProcessing = 1;
  id v20 = [[RawDFCommon alloc] initWithMetalContext:v5->_metal];
  demosaicStage = v5->_demosaicStage;
  v5->_demosaicStage = (CMIDemosaicStage *)v20;

  if (!v5->_demosaicStage) {
    goto LABEL_32;
  }
  id v22 = [[CMIDemosaicStage alloc] initWithMetalContext:v5->_metal demosaicerType:0];
  draftDemosaicStage = v5->_draftDemosaicStage;
  v5->_draftDemosaicStage = (CMIDraftDemosaicStage *)v22;

  if (!v5->_draftDemosaicStage) {
    goto LABEL_32;
  }
  long long v24 = [[CMIDraftDemosaicStage alloc] initWithMetalContext:v5->_metal];
  warpStage = v5->_warpStage;
  v5->_warpStage = (CMIWarpStage *)v24;

  if (!v5->_warpStage) {
    goto LABEL_32;
  }
  if (!BYTE5(v5->_lastWidth))
  {
    id v26 = objc_alloc(MEMORY[0x263F2EE00]);
    CMTime v27 = [(FigMetalContext *)v5->_metal commandQueue];
    uint64_t v28 = [(FigMetalContext *)v5->_metal allocator];
    uint64_t v29 = [v26 initWithOptionalCommandQueue:v27 allocator:v28];
    motionDetection = v5->_motionDetection;
    v5->_motionDetection = (MotionDetection *)v29;

    if (!v5->_motionDetection) {
      goto LABEL_32;
    }
  }
  uint64_t v31 = [[MotionDetection alloc] initWithMetalContext:v5->_metal];
  grayGhostDetection = v5->_grayGhostDetection;
  v5->_grayGhostDetection = (GrayGhostDetection *)v31;

  if (!v5->_grayGhostDetection) {
    goto LABEL_32;
  }
  v33 = [[GrayGhostDetection alloc] initWithMetalContext:v5->_metal];
  flickerDetection = v5->_flickerDetection;
  v5->_flickerDetection = (RawDFFlickerDetectorStage *)v33;

  if (!v5->_flickerDetection) {
    goto LABEL_32;
  }
  double v35 = [[RawDFFlickerDetectorStage alloc] initWithMetalContext:v5->_metal];
  gainMapStage = v5->_gainMapStage;
  v5->_gainMapStage = (GainMapStage *)v35;

  if (!v5->_gainMapStage) {
    goto LABEL_32;
  }
  v37 = [[GainMapStage alloc] initWithMetalContext:v5->_metal];
  rawDFPowerBlurStage = v5->_rawDFPowerBlurStage;
  v5->_rawDFPowerBlurStage = (RawDFPowerBlurStage *)v37;

  if (!v5->_rawDFPowerBlurStage) {
    goto LABEL_32;
  }
  v39 = [[RawDFPostDemosaicStage alloc] initWithMetalContext:v5->_metal];
  softLTMStage = v5->_softLTMStage;
  v5->_softLTMStage = (SoftLTM *)v39;

  if (!v5->_softLTMStage) {
    goto LABEL_32;
  }
  v41 = [[RawDFPowerBlurStage alloc] initWithMetalContext:v5->_metal];
  rawDFLumaSharpenStage = v5->_rawDFLumaSharpenStage;
  v5->_rawDFLumaSharpenStage = (RawDFLumaSharpenStage *)v41;

  if (!v5->_rawDFLumaSharpenStage) {
    goto LABEL_32;
  }
  v43 = [[RawDFLumaSharpenStage alloc] initWithMetalContext:v5->_metal];
  rawDFZoomStage = v5->_rawDFZoomStage;
  v5->_rawDFZoomStage = (RawDFZoomStage *)v43;

  if (!v5->_rawDFZoomStage) {
    goto LABEL_32;
  }
  v45 = [[RawDFZoomStage alloc] initWithMetalContext:v5->_metal];
  rawDFSyntheticReferenceStage = v5->_rawDFSyntheticReferenceStage;
  v5->_rawDFSyntheticReferenceStage = (RawDFSyntheticReferenceStage *)v45;

  if (!v5->_rawDFSyntheticReferenceStage) {
    goto LABEL_32;
  }
  v47 = [[RawDFSyntheticReferenceStage alloc] initWithMetalContext:v5->_metal];
  rawDFProxyStage = v5->_rawDFProxyStage;
  v5->_rawDFProxyStage = (RawDFProxyStage *)v47;

  if (!v5->_rawDFProxyStage) {
    goto LABEL_32;
  }
  v49 = [[RawDFProxyStage alloc] initWithMetalContext:v5->_metal];
  rawDFDownsampleStage = v5->_rawDFDownsampleStage;
  v5->_rawDFDownsampleStage = (RawDFDownsampleStage *)v49;

  if (!v5->_rawDFDownsampleStage) {
    goto LABEL_32;
  }
  int v51 = [[RawDFDownsampleStage alloc] initWithMetalContext:v5->_metal];
  rawDFColorMatchStage = v5->_rawDFColorMatchStage;
  v5->_rawDFColorMatchStage = (RawDFColorMatchStage *)v51;

  if (!v5->_rawDFColorMatchStage) {
    goto LABEL_32;
  }
  v53 = [[RawDFColorMatchStage alloc] initWithMetalContext:v5->_metal];
  rawDFInferenceGen = v5->_rawDFInferenceGen;
  v5->_rawDFInferenceGen = (RawDFInferenceGen *)v53;

  if (!v5->_rawDFInferenceGen) {
    goto LABEL_32;
  }
  unsigned int v55 = [[RawDFInferenceGen alloc] initWithMetalContext:v5->_metal];
  rawDFPostDemosaicStage = v5->_rawDFPostDemosaicStage;
  v5->_rawDFPostDemosaicStage = (RawDFPostDemosaicStage *)v55;

  if (!v5->_rawDFPostDemosaicStage
    || (v57 = [[CMIPost alloc] initWithMetalContext:v5->_metal],
        v58 = *(void **)&v5->_rawDFSoftLTMMode,
        *(void *)&v5->_rawDFSoftLTMMode = v57,
        v58,
        !*(void *)&v5->_rawDFSoftLTMMode))
  {
LABEL_32:
    v68 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_33;
  }
  uint64_t v59 = MEMORY[0x263EF89A0];
  long long v60 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  *(_OWORD *)&v5->_anon_6a0[4] = *MEMORY[0x263EF89A0];
  *(_OWORD *)&v5->_anon_6a0[20] = v60;
  *(_OWORD *)&v5->_anon_6a0[36] = *(_OWORD *)(v59 + 32);
  if (!BYTE5(v5->_lastWidth))
  {
    uint64_t v61 = [SoftLTM alloc];
    long long v62 = [(FigMetalContext *)v5->_metal commandQueue];
    uint64_t v63 = [(SoftLTM *)v61 initWithCommandQueue:v62];
    post = v5->_post;
    v5->_post = (CMIPost *)v63;

    v65 = v5->_post;
    if (v65)
    {
      LODWORD(v5->_lastWidth) = [(CMIPost *)v65 rawDFSoftLTMMode];
      goto LABEL_26;
    }
    goto LABEL_32;
  }
LABEL_26:
  v5->_referenceFrameIndex = 0;
  *(_OWORD *)&v5->_lastHeight = 0u;
  unsigned int v66 = v5;
LABEL_27:

LABEL_29:
  return v66;
}

- (int)prewarmWithTuningParameters:(id)a3
{
  objc_storeStrong((id *)&self->_metalCommandQueue, a3);

  return [(RawDFProcessor *)self prewarm];
}

- (int)prewarm
{
  if (!self->_cameraInfoByPortType)
  {
    int v33 = -73241;
LABEL_56:
    FigDebugAssert3();
    return v33;
  }
  metal = self->_metal;
  if (metal)
  {
    id v4 = [(FigMetalContext *)metal commandQueue];

    int v5 = self->_metal;
    if (!v4)
    {
      [(FigMetalContext *)self->_metal setCommandQueue:self->_cameraInfoByPortType];
      int v5 = self->_metal;
    }
    goto LABEL_6;
  }
  id v6 = objc_alloc(MEMORY[0x263F2EE30]);
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = (FigMetalContext *)[v6 initWithbundle:v7 andOptionalCommandQueue:self->_cameraInfoByPortType];
  uint64_t v9 = self->_metal;
  self->_metal = v8;

  int v5 = self->_metal;
  if (!v5)
  {
    int v33 = -73241;
    goto LABEL_56;
  }
LABEL_6:
  int v10 = +[TextureUtils prewarmShaders:v5];
  int v11 = +[MotionDetection prewarmShaders:self->_metal];
  if (v11) {
    int v10 = v11;
  }
  int v12 = +[GrayGhostDetection prewarmShaders:self->_metal];
  if (v12) {
    int v10 = v12;
  }
  int v13 = +[RegPyrFusion prewarmShaders:self->_metal];
  if (v13) {
    int v10 = v13;
  }
  int v14 = +[RegDense prewarmShaders:self->_metal];
  if (v14) {
    int v10 = v14;
  }
  int v15 = +[BilateralGrid prewarmShaders:self->_metal];
  if (v15) {
    int v10 = v15;
  }
  int v16 = +[PyramidStage prewarmShaders:self->_metal];
  if (v16) {
    int v10 = v16;
  }
  int v17 = +[DenoiseRemixStage prewarmShaders:self->_metal tuningParameters:self->_metalCommandQueue plistEntryName:@"NRFParameters"];
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
  if ([(RawDFProcessor *)self _isGainMapSupported])
  {
    int v20 = +[GainMapStage prewarmShaders:self->_metal];
    if (v20) {
      int v10 = v20;
    }
  }
  if ([(RawDFProcessor *)self _isSemanticStylesSupported])
  {
    int v21 = +[SemanticStylesStage prewarmShaders:self->_metal];
    if (v21) {
      int v10 = v21;
    }
  }
  int v22 = +[OutliersRemovalStage prewarmShaders:self->_metal];
  if (v22) {
    int v10 = v22;
  }
  int v23 = +[CMIDraftDemosaicStage prewarmShaders:self->_metal];
  if (v23) {
    int v10 = v23;
  }
  int v24 = +[DefringeStage prewarmShaders:self->_metal tuningParameters:self->_metalCommandQueue];
  if (v24) {
    int v10 = v24;
  }
  int v25 = +[RawDFPostDemosaicStage prewarmShaders:self->_metal];
  if (v25) {
    int v10 = v25;
  }
  int v26 = +[RawDFCommon prewarmShaders:self->_metal];
  if (v26) {
    int v10 = v26;
  }
  int v27 = +[RawDFLumaSharpenStage prewarmShaders:self->_metal];
  if (v27) {
    int v10 = v27;
  }
  int v28 = +[RawDFZoomStage prewarmShaders:self->_metal];
  if (v28) {
    int v10 = v28;
  }
  int v29 = +[RawDFSyntheticReferenceStage prewarmShaders:self->_metal];
  if (v29) {
    int v10 = v29;
  }
  int v30 = +[RawDFProxyStage prewarmShaders:self->_metal];
  if (v30) {
    int v10 = v30;
  }
  int v31 = +[RawDFDownsampleStage prewarmShaders:self->_metal];
  if (v31) {
    int v10 = v31;
  }
  int v32 = +[RawDFColorMatchStage prewarmShaders:self->_metal];
  if (v32) {
    return v32;
  }
  else {
    return v10;
  }
}

- (int)setupWithOptions:(id)a3 nrfConfig:(id)a4
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  p_nrfConfig = &self->_nrfConfig;
  objc_storeStrong((id *)&self->_nrfConfig, a4);
  long long v60 = v7;
  if (!self->_nrfConfig)
  {
    int v90 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v58 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v53 = -73288;
    goto LABEL_53;
  }
  uint64_t v8 = *MEMORY[0x263F2F1F8];
  uint64_t v9 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2F1F8]];
  if (!v9)
  {
    FigDebugAssert3();
    int v53 = FigSignalErrorAt();
LABEL_58:

    goto LABEL_53;
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
    int v53 = 0;
    goto LABEL_58;
  }
  int v16 = [(RawDFProcessor *)self prepareTuning:v9];
  if (v16)
  {
    int v53 = v16;
    FigDebugAssert3();
    goto LABEL_58;
  }
  [(RawDFProcessor *)self applyOverrides];

  if (!self->_allocatorBackend)
  {
    FigDebugAssert3();
    goto LABEL_62;
  }
  id v17 = objc_alloc(MEMORY[0x263F2EE10]);
  int v18 = [(FigMetalContext *)self->_metal device];
  int v19 = (void *)[v17 initWithDevice:v18 allocatorType:self->_nrfConfig->_allocatorType];
  [(FigMetalContext *)self->_metal setAllocator:v19];

  int v20 = [(FigMetalContext *)self->_metal allocator];

  if (!v20)
  {
    FigDebugAssert3();
LABEL_62:
    int v53 = FigSignalErrorAt();
    goto LABEL_53;
  }
  int v21 = [[LSCGainsPlist alloc] initWithDictionary:self->_allocatorBackend metal:self->_metal];
  lscGainsPlist = self->_lscGainsPlist;
  self->_lscGainsPlist = v21;

  if (!self->_lscGainsPlist)
  {
    FigDebugAssert3();
    int v53 = 0;
    goto LABEL_53;
  }
  int v23 = [[ColorConvertStage alloc] initWithMetalContext:self->_metal];
  colorConvertStage = self->_colorConvertStage;
  self->_colorConvertStage = v23;

  if (!self->_colorConvertStage) {
    goto LABEL_62;
  }
  uint64_t v59 = v8;
  id v61 = v6;
  id v70 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  obuint64_t j = self->_tuningParams;
  uint64_t v66 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v85 objects:v94 count:16];
  uint64_t v63 = self;
  if (v66)
  {
    id v64 = *(id *)v86;
    do
    {
      for (uint64_t i = 0; i != v66; ++i)
      {
        if (*(id *)v86 != v64) {
          objc_enumerationMutation(obj);
        }
        int v26 = [(NSMutableDictionary *)self->_tuningParams objectForKeyedSubscript:*(void *)(*((void *)&v85 + 1) + 8 * i)];
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v81 objects:v93 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v68 = i;
          id v29 = 0;
          uint64_t v30 = *(void *)v82;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              int v32 = v29;
              if (*(void *)v82 != v30) {
                objc_enumerationMutation(v26);
              }
              int v33 = [v26 objectForKeyedSubscript:*(void *)(*((void *)&v81 + 1) + 8 * j)];
              double v34 = [v33 objectForKeyedSubscript:@"Default"];

              id v29 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              [v29 setObject:v34[6] forKeyedSubscript:@"DefaultUBModeParameters"];
              if (*(unsigned char *)(v34[6] + 95)) {
                (*p_nrfConfig)->_BOOL enableSTF = 1;
              }
              uint64_t v35 = v34[23];
              if (v35 && *(unsigned char *)(v35 + 16)) {
                (*p_nrfConfig)->_enableMIWB = 1;
              }
              [v70 addObject:v29];
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v81 objects:v93 count:16];
          }
          while (v28);

          self = v63;
          uint64_t i = v68;
        }
      }
      uint64_t v66 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v85 objects:v94 count:16];
    }
    while (v66);
  }

  id v6 = v61;
  if (!(*p_nrfConfig)->_enableSTF) {
    goto LABEL_49;
  }
  v36 = [MEMORY[0x263EFF9A0] dictionary];
  if (!v36)
  {
    FigDebugAssert3();
    int v53 = FigSignalErrorAt();
LABEL_66:

    goto LABEL_53;
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v65 = v70;
  uint64_t v72 = [v65 countByEnumeratingWithState:&v77 objects:v92 count:16];
  if (v72)
  {
    uint64_t v37 = 0;
    uint64_t v67 = *(void *)v78;
    objc_super v69 = v36;
    do
    {
      for (uint64_t k = 0; k != v72; ++k)
      {
        if (*(void *)v78 != v67) {
          objc_enumerationMutation(v65);
        }
        v39 = *(void **)(*((void *)&v77 + 1) + 8 * k);
        double v40 = [MEMORY[0x263EFF9A0] dictionary];
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v41 = v39;
        uint64_t v42 = [v41 countByEnumeratingWithState:&v73 objects:v91 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v74;
          do
          {
            for (uint64_t m = 0; m != v43; ++m)
            {
              if (*(void *)v74 != v44) {
                objc_enumerationMutation(v41);
              }
              uint64_t v46 = *(void *)(*((void *)&v73 + 1) + 8 * m);
              v47 = [v41 objectForKeyedSubscript:v46];
              uint64_t v48 = v47[15];
              if (v48) {
                [v40 setObject:v48 forKey:v46];
              }
            }
            uint64_t v43 = [v41 countByEnumeratingWithState:&v73 objects:v91 count:16];
          }
          while (v43);
        }

        v49 = [NSNumber numberWithInt:v37];
        v36 = v69;
        [v69 setObject:v40 forKey:v49];

        uint64_t v37 = (v37 + 1);
      }
      uint64_t v72 = [v65 countByEnumeratingWithState:&v77 objects:v92 count:16];
    }
    while (v72);
  }

  self = v63;
  int v50 = [*(id *)&v63->_rawDFSoftLTMMode setupSTFProcessor:v36];
  if (v50)
  {
    int v53 = v50;
    id v6 = v61;
    goto LABEL_66;
  }

  id v6 = v61;
LABEL_49:

  self->_regWarpApplyGDC = 1;
  [(CMIDraftDemosaicStage *)self->_draftDemosaicStage setCameraInfoByPortType:self->_allocatorBackend];
  if (self->_nrfConfig->_enableMIWB
    && (int v51 = *(void **)&self->_rawDFSoftLTMMode,
        [v6 objectForKeyedSubscript:v59],
        int v52 = objc_claimAutoreleasedReturnValue(),
        int v53 = [v51 setupMIWB:v52],
        v52,
        v53))
  {
    FigDebugAssert3();
  }
  else
  {
    post = self->_post;
    unsigned int v55 = [v6 objectForKeyedSubscript:v59];
    int v56 = [(CMIPost *)post setupIBPTuningParameters:v55 with:0];

    int v53 = 0;
    if (v56)
    {
      FigDebugAssert3();
      int v53 = v56;
    }
  }
LABEL_53:

  return v53;
}

- (unint64_t)calculateBackingBufferSizeForDesc:(id)a3 nrfConfig:(id)a4 metal:(id)a5
{
  id v7 = a3;
  unsigned int compressionLevel = self->_compressionLevel;
  uint64_t v9 = a4;
  float CompressionRatio = getCompressionRatio(compressionLevel);
  int v11 = v9[5];

  if (v11 == 1 && (self->_compressionLevel & 0x80000000) == 0)
  {
    int v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_10;
  }
  int v12 = [v7 cmiResourceEnabled];
  float v13 = (float)(int)[v7 width];
  int v14 = [v7 height];
  double v15 = 405.0;
  if (v12) {
    double v15 = 440.0;
  }
  double v16 = v15 * ((float)(v13 * (float)v14) / 12773376.0);
  if (!(unint64_t)v16)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_10:
    unint64_t v17 = 0;
    goto LABEL_7;
  }
  unint64_t v17 = (unint64_t)(float)(CompressionRatio * (float)((unint64_t)v16 << 20));
LABEL_7:

  return v17;
}

- (int)determineWorkingBufferRequirementsToProcess:(unsigned int)a3 prepareDescriptor:(id)a4 nrfConfig:(id)a5 denoiseFusePipelineSize:(unint64_t *)a6 rwppSize:(unint64_t *)a7 rwppInputWidth:(unint64_t *)a8 rwppInputHeight:(unint64_t *)a9
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v13 = a4;
  int v14 = a5;
  double v15 = v14;
  if (!v13 || !v14)
  {
    FigDebugAssert3();
LABEL_25:
    int v32 = FigSignalErrorAt();
    goto LABEL_21;
  }
  uint64_t v16 = [v13 width];
  uint64_t v17 = [v13 height];
  +[RawDFCommon getRegwarpResourceSetupDimensionsForInputWidth:v16 height:v17];
  if (v18) {
    BOOL v20 = v19 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (v20)
  {
    FigDebugAssert3();
    double v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
    goto LABEL_27;
  }
  v36 = a8;
  int v21 = (void *)MEMORY[0x263EF8AF8];
  if (v15[9] == 2)
  {
    uint64_t v35 = v15;
    long long v22 = *(_OWORD *)&self->_registrationPipelineRWPPConfig.nccPatchRadius;
    v38[0] = *(_OWORD *)&self->_registrationPipelineRWPPConfig.numThreads;
    v38[1] = v22;
    v38[2] = *(_OWORD *)&self->_registrationPipelineRWPPConfig.ransacMinMatchingScoreAccepted;
    unsigned int v23 = [MEMORY[0x263F2EE70] computeExternalMemoryBlockSize:v38 imageWidth:v18 imageHeight:v19 imageFormat:875704422];
    int v24 = v21;
    uint64_t v25 = *v21;
    +[RawDFCommon getRegwarpSurfaceDimensionsForInputWidth:v16 height:v17];
    if (v26 && v27)
    {
      unint64_t v28 = (v25 + v23 - 1) & -v25;
      unint64_t v29 = v26;
      unint64_t v30 = v27;
      double v15 = v35;
      goto LABEL_12;
    }
    FigDebugAssert3();
    double v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
    double v15 = v35;
LABEL_27:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v32 = -73294;
    goto LABEL_21;
  }
  int v24 = (void *)MEMORY[0x263EF8AF8];
  unint64_t v28 = 0;
  unint64_t v29 = 0;
  unint64_t v30 = 0;
LABEL_12:
  unint64_t v31 = [(RawDFProcessor *)self calculateBackingBufferSizeForDesc:v13 nrfConfig:v15 metal:self->_metal];
  if (!v31)
  {
    FigDebugAssert3();
    goto LABEL_25;
  }
  if (a6) {
    *a6 = (v31 + *v24 - 1) & -*v24;
  }
  if (a7) {
    *a7 = v28;
  }
  if (v36) {
    unint64_t *v36 = v29;
  }
  int v32 = 0;
  if (a9) {
    *a9 = v30;
  }
LABEL_21:

  return v32;
}

- (int)determineWorkingBufferRequirementsWithPrepareDescriptorByProcessingType:(id)a3 nrfConfig:(id)a4 memoryAllocationInfo:(id *)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v27 = a4;
  if (v27 && a5)
  {
    unsigned int v23 = a5;
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
          uint64_t v16 = *(void **)(*((void *)&v34 + 1) + 8 * v15);
          unint64_t v32 = 0;
          unint64_t v33 = 0;
          unint64_t v30 = 0;
          unint64_t v31 = 0;
          uint64_t v17 = [v16 intValue];
          unsigned __int16 v18 = [obj objectForKeyedSubscript:v16];
          int v19 = [(RawDFProcessor *)self determineWorkingBufferRequirementsToProcess:v17 prepareDescriptor:v18 nrfConfig:v27 denoiseFusePipelineSize:&v33 rwppSize:&v32 rwppInputWidth:&v31 rwppInputHeight:&v30];
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
  id v5 = a4;
  unint64_t lastHeight = self->_lastHeight;
  if (lastHeight == (int)[v5 width]
    && (uint64_t v7 = *(void *)&self->_lastPixelFormat, v7 == (int)[v5 width]))
  {
    int referenceFrameIndex = self->_referenceFrameIndex;
    BOOL v9 = referenceFrameIndex != [v5 pixelFormat];
  }
  else
  {
    BOOL v9 = 1;
  }
  self->_unint64_t lastHeight = (int)[v5 width];
  *(void *)&self->_lastPixelFormat = (int)[v5 width];
  self->_int referenceFrameIndex = [v5 pixelFormat];
  +[RawDFCommon getRegwarpResourceSetupDimensionsForInputWidth:height:](RawDFCommon, "getRegwarpResourceSetupDimensionsForInputWidth:height:", [v5 width], objc_msgSend(v5, "height"));
  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    FigDebugAssert3();
    unsigned __int16 v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v13 = -73296;
  }
  else if (v9 || !self->_regwarpHasBeenSetup)
  {
    uint64_t v14 = v10;
    uint64_t v15 = v11;
    [(RegWarpPP *)self->_registrationPipelineRWPP releaseResources];
    registrationPipelineRWPP = self->_registrationPipelineRWPP;
    self->_registrationPipelineRWPP = 0;

    int v13 = -[RawDFProcessor _allocateRegWarpPPWithWidth:height:pixelFormat:](self, "_allocateRegWarpPPWithWidth:height:pixelFormat:", v14, v15, [v5 pixelFormat]);
    if (v13)
    {
      FigDebugAssert3();
      FigSignalErrorAt();
    }
    else
    {
      self->_regwarpHasBeenSetup = 1;
    }
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

- (int)prepareToProcess:(unsigned int)a3 prepareDescriptor:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (!-[RawDFProcessor supportsInputPixelFormat:](self, "supportsInputPixelFormat:", [v6 pixelFormat]))
  {
    int v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v13 = -73292;
    goto LABEL_11;
  }
  if (!self->_allocatorSetupComplete
    || (Class isa = self[1].super.isa,
        [(FigMetalContext *)self->_metal allocator],
        unint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v8 backendAllocator],
        Class v9 = (Class)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        isa != v9))
  {
    unsigned __int16 v10 = objc_opt_new();
    unsigned __int16 v11 = v10;
    if (v10)
    {
      [v10 setCompressionLevel:self->_compressionLevel];
      [v11 setLabel:@"FigMetalAllocator_RawDF"];
      [v11 setMemSize:[(objc_class *)self[1].super.isa memSize]];
      BOOL v12 = [(FigMetalContext *)self->_metal allocator];
      int v13 = [v12 setupWithDescriptor:v11 allocatorBackend:self[1].super.isa];

      if (!v13)
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
      int v13 = FigSignalErrorAt();
    }
LABEL_18:

    goto LABEL_11;
  }
LABEL_7:
  int defaultDoRedFaceFix = self->_nrfConfig->_defaultDoRedFaceFix;
  if ((defaultDoRedFaceFix & 0x80000000) == 0) {
    BYTE1(self->_batchCount) = defaultDoRedFaceFix != 0;
  }
  LODWORD(self->_output) = v4;
  int v15 = [(RawDFProcessor *)self bindResourcesForProcessingType:v4 prepareDescriptor:v6];
  if (v15)
  {
    int v13 = v15;
    unsigned __int16 v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
LABEL_17:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_18;
  }
  post = self->_post;
  uint64_t v17 = [(FigMetalContext *)self->_metal allocator];
  int v13 = [(CMIPost *)post prepareToProcess:v17];

  if (v13)
  {
    unsigned __int16 v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    goto LABEL_17;
  }
LABEL_11:

  return v13;
}

- (int)prepareToProcess:(unsigned int)a3
{
  return -73292;
}

- (void)setReferenceFrameIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  self->_unsigned int cntBracketSampleBuffers = v3;
  [(RawDFCommon *)self->_rawDFCommon setReferenceFrameIndex:v3];
  if ([(RawDFProcessor *)self _registerImages:0])
  {
    id v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (int)purgeResources
{
  [(RawDFProcessor *)self resetState];
  CVPixelBufferRelease(self->_regWarpInput);
  regWarpInputTex = self->_regWarpInputTex;
  *(_OWORD *)&self->_regWarpInput = 0u;

  if (self->_nrfConfig)
  {
    [(RegWarpPP *)self->_registrationPipelineRWPP releaseResources];
    self->_regwarpHasBeenSetup = 0;
  }
  uint64_t v4 = [(FigMetalContext *)self->_metal allocator];
  [v4 purgeResources];

  sharedMetalBuffer = self->_sharedMetalBuffer;
  self->_sharedMetalBuffer = 0;

  sharedRegWarpBuffer = self->_sharedRegWarpBuffer;
  self->_sharedRegWarpBuffer = 0;

  self->_allocatorSetupComplete = 0;
  return 0;
}

- (int)resetState
{
  self->_fusionMode = 0;
  [(CMIPost *)self->_post reset];
  [(FigMetalContext *)self->_metal waitForSchedule];
  [(RawDFProcessor *)self resetInternalState];
  self->_processedSIFRandRefEV0 = 0;
  *(_WORD *)&self->_processedSyntheticReference = 0;
  self->_outputGainMapHeadroouint64_t m = 0.0;
  self->_unsigned int cntBracketSampleBuffers = -1;
  self->_nRegisteredFrames = 0;
  BYTE2(self->_batchCount) = 0;
  LOWORD(self->_batchCount) = 1;
  objc_storeWeak((id *)&self->_semanticStyleProperties, 0);
  uint64_t v3 = [(FigMetalContext *)self->_metal allocator];
  [v3 reset];

  uint64_t v4 = [(FigMetalContext *)self->_metal allocator];
  [v4 purgeResources:0];

  [(FigMetalContext *)self->_metal setExecutionStatus:0];
  return 0;
}

- (int)resetInternalState
{
  [*(id *)&self->_rawDFSoftLTMMode reset];
  LODWORD(self->_inputFrames) = 0;
  lscGainsTex = self->_lscGainsTex;
  self->_lscGainsTex = 0;

  [(RawDFCommon *)self->_rawDFCommon releaseAll];
  self->_requestTuningParams = 1;
  uint64_t v4 = MEMORY[0x263EF89A0];
  long long v5 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  *(_OWORD *)&self->_anon_6a0[4] = *MEMORY[0x263EF89A0];
  *(_OWORD *)&self->_anon_6a0[20] = v5;
  *(_OWORD *)&self->_anon_6a0[36] = *(_OWORD *)(v4 + 32);
  bzero(&self->_fusionConf, 0x540uLL);
  self->_srlEnable = 1;
  id v6 = [(FigMetalContext *)self->_metal allocator];
  [v6 setForceDisableCompression:0];

  return 0;
}

- (void)addToSidecar:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(NSMutableDictionary *)self->_sidecar objectForKeyedSubscript:v6],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    unint64_t v8 = [(NSMutableDictionary *)self->_sidecar objectForKeyedSubscript:v6];
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
  [(MTLCommandQueue *)self->_metalCommandQueue objectForKeyedSubscript:@"DefaultSensorIDs"];
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
        uint64_t v7 = [v2 objectForKeyedSubscript:v6];
        unint64_t v8 = [(MTLCommandQueue *)self->_metalCommandQueue objectForKeyedSubscript:v6];
        id v9 = [v8 objectForKeyedSubscript:v7];
        unsigned __int16 v10 = [v9 objectForKeyedSubscript:@"NRFParameters"];
        unsigned __int16 v11 = [v10 objectForKeyedSubscript:@"NRFParameters"];
        BOOL v12 = [v11 objectForKeyedSubscript:@"GainMap"];

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
  [(MTLCommandQueue *)self->_metalCommandQueue objectForKeyedSubscript:@"DefaultSensorIDs"];
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
        uint64_t v7 = [v2 objectForKeyedSubscript:v6];
        unint64_t v8 = [(MTLCommandQueue *)self->_metalCommandQueue objectForKeyedSubscript:v6];
        id v9 = [v8 objectForKeyedSubscript:v7];
        unsigned __int16 v10 = [v9 objectForKeyedSubscript:@"NRFParameters"];
        unsigned __int16 v11 = [v10 objectForKeyedSubscript:@"NRFParameters"];
        BOOL v12 = [v11 objectForKeyedSubscript:@"SemanticStyles"];

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
    uint64_t v5 = *(int *)&self->_anon_1e0[980];
    uint64_t v6 = *(int *)&self->_anon_1e0[988];
    uint64_t v7 = [(RawDFCommon *)self->_rawDFCommon frames];
    unint64_t v8 = [v7 objectAtIndexedSubscript:v5];

    if (v8)
    {
      id v9 = [(RawDFCommon *)self->_rawDFCommon frames];
      unsigned __int16 v10 = [v9 objectAtIndexedSubscript:v6];

      if (v10)
      {
        unsigned __int16 v11 = [v8 properties];
        BOOL v12 = [v11 meta];
        uint64_t v13 = [v12 exposureParams];
        uint64_t v14 = [v10 properties];
        uint64_t v15 = [v14 meta];
        float RelativeBrightness = getRelativeBrightness(v13, [v15 exposureParams], 2);

        long long v17 = [v8 properties];
        long long v18 = [v17 meta];
        int v19 = *(_DWORD *)([v18 exposureParams] + 36);

        long long v20 = [v8 properties];
        int v21 = [v20 meta];
        int v22 = *(_DWORD *)([v21 exposureParams] + 24);

        [v4 setObject:*MEMORY[0x263F04038] forKeyedSubscript:*MEMORY[0x263F04020]];
        [v4 setObject:*MEMORY[0x263F03FE8] forKeyedSubscript:*MEMORY[0x263F03FC0]];
        if (self->_nrfPlist->toneMapping->enableSTF && (LODWORD(self->_output) - 1) <= 1)
        {
          unsigned int v23 = objc_msgSend(*(id *)&self->_rawDFSoftLTMMode, "getSTFLTM_asNSData");
          [v4 setObject:v23 forKeyedSubscript:*MEMORY[0x263F2F530]];
        }
        else
        {
          unsigned int v23 = [v8 properties];
          id v24 = [v23 meta];
          uint64_t v25 = getLTM_asNSData((unsigned __int16 *)[v24 ltmCurves]);
          [v4 setObject:v25 forKeyedSubscript:*MEMORY[0x263F2F530]];
        }
        unsigned __int16 v26 = [v10 properties];
        id v27 = [v26 meta];
        uint64_t v28 = getLUT_asNSData((unsigned __int16 *)([v27 ltmCurves] + 221232));
        [v4 setObject:v28 forKeyedSubscript:*MEMORY[0x263F2F4D8]];

        unint64_t v29 = [v10 properties];
        unint64_t v30 = [v29 meta];
        unint64_t v31 = getLUT_asNSData((unsigned __int16 *)([v30 ltmCurves] + 221748));
        [v4 setObject:v31 forKeyedSubscript:*MEMORY[0x263F2F4E8]];

        LODWORD(v32) = v19;
        unint64_t v33 = [NSNumber numberWithFloat:v32];
        [v4 setObject:v33 forKeyedSubscript:*MEMORY[0x263F2F0F8]];

        *(float *)&double v34 = RelativeBrightness;
        long long v35 = [NSNumber numberWithFloat:v34];
        [v4 setObject:v35 forKeyedSubscript:*MEMORY[0x263F2F0F0]];

        LODWORD(v36) = v22;
        long long v37 = [NSNumber numberWithFloat:v36];
        [v4 setObject:v37 forKeyedSubscript:*MEMORY[0x263F2F0D8]];

        v38 = [v8 properties];
        uint64_t v39 = [v38 meta];
        double v40 = +[ToneMappingStage getHighlightCompression_asNSArray:](ToneMappingStage, "getHighlightCompression_asNSArray:", [v39 ltmCurves]);
        [v4 setObject:v40 forKeyedSubscript:*MEMORY[0x263F2F080]];
      }
      else
      {
        id v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else
    {
      unsigned __int16 v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (void)_prepareOutputMetadata:(int)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (dword_26B430EE8)
  {
    uint64_t v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  unsigned int output = self->_output;
  uint64_t v7 = objc_msgSend(*(id *)&self->_rawDFSoftLTMMode, "getSRLStatus", v40, v41);
  unint64_t v8 = [(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferenceMetadata];

  if (v8)
  {
    int v9 = output << 12;
    if (output > 0xF) {
      int v9 = 61440;
    }
    if (a3 >= 255) {
      int v10 = 255;
    }
    else {
      int v10 = a3;
    }
    unsigned __int16 v11 = [NSNumber numberWithUnsignedInt:v9 | v10];
    BOOL v12 = [(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferenceMetadata];
    [v12 setObject:v11 forKeyedSubscript:*MEMORY[0x263F2F130]];

    uint64_t v13 = NSNumber;
    uint64_t v14 = [(RawDFCommon *)self->_rawDFCommon frames];
    uint64_t v15 = objc_msgSend(v13, "numberWithInt:", objc_msgSend(v14, "count"));
    uint64_t v16 = [(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferenceMetadata];
    [v16 setObject:v15 forKeyedSubscript:*MEMORY[0x263F2F118]];

    long long v17 = [NSNumber numberWithInt:self->_nRegisteredFrames];
    long long v18 = [(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferenceMetadata];
    [v18 setObject:v17 forKeyedSubscript:*MEMORY[0x263F2F120]];

    int v19 = [NSNumber numberWithUnsignedInt:v7];
    long long v20 = [(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferenceMetadata];
    [v20 setObject:v19 forKeyedSubscript:*MEMORY[0x263F2F128]];

    *(float *)&double v21 = self->_outputGainMapHeadroom;
    int v22 = [NSNumber numberWithFloat:v21];
    unsigned int v23 = [(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferenceMetadata];
    [v23 setObject:v22 forKeyedSubscript:*MEMORY[0x263F2F068]];

    id v24 = [NSNumber numberWithUnsignedInt:self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing];
    uint64_t v25 = [(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferenceMetadata];
    [v25 setObject:v24 forKeyedSubscript:@"DeepFusionProcessingMode"];

    if (self->_nrfPlist->outputNoiseModel)
    {
      unsigned __int16 v26 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
      id v27 = [v26 properties];
      uint64_t v28 = [v27 meta];
      unint64_t v29 = +[OutputNoiseModel generateNoiseModelFromReferenceFrameMetadata:v28 nFusedFrames:1 tuningPlist:self->_nrfPlist->outputNoiseModel];

      if (v29)
      {
        unint64_t v30 = [(NRFDeepFusionOutput *)self->_deepFusionOutput proxyMetadata];
        [v30 setObject:v29 forKeyedSubscript:*MEMORY[0x263F2F138]];
      }
    }
  }
  unint64_t v31 = [(NRFDeepFusionOutput *)self->_deepFusionOutput gainMapOutputMetadata];
  if (v31)
  {
    BOOL isMeteorPlusPlusEnabled = self->_nrfConfig->_isMeteorPlusPlusEnabled;

    if (isMeteorPlusPlusEnabled)
    {
      unint64_t v33 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];

      if (v33)
      {
        rawDFPowerBlurStage = self->_rawDFPowerBlurStage;
        long long v35 = [(NRFDeepFusionOutput *)self->_deepFusionOutput gainMapOutputMetadata];
        double v36 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
        long long v37 = [v36 properties];
        v38 = [v37 meta];
        uint64_t v39 = [v38 faces];
        -[RawDFPowerBlurStage prepareGainMapMetadata:hasFaces:](rawDFPowerBlurStage, "prepareGainMapMetadata:hasFaces:", v35, [v39 count] != 0);
      }
      else
      {
        FigDebugAssert3();
      }
    }
  }
}

- (int)_multiFrameProcessing:(BOOL)a3
{
  id v4 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];

  if (!v4) {
    goto LABEL_15;
  }
  uint64_t v5 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
  if (!v5)
  {
    if (!LOBYTE(self->_batchCount)) {
      goto LABEL_5;
    }
LABEL_15:
    int v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    int v8 = -73307;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return v8;
  }

LABEL_5:
  if (LOBYTE(self->_batchCount))
  {
    int v6 = [(RawDFProcessor *)self _registerImages:1];
    if (v6)
    {
      int v8 = v6;
      goto LABEL_14;
    }
  }
  int v7 = [(RawDFProcessor *)self _processSIFRandRefEV0IfPossible:1];
  if (v7)
  {
    int v8 = v7;
LABEL_14:
    FigDebugAssert3();
    return v8;
  }
  int v8 = [(RawDFProcessor *)self _setupFusionConfig];
  if (v8) {
    goto LABEL_14;
  }
  return v8;
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
        int v9 = (RegWarpPP *)[objc_alloc(MEMORY[0x263F2EE70]) initWithConfig:&self->_registrationPipelineRWPPConfig];
        registrationPipelineRWPP = self->_registrationPipelineRWPP;
        self->_registrationPipelineRWPP = v9;

        if (!self->_registrationPipelineRWPP)
        {
          uint64_t v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();

          return -73310;
        }
        sharedRegWarpBuffer = self->_sharedRegWarpBuffer;
      }
      uint64_t v11 = [(FigWiredMemory *)sharedRegWarpBuffer bytes];
      [(RegWarpPP *)self->_registrationPipelineRWPP setApplyGDC:self->_regWarpApplyGDC];
      int v12 = [(RegWarpPP *)self->_registrationPipelineRWPP allocateResources:a3 imageHeight:a4 imageFormat:875704422 externalMemory:v11 externalMemorySize:[(FigWiredMemory *)self->_sharedRegWarpBuffer length]];
      if (v12)
      {
        uint64_t v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else
    {
      FigDebugAssert3();
      return -3;
    }
  }
  else
  {
    FigDebugAssert3();
    return -1;
  }
  return v12;
}

- (int)_processInferenceImage:(__CVBuffer *)a3 sourceFrameLumaChromaImage:(id)a4 sourceFrameProperties:(id)a5 ltcFrameProperties:(id)a6 gtcFrameProperties:(id)a7 originalWidth:(unint64_t)a8 originalHeight:(unint64_t)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  int v19 = v18;
  if (!a3)
  {
    id v25 = v16;
    id v26 = v15;
    id v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
LABEL_18:
    int v23 = -73303;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    id v15 = v26;
    id v16 = v25;
    goto LABEL_14;
  }
  if (!v15)
  {
    id v25 = v16;
    id v26 = 0;
    id v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    goto LABEL_18;
  }
  if (!v16)
  {
    id v25 = 0;
    id v26 = v15;
    id v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    goto LABEL_18;
  }
  if (v17 && v18 && a8 && a9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_semanticStyleProperties);
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      double v21 = [[LumaChromaImage alloc] initWithContext:self->_metal pixelBuffer:a3 lumaAlignmentFactor:1 chromaAlignmentFactor:1];
      if (v21)
      {
        int v22 = objc_opt_new();
        int v23 = [(RawDFPostDemosaicStage *)self->_rawDFPostDemosaicStage processInferenceImage:a3 inferenceMetadata:v22 sourceFrameLumaChromaImage:v15 sourceFrameProperties:v16 ltcFrameProperties:v17 gtcFrameProperties:v19 originalWidth:a8 originalHeight:a9 post:*(void *)&self->_rawDFSoftLTMMode];
        if (!v23) {
          [WeakRetained processor:self outputReadyWithFrameType:9 outputPixelBuffer:a3 outputMetadata:v22 error:0];
        }
      }
      else
      {
        FigDebugAssert3();
        int v22 = 0;
        int v23 = -12786;
      }
    }
    else
    {
      FigDebugAssert3();
      double v21 = 0;
      int v22 = 0;
      int v23 = -12784;
    }
  }
  else
  {
    uint64_t v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    int v23 = -73303;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_14:

  return v23;
}

- (int)_setupFusionConfig
{
  *(_DWORD *)&self->_anon_1e0[992] = -1;
  *(void *)&self->_anon_1e0[984] = -1;
  uint64_t v3 = [(RawDFCommon *)self->_rawDFCommon frames];
  id v4 = [v3 objectAtIndexedSubscript:0];

  uint64_t v59 = v4;
  uint64_t v5 = [v4 properties];
  int v6 = [v5 inputColorSpace];

  self->_anon_1e0[1000] = v6 == 0;
  self->_anon_1e0[1001] = v6 == 1;
  self->_anon_1e0[1002] = v6 == 2;
  self->_anon_1e0[1008] = 0;
  p_nonLinearScale = &self->_fusionConf.colorSpaceConversionParameters[4].transferFunctionInv.nonLinearScale;
  bzero(&self->_fusionConf.colorSpaceConversionParameters[4].transferFunctionInv.nonLinearScale, 0x410uLL);
  int v8 = [(RawDFCommon *)self->_rawDFCommon frames];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
LABEL_15:
    if ((*(_DWORD *)&self->_anon_1e0[988] & 0x80000000) != 0) {
      goto LABEL_33;
    }
    *(_DWORD *)&self->_anon_1e0[1004] = 0;
    *(_DWORD *)&self->_anon_1e0[996] = -1;
    uint64_t v46 = [(RawDFCommon *)self->_rawDFCommon frames];
    *(_DWORD *)&self->_anon_1e0[976] = [v46 count];

    if ((*(_DWORD *)&self->_anon_1e0[984] & 0x80000000) != 0)
    {
      if ((*(_DWORD *)&self->_anon_1e0[988] & 0x80000000) != 0)
      {
        *(_DWORD *)&self->_anon_1e0[980] = -1;
        goto LABEL_33;
      }
      char v50 = 0;
    }
    else
    {
      v47 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
      uint64_t v48 = [v47 properties];
      v49 = [v48 meta];
      char v50 = [v49 metadataHasLtmCurves];

      if ((*(_DWORD *)&self->_anon_1e0[988] & 0x80000000) != 0)
      {
        LOBYTE(v51) = 0;
        if ((v50 & 1) == 0) {
          goto LABEL_26;
        }
        goto LABEL_23;
      }
    }
    int v52 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
    int v53 = [v52 properties];
    v54 = [v53 meta];
    int v51 = [v54 metadataHasLtmCurves];

    if ((v50 & 1) == 0)
    {
      if (v51)
      {
        int v55 = *(_DWORD *)&self->_anon_1e0[988];
        LOBYTE(v51) = 1;
        goto LABEL_27;
      }
LABEL_26:
      int v55 = -1;
LABEL_27:
      int v56 = *(_DWORD *)&self->_anon_1e0[984];
      *(_DWORD *)&self->_anon_1e0[980] = v55;
      if ((v56 & 0x80000000) == 0) {
        goto LABEL_33;
      }
      goto LABEL_28;
    }
LABEL_23:
    int v55 = *(_DWORD *)&self->_anon_1e0[984];
    *(_DWORD *)&self->_anon_1e0[980] = v55;
LABEL_28:
    if (v55 & 0x80000000) == 0 && (v51)
    {
      int v57 = 0;
      goto LABEL_31;
    }
LABEL_33:
    FigDebugAssert3();
    int v57 = FigSignalErrorAt();
    goto LABEL_31;
  }
  unint64_t v10 = 0;
  p_fusionConf = &self->_fusionConf;
  while (1)
  {
    int v12 = [(RawDFCommon *)self->_rawDFCommon frames];
    uint64_t v13 = [v12 objectAtIndexedSubscript:v10];

    uint64_t v14 = [v13 properties];
    int v15 = [v14 inputColorSpace];

    if (v6 != v15) {
      break;
    }
    id v16 = [v13 properties];
    id v17 = (_OWORD *)[v16 colorSpaceConversionParameters];
    *(_OWORD *)p_nonLinearScale = *v17;
    long long v18 = v17[4];
    long long v20 = v17[1];
    long long v19 = v17[2];
    *((_OWORD *)p_nonLinearScale + 3) = v17[3];
    *((_OWORD *)p_nonLinearScale + 4) = v18;
    *((_OWORD *)p_nonLinearScale + 1) = v20;
    *((_OWORD *)p_nonLinearScale + 2) = v19;
    long long v21 = v17[8];
    long long v23 = v17[5];
    long long v22 = v17[6];
    *((_OWORD *)p_nonLinearScale + 7) = v17[7];
    *((_OWORD *)p_nonLinearScale + 8) = v21;
    *((_OWORD *)p_nonLinearScale + 5) = v23;
    *((_OWORD *)p_nonLinearScale + 6) = v22;
    long long v24 = v17[12];
    long long v26 = v17[9];
    long long v25 = v17[10];
    *((_OWORD *)p_nonLinearScale + 11) = v17[11];
    *((_OWORD *)p_nonLinearScale + 12) = v24;
    *((_OWORD *)p_nonLinearScale + 9) = v26;
    *((_OWORD *)p_nonLinearScale + 10) = v25;

    id v27 = [v13 properties];
    uint64_t v28 = [v27 meta];
    int v29 = [v28 isEVMFrame];

    unint64_t v30 = [v13 properties];
    unint64_t v31 = [v30 meta];
    int v32 = [v31 isLongFrame];

    if (v10 == self->_cntBracketSampleBuffers)
    {
      *(_DWORD *)&self->_anon_1e0[988] = v10;
    }
    else if (v29)
    {
      *(_DWORD *)&self->_anon_1e0[984] = v10;
    }
    else if (v32)
    {
      *(_DWORD *)&self->_anon_1e0[992] = v10;
    }
    unint64_t v33 = [v13 properties];
    if ([v33 hasValidRegistration])
    {
      double v34 = [v13 properties];
      long long v35 = (_OWORD *)[v34 regHomography];
      long long v37 = v35[1];
      long long v36 = v35[2];
      *(_OWORD *)&p_fusionConf->preWarpEnabled = *v35;
      *(_OWORD *)&p_fusionConf->colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias = v37;
      *(_OWORD *)&p_fusionConf->colorSpaceConversionParameters[0].transferFunctionInv.nonLinearScale = v36;
    }
    else
    {
      uint64_t v38 = MEMORY[0x263EF89A0];
      long long v39 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
      *(_OWORD *)&p_fusionConf->preWarpEnabled = *MEMORY[0x263EF89A0];
      *(_OWORD *)&p_fusionConf->colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearBias = v39;
      *(_OWORD *)&p_fusionConf->colorSpaceConversionParameters[0].transferFunctionInv.nonLinearScale = *(_OWORD *)(v38 + 32);
    }

    uint64_t v40 = [v59 properties];
    int v41 = [v40 inputColorSpace];
    uint64_t v42 = [v13 properties];
    int v43 = [v42 inputColorSpace];

    if (v41 != v43) {
      break;
    }

    ++v10;
    uint64_t v44 = [(RawDFCommon *)self->_rawDFCommon frames];
    unint64_t v45 = [v44 count];

    p_fusionConf = (FusionConfiguration *)((char *)p_fusionConf + 48);
    p_nonLinearScale += 52;
    if (v45 <= v10) {
      goto LABEL_15;
    }
  }
  FigDebugAssert3();
  int v57 = FigSignalErrorAt();

LABEL_31:
  return v57;
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
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v12;
  return result;
}

- (int)_registerImages:(BOOL)a3
{
  BOOL v138 = a3;
  v162[16] = *(double *)MEMORY[0x263EF8340];
  unsigned int v4 = [(RawDFCommon *)self->_rawDFCommon frames];
  [v4 count];

  int regMethod = self->_nrfConfig->_regMethod;
  BOOL v6 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
  int v7 = v6;
  if (regMethod != 2)
  {
    unint64_t v45 = [(RawDFCommon *)self->_rawDFCommon frames];
    uint64_t v46 = [v45 count];

    if (v46)
    {
      unint64_t v47 = 0;
      uint64_t v48 = (_OWORD *)MEMORY[0x263EF89A0];
      do
      {
        v49 = [(RawDFCommon *)self->_rawDFCommon frames];
        char v50 = [v49 objectAtIndexedSubscript:v47];

        int v51 = [v50 properties];
        char v52 = [v51 registrationComplete];

        if ((v52 & 1) == 0)
        {
          int v53 = [v50 properties];
          v54 = (_OWORD *)[v53 regHomography];
          long long v55 = v48[1];
          _OWORD *v54 = *v48;
          v54[1] = v55;
          v54[2] = v48[2];

          int v56 = [v50 properties];
          [v56 setRegistrationComplete:1];

          int v57 = [v50 properties];
          [v57 setHasValidRegistration:1];
        }
        ++v47;
        v58 = [(RawDFCommon *)self->_rawDFCommon frames];
        unint64_t v59 = [v58 count];
      }
      while (v59 > v47);
    }
LABEL_38:
    if (!v138) {
      goto LABEL_57;
    }
    v106 = [(RawDFCommon *)self->_rawDFCommon frames];
    uint64_t v107 = [v106 count];

    if (v107)
    {
      unint64_t v108 = 0;
      int v109 = 0;
      do
      {
        v110 = [(RawDFCommon *)self->_rawDFCommon frames];
        v111 = [v110 objectAtIndexedSubscript:v108];

        if ([v111 uniqueFrameId] != self->_cntBracketSampleBuffers)
        {
          v112 = [v111 properties];
          int v113 = [v112 hasValidRegistration];

          v109 += v113;
        }

        ++v108;
        v114 = [(RawDFCommon *)self->_rawDFCommon frames];
        unint64_t v115 = [v114 count];
      }
      while (v115 > v108);
      if (v109 >= 1)
      {
        v116 = [(RawDFCommon *)self->_rawDFCommon frames];
        uint64_t v117 = [v116 count];

        if (v117)
        {
          unint64_t v118 = 0;
          do
          {
            v119 = [(RawDFCommon *)self->_rawDFCommon frames];
            v120 = [v119 objectAtIndexedSubscript:v118];

            ++v118;
            v121 = [(RawDFCommon *)self->_rawDFCommon frames];
            unint64_t v122 = [v121 count];
          }
          while (v122 > v118);
        }
        goto LABEL_57;
      }
    }
    if (dword_26B430EE8)
    {
      int v154 = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v123 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v124 = v154;
      if (os_log_type_enabled(v123, type[0])) {
        unsigned int v125 = v124;
      }
      else {
        unsigned int v125 = v124 & 0xFFFFFFFE;
      }
      if (v125)
      {
        LODWORD(v152[0].f64[0]) = 136315138;
        *(void *)((char *)v152[0].f64 + 4) = "-[RawDFProcessor _registerImages:]";
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      goto LABEL_57;
    }
    int v37 = 0;
    goto LABEL_66;
  }
  if (!v6) {
    goto LABEL_38;
  }
  int v8 = [v6 properties];
  char v9 = [v8 registrationComplete];

  int v10 = (_DWORD *)MEMORY[0x263F00E10];
  if ((v9 & 1) == 0)
  {
    if (*MEMORY[0x263F00E10] == 1) {
      kdebug_trace();
    }
    int v11 = [v7 properties];
    double v12 = (_OWORD *)[v11 regHomography];
    uint64_t v13 = MEMORY[0x263EF89A0];
    long long v14 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
    *double v12 = *MEMORY[0x263EF89A0];
    v12[1] = v14;
    v12[2] = *(_OWORD *)(v13 + 32);

    double v15 = [v7 properties];
    [v15 setRegistrationComplete:1];

    double v16 = [v7 properties];
    [v16 setHasValidRegistration:1];

    id v17 = [v7 properties];
    long long v18 = [v17 meta];
    long long v19 = (double *)[v18 ROI];
    double v20 = *v19;
    double v21 = v19[1];
    double v22 = v19[2];
    double v23 = v19[3];

    *(_DWORD *)os_log_type_t type = 0;
    LODWORD(v17) = [v7 pixelBufferFormat];
    long long v24 = [v7 bayerPattern];
    long long v25 = [v7 metadata];
    uint64_t v26 = determineCFALayoutWithBayerPattern((int)v17, v24, v25);

    int v149 = 0;
    *(_DWORD *)v150 = 0;
    if ([v7 auxDraftDemosaicPixelBuffer])
    {
      memset(v152, 0, sizeof(v152));
      id v27 = [v7 properties];
      uint64_t v28 = [v27 meta];
      uint64_t v29 = [v28 ROI];
      float64x2_t v30 = *(float64x2_t *)(v29 + 16);
      v152[0] = *(float64x2_t *)v29;
      v152[1] = v30;

      unint64_t v31 = [v7 baseTex];
      __int16 v32 = [v31 width];
      unint64_t v33 = [v7 baseTex];
      LOWORD(v148) = v32;
      HIWORD(v148) = [v33 height];
      double v34 = [v7 auxDraftDemosaicLumaTexture];
      __int16 v35 = [v34 width];
      long long v36 = [v7 auxDraftDemosaicLumaTexture];
      LOWORD(v147) = v35;
      HIWORD(v147) = [v36 height];
      int v37 = scaleROI(v152[0].f64, v148, v147);

      if (v37)
      {
        FigDebugAssert3();
        v137 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        goto LABEL_58;
      }
      int32x2_t v38 = vmovn_s64(vcvtq_s64_f64(v152[0]));
      *(_WORD *)&v150[2] = v38.i16[2];
      *(_WORD *)v150 = v38.i16[0];
      int32x2_t v39 = vmovn_s64(vcvtq_s64_f64(v152[1]));
      HIWORD(v149) = v39.i16[2];
      LOWORD(v149) = v39.i16[0];
      regWarpInput = (__CVBuffer *)[v7 auxDraftDemosaicPixelBuffer];
    }
    else
    {
      HIWORD(v146) = (int)v21;
      LOWORD(v146) = (int)v20;
      HIWORD(v145) = (int)v23;
      LOWORD(v145) = (int)v22;
      long long v60 = [v7 properties];
      id v61 = [v60 meta];
      int v62 = *(_DWORD *)([v61 exposureParams] + 48);

      warpStage = self->_warpStage;
      id v64 = [v7 baseTex];
      LODWORD(v65) = v62;
      int v37 = [(CMIWarpStage *)warpStage runWithInputTex:v64 outputTex:self->_regWarpInputTex cfaLayout:v26 gain:v146 inputCropOrigin:v145 inputCropSize:v150 outputCropOrigin:v65 outputCropSize:&v149];

      if (v37)
      {
        FigDebugAssert3();
        goto LABEL_58;
      }
      [(FigMetalContext *)self->_metal waitForSchedule];
      regWarpInput = self->_regWarpInput;
    }
    LOWORD(v41) = *(_WORD *)v150;
    LOWORD(v42) = *(_WORD *)&v150[2];
    LOWORD(v44) = HIWORD(v149);
    LOWORD(v43) = v149;
    v162[0] = (double)v41;
    v162[1] = (double)v42;
    v162[2] = (double)v43;
    v162[3] = (double)v44;
    if (-[RegWarpPP processReference:gdcParams:regionOfInterest:numKeypoints:](self->_registrationPipelineRWPP, "processReference:gdcParams:regionOfInterest:numKeypoints:", regWarpInput, [v7 gdcParameters], v162, type))
    {
      FigDebugAssert3();
      int v37 = -17401;
      goto LABEL_58;
    }
    if (*v10 == 1) {
      kdebug_trace();
    }
  }
  uint64_t v66 = [(RawDFCommon *)self->_rawDFCommon frames];
  uint64_t v67 = [v66 count];

  if (!v67) {
    goto LABEL_38;
  }
  unint64_t v68 = 0;
  while (1)
  {
    objc_super v69 = [(RawDFCommon *)self->_rawDFCommon frames];
    id v70 = [v69 objectAtIndexedSubscript:v68];

    v71 = [v70 properties];
    char v72 = [v71 registrationComplete];

    if ((v72 & 1) == 0) {
      break;
    }
LABEL_37:

    ++v68;
    v104 = [(RawDFCommon *)self->_rawDFCommon frames];
    unint64_t v105 = [v104 count];

    if (v105 <= v68) {
      goto LABEL_38;
    }
  }
  if (*v10 == 1) {
    kdebug_trace();
  }
  long long v73 = [v70 properties];
  [v73 setRegistrationComplete:1];

  if ([v7 auxDraftDemosaicPixelBuffer])
  {
    long long v74 = (__CVBuffer *)[v70 auxDraftDemosaicPixelBuffer];
  }
  else
  {
    long long v75 = [v70 properties];
    long long v76 = [v75 meta];
    uint64_t v77 = [v76 ROI];
    int32x2_t v78 = vmovn_s64(vcvtq_s64_f64(*(float64x2_t *)v77));
    HIWORD(v143) = v78.i16[2];
    LOWORD(v143) = v78.i16[0];
    float64x2_t v139 = *(float64x2_t *)(v77 + 16);

    int32x2_t v79 = vmovn_s64(vcvtq_s64_f64(v139));
    HIWORD(v144) = v79.i16[2];
    LOWORD(v144) = v79.i16[0];
    LODWORD(v76) = [v70 pixelBufferFormat];
    long long v80 = [v70 bayerPattern];
    long long v81 = [v70 metadata];
    uint64_t v82 = determineCFALayoutWithBayerPattern((int)v76, v80, v81);

    long long v83 = [v70 properties];
    long long v84 = [v83 meta];
    int v85 = *(_DWORD *)([v84 exposureParams] + 48);

    long long v86 = self->_warpStage;
    long long v87 = [v70 baseTex];
    LODWORD(v88) = v85;
    int v37 = [(CMIWarpStage *)v86 runWithInputTex:v87 outputTex:self->_regWarpInputTex cfaLayout:v82 gain:v143 inputCropOrigin:v144 inputCropSize:0 outputCropOrigin:v88 outputCropSize:0];

    if (v37)
    {
      FigDebugAssert3();

      goto LABEL_58;
    }
    [(FigMetalContext *)self->_metal waitForSchedule];
    long long v74 = self->_regWarpInput;
  }
  v153[0] = 0;
  memset(v152, 0, sizeof(v152));
  if (-[RegWarpPP processNonReference:gdcParams:outputTransform:](self->_registrationPipelineRWPP, "processNonReference:gdcParams:outputTransform:", v74, [v70 gdcParameters], v152))
  {
    v89 = [v70 properties];
    [v89 setHasValidRegistration:0];
  }
  else
  {
    float64x2_t v140 = v152[0];
    int v90 = [v70 properties];
    *(float64x2_t *)[v90 regHomography] = v140;

    long long v141 = *(long long *)((char *)v152 + 12);
    int v91 = [v70 properties];
    *(_OWORD *)([v91 regHomography] + 16) = v141;

    *(float64_t *)&long long v92 = v152[1].f64[1];
    DWORD2(v92) = v153[0];
    long long v142 = v92;
    v93 = [v70 properties];
    *(_OWORD *)([v93 regHomography] + 32) = v142;

    __int16 v94 = [(RawDFCommon *)self->_rawDFCommon frames];
    uint64_t v95 = [v94 objectAtIndexedSubscript:v68];
    v96 = [v95 properties];
    BOOL v97 = sanityCheckHomography((float32x4_t *)[v96 regHomography]);
    v98 = [v70 properties];
    [v98 setHasValidRegistration:v97];

    v99 = [v70 properties];
    LODWORD(v95) = [v99 hasValidRegistration];

    if (v95) {
      ++self->_nRegisteredFrames;
    }
  }
  v100 = [v70 properties];
  char v101 = [v100 hasValidRegistration];

  if ((v101 & 1) != 0
    || ([v70 releaseBaseTex],
        [v70 properties],
        v102 = objc_claimAutoreleasedReturnValue(),
        char v103 = [v102 hasValidRegistration],
        v102,
        (v103 & 1) != 0))
  {
    if (*v10 == 1) {
      kdebug_trace();
    }
    goto LABEL_37;
  }
  *(_DWORD *)os_log_type_t type = 0;
  v150[0] = OS_LOG_TYPE_DEFAULT;
  v131 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  unsigned int v132 = *(_DWORD *)type;
  if (os_log_type_enabled(v131, v150[0])) {
    unsigned int v133 = v132;
  }
  else {
    unsigned int v133 = v132 & 0xFFFFFFFE;
  }
  if (v133)
  {
    v134 = [v70 properties];
    v135 = [v134 meta];
    int v136 = [v135 isEVMFrame];
    int v154 = 136315906;
    v155 = "-[RawDFProcessor _registerImages:]";
    __int16 v156 = 1024;
    int v157 = v68;
    __int16 v158 = 1024;
    int v159 = 0;
    __int16 v160 = 1024;
    int v161 = v136;
    _os_log_send_and_compose_impl();
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_57:
  int v37 = 0;
LABEL_58:
  if (dword_26B430EE8)
  {
    int v154 = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v126 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    int v127 = v154;
    if (!os_log_type_enabled(v126, type[0])) {
      v127 &= ~1u;
    }
    if (v127)
    {
      v128 = [(RawDFProcessor *)self description];
      v129 = "failed";
      LODWORD(v152[0].f64[0]) = 136315907;
      *(void *)((char *)v152[0].f64 + 4) = "-[RawDFProcessor _registerImages:]";
      WORD2(v152[0].f64[1]) = 2113;
      *(void *)((char *)&v152[0].f64[1] + 6) = v128;
      if (!v37) {
        v129 = "succeeded";
      }
      HIWORD(v152[1].f64[0]) = 2081;
      *(void *)&v152[1].f64[1] = v129;
      LOWORD(v153[0]) = 1026;
      *(_DWORD *)((char *)v153 + 2) = v37 == 0;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_66:

  return v37;
}

- (int)_processSIFRandRefEV0IfPossible:(int)a3
{
  if (self->_processedSyntheticReference) {
    return 0;
  }
  int batchCount_low = LOBYTE(self->_batchCount);
  if (a3 != 1)
  {
    if (LOBYTE(self->_batchCount))
    {
      BOOL v6 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
      BOOL v7 = v6 == 0;
    }
    else
    {
      BOOL v7 = 0;
    }
    int v8 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];

    if (!v8 || v7) {
      return 0;
    }
  }
  if (batchCount_low)
  {
    char v9 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
    int v10 = [v9 properties];
    char v11 = [v10 registrationComplete];

    if ((v11 & 1) == 0) {
      goto LABEL_16;
    }
  }
  double v12 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
  uint64_t v13 = [v12 properties];
  char v14 = [v13 registrationComplete];

  if ((v14 & 1) == 0 || [(RawDFProcessor *)self _setupFusionConfig])
  {
LABEL_16:
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  else
  {
    return [(RawDFProcessor *)self _doDeepFusionSytheticRefererenceAndProxy];
  }
}

- (int)_populateDeepFusionMetadata:(id)a3 hasEVM:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4
    && [(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferencePixelBuffer])
  {
    BOOL v7 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
    int v8 = [v7 metadata];

    if (v8) {
      [v6 setObject:v8 forKeyedSubscript:@"SifrMetadata"];
    }
  }
  char v9 = [NSNumber numberWithBool:v4];
  [v6 setObject:v9 forKeyedSubscript:@"HasEVM"];

  return 0;
}

- (int)_generateSyntheticRefererence:(id *)a3 outputNoiseDivisor:(id)a4 withDetectorsOutput:(id *)a5
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v95 = a4;
  if (!a3
    || *a3
    || ([(RawDFCommon *)self->_rawDFCommon sifrFrame],
        int v8 = objc_claimAutoreleasedReturnValue(),
        [v8 properties],
        char v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 hasValidRegistration],
        v9,
        v8,
        (v10 & 1) == 0))
  {
    int v102 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    long long v75 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT);
    long long v73 = v95;
    int v56 = -73308;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    unint64_t v59 = 0;
    v96 = 0;
    double v16 = 0;
LABEL_58:
    char v14 = 0;
    goto LABEL_59;
  }
  int var0 = a5->var0;
  if (dword_26B430EE8)
  {
    int v102 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    double v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v13 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
  char v14 = [v13 pyramid];

  double v15 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
  double v16 = [v15 pyramid];

  if (!v14)
  {
    int v102 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    long long v76 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT);
    long long v73 = v95;
    int v56 = -73308;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    unint64_t v59 = 0;
    v96 = 0;
    goto LABEL_58;
  }
  if (!v16)
  {
    int v102 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v77 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT);
    long long v73 = v95;
    int v56 = -73308;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    unint64_t v59 = 0;
    v96 = 0;
    double v16 = 0;
LABEL_59:
    double v65 = 0;
    goto LABEL_48;
  }
  location = a3;
  id v17 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
  long long v18 = [v17 rgbTex];
  uint64_t v19 = [v18 width];

  double v20 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
  double v21 = [v20 rgbTex];
  uint64_t v22 = [v21 height];

  double v23 = objc_opt_new();
  [v23 setWidth:v19];
  [v23 setHeight:v22];
  [v23 setType:0];
  unsigned int v99 = var0;
  v96 = v23;
  if (var0)
  {
    [v23 setLevelCount:4];
    int v24 = [v14 configureWithDescriptor:v23];
    if (v24) {
      goto LABEL_49;
    }
    int v24 = [v16 configureWithDescriptor:v23];
    if (v24) {
      goto LABEL_49;
    }
    long long v25 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
    uint64_t v26 = [v25 rgbTex];
    id v27 = v16;
  }
  else
  {
    [v23 setLevelCount:2];
    int v24 = [v14 configureWithDescriptor:v23];
    if (v24) {
      goto LABEL_49;
    }
    [v23 setLevelCount:1];
    int v24 = [v16 configureWithDescriptor:v23];
    if (v24) {
      goto LABEL_49;
    }
    long long v25 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
    uint64_t v26 = [v25 rgbTex];
    id v27 = v14;
  }
  [v27 setTexture:v26 atLevel:0];

  int v24 = [v14 allocateWithLabel:0];
  if (v24 || (int v24 = [v16 allocateWithLabel:0]) != 0)
  {
LABEL_49:
    int v56 = v24;
    unint64_t v59 = 0;
    double v65 = 0;
LABEL_51:
    long long v73 = v95;
    goto LABEL_48;
  }
  uint64_t v92 = v22;
  uint64_t v93 = v19;
  BOOL v97 = v16;
  v98 = v14;
  if (var0)
  {
    rawDFInferenceGen = self->_rawDFInferenceGen;
    uint64_t v29 = [v16 getTextureAtLevel:0];
    [(RawDFInferenceGen *)rawDFInferenceGen applyColorAdjustmentInplaceWithTexture:v29 withColorAdjustment:&a5[1]];

    float64x2_t v30 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
    unint64_t v31 = [v30 properties];
    __int16 v32 = (simd_float3x3 *)[v31 regHomography];
    unint64_t v33 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
    double v34 = [v33 properties];
    __int16 v35 = (float32x4_t *)[v34 regHomography];
    float32x4_t v86 = v35[1];
    float32x4_t v89 = *v35;
    float32x4_t v84 = v35[2];
    simd_float3x3 v108 = __invert_f3(*v32);
    uint64_t v36 = 0;
    v108.columns[0].i32[3] = 0;
    v108.columns[1].i32[3] = 0;
    v108.columns[2].i32[3] = 0;
    simd_float3x3 v106 = v108;
    long long v103 = 0u;
    long long v104 = 0u;
    *(_OWORD *)unint64_t v105 = 0u;
    do
    {
      *(long long *)((char *)&v103 + v36 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v89, COERCE_FLOAT(*(_OWORD *)&v106.columns[v36])), v86, *(float32x2_t *)v106.columns[v36].f32, 1), v84, (float32x4_t)v106.columns[v36], 2);
      ++v36;
    }
    while (v36 != 3);
    double v87 = *(double *)&v104;
    double v90 = *(double *)&v103;
    double v85 = v105[0];

    motionDetection = self->_motionDetection;
    int32x2_t v38 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
    int32x2_t v39 = [v38 rgbTex];
    uint64_t v40 = [v14 getTextureAtLevel:0];
    BOOL regWarpApplyGDC = self->_regWarpApplyGDC;
    if (self->_regWarpApplyGDC)
    {
      unint64_t v33 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
      uint64_t v42 = [v33 gdcParameters];
      if (self->_regWarpApplyGDC)
      {
        char v14 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
        uint64_t v43 = [v14 gdcParameters];
        char v44 = 0;
      }
      else
      {
        uint64_t v43 = 0;
        char v44 = 1;
      }
    }
    else
    {
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      char v44 = 1;
    }
    int v56 = -[MotionDetection runWarpUsingTransform:inputTex:outputTex:inputFrameGDCParams:outputFrameGDCParams:](motionDetection, "runWarpUsingTransform:inputTex:outputTex:inputFrameGDCParams:outputFrameGDCParams:", v39, v40, v42, v43, v90, v87, v85);
    if ((v44 & 1) == 0) {

    }
    if (regWarpApplyGDC) {
    char v14 = v98;
    }
    if (v56)
    {
      unint64_t v59 = 0;
      double v65 = 0;
      long long v73 = v95;
      double v16 = v97;
      goto LABEL_48;
    }
    int v57 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
  }
  else
  {
    unint64_t v45 = self->_motionDetection;
    uint64_t v46 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
    unint64_t v47 = [v46 properties];
    uint64_t v48 = (double *)[v47 regHomography];
    v49 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
    char v50 = [v49 rgbTex];
    int v51 = [v16 getTextureAtLevel:0];
    BOOL v52 = self->_regWarpApplyGDC;
    int v91 = v46;
    double v88 = v47;
    if (self->_regWarpApplyGDC)
    {
      long long v83 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
      uint64_t v53 = [v83 gdcParameters];
      if (self->_regWarpApplyGDC)
      {
        uint64_t v46 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
        uint64_t v54 = [v46 gdcParameters];
        char v55 = 0;
      }
      else
      {
        uint64_t v54 = 0;
        char v55 = 1;
      }
    }
    else
    {
      uint64_t v53 = 0;
      uint64_t v54 = 0;
      char v55 = 1;
    }
    int v56 = -[MotionDetection runWarpUsingTransform:inputTex:outputTex:inputFrameGDCParams:outputFrameGDCParams:](v45, "runWarpUsingTransform:inputTex:outputTex:inputFrameGDCParams:outputFrameGDCParams:", v50, v51, v53, v54, *v48, v48[2], v48[4]);
    if ((v55 & 1) == 0) {

    }
    if (v52) {
    if (v56)
    }
    {
      unint64_t v59 = 0;
      double v65 = 0;
      goto LABEL_61;
    }
    int v57 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
    char v14 = v98;
  }
  double v16 = v97;
  [v57 releaseRgbTex];

  v58 = [(FigMetalContext *)self->_metal allocator];
  unint64_t v59 = (void *)[v58 newTextureDescriptor];

  if (!v59)
  {
    int v102 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int32x2_t v78 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT);
    long long v73 = v95;
    int v56 = -73308;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    unint64_t v59 = 0;
    goto LABEL_59;
  }
  long long v60 = [v59 desc];
  [v60 setWidth:v93];

  id v61 = [v59 desc];
  [v61 setHeight:v92];

  int v62 = [v59 desc];
  [v62 setPixelFormat:115];

  uint64_t v63 = [v59 desc];
  [v63 setUsage:7];

  [v59 setLabel:0];
  id v64 = [(FigMetalContext *)self->_metal allocator];
  double v65 = (void *)[v64 newTextureWithDescriptor:v59];

  if (!v65)
  {
    int v102 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int32x2_t v79 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT);
    long long v73 = v95;
    int v56 = -73308;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_59;
  }
  objc_storeStrong(location, v65);
  int v66 = [v14 generate];
  if (v66 || (int v66 = [v97 generate]) != 0)
  {
    int v56 = v66;
    goto LABEL_51;
  }
  memset(v100, 0, sizeof(v100));
  uint64_t v67 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
  unint64_t v68 = [v67 properties];
  objc_super v69 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
  id v70 = [v69 properties];
  int v56 = +[RawDFSyntheticReferenceStage fillFrameProperties:v100 withEvmProperties:v68 withEv0Properties:v70];

  if (v56)
  {
LABEL_61:
    long long v73 = v95;
    double v16 = v97;
    char v14 = v98;
    goto LABEL_48;
  }
  rawDFProxyStage = self->_rawDFProxyStage;
  lscGainsTex = self->_lscGainsTex;
  syntheticReference = self->_nrfPlist->syntheticReference;
  long long v73 = v95;
  double v16 = v97;
  char v14 = v98;
  int v56 = [(RawDFProxyStage *)rawDFProxyStage genereteSyntheticReference:v65 noiseDivisorOutputTex:v95 mode:v99 lscGainsTex:lscGainsTex evmPyramid:v97 ev0Pyramid:v98 frameProperties:v100 tuning:syntheticReference];
LABEL_48:

  return v56;
}

- (int)getRawDFFrameTypeForInputFrame:(id)a3
{
  unsigned int v3 = [a3 properties];
  BOOL v4 = [v3 meta];
  int v5 = [v4 isEVMFrame];

  return v5;
}

- (int)_preprocessFrame:(id)a3
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v81 = 0;
  unsigned int v76 = [(RawDFProcessor *)self getRawDFFrameTypeForInputFrame:v4];
  if (-[RawDFPowerBlurTuningParams isEnabledForFrameType:](self->_nrfPlist->powerBlurTuning, "isEnabledForFrameType:")) {
    int v5 = isRawDFPowerBlurEnabled();
  }
  else {
    int v5 = 0;
  }
  BOOL v6 = [(RawDFLumaSharpenTuningParams *)self->_nrfPlist->lumaSharpenTuning isEnabled];
  BOOL v7 = [(FigMetalContext *)self->_metal allocator];
  int v8 = (void *)[v7 newTextureDescriptor];

  if (!v8)
  {
    unsigned int v80 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    id v64 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    char v44 = 0;
    uint64_t v42 = 0;
    long long v75 = 0;
    int v54 = -73305;
    goto LABEL_37;
  }
  char v9 = [v4 rgbTex];
  uint64_t v10 = [v9 pixelFormat];
  char v11 = [v8 desc];
  [v11 setPixelFormat:v10];

  double v12 = [v4 rgbTex];
  uint64_t v13 = [v12 width];
  char v14 = [v8 desc];
  [v14 setWidth:v13];

  double v15 = [v4 rgbTex];
  uint64_t v16 = [v15 height];
  id v17 = [v8 desc];
  [v17 setHeight:v16];

  long long v18 = [v8 desc];
  [v18 setUsage:7];

  [v8 setLabel:0];
  uint64_t v19 = [(FigMetalContext *)self->_metal allocator];
  double v20 = (void *)[v19 newTextureWithDescriptor:v8];
  id v81 = v20;

  if (!v20)
  {
    unsigned int v80 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    double v65 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    char v44 = 0;
    uint64_t v42 = 0;
    long long v75 = 0;
    int v54 = 0;
    goto LABEL_37;
  }
  unint64_t v68 = v20;
  double v21 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
  uint64_t v22 = [v21 properties];
  double v23 = [v22 meta];
  float v24 = 1.0;
  BOOL v72 = v6;
  long long v73 = v8;
  if ([v23 hasZoomRects])
  {
    id v70 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
    [v70 properties];
    long long v25 = v74 = v4;
    uint64_t v26 = [v25 meta];
    [v26 zoomDstRect];
    double v28 = v27;
    uint64_t v29 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
    [v29 properties];
    v31 = int v30 = v5;
    __int16 v32 = [v31 meta];
    [v32 zoomSrcRect];
    float v24 = v28 / v33;

    int v5 = v30;
    BOOL v6 = v72;

    id v4 = v74;
    int v8 = v73;
  }

  unsigned __int8 v78 = 0;
  unsigned __int8 v77 = 0;
  int v34 = [(RawDFSyntheticReferenceStage *)self->_rawDFSyntheticReferenceStage shouldProcessFrame:v4 shouldZoom:&v78 shouldMirror:&v77];
  if (v34)
  {
    int v54 = v34;
    FigDebugAssert3();
    char v44 = 0;
    uint64_t v42 = 0;
    long long v75 = 0;
    goto LABEL_37;
  }
  *(float *)&double v35 = v24;
  int v36 = [(SoftLTM *)self->_softLTMStage supportsInPlacePostDemosaicOperation:v76 zoom:v35];
  int v71 = v6 + v5 + (v36 ^ 1) + v77 + v78;
  if (dword_26B430EE8)
  {
    int v37 = v36;
    unsigned int v80 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int32x2_t v38 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v39 = v80;
    if (os_log_type_enabled(v38, type)) {
      unsigned int v40 = v39;
    }
    else {
      unsigned int v40 = v39 & 0xFFFFFFFE;
    }
    if (v40)
    {
      int v82 = 136317186;
      long long v83 = "-[RawDFProcessor _preprocessFrame:]";
      __int16 v84 = 1024;
      *(_DWORD *)double v85 = v76;
      *(_WORD *)&v85[4] = 1024;
      *(_DWORD *)&v85[6] = v5;
      __int16 v86 = 1024;
      BOOL v87 = v6;
      __int16 v88 = 1024;
      int v89 = v78;
      __int16 v90 = 1024;
      int v91 = v77;
      __int16 v92 = 1024;
      int v93 = v37;
      __int16 v94 = 2048;
      double v95 = v24;
      __int16 v96 = 1024;
      int v97 = v71;
      LODWORD(v67) = 64;
      int v66 = &v82;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int v41 = v5;
  long long v75 = +[RawDFCommon getLSCGainsWithFrame:lscGainsPlist:](RawDFCommon, "getLSCGainsWithFrame:lscGainsPlist:", v4, self->_lscGainsPlist, v66, v67);
  uint64_t v42 = [v4 rgbTex];
  id v43 = v68;
  char v44 = v43;
  if (v77)
  {
    int v45 = [(RawDFSyntheticReferenceStage *)self->_rawDFSyntheticReferenceStage processFrame:v4 inputTex:v42 outputTex:v43 doZoom:0];
    if (v45) {
      goto LABEL_38;
    }
    uint64_t v46 = v42;
    uint64_t v42 = v44;
  }
  else
  {
    uint64_t v46 = v43;
  }
  id v47 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v47 addObject:v42];
  [v47 addObject:v46];
  __int16 v48 = [v4 width];
  __int16 v49 = [v4 height];
  LODWORD(v50) = 0;
  WORD2(v50) = v48;
  HIWORD(v50) = v49;
  double v69 = v50;
  softLTMStage = self->_softLTMStage;
  BOOL v52 = [v4 metadata];
  *(float *)&double v53 = v24;
  int v54 = [(SoftLTM *)softLTMStage runPostDemosaicWithTextureArray:v47 inputROI:v52 inputMetadata:v76 zoomRatio:v69 outputROI:v53 frameType:v69];

  if (v54)
  {
    FigDebugAssert3();

    char v44 = v46;
    int v8 = v73;
    goto LABEL_37;
  }
  id v55 = v4;
  uint64_t v56 = [v47 objectAtIndexedSubscript:0];

  char v44 = [v47 objectAtIndexedSubscript:1];

  if (v41)
  {
    [(RawDFLumaSharpenStage *)self->_rawDFLumaSharpenStage setTuningParams:self->_nrfPlist->powerBlurTuning];
    int v57 = [(RawDFLumaSharpenStage *)self->_rawDFLumaSharpenStage runWithInputFrame:v55 frameType:v76 inputTex:v56 lscGainsTex:v75 outputTex:v44];
    int v8 = v73;
    if (v57)
    {
      int v54 = v57;
      uint64_t v42 = (void *)v56;
      id v4 = v55;
      goto LABEL_37;
    }
    v58 = (void *)v56;
    uint64_t v42 = v44;
  }
  else
  {
    v58 = v44;
    uint64_t v42 = (void *)v56;
    int v8 = v73;
  }
  id v4 = v55;
  if (v72)
  {
    [(RawDFZoomStage *)self->_rawDFZoomStage setTuningParams:self->_nrfPlist->lumaSharpenTuning];
    rawDFZoomStage = self->_rawDFZoomStage;
    long long v60 = [v4 properties];
    int v54 = [(RawDFZoomStage *)rawDFZoomStage runWithFrameProperties:v60 frameType:v76 inputTex:v42 outputTex:v58];

    if (v54)
    {
      char v44 = v58;
      goto LABEL_37;
    }
    char v44 = v42;
    uint64_t v42 = v58;
  }
  else
  {
    char v44 = v58;
  }
  if (v78)
  {
    int v45 = [(RawDFSyntheticReferenceStage *)self->_rawDFSyntheticReferenceStage processFrame:v4 inputTex:v42 outputTex:v44];
    if (!v45)
    {
      id v61 = v42;
      uint64_t v42 = v44;
      goto LABEL_33;
    }
LABEL_38:
    int v54 = v45;
    goto LABEL_37;
  }
  id v61 = v44;
LABEL_33:
  if (v71)
  {
    int v62 = [v4 rgbTex];

    if (v42 != v62) {
      [v4 checkAndSetRgbTex:v42];
    }
  }
  int v54 = 0;
  char v44 = v61;
LABEL_37:
  FigMetalDecRef();

  return v54;
}

- (int)_preprocessReferenceFrames:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];

  if (v5)
  {
    BOOL v6 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
    int v7 = [v6 allocateAndDemosaic:self->_draftDemosaicStage];

    if (v7) {
      goto LABEL_12;
    }
    int v8 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
    [v8 releaseBaseTex];
  }
  if (!v3) {
    goto LABEL_7;
  }
  char v9 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
  int v7 = [v9 allocateAndDemosaic:self->_draftDemosaicStage];

  if (v7)
  {
LABEL_12:
    FigDebugAssert3();
    return v7;
  }
  uint64_t v10 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
  [v10 releaseBaseTex];

LABEL_7:
  char v11 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
  double v12 = [v11 rgbTex];

  if (v12)
  {
    uint64_t v13 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
    int v7 = [(RawDFProcessor *)self _preprocessFrame:v13];

    if (!v7 && v3)
    {
      char v14 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
      int v15 = [(RawDFProcessor *)self _preprocessFrame:v14];

      return v15;
    }
  }
  else
  {
    id v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return -73304;
  }
  return v7;
}

- (void)setFusionMode:(int)a3
{
  self->_fusionMode = a3;
}

- (void)reportFusionReferenceFrame:(int)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_semanticStyleProperties);
  if (a3 == 1) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  int v7 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
  BOOL v8 = v7 != 0;

  char v9 = (int *)MEMORY[0x263F00E10];
  int v10 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    int v10 = *v9;
  }
  if (v10)
  {
    char v11 = [(FigMetalContext *)self->_metal commandQueue];
    double v12 = [v11 commandBuffer];

    [v12 setLabel:@"KTRACE_START_MTL"];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __45__RawDFProcessor_reportFusionReferenceFrame___block_invoke;
    v16[3] = &__block_descriptor_37_e28_v16__0___MTLCommandBuffer__8l;
    int v17 = v6;
    BOOL v18 = v8;
    [v12 addCompletedHandler:v16];
    [v12 commit];
  }
  [(NRFDeepFusionOutput *)self->_deepFusionOutput setFusionMode:v6];
  if (objc_opt_respondsToSelector()) {
    [WeakRetained processor:self didSelectFusionMode:v6];
  }
  if (*v9)
  {
    uint64_t v13 = [(FigMetalContext *)self->_metal commandQueue];
    char v14 = [v13 commandBuffer];

    [v14 setLabel:@"KTRACE_END_MTL"];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __45__RawDFProcessor_reportFusionReferenceFrame___block_invoke_2;
    v15[3] = &__block_descriptor_56_e28_v16__0___MTLCommandBuffer__8l;
    memset(&v15[4], 0, 24);
    [v14 addCompletedHandler:v15];
    [v14 commit];

    if (*v9 == 1) {
      kdebug_trace();
    }
  }
}

void __45__RawDFProcessor_reportFusionReferenceFrame___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 GPUEndTime];
  [v2 GPUStartTime];

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void __45__RawDFProcessor_reportFusionReferenceFrame___block_invoke_2(uint64_t a1, void *a2)
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

- (int)_doDeepFusionSytheticRefererenceAndProxy
{
  uint64_t v500 = *MEMORY[0x263EF8340];
  BOOL v3 = (int *)MEMORY[0x263F00E10];
  int v4 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    int v4 = *v3;
  }
  if (v4)
  {
    int v5 = [(FigMetalContext *)self->_metal commandQueue];
    uint64_t v6 = [v5 commandBuffer];

    [v6 setLabel:@"KTRACE_START_MTL"];
    [v6 addCompletedHandler:&__block_literal_global_5];
    [v6 commit];
  }
  id v479 = 0;
  id v480 = 0;
  id v477 = 0;
  id v478 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_semanticStyleProperties);
  uint64_t v476 = 0;
  memset(v475, 0, sizeof(v475));
  BOOL v8 = objc_opt_new();
  uint64_t v466 = objc_opt_new();
  if ([(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferencePixelBuffer]) {
    BOOL v457 = [(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferenceFusionMapPixelBuffer] != 0;
  }
  else {
    BOOL v457 = 0;
  }
  uint64_t v9 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
  if (!v9)
  {
    BOOL detectorsUseDraftDemosaic = 0;
    uint64_t v13 = 0;
    goto LABEL_19;
  }
  int v10 = (void *)v9;
  char v11 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
  double v12 = [v11 properties];
  uint64_t v13 = [v12 hasValidRegistration];

  if (!v13)
  {
    BOOL detectorsUseDraftDemosaic = 0;
    goto LABEL_19;
  }
  char v14 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
  uint64_t v15 = [v14 auxDraftDemosaicLumaTexture];
  if (!v15)
  {

    goto LABEL_16;
  }
  uint64_t v16 = (void *)v15;
  int v17 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
  BOOL v18 = [v17 auxDraftDemosaicLumaTexture];

  if (!v18)
  {
LABEL_16:
    BOOL detectorsUseDraftDemosaic = 0;
    goto LABEL_17;
  }
  BOOL detectorsUseDraftDemosaic = self->_detectorsUseDraftDemosaic;
LABEL_17:
  double v20 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
  double v21 = [v20 properties];
  char v22 = [v21 registrationComplete];

  if ((v22 & 1) == 0)
  {
    FigDebugAssert3();
    LODWORD(v481) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    uint64_t v46 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
LABEL_249:
    unsigned int v144 = (void *)v466;
    int v34 = -73309;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_389:

    id v81 = 0;
    unsigned int v80 = 0;
    goto LABEL_220;
  }
  double v23 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
  float v24 = [v23 properties];
  long long v25 = (_OWORD *)[v24 regHomography];
  long long v27 = v25[1];
  long long v26 = v25[2];
  *(_OWORD *)&self->_anon_6a0[4] = *v25;
  *(_OWORD *)&self->_anon_6a0[20] = v27;
  *(_OWORD *)&self->_anon_6a0[36] = v26;

  uint64_t v13 = 1;
LABEL_19:
  int fusionMode = self->_fusionMode;
  if (fusionMode == 2) {
    int v29 = 1;
  }
  else {
    int v29 = -1;
  }
  if (fusionMode == 1) {
    int v30 = 0;
  }
  else {
    int v30 = v29;
  }
  int v474 = v30;
  if (v30 == -1) {
    unint64_t v31 = 0;
  }
  else {
    unint64_t v31 = &v474;
  }
  unsigned int v464 = v13;
  if (detectorsUseDraftDemosaic && v13)
  {
    +[RawDFDetectors resetDetectorsOutput:v475];
    __int16 v32 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
    double v33 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
    int v34 = +[RawDFDetectors runDetectorsToOutput:v475 withRequestedSyntheticReferenceMode:v31 withEv0:v32 withEvm:v33 withSRTuning:self->_nrfPlist->syntheticReference withDownSampleStage:self->_rawDFColorMatchStage withColorMatchStage:self->_rawDFInferenceGen withMotionDetection:self->_grayGhostDetection withgrayGhostDetection:self->_flickerDetection withFlickerDetection:self->_gainMapStage];

    if (v34) {
      goto LABEL_77;
    }
    [(RawDFProcessor *)self reportFusionReferenceFrame:LODWORD(v475[0])];
    uint64_t v13 = v464;
  }
  if ((v13 & 1) == 0) {
    [(RawDFProcessor *)self reportFusionReferenceFrame:0];
  }
  int v35 = [(RawDFProcessor *)self _preprocessReferenceFrames:v13];
  if (v35)
  {
    int v34 = v35;
    FigDebugAssert3();
    goto LABEL_77;
  }
  if (((detectorsUseDraftDemosaic | v13 ^ 1) & 1) == 0)
  {
    +[RawDFDetectors resetDetectorsOutput:v475];
    int v36 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
    int v37 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
    int v34 = +[RawDFDetectors runDetectorsToOutput:v475 withRequestedSyntheticReferenceMode:v31 withEv0:v36 withEvm:v37 withSRTuning:self->_nrfPlist->syntheticReference withDownSampleStage:self->_rawDFColorMatchStage withColorMatchStage:self->_rawDFInferenceGen withMotionDetection:self->_grayGhostDetection withgrayGhostDetection:self->_flickerDetection withFlickerDetection:self->_gainMapStage];

    if (v34) {
      goto LABEL_77;
    }
    [(RawDFProcessor *)self reportFusionReferenceFrame:LODWORD(v475[0])];
    LODWORD(v13) = v464;
  }
  int32x2_t v38 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
  unsigned int v39 = +[RawDFCommon getLSCGainsWithFrame:v38 lscGainsPlist:self->_lscGainsPlist];
  lscGainsTex = self->_lscGainsTex;
  self->_lscGainsTex = v39;

  if (!self->_lscGainsTex)
  {
    LODWORD(v481) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    uint64_t v46 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v345 = v481;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v346 = v345;
    }
    else {
      unsigned int v346 = v345 & 0xFFFFFFFE;
    }
    if (!v346) {
      goto LABEL_249;
    }
    *(_DWORD *)v482 = 136315138;
    *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
LABEL_248:
    _os_log_send_and_compose_impl();
    goto LABEL_249;
  }
  int v41 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
  uint64_t v42 = [v41 rgbTex];

  if (!v42)
  {
    LODWORD(v481) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    uint64_t v46 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v347 = v481;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v348 = v347;
    }
    else {
      unsigned int v348 = v347 & 0xFFFFFFFE;
    }
    if (!v348) {
      goto LABEL_249;
    }
    *(_DWORD *)v482 = 136315138;
    *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
    goto LABEL_248;
  }
  if (LODWORD(self->_lastWidth)) {
    goto LABEL_45;
  }
  post = self->_post;
  char v44 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
  int v45 = [v44 metadata];
  LODWORD(post) = [(CMIPost *)post isHazeCorrectionEnabled:v45];

  if (!post)
  {
LABEL_45:
    if (!v13) {
      goto LABEL_73;
    }
    goto LABEL_46;
  }
  uint64_t v46 = [(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferenceMetadata];
  if (!v46)
  {
    v408 = v8;
    FigDebugAssert3();
    LODWORD(v481) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v409 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v410 = v481;
    if (os_log_type_enabled(v409, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v411 = v410;
    }
    else {
      unsigned int v411 = v410 & 0xFFFFFFFE;
    }
    if (!v411) {
      goto LABEL_348;
    }
    *(_DWORD *)v482 = 136315138;
    *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
    goto LABEL_333;
  }
  id v47 = self->_post;
  __int16 v48 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
  if (v464)
  {
    __int16 v49 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
  }
  else
  {
    __int16 v49 = 0;
  }
  double v85 = [(CMIPost *)v47 calculateLTMOnEV0Frame:v48 evmFrame:v49];
  [v46 setObject:v85 forKeyedSubscript:@"ltmMetadata"];

  if (v464) {
  __int16 v86 = [v46 objectForKeyedSubscript:@"ltmMetadata"];
  }

  if (!v86)
  {
    v408 = v8;
    LODWORD(v481) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v409 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v412 = v481;
    if (os_log_type_enabled(v409, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v413 = v412;
    }
    else {
      unsigned int v413 = v412 & 0xFFFFFFFE;
    }
    if (!v413) {
      goto LABEL_348;
    }
    *(_DWORD *)v482 = 136315138;
    *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
LABEL_333:
    _os_log_send_and_compose_impl();
LABEL_348:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    BOOL v8 = v408;
    goto LABEL_387;
  }

  if ((v464 & 1) == 0)
  {
LABEL_73:
    BOOL v87 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
    __int16 v88 = [v87 pyramid];

    int v89 = objc_opt_new();
    __int16 v90 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
    int v91 = [v90 rgbTex];

    objc_msgSend(v89, "setWidth:", objc_msgSend(v91, "width"));
    objc_msgSend(v89, "setHeight:", objc_msgSend(v91, "height"));
    [v89 setType:0];
    [v89 setLevelCount:2];
    int v92 = [v88 configureWithDescriptor:v89];
    if (v92
      || (int v92 = [v88 setTexture:v91 atLevel:0]) != 0
      || (int v92 = [v88 allocateWithLabel:0]) != 0)
    {
      int v34 = v92;

      goto LABEL_77;
    }
    int v34 = [v88 generate];

    if (v34)
    {
LABEL_77:
      id v81 = 0;
      unsigned int v80 = 0;
LABEL_112:
      unsigned int v144 = (void *)v466;
      goto LABEL_220;
    }
    unsigned int v80 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
    id v81 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
    long long v83 = WeakRetained;
    if ((LODWORD(self->_lastWidth) - 1) >= 3)
    {
      unsigned int v460 = 0;
      BOOL v453 = 1;
      goto LABEL_91;
    }
    id v84 = [v80 rgbTex];

    unsigned int v460 = 0;
    BOOL v453 = 1;
LABEL_80:
    int v93 = v80;
    if (v84)
    {
      __int16 v94 = self->_post;
      double v95 = [v81 metadata];
      __int16 v96 = [(CMIPost *)v94 computeLTM:v84 metadata:v95 applyCCM:1];

      if (v96)
      {
        int v97 = [(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferenceMetadata];
        if (v97)
        {
          id v455 = v97;
          v444 = v8;
          uint64_t v98 = self->_post;
          v451 = v83;
          v462 = v81;
          id v440 = v84;
          if ((LODWORD(self->_lastWidth) - 1) > 1)
          {
            int v113 = (void *)[(CMIPost *)v98 copyLTM_HLG_Metadata:v96];
            [v455 setObject:v113 forKeyedSubscript:@"ltmMetadata"];

            v114 = self->_post;
            unint64_t v115 = [v81 properties];
            v116 = [v115 meta];
            uint64_t v117 = [v93 properties];
            unint64_t v118 = [v117 meta];
            int v34 = [(CMIPost *)v114 processLTM_HLG_Metadata:v96 toDarkestFrame:v116 toEV0Frame:v118];

            if (!v34)
            {
              v119 = self->_post;
              v120 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
              v121 = [v120 properties];
              unint64_t v122 = [v121 meta];
              v123 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
              unsigned int v124 = [v123 properties];
              unsigned int v125 = [v124 meta];
              int v34 = [(CMIPost *)v119 processLTM_HLG_Metadata:v96 toDarkestFrame:v122 toEV0Frame:v125];

              long long v83 = v451;
              BOOL v3 = (int *)MEMORY[0x263F00E10];
              id v81 = v462;
              BOOL v8 = v444;
              v112 = (void *)v466;
              id v84 = v440;
              int v97 = v455;
              if (v34)
              {
LABEL_383:
                FigDebugAssert3();
                goto LABEL_384;
              }
              goto LABEL_89;
            }
            FigDebugAssert3();
          }
          else
          {
            unsigned int v99 = (void *)[(CMIPost *)v98 copyLTMMetadata:v96];
            [v455 setObject:v99 forKeyedSubscript:@"ltmMetadata"];

            v100 = self->_post;
            char v101 = [v81 properties];
            int v102 = [v101 meta];
            long long v103 = [v93 properties];
            long long v104 = [v103 meta];
            int v34 = [(CMIPost *)v100 processLTMMetadata:v96 toDarkestFrame:v102 toEV0Frame:v104];

            if (!v34)
            {
              unint64_t v105 = self->_post;
              simd_float3x3 v106 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
              uint64_t v107 = [v106 properties];
              simd_float3x3 v108 = [v107 meta];
              int v109 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
              v110 = [v109 properties];
              v111 = [v110 meta];
              int v34 = [(CMIPost *)v105 processLTMMetadata:v96 toDarkestFrame:v108 toEV0Frame:v111];

              long long v83 = v451;
              BOOL v3 = (int *)MEMORY[0x263F00E10];
              id v81 = v462;
              BOOL v8 = v444;
              v112 = (void *)v466;
              id v84 = v440;
              int v97 = v455;
              if (v34) {
                goto LABEL_383;
              }
              goto LABEL_89;
            }
            FigDebugAssert3();
            BOOL v3 = (int *)MEMORY[0x263F00E10];
          }
          id v81 = v462;
          BOOL v8 = v444;
          v112 = (void *)v466;
          id v84 = v440;
LABEL_384:

          unsigned int v80 = v93;
          id WeakRetained = v83;
          unsigned int v144 = v112;
          goto LABEL_220;
        }
LABEL_89:

        unsigned int v80 = v93;
        goto LABEL_91;
      }
      v448 = v8;
      v354 = v81;
      FigDebugAssert3();
      LODWORD(v481) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v355 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v356 = v481;
      if (os_log_type_enabled(v355, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v357 = v356;
      }
      else {
        unsigned int v357 = v356 & 0xFFFFFFFE;
      }
      if (v357)
      {
        *(_DWORD *)v482 = 136315138;
        *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
        _os_log_send_and_compose_impl();
      }
      int v34 = -73309;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      id v81 = v354;
      BOOL v8 = v448;
    }
    else
    {
      v349 = v8;
      v350 = v81;
      LODWORD(v481) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v351 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v352 = v481;
      if (os_log_type_enabled(v351, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v353 = v352;
      }
      else {
        unsigned int v353 = v352 & 0xFFFFFFFE;
      }
      if (v353)
      {
        *(_DWORD *)v482 = 136315138;
        *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
        _os_log_send_and_compose_impl();
      }
      int v34 = -73309;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      id v81 = v350;
      BOOL v8 = v349;
    }
    unsigned int v80 = v93;
    id WeakRetained = v83;
    goto LABEL_112;
  }
LABEL_46:
  metal = self->_metal;
  if (!v457)
  {
    id v55 = WeakRetained;
    uint64_t v56 = [(FigMetalContext *)metal allocator];
    uint64_t v46 = [v56 newTextureDescriptor];

    if (!v46)
    {
      LODWORD(v481) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v366 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v367 = v481;
      if (os_log_type_enabled(v366, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v368 = v367;
      }
      else {
        unsigned int v368 = v367 & 0xFFFFFFFE;
      }
      if (v368)
      {
        *(_DWORD *)v482 = 136315138;
        *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
        _os_log_send_and_compose_impl();
      }
      unsigned int v144 = (void *)v466;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      id WeakRetained = v55;
      goto LABEL_388;
    }
    int v57 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
    v58 = [v57 rgbTex];
    unint64_t v59 = (unint64_t)[v58 width] >> 1;
    long long v60 = [v46 desc];
    [v60 setWidth:v59];

    id v61 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
    int v62 = [v61 rgbTex];
    unint64_t v63 = (unint64_t)[v62 height] >> 1;
    id v64 = [v46 desc];
    [v64 setHeight:v63];

    double v65 = [v46 desc];
    [v65 setUsage:7];

    int v66 = [v46 desc];
    [v66 setPixelFormat:10];

    uint64_t v67 = [v46 desc];
    [v67 setCompressionMode:2];

    unint64_t v68 = [v46 desc];
    [v68 setCompressionFootprint:0];

    [v46 setLabel:0];
    double v69 = [(FigMetalContext *)self->_metal allocator];
    id v70 = (void *)[v69 newTextureWithDescriptor:v46];
    id v71 = v479;
    id v479 = v70;

    if (v479)
    {

      BOOL v3 = (int *)MEMORY[0x263F00E10];
      goto LABEL_56;
    }
    LODWORD(v481) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v369 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    int v370 = (int)v481;
    if (!os_log_type_enabled(v369, OS_LOG_TYPE_DEFAULT)) {
      v370 &= ~1u;
    }
    BOOL v3 = (int *)MEMORY[0x263F00E10];
    if (v370)
    {
      v371 = [v46 label];
      *(_DWORD *)v482 = 136315394;
      *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
      __int16 v483 = 2114;
      v484 = v371;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    id WeakRetained = v55;
LABEL_387:
    unsigned int v144 = (void *)v466;
LABEL_388:
    int v34 = -73309;
    goto LABEL_389;
  }
  int v51 = [(FigMetalContext *)metal bindPixelBufferToMTL2DTexture:[(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferenceFusionMapPixelBuffer] pixelFormat:10 usage:7 plane:0];
  id v52 = v479;
  id v479 = v51;

  if (!v479)
  {
    LODWORD(v481) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    uint64_t v46 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v53 = v481;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v54 = v53;
    }
    else {
      unsigned int v54 = v53 & 0xFFFFFFFE;
    }
    if (!v54) {
      goto LABEL_249;
    }
    *(_DWORD *)v482 = 136315138;
    *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
    goto LABEL_248;
  }
LABEL_56:
  int v72 = v475[0];
  BOOL v453 = LODWORD(v475[0]) != 1;
  if (LODWORD(v475[0]) == 1) {
    [(NRFDeepFusionOutput *)self->_deepFusionOutput setRefFrameTransformIsValid:1];
  }
  long long v73 = [(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferenceMetadata];
  if (v73)
  {
    id v74 = +[RawDFDetectors packDetectorsOutput:v475];
    [v73 setObject:v74 forKeyedSubscript:@"DetectorsOutput"];

    long long v75 = packHomographyToNSArray();
    [v73 setObject:v75 forKeyedSubscript:@"EVMHomographyOriginalBeforeZoomUpdate"];

    unsigned int v76 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
    unsigned __int8 v77 = [v76 properties];
    [v77 regHomography];

    unsigned __int8 v78 = packHomographyToNSArray();
    [v73 setObject:v78 forKeyedSubscript:@"EVMHomographyAfterZoomUpdate"];
  }
  rawDFCommon = self->_rawDFCommon;
  if (v72 == 1) {
    [(RawDFCommon *)rawDFCommon sifrFrame];
  }
  else {
  unsigned int v80 = [(RawDFCommon *)rawDFCommon referenceFrame];
  }
  id v81 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
  if (self->_useSyntheticReferenceForInferences)
  {
    int v82 = [(RawDFProcessor *)self _generateSyntheticRefererence:&v480 outputNoiseDivisor:v479 withDetectorsOutput:v475];
    if (v82)
    {
      int v34 = v82;
      goto LABEL_112;
    }
  }
  long long v83 = WeakRetained;
  if ((LODWORD(self->_lastWidth) - 1) < 3)
  {
    id v84 = v480;
    unsigned int v460 = 1;
    goto LABEL_80;
  }
  unsigned int v460 = 1;
LABEL_91:
  unint64_t v126 = [(NRFDeepFusionOutput *)self->_deepFusionOutput inferenceInputPixelBuffer];
  unint64_t v127 = [(NRFDeepFusionOutput *)self->_deepFusionOutput gainMapOutputPixelBuffer];
  v463 = v81;
  if (v126 | v127)
  {
    unint64_t v128 = v127;
    if (v126)
    {
      unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane([(NRFDeepFusionOutput *)self->_deepFusionOutput inferenceInputPixelBuffer], 0);
      *(double *)&unint64_t v130 = COERCE_DOUBLE(__PAIR64__(CVPixelBufferGetHeightOfPlane([(NRFDeepFusionOutput *)self->_deepFusionOutput inferenceInputPixelBuffer], 0), WidthOfPlane));
    }
    else
    {
      *(double *)&unint64_t v130 = 0.0;
    }
    double v445 = *(double *)&v130;
    if (v128 && !self->_nrfConfig->_isMeteorPlusPlusEnabled)
    {
      v131 = v80;
      unsigned int v133 = CVPixelBufferGetWidthOfPlane([(NRFDeepFusionOutput *)self->_deepFusionOutput gainMapOutputPixelBuffer], 0);
      *(double *)&unint64_t v132 = COERCE_DOUBLE(__PAIR64__(CVPixelBufferGetHeightOfPlane([(NRFDeepFusionOutput *)self->_deepFusionOutput gainMapOutputPixelBuffer], 0), v133));
    }
    else
    {
      v131 = v80;
      *(double *)&unint64_t v132 = 0.0;
    }
    double v441 = *(double *)&v132;
    v134 = v83;
    id v135 = v480;
    BOOL v136 = !self->_useSyntheticReferenceForInferences || v480 == 0;
    int v137 = v136;
    demosaicStage = self->_demosaicStage;
    float64x2_t v139 = v8;
    float64x2_t v140 = v131;
    if (v136)
    {
      id v135 = [v131 rgbTex];
    }
    long long v141 = [v131 rgbTex];
    long long v142 = v140;
    unsigned int v143 = [v140 metadata];
    int v34 = [(CMIDemosaicStage *)demosaicStage createSourceTexturesForInference:v139 band0InferenceSourceTexture:v135 outputInferenceSize:v466 gainMap:v141 band0GainMapSourceTexture:v143 outputGainMapSize:self->_draftDemosaicStage sourceMetadata:v445 demosaicStage:v441 downSampleStage:self->_rawDFColorMatchStage];

    if (v137) {
    id v81 = v463;
    }
    if (v34)
    {
      unsigned int v80 = v142;
      BOOL v8 = v139;
      id WeakRetained = v134;
      BOOL v3 = (int *)MEMORY[0x263F00E10];
      goto LABEL_112;
    }
    unsigned int v80 = v142;
    BOOL v8 = v139;
    long long v83 = v134;
    BOOL v3 = (int *)MEMORY[0x263F00E10];
    if (v126)
    {
      v442 = [(NRFDeepFusionOutput *)self->_deepFusionOutput inferenceInputPixelBuffer];
      unsigned int v145 = self->_useSyntheticReferenceForInferences ? v463 : v142;
      v438 = [v145 properties];
      unsigned int v146 = [v463 properties];
      v446 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
      unsigned int v147 = [v446 properties];
      [v142 rgbTex];
      v149 = unsigned int v148 = v8;
      uint64_t v150 = [v149 width];
      [v142 rgbTex];
      v152 = v151 = v83;
      uint64_t v153 = [v152 height];
      uint64_t v154 = v150;
      BOOL v3 = (int *)MEMORY[0x263F00E10];
      int v34 = [(RawDFProcessor *)self _processInferenceImage:v442 sourceFrameLumaChromaImage:v148 sourceFrameProperties:v438 ltcFrameProperties:v146 gtcFrameProperties:v147 originalWidth:v154 originalHeight:v153];

      long long v83 = v151;
      BOOL v8 = v148;

      id v81 = v463;
      unsigned int v80 = v142;

      if (v34) {
        goto LABEL_141;
      }
    }
  }
  char v155 = v464 ^ 1;
  if (v480) {
    char v155 = 1;
  }
  if ((v155 & 1) == 0)
  {
    int v156 = [(RawDFProcessor *)self _generateSyntheticRefererence:&v480 outputNoiseDivisor:v479 withDetectorsOutput:v475];
    if (v156)
    {
      int v34 = v156;
      goto LABEL_141;
    }
  }
  int v157 = (void *)v466;
  if ([(NRFDeepFusionOutput *)self->_deepFusionOutput gainMapOutputPixelBuffer])
  {
    if (self->_nrfPlist->gainMap)
    {
      if (CVPixelBufferGetPixelFormatType([(NRFDeepFusionOutput *)self->_deepFusionOutput gainMapOutputPixelBuffer]) == 1278226488)
      {
        uint64_t v158 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:[(NRFDeepFusionOutput *)self->_deepFusionOutput gainMapOutputPixelBuffer] pixelFormat:10 usage:6 plane:0];
        if (!v158)
        {
          LODWORD(v481) = 0;
          type[0] = OS_LOG_TYPE_DEFAULT;
          v363 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v364 = v481;
          if (os_log_type_enabled(v363, OS_LOG_TYPE_DEFAULT)) {
            unsigned int v365 = v364;
          }
          else {
            unsigned int v365 = v364 & 0xFFFFFFFE;
          }
          if (v365)
          {
            *(_DWORD *)v482 = 136315138;
            *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
            _os_log_send_and_compose_impl();
          }
          int v34 = -73309;
          fig_log_call_emit_and_clean_up_after_send_and_compose();

          v162 = 0;
          id v81 = v463;
          goto LABEL_140;
        }
        v162 = (void *)v158;
        if (self->_nrfConfig->_isMeteorPlusPlusEnabled)
        {
          long long v498 = 0u;
          long long v499 = 0u;
          long long v496 = 0u;
          long long v497 = 0u;
          long long v494 = 0u;
          long long v495 = 0u;
          long long v492 = 0u;
          long long v493 = 0u;
          long long v490 = 0u;
          long long v491 = 0u;
          long long v488 = 0u;
          long long v489 = 0u;
          long long v486 = 0u;
          long long v487 = 0u;
          long long v485 = 0u;
          rawDFPowerBlurStage = self->_rawDFPowerBlurStage;
          gainMap = self->_nrfPlist->gainMap;
          v165 = [v81 properties];
          v166 = [v165 meta];
          -[RawDFPowerBlurStage setGainMapConfig:tuning:frameMetadata:width:height:isLinear:](rawDFPowerBlurStage, "setGainMapConfig:tuning:frameMetadata:width:height:isLinear:", &v485, gainMap, v166, [v162 width], objc_msgSend(v162, "height"), 1);

          v167 = self->_rawDFPowerBlurStage;
          if (v460)
          {
            id v168 = v480;
          }
          else
          {
            id v168 = [v80 rgbTex];
          }
          id v81 = v463;
          v177 = [v463 properties];
          int v34 = [(RawDFPowerBlurStage *)v167 computeGainMapWithInput:v168 secondInput:0 output:v162 properties:v177 mpconfig:&v485];

          if ((v460 & 1) == 0) {
          BOOL v3 = (int *)MEMORY[0x263F00E10];
          }
          if (v34) {
            goto LABEL_140;
          }
          float v169 = 1.0;
          goto LABEL_143;
        }
        float v169 = 1.0;
        if (v453)
        {
          float estGainScaling = self->_nrfPlist->gainMap->estGainScaling;
          v171 = [v80 properties];
          v172 = [v171 meta];
          float v173 = fmaxf(estGainScaling * estimateLTMSoftGainFromFrameProperties(v172, 0), 1.0);

          float v169 = v173 * 0.25;
        }
        v174 = self->_nrfPlist->gainMap;
        if (v174)
        {
          if (v466)
          {
            uint64_t v175 = *(void *)(v466 + 16);
            if (v175)
            {
              *(float *)&double v159 = v174->minThreshold;
              *(float *)&double v160 = v174->maxThreshold;
              *(float *)&double v161 = v169;
              int v176 = [(RawDFPowerBlurStage *)self->_rawDFPowerBlurStage runWithInput:v175 output:v162 minThreshold:1 maxThreshold:v159 inputIsLinear:v160 inputScaling:v161];
              if (!v176)
              {
LABEL_143:
                [(FigMetalContext *)self->_metal waitForSchedule];
                objc_msgSend(v83, "processor:outputReadyWithFrameType:outputPixelBuffer:outputMetadata:error:", self, 11, -[NRFDeepFusionOutput gainMapOutputPixelBuffer](self->_deepFusionOutput, "gainMapOutputPixelBuffer"), 0, 0);
                self->_outputGainMapHeadroouint64_t m = v169 * 4.0;

                int v157 = (void *)v466;
                goto LABEL_144;
              }
              int v34 = v176;
LABEL_140:

LABEL_141:
              id WeakRetained = v83;
              unsigned int v144 = (void *)v466;
              goto LABEL_220;
            }
            v433 = v80;
            v425 = v8;
            v426 = v433;
            LODWORD(v481) = 0;
            type[0] = OS_LOG_TYPE_DEFAULT;
            v427 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v434 = v481;
            if (os_log_type_enabled(v427, OS_LOG_TYPE_DEFAULT)) {
              unsigned int v435 = v434;
            }
            else {
              unsigned int v435 = v434 & 0xFFFFFFFE;
            }
            if (!v435)
            {
LABEL_378:
              int v34 = -73309;
              fig_log_call_emit_and_clean_up_after_send_and_compose();

              v436 = v426;
              id v81 = v463;
              BOOL v8 = v425;
              unsigned int v80 = v436;
              goto LABEL_140;
            }
            *(_DWORD *)v482 = 136315138;
            *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
          }
          else
          {
            v430 = v80;
            v425 = v8;
            v426 = v430;
            LODWORD(v481) = 0;
            type[0] = OS_LOG_TYPE_DEFAULT;
            v427 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v431 = v481;
            if (os_log_type_enabled(v427, OS_LOG_TYPE_DEFAULT)) {
              unsigned int v432 = v431;
            }
            else {
              unsigned int v432 = v431 & 0xFFFFFFFE;
            }
            if (!v432) {
              goto LABEL_378;
            }
            *(_DWORD *)v482 = 136315138;
            *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
          }
        }
        else
        {
          v424 = v80;
          v425 = v8;
          v426 = v424;
          LODWORD(v481) = 0;
          type[0] = OS_LOG_TYPE_DEFAULT;
          v427 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v428 = v481;
          if (os_log_type_enabled(v427, OS_LOG_TYPE_DEFAULT)) {
            unsigned int v429 = v428;
          }
          else {
            unsigned int v429 = v428 & 0xFFFFFFFE;
          }
          if (!v429) {
            goto LABEL_378;
          }
          *(_DWORD *)v482 = 136315138;
          *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
        }
        _os_log_send_and_compose_impl();
        goto LABEL_378;
      }
      LODWORD(v481) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v358 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v361 = v481;
      if (os_log_type_enabled(v358, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v362 = v361;
      }
      else {
        unsigned int v362 = v361 & 0xFFFFFFFE;
      }
      if (!v362)
      {
LABEL_321:
        id v81 = v463;
        int v34 = -73309;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        v162 = 0;
        goto LABEL_140;
      }
      *(_DWORD *)v482 = 136315138;
      *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
    }
    else
    {
      LODWORD(v481) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v358 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v359 = v481;
      if (os_log_type_enabled(v358, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v360 = v359;
      }
      else {
        unsigned int v360 = v359 & 0xFFFFFFFE;
      }
      if (!v360) {
        goto LABEL_321;
      }
      *(_DWORD *)v482 = 136315138;
      *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
    }
    _os_log_send_and_compose_impl();
    goto LABEL_321;
  }
LABEL_144:
  if (v157)
  {
    FigMetalDecRef();
    FigMetalDecRef();
  }
  id WeakRetained = v83;
  if (v8)
  {
    FigMetalDecRef();
    FigMetalDecRef();
  }
  v178 = [(NRFDeepFusionOutput *)self->_deepFusionOutput proxyPixelBuffer];
  v179 = v178;
  if (v460)
  {
    if (v178)
    {
      v180 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
      v181 = [v180 pyramid];
      v182 = [v181 getTextureAtLevel:0];
      id v183 = v477;
      id v477 = v182;

      if (!v477)
      {
        v372 = v80;
        LODWORD(v481) = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        v421 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v422 = v481;
        v375 = v421;
        if (os_log_type_enabled(v375, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v423 = v422;
        }
        else {
          unsigned int v423 = v422 & 0xFFFFFFFE;
        }
        if (!v423) {
          goto LABEL_360;
        }
        *(_DWORD *)v482 = 136315138;
        *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
        goto LABEL_359;
      }
      FigMetalIncRef();
    }
    v184 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
    v185 = [v184 pyramid];
    [v185 releaseAll];
  }
  if (!v179) {
    goto LABEL_156;
  }
  v186 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
  v187 = [v186 pyramid];
  v188 = [v187 getTextureAtLevel:0];
  id v189 = v478;
  id v478 = v188;

  if (!v478)
  {
    v372 = v80;
    LODWORD(v481) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v373 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v374 = v481;
    v375 = v373;
    if (os_log_type_enabled(v375, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v376 = v374;
    }
    else {
      unsigned int v376 = v374 & 0xFFFFFFFE;
    }
    if (!v376) {
      goto LABEL_360;
    }
    *(_DWORD *)v482 = 136315138;
    *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
LABEL_359:
    _os_log_send_and_compose_impl();
LABEL_360:

    fig_log_call_emit_and_clean_up_after_send_and_compose();
    unsigned int v144 = 0;
    int v34 = 0;
    goto LABEL_361;
  }
  FigMetalIncRef();
LABEL_156:
  v190 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
  v191 = [v190 pyramid];
  [v191 releaseAll];

  if (!v457)
  {
LABEL_163:
    v197 = [(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferenceMetadata];

    if (v197)
    {
      v198 = [(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferenceMetadata];
      int v34 = [(RawDFProcessor *)self _populateDeepFusionMetadata:v198 hasEVM:v460];

      if (v34) {
        goto LABEL_397;
      }
    }
    if (![(NRFDeepFusionOutput *)self->_deepFusionOutput proxyPixelBuffer])
    {
      int v34 = 0;
      goto LABEL_218;
    }
    *(void *)os_log_type_t type = 0;
    if (v480)
    {
      id v199 = *(id *)type;
      *(void *)os_log_type_t type = v480;
    }
    else
    {
      id v199 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
      v200 = [v199 rgbTex];
      objc_storeStrong((id *)type, v200);
    }
    uint64_t v201 = objc_opt_new();
    uint64_t v454 = v201;
    if (v201)
    {
      uint64_t v202 = v201;
      v203 = [(FigMetalContext *)self->_metal allocator];
      v204 = (void *)[v203 newTextureDescriptor];

      if (v204)
      {
        v205 = [v204 desc];
        [v205 setTextureType:2];

        uint64_t v206 = [*(id *)type width];
        v207 = [v204 desc];
        [v207 setWidth:v206];

        uint64_t v208 = [*(id *)type height];
        v209 = [v204 desc];
        [v209 setHeight:v208];

        v210 = [v204 desc];
        [v210 setUsage:7];

        v211 = [v204 desc];
        [v211 setPixelFormat:25];

        [v204 setLabel:0];
        v212 = [(FigMetalContext *)self->_metal allocator];
        uint64_t v213 = [v212 newTextureWithDescriptor:v204];
        v214 = *(void **)(v202 + 16);
        *(void *)(v202 + 16) = v213;

        v467 = v204;
        if (!*(void *)(v202 + 16))
        {
          v385 = v80;
          LODWORD(v481) = 0;
          v472[0] = OS_LOG_TYPE_DEFAULT;
          v386 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          int v387 = (int)v481;
          v388 = v386;
          if (!os_log_type_enabled(v388, OS_LOG_TYPE_DEFAULT)) {
            v387 &= ~1u;
          }
          if (v387)
          {
            v389 = [v467 label];
            *(_DWORD *)v482 = 136315394;
            *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
            __int16 v483 = 2114;
            v484 = v389;
            _os_log_send_and_compose_impl();
          }
          int v34 = -73309;

          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v394 = 0;
          goto LABEL_395;
        }
        v215 = [v204 desc];
        objc_msgSend(v215, "setWidth:", (unint64_t)objc_msgSend(v215, "width") >> 1);

        v216 = [v204 desc];
        objc_msgSend(v216, "setHeight:", (unint64_t)objc_msgSend(v216, "height") >> 1);

        v217 = [v204 desc];
        [v217 setPixelFormat:65];

        [v204 setLabel:0];
        v218 = [(FigMetalContext *)self->_metal allocator];
        uint64_t v219 = [v218 newTextureWithDescriptor:v204];
        v220 = *(void **)(v202 + 24);
        *(void *)(v202 + 24) = v219;

        if (!*(void *)(v202 + 24))
        {
          v385 = v80;
          LODWORD(v481) = 0;
          v472[0] = OS_LOG_TYPE_DEFAULT;
          v390 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          int v391 = (int)v481;
          v392 = v390;
          if (!os_log_type_enabled(v392, OS_LOG_TYPE_DEFAULT)) {
            v391 &= ~1u;
          }
          if (v391)
          {
            v393 = [v467 label];
            *(_DWORD *)v482 = 136315394;
            *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
            __int16 v483 = 2114;
            v484 = v393;
            _os_log_send_and_compose_impl();
          }
LABEL_394:
          int v34 = -73309;

          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v394 = 0;
          BOOL v3 = (int *)MEMORY[0x263F00E10];
LABEL_395:
          unsigned int v80 = v385;
          id v81 = v463;
          uint64_t v202 = v454;
          v204 = v467;
          goto LABEL_396;
        }
        draftDemosaicStage = self->_draftDemosaicStage;
        id v222 = *(id *)type;
        v223 = [v80 metadata];
        int v34 = [(CMIDraftDemosaicStage *)draftDemosaicStage convertRGBToYUV:v222 inputMetadata:v223 outputTexY:*(void *)(v202 + 16) outputTexUV:*(void *)(v202 + 24)];

        if (!v34)
        {
          FigMetalDecRef();
          v465 = [[LumaChromaImage alloc] initWithContext:self->_metal pixelBuffer:[(NRFDeepFusionOutput *)self->_deepFusionOutput proxyPixelBuffer] lumaAlignmentFactor:16 chromaAlignmentFactor:8];
          if (v465)
          {
            id v456 = v80;
            if (![(NRFDeepFusionOutput *)self->_deepFusionOutput linearOutputPixelBuffer]) {
              goto LABEL_178;
            }
            colorConvertStage = self->_colorConvertStage;
            uint64_t v225 = *(void *)(v202 + 16);
            id v81 = *(void **)(v202 + 24);
            v226 = [v456 properties];
            v227 = [v226 meta];
            long long v458 = *(_OWORD *)([v227 ltmCurves] + 223056);
            [v463 properties];
            v229 = id v228 = WeakRetained;
            v230 = [v229 meta];
            uint64_t v231 = [v230 exposureParams];
            v232 = [(NRFDeepFusionOutput *)self->_deepFusionOutput linearOutputPixelBuffer];
            uint64_t v437 = v231;
            uint64_t v202 = v454;
            int v34 = -[ColorConvertStage extractLinearBufferWithLumaInput:chromaInput:lumaAlignmentFactor:chromaAlignmentFactor:inputIsLinear:removeChromaBias:lumaPedestal:hazeCorrection:exposureParams:ccm:output:](colorConvertStage, "extractLinearBufferWithLumaInput:chromaInput:lumaAlignmentFactor:chromaAlignmentFactor:inputIsLinear:removeChromaBias:lumaPedestal:hazeCorrection:exposureParams:ccm:output:", v225, v81, 1, 1, 1, 0, 0.0, *(double *)&v458, *MEMORY[0x263EF89A0], *(double *)(MEMORY[0x263EF89A0] + 16), *(double *)(MEMORY[0x263EF89A0] + 32), v437, v232);

            BOOL v3 = (int *)MEMORY[0x263F00E10];
            id WeakRetained = v228;
            v204 = v467;

            if (!v34)
            {
LABEL_178:
              v459 = [WeakRetained processorGetInferenceResults:self];
              id v471 = 0;
              uint64_t v233 = [*(id *)(v202 + 16) width];
              v234 = [v204 desc];
              [v234 setWidth:v233];

              uint64_t v235 = [*(id *)(v202 + 16) height];
              v236 = [v204 desc];
              [v236 setHeight:v235];

              v237 = [v204 desc];
              [v237 setUsage:7];

              v238 = [v204 desc];
              [v238 setPixelFormat:25];

              [v204 setLabel:0];
              v239 = [(FigMetalContext *)self->_metal allocator];
              uint64_t v240 = [v239 newTextureWithDescriptor:v204];
              *(void *)v472 = v240;

              if (v240)
              {
                v241 = [v204 desc];
                objc_msgSend(v241, "setWidth:", (unint64_t)objc_msgSend(v241, "width") >> 1);

                v242 = [v204 desc];
                objc_msgSend(v242, "setHeight:", (unint64_t)objc_msgSend(v242, "height") >> 1);

                v243 = [v204 desc];
                [v243 setPixelFormat:65];

                [v204 setLabel:0];
                v244 = [(FigMetalContext *)self->_metal allocator];
                v245 = (void *)[v244 newTextureWithDescriptor:v204];
                id v471 = v245;

                if (v245)
                {
                  long long v496 = 0u;
                  long long v497 = 0u;
                  long long v494 = 0u;
                  long long v495 = 0u;
                  long long v492 = 0u;
                  long long v493 = 0u;
                  long long v490 = 0u;
                  long long v491 = 0u;
                  long long v488 = 0u;
                  long long v489 = 0u;
                  long long v486 = 0u;
                  long long v487 = 0u;
                  long long v485 = 0u;
                  id v246 = WeakRetained;
                  if (v460)
                  {
                    id v81 = [(RawDFCommon *)self->_rawDFCommon sifrFrame];
                    v247 = [v81 properties];
                  }
                  else
                  {
                    v247 = 0;
                  }
                  v248 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
                  v249 = [v248 properties];
                  int v34 = +[RawDFProxyStage fillFrameProperties:&v485 withEvmProperties:v247 withEv0Properties:v249];

                  if (v460)
                  {
                  }
                  BOOL v3 = (int *)MEMORY[0x263F00E10];
                  if (v34)
                  {
                    FigDebugAssert3();
                    int v340 = 8;
                    id v81 = v463;
                    unsigned int v80 = v456;
                    id WeakRetained = v246;
                  }
                  else
                  {
                    int v250 = [(RawDFDownsampleStage *)self->_rawDFDownsampleStage generateOutputNoiseMapLuma:v240 outputNoiseMapChroma:v245 lscGainsTex:self->_lscGainsTex ev0:v478 evm:v477 noiseDivisorOutputTex:v479 frameProperties:&v485];
                    unsigned int v80 = v456;
                    id WeakRetained = v246;
                    if (v250)
                    {
                      int v34 = v250;
                      FigDebugAssert3();
                      int v340 = 8;
                      id v81 = v463;
                    }
                    else
                    {
                      FigMetalDecRef();
                      FigMetalDecRef();
                      FigMetalDecRef();
                      v251 = [(FigMetalContext *)self->_metal allocator];
                      [v251 setForceDisableCompression:1];

                      v252 = [v456 properties];
                      v253 = [v252 meta];
                      int8x16_t v449 = *(int8x16_t *)([v253 ltmCurves] + 223056);

                      v254 = [[CMIPostConfig alloc] initWithMetalContext:self->_metal];
                      v255 = v467;
                      if (v254)
                      {
                        v256 = v254;
                        [(CMIPostConfig *)v254 setEnableSTF:self->_nrfConfig->_enableSTF];
                        v257 = self->_rawDFCommon;
                        if (v460)
                        {
                          v258 = [(RawDFCommon *)v257 sifrFrame];
                          v259 = &OBJC_IVAR___NRFPlist_proxyAssetEVMRefDenoising;
                        }
                        else
                        {
                          v258 = [(RawDFCommon *)v257 referenceFrame];
                          v259 = &OBJC_IVAR___NRFPlist_proxyAssetEV0RefDenoising;
                        }
                        v260 = [v258 properties];
                        v261 = [v260 meta];
                        [(CMIPostConfig *)v256 setDarkestFrameMetadata:v261];

                        v262 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
                        v263 = [v262 properties];
                        v264 = [v263 meta];
                        [(CMIPostConfig *)v256 setEv0FrameMetadata:v264];

                        [(CMIPostConfig *)v256 setAllowGreenGhostMitigation:0];
                        [(CMIPostConfig *)v256 setAllowSemanticStyles:self->_nrfConfig->_enableSemanticStyles];
                        [(CMIPostConfig *)v256 setAllowDenoiseAndSharpening:1];
                        [(CMIPostConfig *)v256 setAllowColorCube:0];
                        [(CMIPostConfig *)v256 setAllowOutlierCorrection:0];
                        [(CMIPostConfig *)v256 setTmQuality:3];
                        [(CMIPostConfig *)v256 setForceEnableBandZeroDenoising:1];
                        [(CMIPostConfig *)v256 setSemanticStyleProperties:self->_defringingTuningByPortType];
                        v265 = [[RawDFProxyBoundInferenceResults alloc] initWithResult:v459 andMetal:self->_metal];
                        v266 = [(RawDFProxyBoundInferenceResults *)v265 skinMask];
                        [(CMIPostConfig *)v256 setSkinMask:v266];

                        v267 = [(RawDFProxyBoundInferenceResults *)v265 skyMask];
                        [(CMIPostConfig *)v256 setSkyMask:v267];

                        v268 = [(RawDFProxyBoundInferenceResults *)v265 personMask];
                        [(CMIPostConfig *)v256 setPersonMask:v268];

                        v461 = v265;
                        v269 = [(RawDFProxyBoundInferenceResults *)v265 instanceMasks];
                        [(CMIPostConfig *)v256 setInstanceMasks:v269];

                        v270 = [v459 faceLandmarks];
                        [(CMIPostConfig *)v256 setFaceLandmarks:v270];

                        v271 = [v459 skinToneClassificationsForFaces];
                        [(CMIPostConfig *)v256 setSkinToneClassificationsForFaces:v271];

                        v272 = [v459 lowResPersonInstanceConfidences];
                        [(CMIPostConfig *)v256 setLowResPersonInstanceConfidences:v272];

                        v273 = [v459 smartCameraSceneType];
                        [(CMIPostConfig *)v256 setSmartCameraSceneType:v273];

                        [(CMIPostConfig *)v256 setToneMappingPlist:self->_nrfPlist->toneMapping];
                        [(CMIPostConfig *)v256 setSemanticStylesPlist:self->_nrfPlist->semanticStyles];
                        [(CMIPostConfig *)v256 setDenoiseAndSharpeningPlist:*(Class *)((char *)&self->_nrfPlist->super.super.isa + *v259)];
                        [(CMIPostConfig *)v256 setNoiseModelPlist:self->_nrfPlist->noiseModel];
                        [(CMIPostConfig *)v256 setDefringingTuningParameters:self->_nrfPlist->defringingTuningParameters];
                        [(CMIPostConfig *)v256 setGreenGhostBrightLightTuning:self->_nrfPlist->greenGhostBrightLightTuning];
                        [(CMIPostConfig *)v256 setDisableChromaBand3GainMap:1];
                        [(CMIPostConfig *)v256 setInputLuma:*(void *)(v202 + 16)];
                        [(CMIPostConfig *)v256 setInputChroma:*(void *)(v202 + 24)];
                        [(CMIPostConfig *)v256 setInputNoiseLuma:*(void *)v472];
                        [(CMIPostConfig *)v256 setInputNoiseChroma:v471];
                        [(CMIPostConfig *)v256 setOutputLuma:v465->lumaTex];
                        [(CMIPostConfig *)v256 setOutputChroma:v465->chromaTex];
                        [(CMIPostConfig *)v256 setRequestLinearMIWBAppliedOutput:[(NRFDeepFusionOutput *)self->_deepFusionOutput linearOutputMIWBAppliedPixelBuffer] != 0];
                        [(CMIPostConfig *)v256 setEnableMIWB:self->_nrfConfig->_enableMIWB];
                        if ([(CMIPostConfig *)v256 enableMIWB])
                        {
                          v274 = self->_post;
                          v275 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
                          v276 = [v275 metadata];
                          [(CMIPostConfig *)v256 setHazeAppliedInMIWB:[(CMIPost *)v274 isHazeCorrectionEnabled:v276]];
                        }
                        else
                        {
                          [(CMIPostConfig *)v256 setHazeAppliedInMIWB:0];
                        }
                        id v81 = v463;
                        int v277 = [*(id *)&self->_rawDFSoftLTMMode runPostWithConfig:v256];
                        if (v277)
                        {
                          int v34 = v277;
                          *(_DWORD *)v470 = 0;
                          os_log_type_t v469 = OS_LOG_TYPE_DEFAULT;
                          fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                          v407 = (id)objc_claimAutoreleasedReturnValue();
                          os_log_type_enabled(v407, OS_LOG_TYPE_DEFAULT);

                          fig_log_call_emit_and_clean_up_after_send_and_compose();
                          id v81 = v463;
                          uint64_t v202 = v454;
                          v255 = v467;
                        }
                        else
                        {
                          if (![(NRFDeepFusionOutput *)self->_deepFusionOutput linearOutputMIWBAppliedPixelBuffer])
                          {
LABEL_214:
                            *(void *)v482 = [(CMIPostConfig *)v256 miwbOutputLumaTexture];
                            id v481 = [(CMIPostConfig *)v256 miwbOutputChromaTexture];
                            FigMetalDecRef();
                            FigMetalDecRef();

                            v339 = [(FigMetalContext *)self->_metal allocator];
                            [v339 setForceDisableCompression:0];

                            FigMetalDecRef();
                            FigMetalDecRef();
                            FigMetalDecRef();
                            FigMetalDecRef();
                            int v340 = 0;
                            int v34 = 0;
LABEL_215:
                            unsigned int v80 = v456;
LABEL_216:

                            goto LABEL_217;
                          }
                          id v452 = WeakRetained;
                          BOOL v278 = [(CMIPostConfig *)v256 enableMIWB];
                          v482[0] = 0;
                          v279 = [v463 properties];
                          v280 = [v279 meta];
                          v281 = [(CMIPostConfig *)v256 miwbOutputLumaTexture];
                          uint64_t v282 = [v281 width];
                          v283 = [(CMIPostConfig *)v256 miwbOutputLumaTexture];
                          double v284 = minimumDenormalizedRectToProcess(v280, v282, [v283 height], v482);
                          double v286 = v285;
                          double v288 = v287;
                          double v290 = v289;

                          v291 = self->_colorConvertStage;
                          v292 = [(CMIPostConfig *)v256 miwbOutputLumaTexture];
                          v293 = [(CMIPostConfig *)v256 miwbOutputChromaTexture];
                          BOOL v294 = [(CMIPostConfig *)v256 tmApplyColorCorrectionMatrix];
                          if (v294)
                          {
                            v283 = [v463 properties];
                            v281 = [v283 meta];
                            [v281 colorCorrectionMatrix];
                            *(void *)&long long v443 = v296;
                            *(void *)&long long v447 = v295;
                            *(void *)&long long v439 = v297;
                          }
                          else
                          {
                            long long v443 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
                            long long v447 = *MEMORY[0x263EF89A0];
                            long long v439 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
                          }
                          v298 = [(NRFDeepFusionOutput *)self->_deepFusionOutput linearOutputMIWBAppliedPixelBuffer];
                          if (v278) {
                            unsigned int v299 = -1;
                          }
                          else {
                            unsigned int v299 = 0;
                          }
                          int v34 = -[ColorConvertStage extractAndDownsampleLinearWithLumaInput:chromaInput:denormalizedZoomRect:inputIsLinear:removeChromaBias:hazeCorrection:colorCorrectionMatrix:output:](v291, "extractAndDownsampleLinearWithLumaInput:chromaInput:denormalizedZoomRect:inputIsLinear:removeChromaBias:hazeCorrection:colorCorrectionMatrix:output:", v292, v293, 1, 0, v298, v284, v286, v288, v290, *(double *)vbicq_s8(v449, (int8x16_t)vdupq_n_s32(v299)).i64, *(double *)&v447, *(double *)&v443, *(double *)&v439);
                          v255 = v467;
                          if (v294)
                          {
                          }
                          id WeakRetained = v452;
                          uint64_t v202 = v454;
                          BOOL v3 = (int *)MEMORY[0x263F00E10];
                          if (!v34)
                          {
                            v300 = [v463 properties];
                            v301 = [v300 meta];
                            v302 = [v301 zoomRelatedMetadata];
                            v303 = [(NRFDeepFusionOutput *)self->_deepFusionOutput linearOutputMIWBAppliedMetadata];
                            FigCaptureMetadataUtilitiesCopyZoomRelatedMetadata();

                            v304 = [(CMIPostConfig *)v256 miwbOutputLumaTexture];
                            [v304 width];
                            v305 = [(CMIPostConfig *)v256 miwbOutputLumaTexture];
                            [v305 height];

                            CVPixelBufferGetWidth([(NRFDeepFusionOutput *)self->_deepFusionOutput linearOutputMIWBAppliedPixelBuffer]);
                            CVPixelBufferGetHeight([(NRFDeepFusionOutput *)self->_deepFusionOutput linearOutputMIWBAppliedPixelBuffer]);
                            v306 = [(NRFDeepFusionOutput *)self->_deepFusionOutput linearOutputMIWBAppliedMetadata];
                            FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop();

                            if (v482[0])
                            {
                              v307 = [(NRFDeepFusionOutput *)self->_deepFusionOutput linearOutputMIWBAppliedMetadata];
                              FigCaptureMetadataUtilitiesPreventFurtherCropping();
                            }
                            v308 = [(NRFDeepFusionOutput *)self->_deepFusionOutput linearOutputMIWBAppliedMetadata];

                            id WeakRetained = v452;
                            v255 = v467;
                            if (!v308) {
                              goto LABEL_213;
                            }
                            v309 = [(NRFDeepFusionOutput *)self->_deepFusionOutput linearOutputMIWBAppliedMetadata];
                            uint64_t v310 = *(int *)&self->_anon_1e0[980];
                            uint64_t v311 = *(int *)&self->_anon_1e0[988];
                            v312 = [(RawDFCommon *)self->_rawDFCommon frames];
                            v313 = [v312 objectAtIndexedSubscript:v310];

                            if (v313)
                            {
                              v314 = [(RawDFCommon *)self->_rawDFCommon frames];
                              v315 = [v314 objectAtIndexedSubscript:v311];

                              if (v315)
                              {
                                v316 = [(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferenceMetadata];
                                uint64_t v317 = [v316 objectForKeyedSubscript:@"ltmMetadata"];

                                if (v317) {
                                  +[SoftLTM copyLTMMetadata:v317 to:v309];
                                }
                                v318 = [v313 properties];
                                v319 = [v318 meta];
                                int v320 = *(_DWORD *)([v319 exposureParams] + 24);

                                v321 = [v313 properties];
                                v322 = [v321 meta];
                                int v323 = *(_DWORD *)([v322 exposureParams] + 36);

                                v324 = [v313 properties];
                                v325 = [v324 meta];
                                uint64_t v326 = [v325 exposureParams];
                                [v315 properties];
                                v327 = v450 = (void *)v317;
                                v328 = [v327 meta];
                                float RelativeBrightness = getRelativeBrightness(v326, [v328 exposureParams], 2);

                                LODWORD(v330) = v320;
                                v331 = [NSNumber numberWithFloat:v330];
                                [v309 setObject:v331 forKeyedSubscript:*MEMORY[0x263F2F0D8]];

                                LODWORD(v332) = v323;
                                v333 = [NSNumber numberWithFloat:v332];
                                [v309 setObject:v333 forKeyedSubscript:*MEMORY[0x263F2F0F8]];

                                *(float *)&double v334 = RelativeBrightness;
                                v335 = [NSNumber numberWithFloat:v334];
                                [v309 setObject:v335 forKeyedSubscript:*MEMORY[0x263F2F0F0]];

                                v336 = [v315 metadata];
                                uint64_t v337 = *MEMORY[0x263F2F4F8];
                                v338 = [v336 objectForKeyedSubscript:*MEMORY[0x263F2F4F8]];
                                [v309 setObject:v338 forKeyedSubscript:v337];

                                id WeakRetained = v452;
                                uint64_t v202 = v454;
                                BOOL v3 = (int *)MEMORY[0x263F00E10];
                                v255 = v467;
LABEL_213:
                                id v81 = v463;
                                goto LABEL_214;
                              }
                            }
                            int v34 = -73309;

                            v255 = v467;
                          }
                          id v81 = v463;
                        }

                        int v340 = 8;
                        goto LABEL_215;
                      }
                      *(_DWORD *)v470 = 0;
                      os_log_type_t v469 = OS_LOG_TYPE_DEFAULT;
                      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                      v406 = (id)objc_claimAutoreleasedReturnValue();
                      os_log_type_enabled(v406, OS_LOG_TYPE_DEFAULT);
                      int v34 = -73309;

                      fig_log_call_emit_and_clean_up_after_send_and_compose();
                      int v340 = 8;
                      unsigned int v80 = v456;
                      id v81 = v463;
                      uint64_t v202 = v454;
                    }
                  }
                  v255 = v467;
                  goto LABEL_216;
                }
                id v398 = v456;
                LODWORD(v481) = 0;
                v470[0] = OS_LOG_TYPE_DEFAULT;
                v403 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v404 = v481;
                v401 = v403;
                if (os_log_type_enabled(v401, OS_LOG_TYPE_DEFAULT)) {
                  unsigned int v405 = v404;
                }
                else {
                  unsigned int v405 = v404 & 0xFFFFFFFE;
                }
                if (!v405)
                {
LABEL_347:
                  int v34 = -73309;

                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                  int v340 = 8;
                  BOOL v3 = (int *)MEMORY[0x263F00E10];
                  unsigned int v80 = v398;
                  id v81 = v463;
                  uint64_t v202 = v454;
                  v255 = v467;
LABEL_217:

                  unsigned int v144 = 0;
                  if (v340 == 8)
                  {
                    BOOL v8 = 0;
                    goto LABEL_220;
                  }
LABEL_218:
                  unsigned int v144 = 0;
                  BOOL v8 = 0;
                  self->_processedSyntheticReference = 1;
                  goto LABEL_220;
                }
                *(_DWORD *)v482 = 136315138;
                *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
              }
              else
              {
                id v398 = v456;
                LODWORD(v481) = 0;
                v470[0] = OS_LOG_TYPE_DEFAULT;
                v399 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                unsigned int v400 = v481;
                v401 = v399;
                if (os_log_type_enabled(v401, OS_LOG_TYPE_DEFAULT)) {
                  unsigned int v402 = v400;
                }
                else {
                  unsigned int v402 = v400 & 0xFFFFFFFE;
                }
                if (!v402) {
                  goto LABEL_347;
                }
                *(_DWORD *)v482 = 136315138;
                *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
              }
              _os_log_send_and_compose_impl();
              goto LABEL_347;
            }
            id v81 = v463;
            v394 = v465;
            unsigned int v80 = v456;
            goto LABEL_396;
          }
          v385 = v80;
          LODWORD(v481) = 0;
          v472[0] = OS_LOG_TYPE_DEFAULT;
          v395 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v396 = v481;
          v392 = v395;
          if (os_log_type_enabled(v392, OS_LOG_TYPE_DEFAULT)) {
            unsigned int v397 = v396;
          }
          else {
            unsigned int v397 = v396 & 0xFFFFFFFE;
          }
          if (v397)
          {
            *(_DWORD *)v482 = 136315138;
            *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
            _os_log_send_and_compose_impl();
          }
          goto LABEL_394;
        }
        FigDebugAssert3();
        v394 = 0;
        BOOL v3 = (int *)MEMORY[0x263F00E10];
LABEL_396:

        goto LABEL_397;
      }
      v377 = v80;
      LODWORD(v481) = 0;
      v472[0] = OS_LOG_TYPE_DEFAULT;
      v382 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v383 = v481;
      v380 = v382;
      if (os_log_type_enabled(v380, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v384 = v383;
      }
      else {
        unsigned int v384 = v383 & 0xFFFFFFFE;
      }
      if (!v384)
      {
LABEL_346:
        int v34 = -73309;

        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v394 = 0;
        unsigned int v80 = v377;
        v204 = 0;
        id v81 = v463;
        uint64_t v202 = v454;
        goto LABEL_396;
      }
      *(_DWORD *)v482 = 136315138;
      *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
    }
    else
    {
      v377 = v80;
      LODWORD(v481) = 0;
      v472[0] = OS_LOG_TYPE_DEFAULT;
      v378 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v379 = v481;
      v380 = v378;
      if (os_log_type_enabled(v380, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v381 = v379;
      }
      else {
        unsigned int v381 = v379 & 0xFFFFFFFE;
      }
      if (!v381) {
        goto LABEL_346;
      }
      *(_DWORD *)v482 = 136315138;
      *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
    }
    _os_log_send_and_compose_impl();
    goto LABEL_346;
  }
  if (![(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferencePixelBuffer])
  {
    v372 = v80;
    LODWORD(v481) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v414 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v415 = v481;
    v416 = v414;
    if (os_log_type_enabled(v416, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v417 = v415;
    }
    else {
      unsigned int v417 = v415 & 0xFFFFFFFE;
    }
    if (!v417) {
      goto LABEL_350;
    }
    *(_DWORD *)v482 = 136315138;
    *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
    goto LABEL_344;
  }
  uint64_t v192 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:[(NRFDeepFusionOutput *)self->_deepFusionOutput syntheticReferencePixelBuffer] pixelFormat:113 usage:7 plane:0];
  if (!v192)
  {
    v372 = v80;
    LODWORD(v481) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v418 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v419 = v481;
    v416 = v418;
    if (os_log_type_enabled(v416, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v420 = v419;
    }
    else {
      unsigned int v420 = v419 & 0xFFFFFFFE;
    }
    if (!v420) {
      goto LABEL_350;
    }
    *(_DWORD *)v482 = 136315138;
    *(void *)&v482[4] = "-[RawDFProcessor _doDeepFusionSytheticRefererenceAndProxy]";
LABEL_344:
    _os_log_send_and_compose_impl();
LABEL_350:
    int v34 = -73309;

    fig_log_call_emit_and_clean_up_after_send_and_compose();
    unsigned int v144 = 0;
LABEL_361:
    unsigned int v80 = v372;
    BOOL v8 = 0;
    id v81 = v463;
    goto LABEL_220;
  }
  v193 = (void *)v192;
  id v194 = v480;
  if (!v194)
  {
    v195 = [(RawDFCommon *)self->_rawDFCommon referenceFrame];
    id v194 = [v195 rgbTex];
  }
  int v196 = [(RawDFProxyStage *)self->_rawDFProxyStage packSyntheticReference:v194 toOutputTex:v193];
  if (!v196)
  {

    goto LABEL_163;
  }
  int v34 = v196;
  FigDebugAssert3();

LABEL_397:
  unsigned int v144 = 0;
  BOOL v8 = 0;
LABEL_220:
  FigMetalDecRef();
  FigMetalDecRef();
  int v341 = *v3;
  if (*v3 == 1)
  {
    kdebug_trace();
    int v341 = *v3;
  }
  if (v341)
  {
    v342 = [(FigMetalContext *)self->_metal commandQueue];
    v343 = [v342 commandBuffer];

    [v343 setLabel:@"KTRACE_END_MTL"];
    v468[0] = MEMORY[0x263EF8330];
    v468[1] = 3221225472;
    v468[2] = __58__RawDFProcessor__doDeepFusionSytheticRefererenceAndProxy__block_invoke_258;
    v468[3] = &__block_descriptor_56_e28_v16__0___MTLCommandBuffer__8l;
    memset(&v468[4], 0, 24);
    [v343 addCompletedHandler:v468];
    [v343 commit];
  }
  return v34;
}

void __58__RawDFProcessor__doDeepFusionSytheticRefererenceAndProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 GPUEndTime];
  [v2 GPUStartTime];

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void __58__RawDFProcessor__doDeepFusionSytheticRefererenceAndProxy__block_invoke_258(uint64_t a1, void *a2)
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

- (void)setOutput:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_delegate, a3);
  deepFusionOutput = self->_deepFusionOutput;
  self->_deepFusionOutput = 0;

  uint64_t v6 = [(FigMetalContext *)self->_metal allocator];
  [v6 purgeResources:0];

  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)&self->_deepFusionOutput, a3);
      int v7 = [v9 completionStatus];
      BOOL v8 = [v7 metalExecutionStatus];
      [(FigMetalContext *)self->_metal setExecutionStatus:v8];
    }
  }
}

- (FigWiredMemory)sharedRegWarpBuffer
{
  return self->_sharedRegWarpBuffer;
}

- (void)setRegwarpInputSurface:(__IOSurface *)a3
{
  if (CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x263EFFB08], a3, 0, &self->_regWarpInput)
    || ([(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:self->_regWarpInput pixelFormat:10 usage:7 plane:0], int v4 = (MTLTexture *)objc_claimAutoreleasedReturnValue(), regWarpInputTex = self->_regWarpInputTex, self->_regWarpInputTex = v4, regWarpInputTex, !self->_regWarpInputTex))
  {
    uint64_t v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (__IOSurface)regwarpInputSurface
{
  return self->_regwarpInputSurface;
}

- (void)setSharedRegWarpBuffer:(id)a3
{
  int v5 = (FigWiredMemory *)a3;
  if (self->_sharedRegWarpBuffer != v5)
  {
    uint64_t v6 = v5;
    [(RegWarpPP *)self->_registrationPipelineRWPP releaseResources];
    objc_storeStrong((id *)&self->_sharedRegWarpBuffer, a3);
    int v5 = v6;
    self->_regwarpHasBeenSetup = 0;
  }
}

- (BOOL)srlEnabled
{
  return self->_srlEnable;
}

- (void)setSrlEnabled:(BOOL)a3
{
  self->_srlEnable = a3;
}

- (NRFOutput)output
{
  return (NRFOutput *)self->_delegate;
}

- (int)referenceFrameIndex
{
  return self->_cntBracketSampleBuffers;
}

- (BOOL)referenceFrameHasEVMinus
{
  return self->_batchCount;
}

- (void)setReferenceFrameHasEVMinus:(BOOL)a3
{
  LOBYTE(self->_batchCount) = a3;
}

- (NRFProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_semanticStyleProperties);

  return (NRFProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)doRedFaceFix
{
  return BYTE1(self->_batchCount);
}

- (void)setDoRedFaceFix:(BOOL)a3
{
  BYTE1(self->_batchCount) = a3;
}

- (BOOL)enableGreenGhostMitigation
{
  return BYTE2(self->_batchCount);
}

- (void)setEnableGreenGhostMitigation:(BOOL)a3
{
  BYTE2(self->_batchCount) = a3;
}

- (int)batchCount
{
  return self->_deepFusionProcessingMode;
}

- (IBPSemanticStyleProperties)semanticStyleProperties
{
  return (IBPSemanticStyleProperties *)self->_defringingTuningByPortType;
}

- (void)setSemanticStyleProperties:(id)a3
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

- (NSMutableDictionary)defringingTuningByPortType
{
  return (NSMutableDictionary *)self->_tuningParameters;
}

- (void)setDefringingTuningByPortType:(id)a3
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
  return (NSDictionary *)self->_allocatorBackend;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (int)deepFusionProcessingMode
{
  return self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing;
}

- (void)setDeepFusionProcessingMode:(int)a3
{
  self->_int maximumNumberOfReferenceFrameCandidatesToHoldForProcessing = a3;
}

- (int)referenceFrameCandidatesCount
{
  return self->_processingType;
}

- (void)setReferenceFrameCandidatesCount:(int)a3
{
  self->_processingType = a3;
}

- (int)maximumNumberOfReferenceFrameCandidatesToHoldForProcessing
{
  return *(&self->_processingType + 1);
}

- (void)setMaximumNumberOfReferenceFrameCandidatesToHoldForProcessing:(int)a3
{
  *(&self->_processingType + 1) = a3;
}

- (BOOL)skipDenoising
{
  return HIBYTE(self->_batchCount);
}

- (void)setSkipDenoising:(BOOL)a3
{
  HIBYTE(self->_batchCount) = a3;
}

- (FigMetalAllocatorBackend)allocatorBackend
{
  return self[1].super.isa;
}

- (void)setAllocatorBackend:(id)a3
{
}

- (unsigned)processingType
{
  return self->_output;
}

- (void)setProcessingType:(unsigned int)a3
{
  LODWORD(self->_output) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self[1].super.isa, 0);
  objc_storeStrong((id *)&self->_allocatorBackend, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_defringingTuningByPortType, 0);
  objc_destroyWeak((id *)&self->_semanticStyleProperties);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_rawDFSoftLTMMode, 0);
  objc_storeStrong((id *)&self->_post, 0);
  objc_storeStrong((id *)&self->_softLTMStage, 0);
  objc_storeStrong((id *)&self->_rawDFPostDemosaicStage, 0);
  objc_storeStrong((id *)&self->_rawDFInferenceGen, 0);
  objc_storeStrong((id *)&self->_rawDFColorMatchStage, 0);
  objc_storeStrong((id *)&self->_rawDFDownsampleStage, 0);
  objc_storeStrong((id *)&self->_rawDFProxyStage, 0);
  objc_storeStrong((id *)&self->_rawDFSyntheticReferenceStage, 0);
  objc_storeStrong((id *)&self->_rawDFZoomStage, 0);
  objc_storeStrong((id *)&self->_rawDFLumaSharpenStage, 0);
  objc_storeStrong((id *)&self->_rawDFPowerBlurStage, 0);
  objc_storeStrong((id *)&self->_gainMapStage, 0);
  objc_storeStrong((id *)&self->_flickerDetection, 0);
  objc_storeStrong((id *)&self->_grayGhostDetection, 0);
  objc_storeStrong((id *)&self->_motionDetection, 0);
  objc_storeStrong((id *)&self->_warpStage, 0);
  objc_storeStrong((id *)&self->_draftDemosaicStage, 0);
  objc_storeStrong((id *)&self->_demosaicStage, 0);
  objc_storeStrong((id *)&self->_rawDFCommon, 0);
  objc_storeStrong((id *)&self->_lscGainsTex, 0);
  objc_storeStrong((id *)&self->_deepFusionOutput, 0);
  objc_storeStrong((id *)&self->_nrfConfig, 0);
  objc_storeStrong((id *)&self->_sidecar, 0);
  objc_storeStrong((id *)&self->_lscGainsPlist, 0);
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_registrationPipelineRWPP, 0);
  objc_storeStrong((id *)&self->_regWarpInputTex, 0);
  objc_storeStrong((id *)&self->_nrfPlist, 0);
  objc_storeStrong((id *)&self->_colorConvertStage, 0);
  objc_storeStrong((id *)&self->_sharedRegWarpBuffer, 0);
  objc_storeStrong((id *)&self->_sharedMetalBuffer, 0);
  objc_storeStrong((id *)&self->_tuningParamsPlist, 0);

  objc_storeStrong((id *)&self->_tuningParams, 0);
}

- (int)prepareTuning:(id)a3
{
  uint64_t v213 = *MEMORY[0x263EF8340];
  int v4 = objc_msgSend(a3, "cmi_dictionary");
  int v5 = (NSMutableDictionary *)objc_opt_new();
  tuningParams = self->_tuningParams;
  self->_tuningParams = v5;

  if (!self->_tuningParams
    || ([v4 objectForKeyedSubscript:@"DefaultSensorIDs"],
        (int v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    unsigned int v205 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    id v168 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT);
    int v11 = -73278;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_248;
  }
  long long v202 = 0u;
  long long v203 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v200 objects:v212 count:16];
  if (!v9)
  {
    int v11 = 0;
    goto LABEL_247;
  }
  uint64_t v10 = v9;
  int v11 = 0;
  uint64_t v177 = *(void *)v201;
  v186 = self;
  v172 = v4;
  id v173 = v8;
  while (2)
  {
    uint64_t v12 = 0;
    uint64_t v174 = v10;
LABEL_6:
    if (*(void *)v201 != v177) {
      objc_enumerationMutation(v8);
    }
    uint64_t v13 = *(void **)(*((void *)&v200 + 1) + 8 * v12);
    char v14 = objc_msgSend(v8, "objectForKeyedSubscript:", v13, v169, v170);
    if (!v14)
    {
      FigDebugAssert3();
      unsigned int v205 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v162 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v163 = v205;
      if (os_log_type_enabled(v162, type)) {
        unsigned int v164 = v163;
      }
      else {
        unsigned int v164 = v163 & 0xFFFFFFFE;
      }
      if (v164)
      {
        int v206 = 136315138;
        v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      goto LABEL_261;
    }
    uint64_t v181 = v12;
    uint64_t v15 = NSNumber;
    id v16 = v14;
    uint64_t v17 = objc_msgSend(v15, "numberWithUnsignedLongLong:", strtoull((const char *)objc_msgSend(v16, "UTF8String"), 0, 16));
    if (!v17)
    {
      FigDebugAssert3();
      unsigned int v205 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v165 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v166 = v205;
      if (os_log_type_enabled(v165, type)) {
        unsigned int v167 = v166;
      }
      else {
        unsigned int v167 = v166 & 0xFFFFFFFE;
      }
      if (v167)
      {
        int v206 = 136315138;
        v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_261:
      int v11 = -73278;
      break;
    }
    BOOL v18 = (void *)v17;
    uint64_t v19 = [v4 objectForKeyedSubscript:v13];
    v182 = [v19 objectForKeyedSubscript:v16];
    v185 = [v182 objectForKeyedSubscript:@"DeepFusionParameters"];
    id v183 = v19;
    if (!v185
      || (long long v198 = 0u,
          long long v199 = 0u,
          long long v196 = 0u,
          long long v197 = 0u,
          (uint64_t v178 = [&unk_270E97E88 countByEnumeratingWithState:&v196 objects:v211 count:16]) == 0))
    {
      int v91 = 1;
      goto LABEL_235;
    }
    id v179 = v16;
    uint64_t v180 = *(void *)v197;
    id v189 = v18;
    uint64_t v175 = v13;
LABEL_13:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v197 != v180) {
        objc_enumerationMutation(&unk_270E97E88);
      }
      uint64_t v184 = v20;
      double v21 = *(void **)(*((void *)&v196 + 1) + 8 * v20);
      char v22 = (void *)MEMORY[0x263E64AA0]();
      if (!isCompatibleSensorPortAndRawDFTuningType(v13, v21)) {
        goto LABEL_69;
      }
      double v23 = loadCombinedTuningWithDict(v185, v21, @"Proxy");
      if (!v23) {
        break;
      }
      long long v194 = 0u;
      long long v195 = 0u;
      long long v192 = 0u;
      long long v193 = 0u;
      id v24 = v23;
      uint64_t v190 = [v24 countByEnumeratingWithState:&v192 objects:v210 count:16];
      if (!v190) {
        goto LABEL_68;
      }
      int v176 = v22;
      v187 = v24;
      uint64_t v188 = *(void *)v193;
      while (2)
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v193 != v188) {
            objc_enumerationMutation(v24);
          }
          long long v26 = *(__CFString **)(*((void *)&v192 + 1) + 8 * v25);
          uint64_t v27 = [v24 objectForKeyedSubscript:v26];
          if (!v27)
          {
            unsigned int v205 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            int v92 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v93 = v205;
            if (os_log_type_enabled(v92, type)) {
              unsigned int v94 = v93;
            }
            else {
              unsigned int v94 = v93 & 0xFFFFFFFE;
            }
            if (v94)
            {
              int v206 = 136315394;
              v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
              __int16 v208 = 2112;
              v209 = v26;
              LODWORD(v170) = 22;
              float v169 = &v206;
              _os_log_send_and_compose_impl();
            }
            int v4 = v172;
            id v8 = v173;
            uint64_t v10 = v174;
            id v16 = v179;
            char v155 = v176;
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            int v11 = -73278;
            goto LABEL_233;
          }
          double v28 = (void *)v27;
          int v29 = objc_opt_new();
          if (!v29)
          {
            unsigned int v205 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            double v95 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v96 = v205;
            if (os_log_type_enabled(v95, type)) {
              unsigned int v97 = v96;
            }
            else {
              unsigned int v97 = v96 & 0xFFFFFFFE;
            }
            int v4 = v172;
            id v16 = v179;
            if (v97)
            {
              int v206 = 136315138;
              v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
              LODWORD(v170) = 12;
              float v169 = &v206;
              _os_log_send_and_compose_impl();
            }
            goto LABEL_215;
          }
          uint64_t v30 = [v28 objectForKeyedSubscript:@"DenoiseAndSharpening"];
          if (!v30)
          {
            unsigned int v205 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            double v95 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v98 = v205;
            if (os_log_type_enabled(v95, type)) {
              unsigned int v99 = v98;
            }
            else {
              unsigned int v99 = v98 & 0xFFFFFFFE;
            }
            if (v99)
            {
              int v206 = 136315138;
              v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
              LODWORD(v170) = 12;
              float v169 = &v206;
              _os_log_send_and_compose_impl();
            }
            int v4 = v172;
            id v16 = v179;
            id v24 = v187;
LABEL_215:
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            int v11 = -73278;
            goto LABEL_231;
          }
          unint64_t v31 = (void *)v30;
          __int16 v32 = objc_opt_new();
          double v33 = [v31 objectForKeyedSubscript:@"ProxyAssetEV0RefParameters"];
          int v11 = [v32 readPlist:v33];

          if (v11)
          {
            uint64_t v170 = v171;
            LODWORD(v169) = v11;
            FigDebugAssert3();
            unsigned int v205 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            v100 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v101 = v205;
            if (os_log_type_enabled(v100, type)) {
              unsigned int v102 = v101;
            }
            else {
              unsigned int v102 = v101 & 0xFFFFFFFE;
            }
            if (v102)
            {
              int v206 = 136315394;
              v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
              __int16 v208 = 2112;
              v209 = @"ProxyAssetEV0RefParameters";
              LODWORD(v170) = 22;
              float v169 = &v206;
              goto LABEL_98;
            }
LABEL_152:
            int v4 = v172;
            id v16 = v179;
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            goto LABEL_226;
          }
          int v34 = (void *)v29[8];
          v29[8] = v32;

          __int16 v32 = objc_opt_new();
          int v35 = [v31 objectForKeyedSubscript:@"ProxyAssetEVMRefParameters"];
          int v11 = [v32 readPlist:v35];

          if (v11)
          {
            uint64_t v170 = v171;
            LODWORD(v169) = v11;
            FigDebugAssert3();
            unsigned int v205 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            v100 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v103 = v205;
            if (os_log_type_enabled(v100, type)) {
              unsigned int v104 = v103;
            }
            else {
              unsigned int v104 = v103 & 0xFFFFFFFE;
            }
            if (v104)
            {
              int v206 = 136315394;
              v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
              __int16 v208 = 2112;
              v209 = @"ProxyAssetEVMRefParameters";
              LODWORD(v170) = 22;
              float v169 = &v206;
LABEL_98:
              _os_log_send_and_compose_impl();
            }
            goto LABEL_152;
          }
          int v36 = (void *)v29[9];
          v29[9] = v32;

          int v37 = objc_opt_new();
          int32x2_t v38 = [v28 objectForKeyedSubscript:@"PowerBlur"];

          if (!v38)
          {
            unsigned int v205 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            unint64_t v105 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v106 = v205;
            if (os_log_type_enabled(v105, type)) {
              unsigned int v107 = v106;
            }
            else {
              unsigned int v107 = v106 & 0xFFFFFFFE;
            }
            if (v107)
            {
              int v206 = 136315138;
              v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
              LODWORD(v170) = 12;
              float v169 = &v206;
              _os_log_send_and_compose_impl();
            }
            int v4 = v172;
            id v16 = v179;
            id v24 = v187;
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            int v11 = -73278;
            goto LABEL_217;
          }
          int v39 = [v37 readPlist:v38];
          if (v39)
          {
            uint64_t v170 = v171;
            LODWORD(v169) = v39;
            FigDebugAssert3();
            int v11 = FigSignalErrorAt();
            int v4 = v172;
            id v16 = v179;
            id v24 = v187;
LABEL_217:

            goto LABEL_231;
          }
          unsigned int v40 = (void *)v29[16];
          v29[16] = v37;

          int v41 = objc_opt_new();
          uint64_t v42 = [v28 objectForKeyedSubscript:@"YSH"];

          if (!v42)
          {
            unsigned int v205 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            simd_float3x3 v108 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v109 = v205;
            if (os_log_type_enabled(v108, type)) {
              unsigned int v110 = v109;
            }
            else {
              unsigned int v110 = v109 & 0xFFFFFFFE;
            }
            if (v110)
            {
              int v206 = 136315138;
              v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
              LODWORD(v170) = 12;
              float v169 = &v206;
              _os_log_send_and_compose_impl();
            }
            int v4 = v172;
            id v16 = v179;
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            int v11 = -73278;
            goto LABEL_219;
          }
          int v43 = [v41 readPlist:v42];
          if (v43)
          {
            uint64_t v170 = v171;
            LODWORD(v169) = v43;
            FigDebugAssert3();
            int v11 = FigSignalErrorAt();
            int v4 = v172;
            id v16 = v179;
LABEL_219:

            goto LABEL_226;
          }
          char v44 = (void *)v29[17];
          v29[17] = v41;

          int v45 = objc_opt_new();
          uint64_t v46 = [v28 objectForKeyedSubscript:@"SyntheticReference"];
          id v47 = [v46 objectForKeyedSubscript:@"Default"];

          if (!v47)
          {
            unsigned int v205 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            v111 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v112 = v205;
            if (os_log_type_enabled(v111, type)) {
              unsigned int v113 = v112;
            }
            else {
              unsigned int v113 = v112 & 0xFFFFFFFE;
            }
            if (v113)
            {
              int v206 = 136315138;
              v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
              LODWORD(v170) = 12;
              float v169 = &v206;
              _os_log_send_and_compose_impl();
            }
            int v4 = v172;
            id v16 = v179;
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            int v11 = -73278;
            goto LABEL_221;
          }
          int v48 = [v45 readPlist:v47];
          if (v48)
          {
            uint64_t v170 = v171;
            LODWORD(v169) = v48;
            FigDebugAssert3();
            int v11 = FigSignalErrorAt();
            int v4 = v172;
            id v16 = v179;
LABEL_221:

            goto LABEL_226;
          }
          __int16 v49 = (void *)v29[7];
          v29[7] = v45;

          double v50 = objc_opt_new();
          int v51 = [v28 objectForKeyedSubscript:@"ToneMapping"];
          id v52 = [v51 objectForKeyedSubscript:@"DefaultUBModeParameters"];

          if (!v52)
          {
            unsigned int v205 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            v114 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v115 = v205;
            if (os_log_type_enabled(v114, type)) {
              unsigned int v116 = v115;
            }
            else {
              unsigned int v116 = v115 & 0xFFFFFFFE;
            }
            if (v116)
            {
              int v206 = 136315138;
              v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
              LODWORD(v170) = 12;
              float v169 = &v206;
              _os_log_send_and_compose_impl();
            }
            int v4 = v172;
            id v16 = v179;
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            int v11 = -73278;
            goto LABEL_224;
          }
          int v53 = [v50 readPlist:v52];
          if (v53)
          {
            int v11 = v53;
            uint64_t v170 = v171;
            LODWORD(v169) = v53;
            FigDebugAssert3();
            unsigned int v205 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            uint64_t v117 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v118 = v205;
            if (os_log_type_enabled(v117, type)) {
              unsigned int v119 = v118;
            }
            else {
              unsigned int v119 = v118 & 0xFFFFFFFE;
            }
            if (v119)
            {
              int v206 = 136315138;
              v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
              LODWORD(v170) = 12;
              float v169 = &v206;
              _os_log_send_and_compose_impl();
            }
            int v4 = v172;
            id v16 = v179;
            fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_224:
            goto LABEL_225;
          }
          unsigned int v54 = (void *)v29[6];
          v29[6] = v50;

          id v55 = objc_opt_new();
          uint64_t v56 = [v28 objectForKeyedSubscript:@"SemanticStyles"];
          int v57 = [v56 objectForKeyedSubscript:@"Default"];

          if (!v57)
          {
            unsigned int v205 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            v120 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v121 = v205;
            if (os_log_type_enabled(v120, type)) {
              unsigned int v122 = v121;
            }
            else {
              unsigned int v122 = v121 & 0xFFFFFFFE;
            }
            if (v122)
            {
              int v206 = 136315138;
              v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
              LODWORD(v170) = 12;
              float v169 = &v206;
              goto LABEL_188;
            }
LABEL_189:
            int v4 = v172;
            id v16 = v179;
            goto LABEL_229;
          }
          int v58 = [v55 readPlist:v57];
          if (v58)
          {
            int v11 = v58;
            uint64_t v170 = v171;
            LODWORD(v169) = v58;
            FigDebugAssert3();
            unsigned int v205 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            v123 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v124 = v205;
            if (os_log_type_enabled(v123, type)) {
              unsigned int v125 = v124;
            }
            else {
              unsigned int v125 = v124 & 0xFFFFFFFE;
            }
            int v4 = v172;
            id v16 = v179;
            if (v125)
            {
              int v206 = 136315138;
              v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
              LODWORD(v170) = 12;
              float v169 = &v206;
              _os_log_send_and_compose_impl();
            }
            goto LABEL_227;
          }
          unint64_t v59 = (void *)v29[13];
          v29[13] = v55;

          long long v60 = [v28 objectForKeyedSubscript:@"GainMap"];
          id v61 = [v60 objectForKeyedSubscript:@"Default"];

          int v62 = [[GainMapPlist alloc] initWithParams:v61];
          unint64_t v63 = (void *)v29[11];
          v29[11] = v62;

          if (!v29[11])
          {
            unsigned int v205 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            unint64_t v126 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v127 = v205;
            if (os_log_type_enabled(v126, type)) {
              unsigned int v128 = v127;
            }
            else {
              unsigned int v128 = v127 & 0xFFFFFFFE;
            }
            if (v128)
            {
              int v206 = 136315138;
              v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
              LODWORD(v170) = 12;
              float v169 = &v206;
              _os_log_send_and_compose_impl();
            }
            int v4 = v172;
            id v16 = v179;
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            int v11 = -73278;
            goto LABEL_226;
          }
          id v55 = objc_opt_new();
          id v64 = [v28 objectForKeyedSubscript:@"NoiseModel"];
          int v57 = [v64 objectForKeyedSubscript:@"DefaultUBModeParameters"];

          if (!v57)
          {
            unsigned int v205 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            v120 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v129 = v205;
            if (os_log_type_enabled(v120, type)) {
              unsigned int v130 = v129;
            }
            else {
              unsigned int v130 = v129 & 0xFFFFFFFE;
            }
            int v4 = v172;
            id v16 = v179;
            if (v130)
            {
              int v206 = 136315138;
              v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
              LODWORD(v170) = 12;
              float v169 = &v206;
              _os_log_send_and_compose_impl();
            }
LABEL_229:
            id v24 = v187;
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            int v11 = -73278;
LABEL_230:

LABEL_231:
            char v155 = v176;
LABEL_232:

            id v8 = v173;
            uint64_t v10 = v174;
LABEL_233:
            BOOL v18 = v189;
            goto LABEL_234;
          }
          int v65 = [v55 readPlist:v57];
          if (v65)
          {
            int v11 = v65;
            uint64_t v170 = v171;
            LODWORD(v169) = v65;
            FigDebugAssert3();
            unsigned int v205 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            v123 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v131 = v205;
            if (os_log_type_enabled(v123, type)) {
              unsigned int v132 = v131;
            }
            else {
              unsigned int v132 = v131 & 0xFFFFFFFE;
            }
            if (v132)
            {
              int v206 = 136315138;
              v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
              LODWORD(v170) = 12;
              float v169 = &v206;
              goto LABEL_195;
            }
LABEL_196:
            int v4 = v172;
            id v16 = v179;
LABEL_227:
            id v24 = v187;
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            goto LABEL_230;
          }
          int v66 = (void *)v29[5];
          v29[5] = v55;

          id v52 = [v28 objectForKeyedSubscript:@"QDEM"];

          if (v52)
          {
            uint64_t v67 = objc_opt_new();
            unint64_t v68 = v67;
            if (!v67)
            {
              unsigned int v205 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              unsigned int v133 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v134 = v205;
              if (os_log_type_enabled(v133, type)) {
                unsigned int v135 = v134;
              }
              else {
                unsigned int v135 = v134 & 0xFFFFFFFE;
              }
              if (v135)
              {
                int v206 = 136315138;
                v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
                LODWORD(v170) = 12;
                float v169 = &v206;
                goto LABEL_202;
              }
              goto LABEL_203;
            }
            int v69 = [v67 readPlist:v52];
            if (v69)
            {
              int v11 = v69;
              uint64_t v170 = v171;
              LODWORD(v169) = v69;
              FigDebugAssert3();
              unsigned int v205 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              BOOL v136 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v137 = v205;
              if (os_log_type_enabled(v136, type)) {
                unsigned int v138 = v137;
              }
              else {
                unsigned int v138 = v137 & 0xFFFFFFFE;
              }
              if (v138)
              {
                int v206 = 136315138;
                v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
                LODWORD(v170) = 12;
                float v169 = &v206;
                goto LABEL_209;
              }
LABEL_210:
              int v4 = v172;
              id v16 = v179;
              fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_211:
LABEL_225:

LABEL_226:
              char v155 = v176;
              id v24 = v187;
              goto LABEL_232;
            }
            id v70 = (void *)v29[18];
            v29[18] = v68;
          }
          int v57 = [v28 objectForKeyedSubscript:@"Demosaic"];

          if (v57)
          {
            id v71 = objc_opt_new();
            id v55 = v71;
            if (!v71)
            {
              unsigned int v205 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              v120 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v139 = v205;
              if (os_log_type_enabled(v120, type)) {
                unsigned int v140 = v139;
              }
              else {
                unsigned int v140 = v139 & 0xFFFFFFFE;
              }
              if (!v140) {
                goto LABEL_189;
              }
              int v206 = 136315138;
              v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
              LODWORD(v170) = 12;
              float v169 = &v206;
              goto LABEL_188;
            }
            int v72 = [v71 readPlist:v57];
            if (v72)
            {
              int v11 = v72;
              uint64_t v170 = v171;
              LODWORD(v169) = v72;
              FigDebugAssert3();
              unsigned int v205 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              v123 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v141 = v205;
              if (os_log_type_enabled(v123, type)) {
                unsigned int v142 = v141;
              }
              else {
                unsigned int v142 = v141 & 0xFFFFFFFE;
              }
              if (!v142) {
                goto LABEL_196;
              }
              int v206 = 136315138;
              v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
              LODWORD(v170) = 12;
              float v169 = &v206;
              goto LABEL_195;
            }
            long long v73 = (void *)v29[19];
            v29[19] = v55;
          }
          id v52 = [v28 objectForKeyedSubscript:@"PostDemosaic"];

          if (v52)
          {
            id v74 = objc_opt_new();
            unint64_t v68 = v74;
            if (!v74)
            {
              unsigned int v205 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              unsigned int v133 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v143 = v205;
              if (os_log_type_enabled(v133, type)) {
                unsigned int v144 = v143;
              }
              else {
                unsigned int v144 = v143 & 0xFFFFFFFE;
              }
              if (v144)
              {
                int v206 = 136315138;
                v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
                LODWORD(v170) = 12;
                float v169 = &v206;
                goto LABEL_202;
              }
              goto LABEL_203;
            }
            int v75 = [v74 readPlist:v52];
            if (v75)
            {
              int v11 = v75;
              uint64_t v170 = v171;
              LODWORD(v169) = v75;
              FigDebugAssert3();
              unsigned int v205 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              BOOL v136 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v145 = v205;
              if (os_log_type_enabled(v136, type)) {
                unsigned int v146 = v145;
              }
              else {
                unsigned int v146 = v145 & 0xFFFFFFFE;
              }
              if (!v146) {
                goto LABEL_210;
              }
              int v206 = 136315138;
              v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
              LODWORD(v170) = 12;
              float v169 = &v206;
LABEL_209:
              _os_log_send_and_compose_impl();
              goto LABEL_210;
            }
            unsigned int v76 = (void *)v29[20];
            v29[20] = v68;
          }
          int v57 = [v28 objectForKeyedSubscript:@"MIWBParameters"];

          if (v57)
          {
            unsigned __int8 v77 = objc_opt_new();
            id v55 = v77;
            if (v77)
            {
              int v78 = [v77 readPlist:v57];
              if (!v78)
              {
                int32x2_t v79 = (void *)v29[23];
                v29[23] = v55;

                goto LABEL_57;
              }
              int v11 = v78;
              uint64_t v170 = v171;
              LODWORD(v169) = v78;
              FigDebugAssert3();
              unsigned int v205 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              v123 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v149 = v205;
              if (os_log_type_enabled(v123, type)) {
                unsigned int v150 = v149;
              }
              else {
                unsigned int v150 = v149 & 0xFFFFFFFE;
              }
              if (!v150) {
                goto LABEL_196;
              }
              int v206 = 136315138;
              v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
              LODWORD(v170) = 12;
              float v169 = &v206;
LABEL_195:
              _os_log_send_and_compose_impl();
              goto LABEL_196;
            }
            unsigned int v205 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            v120 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v147 = v205;
            if (os_log_type_enabled(v120, type)) {
              unsigned int v148 = v147;
            }
            else {
              unsigned int v148 = v147 & 0xFFFFFFFE;
            }
            if (!v148) {
              goto LABEL_189;
            }
            int v206 = 136315138;
            v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
            LODWORD(v170) = 12;
            float v169 = &v206;
LABEL_188:
            _os_log_send_and_compose_impl();
            goto LABEL_189;
          }
LABEL_57:
          id v52 = [v28 objectForKeyedSubscript:@"OutputNoiseModel"];

          if (!v52) {
            goto LABEL_61;
          }
          unsigned int v80 = objc_opt_new();
          unint64_t v68 = v80;
          if (!v80)
          {
            unsigned int v205 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            unsigned int v133 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v151 = v205;
            if (os_log_type_enabled(v133, type)) {
              unsigned int v152 = v151;
            }
            else {
              unsigned int v152 = v151 & 0xFFFFFFFE;
            }
            if (v152)
            {
              int v206 = 136315138;
              v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
              LODWORD(v170) = 12;
              float v169 = &v206;
LABEL_202:
              _os_log_send_and_compose_impl();
            }
LABEL_203:
            int v4 = v172;
            id v16 = v179;
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            int v11 = -73278;
            goto LABEL_211;
          }
          int v81 = [v80 readPlist:v52];
          if (v81)
          {
            int v11 = v81;
            uint64_t v170 = v171;
            LODWORD(v169) = v81;
            FigDebugAssert3();
            unsigned int v205 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            BOOL v136 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v153 = v205;
            if (os_log_type_enabled(v136, type)) {
              unsigned int v154 = v153;
            }
            else {
              unsigned int v154 = v153 & 0xFFFFFFFE;
            }
            if (!v154) {
              goto LABEL_210;
            }
            int v206 = 136315138;
            v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
            LODWORD(v170) = 12;
            float v169 = &v206;
            goto LABEL_209;
          }
          int v82 = (void *)v29[24];
          v29[24] = v68;

LABEL_61:
          uint64_t v191 = v25;
          long long v83 = [(NSMutableDictionary *)v186->_tuningParams objectForKeyedSubscript:v189];

          if (!v83)
          {
            id v84 = objc_opt_new();
            [(NSMutableDictionary *)v186->_tuningParams setObject:v84 forKeyedSubscript:v189];
          }
          double v85 = [(NSMutableDictionary *)v186->_tuningParams objectForKeyedSubscript:v189];
          __int16 v86 = [v85 objectForKeyedSubscript:v21];

          if (!v86)
          {
            BOOL v87 = objc_opt_new();
            __int16 v88 = [(NSMutableDictionary *)v186->_tuningParams objectForKeyedSubscript:v189];
            [v88 setObject:v87 forKeyedSubscript:v21];
          }
          int v89 = [(NSMutableDictionary *)v186->_tuningParams objectForKeyedSubscript:v189];
          __int16 v90 = [v89 objectForKeyedSubscript:v21];
          [v90 setObject:v29 forKeyedSubscript:v26];

          ++v25;
          id v24 = v187;
        }
        while (v190 != v191 + 1);
        uint64_t v190 = [v187 countByEnumeratingWithState:&v192 objects:v210 count:16];
        if (v190) {
          continue;
        }
        break;
      }
      int v11 = 0;
      int v4 = v172;
      id v8 = v173;
      uint64_t v10 = v174;
      BOOL v18 = v189;
      char v22 = v176;
LABEL_68:

      uint64_t v13 = v175;
LABEL_69:
      uint64_t v20 = v184 + 1;
      id v16 = v179;
      if (v184 + 1 == v178)
      {
        int v91 = 1;
        uint64_t v178 = [&unk_270E97E88 countByEnumeratingWithState:&v196 objects:v211 count:16];
        if (!v178) {
          goto LABEL_235;
        }
        goto LABEL_13;
      }
    }
    int v156 = v22;
    unsigned int v205 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int v157 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v158 = v205;
    if (os_log_type_enabled(v157, type)) {
      unsigned int v159 = v158;
    }
    else {
      unsigned int v159 = v158 & 0xFFFFFFFE;
    }
    id v16 = v179;
    if (v159)
    {
      int v206 = 136315138;
      v207 = "-[RawDFProcessor(Tuning) prepareTuning:]";
      LODWORD(v170) = 12;
      float v169 = &v206;
      _os_log_send_and_compose_impl();
    }
    BOOL v18 = v189;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v11 = -73278;
    char v155 = v156;
LABEL_234:
    int v91 = 0;
LABEL_235:

    if (v91)
    {
      uint64_t v12 = v181 + 1;
      if (v181 + 1 == v10)
      {
        uint64_t v160 = [v8 countByEnumeratingWithState:&v200 objects:v212 count:16];
        uint64_t v10 = v160;
        if (!v160) {
          break;
        }
        continue;
      }
      goto LABEL_6;
    }
    break;
  }
LABEL_247:

LABEL_248:
  return v11;
}

@end