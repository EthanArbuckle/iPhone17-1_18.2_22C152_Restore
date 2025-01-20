@interface NRFProcessorV2
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
- (CGRect)_downscaleRoiForRegistration:(CGRect)a3;
- (IBPSemanticStyleProperties)semanticStyleProperties;
- (MTLCommandQueue)metalCommandQueue;
- (NRFOutput)output;
- (NRFProcessorDelegate)delegate;
- (NRFProcessorV2)init;
- (NRFProcessorV2)initWithCommandQueue:(id)a3;
- (NRFProgressiveBracketingParameters)progressiveBracketingParameters;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (NSMutableDictionary)defringingTuningByPortType;
- (NSMutableDictionary)tuningParams;
- (NSMutableDictionary)tuningParamsPlist;
- (NSString)description;
- (id)getProcessingTypeKey:(frameProperties_t *)a3;
- (id)newMTLBufferWithLength:(unint64_t)a3;
- (id)sharedMetalBuffer;
- (id)sharedRegWarpBuffer;
- (int)_appendFrames:(opaqueCMSampleBuffer *)a3 cfp:(frameProperties_t *)a4;
- (int)_bindRegWarpPPWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5;
- (int)_computeBlurryFrameWeight:(int)a3;
- (int)_computeCornersStrengthWithBracketIndex:(unsigned int)a3 totalCornerStrength:(float *)a4;
- (int)_computeMetricsForReferenceFrameSelection:(int)a3;
- (int)_computeReferenceFrameIndex;
- (int)_deepFusion;
- (int)_deepFusionSetWarpReference:(int)a3;
- (int)_deepFusionSetWarpReferenceSIFR;
- (int)_doDeepFusionSytheticRefererenceAndProxy;
- (int)_downsampleImageForRegistration:(__CVBuffer *)a3 outputImage:(__CVBuffer *)a4;
- (int)_getSharpestBracket:(int)a3 normGyroScores:(float *)a4 normCornerScores:(float *)a5 normFocusScores:(float *)a6 normBlinkScores:(float *)a7 useLongWeights:(unsigned __int8)a8 sharpFrameIndex:(int *)a9;
- (int)_lowLightGreenGhostPerFrameProcessing;
- (int)_lowLightMotionDetection;
- (int)_multiFrameProcessing:(BOOL)a3;
- (int)_nrfFuseImages:(BOOL)a3;
- (int)_perFrameProcessing:(id)a3 input:(opaqueCMSampleBuffer *)a4 cfp:(frameProperties_t *)a5;
- (int)_perFrameProcessingComputeReferenceFrameIndexIfReady;
- (int)_populateDeepFusionMetadata:(id)a3;
- (int)_process:(BOOL)a3;
- (int)_processInferenceImage:(__CVBuffer *)a3 sourceFrameType:(int)a4 sourceFrameIndex:(int)a5 ltcFrameIndex:(int)a6 gtcFrameIndex:(int)a7 originalWidth:(unint64_t)a8 originalHeight:(unint64_t)a9;
- (int)_processSIFRandRefEV0IfPossible:(int)a3;
- (int)_registerImages:(BOOL)a3;
- (int)_setupFusionConfig;
- (int)addFrame:(opaqueCMSampleBuffer *)a3;
- (int)allocateResources:(id *)a3;
- (int)batchCount;
- (int)bindResourcesForProcessingType:(unsigned int)a3 prepareDescriptor:(id)a4;
- (int)cntBracketSampleBuffers;
- (int)determineWorkingBufferRequirementsToProcess:(unsigned int)a3 prepareDescriptor:(id)a4 nrfConfig:(id)a5 denoiseFusePipelineSize:(unint64_t *)a6 rwppSize:(unint64_t *)a7 rwppInputWidth:(unint64_t *)a8 rwppInputHeight:(unint64_t *)a9;
- (int)determineWorkingBufferRequirementsWithOptions:(id)a3 memoryAllocationInfo:(id *)a4;
- (int)determineWorkingBufferRequirementsWithOptions:(id)a3 nrfConfig:(id)a4 memoryAllocationInfo:(id *)a5;
- (int)finishProcessing;
- (int)fusionMode;
- (int)getOptions:(id)a3;
- (int)initFrameProperties:(frameProperties_t *)a3 metadata:(id)a4 pixelBuffer:(__CVBuffer *)a5;
- (int)maximumNumberOfReferenceFrameCandidatesToHoldForProcessing;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prepareToProcess:(unsigned int)a3 prepareDescriptor:(id)a4;
- (int)prewarm;
- (int)process;
- (int)progressiveBatchSize;
- (int)purgeResources;
- (int)referenceFrameCandidatesCount;
- (int)referenceFrameIndex;
- (int)resetInternalState;
- (int)resetState;
- (int)setup;
- (int)setupWithOptions:(id)a3;
- (int)updateEV0ReferenceFrameIfNecessary;
- (int)verifyIOSurfaceCompression:(__IOSurface *)a3;
- (unsigned)processingType;
- (void)_deepFusionInvalidatePyramids;
- (void)_deepFusionResetWarpTransforms;
- (void)_deepFusionRevertWarpToDefault;
- (void)_prepareOutputMetadata;
- (void)addToSidecar:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)finishScheduling;
- (void)injectReferenceIfNeeded;
- (void)releaseStoredReference;
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
- (void)setSemanticStyleProperties:(id)a3;
- (void)setSharedMetalBuffer:(id)a3;
- (void)setSharedRegWarpBuffer:(id)a3;
- (void)setSkipDenoising:(BOOL)a3;
- (void)setSrlEnabled:(BOOL)a3;
- (void)setTuningParameters:(id)a3;
- (void)setTuningParams:(id)a3;
- (void)setTuningParamsPlist:(id)a3;
- (void)storeReferenceIfNeeded;
@end

@implementation NRFProcessorV2

- (int)setup
{
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
  self->_batchCount = v3;
}

- (void)setOutput:(id)a3
{
  p_referenceFrameHasEVMinus = &self->_referenceFrameHasEVMinus;
  p_fusionOptions = &self->_fusionOptions;
  id v41 = a3;
  objc_storeStrong((id *)&self->_delegate, a3);
  v7 = (void *)*((void *)p_fusionOptions + 8);
  *((void *)p_fusionOptions + 8) = 0;

  v8 = (void *)*((void *)p_fusionOptions + 9);
  *((void *)p_fusionOptions + 9) = 0;

  v9 = *(void **)p_referenceFrameHasEVMinus;
  *(void *)p_referenceFrameHasEVMinus = 0;

  v13 = objc_msgSend_allocator(*(void **)p_fusionOptions, v10, v11, v12);
  objc_msgSend_purgeResources_(v13, v14, 0, v15);

  v18 = v41;
  if (v41)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)p_fusionOptions + 8, a3);
      v22 = (__CVBuffer *)objc_msgSend_pixelBuffer(*((void **)p_fusionOptions + 8), v19, v20, v21);
      IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(v22);
      v27 = objc_msgSend_device(*(void **)p_fusionOptions, v24, v25, v26);
      uint64_t v30 = objc_msgSend_newBufferWithIOSurface_(v27, v28, (uint64_t)IOSurface, v29);
      v31 = *(void **)p_referenceFrameHasEVMinus;
      *(void *)p_referenceFrameHasEVMinus = v30;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v18 = v41;
      if ((isKindOfClass & 1) == 0) {
        goto LABEL_7;
      }
      id v33 = v41;
      v27 = (void *)*((void *)p_fusionOptions + 9);
      *((void *)p_fusionOptions + 9) = v33;
    }

    v18 = v41;
  }
LABEL_7:
  v34 = objc_msgSend_completionStatus(v18, (const char *)v18, v16, v17);
  v38 = objc_msgSend_metalExecutionStatus(v34, v35, v36, v37);
  objc_msgSend_setExecutionStatus_(*(void **)p_fusionOptions, v39, (uint64_t)v38, v40);
}

- (BOOL)shouldDownsampleRWPPInputWithPixelFormat:(unsigned int)a3 processingType:(unsigned int)a4
{
  if (!*(void *)&self->_registrationPipelineRWPPConfig.numThreads && !self->_regWarpM2M) {
    return 0;
  }
  BOOL result = 0;
  if (a4 && a4 != 7)
  {
    BOOL result = 0;
    if ((int)a3 <= 1751527983)
    {
      if (a3 == 645424688 || a3 == 762865200) {
        return 1;
      }
      int v5 = 796419632;
    }
    else
    {
      if ((int)a3 <= 2019963439)
      {
        if (a3 != 1751527984)
        {
          int v5 = 1885745712;
          goto LABEL_15;
        }
        return 1;
      }
      if (a3 == 2088265264) {
        return 1;
      }
      int v5 = 2019963440;
    }
LABEL_15:
    if (a3 != v5) {
      return result;
    }
    return 1;
  }
  return result;
}

- (int)initFrameProperties:(frameProperties_t *)a3 metadata:(id)a4 pixelBuffer:(__CVBuffer *)a5
{
  p_referenceFrameCandidatesCount = &self->_referenceFrameCandidatesCount;
  id v9 = a4;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a5);
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a5, 0);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a5, 0);
  int v13 = *p_referenceFrameCandidatesCount;
  int v14 = p_referenceFrameCandidatesCount[4];
  if (v14) {
    BOOL v15 = v14 == 7;
  }
  else {
    BOOL v15 = 1;
  }
  int v16 = !v15;
  uint64_t v17 = v9;
  int v18 = sub_262F98A38(v9, (uint64_t)a3, WidthOfPlane, HeightOfPlane, v16);
  if (v18)
  {
    int v70 = v18;
    FigDebugAssert3();
    goto LABEL_47;
  }
  uint64_t v19 = 0;
  p_y = (char *)&a3[1].meta.ROI.origin.y;
  p_RG = &self->_bracketProperties[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[3].RG;
  *(_OWORD *)&a3[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].BB.mid = xmmword_263017830;
  *(_OWORD *)&a3[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].RB.shadows = xmmword_263017840;
  *(void *)&a3[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].GG.highlights = 0x3F80000000000000;
  long long v86 = xmmword_263017850;
  long long v87 = xmmword_263017860;
  simd_float4 v89 = 0u;
  simd_float4 v90 = 0u;
  simd_float4 v91 = 0u;
  long long v88 = xmmword_263017870;
  do
  {
    *(float32x4_t *)((char *)&v89 + v19) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_263017880, COERCE_FLOAT(*(long long *)((char *)&v86 + v19))), (float32x4_t)xmmword_263017890, *(float32x2_t *)((char *)&v86 + v19), 1), (float32x4_t)xmmword_2630178A0, *(float32x4_t *)((char *)&v86 + v19), 2);
    v19 += 16;
  }
  while (v19 != 48);
  v92.columns[0] = v89;
  v92.columns[1] = v90;
  v92.columns[2] = v91;
  *(simd_float4 *)&a3[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].RG.mid = v89;
  *(simd_float4 *)&a3[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].GG.shadows = v92.columns[1];
  *(simd_float4 *)&a3[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[0].BR.highlights = v92.columns[2];
  v92.columns[3] = (simd_float4)xmmword_2630178B0;
  simd_float4x4 v93 = __invert_f4(v92);
  *(simd_float4 *)&a3[1].meta.ROI.size.height = v93.columns[0];
  *(simd_float4 *)&a3[1].meta.ltmCurves.ltmLut.version = v93.columns[1];
  *(simd_float4 *)&a3[1].meta.ltmCurves.ltmLut.ccmV1.rightPadding = v93.columns[2];
  *(float *)&a3[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].BR.shadows = 1.0
                                                                      / *(float *)&a3[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].BR.highlights;
  v22 = &a3[1].meta.ltmCurves.ltmLut.bytes[80];
  uint64_t v23 = MEMORY[0x263EF89A0];
  long long v83 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  long long v84 = *MEMORY[0x263EF89A0];
  *(_OWORD *)&a3[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].RR.mid = *MEMORY[0x263EF89A0];
  *(_OWORD *)&a3[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GR.shadows = v83;
  long long v82 = *(_OWORD *)(v23 + 32);
  *(_OWORD *)&a3[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[1].GB.highlights = v82;
  *(_DWORD *)&a3[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].BR.highlights = 1065353216;
  *(_DWORD *)&a3[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[2].BG.mid = 65792;
  uint64_t v24 = *MEMORY[0x263F2F6D0];
  uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v17, v25, *MEMORY[0x263F2F6D0], v26);
  v85 = v17;
  if (!v27)
  {
    if (PixelFormatType != 1751527984) {
      goto LABEL_23;
    }
LABEL_19:
    uint64_t v58 = 0;
    *(_DWORD *)p_y = 2;
    *((_OWORD *)p_y + 10) = xmmword_263017830;
    *((_OWORD *)p_y + 11) = xmmword_263017840;
    *((void *)p_y + 24) = 0x3F80000000000000;
    long long v86 = xmmword_263017850;
    long long v87 = xmmword_263017860;
    long long v88 = xmmword_263017870;
    simd_float4 v89 = 0u;
    simd_float4 v90 = 0u;
    simd_float4 v91 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v89 + v58) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_263117D40, COERCE_FLOAT(*(long long *)((char *)&v86 + v58))), (float32x4_t)xmmword_263117F90, *(float32x2_t *)((char *)&v86 + v58), 1), (float32x4_t)xmmword_263117C90, *(float32x4_t *)((char *)&v86 + v58), 2);
      v58 += 16;
    }
    while (v58 != 48);
    v94.columns[0] = v89;
    v94.columns[1] = v90;
    v94.columns[2] = v91;
    *((simd_float4 *)p_y + 4) = v89;
    *((_OWORD *)p_y + 5) = v94.columns[1];
    *((_OWORD *)p_y + 6) = v94.columns[2];
    v94.columns[3] = (simd_float4)xmmword_2630178B0;
    simd_float4x4 v95 = __invert_f4(v94);
    *((_OWORD *)p_y + 1) = v95.columns[0];
    *((_OWORD *)p_y + 2) = v95.columns[1];
    *((_OWORD *)p_y + 3) = v95.columns[2];
    *((float *)p_y + 50) = 1.0 / *((float *)p_y + 51);
    *((_DWORD *)p_y + 56) = -1;
    v95.columns[1] = (simd_float4)a3->meta.faces[0].rect.size;
    *(CGPoint *)v22 = a3->meta.faces[0].rect.origin;
    *((_OWORD *)v22 + 1) = v95.columns[1];
    *((_OWORD *)v22 + 2) = *(_OWORD *)&a3->meta.faces[0].confidence;
    uint64_t v17 = v85;
    goto LABEL_43;
  }
  uint64_t v30 = (void *)v27;
  uint64_t v81 = v24;
  v31 = a3;
  v32 = &a3[1].meta.ltmCurves.ltmLut.bytes[80];
  id v33 = p_referenceFrameCandidatesCount;
  uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(v17, v28, *MEMORY[0x263F2F3F0], v29);
  if (!v36)
  {

    p_referenceFrameCandidatesCount = v33;
    v22 = v32;
    a3 = v31;
    uint64_t v24 = v81;
    if (PixelFormatType != 1751527984) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  int v80 = v13;
  uint64_t v37 = *MEMORY[0x263F2F388];
  v38 = objc_msgSend_objectForKeyedSubscript_(v17, v34, *MEMORY[0x263F2F388], v35);

  p_referenceFrameCandidatesCount = v33;
  v22 = v32;
  a3 = v31;
  uint64_t v24 = v81;
  if (PixelFormatType == 1751527984) {
    goto LABEL_19;
  }
  if (v38)
  {
    *(_DWORD *)p_y = 2;
    uint64_t v17 = v85;
    id v41 = objc_msgSend_objectForKeyedSubscript_(v85, v39, v37, v40);
    unsigned __int16 v45 = objc_msgSend_intValue(v41, v42, v43, v44);

    v48 = objc_msgSend_objectForKeyedSubscript_(v85, v46, v81, v47);
    int v52 = objc_msgSend_intValue(v48, v49, v50, v51);

    switch(v52)
    {
      case 0:
        uint64_t v53 = 0;
        *((_OWORD *)p_y + 10) = xmmword_263017830;
        *((_OWORD *)p_y + 11) = xmmword_263017840;
        *((void *)p_y + 24) = 0x3F80000000000000;
        float v54 = (float)v45 / 65535.0;
        v55.i32[1] = 0;
        v55.i32[2] = 0;
        v55.f32[0] = 1.0 / (float)(1.0 - v54);
        long long v86 = xmmword_263017850;
        long long v87 = xmmword_263017860;
        long long v88 = xmmword_263017870;
        simd_float4 v89 = 0u;
        simd_float4 v90 = 0u;
        simd_float4 v91 = 0u;
        int v56 = v80;
        v57 = p_RG;
        do
        {
          v55.f32[3] = -(float)(v54 * v55.f32[0]);
          *(float32x4_t *)((char *)&v89 + v53) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v55, COERCE_FLOAT(*(long long *)((char *)&v86 + v53))), (float32x4_t)xmmword_263017890, *(float32x2_t *)((char *)&v86 + v53), 1), (float32x4_t)xmmword_2630178A0, *(float32x4_t *)((char *)&v86 + v53), 2);
          v53 += 16;
        }
        while (v53 != 48);
        goto LABEL_38;
      case 1:
        uint64_t v71 = 0;
        *((_OWORD *)p_y + 10) = xmmword_263017830;
        *((_OWORD *)p_y + 11) = xmmword_263117D30;
        *((void *)p_y + 24) = 0x4000000000000000;
        float v72 = (float)v45 / 65535.0;
        v73.i32[1] = 0;
        v73.i32[2] = 0;
        v73.f32[0] = 1.0 / (float)(1.0 - v72);
        long long v86 = xmmword_263017850;
        long long v87 = xmmword_263017860;
        long long v88 = xmmword_263017870;
        simd_float4 v89 = 0u;
        simd_float4 v90 = 0u;
        simd_float4 v91 = 0u;
        int v56 = v80;
        v57 = p_RG;
        do
        {
          v73.f32[3] = -(float)(v72 * v73.f32[0]);
          *(float32x4_t *)((char *)&v89 + v71) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v73, COERCE_FLOAT(*(long long *)((char *)&v86 + v71))), (float32x4_t)xmmword_263017890, *(float32x2_t *)((char *)&v86 + v71), 1), (float32x4_t)xmmword_2630178A0, *(float32x4_t *)((char *)&v86 + v71), 2);
          v71 += 16;
        }
        while (v71 != 48);
        goto LABEL_38;
      case 2:
        uint64_t v74 = 0;
        *((_OWORD *)p_y + 10) = xmmword_263017910;
        *((_OWORD *)p_y + 11) = xmmword_263017920;
        *((void *)p_y + 24) = 0x400E38E43DCAC083;
        float v75 = (float)v45 / 65535.0;
        v76.i32[1] = 0;
        v76.i32[2] = 0;
        v76.f32[0] = 1.0 / (float)(1.0 - v75);
        long long v86 = xmmword_263017850;
        long long v87 = xmmword_263017860;
        long long v88 = xmmword_263017870;
        simd_float4 v89 = 0u;
        simd_float4 v90 = 0u;
        simd_float4 v91 = 0u;
        int v56 = v80;
        v57 = p_RG;
        do
        {
          v76.f32[3] = -(float)(v75 * v76.f32[0]);
          *(float32x4_t *)((char *)&v89 + v74) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v76, COERCE_FLOAT(*(long long *)((char *)&v86 + v74))), (float32x4_t)xmmword_263017890, *(float32x2_t *)((char *)&v86 + v74), 1), (float32x4_t)xmmword_2630178A0, *(float32x4_t *)((char *)&v86 + v74), 2);
          v74 += 16;
        }
        while (v74 != 48);
LABEL_38:
        v98.columns[0] = v89;
        v98.columns[1] = v90;
        v98.columns[2] = v91;
        *((simd_float4 *)p_y + 4) = v89;
        *((_OWORD *)p_y + 5) = v98.columns[1];
        *((_OWORD *)p_y + 6) = v98.columns[2];
        v98.columns[3] = (simd_float4)xmmword_2630178B0;
        simd_float4x4 v99 = __invert_f4(v98);
        *((_OWORD *)p_y + 1) = v99.columns[0];
        *((_OWORD *)p_y + 2) = v99.columns[1];
        *((_OWORD *)p_y + 3) = v99.columns[2];
        *((float *)p_y + 50) = 1.0 / *((float *)p_y + 51);
        break;
      case 3:
        *((_OWORD *)p_y + 10) = xmmword_2630178C0;
        *((_OWORD *)p_y + 11) = xmmword_2630178D0;
        *((void *)p_y + 24) = 0x4019999A3D6147AELL;
        *((_OWORD *)p_y + 4) = xmmword_2630178E0;
        *((_OWORD *)p_y + 5) = xmmword_2630178F0;
        *((_OWORD *)p_y + 6) = xmmword_263017900;
        *((_DWORD *)p_y + 51) = 1065204301;
        simd_float4x4 v100 = __invert_f4(*(simd_float4x4 *)zmmword_263117FC0);
        *((_OWORD *)p_y + 1) = v100.columns[0];
        *((_OWORD *)p_y + 2) = v100.columns[1];
        *((_OWORD *)p_y + 3) = v100.columns[2];
        *((float *)p_y + 50) = 1.0 / *((float *)p_y + 51);
        p_y[211] = 1;
        int v56 = v80;
        v57 = p_RG;
        break;
      default:
        goto LABEL_32;
    }
    *((_DWORD *)p_y + 56) = v52;
    if (v56 < 1 || v52 == *(_DWORD *)&v57->shadows)
    {
      CGSize size = a3->meta.faces[0].rect.size;
      *(CGPoint *)v22 = a3->meta.faces[0].rect.origin;
      *((CGSize *)v22 + 1) = size;
      *((_OWORD *)v22 + 2) = *(_OWORD *)&a3->meta.faces[0].confidence;
      goto LABEL_43;
    }
LABEL_32:
    FigDebugAssert3();
    int v70 = FigSignalErrorAt();
    goto LABEL_47;
  }
LABEL_23:
  uint64_t v59 = 0;
  *((_OWORD *)p_y + 10) = xmmword_263017830;
  *((_OWORD *)p_y + 11) = xmmword_263017840;
  *((void *)p_y + 24) = 0x3F80000000000000;
  long long v86 = xmmword_263017850;
  long long v87 = xmmword_263017860;
  long long v88 = xmmword_263017870;
  simd_float4 v89 = 0u;
  simd_float4 v90 = 0u;
  simd_float4 v91 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v89 + v59) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_263017880, COERCE_FLOAT(*(long long *)((char *)&v86 + v59))), (float32x4_t)xmmword_263017890, *(float32x2_t *)((char *)&v86 + v59), 1), (float32x4_t)xmmword_2630178A0, *(float32x4_t *)((char *)&v86 + v59), 2);
    v59 += 16;
  }
  while (v59 != 48);
  v96.columns[0] = v89;
  v96.columns[1] = v90;
  v96.columns[2] = v91;
  *((simd_float4 *)p_y + 4) = v89;
  *((_OWORD *)p_y + 5) = v96.columns[1];
  *((_OWORD *)p_y + 6) = v96.columns[2];
  v96.columns[3] = (simd_float4)xmmword_2630178B0;
  simd_float4x4 v97 = __invert_f4(v96);
  *((_OWORD *)p_y + 1) = v97.columns[0];
  *((_OWORD *)p_y + 2) = v97.columns[1];
  *((_OWORD *)p_y + 3) = v97.columns[2];
  *((float *)p_y + 50) = 1.0 / *((float *)p_y + 51);
  *(_OWORD *)v22 = v84;
  *((_OWORD *)v22 + 1) = v83;
  *((_OWORD *)v22 + 2) = v82;
  *((_DWORD *)p_y + 51) = 1065353216;
  *((_DWORD *)p_y + 52) = 65792;
  uint64_t v17 = v85;
  v62 = objc_msgSend_objectForKeyedSubscript_(v85, v60, v24, v61);

  if (v62)
  {
    v65 = objc_msgSend_objectForKeyedSubscript_(v85, v63, v24, v64);
    int v69 = objc_msgSend_intValue(v65, v66, v67, v68);

    if (v69 == 2) {
      goto LABEL_32;
    }
    if (v69 == 1)
    {
      *(_DWORD *)p_y = 1;
      goto LABEL_43;
    }
    if (v69) {
      goto LABEL_32;
    }
  }
  *(_DWORD *)p_y = 0;
  p_y[208] = 1;
LABEL_43:
  int v78 = p_referenceFrameCandidatesCount[4];
  if (v78 == 3)
  {
    p_y[210] = 0;
    *((_WORD *)p_y + 104) = 1;
    int v78 = p_referenceFrameCandidatesCount[4];
  }
  int v70 = 0;
  if (v78 == 2)
  {
    *((_WORD *)p_y + 104) = 1;
    p_y[211] = 0;
  }
LABEL_47:

  return v70;
}

- (void)storeReferenceIfNeeded
{
  v2 = &self->_anon_17f858[80];
  if (!self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing)
  {
    p_referenceFrameProperties = &self->_referenceFrameProperties;
    uint64_t cntBracketSampleBuffers = self->_cntBracketSampleBuffers;
    v6 = self->_bracketSampleBuffers[cntBracketSampleBuffers];
    if (v6)
    {
      v6 = (opaqueCMSampleBuffer *)CFRetain(v6);
      LODWORD(cntBracketSampleBuffers) = *((_DWORD *)v2 + 108);
    }
    *(void *)&p_referenceFrameProperties->meta.sensorID = v6;
    memcpy(&self->_referenceFrameProperties.meta.averageFocusScore, (char *)self->_bracketProperties + 224224 * (int)cntBracketSampleBuffers, 0x36BE0uLL);
    *(_WORD *)v2 = 0;
  }
}

- (void)injectReferenceIfNeeded
{
  if (!self->_referenceFrameCandidatesCount && self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing >= 1)
  {
    p_regWarpInput = &self->_regWarpInput;
    v4 = (_DWORD *)MEMORY[0x263F00E10];
    if (*MEMORY[0x263F00E10] == 1) {
      kdebug_trace();
    }
    int appended = objc_msgSend__appendFrames_cfp_(self, a2, (uint64_t)p_regWarpInput[24], (uint64_t)&self->_referenceFrameProperties.meta.averageFocusScore);
    if (!self->_aggregateErr && appended) {
      self->_aggregateErr = 2;
    }
    objc_msgSend__perFrameProcessing_input_cfp_(self, v6, (uint64_t)*p_regWarpInput, (uint64_t)p_regWarpInput[24], &self->_referenceFrameProperties.meta.averageFocusScore);
    if (*v4)
    {
      v10 = objc_msgSend_commandQueue(p_regWarpInput[11], v7, v8, v9);
      int v14 = objc_msgSend_commandBuffer(v10, v11, v12, v13);

      objc_msgSend_setLabel_(v14, v15, @"KTRACE_END_MTL", v16);
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = sub_262FD5690;
      v22[3] = &unk_2655C32E8;
      memset(&v22[4], 0, 24);
      objc_msgSend_addCompletedHandler_(v14, v17, (uint64_t)v22, v18);
      objc_msgSend_commit(v14, v19, v20, v21);
    }
  }
}

- (void)releaseStoredReference
{
  p_referenceFrameProperties = &self->_referenceFrameProperties;
  v4 = *(const void **)&self->_referenceFrameProperties.meta.sensorID;
  if (v4)
  {
    CFRelease(v4);
    *(void *)&p_referenceFrameProperties->meta.sensorID = 0;
  }

  bzero(&self->_referenceFrameProperties.meta.averageFocusScore, 0x36BE0uLL);
}

- (int)process
{
  objc_msgSend_injectReferenceIfNeeded(self, a2, v2, v3);

  return objc_msgSend__process_(self, v5, 1, v6);
}

- (int)_process:(BOOL)a3
{
  BOOL v4 = a3;
  location[16] = *(id *)MEMORY[0x263EF8340];
  p_uint64_t cntBracketSampleBuffers = &self->_cntBracketSampleBuffers;
  p_regWarpInput = &self->_regWarpInput;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressiveBracketingParameters);
  if (p_cntBracketSampleBuffers[2] <= 0)
  {
    uint64_t v191 = v3;
    LODWORD(v190) = 0;
    FigDebugAssert3();
    uint64_t v13 = FigSignalErrorAt();
    goto LABEL_84;
  }
  p_sifrFrameIndex = &self->_sifrFrameIndex;
  int v12 = p_cntBracketSampleBuffers[6];
  if (v12 != 2)
  {
    uint64_t v13 = 0;
    goto LABEL_6;
  }
  if (*p_cntBracketSampleBuffers < 0)
  {
    uint64_t v186 = *((void *)*p_regWarpInput + 10);
    if (v186)
    {
      if (*(unsigned char *)(v186 + 8))
      {
        uint64_t v187 = objc_msgSend__computeReferenceFrameIndex(self, v8, v9, v10);
        uint64_t v13 = v187;
        int aggregateErr = self->_aggregateErr;
        if (!aggregateErr && v187)
        {
          int aggregateErr = 24;
          self->_int aggregateErr = 24;
LABEL_83:
          uint64_t v191 = v3;
          LODWORD(v190) = aggregateErr;
          FigDebugAssert3();
LABEL_84:
          uint64_t v17 = 0;
          goto LABEL_42;
        }
        if (aggregateErr) {
          goto LABEL_83;
        }
        int v12 = p_cntBracketSampleBuffers[6];
LABEL_6:
        if (v12) {
          BOOL v14 = v12 == 7;
        }
        else {
          BOOL v14 = 1;
        }
        if (v14) {
          goto LABEL_12;
        }
        goto LABEL_10;
      }
    }
  }
  uint64_t v13 = 0;
LABEL_10:
  uint64_t v15 = *p_cntBracketSampleBuffers;
  if ((v15 & 0x80000000) == 0)
  {
    bracketSampleBuffers = &self->_bracketSampleBuffers[v15];
    goto LABEL_13;
  }
LABEL_12:
  bracketSampleBuffers = self->_bracketSampleBuffers;
LABEL_13:
  uint64_t v17 = *bracketSampleBuffers;
  if (!*bracketSampleBuffers)
  {
    uint64_t v191 = v3;
    LODWORD(v190) = 0;
    goto LABEL_90;
  }
  CFRetain(*bracketSampleBuffers);
  objc_msgSend_StartKTraceEventForProcess_(self, v18, (uint64_t)v17, v19);
  if (p_cntBracketSampleBuffers[6] == 3)
  {
    uint64_t v23 = p_regWarpInput[20];
    if (!v23)
    {
      uint64_t v191 = v3;
      LODWORD(v190) = 0;
LABEL_90:
      FigDebugAssert3();
LABEL_41:
      uint64_t v13 = FigSignalErrorAt();
      goto LABEL_42;
    }
  }
  else
  {
    uint64_t v23 = p_regWarpInput[19];
    if (!v23)
    {
      uint64_t v191 = v3;
      LODWORD(v190) = 0;
      goto LABEL_90;
    }
  }
  objc_msgSend_setRefFrameTransform_(v23, v20, v21, v22, *MEMORY[0x263EF89A0], *(double *)(MEMORY[0x263EF89A0] + 16), *(double *)(MEMORY[0x263EF89A0] + 32));
  if (v4)
  {
    int v27 = p_cntBracketSampleBuffers[6];
    if (v27 != 2) {
      goto LABEL_22;
    }
    v28 = objc_opt_new();
    uint64_t v29 = NSNumber;
    uint64_t v33 = objc_msgSend_doGreenGhostMitigation(self->_denoiseFusePipeline, v30, v31, v32);
    uint64_t v36 = objc_msgSend_numberWithBool_(v29, v34, v33, v35);
    objc_msgSend_setObject_forKeyedSubscript_(v28, v37, (uint64_t)v36, @"isEnabled");

    objc_msgSend_addToSidecar_forKey_(self, v38, (uint64_t)v28, @"GreenGhostLowLight");
  }
  int v27 = p_cntBracketSampleBuffers[6];
