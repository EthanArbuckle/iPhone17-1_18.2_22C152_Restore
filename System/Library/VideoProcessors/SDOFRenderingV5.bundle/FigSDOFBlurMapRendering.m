@interface FigSDOFBlurMapRendering
- (BOOL)allocateResources;
- (BOOL)allocateResourcesForInputImageWidth:(unint64_t)a3 inputImageHeight:(unint64_t)a4 shiftMapWidth:(unint64_t)a5 shiftMapHeight:(unint64_t)a6;
- (BOOL)allocateResourcesForInputImageWidth:(unint64_t)a3 inputImageHeight:(unint64_t)a4 shiftMapWidth:(unint64_t)a5 shiftMapHeight:(unint64_t)a6 enableForegroundBlur:(BOOL)a7;
- (BOOL)detectFacesOnTele:(__CVBuffer *)a3 meta:(id)a4 to:(id *)a5 maxFacesCount:(int)a6 facesCount:(int *)a7;
- (BOOL)sanityChecksBlurMapWithImage:(__CVBuffer *)a3 shiftMap:(__CVBuffer *)a4 segmentationMask:(__CVBuffer *)a5 semanticSegmentationHairMask:(__CVBuffer *)a6 semanticSegmentationGlassesMask:(__CVBuffer *)a7 resultFaceAdjBlurMap:(__CVBuffer *)a8;
- (FigMetalContext)metalContext;
- (FigSDOFBlurMapRendering)initWithCommandQueue:(id)a3;
- (MTLCommandQueue)metalCommandQueue;
- (NSArray)faceLandmarksArray;
- (int)_prewarm:(id)a3;
- (int)computeBlurMapWithImage:(opaqueCMSampleBuffer *)a3 shiftMap:(__CVBuffer *)a4 personSegmentationMask:(__CVBuffer *)a5 hairSemanticSegmentationMask:(__CVBuffer *)a6 glassesSemanticSegmentationMask:(__CVBuffer *)a7 resultFaceAdjustedBlurMap:(__CVBuffer *)a8;
- (int)prewarmWithTuningParameters:(id)a3;
- (int)setOptions:(id)a3;
- (int)setOptionsInternal:(id)a3 isPrewarm:(BOOL)a4;
- (void)dealloc;
- (void)isShaderHarvesting:(id)a3;
- (void)releaseResources;
- (void)setFaceLandmarksArray:(id)a3;
- (void)setMetalCommandQueue:(id)a3;
@end

@implementation FigSDOFBlurMapRendering

- (void)isShaderHarvesting:(id)a3
{
  self->_isShaderHarvesting = objc_msgSend_BOOLValue(a3, a2, (uint64_t)a3, v3);
}

- (int)prewarmWithTuningParameters:(id)a3
{
  id v4 = a3;
  v5 = [FigSDOFBlurMapRendering alloc];
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

- (FigSDOFBlurMapRendering)initWithCommandQueue:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)FigSDOFBlurMapRendering;
  uint64_t v7 = [(FigSDOFBlurMapRendering *)&v31 init];
  if (v7)
  {
    v8 = objc_msgSend_bundleWithPath_(MEMORY[0x263F086E0], v5, @"/System/Library/VideoProcessors/CCPortrait.bundle", v6);
    if (!v8) {
      goto LABEL_8;
    }
    id v9 = objc_alloc(MEMORY[0x263F2EE30]);
    uint64_t inited = objc_msgSend_initWithbundle_andOptionalCommandQueue_(v9, v10, (uint64_t)v8, (uint64_t)v4);
    metalContext = v7->_metalContext;
    v7->_metalContext = (FigMetalContext *)inited;

    v16 = v7->_metalContext;
    if (!v16) {
      goto LABEL_8;
    }
    uint64_t v17 = objc_msgSend_commandQueue(v16, v13, v14, v15);
    metalCommandQueue = v7->_metalCommandQueue;
    v7->_metalCommandQueue = (MTLCommandQueue *)v17;

    tuningParameters = v7->_tuningParameters;
    v7->_tuningParameters = 0;

    id v20 = objc_alloc((Class)sub_26353D270());
    v24 = objc_msgSend_commandQueue(v7->_metalContext, v21, v22, v23);
    uint64_t v27 = objc_msgSend_initWithMetalQueue_(v20, v25, (uint64_t)v24, v26);
    makeBlurMap = v7->_makeBlurMap;
    v7->_makeBlurMap = (MakeBlurMap *)v27;

    if (!v7->_makeBlurMap)
    {
LABEL_8:
      fig_log_get_emitter();
      FigDebugAssert3();

      v29 = 0;
      goto LABEL_7;
    }
  }
  v29 = v7;
