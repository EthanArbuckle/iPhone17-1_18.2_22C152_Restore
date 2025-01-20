@interface FigStillDepthProcessorGPU
- (BOOL)allocateResources;
- (BOOL)disparityQualityIsHigh;
- (FigStillDepthProcessorGPU)init;
- (FigStillDepthProcessorGPU)initWithParameters:(depthProcessorParameters *)a3 commandQueue:(id)a4;
- (NSArray)faceLandmarksArray;
- (float)disparityQualityScore;
- (id)createTextureOfSize:(CGSize)a3 withFormat:(unint64_t)a4;
- (int)confidenceFalloff;
- (int)erosionOnGpu;
- (int)estimateDisparityQualityScore;
- (int)fastBilateralSolver;
- (int)fastBilateralSolver_PrepareHashTable;
- (int)figDepthQuality;
- (int)initF16CVPixelBuffer:(__CVBuffer *)a3 withValue:;
- (int)initSubmodules;
- (int)prewarmWithTuningParameters:(id)a3;
- (int)processDepthBuffer:(__CVBuffer *)a3 yuvBuffer:(__CVBuffer *)a4 parametersDictionary:(id)a5 outputDisparityBuffer:(__CVBuffer *)a6;
- (int)processDepthBuffer:(__CVBuffer *)a3 yuvBuffer:(__CVBuffer *)a4 personSegmentationMaskBuffer:(__CVBuffer *)a5 instanceSegmentationMaskBufferArray:(id)a6 instanceSegmentationConfidences:(id)a7 parametersDictionary:(id)a8 outputDisparityBuffer:(__CVBuffer *)a9;
- (int)processDepthBuffer:(__CVBuffer *)a3 yuvBuffer:(__CVBuffer *)a4 rgbSegmentationMaskBuffer:(__CVBuffer *)a5 parametersDictionary:(id)a6 outputDisparityBuffer:(__CVBuffer *)a7;
- (int)processDisparityPipeline;
- (int)sanityCheckParameters;
- (int)setFarDistanceOnGpu;
- (int)setTuningParameters:(id)a3;
- (int)superPixelHoleFilling;
- (void)dealloc;
- (void)releaseResources;
- (void)setFaceLandmarksArray:(id)a3;
- (void)setInstanceLayerUsage;
@end

@implementation FigStillDepthProcessorGPU

- (int)prewarmWithTuningParameters:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    int v9 = objc_msgSend_setTuningParameters_(self, v4, (uint64_t)v8, v5, v6, v7);
    if (v9)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v9 = FigSignalErrorAt();
  }

  return v9;
}