LABEL_22:
  if (v27 && v27 != 7 && !self->_aggregateErr)
  {
    if (v27 != 2 && !self->_processedSIFRandRefEV0) {
      objc_msgSend_waitForIdle(p_regWarpInput[11], v24, v25, v26);
    }
    uint64_t v39 = objc_msgSend__multiFrameProcessing_(self, v24, v4, v26);
    uint64_t v13 = v39;
    if (v39)
    {
      uint64_t v191 = v3;
      LODWORD(v190) = v39;
      FigDebugAssert3();
      goto LABEL_42;
    }
  }
  uint64_t v40 = objc_msgSend_fusionReferenceFrame(self->_denoiseFusePipeline, v24, v25, v26);
  objc_msgSend_setFusionMode_(p_regWarpInput[19], v41, v40, v42);
  if ((*p_cntBracketSampleBuffers & 0x80000000) == 0)
  {
    long long v193 = *((_OWORD *)&self->_fusionConf.colorSpaceConversionParameters[0].transferFunctionFwd.nonLinearPower
           + 3 * *p_cntBracketSampleBuffers);
    long long v194 = *((_OWORD *)&self->_fusionConf.colorSpaceConversionParameters[0].transferFunctionFwd.linearScale
           + 3 * *p_cntBracketSampleBuffers);
    long long v192 = *((_OWORD *)&self->_fusionConf.colorSpaceConversionParameters[0].transferFunctionInv.nonLinearBias
           + 3 * *p_cntBracketSampleBuffers);
    v46 = (void **)(p_regWarpInput + 20);
    int IsValid = objc_msgSend_refFrameTransformIsValid(p_regWarpInput[20], v43, v44, v45);
    if (objc_msgSend_fusionMode(p_regWarpInput[19], v48, v49, v50) == 2 || IsValid)
    {
      unsigned int v51 = *p_sifrFrameIndex;
      if ((*p_sifrFrameIndex & 0x80000000) == 0)
      {
        if (*((unsigned char *)&self->_bracketProperties[1].meta.exposureParams.normalized_snr + 224224 * v51 + 1))
        {
          int v52 = &self->_bracketProperties[1].meta.exposureParams.conversion_gain + 56056 * v51;
          long long v193 = *((_OWORD *)v52 + 1);
          long long v194 = *(_OWORD *)v52;
          long long v192 = *((_OWORD *)v52 + 2);
        }
      }
    }
    int v53 = p_cntBracketSampleBuffers[6];
    if (v53 == 3) {
      goto LABEL_38;
    }
    if (v53 == 1)
    {
      v46 = (void **)(p_regWarpInput + 19);
LABEL_38:
      objc_msgSend_setRefFrameTransform_(*v46, v43, v44, v45, *(double *)&v194, *(double *)&v193, *(double *)&v192);
    }
  }
  if (v4)
  {
    float v54 = objc_msgSend_allocator(p_regWarpInput[11], v43, v44, v45);
    uint64_t v58 = objc_msgSend_usedSizeAll(v54, v55, v56, v57);

    if (v58) {
      goto LABEL_41;
    }
  }
  while (1)
  {
LABEL_42:
    if (v4) {
      objc_msgSend__prepareOutputMetadata(self, v43, v44, v45);
    }
    int v59 = self->_aggregateErr;
    if (v59)
    {
      if (v59 == 1)
      {
        uint64_t v13 = 4294949895;
      }
      else if (v59 == 6)
      {
        uint64_t v13 = 4294949894;
      }
      else
      {
        uint64_t v13 = 4294949896;
      }
    }
    objc_msgSend_resetInternalState(self, v43, v44, v45, v190, v191);
    v63 = objc_msgSend_sharedCaptureManager(MEMORY[0x263F12800], v60, v61, v62);
    objc_msgSend_stopCapture(v63, v64, v65, v66);

    if (*((_DWORD *)p_regWarpInput[18] + 12)) {
      objc_msgSend_finishScheduling(self, v67, v68, v69);
    }
    else {
      objc_msgSend_finishProcessing(self, v67, v68, v69);
    }
    if (objc_opt_respondsToSelector() & v4)
    {
      switch(p_cntBracketSampleBuffers[6])
      {
        case 0:
        case 6:
        case 7:
          if (objc_msgSend_linearOutputPixelBuffer(p_regWarpInput[19], v70, v71, v72))
          {
            uint64_t v76 = objc_msgSend_linearOutputPixelBuffer(p_regWarpInput[19], v73, v74, v75);
            int v80 = objc_msgSend_linearOutputMetadata(p_regWarpInput[19], v77, v78, v79);
            objc_msgSend_processor_outputReadyWithFrameType_outputPixelBuffer_outputMetadata_error_(WeakRetained, v81, (uint64_t)self, 10, v76, v80, v13);
          }
          uint64_t v82 = objc_msgSend_pixelBuffer(p_regWarpInput[19], v73, v74, v75);
          long long v86 = objc_msgSend_metadata(p_regWarpInput[19], v83, v84, v85);
          objc_msgSend_processor_outputReadyWithFrameType_outputPixelBuffer_outputMetadata_error_(WeakRetained, v87, (uint64_t)self, 0, v82, v86, v13);

          break;
        case 1:
        case 2:
          if (objc_msgSend_linearOutputPixelBuffer(p_regWarpInput[19], v70, v71, v72))
          {
            uint64_t v91 = objc_msgSend_linearOutputPixelBuffer(p_regWarpInput[19], v88, v89, v90);
            simd_float4x4 v95 = objc_msgSend_linearOutputMetadata(p_regWarpInput[19], v92, v93, v94);
            objc_msgSend_processor_outputReadyWithFrameType_outputPixelBuffer_outputMetadata_error_(WeakRetained, v96, (uint64_t)self, 10, v91, v95, v13);
          }
          uint64_t v97 = objc_msgSend_pixelBuffer(p_regWarpInput[19], v88, v89, v90);
          v101 = objc_msgSend_metadata(p_regWarpInput[19], v98, v99, v100);
          objc_msgSend_processor_outputReadyWithFrameType_outputPixelBuffer_outputMetadata_error_(WeakRetained, v102, (uint64_t)self, 1, v97, v101, v13);

          break;
        case 3:
          uint64_t v103 = objc_msgSend_syntheticReferencePixelBuffer(p_regWarpInput[20], v70, v71, v72);
          v107 = objc_msgSend_syntheticReferenceMetadata(p_regWarpInput[20], v104, v105, v106);
          objc_msgSend_processor_outputReadyWithFrameType_outputPixelBuffer_outputMetadata_error_(WeakRetained, v108, (uint64_t)self, 3, v103, v107, v13);

          uint64_t v112 = objc_msgSend_syntheticReferenceFusionMapPixelBuffer(p_regWarpInput[20], v109, v110, v111);
          objc_msgSend_processor_outputReadyWithFrameType_outputPixelBuffer_outputMetadata_error_(WeakRetained, v113, (uint64_t)self, 4, v112, 0, v13);
          uint64_t v117 = objc_msgSend_syntheticLongPixelBuffer(p_regWarpInput[20], v114, v115, v116);
          v121 = objc_msgSend_syntheticLongMetadata(p_regWarpInput[20], v118, v119, v120);
          objc_msgSend_processor_outputReadyWithFrameType_outputPixelBuffer_outputMetadata_error_(WeakRetained, v122, (uint64_t)self, 5, v117, v121, v13);

          uint64_t v126 = objc_msgSend_syntheticLongFusionMapPixelBuffer(p_regWarpInput[20], v123, v124, v125);
          objc_msgSend_processor_outputReadyWithFrameType_outputPixelBuffer_outputMetadata_error_(WeakRetained, v127, (uint64_t)self, 6, v126, 0, v13);
          if (objc_msgSend_longFusionMapPixelBuffer(p_regWarpInput[20], v128, v129, v130))
          {
            uint64_t v131 = objc_msgSend_longFusionMapPixelBuffer(p_regWarpInput[20], v70, v71, v72);
            objc_msgSend_processor_outputReadyWithFrameType_outputPixelBuffer_outputMetadata_error_(WeakRetained, v132, (uint64_t)self, 7, v131, 0, v13);
          }
          break;
        case 4:
        case 5:
          objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], v70, *MEMORY[0x263EFF488], @"*** RawNightMode is unsupported in this version of NRF.", 0);
          id v189 = (id)objc_claimAutoreleasedReturnValue();
          objc_exception_throw(v189);
        default:
          break;
      }
    }
    v133 = objc_msgSend_output(self, v70, v71, v72);
    v137 = objc_msgSend_completionStatus(v133, v134, v135, v136);
    BOOL v138 = v137 && v4;

    if (!v138) {
      break;
    }
    v142 = objc_msgSend_output(self, v139, v140, v141);
    v146 = objc_msgSend_completionStatus(v142, v143, v144, v145);
    objc_initWeak(location, v146);

    v150 = objc_msgSend_commandQueue(p_regWarpInput[11], v147, v148, v149);
    v154 = objc_msgSend_commandBuffer(v150, v151, v152, v153);
    id v155 = objc_loadWeakRetained(location);
    objc_msgSend_setCommandBuffer_(v155, v156, (uint64_t)v154, v157);

    id v158 = objc_loadWeakRetained(location);
    v162 = objc_msgSend_commandBuffer(v158, v159, v160, v161);
    LODWORD(v155) = v162 == 0;

    if (!v155)
    {
      id v163 = objc_loadWeakRetained(location);
      v167 = objc_msgSend_commandBuffer(v163, v164, v165, v166);
      BOOL v168 = v167 == 0;

      if (!v168)
      {
        if (objc_opt_respondsToSelector())
        {
          id v169 = objc_loadWeakRetained(location);
          v173 = objc_msgSend_commandBuffer(v169, v170, v171, v172);
          v196[0] = MEMORY[0x263EF8330];
          v196[1] = 3221225472;
          v196[2] = sub_262FD64B4;
          v196[3] = &unk_2655C3810;
          id v197 = WeakRetained;
          objc_copyWeak(&v198, location);
          objc_msgSend_addCompletedHandler_(v173, v174, (uint64_t)v196, v175);

          objc_destroyWeak(&v198);
        }
        id v176 = objc_loadWeakRetained(location);
        v180 = objc_msgSend_commandBuffer(v176, v177, v178, v179);
        objc_msgSend_commit(v180, v181, v182, v183);

        objc_destroyWeak(location);
        break;
      }
    }
    uint64_t v191 = v3;
    LODWORD(v190) = 0;
    FigDebugAssert3();
    uint64_t v13 = FigSignalErrorAt();
    objc_destroyWeak(location);
  }
  if (v17)
  {
    objc_msgSend_EndKTraceEventForProcess_(self, v139, (uint64_t)v17, v141);
    CFRelease(v17);
  }
  if (dword_26B429788)
  {
    v184 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v184, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v13;
}

- (id)getProcessingTypeKey:(frameProperties_t *)a3
{
  BOOL v4 = 0;
  switch(LODWORD(self->_output))
  {
    case 0:
      if (HIBYTE(self->_referenceFrameIndex)) {
        int v5 = off_2655C3710;
      }
      else {
        int v5 = off_2655C3708;
      }
      goto LABEL_13;
    case 1:
      if (LODWORD(a3[1].meta.ROI.origin.y)) {
        int v5 = off_2655C3718;
      }
      else {
        int v5 = off_2655C3730;
      }
      goto LABEL_13;
    case 2:
      uint64_t v6 = objc_msgSend_progressiveBracketingParameters(self, a2, (uint64_t)a3, v3);
      int v10 = objc_msgSend_mode(v6, v7, v8, v9);
      uint64_t v11 = off_2655C3728;
      if (v10 != 1) {
        uint64_t v11 = off_2655C3720;
      }
      BOOL v4 = *v11;

      break;
    case 3:
      int v5 = off_2655C3718;
      goto LABEL_13;
    case 7:
      int v5 = off_2655C3710;
LABEL_13:
      BOOL v4 = *v5;
      break;
    default:
      break;
  }

  return v4;
}

- (int)verifyIOSurfaceCompression:(__IOSurface *)a3
{
  if (IOSurfaceGetCompressionTypeOfPlane() != 4
    || SHIDWORD(self->_nrfFusionOutput->_pixelBuffer) >= (int)IOSurfaceGetCompressionFootprintOfPlane())
  {
    return 0;
  }
  FigDebugAssert3();
  return -1;
}

- (int)addFrame:(opaqueCMSampleBuffer *)a3
{
  uint64_t v3 = a3;
  uint64_t v246 = *MEMORY[0x263EF8340];
  int v5 = (char *)&self->_referenceFrameIndex + 2;
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  v7 = CMGetAttachment(v3, (CFStringRef)*MEMORY[0x263F2EF78], 0);
  int v10 = objc_msgSend_objectForKeyedSubscript_(v7, v8, *MEMORY[0x263F2F668], v9);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v7, v11, *MEMORY[0x263F2F5C8], v12);
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(*(void **)(v5 + 94), v14, (uint64_t)v10, v15);
  uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(*(void **)(v5 + 102), v17, (uint64_t)v10, v18);
  v205 = (void *)v13;
  objc_msgSend_objectForKeyedSubscript_(*(void **)(v5 + 110), v20, v13, v21);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
  int v25 = objc_msgSend_verifyIOSurfaceCompression_(self, v23, (uint64_t)IOSurface, v24);
  if (v25)
  {
    int v28 = v25;
    FigDebugAssert3();
LABEL_91:
    int v27 = 0;
    goto LABEL_79;
  }
  if (!v3)
  {
    int v28 = FigSignalErrorAt();
    goto LABEL_91;
  }
  if (v16) {
    BOOL v26 = v19 == 0;
  }
  else {
    BOOL v26 = 1;
  }
  if (v26)
  {
    int v27 = 0;
    int v28 = -1;
    goto LABEL_79;
  }
  uint64_t v29 = malloc_type_calloc(1uLL, 0x36BE0uLL, 0x1020040DF6BF6F3uLL);
  int v27 = v29;
  if (!v29)
  {
    FigDebugAssert3();
    int v28 = -12786;
    goto LABEL_79;
  }
  if (objc_msgSend_initFrameProperties_metadata_pixelBuffer_(self, v30, (uint64_t)v29, (uint64_t)v7, ImageBuffer))goto LABEL_100; {
  objc_msgSend_injectReferenceIfNeeded(self, v31, v32, v33);
  }
  CMSampleBufferGetPresentationTimeStamp(&v237, v3);
  objc_msgSend_StartKTraceEventForAddFrame_timestamp_(self, v34, (uint64_t)v27, (uint64_t)&v237);
  if (self->_aggregateErr) {
    goto LABEL_100;
  }
  int v35 = *(_DWORD *)(v5 + 30);
  if (v35 == 2)
  {
    if (v27[5])
    {
LABEL_99:
      FigDebugAssert3();
LABEL_100:
      int v28 = FigSignalErrorAt();
      goto LABEL_79;
    }
  }
  else if (v35 == 3 && v27[4])
  {
LABEL_78:
    int v28 = 0;
    goto LABEL_79;
  }
  if (v27[6] && v27[5]) {
    goto LABEL_99;
  }
  sbuf = v3;
  if (!LOBYTE(self->_nrfPlist)) {
    goto LABEL_57;
  }
  uint64_t v36 = objc_opt_new();
  uint64_t v40 = objc_msgSend_device(*(void **)&self->_fusionOptions, v37, v38, v39);
  objc_msgSend_setCaptureObject_(v36, v41, (uint64_t)v40, v42);

  objc_msgSend_setDestination_(v36, v43, 1, v44);
  v48 = objc_msgSend_sharedCaptureManager(MEMORY[0x263F12800], v45, v46, v47);
  v202 = v36;
  objc_msgSend_startCaptureWithDescriptor_error_(v48, v49, (uint64_t)v36, 0);

  int v52 = objc_msgSend_getProcessingTypeKey_(self, v50, (uint64_t)v27, v51);
  float32x4_t v55 = objc_msgSend_objectForKeyedSubscript_(v16, v53, @"DenoiseAndSharpening", v54);
  uint64_t v58 = objc_msgSend_objectForKeyedSubscript_(v55, v56, (uint64_t)v52, v57);
  regWarpInput = self->_regWarpInput;
  v60 = (void *)*((void *)regWarpInput + 2);
  *((void *)regWarpInput + 2) = v58;

  v63 = objc_msgSend_objectForKeyedSubscript_(v16, v61, @"NoiseModel", v62);
  uint64_t v66 = objc_msgSend_objectForKeyedSubscript_(v63, v64, (uint64_t)v52, v65);
  uint64_t v67 = self->_regWarpInput;
  uint64_t v68 = (void *)*((void *)v67 + 4);
  *((void *)v67 + 4) = v66;

  uint64_t v71 = objc_msgSend_objectForKeyedSubscript_(v16, v69, @"Fusion", v70);
  uint64_t v74 = objc_msgSend_objectForKeyedSubscript_(v71, v72, (uint64_t)v52, v73);
  uint64_t v75 = self->_regWarpInput;
  uint64_t v76 = (void *)*((void *)v75 + 3);
  *((void *)v75 + 3) = v74;

  uint64_t v79 = objc_msgSend_objectForKeyedSubscript_(v16, v77, @"ToneMapping", v78);
  uint64_t v82 = objc_msgSend_objectForKeyedSubscript_(v79, v80, (uint64_t)v52, v81);
  long long v83 = self->_regWarpInput;
  uint64_t v84 = (void *)*((void *)v83 + 5);
  *((void *)v83 + 5) = v82;

  int v87 = *(_DWORD *)(v5 + 30);
  if (v87 == 2)
  {
    long long v88 = objc_msgSend_objectForKeyedSubscript_(v16, v85, @"FrameSelection", v86);
    uint64_t v91 = objc_msgSend_objectForKeyedSubscript_(v88, v89, (uint64_t)v52, v90);
    simd_float4x4 v92 = self->_regWarpInput;
    uint64_t v93 = (void *)*((void *)v92 + 10);
    *((void *)v92 + 10) = v91;

    int v87 = *(_DWORD *)(v5 + 30);
  }
  if (v87 == 3)
  {
    uint64_t v94 = objc_msgSend_objectForKeyedSubscript_(v16, v85, @"SyntheticLong", v86);
    simd_float4x4 v95 = self->_regWarpInput;
    simd_float4x4 v96 = (void *)*((void *)v95 + 6);
    *((void *)v95 + 6) = v94;

    uint64_t v99 = objc_msgSend_objectForKeyedSubscript_(v16, v97, @"SyntheticReference", v98);
    uint64_t v102 = objc_msgSend_objectForKeyedSubscript_(v99, v100, @"Default", v101);
    uint64_t v103 = self->_regWarpInput;
    v104 = (void *)*((void *)v103 + 7);
    *((void *)v103 + 7) = v102;

    v107 = objc_msgSend_objectForKeyedSubscript_(v16, v105, @"DenoiseAndSharpening", v106);
    uint64_t v110 = objc_msgSend_objectForKeyedSubscript_(v107, v108, @"ProxyAssetEV0RefParameters", v109);
    uint64_t v111 = self->_regWarpInput;
    uint64_t v112 = (void *)*((void *)v111 + 8);
    *((void *)v111 + 8) = v110;

    uint64_t v115 = objc_msgSend_objectForKeyedSubscript_(v16, v113, @"DenoiseAndSharpening", v114);
    uint64_t v118 = objc_msgSend_objectForKeyedSubscript_(v115, v116, @"ProxyAssetEVMRefParameters", v117);
    uint64_t v119 = self->_regWarpInput;
    uint64_t v120 = (void *)*((void *)v119 + 9);
    *((void *)v119 + 9) = v118;
  }
  objc_storeStrong((id *)self->_regWarpInput + 12, obj);
  v123 = objc_msgSend_objectForKeyedSubscript_(v16, v121, @"GainMap", v122);
  uint64_t v126 = objc_msgSend_objectForKeyedSubscript_(v123, v124, @"Default", v125);
  v127 = self->_regWarpInput;
  v128 = (void *)*((void *)v127 + 11);
  *((void *)v127 + 11) = v126;

  uint64_t v131 = objc_msgSend_objectForKeyedSubscript_(v16, v129, @"SemanticStyles", v130);
  uint64_t v134 = objc_msgSend_objectForKeyedSubscript_(v131, v132, @"Default", v133);
  uint64_t v135 = self->_regWarpInput;
  uint64_t v136 = (void *)*((void *)v135 + 13);
  *((void *)v135 + 13) = v134;

  v139 = objc_msgSend_objectForKeyedSubscript_(v16, v137, @"BrightLightGreenGhost", v138);
  uint64_t v142 = objc_msgSend_objectForKeyedSubscript_(v139, v140, @"Default", v141);
  v143 = self->_regWarpInput;
  uint64_t v144 = (void *)*((void *)v143 + 14);
  *((void *)v143 + 14) = v142;

  v147 = objc_msgSend_objectForKeyedSubscript_(v16, v145, @"LowLightGreenGhost", v146);
  uint64_t v150 = objc_msgSend_objectForKeyedSubscript_(v147, v148, @"Default", v149);
  v151 = self->_regWarpInput;
  uint64_t v152 = (void *)*((void *)v151 + 15);
  *((void *)v151 + 15) = v150;

  objc_msgSend_getTextureForPortType_(self->_globalDistortionCorrectionByPortType, v153, (uint64_t)v205, v154);
  id v155 = (opaqueCMSampleBuffer *)objc_claimAutoreleasedReturnValue();
  referenceFrame = self->_referenceFrame;
  self->_referenceFrame = v155;

  uint64_t v159 = objc_msgSend_getParamsForPortType_(self->_globalDistortionCorrectionPlist, v157, (uint64_t)v205, v158);
  uint64_t v160 = *(void **)&self->_saveInputFramesToDisk;
  *(void *)&self->_saveInputFramesToDisk = v159;

  v164 = self->_regWarpInput;
  if (*((void *)v164 + 2))
  {
    uint64_t v3 = sbuf;
    if (*((void *)v164 + 4))
    {
      int v165 = *(_DWORD *)(v5 + 30);
      if (!v165
        || v165 == 7
        || *((void *)v164 + 3)
        && (v165 != 3 || *((void *)v164 + 6)
                      && *((void *)v164 + 7)
                      && *((void *)v164 + 8)
                      && *((void *)v164 + 9)))
      {
        unsigned int isa = self->_nrfFusionOutput[1].super.super.isa;
        if ((isa & 4) != 0)
        {
          if (v165 == 2)
          {
            id v169 = (void *)*((void *)v164 + 15);
            if (v169)
            {
              objc_msgSend_tuningParams(v169, v161, v162, v163);
              int v170 = v220;
            }
            else
            {
              int v170 = 0;
              uint64_t v236 = 0;
              long long v234 = 0u;
              long long v235 = 0u;
              long long v232 = 0u;
              long long v233 = 0u;
              long long v230 = 0u;
              long long v231 = 0u;
              long long v228 = 0u;
              long long v229 = 0u;
              long long v226 = 0u;
              long long v227 = 0u;
              long long v224 = 0u;
              long long v225 = 0u;
              long long v222 = 0u;
              long long v223 = 0u;
              long long v220 = 0u;
              long long v221 = 0u;
            }
            int v168 = 0;
            int v167 = v170 != 0;
          }
          else if (v165 == 1)
          {
            uint64_t v171 = (void *)*((void *)v164 + 14);
            if (v171)
            {
              objc_msgSend_tuningParams(v171, v161, v162, v163);
              int v172 = v209;
            }
            else
            {
              int v172 = 0;
              uint64_t v219 = 0;
              long long v217 = 0u;
              long long v218 = 0u;
              long long v215 = 0u;
              long long v216 = 0u;
              long long v213 = 0u;
              long long v214 = 0u;
              long long v211 = 0u;
              long long v212 = 0u;
              long long v209 = 0u;
              long long v210 = 0u;
            }
            int v167 = 0;
            int v168 = v172 != 0;
          }
          else
          {
            int v168 = 0;
            int v167 = 0;
          }
        }
        else
        {
          int v167 = (isa >> 1) & 1;
          if (v165 != 2) {
            int v167 = 0;
          }
          if (v165 == 1) {
            int v168 = (uint64_t)self->_nrfFusionOutput[1].super.super.isa & 1;
          }
          else {
            int v168 = 0;
          }
        }
        if (*v5) {
          objc_msgSend_setDoGreenGhostMitigation_(self->_denoiseFusePipeline, v161, v168 | v167, v163);
        }
        else {
          objc_msgSend_setDoGreenGhostMitigation_(self->_denoiseFusePipeline, v161, 0, v163);
        }
        if (dword_26B429788)
        {
          unsigned int v208 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          v173 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        LOBYTE(self->_nrfPlist) = 0;

LABEL_57:
        denoiseFusePipeline = self->_denoiseFusePipeline;
        CVImageBufferRef v175 = CMSampleBufferGetImageBuffer(sbuf);
        int v177 = objc_msgSend_fillPaddedAreaInFrame_cfp_(denoiseFusePipeline, v176, (uint64_t)v175, (uint64_t)v27);
        if (v177)
        {
          int v28 = v177;
        }
        else
        {
          nrfFusionOutput = self->_nrfFusionOutput;
          if (!BYTE5(nrfFusionOutput->_gainMapOutputPixelBuffer))
          {
LABEL_63:
            uint64_t v3 = sbuf;
            int appended = objc_msgSend__appendFrames_cfp_(self, v178, (uint64_t)sbuf, (uint64_t)v27);
            int v28 = appended;
            if (!self->_aggregateErr && appended)
            {
              self->_int aggregateErr = 2;
LABEL_66:
              FigDebugAssert3();
              goto LABEL_79;
            }
            if (appended) {
              goto LABEL_66;
            }
            ++self->_nInputBrackets;
            int v190 = objc_msgSend__perFrameProcessing_input_cfp_(self, v189, (uint64_t)self->_regWarpInput, (uint64_t)sbuf, v27);
            int v28 = v190;
            if (!self->_aggregateErr && v190)
            {
              self->_int aggregateErr = 2;
              goto LABEL_66;
            }
            if (v190) {
              goto LABEL_66;
            }
            if (*(_DWORD *)(v5 + 30) == 2 && *(_DWORD *)(v5 + 14) == *(_DWORD *)(v5 + 10))
            {
              int v193 = objc_msgSend__process_(self, v191, 0, v192);
              if (v193)
              {
                int v201 = v193;
                FigDebugAssert3();
                int v28 = v201;
              }
              else
              {
                int v28 = 0;
              }
              goto LABEL_77;
            }
            goto LABEL_78;
          }
          if (!BYTE4(nrfFusionOutput->_gainMapOutputMetadata) && !BYTE4(nrfFusionOutput->_inferenceInputPixelBuffer))
          {
            FigDebugAssert3();
            int v28 = FigSignalErrorAt();
            goto LABEL_77;
          }
          v180 = self->_denoiseFusePipeline;
          CVImageBufferRef v181 = CMSampleBufferGetImageBuffer(sbuf);
          LODWORD(v182) = self->_nrfFusionOutput->_gainMapOutputMetadata;
          int v184 = objc_msgSend_applyGlobalDistortionCorrectionInplaceWithPixelBuffer_amount_gdcPlist_cscParams_(v180, v183, (uint64_t)v181, *(void *)&self->_saveInputFramesToDisk, v27 + 223952, v182);
          if (!v184)
          {
            objc_msgSend_waitForSchedule(*(void **)&self->_fusionOptions, v185, v186, v187);
            goto LABEL_63;
          }
          int v28 = v184;
        }
        FigDebugAssert3();
LABEL_77:
        uint64_t v3 = sbuf;
        goto LABEL_79;
      }
    }
    FigDebugAssert3();
  }
  else
  {
    FigDebugAssert3();
    uint64_t v3 = sbuf;
  }
  int v28 = FigSignalErrorAt();

LABEL_79:
  CMSampleBufferGetPresentationTimeStamp(&v206, v3);
  objc_msgSend_EndKTraceEventForAddFrame_timestamp_(self, v194, (uint64_t)v27, (uint64_t)&v206);
  free(v27);
  if (dword_26B429788)
  {
    v195 = v7;
    unsigned int v208 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v196 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v197 = v208;
    if (os_log_type_enabled(v196, type)) {
      unsigned int v198 = v197;
    }
    else {
      unsigned int v198 = v197 & 0xFFFFFFFE;
    }
    if (v198)
    {
      v199 = "failed";
      int v238 = 136315907;
      v239 = "-[NRFProcessorV2 addFrame:]";
      __int16 v240 = 2113;
      v241 = @"NRF";
      if (!v28) {
        v199 = "succeeded";
      }
      __int16 v242 = 2081;
      v243 = v199;
      __int16 v244 = 1026;
      BOOL v245 = v28 == 0;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v7 = v195;
  }

  return v28;
}

- (int)updateEV0ReferenceFrameIfNecessary
{
  p_uint64_t cntBracketSampleBuffers = &self->_cntBracketSampleBuffers;
  if (self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing >= 1)
  {
    *p_uint64_t cntBracketSampleBuffers = 0;
    return 0;
  }
  p_preBracketFrameIndex = &self->_preBracketFrameIndex;
  if (self->_ev0SampleBuffer) {
    return 0;
  }
  uint64_t v5 = *p_cntBracketSampleBuffers;
  if ((v5 & 0x80000000) != 0) {
    return 0;
  }
  int v6 = *p_preBracketFrameIndex;
  if (*p_preBracketFrameIndex != v5)
  {
    BOOL v8 = v6 != -1 && v6 < (int)v5;
    uint64_t v9 = v5 - v8;
    if ((int)v5 - v8 >= self->_referenceFrameCandidatesCount) {
      return 0;
    }
    if (!*(&self->_bracketProperties[0].meta.isEVMFrame + 224224 * v9))
    {
      int v10 = self->_bracketSampleBuffers[v9];
      *((void *)p_preBracketFrameIndex + 1) = v10;
      if (v10) {
        CFRetain(v10);
      }
      *p_uint64_t cntBracketSampleBuffers = v9;
      return 0;
    }
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)_appendFrames:(opaqueCMSampleBuffer *)a3 cfp:(frameProperties_t *)a4
{
  p_referenceFrameCandidatesCount = &self->_referenceFrameCandidatesCount;
  p_preBracketFrameIndex = &self->_preBracketFrameIndex;
  if (LODWORD(self->_output) == 2 && !*p_referenceFrameCandidatesCount) {
    objc_msgSend_waitForIdle(*(void **)&self->_fusionOptions, a2, (uint64_t)a3, (uint64_t)a4);
  }
  if (a4->meta.isPreBracketedFrame)
  {
    int *p_preBracketFrameIndex = *p_referenceFrameCandidatesCount;
    memcpy(&self->_prebracketedProperties, a4, 0x36BE0uLL);
    return 0;
  }
  else
  {
    int v10 = *p_referenceFrameCandidatesCount;
    if (a4->meta.isEVMFrame) {
      p_preBracketFrameIndex[4] = v10;
    }
    if (p_referenceFrameCandidatesCount[4] == 3) {
      int v11 = 5;
    }
    else {
      int v11 = 4;
    }
    if (v10 >= v11)
    {
      return -1;
    }
    else
    {
      if (a3)
      {
        uint64_t v12 = (opaqueCMSampleBuffer *)CFRetain(a3);
        int v10 = *p_referenceFrameCandidatesCount;
      }
      else
      {
        uint64_t v12 = 0;
      }
      self->_bracketSampleBuffers[v10] = v12;
      memcpy((char *)self->_bracketProperties + 224224 * v10, a4, 0x36BE0uLL);
      int updated = 0;
      ++*p_referenceFrameCandidatesCount;
      int v16 = p_referenceFrameCandidatesCount[4];
      if (v16)
      {
        if (v16 != 7)
        {
          int updated = objc_msgSend_updateEV0ReferenceFrameIfNecessary(self, v13, v14, v15);
          if (updated) {
            FigDebugAssert3();
          }
        }
      }
    }
  }
  return updated;
}

- (int)_perFrameProcessing:(id)a3 input:(opaqueCMSampleBuffer *)a4 cfp:(frameProperties_t *)a5
{
  v193[22] = *MEMORY[0x263EF8340];
  int v190 = (void **)a3;
  ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
  uint64_t v14 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x263F2EF78], 0);
  if (!v14) {
    goto LABEL_105;
  }
  uint64_t v15 = &self->_anon_17fa15[3];
  p_curRegWarpTempIndex = &self->_curRegWarpTempIndex;
  if (LODWORD(self->_output) == 3)
  {
    if (!*(void *)&self->_outputGainMapHeadroom) {
      goto LABEL_104;
    }
  }
  else if (!self->_deepFusionOutput)
  {
LABEL_104:
    FigDebugAssert3();
LABEL_105:
    int v17 = FigSignalErrorAt();
    goto LABEL_12;
  }
  if (a5->meta.isPreBracketedFrame)
  {
    int v17 = 0;
    goto LABEL_12;
  }
  int isMetadataConsistentWithFirstFrame = objc_msgSend__isMetadataConsistentWithFirstFrame(self, v11, v12, v13);
  int v17 = isMetadataConsistentWithFirstFrame - 1;
  int aggregateErr = self->_aggregateErr;
  if (!aggregateErr && (isMetadataConsistentWithFirstFrame & 1) == 0)
  {
    self->_int aggregateErr = 20;
LABEL_11:
    FigDebugAssert3();
    goto LABEL_12;
  }
  if (aggregateErr) {
    goto LABEL_11;
  }
  int shouldDownsampleRWPPInputWithPixelFormat_processingType = objc_msgSend_shouldDownsampleRWPPInputWithPixelFormat_processingType_(self, v19, PixelFormatType, LODWORD(self->_output));
  BOOL v26 = PixelFormatType == 1751527984 || *(void *)&self->_registrationPipelineRWPPConfig.numThreads == 0;
  int v189 = PixelFormatType;
  char v188 = shouldDownsampleRWPPInputWithPixelFormat_processingType;
  if (v26)
  {
    if (shouldDownsampleRWPPInputWithPixelFormat_processingType)
    {
      int referenceFrameCandidatesCount = self->_referenceFrameCandidatesCount;
      if (referenceFrameCandidatesCount > self->_cntBracketSampleBuffers)
      {
        int v28 = referenceFrameCandidatesCount - 1;
        if (*p_curRegWarpTempIndex != referenceFrameCandidatesCount - 1)
        {
          regWarpM2M = self->_regWarpM2M;
          regWarpHelper = self->_regWarpHelper;
          uint64_t v30 = objc_msgSend_commandBuffer(*(void **)&self->_fusionOptions, v23, v24, v25);
          int v17 = objc_msgSend_convertInput10BitPixBuf_downsampledOutput8BitPixBuf_mtlCommandBuffer_(regWarpM2M, v31, (uint64_t)ImageBuffer, (uint64_t)regWarpHelper, v30);

          if (!self->_aggregateErr && v17)
          {
            self->_int aggregateErr = 1;
            goto LABEL_11;
          }
          if (v17) {
            goto LABEL_11;
          }
          objc_msgSend_waitForSchedule(*(void **)&self->_fusionOptions, v32, v33, v34);
          int *p_curRegWarpTempIndex = v28;
        }
      }
    }
  }
  int v35 = v189;
  switch(LODWORD(self->_output))
  {
    case 0:
    case 6:
    case 7:
      uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(v14, v23, *MEMORY[0x263F2F5C8], v25);
      if (objc_msgSend_defringingEnabled(v190[12], v37, v38, v39)) {
        int v42 = objc_msgSend_isEqualToString_(v36, v40, *MEMORY[0x263F2EF00], v41) ^ 1;
      }
      else {
        LOBYTE(v42) = 0;
      }
      uint64_t v43 = *((void *)self->_regWarpInput + 5);
      char v178 = v42;
      if (v43)
      {
        int v44 = *(unsigned __int8 *)(v43 + 120);
        int v45 = *(unsigned __int8 *)(v43 + 121);
        if (v44 && v45 != 0)
        {
          FigDebugAssert3();

          goto LABEL_12;
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_progressiveBracketingParameters);
      uint64_t v51 = objc_msgSend_inferenceInputPixelBuffer(self->_deepFusionOutput, v48, v49, v50);
      v185 = WeakRetained;
      char v55 = objc_opt_respondsToSelector();
      double v182 = v36;
      if (!v51
        && !objc_msgSend_providesInferencesWithoutInferenceInputPixelBuffer(self->_deepFusionOutput, v52, v53, v54))
      {
        uint64_t v179 = 0;
        char v180 = 0;
        goto LABEL_60;
      }
      char v180 = v55;
      if (v55)
      {
        int v59 = v192;
        v192[0] = MEMORY[0x263EF8330];
        v192[1] = 3221225472;
        v192[2] = sub_262FD9098;
        v192[3] = &unk_2655C3838;
        int v177 = (id *)v193;
        v193[0] = v185;
        v193[1] = self;
      }
      else
      {
        int v59 = 0;
      }
      uint64_t v179 = (void *)MEMORY[0x263E63E60](v59);
      if (!v51) {
        goto LABEL_60;
      }
      int v60 = objc_msgSend_addFrame_cfp_processingType_batchCount_(self->_denoiseFusePipeline, v56, (uint64_t)ImageBuffer, (uint64_t)a5, LODWORD(self->_output), self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing);
      if (v60)
      {
        int v17 = v60;
        uint64_t v176 = v5;
        LODWORD(v175) = v60;
      }
      else
      {
        uint64_t v64 = objc_msgSend_inferenceInputPixelBuffer(self->_deepFusionOutput, v61, v62, v63);
        uint64_t v68 = (__CVBuffer *)objc_msgSend_pixelBuffer(self->_deepFusionOutput, v65, v66, v67);
        size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(v68, 0);
        uint64_t v73 = (__CVBuffer *)objc_msgSend_pixelBuffer(self->_deepFusionOutput, v70, v71, v72);
        size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(v73, 0);
        int v76 = objc_msgSend__processInferenceImage_sourceFrameType_sourceFrameIndex_ltcFrameIndex_gtcFrameIndex_originalWidth_originalHeight_(self, v75, v64, 0, 0, 0, 0, WidthOfPlane, HeightOfPlane);
        if (!v76)
        {
          int v80 = objc_msgSend_freeInputBandPyramids(self->_denoiseFusePipeline, v77, v78, v79);
          if (v80)
          {
            int v17 = v80;
            uint64_t v176 = v5;
            LODWORD(v175) = v80;
            goto LABEL_177;
          }
LABEL_60:
          denoiseFusePipeline = self->_denoiseFusePipeline;
          uint64_t v94 = objc_msgSend_pixelBuffer(self->_deepFusionOutput, v56, v57, v58);
          uint64_t v98 = objc_msgSend_linearOutputPixelBuffer(self->_deepFusionOutput, v95, v96, v97);
          CVImageBufferRef v99 = CMSampleBufferGetImageBuffer(a4);
          int fixed = objc_msgSend_denoiseSingleImage_linearOutput_input_cfp_nrfPlist_style_inferenceProvider_defringeEnabled_colorCubeFixType_(denoiseFusePipeline, v100, v94, v98, v99, a5, v190, self->_tuningParameters, v179, v178);
          int v17 = fixed;
          int v102 = self->_aggregateErr;
          if (v102 || !fixed)
          {
            uint64_t v103 = v5;
            int v35 = v189;
            if (!v102)
            {

              if ((v180 & 1) == 0)
              {

                goto LABEL_109;
              }
              char v104 = 1;
              goto LABEL_68;
            }
          }
          else
          {
            int v102 = 3;
            self->_int aggregateErr = 3;
            uint64_t v103 = v5;
            int v35 = v189;
          }
          uint64_t v176 = v103;
          LODWORD(v175) = v102;
          FigDebugAssert3();

          if (v180)
          {
            char v104 = 0;
            goto LABEL_68;
          }
LABEL_179:

          goto LABEL_12;
        }
        int v17 = v76;
        uint64_t v176 = v5;
        LODWORD(v175) = v76;
      }
LABEL_177:
      FigDebugAssert3();

      if ((v180 & 1) == 0) {
        goto LABEL_179;
      }
      char v104 = 0;
      int v35 = v189;
LABEL_68:

      if ((v104 & 1) == 0) {
        goto LABEL_12;
      }
LABEL_109:
      char v136 = v188 ^ 1;
      if (*(void *)&self->_registrationPipelineRWPPConfig.numThreads) {
        BOOL v137 = v35 == 1751527984;
      }
      else {
        BOOL v137 = 1;
      }
      if (v137) {
        char v136 = 1;
      }
      if ((v136 & 1) == 0)
      {
        int v138 = self->_referenceFrameCandidatesCount;
        if (v138 > self->_cntBracketSampleBuffers)
        {
          int v139 = v138 - 1;
          if (*p_curRegWarpTempIndex != v138 - 1)
          {
            int v140 = objc_msgSend__downsampleImageForRegistration_outputImage_(self, v23, (uint64_t)ImageBuffer, (uint64_t)self->_regWarpHelper);
            int v17 = v140;
            if (!self->_aggregateErr && v140)
            {
              self->_int aggregateErr = 1;
              goto LABEL_11;
            }
            if (v140) {
              goto LABEL_11;
            }
            int *p_curRegWarpTempIndex = v139;
          }
        }
      }
      int v141 = objc_msgSend__registerImages_(self, v23, 0, v25, v175, v176);
      int v17 = v141;
      int v145 = self->_aggregateErr;
      if (!v145 && v141)
      {
        self->_int aggregateErr = 1;
        goto LABEL_11;
      }
      if (v145) {
        goto LABEL_11;
      }
      if (LODWORD(self->_output) == 2)
      {
        int v146 = objc_msgSend__lowLightMotionDetection(self, v142, v143, v144);
        int v17 = v146;
        int v147 = self->_aggregateErr;
        if (!v147 && v146)
        {
          self->_int aggregateErr = 21;
          goto LABEL_11;
        }
        if (v147) {
          goto LABEL_11;
        }
      }
      int v148 = objc_msgSend__computeBlurryFrameWeight_(self, v142, (self->_referenceFrameCandidatesCount - 1), v144);
      int v17 = v148;
      int v151 = self->_aggregateErr;
      if (!v151 && v148)
      {
        self->_int aggregateErr = 21;
        goto LABEL_11;
      }
      if (v151) {
        goto LABEL_11;
      }
      int v152 = objc_msgSend__processSIFRandRefEV0IfPossible_(self, v149, 0, v150);
      int v17 = v152;
      int v156 = self->_aggregateErr;
      if (!v156 && v152)
      {
        self->_int aggregateErr = 4;
        goto LABEL_11;
      }
      if (v156) {
        goto LABEL_11;
      }
      if (LODWORD(self->_output) == 2)
      {
        int v17 = objc_msgSend__lowLightGreenGhostPerFrameProcessing(self, v153, v154, v155);
        if (v17) {
          goto LABEL_11;
        }
      }
      uint64_t v157 = objc_msgSend_statistics(self->_semanticStyleProperties, v153, v154, v155);
      BOOL v162 = objc_msgSend_stationary(v157, v158, v159, v160)
          && (uint64_t v161 = *((void *)self->_regWarpInput + 3)) != 0
          && *(unsigned char *)(v161 + 140) != 0;

      if (v190)
      {
        v164 = v190[3];
        if (v164)
        {
          if (v164[24] == 2 && !v162)
          {
            int cntBracketSampleBuffers = self->_cntBracketSampleBuffers;
            if ((cntBracketSampleBuffers & 0x80000000) == 0)
            {
              int v167 = self->_referenceFrameCandidatesCount;
              if (v167 > cntBracketSampleBuffers && LODWORD(self->_output) == 2)
              {
                uint64_t v168 = 0;
                id v169 = &self->_bracketProperties[1].meta.ltmCurves.ltmLut.bytes[245];
                bracketProperties = self->_bracketProperties;
                do
                {
                  uint64_t v171 = self->_cntBracketSampleBuffers;
                  if (v168 != v171 && !*v169)
                  {
                    if (objc_msgSend_lowLightHybridRegister_refFrameIdx_nonRefFrameProps_refFrameProps_canCopyBack_nrfPlist_(self->_denoiseFusePipeline, v163, v168, (int)v171, bracketProperties, (char *)self->_bracketProperties + 224224 * (int)v171, BYTE4(self->_nrfFusionOutput->_inferenceInputPixelBuffer), self->_regWarpInput))goto LABEL_104; {
                    if (!*(v169 - 340))
                    }
                      *(v169 - 340) = 1;
                    int v17 = 0;
                    *id v169 = 1;
                    int v167 = self->_referenceFrameCandidatesCount;
                  }
                  ++v168;
                  bracketProperties = (frameProperties_t *)((char *)bracketProperties + 224224);
                  v169 += 224224;
                }
                while (v168 < v167);
              }
            }
          }
        }
      }
LABEL_12:

      return v17;
    case 1:
      uint64_t v81 = objc_msgSend_inferenceInputPixelBuffer(self->_deepFusionOutput, v23, v24, v25);
      int y_low = LODWORD(a5[1].meta.ROI.origin.y);
      int referenceFrameIndex_low = LOBYTE(self->_referenceFrameIndex);
      int v181 = self->_referenceFrameCandidatesCount;
      int v183 = self->_cntBracketSampleBuffers;
      int v84 = objc_msgSend_addFrame_cfp_processingType_batchCount_(self->_denoiseFusePipeline, v83, (uint64_t)ImageBuffer, (uint64_t)a5, LODWORD(self->_output), self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing);
      int v17 = v84;
      int v86 = self->_aggregateErr;
      if (!v86 && v84)
      {
        self->_int aggregateErr = 3;
        goto LABEL_11;
      }
      if (v86) {
        goto LABEL_11;
      }
      if (v81)
      {
        if (!referenceFrameIndex_low)
        {
          if (y_low)
          {
            if (v181 - 1 == v183)
            {
              uint64_t v105 = objc_msgSend_inferenceInputPixelBuffer(self->_deepFusionOutput, v23, v85, v25);
              uint64_t v106 = self->_cntBracketSampleBuffers;
              uint64_t v110 = (__CVBuffer *)objc_msgSend_pixelBuffer(self->_deepFusionOutput, v107, v108, v109);
              size_t v111 = CVPixelBufferGetWidthOfPlane(v110, 0);
              uint64_t v115 = (__CVBuffer *)objc_msgSend_pixelBuffer(self->_deepFusionOutput, v112, v113, v114);
              size_t v116 = CVPixelBufferGetHeightOfPlane(v115, 0);
              int v118 = objc_msgSend__processInferenceImage_sourceFrameType_sourceFrameIndex_ltcFrameIndex_gtcFrameIndex_originalWidth_originalHeight_(self, v117, v105, 0, v106, v106, v106, v111, v116);
              if (v118)
              {
                int v17 = v118;
                goto LABEL_11;
              }
            }
          }
        }
      }
      int v35 = v189;
      if (*((unsigned char *)v190[5] + 56) && a5->meta.isEVMFrame)
      {
        uint64_t v119 = self->_denoiseFusePipeline;
        CVImageBufferRef v120 = CMSampleBufferGetImageBuffer(a4);
        int v123 = objc_msgSend_baseLayer_(v119, v121, (uint64_t)v120, v122);
        int v17 = v123;
        int v124 = self->_aggregateErr;
        if (!v124 && v123)
        {
          self->_int aggregateErr = 19;
          goto LABEL_11;
        }
        if (v124) {
          goto LABEL_11;
        }
      }
      goto LABEL_109;
    case 2:
      uint64_t v87 = self->_referenceFrameCandidatesCount;
      int v187 = BYTE4(self->_bracketSampleBuffers[28028 * v87 + 1]);
      int v88 = objc_msgSend__computeMetricsForReferenceFrameSelection_(self, v23, v87 - 1, v25);
      int v17 = v88;
      int v90 = self->_aggregateErr;
      if (!v90 && v88)
      {
        self->_int aggregateErr = 24;
        goto LABEL_11;
      }
      if (v90) {
        goto LABEL_11;
      }
      int v125 = objc_msgSend_addFrame_cfp_processingType_batchCount_(self->_denoiseFusePipeline, v89, (uint64_t)ImageBuffer, (uint64_t)a5, LODWORD(self->_output), self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing);
      int v17 = v125;
      int v127 = self->_aggregateErr;
      if (!v127 && v125)
      {
        self->_int aggregateErr = 3;
        goto LABEL_11;
      }
      if (v127) {
        goto LABEL_11;
      }
      if ((int)v87 > 3) {
        goto LABEL_107;
      }
      if (self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing) {
        goto LABEL_107;
      }
      regWarpInput = self->_regWarpInput;
      uint64_t v129 = *((void *)regWarpInput + 10);
      if (!v129) {
        goto LABEL_107;
      }
      if (v187) {
        goto LABEL_107;
      }
      uint64_t v130 = *(void *)(v129 + 184);
      if (!v130) {
        goto LABEL_107;
      }
      float v191 = 0.0;
      if (v87 == 1)
      {
        *(_DWORD *)uint64_t v15 = 0;
        uint64_t v130 = *(void *)(*((void *)regWarpInput + 10) + 184);
      }
      int v131 = objc_msgSend_blinkDetectionOnFrameIdx_imgMeta_plist_resultScore_frameIdx_(self->_denoiseFusePipeline, v23, v87 - 1, (uint64_t)(&self->_prebracketedProperties.meta.exposureParams.exposure_time + 56056 * v87), v130, &v191, v87 - 1);
      float v132 = v191;
      float v133 = *(float *)v15;
      if (v191 > *(float *)v15) {
        float v133 = v191;
      }
      *(float *)uint64_t v15 = v133;
      if (v131)
      {
        int v17 = v131;
        goto LABEL_11;
      }
      if (dword_26B429788)
      {
        uint64_t v134 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        float v132 = v191;
      }
      *(float *)&self->_bracketSampleBuffers[28028 * v87 + 3] = v132;
LABEL_107:
      uint64_t v135 = *((void *)self->_regWarpInput + 10);
      if (!v135) {
        goto LABEL_104;
      }
      int v35 = v189;
      if (self->_cntBracketSampleBuffers < 0 && *(unsigned char *)(v135 + 8))
      {
        int v172 = objc_msgSend__perFrameProcessingComputeReferenceFrameIndexIfReady(self, v23, v126, v25);
        int v17 = v172;
        int v173 = self->_aggregateErr;
        if (!v173 && v172)
        {
          self->_int aggregateErr = 24;
          goto LABEL_11;
        }
        if (v173) {
          goto LABEL_11;
        }
      }
      goto LABEL_109;
    case 3:
      int v91 = objc_msgSend_addFrame_cfp_processingType_batchCount_(self->_denoiseFusePipeline, v23, (uint64_t)ImageBuffer, (uint64_t)a5, 3, self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing);
      int v17 = v91;
      int v92 = self->_aggregateErr;
      if (!v92 && v91)
      {
        self->_int aggregateErr = 5;
        goto LABEL_11;
      }
      if (v92) {
        goto LABEL_11;
      }
      goto LABEL_109;
    case 4:
    case 5:
      objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], v23, *MEMORY[0x263EFF488], @"*** RawNightMode is unsupported in this version of NRF.", 0);
      id v174 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v174);
    default:
      goto LABEL_109;
  }
}

