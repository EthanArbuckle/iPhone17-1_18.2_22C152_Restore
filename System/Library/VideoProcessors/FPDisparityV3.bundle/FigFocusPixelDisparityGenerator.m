@interface FigFocusPixelDisparityGenerator
- (BOOL)qualityEstimationEnabled;
- (CGRect)focusPixelValidArea;
- (FigFocusPixelDisparityGenerator)init;
- (FigFocusPixelDisparityGenerator)initWithCommandQueue:(id)a3;
- (FigMetalContext)metalContext;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)focusPixelMetadata;
- (NSDictionary)options;
- (NSDictionary)tuningParameters;
- (__CVBuffer)H0;
- (__CVBuffer)H1;
- (__CVBuffer)V0;
- (__CVBuffer)V1;
- (__CVBuffer)binaryLambdaPixelBuffer;
- (__CVBuffer)focusPixelBuffer;
- (__CVBuffer)outDisparity;
- (__CVBuffer)personSegmentationConfidencePixelBuffer;
- (__CVBuffer)personSegmentationPixelBuffer;
- (__CVBuffer)rawImagePixelBufferBuffer;
- (id)_createTextureOfWidth:(unsigned int)a3 andHeight:(unsigned int)a4 withFormat:(unint64_t)a5;
- (id)_createTextureOfWidth:(unsigned int)a3 andHeight:(unsigned int)a4 withFormat:(unint64_t)a5 textureUsage:(unint64_t)a6;
- (int)_allocateResources;
- (int)_allocateTextures;
- (int)_computeDisparityQuality:(int *)a3;
- (int)_downscale2X420fTBGRAEqualWithCommandBuffer:(id)a3 in_Ytex:(id)a4 in_UVtex:(id)a5 out_tex:(id)a6 cropRect:(CGRect)a7;
- (int)_extractFocusPixelMetadata;
- (int)_initShaders;
- (int)_populateImagePyramidFrom420fPixelBuffer:(__CVBuffer *)a3 cropRect:(CGRect)a4;
- (int)_populateImagePyramidFrom:(id)a3;
- (int)_populateRawGreenChannelPyramid;
- (int)_setupImagePyramid;
- (int)disparityQuality;
- (int)finishProcessing;
- (int)getFPBuffersSizeFromOptions:(id)a3;
- (int)getFrameSizesFromOptions:(id)a3;
- (int)getPatternDetailsFrom:(id)a3 outTypeName:(id *)a4 outCountX:(unsigned int *)a5 outCountY:(unsigned int *)a6 outStartX:(unsigned int *)a7 outStartY:(unsigned int *)a8 outStepX:(unsigned int *)a9 outStepY:(unsigned int *)a10;
- (int)getSequenceDetailsFrom:(id)a3 withName:(id)a4 outCount:(unsigned int *)a5 outStart:(unsigned int *)a6 outStep:(unsigned int *)a7;
- (int)mapPixelTypeNameToDirection:(id)a3;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)prewarmWithTuningParameters:(id)a3;
- (int)process;
- (int)purgeResources;
- (int)readSizeFromDictionary:(id)a3 toWidth:(unsigned int *)a4 toHeight:(unsigned int *)a5;
- (int)resetState;
- (int)setup;
- (opaqueCMSampleBuffer)imageSampleBuffer;
- (void)_overrideTuningParametersForFactory;
- (void)dealloc;
- (void)setBinaryLambdaPixelBuffer:(__CVBuffer *)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setFocusPixelBuffer:(__CVBuffer *)a3;
- (void)setFocusPixelMetadata:(id)a3;
- (void)setFocusPixelValidArea:(CGRect)a3;
- (void)setH0:(__CVBuffer *)a3;
- (void)setH1:(__CVBuffer *)a3;
- (void)setImageSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setMetalContext:(id)a3;
- (void)setOptions:(id)a3;
- (void)setOutDisparity:(__CVBuffer *)a3;
- (void)setPersonSegmentationConfidencePixelBuffer:(__CVBuffer *)a3;
- (void)setPersonSegmentationPixelBuffer:(__CVBuffer *)a3;
- (void)setQualityEstimationEnabled:(BOOL)a3;
- (void)setRawImagePixelBufferBuffer:(__CVBuffer *)a3;
- (void)setTuningParameters:(id)a3;
- (void)setV0:(__CVBuffer *)a3;
- (void)setV1:(__CVBuffer *)a3;
@end

@implementation FigFocusPixelDisparityGenerator

- (int)prewarm
{
  return 0;
}

- (int)setup
{
  return 0;
}

- (int)_allocateResources
{
  int v4 = objc_msgSend__setupImagePyramid(self, a2, v2);
  if (v4)
  {
    int v26 = v4;
    fig_log_get_emitter();
LABEL_17:
    FigDebugAssert3();
    return v26;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  memset(v31, 0, sizeof(v31));
  uint64_t v32 = 0;
  uint64_t v28 = *(void *)&self->_gTopLevelDisparityWidth;
  LODWORD(v29) = self->gNumViews;
  uint64_t v6 = *(void *)&self->gVxFocusPixelViewWidth;
  *((void *)&v29 + 1) = *(void *)&self->gHxFocusPixelViewWidth;
  *(void *)&long long v30 = *((void *)&v29 + 1);
  *((void *)&v30 + 1) = v6;
  *(void *)&v31[0] = v6;
  objc_msgSend_setImagePyramid_(self->_fpDisparityEstimator, v5, (uint64_t)self->_pyr_image);
  if (self->_correctionBasisCoefficientsPresent)
  {
    BYTE4(v32) = 1;
    long long v8 = *(_OWORD *)&self->_correctionBasisCoefficients[4];
    *(_OWORD *)((char *)v31 + 8) = *(_OWORD *)self->_correctionBasisCoefficients;
    *(_OWORD *)((char *)&v31[1] + 8) = v8;
    *((void *)&v31[2] + 1) = *(void *)&self->_correctionBasisCoefficients[8];
  }
  if (self->_processingType == 1) {
    BYTE4(v32) = 0;
  }
  int Resources = objc_msgSend_allocateResources_(self->_fpDisparityEstimator, v7, (uint64_t)&v28);
  if (Resources
    || (int Resources = objc_msgSend__allocateTextures(self, v10, v11)) != 0
    || (int Resources = objc_msgSend_allocateResources(self->_fpdDemosaic, v12, v13)) != 0)
  {
    int v26 = Resources;
    fig_log_get_emitter();
    goto LABEL_17;
  }
  if (!self->_qualityEstimationEnabled) {
    goto LABEL_12;
  }
  v16 = objc_msgSend_device(self->_metalContext, v14, v15);
  v18 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v16, v17, 8, 0);
  disparitySumBuffer = self->_disparitySumBuffer;
  self->_disparitySumBuffer = v18;

  if (!self->_disparitySumBuffer) {
    goto LABEL_18;
  }
  v22 = objc_msgSend_device(self->_metalContext, v20, v21);
  v24 = (MTLBuffer *)objc_msgSend_newBufferWithLength_options_(v22, v23, 8, 0);
  disparityCountBuffer = self->_disparityCountBuffer;
  self->_disparityCountBuffer = v24;

  if (self->_disparityCountBuffer)
  {
LABEL_12:
    int v26 = 0;
    if (self->_processingType == 2) {
      self->_disparityPixelBufferForCalibration = (__CVBuffer *)CreatePixelBuffer();
    }
  }
  else
  {
LABEL_18:
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12786;
  }
  return v26;
}

- (int)_allocateTextures
{
  if (self->_processingType != 1)
  {
    uint64_t gHxFocusPixelViewWidth = self->gHxFocusPixelViewWidth;
    uint64_t gVxFocusPixelViewWidth = self->gVxFocusPixelViewWidth;
    uint64_t gVxFocusPixelViewHeight = self->gVxFocusPixelViewHeight;
    if (gHxFocusPixelViewWidth)
    {
      uint64_t gHxFocusPixelViewHeight = self->gHxFocusPixelViewHeight;
      objc_msgSend__createTextureOfWidth_andHeight_withFormat_(self, a2, self->gHxFocusPixelViewWidth, gHxFocusPixelViewHeight, 25);
      v7 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      long long v8 = self->_focusPixelViews[0];
      self->_focusPixelViews[0] = v7;

      if (!self->_focusPixelViews[0]) {
        goto LABEL_14;
      }
      objc_msgSend__createTextureOfWidth_andHeight_withFormat_(self, v9, gHxFocusPixelViewWidth, gHxFocusPixelViewHeight, 25);
      v10 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = self->_focusPixelViews[1];
      self->_focusPixelViews[1] = v10;

      if (!self->_focusPixelViews[1]) {
        goto LABEL_14;
      }
    }
    if (gVxFocusPixelViewWidth)
    {
      objc_msgSend__createTextureOfWidth_andHeight_withFormat_(self, a2, gVxFocusPixelViewWidth, gVxFocusPixelViewHeight, 25);
      v12 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = self->_focusPixelViews[2];
      self->_focusPixelViews[2] = v12;

      if (!self->_focusPixelViews[2]) {
        goto LABEL_14;
      }
      objc_msgSend__createTextureOfWidth_andHeight_withFormat_(self, v14, gVxFocusPixelViewWidth, gVxFocusPixelViewHeight, 25);
      uint64_t v15 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      v16 = self->_focusPixelViews[3];
      self->_focusPixelViews[3] = v15;

      if (!self->_focusPixelViews[3]) {
        goto LABEL_14;
      }
    }
  }
  PixelBuffer = (__CVBuffer *)CreatePixelBuffer();
  self->_greenChannelPyramidCVP[0] = PixelBuffer;
  if (!PixelBuffer) {
    goto LABEL_14;
  }
  objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v18, (uint64_t)PixelBuffer, 25, 23, 0);
  v19 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  gChannelTexture = self->_gChannelTexture;
  self->_gChannelTexture = v19;

  if (!self->_gChannelTexture
    || (id v21 = objc_alloc(MEMORY[0x263EFF980]),
        v23 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v21, v22, 8),
        greenChannelPyramid = self->_greenChannelPyramid,
        self->_greenChannelPyramid = v23,
        greenChannelPyramid,
        (int v26 = self->_greenChannelPyramid) == 0))
  {
LABEL_14:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v44 = FigSignalErrorAt();
    goto LABEL_21;
  }
  objc_msgSend_setObject_atIndexedSubscript_(v26, v25, (uint64_t)self->_gChannelTexture, 0);
  p_gTopLevelImageWidth = (uint32x2_t *)&self->_gTopLevelImageWidth;
  uint64_t v28 = 1;
  float32x2_t v29 = (float32x2_t)vdup_n_s32(0x3F4CCCCDu);
  while (1)
  {
    unint64_t v30 = *(void *)&vadd_s32((int32x2_t)vcvt_u32_f32(vrnda_f32(vmul_f32(vcvt_f32_u32(*p_gTopLevelImageWidth), v29))), (int32x2_t)0x100000001) & 0xFFFFFFFEFFFFFFFELL;
    uint32x2_t *p_gTopLevelImageWidth = (uint32x2_t)v30;
    if (v28 == 1)
    {
      v31 = (__CVBuffer *)CreatePixelBuffer();
      self->_greenChannelPyramidCVP[1] = v31;
      v33 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v32, (uint64_t)v31, 25, 23, 0);
      objc_msgSend_setObject_atIndexedSubscript_(self->_greenChannelPyramid, v34, (uint64_t)v33, 1);

      v36 = objc_msgSend_objectAtIndexedSubscript_(self->_greenChannelPyramid, v35, 1);

      if (!v36) {
        goto LABEL_14;
      }
      goto LABEL_17;
    }
    v37 = objc_msgSend__createTextureOfWidth_andHeight_withFormat_textureUsage_(self, (const char *)HIDWORD(v30), v30, HIDWORD(v30), 25, 7);
    objc_msgSend_setObject_atIndexedSubscript_(self->_greenChannelPyramid, v38, (uint64_t)v37, v28);

    v40 = objc_msgSend_stringWithFormat_(NSString, v39, @"_greenChannelPyramid[%d] is nil", v28);
    v42 = objc_msgSend_objectAtIndexedSubscript_(self->_greenChannelPyramid, v41, v28);

    if (!v42) {
      break;
    }