- (int)initSubmodules
{
  if (self->_submodulesInitialized) {
    return 0;
  }
  v3 = objc_alloc_init(slicMetalParameters);
  slicMetalParameters = self->_slicMetalParameters;
  self->_slicMetalParameters = v3;

  v12 = self->_slicMetalParameters;
  if (v12)
  {
    LODWORD(v10) = self->_width;
    LODWORD(v11) = self->_height;
    objc_msgSend_setInputImageSize_(v12, v5, v6, v7, v8, v9, (double)v10, (double)v11);
    *(float *)&double v13 = (float)self->_configuration.slicSuperPixelsSize;
    objc_msgSend_setSuperPixelSize_(self->_slicMetalParameters, v14, v15, v16, v17, v18, v13);
    objc_msgSend_inputImageSize(self->_slicMetalParameters, v19, v20, v21, v22, v23);
    double v25 = v24;
    objc_msgSend_superPixelSize(self->_slicMetalParameters, v26, v27, v28, v29, v30);
    unsigned int v32 = vcvtpd_u64_f64(v25 / v31);
    objc_msgSend_inputImageSize(self->_slicMetalParameters, v33, v34, v35, v36, v37);
    double v39 = v38;
    objc_msgSend_superPixelSize(self->_slicMetalParameters, v40, v41, v42, v43, v44);
    unsigned int v46 = vcvtpd_u64_f64(v39 / v45);
    objc_msgSend_setMapSize_(self->_slicMetalParameters, v47, v48, v49, v50, v51, (double)v32, (double)v46);
    objc_msgSend_setNo_iters_(self->_slicMetalParameters, v52, self->_configuration.slicMaxIters, v53, v54, v55);
    objc_msgSend_superPixelSize(self->_slicMetalParameters, v56, v57, v58, v59, v60);
    LODWORD(v39) = v61;
    objc_msgSend_superPixelSize(self->_slicMetalParameters, v62, v63, v64, v65, v66);
    *(float *)&double v68 = 1.0 / (float)(*(float *)&v39 * v67);
    objc_msgSend_setSlicoInverseWeight_(self->_slicMetalParameters, v69, v70, v71, v72, v73, v68);
    *(float *)&double v74 = self->_configuration.slicSpatialBias;
    objc_msgSend_setDefaultsSlicoSpatialBias_(self->_slicMetalParameters, v75, v76, v77, v78, v79, v74);
    self->_slicMaxNumSuperPixels = v46 * v32;
    v80 = [SLICMetal alloc];
    v84 = (SLICMetal *)objc_msgSend_initWithParameters_andMetalContext_(v80, v81, (uint64_t)self->_slicMetalParameters, (uint64_t)self->_metalContext, v82, v83);
    slicMetal = self->_slicMetal;
    self->_slicMetal = v84;

    if (self->_slicMetal)
    {
      v86 = [FFCFiltersMetal alloc];
      v91 = (FFCFiltersMetal *)objc_msgSend_initWithMetalContext_(v86, v87, (uint64_t)self->_metalContext, v88, v89, v90);
      FFCFilters = self->_FFCFilters;
      self->_FFCFilters = v91;

      if (self->_FFCFilters)
      {
        v93 = [DistanceTransformGpu alloc];
        v97 = (DistanceTransformGpu *)objc_msgSend_initWithParameters_metalContext_(v93, v94, (uint64_t)&self->_configuration, (uint64_t)self->_metalContext, v95, v96);
        distanceTransformProcessing = self->_distanceTransformProcessing;
        self->_distanceTransformProcessing = v97;

        if (self->_distanceTransformProcessing)
        {
          v99 = [SuperPixelHoleFillMetal alloc];
          v104 = (SuperPixelHoleFillMetal *)objc_msgSend_initWithMetalContext_(v99, v100, (uint64_t)self->_metalContext, v101, v102, v103);
          superPixelHoleFillMetal = self->_superPixelHoleFillMetal;
          self->_superPixelHoleFillMetal = v104;

          if (self->_superPixelHoleFillMetal)
          {
            v106 = [BilateralGridHash alloc];
            v109 = (BilateralGridHash *)objc_msgSend_initWithWidth_height_maxHashTableSize_(v106, v107, self->_width, self->_height, self->_configuration.bilateralSolverMaxHashTableSize, v108);
            bilateralGridProcessing = self->_bilateralGridProcessing;
            self->_bilateralGridProcessing = v109;

            if (self->_bilateralGridProcessing)
            {
              v111 = [BilateralSolverGPU alloc];
              v113 = (BilateralSolverGPU *)objc_msgSend_initWithWidth_height_maxVertices_metalContext_(v111, v112, self->_width, self->_height, self->_configuration.bilateralSolverMaxHashTableSize, (uint64_t)self->_metalContext);
              bilateralSolverGPUProcessing = self->_bilateralSolverGPUProcessing;
              self->_bilateralSolverGPUProcessing = v113;

              if (self->_bilateralSolverGPUProcessing)
              {
                v115 = [DepthProcUtilitiesMetal alloc];
                v120 = (DepthProcUtilitiesMetal *)objc_msgSend_initWithMetalContext_(v115, v116, (uint64_t)self->_metalContext, v117, v118, v119);
                DepthProcUtilMetal = self->_DepthProcUtilMetal;
                self->_DepthProcUtilMetal = v120;

                if (self->_DepthProcUtilMetal)
                {
                  self->_submodulesInitialized = 1;
                  return 0;
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

  return FigSignalErrorAt();
}

- (int)setTuningParameters:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    if ((sub_262E94D80(v4, (uint64_t)&self->_configuration, self->_height, self->_width) & 1) == 0)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int inited = FigSignalErrorAt();
      goto LABEL_7;
    }
  }
  else
  {
    sub_262E94CFC(self->_width, self->_height, (uint64_t)v18);
    long long v12 = v18[9];
    *(_OWORD *)&self->_configuration.setFarDistance.furthestDisparity = v18[8];
    *(_OWORD *)&self->_configuration.confidenceFalloffMaxDist = v12;
    *(_OWORD *)&self->_configuration.bilateralSolverSigmaChromaRange = v18[10];
    *(void *)&self->_configuration.disparityQualityThreshold = v19;
    long long v13 = v18[5];
    *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.useInstanceLayer[3] = v18[4];
    *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.fractionValidThreshold = v13;
    long long v14 = v18[7];
    *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.confidence.sigmaDepth = v18[6];
    *(_OWORD *)&self->_configuration.slicSuperPixelsSize = v14;
    $5DEB421C8168948C0FEEE842055E9CB0 v15 = ($5DEB421C8168948C0FEEE842055E9CB0)v18[1];
    self->_configuration.distanceTransformParameters = ($CD339C1720A50E8AC5A52655CC4957E4)v18[0];
    self->_configuration.superPixelHoleFillParameters.holeFill.brightnessCorrectionParams = v15;
    long long v16 = v18[3];
    *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.colorSigma = v18[2];
    *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.maxNumberOfInstanceLayers = v16;
  }
  int inited = objc_msgSend_initSubmodules(self, v6, v7, v8, v9, v10);
  if (inited)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
LABEL_7:

  return inited;
}

- (FigStillDepthProcessorGPU)init
{
  uint64_t v10 = 0;
  long long v9 = xmmword_262EB9AB0;
  v3 = [FigStillDepthProcessorGPU alloc];
  uint64_t v7 = (FigStillDepthProcessorGPU *)objc_msgSend_initWithParameters_commandQueue_(v3, v4, (uint64_t)&v9, 0, v5, v6);

  return v7;
}

- (FigStillDepthProcessorGPU)initWithParameters:(depthProcessorParameters *)a3 commandQueue:(id)a4
{
  id v6 = a4;
  if (!a3 || !a3->var0 || !a3->var1)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_11:
    unsigned int v32 = 0;
    goto LABEL_7;
  }
  v36.receiver = self;
  v36.super_class = (Class)FigStillDepthProcessorGPU;
  uint64_t v7 = [(FigStillDepthProcessorGPU *)&v36 init];
  if (!v7)
  {
    unsigned int v32 = 0;
    goto LABEL_9;
  }
  self = v7;
  uint64_t v8 = (void *)MEMORY[0x263F086E0];
  uint64_t v9 = objc_opt_class();
  long long v14 = objc_msgSend_bundleForClass_(v8, v10, v9, v11, v12, v13);
  id v15 = objc_alloc(MEMORY[0x263F2EE30]);
  int inited = (FigMetalContext *)objc_msgSend_initWithbundle_andOptionalCommandQueue_(v15, v16, (uint64_t)v14, (uint64_t)v6, v17, v18);
  metalContext = self->_metalContext;
  self->_metalContext = inited;

  if (!self->_metalContext)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_11;
  }
  unsigned int var0 = a3->var0;
  self->_width = a3->var0;
  unsigned int var1 = a3->var1;
  self->_height = var1;
  sub_262E94CFC(var0, var1, (uint64_t)v34);
  long long v23 = v34[8];
  long long v24 = v34[9];
  long long v25 = v34[10];
  *(void *)&self->_configuration.disparityQualityThreshold = v35;
  $CD339C1720A50E8AC5A52655CC4957E4 v26 = ($CD339C1720A50E8AC5A52655CC4957E4)v34[0];
  $5DEB421C8168948C0FEEE842055E9CB0 v27 = ($5DEB421C8168948C0FEEE842055E9CB0)v34[1];
  long long v28 = v34[2];
  *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.maxNumberOfInstanceLayers = v34[3];
  *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.colorSigma = v28;
  self->_configuration.superPixelHoleFillParameters.holeFill.brightnessCorrectionParams = v27;
  self->_configuration.distanceTransformParameters = v26;
  long long v29 = v34[4];
  long long v30 = v34[5];
  long long v31 = v34[6];
  *(_OWORD *)&self->_configuration.slicSuperPixelsSize = v34[7];
  *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.confidence.sigmaDepth = v31;
  *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.fractionValidThreshold = v30;
  *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.useInstanceLayer[3] = v29;
  *(_OWORD *)&self->_configuration.bilateralSolverSigmaChromaRange = v25;
  *(_OWORD *)&self->_configuration.confidenceFalloffMaxDist = v24;
  *(_OWORD *)&self->_configuration.setFarDistance.furthestDisparity = v23;
  self = self;

  unsigned int v32 = self;
LABEL_7:

LABEL_9:
  return v32;
}

- (BOOL)allocateResources
{
  if (!self->_submodulesInitialized) {
    goto LABEL_30;
  }
  if (self->_resourcesAllocated) {
    return 1;
  }
  unsigned int width = self->_width;
  unsigned int height = self->_height;
  PixelBuffer = (__CVBuffer *)CreatePixelBuffer();
  self->_preprocessedDisparity = PixelBuffer;
  if (!PixelBuffer) {
    goto LABEL_30;
  }
  objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v6, (uint64_t)PixelBuffer, 25, 23, 0);
  uint64_t v7 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  preprocessedDisparityTexture = self->_preprocessedDisparityTexture;
  self->_preprocessedDisparityTexture = v7;

  if (!self->_preprocessedDisparityTexture) {
    goto LABEL_30;
  }
  objc_msgSend_createTextureOfSize_withFormat_(self, v9, 25, v10, v11, v12, (double)width, (double)height);
  uint64_t v13 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  validForegroundMaskTexture = self->_validForegroundMaskTexture;
  self->_validForegroundMaskTexture = v13;

  if (!self->_validForegroundMaskTexture) {
    goto LABEL_30;
  }
  objc_msgSend_createTextureOfSize_withFormat_(self, v15, 25, v16, v17, v18, (double)width, (double)height);
  uint64_t v19 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  distanceTransformDisparityTexture = self->_distanceTransformDisparityTexture;
  self->_distanceTransformDisparityTexture = v19;

  if (!self->_distanceTransformDisparityTexture) {
    goto LABEL_30;
  }
  objc_msgSend_createTextureOfSize_withFormat_(self, v21, 25, v22, v23, v24, (double)width, (double)height);
  long long v25 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  distanceTransformMapTexture = self->_distanceTransformMapTexture;
  self->_distanceTransformMapTexture = v25;

  if (!self->_distanceTransformMapTexture) {
    goto LABEL_30;
  }
  $5DEB421C8168948C0FEEE842055E9CB0 v27 = (__CVBuffer *)CreatePixelBuffer();
  self->_confidenceMap = v27;
  if (!v27) {
    goto LABEL_30;
  }
  objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v28, (uint64_t)v27, 25, 23, 0);
  long long v29 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  confidenceMapTexture = self->_confidenceMapTexture;
  self->_confidenceMapTexture = v29;

  if (!self->_confidenceMapTexture) {
    goto LABEL_30;
  }
  objc_msgSend_createTextureOfSize_withFormat_(self, v31, 25, v32, v33, v34, (double)width, (double)height);
  uint64_t v35 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  invalidConfidenceMaskTexture = self->_invalidConfidenceMaskTexture;
  self->_invalidConfidenceMaskTexture = v35;

  if (!self->_invalidConfidenceMaskTexture) {
    goto LABEL_30;
  }
  objc_msgSend_createTextureOfSize_withFormat_(self, v37, 55, v38, v39, v40, (double)width, (double)height);
  uint64_t v41 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  bilateralInvZBufferInTexture = self->_bilateralInvZBufferInTexture;
  self->_bilateralInvZBufferInTexture = v41;

  if (!self->_bilateralInvZBufferInTexture) {
    goto LABEL_30;
  }
  objc_msgSend_createTextureOfSize_withFormat_(self, v43, 55, v44, v45, v46, (double)width, (double)height);
  v47 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  bilateralConfMapFloat32Texture = self->_bilateralConfMapFloat32Texture;
  self->_bilateralConfMapFloat32Texture = v47;

  if (!self->_bilateralConfMapFloat32Texture) {
    goto LABEL_30;
  }
  objc_msgSend_createTextureOfSize_withFormat_(self, v49, 55, v50, v51, v52, (double)width, (double)height);
  uint64_t v53 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  bilateralInvZBufferOutTexture = self->_bilateralInvZBufferOutTexture;
  self->_bilateralInvZBufferOutTexture = v53;

  if (!self->_bilateralInvZBufferOutTexture) {
    goto LABEL_30;
  }
  objc_msgSend_createTextureOfSize_withFormat_(self, v55, 25, v56, v57, v58, (double)width, (double)height);
  uint64_t v59 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  bilateralDisparityTexture = self->_bilateralDisparityTexture;
  self->_bilateralDisparityTexture = v59;

  if (!self->_bilateralDisparityTexture) {
    goto LABEL_30;
  }
  objc_msgSend_createTextureOfSize_withFormat_(self, v61, 25, v62, v63, v64, (double)width, (double)height);
  uint64_t v65 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  superPixelHoleFillDisparityTexture = self->_superPixelHoleFillDisparityTexture;
  self->_superPixelHoleFillDisparityTexture = v65;

  if (!self->_superPixelHoleFillDisparityTexture) {
    goto LABEL_30;
  }
  objc_msgSend_createTextureOfSize_withFormat_(self, v67, 25, v68, v69, v70, (double)width, (double)height);
  uint64_t v71 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  superPixelHoleFillConfidenceTexture = self->_superPixelHoleFillConfidenceTexture;
  self->_superPixelHoleFillConfidenceTexture = v71;

  if (!self->_superPixelHoleFillConfidenceTexture) {
    goto LABEL_30;
  }
  objc_msgSend_createTextureOfSize_withFormat_(self, v73, 25, v74, v75, v76, (double)width, (double)height);
  uint64_t v77 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  imerodeConfidenceMapTexture = self->_imerodeConfidenceMapTexture;
  self->_imerodeConfidenceMapTexture = v77;

  if (!self->_imerodeConfidenceMapTexture) {
    goto LABEL_30;
  }
  objc_msgSend_inputImageSize(self->_slicMetalParameters, v79, v80, v81, v82, v83);
  objc_msgSend_createTextureOfSize_withFormat_(self, v84, 70, v85, v86, v87);
  uint64_t v88 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  slicRgbaTexture = self->_slicRgbaTexture;
  self->_slicRgbaTexture = v88;

  if (!self->_slicRgbaTexture) {
    goto LABEL_30;
  }
  objc_msgSend_mapSize(self->_slicMetalParameters, v90, v91, v92, v93, v94);
  objc_msgSend_createTextureOfSize_withFormat_(self, v95, 125, v96, v97, v98);
  v99 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  slicSpixelCentersIdAndNPixelsTexture = self->_slicSpixelCentersIdAndNPixelsTexture;
  self->_slicSpixelCentersIdAndNPixelsTexture = v99;

  if (!self->_slicSpixelCentersIdAndNPixelsTexture) {
    goto LABEL_30;
  }
  objc_msgSend_mapSize(self->_slicMetalParameters, v101, v102, v103, v104, v105);
  objc_msgSend_createTextureOfSize_withFormat_(self, v106, 70, v107, v108, v109);
  v110 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  slicSpixelColorTexture = self->_slicSpixelColorTexture;
  self->_slicSpixelColorTexture = v110;

  if (!self->_slicSpixelColorTexture) {
    goto LABEL_30;
  }
  objc_msgSend_inputImageSize(self->_slicMetalParameters, v112, v113, v114, v115, v116);
  objc_msgSend_createTextureOfSize_withFormat_(self, v117, 23, v118, v119, v120);
  v121 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  slicIdxImgTexture = self->_slicIdxImgTexture;
  self->_slicIdxImgTexture = v121;

  if (self->_slicIdxImgTexture)
  {
    if (objc_msgSend_allocateResources(self->_distanceTransformProcessing, v123, v124, v125, v126, v127)
      || objc_msgSend_allocateResources(self->_slicMetal, v128, v129, v130, v131, v132)
      || objc_msgSend_allocateResources_(self->_superPixelHoleFillMetal, v133, self->_slicMaxNumSuperPixels, v134, v135, v136)|| objc_msgSend_allocateResources(self->_DepthProcUtilMetal, v137, v138, v139, v140, v141))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      self->_resourcesAllocated = 1;
    }
  }
  else
  {
LABEL_30:
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
  }
  if (self->_resourcesAllocated) {
    return 1;
  }
  objc_msgSend_releaseResources(self, v142, v143, v144, v145, v146);
  return self->_resourcesAllocated;
}

