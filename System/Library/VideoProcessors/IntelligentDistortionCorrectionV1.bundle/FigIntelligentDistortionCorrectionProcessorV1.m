@interface FigIntelligentDistortionCorrectionProcessorV1
- ($2825F4736939C4A6D3AD43837233062D)finalImageDimensions;
- (BOOL)applyStereoRectificationHomography;
- (BOOL)applyZoom;
- (BOOL)deviceWasStationaryDuringCapture;
- (BOOL)generateMask;
- (BOOL)globalTransformIsValid;
- (BOOL)processGeometricDistortionCorrection;
- (BOOL)processIntelligentDistortionCorrection;
- (BOOL)replicatePixelsOutsideOfFinalImageDimensions;
- (BOOL)useBilinearInterpolation;
- (BOOL)usePrecomputedPolynomialsAndOpticalCenterOffset;
- (BOOL)withTemporalConsistency;
- (BOOL)zoomWasApplied;
- (CGPoint)opticalCenterOffset;
- (CGRect)inputImageCropRect;
- (CGRect)outputValidBufferRect;
- (FigIntelligentDistortionCorrectionProcessorV1)init;
- (MTLCommandQueue)metalCommandQueue;
- (NSArray)faceObservations;
- (NSData)gdcForwardPolynomial;
- (NSData)gdcInversePolynomial;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)inputImageMetadataDictionary;
- (NSDictionary)tuningParameters;
- (NSString)description;
- (__CVBuffer)inputImage;
- (__CVBuffer)lowResSegmentationMask;
- (__CVBuffer)outputImage;
- (__n128)globalTransform;
- (__n128)setStereoRectificationInverseHomography:(__n128)a3;
- (__n128)stereoRectificationInverseHomography;
- (float)convertPercentageParameter:(unsigned int)a3;
- (id)getParametersListName;
- (int)applyExistingCorrectionToSecondaryAsset:(__CVBuffer *)a3 inputCrop:(CGRect)a4 primaryImageDimensions:(id)a5 inputHorizontalSecondaryToPrimaryScaleFactor:(float)a6 inputVerticalSecondaryToPrimaryScaleFactor:(float)a7 inputHorizontalSecondaryToPrimaryShift:(float)a8 inputVerticalSecondaryToPrimaryShift:(float)a9 outputPixelBuffer:(__CVBuffer *)a10 outputHorizontalAdditionalScaleFactor:(float)a11 outputVerticalAdditionalScaleFactor:(float)a12;
- (int)applyExistingCorrectionToSecondaryAsset:(__CVBuffer *)a3 outputPixelBuffer:(__CVBuffer *)a4 primaryImageDimensions:(id)a5;
- (int)compilerShaders;
- (int)computeCorrectionType;
- (int)correctionType;
- (int)determineWorkingBufferRequirements:(id *)a3 maximumInputImageWidth:(unsigned int)a4 maximumInputImageHeight:(unsigned int)a5 maximumSegmentationMaskWidth:(unsigned int)a6 maximumSegmentationMaskHeight:(unsigned int)a7;
- (int)finishProcessing;
- (int)gdcSource;
- (int)getAdjustedGDCInformation:(id *)a3;
- (int)mapPixelFormat:(__CVBuffer *)a3 format:(unint64_t *)a4;
- (int)memoryAllocationHandler:(id *)a3 memoryAllocationParameters:(id)a4 sharedMetalBuffer:(id)a5 sharedMetalBufferOffset:(unint64_t)a6 sharedMetalBufferSize:(unint64_t)a7;
- (int)prepareInputImagePixelBuffer:(id *)a3;
- (int)prepareOutputImagePixelBuffer:(id *)a3;
- (int)prepareSegmentationMaskPixelBuffer:(id *)a3;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)process;
- (int)purgeResources;
- (int)resetState;
- (int)setSharedMetalBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5;
- (int)setup;
- (int)subProcessIntelligentDistortion:(id)a3 cpwProcessingErrors:(id *)a4;
- (int)translateError:(int)a3;
- (int)undistortSegmentationMask;
- (unsigned)makernoteEntry;
- (void)buildMakernoteEntry:(int)a3 cpwProcessingErrors:(id *)a4 idcApplied:(BOOL)a5;
- (void)dealloc;
- (void)isShaderHarvesting:(id)a3;
- (void)setApplyStereoRectificationHomography:(BOOL)a3;
- (void)setApplyZoom:(BOOL)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setDeviceWasStationaryDuringCapture:(BOOL)a3;
- (void)setFaceObservations:(id)a3;
- (void)setFinalImageDimensions:(id)a3;
- (void)setGdcForwardPolynomial:(id)a3;
- (void)setGdcInversePolynomial:(id)a3;
- (void)setGenerateMask:(BOOL)a3;
- (void)setInputImage:(__CVBuffer *)a3;
- (void)setInputImageCropRect:(CGRect)a3;
- (void)setInputImageMetadataDictionary:(id)a3;
- (void)setLowResSegmentationMask:(__CVBuffer *)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setOpticalCenterOffset:(CGPoint)a3;
- (void)setOutputImage:(__CVBuffer *)a3;
- (void)setProcessGeometricDistortionCorrection:(BOOL)a3;
- (void)setProcessIntelligentDistortionCorrection:(BOOL)a3;
- (void)setReplicatePixelsOutsideOfFinalImageDimensions:(BOOL)a3;
- (void)setTuningParameters:(id)a3;
- (void)setUseBilinearInterpolation:(BOOL)a3;
- (void)setUsePrecomputedPolynomialsAndOpticalCenterOffset:(BOOL)a3;
- (void)setWithTemporalConsistency:(BOOL)a3;
@end

@implementation FigIntelligentDistortionCorrectionProcessorV1

- (id)getParametersListName
{
  return @"IntelligentDistortionCorrectionV1";
}

- (FigIntelligentDistortionCorrectionProcessorV1)init
{
  v3.receiver = self;
  v3.super_class = (Class)FigIntelligentDistortionCorrectionProcessorV1;
  return [(FigIntelligentDistortionCorrectionProcessorV1 *)&v3 init];
}

- (int)setup
{
  self->_defaultWrites.disableStationaryDeviceDetection = FigGetCFPreferenceNumberWithDefault() != 0;
  self->_defaultWrites.disableGating = FigGetCFPreferenceNumberWithDefault() != 0;
  objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (!v3) {
    goto LABEL_17;
  }
  v4 = (FigMetalContext *)[objc_alloc(MEMORY[0x263F2EE30]) initWithbundle:v3 andOptionalCommandQueue:self->_metalCommandQueue];
  metalContext = self->_metalContext;
  self->_metalContext = v4;

  if (!self->_metalContext) {
    goto LABEL_17;
  }
  self->_areAllShadersCompiled = 0;
  v6 = [[IntelligentDistortionCorrection_Utilities alloc] initWithMetalContext:self->_metalContext];
  processor = self->_idcUtilities.processor;
  self->_idcUtilities.processor = v6;

  if (!self->_idcUtilities.processor) {
    goto LABEL_17;
  }
  v8 = [[EdgeDrawingLineDetector alloc] initWithFigMetalContext:self->_metalContext idcUtilities:self->_idcUtilities.processor];
  v9 = self->_edgeDrawingLineDetector.processor;
  self->_edgeDrawingLineDetector.processor = v8;

  if (!self->_edgeDrawingLineDetector.processor) {
    goto LABEL_17;
  }
  v10 = [[IdcContentPreservingWarping alloc] initWithMetalContext:self->_metalContext idcUtilities:self->_idcUtilities.processor];
  v11 = self->_contentPreservingWarping.processor;
  self->_contentPreservingWarping.processor = v10;

  if (!self->_contentPreservingWarping.processor) {
    goto LABEL_17;
  }
  v12 = [(FigMetalContext *)self->_metalContext device];
  v13 = (MTLBuffer *)[v12 newBufferWithLength:16 options:0];
  buffer = self->_contentPreservingWarping.executionErrorInformation.buffer;
  self->_contentPreservingWarping.executionErrorInformation.buffer = v13;

  if (!self->_contentPreservingWarping.executionErrorInformation.buffer) {
    goto LABEL_17;
  }
  *(_DWORD *)self->_transformCenterMeshDimensions = FigGetCFPreferenceNumberWithDefault();
  __int32 CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  uint32x2_t v16 = *(uint32x2_t *)self->_transformCenterMeshDimensions;
  v16.i32[1] = CFPreferenceNumberWithDefault;
  uint32x2_t v17 = vmax_u32(vmin_u32(v16, (uint32x2_t)0x90000000CLL), (uint32x2_t)0x200000002);
  *(uint32x2_t *)self->_transformCenterMeshDimensions = v17;
  if (v17.i8[0])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    __int32 v18 = *(_DWORD *)&self->_transformCenterMeshDimensions[4];
  }
  else
  {
    __int32 v18 = v17.i32[1];
  }
  if ((1 - v18))
  {
LABEL_17:
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return 0;
}

- (void)isShaderHarvesting:(id)a3
{
  self->_isShaderHarvesting = [a3 BOOLValue];
}

- (void)dealloc
{
  [(FigIntelligentDistortionCorrectionProcessorV1 *)self purgeResources];
  v3.receiver = self;
  v3.super_class = (Class)FigIntelligentDistortionCorrectionProcessorV1;
  [(FigIntelligentDistortionCorrectionProcessorV1 *)&v3 dealloc];
}

- (int)determineWorkingBufferRequirements:(id *)a3 maximumInputImageWidth:(unsigned int)a4 maximumInputImageHeight:(unsigned int)a5 maximumSegmentationMaskWidth:(unsigned int)a6 maximumSegmentationMaskHeight:(unsigned int)a7
{
  if (!a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    LODWORD(v18) = -2;
    goto LABEL_19;
  }
  uint64_t v9 = *(void *)&a7;
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = *(void *)&a4;
  a3->var0 = 0;
  *(void *)self->_anon_48 = __PAIR64__(a7, a6);
  bzero(self->_anon_c0, 0x350uLL);
  +[EdgeDrawingLineDetector getDefaultConfigurationParameters:self->_anon_c0];
  +[IdcContentPreservingWarping getDefaultConfigurationParameters:self->_anon_c0];
  int v14 = [(FigIntelligentDistortionCorrectionProcessorV1 *)self memoryAllocationHandler:a3 memoryAllocationParameters:v10 | (unint64_t)(v9 << 32) sharedMetalBuffer:0 sharedMetalBufferOffset:0 sharedMetalBufferSize:0];
  if (v14)
  {
    LODWORD(v18) = v14;
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_19;
  }
  self->_sharedMetalBuffer.subModuleOffset = (LODWORD(a3->var0) + 63) & 0xFFFFFFC0;
  unint64_t v23 = 0;
  uint64_t v15 = [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities.processor determineWorkingBufferRequirements:&v23];
  if (v15
    || (unint64_t v16 = v23,
        unint64_t v23 = 0,
        uint64_t v15 = [(EdgeDrawingLineDetector *)self->_edgeDrawingLineDetector.processor determineWorkingBufferRequirements:&v23 bundleConfiguration:self->_anon_c0 maximumInputImageWidth:v12 maximumInputImageHeight:v11 maximumSegmentationMaskWidth:v10 maximumSegmentationMaskHeight:v9], v15))
  {
    uint64_t v18 = v15;
    fig_log_get_emitter();
    uint64_t v22 = v7;
    LODWORD(v21) = v18;
    goto LABEL_18;
  }
  unint64_t v17 = v23;
  unint64_t v23 = 0;
  uint64_t v18 = [(IdcContentPreservingWarping *)self->_contentPreservingWarping.processor computeSizeOfSharedMetalBuffer:&v23 maximumSegmentationMaskWidth:v10 maximumSegmentationMaskHeight:v9];
  if (v18)
  {
    fig_log_get_emitter();
    uint64_t v22 = v7;
    LODWORD(v21) = v18;
LABEL_18:
    FigDebugAssert3();
    LODWORD(v18) = -[FigIntelligentDistortionCorrectionProcessorV1 translateError:](self, "translateError:", v18, v21, v22);
    if (!v18) {
      return v18;
    }
LABEL_19:
    *(void *)self->_anon_48 = 0;
    return v18;
  }
  if (v16 <= v17) {
    unint64_t v19 = v17;
  }
  else {
    unint64_t v19 = v16;
  }
  if (v19 <= v23) {
    unint64_t v19 = v23;
  }
  self->_sharedMetalBuffer.subModuleSize = v19;
  a3->var0 += v19;
  return v18;
}