LABEL_17:
    if (++v28 == 8) {
      return 0;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  int v44 = FigSignalErrorAt();

LABEL_21:
  if (v44)
  {
    v45 = self->_focusPixelViews[0];
    self->_focusPixelViews[0] = 0;

    v46 = self->_focusPixelViews[1];
    self->_focusPixelViews[1] = 0;

    v47 = self->_focusPixelViews[2];
    self->_focusPixelViews[2] = 0;

    v48 = self->_focusPixelViews[3];
    self->_focusPixelViews[3] = 0;

    v49 = self->_gChannelTexture;
    self->_gChannelTexture = 0;

    v50 = self->_greenChannelPyramid;
    self->_greenChannelPyramid = 0;

    v51 = self->_greenChannelPyramidCVP[0];
    if (v51)
    {
      CFRelease(v51);
      self->_greenChannelPyramidCVP[0] = 0;
    }
    v52 = self->_greenChannelPyramidCVP[1];
    if (v52)
    {
      CFRelease(v52);
      self->_greenChannelPyramidCVP[1] = 0;
    }
  }
  return v44;
}

- (id)_createTextureOfWidth:(unsigned int)a3 andHeight:(unsigned int)a4 withFormat:(unint64_t)a5
{
  return (id)objc_msgSend__createTextureOfWidth_andHeight_withFormat_textureUsage_(self, a2, *(uint64_t *)&a3, *(void *)&a4, a5, 3);
}

- (id)_createTextureOfWidth:(unsigned int)a3 andHeight:(unsigned int)a4 withFormat:(unint64_t)a5 textureUsage:(unint64_t)a6
{
  long long v8 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], a2, a5, a3, a4, 0);
  objc_msgSend_setUsage_(v8, v9, a6);
  v12 = objc_msgSend_device(self->_metalContext, v10, v11);
  v14 = objc_msgSend_newTextureWithDescriptor_(v12, v13, (uint64_t)v8);

  return v14;
}

- (int)_setupImagePyramid
{
  unsigned int gTopLevelDisparityHeight = self->_gTopLevelDisparityHeight;
  p_gGuideImageWidth = (uint32x2_t *)&self->_gGuideImageWidth;
  int v5 = (int)(float)(logf((float)self->_gTopLevelDisparityWidth / (float)self->_gGuideImageWidth) / -0.69315);
  int v7 = (int)(float)(logf((float)gTopLevelDisparityHeight / (float)self->_gGuideImageHeight) / -0.69315);
  if (v5 < v7) {
    LOBYTE(v7) = v5;
  }
  *(float *)v8.i32 = (float)(1 << v7);
  int32x2_t v17 = v8;
  objc_msgSend_setUseAntialiasingForDownsamplingToFinestResolution_(self->_pyr_image, v6, 0);
  float64x2_t v9 = vcvtq_f64_f32(vrndm_f32(vdiv_f32(vcvt_f32_u32(*p_gGuideImageWidth), (float32x2_t)vdup_lane_s32(v17, 0))));
  double v10 = v9.f64[1];
  double v18 = v9.f64[0];
  int v12 = objc_msgSend_populatePyramidSchemeFromResolution_toResolution_scalingFactor_scales_allowSuccessiveDownscale2x_(self->_pyr_image, v11, 8, 0);
  if (v12)
  {
    int ResourcesWithMaxInputResolution = v12;
    fig_log_get_emitter();
LABEL_8:
    FigDebugAssert3();
    return ResourcesWithMaxInputResolution;
  }
  int ResourcesWithMaxInputResolution = objc_msgSend_allocateResourcesWithMaxInputResolution_(self->_pyr_image, v13, v14, v18, v10);
  if (ResourcesWithMaxInputResolution)
  {
    fig_log_get_emitter();
    goto LABEL_8;
  }
  return ResourcesWithMaxInputResolution;
}

- (FigFocusPixelDisparityGenerator)init
{
  return (FigFocusPixelDisparityGenerator *)MEMORY[0x270F9A6D0](self, sel_initWithCommandQueue_, 0);
}

- (FigFocusPixelDisparityGenerator)initWithCommandQueue:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FigFocusPixelDisparityGenerator;
  id v5 = [(FigFocusPixelDisparityGenerator *)&v30 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263F086E0];
    uint64_t v7 = objc_opt_class();
    float64x2_t v9 = objc_msgSend_bundleForClass_(v6, v8, v7);
    id v10 = objc_alloc(MEMORY[0x263F2EE30]);
    uint64_t inited = objc_msgSend_initWithbundle_andOptionalCommandQueue_(v10, v11, (uint64_t)v9, v4);
    uint64_t v13 = (void *)*((void *)v5 + 43);
    *((void *)v5 + 43) = inited;

    if (!*((void *)v5 + 43)) {
      goto LABEL_10;
    }
    if (objc_msgSend__initShaders(v5, v14, v15)) {
      goto LABEL_10;
    }
    v16 = [FocusPixelDisparityDemosaic alloc];
    uint64_t v18 = objc_msgSend_initWithMetalContext_(v16, v17, *((void *)v5 + 43));
    v19 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v18;

    if (!*((void *)v5 + 8)) {
      goto LABEL_10;
    }
    v20 = [PyrGPU alloc];
    uint64_t v22 = objc_msgSend_initWithMetalContext_(v20, v21, *((void *)v5 + 43));
    v23 = (void *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v22;

    if (!*((void *)v5 + 9)
      || (v24 = [FPDisparityEstimator alloc],
          uint64_t v26 = objc_msgSend_initWithMetalContext_(v24, v25, *((void *)v5 + 43)),
          v27 = (void *)*((void *)v5 + 10),
          *((void *)v5 + 10) = v26,
          v27,
          !*((void *)v5 + 10)))
    {
LABEL_10:
      fig_log_get_emitter();
      FigDebugAssert3();

      uint64_t v28 = 0;
      goto LABEL_9;
    }
    *((void *)v5 + 6) = 0;
    *((void *)v5 + 7) = 0;
  }
  uint64_t v28 = (FigFocusPixelDisparityGenerator *)v5;
LABEL_9:

  return v28;
}

- (int)prewarmWithTuningParameters:(id)a3
{
  return 0;
}

- (void)setOptions:(id)a3
{
  id v43 = a3;
  objc_storeStrong((id *)&self->_options, a3);
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(v43, v5, *MEMORY[0x263F2C610]);
  uint64_t v7 = *MEMORY[0x263F2C240];
  float64x2_t v9 = objc_msgSend_objectForKeyedSubscript_(v6, v8, *MEMORY[0x263F2C240]);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v9, v10, *MEMORY[0x263F2DF28]);
  objc_msgSend_objectForKeyedSubscript_(v11, v12, *MEMORY[0x263F2C460]);
  uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  moduleSerialNumber = self->_moduleSerialNumber;
  self->_moduleSerialNumber = v13;

  uint64_t v15 = *MEMORY[0x263F2C618];
  int32x2_t v17 = objc_msgSend_objectForKeyedSubscript_(v43, v16, *MEMORY[0x263F2C618]);
  v19 = objc_msgSend_objectForKeyedSubscript_(v17, v18, @"FPDisparity");

  if (v19
    || (objc_msgSend_objectForKeyedSubscript_(v43, v20, v15), (v19 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v21 = [FocusPixelDisparityTuningParameters alloc];
    v23 = (FocusPixelDisparityTuningParameters *)objc_msgSend_initWithTuningDictionary_cameraInfoByPortType_(v21, v22, (uint64_t)v19, v6);
    fpDisparityTuningParameters = self->_fpDisparityTuningParameters;
    self->_fpDisparityTuningParameters = v23;

    v27 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v25, v26);
    objc_msgSend_setFpDisparityEstimatorParams_(self->_fpDisparityEstimator, v28, (uint64_t)v27);
  }
  else
  {
    v27 = self->_fpDisparityTuningParameters;
    self->_fpDisparityTuningParameters = 0;
  }

  self->_correctionBasisCoefficientsPresent = 0;
  objc_super v30 = objc_msgSend_objectForKeyedSubscript_(v19, v29, @"use_correction");
  int v33 = objc_msgSend_BOOLValue(v30, v31, v32);

  if (v33)
  {
    v35 = objc_msgSend_objectForKeyedSubscript_(v6, v34, v7);
    v37 = objc_msgSend_objectForKeyedSubscript_(v35, v36, *MEMORY[0x263F2C0D8]);

    if (v37)
    {
      id v38 = v37;
      uint64_t v41 = objc_msgSend_bytes(v38, v39, v40);
      for (uint64_t i = 0; i != 10; ++i)
        self->_correctionBasisCoefficients[i] = *(float *)(v41 + 4 + i * 4);
      self->_correctionBasisCoefficientsPresent = 1;
    }
  }
}