- (BOOL)_isMetadataConsistentWithFirstFrame
{
  int referenceFrameCandidatesCount = self->_referenceFrameCandidatesCount;
  if (referenceFrameCandidatesCount < 2) {
    return 1;
  }
  uint64_t v3 = (char *)self->_bracketProperties + 224224 * referenceFrameCandidatesCount;
  BOOL v4 = v3 - 224224;
  if (LOBYTE(self->_bracketProperties[1].meta.exposureParams.ltm_soft_gain) == *(v3 - 368))
  {
    if (LOBYTE(self->_bracketProperties[1].meta.exposureParams.ltm_soft_gain))
    {
      int32x2_t v5 = vceq_s32(*(int32x2_t *)&self->_bracketProperties[1].meta.exposureParams.exposure_time, *(int32x2_t *)(v3 - 360));
      if ((v5.i32[0] & v5.i32[1] & 1) == 0) {
        goto LABEL_15;
      }
    }
  }
  else
  {
    if (LOBYTE(self->_bracketProperties[1].meta.exposureParams.ltm_soft_gain)) {
      bracketProperties = self->_bracketProperties;
    }
    else {
      bracketProperties = (frameProperties_t *)(v3 - 224224);
    }
    if (LOBYTE(self->_bracketProperties[1].meta.exposureParams.ltm_soft_gain)) {
      v7 = (frameProperties_t *)(v3 - 224224);
    }
    else {
      v7 = self->_bracketProperties;
    }
    uint32x2_t v8 = (uint32x2_t)vceq_s32(*(int32x2_t *)&bracketProperties[1].meta.exposureParams.exposure_time, vmovn_s64((int64x2_t)vcvtq_u64_f64((float64x2_t)v7->meta.ROI.size)));
    if ((vpmin_u32(v8, v8).u32[0] & 0x80000000) == 0)
    {
      FigDebugAssert3();
      return 0;
    }
  }
  if (self->_bracketProperties[0].meta.sensorID == *(_DWORD *)v4) {
    return 1;
  }
LABEL_15:
  FigDebugAssert3();
  FigSignalErrorAt();
  return 0;
}

- (void)finishScheduling
{
  objc_msgSend_waitForSchedule(*(void **)&self->_fusionOptions, a2, v2, v3);
}

- (int)finishProcessing
{
  objc_msgSend_waitForIdle(*(void **)&self->_fusionOptions, a2, v2, v3);
  return 0;
}

- (NRFProcessorV2)init
{
  return (NRFProcessorV2 *)((uint64_t (*)(NRFProcessorV2 *, char *, void))MEMORY[0x270F9A6D0])(self, sel_initWithCommandQueue_, 0);
}

- (void)dealloc
{
  objc_msgSend_resetState(self, a2, v2, v3);
  objc_msgSend_purgeResources(self, v5, v6, v7);
  int v11 = objc_msgSend_sharedInstance(NRFMonitor, v8, v9, v10);
  objc_msgSend_removeInstance(v11, v12, v13, v14);

  v15.receiver = self;
  v15.super_class = (Class)NRFProcessorV2;
  [(NRFProcessorV2 *)&v15 dealloc];
}

- (NSString)description
{
  return (NSString *)@"NRF";
}

- (NRFProcessorV2)initWithCommandQueue:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  v30.receiver = self;
  v30.super_class = (Class)NRFProcessorV2;
  uint64_t v9 = [(NRFProcessorV2 *)&v30 init];
  if (v9)
  {
    v31[0] = 0;
    if (!qword_26B429638)
    {
      v31[1] = (void *)MEMORY[0x263EF8330];
      v31[2] = (void *)3221225472;
      v31[3] = sub_262FE5BF8;
      v31[4] = &unk_2655C3390;
      v31[5] = v31;
      long long v32 = xmmword_2655C3880;
      uint64_t v33 = 0;
      qword_26B429638 = _sl_dlopen();
    }
    if (!qword_26B429638) {
      sub_2630116FC(v31, v6, v7, v8);
    }
    p_regWarpInput = (void **)&v9->_regWarpInput;
    if (v31[0])
    {
      free(v31[0]);
      if (!v5) {
        goto LABEL_8;
      }
    }
    else if (!v5)
    {
LABEL_8:
      objc_msgSend_resetState(v9, v6, v7, v8);
      LOBYTE(v9->_sidecar) = 0;
      v9->_regwarpHasBeenSetup = 0;
      sharedMetalBuffer = v9->_sharedMetalBuffer;
      v9->_sharedMetalBuffer = 0;

      v9->_usingExternalSharedMetalBuffer = 0;
      sharedRegWarpBuffer = v9->_sharedRegWarpBuffer;
      v9->_sharedRegWarpBuffer = 0;

      v9->_usingExternalSharedRegWarpBuffer = 0;
      uint64_t v13 = objc_opt_new();
      uint64_t v14 = *p_regWarpInput;
      *p_regWarpInput = (void *)v13;

      objc_super v15 = (NRFConfig *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      nrfConfig = v9->_nrfConfig;
      v9->_nrfConfig = v15;

      v9->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing = 0;
      BYTE2(v9->_referenceFrameIndex) = 0;
      *(void *)&v9->_referenceFrameProperties.meta.sensorID = 0;
      bzero(&v9->_referenceFrameProperties.meta.averageFocusScore, 0x36BE0uLL);
      objc_msgSend_setProgressiveBatchSize_(v9, v17, 4, v18);
      objc_msgSend_getDefaults_(MEMORY[0x263F2EE70], v19, (uint64_t)&v9->_registrationPipelineRWPPConfig.numVerticalBlocks, v20);
      uint64_t v24 = objc_msgSend_sharedInstance(NRFMonitor, v21, v22, v23);
      objc_msgSend_addInstance(v24, v25, v26, v27);

      int v28 = v9;
      goto LABEL_9;
    }
    objc_storeStrong((id *)&v9->_cameraInfoByPortType, a3);
    goto LABEL_8;
  }
LABEL_9:

  return v9;
}

- (int)prewarm
{
  p_metalCommandQueue = (uint64_t *)&self->_metalCommandQueue;
  if (!self->_cameraInfoByPortType) {
    goto LABEL_62;
  }
  p_fusionOptions = (void **)&self->_fusionOptions;
  uint64_t v7 = *(void **)&self->_fusionOptions;
  if (!v7)
  {
    id v17 = objc_alloc(MEMORY[0x263F2EE30]);
    uint64_t v18 = (void *)MEMORY[0x263F086E0];
    uint64_t v19 = objc_opt_class();
    uint64_t v22 = objc_msgSend_bundleForClass_(v18, v20, v19, v21);
    uint64_t inited = objc_msgSend_initWithbundle_andOptionalCommandQueue_(v17, v23, (uint64_t)v22, p_metalCommandQueue[1]);
    uint64_t v25 = *p_fusionOptions;
    unsigned int *p_fusionOptions = (void *)inited;

    uint64_t v11 = (uint64_t)*p_fusionOptions;
    if (*p_fusionOptions) {
      goto LABEL_6;
    }
LABEL_62:
    FigDebugAssert3();
    return -1;
  }
  uint64_t v8 = objc_msgSend_commandQueue(v7, a2, v2, v3);

  uint64_t v11 = (uint64_t)*p_fusionOptions;
  if (v8)
  {
LABEL_6:
    int v14 = objc_msgSend_prewarmShaders_(DenoiseFusePipeline, v9, v11, v10);
    goto LABEL_7;
  }
  objc_msgSend_setCommandQueue_(*p_fusionOptions, v9, p_metalCommandQueue[1], v10);
  int v14 = objc_msgSend_prewarmShaders_(DenoiseFusePipeline, v12, (uint64_t)*p_fusionOptions, v13);
LABEL_7:
  int v26 = v14;
  int v27 = objc_msgSend_prewarmShaders_(TextureUtils, v15, (uint64_t)*p_fusionOptions, v16);
  if (v27) {
    int v26 = v27;
  }
  int v30 = objc_msgSend_prewarmShaders_(GlobalDistortionCorrectionStage, v28, (uint64_t)*p_fusionOptions, v29);
  if (v30) {
    int v26 = v30;
  }
  int v33 = objc_msgSend_prewarmShaders_(MotionDetection, v31, (uint64_t)*p_fusionOptions, v32);
  if (v33) {
    int v26 = v33;
  }
  int v36 = objc_msgSend_prewarmShaders_(GrayGhostDetection, v34, (uint64_t)*p_fusionOptions, v35);
  if (v36) {
    int v26 = v36;
  }
  int v39 = objc_msgSend_prewarmShaders_(RegPyrFusion, v37, (uint64_t)*p_fusionOptions, v38);
  if (v39) {
    int v26 = v39;
  }
  int v42 = objc_msgSend_prewarmShaders_(RegDense, v40, (uint64_t)*p_fusionOptions, v41);
  if (v42) {
    int v26 = v42;
  }
  int v45 = objc_msgSend_prewarmShaders_(BilateralGrid, v43, (uint64_t)*p_fusionOptions, v44);
  if (v45) {
    int v26 = v45;
  }
  int v48 = objc_msgSend_prewarmShaders_(PyramidStage_NRF, v46, (uint64_t)*p_fusionOptions, v47);
  if (v48) {
    int v26 = v48;
  }
  int v50 = objc_msgSend_prewarmShaders_tuningParameters_plistEntryName_(DenoiseRemixStage, v49, (uint64_t)*p_fusionOptions, *p_metalCommandQueue, @"NRFParameters");
  if (v50) {
    int v26 = v50;
  }
  int v53 = objc_msgSend_prewarmShaders_(FusionRemixStage, v51, (uint64_t)*p_fusionOptions, v52);
  if (v53) {
    int v26 = v53;
  }
  int v56 = objc_msgSend_prewarmShaders_(ToneMappingStage, v54, (uint64_t)*p_fusionOptions, v55);
  if (v56) {
    int v26 = v56;
  }
  int v59 = objc_msgSend_prewarmShaders_(SubjectRelightingStage, v57, (uint64_t)*p_fusionOptions, v58);
  if (v59) {
    int v26 = v59;
  }
  int v62 = objc_msgSend_prewarmShaders_(BlinkDetectionStage, v60, (uint64_t)*p_fusionOptions, v61);
  if (v62) {
    int v66 = v62;
  }
  else {
    int v66 = v26;
  }
  uint64_t v67 = objc_msgSend_device(*p_fusionOptions, v63, v64, v65);
  int v70 = objc_msgSend_supportsFamily_(v67, v68, 1006, v69);

  if (v70)
  {
    int v74 = objc_msgSend_prewarmShaders_(SyntheticLongStage, v71, (uint64_t)*p_fusionOptions, v73);
    if (v74) {
      int v77 = v74;
    }
    else {
      int v77 = v66;
    }
    int v78 = objc_msgSend_prewarmShaders_(SyntheticReferenceStage, v75, (uint64_t)*p_fusionOptions, v76);
    if (v78) {
      int v66 = v78;
    }
    else {
      int v66 = v77;
    }
  }
  if (objc_msgSend__isGainMapSupported(self, v71, v72, v73))
  {
    int v82 = objc_msgSend_prewarmShaders_(GainMapStage, v79, (uint64_t)*p_fusionOptions, v81);
    if (v82) {
      int v66 = v82;
    }
  }
  if (objc_msgSend__isSemanticStylesSupported(self, v79, v80, v81))
  {
    int v85 = objc_msgSend_prewarmShaders_(SemanticStylesStage, v83, (uint64_t)*p_fusionOptions, v84);
    if (v85) {
      int v66 = v85;
    }
  }
  int v86 = objc_msgSend_prewarmShaders_(OutliersRemovalStage, v83, (uint64_t)*p_fusionOptions, v84);
  if (v86) {
    int v89 = v86;
  }
  else {
    int v89 = v66;
  }
  int v90 = objc_msgSend_prewarmShaders_(RegWarpHelper, v87, (uint64_t)*p_fusionOptions, v88);
  if (v90) {
    int v89 = v90;
  }
  int v92 = objc_msgSend_prewarmShaders_tuningParameters_(DefringeStage, v91, (uint64_t)*p_fusionOptions, *p_metalCommandQueue);
  if (v92) {
    int v89 = v92;
  }
  int v95 = objc_msgSend_prewarmShaders_(GreenGhostBrightLightStage, v93, (uint64_t)*p_fusionOptions, v94);
  if (v95) {
    int v89 = v95;
  }
  int v98 = objc_msgSend_prewarmShaders_(GreenGhostLowLightStage, v96, (uint64_t)*p_fusionOptions, v97);
  if (v98) {
    int v102 = v98;
  }
  else {
    int v102 = v89;
  }
  uint64_t v103 = objc_msgSend_commandQueue(*p_fusionOptions, v99, v100, v101);
  int v106 = objc_msgSend_prewarmShadersWithCommandQueue_(LearnedNRMetalStage, v104, (uint64_t)v103, v105);

  if (v106) {
    return v106;
  }
  else {
    return v102;
  }
}

- (int)setupWithOptions:(id)a3
{
  uint64_t v348 = *MEMORY[0x263EF8340];
  p_cameraInfoByPortType = (uint64_t *)&self->_cameraInfoByPortType;
  p_regWarpInput = &self->_regWarpInput;
  id v6 = a3;
  v254 = objc_msgSend_objectForKeyedSubscript_(v6, v7, *MEMORY[0x263F2F7C0], v8);
  uint64_t v9 = (void *)MEMORY[0x263F086E0];
  uint64_t v10 = objc_opt_class();
  uint64_t v13 = objc_msgSend_bundleForClass_(v9, v11, v10, v12);
  id v14 = objc_alloc(MEMORY[0x263F2EE30]);
  v266 = p_cameraInfoByPortType;
  uint64_t inited = objc_msgSend_initWithbundle_andOptionalCommandQueue_(v14, v15, v13, *p_cameraInfoByPortType);
  id v17 = p_regWarpInput[11];
  p_regWarpInput[11] = (__CVBuffer *)inited;

  v251 = (void *)v13;
  if (!p_regWarpInput[11]) {
    goto LABEL_127;
  }
  uint64_t v18 = (__CVBuffer *)objc_alloc_init(MEMORY[0x263F2EE08]);
  uint64_t v19 = p_regWarpInput[3];
  p_regWarpInput[3] = v18;

  uint64_t v20 = [RegWarpHelper alloc];
  uint64_t v23 = objc_msgSend_initWithMetal_(v20, v21, (uint64_t)p_regWarpInput[11], v22);
  uint64_t v24 = p_regWarpInput[2];
  p_regWarpInput[2] = (__CVBuffer *)v23;

  uint64_t v25 = [NRFConfig alloc];
  uint64_t v28 = objc_msgSend_initWithDefaults_(v25, v26, (uint64_t)v6, v27);
  uint64_t v29 = p_regWarpInput[18];
  p_regWarpInput[18] = (__CVBuffer *)v28;

  if (!p_regWarpInput[18])
  {
LABEL_127:
    FigDebugAssert3();
    int Options = FigSignalErrorAt();
LABEL_129:
    v250 = 0;
    goto LABEL_134;
  }
  long long v337 = 0u;
  long long v336 = 0u;
  long long v335 = 0u;
  long long v334 = 0u;
  id v30 = v254;
  uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v334, (uint64_t)v347, 16);
  if (v32)
  {
    uint64_t v36 = v32;
    uint64_t v37 = *(void *)v335;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v335 != v37) {
          objc_enumerationMutation(v30);
        }
        if (objc_msgSend_intValue(*(void **)(*((void *)&v334 + 1) + 8 * i), v33, v34, v35)) {
          *((unsigned char *)p_regWarpInput[18] + 61) = 0;
        }
      }
      uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v334, (uint64_t)v347, 16);
    }
    while (v36);
  }

  id v39 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v40 = (void *)v266[2];
  v266[2] = (uint64_t)v39;

  id v41 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  int v42 = (void *)v266[3];
  v266[3] = (uint64_t)v41;

  id v43 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v44 = (void *)v266[4];
  v266[4] = (uint64_t)v43;

  uint64_t v47 = objc_msgSend_objectForKeyedSubscript_(v6, v45, *MEMORY[0x263F2F1F8], v46);
  int Options = objc_msgSend_getOptions_(self, v48, (uint64_t)v47, v49);

  if (Options)
  {
    FigDebugAssert3();
    goto LABEL_129;
  }
  uint64_t v53 = objc_msgSend_objectForKeyedSubscript_(v6, v51, *MEMORY[0x263F2F1E8], v52);
  v250 = (void *)v53;
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = [LSCGainsPlist alloc];
    uint64_t v57 = objc_msgSend_initWithDictionary_metal_(v55, v56, v54, (uint64_t)p_regWarpInput[11]);
    uint64_t v58 = p_regWarpInput[13];
    p_regWarpInput[13] = (__CVBuffer *)v57;

    if (!p_regWarpInput[13])
    {
      FigDebugAssert3();
      goto LABEL_133;
    }
    int v59 = [GlobalDistortionCorrectionByPortType alloc];
    uint64_t v62 = objc_msgSend_initWithDictionary_(v59, v60, v54, v61);
    uint64_t v63 = p_regWarpInput[14];
    p_regWarpInput[14] = (__CVBuffer *)v62;

    if (!p_regWarpInput[14])
    {
LABEL_135:
      FigDebugAssert3();
      int Options = FigSignalErrorAt();
      goto LABEL_134;
    }
  }
  v252 = v30;
  id v253 = v6;
  *((unsigned char *)p_regWarpInput[18] + 72) = 0;
  long long v330 = 0u;
  long long v331 = 0u;
  long long v332 = 0u;
  long long v333 = 0u;
  id v64 = (id)v266[4];
  uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v65, (uint64_t)&v330, (uint64_t)v346, 16);
  if (v66)
  {
    uint64_t v69 = v66;
    uint64_t v70 = *(void *)v331;
    do
    {
      for (uint64_t j = 0; j != v69; ++j)
      {
        if (*(void *)v331 != v70) {
          objc_enumerationMutation(v64);
        }
        uint64_t v72 = objc_msgSend_objectForKeyedSubscript_((void *)v266[4], v67, *(void *)(*((void *)&v330 + 1) + 8 * j), v68);
        *((unsigned char *)p_regWarpInput[18] + 72) |= objc_msgSend_defringingEnabled(v72, v73, v74, v75);
      }
      uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v67, (uint64_t)&v330, (uint64_t)v346, 16);
    }
    while (v69);
  }

  *((unsigned char *)p_regWarpInput[18] + 75) = 0;
  *((unsigned char *)p_regWarpInput[18] + 77) = 0;
  *((unsigned char *)p_regWarpInput[18] + 78) = 0;
  *((unsigned char *)p_regWarpInput[18] + 79) = 0;
  v267 = (uint64_t *)p_regWarpInput;
  *((unsigned char *)p_regWarpInput[18] + 101) = 0;
  v255 = self;
  objc_msgSend_applyOverrides(self, v76, v77, v78);
  id v261 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v260 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v326 = 0u;
  long long v327 = 0u;
  long long v328 = 0u;
  long long v329 = 0u;
  id obj = (id)v266[2];
  uint64_t v262 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v79, (uint64_t)&v326, (uint64_t)v345, 16);
  if (v262)
  {
    uint64_t v258 = *(void *)v327;
    do
    {
      uint64_t v82 = 0;
      do
      {
        if (*(void *)v327 != v258) {
          objc_enumerationMutation(obj);
        }
        uint64_t v264 = v82;
        long long v83 = objc_msgSend_objectForKeyedSubscript_((void *)v266[2], v80, *(void *)(*((void *)&v326 + 1) + 8 * v82), v81);
        id v84 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        long long v322 = 0u;
        long long v323 = 0u;
        long long v324 = 0u;
        long long v325 = 0u;
        uint64_t v87 = objc_msgSend_objectForKeyedSubscript_(v83, v85, @"DenoiseAndSharpening", v86);
        uint64_t v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v88, (uint64_t)&v322, (uint64_t)v344, 16);
        if (v89)
        {
          uint64_t v92 = v89;
          uint64_t v93 = *(void *)v323;
          do
          {
            for (uint64_t k = 0; k != v92; ++k)
            {
              if (*(void *)v323 != v93) {
                objc_enumerationMutation(v87);
              }
              uint64_t v95 = *(void *)(*((void *)&v322 + 1) + 8 * k);
              uint64_t v96 = objc_msgSend_objectForKeyedSubscript_(v83, v90, @"DenoiseAndSharpening", v91);
              CVImageBufferRef v99 = objc_msgSend_objectForKeyedSubscript_(v96, v97, v95, v98);
              objc_msgSend_setObject_forKeyedSubscript_(v84, v100, (uint64_t)v99, v95);
            }
            uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v90, (uint64_t)&v322, (uint64_t)v344, 16);
          }
          while (v92);
        }

        objc_msgSend_addObject_(v261, v101, (uint64_t)v84, v102);
        id v103 = objc_alloc_init(MEMORY[0x263EFF9A0]);

        long long v320 = 0u;
        long long v321 = 0u;
        long long v318 = 0u;
        long long v319 = 0u;
        int v106 = objc_msgSend_objectForKeyedSubscript_(v83, v104, @"ToneMapping", v105);
        uint64_t v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(v106, v107, (uint64_t)&v318, (uint64_t)v343, 16);
        if (v108)
        {
          uint64_t v111 = v108;
          uint64_t v112 = *(void *)v319;
          do
          {
            for (uint64_t m = 0; m != v111; ++m)
            {
              if (*(void *)v319 != v112) {
                objc_enumerationMutation(v106);
              }
              uint64_t v114 = *(void *)(*((void *)&v318 + 1) + 8 * m);
              uint64_t v115 = objc_msgSend_objectForKeyedSubscript_(v83, v109, @"ToneMapping", v110);
              objc_msgSend_objectForKeyedSubscript_(v115, v116, v114, v117);
              int v118 = (unsigned char *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_setObject_forKeyedSubscript_(v103, v119, (uint64_t)v118, v114);
              if (v118[79]) {
                *(unsigned char *)(v267[18] + 100) = 1;
              }
            }
            uint64_t v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(v106, v109, (uint64_t)&v318, (uint64_t)v343, 16);
          }
          while (v111);
        }

        objc_msgSend_addObject_(v260, v120, (uint64_t)v103, v121);
        long long v316 = 0u;
        long long v317 = 0u;
        long long v314 = 0u;
        long long v315 = 0u;
        int v124 = objc_msgSend_objectForKeyedSubscript_(v83, v122, @"Fusion", v123);
        uint64_t v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v125, (uint64_t)&v314, (uint64_t)v342, 16);
        if (v126)
        {
          uint64_t v129 = v126;
          uint64_t v130 = *(void *)v315;
          do
          {
            for (uint64_t n = 0; n != v129; ++n)
            {
              if (*(void *)v315 != v130) {
                objc_enumerationMutation(v124);
              }
              uint64_t v132 = *(void *)(*((void *)&v314 + 1) + 8 * n);
              float v133 = objc_msgSend_objectForKeyedSubscript_(v83, v127, @"Fusion", v128);
              char v136 = objc_msgSend_objectForKeyedSubscript_(v133, v134, v132, v135);

              if (v136)
              {
                BOOL v137 = objc_msgSend_objectForKeyedSubscript_(v83, v127, @"Fusion", v128);
                objc_msgSend_objectForKeyedSubscript_(v137, v138, v132, v139);
                int v140 = (_DWORD *)objc_claimAutoreleasedReturnValue();

                if (v140[24] == 2)
                {
                  *(unsigned char *)(v267[18] + 75) = 1;
                  *(unsigned char *)(v267[18] + 77) = 1;
                }
              }
            }
            uint64_t v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v124, v127, (uint64_t)&v314, (uint64_t)v342, 16);
          }
          while (v129);
        }

        uint64_t v143 = objc_msgSend_objectForKeyedSubscript_(v83, v141, @"GainMap", v142);

        if (v143) {
          *(unsigned char *)(v267[18] + 78) = 1;
        }
        int v146 = objc_msgSend_objectForKeyedSubscript_(v83, v144, @"SemanticStyles", v145);

        if (v146) {
          *(unsigned char *)(v267[18] + 79) = 1;
        }

        uint64_t v82 = v264 + 1;
      }
      while (v264 + 1 != v262);
      uint64_t v262 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v80, (uint64_t)&v326, (uint64_t)v345, 16);
    }
    while (v262);
  }

  int v147 = v267;
  id v6 = v253;
  uint64_t v148 = (uint64_t)v255;
  uint64_t v150 = v260;
  uint64_t v149 = v261;
  if (*(_DWORD *)(v267[18] + 96) == 4)
  {
    long long v312 = 0u;
    long long v313 = 0u;
    long long v310 = 0u;
    long long v311 = 0u;
    id v151 = (id)v266[2];
    uint64_t v263 = objc_msgSend_countByEnumeratingWithState_objects_count_(v151, v152, (uint64_t)&v310, (uint64_t)v341, 16);
    if (v263)
    {
      BOOL v269 = 0;
      BOOL v268 = 0;
      uint64_t v257 = *(void *)v311;
      v259 = v151;
      do
      {
        uint64_t v155 = 0;
        do
        {
          if (*(void *)v311 != v257) {
            objc_enumerationMutation(v151);
          }
          uint64_t v265 = v155;
          int v156 = objc_msgSend_objectForKeyedSubscript_((void *)v266[2], v153, *(void *)(*((void *)&v310 + 1) + 8 * v155), v154);
          long long v306 = 0u;
          long long v307 = 0u;
          long long v308 = 0u;
          long long v309 = 0u;
          uint64_t v159 = objc_msgSend_objectForKeyedSubscript_(v156, v157, @"BrightLightGreenGhost", v158);
          uint64_t v161 = objc_msgSend_countByEnumeratingWithState_objects_count_(v159, v160, (uint64_t)&v306, (uint64_t)v340, 16);
          if (v161)
          {
            uint64_t v164 = v161;
            uint64_t v165 = *(void *)v307;
            do
            {
              for (iuint64_t i = 0; ii != v164; ++ii)
              {
                if (*(void *)v307 != v165) {
                  objc_enumerationMutation(v159);
                }
                uint64_t v167 = *(void *)(*((void *)&v306 + 1) + 8 * ii);
                uint64_t v168 = objc_msgSend_objectForKeyedSubscript_(v156, v162, @"BrightLightGreenGhost", v163);
                uint64_t v171 = objc_msgSend_objectForKeyedSubscript_(v168, v169, v167, v170);

                if (v171)
                {
                  int v172 = objc_msgSend_objectForKeyedSubscript_(v156, v162, @"BrightLightGreenGhost", v163);
                  uint64_t v175 = objc_msgSend_objectForKeyedSubscript_(v172, v173, v167, v174);

                  if (v175)
                  {
                    objc_msgSend_tuningParams(v175, v176, v177, v178);
                    int v179 = v295;
                  }
                  else
                  {
                    int v179 = 0;
                    uint64_t v305 = 0;
                    long long v303 = 0u;
                    long long v304 = 0u;
                    long long v301 = 0u;
                    long long v302 = 0u;
                    long long v299 = 0u;
                    long long v300 = 0u;
                    long long v297 = 0u;
                    long long v298 = 0u;
                    long long v295 = 0u;
                    long long v296 = 0u;
                  }
                  BOOL v268 = (v179 | v268) != 0;
                }
              }
              uint64_t v164 = objc_msgSend_countByEnumeratingWithState_objects_count_(v159, v162, (uint64_t)&v306, (uint64_t)v340, 16);
            }
            while (v164);
          }

          long long v293 = 0u;
          long long v294 = 0u;
          long long v291 = 0u;
          long long v292 = 0u;
          double v182 = objc_msgSend_objectForKeyedSubscript_(v156, v180, @"LowLightGreenGhost", v181);
          uint64_t v184 = objc_msgSend_countByEnumeratingWithState_objects_count_(v182, v183, (uint64_t)&v291, (uint64_t)v339, 16);
          if (v184)
          {
            uint64_t v187 = v184;
            uint64_t v188 = *(void *)v292;
            do
            {
              for (juint64_t j = 0; jj != v187; ++jj)
              {
                if (*(void *)v292 != v188) {
                  objc_enumerationMutation(v182);
                }
                uint64_t v190 = *(void *)(*((void *)&v291 + 1) + 8 * jj);
                float v191 = objc_msgSend_objectForKeyedSubscript_(v156, v185, @"LowLightGreenGhost", v186);
                long long v194 = objc_msgSend_objectForKeyedSubscript_(v191, v192, v190, v193);

                if (v194)
                {
                  v195 = objc_msgSend_objectForKeyedSubscript_(v156, v185, @"LowLightGreenGhost", v186);
                  unsigned int v198 = objc_msgSend_objectForKeyedSubscript_(v195, v196, v190, v197);

                  if (v198)
                  {
                    objc_msgSend_tuningParams(v198, v199, v200, v201);
                    int v202 = v274;
                  }
                  else
                  {
                    int v202 = 0;
                    uint64_t v290 = 0;
                    long long v288 = 0u;
                    long long v289 = 0u;
                    long long v286 = 0u;
                    long long v287 = 0u;
                    long long v284 = 0u;
                    long long v285 = 0u;
                    long long v282 = 0u;
                    long long v283 = 0u;
                    long long v280 = 0u;
                    long long v281 = 0u;
                    long long v278 = 0u;
                    long long v279 = 0u;
                    long long v276 = 0u;
                    long long v277 = 0u;
                    long long v274 = 0u;
                    long long v275 = 0u;
                  }
                  BOOL v269 = (v202 | v269) != 0;
                }
              }
              uint64_t v187 = objc_msgSend_countByEnumeratingWithState_objects_count_(v182, v185, (uint64_t)&v291, (uint64_t)v339, 16);
            }
            while (v187);
          }

          uint64_t v155 = v265 + 1;
          id v151 = v259;
        }
        while (v265 + 1 != v263);
        uint64_t v263 = objc_msgSend_countByEnumeratingWithState_objects_count_(v259, v153, (uint64_t)&v310, (uint64_t)v341, 16);
      }
      while (v263);

      if (v268)
      {
        int v147 = v267;
        *(_DWORD *)(v267[18] + 96) |= 1u;
        id v6 = v253;
        uint64_t v148 = (uint64_t)v255;
      }
      else
      {
        id v6 = v253;
        uint64_t v148 = (uint64_t)v255;
        int v147 = v267;
      }
      uint64_t v150 = v260;
      uint64_t v149 = v261;
      if (v269) {
        *(_DWORD *)(v147[18] + 96) |= 2u;
      }
    }
    else
    {
    }
  }
  v203 = [DenoiseFusePipeline alloc];
  uint64_t v205 = objc_msgSend_initWithContext_nrfConfig_dasTuningOptions_toneMappingOptions_(v203, v204, v147[11], v147[18], v149, v150);
  CMTime v206 = *(void **)(v148 + 112);
  *(void *)(v148 + 112) = v205;

  if (!*(void *)(v148 + 112))
  {
    FigDebugAssert3();

    int Options = -12780;
    goto LABEL_134;
  }

  *(unsigned char *)(v147[18] + 24) = *(_DWORD *)(*(void *)(*v147 + 8) + 16) != 0;
  uint64_t v209 = v147[18];
  if (!*(_DWORD *)(v209 + 20))
  {
    *(_DWORD *)(v209 + 20) = *(_DWORD *)(*(void *)(*v147 + 8) + 12);
    uint64_t v209 = v147[18];
  }
  int v210 = *(_DWORD *)(v209 + 28);
  if (v210 == -3)
  {
    *(_DWORD *)(v209 + 28) = *(_DWORD *)(*(void *)(*v147 + 8) + 20);
    uint64_t v209 = v147[18];
    int v210 = *(_DWORD *)(v209 + 28);
    if (v210 == -3) {
      goto LABEL_135;
    }
  }
  int v211 = *(_DWORD *)(v209 + 20);
  if (v211 == 1)
  {
    if ((v210 & 0x80000000) == 0) {
      goto LABEL_135;
    }
  }
  else if (!v211)
  {
    goto LABEL_135;
  }
  objc_msgSend_setFusionReferenceFrame_(*(void **)(v148 + 112), v207, 0, v208);
  objc_msgSend_setSidecarWriter_(*(void **)(v148 + 112), v212, v148, v213);
  id v214 = objc_alloc(MEMORY[0x263F2EE10]);
  long long v218 = objc_msgSend_device((void *)v147[11], v215, v216, v217);
  long long v220 = objc_msgSend_initWithDevice_allocatorType_(v214, v219, (uint64_t)v218, *(unsigned int *)(v147[18] + 20));
  objc_msgSend_setAllocator_((void *)v147[11], v221, (uint64_t)v220, v222);

  long long v226 = objc_msgSend_allocator((void *)v147[11], v223, v224, v225);

  if (!v226) {
    goto LABEL_135;
  }
  *(unsigned char *)(v148 + 8) = 0;
  if (!objc_msgSend_count(v252, v227, v228, v229)) {
    goto LABEL_133;
  }
  if (objc_msgSend_determineWorkingBufferRequirementsWithOptions_nrfConfig_memoryAllocationInfo_((void *)v148, v230, (uint64_t)v6, v147[18], v148 + 16)|| !*(void *)(v148 + 16))
  {
    goto LABEL_135;
  }
  if (!*(unsigned char *)(v147[18] + 32))
  {
LABEL_133:
    int Options = 0;
    goto LABEL_134;
  }
  if (objc_msgSend_allocateResources_((void *)v148, v231, v148 + 16, v232)) {
    goto LABEL_135;
  }
  long long v272 = 0u;
  long long v273 = 0u;
  long long v270 = 0u;
  long long v271 = 0u;
  id v233 = v252;
  uint64_t v235 = objc_msgSend_countByEnumeratingWithState_objects_count_(v233, v234, (uint64_t)&v270, (uint64_t)v338, 16);
  if (v235)
  {
    uint64_t v239 = v235;
    uint64_t v240 = *(void *)v271;
    while (2)
    {
      for (kuint64_t k = 0; kk != v239; ++kk)
      {
        if (*(void *)v271 != v240) {
          objc_enumerationMutation(v233);
        }
        __int16 v242 = *(void **)(*((void *)&v270 + 1) + 8 * kk);
        uint64_t v243 = objc_msgSend_intValue(v242, v236, v237, v238);
        uint64_t v246 = objc_msgSend_objectForKeyedSubscript_(v233, v244, (uint64_t)v242, v245);
        int v248 = objc_msgSend_prepareToProcess_prepareDescriptor_(v255, v247, v243, (uint64_t)v246);
        if (v248)
        {
          int Options = v248;
          FigDebugAssert3();

          goto LABEL_125;
        }
      }
      uint64_t v239 = objc_msgSend_countByEnumeratingWithState_objects_count_(v233, v236, (uint64_t)&v270, (uint64_t)v338, 16);
      if (v239) {
        continue;
      }
      break;
    }
    int Options = 0;
LABEL_125:
    id v6 = v253;
  }
  else
  {
    int Options = 0;
  }