- (int)processDepthBuffer:(__CVBuffer *)a3 yuvBuffer:(__CVBuffer *)a4 parametersDictionary:(id)a5 outputDisparityBuffer:(__CVBuffer *)a6
{
  id v9 = a5;
  *(void *)&self->_disparityQualityScore = 0;
  self->_disparityQualityIsHigh = 0;
  if (!self->_submodulesInitialized || !self->_resourcesAllocated)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v26 = FigSignalErrorAt();
    goto LABEL_30;
  }
  self->_disparityInputBuffer = a3;
  self->_disparityOutputBuffer = a6;
  if (!a3
    || !a6
    || CVPixelBufferGetPixelFormatType(a3) != 1751411059
    && CVPixelBufferGetPixelFormatType(self->_disparityInputBuffer) != 1717856627
    && CVPixelBufferGetPixelFormatType(self->_disparityInputBuffer) != 1751410032
    && CVPixelBufferGetPixelFormatType(self->_disparityInputBuffer) != 1717855600
    || CVPixelBufferGetPixelFormatType(self->_disparityOutputBuffer) != 1751411059
    && CVPixelBufferGetPixelFormatType(self->_disparityOutputBuffer) != 1717856627
    && CVPixelBufferGetPixelFormatType(self->_disparityOutputBuffer) != 1751410032
    && CVPixelBufferGetPixelFormatType(self->_disparityOutputBuffer) != 1717855600
    || !CVPixelBufferGetWidth(self->_disparityInputBuffer)
    || !CVPixelBufferGetHeight(self->_disparityInputBuffer)
    || !CVPixelBufferGetWidth(self->_disparityOutputBuffer)
    || !CVPixelBufferGetHeight(self->_disparityOutputBuffer))
  {
    goto LABEL_34;
  }
  if (CVPixelBufferGetPixelFormatType(self->_disparityInputBuffer) == 1751411059
    || CVPixelBufferGetPixelFormatType(self->_disparityInputBuffer) == 1751410032)
  {
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v10, (uint64_t)self->_disparityInputBuffer, 25, 17, 0);
  }
  else
  {
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v10, (uint64_t)self->_disparityInputBuffer, 55, 17, 0);
  }
  uint64_t v11 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  disparityInputTexture = self->_disparityInputTexture;
  self->_disparityInputTexture = v11;

  if (CVPixelBufferGetPixelFormatType(self->_disparityOutputBuffer) == 1751411059
    || CVPixelBufferGetPixelFormatType(self->_disparityOutputBuffer) == 1751410032)
  {
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v13, (uint64_t)self->_disparityOutputBuffer, 25, 22, 0);
  }
  else
  {
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v13, (uint64_t)self->_disparityOutputBuffer, 55, 22, 0);
  }
  long long v14 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  disparityOutputTexture = self->_disparityOutputTexture;
  self->_disparityOutputTexture = v14;

  uint64_t v19 = self->_disparityInputTexture;
  if (!v19 || (uint64_t v20 = self->_disparityOutputTexture) == 0)
  {
LABEL_34:
    fig_log_get_emitter();
    FigDebugAssert3();
    if (!FigSignalErrorAt()) {
      goto LABEL_29;
    }
LABEL_35:
    int v26 = 4;
    goto LABEL_30;
  }
  if (objc_msgSend_boxFilter11x11From_To_(self->_FFCFilters, v16, (uint64_t)v19, (uint64_t)v20, v17, v18))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_35;
  }
  objc_msgSend_waitForSchedule(self->_metalContext, v21, v22, v23, v24, v25);
