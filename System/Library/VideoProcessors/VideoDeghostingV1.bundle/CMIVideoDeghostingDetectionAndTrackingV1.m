@interface CMIVideoDeghostingDetectionAndTrackingV1
- (BOOL)_lightSourceRecentlyAppeared:(BOOL)a3;
- (BOOL)_longTrackFailedForLastFrame;
- (BOOL)_runDetectionOnImage:(__CVBuffer *)a3 metadataDictionary:(id)a4;
- (BOOL)_runTrackingOnImage:(__CVBuffer *)a3 metadataDictionary:(id)a4;
- (CMIVideoDeghostingDetectionAndTrackingV1)initWithMetalContext:(id)a3 imageDimensions:(id)a4 tuningParameters:(id)a5;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)detectionResult;
- (NSDictionary)tuningParameters;
- (int)_addMotionDataToRingBuffer:(id)a3;
- (int)_extractAndCheckTuningParameters:(id)a3;
- (int)finishProcessing;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)process;
- (int)purgeResources;
- (int)resetState;
- (int)sensorBinningFactorHorizontal;
- (int)sensorBinningFactorVertical;
- (int)setup;
- (opaqueCMSampleBuffer)inputSampleBuffer;
- (void)dealloc;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setInputSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setSensorBinningFactorHorizontal:(int)a3;
- (void)setSensorBinningFactorVertical:(int)a3;
- (void)setTuningParameters:(id)a3;
@end

@implementation CMIVideoDeghostingDetectionAndTrackingV1

