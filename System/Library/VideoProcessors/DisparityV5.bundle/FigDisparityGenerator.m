@interface FigDisparityGenerator
- ($EE1E03F6ACF96C4AE943C45337DCA2FD)disparityConfig;
- (BOOL)_extractAndRunSanityChecks;
- (BOOL)allocateResources;
- (BOOL)allocateResources:(id *)a3;
- (BOOL)equalizeTeleGainToMatchReference;
- (BOOL)isImageScalerOutputResolution:(__CVBuffer *)a3;
- (BOOL)isTextureScalerOutputResolution:(id)a3;
- (BOOL)shouldComputeDisparityWhenCalibrationFails;
- (CGRect)normalizedReferenceCropRect;
- (DisparityProcessorInferenceDelegate)disparityInferenceProcessorDelegate;
- (FigDisparityGenerator)initWithCommandQueue:(id)a3;
- (FigDisparityMetadata)shiftMapMetadata;
- (FigMetalContext)metalContext;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)disparityDiagnosticMetadata;
- (NSDictionary)options;
- (NSDictionary)tuningParameters;
- (__CVBuffer)outputShiftmap;
- (id)selectTuningParametersForCapture;
- (int)_demosaic:(float)a3 andPreshift:;
- (int)_detectKeypoints:(float)a3 preShift:;
- (int)_detectKeypointsLKTFlow:(float)a3 preShift:(id)a4 parameters:;
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
- (void)setCameraInfoByPortType:(id)a3;
- (void)setDisparityConfig:(id *)a3;
- (void)setDisparityInferenceProcessorDelegate:(id)a3;
- (void)setEqualizeTeleGainToMatchReference:(BOOL)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setNormalizedReferenceCropRect:(CGRect)a3;
- (void)setOptions:(id)a3;
- (void)setOutputShiftmap:(__CVBuffer *)a3;
- (void)setReferenceSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setShouldComputeDisparityWhenCalibrationFails:(BOOL)a3;
- (void)setTuningParameters:(id)a3;
@end

@implementation FigDisparityGenerator

- (int)prewarm
{
  v3 = [FigDisparityGenerator alloc];
  v11 = objc_msgSend_initWithCommandQueue_(v3, v4, (uint64_t)self->_metalCommandQueue, v5, v6, v7, v8, v9, v10);
  LODWORD(self) = objc_msgSend_prewarmWithTuningParameters_(v11, v12, (uint64_t)self->_tuningParameters, v13, v14, v15, v16, v17, v18);

  return (int)self;
}

- (int)setup
{
  return 0;
}

- (FigDisparityGenerator)initWithCommandQueue:(id)a3
{
  id v4 = a3;
  v100.receiver = self;
  v100.super_class = (Class)FigDisparityGenerator;
  uint64_t v5 = [(FigDisparityGenerator *)&v100 init];
  if (v5)
  {
    v5->_isShaderHarvesting = FigGetCFPreferenceNumberWithDefault() != 0;
    v5->_shouldComputeDisparityWhenCalibrationFails = 0;
    uint64_t v6 = (void *)MEMORY[0x263F086E0];
    uint64_t v7 = objc_opt_class();
    uint64_t v15 = objc_msgSend_bundleForClass_(v6, v8, v7, v9, v10, v11, v12, v13, v14);
    id v16 = objc_alloc(MEMORY[0x263F2EE30]);
    uint64_t inited = objc_msgSend_initWithbundle_andOptionalCommandQueue_(v16, v17, (uint64_t)v15, (uint64_t)v4, v18, v19, v20, v21, v22);
    metalContext = v5->_metalContext;
    v5->_metalContext = (FigMetalContext *)inited;

    v33 = v5->_metalContext;
    if (!v33) {
      goto LABEL_13;
    }
    uint64_t v34 = objc_msgSend_commandQueue(v33, v25, v26, v27, v28, v29, v30, v31, v32);
    metalCommandQueue = v5->_metalCommandQueue;
    v5->_metalCommandQueue = (MTLCommandQueue *)v34;

    if (!v5->_isShaderHarvesting)
    {
      id v36 = objc_alloc(MEMORY[0x263F2EE48]);
      v45 = objc_msgSend_commandQueue(v5->_metalContext, v37, v38, v39, v40, v41, v42, v43, v44);
      uint64_t v53 = objc_msgSend_initWithCommandQueue_(v36, v46, (uint64_t)v45, v47, v48, v49, v50, v51, v52);
      keypointDetRtb = v5->_keypointDetRtb;
      v5->_keypointDetRtb = (FigRegToolboxGPU *)v53;

      if (!v5->_keypointDetRtb) {
        goto LABEL_13;
      }
      id v55 = objc_alloc(MEMORY[0x263F2EE68]);
      uint64_t v63 = objc_msgSend_initWithOptionalCommandQueue_(v55, v56, (uint64_t)v4, v57, v58, v59, v60, v61, v62);
      gdcTransform = v5->_gdcTransform;
      v5->_gdcTransform = (GDCTransform *)v63;

      if (!v5->_gdcTransform) {
        goto LABEL_13;
      }
    }
    disparityTuningParameters = v5->_disparityTuningParameters;
    v5->_disparityTuningParameters = 0;

    v66 = [Demosaic alloc];
    uint64_t v74 = objc_msgSend_initWithMetalContext_(v66, v67, (uint64_t)v5->_metalContext, v68, v69, v70, v71, v72, v73);
    referenceDemosaic = v5->_referenceDemosaic;
    v5->_referenceDemosaic = (Demosaic *)v74;

    if (!v5->_referenceDemosaic) {
      goto LABEL_13;
    }
    v76 = [Demosaic alloc];
    uint64_t v84 = objc_msgSend_initWithMetalContext_(v76, v77, (uint64_t)v5->_metalContext, v78, v79, v80, v81, v82, v83);
    auxiliaryDemosaic = v5->_auxiliaryDemosaic;
    v5->_auxiliaryDemosaic = (Demosaic *)v84;

    if (!v5->_auxiliaryDemosaic) {
      goto LABEL_13;
    }
    uint64_t v86 = objc_opt_new();
    calibration = v5->_calibration;
    v5->_calibration = (Calibration *)v86;

    if (!v5->_calibration
      || (v88 = [AdaptiveClamping alloc],
          uint64_t v96 = objc_msgSend_initWithMetalContext_(v88, v89, (uint64_t)v5->_metalContext, v90, v91, v92, v93, v94, v95),
          clamping = v5->_clamping,
          v5->_clamping = (AdaptiveClamping *)v96,
          clamping,
          !v5->_clamping))
    {
LABEL_13:
      fig_log_get_emitter();
      FigDebugAssert3();

      v98 = 0;
      goto LABEL_12;
    }
  }
  v98 = v5;
LABEL_12:

  return v98;
}

- (int)prewarmWithTuningParameters:(id)a3
{
  id v11 = a3;
  metalContext = self->_metalContext;
  if (metalContext)
  {
    float v14 = objc_msgSend_commandQueue(metalContext, v4, v5, v6, v7, v8, v9, v10, v12);

    if (!v14) {
      objc_msgSend_setCommandQueue_(self->_metalContext, v15, (uint64_t)self->_metalCommandQueue, v16, v17, v18, v19, v20, v21);
    }
  }
  else
  {
    id v22 = objc_alloc(MEMORY[0x263F2EE30]);
    v23 = (void *)MEMORY[0x263F086E0];
    uint64_t v24 = objc_opt_class();
    float v32 = objc_msgSend_bundleForClass_(v23, v25, v24, v26, v27, v28, v29, v30, v31);
    uint64_t inited = (FigMetalContext *)objc_msgSend_initWithbundle_andOptionalCommandQueue_(v22, v33, (uint64_t)v32, (uint64_t)self->_metalCommandQueue, v34, v35, v36, v37, v38);
    uint64_t v40 = self->_metalContext;
    self->_metalContext = inited;

    if (!self->_metalContext)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v41 = -1;
      goto LABEL_9;
    }
  }
  self->_isPrewarming = 1;
  self->_disparityConfig.inputImageWidth = 1024;
  *(_OWORD *)&self->_disparityConfig.inputImageHeight = xmmword_262EEDE60;
  *(int64x2_t *)&self->_disparityConfig.outputDisparityWidth = vdupq_n_s64(0x40uLL);
  *(void *)&self->_disparityConfig.maxPaddingFactor = 0x2000000000;
  *(void *)&self->_disparityConfig.keypointGridHeight = 24;
  if (objc_msgSend_prepareToProcess_(self, v15, 0, v16, v17, v18, v19, v20, COERCE_FLOAT(24))) {
    int v41 = -12786;
  }
  else {
    int v41 = 0;
  }
  self->_isPrewarming = 0;
LABEL_9:

  return v41;
}

- (void)setOptions:(id)a3
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_options, a3);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x263F2F1F8], v7, v8, v9, v10, v11, v12);
  uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v5, v14, *MEMORY[0x263F2F1E8], v15, v16, v17, v18, v19, v20);
  v101 = (void *)v21;
  if (v13) {
    BOOL v22 = v21 == 0;
  }
  else {
    BOOL v22 = 1;
  }
  if (v22)
  {
    disparityTuningParameters = self->_disparityTuningParameters;
    self->_disparityTuningParameters = 0;
  }
  else
  {
    id v100 = v5;
    uint64_t v24 = (NSMutableDictionary *)objc_opt_new();
    v25 = self->_disparityTuningParameters;
    self->_disparityTuningParameters = v24;

    objc_msgSend_objectForKeyedSubscript_(v13, v26, @"portsToConfig", v27, v28, v29, v30, v31, v32);
    v33 = (NSArray *)objc_claimAutoreleasedReturnValue();
    portsToConfig = self->_portsToConfig;
    self->_portsToConfig = v33;

    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    obj = self->_portsToConfig;
    uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v103, (uint64_t)v107, 16, v36, v37, v38, v39);
    if (v40)
    {
      uint64_t v48 = v40;
      uint64_t v49 = *(void *)v104;
      while (2)
      {
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v104 != v49) {
            objc_enumerationMutation(obj);
          }
          uint64_t v51 = *(void **)(*((void *)&v103 + 1) + 8 * i);
          float v52 = objc_msgSend_objectForKeyedSubscript_(v51, v41, @"DisparityVersion", v42, v43, v44, v45, v46, v47);
          int v61 = objc_msgSend_intValue(v52, v53, v54, v55, v56, v57, v58, v59, v60);

          if (v61 == 5)
          {
            float v62 = objc_msgSend_objectForKeyedSubscript_(v51, v41, @"Config", v42, v43, v44, v45, v46, v47);
            uint64_t v63 = [DisparityTuningParameters alloc];
            uint64_t v71 = objc_msgSend_objectForKeyedSubscript_(v13, v64, @"BaseConfiguration", v65, v66, v67, v68, v69, v70);
            uint64_t v78 = objc_msgSend_initWithTuningDictionary_cameraInfoByPortType_(v63, v72, (uint64_t)v71, (uint64_t)v101, v73, v74, v75, v76, v77);

            uint64_t v86 = objc_msgSend_objectForKeyedSubscript_(v13, v79, (uint64_t)v62, v80, v81, v82, v83, v84, v85);
            LODWORD(v71) = objc_msgSend_updateTuningParametersWith_(v78, v87, (uint64_t)v86, v88, v89, v90, v91, v92, v93);

            if (v71)
            {
              fig_log_get_emitter();
              FigDebugAssert3();

              goto LABEL_19;
            }
            objc_msgSend_setObject_forKeyedSubscript_(self->_disparityTuningParameters, v94, (uint64_t)v78, (uint64_t)v62, v95, v96, v97, v98, v99);
          }
        }
        uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v103, (uint64_t)v107, 16, v44, v45, v46, v47);
        if (v48) {
          continue;
        }
        break;
      }
    }
LABEL_19:

    id v5 = v100;
  }
}

- (BOOL)allocateResources:(id *)a3
{
  long long v8 = *(_OWORD *)&a3->var0;
  long long v9 = *(_OWORD *)&a3->var2;
  long long v10 = *(_OWORD *)&a3->var4;
  *(void *)&self->_disparityConfig.keypointGridHeight = *(void *)&a3->var7;
  *(_OWORD *)&self->_disparityConfig.inputIsLinearRGB = v9;
  *(_OWORD *)&self->_disparityConfig.outputDisparityHeight = v10;
  *(_OWORD *)&self->_disparityConfig.inputImageWidth = v8;
  return objc_msgSend_allocateResources(self, a2, (uint64_t)a3, v3, v4, v5, v6, v7, *(float *)&v8);
}