LABEL_29:
  int v26 = 0;
LABEL_30:

  return v26;
}

- (int)processDepthBuffer:(__CVBuffer *)a3 yuvBuffer:(__CVBuffer *)a4 rgbSegmentationMaskBuffer:(__CVBuffer *)a5 parametersDictionary:(id)a6 outputDisparityBuffer:(__CVBuffer *)a7
{
  return 17;
}

- (int)processDepthBuffer:(__CVBuffer *)a3 yuvBuffer:(__CVBuffer *)a4 personSegmentationMaskBuffer:(__CVBuffer *)a5 instanceSegmentationMaskBufferArray:(id)a6 instanceSegmentationConfidences:(id)a7 parametersDictionary:(id)a8 outputDisparityBuffer:(__CVBuffer *)a9
{
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  *(void *)&self->_disparityQualityScore = 0;
  self->_disparityQualityIsHigh = 0;
  if (!self->_submodulesInitialized || !self->_resourcesAllocated)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v76 = FigSignalErrorAt();
    goto LABEL_21;
  }
  objc_storeStrong((id *)&self->_instanceSegmentationInputBufferArray, a6);
  self->_yuvInputBuffer = a4;
  self->_disparityInputBuffer = a3;
  self->_personSegmentationMaskInputBuffer = a5;
  self->_disparityOutputBuffer = a9;
  if (objc_msgSend_sanityCheckParameters(self, v19, v20, v21, v22, v23))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
  }
  else
  {
    if (v17 && (unint64_t)objc_msgSend_count(v17, v24, v25, v26, v27, v28) >= 4)
    {
      uint64_t v33 = 0;
      while (1)
      {
        uint64_t v34 = objc_msgSend_objectAtIndexedSubscript_(v17, v29, v33, v30, v31, v32);

        if (!v34) {
          break;
        }
        if (++v33 == 4)
        {
          uint64_t v35 = 280;
          uint64_t v36 = 86;
          do
          {
            objc_msgSend_objectAtIndexedSubscript_(self->_instanceSegmentationInputBufferArray, v29, v36 - 86, v30, v31, v32);
            uint64_t v37 = (objc_class *)objc_claimAutoreleasedReturnValue();
            *(Class *)((char *)&self->super.isa + v35) = v37;

            uint64_t v39 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v38, *(uint64_t *)((char *)&self->super.isa + v35), 25, 17, 0);
            uint64_t v40 = *(void **)((char *)&self->_configuration.superPixelHoleFillParameters.holeFill.brightnessCorrectionParams.k
                           + v35);
            *(void *)((char *)&self->_configuration.superPixelHoleFillParameters.holeFill.brightnessCorrectionParams.k
                      + v35) = v39;

            uint64_t v45 = objc_msgSend_objectAtIndexedSubscript_(v17, v41, v36 - 86, v42, v43, v44);
            objc_msgSend_floatValue(v45, v46, v47, v48, v49, v50);
            *((_DWORD *)&self->super.isa + v36) = v51;

            v35 += 8;
            ++v36;
          }
          while (v35 != 312);
          objc_msgSend_setInstanceLayerUsage(self, v29, v52, v30, v31, v32);
          metalContext = self->_metalContext;
          if (self->_configuration.setFarDistance.useBestInstanceForPersonSegmentation)
          {
            objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(metalContext, v53, (uint64_t)self->_instanceSegmentationInputBuffer[self->_sortedInstanceLayerIndex[3]], 25, 17, 0);
            uint64_t v55 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
            personSegmentationMaskInputTexture = self->_personSegmentationMaskInputTexture;
            self->_personSegmentationMaskInputTexture = v55;

            if (!self->_personSegmentationMaskInputTexture) {
              break;
            }
          }
          else
          {
            objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(metalContext, v53, (uint64_t)self->_personSegmentationMaskInputBuffer, 25, 17, 0);
            uint64_t v58 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
            uint64_t v59 = self->_personSegmentationMaskInputTexture;
            self->_personSegmentationMaskInputTexture = v58;

            if (!self->_personSegmentationMaskInputTexture) {
              break;
            }
          }
          objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v57, (uint64_t)self->_yuvInputBuffer, 10, 17, 0);
          uint64_t v60 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
          yuvInputLumaTexture = self->_yuvInputLumaTexture;
          self->_yuvInputLumaTexture = v60;

          if (self->_yuvInputLumaTexture)
          {
            objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v62, (uint64_t)self->_yuvInputBuffer, 30, 17, 1);
            uint64_t v63 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
            yuvInputChromaTexture = self->_yuvInputChromaTexture;
            self->_yuvInputChromaTexture = v63;

            if (self->_yuvInputChromaTexture)
            {
              objc_storeStrong((id *)&self->_metadataDictionary, a8);
              objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v65, (uint64_t)self->_disparityOutputBuffer, 25, 22, 0);
              uint64_t v66 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
              disparityOutputTexture = self->_disparityOutputTexture;
              self->_disparityOutputTexture = v66;

              if (self->_disparityOutputTexture)
              {
                objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metalContext, v68, (uint64_t)self->_disparityInputBuffer, 25, 17, 0);
                uint64_t v69 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
                disparityInputTexture = self->_disparityInputTexture;
                self->_disparityInputTexture = v69;

                if (self->_disparityInputTexture)
                {
                  int v76 = objc_msgSend_processDisparityPipeline(self, v71, v72, v73, v74, v75);
                  if (v76)
                  {
                    fig_log_get_emitter();
                    FigDebugAssert3();
                  }
                  goto LABEL_21;
                }
              }
            }
          }
          break;
        }
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    if (!FigSignalErrorAt())
    {
      int v76 = 0;
      goto LABEL_21;
    }
  }
  int v76 = 4;
LABEL_21:

  return v76;
}

