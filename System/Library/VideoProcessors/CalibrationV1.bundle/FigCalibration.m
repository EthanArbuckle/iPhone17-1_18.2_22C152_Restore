@interface FigCalibration
- ($91EEB31E22C960290E85DB462FB2FE46)calibrationConfig;
- (BOOL)_extractAndRunSanityChecks;
- (BOOL)allocateResources;
- (BOOL)allocateResources:(id *)a3;
- (BOOL)isImageFullResolution:(__CVBuffer *)a3;
- (BOOL)isImageScalerOutputResolution:(__CVBuffer *)a3;
- (FigCalibration)init;
- (FigCalibration)initWithCommandQueue:(id)a3;
- (FigCalibrationMetadata)calibrationMetadata;
- (FigMetalContext)metalContext;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)options;
- (NSDictionary)tuningParameters;
- (id)selectTuningParametersForCapture;
- (int)_detectKeypoints:(float)a3;
- (int)_downscaleReference:(__CVBuffer *)a3 auxiliary:(__CVBuffer *)a4 referenceMagnification:(float)a5 gainToApplyToReference:(float)a6;
- (int)finishProcessing;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)prewarmWithTuningParameters:(id)a3;
- (int)process;
- (int)purgeResources;
- (int)resetState;
- (int)setup;
- (opaqueCMSampleBuffer)auxiliarySampleBuffer;
- (opaqueCMSampleBuffer)referenceSampleBuffer;
- (void)dealloc;
- (void)fillShiftMapMetadataWithCalModel:(CalModel *)a3 referenceGDC:(id *)a4 auxiliaryGDC:(id *)a5;
- (void)releaseResources;
- (void)setAuxiliarySampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setCalibrationConfig:(id *)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setOptions:(id)a3;
- (void)setReferenceSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setTuningParameters:(id)a3;
@end

@implementation FigCalibration

- (int)prewarm
{
  return 0;
}

- (int)setup
{
  return 0;
}

- (FigCalibration)init
{
  return (FigCalibration *)objc_msgSend_initWithCommandQueue_(self, a2, 0, v2, v3, v4);
}

- (FigCalibration)initWithCommandQueue:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)FigCalibration;
  id v5 = [(FigCalibration *)&v44 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263F086E0];
    uint64_t v7 = objc_opt_class();
    v12 = objc_msgSend_bundleForClass_(v6, v8, v7, v9, v10, v11);
    id v13 = objc_alloc(MEMORY[0x263F2EE30]);
    uint64_t inited = objc_msgSend_initWithbundle_andOptionalCommandQueue_(v13, v14, (uint64_t)v12, (uint64_t)v4, v15, v16);
    v18 = (void *)*((void *)v5 + 16);
    *((void *)v5 + 16) = inited;

    if (!*((void *)v5 + 16)) {
      goto LABEL_8;
    }
    v19 = [DupDownscaleHalfConvert alloc];
    uint64_t v24 = objc_msgSend_initWithMetalContext_(v19, v20, *((void *)v5 + 16), v21, v22, v23);
    v25 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v24;

    if (!*((void *)v5 + 1)) {
      goto LABEL_8;
    }
    id v26 = objc_alloc(MEMORY[0x263F2EE48]);
    v32 = objc_msgSend_commandQueue(*((void **)v5 + 16), v27, v28, v29, v30, v31);
    uint64_t v37 = objc_msgSend_initWithCommandQueue_(v26, v33, (uint64_t)v32, v34, v35, v36);
    v38 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v37;

    if (!*((void *)v5 + 5))
    {
LABEL_8:
      fig_log_get_emitter();
      FigDebugAssert3();

      v42 = 0;
      goto LABEL_7;
    }
    v39 = (void *)*((void *)v5 + 22);
    *((void *)v5 + 22) = 0;

    uint64_t v40 = objc_opt_new();
    v41 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v40;
  }
  v42 = (FigCalibration *)v5;
LABEL_7:

  return v42;
}

- (int)prewarmWithTuningParameters:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v7 = v4;
  self->_isPrewarming = 1;
  if (v4)
  {
    uint64_t v19 = *MEMORY[0x263F2F1F8];
    v20[0] = v4;
    v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v5, (uint64_t)v20, (uint64_t)&v19, 1, v6);
    objc_msgSend_setOptions_(self, v9, (uint64_t)v8, v10, v11, v12);
    *(int64x2_t *)&self->_calibrationConfig.inputImageWidth = vdupq_n_s64(0x400uLL);
    self->_calibrationConfig.maxPaddingFactor = 1.2;
    *(void *)&self->_calibrationConfig.keypointGridWidth = 0x1800000020;
    *(&self->_calibrationConfig.keypointGridHeight + 1) = 0;
    if (objc_msgSend_prepareToProcess_(self, v13, 0, v14, v15, v16)) {
      int v17 = 0;
    }
    else {
      int v17 = -12786;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v17 = FigSignalErrorAt();
  }
  self->_isPrewarming = 0;

  return v17;
}

