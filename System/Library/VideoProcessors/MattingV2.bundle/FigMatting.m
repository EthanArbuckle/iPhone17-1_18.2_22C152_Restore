@interface FigMatting
+ (id)FigMattingOutputToShortString:(unsigned int)a3;
- ($55C9923F75B8441B2F861846195B697A)config;
- (BOOL)outputEnabled:(unsigned int)a3;
- (CGRect)syntheticFocusRectangle;
- (FigMatting)init;
- (FigMatting)initWithCommandQueue:(id)a3;
- (NSArray)faceLandmarks;
- (NSArray)faceSegments;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)options;
- (NSDictionary)tuningParameters;
- (__CVBuffer)imagePixelBuffer;
- (__CVBuffer)inputDepthPixelBuffer;
- (__CVBuffer)inputDisparityPixelBuffer;
- (__CVBuffer)inputSegmentationPixelBuffer;
- (__CVBuffer)inputSemanticsGlassesPixelBuffer;
- (__CVBuffer)inputSemanticsHairPixelBuffer;
- (__CVBuffer)inputSemanticsSkinPixelBuffer;
- (__CVBuffer)inputSemanticsSkyPixelBuffer;
- (__CVBuffer)inputSemanticsTeethPixelBuffer;
- (__CVBuffer)outputMattePixelBuffer;
- (__CVBuffer)outputRefinedDisparityPixelBuffer;
- (__CVBuffer)outputSemanticsGlassesPixelBuffer;
- (__CVBuffer)outputSemanticsHairPixelBuffer;
- (__CVBuffer)outputSemanticsSkinPixelBuffer;
- (__CVBuffer)outputSemanticsSkyPixelBuffer;
- (__CVBuffer)outputSemanticsTeethPixelBuffer;
- (id)_createTextureOfSize:(CGSize)a3 withFormat:(unint64_t)a4;
- (id)enabledOutputArray;
- (int)_allocateResources;
- (int)_compileShaders;
- (int)_prewarmMPSKernels;
- (int)exifOrientation;
- (int)finishProcessing;
- (int)finishScheduling;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)prewarmWithTuningParameters:(id)a3;
- (int)process;
- (int)processFocalPlaneAndSolverOnly;
- (int)purgeResources;
- (int)resetState;
- (int)setup;
- (int)validateAndBindInputsAndOutputs;
- (void)dealloc;
- (void)encodeAddTexturesToCommandBuffer:(id)a3 sourceTextureA:(id)a4 sourceTextureB:(id)a5 destinationTexture:(id)a6 thresholdBeginValue:(float)a7 thresholdEndValue:(float)a8;
- (void)encodeComposeRGBAGuideToCommandBuffer:(id)a3 rgbTexture:(id)a4 alphaTexture:(id)a5 destinationTexture:(id)a6;
- (void)encodeComposeRGBAGuideToCommandBuffer:(id)a3 rgbTexture:(id)a4 alphaTexture:(id)a5 destinationTexture:(id)a6 rgbWeight:(float)a7;
- (void)encodePreprocessSkinToCommandBuffer:(id)a3 inputSkinTexture:(id)a4 faceNonSkinTextures:(id)a5 outputSkinTexture:(id)a6;
- (void)isShaderHarvesting:(id)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setConfig:(id *)a3;
- (void)setExifOrientation:(int)a3;
- (void)setFaceLandmarks:(id)a3;
- (void)setFaceSegments:(id)a3;
- (void)setImagePixelBuffer:(__CVBuffer *)a3;
- (void)setInputDepthPixelBuffer:(__CVBuffer *)a3;
- (void)setInputDisparityPixelBuffer:(__CVBuffer *)a3;
- (void)setInputSegmentationPixelBuffer:(__CVBuffer *)a3;
- (void)setInputSemanticsGlassesPixelBuffer:(__CVBuffer *)a3;
- (void)setInputSemanticsHairPixelBuffer:(__CVBuffer *)a3;
- (void)setInputSemanticsSkinPixelBuffer:(__CVBuffer *)a3;
- (void)setInputSemanticsSkyPixelBuffer:(__CVBuffer *)a3;
- (void)setInputSemanticsTeethPixelBuffer:(__CVBuffer *)a3;
- (void)setOptions:(id)a3;
- (void)setOutputMattePixelBuffer:(__CVBuffer *)a3;
- (void)setOutputRefinedDisparityPixelBuffer:(__CVBuffer *)a3;
- (void)setOutputSemanticsGlassesPixelBuffer:(__CVBuffer *)a3;
- (void)setOutputSemanticsHairPixelBuffer:(__CVBuffer *)a3;
- (void)setOutputSemanticsSkinPixelBuffer:(__CVBuffer *)a3;
- (void)setOutputSemanticsSkyPixelBuffer:(__CVBuffer *)a3;
- (void)setOutputSemanticsTeethPixelBuffer:(__CVBuffer *)a3;
- (void)setSyntheticFocusRectangle:(CGRect)a3;
- (void)setTuningParameters:(id)a3;
@end

@implementation FigMatting

- (int)prewarm
{
  return 0;
}

- (int)setup
{
  return 0;
}

- (FigMatting)init
{
  return (FigMatting *)MEMORY[0x270F9A6D0](self, sel_initWithCommandQueue_, 0);
}

- (FigMatting)initWithCommandQueue:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FigMatting;
  v5 = [(FigMatting *)&v18 init];
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  if (v5)
  {
    v6 = (void *)MEMORY[0x263F086E0];
    uint64_t v7 = objc_opt_class();
    v9 = objc_msgSend_bundleForClass_(v6, v8, v7);
    id v10 = objc_alloc(MEMORY[0x263F2EE30]);
    uint64_t inited = objc_msgSend_initWithbundle_andOptionalCommandQueue_(v10, v11, (uint64_t)v9, v4);
    metalContext = v5->_metalContext;
    v5->_metalContext = (FigMetalContext *)inited;

    if (!v5->_metalContext)
    {
      FigDebugAssert3();

      v16 = 0;
      goto LABEL_5;
    }
    objc_msgSend_resetState(v5, v14, v15);
  }
  v16 = v5;
LABEL_5:

  return v16;
}

- (int)prewarmWithTuningParameters:(id)a3
{
  v27[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v6 = v4;
  if (v4)
  {
    uint64_t v26 = *MEMORY[0x263F2C618];
    v27[0] = v4;
    uint64_t v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v5, (uint64_t)v27, &v26, 1);
    objc_msgSend_setOptions_(self, v8, (uint64_t)v7);
  }
  v9 = [ConstraintsGenerator alloc];
  v11 = (ConstraintsGenerator *)objc_msgSend_initWithMetalContext_(v9, v10, (uint64_t)self->_metalContext);
  constraintsGenerator = self->_constraintsGenerator;
  self->_constraintsGenerator = v11;

  v13 = [FocalPlaneV2 alloc];
  uint64_t v15 = (FocalPlaneV2 *)objc_msgSend_initWithMetalContext_(v13, v14, (uint64_t)self->_metalContext);
  focalPlane = self->_focalPlane;
  self->_focalPlane = v15;

  int v19 = objc_msgSend_compileShaders(self->_focalPlane, v17, v18);
  int v24 = objc_msgSend__compileShaders(self, v20, v21) | v19;
  if (!self->_isShaderHarvesting) {
    v24 |= objc_msgSend__prewarmMPSKernels(self, v22, v23);
  }

  return v24 != 0;
}

- (void)isShaderHarvesting:(id)a3
{
  self->_isShaderHarvesting = objc_msgSend_BOOLValue(a3, a2, (uint64_t)a3);
}

- (int)_prewarmMPSKernels
{
  LODWORD(v3) = 953267991;
  v5 = objc_msgSend_filterDescriptorWithWidth_height_arrayLength_kernelSpatialDiameter_kernelTemporalDiameter_epsilon_sourceChannels_guideChannels_(MEMORY[0x263F132D0], a2, 16, 16, 1, 3, 1, 3, v3, 3);
  id v6 = objc_alloc(MEMORY[0x263F132C8]);
  v9 = objc_msgSend_device(self->_metalContext, v7, v8);
  v11 = objc_msgSend_initWithDevice_filterDescriptor_(v6, v10, (uint64_t)v9, v5);

  objc_msgSend_compileKernels(v11, v12, v13);
  v16 = objc_msgSend__createTextureOfSize_withFormat_(self, v14, 25, 2.0, 2.0);
  if (!v16)
  {
    uint64_t v84 = v2;
    LODWORD(v82) = 0;
    FigDebugAssert3();
    v61 = 0;
    v76 = 0;
    v89 = 0;
    v90 = 0;
    v40 = 0;
    v31 = 0;
    v91 = 0;
    uint64_t v18 = 0;
LABEL_23:
    v25 = 0;
    int v75 = -12786;
    objc_msgSend_commit(0, v78, v79, v82, v84);
    goto LABEL_16;
  }
  uint64_t v18 = objc_msgSend__createTextureOfSize_withFormat_(self, v15, 25, 2.0, 2.0);
  if (!v18)
  {
    uint64_t v84 = v2;
    LODWORD(v82) = 0;
LABEL_21:
    FigDebugAssert3();
    v61 = 0;
    v76 = 0;
    v89 = 0;
    v90 = 0;
    v40 = 0;
    v31 = 0;
    v91 = 0;
    goto LABEL_23;
  }
  v91 = objc_msgSend__createTextureOfSize_withFormat_(self, v17, 115, 2.0, 2.0);
  if (!v91)
  {
    uint64_t v84 = v2;
    LODWORD(v82) = 0;
    goto LABEL_21;
  }
  v90 = objc_msgSend__createTextureOfSize_withFormat_(self, v19, 115, 2.0, 2.0);
  if (!v90)
  {
    uint64_t v84 = v2;
    LODWORD(v82) = 0;
    FigDebugAssert3();
    v61 = 0;
    v76 = 0;
    v89 = 0;
    v90 = 0;
    v40 = 0;
    v31 = 0;
    goto LABEL_23;
  }
  v22 = objc_msgSend_commandQueue(self->_metalContext, v20, v21);
  v25 = objc_msgSend_commandBuffer(v22, v23, v24);

  if (!v25)
  {
    LODWORD(v82) = 0;
    FigDebugAssert3();
    int v75 = FigSignalErrorAt();
    v61 = 0;
    v76 = 0;
    v89 = 0;
    v40 = 0;
    v31 = 0;
    objc_msgSend_commit(0, v80, v81, v82);
    goto LABEL_16;
  }
  v88 = v5;
  MEMORY[0x263E631A0](v25, 0.0);
  id v26 = objc_alloc(MEMORY[0x263F13238]);
  v29 = objc_msgSend_device(self->_metalContext, v27, v28);
  v31 = objc_msgSend_initWithDevice_kernelWidth_kernelHeight_(v26, v30, (uint64_t)v29, 1, 1);

  if (!v31)
  {
    uint64_t v83 = v2;
    LODWORD(v82) = 0;
    FigDebugAssert3();
    v61 = 0;
    v76 = 0;
    v89 = 0;
    v40 = 0;
    goto LABEL_30;
  }
  objc_msgSend_encodeToCommandBuffer_sourceTexture_destinationTexture_(v31, v32, (uint64_t)v25, v16, v18);
  id v33 = objc_alloc(MEMORY[0x263F132F0]);
  v36 = objc_msgSend_device(self->_metalContext, v34, v35);
  LODWORD(v37) = 1063675494;
  LODWORD(v38) = 1.0;
  v40 = objc_msgSend_initWithDevice_thresholdValue_maximumValue_linearGrayColorTransform_(v33, v39, (uint64_t)v36, 0, v37, v38);

  if (!v40)
  {
    uint64_t v83 = v2;
    LODWORD(v82) = 0;
LABEL_28:
    FigDebugAssert3();
    v61 = 0;
    v76 = 0;
    v89 = 0;
    goto LABEL_30;
  }
  objc_msgSend_encodeToCommandBuffer_sourceTexture_destinationTexture_(v40, v41, (uint64_t)v25, v16, v18);
  id v42 = objc_alloc(MEMORY[0x263F132F8]);
  v45 = objc_msgSend_device(self->_metalContext, v43, v44);
  LODWORD(v46) = 1036831949;
  LODWORD(v47) = 1.0;
  v49 = objc_msgSend_initWithDevice_thresholdValue_maximumValue_linearGrayColorTransform_(v42, v48, (uint64_t)v45, 0, v46, v47);

  if (!v49)
  {
    uint64_t v83 = v2;
    LODWORD(v82) = 0;
    goto LABEL_28;
  }
  v89 = v49;
  objc_msgSend_encodeToCommandBuffer_sourceTexture_destinationTexture_(v49, v50, (uint64_t)v25, v16, v18);
  id v51 = objc_alloc(MEMORY[0x263F13240]);
  v52 = self;
  v55 = objc_msgSend_device(self->_metalContext, v53, v54);
  v57 = objc_msgSend_initWithDevice_(v51, v56, (uint64_t)v55);

  if (v57)
  {
    v86 = v40;
    v87 = v31;
    v85 = v57;
    uint64_t v59 = (uint64_t)v25;
    objc_msgSend_encodeToCommandBuffer_sourceTexture_destinationTexture_(v57, v58, (uint64_t)v25, v16, v18);
    uint64_t v60 = 0;
    v61 = 0;
    while (1)
    {
      v62 = v18;
      v63 = v16;
      v64 = v61;
      int v65 = dword_262F52F38[v60];
      id v66 = objc_alloc(MEMORY[0x263F13250]);
      v69 = objc_msgSend_device(v52->_metalContext, v67, v68);
      v61 = objc_msgSend_initWithDevice_kernelWidth_kernelHeight_kernelDepth_(v66, v70, (uint64_t)v69, (2 * v65) | 1u, (2 * v65) | 1u, 1);

      if (!v61) {
        break;
      }
      ++v60;
      v16 = v63;
      uint64_t v18 = v62;
      objc_msgSend_encodeToCommandBuffer_sourceTexture_destinationTexture_(v61, v71, v59, v63, v62);
      objc_msgSend_encodeToCommandBuffer_sourceTexture_destinationTexture_(v61, v72, v59, v91, v90);
      if (v60 == 3)
      {
        int v75 = 0;
        v5 = v88;
        goto LABEL_14;
      }
    }
    uint64_t v83 = v2;
    LODWORD(v82) = 0;
    FigDebugAssert3();
    int v75 = -12786;
    v5 = v88;
    v16 = v63;
    uint64_t v18 = v62;
LABEL_14:
    v25 = (void *)v59;
    v40 = v86;
    v31 = v87;
    v76 = v85;
    goto LABEL_15;
  }
  uint64_t v83 = v2;
  LODWORD(v82) = 0;
  FigDebugAssert3();
  v61 = 0;
  v76 = 0;
LABEL_30:
  int v75 = -12786;
  v5 = v88;
LABEL_15:
  objc_msgSend_commit(v25, v73, v74, v82, v83);
LABEL_16:

  return v75;
}