LABEL_134:
  return Options;
}

- (int)getOptions:(id)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    goto LABEL_20;
  }
  p_tuningParamsPlist = (void **)&self->_tuningParamsPlist;
  if (!self->_tuningParamsPlist || !self->_defringingTuningByPortType) {
    goto LABEL_20;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (void *)*((void *)self->_regWarpInput + 1);
  *((void *)self->_regWarpInput + 1) = v6;

  p_regWarpInput = &self->_regWarpInput;
  uint64_t v8 = (void *)*((void *)self->_regWarpInput + 1);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v4, v9, @"Common", v10);
  objc_msgSend_objectForKeyedSubscript_(v11, v12, @"NRFParameters", v13);
  objc_super v15 = v14 = v4;
  LODWORD(v8) = objc_msgSend_readPlist_(v8, v16, (uint64_t)v15, v17);

  if (v8)
  {
    FigDebugAssert3();
    int v60 = -1;
    id v4 = v14;
    goto LABEL_21;
  }
  uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v14, v18, @"DefaultSensorIDs", v19);
  id v4 = v14;
  if (v20)
  {
    uint64_t v22 = v20;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v68, (uint64_t)v72, 16);
    if (v64)
    {
      uint64_t v63 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v64; ++i)
        {
          if (*(void *)v69 != v63) {
            objc_enumerationMutation(v22);
          }
          uint64_t v26 = *(void *)(*((void *)&v68 + 1) + 8 * i);
          uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v4, v23, v26, v24);
          uint64_t v66 = v26;
          id v30 = objc_msgSend_objectForKeyedSubscript_(v22, v28, v26, v29);
          uint64_t v34 = objc_msgSend_allKeys(v27, v31, v32, v33);
          uint64_t v67 = v34;
          if ((objc_msgSend_containsObject_(v34, v35, (uint64_t)v30, v36) & 1) == 0)
          {
            uint64_t v40 = objc_msgSend_firstObject(v34, v37, v38, v39);

            id v30 = (void *)v40;
          }
          id v41 = objc_msgSend_objectForKeyedSubscript_(v27, v37, (uint64_t)v30, v39);
          uint64_t v44 = objc_msgSend_objectForKeyedSubscript_(v41, v42, @"NRFParameters", v43);
          uint64_t v49 = objc_msgSend_objectForKeyedSubscript_(v44, v45, @"NRFParameters", v46);
          if (v49) {
            sub_262FCB960(v30, v49, *p_tuningParamsPlist, p_tuningParamsPlist[1], *((unsigned __int8 *)p_regWarpInput[18] + 62));
          }
          int v50 = objc_msgSend_objectForKeyedSubscript_(v41, v47, @"ChromaticDefringing", v48);
          if (v50)
          {
            uint64_t v51 = [VideoDefringingTuningParameters alloc];
            uint64_t v65 = v27;
            uint64_t v54 = v22;
            id v55 = v4;
            int v56 = objc_msgSend_initWithTuningParameters_(v51, v52, (uint64_t)v50, v53);
            objc_msgSend_selectParametersForTuningMode_(v56, v57, 0, v58);
            objc_msgSend_setObject_forKeyedSubscript_(p_tuningParamsPlist[2], v59, (uint64_t)v56, v66);

            id v4 = v55;
            uint64_t v22 = v54;
            uint64_t v27 = v65;
          }
        }
        uint64_t v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v68, (uint64_t)v72, 16);
      }
      while (v64);
    }

    int v60 = 0;
  }
  else
  {
LABEL_20:
    int v60 = -1;
  }
LABEL_21:

  return v60;
}

- (int)determineWorkingBufferRequirementsToProcess:(unsigned int)a3 prepareDescriptor:(id)a4 nrfConfig:(id)a5 denoiseFusePipelineSize:(unint64_t *)a6 rwppSize:(unint64_t *)a7 rwppInputWidth:(unint64_t *)a8 rwppInputHeight:(unint64_t *)a9
{
  uint64_t v13 = *(void *)&a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v20 = (uint64_t)v16;
  if (v15 && v16)
  {
    int v21 = objc_msgSend_width(v15, v17, v18, v19);
    int v25 = objc_msgSend_height(v15, v22, v23, v24);
    if (v13 == 2 && !*(unsigned char *)(v20 + 66))
    {
      FigDebugAssert3();
      int v42 = 0;
      int v55 = -1;
    }
    else
    {
      uint64_t v57 = a6;
      uint64_t v58 = a7;
      uint64_t v29 = (v21 + 15) & 0xFFFFFFF0;
      uint64_t v30 = (v25 + 15) & 0xFFFFFFF0;
      uint64_t v31 = objc_msgSend_pixelFormat(v15, v26, v27, v28);
      int shouldDownsampleRWPPInputWithPixelFormat_processingType = objc_msgSend_shouldDownsampleRWPPInputWithPixelFormat_processingType_(self, v32, v31, v13);
      int v59 = a8;
      if (shouldDownsampleRWPPInputWithPixelFormat_processingType) {
        uint64_t v37 = 875704422;
      }
      else {
        uint64_t v37 = objc_msgSend_pixelFormat(v15, v33, v34, v35);
      }
      uint64_t v38 = 0;
      unint64_t v39 = 0;
      unint64_t v40 = 0;
      if (v13 && v13 != 7)
      {
        if (*(_DWORD *)(v20 + 36) == 2 || *(unsigned char *)(v20 + 66))
        {
          long long v41 = *(_OWORD *)&self->_registrationPipelineRWPPConfig.maxNumberOfPyramidLevels;
          v60[1] = *(_OWORD *)&self->_registrationPipelineRWPPConfig.internalBorderSize;
          long long v61 = v41;
          v60[0] = *(_OWORD *)&self->_registrationPipelineRWPPConfig.numVerticalBlocks;
          BYTE12(v61) = shouldDownsampleRWPPInputWithPixelFormat_processingType;
          uint64_t v38 = (*MEMORY[0x263EF8AF8]
               + objc_msgSend_computeExternalMemoryBlockSize_imageWidth_imageHeight_imageFormat_(MEMORY[0x263F2EE70], v33, (uint64_t)v60, v29, v30, v37)- 1) & -*MEMORY[0x263EF8AF8];
          if (shouldDownsampleRWPPInputWithPixelFormat_processingType) {
            unint64_t v39 = (unint64_t)(int)v29 >> 1;
          }
          else {
            unint64_t v39 = 0;
          }
          if (shouldDownsampleRWPPInputWithPixelFormat_processingType) {
            unint64_t v40 = (unint64_t)(int)v30 >> 1;
          }
          else {
            unint64_t v40 = 0;
          }
        }
        else
        {
          uint64_t v38 = 0;
          unint64_t v39 = 0;
          unint64_t v40 = 0;
        }
      }
      int v42 = objc_opt_new();
      objc_msgSend_setWidth_(v42, v43, v29, v44);
      objc_msgSend_setHeight_(v42, v45, v30, v46);
      uint64_t v50 = objc_msgSend_pixelFormat(v15, v47, v48, v49);
      objc_msgSend_setPixelFormat_(v42, v51, v50, v52);
      uint64_t v54 = objc_msgSend_calculateBackingBufferSizeForDesc_nrfConfig_metal_(DenoiseFusePipeline, v53, (uint64_t)v42, v20, *(void *)&self->_fusionOptions);
      if (v54)
      {
        if (v57) {
          unint64_t *v57 = (v54 + *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8];
        }
        if (v58) {
          *uint64_t v58 = v38;
        }
        if (v59) {
          *int v59 = v39;
        }
        int v55 = 0;
        if (a9) {
          *a9 = v40;
        }
      }
      else
      {
        FigDebugAssert3();
        int v55 = FigSignalErrorAt();
      }
    }
  }
  else
  {
    FigDebugAssert3();
    int v55 = FigSignalErrorAt();
    int v42 = 0;
  }

  return v55;
}

- (int)determineWorkingBufferRequirementsWithOptions:(id)a3 memoryAllocationInfo:(id *)a4
{
  id v6 = a3;
  if (v6
    && a4
    && (v7 = [NRFConfig alloc], (uint64_t v10 = objc_msgSend_initWithDefaults_(v7, v8, (uint64_t)v6, v9)) != 0))
  {
    uint64_t v12 = (void *)v10;
    int v13 = objc_msgSend_determineWorkingBufferRequirementsWithOptions_nrfConfig_memoryAllocationInfo_(self, v11, (uint64_t)v6, v10, a4);
  }
  else
  {
    FigDebugAssert3();
    int v13 = -1;
  }

  return v13;
}

- (int)determineWorkingBufferRequirementsWithOptions:(id)a3 nrfConfig:(id)a4 memoryAllocationInfo:(id *)a5
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v11 = v8;
  if (v7
    && v8
    && a5
    && (objc_msgSend_objectForKeyedSubscript_(v7, v9, *MEMORY[0x263F2F7C0], v10),
        (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v44 = a5;
    id v45 = v7;
    uint64_t v48 = v11;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v12;
    uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v55, (uint64_t)v59, 16);
    if (v49)
    {
      unint64_t v17 = 0;
      unint64_t v18 = 0;
      unint64_t v19 = 0;
      unint64_t v20 = 0;
      unint64_t v21 = 0;
      unint64_t v22 = 0;
      unsigned int v23 = 0;
      uint64_t v46 = *(void *)v56;
      while (1)
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v56 != v46) {
            objc_enumerationMutation(obj);
          }
          int v25 = *(void **)(*((void *)&v55 + 1) + 8 * v24);
          unint64_t v53 = 0;
          unint64_t v54 = 0;
          unint64_t v51 = 0;
          unint64_t v52 = 0;
          uint64_t v26 = objc_msgSend_intValue(v25, v14, v15, v16);
          uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(obj, v27, (uint64_t)v25, v28);
          int v31 = objc_msgSend_determineWorkingBufferRequirementsToProcess_prepareDescriptor_nrfConfig_denoiseFusePipelineSize_rwppSize_rwppInputWidth_rwppInputHeight_(self, v30, v26, (uint64_t)v29, v48, &v54, &v53, &v52, &v51);
          if (v31)
          {
            int v42 = v31;
            FigDebugAssert3();
LABEL_38:

            goto LABEL_39;
          }
          if (!v54)
          {
            FigDebugAssert3();
            int v42 = -4;
            goto LABEL_38;
          }
          if (v17 <= v54) {
            unint64_t v17 = v54;
          }
          if (v18 <= v53) {
            unint64_t v18 = v53;
          }
          if (v19 <= v52) {
            unint64_t v19 = v52;
          }
          if (v20 <= v51) {
            unint64_t v20 = v51;
          }
          if (v23)
          {
            if (v21) {
              goto LABEL_22;
            }
          }
          else
          {
            unsigned int v23 = objc_msgSend_pixelFormat(v29, v32, v33, v34);
            if (v21)
            {
LABEL_22:
              if (!v22) {
                goto LABEL_30;
              }
              goto LABEL_23;
            }
          }
          unint64_t v21 = (int)objc_msgSend_width(v29, v32, v33, v34);
          if (!v22) {
LABEL_30:
          }
            unint64_t v22 = (int)objc_msgSend_height(v29, v32, v33, v34);
LABEL_23:
          if (v23 != objc_msgSend_pixelFormat(v29, v32, v33, v34)
            || v21 != (int)objc_msgSend_width(v29, v35, v36, v37)
            || v22 != (int)objc_msgSend_height(v29, v38, v39, v40))
          {
            FigDebugAssert3();
            int v42 = FigSignalErrorAt();
            goto LABEL_38;
          }

          ++v24;
        }
        while (v49 != v24);
        uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v55, (uint64_t)v59, 16);
        uint64_t v49 = v41;
        if (!v41) {
          goto LABEL_34;
        }
      }
    }
    unint64_t v17 = 0;
    unint64_t v18 = 0;
    unint64_t v19 = 0;
    unint64_t v20 = 0;
    unint64_t v21 = 0;
    unint64_t v22 = 0;
    unsigned int v23 = 0;
LABEL_34:

    v44->var0 = v17;
    v44->var1 = v18;
    v44->var2 = v21;
    v44->var3 = v22;
    v44->var4 = v23;
    v44->var5 = v19;
    v44->var6 = v20;

    int v42 = 0;
LABEL_39:
    id v7 = v45;
    uint64_t v11 = v48;
  }
  else
  {
    FigDebugAssert3();
    int v42 = FigSignalErrorAt();
  }

  return v42;
}

- (id)newMTLBufferWithLength:(unint64_t)a3
{
  v28[6] = *MEMORY[0x263EF8340];
  p_fusionint Options = &self->_fusionOptions;
  if (BYTE1(self->_nrfFusionOutput->_metadata))
  {
    v27[0] = *MEMORY[0x263F0ED30];
    id v7 = objc_msgSend_numberWithUnsignedLong_(NSNumber, a2, a3, v3);
    uint64_t v8 = *MEMORY[0x263F0ED58];
    v28[0] = v7;
    v28[1] = &unk_270E506A0;
    uint64_t v9 = *MEMORY[0x263F0EE30];
    v27[1] = v8;
    v27[2] = v9;
    v28[2] = MEMORY[0x263EFFA88];
    v28[3] = MEMORY[0x263EFFA80];
    uint64_t v10 = *MEMORY[0x263F0EF48];
    v27[3] = *MEMORY[0x263F0EF30];
    v27[4] = v10;
    v27[5] = *MEMORY[0x263F0EF38];
    v28[4] = MEMORY[0x263EFFA88];
    v28[5] = MEMORY[0x263EFFA88];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, (uint64_t)v28, (uint64_t)v27, 6);
    CFDictionaryRef v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    IOSurfaceRef v13 = IOSurfaceCreate(v12);
    if (v13)
    {
      IOSurfaceRef v17 = v13;
      unint64_t v18 = objc_msgSend_device(*(void **)p_fusionOptions, v14, v15, v16);
      unint64_t v21 = objc_msgSend_newBufferWithIOSurface_(v18, v19, (uint64_t)v17, v20);

      if (v21)
      {

        CFRelease(v17);
        return v21;
      }
      uint64_t v26 = v4;
      int v25 = 0;
      FigDebugAssert3();

      CFRelease(v17);
    }
    else
    {
      uint64_t v26 = v4;
      int v25 = 0;
      FigDebugAssert3();
    }
  }
  unint64_t v22 = objc_msgSend_device(*(void **)p_fusionOptions, a2, a3, v3, v25, v26);
  unint64_t v21 = objc_msgSend_newBufferWithLength_options_(v22, v23, a3, 0);

  if (!v21) {
    sub_262FDBF10();
  }
  return v21;
}

- (int)allocateResources:(id *)a3
{
  if (a3)
  {
    p_regWarpHelper = &self->_regWarpHelper;
    regWarpHelper = (__CVBuffer *)self->_regWarpHelper;
    if (regWarpHelper)
    {
      size_t Width = CVPixelBufferGetWidth(regWarpHelper);
      regWarpHelper = (__CVBuffer *)*p_regWarpHelper;
      if (*p_regWarpHelper) {
        regWarpHelper = (__CVBuffer *)CVPixelBufferGetHeight(regWarpHelper);
      }
    }
    else
    {
      size_t Width = 0;
    }
    BOOL v9 = Width >= a3->var5 && (unint64_t)regWarpHelper >= a3->var6;
    if (v9
      || (CVPixelBufferRelease((CVPixelBufferRef)*p_regWarpHelper),
          PixelBufferWithWiringAssertiouint64_t n = CreatePixelBufferWithWiringAssertion(),
          (*p_regWarpHelper = (RegWarpHelper *)PixelBufferWithWiringAssertion) != 0))
    {
      unint64_t v11 = objc_msgSend_length(self->_sharedRegWarpBuffer, a2, (uint64_t)a3, v3);
      if (self->_usingExternalSharedRegWarpBuffer) {
        return 0;
      }
      unint64_t var1 = a3->var1;
      if (var1 <= v11) {
        return 0;
      }
      uint64_t v16 = (_DWORD *)MEMORY[0x263F00E10];
      if (*MEMORY[0x263F00E10] == 1) {
        kdebug_trace();
      }
      objc_msgSend_releaseResources(p_regWarpHelper[9], v12, v13, v14);
      self->_regwarpHasBeenSetup = 0;
      sharedRegWarpBuffer = self->_sharedRegWarpBuffer;
      self->_sharedRegWarpBuffer = 0;

      if (*v16 == 1)
      {
        kdebug_trace();
        if (*v16 == 1) {
          kdebug_trace();
        }
      }
      id v18 = objc_alloc(MEMORY[0x263F2BFF0]);
      unint64_t v21 = (FigWiredMemory *)objc_msgSend_initWithLength_(v18, v19, var1, v20);
      unint64_t v22 = self->_sharedRegWarpBuffer;
      self->_sharedRegWarpBuffer = v21;

      if (self->_sharedRegWarpBuffer)
      {
        if (*v16 == 1) {
          kdebug_trace();
        }
        return 0;
      }
    }
    FigDebugAssert3();
    int v24 = FigSignalErrorAt();
    sub_262FDBF10();
    return v24;
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)bindResourcesForProcessingType:(unsigned int)a3 prepareDescriptor:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  uint64_t v11 = objc_msgSend_width(v6, v8, v9, v10);
  objc_msgSend_setWidth_(v7, v12, v11, v13);
  uint64_t v17 = objc_msgSend_height(v6, v14, v15, v16);
  objc_msgSend_setHeight_(v7, v18, v17, v19);
  uint64_t v23 = objc_msgSend_pixelFormat(v6, v20, v21, v22);
  objc_msgSend_setPixelFormat_(v7, v24, v23, v25);
  char v53 = 0;
  int v30 = objc_msgSend_allocateResourcesIfNeededForDesc_didAllocate_(self->_denoiseFusePipeline, v26, (uint64_t)v7, (uint64_t)&v53);
  if (v30)
  {
    FigDebugAssert3();
    int v30 = FigSignalErrorAt();
  }
  else if (v4 && v4 != 7)
  {
    nrfFusionOutput = self->_nrfFusionOutput;
    if ((HIDWORD(nrfFusionOutput->_metadata) == 2 || BYTE2(nrfFusionOutput->_linearOutputMIWBAppliedMetadata))
      && ((uint64_t v32 = objc_msgSend_pixelFormat(v6, v27, v28, v29),
           int shouldDownsampleRWPPInputWithPixelFormat_processingType = objc_msgSend_shouldDownsampleRWPPInputWithPixelFormat_processingType_(self, v33, v32, v4), v53)|| !self->_regwarpHasBeenSetup|| BYTE4(self->_registrationPipelineRWPP) != shouldDownsampleRWPPInputWithPixelFormat_processingType))
    {
      objc_msgSend_releaseResources(self->_metal, v35, v36, v37);
      metal = self->_metal;
      self->_metal = 0;

      uint64_t v42 = (int)objc_msgSend_width(v6, v39, v40, v41);
      uint64_t v46 = (int)objc_msgSend_height(v6, v43, v44, v45);
      uint64_t v50 = objc_msgSend_pixelFormat(v6, v47, v48, v49);
      int v30 = objc_msgSend__bindRegWarpPPWithWidth_height_pixelFormat_(self, v51, v42, v46, v50);
      if (v30)
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
      int v30 = 0;
    }
  }

  return v30;
}

- (int)prepareToProcess:(unsigned int)a3 prepareDescriptor:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  p_fusionint Options = &self->_fusionOptions;
  id v7 = a4;
  uint64_t v11 = v7;
  long long v95 = 0u;
  memset(v96, 0, 24);
  int8x16_t v94 = 0u;
  if (v4 == 3)
  {
    if (!*(unsigned char *)(*((void *)p_fusionOptions + 7) + 63)) {
      goto LABEL_38;
    }
  }
  else if (v4 == 2 && !*(unsigned char *)(*((void *)p_fusionOptions + 7) + 66))
  {
    goto LABEL_38;
  }
  p_referenceFrameHasEVMinus = &self->_referenceFrameHasEVMinus;
  int v13 = objc_msgSend_width(v7, v8, v9, v10);
  objc_msgSend_setWidth_(v11, v14, (v13 + 15) & 0xFFFFFFF0, v15);
  int v19 = objc_msgSend_height(v11, v16, v17, v18);
  objc_msgSend_setHeight_(v11, v20, (v19 + 15) & 0xFFFFFFF0, v21);
  *(unsigned char *)(*((void *)p_fusionOptions + 7) + 76) = objc_msgSend_allowModifyingInputBuffers(v11, v22, v23, v24);
  uint64_t v28 = *((void *)p_fusionOptions + 7);
  int v29 = *(_DWORD *)(v28 + 44);
  if ((v29 & 0x80000000) == 0) {
    BYTE1(self->_referenceFrameIndex) = v29 != 0;
  }
  BOOL v31 = v4 == 7 || HIBYTE(self->_referenceFrameIndex) != 0;
  *(unsigned char *)(v28 + 101) = v31;
  LODWORD(self->_output) = v4;
  objc_msgSend_reset(self->_denoiseFusePipeline, v25, v26, v27);
  uint64_t v34 = 0;
  switch(LODWORD(self->_output))
  {
    case 0:
    case 6:
    case 7:
      goto LABEL_17;
    case 1:
    case 2:
      objc_msgSend_setFusionMode_(self->_denoiseFusePipeline, v32, 1, v33);
      break;
    case 3:
      uint64_t v34 = 2;
LABEL_17:
      objc_msgSend_setFusionMode_(self->_denoiseFusePipeline, v32, v34, v33);
      break;
    case 4:
    case 5:
      objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], v32, *MEMORY[0x263EFF488], @"*** RawNightMode is unsupported in this version of NRF.", 0);
      id v90 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v90);
    default:
      break;
  }
  uint64x2_t v93 = 0uLL;
  uint64_t v91 = 0;
  uint64_t v92 = 0;
  int Resources = objc_msgSend_determineWorkingBufferRequirementsToProcess_prepareDescriptor_nrfConfig_denoiseFusePipelineSize_rwppSize_rwppInputWidth_rwppInputHeight_(self, v32, v4, (uint64_t)v11, *((void *)p_fusionOptions + 7), &v93, &v93.u64[1], &v92, &v91);
  if (Resources)
  {
LABEL_35:
    int v78 = Resources;
    goto LABEL_36;
  }
  if (!v93.i64[0])
  {
    FigDebugAssert3();
LABEL_38:
    int v78 = FigSignalErrorAt();
    goto LABEL_34;
  }
  *(void *)&long long v95 = (int)objc_msgSend_width(v11, v36, v37, v38);
  *((void *)&v95 + 1) = (int)objc_msgSend_height(v11, v39, v40, v41);
  LODWORD(v96[0]) = objc_msgSend_pixelFormat(v11, v42, v43, v44);
  uint64_t v48 = v93.i64[0];
  int8x16_t v94 = vbslq_s8((int8x16_t)vcgtq_u64(v93, *(uint64x2_t *)&self->_memoryRequirements.sharedMetalBufferSizeRequested), (int8x16_t)v93, *(int8x16_t *)&self->_memoryRequirements.sharedMetalBufferSizeRequested);
  v49.i64[0] = v92;
  v49.i64[1] = v91;
  *(int8x16_t *)((char *)v96 + 8) = vbslq_s8((int8x16_t)vcgtq_u64(v49, *(uint64x2_t *)&self->_memoryRequirements.regwarpInputWidth), (int8x16_t)v49, *(int8x16_t *)&self->_memoryRequirements.regwarpInputWidth);
  if (!self->_allocatorSetupComplete) {
    goto LABEL_23;
  }
  uint64_t v50 = objc_msgSend_allocator(*(void **)p_fusionOptions, v45, v46, v47);
  unint64_t v54 = objc_msgSend_memSize(v50, v51, v52, v53);
  unint64_t v55 = v93.i64[0];

  if (v54 < v55)
  {
    uint64_t v48 = v93.i64[0];
LABEL_23:
    uint64_t v59 = *(void *)(*((void *)p_fusionOptions + 7) + 8);
    uint64_t v60 = objc_opt_new();
    uint64_t v63 = v60;
    if (v60)
    {
      if (v59) {
        objc_msgSend_setMemSize_(v60, v61, v59, v62);
      }
      else {
        objc_msgSend_setMemSize_(v60, v61, v48, v62);
      }
      objc_msgSend_setWireMemory_(v63, v64, *(unsigned __int8 *)(*((void *)p_fusionOptions + 7) + 16), v65);
      objc_msgSend_setCompressionLevel_(v63, v66, *(unsigned int *)(*((void *)p_fusionOptions + 7) + 28), v67);
      objc_msgSend_setAllowFallback_(v63, v68, *(unsigned __int8 *)(*((void *)p_fusionOptions + 7) + 24), v69);
      objc_msgSend_setLabel_(v63, v70, @"FigMetalAllocator_NRF", v71);
      uint64_t v75 = objc_msgSend_allocator(*(void **)p_fusionOptions, v72, v73, v74);
      int v78 = objc_msgSend_setupWithDescriptor_(v75, v76, (uint64_t)v63, v77);

      if (!v78)
      {

        self->_allocatorSetupComplete = 1;
        goto LABEL_29;
      }
      FigSignalErrorAt();
    }
    else
    {
      FigDebugAssert3();
      int v78 = FigSignalErrorAt();
    }

    goto LABEL_34;
  }
LABEL_29:
  if (*(void *)p_referenceFrameHasEVMinus)
  {
    uint64_t v79 = objc_msgSend_iosurface(*(void **)p_referenceFrameHasEVMinus, v56, v57, v58);
    int v82 = objc_msgSend_verifyIOSurfaceCompression_(self, v80, v79, v81);
    if (v82)
    {
      int v78 = v82;
      FigDebugAssert3();
      goto LABEL_34;
    }
    uint64_t v86 = objc_msgSend_allocator(*(void **)p_fusionOptions, v83, v84, v85);
    int v78 = objc_msgSend_addExternalMetalBuffer_atSubAllocatorID_(v86, v87, *(void *)p_referenceFrameHasEVMinus, 0);

    if (v78) {
      goto LABEL_36;
    }
  }
  int Resources = objc_msgSend_allocateResources_(self, v56, (uint64_t)&v94, v58);
  if (Resources) {
    goto LABEL_35;
  }
  int v78 = objc_msgSend_bindResourcesForProcessingType_prepareDescriptor_(self, v88, v4, (uint64_t)v11);
  if (v78) {
LABEL_36:
  }
    FigSignalErrorAt();
LABEL_34:

  return v78;
}

- (int)prepareToProcess:(unsigned int)a3
{
  return -1;
}

- (int)fusionMode
{
  int v4 = objc_msgSend_fusionReferenceFrame(self->_denoiseFusePipeline, a2, v2, v3);
  if (v4 == 1) {
    return 1;
  }
  else {
    return 2 * (v4 == 2);
  }
}

- (void)setFusionMode:(int)a3
{
  if (a3 == 1) {
    objc_msgSend_setFusionReferenceFrame_(self->_denoiseFusePipeline, a2, 1, v3);
  }
  else {
    objc_msgSend_setFusionReferenceFrame_(self->_denoiseFusePipeline, a2, 2 * (a3 == 2), v3);
  }
}

- (void)setReferenceFrameIndex:(int)a3
{
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  self->_int cntBracketSampleBuffers = a3;
  int v6 = objc_msgSend__registerImages_(self, a2, 0, v3);
  int aggregateErr = self->_aggregateErr;
  if (aggregateErr) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v6 == 0;
  }
  if (!v10)
  {
    self->_int aggregateErr = 1;
LABEL_12:
    FigDebugAssert3();
    return;
  }
  if (aggregateErr) {
    goto LABEL_12;
  }
  int v11 = objc_msgSend__processSIFRandRefEV0IfPossible_(self, v7, 0, v8);
  int v12 = self->_aggregateErr;
  if (!v12 && v11)
  {
    self->_int aggregateErr = 4;
    goto LABEL_12;
  }
  if (v12) {
    goto LABEL_12;
  }
}

- (int)purgeResources
{
  p_regWarpHelper = &self->_regWarpHelper;
  objc_msgSend_releaseResources(self->_denoiseFusePipeline, a2, v2, v3);
  CVPixelBufferRelease((CVPixelBufferRef)*p_regWarpHelper);
  *p_regWarpHelper = 0;
  uint64_t v9 = p_regWarpHelper[17];
  if (v9 && (HIDWORD(v9[1]._metal) == 2 || BYTE2(v9[2]._shaders)))
  {
    objc_msgSend_releaseResources(p_regWarpHelper[9], v6, v7, v8);
    self->_regwarpHasBeenSetup = 0;
  }
  sharedMetalBuffer = self->_sharedMetalBuffer;
  self->_sharedMetalBuffer = 0;

  self->_usingExternalSharedMetalBuffer = 0;
  sharedRegWarpBuffer = self->_sharedRegWarpBuffer;
  self->_sharedRegWarpBuffer = 0;

  self->_usingExternalSharedRegWarpBuffer = 0;
  self->_allocatorSetupComplete = 0;
  return 0;
}

