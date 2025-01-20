@interface CMIVideoDeghostingDetectionV1
- (BOOL)_extractLightAndGhostTilesFromMetadata:(id)a3 imageBufferDimensions:(id)a4 clippingTuningParams:(ClippingDataTuning *)a5 adjustedPrincipalPoint:(CGPoint)a6 ghostSearchTile:(CGRect *)a7;
- (CGPoint)bias;
- (CGPoint)reflectPoint:(CGPoint *)a3 pivotPoint:(CGPoint *)a4;
- (CGRect)_computeGhostBoundingBoxFromMaskUsingMax:(__CVBuffer *)a3 searchROI:(CGRect)a4 threshold:(float)a5 ghostSize:(float)a6 detectionScalingFactor:;
- (CMIMotionSampleRingBufferV1)motionSampleRingBuffer;
- (CMIVideoDeghostingDetectionV1)initWithMetalContext:(id)a3 imageDimensions:(id)a4 tuningParameters:(id)a5 enableMaskRegistration:(BOOL)a6;
- (MTLCommandQueue)metalCommandQueue;
- (NSArray)detectedGhostBoundingBoxes;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)metadataDictionary;
- (NSDictionary)tuningParameters;
- (__CVBuffer)greenGhostsMaskPixelBuffer;
- (__CVBuffer)inputPixelBuffer;
- (float)confidence;
- (float)contextScore;
- (float)shapeScore;
- (int)_compileShaders;
- (int)_computeMotionRegisteredMask:(id)a3 maskPrev:(id)a4;
- (int)_extractAndCheckTuningParameters:(id)a3;
- (int)_extractCalibrationDataFromMetadata:(id)a3 pixelBufferDimensions:(id)a4;
- (int)_extractCameraInfoFromMetadata:(id)a3;
- (int)_getShapeMask:(const CGRect *)a3 outputMask:(id)a4 ghostSize:(int)a5 maskScalingFactor:;
- (int)finishProcessing;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)process;
- (int)purgeResources;
- (int)resetState;
- (int)sensorBinningFactorHorizontal;
- (int)sensorBinningFactorVertical;
- (int)setup;
- (void)dealloc;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setInputPixelBuffer:(__CVBuffer *)a3;
- (void)setMetadataDictionary:(id)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setMotionSampleRingBuffer:(id)a3;
- (void)setSensorBinningFactorHorizontal:(int)a3;
- (void)setSensorBinningFactorVertical:(int)a3;
- (void)setTuningParameters:(id)a3;
@end

@implementation CMIVideoDeghostingDetectionV1

- (CMIVideoDeghostingDetectionV1)initWithMetalContext:(id)a3 imageDimensions:(id)a4 tuningParameters:(id)a5 enableMaskRegistration:(BOOL)a6
{
  id v11 = a3;
  id v12 = a5;
  if (!v11)
  {
    fig_log_get_emitter();
LABEL_18:
    FigDebugAssert3();

    self = 0;
    goto LABEL_14;
  }
  v35.receiver = self;
  v35.super_class = (Class)CMIVideoDeghostingDetectionV1;
  v13 = [(CMIVideoDeghostingDetectionV1 *)&v35 init];
  self = v13;
  if (!v13)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v13->_metalContext, a3);
  objc_storeStrong((id *)&self->_tuningParameters, a5);
  self->_imageDimensions = ($470D365275581EF16070F5A11344F73E)a4;
  self->_maskRegistrationEnabled = a6;
  if ([(CMIVideoDeghostingDetectionV1 *)self _extractAndCheckTuningParameters:self->_tuningParameters])
  {
    goto LABEL_17;
  }
  v14 = [[VDGMetalUtilsV1 alloc] initWithMetalContext:v11];
  vdgMetalUtils = self->_vdgMetalUtils;
  self->_vdgMetalUtils = v14;

  if (!self->_vdgMetalUtils) {
    goto LABEL_17;
  }
  v16 = [[CMIVideoDeghostingBrightLightV1 alloc] initWithMetalContext:self->_metalContext];
  greenGhostBrightLightDetection = self->_greenGhostBrightLightDetection;
  self->_greenGhostBrightLightDetection = v16;

  if (!self->_greenGhostBrightLightDetection) {
    goto LABEL_17;
  }
  v18 = objc_alloc_init(CMIVideoDeghostingBrightLightTuningParamsV1);
  greenGhostBrightLightTuningParameters = self->_greenGhostBrightLightTuningParameters;
  self->_greenGhostBrightLightTuningParameters = v18;

  if (!self->_greenGhostBrightLightTuningParameters) {
    goto LABEL_17;
  }
  if ([(CMIVideoDeghostingDetectionV1 *)self _compileShaders]) {
    goto LABEL_17;
  }
  if ([(CMIVideoDeghostingDetectionV1 *)self resetState]) {
    goto LABEL_17;
  }
  self->_scaleForGetShapeInputs = FigGetCFPreferenceNumberWithDefault();
  *(void *)&self->_sensorBinningFactorVertical = 0x100000001;
  motionSampleRingBuffer = self->_motionSampleRingBuffer;
  self->_motionSampleRingBuffer = 0;

  float32x2_t v21 = vcvt_f32_s32((int32x2_t)self->_imageDimensions);
  __asm
  {
    FMOV            V1.2S, #0.25
    FMOV            V2.2S, #1.0
  }
  *(float32x2_t *)&self->_detectionScalingFactor[4] = vdiv_f32(vcvt_f32_s32((int32x2_t)(*(void *)&vcvt_s32_f32(vmla_f32(_D2, _D1, v21)) & 0xFFFFFFFEFFFFFFFELL)), v21);
  PixelBuffer = (__CVBuffer *)CreatePixelBuffer();
  self->_detectionMask = PixelBuffer;
  if (!PixelBuffer) {
    goto LABEL_17;
  }
  v29 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:PixelBuffer pixelFormat:25 usage:7 plane:0];
  detectionMaskTexture = self->_detectionMaskTexture;
  self->_detectionMaskTexture = v29;

  if (!self->_detectionMaskTexture
    || self->_maskRegistrationEnabled
    && ((v31 = (__CVBuffer *)CreatePixelBuffer(), (self->_detectionMaskPrev = v31) == 0)
     || ([(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:v31 pixelFormat:25 usage:7 plane:0], v32 = (MTLTexture *)objc_claimAutoreleasedReturnValue(), detectionMaskPrevTexture = self->_detectionMaskPrevTexture, self->_detectionMaskPrevTexture = v32, detectionMaskPrevTexture, !self->_detectionMaskPrevTexture)))
  {
LABEL_17:
    fig_log_get_emitter();
    goto LABEL_18;
  }
LABEL_14:

  return self;
}