- (CMIVideoDeghostingDetectionAndTrackingV1)initWithMetalContext:(id)a3 imageDimensions:(id)a4 tuningParameters:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v42.receiver = self;
  v42.super_class = (Class)CMIVideoDeghostingDetectionAndTrackingV1;
  v11 = [(CMIVideoDeghostingDetectionAndTrackingV1 *)&v42 init];
  v12 = v11;
  if (!v11
    || [(CMIVideoDeghostingDetectionAndTrackingV1 *)v11 _extractAndCheckTuningParameters:v10])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v37 = 0;
    v14 = 0;
    v16 = 0;
    goto LABEL_10;
  }
  $2825F4736939C4A6D3AD43837233062D v39 = a4;
  id v41 = v9;
  v13 = [v10 objectForKeyedSubscript:@"Detection"];
  v14 = +[NSMutableDictionary dictionaryWithDictionary:v13];

  v15 = [v10 objectForKeyedSubscript:@"Tracking"];
  v16 = +[NSMutableDictionary dictionaryWithDictionary:v15];

  v17 = [v10 objectForKeyedSubscript:@"GhostSize"];
  [v14 setObject:v17 forKeyedSubscript:@"GhostSize"];

  v18 = [v10 objectForKeyedSubscript:@"SearchRangeInPixel"];
  [v14 setObject:v18 forKeyedSubscript:@"SearchRangeInPixel"];

  v19 = [v10 objectForKeyedSubscript:@"ShapeScoreLambda"];
  [v14 setObject:v19 forKeyedSubscript:@"ShapeScoreLambda"];

  [v10 objectForKeyedSubscript:@"ContextScoreLambda"];
  v20 = id obj = a3;
  [v14 setObject:v20 forKeyedSubscript:@"ContextScoreLambda"];

  v21 = [v10 objectForKeyedSubscript:@"ContextPaddingInPixel"];
  [v14 setObject:v21 forKeyedSubscript:@"ContextPaddingInPixel"];

  v22 = [v10 objectForKeyedSubscript:@"GhostSize"];
  [v16 setObject:v22 forKeyedSubscript:@"GhostSize"];

  v23 = [v10 objectForKeyedSubscript:@"SearchRangeInPixel"];
  [v16 setObject:v23 forKeyedSubscript:@"SearchRangeInPixel"];

  v24 = [v10 objectForKeyedSubscript:@"ShapeScoreLambda"];
  [v16 setObject:v24 forKeyedSubscript:@"ShapeScoreLambda"];

  v25 = [v10 objectForKeyedSubscript:@"ContextScoreLambda"];
  [v16 setObject:v25 forKeyedSubscript:@"ContextScoreLambda"];

  v26 = [v10 objectForKeyedSubscript:@"ContextPaddingInPixel"];
  [v16 setObject:v26 forKeyedSubscript:@"ContextPaddingInPixel"];

  objc_storeStrong((id *)&v12->_metalContext, obj);
  v12->_pastFrameInfoArrayCapacity = (2 * v12->_defaultDetectionPeriod) | 1;
  v27 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:v12->_pastFrameInfoArrayCapacity];
  pastFrameInfoArray = v12->_pastFrameInfoArray;
  v12->_pastFrameInfoArray = v27;

  if (!v12->_pastFrameInfoArray)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v37 = 0;
    id v9 = v41;
    goto LABEL_10;
  }
  v29 = objc_alloc_init(CMIVideoDeghostingBrightLightTuningParamsV1);
  greenGhostBrightLightTuningParameters = v12->_greenGhostBrightLightTuningParameters;
  v12->_greenGhostBrightLightTuningParameters = v29;

  id v9 = v41;
  if (!v12->_greenGhostBrightLightTuningParameters)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v37 = 0;
    goto LABEL_10;
  }
  v12->_enableDetectionMaskRegistration = FigGetCFPreferenceBooleanWithDefault() != 0;
  v31 = [[CMIVideoDeghostingDetectionV1 alloc] initWithMetalContext:v41 imageDimensions:v39 tuningParameters:v14 enableMaskRegistration:v12->_enableDetectionMaskRegistration];
  detection = v12->_detection;
  v12->_detection = v31;

  if (!v12->_detection
    || (v33 = [[CMIVideoDeghostingTrackingV1 alloc] initWithMetalContext:v41 tuningParameters:v16], tracking = v12->_tracking, v12->_tracking = v33, tracking, !v12->_tracking)|| [(CMIVideoDeghostingDetectionAndTrackingV1 *)v12 resetState])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_15;
  }
  *(void *)&v12->_sensorBinningFactorVertical = 0x100000001;
  v35 = [[CMIMotionSampleRingBufferV1 alloc] initWithMaxCount:66.0];
  motionSampleRingbuffer = v12->_motionSampleRingbuffer;
  v12->_motionSampleRingbuffer = v35;

  if (!v12->_motionSampleRingbuffer)
  {
LABEL_15:
    v37 = 0;
    goto LABEL_10;
  }
  -[CMIVideoDeghostingDetectionV1 setMotionSampleRingBuffer:](v12->_detection, "setMotionSampleRingBuffer:");
  [(CMIVideoDeghostingTrackingV1 *)v12->_tracking setMotionSampleRingBuffer:v12->_motionSampleRingbuffer];
  v37 = v12;
LABEL_10:

  return v37;
}

- (void)dealloc
{
  [(CMIVideoDeghostingDetectionAndTrackingV1 *)self finishProcessing];
  [(CMIVideoDeghostingDetectionAndTrackingV1 *)self purgeResources];
  v3.receiver = self;
  v3.super_class = (Class)CMIVideoDeghostingDetectionAndTrackingV1;
  [(CMIVideoDeghostingDetectionAndTrackingV1 *)&v3 dealloc];
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
  return 0;
}

