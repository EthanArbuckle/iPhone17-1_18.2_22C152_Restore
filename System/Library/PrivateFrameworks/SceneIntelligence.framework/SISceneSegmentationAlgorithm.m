@interface SISceneSegmentationAlgorithm
+ (Class)inputDataClass;
+ (Class)outputDataClass;
- (SISceneSegmentationAlgorithm)initWithComputeEngine:(int64_t)a3 andNetworkConfiguration:(int64_t)a4 uncertaintyThreshold:(float)a5;
- (SISceneSegmentationAlgorithm)initWithNetworkConfiguration:(id)a3;
- (SISceneSegmentationNetworkConfiguration)configuration;
- (int64_t)_inferenceWithInput:(id)a3 output:(id)a4;
- (int64_t)_postprocessingOutput:(id)a3;
- (int64_t)_preprocessingInputData:(id)a3;
- (int64_t)runWithInput:(__CVBuffer *)a3 output:(__IOSurface *)a4 confidenceOutput:(__IOSurface *)a5 uncertaintyOutput:(__IOSurface *)a6 resampleOutput:(BOOL)a7 networkConfiguration:(int64_t)a8;
- (int64_t)switchConfiguration:(unint64_t)a3;
@end

@implementation SISceneSegmentationAlgorithm

+ (Class)outputDataClass
{
  return (Class)objc_opt_class();
}

+ (Class)inputDataClass
{
  return (Class)objc_opt_class();
}

- (SISceneSegmentationAlgorithm)initWithComputeEngine:(int64_t)a3 andNetworkConfiguration:(int64_t)a4 uncertaintyThreshold:(float)a5
{
  v9 = objc_alloc_init(SISceneSegmentationNetworkConfiguration);
  [(SINetworkConfiguration *)v9 setEngineType:a3];
  [(SISceneSegmentationNetworkConfiguration *)v9 setNetworkModeEnum:a4];
  [(SINetworkConfiguration *)v9 setRunByE5RT:1];
  *(float *)&double v10 = a5;
  [(SISceneSegmentationNetworkConfiguration *)v9 setUncertaintyThreshold:v10];
  [(SISceneSegmentationNetworkConfiguration *)v9 setModelConfig:1];
  v11 = [(SISceneSegmentationAlgorithm *)self initWithNetworkConfiguration:v9];

  return v11;
}

- (int64_t)runWithInput:(__CVBuffer *)a3 output:(__IOSurface *)a4 confidenceOutput:(__IOSurface *)a5 uncertaintyOutput:(__IOSurface *)a6 resampleOutput:(BOOL)a7 networkConfiguration:(int64_t)a8
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v14 = objc_alloc_init(SIImageInputData);
  [(SIImageInputData *)v14 setInputImageBuffer:a3];
  [(SIImageInputData *)v14 setInputDepthBuffer:0];
  CVPixelBufferRef texture = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferRef v19 = 0;
  if (CVPixelBufferCreateWithIOSurface(0, a4, 0, &pixelBufferOut))
  {
    v15 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneSegmentation/SISceneSegmentationAlgorithm.m";
      __int16 v24 = 1025;
      int v25 = 77;
LABEL_7:
      _os_log_impl(&dword_21B697000, v15, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to allocate temp buffer for semantic ***", buf, 0x12u);
    }
  }
  else if (CVPixelBufferCreateWithIOSurface(0, a5, 0, &texture))
  {
    v15 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneSegmentation/SISceneSegmentationAlgorithm.m";
      __int16 v24 = 1025;
      int v25 = 79;
      goto LABEL_7;
    }
  }
  else
  {
    if (!a6 || !CVPixelBufferCreateWithIOSurface(0, a6, 0, &v19))
    {
      v18 = [SISceneSegmentationData alloc];
      v15 = [(SISceneSegmentationData *)v18 initWithOutputSemanticBuffer:pixelBufferOut confidenceBuffer:texture uncertaintyBuffer:v19];
      CVPixelBufferRelease(pixelBufferOut);
      CVPixelBufferRelease(texture);
      CVPixelBufferRelease(v19);
      int64_t v16 = [(SIAlgorithm *)self runWithInput:v14 output:v15 resolutionConfiguration:a8];
      goto LABEL_9;
    }
    v15 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v23 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneSegmentation/SISceneSegmentationAlgorithm.m";
      __int16 v24 = 1025;
      int v25 = 82;
      goto LABEL_7;
    }
  }
  int64_t v16 = 4;
