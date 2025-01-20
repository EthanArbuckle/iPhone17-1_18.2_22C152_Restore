@interface GGMController
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)ispTimeStamp;
- ($9ACD60CD7132EFDBD8B79F24F87E3927)futureFramesToDetectionAndRepair;
- ($E04785D6C22F149E9B1B648872290F90)setDefaultControllerConfig;
- (GGMController)initWithConfig:(id *)a3 metalContext:(id)a4 imageDimensions:(id)a5 tuningParameters:(id)a6;
- (GGMController)initWithConfigDict:(id)a3 metalContext:(id)a4 imageDimensions:(id)a5;
- (NSArray)futureInputParamsToRepair;
- (NSDictionary)detectedGreenGhostInfo;
- (NSDictionary)inputParamsToRepair;
- (NSDictionary)metaDictionary;
- (NSDictionary)tuningParamDict;
- (__CVBuffer)inputBuffer;
- (__CVBuffer)keyPointsList;
- (__CVBuffer)lightSourceMask;
- (__CVBuffer)processedPixelBuffer;
- (id)buildInputParamsToRepairFromMetaInfo:(id)a3 andDetectedResults:(id)a4 lookaheadDetectedResults:(id)a5;
- (id)createInputParamsToRepairFromMetaInfo:(id)a3 metaContainerBuffer:(id)a4 futureMetaContainerBuffers:(id)a5;
- (id)detectGreenGhostFor:(__CVBuffer *)a3 metaData:(id)a4 frameNum:(int64_t)a5 timeStamp:(id *)a6 keyPoint:(__CVBuffer *)a7 lightSourceMask:(__CVBuffer *)a8 futureFrames:(id *)a9;
- (int64_t)processDetection;
- (int64_t)processRepair;
- (int64_t)repairGreenGhostFor:(__CVBuffer *)a3 inputParamsToRepair:(id)a4 parsedMetaData:(id)a5 lookaheadDetResult:(id)a6 mitigated:(__CVBuffer *)a7;
- (void)resetIntermediateVariables;
- (void)resetState;
- (void)setDetectedGreenGhostInfo:(id)a3;
- (void)setFutureFramesToDetectionAndRepair:(id *)a3;
- (void)setFutureInputParamsToRepair:(id)a3;
- (void)setInputBuffer:(__CVBuffer *)a3;
- (void)setInputParamsToRepair:(id)a3;
- (void)setIspTimeStamp:(id *)a3;
- (void)setKeyPointsList:(__CVBuffer *)a3;
- (void)setLightSourceMask:(__CVBuffer *)a3;
- (void)setMetaDictionary:(id)a3;
- (void)updateConfig:(id *)a3 withConfigureDict:(id)a4;
@end

@implementation GGMController

