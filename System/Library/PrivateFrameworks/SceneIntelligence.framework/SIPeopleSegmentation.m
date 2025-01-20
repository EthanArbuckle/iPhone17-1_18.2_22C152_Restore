@interface SIPeopleSegmentation
+ (CGSize)getInputResolution;
+ (CGSize)getOutputResolution;
- (BOOL)_initTemporalBuffer;
- (CGSize)getInputResolution;
- (CGSize)getOutputResolution;
- (SIPeopleSegmentation)initWithNetworkConfiguration:(id)a3;
- (int64_t)copyResultsToData:(id)a3;
- (int64_t)evaluateForInput:(__CVBuffer *)a3 outputBuffer:(__CVBuffer *)a4;
- (int64_t)evaluateForInput:(id)a3 output:(id)a4;
- (int64_t)switchNetworkConfiguration:(int64_t)a3;
- (unsigned)snapEveryFrameCount;
- (void)dealloc;
- (void)setSnapEveryFrameCount:(unsigned __int8)a3;
@end

@implementation SIPeopleSegmentation

+ (CGSize)getInputResolution
{
  double v2 = 192.0;
  double v3 = 256.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)getOutputResolution
{
  double v2 = 192.0;
  double v3 = 256.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (SIPeopleSegmentation)initWithNetworkConfiguration:(id)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SIPeopleSegmentation;
  v5 = [(SIModel *)&v14 initWithNetworkConfiguration:v4];
  if (!v5)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  v21[0] = kSIMPeopleSegmentationInputTensorName;
  v6 = [[SIPixelBuffer alloc] initWithCVPixelBuffer:0];
  v21[1] = kSIMPeopleSegmentationTemporalTensorName;
  v22[0] = v6;
  v7 = [[SIPixelBuffer alloc] initWithCVPixelBuffer:0];
  v22[1] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  [(SIModel *)v5 setInputs:v8];

  uint64_t v19 = kSIMPeopleSegmentationOutputTensorName;
  v9 = [[SIPixelBuffer alloc] initWithCVPixelBuffer:0];
  v20 = v9;
  v10 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  [(SIModel *)v5 setOutputs:v10];

  [(SIPeopleSegmentation *)v5 setSnapEveryFrameCount:30];
  if (![(SIPeopleSegmentation *)v5 _initTemporalBuffer])
  {
    v12 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v16 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PeopleSegmentation/SIPeopleSegmentation.mm";
      __int16 v17 = 1025;
      int v18 = 69;
      _os_log_impl(&dword_21B697000, v12, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d ***  ***", buf, 0x12u);
    }

    goto LABEL_7;
  }
  v11 = v5;
LABEL_8:

  return v11;
}

- (CGSize)getInputResolution
{
  double v3 = [(SIModel *)self network];
  unint64_t v4 = [v3 getInputWidth:kSIMPeopleSegmentationInputTensorName];
  v5 = [(SIModel *)self network];
  double v6 = (double)(unint64_t)[v5 getInputHeight:kSIMPeopleSegmentationInputTensorName];

  double v7 = (double)v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)getOutputResolution
{
  double v3 = [(SIModel *)self network];
  unint64_t v4 = [v3 getOutputWidth:kSIMPeopleSegmentationOutputTensorName];
  v5 = [(SIModel *)self network];
  double v6 = (double)(unint64_t)[v5 getOutputHeight:kSIMPeopleSegmentationOutputTensorName];

  double v7 = (double)v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (int64_t)switchNetworkConfiguration:(int64_t)a3
{
  v5 = [(SIModel *)self config];
  uint64_t v6 = [v5 networkModeEnum];

  v10.receiver = self;
  v10.super_class = (Class)SIPeopleSegmentation;
  id v7 = [(SIModel *)&v10 switchNetworkConfiguration:a3];
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == a3;
  }
  if (!v8)
  {
    CVPixelBufferRelease(self->_temporalBuffer);
    self->_frameCount = 0;
    [(SIPeopleSegmentation *)self _initTemporalBuffer];
  }
  return (int64_t)v7;
}

