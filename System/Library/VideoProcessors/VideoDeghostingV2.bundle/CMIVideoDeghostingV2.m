@interface CMIVideoDeghostingV2
- ($9ACD60CD7132EFDBD8B79F24F87E3927)ghostInformationLookAheadPointer;
- (BOOL)_shouldResetRepair:(id)a3;
- (BOOL)_shouldRunRepair:(id)a3;
- (BOOL)_shouldRunVideoDeghosting:(id)a3;
- (CMIVideoDeghostingV2)initWithCommandQueue:(id)a3 imageDimensions:(id)a4 tuningParameters:(id)a5;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)detectionResult;
- (NSDictionary)repairInputDetectionResult;
- (NSDictionary)tuningParameters;
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

@implementation CMIVideoDeghostingV2

- (CMIVideoDeghostingV2)initWithCommandQueue:(id)a3 imageDimensions:(id)a4 tuningParameters:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CMIVideoDeghostingV2;
  v10 = [(CMIVideoDeghostingV2 *)&v25 init];
  v11 = v10;
  if (!v10 || [(CMIVideoDeghostingV2 *)v10 _extractAndCheckTuningParameters:v9])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_14:
    v23 = 0;
    goto LABEL_11;
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

  *(_WORD *)&v11->_repairEnabled = 257;
  v17 = [[VEVideoDeghostingDetectionAndTrackingV2 alloc] initWithMetalContext:v11->_metalContext imageDimensions:a4 tuningParameters:v11->_tuningParameters];
  detectionAndTracking = v11->_detectionAndTracking;
  v11->_detectionAndTracking = v17;

  v19 = v11->_detectionAndTracking;
  if (!v19
    || ([(VEVideoDeghostingDetectionAndTrackingV2 *)v19 setMetalCommandQueue:v8],
        v20 = [[VEVideoDeghostingRepairV2 alloc] initWithMetalContext:v11->_metalContext imageDimensions:a4 tuningParameters:v11->_tuningParameters], repair = v11->_repair, v11->_repair = v20, repair, (v22 = v11->_repair) == 0)|| [(VEVideoDeghostingRepairV2 *)v22 setup]|| (v11->_ghostInformationLookAheadPointer = ($9ACD60CD7132EFDBD8B79F24F87E3927 *)&v11->_ghostInformationLookAhead, [(CMIVideoDeghostingV2 *)v11 resetState]))
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_14;
  }
  *(void *)&v11->_sensorBinningFactorVertical = 0x100000001;
  v23 = v11;

LABEL_11:
  return v23;
}

