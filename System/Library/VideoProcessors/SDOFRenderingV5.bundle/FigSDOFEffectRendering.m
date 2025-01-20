@interface FigSDOFEffectRendering
- (BOOL)allocateResources;
- (BOOL)allocateResourcesForInputImageWidth:(unint64_t)a3 inputImageHeight:(unint64_t)a4 shiftMapWidth:(unint64_t)a5 shiftMapHeight:(unint64_t)a6;
- (BOOL)allocateResourcesForInputImageWidth:(unint64_t)a3 inputImageHeight:(unint64_t)a4 shiftMapWidth:(unint64_t)a5 shiftMapHeight:(unint64_t)a6 enableForegroundBlur:(BOOL)a7;
- (BOOL)sanityChecksSamplingWithImage:(__CVBuffer *)a3 inputFaceAdjustedBlurMap:(__CVBuffer *)a4 inputAlphaMask:(__CVBuffer *)a5 inputGainMap:(__CVBuffer *)a6 resultImage:(__CVBuffer *)a7;
- (FigMetalContext)metalContext;
- (FigSDOFEffectRendering)initWithCommandQueue:(id)a3;
- (MTLCommandQueue)metalCommandQueue;
- (NSArray)faceLandmarksArray;
- (int)_prewarm:(id)a3;
- (int)loadModelsWithTuningParameters:(id)a3;
- (int)prewarmWithTuningParameters:(id)a3;
- (int)runSamplingWithImage:(opaqueCMSampleBuffer *)a3 inputPixelBuffer:(__CVBuffer *)a4 inputFaceAdjustedBlurMap:(__CVBuffer *)a5 inputAlphaMask:(__CVBuffer *)a6 inputGainMap:(__CVBuffer *)a7 resultImage:(__CVBuffer *)a8;
- (int)setOptions:(id)a3;
- (int)setOptionsInternal:(id)a3 isPrewarm:(BOOL)a4;
- (int)unloadModels;
- (void)dealloc;
- (void)releaseResources;
- (void)setFaceLandmarksArray:(id)a3;
- (void)setMetalCommandQueue:(id)a3;
@end

@implementation FigSDOFEffectRendering

- (int)prewarmWithTuningParameters:(id)a3
{
  id v4 = a3;
  v5 = [FigSDOFEffectRendering alloc];
  v8 = objc_msgSend_initWithCommandQueue_(v5, v6, (uint64_t)self->_metalCommandQueue, v7);
  int v11 = objc_msgSend__prewarm_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (int)_prewarm:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v6 = v4;
  if (v4)
  {
    uint64_t v11 = *MEMORY[0x263F2C618];
    v12[0] = v4;
    uint64_t v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v5, (uint64_t)v12, (uint64_t)&v11, 1);
    objc_msgSend_setOptionsInternal_isPrewarm_(self, v8, (uint64_t)v7, 1);

    int v9 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v9 = FigSignalErrorAt();
  }

  return v9;
}