- (void)setOptions:(id)a3
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_options, a3);
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x263F2F1F8], v7, v8, v9);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v5, v11, *MEMORY[0x263F2F1E8], v12, v13, v14);
  v20 = objc_msgSend_objectForKeyedSubscript_(v10, v16, @"ADC", v17, v18, v19);

  if (v20)
  {
    uint64_t v21 = (NSMutableDictionary *)objc_opt_new();
    calibrationTuningParameters = self->_calibrationTuningParameters;
    self->_calibrationTuningParameters = v21;

    uint64_t v23 = [CalibrationTuningParameters alloc];
    v27 = objc_msgSend_initWithTuningDictionary_cameraInfoByPortType_(v23, v24, (uint64_t)v10, (uint64_t)v15, v25, v26);
    objc_msgSend_setObject_forKeyedSubscript_(self->_calibrationTuningParameters, v28, (uint64_t)v27, @"config", v29, v30);
  }
  else
  {
    if (v10) {
      BOOL v31 = v15 == 0;
    }
    else {
      BOOL v31 = 1;
    }
    if (v31)
    {
      v32 = self->_calibrationTuningParameters;
      self->_calibrationTuningParameters = 0;
    }
    else
    {
      id v83 = v5;
      v33 = (NSMutableDictionary *)objc_opt_new();
      uint64_t v34 = self->_calibrationTuningParameters;
      self->_calibrationTuningParameters = v33;

      objc_msgSend_objectForKeyedSubscript_(v10, v35, @"portsToConfig", v36, v37, v38);
      v39 = (NSArray *)objc_claimAutoreleasedReturnValue();
      portsToConfig = self->_portsToConfig;
      self->_portsToConfig = v39;

      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      v84 = self;
      obj = self->_portsToConfig;
      uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v86, (uint64_t)v90, 16, v42);
      if (v43)
      {
        uint64_t v48 = v43;
        uint64_t v49 = *(void *)v87;
        while (2)
        {
          for (uint64_t i = 0; i != v48; ++i)
          {
            if (*(void *)v87 != v49) {
              objc_enumerationMutation(obj);
            }
            v51 = *(void **)(*((void *)&v86 + 1) + 8 * i);
            v52 = objc_msgSend_objectForKeyedSubscript_(v51, v44, @"DisparityVersion", v45, v46, v47);
            int v58 = objc_msgSend_intValue(v52, v53, v54, v55, v56, v57);

            if (v58 >= 4)
            {
              v59 = objc_msgSend_objectForKeyedSubscript_(v51, v44, @"Config", v45, v46, v47);
              v60 = [CalibrationTuningParameters alloc];
              v65 = objc_msgSend_objectForKeyedSubscript_(v10, v61, @"BaseConfiguration", v62, v63, v64);
              v66 = v15;
              v70 = objc_msgSend_initWithTuningDictionary_cameraInfoByPortType_(v60, v67, (uint64_t)v65, (uint64_t)v15, v68, v69);

              v75 = objc_msgSend_objectForKeyedSubscript_(v10, v71, (uint64_t)v59, v72, v73, v74);
              LODWORD(v65) = objc_msgSend_updateTuningParametersWith_(v70, v76, (uint64_t)v75, v77, v78, v79);

              if (v65)
              {
                fig_log_get_emitter();
                FigDebugAssert3();

                uint64_t v15 = v66;
                goto LABEL_21;
              }
              objc_msgSend_setObject_forKeyedSubscript_(v84->_calibrationTuningParameters, v80, (uint64_t)v70, (uint64_t)v59, v81, v82);

              uint64_t v15 = v66;
            }
          }
          uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v44, (uint64_t)&v86, (uint64_t)v90, 16, v47);
          if (v48) {
            continue;
          }
          break;
        }
      }
LABEL_21:

      id v5 = v83;
    }
  }
}

- (BOOL)allocateResources:(id *)a3
{
  long long v6 = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_calibrationConfig.inputImageWidth = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_calibrationConfig.maxPaddingFactor = v6;
  return objc_msgSend_allocateResources(self, a2, (uint64_t)a3, v3, v4, v5);
}

- (BOOL)allocateResources
{
  unint64_t inputImageWidth = self->_calibrationConfig.inputImageWidth;
  if ((inputImageWidth & 3) != 0) {
    goto LABEL_21;
  }
  unint64_t inputImageHeight = self->_calibrationConfig.inputImageHeight;
  if ((inputImageHeight & 3) != 0 || !self->_downscaler) {
    goto LABEL_21;
  }
  self->_unint64_t inputImageWidth = inputImageWidth;
  self->_unint64_t inputImageHeight = inputImageHeight;
  unsigned int v9 = inputImageWidth >> 1;
  unsigned int v10 = inputImageHeight >> 1;
  float maxPaddingFactor = self->_calibrationConfig.maxPaddingFactor;
  self->_scalerOutputWidth = v9;
  self->_scalerOutputHeight = v10;
  self->_auxiliaryPaddedWidthMax = ((float)((float)((float)v9 * maxPaddingFactor) + 0.5) & 1)
                                 + (float)((float)((float)v9 * maxPaddingFactor) + 0.5);
  self->_auxiliaryPaddedHeightMax = ((float)((float)((float)v10 * maxPaddingFactor) + 0.5) & 1)
                                  + (float)((float)((float)v10 * maxPaddingFactor) + 0.5);
  unsigned int keypointGridWidth = self->_calibrationConfig.keypointGridWidth;
  unsigned int keypointGridHeight = self->_calibrationConfig.keypointGridHeight;
  self->_unsigned int keypointGridWidth = keypointGridWidth;
  self->_unsigned int keypointGridHeight = keypointGridHeight;
  objc_msgSend_allocateResourcesForMaxNumPoints_(self->_calibration, a2, keypointGridHeight * keypointGridWidth, v2, v3, v4);
  int Resources = objc_msgSend_AllocateResources(self->_downscaler, v14, v15, v16, v17, v18);
  if (Resources) {
    goto LABEL_16;
  }
  v20 = ($9A3F6720D51884C1BD061C340F5007EE *)malloc_type_malloc(24 * self->_keypointGridHeight * self->_keypointGridWidth, 0xAF239CDEuLL);
  self->_keypointListRtb = v20;
  if (!v20
    || (size_t v21 = 16 * self->_keypointGridWidth * self->_keypointGridHeight,
        uint64_t v22 = (double *)malloc_type_malloc(v21, 0xF81DE3CFuLL),
        (self->_adaptiveCorrectionKeypointsReferenceDistorted = v22) == 0)
    || (uint64_t v23 = (double *)malloc_type_malloc(v21, 0x7981F6EBuLL),
        (self->_adaptiveCorrectionKeypointsAuxiliaryDistorted = v23) == 0))
  {
LABEL_21:
    fig_log_get_emitter();
    uint64_t v34 = v5;
    LODWORD(v33) = 0;
    goto LABEL_22;
  }
  LODWORD(v25) = 1061997773;
  int Resources = objc_msgSend_allocateResources_imageWidth_imageHeight_gridWidth_gridHeight_templateRadius_searchRadius_minNCCThreshold_(self->_keypointDetRtb, v24, 4, self->_inputImageWidth >> 1, self->_inputImageHeight >> 1, self->_keypointGridWidth, self->_keypointGridHeight, 7, v25, 3);
  if (!Resources)
  {
    if ((sub_262E84F88(&self->_auxiliaryImageLow, self->_scalerOutputWidth, self->_scalerOutputHeight, 1111970369) & 1) != 0
      && (sub_262E84F88(&self->_referenceImageLow, self->_auxiliaryPaddedWidthMax, self->_auxiliaryPaddedHeightMax, 1111970369) & 1) != 0&& (sub_262E84F88(&self->_referenceImageLowLumaOnly, self->_scalerOutputWidth, self->_scalerOutputHeight, 1278226488) & 1) != 0&& (sub_262E84F88(&self->_auxiliaryImageCropped, self->_scalerOutputWidth, self->_scalerOutputHeight, 1111970369) & 1) != 0)
    {
      return 1;
    }
    goto LABEL_21;
  }
LABEL_16:
  int v27 = Resources;
  fig_log_get_emitter();
  uint64_t v34 = v5;
  LODWORD(v33) = v27;
LABEL_22:
  FigDebugAssert3();
  objc_msgSend_releaseResources(self, v28, v29, v30, v31, v32, v33, v34);
  return 0;
}