- (void)releaseResources
{
  objc_msgSend_waitForIdle(self->_metalContext, a2, v2, v3, v4, v5);
  yuvInputLumaTexture = self->_yuvInputLumaTexture;
  *(_OWORD *)&self->_yuvInputBuffer = 0u;

  yuvInputChromaTexture = self->_yuvInputChromaTexture;
  self->_yuvInputChromaTexture = 0;

  disparityInputTexture = self->_disparityInputTexture;
  *(_OWORD *)&self->_disparityInputBuffer = 0u;

  disparityOutputTexture = self->_disparityOutputTexture;
  *(_OWORD *)&self->_disparityOutputBuffer = 0u;

  personSegmentationMaskInputTexture = self->_personSegmentationMaskInputTexture;
  *(_OWORD *)&self->_personSegmentationMaskInputBuffer = 0u;

  for (uint64_t i = 0; i != 4; ++i)
  {
    uint64_t v13 = (char *)self + i * 8;
    *((void *)v13 + 35) = 0;
    long long v14 = self->_instanceSegmentationInputTexture[i];
    *((void *)v13 + 39) = 0;
  }
  preprocessedDisparity = self->_preprocessedDisparity;
  if (preprocessedDisparity)
  {
    CFRelease(preprocessedDisparity);
    self->_preprocessedDisparity = 0;
  }
  preprocessedDisparityTexture = self->_preprocessedDisparityTexture;
  self->_preprocessedDisparityTexture = 0;

  validForegroundMaskTexture = self->_validForegroundMaskTexture;
  self->_validForegroundMaskTexture = 0;

  distanceTransformDisparityTexture = self->_distanceTransformDisparityTexture;
  self->_distanceTransformDisparityTexture = 0;

  distanceTransformMapTexture = self->_distanceTransformMapTexture;
  self->_distanceTransformMapTexture = 0;

  confidenceMap = self->_confidenceMap;
  if (confidenceMap)
  {
    CFRelease(confidenceMap);
    self->_confidenceMap = 0;
  }
  confidenceMapTexture = self->_confidenceMapTexture;
  self->_confidenceMapTexture = 0;

  invalidConfidenceMaskTexture = self->_invalidConfidenceMaskTexture;
  self->_invalidConfidenceMaskTexture = 0;

  imerodeConfidenceMapTexture = self->_imerodeConfidenceMapTexture;
  self->_imerodeConfidenceMapTexture = 0;

  bilateralInvZBufferInTexture = self->_bilateralInvZBufferInTexture;
  self->_bilateralInvZBufferInTexture = 0;

  bilateralConfMapFloat32Texture = self->_bilateralConfMapFloat32Texture;
  self->_bilateralConfMapFloat32Texture = 0;

  bilateralInvZBufferOutTexture = self->_bilateralInvZBufferOutTexture;
  self->_bilateralInvZBufferOutTexture = 0;

  bilateralDisparityTexture = self->_bilateralDisparityTexture;
  self->_bilateralDisparityTexture = 0;

  slicRgbaTexture = self->_slicRgbaTexture;
  self->_slicRgbaTexture = 0;

  slicSpixelCentersIdAndNPixelsTexture = self->_slicSpixelCentersIdAndNPixelsTexture;
  self->_slicSpixelCentersIdAndNPixelsTexture = 0;

  slicSpixelColorTexture = self->_slicSpixelColorTexture;
  self->_slicSpixelColorTexture = 0;

  superPixelHoleFillDisparityTexture = self->_superPixelHoleFillDisparityTexture;
  self->_superPixelHoleFillDisparityTexture = 0;

  superPixelHoleFillConfidenceTexture = self->_superPixelHoleFillConfidenceTexture;
  self->_superPixelHoleFillConfidenceTexture = 0;

  distanceTransformProcessing = self->_distanceTransformProcessing;
  self->_distanceTransformProcessing = 0;

  slicMetalParameters = self->_slicMetalParameters;
  self->_slicMetalParameters = 0;

  slicMetal = self->_slicMetal;
  self->_slicMetal = 0;

  superPixelHoleFillMetal = self->_superPixelHoleFillMetal;
  self->_superPixelHoleFillMetal = 0;

  bilateralGridProcessing = self->_bilateralGridProcessing;
  self->_bilateralGridProcessing = 0;

  bilateralSolverGPUProcessing = self->_bilateralSolverGPUProcessing;
  self->_bilateralSolverGPUProcessing = 0;

  FFCFilters = self->_FFCFilters;
  self->_FFCFilters = 0;

  DepthProcUtilMetal = self->_DepthProcUtilMetal;
  self->_DepthProcUtilMetal = 0;

  *(_WORD *)&self->_submodulesInitialized = 0;
}

- (void)dealloc
{
  objc_msgSend_releaseResources(self, a2, v2, v3, v4, v5);
  v7.receiver = self;
  v7.super_class = (Class)FigStillDepthProcessorGPU;
  [(FigStillDepthProcessorGPU *)&v7 dealloc];
}