- (FigSDOFEffectRendering)initWithCommandQueue:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)FigSDOFEffectRendering;
  id v7 = [(FigSDOFEffectRendering *)&v42 init];
  if (!v7) {
    goto LABEL_10;
  }
  v8 = objc_msgSend_bundleWithPath_(MEMORY[0x263F086E0], v5, @"/System/Library/VideoProcessors/CCPortrait.bundle", v6);
  if (!v8) {
    goto LABEL_12;
  }
  id v9 = objc_alloc(MEMORY[0x263F2EE30]);
  uint64_t inited = objc_msgSend_initWithbundle_andOptionalCommandQueue_(v9, v10, (uint64_t)v8, (uint64_t)v4);
  v12 = (void *)*((void *)v7 + 9);
  *((void *)v7 + 9) = inited;

  v16 = (void *)*((void *)v7 + 9);
  if (!v16) {
    goto LABEL_12;
  }
  uint64_t v17 = objc_msgSend_commandQueue(v16, v13, v14, v15);
  v18 = (void *)*((void *)v7 + 13);
  *((void *)v7 + 13) = v17;

  v19 = (void *)*((void *)v7 + 11);
  *((void *)v7 + 11) = 0;

  v20 = [SimpleLensModel alloc];
  uint64_t v23 = objc_msgSend_initWithMetalContext_(v20, v21, *((void *)v7 + 9), v22);
  if (!v23)
  {
LABEL_12:
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_14:

    v40 = 0;
    goto LABEL_11;
  }
  v24 = (void *)v23;
  v25 = [ControlLogicForXHLRB alloc];
  v28 = objc_msgSend_initWithMetalContext_(v25, v26, *((void *)v7 + 9), v27);
  if (!v28) {
    goto LABEL_13;
  }
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2050000000;
  v29 = (void *)qword_26B431250;
  uint64_t v47 = qword_26B431250;
  if (!qword_26B431250)
  {
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = sub_263541C1C;
    v43[3] = &unk_2655D0698;
    v43[4] = &v44;
    sub_263541C1C((uint64_t)v43);
    v29 = (void *)v45[3];
  }
  v30 = v29;
  _Block_object_dispose(&v44, 8);
  id v31 = [v30 alloc];
  v35 = objc_msgSend_commandQueue(*((void **)v7 + 9), v32, v33, v34);
  uint64_t v38 = objc_msgSend_initWithMetalQueue_(v31, v36, (uint64_t)v35, v37);
  v39 = (void *)*((void *)v7 + 8);
  *((void *)v7 + 8) = v38;

  if (!*((void *)v7 + 8))
  {
LABEL_13:
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_14;
  }

LABEL_10:
  v40 = (FigSDOFEffectRendering *)v7;
LABEL_11:

  return v40;
}

- (int)setOptions:(id)a3
{
  return objc_msgSend_setOptionsInternal_isPrewarm_(self, a2, (uint64_t)a3, 0);
}

- (int)setOptionsInternal:(id)a3 isPrewarm:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  objc_storeStrong((id *)&self->_options, a3);
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v7, v8, *MEMORY[0x263F2C618], v9);
  if (v10)
  {
    uint64_t v11 = [FigSDOFRenderingTuningParameters alloc];
    uint64_t v14 = (FigSDOFRenderingTuningParameters *)objc_msgSend_initWithTuningDictionary_(v11, v12, (uint64_t)v10, v13);
    tuningParameters = self->_tuningParameters;
    self->_tuningParameters = v14;
  }
  else
  {
    tuningParameters = self->_tuningParameters;
    self->_tuningParameters = 0;
  }

  v18 = objc_msgSend_parameterSetForMode_(self->_tuningParameters, v16, 0, v17);
  if (v18)
  {
    uint64_t v22 = v18;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v47 = 0u;
    objc_msgSend_renderingConfig(v18, v19, v20, v21);
    int isPrewarm = objc_msgSend_setOptions_isPrewarm_(self->_applyBlurmap, v23, (uint64_t)&v47, v4);
    if (isPrewarm)
    {
      int v32 = isPrewarm;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      uint64_t v27 = objc_msgSend_parameterSetForMode_(self->_tuningParameters, v25, 1, v26);

      if (v27)
      {
        objc_msgSend_renderingConfig(v27, v28, v29, v30);
        long long v57 = v44;
        long long v58 = v45;
        long long v59 = v46;
        long long v53 = v40;
        long long v54 = v41;
        long long v55 = v42;
        long long v56 = v43;
        long long v49 = v36;
        long long v50 = v37;
        long long v51 = v38;
        long long v52 = v39;
        long long v47 = v34;
        long long v48 = v35;
        int v32 = objc_msgSend_setOptions_isPrewarm_(self->_applyBlurmap, v31, (uint64_t)&v47, v4);
      }
      else
      {
        int v32 = 0;
      }
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v32 = -12780;
  }

  return v32;
}

- (BOOL)allocateResources
{
  return MEMORY[0x270F9A6D0](self, sel_allocateResourcesForInputImageWidth_inputImageHeight_shiftMapWidth_shiftMapHeight_, 4032, 3024);
}