LABEL_7:

  return v29;
}

- (int)setOptions:(id)a3
{
  return objc_msgSend_setOptionsInternal_isPrewarm_(self, a2, (uint64_t)a3, 0);
}

- (int)setOptionsInternal:(id)a3 isPrewarm:(BOOL)a4
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_options, a3);
  id v9 = objc_msgSend_objectForKeyedSubscript_(v6, v7, *MEMORY[0x263F2C618], v8);
  if (v9)
  {
    uint64_t v10 = [FigSDOFRenderingTuningParameters alloc];
    v13 = (FigSDOFRenderingTuningParameters *)objc_msgSend_initWithTuningDictionary_(v10, v11, (uint64_t)v9, v12);
    tuningParameters = self->_tuningParameters;
    self->_tuningParameters = v13;
  }
  else
  {
    tuningParameters = self->_tuningParameters;
    self->_tuningParameters = 0;
  }

  uint64_t v17 = objc_msgSend_parameterSetForMode_(self->_tuningParameters, v15, 0, v16);
  if (v17)
  {
    v21 = v17;
    int v36 = 0;
    memset(v35, 0, sizeof(v35));
    objc_msgSend_disparityRefinementConfig(v17, v18, v19, v20);
    int isPrewarm = objc_msgSend_setOptions_isPrewarm_(self->_makeBlurMap, v22, (uint64_t)v35, 0);
    if (isPrewarm)
    {
      int v31 = isPrewarm;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      uint64_t v26 = objc_msgSend_parameterSetForMode_(self->_tuningParameters, v24, 1, v25);

      if (v26)
      {
        int v34 = 0;
        memset(v33, 0, sizeof(v33));
        objc_msgSend_disparityRefinementConfig(v26, v27, v28, v29);
        int v31 = objc_msgSend_setOptions_isPrewarm_(self->_makeBlurMap, v30, (uint64_t)v33, 0);
        if (v31)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
        }
      }
      else
      {
        int v31 = 0;
      }
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v31 = -12780;
  }

  return v31;
}

- (BOOL)allocateResources
{
  return MEMORY[0x270F9A6D0](self, sel_allocateResourcesForInputImageWidth_inputImageHeight_shiftMapWidth_shiftMapHeight_, 4032, 3024);
}

