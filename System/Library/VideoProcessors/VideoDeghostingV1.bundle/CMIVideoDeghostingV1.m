@interface CMIVideoDeghostingV1
- ($2EE007E8DB0A29FF0870D731F0956162)ghostInformationLookAheadPointer;
- (BOOL)_shouldRunVideoDeghosting:(id)a3;
- (CMIVideoDeghostingV1)initWithCommandQueue:(id)a3 imageDimensions:(id)a4 tuningParameters:(id)a5;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)detectionResult;
- (NSDictionary)repairInputDetectionResult;
- (NSDictionary)tuningParameters;
- (float)_computeStrengthForConfidence:(float)a3 ghostRectangle:(CGRect)a4;
- (int)_extractAndCheckTuningParameters:(id)a3;
- (int)detectAndTrack;
- (int)finishProcessing;
- (int)initGhostInformationLookAheadForSize:(int)a3;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)process;
- (int)purgeResources;
- (int)repair;
- (int)resetState;
- (int)sensorBinningFactorHorizontal;
- (int)sensorBinningFactorVertical;
- (int)setup;
- (opaqueCMSampleBuffer)repairInputSampleBuffer;
- (opaqueCMSampleBuffer)sampleBuffer;
- (void)_updateAWBAttenuationFactor:(id)a3;
- (void)_updateFilteredStrength:(BOOL)a3 portType:(id)a4;
- (void)dealloc;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setRepairInputDetectionResult:(id)a3;
- (void)setRepairInputSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setSensorBinningFactorHorizontal:(int)a3;
- (void)setSensorBinningFactorVertical:(int)a3;
- (void)setTuningParameters:(id)a3;
@end

@implementation CMIVideoDeghostingV1

- (CMIVideoDeghostingV1)initWithCommandQueue:(id)a3 imageDimensions:(id)a4 tuningParameters:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v39.receiver = self;
  v39.super_class = (Class)CMIVideoDeghostingV1;
  v10 = [(CMIVideoDeghostingV1 *)&v39 init];
  v11 = v10;
  if (!v10 || [(CMIVideoDeghostingV1 *)v10 _extractAndCheckTuningParameters:v9])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_21:
    v37 = 0;
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v11->_tuningParameters, a5);
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = (FigMetalContext *)[objc_alloc((Class)FigMetalContext) initWithbundle:v12 andOptionalCommandQueue:v8];
  metalContext = v11->_metalContext;
  v11->_metalContext = v13;

  if (v8)
  {
    v15 = (MTLCommandQueue *)v8;
  }
  else
  {
    v15 = [(FigMetalContext *)v11->_metalContext commandQueue];
  }
  metalCommandQueue = v11->_metalCommandQueue;
  v11->_metalCommandQueue = v15;

  id v17 = objc_alloc((Class)FigMetalAllocator);
  v18 = [(FigMetalContext *)v11->_metalContext device];
  id v19 = [v17 initWithDevice:v18 allocatorType:2];
  [(FigMetalContext *)v11->_metalContext setAllocator:v19];

  v20 = [(FigMetalContext *)v11->_metalContext allocator];

  if (!v20 || (v21 = objc_opt_new()) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_20:

    goto LABEL_21;
  }
  v22 = v21;
  [v21 setMemSize:llroundf((float)((float)((float)a4.var0 * (float)a4.var1) / 2986000.0) * 3932200.0)];
  [v22 setWireMemory:1];
  [v22 setLabel:@"FigMetalAllocator_VideoDeghosting"];
  v23 = [(FigMetalContext *)v11->_metalContext allocator];
  unsigned int v24 = [v23 setupWithDescriptor:v22];

  if (v24)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_19:

    goto LABEL_20;
  }
  *(_WORD *)&v11->_repairEnabled = 257;
  v11->_luxLevelGatingEnabled = 1;
  v25 = [CMIVideoDeghostingDetectionAndTrackingV1 alloc];
  v26 = v11->_metalContext;
  v27 = [(NSDictionary *)v11->_tuningParameters objectForKeyedSubscript:@"DetectionAndTracking"];
  v28 = [(CMIVideoDeghostingDetectionAndTrackingV1 *)v25 initWithMetalContext:v26 imageDimensions:a4 tuningParameters:v27];
  detectionAndTracking = v11->_detectionAndTracking;
  v11->_detectionAndTracking = (CMIVideoDeghostingDetectionAndTracking *)v28;

  v30 = v11->_detectionAndTracking;
  if (!v30) {
    goto LABEL_18;
  }
  [(CMIVideoDeghostingDetectionAndTracking *)v30 setMetalCommandQueue:v8];
  v31 = [CMIVideoDeghostingRepairV1 alloc];
  v32 = v11->_metalContext;
  v33 = [(NSDictionary *)v11->_tuningParameters objectForKeyedSubscript:@"Repair"];
  v34 = [(CMIVideoDeghostingRepairV1 *)v31 initWithMetalContext:v32 imageDimensions:a4 tuningParameters:v33];
  repair = v11->_repair;
  v11->_repair = (CMIVideoDeghostingRepair *)v34;

  v36 = v11->_repair;
  if (!v36
    || [(CMIVideoDeghostingRepair *)v36 setup]
    || (v11->_ghostInformationLookAheadPointer = ($2EE007E8DB0A29FF0870D731F0956162 *)&v11->_ghostInformationLookAhead,
        [(CMIVideoDeghostingV1 *)v11 resetState]))
  {
LABEL_18:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_19;
  }
  *(void *)&v11->_sensorBinningFactorVertical = 0x100000001;
  v37 = v11;