- (void)dealloc
{
  [(CMIVideoDeghostingDetectionV1 *)self finishProcessing];
  [(CMIVideoDeghostingDetectionV1 *)self purgeResources];
  v3.receiver = self;
  v3.super_class = (Class)CMIVideoDeghostingDetectionV1;
  [(CMIVideoDeghostingDetectionV1 *)&v3 dealloc];
}

- (int)prepareToProcess:(unsigned int)a3
{
  return 0;
}

- (int)finishProcessing
{
  return 0;
}

- (int)purgeResources
{
  FigMetalDecRef();
  FigMetalDecRef();
  detectionMask = self->_detectionMask;
  if (detectionMask)
  {
    CFRelease(detectionMask);
    self->_detectionMask = 0;
  }
  detectionMaskPrev = self->_detectionMaskPrev;
  if (detectionMaskPrev)
  {
    CFRelease(detectionMaskPrev);
    self->_detectionMaskPrev = 0;
  }
  return 0;
}

- (int)process
{
  *(void *)&self->_shapeScore = 0;
  self->_confidence = 0.0;
  detectedGhostBoundingBoxes = self->_detectedGhostBoundingBoxes;
  self->_detectedGhostBoundingBoxes = 0;
  self->_greenGhostsMaskPixelBuffer = 0;

  if (self->_inputPixelBuffer && self->_metadataDictionary)
  {
    unsigned int v4 = -[CMIVideoDeghostingDetectionV1 _extractCameraInfoFromMetadata:](self, "_extractCameraInfoFromMetadata:");
    if (v4
      || (unsigned int v4 = [(CMIVideoDeghostingDetectionV1 *)self _extractCalibrationDataFromMetadata:self->_metadataDictionary pixelBufferDimensions:*(void *)&self->_imageDimensions]) != 0)
    {
      int v13 = v4;
      fig_log_get_emitter();
    }
    else
    {
      double v58 = 0.0;
      int v5 = sub_F4FC((const __CFDictionary *)self->_metadataDictionary, &v58, 0.5);
      if (v5)
      {
        int v13 = v5;
        fig_log_get_emitter();
      }
      else
      {
        [(CMIMotionSampleRingBufferV1 *)self->_motionSampleRingBuffer computeQuaternionForTimeStamp:v58];
        self->_centerQuaternion.w = v6;
        self->_centerQuaternion.CGFloat x = v7;
        self->_centerQuaternion.CGFloat y = v8;
        self->_centerQuaternion.z = v9;
        if (gGMFigKTraceEnabled == 1) {
          kdebug_trace();
        }
        CGSize size = CGRectNull.size;
        float64x2_t origin = (float64x2_t)CGRectNull.origin;
        CGSize v57 = size;
        greenGhostBrightLightTuningParameters = self->_greenGhostBrightLightTuningParameters;
        if (greenGhostBrightLightTuningParameters) {
          [(CMIVideoDeghostingBrightLightTuningParamsV1 *)greenGhostBrightLightTuningParameters tuningParams];
        }
        else {
          memset(v54, 0, sizeof(v54));
        }
        long long v55 = *(_OWORD *)((char *)v54 + 4);
        float64x2_t v43 = vdivq_f64((float64x2_t)self->_adjustedPrincipalPoint, vcvtq_f64_f32(vcvt_f32_s32((int32x2_t)self->_imageDimensions)));
        if (!-[CMIVideoDeghostingDetectionV1 _extractLightAndGhostTilesFromMetadata:imageBufferDimensions:clippingTuningParams:adjustedPrincipalPoint:ghostSearchTile:](self, "_extractLightAndGhostTilesFromMetadata:imageBufferDimensions:clippingTuningParams:adjustedPrincipalPoint:ghostSearchTile:", self->_metadataDictionary, *(void *)&self->_imageDimensions, &v55, &origin))return 0; {
        if (gGMFigKTraceEnabled == 1)
        }
          kdebug_trace();
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v12 = self->_greenGhostBrightLightTuningParameters;
        if (v12)
        {
          [(CMIVideoDeghostingBrightLightTuningParamsV1 *)v12 tuningParams];
          id v12 = self->_greenGhostBrightLightTuningParameters;
        }
        *(float32x2_t *)&long long v48 = vcvt_f32_f64(v43);
        v45[4] = v50;
        v45[5] = v51;
        v45[6] = v52;
        v45[7] = v53;
        v45[0] = v46;
        v45[1] = v47;
        v45[2] = v48;
        v45[3] = v49;
        [(CMIVideoDeghostingBrightLightTuningParamsV1 *)v12 setTuningParams:v45];
        if (gGMFigKTraceEnabled == 1) {
          kdebug_trace();
        }
        int v13 = [(CMIVideoDeghostingBrightLightV1 *)self->_greenGhostBrightLightDetection greenGhostDetectionWithInputPixelBuffer:self->_inputPixelBuffer outputMask:self->_detectionMaskTexture roi:self->_greenGhostBrightLightTuningParameters tuning:*(double *)vuzp1q_s32((int32x4_t)vcvtq_u64_f64(origin), (int32x4_t)vcvtq_u64_f64((float64x2_t)v57)).i64];
        if (gGMFigKTraceEnabled == 1) {
          kdebug_trace();
        }
        if (v13) {
          return v13;
        }
        int v14 = [(CMIVideoDeghostingDetectionV1 *)self _getShapeMask:&origin outputMask:self->_detectionMaskTexture ghostSize:self->_adjustedGhostSize maskScalingFactor:*(double *)&self->_detectionScalingFactor[4]];
        if (v14) {
          return v14;
        }
        float detectionThreshold = self->_detectionThreshold;
        unsigned __int8 v16 = +[CMIMotionSampleRingBufferV1 isUnitQuaternion:](CMIMotionSampleRingBufferV1, "isUnitQuaternion:", &self->_centerQuaternion, self->_prevGhostLoc.y);
        unsigned __int8 v17 = +[CMIMotionSampleRingBufferV1 isUnitQuaternion:&self->_previousCameraInfo.quaternion];
        if (!self->_maskRegistrationEnabled || (v16 & 1) != 0 || (v17 & 1) != 0)
        {
LABEL_27:
          double v19 = COERCE_FLOAT(HIDWORD(*(void *)&self->_detectionScalingFactor[4]));
          float64_t v20 = origin.f64[1] * v19;
          float64_t v21 = v57.height * v19;
          *(float *)&double v19 = (float)self->_adjustedGhostSize;
          -[CMIVideoDeghostingDetectionV1 _computeGhostBoundingBoxFromMaskUsingMax:searchROI:threshold:ghostSize:detectionScalingFactor:](self, "_computeGhostBoundingBoxFromMaskUsingMax:searchROI:threshold:ghostSize:detectionScalingFactor:", self->_detectionMask, origin.f64[0] * COERCE_FLOAT(*(void *)&self->_detectionScalingFactor[4]), v20, v57.width * COERCE_FLOAT(*(void *)&self->_detectionScalingFactor[4]), v21, COERCE_DOUBLE(__PAIR64__(HIDWORD(v57.height), LODWORD(detectionThreshold))), v19);
          CGFloat x = v60.origin.x;
          CGFloat y = v60.origin.y;
          CGFloat width = v60.size.width;
          CGFloat height = v60.size.height;
          CGRect v44 = v60;
          v62.origin.CGFloat x = CGRectNull.origin.x;
          v62.origin.CGFloat y = CGRectNull.origin.y;
          v62.size.CGFloat width = CGRectNull.size.width;
          v62.size.CGFloat height = CGRectNull.size.height;
          if (CGRectEqualToRect(v60, v62)) {
            goto LABEL_31;
          }
          v63.origin.CGFloat x = CGRectZero.origin.x;
          v63.origin.CGFloat y = CGRectZero.origin.y;
          v63.size.CGFloat width = CGRectZero.size.width;
          v63.size.CGFloat height = CGRectZero.size.height;
          v61.origin.CGFloat x = x;
          v61.origin.CGFloat y = y;
          v61.size.CGFloat width = width;
          v61.size.CGFloat height = height;
          if (CGRectEqualToRect(v61, v63)) {
            goto LABEL_31;
          }
          *(float *)&double v26 = self->_shapeScoreLambda;
          *(float *)&double v27 = self->_contextScoreLambda;
          LODWORD(v42) = self->_contextPaddingInPixel;
          [(VDGMetalUtilsV1 *)self->_vdgMetalUtils updateGhostPositionsUsingSourceImageFeatureMatching:&v44 shapeScore:&self->_shapeScore contextScore:&self->_contextScore confidenceOut:&self->_confidence pixelBuffer:self->_inputPixelBuffer searchRangeInPixel:self->_adjustedSearchRange shapeScoreLambda:v26 contextScoreLambda:v27 contextPaddingInPixel:v42];
          v44.origin.CGFloat x = v28;
          v44.origin.CGFloat y = v29;
          v44.size.CGFloat width = v30;
          v44.size.CGFloat height = v31;
          if (self->_shapeScore <= self->_minShapeScore)
          {
LABEL_31:
            self->_prevGhostLoc = (CGPoint)vdupq_n_s64(0x7FF8000000000000uLL);
          }
          else
          {
            self->_prevGhostLoc.CGFloat x = v28 + v30 * 0.5;
            self->_prevGhostLoc.CGFloat y = v29 + v31 * 0.5;
            id v32 = objc_alloc((Class)NSArray);
            CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v44);
            v34 = (NSArray *)objc_msgSend(v32, "initWithObjects:", DictionaryRepresentation, 0);
            objc_super v35 = self->_detectedGhostBoundingBoxes;
            self->_detectedGhostBoundingBoxes = v34;
          }
          self->_greenGhostsMaskPixelBuffer = self->_detectionMask;
          if (self->_maskRegistrationEnabled)
          {
            detectionMaskPrev = self->_detectionMaskPrev;
            v37 = self->_detectionMaskPrevTexture;
            detectionMaskTexture = self->_detectionMaskTexture;
            self->_detectionMaskPrev = self->_detectionMask;
            objc_storeStrong((id *)&self->_detectionMaskPrevTexture, detectionMaskTexture);
            v39 = self->_detectionMaskTexture;
            self->_detectionMask = detectionMaskPrev;
            self->_detectionMaskTexture = v37;
          }
          self->_previousCameraInfo.lensPosition = self->_lensPosition;
          self->_previousCameraInfo.adjustedPrincipalPoint = self->_adjustedPrincipalPoint;
          long long v40 = *(_OWORD *)&self->_centerQuaternion.y;
          *(_OWORD *)&self->_previousCameraInfo.quaternion.w = *(_OWORD *)&self->_centerQuaternion.w;
          *(_OWORD *)&self->_previousCameraInfo.quaternion.CGFloat y = v40;
          objc_storeStrong((id *)&self->_previousPortType, self->_currentPortType);
          return 0;
        }
        unsigned int v18 = [(CMIVideoDeghostingDetectionV1 *)self _computeMotionRegisteredMask:self->_detectionMaskTexture maskPrev:self->_detectionMaskPrevTexture];
        if (!v18)
        {
          float detectionThreshold = detectionThreshold * detectionThreshold;
          goto LABEL_27;
        }
        int v13 = v18;
        fig_log_get_emitter();
      }
    }
    FigDebugAssert3();
    return v13;
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)_extractAndCheckTuningParameters:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (!v4) {
    goto LABEL_11;
  }
  double v6 = [v4 objectForKeyedSubscript:@"GhostDetectionThreshold"];

  if (!v6) {
    goto LABEL_11;
  }
  double v7 = [v5 objectForKeyedSubscript:@"MinShapeScore"];

  if (!v7) {
    goto LABEL_11;
  }
  double v8 = [v5 objectForKeyedSubscript:@"GhostSize"];

  if (!v8) {
    goto LABEL_11;
  }
  double v9 = [v5 objectForKeyedSubscript:@"SearchRangeInPixel"];

  if (!v9) {
    goto LABEL_11;
  }
  v10 = [v5 objectForKeyedSubscript:@"ShapeScoreLambda"];

  if (!v10) {
    goto LABEL_11;
  }
  id v11 = [v5 objectForKeyedSubscript:@"ContextScoreLambda"];

  if (v11
    && ([v5 objectForKeyedSubscript:@"ContextPaddingInPixel"],
        id v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    int v13 = [v5 objectForKeyedSubscript:@"GhostDetectionThreshold"];
    [v13 floatValue];
    self->_float detectionThreshold = v14;

    v15 = [v5 objectForKeyedSubscript:@"MinShapeScore"];
    [v15 floatValue];
    self->_minShapeScore = v16;

    unsigned __int8 v17 = [v5 objectForKeyedSubscript:@"GhostSize"];
    self->_ghostSize = [v17 intValue];

    unsigned int v18 = [v5 objectForKeyedSubscript:@"SearchRangeInPixel"];
    self->_searchRangeInPixel = [v18 intValue];

    double v19 = [v5 objectForKeyedSubscript:@"ShapeScoreLambda"];
    [v19 floatValue];
    self->_shapeScoreLambda = v20;

    float64_t v21 = [v5 objectForKeyedSubscript:@"ContextScoreLambda"];
    [v21 floatValue];
    self->_contextScoreLambda = v22;

    v23 = [v5 objectForKeyedSubscript:@"ContextPaddingInPixel"];
    self->_contextPaddingInPixel = [v23 intValue];

    int v24 = 0;
  }
  else
  {
LABEL_11:
    int v24 = FigSignalErrorAt();
  }

  return v24;
}