- (int)resetState
{
  p_referenceFrameIndex = &self->_referenceFrameIndex;
  p_nInputBrackets = &self->_nInputBrackets;
  objc_msgSend_waitForSchedule(*(void **)&self->_fusionOptions, a2, v2, v3);
  objc_msgSend_resetInternalState(self, v7, v8, v9);
  objc_msgSend_releaseAllBindings(self->_denoiseFusePipeline, v10, v11, v12);
  objc_msgSend_setDoGreenGhostMitigation_(self->_denoiseFusePipeline, v13, 0, v14);
  objc_msgSend_releaseStoredReference(self, v15, v16, v17);
  *(_WORD *)&self->_processedSIFRandRefEV0 = 0;
  p_referenceFrameIndex[5] = 0;
  *(void *)&self->_processedSyntheticReference = 0;
  *(void *)&self->_deepFusionPyramidBuilt[5] = 0;
  p_referenceFrameIndex[2] = -1;
  objc_msgSend_setFusionReferenceFrame_(self->_denoiseFusePipeline, v18, 0, v19);
  *(void *)p_nInputBrackets = 0;
  *((unsigned char *)p_referenceFrameIndex + 2) = 0;
  *(_WORD *)p_referenceFrameIndex = 1;
  objc_storeWeak((id *)&self->_progressiveBracketingParameters, 0);
  uint64_t v20 = (void *)*((void *)p_referenceFrameIndex + 7);
  *((void *)p_referenceFrameIndex + 7) = 0;

  *((unsigned char *)p_referenceFrameIndex + 3) = 0;
  uint64_t v24 = objc_msgSend_allocator(*((void **)p_nInputBrackets + 182), v21, v22, v23);
  objc_msgSend_reset(v24, v25, v26, v27);

  BOOL v31 = objc_msgSend_allocator(*((void **)p_nInputBrackets + 182), v28, v29, v30);
  objc_msgSend_purgeResources_(v31, v32, 0, v33);

  objc_msgSend_setExecutionStatus_(*((void **)p_nInputBrackets + 182), v34, 0, v35);
  return 0;
}

- (int)resetInternalState
{
  id v5 = &self->_anon_17fa15[7];
  p_curRegWarpTempIndex = &self->_curRegWarpTempIndex;
  p_preBracketFrameIndex = &self->_preBracketFrameIndex;
  objc_msgSend_reset(self->_denoiseFusePipeline, a2, v2, v3);
  self->_int aggregateErr = 0;
  uint64_t v8 = (const void *)*((void *)p_preBracketFrameIndex + 1);
  if (v8)
  {
    CFRelease(v8);
    *((void *)p_preBracketFrameIndex + 1) = 0;
  }
  uint64_t v9 = (void *)*((void *)p_curRegWarpTempIndex + 193);
  *((void *)p_curRegWarpTempIndex + 193) = 0;

  if (*((int *)v5 + 17) >= 1)
  {
    uint64_t v10 = 0;
    bracketSampleBuffers = self->_bracketSampleBuffers;
    bracketProperties = self->_bracketProperties;
    do
    {
      int v13 = bracketSampleBuffers[v10];
      if (v13)
      {
        CFRelease(v13);
        bracketSampleBuffers[v10] = 0;
      }
      bzero(bracketProperties, 0x36BE0uLL);
      ++v10;
      bracketProperties = (frameProperties_t *)((char *)bracketProperties + 224224);
    }
    while (v10 < *((int *)v5 + 17));
  }
  bzero(&self->_prebracketedProperties, 0x36BE0uLL);
  *((unsigned char *)p_curRegWarpTempIndex + 1352) = 1;
  *((_DWORD *)v5 + 17) = 0;
  int *p_curRegWarpTempIndex = -1;
  int *p_preBracketFrameIndex = -1;
  bzero(self->_fusionConf.colorSpaceConversionParameters, 0x540uLL);
  p_preBracketFrameIndex[4] = -1;
  ++*((_DWORD *)v5 + 18);
  *id v5 = 0;
  objc_msgSend_setSrlEnabled_(self->_denoiseFusePipeline, v14, 1, v15);
  return 0;
}

- (void)addToSidecar:(id)a3 forKey:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend_objectForKeyedSubscript_(self->_nrfConfig, v7, (uint64_t)v6, v8),
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(self->_nrfConfig, v7, (uint64_t)v6, v10);
    objc_msgSend_addEntriesFromDictionary_(v11, v12, (uint64_t)v14, v13);
  }
  else
  {
    objc_msgSend_setObject_forKeyedSubscript_(self->_nrfConfig, v7, (uint64_t)v14, (uint64_t)v6);
  }
}

- (BOOL)_isGainMapSupported
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  p_metalCommandQueue = (void **)&self->_metalCommandQueue;
  objc_msgSend_objectForKeyedSubscript_(self->_metalCommandQueue, a2, @"DefaultSensorIDs", v2);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v29 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v3, v6, v10, v7);
        id v14 = objc_msgSend_objectForKeyedSubscript_(*p_metalCommandQueue, v12, v10, v13);
        uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)v11, v16);
        uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v17, v18, @"NRFParameters", v19);
        uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v20, v21, @"NRFParameters", v22);
        uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v23, v24, @"GainMap", v25);

        if (v26)
        {
          BOOL v27 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v31, (uint64_t)v35, 16);
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v27 = 0;
LABEL_11:

  return v27;
}

- (BOOL)_isSemanticStylesSupported
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  p_metalCommandQueue = (void **)&self->_metalCommandQueue;
  objc_msgSend_objectForKeyedSubscript_(self->_metalCommandQueue, a2, @"DefaultSensorIDs", v2);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v29 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v3, v6, v10, v7);
        id v14 = objc_msgSend_objectForKeyedSubscript_(*p_metalCommandQueue, v12, v10, v13);
        uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)v11, v16);
        uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v17, v18, @"NRFParameters", v19);
        uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v20, v21, @"NRFParameters", v22);
        uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v23, v24, @"SemanticStyles", v25);

        if (v26)
        {
          BOOL v27 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v31, (uint64_t)v35, 16);
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v27 = 0;
LABEL_11:

  return v27;
}

- (void)setLinearOutputMetadata:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (char *)self->_bracketProperties + 224224 * *(int *)&self->_anon_14893c[1004];
    id v6 = (unsigned __int16 *)((char *)self->_bracketProperties + 224224 * *(int *)&self->_anon_14893c[1012]);
    uint64_t v41 = v4;
    float v7 = sub_262F98950((uint64_t)(v5 + 16), (uint64_t)(v6 + 8), 2);
    int v8 = *((_DWORD *)v5 + 14);
    int v9 = *((_DWORD *)v5 + 10);
    objc_msgSend_setObject_forKeyedSubscript_(v41, v10, *MEMORY[0x263F04038], *MEMORY[0x263F04020]);
    objc_msgSend_setObject_forKeyedSubscript_(v41, v11, *MEMORY[0x263F03FE8], *MEMORY[0x263F03FC0]);
    uint64_t v15 = *((void *)self->_regWarpInput + 5);
    if (v15 && *(unsigned char *)(v15 + 79) && (LODWORD(self->_output) - 1) <= 1)
    {
      uint64_t v16 = objc_msgSend_getSTFLTM_asNSData(self->_denoiseFusePipeline, v12, v13, v14);
    }
    else
    {
      uint64_t v16 = sub_262FBB3E8((unsigned __int16 *)v5 + 84);
    }
    uint64_t v18 = (void *)v16;
    objc_msgSend_setObject_forKeyedSubscript_(v41, v17, v16, *MEMORY[0x263F2F530]);

    uint64_t v19 = sub_262FBB4B8(v6 + 110700);
    objc_msgSend_setObject_forKeyedSubscript_(v41, v20, (uint64_t)v19, *MEMORY[0x263F2F4D8]);

    uint64_t v21 = sub_262FBB4B8(v6 + 110958);
    objc_msgSend_setObject_forKeyedSubscript_(v41, v22, (uint64_t)v21, *MEMORY[0x263F2F4E8]);

    LODWORD(v23) = v8;
    BOOL v27 = objc_msgSend_numberWithFloat_(NSNumber, v24, v25, v26, v23);
    objc_msgSend_setObject_forKeyedSubscript_(v41, v28, (uint64_t)v27, *MEMORY[0x263F2F0F8]);

    *(float *)&double v29 = v7;
    long long v33 = objc_msgSend_numberWithFloat_(NSNumber, v30, v31, v32, v29);
    objc_msgSend_setObject_forKeyedSubscript_(v41, v34, (uint64_t)v33, *MEMORY[0x263F2F0F0]);

    LODWORD(v35) = v9;
    uint64_t v39 = objc_msgSend_numberWithFloat_(NSNumber, v36, v37, v38, v35);
    objc_msgSend_setObject_forKeyedSubscript_(v41, v40, (uint64_t)v39, *MEMORY[0x263F2F0D8]);
  }

  MEMORY[0x270F9A828]();
}

- (void)_prepareOutputMetadata
{
  uint64_t v180 = *MEMORY[0x263EF8340];
  p_int referenceFrameCandidatesCount = &self->_referenceFrameCandidatesCount;
  p_nInputBrackets = &self->_nInputBrackets;
  if (dword_26B429788)
  {
    float v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int aggregateErr = self->_aggregateErr;
  if (aggregateErr >= 255) {
    int aggregateErr = 255;
  }
  unsigned int v9 = p_referenceFrameCandidatesCount[4];
  if (v9 <= 0xF) {
    int v10 = v9 << 12;
  }
  else {
    int v10 = 61440;
  }
  uint64_t v11 = v10 | aggregateErr;
  uint64_t SRLStatus = objc_msgSend_getSRLStatus(self->_denoiseFusePipeline, a2, v2, v3);
  v179[0] = 0;
  int v13 = p_referenceFrameCandidatesCount[4];
  if (v13 == 1) {
    int v14 = 1;
  }
  else {
    int v14 = 2 * (v13 == 2);
  }
  sub_262F9C11C(v14, (int *)v179, *((void **)p_nInputBrackets + 188));
  uint64_t v17 = (uint64_t *)MEMORY[0x263F2F130];
  uint64_t v18 = (uint64_t *)MEMORY[0x263F2F068];
  if (*((void *)p_nInputBrackets + 190))
  {
    uint64_t v19 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v15, v179[0], v16);
    double v23 = objc_msgSend_metadata(*((void **)p_nInputBrackets + 190), v20, v21, v22);
    objc_msgSend_setObject_forKeyedSubscript_(v23, v24, (uint64_t)v19, *MEMORY[0x263F2F0B8]);

    BOOL v27 = objc_msgSend_objectForKeyedSubscript_(*((void **)p_nInputBrackets + 188), v25, @"GreenGhostLowLight", v26);
    uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v27, v28, @"maskAverage", v29);

    if (v30)
    {
      long long v34 = objc_msgSend_metadata(*((void **)p_nInputBrackets + 190), v31, v32, v33);
      objc_msgSend_setObject_forKeyedSubscript_(v34, v35, (uint64_t)v30, *MEMORY[0x263F2F0B0]);

      uint64_t v38 = objc_msgSend_objectForKeyedSubscript_(*((void **)p_nInputBrackets + 188), v36, @"GreenGhostLowLight", v37);
      objc_msgSend_setObject_forKeyedSubscript_(v38, v39, 0, @"maskAverage");
    }
    uint64_t v40 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v31, v11, v33);
    uint64_t v44 = objc_msgSend_metadata(*((void **)p_nInputBrackets + 190), v41, v42, v43);
    objc_msgSend_setObject_forKeyedSubscript_(v44, v45, (uint64_t)v40, *v17);

    uint64_t v48 = objc_msgSend_numberWithInt_(NSNumber, v46, *p_nInputBrackets, v47);
    uint64_t v52 = objc_msgSend_metadata(*((void **)p_nInputBrackets + 190), v49, v50, v51);
    objc_msgSend_setObject_forKeyedSubscript_(v52, v53, (uint64_t)v48, *MEMORY[0x263F2F118]);

    long long v56 = objc_msgSend_numberWithInt_(NSNumber, v54, p_nInputBrackets[1], v55);
    uint64_t v60 = objc_msgSend_metadata(*((void **)p_nInputBrackets + 190), v57, v58, v59);
    objc_msgSend_setObject_forKeyedSubscript_(v60, v61, (uint64_t)v56, *MEMORY[0x263F2F120]);

    uint64_t v64 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v62, SRLStatus, v63);
    long long v68 = objc_msgSend_metadata(*((void **)p_nInputBrackets + 190), v65, v66, v67);
    objc_msgSend_setObject_forKeyedSubscript_(v68, v69, (uint64_t)v64, *MEMORY[0x263F2F128]);

    LODWORD(v70) = p_nInputBrackets[384];
    uint64_t v74 = objc_msgSend_numberWithFloat_(NSNumber, v71, v72, v73, v70);
    int v78 = objc_msgSend_metadata(*((void **)p_nInputBrackets + 190), v75, v76, v77);
    objc_msgSend_setObject_forKeyedSubscript_(v78, v79, (uint64_t)v74, *v18);

    long long v83 = objc_msgSend_linearOutputMetadata(*((void **)p_nInputBrackets + 190), v80, v81, v82);
    objc_msgSend_setLinearOutputMetadata_(self, v84, (uint64_t)v83, v85);

    uint64_t v89 = *(void *)(*((void *)p_nInputBrackets + 171) + 40);
    if (v89 && *(unsigned char *)(v89 + 79))
    {
      id v90 = objc_msgSend_metadata(*((void **)p_nInputBrackets + 190), v86, v87, v88);
      objc_msgSend_setObject_forKeyedSubscript_(v90, v91, MEMORY[0x263EFFA88], *MEMORY[0x263F2F190]);

      uint64_t v92 = NSNumber;
      uint64_t STFStillApplied = objc_msgSend_getSTFStillApplied(self->_denoiseFusePipeline, v93, v94, v95);
      CVImageBufferRef v99 = objc_msgSend_numberWithBool_(v92, v97, STFStillApplied, v98);
      id v103 = objc_msgSend_metadata(*((void **)p_nInputBrackets + 190), v100, v101, v102);
      objc_msgSend_setObject_forKeyedSubscript_(v103, v104, (uint64_t)v99, *MEMORY[0x263F2F180]);

      if (!objc_msgSend_getSTFStillApplied(self->_denoiseFusePipeline, v105, v106, v107))
      {
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v111 = NSNumber;
      denoiseFusePipeline = self->_denoiseFusePipeline;
      uint64_t v113 = objc_msgSend_linearOutputMetadata(*((void **)p_nInputBrackets + 190), v108, v109, v110);
      uint64_t STFStillCorrectionStrength = objc_msgSend_getSTFStillCorrectionStrength_(denoiseFusePipeline, v114, v113 != 0, v115);
      uint64_t v119 = objc_msgSend_numberWithInt_(v111, v117, STFStillCorrectionStrength, v118);
      uint64_t v123 = objc_msgSend_metadata(*((void **)p_nInputBrackets + 190), v120, v121, v122);
      objc_msgSend_setObject_forKeyedSubscript_(v123, v124, (uint64_t)v119, *MEMORY[0x263F2F188]);

      uint64_t v18 = (uint64_t *)MEMORY[0x263F2F068];
      int v125 = NSNumber;
      STFStillAnalyticsVersiouint64_t n = objc_msgSend_getSTFStillAnalyticsVersion(self->_denoiseFusePipeline, v126, v127, v128);
      uint64_t v132 = objc_msgSend_numberWithUnsignedInt_(v125, v130, STFStillAnalyticsVersion, v131);
      char v136 = objc_msgSend_metadata(*((void **)p_nInputBrackets + 190), v133, v134, v135);
      objc_msgSend_setObject_forKeyedSubscript_(v136, v137, (uint64_t)v132, *MEMORY[0x263F2F178]);
    }
    else
    {
      uint64_t v132 = objc_msgSend_metadata(*((void **)p_nInputBrackets + 190), v86, v87, v88);
      objc_msgSend_setObject_forKeyedSubscript_(v132, v138, MEMORY[0x263EFFA80], *MEMORY[0x263F2F190]);
    }

    goto LABEL_20;
  }
LABEL_21:
  if (*((void *)p_nInputBrackets + 191))
  {
    uint64_t v139 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v15, v11, v16);
    uint64_t v143 = objc_msgSend_syntheticReferenceMetadata(*((void **)p_nInputBrackets + 191), v140, v141, v142);
    objc_msgSend_setObject_forKeyedSubscript_(v143, v144, (uint64_t)v139, *v17);

    int v147 = objc_msgSend_numberWithInt_(NSNumber, v145, *p_nInputBrackets, v146);
    id v151 = objc_msgSend_syntheticReferenceMetadata(*((void **)p_nInputBrackets + 191), v148, v149, v150);
    objc_msgSend_setObject_forKeyedSubscript_(v151, v152, (uint64_t)v147, *MEMORY[0x263F2F118]);

    uint64_t v155 = objc_msgSend_numberWithInt_(NSNumber, v153, p_nInputBrackets[1], v154);
    uint64_t v159 = objc_msgSend_syntheticReferenceMetadata(*((void **)p_nInputBrackets + 191), v156, v157, v158);
    objc_msgSend_setObject_forKeyedSubscript_(v159, v160, (uint64_t)v155, *MEMORY[0x263F2F120]);

    uint64_t v163 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v161, SRLStatus, v162);
    uint64_t v167 = objc_msgSend_syntheticReferenceMetadata(*((void **)p_nInputBrackets + 191), v164, v165, v166);
    objc_msgSend_setObject_forKeyedSubscript_(v167, v168, (uint64_t)v163, *MEMORY[0x263F2F128]);

    LODWORD(v169) = p_nInputBrackets[384];
    int v173 = objc_msgSend_numberWithFloat_(NSNumber, v170, v171, v172, v169);
    uint64_t v177 = objc_msgSend_syntheticReferenceMetadata(*((void **)p_nInputBrackets + 191), v174, v175, v176);
    objc_msgSend_setObject_forKeyedSubscript_(v177, v178, (uint64_t)v173, *v18);
  }
}

- (int)_multiFrameProcessing:(BOOL)a3
{
  BOOL v4 = a3;
  int updated = objc_msgSend_updateEV0ReferenceFrameIfNecessary(self, a2, a3, v3);
  int v9 = updated;
  int aggregateErr = self->_aggregateErr;
  if (aggregateErr) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = updated == 0;
  }
  if (!v11) {
    goto LABEL_13;
  }
  if (aggregateErr) {
    return v9;
  }
  int v12 = objc_msgSend__registerImages_(self, v7, 1, v8);
  int v9 = v12;
  int v15 = self->_aggregateErr;
  if (!v15 && v12)
  {
    int v16 = 1;
LABEL_14:
    self->_int aggregateErr = v16;
    return v9;
  }
  if (v15) {
    return v9;
  }
  int v17 = objc_msgSend__processSIFRandRefEV0IfPossible_(self, v13, 1, v14);
  int v9 = v17;
  int v21 = self->_aggregateErr;
  if (!v21)
  {
    if (v17)
    {
LABEL_13:
      int v16 = 4;
      goto LABEL_14;
    }
  }
  if (v21) {
    return v9;
  }
  p_regWarpInput = &self->_regWarpInput;
  if (*((void *)self->_regWarpInput + 3))
  {
    uint64_t v24 = &self->_anon_17fa15[7];
    uint64_t v25 = objc_msgSend_statistics(self->_semanticStyleProperties, v18, v19, v20);
    if (objc_msgSend_stationary(v25, v26, v27, v28)) {
      BOOL v29 = *(unsigned char *)(*((void *)*p_regWarpInput + 3) + 140) != 0;
    }
    else {
      BOOL v29 = 0;
    }

    if ((*(_DWORD *)(*((void *)*p_regWarpInput + 3) + 96) | 2) == 3 && !v29 && LODWORD(self->_output) == 2)
    {
      uint64_t referenceFrameCandidatesCount = self->_referenceFrameCandidatesCount;
      if (referenceFrameCandidatesCount == self->_batchCount && !*v24)
      {
        int canCopyBack_nrfPlist = objc_msgSend_lowLightHybridRegister_refFrameIdx_nonRefFrameProps_refFrameProps_canCopyBack_nrfPlist_(self->_denoiseFusePipeline, v30, referenceFrameCandidatesCount - 1, self->_cntBracketSampleBuffers, &self->_prebracketedProperties.meta.exposureParams.exposure_time+ 56056 * referenceFrameCandidatesCount, (char *)self->_bracketProperties + 224224 * self->_cntBracketSampleBuffers, BYTE4(self->_nrfFusionOutput->_inferenceInputPixelBuffer));
        if (canCopyBack_nrfPlist) {
          return canCopyBack_nrfPlist;
        }
        unsigned __int8 *v24 = 1;
      }
    }
    int v35 = objc_msgSend__setupFusionConfig(self, v30, v31, v32);
    int v9 = v35;
    int v39 = self->_aggregateErr;
    if (v39 || !v35)
    {
      if (!v39)
      {
        objc_msgSend_storeReferenceIfNeeded(self, v36, v37, v38);
        int output = (int)self->_output;
        if ((output - 1) < 2)
        {
          int v45 = objc_msgSend__nrfFuseImages_(self, v40, v4, v42);
        }
        else
        {
          if (output != 3)
          {
            if ((output - 4) < 2)
            {
              objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], v40, *MEMORY[0x263EFF488], @"*** RawNightMode is unsupported in this version of NRF.", 0);
              id v44 = (id)objc_claimAutoreleasedReturnValue();
              objc_exception_throw(v44);
            }
            return v9;
          }
          int v45 = objc_msgSend__deepFusion(self, v40, v41, v42);
        }
        int v9 = v45;
        if (self->_aggregateErr || !v45) {
          return v9;
        }
        int v16 = 6;
        goto LABEL_14;
      }
    }
    else
    {
      self->_int aggregateErr = 15;
    }
    FigDebugAssert3();
    return v9;
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
  int v9 = (char *)&self->_registrationPipelineRWPP + 4;
  int shouldDownsampleRWPPInputWithPixelFormat_processingType = objc_msgSend_shouldDownsampleRWPPInputWithPixelFormat_processingType_(self, a2, *(uint64_t *)&a5, LODWORD(self->_output));
  if (shouldDownsampleRWPPInputWithPixelFormat_processingType) {
    uint64_t v6 = 875704422;
  }
  else {
    uint64_t v6 = v6;
  }
  if (self->_metal
    || (unsigned char *v9 = shouldDownsampleRWPPInputWithPixelFormat_processingType,
        id v14 = objc_alloc(MEMORY[0x263F2EE70]),
        int v17 = (FigMetalContext *)objc_msgSend_initWithConfig_(v14, v15, (uint64_t)&self->_registrationPipelineRWPPConfig.numVerticalBlocks, v16), v18 = self->_metal, self->_metal = v17, v18, self->_metal))
  {
    uint64_t v19 = objc_msgSend_bytes(self->_sharedRegWarpBuffer, v11, v12, v13);
    metal = self->_metal;
    uint64_t v24 = objc_msgSend_length(self->_sharedRegWarpBuffer, v21, v22, v23);
    int Resources_imageHeight_imageFormat_externalMemory_externalMemorySize = objc_msgSend_allocateResources_imageHeight_imageFormat_externalMemory_externalMemorySize_(metal, v25, a3, a4, v6, v19, v24);
    int v27 = Resources_imageHeight_imageFormat_externalMemory_externalMemorySize;
    if (self->_aggregateErr || !Resources_imageHeight_imageFormat_externalMemory_externalMemorySize)
    {
      if (!Resources_imageHeight_imageFormat_externalMemory_externalMemorySize) {
        return v27;
      }
    }
    else
    {
      self->_int aggregateErr = 16;
    }
    FigDebugAssert3();
    return v27;
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)_nrfFuseImages:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (char *)&self->_referenceFrameIndex + 1;
  uint64_t v6 = &self->_anon_14893c[1004];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressiveBracketingParameters);
  int v8 = *(_DWORD *)(v5 + 31);
  uint64_t v12 = objc_msgSend_inferenceInputPixelBuffer(*(void **)(v6 + 204), v9, v10, v11);
  uint64_t v148 = WeakRetained;
  char v16 = objc_opt_respondsToSelector();
  if ((v12
     || objc_msgSend_providesInferencesWithoutInferenceInputPixelBuffer(*(void **)(v6 + 204), v13, v14, v15))&& (v16 & 1) != 0)
  {
    int v17 = v153;
    v153[0] = MEMORY[0x263EF8330];
    v153[1] = 3221225472;
    v153[2] = sub_262FDF024;
    v153[3] = &unk_2655C3838;
    int v140 = (id *)v154;
    v154[0] = WeakRetained;
    v154[1] = self;
    int v18 = 1;
  }
  else
  {
    int v18 = 0;
    int v17 = 0;
  }
  uint64_t v143 = MEMORY[0x263E63E60](v17);
  if (!*(void *)(*(void *)(v6 + 52) + 24)) {
    goto LABEL_74;
  }
  int v146 = v8;
  int v147 = v18;
  int v141 = !v3;
  if (!v12 || !v3 || v8 == 2) {
    goto LABEL_13;
  }
  if (v6[20])
  {
LABEL_74:
    FigDebugAssert3();
    int isLowLight_gainMap = FigSignalErrorAt();
    goto LABEL_75;
  }
  BOOL v22 = v3;
  uint64_t v23 = objc_msgSend_inferenceInputPixelBuffer(*(void **)(v6 + 204), v19, v20, v21);
  uint64_t v24 = *((unsigned int *)v6 + 4);
  uint64_t v25 = v6;
  uint64_t v26 = *(unsigned int *)v6;
  uint64_t v27 = *((unsigned int *)v25 + 2);
  uint64_t v31 = (__CVBuffer *)objc_msgSend_pixelBuffer(*(void **)(v25 + 204), v28, v29, v30);
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(v31, 0);
  uint64_t v36 = (__CVBuffer *)objc_msgSend_pixelBuffer(*(void **)(v25 + 204), v33, v34, v35);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(v36, 0);
  int v39 = objc_msgSend__processInferenceImage_sourceFrameType_sourceFrameIndex_ltcFrameIndex_gtcFrameIndex_originalWidth_originalHeight_(self, v38, v23, 0, v24, v26, v27, WidthOfPlane, HeightOfPlane);
  if (v39)
  {
    int isLowLight_gainMap = v39;
    FigDebugAssert3();
    uint64_t v89 = 0;
    uint64_t v91 = (void *)v143;
    int v18 = v147;
    goto LABEL_69;
  }
  uint64_t v6 = v25;
  LOBYTE(v3) = v22;
  int v8 = v146;
  int v18 = v147;
LABEL_13:
  LOBYTE(v138) = v8 == 2;
  bracketProperties = self->_bracketProperties;
  colorSpaceConversionParameters = self->_fusionConf.colorSpaceConversionParameters;
  int isLowLight = objc_msgSend_fuseFramesWithConfig_properties_nrfPlist_batchN_isLastBatch_usePatchBasedFusion_isLowLight_(self->_denoiseFusePipeline, v19, (uint64_t)self->_fusionConf.colorSpaceConversionParameters, (uint64_t)self->_bracketProperties, v138);
  if (isLowLight)
  {
    int isLowLight_gainMap = isLowLight;
    FigDebugAssert3();
LABEL_75:
    uint64_t v89 = 0;
    goto LABEL_37;
  }
  BOOL v142 = v3;
  char v41 = objc_opt_respondsToSelector();
  char v42 = objc_opt_respondsToSelector();
  char v46 = v42;
  if (v41 & 1) != 0 || (v42)
  {
    uint64_t v50 = objc_msgSend_array(MEMORY[0x263EFF980], v43, v44, v45);
    if (*(int *)(v5 + 15) >= 1)
    {
      uint64_t v51 = 0;
      do
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(self->_bracketSampleBuffers[v51]);
        IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
        uint64_t ID = IOSurfaceGetID(IOSurface);
        uint64_t v57 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v55, ID, v56);
        objc_msgSend_addObject_(v50, v58, (uint64_t)v57, v59);

        if (v41) {
          objc_msgSend_processor_didEnqueueProcessingForSurfaceID_(v148, v47, (uint64_t)self, ID);
        }
        ++v51;
      }
      while (v51 < *(int *)(v5 + 15));
    }
    if (v46)
    {
      uint64_t v60 = objc_msgSend_commandQueue(*(void **)(v6 + 140), v47, v48, v49);
      uint64_t v64 = objc_msgSend_commandBuffer(v60, v61, v62, v63);

      v149[0] = MEMORY[0x263EF8330];
      v149[1] = 3221225472;
      v149[2] = sub_262FDF030;
      v149[3] = &unk_2655C3860;
      id v150 = v50;
      id v151 = v148;
      int v152 = self;
      objc_msgSend_addCompletedHandler_(v64, v65, (uint64_t)v149, v66);
      objc_msgSend_commit(v64, v67, v68, v69);
    }
    int v8 = v146;
  }
  int v70 = *(_DWORD *)(v5 + 15);
  int v18 = v147;
  if (v70 >= 1)
  {
    uint64_t v71 = 0;
    bracketSampleBuffers = self->_bracketSampleBuffers;
    do
    {
      uint64_t v73 = bracketSampleBuffers[v71];
      if (v73)
      {
        CFRelease(v73);
        bracketSampleBuffers[v71] = 0;
        int v70 = *(_DWORD *)(v5 + 15);
      }
      ++v71;
    }
    while (v71 < v70);
  }
  objc_msgSend_releaseInputBindings(self->_denoiseFusePipeline, v43, v44, v45);
  if (!v142)
  {
    uint64_t v89 = 0;
LABEL_36:
    int isLowLight_gainMap = 0;
LABEL_37:
    uint64_t v91 = (void *)v143;
    goto LABEL_69;
  }
  if (objc_msgSend_gainMapOutputPixelBuffer(*(void **)(v6 + 204), v74, v75, v76))
  {
    uint64_t v80 = (__CVBuffer *)objc_msgSend_gainMapOutputPixelBuffer(*(void **)(v6 + 204), v77, v78, v79);
    int v84 = v141;
    if (CVPixelBufferGetPixelFormatType(v80) != 1278226488)
    {
      FigDebugAssert3();
      uint64_t v89 = 0;
      int isLowLight_gainMap = -12780;
      goto LABEL_37;
    }
    uint64_t v85 = *(void **)(v6 + 140);
    uint64_t v86 = objc_msgSend_gainMapOutputPixelBuffer(*(void **)(v6 + 204), v81, v82, v83);
    uint64_t v89 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(v85, v87, v86, 10, 7, 0);
    if (!v89
      || objc_msgSend_doGainMap_properties_output_outputHeadroom_nrfPlist_useFusedFrame_(self->_denoiseFusePipeline, v88, (uint64_t)colorSpaceConversionParameters, (uint64_t)bracketProperties, v89, &self->_processedSyntheticReference, *(void *)(v6 + 52), 1))
    {
      goto LABEL_79;
    }
  }
  else
  {
    uint64_t v89 = 0;
    int v84 = v141;
  }
  if (((v84 | v147 ^ 1) & 1) == 0 && v8 == 2)
  {
    if (v6[20]) {
      goto LABEL_79;
    }
    uint64_t v92 = objc_msgSend_inferenceInputPixelBuffer(*(void **)(v6 + 204), v77, v78, v79);
    uint64_t v93 = *((unsigned int *)v6 + 4);
    uint64_t v94 = *(unsigned int *)v6;
    uint64_t v95 = *((unsigned int *)v6 + 2);
    CVImageBufferRef v99 = (__CVBuffer *)objc_msgSend_pixelBuffer(*(void **)(v6 + 204), v96, v97, v98);
    size_t v100 = CVPixelBufferGetWidthOfPlane(v99, 0);
    char v104 = (__CVBuffer *)objc_msgSend_pixelBuffer(*(void **)(v6 + 204), v101, v102, v103);
    size_t v105 = CVPixelBufferGetHeightOfPlane(v104, 0);
    uint64_t v106 = v93;
    size_t v107 = v100;
    int v8 = v146;
    int v18 = v147;
    int v109 = objc_msgSend__processInferenceImage_sourceFrameType_sourceFrameIndex_ltcFrameIndex_gtcFrameIndex_originalWidth_originalHeight_(self, v108, v92, 2, v106, v94, v95, v107, v105);
    if (v109)
    {
      int isLowLight_gainMap = v109;
      FigDebugAssert3();
      goto LABEL_37;
    }
  }
  if (objc_msgSend_linearOutputPixelBuffer(*(void **)(v6 + 204), v77, v78, v79))
  {
    denoiseFusePipeline = self->_denoiseFusePipeline;
    uint64_t v114 = (char *)bracketProperties + 224224 * *(int *)v6;
    uint64_t v115 = objc_msgSend_linearOutputPixelBuffer(*(void **)(v6 + 204), v110, v111, v112);
    uint64_t v116 = (uint64_t)v114;
    int v8 = v146;
    LinearBufferWithConfig_referenceFrameProperties_int output = objc_msgSend_extractLinearBufferWithConfig_referenceFrameProperties_output_(denoiseFusePipeline, v117, (uint64_t)colorSpaceConversionParameters, v116, v115);
    if (LinearBufferWithConfig_referenceFrameProperties_output) {
      goto LABEL_80;
    }
  }
  objc_msgSend_resetFusion_(self->_denoiseFusePipeline, v110, *(unsigned int *)(v5 + 31), v112);
  uint64_t v122 = *(void *)(v6 + 52);
  uint64_t v123 = *(void *)(v122 + 40);
  if (!v123)
  {
LABEL_79:
    FigDebugAssert3();
    LinearBufferWithConfig_referenceFrameProperties_int output = FigSignalErrorAt();
LABEL_80:
    int isLowLight_gainMap = LinearBufferWithConfig_referenceFrameProperties_output;
    goto LABEL_37;
  }
  if (v8 != 2) {
    goto LABEL_50;
  }
  int v124 = *(unsigned __int8 *)(v123 + 108);
  if (*(unsigned char *)(v123 + 108))
  {
    if (*((float *)v6 + 91) > *(float *)(v123 + 112))
    {
      int v124 = *((float *)v6 + 93) > *(float *)(v123 + 116);
      goto LABEL_51;
    }
LABEL_50:
    int v124 = 0;
  }
LABEL_51:
  int v125 = *(unsigned __int8 *)(v123 + 120);
  int v126 = *(unsigned __int8 *)(v123 + 121);
  if (v125) {
    BOOL v127 = v126 == 0;
  }
  else {
    BOOL v127 = 1;
  }
  if (!v127)
  {
    FigDebugAssert3();
    goto LABEL_36;
  }
  if (v126 | v125) {
    char v128 = 1;
  }
  else {
    char v128 = v124;
  }
  if (v126) {
    int v129 = 3;
  }
  else {
    int v129 = 2;
  }
  if (v124) {
    int v130 = 1;
  }
  else {
    int v130 = v129;
  }
  uint64_t v131 = v6;
  if ((v128 & 1) == 0) {
    int v130 = *v5 - 1;
  }
  BOOL v132 = v8 == 2;
  float v133 = self->_denoiseFusePipeline;
  uint64_t v134 = *(void *)(v5 + 63);
  uint64_t v135 = objc_msgSend_pixelBuffer(*(void **)(v131 + 204), v119, v120, v121);
  BYTE4(v139) = v132;
  LODWORD(v139) = v130;
  uint64_t v91 = (void *)v143;
  int isLowLight_gainMap = objc_msgSend_toneMapAndDenoiseFusedFramesWithConfig_properties_nrfPlist_style_output_inferenceProvider_colorCubeFixType_isLowLight_gainMap_(v133, v136, (uint64_t)colorSpaceConversionParameters, (uint64_t)bracketProperties, v122, v134, v135, v143, v139, v89);
  if (isLowLight_gainMap) {
    FigDebugAssert3();
  }
LABEL_69:

  if (v18) {
  return isLowLight_gainMap;
  }
}

