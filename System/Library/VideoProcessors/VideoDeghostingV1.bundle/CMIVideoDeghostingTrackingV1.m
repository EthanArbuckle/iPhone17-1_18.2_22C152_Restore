@interface CMIVideoDeghostingTrackingV1
- (BOOL)resetTrackerWithInputGhostBoundingBoxes;
- (CGPoint)_applyDistortionPolynomial:(float *)a3 ToPoint:(CGPoint *)a4;
- (CGPoint)_pixelBufferToRawBuffer:(CGPoint *)a3;
- (CGPoint)_rawBufferToPixelBuffer:(CGPoint *)a3;
- (CGPoint)_reflectPoint:(CGPoint *)a3 pivotPoint:(CGPoint *)a4;
- (CGPoint)bias;
- (CGRect)ghostRectImageBased;
- (CGRect)ghostRectMetadataBased;
- (CGRect)lightSourceRect;
- (CMIMotionSampleRingBufferV1)motionSampleRingBuffer;
- (CMIVideoDeghostingTrackingV1)initWithMetalContext:(id)a3 tuningParameters:(id)a4;
- (NSArray)detectedGhostBoundingBoxes;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)metadataDictionary;
- (NSMutableArray)ghostBoundingBoxPredictions;
- (__CVBuffer)inputPixelBuffer;
- (float)_getRadialMagnificationAtDistanceMM:(float)a3 WithPolynomial:(float *)a4;
- (float)confidence;
- (float)contextScore;
- (float)ghostSizeBias;
- (float)shapeScore;
- (float)trajectoryScore;
- (int)_extractAndCheckTuningParameters:(id)a3;
- (int)_extractCalibrationData;
- (int)adjustedGhostSize;
- (int)process;
- (int)resetState;
- (int)sensorBinningFactorHorizontal;
- (int)sensorBinningFactorVertical;
- (void)_calibrateGhostSizeWithAngle:(float)a3;
- (void)_extractCameraInfo;
- (void)_pushGhostToHistory:(CGPoint *)a3 shapeScore:(float)a4 lensPosition:(float)a5 adjustedPrincipalPoint:(CGPoint *)a6 quaternion:(id *)a7;
- (void)setAdjustedGhostSize:(int)a3;
- (void)setBias:(CGPoint)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setConfidence:(float)a3;
- (void)setContextScore:(float)a3;
- (void)setDetectedGhostBoundingBoxes:(id)a3;
- (void)setGhostBoundingBoxPredictions:(id)a3;
- (void)setGhostRectImageBased:(CGRect)a3;
- (void)setGhostRectMetadataBased:(CGRect)a3;
- (void)setGhostSizeBias:(float)a3;
- (void)setInputPixelBuffer:(__CVBuffer *)a3;
- (void)setLightSourceRect:(CGRect)a3;
- (void)setMetadataDictionary:(id)a3;
- (void)setMotionSampleRingBuffer:(id)a3;
- (void)setResetTrackerWithInputGhostBoundingBoxes:(BOOL)a3;
- (void)setSensorBinningFactorHorizontal:(int)a3;
- (void)setSensorBinningFactorVertical:(int)a3;
- (void)setShapeScore:(float)a3;
- (void)setTrajectoryScore:(float)a3;
@end

@implementation CMIVideoDeghostingTrackingV1

- (CMIVideoDeghostingTrackingV1)initWithMetalContext:(id)a3 tuningParameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CMIVideoDeghostingTrackingV1;
  v8 = [(CMIVideoDeghostingTrackingV1 *)&v19 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_9;
  }
  if ([(CMIVideoDeghostingTrackingV1 *)v8 _extractAndCheckTuningParameters:v7]) {
    goto LABEL_9;
  }
  v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  greenGhostRectangles = v9->_greenGhostRectangles;
  v9->_greenGhostRectangles = v10;

  if (!v9->_greenGhostRectangles) {
    goto LABEL_9;
  }
  v12 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:10];
  ghostBoundingBoxPredictions = v9->_ghostBoundingBoxPredictions;
  v9->_ghostBoundingBoxPredictions = v12;

  if (!v9->_ghostBoundingBoxPredictions) {
    goto LABEL_9;
  }
  if ([(CMIVideoDeghostingTrackingV1 *)v9 resetState]) {
    goto LABEL_9;
  }
  *(void *)&v9->_sensorBinningFactorVertical = 0x100000001;
  motionSampleRingBuffer = v9->_motionSampleRingBuffer;
  v9->_motionSampleRingBuffer = 0;

  v15 = [[VDGMetalUtilsV1 alloc] initWithMetalContext:v6];
  vdgMetalUtils = v9->_vdgMetalUtils;
  v9->_vdgMetalUtils = v15;

  if (v9->_vdgMetalUtils)
  {
    v17 = v9;
  }
  else
  {
LABEL_9:
    fig_log_get_emitter();
    FigDebugAssert3();
    v17 = 0;
  }

  return v17;
}