- (BOOL)allocateResources
{
  if ((self->_disparityConfig.inputImageWidth & 3) != 0
    || (self->_disparityConfig.inputImageHeight & 3) != 0
    || (unint64_t outputDisparityWidth = self->_disparityConfig.outputDisparityWidth, (outputDisparityWidth & 7) != 0)
    || (unint64_t outputDisparityHeight = self->_disparityConfig.outputDisparityHeight, (outputDisparityHeight & 7) != 0)
    || outputDisparityWidth > 0x300
    || outputDisparityHeight >= 0x241)
  {
    fig_log_get_emitter();
    uint64_t v226 = v8;
    LODWORD(v225) = 0;
    FigDebugAssert3();
    BOOL v22 = 0;
    uint64_t v30 = 0;
LABEL_51:
    objc_msgSend_releaseResources(self, v216, v217, v218, v219, v220, v221, v222, v223, v225, v226);
    BOOL v214 = 0;
    goto LABEL_35;
  }
  uint64_t v13 = objc_msgSend_allKeys(self->_disparityTuningParameters, a2, v2, v3, v4, v5, v6, v7, v9);
  BOOL v22 = objc_msgSend_firstObject(v13, v14, v15, v16, v17, v18, v19, v20, v21);

  uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(self->_disparityTuningParameters, v23, (uint64_t)v22, v24, v25, v26, v27, v28, v29);
  objc_msgSend_useLKTKeypointDetection(v30, v31, v32, v33, v34, v35, v36, v37, v38);
  int CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  self->_useLktKeypoints = CFPreferenceNumberWithDefault != 0;
  unsigned int inputImageWidth = self->_disparityConfig.inputImageWidth;
  if (self->_disparityConfig.inputIsLinearRGB)
  {
    inputImageWidth *= 2;
    unsigned int inputImageHeight = 2 * LODWORD(self->_disparityConfig.inputImageHeight);
  }
  else
  {
    unsigned int inputImageHeight = self->_disparityConfig.inputImageHeight;
  }
  self->_inputCalibrationWidth = inputImageWidth;
  self->_inputCalibrationHeight = inputImageHeight;
  uint64_t v43 = inputImageWidth >> 1;
  uint64_t v44 = inputImageHeight >> 1;
  self->_uint64_t scalerOutputWidth = v43;
  self->_uint64_t scalerOutputHeight = v44;
  uint32x2_t v45 = (uint32x2_t)vmovn_s64(*(int64x2_t *)&self->_disparityConfig.outputDisparityWidth);
  *(uint32x2_t *)&self->_disparityWidth = v45;
  float32x2_t v46 = vcvt_f32_u32(v45);
  float v47 = (float)v44 / v46.f32[1];
  if (v47 >= (float)((float)v43 / v46.f32[0])) {
    float v47 = (float)v43 / v46.f32[0];
  }
  int32x2_t v48 = (int32x2_t)vcvt_u32_f32(vmla_n_f32((float32x2_t)0x3F0000003F000000, v46, v47));
  float64x2_t v49 = vcvtq_f64_f32(vmul_f32(vdiv_f32((float32x2_t)0x4300000043000000, v46), vcvt_f32_u32((uint32x2_t)v48)));
  __asm { FMOV            V2.2D, #0.5 }
  *(int32x2_t *)&self->_rectifiedOutputWidth = v48;
  *(void *)&self->_auxiliaryPaddedHalfResWidth = *(void *)&vadd_s32(vmovn_s64((int64x2_t)vcvtq_u64_f64(vaddq_f64(v49, _Q2))), vadd_s32(v48, (int32x2_t)0x700000007)) & 0xFFFFFFF8FFFFFFF8;
  if (CFPreferenceNumberWithDefault)
  {
    uint64_t v55 = [LKTKeypointDetector alloc];
    metalContext = self->_metalContext;
    uint64_t scalerOutputWidth = self->_scalerOutputWidth;
    uint64_t scalerOutputHeight = self->_scalerOutputHeight;
    uint64_t Scale = objc_msgSend_lastScale(v30, v59, v60, v61, v62, v63, v64, v65, v66);
    uint64_t v71 = (LKTKeypointDetector *)objc_msgSend_initWithMetalContext_width_height_nscales_lastScale_(v55, v68, (uint64_t)metalContext, scalerOutputWidth, scalerOutputHeight, 0xFFFFFFFFLL, Scale, v69, v70);
    lktKeypointDetector = self->_lktKeypointDetector;
    self->_lktKeypointDetector = v71;

    if (!self->_lktKeypointDetector) {
      goto LABEL_49;
    }
    uint64_t v81 = objc_msgSend_nwarps(v30, v73, v74, v75, v76, v77, v78, v79, v80);
    objc_msgSend_setNwarpings_(self->_lktKeypointDetector, v82, v81, v83, v84, v85, v86, v87, v88);
    unsigned int v89 = self->_scalerOutputWidth;
    unsigned int v98 = v89 >> objc_msgSend_lastScale(v30, v90, v91, v92, v93, v94, v95, v96, v97);
    self->_uint64_t keypointGridWidth = v98
                             / objc_msgSend_blockSize(v30, v99, v100, v101, v102, v103, v104, v105, v106);
    unsigned int v107 = self->_scalerOutputHeight;
    unsigned int v116 = v107 >> objc_msgSend_lastScale(v30, v108, v109, v110, v111, v112, v113, v114, v115);
    unsigned int v131 = v116 / objc_msgSend_blockSize(v30, v117, v118, v119, v120, v121, v122, v123, v124);
    self->_uint64_t keypointGridHeight = v131;
  }
  else
  {
    uint64_t keypointGridWidth = self->_disparityConfig.keypointGridWidth;
    uint64_t keypointGridHeight = self->_disparityConfig.keypointGridHeight;
    self->_uint64_t keypointGridWidth = keypointGridWidth;
    self->_uint64_t keypointGridHeight = keypointGridHeight;
    *(void *)&self->_keypointsTemplateRadius = 0x500000007;
    self->_keypointsMinCornerScore = 0.0;
    self->_keypointsMinNccScore = 0.0;
    self->_keypointsMinSelectionScore = 1.7;
    int Resources_imageWidth_imageHeight_gridWidth_gridHeight_templateRadius_searchRadius_minNCCThreshold = objc_msgSend_allocateResources_imageWidth_imageHeight_gridWidth_gridHeight_templateRadius_searchRadius_minNCCThreshold_(self->_keypointDetRtb, v40, 4, v43, v44, keypointGridWidth, keypointGridHeight, 7, 0.0, 5);
    if (Resources_imageWidth_imageHeight_gridWidth_gridHeight_templateRadius_searchRadius_minNCCThreshold)
    {
      int v224 = Resources_imageWidth_imageHeight_gridWidth_gridHeight_templateRadius_searchRadius_minNCCThreshold;
      fig_log_get_emitter();
      uint64_t v226 = v8;
      LODWORD(v225) = v224;
LABEL_50:
      FigDebugAssert3();
      goto LABEL_51;
    }
    unsigned int v131 = self->_keypointGridHeight;
  }
  unsigned int v136 = v131 * self->_keypointGridWidth;
  objc_msgSend_allocateResourcesForMaxNumPoints_(self->_calibration, v125, v136, v126, v127, v128, v129, v130, v132);
  v137 = ($9A3F6720D51884C1BD061C340F5007EE *)malloc_type_malloc(24 * v136, 0x7D51B2EEuLL);
  self->_keypointListRtb = v137;
  if (!v137) {
    goto LABEL_49;
  }
  size_t v138 = 16 * v136;
  v139 = (double *)malloc_type_malloc(v138, 0x88D2C67DuLL);
  self->_adaptiveCorrectionKeypointsReferenceDistorted = v139;
  if (!v139) {
    goto LABEL_49;
  }
  v140 = (double *)malloc_type_malloc(v138, 0x9E8A2F44uLL);
  self->_adaptiveCorrectionKeypointsAuxiliaryDistorted = v140;
  if (!v140) {
    goto LABEL_49;
  }
  if (!self->_disparityConfig.inputIsLinearRGB)
  {
    id v141 = objc_alloc(MEMORY[0x263F2EE10]);
    v150 = objc_msgSend_device(self->_metalContext, v142, v143, v144, v145, v146, v147, v148, v149);
    v157 = objc_msgSend_initWithDevice_allocatorType_(v141, v151, (uint64_t)v150, 2, v152, v153, v154, v155, v156);
    objc_msgSend_setAllocator_(self->_metalContext, v158, (uint64_t)v157, v159, v160, v161, v162, v163, v164);

    v173 = objc_msgSend_allocator(self->_metalContext, v165, v166, v167, v168, v169, v170, v171, v172);

    if (!v173) {
      goto LABEL_49;
    }
    v174 = objc_opt_new();
    if (!v174) {
      goto LABEL_49;
    }
    v181 = v174;
    int32x2_t v182 = (int32x2_t)vand_s8((int8x8_t)vadd_s32((int32x2_t)vshl_u32(*(uint32x2_t *)&self->_scalerOutputWidth, (uint32x2_t)0x200000001), (int32x2_t)0x3FC000001FELL), (int8x8_t)0xFFFFFC003FFFFE00);
    v182.i32[0] = vmul_lane_s32(v182, v182, 1).u32[0];
    objc_msgSend_setMemSize_(v174, v175, v182.u32[0], v176, v177, v178, v179, v180, *(float *)v182.i32);
    objc_msgSend_setWireMemory_(v181, v183, 1, v184, v185, v186, v187, v188, v189);
    objc_msgSend_setLabel_(v181, v190, @"FigMetalAllocator_Disparity", v191, v192, v193, v194, v195, v196);
    v205 = objc_msgSend_allocator(self->_metalContext, v197, v198, v199, v200, v201, v202, v203, v204);
    int v213 = objc_msgSend_setupWithDescriptor_(v205, v206, (uint64_t)v181, v207, v208, v209, v210, v211, v212);

    if (v213)
    {
      fig_log_get_emitter();
      uint64_t v226 = v8;
      LODWORD(v225) = v213;
      FigDebugAssert3();

      goto LABEL_51;
    }
  }
  if ((sub_262ED0B28(&self->_refHalfResLumaPixelBuffer, self->_scalerOutputWidth, self->_scalerOutputHeight, 1278226488) & 1) == 0|| (sub_262ED0B28(&self->_auxHalfResRectifiedRGBAPixelBuffer, self->_scalerOutputWidth, self->_scalerOutputHeight, 1278226488) & 1) == 0|| (sub_262ED0B28(&self->_refHalfResRectifiedRGBAPixelBuffer, self->_rectifiedOutputWidth, self->_rectifiedOutputHeight, 1815162994) & 1) == 0|| (sub_262ED0B28(&self->_auxHalfResRectifiedRGBAPixelBuffer, self->_auxiliaryPaddedHalfResWidth, self->_auxiliaryPaddedHalfResHeight, 1815162994) & 1) == 0
    || (sub_262ED0B28(&self->_refLowResRectifiedRGBAPixelBuffer, 768, 576, 1380411457) & 1) == 0
    || (sub_262ED0B28(&self->_auxLowResRectifiedRGBAPixelBuffer, 896, 704, 1380411457) & 1) == 0
    || (sub_262ED0B28(&self->_rectifiedDisparityMap, 768, 576, 1751411059) & 1) == 0
    || CVPixelBufferGetBytesPerRow(self->_auxHalfResRectifiedRGBAPixelBuffer) < self->_scalerOutputWidth
    || CVPixelBufferGetHeight(self->_auxHalfResRectifiedRGBAPixelBuffer) < self->_scalerOutputHeight)
  {
LABEL_49:
    fig_log_get_emitter();
    uint64_t v226 = v8;
    LODWORD(v225) = 0;
    goto LABEL_50;
  }
  BOOL v214 = 1;
LABEL_35:

  return v214;
}

- (void)dealloc
{
  objc_msgSend_releaseResources(self, a2, v2, v3, v4, v5, v6, v7, v8);
  v10.receiver = self;
  v10.super_class = (Class)FigDisparityGenerator;
  [(FigDisparityGenerator *)&v10 dealloc];
}

- (void)releaseResources
{
  shiftMapMetadata = self->_shiftMapMetadata;
  self->_shiftMapMetadata = 0;

  disparityDiagnosticMetadata = self->_disparityDiagnosticMetadata;
  self->_disparityDiagnosticMetadata = 0;

  refHalfResLumaPixelBuffer = self->_refHalfResLumaPixelBuffer;
  if (refHalfResLumaPixelBuffer)
  {
    CFRelease(refHalfResLumaPixelBuffer);
    self->_refHalfResLumaPixelBuffer = 0;
  }
  auxHalfResRectifiedRGBAPixelBuffer = self->_auxHalfResRectifiedRGBAPixelBuffer;
  if (auxHalfResRectifiedRGBAPixelBuffer)
  {
    CFRelease(auxHalfResRectifiedRGBAPixelBuffer);
    self->_auxHalfResRectifiedRGBAPixelBuffer = 0;
  }
  refHalfResRectifiedRGBAPixelBuffer = self->_refHalfResRectifiedRGBAPixelBuffer;
  if (refHalfResRectifiedRGBAPixelBuffer)
  {
    CFRelease(refHalfResRectifiedRGBAPixelBuffer);
    self->_refHalfResRectifiedRGBAPixelBuffer = 0;
    uint64_t v16 = self->_auxHalfResRectifiedRGBAPixelBuffer;
    if (v16)
    {
      CFRelease(v16);
      self->_auxHalfResRectifiedRGBAPixelBuffer = 0;
    }
  }
  refLowResRectifiedRGBAPixelBuffer = self->_refLowResRectifiedRGBAPixelBuffer;
  if (refLowResRectifiedRGBAPixelBuffer)
  {
    CFRelease(refLowResRectifiedRGBAPixelBuffer);
    self->_refLowResRectifiedRGBAPixelBuffer = 0;
  }
  auxLowResRectifiedRGBAPixelBuffer = self->_auxLowResRectifiedRGBAPixelBuffer;
  if (auxLowResRectifiedRGBAPixelBuffer)
  {
    CFRelease(auxLowResRectifiedRGBAPixelBuffer);
    self->_auxLowResRectifiedRGBAPixelBuffer = 0;
  }
  rectifiedDisparityMap = self->_rectifiedDisparityMap;
  if (rectifiedDisparityMap)
  {
    CFRelease(rectifiedDisparityMap);
    self->_rectifiedDisparityMap = 0;
  }
  objc_msgSend_releaseResources(self->_keypointDetRtb, v5, v6, v7, v8, v9, v10, v11, v12);
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
      if (self->_outputShiftmap)
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
              if ((objc_msgSend_isTextureScalerOutputResolution_(self, v9, (uint64_t)self->_refHalfResRGBATexture, v10, v11, v12, v13, v14, v15) & 1) != 0&& (objc_msgSend_isTextureScalerOutputResolution_(self, v16, (uint64_t)self->_auxHalfResRGBATexture, v17, v18, v19, v20, v21, v22) & 1) != 0
                && (objc_msgSend_isImageScalerOutputResolution_(self, v23, (uint64_t)self->_refHalfResLumaPixelBuffer, v24, v25, v26, v27, v28, v29) & 1) != 0)
              {
                auxHalfResRectifiedRGBAPixelBuffer = self->_auxHalfResRectifiedRGBAPixelBuffer;
                unsigned int auxiliaryPaddedHalfResWidth = self->_auxiliaryPaddedHalfResWidth;
                unsigned int auxiliaryPaddedHalfResHeight = self->_auxiliaryPaddedHalfResHeight;
                if (auxiliaryPaddedHalfResWidth == CVPixelBufferGetWidth(auxHalfResRectifiedRGBAPixelBuffer)
                  && auxiliaryPaddedHalfResHeight == CVPixelBufferGetHeight(auxHalfResRectifiedRGBAPixelBuffer)
                  && objc_msgSend_pixelFormat(self->_refHalfResRGBATexture, v33, v34, v35, v36, v37, v38, v39, v40) == 90
                  && objc_msgSend_pixelFormat(self->_auxHalfResRGBATexture, v41, v42, v43, v44, v45, v46, v47, v48) == 90
                  && CVPixelBufferGetPixelFormatType(self->_auxHalfResRectifiedRGBAPixelBuffer) == 1815162994
                  && CVPixelBufferGetPixelFormatType(self->_refLowResRectifiedRGBAPixelBuffer) == 1380411457
                  && CVPixelBufferGetPixelFormatType(self->_auxLowResRectifiedRGBAPixelBuffer) == 1380411457
                  && (CVPixelBufferGetPixelFormatType(self->_rectifiedDisparityMap) == 1278226536
                   || CVPixelBufferGetPixelFormatType(self->_rectifiedDisparityMap) == 1751411059)
                  && CVPixelBufferGetWidth(self->_rectifiedDisparityMap) == 768
                  && CVPixelBufferGetHeight(self->_rectifiedDisparityMap) == 576)
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

- (void)fillShiftMapMetadataWithCalModel:(CalModel *)a3 referenceGDC:(id *)a4 auxiliaryGDC:(id *)a5
{
  *(uint64_t *)((char *)v234[0].i64 + 4) = 0;
  v234[0].i32[0] = 0;
  long long v232 = 0u;
  long long v233 = 0u;
  long long v231 = 0u;
  long long v229 = 0u;
  long long v230 = 0u;
  int32x4_t v227 = 0u;
  long long v228 = 0u;
  int32x4_t v225 = 0u;
  int32x4_t v226 = 0u;
  sub_262EE259C((uint64_t)a3, (uint64_t)&v231, (uint64_t)&v228, (uint64_t)&v225, v234, 0, 0);
  long long v223 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  long long v224 = *MEMORY[0x263EF89A0];
  long long v222 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
  int32x4_t v212 = v226;
  int32x4_t v214 = v227;
  int32x4_t v216 = v225;
  float32x4_t v218 = v234[0];
  id v7 = objc_alloc(MEMORY[0x263EFF980]);
  float v15 = objc_msgSend_initWithCapacity_(v7, v8, 8, v9, v10, v11, v12, v13, v14);
  id v16 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v24 = objc_msgSend_initWithCapacity_(v16, v17, 8, v18, v19, v20, v21, v22, v23);
  id v25 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v33 = objc_msgSend_initWithCapacity_(v25, v26, 8, v27, v28, v29, v30, v31, v32);
  id v34 = objc_alloc(MEMORY[0x263EFF980]);
  float64x2_t v49 = objc_msgSend_initWithCapacity_(v34, v35, 8, v36, v37, v38, v39, v40, v41);
  for (uint64_t i = 0; i != 8; ++i)
  {
    uint64_t v51 = &a4->var0[i];
    float v52 = objc_msgSend_numberWithFloat_(NSNumber, v42, v43, v44, v45, v46, v47, v48, v51[8], *(_OWORD *)&v212, *(_OWORD *)&v214, *(_OWORD *)&v216, *(_OWORD *)&v218);
    objc_msgSend_setObject_atIndexedSubscript_(v15, v53, (uint64_t)v52, i, v54, v55, v56, v57, v58);

    float v66 = objc_msgSend_numberWithFloat_(NSNumber, v59, v60, v61, v62, v63, v64, v65, *v51);
    objc_msgSend_setObject_atIndexedSubscript_(v24, v67, (uint64_t)v66, i, v68, v69, v70, v71, v72);

    uint64_t v73 = &a5->var0[i];
    uint64_t v81 = objc_msgSend_numberWithFloat_(NSNumber, v74, v75, v76, v77, v78, v79, v80, v73[8]);
    objc_msgSend_setObject_atIndexedSubscript_(v33, v82, (uint64_t)v81, i, v83, v84, v85, v86, v87);

    uint64_t v95 = objc_msgSend_numberWithFloat_(NSNumber, v88, v89, v90, v91, v92, v93, v94, *v73);
    objc_msgSend_setObject_atIndexedSubscript_(v49, v96, (uint64_t)v95, i, v97, v98, v99, v100, v101);
  }
  int32x4_t v102 = vzip1q_s32(v216, v214);
  float32x4_t v103 = (float32x4_t)vzip1q_s32(v102, v212);
  float32x4_t v104 = (float32x4_t)vtrn2q_s32(v216, v212);
  v104.i32[2] = v214.i32[1];
  float32x4_t v105 = (float32x4_t)vzip1q_s32(vzip2q_s32(v216, v214), vdupq_laneq_s32(v212, 2));
  double v217 = *(double *)v105.i64;
  *(void *)&double v219 = vnegq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v103, v218.f32[0]), v104, *(float32x2_t *)v218.f32, 1), v105, v218, 2)).u64[0];
  v102.i64[0] = vzip2q_s32(v102, vdupq_lane_s32(*(int32x2_t *)v212.i8, 1)).u64[0];
  float v213 = v103.f32[0];
  double v215 = *(double *)v102.i64;
  float32x4_t v106 = vmulq_f32(v234[0], v234[0]);
  objc_msgSend_setBaseline_(self->_shiftMapMetadata, v42, v43, v44, v45, v46, v47, v48, sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v106, 2), vaddq_f32(v106, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v106.f32, 1))).f32[0]));
  objc_msgSend_setTeleExtrinsicMatrix_(self->_shiftMapMetadata, v107, v108, v109, v110, v111, v112, v113, *(float *)&v224, *(double *)&v223, *(double *)&v222, 0.0);
  objc_msgSend_setTeleIntrinsicMatrix_(self->_shiftMapMetadata, v114, v115, v116, v117, v118, v119, v120, *(float *)&v231, *(double *)&v232, *(double *)&v233);
  objc_msgSend_setTeleIntrinsicMatrixReferenceDimensions_(self->_shiftMapMetadata, v121, v122, v123, v124, v125, v126, v127, COERCE_FLOAT(*(void *)&a3->calibrationDimensions[0]), a3->calibrationDimensions[1]);
  objc_msgSend_setTeleInverseLensDistortionCoefficients_(self->_shiftMapMetadata, v128, (uint64_t)v24, v129, v130, v131, v132, v133, v134);
  objc_msgSend_setTeleLensDistortionCoefficients_(self->_shiftMapMetadata, v135, (uint64_t)v15, v136, v137, v138, v139, v140, v141);
  objc_msgSend_setTeleLensDistortionOpticalCenter_(self->_shiftMapMetadata, v142, v143, v144, v145, v146, v147, v148, COERCE_FLOAT(COERCE_UNSIGNED_INT64(a4->var2)), a4->var3);
  objc_msgSend_setTelePixelSizeInMillimeters_(self->_shiftMapMetadata, v149, v150, v151, v152, v153, v154, v155, a4->var8);
  objc_msgSend_setWideExtrinsicMatrix_(self->_shiftMapMetadata, v156, v157, v158, v159, v160, v161, v162, v213, v215, v217, v219);
  objc_msgSend_setWideIntrinsicMatrix_(self->_shiftMapMetadata, v163, v164, v165, v166, v167, v168, v169, *(float *)&v228, *(double *)&v229, *(double *)&v230);
  objc_msgSend_setWideIntrinsicMatrixReferenceDimensions_(self->_shiftMapMetadata, v170, v171, v172, v173, v174, v175, v176, COERCE_FLOAT(*(void *)&a3->calibrationDimensions[0]), a3->calibrationDimensions[1]);
  objc_msgSend_setWideInverseLensDistortionCoefficients_(self->_shiftMapMetadata, v177, (uint64_t)v49, v178, v179, v180, v181, v182, v183);
  objc_msgSend_setWideLensDistortionCoefficients_(self->_shiftMapMetadata, v184, (uint64_t)v33, v185, v186, v187, v188, v189, v190);
  objc_msgSend_setWideLensDistortionOpticalCenter_(self->_shiftMapMetadata, v191, v192, v193, v194, v195, v196, v197, COERCE_FLOAT(COERCE_UNSIGNED_INT64(a5->var2)), a5->var3);
  objc_msgSend_setWidePixelSizeInMillimeters_(self->_shiftMapMetadata, v198, v199, v200, v201, v202, v203, v204, a5->var8);
  objc_msgSend_setVersion_(self->_shiftMapMetadata, v205, 5, v206, v207, v208, v209, v210, v211);
}