- (void)dealloc
{
  objc_msgSend_releaseResources(self, a2, v2, v3, v4, v5);
  v7.receiver = self;
  v7.super_class = (Class)FigCalibration;
  [(FigCalibration *)&v7 dealloc];
}

- (void)releaseResources
{
  calibrationMetadata = self->_calibrationMetadata;
  self->_calibrationMetadata = 0;

  referenceImageLow = self->_referenceImageLow;
  if (referenceImageLow)
  {
    CFRelease(referenceImageLow);
    self->_referenceImageLow = 0;
  }
  referenceImageLowLumaOnly = self->_referenceImageLowLumaOnly;
  if (referenceImageLowLumaOnly)
  {
    CFRelease(referenceImageLowLumaOnly);
    self->_referenceImageLowLumaOnly = 0;
  }
  auxiliaryImageLow = self->_auxiliaryImageLow;
  if (auxiliaryImageLow)
  {
    CFRelease(auxiliaryImageLow);
    self->_auxiliaryImageLow = 0;
  }
  auxiliaryImageCropped = self->_auxiliaryImageCropped;
  if (auxiliaryImageCropped)
  {
    CFRelease(auxiliaryImageCropped);
    self->_auxiliaryImageCropped = 0;
  }
  objc_msgSend_ReleaseResources(self->_downscaler, v4, v5, v6, v7, v8);
  objc_msgSend_releaseResources(self->_keypointDetRtb, v13, v14, v15, v16, v17);
  adaptiveCorrectionKeypointsReferenceDistorted = self->_adaptiveCorrectionKeypointsReferenceDistorted;
  if (adaptiveCorrectionKeypointsReferenceDistorted)
  {
    self->_adaptiveCorrectionKeypointsReferenceDistorted = 0;
    free(adaptiveCorrectionKeypointsReferenceDistorted);
  }
  adaptiveCorrectionKeypointsAuxiliaryDistorted = self->_adaptiveCorrectionKeypointsAuxiliaryDistorted;
  if (adaptiveCorrectionKeypointsAuxiliaryDistorted)
  {
    self->_adaptiveCorrectionKeypointsAuxiliaryDistorted = 0;
    free(adaptiveCorrectionKeypointsAuxiliaryDistorted);
  }
  keypointListRtb = self->_keypointListRtb;
  if (keypointListRtb)
  {
    self->_keypointListRtb = 0;
    free(keypointListRtb);
  }
}