- (int)resetState
{
  [(NSMutableArray *)self->_greenGhostRectangles removeAllObjects];
  [(NSMutableArray *)self->_ghostBoundingBoxPredictions removeAllObjects];
  detectedGhostBoundingBoxes = self->_detectedGhostBoundingBoxes;
  self->_detectedGhostBoundingBoxes = 0;

  self->_pixelsPerMicron = 1.0;
  CGPoint v4 = CGPointZero;
  self->_adjustedPrincipalPoint = CGPointZero;
  self->_bias = v4;
  self->_ghostHistoryCount = 0;
  self->_trajectoryScore = 0.0;
  *(void *)&self->_prevGhostSizeBias = 0;
  *(_OWORD *)&self->_confidence = 0u;
  self->_breathingDirection = 1.0;
  self->_resetTrackerWithInputGhostBoundingBoxes = 1;
  previousPortType = self->_previousPortType;
  self->_previousPortType = 0;

  currentPortType = self->_currentPortType;
  self->_currentPortType = 0;

  currentCameraInfo = self->_currentCameraInfo;
  self->_currentCameraInfo = 0;

  int v8 = sub_F730(&self->_centerQuaternion.w);
  if (v8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v8;
}

- (int)process
{
  [(NSMutableArray *)self->_ghostBoundingBoxPredictions removeAllObjects];
  CGPoint origin = CGRectZero.origin;
  CGSize size = CGRectZero.size;
  self->_ghostRectImageBased.CGPoint origin = CGRectZero.origin;
  self->_ghostRectImageBased.CGSize size = size;
  self->_ghostRectMetadataBased.CGPoint origin = origin;
  self->_ghostRectMetadataBased.CGSize size = size;
  self->_lightSourceRect.CGPoint origin = origin;
  self->_lightSourceRect.CGSize size = size;
  [(CMIVideoDeghostingTrackingV1 *)self _extractCameraInfo];
  double v99 = 0.0;
  int v5 = sub_F4FC((const __CFDictionary *)self->_metadataDictionary, &v99, 0.5);
  if (v5)
  {
    int v24 = v5;
    fig_log_get_emitter();
    FigDebugAssert3();
    return v24;
  }
  [(CMIMotionSampleRingBufferV1 *)self->_motionSampleRingBuffer computeQuaternionForTimeStamp:v99];
  self->_centerQuaternion.w = v6;
  self->_centerQuaternion.x = v7;
  self->_centerQuaternion.y = v8;
  self->_centerQuaternion.z = v9;
  if (+[CMIMotionSampleRingBufferV1 isUnitQuaternion:&self->_centerQuaternion])
  {
    goto LABEL_26;
  }
  if ([(CMIVideoDeghostingTrackingV1 *)self _extractCalibrationData]) {
    return FigSignalErrorAt();
  }
  if (self->_resetTrackerWithInputGhostBoundingBoxes)
  {
    [(NSMutableArray *)self->_greenGhostRectangles removeAllObjects];
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    v10 = self->_detectedGhostBoundingBoxes;
    id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v95 objects:v102 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v96;
      __asm { FMOV            V0.2D, #0.5 }
      float64x2_t v78 = _Q0;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v96 != v13) {
            objc_enumerationMutation(v10);
          }
          CFDictionaryRef v20 = *(const __CFDictionary **)(*((void *)&v95 + 1) + 8 * i);
          [(NSMutableArray *)self->_greenGhostRectangles addObject:v20];
          memset(&rect, 0, sizeof(rect));
          CGRectMakeWithDictionaryRepresentation(v20, &rect);
          float64x2_t v21 = vmulq_f64((float64x2_t)rect.size, v78);
          float64x2_t v22 = vaddq_f64((float64x2_t)rect.origin, v21);
          v100[0] = v22;
          *(float *)v22.f64 = self->_shapeScore;
          *(float *)v21.f64 = self->_lensPosition;
          [(CMIVideoDeghostingTrackingV1 *)self _pushGhostToHistory:v100 shapeScore:&self->_adjustedPrincipalPoint lensPosition:&self->_centerQuaternion adjustedPrincipalPoint:v22.f64[0] quaternion:v21.f64[0]];
        }
        id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v95 objects:v102 count:16];
      }
      while (v12);
    }

    self->_ghostSizeBias = 0.0;
    self->_prevGhostSizeBias = 0.0;
    self->_prevShapeScore = self->_shapeScore;
    goto LABEL_13;
  }
  self->_float shapeScore = 0.0;
  self->_confidence = 0.0;
  self->_trajectoryScore = 0.0;
  self->_contextScore = 0.0;
  double __x = sub_F6E4(&self->_previousCameraInfo.quaternion.w, (uint64_t *)&self->_centerQuaternion);
  uint64_t v92 = v25;
  uint64_t v93 = v26;
  uint64_t v94 = v27;
  double v28 = acos(__x);
  sub_FA00(&__x, 0, (float *)&rect);
  CGPoint adjustedPrincipalPoint = self->_previousCameraInfo.adjustedPrincipalPoint;
  double v30 = 3.14159265;
  uint64_t v89 = 0;
  *(float *)&uint64_t v89 = self->_previousCameraInfo.lensPosition;
  CGPoint v90 = adjustedPrincipalPoint;
  uint64_t v87 = 0;
  *(float *)&uint64_t v87 = self->_lensPosition;
  CGPoint v88 = self->_adjustedPrincipalPoint;
  sub_F970((uint64_t)&v87, (uint64_t)&v89, (long long *)&rect, (uint64_t)v100);
  CGPoint v86 = CGPointZero;
  float v31 = 0.0;
  if (self->_ghostHistoryCount)
  {
    *(CGPoint *)v84 = self->_ghostHistory[0].ghostLoc;
    [(CMIVideoDeghostingTrackingV1 *)self _reflectPoint:v84 pivotPoint:&self->_previousCameraInfo.adjustedPrincipalPoint];
    *(float *)&double v32 = v32;
    *(float *)&double v33 = v33;
    v82.f64[0] = 0.0;
    sub_10480((float *)v100, (float *)&v82, (float *)v82.f64 + 1, *(float *)&v32, *(float *)&v33);
    float64x2_t v85 = vcvtq_f64_f32(*(float32x2_t *)&v82.f64[0]);
    [(CMIVideoDeghostingTrackingV1 *)self _reflectPoint:&v85 pivotPoint:&self->_adjustedPrincipalPoint];
    v86.x = v34;
    v86.y = v35;
    [(CMIVideoDeghostingTrackingV1 *)self _applyDistortionPolynomial:self->_lensDistortionCoefficients.inverseOrders ToPoint:&v86];
    v86.x = v36;
    v86.y = v37;
    int adjustedGhostSize = self->_adjustedGhostSize;
    int v39 = adjustedGhostSize >= 0 ? self->_adjustedGhostSize : adjustedGhostSize + 1;
    int v40 = v39 >> 1;
    CGFloat v41 = v36 - (double)v40;
    CGFloat v42 = v37 - (double)v40;
    self->_ghostRectMetadataBased.origin.x = v41;
    self->_ghostRectMetadataBased.origin.y = v42;
    self->_ghostRectMetadataBased.size.width = (double)adjustedGhostSize;
    self->_ghostRectMetadataBased.size.height = (double)adjustedGhostSize;
    *(float *)&CGFloat v41 = self->_shapeScoreLambda;
    *(float *)&CGFloat v42 = self->_contextScoreLambda;
    LODWORD(v77) = self->_contextPaddingInPixel;
    [(VDGMetalUtilsV1 *)self->_vdgMetalUtils updateGhostPositionsUsingSourceImageFeatureMatching:&self->_ghostRectMetadataBased shapeScore:&self->_shapeScore contextScore:&self->_contextScore confidenceOut:&self->_confidence pixelBuffer:self->_inputPixelBuffer searchRangeInPixel:self->_adjustedSearchRange shapeScoreLambda:v41 contextScoreLambda:v42 contextPaddingInPixel:v77];
    self->_ghostRectImageBased.origin.x = v43;
    self->_ghostRectImageBased.origin.y = v44;
    self->_ghostRectImageBased.size.width = v103.size.width;
    self->_ghostRectImageBased.size.height = v103.size.height;
    v103.origin.x = (v43 + self->_ghostRectMetadataBased.origin.x) * 0.5;
    v103.origin.y = (v44 + self->_ghostRectMetadataBased.origin.y) * 0.5;
    v86.x = v103.size.width * 0.5 + v103.origin.x;
    v86.y = v103.size.height * 0.5 + v103.origin.y;
    greenGhostRectangles = self->_greenGhostRectangles;
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v103);
    [(NSMutableArray *)greenGhostRectangles replaceObjectAtIndex:0 withObject:DictionaryRepresentation];

    if (self->_ghostHistoryCount)
    {
      double v79 = v28;
      unint64_t v47 = 0;
      p_float shapeScore = &self->_ghostHistory[0].shapeScore;
      do
      {
        double __x = sub_F6E4((double *)p_shapeScore - 6, (uint64_t *)&self->_centerQuaternion);
        uint64_t v92 = v49;
        uint64_t v93 = v50;
        uint64_t v94 = v51;
        sub_FA00(&__x, 0, (float *)&rect);
        *(void *)v84 = 0;
        v84[0] = *(p_shapeScore - 18);
        *(_OWORD *)&v84[2] = *((_OWORD *)p_shapeScore - 4);
        sub_F970((uint64_t)&v87, (uint64_t)v84, (long long *)&rect, (uint64_t)v100);
        float64x2_t v85 = *(float64x2_t *)(p_shapeScore - 4);
        [(CMIVideoDeghostingTrackingV1 *)self _reflectPoint:&v85 pivotPoint:p_shapeScore - 16];
        *(float *)&double v52 = v52;
        *(float *)&double v53 = v53;
        float32x2_t v83 = 0;
        sub_10480((float *)v100, (float *)&v83, (float *)&v83 + 1, *(float *)&v52, *(float *)&v53);
        long double v54 = acos(__x);
        *(float *)&long double v54 = (v54 + v54) / v30 * 180.0;
        float v55 = (float)((float)((float)(*(float *)&v54 + -18.0) / 15.0) * 15.0) + 18.0;
        if (v55 > 10.0) {
          float v55 = 10.0;
        }
        float64x2_t v82 = vcvtq_f64_f32(v83);
        float v56 = (float)(self->_lensPosition / -1630.0) * fmaxf(v55, 5.0);
        double v80 = 0.0;
        double v81 = 0.0;
        [(CMIVideoDeghostingTrackingV1 *)self _reflectPoint:&v82 pivotPoint:&self->_adjustedPrincipalPoint];
        double v80 = v57;
        double v81 = v58;
        [(CMIVideoDeghostingTrackingV1 *)self _applyDistortionPolynomial:self->_lensDistortionCoefficients.inverseOrders ToPoint:&v80];
        double v80 = v59;
        double v81 = v60;
        float v61 = v59 - v86.x;
        float v62 = v60 - v86.y;
        double v63 = v30;
        float v64 = sqrtf((float)(v62 * v62) + (float)(v61 * v61));
        v104.origin.x = v59 + -1.0;
        v104.origin.y = v60 + -1.0;
        ghostBoundingBoxPredictions = self->_ghostBoundingBoxPredictions;
        v104.size.width = 2.0;
        v104.size.height = 2.0;
        CFDictionaryRef v66 = CGRectCreateDictionaryRepresentation(v104);
        [(NSMutableArray *)ghostBoundingBoxPredictions addObject:v66];

        float v67 = v64 / v56;
        double v30 = v63;
        float v68 = *p_shapeScore;
        p_shapeScore += 20;
        self->_trajectoryScore = self->_trajectoryScore + (float)(v68 * (float)(v67 + 1.0));
        ++v47;
        unint64_t ghostHistoryCount = self->_ghostHistoryCount;
      }
      while (v47 < ghostHistoryCount);
      float v31 = (float)ghostHistoryCount;
      double v28 = v79;
    }
  }
  float minShapeScore = self->_minShapeScore;
  float shapeScore = self->_shapeScore;
  if (shapeScore < (float)((float)((float)(v31 / -10.0) + 1.0) * minShapeScore)
    || (float)(shapeScore + self->_trajectoryScore) < minShapeScore)
  {
LABEL_26:
    [(CMIVideoDeghostingTrackingV1 *)self resetState];
    return 0;
  }
  float v73 = (v28 + v28) / v30 * 180.0;
  objc_storeStrong((id *)&self->_detectedGhostBoundingBoxes, self->_greenGhostRectangles);
  *(float *)&double v74 = self->_shapeScore;
  *(float *)&double v75 = self->_lensPosition;
  [(CMIVideoDeghostingTrackingV1 *)self _pushGhostToHistory:&v86 shapeScore:&self->_adjustedPrincipalPoint lensPosition:&self->_centerQuaternion adjustedPrincipalPoint:v74 quaternion:v75];
  *(float *)&double v76 = v73;
  [(CMIVideoDeghostingTrackingV1 *)self _calibrateGhostSizeWithAngle:v76];