- (int)process
{
  long long v41 = 0u;
  long long v42 = 0u;
  detectionResult = self->_detectionResult;
  self->_detectionResult = 0;

  inputSampleBuffer = self->_inputSampleBuffer;
  if (inputSampleBuffer && (CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(inputSampleBuffer)) != 0)
  {
    CVImageBufferRef v7 = ImageBuffer;
    v8 = CMGetAttachment(self->_inputSampleBuffer, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
    if (v8)
    {
      unsigned int v9 = [(CMIVideoDeghostingDetectionAndTrackingV1 *)self _addMotionDataToRingBuffer:v8];
      if (v9)
      {
        int v34 = v9;
        fig_log_get_emitter();
        uint64_t v38 = v2;
        LODWORD(v37) = v34;
        FigDebugAssert3();
        v15 = 0;
      }
      else
      {
        BYTE3(v41) = self->_isTracking;
        int v10 = BYTE3(v41);
        BOOL v11 = self->_trackingFramesSinceLastReset > self->_minTrackLengthToTriggerDetectionAfterFailure;
        BYTE4(v41) = v11;
        if (BYTE3(v41))
        {
          unsigned int v12 = [(CMIVideoDeghostingDetectionAndTrackingV1 *)self _runTrackingOnImage:v7 metadataDictionary:v8];
          BYTE9(v41) = v12;
          if (v12)
          {
            self->_isTracking = 1;
            [(CMIVideoDeghostingTrackingV1 *)self->_tracking confidence];
            int v14 = v13;
            v15 = [(CMIVideoDeghostingTrackingV1 *)self->_tracking detectedGhostBoundingBoxes];
            BOOL v11 = 0;
            unint64_t v16 = self->_trackingFramesSinceLastReset + 1;
          }
          else
          {
            unint64_t v16 = 0;
            v15 = 0;
            self->_isTracking = 0;
            int v14 = 0;
          }
          self->_trackingFramesSinceLastReset = v16;
        }
        else
        {
          v15 = 0;
          BOOL v11 = 0;
          int v14 = 0;
        }
        BYTE5(v41) = v11;
        greenGhostBrightLightTuningParameters = self->_greenGhostBrightLightTuningParameters;
        if (greenGhostBrightLightTuningParameters) {
          [(CMIVideoDeghostingBrightLightTuningParamsV1 *)greenGhostBrightLightTuningParameters tuningParams];
        }
        else {
          memset(v39, 0, 20);
        }
        long long v40 = *(_OWORD *)((char *)v39 + 4);
        uint64_t v18 = sub_DACC(v8, (float *)&v40, 0, 0, 0.5, 0.5);
        LOBYTE(v41) = v18;
        BYTE1(v41) = [(CMIVideoDeghostingDetectionAndTrackingV1 *)self _lightSourceRecentlyAppeared:v18];
        unint64_t v19 = self->_defaultDetectionPeriod >> SBYTE1(v41);
        *(void *)&long long v42 = v19;
        if (v10) {
          BOOL v20 = 0;
        }
        else {
          BOOL v20 = self->_processedFrameCount % v19 == 0;
        }
        BYTE6(v41) = v20;
        if (v18)
        {
          unsigned int v21 = [(CMIVideoDeghostingDetectionAndTrackingV1 *)self _longTrackFailedForLastFrame];
          BYTE2(v41) = v20 | v21;
          if ((v20 | v21) == 1)
          {
            unsigned int v22 = [(CMIVideoDeghostingDetectionAndTrackingV1 *)self _runDetectionOnImage:v7 metadataDictionary:v8];
            BYTE8(v41) = v22;
            if (v22)
            {
              [(CMIVideoDeghostingDetectionV1 *)self->_detection confidence];
              int v14 = v23;
              uint64_t v24 = [(CMIVideoDeghostingDetectionV1 *)self->_detection detectedGhostBoundingBoxes];

              [(CMIVideoDeghostingTrackingV1 *)self->_tracking setResetTrackerWithInputGhostBoundingBoxes:1];
              [(CMIVideoDeghostingDetectionAndTrackingV1 *)self _runTrackingOnImage:v7 metadataDictionary:v8];
              self->_isTracking = 1;
              self->_trackingFramesSinceLastReset = 1;
              v15 = (void *)v24;
            }
            else
            {

              v15 = 0;
              int v14 = 0;
            }
          }
        }
        else
        {
          BYTE2(v41) = 0;
        }
        if ([v15 count])
        {
          id v25 = objc_alloc((Class)NSDictionary);
          v26 = [v15 firstObject];
          id v27 = objc_alloc((Class)NSNumber);
          LODWORD(v28) = v14;
          id v29 = [v27 initWithFloat:v28];
          id v30 = objc_msgSend(v25, "initWithObjectsAndKeys:", v26, @"GhostRect", v29, @"GhostConfidence", 0);

          id v31 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v30, 0);
          v32 = (NSDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v31, @"GhostsArray", 0);
          v33 = self->_detectionResult;
          self->_detectionResult = v32;
        }
        int v34 = 0;
      }
    }
    else
    {
      fig_log_get_emitter();
      uint64_t v38 = v2;
      LODWORD(v37) = 0;
      FigDebugAssert3();
      v15 = 0;
      int v34 = -12783;
    }
  }
  else
  {
    fig_log_get_emitter();
    uint64_t v38 = v2;
    LODWORD(v37) = 0;
    FigDebugAssert3();
    v8 = 0;
    v15 = 0;
    int v34 = -12780;
  }
  if (!self->_enableDetectionMaskRegistration) {
    [(CMIVideoDeghostingDetectionV1 *)self->_detection resetState];
  }
  DWORD2(v42) = v34;
  if ([(NSMutableArray *)self->_pastFrameInfoArray count] == self->_pastFrameInfoArrayCapacity) {
    [(NSMutableArray *)self->_pastFrameInfoArray removeObjectAtIndex:0];
  }
  id v35 = [objc_alloc((Class)NSData) initWithBytes:&v41 length:32];
  [(NSMutableArray *)self->_pastFrameInfoArray addObject:v35];
  ++self->_processedFrameCount;

  return v34;
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
  [(NSMutableArray *)self->_pastFrameInfoArray removeAllObjects];
  self->_isTracking = 0;
  self->_trackingFramesSinceLastReset = 0;
  self->_processedFrameCount = 0;
  detectionResult = self->_detectionResult;
  self->_detectionResult = 0;

  unsigned int v4 = [(CMIVideoDeghostingDetectionV1 *)self->_detection resetState];
  if (v4)
  {
    int v5 = v4;
    fig_log_get_emitter();
LABEL_6:
    FigDebugAssert3();
    return v5;
  }
  int v5 = [(CMIVideoDeghostingTrackingV1 *)self->_tracking resetState];
  if (v5)
  {
    fig_log_get_emitter();
    goto LABEL_6;
  }
  return v5;
}