- (int)_compileShaders
{
  objc_super v3 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"videoDeghostingDetectionMaskUtilities::computeShapeMask" constants:0];
  id v4 = self->_pipelineStates[0];
  self->_pipelineStates[0] = v3;

  if (self->_pipelineStates[0])
  {
    int v5 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"videoDeghostingDetectionMaskUtilities::downscaleAndCrop" constants:0];
    double v6 = self->_pipelineStates[1];
    self->_pipelineStates[1] = v5;

    if (self->_pipelineStates[1])
    {
      double v7 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"videoDeghostingDetectionMaskUtilities::computeShiftDilateHorizontal" constants:0];
      double v8 = self->_pipelineStates[2];
      self->_pipelineStates[2] = v7;

      if (self->_pipelineStates[2])
      {
        double v9 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"videoDeghostingDetectionMaskUtilities::computeDilateVerticalMultiply" constants:0];
        v10 = self->_pipelineStates[3];
        self->_pipelineStates[3] = v9;

        if (self->_pipelineStates[3]) {
          return 0;
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)_getShapeMask:(const CGRect *)a3 outputMask:(id)a4 ghostSize:(int)a5 maskScalingFactor:
{
  float32x2_t v6 = v5;
  id v10 = a4;
  v125[0] = v6;
  id v123 = 0;
  id v124 = 0;
  id v121 = 0;
  id v122 = 0;
  id v119 = 0;
  id v120 = 0;
  id v117 = 0;
  id v118 = 0;
  id v116 = 0;
  id v11 = [(FigMetalContext *)self->_metalContext commandQueue];
  id v12 = [v11 commandBuffer];

  double x = a3->origin.x;
  double y = a3->origin.y;
  double width = a3->size.width;
  double height = a3->size.height;
  v95 = +[VDGMetalUtilsV1 getMetalFormatFor:CVPixelBufferGetPixelFormatType(self->_inputPixelBuffer)];
  if (![v95 count]
    || ([(FigMetalContext *)self->_metalContext allocator],
        unsigned __int8 v17 = objc_claimAutoreleasedReturnValue(),
        id v18 = [v17 newTextureDescriptor],
        v17,
        !v18))
  {
    int v84 = FigSignalErrorAt();
    goto LABEL_22;
  }
  double v19 = [v18 desc];
  [v19 setTextureType:2];

  float v20 = [v18 desc];
  [v20 setPixelFormat:25];

  LODWORD(v21) = self->_scaleForGetShapeInputs;
  unint64_t v22 = (unint64_t)(a3->size.width / (double)v21);
  v23 = [v18 desc];
  [v23 setWidth:v22];

  LODWORD(v24) = self->_scaleForGetShapeInputs;
  unint64_t v25 = (unint64_t)(a3->size.height / (double)v24);
  double v26 = [v18 desc];
  [v26 setHeight:v25];

  double v27 = [v18 desc];
  [v27 setUsage:7];

  [v18 setLabel:0];
  double v28 = [(FigMetalContext *)self->_metalContext allocator];
  id v124 = [v28 newTextureWithDescriptor:v18];

  id v94 = v124;
  if (!v124) {
    goto LABEL_23;
  }
  [v18 setLabel:0];
  double v29 = [(FigMetalContext *)self->_metalContext allocator];
  id v30 = [v29 newTextureWithDescriptor:v18];
  id v123 = v30;

  if (!v30
    || ([v18 setLabel:0],
        [(FigMetalContext *)self->_metalContext allocator],
        double v31 = objc_claimAutoreleasedReturnValue(),
        id v122 = [v31 newTextureWithDescriptor:v18],
        v31,
        (id v92 = v122) == 0))
  {
LABEL_23:
    int v84 = FigSignalErrorAt();

    goto LABEL_22;
  }
  id v93 = v10;
  [v18 setLabel:0];
  id v32 = [(FigMetalContext *)self->_metalContext allocator];
  id v121 = [v32 newTextureWithDescriptor:v18];

  id v91 = v121;
  if (!v121) {
    goto LABEL_24;
  }
  unsigned int v88 = a5;
  metalContext = self->_metalContext;
  inputPixelBuffer = self->_inputPixelBuffer;
  objc_super v35 = [v95 objectAtIndexedSubscript:0];
  v36 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", inputPixelBuffer, (int)[v35 intValue], 1, 0);

  if (v36)
  {
    if (self->_scaleForGetShapeInputs < 2)
    {
      v89 = 0;
      v90 = 0;
    }
    else
    {
      [v18 setLabel:0];
      v37 = [(FigMetalContext *)self->_metalContext allocator];
      id v38 = [v37 newTextureWithDescriptor:v18];
      id v116 = v38;

      if (!v38)
      {
        int v84 = FigSignalErrorAt();

        goto LABEL_30;
      }
      v39 = self->_pipelineStates[1];
      *(float *)v40.i32 = (float)self->_scaleForGetShapeInputs;
      float32x2_t v114 = vcvt_f32_f64((float64x2_t)a3->origin);
      int32x2_t v115 = vdup_lane_s32(v40, 0);
      [v12 computeCommandEncoder];
      v41 = id v86 = v30;
      [v41 setComputePipelineState:v39];
      [v41 setTexture:v36 atIndex:0];
      [v41 setTexture:v38 atIndex:1];
      [v41 setBytes:&v115 length:8 atIndex:0];
      [v41 setBytes:&v114 length:8 atIndex:1];
      unint64_t v42 = (unint64_t)[(MTLComputePipelineState *)v39 threadExecutionWidth];
      v89 = v39;
      float64x2_t v43 = v12;
      unint64_t v44 = (unint64_t)[(MTLComputePipelineState *)v39 maxTotalThreadsPerThreadgroup]/ v42;
      v113[0] = [v38 width];
      v113[1] = [v38 height];
      v113[2] = 1;
      v112[0] = v42;
      v112[1] = v44;
      id v12 = v43;
      v112[2] = 1;
      [v41 dispatchThreads:v113 threadsPerThreadgroup:v112];
      v90 = v41;
      v45 = v41;
      id v30 = v86;
      [v45 endEncoding];
      LODWORD(v46) = self->_scaleForGetShapeInputs;
      double v47 = (double)v46;
      double width = width / v47;
      double height = height / v47;
      id v48 = v38;

      double y = 0.0;
      double x = 0.0;
      v36 = v48;
    }
    unsigned int v49 = -[VDGMetalUtilsV1 computeGradientX:GradientY:absGradientX:absGradientY:inputLumaTex:roi:isTenBitInput:commandBuffer:](self->_vdgMetalUtils, "computeGradientX:GradientY:absGradientX:absGradientY:inputLumaTex:roi:isTenBitInput:commandBuffer:", v94, v30, v92, v91, v36, +[VDGMetalUtilsV1 isTenBitPixelBufferFormat:](VDGMetalUtilsV1, "isTenBitPixelBufferFormat:", CVPixelBufferGetPixelFormatType(self->_inputPixelBuffer)), x, y, width, height, v12);
    if (v49)
    {
      int v84 = v49;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      long long v50 = [v18 desc];
      [v50 setTextureType:2];

      long long v51 = [v18 desc];
      [v51 setPixelFormat:55];

      LODWORD(v52) = self->_scaleForGetShapeInputs;
      unint64_t v53 = (unint64_t)(a3->size.width / (double)v52 + 1.0);
      v54 = [v18 desc];
      [v54 setWidth:v53];

      LODWORD(v55) = self->_scaleForGetShapeInputs;
      unint64_t v56 = (unint64_t)(a3->size.height / (double)v55 + 1.0);
      CGSize v57 = [v18 desc];
      [v57 setHeight:v56];

      double v58 = [v18 desc];
      [v58 setUsage:7];

      [v18 setLabel:0];
      v59 = [(FigMetalContext *)self->_metalContext allocator];
      id v60 = [v59 newTextureWithDescriptor:v18];
      id v120 = v60;

      if (v60)
      {
        [v18 setLabel:0];
        CGRect v61 = [(FigMetalContext *)self->_metalContext allocator];
        id v62 = [v61 newTextureWithDescriptor:v18];
        id v119 = v62;

        if (v62)
        {
          v87 = v12;
          [v18 setLabel:0];
          CGRect v63 = [(FigMetalContext *)self->_metalContext allocator];
          id v64 = [v63 newTextureWithDescriptor:v18];
          id v118 = v64;

          if (!v64) {
            goto LABEL_31;
          }
          id v65 = v30;
          [v18 setLabel:0];
          v66 = [(FigMetalContext *)self->_metalContext allocator];
          id v67 = [v66 newTextureWithDescriptor:v18];
          id v117 = v67;

          if (!v67
            || (unsigned int v68 = -[VDGMetalUtilsV1 computeImageIntegralSourceTexture:destinationTexture:commandBuffer:](self->_vdgMetalUtils, "computeImageIntegralSourceTexture:destinationTexture:commandBuffer:", v94, v60, v87), v69 = -[VDGMetalUtilsV1 computeImageIntegralSourceTexture:destinationTexture:commandBuffer:](self->_vdgMetalUtils, "computeImageIntegralSourceTexture:destinationTexture:commandBuffer:", v65, v62, v87) | v68, v70 = -[VDGMetalUtilsV1 computeImageIntegralSourceTexture:destinationTexture:commandBuffer:](self->_vdgMetalUtils, "computeImageIntegralSourceTexture:destinationTexture:commandBuffer:", v92, v64, v87), v69 | v70 | -[VDGMetalUtilsV1 computeImageIntegralSourceTexture:destinationTexture:commandBuffer:](self->_vdgMetalUtils,
                              "computeImageIntegralSourceTexture:destinationTexture:commandBuffer:",
                              v91,
                              v67,
                              v87)))
          {
LABEL_31:
            int v84 = FigSignalErrorAt();

            id v10 = v93;
            id v12 = v87;
            goto LABEL_22;
          }
          v71 = self->_pipelineStates[0];

          v72 = [v87 computeCommandEncoder];

          [v72 setComputePipelineState:v71];
          [v72 setTexture:v60 atIndex:0];
          [v72 setTexture:v62 atIndex:1];
          [v72 setTexture:v64 atIndex:2];
          [v72 setTexture:v67 atIndex:3];
          [v72 setTexture:v93 atIndex:4];
          double v73 = a3->size.width;
          double v74 = a3->size.height;
          unsigned int v75 = (int)v73;
          unsigned int v76 = (int)v74;
          unsigned int scaleForGetShapeInputs = self->_scaleForGetShapeInputs;
          v98[0] = v88 / scaleForGetShapeInputs;
          v98[1] = v88 / scaleForGetShapeInputs;
          unsigned int v99 = llroundf((float)(v88 / scaleForGetShapeInputs) * 0.33);
          unsigned int v100 = v88 / scaleForGetShapeInputs - v99;
          unsigned int v101 = v99;
          unsigned int v102 = v100;
          unsigned int v103 = (v88 / scaleForGetShapeInputs) >> 1;
          unsigned int v104 = v103;
          float v105 = (float)(v98[0] * v98[0]);
          unsigned int v106 = (v73 / (double)scaleForGetShapeInputs - (double)v103);
          unsigned int v107 = (v74 / (double)scaleForGetShapeInputs - (double)v103);
          int v78 = (int)a3->origin.y;
          int v108 = (int)a3->origin.x / 4;
          int v109 = v78 / 4;
          v125[0] = vmul_n_f32(v6, (float)scaleForGetShapeInputs);
          unsigned int v110 = vcvtad_u64_f64(1.0 / v125[0].f32[0]);
          float v111 = self->_shapeScoreLambda * (float)scaleForGetShapeInputs;
          [v72 setBytes:v98 length:60 atIndex:0];
          [v72 setBytes:v125 length:8 atIndex:1];
          unint64_t v79 = (unint64_t)[(MTLComputePipelineState *)v71 threadExecutionWidth];
          unint64_t v80 = (unint64_t)[(MTLComputePipelineState *)v71 maxTotalThreadsPerThreadgroup];
          unsigned int v81 = self->_scaleForGetShapeInputs;
          v97[0] = v75 / v81 + 1;
          v97[1] = v76 / v81 + 1;
          v97[2] = 1;
          v96[0] = v79;
          v96[1] = v80 / v79;
          v96[2] = 1;
          [v72 dispatchThreads:v97 threadsPerThreadgroup:v96];
          [v72 endEncoding];
          id v12 = v87;
          if (gGMFigKTraceEnabled)
          {
            v82 = [v87 commandQueue];
            v83 = [v82 commandBuffer];

            [v83 setLabel:@"KTRACE_MTLCMDBUF"];
            [v83 addCompletedHandler:&stru_2C650];
            [v83 commit];
            [v87 addCompletedHandler:&stru_2C670];
          }
          [v87 commit];
          [v87 waitUntilScheduled];

          int v84 = 0;
          goto LABEL_21;
        }
      }
      int v84 = FigSignalErrorAt();
    }
  }
  else
  {
LABEL_24:
    int v84 = FigSignalErrorAt();
  }
LABEL_30:

LABEL_21:
  id v10 = v93;
LABEL_22:
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  return v84;
}

