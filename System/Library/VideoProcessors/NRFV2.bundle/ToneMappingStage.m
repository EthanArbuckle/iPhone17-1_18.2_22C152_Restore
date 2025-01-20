@interface ToneMappingStage
+ (int)prewarmShaders:(id)a3;
- (BOOL)enableSTF;
- (BOOL)stfStillApplied;
- (NSMutableDictionary)stfTuningParameters;
- (SidecarWriter)sidecarWriter;
- (ToneMappingStage)initWithContext:(id)a3 mtlSuballocatorID:(unsigned int)a4;
- (__n64)getCcmRoi:(int)a3 chromaTexHeight:(int)a4 ccmLut:(_WORD *)a5 isHalfResolution:(int)a6;
- (__n64)getLtmRoi:(int)a3 chromaTexHeight:(int)a4 ltmLut:(_WORD *)a5 isHalfResolution:(int)a6;
- (float)getExposureBiasFactor:(const frameMetadata *)a3 inputIsLinear:(BOOL)a4;
- (id)getSTFLTM_asNSData;
- (int)allocateResourcesForWidth:(unint64_t)a3 height:(unint64_t)a4 srlVersion:(int)a5;
- (int)calculateBlackWhiteContrastCenter:(float)a3 contrastParam:(id)a4 curves:;
- (int)fetchTuningParametersFromPlist:(id)a3 ev0FrameMetadata:(const frameMetadata *)a4 toneMap:(id)a5 destinationMTLBuffer:(id)a6;
- (int)getSTFStillCorrectionStrength:(BOOL)a3;
- (int)mstmsApplyLumaGain:(id)a3 inputLuma:(id)a4 inputChroma:(id)a5 outputChroma:(id)a6 localGainMap:(id)a7 chromaGainAdjPower:(float)a8 inputIsLinear:(BOOL)a9 chromaBias:(float)a10;
- (int)performBlackSubtractionWithBlackWhiteParams:(float)a3 maxContrastStrength:(id)a4 inOutTex:(id)a5 curves:;
- (int)performSmallFaceFix:(id)a3 faceLandmarks:(id)a4 faceLandmarkOrientation:(int)a5 tmPlist:(id)a6;
- (int)performSubjectRelightingWithTonemap:(id)a3 luma:(id)a4 chroma:(id)a5 ltmChroma:(id)a6 validROI:(CGRect)a7 skinMask:(id)a8 personMask:(id)a9 faceLandmarks:(id)a10 ev0FrameMetadata:(const frameMetadata *)a11 ltmOutputMode:(int)a12 inputIsLinear:(BOOL)a13 chromaBias:(float)a14 tmPlist:(id)a15;
- (int)performToneMapSmoothing:(id)a3 mask:(id)a4 skyMask:(id)a5 tmPlist:(id)a6 ev0FrameMetadata:(const frameMetadata *)a7 useMaskPyramid:(BOOL)a8;
- (uint64_t)performLTM:(__n128)a3 bilateralGrid:(__n128)a4 bilateralGridHomography:(__n128)a5 detailEnhance:(float)a6 darkestFrameMetadata:(__n128)a7 scaleInput:(__n128)a8 colorCorrection:(__n128)a9 outputMode:(uint64_t)a10 chromaGainAdjPower:(void *)a11 inputIsLinear:(void *)a12 chromaBias:(uint64_t)a13 isHalfResolution:(signed int)a14;
- (uint64_t)runToneMapping:(double)a3 bilateralGrid:(double)a4 bilateralGridHomography:(float)a5 tmPlist:(double)a6 darkestFrameMetadata:(double)a7 ev0FrameMetadata:(double)a8 scaleInput:(uint64_t)a9 colorCorrection:(void *)a10 hasChromaBias:(void *)a11 quality:(void *)a12 inputIsLinear:(uint64_t)a13;
- (unsigned)getSRLStatus;
- (unsigned)stfStillAnalyticsVersion;
- (void)dealloc;
- (void)reset;
- (void)setEnableSTF:(BOOL)a3;
- (void)setSidecarWriter:(id)a3;
- (void)setStfStillAnalyticsVersion:(unsigned int)a3;
- (void)setStfStillApplied:(BOOL)a3;
- (void)setStfTuningParameters:(id)a3;
@end

@implementation ToneMappingStage

- (ToneMappingStage)initWithContext:(id)a3 mtlSuballocatorID:(unsigned int)a4
{
  id v7 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ToneMappingStage;
  v8 = [(ToneMappingStage *)&v27 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v8->_metal, a3);
  v10 = [SubjectRelightingStage alloc];
  uint64_t v13 = objc_msgSend_initWithMetalContext_(v10, v11, (uint64_t)v9->_metal, v12);
  subjectRelightV2 = v9->_subjectRelightV2;
  v9->_subjectRelightV2 = (SubjectRelightingStage *)v13;

  if (v9->_subjectRelightV2)
  {
    v9->_mtlSuballocatorID = a4;
    v18 = objc_msgSend_sharedInstance(ToneMappingShared, v15, v16, v17);
    uint64_t v21 = objc_msgSend_getShaders_(v18, v19, (uint64_t)v9->_metal, v20);
    shaders = v9->_shaders;
    v9->_shaders = (ToneMappingShaders *)v21;

    if (v9->_shaders) {
      goto LABEL_4;
    }
  }
  FigDebugAssert3();
  int v26 = FigSignalErrorAt();
  v23 = 0;
  if (!v26) {
LABEL_4:
  }
    v23 = v9;
  v24 = v23;

  return v24;
}

- (int)allocateResourcesForWidth:(unint64_t)a3 height:(unint64_t)a4 srlVersion:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  if (objc_msgSend_width(self->_toneMapSmoothingResources, a2, a3, a4) != a3
    || objc_msgSend_height(self->_toneMapSmoothingResources, v9, v10, v11) != a4)
  {
    v14 = [ToneMapSmoothingResources alloc];
    uint64_t v16 = (ToneMapSmoothingResources *)objc_msgSend_initWithMetalContext_width_height_mtlSubAllocatorID_srlVersion_(v14, v15, (uint64_t)self->_metal, a3, a4, self->_mtlSuballocatorID, v5);
    toneMapSmoothingResources = self->_toneMapSmoothingResources;
    self->_toneMapSmoothingResources = v16;

    if (!self->_toneMapSmoothingResources)
    {
      FigDebugAssert3();
      return -12786;
    }
  }
  if (!self->_enableSTF || self->_stfProcessor) {
    goto LABEL_8;
  }
  objc_msgSend_STFStillIBPForVersion_(MEMORY[0x263F2EE78], v12, 1, v13);
  v18 = (STFStillImageBufferProcessor *)objc_claimAutoreleasedReturnValue();
  stfProcessor = self->_stfProcessor;
  self->_stfProcessor = v18;

  if (self->_stfProcessor)
  {
    v23 = objc_msgSend_commandQueue(self->_metal, v20, v21, v22);
    objc_msgSend_setMetalCommandQueue_(self->_stfProcessor, v24, (uint64_t)v23, v25);

    objc_msgSend_setTuningParameters_(self->_stfProcessor, v26, (uint64_t)self->_stfTuningParameters, v27);
    int v31 = objc_msgSend_setup(self->_stfProcessor, v28, v29, v30);
    if (!v31)
    {
LABEL_8:
      int v32 = objc_msgSend_prepareToProcess_(self->_stfProcessor, v12, 0, v13);
      int v33 = 0;
      self->_stfStillCorrectionStrength = 0;
      self->_stfStillApplied = 0;
      self->_stfStillAnalyticsVersion = 0;
      self->_SRLWaitCompleted = 0;
      if (v32)
      {
        int v35 = v32;
        FigDebugAssert3();
        return v35;
      }
      return v33;
    }
    int v33 = v31;
    FigDebugAssert3();
    FigSignalErrorAt();
    return v33;
  }
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (void)dealloc
{
  objc_msgSend_purgeResources(self->_stfProcessor, a2, v2, v3);
  toneMapSmoothingResources = self->_toneMapSmoothingResources;
  self->_toneMapSmoothingResources = 0;

  subjectRelightV2 = self->_subjectRelightV2;
  self->_subjectRelightV2 = 0;

  v7.receiver = self;
  v7.super_class = (Class)ToneMappingStage;
  [(ToneMappingStage *)&v7 dealloc];
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [ToneMappingShaders alloc];
  objc_super v7 = objc_msgSend_initWithMetal_(v4, v5, (uint64_t)v3, v6);

  if (v7) {
    int v8 = 0;
  }
  else {
    int v8 = -12786;
  }

  return v8;
}