LABEL_14:
  return v37;
}

- (void)dealloc
{
  [(CMIVideoDeghostingV1 *)self finishProcessing];
  [(CMIVideoDeghostingV1 *)self purgeResources];
  v3.receiver = self;
  v3.super_class = (Class)CMIVideoDeghostingV1;
  [(CMIVideoDeghostingV1 *)&v3 dealloc];
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
  int size = self->_ghostInformationLookAhead.size;
  info = self->_ghostInformationLookAhead.info;
  if (size >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    do
    {
      v7 = *(void **)((char *)info + v5 + 8);
      *(void *)((char *)info + v5 + 8) = 0;

      info = self->_ghostInformationLookAhead.info;
      *(void *)((char *)info + v5) = 0;
      ++v6;
      v5 += 24;
    }
    while (v6 < self->_ghostInformationLookAhead.size);
    goto LABEL_6;
  }
  if (info)
  {
LABEL_6:
    self->_ghostInformationLookAhead.info = 0;
    free(info);
  }
  *(void *)&self->_ghostInformationLookAhead.int size = 0;
  return 0;
}

- (int)detectAndTrack
{
  BOOL prevShouldRunVideoDeghosting = self->_prevShouldRunVideoDeghosting;
  detectionResult = self->_detectionResult;
  self->_detectionResult = 0;

  sampleBuffer = self->_sampleBuffer;
  if (!sampleBuffer)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v6 = 0;
LABEL_19:
    char v13 = prevShouldRunVideoDeghosting;
    int v14 = 2;
    goto LABEL_16;
  }
  uint64_t v6 = CMGetAttachment(sampleBuffer, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
  if (!v6)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_19;
  }
  if ([(CMIVideoDeghostingV1 *)self _shouldRunVideoDeghosting:v6])
  {
    [(CMIVideoDeghostingDetectionAndTracking *)self->_detectionAndTracking setInputSampleBuffer:self->_sampleBuffer];
    if (gGMFigKTraceEnabled == 1) {
      kdebug_trace();
    }
    unsigned int v7 = [(CMIVideoDeghostingDetectionAndTracking *)self->_detectionAndTracking process];
    id v8 = [(CMIVideoDeghostingDetectionAndTracking *)self->_detectionAndTracking detectionResult];

    if (v8)
    {
      id v9 = [(CMIVideoDeghostingDetectionAndTracking *)self->_detectionAndTracking detectionResult];
      v10 = [v9 objectForKeyedSubscript:@"GhostsArray"];

      v11 = [v10 firstObject];
      v12 = [v11 objectForKeyedSubscript:@"GhostConfidence"];
      [v12 floatValue];
    }
    if (gGMFigKTraceEnabled == 1) {
      kdebug_trace();
    }
    if (v7)
    {
      int v14 = FigSignalErrorAt();
    }
    else
    {
      id v15 = objc_alloc((Class)NSDictionary);
      v16 = [(CMIVideoDeghostingDetectionAndTracking *)self->_detectionAndTracking detectionResult];
      id v17 = (NSDictionary *)[v15 initWithDictionary:v16];
      v18 = self->_detectionResult;
      self->_detectionResult = v17;

      int v14 = 0;
    }
    char v13 = 1;
  }
  else
  {
    char v13 = self->_prevShouldRunVideoDeghosting;
    if (v13)
    {
      [(CMIVideoDeghostingDetectionAndTracking *)self->_detectionAndTracking resetState];
      char v13 = 0;
    }
    int v14 = 0;
  }