- (int)setSharedMetalBuffer:(id)a3 offset:(unint64_t)a4 size:(unint64_t)a5
{
  id v10 = a3;
  if (v10)
  {
    objc_storeStrong((id *)&self->_sharedMetalBuffer.buffer, a3);
    self->_sharedMetalBuffer.offset = a4;
    self->_sharedMetalBuffer.size = a5;
    unint64_t v11 = self->_sharedMetalBuffer.subModuleOffset + a4;
    uint64_t v12 = [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities.processor setSharedMetalBuffer:v10 offset:v11 size:self->_sharedMetalBuffer.subModuleSize];
    if (v12
      || (uint64_t v12 = [(EdgeDrawingLineDetector *)self->_edgeDrawingLineDetector.processor setSharedMetalBuffer:v10 offset:v11 size:self->_sharedMetalBuffer.subModuleSize], v12)|| (uint64_t v12 = [(IdcContentPreservingWarping *)self->_contentPreservingWarping.processor setSharedMetalBuffer:v10 offset:v11 size:self->_sharedMetalBuffer.subModuleSize], v12))
    {
      uint64_t v15 = v12;
      fig_log_get_emitter();
      LODWORD(v16) = v15;
      FigDebugAssert3();
      int v13 = -[FigIntelligentDistortionCorrectionProcessorV1 translateError:](self, "translateError:", v15, v16, v5);
    }
    else
    {
      int v13 = 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v13 = -2;
  }

  return v13;
}

- (int)purgeResources
{
  uint64_t v3 = MEMORY[0x263EF89A0];
  long long v4 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  *(_OWORD *)&self[1].super.isa = *MEMORY[0x263EF89A0];
  *(_OWORD *)&self[1]._sharedMetalBuffer.buffer = v4;
  *(_OWORD *)&self[1]._sharedMetalBuffer.size = *(_OWORD *)(v3 + 32);
  self->_globalTransformIsValid = 0;
  buffer = self->_sharedMetalBuffer.buffer;
  self->_sharedMetalBuffer.buffer = 0;

  *(_OWORD *)&self->_sharedMetalBuffer.offset = 0u;
  *(_OWORD *)&self->_sharedMetalBuffer.subModuleOffset = 0u;
  processor = self->_idcUtilities.processor;
  *(void *)self->_anon_48 = 0;
  self->_idcUtilities.processor = 0;

  uint64_t v7 = self->_edgeDrawingLineDetector.results.buffer;
  self->_edgeDrawingLineDetector.results.buffer = 0;

  *(void *)&self->_edgeDrawingLineDetector.results.capacity = 0;
  self->_edgeDrawingLineDetector.results.offset = 0;
  v8 = self->_edgeDrawingLineDetector.processor;
  self->_edgeDrawingLineDetector.processor = 0;

  uint64_t v9 = self->_contentPreservingWarping.processor;
  self->_contentPreservingWarping.processor = 0;

  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  return 0;
}

- (int)prepareToProcess:(unsigned int)a3
{
  if (a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -2;
  }
  else
  {
    return MEMORY[0x270F9A6D0](self, sel_compilerShaders);
  }
}

- (int)process
{
  long long v4 = &self->_anon_c0[348];
  uint64_t v5 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
  *(void *)self->_contentPreservingWarping.executionErrorInformation.commandStatus = 0;
  *(void *)&self->_contentPreservingWarping.executionErrorInformation.commandStatus[2] = 0;
  memset(v49, 0, 24);
  *(_WORD *)&self->_rt.cpwDataValid = 0;
  processedSegmentationMaskTexture = self->_rt.processedSegmentationMaskTexture;
  self->_rt.processedSegmentationMaskTexture = 0;

  *(void *)&self->_rt.subProcessIntelligentDistortionErrorCode = 0;
  self->_globalTransformIsValid = 0;
  uint64_t v7 = MEMORY[0x263EF89A0];
  long long v8 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  *(_OWORD *)&self[1].super.isa = *MEMORY[0x263EF89A0];
  *(_OWORD *)&self[1]._sharedMetalBuffer.buffer = v8;
  *(_OWORD *)&self[1]._sharedMetalBuffer.size = *(_OWORD *)(v7 + 32);
  CGSize v9 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
  self->_outputValidBufferRect.origin = (CGPoint)*MEMORY[0x263F001A0];
  self->_outputValidBufferRect.size = v9;
  BOOL applyZoom = self->_applyZoom;
  self->_zoomWasApplied = applyZoom;
  *((void *)v4 + 73) = 0;
  self->_minDistanceToEdge = 3.4028e38;
  if (self->_sharedMetalBuffer.buffer)
  {
    if (self->_inputImage && self->_outputImage && applyZoom)
    {
      bzero(self->_anon_c0, 0x350uLL);
      +[EdgeDrawingLineDetector getDefaultConfigurationParameters:self->_anon_c0];
      +[IdcContentPreservingWarping getDefaultConfigurationParameters:self->_anon_c0];
      *($470D365275581EF16070F5A11344F73E *)self->_anon_c0 = self->_finalImageDimensions;
      self->_anon_c0[8] = self->_replicatePixelsOutsideOfFinalImageDimensions;
      *(_WORD *)&self->_anon_c0[160] = *(_WORD *)&self->_applyStereoRectificationHomography;
      long long v11 = *(_OWORD *)&self->_anon_520[16];
      *(_OWORD *)&self->_anon_c0[112] = *(_OWORD *)self->_anon_520;
      *(_OWORD *)&self->_anon_c0[128] = v11;
      *(_OWORD *)&self->_anon_c0[144] = *(_OWORD *)&self->_anon_520[32];
      if (!self->_usePrecomputedPolynomialsAndOpticalCenterOffset) {
        goto LABEL_12;
      }
      gdcForwardPolynomial = self->_gdcForwardPolynomial;
      if (gdcForwardPolynomial)
      {
        if (self->_gdcInversePolynomial)
        {
          int v13 = [(NSData *)gdcForwardPolynomial bytes];
          if (v13)
          {
            *(_DWORD *)&self->_anon_c0[40] = *v13;
            *(_DWORD *)&self->_anon_c0[44] = v13[1];
            *(_DWORD *)&self->_anon_c0[48] = v13[2];
            *(_DWORD *)&self->_anon_c0[52] = v13[3];
            *(_DWORD *)&self->_anon_c0[56] = v13[4];
            *(_DWORD *)&self->_anon_c0[60] = v13[5];
            *(_DWORD *)&self->_anon_c0[64] = v13[6];
            *(_DWORD *)&self->_anon_c0[68] = v13[7];
            int v14 = [(NSData *)self->_gdcInversePolynomial bytes];
            *(_DWORD *)&self->_anon_c0[72] = *v14;
            *(_DWORD *)&self->_anon_c0[76] = v14[1];
            *(_DWORD *)&self->_anon_c0[80] = v14[2];
            *(_DWORD *)&self->_anon_c0[84] = v14[3];
            *(_DWORD *)&self->_anon_c0[88] = v14[4];
            *(_DWORD *)&self->_anon_c0[92] = v14[5];
            *(_DWORD *)&self->_anon_c0[96] = v14[6];
            *(_DWORD *)&self->_anon_c0[100] = v14[7];
            *(float32x2_t *)&self->_anon_c0[24] = vcvt_f32_f64(*(float64x2_t *)(v4 + 684));
            self->_anon_c0[162] = 1;
LABEL_12:
            uint64_t v15 = [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities.processor extractBundleConfigurationParameters:self->_anon_c0 cameraInfo:self->_cameraInfoByPortType tuningParameters:self->_tuningParameters imageInfo:self->_inputImageMetadataDictionary];
            if (v15) {
              goto LABEL_53;
            }
            self->_rt.bundleConfigurationParametersValid = 1;
            if (!self->_processGeometricDistortionCorrection) {
              self->_anon_c0[104] = 0;
            }
            uint64_t v16 = [(NSDictionary *)self->_inputImageMetadataDictionary objectForKeyedSubscript:*MEMORY[0x263F2C608]];
            int v17 = [v16 intValue];

            if (v17)
            {
              if (self->_anon_c0[104])
              {
                fig_log_get_emitter();
                uint64_t v42 = v2;
                LODWORD(v41) = 0;
                FigDebugAssert3();
                uint64_t v37 = 0;
                goto LABEL_54;
              }
              if (v17 == 3)
              {
                int v18 = 3;
              }
              else
              {
                if (v17 != 1) {
                  goto LABEL_24;
                }
                int v18 = 1;
              }
            }
            else
            {
              if (!self->_anon_c0[104])
              {
                self->_gdcSource = 0;
LABEL_24:
                uint64_t v15 = [(FigIntelligentDistortionCorrectionProcessorV1 *)self prepareInputImagePixelBuffer:&self->_anon_c0[212]];
                if (!v15)
                {
                  if (!self->_lowResSegmentationMask
                    || (uint64_t v15 = [(FigIntelligentDistortionCorrectionProcessorV1 *)self prepareSegmentationMaskPixelBuffer:&self->_anon_c0[332]], !v15))
                  {
                    uint64_t v15 = [(FigIntelligentDistortionCorrectionProcessorV1 *)self prepareOutputImagePixelBuffer:&self->_anon_c0[308]];
                    if (!v15)
                    {
                      unint64_t v19 = [IDC_RegionOfInterestTracker alloc];
                      buffer = self->_sharedMetalBuffer.buffer;
                      unint64_t roiDataOffset = self->_sharedMetalBuffer.roiDataOffset;
                      long long v43 = *(_OWORD *)&self->_anon_c0[284];
                      *(void *)&long long v44 = *(void *)&self->_anon_c0[300];
                      uint64_t v22 = [(IDC_RegionOfInterestTracker *)v19 init:buffer metalBufferOffset:roiDataOffset initialIdcRoi:&v43];
                      if (!v22)
                      {
                        fig_log_get_emitter();
                        uint64_t v42 = v2;
                        LODWORD(v41) = 0;
                        FigDebugAssert3();
                        uint64_t v29 = 0;
                        uint64_t v37 = 0xFFFFFFFFLL;
LABEL_39:
                        uint64_t v5 = (_DWORD *)MEMORY[0x263F00E10];
                        goto LABEL_40;
                      }
                      unint64_t v23 = (void *)v22;
                      uint64_t v24 = [(FigIntelligentDistortionCorrectionProcessorV1 *)self memoryAllocationHandler:0 memoryAllocationParameters:*(void *)v4 sharedMetalBuffer:self->_sharedMetalBuffer.buffer sharedMetalBufferOffset:self->_sharedMetalBuffer.offset sharedMetalBufferSize:self->_sharedMetalBuffer.size];
                      if (!v24)
                      {
                        int v25 = [(FigIntelligentDistortionCorrectionProcessorV1 *)self computeCorrectionType];
                        self->_correctionType = v25;
                        if (v25)
                        {
                          int v26 = [(FigIntelligentDistortionCorrectionProcessorV1 *)self subProcessIntelligentDistortion:v23 cpwProcessingErrors:v49];
                          processor = self->_idcUtilities.processor;
                          inputImageTexture = self->_rt.inputImageTexture;
                          if (v26)
                          {
                            uint64_t v29 = 0;
                            invertedMesh = 0;
                          }
                          else
                          {
                            invertedMesh = self->_textures.invertedMesh;
                            uint64_t v29 = 1;
                          }
                        }
                        else
                        {
                          uint64_t v29 = 0;
                          invertedMesh = 0;
                          processor = self->_idcUtilities.processor;
                          inputImageTexture = self->_rt.inputImageTexture;
                        }
                        uint64_t v31 = [(IntelligentDistortionCorrection_Utilities *)processor warpAndOrUndistortPrimaryAsset:self->_anon_c0 inputImageTexture:inputImageTexture inputMeshTexture:invertedMesh outputImageTexture:self->_rt.outputImageTexture roiTracker:v23 inputImageMetadataDictionary:self->_inputImageMetadataDictionary];
                        if (v31)
                        {
                          uint64_t v39 = v31;
                          fig_log_get_emitter();
                          LODWORD(v41) = v39;
                          FigDebugAssert3();
                          uint64_t v37 = -[FigIntelligentDistortionCorrectionProcessorV1 translateError:](self, "translateError:", v39, v41, v2);
                        }
                        else
                        {
                          self->_outputValidBufferRect.origin.x = 0.0;
                          self->_outputValidBufferRect.origin.y = 0.0;
                          $470D365275581EF16070F5A11344F73E finalImageDimensions = self->_finalImageDimensions;
                          v33.i64[0] = finalImageDimensions.width;
                          v33.i64[1] = finalImageDimensions.height;
                          *(float64x2_t *)(v4 + 748) = vcvtq_f64_s64(v33);
                          if (v29)
                          {
                            [v23 idcRoi];
                            long long v34 = *(_OWORD *)&self->_anon_c0[260];
                            long long v45 = *(_OWORD *)&self->_anon_c0[244];
                            long long v46 = v34;
                            long long v35 = *(_OWORD *)&self->_anon_c0[292];
                            long long v47 = *(_OWORD *)&self->_anon_c0[276];
                            long long v48 = v35;
                            long long v36 = *(_OWORD *)&self->_anon_c0[228];
                            long long v43 = *(_OWORD *)&self->_anon_c0[212];
                            long long v44 = v36;
                            self->_globalTransformIsValid = idcComputeGlobalTransform() == 0;

                            uint64_t v37 = 0;
                            uint64_t v29 = 1;
                          }
                          else
                          {
                            self->_globalTransformIsValid = 1;

                            uint64_t v37 = 0;
                          }
                        }
                        goto LABEL_39;
                      }
                      uint64_t v37 = v24;
                      fig_log_get_emitter();
                      uint64_t v42 = v2;
                      LODWORD(v41) = 0;
                      FigDebugAssert3();

LABEL_54:
                      uint64_t v29 = 0;
                      goto LABEL_39;
                    }
                  }
                }
LABEL_53:
                uint64_t v40 = v15;
                fig_log_get_emitter();
                LODWORD(v41) = v40;
                FigDebugAssert3();
                uint64_t v37 = -[FigIntelligentDistortionCorrectionProcessorV1 translateError:](self, "translateError:", v40, v41, v2);
                goto LABEL_54;
              }
              int v18 = 2;
            }
            self->_gdcSource = v18;
            goto LABEL_24;
          }
        }
      }
    }
    fig_log_get_emitter();
    uint64_t v42 = v2;
    LODWORD(v41) = 0;
    FigDebugAssert3();
    uint64_t v29 = 0;
    uint64_t v37 = 4294967294;
  }
  else
  {
    fig_log_get_emitter();
    uint64_t v42 = v2;
    LODWORD(v41) = 0;
    FigDebugAssert3();
    uint64_t v29 = 0;
    uint64_t v37 = 4294967292;
  }
LABEL_40:
  -[FigIntelligentDistortionCorrectionProcessorV1 buildMakernoteEntry:cpwProcessingErrors:idcApplied:](self, "buildMakernoteEntry:cpwProcessingErrors:idcApplied:", v37, v49, v29, v41, v42);
  if (*v5 == 1) {
    kdebug_trace();
  }
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  return v37;
}

- (int)applyExistingCorrectionToSecondaryAsset:(__CVBuffer *)a3 outputPixelBuffer:(__CVBuffer *)a4 primaryImageDimensions:(id)a5
{
  LODWORD(v5) = 1.0;
  LODWORD(v6) = 1.0;
  return -[FigIntelligentDistortionCorrectionProcessorV1 applyExistingCorrectionToSecondaryAsset:inputCrop:primaryImageDimensions:inputHorizontalSecondaryToPrimaryScaleFactor:inputVerticalSecondaryToPrimaryScaleFactor:inputHorizontalSecondaryToPrimaryShift:inputVerticalSecondaryToPrimaryShift:outputPixelBuffer:outputHorizontalAdditionalScaleFactor:outputVerticalAdditionalScaleFactor:](self, "applyExistingCorrectionToSecondaryAsset:inputCrop:primaryImageDimensions:inputHorizontalSecondaryToPrimaryScaleFactor:inputVerticalSecondaryToPrimaryScaleFactor:inputHorizontalSecondaryToPrimaryShift:inputVerticalSecondaryToPrimaryShift:outputPixelBuffer:outputHorizontalAdditionalScaleFactor:outputVerticalAdditionalScaleFactor:", a3, a5, a4, *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24), v5, v6, 0.0, 0.0, 0x3F8000003F800000);
}