- (int)calculateBlackWhiteContrastCenter:(float)a3 contrastParam:(id)a4 curves:
{
  long long v54 = *(_OWORD *)&a3;
  int v53 = v4;
  uint64_t v6 = (uint64_t *)a4;
  uint64_t v10 = objc_msgSend_commandQueue(self->_metal, v7, v8, v9);
  v14 = objc_msgSend_commandBuffer(v10, v11, v12, v13);

  if (v14
    && (objc_msgSend_computeCommandEncoder(v14, v15, v16, v17),
        (v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v21 = v18;
    objc_msgSend_setComputePipelineState_(v18, v19, (uint64_t)self->_shaders->_calculateBlackWhiteStrengthCenter, v20);
    objc_msgSend_setBuffer_offset_atIndex_(v21, v22, v6[4], 0, 0);
    objc_msgSend_setBytes_length_atIndex_(v21, v23, (uint64_t)&v54, 16, 1);
    objc_msgSend_setBytes_length_atIndex_(v21, v24, (uint64_t)&v53, 4, 2);
    objc_msgSend_setBuffer_offset_atIndex_(v21, v25, v6[5], 0, 3);
    int64x2_t v51 = vdupq_n_s64(1uLL);
    uint64_t v52 = 1;
    int64x2_t v49 = v51;
    uint64_t v50 = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v21, v26, (uint64_t)&v51, (uint64_t)&v49);
    objc_msgSend_endEncoding(v21, v27, v28, v29);
    if (*MEMORY[0x263F00E10])
    {
      int v33 = objc_msgSend_commandQueue(v14, v30, v31, v32);
      v37 = objc_msgSend_commandBuffer(v33, v34, v35, v36);

      objc_msgSend_setLabel_(v37, v38, @"KTRACE_MTLCMDBUF", v39);
      objc_msgSend_addCompletedHandler_(v37, v40, (uint64_t)&unk_270E34288, v41);
      objc_msgSend_commit(v37, v42, v43, v44);
      objc_msgSend_addCompletedHandler_(v14, v45, (uint64_t)&unk_270E342A8, v46);
    }
    objc_msgSend_commit(v14, v30, v31, v32);

    int v47 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v47 = FigSignalErrorAt();
  }

  return v47;
}

- (int)performBlackSubtractionWithBlackWhiteParams:(float)a3 maxContrastStrength:(id)a4 inOutTex:(id)a5 curves:
{
  int v7 = v5;
  double v61 = *(double *)&a3;
  id v9 = a4;
  uint64_t v10 = (uint64_t *)a5;
  LODWORD(v11) = v7;
  objc_msgSend_calculateBlackWhiteContrastCenter_contrastParam_curves_(self, v12, (uint64_t)v10, v13, v61, v11);
  uint64_t v17 = objc_msgSend_commandQueue(self->_metal, v14, v15, v16);
  uint64_t v21 = objc_msgSend_commandBuffer(v17, v18, v19, v20);

  if (v21
    && (objc_msgSend_computeCommandEncoder(v21, v22, v23, v24),
        (uint64_t v25 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v28 = v25;
    objc_msgSend_setComputePipelineState_(v25, v26, (uint64_t)self->_shaders->_blackSubtractAndAddingContrast, v27);
    objc_msgSend_setTexture_atIndex_(v28, v29, (uint64_t)v9, 0);
    objc_msgSend_setBuffer_offset_atIndex_(v28, v30, v10[5], 0, 0);
    objc_msgSend_setImageblockWidth_height_(v28, v31, 32, 32);
    v64[0] = objc_msgSend_width(v9, v32, v33, v34);
    v64[1] = objc_msgSend_height(v9, v35, v36, v37);
    v64[2] = 1;
    int64x2_t v62 = vdupq_n_s64(0x20uLL);
    uint64_t v63 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v28, v38, (uint64_t)v64, (uint64_t)&v62);
    objc_msgSend_endEncoding(v28, v39, v40, v41);
    if (*MEMORY[0x263F00E10])
    {
      v45 = objc_msgSend_commandQueue(v21, v42, v43, v44);
      int64x2_t v49 = objc_msgSend_commandBuffer(v45, v46, v47, v48);

      objc_msgSend_setLabel_(v49, v50, @"KTRACE_MTLCMDBUF", v51);
      objc_msgSend_addCompletedHandler_(v49, v52, (uint64_t)&unk_270E342C8, v53);
      objc_msgSend_commit(v49, v54, v55, v56);
      objc_msgSend_addCompletedHandler_(v21, v57, (uint64_t)&unk_270E342E8, v58);
    }
    objc_msgSend_commit(v21, v42, v43, v44);

    int v59 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v59 = FigSignalErrorAt();
  }

  return v59;
}

- (int)mstmsApplyLumaGain:(id)a3 inputLuma:(id)a4 inputChroma:(id)a5 outputChroma:(id)a6 localGainMap:(id)a7 chromaGainAdjPower:(float)a8 inputIsLinear:(BOOL)a9 chromaBias:(float)a10
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  float v81 = a8;
  BOOL v80 = a9;
  float v79 = a10;
  int v26 = objc_msgSend_commandQueue(self->_metal, v23, v24, v25);
  uint64_t v30 = objc_msgSend_commandBuffer(v26, v27, v28, v29);

  if (v30
    && (objc_msgSend_computeCommandEncoder(v30, v31, v32, v33),
        (uint64_t v34 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v37 = v34;
    objc_msgSend_setComputePipelineState_(v34, v35, (uint64_t)self->_shaders->_mstmsApply, v36);
    objc_msgSend_setTexture_atIndex_(v37, v38, (uint64_t)v18, 0);
    objc_msgSend_setTexture_atIndex_(v37, v39, (uint64_t)v19, 1);
    objc_msgSend_setTexture_atIndex_(v37, v40, (uint64_t)v20, 2);
    objc_msgSend_setTexture_atIndex_(v37, v41, (uint64_t)v21, 3);
    objc_msgSend_setTexture_atIndex_(v37, v42, (uint64_t)v22, 4);
    objc_msgSend_setBytes_length_atIndex_(v37, v43, (uint64_t)&v81, 4, 0);
    objc_msgSend_setBytes_length_atIndex_(v37, v44, (uint64_t)&v80, 1, 1);
    objc_msgSend_setBytes_length_atIndex_(v37, v45, (uint64_t)&v79, 4, 2);
    objc_msgSend_setImageblockWidth_height_(v37, v46, 32, 32);
    v78[0] = (((unint64_t)objc_msgSend_width(v18, v47, v48, v49) >> 1) + 15) >> 4;
    v78[1] = (((unint64_t)objc_msgSend_height(v18, v50, v51, v52) >> 1) + 15) >> 4;
    v78[2] = 1;
    int64x2_t v76 = vdupq_n_s64(0x10uLL);
    uint64_t v77 = 1;
    objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v37, v53, (uint64_t)v78, (uint64_t)&v76);
    objc_msgSend_endEncoding(v37, v54, v55, v56);

    if (*MEMORY[0x263F00E10])
    {
      v60 = objc_msgSend_commandQueue(v30, v57, v58, v59);
      v64 = objc_msgSend_commandBuffer(v60, v61, v62, v63);

      objc_msgSend_setLabel_(v64, v65, @"KTRACE_MTLCMDBUF", v66);
      objc_msgSend_addCompletedHandler_(v64, v67, (uint64_t)&unk_270E34308, v68);
      objc_msgSend_commit(v64, v69, v70, v71);
      objc_msgSend_addCompletedHandler_(v30, v72, (uint64_t)&unk_270E34328, v73);
    }
    objc_msgSend_commit(v30, v57, v58, v59);
    int v74 = 0;
  }
  else
  {
    FigDebugAssert3();
    int v74 = FigSignalErrorAt();
  }

  return v74;
}

- (uint64_t)performLTM:(__n128)a3 bilateralGrid:(__n128)a4 bilateralGridHomography:(__n128)a5 detailEnhance:(float)a6 darkestFrameMetadata:(__n128)a7 scaleInput:(__n128)a8 colorCorrection:(__n128)a9 outputMode:(uint64_t)a10 chromaGainAdjPower:(void *)a11 inputIsLinear:(void *)a12 chromaBias:(uint64_t)a13 isHalfResolution:(signed int)a14
{
  v150[0] = a2;
  v150[1] = a3;
  v150[2] = a4;
  v149[0] = a7;
  v149[1] = a8;
  v149[2] = a9;
  uint64_t v23 = a13 + 222432;
  id v24 = a11;
  v138 = a12;
  __n128 v148 = a5;
  float v147 = a6;
  char v146 = a15;
  uint64_t v28 = objc_msgSend_width(*((void **)v24 + 2), v25, v26, v27);
  uint64_t v32 = objc_msgSend_height(*((void **)v24 + 2), v29, v30, v31);
  objc_msgSend_getLtmRoi_chromaTexHeight_ltmLut_isHalfResolution_((void *)a1, v33, v28, v32, a13 + 168, a16);
  long long v145 = v34;
  uint64_t v38 = objc_msgSend_width(*((void **)v24 + 2), v35, v36, v37);
  uint64_t v42 = objc_msgSend_height(*((void **)v24 + 2), v39, v40, v41);
  objc_msgSend_getCcmRoi_chromaTexHeight_ccmLut_isHalfResolution_((void *)a1, v43, v38, v42, a13 + 168, a16);
  long long v144 = v45;
  if (*(unsigned char *)(*((void *)v24 + 16) + 56)) {
    BOOL v46 = *(unsigned char *)(v23 + 577) != 0;
  }
  else {
    BOOL v46 = 0;
  }
  int v143 = *(_DWORD *)v23;
  objc_msgSend_getExposureBiasFactor_inputIsLinear_((void *)a1, v44, a13, a15);
  int v142 = v47;
  uint64_t v51 = objc_msgSend_commandQueue(*(void **)(a1 + 8), v48, v49, v50);
  uint64_t v55 = objc_msgSend_commandBuffer(v51, v52, v53, v54);

  if (v55)
  {
    uint64_t v62 = objc_msgSend_blitCommandEncoder(v55, v56, v57, v58);
    if (v62)
    {
      uint64_t v63 = *(void **)(*((void *)v24 + 16) + 32);
      uint64_t v64 = objc_msgSend_length(v63, v59, v60, v61);
      objc_msgSend_fillBuffer_range_value_(v62, v65, (uint64_t)v63, 0, v64, 0);
      objc_msgSend_endEncoding(v62, v66, v67, v68);
      v72 = objc_msgSend_computeCommandEncoder(v55, v69, v70, v71);
      if (v72)
      {
        uint64_t v73 = 32;
        if (!v138) {
          uint64_t v73 = 24;
        }
        id v74 = *(id *)(*(void *)(a1 + 16) + v73);
        objc_msgSend_setComputePipelineState_(v72, v75, (uint64_t)v74, v76);
        objc_msgSend_setTexture_atIndex_(v72, v77, *((void *)v24 + 2), 1);
        objc_msgSend_setTexture_atIndex_(v72, v78, *((void *)v24 + 3), 3);
        objc_msgSend_setTexture_atIndex_(v72, v79, *(void *)(*((void *)v24 + 16) + 8), 4);
        objc_msgSend_setTexture_atIndex_(v72, v80, *(void *)(*((void *)v24 + 16) + 16), 5);
        objc_msgSend_setTexture_atIndex_(v72, v81, *(void *)(*((void *)v24 + 16) + 24), 6);
        objc_msgSend_setTexture_atIndex_(v72, v82, *((void *)v24 + 1), 8);
        if (v46) {
          objc_msgSend_setTexture_atIndex_(v72, v83, *(void *)(*((void *)v24 + 16) + 48), 12);
        }
        else {
          objc_msgSend_setTexture_atIndex_(v72, v83, 0, 12);
        }
        if (a14 <= 2)
        {
          uint64_t v85 = qword_263118278[a14];
          objc_msgSend_setTexture_atIndex_(v72, v84, *((void *)v24 + 4), qword_263118260[a14]);
          objc_msgSend_setTexture_atIndex_(v72, v86, *((void *)v24 + 5), v85);
        }
        objc_msgSend_setBytes_length_atIndex_(v72, v84, (uint64_t)&v145, 16, 1);
        objc_msgSend_setBuffer_offset_atIndex_(v72, v87, *(void *)(*((void *)v24 + 16) + 32), 0, 2);
        objc_msgSend_setBytes_length_atIndex_(v72, v88, (uint64_t)&v143, 4, 3);
        v90 = v138;
        if (v138)
        {
          objc_msgSend_setTexture_atIndex_(v72, v89, v138[1], 7);
          objc_msgSend_setBuffer_offset_atIndex_(v72, v91, v138[2], 0, 4);
          objc_msgSend_setBytes_length_atIndex_(v72, v92, (uint64_t)&v148, 16, 5);
          objc_msgSend_setBytes_length_atIndex_(v72, v93, (uint64_t)v150, 48, 6);
        }
        objc_msgSend_setBytes_length_atIndex_(v72, v89, (uint64_t)&v142, 4, 7);
        objc_msgSend_setBytes_length_atIndex_(v72, v94, (uint64_t)&v147, 4, 8);
        objc_msgSend_setBytes_length_atIndex_(v72, v95, (uint64_t)&a17, 4, 9);
        objc_msgSend_setBytes_length_atIndex_(v72, v96, (uint64_t)&v146, 1, 10);
        objc_msgSend_setBytes_length_atIndex_(v72, v97, (uint64_t)v149, 48, 11);
        objc_msgSend_setBytes_length_atIndex_(v72, v98, (uint64_t)&a17 + 4, 4, 12);
        objc_msgSend_setBytes_length_atIndex_(v72, v99, (uint64_t)v24 + 136, 4, 13);
        objc_msgSend_setBytes_length_atIndex_(v72, v100, (uint64_t)&v144, 16, 14);
        objc_msgSend_setImageblockWidth_height_(v72, v101, 32, 32);
        if ((unint64_t)objc_msgSend_maxTotalThreadsPerThreadgroup(v74, v102, v103, v104) <= 0xFF)
        {
          FigDebugAssert3();
          uint64_t v134 = FigSignalErrorAt();
        }
        else
        {
          uint64_t v108 = objc_msgSend_width(*((void **)v24 + 2), v105, v106, v107);
          uint64_t v112 = objc_msgSend_height(*((void **)v24 + 2), v109, v110, v111);
          v141[0] = v108;
          v141[1] = v112;
          v141[2] = 1;
          int64x2_t v139 = vdupq_n_s64(0x10uLL);
          uint64_t v140 = 1;
          objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v72, v113, (uint64_t)v141, (uint64_t)&v139);
          objc_msgSend_endEncoding(v72, v114, v115, v116);
          if (*MEMORY[0x263F00E10])
          {
            v120 = objc_msgSend_commandQueue(v55, v117, v118, v119);
            v124 = objc_msgSend_commandBuffer(v120, v121, v122, v123);

            objc_msgSend_setLabel_(v124, v125, @"KTRACE_MTLCMDBUF", v126);
            objc_msgSend_addCompletedHandler_(v124, v127, (uint64_t)&unk_270E34348, v128);
            objc_msgSend_commit(v124, v129, v130, v131);
            objc_msgSend_addCompletedHandler_(v55, v132, (uint64_t)&unk_270E34368, v133);
          }
          objc_msgSend_commit(v55, v117, v118, v119);

          uint64_t v134 = 0;
        }
      }
      else
      {
        FigDebugAssert3();
        uint64_t v134 = FigSignalErrorAt();
        v90 = v138;
      }
    }
    else
    {
      FigDebugAssert3();
      uint64_t v134 = FigSignalErrorAt();
      v90 = v138;
    }
  }
  else
  {
    FigDebugAssert3();
    uint64_t v134 = FigSignalErrorAt();
    v90 = v138;
  }

  return v134;
}

- (int)performSubjectRelightingWithTonemap:(id)a3 luma:(id)a4 chroma:(id)a5 ltmChroma:(id)a6 validROI:(CGRect)a7 skinMask:(id)a8 personMask:(id)a9 faceLandmarks:(id)a10 ev0FrameMetadata:(const frameMetadata *)a11 ltmOutputMode:(int)a12 inputIsLinear:(BOOL)a13 chromaBias:(float)a14 tmPlist:(id)a15
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  id v26 = a3;
  id v27 = a4;
  id v28 = a5;
  id v305 = a6;
  id v29 = a8;
  id v30 = a9;
  id v31 = a10;
  uint64_t v35 = a15;
  int exifOrientation = a11->exifOrientation;
  v306 = self;
  self->_lastSRLStatusValue = 1;
  uint64_t v37 = v26;
  v303 = v30;
  v304 = v29;
  if (!v26)
  {
    FigDebugAssert3();
    id v30 = 0;
    v179 = 0;
    int v295 = -12780;
    uint64_t v38 = v27;
    free(0);
    goto LABEL_71;
  }
  uint64_t v38 = v27;
  if (!v27) {
    goto LABEL_81;
  }
  if (!v28) {
    goto LABEL_81;
  }
  v306->_lastSRLStatusValue = 2;
  if (!v29) {
    goto LABEL_81;
  }
  if (!v30)
  {
    FigDebugAssert3();
    v308 = 0;
LABEL_82:
    v179 = 0;
    int v295 = -12780;
    goto LABEL_70;
  }
  if (!v31) {
    goto LABEL_81;
  }
  v306->_lastSRLStatusValue = 3;
  size_t v42 = objc_msgSend_count(v31, v32, v33, v34);
  size_t y_high = SHIDWORD(a11->faces[1].rect.origin.y);
  if (v42) {
    BOOL v44 = 1;
  }
  else {
    BOOL v44 = y_high == 0;
  }
  int v45 = !v44;
  int v302 = v45;
  if (!v44)
  {
    v306->_lastSRLStatusValue = 7;
    size_t v42 = y_high;
  }
  if (!v35)
  {
LABEL_81:
    FigDebugAssert3();
    v308 = 0;
    id v30 = 0;
    goto LABEL_82;
  }
  v306->_lastSRLStatusValue = 4;
  if (!v42 && !y_high || v42 >= 0x11 && y_high > 0x10)
  {
    id v30 = 0;
    v179 = 0;
    int v295 = 0;
    free(0);
    goto LABEL_71;
  }
  uint64_t v301 = (uint64_t)v28;
  int v297 = v42 << 8;
  v306->_lastSRLStatusValue = v297 | 4;
  int v46 = objc_msgSend_count(*(void **)(v35[6] + 8), v39, v40, v41);
  float v310 = (float)(unint64_t)objc_msgSend_width(v27, v47, v48, v49);
  uint64_t v53 = objc_msgSend_height(v27, v50, v51, v52);
  v54.f32[0] = v310;
  v54.f32[1] = (float)(unint64_t)v53;
  float32x2_t v311 = v54;
  long long v333 = 0u;
  long long v334 = 0u;
  long long v335 = 0u;
  long long v336 = 0u;
  long long v337 = 0u;
  long long v338 = 0u;
  long long v339 = 0u;
  long long v340 = 0u;
  long long v341 = 0u;
  long long v342 = 0u;
  long long v343 = 0u;
  long long v344 = 0u;
  long long v345 = 0u;
  uint64_t v346 = 0;
  v332[0] = v42;
  v332[1] = v46;
  LOBYTE(v333) = a13;
  *((float *)&v333 + 1) = a14;
  DWORD2(v333) = *((_DWORD *)v35 + 22);
  *(float32x2_t *)&long long v334 = vdiv_f32(COERCE_FLOAT32X2_T(sub_262FF6240((float64x2_t)*(unint64_t *)&x, y)), v54);
  v55.f64[0] = width;
  *((float32x2_t *)&v334 + 1) = vdiv_f32(COERCE_FLOAT32X2_T(sub_262FF6240(v55, height)), v311);
  uint64_t v56 = v35[1];
  long long v335 = *(_OWORD *)(v56 + 8);
  long long v336 = *(_OWORD *)(v56 + 24);
  long long v337 = *(_OWORD *)(v56 + 40);
  long long v338 = *(_OWORD *)(v56 + 56);
  long long v339 = *(_OWORD *)(v56 + 72);
  long long v340 = *(_OWORD *)(v56 + 88);
  *(void *)&long long v341 = *(void *)(v56 + 104);
  DWORD2(v341) = *(_DWORD *)(v56 + 112);
  long long v342 = *(_OWORD *)(v56 + 116);
  long long v343 = *(_OWORD *)(v56 + 132);
  long long v344 = *(_OWORD *)(v56 + 148);
  long long v345 = *(_OWORD *)(v56 + 164);
  LOBYTE(v346) = v302;
  v308 = (float64_t *)malloc_type_calloc(v42, 0xE8uLL, 0x1000040F515A0E0uLL);
  if (!v308)
  {
    FigDebugAssert3();
    id v30 = 0;
    v179 = 0;
    int v295 = -12786;
    free(0);
    goto LABEL_71;
  }
  float64x2_t v330 = 0u;
  float64x2_t v331 = 0u;
  float64x2_t v329 = 0u;
  v60.f64[0] = sub_262F8A92C(exifOrientation, (uint64_t)&v329);
  id v307 = v31;
  v299 = v26;
  v300 = v35;
  uint64_t v298 = (uint64_t)v27;
  if (v302)
  {
    if (v42)
    {
      uint64_t v61 = 0;
      float64_t v62 = *MEMORY[0x263F00148];
      float64_t v63 = *(double *)(MEMORY[0x263F00148] + 8);
      float v64 = 0.0;
      v65 = v308;
      do
      {
        v60.f64[0] = a11->faces[v61 + 1].rect.size.width;
        float64_t v66 = *(double *)&a11->faces[v61 + 1].confidence;
        CGFloat v67 = a11->faces[v61 + 2].rect.origin.x;
        uint64_t v68 = (char *)&v308[29 * v61];
        *(float64_t *)uint64_t v68 = sub_262FF6240(v60, a11->faces[v61 + 1].rect.size.height);
        v69.f64[0] = v66;
        v60.f64[0] = sub_262FF6240(v69, v67);
        uint64_t v70 = 0;
        *((void *)v68 + 1) = *(void *)&v60.f64[0];
        if (*(float *)v60.f64 <= *((float *)v60.f64 + 1)) {
          float v71 = *((float *)v60.f64 + 1);
        }
        else {
          float v71 = *(float *)v60.f64;
        }
        *((_DWORD *)v68 + 4) = 1077936128;
        do
        {
          v60.f64[0] = v62;
          v65[v70 + 3] = sub_262FF6240(v60, v63);
          v72.f64[0] = v62;
          v65[v70 + 9] = sub_262FF6240(v72, v63);
          ++v70;
        }
        while (v70 != 6);
        for (uint64_t i = 15; i != 29; ++i)
        {
          v60.f64[0] = v62;
          v65[i] = sub_262FF6240(v60, v63);
        }
        if (v64 < v71) {
          float v64 = v71;
        }
        ++v61;
        v65 += 29;
      }
      while (v61 != v42);
    }
    else
    {
      float v64 = 0.0;
    }
  }
  else
  {
    float v64 = 0.0;
    if (v42)
    {
      uint64_t v74 = 0;
      v75 = v308 + 9;
      uint64_t v76 = v308 + 15;
      while (1)
      {
        uint64_t v77 = objc_msgSend_objectAtIndexedSubscript_(v31, v57, v74, v59, v60.f64[0]);
        sub_262FF1D4C((uint64_t)v77, v78, v79, v80);
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          FigDebugAssert3();
          goto LABEL_74;
        }
        v84 = objc_msgSend_objectAtIndexedSubscript_(v31, v82, v74, v83);
        v88 = objc_msgSend_landmarks(v84, v85, v86, v87);
        v92 = objc_msgSend_leftEye(v88, v89, v90, v91);
        uint64_t v96 = objc_msgSend_pointCount(v92, v93, v94, v95);

        if (v96 != 6) {
          break;
        }
        v100 = objc_msgSend_landmarks(v84, v97, v98, v99);
        uint64_t v104 = objc_msgSend_rightEye(v100, v101, v102, v103);
        uint64_t v108 = objc_msgSend_pointCount(v104, v105, v106, v107);

        if (v108 != 6) {
          break;
        }
        uint64_t v112 = objc_msgSend_landmarks(v84, v109, v110, v111);
        uint64_t v116 = objc_msgSend_outerLips(v112, v113, v114, v115);
        uint64_t v120 = objc_msgSend_pointCount(v116, v117, v118, v119);

        if (v120 != 14) {
          break;
        }
        objc_msgSend_boundingBox(v84, v121, v122, v123);
        *(float64x2_t *)&v328.a = v329;
        *(float64x2_t *)&v328.c = v330;
        *(float64x2_t *)&v328.tCGFloat x = v331;
        CGRect v348 = CGRectApplyAffineTransform(v347, &v328);
        CGFloat v124 = v348.size.width;
        CGFloat v125 = v348.size.height;
        uint64_t v126 = &v308[29 * v74];
        *uint64_t v126 = sub_262FF6240((float64x2_t)v348.origin, v348.origin.y);
        v127.f64[0] = v124;
        v126[1] = sub_262FF6240(v127, v125);
        uint64_t v131 = objc_msgSend_yaw(v84, v128, v129, v130);
        objc_msgSend_floatValue(v131, v132, v133, v134);
        *((float *)v126 + 4) = (float)(v135 * 3.0) / 1.5708;

        int64x2_t v139 = v75;
        for (uint64_t j = 8; j != 104; j += 16)
        {
          v141 = objc_msgSend_landmarks(v84, v136, v137, v138);
          objc_msgSend_leftEye(v141, v142, v143, v144);
          id v145 = objc_claimAutoreleasedReturnValue();
          uint64_t v149 = objc_msgSend_normalizedPoints(v145, v146, v147, v148);
          float64x2_t v312 = vaddq_f64(v331, vmlaq_n_f64(vmulq_n_f64(v330, *(double *)(v149 + j)), v329, *(double *)(v149 + j - 8)));

          v153 = objc_msgSend_landmarks(v84, v150, v151, v152);
          objc_msgSend_rightEye(v153, v154, v155, v156);
          id v157 = objc_claimAutoreleasedReturnValue();
          uint64_t v161 = objc_msgSend_normalizedPoints(v157, v158, v159, v160);
          float64x2_t v309 = vaddq_f64(v331, vmlaq_n_f64(vmulq_n_f64(v330, *(double *)(v161 + j)), v329, *(double *)(v161 + j - 8)));

          *(v139 - 6) = sub_262FF6240(v312, v312.f64[1]);
          *v139++ = sub_262FF6240(v309, v309.f64[1]);
        }
        uint64_t v162 = 0;
        v163 = v76;
        do
        {
          v164 = objc_msgSend_landmarks(v84, v136, v137, v138);
          objc_msgSend_outerLips(v164, v165, v166, v167);
          id v168 = objc_claimAutoreleasedReturnValue();
          uint64_t v172 = objc_msgSend_normalizedPoints(v168, v169, v170, v171);
          float64x2_t v313 = vaddq_f64(v331, vmlaq_n_f64(vmulq_n_f64(v330, *(double *)(v172 + v162 + 8)), v329, *(double *)(v172 + v162)));

          *v163++ = sub_262FF6240(v313, v313.f64[1]);
          v162 += 16;
        }
        while (v162 != 224);

        ++v74;
        v75 += 29;
        v76 += 29;
        id v31 = v307;
        if (v74 == v42) {
          goto LABEL_48;
        }
      }
      FigDebugAssert3();

LABEL_74:
      id v30 = 0;
      v179 = 0;
      int v295 = -12780;
      uint64_t v38 = (void *)v298;
      goto LABEL_68;
    }
  }