- (BOOL)allocateResourcesForInputImageWidth:(unint64_t)a3 inputImageHeight:(unint64_t)a4 shiftMapWidth:(unint64_t)a5 shiftMapHeight:(unint64_t)a6 enableForegroundBlur:(BOOL)a7
{
  if (self->_metalContext)
  {
    BOOL v9 = a7;
    self->_inputImageWidth = a3;
    self->_inputImageHeight = a4;
    self->_inputShiftMapWidth = a5;
    self->_inputShiftMapHeight = a6;
    if (self->_makeBlurMap)
    {
      uint64_t v14 = objc_opt_class();
      objc_msgSend_blurMapSize_(v14, v15, v16, v17, (double)self->_inputImageWidth, (double)self->_inputImageHeight);
    }
    else
    {
      double v18 = (double)(a3 >> 1);
      double v19 = (double)(a4 >> 1);
    }
    self->_upsampledShiftMapWidth = (unint64_t)v18;
    self->_upsampledShiftMapHeight = (unint64_t)v19;
    objc_msgSend_sharedInstance(SDOFResources, a2, a3, a4);
    uint64_t v20 = (SDOFResources *)objc_claimAutoreleasedReturnValue();
    resources = self->_resources;
    self->_resources = v20;

    int ResourcesUsingMetalContext_inputImageWidth_inputImageHeight_shiftMapWidth_shiftMapHeight_enableForegroundBlur = objc_msgSend_allocateResourcesUsingMetalContext_inputImageWidth_inputImageHeight_shiftMapWidth_shiftMapHeight_enableForegroundBlur_(self->_resources, v22, (uint64_t)self->_metalContext, a3, a4, a5, a6, v9);
    if (!ResourcesUsingMetalContext_inputImageWidth_inputImageHeight_shiftMapWidth_shiftMapHeight_enableForegroundBlur)
    {
      int ResourcesUsingMetalContext_inputImageWidth_inputImageHeight_shiftMapWidth_shiftMapHeight_enableForegroundBlur = objc_msgSend_allocateResourcesForShiftMapWidth_shiftMapHeight_(self->_makeBlurMap, v24, self->_upsampledShiftMapWidth, self->_upsampledShiftMapHeight);
      if (!ResourcesUsingMetalContext_inputImageWidth_inputImageHeight_shiftMapWidth_shiftMapHeight_enableForegroundBlur) {
        return 1;
      }
    }
    int v26 = ResourcesUsingMetalContext_inputImageWidth_inputImageHeight_shiftMapWidth_shiftMapHeight_enableForegroundBlur;
    fig_log_get_emitter();
    uint64_t v31 = v7;
    int v30 = v26;
  }
  else
  {
    fig_log_get_emitter();
    uint64_t v31 = v7;
    int v30 = 0;
  }
  FigDebugAssert3();
  objc_msgSend_releaseResources(self, v27, v28, v29, v30, v31);
  return 0;
}

- (BOOL)allocateResourcesForInputImageWidth:(unint64_t)a3 inputImageHeight:(unint64_t)a4 shiftMapWidth:(unint64_t)a5 shiftMapHeight:(unint64_t)a6
{
  return MEMORY[0x270F9A6D0](self, sel_allocateResourcesForInputImageWidth_inputImageHeight_shiftMapWidth_shiftMapHeight_enableForegroundBlur_, a3, a4);
}

- (void)dealloc
{
  objc_msgSend_releaseResources(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)FigSDOFBlurMapRendering;
  [(FigSDOFBlurMapRendering *)&v5 dealloc];
}

- (void)releaseResources
{
  objc_msgSend_deallocateResources(self->_makeBlurMap, a2, v2, v3);
  objc_msgSend_deallocateResources(self->_resources, v5, v6, v7);
  resources = self->_resources;
  self->_resources = 0;
}