- (int)applyExistingCorrectionToSecondaryAsset:(__CVBuffer *)a3 inputCrop:(CGRect)a4 primaryImageDimensions:(id)a5 inputHorizontalSecondaryToPrimaryScaleFactor:(float)a6 inputVerticalSecondaryToPrimaryScaleFactor:(float)a7 inputHorizontalSecondaryToPrimaryShift:(float)a8 inputVerticalSecondaryToPrimaryShift:(float)a9 outputPixelBuffer:(__CVBuffer *)a10 outputHorizontalAdditionalScaleFactor:(float)a11 outputVerticalAdditionalScaleFactor:(float)a12
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  memcpy(__dst, self->_anon_c0, 0x350uLL);
  if (!self->_sharedMetalBuffer.buffer || !self->_rt.bundleConfigurationParametersValid)
  {
    fig_log_get_emitter();
    uint64_t v59 = v12;
    LODWORD(v57) = 0;
    FigDebugAssert3();
    uint64_t v39 = 0;
    int64x2_t v33 = 0;
    v32 = 0;
    LODWORD(v55) = -4;
    goto LABEL_47;
  }
  if (!a3 || !a10) {
    goto LABEL_46;
  }
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  OSType v24 = CVPixelBufferGetPixelFormatType(a10);
  if (PixelFormatType > 1278226535)
  {
    if (PixelFormatType == 1278226536 || PixelFormatType == 1751411059) {
      goto LABEL_13;
    }
    int v25 = 1751527984;
  }
  else
  {
    if (PixelFormatType == 825306677 || PixelFormatType == 825437747) {
      goto LABEL_13;
    }
    int v25 = 1278226488;
  }
  if (PixelFormatType != v25)
  {
LABEL_46:
    fig_log_get_emitter();
    uint64_t v59 = v12;
    LODWORD(v57) = 0;
    FigDebugAssert3();
    uint64_t v39 = 0;
    int64x2_t v33 = 0;
    v32 = 0;
    LODWORD(v55) = -2;
    goto LABEL_47;
  }