LABEL_48:
  v306->_lastSRLStatusValue = 8;
  if (v64 >= *((float *)&v342 + 3))
  {
    id v30 = 0;
    v179 = 0;
    int v295 = 0;
    uint64_t v38 = (void *)v298;
    uint64_t v37 = v299;
    id v28 = (id)v301;
    id v31 = v307;
    goto LABEL_69;
  }
  if (v302) {
    int v173 = 7;
  }
  else {
    int v173 = 0;
  }
  int v174 = v297 | v173;
  v306->_lastSRLStatusValue = v297 | v173 | 5;
  v175 = objc_msgSend_commandQueue(v306->_metal, v57, v58, v59);
  v179 = objc_msgSend_commandBuffer(v175, v176, v177, v178);

  uint64_t v38 = (void *)v298;
  id v31 = v307;
  uint64_t v35 = v300;
  if (!v179)
  {
    FigDebugAssert3();
    int v295 = FigSignalErrorAt();
    id v30 = 0;
LABEL_87:
    id v28 = (id)v301;
    uint64_t v37 = v299;
    goto LABEL_70;
  }
  objc_msgSend_computeCommandEncoder(v179, v180, v181, v182);
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  if (!v30)
  {
    FigDebugAssert3();
    int v295 = FigSignalErrorAt();
    goto LABEL_87;
  }
  unint64_t v186 = objc_msgSend_maxTotalThreadsPerThreadgroup(v306->_shaders->_srlGlobalHistogram, v183, v184, v185);
  unint64_t v190 = objc_msgSend_maxTotalThreadsPerThreadgroup(v306->_shaders->_srlFaceHistogram, v187, v188, v189);
  uint64_t v194 = 48;
  if (v186 < v190) {
    uint64_t v194 = 40;
  }
  unint64_t v195 = objc_msgSend_maxTotalThreadsPerThreadgroup(*(void **)((char *)&v306->_shaders->super.isa + v194), v191, v192, v193);
  float v196 = log2f((float)(v195 >> 6));
  float v198 = exp2f(floorf(v196));
  if ((unint64_t)v198 >= 0x40) {
    unint64_t v199 = 64;
  }
  else {
    unint64_t v199 = (unint64_t)v198;
  }
  objc_msgSend_setTexture_atIndex_(v30, v197, (uint64_t)v299, 0);
  objc_msgSend_setTexture_atIndex_(v30, v200, v298, 1);
  objc_msgSend_setTexture_atIndex_(v30, v201, v301, 2);
  if (a12 == 2) {
    objc_msgSend_setTexture_atIndex_(v30, v202, (uint64_t)v305, 4);
  }
  else {
    objc_msgSend_setTexture_atIndex_(v30, v202, (uint64_t)v305, 3);
  }
  objc_msgSend_setTexture_atIndex_(v30, v203, (uint64_t)v304, 5);
  objc_msgSend_setTexture_atIndex_(v30, v204, (uint64_t)v303, 6);
  objc_msgSend_setBytes_length_atIndex_(v30, v205, (uint64_t)v332, 224, 0);
  objc_msgSend_setBytes_length_atIndex_(v30, v206, (uint64_t)v308, 232 * v42, 1);
  v210 = objc_msgSend_srlGlobalStatsBuffer(v306->_toneMapSmoothingResources, v207, v208, v209);
  unint64_t v214 = objc_msgSend_length(v210, v211, v212, v213);

  if (v214 <= 0x4213)
  {
    FigDebugAssert3();
    int v295 = -12780;
    id v28 = (id)v301;
LABEL_90:
    uint64_t v37 = v299;
    uint64_t v35 = v300;
    goto LABEL_70;
  }
  v218 = objc_msgSend_srlGlobalStatsBuffer(v306->_toneMapSmoothingResources, v215, v216, v217);
  objc_msgSend_setBuffer_offset_atIndex_(v30, v219, (uint64_t)v218, 0, 2);

  v223 = objc_msgSend_srlFaceStatsBuffer(v306->_toneMapSmoothingResources, v220, v221, v222);
  unint64_t v227 = objc_msgSend_length(v223, v224, v225, v226);

  if (v227 < 13616 * v42) {
    goto LABEL_89;
  }
  v231 = objc_msgSend_srlFaceStatsBuffer(v306->_toneMapSmoothingResources, v228, v229, v230);
  objc_msgSend_setBuffer_offset_atIndex_(v30, v232, (uint64_t)v231, 0, 3);

  v236 = objc_msgSend_srlCoeffsBuffer(v306->_toneMapSmoothingResources, v233, v234, v235);
  unint64_t v240 = objc_msgSend_length(v236, v237, v238, v239);

  if (v240 <= 0x2F)
  {
LABEL_89:
    FigDebugAssert3();
    int v295 = -12780;
    id v28 = (id)v301;
    id v31 = v307;
    goto LABEL_90;
  }
  v244 = objc_msgSend_srlCoeffsBuffer(v306->_toneMapSmoothingResources, v241, v242, v243);
  objc_msgSend_setBuffer_offset_atIndex_(v30, v245, (uint64_t)v244, 0, 4);

  v249 = objc_msgSend_mstmTuningParams(v306->_toneMapSmoothingResources, v246, v247, v248);
  objc_msgSend_setBuffer_offset_atIndex_(v30, v250, (uint64_t)v249, 0, 5);

  v254 = objc_msgSend_srlOnMSTMTuningParams(v306->_toneMapSmoothingResources, v251, v252, v253);
  objc_msgSend_setBuffer_offset_atIndex_(v30, v255, (uint64_t)v254, 0, 6);

  objc_msgSend_setComputePipelineState_(v30, v256, (uint64_t)v306->_shaders->_srlGlobalHistogram, v257);
  int64x2_t v314 = vdupq_n_s64(1uLL);
  int64x2_t v326 = v314;
  uint64_t v327 = 1;
  v325[0] = 64;
  v325[1] = v199;
  v325[2] = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v30, v258, (uint64_t)&v326, (uint64_t)v325);
  objc_msgSend_setComputePipelineState_(v30, v259, (uint64_t)v306->_shaders->_srlFaceHistogram, v260);
  v322[2] = 1;
  size_t v323 = v42;
  int64x2_t v324 = v314;
  v322[0] = 64;
  v322[1] = v199;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v30, v261, (uint64_t)&v323, (uint64_t)v322);
  objc_msgSend_setComputePipelineState_(v30, v262, (uint64_t)v306->_shaders->_srlCalcCoefficients, v263);
  int64x2_t v320 = v314;
  uint64_t v321 = 1;
  int64x2_t v318 = v314;
  uint64_t v319 = 1;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v30, v264, (uint64_t)&v320, (uint64_t)&v318);
  objc_msgSend_setComputePipelineState_(v30, v265, (uint64_t)v306->_shaders->_srlApply, v266);
  objc_msgSend_setImageblockWidth_height_(v30, v267, 32, 32);
  uint64_t v37 = v299;
  v317[0] = (unint64_t)objc_msgSend_width(v299, v268, v269, v270) >> 1;
  v317[1] = (unint64_t)objc_msgSend_height(v299, v271, v272, v273) >> 1;
  v317[2] = 1;
  int64x2_t v315 = vdupq_n_s64(0x10uLL);
  uint64_t v316 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v30, v274, (uint64_t)v317, (uint64_t)&v315);
  objc_msgSend_endEncoding(v30, v275, v276, v277);
  id v31 = v307;
  if (*MEMORY[0x263F00E10])
  {
    v281 = objc_msgSend_commandQueue(v179, v278, v279, v280);
    v285 = objc_msgSend_commandBuffer(v281, v282, v283, v284);

    objc_msgSend_setLabel_(v285, v286, @"KTRACE_MTLCMDBUF", v287);
    objc_msgSend_addCompletedHandler_(v285, v288, (uint64_t)&unk_270E34388, v289);
    objc_msgSend_commit(v285, v290, v291, v292);
    objc_msgSend_addCompletedHandler_(v179, v293, (uint64_t)&unk_270E343A8, v294);
  }
  objc_msgSend_commit(v179, v278, v279, v280);
  v306->_lastSRLStatusValue = v174 | 6;
  objc_storeStrong((id *)&v306->_lastSRLCommandBuffer, v179);
  int v295 = 0;