- (BOOL)_runDetectionOnImage:(__CVBuffer *)a3 metadataDictionary:(id)a4
{
  id v6 = a4;
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  [(CMIVideoDeghostingDetectionV1 *)self->_detection setInputPixelBuffer:a3];
  [(CMIVideoDeghostingDetectionV1 *)self->_detection setMetadataDictionary:v6];
  if ([(CMIVideoDeghostingDetectionV1 *)self->_detection process])
  {
    fig_log_get_emitter();
LABEL_12:
    FigDebugAssert3();
    goto LABEL_13;
  }
  CVImageBufferRef v7 = [(CMIVideoDeghostingDetectionV1 *)self->_detection detectedGhostBoundingBoxes];
  id v8 = [v7 count];

  if (v8)
  {
    CGSize size = CGRectNull.size;
    rect.origin = CGRectNull.origin;
    rect.CGSize size = size;
    int v10 = [(CMIVideoDeghostingDetectionV1 *)self->_detection detectedGhostBoundingBoxes];
    CFDictionaryRef v11 = [v10 objectAtIndexedSubscript:0];
    CGRectMakeWithDictionaryRepresentation(v11, &rect);

    if (!CGRectIsEmpty(rect))
    {
      BOOL v12 = 1;
      goto LABEL_7;
    }
    fig_log_get_emitter();
    goto LABEL_12;
  }
LABEL_13:
  BOOL v12 = 0;
LABEL_7:
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }

  return v12;
}

