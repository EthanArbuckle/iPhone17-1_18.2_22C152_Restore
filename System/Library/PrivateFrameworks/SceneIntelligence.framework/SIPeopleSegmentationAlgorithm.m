@interface SIPeopleSegmentationAlgorithm
+ (Class)inputDataClass;
+ (Class)outputDataClass;
- (SIPeopleSegmentationAlgorithm)initWithComputeEngine:(int64_t)a3;
- (SIPeopleSegmentationAlgorithm)initWithComputeEngine:(int64_t)a3 andNetworkConfiguration:(int64_t)a4;
- (SIPeopleSegmentationAlgorithm)initWithComputeEngine:(int64_t)a3 andNetworkConfiguration:(int64_t)a4 useAppleNeuralEngineFramework:(BOOL)a5;
- (SIPeopleSegmentationAlgorithm)initWithInputResolution:(CGSize)a3;
- (SIPeopleSegmentationAlgorithm)initWithNetworkConfiguration:(id)a3;
- (int64_t)_inferenceWithInput:(id)a3 output:(id)a4;
- (int64_t)_postprocessingOutput:(id)a3;
- (int64_t)_preprocessingInputData:(id)a3;
- (int64_t)runWithInput:(__CVBuffer *)a3 output:(__IOSurface *)a4;
- (int64_t)runWithInput:(__CVBuffer *)a3 output:(__IOSurface *)a4 networkConfiguration:(int64_t)a5;
- (int64_t)switchConfiguration:(unint64_t)a3;
- (void)setSnapEveryFrameCount:(unsigned __int8)a3;
@end

@implementation SIPeopleSegmentationAlgorithm

- (SIPeopleSegmentationAlgorithm)initWithInputResolution:(CGSize)a3
{
  v3 = [(SIPeopleSegmentationAlgorithm *)self initWithComputeEngine:SISupportANE() andNetworkConfiguration:0];

  return v3;
}

- (SIPeopleSegmentationAlgorithm)initWithComputeEngine:(int64_t)a3
{
  return [(SIPeopleSegmentationAlgorithm *)self initWithComputeEngine:a3 andNetworkConfiguration:0];
}

- (SIPeopleSegmentationAlgorithm)initWithComputeEngine:(int64_t)a3 andNetworkConfiguration:(int64_t)a4
{
  return [(SIPeopleSegmentationAlgorithm *)self initWithComputeEngine:a3 andNetworkConfiguration:a4 useAppleNeuralEngineFramework:0];
}

- (SIPeopleSegmentationAlgorithm)initWithComputeEngine:(int64_t)a3 andNetworkConfiguration:(int64_t)a4 useAppleNeuralEngineFramework:(BOOL)a5
{
  v8 = objc_alloc_init(SIPeopleSegmentationNetworkConfiguration);
  [(SINetworkConfiguration *)v8 setEngineType:a3];
  [(SIPeopleSegmentationNetworkConfiguration *)v8 setNetworkModeEnum:a4];
  [(SINetworkConfiguration *)v8 setRunByE5RT:1];
  v9 = [(SIPeopleSegmentationAlgorithm *)self initWithNetworkConfiguration:v8];

  return v9;
}

- (int64_t)runWithInput:(__CVBuffer *)a3 output:(__IOSurface *)a4
{
  v7 = objc_alloc_init(SIImageInputData);
  [(SIImageInputData *)v7 setInputImageBuffer:a3];
  v8 = objc_alloc_init(SIPeopleSegmentationData);
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferCreateWithIOSurface(0, a4, 0, &pixelBufferOut);
  [(SIPeopleSegmentationData *)v8 setSegmentation:CVPixelBufferRetain(pixelBufferOut)];
  v11.receiver = self;
  v11.super_class = (Class)SIPeopleSegmentationAlgorithm;
  id v9 = [(SIAlgorithm *)&v11 runWithInput:v7 output:v8];

  return (int64_t)v9;
}