LABEL_68:
  id v28 = (id)v301;
LABEL_69:
  uint64_t v35 = v300;
LABEL_70:
  free(v308);
LABEL_71:

  return v295;
}

- (int)fetchTuningParametersFromPlist:(id)a3 ev0FrameMetadata:(const frameMetadata *)a4 toneMap:(id)a5 destinationMTLBuffer:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v15 = objc_msgSend_count(*((void **)v9 + 1), v12, v13, v14);
  if (objc_msgSend_length(v11, v16, v17, v18) < (unint64_t)(v15 << 7))
  {
    FigDebugAssert3();
    LODWORD(v15) = -12780;
  }
  else
  {
    id v19 = v11;
    uint64_t v23 = objc_msgSend_contents(v19, v20, v21, v22);
    float gain = a4->exposureParams.gain;
    float v25 = sub_262FCDA18(*((void *)v9 + 4), gain);
    int v26 = *((_DWORD *)v9 + 5);
    float v27 = sub_262FCDA18(*((void *)v9 + 5), gain);
    int v65 = *((_DWORD *)v9 + 6);
    float v28 = sub_262FCDA18(*((void *)v9 + 6), gain);
    int v29 = *((_DWORD *)v9 + 7);
    float v30 = sub_262FCDA18(*((void *)v9 + 7), gain);
    uint64_t v34 = objc_msgSend_width(v10, v31, v32, v33);
    uint64_t v38 = objc_msgSend_height(v10, v35, v36, v37);
    v39.f64[0] = a4->ROI.origin.x;
    float64_t v40 = sub_262FF6240(v39, a4->ROI.origin.y);
    v41.f64[0] = a4->ROI.size.width;
    double v44 = sub_262FF6240(v41, a4->ROI.size.height);
    if (v15)
    {
      uint64_t v45 = 0;
      v46.f32[0] = (float)(unint64_t)v34;
      v46.f32[1] = (float)(unint64_t)v38;
      __asm { FMOV            V2.2S, #1.0 }
      float32x2_t v52 = vdiv_f32(_D2, vdiv_f32(*(float32x2_t *)&v44, v46));
      float32x2_t v63 = vmul_f32(vdiv_f32(vneg_f32(*(float32x2_t *)&v40), v46), v52);
      float32x2_t v64 = v52;
      uint64_t v53 = (float *)(v23 + 120);
      float v61 = v30;
      float v62 = gain;
      do
      {
        objc_msgSend_objectAtIndexedSubscript_(*((void **)v9 + 1), v42, v45, v43);
        float32x2_t v54 = (uint64_t *)objc_claimAutoreleasedReturnValue();
        float v55 = powf(0.75, (float)(unint64_t)(v45 + 1));
        float v66 = v25 * v55;
        float v67 = v27 * v55;
        float v68 = v28 * v55;
        float v56 = powf(0.75, (float)(unint64_t)v45);
        float v57 = sub_262FCDA18(v54[1], v62);
        float v58 = sub_262FCDA18(v54[2], v62);
        float v59 = sub_262FCDA18(v54[3], v62);
        *((float32x2_t *)v53 - 15) = v63;
        *((float32x2_t *)v53 - 14) = v64;
        *(v53 - 26) = v61;
        *(v53 - 25) = v66;
        *((_DWORD *)v53 - 24) = v26;
        *(v53 - 23) = 1.0;
        *(v53 - 22) = v67;
        *((_DWORD *)v53 - 21) = v65;
        *(v53 - 20) = 1.0;
        *(v53 - 19) = v68;
        *((_DWORD *)v53 - 18) = v29;
        *(v53 - 17) = 1.0;
        *((void *)v53 - 8) = 0;
        *((float32x2_t *)v53 - 7) = v63;
        *((float32x2_t *)v53 - 6) = v64;
        *(v53 - 10) = v61;
        *(v53 - 9) = v25 * v56;
        *((_DWORD *)v53 - 8) = v26;
        *(v53 - 7) = v57;
        *(v53 - 6) = v27 * v56;
        *((_DWORD *)v53 - 5) = v65;
        *(v53 - 4) = v58;
        *(v53 - 3) = v28 * v56;
        *((_DWORD *)v53 - 2) = v29;
        *(v53 - 1) = v59;
        *(void *)uint64_t v53 = 0;
        v53 += 32;

        ++v45;
      }
      while (v45 != v15);
      LODWORD(v15) = 0;
    }
  }

  return v15;
}

- (int)performSmallFaceFix:(id)a3 faceLandmarks:(id)a4 faceLandmarkOrientation:(int)a5 tmPlist:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (id *)a6;
  uint64_t v12 = v11;
  if (!v9 || !v10 || !v11)
  {
    FigDebugAssert3();
    uint64_t v16 = 0;
LABEL_47:
    uint64_t v143 = 0;
    uint64_t v134 = 0;
    int v187 = -12780;
    goto LABEL_44;
  }
  uint64_t v16 = (float *)v11[4];
  if (!v16)
  {
    FigDebugAssert3();
    goto LABEL_47;
  }
  uint64_t v17 = objc_msgSend_width(v9, v13, v14, v15);
  uint64_t v21 = objc_msgSend_height(v9, v18, v19, v20);
  memset(&v227, 0, sizeof(v227));
  sub_262F8A92C(a5, (uint64_t)&v227);
  memset(&v226, 0, sizeof(v226));
  CGAffineTransformMakeTranslation(&t1, -0.5, -0.5);
  CGAffineTransformMakeScale(&t2, 1.0, -1.0);
  CGAffineTransformConcat(&v225, &t1, &t2);
  CGAffineTransformMakeTranslation(&v222, 0.5, 0.5);
  CGAffineTransformConcat(&v226, &v225, &v222);
  CGAffineTransform v220 = v227;
  memset(&v221, 0, sizeof(v221));
  CGAffineTransform v219 = v226;
  CGAffineTransformConcat(&v221, &v220, &v219);
  float v22 = v16[6];
  float v23 = v16[5];
  uint64_t v27 = objc_msgSend_count(v10, v24, v25, v26);
  objc_msgSend_sffDescriptorsBuffer(self->_toneMapSmoothingResources, v28, v29, v30);
  id v31 = objc_claimAutoreleasedReturnValue();
  uint64_t v198 = objc_msgSend_contents(v31, v32, v33, v34);

  objc_msgSend_sffNThreadGroupsBuffer(self->_toneMapSmoothingResources, v35, v36, v37);
  id v38 = objc_claimAutoreleasedReturnValue();
  uint64_t v197 = objc_msgSend_contents(v38, v39, v40, v41);

  if (!v27)
  {
    uint64_t v143 = 0;
    uint64_t v134 = 0;
    int v187 = 0;
    goto LABEL_44;
  }
  uint64_t v192 = v12;
  uint64_t v194 = (uint64_t)v9;
  int v193 = 0;
  unint64_t v44 = 0;
  uint64_t v45 = 0;
  v46.f32[0] = (float)(unint64_t)v17;
  v46.f32[1] = (float)(unint64_t)v21;
  float32x2_t v201 = v46;
  float v195 = (float)(v22 / v23) * (float)(v22 / v23);
  int32x2_t v196 = vdup_n_s32(0x7F7FFFFFu);
  do
  {
    if (v44 >= 0x20)
    {
      uint64_t v190 = v191;
      LODWORD(v189) = 0;
      FigDebugAssert3();
      id v62 = 0;
      float32x2_t v54 = 0;
    }
    else
    {
      int v47 = objc_msgSend_objectAtIndexedSubscript_(v10, v42, v45, v43);
      sub_262FF1D4C((uint64_t)v47, v48, v49, v50);
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        float32x2_t v54 = objc_msgSend_objectAtIndexedSubscript_(v10, v52, v45, v53);
        float v58 = objc_msgSend_landmarks(v54, v55, v56, v57);
        objc_msgSend_faceContour(v58, v59, v60, v61);
        id v62 = (id)objc_claimAutoreleasedReturnValue();

        if (v62)
        {
          unint64_t v66 = objc_msgSend_pointCount(v62, v63, v64, v65);
          if (v66 <= 2)
          {
            uint64_t v190 = v191;
            LODWORD(v189) = 0;
          }
          else
          {
            unint64_t v70 = v66;
            objc_msgSend_boundingBox(v54, v67, v68, v69);
            CGAffineTransform v220 = v221;
            CGRect v229 = CGRectApplyAffineTransform(v228, &v220);
            CGFloat x = v229.origin.x;
            CGFloat y = v229.origin.y;
            if (fmax(v229.size.width, v229.size.height) > v16[2]) {
              goto LABEL_21;
            }
            CGFloat width = v229.size.width;
            CGFloat height = v229.size.height;
            id v74 = v62;
            v78 = (double *)objc_msgSend_normalizedPoints(v74, v75, v76, v77);
            float64x2_t v79 = vaddq_f64(*(float64x2_t *)&v221.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v221.c, v78[1]), *(float64x2_t *)&v221.a, *v78));
            float64_t v80 = sub_262FF6240(v79, v79.f64[1]);
            id v81 = v74;
            uint64_t v85 = objc_msgSend_normalizedPoints(v81, v82, v83, v84);
            float64x2_t v86 = vaddq_f64(*(float64x2_t *)&v221.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v221.c, *(double *)(v85 + 16 * v70 - 8)), *(float64x2_t *)&v221.a, *(double *)(v85 + 16 * v70 - 16)));
            float32x2_t v87 = vmul_f32(vadd_f32(*(float32x2_t *)&v80, COERCE_FLOAT32X2_T(sub_262FF6240(v86, v86.f64[1]))), (float32x2_t)0x3F0000003F000000);
            v88.f64[0] = width;
            float64_t v89 = sub_262FF6240(v88, height);
            v90.f64[0] = x;
            uint64_t v91 = 0;
            float32x2_t v200 = vmul_f32(v201, vmla_f32(COERCE_FLOAT32X2_T(sub_262FF6240(v90, y)), *(float32x2_t *)&v89, v87));
            float32x2_t v92 = vneg_f32(v200);
            float32x4_t v212 = 0u;
            float32x2_t v93 = (float32x2_t)0x80000000800000;
            float32x2_t v94 = (float32x2_t)v196;
            float32x4_t v95 = 0uLL;
            v98.columns[1] = 0uLL;
            float32x4_t v96 = 0uLL;
            v98.columns[0].i32[3] = v209;
            v97.i32[3] = v211;
            v98.columns[2].i32[3] = v207;
            do
            {
              float32x4_t v206 = v96;
              float32x4_t v208 = (float32x4_t)v98.columns[1];
              float32x4_t v210 = v95;
              __int32 v204 = v98.columns[0].i32[3];
              __int32 v205 = v98.columns[2].i32[3];
              __int32 v203 = v97.i32[3];
              id v62 = v81;
              uint64_t v102 = objc_msgSend_normalizedPoints(v62, v99, v100, v101);
              float64x2_t v103 = vaddq_f64(*(float64x2_t *)&v221.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v221.c, *(double *)(v102 + v91 + 8)), *(float64x2_t *)&v221.a, *(double *)(v102 + v91)));
              float64_t v104 = sub_262FF6240(v103, v103.f64[1]);
              v105.f64[0] = width;
              float64_t v106 = sub_262FF6240(v105, height);
              v107.f64[0] = x;
              float32x2_t v108 = vmla_f32(v92, vmla_f32(COERCE_FLOAT32X2_T(sub_262FF6240(v107, y)), *(float32x2_t *)&v106, *(float32x2_t *)&v104), v201);
              *(float32x2_t *)v109.f32 = vmul_f32(v108, v108);
              *(float32x2_t *)&v109.u32[2] = vmul_lane_f32(v108, v108, 1);
              float32x4_t v97 = vmulq_n_f32(v109, v109.f32[0]);
              v98.columns[0] = (simd_float3)vmulq_lane_f32(v109, *(float32x2_t *)v109.f32, 1);
              v98.columns[2] = (simd_float3)vmulq_n_f32(v109, v109.f32[2]);
              v97.i32[3] = v203;
              v98.columns[0].i32[3] = v204;
              v98.columns[2].i32[3] = v205;
              float32x4_t v95 = vaddq_f32(v210, v97);
              v98.columns[1] = (simd_float3)vaddq_f32(v208, (float32x4_t)v98.columns[0]);
              float32x4_t v96 = vaddq_f32(v206, (float32x4_t)v98.columns[2]);
              float32x4_t v212 = vaddq_f32(v212, v109);
              float32x2_t v94 = vminnm_f32(v94, v108);
              float32x2_t v93 = vmaxnm_f32(v93, v108);
              v91 += 16;
              --v70;
            }
            while (v70);
            __int32 v207 = v205;
            __int32 v209 = v204;
            __int32 v211 = v203;
            v98.columns[0] = (simd_float3)v95;
            v98.columns[2] = (simd_float3)v96;
            simd_float3x3 v110 = __invert_f3(v98);
            v110.columns[0] = (simd_float3)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v110.columns[0], v212.f32[0]), (float32x4_t)v110.columns[1], *(float32x2_t *)v212.f32, 1), (float32x4_t)v110.columns[2], v212, 2);
            if (v110.columns[0].f32[0] <= 0.0)
            {
              uint64_t v190 = v191;
              LODWORD(v189) = 0;
            }
            else if (v110.columns[0].f32[1] <= 0.0)
            {
              uint64_t v190 = v191;
              LODWORD(v189) = 0;
            }
            else
            {
              v110.columns[2].f32[0] = vmuls_lane_f32(-v110.columns[0].f32[2], (float32x4_t)v110.columns[0], 2)
                                     + (float)((float)(v110.columns[0].f32[0] * 4.0) * v110.columns[0].f32[1]);
              __asm { FMOV            V4.2S, #4.0 }
              float32x2_t v116 = vmul_n_f32(vmul_n_f32(vmul_f32((float32x2_t)vrev64_s32(*(int32x2_t *)v110.columns[0].f32), _D4), v195), v110.columns[2].f32[0] * 4.0);
              if (v116.f32[0] <= 0.0)
              {
                uint64_t v190 = v191;
                LODWORD(v189) = 0;
              }
              else if (v116.f32[1] <= 0.0)
              {
                uint64_t v190 = v191;
                LODWORD(v189) = 0;
              }
              else
              {
                float32x2_t v117 = vrsqrte_f32(v116);
                float32x2_t v118 = vmul_f32(v117, vrsqrts_f32(v116, vmul_f32(v117, v117)));
                float32x2_t v119 = vmul_f32(v118, vrsqrts_f32(v116, vmul_f32(v118, v118)));
                float32x2_t v120 = vrecpe_f32(v119);
                float32x2_t v121 = vmul_f32(v120, vrecps_f32(v119, v120));
                v110.columns[2].f32[0] = v110.columns[2].f32[0] + v110.columns[2].f32[0];
                float32x2_t v122 = vdiv_f32(vmul_f32(v121, vrecps_f32(v119, v121)), (float32x2_t)vdup_lane_s32(*(int32x2_t *)v110.columns[2].f32, 0));
                float32x2_t v123 = vrndm_f32(vsub_f32(v200, v122));
                float32x2_t v124 = vsub_f32(v93, v94);
                *(float32x2_t *)v110.columns[2].f32 = vsub_f32(vrndp_f32(vadd_f32(v200, v122)), v123);
                float v125 = v16[3];
                if (v110.columns[2].f32[0] > (float)(v125 * v124.f32[0]))
                {
                  uint64_t v190 = v191;
                  LODWORD(v189) = 0;
                }
                else
                {
                  if (v110.columns[2].f32[1] <= vmuls_lane_f32(v125, v124, 1))
                  {
                    uint64_t v126 = (float32x2_t *)(v198 + 48 * v44);
                    v126[5].i32[0] = v110.columns[0].i32[2];
                    v126[3] = v200;
                    v126[4] = *(float32x2_t *)v110.columns[0].f32;
                    v126->f32[1] = v16[5];
                    v126->f32[0] = v16[6];
                    v126[1] = v123;
                    v126[2] = *(float32x2_t *)v110.columns[2].f32;
                    v126[5].i32[1] = vcvtd_n_u64_f64(v16[4] * 255.0 * 32.0, 5uLL);
                    float64x2_t v127 = (uint32x2_t *)(v197 + 12 * v44);
                    uint32x2_t *v127 = vshr_n_u32((uint32x2_t)vadd_s32((int32x2_t)vcvt_u32_f32(*(float32x2_t *)v110.columns[2].f32), (int32x2_t)0x1F0000001FLL), 5uLL);
                    v127[1].i32[0] = 1;
                    ++v44;
                    goto LABEL_21;
                  }
                  uint64_t v190 = v191;
                  LODWORD(v189) = 0;
                }
              }
            }
          }
        }
        else
        {
          uint64_t v190 = v191;
          LODWORD(v189) = 0;
        }
        FigDebugAssert3();
      }
      else
      {
        uint64_t v190 = v191;
        LODWORD(v189) = 0;
        FigDebugAssert3();
        id v62 = 0;
        float32x2_t v54 = 0;
        int v193 = -12780;
      }
    }