- (int)_computeMotionRegisteredMask:(id)a3 maskPrev:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v59 = 0;
  double v8 = [(FigMetalContext *)self->_metalContext commandQueue];
  double v9 = [v8 commandBuffer];

  id v10 = [v9 computeCommandEncoder];
  v58[0] = sub_F6E4(&self->_previousCameraInfo.quaternion.w, (uint64_t *)&self->_centerQuaternion);
  v58[1] = v11;
  v58[2] = v12;
  v58[3] = v13;
  sub_FA00(v58, 0, (float *)v61);
  uint64_t v56 = 0;
  *(float *)&uint64_t v56 = self->_previousCameraInfo.lensPosition;
  CGPoint adjustedPrincipalPoint = self->_previousCameraInfo.adjustedPrincipalPoint;
  uint64_t v54 = 0;
  *(float *)&uint64_t v54 = self->_lensPosition;
  CGPoint v55 = self->_adjustedPrincipalPoint;
  -[CMIVideoDeghostingDetectionV1 reflectPoint:pivotPoint:](self, "reflectPoint:pivotPoint:", &self->_prevGhostLoc, &self->_previousCameraInfo.adjustedPrincipalPoint, sub_F970((uint64_t)&v54, (uint64_t)&v56, v61, (uint64_t)v60));
  *(float *)&double v14 = v14;
  *(float *)&double v15 = v15;
  float32x2_t v53 = 0;
  sub_10480(v60, (float *)&v53, (float *)&v53 + 1, *(float *)&v14, *(float *)&v15);
  float64x2_t v52 = vcvtq_f64_f32(v53);
  [(CMIVideoDeghostingDetectionV1 *)self reflectPoint:&v52 pivotPoint:&self->_adjustedPrincipalPoint];
  float64_t v44 = v17;
  float64_t v45 = v16;
  float32x2_t v18 = *(float32x2_t *)&self->_detectionScalingFactor[4];
  CGPoint prevGhostLoc = self->_prevGhostLoc;
  double v19 = [(FigMetalContext *)self->_metalContext allocator];
  id v20 = [v19 newTextureDescriptor];

  if (!v20) {
    goto LABEL_7;
  }
  unint64_t v21 = [v20 desc];
  [v21 setCompressionMode:2];

  unint64_t v22 = [v20 desc];
  [v22 setCompressionFootprint:0];

  v23 = [v20 desc];
  [v23 setUsage:7];

  id v24 = [v6 width];
  unint64_t v25 = [v20 desc];
  [v25 setWidth:v24];

  id v26 = [v6 height];
  double v27 = [v20 desc];
  [v27 setHeight:v26];

  double v28 = [v20 desc];
  [v28 setPixelFormat:25];

  [v20 setLabel:0];
  double v29 = [(FigMetalContext *)self->_metalContext allocator];
  id v30 = [v29 newTextureWithDescriptor:v20];
  id v31 = v59;
  id v59 = v30;

  if (v30)
  {
    v32.f64[0] = v45;
    v32.f64[1] = v44;
    float32x2_t v51 = vcvt_f32_f64(vmulq_f64(vsubq_f64(v32, (float64x2_t)prevGhostLoc), vcvtq_f64_f32(v18)));
    v33 = self->_pipelineStates[2];
    [v10 setComputePipelineState:v33];
    id v46 = v7;
    [v10 setTexture:v7 atIndex:0];
    [v10 setTexture:v30 atIndex:1];
    [v10 setBytes:&v51 length:8 atIndex:0];
    unint64_t v34 = (unint64_t)[(MTLComputePipelineState *)v33 threadExecutionWidth];
    unint64_t v35 = (unint64_t)[(MTLComputePipelineState *)v33 maxTotalThreadsPerThreadgroup]/ v34;
    v50[0] = (unint64_t)[v6 width] >> 1;
    v50[1] = (unint64_t)[v6 height] >> 1;
    v50[2] = 1;
    v49[0] = v34;
    v49[1] = v35;
    v49[2] = 1;
    [v10 dispatchThreads:v50 threadsPerThreadgroup:v49];
    v36 = self->_pipelineStates[3];

    [v10 setComputePipelineState:v36];
    [v10 setTexture:v30 atIndex:0];
    [v10 setTexture:v6 atIndex:1];
    unint64_t v37 = (unint64_t)[(MTLComputePipelineState *)v36 threadExecutionWidth];
    unint64_t v38 = (unint64_t)[(MTLComputePipelineState *)v36 maxTotalThreadsPerThreadgroup]/ v37;
    v48[0] = (unint64_t)[v6 width] >> 1;
    v48[1] = (unint64_t)[v6 height] >> 1;
    v48[2] = 1;
    v47[0] = v37;
    v47[1] = v38;
    v47[2] = 1;
    [v10 dispatchThreads:v48 threadsPerThreadgroup:v47];
    [v10 endEncoding];
    if (gGMFigKTraceEnabled)
    {
      v39 = [v9 commandQueue];
      int32x2_t v40 = [v39 commandBuffer];

      [v40 setLabel:@"KTRACE_MTLCMDBUF"];
      [v40 addCompletedHandler:&stru_2C690];
      [v40 commit];
      [v9 addCompletedHandler:&stru_2C6B0];
    }
    [v9 commit];
    [v9 waitUntilCompleted];

    int v41 = 0;
    id v7 = v46;
  }
  else
  {
LABEL_7:
    int v41 = FigSignalErrorAt();
  }
  FigMetalDecRef();

  return v41;
}