- (void)dealloc
{
  copyTextureKernel = self->_copyTextureKernel;
  self->_copyTextureKernel = 0;

  bilinearScaleKernel = self->_bilinearScaleKernel;
  self->_bilinearScaleKernel = 0;

  composeRGBAGuideKernel = self->_composeRGBAGuideKernel;
  self->_composeRGBAGuideKernel = 0;

  addTexturesKernel = self->_addTexturesKernel;
  self->_addTexturesKernel = 0;

  excludeNonSkinKernel = self->_excludeNonSkinKernel;
  self->_excludeNonSkinKernel = 0;

  focalPlane = self->_focalPlane;
  self->_focalPlane = 0;

  objc_msgSend_purgeResources(self, v9, v10);
  v11.receiver = self;
  v11.super_class = (Class)FigMatting;
  [(FigMatting *)&v11 dealloc];
}

- (int)purgeResources
{
  image = self->_image;
  self->_image = 0;

  inputDepth = self->_inputDepth;
  self->_inputDepth = 0;

  preprocessedDisparity = self->_preprocessedDisparity;
  self->_preprocessedDisparity = 0;

  preprocessedSkin = self->_preprocessedSkin;
  self->_preprocessedSkin = 0;

  refinedDisparityGuide = self->_refinedDisparityGuide;
  self->_refinedDisparityGuide = 0;

  rgbdGuide = self->_rgbdGuide;
  self->_rgbdGuide = 0;

  sourceTextures = self->_sourceTextures;
  self->_sourceTextures = 0;

  destinationTextures = self->_destinationTextures;
  self->_destinationTextures = 0;

  constraintsTextures = self->_constraintsTextures;
  self->_constraintsTextures = 0;

  preallocatedFaceNonSkinTextures = self->_preallocatedFaceNonSkinTextures;
  self->_preallocatedFaceNonSkinTextures = 0;

  faceNonSkinTextures = self->_faceNonSkinTextures;
  self->_faceNonSkinTextures = 0;

  semanticOutputCollections = self->_semanticOutputCollections;
  self->_semanticOutputCollections = 0;

  semanticConfigurations = self->_semanticConfigurations;
  self->_semanticConfigurations = 0;

  refinedDisparityFilter = self->_refinedDisparityFilter;
  self->_refinedDisparityFilter = 0;

  return 0;
}

- (int)finishProcessing
{
  objc_msgSend_waitForIdle(self->_metalContext, a2, v2);
  return 0;
}

- (int)finishScheduling
{
  objc_msgSend_waitForSchedule(self->_metalContext, a2, v2);
  return 0;
}

- (int)resetState
{
  CGSize v3 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
  self->_syntheticFocusRectangle.origin = (CGPoint)*MEMORY[0x263F001A0];
  self->_syntheticFocusRectangle.size = v3;
  faceLandmarks = self->_faceLandmarks;
  self->_faceLandmarks = 0;

  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  sourceTextures = self->_sourceTextures;
  self->_sourceTextures = v5;

  uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  destinationTextures = self->_destinationTextures;
  self->_destinationTextures = v7;

  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  constraintsTextures = self->_constraintsTextures;
  self->_constraintsTextures = v9;

  objc_super v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  faceNonSkinTextures = self->_faceNonSkinTextures;
  self->_faceNonSkinTextures = v11;

  return 0;
}

- (int)prepareToProcess:(unsigned int)a3
{
  int result = objc_msgSend__allocateResources(self, a2, *(uint64_t *)&a3);
  if (result)
  {
    FigDebugAssert3();
    return 2;
  }
  return result;
}

- (BOOL)outputEnabled:(unsigned int)a3
{
  return (a3 & ~self->_config.enabledOutputs) == 0;
}

- (id)enabledOutputArray
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  for (int i = 0; i != 32; ++i)
  {
    uint64_t v6 = (1 << i);
    if ((self->_config.enabledOutputs & v6) != 0)
    {
      uint64_t v7 = objc_msgSend_numberWithInt_(NSNumber, v3, v6);
      objc_msgSend_addObject_(v4, v8, (uint64_t)v7);
    }
  }
  id v9 = objc_alloc(MEMORY[0x263EFF8C0]);
  objc_super v11 = objc_msgSend_initWithArray_(v9, v10, (uint64_t)v4);

  return v11;
}