LABEL_13:
  self->_previousCameraInfo.lensPosition = self->_lensPosition;
  self->_previousCameraInfo.CGPoint adjustedPrincipalPoint = self->_adjustedPrincipalPoint;
  long long v23 = *(_OWORD *)&self->_centerQuaternion.y;
  *(_OWORD *)&self->_previousCameraInfo.quaternion.w = *(_OWORD *)&self->_centerQuaternion.w;
  *(_OWORD *)&self->_previousCameraInfo.quaternion.y = v23;
  objc_storeStrong((id *)&self->_previousPortType, self->_currentPortType);
  int v24 = 0;
  self->_resetTrackerWithInputGhostBoundingBoxes = 0;
  return v24;
}

- (void)_calibrateGhostSizeWithAngle:(float)a3
{
  float pixelScale = self->_pixelScale;
  float v5 = pixelScale * self->_minBreathingMagnitude;
  float shapeScore = self->_shapeScore;
  if (shapeScore > self->_minShapeScore)
  {
    float ghostSizeBias = self->_ghostSizeBias;
    float prevGhostSizeBias = self->_prevGhostSizeBias;
    float maxBreathingMagnitude = self->_maxBreathingMagnitude;
    float v10 = -(float)(pixelScale * maxBreathingMagnitude);
    if (ghostSizeBias != prevGhostSizeBias)
    {
      if (ghostSizeBias <= prevGhostSizeBias) {
        float v11 = -(float)(shapeScore - self->_prevShapeScore);
      }
      else {
        float v11 = shapeScore - self->_prevShapeScore;
      }
      float v12 = self->_contextScore * (float)(v11 * (float)(pixelScale * self->_slopeMultiplier));
      float v10 = v12 * expf((float)-a3 / self->_angularHalfLife);
    }
    float v13 = pixelScale * maxBreathingMagnitude;
    if ((float)(pixelScale * maxBreathingMagnitude) >= v10) {
      float v14 = v10;
    }
    else {
      float v14 = pixelScale * maxBreathingMagnitude;
    }
    if ((float)-(float)(pixelScale * maxBreathingMagnitude) >= v14) {
      float v14 = -(float)(pixelScale * maxBreathingMagnitude);
    }
    float v15 = ghostSizeBias + v14;
    float v16 = maxBreathingMagnitude * fabsf(v14);
    if (v13 >= v16) {
      float v13 = v16;
    }
    self->_float prevGhostSizeBias = ghostSizeBias;
    if (v5 < v13) {
      float v5 = v13;
    }
    self->_float ghostSizeBias = v15;
    self->_prevShapeScore = shapeScore;
  }
  float v17 = -self->_breathingDirection;
  self->_breathingDirection = v17;
  if ((float)(pixelScale * self->_minGhostSize) > (float)self->_adjustedGhostSize)
  {
    self->_breathingDirection = 1.0;
    float v17 = 1.0;
  }
  float minGhostSizeBias = self->_ghostSizeBias + (float)(v17 * v5);
  if (self->_minGhostSizeBias >= minGhostSizeBias) {
    float minGhostSizeBias = self->_minGhostSizeBias;
  }
  if (self->_maxGhostSizeBias < minGhostSizeBias) {
    float minGhostSizeBias = self->_maxGhostSizeBias;
  }
  self->_float ghostSizeBias = minGhostSizeBias;
}