LABEL_16:
  self->_BOOL prevShouldRunVideoDeghosting = v13;

  return v14;
}

- (int)repair
{
  repairInputSampleBuffer = self->_repairInputSampleBuffer;
  if (!repairInputSampleBuffer)
  {
    fig_log_get_emitter();
    uint64_t v22 = v2;
    LODWORD(v21) = 0;
    FigDebugAssert3();
    id v9 = 0;
    unsigned int v7 = 0;
    uint64_t v6 = 0;
LABEL_18:
    int v15 = 2;
    goto LABEL_15;
  }
  uint64_t v5 = CMGetAttachment(repairInputSampleBuffer, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
  uint64_t v6 = v5;
  if (!v5)
  {
    fig_log_get_emitter();
    uint64_t v22 = v2;
    LODWORD(v21) = 0;
    FigDebugAssert3();
    id v9 = 0;
    unsigned int v7 = 0;
    goto LABEL_18;
  }
  unsigned int v7 = [v5 objectForKeyedSubscript:kFigCaptureStreamMetadata_PortType];
  [(CMIVideoDeghostingV1 *)self _updateFilteredStrength:0 portType:v7];
  id v8 = [(NSDictionary *)self->_repairInputDetectionResult objectForKeyedSubscript:@"GhostsArray"];
  id v9 = v8;
  if (self->_repairEnabled && [v8 count])
  {
    if (gGMFigKTraceEnabled == 1) {
      kdebug_trace();
    }
    [(CMIVideoDeghostingV1 *)self _updateAWBAttenuationFactor:v6];
    v10 = [v9 firstObject];
    v11 = [v10 objectForKeyedSubscript:@"GhostRect"];

    [(CMIVideoDeghostingRepair *)self->_repair setInputSampleBuffer:self->_repairInputSampleBuffer];
    id v12 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v11, 0);
    [(CMIVideoDeghostingRepair *)self->_repair setDetectedGhostBoundingBoxes:v12];

    uint64_t v14 = 56;
    if (!self->_dynamicRepairEnabled) {
      uint64_t v14 = 52;
    }
    *(float *)&double v13 = self->_awbAttenuationFactor * *(float *)((char *)&self->super.isa + v14);
    [(CMIVideoDeghostingRepair *)self->_repair setBlendingStrength:v13];
    int v15 = [(CMIVideoDeghostingRepair *)self->_repair process];
    if (gGMFigKTraceEnabled)
    {
      v16 = [(FigMetalContext *)self->_metalContext commandQueue];
      id v17 = [v16 commandBuffer];

      [v17 setLabel:@"KTRACE_END_MTL"];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_C064;
      v23[3] = &unk_2C868;
      memset(&v23[4], 0, 24);
      [v17 addCompletedHandler:v23];
      [v17 commit];
    }
    if (v15) {
      int v15 = FigSignalErrorAt();
    }
  }
  else
  {
    int v15 = 0;
  }
LABEL_15:
  objc_msgSend(v6, "objectForKeyedSubscript:", kFigCaptureStreamMetadata_PortType, v21, v22);
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  prevPortType = self->_prevPortType;
  self->_prevPortType = v18;

  return v15;
}