- (int)validateAndBindInputsAndOutputs
{
  imagePixelBuffer = self->_imagePixelBuffer;
  if (!imagePixelBuffer
    || CVPixelBufferGetPixelFormatType(imagePixelBuffer) != 1111970369
    && CVPixelBufferGetPixelFormatType(self->_imagePixelBuffer) != 875704422
    && CVPixelBufferGetPixelFormatType(self->_imagePixelBuffer) != 641230384
    && CVPixelBufferGetPixelFormatType(self->_imagePixelBuffer) != 2084070960
    && CVPixelBufferGetPixelFormatType(self->_imagePixelBuffer) != 792225328
    && CVPixelBufferGetPixelFormatType(self->_imagePixelBuffer) != 758670896)
  {
    goto LABEL_117;
  }
  id v4 = [Texture2DWrapper alloc];
  uint64_t v6 = (Texture2DWrapper *)objc_msgSend_initWithFigMetalContext_pixelBuffer_usage_(v4, v5, (uint64_t)self->_metalContext, self->_imagePixelBuffer, 17);
  image = self->_image;
  self->_image = v6;

  if (!self->_image) {
    goto LABEL_78;
  }
  inputDepthPixelBuffer = self->_inputDepthPixelBuffer;
  if (inputDepthPixelBuffer)
  {
    if (CVPixelBufferGetPixelFormatType(inputDepthPixelBuffer) != 1751410032) {
      goto LABEL_117;
    }
    uint64_t v10 = [Texture2DWrapper alloc];
    v12 = (Texture2DWrapper *)objc_msgSend_initWithFigMetalContext_pixelBuffer_usage_(v10, v11, (uint64_t)self->_metalContext, self->_inputDepthPixelBuffer, 17);
    inputDepth = self->_inputDepth;
    self->_inputDepth = v12;

    if (!self->_inputDepth)
    {
LABEL_78:
      FigDebugAssert3();
      return 2;
    }
  }
  if (objc_msgSend_outputEnabled_(self, v8, 1))
  {
    if (self->_disparityRefinementVersion <= 0) {
      goto LABEL_117;
    }
    if ((objc_msgSend_outputEnabled_(self, v14, 2) & 1) == 0) {
      goto LABEL_117;
    }
    inputDisparityPixelBuffer = self->_inputDisparityPixelBuffer;
    if (!inputDisparityPixelBuffer || CVPixelBufferGetPixelFormatType(inputDisparityPixelBuffer) != 1751411059) {
      goto LABEL_117;
    }
    v16 = [Texture2DWrapper alloc];
    uint64_t v18 = objc_msgSend_initWithFigMetalContext_pixelBuffer_usage_(v16, v17, (uint64_t)self->_metalContext, self->_inputDisparityPixelBuffer, 17);
    if (!v18) {
      goto LABEL_112;
    }
    outputRefinedDisparityPixelBuffer = self->_outputRefinedDisparityPixelBuffer;
    if (!outputRefinedDisparityPixelBuffer) {
      goto LABEL_112;
    }
    if (CVPixelBufferGetPixelFormatType(outputRefinedDisparityPixelBuffer) != 1751411059) {
      goto LABEL_112;
    }
    v20 = [Texture2DWrapper alloc];
    uint64_t v22 = objc_msgSend_initWithFigMetalContext_pixelBuffer_usage_(v20, v21, (uint64_t)self->_metalContext, self->_outputRefinedDisparityPixelBuffer, 23);
    if (!v22) {
      goto LABEL_112;
    }
    uint64_t v24 = (void *)v22;
    objc_msgSend_setObject_forKeyedSubscript_(self->_sourceTextures, v23, (uint64_t)v18, &unk_270E33558);
    objc_msgSend_setObject_forKeyedSubscript_(self->_destinationTextures, v25, (uint64_t)v24, &unk_270E33558);
  }
  if (objc_msgSend_outputEnabled_(self, v14, 2))
  {
    inputSegmentationPixelBuffer = self->_inputSegmentationPixelBuffer;
    if (!inputSegmentationPixelBuffer
      || CVPixelBufferGetPixelFormatType(inputSegmentationPixelBuffer) != 1278226536
      && CVPixelBufferGetPixelFormatType(self->_inputSegmentationPixelBuffer) != 1278226534)
    {
      goto LABEL_117;
    }
    uint64_t v28 = [Texture2DWrapper alloc];
    uint64_t v18 = objc_msgSend_initWithFigMetalContext_pixelBuffer_usage_(v28, v29, (uint64_t)self->_metalContext, self->_inputSegmentationPixelBuffer, 17);
    if (!v18) {
      goto LABEL_112;
    }
    outputMattePixelBuffer = self->_outputMattePixelBuffer;
    if (!outputMattePixelBuffer) {
      goto LABEL_112;
    }
    if (CVPixelBufferGetPixelFormatType(outputMattePixelBuffer) != 1278226488) {
      goto LABEL_112;
    }
    v31 = [Texture2DWrapper alloc];
    uint64_t v33 = objc_msgSend_initWithFigMetalContext_pixelBuffer_usage_(v31, v32, (uint64_t)self->_metalContext, self->_outputMattePixelBuffer, 23);
    if (!v33) {
      goto LABEL_112;
    }
    uint64_t v35 = (void *)v33;
    objc_msgSend_setObject_forKeyedSubscript_(self->_sourceTextures, v34, (uint64_t)v18, &unk_270E33570);
    objc_msgSend_setObject_forKeyedSubscript_(self->_destinationTextures, v36, (uint64_t)v35, &unk_270E33570);
  }
  if (objc_msgSend_outputEnabled_(self, v26, 4))
  {
    inputSemanticsHairPixelBuffer = self->_inputSemanticsHairPixelBuffer;
    if (!inputSemanticsHairPixelBuffer || CVPixelBufferGetPixelFormatType(inputSemanticsHairPixelBuffer) != 1278226536) {
      goto LABEL_117;
    }
    v39 = [Texture2DWrapper alloc];
    uint64_t v18 = objc_msgSend_initWithFigMetalContext_pixelBuffer_usage_(v39, v40, (uint64_t)self->_metalContext, self->_inputSemanticsHairPixelBuffer, 17);
    if (!v18) {
      goto LABEL_112;
    }
    outputSemanticsHairPixelBuffer = self->_outputSemanticsHairPixelBuffer;
    if (!outputSemanticsHairPixelBuffer) {
      goto LABEL_112;
    }
    if (CVPixelBufferGetPixelFormatType(outputSemanticsHairPixelBuffer) != 1278226488) {
      goto LABEL_112;
    }
    id v42 = [Texture2DWrapper alloc];
    uint64_t v44 = objc_msgSend_initWithFigMetalContext_pixelBuffer_usage_(v42, v43, (uint64_t)self->_metalContext, self->_outputSemanticsHairPixelBuffer, 23);
    if (!v44) {
      goto LABEL_112;
    }
    double v46 = (void *)v44;
    objc_msgSend_setObject_forKeyedSubscript_(self->_sourceTextures, v45, (uint64_t)v18, &unk_270E33588);
    objc_msgSend_setObject_forKeyedSubscript_(self->_destinationTextures, v47, (uint64_t)v46, &unk_270E33588);
  }
  if (objc_msgSend_outputEnabled_(self, v37, 8))
  {
    inputSemanticsSkinPixelBuffer = self->_inputSemanticsSkinPixelBuffer;
    if (!inputSemanticsSkinPixelBuffer || CVPixelBufferGetPixelFormatType(inputSemanticsSkinPixelBuffer) != 1278226536) {
      goto LABEL_117;
    }
    v50 = [Texture2DWrapper alloc];
    uint64_t v18 = objc_msgSend_initWithFigMetalContext_pixelBuffer_usage_(v50, v51, (uint64_t)self->_metalContext, self->_inputSemanticsSkinPixelBuffer, 17);
    if (!v18) {
      goto LABEL_112;
    }
    outputSemanticsSkinPixelBuffer = self->_outputSemanticsSkinPixelBuffer;
    if (!outputSemanticsSkinPixelBuffer) {
      goto LABEL_112;
    }
    if (CVPixelBufferGetPixelFormatType(outputSemanticsSkinPixelBuffer) != 1278226488) {
      goto LABEL_112;
    }
    v53 = [Texture2DWrapper alloc];
    uint64_t v55 = objc_msgSend_initWithFigMetalContext_pixelBuffer_usage_(v53, v54, (uint64_t)self->_metalContext, self->_outputSemanticsSkinPixelBuffer, 23);
    if (!v55) {
      goto LABEL_112;
    }
    v57 = (void *)v55;
    objc_msgSend_setObject_forKeyedSubscript_(self->_sourceTextures, v56, (uint64_t)v18, &unk_270E335A0);
    objc_msgSend_setObject_forKeyedSubscript_(self->_destinationTextures, v58, (uint64_t)v57, &unk_270E335A0);
  }
  if (objc_msgSend_outputEnabled_(self, v48, 16))
  {
    inputSemanticsTeethPixelBuffer = self->_inputSemanticsTeethPixelBuffer;
    if (!inputSemanticsTeethPixelBuffer
      || CVPixelBufferGetPixelFormatType(inputSemanticsTeethPixelBuffer) != 1278226536)
    {
      goto LABEL_117;
    }
    v61 = [Texture2DWrapper alloc];
    uint64_t v18 = objc_msgSend_initWithFigMetalContext_pixelBuffer_usage_(v61, v62, (uint64_t)self->_metalContext, self->_inputSemanticsTeethPixelBuffer, 17);
    if (!v18) {
      goto LABEL_112;
    }
    outputSemanticsTeethPixelBuffer = self->_outputSemanticsTeethPixelBuffer;
    if (!outputSemanticsTeethPixelBuffer) {
      goto LABEL_112;
    }
    if (CVPixelBufferGetPixelFormatType(outputSemanticsTeethPixelBuffer) != 1278226488) {
      goto LABEL_112;
    }
    v64 = [Texture2DWrapper alloc];
    uint64_t v66 = objc_msgSend_initWithFigMetalContext_pixelBuffer_usage_(v64, v65, (uint64_t)self->_metalContext, self->_outputSemanticsTeethPixelBuffer, 23);
    if (!v66) {
      goto LABEL_112;
    }
    uint64_t v68 = (void *)v66;
    objc_msgSend_setObject_forKeyedSubscript_(self->_sourceTextures, v67, (uint64_t)v18, &unk_270E335B8);
    objc_msgSend_setObject_forKeyedSubscript_(self->_destinationTextures, v69, (uint64_t)v68, &unk_270E335B8);
  }
  if (!objc_msgSend_outputEnabled_(self, v59, 32)) {
    goto LABEL_63;
  }
  inputSemanticsGlassesPixelBuffer = self->_inputSemanticsGlassesPixelBuffer;
  if (!inputSemanticsGlassesPixelBuffer
    || CVPixelBufferGetPixelFormatType(inputSemanticsGlassesPixelBuffer) != 1278226536)
  {
LABEL_117:
    FigDebugAssert3();
    return 1;
  }
  v72 = [Texture2DWrapper alloc];
  uint64_t v18 = objc_msgSend_initWithFigMetalContext_pixelBuffer_usage_(v72, v73, (uint64_t)self->_metalContext, self->_inputSemanticsGlassesPixelBuffer, 17);
  if (!v18
    || (outputSemanticsGlassesPixelBuffer = self->_outputSemanticsGlassesPixelBuffer) == 0
    || CVPixelBufferGetPixelFormatType(outputSemanticsGlassesPixelBuffer) != 1278226488
    || (int v75 = [Texture2DWrapper alloc],
        (uint64_t v77 = objc_msgSend_initWithFigMetalContext_pixelBuffer_usage_(v75, v76, (uint64_t)self->_metalContext, self->_outputSemanticsGlassesPixelBuffer, 23)) == 0))
  {
LABEL_112:
    FigDebugAssert3();

    return 1;
  }
  uint64_t v79 = (void *)v77;
  objc_msgSend_setObject_forKeyedSubscript_(self->_sourceTextures, v78, (uint64_t)v18, &unk_270E335D0);
  objc_msgSend_setObject_forKeyedSubscript_(self->_destinationTextures, v80, (uint64_t)v79, &unk_270E335D0);

LABEL_63:
  if (!objc_msgSend_outputEnabled_(self, v70, 64)) {
    return 0;
  }
  inputSemanticsSkyPixelBuffer = self->_inputSemanticsSkyPixelBuffer;
  if (!inputSemanticsSkyPixelBuffer || CVPixelBufferGetPixelFormatType(inputSemanticsSkyPixelBuffer) != 1278226536) {
    goto LABEL_117;
  }
  uint64_t v82 = [Texture2DWrapper alloc];
  uint64_t v84 = objc_msgSend_initWithFigMetalContext_pixelBuffer_usage_(v82, v83, (uint64_t)self->_metalContext, self->_inputSemanticsSkyPixelBuffer, 17);
  if (v84
    && (outputSemanticsSkyPixelBuffer = self->_outputSemanticsSkyPixelBuffer) != 0
    && CVPixelBufferGetPixelFormatType(outputSemanticsSkyPixelBuffer) == 1278226488)
  {
    v86 = [Texture2DWrapper alloc];
    v89 = objc_msgSend_initWithFigMetalContext_pixelBuffer_usage_(v86, v87, (uint64_t)self->_metalContext, self->_outputSemanticsSkyPixelBuffer, 23);
    if (v89)
    {
      objc_msgSend_setObject_forKeyedSubscript_(self->_sourceTextures, v88, (uint64_t)v84, &unk_270E335E8);
      objc_msgSend_setObject_forKeyedSubscript_(self->_destinationTextures, v90, (uint64_t)v89, &unk_270E335E8);
      int v91 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v91 = 1;
    }
  }
  else
  {
    FigDebugAssert3();
    int v91 = 1;
  }

  return v91;
}

- (void)encodeAddTexturesToCommandBuffer:(id)a3 sourceTextureA:(id)a4 sourceTextureB:(id)a5 destinationTexture:(id)a6 thresholdBeginValue:(float)a7 thresholdEndValue:(float)a8
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  v17 = objc_msgSend_computeCommandEncoder(a3, v15, v16);
  objc_msgSend_setComputePipelineState_(v17, v18, (uint64_t)self->_addTexturesKernel);
  objc_msgSend_setTexture_atIndex_(v17, v19, (uint64_t)v14, 0);

  objc_msgSend_setTexture_atIndex_(v17, v20, (uint64_t)v13, 1);
  objc_msgSend_setTexture_atIndex_(v17, v21, (uint64_t)v12, 2);
  unint64_t v42 = __PAIR64__(LODWORD(a8), LODWORD(a7));
  objc_msgSend_setBytes_length_atIndex_(v17, v22, (uint64_t)&v42, 8, 0);
  unint64_t v25 = objc_msgSend_threadExecutionWidth(self->_addTexturesKernel, v23, v24);
  unint64_t v28 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_addTexturesKernel, v26, v27) / v25;
  uint64_t v31 = objc_msgSend_width(v12, v29, v30);
  uint64_t v34 = objc_msgSend_height(v12, v32, v33);

  v41[0] = v31;
  v41[1] = v34;
  v41[2] = 1;
  v40[0] = v25;
  v40[1] = v28;
  v40[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v17, v35, (uint64_t)v41, v40);
  objc_msgSend_endEncoding(v17, v36, v37);
}