- (BOOL)_extractAndRunSanityChecks
{
  referenceSampleBuffer = self->_referenceSampleBuffer;
  if (referenceSampleBuffer)
  {
    if (self->_auxiliarySampleBuffer)
    {
      if (self->_options)
      {
        CFStringRef v4 = (const __CFString *)*MEMORY[0x263F2EF78];
        CMGetAttachment(referenceSampleBuffer, (CFStringRef)*MEMORY[0x263F2EF78], 0);
        uint64_t v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        referenceMeta = self->_referenceMeta;
        self->_referenceMeta = v5;

        if (self->_referenceMeta)
        {
          CMGetAttachment(self->_auxiliarySampleBuffer, v4, 0);
          uint64_t v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          auxiliaryMeta = self->_auxiliaryMeta;
          self->_auxiliaryMeta = v7;

          if (self->_auxiliaryMeta)
          {
            ImageBuffer = CMSampleBufferGetImageBuffer(self->_auxiliarySampleBuffer);
            self->_auxiliaryImageFull = ImageBuffer;
            if (ImageBuffer)
            {
              unsigned int v10 = CMSampleBufferGetImageBuffer(self->_referenceSampleBuffer);
              self->_referenceImageFull = v10;
              if (v10)
              {
                if ((objc_msgSend_isImageFullResolution_(self, v11, (uint64_t)v10, v12, v13, v14) & 1) != 0
                  && (objc_msgSend_isImageFullResolution_(self, v15, (uint64_t)self->_auxiliaryImageFull, v16, v17, v18) & 1) != 0)
                {
                  referenceImageLow = self->_referenceImageLow;
                  unsigned int auxiliaryPaddedWidthMax = self->_auxiliaryPaddedWidthMax;
                  unsigned int auxiliaryPaddedHeightMax = self->_auxiliaryPaddedHeightMax;
                  if (auxiliaryPaddedWidthMax == CVPixelBufferGetWidth(referenceImageLow)
                    && auxiliaryPaddedHeightMax == CVPixelBufferGetHeight(referenceImageLow)
                    && (objc_msgSend_isImageScalerOutputResolution_(self, v22, (uint64_t)self->_auxiliaryImageLow, v23, v24, v25) & 1) != 0&& CVPixelBufferGetPixelFormatType(self->_referenceImageFull) == 875704422&& CVPixelBufferGetPixelFormatType(self->_auxiliaryImageFull) == 875704422&& CVPixelBufferGetPixelFormatType(self->_referenceImageLow) == 1111970369&& CVPixelBufferGetPixelFormatType(self->_auxiliaryImageLow) == 1111970369)
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

- (int)process
{
  CFStringRef v4 = (FigCalibrationMetadata *)objc_opt_new();
  calibrationMetadata = self->_calibrationMetadata;
  self->_calibrationMetadata = v4;

  uint64_t v166 = 0;
  long long v165 = 0u;
  long long v164 = 0u;
  long long v163 = 0u;
  long long v162 = 0u;
  long long v161 = 0u;
  long long v160 = 0u;
  long long v159 = 0u;
  long long v158 = 0u;
  long long v157 = 0u;
  long long v156 = 0u;
  float64x2_t v155 = 0u;
  *(_OWORD *)self->_gdcParametersReference.distortPolynomCoefficients = 0u;
  *(_OWORD *)&self->_gdcParametersReference.distortPolynomCoefficients[4] = 0u;
  *(_OWORD *)self->_gdcParametersReference.undistortPolynomCoefficients = 0u;
  *(_OWORD *)&self->_gdcParametersReference.undistortPolynomCoefficients[4] = 0u;
  *(_OWORD *)&self->_gdcParametersReference.centerX = 0u;
  *(_OWORD *)&self->_gdcParametersReference.pixelSize = 0u;
  *(_OWORD *)&self->_gdcParametersReference.homography[3] = 0u;
  *(_OWORD *)&self->_gdcParametersReference.homography[7] = 0u;
  *(_OWORD *)&self->_gdcParametersReference.inverseHomography[2] = 0u;
  *(_OWORD *)&self->_gdcParametersReference.inverseHomography[6] = 0u;
  self->_gdcParametersReference.disparityScalingFactor = 0.0;
  self->_gdcParametersAuxiliary.disparityScalingFactor = 0.0;
  *(_OWORD *)&self->_gdcParametersAuxiliary.inverseHomography[2] = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.inverseHomography[6] = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.homography[3] = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.homography[7] = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.centerX = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.pixelSize = 0u;
  *(_OWORD *)self->_gdcParametersAuxiliary.undistortPolynomCoefficients = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.undistortPolynomCoefficients[4] = 0u;
  *(_OWORD *)self->_gdcParametersAuxiliary.distortPolynomCoefficients = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.distortPolynomCoefficients[4] = 0u;
  char v11 = objc_msgSend__extractAndRunSanityChecks(self, v6, v7, v8, v9, v10);
  uint64_t v17 = (_DWORD *)MEMORY[0x263F00E10];
  if ((v11 & 1) == 0)
  {
    fig_log_get_emitter();
    uint64_t v120 = v2;
    int v119 = 0;
    FigDebugAssert3();
LABEL_47:
    int v112 = 0;
    int v74 = 0;
    LOBYTE(v18) = 0;
    goto LABEL_48;
  }
  uint64_t v18 = objc_msgSend_selectTuningParametersForCapture(self, v12, v13, v14, v15, v16);
  if (!v18)
  {
    fig_log_get_emitter();
    uint64_t v120 = v2;
    int v119 = 0;
    FigDebugAssert3();
    int v112 = 0;
    int v74 = 0;
LABEL_48:
    int v113 = 4;
    goto LABEL_29;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(self->_auxiliarySampleBuffer);
  v20 = CMSampleBufferGetImageBuffer(self->_referenceSampleBuffer);
  calibration = self->_calibration;
  unsigned int Width = CVPixelBufferGetWidth(v20);
  unsigned int Height = CVPixelBufferGetHeight(v20);
  unsigned int v24 = CVPixelBufferGetWidth(ImageBuffer);
  unsigned int v25 = CVPixelBufferGetHeight(ImageBuffer);
  objc_msgSend_setReferenceBufferDimensions_auxillaryBufferDimensions_normalizedReferenceFinalCropRect_(calibration, v26, Width | ((unint64_t)Height << 32), v24 | ((unint64_t)v25 << 32), v27, v28, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
  uint64_t v29 = self->_calibration;
  auxiliaryMeta = self->_auxiliaryMeta;
  referenceMeta = self->_referenceMeta;
  options = self->_options;
  objc_msgSend_adaptiveCorrectionConfig(v18, v33, v34, v35, v36, v37);
  int ParametersFromReferenceMetadata_auxiliaryMetadata_options_adaptiveCorrectionConfig_useReferenceFrame = objc_msgSend_extractParametersFromReferenceMetadata_auxiliaryMetadata_options_adaptiveCorrectionConfig_useReferenceFrame_(v29, v38, (uint64_t)referenceMeta, (uint64_t)auxiliaryMeta, (uint64_t)options, (uint64_t)v154, 1);
  if (ParametersFromReferenceMetadata_auxiliaryMetadata_options_adaptiveCorrectionConfig_useReferenceFrame
    || (int ParametersFromReferenceMetadata_auxiliaryMetadata_options_adaptiveCorrectionConfig_useReferenceFrame = objc_msgSend_computeInitialCalibration(self->_calibration, v40, v41, v42, v43, v44)) != 0)
  {
    int v116 = ParametersFromReferenceMetadata_auxiliaryMetadata_options_adaptiveCorrectionConfig_useReferenceFrame;
    fig_log_get_emitter();
    uint64_t v120 = v2;
    int v119 = v116;
LABEL_45:
    FigDebugAssert3();

    int v112 = 0;
    int v74 = 0;
    LOBYTE(v18) = 0;
    int v113 = 4;
    uint64_t v17 = (_DWORD *)MEMORY[0x263F00E10];
    goto LABEL_29;
  }
  objc_msgSend_referenceMagnification(self->_calibration, v45, v46, v47, v48, v49);
  if (v53 <= 0.0)
  {
    fig_log_get_emitter();
    uint64_t v120 = v2;
    int v119 = 0;
    goto LABEL_45;
  }
  float v54 = v53;
  int v55 = objc_msgSend__downscaleReference_auxiliary_referenceMagnification_gainToApplyToReference_(self, v50, (uint64_t)v20, (uint64_t)ImageBuffer, v51, v52);
  uint64_t v17 = (_DWORD *)MEMORY[0x263F00E10];
  if (v55)
  {
    int v117 = v55;
    fig_log_get_emitter();
    uint64_t v120 = v2;
    int v119 = v117;
    FigDebugAssert3();

    goto LABEL_47;
  }
  self->_keypointsCount = 0;
  *(float *)&double v61 = v54;
  if (objc_msgSend__detectKeypoints_(self, v56, v57, v58, v59, v60, v61))
  {
    fig_log_get_emitter();
    uint64_t v120 = v2;
    int v119 = 0;
    FigDebugAssert3();

    int v112 = 0;
    int v74 = 0;
    LOBYTE(v18) = 0;
    int v113 = 1;
    goto LABEL_29;
  }
  if (*v17 == 1) {
    kdebug_trace();
  }
  objc_msgSend_setKeypointsForReference_auxiliary_keypointCount_(self->_calibration, v62, (uint64_t)self->_adaptiveCorrectionKeypointsReferenceDistorted, (uint64_t)self->_adaptiveCorrectionKeypointsAuxiliaryDistorted, self->_keypointsCount, v63);
  int v74 = objc_msgSend_computeCalibration(self->_calibration, v64, v65, v66, v67, v68);
  v75 = self->_calibration;
  if (v75)
  {
    objc_msgSend_correctedCalibration(v75, v69, v70, v71, v72, v73);
    v75 = self->_calibration;
  }
  else
  {
    uint64_t v153 = 0;
    long long v151 = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    float64x2_t v142 = 0u;
  }
  long long v163 = v150;
  long long v164 = v151;
  long long v165 = v152;
  uint64_t v166 = v153;
  long long v159 = v146;
  long long v160 = v147;
  long long v161 = v148;
  long long v162 = v149;
  float64x2_t v155 = v142;
  long long v156 = v143;
  long long v157 = v144;
  long long v158 = v145;
  if (v75)
  {
    objc_msgSend_distModelFor_(v75, v69, 0, v71, v72, v73);
    v80 = self->_calibration;
    long long v148 = v128;
    long long v149 = v129;
    long long v150 = v130;
    long long v151 = v131;
    long long v144 = v124;
    long long v145 = v125;
    long long v146 = v126;
    long long v147 = v127;
    float64x2_t v142 = v122;
    long long v143 = v123;
    if (v80)
    {
      objc_msgSend_undistModelFor_(v80, v76, 0, v77, v78, v79);
      goto LABEL_18;
    }
  }
  else
  {
    long long v150 = 0u;
    long long v151 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    float64x2_t v142 = 0u;
    long long v143 = 0u;
  }
  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  float64x2_t v122 = 0u;
  long long v123 = 0u;
LABEL_18:
  long long v138 = v128;
  long long v139 = v129;
  long long v140 = v130;
  long long v141 = v131;
  long long v134 = v124;
  long long v135 = v125;
  long long v136 = v126;
  long long v137 = v127;
  float64x2_t v132 = v122;
  long long v133 = v123;
  int v81 = sub_262E86298(&v142, v132.f64, (uint64_t)&self->_gdcParametersReference, (float)self->_inputImageWidth, (float)self->_inputImageHeight);
  if (v81)
  {
LABEL_50:
    int v118 = v81;
    fig_log_get_emitter();
    uint64_t v120 = v2;
    int v119 = v118;
    FigDebugAssert3();

    LOBYTE(v18) = 0;
    int v113 = 4;
    int v112 = 1;
    goto LABEL_29;
  }
  long long v86 = self->_calibration;
  if (!v86)
  {
    long long v150 = 0u;
    long long v151 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    float64x2_t v142 = 0u;
    long long v143 = 0u;
    goto LABEL_23;
  }
  objc_msgSend_distModelFor_(v86, v82, 1, v83, v84, v85);
  uint64_t v91 = self->_calibration;
  long long v148 = v128;
  long long v149 = v129;
  long long v150 = v130;
  long long v151 = v131;
  long long v144 = v124;
  long long v145 = v125;
  long long v146 = v126;
  long long v147 = v127;
  float64x2_t v142 = v122;
  long long v143 = v123;
  if (!v91)
  {
LABEL_23:
    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    float64x2_t v122 = 0u;
    long long v123 = 0u;
    goto LABEL_24;
  }
  objc_msgSend_undistModelFor_(v91, v87, 1, v88, v89, v90);
LABEL_24:
  long long v138 = v128;
  long long v139 = v129;
  long long v140 = v130;
  long long v141 = v131;
  long long v134 = v124;
  long long v135 = v125;
  long long v136 = v126;
  long long v137 = v127;
  float64x2_t v132 = v122;
  long long v133 = v123;
  int v81 = sub_262E86298(&v142, v132.f64, (uint64_t)&self->_gdcParametersAuxiliary, (float)self->_inputImageWidth, (float)self->_inputImageHeight);
  if (v81) {
    goto LABEL_50;
  }
  v97 = self->_calibration;
  objc_msgSend_nearLimitDistanceMM(v18, v92, v93, v94, v95, v96);
  unsigned int v121 = v98;
  objc_msgSend_midLimitDistanceMM(v18, v99, v100, v101, v102, v103);
  int v81 = objc_msgSend_computeStereoRectificationHomographies_(v97, v104, v105, v106, v107, v108, COERCE_DOUBLE(__PAIR64__(v109, v121)));
  if (v81) {
    goto LABEL_50;
  }
  if (*v17 == 1) {
    kdebug_trace();
  }

  int v112 = 0;
  int v113 = 0;
  LOBYTE(v18) = 1;
LABEL_29:
  objc_msgSend_fillShiftMapMetadataWithCalModel_referenceGDC_auxiliaryGDC_(self, v110, (uint64_t)&v155, (uint64_t)&self->_gdcParametersReference, (uint64_t)&self->_gdcParametersAuxiliary, v111, v119, v120);
  if (v112 && *v17 == 1) {
    kdebug_trace();
  }
  if (v74 == 1) {
    int v114 = 2;
  }
  else {
    int v114 = 4;
  }
  if (v74 == 2) {
    int v114 = 3;
  }
  if ((v18 & (v74 != 0)) != 0) {
    return v114;
  }
  else {
    return v113;
  }
}

- (int)finishProcessing
{
  objc_msgSend_waitForIdle(self->_metalContext, a2, v2, v3, v4, v5);
  return 0;
}

- (int)prepareToProcess:(unsigned int)a3
{
  if (objc_msgSend_allocateResources(self, a2, *(uint64_t *)&a3, v3, v4, v5)) {
    return 0;
  }
  else {
    return 4;
  }
}

- (int)purgeResources
{
  objc_msgSend_releaseResources(self, a2, v2, v3, v4, v5);
  return 0;
}

- (int)resetState
{
  return 0;
}

- (void)fillShiftMapMetadataWithCalModel:(CalModel *)a3 referenceGDC:(id *)a4 auxiliaryGDC:(id *)a5
{
  double v189 = a3->focalLengthPix[0];
  double v183 = a3->focalLengthPix[1];
  double v187 = a3->opticalCenterX[0];
  double v181 = a3->opticalCenterX[1];
  double v185 = a3->opticalCenterY[0];
  double v8 = a3->extrinRotRefefenceToAuxiliary[0];
  double v179 = a3->opticalCenterY[1];
  double v10 = a3->extrinRotRefefenceToAuxiliary[1];
  double v9 = a3->extrinRotRefefenceToAuxiliary[2];
  double v11 = a3->extrinRotRefefenceToAuxiliary[4];
  double v12 = a3->extrinRotRefefenceToAuxiliary[5];
  double v13 = a3->extrinRotRefefenceToAuxiliary[8];
  double v14 = a3->extrinRotRefefenceToAuxiliary[9];
  double v177 = a3->extrinRotRefefenceToAuxiliary[3];
  double v15 = a3->extrinRotRefefenceToAuxiliary[6];
  double v175 = a3->extrinRotRefefenceToAuxiliary[7];
  double v171 = a3->extrinRotRefefenceToAuxiliary[10];
  double v173 = a3->extrinRotRefefenceToAuxiliary[11];
  long long v192 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  long long v193 = *MEMORY[0x263EF89A0];
  long long v191 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
  id v16 = objc_alloc(MEMORY[0x263EFF980]);
  id v194 = (id)objc_msgSend_initWithCapacity_(v16, v17, 8, v18, v19, v20);
  id v21 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v26 = objc_msgSend_initWithCapacity_(v21, v22, 8, v23, v24, v25);
  id v27 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v32 = objc_msgSend_initWithCapacity_(v27, v28, 8, v29, v30, v31);
  id v33 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v43 = objc_msgSend_initWithCapacity_(v33, v34, 8, v35, v36, v37);
  for (uint64_t i = 0; i != 8; ++i)
  {
    uint64_t v46 = (_DWORD *)&a4->var0[i];
    v44.i32[0] = v46[8];
    uint64_t v47 = objc_msgSend_numberWithFloat_(NSNumber, v38, v39, v40, v41, v42, *(double *)v44.i64, *(void *)&v171);
    objc_msgSend_setObject_atIndexedSubscript_(v194, v48, (uint64_t)v47, i, v49, v50);

    LODWORD(v51) = *v46;
    uint64_t v57 = objc_msgSend_numberWithFloat_(NSNumber, v52, v53, v54, v55, v56, v51);
    objc_msgSend_setObject_atIndexedSubscript_(v26, v58, (uint64_t)v57, i, v59, v60);

    double v61 = (_DWORD *)&a5->var0[i];
    LODWORD(v62) = v61[8];
    uint64_t v68 = objc_msgSend_numberWithFloat_(NSNumber, v63, v64, v65, v66, v67, v62);
    objc_msgSend_setObject_atIndexedSubscript_(v32, v69, (uint64_t)v68, i, v70, v71);

    LODWORD(v72) = *v61;
    uint64_t v78 = objc_msgSend_numberWithFloat_(NSNumber, v73, v74, v75, v76, v77, v72);
    objc_msgSend_setObject_atIndexedSubscript_(v43, v79, (uint64_t)v78, i, v80, v81);
  }
  uint64_t v84 = 0;
  v44.f32[0] = v8;
  v82.f32[0] = v10;
  v83.f32[0] = v9;
  float32_t v85 = v11;
  float32_t v86 = v12;
  float32_t v87 = v15;
  float32_t v88 = v13;
  float32_t v89 = v14;
  v44.f32[1] = v85;
  v44.f32[2] = v88;
  v82.f32[1] = v86;
  v82.f32[2] = v89;
  v83.f32[1] = v87;
  float32_t v90 = v171;
  v83.f32[2] = v90;
  long long v195 = xmmword_262E89AE0;
  long long v196 = xmmword_262E89AF0;
  long long v197 = xmmword_262E89A60;
  long long v198 = 0u;
  long long v199 = 0u;
  int32x4_t v200 = 0u;
  do
  {
    *(long long *)((char *)&v198 + v84) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v44, COERCE_FLOAT(*(long long *)((char *)&v195 + v84))), v82, *(float32x2_t *)((char *)&v195 + v84), 1), v83, *(float32x4_t *)((char *)&v195 + v84), 2);
    v84 += 16;
  }
  while (v84 != 48);
  uint64_t v91 = 0;
  long long v195 = v198;
  long long v196 = v199;
  long long v197 = (__int128)v200;
  long long v198 = 0u;
  long long v199 = 0u;
  int32x4_t v200 = 0u;
  do
  {
    *(long long *)((char *)&v198 + v91) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_262E89AE0, COERCE_FLOAT(*(long long *)((char *)&v195 + v91))), (float32x4_t)xmmword_262E89AF0, *(float32x2_t *)((char *)&v195 + v91), 1), (float32x4_t)xmmword_262E89A60, *(float32x4_t *)((char *)&v195 + v91), 2);
    v91 += 16;
  }
  while (v91 != 48);
  int32x4_t v92 = vzip1q_s32((int32x4_t)v198, v200);
  float32x4_t v93 = (float32x4_t)vzip1q_s32(v92, (int32x4_t)v199);
  float32x4_t v94 = (float32x4_t)vtrn2q_s32((int32x4_t)v198, (int32x4_t)v199);
  v94.i32[2] = v200.i32[1];
  float32x4_t v95 = (float32x4_t)vzip1q_s32(vzip2q_s32((int32x4_t)v198, v200), vdupq_laneq_s32((int32x4_t)v199, 2));
  float v96 = v177;
  float v97 = v175;
  float v98 = v173;
  float32x4_t v99 = vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32((float32x4_t)xmmword_262E89AE0, v96), (float32x4_t)xmmword_262E89AF0, v97), (float32x4_t)xmmword_262E89A60, v98);
  double v176 = *(double *)v95.i64;
  *(void *)&double v178 = vnegq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v93, v99.f32[0]), v94, *(float32x2_t *)v99.f32, 1), v95, v99, 2)).u64[0];
  double v172 = *(double *)v93.i64;
  *(void *)&double v174 = vzip2q_s32(v92, vdupq_lane_s32(*(int32x2_t *)&v199, 1)).u64[0];
  *(float *)&unsigned int v100 = v183;
  HIDWORD(v101) = HIDWORD(v181);
  *(float *)&double v101 = v181;
  v94.i32[1] = HIDWORD(v179);
  v94.f32[0] = v179;
  __asm { FMOV            V4.4S, #1.0 }
  v92.i32[0] = 0;
  *(void *)&double v184 = vzip1q_s32(vzip2q_s32(vdupq_lane_s32(*(int32x2_t *)&v101, 0), _Q4), (int32x4_t)v94).u64[0];
  LODWORD(v101) = 0;
  HIDWORD(v101) = v100;
  *(void *)&double v180 = v100;
  double v182 = v101;
  *(float *)&unsigned int v107 = v189;
  HIDWORD(v101) = HIDWORD(v187);
  *(float *)&double v101 = v187;
  v94.i32[1] = HIDWORD(v185);
  v94.f32[0] = v185;
  v92.i32[1] = v107;
  double v188 = *(double *)v92.i64;
  *(void *)&double v190 = vzip1q_s32(vzip2q_s32(vdupq_lane_s32(*(int32x2_t *)&v101, 0), _Q4), (int32x4_t)v94).u64[0];
  *(void *)&double v186 = v107;
  float32x4_t v108 = vmulq_f32(v99, v99);
  v108.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v108, 2), vaddq_f32(v108, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v108.f32, 1))).u64[0];
  v108.f32[0] = sqrtf(v108.f32[0]);
  objc_msgSend_setBaseline_(self->_calibrationMetadata, v38, v39, v40, v41, v42, *(double *)v108.i64);
  objc_msgSend_setReferenceExtrinsicMatrix_(self->_calibrationMetadata, v109, v110, v111, v112, v113, *(double *)&v193, *(double *)&v192, *(double *)&v191, 0.0);
  objc_msgSend_setReferenceIntrinsicMatrix_(self->_calibrationMetadata, v114, v115, v116, v117, v118, v186, v188, v190);
  objc_msgSend_setReferenceInverseLensDistortionCoefficients_(self->_calibrationMetadata, v119, (uint64_t)v26, v120, v121, v122);
  objc_msgSend_setReferenceLensDistortionCoefficients_(self->_calibrationMetadata, v123, (uint64_t)v194, v124, v125, v126);
  objc_msgSend_setReferenceLensDistortionOpticalCenter_(self->_calibrationMetadata, v127, v128, v129, v130, v131, a4->var2, a4->var3);
  *(float *)&double v132 = a4->var6;
  objc_msgSend_setReferencePixelSizeInMillimeters_(self->_calibrationMetadata, v133, v134, v135, v136, v137, v132);
  objc_msgSend_setAuxiliaryExtrinsicMatrix_(self->_calibrationMetadata, v138, v139, v140, v141, v142, v172, v174, v176, v178);
  objc_msgSend_setAuxiliaryIntrinsicMatrix_(self->_calibrationMetadata, v143, v144, v145, v146, v147, v180, v182, v184);
  objc_msgSend_setAuxiliaryInverseLensDistortionCoefficients_(self->_calibrationMetadata, v148, (uint64_t)v43, v149, v150, v151);
  objc_msgSend_setAuxiliaryLensDistortionCoefficients_(self->_calibrationMetadata, v152, (uint64_t)v32, v153, v154, v155);
  objc_msgSend_setAuxiliaryLensDistortionOpticalCenter_(self->_calibrationMetadata, v156, v157, v158, v159, v160, a5->var2, a5->var3);
  *(float *)&double v161 = a5->var6;
  objc_msgSend_setAuxiliaryPixelSizeInMillimeters_(self->_calibrationMetadata, v162, v163, v164, v165, v166, v161);
  objc_msgSend_setVersion_(self->_calibrationMetadata, v167, 1, v168, v169, v170);
}