- (int)process
{
  int result = [(CMIVideoDeghostingV1 *)self detectAndTrack];
  if (!result)
  {
    *(_OWORD *)&self->_repairInputSampleBuffer = *(_OWORD *)&self->_sampleBuffer;
    return [(CMIVideoDeghostingV1 *)self repair];
  }
  return result;
}

- (int)setup
{
  return 0;
}

- (int)prewarm
{
  if (self->_metalCommandQueue)
  {

    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)resetState
{
  detectionResult = self->_detectionResult;
  self->_detectionResult = 0;

  self->_filteredStrength = NAN;
  self->_BOOL prevShouldRunVideoDeghosting = 0;
  *(void *)&self->_ghostInformationLookAhead.count = 0x3F80000000000000;
  unsigned int v4 = [(CMIVideoDeghostingDetectionAndTracking *)self->_detectionAndTracking resetState];
  if (v4)
  {
    int v5 = v4;
    fig_log_get_emitter();
LABEL_6:
    FigDebugAssert3();
    return v5;
  }
  int v5 = [(CMIVideoDeghostingRepair *)self->_repair resetState];
  if (v5)
  {
    fig_log_get_emitter();
    goto LABEL_6;
  }
  return v5;
}

- (int)initGhostInformationLookAheadForSize:(int)a3
{
  info = self->_ghostInformationLookAhead.info;
  if (info)
  {
    self->_ghostInformationLookAhead.info = 0;
    free(info);
  }
  *(void *)&self->_ghostInformationLookAhead.int size = 0;
  uint64_t v6 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_calloc(a3, 0x18uLL, 0x10A00403F27F3CFuLL);
  self->_ghostInformationLookAhead.info = v6;
  if (v6)
  {
    int result = 0;
    self->_ghostInformationLookAhead.int size = a3;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12786;
  }
  return result;
}

- (int)_extractAndCheckTuningParameters:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (!v4)
  {
    uint64_t v6 = 0;
LABEL_17:
    id v17 = 0;
    v11 = 0;
LABEL_23:
    int v22 = FigSignalErrorAt();
    goto LABEL_15;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"LuxLevelThresholdOFF"];

  if (!v6) {
    goto LABEL_17;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:@"LuxLevelThresholdON"];

  if (!v6) {
    goto LABEL_17;
  }
  unsigned int v7 = [v5 objectForKeyedSubscript:@"LuxLevelThresholdOFF"];
  self->_luxLevelThresholdOFF = [v7 intValue];

  id v8 = [v5 objectForKeyedSubscript:@"LuxLevelThresholdON"];
  self->_luxLevelThresholdON = [v8 intValue];

  id v9 = [v5 objectForKeyedSubscript:@"Repair"];
  uint64_t v6 = v9;
  if (!v9) {
    goto LABEL_17;
  }
  v10 = [v9 objectForKeyedSubscript:@"MaxStrength"];
  v11 = v10;
  if (!v10)
  {
LABEL_22:
    id v17 = 0;
    goto LABEL_23;
  }
  [v10 floatValue];
  self->_maxStrength = v12;
  if (v12 < 0.0 || v12 > 1.0) {
    goto LABEL_21;
  }
  double v13 = [v6 objectForKeyedSubscript:@"ConfidenceToStrengthScalingFactor"];

  if (!v13) {
    goto LABEL_17;
  }
  [v13 floatValue];
  self->_confidenceToStrengthScalingFactor = v14;
  if (v14 <= 0.0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v17 = 0;
    v11 = v13;
    goto LABEL_23;
  }
  v11 = [v6 objectForKeyedSubscript:@"StrengthMaxChangeDuration"];

  if (!v11) {
    goto LABEL_22;
  }
  [v11 floatValue];
  self->_strengthMaxChangeDuration = v15;
  if (self->_confidenceToStrengthScalingFactor <= 0.0)
  {
LABEL_21:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_22;
  }
  self->_strengthMaxChangePerFrame = (float)(self->_maxStrength / v15) / 30.0;
  v16 = [v6 objectForKeyedSubscript:@"AWBRepairStrengthAttenuationThresholds"];
  id v17 = v16;
  if (!v16) {
    goto LABEL_23;
  }
  v18 = [v16 objectForKeyedSubscript:@"AWBBlueToRedGainMinAttenuationThreshold"];
  [v18 floatValue];
  self->_awbMinAttenuationThreshold = v19;

  v20 = [v17 objectForKeyedSubscript:@"AWBBlueToRedGainMaxAttenuationThreshold"];
  [v20 floatValue];
  self->_awbMaxAttenuationThreshold = v21;

  if (self->_awbMinAttenuationThreshold > self->_awbMaxAttenuationThreshold) {
    goto LABEL_23;
  }
  int v22 = 0;
LABEL_15:

  return v22;
}