- (void)encodePreprocessSkinToCommandBuffer:(id)a3 inputSkinTexture:(id)a4 faceNonSkinTextures:(id)a5 outputSkinTexture:(id)a6
{
  uint64_t v160 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v16 = objc_msgSend_computeCommandEncoder(v10, v14, v15);
  objc_msgSend_setComputePipelineState_(v16, v17, (uint64_t)self->_bilinearScaleKernel);
  v101 = v11;
  objc_msgSend_setTexture_atIndex_(v16, v18, (uint64_t)v11, 0);
  objc_msgSend_setTexture_atIndex_(v16, v19, (uint64_t)v13, 1);
  unint64_t v22 = objc_msgSend_threadExecutionWidth(self->_bilinearScaleKernel, v20, v21);
  unint64_t v25 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_bilinearScaleKernel, v23, v24) / v22;
  v117[0] = objc_msgSend_width(v13, v26, v27);
  v117[1] = objc_msgSend_height(v13, v28, v29);
  v117[2] = 1;
  v116[0] = v22;
  v116[1] = v25;
  v116[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v16, v30, (uint64_t)v117, v116);
  objc_msgSend_endEncoding(v16, v31, v32);
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  objc_msgSend_allKeys(v12, v33, v34);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v107 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v112, v125, 16);
  if (v107)
  {
    uint64_t v106 = *(void *)v113;
    do
    {
      for (uint64_t i = 0; i != v107; ++i)
      {
        if (*(void *)v113 != v106) {
          objc_enumerationMutation(obj);
        }
        double v38 = *(void **)(*((void *)&v112 + 1) + 8 * i);
        v39 = objc_msgSend_objectForKeyedSubscript_(v12, v36, (uint64_t)v38);
        unint64_t v42 = objc_msgSend_texture(v39, v40, v41);

        v45 = objc_msgSend_faceSegments(v38, v43, v44);

        if (v45)
        {
          double v48 = (float)(unint64_t)objc_msgSend_width(v13, v46, v47);
          double v51 = (float)(unint64_t)objc_msgSend_height(v13, v49, v50);
          float v54 = (float)(unint64_t)objc_msgSend_width(v42, v52, v53);
          float v57 = (float)(unint64_t)objc_msgSend_height(v42, v55, v56);
          memset(&v111, 0, sizeof(v111));
          int exifOrientation = self->_exifOrientation;
          v61 = objc_msgSend_faceSegments(v38, v59, v60);
          objc_msgSend_boundingBox(v61, v62, v63);
          double v108 = v64;
          double v66 = v65;
          double v68 = v67;
          double v70 = v69;
          long long v71 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
          *(_OWORD *)&v111.a = *MEMORY[0x263F000D0];
          *(_OWORD *)&v111.c = v71;
          *(_OWORD *)&v111.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
          t2.a = 1.0;
          t2.b = 0.0;
          t2.c = 0.0;
          *(_OWORD *)&t2.d = xmmword_262F52EE0;
          t2.ty = v51;
          long long v104 = v71;
          long long v105 = *(_OWORD *)&v111.a;
          *(_OWORD *)&t1.a = *(_OWORD *)&v111.a;
          *(_OWORD *)&t1.c = v71;
          long long v103 = *(_OWORD *)&v111.tx;
          *(_OWORD *)&t1.tx = *(_OWORD *)&v111.tx;
          CGAffineTransformConcat(&v111, &t1, &t2);
          v161.origin.x = 0.0;
          v161.origin.y = 0.0;
          v161.size.double width = v48;
          v161.size.double height = v51;
          if (CGRectIsInfinite(v161))
          {
            *(_OWORD *)&v123.a = v105;
            *(_OWORD *)&v123.c = v104;
            *(_OWORD *)&v123.tx = v103;
          }
          else
          {
            t1.b = 0.0;
            t1.c = 0.0;
            t1.a = 1.0;
            t1.d = 1.0;
            t1.tx = 0.0;
            t1.ty = 0.0;
            uint64_t v128 = 0;
            uint64_t v129 = 0;
            unint64_t v127 = 0xBFF0000000000000;
            uint64_t v130 = 0x3FF0000000000000;
            double v131 = v48;
            long long v132 = xmmword_262F52EF0;
            uint64_t v133 = 0;
            uint64_t v134 = 0;
            unint64_t v135 = 0xBFF0000000000000;
            double v136 = v48;
            double v137 = v51;
            uint64_t v138 = 0x3FF0000000000000;
            uint64_t v139 = 0;
            uint64_t v140 = 0;
            long long v141 = xmmword_262F52EE0;
            double v142 = v51;
            long long v143 = xmmword_262F52EF0;
            long long v144 = xmmword_262F52EE0;
            double v145 = v51;
            double v146 = v48;
            long long v147 = xmmword_262F52EF0;
            uint64_t v148 = 0x3FF0000000000000;
            uint64_t v149 = 0;
            uint64_t v150 = 0;
            double v151 = v48;
            long long v152 = xmmword_262F52F00;
            long long v154 = 0u;
            long long v155 = 0u;
            uint64_t v153 = 0x3FF0000000000000;
            uint64_t v156 = 0x3FF0000000000000;
            long long v157 = xmmword_262F52EE0;
            double v158 = v51;
            uint64_t v159 = 0;
            if ((exifOrientation - 9) >= 0xFFFFFFF8) {
              int v72 = exifOrientation - 1;
            }
            else {
              int v72 = 0;
            }
            v73 = &t1 + v72;
            long long v74 = *(_OWORD *)&v73->a;
            long long v75 = *(_OWORD *)&v73->tx;
            *(_OWORD *)&v123.c = *(_OWORD *)&v73->c;
            *(_OWORD *)&v123.tx = v75;
            *(_OWORD *)&v123.a = v74;
          }
          CGAffineTransform v122 = v111;
          CGAffineTransform v121 = v123;
          CGAffineTransformConcat(&t1, &v122, &v121);
          CGAffineTransform v111 = t1;
          CGAffineTransform t1 = v123;
          v162.origin.x = 0.0;
          v162.origin.y = 0.0;
          v162.size.double width = v48;
          v162.size.double height = v51;
          CGRect v163 = CGRectApplyAffineTransform(v162, &t1);
          double width = v163.size.width;
          double height = v163.size.height;
          CGAffineTransformMakeTranslation(&v122, -(v163.size.width * (v108 + v68 * 0.5)), -(v163.size.height * (v66 + v70 * 0.5)));
          CGAffineTransform v121 = v111;
          CGAffineTransformConcat(&t1, &v121, &v122);
          CGAffineTransform v111 = t1;
          CGAffineTransformMakeScale(&v121, v54 / (v68 * width), v57 / (v70 * height));
          CGAffineTransform v120 = v111;
          CGAffineTransformConcat(&t1, &v120, &v121);
          CGAffineTransform v111 = t1;
          CGAffineTransformMakeTranslation(&v120, v54 * 0.5, v57 * 0.5);
          CGAffineTransform v119 = v111;
          CGAffineTransformConcat(&t1, &v119, &v120);
          CGAffineTransform v111 = t1;
          v118.a = 1.0;
          v118.b = 0.0;
          v118.c = 0.0;
          *(_OWORD *)&v118.d = xmmword_262F52EE0;
          v118.ty = v57;
          CGAffineTransform v119 = t1;
          CGAffineTransformConcat(&t1, &v119, &v118);
          CGAffineTransform v111 = t1;

          t1.b = 0.0;
          *(float32x2_t *)&t1.a = vcvt_f32_f64(*(float64x2_t *)&v111.a);
          t1.d = 0.0;
          *(float32x2_t *)&t1.c = vcvt_f32_f64(*(float64x2_t *)&v111.c);
          *(void *)&t1.ty = 1065353216;
          *(float32x2_t *)&t1.tx = vcvt_f32_f64(*(float64x2_t *)&v111.tx);
          v80 = objc_msgSend_computeCommandEncoder(v10, v78, v79);

          objc_msgSend_setComputePipelineState_(v80, v81, (uint64_t)self->_excludeNonSkinKernel);
          objc_msgSend_setTexture_atIndex_(v80, v82, (uint64_t)v13, 0);
          objc_msgSend_setTexture_atIndex_(v80, v83, (uint64_t)v42, 1);
          objc_msgSend_setTexture_atIndex_(v80, v84, (uint64_t)v13, 2);
          objc_msgSend_setBytes_length_atIndex_(v80, v85, (uint64_t)&t1, 48, 0);
          unint64_t v88 = objc_msgSend_threadExecutionWidth(self->_excludeNonSkinKernel, v86, v87);
          unint64_t v91 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_excludeNonSkinKernel, v89, v90) / v88;
          uint64_t v94 = objc_msgSend_width(v13, v92, v93);
          uint64_t v97 = objc_msgSend_height(v13, v95, v96);
          v110[0] = v94;
          v110[1] = v97;
          v110[2] = 1;
          v109[0] = v88;
          v109[1] = v91;
          v109[2] = 1;
          objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v80, v98, (uint64_t)v110, v109);
          objc_msgSend_endEncoding(v80, v99, v100);
          uint64_t v16 = v80;
        }
      }
      uint64_t v107 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v112, v125, 16);
    }
    while (v107);
  }
}

- (void)encodeComposeRGBAGuideToCommandBuffer:(id)a3 rgbTexture:(id)a4 alphaTexture:(id)a5 destinationTexture:(id)a6 rgbWeight:(float)a7
{
  float v39 = a7;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  uint64_t v16 = objc_msgSend_computeCommandEncoder(a3, v14, v15);
  objc_msgSend_setComputePipelineState_(v16, v17, (uint64_t)self->_composeRGBAGuideKernel);
  objc_msgSend_setTexture_atIndex_(v16, v18, (uint64_t)v13, 0);

  objc_msgSend_setTexture_atIndex_(v16, v19, (uint64_t)v12, 1);
  objc_msgSend_setTexture_atIndex_(v16, v20, (uint64_t)v11, 2);
  objc_msgSend_setBytes_length_atIndex_(v16, v21, (uint64_t)&v39, 4, 0);
  unint64_t v24 = objc_msgSend_threadExecutionWidth(self->_composeRGBAGuideKernel, v22, v23);
  unint64_t v27 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_composeRGBAGuideKernel, v25, v26) / v24;
  uint64_t v30 = objc_msgSend_width(v11, v28, v29);
  uint64_t v33 = objc_msgSend_height(v11, v31, v32);

  v38[0] = v30;
  v38[1] = v33;
  v38[2] = 1;
  v37[0] = v24;
  v37[1] = v27;
  v37[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v16, v34, (uint64_t)v38, v37);
  objc_msgSend_endEncoding(v16, v35, v36);
}

- (void)encodeComposeRGBAGuideToCommandBuffer:(id)a3 rgbTexture:(id)a4 alphaTexture:(id)a5 destinationTexture:(id)a6
{
  LODWORD(v6) = 1.0;
  objc_msgSend_encodeComposeRGBAGuideToCommandBuffer_rgbTexture_alphaTexture_destinationTexture_rgbWeight_(self, a2, (uint64_t)a3, a4, a5, a6, v6);
}

- (int)processFocalPlaneAndSolverOnly
{
  return 5;
}