- (void)updateConfig:(id *)a3 withConfigureDict:(id)a4
{
  id v5 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    CFStringRef v12 = @"TuningParameters";
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v11 = objc_msgSend(v5, "objectForKeyedSubscript:", v10, v12);
        if ([v10 isEqualToString:@"LightMode"])
        {
          a3->var0 = [v11 intValue];
        }
        else if ([v10 isEqualToString:@"HomographyType"])
        {
          a3->var1 = [v11 intValue];
        }
        else if ([v10 isEqualToString:@"DetectionType"])
        {
          a3->var2 = [v11 intValue];
        }
        else if ([v10 isEqualToString:@"TemporalRepairMode"])
        {
          a3->var3 = [v11 intValue];
        }
        else if ([v10 isEqualToString:@"RepairFrameDelay"])
        {
          a3->var4 = [v11 intValue];
        }
        else if ([v10 isEqualToString:@"DrawBoundingBox"])
        {
          a3->var5 = [v11 BOOLValue];
        }
        else if ([v10 isEqualToString:@"NoMetaData"])
        {
          a3->var6 = [v11 BOOLValue];
        }
        else if ([v10 isEqualToString:@"BackgroundDetection"])
        {
          a3->var7 = [v11 BOOLValue];
        }
        else
        {
          [v10 isEqualToString:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (GGMController)initWithConfigDict:(id)a3 metalContext:(id)a4 imageDimensions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  if (self) {
    [(GGMController *)self setDefaultControllerConfig];
  }
  if (v8) {
    [(GGMController *)self updateConfig:&v16 withConfigureDict:v8];
  }
  v10 = objc_msgSend(v8, "objectForKeyedSubscript:", @"TuningParameters", v14, v15, v16, v17);

  if (v10)
  {
    v11 = [v8 objectForKeyedSubscript:@"TuningParameters"];
  }
  else
  {
    v11 = 0;
  }
  [(GGMController *)self setConfigureFromDefaultsWrite:&v14];
  CFStringRef v12 = [(GGMController *)self initWithConfig:&v14 metalContext:v9 imageDimensions:a5 tuningParameters:v11];

  return v12;
}

- (GGMController)initWithConfig:(id *)a3 metalContext:(id)a4 imageDimensions:(id)a5 tuningParameters:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  if (!v11)
  {
    fig_log_get_emitter();
LABEL_11:
    FigDebugAssert3();

    self = 0;
    goto LABEL_7;
  }
  v26.receiver = self;
  v26.super_class = (Class)GGMController;
  long long v13 = [(GGMController *)&v26 init];
  self = (GGMController *)v13;
  if (!v13)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_7;
  }
  long long v14 = *(_OWORD *)&a3->var0.var0;
  long long v15 = *(_OWORD *)&a3->var0.var7;
  long long v16 = *(_OWORD *)&a3->var1.var0;
  *(_OWORD *)(v13 + 88) = *(_OWORD *)&a3->var1.var4;
  *(_OWORD *)(v13 + 72) = v16;
  *(_OWORD *)(v13 + 56) = v15;
  *(_OWORD *)(v13 + 40) = v14;
  objc_storeStrong((id *)v13 + 3, a4);
  objc_storeStrong((id *)&self->_tuningParamDict, a6);
  long long v17 = [[GGMMetalToolBox alloc] initWithMetalContext:v11 tuningParamDict:self->_tuningParamDict];
  metalToolbox = self->_metalToolbox;
  self->_metalToolbox = v17;

  if (!self->_metalToolbox) {
    goto LABEL_10;
  }
  v19 = [[VideoDeghostingDetectionV2 alloc] initWithMetalToolBox:self->_metalToolbox config:a3 tuningParamDict:self->_tuningParamDict imageDimensions:a5];
  GGDetector = self->_GGDetector;
  self->_GGDetector = v19;

  if (!self->_GGDetector
    || (v21 = [[VideoMitigation alloc] initWithConfig:a3 metalToolBox:self->_metalToolbox MetalContext:self->_metalContext imageDimensions:a5], GGMitigator = self->_GGMitigator, self->_GGMitigator = v21, GGMitigator, !self->_GGMitigator))
  {
LABEL_10:
    fig_log_get_emitter();
    goto LABEL_11;
  }
  v23 = objc_alloc_init(RepairWeightsProcessor);
  repairWeightsProcessor = self->_repairWeightsProcessor;
  self->_repairWeightsProcessor = v23;

  [(GGMController *)self resetIntermediateVariables];
LABEL_7:

  return self;
}

- (void)resetState
{
  self->_processedPixelBuffer = 0;
  self->_processedFrameInDetection = 0;
  self->_lookaheadFrameProcessedInFinish = 0;
  [(VideoDeghostingDetectionV2 *)self->_GGDetector reset];
  [(VideoMitigation *)self->_GGMitigator resetState];
  [(RepairWeightsProcessor *)self->_repairWeightsProcessor reset];

  [(GGMController *)self resetIntermediateVariables];
}

- (void)resetIntermediateVariables
{
  v3 = +[NSMutableArray array];
  metaInfoQueue = self->_metaInfoQueue;
  self->_metaInfoQueue = v3;

  self->_repairWeightsProcessor = objc_alloc_init(RepairWeightsProcessor);

  _objc_release_x1();
}