- (BOOL)sanityChecksBlurMapWithImage:(__CVBuffer *)a3 shiftMap:(__CVBuffer *)a4 segmentationMask:(__CVBuffer *)a5 semanticSegmentationHairMask:(__CVBuffer *)a6 semanticSegmentationGlassesMask:(__CVBuffer *)a7 resultFaceAdjBlurMap:(__CVBuffer *)a8
{
  if (a3)
  {
    if (a4)
    {
      if (a8)
      {
        unint64_t inputImageWidth = self->_inputImageWidth;
        unint64_t inputImageHeight = self->_inputImageHeight;
        if (CVPixelBufferGetWidth(a3) == inputImageWidth && CVPixelBufferGetHeight(a3) == inputImageHeight)
        {
          if ((unint64_t inputShiftMapWidth = self->_inputShiftMapWidth,
                unint64_t inputShiftMapHeight = self->_inputShiftMapHeight,
                CVPixelBufferGetWidth(a4) == inputShiftMapWidth)
            && CVPixelBufferGetHeight(a4) == inputShiftMapHeight
            || (unint64_t v20 = self->_upsampledShiftMapWidth,
                unint64_t v19 = self->_upsampledShiftMapHeight,
                CVPixelBufferGetWidth(a4) == v20)
            && CVPixelBufferGetHeight(a4) == v19)
          {
            unint64_t upsampledShiftMapWidth = self->_upsampledShiftMapWidth;
            unint64_t upsampledShiftMapHeight = self->_upsampledShiftMapHeight;
            if (CVPixelBufferGetWidth(a8) == upsampledShiftMapWidth
              && CVPixelBufferGetHeight(a8) == upsampledShiftMapHeight
              && (sub_26353E074(a3) & 1) != 0
              && (CVPixelBufferGetPixelFormatType(a8) == 1278226488 || CVPixelBufferGetPixelFormatType(a8) == 843264056)
              && (CVPixelBufferGetPixelFormatType(a4) == 1278226536 || CVPixelBufferGetPixelFormatType(a4) == 1751411059))
            {
              if (!a5
                || (unint64_t v24 = self->_upsampledShiftMapWidth,
                    unint64_t v23 = self->_upsampledShiftMapHeight,
                    CVPixelBufferGetWidth(a5) == v24)
                && CVPixelBufferGetHeight(a5) == v23
                && CVPixelBufferGetPixelFormatType(a5) == 1278226488)
              {
                if (!a6
                  || (unint64_t v26 = self->_upsampledShiftMapWidth,
                      unint64_t v25 = self->_upsampledShiftMapHeight,
                      CVPixelBufferGetWidth(a6) == v26)
                  && CVPixelBufferGetHeight(a6) == v25
                  && CVPixelBufferGetPixelFormatType(a6) == 1278226488)
                {
                  if (!a7) {
                    return 1;
                  }
                  unint64_t v28 = self->_upsampledShiftMapWidth;
                  unint64_t v27 = self->_upsampledShiftMapHeight;
                  if (CVPixelBufferGetWidth(a7) == v28
                    && CVPixelBufferGetHeight(a7) == v27
                    && CVPixelBufferGetPixelFormatType(a7) == 1278226488)
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
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return 0;
}

- (BOOL)detectFacesOnTele:(__CVBuffer *)a3 meta:(id)a4 to:(id *)a5 maxFacesCount:(int)a6 facesCount:(int *)a7
{
  id v12 = a4;
  uint64_t v15 = v12;
  if (!a3 || !v12 || !a5 || !a7)
  {
    fig_log_get_emitter();
    goto LABEL_11;
  }
  int v18 = 1;
  unsigned int v19 = 1;
  if (!sub_263541D24(v12, (char *)&v18, v13, v14) || (sub_263541D7C(v18, &v19) & 1) == 0)
  {
    fig_log_get_emitter();
LABEL_11:
    FigDebugAssert3();
    BOOL v16 = 0;
    goto LABEL_12;
  }
  if (!sub_263541DA0(self->_faceLandmarksArray, v19, a6, (uint64_t)a5, a7))
  {
    *a7 = 0;
    fig_log_get_emitter();
    goto LABEL_11;
  }
  BOOL v16 = 1;
LABEL_12:

  return v16;
}

- (int)computeBlurMapWithImage:(opaqueCMSampleBuffer *)a3 shiftMap:(__CVBuffer *)a4 personSegmentationMask:(__CVBuffer *)a5 hairSemanticSegmentationMask:(__CVBuffer *)a6 glassesSemanticSegmentationMask:(__CVBuffer *)a7 resultFaceAdjustedBlurMap:(__CVBuffer *)a8
{
  v291[28] = *MEMORY[0x263EF8340];
  size.float width = 0.0;
  size.height = 0.0;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a8);
  v271 = self;
  objc_msgSend_clearDiagnostics(self->_diagnostics, v16, v17, v18);
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  v268 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F2C558], 0);
  unint64_t v20 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F2EC20], 0);
  v269 = v20;
  if (!v20)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v266 = 0;
    v267 = 0;
    v264 = 0;
    v265 = 0;
    v262 = 0;
    v263 = 0;
    v259 = 0;
    v260 = 0;
LABEL_68:
    value = 0;
    id v76 = 0;
    v270 = 0;
    id v90 = 0;
    v261 = 0;
    CFDictionaryRef dict = 0;
LABEL_70:
    int v74 = -12780;
    goto LABEL_63;
  }
  v259 = objc_msgSend_objectForKeyedSubscript_(v20, v21, *MEMORY[0x263F2EBE0], v22);
  if (objc_msgSend_length(v259, v23, v24, v25) != 48)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_67:
    v266 = 0;
    v267 = 0;
    v264 = 0;
    v265 = 0;
    v262 = 0;
    v263 = 0;
    v260 = 0;
    goto LABEL_68;
  }
  memset(v278, 0, sizeof(v278));
  objc_msgSend_getBytes_length_(v259, v26, (uint64_t)v278, 48);
  objc_msgSend_objectForKeyedSubscript_(v269, v27, *MEMORY[0x263F2EBE8], v28);
  CFDictionaryRef v29 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CFDictionaryRef dict = v29;
  if (!v29)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_67;
  }
  if (!CGSizeMakeWithDictionaryRepresentation(v29, &size)) {
    goto LABEL_69;
  }
  v32 = objc_msgSend_objectForKeyedSubscript_(v268, v30, @"inputScale", v31);

  if (v32)
  {
    v35 = objc_msgSend_objectForKeyedSubscript_(v268, v33, @"inputScale", v34);
    objc_msgSend_floatValue(v35, v36, v37, v38);
    float v40 = v39;
  }
  else
  {
    float v40 = 1.0;
  }
  if (!v271->_tuningParameters
    || (objc_msgSend_sanityChecksBlurMapWithImage_shiftMap_segmentationMask_semanticSegmentationHairMask_semanticSegmentationGlassesMask_resultFaceAdjBlurMap_(v271, v33, (uint64_t)ImageBuffer, (uint64_t)a4, a5, a6, a7, a8) & 1) == 0|| !v271->_options)
  {
LABEL_69:
    fig_log_get_emitter();
    FigDebugAssert3();
    v266 = 0;
    v267 = 0;
    v264 = 0;
    v265 = 0;
    v262 = 0;
    v263 = 0;
    v260 = 0;
    v261 = 0;
    value = 0;
    id v76 = 0;
    v270 = 0;
    id v90 = 0;
    goto LABEL_70;
  }
  CGSize v41 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  rect.origin = (CGPoint)*MEMORY[0x263F001A8];
  rect.CGSize size = v41;
  CFDictionaryRef v42 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F2EC50], 0);
  CGRectMakeWithDictionaryRepresentation(v42, &rect);
  int v276 = 0;
  v44 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  int v47 = objc_msgSend_detectFacesOnTele_meta_to_maxFacesCount_facesCount_(v271, v43, (uint64_t)ImageBuffer, (uint64_t)v268, v290, 4, &v276);
  if (*v44 == 1) {
    kdebug_trace();
  }
  if (v47)
  {
    uint64_t v48 = v276;
  }
  else
  {
    uint64_t v48 = 0;
    int v276 = 0;
  }
  v289[0] = &unk_270E9B150;
  v49 = objc_msgSend_numberWithInt_(NSNumber, v45, v48, v46);
  v289[1] = v49;
  value = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v50, (uint64_t)v289, 2);

  CMSetAttachment(a3, (CFStringRef)*MEMORY[0x263F2EC40], value, 1u);
  v53 = objc_msgSend_parameterSetForMode_(v271->_tuningParameters, v51, 0, v52);
  v270 = v53;
  if (v53)
  {
    objc_msgSend_simpleLensModelConfig(v53, v54, v55, v56);
    int v57 = v275;
  }
  else
  {
    int v57 = 0;
  }
  v58 = objc_msgSend_objectForKeyedSubscript_(v269, v54, *MEMORY[0x263F2EBD0], v56);
  v261 = v58;
  if (v58)
  {
    objc_msgSend_floatValue(v58, v59, v60, v61);
    if (v64 > 0.0)
    {
      objc_msgSend_floatValue(v261, v59, v62, v63);
      int v57 = v65;
    }
  }
  v267 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(v271->_metalContext, v59, (uint64_t)ImageBuffer, 10, 17, 0);
  if (!v267)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v74 = FigSignalErrorAt();
    v267 = 0;