- (void)_pushGhostToHistory:(CGPoint *)a3 shapeScore:(float)a4 lensPosition:(float)a5 adjustedPrincipalPoint:(CGPoint *)a6 quaternion:(id *)a7
{
  unsigned int ghostHistoryCount = self->_ghostHistoryCount;
  if (ghostHistoryCount >= 9) {
    unsigned int v14 = 9;
  }
  else {
    unsigned int v14 = self->_ghostHistoryCount;
  }
  if (v14)
  {
    if (ghostHistoryCount >= 9) {
      uint64_t v15 = 9;
    }
    else {
      uint64_t v15 = ghostHistoryCount;
    }
    unint64_t v16 = v15 + 1;
    float v17 = &self->_ghostHistory[v15];
    do
    {
      long long v18 = *(_OWORD *)&v17[-1].quaternion.z;
      *(_OWORD *)&v17->quaternion.x = *(_OWORD *)&v17[-1].quaternion.x;
      *(_OWORD *)&v17->quaternion.z = v18;
      *(_OWORD *)&v17->ghostLoc.y = *(_OWORD *)&v17[-1].ghostLoc.y;
      long long v19 = *(_OWORD *)&v17[-1].adjustedPrincipalPoint.y;
      *(_OWORD *)&v17->lensPosition = *(_OWORD *)&v17[-1].lensPosition;
      *(_OWORD *)&v17->adjustedPrincipalPoint.y = v19;
      --v17;
      --v16;
    }
    while (v16 > 1);
  }
  [(CMIVideoDeghostingTrackingV1 *)self _reflectPoint:a3 pivotPoint:&self->_adjustedPrincipalPoint];
  self->_lightSourceRect.origin.x = v20 + -1.0;
  self->_lightSourceRect.origin.y = v21 + -1.0;
  self->_lightSourceRect.size.width = 2.0;
  self->_lightSourceRect.size.height = 2.0;
  [(CMIVideoDeghostingTrackingV1 *)self _applyDistortionPolynomial:&self->_lensDistortionCoefficients ToPoint:a3];
  self->_ghostHistory[0].ghostLoc.x = v22;
  self->_ghostHistory[0].ghostLoc.y = v23;
  self->_ghostHistory[0].float shapeScore = a4;
  self->_ghostHistory[0].lensPosition = a5;
  self->_ghostHistory[0].CGPoint adjustedPrincipalPoint = *a6;
  long long v24 = *(_OWORD *)&a7->var2;
  *(_OWORD *)&self->_ghostHistory[0].quaternion.w = *(_OWORD *)&a7->var0;
  *(_OWORD *)&self->_ghostHistory[0].quaternion.y = v24;
  self->_unsigned int ghostHistoryCount = v14 + 1;
}