- (int64_t)runWithInput:(__CVBuffer *)a3 output:(__IOSurface *)a4 networkConfiguration:(int64_t)a5
{
  int64_t result = [(SIPeopleSegmentationAlgorithm *)self switchConfiguration:a5];
  if (!result)
  {
    return [(SIPeopleSegmentationAlgorithm *)self runWithInput:a3 output:a4];
  }
  return result;
}

- (void)setSnapEveryFrameCount:(unsigned __int8)a3
{
}

+ (Class)outputDataClass
{
  return (Class)objc_opt_class();
}

+ (Class)inputDataClass
{
  return (Class)objc_opt_class();
}

- (SIPeopleSegmentationAlgorithm)initWithNetworkConfiguration:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SIPeopleSegmentationAlgorithm;
  v5 = [(SIAlgorithm *)&v22 initWithNetworkConfiguration:v4];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(SIAlgorithm *)v5 model];
    model = v6->_model;
    v6->_model = (SIPeopleSegmentation *)v7;

    id v9 = [SIScaler alloc];
    [(SIPeopleSegmentation *)v6->_model getInputResolution];
    double v11 = v10;
    double v13 = v12;
    uint64_t v14 = [v4 inputImageFormat];
    v15 = [v4 imageScalerIdentifier];
    uint64_t v16 = -[SIScaler initForOutputResolution:outputPixelFormat:mode:algorithmKey:](v9, "initForOutputResolution:outputPixelFormat:mode:algorithmKey:", v14, 0, v15, v11, v13);
    scaler = v6->_scaler;
    v6->_scaler = (SIScaler *)v16;

    v18 = objc_alloc_init(SIImageInputData);
    inputData = v6->_inputData;
    v6->_inputData = v18;

    v20 = v6;
  }

  return v6;
}

- (int64_t)switchConfiguration:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v5 = [(SIAlgorithm *)self networkConfiguration];
  uint64_t v6 = [v5 networkModeEnum];
  if ([(SIPeopleSegmentation *)self->_model switchNetworkConfiguration:a3])
  {
    uint64_t v7 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136380931;
      v20 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PeopleSegmentation/SIPeopleSegmentationAlgorithm.m";
      __int16 v21 = 1025;
      int v22 = 135;
      _os_log_impl(&dword_21B697000, v7, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** fail to switch the configuration! The output is not updated ***", (uint8_t *)&v19, 0x12u);
    }

    int64_t v8 = 5;
  }
  else
  {
    if (v6 != a3)
    {
      id v9 = [SIScaler alloc];
      [(SIPeopleSegmentation *)self->_model getInputResolution];
      double v11 = v10;
      double v13 = v12;
      uint64_t v14 = [v5 inputImageFormat];
      v15 = [v5 imageScalerIdentifier];
      uint64_t v16 = -[SIScaler initForOutputResolution:outputPixelFormat:mode:algorithmKey:](v9, "initForOutputResolution:outputPixelFormat:mode:algorithmKey:", v14, 0, v15, v11, v13);
      scaler = self->_scaler;
      self->_scaler = v16;
    }
    int64_t v8 = 0;
  }

  return v8;
}

- (int64_t)_preprocessingInputData:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = -[SIScaler createScaledImage:](self->_scaler, "createScaledImage:", [a3 inputImageBuffer]);
  [(SIImageInputData *)self->_inputData setInputImageBuffer:v4];
  CVPixelBufferRelease(v4);
  if ([(SIImageInputData *)self->_inputData inputImageBuffer]) {
    return 0;
  }
  uint64_t v6 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136380931;
    int64_t v8 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PeopleSegmentation/SIPeopleSegmentationAlgorithm.m";
    __int16 v9 = 1025;
    int v10 = 154;
    _os_log_impl(&dword_21B697000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to scale the input image or input depth ***", (uint8_t *)&v7, 0x12u);
  }

  return 1;
}

- (int64_t)_inferenceWithInput:(id)a3 output:(id)a4
{
  return [(SIPeopleSegmentation *)self->_model evaluateForInput:self->_inputData output:a4];
}

- (int64_t)_postprocessingOutput:(id)a3
{
  return [(SIPeopleSegmentation *)self->_model copyResultsToData:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputData, 0);
  objc_storeStrong((id *)&self->_scaler, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end