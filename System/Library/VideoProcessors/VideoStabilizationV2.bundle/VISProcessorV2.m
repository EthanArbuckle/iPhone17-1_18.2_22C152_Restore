@interface VISProcessorV2
- (BOOL)flipHorizontalOrientationEnabled;
- (BOOL)longPressModeEnabled;
- (BOOL)smartStyleReversibilityProcessingEnabled;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (VISConfiguration)configuration;
- (VISProcessorDelegate)delegate;
- (VISProcessorV2)init;
- (int)enqueueBufferForProcessing:(opaqueCMSampleBuffer *)a3;
- (int)finishProcessing;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)process;
- (int)purgeResources;
- (int)resetState;
- (int)setup;
- (void)dealloc;
- (void)didCompleteProcessingOfBuffer:(opaqueCMSampleBuffer *)a3 withStatus:(int)a4;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFlipHorizontalOrientationEnabled:(BOOL)a3;
- (void)setLongPressModeEnabled:(BOOL)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setSmartStyleReversibilityProcessingEnabled:(BOOL)a3;
- (void)setTuningParameters:(id)a3;
- (void)willStartProcessingBuffer:(opaqueCMSampleBuffer *)a3 withStatus:(int)a4;
@end

@implementation VISProcessorV2

- (VISProcessorV2)init
{
  v7.receiver = self;
  v7.super_class = (Class)VISProcessorV2;
  v2 = [(VISProcessorV2 *)&v7 init];
  if (v2
    && (v3 = objc_alloc_init(VISWrapper),
        visWrapper = v2->_visWrapper,
        v2->_visWrapper = v3,
        visWrapper,
        v2->_visWrapper))
  {
    v5 = v2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  [(VISProcessorV2 *)self finishProcessing];
  [(VISProcessorV2 *)self purgeResources];
  v3.receiver = self;
  v3.super_class = (Class)VISProcessorV2;
  [(VISProcessorV2 *)&v3 dealloc];
}

- (int)prepareToProcess:(unsigned int)a3
{
  if (self->_buffersEnqueued) {
    return -12782;
  }
  if (!self->_configuration) {
    return -12780;
  }
  -[VISWrapper setConfiguration:](self->_visWrapper, "setConfiguration:");
  [(VISWrapper *)self->_visWrapper setDelegate:self];
  int v4 = [(VISWrapper *)self->_visWrapper prepareToProcess];
  if (v4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v4;
}

- (int)enqueueBufferForProcessing:(opaqueCMSampleBuffer *)a3
{
  if (!self->_visWrapper) {
    return -12780;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  int v6 = -12780;
  if (a3 && WeakRetained)
  {
    [(VISWrapper *)self->_visWrapper setLongPressModeEnabled:self->_longPressModeEnabled];
    [(VISWrapper *)self->_visWrapper setFlipHorizontalOrientationEnabled:self->_flipHorizontalOrientationEnabled];
    [(VISWrapper *)self->_visWrapper setSmartStyleReversibilityProcessingEnabled:self->_smartStyleReversibilityProcessingEnabled];
    int v6 = [(VISWrapper *)self->_visWrapper enqueueBufferForProcessing:a3];
    if (v6)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      self->_buffersEnqueued = 1;
    }
  }
  return v6;
}

- (int)finishProcessing
{
  int v3 = [(VISWrapper *)self->_visWrapper finishProcessing];
  if (v3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    self->_buffersEnqueued = 0;
  }
  return v3;
}

- (int)purgeResources
{
  int v2 = [(VISWrapper *)self->_visWrapper purgeResources];
  if (v2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v2;
}

- (int)process
{
  return 0;
}

- (int)setup
{
  return 0;
}

- (int)prewarm
{
  int v3 = +[NSBundle bundleForClass:objc_opt_class()];
  [v3 classNamed:@"VISConfigurationV2"];
  int v4 = (VISConfiguration *)objc_opt_new();
  configuration = self->_configuration;
  self->_configuration = v4;

  [(VISConfiguration *)self->_configuration setTransformPlatform:0];
  [(VISConfiguration *)self->_configuration setSmoothingMethod:1];
  CFStringRef v6 = kCVPixelBufferWidthKey;
  CFStringRef v7 = kCVPixelBufferHeightKey;
  v17[0] = kCVPixelBufferWidthKey;
  v17[1] = kCVPixelBufferHeightKey;
  v18[0] = &off_499F0;
  v18[1] = &off_499F0;
  v17[2] = kCVPixelBufferPixelFormatTypeKey;
  v8 = +[NSNumber numberWithUnsignedInt:875704422];
  v18[2] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
  [(VISConfiguration *)self->_configuration setInputPixelBufferAttributes:v9];

  v15[0] = v6;
  v15[1] = v7;
  v16[0] = &off_499F0;
  v16[1] = &off_499F0;
  v10 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  [(VISConfiguration *)self->_configuration setOutputPixelBufferAttributes:v10];

  [(VISConfiguration *)self->_configuration setBlurBorderPixels:1];
  uint64_t v13 = kFigCaptureSensorIDDictionaryKey_VideoStabilizationRenderMethod;
  v14 = &off_49A08;
  v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  [(VISConfiguration *)self->_configuration setSensorIDDict:v11];

  [(VISConfiguration *)self->_configuration setMetalCommandQueue:self->_metalCommandQueue];
  [(VISProcessorV2 *)self prepareToProcess:0];

  return 0;
}

- (int)resetState
{
  return 0;
}

- (void)willStartProcessingBuffer:(opaqueCMSampleBuffer *)a3 withStatus:(int)a4
{
  if (self->_shouldCallStartProcessingBufferDelegate)
  {
    uint64_t v4 = *(void *)&a4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained willStartProcessingBuffer:a3 withStatus:v4];
  }
}

- (void)didCompleteProcessingOfBuffer:(opaqueCMSampleBuffer *)a3 withStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didCompleteProcessingOfBuffer:a3 withStatus:v4];
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v6 = a3;
  id v5 = objc_storeWeak((id *)p_delegate, v6);
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  self->_shouldCallStartProcessingBufferDelegate = p_delegate & 1;
}

- (VISProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VISProcessorDelegate *)WeakRetained;
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

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (BOOL)longPressModeEnabled
{
  return self->_longPressModeEnabled;
}

- (void)setLongPressModeEnabled:(BOOL)a3
{
  self->_longPressModeEnabled = a3;
}

- (BOOL)flipHorizontalOrientationEnabled
{
  return self->_flipHorizontalOrientationEnabled;
}

- (void)setFlipHorizontalOrientationEnabled:(BOOL)a3
{
  self->_flipHorizontalOrientationEnabled = a3;
}

- (BOOL)smartStyleReversibilityProcessingEnabled
{
  return self->_smartStyleReversibilityProcessingEnabled;
}

- (void)setSmartStyleReversibilityProcessingEnabled:(BOOL)a3
{
  self->_smartStyleReversibilityProcessingEnabled = a3;
}

- (VISConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_visWrapper, 0);
}

@end