LABEL_73:
    v266 = 0;
LABEL_75:
    v265 = 0;
LABEL_77:
    v262 = 0;
    v263 = 0;
    v260 = 0;
    v264 = 0;
LABEL_84:
    id v76 = 0;
    id v90 = 0;
    goto LABEL_63;
  }
  v266 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(v271->_metalContext, v66, (uint64_t)ImageBuffer, 30, 17, 1);
  if (!v266)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v74 = FigSignalErrorAt();
    goto LABEL_73;
  }
  v265 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(v271->_metalContext, v67, (uint64_t)a4, 25, 17, 0);
  if (!v265)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v74 = FigSignalErrorAt();
    goto LABEL_75;
  }
  metalContext = v271->_metalContext;
  if (PixelFormatType == 843264056) {
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(metalContext, v68, (uint64_t)a8, 30, 23, 0);
  }
  else {
  v264 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(metalContext, v68, (uint64_t)a8, 10, 23, 0);
  }
  if (!v264)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v74 = FigSignalErrorAt();
    goto LABEL_77;
  }
  if (a5)
  {
    v263 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(v271->_metalContext, v70, (uint64_t)a5, 10, 17, 0);
    v73 = v271;
    if (!v263)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v74 = FigSignalErrorAt();
      v263 = 0;
      goto LABEL_82;
    }
    if (a6)
    {
LABEL_34:
      v262 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(v73->_metalContext, v70, (uint64_t)a6, 10, 17, 0);
      v73 = v271;
      if (v262)
      {
        if (a7) {
          goto LABEL_36;
        }
LABEL_40:
        v260 = 0;
        goto LABEL_41;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
      int v74 = FigSignalErrorAt();
LABEL_82:
      v262 = 0;
      goto LABEL_83;
    }
  }
  else
  {
    v263 = 0;
    v73 = v271;
    if (a6) {
      goto LABEL_34;
    }
  }
  v262 = 0;
  if (!a7) {
    goto LABEL_40;
  }