- (int)process
{
  ImageBuffer = CMSampleBufferGetImageBuffer(self->_referenceSampleBuffer);
  CFStringRef v4 = CMSampleBufferGetImageBuffer(self->_auxiliarySampleBuffer);
  BOOL inputIsLinearRGB = self->_disparityConfig.inputIsLinearRGB;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
  id v7 = (_DWORD *)MEMORY[0x263F00E10];
  if (inputIsLinearRGB)
  {
    if (PixelFormatType != 1815162994
      || CVPixelBufferGetPixelFormatType(v4) != 1815162994
      || CVPixelBufferGetWidth(ImageBuffer) != self->_scalerOutputWidth
      || CVPixelBufferGetHeight(ImageBuffer) != self->_scalerOutputHeight
      || CVPixelBufferGetWidth(v4) != self->_scalerOutputWidth
      || CVPixelBufferGetHeight(v4) != self->_scalerOutputHeight)
    {
LABEL_159:
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_160;
    }
  }
  else
  {
    BOOL v8 = PixelFormatType == 1919379252 || CVPixelBufferGetPixelFormatType(ImageBuffer) == 1650943796;
    BOOL v9 = CVPixelBufferGetPixelFormatType(v4) == 1919379252 || CVPixelBufferGetPixelFormatType(v4) == 1650943796;
    if (!v8 || !v9) {
      goto LABEL_159;
    }
  }
  OSType v17 = CVPixelBufferGetPixelFormatType(ImageBuffer);
  metalContext = self->_metalContext;
  if (v17 == 1815162994)
  {
    LODWORD(v18) = self->_scalerOutputWidth;
    LODWORD(v19) = self->_scalerOutputHeight;
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(metalContext, v10, (uint64_t)ImageBuffer, 90, 17, 0, v15, v16, COERCE_FLOAT(COERCE_UNSIGNED_INT64((double)v18)), (double)v19);
    uint64_t v21 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    refHalfResRGBATexture = self->_refHalfResRGBATexture;
    self->_refHalfResRGBATexture = v21;

    if (!self->_refHalfResRGBATexture) {
      goto LABEL_153;
    }
    LODWORD(v26) = self->_scalerOutputWidth;
    LODWORD(v27) = self->_scalerOutputHeight;
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_metalContext, v23, (uint64_t)v4, 90, 17, 0, v24, v25, COERCE_FLOAT(COERCE_UNSIGNED_INT64((double)v26)), (double)v27);
    uint64_t v28 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    auxHalfResRGBATexture = self->_auxHalfResRGBATexture;
    self->_auxHalfResRGBATexture = v28;

    uint64_t v38 = 0;
    if (!self->_auxHalfResRGBATexture)
    {
LABEL_153:
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
LABEL_160:
      LODWORD(v293) = 0;
      v781 = 0;
      goto LABEL_161;
    }
  }
  else
  {
    uint64_t v39 = objc_msgSend_allocator(metalContext, v10, v11, v12, v13, v14, v15, v16, *(float *)&v18);
    uint64_t v38 = objc_msgSend_newTextureDescriptor(v39, v40, v41, v42, v43, v44, v45, v46, v47);

    if (!v38)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
      LODWORD(v293) = 0;
      v781 = 0;
      v785 = 0;
      int v284 = 0;
LABEL_163:
      v294 = 0;
      char v295 = 0;
      int v296 = 4;
      goto LABEL_111;
    }
    uint64_t v56 = objc_msgSend_desc(v38, v48, v49, v50, v51, v52, v53, v54, v55);
    objc_msgSend_setCompressionMode_(v56, v57, 2, v58, v59, v60, v61, v62, v63);

    float v72 = objc_msgSend_desc(v38, v64, v65, v66, v67, v68, v69, v70, v71);
    objc_msgSend_setUsage_(v72, v73, 7, v74, v75, v76, v77, v78, v79);

    float v88 = objc_msgSend_desc(v38, v80, v81, v82, v83, v84, v85, v86, v87);
    objc_msgSend_setPixelFormat_(v88, v89, 90, v90, v91, v92, v93, v94, v95);

    uint64_t scalerOutputWidth = self->_scalerOutputWidth;
    float32x4_t v105 = objc_msgSend_desc(v38, v97, v98, v99, v100, v101, v102, v103, v104);
    objc_msgSend_setWidth_(v105, v106, scalerOutputWidth, v107, v108, v109, v110, v111, v112);

    uint64_t scalerOutputHeight = self->_scalerOutputHeight;
    uint64_t v122 = objc_msgSend_desc(v38, v114, v115, v116, v117, v118, v119, v120, v121);
    objc_msgSend_setHeight_(v122, v123, scalerOutputHeight, v124, v125, v126, v127, v128, v129);

    objc_msgSend_setLabel_(v38, v130, 0, v131, v132, v133, v134, v135, v136);
    uint64_t v145 = objc_msgSend_allocator(self->_metalContext, v137, v138, v139, v140, v141, v142, v143, v144);
    uint64_t v153 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v145, v146, (uint64_t)v38, v147, v148, v149, v150, v151, v152);
    uint64_t v154 = self->_refHalfResRGBATexture;
    self->_refHalfResRGBATexture = v153;

    if (!self->_refHalfResRGBATexture) {
      goto LABEL_155;
    }
    objc_msgSend_setLabel_(v38, v155, 0, v156, v157, v158, v159, v160, v161);
    uint64_t v170 = objc_msgSend_allocator(self->_metalContext, v162, v163, v164, v165, v166, v167, v168, v169);
    uint64_t v178 = (MTLTexture *)objc_msgSend_newTextureWithDescriptor_(v170, v171, (uint64_t)v38, v172, v173, v174, v175, v176, v177);
    uint64_t v179 = self->_auxHalfResRGBATexture;
    self->_auxHalfResRGBATexture = v178;

    if (!self->_auxHalfResRGBATexture)
    {
LABEL_155:
      v781 = v38;
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
      goto LABEL_156;
    }
  }
  v781 = v38;
  if ((objc_msgSend__extractAndRunSanityChecks(self, v30, v31, v32, v33, v34, v35, v36, v37) & 1) == 0
    || (objc_msgSend_selectTuningParametersForCapture(self, v180, v181, v182, v183, v184, v185, v186, v187),
        (uint64_t v188 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_156:
    LODWORD(v293) = 0;
LABEL_161:
    v785 = 0;
    goto LABEL_162;
  }
  uint64_t v189 = (void *)v188;
  float v190 = (FigDisparityMetadata *)objc_opt_new();
  shiftMapMetadata = self->_shiftMapMetadata;
  self->_shiftMapMetadata = v190;

  disparityDiagnosticMetadata = self->_disparityDiagnosticMetadata;
  self->_disparityDiagnosticMetadata = 0;

  objc_msgSend_clearDiagnostics(self->_diagnostics, v193, v194, v195, v196, v197, v198, v199, v200);
  objc_msgSend_setReferenceBufferDimensions_auxillaryBufferDimensions_normalizedReferenceFinalCropRect_(self->_calibration, v201, *(void *)&self->_inputCalibrationWidth, *(void *)&self->_inputCalibrationWidth, v202, v203, v204, v205, COERCE_FLOAT(*(void *)&self->_normalizedReferenceCropRect.origin.x), self->_normalizedReferenceCropRect.origin.y, self->_normalizedReferenceCropRect.size.width, self->_normalizedReferenceCropRect.size.height);
  calibration = self->_calibration;
  auxiliaryMeta = self->_auxiliaryMeta;
  referenceMeta = self->_referenceMeta;
  options = self->_options;
  objc_msgSend_adaptiveCorrectionConfig(v189, v210, v211, v212, v213, v214, v215, v216, v217);
  v785 = v189;
  if (objc_msgSend_extractParametersFromReferenceMetadata_auxiliaryMetadata_options_adaptiveCorrectionConfig_useReferenceFrame_(calibration, v218, (uint64_t)referenceMeta, (uint64_t)auxiliaryMeta, (uint64_t)options, (uint64_t)v819, 1, v219, v220)|| objc_msgSend_computeInitialCalibration(self->_calibration, v221, v222, v223, v224, v225, v226, v227, v228)
    || (objc_msgSend_referenceMagnification(self->_calibration, v229, v230, v231, v232, v233, v234, v235, v236),
        v244 <= 0.0))
  {
    fig_log_get_emitter();
LABEL_158:
    FigDebugAssert3();
    LODWORD(v293) = 0;
LABEL_162:
    int v284 = 0;
    uint64_t v38 = 0;
    goto LABEL_163;
  }
  float v245 = v244;
  double v818 = 0.0;
  if (objc_msgSend_alignAuxiliaryImageForKeypoints(v189, v237, v238, v239, v240, v241, v242, v243, v244)
    && objc_msgSend_computeAuxiliaryImageShiftForKeypoints_(self->_calibration, v246, (uint64_t)&v818, v248, v249, v250, v251, v252, v253)|| (uint32x2_t v254 = *(uint32x2_t *)&self->_inputCalibrationWidth, v255 = *(uint32x2_t *)&self->_scalerOutputWidth, v256 = *(uint32x2_t *)&self->_rectifiedOutputWidth, objc_msgSend__demosaic_andPreshift_(self, v246, v247, v248, v249, v250, v251, v252, v245, v818)))
  {
    fig_log_get_emitter();
    goto LABEL_158;
  }
  self->_keypointsCount = 0;
  if (self->_useLktKeypoints)
  {
    if (!objc_msgSend__detectKeypointsLKTFlow_preShift_parameters_(self, v257, (uint64_t)v189, v259, v260, v261, v262, v263, v245, v818))goto LABEL_33; {
LABEL_41:
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    LODWORD(v293) = 0;
    int v284 = 0;
    uint64_t v38 = 0;
    v294 = 0;
    char v295 = 0;
    int v296 = 1;
    goto LABEL_111;
  }
  if (objc_msgSend__detectKeypoints_preShift_(self, v257, v258, v259, v260, v261, v262, v263, v245, v818)) {
    goto LABEL_41;
  }
LABEL_33:
  if (*v7 == 1) {
    kdebug_trace();
  }
  objc_msgSend_setKeypointsForReference_auxiliary_keypointCount_(self->_calibration, v264, (uint64_t)self->_adaptiveCorrectionKeypointsReferenceDistorted, (uint64_t)self->_adaptiveCorrectionKeypointsAuxiliaryDistorted, self->_keypointsCount, v265, v266, v267, v268);
  int v277 = objc_msgSend_computeCalibration(self->_calibration, v269, v270, v271, v272, v273, v274, v275, v276);
  int v284 = v277;
  if (!v277 || self->_shouldComputeDisparityWhenCalibrationFails)
  {
    self->_gdcParametersReference.originalCropRect.size.height = 0.0;
    *(_OWORD *)&self->_gdcParametersReference.applyRollingShutterCorrection = 0u;
    *(_OWORD *)&self->_gdcParametersReference.originalCropRect.origin.y = 0u;
    *(_OWORD *)&self->_gdcParametersReference.canvasResolution.height = 0u;
    *(_OWORD *)&self->_gdcParametersReference.rollingShutterCorrectionHomographies = 0u;
    *(_OWORD *)&self->_gdcParametersReference.inverseHomography[4] = 0u;
    *(_OWORD *)&self->_gdcParametersReference.inverseHomography[8] = 0u;
    *(_OWORD *)&self->_gdcParametersReference.homography[5] = 0u;
    *(_OWORD *)self->_gdcParametersReference.inverseHomography = 0u;
    *(_OWORD *)&self->_gdcParametersReference.originalImageWidth = 0u;
    *(_OWORD *)&self->_gdcParametersReference.homography[1] = 0u;
    *(_OWORD *)&self->_gdcParametersReference.undistortPolynomCoefficients[4] = 0u;
    *(_OWORD *)&self->_gdcParametersReference.centerX = 0u;
    *(_OWORD *)&self->_gdcParametersReference.distortPolynomCoefficients[4] = 0u;
    *(_OWORD *)self->_gdcParametersReference.undistortPolynomCoefficients = 0u;
    *(_OWORD *)self->_gdcParametersReference.distortPolynomCoefficients = 0u;
    *(_OWORD *)self->_gdcParametersAuxiliary.distortPolynomCoefficients = 0u;
    *(_OWORD *)&self->_gdcParametersAuxiliary.distortPolynomCoefficients[4] = 0u;
    *(_OWORD *)self->_gdcParametersAuxiliary.undistortPolynomCoefficients = 0u;
    *(_OWORD *)&self->_gdcParametersAuxiliary.undistortPolynomCoefficients[4] = 0u;
    *(_OWORD *)&self->_gdcParametersAuxiliary.centerX = 0u;
    *(_OWORD *)&self->_gdcParametersAuxiliary.originalImageWidth = 0u;
    *(_OWORD *)&self->_gdcParametersAuxiliary.homography[1] = 0u;
    *(_OWORD *)&self->_gdcParametersAuxiliary.homography[5] = 0u;
    *(_OWORD *)self->_gdcParametersAuxiliary.inverseHomography = 0u;
    *(_OWORD *)&self->_gdcParametersAuxiliary.inverseHomography[4] = 0u;
    *(_OWORD *)&self->_gdcParametersAuxiliary.inverseHomography[8] = 0u;
    *(_OWORD *)&self->_gdcParametersAuxiliary.canvasResolution.height = 0u;
    *(_OWORD *)&self->_gdcParametersAuxiliary.rollingShutterCorrectionHomographies = 0u;
    *(_OWORD *)&self->_gdcParametersAuxiliary.applyRollingShutterCorrection = 0u;
    *(_OWORD *)&self->_gdcParametersAuxiliary.originalCropRect.origin.y = 0u;
    self->_gdcParametersAuxiliary.originalCropRect.size.height = 0.0;
    long long v816 = 0u;
    long long v817 = 0u;
    long long v814 = 0u;
    long long v815 = 0u;
    long long v812 = 0u;
    long long v813 = 0u;
    float32x4_t v810 = 0u;
    long long v811 = 0u;
    float64x2_t v808 = 0u;
    float32x4_t v809 = 0u;
    long long v806 = 0u;
    long long v807 = 0u;
    long long v804 = 0u;
    long long v805 = 0u;
    long long v802 = 0u;
    long long v803 = 0u;
    float32x4_t v800 = 0u;
    long long v801 = 0u;
    float64x2_t v798 = 0u;
    float32x4_t v799 = 0u;
    v285 = self->_calibration;
    if (v285)
    {
      objc_msgSend_distModelFor_(v285, v278, 0, v279, v280, v281, v282, v283, 0.0);
      v292 = self->_calibration;
      long long v814 = v792;
      long long v815 = v793;
      long long v816 = v794;
      long long v817 = v795;
      float32x4_t v810 = v788;
      long long v811 = v789;
      long long v812 = v790;
      long long v813 = v791;
      float64x2_t v808 = v786;
      float32x4_t v809 = v787;
      if (v292)
      {
        objc_msgSend_undistModelFor_(v292, v286, 0, v287, v288, v289, v290, v291, *(float *)v786.f64);
        goto LABEL_44;
      }
    }
    else
    {
      long long v816 = 0uLL;
      long long v817 = 0uLL;
      long long v814 = 0uLL;
      long long v815 = 0uLL;
      long long v812 = 0uLL;
      long long v813 = 0uLL;
      float32x4_t v810 = 0uLL;
      long long v811 = 0uLL;
      float64x2_t v808 = 0uLL;
      float32x4_t v809 = 0uLL;
    }
    long long v794 = 0u;
    long long v795 = 0u;
    long long v792 = 0u;
    long long v793 = 0u;
    long long v790 = 0u;
    long long v791 = 0u;
    float32x4_t v788 = 0u;
    long long v789 = 0u;
    float64x2_t v786 = 0u;
    float32x4_t v787 = 0u;
LABEL_44:
    long long v804 = v792;
    long long v805 = v793;
    long long v806 = v794;
    long long v807 = v795;
    float32x4_t v800 = v788;
    long long v801 = v789;
    long long v802 = v790;
    long long v803 = v791;
    float64x2_t v798 = v786;
    float32x4_t v799 = v787;
    if (sub_262ED3C90(&v808, v798.f64, (uint64_t)&self->_gdcParametersReference, (float)self->_inputCalibrationWidth, (float)self->_inputCalibrationHeight))goto LABEL_132; {
    v304 = self->_calibration;
    }
    if (v304)
    {
      objc_msgSend_distModelFor_(v304, v297, 1, v298, v299, v300, v301, v302, v303);
      v311 = self->_calibration;
      long long v814 = v792;
      long long v815 = v793;
      long long v816 = v794;
      long long v817 = v795;
      float32x4_t v810 = v788;
      long long v811 = v789;
      long long v812 = v790;
      long long v813 = v791;
      float64x2_t v808 = v786;
      float32x4_t v809 = v787;
      if (v311)
      {
        objc_msgSend_undistModelFor_(v311, v305, 1, v306, v307, v308, v309, v310, *(float *)v786.f64);
LABEL_50:
        long long v804 = v792;
        long long v805 = v793;
        long long v806 = v794;
        long long v807 = v795;
        float32x4_t v800 = v788;
        long long v801 = v789;
        long long v802 = v790;
        long long v803 = v791;
        float64x2_t v798 = v786;
        float32x4_t v799 = v787;
        if (!sub_262ED3C90(&v808, v798.f64, (uint64_t)&self->_gdcParametersAuxiliary, (float)self->_inputCalibrationWidth, (float)self->_inputCalibrationHeight))
        {
          LODWORD(v319) = 15.0;
          if (!objc_msgSend_computeStereoRectificationHomographies_alignedToAngle_(self->_calibration, v312, v313, v314, v315, v316, v317, v318, 300.0, v319))
          {
            float32x2_t v327 = vcvt_f32_u32(v254);
            float32x2_t v328 = vmul_f32(vdiv_f32(v327, vcvt_f32_u32(v255)), vcvt_f32_u32(v256));
            float32x2_t v784 = vmul_f32(vsub_f32(v327, v328), (float32x2_t)0x3F0000003F000000);
            double v329 = v784.f32[0];
            double v330 = v784.f32[1];
            float32x2_t v774 = v328;
            double v331 = v328.f32[0];
            double v332 = v328.f32[1];
            objc_msgSend_rectReferenceToReference(self->_calibration, v320, v321, v322, v323, v324, v325, v326, v784.f32[1]);
            uint64_t v340 = 0;
            homography = self->_gdcParametersReference.homography;
            float64x2_t v786 = v342;
            float32x4_t v787 = v343;
            float32x4_t v788 = v344;
            do
            {
              for (uint64_t i = 0; i != 3; ++i)
              {
                v346 = (float *)((unint64_t)(&v786 + i) & 0xFFFFFFFFFFFFFFF3 | (4 * (v340 & 3)));
                float v347 = *v346;
                homography[i] = *v346;
              }
              ++v340;
              homography += 3;
            }
            while (v340 != 3);
            objc_msgSend_referenceToRectReference(self->_calibration, v333, v334, v335, v336, v337, v338, v339, v347);
            uint64_t v356 = 0;
            inverseHomography = self->_gdcParametersReference.inverseHomography;
            float64x2_t v786 = v358;
            float32x4_t v787 = v355;
            float32x4_t v788 = v359;
            do
            {
              for (uint64_t j = 0; j != 3; ++j)
                inverseHomography[j] = *(float *)((unint64_t)(&v786 + j) & 0xFFFFFFFFFFFFFFF3 | (4 * (v356 & 3)));
              ++v356;
              inverseHomography += 3;
            }
            while (v356 != 3);
            *(float32x2_t *)v355.f32 = vcvt_f32_u32(*(uint32x2_t *)&self->_rectifiedOutputWidth);
            float32x2_t v361 = vdiv_f32(vcvt_f32_u32(*(uint32x2_t *)&self->_auxiliaryPaddedHalfResWidth), *(float32x2_t *)v355.f32);
            __asm { FMOV            V9.2S, #1.0 }
            *(float32x2_t *)v355.f32 = vmul_f32(vmul_f32(v784, vsub_f32(_D9, v361)), vdiv_f32(vcvt_f32_u32(*(uint32x2_t *)&self->_scalerOutputWidth), *(float32x2_t *)v355.f32));
            long long v778 = v361.u32[0];
            __int32 v780 = v361.i32[1];
            v355.i32[2] = 1.0;
            float32x4_t v782 = v355;
            objc_msgSend_rectReferenceToAuxiliary(self->_calibration, v348, v349, v350, v351, v352, v353, v354, 1.0);
            float32x4_t v776 = v368;
            float32x4_t v777 = v367;
            float32x4_t v775 = v369;
            objc_msgSend_auxiliaryPaddingHInv(self->_calibration, v370, v371, v372, v373, v374, v375, v376, v367.f32[0]);
            uint64_t v384 = 0;
            long long v820 = v385;
            long long v821 = v386;
            float32x4_t v822 = v387;
            float64x2_t v786 = 0u;
            float32x4_t v787 = 0u;
            float32x4_t v788 = 0u;
            do
            {
              *(float32x4_t *)((char *)&v786 + v384) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v777, COERCE_FLOAT(*(long long *)((char *)&v820 + v384))), v776, *(float32x2_t *)((char *)&v820 + v384), 1), v775, *(float32x4_t *)((char *)&v820 + v384), 2);
              v384 += 16;
            }
            while (v384 != 48);
            uint64_t v388 = 0;
            LODWORD(v389) = 0;
            HIDWORD(v389) = v780;
            float32x4_t v390 = v782;
            v390.i32[3] = 0;
            float32x4_t v391 = (float32x4_t)v786;
            float32x4_t v392 = v787;
            float32x4_t v393 = v788;
            long long v820 = v778;
            long long v821 = v389;
            float32x4_t v822 = v390;
            float64x2_t v786 = 0u;
            float32x4_t v787 = 0u;
            float32x4_t v788 = 0u;
            do
            {
              *(float32x4_t *)((char *)&v786 + v388) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v391, COERCE_FLOAT(*(long long *)((char *)&v820 + v388))), v392, *(float32x2_t *)((char *)&v820 + v388), 1), v393, *(float32x4_t *)((char *)&v820 + v388), 2);
              v388 += 16;
            }
            while (v388 != 48);
            uint64_t v394 = 0;
            float64x2_t v395 = v786;
            float32x4_t v396 = v787;
            float32x4_t v397 = v788;
            HIDWORD(v395.f64[1]) = 0;
            v396.i32[3] = 0;
            v397.i32[3] = 0;
            v398 = self->_gdcParametersAuxiliary.homography;
            float64x2_t v786 = v395;
            float32x4_t v787 = v396;
            float32x4_t v788 = v397;
            do
            {
              for (uint64_t k = 0; k != 3; ++k)
              {
                v400 = (float *)((unint64_t)(&v786 + k) & 0xFFFFFFFFFFFFFFF3 | (4 * (v394 & 3)));
                float v401 = *v400;
                v398[k] = *v400;
              }
              ++v394;
              v398 += 3;
            }
            while (v394 != 3);
            v402 = self->_calibration;
            if (v402)
            {
              objc_msgSend_correctedCalibration(v402, v377, v378, v379, v380, v381, v382, v383, v401);
            }
            else
            {
              double v797 = 0.0;
              long long v795 = 0u;
              long long v796 = 0u;
              long long v793 = 0u;
              long long v794 = 0u;
              long long v791 = 0u;
              long long v792 = 0u;
              long long v789 = 0u;
              long long v790 = 0u;
              float32x4_t v787 = 0u;
              float32x4_t v788 = 0u;
              float64x2_t v786 = 0u;
            }
            long long v403 = v795;
            *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[10] = v794;
            *(_OWORD *)&self->_correctedCalibration.canonicalDisparityuint64_t Scale = v403;
            *(_OWORD *)&self->_correctedCalibration.calibrationDimensions[1] = v796;
            self->_correctedCalibration.pixelSize_um[1] = v797;
            long long v404 = v791;
            *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[2] = v790;
            *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[4] = v404;
            long long v405 = v793;
            *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[6] = v792;
            *(_OWORD *)&self->_correctedCalibration.extrinRotRefefenceToAuxiliary[8] = v405;
            float32x4_t v406 = v787;
            *(float64x2_t *)self->_correctedCalibration.focalLengthPix = v786;
            *(float32x4_t *)self->_correctedCalibration.opticalCenterX = v406;
            float v407 = v788.f32[0];
            long long v408 = v789;
            *(float32x4_t *)self->_correctedCalibration.opticalCenterY = v788;
            *(_OWORD *)self->_correctedCalibration.extrinRotRefefenceToAuxiliary = v408;
            if (*v7 == 1) {
              kdebug_trace();
            }
            if (self->_gdcTransform)
            {
              p_gdcParametersAuxiliary = &self->_gdcParametersAuxiliary;
              v409 = objc_msgSend_commandQueue(self->_metalContext, v377, v378, v379, v380, v381, v382, v383, v407);
              v294 = objc_msgSend_commandBuffer(v409, v410, v411, v412, v413, v414, v415, v416, v417);

              if (v294)
              {
                LODWORD(v421) = self->_auxiliaryPaddedHalfResWidth;
                LODWORD(v422) = self->_auxiliaryPaddedHalfResHeight;
                v425 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_metalContext, v418, (uint64_t)self->_auxHalfResRectifiedRGBAPixelBuffer, 90, 22, 0, v419, v420, COERCE_FLOAT(COERCE_UNSIGNED_INT64((double)v421)), (double)v422);
                if (v425)
                {
                  uint64_t v426 = *(void *)&self->_auxiliaryPaddedHalfResWidth;
                  v427.i64[0] = v426;
                  v427.i64[1] = HIDWORD(v426);
                  self->_gdcParametersAuxiliary.canvasResolution = (CGSize)vcvtq_f64_u64(v427);
                  self->_gdcParametersAuxiliary.applyZTransform = 0;
                  self->_gdcParametersAuxiliary.samplerType = 2;
                  self->_gdcParametersAuxiliary.originalCropRect.origin.x = v329;
                  self->_gdcParametersAuxiliary.originalCropRect.origin.y = v330;
                  self->_gdcParametersAuxiliary.originalCropRect.size.width = v331;
                  self->_gdcParametersAuxiliary.originalCropRect.size.height = v332;
                  if (!objc_msgSend_transformFrom_to_withParameters_withScale_withMode_andCommandBuffer_(self->_gdcTransform, v423, (uint64_t)self->_auxHalfResRGBATexture, (uint64_t)v425, (uint64_t)p_gdcParametersAuxiliary, 1, (uint64_t)v294, v424, 1.0))
                  {

                    LODWORD(v428) = self->_rectifiedOutputWidth;
                    LODWORD(v429) = self->_rectifiedOutputHeight;
                    v425 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_metalContext, v430, (uint64_t)self->_refHalfResRectifiedRGBAPixelBuffer, 90, 22, 0, v431, v432, COERCE_FLOAT(COERCE_UNSIGNED_INT64((double)v428)), (double)v429);
                    if (v425)
                    {
                      uint64_t v435 = *(void *)&self->_rectifiedOutputWidth;
                      v436.i64[0] = v435;
                      v436.i64[1] = HIDWORD(v435);
                      self->_gdcParametersReference.canvasResolution = (CGSize)vcvtq_f64_u64(v436);
                      self->_gdcParametersReference.applyZTransform = 0;
                      self->_gdcParametersReference.samplerType = 2;
                      self->_gdcParametersReference.originalCropRect.origin.x = v329;
                      self->_gdcParametersReference.originalCropRect.origin.y = v330;
                      self->_gdcParametersReference.originalCropRect.size.width = v331;
                      self->_gdcParametersReference.originalCropRect.size.height = v332;
                      if (!objc_msgSend_transformFrom_to_withParameters_withScale_withMode_andCommandBuffer_(self->_gdcTransform, v433, (uint64_t)self->_refHalfResRGBATexture, (uint64_t)v425, (uint64_t)&self->_gdcParametersReference, 1, (uint64_t)v294, v434, 1.0))
                      {

                        if (*v7)
                        {
                          v445 = objc_msgSend_commandQueue(v294, v437, v438, v439, v440, v441, v442, v443, v444);
                          v454 = objc_msgSend_commandBuffer(v445, v446, v447, v448, v449, v450, v451, v452, v453);

                          objc_msgSend_setLabel_(v454, v455, @"KTRACE_MTLCMDBUF", v456, v457, v458, v459, v460, v461);
                          objc_msgSend_addCompletedHandler_(v454, v462, (uint64_t)&unk_270E256A0, v463, v464, v465, v466, v467, v468);
                          objc_msgSend_commit(v454, v469, v470, v471, v472, v473, v474, v475, v476);
                          objc_msgSend_addCompletedHandler_(v294, v477, (uint64_t)&unk_270E256C0, v478, v479, v480, v481, v482, v483);
                        }
                        objc_msgSend_commit(v294, v437, v438, v439, v440, v441, v442, v443, v444);
                        v492 = objc_msgSend_commandQueue(self->_metalContext, v484, v485, v486, v487, v488, v489, v490, v491);
                        uint64_t v38 = objc_msgSend_commandBuffer(v492, v493, v494, v495, v496, v497, v498, v499, v500);

                        if (v38)
                        {
                          unsigned int disparityWidth = self->_disparityWidth;
                          unsigned int disparityHeight = self->_disparityHeight;
                          unsigned int rectifiedOutputWidth = self->_rectifiedOutputWidth;
                          unsigned int rectifiedOutputHeight = self->_rectifiedOutputHeight;
                          v293 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_metalContext, v501, (uint64_t)self->_refHalfResRectifiedRGBAPixelBuffer, 90, 17, 0, v502, v503, COERCE_FLOAT(COERCE_UNSIGNED_INT64((double)rectifiedOutputWidth)), (double)rectifiedOutputHeight);
                          if (v293)
                          {
                            v516 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v508, (uint64_t)self->_refLowResRectifiedRGBAPixelBuffer, 115, 22, 0, v509, v510, v511);
                            if (!v516) {
                              goto LABEL_143;
                            }
                            *(float *)v517.i32 = fminf((float)disparityWidth / (float)rectifiedOutputWidth, (float)disparityHeight / (float)rectifiedOutputHeight);
                            LODWORD(v518) = vdup_lane_s32(v517, 0).u32[0];
                            if (objc_msgSend_downscaleRGBA_toRGBA_scalingFactor_commandBuffer_(self->_referenceDemosaic, v512, (uint64_t)v293, (uint64_t)v516, (uint64_t)v38, v513, v514, v515, v518))goto LABEL_143; {

                            }
                            v293 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v519, (uint64_t)self->_auxHalfResRectifiedRGBAPixelBuffer, 90, 17, 0, v520, v521, v522);
                            if (!v293)
                            {
                              fig_log_get_emitter();
                              FigDebugAssert3();
                              goto LABEL_150;
                            }
                            v516 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v523, (uint64_t)self->_auxLowResRectifiedRGBAPixelBuffer, 115, 22, 0, v524, v525, v526);
                            if (!v516
                              || objc_msgSend_downscaleRGBA_toRGBA_scalingFactor_commandBuffer_(self->_referenceDemosaic, v527, (uint64_t)v293, (uint64_t)v516, (uint64_t)v38, v528, v529, v530, v518))
                            {
LABEL_143:
                              fig_log_get_emitter();
                              FigDebugAssert3();

                              LODWORD(v293) = 0;
                              char v295 = 0;
                              int v296 = 4;
                              id v7 = (_DWORD *)MEMORY[0x263F00E10];
                              goto LABEL_111;
                            }

                            self->_canonicalDisparityScaleFactorOut = 1.0;
                            objc_msgSend_orientationVector(self->_calibration, v531, v532, v533, v534, v535, v536, v537, v538);
                            if (v546 < 0.0)
                            {
                              fig_log_get_emitter();
                              FigDebugAssert3();
                              LODWORD(v293) = 0;
                              goto LABEL_150;
                            }
                            objc_msgSend_orientationVector(self->_calibration, v539, v540, v541, v542, v543, v544, v545, v546);
                            id v7 = (_DWORD *)MEMORY[0x263F00E10];
                            if (v554 >= 0.0)
                            {
                              float32x2_t v555 = vcvt_f32_u32(*(uint32x2_t *)&self->_disparityWidth);
                              float32x2_t v556 = vdiv_f32(v555, vcvt_f32_f64(*(float64x2_t *)self->_correctedCalibration.calibrationDimensions));
                              objc_msgSend_orientationVector(self->_calibration, v547, v548, v549, v550, v551, v552, v553, v555.f32[0]);
                              float32x2_t v565 = vmul_f32(v564, v556);
                              canonicalDisparityuint64_t Scale = self->_correctedCalibration.canonicalDisparityScale;
                              float v567 = canonicalDisparityScale / sqrtf(vaddv_f32(vmul_f32(v565, v565)));
                              self->_canonicalDisparityScaleFactorOut = v567;
                              if (*v7)
                              {
                                v568 = objc_msgSend_commandQueue(v38, v557, v558, v559, v560, v561, v562, v563, v567);
                                v577 = objc_msgSend_commandBuffer(v568, v569, v570, v571, v572, v573, v574, v575, v576);

                                objc_msgSend_setLabel_(v577, v578, @"KTRACE_MTLCMDBUF", v579, v580, v581, v582, v583, v584);
                                objc_msgSend_addCompletedHandler_(v577, v585, (uint64_t)&unk_270E256E0, v586, v587, v588, v589, v590, v591);
                                objc_msgSend_commit(v577, v592, v593, v594, v595, v596, v597, v598, v599);
                                objc_msgSend_addCompletedHandler_(v38, v600, (uint64_t)&unk_270E25700, v601, v602, v603, v604, v605, v606);
                              }
                              if (FigGetCFPreferenceNumberWithDefault()) {
                                objc_msgSend_addCompletedHandler_(v38, v607, (uint64_t)&unk_270E25720, v609, v610, v611, v612, v613, v614);
                              }
                              objc_msgSend_commit(v38, v607, v608, v609, v610, v611, v612, v613, v614);
                              objc_msgSend_waitForSchedule(self->_metalContext, v615, v616, v617, v618, v619, v620, v621, v622);
                              if (FigGetCFPreferenceNumberWithDefault())
                              {
                                id WeakRetained = objc_loadWeakRetained((id *)&self->_disparityInferenceProcessorDelegate);
                                int v629 = objc_msgSend_processDisparityInferenceWithReferenceBuffer_auxBuffer_outputDisparityBuffer_(WeakRetained, v624, (uint64_t)self->_refLowResRectifiedRGBAPixelBuffer, (uint64_t)self->_auxLowResRectifiedRGBAPixelBuffer, (uint64_t)self->_rectifiedDisparityMap, v625, v626, v627, v628);

                                if (*v7 == 1) {
                                  kdebug_trace();
                                }
                                if (!v629)
                                {
                                  v638 = objc_msgSend_commandQueue(self->_metalContext, v630, v631, v632, v633, v634, v635, v636, v637);
                                  v647 = objc_msgSend_commandBuffer(v638, v639, v640, v641, v642, v643, v644, v645, v646);

                                  if (v647)
                                  {
                                    objc_msgSend_minDisparityClampingPercentile(v189, v648, v649, v650, v651, v652, v653, v654, v655);
                                    float v779 = v656;
                                    objc_msgSend_maxDisparityClampingPercentile(v189, v657, v658, v659, v660, v661, v662, v663, v656);
                                    v669.f32[0] = v779;
                                    if ((v779 == 0.0
                                       || (v669.i32[1] = v668,
                                           !objc_msgSend_clampFromPixelBuffer_Mask_MaxDisparity_Percentiles_CommandBuffer_(self->_clamping, v664, (uint64_t)self->_rectifiedDisparityMap, (uint64_t)self->_refLowResRectifiedRGBAPixelBuffer, (uint64_t)v647, v665, v666, v667, 124.0, COERCE_DOUBLE(vminnm_f32(vmaxnm_f32(v669, 0), _D9)))))&& (objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_metalContext, v664, (uint64_t)self->_rectifiedDisparityMap, 25, 17, 0, v666, v667,
                                            0.0,
                                            576.0),
                                          (uint64_t v670 = objc_claimAutoreleasedReturnValue()) != 0))
                                    {
                                      v676 = (void *)v670;
                                      LODWORD(v674) = self->_disparityWidth;
                                      LODWORD(v675) = self->_disparityHeight;
                                      v293 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_metalContext, v671, (uint64_t)self->_outputShiftmap, 25, 22, 0, v672, v673, COERCE_FLOAT(COERCE_UNSIGNED_INT64((double)v674)), (double)v675);
                                      if (v293)
                                      {
                                        self->_gdcParametersReference.canvasResolution = (CGSize)xmmword_262EEDE70;
                                        self->_gdcParametersReference.applyZTransform = 1;
                                        self->_gdcParametersReference.samplerType = 0;
                                        *(float32x2_t *)&self->_gdcParametersReference.originalImageOriginX = v784;
                                        *(float32x2_t *)&self->_gdcParametersReference.originalImageWidth = v774;
                                        objc_msgSend_referenceFinalCropRect(self->_calibration, v677, v678, v679, v680, v681, v682, v683, v774.f32[0]);
                                        CGFloat v685 = v684;
                                        objc_msgSend_referenceFinalCropRect(self->_calibration, v686, v687, v688, v689, v690, v691, v692, *(float *)&v684);
                                        CGFloat v694 = v693;
                                        objc_msgSend_referenceFinalCropRect(self->_calibration, v695, v696, v697, v698, v699, v700, v701, v702);
                                        CGFloat v704 = v703;
                                        objc_msgSend_referenceFinalCropRect(self->_calibration, v705, v706, v707, v708, v709, v710, v711, v712);
                                        self->_gdcParametersReference.originalCropRect.origin.x = v685;
                                        self->_gdcParametersReference.originalCropRect.origin.y = v694;
                                        self->_gdcParametersReference.originalCropRect.size.width = v704;
                                        self->_gdcParametersReference.originalCropRect.size.height = v713;
                                        if (!objc_msgSend_transformFrom_to_withParameters_withScale_withMode_andCommandBuffer_(self->_gdcTransform, v714, (uint64_t)v676, (uint64_t)v293, (uint64_t)&self->_gdcParametersReference, 2, (uint64_t)v647, v715, self->_canonicalDisparityScaleFactorOut))
                                        {
                                          if (*MEMORY[0x263F00E10])
                                          {
                                            v724 = objc_msgSend_commandQueue(v647, v716, v717, v718, v719, v720, v721, v722, v723);
                                            v733 = objc_msgSend_commandBuffer(v724, v725, v726, v727, v728, v729, v730, v731, v732);

                                            objc_msgSend_setLabel_(v733, v734, @"KTRACE_MTLCMDBUF", v735, v736, v737, v738, v739, v740);
                                            objc_msgSend_addCompletedHandler_(v733, v741, (uint64_t)&unk_270E25740, v742, v743, v744, v745, v746, v747);
                                            objc_msgSend_commit(v733, v748, v749, v750, v751, v752, v753, v754, v755);
                                            objc_msgSend_addCompletedHandler_(v647, v756, (uint64_t)&unk_270E25760, v757, v758, v759, v760, v761, v762);
                                          }
                                          objc_msgSend_commit(v647, v716, v717, v718, v719, v720, v721, v722, v723);

                                          objc_msgSend_fillShiftMapMetadataWithCalModel_referenceGDC_auxiliaryGDC_(self, v763, (uint64_t)&self->_correctedCalibration, (uint64_t)&self->_gdcParametersReference, (uint64_t)p_gdcParametersAuxiliary, v764, v765, v766, v767);
                                          LODWORD(v293) = 0;
                                          int v296 = 0;
                                          char v295 = 1;
                                          goto LABEL_107;
                                        }
                                      }
                                      fig_log_get_emitter();
                                      FigDebugAssert3();
                                    }
                                    else
                                    {
                                      fig_log_get_emitter();
                                      FigDebugAssert3();
                                    }
                                    LODWORD(v293) = 0;
                                    char v295 = 0;
                                    int v296 = 4;
LABEL_107:
                                    v294 = v647;
LABEL_108:
                                    id v7 = (_DWORD *)MEMORY[0x263F00E10];
                                    goto LABEL_111;
                                  }
                                  fig_log_get_emitter();
                                  FigDebugAssert3();
                                  FigSignalErrorAt();
                                  LODWORD(v293) = 0;
                                  v294 = 0;
LABEL_150:
                                  char v295 = 0;
                                  int v296 = 4;
                                  goto LABEL_108;
                                }
                              }
                            }
                            fig_log_get_emitter();
                            FigDebugAssert3();
                            LODWORD(v293) = 0;
LABEL_110:
                            char v295 = 0;
                            int v296 = 4;
                            goto LABEL_111;
                          }
                          fig_log_get_emitter();
                          FigDebugAssert3();
                        }
                        else
                        {
                          fig_log_get_emitter();
                          FigDebugAssert3();
                          FigSignalErrorAt();
                          LODWORD(v293) = 0;
                        }
                        char v295 = 0;
                        int v296 = 4;
                        goto LABEL_111;
                      }
                    }
                  }
                }
                fig_log_get_emitter();
                FigDebugAssert3();
              }
              else
              {
                fig_log_get_emitter();
                FigDebugAssert3();
                FigSignalErrorAt();
              }
              LODWORD(v293) = 0;
              uint64_t v38 = 0;
              goto LABEL_110;
            }
            fig_log_get_emitter();
            FigDebugAssert3();
            LODWORD(v293) = 0;
            uint64_t v38 = 0;
            v294 = 0;
            goto LABEL_110;
          }
        }