LABEL_9:

  return v16;
}

- (SISceneSegmentationAlgorithm)initWithNetworkConfiguration:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SISceneSegmentationAlgorithm;
  v6 = [(SIAlgorithm *)&v17 initWithNetworkConfiguration:v5];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [(SIAlgorithm *)v6 model];
    model = v7->_model;
    v7->_model = (SISceneSegmentation *)v8;

    objc_storeStrong((id *)&v7->_configuration, a3);
    double v10 = [SIScaler alloc];
    [(SISceneSegmentation *)v7->_model getInputResolution];
    uint64_t v11 = -[SIScaler initForOutputResolution:outputPixelFormat:mode:algorithmKey:](v10, "initForOutputResolution:outputPixelFormat:mode:algorithmKey:", 1111970369, 0, @"SceneSegmentation");
    scalerOne = v7->_scalerOne;
    v7->_scalerOne = (SIScaler *)v11;

    v13 = objc_alloc_init(SIImageInputData);
    inputData = v7->_inputData;
    v7->_inputData = v13;

    v15 = v7;
  }

  return v7;
}

- (int64_t)switchConfiguration:(unint64_t)a3
{
  id v5 = [(SIAlgorithm *)self networkConfiguration];
  uint64_t v6 = [v5 networkModeEnum];

  v13.receiver = self;
  v13.super_class = (Class)SISceneSegmentationAlgorithm;
  id v7 = [(SIAlgorithm *)&v13 switchConfiguration:a3];
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == a3;
  }
  if (!v8)
  {
    v9 = [SIScaler alloc];
    [(SISceneSegmentation *)self->_model getInputResolution];
    double v10 = -[SIScaler initForOutputResolution:outputPixelFormat:mode:algorithmKey:](v9, "initForOutputResolution:outputPixelFormat:mode:algorithmKey:", 1111970369, 0, @"SceneSegmentation");
    scalerOne = self->_scalerOne;
    self->_scalerOne = v10;
  }
  return (int64_t)v7;
}

- (int64_t)_preprocessingInputData:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v4 = -[SIScaler createScaledImage:](self->_scalerOne, "createScaledImage:", [a3 inputImageBuffer]);
  [(SIImageInputData *)self->_inputData setInputImageBuffer:v4];
  CVPixelBufferRelease(v4);
  if ([(SIImageInputData *)self->_inputData inputImageBuffer]) {
    return 0;
  }
  uint64_t v6 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136380931;
    BOOL v8 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneSegmentation/SISceneSegmentationAlgorithm.m";
    __int16 v9 = 1025;
    int v10 = 139;
    _os_log_impl(&dword_21B697000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to scale the input image ***", (uint8_t *)&v7, 0x12u);
  }

  return 1;
}

- (int64_t)_inferenceWithInput:(id)a3 output:(id)a4
{
  return [(SISceneSegmentation *)self->_model evaluateSemanticForImageData:self->_inputData output:a4];
}

- (int64_t)_postprocessingOutput:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int64_t v3 = [(SISceneSegmentation *)self->_model postprocessingOutput:a3];
  if (v3)
  {
    v4 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136380931;
      int v7 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneSegmentation/SISceneSegmentationAlgorithm.m";
      __int16 v8 = 1025;
      int v9 = 156;
      _os_log_impl(&dword_21B697000, v4, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to do postprocessing for SS result ***", (uint8_t *)&v6, 0x12u);
    }
  }
  return v3;
}

- (SISceneSegmentationNetworkConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_inputData, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_depthScaler, 0);
  objc_storeStrong((id *)&self->_scalerOne, 0);
}

@end