- (int)process
{
  uint64_t v2 = self;
  uint64_t v363 = *MEMORY[0x263EF8340];
  v301 = objc_msgSend_FigMattingOutputToShortString_(FigMatting, a2, self->_config.enabledOutputs);
  int v5 = objc_msgSend_validateAndBindInputsAndOutputs(v2, v3, v4);
  if (v5)
  {
    int v221 = v5;
    FigDebugAssert3();
LABEL_93:
    BOOL v222 = 0;
    goto LABEL_94;
  }
  uint64_t v8 = objc_msgSend_commandQueue(v2->_metalContext, v6, v7);
  id v11 = objc_msgSend_commandBuffer(v8, v9, v10);

  if (v11)
  {
    p_rgbdGuide = (void **)&v2->_rgbdGuide;
    v331 = v2;
    if (v2->_rgbdGuide)
    {
      id v14 = objc_msgSend_texture(v2->_image, v12, v13);
      v17 = objc_msgSend_texture(v2->_inputDepth, v15, v16);
      v20 = objc_msgSend_texture(v2->_rgbdGuide, v18, v19);
      objc_msgSend_encodeComposeRGBAGuideToCommandBuffer_rgbTexture_alphaTexture_destinationTexture_(v331, v21, (uint64_t)v11, v14, v17, v20);

      uint64_t v2 = v331;
    }
    objc_msgSend_removeAllObjects(v2->_faceNonSkinTextures, v12, v13);
    if (objc_msgSend_outputEnabled_(v2, v22, 8))
    {
      faceSegments = v2->_faceSegments;
      if (faceSegments)
      {
        if (objc_msgSend_count(faceSegments, v23, v24)
          && objc_msgSend_count(v2->_faceSegments, v26, v27) <= v2->_maximumNumberOfFacesToConsider)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            unint64_t v28 = v2->_faceSegments;
          }
          else {
            unint64_t v28 = 0;
          }
          v324 = v11;
          long long v353 = 0u;
          long long v354 = 0u;
          long long v355 = 0u;
          long long v356 = 0u;
          id obj = v28;
          uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v353, v362, 16);
          if (v30)
          {
            uint64_t v33 = v30;
            unsigned int v34 = 0;
            uint64_t v35 = *(void *)v354;
            uint64_t v303 = *(void *)v354;
            do
            {
              uint64_t v36 = 0;
              id v305 = (id)v33;
              do
              {
                if (*(void *)v354 != v35) {
                  objc_enumerationMutation(obj);
                }
                v322 = *(void **)(*((void *)&v353 + 1) + 8 * v36);
                uint64_t v37 = objc_msgSend_faceSegments(v322, v31, v32);

                if (!v37) {
                  goto LABEL_51;
                }
                long long v351 = 0u;
                long long v352 = 0u;
                long long v349 = 0u;
                long long v350 = 0u;
                uint64_t v326 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_270E33750, v31, (uint64_t)&v349, v361, 16);
                if (!v326)
                {
                  id v42 = 0;
                  goto LABEL_50;
                }
                int v40 = 0;
                uint64_t inited = 0;
                id v42 = 0;
                uint64_t v320 = *(void *)v350;
                unsigned int v309 = v34;
                unint64_t v314 = v34;
                do
                {
                  uint64_t v43 = 0;
                  int v312 = v40;
                  int v328 = -v40;
                  uint64_t v44 = v42;
                  do
                  {
                    if (*(void *)v350 != v320) {
                      objc_enumerationMutation(&unk_270E33750);
                    }
                    v45 = *(void **)(*((void *)&v349 + 1) + 8 * v43);
                    double v46 = objc_msgSend_faceSegments(v322, v38, v39);
                    uint64_t v49 = objc_msgSend_unsignedIntegerValue(v45, v47, v48);
                    v52 = objc_msgSend_faceSegments(v322, v50, v51);
                    objc_msgSend_boundingBox(v52, v53, v54);
                    id v348 = v44;
                    uint64_t v56 = (__CVBuffer *)objc_msgSend_createProbabilityImageOfFaceSegment_region_normalize_error_(v46, v55, v49, 1, &v348);
                    id v42 = v348;

                    if (v56)
                    {
                      float v57 = v331;
                      if (!inited)
                      {
                        size_t Width = CVPixelBufferGetWidth(v56);
                        size_t Height = CVPixelBufferGetHeight(v56);
                        if (objc_msgSend_count(v331->_preallocatedFaceNonSkinTextures, v60, v61) <= v314) {
                          goto LABEL_33;
                        }
                        uint64_t inited = objc_msgSend_objectAtIndexedSubscript_(v331->_preallocatedFaceNonSkinTextures, v62, v314);
                        double v65 = objc_msgSend_texture(inited, v63, v64);
                        if (objc_msgSend_width(v65, v66, v67) != Width)
                        {

                          goto LABEL_32;
                        }
                        double v70 = objc_msgSend_texture(inited, v68, v69);
                        uint64_t v73 = objc_msgSend_height(v70, v71, v72);

                        BOOL v74 = v73 == Height;
                        float v57 = v331;
                        if (!v74)
                        {
LABEL_32:

                          goto LABEL_33;
                        }
                        if (!inited)
                        {
LABEL_33:
                          long long v75 = [Texture2DWrapper alloc];
                          uint64_t inited = objc_msgSend_initNewTextureWithFigMetalContext_size_withFormat_usage_(v75, v76, (uint64_t)v57->_metalContext, 25, 23, (float)Width, (float)Height);
                        }
                      }
                      uint64_t v77 = [Texture2DWrapper alloc];
                      uint64_t v81 = objc_msgSend_initWithFigMetalContext_pixelBuffer_usage_textureArray_(v77, v78, (uint64_t)v57->_metalContext, v56, 23, 0);
                      uint64_t v82 = (void *)v81;
                      if (!v81)
                      {
                        uint64_t v83 = [Texture2DWrapper alloc];
                        uint64_t v82 = objc_msgSend_initWithFigMetalContext_copyingPixelBuffer_usage_(v83, v84, (uint64_t)v57->_metalContext, v56, 23);
                        CFRelease(v56);
                      }
                      uint64_t v87 = objc_msgSend_texture(v82, v79, v80);
                      if (v328 == v43)
                      {
                        uint64_t v88 = 0;
                      }
                      else
                      {
                        uint64_t v88 = objc_msgSend_texture(inited, v85, v86);
                        id v318 = (id)v88;
                      }
                      v89 = objc_msgSend_texture(inited, v85, v86);
                      FigGetCFPreferenceDoubleWithDefault();
                      float v91 = v90;
                      FigGetCFPreferenceDoubleWithDefault();
                      *(float *)&double v93 = v92;
                      *(float *)&double v92 = v91;
                      objc_msgSend_encodeAddTexturesToCommandBuffer_sourceTextureA_sourceTextureB_destinationTexture_thresholdBeginValue_thresholdEndValue_(v331, v94, (uint64_t)v324, v87, v88, v89, v92, v93);

                      if (v328 != v43) {
                      if (v81)
                      }
                      {
                        v347[0] = MEMORY[0x263EF8330];
                        v347[1] = 3221225472;
                        v347[2] = sub_262F4837C;
                        v347[3] = &unk_2655C2420;
                        v347[4] = v56;
                        objc_msgSend_addCompletedHandler_(v324, v95, (uint64_t)v347);
                      }
                    }
                    ++v43;
                    uint64_t v44 = v42;
                  }
                  while (v326 != v43);
                  int v40 = v312 + v326;
                  uint64_t v326 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_270E33750, v38, (uint64_t)&v349, v361, 16);
                }
                while (v326);
                uint64_t v2 = v331;
                if (inited)
                {
                  objc_msgSend_setObject_forKeyedSubscript_(v331->_faceNonSkinTextures, v38, (uint64_t)inited, v322);
                }
                unsigned int v34 = v309;
                uint64_t v35 = v303;
                uint64_t v33 = (uint64_t)v305;
LABEL_50:

LABEL_51:
                ++v34;
                ++v36;
              }
              while (v36 != v33);
              uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v353, v362, 16);
            }
            while (v33);
          }
          uint64_t v96 = objc_msgSend_objectForKeyedSubscript_(v2->_sourceTextures, v31, (uint64_t)&unk_270E335A0);
          v99 = objc_msgSend_texture(v96, v97, v98);
          faceNonSkinTextures = v331->_faceNonSkinTextures;
          long long v103 = objc_msgSend_texture(v331->_preprocessedSkin, v101, v102);
          id v11 = v324;
          objc_msgSend_encodePreprocessSkinToCommandBuffer_inputSkinTexture_faceNonSkinTextures_outputSkinTexture_(v331, v104, (uint64_t)v324, v99, faceNonSkinTextures, v103);

          uint64_t v2 = v331;
          objc_msgSend_setObject_forKeyedSubscript_(v2->_sourceTextures, v105, (uint64_t)v2->_preprocessedSkin, &unk_270E335A0);
        }
      }
    }
    id v106 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v107 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v108 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v343 = 0u;
    long long v344 = 0u;
    long long v345 = 0u;
    long long v346 = 0u;
    v306 = v2->_semanticOutputCollections;
    uint64_t v304 = objc_msgSend_countByEnumeratingWithState_objects_count_(v306, v109, (uint64_t)&v343, v360, 16);
    if (v304)
    {
      obja = (void **)&v2->_image;
      uint64_t v310 = *(void *)v344;
      uint64_t v325 = (uint64_t)v11;
      id v316 = v106;
      while (2)
      {
        uint64_t v112 = 0;
        do
        {
          if (*(void *)v344 != v310) {
            objc_enumerationMutation(v306);
          }
          long long v113 = *(void **)(*((void *)&v343 + 1) + 8 * v112);
          int v114 = objc_msgSend_useDepthFilter(v113, v110, v111);
          v117 = p_rgbdGuide;
          if (!v114) {
            v117 = obja;
          }
          uint64_t v118 = objc_msgSend_texture(*v117, v115, v116);
          CGAffineTransform v121 = (void *)v118;
          if (!v118)
          {
            FigDebugAssert3();
LABEL_84:

            int v221 = 0;
            BOOL v222 = 1;
            goto LABEL_94;
          }
          uint64_t v313 = v112;
          v315 = (void *)v118;
          objc_msgSend_removeAllObjects(v106, v119, v120);
          objc_msgSend_removeAllObjects(v107, v122, v123);
          objc_msgSend_removeAllObjects(v108, v124, v125);
          long long v341 = 0u;
          long long v342 = 0u;
          long long v339 = 0u;
          long long v340 = 0u;
          v311 = v113;
          objc_msgSend_semanticOutputs(v113, v126, v127);
          id v319 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v329 = objc_msgSend_countByEnumeratingWithState_objects_count_(v319, v128, (uint64_t)&v339, v359, 16);
          char v130 = 0;
          if (v329)
          {
            uint64_t v327 = *(void *)v340;
            while (2)
            {
              for (uint64_t i = 0; i != v329; ++i)
              {
                if (*(void *)v340 != v327) {
                  objc_enumerationMutation(v319);
                }
                long long v132 = *(void **)(*((void *)&v339 + 1) + 8 * i);
                uint64_t v133 = objc_msgSend_objectForKeyedSubscript_(v2->_sourceTextures, v129, (uint64_t)v132);
                objc_msgSend_texture(v133, v134, v135);
                v137 = double v136 = v2;
                objc_msgSend_addObject_(v106, v138, (uint64_t)v137);

                uint64_t v140 = objc_msgSend_objectForKeyedSubscript_(v136->_semanticConfigurations, v139, (uint64_t)v132);
                LODWORD(v137) = objc_msgSend_constraintsEnabled(v140, v141, v142);

                if (v137)
                {
                  double v145 = objc_msgSend_objectForKeyedSubscript_(v136->_constraintsTextures, v143, (uint64_t)v132);
                  uint64_t v148 = objc_msgSend_texture(v145, v146, v147);

                  unsigned int v323 = objc_msgSend_width(v148, v149, v150);
                  unsigned int v321 = objc_msgSend_height(v148, v151, v152);
                  long long v154 = objc_msgSend_objectForKeyedSubscript_(v136->_semanticConfigurations, v153, (uint64_t)v132);
                  objc_msgSend_fgThresholdValue(v154, v155, v156);
                  unsigned int v158 = v157;
                  uint64_t v160 = objc_msgSend_objectForKeyedSubscript_(v136->_semanticConfigurations, v159, (uint64_t)v132);
                  objc_msgSend_bgThresholdValue(v160, v161, v162);
                  unsigned int v164 = v163;
                  objc_msgSend_objectForKeyedSubscript_(v136->_semanticConfigurations, v165, (uint64_t)v132);
                  v167 = id v166 = v107;
                  id v170 = v108;
                  int v171 = objc_msgSend_erosionKernelSize(v167, v168, v169);

                  constraintsGenerator = v136->_constraintsGenerator;
                  v174 = objc_msgSend_objectForKeyedSubscript_(v136->_sourceTextures, v173, (uint64_t)v132);
                  v177 = objc_msgSend_texture(v174, v175, v176);
                  *(void *)&long long v332 = __PAIR64__(v321, v323);
                  *((void *)&v332 + 1) = __PAIR64__(v164, v158);
                  LODWORD(v333) = v171;
                  id v108 = v170;
                  objc_msgSend_encodeToCommandBuffer_segmentationTexture_constraintsTexture_config_(constraintsGenerator, v178, v325, v177, v148, &v332);

                  id v107 = v166;
                  id v106 = v316;
                  uint64_t v181 = objc_msgSend_unsignedIntValue(v132, v179, v180);
                  v183 = objc_msgSend_FigMattingOutputToShortString_(FigMatting, v182, v181);
                  v185 = objc_msgSend_objectForKeyedSubscript_(v136->_constraintsTextures, v184, (uint64_t)v132);
                  v188 = objc_msgSend_texture(v185, v186, v187);
                  objc_msgSend_addObject_(v107, v189, (uint64_t)v188);

                  char v130 = 1;
                }
                else
                {
                  uint64_t v148 = objc_msgSend_null(MEMORY[0x263EFF9D0], v143, v144);
                  objc_msgSend_addObject_(v107, v190, (uint64_t)v148);
                }

                v192 = objc_msgSend_objectForKeyedSubscript_(v136->_destinationTextures, v191, (uint64_t)v132);
                v195 = objc_msgSend_texture(v192, v193, v194);

                if (!v195)
                {
                  FigDebugAssert3();

                  id v11 = (void *)v325;
                  CGAffineTransform v121 = v315;
                  goto LABEL_84;
                }
                v197 = objc_msgSend_objectForKeyedSubscript_(v136->_destinationTextures, v196, (uint64_t)v132);
                v200 = objc_msgSend_texture(v197, v198, v199);
                objc_msgSend_addObject_(v108, v201, (uint64_t)v200);

                uint64_t v2 = v136;
              }
              uint64_t v329 = objc_msgSend_countByEnumeratingWithState_objects_count_(v319, v129, (uint64_t)&v339, v359, 16);
              if (v329) {
                continue;
              }
              break;
            }
          }

          v206 = objc_msgSend_spatioTemporalFilter(v311, v202, v203);
          if (v130) {
            id v207 = v107;
          }
          else {
            id v207 = 0;
          }
          v208 = objc_msgSend_iterations(v311, v204, v205);
          uint64_t v211 = objc_msgSend_unsignedIntegerValue(v208, v209, v210);
          id v11 = (void *)v325;
          objc_msgSend_encodeToCommandBuffer_sourceTextureArray_guidanceTexture_constraintsTextureArray_numberOfIterations_destinationTextureArray_(v206, v212, v325, v106, v315, v207, v211, v108);

          uint64_t v2 = v331;
          uint64_t v112 = v313 + 1;
        }
        while (v313 + 1 != v304);
        uint64_t v304 = objc_msgSend_countByEnumeratingWithState_objects_count_(v306, v110, (uint64_t)&v343, v360, 16);
        if (v304) {
          continue;
        }
        break;
      }
    }

    if (!objc_msgSend_outputEnabled_(v2, v213, 1)
      || !v2->_refinedDisparityFilter
      || !v2->_preprocessedDisparity)
    {
      goto LABEL_90;
    }
    id v330 = v108;
    BOOL IsNull = CGRectIsNull(v2->_syntheticFocusRectangle);
    focalPlane = v2->_focalPlane;
    v317 = v106;
    v219 = v107;
    if (IsNull)
    {
      int v336 = 0;
      long long v335 = xmmword_262F52F44;
      objc_msgSend_setConfig_(focalPlane, v216, (uint64_t)&v335);
    }
    else
    {
      float32x4_t v337 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)v2->_syntheticFocusRectangle.origin), (float64x2_t)v2->_syntheticFocusRectangle.size);
      int v338 = 0;
      objc_msgSend_setConfig_(focalPlane, v216, (uint64_t)&v337);
    }
    v223 = v2->_focalPlane;
    v224 = objc_msgSend_objectForKeyedSubscript_(v2->_destinationTextures, v220, (uint64_t)&unk_270E33570);
    objc_msgSend_texture(v224, v225, v226);
    v228 = v227 = v2;
    v230 = objc_msgSend_objectForKeyedSubscript_(v227->_sourceTextures, v229, (uint64_t)&unk_270E33558);
    v233 = objc_msgSend_texture(v230, v231, v232);
    v236 = objc_msgSend_texture(v227->_preprocessedDisparity, v234, v235);
    long long v237 = *(_OWORD *)&v227->_disparityRefinementConfig.preprocessingGamma;
    long long v332 = *(_OWORD *)&v227->_disparityRefinementConfig.zeroShiftPercentile;
    long long v333 = v237;
    long long v334 = *(_OWORD *)&v227->_disparityRefinementConfig.subsampling;
    LODWORD(v223) = objc_msgSend_encodeDisparityRefinementPreprocessingOn_alphaTexture_inputDisparityTexture_outputDisparityTexture_configuration_(v223, v238, (uint64_t)v11, v228, v233, v236, &v332);

    if (!v223)
    {
      if (!v227->_refinedDisparityGuide)
      {
        v241 = [Texture2DWrapper alloc];
        uint64_t metalContext = (uint64_t)v331->_metalContext;
        v244 = objc_msgSend_objectForKeyedSubscript_(v331->_destinationTextures, v243, (uint64_t)&unk_270E33558);
        v247 = objc_msgSend_texture(v244, v245, v246);
        double v250 = (float)(unint64_t)objc_msgSend_width(v247, v248, v249);
        v252 = objc_msgSend_objectForKeyedSubscript_(v331->_destinationTextures, v251, (uint64_t)&unk_270E33558);
        v255 = objc_msgSend_texture(v252, v253, v254);
        uint64_t v258 = objc_msgSend_height(v255, v256, v257);
        v227 = v331;
        uint64_t v260 = objc_msgSend_initNewTextureWithFigMetalContext_size_withFormat_usage_(v241, v259, metalContext, 115, 23, v250, (float)(unint64_t)v258);
        refinedDisparityGuide = v331->_refinedDisparityGuide;
        v331->_refinedDisparityGuide = (Texture2DWrapper *)v260;
      }
      v262 = objc_msgSend_texture(v227->_image, v239, v240);
      v264 = objc_msgSend_objectForKeyedSubscript_(v227->_destinationTextures, v263, (uint64_t)&unk_270E33570);
      v267 = objc_msgSend_texture(v264, v265, v266);
      v270 = objc_msgSend_texture(v227->_refinedDisparityGuide, v268, v269);
      *(float *)&double v271 = v227->_disparityRefinementConfig.rgbWeight;
      objc_msgSend_encodeComposeRGBAGuideToCommandBuffer_rgbTexture_alphaTexture_destinationTexture_rgbWeight_(v227, v272, (uint64_t)v11, v262, v267, v270, v271);

      refinedDisparityFilter = v227->_refinedDisparityFilter;
      v276 = objc_msgSend_texture(v227->_preprocessedDisparity, v274, v275);
      v358 = v276;
      v278 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v277, (uint64_t)&v358, 1);
      v281 = objc_msgSend_texture(v227->_refinedDisparityGuide, v279, v280);
      uint64_t iterations = v227->_disparityRefinementConfig.iterations;
      v284 = objc_msgSend_objectForKeyedSubscript_(v227->_destinationTextures, v283, (uint64_t)&unk_270E33558);
      v287 = objc_msgSend_texture(v284, v285, v286);
      v357 = v287;
      v289 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v288, (uint64_t)&v357, 1);
      objc_msgSend_encodeToCommandBuffer_sourceTextureArray_guidanceTexture_constraintsTextureArray_numberOfIterations_destinationTextureArray_(refinedDisparityFilter, v290, (uint64_t)v11, v278, v281, 0, iterations, v289);

      id v106 = v317;
      id v107 = v219;
      id v108 = v330;