LABEL_132:
        fig_log_get_emitter();
        FigDebugAssert3();
        uint64_t v38 = 0;
        v294 = 0;
        char v295 = 0;
        int v296 = 4;
        LODWORD(v293) = 1;
        goto LABEL_111;
      }
    }
    else
    {
      long long v816 = 0u;
      long long v817 = 0u;
      long long v814 = 0u;
      long long v815 = 0u;
      long long v812 = 0u;
      long long v813 = 0u;
      float32x4_t v810 = 0u;
      long long v811 = 0u;
      float64x2_t v808 = 0u;
      float32x4_t v809 = 0u;
    }
    long long v794 = 0u;
    long long v795 = 0u;
    long long v792 = 0u;
    long long v793 = 0u;
    long long v790 = 0u;
    long long v791 = 0u;
    float32x4_t v788 = 0u;
    long long v789 = 0u;
    float64x2_t v786 = 0u;
    float32x4_t v787 = 0u;
    goto LABEL_50;
  }
  if (v277 == 1)
  {
    uint64_t v38 = 0;
    v294 = 0;
    char v295 = 0;
    int v296 = 2;
  }
  else
  {
    uint64_t v38 = 0;
    v294 = 0;
    char v295 = 0;
    if (v277 == 2) {
      int v296 = 3;
    }
    else {
      int v296 = 4;
    }
  }
  LODWORD(v293) = 1;