LABEL_13:
  if (v24 != PixelFormatType) {
    goto LABEL_46;
  }
  char v26 = 0;
  uint64_t v27 = 0;
  $2825F4736939C4A6D3AD43837233062D v60 = a5;
  if (PixelFormatType > 1278226535)
  {
    if (PixelFormatType == 1278226536 || PixelFormatType == 1751411059 || PixelFormatType == 1751527984)
    {
      char v26 = 0;
      uint64_t v27 = 25;
    }
  }
  else if (PixelFormatType == 825306677 || PixelFormatType == 825437747)
  {
    char v26 = 1;
    uint64_t v27 = 20;
  }
  else if (PixelFormatType == 1278226488)
  {
    char v26 = 0;
    uint64_t v27 = 10;
  }
  size_t v28 = CVPixelBufferGetWidth(a3);
  if (!v28) {
    goto LABEL_46;
  }
  unint64_t v29 = v28;
  size_t v30 = CVPixelBufferGetHeight(a3);
  if (!v30) {
    goto LABEL_46;
  }
  unint64_t v31 = v30;
  v32 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a3 pixelFormat:v27 usage:17 plane:0];
  if (!v32)
  {
    fig_log_get_emitter();
    uint64_t v59 = v12;
    LODWORD(v57) = 0;
    FigDebugAssert3();
    uint64_t v39 = 0;
    int64x2_t v33 = 0;
LABEL_58:
    LODWORD(v55) = -1;
    goto LABEL_47;
  }
  int64x2_t v33 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a10 pixelFormat:v27 usage:23 plane:0];
  if (!v33)
  {
    fig_log_get_emitter();
    uint64_t v59 = v12;
    LODWORD(v57) = 0;
    FigDebugAssert3();
    uint64_t v39 = 0;
    goto LABEL_58;
  }
  v68.origin.double x = x;
  v68.origin.double y = y;
  v68.size.double width = width;
  v68.size.double height = height;
  if (CGRectIsNull(v68))
  {
    double v35 = *MEMORY[0x263F001A0];
    double v34 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v37 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v36 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  else
  {
    double v35 = x / (double)v29;
    double v34 = y / (double)v31;
    double v37 = width / (double)v29;
    double v36 = height / (double)v31;
  }
  v38 = [(FigMetalContext *)self->_metalContext commandQueue];
  uint64_t v39 = [v38 commandBuffer];

  long long v65 = *(_OWORD *)&self->_anon_c0[284];
  uint64_t v66 = *(void *)&self->_anon_c0[300];
  processor = self->_idcUtilities.processor;
  if (self->_rt.cpwDataValid) {
    invertedMesh = self->_textures.invertedMesh;
  }
  else {
    invertedMesh = 0;
  }
  long long v63 = *(_OWORD *)&self->_anon_c0[284];
  uint64_t v64 = *(void *)&self->_anon_c0[300];
  LOBYTE(v58) = v26;
  *(float *)&double v40 = a6;
  *(float *)&double v41 = a7;
  *(float *)&double v42 = a8;
  *(float *)&double v43 = a9;
  uint64_t v46 = -[IntelligentDistortionCorrection_Utilities warpAndOrUndistortSecondaryAsset:inputImageTexture:inputMeshTexture:normalizedInputCrop:primaryImageDimensions:inputHorizontalSecondaryToPrimaryScaleFactor:inputVerticalSecondaryToPrimaryScaleFactor:inputHorizontalSecondaryToPrimaryShift:inputVerticalSecondaryToPrimaryShift:outputImageTexture:outputHorizontalAdditionalScaleFactor:outputVerticalAdditionalScaleFactor:roiTracker:isDepthData:commandBuffer:sensorInputCropRect:](processor, "warpAndOrUndistortSecondaryAsset:inputImageTexture:inputMeshTexture:normalizedInputCrop:primaryImageDimensions:inputHorizontalSecondaryToPrimaryScaleFactor:inputVerticalSecondaryToPrimaryScaleFactor:inputHorizontalSecondaryToPrimaryShift:inputVerticalSecondaryToPrimaryShift:outputImageTexture:outputHorizontalAdditionalScaleFactor:outputVerticalAdditionalScaleFactor:roiTracker:isDepthData:commandBuffer:sensorInputCropRect:", __dst, v32, invertedMesh, v60, v33, 0, v35, v34, v37, v36, v40, v41, v42, v43,
          __PAIR64__(LODWORD(a12), LODWORD(a11)),
          v58,
          v39,
          &v63);
  if (v46)
  {
    uint64_t v55 = v46;
    fig_log_get_emitter();
    LODWORD(v57) = v55;
    FigDebugAssert3();
    LODWORD(v55) = -[FigIntelligentDistortionCorrectionProcessorV1 translateError:](self, "translateError:", v55, v57, v12);
    goto LABEL_47;
  }
  if (PixelFormatType != 1751527984)
  {
    LODWORD(v55) = 0;
    goto LABEL_47;
  }
  uint64_t v47 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a3 pixelFormat:65 usage:17 plane:1];

  if (!v47)
  {
    fig_log_get_emitter();
    uint64_t v59 = v12;
    LODWORD(v57) = 0;
    FigDebugAssert3();
    v32 = 0;
    goto LABEL_58;
  }
  uint64_t v48 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a10 pixelFormat:65 usage:23 plane:1];

  if (v48)
  {
    v53 = self->_idcUtilities.processor;
    if (self->_rt.cpwDataValid) {
      v54 = self->_textures.invertedMesh;
    }
    else {
      v54 = 0;
    }
    long long v63 = v65;
    uint64_t v64 = v66;
    LOBYTE(v59) = v26;
    *(float *)&double v49 = a6;
    *(float *)&double v50 = a7;
    *(float *)&double v51 = a8;
    *(float *)&double v52 = a9;
    uint64_t v55 = -[IntelligentDistortionCorrection_Utilities warpAndOrUndistortSecondaryAsset:inputImageTexture:inputMeshTexture:normalizedInputCrop:primaryImageDimensions:inputHorizontalSecondaryToPrimaryScaleFactor:inputVerticalSecondaryToPrimaryScaleFactor:inputHorizontalSecondaryToPrimaryShift:inputVerticalSecondaryToPrimaryShift:outputImageTexture:outputHorizontalAdditionalScaleFactor:outputVerticalAdditionalScaleFactor:roiTracker:isDepthData:commandBuffer:sensorInputCropRect:](v53, "warpAndOrUndistortSecondaryAsset:inputImageTexture:inputMeshTexture:normalizedInputCrop:primaryImageDimensions:inputHorizontalSecondaryToPrimaryScaleFactor:inputVerticalSecondaryToPrimaryScaleFactor:inputHorizontalSecondaryToPrimaryShift:inputVerticalSecondaryToPrimaryShift:outputImageTexture:outputHorizontalAdditionalScaleFactor:outputVerticalAdditionalScaleFactor:roiTracker:isDepthData:commandBuffer:sensorInputCropRect:", __dst, v47, v54, v60, v48, 0, v35, v34, v37, v36, v49, v50, v51, v52,
            __PAIR64__(LODWORD(a12), LODWORD(a11)),
            v59,
            v39,
            &v63);
    if (v55)
    {
      fig_log_get_emitter();
      LODWORD(v57) = v55;
      FigDebugAssert3();
      LODWORD(v55) = -[FigIntelligentDistortionCorrectionProcessorV1 translateError:](self, "translateError:", v55, v57, v12);
    }
    int64x2_t v33 = (void *)v48;
  }
  else
  {
    fig_log_get_emitter();
    uint64_t v59 = v12;
    LODWORD(v57) = 0;
    FigDebugAssert3();
    int64x2_t v33 = 0;
    LODWORD(v55) = -1;
  }
  v32 = (void *)v47;
LABEL_47:
  objc_msgSend(v39, "commit", v57, v59);
  [v39 waitUntilCompleted];

  return v55;
}

- (int)finishProcessing
{
  return 0;
}

- (int)prewarm
{
  return MEMORY[0x270F9A6D0](self, sel_compilerShaders);
}

- (int)resetState
{
  return 0;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  long long v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  double v6 = [v3 stringWithFormat:@"<%@ %p>", v5, self];

  return (NSString *)v6;
}

- (int)subProcessIntelligentDistortion:(id)a3 cpwProcessingErrors:(id *)a4
{
  id v7 = a3;
  processedSegmentationMaskTexture = self->_rt.processedSegmentationMaskTexture;
  if (!processedSegmentationMaskTexture)
  {
    int v9 = [(FigIntelligentDistortionCorrectionProcessorV1 *)self undistortSegmentationMask];
    if (v9)
    {
      int v21 = v9;
      self->_rt.subProcessIntelligentDistortionErrorCode = 256;
      fig_log_get_emitter();
      uint64_t v34 = v4;
      LODWORD(v33) = v21;
      goto LABEL_18;
    }
    processedSegmentationMaskTexture = self->_rt.processedSegmentationMaskTexture;
  }
  int v10 = [(EdgeDrawingLineDetector *)self->_edgeDrawingLineDetector.processor detectLinesPart1:self->_anon_c0 inputImageTexture:self->_rt.inputImageTexture inputSegmentationMaskTexture:processedSegmentationMaskTexture];
  if (v10)
  {
    int v21 = v10;
    self->_rt.subProcessIntelligentDistortionErrorCode = 512;
    fig_log_get_emitter();
    uint64_t v34 = v4;
    LODWORD(v33) = v21;
LABEL_18:
    FigDebugAssert3();
    [(FigMetalContext *)self->_metalContext waitForIdle];
    goto LABEL_19;
  }
  long long v11 = (char *)self + 12 * self->_correctionType;
  int v12 = *((_DWORD *)v11 + 227);
  float v13 = *((float *)v11 + 228);
  v37[0] = *(_OWORD *)&self->_anon_c0[28 * v12 + 428];
  *(_OWORD *)((char *)v37 + 12) = *(_OWORD *)&self->_anon_c0[28 * v12 + 440];
  int v14 = [(NSDictionary *)self->_inputImageMetadataDictionary objectForKeyedSubscript:@"PortType"];
  int v15 = [v14 isEqualToString:*MEMORY[0x263F2C270]];

  if (v15)
  {
    float v16 = fmaxf(fminf(*(float *)&self->_anon_c0[832], self->_minDistanceToEdge), 0.0) - *(float *)&self->_anon_c0[832];
    float v13 = roundf(fminf(v13* expf(-(float)((float)(v16 / *(float *)&self->_anon_c0[836]) * (float)(v16 / *(float *)&self->_anon_c0[836]))), v13 / 3.0));
  }
  float v17 = *(float *)&self->_anon_c0[16];
  long long v35 = *(_OWORD *)&self->_anon_c0[236];
  uint64_t v36 = *(void *)&self->_anon_c0[252];
  int v18 = idcComputeInverseDistortionPolynomial((uint64_t)v37, (uint64_t)&v35, (uint64_t)&self->_anon_c0[188], v13, v17);
  if (v18)
  {
    int v21 = v18;
    self->_rt.subProcessIntelligentDistortionErrorCode = 768;
    fig_log_get_emitter();
    uint64_t v34 = v4;
    LODWORD(v33) = v21;
    goto LABEL_18;
  }
  [(FigMetalContext *)self->_metalContext waitForIdle];
  int v19 = [(EdgeDrawingLineDetector *)self->_edgeDrawingLineDetector.processor detectLinesPart2:self->_anon_c0 results:&self->_edgeDrawingLineDetector.results];
  if (v19)
  {
    int v21 = v19;
    self->_rt.subProcessIntelligentDistortionErrorCode = 1024;
    fig_log_get_emitter();
    uint64_t v34 = v4;
    LODWORD(v33) = v21;
    goto LABEL_18;
  }
  self->_anon_c0[420] = 1;
  int v20 = [(IdcContentPreservingWarping *)self->_contentPreservingWarping.processor process:self->_anon_c0 segmentationMaskTex:self->_rt.processedSegmentationMaskTexture extendedMeshTex:self->_textures.extendedMesh invertedMeshTex:self->_textures.invertedMesh detectedLines:&self->_edgeDrawingLineDetector.results executionErrorInformation:&self->_contentPreservingWarping.executionErrorInformation];
  if (v20)
  {
    int v21 = v20;
    self->_rt.subProcessIntelligentDistortionErrorCode = 1280;
    fig_log_get_emitter();
    uint64_t v34 = v4;
    LODWORD(v33) = v21;
    goto LABEL_18;
  }
  int v21 = [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities.processor computeMeshROI:self->_anon_c0 invertedMeshTexture:self->_textures.invertedMesh roiTracker:v7];
  if (v21)
  {
    self->_rt.subProcessIntelligentDistortionErrorCode = 1536;
    fig_log_get_emitter();
    uint64_t v34 = v4;
    LODWORD(v33) = v21;
    goto LABEL_18;
  }
  [(FigMetalContext *)self->_metalContext waitForIdle];
  self->_rt.cpwDataValid = 1;
  [v7 synchronizeData];
LABEL_19:
  for (uint64_t i = 0; i != 4; ++i)
  {
    if (self->_contentPreservingWarping.executionErrorInformation.commandStatus[i] != 4)
    {
      ++a4->var5;
      int v21 = -12782;
    }
  }
  unint64_t v23 = (int *)[(MTLBuffer *)self->_contentPreservingWarping.executionErrorInformation.buffer contents];
  int v24 = -12782;
  if (v23)
  {
    int v25 = *v23;
    a4->var0 = *v23;
    BOOL v31 = v25 == 0;
    unsigned int v26 = v23[1];
    a4->var3 = (unsigned __int16)v26;
    a4->var1 = HIWORD(v26);
    BOOL v27 = !v31 || v26 >= 0x10000;
    int v28 = v23[3];
    a4->var4 = v28;
    int v29 = v23[2];
    a4->var2 = v29;
    int v30 = v29 | v28;
    BOOL v31 = !v27 && v30 == 0;
    if (v31) {
      int v24 = v21;
    }
    else {
      int v24 = -12782;
    }
  }

  return v24;
}