- (BOOL)allocateResourcesForInputImageWidth:(unint64_t)a3 inputImageHeight:(unint64_t)a4 shiftMapWidth:(unint64_t)a5 shiftMapHeight:(unint64_t)a6 enableForegroundBlur:(BOOL)a7
{
  BOOL v7 = a7;
  self->_inputImageWidth = a3;
  self->_inputImageHeight = a4;
  self->_inputShiftMapWidth = a5;
  self->_inputShiftMapHeight = a6;
  self->_upsampledShiftMapWidth = a3 >> 1;
  self->_upsampledShiftMapHeight = a4 >> 1;
  id v13 = sub_26353D270();
  SEL v14 = NSSelectorFromString(&cfstr_Blurmapsize.isa);
  uint64_t v17 = objc_msgSend_methodForSelector_(v13, v15, (uint64_t)v14, v16);
  if (v17)
  {
    uint64_t v21 = (double (*)(id, SEL, double, double))v17;
    id v22 = sub_26353D270();
    SEL v23 = NSSelectorFromString(&cfstr_Blurmapsize.isa);
    self->_upsampledShiftMapWidth = (unint64_t)v21(v22, v23, (double)a3, (double)a4);
    self->_upsampledShiftMapHeight = (unint64_t)v24;
  }
  objc_msgSend_sharedInstance(SDOFResources, v18, v19, v20);
  v25 = (SDOFResources *)objc_claimAutoreleasedReturnValue();
  resources = self->_resources;
  self->_resources = v25;

  int ResourcesUsingMetalContext_inputImageWidth_inputImageHeight_shiftMapWidth_shiftMapHeight_enableForegroundBlur = objc_msgSend_allocateResourcesUsingMetalContext_inputImageWidth_inputImageHeight_shiftMapWidth_shiftMapHeight_enableForegroundBlur_(self->_resources, v27, (uint64_t)self->_metalContext, a3, a4, a5, a6, v7);
  if (ResourcesUsingMetalContext_inputImageWidth_inputImageHeight_shiftMapWidth_shiftMapHeight_enableForegroundBlur)
  {
    fig_log_get_emitter();
    int v33 = ResourcesUsingMetalContext_inputImageWidth_inputImageHeight_shiftMapWidth_shiftMapHeight_enableForegroundBlur;
    FigDebugAssert3();
    objc_msgSend_releaseResources(self, v30, v31, v32, v33);
  }
  return ResourcesUsingMetalContext_inputImageWidth_inputImageHeight_shiftMapWidth_shiftMapHeight_enableForegroundBlur == 0;
}

- (BOOL)allocateResourcesForInputImageWidth:(unint64_t)a3 inputImageHeight:(unint64_t)a4 shiftMapWidth:(unint64_t)a5 shiftMapHeight:(unint64_t)a6
{
  return MEMORY[0x270F9A6D0](self, sel_allocateResourcesForInputImageWidth_inputImageHeight_shiftMapWidth_shiftMapHeight_enableForegroundBlur_, a3, a4);
}

- (void)dealloc
{
  objc_msgSend_releaseResources(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)FigSDOFEffectRendering;
  [(FigSDOFEffectRendering *)&v5 dealloc];
}

- (void)releaseResources
{
  objc_msgSend_deallocateResources(self->_resources, a2, v2, v3);
  resources = self->_resources;
  self->_resources = 0;
}