- (int)_processInferenceImage:(__CVBuffer *)a3 sourceFrameType:(int)a4 sourceFrameIndex:(int)a5 ltcFrameIndex:(int)a6 gtcFrameIndex:(int)a7 originalWidth:(unint64_t)a8 originalHeight:(unint64_t)a9
{
  v54[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    p_inferenceInputGenerated = &self->_inferenceInputGenerated;
    if (self->_inferenceInputGenerated) {
      return 0;
    }
    uint64_t v13 = *(void *)&a7;
    uint64_t v14 = *(void *)&a6;
    uint64_t v15 = *(void *)&a5;
    uint64_t v16 = *(void *)&a4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_progressiveBracketingParameters);
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      uint64_t v19 = [LumaChromaImage alloc];
      uint64_t v21 = objc_msgSend_initWithContext_pixelBuffer_lumaAlignmentFactor_chromaAlignmentFactor_(v19, v20, *(void *)&self->_fusionOptions, (uint64_t)a3, 1, 1);
      if (v21)
      {
        uint64_t v49 = (void *)v21;
        uint64_t v50 = WeakRetained;
        if (*((_DWORD *)&self->_bracketProperties[1].meta.ROI.origin.y + 56056 * (int)v14))
        {
          int v23 = objc_msgSend_toneMapBand1Frame_properties_sourceFrameType_sourceFrameIndex_ltcFrameIndex_gtcFrameIndex_nrfPlist_(self->_denoiseFusePipeline, v22, v21, (uint64_t)self->_bracketProperties, v16, v15, v14, v13, self->_regWarpInput);
          if (v23)
          {
            int v11 = v23;
LABEL_25:
            FigDebugAssert3();

            goto LABEL_26;
          }
        }
        else
        {
          if (v16)
          {
            uint64_t v48 = (void *)v21;
            FigDebugAssert3();
            int v11 = FigSignalErrorAt();

LABEL_26:
            id WeakRetained = v50;
            goto LABEL_16;
          }
          int v24 = objc_msgSend_downsampleBand0Frame_sourceFrameIndex_(self->_denoiseFusePipeline, v22, v21, v15);
          if (v24)
          {
            int v11 = v24;
            goto LABEL_25;
          }
        }
        uint64_t v25 = (double *)(&self->_bracketProperties[0].meta.sensorID + 56056 * (int)v15);
        CGFloat v26 = v25[16];
        CGFloat v27 = v25[17];
        CGFloat v28 = v25[18];
        CGFloat v29 = v25[19];
        size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
        size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
        if (WidthOfPlane != a8 || (uint64_t v35 = 0, HeightOfPlane != a9))
        {
          memset(&v52, 0, sizeof(v52));
          CGAffineTransformMakeScale(&v52, (double)WidthOfPlane / (double)a8, (double)HeightOfPlane / (double)a9);
          CGAffineTransform v51 = v52;
          v56.origin.CGFloat x = v26;
          v56.origin.CGFloat y = v27;
          v56.size.CGFloat width = v28;
          v56.size.CGFloat height = v29;
          CGRect v57 = CGRectApplyAffineTransform(v56, &v51);
          CGFloat x = v57.origin.x;
          CGFloat y = v57.origin.y;
          CGFloat width = v57.size.width;
          CGFloat height = v57.size.height;
          id v40 = objc_alloc(MEMORY[0x263EFF9A0]);
          uint64_t v53 = *MEMORY[0x263F2F6E0];
          v58.origin.CGFloat x = x;
          v58.origin.CGFloat y = y;
          v58.size.CGFloat width = width;
          v58.size.CGFloat height = height;
          DictionaryRepresentatiouint64_t n = CGRectCreateDictionaryRepresentation(v58);
          v54[0] = DictionaryRepresentation;
          uint64_t v43 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v42, (uint64_t)v54, (uint64_t)&v53, 1);
          uint64_t v35 = objc_msgSend_initWithDictionary_(v40, v44, (uint64_t)v43, v45);
        }
        objc_msgSend_waitForSchedule(*(void **)&self->_fusionOptions, v32, v33, v34);
        objc_msgSend_processor_outputReadyWithFrameType_outputPixelBuffer_outputMetadata_error_(v50, v46, (uint64_t)self, 9, a3, v35, 0);
        BOOL *p_inferenceInputGenerated = 1;

        id WeakRetained = v50;
        int v11 = 0;
        goto LABEL_16;
      }
      FigDebugAssert3();
      int v11 = -12786;
    }
    else
    {
      FigDebugAssert3();
      int v11 = -12784;
    }
LABEL_16:

    return v11;
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)_deepFusion
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  BOOL v4 = &self->_anon_14893c[1012];
  uint64_t v5 = (int *)MEMORY[0x263F00E10];
  if (!self->_referenceFrame
    || !LOBYTE(self->_lscGainsTex)
    && objc_msgSend__doDeepFusionSytheticRefererenceAndProxy(self, a2, v2, v3))
  {
    FigDebugAssert3();
    int v23 = FigSignalErrorAt();
    goto LABEL_66;
  }
  int v7 = *v5;
  if (*v5 == 1)
  {
    kdebug_trace();
    int v7 = *v5;
  }
  if (v7)
  {
    int v8 = objc_msgSend_commandQueue(*(void **)(v4 + 132), a2, v2, v3);
    uint64_t v12 = objc_msgSend_commandBuffer(v8, v9, v10, v11);

    objc_msgSend_setLabel_(v12, v13, @"KTRACE_START_MTL", v14);
    objc_msgSend_addCompletedHandler_(v12, v15, (uint64_t)&unk_270E341E8, v16);
    objc_msgSend_commit(v12, v17, v18, v19);
  }
  uint64_t v20 = objc_msgSend_syntheticReferenceMetadata(*(void **)(v4 + 204), a2, v2, v3);
  int v23 = objc_msgSend__populateDeepFusionMetadata_(self, v21, (uint64_t)v20, v22);

  if (v23)
  {
    FigDebugAssert3();
LABEL_66:
    uint64_t v48 = 0;
    __dst = 0;
    uint64_t v106 = 0;
    id v72 = 0;
    id v40 = 0;
    size_t v107 = 0;
    goto LABEL_52;
  }
  int v24 = [LumaChromaImage alloc];
  uint64_t v25 = *(void *)(v4 + 132);
  uint64_t v29 = objc_msgSend_syntheticLongPixelBuffer(*(void **)(v4 + 204), v26, v27, v28);
  size_t v107 = objc_msgSend_initWithContext_pixelBuffer_lumaAlignmentFactor_chromaAlignmentFactor_(v24, v30, v25, v29, 16, 8);
  if (!v107)
  {
    FigDebugAssert3();
    uint64_t v48 = 0;
    __dst = 0;
    uint64_t v106 = 0;
    id v72 = 0;
    id v40 = 0;
    size_t v107 = 0;
LABEL_61:
    int v23 = 0;
    goto LABEL_52;
  }
  uint64_t v34 = *(void **)(v4 + 132);
  uint64_t v35 = objc_msgSend_syntheticLongFusionMapPixelBuffer(*(void **)(v4 + 204), v31, v32, v33);
  id v40 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(v34, v36, v35, 10, 7, 0);
  if (!v40)
  {
LABEL_60:
    FigDebugAssert3();
    uint64_t v48 = 0;
    __dst = 0;
    uint64_t v106 = 0;
    id v72 = 0;
    goto LABEL_61;
  }
  if (objc_msgSend_longFusionMapPixelBuffer(*(void **)(v4 + 204), v37, v38, v39))
  {
    uint64_t v44 = *(void **)(v4 + 132);
    uint64_t v45 = objc_msgSend_longFusionMapPixelBuffer(*(void **)(v4 + 204), v41, v42, v43);
    uint64_t v106 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(v44, v46, v45, 10, 7, 0);
    if (!v106) {
      goto LABEL_60;
    }
  }
  else
  {
    uint64_t v106 = 0;
  }
  bracketProperties = self->_bracketProperties;
  if (objc_msgSend_doDeepFusionPyramidGeneration_properties_syntheticReferenceFramesOnly_pyramidHasBeenBuiltArray_(self->_denoiseFusePipeline, v41, (uint64_t)self->_fusionConf.colorSpaceConversionParameters, (uint64_t)self->_bracketProperties, 0, (char *)&self->_lscGainsTex + 2))
  {
    FigDebugAssert3();
    int v23 = FigSignalErrorAt();
    uint64_t v48 = 0;
    __dst = 0;
    id v72 = 0;
LABEL_51:
    uint64_t v5 = (int *)MEMORY[0x263F00E10];
    goto LABEL_52;
  }
  if ((self->_sifrFrameIndex & 0x80000000) == 0)
  {
    uint64_t v48 = 0;
    __dst = 0;
    goto LABEL_48;
  }
  p_int cntBracketSampleBuffers = &self->_cntBracketSampleBuffers;
  int v111 = 0;
  uint64_t referenceFrameCandidatesCount = self->_referenceFrameCandidatesCount;
  if ((int)referenceFrameCandidatesCount < 1) {
    goto LABEL_46;
  }
  uint64_t v51 = 0;
  int v52 = 0;
  uint64_t v53 = *p_cntBracketSampleBuffers;
  int v54 = *((unsigned __int8 *)&bracketProperties->meta.exposureParams.hr_enabled + 224224 * *p_cntBracketSampleBuffers);
  p_isEVMFrame = &self->_bracketProperties[0].meta.isEVMFrame;
  uint64_t v56 = 0xFFFFFFFFLL;
  do
  {
    if (!*p_isEVMFrame && !p_isEVMFrame[1])
    {
      int v57 = p_isEVMFrame[97];
      int v58 = v51 - v53;
      if ((int)v51 - (int)v53 < 0) {
        int v58 = v53 - v51;
      }
      if (v58 <= v52) {
        unsigned int v59 = v56;
      }
      else {
        unsigned int v59 = v51;
      }
      if (v58 <= v52) {
        int v58 = v52;
      }
      BOOL v60 = v57 == v54;
      if (v57 == v54) {
        unsigned int v61 = v59;
      }
      else {
        unsigned int v61 = v56;
      }
      if (!v60) {
        int v58 = v52;
      }
      if (v53 == v51) {
        uint64_t v56 = v56;
      }
      else {
        uint64_t v56 = v61;
      }
      if (v53 != v51) {
        int v52 = v58;
      }
    }
    ++v51;
    p_isEVMFrame += 224224;
  }
  while (referenceFrameCandidatesCount != v51);
  if ((v56 & 0x80000000) != 0)
  {
LABEL_46:
    uint64_t v48 = 0;
    __dst = 0;
LABEL_47:
    *((_DWORD *)v4 + 54) = v111;
LABEL_48:
    id v72 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (v72)
    {
      LODWORD(v73) = *((_DWORD *)v4 + 54);
      uint64_t v74 = objc_msgSend_numberWithFloat_(NSNumber, v69, v70, v71, v73);
      uint64_t v78 = objc_msgSend_syntheticReferenceMetadata(*(void **)(v4 + 204), v75, v76, v77);
      objc_msgSend_setObject_forKeyedSubscript_(v78, v79, (uint64_t)v74, @"MotionScores");

      LODWORD(v80) = *((_DWORD *)v4 + 54);
      int v23 = objc_msgSend_doSyntheticLong_noiseDivisorTex_realLongNoiseDivisorTex_lscGainsTex_config_properties_motionScore_nrfPlist_intermediateMetadata_(self->_denoiseFusePipeline, v81, (uint64_t)v107, (uint64_t)v40, v106, *(void *)(v4 + 228), self->_fusionConf.colorSpaceConversionParameters, self->_bracketProperties, v80, *(void *)(v4 + 44), v72);
      if (v23)
      {
        FigDebugAssert3();
      }
      else
      {
        uint64_t v85 = objc_msgSend_syntheticReferenceMetadata(*(void **)(v4 + 204), v82, v83, v84);
        objc_msgSend_setObject_forKeyedSubscript_(v85, v86, (uint64_t)v72, @"SyntheticLong");

        self->_deepFusionPyramidBuilt[*(int *)v4 + 8] = 0;
      }
    }
    else
    {
      FigDebugAssert3();
      int v23 = FigSignalErrorAt();
    }
    goto LABEL_51;
  }
  __dst = malloc_type_malloc(0x36BE0uLL, 0x1020040DF6BF6F3uLL);
  if (__dst)
  {
    uint64_t v48 = malloc_type_malloc(0x36BE0uLL, 0x1020040DF6BF6F3uLL);
    if (v48)
    {
      memcpy(__dst, (char *)bracketProperties + 224224 * v56, 0x36BE0uLL);
      memcpy(v48, (char *)bracketProperties + 224224 * *p_cntBracketSampleBuffers, 0x36BE0uLL);
      uint64_t v62 = MEMORY[0x263EF89A0];
      long long v63 = *MEMORY[0x263EF89A0];
      long long v64 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
      __dst[13993] = *MEMORY[0x263EF89A0];
      __dst[13994] = v64;
      long long v65 = *(_OWORD *)(v62 + 32);
      __dst[13995] = v65;
      v48[13993] = v63;
      v48[13994] = v64;
      v48[13995] = v65;
      int v67 = objc_msgSend_computeMotionScore_ev0FrameIndex_evmProperties_ev0Properties_motionScore_nrfPlist_(self->_denoiseFusePipeline, v66, v56, *p_cntBracketSampleBuffers, __dst, v48, &v111, *(void *)(v4 + 44));
      if (!v67)
      {
        if (dword_26B429788)
        {
          char v104 = v48;
          int v110 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          uint64_t v68 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();

          uint64_t v48 = v104;
        }
        goto LABEL_47;
      }
      int v23 = v67;
      FigDebugAssert3();
      uint64_t v5 = (int *)MEMORY[0x263F00E10];
      goto LABEL_71;
    }
    FigDebugAssert3();
  }
  else
  {
    FigDebugAssert3();
    uint64_t v48 = 0;
  }
  int v23 = -12786;
  uint64_t v5 = (int *)MEMORY[0x263F00E10];
LABEL_71:
  id v72 = 0;
LABEL_52:
  int v90 = *v5;
  if (*v5 == 1)
  {
    kdebug_trace();
    int v90 = *v5;
  }
  if (v90)
  {
    uint64_t v91 = objc_msgSend_commandQueue(*(void **)(v4 + 132), v87, v88, v89);
    uint64_t v95 = objc_msgSend_commandBuffer(v91, v92, v93, v94);

    objc_msgSend_setLabel_(v95, v96, @"KTRACE_END_MTL", v97);
    v108[0] = MEMORY[0x263EF8330];
    v108[1] = 3221225472;
    v108[2] = sub_262FE0318;
    v108[3] = &unk_2655C32E8;
    memset(&v108[4], 0, 24);
    objc_msgSend_addCompletedHandler_(v95, v98, (uint64_t)v108, v99);
    objc_msgSend_commit(v95, v100, v101, v102);
  }
  free(__dst);
  free(v48);

  return v23;
}

- (int)_setupFusionConfig
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  p_nonLinearBias = &self->_fusionConf.colorSpaceConversionParameters[4].transferFunctionInv.nonLinearBias;
  if (!*((void *)self->_regWarpInput + 3)) {
    goto LABEL_106;
  }
  p_int cntBracketSampleBuffers = &self->_cntBracketSampleBuffers;
  if (LODWORD(self->_output) != 3)
  {
    LODWORD(v7) = self->_referenceFrameCandidatesCount;
    if ((int)v7 >= 1)
    {
      uint64_t v8 = 0;
      bracketProperties = self->_bracketProperties;
      bracketSampleBuffers = self->_bracketSampleBuffers;
      do
      {
        uint64_t v11 = (char *)bracketProperties + 224224 * (int)v8;
        if (v11[223873])
        {
          uint64_t v8 = (v8 + 1);
        }
        else
        {
          if (v11[5] || v8 == *p_cntBracketSampleBuffers) {
            goto LABEL_105;
          }
          uint64_t v12 = bracketSampleBuffers[(int)v8];
          if (v12)
          {
            CFRelease(v12);
            bracketSampleBuffers[(int)v8] = 0;
            LODWORD(v7) = p_cntBracketSampleBuffers[2];
          }
          uint64_t v7 = (int)v7 - 1;
          if ((int)v8 < (int)v7)
          {
            memcpy((char *)bracketProperties + 224224 * (int)v8, (char *)bracketProperties + 224224 * v7, 0x36BE0uLL);
            uint64_t v13 = p_cntBracketSampleBuffers[2] - 1;
            bracketSampleBuffers[(int)v8] = bracketSampleBuffers[v13];
            bracketSampleBuffers[v13] = 0;
            objc_msgSend_swapInputFrame_withFrame_(self->_denoiseFusePipeline, v14, v8, v13);
            LODWORD(v7) = p_cntBracketSampleBuffers[2] - 1;
            if (*p_cntBracketSampleBuffers == v7) {
              *p_int cntBracketSampleBuffers = v8;
            }
          }
          p_cntBracketSampleBuffers[2] = v7;
        }
      }
      while ((int)v8 < (int)v7);
    }
  }
  p_nonLinearBias[268] = NAN;
  *((void *)p_nonLinearBias + 133) = -1;
  int y_low = LODWORD(self->_bracketProperties[1].meta.ROI.origin.y);
  *((unsigned char *)p_nonLinearBias + 1080) = y_low == 0;
  *((unsigned char *)p_nonLinearBias + 1081) = y_low == 1;
  *((unsigned char *)p_nonLinearBias + 1082) = y_low == 2;
  uint64_t v16 = objc_msgSend_statistics(*((void **)p_cntBracketSampleBuffers + 6), a2, v2, v3);
  if (objc_msgSend_stationary(v16, v17, v18, v19)) {
    BOOL v20 = *(unsigned char *)(*(void *)(*((void *)p_nonLinearBias + 139) + 24) + 140) != 0;
  }
  else {
    BOOL v20 = 0;
  }
  colorSpaceConversionParameters = self->_fusionConf.colorSpaceConversionParameters;
  *((unsigned char *)p_nonLinearBias + 1089) = v20;

  *((unsigned char *)p_nonLinearBias + 1090) = *(_DWORD *)(*(void *)(*((void *)p_nonLinearBias + 139) + 24) + 96) == 2;
  *((unsigned char *)p_nonLinearBias + 1088) = p_cntBracketSampleBuffers[6] == 2;
  p_outputToLinearYCbCr = &self->_fusionConf.colorSpaceConversionParameters[4].outputToLinearYCbCr;
  bzero(&self->_fusionConf.colorSpaceConversionParameters[4].outputToLinearYCbCr, 0x410uLL);
  if (p_cntBracketSampleBuffers[2] >= 1)
  {
    uint64_t v26 = 0;
    p_isEVMFrame = &self->_bracketProperties[0].meta.isEVMFrame;
    p_CGFloat height = &self->_bracketProperties[1].meta.ROI.size.height;
    while (y_low == *((_DWORD *)p_height - 4))
    {
      *(_OWORD *)p_outputToLinearYCbCr = *(_OWORD *)p_height;
      long long v29 = *((_OWORD *)p_height + 1);
      long long v30 = *((_OWORD *)p_height + 2);
      long long v31 = *((_OWORD *)p_height + 4);
      *((_OWORD *)p_outputToLinearYCbCr + 3) = *((_OWORD *)p_height + 3);
      *((_OWORD *)p_outputToLinearYCbCr + 4) = v31;
      *((_OWORD *)p_outputToLinearYCbCr + 1) = v29;
      *((_OWORD *)p_outputToLinearYCbCr + 2) = v30;
      long long v32 = *((_OWORD *)p_height + 5);
      long long v33 = *((_OWORD *)p_height + 6);
      long long v34 = *((_OWORD *)p_height + 8);
      *((_OWORD *)p_outputToLinearYCbCr + 7) = *((_OWORD *)p_height + 7);
      *((_OWORD *)p_outputToLinearYCbCr + 8) = v34;
      *((_OWORD *)p_outputToLinearYCbCr + 5) = v32;
      *((_OWORD *)p_outputToLinearYCbCr + 6) = v33;
      long long v35 = *((_OWORD *)p_height + 9);
      long long v36 = *((_OWORD *)p_height + 10);
      long long v37 = *((_OWORD *)p_height + 11);
      long long v38 = *((_OWORD *)p_height + 12);
      p_height += 28028;
      *((_OWORD *)p_outputToLinearYCbCr + 11) = v37;
      *((_OWORD *)p_outputToLinearYCbCr + 12) = v38;
      *((_OWORD *)p_outputToLinearYCbCr + 9) = v35;
      *((_OWORD *)p_outputToLinearYCbCr + 10) = v36;
      ++v26;
      uint64_t v39 = p_cntBracketSampleBuffers[2];
      p_outputToLinearYCbCr += 208;
      if (v26 >= v39)
      {
        if ((int)v39 < 1) {
          goto LABEL_37;
        }
        uint64_t v40 = 0;
        char v41 = (CGFloat *)MEMORY[0x263EF89A0];
        p_CGFloat y = &self->_bracketProperties[1].meta.ROI.origin.y;
        uint64_t v43 = self->_fusionConf.colorSpaceConversionParameters;
        while (1)
        {
          if (v40 == *p_cntBracketSampleBuffers)
          {
            *((_DWORD *)p_nonLinearBias + 267) = v40;
          }
          else if (*p_isEVMFrame)
          {
            *((_DWORD *)p_nonLinearBias + 266) = v40;
          }
          else if (p_isEVMFrame[1])
          {
            *((_DWORD *)p_nonLinearBias + 268) = v40;
          }
          uint64_t v44 = *((unsigned char *)p_y - 63) ? p_y - 6 : v41;
          long long v45 = *(_OWORD *)v44;
          long long v46 = *((_OWORD *)v44 + 2);
          *(_OWORD *)&v43->transferFunctionFwd.nonLinearPower = *((_OWORD *)v44 + 1);
          *(_OWORD *)&v43->transferFunctionInv.nonLinearBias = v46;
          *(_OWORD *)&v43->transferFunctionFwd.linearScale = v45;
          uint64_t v47 = *(void *)(*((void *)p_nonLinearBias + 139) + 24);
          if (!v47) {
            break;
          }
          *(unsigned char *)p_nonLinearBias = *(unsigned char *)(v47 + 24);
          if (LODWORD(self->_bracketProperties[1].meta.ROI.origin.y) != *(_DWORD *)p_y) {
            goto LABEL_105;
          }
          p_isEVMFrame += 224224;
          ++v40;
          uint64_t v43 = (ColorSpaceConversionParameters *)((char *)v43 + 48);
          p_y += 28028;
          if (v40 >= p_cntBracketSampleBuffers[2]) {
            goto LABEL_37;
          }
        }
        FigDebugAssert3();
        goto LABEL_106;
      }
    }
    goto LABEL_105;
  }
LABEL_37:
  if ((p_nonLinearBias[267] & 0x80000000) == 0)
  {
    if ((p_nonLinearBias[266] & 0x80000000) != 0) {
      objc_msgSend_setFusionReferenceFrame_(self->_denoiseFusePipeline, v23, 1, v25);
    }
    *((_DWORD *)p_nonLinearBias + 271) = objc_msgSend_fusionReferenceFrame(self->_denoiseFusePipeline, v23, v24, v25);
    int v51 = p_cntBracketSampleBuffers[6];
    if (v51 == 3)
    {
      p_nonLinearBias[269] = NAN;
    }
    else if (v51 == 2)
    {
      if (p_cntBracketSampleBuffers[3]) {
        int v52 = 0;
      }
      else {
        int v52 = *((_DWORD *)p_nonLinearBias + 267);
      }
      *((_DWORD *)p_nonLinearBias + 269) = v52;
      objc_msgSend_setFusionReferenceFrame_(self->_denoiseFusePipeline, v48, 1, v50);
      *((unsigned char *)p_nonLinearBias + 1083) = 0;
    }
    else
    {
      int v53 = objc_msgSend_fusionReferenceFrame(self->_denoiseFusePipeline, v48, v49, v50);
      uint64_t v57 = 267;
      if (v53 == 2) {
        uint64_t v57 = 266;
      }
      p_nonLinearBias[269] = p_nonLinearBias[v57];
      int v58 = objc_msgSend_fusionReferenceFrame(self->_denoiseFusePipeline, v54, v55, v56);
      int v59 = *((_DWORD *)p_nonLinearBias + 266);
      BOOL v61 = v58 == 1 && v59 >= 0;
      *((unsigned char *)p_nonLinearBias + 1083) = v61;
      if ((v59 & 0x80000000) == 0 || !dword_26B429788)
      {
LABEL_59:
        long long v63 = self->_bracketProperties;
        *((_DWORD *)p_nonLinearBias + 264) = p_cntBracketSampleBuffers[2];
        if ((v59 & 0x80000000) == 0)
        {
          int v64 = *((unsigned __int8 *)&v63->meta.metadataHasLtmCurves + 224224 * v59);
          unsigned int v65 = *((_DWORD *)p_nonLinearBias + 267);
          if ((v65 & 0x80000000) != 0)
          {
            if (!*(&v63->meta.metadataHasLtmCurves + 224224 * v59))
            {
              unsigned int v65 = -1;
              p_nonLinearBias[265] = NAN;
              char v70 = *((unsigned char *)p_nonLinearBias + 1080);
              if (v70)
              {
LABEL_98:
                *((_DWORD *)p_nonLinearBias + 265) = v59;
                goto LABEL_99;
              }
              BOOL v69 = 0;
              if ((v59 & 0x80000000) == 0) {
                goto LABEL_99;
              }
LABEL_68:
              if ((v65 & 0x80000000) != 0) {
                goto LABEL_99;
              }
              if (v70)
              {
LABEL_75:
                int v71 = p_cntBracketSampleBuffers[6];
                if ((v71 - 1) >= 2)
                {
                  if (v71 == 3 && *((unsigned char *)p_nonLinearBias + 1289)) {
                    objc_msgSend__deepFusionSetWarpReferenceSIFR(self, v48, v49, v50);
                  }
                }
                else if (*((_DWORD *)p_nonLinearBias + 271) == 2)
                {
                  simd_float3x3 v73 = __invert_f3(*(simd_float3x3 *)(&colorSpaceConversionParameters->transferFunctionFwd.linearScale
                                                     + 12 * v59));
                  uint64_t v72 = 0;
                  v73.columns[0].i32[3] = 0;
                  v73.columns[1].i32[3] = 0;
                  v73.columns[2].i32[3] = 0;
                  uint64_t v74 = (_OWORD *)MEMORY[0x263EF89A0];
                  do
                  {
                    if (v72 == *((_DWORD *)p_nonLinearBias + 266) || v72 == *((_DWORD *)p_nonLinearBias + 267))
                    {
                      uint64_t v75 = (_OWORD *)(&colorSpaceConversionParameters->transferFunctionFwd.linearScale + 12 * v72);
                      long long v76 = v74[1];
                      *uint64_t v75 = *v74;
                      v75[1] = v76;
                      v75[2] = v74[2];
                    }
                    else
                    {
                      uint64_t v77 = 0;
                      uint64_t v78 = (float32x4_t *)((char *)colorSpaceConversionParameters + 48 * v72);
                      float32x4_t v79 = *v78;
                      float32x4_t v80 = v78[1];
                      float32x4_t v81 = v78[2];
                      simd_float3x3 v90 = v73;
                      long long v87 = 0uLL;
                      long long v88 = 0uLL;
                      long long v89 = 0uLL;
                      do
                      {
                        *(long long *)((char *)&v87 + v77 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v79, COERCE_FLOAT(*(_OWORD *)&v90.columns[v77])), v80, *(float32x2_t *)v90.columns[v77].f32, 1), v81, (float32x4_t)v90.columns[v77], 2);
                        ++v77;
                      }
                      while (v77 != 3);
                      uint64_t v82 = v87;
                      long long v83 = v88;
                      long long v84 = v89;
                      v78->i32[2] = DWORD2(v87);
                      v78[1].i32[2] = DWORD2(v83);
                      v78->i64[0] = v82;
                      v78[1].i64[0] = v83;
                      v78[2].i32[2] = DWORD2(v84);
                      v78[2].i64[0] = v84;
                    }
                    ++v72;
                  }
                  while (v72 != 4);
                }
                return 0;
              }
LABEL_74:
              if (!v69) {
                goto LABEL_99;
              }
              goto LABEL_75;
            }
            BOOL v68 = 0;
          }
          else
          {
            uint64_t v66 = (char *)v63 + 224224 * v65;
            int v67 = v66[164];
            BOOL v68 = v66[164] != 0;
            if (!v64)
            {
              if (!v67)
              {
                p_nonLinearBias[265] = NAN;
                if (!*((unsigned char *)p_nonLinearBias + 1080)) {
                  goto LABEL_99;
                }
                goto LABEL_98;
              }
LABEL_67:
              *((_DWORD *)p_nonLinearBias + 265) = v65;
              BOOL v69 = *((unsigned char *)p_nonLinearBias + 1080) != 0;
              char v70 = 1;
              if ((v59 & 0x80000000) == 0)
              {
LABEL_99:
                FigDebugAssert3();
                return FigSignalErrorAt();
              }
              goto LABEL_68;
            }
          }
          *((_DWORD *)p_nonLinearBias + 265) = v59;
          BOOL v69 = *((unsigned char *)p_nonLinearBias + 1080) != 0;
          if (v68) {
            goto LABEL_75;
          }
          goto LABEL_74;
        }
        unsigned int v65 = *((_DWORD *)p_nonLinearBias + 267);
        if ((v65 & 0x80000000) != 0)
        {
          if (*((unsigned char *)p_nonLinearBias + 1080)) {
            int v86 = *((_DWORD *)p_nonLinearBias + 267);
          }
          else {
            int v86 = -1;
          }
          *((_DWORD *)p_nonLinearBias + 265) = v86;
          goto LABEL_99;
        }
        if (!*(&v63->meta.metadataHasLtmCurves + 224224 * v65))
        {
          p_nonLinearBias[265] = NAN;
          if (!*((unsigned char *)p_nonLinearBias + 1080)) {
            goto LABEL_99;
          }
          *((_DWORD *)p_nonLinearBias + 265) = v65;
          goto LABEL_75;
        }
        goto LABEL_67;
      }
      uint64_t v62 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    int v59 = *((_DWORD *)p_nonLinearBias + 266);
    goto LABEL_59;
  }
LABEL_105:
  FigDebugAssert3();