- (int)undistortSegmentationMask
{
  p_processedSegmentationMaskTexture = &self->_rt.processedSegmentationMaskTexture;
  objc_storeStrong((id *)&self->_rt.processedSegmentationMaskTexture, self->_rt.inputSegmentationMaskTexture);
  if (self->_anon_c0[104])
  {
    if ([(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities.processor undistortSingleChannelTexture:self->_anon_c0 inputTexture:self->_rt.inputSegmentationMaskTexture outputTexture:self->_textures.undistortedSegmentationMask])
    {
      return -12782;
    }
    objc_storeStrong((id *)p_processedSegmentationMaskTexture, self->_textures.undistortedSegmentationMask);
  }
  return 0;
}

- (int)memoryAllocationHandler:(id *)a3 memoryAllocationParameters:(id)a4 sharedMetalBuffer:(id)a5 sharedMetalBufferOffset:(unint64_t)a6 sharedMetalBufferSize:(unint64_t)a7
{
  unsigned int var0 = a4.var0;
  uint64_t var1 = a4.var1;
  id v14 = a5;
  int v15 = v14;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  if (a3) {
    BOOL v16 = v14 == 0;
  }
  else {
    BOOL v16 = 0;
  }
  int v17 = !v16;
  if (v16)
  {
    uint64_t v21 = 0;
    if (!var1) {
      goto LABEL_19;
    }
    uint64_t v19 = var0;
    if (!var0) {
      goto LABEL_19;
    }
  }
  else
  {
    int v18 = -3;
    if (a3 || !v14) {
      goto LABEL_39;
    }
    if (!var1 || (uint64_t v19 = var0) == 0)
    {
      undistortedSegmentationMask = self->_textures.undistortedSegmentationMask;
      self->_textures.undistortedSegmentationMask = 0;

      uint64_t v21 = 0;
      goto LABEL_19;
    }
  }
  *(void *)&long long v35 = v19;
  *((void *)&v35 + 1) = var1;
  long long v36 = xmmword_262F34760;
  [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities.processor computeTextureStrideForBufferAllocation:&v35];
  if (v17)
  {
    if (*((void *)&v37 + 1) > a7) {
      goto LABEL_44;
    }
    uint64_t v22 = [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities.processor textureFromBuffer:v15 bufferOffset:a6 textureDescriptor:&v35];
    unint64_t v23 = self->_textures.undistortedSegmentationMask;
    self->_textures.undistortedSegmentationMask = v22;

    if (!self->_textures.undistortedSegmentationMask)
    {
LABEL_45:
      fig_log_get_emitter();
      FigDebugAssert3();
      int v18 = -1;
      goto LABEL_39;
    }
  }
  uint64_t v21 = *((void *)&v37 + 1);
LABEL_19:
  long long v35 = xmmword_262F34810;
  long long v36 = xmmword_262F34820;
  [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities.processor computeTextureStrideForBufferAllocation:&v35];
  if (v17)
  {
    if (*((void *)&v37 + 1) + v21 > a7) {
      goto LABEL_44;
    }
    int v24 = [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities.processor textureFromBuffer:v15 bufferOffset:v21 + a6 textureDescriptor:&v35];
    extendedMesh = self->_textures.extendedMesh;
    self->_textures.extendedMesh = v24;

    if (!self->_textures.extendedMesh) {
      goto LABEL_45;
    }
  }
  uint64_t v26 = *((void *)&v37 + 1) + v21;
  long long v35 = xmmword_262F34830;
  long long v36 = xmmword_262F34820;
  [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities.processor computeTextureStrideForBufferAllocation:&v35];
  if (!v17) {
    goto LABEL_25;
  }
  if (*((void *)&v37 + 1) + v26 > a7)
  {
LABEL_44:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v18 = -2;
    goto LABEL_39;
  }
  BOOL v27 = [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities.processor textureFromBuffer:v15 bufferOffset:v26 + a6 textureDescriptor:&v35];
  invertedMesh = self->_textures.invertedMesh;
  self->_textures.invertedMesh = v27;

  if (!self->_textures.invertedMesh) {
    goto LABEL_45;
  }
LABEL_25:
  uint64_t v29 = (v26 + DWORD2(v37) + 63) & 0xFFFFFFC0;
  self->_edgeDrawingLineDetector.results.capacitdouble y = 2048;
  objc_storeStrong((id *)&self->_edgeDrawingLineDetector.results.buffer, a5);
  self->_edgeDrawingLineDetector.results.offset = v29 + a6;
  if (v29 + 32772 > a7) {
    int v30 = v17;
  }
  else {
    int v30 = 0;
  }
  if (v30 == 1) {
    goto LABEL_44;
  }
  uint64_t v31 = (v29 + 32835) & 0xFFFFFFC0;
  self->_sharedMetalBuffer.unint64_t roiDataOffset = v31 + a6;
  int v32 = (v31 | 0x20uLL) > a7 ? v17 : 0;
  if (v32 == 1) {
    goto LABEL_44;
  }
  self->_sharedMetalBuffer.gatingCounters = (v31 | 0x20) + a6;
  int v33 = (v31 | 0x28uLL) > a7 ? v17 : 0;
  if (v33 == 1) {
    goto LABEL_44;
  }
  int v18 = 0;
  if (a3) {
    a3->unsigned int var0 = (v31 + 103) & 0xFFFFFFC0;
  }
LABEL_39:

  return v18;
}

- (int)prepareInputImagePixelBuffer:(id *)a3
{
  int v5 = [(FigIntelligentDistortionCorrectionProcessorV1 *)self mapPixelFormat:self->_inputImage format:&self->_rt.inputImagePixelFormat];
  if (v5)
  {
    int v24 = v5;
    fig_log_get_emitter();
    FigDebugAssert3();
    return v24;
  }
  double v6 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:self->_inputImage pixelFormat:self->_rt.inputImagePixelFormat usage:23 plane:0];
  inputImageTexture = self->_rt.inputImageTexture;
  self->_rt.inputImageTexture = v6;

  if (!self->_rt.inputImageTexture)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12786;
  }
  int Width = CVPixelBufferGetWidth(self->_inputImage);
  int Height = CVPixelBufferGetHeight(self->_inputImage);
  [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities.processor setBoundingRect:a3 x0:0 y0:0 width:[(MTLTexture *)self->_rt.inputImageTexture width] height:[(MTLTexture *)self->_rt.inputImageTexture height]];
  p_uint64_t var1 = &a3->var1;
  if (!a3->var1.var4 || !a3->var1.var5 || self->_gdcSource == 1 && a3->var2.var4 == Width && a3->var2.var5 == Height)
  {
    *(_OWORD *)&p_var1->unsigned int var0 = *(_OWORD *)&a3->var0.var0;
    *(void *)&a3->var1.int var4 = *(void *)&a3->var0.var4;
  }
  int var4 = a3->var2.var4;
  if (var4 && (int v12 = a3->var2.var5) != 0)
  {
    int v13 = a3->var0.var4;
    int var5 = a3->var0.var5;
    BOOL v15 = __OFSUB__(v13, var4);
    int v16 = v13 - var4;
    if (v16 < 0 != v15) {
      ++v16;
    }
    BOOL v15 = __OFSUB__(var5, v12);
    int v17 = var5 - v12;
    if (v17 < 0 != v15) {
      ++v17;
    }
    a3->var2.unsigned int var0 = v16 >> 1;
    a3->var2.uint64_t var1 = v17 >> 1;
    a3->var2.var2 = var4 + (v16 >> 1) - 1;
    a3->var2.var3 = v12 + (v17 >> 1) - 1;
  }
  else
  {
    *(_OWORD *)&a3->var2.unsigned int var0 = *(_OWORD *)&p_var1->var0;
    *(void *)&a3->var2.int var4 = *(void *)&a3->var1.var4;
  }
  if (CGRectEqualToRect(self->_inputImageCropRect, *MEMORY[0x263F001A0])
    || CGRectEqualToRect(self->_inputImageCropRect, *MEMORY[0x263F001A8]))
  {
    *(void *)&a3->var3.unsigned int var0 = 0;
    int v19 = a3->var0.var4;
    int v18 = a3->var0.var5;
    a3->var3.var2 = v19 - 1;
    a3->var3.var3 = v18 - 1;
    a3->var3.int var4 = v19;
  }
  else
  {
    double v20 = self->_inputImageCropRect.size.width;
    if (v20 <= 0.0 || (double v21 = self->_inputImageCropRect.size.height, v21 <= 0.0))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return -12780;
    }
    double x = self->_inputImageCropRect.origin.x;
    double y = self->_inputImageCropRect.origin.y;
    a3->var3.unsigned int var0 = (int)x;
    a3->var3.uint64_t var1 = (int)y;
    a3->var3.var2 = (int)(v20 + x + -1.0);
    a3->var3.var3 = (int)(v21 + y + -1.0);
    a3->var3.int var4 = (int)v20;
    int v18 = (int)v21;
  }
  a3->var3.int var5 = v18;
  if (a3->var1.var0 >= a3->var0.var0
    && a3->var1.var1 >= a3->var0.var1
    && a3->var1.var2 <= a3->var0.var2
    && a3->var1.var3 <= a3->var0.var3)
  {
    return 0;
  }
  return -12780;
}