- (void)dealloc
{
  [(CMIVideoDeghostingV2 *)self finishProcessing];
  [(CMIVideoDeghostingV2 *)self purgeResources];
  v3.receiver = self;
  v3.super_class = (Class)CMIVideoDeghostingV2;
  [(CMIVideoDeghostingV2 *)&v3 dealloc];
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
  if (sampleBuffer)
  {
    uint64_t v6 = CMGetAttachment(sampleBuffer, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
    if (v6)
    {
      if ([(CMIVideoDeghostingV2 *)self _shouldRunVideoDeghosting:v6])
      {
        [(VEVideoDeghostingDetectionAndTrackingV2 *)self->_detectionAndTracking setInputSampleBuffer:self->_sampleBuffer];
        [(VEVideoDeghostingDetectionAndTrackingV2 *)self->_detectionAndTracking setGhostInformationLookAheadPointer:&self->_ghostInformationLookAhead];
        if (gGMFigKTraceEnabled == 1) {
          kdebug_trace();
        }
        unsigned int v7 = [(VEVideoDeghostingDetectionAndTrackingV2 *)self->_detectionAndTracking process];
        if (v7)
        {
          int v12 = v7;
          fig_log_get_emitter();
          FigDebugAssert3();
        }
        else
        {
          if (gGMFigKTraceEnabled)
          {
            id v8 = [(FigMetalContext *)self->_metalContext commandQueue];
            id v9 = [v8 commandBuffer];

            [v9 setLabel:@"KTRACE_END_MTL"];
            v17[0] = _NSConcreteStackBlock;
            v17[1] = 3221225472;
            v17[2] = sub_273DC;
            v17[3] = &unk_3C6D0;
            memset(&v17[4], 0, 24);
            [v9 addCompletedHandler:v17];
            [v9 commit];
          }
          v10 = [(VEVideoDeghostingDetectionAndTrackingV2 *)self->_detectionAndTracking detectionResult];
          v11 = self->_detectionResult;
          self->_detectionResult = v10;

          int v12 = 0;
        }
        char v13 = 1;
      }
      else
      {
        char v13 = self->_prevShouldRunVideoDeghosting;
        if (v13)
        {
          [(VEVideoDeghostingDetectionAndTrackingV2 *)self->_detectionAndTracking resetState];
          v14 = (NSDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", &__kCFBooleanTrue, @"PipeReset", 0);
          v15 = self->_detectionResult;
          self->_detectionResult = v14;

          char v13 = 0;
        }
        int v12 = 0;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      char v13 = prevShouldRunVideoDeghosting;
      int v12 = -12783;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v6 = 0;
    char v13 = prevShouldRunVideoDeghosting;
    int v12 = 2;
  }
  self->_BOOL prevShouldRunVideoDeghosting = v13;

  return v12;
}

- (int)repair
{
  if (self->_repairInputSampleBuffer)
  {
    if ([(CMIVideoDeghostingV2 *)self _shouldRunRepair:self->_repairInputDetectionResult])
    {
      if (self->_repairEnabled)
      {
        if (gGMFigKTraceEnabled == 1) {
          kdebug_trace();
        }
        [(VEVideoDeghostingRepairV2 *)self->_repair setInputSampleBuffer:self->_repairInputSampleBuffer];
        [(VEVideoDeghostingRepairV2 *)self->_repair setGhostInformationLookAheadPointer:&self->_ghostInformationLookAhead];
        int v3 = [(VEVideoDeghostingRepairV2 *)self->_repair process];
        if (gGMFigKTraceEnabled)
        {
          v4 = [(FigMetalContext *)self->_metalContext commandQueue];
          uint64_t v5 = [v4 commandBuffer];

          [v5 setLabel:@"KTRACE_END_MTL"];
          v9[0] = _NSConcreteStackBlock;
          v9[1] = 3221225472;
          v9[2] = sub_276F4;
          v9[3] = &unk_3C6D0;
          memset(&v9[4], 0, 24);
          [v5 addCompletedHandler:v9];
          [v5 commit];
        }
        if (v3)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
        }
      }
      else
      {
        int v3 = 0;
      }
      char v6 = 1;
    }
    else
    {
      if ([(CMIVideoDeghostingV2 *)self _shouldResetRepair:self->_repairInputDetectionResult]) {
        [(VEVideoDeghostingRepairV2 *)self->_repair resetState];
      }
      char v6 = 0;
      int v3 = 0;
    }
  }
  else
  {
    BOOL prevShouldRunRepair = self->_prevShouldRunRepair;
    fig_log_get_emitter();
    FigDebugAssert3();
    char v6 = prevShouldRunRepair;
    int v3 = 2;
  }
  self->_BOOL prevShouldRunRepair = v6;
  return v3;
}

- (int)process
{
  int result = [(CMIVideoDeghostingV2 *)self detectAndTrack];
  if (!result)
  {
    long long v4 = *(_OWORD *)&self->_sampleBuffer;
    *(_OWORD *)&self->_repairInputSampleBuffer = v4;
    if ((void)v4
      && CMSampleBufferGetImageBuffer((CMSampleBufferRef)v4)
      && (CMGetAttachment(self->_repairInputSampleBuffer, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0),
          (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      char v6 = (void *)v5;
      if (self->_ghostInformationLookAhead.info)
      {
        int v7 = [(CMIVideoDeghostingV2 *)self repair];

        return v7;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    return 2;
  }
  return result;
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
  detectionResult = self->_detectionResult;
  self->_detectionResult = 0;

  *(_WORD *)&self->_BOOL prevShouldRunVideoDeghosting = 0;
  self->_ghostInformationLookAhead.count = 0;
  unsigned int v4 = [(VEVideoDeghostingDetectionAndTrackingV2 *)self->_detectionAndTracking resetState];
  if (v4)
  {
    int v5 = v4;
    fig_log_get_emitter();
LABEL_6:
    FigDebugAssert3();
    return v5;
  }
  int v5 = [(VEVideoDeghostingRepairV2 *)self->_repair resetState];
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
  char v6 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_calloc(a3, 0x18uLL, 0x10A00403F27F3CFuLL);
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
  if (!v4) {
    goto LABEL_7;
  }
  char v6 = [v4 objectForKeyedSubscript:@"LuxLevelThresholdOFF"];

  if (!v6) {
    goto LABEL_7;
  }
  int v7 = [v5 objectForKeyedSubscript:@"LuxLevelThresholdON"];

  if (!v7) {
    goto LABEL_7;
  }
  id v8 = [v5 objectForKeyedSubscript:@"LuxLevelThresholdOFF"];
  self->_luxLevelThresholdOFF = [v8 intValue];

  id v9 = [v5 objectForKeyedSubscript:@"LuxLevelThresholdON"];
  self->_luxLevelThresholdON = [v9 intValue];

  v10 = [v5 objectForKeyedSubscript:@"Repair"];
  if (v10)
  {
    int v11 = 0;
  }
  else
  {
LABEL_7:
    int v11 = FigSignalErrorAt();
    v10 = 0;
  }

  return v11;
}

- (BOOL)_shouldRunVideoDeghosting:(id)a3
{
  id v4 = a3;
  BOOL prevShouldRunVideoDeghosting = self->_prevShouldRunVideoDeghosting;
  char v6 = [v4 objectForKeyedSubscript:kFigCaptureStreamMetadata_PortType];
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

  if (v9 <= self->_luxLevelThresholdOFF || !self->_prevShouldRunVideoDeghosting)
  {
    if (v9 > self->_luxLevelThresholdON || self->_prevShouldRunVideoDeghosting)
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

- (BOOL)_shouldRunRepair:(id)a3
{
  int v3 = [a3 objectForKeyedSubscript:@"RepairMeta"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_shouldResetRepair:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 objectForKeyedSubscript:@"PipeReset"];

  if (v4)
  {
    int v5 = [v3 objectForKeyedSubscript:@"PipeReset"];
    unsigned __int8 v6 = [v5 BOOLValue];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)setCameraInfoByPortType:(id)a3
{
  objc_storeStrong((id *)&self->_cameraInfoByPortType, a3);
  id v5 = a3;
  [(VEVideoDeghostingRepairV2 *)self->_repair setCameraInfoByPortType:v5];
  [(VEVideoDeghostingDetectionAndTrackingV2 *)self->_detectionAndTracking setCameraInfoByPortType:v5];
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setSensorBinningFactorHorizontal:(int)a3
{
  self->_sensorBinningFactorHorizontal = a3;
  -[VEVideoDeghostingDetectionAndTrackingV2 setSensorBinningFactorHorizontal:](self->_detectionAndTracking, "setSensorBinningFactorHorizontal:");
}

- (int)sensorBinningFactorHorizontal
{
  return self->_sensorBinningFactorHorizontal;
}

- (void)setSensorBinningFactorVertical:(int)a3
{
  self->_sensorBinningFactorVertical = a3;
  -[VEVideoDeghostingDetectionAndTrackingV2 setSensorBinningFactorVertical:](self->_detectionAndTracking, "setSensorBinningFactorVertical:");
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

- ($9ACD60CD7132EFDBD8B79F24F87E3927)ghostInformationLookAheadPointer
{
  return self->_ghostInformationLookAheadPointer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionResult, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_repair, 0);

  objc_storeStrong((id *)&self->_detectionAndTracking, 0);
}

@end