- (void)dealloc
{
  objc_msgSend_waitForIdle(self->_metalContext, a2, v2);
  objc_msgSend_purgeResources(self, v4, v5);
  v6.receiver = self;
  v6.super_class = (Class)FigFocusPixelDisparityGenerator;
  [(FigFocusPixelDisparityGenerator *)&v6 dealloc];
}

- (int)purgeResources
{
  v3 = self->_greenChannelPyramidCVP[0];
  if (v3)
  {
    CFRelease(v3);
    self->_greenChannelPyramidCVP[0] = 0;
  }
  id v4 = self->_greenChannelPyramidCVP[1];
  if (v4)
  {
    CFRelease(v4);
    self->_greenChannelPyramidCVP[1] = 0;
  }
  disparityPixelBufferForCalibration = self->_disparityPixelBufferForCalibration;
  if (disparityPixelBufferForCalibration)
  {
    CFRelease(disparityPixelBufferForCalibration);
    self->_disparityPixelBufferForCalibration = 0;
  }
  greenChannelPyramid = self->_greenChannelPyramid;
  self->_greenChannelPyramid = 0;

  uint64_t v7 = self->_focusPixelViews[0];
  self->_focusPixelViews[0] = 0;

  int32x2_t v8 = self->_focusPixelViews[1];
  self->_focusPixelViews[1] = 0;

  float64x2_t v9 = self->_focusPixelViews[2];
  self->_focusPixelViews[2] = 0;

  id v10 = self->_focusPixelViews[3];
  self->_focusPixelViews[3] = 0;

  gChannelTexture = self->_gChannelTexture;
  self->_gChannelTexture = 0;

  rawImageTexture = self->_rawImageTexture;
  self->_rawImageTexture = 0;

  segmentationTexture = self->_segmentationTexture;
  self->_segmentationTexture = 0;

  segmentationConfidenceTexture = self->_segmentationConfidenceTexture;
  self->_segmentationConfidenceTexture = 0;

  return 0;
}

- (int)finishProcessing
{
  objc_msgSend_waitForIdle(self->_metalContext, a2, v2);
  return 0;
}

- (int)resetState
{
  return 0;
}

- (int)getSequenceDetailsFrom:(id)a3 withName:(id)a4 outCount:(unsigned int *)a5 outStart:(unsigned int *)a6 outStep:(unsigned int *)a7
{
  char v18 = 0;
  id v10 = objc_msgSend_objectForKeyedSubscript_(a3, a2, (uint64_t)a4);
  int v12 = v10;
  if (!v10)
  {
    fig_log_get_emitter();
LABEL_15:
    FigDebugAssert3();
    int v16 = FigSignalErrorAt();
    goto LABEL_12;
  }
  if (a5)
  {
    unsigned int v13 = objc_msgSend_cmi_unsignedIntValueForKey_defaultValue_found_(v10, v11, @"Count", 0, &v18);
    if (!v18) {
      goto LABEL_14;
    }
    *a5 = v13;
  }
  if (!a6) {
    goto LABEL_8;
  }
  unsigned int v14 = objc_msgSend_cmi_unsignedIntValueForKey_defaultValue_found_(v12, v11, @"Start", 0, &v18);
  if (!v18)
  {
LABEL_14:
    fig_log_get_emitter();
    goto LABEL_15;
  }
  *a6 = v14;
LABEL_8:
  if (!a7)
  {
    int v16 = 0;
    goto LABEL_12;
  }
  unsigned int v15 = objc_msgSend_cmi_unsignedIntValueForKey_defaultValue_found_(v12, v11, @"Step", 0, &v18);
  if (!v18) {
    goto LABEL_14;
  }
  int v16 = 0;
  *a7 = v15;
LABEL_12:

  return v16;
}

- (int)getPatternDetailsFrom:(id)a3 outTypeName:(id *)a4 outCountX:(unsigned int *)a5 outCountY:(unsigned int *)a6 outStartX:(unsigned int *)a7 outStartY:(unsigned int *)a8 outStepX:(unsigned int *)a9 outStepY:(unsigned int *)a10
{
  id v16 = a3;
  char v18 = v16;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v25 = 0;
  if (a4)
  {
    v19 = objc_msgSend_objectForKeyedSubscript_(v16, v17, @"PixelType");
    if (!v19)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v23 = FigSignalErrorAt();
      id v20 = 0;
      goto LABEL_26;
    }
    id v20 = v19;
    *a4 = v20;
  }
  else
  {
    id v20 = 0;
  }
  if (a5 || a7 || a9)
  {
    int SequenceDetailsFrom_withName_outCount_outStart_outStep = objc_msgSend_getSequenceDetailsFrom_withName_outCount_outStart_outStep_(self, v17, (uint64_t)v18, @"X", (char *)&v27 + 4, &v27, (char *)&v26 + 4);
    if (SequenceDetailsFrom_withName_outCount_outStart_outStep)
    {
      int v23 = SequenceDetailsFrom_withName_outCount_outStart_outStep;
      fig_log_get_emitter();
LABEL_30:
      FigDebugAssert3();
      goto LABEL_26;
    }
    if (a5) {
      *a5 = HIDWORD(v27);
    }
    if (a7) {
      *a7 = v27;
    }
    if (a9) {
      *a9 = HIDWORD(v26);
    }
  }
  if (!a6 && !a8 && !a10)
  {
LABEL_25:
    int v23 = 0;
    goto LABEL_26;
  }
  int v22 = objc_msgSend_getSequenceDetailsFrom_withName_outCount_outStart_outStep_(self, v17, (uint64_t)v18, @"Y", &v26, (char *)&v25 + 4, &v25);
  if (v22)
  {
    int v23 = v22;
    fig_log_get_emitter();
    goto LABEL_30;
  }
  if (a6) {
    *a6 = v26;
  }
  if (a8) {
    *a8 = HIDWORD(v25);
  }
  if (!a10) {
    goto LABEL_25;
  }
  int v23 = 0;
  *a10 = v25;
LABEL_26:

  return v23;
}

- (int)readSizeFromDictionary:(id)a3 toWidth:(unsigned int *)a4 toHeight:(unsigned int *)a5
{
  id v7 = a3;
  float64x2_t v9 = v7;
  char v12 = 0;
  if (a4)
  {
    *a4 = objc_msgSend_cmi_intValueForKey_defaultValue_found_(v7, v8, @"width", 0, &v12);
    if (!v12) {
      goto LABEL_8;
    }
  }
  if (a5)
  {
    int v10 = 0;
    *a5 = objc_msgSend_cmi_intValueForKey_defaultValue_found_(v9, v8, @"height", 0, &v12);
    if (!v12)
    {
LABEL_8:
      fig_log_get_emitter();
      FigDebugAssert3();
      int v10 = FigSignalErrorAt();
    }
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (int)getFrameSizesFromOptions:(id)a3
{
  id v4 = objc_msgSend_objectForKeyedSubscript_(a3, a2, *MEMORY[0x263F2C618]);
  objc_super v6 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"sizes");

  if (!v6)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v19 = FigSignalErrorAt();
    float64x2_t v9 = 0;
LABEL_15:
    char v12 = 0;
LABEL_18:
    unsigned int v15 = 0;
LABEL_19:
    int32x2_t v17 = 0;
    goto LABEL_11;
  }
  float64x2_t v9 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"green_size");
  if (!v9)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v19 = FigSignalErrorAt();
    goto LABEL_15;
  }
  if (objc_msgSend_readSizeFromDictionary_toWidth_toHeight_(self, v8, (uint64_t)v9, &self->_gTopLevelImageWidth, &self->_gTopLevelImageHeight))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v19 = 0;
    goto LABEL_15;
  }
  char v12 = objc_msgSend_objectForKeyedSubscript_(v6, v10, @"disparity_size");
  if (!v12)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v19 = FigSignalErrorAt();
    goto LABEL_18;
  }
  if (objc_msgSend_readSizeFromDictionary_toWidth_toHeight_(self, v11, (uint64_t)v12, &self->_gTopLevelDisparityWidth, &self->_gTopLevelDisparityHeight))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v19 = 0;
    goto LABEL_18;
  }
  unsigned int v15 = objc_msgSend_objectForKeyedSubscript_(v6, v13, @"raw_size");
  if (!v15)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v19 = FigSignalErrorAt();
    goto LABEL_19;
  }
  if (objc_msgSend_readSizeFromDictionary_toWidth_toHeight_(self, v14, (uint64_t)v15, &self->_gRawImageWidth, &self->_gRawImageHeight))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v19 = 0;
    goto LABEL_19;
  }
  int32x2_t v17 = objc_msgSend_objectForKeyedSubscript_(v6, v16, @"color_size");
  if (objc_msgSend_readSizeFromDictionary_toWidth_toHeight_(self, v18, (uint64_t)v17, &self->_gGuideImageWidth, &self->_gGuideImageHeight))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  int v19 = 0;
LABEL_11:

  return v19;
}