- (int)_extractAndCheckTuningParameters:(id)a3
{
  id v4 = a3;
  float v5 = v4;
  if (!v4) {
    goto LABEL_17;
  }
  double v6 = [v4 objectForKeyedSubscript:@"MinShapeScore"];

  if (!v6) {
    goto LABEL_17;
  }
  double v7 = [v5 objectForKeyedSubscript:@"GhostSize"];

  if (!v7) {
    goto LABEL_17;
  }
  double v8 = [v5 objectForKeyedSubscript:@"MinGhostSizeBias"];

  if (!v8) {
    goto LABEL_17;
  }
  double v9 = [v5 objectForKeyedSubscript:@"MaxGhostSizeBias"];

  if (!v9) {
    goto LABEL_17;
  }
  float v10 = [v5 objectForKeyedSubscript:@"MinGhostSize"];

  if (!v10) {
    goto LABEL_17;
  }
  float v11 = [v5 objectForKeyedSubscript:@"MinBreathingMagnitude"];

  if (!v11) {
    goto LABEL_17;
  }
  float v12 = [v5 objectForKeyedSubscript:@"MaxBreathingMagnitude"];

  if (!v12) {
    goto LABEL_17;
  }
  float v13 = [v5 objectForKeyedSubscript:@"SlopeMultiplier"];

  if (!v13) {
    goto LABEL_17;
  }
  unsigned int v14 = [v5 objectForKeyedSubscript:@"AngularHalfLife"];

  if (!v14) {
    goto LABEL_17;
  }
  uint64_t v15 = [v5 objectForKeyedSubscript:@"SearchRangeInPixel"];

  if (!v15) {
    goto LABEL_17;
  }
  unint64_t v16 = [v5 objectForKeyedSubscript:@"ShapeScoreLambda"];

  if (!v16) {
    goto LABEL_17;
  }
  float v17 = [v5 objectForKeyedSubscript:@"ContextScoreLambda"];

  if (v17
    && ([v5 objectForKeyedSubscript:@"ContextPaddingInPixel"],
        long long v18 = objc_claimAutoreleasedReturnValue(),
        v18,
        v18))
  {
    long long v19 = [v5 objectForKeyedSubscript:@"MinShapeScore"];
    [v19 floatValue];
    self->_float minShapeScore = v20;

    double v21 = [v5 objectForKeyedSubscript:@"GhostSize"];
    self->_ghostSize = [v21 intValue];

    CGFloat v22 = [v5 objectForKeyedSubscript:@"MinGhostSizeBias"];
    [v22 floatValue];
    self->_float minGhostSizeBias = v23;

    long long v24 = [v5 objectForKeyedSubscript:@"MaxGhostSizeBias"];
    [v24 floatValue];
    self->_maxGhostSizeBias = v25;

    uint64_t v26 = [v5 objectForKeyedSubscript:@"MinGhostSize"];
    [v26 floatValue];
    self->_minGhostSize = v27;

    double v28 = [v5 objectForKeyedSubscript:@"MinBreathingMagnitude"];
    [v28 floatValue];
    self->_minBreathingMagnitude = v29;

    double v30 = [v5 objectForKeyedSubscript:@"MaxBreathingMagnitude"];
    [v30 floatValue];
    self->_float maxBreathingMagnitude = v31;

    double v32 = [v5 objectForKeyedSubscript:@"SlopeMultiplier"];
    [v32 floatValue];
    self->_slopeMultiplier = v33;

    CGFloat v34 = [v5 objectForKeyedSubscript:@"AngularHalfLife"];
    [v34 floatValue];
    self->_angularHalfLife = v35;

    double v36 = [v5 objectForKeyedSubscript:@"SearchRangeInPixel"];
    self->_searchRangeInPixel = [v36 intValue];

    double v37 = [v5 objectForKeyedSubscript:@"ShapeScoreLambda"];
    [v37 floatValue];
    self->_shapeScoreLambda = v38;

    int v39 = [v5 objectForKeyedSubscript:@"ContextScoreLambda"];
    [v39 floatValue];
    self->_contextScoreLambda = v40;

    CGFloat v41 = [v5 objectForKeyedSubscript:@"ContextPaddingInPixel"];
    self->_contextPaddingInPixel = [v41 intValue];

    int v42 = 0;
  }
  else
  {
LABEL_17:
    int v42 = FigSignalErrorAt();
  }

  return v42;
}