- (int)_detectKeypoints:(float)a3
{
  uint64_t v5 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, a2, (uint64_t)self->_referenceImageLowLumaOnly, 10, 17, 0);
  if (!v5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    double v8 = 0;
LABEL_17:
    int v24 = -12782;
    goto LABEL_14;
  }
  double v8 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v4, (uint64_t)self->_auxiliaryImageCropped, 10, 17, 0);
  if (!v8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_17;
  }
  int v9 = objc_msgSend_processReferenceImage_histogram_doWaitForIdle_(self->_keypointDetRtb, v6, (uint64_t)v5, 0, 0, v7);
  if (v9
    || (int v9 = objc_msgSend_computeTransform_transform_outputCorners_solverSelector_histogram_roi_(self->_keypointDetRtb, v10, (uint64_t)v8, 0, (uint64_t)self->_keypointListRtb, 1, 0, 0)) != 0)
  {
    int v24 = v9;
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    if (fabsf(a3 + -2.0) <= 0.05)
    {
      float32x2_t v13 = vcvt_f32_u32(vshr_n_u32(*(uint32x2_t *)&self->_inputImageWidth, 2uLL));
      __asm { FMOV            V0.2S, #1.0 }
    }
    else
    {
      float32x2_t v11 = vcvt_f32_u32(*(uint32x2_t *)&self->_inputImageWidth);
      _D0 = vdiv_f32(v11, vmul_n_f32(vcvt_f32_u32(*(uint32x2_t *)&self->_scalerOutputWidth), a3));
      float32x2_t v13 = vmul_n_f32(v11, (float)(1.0 - (float)(1.0 / a3)) * 0.5);
    }
    uint64_t v18 = self->_keypointGridHeight * self->_keypointGridWidth;
    if (v18)
    {
      p_var4 = &self->_keypointListRtb->var4;
      do
      {
        if (*p_var4 > 0.0)
        {
          unsigned int keypointsCount = self->_keypointsCount;
          uint64_t v21 = 2 * keypointsCount;
          float32x2_t v22 = *(float32x2_t *)(p_var4 - 2);
          adaptiveCorrectionKeypointsAuxiliaryDistorted = self->_adaptiveCorrectionKeypointsAuxiliaryDistorted;
          *(float64x2_t *)&self->_adaptiveCorrectionKeypointsReferenceDistorted[v21] = vcvtq_f64_f32(vadd_f32(*(float32x2_t *)(p_var4 - 4), *(float32x2_t *)(p_var4 - 4)));
          *(float64x2_t *)&adaptiveCorrectionKeypointsAuxiliaryDistorted[v21] = vcvtq_f64_f32(vmla_f32(v13, _D0, v22));
          self->_unsigned int keypointsCount = keypointsCount + 1;
        }
        p_var4 += 6;
        --v18;
      }
      while (v18);
    }
    int v24 = 0;
  }
LABEL_14:

  return v24;
}