- (BOOL)sanityChecksSamplingWithImage:(__CVBuffer *)a3 inputFaceAdjustedBlurMap:(__CVBuffer *)a4 inputAlphaMask:(__CVBuffer *)a5 inputGainMap:(__CVBuffer *)a6 resultImage:(__CVBuffer *)a7
{
  if (a3)
  {
    if (a4)
    {
      if (a7)
      {
        unint64_t inputImageWidth = self->_inputImageWidth;
        unint64_t inputImageHeight = self->_inputImageHeight;
        if (CVPixelBufferGetWidth(a3) == inputImageWidth && CVPixelBufferGetHeight(a3) == inputImageHeight)
        {
          unint64_t v16 = self->_inputImageWidth;
          unint64_t v15 = self->_inputImageHeight;
          if (CVPixelBufferGetWidth(a7) == v16 && CVPixelBufferGetHeight(a7) == v15)
          {
            unint64_t upsampledShiftMapWidth = self->_upsampledShiftMapWidth;
            unint64_t upsampledShiftMapHeight = self->_upsampledShiftMapHeight;
            if (CVPixelBufferGetWidth(a4) == upsampledShiftMapWidth
              && CVPixelBufferGetHeight(a4) == upsampledShiftMapHeight
              && (sub_26353E074(a3) & 1) != 0
              && (sub_26353E074(a7) & 1) != 0
              && (CVPixelBufferGetPixelFormatType(a4) == 1278226488 || CVPixelBufferGetPixelFormatType(a4) == 843264056))
            {
              if (!a5
                || (unint64_t v20 = self->_upsampledShiftMapWidth,
                    unint64_t v19 = self->_upsampledShiftMapHeight,
                    CVPixelBufferGetWidth(a5) == v20)
                && CVPixelBufferGetHeight(a5) == v19
                && CVPixelBufferGetPixelFormatType(a5) == 1278226488)
              {
                if (!a6) {
                  return 1;
                }
                unint64_t v22 = self->_upsampledShiftMapWidth;
                unint64_t v21 = self->_upsampledShiftMapHeight;
                if (CVPixelBufferGetWidth(a6) == v22
                  && CVPixelBufferGetHeight(a6) == v21
                  && CVPixelBufferGetPixelFormatType(a6) == 1278226488)
                {
                  return 1;
                }
              }
            }
          }
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return 0;
}

- (int)runSamplingWithImage:(opaqueCMSampleBuffer *)a3 inputPixelBuffer:(__CVBuffer *)a4 inputFaceAdjustedBlurMap:(__CVBuffer *)a5 inputAlphaMask:(__CVBuffer *)a6 inputGainMap:(__CVBuffer *)a7 resultImage:(__CVBuffer *)a8
{
  if (!a3 || !a5 || !a8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v60 = FigSignalErrorAt();
    v190 = 0;
    v191 = 0;
    v186 = 0;
    v187 = 0;
    long long v57 = 0;
    long long v59 = 0;
    long long v53 = 0;
    long long v56 = 0;
    v188 = 0;
    v189 = 0;
    goto LABEL_40;
  }
  if (!self->_tuningParameters
    || (objc_msgSend_sanityChecksSamplingWithImage_inputFaceAdjustedBlurMap_inputAlphaMask_inputGainMap_resultImage_(self, a2, (uint64_t)a4, (uint64_t)a5, a6, a7, a8) & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v190 = 0;
    v191 = 0;
    v186 = 0;
    v187 = 0;
    long long v57 = 0;
    long long v59 = 0;
    long long v53 = 0;
    long long v56 = 0;
    v188 = 0;
    v189 = 0;
    int v60 = -12780;
    goto LABEL_40;
  }
  uint64_t v17 = objc_msgSend_parameterSetForMode_(self->_tuningParameters, v15, 0, v16);
  v189 = v17;
  v185 = a7;
  if (v17)
  {
    objc_msgSend_renderingConfig(v17, v18, v19, v20);
    int v21 = v193;
  }
  else
  {
    int v21 = 0;
  }
  unint64_t v22 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F2EC20], 0);
  v25 = objc_msgSend_objectForKeyedSubscript_(v22, v23, *MEMORY[0x263F2EBD0], v24);
  uint64_t v29 = v25;
  if (v25)
  {
    objc_msgSend_floatValue(v25, v26, v27, v28);
    if (v33 > 0.0)
    {
      objc_msgSend_floatValue(v29, v30, v31, v32);
      int v21 = v34;
    }
  }
  v187 = v29;
  SEL v35 = NSSelectorFromString(&cfstr_Getunifiedrend.isa);
  id v36 = sub_26354173C();
  long long v39 = (uint64_t (*)(id, SEL, void *))objc_msgSend_methodForSelector_(v36, v37, (uint64_t)v35, v38);
  id v40 = sub_26354173C();
  v188 = v22;
  long long v43 = objc_msgSend_objectForKeyedSubscript_(v22, v41, @"RenderingParameters", v42);
  int v44 = v39(v40, v35, v43);

  v191 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v45, (uint64_t)a4, 10, 17, 0);
  if (!v191)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v60 = FigSignalErrorAt();
    v190 = 0;
    v191 = 0;
LABEL_46:
    v186 = 0;
    long long v57 = 0;
    long long v59 = 0;
    long long v53 = 0;
LABEL_48:
    long long v56 = 0;
    goto LABEL_40;
  }
  v190 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v46, (uint64_t)a4, 30, 17, 1);
  if (!v190)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v60 = FigSignalErrorAt();
    v190 = 0;
    goto LABEL_46;
  }
  metalContext = self->_metalContext;
  if (v44) {
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(metalContext, v47, (uint64_t)a5, 30, 17, 0);
  }
  else {
  uint64_t v49 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(metalContext, v47, (uint64_t)a5, 10, 17, 0);
  }
  if (!v49)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v60 = FigSignalErrorAt();
    goto LABEL_46;
  }
  uint64_t v51 = v49;
  long long v53 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v50, (uint64_t)a8, 10, 22, 0);
  v186 = (void *)v51;
  if (!v53)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v60 = FigSignalErrorAt();
    long long v57 = 0;
    long long v59 = 0;
    goto LABEL_48;
  }
  long long v56 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v52, (uint64_t)a8, 30, 22, 1);
  if (!v56)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v60 = FigSignalErrorAt();
    long long v57 = 0;
    goto LABEL_53;
  }
  if (a6)
  {
    long long v57 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v54, (uint64_t)a6, 10, 17, 0);
    uint64_t v58 = (uint64_t)v185;
    if (v57)
    {
      if (v185) {
        goto LABEL_23;
      }
LABEL_26:
      long long v59 = 0;
      goto LABEL_27;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    int v60 = FigSignalErrorAt();
LABEL_53:
    long long v59 = 0;
    goto LABEL_40;
  }
  long long v57 = 0;
  uint64_t v58 = (uint64_t)v185;
  if (!v185) {
    goto LABEL_26;
  }