- (int)getFPBuffersSizeFromOptions:(id)a3
{
  id v4 = objc_msgSend_objectForKeyedSubscript_(a3, a2, @"Patterns");
  id v7 = v4;
  if (!v4 || (unint64_t)objc_msgSend_count(v4, v5, v6) > 0x10)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v25 = FigSignalErrorAt();
    goto LABEL_27;
  }
  if (!objc_msgSend_count(v7, v8, v9))
  {
    int v25 = 0;
LABEL_27:
    id v16 = 0;
    id v15 = 0;
    goto LABEL_28;
  }
  unint64_t v11 = 0;
  unsigned int v27 = 0;
  unsigned int v12 = 0;
  unsigned int v13 = 0;
  unsigned int v14 = 0;
  id v15 = 0;
  id v16 = 0;
  do
  {
    int32x2_t v17 = v16;
    char v18 = v15;
    id v16 = objc_msgSend_objectAtIndexedSubscript_(v7, v10, v11);

    if (!v16
      || (id v28 = v15,
          uint64_t v29 = 0,
          int PatternDetailsFrom_outTypeName_outCountX_outCountY_outStartX_outStartY_outStepX_outStepY = objc_msgSend_getPatternDetailsFrom_outTypeName_outCountX_outCountY_outStartX_outStartY_outStepX_outStepY_(self, v19, (uint64_t)v16, &v28, (char *)&v29 + 4, &v29, 0, 0, 0, 0),
          id v15 = v28,
          v18,
          PatternDetailsFrom_outTypeName_outCountX_outCountY_outStartX_outStartY_outStepX_outStepY))
    {
LABEL_29:
      fig_log_get_emitter();
      FigDebugAssert3();
      int v25 = FigSignalErrorAt();
      goto LABEL_28;
    }
    if ((objc_msgSend_isEqualToString_(v15, v21, @"H0") & 1) != 0
      || objc_msgSend_isEqualToString_(v15, v22, @"H1"))
    {
      if (v14)
      {
        if (v14 != HIDWORD(v29)) {
          goto LABEL_29;
        }
        unsigned int v14 = HIDWORD(v29);
        BOOL v24 = v13 == v29;
        unsigned int v13 = v29;
        if (!v24) {
          goto LABEL_29;
        }
      }
      else
      {
        unsigned int v14 = HIDWORD(v29);
        unsigned int v13 = v29;
      }
    }
    else
    {
      if ((objc_msgSend_isEqualToString_(v15, v22, @"V0") & 1) == 0
        && !objc_msgSend_isEqualToString_(v15, v22, @"V1"))
      {
        goto LABEL_29;
      }
      if (v14)
      {
        if (v12 != HIDWORD(v29)) {
          goto LABEL_29;
        }
        unsigned int v12 = HIDWORD(v29);
        BOOL v24 = v27 == v29;
        unsigned int v27 = v29;
        if (!v24) {
          goto LABEL_29;
        }
      }
      else
      {
        unsigned int v12 = HIDWORD(v29);
        unsigned int v27 = v29;
      }
    }
    ++v11;
  }
  while (v11 < objc_msgSend_count(v7, v22, v23));
  if (v14)
  {
    self->uint64_t gHxFocusPixelViewWidth = v14;
    self->uint64_t gHxFocusPixelViewHeight = v13;
    self->gNumViews = 2;
  }
  int v25 = 0;
  if (v12)
  {
    self->uint64_t gVxFocusPixelViewWidth = v12;
    self->uint64_t gVxFocusPixelViewHeight = v27;
    self->gNumViews = 4;
  }
LABEL_28:

  return v25;
}

- (int)prepareToProcess:(unsigned int)a3
{
  self->_processingType = a3;
  objc_msgSend_getFPBuffersSizeFromOptions_(self, a2, (uint64_t)self->_options);
  objc_msgSend_getFrameSizesFromOptions_(self, v5, (uint64_t)self->_options);
  if (a3 - 1 > 1)
  {
    if (!a3 && (self->_gTopLevelDisparityWidth != 400 || self->_gTopLevelDisparityHeight != 300)) {
      goto LABEL_9;
    }
LABEL_8:
    int result = objc_msgSend__allocateResources(self, v6, v7);
    if (!result) {
      return result;
    }
    goto LABEL_9;
  }
  if (self->_gTopLevelDisparityWidth == 208 && self->_gTopLevelDisparityHeight == 156) {
    goto LABEL_8;
  }
LABEL_9:
  fig_log_get_emitter();
  FigDebugAssert3();
  return 1;
}

- (int)process
{
  int v119 = 1;
  outDisparity = self->_outDisparity;
  if (self->_processingType == 1)
  {
    objc_msgSend__overrideTuningParametersForFactory(self, a2, v2);
    double v5 = 32.0000229;
  }
  else
  {
    double v5 = 134217825.0;
  }
  if (!self->_imageSampleBuffer || !self->_rawImagePixelBufferBuffer || !outDisparity) {
    goto LABEL_62;
  }
  int FocusPixelMetadata = objc_msgSend__extractFocusPixelMetadata(self, a2, v2);
  if (FocusPixelMetadata)
  {
    int v113 = FocusPixelMetadata;
    fig_log_get_emitter();
    FigDebugAssert3();
    return v113;
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(self->_imageSampleBuffer);
  if (!ImageBuffer) {
    goto LABEL_62;
  }
  uint64_t v9 = (uint64_t)ImageBuffer;
  objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v8, (uint64_t)self->_rawImagePixelBufferBuffer, 25, 23, 0);
  int v10 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  rawImageTexture = self->_rawImageTexture;
  self->_rawImageTexture = v10;

  if (!self->_rawImageTexture)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 1;
  }
  if (self->_processingType <= 2)
  {
    if (CVPixelBufferGetPixelFormatType(self->_H0) == 1278226742)
    {
      uint64_t v13 = 23;
    }
    else
    {
      if (CVPixelBufferGetPixelFormatType(self->_H0) != 1278226536) {
        goto LABEL_62;
      }
      uint64_t v13 = 25;
    }
    H0 = self->_H0;
    if (H0)
    {
      objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v12, (uint64_t)H0, v13, 17, 0);
      id v15 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      id v16 = self->_focusPixelViews[0];
      self->_focusPixelViews[0] = v15;
    }
    H1 = self->_H1;
    if (H1)
    {
      objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v12, (uint64_t)H1, v13, 17, 0);
      char v18 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      int v19 = self->_focusPixelViews[1];
      self->_focusPixelViews[1] = v18;
    }
    V0 = self->_V0;
    if (V0)
    {
      objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v12, (uint64_t)V0, v13, 17, 0);
      id v21 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      int v22 = self->_focusPixelViews[2];
      self->_focusPixelViews[2] = v21;
    }
    V1 = self->_V1;
    if (V1)
    {
      objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v12, (uint64_t)V1, v13, 17, 0);
      BOOL v24 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      int v25 = self->_focusPixelViews[3];
      self->_focusPixelViews[3] = v24;
    }
  }
  personSegmentationPixelBuffer = self->_personSegmentationPixelBuffer;
  if (personSegmentationPixelBuffer)
  {
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v12, (uint64_t)personSegmentationPixelBuffer, 55, 17, 0);
    unsigned int v27 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    segmentationTexture = self->_segmentationTexture;
    self->_segmentationTexture = v27;

    personSegmentationConfidencePixelBuffer = self->_personSegmentationConfidencePixelBuffer;
    if (personSegmentationConfidencePixelBuffer)
    {
      objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v29, (uint64_t)personSegmentationConfidencePixelBuffer, 55, 17, 0);
      v31 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      segmentationConfidenceTexture = self->_segmentationConfidenceTexture;
      self->_segmentationConfidenceTexture = v31;
    }
  }
  int v33 = CMGetAttachment(self->_imageSampleBuffer, (CFStringRef)*MEMORY[0x263F2C558], 0);
  v35 = v33;
  rect.origin.x = 0.0;
  rect.origin.y = 0.0;
  rect.size = (CGSize)xmmword_262F13750;
  v117.origin.x = 0.0;
  v117.origin.y = 0.0;
  v117.size = (CGSize)xmmword_262F13750;
  v116.origin.x = 0.0;
  v116.origin.y = 0.0;
  __asm { FMOV            V1.2D, #1.0 }
  v116.size = _Q1;
  v115.origin.x = 0.0;
  v115.origin.y = 0.0;
  v115.size = (CGSize)xmmword_262F13750;
  if (self->_processingType)
  {
    objc_msgSend_setImageAGC_(self->_fpDisparityEstimator, v34, 0);
    unsigned __int16 v41 = 0;
    objc_msgSend_setQuadraBinningFactor_(self->_fpDisparityEstimator, v42, 0);
    goto LABEL_33;
  }
  if (!v33)
  {
LABEL_62:
    fig_log_get_emitter();
    FigDebugAssert3();
    return 8;
  }
  v45 = objc_msgSend_objectForKeyedSubscript_(v33, v34, @"AGC");
  uint64_t v48 = objc_msgSend_intValue(v45, v46, v47);
  objc_msgSend_setImageAGC_(self->_fpDisparityEstimator, v49, v48);

  v51 = objc_msgSend_objectForKeyedSubscript_(v35, v50, *MEMORY[0x263F2D3F0]);
  unsigned __int16 v41 = objc_msgSend_intValue(v51, v52, v53);

  objc_msgSend_objectForKeyedSubscript_(v35, v54, *MEMORY[0x263F2D4D8]);
  CFDictionaryRef v55 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  BOOL v56 = CGRectMakeWithDictionaryRepresentation(v55, &rect);

  if (!v56)
  {
    fig_log_get_emitter();
LABEL_66:
    FigDebugAssert3();

    return 8;
  }
  objc_msgSend_objectForKeyedSubscript_(v35, v57, *MEMORY[0x263F2D4F8]);
  CFDictionaryRef v58 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  BOOL v59 = CGRectMakeWithDictionaryRepresentation(v58, &v117);

  if (!v59)
  {
    fig_log_get_emitter();
    goto LABEL_66;
  }
  objc_msgSend_objectForKeyedSubscript_(v35, v60, *MEMORY[0x263F2C5F0]);
  CFDictionaryRef v61 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CGRectMakeWithDictionaryRepresentation(v61, &v116);

  objc_msgSend_objectForKeyedSubscript_(v35, v62, *MEMORY[0x263F2D630]);
  CFDictionaryRef v63 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  BOOL v64 = CGRectMakeWithDictionaryRepresentation(v63, &v115);

  if (!v64)
  {
LABEL_65:
    fig_log_get_emitter();
    goto LABEL_66;
  }
  objc_msgSend_setQuadraBinningFactor_(self->_fpDisparityEstimator, v65, v41);
LABEL_33:
  objc_msgSend_setSensorCropRect_(self->_fpDisparityEstimator, v43, v44, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
  objc_msgSend_setSensorReadoutRect_(self->_fpDisparityEstimator, v66, v67, v117.origin.x, v117.origin.y, v117.size.width, v117.size.height);
  objc_msgSend_setTotalSensorCropRect_(self->_fpDisparityEstimator, v68, v69, v115.origin.x, v115.origin.y, v115.size.width, v115.size.height);
  if (objc_msgSend__populateImagePyramidFrom420fPixelBuffer_cropRect_(self, v70, v9, v116.origin.x, v116.origin.y, v116.size.width, v116.size.height))
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 3;
  }
  if (v41 == 2) {
    unsigned int v72 = 2;
  }
  else {
    unsigned int v72 = 1;
  }
  int32x2_t v73 = vdup_n_s32(v72);
  int32x2_t v74 = vmla_s32(vmovn_s64(vcvtq_s64_f64((float64x2_t)rect.origin)), v73, vmovn_s64(vcvtq_s64_f64((float64x2_t)v117.origin)));
  int32x2_t v75 = vmul_s32(v73, vmovn_s64(vcvtq_s64_f64((float64x2_t)v117.size)));
  if (objc_msgSend_demosaicGreenOnly_fromL00h_validRect_waitForCompletion_(self->_fpdDemosaic, v71, (uint64_t)self->_gChannelTexture, self->_rawImageTexture, 0, (double)(v74.u16[0] >> (v41 != 0)), (double)(v74.u16[2] >> (v41 != 0)), (double)(v75.u16[0] >> (v41 != 0)), (double)(v75.u16[2] >> (v41 != 0))))
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 5;
  }
  if (objc_msgSend__populateRawGreenChannelPyramid(self, v76, v77))
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 6;
  }
  objc_msgSend_setH0ImTexture_(self->_fpDisparityEstimator, v78, (uint64_t)self->_focusPixelViews[0]);
  objc_msgSend_setH1ImTexture_(self->_fpDisparityEstimator, v79, (uint64_t)self->_focusPixelViews[1]);
  objc_msgSend_setV0ImTexture_(self->_fpDisparityEstimator, v80, (uint64_t)self->_focusPixelViews[2]);
  objc_msgSend_setV1ImTexture_(self->_fpDisparityEstimator, v81, (uint64_t)self->_focusPixelViews[3]);
  objc_msgSend_setImagePyramid_(self->_fpDisparityEstimator, v82, (uint64_t)self->_pyr_image);
  objc_msgSend_setGChannelPyramid_(self->_fpDisparityEstimator, v83, (uint64_t)self->_greenChannelPyramid);
  objc_msgSend_setSegmentationTexture_(self->_fpDisparityEstimator, v84, (uint64_t)self->_segmentationTexture);
  objc_msgSend_setSegmentationConfidenceTexture_(self->_fpDisparityEstimator, v85, (uint64_t)self->_segmentationConfidenceTexture);
  objc_msgSend_setBinaryLambdaTexture_(self->_fpDisparityEstimator, v86, 0);
  binaryLambdaPixelBuffer = self->_binaryLambdaPixelBuffer;
  if (binaryLambdaPixelBuffer)
  {
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v87, (uint64_t)binaryLambdaPixelBuffer, 10, 17, 0);
    v89 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    binaryLambdaTexture = self->_binaryLambdaTexture;
    self->_binaryLambdaTexture = v89;

    v92 = self->_binaryLambdaTexture;
    if (v92)
    {
      objc_msgSend_setBinaryLambdaTexture_(self->_fpDisparityEstimator, v91, (uint64_t)v92);
      goto LABEL_42;
    }
    fig_log_get_emitter();
    FigDebugAssert3();

    return 1;
  }