- (int)_downscaleReference:(__CVBuffer *)a3 auxiliary:(__CVBuffer *)a4 referenceMagnification:(float)a5 gainToApplyToReference:(float)a6
{
  float v9 = fabsf(a5 + -2.0);
  *(float *)&double v10 = a6;
  int ImageYUVA_outYuvaWidth_outYuvaHeight_outY_inYuv420_gainToApplyToOutputs_waitForCompletion = objc_msgSend_GenerateImageYUVA_outYuvaWidth_outYuvaHeight_outY_inYuv420_gainToApplyToOutputs_waitForCompletion_(self->_downscaler, a2, (uint64_t)self->_referenceImageLow, self->_scalerOutputWidth, self->_scalerOutputHeight, (uint64_t)self->_referenceImageLowLumaOnly, a3, 0, v10);
  int v14 = ImageYUVA_outYuvaWidth_outYuvaHeight_outY_inYuv420_gainToApplyToOutputs_waitForCompletion;
  if (v9 <= 0.05)
  {
    if (ImageYUVA_outYuvaWidth_outYuvaHeight_outY_inYuv420_gainToApplyToOutputs_waitForCompletion) {
      goto LABEL_11;
    }
    int v14 = objc_msgSend_DownscaleConvertAndCenterCrop_outCroppedLuma_inYuv420_(self->_downscaler, v12, (uint64_t)self->_auxiliaryImageLow, (uint64_t)self->_auxiliaryImageCropped, (uint64_t)a4, v13);
    if (v14) {
      goto LABEL_11;
    }
  }
  else
  {
    if (ImageYUVA_outYuvaWidth_outYuvaHeight_outY_inYuv420_gainToApplyToOutputs_waitForCompletion) {
      goto LABEL_11;
    }
    int ImageYUVA_outY_inYuv420_waitForCompletion = objc_msgSend_GenerateImageYUVA_outY_inYuv420_waitForCompletion_(self->_downscaler, v12, (uint64_t)self->_auxiliaryImageLow, 0, (uint64_t)a4, 0);
    if (ImageYUVA_outY_inYuv420_waitForCompletion)
    {
      int v14 = ImageYUVA_outY_inYuv420_waitForCompletion;
      fig_log_get_emitter();
LABEL_12:
      FigDebugAssert3();
      return v14;
    }
    *(float *)&double v19 = a5;
    int v14 = objc_msgSend_DownscaleAndCrop_outY_inYuv420_(self->_downscaler, v16, (uint64_t)self->_auxiliaryImageCropped, (uint64_t)a4, v17, v18, v19);
    if (v14)
    {
LABEL_11:
      fig_log_get_emitter();
      goto LABEL_12;
    }
  }
  return v14;
}