- ($E04785D6C22F149E9B1B648872290F90)setDefaultControllerConfig
{
  *(_OWORD *)&retstr->var1.var0 = 0u;
  *(_OWORD *)&retstr->var1.var4 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var7 = 0u;
  sub_176D4((uint64_t)retstr);
  return result;
}

- (int64_t)processDetection
{
  if (self->_inputBuffer && self->_metaDictionary)
  {
    -[GGMController detectGreenGhostFor:metaData:frameNum:timeStamp:keyPoint:lightSourceMask:futureFrames:](self, "detectGreenGhostFor:metaData:frameNum:timeStamp:keyPoint:lightSourceMask:futureFrames:", self->_futureFramesToDetectionAndRepair);
    v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    detectedGreenGhostInfo = self->_detectedGreenGhostInfo;
    self->_detectedGreenGhostInfo = v3;

    if (self->_detectedGreenGhostInfo)
    {
      int64_t result = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int64_t result = 3;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int64_t result = 5;
  }
  ++self->_processedFrameInDetection;
  return result;
}

- (int64_t)processRepair
{
  return [(GGMController *)self repairGreenGhostFor:self->_inputBuffer inputParamsToRepair:self->_inputParamsToRepair parsedMetaData:self->_metaDictionary lookaheadDetResult:self->_futureInputParamsToRepair mitigated:&self->_inputBuffer];
}

- (id)detectGreenGhostFor:(__CVBuffer *)a3 metaData:(id)a4 frameNum:(int64_t)a5 timeStamp:(id *)a6 keyPoint:(__CVBuffer *)a7 lightSourceMask:(__CVBuffer *)a8 futureFrames:(id *)a9
{
  id v14 = a4;
  CVPixelBufferRetain(a3);
  if (a7) {
    CFRetain(a7);
  }
  CVPixelBufferRetain(a8);
  GGDetector = self->_GGDetector;
  long long v19 = *(_OWORD *)&a6->var0;
  int64_t var3 = a6->var3;
  long long v17 = [(VideoDeghostingDetectionV2 *)GGDetector process:a3 metaData:v14 ispTimeStamp:&v19 keypoints:a7 lightSourceMask:a8 futureFrames:a9];
  CVPixelBufferRelease(a3);
  if (a7) {
    CFRelease(a7);
  }
  CVPixelBufferRelease(a8);

  return v17;
}

- (int64_t)repairGreenGhostFor:(__CVBuffer *)a3 inputParamsToRepair:(id)a4 parsedMetaData:(id)a5 lookaheadDetResult:(id)a6 mitigated:(__CVBuffer *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (a3
    && v12
    && v11
    && v13
    && ([(GGMController *)self buildInputParamsToRepairFromMetaInfo:v12 andDetectedResults:v11 lookaheadDetectedResults:v13], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v16 = (void *)v15;
    int64_t v17 = [(VideoMitigation *)self->_GGMitigator mitigate:a3 info:v15 futureFrames:self->_futureFramesToDetectionAndRepair];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int64_t v17 = 5;
  }

  return v17;
}

- (id)createInputParamsToRepairFromMetaInfo:(id)a3 metaContainerBuffer:(id)a4 futureMetaContainerBuffers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSMutableDictionary dictionary];
  if (v10) {
    [(RepairWeightsProcessor *)self->_repairWeightsProcessor temporalFilterBlendingWeights:v9 lookaheadMetaBufs:v10];
  }
  if (v8) {
    [v11 setObject:v8 forKey:@"MetaData"];
  }
  if (v9) {
    [v11 setObject:v9 forKey:@"RepairMetaContainer"];
  }

  return v11;
}