LABEL_106:

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
      int v11 = FigSignalErrorAt();
    }
    else
    {
      int v11 = objc_msgSend_transform_srcRect_dst_dstRect_rotate_sync_m2m_(*(void **)&self->_registrationPipelineRWPPConfig.numThreads, v10, (uint64_t)a3, (uint64_t)a4, 1, 1, 0.0, 0.0, (double)Width, (double)Height, 0.0, 0.0, (double)(Width >> 1), (double)(Height >> 1));
      if (v11) {
        FigDebugAssert3();
      }
    }
  }
  else
  {
    FigDebugAssert3();
    int v11 = -12780;
  }
  if (*v7 == 1) {
    kdebug_trace();
  }
  return v11;
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
  uint64_t v36 = *MEMORY[0x263EF8340];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_270E50A18, a2, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v9 = *(void *)v32;
    int v10 = (float32x4_t *)(&self->_bracketProperties[1].meta.exposureParams.conversion_gain + 56056 * a3);
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(&unk_270E50A18);
        }
        double v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        int v13 = objc_msgSend_objectAtIndexedSubscript_(v12, v6, 0, v7, v28, v29);
        objc_msgSend_floatValue(v13, v14, v15, v16);
        *(void *)&long long v30 = v17;
        BOOL v20 = objc_msgSend_objectAtIndexedSubscript_(v12, v18, 1, v19);
        objc_msgSend_floatValue(v20, v21, v22, v23);
        long long v24 = v30;
        DWORD1(v24) = v25;
        long long v28 = v25;
        long long v29 = v24;

        int32x4_t v26 = (int32x4_t)vaddq_f32(v10[2], vmlaq_n_f32(vmulq_n_f32(*v10, *(float *)&v30), v10[1], *(float *)&v28));
        *(float32x2_t *)v26.i8 = vsub_f32(*(float32x2_t *)&v29, vdiv_f32(*(float32x2_t *)v26.i8, (float32x2_t)vdup_laneq_s32(v26, 2)));
        if (sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)v26.i8, *(float32x2_t *)v26.i8))) > 1.0) {
          return 0;
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_270E50A18, v6, (uint64_t)&v31, (uint64_t)v35, 16);
      if (v8) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (int)_registerImages:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v5 = self;
  uint64_t v123 = *MEMORY[0x263EF8340];
  p_int cntBracketSampleBuffers = &self->_cntBracketSampleBuffers;
  p_nRegisteredFrames = &self->_nRegisteredFrames;
  p_normalized_snr = &self->_bracketProperties[1].meta.exposureParams.normalized_snr;
  uint64_t v8 = objc_msgSend_statistics(self->_semanticStyleProperties, a2, a3, v3);
  if (objc_msgSend_stationary(v8, v9, v10, v11)
    && (uint64_t v12 = *(void *)(*(void *)(p_nRegisteredFrames + 341) + 24)) != 0)
  {
    int v13 = *(unsigned __int8 *)(v12 + 140);

    if (v13) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  if (*(_DWORD *)(*(void *)(p_nRegisteredFrames + 377) + 36) != 2)
  {
LABEL_19:
    uint64_t v32 = p_cntBracketSampleBuffers[2];
    if ((int)v32 >= 1)
    {
      long long v33 = (_OWORD *)MEMORY[0x263EF89A0];
      long long v34 = p_normalized_snr;
      do
      {
        if (!*(unsigned char *)v34)
        {
          long long v35 = v33[1];
          *((_OWORD *)v34 + 1) = *v33;
          *((_OWORD *)v34 + 2) = v35;
          *((_OWORD *)v34 + 3) = v33[2];
          *(_WORD *)long long v34 = 257;
        }
        v34 += 56056;
        --v32;
      }
      while (v32);
    }
    goto LABEL_24;
  }
  uint64_t v112 = p_nRegisteredFrames;
  int v14 = *p_cntBracketSampleBuffers;
  if (*p_cntBracketSampleBuffers < 0 || (int v15 = p_cntBracketSampleBuffers[2], v15 <= v14))
  {
LABEL_24:
    if (!v4) {
      goto LABEL_34;
    }
    uint64_t v36 = p_cntBracketSampleBuffers[2];
    if ((int)v36 >= 1)
    {
      int v37 = 0;
      uint64_t v38 = *p_cntBracketSampleBuffers;
      uint64_t v39 = (unsigned __int8 *)p_normalized_snr + 1;
      do
      {
        if (v38) {
          v37 += *v39;
        }
        --v38;
        v39 += 224224;
        --v36;
      }
      while (v36);
      if (p_cntBracketSampleBuffers[6] == 2 || v37 > 0) {
        goto LABEL_34;
      }
      goto LABEL_83;
    }
    if (p_cntBracketSampleBuffers[6] == 2)
    {
LABEL_34:
      int v31 = 0;
      goto LABEL_35;
    }
LABEL_83:
    FigDebugAssert3();
    int v31 = FigSignalErrorAt();
    goto LABEL_35;
  }
  bracketProperties = v5->_bracketProperties;
  if (*((unsigned char *)&v5->_bracketProperties[1].meta.exposureParams.normalized_snr + 224224 * v14)) {
    goto LABEL_55;
  }
  uint64_t v17 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    int v14 = *p_cntBracketSampleBuffers;
  }
  uint64_t v18 = (char *)bracketProperties + 224224 * v14;
  uint64_t v19 = MEMORY[0x263EF89A0];
  long long v20 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  *((_OWORD *)v18 + 13993) = *MEMORY[0x263EF89A0];
  *((_OWORD *)v18 + 13994) = v20;
  *((_OWORD *)v18 + 13995) = *(_OWORD *)(v19 + 32);
  *((_WORD *)v18 + 111936) = 257;
  ImageBuffer = CMSampleBufferGetImageBuffer(v5->_bracketSampleBuffers[v14]);
  if (!ImageBuffer) {
    goto LABEL_83;
  }
  uint64_t v22 = (uint64_t)ImageBuffer;
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
  long long v24 = (char *)bracketProperties + 224224 * *p_cntBracketSampleBuffers;
  long long v25 = *((_OWORD *)v24 + 9);
  float32x4_t v118 = *((float32x4_t *)v24 + 8);
  long long v119 = v25;
  *(_DWORD *)uint64_t v121 = 0;
  if (objc_msgSend_shouldDownsampleRWPPInputWithPixelFormat_processingType_(v5, v26, PixelFormatType, p_cntBracketSampleBuffers[6]))
  {
    if (v112[1] != *p_cntBracketSampleBuffers)
    {
      if (PixelFormatType == 1751527984 || !*(void *)(v112 + 347))
      {
        long long v46 = v5;
        BOOL v47 = v4;
        uint64_t v48 = p_cntBracketSampleBuffers;
        uint64_t v49 = *(void **)(v112 + 345);
        uint64_t v50 = *(void *)(v112 + 343);
        int v51 = objc_msgSend_commandBuffer(*(void **)(v112 + 363), v27, v28, v29);
        int v31 = objc_msgSend_convertInput10BitPixBuf_downsampledOutput8BitPixBuf_mtlCommandBuffer_(v49, v52, v22, v50, v51);

        if (v31)
        {
LABEL_84:
          FigDebugAssert3();
          goto LABEL_35;
        }
        objc_msgSend_waitForSchedule(*(void **)(v112 + 363), v53, v54, v55);
        p_int cntBracketSampleBuffers = v48;
        BOOL v4 = v47;
        uint64_t v5 = v46;
      }
      else
      {
        int v30 = objc_msgSend__downsampleImageForRegistration_outputImage_(v5, v27, v22, *(void *)(v112 + 343));
        if (v30)
        {
          int v31 = v30;
          goto LABEL_84;
        }
      }
      v112[1] = *p_cntBracketSampleBuffers;
    }
    uint64_t v22 = *(void *)(v112 + 343);
    objc_msgSend__downscaleRoiForRegistration_(v5, v27, v28, v29, *(_OWORD *)&v118, v119);
    v118.i64[0] = v56;
    v118.i64[1] = v57;
    *(void *)&long long v119 = v58;
    *((void *)&v119 + 1) = v59;
  }
  if (!objc_msgSend_processReference_regionOfInterest_numKeypoints_mapping_(*(void **)(v112 + 361), v27, v22, (uint64_t)&v118, v121, 0))
  {
    if (*v17 == 1) {
      kdebug_trace();
    }
    int v15 = p_cntBracketSampleBuffers[2];
LABEL_55:
    if (v15 >= 1)
    {
      uint64_t v60 = 0;
      uint64_t v61 = 0;
      size_t v107 = (uint64_t *)(v112 + 343);
      uint64_t v114 = &v5->_bracketProperties[1].meta.ltmCurves.ltmLut.bytes[261];
      uint64_t v62 = 224376;
      uint64_t v63 = 224421;
      uint64_t v64 = 672512;
      BOOL v108 = v4;
      int v109 = v5;
      size_t v105 = p_cntBracketSampleBuffers;
      uint64_t v106 = (void **)(v112 + 363);
      while (1)
      {
        _X19 = &v114[v60];
        _X9 = (char *)v5 + v64;
        int v67 = &v114[v60 - 357];
        __asm { PRFM            #0, [X9] }
        if (!*v67) {
          break;
        }
LABEL_81:
        ++v61;
        v60 += 224224;
        v64 += 224224;
        v62 += 8;
        v63 += 224224;
        if (v61 >= v15) {
          goto LABEL_24;
        }
      }
      if (*MEMORY[0x263F00E10] == 1) {
        kdebug_trace();
      }
      *int v67 = 1;
      simd_float3x3 v73 = CMSampleBufferGetImageBuffer(*(CMSampleBufferRef *)((char *)&v5->super.isa + v62));
      if (!v73) {
        goto LABEL_83;
      }
      uint64_t v74 = v5;
      uint64_t v75 = v73;
      uint64_t v76 = CVPixelBufferGetPixelFormatType(v73);
      int shouldDownsampleRWPPInputWithPixelFormat_processingType = objc_msgSend_shouldDownsampleRWPPInputWithPixelFormat_processingType_(v74, v77, v76, p_cntBracketSampleBuffers[6]);
      uint64_t v81 = (uint64_t)v75;
      if (shouldDownsampleRWPPInputWithPixelFormat_processingType)
      {
        if (v61 != v112[1])
        {
          if (v76 == 1751527984 || !*(void *)(v112 + 347))
          {
            long long v83 = *(void **)(v112 + 345);
            uint64_t v110 = *v107;
            long long v84 = objc_msgSend_commandBuffer(*v106, v79, (uint64_t)v75, v80);
            int v31 = objc_msgSend_convertInput10BitPixBuf_downsampledOutput8BitPixBuf_mtlCommandBuffer_(v83, v85, (uint64_t)v75, v110, v84);

            if (v31) {
              goto LABEL_84;
            }
            objc_msgSend_waitForSchedule(*v106, v86, v87, v88);
            p_int cntBracketSampleBuffers = v105;
          }
          else
          {
            int v82 = objc_msgSend__downsampleImageForRegistration_outputImage_(v109, v79, (uint64_t)v75, *v107);
            if (v82)
            {
              int v31 = v82;
              goto LABEL_84;
            }
          }
          v112[1] = v61;
        }
        uint64_t v81 = *v107;
      }
      __int32 v116 = 0;
      memset(type, 0, sizeof(type));
      int v89 = objc_msgSend_processNonReference_seedTransform_outputTransform_mapping_(*(void **)(v112 + 361), v79, v81, 0, type, 0);
      if (v114[v60 - 373])
      {
        int v111 = v89;
        uint64_t v92 = p_cntBracketSampleBuffers;
        unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(v75, 0);
        unsigned int HeightOfPlane = CVPixelBufferGetHeightOfPlane(v75, 0);
        uint64_t v95 = *(void *)&v114[v60 - 365];
        float32x4_t v118 = *(float32x4_t *)type;
        long long v119 = *(_OWORD *)&type[12];
        float v96 = (float)WidthOfPlane;
        p_int cntBracketSampleBuffers = v92;
        *(void *)&long long v97 = *(void *)&type[24];
        *(float *)&uint64_t v95 = (float)v95;
        *((void *)&v97 + 1) = __PAIR64__(*(unsigned int *)&type[24], v116);
        long long v120 = v97;
        LODWORD(v98) = 0;
        *((float *)&v98 + 1) = (float)HeightOfPlane / (float)HIDWORD(v95);
        *(_OWORD *)uint64_t v121 = COERCE_UNSIGNED_INT(v96 / *(float *)&v95);
        *(_OWORD *)&v121[16] = v98;
        long long v122 = xmmword_263117C90;
        LODWORD(v97) = 0;
        *((float *)&v97 + 1) = (float)HIDWORD(v95) / (float)HeightOfPlane;
        v117[0] = COERCE_UNSIGNED_INT(*(float *)&v95 / v96);
        v117[1] = (unint64_t)v97;
        v117[2] = xmmword_263117C90;
        *(double *)&long long v99 = sub_262F8FE24((uint64_t)v117, &v118, (float32x4_t *)v121);
        int v89 = v111;
        HIDWORD(v99) = v100.i32[0];
        *(_OWORD *)os_log_type_t type = v99;
        *(int8x16_t *)&type[16] = vextq_s8(vextq_s8(v100, v100, 0xCuLL), v101, 8uLL);
        __int32 v116 = v101.i32[2];
      }
      if (v89)
      {
        v114[v60 - 356] = 0;
        BOOL v4 = v108;
        uint64_t v5 = v109;
      }
      else
      {
        *(_OWORD *)&v114[v60 - 341] = *(_OWORD *)type;
        HIDWORD(v102) = *(_DWORD *)&type[24];
        *(_OWORD *)&v114[v60 - 325] = *(_OWORD *)&type[12];
        *(void *)&long long v102 = *(void *)&type[24];
        DWORD2(v102) = v116;
        *(_OWORD *)&v114[v60 - 309] = v102;
        uint64_t v5 = v109;
        int v103 = objc_msgSend_sanityCheckHomographyForBracketIndex_(v109, v90, v61, v91);
        v114[v60 - 356] = v103;
        BOOL v4 = v108;
        if (v103)
        {
          ++*v112;
LABEL_78:
          if (*MEMORY[0x263F00E10] == 1) {
            kdebug_trace();
          }
          int v15 = p_cntBracketSampleBuffers[2];
          goto LABEL_81;
        }
      }
      __asm { PRFM            #0, [X19] }
      if (*((unsigned char *)&v5->super.isa + v63)) {
        goto LABEL_83;
      }
      goto LABEL_78;
    }
    goto LABEL_24;
  }
  FigDebugAssert3();
  int v31 = -17401;
LABEL_35:
  if (dword_26B429788)
  {
    LODWORD(v117[0]) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    char v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v42 = v117[0];
    if (os_log_type_enabled(v41, type[0])) {
      unsigned int v43 = v42;
    }
    else {
      unsigned int v43 = v42 & 0xFFFFFFFE;
    }
    if (v43)
    {
      uint64_t v44 = "failed";
      *(_DWORD *)uint64_t v121 = 136315907;
      *(void *)&v121[4] = "-[NRFProcessorV2 _registerImages:]";
      *(_WORD *)&v121[12] = 2113;
      *(void *)&v121[14] = @"NRF";
      if (!v31) {
        uint64_t v44 = "succeeded";
      }
      *(_WORD *)&v121[22] = 2081;
      *(void *)&v121[24] = v44;
      LOWORD(v122) = 1026;
      *(_DWORD *)((char *)&v122 + 2) = v31 == 0;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v31;
}

- (int)_processSIFRandRefEV0IfPossible:(int)a3
{
  p_referenceFrameIndeCGFloat x = &self->_referenceFrameIndex;
  p_regWarpInput = &self->_regWarpInput;
  p_sifrFrameIndeCGFloat x = &self->_sifrFrameIndex;
  int output = (int)self->_output;
  if (output != 3)
  {
    if (self->_processedSIFRandRefEV0) {
      return 0;
    }
    p_uint64_t cntBracketSampleBuffers = &self->_cntBracketSampleBuffers;
    uint64_t cntBracketSampleBuffers = self->_cntBracketSampleBuffers;
    if ((cntBracketSampleBuffers & 0x80000000) != 0
      || (int)cntBracketSampleBuffers >= self->_referenceFrameCandidatesCount
      || (uint64_t v15 = *p_sifrFrameIndex, (v15 & 0x80000000) != 0))
    {
      if (a3 != 1 || !*(unsigned char *)p_referenceFrameIndex) {
        return 0;
      }
      objc_msgSend_setFusionMode_(self->_deepFusionOutput, a2, 1, cntBracketSampleBuffers);
    }
    else
    {
      bracketProperties = self->_bracketProperties;
      if (!*((unsigned char *)&self->_bracketProperties[1].meta.exposureParams.normalized_snr + 224224 * v15)
        || !*((unsigned char *)&bracketProperties[1].meta.exposureParams.normalized_snr
            + 224224 * cntBracketSampleBuffers))
      {
        goto LABEL_46;
      }
      self->_processedSIFRandRefEV0 = 1;
      if (output != 1)
      {
        if (output == 2) {
          goto LABEL_46;
        }
        if ((output - 4) < 2)
        {
          objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF488], @"*** RawNightMode is unsupported in this version of NRF.", 0);
          id v17 = (id)objc_claimAutoreleasedReturnValue();
          objc_exception_throw(v17);
        }
        return 0;
      }
      if (objc_msgSend_selectNRFFusionReferenceFrame_ev0FrameIndex_evmProperties_ev0Properties_nrfPlist_(self->_denoiseFusePipeline, a2, v15, cntBracketSampleBuffers, (char *)bracketProperties + 224224 * v15, (char *)bracketProperties + 224224 * cntBracketSampleBuffers, *p_regWarpInput))goto LABEL_46; {
      int32x4_t v26 = p_sifrFrameIndex;
      }
      if (*(&bracketProperties->meta.metadataHasLtmCurves + 224224 * *p_sifrFrameIndex)
        || (int32x4_t v26 = p_cntBracketSampleBuffers,
            *(&bracketProperties->meta.metadataHasLtmCurves + 224224 * *p_cntBracketSampleBuffers)))
      {
        int v30 = objc_msgSend_fusionReferenceFrame(self->_denoiseFusePipeline, v23, v24, v25) == 2
            ? p_sifrFrameIndex
            : p_cntBracketSampleBuffers;
        uint64_t v31 = *v30;
        uint64_t v32 = *v26;
        int v33 = *((_DWORD *)&bracketProperties[1].meta.ROI.origin.y + 56056 * (int)v31);
        if (objc_msgSend_inferenceInputPixelBuffer(p_regWarpInput[19], v27, v28, v29))
        {
          if (v33)
          {
            uint64_t v36 = objc_msgSend_inferenceInputPixelBuffer(p_regWarpInput[19], v23, v34, v35);
            unsigned int v60 = *p_cntBracketSampleBuffers;
            uint64_t v40 = (__CVBuffer *)objc_msgSend_pixelBuffer(p_regWarpInput[19], v37, v38, v39);
            size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(v40, 0);
            long long v45 = (__CVBuffer *)objc_msgSend_pixelBuffer(p_regWarpInput[19], v42, v43, v44);
            size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(v45, 0);
            objc_msgSend__processInferenceImage_sourceFrameType_sourceFrameIndex_ltcFrameIndex_gtcFrameIndex_originalWidth_originalHeight_(self, v47, v36, 0, v31, v32, v60, WidthOfPlane, HeightOfPlane);
          }
        }
      }
      if (objc_msgSend_nrfFusionDenseRegister_ev0FrameIndex_evmProperties_ev0Properties_(self->_denoiseFusePipeline, v23, *p_sifrFrameIndex, *p_cntBracketSampleBuffers, (char *)bracketProperties + 224224 * *p_sifrFrameIndex, (char *)bracketProperties + 224224 * *p_cntBracketSampleBuffers))goto LABEL_46; {
      uint64_t v51 = objc_msgSend_fusionReferenceFrame(self->_denoiseFusePipeline, v48, v49, v50);
      }
      objc_msgSend_setFusionMode_(p_regWarpInput[19], v52, v51, v53);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_progressiveBracketingParameters);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v58 = objc_msgSend_fusionMode(p_regWarpInput[19], v55, v56, v57);
      objc_msgSend_processor_didSelectFusionMode_(WeakRetained, v59, (uint64_t)self, v58);
    }

    return 0;
  }
  if (LOBYTE(self->_lscGainsTex)) {
    return 0;
  }
  int v9 = *(unsigned __int8 *)p_referenceFrameIndex;
  if (*(unsigned char *)p_referenceFrameIndex) {
    unsigned int v10 = *p_sifrFrameIndex >> 31;
  }
  else {
    LOBYTE(v10) = 0;
  }
  int v18 = self->_cntBracketSampleBuffers;
  if (v18 < 0) {
    return 0;
  }
  char v19 = v18 >= self->_referenceFrameCandidatesCount ? 1 : v10;
  if (v19) {
    return 0;
  }
  if ((!v9 || *((unsigned char *)&self->_bracketProperties[1].meta.exposureParams.normalized_snr + 224224 * *p_sifrFrameIndex))
    && *((unsigned char *)&self->_bracketProperties[1].meta.exposureParams.normalized_snr + 224224 * v18)
    && !objc_msgSend__setupFusionConfig(self, a2, *(uint64_t *)&a3, v3))
  {
    return objc_msgSend__doDeepFusionSytheticRefererenceAndProxy(self, v20, v21, v22);
  }
LABEL_46:
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)_populateDeepFusionMetadata:(id)a3
{
  p_uint64_t cntBracketSampleBuffers = &self->_cntBracketSampleBuffers;
  id v5 = a3;
  uint64_t v6 = *p_cntBracketSampleBuffers;
  if ((v6 & 0x80000000) != 0 || (int)v6 >= p_cntBracketSampleBuffers[2])
  {
    FigDebugAssert3();
    int v23 = FigSignalErrorAt();
    unsigned int v10 = 0;
    goto LABEL_25;
  }
  bracketSampleBuffers = self->_bracketSampleBuffers;
  CFStringRef v8 = (const __CFString *)*MEMORY[0x263F2EF78];
  unsigned int v10 = CMGetAttachment(self->_bracketSampleBuffers[v6], (CFStringRef)*MEMORY[0x263F2EF78], 0);
  if (!v10) {
    goto LABEL_27;
  }
  objc_msgSend_setObject_forKeyedSubscript_(v5, v9, (uint64_t)v10, @"ReferenceMetadata");
  uint64_t v11 = p_cntBracketSampleBuffers[2];
  if ((int)v11 < 1)
  {
LABEL_24:
    int v23 = 0;
    goto LABEL_25;
  }
  uint64_t v12 = 0;
  p_isLongFrame = &self->_bracketProperties[0].meta.isLongFrame;
  int v14 = -1;
  int v15 = -1;
  do
  {
    if (v15 < 0 && *(p_isLongFrame - 1)) {
      int v15 = v12;
    }
    if (v14 < 0 && *p_isLongFrame) {
      int v14 = v12;
    }
    ++v12;
    p_isLongFrame += 224224;
  }
  while (v11 != v12);
  if ((v15 & 0x80000000) == 0)
  {
    uint64_t v18 = CMGetAttachment(bracketSampleBuffers[v15], v8, 0);
    if (v18)
    {
      long long v20 = (void *)v18;
      objc_msgSend_setObject_forKeyedSubscript_(v5, v19, v18, @"SifrMetadata");

      goto LABEL_20;
    }
LABEL_27:
    FigDebugAssert3();
    int v23 = FigSignalErrorAt();
    goto LABEL_25;
  }
LABEL_20:
  if (v14 < 0) {
    goto LABEL_24;
  }
  uint64_t v22 = CMGetAttachment(bracketSampleBuffers[v14], v8, 0);
  if (v22)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v5, v21, (uint64_t)v22, @"LongMetadata");
    int v23 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v23 = FigSignalErrorAt();
  }

LABEL_25:
  return v23;
}

- (void)_deepFusionInvalidatePyramids
{
  BYTE6(self->_lscGainsTex) = 0;
  *(_DWORD *)((char *)&self->_lscGainsTex + 2) = 0;
}

- (void)_deepFusionResetWarpTransforms
{
  uint64_t v2 = 0;
  p_conversion_gaiuint64_t n = &self->_bracketProperties[1].meta.exposureParams.conversion_gain;
  BOOL v4 = (float *)MEMORY[0x263EF89A0];
  do
  {
    id v5 = (_OWORD *)((char *)self->_fusionConf.colorSpaceConversionParameters + v2);
    if (*((unsigned char *)p_conversion_gain - 15)) {
      uint64_t v6 = p_conversion_gain;
    }
    else {
      uint64_t v6 = v4;
    }
    long long v7 = *(_OWORD *)v6;
    long long v8 = *((_OWORD *)v6 + 2);
    v5[1] = *((_OWORD *)v6 + 1);
    v5[2] = v8;
    *id v5 = v7;
    v2 += 48;
    p_conversion_gain += 56056;
  }
  while (v2 != 240);
}

- (int)_deepFusionSetWarpReference:(int)a3
{
  if (a3 < 0)
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  else
  {
    objc_msgSend__deepFusionResetWarpTransforms(self, a2, *(uint64_t *)&a3, v3);
    colorSpaceConversionParameters = self->_fusionConf.colorSpaceConversionParameters;
    uint64_t v7 = a3;
    long long v8 = (char *)colorSpaceConversionParameters + 48 * a3;
    simd_float3x3 v10 = __invert_f3(*(simd_float3x3 *)v8);
    uint64_t v9 = 0;
    v10.columns[0].i32[3] = 0;
    v10.columns[1].i32[3] = 0;
    v10.columns[2].i32[3] = 0;
    do
    {
      if (v9 != v7)
      {
        uint64_t v11 = 0;
        uint64_t v12 = (float32x4_t *)((char *)colorSpaceConversionParameters + 48 * v9);
        float32x4_t v13 = *v12;
        float32x4_t v14 = v12[1];
        float32x4_t v15 = v12[2];
        simd_float3x3 v22 = v10;
        long long v23 = 0uLL;
        long long v24 = 0uLL;
        long long v25 = 0uLL;
        do
        {
          *(long long *)((char *)&v23 + v11 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v13, COERCE_FLOAT(*(_OWORD *)&v22.columns[v11])), v14, *(float32x2_t *)v22.columns[v11].f32, 1), v15, (float32x4_t)v22.columns[v11], 2);
          ++v11;
        }
        while (v11 != 3);
        uint64_t v16 = v23;
        long long v17 = v24;
        long long v18 = v25;
        v12->i32[2] = DWORD2(v23);
        v12[1].i32[2] = DWORD2(v17);
        v12->i64[0] = v16;
        v12[1].i64[0] = v17;
        v12[2].i32[2] = DWORD2(v18);
        v12[2].i64[0] = v18;
      }
      ++v9;
    }
    while (v9 != 5);
    uint64_t v19 = MEMORY[0x263EF89A0];
    long long v20 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
    *(_OWORD *)long long v8 = *MEMORY[0x263EF89A0];
    *((_OWORD *)v8 + 1) = v20;
    *((_OWORD *)v8 + 2) = *(_OWORD *)(v19 + 32);
    return 0;
  }
}

- (void)_deepFusionRevertWarpToDefault
{
  objc_msgSend__deepFusionResetWarpTransforms(self, a2, v2, v3);
  BYTE1(self->_lscGainsTex) = 0;
}

- (int)_deepFusionSetWarpReferenceSIFR
{
  BYTE1(self->_lscGainsTex) = 1;
  return ((uint64_t (*)(NRFProcessorV2 *, char *, void))MEMORY[0x270F9A6D0])(self, sel__deepFusionSetWarpReference_, self->_sifrFrameIndex);
}

- (int)_doDeepFusionSytheticRefererenceAndProxy
{
  id v5 = (double *)&self->_anon_17fa20[8];
  uint64_t v6 = &self->_anon_14893c[1008];
  p_sifrFrameIndeCGFloat x = &self->_sifrFrameIndex;
  uint64_t v7 = (int *)MEMORY[0x263F00E10];
  int v8 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    int v8 = *v7;
  }
  if (v8)
  {
    uint64_t v9 = objc_msgSend_commandQueue(*((void **)v6 + 17), a2, v2, v3);
    float32x4_t v13 = objc_msgSend_commandBuffer(v9, v10, v11, v12);

    objc_msgSend_setLabel_(v13, v14, @"KTRACE_START_MTL", v15);
    objc_msgSend_addCompletedHandler_(v13, v16, (uint64_t)&unk_270E34208, v17);
    objc_msgSend_commit(v13, v18, v19, v20);
  }
  int v21 = *p_sifrFrameIndex;
  v253[0] = 0;
  *(_OWORD *)id v5 = xmmword_263117FA0;
  *((_OWORD *)v5 + 1) = unk_263117FB0;
  int v251 = v21;
  if ((v21 & 0x80000000) == 0)
  {
    objc_msgSend__deepFusionSetWarpReferenceSIFR(self, a2, v2, v3);
    objc_msgSend__deepFusionInvalidatePyramids(self, v22, v23, v24);
  }
  colorSpaceConversionParameters = self->_fusionConf.colorSpaceConversionParameters;
  bracketProperties = self->_bracketProperties;
  uint64_t v27 = (char *)&self->_lscGainsTex + 2;
  if (objc_msgSend_doDeepFusionPyramidGeneration_properties_syntheticReferenceFramesOnly_pyramidHasBeenBuiltArray_(self->_denoiseFusePipeline, a2, (uint64_t)self->_fusionConf.colorSpaceConversionParameters, (uint64_t)self->_bracketProperties, 1, (char *)&self->_lscGainsTex + 2))
  {
    FigDebugAssert3();
LABEL_108:
    HasBeenBuiltArraCGFloat y = FigSignalErrorAt();
    goto LABEL_89;
  }
  if (v251 < 0)
  {
    HasBeenBuiltArraCGFloat y = 0;
    *((_DWORD *)v6 + 55) = 0;
    int v36 = 1;
    goto LABEL_15;
  }
  int started = objc_msgSend_startSyntheticReferenceDetectors_properties_nrfPlist_(self->_denoiseFusePipeline, v28, (uint64_t)self->_fusionConf.colorSpaceConversionParameters, (uint64_t)self->_bracketProperties, *((void *)v6 + 6));
  if (started)
  {
    HasBeenBuiltArraCGFloat y = started;
LABEL_105:
    FigDebugAssert3();
    goto LABEL_89;
  }
  *((_DWORD *)v6 + 55) = 0;
  int v33 = objc_msgSend_collectSyntheticReferenceDetectorsResultsSync_srMode_nrfPlist_(self->_denoiseFusePipeline, v32, (uint64_t)(v6 + 220), (uint64_t)v253, *((void *)v6 + 6));
  if (v33)
  {
    HasBeenBuiltArraCGFloat y = v33;
    goto LABEL_105;
  }
  objc_msgSend_setRefFrameTransformIsValid_(*((void **)v6 + 26), v34, v253[0] == 2, v35);
  int v36 = 1;
  if (v253[0] == 1)
  {
    objc_msgSend__deepFusionRevertWarpToDefault(self, v28, v29, v30);
    objc_msgSend__deepFusionInvalidatePyramids(self, v37, v38, v39);
    v27[*(int *)v6] = 1;
    HasBeenBuiltArraCGFloat y = objc_msgSend_doDeepFusionPyramidGeneration_properties_syntheticReferenceFramesOnly_pyramidHasBeenBuiltArray_(self->_denoiseFusePipeline, v40, (uint64_t)self->_fusionConf.colorSpaceConversionParameters, (uint64_t)self->_bracketProperties, 1, (char *)&self->_lscGainsTex + 2);
    int v36 = 0;
    v27[*(int *)v6] = 0;
  }
  else
  {
    HasBeenBuiltArraCGFloat y = 0;
  }
LABEL_15:
  if (!objc_msgSend_gainMapOutputPixelBuffer(*((void **)v6 + 26), v28, v29, v30))
  {
    uint64_t v246 = 0;
    goto LABEL_25;
  }
  int v45 = *(_DWORD *)v6;
  if ((v36 & 1) == 0) {
    *(_DWORD *)uint64_t v6 = -1;
  }
  long long v46 = (__CVBuffer *)objc_msgSend_gainMapOutputPixelBuffer(*((void **)v6 + 26), v42, v43, v44);
  if (CVPixelBufferGetPixelFormatType(v46) != 1278226488)
  {
    FigDebugAssert3();
    HasBeenBuiltArraCGFloat y = -12780;
    goto LABEL_89;
  }
  uint64_t v50 = (void *)*((void *)v6 + 17);
  uint64_t v51 = objc_msgSend_gainMapOutputPixelBuffer(*((void **)v6 + 26), v47, v48, v49);
  uint64_t v53 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(v50, v52, v51, 10, 6, 0);
  if (!v53)
  {
    FigDebugAssert3();
    goto LABEL_108;
  }
  colorSpaceConversionParameters = self->_fusionConf.colorSpaceConversionParameters;
  uint64_t v246 = (void *)v53;
  int v55 = objc_msgSend_doGainMap_properties_output_outputHeadroom_nrfPlist_useFusedFrame_(self->_denoiseFusePipeline, v54, (uint64_t)self->_fusionConf.colorSpaceConversionParameters, (uint64_t)self->_bracketProperties, v53, &self->_processedSyntheticReference, *((void *)v6 + 6), 0);
  if ((v36 & 1) == 0) {
    *(_DWORD *)uint64_t v6 = v45;
  }
  if (v55) {
    goto LABEL_109;
  }
  HasBeenBuiltArraCGFloat y = 0;
LABEL_25:
  v249 = self->_bracketProperties;
  if (!objc_msgSend_inferenceInputPixelBuffer(*((void **)v6 + 26), v42, v43, v44)) {
    goto LABEL_33;
  }
  uint64_t v59 = (int *)(v5 + 6);
  if (v251 >= 0) {
    uint64_t v59 = p_sifrFrameIndex;
  }
  uint64_t v60 = *v59;
  uint64_t v64 = objc_msgSend_inferenceInputPixelBuffer(*((void **)v6 + 26), v56, v57, v58);
  uint64_t v65 = *((unsigned int *)v5 + 12);
  if (v36) {
    uint64_t v66 = v60;
  }
  else {
    uint64_t v66 = v65;
  }
  int v67 = (__CVBuffer *)objc_msgSend_syntheticReferencePixelBuffer(*((void **)v6 + 26), v61, v62, v63);
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(v67, 0);
  uint64_t v72 = (__CVBuffer *)objc_msgSend_syntheticReferencePixelBuffer(*((void **)v6 + 26), v69, v70, v71);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(v72, 0);
  if (objc_msgSend__processInferenceImage_sourceFrameType_sourceFrameIndex_ltcFrameIndex_gtcFrameIndex_originalWidth_originalHeight_(self, v74, v64, 1, v66, v60, v65, WidthOfPlane, HeightOfPlane))
  {
LABEL_109:
    FigDebugAssert3();
    HasBeenBuiltArraCGFloat y = FigSignalErrorAt();
    goto LABEL_62;
  }
  HasBeenBuiltArraCGFloat y = 0;
  colorSpaceConversionParameters = self->_fusionConf.colorSpaceConversionParameters;
  bracketProperties = self->_bracketProperties;
LABEL_33:
  char v75 = v36 ^ 1;
  if (v251 < 0) {
    char v75 = 1;
  }
  if ((v75 & 1) == 0)
  {
    *(float *)&double v76 = sub_262F98950((uint64_t)&bracketProperties->meta.exposureParams + 224224 * *p_sifrFrameIndex, (uint64_t)&bracketProperties->meta.exposureParams + 224224 * *((int *)v5 + 12), 2);
    int v78 = objc_msgSend_computeRansacColorMatchingCoefficients_scaleEv0brightness_applyToPyramid_andStoreTransform_(self->_denoiseFusePipeline, v77, (uint64_t)colorSpaceConversionParameters, *(unsigned __int8 *)(*((void *)v6 + 24) + 73), v5, v76);
    HasBeenBuiltArraCGFloat y = v78;
    if (!*(unsigned char *)(*((void *)v6 + 24) + 73))
    {
      *(_OWORD *)id v5 = xmmword_263117FA0;
      *((_OWORD *)v5 + 1) = unk_263117FB0;
    }
    if (v78)
    {
      FigDebugAssert3();
      goto LABEL_62;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressiveBracketingParameters);
  if (*((void *)v6 + 29)
    && objc_msgSend_syntheticReferencePixelBuffer(*((void **)v6 + 26), v79, v80, v81)
    && objc_msgSend_syntheticReferenceFusionMapPixelBuffer(*((void **)v6 + 26), v83, v84, v85))
  {
    if (objc_opt_respondsToSelector())
    {
      int v86 = [LumaChromaImage alloc];
      uint64_t v87 = *((void *)v6 + 17);
      uint64_t v91 = objc_msgSend_syntheticReferencePixelBuffer(*((void **)v6 + 26), v88, v89, v90);
      int v248 = objc_msgSend_initWithContext_pixelBuffer_lumaAlignmentFactor_chromaAlignmentFactor_(v86, v92, v87, v91, 16, 8);
      if (v248)
      {
        float v96 = (void *)*((void *)v6 + 17);
        uint64_t v97 = objc_msgSend_syntheticReferenceFusionMapPixelBuffer(*((void **)v6 + 26), v93, v94, v95);
        v247 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(v96, v98, v97, 10, 7, 0);
        if (!v247)
        {
          FigDebugAssert3();
LABEL_116:

          goto LABEL_117;
        }
        id v100 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        if (!v100) {
          goto LABEL_113;
        }
        denoiseFusePipeline = self->_denoiseFusePipeline;
        uint64_t v102 = *((void *)v6 + 29);
        if (v251 < 0) {
          int v103 = objc_msgSend_doSyntheticReference_noiseDivisorOutputTex_lscGainsTex_config_evmProperties_evmGreenTintAdjustment_ev0Properties_nrfPlist_intermediateMetadata_(denoiseFusePipeline, v99, (uint64_t)v248, (uint64_t)v247, v102, colorSpaceConversionParameters, 0, (char *)v249 + 224224 * *((int *)v5 + 12), *v5, v5[2], *((void *)v6 + 6), v100);
        }
        else {
          int v103 = objc_msgSend_doSyntheticReference_noiseDivisorOutputTex_lscGainsTex_config_evmProperties_evmGreenTintAdjustment_ev0Properties_nrfPlist_intermediateMetadata_(denoiseFusePipeline, v99, (uint64_t)v248, (uint64_t)v247, v102, colorSpaceConversionParameters, (char *)v249 + 224224 * *p_sifrFrameIndex, (char *)v249 + 224224 * *((int *)v5 + 12), *v5, v5[2], *((void *)v6 + 6), v100);
        }
        if (v103)
        {
          HasBeenBuiltArraCGFloat y = v103;
          FigDebugAssert3();
LABEL_114:

          goto LABEL_115;
        }
        size_t v107 = objc_msgSend_syntheticReferenceMetadata(*((void **)v6 + 26), v104, v105, v106);
        objc_msgSend_setObject_forKeyedSubscript_(v107, v108, (uint64_t)v100, @"SyntheticReference");

        if (!objc_msgSend_proxyPixelBuffer(*((void **)v6 + 26), v109, v110, v111)) {
          goto LABEL_71;
        }
        uint64_t v113 = self->_denoiseFusePipeline;
        uint64_t v114 = *((void *)v6 + 29);
        if (v251 < 0) {
          int v115 = objc_msgSend_deepFusionBuildNoiseMap_lscGainsTex_config_evmProperties_evmGreenTintAdjustment_ev0Properties_nrfPlist_(v113, v112, (uint64_t)v247, v114, colorSpaceConversionParameters, 0, (char *)v249 + 224224 * *((int *)v5 + 12), *((void *)v6 + 6), *v5, v5[2]);
        }
        else {
          int v115 = objc_msgSend_deepFusionBuildNoiseMap_lscGainsTex_config_evmProperties_evmGreenTintAdjustment_ev0Properties_nrfPlist_(v113, v112, (uint64_t)v247, v114, colorSpaceConversionParameters, (char *)v249 + 224224 * *p_sifrFrameIndex, (char *)v249 + 224224 * *((int *)v5 + 12), *((void *)v6 + 6), *v5, v5[2]);
        }
        if (v115)
        {
          HasBeenBuiltArraCGFloat y = v115;
          FigDebugAssert3();
        }
        else
        {
          __int32 v116 = [LumaChromaImage alloc];
          uint64_t v117 = *((void *)v6 + 17);
          uint64_t v121 = objc_msgSend_proxyPixelBuffer(*((void **)v6 + 26), v118, v119, v120);
          uint64_t v123 = objc_msgSend_initWithContext_pixelBuffer_lumaAlignmentFactor_chromaAlignmentFactor_(v116, v122, v117, v121, 16, 8);
          if (v123)
          {
            id v100 = (id)v123;
            if (!objc_msgSend_linearOutputPixelBuffer(*((void **)v6 + 26), v124, v125, v126))
            {
LABEL_63:
              id v148 = WeakRetained;
              if (*((void *)v5 + 13))
              {
                uint64_t v149 = objc_msgSend_processorGetInferenceResults_(WeakRetained, v127, (uint64_t)self, v128);
              }
              else
              {
                uint64_t v149 = 0;
              }
              id v150 = self->_denoiseFusePipeline;
              if (v251 < 0) {
                int v151 = objc_msgSend_doDeepFusionProxyAsset_syntheticReference_evmProperties_ev0Properties_inferenceResults_style_nrfPlist_(v150, v127, (uint64_t)v100, (uint64_t)v248, 0, (char *)v249 + 224224 * *((int *)v5 + 12), v149, *((void *)v5 + 13), *((void *)v6 + 6));
              }
              else {
                int v151 = objc_msgSend_doDeepFusionProxyAsset_syntheticReference_evmProperties_ev0Properties_inferenceResults_style_nrfPlist_(v150, v127, (uint64_t)v100, (uint64_t)v248, (char *)v249 + 224224 * *p_sifrFrameIndex, (char *)v249 + 224224 * *((int *)v5 + 12), v149, *((void *)v5 + 13), *((void *)v6 + 6));
              }
              if (v151)
              {
                HasBeenBuiltArraCGFloat y = v151;
                FigDebugAssert3();

                id WeakRetained = v148;
LABEL_61:

LABEL_62:
LABEL_89:
                long long v231 = (int *)MEMORY[0x263F00E10];
                goto LABEL_90;
              }

              id WeakRetained = v148;
LABEL_71:
              if ((objc_opt_respondsToSelector() & 1) == 0) {
                goto LABEL_83;
              }
              objc_msgSend_waitForSchedule(*((void **)v6 + 17), v152, v153, v154);
              if (!objc_msgSend_proxyPixelBuffer(*((void **)v6 + 26), v155, v156, v157)) {
                goto LABEL_83;
              }
              if (*MEMORY[0x263F00E10] == 1) {
                kdebug_trace();
              }
              if (objc_msgSend_linearOutputPixelBuffer(*((void **)v6 + 26), v158, v159, v160))
              {
                uint64_t v164 = objc_msgSend_linearOutputMetadata(*((void **)v6 + 26), v161, v162, v163);
                objc_msgSend_setLinearOutputMetadata_(self, v165, (uint64_t)v164, v166);

                uint64_t v170 = objc_msgSend_linearOutputPixelBuffer(*((void **)v6 + 26), v167, v168, v169);
                uint64_t v174 = objc_msgSend_linearOutputMetadata(*((void **)v6 + 26), v171, v172, v173);
                objc_msgSend_processor_outputReadyWithFrameType_outputPixelBuffer_outputMetadata_error_(WeakRetained, v175, (uint64_t)self, 10, v170, v174, 0);
              }
              int v176 = *(unsigned __int8 *)(*(void *)(*((void *)v6 + 6) + 40) + 79);
              uint64_t v177 = objc_msgSend_proxyMetadata(*((void **)v6 + 26), v161, v162, v163);
              int v179 = v177;
              uint64_t v180 = *MEMORY[0x263F2F190];
              if (v176)
              {
                objc_msgSend_setObject_forKeyedSubscript_(v177, v178, MEMORY[0x263EFFA88], v180);

                uint64_t v181 = NSNumber;
                uint64_t STFStillApplied = objc_msgSend_getSTFStillApplied(self->_denoiseFusePipeline, v182, v183, v184);
                uint64_t v188 = objc_msgSend_numberWithBool_(v181, v186, STFStillApplied, v187);
                uint64_t v192 = objc_msgSend_proxyMetadata(*((void **)v6 + 26), v189, v190, v191);
                objc_msgSend_setObject_forKeyedSubscript_(v192, v193, (uint64_t)v188, *MEMORY[0x263F2F180]);

                if (!objc_msgSend_getSTFStillApplied(self->_denoiseFusePipeline, v194, v195, v196))
                {
LABEL_82:
                  uint64_t v222 = objc_msgSend_proxyPixelBuffer(*((void **)v6 + 26), v197, v198, v199);
                  long long v226 = objc_msgSend_proxyMetadata(*((void **)v6 + 26), v223, v224, v225);
                  objc_msgSend_processor_outputReadyWithFrameType_outputPixelBuffer_outputMetadata_error_(WeakRetained, v227, (uint64_t)self, 2, v222, v226, 0);

                  colorSpaceConversionParameters = self->_fusionConf.colorSpaceConversionParameters;
LABEL_83:

                  uint64_t v229 = 0;
                  uint64_t v230 = *p_sifrFrameIndex;
                  do
                  {
                    if (v230 != v229) {
                      v27[v229] = 0;
                    }
                    ++v229;
                  }
                  while (v229 != 5);
                  if (!objc_msgSend_doDeepFusionPyramidGeneration_properties_syntheticReferenceFramesOnly_pyramidHasBeenBuiltArray_(self->_denoiseFusePipeline, v228, (uint64_t)colorSpaceConversionParameters, (uint64_t)v249, 0, (char *)&self->_lscGainsTex + 2))
                  {
                    v6[224] = 1;

                    HasBeenBuiltArraCGFloat y = 0;
                    goto LABEL_89;
                  }
                  goto LABEL_109;
                }
                uint64_t v200 = NSNumber;
                uint64_t STFStillCorrectionStrength = objc_msgSend_getSTFStillCorrectionStrength_(self->_denoiseFusePipeline, v197, 0, v199);
                v204 = objc_msgSend_numberWithInt_(v200, v202, STFStillCorrectionStrength, v203);
                uint64_t v208 = objc_msgSend_proxyMetadata(*((void **)v6 + 26), v205, v206, v207);
                objc_msgSend_setObject_forKeyedSubscript_(v208, v209, (uint64_t)v204, *MEMORY[0x263F2F188]);

                int v210 = NSNumber;
                STFStillAnalyticsVersiouint64_t n = objc_msgSend_getSTFStillAnalyticsVersion(self->_denoiseFusePipeline, v211, v212, v213);
                int v179 = objc_msgSend_numberWithUnsignedInt_(v210, v215, STFStillAnalyticsVersion, v216);
                long long v220 = objc_msgSend_proxyMetadata(*((void **)v6 + 26), v217, v218, v219);
                objc_msgSend_setObject_forKeyedSubscript_(v220, v221, (uint64_t)v179, *MEMORY[0x263F2F178]);
              }
              else
              {
                objc_msgSend_setObject_forKeyedSubscript_(v177, v178, MEMORY[0x263EFFA80], v180);
              }

              goto LABEL_82;
            }
            uint64_t v129 = *(void *)(*((void *)v6 + 6) + 56);
            if (v129)
            {
              objc_msgSend_getLumaPedestalWithProperties_plistSource_(DeepFusionCommon, v127, (uint64_t)&self->_referenceFrameProperties.meta.exposureParams.blue_gain, *(void *)(v129 + 56));
              int v134 = v133;
              uint64_t v135 = p_sifrFrameIndex;
              if (v251 < 0) {
                uint64_t v135 = (int *)(v5 + 6);
              }
              char v136 = self->_denoiseFusePipeline;
              id v137 = WeakRetained;
              uint64_t v138 = v248[2];
              uint64_t v139 = v248[3];
              uint64_t v140 = (uint64_t)&v249->meta.exposureParams + 224224 * *v135;
              uint64_t v141 = objc_msgSend_linearOutputPixelBuffer(*((void **)v6 + 26), v130, v131, v132);
              uint64_t v142 = v138;
              id WeakRetained = v137;
              colorSpaceConversionParameters = self->_fusionConf.colorSpaceConversionParameters;
              LODWORD(v143) = v134;
              HasBeenBuiltArraCGFloat y = objc_msgSend_extractLinearBufferWithLumaInput_chromaInput_inputIsLinear_removeChromaBias_lumaPedestal_exposureParams_ccm_output_(v136, v144, v142, v139, 0, 1, v140, v141, v143, *MEMORY[0x263EF89A0], *(double *)(MEMORY[0x263EF89A0] + 16), *(double *)(MEMORY[0x263EF89A0] + 32));
              if (HasBeenBuiltArray) {
                goto LABEL_61;
              }
              goto LABEL_63;
            }
LABEL_113:
            FigDebugAssert3();
            HasBeenBuiltArraCGFloat y = FigSignalErrorAt();
            goto LABEL_114;
          }
          FigDebugAssert3();
          HasBeenBuiltArraCGFloat y = 0;
        }
LABEL_115:

        goto LABEL_116;
      }
      FigDebugAssert3();
    }
    else
    {
      FigDebugAssert3();
      HasBeenBuiltArraCGFloat y = -12784;
    }
  }
  else
  {
    FigDebugAssert3();
    HasBeenBuiltArraCGFloat y = FigSignalErrorAt();
  }
LABEL_117:
  long long v231 = (int *)MEMORY[0x263F00E10];

LABEL_90:
  int v232 = *v231;
  if (*v231 == 1)
  {
    kdebug_trace();
    int v232 = *v231;
  }
  if (v232)
  {
    id v233 = objc_msgSend_commandQueue(*((void **)v6 + 17), v145, v146, v147);
    uint64_t v237 = objc_msgSend_commandBuffer(v233, v234, v235, v236);

    objc_msgSend_setLabel_(v237, v238, @"KTRACE_END_MTL", v239);
    v252[0] = MEMORY[0x263EF8330];
    v252[1] = 3221225472;
    v252[2] = sub_262FE3DA8;
    v252[3] = &unk_2655C32E8;
    memset(&v252[4], 0, 24);
    objc_msgSend_addCompletedHandler_(v237, v240, (uint64_t)v252, v241);
    objc_msgSend_commit(v237, v242, v243, v244);
  }
  return HasBeenBuiltArray;
}