- (BOOL)_initTemporalBuffer
{
  v17[1] = *MEMORY[0x263EF8340];
  uint64_t v16 = *MEMORY[0x263F04130];
  v17[0] = MEMORY[0x263EFFA78];
  CFDictionaryRef v3 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  [(SIPeopleSegmentation *)self getOutputResolution];
  double v5 = v4;
  [(SIPeopleSegmentation *)self getOutputResolution];
  CVReturn v7 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (unint64_t)v5, (unint64_t)v6, 0x4C303038u, v3, &self->_temporalBuffer);
  if (v7)
  {
    BOOL v8 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136381187;
      v11 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PeopleSegmentation/SIPeopleSegmentation.mm";
      __int16 v12 = 1025;
      int v13 = 110;
      __int16 v14 = 1024;
      CVReturn v15 = v7;
      _os_log_impl(&dword_21B697000, v8, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** (Error %d) Could not create internal image buffer of uint8 type ***", (uint8_t *)&v10, 0x18u);
    }
  }
  return v7 == 0;
}

- (int64_t)evaluateForInput:(__CVBuffer *)a3 outputBuffer:(__CVBuffer *)a4
{
  double v6 = [(SIModel *)self inputs];
  CVReturn v7 = [v6 objectForKeyedSubscript:kSIMPeopleSegmentationInputTensorName];
  [v7 setPixelBuffer:a3];

  temporalBuffer = self->_temporalBuffer;
  v9 = [(SIModel *)self inputs];
  int v10 = [v9 objectForKeyedSubscript:kSIMPeopleSegmentationTemporalTensorName];
  [v10 setPixelBuffer:temporalBuffer];

  v11 = [(SIModel *)self inputs];
  __int16 v12 = [(SIModel *)self outputs];
  int64_t v13 = [(SIModel *)self evaluateWithInput:v11 outputs:v12];

  return v13;
}

- (int64_t)evaluateForInput:(id)a3 output:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = -[SIPeopleSegmentation evaluateForInput:outputBuffer:](self, "evaluateForInput:outputBuffer:", [v6 inputImageBuffer], objc_msgSend(v7, "segmentation"));

  return v8;
}

- (int64_t)copyResultsToData:(id)a3
{
  id v4 = a3;
  v26 = v4;
  [(SIPeopleSegmentation *)self getOutputResolution];
  double v6 = v5;
  [(SIPeopleSegmentation *)self getOutputResolution];
  double v8 = v7;
  int v9 = self->_frameCount + 1;
  self->_frameCount = v9;
  if (v9 % [(SIPeopleSegmentation *)self snapEveryFrameCount])
  {
    uint64_t v10 = 1;
  }
  else
  {
    self->_frameCount = 0;
    uint64_t v10 = 0x101010101010101;
  }
  IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)[v4 segmentation]);
  int v12 = (int)v6;
  kdebug_trace();
  IOSurfaceLock(IOSurface, 0, 0);
  BaseAddress = (char *)IOSurfaceGetBaseAddress(IOSurface);
  size_t BytesPerRow = IOSurfaceGetBytesPerRow(IOSurface);
  CVPixelBufferLockBaseAddress(self->_temporalBuffer, 0);
  CVReturn v15 = (char *)CVPixelBufferGetBaseAddress(self->_temporalBuffer);
  size_t v16 = CVPixelBufferGetBytesPerRow(self->_temporalBuffer);
  buffer = IOSurface;
  __int16 v17 = [(SIModel *)self network];
  uint64_t v18 = [v17 getRawOutput:kSIMPeopleSegmentationOutputTensorName];

  v24 = self;
  uint64_t v19 = [(SIModel *)self network];
  uint64_t v20 = [v19 getOutputRowElements:kSIMPeopleSegmentationOutputTensorName];

  if ((int)v8 >= 1)
  {
    int v21 = 0;
    do
    {
      if (v12 >= 1)
      {
        uint64_t v22 = 0;
        do
        {
          *(void *)&v15[v22] = *(void *)(v18 + v22) & v10;
          *(void *)&BaseAddress[v22] = 255 * *(void *)(v18 + v22);
          v22 += 8;
        }
        while ((int)v22 < v12);
      }
      BaseAddress += BytesPerRow;
      v15 += v16;
      v18 += v20;
      ++v21;
    }
    while (v21 != (int)v8);
  }
  CVPixelBufferUnlockBaseAddress(v24->_temporalBuffer, 0);
  IOSurfaceUnlock(buffer, 0, 0);
  kdebug_trace();

  return 0;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_temporalBuffer);
  v3.receiver = self;
  v3.super_class = (Class)SIPeopleSegmentation;
  [(SIPeopleSegmentation *)&v3 dealloc];
}

- (unsigned)snapEveryFrameCount
{
  return self->snapEveryFrameCount;
}

- (void)setSnapEveryFrameCount:(unsigned __int8)a3
{
  self->snapEveryFrameCount = a3;
}

@end