LABEL_42:
  if (objc_msgSend_setOutputDisparity_(self->_fpDisparityEstimator, v87, (uint64_t)outDisparity)) {
    goto LABEL_65;
  }
  v95 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v93, v94);
  objc_msgSend_setFpDisparityEstimatorParams_(self->_fpDisparityEstimator, v96, (uint64_t)v95);

  v99 = objc_msgSend_fpDisparityEstimatorParams(self->_fpDisparityEstimator, v97, v98);
  v102 = objc_msgSend_FPpostprocessingParameters(v99, v100, v101);
  objc_msgSend_shiftToDisparityRatio(v102, v103, v104);
  int v106 = v105;

  LODWORD(v107) = v106;
  if (objc_msgSend_estimateFocusPixelDisparityWithBox_cstr_range_disparity_scaling_factor_(self->_fpDisparityEstimator, v108, v109, v5, v107))
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 7;
  }
  else
  {
    if (self->_qualityEstimationEnabled)
    {
      if (objc_msgSend__computeDisparityQuality_(self, v110, (uint64_t)&v119))
      {
        int v112 = 0;
        int v119 = 0;
      }
      else
      {
        int v112 = v119;
      }
    }
    else
    {
      objc_msgSend_waitForIdle(self->_metalContext, v110, v111);
      int v112 = 1;
    }
    self->_disparityQuality = v112;

    return 0;
  }
}

- (int)_populateRawGreenChannelPyramid
{
  objc_msgSend_setObject_atIndexedSubscript_(self->_greenChannelPyramid, a2, (uint64_t)self->_gChannelTexture, 0);
  double v5 = objc_msgSend_commandQueue(self->_metalContext, v3, v4);
  int32x2_t v8 = objc_msgSend_commandBuffer(v5, v6, v7);

  if (!v8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v57 = FigSignalErrorAt();
    goto LABEL_9;
  }
  uint64_t v9 = 0;
  for (uint64_t i = 1; i != 8; ++i)
  {
    unint64_t v11 = objc_opt_new();
    unsigned int v14 = v11;
    if (!v11)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v57 = FigSignalErrorAt();

LABEL_12:
      goto LABEL_9;
    }
    id v15 = objc_msgSend_colorAttachments(v11, v12, v13);
    int32x2_t v17 = objc_msgSend_objectAtIndexedSubscript_(v15, v16, 0);
    objc_msgSend_setLoadAction_(v17, v18, 0);

    id v21 = objc_msgSend_colorAttachments(v14, v19, v20);
    uint64_t v23 = objc_msgSend_objectAtIndexedSubscript_(v21, v22, 0);
    objc_msgSend_setStoreAction_(v23, v24, 1);

    uint64_t v26 = objc_msgSend_objectAtIndexedSubscript_(self->_greenChannelPyramid, v25, i);
    uint64_t v29 = objc_msgSend_colorAttachments(v14, v27, v28);
    v31 = objc_msgSend_objectAtIndexedSubscript_(v29, v30, 0);
    objc_msgSend_setTexture_(v31, v32, (uint64_t)v26);

    v34 = objc_msgSend_renderCommandEncoderWithDescriptor_(v8, v33, (uint64_t)v14);

    if (!v34)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v57 = FigSignalErrorAt();
      goto LABEL_12;
    }
    objc_msgSend_setRenderPipelineState_(v34, v35, (uint64_t)self->_gChannelRescale);
    id v38 = objc_msgSend_fullRangeVertexBuf(self->_metalContext, v36, v37);
    objc_msgSend_setVertexBuffer_offset_atIndex_(v34, v39, (uint64_t)v38, 0, 0);

    unsigned __int16 v41 = objc_msgSend_objectAtIndexedSubscript_(self->_greenChannelPyramid, v40, i - 1);
    objc_msgSend_setFragmentTexture_atIndex_(v34, v42, (uint64_t)v41, 0);

    objc_msgSend_drawPrimitives_vertexStart_vertexCount_(v34, v43, 4, 0, 4);
    objc_msgSend_endEncoding(v34, v44, v45);

    uint64_t v9 = v34;
  }
  if (*MEMORY[0x263F00E10])
  {
    uint64_t v48 = objc_msgSend_commandQueue(v8, v46, v47);
    v51 = objc_msgSend_commandBuffer(v48, v49, v50);

    objc_msgSend_setLabel_(v51, v52, @"KTRACE_MTLCMDBUF");
    objc_msgSend_addCompletedHandler_(v51, v53, (uint64_t)&unk_270E2A030);
    objc_msgSend_commit(v51, v54, v55);
    objc_msgSend_addCompletedHandler_(v8, v56, (uint64_t)&unk_270E2A050);
  }
  objc_msgSend_commit(v8, v46, v47);

  int v57 = 0;
LABEL_9:

  return v57;
}

- (int)_populateImagePyramidFrom:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_commandQueue(self->_metalContext, v5, v6);
  int v10 = objc_msgSend_commandBuffer(v7, v8, v9);

  if (v10)
  {
    int v12 = objc_msgSend_doImagePyramidWithCommandBuffer_in_tex_(self->_pyr_image, v11, (uint64_t)v10, v4);
    if (v12)
    {
      int v26 = v12;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      if (*MEMORY[0x263F00E10])
      {
        id v15 = objc_msgSend_commandQueue(v10, v13, v14);
        char v18 = objc_msgSend_commandBuffer(v15, v16, v17);

        objc_msgSend_setLabel_(v18, v19, @"KTRACE_MTLCMDBUF");
        objc_msgSend_addCompletedHandler_(v18, v20, (uint64_t)&unk_270E2A070);
        objc_msgSend_commit(v18, v21, v22);
        objc_msgSend_addCompletedHandler_(v10, v23, (uint64_t)&unk_270E2A090);
      }
      objc_msgSend_commit(v10, v13, v14);
      objc_msgSend_countScales(self->_pyr_image, v24, v25);
      int v26 = 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v26 = FigSignalErrorAt();
  }

  return v26;
}

- (int)_populateImagePyramidFrom420fPixelBuffer:(__CVBuffer *)a3 cropRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  int v10 = objc_msgSend_commandQueue(self->_metalContext, a2, (uint64_t)a3);
  uint64_t v13 = objc_msgSend_commandBuffer(v10, v11, v12);

  if (!v13)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v45 = FigSignalErrorAt();
    goto LABEL_18;
  }
  uint64_t v15 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v14, (uint64_t)a3, 10, 23, 0);
  if (!v15)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_29:
    int v45 = -12786;
    goto LABEL_18;
  }
  uint64_t v17 = (void *)v15;
  uint64_t v18 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v16, (uint64_t)a3, 30, 23, 1);
  if (!v18)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_28:

    goto LABEL_29;
  }
  id v21 = (void *)v18;
  float v24 = (float)(unint64_t)objc_msgSend_width(v17, v19, v20) * 0.5;
  float v25 = (float)(unint64_t)objc_msgSend_height(v17, v22, v23) * 0.5;
  uint64_t v27 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_metalContext, v26, (uint64_t)self->_greenChannelPyramidCVP[0], 80, 23, 0, v24, v25);
  if (!v27)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_28;
  }
  uint64_t v29 = (void *)v27;
  int v30 = objc_msgSend__downscale2X420fTBGRAEqualWithCommandBuffer_in_Ytex_in_UVtex_out_tex_cropRect_(self, v28, (uint64_t)v13, v17, v21, v27, x, y, width, height);
  if (v30)
  {
    int v45 = v30;
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    CFDictionaryRef v61 = v21;
    v62 = v17;
    CFDictionaryRef v63 = v13;
    int v33 = 0;
    int v34 = 0;
    v35 = 0;
    while (v24 * 0.5 > *(double *)objc_msgSend_pyramidDimensions(self->_pyr_image, v31, v32)
         && v25 * 0.5 > *(double *)(objc_msgSend_pyramidDimensions(self->_pyr_image, v36, v37) + 8))
    {
      id v38 = objc_msgSend_newTextureViewWithPixelFormat_(v29, v36, 53);

      if (!v38)
      {
        fig_log_get_emitter();
        FigDebugAssert3();

LABEL_22:
        int v45 = -12786;
        goto LABEL_23;
      }
      float v24 = v24 * 0.5;
      float v25 = v25 * 0.5;
      v34 ^= 1u;
      uint64_t v40 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_metalContext, v39, (uint64_t)self->_greenChannelPyramidCVP[v34], 80, 23, 0, v24, v25);

      if (!v40)
      {
        fig_log_get_emitter();
        FigDebugAssert3();

        goto LABEL_22;
      }
      v42 = objc_msgSend_newTextureViewWithPixelFormat_(v40, v41, 53);

      if (!v42)
      {
        fig_log_get_emitter();
        FigDebugAssert3();

        goto LABEL_22;
      }
      int v44 = objc_msgSend_downscale2XEqualWithCommandBuffer_in_u32_alias_tex_out_u32_alias_tex_(self->_pyr_image, v43, (uint64_t)v63, v38, v42);
      int v33 = v42;
      v35 = v38;
      uint64_t v29 = v40;
      if (v44)
      {
        int v45 = v44;
        fig_log_get_emitter();
        FigDebugAssert3();

LABEL_23:
        uint64_t v13 = v63;
        goto LABEL_18;
      }
    }
    uint64_t v13 = v63;
    int v46 = objc_msgSend_doImagePyramidWithCommandBuffer_in_tex_(self->_pyr_image, v36, (uint64_t)v63, v29);
    if (v46)
    {
      int v45 = v46;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      if (*MEMORY[0x263F00E10])
      {
        v49 = objc_msgSend_commandQueue(v63, v47, v48);
        v52 = objc_msgSend_commandBuffer(v49, v50, v51);

        objc_msgSend_setLabel_(v52, v53, @"KTRACE_MTLCMDBUF");
        objc_msgSend_addCompletedHandler_(v52, v54, (uint64_t)&unk_270E2A0B0);
        objc_msgSend_commit(v52, v55, v56);
        objc_msgSend_addCompletedHandler_(v63, v57, (uint64_t)&unk_270E2A0D0);
      }
      objc_msgSend_commit(v63, v47, v48);
      objc_msgSend_countScales(self->_pyr_image, v58, v59);

      int v45 = 0;
    }
  }