- (int)processDisparityPipeline
{
  *(float *)&double v3 = self->_configuration.confidenceSeedValue;
  if (objc_msgSend_preprocessData_inputDisparity_outputDisparity_outputConfidence_(self->_DepthProcUtilMetal, a2, (uint64_t)self->_disparityInputTexture, (uint64_t)self->_preprocessedDisparityTexture, (uint64_t)self->_confidenceMapTexture, v2, v3)|| (objc_msgSend_waitForSchedule(self->_metalContext, v5, v6, v7, v8, v9), objc_msgSend_estimateDisparityQualityScore(self, v10, v11, v12, v13, v14))|| self->_disparityQualityScore <= 0.03|| objc_msgSend_erosionOnGpu(self, v15, v16, v17, v18, v19))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  else
  {
    superPixelHoleFillMetal = self->_superPixelHoleFillMetal;
    yuvInputLumaTexture = self->_yuvInputLumaTexture;
    yuvInputChromaTexture = self->_yuvInputChromaTexture;
    slicRgbaTexture = self->_slicRgbaTexture;
    long long v25 = *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.useInstanceLayer[3];
    long long v112 = *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.maxNumberOfInstanceLayers;
    long long v113 = v25;
    long long v26 = *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.confidence.sigmaDepth;
    long long v114 = *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.fractionValidThreshold;
    long long v115 = v26;
    long long v27 = *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.colorSigma;
    $5DEB421C8168948C0FEEE842055E9CB0 brightnessCorrectionParams = self->_configuration.superPixelHoleFillParameters.holeFill.brightnessCorrectionParams;
    long long v111 = v27;
    if (objc_msgSend_convertFrom420fPixelBuffer_lumaTexture_chromaTexture_toSlicRgbaTexture_(superPixelHoleFillMetal, v20, (uint64_t)&brightnessCorrectionParams, (uint64_t)yuvInputLumaTexture, (uint64_t)yuvInputChromaTexture, (uint64_t)slicRgbaTexture)|| (objc_msgSend_defaultsSlicoSpatialBias(self->_slicMetalParameters, v28, v29, v30, v31, v32), brightnessCorrectionParams.doBrightnessCorrection = v33, objc_msgSend_processSLICToOutputSPixelCentersIdsAndCounts_outputSPixelColor_outputIndexes_inputImage_parameters_(self->_slicMetal, v34, (uint64_t)self->_slicSpixelCentersIdAndNPixelsTexture, (uint64_t)self->_slicSpixelColorTexture, (uint64_t)self->_slicIdxImgTexture, (uint64_t)self->_slicRgbaTexture, &brightnessCorrectionParams)))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
      return 0;
    }
    objc_msgSend_fastBilateralSolver_PrepareHashTable(self, v35, v36, v37, v38, v39);
    objc_msgSend_waitForSchedule(self->_metalContext, v40, v41, v42, v43, v44);
    uint64_t v45 = self->_superPixelHoleFillMetal;
    uint64_t v46 = self->_slicRgbaTexture;
    slicIdxImgTexture = self->_slicIdxImgTexture;
    personSegmentationMaskInputTexture = self->_personSegmentationMaskInputTexture;
    uint64_t v49 = self->_instanceSegmentationInputTexture[0];
    uint64_t v50 = self->_instanceSegmentationInputTexture[1];
    int v51 = self->_instanceSegmentationInputTexture[2];
    uint64_t v52 = self->_instanceSegmentationInputTexture[3];
    long long v53 = *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.useInstanceLayer[3];
    long long v112 = *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.maxNumberOfInstanceLayers;
    long long v113 = v53;
    long long v54 = *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.confidence.sigmaDepth;
    long long v114 = *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.fractionValidThreshold;
    long long v115 = v54;
    long long v55 = *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.colorSigma;
    $5DEB421C8168948C0FEEE842055E9CB0 brightnessCorrectionParams = self->_configuration.superPixelHoleFillParameters.holeFill.brightnessCorrectionParams;
    long long v111 = v55;
    if (!objc_msgSend_computeStage0_inImageTexture_inLabelTexture_inPersonMaskTexture_inInstanceSegmentationLayer0Texture_inInstanceSegmentationLayer1Texture_inInstanceSegmentationLayer2Texture_inInstanceSegmentationLayer3Texture_(v45, v56, (uint64_t)&brightnessCorrectionParams, (uint64_t)v46, (uint64_t)slicIdxImgTexture, (uint64_t)personSegmentationMaskInputTexture, v49, v50, v51, v52))
    {
      uint64_t v62 = (_DWORD *)MEMORY[0x263F00E10];
      if (*MEMORY[0x263F00E10] == 1) {
        kdebug_trace();
      }
      objc_msgSend_computeCoordIndices(self->_bilateralGridProcessing, v57, v58, v59, v60, v61);
      if (*v62 == 1)
      {
        kdebug_trace();
        if (*v62 == 1) {
          kdebug_trace();
        }
      }
      objc_msgSend_computeInterpIndices(self->_bilateralGridProcessing, v63, v64, v65, v66, v67);
      if (*v62 == 1) {
        kdebug_trace();
      }
      objc_msgSend_waitForSchedule(self->_metalContext, v68, v69, v70, v71, v72);
      *(float *)&double v73 = self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.minPersonSegmentation;
      if (!objc_msgSend_makeForegroundMask_personSegmentationMap_validForegroundMask_minSegmentationThreshold_(self->_DepthProcUtilMetal, v74, (uint64_t)self->_confidenceMapTexture, (uint64_t)self->_personSegmentationMaskInputTexture, (uint64_t)self->_validForegroundMaskTexture, v75, v73)&& !objc_msgSend_setFarDistanceOnGpu(self, v76, v77, v78, v79, v80))
      {
        objc_msgSend_waitForSchedule(self->_metalContext, v81, v82, v83, v84, v85);
        if (!objc_msgSend_confidenceFalloff(self, v86, v87, v88, v89, v90)
          && !objc_msgSend_superPixelHoleFilling(self, v91, v92, v93, v94, v95)
          && !objc_msgSend_fastBilateralSolver(self, v96, v97, v98, v99, v100)
          && !objc_msgSend_boxFilterFrom_To_(self->_FFCFilters, v101, (uint64_t)self->_bilateralDisparityTexture, (uint64_t)self->_disparityOutputTexture, v102, v103))
        {
          objc_msgSend_waitForSchedule(self->_metalContext, v104, v105, v106, v107, v108);
          return 0;
        }
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)erosionOnGpu
{
  int v5 = objc_msgSend_erosionFilterFrom_To_(self->_FFCFilters, a2, (uint64_t)self->_confidenceMapTexture, (uint64_t)self->_imerodeConfidenceMapTexture, v2, v3);
  if (v5)
  {
    int v8 = v5;
    fig_log_get_emitter();
LABEL_6:
    FigDebugAssert3();
    return v8;
  }
  int v8 = objc_msgSend_postErosion_outputConfidence_outputDisparity_(self->_DepthProcUtilMetal, v6, (uint64_t)self->_imerodeConfidenceMapTexture, (uint64_t)self->_confidenceMapTexture, (uint64_t)self->_preprocessedDisparityTexture, v7);
  if (v8)
  {
    fig_log_get_emitter();
    goto LABEL_6;
  }
  return v8;
}

- (int)setFarDistanceOnGpu
{
  if (objc_msgSend_computeDistanceWithTexture_distance_waitForScheduled_(self->_distanceTransformProcessing, a2, (uint64_t)self->_validForegroundMaskTexture, (uint64_t)self->_distanceTransformMapTexture, 0, v2))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  else
  {
    int v5 = objc_msgSend_setFarWithDistance_inputDistanceTransformMap_inputDisparity_inoutConfidenceMap_outputDistanceTransformDisparity_(self->_DepthProcUtilMetal, v4, *(void *)&self->_configuration.setFarDistance.maxDistance, *(void *)&self->_configuration.setFarDistance.confidence, (uint64_t)self->_distanceTransformMapTexture, (uint64_t)self->_preprocessedDisparityTexture, self->_confidenceMapTexture, self->_distanceTransformDisparityTexture);
    if (v5)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    return v5;
  }
}

- (int)confidenceFalloff
{
  int v5 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  int Mask_value_outputBuffer = objc_msgSend_buildFindMask_value_outputBuffer_(self->_DepthProcUtilMetal, a2, (uint64_t)self->_confidenceMapTexture, (uint64_t)self->_invalidConfidenceMaskTexture, v2, v3, 0.0);
  if (Mask_value_outputBuffer)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    int v9 = objc_msgSend_computeDistanceWithTexture_distance_waitForScheduled_(self->_distanceTransformProcessing, v6, (uint64_t)self->_invalidConfidenceMaskTexture, (uint64_t)self->_distanceTransformMapTexture, 0, v7);
    if (v9)
    {
      int v11 = v9;
      fig_log_get_emitter();
      FigDebugAssert3();
      int Mask_value_outputBuffer = v11;
    }
  }
  if (*v5 == 1) {
    kdebug_trace();
  }
  return Mask_value_outputBuffer;
}

- (void)setInstanceLayerUsage
{
  *(void *)self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.useInstanceLayer = 0;
  float minInstanceLayerConfidence = self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.minInstanceLayerConfidence;
  int maxNumberOfInstanceLayers = self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.maxNumberOfInstanceLayers;
  *(void *)&self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.useInstanceLayer[2] = 0;
  *(_OWORD *)self->_sortedInstanceLayerIndex = xmmword_262EB9AA0;
  instanceSegmentationInputConfidence = self->_instanceSegmentationInputConfidence;
  int v5 = 1;
  uint64_t v6 = 3;
  do
  {
    uint64_t v7 = 0;
    int v8 = self->_sortedInstanceLayerIndex[0];
    do
    {
      int v9 = (char *)self + 4 * v7;
      uint64_t v10 = *((int *)v9 + 91);
      if (instanceSegmentationInputConfidence[v8] >= instanceSegmentationInputConfidence[v10])
      {
        *((_DWORD *)v9 + 90) = v10;
        *((_DWORD *)v9 + 91) = v8;
      }
      else
      {
        int v8 = *((_DWORD *)v9 + 91);
      }
      ++v7;
    }
    while (v6 != v7);
    ++v5;
    --v6;
  }
  while (v5 != 4);
  if (maxNumberOfInstanceLayers >= 1)
  {
    uint64_t v11 = 0;
    int v12 = 0;
    do
    {
      uint64_t v13 = self->_sortedInstanceLayerIndex[v11 + 3];
      if (instanceSegmentationInputConfidence[v13] >= minInstanceLayerConfidence)
      {
        self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.useInstanceLayer[v13] = 1;
        ++v12;
      }
      if (v11 == -3) {
        break;
      }
      --v11;
    }
    while (v12 < maxNumberOfInstanceLayers);
  }
}

- (int)superPixelHoleFilling
{
  *(float *)&double v2 = self->_configuration.confidenceFalloffMaxDist;
  *(float *)&double v3 = (float)(*(float *)&v2 * self->_configuration.confidenceFalloffSigma)
                * (float)((float)(*(float *)&v2 * self->_configuration.confidenceFalloffSigma)
                        + (float)(*(float *)&v2 * self->_configuration.confidenceFalloffSigma));
  superPixelHoleFillMetal = self->_superPixelHoleFillMetal;
  slicIdxImgTexture = self->_slicIdxImgTexture;
  confidenceMapTexture = self->_confidenceMapTexture;
  distanceTransformDisparityTexture = self->_distanceTransformDisparityTexture;
  distanceTransformMapTexture = self->_distanceTransformMapTexture;
  long long v10 = *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.useInstanceLayer[3];
  long long v42 = *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.maxNumberOfInstanceLayers;
  long long v43 = v10;
  long long v11 = *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.confidence.sigmaDepth;
  long long v44 = *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.fractionValidThreshold;
  long long v45 = v11;
  long long v12 = *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.colorSigma;
  $5DEB421C8168948C0FEEE842055E9CB0 brightnessCorrectionParams = self->_configuration.superPixelHoleFillParameters.holeFill.brightnessCorrectionParams;
  long long v41 = v12;
  int v13 = objc_msgSend_computeStage4_inLabelTexture_inDepthTex_inConfTex_inDistanceTransformMapTex_maxDist_sigma_den_(superPixelHoleFillMetal, a2, (uint64_t)&brightnessCorrectionParams, (uint64_t)slicIdxImgTexture, (uint64_t)distanceTransformDisparityTexture, (uint64_t)confidenceMapTexture, distanceTransformMapTexture, v2, v3);
  if (v13) {
    goto LABEL_12;
  }
  uint64_t v19 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  objc_msgSend_computeBlurIndices(self->_bilateralGridProcessing, v14, v15, v16, v17, v18);
  if (*v19 == 1) {
    kdebug_trace();
  }
  objc_msgSend_waitForIdle(self->_metalContext, v20, v21, v22, v23, v24);
  long long v25 = self->_superPixelHoleFillMetal;
  long long v26 = self->_slicIdxImgTexture;
  imerodeConfidenceMapTexture = self->_imerodeConfidenceMapTexture;
  slicRgbaTexture = self->_slicRgbaTexture;
  superPixelHoleFillDisparityTexture = self->_superPixelHoleFillDisparityTexture;
  superPixelHoleFillConfidenceTexture = self->_superPixelHoleFillConfidenceTexture;
  long long v31 = *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.useInstanceLayer[3];
  long long v42 = *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.maxNumberOfInstanceLayers;
  long long v43 = v31;
  long long v32 = *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.confidence.sigmaDepth;
  long long v44 = *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.fractionValidThreshold;
  long long v45 = v32;
  long long v33 = *(_OWORD *)&self->_configuration.superPixelHoleFillParameters.holeFill.similarityParams.colorSigma;
  $5DEB421C8168948C0FEEE842055E9CB0 brightnessCorrectionParams = self->_configuration.superPixelHoleFillParameters.holeFill.brightnessCorrectionParams;
  long long v41 = v33;
  int v13 = objc_msgSend_computeStageSolver_inLabelTexture_inConfTex_inImageTex_outDepthTex_outConfTex_(v25, v34, (uint64_t)&brightnessCorrectionParams, (uint64_t)v26, (uint64_t)imerodeConfidenceMapTexture, (uint64_t)slicRgbaTexture, superPixelHoleFillDisparityTexture, superPixelHoleFillConfidenceTexture);
  if (v13)
  {
LABEL_12:
    int v38 = v13;
    fig_log_get_emitter();
    goto LABEL_13;
  }
  if (!self->_disparityQualityIsHigh) {
    return 0;
  }
  int v38 = objc_msgSend_disparityDataOverrideOnGpu_To_(self->_DepthProcUtilMetal, v35, (uint64_t)self->_disparityInputTexture, (uint64_t)self->_superPixelHoleFillDisparityTexture, v36, v37);
  if (v38)
  {
    fig_log_get_emitter();
LABEL_13:
    FigDebugAssert3();
  }
  return v38;
}

- (int)fastBilateralSolver_PrepareHashTable
{
  double v3 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  if (objc_msgSend_create_sigma_s_sigma_r_luma_sigma_r_chroma_(self->_bilateralGridProcessing, a2, (uint64_t)self->_yuvInputBuffer, self->_configuration.bilateralSolverSigmaSpace, self->_configuration.bilateralSolverSigmaLumaRange, self->_configuration.bilateralSolverSigmaChromaRange)&& objc_msgSend_create_sigma_s_sigma_r_luma_sigma_r_chroma_(self->_bilateralGridProcessing, v4, (uint64_t)self->_yuvInputBuffer, self->_configuration.bilateralSolverSigmaSpace, self->_configuration.bilateralSolverSigmaLumaRange, 255))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v5 = FigSignalErrorAt();
  }
  else
  {
    int v5 = 0;
  }
  if (*v3 == 1) {
    kdebug_trace();
  }
  return v5;
}