- (int)setup
{
  return 0;
}

- (int)prewarm
{
  return 0;
}

- (int)resetState
{
  self->_bias = CGPointZero;
  self->_confidence = 0.0;
  *(void *)&self->_shapeScore = 0;
  currentCameraInfo = self->_currentCameraInfo;
  self->_currentCameraInfo = 0;

  self->_CGPoint prevGhostLoc = (CGPoint)vdupq_n_s64(0x7FF8000000000000uLL);
  currentPortType = self->_currentPortType;
  self->_currentPortType = 0;

  previousPortType = self->_previousPortType;
  self->_previousPortType = 0;

  return 0;
}

- (CGRect)_computeGhostBoundingBoxFromMaskUsingMax:(__CVBuffer *)a3 searchROI:(CGRect)a4 threshold:(float)a5 ghostSize:(float)a6 detectionScalingFactor:
{
  uint64_t v36 = v6;
  _S9 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGFloat v14 = CGRectNull.origin.y;
  CGFloat v15 = CGRectNull.size.width;
  CGFloat v39 = CGRectNull.size.height;
  if (CVPixelBufferGetPixelFormatType(a3) != 1278226536 || CVPixelBufferLockBaseAddress(a3, 1uLL))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    double v32 = v39;
    double v33 = v15;
    double v34 = v14;
    double v31 = CGRectNull.origin.x;
    goto LABEL_27;
  }
  CGFloat v38 = v15;
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  double v17 = CGPointZero.x;
  double v16 = CGPointZero.y;
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  if ((int)height < 1)
  {
    LOWORD(v24) = 0;
  }
  else
  {
    int v20 = (int)width;
    uint64_t v21 = (int)x + (int)width;
    uint64_t v22 = (int)y;
    v23 = &BaseAddress[2 * (BytesPerRow >> 1) * v22];
    LOWORD(v24) = 0;
    do
    {
      if (v20 >= 1)
      {
        uint64_t v25 = (int)x;
        do
        {
          if (*(short float *)&v23[2 * v25] > v24)
          {
            short float v24 = *(short float *)&v23[2 * v25];
            double v16 = (double)(int)v22;
            double v17 = (double)(int)v25;
          }
          ++v25;
        }
        while (v25 < v21);
      }
      ++v22;
      v23 += 2 * (BytesPerRow >> 1);
    }
    while (v22 < (int)y + (int)height);
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  if (CVPixelBufferUnlockBaseAddress(a3, 1uLL))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_19:
    double v31 = CGRectNull.origin.x;
    double v32 = v39;
    double v33 = v38;
    double v34 = v14;
    goto LABEL_27;
  }
  __asm { FCVT            H0, S9 }
  if (v24 <= _H0) {
    goto LABEL_19;
  }
  double v35 = (float)(a6 * 0.5);
  double v31 = v17 / *(float *)&v36 - v35;
  if (v31 < 0.0) {
    goto LABEL_19;
  }
  double v34 = v16 / *((float *)&v36 + 1) - v35;
  if (v34 < 0.0) {
    goto LABEL_19;
  }
  double v32 = a6;
  if (v31 + a6 >= (double)self->_imageDimensions.width) {
    goto LABEL_19;
  }
  double v33 = a6;
  if (v34 + v32 >= (double)self->_imageDimensions.height) {
    goto LABEL_19;
  }