- (id)buildInputParamsToRepairFromMetaInfo:(id)a3 andDetectedResults:(id)a4 lookaheadDetectedResults:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [a4 objectForKeyedSubscript:@"RepairMeta"];
  id v11 = v10;
  if (v10 && (id v12 = v10, (v13 = [v12 mutableBytes]) != 0) && v13[9536])
  {
    objc_super v26 = v11;
    id v14 = self;
    id v15 = objc_alloc_init((Class)NSMutableArray);
    if (v9 && [v9 count])
    {
      uint64_t v16 = 0;
      while (1)
      {
        int64_t v17 = [v9 objectAtIndexedSubscript:v16];
        v18 = v17;
        if (!v17
          || ([v17 objectForKey:@"RepairMeta"],
              long long v19 = objc_claimAutoreleasedReturnValue(),
              v19,
              !v19))
        {

          goto LABEL_15;
        }
        v20 = [v18 objectForKeyedSubscript:@"RepairMeta"];
        v21 = v20;
        if (!v20) {
          break;
        }
        id v22 = v20;
        v23 = [v22 mutableBytes];
        if (!v23 || !v23[9536]) {
          break;
        }
        [v15 addObject:v22];

        if ((unint64_t)[v9 count] <= ++v16) {
          goto LABEL_15;
        }
      }
      fig_log_get_emitter();
      FigDebugAssert3();

      v24 = 0;
    }
    else
    {
LABEL_15:
      v24 = [(GGMController *)v14 createInputParamsToRepairFromMetaInfo:v8 metaContainerBuffer:v12 futureMetaContainerBuffers:v15];
    }
    id v11 = v26;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v24 = 0;
    id v15 = 0;
  }

  return v24;
}

- (NSDictionary)metaDictionary
{
  return self->_metaDictionary;
}

- (void)setMetaDictionary:(id)a3
{
}

- (NSDictionary)inputParamsToRepair
{
  return self->_inputParamsToRepair;
}

- (void)setInputParamsToRepair:(id)a3
{
}

- (NSArray)futureInputParamsToRepair
{
  return self->_futureInputParamsToRepair;
}

- (void)setFutureInputParamsToRepair:(id)a3
{
}

- ($9ACD60CD7132EFDBD8B79F24F87E3927)futureFramesToDetectionAndRepair
{
  return self->_futureFramesToDetectionAndRepair;
}

- (void)setFutureFramesToDetectionAndRepair:(id *)a3
{
  self->_futureFramesToDetectionAndRepair = a3;
}

- (NSDictionary)tuningParamDict
{
  return self->_tuningParamDict;
}

- (__CVBuffer)inputBuffer
{
  return self->_inputBuffer;
}

- (void)setInputBuffer:(__CVBuffer *)a3
{
  self->_inputBuffer = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)ispTimeStamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[9];
  return self;
}

- (void)setIspTimeStamp:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_ispTimeStamp.epoch = a3->var3;
  *(_OWORD *)&self->_ispTimeStamp.value = v3;
}

- (__CVBuffer)lightSourceMask
{
  return self->_lightSourceMask;
}

- (void)setLightSourceMask:(__CVBuffer *)a3
{
  self->_lightSourceMask = a3;
}

- (__CVBuffer)keyPointsList
{
  return self->_keyPointsList;
}

- (void)setKeyPointsList:(__CVBuffer *)a3
{
  self->_keyPointsList = a3;
}

- (NSDictionary)detectedGreenGhostInfo
{
  return self->_detectedGreenGhostInfo;
}

- (void)setDetectedGreenGhostInfo:(id)a3
{
}

- (__CVBuffer)processedPixelBuffer
{
  return self->_processedPixelBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedGreenGhostInfo, 0);
  objc_storeStrong((id *)&self->_tuningParamDict, 0);
  objc_storeStrong((id *)&self->_futureInputParamsToRepair, 0);
  objc_storeStrong((id *)&self->_inputParamsToRepair, 0);
  objc_storeStrong((id *)&self->_metaDictionary, 0);
  objc_storeStrong((id *)&self->_metaInfoQueue, 0);
  objc_storeStrong((id *)&self->_repairWeightsProcessor, 0);
  objc_storeStrong((id *)&self->_metalToolbox, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_GGMitigator, 0);

  objc_storeStrong((id *)&self->_GGDetector, 0);
}

@end