- (int)fastBilateralSolver
{
  uint64_t v4 = objc_msgSend_prepareForFbs_toF32_confidenceInF16_confidenceOutF32_(self->_DepthProcUtilMetal, a2, (uint64_t)self->_superPixelHoleFillDisparityTexture, (uint64_t)self->_bilateralInvZBufferInTexture, (uint64_t)self->_superPixelHoleFillConfidenceTexture, (uint64_t)self->_bilateralConfMapFloat32Texture);
  if (!v4
    || (*(float *)&double v5 = self->_configuration.bilateralSolverLambda,
        objc_msgSend_doSolveWithBilateralGridhash_reference_input_confidence_output_lambda_maxIterations_(self->_bilateralSolverGPUProcessing, v3, (uint64_t)self->_bilateralGridProcessing, (uint64_t)self->_yuvInputLumaTexture, (uint64_t)self->_bilateralInvZBufferInTexture, (uint64_t)self->_bilateralConfMapFloat32Texture, self->_bilateralInvZBufferOutTexture, self->_configuration.bilateralSolverPCGMaxIters, v5))|| objc_msgSend_postFbs_toF16_prepareBuffer_(self->_DepthProcUtilMetal, v6, (uint64_t)self->_bilateralInvZBufferOutTexture, (uint64_t)self->_bilateralDisparityTexture, (uint64_t)v4, v7))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v8 = FigSignalErrorAt();
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (int)sanityCheckParameters
{
  yuvInputBuffer = self->_yuvInputBuffer;
  if (yuvInputBuffer)
  {
    if (self->_disparityInputBuffer)
    {
      if (self->_disparityOutputBuffer)
      {
        if (self->_personSegmentationMaskInputBuffer)
        {
          if (sub_262E9A378(yuvInputBuffer, 875704422)
            && sub_262E9A378(self->_disparityInputBuffer, 1751411059)
            && sub_262E9A378(self->_disparityOutputBuffer, 1751411059)
            && CVPixelBufferGetPixelFormatType(self->_personSegmentationMaskInputBuffer) == 1278226536)
          {
            if (CVPixelBufferGetWidth(self->_personSegmentationMaskInputBuffer))
            {
              if (CVPixelBufferGetHeight(self->_personSegmentationMaskInputBuffer))
              {
                if (sub_262E9A324(self->_yuvInputBuffer, self->_width, self->_height)
                  && sub_262E9A324(self->_disparityInputBuffer, self->_width, self->_height)
                  && sub_262E9A324(self->_disparityOutputBuffer, self->_width, self->_height))
                {
                  instanceSegmentationInputBufferArray = self->_instanceSegmentationInputBufferArray;
                  if (instanceSegmentationInputBufferArray)
                  {
                    if ((unint64_t)objc_msgSend_count(instanceSegmentationInputBufferArray, v4, v5, v6, v7, v8) >= 4)
                    {
                      uint64_t v14 = 0;
                      while (1)
                      {
                        uint64_t v15 = objc_msgSend_objectAtIndexedSubscript_(self->_instanceSegmentationInputBufferArray, v10, v14, v11, v12, v13);

                        if (!v15) {
                          break;
                        }
                        if (++v14 == 4) {
                          return 0;
                        }
                      }
                    }
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

  return FigSignalErrorAt();
}

- (int)initF16CVPixelBuffer:(__CVBuffer *)a3 withValue:
{
  if (a3
    && ((__int16 v4 = v3, CVPixelBufferGetPixelFormatType(a3) == 1751411059)
     || CVPixelBufferGetPixelFormatType(a3) == 1751410032
     || CVPixelBufferGetPixelFormatType(a3) == 1278226536)
    && (uint64_t v7 = sub_262E9A23C(a3, 0)) != 0)
  {
    uint64_t v8 = v7;
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    unsigned int height = self->_height;
    if (!height) {
      goto LABEL_13;
    }
    int v11 = 0;
    uint64_t width = self->_width;
    do
    {
      uint64_t v13 = v8;
      if (width)
      {
        uint64_t v14 = 0;
        do
        {
          *(_WORD *)((char *)v8 + v14) = v4;
          v14 += 2;
        }
        while (2 * width != v14);
      }
      uint64_t v8 = (__CVBuffer *)((char *)v8 + 2 * (BytesPerRow >> 1));
      ++v11;
    }
    while (v11 != height);
    if (v13) {
LABEL_13:
    }
      CVPixelBufferUnlockBaseAddress(a3, 0);
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (id)createTextureOfSize:(CGSize)a3 withFormat:(unint64_t)a4
{
  uint64_t v5 = objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x263F12A50], a2, a4, (unint64_t)a3.width, (unint64_t)a3.height, 0);
  objc_msgSend_setUsage_(v5, v6, 3, v7, v8, v9);
  uint64_t v15 = objc_msgSend_device(self->_metalContext, v10, v11, v12, v13, v14);
  uint64_t v20 = objc_msgSend_newTextureWithDescriptor_(v15, v16, (uint64_t)v5, v17, v18, v19);

  return v20;
}

- (int)estimateDisparityQualityScore
{
  float disparityQualityThreshold = self->_configuration.disparityQualityThreshold;
  BOOL v3 = disparityQualityThreshold < 0.0 || disparityQualityThreshold > 1.0;
  if (!v3
    && (preprocessedDisparity = self->_preprocessedDisparity) != 0
    && CVPixelBufferGetPixelFormatType(preprocessedDisparity) == 1751411059
    && (uint64_t v6 = sub_262E9A23C(self->_preprocessedDisparity, 1uLL)) != 0)
  {
    uint64_t v7 = v6;
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(self->_preprocessedDisparity);
    uint64_t width = self->_width;
    unsigned int height = self->_height;
    float v11 = (float)(height * width);
    if (height)
    {
      int v12 = 0;
      unint64_t v13 = 0;
      do
      {
        uint64_t v14 = v7;
        if (width)
        {
          uint64_t v15 = 0;
          do
          {
            __asm { FCMP            H1, #0 }
            if (!(_NF ^ _VF | _ZF)) {
              ++v13;
            }
            v15 += 2;
          }
          while (2 * width != v15);
        }
        uint64_t v7 = (__CVBuffer *)((char *)v7 + 2 * (BytesPerRow >> 1));
        ++v12;
      }
      while (v12 != height);
      BOOL v21 = v14 == 0;
    }
    else
    {
      BOOL v21 = 0;
      unint64_t v13 = 0;
    }
    float v22 = (float)v13 / v11;
    self->_disparityQualityScore = v22;
    self->_disparityQualityIsHigh = v22 >= disparityQualityThreshold;
    self->_figDepthQuality = v22 >= 0.3;
    if (!v21) {
      CVPixelBufferUnlockBaseAddress(self->_preprocessedDisparity, 1uLL);
    }
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (NSArray)faceLandmarksArray
{
  return self->_faceLandmarksArray;
}

- (void)setFaceLandmarksArray:(id)a3
{
}

- (float)disparityQualityScore
{
  return self->_disparityQualityScore;
}

- (BOOL)disparityQualityIsHigh
{
  return self->_disparityQualityIsHigh;
}

- (int)figDepthQuality
{
  return self->_figDepthQuality;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceLandmarksArray, 0);
  objc_storeStrong((id *)&self->_DepthProcUtilMetal, 0);
  objc_storeStrong((id *)&self->_FFCFilters, 0);
  objc_storeStrong((id *)&self->_superPixelHoleFillConfidenceTexture, 0);
  objc_storeStrong((id *)&self->_superPixelHoleFillDisparityTexture, 0);
  objc_storeStrong((id *)&self->_superPixelHoleFillMetal, 0);
  objc_storeStrong((id *)&self->_slicIdxImgTexture, 0);
  objc_storeStrong((id *)&self->_slicSpixelColorTexture, 0);
  objc_storeStrong((id *)&self->_slicSpixelCentersIdAndNPixelsTexture, 0);
  objc_storeStrong((id *)&self->_slicRgbaTexture, 0);
  objc_storeStrong((id *)&self->_slicMetalParameters, 0);
  objc_storeStrong((id *)&self->_slicMetal, 0);
  objc_storeStrong((id *)&self->_bilateralDisparityTexture, 0);
  objc_storeStrong((id *)&self->_bilateralInvZBufferOutTexture, 0);
  objc_storeStrong((id *)&self->_bilateralConfMapFloat32Texture, 0);
  objc_storeStrong((id *)&self->_bilateralInvZBufferInTexture, 0);
  objc_storeStrong((id *)&self->_bilateralSolverGPUProcessing, 0);
  objc_storeStrong((id *)&self->_bilateralGridProcessing, 0);
  objc_storeStrong((id *)&self->_imerodeConfidenceMapTexture, 0);
  objc_storeStrong((id *)&self->_invalidConfidenceMaskTexture, 0);
  objc_storeStrong((id *)&self->_confidenceMapTexture, 0);
  objc_storeStrong((id *)&self->_distanceTransformMapTexture, 0);
  objc_storeStrong((id *)&self->_distanceTransformDisparityTexture, 0);
  objc_storeStrong((id *)&self->_distanceTransformProcessing, 0);
  objc_storeStrong((id *)&self->_validForegroundMaskTexture, 0);
  objc_storeStrong((id *)&self->_preprocessedDisparityTexture, 0);
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
  for (uint64_t i = 0; i != -4; --i)
    objc_storeStrong((id *)&self->_instanceSegmentationInputTexture[i + 3], 0);
  objc_storeStrong((id *)&self->_instanceSegmentationInputBufferArray, 0);
  objc_storeStrong((id *)&self->_personSegmentationMaskInputTexture, 0);
  objc_storeStrong((id *)&self->_disparityOutputTexture, 0);
  objc_storeStrong((id *)&self->_disparityInputTexture, 0);
  objc_storeStrong((id *)&self->_yuvInputChromaTexture, 0);
  objc_storeStrong((id *)&self->_yuvInputLumaTexture, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end