LABEL_21:

    ++v45;
  }
  while (v45 != v27);
  if (!v44)
  {
    uint64_t v143 = 0;
    uint64_t v134 = 0;
    id v9 = (id)v194;
    uint64_t v12 = v192;
    goto LABEL_42;
  }
  uint64_t v129 = self;
  uint64_t v130 = objc_msgSend_commandQueue(self->_metal, v42, v128, v43);
  uint64_t v134 = objc_msgSend_commandBuffer(v130, v131, v132, v133);

  if (!v134)
  {
    FigDebugAssert3();
    uint64_t v143 = 0;
LABEL_50:
    int v187 = -12786;
    id v9 = (id)v194;
    uint64_t v12 = v192;
    goto LABEL_44;
  }
  objc_msgSend_setLabel_(v134, v135, @"SFF", v136);
  uint64_t v140 = objc_msgSend_computeCommandEncoder(v134, v137, v138, v139);
  uint64_t v143 = v140;
  if (!v140)
  {
    FigDebugAssert3();
    goto LABEL_50;
  }
  objc_msgSend_setLabel_(v140, v141, @"SFF", v142);
  objc_msgSend_setComputePipelineState_(v143, v144, (uint64_t)self->_shaders->_sffTestFace, v145);
  uint64_t v149 = objc_msgSend_sffDescriptorsBuffer(self->_toneMapSmoothingResources, v146, v147, v148);
  objc_msgSend_setBuffer_offset_atIndex_(v143, v150, (uint64_t)v149, 0, 0);

  v154 = objc_msgSend_sffNThreadGroupsBuffer(self->_toneMapSmoothingResources, v151, v152, v153);
  objc_msgSend_setBuffer_offset_atIndex_(v143, v155, (uint64_t)v154, 0, 1);

  objc_msgSend_setTexture_atIndex_(v143, v156, v194, 0);
  uint64_t v216 = 1;
  unint64_t v217 = v44;
  int64x2_t v218 = vdupq_n_s64(1uLL);
  int64x2_t v215 = vdupq_n_s64(0x20uLL);
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v143, v157, (uint64_t)&v217, (uint64_t)&v215);
  objc_msgSend_setComputePipelineState_(v143, v158, (uint64_t)self->_shaders->_sffFillFace, v159);
  uint64_t v161 = 0;
  uint64_t v162 = 0;
  do
  {
    objc_msgSend_setBufferOffset_atIndex_(v143, v160, v161, 0, v189, v190);
    uint64_t v166 = objc_msgSend_sffNThreadGroupsBuffer(v129->_toneMapSmoothingResources, v163, v164, v165);
    int64x2_t v213 = vdupq_n_s64(0x20uLL);
    uint64_t v214 = 1;
    objc_msgSend_dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_(v143, v167, (uint64_t)v166, v162, &v213);

    uint64_t v129 = self;
    v162 += 12;
    v161 += 48;
    --v44;
  }
  while (v44);
  objc_msgSend_endEncoding(v143, v160, v168, v169);
  uint64_t v12 = v192;
  if (*MEMORY[0x263F00E10])
  {
    int v173 = objc_msgSend_commandQueue(v134, v170, v171, v172);
    uint64_t v177 = objc_msgSend_commandBuffer(v173, v174, v175, v176);

    objc_msgSend_setLabel_(v177, v178, @"KTRACE_MTLCMDBUF", v179);
    objc_msgSend_addCompletedHandler_(v177, v180, (uint64_t)&unk_270E343C8, v181);
    objc_msgSend_commit(v177, v182, v183, v184);
    objc_msgSend_addCompletedHandler_(v134, v185, (uint64_t)&unk_270E343E8, v186);
  }
  objc_msgSend_commit(v134, v170, v171, v172);
  id v9 = (id)v194;
LABEL_42:
  int v187 = v193;
LABEL_44:

  return v187;
}