- (BOOL)_runTrackingOnImage:(__CVBuffer *)a3 metadataDictionary:(id)a4
{
  id v6 = a4;
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
  [(CMIVideoDeghostingTrackingV1 *)self->_tracking setInputPixelBuffer:a3];
  [(CMIVideoDeghostingTrackingV1 *)self->_tracking setMetadataDictionary:v6];
  [(CMIVideoDeghostingTrackingV1 *)self->_tracking setCameraInfoByPortType:self->_cameraInfoByPortType];
  CVImageBufferRef v7 = [(CMIVideoDeghostingDetectionV1 *)self->_detection detectedGhostBoundingBoxes];
  [(CMIVideoDeghostingTrackingV1 *)self->_tracking setDetectedGhostBoundingBoxes:v7];

  [(CMIVideoDeghostingDetectionV1 *)self->_detection bias];
  -[CMIVideoDeghostingTrackingV1 setBias:](self->_tracking, "setBias:");
  [(CMIVideoDeghostingDetectionV1 *)self->_detection confidence];
  -[CMIVideoDeghostingTrackingV1 setConfidence:](self->_tracking, "setConfidence:");
  [(CMIVideoDeghostingDetectionV1 *)self->_detection shapeScore];
  -[CMIVideoDeghostingTrackingV1 setShapeScore:](self->_tracking, "setShapeScore:");
  [(CMIVideoDeghostingDetectionV1 *)self->_detection contextScore];
  -[CMIVideoDeghostingTrackingV1 setContextScore:](self->_tracking, "setContextScore:");
  if ([(CMIVideoDeghostingTrackingV1 *)self->_tracking process])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    BOOL v9 = 0;
  }
  else
  {
    id v8 = [(CMIVideoDeghostingTrackingV1 *)self->_tracking detectedGhostBoundingBoxes];
    BOOL v9 = [v8 count] != 0;
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }

  return v9;
}

- (void)setCameraInfoByPortType:(id)a3
{
  objc_storeStrong((id *)&self->_cameraInfoByPortType, a3);
  id v5 = a3;
  [(CMIVideoDeghostingDetectionV1 *)self->_detection setCameraInfoByPortType:v5];
  [(CMIVideoDeghostingTrackingV1 *)self->_tracking setCameraInfoByPortType:v5];
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setSensorBinningFactorHorizontal:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  self->_sensorBinningFactorHorizontal = a3;
  -[CMIVideoDeghostingDetectionV1 setSensorBinningFactorHorizontal:](self->_detection, "setSensorBinningFactorHorizontal:");
  tracking = self->_tracking;

  [(CMIVideoDeghostingTrackingV1 *)tracking setSensorBinningFactorHorizontal:v3];
}

- (int)sensorBinningFactorHorizontal
{
  return self->_sensorBinningFactorHorizontal;
}

- (void)setSensorBinningFactorVertical:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  self->_sensorBinningFactorVertical = a3;
  -[CMIVideoDeghostingDetectionV1 setSensorBinningFactorVertical:](self->_detection, "setSensorBinningFactorVertical:");
  tracking = self->_tracking;

  [(CMIVideoDeghostingTrackingV1 *)tracking setSensorBinningFactorVertical:v3];
}

- (int)sensorBinningFactorVertical
{
  return self->_sensorBinningFactorVertical;
}