- (id)selectTuningParametersForCapture
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  if (objc_msgSend_count(self->_calibrationTuningParameters, a2, v2, v3, v4, v5) == 1
    && (objc_msgSend_objectForKeyedSubscript_(self->_calibrationTuningParameters, v7, @"config", v8, v9, v10), float32x2_t v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    double v12 = objc_msgSend_objectForKeyedSubscript_(self->_calibrationTuningParameters, v7, @"config", v8, v9, v10);
  }
  else
  {
    uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(self->_referenceMeta, v7, @"PortType", v8, v9, v10);
    uint64_t v53 = objc_msgSend_objectForKeyedSubscript_(self->_auxiliaryMeta, v14, @"PortType", v15, v16, v17);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v18 = self->_portsToConfig;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v54, (uint64_t)v58, 16, v20);
    if (v21)
    {
      uint64_t v26 = v21;
      uint64_t v52 = self;
      uint64_t v27 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v55 != v27) {
            objc_enumerationMutation(v18);
          }
          uint64_t v29 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v29, v22, @"Reference", v23, v24, v25, v52);
          if (objc_msgSend_isEqualToString_(v30, v31, (uint64_t)v13, v32, v33, v34))
          {
            uint64_t v39 = objc_msgSend_objectForKeyedSubscript_(v29, v35, @"Auxiliary", v36, v37, v38);
            char isEqualToString = objc_msgSend_isEqualToString_(v39, v40, (uint64_t)v53, v41, v42, v43);

            if (isEqualToString)
            {
              calibrationTuningParameters = v52->_calibrationTuningParameters;
              uint64_t v46 = objc_msgSend_objectForKeyedSubscript_(v29, v22, @"Config", v23, v24, v25);
              double v12 = objc_msgSend_objectForKeyedSubscript_(calibrationTuningParameters, v47, (uint64_t)v46, v48, v49, v50);

              goto LABEL_16;
            }
          }
          else
          {
          }
        }
        uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v22, (uint64_t)&v54, (uint64_t)v58, 16, v25);
      }
      while (v26);
    }
    double v12 = 0;