- (int)performToneMapSmoothing:(id)a3 mask:(id)a4 skyMask:(id)a5 tmPlist:(id)a6 ev0FrameMetadata:(const frameMetadata *)a7 useMaskPyramid:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v333 = a4;
  id v332 = a5;
  uint64_t v15 = a6;
  toneMapSmoothingResources = self->_toneMapSmoothingResources;
  uint64_t v20 = objc_msgSend_width(toneMapSmoothingResources, v17, v18, v19);
  uint64_t v24 = objc_msgSend_height(self->_toneMapSmoothingResources, v21, v22, v23);
  if (objc_msgSend_allocateResourcesForWidth_height_useMaskPyramid_(toneMapSmoothingResources, v25, v20, v24, v8))
  {
    FigDebugAssert3();
    int v328 = FigSignalErrorAt();
    goto LABEL_50;
  }
  if (!v14 || !v15 || !a7 || objc_msgSend_pixelFormat(v14, v26, v27, v28) != 25)
  {
    FigDebugAssert3();
    int v328 = -12780;
    goto LABEL_50;
  }
  uint64_t v32 = v15[5];
  int v335 = *(_DWORD *)(v32 + 16);
  int v33 = objc_msgSend_count(*(void **)(v32 + 8), v29, v30, v31);
  uint64_t v37 = objc_msgSend_commandQueue(self->_metal, v34, v35, v36);
  uint64_t v41 = objc_msgSend_commandBuffer(v37, v38, v39, v40);

  if (!v41)
  {
    FigDebugAssert3();
LABEL_55:
    int v328 = -12786;
    goto LABEL_50;
  }
  objc_msgSend_setLabel_(v41, v42, @"MSTM", v43);
  int v47 = objc_msgSend_computeCommandEncoder(v41, v44, v45, v46);
  if (!v47)
  {
    FigDebugAssert3();

    goto LABEL_55;
  }
  uint64_t v50 = v47;
  float64x2_t v330 = v15;
  float64x2_t v331 = v14;
  objc_msgSend_setLabel_(v47, v48, @"MSTM Downsample", v49);
  if (v8)
  {
    objc_msgSend_setComputePipelineState_(v50, v51, (uint64_t)self->_shaders->_mstmCombineAndDownsampleMask, v52);
    objc_msgSend_setImageblockWidth_height_(v50, v53, 32, 32);
    uint64_t v57 = objc_msgSend_mstmTuningParams(self->_toneMapSmoothingResources, v54, v55, v56);
    objc_msgSend_setBuffer_offset_atIndex_(v50, v58, (uint64_t)v57, 0, 0);

    objc_msgSend_setTexture_atIndex_(v50, v59, (uint64_t)v333, 9);
    objc_msgSend_setTexture_atIndex_(v50, v60, (uint64_t)v332, 10);
    uint64_t v64 = objc_msgSend_masksPyramid(self->_toneMapSmoothingResources, v61, v62, v63);
    float v67 = objc_msgSend_objectAtIndexedSubscript_(v64, v65, 0, v66);
    objc_msgSend_setTexture_atIndex_(v50, v68, (uint64_t)v67, 12);

    unint64_t v70 = self->_toneMapSmoothingResources;
    if (v70) {
      objc_msgSend_computeSizeForLevel_xDivisor_yDivisor_(v70, v69, 0, 1, 1);
    }
    else {
      memset(v364, 0, 24);
    }
    int64x2_t v362 = vdupq_n_s64(0x20uLL);
    uint64_t v363 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v50, v69, (uint64_t)v364, (uint64_t)&v362);
    objc_msgSend_setComputePipelineState_(v50, v71, (uint64_t)self->_shaders->_mstmDownsampleMask, v72);
    objc_msgSend_setImageblockWidth_height_(v50, v73, 32, 32);
    if (v33 >= 2)
    {
      int64x2_t v336 = vdupq_n_s64(0x20uLL);
      for (uint64_t i = 1; i != v33; ++i)
      {
        uint64_t v76 = objc_msgSend_masksPyramid(self->_toneMapSmoothingResources, v51, v74, v52);
        float64x2_t v79 = objc_msgSend_objectAtIndexedSubscript_(v76, v77, i - 1, v78);
        objc_msgSend_setTexture_atIndex_(v50, v80, (uint64_t)v79, 11);

        uint64_t v84 = objc_msgSend_masksPyramid(self->_toneMapSmoothingResources, v81, v82, v83);
        float32x2_t v87 = objc_msgSend_objectAtIndexedSubscript_(v84, v85, i, v86);
        objc_msgSend_setTexture_atIndex_(v50, v88, (uint64_t)v87, 12);

        float64x2_t v90 = self->_toneMapSmoothingResources;
        if (v90) {
          objc_msgSend_computeSizeForLevel_xDivisor_yDivisor_(v90, v89, i, 1, 1);
        }
        else {
          memset(v361, 0, sizeof(v361));
        }
        int64x2_t v359 = v336;
        uint64_t v360 = 1;
        objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v50, v89, (uint64_t)v361, (uint64_t)&v359);
      }
    }
  }
  objc_msgSend_setComputePipelineState_(v50, v51, (uint64_t)self->_shaders->_mstmDownsampleInitial, v52);
  objc_msgSend_setImageblockWidth_height_(v50, v91, 32, 32);
  objc_msgSend_setTexture_atIndex_(v50, v92, (uint64_t)v331, 4);
  float32x4_t v96 = objc_msgSend_referencePyramidOdd(self->_toneMapSmoothingResources, v93, v94, v95);
  uint64_t v99 = objc_msgSend_objectAtIndexedSubscript_(v96, v97, 0, v98);
  objc_msgSend_setTexture_atIndex_(v50, v100, (uint64_t)v99, 0);

  float64_t v104 = objc_msgSend_referencePyramidEven(self->_toneMapSmoothingResources, v101, v102, v103);
  float64x2_t v107 = objc_msgSend_objectAtIndexedSubscript_(v104, v105, 0, v106);
  objc_msgSend_setTexture_atIndex_(v50, v108, (uint64_t)v107, 1);

  simd_float3x3 v110 = self->_toneMapSmoothingResources;
  long long v334 = v41;
  if (v110) {
    objc_msgSend_computeSizeForOddEvenLevel_xDivisor_yDivisor_(v110, v109, 0, 1, 2);
  }
  else {
    memset(v358, 0, sizeof(v358));
  }
  long long v356 = xmmword_263118240;
  uint64_t v357 = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v50, v109, (uint64_t)v358, (uint64_t)&v356);
  objc_msgSend_setComputePipelineState_(v50, v111, (uint64_t)self->_shaders->_mstmDownsampleSubsequent, v112);
  objc_msgSend_setImageblockWidth_height_(v50, v113, 32, 32);
  if (v33 >= 2)
  {
    for (uint64_t j = 1; j != v33; ++j)
    {
      float32x2_t v118 = objc_msgSend_referencePyramidOdd(self->_toneMapSmoothingResources, v114, v115, v116);
      float32x2_t v121 = objc_msgSend_objectAtIndexedSubscript_(v118, v119, j - 1, v120);
      objc_msgSend_setTexture_atIndex_(v50, v122, (uint64_t)v121, 5);

      uint64_t v126 = objc_msgSend_referencePyramidEven(self->_toneMapSmoothingResources, v123, v124, v125);
      uint64_t v129 = objc_msgSend_objectAtIndexedSubscript_(v126, v127, j - 1, v128);
      objc_msgSend_setTexture_atIndex_(v50, v130, (uint64_t)v129, 6);

      uint64_t v134 = objc_msgSend_referencePyramidOdd(self->_toneMapSmoothingResources, v131, v132, v133);
      uint64_t v137 = objc_msgSend_objectAtIndexedSubscript_(v134, v135, j, v136);
      objc_msgSend_setTexture_atIndex_(v50, v138, (uint64_t)v137, 0);

      uint64_t v142 = objc_msgSend_referencePyramidEven(self->_toneMapSmoothingResources, v139, v140, v141);
      uint64_t v145 = objc_msgSend_objectAtIndexedSubscript_(v142, v143, j, v144);
      objc_msgSend_setTexture_atIndex_(v50, v146, (uint64_t)v145, 1);

      uint64_t v148 = self->_toneMapSmoothingResources;
      if (v148) {
        objc_msgSend_computeSizeForOddEvenLevel_xDivisor_yDivisor_(v148, v147, j, 1, 2);
      }
      else {
        memset(v355, 0, sizeof(v355));
      }
      long long v353 = xmmword_263118240;
      uint64_t v354 = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v50, v147, (uint64_t)v355, (uint64_t)&v353);
    }
  }
  objc_msgSend_endEncoding(v50, v114, v115, v116);
  long long v351 = 0uLL;
  uint64_t v352 = 0;
  uint64_t v152 = self->_toneMapSmoothingResources;
  uint64_t v153 = v33 - 1;
  if (v152) {
    objc_msgSend_computeSizeForOddEvenLevel_xDivisor_yDivisor_(v152, v149, v153, 1, 1);
  }
  v154 = objc_msgSend_blitCommandEncoder(v41, v149, v150, v151);
  if (v154)
  {
    int v337 = v33;
    id v157 = v154;
    objc_msgSend_setLabel_(v154, v155, @"MSTM Blit", v156);
    uint64_t v161 = objc_msgSend_referencePyramidOdd(self->_toneMapSmoothingResources, v158, v159, v160);
    uint64_t v164 = objc_msgSend_objectAtIndexedSubscript_(v161, v162, v153, v163);
    memset(v350, 0, sizeof(v350));
    uint64_t v168 = objc_msgSend_outputPyramidOdd(self->_toneMapSmoothingResources, v165, v166, v167);
    uint64_t v171 = objc_msgSend_objectAtIndexedSubscript_(v168, v169, v153, v170);
    long long v347 = v351;
    uint64_t v348 = v352;
    memset(v349, 0, sizeof(v349));
    objc_msgSend_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_(v157, v172, (uint64_t)v164, 0, 0, v350, &v347, v171, 0, 0, v349);

    uint64_t v176 = objc_msgSend_referencePyramidEven(self->_toneMapSmoothingResources, v173, v174, v175);
    uint64_t v179 = objc_msgSend_objectAtIndexedSubscript_(v176, v177, v153, v178);
    memset(v346, 0, sizeof(v346));
    uint64_t v183 = objc_msgSend_outputPyramidEven(self->_toneMapSmoothingResources, v180, v181, v182);
    uint64_t v186 = objc_msgSend_objectAtIndexedSubscript_(v183, v184, v153, v185);
    memset(v345, 0, sizeof(v345));
    long long v347 = v351;
    uint64_t v348 = v352;
    objc_msgSend_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_(v157, v187, (uint64_t)v179, 0, 0, v346, &v347, v186, 0, 0, v345);

    uint64_t v188 = v334;
    objc_msgSend_endEncoding(v157, v189, v190, v191);
    float v195 = objc_msgSend_computeCommandEncoder(v334, v192, v193, v194);

    if (v195)
    {
      objc_msgSend_setLabel_(v195, v196, @"MSTM Solver", v197);
      objc_msgSend_setTexture_atIndex_(v195, v198, (uint64_t)v333, 9);
      objc_msgSend_setTexture_atIndex_(v195, v199, (uint64_t)v332, 10);
      __int32 v203 = objc_msgSend_mstmTuningParams(self->_toneMapSmoothingResources, v200, v201, v202);
      objc_msgSend_setBuffer_offset_atIndex_(v195, v204, (uint64_t)v203, 0, 0);

      if (v337 >= 1)
      {
        uint64_t v208 = v153;
        int64x2_t v338 = vdupq_n_s64(0x10uLL);
        if (!v8) {
          goto LABEL_40;
        }
LABEL_39:
        v250 = objc_msgSend_masksPyramid(self->_toneMapSmoothingResources, v205, v206, v207);
        uint64_t v253 = objc_msgSend_objectAtIndexedSubscript_(v250, v251, v208, v252);
        objc_msgSend_setTexture_atIndex_(v195, v254, (uint64_t)v253, 11);

        while (1)
        {
LABEL_40:
          objc_msgSend_setImageblockWidth_height_(v195, v205, 32, 32);
          v258 = objc_msgSend_referencePyramidOdd(self->_toneMapSmoothingResources, v255, v256, v257);
          v261 = objc_msgSend_objectAtIndexedSubscript_(v258, v259, v208, v260);
          objc_msgSend_setTexture_atIndex_(v195, v262, (uint64_t)v261, 0);

          uint64_t v266 = objc_msgSend_referencePyramidEven(self->_toneMapSmoothingResources, v263, v264, v265);
          uint64_t v269 = objc_msgSend_objectAtIndexedSubscript_(v266, v267, v208, v268);
          objc_msgSend_setTexture_atIndex_(v195, v270, (uint64_t)v269, 1);

          v274 = objc_msgSend_outputPyramidOdd(self->_toneMapSmoothingResources, v271, v272, v273);
          uint64_t v277 = objc_msgSend_objectAtIndexedSubscript_(v274, v275, v208, v276);
          objc_msgSend_setTexture_atIndex_(v195, v278, (uint64_t)v277, 2);

          v282 = objc_msgSend_outputPyramidEven(self->_toneMapSmoothingResources, v279, v280, v281);
          v285 = objc_msgSend_objectAtIndexedSubscript_(v282, v283, v208, v284);
          objc_msgSend_setTexture_atIndex_(v195, v286, (uint64_t)v285, 3);

          objc_msgSend_setBufferOffset_atIndex_(v195, v287, v208 << 7, 0);
          long long v347 = 0uLL;
          uint64_t v348 = 0;
          v288 = self->_toneMapSmoothingResources;
          if (v288) {
            objc_msgSend_computeSizeForOddEvenLevel_xDivisor_yDivisor_(v288, v205, v208, 2, 2);
          }
          int v289 = (2 << v208) * v335;
          if (v289 >= 1)
          {
            do
            {
              objc_msgSend_setComputePipelineState_(v195, v205, (uint64_t)self->_shaders->_mstmDiffusionEven, v207);
              long long v343 = v347;
              uint64_t v344 = v348;
              long long v341 = (__int128)v338;
              uint64_t v342 = 1;
              objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v195, v290, (uint64_t)&v343, (uint64_t)&v341);
              objc_msgSend_setComputePipelineState_(v195, v291, (uint64_t)self->_shaders->_mstmDiffusionOdd, v292);
              long long v343 = v347;
              uint64_t v344 = v348;
              long long v341 = (__int128)v338;
              uint64_t v342 = 1;
              objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v195, v293, (uint64_t)&v343, (uint64_t)&v341);
              --v289;
            }
            while (v289);
          }
          if (v208 <= 0) {
            break;
          }
          long long v343 = 0uLL;
          uint64_t v344 = 0;
          __int32 v209 = self->_toneMapSmoothingResources;
          if (v209) {
            objc_msgSend_computeSizeForOddEvenLevel_xDivisor_yDivisor_(v209, v205, (v208 - 1), 2, 2);
          }
          objc_msgSend_setComputePipelineState_(v195, v205, (uint64_t)self->_shaders->_mstmPyramidRemixIntermediate, v207);
          objc_msgSend_setImageblockWidth_height_(v195, v210, 32, 32);
          if (v8)
          {
            uint64_t v214 = objc_msgSend_masksPyramid(self->_toneMapSmoothingResources, v211, v212, v213);
            unint64_t v217 = objc_msgSend_objectAtIndexedSubscript_(v214, v215, (v208 - 1), v216);
            objc_msgSend_setTexture_atIndex_(v195, v218, (uint64_t)v217, 11);
          }
          CGAffineTransform v219 = objc_msgSend_referencePyramidOdd(self->_toneMapSmoothingResources, v211, v212, v213);
          CGAffineTransform v222 = objc_msgSend_objectAtIndexedSubscript_(v219, v220, (v208 - 1), v221);
          objc_msgSend_setTexture_atIndex_(v195, v223, (uint64_t)v222, 5);

          CGAffineTransform v227 = objc_msgSend_referencePyramidEven(self->_toneMapSmoothingResources, v224, v225, v226);
          uint64_t v230 = objc_msgSend_objectAtIndexedSubscript_(v227, v228, (v208 - 1), v229);
          objc_msgSend_setTexture_atIndex_(v195, v231, (uint64_t)v230, 6);

          uint64_t v235 = objc_msgSend_outputPyramidOdd(self->_toneMapSmoothingResources, v232, v233, v234);
          uint64_t v238 = objc_msgSend_objectAtIndexedSubscript_(v235, v236, (v208 - 1), v237);
          objc_msgSend_setTexture_atIndex_(v195, v239, (uint64_t)v238, 7);

          uint64_t v243 = objc_msgSend_outputPyramidEven(self->_toneMapSmoothingResources, v240, v241, v242);
          v246 = objc_msgSend_objectAtIndexedSubscript_(v243, v244, (v208 - 1), v245);
          objc_msgSend_setTexture_atIndex_(v195, v247, (uint64_t)v246, 8);

          objc_msgSend_setBufferOffset_atIndex_(v195, v248, (v208 << 7) | 0x40, 0);
          long long v341 = v343;
          uint64_t v342 = v344;
          int64x2_t v339 = vdupq_n_s64(0x10uLL);
          uint64_t v340 = 1;
          objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v195, v249, (uint64_t)&v341, (uint64_t)&v339);
          --v208;
          if (v8) {
            goto LABEL_39;
          }
        }
        uint64_t v188 = v334;
      }
      id v14 = v331;
      unint64_t v294 = (unint64_t)(objc_msgSend_width(v331, v205, v206, v207) + 3) >> 2;
      unint64_t v298 = (unint64_t)(objc_msgSend_height(v331, v295, v296, v297) + 1) >> 1;
      objc_msgSend_setComputePipelineState_(v195, v299, (uint64_t)self->_shaders->_mstmPyramidRemixFinal, v300);
      objc_msgSend_setTexture_atIndex_(v195, v301, (uint64_t)v331, 4);
      objc_msgSend_setImageblockWidth_height_(v195, v302, 32, 32);
      objc_msgSend_setBufferOffset_atIndex_(v195, v303, 64, 0);
      *(void *)&long long v347 = v294;
      *((void *)&v347 + 1) = v298;
      uint64_t v348 = 1;
      long long v343 = xmmword_263118250;
      uint64_t v344 = 1;
      objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v195, v304, (uint64_t)&v347, (uint64_t)&v343);
      objc_msgSend_endEncoding(v195, v305, v306, v307);
      if (*MEMORY[0x263F00E10])
      {
        float32x2_t v311 = objc_msgSend_commandQueue(v188, v308, v309, v310);
        int64x2_t v315 = objc_msgSend_commandBuffer(v311, v312, v313, v314);

        objc_msgSend_setLabel_(v315, v316, @"KTRACE_MTLCMDBUF", v317);
        objc_msgSend_addCompletedHandler_(v315, v318, (uint64_t)&unk_270E34408, v319);
        objc_msgSend_commit(v315, v320, v321, v322);
        objc_msgSend_addCompletedHandler_(v188, v323, (uint64_t)&unk_270E34428, v324);
      }
      objc_msgSend_commit(v188, v308, v309, v310);
      objc_msgSend_makeResourcesAliasable(self->_toneMapSmoothingResources, v325, v326, v327);

      int v328 = 0;
      goto LABEL_49;
    }
    FigDebugAssert3();
  }
  else
  {
    FigDebugAssert3();
  }
  int v328 = -12786;
  id v14 = v331;
LABEL_49:
  uint64_t v15 = v330;
LABEL_50:

  return v328;
}