LABEL_27:
  result.size.double height = v32;
  result.size.double width = v33;
  result.origin.double y = v34;
  result.origin.double x = v31;
  return result;
}

- (int)_extractCameraInfoFromMetadata:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:kFigCaptureStreamMetadata_PortType];
  currentPortType = self->_currentPortType;
  self->_currentPortType = v4;

  if (self->_cameraInfoByPortType
    || ([(NSDictionary *)self->_metadataDictionary objectForKeyedSubscript:kFigCaptureSampleBufferProcessorOption_CameraInfoByPortType], uint64_t v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue(), v7 = self->_cameraInfoByPortType, self->_cameraInfoByPortType = v6, v7, self->_cameraInfoByPortType))
  {
    if (![(NSString *)self->_currentPortType isEqualToString:self->_previousPortType])
    {
      cameraInfoByPortType = self->_cameraInfoByPortType;
      if (cameraInfoByPortType)
      {
        double v9 = [(NSDictionary *)cameraInfoByPortType objectForKeyedSubscript:self->_currentPortType];
        currentCameraInfo = self->_currentCameraInfo;
        self->_currentCameraInfo = v9;

        double v11 = [(NSDictionary *)self->_currentCameraInfo objectForKeyedSubscript:kFigCaptureCameraInfoKey_PixelSize];
        [v11 floatValue];
        float v13 = v12;

        float v14 = 1.0;
        if (v13 > 0.0) {
          float v14 = 1.0 / v13;
        }
        self->_pixelsPerMicron = v14;
      }
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

- (int)_extractCalibrationDataFromMetadata:(id)a3 pixelBufferDimensions:(id)a4
{
  id v7 = a3;
  if (!v7 || a4.var0 < 1 || *(uint64_t *)&a4 <= 0)
  {
    fig_log_get_emitter();
    goto LABEL_27;
  }
  double v8 = [(NSDictionary *)self->_metadataDictionary objectForKeyedSubscript:kFigCaptureStreamMetadata_SphereMode];
  BOOL v9 = v8 != 0;

  id v10 = [v7 objectForKeyedSubscript:kFigMotionAttachmentsSampleBufferProcessorMetadata_FramePTSSeconds];
  [v10 doubleValue];
  double v12 = v11;

  if (v12 != 0.0
    || ([v7 objectForKeyedSubscript:kFigCaptureSampleBufferAttachmentKey_OriginalPresentationTimeStamp],
        CFDictionaryRef v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(),
        CMTimeMakeFromDictionary(&time, v13),
        CMTimeGetSeconds(&time),
        uint64_t v47 = 0,
        int v14 = sub_E8F0((const __CFDictionary *)v7, (double *)&v47),
        v13,
        !v14))
  {
    CGFloat v15 = [v7 objectForKeyedSubscript:kFigCaptureStreamMetadata_PinholeCameraFocalLength];
    [v15 floatValue];
    float v17 = v16;

    if (v17 == 0.0)
    {
      fig_log_get_emitter();
    }
    else
    {
      float32x2_t v18 = [v7 objectForKeyedSubscript:kFigCaptureStreamMetadata_QuadraBinningFactor];
      int v19 = [v18 intValue];

      if (v19 <= 1) {
        int v20 = 1;
      }
      else {
        int v20 = v19;
      }
      int v21 = self->_sensorBinningFactorHorizontal * v20;
      uint64_t v22 = (self->_sensorBinningFactorVertical * v20);
      v23 = [v7 objectForKeyedSubscript:kFigMotionAttachmentsSampleBufferProcessorMetadata_ScalingFactor];
      [v23 floatValue];
      float v25 = v24;

      float v46 = v25;
      if (v25 == 0.0)
      {
        int v26 = sub_E4E0((const __CFDictionary *)v7, a4.var0, HIDWORD(*(unint64_t *)&a4), v21, v22, &v46);
        if (v26) {
          goto LABEL_28;
        }
        float v25 = v46;
      }
      if (v25 > 0.0)
      {
        float pixelsPerMicron = self->_pixelsPerMicron;
        self->_lensPosition = (float)(v17 * v25) * pixelsPerMicron;
        self->_CGPoint adjustedPrincipalPoint = CGPointZero;
        int v26 = sub_10228((const __CFDictionary *)v7, a4.var0, a4.var1, v21, v22, v9, (float64x2_t *)&self->_adjustedPrincipalPoint, pixelsPerMicron, v25);
        if (!v26)
        {
          CGSize size = CGRectNull.size;
          rect.float64x2_t origin = CGRectNull.origin;
          rect.CGSize size = size;
          CFDictionaryRef v29 = [(NSDictionary *)self->_metadataDictionary objectForKeyedSubscript:kFigCaptureStreamMetadata_ValidBufferRect];
          BOOL v30 = CGRectMakeWithDictionaryRepresentation(v29, &rect);

          if (v30 && !CGRectIsEmpty(rect) && !CGRectContainsPoint(rect, self->_adjustedPrincipalPoint))
          {
            fig_log_get_emitter();
            uint64_t v44 = v4;
            LODWORD(v43) = 0;
            FigDebugAssert3();
          }
          double v31 = -[NSDictionary objectForKeyedSubscript:](self->_metadataDictionary, "objectForKeyedSubscript:", kFigCaptureStreamMetadata_Fnumber, v43, v44);
          [v31 floatValue];
          float v33 = v32;

          double v34 = [(NSDictionary *)self->_metadataDictionary objectForKeyedSubscript:kFigCaptureStreamMetadata_EffectiveFocalLength];
          [v34 floatValue];
          float v36 = v35;

          unint64_t v37 = [(NSDictionary *)self->_metadataDictionary objectForKeyedSubscript:kFigCaptureStreamMetadata_PracticalFocalLength];
          [v37 floatValue];
          float v39 = v38;

          if (v33 > 0.0)
          {
            int v14 = 0;
            float v40 = fmaxf(vabds_f32(v36, v39) + -5.0, 0.0);
            float v41 = self->_lensPosition / 1630.0;
            self->_adjustedGhostSize = llroundf((float)((float)((float)((float)(v40 * v46) * self->_pixelsPerMicron)+ (float)((float)(v40 * v46) * self->_pixelsPerMicron))/ v33)+ (float)(v41 * (float)self->_ghostSize));
            self->_adjustedSearchRange = llroundf(v41 * (float)self->_searchRangeInPixel);
            goto LABEL_21;
          }
          fig_log_get_emitter();
          goto LABEL_27;
        }
LABEL_28:
        int v14 = v26;
        goto LABEL_21;
      }
      fig_log_get_emitter();
    }
LABEL_27:
    FigDebugAssert3();
    int v26 = FigSignalErrorAt();
    goto LABEL_28;
  }
LABEL_21:

  return v14;
}

- (CGPoint)reflectPoint:(CGPoint *)a3 pivotPoint:(CGPoint *)a4
{
  __asm { FMOV            V2.2D, #2.0 }
  float64x2_t v9 = vaddq_f64(vmlaq_f64(vnegq_f64(*(float64x2_t *)a3), _Q2, *(float64x2_t *)a4), (float64x2_t)self->_bias);
  double v10 = v9.f64[1];
  result.double x = v9.f64[0];
  result.double y = v10;
  return result;
}

- (BOOL)_extractLightAndGhostTilesFromMetadata:(id)a3 imageBufferDimensions:(id)a4 clippingTuningParams:(ClippingDataTuning *)a5 adjustedPrincipalPoint:(CGPoint)a6 ghostSearchTile:(CGRect *)a7
{
  double y = a6.y;
  double x = a6.x;
  id v12 = a3;
  CGSize size = CGRectNull.size;
  float64x2_t origin = (float64x2_t)CGRectNull.origin;
  float64x2_t v26 = (float64x2_t)size;
  CGSize v21 = size;
  CGPoint v22 = (CGPoint)origin;
  float64x2_t v23 = origin;
  CGSize v24 = size;
  if (!sub_DACC(v12, &a5->paddingRatio, origin.f64, v23.f64, x, y)) {
    goto LABEL_8;
  }
  FigCFDictionaryGetCGRectIfPresent();
  v27.float64x2_t origin = v22;
  v27.CGSize size = v21;
  if (CGRectIsEmpty(v27)) {
    goto LABEL_7;
  }
  float64x2_t v14 = vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(vcvt_f32_s32((int32x2_t)a4)), (float64x2_t)v21)));
  float64x2_t v15 = vmulq_f64(origin, v14);
  float64x2_t v16 = vmulq_f64(v26, v14);
  float64x2_t origin = v15;
  float64x2_t v26 = v16;
  float64x2_t v23 = vcvtq_f64_f32(vcvt_f32_s32((int32x2_t)(*(void *)&vmovn_s64(vcvtq_s64_f64(vmulq_f64(v23, v14))) & 0xFFFFFFFCFFFFFFFCLL)));
  CGSize v24 = (CGSize)vcvtq_f64_f32(vcvt_f32_s32((int32x2_t)(*(void *)&vmovn_s64(vcvtq_s64_f64(vmulq_f64((float64x2_t)v24, v14))) & 0xFFFFFFFCFFFFFFFCLL)));
  v14.f64[0] = v15.f64[1];
  float64_t v17 = v16.f64[1];
  if (CGRectIsEmpty(*(CGRect *)((char *)&v14 - 8)) || (v28.origin = (CGPoint)v23, v28.CGSize size = v24, CGRectIsEmpty(v28)))
  {
LABEL_7:
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_8:
    BOOL v19 = 0;
    goto LABEL_6;
  }
  CGSize v18 = v24;
  a7->float64x2_t origin = (CGPoint)v23;
  a7->CGSize size = v18;
  BOOL v19 = 1;
LABEL_6:

  return v19;
}