LABEL_90:
      if (*MEMORY[0x263F00E10])
      {
        v291 = objc_msgSend_commandQueue(v11, v214, v215);
        v294 = objc_msgSend_commandBuffer(v291, v292, v293);

        objc_msgSend_setLabel_(v294, v295, @"KTRACE_MTLCMDBUF");
        objc_msgSend_addCompletedHandler_(v294, v296, (uint64_t)&unk_270E312C0);
        objc_msgSend_commit(v294, v297, v298);
        objc_msgSend_addCompletedHandler_(v11, v299, (uint64_t)&unk_270E312E0);
      }
      objc_msgSend_commit(v11, v214, v215);

      int v221 = 0;
      goto LABEL_93;
    }
    FigDebugAssert3();

    BOOL v222 = 1;
    int v221 = 5;
  }
  else
  {
    FigDebugAssert3();
    int v221 = 0;
    BOOL v222 = FigSignalErrorAt() != 0;
  }
LABEL_94:
  if (v221 == 0 && v222) {
    int v221 = 4;
  }

  return v221;
}

- (int)_allocateResources
{
  CGSize v3 = self;
  uint64_t v211 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_enabledOutputArray(self, a2, v2);
  uint64_t v6 = objc_msgSend_FigMattingOutputToShortString_(FigMatting, v5, v3->_config.enabledOutputs);
  uint64_t v8 = (void *)v6;
  if (v3->_config.enabledOutputs)
  {
    v185 = (void *)v6;
    disparityTuningParameters = v3->_disparityTuningParameters;
    long long v10 = *(_OWORD *)&v3->_config.segmentationWidth;
    long long v205 = *(_OWORD *)&v3->_config.inputImageWidth;
    long long v206 = v10;
    uint64_t v11 = objc_msgSend_getSemanticConfigurationsFor_mattingConfiguration_(disparityTuningParameters, v7, (uint64_t)v4, &v205);
    semanticConfigurations = v3->_semanticConfigurations;
    v3->_semanticConfigurations = (NSDictionary *)v11;

    uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    semanticOutputCollections = v3->_semanticOutputCollections;
    v3->_semanticOutputCollections = v13;

    long long v203 = 0u;
    long long v204 = 0u;
    long long v201 = 0u;
    long long v202 = 0u;
    v186 = v4;
    id obj = v4;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v201, v210, 16);
    if (v16)
    {
      uint64_t v18 = v16;
      uint64_t v19 = *(void *)v202;
      do
      {
        uint64_t v20 = 0;
        uint64_t v187 = v18;
        do
        {
          if (*(void *)v202 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void **)(*((void *)&v201 + 1) + 8 * v20);
          if ((objc_msgSend_isEqualToNumber_(v21, v17, (uint64_t)&unk_270E33558) & 1) == 0)
          {
            unint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v3->_semanticConfigurations, v17, (uint64_t)v21);
            long long v197 = 0u;
            long long v198 = 0u;
            long long v199 = 0u;
            long long v200 = 0u;
            uint64_t v23 = v3;
            uint64_t v24 = v3->_semanticOutputCollections;
            uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v197, v209, 16);
            if (v26)
            {
              uint64_t v28 = v26;
              uint64_t v29 = *(void *)v198;
LABEL_10:
              uint64_t v30 = 0;
              while (1)
              {
                if (*(void *)v198 != v29) {
                  objc_enumerationMutation(v24);
                }
                if (objc_msgSend_add_with_(*(void **)(*((void *)&v197 + 1) + 8 * v30), v27, (uint64_t)v21, v22)) {
                  break;
                }
                if (v28 == ++v30)
                {
                  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v197, v209, 16);
                  if (v28) {
                    goto LABEL_10;
                  }
                  goto LABEL_16;
                }
              }
            }
            else
            {
LABEL_16:

              uint64_t v24 = objc_alloc_init(SemanticOutputCollection);
              objc_msgSend_add_with_(v24, v31, (uint64_t)v21, v22);
              objc_msgSend_addObject_(v23->_semanticOutputCollections, v32, (uint64_t)v24);
            }

            CGSize v3 = v23;
            uint64_t v18 = v187;
          }
          ++v20;
        }
        while (v20 != v18);
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v201, v210, 16);
      }
      while (v18);
    }

    long long v195 = 0u;
    long long v196 = 0u;
    long long v193 = 0u;
    long long v194 = 0u;
    uint64_t v33 = v3->_semanticOutputCollections;
    uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v193, v208, 16);
    if (v35)
    {
      uint64_t v38 = v35;
      char v39 = 0;
      uint64_t v40 = *(void *)v194;
      while (2)
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v194 != v40) {
            objc_enumerationMutation(v33);
          }
          id v42 = *(void **)(*((void *)&v193 + 1) + 8 * i);
          char v43 = objc_msgSend_useDepthFilter(v42, v36, v37);
          int Resources = objc_msgSend_allocateResources_(v42, v44, (uint64_t)v3->_metalContext);
          if (Resources)
          {
            uint64_t v183 = v184;
            LODWORD(v182) = Resources;
            FigDebugAssert3();

            uint64_t v8 = v185;
            uint64_t v4 = v186;
            goto LABEL_60;
          }
          v39 |= v43;
          uint64_t v48 = objc_msgSend_spatioTemporalFilter(v42, v46, v47);
          objc_msgSend_preallocatedSize(v48, v49, v50);
        }
        uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v193, v208, 16);
        if (v38) {
          continue;
        }
        break;
      }

      if (v39)
      {
        v52 = [Texture2DWrapper alloc];
        LODWORD(v53) = v3->_config.inputImageWidth;
        LODWORD(v54) = v3->_config.inputImageHeight;
        uint64_t inited = objc_msgSend_initNewTextureWithFigMetalContext_size_withFormat_usage_(v52, v55, (uint64_t)v3->_metalContext, 115, 23, (double)v53, (double)v54);
        rgbdGuide = v3->_rgbdGuide;
        v3->_rgbdGuide = (Texture2DWrapper *)inited;

        objc_msgSend_texture(v3->_rgbdGuide, v58, v59);
        uint64_t v33 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allocatedSize(v33, v60, v61);
        goto LABEL_30;
      }
    }
    else
    {
LABEL_30:
    }
    if (objc_msgSend_outputEnabled_(v3, v51, 1))
    {
      unsigned int disparityRefinementVersion = v3->_disparityRefinementVersion;
      if (disparityRefinementVersion >= 5)
      {
        unsigned int disparityRefinementVersion = 0;
        v3->_unsigned int disparityRefinementVersion = 0;
      }
      uint64_t v63 = (_OWORD *)((char *)&unk_262F52F58 + 48 * disparityRefinementVersion);
      *(_OWORD *)&v3->_disparityRefinementConfig.zeroShiftPercentile = *v63;
      *(_OWORD *)&v3->_disparityRefinementConfig.preprocessingGamma = v63[1];
      *(_OWORD *)&v3->_disparityRefinementConfig.unsigned int subsampling = v63[2];
      uint64_t v64 = [FocalPlaneV2 alloc];
      uint64_t v66 = objc_msgSend_initWithMetalContext_(v64, v65, (uint64_t)v3->_metalContext);
      focalPlane = v3->_focalPlane;
      v3->_focalPlane = (FocalPlaneV2 *)v66;

      double v70 = v3->_focalPlane;
      if (!v70)
      {
        FigDebugAssert3();
        int v178 = 0;
        uint64_t v8 = v185;
        uint64_t v4 = v186;
        goto LABEL_61;
      }
      objc_msgSend_allocateResources(v70, v68, v69);
      long long v71 = [Texture2DWrapper alloc];
      LODWORD(v72) = v3->_config.inputDisparityWidth;
      LODWORD(v73) = v3->_config.inputDisparityHeight;
      uint64_t v75 = objc_msgSend_initNewTextureWithFigMetalContext_size_withFormat_usage_(v71, v74, (uint64_t)v3->_metalContext, 25, 23, (double)v72, (double)v73);
      preprocessedDisparity = v3->_preprocessedDisparity;
      v3->_preprocessedDisparity = (Texture2DWrapper *)v75;

      uint64_t v79 = objc_msgSend_texture(v3->_preprocessedDisparity, v77, v78);
      objc_msgSend_allocatedSize(v79, v80, v81);

      unsigned int subsampling = v3->_disparityRefinementConfig.subsampling;
      unsigned int v85 = v3->_config.inputDisparityWidth / subsampling;
      if (v85 <= 1) {
        uint64_t v86 = 1;
      }
      else {
        uint64_t v86 = v85;
      }
      unsigned int v87 = v3->_config.inputDisparityHeight / subsampling;
      if (v87 <= 1) {
        uint64_t v88 = 1;
      }
      else {
        uint64_t v88 = v87;
      }
      *(float *)&double v83 = v3->_disparityRefinementConfig.epsilon;
      v89 = objc_msgSend_filterDescriptorWithWidth_height_arrayLength_kernelSpatialDiameter_kernelTemporalDiameter_epsilon_sourceChannels_guideChannels_preallocateIntermediates_(MEMORY[0x263F132D0], v82, v86, v88, 1, (2 * v3->_disparityRefinementConfig.radius) | 1, 1, 1, v83, 4, 1);
      id v90 = objc_alloc(MEMORY[0x263F132C8]);
      double v93 = objc_msgSend_device(v3->_metalContext, v91, v92);
      uint64_t v95 = objc_msgSend_initWithDevice_filterDescriptor_(v90, v94, (uint64_t)v93, v89);
      refinedDisparityFilter = v3->_refinedDisparityFilter;
      v3->_refinedDisparityFilter = (MPSImageSpatioTemporalGuidedFilter *)v95;

      uint64_t v97 = v3->_refinedDisparityFilter;
      uint64_t v100 = objc_msgSend_options(v97, v98, v99);
      objc_msgSend_setOptions_(v97, v101, v100 | 1);
      objc_msgSend_preallocatedSize(v3->_refinedDisparityFilter, v102, v103);
    }
    long long v104 = [ConstraintsGenerator alloc];
    uint64_t v106 = objc_msgSend_initWithMetalContext_(v104, v105, (uint64_t)v3->_metalContext);
    constraintsGenerator = v3->_constraintsGenerator;
    v3->_constraintsGenerator = (ConstraintsGenerator *)v106;

    id v108 = v3->_constraintsGenerator;
    *(void *)&long long v205 = *(void *)&v3->_config.segmentationWidth;
    *((void *)&v205 + 1) = 0x3DCCCCCD3F666666;
    LODWORD(v206) = 1;
    objc_msgSend_prepareForConfiguration_(v108, v109, (uint64_t)&v205);
    objc_msgSend_preallocatedSize(v3->_constraintsGenerator, v110, v111);
    segmentationsize_t Width = v3->_config.segmentationWidth;
    segmentationsize_t Height = v3->_config.segmentationHeight;
    long long v189 = 0u;
    long long v190 = 0u;
    long long v191 = 0u;
    long long v192 = 0u;
    id v114 = obj;
    uint64_t v116 = objc_msgSend_countByEnumeratingWithState_objects_count_(v114, v115, (uint64_t)&v189, v207, 16);
    if (v116)
    {
      uint64_t v118 = v116;
      double v119 = (double)segmentationWidth;
      uint64_t v120 = *(void *)v190;
      do
      {
        for (uint64_t j = 0; j != v118; ++j)
        {
          if (*(void *)v190 != v120) {
            objc_enumerationMutation(v114);
          }
          CGAffineTransform v122 = *(void **)(*((void *)&v189 + 1) + 8 * j);
          uint64_t v123 = objc_msgSend_objectForKeyedSubscript_(v3->_semanticConfigurations, v117, (uint64_t)v122);
          int v126 = objc_msgSend_constraintsEnabled(v123, v124, v125);

          if (v126)
          {
            uint64_t v128 = objc_msgSend_unsignedIntegerValue(v122, v117, v127);
            char v130 = objc_msgSend_FigMattingOutputToShortString_(FigMatting, v129, v128);
            double v131 = [Texture2DWrapper alloc];
            uint64_t v133 = objc_msgSend_initNewTextureWithFigMetalContext_size_withFormat_usage_(v131, v132, (uint64_t)v3->_metalContext, 10, 23, v119, (double)segmentationHeight);
            objc_msgSend_setObject_forKeyedSubscript_(v3->_constraintsTextures, v134, (uint64_t)v133, v122);

            double v136 = objc_msgSend_objectForKeyedSubscript_(v3->_constraintsTextures, v135, (uint64_t)v122);
            uint64_t v139 = objc_msgSend_texture(v136, v137, v138);
            objc_msgSend_allocatedSize(v139, v140, v141);
          }
        }
        uint64_t v118 = objc_msgSend_countByEnumeratingWithState_objects_count_(v114, v117, (uint64_t)&v189, v207, 16);
      }
      while (v118);
    }

    uint64_t v8 = v185;
    if (objc_msgSend_outputEnabled_(v3, v142, 8))
    {
      uint64_t v145 = 3;
      v3->_maximumNumberOfFacesToConsider = 3;
      id v146 = objc_alloc(MEMORY[0x263EFF980]);
      uint64_t v148 = objc_msgSend_initWithCapacity_(v146, v147, 3);
      preallocatedFaceNonSkinTextures = v3->_preallocatedFaceNonSkinTextures;
      v3->_preallocatedFaceNonSkinTextures = (NSMutableArray *)v148;

      do
      {
        uint64_t v150 = [Texture2DWrapper alloc];
        uint64_t v153 = objc_msgSend_initNewTextureWithFigMetalContext_size_withFormat_usage_textureArray_(v150, v151, (uint64_t)v3->_metalContext, 25, 23, 0, 256.0, 256.0);
        if (v153)
        {
          objc_msgSend_addObject_(v3->_preallocatedFaceNonSkinTextures, v152, (uint64_t)v153);
          uint64_t v156 = objc_msgSend_texture(v153, v154, v155);
          objc_msgSend_allocatedSize(v156, v157, v158);
        }
        --v145;
      }
      while (v145);
      uint64_t v160 = objc_msgSend_objectForKeyedSubscript_(v3->_semanticConfigurations, v159, (uint64_t)&unk_270E335A0);
      unsigned int v163 = objc_msgSend_width(v160, v161, v162);

      v165 = objc_msgSend_objectForKeyedSubscript_(v3->_semanticConfigurations, v164, (uint64_t)&unk_270E335A0);
      LODWORD(v160) = objc_msgSend_height(v165, v166, v167);

      v168 = [Texture2DWrapper alloc];
      uint64_t v170 = objc_msgSend_initNewTextureWithFigMetalContext_size_withFormat_usage_(v168, v169, (uint64_t)v3->_metalContext, 25, 23, (float)v163, (float)v160);
      preprocessedSkin = v3->_preprocessedSkin;
      v3->_preprocessedSkin = (Texture2DWrapper *)v170;

      v174 = objc_msgSend_texture(v3->_preprocessedSkin, v172, v173);
      objc_msgSend_allocatedSize(v174, v175, v176);
    }
    int v177 = objc_msgSend__compileShaders(v3, v143, v144);
    uint64_t v4 = v186;
    if (!v177)
    {
      int v178 = 0;
      goto LABEL_61;
    }
    uint64_t v183 = v184;
    LODWORD(v182) = v177;
  }
  else
  {
    uint64_t v183 = v184;
    LODWORD(v182) = 0;
  }
  FigDebugAssert3();