- (int)prepareSegmentationMaskPixelBuffer:(id *)a3
{
  if (!self->_processIntelligentDistortionCorrection)
  {
    [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities.processor setBoundingRect:a3 x0:0 y0:0 width:0 height:0];
    return 0;
  }
  lowResSegmentationMask = self->_lowResSegmentationMask;
  if (!lowResSegmentationMask || CVPixelBufferGetPixelFormatType(lowResSegmentationMask) != 1278226536) {
    goto LABEL_12;
  }
  double v6 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:self->_lowResSegmentationMask pixelFormat:25 usage:23 plane:0];
  inputSegmentationMaskTexture = self->_rt.inputSegmentationMaskTexture;
  self->_rt.inputSegmentationMaskTexture = v6;

  long long v8 = self->_rt.inputSegmentationMaskTexture;
  if (v8)
  {
    [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities.processor setBoundingRect:a3 x0:0 y0:0 width:[(MTLTexture *)v8 width] height:[(MTLTexture *)self->_rt.inputSegmentationMaskTexture height]];
    if ((unint64_t)[(MTLTexture *)self->_rt.inputSegmentationMaskTexture width] < 0x10
      || (unint64_t)[(MTLTexture *)self->_rt.inputSegmentationMaskTexture height] <= 0xF
      || [(MTLTexture *)self->_rt.inputSegmentationMaskTexture width] > (unint64_t)*(void *)self->_anon_48
      || [(MTLTexture *)self->_rt.inputSegmentationMaskTexture height] > (unint64_t)*(unsigned int *)&self->_anon_48[4])
    {
LABEL_12:
      fig_log_get_emitter();
      FigDebugAssert3();
      return -12780;
    }
    return 0;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return -1;
}

- (int)prepareOutputImagePixelBuffer:(id *)a3
{
  int v5 = [(FigIntelligentDistortionCorrectionProcessorV1 *)self mapPixelFormat:self->_outputImage format:&self->_rt.outputImagePixelFormat];
  if (v5)
  {
    int v9 = v5;
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    double v6 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:self->_outputImage pixelFormat:self->_rt.outputImagePixelFormat usage:23 plane:0];
    outputImageTexture = self->_rt.outputImageTexture;
    self->_rt.outputImageTexture = v6;

    long long v8 = self->_rt.outputImageTexture;
    if (v8)
    {
      [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities.processor setBoundingRect:a3 x0:0 y0:0 width:[(MTLTexture *)v8 width] height:[(MTLTexture *)self->_rt.outputImageTexture height]];
      return 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return -12786;
    }
  }
  return v9;
}

- (int)mapPixelFormat:(__CVBuffer *)a3 format:(unint64_t *)a4
{
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType <= 796419631)
  {
    if (PixelFormatType <= 758674991)
    {
      if (PixelFormatType > 645424687)
      {
        if (PixelFormatType != 645424688 && PixelFormatType != 645428784)
        {
          int v6 = 758670896;
          goto LABEL_31;
        }
LABEL_33:
        int result = 0;
        unint64_t v10 = 546;
        goto LABEL_34;
      }
      if (PixelFormatType != 641230384)
      {
        int v6 = 641234480;
        goto LABEL_31;
      }
LABEL_32:
      int result = 0;
      unint64_t v10 = 540;
LABEL_34:
      *a4 = v10;
      return result;
    }
    if (PixelFormatType > 762869295)
    {
      if (PixelFormatType == 762869296) {
        goto LABEL_33;
      }
      if (PixelFormatType != 792225328)
      {
        int v6 = 792229424;
        goto LABEL_31;
      }
      goto LABEL_32;
    }
    if (PixelFormatType == 758674992) {
      goto LABEL_32;
    }
    int v7 = 762865200;
LABEL_26:
    if (PixelFormatType != v7) {
      goto LABEL_35;
    }
    goto LABEL_33;
  }
  if (PixelFormatType <= 1885745711)
  {
    if (PixelFormatType <= 875704421)
    {
      if (PixelFormatType == 796419632) {
        goto LABEL_33;
      }
      int v7 = 796423728;
    }
    else
    {
      if (PixelFormatType == 875704422 || PixelFormatType == 875704438) {
        goto LABEL_32;
      }
      int v7 = 1882468912;
    }
    goto LABEL_26;
  }
  if (PixelFormatType <= 2084075055)
  {
    if (PixelFormatType == 1885745712) {
      goto LABEL_33;
    }
    unsigned __int16 v8 = 26160;
  }
  else
  {
    if (PixelFormatType == 2088269360 || PixelFormatType == 2088265264) {
      goto LABEL_33;
    }
    unsigned __int16 v8 = 30256;
  }
  int v6 = v8 | 0x7C380000;
LABEL_31:
  if (PixelFormatType == v6) {
    goto LABEL_32;
  }
LABEL_35:
  fig_log_get_emitter();
  FigDebugAssert3();
  return -12780;
}

- (void)buildMakernoteEntry:(int)a3 cpwProcessingErrors:(id *)a4 idcApplied:(BOOL)a5
{
  int v5 = -a3 & 0xF | (16 * (self->_correctionType & 0xF)) | ((self->_gdcSource & 3) << 15);
  if (a5) {
    v5 |= 0x200000u;
  }
  if (self->_processIntelligentDistortionCorrection) {
    v5 |= 0x400000u;
  }
  if (self->_processGeometricDistortionCorrection) {
    v5 |= 0x800000u;
  }
  if (self->_deviceWasStationaryDuringCapture) {
    v5 |= 0x1000000u;
  }
  if (self->_globalTransformIsValid) {
    v5 |= 0x2000000u;
  }
  if (a4->var0) {
    v5 |= 0x4000000u;
  }
  if (a4->var1) {
    v5 |= 0x8000000u;
  }
  if (a4->var3) {
    v5 |= 0x10000000u;
  }
  if (a4->var4) {
    v5 |= 0x20000000u;
  }
  if (a4->var2) {
    v5 |= 0x40000000u;
  }
  if (a4->var5) {
    v5 |= 0x80000000;
  }
  self->_makernoteEntrdouble y = self->_rt.correctionTypeSelectionCode | self->_rt.subProcessIntelligentDistortionErrorCode | v5;
}

- (int)compilerShaders
{
  if (self->_areAllShadersCompiled) {
    return 0;
  }
  uint64_t v3 = [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities.processor compileShaders:self->_isShaderHarvesting];
  if (!v3)
  {
    uint64_t v3 = [(EdgeDrawingLineDetector *)self->_edgeDrawingLineDetector.processor compileShaders:self->_isShaderHarvesting];
    if (!v3)
    {
      uint64_t v3 = [(IdcContentPreservingWarping *)self->_contentPreservingWarping.processor compileShaders:self->_isShaderHarvesting];
      if (!v3)
      {
        self->_areAllShadersCompiled = 1;
        return 0;
      }
    }
  }
  uint64_t v5 = v3;
  fig_log_get_emitter();
  FigDebugAssert3();

  return [(FigIntelligentDistortionCorrectionProcessorV1 *)self translateError:v5];
}

- (float)convertPercentageParameter:(unsigned int)a3
{
  return (float)a3 * 0.01;
}

