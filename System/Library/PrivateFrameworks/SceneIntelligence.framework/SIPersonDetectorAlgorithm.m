@interface SIPersonDetectorAlgorithm
+ (Class)inputDataClass;
+ (Class)outputDataClass;
- (SIPersonDetectorAlgorithm)initWithComputeEngine:(int64_t)a3 andNetworkConfiguration:(int64_t)a4;
- (SIPersonDetectorAlgorithm)initWithComputeEngine:(int64_t)a3 andNetworkConfiguration:(int64_t)a4 useE5RT:(BOOL)a5;
- (SIPersonDetectorAlgorithm)initWithNetworkConfiguration:(id)a3;
- (int64_t)_inferenceWithInput:(id)a3 output:(id)a4;
- (int64_t)_postprocessingOutput:(id)a3;
- (int64_t)_preprocessingInputData:(id)a3;
- (int64_t)switchConfiguration:(unint64_t)a3;
- (void)runWithInput:(__CVBuffer *)a3 output:(id)a4;
@end

@implementation SIPersonDetectorAlgorithm

+ (Class)outputDataClass
{
  return (Class)objc_opt_class();
}

+ (Class)inputDataClass
{
  return (Class)objc_opt_class();
}

- (SIPersonDetectorAlgorithm)initWithComputeEngine:(int64_t)a3 andNetworkConfiguration:(int64_t)a4
{
  return [(SIPersonDetectorAlgorithm *)self initWithComputeEngine:a3 andNetworkConfiguration:a4 useE5RT:1];
}

- (SIPersonDetectorAlgorithm)initWithComputeEngine:(int64_t)a3 andNetworkConfiguration:(int64_t)a4 useE5RT:(BOOL)a5
{
  BOOL v5 = a5;
  v9 = objc_alloc_init(SIPersonDetectorNetworkConfiguration);
  [(SINetworkConfiguration *)v9 setEngineType:a3];
  [(SIPersonDetectorNetworkConfiguration *)v9 setNetworkModeEnum:a4];
  [(SINetworkConfiguration *)v9 setRunByE5RT:v5];
  v10 = [(SIPersonDetectorAlgorithm *)self initWithNetworkConfiguration:v9];

  return v10;
}

- (void)runWithInput:(__CVBuffer *)a3 output:(id)a4
{
  id v6 = a4;
  v7 = objc_alloc_init(SIImageInputData);
  [(SIImageInputData *)v7 setInputImageBuffer:a3];
  v8 = objc_alloc_init(SIPersonDetectorData);
  [(SIPersonDetectorData *)v8 setBoundingBoxes:v6];

  v9.receiver = self;
  v9.super_class = (Class)SIPersonDetectorAlgorithm;
  [(SIAlgorithm *)&v9 runWithInput:v7 output:v8];
}

- (SIPersonDetectorAlgorithm)initWithNetworkConfiguration:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SIPersonDetectorAlgorithm;
  BOOL v5 = [(SIAlgorithm *)&v21 initWithNetworkConfiguration:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(SIAlgorithm *)v5 model];
    model = v6->_model;
    v6->_model = (SIPersonDetector *)v7;

    objc_super v9 = [SIScaler alloc];
    [(SIPersonDetector *)v6->_model getInputResolution];
    double v11 = v10;
    double v13 = v12;
    v14 = [v4 imageScalerIdentifier];
    uint64_t v15 = -[SIScaler initForOutputResolution:outputPixelFormat:mode:algorithmKey:](v9, "initForOutputResolution:outputPixelFormat:mode:algorithmKey:", 1111970369, 0, v14, v11, v13);
    scaler = v6->_scaler;
    v6->_scaler = (SIScaler *)v15;

    v17 = objc_alloc_init(SIImageInputData);
    inputData = v6->_inputData;
    v6->_inputData = v17;

    v19 = v6;
  }

  return v6;
}

- (int64_t)switchConfiguration:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SIPersonDetectorAlgorithm;
  return [(SIAlgorithm *)&v4 switchConfiguration:a3];
}

- (int64_t)_preprocessingInputData:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_super v4 = -[SIScaler createScaledImage:](self->_scaler, "createScaledImage:", [a3 inputImageBuffer]);
  [(SIImageInputData *)self->_inputData setInputImageBuffer:v4];
  CVPixelBufferRelease(v4);
  if ([(SIImageInputData *)self->_inputData inputImageBuffer]) {
    return 0;
  }
  id v6 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136380931;
    v8 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/PersonDetector/SIPersonDetectorAlgorithm.m";
    __int16 v9 = 1025;
    int v10 = 118;
    _os_log_impl(&dword_21B697000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to scale the input image or input depth ***", (uint8_t *)&v7, 0x12u);
  }

  return 1;
}

- (int64_t)_inferenceWithInput:(id)a3 output:(id)a4
{
  return [(SIPersonDetector *)self->_model evaluateForInput:self->_inputData output:a4];
}

- (int64_t)_postprocessingOutput:(id)a3
{
  return [(SIPersonDetector *)self->_model copyResultsToData:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputData, 0);
  objc_storeStrong((id *)&self->_scaler, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end