LABEL_18:

  return v45;
}

- (int)_initShaders
{
  v3 = objc_opt_new();
  uint64_t v6 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  uint64_t v7 = objc_msgSend_colorAttachments(v3, v4, v5);
  uint64_t v9 = objc_msgSend_objectAtIndexedSubscript_(v7, v8, 0);
  objc_msgSend_setPixelFormat_(v9, v10, 25);

  uint64_t v13 = objc_msgSend_library(self->_metalContext, v11, v12);
  uint64_t v15 = objc_msgSend_newFunctionWithName_(v13, v14, @"VertexPassthrough");
  objc_msgSend_setVertexFunction_(v6, v16, (uint64_t)v15);

  int v19 = objc_msgSend_vertexFunction(v6, v17, v18);

  if (!v19) {
    goto LABEL_9;
  }
  uint64_t v22 = objc_msgSend_library(self->_metalContext, v20, v21);
  float v24 = objc_msgSend_newFunctionWithName_(v22, v23, @"FragmentRescale");
  objc_msgSend_setFragmentFunction_(v6, v25, (uint64_t)v24);

  uint64_t v28 = objc_msgSend_fragmentFunction(v6, v26, v27);

  if (!v28) {
    goto LABEL_9;
  }
  v31 = objc_msgSend_fullRangeVertexDesc(self->_metalContext, v29, v30);
  objc_msgSend_setVertexDescriptor_(v6, v32, (uint64_t)v31);

  v35 = objc_msgSend_device(self->_metalContext, v33, v34);
  uint64_t v37 = (MTLRenderPipelineState *)objc_msgSend_newRenderPipelineStateWithDescriptor_error_(v35, v36, (uint64_t)v6, 0);
  gChannelRescale = self->_gChannelRescale;
  self->_gChannelRescale = v37;

  if (!self->_gChannelRescale) {
    goto LABEL_9;
  }
  objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v39, @"downscale_2x_equal_420ToRGB_kernel", 0);
  uint64_t v40 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  unsigned __int16 v41 = self->_pipelineStates[1];
  self->_pipelineStates[1] = v40;

  if (!self->_pipelineStates[1]) {
    goto LABEL_9;
  }
  objc_msgSend_computePipelineStateFor_constants_(self->_metalContext, v42, @"disparityPixelSum", 0);
  id v43 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  int v44 = self->_pipelineStates[2];
  self->_pipelineStates[2] = v43;

  if (self->_pipelineStates[2])
  {
    int v45 = 0;
  }
  else
  {
LABEL_9:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v45 = FigSignalErrorAt();
  }

  return v45;
}

- (int)mapPixelTypeNameToDirection:(id)a3
{
  id v4 = a3;
  if (qword_26A9985B0 != -1) {
    dispatch_once(&qword_26A9985B0, &unk_270E2A0F0);
  }
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_((void *)qword_26A9985A8, v3, (uint64_t)v4);
  int32x2_t v8 = v5;
  if (v5) {
    int v9 = objc_msgSend_intValue(v5, v6, v7);
  }
  else {
    int v9 = 0;
  }

  return v9;
}

- (int)_extractFocusPixelMetadata
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  objc_msgSend_objectForKeyedSubscript_(self->_options, a2, @"Patterns");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v23, v27, 16);
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v21 = 0;
        uint64_t v22 = 0;
        id v19 = 0;
        uint64_t v20 = 0;
        int PatternDetailsFrom_outTypeName_outCountX_outCountY_outStartX_outStartY_outStepX_outStepY = objc_msgSend_getPatternDetailsFrom_outTypeName_outCountX_outCountY_outStartX_outStartY_outStepX_outStepY_(self, v7, v11, &v19, (char *)&v22 + 4, &v22, (char *)&v21 + 4, &v21, (char *)&v20 + 4, &v20);
        id v13 = v19;
        int v15 = objc_msgSend_mapPixelTypeNameToDirection_(self, v14, (uint64_t)v13);
        if (!v15)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
LABEL_18:

          goto LABEL_21;
        }
        unint64_t v17 = HIDWORD(v21) | ((unint64_t)v21 << 32);
        switch(v15)
        {
          case 1:
            objc_msgSend_setH0Metadata_(self->_fpDisparityEstimator, v16, HIDWORD(v20) | ((unint64_t)v20 << 32), v17);
            break;
          case 2:
            objc_msgSend_setH1Metadata_(self->_fpDisparityEstimator, v16, HIDWORD(v20) | ((unint64_t)v20 << 32), v17);
            break;
          case 3:
            objc_msgSend_setV0Metadata_(self->_fpDisparityEstimator, v16, HIDWORD(v20) | ((unint64_t)v20 << 32), v17);
            break;
          case 4:
            objc_msgSend_setV1Metadata_(self->_fpDisparityEstimator, v16, HIDWORD(v20) | ((unint64_t)v20 << 32), v17);
            break;
          default:
            int PatternDetailsFrom_outTypeName_outCountX_outCountY_outStartX_outStartY_outStepX_outStepY = 4;
            goto LABEL_18;
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v23, v27, 16);
      if (v8) {
        continue;
      }
      break;
    }
    int PatternDetailsFrom_outTypeName_outCountX_outCountY_outStartX_outStartY_outStepX_outStepY = 0;
  }
  else
  {
    int PatternDetailsFrom_outTypeName_outCountX_outCountY_outStartX_outStartY_outStepX_outStepY = 0;
  }
LABEL_21:

  if (*v3 == 1) {
    kdebug_trace();
  }

  return PatternDetailsFrom_outTypeName_outCountX_outCountY_outStartX_outStartY_outStepX_outStepY;
}

- (int)_downscale2X420fTBGRAEqualWithCommandBuffer:(id)a3 in_Ytex:(id)a4 in_UVtex:(id)a5 out_tex:(id)a6 cropRect:(CGRect)a7
{
  CGFloat width = a7.size.width;
  CGFloat height = a7.size.height;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = self->_pipelineStates[1];
  id v17 = a3;
  float v20 = (float)(unint64_t)objc_msgSend_width(v14, v18, v19);
  uint64_t v23 = objc_msgSend_height(v14, v21, v22);
  float v24 = x;
  *(float *)v25.i32 = v24 * v20;
  float v26 = y;
  *(float *)&__int32 v27 = v26 * (float)(unint64_t)v23;
  v28.f64[0] = width;
  v28.f64[1] = height;
  v25.i32[1] = v27;
  float32x4_t v56 = vcvt_hight_f32_f64(v25, v28);
  v31 = objc_msgSend_computeCommandEncoder(v17, v29, v30);

  if (v31)
  {
    objc_msgSend_setComputePipelineState_(v31, v32, (uint64_t)v16);
    objc_msgSend_setTexture_atIndex_(v31, v33, (uint64_t)v13, 0);
    objc_msgSend_setTexture_atIndex_(v31, v34, (uint64_t)v14, 1);
    objc_msgSend_setTexture_atIndex_(v31, v35, (uint64_t)v15, 2);
    objc_msgSend_setBytes_length_atIndex_(v31, v36, (uint64_t)&v56, 16, 0);
    unint64_t v39 = objc_msgSend_threadExecutionWidth(v16, v37, v38);
    unint64_t v42 = objc_msgSend_maxTotalThreadsPerThreadgroup(v16, v40, v41) / v39;
    v55[0] = (int)objc_msgSend_width(v15, v43, v44);
    v55[1] = (int)objc_msgSend_height(v15, v45, v46);
    v55[2] = 1;
    v54[0] = v39;
    v54[1] = v42;
    v54[2] = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v31, v47, (uint64_t)v55, v54);
    objc_msgSend_endEncoding(v31, v48, v49);
    int v50 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v50 = FigSignalErrorAt();
  }

  return v50;
}