- (int)computeCorrectionType
{
  uint64_t v108 = *MEMORY[0x263EF8340];
  NSUInteger v3 = [(NSArray *)self->_faceObservations count];
  if (!self->_defaultWrites.disableGating)
  {
    if (self->_processIntelligentDistortionCorrection) {
      goto LABEL_9;
    }
LABEL_40:
    uint64_t v4 = 0;
    int v5 = 0;
    unsigned int v81 = 4096;
LABEL_47:
    self->_rt.correctionTypeSelectionCode = v81;
    goto LABEL_48;
  }
  if (!self->_processIntelligentDistortionCorrection) {
    goto LABEL_40;
  }
  if (self->_lowResSegmentationMask && self->_faceObservations && v3)
  {
    uint64_t v4 = 0;
    self->_rt.correctionTypeSelectionCode = 0;
LABEL_7:
    int v5 = 1;
    goto LABEL_48;
  }
LABEL_9:
  if (self->_deviceWasStationaryDuringCapture && !self->_defaultWrites.disableStationaryDeviceDetection)
  {
    uint64_t v4 = 0;
    int v5 = 0;
    unsigned int v81 = 6144;
    goto LABEL_47;
  }
  if (!self->_lowResSegmentationMask)
  {
    uint64_t v4 = 0;
    int v5 = 0;
    unsigned int v81 = 0x2000;
    goto LABEL_47;
  }
  if (!self->_faceObservations || !v3)
  {
    uint64_t v4 = 0;
    int v5 = 0;
    unsigned int v81 = 10240;
    goto LABEL_47;
  }
  int v6 = [(NSDictionary *)self->_inputImageMetadataDictionary objectForKeyedSubscript:*MEMORY[0x263F2C5E8]];
  uint64_t v4 = v6;
  if (!v6)
  {
    fig_log_get_emitter();
LABEL_54:
    FigDebugAssert3();
    goto LABEL_7;
  }
  int v102 = 1;
  if ((utlIntToOrientation([v6 intValue], &v102) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_54;
  }
  int v7 = *(_DWORD *)&self->_anon_c0[228];
  int v8 = *(_DWORD *)&self->_anon_c0[232];
  unsigned int v9 = *(_DWORD *)&self->_anon_c0[252];
  unsigned int v10 = *(_DWORD *)&self->_anon_c0[256];
  int v92 = *(_DWORD *)&self->_anon_c0[236];
  int v11 = *(_DWORD *)&self->_anon_c0[240];
  [(FigIntelligentDistortionCorrectionProcessorV1 *)self convertPercentageParameter:*(unsigned int *)&self->_anon_c0[176]];
  float v13 = v12;
  float v14 = *(float *)&self->_anon_c0[180];
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  BOOL v15 = self->_faceObservations;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v98 objects:v107 count:16];
  if (!v16)
  {

LABEL_46:
    int v5 = 0;
    unsigned int v81 = 20480;
    goto LABEL_47;
  }
  uint64_t v17 = v16;
  int v18 = v8;
  int v19 = 0;
  int v88 = 0;
  int v86 = v18;
  float v84 = v13;
  float v20 = fmaxf((float)v7, (float)v18) * v13;
  v21.f32[0] = (float)v7 * 0.5;
  v21.f32[1] = (float)v18 * 0.5;
  float32x2_t v89 = v21;
  double v95 = (double)v10;
  float v87 = v20 * v14;
  double v93 = (double)v92;
  double v94 = (double)v11;
  uint64_t v22 = *(void *)v99;
  double v23 = (float)v7;
  double v24 = (float)v18;
  float v90 = v20;
  float v91 = (float)v9 * (float)v10;
  int v5 = 1;
  int v85 = v7;
  while (2)
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v99 != v22) {
        objc_enumerationMutation(v15);
      }
      int v26 = v102;
      [*(id *)(*((void *)&v98 + 1) + 8 * i) boundingBox];
      double v31 = rectangleC1toC0(v26, v27, v28, v29, v30);
      v109.size.double width = v32 * v23;
      v109.size.double height = v33 * v24;
      v109.origin.double x = v31 * v23;
      v109.origin.double y = v34 * v24;
      v111.origin.double x = v93;
      v111.origin.double y = v94;
      v111.size.double width = (double)v9;
      v111.size.double height = v95;
      CGRect v110 = CGRectIntersection(v109, v111);
      double x = v110.origin.x;
      double y = v110.origin.y;
      double width = v110.size.width;
      double height = v110.size.height;
      *(float *)&v110.origin.double x = v110.size.width * v110.size.height;
      float v39 = *(float *)&v110.origin.x / v91;
      [(FigIntelligentDistortionCorrectionProcessorV1 *)self convertPercentageParameter:*(unsigned int *)&self->_anon_c0[168]];
      float v41 = v40;
      [(FigIntelligentDistortionCorrectionProcessorV1 *)self convertPercentageParameter:*(unsigned int *)&self->_anon_c0[172]];
      if (v39 > v41)
      {
        self->_rt.correctionTypeSelectionCode = 12288;

        int v5 = 0;
        goto LABEL_48;
      }
      if (v39 > v42)
      {
        v43.f32[0] = x + width * 0.5;
        float32_t v44 = y + height * 0.5;
        v43.f32[1] = v44;
        float32x2_t v45 = vsub_f32(v43, v89);
        float v46 = sqrtf(vaddv_f32(vmul_f32(v45, v45)));
        ++v19;
        if (v46 < v90)
        {
          self->_rt.correctionTypeSelectionCode = 14336;
          if (v46 < v87) {
            ++v88;
          }
          int v5 = 3;
        }
      }
      uint64_t v47 = 0;
      *(float *)&uint64_t v48 = x;
      *(float *)&unsigned int v49 = y;
      float v50 = width;
      *(float *)&uint64_t v51 = *(float *)&v48 + v50;
      unint64_t v103 = __PAIR64__(v49, v48);
      unint64_t v104 = __PAIR64__(v49, v51);
      float v52 = height;
      *((float *)&v48 + 1) = *(float *)&v49 + v52;
      *((float *)&v51 + 1) = *(float *)&v49 + v52;
      uint64_t v105 = v48;
      uint64_t v106 = v51;
      float v53 = (float)*(int *)&self->_anon_c0[260];
      float v54 = v53 + (float)*(int *)&self->_anon_c0[276];
      float v55 = (float)*(int *)&self->_anon_c0[264];
      float v56 = v55 + (float)*(int *)&self->_anon_c0[280];
      float minDistanceToEdge = self->_minDistanceToEdge;
      do
      {
        float32x2_t v58 = *(float32x2_t *)((char *)&v103 + v47);
        float32x2_t v59 = vsub_f32(v58, (float32x2_t)__PAIR64__(v58.u32[1], LODWORD(v53)));
        float32x2_t v60 = vsub_f32(v58, (float32x2_t)__PAIR64__(v58.u32[1], LODWORD(v54)));
        v59.f32[0] = fminf(sqrtf(vaddv_f32(vmul_f32(v59, v59))), sqrtf(vaddv_f32(vmul_f32(v60, v60))));
        float32x2_t v61 = vsub_f32(v58, (float32x2_t)__PAIR64__(LODWORD(v55), v58.u32[0]));
        float32x2_t v62 = vsub_f32(v58, (float32x2_t)__PAIR64__(LODWORD(v56), v58.u32[0]));
        float v63 = fminf(fminf(v59.f32[0], sqrtf(vaddv_f32(vmul_f32(v61, v61)))), sqrtf(vaddv_f32(vmul_f32(v62, v62))));
        if (v63 < minDistanceToEdge)
        {
          self->_float minDistanceToEdge = v63;
          float minDistanceToEdge = v63;
        }
        v47 += 8;
      }
      while (v47 != 32);
    }
    uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v98 objects:v107 count:16];
    if (v17) {
      continue;
    }
    break;
  }

  if (!v19 || v88 == v19) {
    goto LABEL_46;
  }
  unsigned int v97 = 0;
  int32x2_t v64 = *(int32x2_t *)&self->_anon_c0[348];
  float32x2_t v65 = vcvt_f32_s32(v64);
  int v66 = *(_DWORD *)&self->_anon_c0[236] * v64.i32[0] / v85;
  int v67 = *(_DWORD *)&self->_anon_c0[240] * v64.i32[1] / v86;
  int v68 = *(_DWORD *)&self->_anon_c0[244] * v64.i32[0] / v85;
  int v69 = v68 - v66 + 1;
  int v70 = *(_DWORD *)&self->_anon_c0[248] * v64.i32[1] / v86;
  int v71 = v70 - v67 + 1;
  unsigned int v96 = 0;
  float v72 = v84 * fmaxf((float)v69, (float)v71);
  double v73 = COERCE_DOUBLE(vmul_f32(v65, (float32x2_t)0x3F0000003F000000));
  processedSegmentationMaskTexture = self->_rt.processedSegmentationMaskTexture;
  if (!processedSegmentationMaskTexture)
  {
    [(FigIntelligentDistortionCorrectionProcessorV1 *)self undistortSegmentationMask];
    processedSegmentationMaskTexture = self->_rt.processedSegmentationMaskTexture;
  }
  processor = self->_idcUtilities.processor;
  buffer = self->_sharedMetalBuffer.buffer;
  unint64_t gatingCounters = self->_sharedMetalBuffer.gatingCounters;
  unint64_t v103 = __PAIR64__(v67, v66);
  unint64_t v104 = __PAIR64__(v70, v68);
  LODWORD(v105) = v68 - v66 + 1;
  HIDWORD(v105) = v70 - v67 + 1;
  v65.f32[0] = v72;
  if ([(IntelligentDistortionCorrection_Utilities *)processor gatherGatingStatistics:processedSegmentationMaskTexture area:&v103 center:buffer radiusFromCenter:gatingCounters sharedMetalBuffer:&v97 sharedMetalBufferoffset:&v96 activePixelCount:v73 centerPixelCount:*(double *)&v65])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    unsigned int v78 = v96;
    float v79 = (float)v97 / (float)(v71 * v69);
    [(FigIntelligentDistortionCorrectionProcessorV1 *)self convertPercentageParameter:*(unsigned int *)&self->_anon_c0[164]];
    if (v79 < v80)
    {
      int v5 = 0;
      unsigned int v81 = 0x4000;
      goto LABEL_47;
    }
    [(FigIntelligentDistortionCorrectionProcessorV1 *)self convertPercentageParameter:*(unsigned int *)&self->_anon_c0[184]];
    if (v5 != 3 && (float)((float)v78 / (float)(v72 * (float)(v72 * 3.1416))) >= v83)
    {
      self->_rt.correctionTypeSelectionCode = 18432;
      int v5 = 3;
    }
  }
LABEL_48:

  return v5;
}

- (int)translateError:(int)a3
{
  if ((a3 + 12786) > 6) {
    return -15;
  }
  else {
    return *((_DWORD *)&unk_262F34844 + a3 + 12786);
  }
}

- (int)getAdjustedGDCInformation:(id *)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -2;
  }
  int v5 = (int32x2_t *)&self->_anon_c0[212];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  memset(v73, 0, sizeof(v73));
  signed int v6 = *(_DWORD *)&self->_anon_c0[284];
  signed int v7 = *(_DWORD *)&self->_anon_c0[288];
  a3->var0.origin.double x = (double)v6;
  a3->var0.origin.double y = (double)v7;
  uint64_t v8 = *(void *)&self->_anon_c0[300];
  v9.i64[0] = (int)v8;
  v9.i64[1] = SHIDWORD(v8);
  a3->var0.size = (CGSize)vcvtq_f64_s64(v9);
  signed int v10 = *(_DWORD *)&self->_anon_c0[292];
  signed int v11 = *(_DWORD *)&self->_anon_c0[296];
  [(IntelligentDistortionCorrection_Utilities *)self->_idcUtilities.processor buildParameters:v73 bundleConfiguration:self->_anon_c0];
  float v12 = (const float *)&self->_anon_c0[12];
  float32x2_t v13 = vld1_dup_f32(v12);
  float32x2_t v14 = vcvt_f32_s32(v5[6]);
  *(float32x2_t *)&v73[0] = v13;
  *((float32x2_t *)&v73[0] + 1) = v14;
  *(float32x2_t *)&long long v15 = inverseDistort(v6, v7, (float32x2_t *)v73);
  if (v10 <= v6)
  {
    unint64_t v23 = (unint64_t)vzip2_s32(*(int32x2_t *)&v15, (int32x2_t)inverseDistort(v6, v11, (float32x2_t *)v73));
  }
  else
  {
    LODWORD(v15) = DWORD1(v15);
    long long v68 = v15;
    signed int v16 = v6;
    do
    {
      float32x2_t v17 = inverseDistort(++v16, v7, (float32x2_t *)v73);
      long long v18 = v68;
      *(float *)&long long v18 = fminf(*(float *)&v68, v17.f32[1]);
      long long v68 = v18;
    }
    while (v10 != v16);
    *(float32x2_t *)&long long v19 = inverseDistort(v6, v11, (float32x2_t *)v73);
    long long v20 = v19;
    LODWORD(v20) = v68;
    int32x2_t v66 = (int32x2_t)v20;
    if (v10 <= v6) {
      goto LABEL_11;
    }
    LODWORD(v20) = DWORD1(v19);
    signed int v21 = v6;
    do
    {
      long long v69 = v20;
      float32x2_t v22 = inverseDistort(++v21, v11, (float32x2_t *)v73);
      long long v20 = v69;
      *(float *)&long long v20 = fmaxf(*(float *)&v69, v22.f32[1]);
    }
    while (v10 != v21);
    unint64_t v23 = __PAIR64__(v20, v66.u32[0]);
  }
  int32x2_t v66 = (int32x2_t)v23;