LABEL_36:
  v260 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(v73->_metalContext, v70, (uint64_t)a7, 10, 17, 0);
  v73 = v271;
  if (!v260)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v74 = FigSignalErrorAt();
LABEL_83:
    v260 = 0;
    goto LABEL_84;
  }
LABEL_41:
  int v256 = objc_msgSend_activateResources(v73->_resources, v70, v71, v72);
  float v75 = *(float *)&v278[0].width;
  id v76 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v276 >= 1)
  {
    uint64_t v77 = 0;
    v78 = (double *)v291;
    do
    {
      uint64_t v285 = 0;
      v286 = &v285;
      uint64_t v287 = 0x2050000000;
      v79 = (void *)qword_26A99E510;
      uint64_t v288 = qword_26A99E510;
      if (!qword_26A99E510)
      {
        uint64_t v280 = MEMORY[0x263EF8330];
        uint64_t v281 = 3221225472;
        v282 = sub_263541B6C;
        v283 = &unk_2655D0698;
        v284 = &v285;
        sub_263541B6C((uint64_t)&v280);
        v79 = (void *)v286[3];
      }
      v80 = v79;
      _Block_object_dispose(&v285, 8);
      id v81 = [v80 alloc];
      v85 = objc_msgSend_initWithCenterPos_leftEyeCenterPos_rightEyeCenterPos_chinCenterPos_(v81, v82, v83, v84, *(v78 - 4), *(v78 - 3), *(v78 - 2), *(v78 - 1), *v78, v78[1], v78[2], v78[3]);
      objc_msgSend_addObject_(v76, v86, (uint64_t)v85, v87);

      ++v77;
      v78 += 8;
    }
    while (v77 < v276);
  }
  uint64_t v285 = 0;
  v286 = &v285;
  uint64_t v287 = 0x2050000000;
  v88 = (void *)qword_26A99E518;
  uint64_t v288 = qword_26A99E518;
  if (!qword_26A99E518)
  {
    uint64_t v280 = MEMORY[0x263EF8330];
    uint64_t v281 = 3221225472;
    v282 = sub_263541BC4;
    v283 = &unk_2655D0698;
    v284 = &v285;
    sub_263541BC4((uint64_t)&v280);
    v88 = (void *)v286[3];
  }
  v89 = v88;
  _Block_object_dispose(&v285, 8);
  id v90 = objc_alloc_init(v89);
  v93 = objc_msgSend_objectForKeyedSubscript_(v269, v91, *MEMORY[0x263F2EBD8], v92);
  objc_msgSend_setMetadata_(v90, v94, (uint64_t)v93, v95);

  objc_msgSend_metadata(v90, v96, v97, v98);
  LODWORD(v99) = v57;
  objc_msgSend_setSimulatedAperture_(v90, v100, v101, v102, v99);
  HIDWORD(v103) = HIDWORD(size.width);
  float width = size.width;
  *(float *)&double v103 = v75 / width;
  objc_msgSend_setNormalizedFocalLength_(v90, v105, v106, v107, v103);
  if (v270)
  {
    objc_msgSend_simpleLensModelConfig(v270, v108, v109, v110);
    LODWORD(v111) = v274;
  }
  else
  {
    double v111 = 0.0;
  }
  objc_msgSend_setMaxBlur_(v90, v108, v109, v110, v111);
  *(float *)&double v112 = v40;
  objc_msgSend_setInputScale_(v90, v113, v114, v115, v112);
  objc_msgSend_setFocusWindow_(v90, v116, v117, v118, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
  objc_msgSend_setFacePoints_(v90, v119, (uint64_t)v76, v120);
  objc_msgSend_setInputImageLuma_(v90, v121, (uint64_t)v267, v122);
  objc_msgSend_setInputImageChroma_(v90, v123, (uint64_t)v266, v124);
  objc_msgSend_setInputShiftMap_(v90, v125, (uint64_t)v265, v126);
  objc_msgSend_setInputSegmentation_(v90, v127, (uint64_t)v263, v128);
  objc_msgSend_setInputHair_(v90, v129, (uint64_t)v262, v130);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend_setInputGlasses_(v90, v131, (uint64_t)v260, v132);
  }
  objc_msgSend_setOutputBlurMap_(v90, v131, (uint64_t)v264, v132);
  v136 = objc_msgSend_faceMask_adjBlurmap_tex(v271->_resources, v133, v134, v135);
  v140 = objc_msgSend_intermediates(v90, v137, v138, v139);
  objc_msgSend_setInputFaceMaskAdjBlurTex_(v140, v141, (uint64_t)v136, v142);

  v146 = objc_msgSend_disparityRefinement_weightsX_tex(v271->_resources, v143, v144, v145);
  v150 = objc_msgSend_intermediates(v90, v147, v148, v149);
  objc_msgSend_setInputWeightsXTex_(v150, v151, (uint64_t)v146, v152);

  v156 = objc_msgSend_disparityRefinement_weightsY_tex(v271->_resources, v153, v154, v155);
  v160 = objc_msgSend_intermediates(v90, v157, v158, v159);
  objc_msgSend_setInputWeightsYTex_(v160, v161, (uint64_t)v156, v162);

  v166 = objc_msgSend_disparityRefinement_preproc_tex(v271->_resources, v163, v164, v165);
  v170 = objc_msgSend_intermediates(v90, v167, v168, v169);
  objc_msgSend_setInputPreprocTex_(v170, v171, (uint64_t)v166, v172);

  v176 = objc_msgSend_disparityRefinement_sampledD_tex(v271->_resources, v173, v174, v175);
  v180 = objc_msgSend_intermediates(v90, v177, v178, v179);
  objc_msgSend_setInputSampledDTex_(v180, v181, (uint64_t)v176, v182);

  v186 = objc_msgSend_disparityRefinement_blurmap_tex(v271->_resources, v183, v184, v185);
  v190 = objc_msgSend_intermediates(v90, v187, v188, v189);
  objc_msgSend_setInputDisparityRefineBlurTex_(v190, v191, (uint64_t)v186, v192);

  v196 = objc_msgSend_blurMapRefinement_alphaMaskDelta(v271->_resources, v193, v194, v195);
  v200 = objc_msgSend_intermediates(v90, v197, v198, v199);
  objc_msgSend_setInputAlphaMaskDeltaTex_(v200, v201, (uint64_t)v196, v202);

  v206 = objc_msgSend_blurMapRefinement_hairMaskDelta(v271->_resources, v203, v204, v205);
  v210 = objc_msgSend_intermediates(v90, v207, v208, v209);
  objc_msgSend_setInputHairMaskDeltaTex_(v210, v211, (uint64_t)v206, v212);

  v216 = objc_msgSend_blurMapRefinement_intermediate(v271->_resources, v213, v214, v215);
  v220 = objc_msgSend_intermediates(v90, v217, v218, v219);
  objc_msgSend_setInputBlurRefineIntermediateTex_(v220, v221, (uint64_t)v216, v222);

  int v74 = objc_msgSend_enqueueBlurMapGenerationUsingArgs_(v271->_makeBlurMap, v223, (uint64_t)v90, v224);
  if (v74)
  {
    fig_log_get_emitter();
    uint64_t v254 = v255;
    int v253 = v74;
    FigDebugAssert3();
    if ((v256 & 1) == 0) {
      goto LABEL_63;
    }
  }
  else
  {
    LODWORD(v228) = v57;
    v229 = (const void *)objc_msgSend_numberWithFloat_(NSNumber, v225, v226, v227, v228);
    CMSetAttachment(a3, (CFStringRef)*MEMORY[0x263F2EC38], v229, 1u);
    v233 = NSNumber;
    if (v270)
    {
      objc_msgSend_simpleLensModelConfig(v270, v230, v231, v232);
      LODWORD(v234) = v273;
    }
    else
    {
      double v234 = 0.0;
    }
    v235 = (const void *)objc_msgSend_numberWithFloat_(v233, v230, v231, v232, v234);
    CMSetAttachment(a3, (CFStringRef)*MEMORY[0x263F2EC68], v235, 1u);
    v239 = NSNumber;
    if (v270)
    {
      objc_msgSend_simpleLensModelConfig(v270, v236, v237, v238);
      LODWORD(v240) = v272;
    }
    else
    {
      double v240 = 0.0;
    }
    v241 = (const void *)objc_msgSend_numberWithFloat_(v239, v236, v237, v238, v240);
    CMSetAttachment(a3, (CFStringRef)*MEMORY[0x263F2EC60], v241, 1u);
    if (!v256)
    {
      int v74 = 0;
      goto LABEL_63;
    }
  }
  objc_msgSend_deactivateResources(v271->_resources, v242, v243, v244, v253, v254);
LABEL_63:
  diagnostics = v271->_diagnostics;
  id v246 = v268;
  v250 = objc_msgSend_createDiagnosticsDictionary(diagnostics, v247, v248, v249);
  objc_msgSend_setObject_forKeyedSubscript_(v246, v251, (uint64_t)v250, @"SDOF");

  return v74;
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
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);

  objc_storeStrong((id *)&self->_makeBlurMap, 0);
}

@end