LABEL_60:
  objc_msgSend_purgeResources(v3, v179, v180, v182, v183);
  int v178 = -12786;
LABEL_61:

  return v178;
}

- (void)setOptions:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F2C618];
  id v5 = a3;
  objc_msgSend_objectForKeyedSubscript_(v5, v6, v4);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [MattingV2TuningParameters alloc];
  if (v20) {
    id v9 = (MattingV2TuningParameters *)objc_msgSend_initWithTuningDictionary_(v7, v8, (uint64_t)v20);
  }
  else {
    id v9 = (MattingV2TuningParameters *)objc_msgSend_initWithDefaults(v7, v8, 0);
  }
  disparityTuningParameters = self->_disparityTuningParameters;
  self->_disparityTuningParameters = v9;

  id v12 = objc_msgSend_objectForKeyedSubscript_(v5, v11, @"SDOFRenderingParameters");

  if (v12)
  {
    id v14 = objc_msgSend_objectForKeyedSubscript_(v12, v13, @"DisparityRefinement");
    uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v14, v15, @"version");

    if (v16) {
      int v19 = objc_msgSend_intValue(v16, v17, v18);
    }
    else {
      int v19 = 0;
    }
    self->_unsigned int disparityRefinementVersion = v19;
  }
  else
  {
    self->_unsigned int disparityRefinementVersion = 0;
  }
}