- (int)_computeDisparityQuality:(int *)a3
{
  if (!self->_segmentationTexture)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12782;
  }
  uint64_t v5 = objc_msgSend_commandQueue(self->_metalContext, a2, (uint64_t)a3);
  uint64_t v8 = objc_msgSend_commandBuffer(v5, v6, v7);

  if (!v8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12786;
  }
  uint64_t v11 = objc_msgSend_computeCommandEncoder(v8, v9, v10);
  if (!v11)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v61 = FigSignalErrorAt();

    return v61;
  }
  uint64_t v12 = (void *)v11;
  id v13 = self->_pipelineStates[2];
  id v15 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v14, (uint64_t)self->_outDisparity, 25, 17, 0);
  if (!v15)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return -12786;
  }
  uint64_t v18 = v15;
  if ((unint64_t)objc_msgSend_width(v15, v16, v17) >= 0x191) {
    goto LABEL_23;
  }
  uint64_t v21 = objc_msgSend_device(self->_metalContext, v19, v20);
  unint64_t v24 = objc_msgSend_maxThreadgroupMemoryLength(v21, v22, v23);

  if (v24 >> 8 <= 0x18
    || (objc_msgSend_setComputePipelineState_(v12, v25, (uint64_t)v13),
        objc_msgSend_setTexture_atIndex_(v12, v26, (uint64_t)v18, 0),
        objc_msgSend_setTexture_atIndex_(v12, v27, (uint64_t)self->_segmentationTexture, 1),
        objc_msgSend_setBuffer_offset_atIndex_(v12, v28, (uint64_t)self->_disparitySumBuffer, 0, 0),
        objc_msgSend_setBuffer_offset_atIndex_(v12, v29, (uint64_t)self->_disparityCountBuffer, 0, 1),
        unsigned int v32 = objc_msgSend_maxTotalThreadsPerThreadgroup(v13, v30, v31),
        objc_msgSend_width(v18, v33, v34) > (unint64_t)v32))
  {
LABEL_23:
    fig_log_get_emitter();
    FigDebugAssert3();

    return -12782;
  }
  int64x2_t v64 = vdupq_n_s64(1uLL);
  uint64_t v65 = 1;
  uint64_t v62 = objc_msgSend_width(v18, v35, v36);
  int64x2_t v63 = v64;
  objc_msgSend_dispatchThreadgroups_threadsPerThreadgroup_(v12, v37, (uint64_t)&v64, &v62);
  objc_msgSend_endEncoding(v12, v38, v39);
  objc_msgSend_commit(v8, v40, v41);
  objc_msgSend_waitForIdle(self->_metalContext, v42, v43);
  uint64_t v46 = (float *)objc_msgSend_contents(self->_disparitySumBuffer, v44, v45);
  uint64_t v49 = (int *)objc_msgSend_contents(self->_disparityCountBuffer, v47, v48);
  v52 = v49;
  float v53 = 0.0;
  if (*v49 < 1)
  {
    float v55 = 0.0;
  }
  else
  {
    int v54 = v49[1];
    float v55 = 0.0;
    if (v54 >= 1)
    {
      float v53 = v46[1] / (float)v54;
      float v55 = *v46 / (float)*v49;
    }
  }
  uint64_t v56 = objc_msgSend_width(v18, v50, v51);
  int v59 = (int)(float)((float)(unint64_t)(objc_msgSend_height(v18, v57, v58) * v56) * 0.05);
  *a3 = *v52 >= v59 && v52[1] >= v59 && vabds_f32(v53, v55) >= 0.1;

  return 0;
}

- (void)_overrideTuningParametersForFactory
{
  id v4 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, a2, v2);
  uint64_t v7 = objc_msgSend_FPpreprocessingParameters(v4, v5, v6);
  objc_msgSend_setBlackLevelOffset_(v7, v8, v9, 0.0);

  uint64_t v12 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v10, v11);
  id v15 = objc_msgSend_FPpreprocessingParameters(v12, v13, v14);
  LODWORD(v16) = 1.0;
  objc_msgSend_setBlackLevelScaling_(v15, v17, v18, v16);

  uint64_t v21 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v19, v20);
  unint64_t v24 = objc_msgSend_levelsParameters(v21, v22, v23);
  float v26 = objc_msgSend_objectAtIndexedSubscript_(v24, v25, 0);
  uint64_t v29 = objc_msgSend_costParameters(v26, v27, v28);
  LODWORD(v30) = 1112014848;
  objc_msgSend_setLambda_(v29, v31, v32, v30);

  v35 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v33, v34);
  uint64_t v38 = objc_msgSend_levelsParameters(v35, v36, v37);
  uint64_t v40 = objc_msgSend_objectAtIndexedSubscript_(v38, v39, 1);
  uint64_t v43 = objc_msgSend_costParameters(v40, v41, v42);
  LODWORD(v44) = 1112014848;
  objc_msgSend_setLambda_(v43, v45, v46, v44);

  uint64_t v49 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v47, v48);
  v52 = objc_msgSend_levelsParameters(v49, v50, v51);
  int v54 = objc_msgSend_objectAtIndexedSubscript_(v52, v53, 2);
  int v57 = objc_msgSend_costParameters(v54, v55, v56);
  LODWORD(v58) = 1112014848;
  objc_msgSend_setLambda_(v57, v59, v60, v58);

  int64x2_t v63 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v61, v62);
  v66 = objc_msgSend_levelsParameters(v63, v64, v65);
  v68 = objc_msgSend_objectAtIndexedSubscript_(v66, v67, 3);
  v71 = objc_msgSend_costParameters(v68, v69, v70);
  LODWORD(v72) = 1121714176;
  objc_msgSend_setLambda_(v71, v73, v74, v72);

  uint64_t v77 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v75, v76);
  v80 = objc_msgSend_levelsParameters(v77, v78, v79);
  v82 = objc_msgSend_objectAtIndexedSubscript_(v80, v81, 4);
  v85 = objc_msgSend_costParameters(v82, v83, v84);
  LODWORD(v86) = 1123024896;
  objc_msgSend_setLambda_(v85, v87, v88, v86);

  v91 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v89, v90);
  uint64_t v94 = objc_msgSend_levelsParameters(v91, v92, v93);
  v96 = objc_msgSend_objectAtIndexedSubscript_(v94, v95, 5);
  v99 = objc_msgSend_costParameters(v96, v97, v98);
  LODWORD(v100) = 1123024896;
  objc_msgSend_setLambda_(v99, v101, v102, v100);

  int v105 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v103, v104);
  v108 = objc_msgSend_levelsParameters(v105, v106, v107);
  v110 = objc_msgSend_objectAtIndexedSubscript_(v108, v109, 6);
  int v113 = objc_msgSend_costParameters(v110, v111, v112);
  LODWORD(v114) = 1123024896;
  objc_msgSend_setLambda_(v113, v115, v116, v114);

  int v119 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v117, v118);
  v122 = objc_msgSend_levelsParameters(v119, v120, v121);
  v124 = objc_msgSend_objectAtIndexedSubscript_(v122, v123, 7);
  v127 = objc_msgSend_costParameters(v124, v125, v126);
  LODWORD(v128) = 1123024896;
  objc_msgSend_setLambda_(v127, v129, v130, v128);

  v133 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v131, v132);
  v136 = objc_msgSend_levelsParameters(v133, v134, v135);
  v138 = objc_msgSend_objectAtIndexedSubscript_(v136, v137, 0);
  v141 = objc_msgSend_regularizationParameters(v138, v139, v140);
  LODWORD(v142) = 20.0;
  objc_msgSend_setAlpha_(v141, v143, v144, v142);

  v147 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v145, v146);
  v150 = objc_msgSend_levelsParameters(v147, v148, v149);
  v152 = objc_msgSend_objectAtIndexedSubscript_(v150, v151, 1);
  v155 = objc_msgSend_regularizationParameters(v152, v153, v154);
  LODWORD(v156) = 20.0;
  objc_msgSend_setAlpha_(v155, v157, v158, v156);

  v161 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v159, v160);
  v164 = objc_msgSend_levelsParameters(v161, v162, v163);
  v166 = objc_msgSend_objectAtIndexedSubscript_(v164, v165, 2);
  v169 = objc_msgSend_regularizationParameters(v166, v167, v168);
  LODWORD(v170) = 20.0;
  objc_msgSend_setAlpha_(v169, v171, v172, v170);

  v175 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v173, v174);
  v178 = objc_msgSend_levelsParameters(v175, v176, v177);
  v180 = objc_msgSend_objectAtIndexedSubscript_(v178, v179, 3);
  v183 = objc_msgSend_regularizationParameters(v180, v181, v182);
  LODWORD(v184) = 20.0;
  objc_msgSend_setAlpha_(v183, v185, v186, v184);

  v189 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v187, v188);
  v192 = objc_msgSend_levelsParameters(v189, v190, v191);
  v194 = objc_msgSend_objectAtIndexedSubscript_(v192, v193, 4);
  v197 = objc_msgSend_regularizationParameters(v194, v195, v196);
  LODWORD(v198) = 20.0;
  objc_msgSend_setAlpha_(v197, v199, v200, v198);

  v203 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v201, v202);
  v206 = objc_msgSend_levelsParameters(v203, v204, v205);
  v208 = objc_msgSend_objectAtIndexedSubscript_(v206, v207, 5);
  v211 = objc_msgSend_regularizationParameters(v208, v209, v210);
  LODWORD(v212) = 20.0;
  objc_msgSend_setAlpha_(v211, v213, v214, v212);

  v217 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v215, v216);
  v220 = objc_msgSend_levelsParameters(v217, v218, v219);
  v222 = objc_msgSend_objectAtIndexedSubscript_(v220, v221, 6);
  v225 = objc_msgSend_regularizationParameters(v222, v223, v224);
  LODWORD(v226) = 20.0;
  objc_msgSend_setAlpha_(v225, v227, v228, v226);

  v231 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v229, v230);
  v234 = objc_msgSend_levelsParameters(v231, v232, v233);
  v236 = objc_msgSend_objectAtIndexedSubscript_(v234, v235, 7);
  v239 = objc_msgSend_regularizationParameters(v236, v237, v238);
  LODWORD(v240) = 20.0;
  objc_msgSend_setAlpha_(v239, v241, v242, v240);

  v245 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v243, v244);
  v248 = objc_msgSend_levelsParameters(v245, v246, v247);
  v250 = objc_msgSend_objectAtIndexedSubscript_(v248, v249, 0);
  v253 = objc_msgSend_hbfParameters(v250, v251, v252);
  objc_msgSend_setScales_(v253, v254, 0);

  v257 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v255, v256);
  v260 = objc_msgSend_levelsParameters(v257, v258, v259);
  v262 = objc_msgSend_objectAtIndexedSubscript_(v260, v261, 1);
  v265 = objc_msgSend_hbfParameters(v262, v263, v264);
  objc_msgSend_setScales_(v265, v266, 0);

  v269 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v267, v268);
  v272 = objc_msgSend_levelsParameters(v269, v270, v271);
  v274 = objc_msgSend_objectAtIndexedSubscript_(v272, v273, 2);
  v277 = objc_msgSend_hbfParameters(v274, v275, v276);
  objc_msgSend_setScales_(v277, v278, 0);

  v281 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v279, v280);
  v284 = objc_msgSend_levelsParameters(v281, v282, v283);
  v286 = objc_msgSend_objectAtIndexedSubscript_(v284, v285, 3);
  v289 = objc_msgSend_hbfParameters(v286, v287, v288);
  objc_msgSend_setScales_(v289, v290, 0);

  v293 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v291, v292);
  v296 = objc_msgSend_levelsParameters(v293, v294, v295);
  v298 = objc_msgSend_objectAtIndexedSubscript_(v296, v297, 4);
  v301 = objc_msgSend_hbfParameters(v298, v299, v300);
  objc_msgSend_setScales_(v301, v302, 0);

  v305 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v303, v304);
  v308 = objc_msgSend_levelsParameters(v305, v306, v307);
  v310 = objc_msgSend_objectAtIndexedSubscript_(v308, v309, 5);
  v313 = objc_msgSend_hbfParameters(v310, v311, v312);
  objc_msgSend_setScales_(v313, v314, 0);

  v317 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v315, v316);
  v320 = objc_msgSend_levelsParameters(v317, v318, v319);
  v322 = objc_msgSend_objectAtIndexedSubscript_(v320, v321, 6);
  v325 = objc_msgSend_hbfParameters(v322, v323, v324);
  objc_msgSend_setScales_(v325, v326, 0);

  v329 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v327, v328);
  v332 = objc_msgSend_levelsParameters(v329, v330, v331);
  v334 = objc_msgSend_objectAtIndexedSubscript_(v332, v333, 7);
  v337 = objc_msgSend_hbfParameters(v334, v335, v336);
  objc_msgSend_setScales_(v337, v338, 0);

  v341 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v339, v340);
  v344 = objc_msgSend_FPcostParameters(v341, v342, v343);
  objc_msgSend_setForegroundPush_(v344, v345, v346, 0.0);

  v349 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v347, v348);
  v352 = objc_msgSend_FPcostParameters(v349, v350, v351);
  objc_msgSend_setBackgroundPush_(v352, v353, v354, 0.0);

  v357 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v355, v356);
  v360 = objc_msgSend_FPcostParameters(v357, v358, v359);
  LODWORD(v361) = 1.0;
  objc_msgSend_setRadialExponent_(v360, v362, v363, v361);

  v366 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v364, v365);
  v369 = objc_msgSend_FPcostParameters(v366, v367, v368);
  objc_msgSend_setRadialGain_(v369, v370, v371, 0.0);

  v374 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v372, v373);
  v377 = objc_msgSend_FPcostParameters(v374, v375, v376);
  LODWORD(v378) = 1.0;
  objc_msgSend_setRadialMin_(v377, v379, v380, v378);

  v383 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v381, v382);
  v386 = objc_msgSend_FPpostprocessingParameters(v383, v384, v385);
  LODWORD(v387) = 1.0;
  objc_msgSend_setShiftToDisparityRatio_(v386, v388, v389, v387);

  for (uint64_t i = 0; i != 8; ++i)
  {
    v393 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v390, v391);
    v396 = objc_msgSend_levelsParameters(v393, v394, v395);
    v398 = objc_msgSend_objectAtIndexedSubscript_(v396, v397, i);
    v401 = objc_msgSend_solverParameters(v398, v399, v400);
    LODWORD(v402) = 0.25;
    objc_msgSend_setTau_(v401, v403, v404, v402);

    v407 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v405, v406);
    v410 = objc_msgSend_levelsParameters(v407, v408, v409);
    v412 = objc_msgSend_objectAtIndexedSubscript_(v410, v411, i);
    v415 = objc_msgSend_solverParameters(v412, v413, v414);
    LODWORD(v416) = 0.5;
    objc_msgSend_setSigma_(v415, v417, v418, v416);

    v421 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v419, v420);
    v424 = objc_msgSend_levelsParameters(v421, v422, v423);
    v426 = objc_msgSend_objectAtIndexedSubscript_(v424, v425, i);
    v429 = objc_msgSend_solverParameters(v426, v427, v428);
    LODWORD(v430) = 1.0;
    objc_msgSend_setTheta_(v429, v431, v432, v430);

    v435 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v433, v434);
    v438 = objc_msgSend_levelsParameters(v435, v436, v437);
    v440 = objc_msgSend_objectAtIndexedSubscript_(v438, v439, i);
    v443 = objc_msgSend_solverParameters(v440, v441, v442);
    LODWORD(v444) = 1008981770;
    objc_msgSend_setHuber_eps_(v443, v445, v446, v444);

    v449 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v447, v448);
    v452 = objc_msgSend_levelsParameters(v449, v450, v451);
    v454 = objc_msgSend_objectAtIndexedSubscript_(v452, v453, i);
    v457 = objc_msgSend_solverParameters(v454, v455, v456);
    objc_msgSend_setIterations_(v457, v458, 120);

    v461 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v459, v460);
    v464 = objc_msgSend_levelsParameters(v461, v462, v463);
    v466 = objc_msgSend_objectAtIndexedSubscript_(v464, v465, i);
    v469 = objc_msgSend_regularizationParameters(v466, v467, v468);
    LODWORD(v470) = 1061997773;
    objc_msgSend_setSegmentation_bias_background_(v469, v471, v472, v470);

    v475 = objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v473, v474);
    v478 = objc_msgSend_levelsParameters(v475, v476, v477);
    v480 = objc_msgSend_objectAtIndexedSubscript_(v478, v479, i);
    v483 = objc_msgSend_regularizationParameters(v480, v481, v482);
    LODWORD(v484) = 1061997773;
    objc_msgSend_setSegmentation_bias_foreground_(v483, v485, v486, v484);
  }
  objc_msgSend_FPDisparityEstimator_Config(self->_fpDisparityTuningParameters, v390, v391);
  id v493 = (id)objc_claimAutoreleasedReturnValue();
  v489 = objc_msgSend_FPcostParameters(v493, v487, v488);
  LODWORD(v490) = 1047233823;
  objc_msgSend_setCircleOfConfusionGain_(v489, v491, v492, v490);
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