LABEL_111:
  if (CVPixelBufferGetPixelFormatType(ImageBuffer) != 1815162994)
  {
    FigMetalDecRef();
    FigMetalDecRef();
  }
  if (*v7 == 1) {
    int v768 = (int)v293;
  }
  else {
    int v768 = 0;
  }
  if (v768 == 1) {
    kdebug_trace();
  }
  if (v284 == 1) {
    int v769 = 2;
  }
  else {
    int v769 = 4;
  }
  if (v284 == 2) {
    int v769 = 3;
  }
  if (((v284 != 0) & v295) != 0) {
    int v770 = v769;
  }
  else {
    int v770 = v296;
  }
  v771 = self->_referenceMeta;
  self->_referenceMeta = 0;

  v772 = self->_auxiliaryMeta;
  self->_auxiliaryMeta = 0;

  return v770;
}

- (int)finishProcessing
{
  objc_msgSend_waitForIdle(self->_metalContext, a2, v2, v3, v4, v5, v6, v7, v8);
  return 0;
}

- (int)prepareToProcess:(unsigned int)a3
{
  if (objc_msgSend_allocateResources(self, a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7, v8)) {
    return 0;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return 4;
}

- (int)purgeResources
{
  objc_msgSend_releaseResources(self, a2, v2, v3, v4, v5, v6, v7, v8);
  return 0;
}

- (int)resetState
{
  return 0;
}

- (int)_demosaic:(float)a3 andPreshift:
{
  float32x2_t v4 = v3;
  ImageBuffer = CMSampleBufferGetImageBuffer(self->_auxiliarySampleBuffer);
  float v8 = CMSampleBufferGetImageBuffer(self->_referenceSampleBuffer);
  uint32x2_t v9 = *(uint32x2_t *)&self->_inputCalibrationWidth;
  uint32x2_t v122 = *(uint32x2_t *)&self->_scalerOutputWidth;
  uint64_t v13 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_metalContext, v10, (uint64_t)self->_refHalfResLumaPixelBuffer, 10, 23, 0, v11, v12, COERCE_FLOAT(COERCE_UNSIGNED_INT64((double)v122.u32[0])), (double)v122.u32[1]);
  LODWORD(v14) = self->_scalerOutputWidth;
  LODWORD(v15) = self->_scalerOutputHeight;
  unint64_t v19 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_metalContext, v16, (uint64_t)self->_auxHalfResRectifiedRGBAPixelBuffer, 10, 22, 0, v17, v18, COERCE_FLOAT(COERCE_UNSIGNED_INT64((double)v14)), (double)v15);
  objc_msgSend_setOutputImageHeight_(self->_referenceDemosaic, v20, self->_inputCalibrationHeight, v21, v22, v23, v24, v25, v26);
  objc_msgSend_setOutputImageHeight_(self->_auxiliaryDemosaic, v27, self->_inputCalibrationHeight, v28, v29, v30, v31, v32, v33);
  referenceDemosaic = self->_referenceDemosaic;
  referenceMeta = self->_referenceMeta;
  uint64_t v36 = *MEMORY[0x263F2F1E8];
  uint64_t v44 = objc_msgSend_objectForKeyedSubscript_(self->_options, v37, *MEMORY[0x263F2F1E8], v38, v39, v40, v41, v42, v43);
  int v51 = objc_msgSend_preProcessMetadata_cameraInfoByPortType_(referenceDemosaic, v45, (uint64_t)referenceMeta, (uint64_t)v44, v46, v47, v48, v49, v50);

  if (v51
    || (uint64_t v59 = self->_auxiliaryDemosaic,
        auxiliaryMeta = self->_auxiliaryMeta,
        objc_msgSend_objectForKeyedSubscript_(self->_options, v52, v36, v53, v54, v55, v56, v57, v58),
        uint64_t v61 = objc_claimAutoreleasedReturnValue(),
        int v51 = objc_msgSend_preProcessMetadata_cameraInfoByPortType_(v59, v62, (uint64_t)auxiliaryMeta, (uint64_t)v61, v63, v64, v65, v66, v67), v61, v51))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    double v68 = COERCE_DOUBLE(vmul_f32(vdiv_f32(vcvt_f32_u32(v122), vcvt_f32_u32(v9)), v4));
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v8);
    metalContext = self->_metalContext;
    if (PixelFormatType == 1815162994)
    {
      uint64_t v75 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(metalContext, v69, (uint64_t)ImageBuffer, 90, 17, 0, v70, v71, v73);
      objc_msgSend_convertLinearRGB_toLuma_(self->_auxiliaryDemosaic, v76, (uint64_t)v75, (uint64_t)v13, v77, v78, v79, v80, v81);
      objc_msgSend_resampleLuma_toLuma_magnification_preShift_(self->_auxiliaryDemosaic, v82, (uint64_t)v13, (uint64_t)v19, v83, v84, v85, v86, a3, v68);
      uint64_t v91 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v87, (uint64_t)v8, 90, 17, 0, v88, v89, v90);
      objc_msgSend_convertLinearRGB_toLuma_(self->_referenceDemosaic, v92, (uint64_t)v91, (uint64_t)v13, v93, v94, v95, v96, v97);
    }
    else
    {
      uint64_t v98 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(metalContext, v69, (uint64_t)ImageBuffer, 23, 17, 0, v70, v71, v73);
      auxiliaryDemosaic = self->_auxiliaryDemosaic;
      uint64_t v100 = CVPixelBufferGetPixelFormatType(ImageBuffer);
      objc_msgSend_demosaic2x_rawImagePixelFormat_toLuma_toRGBA_(auxiliaryDemosaic, v101, (uint64_t)v98, v100, (uint64_t)v13, (uint64_t)self->_auxHalfResRGBATexture, v102, v103, v104);
      objc_msgSend_resampleLuma_toLuma_magnification_preShift_(self->_auxiliaryDemosaic, v105, (uint64_t)v13, (uint64_t)v19, v106, v107, v108, v109, a3, v68);
      uint64_t v114 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v110, (uint64_t)v8, 23, 17, 0, v111, v112, v113);
      uint64_t v115 = self->_referenceDemosaic;
      uint64_t v116 = CVPixelBufferGetPixelFormatType(v8);
      objc_msgSend_demosaic2x_rawImagePixelFormat_toLuma_toRGBA_(v115, v117, (uint64_t)v114, v116, (uint64_t)v13, (uint64_t)self->_refHalfResRGBATexture, v118, v119, v120);
    }
    int v51 = 0;
  }

  return v51;
}