LABEL_16:
  }

  return v12;
}

- (BOOL)isImageFullResolution:(__CVBuffer *)a3
{
  unsigned int inputImageWidth = self->_inputImageWidth;
  unsigned int inputImageHeight = self->_inputImageHeight;
  return inputImageWidth == CVPixelBufferGetWidth(a3)
      && inputImageHeight == CVPixelBufferGetHeight(a3);
}

- (BOOL)isImageScalerOutputResolution:(__CVBuffer *)a3
{
  scalerOutputunsigned int Width = self->_scalerOutputWidth;
  scalerOutputunsigned int Height = self->_scalerOutputHeight;
  return scalerOutputWidth == CVPixelBufferGetWidth(a3)
      && scalerOutputHeight == CVPixelBufferGetHeight(a3);
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

- (FigCalibrationMetadata)calibrationMetadata
{
  return self->_calibrationMetadata;
}

- (NSDictionary)options
{
  return self->_options;
}

- (FigMetalContext)metalContext
{
  return self->_metalContext;
}

- (opaqueCMSampleBuffer)referenceSampleBuffer
{
  return self->_referenceSampleBuffer;
}

- (void)setReferenceSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_referenceSampleBuffer = a3;
}

- (opaqueCMSampleBuffer)auxiliarySampleBuffer
{
  return self->_auxiliarySampleBuffer;
}

- (void)setAuxiliarySampleBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_auxiliarySampleBuffer = a3;
}

- ($91EEB31E22C960290E85DB462FB2FE46)calibrationConfig
{
  long long v3 = *(_OWORD *)&self[6].var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[6].var0;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (void)setCalibrationConfig:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_calibrationConfig.unsigned int inputImageWidth = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_calibrationConfig.float maxPaddingFactor = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_calibrationMetadata, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_calibrationTuningParameters, 0);
  objc_storeStrong((id *)&self->_portsToConfig, 0);
  objc_storeStrong((id *)&self->_referenceMeta, 0);
  objc_storeStrong((id *)&self->_auxiliaryMeta, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_keypointDetRtb, 0);
  objc_storeStrong((id *)&self->_calibration, 0);

  objc_storeStrong((id *)&self->_downscaler, 0);
}

@end