- (CGRect)focusPixelValidArea
{
  double x = self->_notUsedFocusPixelValidArea.origin.x;
  double y = self->_notUsedFocusPixelValidArea.origin.y;
  double width = self->_notUsedFocusPixelValidArea.size.width;
  double height = self->_notUsedFocusPixelValidArea.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFocusPixelValidArea:(CGRect)a3
{
  self->_notUsedFocusPixelValidArea = a3;
}

- (FigMetalContext)metalContext
{
  return self->_metalContext;
}

- (void)setMetalContext:(id)a3
{
}

- (opaqueCMSampleBuffer)imageSampleBuffer
{
  return self->_imageSampleBuffer;
}

- (void)setImageSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_imageSampleBuffer = a3;
}

- (__CVBuffer)rawImagePixelBufferBuffer
{
  return self->_rawImagePixelBufferBuffer;
}

- (void)setRawImagePixelBufferBuffer:(__CVBuffer *)a3
{
  self->_rawImagePixelBufferBuffer = a3;
}

- (__CVBuffer)focusPixelBuffer
{
  return self->_focusPixelBuffer;
}

- (void)setFocusPixelBuffer:(__CVBuffer *)a3
{
  self->_focusPixelBuffer = a3;
}

- (NSDictionary)focusPixelMetadata
{
  return self->_focusPixelMetadata;
}

- (void)setFocusPixelMetadata:(id)a3
{
}

- (__CVBuffer)personSegmentationPixelBuffer
{
  return self->_personSegmentationPixelBuffer;
}

- (void)setPersonSegmentationPixelBuffer:(__CVBuffer *)a3
{
  self->_personSegmentationPixelBuffer = a3;
}

- (__CVBuffer)personSegmentationConfidencePixelBuffer
{
  return self->_personSegmentationConfidencePixelBuffer;
}

- (void)setPersonSegmentationConfidencePixelBuffer:(__CVBuffer *)a3
{
  self->_personSegmentationConfidencePixelBuffer = a3;
}

- (__CVBuffer)outDisparity
{
  return self->_outDisparity;
}

- (void)setOutDisparity:(__CVBuffer *)a3
{
  self->_outDisparitdouble y = a3;
}

- (__CVBuffer)binaryLambdaPixelBuffer
{
  return self->_binaryLambdaPixelBuffer;
}

- (void)setBinaryLambdaPixelBuffer:(__CVBuffer *)a3
{
  self->_binaryLambdaPixelBuffer = a3;
}

- (__CVBuffer)H0
{
  return self->_H0;
}

- (void)setH0:(__CVBuffer *)a3
{
  self->_H0 = a3;
}

- (__CVBuffer)H1
{
  return self->_H1;
}

- (void)setH1:(__CVBuffer *)a3
{
  self->_H1 = a3;
}

- (__CVBuffer)V0
{
  return self->_V0;
}

- (void)setV0:(__CVBuffer *)a3
{
  self->_V0 = a3;
}

- (__CVBuffer)V1
{
  return self->_V1;
}

- (void)setV1:(__CVBuffer *)a3
{
  self->_V1 = a3;
}

- (int)disparityQuality
{
  return self->_disparityQuality;
}

- (BOOL)qualityEstimationEnabled
{
  return self->_qualityEstimationEnabled;
}

- (void)setQualityEstimationEnabled:(BOOL)a3
{
  self->_qualityEstimationEnabled = a3;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_focusPixelMetadata, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_moduleSerialNumber, 0);
  objc_storeStrong((id *)&self->_fpDisparityTuningParameters, 0);
  objc_storeStrong((id *)&self->_binaryLambdaTexture, 0);
  objc_storeStrong((id *)&self->_disparityCountBuffer, 0);
  objc_storeStrong((id *)&self->_disparitySumBuffer, 0);
  objc_storeStrong((id *)&self->_segmentationConfidenceTexture, 0);
  objc_storeStrong((id *)&self->_segmentationTexture, 0);
  objc_storeStrong((id *)&self->_rawImageTexture, 0);
  objc_storeStrong((id *)&self->_gChannelTexture, 0);
  for (uint64_t i = 0; i != -4; --i)
    objc_storeStrong((id *)&self->_focusPixelViews[i + 3], 0);
  objc_storeStrong((id *)&self->_fpDisparityEstimator, 0);
  objc_storeStrong((id *)&self->_pyr_image, 0);
  objc_storeStrong((id *)&self->_fpdDemosaic, 0);
  objc_storeStrong((id *)&self->_greenChannelPyramid, 0);
  objc_storeStrong((id *)&self->_gChannelRescale, 0);
  uint64_t v4 = 24;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v4), 0);
    v4 -= 8;
  }
  while (v4);
}

@end