LABEL_23:
  long long v59 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v54, v58, 10, 17, 0);
  if (!v59)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v60 = FigSignalErrorAt();
    goto LABEL_40;
  }
LABEL_27:
  int v61 = objc_msgSend_activateResources(self->_resources, v54, v58, v55);
  v62 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F2EC58], 0);
  v66 = v62;
  if (v62)
  {
    objc_msgSend_floatValue(v62, v63, v64, v65);
    int v68 = v67;
  }
  else
  {
    int v68 = 0;
  }
  uint64_t v195 = 0;
  v196 = &v195;
  uint64_t v197 = 0x2050000000;
  v69 = (void *)qword_26A99E528;
  uint64_t v198 = qword_26A99E528;
  if (!qword_26A99E528)
  {
    v194[0] = MEMORY[0x263EF8330];
    v194[1] = 3221225472;
    v194[2] = sub_263541CCC;
    v194[3] = &unk_2655D0698;
    v194[4] = &v195;
    sub_263541CCC((uint64_t)v194);
    v69 = (void *)v196[3];
  }
  v70 = v69;
  _Block_object_dispose(&v195, 8);
  id v73 = objc_alloc_init(v70);
  if (v73)
  {
    v74 = objc_msgSend_objectForKeyedSubscript_(v188, v71, *MEMORY[0x263F2EBD8], v72);
    objc_msgSend_setMetadata_(v73, v75, (uint64_t)v74, v76);

    objc_msgSend_metadata(v73, v77, v78, v79);
    LODWORD(v80) = v21;
    objc_msgSend_setSimulatedAperture_(v73, v81, v82, v83, v80);
    if (v189)
    {
      objc_msgSend_renderingConfig(v189, v84, v85, v86);
      LODWORD(v87) = v192;
    }
    else
    {
      double v87 = 0.0;
    }
    objc_msgSend_setMaxBlur_(v73, v84, v85, v86, v87);
    LODWORD(v88) = v68;
    objc_msgSend_setLumaNoiseAmplitude_(v73, v89, v90, v91, v88);
    objc_msgSend_setInputBlurMap_(v73, v92, v51, v93);
    objc_msgSend_setInputAlpha_(v73, v94, (uint64_t)v57, v95);
    objc_msgSend_setInputGainMap_(v73, v96, (uint64_t)v59, v97);
    objc_msgSend_setInputImageLuma_(v73, v98, (uint64_t)v191, v99);
    objc_msgSend_setInputImageChroma_(v73, v100, (uint64_t)v190, v101);
    objc_msgSend_setOutputImageLuma_(v73, v102, (uint64_t)v53, v103);
    objc_msgSend_setOutputImageChroma_(v73, v104, (uint64_t)v56, v105);
    v109 = objc_msgSend_blurMapSmoothing_intermediate_tex(self->_resources, v106, v107, v108);
    v113 = objc_msgSend_intermediates(v73, v110, v111, v112);
    objc_msgSend_setInputIntermediateTex_(v113, v114, (uint64_t)v109, v115);

    v119 = objc_msgSend_blurMapSmoothing_result_tex(self->_resources, v116, v117, v118);
    v123 = objc_msgSend_intermediates(v73, v120, v121, v122);
    objc_msgSend_setInputSmoothedBlurmap_(v123, v124, (uint64_t)v119, v125);

    v129 = objc_msgSend_rendering_halfResRGBA1_tex(self->_resources, v126, v127, v128);
    v133 = objc_msgSend_intermediates(v73, v130, v131, v132);
    objc_msgSend_setInputHalfResTex1_(v133, v134, (uint64_t)v129, v135);

    v139 = objc_msgSend_rendering_halfResRGBA2_tex(self->_resources, v136, v137, v138);
    v143 = objc_msgSend_intermediates(v73, v140, v141, v142);
    objc_msgSend_setInputHalfResTex2_(v143, v144, (uint64_t)v139, v145);

    v149 = objc_msgSend_rendering_halfResRGBAsRGB1_texalias(self->_resources, v146, v147, v148);
    v153 = objc_msgSend_intermediates(v73, v150, v151, v152);
    objc_msgSend_setInputHalfResTex1sRGB_(v153, v154, (uint64_t)v149, v155);

    v159 = objc_msgSend_rendering_halfResRGBAsRGB2_texalias(self->_resources, v156, v157, v158);
    v163 = objc_msgSend_intermediates(v73, v160, v161, v162);
    objc_msgSend_setInputHalfResTex2sRGB_(v163, v164, (uint64_t)v159, v165);

    v169 = objc_msgSend_rendering_halfResRG_tex(self->_resources, v166, v167, v168);
    v173 = objc_msgSend_intermediates(v73, v170, v171, v172);
    objc_msgSend_setInputHalfResRGTex_(v173, v174, (uint64_t)v169, v175);

    int v60 = objc_msgSend_enqueueRenderingUsingArgs_(self->_applyBlurmap, v176, (uint64_t)v73, v177);
    if (v60)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      objc_msgSend_waitForSchedule(self->_metalContext, v178, v179, v180);
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v60 = -12786;
  }

  if (v61) {
    objc_msgSend_deactivateResources(self->_resources, v181, v182, v183);
  }
LABEL_40:

  return v60;
}

- (int)loadModelsWithTuningParameters:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    objc_super v5 = [FigSDOFRenderingTuningParameters alloc];
    v8 = objc_msgSend_initWithTuningDictionary_(v5, v6, (uint64_t)v4, v7);

    uint64_t v11 = objc_msgSend_parameterSetForMode_(v8, v9, 0, v10);
    unint64_t v15 = v11;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    if (v11) {
      objc_msgSend_hairnetConfig(v11, v12, v13, v14, v17, v18, v19, v20);
    }
    objc_msgSend_loadModels_(self->_applyBlurmap, v12, (uint64_t)&v17, v14);
  }
  return 0;
}

- (int)unloadModels
{
  objc_msgSend_unloadModels(self->_applyBlurmap, a2, v2, v3);
  return 0;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (FigMetalContext)metalContext
{
  return self->_metalContext;
}

- (NSArray)faceLandmarksArray
{
  return self->_faceLandmarksArray;
}

- (void)setFaceLandmarksArray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceLandmarksArray, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_applyBlurmap, 0);

  objc_storeStrong((id *)&self->_resources, 0);
}

@end