- (int)_detectKeypoints:(float)a3 preShift:
{
  float32x2_t v6 = (float32x2_t)v5;
  LODWORD(v8) = self->_scalerOutputWidth;
  LODWORD(v5) = self->_scalerOutputHeight;
  uint64_t v12 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_metalContext, a2, (uint64_t)self->_refHalfResLumaPixelBuffer, 10, 17, 0, v3, v4, COERCE_FLOAT(COERCE_UNSIGNED_INT64((double)v8)), (double)v5);
  if (!v12)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    unint64_t v19 = 0;
LABEL_14:
    int v36 = -12782;
    goto LABEL_11;
  }
  LODWORD(v13) = self->_scalerOutputWidth;
  LODWORD(v14) = self->_scalerOutputHeight;
  unint64_t v19 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_metalContext, v9, (uint64_t)self->_auxHalfResRectifiedRGBAPixelBuffer, 10, 17, 0, v10, v11, COERCE_FLOAT(COERCE_UNSIGNED_INT64((double)v13)), (double)v14);
  if (!v19)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_14;
  }
  int v21 = objc_msgSend_processReferenceImage_histogram_doWaitForIdle_(self->_keypointDetRtb, v15, (uint64_t)v12, 0, 0, v16, v17, v18, v20);
  if (v21
    || (int v21 = objc_msgSend_computeTransform_transform_outputCorners_solverSelector_histogram_roi_(self->_keypointDetRtb, v22, (uint64_t)v19, 0, (uint64_t)self->_keypointListRtb, 1, 0, 0, v23)) != 0)
  {
    int v36 = v21;
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    uint64_t v24 = self->_keypointGridHeight * self->_keypointGridWidth;
    if (v24)
    {
      float32x2_t v25 = vcvt_f32_u32(*(uint32x2_t *)&self->_inputCalibrationWidth);
      float32x2_t v26 = vdiv_f32(v25, vmul_n_f32(vcvt_f32_u32(*(uint32x2_t *)&self->_scalerOutputWidth), a3));
      float32x2_t v27 = vmla_n_f32(v6, v25, (float)(1.0 - (float)(1.0 / a3)) * 0.5);
      float keypointsMinSelectionScore = self->_keypointsMinSelectionScore;
      p_var4 = &self->_keypointListRtb->var4;
      do
      {
        float v30 = *p_var4;
        if ((float)(v30 * log2f(fmaxf(p_var4[1], 1.0))) > keypointsMinSelectionScore)
        {
          unsigned int keypointsCount = self->_keypointsCount;
          uint64_t v32 = 2 * keypointsCount;
          float32x2_t v33 = *(float32x2_t *)(p_var4 - 2);
          float32x2_t v34 = vadd_f32(*(float32x2_t *)(p_var4 - 4), 0);
          adaptiveCorrectionKeypointsAuxiliaryDistorted = self->_adaptiveCorrectionKeypointsAuxiliaryDistorted;
          *(float64x2_t *)&self->_adaptiveCorrectionKeypointsReferenceDistorted[v32] = vcvtq_f64_f32(vadd_f32(v34, v34));
          *(float64x2_t *)&adaptiveCorrectionKeypointsAuxiliaryDistorted[v32] = vcvtq_f64_f32(vmla_f32(v27, v26, vadd_f32(v33, 0)));
          self->_unsigned int keypointsCount = keypointsCount + 1;
        }
        p_var4 += 6;
        --v24;
      }
      while (v24);
    }
    int v36 = 0;
  }