- (void)_extractCameraInfo
{
  v3 = [(NSDictionary *)self->_metadataDictionary objectForKeyedSubscript:kFigCaptureStreamMetadata_PortType];
  currentPortType = self->_currentPortType;
  self->_currentPortType = v3;

  if (!self->_cameraInfoByPortType)
  {
    float v5 = [(NSDictionary *)self->_metadataDictionary objectForKeyedSubscript:kFigCaptureSampleBufferProcessorOption_CameraInfoByPortType];
    cameraInfoByPortType = self->_cameraInfoByPortType;
    self->_cameraInfoByPortType = v5;
  }
  if (![(NSString *)self->_currentPortType isEqualToString:self->_previousPortType])
  {
    double v7 = self->_cameraInfoByPortType;
    if (v7)
    {
      double v8 = [(NSDictionary *)v7 objectForKeyedSubscript:self->_currentPortType];
      currentCameraInfo = self->_currentCameraInfo;
      self->_currentCameraInfo = v8;

      float v10 = [(NSDictionary *)self->_currentCameraInfo objectForKeyedSubscript:kFigCaptureCameraInfoKey_PixelSize];
      [v10 floatValue];
      float v12 = v11;

      float v13 = 1.0;
      if (v12 > 0.0) {
        float v13 = 1.0 / v12;
      }
      self->_pixelsPerMicron = v13;
      p_lensDistortionCorrectionBasePolynomial = &self->_lensDistortionCorrectionBasePolynomial;
      *(_OWORD *)self->_lensDistortionCorrectionBasePolynomial.forwardOrders = 0u;
      *(_OWORD *)&self->_lensDistortionCorrectionBasePolynomial.forwardOrders[4] = 0u;
      *(_OWORD *)self->_lensDistortionCorrectionBasePolynomial.inverseOrders = 0u;
      *(_OWORD *)&self->_lensDistortionCorrectionBasePolynomial.inverseOrders[4] = 0u;
      p_lensDistortionCorrectionDynamicPolynomial = &self->_lensDistortionCorrectionDynamicPolynomial;
      *(_OWORD *)self->_lensDistortionCorrectionDynamicPolynomial.forwardOrders = 0u;
      *(_OWORD *)&self->_lensDistortionCorrectionDynamicPolynomial.forwardOrders[4] = 0u;
      *(_OWORD *)self->_lensDistortionCorrectionDynamicPolynomial.inverseOrders = 0u;
      *(_OWORD *)&self->_lensDistortionCorrectionDynamicPolynomial.inverseOrders[4] = 0u;
      unint64_t v16 = [(NSDictionary *)self->_currentCameraInfo objectForKeyedSubscript:kFigCaptureCameraInfoKey_GeometricDistortionCoefficients];
      if (v16)
      {
        id v29 = v16;
        float v17 = [v16 objectForKeyedSubscript:kFigCaptureStreamGDCCoefficientsKey_BasePolynomial];
        long long v18 = v17;
        if (v17)
        {
          long long v19 = (long long *)[v17 bytes];
          long long v20 = v19[3];
          long long v22 = *v19;
          long long v21 = v19[1];
          *(_OWORD *)p_lensDistortionCorrectionBasePolynomial->inverseOrders = v19[2];
          *(_OWORD *)&p_lensDistortionCorrectionBasePolynomial->inverseOrders[4] = v20;
          *(_OWORD *)p_lensDistortionCorrectionBasePolynomial->forwardOrders = v22;
          *(_OWORD *)&p_lensDistortionCorrectionBasePolynomial->forwardOrders[4] = v21;
        }
        float v23 = [v29 objectForKeyedSubscript:kFigCaptureStreamGDCCoefficientsKey_DynamicPolynomial];
        long long v24 = v23;
        if (v23)
        {
          float v25 = (long long *)[v23 bytes];
          long long v26 = v25[3];
          long long v28 = *v25;
          long long v27 = v25[1];
          *(_OWORD *)p_lensDistortionCorrectionDynamicPolynomial->inverseOrders = v25[2];
          *(_OWORD *)&p_lensDistortionCorrectionDynamicPolynomial->inverseOrders[4] = v26;
          *(_OWORD *)p_lensDistortionCorrectionDynamicPolynomial->forwardOrders = v28;
          *(_OWORD *)&p_lensDistortionCorrectionDynamicPolynomial->forwardOrders[4] = v27;
        }

        unint64_t v16 = v29;
      }
    }
  }
}

