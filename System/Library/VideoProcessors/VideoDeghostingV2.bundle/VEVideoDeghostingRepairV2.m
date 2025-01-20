@interface VEVideoDeghostingRepairV2
- ($9ACD60CD7132EFDBD8B79F24F87E3927)ghostInformationLookAheadPointer;
- (MTLCommandQueue)metalCommandQueue;
- (NSArray)detectedGhostBoundingBoxes;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (VEVideoDeghostingRepairV2)initWithMetalContext:(id)a3 imageDimensions:(id)a4 tuningParameters:(id)a5;
- (float)blendingStrength;
- (id)collectDetectionResultsForLookAheadBuffer:(id *)a3;
- (int)ConvertGGMStatus:(int64_t)a3;
- (int)finishProcessing;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)process;
- (int)purgeResources;
- (int)resetState;
- (int)setup;
- (opaqueCMSampleBuffer)inputSampleBuffer;
- (void)dealloc;
- (void)setBlendingStrength:(float)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setDetectedGhostBoundingBoxes:(id)a3;
- (void)setGhostInformationLookAheadPointer:(id *)a3;
- (void)setInputSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setTuningParameters:(id)a3;
@end

@implementation VEVideoDeghostingRepairV2

- (VEVideoDeghostingRepairV2)initWithMetalContext:(id)a3 imageDimensions:(id)a4 tuningParameters:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)VEVideoDeghostingRepairV2;
  v11 = [(VEVideoDeghostingRepairV2 *)&v20 init];
  if (!v11) {
    goto LABEL_8;
  }
  if (!v9) {
    goto LABEL_7;
  }
  uint64_t v12 = sub_EFB0(v10);
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
LABEL_8:
    v18 = 0;
    goto LABEL_6;
  }
  if (sub_FCA8((uint64_t)&v11->_lookaheadFrames, 2))
  {
LABEL_7:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_8;
  }
  v18 = v11;
LABEL_6:

  return v18;
}

- (void)dealloc
{
  [(VEVideoDeghostingRepairV2 *)self finishProcessing];
  [(VEVideoDeghostingRepairV2 *)self purgeResources];
  v3.receiver = self;
  v3.super_class = (Class)VEVideoDeghostingRepairV2;
  [(VEVideoDeghostingRepairV2 *)&v3 dealloc];
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
  inputSampleBuffer = self->_inputSampleBuffer;
  if (!inputSampleBuffer
    || !self->_ghostInformationLookAheadPointer
    || (CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(inputSampleBuffer)) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v6 = 0;
LABEL_13:
    int v12 = 2;
    goto LABEL_10;
  }
  CVImageBufferRef v5 = ImageBuffer;
  v6 = CMGetAttachment(self->_inputSampleBuffer, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
  if (!v6
    || (var0 = self->_ghostInformationLookAheadPointer->var0) == 0
    || ([(GGMController *)self->_GGMCtrl setInputBuffer:v5],
        (CFDictionaryRef v8 = (const __CFDictionary *)*((void *)var0 + 1)) == 0)
    || ([(GGMController *)self->_GGMCtrl setMetaDictionary:CFDictionaryGetValue(v8, @"MetaData")], [(GGMController *)self->_GGMCtrl metaDictionary], id v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_13;
  }
  [(GGMController *)self->_GGMCtrl setInputParamsToRepair:*((void *)var0 + 1)];
  id v10 = [(VEVideoDeghostingRepairV2 *)self collectDetectionResultsForLookAheadBuffer:self->_ghostInformationLookAheadPointer];
  [(GGMController *)self->_GGMCtrl setFutureInputParamsToRepair:v10];

  sub_F900((uint64_t)&self->_lookaheadFrames, (uint64_t *)self->_ghostInformationLookAheadPointer, 0);
  [(GGMController *)self->_GGMCtrl setFutureFramesToDetectionAndRepair:&self->_lookaheadFrames];
  unsigned int v11 = [(VEVideoDeghostingRepairV2 *)self ConvertGGMStatus:[(GGMController *)self->_GGMCtrl processRepair]];
  if (v11)
  {
    unsigned int v14 = v11;
    fig_log_get_emitter();
    FigDebugAssert3();
    int v12 = v14;
  }
  else
  {
    int v12 = 0;
  }
LABEL_10:

  return v12;
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
  return 0;
}

- (int)ConvertGGMStatus:(int64_t)a3
{
  if (a3 == 5) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

- (id)collectDetectionResultsForLookAheadBuffer:(id *)a3
{
  id v4 = objc_alloc_init((Class)NSMutableArray);
  int var2 = a3->var2;
  if (var2 >= 16) {
    int var2 = 16;
  }
  if (var2 >= 2)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 24 * (var2 - 1);
    do
    {
      CFDictionaryRef v8 = (char *)a3->var0 + v6;
      if (!v8[40]) {
        break;
      }
      if (!*((void *)v8 + 4)) {
        break;
      }
      objc_msgSend(v4, "addObject:");
      v6 += 24;
    }
    while (v7 != v6);
  }

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

- (NSArray)detectedGhostBoundingBoxes
{
  return self->_detectedGhostBoundingBoxes;
}

- (void)setDetectedGhostBoundingBoxes:(id)a3
{
}

- ($9ACD60CD7132EFDBD8B79F24F87E3927)ghostInformationLookAheadPointer
{
  return self->_ghostInformationLookAheadPointer;
}

- (void)setGhostInformationLookAheadPointer:(id *)a3
{
  self->_ghostInformationLookAheadPointer = a3;
}

- (float)blendingStrength
{
  return self->_blendingStrength;
}

- (void)setBlendingStrength:(float)a3
{
  self->_blendingStrength = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_detectedGhostBoundingBoxes, 0);
  objc_storeStrong((id *)&self->_GGMCtrl, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);

  objc_storeStrong((id *)&self->_cfgDict, 0);
}

@end