LABEL_11:

  return v36;
}

- (int)_detectKeypointsLKTFlow:(float)a3 preShift:(id)a4 parameters:
{
  float32x2_t v6 = v4;
  id v9 = a4;
  unsigned __int16 v187 = 0;
  LODWORD(v10) = self->_scalerOutputWidth;
  LODWORD(v11) = self->_scalerOutputHeight;
  uint64_t v18 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_metalContext, v12, (uint64_t)self->_refHalfResLumaPixelBuffer, 10, 17, 0, v13, v14, COERCE_FLOAT(COERCE_UNSIGNED_INT64((double)v10)), (double)v11);
  if (!v18)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v28 = 0;
LABEL_14:
    int v184 = -12782;
    goto LABEL_11;
  }
  LODWORD(v19) = self->_scalerOutputWidth;
  LODWORD(v20) = self->_scalerOutputHeight;
  uint64_t v28 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_textureSize_plane_(self->_metalContext, v15, (uint64_t)self->_auxHalfResRectifiedRGBAPixelBuffer, 10, 17, 0, v16, v17, COERCE_FLOAT(COERCE_UNSIGNED_INT64((double)v19)), (double)v20);
  if (!v28)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_14;
  }
  char Scale = objc_msgSend_lastScale(self->_lktKeypointDetector, v21, v22, v23, v24, v25, v26, v27, v29);
  uint32x2_t v31 = *(uint32x2_t *)&self->_inputCalibrationWidth;
  uint32x2_t v32 = *(uint32x2_t *)&self->_scalerOutputWidth;
  objc_msgSend_estimateFlowFromReference_target_(self->_lktKeypointDetector, v33, (uint64_t)v18, (uint64_t)v28, v34, v35, v36, v37, v38);
  lktKeypointDetector = self->_lktKeypointDetector;
  uint64_t v48 = objc_msgSend_uv_fwd(lktKeypointDetector, v40, v41, v42, v43, v44, v45, v46, v47);
  uint64_t v57 = objc_msgSend_uv_bwd(self->_lktKeypointDetector, v49, v50, v51, v52, v53, v54, v55, v56);
  uint64_t v66 = objc_msgSend_conf_fwd(self->_lktKeypointDetector, v58, v59, v60, v61, v62, v63, v64, v65);
  uint64_t v75 = objc_msgSend_conf_bwd(self->_lktKeypointDetector, v67, v68, v69, v70, v71, v72, v73, v74);
  objc_msgSend_bidirectionalError(v9, v76, v77, v78, v79, v80, v81, v82, v83);
  float v85 = v84;
  objc_msgSend_confidenceRadialWeight(v9, v86, v87, v88, v89, v90, v91, v92, v84);
  float v94 = v93;
  objc_msgSend_confidenceMinimum(v9, v95, v96, v97, v98, v99, v100, v101, v93);
  float v103 = v102;
  uint64_t v111 = objc_msgSend_blockSize(v9, v104, v105, v106, v107, v108, v109, v110, v102);
  *(float *)&double v112 = v94;
  *(float *)&double v113 = v103;
  objc_msgSend_computeKeypointsFromForwardFlow_backwardFlow_forwardConfidence_backwardConfidence_bidirectionalError_confidenceRadialWeight_confidenceMinimum_blockSize_outNumKeypoints_(lktKeypointDetector, v114, (uint64_t)v48, (uint64_t)v57, (uint64_t)v66, (uint64_t)v75, v111, (uint64_t)&v187, v85, v112, v113);

  objc_msgSend_waitUntilCompleted(self->_lktKeypointDetector, v115, v116, v117, v118, v119, v120, v121, v122);
  if (self->_keypointGridHeight * self->_keypointGridWidth < v187)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v184 = -12780;
  }
  else
  {
    objc_msgSend_keypoints(self->_lktKeypointDetector, v123, v124, v125, v126, v127, v128, v129, v130);
    id v131 = objc_claimAutoreleasedReturnValue();
    uint64_t v140 = objc_msgSend_contents(v131, v132, v133, v134, v135, v136, v137, v138, v139);

    objc_msgSend_keypoints_confidence(self->_lktKeypointDetector, v141, v142, v143, v144, v145, v146, v147, v148);
    id v149 = objc_claimAutoreleasedReturnValue();
    uint64_t v158 = objc_msgSend_contents(v149, v150, v151, v152, v153, v154, v155, v156, v157);

    self->_unsigned int keypointsCount = 0;
    if (v187)
    {
      unint64_t v167 = 0;
      float v168 = 1.0 / a3;
      float32x2_t v169 = vcvt_f32_u32(v31);
      float32x2_t v170 = vdiv_f32(vmul_n_f32(v169, (float)(1 << Scale)), vcvt_f32_u32(v32));
      float32x2_t v171 = vmul_n_f32(v170, v168);
      float32x2_t v172 = vmla_n_f32(v6, v169, (float)(1.0 - v168) * 0.5);
      uint64_t v173 = (_WORD *)(v158 + 6);
      uint64_t v174 = (__int32 *)(v140 + 4);
      do
      {
        LODWORD(_Q0.f64[0]) = *(v174 - 1);
        *(float32x2_t *)&_Q0.f64[0] = vadd_f32((float32x2_t)*(_OWORD *)&vcvtq_f32_f16(*(float16x4_t *)&_Q0.f64[0]), 0);
        float32x2_t v175 = vmul_f32(v170, *(float32x2_t *)&_Q0.f64[0]);
        *(float *)_Q0.f64 = fabsf(v175.f32[0]);
        if (*(float *)_Q0.f64 != INFINITY)
        {
          v5.i32[0] = *v174;
          LOWORD(_Q0.f64[0]) = *v173;
          __asm { FCVT            S13, H0 }
          float32x2_t v186 = v175;
          objc_msgSend_confidenceMinimum(v9, v159, v160, v161, v162, v163, v164, v165, *(float *)_Q0.f64);
          if (*(float *)_Q0.f64 <= _S13)
          {
            unsigned int keypointsCount = self->_keypointsCount;
            uint64_t v182 = 2 * keypointsCount;
            adaptiveCorrectionKeypointsAuxiliaryDistorted = self->_adaptiveCorrectionKeypointsAuxiliaryDistorted;
            *(float64x2_t *)&self->_adaptiveCorrectionKeypointsReferenceDistorted[v182] = vcvtq_f64_f32(v186);
            _Q0 = vcvtq_f64_f32(vmla_f32(v172, v171, vadd_f32((float32x2_t)*(_OWORD *)&vcvtq_f32_f16(v5), 0)));
            *(float64x2_t *)&adaptiveCorrectionKeypointsAuxiliaryDistorted[v182] = _Q0;
            self->_unsigned int keypointsCount = keypointsCount + 1;
          }
        }
        ++v167;
        v173 += 4;
        v174 += 2;
      }
      while (v167 < v187);
    }
    int v184 = 0;
  }