LABEL_11:
  *(float32x2_t *)&long long v24 = inverseDistort(v6, v7, (float32x2_t *)v73);
  int v25 = v11 - v7;
  if (v11 <= v7)
  {
    float v71 = *(float *)&v24;
    LODWORD(v29) = inverseDistort(v10, v7, (float32x2_t *)v73).u32[0];
  }
  else
  {
    signed int v26 = v7;
    do
    {
      long long v70 = v24;
      LODWORD(v27) = inverseDistort(v6, ++v26, (float32x2_t *)v73).u32[0];
      long long v28 = v70;
      *(float *)&long long v28 = fminf(*(float *)&v70, v27);
      float v71 = *(float *)&v28;
      long long v24 = v28;
    }
    while (v11 != v26);
    *(float32x2_t *)&long long v29 = inverseDistort(v10, v7, (float32x2_t *)v73);
    if (v11 > v7)
    {
      do
      {
        long long v67 = v29;
        LODWORD(v30) = inverseDistort(v10, ++v7, (float32x2_t *)v73).u32[0];
        long long v29 = v67;
        *(float *)&long long v29 = fmaxf(*(float *)&v67, v30);
      }
      while (v11 != v7);
    }
  }
  float v31 = (float)(v10 - v6) / (float)v25;
  v32.f32[0] = v71;
  v33.i32[1] = v66.i32[1];
  float v34 = (float)(*(float *)&v29 - v71) / (float)(*(float *)&v66.i32[1] - *(float *)v66.i32);
  if (v34 <= v31)
  {
    float32x2_t v37 = (float32x2_t)vdup_lane_s32(v66, 0);
    v37.f32[0] = v71;
    v33.i32[0] = v29;
    if (v34 < v31)
    {
      float v38 = v31 * (float)(*(float *)&v66.i32[1] - *(float *)v66.i32);
      float v39 = (float)(v71 + *(float *)&v29) * 0.5;
      v37.f32[0] = v39 - (float)(v38 * 0.5);
      v33.f32[0] = v39 + (float)(v38 * 0.5);
    }
  }
  else
  {
    float v35 = (float)(*(float *)&v29 - v71) / v31;
    float v36 = (float)(*(float *)v66.i32 + *(float *)&v66.i32[1]) * 0.5;
    v32.f32[1] = v36 - (float)(v35 * 0.5);
    *((float *)&v29 + 1) = v36 + (float)(v35 * 0.5);
    float32x2_t v37 = v32;
    float32x2_t v33 = (float32x2_t)v29;
  }
  uint64_t v40 = 0;
  float v41 = (float)*(int *)&self->_anon_c0[300];
  int8x8_t v42 = (int8x8_t)vmax_s32(v5[3], vcvt_s32_f32(vrndp_f32(v37)));
  int32x2_t v43 = vmin_s32(v5[4], vcvt_s32_f32(vrndm_f32(v33)));
  int v44 = v42.i32[1];
  int v45 = v42.i32[0];
  int v46 = v43.i32[1];
  int32x2_t v47 = vsub_s32(v43, (int32x2_t)vmvn_s8(v42));
  int v48 = v43.i32[0];
  int v49 = v43.i32[0] - v42.i32[0] + 1;
  a3->var0.origin.double x = (double)v42.i32[0];
  a3->var0.origin.double y = (double)v42.i32[1];
  a3->var0.size.double width = (double)v49;
  a3->var0.size.double height = (double)(v43.i32[1] - v42.i32[1] + 1);
  float v50 = v41 / (float)v49;
  float32x2_t v51 = vadd_f32(*(float32x2_t *)&self->_anon_c0[24], vmla_f32(vcvt_f32_s32(*v5), (float32x2_t)0x3F0000003F000000, vcvt_f32_s32(v5[2])));
  float32x2_t v52 = vcvt_f32_s32(v47);
  float v53 = (float)v45 - v51.f32[0];
  v47.i32[0] = v51.i32[1];
  float v54 = (float)v48 - v51.f32[0];
  a3->int var4 = (CGPoint)vcvtq_f64_f32(vmls_f32(v51, (float32x2_t)0x3F0000003F000000, v52));
  v51.f32[0] = (float)((float)v44 - *(float *)v47.i32) * (float)((float)v44 - *(float *)v47.i32);
  *(float *)v47.i32 = (float)((float)v46 - *(float *)v47.i32) * (float)((float)v46 - *(float *)v47.i32);
  float v72 = v50;
  float v55 = v50
      * fmaxf(fmaxf(fmaxf(sqrtf(v51.f32[0] + (float)(v53 * v53)), sqrtf(v51.f32[0] + (float)(v54 * v54))), sqrtf(*(float *)v47.i32 + (float)(v53 * v53))), sqrtf(*(float *)v47.i32 + (float)(v54 * v54)));
  float v56 = *((float *)&v74 + 2);
  long long v57 = v75;
  long long v58 = v76;
  do
  {
    float v59 = (float)(int)v40 / 100.0;
    *(float *)&v84[v40 + 101] = v59 * v59;
    float v60 = (float)((float)(v55 * v59) * (float)(v55 * v59)) * v56;
    BOOL v61 = v60 < 1.0;
    float v62 = *(float *)&v57
        + (float)((float)(*((float *)&v57 + 1)
                        + (float)((float)(*((float *)&v57 + 2)
                                        + (float)((float)(*((float *)&v57 + 3)
                                                        + (float)((float)(*(float *)&v58
                                                                        + (float)((float)(*((float *)&v58 + 1)
                                                                                        + (float)((float)(*((float *)&v58 + 2) + (float)(*((float *)&v58 + 3) * v60))
                                                                                                * v60))
                                                                                * v60))
                                                                * v60))
                                                * v60))
                                * v60))
                * v60);
    float v63 = v60 * v60;
    float v64 = (float)((float)((float)((float)((float)((float)(*(float *)&v57 + (float)(*((float *)&v57 + 1) * v60))
                                                + (float)(*((float *)&v57 + 2) * (float)(v60 * v60)))
                                        + (float)(*((float *)&v57 + 3) * (float)(v60 * (float)(v60 * v60))))
                                + (float)(*(float *)&v58 * (float)(v63 * v63)))
                        + (float)((float)((float)(v63 * v63) * *((float *)&v58 + 1)) * v60))
                + (float)((float)((float)(v63 * v63) * *((float *)&v58 + 2)) * v63))
        + (float)((float)((float)(v63 * v63) * *((float *)&v58 + 3)) * (float)(v60 * (float)(v60 * v60)));
    if (v61) {
      float v64 = v62;
    }
    *(float *)&v84[v40++] = 1.0 / (float)((float)(v64 * 0.01) + 1.0);
  }
  while (v40 != 101);
  if (cubicRegression())
  {
    int result = 0;
    *(int32x2_t *)&a3->var2 = v5[8];
    *(float32x4_t *)a3->uint64_t var1 = vmulq_n_f32(*(float32x4_t *)a3->var1, v72);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -3;
  }
  return result;
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

- (BOOL)processIntelligentDistortionCorrection
{
  return self->_processIntelligentDistortionCorrection;
}

- (void)setProcessIntelligentDistortionCorrection:(BOOL)a3
{
  self->_processIntelligentDistortionCorrection = a3;
}

- (BOOL)processGeometricDistortionCorrection
{
  return self->_processGeometricDistortionCorrection;
}

- (void)setProcessGeometricDistortionCorrection:(BOOL)a3
{
  self->_processGeometricDistortionCorrection = a3;
}

- (BOOL)applyZoom
{
  return self->_applyZoom;
}

- (void)setApplyZoom:(BOOL)a3
{
  self->_BOOL applyZoom = a3;
}

- (BOOL)applyStereoRectificationHomography
{
  return self->_applyStereoRectificationHomography;
}

- (void)setApplyStereoRectificationHomography:(BOOL)a3
{
  self->_applyStereoRectificationHomographdouble y = a3;
}

- (__n128)stereoRectificationInverseHomography
{
  return a1[82];
}

- (__n128)setStereoRectificationInverseHomography:(__n128)a3
{
  result[82] = a2;
  result[83] = a3;
  result[84] = a4;
  return result;
}

- (BOOL)useBilinearInterpolation
{
  return self->_useBilinearInterpolation;
}

- (void)setUseBilinearInterpolation:(BOOL)a3
{
  self->_useBilinearInterpolation = a3;
}

- (BOOL)usePrecomputedPolynomialsAndOpticalCenterOffset
{
  return self->_usePrecomputedPolynomialsAndOpticalCenterOffset;
}

- (void)setUsePrecomputedPolynomialsAndOpticalCenterOffset:(BOOL)a3
{
  self->_usePrecomputedPolynomialsAndOpticalCenterOffset = a3;
}

- (NSData)gdcForwardPolynomial
{
  return self->_gdcForwardPolynomial;
}

- (void)setGdcForwardPolynomial:(id)a3
{
}

- (NSData)gdcInversePolynomial
{
  return self->_gdcInversePolynomial;
}

- (void)setGdcInversePolynomial:(id)a3
{
}

- (CGPoint)opticalCenterOffset
{
  double x = self->_opticalCenterOffset.x;
  double y = self->_opticalCenterOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOpticalCenterOffset:(CGPoint)a3
{
  self->_opticalCenterOffset = a3;
}

- (__CVBuffer)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(__CVBuffer *)a3
{
  self->_inputImage = a3;
}

- (__CVBuffer)lowResSegmentationMask
{
  return self->_lowResSegmentationMask;
}

- (void)setLowResSegmentationMask:(__CVBuffer *)a3
{
  self->_lowResSegmentationMask = a3;
}

- (__CVBuffer)outputImage
{
  return self->_outputImage;
}

- (void)setOutputImage:(__CVBuffer *)a3
{
  self->_outputImage = a3;
}

- (NSDictionary)inputImageMetadataDictionary
{
  return self->_inputImageMetadataDictionary;
}

- (void)setInputImageMetadataDictionary:(id)a3
{
}

- (NSArray)faceObservations
{
  return self->_faceObservations;
}

- (void)setFaceObservations:(id)a3
{
}

- (BOOL)deviceWasStationaryDuringCapture
{
  return self->_deviceWasStationaryDuringCapture;
}

- (void)setDeviceWasStationaryDuringCapture:(BOOL)a3
{
  self->_deviceWasStationaryDuringCapture = a3;
}

- (CGRect)inputImageCropRect
{
  double x = self->_inputImageCropRect.origin.x;
  double y = self->_inputImageCropRect.origin.y;
  double width = self->_inputImageCropRect.size.width;
  double height = self->_inputImageCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInputImageCropRect:(CGRect)a3
{
  self->_inputImageCropRect = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)finalImageDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_finalImageDimensions;
}

- (void)setFinalImageDimensions:(id)a3
{
  self->_$470D365275581EF16070F5A11344F73E finalImageDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (BOOL)replicatePixelsOutsideOfFinalImageDimensions
{
  return self->_replicatePixelsOutsideOfFinalImageDimensions;
}

- (void)setReplicatePixelsOutsideOfFinalImageDimensions:(BOOL)a3
{
  self->_replicatePixelsOutsideOfFinalImageDimensions = a3;
}

- (CGRect)outputValidBufferRect
{
  double x = self->_outputValidBufferRect.origin.x;
  double y = self->_outputValidBufferRect.origin.y;
  double width = self->_outputValidBufferRect.size.width;
  double height = self->_outputValidBufferRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (__n128)globalTransform
{
  return a1[85];
}

- (BOOL)globalTransformIsValid
{
  return self->_globalTransformIsValid;
}

- (BOOL)zoomWasApplied
{
  return self->_zoomWasApplied;
}

- (unsigned)makernoteEntry
{
  return self->_makernoteEntry;
}

- (int)correctionType
{
  return self->_correctionType;
}

- (int)gdcSource
{
  return self->_gdcSource;
}

- (BOOL)generateMask
{
  return self->_generateMask;
}

- (void)setGenerateMask:(BOOL)a3
{
  self->_generateMask = a3;
}

- (BOOL)withTemporalConsistency
{
  return self->_withTemporalConsistency;
}

- (void)setWithTemporalConsistency:(BOOL)a3
{
  self->_withTemporalConsistencdouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceObservations, 0);
  objc_storeStrong((id *)&self->_inputImageMetadataDictionary, 0);
  objc_storeStrong((id *)&self->_gdcInversePolynomial, 0);
  objc_storeStrong((id *)&self->_gdcForwardPolynomial, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  sub_262F339D8((uint64_t)&self->_rt);
  sub_262F33A24((uint64_t)&self->_textures);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end