- (int)_compileShaders
{
  objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, a2, @"copyTexture", 0);
  CGSize v3 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  copyTextureKernel = self->_copyTextureKernel;
  self->_copyTextureKernel = v3;

  if (self->_copyTextureKernel)
  {
    objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v5, @"bilinearScale", 0);
    uint64_t v6 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    bilinearScaleKernel = self->_bilinearScaleKernel;
    self->_bilinearScaleKernel = v6;

    if (self->_bilinearScaleKernel)
    {
      objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v8, @"composeRGBAGuide", 0);
      id v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      composeRGBAGuideKernel = self->_composeRGBAGuideKernel;
      self->_composeRGBAGuideKernel = v9;

      if (self->_composeRGBAGuideKernel)
      {
        objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v11, @"addTextures", 0);
        id v12 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
        addTexturesKernel = self->_addTexturesKernel;
        self->_addTexturesKernel = v12;

        if (self->_addTexturesKernel)
        {
          objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v14, @"excludeNonSkin", 0);
          uint64_t v15 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
          excludeNonSkinKernel = self->_excludeNonSkinKernel;
          self->_excludeNonSkinKernel = v15;

          if (self->_excludeNonSkinKernel) {
            return 0;
          }
        }
      }
    }
  }
  FigDebugAssert3();
  return -12786;
}

- (id)_createTextureOfSize:(CGSize)a3 withFormat:(unint64_t)a4
{
  id v5 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], a2, a4, (unint64_t)a3.width, (unint64_t)a3.height, 0);
  objc_msgSend_setUsage_(v5, v6, 3);
  id v9 = objc_msgSend_device(self->_metalContext, v7, v8);
  uint64_t v11 = objc_msgSend_newTextureWithDescriptor_(v9, v10, (uint64_t)v5);

  return v11;
}

+ (id)FigMattingOutputToShortString:(unsigned int)a3
{
  return &stru_270E31620;
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (__CVBuffer)imagePixelBuffer
{
  return self->_imagePixelBuffer;
}

- (void)setImagePixelBuffer:(__CVBuffer *)a3
{
  self->_imagePixelBuffer = a3;
}

- (__CVBuffer)inputSegmentationPixelBuffer
{
  return self->_inputSegmentationPixelBuffer;
}

- (void)setInputSegmentationPixelBuffer:(__CVBuffer *)a3
{
  self->_inputSegmentationPixelBuffer = a3;
}

- (__CVBuffer)inputDisparityPixelBuffer
{
  return self->_inputDisparityPixelBuffer;
}

- (void)setInputDisparityPixelBuffer:(__CVBuffer *)a3
{
  self->_inputDisparityPixelBuffer = a3;
}

- (__CVBuffer)inputDepthPixelBuffer
{
  return self->_inputDepthPixelBuffer;
}

- (void)setInputDepthPixelBuffer:(__CVBuffer *)a3
{
  self->_inputDepthPixelBuffer = a3;
}

- (__CVBuffer)inputSemanticsHairPixelBuffer
{
  return self->_inputSemanticsHairPixelBuffer;
}

- (void)setInputSemanticsHairPixelBuffer:(__CVBuffer *)a3
{
  self->_inputSemanticsHairPixelBuffer = a3;
}

- (__CVBuffer)inputSemanticsSkinPixelBuffer
{
  return self->_inputSemanticsSkinPixelBuffer;
}

- (void)setInputSemanticsSkinPixelBuffer:(__CVBuffer *)a3
{
  self->_inputSemanticsSkinPixelBuffer = a3;
}

- (__CVBuffer)inputSemanticsTeethPixelBuffer
{
  return self->_inputSemanticsTeethPixelBuffer;
}

- (void)setInputSemanticsTeethPixelBuffer:(__CVBuffer *)a3
{
  self->_inputSemanticsTeethPixelBuffer = a3;
}

- (__CVBuffer)inputSemanticsGlassesPixelBuffer
{
  return self->_inputSemanticsGlassesPixelBuffer;
}

- (void)setInputSemanticsGlassesPixelBuffer:(__CVBuffer *)a3
{
  self->_inputSemanticsGlassesPixelBuffer = a3;
}

- (__CVBuffer)inputSemanticsSkyPixelBuffer
{
  return self->_inputSemanticsSkyPixelBuffer;
}

- (void)setInputSemanticsSkyPixelBuffer:(__CVBuffer *)a3
{
  self->_inputSemanticsSkyPixelBuffer = a3;
}

- (__CVBuffer)outputRefinedDisparityPixelBuffer
{
  return self->_outputRefinedDisparityPixelBuffer;
}

- (void)setOutputRefinedDisparityPixelBuffer:(__CVBuffer *)a3
{
  self->_outputRefinedDisparityPixelBuffer = a3;
}

- (__CVBuffer)outputMattePixelBuffer
{
  return self->_outputMattePixelBuffer;
}

- (void)setOutputMattePixelBuffer:(__CVBuffer *)a3
{
  self->_outputMattePixelBuffer = a3;
}

- (__CVBuffer)outputSemanticsHairPixelBuffer
{
  return self->_outputSemanticsHairPixelBuffer;
}

- (void)setOutputSemanticsHairPixelBuffer:(__CVBuffer *)a3
{
  self->_outputSemanticsHairPixelBuffer = a3;
}

- (__CVBuffer)outputSemanticsSkinPixelBuffer
{
  return self->_outputSemanticsSkinPixelBuffer;
}

- (void)setOutputSemanticsSkinPixelBuffer:(__CVBuffer *)a3
{
  self->_outputSemanticsSkinPixelBuffer = a3;
}

- (__CVBuffer)outputSemanticsTeethPixelBuffer
{
  return self->_outputSemanticsTeethPixelBuffer;
}

- (void)setOutputSemanticsTeethPixelBuffer:(__CVBuffer *)a3
{
  self->_outputSemanticsTeethPixelBuffer = a3;
}

- (__CVBuffer)outputSemanticsGlassesPixelBuffer
{
  return self->_outputSemanticsGlassesPixelBuffer;
}

- (void)setOutputSemanticsGlassesPixelBuffer:(__CVBuffer *)a3
{
  self->_outputSemanticsGlassesPixelBuffer = a3;
}

- (__CVBuffer)outputSemanticsSkyPixelBuffer
{
  return self->_outputSemanticsSkyPixelBuffer;
}

- (void)setOutputSemanticsSkyPixelBuffer:(__CVBuffer *)a3
{
  self->_outputSemanticsSkyPixelBuffer = a3;
}

- (NSDictionary)options
{
  return self->_options;
}

- ($55C9923F75B8441B2F861846195B697A)config
{
  long long v3 = *(_OWORD *)&self[15].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[14].var4;
  *(_OWORD *)&retstr->var4 = v3;
  return self;
}

- (void)setConfig:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_config.inputImagesize_t Width = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_config.segmentationsize_t Width = v3;
}

- (CGRect)syntheticFocusRectangle
{
  double x = self->_syntheticFocusRectangle.origin.x;
  double y = self->_syntheticFocusRectangle.origin.y;
  double width = self->_syntheticFocusRectangle.size.width;
  double height = self->_syntheticFocusRectangle.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSyntheticFocusRectangle:(CGRect)a3
{
  self->_syntheticFocusRectangle = a3;
}

- (NSArray)faceLandmarks
{
  return self->_faceLandmarks;
}

- (void)setFaceLandmarks:(id)a3
{
}

- (NSArray)faceSegments
{
  return self->_faceSegments;
}

- (void)setFaceSegments:(id)a3
{
}

- (int)exifOrientation
{
  return self->_exifOrientation;
}

- (void)setExifOrientation:(int)a3
{
  self->_int exifOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceSegments, 0);
  objc_storeStrong((id *)&self->_faceLandmarks, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_excludeNonSkinKernel, 0);
  objc_storeStrong((id *)&self->_addTexturesKernel, 0);
  objc_storeStrong((id *)&self->_composeRGBAGuideKernel, 0);
  objc_storeStrong((id *)&self->_bilinearScaleKernel, 0);
  objc_storeStrong((id *)&self->_copyTextureKernel, 0);
  objc_storeStrong((id *)&self->_disparityTuningParameters, 0);
  objc_storeStrong((id *)&self->_refinedDisparityFilter, 0);
  objc_storeStrong((id *)&self->_semanticOutputCollections, 0);
  objc_storeStrong((id *)&self->_focalPlane, 0);
  objc_storeStrong((id *)&self->_constraintsGenerator, 0);
  objc_storeStrong((id *)&self->_semanticConfigurations, 0);
  objc_storeStrong((id *)&self->_faceNonSkinTextures, 0);
  objc_storeStrong((id *)&self->_preallocatedFaceNonSkinTextures, 0);
  objc_storeStrong((id *)&self->_constraintsTextures, 0);
  objc_storeStrong((id *)&self->_destinationTextures, 0);
  objc_storeStrong((id *)&self->_sourceTextures, 0);
  objc_storeStrong((id *)&self->_rgbdGuide, 0);
  objc_storeStrong((id *)&self->_refinedDisparityGuide, 0);
  objc_storeStrong((id *)&self->_preprocessedSkin, 0);
  objc_storeStrong((id *)&self->_preprocessedDisparity, 0);
  objc_storeStrong((id *)&self->_inputDepth, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end