LABEL_11:

  return v184;
}

- (id)selectTuningParametersForCapture
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v9 = objc_msgSend_objectForKeyedSubscript_(self->_referenceMeta, a2, @"PortType", v2, v3, v4, v5, v6, v7);
  uint64_t v71 = objc_msgSend_objectForKeyedSubscript_(self->_auxiliaryMeta, v10, @"PortType", v11, v12, v13, v14, v15, v16);
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v17 = self->_portsToConfig;
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v72, (uint64_t)v76, 16, v19, v20, v21, v22);
  if (v23)
  {
    uint64_t v31 = v23;
    uint64_t v70 = self;
    uint64_t v32 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v73 != v32) {
          objc_enumerationMutation(v17);
        }
        uint64_t v34 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        uint64_t v35 = objc_msgSend_objectForKeyedSubscript_(v34, v24, @"Reference", v25, v26, v27, v28, v29, v30, v70);
        if (objc_msgSend_isEqualToString_(v35, v36, (uint64_t)v9, v37, v38, v39, v40, v41, v42))
        {
          uint64_t v50 = objc_msgSend_objectForKeyedSubscript_(v34, v43, @"Auxiliary", v44, v45, v46, v47, v48, v49);
          char isEqualToString = objc_msgSend_isEqualToString_(v50, v51, (uint64_t)v71, v52, v53, v54, v55, v56, v57);

          if (isEqualToString)
          {
            disparityTuningParameters = v70->_disparityTuningParameters;
            uint64_t v60 = objc_msgSend_objectForKeyedSubscript_(v34, v24, @"Config", v25, v26, v27, v28, v29, v30);
            uint64_t v68 = objc_msgSend_objectForKeyedSubscript_(disparityTuningParameters, v61, (uint64_t)v60, v62, v63, v64, v65, v66, v67);

            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v24, (uint64_t)&v72, (uint64_t)v76, 16, v27, v28, v29, v30);
    }
    while (v31);
  }
  uint64_t v68 = 0;
LABEL_13:

  return v68;
}

- (BOOL)isImageScalerOutputResolution:(__CVBuffer *)a3
{
  unsigned int scalerOutputWidth = self->_scalerOutputWidth;
  unsigned int scalerOutputHeight = self->_scalerOutputHeight;
  return scalerOutputWidth == CVPixelBufferGetWidth(a3)
      && scalerOutputHeight == CVPixelBufferGetHeight(a3);
}

- (BOOL)isTextureScalerOutputResolution:(id)a3
{
  id v4 = a3;
  unsigned int scalerOutputWidth = self->_scalerOutputWidth;
  unsigned int scalerOutputHeight = self->_scalerOutputHeight;
  BOOL v23 = scalerOutputWidth == objc_msgSend_width(v4, v7, v8, v9, v10, v11, v12, v13, v14)
     && scalerOutputHeight == objc_msgSend_height(v4, v15, v16, v17, v18, v19, v20, v21, v22);

  return v23;
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

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (FigDisparityMetadata)shiftMapMetadata
{
  return self->_shiftMapMetadata;
}

- (NSDictionary)options
{
  return self->_options;
}

- (BOOL)shouldComputeDisparityWhenCalibrationFails
{
  return self->_shouldComputeDisparityWhenCalibrationFails;
}

- (void)setShouldComputeDisparityWhenCalibrationFails:(BOOL)a3
{
  self->_shouldComputeDisparityWhenCalibrationFails = a3;
}

- (BOOL)equalizeTeleGainToMatchReference
{
  return self->_equalizeTeleGainToMatchReference;
}

- (void)setEqualizeTeleGainToMatchReference:(BOOL)a3
{
  self->_equalizeTeleGainToMatchReference = a3;
}

- (FigMetalContext)metalContext
{
  return self->_metalContext;
}

- (NSDictionary)disparityDiagnosticMetadata
{
  return self->_disparityDiagnosticMetadata;
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

- (__CVBuffer)outputShiftmap
{
  return self->_outputShiftmap;
}

- (void)setOutputShiftmap:(__CVBuffer *)a3
{
  self->_outputShiftmap = a3;
}

- (DisparityProcessorInferenceDelegate)disparityInferenceProcessorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_disparityInferenceProcessorDelegate);

  return (DisparityProcessorInferenceDelegate *)WeakRetained;
}

- (void)setDisparityInferenceProcessorDelegate:(id)a3
{
}

- ($EE1E03F6ACF96C4AE943C45337DCA2FD)disparityConfig
{
  *(void *)&retstr->var7 = self[20].var3;
  long long v3 = *(_OWORD *)&self[19].var7;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[19].var4;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[20].var1;
  return self;
}

- (void)setDisparityConfig:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var2;
  long long v5 = *(_OWORD *)&a3->var4;
  *(void *)&self->_disparityConfig.uint64_t keypointGridHeight = *(void *)&a3->var7;
  *(_OWORD *)&self->_disparityConfig.BOOL inputIsLinearRGB = v4;
  *(_OWORD *)&self->_disparityConfig.unint64_t outputDisparityHeight = v5;
  *(_OWORD *)&self->_disparityConfig.unsigned int inputImageWidth = v3;
}

- (CGRect)normalizedReferenceCropRect
{
  double x = self->_normalizedReferenceCropRect.origin.x;
  double y = self->_normalizedReferenceCropRect.origin.y;
  double width = self->_normalizedReferenceCropRect.size.width;
  double height = self->_normalizedReferenceCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setNormalizedReferenceCropRect:(CGRect)a3
{
  self->_normalizedReferenceCropRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disparityDiagnosticMetadata, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_shiftMapMetadata, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_destroyWeak((id *)&self->_disparityInferenceProcessorDelegate);
  objc_storeStrong((id *)&self->_disparityTuningParameters, 0);
  objc_storeStrong((id *)&self->_portsToConfig, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_referenceMeta, 0);
  objc_storeStrong((id *)&self->_auxiliaryMeta, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_auxHalfResRGBATexture, 0);
  objc_storeStrong((id *)&self->_refHalfResRGBATexture, 0);
  objc_storeStrong((id *)&self->_lktKeypointDetector, 0);
  objc_storeStrong((id *)&self->_keypointDetRtb, 0);
  objc_storeStrong((id *)&self->_clamping, 0);
  objc_storeStrong((id *)&self->_calibration, 0);
  objc_storeStrong((id *)&self->_auxiliaryDemosaic, 0);
  objc_storeStrong((id *)&self->_referenceDemosaic, 0);

  objc_storeStrong((id *)&self->_gdcTransform, 0);
}

@end