- (int)_lowLightMotionDetection
{
  p_uint64_t cntBracketSampleBuffers = &self->_cntBracketSampleBuffers;
  uint64_t cntBracketSampleBuffers = self->_cntBracketSampleBuffers;
  if ((cntBracketSampleBuffers & 0x80000000) != 0) {
    return 0;
  }
  int referenceFrameCandidatesCount = self->_referenceFrameCandidatesCount;
  if ((int)cntBracketSampleBuffers >= referenceFrameCandidatesCount) {
    return 0;
  }
  bracketProperties = self->_bracketProperties;
  if (*((unsigned char *)&self->_bracketProperties[1].meta.exposureParams.normalized_snr
       + 224224 * cntBracketSampleBuffers))
  {
    uint64_t v7 = referenceFrameCandidatesCount - 1;
    if (!bracketProperties[1].meta.ltmCurves.ltmLut.bytes[224224 * v7 + 196]) {
      *((_DWORD *)&bracketProperties[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[3].RB.mid + 56056 * v7) = 0;
    }
    int output = (int)self->_output;
    if ((output - 1) >= 2)
    {
      if ((output - 4) < 2)
      {
        objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF488], @"*** RawNightMode is unsupported in this version of NRF.", 0);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v16);
      }
    }
    else
    {
      if (!bracketProperties[1].meta.ltmCurves.ltmLut.bytes[224224 * cntBracketSampleBuffers + 196])
      {
        int v9 = objc_msgSend_runMotionDetectionLL_imgIndex_imgProperties_refProperties_(self->_denoiseFusePipeline, a2, 1, cntBracketSampleBuffers, (char *)bracketProperties + 224224 * cntBracketSampleBuffers, (char *)bracketProperties + 224224 * cntBracketSampleBuffers);
        if (v9)
        {
          int v14 = v9;
LABEL_21:
          FigDebugAssert3();
          return v14;
        }
        bracketProperties[1].meta.ltmCurves.ltmLut.bytes[224224 * *p_cntBracketSampleBuffers + 196] = 1;
        int referenceFrameCandidatesCount = p_cntBracketSampleBuffers[2];
      }
      if (referenceFrameCandidatesCount >= 1)
      {
        uint64_t v10 = 0;
        p_highlights = &self->_bracketProperties[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[3].RG.highlights;
        uint64_t v12 = bracketProperties;
        do
        {
          if (!*(unsigned char *)p_highlights)
          {
            int v13 = objc_msgSend_runMotionDetectionLL_imgIndex_imgProperties_refProperties_(self->_denoiseFusePipeline, a2, 0, v10, v12, (char *)bracketProperties + 224224 * *p_cntBracketSampleBuffers);
            if (v13)
            {
              int v14 = v13;
              goto LABEL_21;
            }
            *(unsigned char *)p_highlights = 1;
            int referenceFrameCandidatesCount = p_cntBracketSampleBuffers[2];
          }
          ++v10;
          uint64_t v12 = (frameProperties_t *)((char *)v12 + 224224);
          p_highlights += 112112;
        }
        while (v10 < referenceFrameCandidatesCount);
      }
    }
    return 0;
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)_lowLightGreenGhostPerFrameProcessing
{
  if (!objc_msgSend_doGreenGhostMitigation(self->_denoiseFusePipeline, a2, v2, v3)) {
    return 0;
  }
  p_uint64_t cntBracketSampleBuffers = &self->_cntBracketSampleBuffers;
  uint64_t cntBracketSampleBuffers = self->_cntBracketSampleBuffers;
  if ((cntBracketSampleBuffers & 0x80000000) != 0) {
    return 0;
  }
  int referenceFrameCandidatesCount = self->_referenceFrameCandidatesCount;
  if ((int)cntBracketSampleBuffers >= referenceFrameCandidatesCount) {
    return 0;
  }
  int output = (int)self->_output;
  if (output != 2)
  {
    if ((output - 4) < 2)
    {
      objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], v5, *MEMORY[0x263EFF488], @"*** RawNightMode is unsupported in this version of NRF.", 0);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v10);
    }
    return 0;
  }
  p_regWarpInput = &self->_regWarpInput;
  bracketProperties = self->_bracketProperties;
  if (self->_bracketProperties[1].meta.ltmCurves.ltmLut.bytes[224224 * cntBracketSampleBuffers + 246])
  {
LABEL_10:
    if (referenceFrameCandidatesCount >= 1)
    {
      uint64_t v14 = 0;
      p_RG = &self->_bracketProperties[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[4].RG;
      for (uint64_t i = self->_bracketProperties; ; uint64_t i = (frameProperties_t *)((char *)i + 224224))
      {
        if (!LOBYTE(p_RG->shadows))
        {
          int v17 = objc_msgSend_greenGhostMitigationWithRefIndex_bracketIndex_refProperties_otherProperties_tuningParams_(self->_denoiseFusePipeline, v5, *p_cntBracketSampleBuffers, v14, (char *)bracketProperties + 224224 * *p_cntBracketSampleBuffers, i, *((void *)*p_regWarpInput + 15));
          if (v17)
          {
            int v18 = v17;
            goto LABEL_19;
          }
          LOBYTE(p_RG->shadows) = 1;
          int referenceFrameCandidatesCount = self->_referenceFrameCandidatesCount;
        }
        ++v14;
        p_RG = ($83D303C7C06C07B89C3C18D76D4378E1 *)((char *)p_RG + 224224);
        if (v14 >= referenceFrameCandidatesCount) {
          return 0;
        }
      }
    }
    return 0;
  }
  int v13 = objc_msgSend_greenGhostMitigationWithRefIndex_bracketIndex_refProperties_otherProperties_tuningParams_(self->_denoiseFusePipeline, v5, cntBracketSampleBuffers, self->_cntBracketSampleBuffers, (char *)bracketProperties + 224224 * cntBracketSampleBuffers, (char *)bracketProperties + 224224 * cntBracketSampleBuffers, *((void *)*p_regWarpInput + 15));
  if (!v13)
  {
    bracketProperties[1].meta.ltmCurves.ltmLut.bytes[224224 * *p_cntBracketSampleBuffers + 246] = 1;
    int referenceFrameCandidatesCount = self->_referenceFrameCandidatesCount;
    goto LABEL_10;
  }
  int v18 = v13;
LABEL_19:
  FigDebugAssert3();
  return v18;
}

- (int)_computeMetricsForReferenceFrameSelection:(int)a3
{
  bracketProperties = self->_bracketProperties;
  BOOL v4 = &self->_bracketProperties[1].meta.ltmCurves.ltmLut.bytes[224224 * a3 + 228];
  if (!*v4)
  {
    uint64_t v6 = *(void *)&a3;
    uint64_t v96 = 0;
    CMGetAttachment(self->_bracketSampleBuffers[a3], (CFStringRef)*MEMORY[0x263F2EF78], 0);
    CFDictionaryRef v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CFDictionaryRef v10 = v9;
    if (!v9)
    {
      FigDebugAssert3();
      int v5 = FigSignalErrorAt();
      goto LABEL_47;
    }
    int v91 = a3;
    if (CFDictionaryGetValue(v9, (const void *)*MEMORY[0x263F2F5C8])) {
      int v94 = portIndexFromPortType();
    }
    else {
      int v94 = 0;
    }
    LODWORD(v13) = -1.0;
    p_maxFocusScore = &self->_maxFocusScore;
    uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v10, v11, *MEMORY[0x263F2F378], v12, v13);
    objc_msgSend_doubleValue(v14, v15, v16, v17);
    double v19 = v18;

    uint64_t v93 = objc_msgSend_objectForKeyedSubscript_(v10, v20, *MEMORY[0x263F2F4C8], v21);
    int32x4_t v26 = objc_msgSend_objectForKeyedSubscript_(v93, v22, *MEMORY[0x263F2F730], v23);
    uint64_t v92 = v4;
    if (v26)
    {
      uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v10, v24, *MEMORY[0x263F2F4C0], v25);
      int v31 = objc_msgSend_intValue(v27, v28, v29, v30);

      if (*(unsigned char *)(*((void *)self->_regWarpInput + 10) + 9))
      {
        if (v31 == 2)
        {
          uint64_t v35 = objc_msgSend_objectAtIndexedSubscript_(v26, v32, 0, v34);
          objc_msgSend_doubleValue(v35, v36, v37, v38);
          double v19 = v39;

          goto LABEL_22;
        }
        if (objc_msgSend_count(v26, v32, v33, v34) != 1)
        {
          unint64_t v57 = 0;
          double v43 = 0.0;
          do
          {
            uint64_t v58 = objc_msgSend_objectAtIndexedSubscript_(v26, v55, v57, v56);
            objc_msgSend_doubleValue(v58, v59, v60, v61);
            double v43 = v43 + v62;

            ++v57;
          }
          while (v57 < objc_msgSend_count(v26, v63, v64, v65) - 1);
          if (v43 > 0.0)
          {
            uint64_t v54 = objc_msgSend_count(v26, v55, v66, v56) - 1;
            goto LABEL_21;
          }
        }
      }
      else
      {
        unint64_t v40 = v31 == 2;
        if (objc_msgSend_count(v26, v32, v33, v34) - 1 > v40)
        {
          double v43 = 0.0;
          unint64_t v44 = v31 == 2;
          do
          {
            int v45 = objc_msgSend_objectAtIndexedSubscript_(v26, v41, v44, v42);
            objc_msgSend_doubleValue(v45, v46, v47, v48);
            double v43 = v43 + v49;

            ++v44;
          }
          while (v44 < objc_msgSend_count(v26, v50, v51, v52) - 1);
          if (v43 > 0.0)
          {
            uint64_t v54 = objc_msgSend_count(v26, v41, v53, v42) + ~v40;
LABEL_21:
            double v19 = v43 / (double)(unint64_t)v54;
          }
        }
      }
    }
LABEL_22:
    id v67 = objc_alloc_init(MEMORY[0x263EFF980]);
    objc_msgSend_addObject_(v67, v68, (uint64_t)v10, v69);
    int v70 = FigMotionComputeBlurScores();
    BOOL v74 = v70 != 0;
    if (BYTE2(self->_nrfFusionOutput->_inferenceInputPixelBuffer)
      || (int v75 = v70,
          objc_msgSend_statistics(self->_semanticStyleProperties, v71, v72, v73),
          CFDictionaryRef v76 = v10,
          uint64_t v77 = objc_claimAutoreleasedReturnValue(),
          int v81 = objc_msgSend_stationary(v77, v78, v79, v80),
          v77,
          CFDictionaryRef v10 = v76,
          v81))
    {
      if (v94) {
        HIDWORD(v96) = 0;
      }
    }
    else
    {
      if (v75) {
        BOOL v82 = v94 == 0;
      }
      else {
        BOOL v82 = 0;
      }
      if (v82) {
        int v5 = 23;
      }
      else {
        int v5 = v94;
      }
      if (v5)
      {
        FigDebugAssert3();
        goto LABEL_51;
      }
    }
    int v83 = objc_msgSend__computeCornersStrengthWithBracketIndex_totalCornerStrength_(self, v71, v6, (uint64_t)&v96);
    if (!v83)
    {
      uint64_t v84 = v93;
      if (!self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing)
      {
        int referenceFrameCandidatesCount = self->_referenceFrameCandidatesCount;
        if (referenceFrameCandidatesCount <= 3)
        {
          if (referenceFrameCandidatesCount == 1)
          {
            *(double *)&self->_maxBlinkDetectScore = v19;
            int maxFocusScore_high = HIDWORD(v96);
            float v86 = *(float *)&v96;
          }
          else
          {
            double v88 = *(double *)&self->_maxBlinkDetectScore;
            if (v88 <= v19) {
              double v88 = v19;
            }
            *(double *)&self->_maxBlinkDetectScore = v88;
            float v86 = *(float *)&v96;
            if (*(float *)p_maxFocusScore > *(float *)&v96) {
              float v86 = *(float *)p_maxFocusScore;
            }
            int maxFocusScore_high = HIDWORD(v96);
            if (*((float *)&self->_maxFocusScore + 1) < *((float *)&v96 + 1)) {
              int maxFocusScore_high = HIDWORD(self->_maxFocusScore);
            }
          }
          *(float *)p_maxFocusScore = v86;
          HIDWORD(self->_maxFocusScore) = maxFocusScore_high;
        }
      }
      int v5 = 0;
      uint64_t v89 = (double *)(&bracketProperties->meta.sensorID + 56056 * v91);
      v89[28022] = v19;
      *((_DWORD *)v89 + 56046) = HIDWORD(v96);
      *((unsigned char *)v89 + 224188) = v74;
      *((_DWORD *)v89 + 56048) = v96;
      *uint64_t v92 = 1;
      goto LABEL_46;
    }
    int v5 = v83;
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_51:
    uint64_t v84 = v93;
LABEL_46:

LABEL_47:
    return v5;
  }
  return 0;
}

- (int)_perFrameProcessingComputeReferenceFrameIndexIfReady
{
  if (self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing <= 0
    && self->_referenceFrameCandidatesCount == 3)
  {
    return objc_msgSend__computeReferenceFrameIndex(self, a2, v2, v3);
  }
  else
  {
    return 0;
  }
}

- (int)_computeReferenceFrameIndex
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t referenceFrameCandidatesCount = self->_referenceFrameCandidatesCount;
  if ((referenceFrameCandidatesCount - 4) <= 0xFFFFFFFC)
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  else
  {
    uint64_t v4 = 0;
    p_shadows = (float *)&self->_bracketProperties[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[4].RR.shadows;
    memset(v25, 0, sizeof(v25));
    int v26 = 0;
    memset(v23, 0, sizeof(v23));
    int v24 = 0;
    memset(v21, 0, sizeof(v21));
    int v22 = 0;
    memset(v19, 0, sizeof(v19));
    int v20 = 0;
    double v6 = *(double *)&self->_maxBlinkDetectScore;
    if (v6 <= 1.0e-10) {
      double v6 = 1.0;
    }
    float v8 = *(float *)&self->_maxFocusScore;
    float v7 = *((float *)&self->_maxFocusScore + 1);
    if (v7 <= 1.0e-10) {
      float v7 = 1.0;
    }
    if (v8 <= 1.0e-10) {
      float v8 = 1.0;
    }
    if (*(float *)&self->_anon_17fa15[3] <= 1.0e-10) {
      float v9 = 1.0;
    }
    else {
      float v9 = *(float *)&self->_anon_17fa15[3];
    }
    do
    {
      float v10 = *((double *)p_shadows - 4) / v6;
      *(float *)((char *)v23 + v4) = v10;
      *(float *)((char *)v25 + v4) = *(p_shadows - 6) / v7;
      *(float *)((char *)v21 + v4) = *(p_shadows - 4) / v8;
      *(float *)((char *)v19 + v4) = *p_shadows / v9;
      v4 += 4;
      p_shadows += 56056;
    }
    while (4 * referenceFrameCandidatesCount != v4);
    p_uint64_t cntBracketSampleBuffers = &self->_cntBracketSampleBuffers;
    SharpestBracket_normGyroScores_normCornerScores_normFocusScores_normBlinkScores_useLongWeights_sharpFrameIndeCGFloat x = objc_msgSend__getSharpestBracket_normGyroScores_normCornerScores_normFocusScores_normBlinkScores_useLongWeights_sharpFrameIndex_(self, a2, referenceFrameCandidatesCount, (uint64_t)v25, v21, v23, v19, (float)(self->_bracketProperties[0].meta.exposureParams.exposure_time * 1000.0) > 200.0, &self->_cntBracketSampleBuffers);
    if (SharpestBracket_normGyroScores_normCornerScores_normFocusScores_normBlinkScores_useLongWeights_sharpFrameIndex)
    {
      int v17 = SharpestBracket_normGyroScores_normCornerScores_normFocusScores_normBlinkScores_useLongWeights_sharpFrameIndex;
      FigDebugAssert3();
      FigSignalErrorAt();
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_progressiveBracketingParameters);
      char v14 = objc_opt_respondsToSelector();

      if (v14)
      {
        id v15 = objc_loadWeakRetained((id *)&self->_progressiveBracketingParameters);
        objc_msgSend_processor_didSelectProgressiveFusionReferenceFrameIndex_(v15, v16, (uint64_t)self, *p_cntBracketSampleBuffers);
      }
      return 0;
    }
    return v17;
  }
}

- (int)_computeCornersStrengthWithBracketIndex:(unsigned int)a3 totalCornerStrength:(float *)a4
{
  p_uint64_t referenceFrameCandidatesCount = &self->_referenceFrameCandidatesCount;
  if (self->_referenceFrameCandidatesCount > a3)
  {
    if (a4)
    {
      ImageBuffer = CMSampleBufferGetImageBuffer(self->_bracketSampleBuffers[a3]);
      if (ImageBuffer)
      {
        float v9 = (RegWarpHelper *)ImageBuffer;
        long long v10 = *((_OWORD *)&self->_bracketProperties[0].meta.ROI.size + 14014 * a3);
        p_curRegWarpTempIndeCGFloat x = &self->_curRegWarpTempIndex;
        long long v32 = *((_OWORD *)&self->_bracketProperties[0].meta.ROI.origin + 14014 * a3);
        long long v33 = v10;
        uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
        if (objc_msgSend_shouldDownsampleRWPPInputWithPixelFormat_processingType_(self, v13, PixelFormatType, p_referenceFrameCandidatesCount[4]))
        {
          if (*p_curRegWarpTempIndex != a3)
          {
            if (PixelFormatType == 1751527984
              || *(void *)&self->_registrationPipelineRWPPConfig.numThreads == 0)
            {
              regWarpM2M = self->_regWarpM2M;
              regWarpHelper = self->_regWarpHelper;
              int v20 = objc_msgSend_commandBuffer(*(void **)&self->_fusionOptions, v14, v15, v16);
              int v22 = objc_msgSend_convertInput10BitPixBuf_downsampledOutput8BitPixBuf_mtlCommandBuffer_(regWarpM2M, v21, (uint64_t)v9, (uint64_t)regWarpHelper, v20);

              if (v22) {
                goto LABEL_21;
              }
              objc_msgSend_waitForSchedule(*(void **)&self->_fusionOptions, v23, v24, v25);
            }
            else
            {
              int v26 = objc_msgSend__downsampleImageForRegistration_outputImage_(self, v14, (uint64_t)v9, (uint64_t)self->_regWarpHelper);
              if (v26)
              {
                int v22 = v26;
                goto LABEL_21;
              }
            }
            int *p_curRegWarpTempIndex = a3;
          }
          float v9 = self->_regWarpHelper;
          objc_msgSend__downscaleRoiForRegistration_(self, v14, v15, v16, v32, v33);
          *(void *)&long long v32 = v27;
          *((void *)&v32 + 1) = v28;
          *(void *)&long long v33 = v29;
          *((void *)&v33 + 1) = v30;
        }
        int v22 = objc_msgSend_calculateTotalCornerStrength_regionOfInterest_mapping_outTotalCornerStrength_(self->_metal, v14, (uint64_t)v9, (uint64_t)&v32, 0, a4);
        if (!v22) {
          return v22;
        }
LABEL_21:
        FigDebugAssert3();
        return v22;
      }
    }
  }

  return FigSignalErrorAt();
}

- (int)_getSharpestBracket:(int)a3 normGyroScores:(float *)a4 normCornerScores:(float *)a5 normFocusScores:(float *)a6 normBlinkScores:(float *)a7 useLongWeights:(unsigned __int8)a8 sharpFrameIndex:(int *)a9
{
  if (a9
    && a4
    && a5
    && a6
    && a7
    && a3 < 4
    && (p_regWarpInput = &self->_regWarpInput, (uint64_t v10 = *((void *)self->_regWarpInput + 10)) != 0))
  {
    if (a3 >= 1)
    {
      uint64_t v11 = 0;
      uint64_t v12 = &OBJC_IVAR___FrameSelectionPlist_referenceSelectionRegressionWeightLongFrame;
      if (!a8) {
        uint64_t v12 = &OBJC_IVAR___FrameSelectionPlist_referenceSelectionRegressionWeightShortFrame;
      }
      double v13 = (double *)(v10 + *v12);
      double v14 = *v13;
      double v15 = v13[1];
      double v16 = v13[2];
      double v17 = v13[3];
      float v18 = 3.4028e38;
      do
      {
        float v19 = v14 + v15 * a4[v11] + v16 * a5[v11] + v17 * a6[v11];
        uint64_t v20 = *(void *)(*((void *)*p_regWarpInput + 10) + 184);
        if (v20 && *(unsigned char *)(v20 + 8)) {
          float v19 = (float)(*(float *)(v20 + 72) * (float)(1.0 - a7[v11])) + v19 * (1.0 - *(float *)(v20 + 72));
        }
        if (!v11 || v18 > v19)
        {
          *a9 = v11;
          float v18 = v19;
        }
        ++v11;
      }
      while (a3 != v11);
    }
    return 0;
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)_computeBlurryFrameWeight:(int)a3
{
  p_maxFocusScore = &self->_maxFocusScore;
  *((_DWORD *)&self->_bracketProperties[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[3].BG.highlights + 56056 * a3) = 1065353216;
  if (LODWORD(self->_output) != 2) {
    return 0;
  }
  uint64_t v4 = self;
  regWarpInput = self->_regWarpInput;
  uint64_t v6 = *((void *)regWarpInput + 10);
  if (v6)
  {
    if (*(unsigned char *)(v6 + 10))
    {
      if (!self->_bracketProperties[1].meta.ltmCurves.ltmLut.bytes[224224 * a3 + 236])
      {
        uint64_t cntBracketSampleBuffers = self->_cntBracketSampleBuffers;
        if ((cntBracketSampleBuffers & 0x80000000) == 0)
        {
          uint64_t referenceFrameCandidatesCount = self->_referenceFrameCandidatesCount;
          if ((int)cntBracketSampleBuffers < (int)referenceFrameCandidatesCount)
          {
            uint64_t v10 = &OBJC_IVAR___FrameSelectionPlist_blurFrameRejectionRegressionWeightShortFrame;
            if (self->_bracketProperties[0].meta.exposureParams.exposure_time > 0.2) {
              uint64_t v10 = &OBJC_IVAR___FrameSelectionPlist_blurFrameRejectionRegressionWeightLongFrame;
            }
            uint64_t v11 = (double *)(v6 + *v10);
            do
            {
              _X8 = &v4->_bracketProperties[4].meta.ltmCurves.ltmLut.ccmV1.lutsData[27].GG.mid;
              __asm { PRFM            #0, [X8] }
              if (!v4->_bracketProperties[1].meta.ltmCurves.ltmLut.bytes[236])
              {
                if (cntBracketSampleBuffers)
                {
                  uint64_t v18 = *((void *)regWarpInput + 10);
                  float v19 = *(float *)(v18 + 176);
                  float v20 = *(float *)(v18 + 180);
                  float v21 = 0.5;
                  if (v19 < v20)
                  {
                    float v22 = *(double *)&v4->_bracketProperties[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[3].GR.highlights
                        / p_maxFocusScore[1];
                    long double v23 = exp(*v11+ v11[1]* *(float *)&v4->_bracketProperties[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[3].GB.shadows+ v11[2]* (float)(*(float *)&v4->_bracketProperties[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[3].BR.mid/ *(float *)p_maxFocusScore)+ v11[4] * *(float *)&v4->_bracketProperties[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[3].RB.mid+ v11[3] * v22);
                    *(float *)&long double v23 = v23 / (v23 + 1.0);
                    float v24 = (float)(*(float *)&v23 - v19) / (float)(v20 - v19);
                    float v25 = fminf(v24, 1.0);
                    if (v24 >= 1.0) {
                      float v21 = 0.0;
                    }
                    else {
                      float v21 = 1.0 - v24;
                    }
                    if (v25 <= 0.0) {
                      float v21 = 1.0;
                    }
                  }
                  *(float *)&v4->_bracketProperties[1].meta.ltmCurves.ltmLut.ccmV1.lutsData[3].BG.highlights = v21;
                }
                v4->_bracketProperties[1].meta.ltmCurves.ltmLut.bytes[236] = 1;
              }
              uint64_t v4 = (NRFProcessorV2 *)((char *)v4 + 224224);
              --cntBracketSampleBuffers;
              --referenceFrameCandidatesCount;
            }
            while (referenceFrameCandidatesCount);
          }
        }
      }
    }
    return 0;
  }

  return FigSignalErrorAt();
}

- (id)sharedMetalBuffer
{
  return self->_sharedMetalBuffer;
}

- (void)setSharedMetalBuffer:(id)a3
{
  uint64_t v4 = (MTLBuffer *)a3;
  objc_msgSend_releaseResources(self->_denoiseFusePipeline, v5, v6, v7);
  sharedMetalBuffer = self->_sharedMetalBuffer;
  self->_sharedMetalBuffer = v4;

  self->_usingExternalSharedMetalBuffer = 1;
}

- (id)sharedRegWarpBuffer
{
  return self->_sharedRegWarpBuffer;
}

- (void)setSharedRegWarpBuffer:(id)a3
{
  int v5 = (FigWiredMemory *)a3;
  if (self->_sharedRegWarpBuffer != v5)
  {
    float v9 = v5;
    objc_msgSend_releaseResources(self->_metal, v6, v7, v8);
    objc_storeStrong((id *)&self->_sharedRegWarpBuffer, a3);
    int v5 = v9;
    self->_usingExternalSharedRegWarpBuffer = 1;
    self->_regwarpHasBeenSetup = 0;
  }
}

- (BOOL)srlEnabled
{
  return ((uint64_t (*)(DenoiseFusePipeline *, char *))MEMORY[0x270F9A6D0])(self->_denoiseFusePipeline, sel_srlEnabled);
}

- (void)setSrlEnabled:(BOOL)a3
{
  objc_msgSend_setSrlEnabled_(self->_denoiseFusePipeline, a2, a3, v3);
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
  return self->_referenceFrameIndex;
}

- (void)setReferenceFrameHasEVMinus:(BOOL)a3
{
  LOBYTE(self->_referenceFrameIndex) = a3;
}

- (NRFProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressiveBracketingParameters);

  return (NRFProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)doRedFaceFix
{
  return BYTE1(self->_referenceFrameIndex);
}

- (void)setDoRedFaceFix:(BOOL)a3
{
  BYTE1(self->_referenceFrameIndex) = a3;
}

- (BOOL)enableGreenGhostMitigation
{
  return BYTE2(self->_referenceFrameIndex);
}

- (void)setEnableGreenGhostMitigation:(BOOL)a3
{
  BYTE2(self->_referenceFrameIndex) = a3;
}

- (NRFProgressiveBracketingParameters)progressiveBracketingParameters
{
  return (NRFProgressiveBracketingParameters *)self->_semanticStyleProperties;
}

- (void)setProgressiveBracketingParameters:(id)a3
{
}

- (int)progressiveBatchSize
{
  return self->_batchCount;
}

- (int)cntBracketSampleBuffers
{
  return self->_referenceFrameCandidatesCount;
}

- (int)batchCount
{
  return self->_maximumNumberOfReferenceFrameCandidatesToHoldForProcessing;
}

- (IBPSemanticStyleProperties)semanticStyleProperties
{
  return (IBPSemanticStyleProperties *)self->_tuningParameters;
}

- (void)setSemanticStyleProperties:(id)a3
{
}

- (BOOL)learnedNREnabled
{
  return HIBYTE(self->_referenceFrameIndex);
}

- (void)setLearnedNREnabled:(BOOL)a3
{
  HIBYTE(self->_referenceFrameIndex) = a3;
}

- (BOOL)skipDenoising
{
  return self->_progressiveBatchSize;
}

- (void)setSkipDenoising:(BOOL)a3
{
  LOBYTE(self->_progressiveBatchSize) = a3;
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
  return &self->_tuningParams->super;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (NSMutableDictionary)tuningParams
{
  return self->_tuningParamsPlist;
}

- (void)setTuningParams:(id)a3
{
}

- (NSMutableDictionary)tuningParamsPlist
{
  return self->_defringingTuningByPortType;
}

- (void)setTuningParamsPlist:(id)a3
{
}

- (NSMutableDictionary)defringingTuningByPortType
{
  return (NSMutableDictionary *)self[1].super.isa;
}

- (void)setDefringingTuningByPortType:(id)a3
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
  objc_storeStrong((id *)&self->_defringingTuningByPortType, 0);
  objc_storeStrong((id *)&self->_tuningParamsPlist, 0);
  objc_storeStrong((id *)&self->_tuningParams, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_semanticStyleProperties, 0);
  objc_destroyWeak((id *)&self->_progressiveBracketingParameters);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_referenceFrameHasEVMinus, 0);
  objc_storeStrong((id *)&self->_referenceFrame, 0);
  objc_storeStrong((id *)&self->_outputGainMapHeadroom, 0);
  objc_storeStrong((id *)&self->_deepFusionOutput, 0);
  objc_storeStrong((id *)&self->_nrfFusionOutput, 0);
  objc_storeStrong((id *)&self->_nrfConfig, 0);
  objc_storeStrong((id *)&self->_saveInputFramesToDisk, 0);
  objc_storeStrong((id *)&self->_globalDistortionCorrectionPlist, 0);
  objc_storeStrong((id *)&self->_globalDistortionCorrectionByPortType, 0);
  objc_storeStrong((id *)&self->_fusionOptions, 0);
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_registrationPipelineRWPPConfig, 0);
  objc_storeStrong((id *)&self->_regWarpM2M, 0);
  objc_storeStrong((id *)&self->_regWarpInput, 0);
  objc_storeStrong((id *)&self->_denoiseFusePipeline, 0);
  objc_storeStrong((id *)&self->_sharedRegWarpBuffer, 0);

  objc_storeStrong((id *)&self->_sharedMetalBuffer, 0);
}

@end