- (__CVBuffer)inputPixelBuffer
{
  return self->_inputPixelBuffer;
}

- (void)setInputPixelBuffer:(__CVBuffer *)a3
{
  self->_inputPixelBuffer = a3;
}

- (NSDictionary)metadataDictionary
{
  return self->_metadataDictionary;
}

- (void)setMetadataDictionary:(id)a3
{
}

- (NSArray)detectedGhostBoundingBoxes
{
  return self->_detectedGhostBoundingBoxes;
}

- (__CVBuffer)greenGhostsMaskPixelBuffer
{
  return self->_greenGhostsMaskPixelBuffer;
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

- (int)sensorBinningFactorVertical
{
  return self->_sensorBinningFactorVertical;
}

- (void)setSensorBinningFactorVertical:(int)a3
{
  self->_sensorBinningFactorVertical = a3;
}

- (int)sensorBinningFactorHorizontal
{
  return self->_sensorBinningFactorHorizontal;
}

- (void)setSensorBinningFactorHorizontal:(int)a3
{
  self->_sensorBinningFactorHorizontal = a3;
}

- (CMIMotionSampleRingBufferV1)motionSampleRingBuffer
{
  return self->_motionSampleRingBuffer;
}

- (void)setMotionSampleRingBuffer:(id)a3
{
}

- (float)confidence
{
  return self->_confidence;
}

- (float)shapeScore
{
  return self->_shapeScore;
}

- (float)contextScore
{
  return self->_contextScore;
}

- (CGPoint)bias
{
  double x = self->_bias.x;
  double y = self->_bias.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionSampleRingBuffer, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_detectedGhostBoundingBoxes, 0);
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
  objc_storeStrong((id *)&self->_currentCameraInfo, 0);
  objc_storeStrong((id *)&self->_currentPortType, 0);
  objc_storeStrong((id *)&self->_previousPortType, 0);
  objc_storeStrong((id *)&self->_detectionMaskPrevTexture, 0);
  objc_storeStrong((id *)&self->_detectionMaskTexture, 0);
  objc_storeStrong((id *)&self->_greenGhostBrightLightTuningParameters, 0);
  objc_storeStrong((id *)&self->_greenGhostBrightLightDetection, 0);
  objc_storeStrong((id *)&self->_vdgMetalUtils, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  uint64_t v3 = 32;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end