- (BOOL)_shouldRunVideoDeghosting:(id)a3
{
  id v4 = a3;
  BOOL prevShouldRunVideoDeghosting = self->_prevShouldRunVideoDeghosting;
  uint64_t v6 = [v4 objectForKeyedSubscript:kFigCaptureStreamMetadata_PortType];
  unsigned int v7 = [v6 isEqual:kFigCapturePortType_BackFacingCamera];

  if (!v7) {
    goto LABEL_5;
  }
  if (!self->_luxLevelGatingEnabled)
  {
LABEL_9:
    char v10 = 1;
    goto LABEL_10;
  }
  id v8 = [v4 objectForKeyedSubscript:kFigCaptureStreamMetadata_LuxLevel];
  int v9 = [v8 intValue];

  if (v9 >= self->_luxLevelThresholdOFF || !self->_prevShouldRunVideoDeghosting)
  {
    if (v9 < self->_luxLevelThresholdON || self->_prevShouldRunVideoDeghosting)
    {
      char v10 = prevShouldRunVideoDeghosting;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_5:
  char v10 = 0;
LABEL_10:

  return v10;
}

- (float)_computeStrengthForConfidence:(float)a3 ghostRectangle:(CGRect)a4
{
  if (a4.size.width <= 64.0 && a4.size.height <= 64.0) {
    return fmaxf(fminf(self->_confidenceToStrengthScalingFactor * a3, self->_maxStrength), 0.0);
  }
  else {
    return 0.0;
  }
}

- (void)_updateFilteredStrength:(BOOL)a3 portType:(id)a4
{
  int v4 = a3;
  if ([a4 isEqualToString:kFigCapturePortType_BackFacingCamera]) {
    v4 |= [(NSString *)self->_prevPortType isEqualToString:kFigCapturePortType_BackFacingSuperWideCamera];
  }
  if (self->_ghostInformationLookAhead.size >= 1)
  {
    if (self->_ghostInformationLookAhead.count <= 0
      || (info = self->_ghostInformationLookAhead.info, (unsigned int v7 = *(opaqueCMSampleBuffer **)info) == 0))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      float v18 = 0.0;
      goto LABEL_35;
    }
    id v8 = objc_msgSend(*((id *)info + 1), "objectForKeyedSubscript:");
    int v9 = [v8 firstObject];
    objc_msgSend(v9, "objectForKeyedSubscript:");
    CFDictionaryRef v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v11 = [v8 firstObject];
    float v12 = [v11 objectForKeyedSubscript:@"GhostConfidence"];
    [v12 floatValue];
    int v14 = v13;

    CMSampleBufferGetPresentationTimeStamp(&time, v7);
    double Seconds = CMTimeGetSeconds(&time);
    memset(&rect, 0, sizeof(rect));
    CGRectMakeWithDictionaryRepresentation(v10, &rect);
    LODWORD(v16) = v14;
    -[CMIVideoDeghostingV1 _computeStrengthForConfidence:ghostRectangle:](self, "_computeStrengthForConfidence:ghostRectangle:", v16, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    float v18 = v17;
    if (v4) {
      self->_filteredStrength = v17;
    }
    if (self->_ghostInformationLookAhead.count < 1)
    {
      float v23 = 3.4028e38;
      if (v4) {
        goto LABEL_34;
      }
    }
    else
    {
      CFDictionaryRef v47 = v10;
      int v46 = v4;
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      int v21 = 0;
      float v22 = 0.0;
      float v23 = 3.4028e38;
      while (1)
      {
        unsigned int v24 = self->_ghostInformationLookAhead.info;
        if (!*((unsigned char *)v24 + v19 + 16))
        {
          v26 = v8;
          goto LABEL_27;
        }
        v25 = *(opaqueCMSampleBuffer **)((char *)v24 + v19);
        if (!v25)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          float v18 = 0.0;
          CFDictionaryRef v10 = v47;
          goto LABEL_34;
        }
        v26 = [*(id *)((char *)v24 + v19 + 8) objectForKeyedSubscript:@"GhostsArray"];

        v27 = [v26 firstObject];
        CFDictionaryRef v28 = [v27 objectForKeyedSubscript:@"GhostRect"];

        v29 = [v26 firstObject];
        v30 = [v29 objectForKeyedSubscript:@"GhostConfidence"];
        [v30 floatValue];
        int v32 = v31;

        CMSampleBufferGetPresentationTimeStamp(&v49, v25);
        double v33 = CMTimeGetSeconds(&v49);
        memset(&v48, 0, sizeof(v48));
        CGRectMakeWithDictionaryRepresentation(v28, &v48);
        LODWORD(v34) = v32;
        -[CMIVideoDeghostingV1 _computeStrengthForConfidence:ghostRectangle:](self, "_computeStrengthForConfidence:ghostRectangle:", v34, v48.origin.x, v48.origin.y, v48.size.width, v48.size.height);
        if (v33 - Seconds > self->_strengthMaxChangeDuration) {
          break;
        }
        uint64_t v36 = v20 + 1;
        if ((float)((float)(v35 - self->_filteredStrength) / (float)(v20 + 1)) < v23)
        {
          float v23 = (float)(v35 - self->_filteredStrength) / (float)(v20 + 1);
          float v22 = v35;
          int v21 = v20;
        }

        v19 += 24;
        ++v20;
        id v8 = v26;
        if (v36 >= self->_ghostInformationLookAhead.count) {
          goto LABEL_27;
        }
      }

LABEL_27:
      if (v23 < 0.0)
      {
        CFDictionaryRef v10 = v47;
        if (v46) {
          float v18 = v22 + (float)((float)v21 * fminf(-v23, self->_strengthMaxChangePerFrame));
        }
        else {
          float v18 = v23 + self->_filteredStrength;
        }
        id v8 = v26;
        goto LABEL_34;
      }
      id v8 = v26;
      CFDictionaryRef v10 = v47;
      if (v46) {
        goto LABEL_34;
      }
    }
    float v18 = self->_filteredStrength + fminf(v23, self->_strengthMaxChangePerFrame);
LABEL_34:

    goto LABEL_35;
  }
  CGSize size = CGRectNull.size;
  rect.origin = CGRectNull.origin;
  rect.CGSize size = size;
  v38 = [(NSDictionary *)self->_detectionResult objectForKeyedSubscript:@"GhostsArray"];
  if ([v38 count])
  {
    v40 = [v38 firstObject];
    CFDictionaryRef v41 = [v40 objectForKeyedSubscript:@"GhostRect"];
    CGRectMakeWithDictionaryRepresentation(v41, &rect);

    v42 = [v40 objectForKeyedSubscript:@"GhostConfidence"];
    [v42 floatValue];
    int v44 = v43;
  }
  else
  {
    int v44 = 0;
  }
  LODWORD(v39) = v44;
  -[CMIVideoDeghostingV1 _computeStrengthForConfidence:ghostRectangle:](self, "_computeStrengthForConfidence:ghostRectangle:", v39, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
  float v18 = v45;
  if ((v4 & 1) == 0) {
    float v18 = (float)(v45 * 0.05) + (float)(self->_filteredStrength * 0.95);
  }

LABEL_35:
  self->_filteredStrength = fmaxf(fminf(v18, self->_maxStrength), 0.0);
}

- (void)_updateAWBAttenuationFactor:(id)a3
{
  id v4 = a3;
  self->_awbAttenuationFactor = 1.0;
  id v16 = v4;
  if (!v4) {
    goto LABEL_17;
  }
  int v5 = [v4 objectForKeyedSubscript:kFigCaptureStreamMetadata_AWBGrayWorldRGain];
  int v6 = [v5 intValue];

  unsigned int v7 = [v16 objectForKeyedSubscript:kFigCaptureStreamMetadata_AWBGrayWorldGGain];
  signed int v8 = [v7 intValue];

  int v9 = [v16 objectForKeyedSubscript:kFigCaptureStreamMetadata_AWBGrayWorldBGain];
  int v10 = [v9 intValue];

  BOOL v11 = v6 < 1 || v8 < 1;
  BOOL v12 = v11 || v10 <= 0;
  if (!v12
    && v8 == 4096
    && (float awbMinAttenuationThreshold = self->_awbMinAttenuationThreshold,
        float awbMaxAttenuationThreshold = self->_awbMaxAttenuationThreshold,
        awbMaxAttenuationThreshold > awbMinAttenuationThreshold)
    && (float v15 = 1.0
            - (float)((float)(fmaxf(awbMinAttenuationThreshold, fminf(awbMaxAttenuationThreshold, (float)v10 / (float)v6))- awbMinAttenuationThreshold)/ (float)(awbMaxAttenuationThreshold - awbMinAttenuationThreshold)), v15 >= 0.0)&& v15 <= 1.0)
  {
    self->_awbAttenuationFactor = v15;
  }
  else
  {
LABEL_17:
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (void)setCameraInfoByPortType:(id)a3
{
  objc_storeStrong((id *)&self->_cameraInfoByPortType, a3);
  id v5 = a3;
  [(CMIVideoDeghostingRepair *)self->_repair setCameraInfoByPortType:v5];
  [(CMIVideoDeghostingDetectionAndTracking *)self->_detectionAndTracking setCameraInfoByPortType:v5];
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setSensorBinningFactorHorizontal:(int)a3
{
  self->_sensorBinningFactorHorizontal = a3;
  -[CMIVideoDeghostingDetectionAndTracking setSensorBinningFactorHorizontal:](self->_detectionAndTracking, "setSensorBinningFactorHorizontal:");
}

- (int)sensorBinningFactorHorizontal
{
  return self->_sensorBinningFactorHorizontal;
}

- (void)setSensorBinningFactorVertical:(int)a3
{
  self->_sensorBinningFactorVertical = a3;
  -[CMIVideoDeghostingDetectionAndTracking setSensorBinningFactorVertical:](self->_detectionAndTracking, "setSensorBinningFactorVertical:");
}

- (int)sensorBinningFactorVertical
{
  return self->_sensorBinningFactorVertical;
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

- (opaqueCMSampleBuffer)sampleBuffer
{
  return self->_sampleBuffer;
}

- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_sampleBuffer = a3;
}

- (NSDictionary)detectionResult
{
  return self->_detectionResult;
}

- (opaqueCMSampleBuffer)repairInputSampleBuffer
{
  return self->_repairInputSampleBuffer;
}

- (void)setRepairInputSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_repairInputSampleBuffer = a3;
}

- (NSDictionary)repairInputDetectionResult
{
  return self->_repairInputDetectionResult;
}

- (void)setRepairInputDetectionResult:(id)a3
{
  self->_repairInputDetectionResult = (NSDictionary *)a3;
}

- ($2EE007E8DB0A29FF0870D731F0956162)ghostInformationLookAheadPointer
{
  return self->_ghostInformationLookAheadPointer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionResult, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_prevPortType, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_repair, 0);

  objc_storeStrong((id *)&self->_detectionAndTracking, 0);
}

@end