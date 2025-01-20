@interface VEVideoDeghostingDetectionAndTrackingV2
- ($9ACD60CD7132EFDBD8B79F24F87E3927)ghostInformationLookAheadPointer;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)detectionResult;
- (NSDictionary)tuningParameters;
- (VEVideoDeghostingDetectionAndTrackingV2)initWithMetalContext:(id)a3 imageDimensions:(id)a4 tuningParameters:(id)a5;
- (int)_convertGGMStatus:(int64_t)a3;
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
- (void)setGhostInformationLookAheadPointer:(id *)a3;
- (void)setInputSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setSensorBinningFactorHorizontal:(int)a3;
- (void)setSensorBinningFactorVertical:(int)a3;
- (void)setTuningParameters:(id)a3;
@end

@implementation VEVideoDeghostingDetectionAndTrackingV2

- (VEVideoDeghostingDetectionAndTrackingV2)initWithMetalContext:(id)a3 imageDimensions:(id)a4 tuningParameters:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)VEVideoDeghostingDetectionAndTrackingV2;
  v11 = [(VEVideoDeghostingDetectionAndTrackingV2 *)&v20 init];
  if (!v11) {
    goto LABEL_6;
  }
  uint64_t v12 = sub_F0E8(0, v10);
  cfgDict = v11->_cfgDict;
  v11->_cfgDict = (NSDictionary *)v12;

  uint64_t v14 = [v9 commandQueue];
  metalCommandQueue = v11->_metalCommandQueue;
  v11->_metalCommandQueue = (MTLCommandQueue *)v14;

  v11->_imageDimensions = ($470D365275581EF16070F5A11344F73E)a4;
  objc_storeStrong((id *)&v11->_metalContext, a3);
  v16 = [[GGMController alloc] initWithConfigDict:v11->_cfgDict metalContext:v11->_metalContext imageDimensions:a4];
  GGMCtrl = v11->_GGMCtrl;
  v11->_GGMCtrl = v16;

  if (!v11->_GGMCtrl)
  {
LABEL_7:
    v18 = 0;
    goto LABEL_5;
  }
  if (sub_FCA8((uint64_t)&v11->_lookaheadFrames, 2))
  {
LABEL_6:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_7;
  }
  v18 = v11;
LABEL_5:

  return v18;
}

- (void)dealloc
{
  [(VEVideoDeghostingDetectionAndTrackingV2 *)self finishProcessing];
  [(VEVideoDeghostingDetectionAndTrackingV2 *)self purgeResources];
  v3.receiver = self;
  v3.super_class = (Class)VEVideoDeghostingDetectionAndTrackingV2;
  [(VEVideoDeghostingDetectionAndTrackingV2 *)&v3 dealloc];
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
  id v23 = 0;
  detectionResult = self->_detectionResult;
  self->_detectionResult = 0;

  if (self->_ghostInformationLookAheadPointer)
  {
    inputSampleBuffer = self->_inputSampleBuffer;
    if (inputSampleBuffer)
    {
      int v6 = sub_F674(&v22, inputSampleBuffer);
      if (v6)
      {
        fig_log_get_emitter();
        uint64_t v19 = v2;
        LODWORD(v17) = 0;
        FigDebugAssert3();
        char v8 = 0;
      }
      else
      {
        GGMCtrl = self->_GGMCtrl;
        long long v20 = *(_OWORD *)&kCMTimeInvalid.value;
        CMTimeEpoch epoch = kCMTimeInvalid.epoch;
        [(GGMController *)GGMCtrl setIspTimeStamp:&v20];
        [(GGMController *)self->_GGMCtrl setInputBuffer:v22];
        [(GGMController *)self->_GGMCtrl setMetaDictionary:v23];
        [(GGMController *)self->_GGMCtrl setLightSourceMask:sub_F23C(self->_inputSampleBuffer)];
        if ([(GGMController *)self->_GGMCtrl lightSourceMask]
          && CVPixelBufferGetPixelFormatType([(GGMController *)self->_GGMCtrl lightSourceMask]) == 1278226488)
        {
          [(GGMController *)self->_GGMCtrl setLightSourceMask:sub_10070([(GGMController *)self->_GGMCtrl lightSourceMask])];
          char v8 = 1;
        }
        else
        {
          char v8 = 0;
        }
        [(GGMController *)self->_GGMCtrl setKeyPointsList:sub_F44C(self->_inputSampleBuffer)];
        if (![(GGMController *)self->_GGMCtrl keyPointsList])
        {
          fig_log_get_emitter();
          uint64_t v18 = v2;
          LODWORD(v17) = 0;
          FigDebugAssert3();
        }
        int v9 = sub_F900((uint64_t)&self->_lookaheadFrames, (uint64_t *)self->_ghostInformationLookAheadPointer, 1);
        if (v9)
        {
          fig_log_get_emitter();
          uint64_t v18 = v2;
          LODWORD(v17) = v9;
          FigDebugAssert3();
        }
        -[GGMController setFutureFramesToDetectionAndRepair:](self->_GGMCtrl, "setFutureFramesToDetectionAndRepair:", &self->_lookaheadFrames, v17, v18);
        int v6 = [(VEVideoDeghostingDetectionAndTrackingV2 *)self _convertGGMStatus:[(GGMController *)self->_GGMCtrl processDetection]];
        if (v6)
        {
          fig_log_get_emitter();
          uint64_t v19 = v2;
          LODWORD(v17) = v6;
          FigDebugAssert3();
        }
        else
        {
          id v10 = [(GGMController *)self->_GGMCtrl detectedGreenGhostInfo];
          v11 = [v10 objectForKeyedSubscript:@"GhostsInfoMetaData"];
          uint64_t v12 = self->_detectionResult;
          self->_detectionResult = v11;

          int v6 = 0;
        }
      }
    }
    else
    {
      fig_log_get_emitter();
      uint64_t v19 = v2;
      LODWORD(v17) = 0;
      FigDebugAssert3();
      char v8 = 0;
      int v6 = -12780;
    }
  }
  else
  {
    fig_log_get_emitter();
    uint64_t v19 = v2;
    LODWORD(v17) = 0;
    FigDebugAssert3();
    char v8 = 0;
    int v6 = 2;
  }
  v13 = [(GGMController *)self->_GGMCtrl lightSourceMask];
  char v14 = v8 ^ 1;
  if (!v13) {
    char v14 = 1;
  }
  if ((v14 & 1) == 0)
  {
    v15 = [(GGMController *)self->_GGMCtrl lightSourceMask];
    if (v15) {
      CFRelease(v15);
    }
  }

  return v6;
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

  [(GGMController *)self->_GGMCtrl resetState];
  return 0;
}

- (int)_convertGGMStatus:(int64_t)a3
{
  if (a3 == 5) {
    int v3 = 2;
  }
  else {
    int v3 = 3;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

- (opaqueCMSampleBuffer)inputSampleBuffer
{
  return self->_inputSampleBuffer;
}

- (void)setInputSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_inputSampleBuffer = a3;
}

- (NSDictionary)detectionResult
{
  return self->_detectionResult;
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

- ($9ACD60CD7132EFDBD8B79F24F87E3927)ghostInformationLookAheadPointer
{
  return self->_ghostInformationLookAheadPointer;
}

- (void)setGhostInformationLookAheadPointer:(id *)a3
{
  self->_ghostInformationLookAheadPointer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_detectionResult, 0);
  objc_storeStrong((id *)&self->_GGMCtrl, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);

  objc_storeStrong((id *)&self->_cfgDict, 0);
}

@end