- (int)_extractCalibrationData
{
  id v4 = [(NSDictionary *)self->_metadataDictionary objectForKeyedSubscript:kFigCaptureStreamMetadata_SphereMode];
  BOOL v5 = v4 != 0;

  double v6 = [(NSDictionary *)self->_metadataDictionary objectForKeyedSubscript:kFigMotionAttachmentsSampleBufferProcessorMetadata_FramePTSSeconds];
  [v6 doubleValue];
  double v8 = v7;

  if (v8 == 0.0)
  {
    CFDictionaryRef v9 = [(NSDictionary *)self->_metadataDictionary objectForKeyedSubscript:kFigCaptureSampleBufferAttachmentKey_OriginalPresentationTimeStamp];
    CMTimeMakeFromDictionary(&time, v9);
    CMTimeGetSeconds(&time);
    uint64_t v73 = 0;
    int v10 = sub_E8F0((const __CFDictionary *)self->_metadataDictionary, (double *)&v73);

    if (v10) {
      return v10;
    }
  }
  float v11 = [(NSDictionary *)self->_metadataDictionary objectForKeyedSubscript:kFigCaptureStreamMetadata_PinholeCameraFocalLength];
  [v11 floatValue];
  float v13 = v12;

  if (v13 == 0.0)
  {
    fig_log_get_emitter();
LABEL_29:
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  self->_pixelBufferWidth = CVPixelBufferGetWidth(self->_inputPixelBuffer);
  self->_pixelBufferHeight = CVPixelBufferGetHeight(self->_inputPixelBuffer);
  unsigned int v14 = [(NSDictionary *)self->_metadataDictionary objectForKeyedSubscript:kFigCaptureStreamMetadata_RawSensorWidth];
  self->_rawSensorWidth = [v14 intValue];

  uint64_t v15 = [(NSDictionary *)self->_metadataDictionary objectForKeyedSubscript:kFigCaptureStreamMetadata_RawSensorHeight];
  self->_rawSensorHeight = [v15 intValue];

  uint64_t v16 = *(void *)&self->_pixelBufferWidth;
  v17.i64[0] = v16;
  v17.i64[1] = HIDWORD(v16);
  __asm { FMOV            V1.2D, #-1.0 }
  float64x2_t v23 = vaddq_f64(vcvtq_f64_u64(v17), _Q1);
  uint64_t v24 = *(void *)&self->_rawSensorWidth;
  v17.i64[0] = v24;
  v17.i64[1] = HIDWORD(v24);
  __asm { FMOV            V2.2D, #0.5 }
  self->_pixelBufferCenter = (CGPoint)vmulq_f64(v23, _Q2);
  self->_rawSensorCenter = (CGPoint)vmulq_f64(vaddq_f64(vcvtq_f64_u64(v17), _Q1), _Q2);
  long long v26 = [(NSDictionary *)self->_metadataDictionary objectForKeyedSubscript:kFigCaptureStreamMetadata_QuadraBinningFactor];
  int v27 = [v26 intValue];

  if (v27 <= 1) {
    int v28 = 1;
  }
  else {
    int v28 = v27;
  }
  int v29 = self->_sensorBinningFactorHorizontal * v28;
  uint64_t v30 = (self->_sensorBinningFactorVertical * v28);
  float v31 = [(NSDictionary *)self->_metadataDictionary objectForKeyedSubscript:kFigMotionAttachmentsSampleBufferProcessorMetadata_ScalingFactor];
  [v31 floatValue];
  self->_float scalingFactor = v32;

  float scalingFactor = self->_scalingFactor;
  if (scalingFactor == 0.0)
  {
    int v34 = sub_E4E0((const __CFDictionary *)self->_metadataDictionary, self->_pixelBufferWidth, self->_pixelBufferHeight, v29, v30, &self->_scalingFactor);
    if (v34) {
      return v34;
    }
    float scalingFactor = self->_scalingFactor;
  }
  float pixelsPerMicron = self->_pixelsPerMicron;
  self->_lensPosition = (float)(v13 * scalingFactor) * pixelsPerMicron;
  self->_CGPoint adjustedPrincipalPoint = CGPointZero;
  int v34 = sub_10228((const __CFDictionary *)self->_metadataDictionary, self->_pixelBufferWidth, self->_pixelBufferHeight, v29, v30, v5, (float64x2_t *)&self->_adjustedPrincipalPoint, pixelsPerMicron, scalingFactor);
  if (v34) {
    return v34;
  }
  CGSize size = CGRectNull.size;
  rect.CGPoint origin = CGRectNull.origin;
  rect.CGSize size = size;
  CFDictionaryRef v37 = [(NSDictionary *)self->_metadataDictionary objectForKeyedSubscript:kFigCaptureStreamMetadata_ValidBufferRect];
  BOOL v38 = CGRectMakeWithDictionaryRepresentation(v37, &rect);

  if (v38 && !CGRectIsEmpty(rect) && !CGRectContainsPoint(rect, self->_adjustedPrincipalPoint))
  {
    fig_log_get_emitter();
    uint64_t v70 = v2;
    LODWORD(v69) = 0;
    FigDebugAssert3();
  }
  int v39 = -[NSDictionary objectForKeyedSubscript:](self->_metadataDictionary, "objectForKeyedSubscript:", kFigCaptureStreamMetadata_Fnumber, v69, v70);
  [v39 floatValue];
  float v41 = v40;

  int v42 = [(NSDictionary *)self->_metadataDictionary objectForKeyedSubscript:kFigCaptureStreamMetadata_EffectiveFocalLength];
  [v42 floatValue];
  float v44 = v43;

  v45 = [(NSDictionary *)self->_metadataDictionary objectForKeyedSubscript:kFigCaptureStreamMetadata_PracticalFocalLength];
  [v45 floatValue];
  float v47 = v46;

  if (v41 <= 0.0)
  {
    fig_log_get_emitter();
    goto LABEL_29;
  }
  float v48 = (float)(vabds_f32(v44, v47) * self->_scalingFactor) * self->_pixelsPerMicron;
  float v49 = self->_lensPosition / 1630.0;
  self->_float pixelScale = v49;
  float v50 = (float)((float)(v48 + v48) / v41) + (float)(v49 * (float)self->_ghostSize);
  float ghostSizeBias = self->_ghostSizeBias;
  float v52 = ghostSizeBias + v50;
  self->_int adjustedGhostSize = llroundf(v52);
  self->_adjustedSearchRange = llroundf(v49 * (float)self->_searchRangeInPixel);
  float v53 = v49 * self->_minGhostSize;
  float v54 = (float)(int)roundf(v52);
  if (v53 > v54)
  {
    self->_float ghostSizeBias = ghostSizeBias + (float)(v53 - v54);
    self->_int adjustedGhostSize = (int)v53;
  }
  uint64_t v55 = kFigCaptureStreamMetadata_DynamicDistortionFactor;
  float v56 = [(NSDictionary *)self->_metadataDictionary objectForKey:kFigCaptureStreamMetadata_DynamicDistortionFactor];

  if (v56)
  {
    double v58 = [(NSDictionary *)self->_metadataDictionary objectForKeyedSubscript:v55];
    [v58 floatValue];
    int32x2_t v71 = v59;

    int32x2_t v57 = v71;
  }
  else
  {
    v57.i32[0] = 1.0;
  }
  uint64_t v60 = 0;
  float32x4_t v61 = (float32x4_t)vdupq_lane_s32(v57, 0);
  do
  {
    *(float32x4_t *)&self->_lensDistortionCoefficients.forwardOrders[v60] = vmlaq_f32(*(float32x4_t *)&self->_lensDistortionCorrectionBasePolynomial.forwardOrders[v60], v61, *(float32x4_t *)&self->_lensDistortionCorrectionDynamicPolynomial.forwardOrders[v60]);
    *(float32x4_t *)&self->_lensDistortionCoefficients.inverseOrders[v60] = vmlaq_f32(*(float32x4_t *)&self->_lensDistortionCorrectionBasePolynomial.inverseOrders[v60], v61, *(float32x4_t *)&self->_lensDistortionCorrectionDynamicPolynomial.inverseOrders[v60]);
    v60 += 4;
  }
  while (v60 != 8);
  [(CMIVideoDeghostingTrackingV1 *)self _pixelBufferToRawBuffer:&self->_adjustedPrincipalPoint];
  self->_distortionOpticalCenterRaw.x = v62;
  self->_distortionOpticalCenterRaw.y = v63;
  uint64_t v64 = kFigCaptureStreamMetadata_DistortionOpticalCenter;
  v65 = [(NSDictionary *)self->_metadataDictionary objectForKey:kFigCaptureStreamMetadata_DistortionOpticalCenter];

  if (v65)
  {
    p_distortionOpticalCenterRaw = &self->_distortionOpticalCenterRaw;
    CFDictionaryRef v67 = [(NSDictionary *)self->_metadataDictionary objectForKeyedSubscript:v64];
    CGPointMakeWithDictionaryRepresentation(v67, p_distortionOpticalCenterRaw);
  }
  return 0;
}

- (CGPoint)_reflectPoint:(CGPoint *)a3 pivotPoint:(CGPoint *)a4
{
  __asm { FMOV            V2.2D, #2.0 }
  float64x2_t v9 = vaddq_f64(vmlaq_f64(vnegq_f64(*(float64x2_t *)a3), _Q2, *(float64x2_t *)a4), (float64x2_t)self->_bias);
  double v10 = v9.f64[1];
  result.x = v9.f64[0];
  result.y = v10;
  return result;
}

- (CGPoint)_applyDistortionPolynomial:(float *)a3 ToPoint:(CGPoint *)a4
{
  [(CMIVideoDeghostingTrackingV1 *)self _pixelBufferToRawBuffer:a4];
  double v7 = v6 - self->_distortionOpticalCenterRaw.x;
  double v9 = v8 - self->_distortionOpticalCenterRaw.y;
  double v10 = v9 * v9 + v7 * v7;
  *(float *)&double v10 = v10;
  *(float *)&double v10 = (float)(0.001 / self->_pixelsPerMicron) * sqrtf(*(float *)&v10);
  [(CMIVideoDeghostingTrackingV1 *)self _getRadialMagnificationAtDistanceMM:a3 WithPolynomial:v10];
  double v12 = v11;
  CGFloat v13 = self->_distortionOpticalCenterRaw.x + v7 * v12;
  CGFloat v14 = self->_distortionOpticalCenterRaw.y + v9 * v12;
  *(CGFloat *)uint64x2_t v17 = v13;
  *(CGFloat *)&v17[1] = v14;
  [(CMIVideoDeghostingTrackingV1 *)self _rawBufferToPixelBuffer:v17];
  result.y = v16;
  result.x = v15;
  return result;
}

- (float)_getRadialMagnificationAtDistanceMM:(float)a3 WithPolynomial:(float *)a4
{
  float v4 = a3 * a3;
  float v5 = v4 * (float)(v4 * v4);
  float v6 = v4 * (float)(v4 * v5);
  return 1.0
       / (float)((float)((float)((float)((float)((float)((float)((float)((float)(*a4 + (float)(v4 * a4[1]))
                                                                       + (float)((float)(v4 * v4) * a4[2]))
                                                               + (float)(v5 * a4[3]))
                                                       + (float)((float)(v4 * v5) * a4[4]))
                                               + (float)(v6 * a4[5]))
                                       + (float)((float)(v4 * v6) * a4[6]))
                               + (float)((float)(v4 * (float)(v4 * v6)) * a4[7]))
                       / 100.0)
               + 1.0);
}

- (CGPoint)_pixelBufferToRawBuffer:(CGPoint *)a3
{
  float64x2_t v3 = vaddq_f64((float64x2_t)self->_rawSensorCenter, vdivq_f64(vsubq_f64(*(float64x2_t *)a3, (float64x2_t)self->_pixelBufferCenter), (float64x2_t)vdupq_lane_s64(COERCE__INT64(self->_scalingFactor), 0)));
  double v4 = v3.f64[1];
  result.x = v3.f64[0];
  result.y = v4;
  return result;
}

- (CGPoint)_rawBufferToPixelBuffer:(CGPoint *)a3
{
  double scalingFactor = self->_scalingFactor;
  double v4 = self->_pixelBufferCenter.x + (a3->x - self->_rawSensorCenter.x) * scalingFactor;
  double v5 = self->_pixelBufferCenter.y + (a3->y - self->_rawSensorCenter.y) * scalingFactor;
  result.y = v5;
  result.x = v4;
  return result;
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
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

- (BOOL)resetTrackerWithInputGhostBoundingBoxes
{
  return self->_resetTrackerWithInputGhostBoundingBoxes;
}

- (void)setResetTrackerWithInputGhostBoundingBoxes:(BOOL)a3
{
  self->_resetTrackerWithInputGhostBoundingBoxes = a3;
}

- (NSArray)detectedGhostBoundingBoxes
{
  return self->_detectedGhostBoundingBoxes;
}

- (void)setDetectedGhostBoundingBoxes:(id)a3
{
}

- (CGPoint)bias
{
  double x = self->_bias.x;
  double y = self->_bias.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBias:(CGPoint)a3
{
  self->_bias = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (float)shapeScore
{
  return self->_shapeScore;
}

- (void)setShapeScore:(float)a3
{
  self->_float shapeScore = a3;
}

- (float)contextScore
{
  return self->_contextScore;
}

- (void)setContextScore:(float)a3
{
  self->_contextScore = a3;
}

- (float)trajectoryScore
{
  return self->_trajectoryScore;
}

- (void)setTrajectoryScore:(float)a3
{
  self->_trajectoryScore = a3;
}

- (float)ghostSizeBias
{
  return self->_ghostSizeBias;
}

- (void)setGhostSizeBias:(float)a3
{
  self->_float ghostSizeBias = a3;
}

- (int)adjustedGhostSize
{
  return self->_adjustedGhostSize;
}

- (void)setAdjustedGhostSize:(int)a3
{
  self->_int adjustedGhostSize = a3;
}

- (CGRect)ghostRectMetadataBased
{
  double x = self->_ghostRectMetadataBased.origin.x;
  double y = self->_ghostRectMetadataBased.origin.y;
  double width = self->_ghostRectMetadataBased.size.width;
  double height = self->_ghostRectMetadataBased.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setGhostRectMetadataBased:(CGRect)a3
{
  self->_ghostRectMetadataBased = a3;
}

- (CGRect)ghostRectImageBased
{
  double x = self->_ghostRectImageBased.origin.x;
  double y = self->_ghostRectImageBased.origin.y;
  double width = self->_ghostRectImageBased.size.width;
  double height = self->_ghostRectImageBased.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setGhostRectImageBased:(CGRect)a3
{
  self->_ghostRectImageBased = a3;
}

- (CGRect)lightSourceRect
{
  double x = self->_lightSourceRect.origin.x;
  double y = self->_lightSourceRect.origin.y;
  double width = self->_lightSourceRect.size.width;
  double height = self->_lightSourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLightSourceRect:(CGRect)a3
{
  self->_lightSourceRect = a3;
}

- (NSMutableArray)ghostBoundingBoxPredictions
{
  return self->_ghostBoundingBoxPredictions;
}

- (void)setGhostBoundingBoxPredictions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ghostBoundingBoxPredictions, 0);
  objc_storeStrong((id *)&self->_detectedGhostBoundingBoxes, 0);
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
  objc_storeStrong((id *)&self->_motionSampleRingBuffer, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_vdgMetalUtils, 0);
  objc_storeStrong((id *)&self->_currentCameraInfo, 0);
  objc_storeStrong((id *)&self->_currentPortType, 0);
  objc_storeStrong((id *)&self->_previousPortType, 0);

  objc_storeStrong((id *)&self->_greenGhostRectangles, 0);
}

@end