- (uint64_t)runToneMapping:(double)a3 bilateralGrid:(double)a4 bilateralGridHomography:(float)a5 tmPlist:(double)a6 darkestFrameMetadata:(double)a7 ev0FrameMetadata:(double)a8 scaleInput:(uint64_t)a9 colorCorrection:(void *)a10 hasChromaBias:(void *)a11 quality:(void *)a12 inputIsLinear:(uint64_t)a13
{
  uint64_t v341 = *MEMORY[0x263EF8340];
  uint64_t v23 = a10;
  id v24 = a11;
  uint64_t v25 = a12;
  uint64_t v26 = (char *)v25;
  int v27 = 0;
  if (a15) {
    float v28 = 0.5;
  }
  else {
    float v28 = 0.0;
  }
  memset(__dst, 0, 400);
  BOOL v30 = a16 < 2 || a16 == 4;
  if (*((unsigned char *)v25 + 76)) {
    BOOL v31 = v30;
  }
  else {
    BOOL v31 = 0;
  }
  if ((a16 & 0xFFFFFFFB) != 0 || (int v32 = *((_DWORD *)v25 + 18)) == 0)
  {
    LODWORD(v33) = 0;
    uint64_t v34 = v24;
  }
  else
  {
    LODWORD(v33) = 0;
    uint64_t v34 = v24;
    if (v31)
    {
      uint64_t v33 = *((void *)v23 + 6);
      if (v33 && (uint64_t v33 = *((void *)v23 + 7)) != 0 && (uint64_t v33 = *((void *)v23 + 15)) != 0)
      {
        LODWORD(v33) = v32 == 2 && *((void *)v23 + 9) != 0;
        int v27 = 1;
      }
      else
      {
        int v27 = 0;
      }
    }
  }
  int v319 = v27;
  int v321 = v33;
  if (!*((unsigned char *)v25 + 77)) {
    goto LABEL_30;
  }
  BOOL v35 = 0;
  if (a16 > 4 || ((1 << a16) & 0x13) == 0) {
    goto LABEL_31;
  }
  if (*((void *)v23 + 6)) {
    BOOL v35 = *((void *)v23 + 15) != 0;
  }
  else {
LABEL_30:
  }
    BOOL v35 = 0;
LABEL_31:
  BOOL v302 = v35;
  float v36 = v25[22];
  uint64_t v40 = sub_262F8AB48(*((void **)v23 + 15));
  BOOL v299 = v31 && v36 > 0.0;
  if (v299) {
    int v42 = 2;
  }
  else {
    int v42 = 1;
  }
  if (v31) {
    int v43 = v42;
  }
  else {
    int v43 = 0;
  }
  BOOL v318 = v31;
  int v300 = v43;
  if (v26[79])
  {
    BOOL v44 = !*(void *)(a1 + 64) || !v31;
    if (a16 != 3 && !v44)
    {
      if (dword_26B429788)
      {
        uint64_t v45 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      uint64_t v51 = objc_msgSend_commandQueue(*(void **)(a1 + 8), v37, v38, v39);
      uint64_t v55 = objc_msgSend_commandBuffer(v51, v52, v53, v54);

      uint64_t v59 = objc_msgSend_blitCommandEncoder(v55, v56, v57, v58);
      uint64_t v297 = (void *)v59;
      if (!v59) {
        goto LABEL_106;
      }
      uint64_t v63 = (void *)v59;
      uint64_t v64 = *(void **)(*((void *)v23 + 16) + 32);
      uint64_t v65 = objc_msgSend_length(v64, v60, v61, v62);
      objc_msgSend_fillBuffer_range_value_(v63, v66, (uint64_t)v64, 0, v65, 0);
      objc_msgSend_endEncoding(v63, v67, v68, v69);
      objc_msgSend_commit(v55, v70, v71, v72);
      uint64_t v76 = objc_msgSend_device(*(void **)(a1 + 8), v73, v74, v75);
      uint64_t v78 = objc_msgSend_newBufferWithLength_options_(v76, v77, 399360, 0);
      float64x2_t v79 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v78;

      if (*(void *)(a1 + 72))
      {
        int v295 = v55;
        *(_WORD *)(a1 + 80) = objc_msgSend_width(*((void **)v23 + 1), v80, v81, v82);
        *(_WORD *)(a1 + 82) = objc_msgSend_height(*((void **)v23 + 1), v83, v84, v85);
        uint64_t v89 = objc_msgSend_width(*((void **)v23 + 2), v86, v87, v88);
        uint64_t v93 = objc_msgSend_height(*((void **)v23 + 2), v90, v91, v92);
        objc_msgSend_getLtmRoi_chromaTexHeight_ltmLut_isHalfResolution_((void *)a1, v94, v89, v93, a13 + 168, 0);
        double v291 = v95;
        uint64_t v99 = objc_msgSend_width(*((void **)v23 + 2), v96, v97, v98);
        uint64_t v103 = objc_msgSend_height(*((void **)v23 + 2), v100, v101, v102);
        objc_msgSend_getCcmRoi_chromaTexHeight_ccmLut_isHalfResolution_((void *)a1, v104, v99, v103, a13 + 168, 0);
        double v293 = v105;
        objc_msgSend_getExposureBiasFactor_inputIsLinear_((void *)a1, v106, a13, a17);
        int v108 = v107;
        uint64_t v316 = a13 + 222432;
        int v109 = *(_DWORD *)v316;
        uint64_t v110 = *((void *)v23 + 1);
        uint64_t v114 = objc_msgSend_stfParams(*(void **)(a1 + 64), v111, v112, v113);
        objc_msgSend_setInLuma_(v114, v115, v110, v116);

        BOOL v31 = v318;
        uint64_t v117 = *((void *)v23 + 2);
        float32x2_t v121 = objc_msgSend_stfParams(*(void **)(a1 + 64), v118, v119, v120);
        objc_msgSend_setInChroma_(v121, v122, v117, v123);

        uint64_t v124 = *((void *)v23 + 4);
        uint64_t v128 = objc_msgSend_stfParams(*(void **)(a1 + 64), v125, v126, v127);
        objc_msgSend_setOutLuma_(v128, v129, v124, v130);

        uint64_t v131 = *((void *)v23 + 5);
        float v135 = objc_msgSend_stfParams(*(void **)(a1 + 64), v132, v133, v134);
        objc_msgSend_setOutChroma_(v135, v136, v131, v137);

        uint64_t v141 = objc_msgSend_stfParams(*(void **)(a1 + 64), v138, v139, v140);
        objc_msgSend_setInputIsLinear_(v141, v142, a17, v143);

        uint64_t v147 = objc_msgSend_stfParams(*(void **)(a1 + 64), v144, v145, v146);
        LODWORD(v135) = objc_msgSend_conformsToProtocol_(v147, v148, (uint64_t)&unk_270E602F0, v149);

        if (v135)
        {
          uint64_t v153 = objc_msgSend_stfParams(*(void **)(a1 + 64), v150, v151, v152);
          objc_msgSend_setGtcRatioTex_(v153, v154, *(void *)(*((void *)v23 + 16) + 16), v155);
          objc_msgSend_setGtcFinalTex_(v153, v156, *(void *)(*((void *)v23 + 16) + 24), v157);
          objc_msgSend_setColorCorrection_(v153, v158, v159, v160, a6, a7, a8);
          if (*(_DWORD *)(*((void *)v26 + 3) + 36)) {
            uint64_t v163 = &OBJC_IVAR___ToneMappingBuffers_skinMask;
          }
          else {
            uint64_t v163 = &OBJC_IVAR___ToneMappingBuffers_skyMask;
          }
          objc_msgSend_setSkySkinMask_(v153, v161, *(void *)&v23[*v163], v162);
          objc_msgSend_setLtcLutData_(v153, v164, *(void *)(*((void *)v23 + 16) + 64), v165);
          uint64_t v168 = *((void *)v23 + 16);
          if (*(unsigned char *)(v168 + 57)) {
            objc_msgSend_setLtcTcrLutData_(v153, v166, *(void *)(v168 + 72), v167);
          }
          else {
            objc_msgSend_setLtcTcrLutData_(v153, v166, 0, v167);
          }
          objc_msgSend_setLtmRoi_(v153, v169, v170, v171, v291);
          uint64_t v174 = *((void *)v23 + 16);
          if (*(unsigned char *)(v174 + 56) && *(unsigned char *)(v316 + 577)) {
            objc_msgSend_setCcmLut_(v153, v172, *(void *)(v174 + 48), v173);
          }
          else {
            objc_msgSend_setCcmLut_(v153, v172, 0, v173);
          }
          objc_msgSend_setCcmRoi_(v153, v175, v176, v177, v293);
          objc_msgSend_setLumaHistogram_(v153, v178, *(void *)(*((void *)v23 + 16) + 32), v179);
          LODWORD(v180) = v108;
          objc_msgSend_setExposureBiasFactor_(v153, v181, v182, v183, v180);
          *(float *)&double v184 = a5;
          objc_msgSend_setScaleInput_(v153, v185, v186, v187, v184);
          *(float *)&double v188 = v36;
          objc_msgSend_setChromaGainAdjPower_(v153, v189, v190, v191, v188);
          *(float *)&double v192 = v28;
          objc_msgSend_setChromaBias_(v153, v193, v194, v195, v192);
          LODWORD(v196) = *((_DWORD *)v23 + 34);
          objc_msgSend_setInputLumaPedestal_(v153, v197, v198, v199, v196);
          LODWORD(v200) = v109;
          objc_msgSend_setLtmHardGain_(v153, v201, v202, v203, v200);
          objc_msgSend_setOutputLTCs_(v153, v204, *(void *)(a1 + 72), v205);
          objc_msgSend_setCurrentTuning_(v153, v206, *((void *)v26 + 10), v207);
        }
        uint64_t v208 = objc_msgSend_process(*(void **)(a1 + 64), v150, v151, v152);
        if (!v208)
        {
          *(unsigned char *)(a1 + 90) = 1;
          uint64_t v212 = objc_msgSend_stfParams(*(void **)(a1 + 64), v209, v210, v211);
          *(_DWORD *)(a1 + 92) = objc_msgSend_analyticsVersion(v212, v213, v214, v215);

          uint64_t v216 = *((void *)v23 + 16);
          if (*(unsigned char *)(v216 + 57)) {
            *(unsigned char *)(v216 + 57) = 0;
          }

          goto LABEL_65;
        }
        uint64_t TuningParametersFromPlist_ev0FrameMetadata_toneMap_destinationMTLBuffer = v208;
        uint64_t v55 = v295;
      }
      else
      {
LABEL_106:
        FigDebugAssert3();
        uint64_t TuningParametersFromPlist_ev0FrameMetadata_toneMap_destinationMTLBuffer = FigSignalErrorAt();
      }

      goto LABEL_100;
    }
  }
  *(float *)&double v41 = a5;
  if (objc_msgSend_performLTM_bilateralGrid_bilateralGridHomography_detailEnhance_darkestFrameMetadata_scaleInput_colorCorrection_outputMode_chromaGainAdjPower_inputIsLinear_chromaBias_isHalfResolution_((void *)a1, v37, (uint64_t)v23, (uint64_t)v34, a13, a2, a3, a4, *(double *)(v26 + 60), v41, a6, a7, a8, __PAIR64__(LODWORD(v28), LODWORD(v36))))goto LABEL_109; {
LABEL_65:
  }
  uint64_t v217 = *((void *)v23 + 4);
  char v218 = !v31;
  if (!v217) {
    char v218 = 1;
  }
  if ((v218 & 1) == 0)
  {
    uint64_t v219 = *((void *)v26 + 5);
    CGAffineTransform v220 = objc_msgSend_mstmTuningParams(*(void **)(a1 + 24), v46, v47, v48);
    uint64_t TuningParametersFromPlist_ev0FrameMetadata_toneMap_destinationMTLBuffer = objc_msgSend_fetchTuningParametersFromPlist_ev0FrameMetadata_toneMap_destinationMTLBuffer_((void *)a1, v221, v219, a14, v217, v220);

    if (TuningParametersFromPlist_ev0FrameMetadata_toneMap_destinationMTLBuffer
      || (v319 | v321) == 1
      && (uint64_t v225 = *((void *)v26 + 6),
          uint64_t v226 = *((void *)v23 + 4),
          objc_msgSend_srlOnMSTMTuningParams(*(void **)(a1 + 24), v46, v223, v224),
          CGAffineTransform v227 = objc_claimAutoreleasedReturnValue(),
          uint64_t TuningParametersFromPlist_ev0FrameMetadata_toneMap_destinationMTLBuffer = objc_msgSend_fetchTuningParametersFromPlist_ev0FrameMetadata_toneMap_destinationMTLBuffer_((void *)a1, v228, v225, a14, v226, v227), v227, TuningParametersFromPlist_ev0FrameMetadata_toneMap_destinationMTLBuffer))
    {
      FigDebugAssert3();
      goto LABEL_100;
    }
  }
  uint64_t v229 = *((void *)v23 + 4);
  int v230 = v319 ^ 1;
  if (!v229) {
    int v230 = 1;
  }
  int v231 = v321;
  if ((v230 | v321))
  {
    unsigned int v232 = a16;
  }
  else
  {
    if (dword_26B429788)
    {
      uint64_t v233 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v233, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      uint64_t v229 = *((void *)v23 + 4);
      BOOL v31 = v318;
    }
    BYTE4(v272) = a17;
    LODWORD(v272) = v300;
    *(float *)&double v50 = v28;
    if (objc_msgSend_performSubjectRelightingWithTonemap_luma_chroma_ltmChroma_validROI_skinMask_personMask_faceLandmarks_ev0FrameMetadata_ltmOutputMode_inputIsLinear_chromaBias_tmPlist_((void *)a1, v46, v229, *((void *)v23 + 1), *((void *)v23 + 2), *((void *)v23 + 5), *((void *)v23 + 6), *((void *)v23 + 7), *(double *)(a14 + 128), *(double *)(a14 + 136), *(double *)(a14 + 144), *(double *)(a14 + 152), v50, v40, a14, v272, v26))goto LABEL_109; {
    uint64_t v229 = *((void *)v23 + 4);
    }
    unsigned int v232 = a16;
    int v231 = v321;
  }
  if (v229) {
    int v234 = v231;
  }
  else {
    int v234 = 0;
  }
  if (v234 == 1)
  {
    float v322 = v28;
    uint64_t v306 = v40;
    v304 = v34;
    if (dword_26B429788)
    {
      uint64_t v235 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v235, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    float v274 = v36;
    memcpy(__dst, (const void *)(a14 + 223016), 0x190uLL);
    v308 = v26;
    uint64_t v236 = *((void *)v26 + 2);
    int v320 = *(_DWORD *)(v236 + 8);
    int v317 = *(_DWORD *)(v236 + 12);
    int v312 = *(_DWORD *)(v236 + 16);
    int v310 = *(_DWORD *)(v236 + 20);
    int v298 = *(_DWORD *)(v236 + 24);
    int v294 = *(_DWORD *)(v236 + 28);
    int v290 = *(_DWORD *)(v236 + 32);
    int v288 = *(_DWORD *)(v236 + 36);
    int v287 = *(_DWORD *)(v236 + 40);
    char v285 = *(unsigned char *)(v236 + 44);
    int v286 = *(_DWORD *)(v236 + 48);
    int v284 = *(_DWORD *)(v236 + 52);
    int v283 = *(_DWORD *)(v236 + 56);
    int v282 = *(_DWORD *)(v236 + 60);
    int v281 = *(_DWORD *)(v236 + 64);
    int v280 = *(_DWORD *)(v236 + 68);
    int v237 = *(_DWORD *)(v236 + 72);
    int v238 = *(_DWORD *)(v236 + 76);
    int v239 = *(_DWORD *)(v236 + 80);
    int v240 = *(_DWORD *)(v236 + 84);
    int v241 = *(_DWORD *)(v236 + 88);
    int v242 = *(_DWORD *)(v236 + 92);
    uint64_t v314 = *((void *)v23 + 4);
    uint64_t v301 = *((void *)v23 + 1);
    uint64_t v296 = *((void *)v23 + 2);
    uint64_t v292 = *((void *)v23 + 5);
    uint64_t v289 = *((void *)v23 + 6);
    uint64_t v279 = *((void *)v23 + 7);
    long long v278 = *(_OWORD *)(v23 + 72);
    uint64_t v276 = *((void *)v23 + 14);
    uint64_t v243 = *((void *)v23 + 12);
    uint64_t v277 = *((void *)v23 + 11);
    uint64_t v244 = *((void *)v23 + 13);
    unsigned int v245 = *(_DWORD *)(a14 + 76);
    int v246 = *(_DWORD *)(a14 + 116);
    int v247 = *(_DWORD *)(a14 + 160);
    uint64_t v248 = *(int *)(a14 + 223012);
    v249 = *(void **)(a1 + 32);
    uint64_t v253 = objc_msgSend_mstmTuningParams(*(void **)(a1 + 24), v250, v251, v252);
    uint64_t v275 = a1;
    uint64_t v257 = objc_msgSend_srlOnMSTMTuningParams(*(void **)(a1 + 24), v254, v255, v256);
    double v258 = *(double *)(a14 + 128);
    double v259 = *(double *)(a14 + 136);
    double v260 = *(double *)(a14 + 144);
    double v261 = *(double *)(a14 + 152);
    v323[0] = v320;
    v323[1] = v317;
    v323[2] = v312;
    v323[3] = v310;
    v323[4] = v298;
    v323[5] = v294;
    v323[6] = v290;
    v323[7] = v288;
    v323[8] = v287;
    char v324 = v285;
    __int16 v325 = 0;
    char v326 = 0;
    int v327 = v286;
    int v328 = v284;
    int v329 = v283;
    int v330 = v282;
    int v331 = v281;
    int v332 = v280;
    int v333 = v237;
    int v334 = v238;
    int v335 = v239;
    int v336 = v240;
    int v337 = v241;
    int v338 = v242;
    int v339 = 0;
    HIBYTE(v273) = a17;
    LOBYTE(v273) = v299;
    LODWORD(v262) = v246;
    float v28 = v322;
    *(float *)&double v263 = v322;
    LODWORD(v244) = objc_msgSend_runSubjectRelightingVersion_toneMap_luma_chroma_ltmChroma_skinMask_personMask_instanceMask0_instanceMask1_instanceMask2_instanceMask3_gammaCurve_instanceMaskConfidences_skinToneClassification_validROI_expBias_faceExpRatio_exifOrientation_numFacesISPDetected_faceBoundingBoxesFromISP_isChromaGainAdjusted_inputIsLinear_chromaBias_srlV2Plist_mstmParams_mstmSRLParams_blackPoint_playBackCurve_(v249, v264, @"v2", v314, v301, v296, v292, v289, v258, v259, v260, v261, COERCE_DOUBLE(__PAIR64__(DWORD1(v278), v245)), v262, v263, v279, v278, v277, v243,
                      0,
                      v276,
                      v244,
                      v247,
                      v248,
                      __dst,
                      v273,
                      v323,
                      v253,
                      v257,
                      0,
                      0);

    if (v244)
    {
      FigDebugAssert3();
      uint64_t TuningParametersFromPlist_ev0FrameMetadata_toneMap_destinationMTLBuffer = FigSignalErrorAt();
      uint64_t v34 = v304;
      uint64_t v26 = v308;
      uint64_t v40 = v306;
      goto LABEL_100;
    }
    uint64_t v229 = *((void *)v23 + 4);
    uint64_t v34 = v304;
    uint64_t v26 = v308;
    uint64_t v40 = v306;
    a1 = v275;
    unsigned int v232 = a16;
    BOOL v31 = v318;
    float v36 = v274;
  }
  if (v229)
  {
    if (v302
      && objc_msgSend_performSmallFaceFix_faceLandmarks_faceLandmarkOrientation_tmPlist_((void *)a1, v46, *((void *)v23 + 6), (uint64_t)v40, *(unsigned int *)(a14 + 160), v26)|| v31&& (objc_msgSend_performToneMapSmoothing_mask_skyMask_tmPlist_ev0FrameMetadata_useMaskPyramid_((void *)a1, v46, *((void *)v23 + 4), *((void *)v23 + 6), *((void *)v23 + 8), v26, a14, v232 != 4)|| (v36 <= 0.0 ? (v268 = 0) : (v268 = *((void *)v23 + 5)), *(float *)&double v266 = v36, *(float *)&v267 = v28,
           objc_msgSend_mstmsApplyLumaGain_inputLuma_inputChroma_outputChroma_localGainMap_chromaGainAdjPower_inputIsLinear_chromaBias_((void *)a1, v265, *((void *)v23 + 4), *((void *)v23 + 1), *((void *)v23 + 2), v268, *((void *)v23 + 3), a17, v266, v267)))|| v26[92]&& ((uint64_t v269 = *((void *)v23 + 4)) == 0|| (LODWORD(v270) = *((_DWORD *)v26 + 24), HIDWORD(v270) = 973279855, LODWORD(v49) = *((_DWORD *)v26 + 26), objc_msgSend_performBlackSubtractionWithBlackWhiteParams_maxContrastStrength_inOutTex_curves_((void *)a1, v46, v269,
                           *((void *)v23 + 16),
                           v270,
                           v49))))
    {
LABEL_109:
      FigDebugAssert3();
      uint64_t TuningParametersFromPlist_ev0FrameMetadata_toneMap_destinationMTLBuffer = FigSignalErrorAt();
      goto LABEL_100;
    }
  }
  uint64_t TuningParametersFromPlist_ev0FrameMetadata_toneMap_destinationMTLBuffer = 0;
LABEL_100:

  return TuningParametersFromPlist_ev0FrameMetadata_toneMap_destinationMTLBuffer;
}

- (void)reset
{
  objc_msgSend_reset(self->_subjectRelightV2, a2, v2, v3);
  lastSRLCommandBuffer = self->_lastSRLCommandBuffer;
  self->_lastSRLCommandBuffer = 0;

  self->_lastSRLStatusValue = 0;
  id v9 = objc_msgSend_stfParams(self->_stfProcessor, v6, v7, v8);
  objc_msgSend_reset(v9, v10, v11, v12);

  stfOutputLTCs = self->_stfOutputLTCs;
  self->_stfOutputLTCs = 0;

  self->_stfStillCorrectionStrength = 0;
  self->_stfStillApplied = 0;
  self->_stfStillAnalyticsVersion = 0;
  self->_SRLWaitCompleted = 0;
}

- (unsigned)getSRLStatus
{
  if (objc_msgSend_srlVersion(self->_toneMapSmoothingResources, a2, v2, v3) == 2) {
    self->_lastSRLStatusValue = objc_msgSend_getSRLStatus(self->_subjectRelightV2, v5, v6, v7);
  }
  lastSRLCommandBuffer = self->_lastSRLCommandBuffer;
  if (lastSRLCommandBuffer)
  {
    objc_msgSend_waitUntilCompleted(lastSRLCommandBuffer, v5, v6, v7);
    if (objc_msgSend_srlVersion(self->_toneMapSmoothingResources, v9, v10, v11) == 1)
    {
      objc_msgSend_srlCoeffsBuffer(self->_toneMapSmoothingResources, v12, v13, v14);
      id v15 = objc_claimAutoreleasedReturnValue();
      uint64_t v19 = (_DWORD *)objc_msgSend_contents(v15, v16, v17, v18);

      self->_lastSRLStatusValue |= *v19 << 16;
    }
    uint64_t v20 = self->_lastSRLCommandBuffer;
    self->_lastSRLCommandBuffer = 0;

    self->_SRLWaitCompleted = 1;
  }
  return self->_lastSRLStatusValue;
}

- (float)getExposureBiasFactor:(const frameMetadata *)a3 inputIsLinear:(BOOL)a4
{
  if (!a3->exposureParams.ltm_locked || !a3->exposureParams.ae_locked || a3->isEVMFrame || a4) {
    return 1.0;
  }
  else {
    return exp2f(-a3->exposureParams.exposure_bias);
  }
}

- (__n64)getCcmRoi:(int)a3 chromaTexHeight:(int)a4 ccmLut:(_WORD *)a5 isHalfResolution:(int)a6
{
  if (a6) {
    int v9 = 2;
  }
  else {
    int v9 = 1;
  }
  int v10 = (int)sub_262FBAD5C(a5) / v9;
  int v11 = (int)sub_262FBADB4(a5) / v9;
  int v12 = sub_262FBABDC(a5);
  int v13 = v11 * sub_262FBAC44(a5);
  int v14 = 2 * a3 - v10 * v12;
  if (2 * a3 < v10 * v12) {
    ++v14;
  }
  int v15 = v14 >> 1;
  if (v10 >= 0) {
    int v16 = v10;
  }
  else {
    int v16 = v10 + 1;
  }
  int v17 = v15 + (v16 >> 1);
  int v18 = 2 * a4 - v13;
  if (2 * a4 < v13) {
    ++v18;
  }
  int v19 = v18 >> 1;
  if (v11 >= 0) {
    int v20 = v11;
  }
  else {
    int v20 = v11 + 1;
  }
  result.n64_u32[0] = v17 / 2;
  result.n64_u32[1] = (v19 + (v20 >> 1)) / 2;
  return result;
}

- (__n64)getLtmRoi:(int)a3 chromaTexHeight:(int)a4 ltmLut:(_WORD *)a5 isHalfResolution:(int)a6
{
  if (a6) {
    int v9 = 2;
  }
  else {
    int v9 = 1;
  }
  int v10 = (int)sub_262FBAD5C(a5) / v9;
  int v11 = (int)sub_262FBADB4(a5) / v9;
  int v12 = sub_262FBABDC(a5);
  int v13 = v11 * sub_262FBAC44(a5);
  int v14 = 2 * a3 - v10 * v12;
  if (2 * a3 < v10 * v12) {
    ++v14;
  }
  int v15 = v14 >> 1;
  if (v10 >= 0) {
    int v16 = v10;
  }
  else {
    int v16 = v10 + 1;
  }
  int v17 = v15 + (v16 >> 1);
  int v18 = 2 * a4 - v13;
  if (2 * a4 < v13) {
    ++v18;
  }
  int v19 = v18 >> 1;
  if (v11 >= 0) {
    int v20 = v11;
  }
  else {
    int v20 = v11 + 1;
  }
  result.n64_u32[0] = v17 / 2;
  result.n64_u32[1] = (v19 + (v20 >> 1)) / 2;
  return result;
}

- (id)getSTFLTM_asNSData
{
  int v5 = objc_msgSend_stfParams(self->_stfProcessor, a2, v2, v3);
  objc_msgSend_lastSTFCommandBuffer(v5, v6, v7, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9) {
    goto LABEL_10;
  }
  int v13 = objc_msgSend_lastSTFCommandBuffer(v5, v10, v11, v12);
  objc_msgSend_waitUntilCompleted(v13, v14, v15, v16);

  id v17 = objc_alloc(MEMORY[0x263EFF990]);
  int v20 = objc_msgSend_initWithLength_(v17, v18, 399384, v19);
  if (!v20)
  {
    FigDebugAssert3();
    id v9 = 0;
    goto LABEL_11;
  }
  id v9 = v20;
  uint64_t v24 = objc_msgSend_mutableBytes(v9, v21, v22, v23);
  if (!v24
    || (uint64_t v28 = v24,
        *(_WORD *)(v24 + 22) = 65,
        *(void *)(v24 + 10) = 0,
        *(void *)uint64_t v24 = 0x2080003000400004,
        *(_WORD *)(v24 + 8) = 130,
        *(_WORD *)(v24 + 18) = self->_lastInputLumaTexWidth >> 6,
        *(_WORD *)(v24 + 20) = self->_lastInputLumaTexHeight / 0x30u,
        !objc_msgSend_contents(self->_stfOutputLTCs, v25, v26, v27)))
  {
LABEL_10:
    FigDebugAssert3();
LABEL_11:
    int v36 = FigSignalErrorAt();
    uint64_t v33 = 0;
    if (v36) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  int v32 = (const void *)objc_msgSend_contents(self->_stfOutputLTCs, v29, v30, v31);
  memcpy((void *)(v28 + 24), v32, 0x61800uLL);
LABEL_6:
  uint64_t v33 = v9;
LABEL_7:
  id v34 = v33;

  return v34;
}

- (int)getSTFStillCorrectionStrength:(BOOL)a3
{
  if (a3 || self->_SRLWaitCompleted)
  {
    int v5 = objc_msgSend_stfParams(self->_stfProcessor, a2, a3, v3);
    id v9 = objc_msgSend_lastSTFCommandBuffer(v5, v6, v7, v8);

    if (v9)
    {
      int v13 = objc_msgSend_lastSTFCommandBuffer(v5, v10, v11, v12);
      objc_msgSend_waitUntilCompleted(v13, v14, v15, v16);

      self->_stfStillCorrectionStrength = objc_msgSend_getCorrectionStrength(self->_stfProcessor, v17, v18, v19);
    }
    self->_SRLWaitCompleted = 0;
  }
  return self->_stfStillCorrectionStrength;
}

- (SidecarWriter)sidecarWriter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sidecarWriter);

  return (SidecarWriter *)WeakRetained;
}

- (void)setSidecarWriter:(id)a3
{
}

- (BOOL)enableSTF
{
  return self->_enableSTF;
}

- (void)setEnableSTF:(BOOL)a3
{
  self->_enableSTF = a3;
}

- (NSMutableDictionary)stfTuningParameters
{
  return self->_stfTuningParameters;
}

- (void)setStfTuningParameters:(id)a3
{
}

- (BOOL)stfStillApplied
{
  return self->_stfStillApplied;
}

- (void)setStfStillApplied:(BOOL)a3
{
  self->_stfStillApplied = a3;
}

- (unsigned)stfStillAnalyticsVersion
{
  return self->_stfStillAnalyticsVersion;
}

- (void)setStfStillAnalyticsVersion:(unsigned int)a3
{
  self->_stfStillAnalyticsVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stfTuningParameters, 0);
  objc_destroyWeak((id *)&self->_sidecarWriter);
  objc_storeStrong((id *)&self->_stfOutputLTCs, 0);
  objc_storeStrong((id *)&self->_stfProcessor, 0);
  objc_storeStrong((id *)&self->_lastSRLCommandBuffer, 0);
  objc_storeStrong((id *)&self->_subjectRelightV2, 0);
  objc_storeStrong((id *)&self->_toneMapSmoothingResources, 0);
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end