- (int)_extractAndCheckTuningParameters:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_13;
  }
  id v6 = [v4 objectForKeyedSubscript:@"DefaultDetectionPeriod"];

  if (!v6) {
    goto LABEL_13;
  }
  CVImageBufferRef v7 = [v5 objectForKeyedSubscript:@"MinTrackLengthToTriggerDetectionAfterFailure"];

  if (!v7) {
    goto LABEL_13;
  }
  id v8 = [v5 objectForKeyedSubscript:@"GhostSize"];

  if (!v8) {
    goto LABEL_13;
  }
  BOOL v9 = [v5 objectForKeyedSubscript:@"SearchRangeInPixel"];

  if (!v9) {
    goto LABEL_13;
  }
  int v10 = [v5 objectForKeyedSubscript:@"ShapeScoreLambda"];

  if (!v10) {
    goto LABEL_13;
  }
  CFDictionaryRef v11 = [v5 objectForKeyedSubscript:@"ContextScoreLambda"];

  if (!v11) {
    goto LABEL_13;
  }
  BOOL v12 = [v5 objectForKeyedSubscript:@"ContextPaddingInPixel"];

  if (!v12) {
    goto LABEL_13;
  }
  int v13 = [v5 objectForKeyedSubscript:@"Detection"];

  if (v13
    && ([v5 objectForKeyedSubscript:@"Tracking"],
        int v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v14))
  {
    v15 = [v5 objectForKeyedSubscript:@"MinTrackLengthToTriggerDetectionAfterFailure"];
    [v15 floatValue];
    self->_minTrackLengthToTriggerDetectionAfterFailure = (unint64_t)v16;

    v17 = [v5 objectForKeyedSubscript:@"DefaultDetectionPeriod"];
    self->_defaultDetectionPeriod = [v17 intValue];

    int v18 = 0;
  }
  else
  {
LABEL_13:
    int v18 = FigSignalErrorAt();
  }

  return v18;
}

- (int)_addMotionDataToRingBuffer:(id)a3
{
  unsigned int v11 = 0;
  rawQuaternionArray = self->_rawQuaternionArray;
  int v5 = sub_ECD8((CFDictionaryRef)a3, (float64x2_t *)self->_rawQuaternionArray, 0, 110, (int *)&v11, 0, 0, 0, 0);
  if (!v5)
  {
    motionSampleRingbuffer = self->_motionSampleRingbuffer;
    if (motionSampleRingbuffer && v11 != 0)
    {
      if ((int)v11 >= 1)
      {
        p_timestamp = &self->_rawQuaternionArray[0].timestamp;
        uint64_t v9 = v11;
        do
        {
          double *p_timestamp = *p_timestamp + -0.0035;
          p_timestamp += 6;
          --v9;
        }
        while (v9);
      }
      -[CMIMotionSampleRingBufferV1 addMotionDataToRingBuffer:withSampleCount:](motionSampleRingbuffer, "addMotionDataToRingBuffer:withSampleCount:", rawQuaternionArray);
    }
  }
  return v5;
}

- (BOOL)_lightSourceRecentlyAppeared:(BOOL)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_pastFrameInfoArray count];
  do
  {
    int v5 = v4;
    if ((int)v4 < 1) {
      break;
    }
    id v6 = [(NSMutableArray *)self->_pastFrameInfoArray objectAtIndexedSubscript:--v4];
    int v7 = *(unsigned __int8 *)[v6 bytes];
  }
  while (v7);
  id v8 = [(NSMutableArray *)self->_pastFrameInfoArray count];
  return v5 > 0 || (unint64_t)v8 < self->_pastFrameInfoArrayCapacity;
}

- (BOOL)_longTrackFailedForLastFrame
{
  if (![(NSMutableArray *)self->_pastFrameInfoArray count]) {
    return 0;
  }
  id v3 = [(NSMutableArray *)self->_pastFrameInfoArray lastObject];
  BOOL v4 = *((unsigned char *)[v3 bytes] + 5) != 0;

  return v4;
}

- (opaqueCMSampleBuffer)inputSampleBuffer
{
  return self->_inputSampleBuffer;
}

- (void)setInputSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_inputSampleBuffer = a3;
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (NSDictionary)detectionResult
{
  return self->_detectionResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionResult, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_motionSampleRingbuffer, 0);
  objc_storeStrong((id *)&self->_pastFrameInfoArray, 0);
  objc_storeStrong((id *)&self->_greenGhostBrightLightTuningParameters, 0);
  objc_storeStrong((id *)&self->_tracking, 0);
  objc_storeStrong((id *)&self->_detection, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end